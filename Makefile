DOTHOME := "$(HOME)/Projects/dotfiles"
CONFIG	:= "$(HOME)/Projects/dotfiles/.config"

.PHONY: help
.SILENT: help install

help:
	printf "\n\
	Dotfiles manager\n\
	\n\
	Usage: make [command]\n\
	\n\
	make help	Show this help message\n\
	make link 	Install all dotfiles\n\
	make unlink	Uninstall all dotfiles\n\
	\n"

install:
	# dothome
	ln -fs $(DOTHOME)/.bashrc $(HOME)/.bashrc
	ln -fs $(DOTHOME)/.gtk-2.0 $(HOME)/.gtk-2.0
	ln -fs $(DOTHOME)/.profile $(HOME)/.profile
	ln -fs $(DOTHOME)/.Xresources $(HOME)/.Xresources
	# .config
	ln -fs $(CONFIG)/fontconfig/fonts.conf $(HOME)/.config/fontconfig/fonts.conf
	ln -fs $(CONFIG)/gtk-3.0/settings.ini $(HOME)/.config/gtk-3.0/settings.ini
	ln -fs $(CONFIG)/htop/htoprc $(HOME)/.config/htop/htoprc
	ln -fs $(CONFIG)/i3/config $(HOME)/.config/i3/config
	ln -fs $(CONFIG)/i3status/config $(HOME)/.config/i3status/config
	ln -fs $(CONFIG)/nvim/init.vim $(HOME)/.config/nvim/init.vim
	ln -fs $(CONFIG)/rofi/config $(HOME)/.config/rofi/config
	ln -fs $(CONFIG)/vifm/vifmrc $(HOME)/.config/vifm/vifmrc

uninstall:
	# dothome
	unlink $(HOME)/.bashrc
	unlink $(HOME)/.gtk-2.0
	unlink $(HOME)/.profile
	unlink $(HOME)/.Xresources
	# .config
	unlink $(HOME)/.config/fontconfig/fonts.conf
	unlink $(HOME)/.config/gtk-3.0/settings.ini
	unlink $(HOME)/.config/htop/htoprc
	unlink $(HOME)/.config/i3/config
	unlink $(HOME)/.config/i3status/config
	unlink $(HOME)/.config/nvim/init.vim
	unlink $(HOME)/.config/rofi/config
	unlink $(HOME)/.config/vifm/vifmrc

