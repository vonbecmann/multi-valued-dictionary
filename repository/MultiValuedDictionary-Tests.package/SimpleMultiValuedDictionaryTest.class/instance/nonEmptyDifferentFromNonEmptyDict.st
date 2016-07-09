requirements
nonEmptyDifferentFromNonEmptyDict
	" return a dictionary for which all keys are not included in nonEmptyDict"

	^ (MultiValuedDictionary dictionary: self dictionaryClass collection: self valueCollectionClass)
		add: self keyNotIn -> self valueNotIn;
		yourself