geometry
centerOnScreen
	"Center myself on the screen, if possible. Otherwise, adjust position so buttons are visible."

	| w |
	w := self world.
	self extent: self extent.  "force layout"
	self position: w center - (self extent // 2) + (0@5).  "center on screen but disregard the shadow on the bottom"
	self bottom > w bottom ifTrue: [
		self bottom: w bottom + 37.  "make sure cancel button is on screen"
		self top > -2 ifTrue: [self top: -2]]. "make top flush with the top of the screen"

	(self top < -2 and: [self top > -34]) ifTrue: [
		"if title bar partway off screen, move it all the way off"
		self top: -34].
