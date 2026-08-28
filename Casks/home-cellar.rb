cask "home-cellar" do
  version "1.7.3"
  sha256 "e7da51627ec0ccd9a35284e7f5bd9ad6c8775d67e059c910f5522d05eb837d9e"

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
  depends_on macos: :tahoe
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
