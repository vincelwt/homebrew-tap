cask "gloomberb" do
  version "0.15.6"
  sha256 "a2b2eb165382f7d680b66f27e776b19df8094613fbe0e9932c24a90630dcd977"

  # No `verified:` here: Homebrew checks a GitHub release URL against the
  # homepage on its own now and warns that the parameter is deprecated (#916).
  url "https://github.com/gloom-sh/gloomberb/releases/download/v#{version}/stable-macos-arm64-Gloomberb.app.zip"
  name "Gloomberb"
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

  app "Gloomberb.app"
  binary "#{appdir}/Gloomberb.app/Contents/Resources/gloomberb", target: "gloomberb"

  uninstall quit: "com.vincelwt.gloomberb"

  zap trash: "~/.gloomberb"
end
