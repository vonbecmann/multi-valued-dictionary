"
a multi-valued dictionary backed up with an Array to hold the values at each key.

"
Class {
	#name : #ArrayMultiValuedDictionary,
	#superclass : #Object,
	#instVars : [
		'dictionary'
	],
	#category : 'MultiValuedDictionary-Core'
}

{ #category : #'instance creation' }
ArrayMultiValuedDictionary class >> dictionary: aDictionaryClass [
	" aDictionaryClass : a dictionary that holds the associations. "

	^ self basicNew initializeDictionary: aDictionaryClass new
]

{ #category : #'instance creation' }
ArrayMultiValuedDictionary class >> new [
	self error: 'Use #dictionary:'
]

{ #category : #copying }
ArrayMultiValuedDictionary >> , aCollection [
	^ self copy
		addAll: aCollection;
		yourself
]

{ #category : #comparing }
ArrayMultiValuedDictionary >> = aMultiValuedDictionary [
	self == aMultiValuedDictionary
		ifTrue: [ ^ true ].
	self class == aMultiValuedDictionary class
		ifFalse: [ ^ false ].
	self dictionaryClass == aMultiValuedDictionary dictionaryClass
		ifFalse: [ ^ false ].
	self size = aMultiValuedDictionary size
		ifFalse: [ ^ false ].
	dictionary 
		associationsDo: [ :assoc | 
			(aMultiValuedDictionary at: assoc key ifAbsent: [ ^ false ]) = assoc value
				ifFalse: [ ^ false ] ].
	^ true
]

{ #category : #adding }
ArrayMultiValuedDictionary >> add: anAssociation [
	self at: anAssociation key put: anAssociation value.
	^ anAssociation
]

{ #category : #adding }
ArrayMultiValuedDictionary >> addAll: aKeyedCollection [
	aKeyedCollection == self
		ifFalse: [ 
			aKeyedCollection keysAndValuesDo: [ :key :value | self at: key put: value ] ].
	^ aKeyedCollection
]

{ #category : #enumerating }
ArrayMultiValuedDictionary >> allSatisfy: aBlock [
	"Evaluate aBlock with the elements of the receiver.
	If aBlock returns false for any element return false.
	Otherwise return true."

	self valuesDo: [ :each | (aBlock value: each) ifFalse: [ ^ false ] ].
	^ true
]

{ #category : #accessing }
ArrayMultiValuedDictionary >> anyOne [
	"Answer a representative sample of the receiver. This method can
	be helpful when needing to preinfer the nature of the contents of 
	semi-homogeneous collections."

	self emptyCheck.
	self valuesDo: [ :each | ^ each ]
]

{ #category : #enumerating }
ArrayMultiValuedDictionary >> anySatisfy: aBlock [
	"Evaluate aBlock with the elements of the receiver.
	If aBlock returns true for any element return true.
	Otherwise return false."

	self valuesDo: [ :each | (aBlock value: each) ifTrue: [ ^ true ] ].
	^ false
]

{ #category : #converting }
ArrayMultiValuedDictionary >> asArray [
	"Answer an Array whose elements are the elements of the receiver.
	Implementation note: Cannot use ''Array withAll: self'' as that only
	works for SequenceableCollections which support the replacement 
	primitive."

	| newArray index |
	newArray := Array new: self size.
	index := 0.
	self do: [ :each | newArray at: (index := index + 1) put: each ].
	^ newArray
]

{ #category : #converting }
ArrayMultiValuedDictionary >> asBag [
	"Answer a Bag whose elements are the elements of the receiver."

	^ Bag withAll: self
]

{ #category : #converting }
ArrayMultiValuedDictionary >> asByteArray [
	"Answer a ByteArray whose elements are the elements of the receiver.
	Implementation note: Cannot use ''ByteArray withAll: self'' as that only
	works for SequenceableCollections which support the replacement 
	primitive."

	| array index |
	array := ByteArray new: self size.
	index := 0.
	self do: [ :each | array at: (index := index + 1) put: each ].
	^ array
]

{ #category : #printing }
ArrayMultiValuedDictionary >> asCommaString [
	"Return collection printed as 'a, b, c' "

	^ String streamContents: [ :s | self asStringOn: s delimiter: ', ' ]
]

{ #category : #printing }
ArrayMultiValuedDictionary >> asCommaStringAnd [
	"Return collection printed as 'a, b and c' "

	^ String streamContents: [ :s | self asStringOn: s delimiter: ', ' last: ' and ' ]
]

{ #category : #converting }
ArrayMultiValuedDictionary >> asIdentitySet [
	^ (IdentitySet new: self size)
		addAll: self;
		yourself
]

{ #category : #converting }
ArrayMultiValuedDictionary >> asOrderedCollection [
	"Answer an OrderedCollection whose elements are the elements of the
	receiver. "

	^ OrderedCollection withAll: self
]

{ #category : #converting }
ArrayMultiValuedDictionary >> asSet [
	"Answer a Set whose elements are the unique elements of the receiver."

	^ Set withAll: self
]

{ #category : #converting }
ArrayMultiValuedDictionary >> asSortedCollection [
	"Answer a SortedCollection whose elements are the elements of the receiver. The sort order is the default less than or equal. Note that you should use #sorted: if you don't really need a SortedCollection, but a sorted collection."

	^ SortedCollection withAll: self
]

{ #category : #converting }
ArrayMultiValuedDictionary >> asSortedCollection: aSortBlock [
	"Answer a SortedCollection whose elements are the elements of the receiver. The sort order is defined by the argument, aSortBlock. Note that this is better to use #sorted: if you don't really need a SortedCollection, but a sorted collection!!"

	| aSortedCollection |
	aSortedCollection := SortedCollection new: self size.
	^ aSortedCollection
		sortBlock: aSortBlock;
		addAll: self;
		yourself
]

{ #category : #printing }
ArrayMultiValuedDictionary >> asStringOn: aStream delimiter: delimString [
	"Print elements on a stream separated
	with a delimiter String like: 'a, b, c'
	Uses #asString instead of #print:."

	self
		do: [ :elem | aStream nextPutAll: elem asString ]
		separatedBy: [ aStream nextPutAll: delimString ]
]

{ #category : #printing }
ArrayMultiValuedDictionary >> asStringOn: aStream delimiter: delimString last: lastDelimString [
	"Print elements on a stream separated
	with a delimiter between all the elements and with
	a special one before the last like: 'a, b and c'.
	Uses #asString instead of #print:

	Note: Feel free to improve the code to detect the last element."

	| n sz |
	n := 1.
	sz := self size.
	self
		do: [ :elem | 
			n := n + 1.
			aStream nextPutAll: elem asString ]
		separatedBy: [ 
			aStream
				nextPutAll:
					(n = sz
						ifTrue: [ lastDelimString ]
						ifFalse: [ delimString ]) ]
]

{ #category : #accessing }
ArrayMultiValuedDictionary >> associationAt: key [
	^ dictionary associationAt: key ifAbsent: [ self errorKeyNotFound: key ]
]

{ #category : #accessing }
ArrayMultiValuedDictionary >> associationAt: key ifAbsent: aBlock [
	"Answer the association with the given key.
	If key is not found, return the result of evaluating aBlock."

	^ dictionary associationAt: key ifAbsent: aBlock
]

{ #category : #accessing }
ArrayMultiValuedDictionary >> associationAt: key ifPresent: aBlock [
	"Answer the association with the given key.
	If key is not found, return the result of evaluating aBlock."

	^ dictionary associationAt: key ifPresent: aBlock
]

{ #category : #accessing }
ArrayMultiValuedDictionary >> associations [
	"Answer a Collection containing the receiver's associations."

	^ Array
		new: self size
		streamContents: [ :stream | self associationsDo: [ :each | stream nextPut: each ] ]
]

{ #category : #enumerating }
ArrayMultiValuedDictionary >> associationsDo: aBlock [
	"Evaluate aBlock for each of the receiver's elements (key/value 
	associations)."

	dictionary
		associationsDo:
			[ :association | 
				association value do: [ :eachValue | aBlock value: association key -> eachValue ] ]
]

{ #category : #enumerating }
ArrayMultiValuedDictionary >> associationsSelect: aBlock [
	"Evaluate aBlock with each of my associations as the argument. Collect
	into a new dictionary, only those associations for which aBlock evaluates
	to true."

	| newCollection |
	newCollection := self copyEmpty.
	dictionary
		associationsDo: [ :association | 
			| newValues |
			newValues := association value select: [ :eachValue | aBlock value: association key -> eachValue ].
			newValues isEmpty
				ifFalse: [ newCollection privateAt: association key put: newValues ] ].
	^ newCollection
]

{ #category : #accessing }
ArrayMultiValuedDictionary >> at: key [
	"Answer the value associated with the key."

	^ dictionary at: key
]

{ #category : #accessing }
ArrayMultiValuedDictionary >> at: key ifAbsent: aBlock [
	"Answer the value associated with the key or, if key isn't found,
	answer the result of evaluating aBlock."

	^ dictionary at: key ifAbsent: aBlock
]

{ #category : #accessing }
ArrayMultiValuedDictionary >> at: key ifAbsentPut: aBlock [
	"Return the value at the given key. 
	If key is not included in the receiver store the result 
	of evaluating aBlock as new value."

	^ dictionary at: key ifAbsentPut: [ Array with: aBlock value ]
]

{ #category : #accessing }
ArrayMultiValuedDictionary >> at: key ifAbsentPutAll: aBlock [
	"Return the value at the given key. 
	If key is not included in the receiver store the result 
	of evaluating aBlock as new value."

	^ dictionary at: key ifAbsentPut: [ Array withAll: aBlock value ]
]

{ #category : #accessing }
ArrayMultiValuedDictionary >> at: key ifPresent: aBlock [
	"Lookup the given key in the receiver. If it is present, answer the value of evaluating the given block with the values associated with the key. Otherwise, answer nil."

	^ dictionary at: key ifPresent: aBlock
]

{ #category : #accessing }
ArrayMultiValuedDictionary >> at: key ifPresent: oneArgBlock ifAbsent: absentBlock [
	"Lookup the given key in the receiver. If it is present, answer the value of evaluating the oneArgBlock with the values associated with the key, otherwise answer the value of absentBlock."

	^ dictionary at: key ifPresent: oneArgBlock ifAbsent: absentBlock
]

{ #category : #accessing }
ArrayMultiValuedDictionary >> at: key ifPresent: aPresentBlock ifAbsentPut: anAbsentBlock [
	"Lookup the given key in the receiver. If it is present, answer the
	value of evaluating the first block optionally with the value associated
	with the key.
	Otherwise store and return the result of evaluating the second block as the
	new value of the key."

	^ dictionary
		at: key
		ifPresent: aPresentBlock
		ifAbsentPut: [ Array with: anAbsentBlock value ]
]

{ #category : #accessing }
ArrayMultiValuedDictionary >> at: key put: anObject [
	"Set the value at key to be anObject.  If key is not found, create a
	new entry for key and set is value to anObject. Answer anObject."

	| existingValues |
	existingValues := dictionary at: key ifAbsent: nil.
	dictionary
		at: key
		put:
			(existingValues
				ifNil: [ Array with: anObject ]
				ifNotNil: [ existingValues copyWith: anObject ]).
	^ anObject
]

{ #category : #accessing }
ArrayMultiValuedDictionary >> at: key putAll: aCollection [
	"Set the values at key to be aCollection.  If key is not found, create a
	new entry for key and set its values to aCollection. Answer aCollection."

	| existingValues |
	existingValues := dictionary at: key ifAbsent: nil.
	dictionary
		at: key
		put:
			(existingValues
				ifNil: [ Array withAll: aCollection ]
				ifNotNil: [ existingValues , aCollection ]).
	^ aCollection
]

{ #category : #enumerating }
ArrayMultiValuedDictionary >> collect: aBlock [
	"Evaluate aBlock with each of my values as the argument.  Collect the
	resulting values into a collection that is like me. Answer with the new
	collection."

	| newCollection |
	newCollection := self copyEmpty.
	dictionary 
		associationsDo: [ :association | 
			| newValues |
			newValues := association value collect: aBlock.
			newValues isEmpty
				ifFalse: [ newCollection privateAt: association key put: newValues ] ].
	^ newCollection
]

{ #category : #enumerating }
ArrayMultiValuedDictionary >> collect: collectBlock thenDo: doBlock [
	"Utility method to improve readability."

	dictionary
		associationsDo: [ :association | association value collect: collectBlock thenDo: doBlock ]
]

{ #category : #enumerating }
ArrayMultiValuedDictionary >> collect: collectBlock thenReject: rejectBlock [
	"Utility method to improve readability."

	"Optimized for efficiency. "

	| newCollection |
	newCollection := self copyEmpty.
	dictionary
		associationsDo: [ :association | 
			| newValues |
			newValues := association value collect: collectBlock thenReject: rejectBlock.
			newValues isEmpty
				ifFalse: [ newCollection privateAt: association key put: newValues ] ].
	^ newCollection
]

{ #category : #enumerating }
ArrayMultiValuedDictionary >> collect: collectBlock thenSelect: selectBlock [
	"Utility method to improve readability."

	"Optimized for efficiency. "

	| newCollection |
	newCollection := self copyEmpty.
	dictionary 
		associationsDo: [ :association | 
			| newValues |
			newValues := association value collect: collectBlock thenSelect: selectBlock.
			newValues isEmpty
				ifFalse: [ newCollection privateAt: association key put: newValues ] ].
	^ newCollection
]

{ #category : #copying }
ArrayMultiValuedDictionary >> copyEmpty [
	^ self class dictionary: self dictionaryClass
	
]

{ #category : #copying }
ArrayMultiValuedDictionary >> copyWith: newElement [
	"Answer a new collection with newElement added."

	^ self copy
		add: newElement;
		yourself
]

{ #category : #copying }
ArrayMultiValuedDictionary >> copyWithoutAll: aCollection [
	"Answer a copy of the receiver that does not contain any elements 
	equal to those in aCollection."

	^ self reject: [ :each | aCollection includes: each ]
]

{ #category : #adding }
ArrayMultiValuedDictionary >> declare: key from: aDictionary [
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
]

{ #category : #enumerating }
ArrayMultiValuedDictionary >> detect: aBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument. 
	Answer the first element for which aBlock evaluates to true."

	^ self detect: aBlock ifNone: [ self errorNotFound: aBlock ]
]

{ #category : #enumerating }
ArrayMultiValuedDictionary >> detect: aBlock ifFound: foundBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument.  
	If some element evaluates aBlock to true, then cull this element into 
	foundBlock. 
	If no element matches the criteria then do nothing.
	Always returns self to avoid misuse and a potential isNil check on the sender."

	self
		detect: aBlock
		ifFound: foundBlock
		ifNone: [ 
			"Do nothing on purpose"
			 ]
]

{ #category : #enumerating }
ArrayMultiValuedDictionary >> detect: aBlock ifFound: foundBlock ifNone: exceptionBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument.  
	If some element evaluates aBlock to true, then cull this element into 
	foundBlock and answer the result of this evaluation. 
	If none evaluate to true, then evaluate exceptionBlock."

	self
		valuesDo: [ :each | 
			(aBlock value: each)
				ifTrue: [ ^ foundBlock cull: each ] ].
	^ exceptionBlock value
]

{ #category : #enumerating }
ArrayMultiValuedDictionary >> detect: aBlock ifNone: exceptionBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument.  
	Answer the first element for which aBlock evaluates to true. If none  
	evaluate to true, then evaluate the argument, exceptionBlock."

	^ self detect: aBlock ifFound: [ :element | element ] ifNone: exceptionBlock
]

{ #category : #private }
ArrayMultiValuedDictionary >> dictionaryClass [
	^ dictionary class
]

{ #category : #enumerating }
ArrayMultiValuedDictionary >> difference: aCollection [
	"Answer the set theoretic difference of two collections. This is a specialized version for Dictionaries keeping the keys of the objects. At a slightly higher price of an additional Set to track duplicates."

	| other duplicates |
	other := aCollection asSet.
	duplicates := Set new.
	^ self
		select: [ :each | 
			((other includes: each) not and: [ (duplicates includes: each) not ])
				ifTrue: [ duplicates add: each. true ]
				ifFalse: [ false ] ]
]

{ #category : #enumerating }
ArrayMultiValuedDictionary >> do: aBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument."

	self valuesDo: aBlock
]

{ #category : #enumerating }
ArrayMultiValuedDictionary >> do: elementBlock separatedBy: separatorBlock [
	"Evaluate the elementBlock for all elements in the receiver,
	and evaluate the separatorBlock between."

	| beforeFirst |
	beforeFirst := true.
	self
		valuesDo: [ :each | 
			beforeFirst
				ifTrue: [ beforeFirst := false ]
				ifFalse: [ separatorBlock value ].
			elementBlock value: each ]
]

{ #category : #enumerating }
ArrayMultiValuedDictionary >> do: aBlock without: anItem [
	"Enumerate all elements in the receiver. 
	Execute aBlock for those elements that are not equal to the given item"

	self valuesDo: [ :each | anItem = each ifFalse: [ aBlock value: each ] ]
]

{ #category : #private }
ArrayMultiValuedDictionary >> emptyCheck [
	self isEmpty
		ifTrue: [ self errorEmptyCollection ]
]

{ #category : #private }
ArrayMultiValuedDictionary >> errorEmptyCollection [
	"Signal a CollectionIsEmpty exception"

	CollectionIsEmpty signalWith: self
]

{ #category : #private }
ArrayMultiValuedDictionary >> errorKeyNotFound: aKey [
	KeyNotFound signalFor: aKey
]

{ #category : #private }
ArrayMultiValuedDictionary >> errorNotFound: anObject [
	"Raise a NotFound exception."

	NotFound signalFor: anObject
]

{ #category : #private }
ArrayMultiValuedDictionary >> errorValueNotFound: value [
	ValueNotFound signalFor: value
]

{ #category : #comparing }
ArrayMultiValuedDictionary >> hash [
	^ (self class hash + dictionary hash) hashMultiply
]

{ #category : #testing }
ArrayMultiValuedDictionary >> identityIncludes: anObject [
	"Answer whether anObject is one of the receiver's elements."

	self valuesDo: [ :each | anObject == each ifTrue: [ ^ true ] ].
	^ false
]

{ #category : #testing }
ArrayMultiValuedDictionary >> ifEmpty: aBlock [
	"Evaluate the given block with the receiver as argument, answering its value if the receiver is empty, otherwise answer the receiver."

	"Note that the fact that this method returns its argument in case the receiver is not empty allows one to write expressions like the following ones: self classifyMethodAs: (myProtocol ifEmpty: ['As yet unclassified'])"

	^ self isEmpty
		ifTrue: [ aBlock value ]
		ifFalse: [ self ]
]

{ #category : #testing }
ArrayMultiValuedDictionary >> ifEmpty: emptyBlock ifNotEmpty: notEmptyBlock [
	"Evaluate emptyBlock if I'm empty, notEmptyBlock otherwise"

	" If the notEmptyBlock has an argument, eval with the receiver as its argument"

	^ self isEmpty
		ifTrue: [ emptyBlock value ]
		ifFalse: [ notEmptyBlock cull: self ]
]

{ #category : #testing }
ArrayMultiValuedDictionary >> ifNotEmpty: aBlock [
	"Evaluate the given block with the receiver as argument, answering its value
    unless the receiver is empty, in which case answer the receiver.

	Note that the fact that this method returns its receiver in case the receiver is empty
	allows one to write expressions like the following ones:
		self classifyMethodAs: (myProtocol ifEmpty: ['As yet unclassified']"

	^ self isEmpty
		ifTrue: [ self ]
		ifFalse: [ aBlock cull: self ]
]

{ #category : #testing }
ArrayMultiValuedDictionary >> ifNotEmpty: notEmptyBlock ifEmpty: emptyBlock [
	"Evaluate emptyBlock if I'm empty, notEmptyBlock otherwise
	 If the notEmptyBlock has an argument, eval with the receiver as its argument"

	^ self isEmpty
		ifTrue: [ emptyBlock value ]
		ifFalse: [ notEmptyBlock cull: self ]
]

{ #category : #testing }
ArrayMultiValuedDictionary >> includes: anObject [
	self valuesDo: [ :each | anObject = each ifTrue: [ ^ true ] ].
	^ false
]

{ #category : #testing }
ArrayMultiValuedDictionary >> includesAll: aCollection [
	"Answer whether all the elements of aCollection are in the receiver."

	^ aCollection allSatisfy: [ :elem | self includes: elem ]
]

{ #category : #testing }
ArrayMultiValuedDictionary >> includesAny: aCollection [
	"Answer whether any element of aCollection is one of the receiver's elements."

	^ aCollection anySatisfy: [ :elem | self includes: elem ]
]

{ #category : #testing }
ArrayMultiValuedDictionary >> includesAssociation: anAssociation [
	^ (dictionary associationAt: anAssociation key ifAbsent: [ ^ false ]) value includes: anAssociation value
]

{ #category : #testing }
ArrayMultiValuedDictionary >> includesIdentity: anObject [
	"Answer whether anObject is one of the values of the receiver.  Contrast #includes: in which there is only an equality check, here there is an identity check"

	self valuesDo: [ :each | anObject == each ifTrue: [ ^ true ] ].
	^ false
]

{ #category : #testing }
ArrayMultiValuedDictionary >> includesKey: key [
	"Answer whether the receiver has a key equal to the argument, key."

	^ dictionary includesKey: key
]

{ #category : #initialization }
ArrayMultiValuedDictionary >> initializeDictionary: aDictionary [
	self initialize.
	dictionary := aDictionary
]

{ #category : #enumerating }
ArrayMultiValuedDictionary >> inject: thisValue into: binaryBlock [
	"Accumulate a running value associated with evaluating the argument, 
	binaryBlock, with the current value of the argument, thisValue, and the 
	receiver as block arguments. For instance, to sum the numeric elements 
	of a collection, aCollection inject: 0 into: [:subTotal :next | subTotal + 
	next]."

	| nextValue |
	nextValue := thisValue.
	self valuesDo: [ :each | nextValue := binaryBlock value: nextValue value: each ].
	^ nextValue
]

{ #category : #enumerating }
ArrayMultiValuedDictionary >> intersection: aCollection [
	"Answer the set theoretic intersection of two collections."

	| other duplicates |
	other := aCollection asSet.
	duplicates := Set new.
	^ self
		select: [ :each | 
			((other includes: each) and: [ (duplicates includes: each) not ])
				ifTrue: [ duplicates add: each. true ]
				ifFalse: [ false ] ]
]

{ #category : #testing }
ArrayMultiValuedDictionary >> isCollection [
	"Return true if the receiver is some sort of Collection and responds to basic collection messages such as #size and #do:"

	^ true
]

{ #category : #testing }
ArrayMultiValuedDictionary >> isDictionary [
	^ true
]

{ #category : #testing }
ArrayMultiValuedDictionary >> isEmpty [
	^ dictionary isEmpty
]

{ #category : #testing }
ArrayMultiValuedDictionary >> isEmptyOrNil [
	"Answer whether the receiver contains any elements, or is nil.  Useful in numerous situations where one wishes the same reaction to an empty collection or to nil"

	^ self isEmpty
]

{ #category : #testing }
ArrayMultiValuedDictionary >> isNotEmpty [
	"Answer whether the receiver contains any elements."

	^ self isEmpty not
]

{ #category : #accessing }
ArrayMultiValuedDictionary >> keyAtIdentityValue: value [
	"Answer the key that is the external name for the argument, value. If 
	there is none, answer nil.
	Note: There can be multiple keys with the same value. Only one is returned."

	^ self keyAtIdentityValue: value ifAbsent: [ self errorValueNotFound: value ]
]

{ #category : #accessing }
ArrayMultiValuedDictionary >> keyAtIdentityValue: value ifAbsent: exceptionBlock [
	"Answer the key that is the external name for the argument, value. If 
	there is none, answer the result of evaluating exceptionBlock.
	Note: There can be multiple keys with the same value. Only one is returned."

	dictionary
		associationsDo: [ :association | 
			association value
				do: [ :eachValue | 
					value == eachValue
						ifTrue: [ ^ association key ] ] ].
	^ exceptionBlock value
]

{ #category : #accessing }
ArrayMultiValuedDictionary >> keyAtValue: value [
	"Answer the key that is the external name for the argument, value. If 
	there is none, signal an error."

	^ self keyAtValue: value ifAbsent: [ self errorValueNotFound: value ]
]

{ #category : #accessing }
ArrayMultiValuedDictionary >> keyAtValue: value ifAbsent: exceptionBlock [
	"Answer the key that is the external name for the argument, value. If 
	there is none, answer the result of evaluating exceptionBlock.
	: Use =, not ==, so strings like 'this' can be found.  Note that MethodDictionary continues to use == so it will be fast."

	dictionary
		associationsDo: [ :association | 
			association value
				do: [ :eachValue | 
					value = eachValue
						ifTrue: [ ^ association key ] ] ].
	^ exceptionBlock value
]

{ #category : #accessing }
ArrayMultiValuedDictionary >> keys [
	"Answer an Array containing the receiver's keys."

	^ dictionary keys
]

{ #category : #enumerating }
ArrayMultiValuedDictionary >> keysAndValuesDo: aBlock [
	"Enumerate the receiver with all the keys and values."

	self associationsDo: [ :assoc | aBlock value: assoc key value: assoc value ]
]

{ #category : #removing }
ArrayMultiValuedDictionary >> keysAndValuesRemove: keyValueBlock [
	"Removes all entries for which keyValueBlock returns true."

	"i don't know how to implement this feature."

	self shouldNotImplement
]

{ #category : #enumerating }
ArrayMultiValuedDictionary >> keysDo: aBlock [
	"Evaluate aBlock for each of the receiver's keys."

	dictionary associationsDo: [ :association | aBlock value: association key ]
]

{ #category : #accessing }
ArrayMultiValuedDictionary >> keysSortedSafely [
	"Answer an Array containing the receiver's keys."

	^ dictionary keysSortedSafely
]

{ #category : #enumerating }
ArrayMultiValuedDictionary >> noneSatisfy: aBlock [
	"Evaluate aBlock with the elements of the receiver.
	If aBlock returns false for all elements return true.
	Otherwise return false"

	self valuesDo: [ :item | (aBlock value: item) ifTrue: [ ^ false ] ].
	^ true
]

{ #category : #testing }
ArrayMultiValuedDictionary >> notEmpty [
	"Answer whether the receiver contains any elements."

	"use isNotEmpty for consistency with isEmpty"

	^ self isNotEmpty
]

{ #category : #testing }
ArrayMultiValuedDictionary >> occurrencesOf: anObject [
	"Answer how many of the receiver's elements are equal to anObject."

	| tally |
	tally := 0.
	self valuesDo: [ :each | anObject = each ifTrue: [ tally := tally + 1 ] ].
	^ tally
]

{ #category : #copying }
ArrayMultiValuedDictionary >> postCopy [
	| newDict |
	newDict := self dictionaryClass new.
	dictionary associationsDo: [ :assoc | newDict at: assoc key put: assoc value copy ].
	dictionary := newDict
]

{ #category : #printing }
ArrayMultiValuedDictionary >> printElementsOn: aStream [
	aStream nextPut: $(.
	self size > 100
		ifTrue: [ 
			aStream nextPutAll: 'size '.
			self size printOn: aStream ]
		ifFalse: [ 
			self keysSortedSafely
				do: [ :key | 
					aStream
						print: key;
						nextPutAll: '->';
						print: (self at: key);
						space ] ].
	aStream nextPut: $)
]

{ #category : #printing }
ArrayMultiValuedDictionary >> printNameOn: aStream [
	aStream
		nextPutAll: 'an ';
		nextPutAll: self class name
]

{ #category : #printing }
ArrayMultiValuedDictionary >> printOn: aStream [
	"Append a sequence of characters that identify the receiver to aStream."

	self
		printNameOn: aStream;
		printElementsOn: aStream
]

{ #category : #printing }
ArrayMultiValuedDictionary >> printOn: aStream delimiter: delimString [
	"Print elements on a stream separated
	with a delimiter String like: 'a, b, c' "

	self
		do: [ :elem | aStream print: elem ]
		separatedBy: [ aStream nextPutAll: delimString ]
]

{ #category : #printing }
ArrayMultiValuedDictionary >> printOn: aStream delimiter: delimString last: lastDelimString [
	"Print elements on a stream separated
	with a delimiter between all the elements and with
	a special one before the last like: 'a, b and c'

	Note: Feel free to improve the code to detect the last element."

	| n sz |
	n := 1.
	sz := self size.
	self
		do: [ :elem | 
			n := n + 1.
			aStream print: elem ]
		separatedBy: [ 
			n = sz
				ifTrue: [ aStream nextPutAll: lastDelimString ]
				ifFalse: [ aStream nextPutAll: delimString ] ]
]

{ #category : #private }
ArrayMultiValuedDictionary >> privateAt: key put: anObject [
	dictionary at: key put: anObject
]

{ #category : #enumerating }
ArrayMultiValuedDictionary >> reject: aBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument. 
	Collect into a new collection like the receiver only those elements for 
	which aBlock evaluates to false. Answer the new collection."

	"Uses do: for performance and to be sure that it is a collectionClass."

	| newCollection |
	newCollection := self copyEmpty.
	dictionary
		associationsDo: [ :association | 
			| newValues |
			newValues := association value reject: aBlock.
			newValues isEmpty
				ifFalse: [ newCollection privateAt: association key put: newValues ] ].
	^ newCollection
]

{ #category : #enumerating }
ArrayMultiValuedDictionary >> reject: rejectBlock thenCollect: collectBlock [
	"Utility method to improve readability."

	"Optimized for efficiency."

	| newCollection |
	newCollection := self copyEmpty.
	dictionary 
		associationsDo: [ :association | 
			| newValues |
			newValues := association value reject: rejectBlock thenCollect: collectBlock.
			newValues isEmpty
				ifFalse: [ newCollection privateAt: association key put: newValues ] ].
	^ newCollection
]

{ #category : #enumerating }
ArrayMultiValuedDictionary >> reject: rejectBlock thenDo: doBlock [
	"Utility method to improve readability."

	"Do not create the intermediate collection.
	 Optimized for efficiency."

	dictionary
		associationsDo: [ :association | association value reject: rejectBlock thenDo: doBlock ]
]

{ #category : #removing }
ArrayMultiValuedDictionary >> remove: anObject [
	self shouldNotImplement
]

{ #category : #removing }
ArrayMultiValuedDictionary >> remove: anObject ifAbsent: exceptionBlock [
	self shouldNotImplement
]

{ #category : #removing }
ArrayMultiValuedDictionary >> removeAll [
	dictionary removeAll
]

{ #category : #removing }
ArrayMultiValuedDictionary >> removeKey: key [
	"Remove key from the receiver.
	If key is not in the receiver, notify an error."

	^ dictionary removeKey: key ifAbsent: [ self errorKeyNotFound: key ]
]

{ #category : #removing }
ArrayMultiValuedDictionary >> removeKey: key ifAbsent: aBlock [
	"Remove key (and its associated value) from the receiver. If key is not in 
	the receiver, answer the result of evaluating aBlock. Otherwise, answer 
	the value externally named by key."

	^ dictionary removeKey: key ifAbsent: aBlock
]

{ #category : #enumerating }
ArrayMultiValuedDictionary >> select: aBlock [
	"Evaluate aBlock with each of my values as the argument. Collect into a new dictionary, only those associations for which aBlock evaluates to true."

	| newCollection |
	newCollection := self copyEmpty.
	dictionary 
		associationsDo: [ :association | 
			| newValues |
			newValues := association value select: aBlock.
			newValues isEmpty
				ifFalse: [ newCollection privateAt: association key put: newValues ] ].
	^ newCollection
]

{ #category : #enumerating }
ArrayMultiValuedDictionary >> select: selectBlock thenCollect: collectBlock [
	"Utility method to improve readability."

	"Optimized for efficiency."

	| newCollection |
	newCollection := self copyEmpty.
	dictionary 
		associationsDo: [ :association | 
			| newValues |
			newValues := association value select: selectBlock thenCollect: collectBlock.
			newValues isEmpty
				ifFalse: [ newCollection privateAt: association key put: newValues ] ].
	^ newCollection
]

{ #category : #enumerating }
ArrayMultiValuedDictionary >> select: selectBlock thenDo: doBlock [
	"Utility method to improve readability.
	Do not create the intermediate collection."

	dictionary
		associationsDo: [ :association | association value select: selectBlock thenDo: doBlock ]
]

{ #category : #accessing }
ArrayMultiValuedDictionary >> size [
	"Answer how many elements the receiver contains."

	| tally |
	tally := 0.
	dictionary associationsDo: [ :assoc | tally := tally + assoc value size ].
	^ tally
]

{ #category : #'math functions' }
ArrayMultiValuedDictionary >> sumNumbers: aBlock [
	"This is implemented using a variant of the normal inject:into: pattern
	that is specific to handling numbers. aBlock is expected to return a number
	for every element in the collection.
	
	Different from the sum: implementation, the default value is zero. While sum: is 
	more general, sumNumbers: is meant to support the most often encountered use case of
	dealing with numbers."

	^ self 
		inject: 0 
		into: [ :sum :each |  sum + (aBlock value: each) ]
]

{ #category : #enumerating }
ArrayMultiValuedDictionary >> union: aCollection [
	"Answer the set theoretic union of the receiver and aCollection, using the receiver's notion of equality and not side effecting the receiver at all."

	^ self copy
		addAll: aCollection;
		yourself
]

{ #category : #accessing }
ArrayMultiValuedDictionary >> values [
	"Answer a Collection containing the receiver's values."

	| newArray index |
	newArray := Array new: self size.
	index := 0.
	self valuesDo: [ :each | newArray at: (index := index + 1) put: each ].
	^ newArray
]

{ #category : #enumerating }
ArrayMultiValuedDictionary >> valuesDo: aBlock [
	"Evaluate aBlock for each of the receiver's values."

	dictionary associationsDo: [ :association | association value do: aBlock ]
]
