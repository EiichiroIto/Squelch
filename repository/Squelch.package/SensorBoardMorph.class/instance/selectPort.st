serial port
selectPort

	| menu choice |
	self stopReadingData.

	self portNames size = 0 ifTrue: [^ DialogBoxMorph inform: 'No serial ports found'].

	menu := CustomMenu new.
	self portNames do: [:n | menu add: n action: n].
	choice := menu startUp.
	choice ifNil: [^ self].

	self openPort: choice.
	self startReadingData.
	scanState := #on.
