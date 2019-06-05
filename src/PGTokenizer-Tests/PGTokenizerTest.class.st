Class {
	#name : #PGTokenizerTest,
	#superclass : #TestCase,
	#instVars : [
		'tokenizer'
	],
	#category : #'PGTokenizer-Tests'
}

{ #category : #running }
PGTokenizerTest >> setUp [
	super setUp.
	tokenizer := PGTokenizer new.
]

{ #category : #tests }
PGTokenizerTest >> testSplitTextIntoWords [
	|text result expected|
	text := 'This is a test string.'.
	result := (tokenizer splitTextIntoWords: text) asArray .
	
	expected := #('This' 'is' 'a' 'test' 'string.').
	self assert: result equals: expected.
]
