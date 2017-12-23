event handling
stageShot

	| result |
	result := ScratchFileChooserDialog
		chooseNewFileDefault: ''
		title: 'Save Stage Shot'
		type: #stageShot.
	result = #cancelled ifTrue: [^ self].
	result size > 0 ifTrue: [self exportFileName: result].
