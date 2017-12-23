media
importImage
	"Import a new image from a file and add it to my media (concatenating the name if it is greater than 16 characters long). If the file is an animated gif, import all frames of the gif as separate costumes."

	| title result el ext fList isFirst newName type |
	(self isKindOf: ScratchStageMorph)
		ifTrue: [type := #background. title := 'Import Background']
		ifFalse: [type := #costume. title := 'Import Costume'].
	result := ScratchFileChooserDialog
		chooseImageFileType: type
		title: title.
	result = #cancelled ifTrue: [^ self].

	fList := OrderedCollection new.
	ext := result asFileReference extension asLowercase.
	ext = 'gif'
		ifTrue: [[fList := (GIFReadWriter new on: (FileStream readOnlyFileNamed: result)) nextImageSet] ifError: [^ self]]
		ifFalse: [[fList addLast: (Form fromFileNamed: result)] ifError: [^ self]].

	isFirst := true.
	fList do: [:f |
		el := ImageMedia new form: (ScratchFrameMorph scaledFormForPaintEditor: f).
		newName := self mediaNameFromFileName: result default: 'costume'.
		el mediaName: (self unusedMediaNameFromBaseName: newName).
		media addLast: el.
		isFirst ifTrue: [isFirst := false. self lookLike: el mediaName.]].

	self updateMediaCategory.
