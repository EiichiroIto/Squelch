private
positionTalkBubble

	| bubble stage stageBounds y f r yInset strip x |
	(bubble := self valueOfProperty: #talkBubble) ifNil: [^ self].
	(stage := self meOrOwnerThatIsA: ScratchStageMorph) ifNil: [^ self].
	stageBounds := stage bounds.

	f := self imageForm.
	r := f rectangleEnclosingPixelsNotOfColor: Color transparent.
	yInset := 0.
	((r area = 0) or: [r height < 10])
		ifTrue: [r := f boundingBox]
		ifFalse: [
			yInset := (r top max: 0) min: (r height - 10).
			strip := f copy: ((0@r top) extent: (f width@(10 min: f height))).
			r := strip rectangleEnclosingPixelsNotOfColor: Color transparent].

	x := self right - ((f width - r right) min: f width // 2).
	bubble pointLeft: true.
	((x + bubble width) <= stageBounds right) ifFalse: [
		x := (self left - bubble width) + (r left min: (f width // 2)).
		bubble pointLeft: false].

	y := (self top + yInset + 10 - bubble height) min: (stageBounds bottom - bubble height) max: stageBounds top.
	bubble position: x@y.
	self layoutChanged.
