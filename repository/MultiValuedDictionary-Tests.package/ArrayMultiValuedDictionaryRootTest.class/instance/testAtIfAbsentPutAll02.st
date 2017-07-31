tests - DictionaryIndexAccessing
testAtIfAbsentPutAll02
	| collection association |
	collection := self emptyDict.
	association := #Key -> {888 . 889 . 890}.

	collection at: association key ifAbsentPutAll: [ association value ].

	self 
		assertCollection: (collection at: association key) 
		hasSameElements: association value