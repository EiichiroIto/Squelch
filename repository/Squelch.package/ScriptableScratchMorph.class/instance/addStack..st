scripts
addStack: aBlockStack
	"Aligns the newly added script below the lowest script in the pane."

	| y bottom |
	y := 10.
	blocksBin submorphsDo: [:m |
		bottom :=  (m fullBounds bottom) - (blocksBin position y).
		(bottom > y) ifTrue: 
			[y := bottom]].
	aBlockStack position: blocksBin position + (20@(y+10)).

	aBlockStack newScriptOwner: self.
	blocksBin addMorph: aBlockStack.
