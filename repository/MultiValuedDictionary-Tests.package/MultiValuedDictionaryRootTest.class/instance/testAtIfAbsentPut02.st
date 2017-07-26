tests - DictionaryIndexAccessing
testAtIfAbsentPut02
	| collection association |
	collection := self emptyDict.
	association := #Key -> 888.

	collection at: association key ifAbsentPut: [ association value ].

	self assert: ((collection at: association key) includes: association value)