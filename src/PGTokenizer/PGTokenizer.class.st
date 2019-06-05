Class {
	#name : #PGTokenizer,
	#superclass : #Object,
	#instVars : [
		'separators'
	],
	#category : #PGTokenizer
}

{ #category : #adding }
PGTokenizer >> addSeparator: anArrayOfSeparators [

	|separatorCharacterCodes|
	
	separatorCharacterCodes := anArrayOfSeparators collect: [ :each | each asInteger ].
	separators := separators , separatorCharacterCodes.
]

{ #category : #initialization }
PGTokenizer >> initialize [ 
	super initialize.
	separators := #(9 10 11 13 32).
]

{ #category : #testing }
PGTokenizer >> isSeparator: character [
	"checks whether method is a separation character"
	|charcode setOfSeparators|
	charcode := character asInteger.
	setOfSeparators := Set withAll: separators.
	^setOfSeparators includes: charcode.
]

{ #category : #accessing }
PGTokenizer >> separators [ 
	^separators
]

{ #category : #'as yet unclassified' }
PGTokenizer >> splitTextIntoWords: aString [
	^[ :each | self isSeparator: each ] split: aString.
]
