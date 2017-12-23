menu/button ops
exportMedia

	| result title type |
	media isMovie ifTrue: [^ self].
	(self scratchObj isKindOf: ScratchStageMorph) ifTrue: 
		[type := #background. title := 'Export Background'].
	(self scratchObj isKindOf: ScratchSpriteMorph) ifTrue: 
		[type := #costume. title := 'Export Costume'].
	media isSound ifTrue: [type := #sound. title := 'Export Sound'].
	result := ScratchFileChooserDialog
		chooseNewFileDefault: media mediaName
		title: title
		type: type.
	result = #cancelled ifTrue: [^ self].
	result size > 0 ifTrue: [media exportFilename: result for: self scratchObj].
