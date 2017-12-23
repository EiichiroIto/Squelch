instance creation
buttonHue: hue
	"Answer a new ToggleButton that looks like an LED indicator light of the given hue."

	| d onF offF w bezelF |
	w := 2.
	bezelF := ImageMorph bezelDiameter: 14 width: 2 baseColor: Color gray inset: true.
	d := bezelF width - (2 * w).
	onF := bezelF deepCopy.
	(ImageMorph glowDiameter: d color: (Color h: hue s: 0.4 v: 1) on: true)
		displayOn: onF at: w@w rule: Form paint.
	offF := bezelF deepCopy.
	(ImageMorph glowDiameter: d color: (Color h: hue s: 0.4 v: 1) on: false)
		displayOn: offF at: w@w rule: Form paint.
	^ ToggleButton onForm: onF offForm: offF
