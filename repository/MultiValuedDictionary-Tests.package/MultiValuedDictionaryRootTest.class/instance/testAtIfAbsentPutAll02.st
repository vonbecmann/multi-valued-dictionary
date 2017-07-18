tests - DictionaryIndexAccessing
testAtIfAbsentPutAll02
	| collection key values |
	collection := self emptyDict.
	key := #Key.
	values := {888 . 889 . 890}.

	collection at: key ifAbsentPutAll: [ values ].

	self 
		assertCollection: (collection at: key) 
		hasSameElements: values