accessing
cursorWrapped: aNumber

	| sz |
	editor cursor ~= aNumber ifTrue: [
		editor cursor: aNumber.
		sz := data size.
		sz = 0
			ifTrue: [editor cursor: 1]
			ifFalse: [
				((editor cursor >= (sz + 1)) or: [editor cursor < 0]) ifTrue: [
					 editor cursor: editor cursor - ((editor cursor // sz) * sz)].
				editor cursor < 1 ifTrue: [editor cursor: sz + editor cursor]].
		"assert: 1 <= cursor < data size + 1"
		hasChanged := true].
