uploading
compressMediaForUpload
	"Compress my media prior to uploading this project."

	self canonicalizeSoundsBits: 4 saveOriginal: true.
	self canonicalizeImagesQuality: 90 saveOriginal: true.

