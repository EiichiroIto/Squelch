private
layoutForViewer

	watcher removeAllMorphs.
	ScratchTranslator isRTL
		ifTrue: [watcher
			addMorphBack: (Morph new color: color; extent: 2@2);
			addMorphBack: readoutFrame;
			addMorphBack: (AlignmentMorph new color: color; width: 4; hResizing: #rigid);
			addMorphBack: titleMorph;
			addMorphBack: (Morph new color: color; extent: 3@3)]
		ifFalse: [watcher
			addMorphBack: (Morph new color: color; extent: 3@3);
			addMorphBack: titleMorph;
			addMorphBack: (AlignmentMorph new color: color; width: 4; hResizing: #rigid);
			addMorphBack: readoutFrame;
			addMorphBack: (Morph new color: color; extent: 2@2)].
