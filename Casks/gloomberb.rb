cask "gloomberb" do
  version "0.18.4"
  sha256 "c85c171dcfc8177383a3b18b7dc20e5ea8dbb196d3548ca1abd73d41b2d64189"

  # No `verified:` here: Homebrew checks a GitHub release URL against the
  # homepage on its own now and warns that the parameter is deprecated (#916).
  url "https://github.com/gloom-sh/gloomberb/releases/download/v#{version}/stable-macos-arm64-Gloomberb.app.zip"
  name "Gloom"
  desc "Open-source finance terminal"
  homepage "https://gloom.sh"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  # The published app bundle is Apple Silicon only. Without this, Homebrew
  # installs an app on Intel Macs that dies with "Bad CPU type in executable".
  depends_on arch: :arm64

  # The app keeps its bundle name: its updater finds the new build by it.
  app "Gloomberb.app"
  binary "#{appdir}/Gloomberb.app/Contents/Resources/gloom", target: "gloom"
  # The command's name before 0.19, kept for scripts and habits.
  binary "#{appdir}/Gloomberb.app/Contents/Resources/gloomberb", target: "gloomberb"

  uninstall quit: "com.vincelwt.gloomberb"

  zap trash: "~/.gloomberb"
end
