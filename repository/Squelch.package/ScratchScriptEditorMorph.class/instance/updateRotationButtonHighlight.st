private
updateRotationButtonHighlight
	"Highlight the appropriate rotation style button. Do nothing if my target is not a sprite."

	| style sym |
	(self target isKindOf: ScratchSpriteMorph) ifFalse: [^ self].

	style := self target rotationStyle.
	style = #normal ifTrue: [sym := #Smooth].
	style = #leftRight ifTrue: [sym := #Flip].
	style = #none ifTrue: [sym := #None].

	rotationButtons do: [:m |
		sym = m arguments first ifTrue: [m on] ifFalse: [m off]].
