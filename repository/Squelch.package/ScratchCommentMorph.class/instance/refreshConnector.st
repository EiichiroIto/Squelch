private
refreshConnector

	| y |
	owner ifNil: [^ self].

	connector ifNil: [
		connector := ScratchConnectorMorph new color: self topBarColor].

	connector owner isNil ifTrue: [
		owner addMorph: connector.
		connector goBehind].

	y := self top + 7.
	ScratchTranslator isRTL
		ifTrue: [
			connector
				from: (anchor left + 1) @ y
				to: self right @ y]
		ifFalse: [
			connector
				from: (anchor right - 1) @ y
				to: self left @ y].

