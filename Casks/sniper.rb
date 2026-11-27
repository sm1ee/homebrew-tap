cask "sniper" do
  version "0.4.1"
  sha256 "4f2fcd7f4aa1be27625b45930eba2deca81f7f663fa1dbe8b6f9144852f773d5"

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
  binary "#{appdir}/Sniper.app/Contents/MacOS/sniper-server"

  zap trash: [
    "~/.sniper",
    "~/Library/Preferences/com.sm1ee.sniper.plist",
  ]

  caveats <<~EOS
    Sniper is ad-hoc signed, not notarized. On first launch macOS may block it, or
    sniper-cli: open System Settings > Privacy & Security and click "Open Anyway".

    sniper-server runs Sniper without a window.

    sniper-cli is on your PATH. To let Claude Code and Codex drive Sniper:
      sniper-cli skills install --all --dry-run
      sniper-cli skills install --all --yes
  EOS
end
