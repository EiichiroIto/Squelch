drawing
incrRedrawDouble: doubleFlag
	"Draw the damage areas on the display. Draw at double size if so indicated."

	| damageList m f c p screenR |
	damageRecorder updateIsNeeded ifFalse: [^ self].
	damageList := damageRecorder invalidRectsFullBounds: bounds.
	damageRecorder reset.

	submorphs size = 0 ifTrue: [^ self].
	m := submorphs first.

	damageList do: [:r |
		f := Form extent: r extent depth: 32.
		c := (FormCanvas on: f) copyOffset: r origin negated.
		m fullDrawOn: c.
		doubleFlag
			ifTrue: [
				p := (m center - m extent) + (2 * (r origin - m topLeft)).
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
