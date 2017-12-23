accessing
clearThumbnailReady
	"Clear my thumbnailReady flag and report a change. Because it contains a 'self changed', this method should be called from the main UI thread, not from the background process to avoid potential race conditions."

	thumbnailMorph top: self bottom - thumbnailForm height - 23.
	thumbnailMorph left: self left + ((self width - thumbnailForm width) // 2).
	thumbnailMorph form: thumbnailForm.

	thumbnailReady := false.
	self changed.
