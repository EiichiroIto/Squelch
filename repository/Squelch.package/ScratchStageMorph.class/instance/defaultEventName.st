scratch processes/events
defaultEventName
	"Answer a default event name for message send and receive blocks."

	| evtNames |
	evtNames := self allEventNames.
	^ evtNames size = 0 ifTrue: [''] ifFalse: [evtNames first]
