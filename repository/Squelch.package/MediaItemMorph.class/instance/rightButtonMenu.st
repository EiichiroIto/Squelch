menu/button ops
rightButtonMenu
	"Present the right button menu."

	| menu |
	menu := MenuMorph new.
	menu target: self.
	media isImage ifTrue: [
		menu add: 'turn into new sprite' selector: #turnIntoNewSprite.
		menu add: 'export this costume' selector: #exportMedia].
	media isSound ifTrue: [
		menu add: 'export this sound' selector: #exportMedia].
	menu localize; invokeAt: ActiveHand position in: self world