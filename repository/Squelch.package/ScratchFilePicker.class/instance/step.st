stepping
step
	"If I am showing thumbnails, poll my contents for thumbnails that are ready for display."

	showThumbnails ifTrue: [
		(Delay forMilliseconds: 10) wait.
		contentsPaneMorph contents submorphsDo: [:m |
			m thumbnailReady ifTrue: [m clearThumbnailReady]]].

	fetchInProgress ifTrue: [
		currentDir fetchInProgress ifFalse: [
			self getFetchedServerDirectoryContents.
			fetchInProgress := false]].

	scratchProjectFetcher ifNotNil: [
		self checkForScratchInfoFetchDone].
