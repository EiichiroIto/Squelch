events
mouseMove: evt

	"Updates the cursor position as the mouse moves.  Adjusts the selection only if the mouse is currently being pressed"
	| x w |

	x := evt cursorPoint x - (bounds left + borderWidth).
	w := self width - (2 * borderWidth).

	(viewer not and: [x < 0]) ifTrue: [
		editor cursor: startIndex + (x /scale).
		self adjustSelection.
		editor slider setValue: (startIndex/data size).
		^ self startIndex: self editor cursor].
	(viewer not and: [x > w]) ifTrue: [
		editor cursor: startIndex + (x /scale).
		self adjustSelection.
		editor slider setValue: (startIndex/data size).
		^ self startIndex: editor cursor - (w/scale) truncated.
		"^ editor cursor = data size
			ifTrue: [ self startIndex: editor cursor - (w/(scale*2)) truncated.]
			ifFalse: [ self startIndex: editor cursor - (w/scale) truncated.]."].


	evt anyButtonPressed 
		ifTrue: [editor cursor: (startIndex + (x/scale) truncated).
				self adjustSelection.]
