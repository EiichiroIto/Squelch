intialization
makeXYReadout
	"Make and answer an x-y readout."

	| normalFont boldFont panel spaceWidth labelX readoutX labelY readoutY |
	normalFont := (ScratchFrameMorph getFont: #XYReadout).
	boldFont := (ScratchFrameMorph getFont: #XYReadoutBold).
	(ScratchTranslator renderScale ~= 1) ifTrue: [
		"force fonts to be fixed size:"
		normalFont := LogicalFont familyName: normalFont familyName pointSize: normalFont pointSize  / ScratchTranslator renderScale asFloat.
		boldFont := LogicalFont familyName: boldFont familyName pointSize: boldFont pointSize  / ScratchTranslator renderScale asFloat].

	panel := Morph new color: (Color r: 0.753 g: 0.764 b: 0.776).

	ScratchTranslator isRTL
		ifTrue: [labelX := StringMorph new font: normalFont; contents: ':x']
		ifFalse: [labelX := StringMorph new font: normalFont; contents: 'x:'].
	readoutX := UpdatingStringMorph new
		target: self; getSelector: #mouseX;
		forceUnicodeRendering: true;
		font: boldFont;
		stepTime: 150;
		growable: false.
	readoutX width: (readoutX stringWidth: '-1000').
	ScratchTranslator isRTL
		ifTrue: [labelY := labelX veryDeepCopy contents: ':y']
		ifFalse: [labelY := labelX veryDeepCopy contents: 'y:'].
	readoutY := readoutX veryDeepCopy getSelector: #mouseY.

	spaceWidth := ((readoutX stringWidth: ' ') * 0.8) asInteger.

	ScratchTranslator isRTL
		ifTrue: [readoutY rightJustify: true.
			panel addMorph: (readoutY position: 0@0).
			panel addMorph: (labelY position: ((readoutY topRight) + (spaceWidth@0))).]
		ifFalse: [panel addMorph: (labelX position: 0@0).
			panel addMorph: (readoutX position: ((labelX topRight) + (spaceWidth@0)))].

	ScratchTranslator isRTL
		ifTrue: [readoutX rightJustify: true.
			panel addMorph: (readoutX position: (labelY right@labelY top) + (spaceWidth@0)).
			panel addMorph: (labelX position: ((readoutX topRight) + (spaceWidth@0)))]
		ifFalse: [panel addMorph: (labelY position: (labelX right + readoutX width + 8)@(labelX top)).
			panel addMorph: (readoutY position: ((labelY topRight) + (spaceWidth@0)))].
	
	ScratchTranslator isRTL
		ifTrue: [panel extent: ((labelX right) max: (labelY right))@(labelY bottom)]
		ifFalse: [panel extent: ((readoutX right) max: (readoutY right))@(labelY bottom)].

	^ panel
