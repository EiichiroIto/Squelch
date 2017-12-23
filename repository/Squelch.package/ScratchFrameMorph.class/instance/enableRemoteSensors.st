menu/button actions
enableRemoteSensors
	"Start running the Scratch server, allowing Scratch and other applications to interact with this Scratch remotely."

	| server |
	workPane scratchServer ifNil: [
		server := ScratchServer new userName: 'Scratch'.
		server stage: workPane.
		workPane scratchServer: server].

	workPane scratchServer startHosting.
	DialogBoxMorph inform: 'Remote sensor connections enabled' localized.
