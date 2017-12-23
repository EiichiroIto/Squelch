other
normalize: sampleArray
	"Return a copy of the given sample array scaled to use the maximum 16-bit sample range. Remove any D.C. offset."

	| max abs scale out |
	max := 0.
	sampleArray do: [:s |
		s > 0 ifTrue: [abs := s] ifFalse: [abs := 0 - s].
		abs > max ifTrue: [max := abs]].
	scale := ((1 << 15) - 1) asFloat / max.

	out := sampleArray species new: sampleArray size.
	1 to: sampleArray size do: [:i |
		out at: i put: (scale * (sampleArray at: i)) truncated].
	^ out
