accessing
zoom: aNumber
	"Set my movie zoom. 100 is normal size. Values greater than 100 magnify or zoom in; values less than 100 shrink the movie within the frame."

	| newZoom |
	newZoom := (aNumber truncated min: 2000) max: 1.
	newZoom = zoom ifFalse: [
		zoom := newZoom.
		self renderingChanged].
