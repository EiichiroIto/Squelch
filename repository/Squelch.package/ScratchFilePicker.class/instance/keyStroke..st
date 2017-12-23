event handling
keyStroke: evt
	"Handle up/down arrow keys."

	| ch m entry |
	freezeFocus ifTrue: [^ self].

	ch := evt keyValue.

	ch = 9 ifTrue: [  "tab"
		(m := self meOrOwnerThatIsA: DialogBoxMorph) ifNotNil: [m tabToNextField: evt].
		^ self].

	ch = 27 ifTrue: [  "escape key"
		(m := self meOrOwnerThatIsA: DialogBoxMorph) ifNotNil: [m escapeKeyPressed: evt].
		^ self].

	((ch = 1) | (ch = 11)) ifTrue: [ "home or page up"
		self selectedEntryOrNil ifNotNil: [self selectedEntryOrNil highlight: false].
		^ self highlightAndScrollToEntry: contentsPaneMorph contents submorphs first].

	((ch = 4) | (ch = 12)) ifTrue: [ "end or page down"
		self selectedEntryOrNil ifNotNil: [self selectedEntryOrNil highlight: false].
		^ self highlightAndScrollToEntry: contentsPaneMorph contents submorphs last].

	((ch = 8) | (ch = 127)) ifTrue: [ "delete key"
		self deleteDirectory].

	((ch = 10) | (ch = 13)) ifTrue: [  "cr, lf, or enter key"
		(entry := self selectedEntryOrNil) ifNil: [^ self].
		(entry entryIsDirectory and:
		 [(owner isKindOf: ScratchFileChooserDialog)])
			ifTrue: [self currentDirectory: (currentDir directoryNamed: entry entryName)]
			ifFalse: [(self meOrOwnerThatIsA: ScratchFileChooserDialog) yes].
		^ self].

	(ch = 28) ifTrue: [^ self changeSelectionIndexBy: -1].	"left"
	(ch = 29) ifTrue: [^ self changeSelectionIndexBy: 1].	"right"
	(ch = 30) ifTrue: [  "up"
		showThumbnails
			ifTrue: [^ self changeSelectionIndexBy: -4]
			ifFalse: [^ self changeSelectionIndexBy: -1]].
	(ch = 31) ifTrue: [  "down"
		showThumbnails
			ifTrue: [^ self changeSelectionIndexBy: 4]
			ifFalse: [^ self changeSelectionIndexBy: 1]].

	((ch between: $a asciiValue and: $z asciiValue) or:
	 [ch between: $A asciiValue and: $Z asciiValue])
		ifTrue: [^ self scrollToFileStartingWith: ch asCharacter asLowercase].
