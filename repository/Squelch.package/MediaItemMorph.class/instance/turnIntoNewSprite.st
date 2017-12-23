menu/button ops
turnIntoNewSprite
	"Create a new sprite from this costume and delete the costume from previos sprite."

	| m frame |
	frame := self meOrOwnerThatIsA: ScratchFrameMorph.
	frame ifNil: [^ self].
	m := ScratchSpriteMorph new soleCostume: self media deepCopy.
	frame addAndView: m.
	self deleteMedia.
