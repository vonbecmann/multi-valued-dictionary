requirements
nonEmpty1Element
	" return a collection of size 1 including one element"

	^ (MultiValuedDictionary dictionary: self dictionaryClass collection: self valueCollectionClass)
		add: #a -> 5;
		yourself