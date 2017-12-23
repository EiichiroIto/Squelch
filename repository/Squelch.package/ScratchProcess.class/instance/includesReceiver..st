accessing
includesReceiver: anObject
	"Answer true if I have the given object as a block receiver."

	self stackAsArray do: [:frm |
		((frm respondsTo: #receiver) and: [frm receiver == anObject])
			ifTrue: [^ true]].
	^ false

