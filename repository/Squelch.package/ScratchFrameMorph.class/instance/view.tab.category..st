other
view: aMorph tab: t category: c
	"Add given morph to the work pane and view it."

	scriptsPane target: aMorph.
	scriptsPane tabPane currentTab: t.
	viewerPane
		target: aMorph;
		currentCategory: c.
