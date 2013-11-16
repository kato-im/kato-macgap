all: macgap dmg

macgap:
	macgap build --name Kato Kato

dmg:
	./image/MakeDMG.sh
