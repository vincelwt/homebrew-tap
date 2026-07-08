cask "gloomberb" do
  version "0.9.8"
  sha256 "9538f821798075fa1929d3ab7652dc74a3b7d801316c7ad06548908b1984b5b0"

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
