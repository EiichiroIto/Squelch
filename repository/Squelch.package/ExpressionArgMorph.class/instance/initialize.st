initialization
initialize

	super initialize.
	isNumber := true.
	self borderWidth: 1.
	self borderInset.
	self color: (Color gray: 0.95).
	self extent: 25@12.

	"To allow for editing in place."
	labelMorph := StringFieldMorph new
		forExpressionArg;
		doResizing: true;
		font: (ScratchFrameMorph getFont: #Arg);
		color: Color transparent.
	self addMorph: labelMorph.
	self numExpression: '10'.
