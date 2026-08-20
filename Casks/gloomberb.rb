cask "gloomberb" do
  version "0.11.0"
  sha256 "c07bbe195144e758d014cae86d637122b0c12b2152f6f2b7944c9e7d6750030f"

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
