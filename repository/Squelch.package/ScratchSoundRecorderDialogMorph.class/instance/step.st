stepping
step

	| m |
	recorder isPaused
		ifTrue: [(currentMode = #play)
			ifTrue: [
				(recorder recordedSound notNil and: [recorder recordedSound isPlaying])
					ifTrue: [
						duration := recorder recordedSound millisecondsSinceStart // 1000.
						(curStep < savedMeterLevels size) 
							ifTrue: [recordMeter setLevel: (savedMeterLevels at: curStep)].
						curStep := curStep + 1.
						self updateTime]
					ifFalse: [self stop]]
			ifFalse: [recordMeter setLevel: 0.0]]
		ifFalse: [
			duration := duration + 0.2.
			self updateTime.
			m := recorder meterLevel*3.
			recordMeter setLevel: m.
			savedMeterLevels add: m.].
		