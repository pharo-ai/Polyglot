Class {
	#name : #PGTermFrequencyInverseDocumentFrequency,
	#superclass : #Object,
	#instVars : [
		'totalWordCounts',
		'perWordDocumentCount',
		'numberOfDocuments'
	],
	#category : #'PGTF-IDF'
}

{ #category : #'as yet unclassified' }
PGTermFrequencyInverseDocumentFrequency >> countInAllDocuments: aWord [
	^ totalWordCounts occurrencesOf: aWord
]

{ #category : #'as yet unclassified' }
PGTermFrequencyInverseDocumentFrequency >> inverseDocumentFrequencyOf: aWord [
	^ (self numberOfDocuments / (self numberOfDocumentsThatContainWord: aWord)) ln.
]

{ #category : #'as yet unclassified' }
PGTermFrequencyInverseDocumentFrequency >> numberOfDocuments [
	^ numberOfDocuments 
]

{ #category : #'as yet unclassified' }
PGTermFrequencyInverseDocumentFrequency >> numberOfDocumentsThatContainWord: aWord [
	^ perWordDocumentCount occurrencesOf: aWord
	
]

{ #category : #'as yet unclassified' }
PGTermFrequencyInverseDocumentFrequency >> scoreOf: aWord in: aDocument [
	| tf idf |
	tf := self termFrequencyOf: aWord in: aDocument.
	idf := self inverseDocumentFrequencyOf: aWord.
	^ tf * idf
]

{ #category : #'as yet unclassified' }
PGTermFrequencyInverseDocumentFrequency >> termFrequencyOf: aWord in: aDocument [
	^ aDocument occurrencesOf: aWord
]

{ #category : #'as yet unclassified' }
PGTermFrequencyInverseDocumentFrequency >> trainOn: aCollectionOfDocuments [
	numberOfDocuments := aCollectionOfDocuments size.
	totalWordCounts := (aCollectionOfDocuments flatCollect: #yourself) asBag.
	perWordDocumentCount := ((aCollectionOfDocuments collect: [ :document | document asSet asArray ]) flatCollect: #yourself) asBag.
]

{ #category : #'as yet unclassified' }
PGTermFrequencyInverseDocumentFrequency >> vectorFor: aDocument [
	^ self vocabulary collect: [ :word | self scoreOf: word in: aDocument ].
]

{ #category : #'as yet unclassified' }
PGTermFrequencyInverseDocumentFrequency >> vocabulary [
	^ totalWordCounts asSet sorted
]
