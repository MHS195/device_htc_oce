#!/system/bin/sh

mode=$(cat system/etc/fp_mode)

if [ "$mode" == "fpc" ]
then
	setprop ro.hardware.fingerprint fpc
	echo "ro.hardware.fingerprint = fpc"
elif [ "$mode" == "idex" ]
then
	setprop ro.hardware.fingerprint idex
	echo "ro.hardware.fingerprint = idex"
else
	a1=$(cat sys/devices/soc/soc:fp_fpc1155/id_pin)

	if [ "$a1" == "0" ]
	then
		setprop ro.hardware.fingerprint fpc
		echo "ro.hardware.fingerprint = fpc"
	elif [ "$a1" == "1" ]
	then
		setprop ro.hardware.fingerprint idex
		echo "ro.hardware.fingerprint = idex"
	elif [ "$a1" == "2" ]
	then
		setprop ro.hardware.fingerprint 3rd_src
		echo "ro.hardware.fingerprint = 3rd_src"
	fi
fi

