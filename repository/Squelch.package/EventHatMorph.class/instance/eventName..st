other
eventName: aString
	"Set my event name. Used for initialization."

	scriptNameMorph eventName: aString.
	self fixBlockLayout.
	(self meOrOwnerThatIsA: ScratchViewerMorph) ifNotNil:[
		(self meOrOwnerThatIsA: ScratchViewerMorph) updateContents].
