drawing
drawSubmorphsOn: aCanvas
	"Clip submorph drawing to my bounds."

	| clipCanvas |
	clipCanvas := aCanvas copyClipRect: bounds.
	submorphs reverseDo:[:m |
		(clipCanvas isVisible: m fullBounds) ifTrue: [
			m fullDrawOn: clipCanvas]].

	"draw sprite talk bubbles in front of all morphs:"
	submorphs reverseDo:[:m |
		((m isKindOf: ScratchSpriteMorph) and:
		 [m visible and:
		 [clipCanvas isVisible: m fullBounds]]) ifTrue: [
			m drawTalkBubbleOn: clipCanvas]].

