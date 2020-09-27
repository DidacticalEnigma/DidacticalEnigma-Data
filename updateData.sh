#!/bin/bash

function update() {
	dir=$1
	file=$2
	addr=$3

	cd "$dir"
	sha512sum "$file"
	wget -O downloaded "$addr"
	mv "$file" "$file.old" 2> /dev/null
	mv downloaded "$file"
	sha512sum "$file"
	cd ..
}

update dictionaries JMdict_e.gz ftp://ftp.monash.edu.au/pub/nihongo/JMdict_e.gz
#update dictionaries JMnedict.xml.gz http://ftp.monash.edu/pub/nihongo/JMnedict.xml.gz
#update character kanjidic2.xml.gz http://www.edrdg.org/kanjidic/kanjidic2.xml.gz

