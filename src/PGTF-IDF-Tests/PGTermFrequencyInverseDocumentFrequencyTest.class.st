Class {
	#name : #PGTermFrequencyInverseDocumentFrequencyTest,
	#superclass : #TestCase,
	#instVars : [
		'documents',
		'tfidf'
	],
	#category : #'PGTF-IDF-Tests'
}

{ #category : #running }
PGTermFrequencyInverseDocumentFrequencyTest >> setUp [ 
	documents := #(
		(I am Sam)
		(Sam I am)
		(I 'don''t' like green eggs and ham)).
		
	tfidf := PGTermFrequencyInverseDocumentFrequency new.
	tfidf trainOn: documents.
]

{ #category : #tests }
PGTermFrequencyInverseDocumentFrequencyTest >> testCountInAllDocuments [
	| words expectedCounts actualCounts |
	words := #(I am Sam 'don''t' like green eggs and ham).
	
	expectedCounts := #(3 2 2 1 1 1 1 1 1).
	actualCounts := words collect: [ :w | tfidf countInAllDocuments: w ].
	
	self assert: actualCounts equals: expectedCounts
]

{ #category : #tests }
PGTermFrequencyInverseDocumentFrequencyTest >> testInverseDocumentFrequencyOf [
	| words expected actual |
	words := #(I am Sam 'don''t' like green eggs and ham).
	
	expected := #(3 2 2 1 1 1 1 1 1) collect: [ :x | (3.0 / x) ln ].
	actual := words collect: [ :word | tfidf inverseDocumentFrequencyOf: word ].
	
	self assert: actual equals: expected
]

{ #category : #tests }
PGTermFrequencyInverseDocumentFrequencyTest >> testNumberOfDocuments [
	self assert: tfidf numberOfDocuments equals: 3
]

{ #category : #tests }
PGTermFrequencyInverseDocumentFrequencyTest >> testNumberOfDocumentsThatContainWord [
	| words expectedCounts actualCounts |
	words := #(I am Sam 'don''t' like green eggs and ham).
	
	expectedCounts := #(3 2 2 1 1 1 1 1 1).
	actualCounts := words collect: [ :w | tfidf numberOfDocumentsThatContainWord: w ].
	
	self assert: actualCounts equals: expectedCounts
]

{ #category : #tests }
PGTermFrequencyInverseDocumentFrequencyTest >> testScoreOfIn [
	| document words expected actual |
	document := #(I am green green ham).
	words := #(I am green ham).
	
	expected := { 1 * (3.0 / 3) ln . 1 * (3.0 / 2) ln . 2 * (3.0 / 1) ln . 1 * (3.0 / 1) ln }.
	actual := words collect: [ :word | tfidf scoreOf: word in: document ].
	
	self assert: actual equals: expected
	
]

{ #category : #tests }
PGTermFrequencyInverseDocumentFrequencyTest >> testTermFrequencyOfIn [
	| document expected actual |
	document := #(hello world hello hello world).
	
	expected := #(3 2).
	actual := #(hello world) collect: [ :word | tfidf termFrequencyOf: word in: document ].
	
	self assert: actual equals: expected
]

{ #category : #tests }
PGTermFrequencyInverseDocumentFrequencyTest >> testVectorFor [
	| document tf idf expected actual |
	document := #(I am green green ham).
	
	"#(I Sam am and 'don''t' eggs green ham like)"
	
	tf := #(1 0 1 0 0 0 2 1 0).
	idf := #(3 2 2 1 1 1 1 1 1) collect: [ :x | (3.0 / x) ln ].
	
	expected := tf * idf.
	actual := tfidf vectorFor: document.
	
	self assert: actual equals: expected
	
]

{ #category : #tests }
PGTermFrequencyInverseDocumentFrequencyTest >> testVocabulary [
	| expected actual |
	
	expected := #(I Sam am and 'don''t' eggs green ham like).
	actual := tfidf vocabulary.
	
	self assert: actual equals: expected
]
