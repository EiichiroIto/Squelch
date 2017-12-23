private
rebuildUIForNewLanguage
	"Rebuild my UI after the language or font has been changed."

	World fullRepaintNeeded.
	viewerPane rebuildCategorySelectors.
	self updatePanes.
	self
		view: scriptsPane target
		tab: scriptsPane tabPane currentTab
		category: viewerPane currentCategory.

