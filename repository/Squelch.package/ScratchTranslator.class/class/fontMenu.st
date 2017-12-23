rendering menu
fontMenu
	"Present a menu of fonts."

	| menu choice |
	menu := MenuMorph new.
	menu target: [ :v | choice := v ].
	LogicalFontManager current allFamilies do: [:fn | menu add: fn selector: #value: argument: fn].
	menu invokeAt: ActiveHand position in: self world.
	choice ifNotNil: [
		RenderFont := choice.
		self updateScratchUI].
