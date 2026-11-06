cask "gloomberb" do
  version "0.20.2"
  sha256 "f5f409315374103e04f80674340c29d96433c60c6c75fb6112c4dcfbaaf2c208"

  # No `verified:` here: Homebrew checks a GitHub release URL against the
  # homepage on its own now and warns that the parameter is deprecated (#916).
  url "https://github.com/gloom-sh/gloomberb/releases/download/v#{version}/stable-macos-arm64-Gloom.app.zip"
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

  # Gloomberb.app before the rename. An upgrade from such a version removes
  # it and installs this; the app leaves a Homebrew copy to Homebrew.
  app "Gloom.app"
  binary "#{appdir}/Gloom.app/Contents/Resources/gloom", target: "gloom"
  # The command's name before 0.18.4, kept for scripts and habits.
  binary "#{appdir}/Gloom.app/Contents/Resources/gloomberb", target: "gloomberb"

  # Quits the app under either of its bundle identifiers, whichever the
  # installed copy carries.
  uninstall quit: ["com.vincelwt.gloomberb", "sh.gloom.desktop"]

  zap trash: "~/.gloomberb"
end
