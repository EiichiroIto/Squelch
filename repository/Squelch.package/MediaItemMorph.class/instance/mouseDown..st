event handling
mouseDown: evt
	"Handle a mouse click. Left button drags. Right button brings up a menu."

	scratchObj ifNil: [^ self].
	evt hand toolType ifNotNil: [
		^ self handleTool: evt hand toolType hand: evt hand].

	evt yellowButtonPressed
		ifTrue: [Sensor waitNoButton. ^ self rightButtonMenu]
		ifFalse:	[
			media isImage ifTrue: [scratchObj lookLike: media mediaName].
			evt hand waitForClicksOrDrag: self event: evt].
