menu/button actions
fileMenu: aMenuTitleMorph

	| menu |
	menu := MenuMorph new.
	menu defaultTarget: self.
	menu add: 'New' selector: #newScratchProject.
	menu add: 'Open' selector: #openScratchProject.
	menu add: 'Save' selector: #saveScratchProjectNoDialog.
	menu add: 'Save As' selector: #saveScratchProject.
	menu addLine.
	menu add: 'Import Project' selector: #importScratchProject.
	menu add: 'Export Sprite' selector: #exportSprite.
	menu addLine.
	menu add: 'Project Notes' selector: #editNotes.

	Sensor shiftPressed ifTrue: [  "developer menu"
		menu addLine.
		menu add: 'Write Project Summary' selector: #writeSummaryFile.
		menu add: 'Write Multiple Project Summaries' selector: #writeMultipleSummaries.
		menu addLine.
		fillScreenFlag
			ifTrue: [
				menu add: 'Exit User Mode' selector: #fillScreenOff]
			ifFalse: [
				menu add: 'Enter User Mode' selector: #fillScreenOn.
				menu add: 'Save Image in User Mode' selector: #saveImageForEndUser.
				menu add: 'Close Scratch' selector: #delete]].

	menu addLine.
	menu add: 'Quit' selector: #quitScratch.
	menu localize.
	
	"#(2 4 5 6 7) do: [:n |
		menu labels at: n put:
			((menu labels at: n) copyFrom: 1 to: (menu labels at: n) size - 1), ScratchTranslator ellipsesSuffix]."

	menu invokeAt: aMenuTitleMorph bottomLeft + (0@10) in: self world