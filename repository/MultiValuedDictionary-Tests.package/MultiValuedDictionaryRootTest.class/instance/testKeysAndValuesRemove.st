test - removing
testKeysAndValuesRemove
	| oldSize collection keyIn numberOfValues |
	
	collection := self nonEmptyDict .
	oldSize := collection  size.
	keyIn := collection keys anyOne.
	numberOfValues := (collection at: keyIn) size.
	
	collection  keysAndValuesRemove: [:key :value | key == self keyNotInNonEmptyDict ].
	self assert: (collection size = (oldSize)).
	
	collection  keysAndValuesRemove: [:key :value | key == keyIn ].
	self assert: (collection  size = (oldSize - numberOfValues)).
	self should: [ collection at: keyIn  ] raise: Error.