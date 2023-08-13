"
dictionary: SmallDictionary 
collection: OrderedCollection 



"
Class {
	#name : #MxSmallDictionaryAndOrderedCollectionTest,
	#superclass : #MixedDictionaryTest,
	#category : #'MultiValuedDictionary-Tests'
}

{ #category : #requirements }
MxSmallDictionaryAndOrderedCollectionTest >> dictionaryClass [
	^ SmallDictionary
]

{ #category : #requirements }
MxSmallDictionaryAndOrderedCollectionTest >> valueCollectionClass [

	^ OrderedCollection
]
