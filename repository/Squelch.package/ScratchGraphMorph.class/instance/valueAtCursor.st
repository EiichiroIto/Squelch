accessing
valueAtCursor

	data isEmpty ifTrue: [^ 0].
	^ data at: ((editor cursor truncated max: 1) min: data size).
