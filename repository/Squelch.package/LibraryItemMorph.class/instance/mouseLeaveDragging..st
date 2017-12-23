event handling
mouseLeaveDragging: evt

	"(evt hand submorphs at: 1) removeCopyTooltip."

	isSelected ifTrue: [^ self].

	rolloverOn := false.
	currentForm ifNotNil: [
		currentForm delete.
		currentForm := nil].
	self changed.
