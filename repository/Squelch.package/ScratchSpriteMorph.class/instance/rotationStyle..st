accessing
rotationStyle: aSymbol
	"Set my rotation style to #normal, #leftRight, or #none. Styles mean:
		#normal	-- smooth 360 degree rotation
		#leftRight	-- flip about the vertical axis
		#none		-- do not rotate"

	rotationStyle := aSymbol.
	self costumeChanged.
	self positionTalkBubble.
