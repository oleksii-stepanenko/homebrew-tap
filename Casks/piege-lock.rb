cask "piege-lock" do
  version "0.1.0"
  sha256 "4129595ea04c08f54aeec356a1997037850bccaf2f6ecb804b2c067f3abc99ca"

  url "https://github.com/oleksii-stepanenko/piege-lock/releases/download/v#{version}/PiegeLock.dmg"
  name "Piège Lock"
  desc "Camera photo trap for your macOS session: photo, wallpaper swap, melody, lock"
  homepage "https://github.com/oleksii-stepanenko/piege-lock"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "Locker.app"

  zap trash: [
    "~/Library/Preferences/com.stepanenko.piegelock.plist",
    "~/Library/Saved Application State/com.stepanenko.piegelock.savedState",
    "~/Library/Application Support/Locker",
  ]

  caveats <<~EOS
    Piège Lock is signed with a personal Apple Development certificate (it is
    not notarized by Apple), so the first launch may be gated by Gatekeeper:

      1. Open  System Settings -> Privacy & Security
      2. Scroll to Security and click "Open Anyway" next to Locker
      3. Confirm with Touch ID or your password

    Then grant two permissions (both one-time, they survive updates thanks to
    the stable signature):

      - Accessibility  (System Settings -> Privacy & Security -> Accessibility)
        — required to watch for key/mouse presses and to lock the screen.
        Restart the app after granting.
      - Camera — required for the trap photo.

    Tip: if the keyboard trigger stops firing but the mouse still works, some
    app is holding "Secure Input" (loginwindow after a lock/unlock, 1Password
    in a password field). Lock/unlock your session or reboot to clear it.
  EOS
end
