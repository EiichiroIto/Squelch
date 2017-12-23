blocks
blockFromTuple: tuple receiver: scriptOwner
	"Answer a new block for the given tuple."

	| k spec blockColor block argCount arg argBlock |
	k := tuple first.
	(#(readVariable changeVariable) includes: k) ifTrue: [
		^ self variableBlockFromTuple: tuple receiver: scriptOwner].

	#contentsOfList: = k ifTrue: [
		^ ListContentsBlockMorph new
			color: ScriptableScratchMorph listBlockColor;
			receiver: scriptOwner;
			commandSpec: tuple second;
			selector: #contentsOfList:].

	(#(EventHatMorph KeyEventHatMorph MouseClickEventHatMorph WhenHatBlockMorph) includes: k) ifTrue: [
		block := self hatBlockFromTuple: tuple receiver: scriptOwner.
		(block isKindOf: WhenHatBlockMorph) ifTrue: [block color: Color red].
		^ block].

	#scratchComment = k ifTrue: [
		block := ScratchCommentMorph new.
		tuple size > 1 ifTrue: [block commentMorph contents: (tuple at: 2)].
		tuple size > 2 ifTrue: [(tuple at: 3) ifFalse: [block toggleShowing]].
		tuple size > 3 ifTrue: [block width: (tuple at: 4)].
		tuple size > 4 ifTrue: [block anchor: (self blockWithID: (tuple at: 5))].
		^ block].

	#comment: = k ifTrue: [
		block := CommentBlockMorph new.
		tuple size > 1 ifTrue: [block comment: (tuple at: 2)].
		tuple size > 2 ifTrue: [(tuple at: 3) ifFalse: [block toggleShowing]].
		block color: (Color r: 0.8 g: 0 b: 0).  "obsolete"
		^ block].

	spec := BlockSpecDict at: k ifAbsent: [nil].
	spec ifNil: [
		^ scriptOwner
			blockFromSpec: #('obsolete!' - yourself)
			color: Color red].

	blockColor := BlockColorDict at: k ifAbsent: [Color red].
	block := scriptOwner blockFromSpec: spec color: blockColor.
	(block isKindOf: CommandBlockMorph) ifTrue: [
		argCount := block argumentCount min: tuple size - 1.
		1 to: argCount do: [:i |
			((#(+ - / * =) includes: block selector) and: [ScratchTranslator isRTLMath]) "RTLMath operators are RTL"
				ifTrue: [arg := tuple at: ((argCount + 1) - (i - 1))]
				ifFalse: [arg := tuple at: i + 1].
			(arg isKindOf: Array)
				ifTrue: [  "argument is a block"
					((arg size = 1) and: [arg first isKindOf: Array]) ifTrue: [arg := arg first].
					argBlock := self blockFromTuple: arg receiver: scriptOwner.
					block replaceArgMorph: (block argumentAt: i) by: argBlock]
				ifFalse: [  "argument is a value"
					(block argumentAt: i) defaultValue: arg]].

		(block isKindOf: CBlockMorph) ifTrue: [
			(tuple last isKindOf: Array) ifTrue: [
				block firstBlockList: (self stackFromTupleList: tuple last receiver: scriptOwner)]].

		(block isKindOf: IfElseBlockMorph) ifTrue: [
			arg := tuple at: tuple size - 1.
			(arg isKindOf: Array) ifTrue: [
				block trueBlock: (self stackFromTupleList: arg receiver: scriptOwner)].
			arg := tuple at: tuple size.
			(arg isKindOf: Array) ifTrue: [
				block falseBlock: (self stackFromTupleList: arg receiver: scriptOwner)]].

		(block isKindOf: ReporterBlockMorph) ifTrue: [
			((spec at: 2) includes: $b) ifTrue: [block isBoolean: true]]].

	^ block
