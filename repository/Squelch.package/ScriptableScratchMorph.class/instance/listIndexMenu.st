list ops
listIndexMenu

	| menu |
	menu := MenuMorph new.
	#('1' last any) do: [:s | menu add: s selector: #value: argument: s].
	^ menu
