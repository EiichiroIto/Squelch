private
isVariableWatcher
	"Answer true if I am watching a variable."

	^ readout getSelector = #getVar:
