graph ops
cut 

	| data1 data2 |
	(selection at: 1) ifNil: [^ self.].

	undoSound := SampledSound samples: graph data samplingRate: samplingRate.
	undoSel := graph selection copy.
	undoCursor := cursor.
	undoScale := graph scale/ScratchGraphMorph MinScale.

	self copy.
	data1 := graph data copyFrom: 1 to: (selection at: 1).
	data2 := graph data copyFrom: (selection at: 2) to: graph data size.
	
	graph data: (data1, data2).
	viewer data: graph data.
		
	"scales the botton viewer so that the data fits on the entire screen." 
	((selection second - selection first)/graph data size asFloat) >= 0.05
		ifTrue: [ScratchGraphMorph MinScale: (viewer extent x/ graph data size min: 1).
				viewer scale: 1.
				graph scale: undoScale.
				viewer startIndex: 1.
				graph computeSlider.
				self fixSliderRange.].

	graph calculateDataArray.
	viewer calculateDataArray.

	snd setSamples: graph data samplingRate: samplingRate.
	completeSnd setSamples: graph data samplingRate: samplingRate.
	cursor := (selection at: 1).
	
	selection at: 1 put: nil. 
	selection at: 2 put: nil.