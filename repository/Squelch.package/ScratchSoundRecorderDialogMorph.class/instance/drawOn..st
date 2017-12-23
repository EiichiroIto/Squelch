drawing
drawOn: aCanvas

	| p clipC lastX |

	super drawOn: aCanvas.

	"draw recorder meter background, scalable"
	recorderBackgroundCenter ifNil: [^ self].

	clipC := aCanvas copyClipRect: self fullBounds.
	p := (self bounds topLeft + (20@(recordMeter top - self top - 3))) + (recorderBackgroundLeft width@0).
	clipC paintImage: recorderBackgroundLeft at: (self bounds topLeft + (20@(recordMeter top - self top - 3))).
	lastX := (self bounds right - 66) - (recorderBackgroundRight width).
	[p x <= lastX] whileTrue: [
		clipC paintImage: recorderBackgroundCenter at: p.
		p := (p x + recorderBackgroundCenter width) @ p y].
	clipC paintImage: recorderBackgroundRight at: ((self bounds right - 66) - recorderBackgroundRight width)@(self bounds top + (recordMeter top - self top - 3)).
