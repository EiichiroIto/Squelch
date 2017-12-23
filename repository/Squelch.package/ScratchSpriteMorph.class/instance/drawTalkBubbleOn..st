drawing
drawTalkBubbleOn: aCanvas
	"Draw and talk/think bubble submorphs."

	submorphs size = 0 ifTrue: [^ self].
	submorphs reverseDo: [:m |
		(m isKindOf: ScratchTalkBubbleMorph) ifTrue: [
			aCanvas fullDrawMorph: m]].
