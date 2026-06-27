cask "showpoint" do
  version "0.1.4"
  sha256 "9709f4bc1e64281cc99ce28ec39b22041447daeaf1b12068e69f04cad1e4e2bd"

  url "https://github.com/oleksii-stepanenko/showpoint/releases/download/v#{version}/Showpoint.dmg"
  name "Showpoint"
  desc "Menu-bar presenter: cursor highlight, keystroke overlay, and screen annotation"
  homepage "https://github.com/oleksii-stepanenko/showpoint"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Showpoint.app"

  zap trash: [
    "~/Library/Preferences/io.stepanenko.Showpoint.plist",
    "~/Library/Saved Application State/io.stepanenko.Showpoint.savedState",
  ]

  caveats <<~EOS
    Showpoint is signed with a self-signed certificate (it is not notarized by
    Apple), so the first time you launch it macOS says it "cannot be opened
    because Apple cannot check it for malicious software". To allow it:

      1. Open  System Settings -> Privacy & Security
      2. Scroll to Security and click "Open Anyway" next to Showpoint
      3. Confirm with Touch ID or your password

    This step reappears after each update. Showpoint then asks for Accessibility
    (System Settings -> Privacy & Security -> Accessibility) - grant it once; thanks
    to the stable signature, that permission survives future updates.
  EOS
end
