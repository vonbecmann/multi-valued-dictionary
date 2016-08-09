tests - DictionaryIndexAccessing
testAtIfAbsentPutCollection
	| collection association |
	collection := self emptyDict.
	association := #Key -> 888.

	collection at: association key ifAbsentPut: [ association value ].

	self 
		assertCollection: (collection at: association key)
	 	hasSameElements: (self wrap: association value)