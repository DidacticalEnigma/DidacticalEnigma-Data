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

update dictionaries JMdict_e.gz http://ftp.edrdg.org/pub/Nihongo/JMdict_e.gz
update dictionaries JMnedict.xml.gz http://ftp.edrdg.org/pub/Nihongo/JMnedict.xml.gz
update character kanjidic2.xml.gz http://ftp.edrdg.org/pub/Nihongo/kanjidic2.xml.gz

