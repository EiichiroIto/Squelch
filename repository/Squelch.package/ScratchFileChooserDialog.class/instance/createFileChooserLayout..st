accessing
createFileChooserLayout: allowNewFile
	"Create the file chooser dialog box."

	list := ScratchFilePicker new.
	self removeAllMorphs.
	bottomSpacer delete.
	bottomSpacer := nil.
	mainColumn addMorphBack: list.

	self title: 'Open'.
	allowNewFile ifTrue: [
		self title: 'Save As'.
		newFileTitle := StringMorph new
			contents: 'New Filename:' localized, ' ';
			color: (Color gray: 0.3);
			font: (ScratchFrameMorph getFont: #FileChooserNewFileTitle).
		newFileName := StringFieldMorph new
			font: (ScratchFrameMorph getFont: #FileChooserNewFilename);
			color: (Color r: (211/255) g: (214/255) b: (216/255));
			width: 180.
		newTitleBin
			addMorphBack: newFileTitle;
			addMorphBack: (Morph new extent: (5@5); color: Color transparent);
			addMorphBack: newFileName;
			addMorphBack: (AlignmentMorph newSpacer: Color transparent).
			ScratchTranslator isRTL
		ifTrue: [newTitleBin submorphs reversed do: [:m |
			m delete.
			newTitleBin addMorphBack: m]]].

	mainColumn
		addMorphBack: newTitleBin;
		addMorphBack: buttonRow.

	self
		addMorphBack: shortcutColumn;
		addMorphBack: mainColumn;
		addMorphBack: fileInfoColumn.
