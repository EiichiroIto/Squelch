utilities
defaultSprite
	"Return the default sprite if one was set, or the cat otherwise"

	DefaultSprite
		ifNotNil: [^ DefaultSprite]
		ifNil: [^ ScratchSpriteMorph new
			addMediaItem: (ImageMedia new
				mediaName: ('costume' localized, '1');
				form: (ScratchFrameMorph skinAt: #defaultSpriteCostume));
			addMediaItem: (SoundMedia new
				mediaName: 'meow' localized;
				sound: ScratchSpriteMorph meowSound);
			lookLike: ('costume' localized, '1')].
