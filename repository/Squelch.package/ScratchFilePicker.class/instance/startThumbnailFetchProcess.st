private-thumbnails
startThumbnailFetchProcess
	"Start a background process to fetch thumbnails. This process runs at lower priority than the UI thread. The step method looks for thumbnails that have become ready and updates the display."

	thumbnailFetchProcess ifNotNil: [thumbnailFetchProcess terminate].
	thumbnailFetchProcess := [self thumbnailFetchLoop] newProcess.
	thumbnailFetchProcess priority: Processor userBackgroundPriority.
	thumbnailFetchProcess resume.
