drawing
drawQuarterSizeOn: aCanvas
	"Draw myself and my submorphs to an offscreen canvas, then scale down to quarter size and draw that on the given canvas."

	| r srcR c |
	cachedForm ifNil: [cachedForm := Form extent: self extent depth: 32].
	r := aCanvas clipRect intersect: (bounds origin extent: bounds extent // 2).

	srcR := ((r origin - bounds origin) * 2.0) truncated extent: (r extent * 2.0) rounded.
	c := (FormCanvas on: cachedForm)
		copyOrigin: self position negated
		clipRect: srcR.
	super fullDrawOn: c.

	ScratchPlugin halfSize: cachedForm into: Display srcPoint: srcR origin dstRect: r.

"xxx
	cachedForm unhibernate.
	LowResPlugin
		primHalf2Average: cachedForm bits w: cachedForm width h: cachedForm height
		into: Display bits w: Display width h: Display height
		srcX: srcR left srcY: srcR top
		dstX: r left dstY: r top dstW: r width dstH: r height.

	(WarpBlt toForm: Display)
		sourceForm: cachedForm;
		combinationRule: Form over;
		clipRect: aCanvas clipRect;
		cellSize: 2;
		copyQuad: srcR corners toRect: r.
xxx"

	"the following scales down entire stage:"
"	LowResPlugin scale: cachedForm into: aCanvas form at: aCanvas origin + self position."
