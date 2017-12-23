class initialization
initialize
	"ScratchTranslator initialize"

	TranslationDict := Dictionary new.
	ISODict := Dictionary new.
	MIDITranslationSet := Set new.
	UITranslationSet := Set new.

	"RenderAntiAliasing := false."
	HeaderString := ''.
	"RenderPlugin := nil."
	self setRenderingHints.

	ColonSuffix := ':', (Unicode value: 16r200F) asString.
	EllipsesSuffix := '...', (Unicode value: 16r200F) asString.
