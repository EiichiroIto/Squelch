event handling
presentMenu
	"Pop up a menu of choices."

	| eventNames sFrame menu choice s |
	eventNames := #().
	(sFrame := self meOrOwnerThatIsA: ScratchFrameMorph)
		ifNotNil: [eventNames := sFrame workPane allEventNames].

	menu := MenuMorph new.
	menu target: [ :v | choice := v ].
	eventNames do: [:n | menu add: n selector: #value: argument: n asString].
	menu addLine.
	menu add: ('new' localized, ScratchTranslator ellipsesSuffix) selector: #value: argument: #newEvent.
	menu invokeAt: ActiveHand position in: self world.

	choice ifNil: [^ self].
	choice == #newEvent ifTrue: [
		s := StringDialog ask: 'Message name:'.
		s size = 0 ifTrue: [^ self].
		^ self eventName: s].

	self eventName: choice.
