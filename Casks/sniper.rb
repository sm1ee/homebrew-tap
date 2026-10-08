cask "sniper" do
  version "0.2.13"
  sha256 "6755f20855a86ea1ad71f4b0b297e6fa5d0606705c885f23ff14dc47786c7d16"

  url "https://github.com/sm1ee/Sniper/releases/download/v#{version}/Sniper-#{version}-universal.dmg"
  name "Sniper"
  desc "Intercepting web proxy for security testing"
  homepage "https://github.com/sm1ee/Sniper"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app updates itself from GitHub Releases.
  auto_updates true
  depends_on macos: :monterey

  app "Sniper.app"
  binary "#{appdir}/Sniper.app/Contents/MacOS/sniper-cli"

  zap trash: [
    "~/.sniper",
    "~/Library/Preferences/com.sm1ee.sniper.plist",
  ]

  caveats <<~EOS
    Sniper is ad-hoc signed, not notarized. On first launch macOS may block it, or
    sniper-cli: open System Settings > Privacy & Security and click "Open Anyway".

    sniper-cli is on your PATH. To let Claude Code and Codex drive Sniper:
      sniper-cli skills install --all --dry-run
      sniper-cli skills install --all --yes
  EOS
end
