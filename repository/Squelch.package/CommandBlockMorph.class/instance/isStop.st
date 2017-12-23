accessing
isStop

	^ (selector = #doReturn) | (selector = #stopAll)
