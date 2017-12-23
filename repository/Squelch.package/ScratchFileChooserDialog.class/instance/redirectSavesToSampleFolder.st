accessing
redirectSavesToSampleFolder
	"Check to see if we are about to save into the Sample projects directory. If so, change the default location to the user's project folder."

	(ScratchFileChooserDialog lastFolderIsSampleProjectsFolder) ifTrue: [
		self setDirectory: ScratchFileChooserDialog userScratchProjectsDir].
