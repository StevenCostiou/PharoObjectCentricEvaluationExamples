"
Simple Ghost message handler:  which only intercept the #name: message sent to a proxified object, and executes instrumentation behavior before passing back the message to the proxified object.

Only methods manageMessage: and handleUninstall: are relevant for the example. Other methods are reimplemented there to avoid Transcript logging during performance overhead evaluation.
"
Class {
	#name : #OCEInstVarAccessProxyHandler,
	#superclass : #GHProxyHandler,
	#category : #ObjectCentricEvaluationExamples
}

{ #category : #'handle - API' }
OCEInstVarAccessProxyHandler >> handleInterception: anInterception [
	"Copy of the original method from GHProxyHandler, with removal of logging for performance overhead evaluation."
	(self isMessageNotToIntercept: anInterception message)
		ifTrue: [ ^ self manageMessageInternally: anInterception  ]
	 	ifFalse: [ ^ self manageMessage: anInterception]
]

{ #category : #'handle - support' }
OCEInstVarAccessProxyHandler >> handleUninstall: anInterception [
	^ anInterception proxy proxyTarget become: anInterception proxy.
]

{ #category : #'handle - support' }
OCEInstVarAccessProxyHandler >> manageMessage: interception [
	| message proxy target result |
	message := interception message.
	proxy := interception proxy.
	target := proxy proxyTarget.
	message selector == #name:
		ifTrue: [ target tag: message arguments first ].
	result := message sendTo: target.
	^ result == target
		ifTrue: [ proxy ]
		ifFalse: [ result ]
]

{ #category : #'handle - API' }
OCEInstVarAccessProxyHandler >> manageMessageInternally:  anInterception [
	"Copy of the original method from GHProxyHandler, with removal of logging for performance overhead evaluation."
	^ self perform: (self methodsNotToIntercept at: anInterception message selector) with: anInterception
]
