sensing ops
promptForInput: questionString

	| s prompter |
	(s := self meOrOwnerThatIsA: ScratchStageMorph) ifNil: [^ self].
	prompter := ScratchPrompterMorph new.
	((self isKindOf: ScratchStageMorph) | (self visible not))
		ifTrue: [
			prompter question: questionString]
		ifFalse: [
			self showQuestion: questionString.
			prompter sprite: self].

	prompter left: s center x - (prompter width // 2).
	prompter bottom: s bottom - 5.
	prompter beSticky.
	s addMorphFront: prompter.
	prompter grabKeyboardFocus.
	^ prompter