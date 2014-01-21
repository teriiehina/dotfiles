# Homebrew

ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"

# Oh-my-zsh

curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh


# Install the bépo keyboard layout

sudo cp fr-dvorak-bepo.bundle /Library/Keyboard\ Layouts/fr-dvorak-bepo.bundle

# this is supposed to change the keyboard layout but I can't make it work
# defaults write com.apple.HIToolbox AppleCurrentKeyboardLayoutInputSourceID -string com.apple.keyboardlayout.fr-dvorak-bepo.keylayout.FrenchDvorak; killall SystemUIServer;

# or that:
# defaults write com.apple.HIToolbox AppleSelectedInputSources ({InputSourceKind = "Keyboard Layout";"KeyboardLayout ID" = 1111;"KeyboardLayout Name" = "French - numerical"}); killall SystemUIServer;

# add http://furbo.org/2013/11/02/a-quick-look-plug-in-for-provisioning/
