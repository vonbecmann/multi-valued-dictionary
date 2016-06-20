accessing
at: key putAll: aCollection
	"Set the value at key to be aCollection.  If key is not found, create a
	new entry for key and set is value to aCollectio. Answer aCollection."

	self privateAt: key putAll: aCollection.
	^ aCollection