sensing ops
keyNames
	"Key names for 'key pressed' block menu. Must keep this list in sync with asciiFor:."

	^ #('up arrow' 'down arrow' 'right arrow' 'left arrow' 'space'),
	   ($a to: $z), ($0 to: $9)
		 collect: [:ch | ch asString]
