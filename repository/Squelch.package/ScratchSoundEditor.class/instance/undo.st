graph ops
undo


	| tmpSound tmpSel tmpCursor tmpScale |

	undoSound ifNil: [^self].

	tmpSound := SampledSound samples: graph data samplingRate: samplingRate.
	tmpSel := graph selection copy.
	tmpCursor := cursor.
	tmpScale := graph scale/ScratchGraphMorph MinScale.

	graph data: undoSound samples copy.
	viewer data: graph data.
	
	"scales the botton viewer so that the data fits on the entire screen." 
	(tmpSound samples size - graph data size) abs > 3
		ifTrue: [ScratchGraphMorph MinScale: ((viewer extent x/ graph data size) min: 1).
				viewer scale: 1.
				graph scale: undoScale.
				viewer startIndex: 1.
				graph computeSlider.
				self fixSliderRange.].

	graph calculateDataArray.
	viewer calculateDataArray.

	snd setSamples: graph data samplingRate: samplingRate.
	completeSnd setSamples: graph data samplingRate: samplingRate.
	self selection: undoSel copy.
	cursor := undoCursor.

	undoSound := tmpSound.
	undoSel := tmpSel.
	undoCursor := tmpCursor.
	undoScale := tmpScale.
