instance creation
saveScratchFileFor: aScratchFrameMorph
	"Choose a file for saving the current Scratch project file. Display the thumbnail and info string for the current project and allow the info string to be edited. Answer the full name of the file in which to save the project or #cancelled if the operation is cancelled."
	"ScratchFileChooserDialog saveScratchFileFor: nil"

	| m result |
	ScratchFileChooserDialog deleteDuplicates.
	m := self new
		createScratchFileChooserFor: aScratchFrameMorph saving: true;
		type: #project;
		redirectSavesToSampleFolder.

	result := m getUserResponseForNewFile.
	result = #cancelled ifTrue: [^ result].

	(result asLowercase endsWith: '.sb') ifFalse: [result := result, '.sb'].
	^ result
