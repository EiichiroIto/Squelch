accessing
isHighlit
	"Answer true if I am highlit."

	highlit
		ifNil: [^ false]
		ifNotNil: [^ highlit]
