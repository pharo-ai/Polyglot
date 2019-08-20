Class {
	#name : #PGPorterStemmer,
	#superclass : #PGAbstractStemmer,
	#category : #PGStemmer
}

{ #category : #'instance creation' }
PGPorterStemmer class >> for: aString [
    ^ super new initialize: aString.
]

{ #category : #'instance creation' }
PGPorterStemmer class >> new [
    self shouldNotImplement.
]

{ #category : #'as yet unclassified' }
PGPorterStemmer class >> stemOf: aString [
    | stemmer |
    stemmer := self for: aString.
	 aString isCharacter ifTrue: [^aString] ifFalse: [^stemmer performStemming: aString].
]

{ #category : #initialization }
PGPorterStemmer >> initialize: aString [
    string := aString asLowercase.
]

{ #category : #testing }
PGPorterStemmer >> isVowelAt: anIndex [
	
	^#eaoiuy includes: (string at: anIndex)
]

{ #category : #'as yet unclassified' }
PGPorterStemmer >> performStemming: aString [
	"Performs the Porter stemming algrothim. More see:
	M. Porter, An algorithm for suffix stripping, Program (1980)/ Vol. 14, No. 3, 130-137"
	
	string := aString asLowercase.
	string size > 2
		ifTrue:
			[self
				preprocessing;
				setMarks;
				step1a;
				step1b;
				step1c;
				step2;
				step3;
				step4;
				step5a;
				step5b].
	string := string asLowercase.
	^string
]

{ #category : #'as yet unclassified' }
PGPorterStemmer >> preprocessing [
	
	string first = $y ifTrue: [string at: 1 put: $Y].
	2
		to: string size
		do:
			[:index | 
			((string at: index) = $y and: [self isVowelAt: index - 1])
				ifTrue: [string at: index put: $Y]]
]

{ #category : #'as yet unclassified' }
PGPorterStemmer >> stemEndsWithConsonantVowelConsonant [
	
	^cursor >= 3
		and:
			[('Yywx' includes: (string at: cursor)) not
				and:
					[(self isConsonantAt: cursor)
						and:
							[(self isVowelAt: cursor - 1) and: [self isConsonantAt: cursor - 2]]]]
]

{ #category : #'as yet unclassified' }
PGPorterStemmer >> stemEndsWithDoubleConsonant [
	"comment stating purpose of message"
	
	^cursor >= 2
		and:
			[(string at: cursor) = (string at: cursor - 1)
				and: [self isConsonantAt: cursor]]
]

{ #category : #'as yet unclassified' }
PGPorterStemmer >> stemIncludesVowel [
	"comment stating purpose of message"
	
	1
		to: cursor
		do: [:index | (self isVowelAt: index) ifTrue: [^true]].
	^false
]

{ #category : #'as yet unclassified' }
PGPorterStemmer >> step1a [
	"comment stating purpose of message"
	
	string last == $s
		ifTrue:
			[(self endsWith: #sses)
				ifTrue:
					[string := string
						copyFrom: 1
						to: string size - 2.^self]
				ifFalse:
					[(self endsWith: #ies)
						ifTrue:
							[string := string
								copyFrom: 1
								to: string size - 2.^self]
						ifFalse:
							[(self endsWith: #ss)
								ifFalse:
									[string := string
										copyFrom: 1
										to: string size - 1.^self]]]]
]

{ #category : #'as yet unclassified' }
PGPorterStemmer >> step1b [
	"comment stating purpose of message"
	
	(self endsWith: 'eed')
		ifTrue:
			[cursor >= r1 ifTrue: [self setSuffix: 'ee'].
			^self].
	(((self endsWith: 'ed') or: [self endsWith: 'ing'])
		and: [self stemIncludesVowel])
		ifTrue:
			[self removeSuffix.
			#(#(#at #ate) #(#bl #ble) #(#iz #ize))
				do:
					[:rule | 
					(self endsWith: rule first)
						ifTrue:
							[self setSuffix: rule last.
							^self]].
			cursor := string size.
			(self stemEndsWithDoubleConsonant
				and:
					[(string at: cursor) ~~ $s
						and: [(string at: cursor) ~~ $z and: [(string at: cursor) ~~ $l]]])
				ifTrue:
					[string := string
						copyFrom: 1
						to: string size - 1.
					^self].
			(cursor = r1 and: [self stemEndsWithConsonantVowelConsonant])
				ifTrue: [self setSuffix: 'e']]
]

{ #category : #'as yet unclassified' }
PGPorterStemmer >> step1c [
	
	(((self endsWith: 'y') or: [self endsWith: 'Y'])
		and: [self stemIncludesVowel])
		ifTrue:
			[string
				at: string size
				put: $i. ^self]
]

{ #category : #pages }
PGPorterStemmer >> step2 [
	"comment stating purpose of message"
	
	#(#(#iveness #ive) #(#fulness #ful) #(#ousness #ous) #(#ization #ize) #(#ational #ate) #(#tional #tion) #(#biliti #ble) #(#ation #ate) #(#alism #al) #(#aliti #al) #(#iviti #ive) #(#ousli #ous) #(#entli #ent) #(#ator #ate) #(#enci #ence) #(#anci #ance) #(#logi #log) #(#izer #ize) #(#bli #ble) #(#alli #al) #(#eli #e))
		do:
			[:rule | 
			(self endsWith: (rule at: 1))
				ifTrue:
					[cursor >= r1 ifTrue: [self setSuffix: (rule at: 2)].
					^self]]
]

{ #category : #pages }
PGPorterStemmer >> step3 [
	
	#(#(#ative #'') #(#icate #ic) #(#alize #al) #(#iciti #ic) #(#ical #ic) #(#ness #'') #(#ful #''))
		do:
			[:rule | 
			(self endsWith: rule first)
				ifTrue:
					[cursor >= r1 ifTrue: [self setSuffix: rule last].
					^self]]
]

{ #category : #pages }
PGPorterStemmer >> step4 [
	
	#(#ement #ance #ence #able #ible #ment)
		do:
			[:rule | 
			(self endsWith: rule)
				ifTrue:
					[cursor >= r2 ifTrue: [self removeSuffix].
					^self]].
	((self endsWith: 'ion') and: [cursor >= r2])
		ifTrue:
			[(string at: cursor) == $s | ((string at: cursor) == $t)
				ifTrue:
					[self removeSuffix.
					^self]].
	#(#ant #ent #ism #ate #iti #ous #ive #ize #al #er #ic #ou)
		do:
			[:rule | 
			(self endsWith: rule)
				ifTrue:
					[cursor >= r2 ifTrue: [self removeSuffix].
					^self]]
]

{ #category : #'as yet unclassified' }
PGPorterStemmer >> step5a [
	
	cursor := string size - 1.
	(string last == $e
		and:
			[string size > r2
				or:
					[string size > r1 and: [self stemEndsWithConsonantVowelConsonant not]]])
		ifTrue:
			[self removeSuffix.
			^self]
]

{ #category : #'as yet unclassified' }
PGPorterStemmer >> step5b [
	
	cursor := string size.
	((self endsWith: 'll') and: [cursor + 1 >= r2])
		ifTrue: [self setSuffix: 'l'. ^self]
]

{ #category : #accessing }
PGPorterStemmer >> string [ 
	^string
]
