tests - dictionnary enumerating
testDetectErrorNotFound
	self should: [ self nonEmptyDict detect: [ :each | false ] ] raise: NotFound.
	self should: [ self emptyDict detect: [ :each | false ] ] raise: NotFound