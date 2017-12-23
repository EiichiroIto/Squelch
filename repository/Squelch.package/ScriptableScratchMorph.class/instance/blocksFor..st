blocks
blocksFor: aCategory
	"Answer a collection of blocks for the given category. Mixed with the blocks are dash and tilde symbols (#- and #~) indicating where full and half spaces should be inserted when laying out the blocks."

	| blockColor blocksList category b |
	blockColor := self class blockColorFor: aCategory.
	blocksList := OrderedCollection new.
	category := nil.
	self class blockSpecs do: [:spec |
		((spec isKindOf: String) and: [spec ~= #- and: [spec ~= #~]])
			ifTrue: [category := spec]
			ifFalse: [
				category = aCategory ifTrue: [
					(spec = #-) | (spec = #~)
						ifTrue: [blocksList addLast: spec]
						ifFalse: [
							(b := self blockFromSpec: spec color: blockColor) ifNotNil: [
								blocksList addLast: b]]]]].
	^ blocksList asArray
