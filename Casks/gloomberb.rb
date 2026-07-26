cask "gloomberb" do
  version "0.10.1"
  sha256 "49a40fcd99f9a3c4456d98b8e955eea1981ca5a609379f194cfd4e24f0e14a85"

  url "https://github.com/vincelwt/gloomberb/releases/download/v#{version}/stable-macos-arm64-Gloomberb.app.zip",
      verified: "github.com/vincelwt/gloomberb/"
  name "Gloomberb"
  desc "Open-source finance terminal"
  homepage "https://gloomberb.com"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "Gloomberb.app"
  binary "#{appdir}/Gloomberb.app/Contents/Resources/gloomberb", target: "gloomberb"

  uninstall quit: "com.vincelwt.gloomberb"

  zap trash: "~/.gloomberb"
end
