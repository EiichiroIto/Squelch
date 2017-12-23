private
layoutChanged

	super layoutChanged.
	anchor ifNotNil: [anchor topBlock commentLayoutChanged].

