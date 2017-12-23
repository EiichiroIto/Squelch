menu/button actions
helpMenu: aMenuTitleMorph

	| menu |
	menu := MenuMorph new.
	menu defaultTarget: self.
	UseErrorCatcher
		ifTrue: [menu add: 'turn error catching off' selector: #toggleErrorCatcher]
		ifFalse: [menu add: 'turn error catching on' selector: #toggleErrorCatcher].
	menu addLine.
	menu add: 'Help Page' selector: #launchHelpPage.
	menu add: 'Help Screens' selector: #launchAllHelpScreens.
	menu addLine.
	menu add: 'About Scratch' selector: #aboutScratch.

	menu localize.

	"#(1 2 3) do: [:n |
		menu labels at: n put:
			((menu labels at: n) copyFrom: 1 to: (menu labels at: n) size - 1), ScratchTranslator ellipsesSuffix]."

	menu invokeAt: aMenuTitleMorph bottomLeft + (0@10) in: self world
