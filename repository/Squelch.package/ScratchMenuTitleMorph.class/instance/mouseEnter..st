event handling
mouseEnter: evt

	self color: self highlightColor.
	self class menuBarIsActive ifTrue: [
		self class closeAllMenus.
		MenuBarIsActive := true.
		target perform: selector with: self ]  "invoke my menu"
