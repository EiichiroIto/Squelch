private
textInset

	backForm
		ifNotNil: [^ (13@8) + borderWidth]
		ifNil: [^ (10@8) + borderWidth].
