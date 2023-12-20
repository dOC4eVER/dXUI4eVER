#!/bin/bash
echo -e "\nChecking that minimal requirements are ok"
logfile=$(date +%Y-%m-%d_%H.%M.%S_xtream_ui_install.log)
touch "$logfile"
exec > >(tee "$logfile")
exec 2>&1
echo "install-bin-packages.sh"	
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock
# Ensure the OS is compatible with the launcher
if [ -f /etc/almalinux-release ]; then
    OS="Alma Linux"
    VERFULL=$(sed 's/^.*release //;s/ (Fin.*$//' /etc/almalinux-release)
    VER=${VERFULL:0:1} # return 8
elif [ -f /etc/fedora-release ]; then
    OS="Fedora"
    VERFULL=$(sed 's/^.*release //;s/ (Fin.*$//' /etc/fedora-release)
    VER=${VERFULL:0:2}
elif [ -f /etc/gentoo-release ]; then
    OS="Gentoo"
    VERFULL=$(sed 's/^.*release //;s/ (Fin.*$//' /etc/gentoo-release)
    VER=${VERFULL:0:2}
elif [ -f /etc/SuSE-release ]; then
    OS="OpenSUSE"
    VERFULL=$(sed 's/^.*release //;s/ (Fin.*$//' /etc/SuSE-release)
    VER=${VERFULL:0:3}
elif [ -f /etc/centos-release ]; then
    OS="CentOs"
    VERFULL=$(sed 's/^.*release //;s/ (Fin.*$//' /etc/centos-release)
    VER=${VERFULL:0:1} # return 8
	if [[ "$VER" = "8" || "$VER" = "9" ]]; then
		OS="CentOS-Stream"
	fi
elif [ -f /etc/lsb-release ]; then
    OS=$(grep DISTRIB_ID /etc/lsb-release | sed 's/^.*=//')
    VER=$(grep DISTRIB_RELEASE /etc/lsb-release | sed 's/^.*=//')
elif [ -f /etc/os-release ]; then
    OS=$(grep -w ID /etc/os-release | sed 's/^.*=//')
    VER=$(grep VERSION_ID /etc/os-release | sed 's/^.*"\(.*\)"/\1/')
 else
    OS=$(uname -s)
    VER=$(uname -r)
fi
ARCH=$(uname -m)

    echo -e " \033[1;33m Detected\033[1;36m $OS\033[1;32m $VER\033[0m" "\033[1;35m$ARCH\033[0m"
echo ""	
if [[ "$OS" = "CentOs" && "$VER" = "7" && "$ARCH" == "x86_64" ||
"$OS" = "CentOS-Stream" && "$VER" = "8" && "$ARCH" == "x86_64" ||
"$OS" = "CentOS-Stream" && "$VER" = "9" && "$ARCH" == "x86_64" ||
"$OS" = "Fedora" && ("$VER" = "36" || "$VER" = "37" || "$VER" = "38" ) && "$ARCH" == "x86_64" ||
"$OS" = "Ubuntu" && ("$VER" = "18.04" || "$VER" = "20.04" || "$VER" = "22.04" ) && "$ARCH" == "x86_64" ||
"$OS" = "debian" && ("$VER" = "10" || "$VER" = "11" ) && "$ARCH" == "x86_64" ]] ; then
    tput setaf 2 ; tput bold ;echo "Ok."; tput sgr0;    
#echo ""
else
    tput setaf 1 ; tput bold ;echo "Sorry, this OS is not supported by Xtream UI."; tput sgr0;    
echo ""
    exit 1
fi
    tput setaf 6 ; tput bold ;echo -e "\n-- Updating repositories and packages sources"; tput sgr0;    
echo ""

if [[ "$OS" = "Ubuntu" || "$OS" = "debian" ]]; then
	cd
	if [[ "$VER" = "22.04" ]]; then
 		wget https://github.com/dOC4eVER/dXUI4eVER/releases/download/start/xtreamcodes-nginx_1.24.0-1-Ubuntu_22.04.deb
    		wget https://github.com/dOC4eVER/dXUI4eVER/releases/download/start/xtreamcodes-nginx-rtmp_1.24.0-1-Ubuntu_22.04.deb
    		wget https://github.com/dOC4eVER/dXUI4eVER/releases/download/start/xtreamcodes-php_7.2.34-1-Ubuntu_22.04.deb
    		wget https://github.com/dOC4eVER/dXUI4eVER/releases/download/start/xtreamcodes-php-mcrypt_1.0.5-1-Ubuntu_22.04.deb
    		wget https://github.com/dOC4eVER/dXUI4eVER/releases/download/start/xtreamcodes-php-geoip_1.1.1-1-Ubuntu_22.04.deb
    		wget https://github.com/dOC4eVER/dXUI4eVER/releases/download/start/xtreamcodes-php-igbinary_3.2.14-1-Ubuntu_22.04.deb
   		DEBIAN_FRONTEND=noninteractive dpkg -i xtreamcodes-nginx_1.24.0-1-Ubuntu_22.04.deb xtreamcodes-nginx-rtmp_1.24.0-1-Ubuntu_22.04.deb xtreamcodes-php_7.2.34-1-Ubuntu_22.04.deb xtreamcodes-php-mcrypt_1.0.5-1-Ubuntu_22.04.deb xtreamcodes-php-geoip_1.1.1-1-Ubuntu_22.04.deb xtreamcodes-php-igbinary_3.2.14-1-Ubuntu_22.04.deb
   		DEBIAN_FRONTEND=noninteractive apt-get -yf install
   		DEBIAN_FRONTEND=noninteractive dpkg -i xtreamcodes-nginx_1.24.0-1-Ubuntu_22.04.deb xtreamcodes-nginx-rtmp_1.24.0-1-Ubuntu_22.04.deb xtreamcodes-php_7.2.34-1-Ubuntu_22.04.deb xtreamcodes-php-mcrypt_1.0.5-1-Ubuntu_22.04.deb xtreamcodes-php-geoip_1.1.1-1-Ubuntu_22.04.deb xtreamcodes-php-igbinary_3.2.14-1-Ubuntu_22.04.deb
   		rm -f xtreamcodes-nginx_1.24.0-1-Ubuntu_22.04.deb xtreamcodes-nginx-rtmp_1.24.0-1-Ubuntu_22.04.deb xtreamcodes-php_7.2.34-1-Ubuntu_22.04.deb xtreamcodes-php-mcrypt_1.0.5-1-Ubuntu_22.04.deb xtreamcodes-php-geoip_1.1.1-1-Ubuntu_22.04.deb xtreamcodes-php-igbinary_3.2.14-1-Ubuntu_22.04.deb
	else
  		wget https://github.com/dOC4eVER/dXUI4eVER/raw/master/xui/php7.2rebuild.sh -O /root/php7.2rebuild.sh
   		bash /root/php7.2rebuild.sh
   	fi
fi
if [[ "$OS" = "CentOs" || "$OS" = "CentOS-Stream" || "$OS" = "Fedora" ]]; then
  	wget https://github.com/dOC4eVER/dXUI4eVER/raw/master/xui/php7.2rebuild.sh -O /root/php7.2rebuild.sh
   	bash /root/php7.2rebuild.sh

fi
