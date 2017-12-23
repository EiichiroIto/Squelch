menu/button ops
scriptsMenu: aPosition
	"Present a menu of Scratch script operations."

	| menu choice |
	self target ifNil: [^ self].
	menu := MenuMorph new.
	menu target: [ :v | choice := v ].
	menu add: 'clean up' selector: #value: argument: #cleanUp.
	menu add: 'save picture of scripts' selector: #value: argument:#saveScriptsToImage.
	menu add: 'add comment' selector: #value: argument:#addComment:.
	menu localize.
	menu invokeAt: ActiveHand position in: ActiveWorld allowKeyboard: false.

	choice ifNil: [^ self].
	choice = #addComment:
		ifTrue: [self perform: choice with: aPosition]
		ifFalse: [self perform: choice].
