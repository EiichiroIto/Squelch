drawing
invalidRect: damageRect
	"Clip damage reports to my bounds, since drawing is clipped to my bounds."

	| r |
	(owner isKindOf: ScratchFrameMorph) ifTrue: [owner projectModified].

	(self isQuarterSize and: [owner isKindOf: ScratchFrameMorph])
		ifTrue: [
			r := (bounds origin + ((damageRect origin - bounds origin) / 2.0)) extent: (damageRect extent / 2.0).
			r := r intersect: (bounds origin extent: bounds extent // 2)]
		ifFalse: [
			r := (damageRect topLeft truncated) corner: (damageRect right ceiling@damageRect bottom ceiling).
			r := r intersect: self bounds].

	(r width > 0 and: [r height > 0]) ifTrue: [super invalidRect: r].
