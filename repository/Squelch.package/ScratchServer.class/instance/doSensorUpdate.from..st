private-incoming commands
doSensorUpdate: cmd from: requestSocket
	"Handle a sensor update command: sensor-update [<sensor-name> <sensor-value>]"

	| i sName sValue |
	i := 2.
	[i < cmd size] whileTrue: [
		sName := cmd at: i.
		sValue := cmd at: i + 1.
		(sName isKindOf: String)
			ifTrue: [sensors at: sName put: sValue].
		i := i + 2].
