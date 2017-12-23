graph ops
crop
	
	| sel |

	"Crops the sound in the sound editor to be only the selected region"

	sel := ((selection at: 1) notNil and: [(selection at: 2) - (selection at: 1) > 3]).
	sel ifFalse: [^self].

	undoSel := graph selection copy.
	undoSound := SampledSound samples: graph data samplingRate: samplingRate.
	undoCursor := cursor.
	undoScale := graph scale/ScratchGraphMorph MinScale.

	sel := graph data copyFrom: (selection at: 1) to: (selection at: 2).
	graph data: sel.
	viewer data: graph data.
	cursor := ((cursor - (selection at: 1)) truncated max: 1) min: graph data size truncated.

	"scales the botton viewer so that the data fits on the entire screen." 
	(selection second - selection first)/graph data size >= 0.05
		ifTrue: [ScratchGraphMorph MinScale: (viewer extent x/ graph data size min: 1). "the mult factor in all scales, the minimum scale allowed...to get this just do self scale: 1, since this multiplied by input"
				viewer scale: 1.
				graph scale: 1.
				viewer startIndex: 1.
				graph computeSlider.
				self fixSliderRange.].

	graph calculateDataArray.
	viewer calculateDataArray.

	snd setSamples: sel samplingRate: samplingRate.
	completeSnd setSamples: sel samplingRate: samplingRate.

	selection at: 1 put: 1.
	selection at: 2 put: graph data size.
