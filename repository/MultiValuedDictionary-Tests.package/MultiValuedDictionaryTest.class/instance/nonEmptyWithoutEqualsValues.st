requirements
nonEmptyWithoutEqualsValues
	" return a dictionary that doesn't include equal values'"

	^ (MultiValuedDictionary dictionary: self dictionaryClass collection: self valueCollectionClass)
		add: #a -> {3 . 5};
		add: #b -> {4 . 8};
		add: #c -> 7;
		add: #d -> 6;
		add: #e -> {9 . 10};
		yourself