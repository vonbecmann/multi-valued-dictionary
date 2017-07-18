adding
declare: key from: aDictionary
	"Add key to the receiver. If key already exists, do nothing. If aDictionary 
	includes key, then remove it from aDictionary and use its association as 
	the element of the receiver."

	(self includesKey: key)
		ifTrue: [ ^ self ].
	(aDictionary includesKey: key)
		ifTrue: [ 
			self at: key putAll: (aDictionary associationAt: key) value.
			aDictionary removeKey: key ]
		ifFalse: [ self at: key put: nil ]