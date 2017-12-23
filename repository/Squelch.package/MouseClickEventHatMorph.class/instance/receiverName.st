other
receiverName

	(scriptOwner respondsTo: #objName)
		ifTrue: [^ scriptOwner objName]
		ifFalse: [^ 'I''m'].
