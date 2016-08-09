tests - DictionaryIndexAccessing
testAtIfAbsentPutCollection03
	| collection association |
	collection := self emptyDict.
	association := #Key -> 'a string value'.

	collection at: association key ifAbsentPut: [ association value ].

	self 
		assertCollection: (collection at: association key)
	 	hasSameElements: (self wrap: association value)