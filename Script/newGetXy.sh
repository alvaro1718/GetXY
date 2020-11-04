#!/bin/bash

function showmeXY() {

od -i /dev/input/event5 | awk '
BEGIN {
FS=" "
}
{

if ( $7==53 && $8>0 ) X=$8; if( $7==54 && $8>0 ) Y=$8;
print "\033[4;70H--------------------";
print "\033[4;63H-------";
print "\033[4;70H(X:"X", Y:"Y")"

}'

}

function teste() 
{
showmeXY
echo "teste out"
boll=1
}

function main() {
	clear
	boll=0;
	
	while [ $boll == 0 ]
	do
		teste
	done
	clear

}

main
