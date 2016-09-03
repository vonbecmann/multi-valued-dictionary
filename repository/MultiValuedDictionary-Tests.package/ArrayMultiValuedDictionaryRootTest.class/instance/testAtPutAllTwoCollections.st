tests - at put
testAtPutAllTwoCollections
	self nonEmpty at: self keyNotInNonEmptyDict putAll: {51 . 53 . 73 . 87}.
	self nonEmpty at: self keyNotInNonEmptyDict putAll: {15 . 35 . 37 . 78}.
	self
		assertCollection: (self nonEmpty at: self keyNotInNonEmptyDict)
		hasSameElements: {15 . 35 . 37 . 78}