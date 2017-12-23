private
drawPlayCursorOn: aCanvas

	| ptr x r c |

	editor playCursor ifNil: [^self].
	(editor endPlaying ~= data size) & (editor playCursor >= (editor endPlaying)) ifTrue: [^self].

	ptr := (editor playCursor asInteger max: 1) min: data size.
	c := cursorColor.
	r := self innerBounds.
	x := r left + ((ptr - startIndex)*scale).
	((x >= r left) and: [x <= r right]) ifTrue: [
		aCanvas fillRectangle: (x@r top corner: x + 1@r bottom) color: c].
