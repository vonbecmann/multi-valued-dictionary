requirements
sizeCollection
	^ (MultiValuedDictionary dictionary: self dictionaryClass collection: OrderedCollection)
		add: #B -> {3 . 7};
		yourself