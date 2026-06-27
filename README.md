# Showpoint Homebrew Tap

Homebrew cask for [Showpoint](https://github.com/oleksii-stepanenko/showpoint) — a
macOS menu-bar presenter tool (cursor highlight, keystroke overlay, screen annotation).

## Install

```sh
brew install --cask oleksii-stepanenko/tap/showpoint
```

(That's shorthand for tapping `oleksii-stepanenko/homebrew-tap` and installing the
`showpoint` cask.)

## First launch

Showpoint is signed with a self-signed certificate and is **not notarized by Apple**, so
the first time you open it macOS will say it "cannot be checked for malicious software":

1. Open **System Settings → Privacy & Security**
2. Scroll to **Security** and click **Open Anyway** next to Showpoint
3. Confirm with Touch ID or your password

You'll grant **Accessibility** once (System Settings → Privacy & Security → Accessibility).
Thanks to the stable signature, that grant survives future updates — only the "Open Anyway"
step recurs after an upgrade.

## Update / uninstall

```sh
brew upgrade --cask showpoint
brew uninstall --cask showpoint        # add --zap to also remove preferences
```
