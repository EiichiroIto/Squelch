operations
sort

	| allLines numbers strings words sorted |
	allLines := contentsMorph contents lines.
	numbers := OrderedCollection new: allLines size.
	strings := OrderedCollection new: allLines size.
	allLines do: [:s |
		words := s findTokens: ' 	'.
		words size > 0
			ifTrue: [
				(self isNumber: words first)
					ifTrue: [numbers add: (Array with: words first with: s)]
					ifFalse: [strings add: (Array with: words first with: s)]]
			ifFalse: [
				strings add: (Array with: '' with: s)]].

	strings := strings asArray sort: [:e1 :e2 | e1 first caseInsensitiveLessOrEqual: e2 first].
	numbers := numbers asArray sort: [:e1 :e2 | e1 first asNumber < e2 first asNumber].

	sorted := WriteStream on: (String new: 1000).
	numbers do: [:e | sorted nextPutAll: e second; cr].
	strings do: [:e | sorted nextPutAll: e second; cr].

	contentsMorph contents: sorted contents.

