graph ops
paste
	| data1 data2 |
	"inserts the copied data into the dataset where the cursor is."
	
	copy ifNil: [^self ].
	
	"self selectionNil ifTrue: [undoSel := nil.] ifFalse: [undoSel := selection copy.]."
	undoSel := selection copy.
	undoSound := SampledSound samples: graph data samplingRate: samplingRate.
	undoCursor := cursor.
	undoScale := graph scale/ScratchGraphMorph MinScale.


	((self selectionNil not) and: [(selection at: 2) - (selection at: 1) > 3])
		ifTrue: [data1 := graph data copyFrom: 1 to: (graph selection at: 1).
			     data2 := graph data copyFrom: (graph selection at: 2) to: graph data size.]
		ifFalse: [data1 := graph data copyFrom: 1 to: graph cursor truncated.
				 data2 := graph data copyFrom: graph cursor truncated + 1 to: graph data size.].
	
	graph data: (data1, copy, data2).
	viewer data: graph data.

	"scales the botton viewer so that the data fits on the entire screen." 
	(copy size)/graph data size >= 0.05
		ifTrue: [ScratchGraphMorph MinScale: (viewer extent x/ graph data size min: 1).
				viewer scale: 1.
				graph scale: undoScale.
				self fixSliderRange.
				viewer startIndex: 1.
				graph computeSlider.].

	

	graph calculateDataArray.
	viewer calculateDataArray.

	snd setSamples: graph data samplingRate: samplingRate.
	completeSnd setSamples: graph data samplingRate: samplingRate.

	self selection: {data1 size. (data1 size) + (copy size).}.
	cursor := selection at: 2.
	graph startIndex: (slider getScaledValue)*(graph data size).

	viewer flushCachedForm.
		