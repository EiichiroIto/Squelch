media
costumeNames
	"Answer a list of my costume (costume = non-sound media object) names."

	| result nm |
	result := OrderedCollection new.
	media do: [:el |
		el isSound ifFalse: [
			nm := el mediaName.
			(result includes: nm) ifFalse: [result add: nm]]].

	result := result asArray.
	CameraPlugin cameraIsAvailable ifTrue: [
		result := result copyWith: '*** camera ***'].
	^ result
