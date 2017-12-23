other
showValue

	| gotError msg tooltip w worldBounds |
	gotError := false.
	[msg := self evaluate asString] ifError: [
		gotError := true.
		msg := 'Error!'].

	(self isBooleanReporter or: [msg = 'Error!']) ifTrue: [
		msg := msg localized].
	tooltip := (ScratchReporterToolTipMorph string: msg for: self)
		left: self right;
		bottom: self top.
	ScratchTranslator isRTL ifTrue: [tooltip right: self left].
	gotError ifTrue: [tooltip messageColor: Color red darker].

	w := self world.
	w addMorphFront: tooltip.
	((worldBounds := w bounds) containsRect: tooltip bounds) ifFalse:
		[tooltip bounds: (tooltip bounds translatedToBeWithin: worldBounds)].

	self setProperty: #toolTip toValue: tooltip.
	tooltip initialCursorPoint: Sensor cursorPoint.
	tooltip startStepping.
