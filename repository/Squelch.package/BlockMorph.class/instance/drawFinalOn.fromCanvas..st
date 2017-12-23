drawing
drawFinalOn: aCanvas fromCanvas: c

	| flipped |
	ScratchTranslator isRTL 
		ifTrue: [flipped := c form flipBy: #horizontal centerAt: c form center.
			aCanvas paintImage: flipped at: self topLeft]
		ifFalse:[aCanvas paintImage: c form at: self topLeft].
