requirements
sizeCollection
	^ (MultiValuedDictionary dictionary: self dictionaryClass collection: self valueCollectionClass)
		add: #B -> {3 . 7};
		yourself