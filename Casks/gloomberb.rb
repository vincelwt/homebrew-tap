cask "gloomberb" do
  version "0.10.5"
  sha256 "ed35223803741131a232780549d3a1a6238e9443bdf41be8f13d35faa726d103"

  url "https://github.com/gloom-sh/gloomberb/releases/download/v#{version}/stable-macos-arm64-Gloomberb.app.zip",
      verified: "github.com/gloom-sh/gloomberb/"
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
