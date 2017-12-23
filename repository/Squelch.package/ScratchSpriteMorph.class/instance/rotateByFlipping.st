private
rotateByFlipping
	"Compute my rotatedForm and offsetWhenRotated for unscaled rotation by a multiple of 90 degrees."

	| a center srcForm |
	a := rotationDegrees rounded \\ 360.
	a < 0 ifTrue: [a := a + 360].
	srcForm := self costumeForm.
	center := costume rotationCenter.
	0 = a ifTrue: [
		rotatedForm := srcForm.
		offsetWhenRotated := center].
	90 = a ifTrue: [
		rotatedForm := srcForm rotateBy: #right centerAt: 0@0.
		offsetWhenRotated := (srcForm height - 1 - center y) @ center x].
	180 = a ifTrue: [
		rotatedForm := srcForm rotateBy: #pi centerAt: 0@0.
		offsetWhenRotated := srcForm extent - 1 - center].
	270 = a ifTrue: [
		rotatedForm := srcForm rotateBy: #left centerAt: 0@0.
		offsetWhenRotated := center y @ (srcForm width - 1 - center x)].

