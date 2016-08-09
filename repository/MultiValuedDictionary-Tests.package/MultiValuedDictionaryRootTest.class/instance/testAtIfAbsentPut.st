tests - DictionaryIndexAccessing
testAtIfAbsentPut
	| collection association |
	collection := self nonEmpty .
	association := collection associations anyOne.
	
	collection at: association key ifAbsentPut: [ 888 ].
	self assert: (collection at: association key) = association value.
	
	collection at: self keyNotIn  ifAbsentPut: [ 888 ].
	self 
		assertCollection: (collection at: self keyNotIn)
	 	hasSameElements: (self wrap: 888).