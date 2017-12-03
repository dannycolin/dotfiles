install:
	mkdir -p ${HOME}/.config/
	mkdir -p ${HOME}/.config/fontconfig/ 
	mkdir -p ${HOME}/.config/gtk-3.0/
	mkdir -p ${HOME}/.config/htop/
	mkdir -p ${HOME}/.config/i3/
	mkdir -p ${HOME}/.config/i3status/
	mkdir -p ${HOME}/.config/nvim/
	mkdir -p ${HOME}/.config/rofi/
	mkdir -p ${HOME}/.local/share/nvim/site/pack/default/ftplugin

	ln -svf ${PWD}/.bashrc ${HOME}/.bashrc
	ln -svf ${PWD}/.dpkg_list ${HOME}/.dpkg_list
	ln -svf ${PWD}/.gtkrc-2.0 ${HOME}/.gtkrc-2.0
	ln -svf ${PWD}/.profile ${HOME}/.profile
	ln -svf ${PWD}/.xbindkeysrc ${HOME}/.xbindkeysrc
	ln -svf ${PWD}/.xinitrc ${HOME}/.xinitrc
	ln -svf ${PWD}/.Xresources ${HOME}/.Xresources
	ln -svf ${PWD}/.zprofile ${HOME}/.zprofile
	ln -svf ${PWD}/.zshrc ${HOME}/.zshrc
	ln -svf ${PWD}/.config/fontconfig/fonts.conf ${HOME}/.config/fontconfig/fonts.conf
	ln -svf ${PWD}/.config/gtk-3.0/settings.ini ${HOME}/.config/gtk-3.0/settings.ini
	ln -svf ${PWD}/.config/htop/htoprc ${HOME}/.config/htop/htoprc
	ln -svf ${PWD}/.config/i3/config ${HOME}/.config/i3/config
	ln -svf ${PWD}/.config/i3status/config ${HOME}/.config/i3status/config
	ln -svf ${PWD}/.config/nvim/init.vim ${HOME}/.config/nvim/init.vim
	ln -svf ${PWD}/.config/rofi/config ${HOME}/.config/rofi/config
	ln -svf ${PWD}/.local/share/nvim/site/pack/default/ftplugin/make.vim ${HOME}/.local/share/nvim/site/pack/default/ftplugin/make.vim
