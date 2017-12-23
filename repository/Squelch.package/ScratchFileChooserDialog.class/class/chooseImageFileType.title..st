instance creation
chooseImageFileType: type title: aString
	"ScratchFileChooserDialog chooseImageFileType: #costume title: 'Costume'"

	| m |
	ScratchFileChooserDialog deleteDuplicates.
	m := self new
		createFileChooserLayout: false;
		showThumbnails: true;
		type: type;
		extensions: #(gif jpeg jpg bmp png);
		title: aString;
		listExtent: 550@300.

	"allow sprites to be imported into the paint editor:"
	aString = 'Import Image' ifTrue: [
		m extensions: #(gif jpeg jpg bmp png sprite)].

	^ m getUserResponse
