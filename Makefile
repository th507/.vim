MD := @mkdir
RM := rm
CD := @cd
CP := @cp
LN := @ln
VIM:= @vim

DIR_VIMRC=${PWD}
DIR_NEOBUNDLE=bundle/neobundle.vim

VIMRC=${HOME}/.vimrc
NEOPARENT=$(shell cd $(DIR_NEOBUNDLE); git rev-parse --show-toplevel)

all: install

clean:
	$(RM) -rf $(DIR_NEOBUNDLE)

$(DIR_TARGET):
	$(MD) -p $(DIR_NEOBUNDLE)	

update: $(DIR_TARGET)
ifeq ($(NEOPARENT),$(DIR_VIMRC))
	@echo "Checking out latest NeoBundle"	
	$(CD) $(DIR_VIMRC) ; git clone git://github.com/Shougo/neobundle.vim $(DIR_NEOBUNDLE);
else
	@echo "Updating NeoBundle"		
	$(CD) $(DIR_NEOBUNDLE) ; git fetch origin -q; git rebase origin -q
	$(CD) $(DIR_VIMRC)
endif

install: update
	@echo "Running setup script"
	$(VIM) +DIR_NEOBUNDLECheck +DIR_NEOBUNDLEClean +qall
	@echo "Linking .vimrc"
	$(CP) ${VIMRC} "${VIMRC}.bk" 2>/dev/null
	$(LN) -fs "${DIR_VIMRC}/_vimrc" ${VIMRC}
	@echo
	@echo "Vim setup finished"

