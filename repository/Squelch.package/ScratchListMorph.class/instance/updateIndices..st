private
updateIndices: rightX

	| s newNumbers page num cell |
	numberMorphs size > cellMorphs size ifTrue: [
		cellMorphs size + 1 to: numberMorphs size do: [:i | (numberMorphs at: i) delete].
		numberMorphs := numberMorphs copyFrom: 1 to: cellMorphs size].

	newNumbers := #().
	numberMorphs size < cellMorphs size ifTrue: [
		page := scrollPane contents.
		s := StringMorph new
			color: self indexColor;
			font: (ScratchFrameMorph getFont: #Label).
		newNumbers := (numberMorphs size + 1 to: cellMorphs size)
			collect: [:i | s fullCopy contents: i printString].
		newNumbers do: [:m | page addMorph: m].
		numberMorphs := numberMorphs, newNumbers].

	1 to: cellMorphs size do: [:i |
		num := numberMorphs at: i.
		cell := cellMorphs at: i.
		num position: (rightX - num width) @ (cell top + ((cell height - num height) // 2))].

