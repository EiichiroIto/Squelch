private
ping
	"Answer true if a GoGoBoard is connected to my serial port."

	| buf |
	port flushInputBuffer.
	port nextPutAll: #(84 254 0) asByteArray.
	buf := port next: 3.
	^ buf = #(85 255 170) asByteArray
