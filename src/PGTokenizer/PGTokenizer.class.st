Class {
	#name : #PGTokenizer,
	#superclass : #Object,
	#category : #PGTokenizer
}

{ #category : #'as yet unclassified' }
PGTokenizer >> sentenceTokenize: aString [
	|streamPointer cur sent sentenceCollection|
	streamPointer := ReadStream on: aString.
	sent := WriteStream on: (String new).
	sentenceCollection := OrderedCollection new.

	[ streamPointer atEnd ] whileFalse: [ 
			cur := streamPointer next.
			sent nextPut: cur.
			(( cur = $? or: cur = $!) or: (cur = $. and: streamPointer peek = $ ))
				ifTrue: [  sentenceCollection add: sent contents. sent := WriteStream on: (String new). ].
	].
	sentenceCollection add: sent contents.
	^sentenceCollection asArray.
]

{ #category : #parsing }
PGTokenizer >> tokenize: aString [
	^[ :each | each isSeparator ] split: aString.
]
