movie ops
startPlaying

	| frameIndex |
	self isPlaying ifTrue: [^ self].

	self stopPlaying.
	movieFile = nil ifTrue: [^ self].

	movieFile hasAudio ifTrue: [
		movieFile hasVideo ifTrue: [
			currentFrame >= (self frameCount - 3) ifTrue: [  "start over if very close to end"
				currentFrame := 1].

			sound reset.
			sound soundPosition: currentFrame / self frameCount.
			frameIndex := sound millisecondsSinceStart // msecsPerFrame.
			"MPEGFile plugin can crash on seeks to last few frames, so limit max frameIndex:"
			frameIndex := (frameIndex max: 1) min: ((movieFile videoFrames: 0) - 3).
 
			movieFile videoSetFrame: frameIndex - 1 stream: 0.
			self showFrame: frameIndex].

			SoundPlayer stopReverb.
			sound resumePlaying]
		ifFalse: [
			movieFile hasVideo ifTrue: [
				frameIndex := (currentFrame max: 0) min: ((movieFile videoFrames: 0) - 3).
 				movieFile videoSetFrame: frameIndex stream: 0].
			sound := nil].

	lastFrameMSecs := Time millisecondClockValue.
	moviePlaying := true.
