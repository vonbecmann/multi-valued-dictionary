test - adding
testAddWithKeyAlreadyIn
	| dictionary result association oldSize |
	dictionary := self nonEmptyDict.
	oldSize := dictionary size.
	association := self associationWithKeyAlreadyInToAdd .
	result := dictionary add: association.
	
	self assert: result = association.
	self 
		assertCollection: (dictionary at: association key) 
		hasSameElements: (self wrap: association value).
	self assert: dictionary size = oldSize .