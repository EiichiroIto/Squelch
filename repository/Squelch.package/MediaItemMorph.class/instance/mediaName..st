accessing
mediaName: name

	| newName sFrame |
	newName := name.
	newName := self scratchObj unusedMediaNameFromBaseName: newName forMedia: self media.
	media mediaName: newName.
	nameMorph contents: newName.
	(sFrame := self meOrOwnerThatIsA: ScratchFrameMorph) ifNotNil: [
		sFrame viewerPane refresh].
