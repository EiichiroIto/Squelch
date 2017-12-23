drawing
drawSubmorphsOn: aCanvas
	"Display submorphs back to front, but do not draw and talk/think bubble submorphs."

	submorphs reverseDo: [:m |
		(m isKindOf: ScratchTalkBubbleMorph) ifFalse: [
			aCanvas fullDrawMorph: m]].
