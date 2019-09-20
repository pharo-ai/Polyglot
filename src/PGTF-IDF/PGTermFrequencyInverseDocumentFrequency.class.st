Class {
	#name : #PGTermFrequencyInverseDocumentFrequency,
	#superclass : #Object,
	#instVars : [
		'perWordDocumentCount',
		'numberOfDocuments'
	],
	#category : #'PGTF-IDF'
}

{ #category : #'as yet unclassified' }
PGTermFrequencyInverseDocumentFrequency >> inverseDocumentFrequencyOf: aWord [
	^ (self numberOfDocuments / (self numberOfDocumentsThatContainWord: aWord)) ln.
]

{ #category : #'instance creation' }
PGTermFrequencyInverseDocumentFrequency >> log: aNumber [
	"Natural logarithm used o compute IDF. Can be overriden by subclasses"
	^ aNumber ln
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
	perWordDocumentCount := ((aCollectionOfDocuments collect: [ :document | document asSet asArray ]) flatCollect: #yourself) asBag.
]

{ #category : #'as yet unclassified' }
PGTermFrequencyInverseDocumentFrequency >> vectorFor: aDocument [
	^ self vocabulary collect: [ :word | self scoreOf: word in: aDocument ].
]

{ #category : #'as yet unclassified' }
PGTermFrequencyInverseDocumentFrequency >> vocabulary [
	^ perWordDocumentCount asSet sorted
]
