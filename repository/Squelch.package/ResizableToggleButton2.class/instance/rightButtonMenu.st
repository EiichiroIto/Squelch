event handling
rightButtonMenu

	| menu |
	(self owner isKindOf: ScratchBlockPaletteMorph) ifTrue: [
		menu := CustomMenu new.
		menu add: 'help' action: #presentHelpScreen.
		menu localize; invokeOn: self].
