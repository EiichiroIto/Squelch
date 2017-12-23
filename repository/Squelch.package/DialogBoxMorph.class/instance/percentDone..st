interaction
percentDone: aNumber
	"Show a percent complete indicator. The argument should be in the range 0-100."

	| percent fullWidth indicator |
	percentMorph ifNil: [
		percentMorph := BorderedMorph new
			extent: 104@16;
			borderWidth: 1;
			color: Color transparent;
			borderColor: (Color gray: 0.5).
		indicator := Morph new
			extent: 0@12;
			color: (Color r: 0.35 g: 0.50 b: 0.67);
			position: percentMorph position + 2.
		percentMorph addMorph: indicator.
		percentMorph position: (self center x - (percentMorph width // 2) - 5)@(buttonRow top - 27).
		mainColumn addMorph: percentMorph].

	fullWidth := percentMorph width - 4.
	indicator := percentMorph firstSubmorph.
	percent := (aNumber * fullWidth / 100.0) rounded min: fullWidth max: 0.
	indicator width: percent.

	World displayWorld.
