drawing
drawTextOnBufferSrcRect: srcRect dstRect: dstRect
	"Draw my text box scaled onto my buffer form with the given source and destination rectangles."

	| frameColor selectionColor cm bgColor |
	(textBox isEmpty and: [#text ~= palette mode]) ifTrue: [
		textForm := nil.
		^ self].  "don't show empty textbox"

	(textForm isNil or:
	 [textForm extent ~= canvasForm extent]) ifTrue: [  "create textForm if needed"
		textForm := Form extent: canvasForm extent depth: 4].
	textForm unhibernate.
	textForm bits atAllPut: 0.  "quick clear"

	textBox drawOn: (FormCanvas on: textForm).  "draw text box"

	#text = palette mode
		ifTrue: [
			"draw text handle with color entry 6 (green) from the 4-bit color palette"
			textForm fill: (textBox topLeft - 5 extent: 8@8) fillColor: Color green.

			bgColor := Color white.
			frameColor := Color black.
			selectionColor := Color r: 0.353 g: 0.607 b: 0.788]
		ifFalse: [
			bgColor := frameColor := selectionColor := Color transparent].

	"draw the text form (4-bits) onto the buffer form at the appropriate scale mapping its colors in the process"
	cm := Bitmap new: 16.
	cm at: 1 put: 0.  "transparent"
	cm at: 2 put: (textColor pixelValueForDepth: 32).
	cm at: 3 put: (frameColor pixelValueForDepth: 32).
	cm at: 4 put: (selectionColor pixelValueForDepth: 32).
	cm at: 5 put: (bgColor pixelValueForDepth: 32).
	cm at: 6 put: (Color black pixelValueForDepth: 32).	"corner handle"
	(WarpBlt toForm: bufferForm)
		sourceForm: textForm;
		colorMap: cm;
		cellSize: 1;
		combinationRule: Form paint;
		copyQuad: srcRect innerCorners toRect: dstRect.
