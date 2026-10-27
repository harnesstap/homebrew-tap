cask "harnesstap-desktop" do
  arch arm: "aarch64", intel: "x64"

  version "1.6.1"
  sha256 arm:   "4a85155e9409750120297ab790075789dd19726619290aab05c75c8739d5dd08",
         intel: "7dd3507b2bdb6070c6e63dee10b105a61f033e66d6d84815c7695d51c19c1313"

  url "https://github.com/harnesstap/harnesstap/releases/download/v#{version}/HarnessTap_#{version}_#{arch}.dmg"
  name "HarnessTap"
  desc "Desktop app for the HarnessTap agent harness configuration toolkit"
  homepage "https://harnesstap.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "HarnessTap.app"

  zap trash: [
    "~/Library/Application Support/dev.harnesstap.desktop",
    "~/Library/Caches/dev.harnesstap.desktop",
    "~/Library/Preferences/dev.harnesstap.desktop.plist",
    "~/Library/Saved Application State/dev.harnesstap.desktop.savedState",
    "~/Library/WebKit/dev.harnesstap.desktop",
  ]

  caveats <<~EOS
    HarnessTap Desktop is not notarized by Apple yet. The first launch is blocked by
    Gatekeeper: open System Settings > Privacy & Security and click "Open Anyway".

    Your library in ~/.harnesstap is shared with the CLI and is kept by "brew uninstall --zap".
  EOS
end
