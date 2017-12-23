Unicode rendering
showHintString
	"self showHintString"

	| f p r |
	p := 20@70.
	f := (StringMorph contents: self renderHintString font: (StrikeFont fontName: 'Verdana' size: 18)) imageForm.
	r := f rectangleEnclosingPixelsNotOfColor: (f colorAt: 0@0).
	Display fillWhite: (p extent: f extent).
	f displayOn: Display at: p rule: Form paint.
	Display border: (r translateBy: p) width: 1 rule: Form over fillColor: Color blue.

	^ {
		f height.
		r height.
		f height - r height.
		self verticalTrimForFont: (StrikeFont fontName: 'VerdanaBold' size: 10)
	}