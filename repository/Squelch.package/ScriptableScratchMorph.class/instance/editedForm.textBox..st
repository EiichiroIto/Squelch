media
editedForm: aForm textBox: aMultilineTextMorph

	| newImage |
	(costume isKindOf: ImageMedia) ifFalse: [
		newImage := ImageMedia new
			form: aForm;
			mediaName: (self unusedMediaNameFromBaseName: costume mediaName).
		media addLast: newImage.
		self lookLike: newImage mediaName].

	costume form: aForm.  "replace the current costume"
	costume textBox: aMultilineTextMorph.
	self lookLike: costume mediaName.
	self viewBlocksAndScripts.
	self updateMediaCategory.
