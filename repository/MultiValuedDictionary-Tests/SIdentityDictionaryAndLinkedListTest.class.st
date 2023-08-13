"
dictionary: IdentityDictionary 
collection: LinkedList 

"
Class {
	#name : #SIdentityDictionaryAndLinkedListTest,
	#superclass : #SimpleDictionaryTest,
	#category : #'MultiValuedDictionary-Tests'
}

{ #category : #requirements }
SIdentityDictionaryAndLinkedListTest >> dictionaryClass [
	^ IdentityDictionary
]

{ #category : #requirements }
SIdentityDictionaryAndLinkedListTest >> valueCollectionClass [

	^ LinkedList
]
