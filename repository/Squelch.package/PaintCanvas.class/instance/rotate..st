private-tranforms
rotate: clockwiseFlag

	| s degrees |
	s := StringDialog ask: 'Rotation degrees?' initialAnswer: '30'.
	s isEmpty ifTrue: [^ self].
	[degrees := s asNumber.
	clockwiseFlag
		ifTrue: [self rotateCWBy: degrees]
		ifFalse: [self rotateCWBy: degrees negated]
	] ifError: [
		^ self nonNumberWarning].
