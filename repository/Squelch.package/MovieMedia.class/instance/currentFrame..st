private
currentFrame: frameIndex

	| proportion |
	(self movieFileIsOpen and: [movieFile hasVideo]) ifFalse: [^ self].
	proportion := ((frameIndex / self frameCount) max: 0.0) min: 1.0.
	self currentSeconds: proportion * (movieFile duration: 1).
