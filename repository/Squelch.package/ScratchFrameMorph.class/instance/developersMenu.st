menu/button actions
developersMenu
	"Present the Scratch developer's menu."

	| menu |
	self world activeHand toolType: nil.
	Cursor normal show.
	menu := CustomMenu new.

	fillScreenFlag
		ifTrue: [menu add: 'turn fill screen off' action: #fillScreenOff]
		ifFalse: [menu add: 'turn fill screen on' action: #fillScreenOn].
	UseErrorCatcher
		ifTrue: [menu add: 'turn error catching off' action: #toggleErrorCatcher]
		ifFalse: [menu add: 'turn error catching on' action: #toggleErrorCatcher].

	menu addLine.
	menu add: 'save image for end-user' action: #saveImageForEndUser.
 
	menu invokeOn: self.
