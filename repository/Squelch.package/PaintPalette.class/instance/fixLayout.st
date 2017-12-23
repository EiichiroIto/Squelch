geometry
fixLayout

	toolbarButtons position: self topLeft.
	optionsPane position: toolbarButtons left @ (toolbarButtons bottom - 2).
	colorSwitcher position: (self right - colorSwitcher width - 5)@(optionsPane bottom + 15).
