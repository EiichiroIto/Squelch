menu/button actions
canonicalizeSoundsBits: bitsPerSample saveOriginal: saveFlag

	| count unique match |
	count := 0.
	unique := OrderedCollection new: 1000.
	self allProjectMedia do: [:m |
		m isSound ifTrue: [
			match := unique detect: [:u | u sound equals: m sound] ifNone: [nil].
			match
				ifNil: [
					bitsPerSample ifNotNil: [
						(m compressBitsPerSample: bitsPerSample saveOriginal: saveFlag)
							ifTrue: [count := count + 1]].
					unique add: m]
				ifNotNil: [
					m shareSoundWith: match]]].

	bitsPerSample notNil & saveFlag not ifTrue: [
		"uncompress compressed sounds so the result can be heard"
		self allProjectMedia do: [:m | m isSound ifTrue: [ m decompress]]].

	^ count
