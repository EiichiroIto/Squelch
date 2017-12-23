as yet unclassified
drawOn: aCanvas
	| clipC |
	clipC := aCanvas copyClipRect: self bounds.
	clipC translucentImage: self form at: self bounds origin