initialization
addShortcutButtons
	"Add shortcut buttons for my type to the shortcutColumn."

	| spacer |
	spacer := Morph new extent: 5@5; color: Color transparent.
	shortcutColumn removeAllMorphs.

	shortcutColumn addMorphBack: (self shortcutButtonLabel: 'Computer' action: #myComp icon: #folderDiscsIcon).
	shortcutColumn addMorphBack: spacer fullCopy.

	shortcutColumn addMorphBack: (self shortcutButtonLabel: self labelForHomeFolder action: #myHome icon: #folderHouseIcon).
	shortcutColumn addMorphBack: spacer fullCopy.

	shortcutColumn addMorphBack: (self shortcutButtonLabel: 'Desktop' action: #myDesktop icon: #folderIcon).
	shortcutColumn addMorphBack: spacer fullCopy.

	#background = self type ifTrue: [
		shortcutColumn addMorphBack:
			(self shortcutButtonLabel: 'Backgrounds' action: #scratchBackgrounds icon: #folderCatIcon)].

	#costume = self type ifTrue: [
		shortcutColumn addMorphBack:
			(self shortcutButtonLabel: 'Costumes' action: #scratchCostumes icon: #folderCatIcon)].

	#project = self type ifTrue: [
		shortcutColumn addMorphBack:
			(self shortcutButtonLabel: 'Examples' action: #sampleProjects icon: #folderCatIcon).
		shortcutColumn addMorphBack: spacer fullCopy.
		shortcutColumn addMorphBack:
			(self shortcutButtonLabel: 'My Projects' action: #userProjects icon: #folderIcon)].

	#sound = self type ifTrue: [
		shortcutColumn addMorphBack:
			(self shortcutButtonLabel: 'Sounds' action: #scratchSounds icon: #folderCatIcon)].

