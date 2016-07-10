requirements
collectionWithoutNilElements
	^ (MultiValuedDictionary dictionary: self dictionaryClass collection: self valueCollectionClass)
		add: (#a -> 1);
		add: (#b -> #(2 3));
		add: (#c -> {4 . 5});
		yourself