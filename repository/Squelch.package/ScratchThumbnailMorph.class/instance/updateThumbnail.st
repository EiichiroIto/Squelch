stepping
updateThumbnail

	| f e r form |
	form := self form.
	form fillColor: Color transparent.
	target ifNil: [^ self].

	f := target imageForm.

	((f width <= form width) & (f height <= form height)) ifTrue: [
		"target's image fits without shrinking"
		f displayOn: form at: ((form extent - f extent) // 2).
		^ self changed].

	f width > f height 
		ifTrue: [e := form width @ ((f height * form width) // f width)]
		ifFalse: [e := ((f width * form height) // f height) @ form height].
	e := e max: (8@8).
	r := Rectangle center: (form extent // 2) extent: e.

	(WarpBlt toForm: form)
		sourceForm: f;
		cellSize: 2;  "do smoothing; this also installs a colormap"
		combinationRule: Form paint;
		copyQuad: f boundingBox innerCorners toRect: (r insetBy: 2).

	lastUpdateMSecs := target costumeChangeMSecs.
	self changed.
