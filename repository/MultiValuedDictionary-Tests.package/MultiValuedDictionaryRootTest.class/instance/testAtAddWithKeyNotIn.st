test - adding
testAtAddWithKeyNotIn
	| dictionary association oldSize |
	dictionary := self nonEmptyDict.
	oldSize := dictionary size.
	association := self associationWithKeyNotInToAdd.
	
	dictionary at: association key add: association value.
	
	self 
		assertCollection: (dictionary at: association key)  
		hasSameElements:  (self wrap: association value).
	self assert: dictionary size = (oldSize + 1)