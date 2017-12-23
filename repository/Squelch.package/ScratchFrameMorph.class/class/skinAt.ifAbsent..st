scratch skin
skinAt: aSymbolOrString ifAbsent: aBlock
	"Answer the skin image with the given name. In XO mode, first check to see if an entry appears in ScratchSkinXO. If so, use it. Otherwise, use the image from the normal skin dictionary."

	| k |
	ScratchSkin ifNil: [ self initialize ].
	k := aSymbolOrString asSymbol.
	^ ScratchSkin at: k ifAbsent: aBlock