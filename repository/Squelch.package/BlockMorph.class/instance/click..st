event handling
click: evt
	"If a tool is selected, handle a click with that tool. Otherwise, toggle my process."

	evt hand toolType ifNotNil: [
		"handle mouse clicks when the mouse is in different modes"
		^ self handleTool: evt hand toolType hand: evt hand].

	self topBlock toggleProcess.
