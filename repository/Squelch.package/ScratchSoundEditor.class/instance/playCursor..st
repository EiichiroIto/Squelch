accessing
playCursor: aNumber

	graph data ifNil: [^self].

	"allows the graph to set where the playing cursor is"

	cursor ~= aNumber ifTrue:  [
	cursor := ((aNumber truncated max: 1) min: graph data size) truncated.
	].