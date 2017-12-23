brush creation
brushCursorSize: brushSize color: brushColor scale: scale
	"Answer a round brush cursor of the given size and color."
	"BrushDict := Dictionary new. (PaintCanvas new brushCursorSize: 21 color: Color yellow) display"

	| outline f cm hole c |
	(BrushDict includesKey: brushSize) ifFalse: [
		outline := Form dotOfSize: brushSize.
		f := ColorForm extent: outline extent depth: 2.
		cm := Bitmap with: 0 with: (brushSize > 2 ifTrue: [1] ifFalse: [2]).
		(BitBlt toForm: f)
			sourceForm: outline;
			destRect: f boundingBox;
			combinationRule: Form paint;
			colorMap: cm;
			copyBits.
		brushSize > 2 ifTrue: [
			hole := Form dotOfSize: brushSize - 2.
			cm := Bitmap with: 0 with: 2.
			(BitBlt toForm: f)
				sourceForm: hole;
				sourceRect: hole boundingBox;
				destOrigin: 1@1;
				combinationRule: Form paint;
				colorMap: cm;
				copyBits].
		BrushDict at: brushSize put: f].

	c := brushColor.
	c isTransparent & (brushSize <= 2) ifTrue: [c := Color black].  "small erasers"
	f := (BrushDict at: brushSize)
	  colors: (Array with: Color transparent with: Color black with: c with: Color transparent);
	  magnifyBy: scale.
	^ f
