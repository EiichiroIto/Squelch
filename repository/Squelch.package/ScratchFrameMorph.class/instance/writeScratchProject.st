file read/write
writeScratchProject
	"Write this Scratch project to the file named projectFile in the project directory. Called by saveScratchProject."

	| oldScriptsTarget oldTab oldViewerCategory oldPosition saveError out |
	self stopAll.
	self world ifNotNil: [self world activeHand newKeyboardFocus: nil].  "terminates active editor"

	"share duplicate sounds and images"
	self canonicalizeSoundsBits: nil saveOriginal: false.
	self canonicalizeImagesQuality: nil saveOriginal: false.

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

	saveError := nil.
	[	out := FileStream newFileNamed: (self unusedNameStartingWith: 'tmp' in: projectDirectory).
		out
			ifNil: [saveError := 'Folder may be locked or read-only']
			ifNotNil: [
				out binary.
				out nextPutAll: 'ScratchV02' asByteArray.
				self storeProjectInfoOn: out.
				ObjStream new storeObj: workPane on: out.
				out close].
	] ifError: [:err :rcvr |
		out ifNotNil: [
			[	out close.
				projectDirectory deleteFileNamed: out localName.
			] ifError: []].  "clean up, ignoring any errors"
		saveError := err].

	workPane allMorphsDo: [:m |
		(m isKindOf: ScriptableScratchMorph) ifTrue: [
			m convertTuplesToStacks]].

	self addMorph: (workPane position: oldPosition).
	oldScriptsTarget ifNil: [oldScriptsTarget := workPane].
	oldScriptsTarget viewBlocksAndScripts.
	scriptsPane tabPane currentTab: oldTab.
	viewerPane currentCategory: oldViewerCategory.
	self updatePenPositions.

	saveError
		ifNil: [
			justSaved := true.
			self updateProjectName.			
			(projectDirectory / projectName) deleteIfAbsent: [].
			[(projectDirectory / out localName) renameTo: projectName]
				ifError: [^ self inform: 'Save failed' withDetails: 'Is the folder read-only?' localized].
			"projectDirectory setMacFileNamed: projectName type: 'STsb' creator: 'MITS'"]
		ifNotNil: [
			projectName := ''.
			self inform: 'Save failed' withDetails: saveError].
