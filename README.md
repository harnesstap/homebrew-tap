# harnesstap/homebrew-tap

Homebrew formula and cask for [HarnessTap](https://harnesstap.com), the agent harness configuration toolkit for Claude Code, Codex, Cursor and other coding CLIs.

## Install

CLI (macOS and Linux):

```bash
brew install harnesstap/tap/harnesstap
```

Desktop (macOS):

```bash
brew install --cask harnesstap/tap/harnesstap-desktop
```

Using the full `harnesstap/tap/...` name trusts just that formula or cask. To use the short names (`brew install harnesstap`), run `brew trust harnesstap/tap` once.

Upgrade with `brew upgrade harnesstap` or `brew upgrade --cask harnesstap-desktop`.

## Desktop and Gatekeeper

HarnessTap Desktop is not yet signed with an Apple Developer ID or notarized. The DMG is ad-hoc signed, so macOS blocks the first launch. Open **System Settings > Privacy & Security** and click **Open Anyway** once. The cask does not remove the quarantine attribute for you.

## How this tap is updated

Do not edit `Formula/harnesstap.rb` or `Casks/harnesstap-desktop.rb` by hand. The [Release workflow](https://github.com/harnesstap/harnesstap/blob/main/.github/workflows/homebrew-tap.yml) in harnesstap/harnesstap renders both files from each published release (npm tarball sha256, DMG sha256s from the GitHub release) and pushes them here. CI in this repo runs `brew style`, `brew audit --strict --online`, a formula install and `brew test` on macOS and Linux, and a cask install on Apple Silicon and Intel macOS.

## Issues

Report problems at [harnesstap/harnesstap issues](https://github.com/harnesstap/harnesstap/issues).
