test - removing
testRemoveKeyIfAbsent
	
	| collection oldSize keyIn value numberOfValues result |
	collection := self nonEmptyDict .
	oldSize := collection size.
	keyIn := collection  keys anyOne.
	value := collection at: keyIn.
	numberOfValues := value size.
	
	result := collection removeKey: keyIn ifAbsent: [888].
	
	self assert: result = value.
	self assert: (collection  size = (oldSize - numberOfValues)).
	self should: [ (collection  at: keyIn )] raise: Error.
	
	self assert: (collection removeKey: self keyNotInNonEmptyDict ifAbsent: [888] ) = 888.