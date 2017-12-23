instance creation
deleteDuplicates
	"If another file chooser dialog box is already opened, delete it"

	World submorphs do: [:i | 
		(i isKindOf: ScratchFileChooserDialog) ifTrue: [i delete]].
