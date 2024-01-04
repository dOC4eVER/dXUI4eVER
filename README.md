# Xtream UI for Ubuntu 18.04 20.04 22.04 Debian 10 11 CentOS 8 Fedora 34 35 36 install
#
#

## How do I install? ONLY 18.04
## update your ubuntu first, then install panel

   sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get install software-properties-common libxslt1-dev libcurl3 libgeoip-dev python -y;
   rm install.py; wget https://github.com/dOC4eVER/ubuntu18.04/raw/master/install.py;
   sudo python install.py
#
#

### If you want to install main server with admin panel, choose MAIN.
### If you want to install load balance on additional servers, add a server to panel in manage servers page, then run script and proceed with LB option.
#
#







### New installation the Xtream UI on Ubuntu 18.04/20.04/22.04 Debian 10/11 CentOS 8 Fedora 34/35/36

   wget https://github.com/dOC4eVER/dXUI4eVER/raw/master/install.sh -O /tmp/install.sh && bash /tmp/install.sh
#
#

### New installation the Xtream UI on Ubuntu 20.04 22.04
   
   sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get install software-properties-common libxslt1-dev libcurl4 libgeoip-dev python3 -y;
   rm install.py; wget https://github.com/dOC4eVER/dXUI4eVER/raw/master/xui/install-main-silent-3.py;
   sudo python3 install-main-silent-3.py

#
#


### To upgrade an existing Panel only, with a backup of the /admin & /pytools directories in *.old in case you want to go back
 
   wget https://github.com/dOC4eVER/dXUI4eVER/raw/master/Update_dOC4eVER.sh -O /tmp/Update_dOC4eVER.sh && bash /tmp/Update_dOC4eVER.sh

#
#





### Restore the old Panel and delete the "old" directory

    wget https://github.com/dOC4eVER/dXUI4eVER/raw/master/Downgrade_old_panel.sh -O /tmp/Downgrade_old_panel.sh && bash /tmp/Downgrade_old_panel.sh
    
#
#






### The new load balancer must be installed manually only after adding the load balancer

    wget https://github.com/dOC4eVER/dXUI4eVER/raw/master/sub_install.sh -O /tmp/sub_install.sh && bash /tmp/sub_install.sh

#
#


### if error

sudo: /home/xtreamcodes/iptv_xtream_codes/php/bin/php: command not found

full binary rebuild require

    wget https://github.com/dOC4eVER/dXUI4eVER/raw/master/all_os/depbuild.sh -O /root/depbuild.sh
    bash /root/depbuild.sh wget https://github.com/dOC4eVER/dXUI4eVER/raw/master/all_os/php7.2rebuild.sh -O /root/php7.2rebuild.sh
    bash /root/php7.2rebuild.sh /home/xtreamcodes/iptv_xtream_codes/start_services.sh
#
#



### if nginx and nginx_rtmp error minimal rebuild require

    wget https://github.com/dOC4eVER/dXUI4eVER/raw/master/all_os/install-bin-packages.sh -O /root/install-bin-packages.sh
    bash /root/install-bin-packages.sh /home/xtreamcodes/iptv_xtream_codes/start_services.sh 
#
#
   
   
   
   
   * (dOC4eVER) 2023 by amidevous odin
