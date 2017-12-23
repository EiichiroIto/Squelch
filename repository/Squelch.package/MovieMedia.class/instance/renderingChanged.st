private
renderingChanged
	"Update my output form after changing a rendering parameter. If the movie is playing at a fairly high frame rate, do nothing because the next frame will be displayed shortly."

	(moviePlaying and: [msecsPerFrame < 100]) ifTrue: [^ self].  "next frame will be drawn soon"
	self updateOutForm.
