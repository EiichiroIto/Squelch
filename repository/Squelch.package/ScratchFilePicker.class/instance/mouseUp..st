event handling
mouseUp: evt
	"Handle a mouse up. If the mouse went down on an entry that was already selected, open that entry. (Like a double-click, but not sensitive to timing.) If the entry 'double-clicked' was a directory, open that directory. If it was a file, set finalSelection to true to cause the dialog to open the file."

	| singleClickOpensDirs playSelectedSound entry ext |
	singleClickOpensDirs := false.
	playSelectedSound := true.

	lastUpMSecs := Time millisecondClockValue.

	(sound notNil and: [sound isPlaying]) ifTrue: [
		self stopPlayingSound.
		isDoubleClick := false.
		wasSelected ifTrue: [playSelectedSound := false]].

	entry := contentsPaneMorph contents submorphs
		detect: [:m | m containsPoint: evt cursorPoint]
		ifNone: [^ self].

	entry entryIsDirectory ifTrue: [
		singleClickOpensDirs | isDoubleClick ifTrue: [
			self currentDirectory: (currentDir / entry entryName)].
		^ self].

	ext := entry entryName asFileReference extension asLowercase.
	playSelectedSound :=
		(playSelectedSound & extensions notNil) and: [extensions includes: 'wav'].

	playSelectedSound & isDoubleClick not ifTrue: [
		(extensions includes: ext) ifTrue: [
			self startPlayingSound: (currentDir / entry entryName) pathString]].

	finalSelection := isDoubleClick.
	finalSelection ifTrue: [(self meOrOwnerThatIsA: ScratchFileChooserDialog) yes].
