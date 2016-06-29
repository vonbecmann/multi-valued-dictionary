requirements
nonEmpty1Element
	^ (MultiValuedDictionary dictionary: self dictionaryClass collection: OrderedCollection)
		add: #a -> 5;
		yourself