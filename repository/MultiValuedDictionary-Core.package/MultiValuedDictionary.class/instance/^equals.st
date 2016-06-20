comparing
= aMultiValuedDictionary
	self == aMultiValuedDictionary
		ifTrue: [ ^ true ].
	self class == aMultiValuedDictionary class
		ifFalse: [ ^ false ].
	self dictionaryClass == aMultiValuedDictionary dictionaryClass
		ifFalse: [ ^ false ].
	self collectionClass == aMultiValuedDictionary collectionClass
		ifFalse: [ ^ false ].
	self size = aMultiValuedDictionary size
		ifFalse: [ ^ false ].
	self
		associationsDo: [ :assoc | 
			(aMultiValuedDictionary at: assoc key ifAbsent: [ ^ false ]) = assoc value
				ifFalse: [ ^ false ] ].
	^ true