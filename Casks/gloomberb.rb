cask "gloomberb" do
  version "0.9.10"
  sha256 "2e2d702cff1a5d7cebb3bad5645e538910341d544c4c8907b0e694c462f6ea4c"

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
