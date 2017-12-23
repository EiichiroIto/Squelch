accessing
shortcutLabel: aString font: aFont
	"Add the given label in the given font centered in my current extent."

	| oldLabel m |
	(oldLabel := self findA: StringMorph) ifNotNil: [oldLabel delete].
	m := StringMorph contents: aString font: (aFont ifNil: [Preferences standardButtonFont]).
	m position: self center - (m extent // 2) + (0@6).
	self addMorph: m.
	m lock.
