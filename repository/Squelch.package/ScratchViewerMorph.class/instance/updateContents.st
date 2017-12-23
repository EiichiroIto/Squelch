private
updateContents

	| p |
	self target ifNil: [
		pageViewer contents: (Morph new color: ScratchFrameMorph palettePaneColor).
		^ self].

	p := self target viewerPageForCategory: currentCategory.
	p color: ScratchFrameMorph palettePaneColor.

	pageViewer contents: p.
	self isInWorld ifTrue: [self world startSteppingSubmorphsOf: p].
	p fixLayout.
	ScratchTranslator isRTL
		ifTrue: [pageViewer hScrollPixels: (p right)].
