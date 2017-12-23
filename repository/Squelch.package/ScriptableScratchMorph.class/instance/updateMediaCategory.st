private
updateMediaCategory
	"Update the media category in the viewer, if it is showing."

	| sFrame |
	sFrame := self meOrOwnerThatIsA: ScratchFrameMorph.
	sFrame ifNotNil: [
		sFrame projectModified.
		sFrame updateMediaCategoryFor: self.
		sFrame viewerPane refresh].

