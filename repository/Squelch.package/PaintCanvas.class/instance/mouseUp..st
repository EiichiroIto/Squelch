event handling
mouseUp: evt
	"Finish a drag."

	| rule shapeCM |
	textDragMode := #none.
	palette showRotationCenter ifTrue: [^ self].

	feedbackForm ifNotNil: [  "draw final rect/oval/line onto canvasForm"
		rule := Form paint.
		shapeCM := Bitmap new: 2.
		shapeCM at: 2 put: (palette color1 pixelValueForDepth: 32).
		palette color1 isTransparent ifTrue: [
			rule := Form erase.
			shapeCM at: 2 put: 16rFFFFFFFF].
		(BitBlt toForm: canvasForm)
			sourceForm: feedbackForm;
			colorMap: shapeCM;
			combinationRule: rule;
			copyBits.
		feedbackForm := nil.
		self changed].
