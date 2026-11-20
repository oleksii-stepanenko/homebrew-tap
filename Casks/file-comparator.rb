cask "file-comparator" do
  version "1.0.0"
  sha256 "8ea250494a537bcb2310c4154f8392d816833d14d058ceb8640c47d9777214bc"

  url "https://github.com/oleksii-stepanenko/file-comparator/releases/download/v#{version}/FileComparator.dmg"
  name "FileComparator"
  desc "Compare and merge files and folders, two-way or three-way"
  homepage "https://github.com/oleksii-stepanenko/file-comparator"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "FileComparator.app"
  binary "#{appdir}/FileComparator.app/Contents/Resources/fcompare"

  zap trash: [
    "~/Library/Preferences/dev.filecomparator.app.plist",
    "~/Library/Saved Application State/dev.filecomparator.app.savedState",
  ]

  caveats <<~EOS
    FileComparator is not notarized by Apple, so the first time you open it
    macOS says it "cannot be opened because Apple cannot check it for
    malicious software". To allow it:

      1. Open  System Settings -> Privacy & Security
      2. Scroll to Security and click "Open Anyway" next to FileComparator
      3. Confirm with Touch ID or your password

    This step reappears after each update.

    The `fcompare` command is installed too:
      fcompare left.txt right.txt          two-way
      fcompare mine base theirs            three-way merge
      fcompare --paste                     empty panes to paste into
  EOS
end
