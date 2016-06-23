accessing
at: key putAll: aCollection
	"Set the values at key to be aCollection.  If key is not found, create a
	new entry for key and set its values to aCollection. Answer aCollection."

	self privateAt: key put: (collectionClass withAll: aCollection).
	^ aCollection