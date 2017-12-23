file ops
loadFile: relativeFilePath
	"Load an image or movie from the file with the given name. If the movie has sound, this intializes the sound as well."

	self basicLoadFile: relativeFilePath.

	"reset fade, pan, zoom, and sound"
	fade := 100.
	zoom := 100.
	hPan := vPan := 0.

	"set frame rate"
	movieFile ifNotNil: [
		movieFile hasVideo
			ifTrue: [msecsPerFrame := 1000.0 / (movieFile videoFrameRate: 0)]
			ifFalse: [msecsPerFrame := 1000]].  "audio only"

	outForm := origForm deepCopy.
	self showFrame: 1.
