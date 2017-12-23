menu/button ops
deleteSprite
	"Ask the user if they want to delete the currently selected sprite"

	| response |
	response := DialogBoxMorph askWithCancel: 'Delete this sprite?' localized.
	response = #cancelled ifTrue: [^ self].
	response ifTrue: [thumbnailMorph target undoableDeleteSprite].
