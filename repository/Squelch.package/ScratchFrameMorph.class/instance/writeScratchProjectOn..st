uploading
writeScratchProjectOn: aStream
	"Write this Scratch project in a serialized form on the given stream."

	| oldScriptsTarget oldTab oldViewerCategory oldPosition storeError |
	self stopAll.
	self world ifNotNil: [self world activeHand newKeyboardFocus: nil].  "terminates active editor"

	oldScriptsTarget := scriptsPane target.
	oldTab := scriptsPane tabPane currentTab.
	oldViewerCategory := viewerPane currentCategory.
	scriptsPane target: nil.

	workPane updateSpritesList.
	oldPosition := workPane position.
	workPane delete; position: 0@0.
	self updatePenPositions.

	ScriptableScratchMorph buildBlockSpecDictionary.
	workPane allMorphsDo: [:m |
		(m isKindOf: ScriptableScratchMorph) ifTrue: [
			m blocksBin allMorphsDo: [:b |
				(b isKindOf: BlockMorph) ifTrue: [b stop]].
			m convertStacksToTuples]].

	storeError := nil.
	[	aStream nextPutAll: 'ScratchV02' asByteArray.
		self storeProjectInfoOn: aStream.
		ObjStream new storeObj: workPane on: aStream.
	] ifError: [:err :rcvr | storeError := err].

	workPane allMorphsDo: [:m |
		(m isKindOf: ScriptableScratchMorph) ifTrue: [
			m convertTuplesToStacks]].

	self addMorph: (workPane position: oldPosition).
	oldScriptsTarget ifNil: [oldScriptsTarget := workPane].
	oldScriptsTarget viewBlocksAndScripts.
	scriptsPane tabPane currentTab: oldTab.
	viewerPane currentCategory: oldViewerCategory.
	self updatePenPositions.

	storeError ifNotNil: [self error: storeError].
