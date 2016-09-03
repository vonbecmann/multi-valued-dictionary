test - adding
testAtAddThreeTimesWithKeyNotIn
	| dictionary association oldSize |
	dictionary := self nonEmptyDict.
	oldSize := dictionary size.
	association := self associationWithKeyNotInToAdd.

	dictionary at: association key add: association value.
	dictionary at: association key add: association value.
	dictionary at: association key add: association value.

	self
		assertCollection: (dictionary at: association key)
		hasSameElements: {association value.	association value. association value}.
	self assert: dictionary size = (oldSize + 3)