"
dictionary: Dictionary 
collection: OrderedCollection 

"
Class {
	#name : #SDictionaryAndOrderedCollectionTest,
	#superclass : #SimpleDictionaryTest,
	#category : #'MultiValuedDictionary-Tests'
}

{ #category : #requirements }
SDictionaryAndOrderedCollectionTest >> dictionaryClass [
	^ Dictionary
]

{ #category : #requirements }
SDictionaryAndOrderedCollectionTest >> valueCollectionClass [
	^ OrderedCollection
]
