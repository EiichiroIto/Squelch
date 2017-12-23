event handling
unlockedMorphsAt: aPoint addTo: mList
	"Adjust aPoint to handle quarter-size case if necessary."

	| p |
	self isQuarterSize ifFalse: [
		super unlockedMorphsAt: aPoint addTo: mList.
		^ mList].

	(self containsPoint: aPoint) ifFalse: [^ mList]. "quick elimination"
	p := self position + (2 * (aPoint - self position)).

	submorphs size > 0 ifTrue: [
		submorphs do: [:m | m unlockedMorphsAt: p addTo: mList]].
	mList addLast: self.

	^ mList
