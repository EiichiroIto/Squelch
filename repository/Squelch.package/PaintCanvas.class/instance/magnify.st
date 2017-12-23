private-tranforms
magnify
	"Prompt the user for a percent and rescale by that factor."

	| percent s |
	percent := transformScale ifNil: [100] ifNotNil: [(100 * transformScale) rounded].
	s := StringDialog
		ask: 'Percent? (100 gives original size)'
		initialAnswer: percent printString.
	s isEmpty ifTrue: [^ self].
	[percent := s asNumber max: 1] ifError: [^ self nonNumberWarning].

	transformScale := 1.0.
	self scaleBy: percent / 100.0.
