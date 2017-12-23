sound ops
setInstrumentMenu
	"Provides a drop-down menu for setting the instrument number."

	| menu |
	menu := CustomMenu new.
	#(	('Piano' 1)
		('Electric Guitar' 2)
		('Acoustic Guiar' 3)
		('Bass' 4)
	) do: [:pair |
		menu
			add: (self numberInParens: pair second), (pair first localizedMIDI)
			action: pair second].
	^ menu
