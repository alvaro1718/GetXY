#!/bin/bash

function showmeXY() {

od -i /dev/input/event5 | awk '
BEGIN {
FS=" "
}
{

if ( $7==53 && $8>0 ) X=$8; if( $7==54 && $8>0 ) Y=$8;

if ( ( $7==53 && $8>0 ) || ( $7==54 && $8>0 ) ) {

 if( X < 100 && Y < 100)
 { print "\033[K(canto superior esquerdo)";exit; }

 if( X > 800 && Y < 100)
 {  print "\033[K(canto superior direito teste)"; }

 if( X < 100 && Y > 400)
 { print "\033[K(canto inferior esquerdo teste teste)"; }

 if( X > 800 && Y > 400)
 { print "\033[K(canto inferior direito teste teste)"; }

};

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
