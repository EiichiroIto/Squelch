event handling
startDrag: evt
	"This is a drag gesture; pick me up."

	| rootForGrab |
	rootForGrab := owner rootForGrabOf: self.
	rootForGrab ifNil: [^ self].
	rootForGrab position: evt hand position + (self topLeft - evt cursorPoint).
	evt hand grabMorph: rootForGrab.
