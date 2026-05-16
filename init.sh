rm -f ~/.bash_profile
ln -s ~/.dotfiles/bash_profile ~/.bash_profile

rm -f ~/.bashrc
ln -s ~/.dotfiles/bashrc ~/.bashrc

rm -f ~/.tmux.conf
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf

rm -f ~/.gitmux.conf
ln -s ~/.dotfiles/gitmux.conf ~/.gitmux.conf

rm -rf ~/.config
ln -s ~/.dotfiles/config ~/.config

rm -f ~/.tigrc
ln -s ~/.dotfiles/tigrc ~/.tigrc

rm -rf ~/.git_template
ln -s ~/.dotfiles/git_template ~/.git_template

rm -f ~/.gitconfig
ln -s ~/.dotfiles/gitconfig ~/.gitconfig

rm -rf ~/.bundle
ln -s ~/.dotfiles/bundle ~/.bundle
