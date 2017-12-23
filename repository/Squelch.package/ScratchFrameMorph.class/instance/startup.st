startup
startup

	| startupFileNames fileName arg presentationMode |
	"HostSystemMenus startUp.
	HostSystemMenus menuBarControler reviseHostMenus."
	ScriptableScratchMorph randomInit.
	ScratchTranslator detectRenderPlugin.
	ScratchTranslator importLanguagesList.

	self processSettingsFile.
	self readDefaultNotes.

	self updateProjectName.
	shuffledCostumeNames := nil.
	author := ''.
	loginName := ''.
	loginPassword := ''.
	justSaved := true.
	presentationMode := false.

	startupFileNames := OrderedCollection new.
	"startupFileNames := InputSensor startupFileNames asOrderedCollection.
	2 to: 10 do: [:i |
		arg := Smalltalk vm getSystemAttribute: i.
		(arg notNil and: [arg size > 0]) ifTrue: [
			startupFileNames addLast: (ScratchPlugin primShortToLongPath: arg)]]."

	startupFileNames do: [:n |
		(n asLowercase = 'presentation') ifTrue: [presentationMode := true].
		(n asLowercase = 'fullscreen') ifTrue: [TakeOverScreen := true]].

	TakeOverScreen ifTrue: [
		Smalltalk fullScreenMode: true.
		World restoreDisplay].

	self enterQuarterModeIfSmallScreen.

	fileName := startupFileNames
		detect: [:fn |
			(fn asLowercase endsWith: '.sb') or: [fn asLowercase endsWith: '.scratch']]
		ifNone: [nil].
	fileName ifNotNil: [
		presentationMode ifTrue: [Display fillColor: Color black].
		self openScratchProjectNamed: fileName.
		presentationMode ifTrue: [self enterPresentationMode; shoutGo].
		^ self].

	viewerPane currentCategory: 'motion'.
	self setDefaultSprite.
	self newScratchProject.

	fileName := startupFileNames
		detect: [:fn | fn asLowercase endsWith: '.sprite']
		ifNone: [^ self].

	"open a .sprite file"
	workPane submorphs do: [:m | (m isKindOf: ScratchSpriteMorph) ifTrue: [m deleteSprite]].
	self importSpriteOrProject: fileName.
