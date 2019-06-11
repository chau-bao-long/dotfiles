say_hello:
	@echo "      _       _         __ _ _"
	@echo "   __| | ___ | |_      / _(_) | ___  ___"
	@echo "  / _\` |/ _ \| __|____| |_| | |/ _ \/ __|"
	@echo " | (_| | (_) | ||_____|  _| | |  __/\__ \\"
	@echo "  \__,_|\___/ \__|    |_| |_|_|\___||___/"
	@echo ""
	@echo "Let's make debian/redhat/macos to start bootstrap process"

debian: say_hello
	@chmod u+x ./bootstrap_scripts/bootstrap_debian.sh
	@./bootstrap_scripts/bootstrap_debian.sh

redhat: say_hello
	@chmod u+x ./bootstrap_scripts/bootstrap_redhat.sh
	@./bootstrap_scripts/bootstrap_redhat.sh

macos: say_hello
	@chmod u+x ./bootstrap_scripts/bootstrap_macos.sh
	@./bootstrap_scripts/bootstrap_macos.sh

arch: say_hello
	@chmod u+x ./bootstrap_scripts/bootstrap_arch.sh
	@./bootstrap_scripts/bootstrap_arch.sh

arch_core:
	./bootstrap_scripts/arch/arch_core.sh

setup_git:
	./bootstrap_scripts/arch/setup_git.sh

install_nvim:
	./bootstrap_scripts/arch/install_nvim.sh

install_ranger:
	./bootstrap_scripts/arch/install_ranger.sh

install_zsh:
	./bootstrap_scripts/arch/install_zsh.sh

install_font:
	./bootstrap_scripts/arch/install_font.sh

install_suckless:
	./bootstrap_scripts/arch/install_suckless.sh

install_yaourt:
	./bootstrap_scripts/arch/install_yaourt.sh

install_input_method:
	./bootstrap_scripts/arch/install_input_method.sh

install_mail_client:
	./bootstrap_scripts/arch/install_mail_client.sh

install_softwares:
	./bootstrap_scripts/arch/install_softwares.sh
