media
mediaNameFromFileName: fileName default: defaultName
	"Answer a name for the given media item. If the existing name is '$$squeak$$' then the media was copied via windows drag-and-drop; use the given default name instead."

	| result |
	result := fileName asFileReference base.
	(result beginsWith: '$$squeak$$') ifTrue: [result := defaultName].
	result size > 16 ifTrue: [result := result copyFrom: 1 to: 16].
	^ result