menu/button ops
editSound

	| sFrame workPane editor |
	sFrame := self meOrOwnerThatIsA: ScratchFrameMorph.
	sFrame ifNil: [^ self].
	workPane := sFrame workPane.

	editor := ScratchSoundEditor new client: scratchObj; sound: media sound.
	editor soundName: media mediaName.
	editor position: workPane topLeft + (10@10).
	workPane addMorph: editor.
	workPane world ifNotNil: [workPane world startSteppingSubmorphsOf: editor].
