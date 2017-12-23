event handling
mouseEnterDragging: evt
	"Switch the tabs to script if a block is current being dragged"

	(currentCategory = 'Scripts') ifFalse:[
		self currentCategory: 'Scripts'.
		tabPaneMorph currentTab: 'Scripts'].
