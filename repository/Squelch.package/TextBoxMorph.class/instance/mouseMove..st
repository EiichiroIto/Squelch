event handling
mouseMove: evt

	| x y |
	resizeMode ifNil: [^ self].

	x := evt cursorPoint x.
	y := evt cursorPoint y.
	#left = resizeMode ifTrue: [
		^ self bounds: (x@self top corner: self bottomRight)].
	#right = resizeMode ifTrue: [
		^ self bounds: (self topLeft corner: x@self bottom)].
	#bottom = resizeMode ifTrue: [
		^ self bounds: (self topLeft corner: self right@y)].
	#bottomLeft = resizeMode ifTrue: [
		^ self bounds: (x@self top corner: self right@y)].
	#bottomRight = resizeMode ifTrue: [
		^ self bounds: (self topLeft corner: evt cursorPoint)].
