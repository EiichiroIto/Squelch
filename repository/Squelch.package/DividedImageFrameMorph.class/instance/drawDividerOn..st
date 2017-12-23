drawing
drawDividerOn: aCanvas
	"Draw my divider edge."

	| w r f slice |
	w := self width - (leftJointForm width + rightJointForm width) - leftMargin - rightMargin.
	r := ((self left + leftJointForm width + leftMargin) @ (self top + topSectionHeight - 4))
		extent: (w @ middleBarForm height).

	f := edgeCache at: 5.
	(f isNil or: [f extent ~= r extent]) ifTrue: [
		f := Form extent: r extent depth: 32.
		slice := middleBarForm copy: (((middleBarForm width // 2) @ 0) extent: (1 @ r height)).
		0 to: r width by: slice width do: [:x | slice displayOn: f at: x@0 rule: Form blend].
		edgeCache at: 5 put: f].

	aCanvas translucentImage: f at: r topLeft.
