drawing
drawSubmorphsOn: aCanvas
	"Display submorphs back to front."

	submorphs reverseDo: [:m |
		(m = tabPaneMorph) ifFalse: [aCanvas fullDrawMorph: m]].
