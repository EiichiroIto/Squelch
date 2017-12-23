accessing
buttons

	^ buttonRow submorphs select: [:m |
		m isKindOf: ResizableToggleButton2].
