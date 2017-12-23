other
toggleProcess

	| toolTip |
	toolTip := self valueOfProperty: #toolTip.
	toolTip ifNotNil: [
		toolTip delete.
		self setProperty: #toolTip toValue: nil.
		^ self].

	self showValue.
