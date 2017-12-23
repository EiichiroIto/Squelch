other
delete

	super delete.
	(list isKindOf: ScratchFilePicker) ifTrue: [list stopPlayingSound].
