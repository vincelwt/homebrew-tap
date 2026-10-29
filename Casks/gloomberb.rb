cask "gloomberb" do
  version "0.19.2"
  sha256 "9fc875fd2104616aad79dbff4bc9179705ad34795f372db77908ef59a99b7de0"

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
