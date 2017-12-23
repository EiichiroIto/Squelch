interaction
yes
	"Yes button was pressed."

	| entry |
	entry := list selectedEntryOrNil.
	(entry notNil and: [entry entryIsDirectory]) ifTrue: [
		(newFileName isNil or: [newFileName contents size = 0]) ifTrue: [
			self setDirectory: entry entryName.
			choosingFolder ifTrue: [super yes].
			^ self]].
	ScratchFileChooserDialog setLastFolderTo: list currentDirectory forType: self type.
	^ super yes
