accessing
loadFile: fName
	"Read my samples from a sound file."

	| snd errorString sndName mergedBuf |
	fName asFileReference isFile
		ifFalse: [^ self inform: 'File not found' withDetails: fName].

	errorString := nil.
	sndName := fName asFileReference basename.
	UIManager default informUserDuring: [:bar |
		bar label: 'Reading ', sndName, '...'.
		[snd := SampledSound fromWaveFileNamed: fName] ifError: [:err :rcvr |
			snd := nil.
			errorString := err].

		snd ifNotNil: [
			snd isStereo ifTrue: [  "merge stereo to mono"
				bar label: 'Converting ', sndName, 'to mono...'.
				mergedBuf := snd sounds first samples.
				mergedBuf mixIn: snd sounds second samples.
				snd := SampledSound
					samples: mergedBuf
					samplingRate: snd sounds first originalSamplingRate].

			snd originalSamplingRate > 22050 ifTrue: [  "downsample to save space"
				bar label: 'Downsampling ', sndName, '...'.
				snd := SampledSound
					samples: (snd samples downSampledLowPassFiltering: false)
					samplingRate: snd originalSamplingRate / 2]]].

	errorString ifNotNil: [^ self error: errorString]. 
	self sound: snd.
