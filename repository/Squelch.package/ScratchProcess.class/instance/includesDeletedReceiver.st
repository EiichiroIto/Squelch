accessing
includesDeletedReceiver
	"Answer true if I contain a block whose receiver has been deleted."

	self stackAsArray do: [:b |
		((b isKindOf: CommandBlockMorph) and:
		 [b receiver owner isNil])
			ifTrue: [^ true]].

	^ false
