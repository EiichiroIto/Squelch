event handling
showBalloon: msg

	| w worldBounds tooltip |

	w := self world.
	tooltip := (ScratchToolTipMorph string: msg for: self).
	w addMorphFront: (tooltip position: self bottomLeft + (0@8)).
	((worldBounds := w bounds) containsRect: tooltip bounds) ifFalse:
		[tooltip bounds: (tooltip bounds translatedToBeWithin: worldBounds)].