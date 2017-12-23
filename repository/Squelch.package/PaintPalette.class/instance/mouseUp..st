event handling
mouseUp: evt

	| p |
	p := evt cursorPoint.
	brushSizeMorph ifNotNil: [
		(brushSizeMorph isInWorld and: [brushSizeMorph containsPoint: p])
			ifTrue: [^ self brushSizeMenu]].
	textSizeMenu ifNotNil: [
		(textSizeMenu isInWorld and: [textSizeMenu containsPoint: p])
			ifTrue: [^ self textSizeMenu]].
	textFontMenu ifNotNil: [
		(textFontMenu isInWorld and: [textFontMenu containsPoint: p])
			ifTrue: [^ self textFontMenu]].
