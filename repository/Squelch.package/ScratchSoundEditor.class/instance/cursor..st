accessing
cursor: aNumber

	graph data ifNil: [^self].

	cursor ~= aNumber ifTrue:  [
	cursor := ((aNumber truncated max: 1) min: graph data size) truncated.
	"graph keepIndexInView: cursor."
	].