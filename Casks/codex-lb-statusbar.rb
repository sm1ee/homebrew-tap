cask "codex-lb-statusbar" do
  version "0.4.2"
  sha256 "da7654b7cca018260c3249b79365fd64d9cda88d920794fe7f21f052ceece960"

  url "https://github.com/sm1ee/codex-lb-statusbar/releases/download/v#{version}/CodexLBStatusBar-#{version}.dmg"
  name "Codex LB Status Bar"
  desc "Menu bar app for Codex LB account quota and controls"
  homepage "https://github.com/sm1ee/codex-lb-statusbar"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app updates itself from GitHub Releases.
  auto_updates true
  depends_on macos: :ventura

  app "CodexLBStatusBar.app"

  zap trash: "~/Library/Preferences/local.codex-lb.statusbar.plist"

  caveats <<~EOS
    Codex LB Status Bar is ad-hoc signed, not notarized. On first launch macOS may block it:
    open System Settings > Privacy & Security and click "Open Anyway".
  EOS
end
