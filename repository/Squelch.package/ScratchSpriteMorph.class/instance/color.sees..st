motion ops
color: sensitiveColor sees: soughtColor
	"Return true if any of my pixels of sensitiveColor intersect with pixels of soughtColor in the world."

	| r myImage sensitivePixelsMask map index imageBelowMe |
	r := self bounds intersect: owner bounds.
	r area = 0 ifTrue: [^ false].

	"make a mask with 1 where pixel = sensitiveColor, 0 elsewhere"
	myImage := self imageForm asFormOfDepth: 16.
	sensitivePixelsMask := Form extent: myImage extent depth: 1.
	map := Bitmap new: (1 bitShift: (myImage depth min: 15)).
	map at: (index := sensitiveColor indexInMap: map) put: 1.
	sensitivePixelsMask
		copyBits: ((r origin - self position) extent: r extent)
		from: myImage form
		at: 0@0
		colorMap: map.

	"grab an image of the world below me"
	imageBelowMe := owner patchAt: r without: self andNothingAbove: false.

	"intersect world pixels of the color we're looking for with sensitive pixels mask"
	map at: index put: 0.  "clear map and reuse it"
	map at: (soughtColor indexInMap: map) put: 1.

	sensitivePixelsMask
		copyBits: imageBelowMe boundingBox
		from: imageBelowMe at: 0@0 clippingBox: imageBelowMe boundingBox
		rule: Form and
		fillColor: nil
		map: map.
	^ (sensitivePixelsMask tallyPixelValues at: 2) > 0
