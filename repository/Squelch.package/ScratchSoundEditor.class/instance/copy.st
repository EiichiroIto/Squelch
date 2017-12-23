graph ops
copy

	"copies the current selection if there is one."
	(selection at: 1) ifNotNil:
		[copy := graph data copyFrom: (graph selection at: 1) to: (graph selection at: 2).]