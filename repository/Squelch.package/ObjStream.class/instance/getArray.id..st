fixed format-reading
getArray: anObject id: classID

	| sz result |
	firstPass ifTrue: [
		sz := stream uint32.
		result := Array new: sz.
		1 to: sz do: [:i | result at: i put: self readField].
		^ result].

	"fix references"
	self fixRefsInArray: anObject.
