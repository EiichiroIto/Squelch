looks ops
bubble: obj thinkFlag: thinkFlag promptFlag: promptFlag
	"Make a talk bubble with the given string."

	| s talkBubble |
	self sayNothing.

	obj isNumber
		ifTrue: [
			obj isInteger
				ifTrue: [s := obj printString]
				ifFalse: [s := (obj asFloat roundTo: 0.01) printString]]
		ifFalse: [(obj isKindOf: Boolean)
			ifTrue: [s := obj asString localized]
			ifFalse: [s := obj asString]].
	(s skipDelimiters: ' 	' startingAt: 1) > s size ifTrue: [^ self].
	s size < 5 ifTrue: [s := s, ' '].

	talkBubble := ScratchTalkBubbleMorph new message: s.
	thinkFlag ifTrue: [talkBubble beThoughtBubble: true].
	promptFlag ifTrue: [talkBubble bePrompt: true].
	talkBubble lock; position: self position.
	self setProperty: #talkBubble toValue: talkBubble.
	self addMorphFront: talkBubble.
	self positionTalkBubble.
	World displayWorldSafely.
	^ talkBubble
