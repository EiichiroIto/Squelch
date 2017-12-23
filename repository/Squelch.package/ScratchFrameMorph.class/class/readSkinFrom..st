scratch skin
readSkinFrom: aDirectory
	"Read the Forms for my skin from the given directory and store them in myskin dictionary."
	"When in XO mode, entries in ScratchSkinXO override the corresponding entries in ScratchSkin."
	"self readSkinFrom: (FileDirectory default directoryNamed: 'ScratchSkin')"

	| dict img i |
	dict := Dictionary new.
	aDirectory fileNames do: [:fn |
		| fn2 |
		fn2 := fn.
		Cursor read showWhile: [
			img := [Form fromFileNamed: (aDirectory / fn2)] ifError: [nil]].
		img ifNotNil: [
			i := fn2 findLast: [:c | c = $.].
			i = 0 ifFalse: [fn2 := fn2 copyFrom: 1 to: i - 1].
			(fn2 asLowercase endsWith: '_xo')
				ifFalse: [dict at: fn2 asSymbol put: img]]].
	ScratchSkin := dict.

	img := ScratchSkin at: #scriptsPaneTexture ifAbsent: [nil].
	(img notNil and: [img depth ~= 32]) ifTrue: [
		ScratchSkin at: #scriptsPaneTexture put: (img asFormOfDepth: 32)].
