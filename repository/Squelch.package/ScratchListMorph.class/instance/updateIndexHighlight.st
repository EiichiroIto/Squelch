stepping
updateIndexHighlight
	"Update the highlighted index."

	highlightActive ifTrue: [
		numberMorphs do: [:m | m color: self indexColor].
		highlightActive := false].
