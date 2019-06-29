Class {
	#name : #PGStemmer,
	#superclass : #Object,
	#instVars : [
		'cache'
	],
	#classVars : [
		'English'
	],
	#category : #PGStemmer
}

{ #category : #accessing }
PGStemmer >> cache [
	"Answer the cache of stemmed words."
	
	^cache isNil
		ifTrue: [cache := Dictionary new]
		ifFalse: [cache]
]

{ #category : #'as yet unclassified' }
PGStemmer >> performStemming: aString [
	"Perform the stemming of a string."
	
	^self subclassResponsibility
]

{ #category : #'as yet unclassified' }
PGStemmer >> purgeCache [
	"Clear the recievers cache of stemmed words."
	
	cache := nil
]

{ #category : #'as yet unclassified' }
PGStemmer >> stem: aString [
	"Answer the the morphological root of a word, ie removes its suffix."
	
	^self cache
		at: aString
		ifAbsentPut: [self performStemming: aString]
]
