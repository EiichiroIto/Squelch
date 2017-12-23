private-thumbnails
thumbnailFetchLoop

	contentsPaneMorph contents submorphs do: [:m |
		self isInWorld ifFalse: [^ self].
		m computeThumbnail.
		(Delay forMilliseconds: 100) wait].

	thumbnailFetchProcess := nil.
	Processor terminateActive.  "stop myself--nothing after here will execute"
