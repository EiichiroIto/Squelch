all
baselineYForLineCountsOLD: pixCountArray
	"Answer the baseline y from the given array of (<y>, <pixCount>) pairs for a given line."
	"Details: The baseline is detected by scanning up from the bottom to find the first horizontal line with at least half the number of black pixels as the maximum number of black pixels. While this heuristic usually works for alphanumeric fonts, it wouldn't necessarily work for fonts of symbols or icons."

	| maxBlackCount |
	maxBlackCount := pixCountArray inject: 0 into: [:m :pair | m max: pair last].
	pixCountArray reverseDo: [:pair |
		pair last > (maxBlackCount // 2) ifTrue: [^ pair first]].
