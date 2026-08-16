---
name: autonomous-signup
description: Use for browser signup, login, and provisioning on Windows.
version: 1.0.0
author: Hermes Agent
license: MIT
tags: [browser, chrome, windows, automation, signup, login]
metadata:
  hermes:
    tags: [browser, chrome, windows, automation, signup]
    homepage: https://hermes-agent.nousresearch.com/docs
---

# Autonomous Signup

Browser automation for account creation, login, and resource provisioning
on Windows. Designed for agentic workflows where a sub-agent owns a
dedicated identity (email + GitHub) and must leave a reviewable trail.

## 1. Trigger Conditions

- User asks the agent to create accounts, sign up for services, or
  provision resources via web UIs.
- Agent needs to log into GitHub, Discord, or API provider dashboards.
- Workflow requires persistent credentials, screenshots as evidence, or
  human-in-the-loop review before finalizing.

## 2. Identity & Vault

Every autonomous agent must have a persistent identity file:

- **Vault path**: `D:\Hermes\agency\vault\agent-identity.env`
- **Format**: KEY=VALUE lines. Never commit this file.
- **Required fields**:
  - `AGENT_EMAIL` — dedicated email for the agent
  - `AGENT_GITHUB_USERNAME` — GitHub username
  - `AGENT_GITHUB_PAT` — personal access token with repo scope
  - `DISCORD_BOT_TOKEN` — optional, if provisioning Discord bots
  - `PROVIDER_API_KEY_*` — optional per provider

```env
AGENT_EMAIL=agent@example.com
AGENT_GITHUB_USERNAME=agent-github
AGENT_GITHUB_PAT=ghp_...
DISCORD_BOT_TOKEN=...
PROVIDER_API_KEY_OPENROUTER=...
```

**Rules**:
- Read vault with `read_file`, never echo contents to chat.
- If a required key is missing, stop and report the exact missing field.
- Rotate keys on a schedule; document rotation timestamps in the vault.

## 3. Browser Automation Workflow

### 3.1 Preferred backend on Windows: Playwright headless

On this host, Playwright headless Chromium is the reliable path. Use it
as the **first choice** for signup/login flows.

**Minimal pattern:**
```python
from playwright.sync_api import sync_playwright
from pathlib import Path

vault = Path('D:/Hermes/agency/vault/agent-identity.env')
email = next(line.split('=',1)[1].strip() for line in vault.read_text().splitlines() if line.startswith('AGENT_EMAIL='))
out = Path('D:/Hermes/agency/evidence')
out.mkdir(parents=True, exist_ok=True)

with sync_playwright() as p:
    browser = p.chromium.launch(headless=True)
    ctx = browser.new_context(viewport={'width': 1280, 'height': 800})
    page = ctx.new_page()
    page.goto('https://example.com/signup', wait_until='networkidle', timeout=60000)
    page.screenshot(path=str(out / 'example-signup-1.png'), full_page=False)

    # Optional cookie banner dismiss
    for txt in ['Accept All', 'Accept', 'Agree', 'OK']:
        try:
            page.click(f"button:has-text('{txt}')", timeout=3000)
            page.screenshot(path=str(out / 'example-signup-2.png'), full_page=False)
            break
        except Exception:
            pass

    # Fill email
    page.locator('input[type="email"], input[name="email"], input#email, input[placeholder*="email" i]').first.fill(email)
    page.screenshot(path=str(out / 'example-signup-3.png'), full_page=False)

    # Click primary action if present
    for txt in ['Continue with email', 'Sign up', 'Continue', 'Next']:
        try:
            page.click(f"button:has-text('{txt}')", timeout=5000)
            page.wait_for_load_state('networkidle', timeout=60000)
            page.screenshot(path=str(out / 'example-signup-4.png'), full_page=False)
            break
        except Exception:
            continue

    browser.close()
```

**Rules**:
- Save every meaningful state as a screenshot in `D:\Hermes\agency\evidence\`.
- Use vision analysis on screenshots when needed.
- Do not bypass CAPTCHA, SMS, or email verification silently.
- Stop and report at every human checkpoint.

### 3.2 Fallback backend: Windows Chrome via computer_use

Only use when Playwright is unavailable or provider explicitly requires
a logged-in Chrome session.

**Resume-first rule**: if Chrome was restarted after a power cut or crash,
call `list_windows(pid=<latest pid>)` and use the returned `window_id` for
all subsequent captures/clicks. Do not reuse old window handles.

1. **Focus Chrome**: `focus_app(app='Google Chrome', delivery_mode='background')`
2. **Capture state**: `capture(mode='som')` to discover elements
3. **Navigate**: click address bar, type URL, press Enter
4. **Fill forms**: click field by element index, then type
5. **Handle CAPTCHA**: stop and report. Do not solve CAPTCHA silently.
6. **Submit**: click submit button, wait for navigation
7. **Verify**: capture fresh state and confirm success by visible text
8. **Evidence**: save screenshot path and page text to the report

#### 3.2.1 Foreground vs Background
- **Background input** is preferred but often dropped for text fields
  on Windows Chrome. If `type` returns `background_unavailable`,
  retry with `delivery_mode='foreground'`.
- **Foreground** briefly raises Chrome; restore is automatic.
- If foreground is rejected by Windows foreground-lock, call
  `focus_app` first, then retry foreground.

#### 3.2.2 Stale-Element Recovery
- After navigation, modal close, or failed click, element indices often
  become invalid. **Always re-capture** before retrying the same action.
- Use `capture(mode='som')` to refresh the element cache.
- Do not retry a stale element index without a fresh capture.

#### 3.2.3 Keyboard-First Form Navigation
- For radio buttons, checkboxes, or preset selectors that ignore clicks:
  tab to the control and use `key('space')`.
- For long forms: tab order is usually more reliable than blind clicking.
- For permission trees: use clipboard-paste search filtering, then Space
  to toggle checkboxes.

#### 3.2.4 Long Form Paste
If typing truncates or queues, use the clipboard pattern:

```powershell
powershell -Command "Set-Clipboard -Value 'text'"
```

Then focus input, `ctrl+a`, `ctrl+v`, send once, and verify.

#### 3.2.5 Misclick Recovery
- If a click opens an unrelated page, use `browser_back` or the Chrome
  back button to return.
- Do not restart the entire flow; recover in-place.
- Re-capture after back navigation to refresh stale elements.

#### 3.2.6 Dangerous Modal Cancellation
- If a modal asks "Select all permissions?" or similar bulk-grant prompt,
  cancel it immediately.
- Over-scoping breaks least-privilege and may void provider terms.

## 4. GitHub Flows

### 4.1 Create Repository

1. Navigate to `github.com/new`
2. Fill repository name/description
3. Select Public/Private
4. Do NOT initialize with README unless requested
5. Create repo
6. Verify by reading repo page: `api.github.com/repos/{owner}/{repo}`

### 4.2 Push Skills / Runbooks

```bash
git clone https://github.com/{AGENT_GITHUB_USERNAME}/{repo}.git
cp -r skills/* {repo}/
cd {repo}
git add .
git commit -m "chore: add skills and runbooks"
git push
```

Always use the vault PAT. Never hardcode credentials in scripts.

## 5. Discord Flows

### 5.1 Developer Portal (Bot Creation)

1. Navigate to `discord.com/developers/applications`
2. Login with agent email if needed
3. Create application → Bot → Copy token to vault
4. Enable required intents
5. Capture token page as evidence

### 5.2 Server Creation (Human Checkpoint Required)

Discord server creation via web UI is possible but requires manual
verification. **Always stop after creation and ask the user to add
the agent before inviting members.**

Steps:
1. Navigate to `discord.com/channels`
2. Click "+" to create server
3. Choose "For me and friends"
4. Fill server name
5. Create
6. Capture screenshot as evidence
7. **STOP. Do not invite users. Report to user for review.**

## 6. Generic API Provider Signup

For services like OpenRouter, RapidAPI, etc.:

1. Search for the provider's signup page
2. Fill email from vault
3. Handle email verification: check inbox, click link
4. Navigate to API keys page
5. Create key
6. Store key in vault with provider prefix
7. Capture dashboard screenshot showing key status

**Anti-patterns**:
- Do not bypass SMS verification.
- Do not create multiple accounts to evade rate limits.
- Do not use disposable email addresses unless explicitly requested.

## 7. Human Checkpoints

Always stop for review after:
- Creating any account with billing implications
- Generating API keys
- Creating Discord servers or bots
- Accepting Terms of Service on behalf of the user

Report format:
```
[CREATED] Resource: <type>
URL: <url>
Evidence: <screenshot_path>
Status: <active/pending_verification>
Next: <what user should do>
```

## 8. Failure Recovery

- **CAPTCHA encountered**: stop, report, ask user to solve.
- **Email verification required**: report inbox to check, resume after user confirms.
- **Rate limited**: wait 60s, retry once, then pivot to alternative provider.
- **Foreground lock**: focus_app then retry foreground; if still blocked, ask user to bring Chrome forward briefly.
- **Playwright install missing**: run `python -m pip install playwright && python -m playwright install chromium`

## 9. Security Rules

- Never log credentials to chat.
- Never push vault file to any remote.
- Rotate PAT tokens quarterly.
- Use provider-specific scopes, never full admin unless required.
- Store all evidence screenshots in `D:\Hermes\agency\evidence\`.

## 10. Verification Checklist

Before declaring any flow complete:
- [ ] Vault updated with new credentials
- [ ] Screenshot saved to evidence folder
- [ ] Resource URL confirmed accessible
- [ ] User notified for review if checkpoint required
- [ ] No secrets leaked in chat output

## 11. Related Tools

- `vercel-labs/agent-browser` — cross-platform browser automation CLI for AI agents.
  Use it as a fallback when Windows Chrome background typing is unavailable or when
  headless/remote execution is required.
- Playwright — primary backend on Windows for headless signup/login flows.
