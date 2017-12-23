startup
setDefaultSprite
	"Look for default sprite in Media directory. If none found, use the DefaultCatSprite"

	| d f data importedProject fName |

	DefaultSprite := nil.

	"if dfault.sprite exists, use that"
	d := ScratchFileChooserDialog getDefaultFolderForType: #costume.
	(d asFileReference / 'default.sprite') exists ifTrue: [
		f := (FileStream readOnlyFileNamed: (d asFileReference / 'default.sprite') pathString) binary.
		f ifNotNil: [
			data := f contentsOfEntireFile.
			importedProject := [self extractProjectFrom: data] ifError: [nil].
			importedProject ifNil: [^ self].
			importedProject submorphs do: [:m |
				(m isKindOf: ScratchSpriteMorph) ifTrue: [DefaultSprite := m].
				^ self]]].

	"if default image exists, use the image and add 'pop' sound"
	#(gif png jpg bmp) do: [:e |
		fName := 'default.', e.
		(d asFileReference / fName) exists ifTrue: [
			DefaultSprite := ScratchSpriteMorph new
				importMedia: (d asFileReference / fName) pathString;
				addMediaItem: (SoundMedia new
					mediaName: 'pop' localized;
					sound: ScratchSpriteMorph popSound).
			^ self]].
