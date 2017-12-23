accessing
label: aString font: aFont

	| oldLabel m |
	(oldLabel := self findA: StringMorph) ifNotNil: [oldLabel delete].
	m := StringMorph contents: aString font: (aFont ifNil: [Preferences standardButtonFont]).
	m color: (Color r: (78/255) g: (82/255) b: (82/255)).
	self extent: m extent + borderWidth.
	self width: self width + sideMargin.
	self height: (self height max: normalFormLeft height).
	m position: (self center - (m extent // 2)) - (0@1).
	self addMorph: m.
	m lock.
