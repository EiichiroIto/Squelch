event handling
rightButtonMenu

	| menu |
	menu := MenuMorph new.
	menu target: self.
	menu addLine.
	menu add: 'delete' selector: #delete.
	menu add: 'duplicate' selector: #duplicate.

	menu localize.
	menu invokeAt: ActiveHand position in: self world