"
Redefining methods with logging removed for performance overhead evaluation.
"
Class {
	#name : #OCETargetBasedProxy,
	#superclass : #GHTargetBasedProxy,
	#category : #ObjectCentricEvaluationExamples
}

{ #category : #intercepting }
OCETargetBasedProxy >> cannotInterpret: aMessage [
	| interception |
	interception := GHInterception for: aMessage proxy: self. 
	^ self proxyHandler handleInterception: interception.
]
