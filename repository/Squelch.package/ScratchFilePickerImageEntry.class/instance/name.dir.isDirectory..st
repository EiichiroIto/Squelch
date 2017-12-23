initialization
name: aString dir: owningDirectory isDirectory: dirFlag

	| n truncated w eWidth |
	self color: Color transparent.
	self extent: 125@110.

	directory := owningDirectory.
	entryName := aString.
	entryIsDirectory := dirFlag.
	thumbnailReady := false.

	thumbnailMorph := ImageMorph new.
	entryIsDirectory
		ifTrue: [thumbnailMorph form: (ScratchFrameMorph skinAt: #bigFolderIcon)]
		ifFalse: [thumbnailMorph form: ((Form extent: 4@4 depth: 8) fillColor: Color transparent)].

	thumbnailMorph top: self bottom - thumbnailMorph height - 23.
	thumbnailMorph left: self left + ((self width - thumbnailMorph width) // 2).

	n := dirFlag ifTrue: [entryName] ifFalse: [entryName asFileReference basename].
	nameMorph := StringMorph contents: n font: (ScratchFrameMorph getFont: #FilePickerEntry).

	"trim file name to fit button, if necessary"
	truncated := false.
	eWidth := (ScratchTranslator stringExtent: '...' font: (ScratchFrameMorph getFont: #FilePickerEntryHighlighted)) x.
	w := 100 - eWidth.
	[((ScratchTranslator stringExtent: n font: nameMorph font) x) > w] whileTrue: [
		truncated := true.
		n := n copyFrom: 1 to: n size - 1].
	truncated ifTrue: [n := n, '...'].
	nameMorph contents: n.
	nameMorph bottom: self bottom - 2.
	self isHighlit
		ifTrue: [nameMorph left: self left + ((self width - nameMorph width - eWidth) // 2)]
		ifFalse: [nameMorph left: self left + ((self width - nameMorph width) // 2)].

	self addMorph: nameMorph.
	self addMorph: thumbnailMorph.
