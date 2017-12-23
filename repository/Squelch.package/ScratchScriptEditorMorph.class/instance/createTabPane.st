initialization
createTabPane

	| tabOnForm tabOffForm tabID tabLabel |

	"create tab pane"
	tabPaneMorph := ScratchTabPaneMorph new.
	tabPaneMorph
		borderWidth: 0;
		color: Color transparent;
		targetPane: self.

	tabOnForm := (ScratchFrameMorph skinAt: #tabOn).
	tabOffForm := (ScratchFrameMorph skinAt: #tabOff).

	"add the tabs"
	#(Scripts Costumes Sounds) do: [:spec |
		tabID := spec asString.
		tabLabel := tabID localized.
		tabPaneMorph
			createTab: tabID
			withLabel: tabLabel
			onForm: tabOnForm
			offForm: tabOffForm].

	"set current tab and add to frame"
	tabPaneMorph currentTab: 'Scripts'.
	self addMorph: tabPaneMorph.
