private
lightUpSelectorForCurrentCategory

	submorphs do: [:m |
		(m isKindOf: ResizableToggleButton2) ifTrue: [
			m arguments first = currentCategory
				ifTrue: [m on]
				ifFalse: [m off]]].
