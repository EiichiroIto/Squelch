accessing
bareMinimumWidth
	"Answer the bare minimum width for this pane to be useable."

	lockButton ifNil: [^ 100].
	^ lockButton right - self left