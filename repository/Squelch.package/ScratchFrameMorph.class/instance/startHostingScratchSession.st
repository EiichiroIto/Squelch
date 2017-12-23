menu/button actions
startHostingScratchSession
	"Start running the Scratch server, allowing Scratch and other applications to interact with this Scratch remotely."

	| server |
	workPane scratchServer ifNil: [
		server := ScratchServer new.
		server stage: workPane.
		workPane scratchServer: server].

	workPane scratchServer startHosting.
	self showNetworkAddress.
