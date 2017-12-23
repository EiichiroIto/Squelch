import/export
withoutComment: s
	"Answer the given string without any comment. A hash character (#) begins a comment that runs to the end of the line unless the hash character is inside a double-quoted string."
	"ScratchTranslator withoutComment: '# full line comment'"
	"ScratchTranslator withoutComment: 'contents Öffnen # plus s comment'"

	| inString lastCh ch |
	(s indexOf: $#) = 0 ifTrue: [^ s].

	inString := false.
	lastCh := Character space.
	1 to: s size do: [:i |
		ch := s at: i.
		ch = $# ifTrue: [
			inString ifFalse: [^ s copyFrom: 1 to: i - 1]].
		ch = $" ifTrue: [
			(inString and: [lastCh = $\]) ifFalse: [
				inString := inString not]]].
	^ s
