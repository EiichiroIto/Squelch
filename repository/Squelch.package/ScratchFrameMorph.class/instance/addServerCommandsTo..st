menu/button actions
addServerCommandsTo: menu
	"Add Scratch server commands to the given menu."

	| disable endCmd |
	disable := false.  "make this true to disable this feature"
	disable ifTrue: [^ self].

	menu addLine.
	(workPane scratchServer notNil and:
	 [workPane scratchServer sessionInProgress])
		ifTrue: [
			menu add: 'Show IP Address' selector: #showNetworkAddress.
			endCmd := workPane scratchServer isHosting
				ifTrue: ['Stop Hosting Mesh']
				ifFalse: ['Leave Mesh'].
			menu add: endCmd selector: #exitScratchSession]
		ifFalse: [
			menu add: 'Host Mesh' selector: #startHostingScratchSession.
			menu add: 'Join Mesh' selector: #joinScratchSession].

