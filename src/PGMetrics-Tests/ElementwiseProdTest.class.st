Class {
	#name : #ElementwiseProdTest,
	#superclass : #TestCase,
	#category : #'PGMetrics-Tests'
}

{ #category : #tests }
ElementwiseProdTest >> testElementwiseProd [
	| result actual |
	
	result := #(1 2 3) elementwiseProd: #(3 4 5).
	actual := #(3 8 15).
	
	self assert: result equals: actual. 
	

]
