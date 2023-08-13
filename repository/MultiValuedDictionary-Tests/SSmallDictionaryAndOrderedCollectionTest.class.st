"
dictionary: SmallDictionary 
collection: OrderedCollection 

"
Class {
	#name : #SSmallDictionaryAndOrderedCollectionTest,
	#superclass : #SimpleDictionaryTest,
	#category : #'MultiValuedDictionary-Tests'
}

{ #category : #requirements }
SSmallDictionaryAndOrderedCollectionTest >> dictionaryClass [
	^ SmallDictionary
]

{ #category : #requirements }
SSmallDictionaryAndOrderedCollectionTest >> valueCollectionClass [

	^ OrderedCollection
]
