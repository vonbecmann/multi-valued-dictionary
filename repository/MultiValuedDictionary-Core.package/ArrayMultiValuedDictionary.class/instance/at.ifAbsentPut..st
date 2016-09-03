accessing
at: key ifAbsentPut: aBlock
	"Return the value at the given key. 
	If key is not included in the receiver store the result 
	of evaluating aBlock as new value."

	^ dictionary at: key ifAbsentPut: [ self wrap: aBlock value ]