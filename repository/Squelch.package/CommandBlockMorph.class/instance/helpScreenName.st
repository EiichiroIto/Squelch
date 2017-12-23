accessing
helpScreenName
	"Answer the name of the help screen for this block, or nil if no help is available."

	selector isInfix ifTrue: [
		'+' = selector ifTrue: [^ 'minus'].
		'-' = selector ifTrue: [^ 'minus'].
		'*' = selector ifTrue: [^ 'minus'].
		'/' = selector ifTrue: [^ 'minus'].

		'<' = selector ifTrue: [^ 'lessThan'].
		'=' = selector ifTrue: [^ 'equals'].
		'>' = selector ifTrue: [^ 'greaterThan'].

		'&' = selector ifTrue: [^ 'and'].
		'|' = selector ifTrue: [^ 'or'].

		'\\' = selector ifTrue: [^ 'mod'].

		^ nil].

	"answer the selector with colons mapped to underscores"
	^ selector asString collect: [:ch | ch = $: ifTrue: [$_] ifFalse: [ch]]
