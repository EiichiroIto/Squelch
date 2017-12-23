scratch skin
skinAt: aSymbolOrString

	^ self skinAt: aSymbolOrString ifAbsent: [ScratchSkin errorKeyNotFound]
