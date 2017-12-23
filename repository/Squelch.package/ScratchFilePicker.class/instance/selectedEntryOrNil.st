private
selectedEntryOrNil

	^ contentsPaneMorph contents submorphs
		detect: [:m | m isHighlit]
		ifNone: [^ nil]
