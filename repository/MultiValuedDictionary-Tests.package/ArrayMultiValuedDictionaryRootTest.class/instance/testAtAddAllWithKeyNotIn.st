test - adding
testAtAddAllWithKeyNotIn
	| dictionary association oldSize |
	dictionary := self nonEmptyDict.
	oldSize := dictionary size.
	association := self associationWithKeyNotInToAdd.
	
	dictionary 
		at: association key 
		addAll: {association value. association value. association value. association value}.
	
	self
		assertCollection: (dictionary at: association key)
		hasSameElements: {association value. association value. association value. association value}.
	self assert: dictionary size = (oldSize + 4)