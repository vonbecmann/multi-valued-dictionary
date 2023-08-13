"
dictionary: IdentityDictionary 
collection: LinkedList 

"
Class {
	#name : #SIdentityDictionaryAndLinkedListTest,
	#superclass : #SimpleDictionaryTest,
	#category : #'MultiValuedDictionary-Tests'
}

{ #category : #accessing }
SIdentityDictionaryAndLinkedListTest >> dictionaryClass [
	^ IdentityDictionary
]

{ #category : #requirements }
SIdentityDictionaryAndLinkedListTest >> valueCollectionClass [

	^ LinkedList
]
