accessing
at: key ifAbsentPut: aBlock
	"Return the value at the given key. 
	If key is not included in the receiver store the result 
	of evaluating aBlock as new value."

	^ dictionary
		at: key
		ifAbsentPut: [ | newValue |
			newValue := aBlock value.
			newValue isCollection
				ifTrue: [ collectionClass withAll: newValue ]
				ifFalse: [ newValue ] ]