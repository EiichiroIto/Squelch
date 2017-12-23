event handling
click: evt
	"Start or stop all my clickable scripts."

	| h clickEvt |
	h := World activeHand.
	h toolType ifNotNil: [^ self handleTool: h toolType hand: h].

	clickEvt := ScratchEvent new
		name: 'Scratch-MouseClickEvent'
		argument: 0.
	self eventReceived: clickEvt.
