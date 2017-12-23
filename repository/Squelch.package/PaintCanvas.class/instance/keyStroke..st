event handling
keyStroke: evt

	| k |
	#text = palette mode ifTrue: [
		textBox extent: canvasForm extent - textBox position.
		textBox keyStroke: evt.
		^ self changed].

	k := evt keyValue.
	(evt commandKeyPressed | evt controlKeyPressed)
		ifTrue: [k := k \\ 32].  "treat command/alt same as the control key"

	k = ($a asciiValue \\ 32) ifTrue: [^ self selectAll].
	k = ($c asciiValue \\ 32) ifTrue: [^ self copyMoveSelection].
	(#(8 24 127) includes: k) ifTrue: [^ self deleteOrCropCurrentSelection: evt].
	k = ($z asciiValue \\ 32) ifTrue: [^ self undo].

	(palette mode = #move and: [selectionRect notNil]) ifTrue: [
		self startMove.
		"keys that act on the selection"
		k = 28 ifTrue: [^ self nudge: -1@0].  "left"
		k = 29 ifTrue: [^ self nudge:  1@0].  "right"
		k = 30 ifTrue: [^ self nudge:  0@-1].  "up"
		k = 31 ifTrue: [^ self nudge:  0@1]].  "down"

	self beep.
