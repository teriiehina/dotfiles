# Homebrew

ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"
brew bundle Brewfile

# Oh-my-zsh

curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# Alcatraz

curl -fsSL https://raw.github.com/supermarin/Alcatraz/master/Scripts/install.sh | sh

# Config Git

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

# Chisel is used by lldbinit, so let's clone it
mkdir -p ~/Programmes/osx/
git clone https://github.com/facebook/chisel.git ~/Programmes/osx/chisel

# we assume that this is a brand new mac you are running
# thus none of theses files' destinations should exist.

cat gitconfig >> ~/.gitconfig
cat tmux.conf >> ~/.tmux.conf
cat lldbinit >> ~/.lldbinit
cat zshenv >>  ~/.zshenv

# Install the bépo keyboard layout

sudo cp -R fr-dvorak-bepo.bundle /Library/Keyboard\ Layouts/fr-dvorak-bepo.bundle

# this is supposed to change the keyboard layout but I can't make it work
defaults write com.apple.HIToolbox AppleCurrentKeyboardLayoutInputSourceID -string com.apple.keyboardlayout.fr-dvorak-bepo.keylayout.FrenchDvorak; killall SystemUIServer;

# or that:
# defaults write com.apple.HIToolbox AppleSelectedInputSources ({InputSourceKind = "Keyboard Layout";"KeyboardLayout ID" = 1111;"KeyboardLayout Name" = "French - numerical"}); killall SystemUIServer;

# add http://furbo.org/2013/11/02/a-quick-look-plug-in-for-provisioning/

# enable copy in quicklook
defaults write com.apple.finder QLEnableTextSelection -bool TRUE; killall Finder

# TODO
#   - install solarized for iTerm2 and Xcode
#   - change CapsLock to Ctrl
#   - give Spotlight's keyboard shortcut (Cmd-Space) to Alfred
#   - add `tmux attach -t base || tmux new -s base` to iTerm2
