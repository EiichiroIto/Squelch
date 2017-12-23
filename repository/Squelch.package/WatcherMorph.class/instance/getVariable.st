accessing
getVariable

	readout parameter notNil
		ifTrue: [^ readout parameter]
		ifFalse: [^ readout getSelector]
