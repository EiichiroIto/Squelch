stepping
updateTitle
	"Update my title if I am owned by a sprite and the sprite name changes."

	| s |
	listName ifNil: [^ self].

	(target isKindOf: ScratchSpriteMorph)
		ifTrue: [s := target objName, ' ', listName]
		ifFalse: [s := listName].

	titleMorph contents = s ifFalse: [
		titleMorph contents: s.
		self fixLayout].
