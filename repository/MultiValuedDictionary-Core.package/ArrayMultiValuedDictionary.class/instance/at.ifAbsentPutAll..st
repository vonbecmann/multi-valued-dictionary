accessing
at: key ifAbsentPutAll: aBlock
	"Return the value at the given key. 
	If key is not included in the receiver store the result 
	of evaluating aBlock as new value."

	| existingValues |
	existingValues := dictionary at: key ifAbsent: nil.
	^ existingValues
		ifNil: [ dictionary at: key put: (Array withAll: aBlock value) ]
		ifNotNil: [ existingValues ]