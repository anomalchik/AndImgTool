#!/bin/sh

#################################################
#############  MADE BY ANOMALCHIK ###############
#### Please don't hit me for this script :D  ####
#################################################


# COLORS	
CRED="\033[0;31m"
CREDBOLD="\033[1;31m"
CGREEN="\033[1;32m"
CYELLOW="\033[1;33m"
CBLUE="\033[1;34m"
CNORMAL="\033[0m"

# COUNT TEMPS
fromstocknum=$(cat ait/stocknum.txt)
fromcmnum=$(cat ait/cmnum.txt)
fromsproutnum=$(cat ait/sproutnum.txt)

# COUNT ALGORITM
stockcnt=$(($fromstocknum+1))
cmcnt=$(($fromcmnum+1))
SproutCnt=$(($fromsproutnum+1))

# BOOT NAMES
stockbootname=boot_stock$stockcnt.zip
mtkcmbootname=boot_cm$cmcnt.zip
sproutcmbootname=boot_sproutcm$SproutCnt.zip
# For TimeName variant
time=$CBLUE$(date "+Date: %d.%m.%y and Time: %H:%M:%S")


# Need WINE!!
# Repack boot command
# boot_ - folder
RepackStock()
	{
	echo $CYELLOW"=====REPACK STOCK MTK BOOT====="$CNORMAL

	wine ait/ait.exe boot_
	# need press "Enter after repack"
	
	# Build zip
	mv new_boot.img bootzip/boot.img
	cd bootzip
	zip  -r ../out/$stockbootname ./
	cd ../
	
	#after build zip	
	$(echo $stockcnt > ait/stocknum.txt)
	echo $CGREEN"Done!"
	echo $CYELLOW"boot name: $stockbootname"
		}
RepackCM()
	{
	echo $CYELLOW"=====REPACK CM MTK 3.4 BOOT====="$CNORMAL
	wine ait/ait.exe boot_cm
	# need press "Enter after repack"


	# Build zip
	mv new_boot.img bootzip/boot.img
	cd bootzip
	zip  -r ../out/$mtkcmbootname ./
	cd ../
	#after build zip
	$(echo $cmcnt > ait/cmnum.txt)
	echo $CGREEN"Done!"
	echo $CYELLOW"boot name: $mtkcmbootname"
		}

RepackSprout()
	{
	echo $CYELLOW"=====REPACK SPROUT CM BOOT====="$CNORMAL
	wine ait/ait.exe sprout_
	# need press "Enter after repack"


	# Build zip
	mv new_boot.img bootzip/boot.img
	cd bootzip
	zip  -r ../out/$sproutcmbootname ./
	cd ../
	#after build zip
	$(echo $SproutCnt > ait/sproutnum.txt)
	echo $CGREEN"Done!"
	echo $CYELLOW"boot name: $sproutcmbootname"
		}

CountsInfo()
	{
	echo "Stock count: $fromstocknum"
	echo "CM count: $fromcmnum"	
	echo "Sprout CM count: $fromsproutnum"
		}	
CountsReset()
	{
	echo $CYELLOW"Reset stock counter"
	echo 0 > ait/stocknum.txt
	#echo $CGREEN"==================="
	echo $CGREEN"Done!"
	#echo $CGREEN"==================="
	echo $CYELLOW"Reset cm counter"
	echo 0 > ait/cmnum.txt
	#echo $CGREEN"==================="
	echo $CGREEN"Done!"
	#echo $CGREEN"==================="
	echo $CYELLOW"Reset stock counter"
	echo 0 > ait/sproutnum.txt
	#echo $CGREEN"==================="
	echo $CGREEN"Done!"$CNORMAL
		}
CleanOut()
	{
	rm -r out
	mkdir out
	touch out/.dontdelete
	echo $CGREEN"Done!"
		}
Test()
	{
	echo $time
		}
######### MAIN MENU #########
echo " "
echo $CREDBOLD"Repack script by Anomalchik"
echo "Script Version 0.4a"
echo "Script use AndImgTool from 4PDA"
echo $CGREEN"=================================="$CNORMAL
echo $CYELLOW"Please run script from [wine cmd]"
echo "Usage example:"
echo "repack.sh [param]"
echo $CGREEN"=================================="$CNORMAL
echo $CYELLOW"1"$CNORMAL" = Repack Stock boot" 
echo $CYELLOW"2"$CNORMAL" = Repack CM boot"
echo $CYELLOW"3"$CNORMAL" = Repack Sprout CM boot"
echo $CYELLOW"9"$CNORMAL" = Counts"
echo $CYELLOW"0"$CNORMAL" = Reset counts"
echo $CYELLOW"clean"$CNORMAL" = clean out directory"
echo $CGREEN"=================================="$CNORMAL
#echo -n "Enter Option: "
#read opt

######### FUNCTINONAL ######### 
#case $opt in
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
