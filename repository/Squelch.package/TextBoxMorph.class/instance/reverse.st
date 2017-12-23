operations
reverse

	| out allLines |
	allLines := contentsMorph contents lines.
	out := WriteStream on: (String new: 1000).
	allLines reverseDo: [:s | out nextPutAll: s; cr].

	contentsMorph contents: out contents.

