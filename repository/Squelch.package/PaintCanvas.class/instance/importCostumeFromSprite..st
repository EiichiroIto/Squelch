private
importCostumeFromSprite: fName
	"Return the current costume from the give sprite file."

	| data  f importedStage |
	fName asFileReference isFile ifFalse: [^ nil].
	f := (FileStream readOnlyFileNamed: fName) binary.
	f ifNil: [^ nil].
	data := f contentsOfEntireFile.

	[importedStage := self extractProjectFrom: data] ifError: [^ nil].

	importedStage submorphs do: [:m |
		(m isKindOf: ScratchSpriteMorph) ifTrue: [
			^ m costumeForm]].

	^ nil
