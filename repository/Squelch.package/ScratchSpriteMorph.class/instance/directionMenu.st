motion ops
directionMenu
	"Provides a drop-down menu for setting the sprite direction."

	| menu |
	menu := MenuMorph new.
	#(	('right' 90)
		('left' -90)
		('up' 0)
		('down' 180)
	) do: [:pair |
		menu
			add: '(', pair second printString, ') ', pair first localized
			selector: #value:
			argument: pair second].
	^ menu