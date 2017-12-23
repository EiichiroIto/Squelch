file ops
basicLoadFile: fullName
	"Load an image or movie from the file with the given name. If the movie has sound, this intializes the sound as well."

	| extension sndIcon |
	(FileDirectory default fileExists: fullName)
		ifFalse: [^ self inform: 'File not found: ', fullName].

	self closeMovieFile.
	extension := (FileDirectory extensionFor: fullName) asLowercase.

	((extension = 'jmv') and:
	 [JPEGMovieFile isJPEGMovieFile: fullName]) ifTrue: [
		movieFile := JPEGMovieFile new openFileNamed: fullName.
		movieFile hasAudio ifTrue: [
			sound := movieFile audioPlayerForChannel: 1]].

	((#('mpg' 'mpeg' 'mp3') includes: extension) and:
	 [MPEGFile isFileValidMPEG: fullName]) ifTrue: [
		movieFile := MPEGFile openFile: fullName.
		movieFile hasAudio ifTrue: [
			sound := movieFile audioPlayerForChannel: 1]].

	movieFile ifNotNil: [
		movieFile hasVideo
			ifTrue: [
				origForm := Form
					extent: (movieFile videoFrameWidth: 0)@(movieFile videoFrameHeight: 0)
					depth: (Display depth max: 16)]
			ifFalse: [  "audio only"
				msecsPerFrame := 10000.
				origForm := (Form extent: 32@24 depth: 4) fillColor: Color blue.
				sndIcon := ScratchFrameMorph skinAt: #scratchSound.
				sndIcon displayOn: origForm at: (origForm extent - sndIcon extent) // 2.
				sound ifNil: ["no audio either! close the file"
					movieFile closeFile.
					movieFile := nil]].
		outForm := origForm deepCopy.
		fileName := fullName.
		^ self].

	"if not a movie, try to open image file"
	origForm := Form fromFileNamed: fullName.
	outForm := origForm deepCopy.
	fileName := fullName.
