accessing
keyAtValue: value ifAbsent: exceptionBlock
	"Answer the key that is the external name for the argument, value. If 
	there is none, answer the result of evaluating exceptionBlock.
	: Use =, not ==, so strings like 'this' can be found.  Note that MethodDictionary continues to use == so it will be fast."

	dictionary
		associationsDo: [ :association | 
			association value
				do: [ :eachValue | 
					value = eachValue
						ifTrue: [ ^ association key ] ] ].
	^ exceptionBlock value