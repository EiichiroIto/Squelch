private
grabFormFromScreen
	"Grab a rectangular portion of the screen selected by the user and trim white pixels from around edges (this assumes the stage is white). If the resulting form is empty, return nil."

	| f f2 |
	f := Form fromUser.
	f2 := (Form extent: (f extent + 2) depth: f depth) fillWhite.
	f displayOn: f2 at: 1@1 rule: Form over.
	f2 shapeFill: Color transparent interiorPoint: 0@0.
	f := f2 trimBordersOfColor: Color transparent.
	(f width = 0) | (f height = 0) ifTrue: [^ nil].

	^ f
