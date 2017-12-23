initialization
convertToMmss: aNumber
	"Answer a string of the form MM:SS. For displaying a time in seconds as hours, minutes, and seconds."

	| mm ss |
	mm := ((aNumber // 60) \\ 60) printString.
	"mm size < 2 ifTrue: [mm := '0', mm]."
	ss := (aNumber \\ 60) printString.
	ss size < 2 ifTrue: [ss := '0', ss].
	^ mm, ':', ss
