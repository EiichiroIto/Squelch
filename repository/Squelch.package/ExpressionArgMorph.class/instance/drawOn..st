drawing
drawOn: aCanvas 

	| darkerC right topY bottomY radius xInset c |
	isNumber ifFalse: [^ super drawOn: aCanvas].

	darkerC := Color gray.
	right := self width.
	topY := bottomY := radius := self height // 2.
	self height even ifTrue: [topY := bottomY - 1].
	[topY >= 0] whileTrue: [
		xInset := radius - (radius squared - (radius - topY - 1) squared) sqrt rounded.

		self drawHLineFrom: xInset to: (xInset + 1) y: topY color: darkerC on: aCanvas.
		c := (topY < 1) ifTrue: [darkerC] ifFalse: [Color white].
		self drawHLineFrom: xInset + 1 to: right - (xInset + 1) y: topY color: c on: aCanvas.
		self drawHLineFrom: (right - (xInset + 1)) to: (right - xInset) y: topY color: darkerC on: aCanvas.

		self drawHLineFrom: xInset to: right - xInset y: bottomY color: Color white on: aCanvas.

		xInset = 0 ifTrue: [
			self drawHLineFrom: xInset + 1 to: xInset + 2 y: topY color: Color white on: aCanvas.
			self drawHLineFrom: xInset to: xInset + 1 y: bottomY color: darkerC on: aCanvas.
			self drawHLineFrom: (right - (xInset + 1)) to: (right - xInset) y: bottomY color: darkerC on: aCanvas].

		bottomY := bottomY + 1.
		topY := topY - 1].

