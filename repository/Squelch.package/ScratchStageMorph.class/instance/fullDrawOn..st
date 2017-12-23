drawing
fullDrawOn: aCanvas
	"Calls super fullDrawOn and then draws the frame shadow"

	| shadowOrigin topShadowExtent leftShadowExtent alphas |

	(self isQuarterSize and: [self isInWorld]) ifTrue: [
		^ self drawQuarterSizeOn: aCanvas].

	super fullDrawOn: aCanvas.

	"don't draw shadows if owner is not a ScratchFrameMorph"
	(owner isKindOf: ScratchFrameMorph) ifFalse: [^ self].

	"shadow constants"
	shadowOrigin := self topLeft + aCanvas origin.
	topShadowExtent := self width@1.
	leftShadowExtent := 1@self height.

	"shadow alpha values"
	alphas := FloatArray
		with: 0.51
		with: 0.26
		with: 0.07.