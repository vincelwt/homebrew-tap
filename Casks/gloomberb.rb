cask "gloomberb" do
  version "0.14.0"
  sha256 "698c2f8a4589c09d14370431f3c2b83eaa47c65b260bd9ffbad730c8ce6d988e"

  url "https://github.com/gloom-sh/gloomberb/releases/download/v#{version}/stable-macos-arm64-Gloomberb.app.zip",
      verified: "github.com/gloom-sh/gloomberb/"
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
