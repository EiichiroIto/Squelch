event handling
click: evt
	"In a sound media item, if the thumbnail is clicked on, play the sound."

	| pos |
	pos := evt cursorPoint.
	(media isSound) ifFalse: [^ self].
	(thumbnailMorph bounds containsPoint: pos) ifTrue: [self startPreviewSound].
