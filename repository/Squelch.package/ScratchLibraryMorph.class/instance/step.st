stepping
step
	"Update my thumbnail list if morphs have been added or deleted."

	| sFrame workPane morphsWithThumbnails doLayout workPaneObjects |
	(sFrame := self meOrOwnerThatIsA: ScratchFrameMorph) ifNil: [^ self].
	sFrame paintingInProgress
		ifTrue: [^ self]
		ifFalse: [scrollPane owner ifNil: [self addMorph: scrollPane]].

	workPane := sFrame workPane.

	"remove thumbnails for any objects that have been deleted"
	morphsWithThumbnails := IdentitySet new.
	doLayout := false.
	scrollPane contents submorphs do: [:m |
		(m target isNil or: [m target owner isNil])
			ifTrue: [m delete. doLayout := true]
			ifFalse: [morphsWithThumbnails add: m target]].
	stagePane submorphs do: [:m |
		(m target isNil or: [m target owner isNil])
			ifTrue: [m delete. doLayout := true]
			ifFalse: [morphsWithThumbnails add: m target]].

	"add thumbnail for the background, if necessary"
	(morphsWithThumbnails includes: workPane) ifFalse: [
		self addThumbnailFor: workPane.
		doLayout := true].

	"add thumbnails for any new objects"
	workPaneObjects := workPane sprites select: [:s |
		(s isKindOf: ScriptableScratchMorph) and: [s isScriptable & s isClone not]].
	workPaneObjects do: [:m |
		(morphsWithThumbnails includes: m) ifFalse: [
			self addThumbnailFor: m.
			doLayout := true]].

	doLayout ifTrue: [
		self changed.
		self fixLayout.
		self isInWorld ifTrue: [self world startSteppingSubmorphsOf: self]].

	self updateHighlight.
