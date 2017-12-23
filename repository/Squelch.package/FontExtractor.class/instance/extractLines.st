all
extractLines
	"Set my lineForms to an array of Forms, one for each line of characters in my strikeForm."

	| linePixCounts lineCount ascents descents pixCountsForLine baselineY topY |
	linePixCounts := self extractPixCountsForLines.
	lineCount := linePixCounts size.
	ascents := Array new: lineCount.
	descents := Array new: lineCount.
	1 to: lineCount do: [:i |
		pixCountsForLine := linePixCounts at: i.
		baselineY := self baselineYForLineCounts: pixCountsForLine.
		ascents at: i put: (baselineY - pixCountsForLine first first) + 1.
		descents at: i put: (pixCountsForLine last first - baselineY)].

	fontAscent := ascents max.
	fontHeight := ascents max + descents max.
	lineForms := (1 to: linePixCounts size) collect: [:i |
		baselineY := (linePixCounts at: i) first first + (ascents at: i).
		topY := baselineY - fontAscent.
		strikeForm copy: (0@topY extent: strikeForm width@fontHeight)].
