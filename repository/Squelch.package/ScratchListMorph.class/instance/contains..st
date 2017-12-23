list ops
contains: aStringOrNumber

	| s |
	s := aStringOrNumber asString.
	cellMorphs do: [:m |
		s = m firstSubmorph contents ifTrue: [^ true]].

	^ false
