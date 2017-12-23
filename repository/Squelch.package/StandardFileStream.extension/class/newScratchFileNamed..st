*Squelch
newScratchFileNamed: fileName
	"Create a new file with the given name, and answer a stream opened for writing on that file. If the file already exists, ask the user what to do."

	| dir choice newName fullName result ext |
	fullName := self fullName: fileName.
	(self isAFileNamed: fullName) ifFalse: [
		result := self new open: fullName forWrite: true.
		result ifNil: [DialogBoxMorph inform: 'Could not write file' withDetails: 'Is the folder read-only?' localized].
		^ result].

	"file already exists:"
	dir := fullName asFileReference parent.
	choice := DialogBoxMorph
		askWithCancel: 'The file name already exists. Overwrite existing file?'.
	choice = #cancelled ifTrue: [^ nil].

	choice
		ifTrue: [
			fullName asFileReference deleteIfAbsent: [ ].
			result := self new open: fullName forWrite: true.
			result ifNil: [DialogBoxMorph inform: 'Could not write file' withDetails: 'Is the folder read-only?' localized].
			^ result]
		ifFalse: [
			newName := StringDialog askWithCancel: 'New file name?'.
			newName size = 0 ifTrue: [^ nil].
			fullName := (dir / newName) pathString.
			ext := fileName asFileReference extension.
			(ext size > 0 and: [(newName endsWith: ext) not]) ifTrue: [
				fullName := fullName, '.', ext].

			^ self newScratchFileNamed: fullName].
