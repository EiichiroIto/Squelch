initialization
buildKeyboard: nOctaves baseOctave: baseOctave keyWidth: whiteW
	"Build keyboard for the given number of octaves starting with the given octave."

	| whiteH blackW blackH octaveStart octavePt nWhite nBlack noteR key xOffset |
	self removeAllMorphs.
	self extent: 5@5.  "adjusted later"
	whiteH := (3.3 * whiteW) rounded.
	blackW := (0.57 * whiteW) rounded.
	blackW even ifTrue: [blackW := blackW - 1].
	blackH := (0.6 * whiteH) rounded.
	0 to: nOctaves do: [:i |
		octaveStart := 12 * (baseOctave + i).
		octavePt := self innerBounds topLeft + (((7 * whiteW * i) - 1) @ -1).

		i < nOctaves
			ifTrue: [nWhite := 7. nBlack := 5]
			ifFalse: [nWhite := 1. nBlack := 0].  "only one 'C' key in top octave"

		1 to: nWhite do: [:j | 
			noteR := (octavePt + (((j - 1) * whiteW) @ 0)) extent: (whiteW + 1) @ whiteH.
			key := ScratchNoteSelectorKeyMorph newBounds: noteR.
			key midiKey: octaveStart + (#(0 2 4 5 7 9 11) at: j).
			self addMorph: key].

		1 to: nBlack do: [:j |
			xOffset := (whiteW * (#(1 2 4 5 6) at: j)) - (blackW // 2).
			noteR := (octavePt + (xOffset @ 0)) extent: blackW @ blackH.
			key := ScratchNoteSelectorKeyMorph newBounds: noteR.
			key midiKey: octaveStart + (#(1 3 6 8 10) at: j).
			self addMorph: key]].

	self extent: (self fullBounds extent + borderWidth - 1).
