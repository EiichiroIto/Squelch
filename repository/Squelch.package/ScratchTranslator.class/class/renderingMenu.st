rendering menu
renderingMenu
	"Present a menu for experimenting with rendering settings."
	"self renderingMenu"

	| menu |
	World activeHand toolType: nil.
	Cursor normal show.
	RenderWithSqueak ifTrue: [^ self beep].

	menu := CustomMenu new.
	menu add: 'set font scale...' action: #fontScaleMenu.
	RenderSuppressBold
		ifTrue: [menu add: 'allow bold' action: #toggleSuppressBold]
		ifFalse: [menu add: 'suppress bold' action: #toggleSuppressBold].

	menu localize.
	menu invokeOn: self.