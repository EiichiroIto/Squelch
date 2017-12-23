events
mouseUp: evt

	((editor selectionNil not) and: [(selection at: 2) - (selection at: 1) <=3])
		ifTrue: [editor selection: nil.
				editor startSelection: nil.].
