private
canvasChanged: aRectangle
	"The given rectangle of the canvas form has changed. Report this change to my owner in screen coordinates."
	"Note: The extra pixel of expansion is for the selection rectangle, which draws one pixel outside the enclosed pixels."

	| r |
	r := ((aRectangle origin - (scrollX@scrollY) - 1) * scale) floor corner:
		((aRectangle corner - (scrollX@scrollY) + 1) * scale) ceiling.
	owner invalidRect: (r translateBy: bounds origin).
