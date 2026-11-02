cask "pr-nexus" do
  version "0.1.2"
  sha256 "b0665c82c2569c2d5516de1bb1111d703c11146c9f7aff7e1269525e9f4ab522"

  url "https://github.com/harnesstap/pr-nexus/releases/download/v#{version}/PR-Nexus_#{version}_aarch64.dmg"
  name "PR Nexus"
  desc "Track open GitHub pull requests by project and request reviews on Slack"
  homepage "https://github.com/harnesstap/pr-nexus"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  app "PR Nexus.app"

  zap trash: [
    "~/Library/Application Support/dev.pr-nexus",
    "~/Library/Caches/dev.pr-nexus",
    "~/Library/Logs/dev.pr-nexus",
    "~/Library/Preferences/dev.pr-nexus.plist",
    "~/Library/Saved Application State/dev.pr-nexus.savedState",
    "~/Library/WebKit/dev.pr-nexus",
  ]

  caveats <<~EOS
    PR Nexus is not notarized by Apple yet. The first launch is blocked by
    Gatekeeper: open System Settings > Privacy & Security and click "Open Anyway".

    Each new version asks once for the keychain item "dev.pr-nexus"; choose "Always Allow".
  EOS
end
