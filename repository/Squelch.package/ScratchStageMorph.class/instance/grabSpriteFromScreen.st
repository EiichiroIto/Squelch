event handling
grabSpriteFromScreen
	"Create a new sprite, grabbing it's costume from an area of the screen."

	| frame m f |
	(frame := self meOrOwnerThatIsA: ScratchFrameMorph) ifNil: [^ self].
	m := ScratchSpriteMorph new.
	(f := m grabFormFromScreen) ifNil: [^ self].
	m onlyCostume: f.
	frame addAndView: m.

