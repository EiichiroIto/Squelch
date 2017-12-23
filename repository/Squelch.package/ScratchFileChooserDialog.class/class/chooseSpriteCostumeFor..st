instance creation
chooseSpriteCostumeFor: aScratchFrameMorph
	"ScratchFileChooserDialog chooseSpriteCostumeFor: nil"

	| m |
	ScratchFileChooserDialog deleteDuplicates.
	m := self new
		createFileChooserLayout: false;
		title: 'New Sprite';
		showThumbnails: true;
		type: #costume;
		extensions: #(gif jpeg jpg bmp png sprite);
		scratchFrame: aScratchFrameMorph;
		listExtent: 550@300.

	^ m getUserResponse
