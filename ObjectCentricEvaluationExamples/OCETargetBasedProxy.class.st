"
Redefining methods with logging removed for performance overhead evaluation.
"
Class {
	#name : #OCETargetBasedProxy,
	#superclass : #GHTargetBasedProxy,
	#category : #ObjectCentricEvaluationExamples
}

{ #category : #'instance creation' }
OCETargetBasedProxy class >> createProxyAndReplace: anObjectThenProxy handler: aHandler [
	| aProxyThenObject |
	aProxyThenObject := self basicNew
		initializeWith: anObjectThenProxy
		handler: aHandler.
	(Array with: aProxyThenObject)
		elementsExchangeIdentityWith: (Array with: anObjectThenProxy).
	anObjectThenProxy proxyTarget: aProxyThenObject.
	GHProxyTrap initialize.
	self rewriteGHInterceptioNMesssageCannotInterpret.
	^ anObjectThenProxy
]

{ #category : #'instance creation' }
OCETargetBasedProxy class >> rewriteGHInterceptioNMesssageCannotInterpret [
	GHInterceptionDelegator
		compile:
			'cannotInterpret: aMessage 
	"Redefining methods with logging removed for performance overhead evaluation."
	| interception context  counter|		
	interception := GHInterception for: aMessage proxy: self. 
	^ self proxyHandler handleInterception: interception.'
]

{ #category : #intercepting }
OCETargetBasedProxy >> cannotInterpret: aMessage [
	| interception |
	interception := GHInterception for: aMessage proxy: self. 
	^ self proxyHandler handleInterception: interception.
]
