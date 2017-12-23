private
setLabelForTab: tabID to: aString

	| theTab wInitial wDelta |
	self submorphs do: [:m |
		((m isKindOf: ResizableToggleButton2) and:
		 [m arguments first = tabID]) ifTrue: [
			theTab := m.
			wInitial := m width.
			self tab: m label: aString.
			wDelta := m width - wInitial]].

	theTab ifNotNil: [
		self submorphs do: [:m |
			((m isKindOf: ResizableToggleButton2) and: [m left > (theTab left)])
				ifTrue: [
					"scoot the others down if the tab's width changed"
					m position: (m position) + (wDelta@0)]]].
