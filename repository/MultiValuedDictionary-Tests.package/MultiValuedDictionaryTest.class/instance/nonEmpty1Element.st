requirements
nonEmpty1Element
	^ (MultiValuedDictionary dictionary: self dictionaryClass collection: self valueCollectionClass)
		add: #a -> 5;
		yourself