geometry
fixLayout

	titleMorph fitContents.
	(titleMorph width > (self width - 12)) ifTrue: [
		self width: titleMorph width + 12].

	titleMorph position: (self center x - (titleMorph width // 2)) @ (self top + 5).

	countMorph fitContents.

	scrollPane
		position: (self left + 2) @ (titleMorph bottom + 3);
		extent: (self width - 4) @ (self bottom - titleMorph bottom - countMorph height - 12).

	addItemMorph position: (self left + 3) @ (self bottom - addItemMorph height - 3).
	resizeMorph position: (self bottomRight - resizeMorph extent).

	self updateCountMorph.
	countMorph bottom: self bottom - 3.

	self updateContents.
