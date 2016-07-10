accessing
keyAtValue: value ifAbsent: exceptionBlock
	"Answer the key that is the external name for the argument, value. If 
	there is none, answer the result of evaluating exceptionBlock.
	: Use =, not ==, so strings like 'this' can be found.  Note that MethodDictionary continues to use == so it will be fast."

	self
		associationsDo: [ :association | 
			collectionClass == association value class
				ifTrue: [ 
					association value
						do: [ :eachValue | value = eachValue ifTrue: [ ^ association key ] ] ]
				ifFalse: [ 
					value = association value ifTrue: [ ^ association key ] ] ].
	^ exceptionBlock value