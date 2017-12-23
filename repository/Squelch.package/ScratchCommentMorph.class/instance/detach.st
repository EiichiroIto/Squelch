private
detach

	| oldAnchor |
	oldAnchor := anchor.
	anchor := nil.
	connector ifNotNil: [
		connector delete.
		connector := nil].
	oldAnchor ifNotNil: [
		oldAnchor topBlock commentLayoutChanged].
