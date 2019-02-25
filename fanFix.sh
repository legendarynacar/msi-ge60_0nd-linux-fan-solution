#!/bin/bash

#Be sure I am started in root folder of nbfc/

if [ "$(id -nu)" != "root" ]; then
	echo Run as Root!
	exit;
fi
if [ "$(id -nu)" == "root" ]; then
	cd ../nbfc/Linux/bin/Release
	sudo mono ec-probe.exe read 114
	sudo mono ec-probe.exe write 114 0x30
	sudo mono ec-probe.exe dump

	echo ===== FAN IS FIXED =====
fi
