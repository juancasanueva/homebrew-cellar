cask "home-cellar" do
  version "1.7.4"
  sha256 "ddadcc0eeaba8ee588f966832c4b72e32664b3ed6b01159f782a2f47116f1b21"

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
