tests - at put
testAtPutAll
	self nonEmpty at: self keyNotInNonEmptyDict putAll: {51 . 53 . 73 . 87}.
	self
		assertCollection: (self nonEmpty at: self keyNotInNonEmptyDict)
		hasSameElements: {51 . 53 . 73 . 87}