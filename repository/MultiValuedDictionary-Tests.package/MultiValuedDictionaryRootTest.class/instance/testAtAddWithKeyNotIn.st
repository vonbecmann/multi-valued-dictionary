test - adding
testAtAddWithKeyNotIn
	| dictionary association oldSize |
	dictionary := self nonEmptyDict.
	oldSize := dictionary size.
	association := self associationWithKeyNotInToAdd.
	
	dictionary at: association key add: association value.
	
	self assert: (dictionary at: association key) = association value.
	self assert: dictionary size = (oldSize + 1)