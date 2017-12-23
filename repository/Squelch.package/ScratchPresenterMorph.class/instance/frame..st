initialization
frame: aScratchFrameMorph

	frame := aScratchFrameMorph.
	stage := aScratchFrameMorph workPane.

	"insert stage in an OffscreenWorldMorph to detect damage"
	offscreenWorld := OffscreenWorldMorph new on: stage.
	offscreenWorld frame: aScratchFrameMorph.
	offscreenWorld presenter: self