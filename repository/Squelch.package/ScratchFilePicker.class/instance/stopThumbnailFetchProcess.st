private-thumbnails
stopThumbnailFetchProcess

	thumbnailFetchProcess ifNotNil: [
		thumbnailFetchProcess terminate.
		thumbnailFetchProcess := nil].
