serial port
portIsOpen

	^ port notNil and: [port isOpen]
