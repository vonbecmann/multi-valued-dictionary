tests - DictionaryIndexAccessing
testAtIfAbsentPutAll03
	| collection association |
	collection := self nonEmpty.
	association := collection associations anyOne.
	
	collection at: association key ifAbsentPutAll: [ {888. 889} ].
	self assert: ((collection at: association key) includes: association value).
	
	collection at: self keyNotIn ifAbsentPutAll: [ {888. 889} ].
	self 
		assertCollection: (collection at: self keyNotIn)
	 	hasSameElements: {888. 889}