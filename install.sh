# Homebrew

ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"
brew bundle Brewfile

# we need to launch Alfred 2 once so that brew-cask can link to it
open ~/Applications/Alfred\ 2.app
brew cask alfred link


# Oh-my-zsh

curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# Alcatraz

curl -fsSL https://raw.github.com/supermarin/Alcatraz/master/Scripts/install.sh | sh

# Git

git config --global user.name "Peter MEUEL"
git config --global user.email peter@teriiehina.net
git config --global core.editor emacs

# Ruby
# this is from http://www.createdbypete.com/articles/ruby-on-rails-development-setup-for-mac-osx/

echo 'eval "$(rbenv init -)"' >> ~/.zshrc
source ~/.zshrc

# if any problem installing ruby with rbenv with "readline" in the error log, consider:
# RUBY_CONFIGURE_OPTS=--with-readline-dir="/usr/lib/libreadline.so" rbenv install 2.1.1
rbenv install 2.1.1
rbenv rehash
rbenv global 2.1.1

gem install bundler

echo "bundler\n" >> ~/.rbenv/default-gems
echo 'gem: --no-document' >> ~/.gemrc

# Chisel is referenced in the .lldbinit config file, so let's clone it
mkdir -p ~/Programmes/osx/
git clone https://github.com/facebook/chisel.git ~/Programmes/osx/chisel

# Me: Config files.
# Other me: thank you Captain Obvious

cat gitconfig >> ~/.gitconfig
cat tmux.conf >> ~/.tmux.conf
cat lldbinit >> ~/.lldbinit
cat zshenv >>  ~/.zshenv

# Install the bépo keyboard layout

sudo cp -R fr-dvorak-bepo.bundle /Library/Keyboard\ Layouts/fr-dvorak-bepo.bundle

# this is supposed to change the keyboard layout but I can't make it work
defaults write com.apple.HIToolbox AppleCurrentKeyboardLayoutInputSourceID -string com.apple.keyboardlayout.fr-dvorak-bepo.keylayout.FrenchDvorak

# or that:
# defaults write com.apple.HIToolbox AppleSelectedInputSources ({InputSourceKind = "Keyboard Layout";"KeyboardLayout ID" = 1111;"KeyboardLayout Name" = "French - numerical"}); killall SystemUIServer;


# enable copy in quicklook
defaults write com.apple.finder QLEnableTextSelection -bool TRUE

# /me doesn't like having shadows around the window screenshot (aka CMD-Shift-4-Space)
defaults write com.apple.screencapture disable-shadow -bool true


# let's make our changes take effect
killall Finder
killall SystemUIServer

# TODO
#   - install solarized for iTerm2 and Xcode
#   - change CapsLock to Ctrl
#   - give Spotlight's keyboard shortcut (Cmd-Space) to Alfred
#   - add `tmux attach -t base || tmux new -s base` to iTerm2
