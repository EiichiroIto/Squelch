event handling
select

	(self meOrOwnerThatIsA: ScratchLibraryMorph) unhighlightAll. "unhighlight others"
	self highlight: true.
	World displayWorldSafely. "force immediate feedback"
