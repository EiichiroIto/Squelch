drawing
drawOn: aCanvas
	| clipC |
	super drawOn: aCanvas.
	lineHeight ifNil: [ self font: font ].	"draw my background, if I have one"
	backForm
		ifNotNil: [ 
			backForm
				position: self topLeft;
				extent: self extent.
			backForm drawOn: aCanvas ].
	aCanvas isShadowDrawing
		ifFalse: [ 
			clipC := aCanvas copyOffset: bounds origin clipRect: (bounds insetBy: borderWidth).
			hasFocus
				ifTrue: [ self drawSelectionOn: clipC ].
			self drawTextOn: clipC ]