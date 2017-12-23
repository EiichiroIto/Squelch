accessing
shortcutButtonLabel: labelString action: actionSelector icon: aSymbol
	"Answer a new shortcut button with the given label and selector. A shortcut button has a folder icon on it. The button target will be me and it will use my button forms. Icon can be: #folderIcon, #folderCatIcon, #folderHouseIcon #folderPicIcon, #folderSoundIcon"
	"(DialogBoxMorph new shortcutButtonLabel: 'Yes' action: #beep isCat: true) openInWorld"

	| onForm offForm overForm button |
	onForm := ScratchFrameMorph skinAt: #dialogButtonFrameOver.
	offForm := ScratchFrameMorph skinAt: #dialogButtonFrame.
	overForm := ScratchFrameMorph skinAt: #dialogButtonFrameOver.

	button := ResizableToggleButton2 new
		offForm: offForm
		onForm: onForm.

	button addMorph: (ImageMorph new form: (ScratchFrameMorph skinAt: aSymbol)).

	^ (button
		label: labelString localized font: (ScratchFrameMorph getFont: #FolderShortcut);
		target: self;
		actionSelector: actionSelector;
		setLabelColor: (Color gray: 0.15)).
