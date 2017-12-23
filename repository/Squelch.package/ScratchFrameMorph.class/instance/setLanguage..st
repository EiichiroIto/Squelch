private
setLanguage: aString
	"Set my language and update my blocks."

	| tempJustSaved |
	tempJustSaved := justSaved.
	(workPane submorphs copyWith: workPane) do: [:m |
		(m isKindOf: ScriptableScratchMorph) ifTrue: [
			m convertStacksToTuples]].

	ScratchTranslator setLanguage: (ScratchTranslator isoCodeForName: aString).
	viewerPane rebuildCategorySelectors.

	(workPane submorphs copyWith: workPane) do: [:m |
		(m isKindOf: ScriptableScratchMorph) ifTrue: [
			m convertTuplesToStacks]].
	self updatePanes.
	self
		view: scriptsPane target
		tab: scriptsPane tabPane currentTab
		category: viewerPane currentCategory.
	justSaved := tempJustSaved.
