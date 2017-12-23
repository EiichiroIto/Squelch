accessing
showScrollbar: aBoolean
	"Show or hide my scrollbar."

	aBoolean = (scrollbar owner = self) ifTrue: [^ self].

	aBoolean
		ifTrue: [self addMorph: scrollbar]
		ifFalse: [scrollbar delete].

	self extent: self extent.  "fix layout"
