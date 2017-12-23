copying
mapReceiver: oldObj to: newObj
	"Used in cloning an object to make blocks that refererred to the original object new refer to the new copy."

	readout target == oldObj ifTrue: [readout target: newObj].
