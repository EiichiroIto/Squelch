uploading
revertToUncompressedMedia
	"Revert to uncomprssed media after uploading this project."

	self allProjectMedia do: [:m | m revertToUncompressed].
