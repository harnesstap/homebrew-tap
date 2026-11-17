cask "harnesstap-desktop" do
  arch arm: "aarch64", intel: "x64"

  version "1.6.3"
  sha256 arm:   "84b66a6310590d2dd04b1d6318b747cc261fad1f9bd2095b98abc9369435fa20",
         intel: "9c5297f9ea63327691dc2173c3b8b967d26325cefb675ccc7efb48e4ac23c66d"

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
