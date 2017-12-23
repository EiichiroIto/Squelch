drawing
fixLayout

	| watcher readout isLarge s e readoutWidth yOffset w inset |
	((submorphs size = 1) and: [submorphs first isKindOf: StringMorph]) ifFalse: [^ self].
	watcher := self meOrOwnerThatIsA: WatcherMorph.
	readout := submorphs first.

	isLarge := watcher ifNil: [false] ifNotNil: [watcher isLarge].
	s := readout contents.
	isLarge
		ifTrue: [self width: 50]
		ifFalse: [self width: 40].

	e := ScratchTranslator stringExtent: s font: readout font.
	readoutWidth := e x.
	(readoutWidth + 10) > self width ifTrue: [self width: readoutWidth + 12].
	self width > (readoutWidth + 50) ifTrue: [self width: readoutWidth + 50].

	"readout contents: (UTF8 withAll: readout contents)."
	"set height"
	isLarge
		ifTrue: [self height: (e y max: 23)]
		ifFalse: [self height: (e y max: 14)].

	yOffset := (self height // 2) - (ScratchTranslator centerOffsetForButtonWithFont: readout font) + 1.
	(((s indexOf: $.) = (s size - 2)) and: [((s indexOf: $.) = 0) not]) "one digit after the decimal point"
		ifTrue: [  "right-justify the string"
			w := (ScratchTranslator stringExtent: (s copyUpTo: $.) font: readout font) x.
			inset := (ScratchTranslator stringExtent: '.0' font: readout font) x.
			self isLarge ifTrue: [inset := inset + 1].
			readout position: self topRight - ((w + inset + 5) @ (-1 * yOffset))]
		ifFalse: [
			readout position: self position + (((self width - readoutWidth) // 2) @ yOffset)].
	(readout bottom > self bottom) ifTrue: [readout bottom: self bottom].
	(readout top < self top) ifTrue: [readout top: self top].

	isLarge ifFalse: [
		watcher  ifNotNil: [watcher layoutForViewer]].

	self layoutChanged.
