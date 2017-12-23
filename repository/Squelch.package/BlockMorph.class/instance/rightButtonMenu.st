event handling
rightButtonMenu

	| menu |
	menu := MenuMorph new.
	menu target: self.
	menu add: 'help' selector: #presentHelpScreen.

	(owner isKindOf: ScratchBlockPaletteMorph) ifFalse: [
		menu addLine.
		menu add: 'duplicate' selector: #duplicate.	
		(self owner isKindOf: BlockMorph) ifFalse: [  "we can't yet delete a blocks inside a script"
			menu add: 'delete' selector: #delete]].

	DebugMenu ifTrue: [
		menu addLine.
		menu add: 'show tuples' selector: #showTuples].
	
	menu localize.
	menu invokeAt: ActiveHand position in: self world