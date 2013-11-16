#!/bin/sh

cd -- "${0%/*}"
# make sure old image not mounted
hdiutil detach /Volumes/Kato
rm ./Kato.dmg ./Kato_10MB.dmg
# create new image
hdiutil create -size 10m -fs HFS+ -type UDIF -volname Kato -ov ./Kato_10MB.dmg
hdiutil mount ./Kato_10MB.dmg
# copy all app and installer files
cp -r ../Kato.app ./.meta/.???* /Volumes/Kato/
ln -s /Applications/ "/Volumes/Kato/Applications"
# convert to RO installer image
hdiutil detach /Volumes/Kato
hdiutil convert -format UDZO -o ./Kato.dmg ./Kato_10MB.dmg
hdiutil internet-enable -yes ./Kato.dmg
