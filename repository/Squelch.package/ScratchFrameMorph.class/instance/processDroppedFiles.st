stepping
processDroppedFiles
	"Process any files that have been dropped onto me."

	| droppedFiles m dropPoint fName |
	droppedFiles := FileStream droppedFiles.
	droppedFiles size = 0 ifTrue: [^ self].
	(m := self viewerPane target) ifNil: [^ self].
	dropPoint := droppedFiles first.

	(droppedFiles copyFrom: 2 to: droppedFiles size) do: [:file |
		file close.
		fName := file fullName.
		((fName asLowercase endsWith: '.scratch') | (fName asLowercase endsWith: '.sb'))
			ifTrue: [self openScratchDroppedProjectNamed: fName]
			ifFalse: [
				(fName asLowercase endsWith: '.sprite')
					ifTrue: [self importSpriteOrProject: fName]
					ifFalse: [m importMedia: fName]]].
