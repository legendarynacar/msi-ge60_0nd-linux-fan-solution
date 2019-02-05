#!/bin/bash
echo ============= SETUP IS STARTING =============
echo 5;sleep 1;echo 4;sleep 1;echo 3;sleep 1;echo 2;sleep 1;echo 1;sleep 1
echo STARTED!
if [ "$(id -nu)" != "root" ]; then
	echo Run as Root!
	exit;
fi

if [ "$(id -nu)" == "root" ]; then
	sudo apt-get install git
	git clone https://github.com/hirschmann/nbfc.git
	cd nbfc
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
	echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
	sudo apt update
	sudo apt install mono-complete
	sed -i 's/xbuild/msbuild/g' ./build.sh
	sudo ./build.sh

	echo "Do you wish to fix the fan?"
	select yn in "Yes" "No"; do
	    case $yn in
	        Yes ) bash fanFix.sh; break;;
	        No ) exit;;
	    esac
	done
fi
