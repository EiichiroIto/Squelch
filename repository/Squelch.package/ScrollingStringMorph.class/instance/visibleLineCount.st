private
visibleLineCount
	"Answer the number of full lines that are visible. If less than a full line is visible, answer 1."

	^ ((self height - self textInset x) // lineHeight) max: 1