tests - DictionaryIndexAccessing
testAtIfAbsentPutCollection03
	| collection association |
	collection := self emptyDict.
	association := #Key -> 'a string value'.

	collection at: association key ifAbsentPut: [ association value ].

	self assert: (collection at: association key) equals: association value