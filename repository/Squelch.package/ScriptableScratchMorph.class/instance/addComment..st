scripts
addComment: aScratchCommentMorph
	"Aligns the newly added script below the lowest script in the pane."

	| y bottom |
	y := 10.
	blocksBin submorphsDo: [:m |
		bottom :=  (m fullBounds bottom) - (blocksBin position y).
		(bottom > y) ifTrue: 
			[y := bottom]].
	aScratchCommentMorph position: blocksBin position + (20@(y+10)).

	blocksBin addMorph: aScratchCommentMorph.
