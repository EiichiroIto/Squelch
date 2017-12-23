private
thumbnailStylePageFor: allNames
	"Answer a new contents page as tableau of thumbnails."

	| page dirNames morphsToAdd leftMargin rightMargin x y m thumbnailCache f |
	page := Morph new
		color: self color;
		width: self width - 20.

	dirNames := currentDir directoryNames asSet.
	thumbnailCache := ThumbnailCache new directory: currentDir.
	thumbnailCache readThumbnailFile; updateThumbnails.
	morphsToAdd := OrderedCollection new: 1000.
	leftMargin := page left + 7.
	rightMargin := page width - 75.
	x := leftMargin.
	y := page top + 5.
	allNames do: [:n |
		m := ScratchFilePickerImageEntry new
			name: n dir: currentDir isDirectory: (dirNames includes: n).
		m
			borderWidth: 0;
			useRoundedCorners.
		f := thumbnailCache thumbnailFor: n.
		f ifNotNil: [m thumbnailForm: f].
		morphsToAdd add: (m position: x@y).
		x := x + m width.
		x > rightMargin ifTrue: [
			x := leftMargin.
			y := y + m height]].

	page addAllMorphs: morphsToAdd.
	^ page
