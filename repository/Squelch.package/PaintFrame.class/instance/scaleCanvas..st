other
scaleCanvas: aNumberOrSymbol

	| numToScale |

	numToScale := aNumberOrSymbol.
	(aNumberOrSymbol == #in) ifTrue: [numToScale := (canvasMorph scale*2 min: 16)].
	(aNumberOrSymbol == #out) ifTrue: [numToScale := (canvasMorph scale//2 max: 1)].
	
	zoomBar allMorphsDo: [:b |
		(b isKindOf: ToggleButton) ifTrue: [
			b arguments first = numToScale ifTrue: [b on] ifFalse: [b off]]].

	canvasMorph scale: numToScale.
