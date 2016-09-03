test - removing
testRemoveKey
	"self debug: #testRemoveKey"

	| collection oldSize keyIn numberOfValues |
	collection := self nonEmptyDict .
	oldSize := collection size.
	keyIn := collection  keys anyOne.
	numberOfValues := (collection at: keyIn) size.
	
	collection removeKey: keyIn .
	self assert: (collection  size = (oldSize - numberOfValues)).
	self should: [ (collection  at: keyIn )] raise: Error.
	
	self should: [collection removeKey: self keyNotInNonEmptyDict ] raise: Error