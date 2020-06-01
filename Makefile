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
DEIN_DIR=${PWD}/bundles
DEIN_PREINSTALL=$(shell mkdir -p $(DEIN_DIR); cd $(DIR_VIMFILES))

VIMRC=${HOME}/.vimrc
GVIMRC=${HOME}/.gvimrc

all: install

clean:
	$(RM) -rf $(DIR_BUNDLE)

check: link-neovim
	$(MD) -p $(DIR_NEO)

backup:
	$(RM) -f "$(VIMRC).bk" "$(GVIMRC).bk"
	$(CP) -f $(VIMRC) "$(VIMRC).bk" 2>/dev/null
	$(CP) -f $(GVIMRC) "$(GVIMRC).bk" 2>/dev/null

install: 
	@echo "Running setup script"
	curl -sSL "$(DEIN_INSTALLER)" | bash /dev/stdin $(DEIN_DIR)
	@echo "Linking .vimrc"
	$(LN) -fs "$(DIR_VIMFILES)/_vimrc" $(VIMRC)
	$(LN) -fs "$(DIR_VIMFILES)/_vimrc" $(GVIMRC)
	$(VIM) +"call dein#install()"
	@echo
	@echo "Vim setup finished"


check-neovim:
	$(MD) -p $(DIR_CONFIG_FOR_NEOVIM)

link-neovim: check-neovim
	$(LN) -fs "$(DIR_VIMFILES)" "$(DIR_CONFIG_FOR_NEOVIM)/nvim"
