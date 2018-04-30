"
dictionary: Dictionary 
collection: OrderedCollection 

"
Class {
	#name : #MxDictionaryAndOrderedCollectionTest,
	#superclass : #MixedDictionaryTest,
	#category : 'MultiValuedDictionary-Tests'
}

{ #category : #requirements }
MxDictionaryAndOrderedCollectionTest >> dictionaryClass [
	^ Dictionary
]

{ #category : #requirements }
MxDictionaryAndOrderedCollectionTest >> valueCollectionClass [
	^ OrderedCollection
]
