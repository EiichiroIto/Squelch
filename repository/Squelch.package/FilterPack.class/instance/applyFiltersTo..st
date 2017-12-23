filtering
applyFiltersTo: srcForm
	"Apply all currently active filters to the given source form and answer the resulting filtered form. The argument Form itself is not changed."

	self applyStaticFiltersTo: (srcForm asFormOfDepth: 32).

	"apply the dynamic filters"
	pointillizeSize = 0 ifFalse: [self applyPointillizeFilter].
	waterRippleRate = 0 ifFalse: [self applyWaterRippleFilter].

	reapply := false.
	^ resultForm
