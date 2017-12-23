other
scriptCountFor: aSprite
	"Answer the number of scripts in the given sprite. The scripts are in tuple form. A script must start with a hat block."

	| hats count stack |
	hats := #(EventHatMorph KeyEventHatMorph MouseClickEventHatMorph WhenHatBlockMorph).
	count := 0.
	aSprite blocksBin do: [:pair |
		stack := pair at: 2.
		((stack size > 0) and: [stack first size > 0]) ifTrue: [
			(hats includes: stack first first) ifTrue: [count := count + 1]]].
	^ count

