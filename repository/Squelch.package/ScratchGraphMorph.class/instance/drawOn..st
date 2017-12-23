drawing
drawOn: aCanvas

	| c |

	cachedForm = nil ifTrue:  [
		c := FormCanvas extent: bounds extent.
		c translateBy: bounds origin negated
			during:[:tempCanvas| self drawDataOn: tempCanvas].
		cachedForm := c form].
	aCanvas paintImage: cachedForm at: bounds origin.
	self drawCursorOn: aCanvas.
	self drawPlayCursorOn: aCanvas.
	