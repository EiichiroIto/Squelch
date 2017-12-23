private
fixLayout

	ScratchTranslator isRTL
		ifTrue: [deleteMorph position: (self bottomLeft) - (0@deleteMorph height) + (4@0) - (0@1)]
		ifFalse: [deleteMorph position: (self bottomRight) - (deleteMorph extent) - (0@2)].
