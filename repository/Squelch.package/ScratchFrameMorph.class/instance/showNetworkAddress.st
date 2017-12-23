menu/button actions
showNetworkAddress
	"Display my IP address. This is a temporary feature to allow connected multiple Scratch computers in a peer-to-peer configuration without the help of a presence server."

	| localAddr wanAddr msg |
	Socket initializeNetwork.
	localAddr := NetNameResolver localHostAddress.
	wanAddr := nil.
"	wanAddr := ScratchServer getIPAddressFromServer."

	msg := NetNameResolver stringFromAddress: localAddr.
	(wanAddr notNil and: [wanAddr ~= localAddr]) ifTrue: [
		msg := msg, String cr, 'Internet:   ', (NetNameResolver stringFromAddress: wanAddr)].

	DialogBoxMorph inform: msg title: 'IP Address'.
