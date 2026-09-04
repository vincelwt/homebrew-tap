cask "gloomberb" do
  version "0.13.1"
  sha256 "86cfefc3c31eed734fdcab27c6f8c093e4ca99d9263d49ecc239c609ca3eed39"

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

  app "Gloomberb.app"
  binary "#{appdir}/Gloomberb.app/Contents/Resources/gloomberb", target: "gloomberb"

  uninstall quit: "com.vincelwt.gloomberb"

  zap trash: "~/.gloomberb"
end
