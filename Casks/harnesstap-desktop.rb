cask "harnesstap-desktop" do
  arch arm: "aarch64", intel: "x64"

  version "1.6.2"
  sha256 arm:   "5098ccc94229deb04aa6eca71bbf74ebc08101c49d07eac573f6f7bb5812aa32",
         intel: "af853c0259529174cce65a218b24102bf2f0bf5cdb76beb4d08a764a0685b066"

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
