accessing
compositeForm
	"Answer my composite form, which is my form with the text painted on top of it."

	compositeForm ifNotNil: [^ compositeForm].
	self hasTextLayer ifFalse: [^ compositeForm := form].

	compositeForm := Form extent: form extent depth: 32.
	form displayOn: compositeForm.
	textBox
		suppressAntiAliasing: true;
		drawTextOn: ((FormCanvas on: compositeForm) copyOffset: textBox topLeft).

	^ compositeForm
