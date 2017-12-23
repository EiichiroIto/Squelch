event handling
duplicate

	| dup |
	dup := self class new.
	dup width: self width.
	dup commentMorph contents: commentMorph contents.
	isShowing ifFalse: [dup toggleShowing].

	self world activeHand attachMorph: dup.
