event handling
mouseDown: evt

	startPoint := lastPoint := self screenToCanvas: evt cursorPoint.
	(#(stamp move) includes: palette mode) ifFalse: [self clearMoveState].

	palette showRotationCenter
		ifTrue: [^ self saveRegPointForUndo]
		ifFalse: [regPointUndoList := nil].

	#eyedropper = palette mode ifTrue: [^ self].
	#move = palette mode ifTrue: [^ self moveToolMouseDown: startPoint].
	#text = palette mode ifTrue: [^ self textMouseDown: evt].

	self saveForUndo.

	brush := (Pen newOnForm: canvasForm)
		roundNib: palette brushSize;
		color: palette color1;
		place: startPoint.

	(#erase = palette mode) | (palette color1 isTransparent) ifTrue: [
		brush color: Color black.
		brush combinationRule: Form erase1bitShape].

	(#(line oval rect) includes: palette mode) ifTrue: [
		feedbackForm := Form extent: canvasForm extent depth: 1].

	#fill = palette mode ifTrue: [self fillAt: startPoint].
	#stamp = palette mode ifTrue: [self stampAt: startPoint].

	self dragTo: startPoint.
