private
generateRotatedForm
	"Compute my rotatedForm and offsetWhenRotated."

	| adjustedAngle srcForm smoothPix pair |
	rotationStyle = #normal
		ifTrue: [adjustedAngle := rotationDegrees]  "smooth rotation"
		ifFalse: [adjustedAngle := 0.0].  "leftRight or none"

	srcForm := self costumeForm.
	((srcForm width = 1) & (srcForm height = 1))
		ifTrue: [adjustedAngle := 0.0].  "don't rotate a 1x1 costume"

	((adjustedAngle = 0.0) and: [1.0@1.0 = scalePoint])
		ifTrue: [  "no rotation or scaling; use original"
			rotatedForm := srcForm.
			offsetWhenRotated := costume rotationCenter]
		ifFalse: [  "generated rotated and/or scaled form"
			(((adjustedAngle rounded \\ 90) = 0) and:
			 [1.0@1.0 = scalePoint]) ifTrue: [
				^ self rotateByFlipping].
			((scalePoint x < 1.0) or: [scalePoint y < 1.0])
				ifTrue: [smoothPix := 2]
				ifFalse: [smoothPix := 1].
			pair := WarpBlt
				rotate2: srcForm
				degrees: adjustedAngle negated
				center: costume rotationCenter
				scaleBy: scalePoint
				smoothing: smoothPix.
			rotatedForm := pair first.
			offsetWhenRotated := (costume rotationCenter + pair last) rounded].

	((rotationStyle = #leftRight) and:
	 [(rotationDegrees > 90.0) and: [rotationDegrees < 270.0]]) ifTrue: [
		"headed left; use flipped"
		rotatedForm := rotatedForm flipBy: #horizontal centerAt: 0@0.
		offsetWhenRotated := (rotatedForm width - offsetWhenRotated x - 1) @ offsetWhenRotated y].
