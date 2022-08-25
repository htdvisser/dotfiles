#!/usr/bin/env zsh

if [[ "$(uname -s)" != "Darwin" ]]; then
  exit 0
fi

# Global

defaults write -g AppleAccentColor -int 4
defaults write -g AppleReduceDesktopTinting -bool yes
defaults write -g AppleShowScrollBars -string "WhenScrolling"
defaults write -g AppleWindowTabbingMode -string "always"
defaults write -g NSQuitAlwaysKeepsWindows -bool no
defaults write -g NSWindowResizeTime -float 0.001
defaults write -g AppleShowAllExtensions -bool yes
defaults write -g com.apple.springing.delay -float 0
defaults write -g com.apple.springing.enabled -bool yes
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool no
sudo defaults write /Library/Preferences/com.apple.loginwindow SHOWFULLNAME -bool yes

# Language

defaults write -g AppleLanguages -array 'en-US' 'nl-NL'
defaults write -g AppleLocale "en_NL"
defaults write -g AppleMeasurementUnits -string 'Centimeters'
defaults write -g AppleMetricUnits -bool yes
defaults write -g AppleTemperatureUnit -string 'Celsius'
defaults write -g AppleICUNumberSymbols -dict \
  0 -string "." \
  1 -string "," \
  10 -string "." \
  17 -string ","

# Updates

sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist AutomaticCheckEnabled -bool yes
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist AutomaticDownload -bool yes
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist AutomaticallyInstallMacOSUpdates -bool yes
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist ConfigDataInstall -bool yes
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist CriticalUpdateInstall -bool yes
sudo defaults write /Library/Preferences/com.apple.commerce.plist AutoUpdate -bool yes

# Screensaver

defaults -currentHost write com.apple.screensaver idleTime -int 0
defaults -currentHost write com.apple.screensaver showClock -int 1
defaults -currentHost write com.apple.screensaver askForPassword -int 1
defaults -currentHost write com.apple.screensaver askForPasswordDelay -int 0
defaults -currentHost write com.apple.screensaver moduleDict -dict \
  moduleName -string "Drift" \
  path -string "/System/Library/Screen Savers/Drift.saver" \
  type -int 0

# Battery

sudo pmset -a displaysleep 5
sudo pmset -a disksleep 10

# Trackpad / Mouse

defaults write -g ApplePressAndHoldEnabled -bool no
defaults write -g com.apple.trackpad.forceClick -bool no
defaults write -g com.apple.trackpad.scaling -float 1
defaults write com.apple.AppleMultitouchTrackpad ActuateDetents -int 0
defaults write com.apple.AppleMultitouchTrackpad ActuationStrength -int 1
defaults write com.apple.AppleMultitouchTrackpad ForceSuppressed -bool yes
defaults write com.apple.AppleMultitouchTrackpad TrackpadRotate -bool no
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerDoubleTapGesture -int 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 0

# Keyboard

defaults write -g InitialKeyRepeat -int 25
defaults write -g KeyRepeat -int 1
defaults write -g NSAutomaticCapitalizationEnabled -bool no
defaults write -g NSAutomaticDashSubstitutionEnabled -bool no
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool no
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool no
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool no
defaults write -g NSAutomaticTextCompletionEnabled -bool no
defaults write -g NSAutomaticWindowAnimationsEnabled -bool no
defaults write -g NSDisableAutomaticTermination -bool yes
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool no
defaults write -g NSSpellCheckerAutomaticallyIdentifiesLanguages -bool yes
defaults write -g WebAutomaticSpellingCorrectionEnabled -bool no

# Alerts

defaults write -g com.apple.sound.beep.feedback -bool yes
defaults write -g com.apple.sound.beep.sound -string '/System/Library/Sounds/Tink.aiff'
defaults write -g com.apple.sound.beep.volume -float 0.6065307
defaults write -g com.apple.sound.uiaudio.enabled -bool yes

# Dock

defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.2

# Activity Monitor

defaults write com.apple.ActivityMonitor UpdatePeriod -int 2

# Safari

defaults write -g NSPreferredWebServices '{NSWebServicesProviderWebSearch = { NSDefaultDisplayName = DuckDuckGo; NSProviderIdentifier = "com.duckduckgo"; }; }'

# Files on Disks

defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool yes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool yes
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool yes

# Screen Capture

defaults write com.apple.screencapture disable-shadow -bool true
