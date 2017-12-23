accessing
updateSpritesList
	"Populate the sprites list, which keeps track of the ordering of the sprite thumbnails"

	| frame |
	frame := self meOrOwnerThatIsA: ScratchFrameMorph.
	frame ifNil: [^ self].
	sprites := OrderedCollection new.
	frame libraryPane spriteThumbnails do: [:m | m target ifNotNil: [sprites addLast: m target]].
