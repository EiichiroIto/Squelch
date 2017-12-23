media
soleCostume: imageMedia
	"Make the given image my only costume."

	media := media select: [:item | item isImage not].
	self addMediaItem: imageMedia.
