instance creation
dictionary: aDictionaryClass collection: aCollectionClass
	"
	aDictionaryClass : a dictionary that holds the associations.
	aCollectionClass: a collection that holds the values at each key"

	^ self basicNew
		initializeDictionary: aDictionaryClass new
		collectionClass: aCollectionClass