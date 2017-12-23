private
getFetchedServerDirectoryContents
	"Generate and layout the morphs in my contents pane for the files and folder in the recently server directory contents. If the fetch generated an error, display the error."
	"Assume that the page morph exists already."

	| page m morphsToAdd x y nm isDir |
	page := contentsPaneMorph contents.

	currentDir fetchSucceeded ifFalse: [
		m := StringMorph contents: 'Failed: ', currentDir fetchFailureReason.
		page addMorph: (m position: page topLeft + (10@30)).
		^ self].

	morphsToAdd := OrderedCollection new: 1000.
	x := page left + 7.
	y := page top + 5.
	currentDir allNames do: [:n |
		nm := n.
		isDir := true.
		(n asLowercase endsWith: '.scratch') ifTrue: [
			nm := n copyFrom: 1 to: n size - '.scratch' size.
			isDir := false].
		(n asLowercase endsWith: '.sb') ifTrue: [
			nm := n copyFrom: 1 to: n size - '.sb' size.
			isDir := false].
		m := ScratchFilePickerEntry new
			name: nm dir: currentDir isDirectory: isDir;
			width: self width - 60;
			color: self color.
		morphsToAdd add: (m position: x@y).
		y := y + m height].

	feedbackMorph delete.
	page removeAllMorphs.
	page addAllMorphs: morphsToAdd.
	self changeSelectionIndexBy: 1.
