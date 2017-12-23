looks ops
sayNothing
	"Delete my talk bubble if I have one."

	| talkBubble |
	(talkBubble := self valueOfProperty: #talkBubble) ifNil: [^ self].
	talkBubble delete.
	self setProperty: #talkBubble toValue: nil.
