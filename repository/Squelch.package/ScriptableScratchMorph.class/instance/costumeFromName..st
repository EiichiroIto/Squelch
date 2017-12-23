looks ops
costumeFromName: aString
	"If there is a costume by the given name, return it. Otherwise, return nil."

	| cameraCostume |
	((aString = '*** camera ***') and:
	 [CameraPlugin cameraIsAvailable]) ifTrue: [
		cameraCostume := CameraMedia new.
		(self class = ScratchStageMorph) ifTrue: [cameraCostume frameExtent: self extent].
		^ cameraCostume].

	^ media
		detect: [:el | el isSound not and: [el mediaName = aString]]
		ifNone: [nil]
