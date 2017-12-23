intialization
createMenuPanel
	"Create and add a panel containing the menus and close button."

	| menuSpecs m |
	"create panel"
	menuPanel := AlignmentMorph new
		color: Color transparent;
		listCentering: #center;
		layoutInset: 0;
		height: 0.	"will grow as needed"

	self addShortcutButtonsTo: menuPanel.

	"menuSpecs defines the menus"
	menuSpecs := #(
		"name			selector"
		(File			fileMenu:)
		(Edit			editMenu:)
		(Share			shareMenu:)
		(Help			helpMenu:)
	).

	menuSpecs do: [:spec |
		m := ScratchMenuTitleMorph new
			contents: (spec at: 1) localized;
			target: self selector: (spec at: 2).
		menuPanel addMorphBack: m.
		#helpMenu: = (spec at: 2) ifFalse: [
			menuPanel addMorphBack: (Morph new color: Color transparent; extent: 12@5)]].

	topPane addMorph: menuPanel.
