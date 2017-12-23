Unicode rendering
xRangesFor: utf8 font: aStrikeFont
	"Anwer an array of (leftX, rightX) pairs for the given Unicode string. There will be an entry in the resulting array for each UTF character in the input string, even when characters combine. Thus, in general, the x ranges for characters can overlap."

	RenderPlugin ifNil: [^ Array new: (utf8 asUTF32 size) withAll: #(0 0)].
	self setFont: aStrikeFont antialias: RenderAntiAliasing.
	^ RenderPlugin xRangesFor: utf8
