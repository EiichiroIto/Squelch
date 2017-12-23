accessing
importSpriteOrProject: fileNameOrData
	"Read the sprite or project file and merge into the current project."

	| data f importedStage defaultForm defaultSound oldName oldPosition |
	data := fileNameOrData.
	(data isKindOf: String) ifTrue: [  "read the contents of a local file"
		fileNameOrData asFileReference isFile ifFalse: [^ self].
		f := (FileStream readOnlyFileNamed: fileNameOrData) binary.
		f ifNil: [^ self].
		data := f contentsOfEntireFile].

	[importedStage := self extractProjectFrom: data] ifError: [^ self].

	"fix references to old stage"
	importedStage allMorphsDo: [:m |
		(m isKindOf: WatcherMorph) ifTrue: [m mapReceiver: importedStage to: workPane].
		(m isKindOf: ScriptableScratchMorph) ifTrue: [
			m blocksBin submorphs do: [:stack |
				(stack isKindOf: BlockMorph) ifTrue: [
					stack blockSequence do: [:b | b mapReceiver: importedStage to: workPane]]]]].

	"add global variables from importated stage to my stage"
	importedStage varNames do: [:v |
		workPane addVariable: v value: (importedStage getVar: v)].

	"add imported stage scripts"
	importedStage blocksBin submorphs do: [:stack |
		(stack isKindOf: BlockMorph) ifTrue: [workPane addStack: stack fullCopy]].

	"add imported background costumes and scripts to my stage, filtering out default items"
	defaultForm := workPane defaultImageMedia form hibernate.
	defaultSound := SoundMedia new sound.
	importedStage media do: [:media |
		(media isImage and: [media form hibernate bits ~= defaultForm bits])
			ifTrue: [workPane addMediaItem: media].
		(media isSound and: [media sound samples ~= defaultSound samples])
			ifTrue: [workPane addMediaItem: media]].

	importedStage submorphs do: [:m |
		(m isKindOf: ScratchSpriteMorph) ifTrue: [
			oldName := m objName.
			oldPosition := m position - m owner position + (47@55).  "jm: I am not sure why this offset is needed. It's the rotation center of the default costume..."
			self addAndView: m.  "assigns a new name"
			m objName: oldName.
			m position: workPane topLeft + oldPosition.
			m layoutChanged]].

	workPane layoutChanged.
