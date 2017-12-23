media
importSound
	"Import a new sound from a file and add it to my media."

	| result el newName |
	result := ScratchFileChooserDialog
		chooseExistingFileType: #sound
		extensions: #(aif aiff au wav mp3)
		title: 'Import Sound'.

	result = #cancelled ifTrue: [^ self].

	el := [SoundMedia new loadFile: result]
		ifError: [:err :rcvr |
			DialogBoxMorph warn: err.
			nil].
	el ifNil: [^ self].

	newName := self mediaNameFromFileName: result default: 'sound'.
	el mediaName: (self unusedMediaNameFromBaseName: newName).
	media addLast: el.
	self updateMediaCategory.
