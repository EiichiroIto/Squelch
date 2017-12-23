media
soundNames
	"Answer a list of my sound names. Suppress duplicates (ignoring case differences)."

	| result nm |
	result := OrderedCollection new.
	media do: [:el |
		el isSound ifTrue: [
			nm := el mediaName.
			(result anySatisfy: [:s | (s compare: nm) = 2])
				ifFalse: [result add: nm]]].
	result addLast: '-'.
	result addLast: 'record' localized, ScratchTranslator ellipsesSuffix.
	^ result asArray
