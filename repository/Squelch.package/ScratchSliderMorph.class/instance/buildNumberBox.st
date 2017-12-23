initialization
buildNumberBox

	| box m |
	box := BorderedMorph new
		borderWidth: 1;
		borderInset;
		color: Color paleBlue;
		extent: 20@17.
	m := UpdatingStringMorph new
		target: slider;
		floatPrecision: 0.01;
		useDefaultFormat.
	box addMorph: m.
	^ box
