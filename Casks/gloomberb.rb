cask "gloomberb" do
  version "0.16.3"
  sha256 "4b653679e0464d72dbe7d6ba2f031705bbf450be0331f46d7b272e36b2743b1d"

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
