#!/bin/sh

#################################################
#############  MADE BY ANOMALCHIK ###############
#### Please don't hit me for this script :D  ####
#################################################
	

fromstocknum=$(cat ait/stocknum.txt)
fromcmnum=$(cat ait/cmnum.txt)
fromsproutnum=$(cat ait/sproutnum.txt)
# For TimeName variant
time=$(date "+Date: %d.%m.%y and Time: %H:%M:%S")


# Need WINE!!
# Repack boot command
# boot_ - folder
RepackStock()
	{
	stockcnt=$(($fromstocknum+1))

	wine ait/ait.exe boot_
	# need press "Enter after repack"
	
	# Build zip
	mv new_boot.img bootzip/boot.img
	cd bootzip
	zip  -r ../out/boot_stock$stockcnt.zip ./
	cd ../
	
	#after build zip	
	$(echo $stockcnt > ait/stocknum.txt)
	echo "Done!"
		}
RepackCM()
	{
	cmcnt=$(($fromcmnum+1))
	wine ait/ait.exe boot_cm
	# need press "Enter after repack"


	# Build zip
	mv new_boot.img bootzip/boot.img
	cd bootzip
	zip  -r ../out/boot_cm$cmcnt.zip ./
	cd ../
	#after build zip
	$(echo $cmcnt > ait/cmnum.txt)
	echo "Done!"
		}

RepackSprout()
	{
	SproutCnt=$(($fromsproutnum+1))
	wine ait/ait.exe sprout_
	# need press "Enter after repack"


	# Build zip
	mv new_boot.img bootzip/boot.img
	cd bootzip
	zip  -r ../out/boot_sproutcm$SproutCnt.zip ./
	cd ../
	#after build zip
	$(echo $SproutCnt > ait/sproutnum.txt)
	echo "Done!"
		}

CountsInfo()
	{
	echo "Stock count: $fromstocknum"
	echo "CM count: $fromcmnum"	
	echo "Sprout CM count: $fromsproutnum"
		}	
CountsReset()
	{
	echo "Reset stock counter"
	echo 0 > ait/stocknum.txt
	echo "==================="
	echo "Done!"
	echo "==================="
	echo "Reset cm counter"
	echo 0 > ait/cmnum.txt
	echo "==================="
	echo "Done!"
	echo "==================="
	echo "Reset stock counter"
	echo 0 > ait/sproutnum.txt
	echo "==================="
	echo "Done!"
		}
CleanOut()
	{
	rm -r out
	mkdir out
	touch out/.dontdelete
	echo "Done!"
		}
Test()
	{
	echo $time
		}
######### MAIN MENU #########
echo " "
echo "Repack script by Anomalchik"
echo "Script Version 0.3a"
echo "=================================="
echo "Please run script from [wine cmd]"
echo "Usage example:"
echo "repack.sh [param]"
echo "=================================="
echo "1 = Repack Stock boot" 
echo "2 = Repack CM boot"
echo "3 = Repack Sprout CM boot"
echo "9 = Counts"
echo "0 = Reset counts"
echo "clean = clean out directory"
echo "=================================="

######### FUNCTINONAL ######### 
case "$1" in
	1)
		RepackStock
		exit
		;;
	2)
		RepackCM
		exit
		;;
	3)
		RepackSprout
		exit
		;;
	9)	
		CountsInfo
		exit
		;;
	0)
		CountsReset
		exit
		;;
	clean)
		CleanOut
		exit
		;;
		
	t)
		Test
		exit
		;;		
esac
