event handling
handleTool: toolName hand: hand

	| myStack myOwner copiedStack sFrame varToDelete |
	toolName = 'CopyTool' ifTrue: [
		Sensor shiftPressed ifFalse: [hand toolType: nil].
		(owner isKindOf: ScratchBlockPaletteMorph) ifTrue: [^ self].  "ignore if in palette"
		^ self duplicate].

	toolName = 'CutTool' ifTrue: [
		Sensor shiftPressed ifFalse: [hand toolType: nil].
		(self topBlock owner isKindOf: ScratchScriptsMorph) ifTrue: [
			myStack := self nextBlock.
			myOwner := self owner.
			myStack ifNotNil: [
				(myOwner isKindOf: CBlockMorph)
					ifTrue: [
						copiedStack := myStack shallowCopy.
						self topBlock owner addMorph: copiedStack.
						[myStack top > myOwner bottom] whileTrue: [
							myStack position: (myStack left)@(myStack top - 1).
							self world displayWorldSafely].
						copiedStack delete.
						myOwner attachBlock: myStack]
					ifFalse: [
						(myOwner isKindOf: ScratchScriptsMorph)
							ifTrue: [myOwner addMorph: myStack]
							ifFalse: [
								copiedStack := myStack shallowCopy.
								(self topBlock owner) addMorph: copiedStack.
								[myStack top > myOwner bottom] whileTrue: [
									myStack position: (myStack left)@(myStack top - 1).
									self world displayWorldSafely].
								copiedStack delete.
								myOwner attachBlock: myStack]]].

				self isReporter ifTrue: [self aboutToBeGrabbedBy: hand].
				ScratchFrameMorph putInClipboard: self.
				self delete.
				(myOwner isKindOf: ScratchScriptsMorph) ifTrue: [myOwner step].
				^ self]
		ifFalse: [
			sFrame := self meOrOwnerThatIsA: ScratchFrameMorph.
			((owner isKindOf: ScratchBlockPaletteMorph) and:
			 [sFrame viewerPane currentCategory = #variables]) ifTrue: [
				(self isKindOf: SetterBlockMorph) ifTrue: [
					self variable ifNotNil: [
						varToDelete := self variable.
						(self confirm: 'Really delete variable: ', varToDelete, '?') ifFalse: [^ self].
						self receiver deleteVariable: varToDelete]].
				(self isKindOf: VariableBlockMorph) ifTrue: [
					varToDelete := self commandSpec.
					(self confirm: 'Really delete variable: ', varToDelete, '?') ifFalse: [^ self].
					self receiver deleteVariable: varToDelete].
				((varToDelete notNil) and: [sFrame notNil]) ifTrue: [
					sFrame workPane deleteVariable: varToDelete.
					sFrame viewerPane categoryChanged: 'variables']]].
	^ self].

