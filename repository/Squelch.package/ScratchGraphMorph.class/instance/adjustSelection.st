menu
adjustSelection
	"Adjust the selection, if any, to the current cursor position. Do nothing if there is no selection."

	editor selectionNil ifTrue: [^ self].
	editor selection: editor cursor scd: editor startSelection.

