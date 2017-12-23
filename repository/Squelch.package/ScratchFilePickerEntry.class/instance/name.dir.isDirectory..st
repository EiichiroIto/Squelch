initialization
name: aString dir: owningDirectory isDirectory: dirFlag

	| icon m n |
	directory := owningDirectory.
	entryName := aString.
	entryIsDirectory := dirFlag.

	entryIsDirectory
		ifTrue: [icon := ScratchFrameMorph skinAt: #folderIcon]
		ifFalse: [icon := ScratchFrameMorph skinAt: #fileIcon].

	n := dirFlag ifTrue: [entryName] ifFalse: [(directory / entryName) basename].
	nameMorph := StringMorph contents: n font: (ScratchFrameMorph getFont: #FilePickerEntry).
	self addMorph: (nameMorph position: self position + (28@3)).

	m := ImageMorph new form: icon.
	self addMorph: (m position: self position + (6@((nameMorph height - 6) // 2))).

	highlit := false.
	self extent: 200@(nameMorph height + 6).
