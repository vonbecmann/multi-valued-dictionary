requirements
nonEmpty1Element
	^ (MultiValuedDictionary dictionary: Dictionary collection: OrderedCollection)
		add: #a -> 5;
		yourself