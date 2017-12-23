private
costumeChanged

	costumeChangeMSecs := Time millisecondClockValue.
	filterPack ifNotNil: [filterPack clearFilterCaches].
	self layoutChanged.
	self keepOnScreen.
