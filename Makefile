RM := rm
CD := @cd
CP := @cp
LN := @ln

DIR_VIMFILES=${PWD}
DIR_BUNDLE=bundles
DIR_CONFIG_FOR_NEOVIM=${HOME}/.config

DEIN_DIR=${PWD}/${DIR_BUNDLE}
DEIN_REPO=github.com/Shougo/dein.vim
DEIN_INSTALLER_DIR=${DEIN_DIR}/repos/${DEIN_REPO}

VIMRC="${HOME}/.vimrc"
GVIMRC="${HOME}/.gvimrc"

all: install

clean:
	$(RM) -rf $(DIR_BUNDLE)

backup:
	$(RM) -f "$(VIMRC).bk" "$(GVIMRC).bk"
	$(CP) $(DEIN_DIR) "$(DEIN_DIR).bk"
	$(CP) -f $(VIMRC) "$(VIMRC).bk" 2>/dev/null
	$(CP) -f $(GVIMRC) "$(GVIMRC).bk" 2>/dev/null

prune:
	@echo "Pruning vim plugin"
	vim \
		-c "call dein#recache_runtimepath()" \
		-N -u ${VIMRC} -U NONE -i NONE -V1 -e -s

u up update: prune
	@echo "Updating via dein"
	vim \
		-c "try | call dein#update() | finally | qall! | endtry" \
		-N -u ${VIMRC} -U NONE -i NONE -V1 -e -s

fetch:
	@echo "Running setup script"
	[ -d "${DEIN_INSTALLER_DIR}/.git" ] && \
	sh -c "cd ${DEIN_INSTALLER_DIR}; git pull --ff-only" || \
	sh -c "mkdir -p ${DEIN_INSTALLER_DIR}; git clone https://${DEIN_REPO} ${DEIN_INSTALLER_DIR}"


link: link-nvim
	@echo "Linking .vimrc"
	ln -fs "$(DIR_VIMFILES)/_vimrc" $(VIMRC)
	ln -fs "$(DIR_VIMFILES)/_vimrc" $(GVIMRC)

i install: fetch link update
	@echo
	@echo "Vim setup finished"

check-nvim:
	hash nvim &>/dev/null && mkdir -p $(DIR_CONFIG_FOR_NEOVIM) || echo 'Skipping nvim'

nvim neovim link-nvim: check-nvim
	hash nvim &>/dev/null && [ -d "$(DIR_CONFIG_FOR_NEOVIM)/nvim" ] || ln -fs "$(DIR_VIMFILES)" "$(DIR_CONFIG_FOR_NEOVIM)/nvim"
	[ -d "${DIR_VIMFILES}/.vim" ] && rm -fr "${DIR_VIMFILES}/.vim" || echo ''
