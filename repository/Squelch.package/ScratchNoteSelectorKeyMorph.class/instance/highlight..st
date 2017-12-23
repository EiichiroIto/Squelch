accessing
highlight: aBoolean
	"If the argumet is true, highlight to show that I'm pressed. Otherwise, set my color based on whether I am a black or white key."

	| isBlackKey |
	aBoolean
		ifTrue: [self color: Color yellow]
		ifFalse: [
			isBlackKey := #(1 3 6 8 10) includes: (midiKey \\ 12).
			isBlackKey
				ifTrue: [self color: Color black]
				ifFalse: [self color: (Color gray: 0.95)]].
