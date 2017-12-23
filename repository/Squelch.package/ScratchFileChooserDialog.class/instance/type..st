accessing
type: t
	"Set the type of thing being opened/saved in the file dialog box, in order to include the appropriate shortcuts.  Then add relevant shortcut buttons and set the directory. Types include:
	#background
	#costume
	#list
	#project
	#projectSummary
	#scriptSnapshot
	#sound
	#sprite
	#stageShot"

	type := t.
	self addShortcutButtons.
	self setDirectory: (ScratchFileChooserDialog getLastFolderForType: type).
