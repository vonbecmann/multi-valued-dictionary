"
dictionary: SmallDictionary 
collection: OrderedCollection 

"
Class {
	#name : #SSmallDictionaryAndOrderedCollectionTest,
	#superclass : #SimpleDictionaryTest,
	#category : #'MultiValuedDictionary-Tests'
}

{ #category : #accessing }
SSmallDictionaryAndOrderedCollectionTest >> dictionaryClass [
	^ SmallDictionary
]

{ #category : #requirements }
SSmallDictionaryAndOrderedCollectionTest >> valueCollectionClass [

	^ OrderedCollection
]
