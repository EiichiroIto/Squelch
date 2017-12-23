private
lightUpCurrentTab

	(self submorphs) do: [:m |
		(m isKindOf: ResizableToggleButton2) ifTrue: [
			m arguments first = currentTab
				ifTrue: [m setLabelColor: (Color r:(33/255) g:(33/255) b:(31/255)); on; comeToFront]
				ifFalse: [m setLabelColor: (Color r:(88/255) g:(89/255) b:(93/255)); off]]].
