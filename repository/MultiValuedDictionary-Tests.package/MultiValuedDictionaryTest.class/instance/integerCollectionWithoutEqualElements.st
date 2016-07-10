requirements
integerCollectionWithoutEqualElements
	" return a collection of integer without equal elements"

	^ (MultiValuedDictionary dictionary: self dictionaryClass collection: self valueCollectionClass)
		add: #a -> {0 . 1};
		add: #b -> #(2 3);
		add: #c -> {4 . 5};
		yourself