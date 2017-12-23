private
listStylePageFor: allNames
	"Answer a new contents page as a column of list style entries."

	| page dirNames morphsToAdd x y m |
	page := Morph new
		color: self color;
		width: self width - 20.

	dirNames := currentDir directoryNames asSet.
	morphsToAdd := OrderedCollection new: 1000.
	x := page left + 7.
	y := page top + 5.
	allNames do: [:n |
		m := ScratchFilePickerEntry new
			name: n dir: currentDir isDirectory: (dirNames includes: n);
			width: self width - 60;
			color: self color;
			borderWidth: 0;
			useRoundedCorners.
		morphsToAdd add: (m position: x@y).
		y := y + m height].

	page addAllMorphs: morphsToAdd.
	^ page
