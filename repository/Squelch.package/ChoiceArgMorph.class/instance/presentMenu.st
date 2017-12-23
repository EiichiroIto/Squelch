accessing
presentMenu
	"Pop up a menu of choices."

	| optionList doLocalization menu selection option |
	optionList := self options.
	optionList size = 0 ifTrue: [^ self].
	doLocalization := (#(costumeNames soundNames varNamesMenu listVarMenu) includes: getOptionsSelector) not.
	menu := MenuMorph new.
	menu target: [ :v | selection := v ].
	optionList do: [:sym |
		'-' = sym
			ifTrue: [menu addLine]
			ifFalse: [
				doLocalization
					ifTrue: [option := sym localized]
					ifFalse: [option := sym].
				((#(hookupSensorNames hookupBooleanSensorNames) includes: getOptionsSelector) and:
				 [(#(connected resistance) includes: sym)])
					ifTrue: [#(A B C D) do: [:c |
						self owner isBooleanReporter
							ifFalse: [menu add: (option, '-', c) selector: #value: argument: (sym, '-', c)]
							ifTrue: [menu add: (c, ' ', option) selector: #value: argument: (c, ' ' ,sym)]]]
					ifFalse: [menu add: option selector: #value: argument: sym]]].

	menu invokeAt: ActiveHand position in: self world.
 	selection ifNotNil: [self choice: selection].
