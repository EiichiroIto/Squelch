other
export

	| triple form textBox fName f |
	triple := self newFormTextBoxAndRegPoint.
	triple ifNil: [^ self beep].  "empty drawing"
	form := triple first.
	textBox := triple second.
	(textBox isNil or: [textBox contents isEmpty]) ifFalse: [
		form := form deepCopy.
		textBox drawTextOn: (FormCanvas on: form)].

	fName := ''.
	fName := ScratchFileChooserDialog
		chooseNewFileDefault: fName
		title: 'File Name?'
		type: #costume.
	fName = #cancelled ifTrue: [^ self].
	fName size = 0 ifTrue: [^ self].

	"make sure that file can be created"
	f := StandardFileStream newScratchFileNamed: fName.
	f ifNil: [^ self].
	f close.
	FileDirectory default deleteFileNamed: f fullName.

	form colorsUsed size < 255 ifTrue: [
		(fName asLowercase endsWith: '.gif')
			ifTrue: [fName := fName]
			ifFalse: [fName := fName, '.gif'].
		GIFReadWriter putForm: form colorReduced8Bit onFileNamed: fName.
		^ self].
	(fName asLowercase endsWith: '.bmp')
		ifTrue: [fName := fName]
		ifFalse: [fName := fName, '.bmp'].
	(form asFormOfDepth: 32) writeBMPFileNamed: fName.
