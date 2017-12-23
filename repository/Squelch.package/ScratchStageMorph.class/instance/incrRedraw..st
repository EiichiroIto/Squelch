drawing
incrRedraw: damageList
	"Redraw the damaged areas of this stage directly onto the display. Assumes that no other morph is in front of me."

	| f c p screenR |
	damageList do: [:r |
		f := Form extent: r extent depth: 32.
		c := (FormCanvas on: f) copyOffset: r origin negated.
		self fullDrawOn: c.
		DoubleSize
			ifTrue: [
				p := (self center - self extent) + (2 * (r origin - self topLeft)).
				screenR := p extent: 2 * f extent.
				(Display boundingBox containsRect: screenR) ifTrue: [
					[
						ScratchPlugin
							primDouble: f bits w: f width h: f height
							into: Display bits w: Display width h: Display height
							x: screenR left y: screenR top.
					] ifError: [].
					Display forceToScreen: screenR]]
			ifFalse: [
				f displayOn: Display at: r topLeft rule: Form over]].
