drawing
drawTextOn: aCanvas

	| hInset x y |
	hInset := self insetX.
	y := self insetY.
	centerText ifNil: [centerText := false].
	lines do: [:s |
		ScratchTranslator isRTL
			ifTrue: [x := self width - hInset - (renderer stringWidth: s)]
			ifFalse: [x := hInset].
		centerText ifTrue: [
			x := (self width - hInset - (renderer stringWidth: s)) // 2].
		self drawString: s at: x@y on: aCanvas.
		y := y + lineHeight].
