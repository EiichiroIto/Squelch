list ops
listIndexForDeleteMenu

	| menu |
	menu := CustomMenu new.
	#('1' last) do: [:s | menu add: s action: s].
	menu addLine.
	menu add: #all action: #all.
	menu localize.
	^ menu
