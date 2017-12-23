list ops
createCell: aString

	| readout cell font numberRight |
	font := ScratchFrameMorph getFont: #Watcher.
	readout := ListMultilineStringMorph new
		borderWidth: 0;
		color: Color transparent;
		textColor: Color white;
		growWithText: true;
		contents: aString font: font.
	readout height: ((ScratchTranslator stringExtent: 'A' font: font) y) + 6.
	ScratchTranslator isRTL
		ifTrue: [numberRight := self right - 5]
		ifFalse: [numberRight := self left + self largestIndexWidth + 6].
	ScratchTranslator isRTL
		ifTrue: [readout width: self right - self left - self largestIndexWidth - 33]
		ifFalse: [readout width: self right - numberRight - 25].

	cell := WatcherReadoutFrameMorph new
		color: ScriptableScratchMorph listBlockColor;
		extent: readout extent + 3;
		addMorphBack: readout.

	cell position: scrollPane contents bottomLeft.
	scrollPane contents addMorph: cell.
	^ cell
