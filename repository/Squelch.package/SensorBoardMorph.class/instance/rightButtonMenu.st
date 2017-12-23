event handling
rightButtonMenu

	| menu |
	menu := CustomMenu new.
	Sensor shiftPressed
		ifTrue: [
			reportRaw
				ifTrue: [menu add: 'stop reporting raw data' action: #toggleRawMode]
				ifFalse: [menu add: 'report raw data' action: #toggleRawMode].
			useGoGoProtocol
				ifTrue: [menu add: 'use Scratch board' action: #useScratchboardProtocol]
				ifFalse: [menu add: 'use GoGo board' action: #useGoGoProtocol]]
		ifFalse: [
			menu add: 'select serial/USB port' action: #selectPort.
			self portIsOpen
				ifTrue: [menu add: 'close port' action: #stopReadingData].
			menu addLine.
			menu add: 'hide' action: #delete].

	menu localize; invokeOn: self.
