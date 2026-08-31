cask "home-cellar" do
  version "1.8.4"
  sha256 "1452cc419b8c8b056932d53e7a128d42b59fdedc0ce6c6e432e8ca920abe9b03"

  url "https://github.com/juancasanueva/SWIFTUI_cellar/releases/download/v#{version}/Home-Cellar-#{version}.zip"
  name "Home-Cellar"
  name "Cellar"
  desc "Native GUI for the Homebrew package manager"
  homepage "https://github.com/juancasanueva/SWIFTUI_cellar"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sequoia
  depends_on arch: :arm64

  app "Home-Cellar.app"

  zap trash: [
    "~/Library/Application Support/com.juancasanueva.cellar",
    "~/Library/Caches/Cellar",
    "~/Library/Caches/com.juancasanueva.cellar",
    "~/Library/HTTPStorages/com.juancasanueva.cellar",
    "~/Library/Preferences/com.juancasanueva.cellar.plist",
  ]
end
