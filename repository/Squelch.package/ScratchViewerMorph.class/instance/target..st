accessing
target: aScratchObject
	"Start viewing the given object, if not object, return an empty viewer."

	| categories |
	target := aScratchObject.
	aScratchObject ifNil: [
		^ self currentCategory: 'none'].

	"keep the same category selected if possible"
	categories := target blockCategories.
	(categories includes: currentCategory)
		ifTrue: [self currentCategory: currentCategory]
		ifFalse: [self currentCategory: categories first].

	self isInWorld ifTrue: [self world startSteppingSubmorphsOf: self].
