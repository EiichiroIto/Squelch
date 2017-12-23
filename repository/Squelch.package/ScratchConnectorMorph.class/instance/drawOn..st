as yet unclassified
drawOn: aCanvas

	(point1 isNil | point2 isNil) ifTrue: [^ self].
	aCanvas line: point1 to: point2 width: 1 color: color
