stepping
step
	"Follow the anchor block"

	| t |
	anchor ifNil: [^ self].

	anchor isInWorld ifFalse: [^ self detach].  "anchor block was deleted"

	"check for layout change and fix offset if needed"
	(t := anchor topBlock lastLayoutTime) = lastLayoutTime ifFalse: [
		self updateAnchorOffset.
		oldAnchorPos := nil.  "force position update"
		lastLayoutTime := t].

	anchor position ~= oldAnchorPos ifTrue: [
		self updatePosition.
		oldAnchorPos := anchor position].
