instance creation
ofType: aSymbol
	"#edge #corner"
	
	(aSymbol = #edge)
		ifTrue: [^ self new form: (ScratchFrameMorph skinAt: #resizeIconEdge); type: aSymbol]
		ifFalse: [^ self new form: (ScratchFrameMorph skinAt: #resizeIconCorner); type: aSymbol].
