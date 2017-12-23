filtering
filtersActive
	"Answer true if any filters are active."

	reapply ifTrue: [^ true].
	^ (pointillizeSize ~= 0) | (waterRippleRate ~= 0)

