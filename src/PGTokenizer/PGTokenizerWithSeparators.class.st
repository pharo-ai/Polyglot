Class {
	#name : #PGTokenizerWithSeparators,
	#superclass : #Object,
	#instVars : [
		'separators'
	],
	#category : #PGTokenizer
}

{ #category : #adding }
PGTokenizerWithSeparators >> addSeparator: anArrayOfSeparators [

	|separatorCharacterCodes|
	
	separatorCharacterCodes := anArrayOfSeparators collect: [ :each | each asInteger ].
	separators := separators , separatorCharacterCodes.
]

{ #category : #initialization }
PGTokenizerWithSeparators >> initialize [ 
	super initialize.
	separators := #(9 10 11 13 32).
]

{ #category : #testing }
PGTokenizerWithSeparators >> isSeparator: character [
	"checks whether method is a separation character"
	|charcode setOfSeparators|
	charcode := character asInteger.
	setOfSeparators := Set withAll: separators.
	^setOfSeparators includes: charcode.
]

{ #category : #accessing }
PGTokenizerWithSeparators >> separators [ 
	^separators
]

{ #category : #'as yet unclassified' }
PGTokenizerWithSeparators >> splitTextIntoWords: aString [
	^[ :each | self isSeparator: each ] split: aString.
]
