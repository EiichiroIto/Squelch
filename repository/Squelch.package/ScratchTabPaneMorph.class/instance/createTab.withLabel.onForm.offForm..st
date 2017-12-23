accessing
createTab: tabID withLabel: aString onForm: aForm1 offForm: aForm2

	| button |
	button := ResizableToggleButton2 new
		target: self;
		actionSelector: #currentTab:;
		toggleMode: false;
		toggleButtonMode: true;
		arguments: (Array with: tabID).

	button offForm: aForm2 onForm: aForm1.
	self tab: button label: aString.

	button position: (lastTabAdded ifNil: [-0@0] ifNotNil: [(lastTabAdded right - 16)@(self bottom - button height)]).

	lastTabAdded := button.
	self addMorph: button.

	(button height > self height) ifTrue: [
		self height: button height.
		"if we just changed the height, then we must make sure all the previous tabs are aligned to the bottom"
		self submorphs do: [:m |
			(m isKindOf: ResizableToggleButton2) ifTrue: [
				m height: self height; bottom: self bottom.
				m label top: m label top]]].
