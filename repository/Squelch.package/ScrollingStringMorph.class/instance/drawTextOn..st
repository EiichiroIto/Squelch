drawing
drawTextOn: aCanvas

	| iStart iEnd p |
	iStart := firstVisibleLine rounded min: lines size max: 1.
	iEnd := (firstVisibleLine + self visibleLineCount) min: lines size max: 1.

	iStart to: iEnd do: [:i |
		p := self offsetForLine: i.
		self drawString: (lines at: i) at: p on: aCanvas].

