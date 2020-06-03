MD := @mkdir
RM := rm
CD := @cd
CP := @cp
LN := @ln
VIM:= @vim

DIR_VIMFILES=${PWD}
DIR_BUNDLE=bundles
DIR_CONFIG_FOR_NEOVIM=${HOME}/.config

DEIN_INSTALLER=https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh
DEIN_DIR=${PWD}/${DIR_BUNDLE}

VIMRC=${HOME}/.vimrc
GVIMRC=${HOME}/.gvimrc

all: install

clean:
	$(RM) -rf $(DIR_BUNDLE)

check: link-neovim
	$(MD) -p $(DIR_NEO)

backup:
	$(RM) -f "$(VIMRC).bk" "$(GVIMRC).bk"
	$(CP) $(DEIN_DIR) "$(DEIN_DIR).bk"
	$(CP) -f $(VIMRC) "$(VIMRC).bk" 2>/dev/null
	$(CP) -f $(GVIMRC) "$(GVIMRC).bk" 2>/dev/null

update:
	@echo "Updating via dein"
	$(VIM) -c "call dein#recache_runtimepath()" -c "try | call dein#update() | finally | qall! | endtry" -N -u ${VIMRC} -U NONE -i NONE -V1 -e -s

install: 
	@echo "Running setup script"
	curl -sSL "$(DEIN_INSTALLER)" | bash /dev/stdin $(DEIN_DIR)
	@echo "Linking .vimrc"
	$(LN) -fs "$(DIR_VIMFILES)/_vimrc" $(VIMRC)
	$(LN) -fs "$(DIR_VIMFILES)/_vimrc" $(GVIMRC)
	$(VIM) -c "try | call dein#update() | finally | qall! | endtry" -N -u ${VIMRC} -U NONE -i NONE -V1 -e -s
	@echo
	@echo "Vim setup finished"


check-neovim:
	$(MD) -p $(DIR_CONFIG_FOR_NEOVIM)

link-neovim: check-neovim
	$(LN) -fs "$(DIR_VIMFILES)" "$(DIR_CONFIG_FOR_NEOVIM)/nvim"
