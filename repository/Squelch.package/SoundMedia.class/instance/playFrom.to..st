scratch ops
playFrom: startSecs to: endSecs
	"Play the given portion of the sound. The start and end offsets are in seconds at the original sound's sampling rate regardless of the current playback rate."

	| totalSecs sampleCount startIndex endIndex snd arr |
	self pausePlaying.
	originalSound ifNil: [^ self].
	totalSecs := self totalSeconds.
	sampleCount := originalSound samples monoSampleCount.
	startIndex := (startSecs * sampleCount // totalSecs) max: 1.
	endIndex := (endSecs * sampleCount // totalSecs) min: sampleCount.
	startIndex < endIndex ifFalse: [^ self].

	playingSound := MixedSound new.
	arr := originalSound samples
		copyFrom: startIndex to: endIndex.
	snd := (SampledSound new
		setSamples: arr
		samplingRate: originalSound originalSamplingRate;
		loudness: 1.0).
	playingSound add: snd pan: (balance / 100.0) volume: (volume / 100.0).
	playingSound play.