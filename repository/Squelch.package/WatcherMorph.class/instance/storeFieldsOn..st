object i/o
storeFieldsOn: anObjStream

	super storeFieldsOn: anObjStream.
	self storeFieldsNamed: #(
		titleMorph
		readout
		readoutFrame
		scratchSlider
		watcher
		isSpriteSpecific
		unused
		sliderMin
		sliderMax
		isLarge
	) on: anObjStream.
