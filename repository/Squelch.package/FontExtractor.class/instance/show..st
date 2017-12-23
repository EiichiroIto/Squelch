all
show: aForm
	"Display the given form magnified. Used for debugging."

	| mag |
	(aForm isKindOf: Form) ifFalse: [Display fill: (0@0 extent: 20) fillColor: Color blue. ^ self].
	mag := 2.
	Display fillWhite: (0@0 extent: (aForm extent * mag) + 15).
	(aForm magnifyBy: mag) displayAt: 5@5.
