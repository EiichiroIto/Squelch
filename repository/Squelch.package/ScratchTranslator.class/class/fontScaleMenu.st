rendering menu
fontScaleMenu
	"Present a menu of font scales."

	| menu choice s |
	menu := CustomMenu new.
	(0.8 to: 2.01 by: 0.1) do: [:n |
		s := n printString, 'x'.
		n = RenderScale ifTrue: [s := s, ' *'].
		menu add: s action: n].

	choice := menu startUp.
	choice ifNotNil: [
		RenderScale := choice.
		self updateScratchUI].
