requirements
collectionWithoutNilElements
	^ (self newEmptyDict)
		add: #a -> 1;
		add: #b -> 2;
		add: #c -> 4;
		yourself