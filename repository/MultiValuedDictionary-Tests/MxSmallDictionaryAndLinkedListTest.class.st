"
dictionary: SmallDictionary 
collection: LinkedList 


"
Class {
	#name : #MxSmallDictionaryAndLinkedListTest,
	#superclass : #MixedDictionaryTest,
	#category : #'MultiValuedDictionary-Tests'
}

{ #category : #requirements }
MxSmallDictionaryAndLinkedListTest >> dictionaryClass [
	^ SmallDictionary
]

{ #category : #requirements }
MxSmallDictionaryAndLinkedListTest >> valueCollectionClass [

	^ LinkedList
]
