Unicode rendering
detectRenderPlugin
	"Determine which plugin is available for rendering Unicode."
	"self detectRenderPlugin"

	"|  |
	RenderPlugin := nil."

	RenderCenterOffsetCache := IdentityDictionary new.
	RenderVerticalTrimCache := IdentityDictionary new.

	"first try the Uniscribe plugin"
	"hasPlugin := true.
	[UnicodePlugin primMeasureString: 'test'] ifError: [hasPlugin := false].
	hasPlugin ifTrue: [RenderPlugin := UnicodePlugin. ^ self]."

	"then try the Pango plugin"
	"hasPlugin := true.
	[PangoPlugin2 primMeasureString: 'test'] ifError: [hasPlugin := false].
	hasPlugin ifTrue: [RenderPlugin := PangoPlugin2. ^ self]."

	"if we get here, we don't have a Unicode rendering plugin"
	"RenderPlugin := nil."
