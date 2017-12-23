stepping
step

	| played prev |
	(SoundPlayer isPlaying: snd) ifTrue: [
		played := ((snd millisecondsSinceStart) * snd samples size) / (1000.0 * snd duration).
		prev := (completeSnd samples size - snd samples size).
		playCursor := (played + prev truncated min: graph data size).
		self changed].

	time contents: self startTime.

	scrollDelta = 0 ifFalse: [
		graph startIndex: graph startIndex + (scrollDelta/graph scale).
		self updateSliderValue.].

	graph computeSlider.
	self fixSliderRange.
