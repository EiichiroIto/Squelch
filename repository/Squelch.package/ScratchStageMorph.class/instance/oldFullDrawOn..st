drawing
oldFullDrawOn: aCanvas
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

	"top/horizontal shadow"
	1 to: 3 do: [:i |
		aCanvas privatePort
			fill: (shadowOrigin + (0@(i-1)) extent: topShadowExtent)
			fillColor: (Color black alpha: (alphas at: i))
			rule: Form blend].

	"left/vertical shadow"
	1 to: 3 do: [:i |
		aCanvas privatePort
			fill: (shadowOrigin + ((i-1)@0) extent: leftShadowExtent)
			fillColor: (Color black alpha: (alphas at: i))
			rule: Form blend].

	"corner shadow fix"
	aCanvas privatePort
		fill: (shadowOrigin extent: (1@1))
		fillColor: (Color white alpha: 0.32)
		rule: Form blend.
	aCanvas privatePort
		fill: (shadowOrigin +(0@1) extent: (1@1))
		fillColor: (Color white alpha: 0.19)
		rule: Form blend.
	aCanvas privatePort
		fill: (shadowOrigin + (1@0) extent: (1@1))
		fillColor: (Color white alpha: 0.19)
		rule: Form blend.
	aCanvas privatePort
		fill: (shadowOrigin +(0@2) extent: (1@1))
		fillColor: (Color white alpha: 0.05)
		rule: Form blend.
	aCanvas privatePort
		fill: (shadowOrigin + (2@0) extent: (1@1))
		fillColor: (Color white alpha: 0.05)
		rule: Form blend.
