menu/button actions
canonicalizeImagesQuality: qualityOrNil saveOriginal: saveFlag

	| count unique match |
	count := 0.
	unique := OrderedCollection new: 1000.
	self allProjectMedia do: [:m |
		m isImage ifTrue: [
			match := unique detect: [:u | u form equals: m form] ifNone: [nil].
			match
				ifNil: [
					qualityOrNil ifNotNil: [
						(m jpegCompressIfPossibleQuality: qualityOrNil saveOriginal: saveFlag)
							ifTrue: [count := count + 1]].
					unique add: m]
				ifNotNil: [
					m shareFormWith: match]]].
	^ count
