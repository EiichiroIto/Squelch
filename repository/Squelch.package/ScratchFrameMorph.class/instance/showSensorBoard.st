menu/button actions
showSensorBoard

	| sb |
	sb := workPane sensorBoard.
	sb position: self workPane position + 20.
	self workPane addMorph: sb.
	sb tryToOpenPort.
	World startSteppingSubmorphsOf: sb.
