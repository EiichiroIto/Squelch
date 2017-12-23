initialization
makeNewSpriteButtons: aScratchFrameMorph
	"Return a morph containing a set of new sprite buttons."

	| panel buttonSpecs buttons button butonExtent x |
	panel := Morph new color: Color transparent.

	buttonSpecs := #(
		"	icon name				selector					tooltip"
		(newSpritePaint			paintSpriteMorph		'Paint new sprite')
		(newSpriteLibrary		addSpriteMorph			'Choose new sprite from file')
		(newSpriteSurprise 		surpriseSpriteMorph		'Get surprise sprite')
	).

	buttons := buttonSpecs collect: [:spec |
		button := ToggleButton new
			onForm: (ScratchFrameMorph skinAt: (spec at: 1))
			offForm: (ScratchFrameMorph skinAt: (spec at: 1)).

		button
			target: aScratchFrameMorph;
			actionSelector: (spec at: 2);
			setProperty: #balloonText toValue: (spec at: 3) localized.
		button].

	butonExtent := ScratchFrameMorph isXO ifTrue: [37@27] ifFalse: [37@27].
	x := 0.
	buttons do: [:b |
		b extent: butonExtent.
		panel addMorph: (b position: x@1).
		x := x + 5 + b width].

	panel extent: x@(butonExtent y + 1).

	^ panel
