event handling
rightButtonMenu

	| menu |
	menu := CustomMenu new.
	menu add: 'export' action: #exportList.
	menu add: 'import' action: #importList.
	menu addLine.
	menu add: 'hide' action: #delete.

	menu localize.
	menu labels at: 2 put: 
		((menu labels at: 2) copyFrom: 1 to: (menu labels at: 2) size - 1), ScratchTranslator ellipsesSuffix.
	menu invokeOn: self.
