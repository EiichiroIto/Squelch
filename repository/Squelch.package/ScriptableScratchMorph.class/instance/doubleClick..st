event handling
doubleClick: evt
	"Show my viewer and script editor."
	
	| hand |
	hand := self world activeHand.
	hand toolType ifNotNil: [
		^ self handleTool: hand toolType hand: hand].

	self viewBlocksAndScripts.
