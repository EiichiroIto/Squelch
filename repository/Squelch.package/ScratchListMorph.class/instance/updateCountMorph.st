stepping
updateCountMorph

	countMorph contents: 'length' localized, ScratchTranslator colonSuffix, ' ', self lineCount printString.
	countMorph left: self left + ((self width - countMorph width) // 2) + 3.
