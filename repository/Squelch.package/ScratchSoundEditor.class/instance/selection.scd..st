accessing
selection: aNumber scd: anotherNumber

	selection := { aNumber min: anotherNumber. aNumber max: anotherNumber}.
	graph selection: selection.
	viewer selection: selection.
	graph flushCachedForm; changed.
	viewer flushCachedForm; changed.