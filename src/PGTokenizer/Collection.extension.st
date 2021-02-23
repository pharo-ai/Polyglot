Extension { #name : #Collection }

{ #category : #'*PGTokenizer' }
Collection >> collectDisplayingProgress: aBlock [ 
	"Evaluate aBlock with each of the receiver's elements as the argument.  
	Collect the resulting values into a collection like the receiver. Answer  
	the new collection."

	^ self asArray collectDisplayingProgress: aBlock 
]
