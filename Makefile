DOTHOME 	:= "$(HOME)/.dotfiles/user"
DOTCONFIG	:= "$(HOME)/.dotfiles/user/.config"
CONFIG		:= "$(HOME)/.config"

.PHONY: help
.SILENT: help install

help:
	printf "\n\
	Dotfiles manager\n\
	\n\
	Usage: make [command]\n\
	\n\
	make help	Show this help message\n\
	make install	Install all dotfiles\n\
	make uninstall	Uninstall all dotfiles\n\
	\n"

install:
	# dothome
	ln -fs $(DOTHOME)/.bashrc 			$(HOME)/.bashrc
	ln -fs $(DOTHOME)/.gtkrc-2.0 		$(HOME)/.gtkrc-2.0
	ln -fs $(DOTHOME)/.inputrc 			$(HOME)/.inputrc
	ln -fs $(DOTHOME)/.profile 			$(HOME)/.profile
	ln -fs $(DOTHOME)/.Xresources 	$(HOME)/.Xresources
	# .config
	ln -fs $(DOTCONFIG)/bspwm/bspwmrc 				$(CONFIG)/bspwm/bspwmrc
	ln -fs $(DOTCONFIG)/bspwm/window_type 		$(CONFIG)/bspwm/window_type
	ln -fs $(DOTCONFIG)/fontconfig/fonts.conf $(CONFIG)/fontconfig/fonts.conf
	ln -fs $(DOTCONFIG)/gtk-3.0/settings.ini 	$(CONFIG)/gtk-3.0/settings.ini
	ln -fs $(DOTCONFIG)/htop/htoprc 					$(CONFIG)/htop/htoprc
	ln -fs $(DOTCONFIG)/i3/config 						$(CONFIG)/i3/config
	ln -fs $(DOTCONFIG)/i3status/config 			$(CONFIG)/i3status/config
	ln -fs $(DOTCONFIG)/nvim/init.vim 				$(CONFIG)/nvim/init.vim
	ln -fs $(DOTCONFIG)/polybar/config 				$(CONFIG)/polybar/config
	ln -fs $(DOTCONFIG)/rofi/config.rasi 			$(CONFIG)/rofi/config.rasi
	ln -fs $(DOTCONFIG)/sxhkd/sxhkdrc					$(CONFIG)/sxhkd/sxhkdrc
	ln -fs $(DOTCONFIG)/vifm/vifmrc 					$(CONFIG)/vifm/vifmrc

uninstall:
	# dothome
	unlink $(HOME)/.bashrc
	unlink $(HOME)/.gtkrc-2.0
	unlink $(HOME)/.inputrc
	unlink $(HOME)/.profile
	unlink $(HOME)/.Xresources
	# .config
	unlink $(HOME)/.config/bspwm/bspwmrc
	unlink $(HOME)/.config/bspwm/window_type
	unlink $(HOME)/.config/fontconfig/fonts.conf
	unlink $(HOME)/.config/gtk-3.0/settings.ini
	unlink $(HOME)/.config/htop/htoprc
	unlink $(HOME)/.config/i3/config
	unlink $(HOME)/.config/i3status/config
	unlink $(HOME)/.config/nvim/init.vim
	unlink $(HOME)/.config/polybar/config
	unlink $(HOME)/.config/rofi/config.rasi
	unlink $(HOME)/.config/sxhkd/sxhkdrc
	unlink $(HOME)/.config/vifm/vifmrc

