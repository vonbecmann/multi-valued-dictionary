test - adding
testAddWithKeyNotIn
	| dictionary result association oldSize |
	dictionary := self nonEmptyDict.
	oldSize := dictionary size.
	association := self associationWithKeyNotInToAdd.
	result := dictionary add: association.
	
	self assert: result = association.
	self 
		assertCollection: (dictionary at: association key) 
		hasSameElements: (self wrap: association value).
	self assert: dictionary size = (oldSize + 1).