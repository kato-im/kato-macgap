all: macgap dmg

macgap:
	macgap build kato

dmg:
	./image/MakeDMG.sh
