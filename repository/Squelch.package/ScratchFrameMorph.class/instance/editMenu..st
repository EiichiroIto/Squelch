menu/button actions
editMenu: aMenuTitleMorph

	| menu |
	menu := MenuMorph new.
	menu defaultTarget: self.
	menu add: 'Undelete' selector: #undoTool.
	menu addLine.
	ScratchProcess blockHighlightMSecs <= 1
		ifTrue: [menu add: 'Start Single Stepping' selector: #toggleSingleStepping]
		ifFalse: [menu add: 'Stop Single Stepping' selector: #toggleSingleStepping].
	menu add: 'Set Single Stepping' selector: #setSingleStepping.
	menu addLine.
	menu add: 'Compress Sounds' selector: #compressSounds.
	menu add: 'Compress Images' selector: #compressImages.

	menu addLine.
	workPane showMotorBlocks
		ifTrue: [menu add: 'Hide Motor Blocks' selector: #hideMotorBlocks]
		ifFalse: [menu add: 'Show Motor Blocks' selector: #showMotorBlocks].

	menu localize.

	"#(3 4 5) do: [:n |
		menu labels at: n put:
			((menu labels at: n) copyFrom: 1 to: (menu labels at: n) size - 1), ScratchTranslator ellipsesSuffix]."

	menu invokeAt: aMenuTitleMorph bottomLeft + (0@10) in: self world
