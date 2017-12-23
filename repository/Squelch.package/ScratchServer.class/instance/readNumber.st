private-command parsing
readNumber

	| s sign |
	s := self readString.
	sign := 1.
	s first = $- ifTrue: [s := s copyFrom: 2 to: s size. sign := -1].
	s first = $. ifTrue: [s := '0', s].  "add leading zero"
	^ s asNumber * sign
