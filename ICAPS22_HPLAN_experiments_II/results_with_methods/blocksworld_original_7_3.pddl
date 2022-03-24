( define ( domain Blocks4 )
  ( :requirements :strips :typing :equality :htn )
  ( :types block )
  ( :predicates
    ( ON-TABLE ?b - BLOCK )
    ( ON ?b1 - BLOCK ?b2 - BLOCK )
    ( CLEAR ?b - BLOCK )
    ( HAND-EMPTY )
    ( HOLDING ?b - BLOCK )
  )
  ( :action !PICKUP
    :parameters
    (
      ?b - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?b ) ( CLEAR ?b ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON-TABLE ?b ) ) ( not ( CLEAR ?b ) ) ( not ( HAND-EMPTY ) ) ( HOLDING ?b ) )
  )
  ( :action !PUTDOWN
    :parameters
    (
      ?b - BLOCK
    )
    :precondition
    ( and ( HOLDING ?b ) )
    :effect
    ( and ( not ( HOLDING ?b ) ) ( HAND-EMPTY ) ( ON-TABLE ?b ) ( CLEAR ?b ) )
  )
  ( :action !UNSTACK
    :parameters
    (
      ?b1 - BLOCK
      ?b2 - BLOCK
    )
    :precondition
    ( and ( ON ?b1 ?b2 ) ( CLEAR ?b1 ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON ?b1 ?b2 ) ) ( not ( CLEAR ?b1 ) ) ( not ( HAND-EMPTY ) ) ( CLEAR ?b2 ) ( HOLDING ?b1 ) )
  )
  ( :action !STACK
    :parameters
    (
      ?b1 - BLOCK
      ?b2 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?b1 ) ( CLEAR ?b2 ) )
    :effect
    ( and ( not ( HOLDING ?b1 ) ) ( not ( CLEAR ?b2 ) ) ( HAND-EMPTY ) ( ON ?b1 ?b2 ) ( CLEAR ?b1 ) )
  )
  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?goal - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?goal ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?top - BLOCK
      ?bottom - BLOCK
    )
    :precondition
    ( and ( ON ?top ?bottom ) )
    :subtasks
    (  )
  )

  ( :method MAKE-CLEAR
    :parameters
    (
      ?target - BLOCK
    )
    :precondition
    ( and ( CLEAR ?target ) )
    :subtasks
    (  )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84309 - BLOCK
      ?auto_84310 - BLOCK
      ?auto_84311 - BLOCK
      ?auto_84312 - BLOCK
      ?auto_84313 - BLOCK
      ?auto_84314 - BLOCK
      ?auto_84315 - BLOCK
    )
    :vars
    (
      ?auto_84316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84316 ?auto_84315 ) ( CLEAR ?auto_84316 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_84309 ) ( ON ?auto_84310 ?auto_84309 ) ( ON ?auto_84311 ?auto_84310 ) ( ON ?auto_84312 ?auto_84311 ) ( ON ?auto_84313 ?auto_84312 ) ( ON ?auto_84314 ?auto_84313 ) ( ON ?auto_84315 ?auto_84314 ) ( not ( = ?auto_84309 ?auto_84310 ) ) ( not ( = ?auto_84309 ?auto_84311 ) ) ( not ( = ?auto_84309 ?auto_84312 ) ) ( not ( = ?auto_84309 ?auto_84313 ) ) ( not ( = ?auto_84309 ?auto_84314 ) ) ( not ( = ?auto_84309 ?auto_84315 ) ) ( not ( = ?auto_84309 ?auto_84316 ) ) ( not ( = ?auto_84310 ?auto_84311 ) ) ( not ( = ?auto_84310 ?auto_84312 ) ) ( not ( = ?auto_84310 ?auto_84313 ) ) ( not ( = ?auto_84310 ?auto_84314 ) ) ( not ( = ?auto_84310 ?auto_84315 ) ) ( not ( = ?auto_84310 ?auto_84316 ) ) ( not ( = ?auto_84311 ?auto_84312 ) ) ( not ( = ?auto_84311 ?auto_84313 ) ) ( not ( = ?auto_84311 ?auto_84314 ) ) ( not ( = ?auto_84311 ?auto_84315 ) ) ( not ( = ?auto_84311 ?auto_84316 ) ) ( not ( = ?auto_84312 ?auto_84313 ) ) ( not ( = ?auto_84312 ?auto_84314 ) ) ( not ( = ?auto_84312 ?auto_84315 ) ) ( not ( = ?auto_84312 ?auto_84316 ) ) ( not ( = ?auto_84313 ?auto_84314 ) ) ( not ( = ?auto_84313 ?auto_84315 ) ) ( not ( = ?auto_84313 ?auto_84316 ) ) ( not ( = ?auto_84314 ?auto_84315 ) ) ( not ( = ?auto_84314 ?auto_84316 ) ) ( not ( = ?auto_84315 ?auto_84316 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_84316 ?auto_84315 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_84318 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_84318 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_84318 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_84319 - BLOCK
    )
    :vars
    (
      ?auto_84320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84319 ?auto_84320 ) ( CLEAR ?auto_84319 ) ( HAND-EMPTY ) ( not ( = ?auto_84319 ?auto_84320 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_84319 ?auto_84320 )
      ( MAKE-1PILE ?auto_84319 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84327 - BLOCK
      ?auto_84328 - BLOCK
      ?auto_84329 - BLOCK
      ?auto_84330 - BLOCK
      ?auto_84331 - BLOCK
      ?auto_84332 - BLOCK
    )
    :vars
    (
      ?auto_84333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84333 ?auto_84332 ) ( CLEAR ?auto_84333 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_84327 ) ( ON ?auto_84328 ?auto_84327 ) ( ON ?auto_84329 ?auto_84328 ) ( ON ?auto_84330 ?auto_84329 ) ( ON ?auto_84331 ?auto_84330 ) ( ON ?auto_84332 ?auto_84331 ) ( not ( = ?auto_84327 ?auto_84328 ) ) ( not ( = ?auto_84327 ?auto_84329 ) ) ( not ( = ?auto_84327 ?auto_84330 ) ) ( not ( = ?auto_84327 ?auto_84331 ) ) ( not ( = ?auto_84327 ?auto_84332 ) ) ( not ( = ?auto_84327 ?auto_84333 ) ) ( not ( = ?auto_84328 ?auto_84329 ) ) ( not ( = ?auto_84328 ?auto_84330 ) ) ( not ( = ?auto_84328 ?auto_84331 ) ) ( not ( = ?auto_84328 ?auto_84332 ) ) ( not ( = ?auto_84328 ?auto_84333 ) ) ( not ( = ?auto_84329 ?auto_84330 ) ) ( not ( = ?auto_84329 ?auto_84331 ) ) ( not ( = ?auto_84329 ?auto_84332 ) ) ( not ( = ?auto_84329 ?auto_84333 ) ) ( not ( = ?auto_84330 ?auto_84331 ) ) ( not ( = ?auto_84330 ?auto_84332 ) ) ( not ( = ?auto_84330 ?auto_84333 ) ) ( not ( = ?auto_84331 ?auto_84332 ) ) ( not ( = ?auto_84331 ?auto_84333 ) ) ( not ( = ?auto_84332 ?auto_84333 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_84333 ?auto_84332 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84334 - BLOCK
      ?auto_84335 - BLOCK
      ?auto_84336 - BLOCK
      ?auto_84337 - BLOCK
      ?auto_84338 - BLOCK
      ?auto_84339 - BLOCK
    )
    :vars
    (
      ?auto_84340 - BLOCK
      ?auto_84341 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84340 ?auto_84339 ) ( CLEAR ?auto_84340 ) ( ON-TABLE ?auto_84334 ) ( ON ?auto_84335 ?auto_84334 ) ( ON ?auto_84336 ?auto_84335 ) ( ON ?auto_84337 ?auto_84336 ) ( ON ?auto_84338 ?auto_84337 ) ( ON ?auto_84339 ?auto_84338 ) ( not ( = ?auto_84334 ?auto_84335 ) ) ( not ( = ?auto_84334 ?auto_84336 ) ) ( not ( = ?auto_84334 ?auto_84337 ) ) ( not ( = ?auto_84334 ?auto_84338 ) ) ( not ( = ?auto_84334 ?auto_84339 ) ) ( not ( = ?auto_84334 ?auto_84340 ) ) ( not ( = ?auto_84335 ?auto_84336 ) ) ( not ( = ?auto_84335 ?auto_84337 ) ) ( not ( = ?auto_84335 ?auto_84338 ) ) ( not ( = ?auto_84335 ?auto_84339 ) ) ( not ( = ?auto_84335 ?auto_84340 ) ) ( not ( = ?auto_84336 ?auto_84337 ) ) ( not ( = ?auto_84336 ?auto_84338 ) ) ( not ( = ?auto_84336 ?auto_84339 ) ) ( not ( = ?auto_84336 ?auto_84340 ) ) ( not ( = ?auto_84337 ?auto_84338 ) ) ( not ( = ?auto_84337 ?auto_84339 ) ) ( not ( = ?auto_84337 ?auto_84340 ) ) ( not ( = ?auto_84338 ?auto_84339 ) ) ( not ( = ?auto_84338 ?auto_84340 ) ) ( not ( = ?auto_84339 ?auto_84340 ) ) ( HOLDING ?auto_84341 ) ( not ( = ?auto_84334 ?auto_84341 ) ) ( not ( = ?auto_84335 ?auto_84341 ) ) ( not ( = ?auto_84336 ?auto_84341 ) ) ( not ( = ?auto_84337 ?auto_84341 ) ) ( not ( = ?auto_84338 ?auto_84341 ) ) ( not ( = ?auto_84339 ?auto_84341 ) ) ( not ( = ?auto_84340 ?auto_84341 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_84341 )
      ( MAKE-6PILE ?auto_84334 ?auto_84335 ?auto_84336 ?auto_84337 ?auto_84338 ?auto_84339 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84342 - BLOCK
      ?auto_84343 - BLOCK
      ?auto_84344 - BLOCK
      ?auto_84345 - BLOCK
      ?auto_84346 - BLOCK
      ?auto_84347 - BLOCK
    )
    :vars
    (
      ?auto_84349 - BLOCK
      ?auto_84348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84349 ?auto_84347 ) ( ON-TABLE ?auto_84342 ) ( ON ?auto_84343 ?auto_84342 ) ( ON ?auto_84344 ?auto_84343 ) ( ON ?auto_84345 ?auto_84344 ) ( ON ?auto_84346 ?auto_84345 ) ( ON ?auto_84347 ?auto_84346 ) ( not ( = ?auto_84342 ?auto_84343 ) ) ( not ( = ?auto_84342 ?auto_84344 ) ) ( not ( = ?auto_84342 ?auto_84345 ) ) ( not ( = ?auto_84342 ?auto_84346 ) ) ( not ( = ?auto_84342 ?auto_84347 ) ) ( not ( = ?auto_84342 ?auto_84349 ) ) ( not ( = ?auto_84343 ?auto_84344 ) ) ( not ( = ?auto_84343 ?auto_84345 ) ) ( not ( = ?auto_84343 ?auto_84346 ) ) ( not ( = ?auto_84343 ?auto_84347 ) ) ( not ( = ?auto_84343 ?auto_84349 ) ) ( not ( = ?auto_84344 ?auto_84345 ) ) ( not ( = ?auto_84344 ?auto_84346 ) ) ( not ( = ?auto_84344 ?auto_84347 ) ) ( not ( = ?auto_84344 ?auto_84349 ) ) ( not ( = ?auto_84345 ?auto_84346 ) ) ( not ( = ?auto_84345 ?auto_84347 ) ) ( not ( = ?auto_84345 ?auto_84349 ) ) ( not ( = ?auto_84346 ?auto_84347 ) ) ( not ( = ?auto_84346 ?auto_84349 ) ) ( not ( = ?auto_84347 ?auto_84349 ) ) ( not ( = ?auto_84342 ?auto_84348 ) ) ( not ( = ?auto_84343 ?auto_84348 ) ) ( not ( = ?auto_84344 ?auto_84348 ) ) ( not ( = ?auto_84345 ?auto_84348 ) ) ( not ( = ?auto_84346 ?auto_84348 ) ) ( not ( = ?auto_84347 ?auto_84348 ) ) ( not ( = ?auto_84349 ?auto_84348 ) ) ( ON ?auto_84348 ?auto_84349 ) ( CLEAR ?auto_84348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_84342 ?auto_84343 ?auto_84344 ?auto_84345 ?auto_84346 ?auto_84347 ?auto_84349 )
      ( MAKE-6PILE ?auto_84342 ?auto_84343 ?auto_84344 ?auto_84345 ?auto_84346 ?auto_84347 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_84352 - BLOCK
      ?auto_84353 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_84353 ) ( CLEAR ?auto_84352 ) ( ON-TABLE ?auto_84352 ) ( not ( = ?auto_84352 ?auto_84353 ) ) )
    :subtasks
    ( ( !STACK ?auto_84353 ?auto_84352 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_84354 - BLOCK
      ?auto_84355 - BLOCK
    )
    :vars
    (
      ?auto_84356 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_84354 ) ( ON-TABLE ?auto_84354 ) ( not ( = ?auto_84354 ?auto_84355 ) ) ( ON ?auto_84355 ?auto_84356 ) ( CLEAR ?auto_84355 ) ( HAND-EMPTY ) ( not ( = ?auto_84354 ?auto_84356 ) ) ( not ( = ?auto_84355 ?auto_84356 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_84355 ?auto_84356 )
      ( MAKE-2PILE ?auto_84354 ?auto_84355 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_84357 - BLOCK
      ?auto_84358 - BLOCK
    )
    :vars
    (
      ?auto_84359 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84357 ?auto_84358 ) ) ( ON ?auto_84358 ?auto_84359 ) ( CLEAR ?auto_84358 ) ( not ( = ?auto_84357 ?auto_84359 ) ) ( not ( = ?auto_84358 ?auto_84359 ) ) ( HOLDING ?auto_84357 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_84357 )
      ( MAKE-2PILE ?auto_84357 ?auto_84358 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_84360 - BLOCK
      ?auto_84361 - BLOCK
    )
    :vars
    (
      ?auto_84362 - BLOCK
      ?auto_84365 - BLOCK
      ?auto_84367 - BLOCK
      ?auto_84366 - BLOCK
      ?auto_84364 - BLOCK
      ?auto_84363 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84360 ?auto_84361 ) ) ( ON ?auto_84361 ?auto_84362 ) ( not ( = ?auto_84360 ?auto_84362 ) ) ( not ( = ?auto_84361 ?auto_84362 ) ) ( ON ?auto_84360 ?auto_84361 ) ( CLEAR ?auto_84360 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_84365 ) ( ON ?auto_84367 ?auto_84365 ) ( ON ?auto_84366 ?auto_84367 ) ( ON ?auto_84364 ?auto_84366 ) ( ON ?auto_84363 ?auto_84364 ) ( ON ?auto_84362 ?auto_84363 ) ( not ( = ?auto_84365 ?auto_84367 ) ) ( not ( = ?auto_84365 ?auto_84366 ) ) ( not ( = ?auto_84365 ?auto_84364 ) ) ( not ( = ?auto_84365 ?auto_84363 ) ) ( not ( = ?auto_84365 ?auto_84362 ) ) ( not ( = ?auto_84365 ?auto_84361 ) ) ( not ( = ?auto_84365 ?auto_84360 ) ) ( not ( = ?auto_84367 ?auto_84366 ) ) ( not ( = ?auto_84367 ?auto_84364 ) ) ( not ( = ?auto_84367 ?auto_84363 ) ) ( not ( = ?auto_84367 ?auto_84362 ) ) ( not ( = ?auto_84367 ?auto_84361 ) ) ( not ( = ?auto_84367 ?auto_84360 ) ) ( not ( = ?auto_84366 ?auto_84364 ) ) ( not ( = ?auto_84366 ?auto_84363 ) ) ( not ( = ?auto_84366 ?auto_84362 ) ) ( not ( = ?auto_84366 ?auto_84361 ) ) ( not ( = ?auto_84366 ?auto_84360 ) ) ( not ( = ?auto_84364 ?auto_84363 ) ) ( not ( = ?auto_84364 ?auto_84362 ) ) ( not ( = ?auto_84364 ?auto_84361 ) ) ( not ( = ?auto_84364 ?auto_84360 ) ) ( not ( = ?auto_84363 ?auto_84362 ) ) ( not ( = ?auto_84363 ?auto_84361 ) ) ( not ( = ?auto_84363 ?auto_84360 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_84365 ?auto_84367 ?auto_84366 ?auto_84364 ?auto_84363 ?auto_84362 ?auto_84361 )
      ( MAKE-2PILE ?auto_84360 ?auto_84361 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_84373 - BLOCK
      ?auto_84374 - BLOCK
      ?auto_84375 - BLOCK
      ?auto_84376 - BLOCK
      ?auto_84377 - BLOCK
    )
    :vars
    (
      ?auto_84378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84378 ?auto_84377 ) ( CLEAR ?auto_84378 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_84373 ) ( ON ?auto_84374 ?auto_84373 ) ( ON ?auto_84375 ?auto_84374 ) ( ON ?auto_84376 ?auto_84375 ) ( ON ?auto_84377 ?auto_84376 ) ( not ( = ?auto_84373 ?auto_84374 ) ) ( not ( = ?auto_84373 ?auto_84375 ) ) ( not ( = ?auto_84373 ?auto_84376 ) ) ( not ( = ?auto_84373 ?auto_84377 ) ) ( not ( = ?auto_84373 ?auto_84378 ) ) ( not ( = ?auto_84374 ?auto_84375 ) ) ( not ( = ?auto_84374 ?auto_84376 ) ) ( not ( = ?auto_84374 ?auto_84377 ) ) ( not ( = ?auto_84374 ?auto_84378 ) ) ( not ( = ?auto_84375 ?auto_84376 ) ) ( not ( = ?auto_84375 ?auto_84377 ) ) ( not ( = ?auto_84375 ?auto_84378 ) ) ( not ( = ?auto_84376 ?auto_84377 ) ) ( not ( = ?auto_84376 ?auto_84378 ) ) ( not ( = ?auto_84377 ?auto_84378 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_84378 ?auto_84377 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_84379 - BLOCK
      ?auto_84380 - BLOCK
      ?auto_84381 - BLOCK
      ?auto_84382 - BLOCK
      ?auto_84383 - BLOCK
    )
    :vars
    (
      ?auto_84384 - BLOCK
      ?auto_84385 - BLOCK
      ?auto_84386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84384 ?auto_84383 ) ( CLEAR ?auto_84384 ) ( ON-TABLE ?auto_84379 ) ( ON ?auto_84380 ?auto_84379 ) ( ON ?auto_84381 ?auto_84380 ) ( ON ?auto_84382 ?auto_84381 ) ( ON ?auto_84383 ?auto_84382 ) ( not ( = ?auto_84379 ?auto_84380 ) ) ( not ( = ?auto_84379 ?auto_84381 ) ) ( not ( = ?auto_84379 ?auto_84382 ) ) ( not ( = ?auto_84379 ?auto_84383 ) ) ( not ( = ?auto_84379 ?auto_84384 ) ) ( not ( = ?auto_84380 ?auto_84381 ) ) ( not ( = ?auto_84380 ?auto_84382 ) ) ( not ( = ?auto_84380 ?auto_84383 ) ) ( not ( = ?auto_84380 ?auto_84384 ) ) ( not ( = ?auto_84381 ?auto_84382 ) ) ( not ( = ?auto_84381 ?auto_84383 ) ) ( not ( = ?auto_84381 ?auto_84384 ) ) ( not ( = ?auto_84382 ?auto_84383 ) ) ( not ( = ?auto_84382 ?auto_84384 ) ) ( not ( = ?auto_84383 ?auto_84384 ) ) ( HOLDING ?auto_84385 ) ( CLEAR ?auto_84386 ) ( not ( = ?auto_84379 ?auto_84385 ) ) ( not ( = ?auto_84379 ?auto_84386 ) ) ( not ( = ?auto_84380 ?auto_84385 ) ) ( not ( = ?auto_84380 ?auto_84386 ) ) ( not ( = ?auto_84381 ?auto_84385 ) ) ( not ( = ?auto_84381 ?auto_84386 ) ) ( not ( = ?auto_84382 ?auto_84385 ) ) ( not ( = ?auto_84382 ?auto_84386 ) ) ( not ( = ?auto_84383 ?auto_84385 ) ) ( not ( = ?auto_84383 ?auto_84386 ) ) ( not ( = ?auto_84384 ?auto_84385 ) ) ( not ( = ?auto_84384 ?auto_84386 ) ) ( not ( = ?auto_84385 ?auto_84386 ) ) )
    :subtasks
    ( ( !STACK ?auto_84385 ?auto_84386 )
      ( MAKE-5PILE ?auto_84379 ?auto_84380 ?auto_84381 ?auto_84382 ?auto_84383 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_84387 - BLOCK
      ?auto_84388 - BLOCK
      ?auto_84389 - BLOCK
      ?auto_84390 - BLOCK
      ?auto_84391 - BLOCK
    )
    :vars
    (
      ?auto_84392 - BLOCK
      ?auto_84393 - BLOCK
      ?auto_84394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84392 ?auto_84391 ) ( ON-TABLE ?auto_84387 ) ( ON ?auto_84388 ?auto_84387 ) ( ON ?auto_84389 ?auto_84388 ) ( ON ?auto_84390 ?auto_84389 ) ( ON ?auto_84391 ?auto_84390 ) ( not ( = ?auto_84387 ?auto_84388 ) ) ( not ( = ?auto_84387 ?auto_84389 ) ) ( not ( = ?auto_84387 ?auto_84390 ) ) ( not ( = ?auto_84387 ?auto_84391 ) ) ( not ( = ?auto_84387 ?auto_84392 ) ) ( not ( = ?auto_84388 ?auto_84389 ) ) ( not ( = ?auto_84388 ?auto_84390 ) ) ( not ( = ?auto_84388 ?auto_84391 ) ) ( not ( = ?auto_84388 ?auto_84392 ) ) ( not ( = ?auto_84389 ?auto_84390 ) ) ( not ( = ?auto_84389 ?auto_84391 ) ) ( not ( = ?auto_84389 ?auto_84392 ) ) ( not ( = ?auto_84390 ?auto_84391 ) ) ( not ( = ?auto_84390 ?auto_84392 ) ) ( not ( = ?auto_84391 ?auto_84392 ) ) ( CLEAR ?auto_84393 ) ( not ( = ?auto_84387 ?auto_84394 ) ) ( not ( = ?auto_84387 ?auto_84393 ) ) ( not ( = ?auto_84388 ?auto_84394 ) ) ( not ( = ?auto_84388 ?auto_84393 ) ) ( not ( = ?auto_84389 ?auto_84394 ) ) ( not ( = ?auto_84389 ?auto_84393 ) ) ( not ( = ?auto_84390 ?auto_84394 ) ) ( not ( = ?auto_84390 ?auto_84393 ) ) ( not ( = ?auto_84391 ?auto_84394 ) ) ( not ( = ?auto_84391 ?auto_84393 ) ) ( not ( = ?auto_84392 ?auto_84394 ) ) ( not ( = ?auto_84392 ?auto_84393 ) ) ( not ( = ?auto_84394 ?auto_84393 ) ) ( ON ?auto_84394 ?auto_84392 ) ( CLEAR ?auto_84394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_84387 ?auto_84388 ?auto_84389 ?auto_84390 ?auto_84391 ?auto_84392 )
      ( MAKE-5PILE ?auto_84387 ?auto_84388 ?auto_84389 ?auto_84390 ?auto_84391 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_84395 - BLOCK
      ?auto_84396 - BLOCK
      ?auto_84397 - BLOCK
      ?auto_84398 - BLOCK
      ?auto_84399 - BLOCK
    )
    :vars
    (
      ?auto_84400 - BLOCK
      ?auto_84402 - BLOCK
      ?auto_84401 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84400 ?auto_84399 ) ( ON-TABLE ?auto_84395 ) ( ON ?auto_84396 ?auto_84395 ) ( ON ?auto_84397 ?auto_84396 ) ( ON ?auto_84398 ?auto_84397 ) ( ON ?auto_84399 ?auto_84398 ) ( not ( = ?auto_84395 ?auto_84396 ) ) ( not ( = ?auto_84395 ?auto_84397 ) ) ( not ( = ?auto_84395 ?auto_84398 ) ) ( not ( = ?auto_84395 ?auto_84399 ) ) ( not ( = ?auto_84395 ?auto_84400 ) ) ( not ( = ?auto_84396 ?auto_84397 ) ) ( not ( = ?auto_84396 ?auto_84398 ) ) ( not ( = ?auto_84396 ?auto_84399 ) ) ( not ( = ?auto_84396 ?auto_84400 ) ) ( not ( = ?auto_84397 ?auto_84398 ) ) ( not ( = ?auto_84397 ?auto_84399 ) ) ( not ( = ?auto_84397 ?auto_84400 ) ) ( not ( = ?auto_84398 ?auto_84399 ) ) ( not ( = ?auto_84398 ?auto_84400 ) ) ( not ( = ?auto_84399 ?auto_84400 ) ) ( not ( = ?auto_84395 ?auto_84402 ) ) ( not ( = ?auto_84395 ?auto_84401 ) ) ( not ( = ?auto_84396 ?auto_84402 ) ) ( not ( = ?auto_84396 ?auto_84401 ) ) ( not ( = ?auto_84397 ?auto_84402 ) ) ( not ( = ?auto_84397 ?auto_84401 ) ) ( not ( = ?auto_84398 ?auto_84402 ) ) ( not ( = ?auto_84398 ?auto_84401 ) ) ( not ( = ?auto_84399 ?auto_84402 ) ) ( not ( = ?auto_84399 ?auto_84401 ) ) ( not ( = ?auto_84400 ?auto_84402 ) ) ( not ( = ?auto_84400 ?auto_84401 ) ) ( not ( = ?auto_84402 ?auto_84401 ) ) ( ON ?auto_84402 ?auto_84400 ) ( CLEAR ?auto_84402 ) ( HOLDING ?auto_84401 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_84401 )
      ( MAKE-5PILE ?auto_84395 ?auto_84396 ?auto_84397 ?auto_84398 ?auto_84399 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_84403 - BLOCK
      ?auto_84404 - BLOCK
      ?auto_84405 - BLOCK
      ?auto_84406 - BLOCK
      ?auto_84407 - BLOCK
    )
    :vars
    (
      ?auto_84409 - BLOCK
      ?auto_84410 - BLOCK
      ?auto_84408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84409 ?auto_84407 ) ( ON-TABLE ?auto_84403 ) ( ON ?auto_84404 ?auto_84403 ) ( ON ?auto_84405 ?auto_84404 ) ( ON ?auto_84406 ?auto_84405 ) ( ON ?auto_84407 ?auto_84406 ) ( not ( = ?auto_84403 ?auto_84404 ) ) ( not ( = ?auto_84403 ?auto_84405 ) ) ( not ( = ?auto_84403 ?auto_84406 ) ) ( not ( = ?auto_84403 ?auto_84407 ) ) ( not ( = ?auto_84403 ?auto_84409 ) ) ( not ( = ?auto_84404 ?auto_84405 ) ) ( not ( = ?auto_84404 ?auto_84406 ) ) ( not ( = ?auto_84404 ?auto_84407 ) ) ( not ( = ?auto_84404 ?auto_84409 ) ) ( not ( = ?auto_84405 ?auto_84406 ) ) ( not ( = ?auto_84405 ?auto_84407 ) ) ( not ( = ?auto_84405 ?auto_84409 ) ) ( not ( = ?auto_84406 ?auto_84407 ) ) ( not ( = ?auto_84406 ?auto_84409 ) ) ( not ( = ?auto_84407 ?auto_84409 ) ) ( not ( = ?auto_84403 ?auto_84410 ) ) ( not ( = ?auto_84403 ?auto_84408 ) ) ( not ( = ?auto_84404 ?auto_84410 ) ) ( not ( = ?auto_84404 ?auto_84408 ) ) ( not ( = ?auto_84405 ?auto_84410 ) ) ( not ( = ?auto_84405 ?auto_84408 ) ) ( not ( = ?auto_84406 ?auto_84410 ) ) ( not ( = ?auto_84406 ?auto_84408 ) ) ( not ( = ?auto_84407 ?auto_84410 ) ) ( not ( = ?auto_84407 ?auto_84408 ) ) ( not ( = ?auto_84409 ?auto_84410 ) ) ( not ( = ?auto_84409 ?auto_84408 ) ) ( not ( = ?auto_84410 ?auto_84408 ) ) ( ON ?auto_84410 ?auto_84409 ) ( ON ?auto_84408 ?auto_84410 ) ( CLEAR ?auto_84408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_84403 ?auto_84404 ?auto_84405 ?auto_84406 ?auto_84407 ?auto_84409 ?auto_84410 )
      ( MAKE-5PILE ?auto_84403 ?auto_84404 ?auto_84405 ?auto_84406 ?auto_84407 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_84414 - BLOCK
      ?auto_84415 - BLOCK
      ?auto_84416 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_84416 ) ( CLEAR ?auto_84415 ) ( ON-TABLE ?auto_84414 ) ( ON ?auto_84415 ?auto_84414 ) ( not ( = ?auto_84414 ?auto_84415 ) ) ( not ( = ?auto_84414 ?auto_84416 ) ) ( not ( = ?auto_84415 ?auto_84416 ) ) )
    :subtasks
    ( ( !STACK ?auto_84416 ?auto_84415 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_84417 - BLOCK
      ?auto_84418 - BLOCK
      ?auto_84419 - BLOCK
    )
    :vars
    (
      ?auto_84420 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_84418 ) ( ON-TABLE ?auto_84417 ) ( ON ?auto_84418 ?auto_84417 ) ( not ( = ?auto_84417 ?auto_84418 ) ) ( not ( = ?auto_84417 ?auto_84419 ) ) ( not ( = ?auto_84418 ?auto_84419 ) ) ( ON ?auto_84419 ?auto_84420 ) ( CLEAR ?auto_84419 ) ( HAND-EMPTY ) ( not ( = ?auto_84417 ?auto_84420 ) ) ( not ( = ?auto_84418 ?auto_84420 ) ) ( not ( = ?auto_84419 ?auto_84420 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_84419 ?auto_84420 )
      ( MAKE-3PILE ?auto_84417 ?auto_84418 ?auto_84419 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_84421 - BLOCK
      ?auto_84422 - BLOCK
      ?auto_84423 - BLOCK
    )
    :vars
    (
      ?auto_84424 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84421 ) ( not ( = ?auto_84421 ?auto_84422 ) ) ( not ( = ?auto_84421 ?auto_84423 ) ) ( not ( = ?auto_84422 ?auto_84423 ) ) ( ON ?auto_84423 ?auto_84424 ) ( CLEAR ?auto_84423 ) ( not ( = ?auto_84421 ?auto_84424 ) ) ( not ( = ?auto_84422 ?auto_84424 ) ) ( not ( = ?auto_84423 ?auto_84424 ) ) ( HOLDING ?auto_84422 ) ( CLEAR ?auto_84421 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_84421 ?auto_84422 )
      ( MAKE-3PILE ?auto_84421 ?auto_84422 ?auto_84423 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_84425 - BLOCK
      ?auto_84426 - BLOCK
      ?auto_84427 - BLOCK
    )
    :vars
    (
      ?auto_84428 - BLOCK
      ?auto_84431 - BLOCK
      ?auto_84430 - BLOCK
      ?auto_84432 - BLOCK
      ?auto_84429 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84425 ) ( not ( = ?auto_84425 ?auto_84426 ) ) ( not ( = ?auto_84425 ?auto_84427 ) ) ( not ( = ?auto_84426 ?auto_84427 ) ) ( ON ?auto_84427 ?auto_84428 ) ( not ( = ?auto_84425 ?auto_84428 ) ) ( not ( = ?auto_84426 ?auto_84428 ) ) ( not ( = ?auto_84427 ?auto_84428 ) ) ( CLEAR ?auto_84425 ) ( ON ?auto_84426 ?auto_84427 ) ( CLEAR ?auto_84426 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_84431 ) ( ON ?auto_84430 ?auto_84431 ) ( ON ?auto_84432 ?auto_84430 ) ( ON ?auto_84429 ?auto_84432 ) ( ON ?auto_84428 ?auto_84429 ) ( not ( = ?auto_84431 ?auto_84430 ) ) ( not ( = ?auto_84431 ?auto_84432 ) ) ( not ( = ?auto_84431 ?auto_84429 ) ) ( not ( = ?auto_84431 ?auto_84428 ) ) ( not ( = ?auto_84431 ?auto_84427 ) ) ( not ( = ?auto_84431 ?auto_84426 ) ) ( not ( = ?auto_84430 ?auto_84432 ) ) ( not ( = ?auto_84430 ?auto_84429 ) ) ( not ( = ?auto_84430 ?auto_84428 ) ) ( not ( = ?auto_84430 ?auto_84427 ) ) ( not ( = ?auto_84430 ?auto_84426 ) ) ( not ( = ?auto_84432 ?auto_84429 ) ) ( not ( = ?auto_84432 ?auto_84428 ) ) ( not ( = ?auto_84432 ?auto_84427 ) ) ( not ( = ?auto_84432 ?auto_84426 ) ) ( not ( = ?auto_84429 ?auto_84428 ) ) ( not ( = ?auto_84429 ?auto_84427 ) ) ( not ( = ?auto_84429 ?auto_84426 ) ) ( not ( = ?auto_84425 ?auto_84431 ) ) ( not ( = ?auto_84425 ?auto_84430 ) ) ( not ( = ?auto_84425 ?auto_84432 ) ) ( not ( = ?auto_84425 ?auto_84429 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_84431 ?auto_84430 ?auto_84432 ?auto_84429 ?auto_84428 ?auto_84427 )
      ( MAKE-3PILE ?auto_84425 ?auto_84426 ?auto_84427 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_84433 - BLOCK
      ?auto_84434 - BLOCK
      ?auto_84435 - BLOCK
    )
    :vars
    (
      ?auto_84439 - BLOCK
      ?auto_84438 - BLOCK
      ?auto_84437 - BLOCK
      ?auto_84436 - BLOCK
      ?auto_84440 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84433 ?auto_84434 ) ) ( not ( = ?auto_84433 ?auto_84435 ) ) ( not ( = ?auto_84434 ?auto_84435 ) ) ( ON ?auto_84435 ?auto_84439 ) ( not ( = ?auto_84433 ?auto_84439 ) ) ( not ( = ?auto_84434 ?auto_84439 ) ) ( not ( = ?auto_84435 ?auto_84439 ) ) ( ON ?auto_84434 ?auto_84435 ) ( CLEAR ?auto_84434 ) ( ON-TABLE ?auto_84438 ) ( ON ?auto_84437 ?auto_84438 ) ( ON ?auto_84436 ?auto_84437 ) ( ON ?auto_84440 ?auto_84436 ) ( ON ?auto_84439 ?auto_84440 ) ( not ( = ?auto_84438 ?auto_84437 ) ) ( not ( = ?auto_84438 ?auto_84436 ) ) ( not ( = ?auto_84438 ?auto_84440 ) ) ( not ( = ?auto_84438 ?auto_84439 ) ) ( not ( = ?auto_84438 ?auto_84435 ) ) ( not ( = ?auto_84438 ?auto_84434 ) ) ( not ( = ?auto_84437 ?auto_84436 ) ) ( not ( = ?auto_84437 ?auto_84440 ) ) ( not ( = ?auto_84437 ?auto_84439 ) ) ( not ( = ?auto_84437 ?auto_84435 ) ) ( not ( = ?auto_84437 ?auto_84434 ) ) ( not ( = ?auto_84436 ?auto_84440 ) ) ( not ( = ?auto_84436 ?auto_84439 ) ) ( not ( = ?auto_84436 ?auto_84435 ) ) ( not ( = ?auto_84436 ?auto_84434 ) ) ( not ( = ?auto_84440 ?auto_84439 ) ) ( not ( = ?auto_84440 ?auto_84435 ) ) ( not ( = ?auto_84440 ?auto_84434 ) ) ( not ( = ?auto_84433 ?auto_84438 ) ) ( not ( = ?auto_84433 ?auto_84437 ) ) ( not ( = ?auto_84433 ?auto_84436 ) ) ( not ( = ?auto_84433 ?auto_84440 ) ) ( HOLDING ?auto_84433 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_84433 )
      ( MAKE-3PILE ?auto_84433 ?auto_84434 ?auto_84435 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_84441 - BLOCK
      ?auto_84442 - BLOCK
      ?auto_84443 - BLOCK
    )
    :vars
    (
      ?auto_84447 - BLOCK
      ?auto_84446 - BLOCK
      ?auto_84448 - BLOCK
      ?auto_84445 - BLOCK
      ?auto_84444 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84441 ?auto_84442 ) ) ( not ( = ?auto_84441 ?auto_84443 ) ) ( not ( = ?auto_84442 ?auto_84443 ) ) ( ON ?auto_84443 ?auto_84447 ) ( not ( = ?auto_84441 ?auto_84447 ) ) ( not ( = ?auto_84442 ?auto_84447 ) ) ( not ( = ?auto_84443 ?auto_84447 ) ) ( ON ?auto_84442 ?auto_84443 ) ( ON-TABLE ?auto_84446 ) ( ON ?auto_84448 ?auto_84446 ) ( ON ?auto_84445 ?auto_84448 ) ( ON ?auto_84444 ?auto_84445 ) ( ON ?auto_84447 ?auto_84444 ) ( not ( = ?auto_84446 ?auto_84448 ) ) ( not ( = ?auto_84446 ?auto_84445 ) ) ( not ( = ?auto_84446 ?auto_84444 ) ) ( not ( = ?auto_84446 ?auto_84447 ) ) ( not ( = ?auto_84446 ?auto_84443 ) ) ( not ( = ?auto_84446 ?auto_84442 ) ) ( not ( = ?auto_84448 ?auto_84445 ) ) ( not ( = ?auto_84448 ?auto_84444 ) ) ( not ( = ?auto_84448 ?auto_84447 ) ) ( not ( = ?auto_84448 ?auto_84443 ) ) ( not ( = ?auto_84448 ?auto_84442 ) ) ( not ( = ?auto_84445 ?auto_84444 ) ) ( not ( = ?auto_84445 ?auto_84447 ) ) ( not ( = ?auto_84445 ?auto_84443 ) ) ( not ( = ?auto_84445 ?auto_84442 ) ) ( not ( = ?auto_84444 ?auto_84447 ) ) ( not ( = ?auto_84444 ?auto_84443 ) ) ( not ( = ?auto_84444 ?auto_84442 ) ) ( not ( = ?auto_84441 ?auto_84446 ) ) ( not ( = ?auto_84441 ?auto_84448 ) ) ( not ( = ?auto_84441 ?auto_84445 ) ) ( not ( = ?auto_84441 ?auto_84444 ) ) ( ON ?auto_84441 ?auto_84442 ) ( CLEAR ?auto_84441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_84446 ?auto_84448 ?auto_84445 ?auto_84444 ?auto_84447 ?auto_84443 ?auto_84442 )
      ( MAKE-3PILE ?auto_84441 ?auto_84442 ?auto_84443 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_84453 - BLOCK
      ?auto_84454 - BLOCK
      ?auto_84455 - BLOCK
      ?auto_84456 - BLOCK
    )
    :vars
    (
      ?auto_84457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84457 ?auto_84456 ) ( CLEAR ?auto_84457 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_84453 ) ( ON ?auto_84454 ?auto_84453 ) ( ON ?auto_84455 ?auto_84454 ) ( ON ?auto_84456 ?auto_84455 ) ( not ( = ?auto_84453 ?auto_84454 ) ) ( not ( = ?auto_84453 ?auto_84455 ) ) ( not ( = ?auto_84453 ?auto_84456 ) ) ( not ( = ?auto_84453 ?auto_84457 ) ) ( not ( = ?auto_84454 ?auto_84455 ) ) ( not ( = ?auto_84454 ?auto_84456 ) ) ( not ( = ?auto_84454 ?auto_84457 ) ) ( not ( = ?auto_84455 ?auto_84456 ) ) ( not ( = ?auto_84455 ?auto_84457 ) ) ( not ( = ?auto_84456 ?auto_84457 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_84457 ?auto_84456 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_84458 - BLOCK
      ?auto_84459 - BLOCK
      ?auto_84460 - BLOCK
      ?auto_84461 - BLOCK
    )
    :vars
    (
      ?auto_84462 - BLOCK
      ?auto_84463 - BLOCK
      ?auto_84464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84462 ?auto_84461 ) ( CLEAR ?auto_84462 ) ( ON-TABLE ?auto_84458 ) ( ON ?auto_84459 ?auto_84458 ) ( ON ?auto_84460 ?auto_84459 ) ( ON ?auto_84461 ?auto_84460 ) ( not ( = ?auto_84458 ?auto_84459 ) ) ( not ( = ?auto_84458 ?auto_84460 ) ) ( not ( = ?auto_84458 ?auto_84461 ) ) ( not ( = ?auto_84458 ?auto_84462 ) ) ( not ( = ?auto_84459 ?auto_84460 ) ) ( not ( = ?auto_84459 ?auto_84461 ) ) ( not ( = ?auto_84459 ?auto_84462 ) ) ( not ( = ?auto_84460 ?auto_84461 ) ) ( not ( = ?auto_84460 ?auto_84462 ) ) ( not ( = ?auto_84461 ?auto_84462 ) ) ( HOLDING ?auto_84463 ) ( CLEAR ?auto_84464 ) ( not ( = ?auto_84458 ?auto_84463 ) ) ( not ( = ?auto_84458 ?auto_84464 ) ) ( not ( = ?auto_84459 ?auto_84463 ) ) ( not ( = ?auto_84459 ?auto_84464 ) ) ( not ( = ?auto_84460 ?auto_84463 ) ) ( not ( = ?auto_84460 ?auto_84464 ) ) ( not ( = ?auto_84461 ?auto_84463 ) ) ( not ( = ?auto_84461 ?auto_84464 ) ) ( not ( = ?auto_84462 ?auto_84463 ) ) ( not ( = ?auto_84462 ?auto_84464 ) ) ( not ( = ?auto_84463 ?auto_84464 ) ) )
    :subtasks
    ( ( !STACK ?auto_84463 ?auto_84464 )
      ( MAKE-4PILE ?auto_84458 ?auto_84459 ?auto_84460 ?auto_84461 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_84465 - BLOCK
      ?auto_84466 - BLOCK
      ?auto_84467 - BLOCK
      ?auto_84468 - BLOCK
    )
    :vars
    (
      ?auto_84470 - BLOCK
      ?auto_84469 - BLOCK
      ?auto_84471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84470 ?auto_84468 ) ( ON-TABLE ?auto_84465 ) ( ON ?auto_84466 ?auto_84465 ) ( ON ?auto_84467 ?auto_84466 ) ( ON ?auto_84468 ?auto_84467 ) ( not ( = ?auto_84465 ?auto_84466 ) ) ( not ( = ?auto_84465 ?auto_84467 ) ) ( not ( = ?auto_84465 ?auto_84468 ) ) ( not ( = ?auto_84465 ?auto_84470 ) ) ( not ( = ?auto_84466 ?auto_84467 ) ) ( not ( = ?auto_84466 ?auto_84468 ) ) ( not ( = ?auto_84466 ?auto_84470 ) ) ( not ( = ?auto_84467 ?auto_84468 ) ) ( not ( = ?auto_84467 ?auto_84470 ) ) ( not ( = ?auto_84468 ?auto_84470 ) ) ( CLEAR ?auto_84469 ) ( not ( = ?auto_84465 ?auto_84471 ) ) ( not ( = ?auto_84465 ?auto_84469 ) ) ( not ( = ?auto_84466 ?auto_84471 ) ) ( not ( = ?auto_84466 ?auto_84469 ) ) ( not ( = ?auto_84467 ?auto_84471 ) ) ( not ( = ?auto_84467 ?auto_84469 ) ) ( not ( = ?auto_84468 ?auto_84471 ) ) ( not ( = ?auto_84468 ?auto_84469 ) ) ( not ( = ?auto_84470 ?auto_84471 ) ) ( not ( = ?auto_84470 ?auto_84469 ) ) ( not ( = ?auto_84471 ?auto_84469 ) ) ( ON ?auto_84471 ?auto_84470 ) ( CLEAR ?auto_84471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_84465 ?auto_84466 ?auto_84467 ?auto_84468 ?auto_84470 )
      ( MAKE-4PILE ?auto_84465 ?auto_84466 ?auto_84467 ?auto_84468 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_84472 - BLOCK
      ?auto_84473 - BLOCK
      ?auto_84474 - BLOCK
      ?auto_84475 - BLOCK
    )
    :vars
    (
      ?auto_84476 - BLOCK
      ?auto_84477 - BLOCK
      ?auto_84478 - BLOCK
      ?auto_84479 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84476 ?auto_84475 ) ( ON-TABLE ?auto_84472 ) ( ON ?auto_84473 ?auto_84472 ) ( ON ?auto_84474 ?auto_84473 ) ( ON ?auto_84475 ?auto_84474 ) ( not ( = ?auto_84472 ?auto_84473 ) ) ( not ( = ?auto_84472 ?auto_84474 ) ) ( not ( = ?auto_84472 ?auto_84475 ) ) ( not ( = ?auto_84472 ?auto_84476 ) ) ( not ( = ?auto_84473 ?auto_84474 ) ) ( not ( = ?auto_84473 ?auto_84475 ) ) ( not ( = ?auto_84473 ?auto_84476 ) ) ( not ( = ?auto_84474 ?auto_84475 ) ) ( not ( = ?auto_84474 ?auto_84476 ) ) ( not ( = ?auto_84475 ?auto_84476 ) ) ( not ( = ?auto_84472 ?auto_84477 ) ) ( not ( = ?auto_84472 ?auto_84478 ) ) ( not ( = ?auto_84473 ?auto_84477 ) ) ( not ( = ?auto_84473 ?auto_84478 ) ) ( not ( = ?auto_84474 ?auto_84477 ) ) ( not ( = ?auto_84474 ?auto_84478 ) ) ( not ( = ?auto_84475 ?auto_84477 ) ) ( not ( = ?auto_84475 ?auto_84478 ) ) ( not ( = ?auto_84476 ?auto_84477 ) ) ( not ( = ?auto_84476 ?auto_84478 ) ) ( not ( = ?auto_84477 ?auto_84478 ) ) ( ON ?auto_84477 ?auto_84476 ) ( CLEAR ?auto_84477 ) ( HOLDING ?auto_84478 ) ( CLEAR ?auto_84479 ) ( ON-TABLE ?auto_84479 ) ( not ( = ?auto_84479 ?auto_84478 ) ) ( not ( = ?auto_84472 ?auto_84479 ) ) ( not ( = ?auto_84473 ?auto_84479 ) ) ( not ( = ?auto_84474 ?auto_84479 ) ) ( not ( = ?auto_84475 ?auto_84479 ) ) ( not ( = ?auto_84476 ?auto_84479 ) ) ( not ( = ?auto_84477 ?auto_84479 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_84479 ?auto_84478 )
      ( MAKE-4PILE ?auto_84472 ?auto_84473 ?auto_84474 ?auto_84475 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_84480 - BLOCK
      ?auto_84481 - BLOCK
      ?auto_84482 - BLOCK
      ?auto_84483 - BLOCK
    )
    :vars
    (
      ?auto_84484 - BLOCK
      ?auto_84485 - BLOCK
      ?auto_84487 - BLOCK
      ?auto_84486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84484 ?auto_84483 ) ( ON-TABLE ?auto_84480 ) ( ON ?auto_84481 ?auto_84480 ) ( ON ?auto_84482 ?auto_84481 ) ( ON ?auto_84483 ?auto_84482 ) ( not ( = ?auto_84480 ?auto_84481 ) ) ( not ( = ?auto_84480 ?auto_84482 ) ) ( not ( = ?auto_84480 ?auto_84483 ) ) ( not ( = ?auto_84480 ?auto_84484 ) ) ( not ( = ?auto_84481 ?auto_84482 ) ) ( not ( = ?auto_84481 ?auto_84483 ) ) ( not ( = ?auto_84481 ?auto_84484 ) ) ( not ( = ?auto_84482 ?auto_84483 ) ) ( not ( = ?auto_84482 ?auto_84484 ) ) ( not ( = ?auto_84483 ?auto_84484 ) ) ( not ( = ?auto_84480 ?auto_84485 ) ) ( not ( = ?auto_84480 ?auto_84487 ) ) ( not ( = ?auto_84481 ?auto_84485 ) ) ( not ( = ?auto_84481 ?auto_84487 ) ) ( not ( = ?auto_84482 ?auto_84485 ) ) ( not ( = ?auto_84482 ?auto_84487 ) ) ( not ( = ?auto_84483 ?auto_84485 ) ) ( not ( = ?auto_84483 ?auto_84487 ) ) ( not ( = ?auto_84484 ?auto_84485 ) ) ( not ( = ?auto_84484 ?auto_84487 ) ) ( not ( = ?auto_84485 ?auto_84487 ) ) ( ON ?auto_84485 ?auto_84484 ) ( CLEAR ?auto_84486 ) ( ON-TABLE ?auto_84486 ) ( not ( = ?auto_84486 ?auto_84487 ) ) ( not ( = ?auto_84480 ?auto_84486 ) ) ( not ( = ?auto_84481 ?auto_84486 ) ) ( not ( = ?auto_84482 ?auto_84486 ) ) ( not ( = ?auto_84483 ?auto_84486 ) ) ( not ( = ?auto_84484 ?auto_84486 ) ) ( not ( = ?auto_84485 ?auto_84486 ) ) ( ON ?auto_84487 ?auto_84485 ) ( CLEAR ?auto_84487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_84480 ?auto_84481 ?auto_84482 ?auto_84483 ?auto_84484 ?auto_84485 )
      ( MAKE-4PILE ?auto_84480 ?auto_84481 ?auto_84482 ?auto_84483 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_84488 - BLOCK
      ?auto_84489 - BLOCK
      ?auto_84490 - BLOCK
      ?auto_84491 - BLOCK
    )
    :vars
    (
      ?auto_84493 - BLOCK
      ?auto_84492 - BLOCK
      ?auto_84495 - BLOCK
      ?auto_84494 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84493 ?auto_84491 ) ( ON-TABLE ?auto_84488 ) ( ON ?auto_84489 ?auto_84488 ) ( ON ?auto_84490 ?auto_84489 ) ( ON ?auto_84491 ?auto_84490 ) ( not ( = ?auto_84488 ?auto_84489 ) ) ( not ( = ?auto_84488 ?auto_84490 ) ) ( not ( = ?auto_84488 ?auto_84491 ) ) ( not ( = ?auto_84488 ?auto_84493 ) ) ( not ( = ?auto_84489 ?auto_84490 ) ) ( not ( = ?auto_84489 ?auto_84491 ) ) ( not ( = ?auto_84489 ?auto_84493 ) ) ( not ( = ?auto_84490 ?auto_84491 ) ) ( not ( = ?auto_84490 ?auto_84493 ) ) ( not ( = ?auto_84491 ?auto_84493 ) ) ( not ( = ?auto_84488 ?auto_84492 ) ) ( not ( = ?auto_84488 ?auto_84495 ) ) ( not ( = ?auto_84489 ?auto_84492 ) ) ( not ( = ?auto_84489 ?auto_84495 ) ) ( not ( = ?auto_84490 ?auto_84492 ) ) ( not ( = ?auto_84490 ?auto_84495 ) ) ( not ( = ?auto_84491 ?auto_84492 ) ) ( not ( = ?auto_84491 ?auto_84495 ) ) ( not ( = ?auto_84493 ?auto_84492 ) ) ( not ( = ?auto_84493 ?auto_84495 ) ) ( not ( = ?auto_84492 ?auto_84495 ) ) ( ON ?auto_84492 ?auto_84493 ) ( not ( = ?auto_84494 ?auto_84495 ) ) ( not ( = ?auto_84488 ?auto_84494 ) ) ( not ( = ?auto_84489 ?auto_84494 ) ) ( not ( = ?auto_84490 ?auto_84494 ) ) ( not ( = ?auto_84491 ?auto_84494 ) ) ( not ( = ?auto_84493 ?auto_84494 ) ) ( not ( = ?auto_84492 ?auto_84494 ) ) ( ON ?auto_84495 ?auto_84492 ) ( CLEAR ?auto_84495 ) ( HOLDING ?auto_84494 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_84494 )
      ( MAKE-4PILE ?auto_84488 ?auto_84489 ?auto_84490 ?auto_84491 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_84496 - BLOCK
      ?auto_84497 - BLOCK
      ?auto_84498 - BLOCK
      ?auto_84499 - BLOCK
    )
    :vars
    (
      ?auto_84502 - BLOCK
      ?auto_84503 - BLOCK
      ?auto_84501 - BLOCK
      ?auto_84500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84502 ?auto_84499 ) ( ON-TABLE ?auto_84496 ) ( ON ?auto_84497 ?auto_84496 ) ( ON ?auto_84498 ?auto_84497 ) ( ON ?auto_84499 ?auto_84498 ) ( not ( = ?auto_84496 ?auto_84497 ) ) ( not ( = ?auto_84496 ?auto_84498 ) ) ( not ( = ?auto_84496 ?auto_84499 ) ) ( not ( = ?auto_84496 ?auto_84502 ) ) ( not ( = ?auto_84497 ?auto_84498 ) ) ( not ( = ?auto_84497 ?auto_84499 ) ) ( not ( = ?auto_84497 ?auto_84502 ) ) ( not ( = ?auto_84498 ?auto_84499 ) ) ( not ( = ?auto_84498 ?auto_84502 ) ) ( not ( = ?auto_84499 ?auto_84502 ) ) ( not ( = ?auto_84496 ?auto_84503 ) ) ( not ( = ?auto_84496 ?auto_84501 ) ) ( not ( = ?auto_84497 ?auto_84503 ) ) ( not ( = ?auto_84497 ?auto_84501 ) ) ( not ( = ?auto_84498 ?auto_84503 ) ) ( not ( = ?auto_84498 ?auto_84501 ) ) ( not ( = ?auto_84499 ?auto_84503 ) ) ( not ( = ?auto_84499 ?auto_84501 ) ) ( not ( = ?auto_84502 ?auto_84503 ) ) ( not ( = ?auto_84502 ?auto_84501 ) ) ( not ( = ?auto_84503 ?auto_84501 ) ) ( ON ?auto_84503 ?auto_84502 ) ( not ( = ?auto_84500 ?auto_84501 ) ) ( not ( = ?auto_84496 ?auto_84500 ) ) ( not ( = ?auto_84497 ?auto_84500 ) ) ( not ( = ?auto_84498 ?auto_84500 ) ) ( not ( = ?auto_84499 ?auto_84500 ) ) ( not ( = ?auto_84502 ?auto_84500 ) ) ( not ( = ?auto_84503 ?auto_84500 ) ) ( ON ?auto_84501 ?auto_84503 ) ( ON ?auto_84500 ?auto_84501 ) ( CLEAR ?auto_84500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_84496 ?auto_84497 ?auto_84498 ?auto_84499 ?auto_84502 ?auto_84503 ?auto_84501 )
      ( MAKE-4PILE ?auto_84496 ?auto_84497 ?auto_84498 ?auto_84499 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_84508 - BLOCK
      ?auto_84509 - BLOCK
      ?auto_84510 - BLOCK
      ?auto_84511 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_84511 ) ( CLEAR ?auto_84510 ) ( ON-TABLE ?auto_84508 ) ( ON ?auto_84509 ?auto_84508 ) ( ON ?auto_84510 ?auto_84509 ) ( not ( = ?auto_84508 ?auto_84509 ) ) ( not ( = ?auto_84508 ?auto_84510 ) ) ( not ( = ?auto_84508 ?auto_84511 ) ) ( not ( = ?auto_84509 ?auto_84510 ) ) ( not ( = ?auto_84509 ?auto_84511 ) ) ( not ( = ?auto_84510 ?auto_84511 ) ) )
    :subtasks
    ( ( !STACK ?auto_84511 ?auto_84510 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_84512 - BLOCK
      ?auto_84513 - BLOCK
      ?auto_84514 - BLOCK
      ?auto_84515 - BLOCK
    )
    :vars
    (
      ?auto_84516 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_84514 ) ( ON-TABLE ?auto_84512 ) ( ON ?auto_84513 ?auto_84512 ) ( ON ?auto_84514 ?auto_84513 ) ( not ( = ?auto_84512 ?auto_84513 ) ) ( not ( = ?auto_84512 ?auto_84514 ) ) ( not ( = ?auto_84512 ?auto_84515 ) ) ( not ( = ?auto_84513 ?auto_84514 ) ) ( not ( = ?auto_84513 ?auto_84515 ) ) ( not ( = ?auto_84514 ?auto_84515 ) ) ( ON ?auto_84515 ?auto_84516 ) ( CLEAR ?auto_84515 ) ( HAND-EMPTY ) ( not ( = ?auto_84512 ?auto_84516 ) ) ( not ( = ?auto_84513 ?auto_84516 ) ) ( not ( = ?auto_84514 ?auto_84516 ) ) ( not ( = ?auto_84515 ?auto_84516 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_84515 ?auto_84516 )
      ( MAKE-4PILE ?auto_84512 ?auto_84513 ?auto_84514 ?auto_84515 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_84517 - BLOCK
      ?auto_84518 - BLOCK
      ?auto_84519 - BLOCK
      ?auto_84520 - BLOCK
    )
    :vars
    (
      ?auto_84521 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84517 ) ( ON ?auto_84518 ?auto_84517 ) ( not ( = ?auto_84517 ?auto_84518 ) ) ( not ( = ?auto_84517 ?auto_84519 ) ) ( not ( = ?auto_84517 ?auto_84520 ) ) ( not ( = ?auto_84518 ?auto_84519 ) ) ( not ( = ?auto_84518 ?auto_84520 ) ) ( not ( = ?auto_84519 ?auto_84520 ) ) ( ON ?auto_84520 ?auto_84521 ) ( CLEAR ?auto_84520 ) ( not ( = ?auto_84517 ?auto_84521 ) ) ( not ( = ?auto_84518 ?auto_84521 ) ) ( not ( = ?auto_84519 ?auto_84521 ) ) ( not ( = ?auto_84520 ?auto_84521 ) ) ( HOLDING ?auto_84519 ) ( CLEAR ?auto_84518 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_84517 ?auto_84518 ?auto_84519 )
      ( MAKE-4PILE ?auto_84517 ?auto_84518 ?auto_84519 ?auto_84520 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_84522 - BLOCK
      ?auto_84523 - BLOCK
      ?auto_84524 - BLOCK
      ?auto_84525 - BLOCK
    )
    :vars
    (
      ?auto_84526 - BLOCK
      ?auto_84527 - BLOCK
      ?auto_84528 - BLOCK
      ?auto_84529 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84522 ) ( ON ?auto_84523 ?auto_84522 ) ( not ( = ?auto_84522 ?auto_84523 ) ) ( not ( = ?auto_84522 ?auto_84524 ) ) ( not ( = ?auto_84522 ?auto_84525 ) ) ( not ( = ?auto_84523 ?auto_84524 ) ) ( not ( = ?auto_84523 ?auto_84525 ) ) ( not ( = ?auto_84524 ?auto_84525 ) ) ( ON ?auto_84525 ?auto_84526 ) ( not ( = ?auto_84522 ?auto_84526 ) ) ( not ( = ?auto_84523 ?auto_84526 ) ) ( not ( = ?auto_84524 ?auto_84526 ) ) ( not ( = ?auto_84525 ?auto_84526 ) ) ( CLEAR ?auto_84523 ) ( ON ?auto_84524 ?auto_84525 ) ( CLEAR ?auto_84524 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_84527 ) ( ON ?auto_84528 ?auto_84527 ) ( ON ?auto_84529 ?auto_84528 ) ( ON ?auto_84526 ?auto_84529 ) ( not ( = ?auto_84527 ?auto_84528 ) ) ( not ( = ?auto_84527 ?auto_84529 ) ) ( not ( = ?auto_84527 ?auto_84526 ) ) ( not ( = ?auto_84527 ?auto_84525 ) ) ( not ( = ?auto_84527 ?auto_84524 ) ) ( not ( = ?auto_84528 ?auto_84529 ) ) ( not ( = ?auto_84528 ?auto_84526 ) ) ( not ( = ?auto_84528 ?auto_84525 ) ) ( not ( = ?auto_84528 ?auto_84524 ) ) ( not ( = ?auto_84529 ?auto_84526 ) ) ( not ( = ?auto_84529 ?auto_84525 ) ) ( not ( = ?auto_84529 ?auto_84524 ) ) ( not ( = ?auto_84522 ?auto_84527 ) ) ( not ( = ?auto_84522 ?auto_84528 ) ) ( not ( = ?auto_84522 ?auto_84529 ) ) ( not ( = ?auto_84523 ?auto_84527 ) ) ( not ( = ?auto_84523 ?auto_84528 ) ) ( not ( = ?auto_84523 ?auto_84529 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_84527 ?auto_84528 ?auto_84529 ?auto_84526 ?auto_84525 )
      ( MAKE-4PILE ?auto_84522 ?auto_84523 ?auto_84524 ?auto_84525 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_84530 - BLOCK
      ?auto_84531 - BLOCK
      ?auto_84532 - BLOCK
      ?auto_84533 - BLOCK
    )
    :vars
    (
      ?auto_84534 - BLOCK
      ?auto_84535 - BLOCK
      ?auto_84536 - BLOCK
      ?auto_84537 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84530 ) ( not ( = ?auto_84530 ?auto_84531 ) ) ( not ( = ?auto_84530 ?auto_84532 ) ) ( not ( = ?auto_84530 ?auto_84533 ) ) ( not ( = ?auto_84531 ?auto_84532 ) ) ( not ( = ?auto_84531 ?auto_84533 ) ) ( not ( = ?auto_84532 ?auto_84533 ) ) ( ON ?auto_84533 ?auto_84534 ) ( not ( = ?auto_84530 ?auto_84534 ) ) ( not ( = ?auto_84531 ?auto_84534 ) ) ( not ( = ?auto_84532 ?auto_84534 ) ) ( not ( = ?auto_84533 ?auto_84534 ) ) ( ON ?auto_84532 ?auto_84533 ) ( CLEAR ?auto_84532 ) ( ON-TABLE ?auto_84535 ) ( ON ?auto_84536 ?auto_84535 ) ( ON ?auto_84537 ?auto_84536 ) ( ON ?auto_84534 ?auto_84537 ) ( not ( = ?auto_84535 ?auto_84536 ) ) ( not ( = ?auto_84535 ?auto_84537 ) ) ( not ( = ?auto_84535 ?auto_84534 ) ) ( not ( = ?auto_84535 ?auto_84533 ) ) ( not ( = ?auto_84535 ?auto_84532 ) ) ( not ( = ?auto_84536 ?auto_84537 ) ) ( not ( = ?auto_84536 ?auto_84534 ) ) ( not ( = ?auto_84536 ?auto_84533 ) ) ( not ( = ?auto_84536 ?auto_84532 ) ) ( not ( = ?auto_84537 ?auto_84534 ) ) ( not ( = ?auto_84537 ?auto_84533 ) ) ( not ( = ?auto_84537 ?auto_84532 ) ) ( not ( = ?auto_84530 ?auto_84535 ) ) ( not ( = ?auto_84530 ?auto_84536 ) ) ( not ( = ?auto_84530 ?auto_84537 ) ) ( not ( = ?auto_84531 ?auto_84535 ) ) ( not ( = ?auto_84531 ?auto_84536 ) ) ( not ( = ?auto_84531 ?auto_84537 ) ) ( HOLDING ?auto_84531 ) ( CLEAR ?auto_84530 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_84530 ?auto_84531 )
      ( MAKE-4PILE ?auto_84530 ?auto_84531 ?auto_84532 ?auto_84533 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_84538 - BLOCK
      ?auto_84539 - BLOCK
      ?auto_84540 - BLOCK
      ?auto_84541 - BLOCK
    )
    :vars
    (
      ?auto_84542 - BLOCK
      ?auto_84545 - BLOCK
      ?auto_84543 - BLOCK
      ?auto_84544 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84538 ) ( not ( = ?auto_84538 ?auto_84539 ) ) ( not ( = ?auto_84538 ?auto_84540 ) ) ( not ( = ?auto_84538 ?auto_84541 ) ) ( not ( = ?auto_84539 ?auto_84540 ) ) ( not ( = ?auto_84539 ?auto_84541 ) ) ( not ( = ?auto_84540 ?auto_84541 ) ) ( ON ?auto_84541 ?auto_84542 ) ( not ( = ?auto_84538 ?auto_84542 ) ) ( not ( = ?auto_84539 ?auto_84542 ) ) ( not ( = ?auto_84540 ?auto_84542 ) ) ( not ( = ?auto_84541 ?auto_84542 ) ) ( ON ?auto_84540 ?auto_84541 ) ( ON-TABLE ?auto_84545 ) ( ON ?auto_84543 ?auto_84545 ) ( ON ?auto_84544 ?auto_84543 ) ( ON ?auto_84542 ?auto_84544 ) ( not ( = ?auto_84545 ?auto_84543 ) ) ( not ( = ?auto_84545 ?auto_84544 ) ) ( not ( = ?auto_84545 ?auto_84542 ) ) ( not ( = ?auto_84545 ?auto_84541 ) ) ( not ( = ?auto_84545 ?auto_84540 ) ) ( not ( = ?auto_84543 ?auto_84544 ) ) ( not ( = ?auto_84543 ?auto_84542 ) ) ( not ( = ?auto_84543 ?auto_84541 ) ) ( not ( = ?auto_84543 ?auto_84540 ) ) ( not ( = ?auto_84544 ?auto_84542 ) ) ( not ( = ?auto_84544 ?auto_84541 ) ) ( not ( = ?auto_84544 ?auto_84540 ) ) ( not ( = ?auto_84538 ?auto_84545 ) ) ( not ( = ?auto_84538 ?auto_84543 ) ) ( not ( = ?auto_84538 ?auto_84544 ) ) ( not ( = ?auto_84539 ?auto_84545 ) ) ( not ( = ?auto_84539 ?auto_84543 ) ) ( not ( = ?auto_84539 ?auto_84544 ) ) ( CLEAR ?auto_84538 ) ( ON ?auto_84539 ?auto_84540 ) ( CLEAR ?auto_84539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_84545 ?auto_84543 ?auto_84544 ?auto_84542 ?auto_84541 ?auto_84540 )
      ( MAKE-4PILE ?auto_84538 ?auto_84539 ?auto_84540 ?auto_84541 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_84546 - BLOCK
      ?auto_84547 - BLOCK
      ?auto_84548 - BLOCK
      ?auto_84549 - BLOCK
    )
    :vars
    (
      ?auto_84551 - BLOCK
      ?auto_84553 - BLOCK
      ?auto_84550 - BLOCK
      ?auto_84552 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84546 ?auto_84547 ) ) ( not ( = ?auto_84546 ?auto_84548 ) ) ( not ( = ?auto_84546 ?auto_84549 ) ) ( not ( = ?auto_84547 ?auto_84548 ) ) ( not ( = ?auto_84547 ?auto_84549 ) ) ( not ( = ?auto_84548 ?auto_84549 ) ) ( ON ?auto_84549 ?auto_84551 ) ( not ( = ?auto_84546 ?auto_84551 ) ) ( not ( = ?auto_84547 ?auto_84551 ) ) ( not ( = ?auto_84548 ?auto_84551 ) ) ( not ( = ?auto_84549 ?auto_84551 ) ) ( ON ?auto_84548 ?auto_84549 ) ( ON-TABLE ?auto_84553 ) ( ON ?auto_84550 ?auto_84553 ) ( ON ?auto_84552 ?auto_84550 ) ( ON ?auto_84551 ?auto_84552 ) ( not ( = ?auto_84553 ?auto_84550 ) ) ( not ( = ?auto_84553 ?auto_84552 ) ) ( not ( = ?auto_84553 ?auto_84551 ) ) ( not ( = ?auto_84553 ?auto_84549 ) ) ( not ( = ?auto_84553 ?auto_84548 ) ) ( not ( = ?auto_84550 ?auto_84552 ) ) ( not ( = ?auto_84550 ?auto_84551 ) ) ( not ( = ?auto_84550 ?auto_84549 ) ) ( not ( = ?auto_84550 ?auto_84548 ) ) ( not ( = ?auto_84552 ?auto_84551 ) ) ( not ( = ?auto_84552 ?auto_84549 ) ) ( not ( = ?auto_84552 ?auto_84548 ) ) ( not ( = ?auto_84546 ?auto_84553 ) ) ( not ( = ?auto_84546 ?auto_84550 ) ) ( not ( = ?auto_84546 ?auto_84552 ) ) ( not ( = ?auto_84547 ?auto_84553 ) ) ( not ( = ?auto_84547 ?auto_84550 ) ) ( not ( = ?auto_84547 ?auto_84552 ) ) ( ON ?auto_84547 ?auto_84548 ) ( CLEAR ?auto_84547 ) ( HOLDING ?auto_84546 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_84546 )
      ( MAKE-4PILE ?auto_84546 ?auto_84547 ?auto_84548 ?auto_84549 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_84554 - BLOCK
      ?auto_84555 - BLOCK
      ?auto_84556 - BLOCK
      ?auto_84557 - BLOCK
    )
    :vars
    (
      ?auto_84558 - BLOCK
      ?auto_84561 - BLOCK
      ?auto_84560 - BLOCK
      ?auto_84559 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84554 ?auto_84555 ) ) ( not ( = ?auto_84554 ?auto_84556 ) ) ( not ( = ?auto_84554 ?auto_84557 ) ) ( not ( = ?auto_84555 ?auto_84556 ) ) ( not ( = ?auto_84555 ?auto_84557 ) ) ( not ( = ?auto_84556 ?auto_84557 ) ) ( ON ?auto_84557 ?auto_84558 ) ( not ( = ?auto_84554 ?auto_84558 ) ) ( not ( = ?auto_84555 ?auto_84558 ) ) ( not ( = ?auto_84556 ?auto_84558 ) ) ( not ( = ?auto_84557 ?auto_84558 ) ) ( ON ?auto_84556 ?auto_84557 ) ( ON-TABLE ?auto_84561 ) ( ON ?auto_84560 ?auto_84561 ) ( ON ?auto_84559 ?auto_84560 ) ( ON ?auto_84558 ?auto_84559 ) ( not ( = ?auto_84561 ?auto_84560 ) ) ( not ( = ?auto_84561 ?auto_84559 ) ) ( not ( = ?auto_84561 ?auto_84558 ) ) ( not ( = ?auto_84561 ?auto_84557 ) ) ( not ( = ?auto_84561 ?auto_84556 ) ) ( not ( = ?auto_84560 ?auto_84559 ) ) ( not ( = ?auto_84560 ?auto_84558 ) ) ( not ( = ?auto_84560 ?auto_84557 ) ) ( not ( = ?auto_84560 ?auto_84556 ) ) ( not ( = ?auto_84559 ?auto_84558 ) ) ( not ( = ?auto_84559 ?auto_84557 ) ) ( not ( = ?auto_84559 ?auto_84556 ) ) ( not ( = ?auto_84554 ?auto_84561 ) ) ( not ( = ?auto_84554 ?auto_84560 ) ) ( not ( = ?auto_84554 ?auto_84559 ) ) ( not ( = ?auto_84555 ?auto_84561 ) ) ( not ( = ?auto_84555 ?auto_84560 ) ) ( not ( = ?auto_84555 ?auto_84559 ) ) ( ON ?auto_84555 ?auto_84556 ) ( ON ?auto_84554 ?auto_84555 ) ( CLEAR ?auto_84554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_84561 ?auto_84560 ?auto_84559 ?auto_84558 ?auto_84557 ?auto_84556 ?auto_84555 )
      ( MAKE-4PILE ?auto_84554 ?auto_84555 ?auto_84556 ?auto_84557 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_84565 - BLOCK
      ?auto_84566 - BLOCK
      ?auto_84567 - BLOCK
    )
    :vars
    (
      ?auto_84568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84568 ?auto_84567 ) ( CLEAR ?auto_84568 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_84565 ) ( ON ?auto_84566 ?auto_84565 ) ( ON ?auto_84567 ?auto_84566 ) ( not ( = ?auto_84565 ?auto_84566 ) ) ( not ( = ?auto_84565 ?auto_84567 ) ) ( not ( = ?auto_84565 ?auto_84568 ) ) ( not ( = ?auto_84566 ?auto_84567 ) ) ( not ( = ?auto_84566 ?auto_84568 ) ) ( not ( = ?auto_84567 ?auto_84568 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_84568 ?auto_84567 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_84569 - BLOCK
      ?auto_84570 - BLOCK
      ?auto_84571 - BLOCK
    )
    :vars
    (
      ?auto_84572 - BLOCK
      ?auto_84573 - BLOCK
      ?auto_84574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84572 ?auto_84571 ) ( CLEAR ?auto_84572 ) ( ON-TABLE ?auto_84569 ) ( ON ?auto_84570 ?auto_84569 ) ( ON ?auto_84571 ?auto_84570 ) ( not ( = ?auto_84569 ?auto_84570 ) ) ( not ( = ?auto_84569 ?auto_84571 ) ) ( not ( = ?auto_84569 ?auto_84572 ) ) ( not ( = ?auto_84570 ?auto_84571 ) ) ( not ( = ?auto_84570 ?auto_84572 ) ) ( not ( = ?auto_84571 ?auto_84572 ) ) ( HOLDING ?auto_84573 ) ( CLEAR ?auto_84574 ) ( not ( = ?auto_84569 ?auto_84573 ) ) ( not ( = ?auto_84569 ?auto_84574 ) ) ( not ( = ?auto_84570 ?auto_84573 ) ) ( not ( = ?auto_84570 ?auto_84574 ) ) ( not ( = ?auto_84571 ?auto_84573 ) ) ( not ( = ?auto_84571 ?auto_84574 ) ) ( not ( = ?auto_84572 ?auto_84573 ) ) ( not ( = ?auto_84572 ?auto_84574 ) ) ( not ( = ?auto_84573 ?auto_84574 ) ) )
    :subtasks
    ( ( !STACK ?auto_84573 ?auto_84574 )
      ( MAKE-3PILE ?auto_84569 ?auto_84570 ?auto_84571 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_84575 - BLOCK
      ?auto_84576 - BLOCK
      ?auto_84577 - BLOCK
    )
    :vars
    (
      ?auto_84578 - BLOCK
      ?auto_84579 - BLOCK
      ?auto_84580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84578 ?auto_84577 ) ( ON-TABLE ?auto_84575 ) ( ON ?auto_84576 ?auto_84575 ) ( ON ?auto_84577 ?auto_84576 ) ( not ( = ?auto_84575 ?auto_84576 ) ) ( not ( = ?auto_84575 ?auto_84577 ) ) ( not ( = ?auto_84575 ?auto_84578 ) ) ( not ( = ?auto_84576 ?auto_84577 ) ) ( not ( = ?auto_84576 ?auto_84578 ) ) ( not ( = ?auto_84577 ?auto_84578 ) ) ( CLEAR ?auto_84579 ) ( not ( = ?auto_84575 ?auto_84580 ) ) ( not ( = ?auto_84575 ?auto_84579 ) ) ( not ( = ?auto_84576 ?auto_84580 ) ) ( not ( = ?auto_84576 ?auto_84579 ) ) ( not ( = ?auto_84577 ?auto_84580 ) ) ( not ( = ?auto_84577 ?auto_84579 ) ) ( not ( = ?auto_84578 ?auto_84580 ) ) ( not ( = ?auto_84578 ?auto_84579 ) ) ( not ( = ?auto_84580 ?auto_84579 ) ) ( ON ?auto_84580 ?auto_84578 ) ( CLEAR ?auto_84580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_84575 ?auto_84576 ?auto_84577 ?auto_84578 )
      ( MAKE-3PILE ?auto_84575 ?auto_84576 ?auto_84577 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_84581 - BLOCK
      ?auto_84582 - BLOCK
      ?auto_84583 - BLOCK
    )
    :vars
    (
      ?auto_84585 - BLOCK
      ?auto_84586 - BLOCK
      ?auto_84584 - BLOCK
      ?auto_84587 - BLOCK
      ?auto_84588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84585 ?auto_84583 ) ( ON-TABLE ?auto_84581 ) ( ON ?auto_84582 ?auto_84581 ) ( ON ?auto_84583 ?auto_84582 ) ( not ( = ?auto_84581 ?auto_84582 ) ) ( not ( = ?auto_84581 ?auto_84583 ) ) ( not ( = ?auto_84581 ?auto_84585 ) ) ( not ( = ?auto_84582 ?auto_84583 ) ) ( not ( = ?auto_84582 ?auto_84585 ) ) ( not ( = ?auto_84583 ?auto_84585 ) ) ( not ( = ?auto_84581 ?auto_84586 ) ) ( not ( = ?auto_84581 ?auto_84584 ) ) ( not ( = ?auto_84582 ?auto_84586 ) ) ( not ( = ?auto_84582 ?auto_84584 ) ) ( not ( = ?auto_84583 ?auto_84586 ) ) ( not ( = ?auto_84583 ?auto_84584 ) ) ( not ( = ?auto_84585 ?auto_84586 ) ) ( not ( = ?auto_84585 ?auto_84584 ) ) ( not ( = ?auto_84586 ?auto_84584 ) ) ( ON ?auto_84586 ?auto_84585 ) ( CLEAR ?auto_84586 ) ( HOLDING ?auto_84584 ) ( CLEAR ?auto_84587 ) ( ON-TABLE ?auto_84588 ) ( ON ?auto_84587 ?auto_84588 ) ( not ( = ?auto_84588 ?auto_84587 ) ) ( not ( = ?auto_84588 ?auto_84584 ) ) ( not ( = ?auto_84587 ?auto_84584 ) ) ( not ( = ?auto_84581 ?auto_84587 ) ) ( not ( = ?auto_84581 ?auto_84588 ) ) ( not ( = ?auto_84582 ?auto_84587 ) ) ( not ( = ?auto_84582 ?auto_84588 ) ) ( not ( = ?auto_84583 ?auto_84587 ) ) ( not ( = ?auto_84583 ?auto_84588 ) ) ( not ( = ?auto_84585 ?auto_84587 ) ) ( not ( = ?auto_84585 ?auto_84588 ) ) ( not ( = ?auto_84586 ?auto_84587 ) ) ( not ( = ?auto_84586 ?auto_84588 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_84588 ?auto_84587 ?auto_84584 )
      ( MAKE-3PILE ?auto_84581 ?auto_84582 ?auto_84583 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_84589 - BLOCK
      ?auto_84590 - BLOCK
      ?auto_84591 - BLOCK
    )
    :vars
    (
      ?auto_84594 - BLOCK
      ?auto_84595 - BLOCK
      ?auto_84592 - BLOCK
      ?auto_84593 - BLOCK
      ?auto_84596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84594 ?auto_84591 ) ( ON-TABLE ?auto_84589 ) ( ON ?auto_84590 ?auto_84589 ) ( ON ?auto_84591 ?auto_84590 ) ( not ( = ?auto_84589 ?auto_84590 ) ) ( not ( = ?auto_84589 ?auto_84591 ) ) ( not ( = ?auto_84589 ?auto_84594 ) ) ( not ( = ?auto_84590 ?auto_84591 ) ) ( not ( = ?auto_84590 ?auto_84594 ) ) ( not ( = ?auto_84591 ?auto_84594 ) ) ( not ( = ?auto_84589 ?auto_84595 ) ) ( not ( = ?auto_84589 ?auto_84592 ) ) ( not ( = ?auto_84590 ?auto_84595 ) ) ( not ( = ?auto_84590 ?auto_84592 ) ) ( not ( = ?auto_84591 ?auto_84595 ) ) ( not ( = ?auto_84591 ?auto_84592 ) ) ( not ( = ?auto_84594 ?auto_84595 ) ) ( not ( = ?auto_84594 ?auto_84592 ) ) ( not ( = ?auto_84595 ?auto_84592 ) ) ( ON ?auto_84595 ?auto_84594 ) ( CLEAR ?auto_84593 ) ( ON-TABLE ?auto_84596 ) ( ON ?auto_84593 ?auto_84596 ) ( not ( = ?auto_84596 ?auto_84593 ) ) ( not ( = ?auto_84596 ?auto_84592 ) ) ( not ( = ?auto_84593 ?auto_84592 ) ) ( not ( = ?auto_84589 ?auto_84593 ) ) ( not ( = ?auto_84589 ?auto_84596 ) ) ( not ( = ?auto_84590 ?auto_84593 ) ) ( not ( = ?auto_84590 ?auto_84596 ) ) ( not ( = ?auto_84591 ?auto_84593 ) ) ( not ( = ?auto_84591 ?auto_84596 ) ) ( not ( = ?auto_84594 ?auto_84593 ) ) ( not ( = ?auto_84594 ?auto_84596 ) ) ( not ( = ?auto_84595 ?auto_84593 ) ) ( not ( = ?auto_84595 ?auto_84596 ) ) ( ON ?auto_84592 ?auto_84595 ) ( CLEAR ?auto_84592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_84589 ?auto_84590 ?auto_84591 ?auto_84594 ?auto_84595 )
      ( MAKE-3PILE ?auto_84589 ?auto_84590 ?auto_84591 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_84597 - BLOCK
      ?auto_84598 - BLOCK
      ?auto_84599 - BLOCK
    )
    :vars
    (
      ?auto_84603 - BLOCK
      ?auto_84604 - BLOCK
      ?auto_84602 - BLOCK
      ?auto_84600 - BLOCK
      ?auto_84601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84603 ?auto_84599 ) ( ON-TABLE ?auto_84597 ) ( ON ?auto_84598 ?auto_84597 ) ( ON ?auto_84599 ?auto_84598 ) ( not ( = ?auto_84597 ?auto_84598 ) ) ( not ( = ?auto_84597 ?auto_84599 ) ) ( not ( = ?auto_84597 ?auto_84603 ) ) ( not ( = ?auto_84598 ?auto_84599 ) ) ( not ( = ?auto_84598 ?auto_84603 ) ) ( not ( = ?auto_84599 ?auto_84603 ) ) ( not ( = ?auto_84597 ?auto_84604 ) ) ( not ( = ?auto_84597 ?auto_84602 ) ) ( not ( = ?auto_84598 ?auto_84604 ) ) ( not ( = ?auto_84598 ?auto_84602 ) ) ( not ( = ?auto_84599 ?auto_84604 ) ) ( not ( = ?auto_84599 ?auto_84602 ) ) ( not ( = ?auto_84603 ?auto_84604 ) ) ( not ( = ?auto_84603 ?auto_84602 ) ) ( not ( = ?auto_84604 ?auto_84602 ) ) ( ON ?auto_84604 ?auto_84603 ) ( ON-TABLE ?auto_84600 ) ( not ( = ?auto_84600 ?auto_84601 ) ) ( not ( = ?auto_84600 ?auto_84602 ) ) ( not ( = ?auto_84601 ?auto_84602 ) ) ( not ( = ?auto_84597 ?auto_84601 ) ) ( not ( = ?auto_84597 ?auto_84600 ) ) ( not ( = ?auto_84598 ?auto_84601 ) ) ( not ( = ?auto_84598 ?auto_84600 ) ) ( not ( = ?auto_84599 ?auto_84601 ) ) ( not ( = ?auto_84599 ?auto_84600 ) ) ( not ( = ?auto_84603 ?auto_84601 ) ) ( not ( = ?auto_84603 ?auto_84600 ) ) ( not ( = ?auto_84604 ?auto_84601 ) ) ( not ( = ?auto_84604 ?auto_84600 ) ) ( ON ?auto_84602 ?auto_84604 ) ( CLEAR ?auto_84602 ) ( HOLDING ?auto_84601 ) ( CLEAR ?auto_84600 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_84600 ?auto_84601 )
      ( MAKE-3PILE ?auto_84597 ?auto_84598 ?auto_84599 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_84605 - BLOCK
      ?auto_84606 - BLOCK
      ?auto_84607 - BLOCK
    )
    :vars
    (
      ?auto_84609 - BLOCK
      ?auto_84611 - BLOCK
      ?auto_84612 - BLOCK
      ?auto_84608 - BLOCK
      ?auto_84610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84609 ?auto_84607 ) ( ON-TABLE ?auto_84605 ) ( ON ?auto_84606 ?auto_84605 ) ( ON ?auto_84607 ?auto_84606 ) ( not ( = ?auto_84605 ?auto_84606 ) ) ( not ( = ?auto_84605 ?auto_84607 ) ) ( not ( = ?auto_84605 ?auto_84609 ) ) ( not ( = ?auto_84606 ?auto_84607 ) ) ( not ( = ?auto_84606 ?auto_84609 ) ) ( not ( = ?auto_84607 ?auto_84609 ) ) ( not ( = ?auto_84605 ?auto_84611 ) ) ( not ( = ?auto_84605 ?auto_84612 ) ) ( not ( = ?auto_84606 ?auto_84611 ) ) ( not ( = ?auto_84606 ?auto_84612 ) ) ( not ( = ?auto_84607 ?auto_84611 ) ) ( not ( = ?auto_84607 ?auto_84612 ) ) ( not ( = ?auto_84609 ?auto_84611 ) ) ( not ( = ?auto_84609 ?auto_84612 ) ) ( not ( = ?auto_84611 ?auto_84612 ) ) ( ON ?auto_84611 ?auto_84609 ) ( ON-TABLE ?auto_84608 ) ( not ( = ?auto_84608 ?auto_84610 ) ) ( not ( = ?auto_84608 ?auto_84612 ) ) ( not ( = ?auto_84610 ?auto_84612 ) ) ( not ( = ?auto_84605 ?auto_84610 ) ) ( not ( = ?auto_84605 ?auto_84608 ) ) ( not ( = ?auto_84606 ?auto_84610 ) ) ( not ( = ?auto_84606 ?auto_84608 ) ) ( not ( = ?auto_84607 ?auto_84610 ) ) ( not ( = ?auto_84607 ?auto_84608 ) ) ( not ( = ?auto_84609 ?auto_84610 ) ) ( not ( = ?auto_84609 ?auto_84608 ) ) ( not ( = ?auto_84611 ?auto_84610 ) ) ( not ( = ?auto_84611 ?auto_84608 ) ) ( ON ?auto_84612 ?auto_84611 ) ( CLEAR ?auto_84608 ) ( ON ?auto_84610 ?auto_84612 ) ( CLEAR ?auto_84610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_84605 ?auto_84606 ?auto_84607 ?auto_84609 ?auto_84611 ?auto_84612 )
      ( MAKE-3PILE ?auto_84605 ?auto_84606 ?auto_84607 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_84613 - BLOCK
      ?auto_84614 - BLOCK
      ?auto_84615 - BLOCK
    )
    :vars
    (
      ?auto_84619 - BLOCK
      ?auto_84618 - BLOCK
      ?auto_84616 - BLOCK
      ?auto_84620 - BLOCK
      ?auto_84617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84619 ?auto_84615 ) ( ON-TABLE ?auto_84613 ) ( ON ?auto_84614 ?auto_84613 ) ( ON ?auto_84615 ?auto_84614 ) ( not ( = ?auto_84613 ?auto_84614 ) ) ( not ( = ?auto_84613 ?auto_84615 ) ) ( not ( = ?auto_84613 ?auto_84619 ) ) ( not ( = ?auto_84614 ?auto_84615 ) ) ( not ( = ?auto_84614 ?auto_84619 ) ) ( not ( = ?auto_84615 ?auto_84619 ) ) ( not ( = ?auto_84613 ?auto_84618 ) ) ( not ( = ?auto_84613 ?auto_84616 ) ) ( not ( = ?auto_84614 ?auto_84618 ) ) ( not ( = ?auto_84614 ?auto_84616 ) ) ( not ( = ?auto_84615 ?auto_84618 ) ) ( not ( = ?auto_84615 ?auto_84616 ) ) ( not ( = ?auto_84619 ?auto_84618 ) ) ( not ( = ?auto_84619 ?auto_84616 ) ) ( not ( = ?auto_84618 ?auto_84616 ) ) ( ON ?auto_84618 ?auto_84619 ) ( not ( = ?auto_84620 ?auto_84617 ) ) ( not ( = ?auto_84620 ?auto_84616 ) ) ( not ( = ?auto_84617 ?auto_84616 ) ) ( not ( = ?auto_84613 ?auto_84617 ) ) ( not ( = ?auto_84613 ?auto_84620 ) ) ( not ( = ?auto_84614 ?auto_84617 ) ) ( not ( = ?auto_84614 ?auto_84620 ) ) ( not ( = ?auto_84615 ?auto_84617 ) ) ( not ( = ?auto_84615 ?auto_84620 ) ) ( not ( = ?auto_84619 ?auto_84617 ) ) ( not ( = ?auto_84619 ?auto_84620 ) ) ( not ( = ?auto_84618 ?auto_84617 ) ) ( not ( = ?auto_84618 ?auto_84620 ) ) ( ON ?auto_84616 ?auto_84618 ) ( ON ?auto_84617 ?auto_84616 ) ( CLEAR ?auto_84617 ) ( HOLDING ?auto_84620 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_84620 )
      ( MAKE-3PILE ?auto_84613 ?auto_84614 ?auto_84615 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_84621 - BLOCK
      ?auto_84622 - BLOCK
      ?auto_84623 - BLOCK
    )
    :vars
    (
      ?auto_84628 - BLOCK
      ?auto_84627 - BLOCK
      ?auto_84625 - BLOCK
      ?auto_84624 - BLOCK
      ?auto_84626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84628 ?auto_84623 ) ( ON-TABLE ?auto_84621 ) ( ON ?auto_84622 ?auto_84621 ) ( ON ?auto_84623 ?auto_84622 ) ( not ( = ?auto_84621 ?auto_84622 ) ) ( not ( = ?auto_84621 ?auto_84623 ) ) ( not ( = ?auto_84621 ?auto_84628 ) ) ( not ( = ?auto_84622 ?auto_84623 ) ) ( not ( = ?auto_84622 ?auto_84628 ) ) ( not ( = ?auto_84623 ?auto_84628 ) ) ( not ( = ?auto_84621 ?auto_84627 ) ) ( not ( = ?auto_84621 ?auto_84625 ) ) ( not ( = ?auto_84622 ?auto_84627 ) ) ( not ( = ?auto_84622 ?auto_84625 ) ) ( not ( = ?auto_84623 ?auto_84627 ) ) ( not ( = ?auto_84623 ?auto_84625 ) ) ( not ( = ?auto_84628 ?auto_84627 ) ) ( not ( = ?auto_84628 ?auto_84625 ) ) ( not ( = ?auto_84627 ?auto_84625 ) ) ( ON ?auto_84627 ?auto_84628 ) ( not ( = ?auto_84624 ?auto_84626 ) ) ( not ( = ?auto_84624 ?auto_84625 ) ) ( not ( = ?auto_84626 ?auto_84625 ) ) ( not ( = ?auto_84621 ?auto_84626 ) ) ( not ( = ?auto_84621 ?auto_84624 ) ) ( not ( = ?auto_84622 ?auto_84626 ) ) ( not ( = ?auto_84622 ?auto_84624 ) ) ( not ( = ?auto_84623 ?auto_84626 ) ) ( not ( = ?auto_84623 ?auto_84624 ) ) ( not ( = ?auto_84628 ?auto_84626 ) ) ( not ( = ?auto_84628 ?auto_84624 ) ) ( not ( = ?auto_84627 ?auto_84626 ) ) ( not ( = ?auto_84627 ?auto_84624 ) ) ( ON ?auto_84625 ?auto_84627 ) ( ON ?auto_84626 ?auto_84625 ) ( ON ?auto_84624 ?auto_84626 ) ( CLEAR ?auto_84624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_84621 ?auto_84622 ?auto_84623 ?auto_84628 ?auto_84627 ?auto_84625 ?auto_84626 )
      ( MAKE-3PILE ?auto_84621 ?auto_84622 ?auto_84623 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_84634 - BLOCK
      ?auto_84635 - BLOCK
      ?auto_84636 - BLOCK
      ?auto_84637 - BLOCK
      ?auto_84638 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_84638 ) ( CLEAR ?auto_84637 ) ( ON-TABLE ?auto_84634 ) ( ON ?auto_84635 ?auto_84634 ) ( ON ?auto_84636 ?auto_84635 ) ( ON ?auto_84637 ?auto_84636 ) ( not ( = ?auto_84634 ?auto_84635 ) ) ( not ( = ?auto_84634 ?auto_84636 ) ) ( not ( = ?auto_84634 ?auto_84637 ) ) ( not ( = ?auto_84634 ?auto_84638 ) ) ( not ( = ?auto_84635 ?auto_84636 ) ) ( not ( = ?auto_84635 ?auto_84637 ) ) ( not ( = ?auto_84635 ?auto_84638 ) ) ( not ( = ?auto_84636 ?auto_84637 ) ) ( not ( = ?auto_84636 ?auto_84638 ) ) ( not ( = ?auto_84637 ?auto_84638 ) ) )
    :subtasks
    ( ( !STACK ?auto_84638 ?auto_84637 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_84639 - BLOCK
      ?auto_84640 - BLOCK
      ?auto_84641 - BLOCK
      ?auto_84642 - BLOCK
      ?auto_84643 - BLOCK
    )
    :vars
    (
      ?auto_84644 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_84642 ) ( ON-TABLE ?auto_84639 ) ( ON ?auto_84640 ?auto_84639 ) ( ON ?auto_84641 ?auto_84640 ) ( ON ?auto_84642 ?auto_84641 ) ( not ( = ?auto_84639 ?auto_84640 ) ) ( not ( = ?auto_84639 ?auto_84641 ) ) ( not ( = ?auto_84639 ?auto_84642 ) ) ( not ( = ?auto_84639 ?auto_84643 ) ) ( not ( = ?auto_84640 ?auto_84641 ) ) ( not ( = ?auto_84640 ?auto_84642 ) ) ( not ( = ?auto_84640 ?auto_84643 ) ) ( not ( = ?auto_84641 ?auto_84642 ) ) ( not ( = ?auto_84641 ?auto_84643 ) ) ( not ( = ?auto_84642 ?auto_84643 ) ) ( ON ?auto_84643 ?auto_84644 ) ( CLEAR ?auto_84643 ) ( HAND-EMPTY ) ( not ( = ?auto_84639 ?auto_84644 ) ) ( not ( = ?auto_84640 ?auto_84644 ) ) ( not ( = ?auto_84641 ?auto_84644 ) ) ( not ( = ?auto_84642 ?auto_84644 ) ) ( not ( = ?auto_84643 ?auto_84644 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_84643 ?auto_84644 )
      ( MAKE-5PILE ?auto_84639 ?auto_84640 ?auto_84641 ?auto_84642 ?auto_84643 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_84645 - BLOCK
      ?auto_84646 - BLOCK
      ?auto_84647 - BLOCK
      ?auto_84648 - BLOCK
      ?auto_84649 - BLOCK
    )
    :vars
    (
      ?auto_84650 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84645 ) ( ON ?auto_84646 ?auto_84645 ) ( ON ?auto_84647 ?auto_84646 ) ( not ( = ?auto_84645 ?auto_84646 ) ) ( not ( = ?auto_84645 ?auto_84647 ) ) ( not ( = ?auto_84645 ?auto_84648 ) ) ( not ( = ?auto_84645 ?auto_84649 ) ) ( not ( = ?auto_84646 ?auto_84647 ) ) ( not ( = ?auto_84646 ?auto_84648 ) ) ( not ( = ?auto_84646 ?auto_84649 ) ) ( not ( = ?auto_84647 ?auto_84648 ) ) ( not ( = ?auto_84647 ?auto_84649 ) ) ( not ( = ?auto_84648 ?auto_84649 ) ) ( ON ?auto_84649 ?auto_84650 ) ( CLEAR ?auto_84649 ) ( not ( = ?auto_84645 ?auto_84650 ) ) ( not ( = ?auto_84646 ?auto_84650 ) ) ( not ( = ?auto_84647 ?auto_84650 ) ) ( not ( = ?auto_84648 ?auto_84650 ) ) ( not ( = ?auto_84649 ?auto_84650 ) ) ( HOLDING ?auto_84648 ) ( CLEAR ?auto_84647 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_84645 ?auto_84646 ?auto_84647 ?auto_84648 )
      ( MAKE-5PILE ?auto_84645 ?auto_84646 ?auto_84647 ?auto_84648 ?auto_84649 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_84651 - BLOCK
      ?auto_84652 - BLOCK
      ?auto_84653 - BLOCK
      ?auto_84654 - BLOCK
      ?auto_84655 - BLOCK
    )
    :vars
    (
      ?auto_84656 - BLOCK
      ?auto_84658 - BLOCK
      ?auto_84657 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84651 ) ( ON ?auto_84652 ?auto_84651 ) ( ON ?auto_84653 ?auto_84652 ) ( not ( = ?auto_84651 ?auto_84652 ) ) ( not ( = ?auto_84651 ?auto_84653 ) ) ( not ( = ?auto_84651 ?auto_84654 ) ) ( not ( = ?auto_84651 ?auto_84655 ) ) ( not ( = ?auto_84652 ?auto_84653 ) ) ( not ( = ?auto_84652 ?auto_84654 ) ) ( not ( = ?auto_84652 ?auto_84655 ) ) ( not ( = ?auto_84653 ?auto_84654 ) ) ( not ( = ?auto_84653 ?auto_84655 ) ) ( not ( = ?auto_84654 ?auto_84655 ) ) ( ON ?auto_84655 ?auto_84656 ) ( not ( = ?auto_84651 ?auto_84656 ) ) ( not ( = ?auto_84652 ?auto_84656 ) ) ( not ( = ?auto_84653 ?auto_84656 ) ) ( not ( = ?auto_84654 ?auto_84656 ) ) ( not ( = ?auto_84655 ?auto_84656 ) ) ( CLEAR ?auto_84653 ) ( ON ?auto_84654 ?auto_84655 ) ( CLEAR ?auto_84654 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_84658 ) ( ON ?auto_84657 ?auto_84658 ) ( ON ?auto_84656 ?auto_84657 ) ( not ( = ?auto_84658 ?auto_84657 ) ) ( not ( = ?auto_84658 ?auto_84656 ) ) ( not ( = ?auto_84658 ?auto_84655 ) ) ( not ( = ?auto_84658 ?auto_84654 ) ) ( not ( = ?auto_84657 ?auto_84656 ) ) ( not ( = ?auto_84657 ?auto_84655 ) ) ( not ( = ?auto_84657 ?auto_84654 ) ) ( not ( = ?auto_84651 ?auto_84658 ) ) ( not ( = ?auto_84651 ?auto_84657 ) ) ( not ( = ?auto_84652 ?auto_84658 ) ) ( not ( = ?auto_84652 ?auto_84657 ) ) ( not ( = ?auto_84653 ?auto_84658 ) ) ( not ( = ?auto_84653 ?auto_84657 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_84658 ?auto_84657 ?auto_84656 ?auto_84655 )
      ( MAKE-5PILE ?auto_84651 ?auto_84652 ?auto_84653 ?auto_84654 ?auto_84655 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_84659 - BLOCK
      ?auto_84660 - BLOCK
      ?auto_84661 - BLOCK
      ?auto_84662 - BLOCK
      ?auto_84663 - BLOCK
    )
    :vars
    (
      ?auto_84665 - BLOCK
      ?auto_84666 - BLOCK
      ?auto_84664 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84659 ) ( ON ?auto_84660 ?auto_84659 ) ( not ( = ?auto_84659 ?auto_84660 ) ) ( not ( = ?auto_84659 ?auto_84661 ) ) ( not ( = ?auto_84659 ?auto_84662 ) ) ( not ( = ?auto_84659 ?auto_84663 ) ) ( not ( = ?auto_84660 ?auto_84661 ) ) ( not ( = ?auto_84660 ?auto_84662 ) ) ( not ( = ?auto_84660 ?auto_84663 ) ) ( not ( = ?auto_84661 ?auto_84662 ) ) ( not ( = ?auto_84661 ?auto_84663 ) ) ( not ( = ?auto_84662 ?auto_84663 ) ) ( ON ?auto_84663 ?auto_84665 ) ( not ( = ?auto_84659 ?auto_84665 ) ) ( not ( = ?auto_84660 ?auto_84665 ) ) ( not ( = ?auto_84661 ?auto_84665 ) ) ( not ( = ?auto_84662 ?auto_84665 ) ) ( not ( = ?auto_84663 ?auto_84665 ) ) ( ON ?auto_84662 ?auto_84663 ) ( CLEAR ?auto_84662 ) ( ON-TABLE ?auto_84666 ) ( ON ?auto_84664 ?auto_84666 ) ( ON ?auto_84665 ?auto_84664 ) ( not ( = ?auto_84666 ?auto_84664 ) ) ( not ( = ?auto_84666 ?auto_84665 ) ) ( not ( = ?auto_84666 ?auto_84663 ) ) ( not ( = ?auto_84666 ?auto_84662 ) ) ( not ( = ?auto_84664 ?auto_84665 ) ) ( not ( = ?auto_84664 ?auto_84663 ) ) ( not ( = ?auto_84664 ?auto_84662 ) ) ( not ( = ?auto_84659 ?auto_84666 ) ) ( not ( = ?auto_84659 ?auto_84664 ) ) ( not ( = ?auto_84660 ?auto_84666 ) ) ( not ( = ?auto_84660 ?auto_84664 ) ) ( not ( = ?auto_84661 ?auto_84666 ) ) ( not ( = ?auto_84661 ?auto_84664 ) ) ( HOLDING ?auto_84661 ) ( CLEAR ?auto_84660 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_84659 ?auto_84660 ?auto_84661 )
      ( MAKE-5PILE ?auto_84659 ?auto_84660 ?auto_84661 ?auto_84662 ?auto_84663 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_84667 - BLOCK
      ?auto_84668 - BLOCK
      ?auto_84669 - BLOCK
      ?auto_84670 - BLOCK
      ?auto_84671 - BLOCK
    )
    :vars
    (
      ?auto_84674 - BLOCK
      ?auto_84672 - BLOCK
      ?auto_84673 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84667 ) ( ON ?auto_84668 ?auto_84667 ) ( not ( = ?auto_84667 ?auto_84668 ) ) ( not ( = ?auto_84667 ?auto_84669 ) ) ( not ( = ?auto_84667 ?auto_84670 ) ) ( not ( = ?auto_84667 ?auto_84671 ) ) ( not ( = ?auto_84668 ?auto_84669 ) ) ( not ( = ?auto_84668 ?auto_84670 ) ) ( not ( = ?auto_84668 ?auto_84671 ) ) ( not ( = ?auto_84669 ?auto_84670 ) ) ( not ( = ?auto_84669 ?auto_84671 ) ) ( not ( = ?auto_84670 ?auto_84671 ) ) ( ON ?auto_84671 ?auto_84674 ) ( not ( = ?auto_84667 ?auto_84674 ) ) ( not ( = ?auto_84668 ?auto_84674 ) ) ( not ( = ?auto_84669 ?auto_84674 ) ) ( not ( = ?auto_84670 ?auto_84674 ) ) ( not ( = ?auto_84671 ?auto_84674 ) ) ( ON ?auto_84670 ?auto_84671 ) ( ON-TABLE ?auto_84672 ) ( ON ?auto_84673 ?auto_84672 ) ( ON ?auto_84674 ?auto_84673 ) ( not ( = ?auto_84672 ?auto_84673 ) ) ( not ( = ?auto_84672 ?auto_84674 ) ) ( not ( = ?auto_84672 ?auto_84671 ) ) ( not ( = ?auto_84672 ?auto_84670 ) ) ( not ( = ?auto_84673 ?auto_84674 ) ) ( not ( = ?auto_84673 ?auto_84671 ) ) ( not ( = ?auto_84673 ?auto_84670 ) ) ( not ( = ?auto_84667 ?auto_84672 ) ) ( not ( = ?auto_84667 ?auto_84673 ) ) ( not ( = ?auto_84668 ?auto_84672 ) ) ( not ( = ?auto_84668 ?auto_84673 ) ) ( not ( = ?auto_84669 ?auto_84672 ) ) ( not ( = ?auto_84669 ?auto_84673 ) ) ( CLEAR ?auto_84668 ) ( ON ?auto_84669 ?auto_84670 ) ( CLEAR ?auto_84669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_84672 ?auto_84673 ?auto_84674 ?auto_84671 ?auto_84670 )
      ( MAKE-5PILE ?auto_84667 ?auto_84668 ?auto_84669 ?auto_84670 ?auto_84671 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_84675 - BLOCK
      ?auto_84676 - BLOCK
      ?auto_84677 - BLOCK
      ?auto_84678 - BLOCK
      ?auto_84679 - BLOCK
    )
    :vars
    (
      ?auto_84682 - BLOCK
      ?auto_84681 - BLOCK
      ?auto_84680 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84675 ) ( not ( = ?auto_84675 ?auto_84676 ) ) ( not ( = ?auto_84675 ?auto_84677 ) ) ( not ( = ?auto_84675 ?auto_84678 ) ) ( not ( = ?auto_84675 ?auto_84679 ) ) ( not ( = ?auto_84676 ?auto_84677 ) ) ( not ( = ?auto_84676 ?auto_84678 ) ) ( not ( = ?auto_84676 ?auto_84679 ) ) ( not ( = ?auto_84677 ?auto_84678 ) ) ( not ( = ?auto_84677 ?auto_84679 ) ) ( not ( = ?auto_84678 ?auto_84679 ) ) ( ON ?auto_84679 ?auto_84682 ) ( not ( = ?auto_84675 ?auto_84682 ) ) ( not ( = ?auto_84676 ?auto_84682 ) ) ( not ( = ?auto_84677 ?auto_84682 ) ) ( not ( = ?auto_84678 ?auto_84682 ) ) ( not ( = ?auto_84679 ?auto_84682 ) ) ( ON ?auto_84678 ?auto_84679 ) ( ON-TABLE ?auto_84681 ) ( ON ?auto_84680 ?auto_84681 ) ( ON ?auto_84682 ?auto_84680 ) ( not ( = ?auto_84681 ?auto_84680 ) ) ( not ( = ?auto_84681 ?auto_84682 ) ) ( not ( = ?auto_84681 ?auto_84679 ) ) ( not ( = ?auto_84681 ?auto_84678 ) ) ( not ( = ?auto_84680 ?auto_84682 ) ) ( not ( = ?auto_84680 ?auto_84679 ) ) ( not ( = ?auto_84680 ?auto_84678 ) ) ( not ( = ?auto_84675 ?auto_84681 ) ) ( not ( = ?auto_84675 ?auto_84680 ) ) ( not ( = ?auto_84676 ?auto_84681 ) ) ( not ( = ?auto_84676 ?auto_84680 ) ) ( not ( = ?auto_84677 ?auto_84681 ) ) ( not ( = ?auto_84677 ?auto_84680 ) ) ( ON ?auto_84677 ?auto_84678 ) ( CLEAR ?auto_84677 ) ( HOLDING ?auto_84676 ) ( CLEAR ?auto_84675 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_84675 ?auto_84676 )
      ( MAKE-5PILE ?auto_84675 ?auto_84676 ?auto_84677 ?auto_84678 ?auto_84679 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_84683 - BLOCK
      ?auto_84684 - BLOCK
      ?auto_84685 - BLOCK
      ?auto_84686 - BLOCK
      ?auto_84687 - BLOCK
    )
    :vars
    (
      ?auto_84688 - BLOCK
      ?auto_84690 - BLOCK
      ?auto_84689 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84683 ) ( not ( = ?auto_84683 ?auto_84684 ) ) ( not ( = ?auto_84683 ?auto_84685 ) ) ( not ( = ?auto_84683 ?auto_84686 ) ) ( not ( = ?auto_84683 ?auto_84687 ) ) ( not ( = ?auto_84684 ?auto_84685 ) ) ( not ( = ?auto_84684 ?auto_84686 ) ) ( not ( = ?auto_84684 ?auto_84687 ) ) ( not ( = ?auto_84685 ?auto_84686 ) ) ( not ( = ?auto_84685 ?auto_84687 ) ) ( not ( = ?auto_84686 ?auto_84687 ) ) ( ON ?auto_84687 ?auto_84688 ) ( not ( = ?auto_84683 ?auto_84688 ) ) ( not ( = ?auto_84684 ?auto_84688 ) ) ( not ( = ?auto_84685 ?auto_84688 ) ) ( not ( = ?auto_84686 ?auto_84688 ) ) ( not ( = ?auto_84687 ?auto_84688 ) ) ( ON ?auto_84686 ?auto_84687 ) ( ON-TABLE ?auto_84690 ) ( ON ?auto_84689 ?auto_84690 ) ( ON ?auto_84688 ?auto_84689 ) ( not ( = ?auto_84690 ?auto_84689 ) ) ( not ( = ?auto_84690 ?auto_84688 ) ) ( not ( = ?auto_84690 ?auto_84687 ) ) ( not ( = ?auto_84690 ?auto_84686 ) ) ( not ( = ?auto_84689 ?auto_84688 ) ) ( not ( = ?auto_84689 ?auto_84687 ) ) ( not ( = ?auto_84689 ?auto_84686 ) ) ( not ( = ?auto_84683 ?auto_84690 ) ) ( not ( = ?auto_84683 ?auto_84689 ) ) ( not ( = ?auto_84684 ?auto_84690 ) ) ( not ( = ?auto_84684 ?auto_84689 ) ) ( not ( = ?auto_84685 ?auto_84690 ) ) ( not ( = ?auto_84685 ?auto_84689 ) ) ( ON ?auto_84685 ?auto_84686 ) ( CLEAR ?auto_84683 ) ( ON ?auto_84684 ?auto_84685 ) ( CLEAR ?auto_84684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_84690 ?auto_84689 ?auto_84688 ?auto_84687 ?auto_84686 ?auto_84685 )
      ( MAKE-5PILE ?auto_84683 ?auto_84684 ?auto_84685 ?auto_84686 ?auto_84687 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_84691 - BLOCK
      ?auto_84692 - BLOCK
      ?auto_84693 - BLOCK
      ?auto_84694 - BLOCK
      ?auto_84695 - BLOCK
    )
    :vars
    (
      ?auto_84698 - BLOCK
      ?auto_84697 - BLOCK
      ?auto_84696 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84691 ?auto_84692 ) ) ( not ( = ?auto_84691 ?auto_84693 ) ) ( not ( = ?auto_84691 ?auto_84694 ) ) ( not ( = ?auto_84691 ?auto_84695 ) ) ( not ( = ?auto_84692 ?auto_84693 ) ) ( not ( = ?auto_84692 ?auto_84694 ) ) ( not ( = ?auto_84692 ?auto_84695 ) ) ( not ( = ?auto_84693 ?auto_84694 ) ) ( not ( = ?auto_84693 ?auto_84695 ) ) ( not ( = ?auto_84694 ?auto_84695 ) ) ( ON ?auto_84695 ?auto_84698 ) ( not ( = ?auto_84691 ?auto_84698 ) ) ( not ( = ?auto_84692 ?auto_84698 ) ) ( not ( = ?auto_84693 ?auto_84698 ) ) ( not ( = ?auto_84694 ?auto_84698 ) ) ( not ( = ?auto_84695 ?auto_84698 ) ) ( ON ?auto_84694 ?auto_84695 ) ( ON-TABLE ?auto_84697 ) ( ON ?auto_84696 ?auto_84697 ) ( ON ?auto_84698 ?auto_84696 ) ( not ( = ?auto_84697 ?auto_84696 ) ) ( not ( = ?auto_84697 ?auto_84698 ) ) ( not ( = ?auto_84697 ?auto_84695 ) ) ( not ( = ?auto_84697 ?auto_84694 ) ) ( not ( = ?auto_84696 ?auto_84698 ) ) ( not ( = ?auto_84696 ?auto_84695 ) ) ( not ( = ?auto_84696 ?auto_84694 ) ) ( not ( = ?auto_84691 ?auto_84697 ) ) ( not ( = ?auto_84691 ?auto_84696 ) ) ( not ( = ?auto_84692 ?auto_84697 ) ) ( not ( = ?auto_84692 ?auto_84696 ) ) ( not ( = ?auto_84693 ?auto_84697 ) ) ( not ( = ?auto_84693 ?auto_84696 ) ) ( ON ?auto_84693 ?auto_84694 ) ( ON ?auto_84692 ?auto_84693 ) ( CLEAR ?auto_84692 ) ( HOLDING ?auto_84691 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_84691 )
      ( MAKE-5PILE ?auto_84691 ?auto_84692 ?auto_84693 ?auto_84694 ?auto_84695 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_84699 - BLOCK
      ?auto_84700 - BLOCK
      ?auto_84701 - BLOCK
      ?auto_84702 - BLOCK
      ?auto_84703 - BLOCK
    )
    :vars
    (
      ?auto_84704 - BLOCK
      ?auto_84705 - BLOCK
      ?auto_84706 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84699 ?auto_84700 ) ) ( not ( = ?auto_84699 ?auto_84701 ) ) ( not ( = ?auto_84699 ?auto_84702 ) ) ( not ( = ?auto_84699 ?auto_84703 ) ) ( not ( = ?auto_84700 ?auto_84701 ) ) ( not ( = ?auto_84700 ?auto_84702 ) ) ( not ( = ?auto_84700 ?auto_84703 ) ) ( not ( = ?auto_84701 ?auto_84702 ) ) ( not ( = ?auto_84701 ?auto_84703 ) ) ( not ( = ?auto_84702 ?auto_84703 ) ) ( ON ?auto_84703 ?auto_84704 ) ( not ( = ?auto_84699 ?auto_84704 ) ) ( not ( = ?auto_84700 ?auto_84704 ) ) ( not ( = ?auto_84701 ?auto_84704 ) ) ( not ( = ?auto_84702 ?auto_84704 ) ) ( not ( = ?auto_84703 ?auto_84704 ) ) ( ON ?auto_84702 ?auto_84703 ) ( ON-TABLE ?auto_84705 ) ( ON ?auto_84706 ?auto_84705 ) ( ON ?auto_84704 ?auto_84706 ) ( not ( = ?auto_84705 ?auto_84706 ) ) ( not ( = ?auto_84705 ?auto_84704 ) ) ( not ( = ?auto_84705 ?auto_84703 ) ) ( not ( = ?auto_84705 ?auto_84702 ) ) ( not ( = ?auto_84706 ?auto_84704 ) ) ( not ( = ?auto_84706 ?auto_84703 ) ) ( not ( = ?auto_84706 ?auto_84702 ) ) ( not ( = ?auto_84699 ?auto_84705 ) ) ( not ( = ?auto_84699 ?auto_84706 ) ) ( not ( = ?auto_84700 ?auto_84705 ) ) ( not ( = ?auto_84700 ?auto_84706 ) ) ( not ( = ?auto_84701 ?auto_84705 ) ) ( not ( = ?auto_84701 ?auto_84706 ) ) ( ON ?auto_84701 ?auto_84702 ) ( ON ?auto_84700 ?auto_84701 ) ( ON ?auto_84699 ?auto_84700 ) ( CLEAR ?auto_84699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_84705 ?auto_84706 ?auto_84704 ?auto_84703 ?auto_84702 ?auto_84701 ?auto_84700 )
      ( MAKE-5PILE ?auto_84699 ?auto_84700 ?auto_84701 ?auto_84702 ?auto_84703 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_84709 - BLOCK
      ?auto_84710 - BLOCK
    )
    :vars
    (
      ?auto_84711 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84711 ?auto_84710 ) ( CLEAR ?auto_84711 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_84709 ) ( ON ?auto_84710 ?auto_84709 ) ( not ( = ?auto_84709 ?auto_84710 ) ) ( not ( = ?auto_84709 ?auto_84711 ) ) ( not ( = ?auto_84710 ?auto_84711 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_84711 ?auto_84710 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_84712 - BLOCK
      ?auto_84713 - BLOCK
    )
    :vars
    (
      ?auto_84714 - BLOCK
      ?auto_84715 - BLOCK
      ?auto_84716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84714 ?auto_84713 ) ( CLEAR ?auto_84714 ) ( ON-TABLE ?auto_84712 ) ( ON ?auto_84713 ?auto_84712 ) ( not ( = ?auto_84712 ?auto_84713 ) ) ( not ( = ?auto_84712 ?auto_84714 ) ) ( not ( = ?auto_84713 ?auto_84714 ) ) ( HOLDING ?auto_84715 ) ( CLEAR ?auto_84716 ) ( not ( = ?auto_84712 ?auto_84715 ) ) ( not ( = ?auto_84712 ?auto_84716 ) ) ( not ( = ?auto_84713 ?auto_84715 ) ) ( not ( = ?auto_84713 ?auto_84716 ) ) ( not ( = ?auto_84714 ?auto_84715 ) ) ( not ( = ?auto_84714 ?auto_84716 ) ) ( not ( = ?auto_84715 ?auto_84716 ) ) )
    :subtasks
    ( ( !STACK ?auto_84715 ?auto_84716 )
      ( MAKE-2PILE ?auto_84712 ?auto_84713 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_84717 - BLOCK
      ?auto_84718 - BLOCK
    )
    :vars
    (
      ?auto_84720 - BLOCK
      ?auto_84721 - BLOCK
      ?auto_84719 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84720 ?auto_84718 ) ( ON-TABLE ?auto_84717 ) ( ON ?auto_84718 ?auto_84717 ) ( not ( = ?auto_84717 ?auto_84718 ) ) ( not ( = ?auto_84717 ?auto_84720 ) ) ( not ( = ?auto_84718 ?auto_84720 ) ) ( CLEAR ?auto_84721 ) ( not ( = ?auto_84717 ?auto_84719 ) ) ( not ( = ?auto_84717 ?auto_84721 ) ) ( not ( = ?auto_84718 ?auto_84719 ) ) ( not ( = ?auto_84718 ?auto_84721 ) ) ( not ( = ?auto_84720 ?auto_84719 ) ) ( not ( = ?auto_84720 ?auto_84721 ) ) ( not ( = ?auto_84719 ?auto_84721 ) ) ( ON ?auto_84719 ?auto_84720 ) ( CLEAR ?auto_84719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_84717 ?auto_84718 ?auto_84720 )
      ( MAKE-2PILE ?auto_84717 ?auto_84718 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_84722 - BLOCK
      ?auto_84723 - BLOCK
    )
    :vars
    (
      ?auto_84725 - BLOCK
      ?auto_84726 - BLOCK
      ?auto_84724 - BLOCK
      ?auto_84727 - BLOCK
      ?auto_84728 - BLOCK
      ?auto_84729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84725 ?auto_84723 ) ( ON-TABLE ?auto_84722 ) ( ON ?auto_84723 ?auto_84722 ) ( not ( = ?auto_84722 ?auto_84723 ) ) ( not ( = ?auto_84722 ?auto_84725 ) ) ( not ( = ?auto_84723 ?auto_84725 ) ) ( not ( = ?auto_84722 ?auto_84726 ) ) ( not ( = ?auto_84722 ?auto_84724 ) ) ( not ( = ?auto_84723 ?auto_84726 ) ) ( not ( = ?auto_84723 ?auto_84724 ) ) ( not ( = ?auto_84725 ?auto_84726 ) ) ( not ( = ?auto_84725 ?auto_84724 ) ) ( not ( = ?auto_84726 ?auto_84724 ) ) ( ON ?auto_84726 ?auto_84725 ) ( CLEAR ?auto_84726 ) ( HOLDING ?auto_84724 ) ( CLEAR ?auto_84727 ) ( ON-TABLE ?auto_84728 ) ( ON ?auto_84729 ?auto_84728 ) ( ON ?auto_84727 ?auto_84729 ) ( not ( = ?auto_84728 ?auto_84729 ) ) ( not ( = ?auto_84728 ?auto_84727 ) ) ( not ( = ?auto_84728 ?auto_84724 ) ) ( not ( = ?auto_84729 ?auto_84727 ) ) ( not ( = ?auto_84729 ?auto_84724 ) ) ( not ( = ?auto_84727 ?auto_84724 ) ) ( not ( = ?auto_84722 ?auto_84727 ) ) ( not ( = ?auto_84722 ?auto_84728 ) ) ( not ( = ?auto_84722 ?auto_84729 ) ) ( not ( = ?auto_84723 ?auto_84727 ) ) ( not ( = ?auto_84723 ?auto_84728 ) ) ( not ( = ?auto_84723 ?auto_84729 ) ) ( not ( = ?auto_84725 ?auto_84727 ) ) ( not ( = ?auto_84725 ?auto_84728 ) ) ( not ( = ?auto_84725 ?auto_84729 ) ) ( not ( = ?auto_84726 ?auto_84727 ) ) ( not ( = ?auto_84726 ?auto_84728 ) ) ( not ( = ?auto_84726 ?auto_84729 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_84728 ?auto_84729 ?auto_84727 ?auto_84724 )
      ( MAKE-2PILE ?auto_84722 ?auto_84723 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_84730 - BLOCK
      ?auto_84731 - BLOCK
    )
    :vars
    (
      ?auto_84733 - BLOCK
      ?auto_84732 - BLOCK
      ?auto_84734 - BLOCK
      ?auto_84736 - BLOCK
      ?auto_84737 - BLOCK
      ?auto_84735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84733 ?auto_84731 ) ( ON-TABLE ?auto_84730 ) ( ON ?auto_84731 ?auto_84730 ) ( not ( = ?auto_84730 ?auto_84731 ) ) ( not ( = ?auto_84730 ?auto_84733 ) ) ( not ( = ?auto_84731 ?auto_84733 ) ) ( not ( = ?auto_84730 ?auto_84732 ) ) ( not ( = ?auto_84730 ?auto_84734 ) ) ( not ( = ?auto_84731 ?auto_84732 ) ) ( not ( = ?auto_84731 ?auto_84734 ) ) ( not ( = ?auto_84733 ?auto_84732 ) ) ( not ( = ?auto_84733 ?auto_84734 ) ) ( not ( = ?auto_84732 ?auto_84734 ) ) ( ON ?auto_84732 ?auto_84733 ) ( CLEAR ?auto_84736 ) ( ON-TABLE ?auto_84737 ) ( ON ?auto_84735 ?auto_84737 ) ( ON ?auto_84736 ?auto_84735 ) ( not ( = ?auto_84737 ?auto_84735 ) ) ( not ( = ?auto_84737 ?auto_84736 ) ) ( not ( = ?auto_84737 ?auto_84734 ) ) ( not ( = ?auto_84735 ?auto_84736 ) ) ( not ( = ?auto_84735 ?auto_84734 ) ) ( not ( = ?auto_84736 ?auto_84734 ) ) ( not ( = ?auto_84730 ?auto_84736 ) ) ( not ( = ?auto_84730 ?auto_84737 ) ) ( not ( = ?auto_84730 ?auto_84735 ) ) ( not ( = ?auto_84731 ?auto_84736 ) ) ( not ( = ?auto_84731 ?auto_84737 ) ) ( not ( = ?auto_84731 ?auto_84735 ) ) ( not ( = ?auto_84733 ?auto_84736 ) ) ( not ( = ?auto_84733 ?auto_84737 ) ) ( not ( = ?auto_84733 ?auto_84735 ) ) ( not ( = ?auto_84732 ?auto_84736 ) ) ( not ( = ?auto_84732 ?auto_84737 ) ) ( not ( = ?auto_84732 ?auto_84735 ) ) ( ON ?auto_84734 ?auto_84732 ) ( CLEAR ?auto_84734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_84730 ?auto_84731 ?auto_84733 ?auto_84732 )
      ( MAKE-2PILE ?auto_84730 ?auto_84731 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_84738 - BLOCK
      ?auto_84739 - BLOCK
    )
    :vars
    (
      ?auto_84740 - BLOCK
      ?auto_84742 - BLOCK
      ?auto_84744 - BLOCK
      ?auto_84741 - BLOCK
      ?auto_84743 - BLOCK
      ?auto_84745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84740 ?auto_84739 ) ( ON-TABLE ?auto_84738 ) ( ON ?auto_84739 ?auto_84738 ) ( not ( = ?auto_84738 ?auto_84739 ) ) ( not ( = ?auto_84738 ?auto_84740 ) ) ( not ( = ?auto_84739 ?auto_84740 ) ) ( not ( = ?auto_84738 ?auto_84742 ) ) ( not ( = ?auto_84738 ?auto_84744 ) ) ( not ( = ?auto_84739 ?auto_84742 ) ) ( not ( = ?auto_84739 ?auto_84744 ) ) ( not ( = ?auto_84740 ?auto_84742 ) ) ( not ( = ?auto_84740 ?auto_84744 ) ) ( not ( = ?auto_84742 ?auto_84744 ) ) ( ON ?auto_84742 ?auto_84740 ) ( ON-TABLE ?auto_84741 ) ( ON ?auto_84743 ?auto_84741 ) ( not ( = ?auto_84741 ?auto_84743 ) ) ( not ( = ?auto_84741 ?auto_84745 ) ) ( not ( = ?auto_84741 ?auto_84744 ) ) ( not ( = ?auto_84743 ?auto_84745 ) ) ( not ( = ?auto_84743 ?auto_84744 ) ) ( not ( = ?auto_84745 ?auto_84744 ) ) ( not ( = ?auto_84738 ?auto_84745 ) ) ( not ( = ?auto_84738 ?auto_84741 ) ) ( not ( = ?auto_84738 ?auto_84743 ) ) ( not ( = ?auto_84739 ?auto_84745 ) ) ( not ( = ?auto_84739 ?auto_84741 ) ) ( not ( = ?auto_84739 ?auto_84743 ) ) ( not ( = ?auto_84740 ?auto_84745 ) ) ( not ( = ?auto_84740 ?auto_84741 ) ) ( not ( = ?auto_84740 ?auto_84743 ) ) ( not ( = ?auto_84742 ?auto_84745 ) ) ( not ( = ?auto_84742 ?auto_84741 ) ) ( not ( = ?auto_84742 ?auto_84743 ) ) ( ON ?auto_84744 ?auto_84742 ) ( CLEAR ?auto_84744 ) ( HOLDING ?auto_84745 ) ( CLEAR ?auto_84743 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_84741 ?auto_84743 ?auto_84745 )
      ( MAKE-2PILE ?auto_84738 ?auto_84739 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_84746 - BLOCK
      ?auto_84747 - BLOCK
    )
    :vars
    (
      ?auto_84753 - BLOCK
      ?auto_84749 - BLOCK
      ?auto_84750 - BLOCK
      ?auto_84752 - BLOCK
      ?auto_84751 - BLOCK
      ?auto_84748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84753 ?auto_84747 ) ( ON-TABLE ?auto_84746 ) ( ON ?auto_84747 ?auto_84746 ) ( not ( = ?auto_84746 ?auto_84747 ) ) ( not ( = ?auto_84746 ?auto_84753 ) ) ( not ( = ?auto_84747 ?auto_84753 ) ) ( not ( = ?auto_84746 ?auto_84749 ) ) ( not ( = ?auto_84746 ?auto_84750 ) ) ( not ( = ?auto_84747 ?auto_84749 ) ) ( not ( = ?auto_84747 ?auto_84750 ) ) ( not ( = ?auto_84753 ?auto_84749 ) ) ( not ( = ?auto_84753 ?auto_84750 ) ) ( not ( = ?auto_84749 ?auto_84750 ) ) ( ON ?auto_84749 ?auto_84753 ) ( ON-TABLE ?auto_84752 ) ( ON ?auto_84751 ?auto_84752 ) ( not ( = ?auto_84752 ?auto_84751 ) ) ( not ( = ?auto_84752 ?auto_84748 ) ) ( not ( = ?auto_84752 ?auto_84750 ) ) ( not ( = ?auto_84751 ?auto_84748 ) ) ( not ( = ?auto_84751 ?auto_84750 ) ) ( not ( = ?auto_84748 ?auto_84750 ) ) ( not ( = ?auto_84746 ?auto_84748 ) ) ( not ( = ?auto_84746 ?auto_84752 ) ) ( not ( = ?auto_84746 ?auto_84751 ) ) ( not ( = ?auto_84747 ?auto_84748 ) ) ( not ( = ?auto_84747 ?auto_84752 ) ) ( not ( = ?auto_84747 ?auto_84751 ) ) ( not ( = ?auto_84753 ?auto_84748 ) ) ( not ( = ?auto_84753 ?auto_84752 ) ) ( not ( = ?auto_84753 ?auto_84751 ) ) ( not ( = ?auto_84749 ?auto_84748 ) ) ( not ( = ?auto_84749 ?auto_84752 ) ) ( not ( = ?auto_84749 ?auto_84751 ) ) ( ON ?auto_84750 ?auto_84749 ) ( CLEAR ?auto_84751 ) ( ON ?auto_84748 ?auto_84750 ) ( CLEAR ?auto_84748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_84746 ?auto_84747 ?auto_84753 ?auto_84749 ?auto_84750 )
      ( MAKE-2PILE ?auto_84746 ?auto_84747 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_84754 - BLOCK
      ?auto_84755 - BLOCK
    )
    :vars
    (
      ?auto_84758 - BLOCK
      ?auto_84756 - BLOCK
      ?auto_84759 - BLOCK
      ?auto_84761 - BLOCK
      ?auto_84760 - BLOCK
      ?auto_84757 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84758 ?auto_84755 ) ( ON-TABLE ?auto_84754 ) ( ON ?auto_84755 ?auto_84754 ) ( not ( = ?auto_84754 ?auto_84755 ) ) ( not ( = ?auto_84754 ?auto_84758 ) ) ( not ( = ?auto_84755 ?auto_84758 ) ) ( not ( = ?auto_84754 ?auto_84756 ) ) ( not ( = ?auto_84754 ?auto_84759 ) ) ( not ( = ?auto_84755 ?auto_84756 ) ) ( not ( = ?auto_84755 ?auto_84759 ) ) ( not ( = ?auto_84758 ?auto_84756 ) ) ( not ( = ?auto_84758 ?auto_84759 ) ) ( not ( = ?auto_84756 ?auto_84759 ) ) ( ON ?auto_84756 ?auto_84758 ) ( ON-TABLE ?auto_84761 ) ( not ( = ?auto_84761 ?auto_84760 ) ) ( not ( = ?auto_84761 ?auto_84757 ) ) ( not ( = ?auto_84761 ?auto_84759 ) ) ( not ( = ?auto_84760 ?auto_84757 ) ) ( not ( = ?auto_84760 ?auto_84759 ) ) ( not ( = ?auto_84757 ?auto_84759 ) ) ( not ( = ?auto_84754 ?auto_84757 ) ) ( not ( = ?auto_84754 ?auto_84761 ) ) ( not ( = ?auto_84754 ?auto_84760 ) ) ( not ( = ?auto_84755 ?auto_84757 ) ) ( not ( = ?auto_84755 ?auto_84761 ) ) ( not ( = ?auto_84755 ?auto_84760 ) ) ( not ( = ?auto_84758 ?auto_84757 ) ) ( not ( = ?auto_84758 ?auto_84761 ) ) ( not ( = ?auto_84758 ?auto_84760 ) ) ( not ( = ?auto_84756 ?auto_84757 ) ) ( not ( = ?auto_84756 ?auto_84761 ) ) ( not ( = ?auto_84756 ?auto_84760 ) ) ( ON ?auto_84759 ?auto_84756 ) ( ON ?auto_84757 ?auto_84759 ) ( CLEAR ?auto_84757 ) ( HOLDING ?auto_84760 ) ( CLEAR ?auto_84761 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_84761 ?auto_84760 )
      ( MAKE-2PILE ?auto_84754 ?auto_84755 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_84762 - BLOCK
      ?auto_84763 - BLOCK
    )
    :vars
    (
      ?auto_84766 - BLOCK
      ?auto_84769 - BLOCK
      ?auto_84765 - BLOCK
      ?auto_84764 - BLOCK
      ?auto_84768 - BLOCK
      ?auto_84767 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84766 ?auto_84763 ) ( ON-TABLE ?auto_84762 ) ( ON ?auto_84763 ?auto_84762 ) ( not ( = ?auto_84762 ?auto_84763 ) ) ( not ( = ?auto_84762 ?auto_84766 ) ) ( not ( = ?auto_84763 ?auto_84766 ) ) ( not ( = ?auto_84762 ?auto_84769 ) ) ( not ( = ?auto_84762 ?auto_84765 ) ) ( not ( = ?auto_84763 ?auto_84769 ) ) ( not ( = ?auto_84763 ?auto_84765 ) ) ( not ( = ?auto_84766 ?auto_84769 ) ) ( not ( = ?auto_84766 ?auto_84765 ) ) ( not ( = ?auto_84769 ?auto_84765 ) ) ( ON ?auto_84769 ?auto_84766 ) ( ON-TABLE ?auto_84764 ) ( not ( = ?auto_84764 ?auto_84768 ) ) ( not ( = ?auto_84764 ?auto_84767 ) ) ( not ( = ?auto_84764 ?auto_84765 ) ) ( not ( = ?auto_84768 ?auto_84767 ) ) ( not ( = ?auto_84768 ?auto_84765 ) ) ( not ( = ?auto_84767 ?auto_84765 ) ) ( not ( = ?auto_84762 ?auto_84767 ) ) ( not ( = ?auto_84762 ?auto_84764 ) ) ( not ( = ?auto_84762 ?auto_84768 ) ) ( not ( = ?auto_84763 ?auto_84767 ) ) ( not ( = ?auto_84763 ?auto_84764 ) ) ( not ( = ?auto_84763 ?auto_84768 ) ) ( not ( = ?auto_84766 ?auto_84767 ) ) ( not ( = ?auto_84766 ?auto_84764 ) ) ( not ( = ?auto_84766 ?auto_84768 ) ) ( not ( = ?auto_84769 ?auto_84767 ) ) ( not ( = ?auto_84769 ?auto_84764 ) ) ( not ( = ?auto_84769 ?auto_84768 ) ) ( ON ?auto_84765 ?auto_84769 ) ( ON ?auto_84767 ?auto_84765 ) ( CLEAR ?auto_84764 ) ( ON ?auto_84768 ?auto_84767 ) ( CLEAR ?auto_84768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_84762 ?auto_84763 ?auto_84766 ?auto_84769 ?auto_84765 ?auto_84767 )
      ( MAKE-2PILE ?auto_84762 ?auto_84763 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_84770 - BLOCK
      ?auto_84771 - BLOCK
    )
    :vars
    (
      ?auto_84776 - BLOCK
      ?auto_84772 - BLOCK
      ?auto_84777 - BLOCK
      ?auto_84773 - BLOCK
      ?auto_84775 - BLOCK
      ?auto_84774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84776 ?auto_84771 ) ( ON-TABLE ?auto_84770 ) ( ON ?auto_84771 ?auto_84770 ) ( not ( = ?auto_84770 ?auto_84771 ) ) ( not ( = ?auto_84770 ?auto_84776 ) ) ( not ( = ?auto_84771 ?auto_84776 ) ) ( not ( = ?auto_84770 ?auto_84772 ) ) ( not ( = ?auto_84770 ?auto_84777 ) ) ( not ( = ?auto_84771 ?auto_84772 ) ) ( not ( = ?auto_84771 ?auto_84777 ) ) ( not ( = ?auto_84776 ?auto_84772 ) ) ( not ( = ?auto_84776 ?auto_84777 ) ) ( not ( = ?auto_84772 ?auto_84777 ) ) ( ON ?auto_84772 ?auto_84776 ) ( not ( = ?auto_84773 ?auto_84775 ) ) ( not ( = ?auto_84773 ?auto_84774 ) ) ( not ( = ?auto_84773 ?auto_84777 ) ) ( not ( = ?auto_84775 ?auto_84774 ) ) ( not ( = ?auto_84775 ?auto_84777 ) ) ( not ( = ?auto_84774 ?auto_84777 ) ) ( not ( = ?auto_84770 ?auto_84774 ) ) ( not ( = ?auto_84770 ?auto_84773 ) ) ( not ( = ?auto_84770 ?auto_84775 ) ) ( not ( = ?auto_84771 ?auto_84774 ) ) ( not ( = ?auto_84771 ?auto_84773 ) ) ( not ( = ?auto_84771 ?auto_84775 ) ) ( not ( = ?auto_84776 ?auto_84774 ) ) ( not ( = ?auto_84776 ?auto_84773 ) ) ( not ( = ?auto_84776 ?auto_84775 ) ) ( not ( = ?auto_84772 ?auto_84774 ) ) ( not ( = ?auto_84772 ?auto_84773 ) ) ( not ( = ?auto_84772 ?auto_84775 ) ) ( ON ?auto_84777 ?auto_84772 ) ( ON ?auto_84774 ?auto_84777 ) ( ON ?auto_84775 ?auto_84774 ) ( CLEAR ?auto_84775 ) ( HOLDING ?auto_84773 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_84773 )
      ( MAKE-2PILE ?auto_84770 ?auto_84771 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_84778 - BLOCK
      ?auto_84779 - BLOCK
    )
    :vars
    (
      ?auto_84785 - BLOCK
      ?auto_84784 - BLOCK
      ?auto_84783 - BLOCK
      ?auto_84782 - BLOCK
      ?auto_84780 - BLOCK
      ?auto_84781 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84785 ?auto_84779 ) ( ON-TABLE ?auto_84778 ) ( ON ?auto_84779 ?auto_84778 ) ( not ( = ?auto_84778 ?auto_84779 ) ) ( not ( = ?auto_84778 ?auto_84785 ) ) ( not ( = ?auto_84779 ?auto_84785 ) ) ( not ( = ?auto_84778 ?auto_84784 ) ) ( not ( = ?auto_84778 ?auto_84783 ) ) ( not ( = ?auto_84779 ?auto_84784 ) ) ( not ( = ?auto_84779 ?auto_84783 ) ) ( not ( = ?auto_84785 ?auto_84784 ) ) ( not ( = ?auto_84785 ?auto_84783 ) ) ( not ( = ?auto_84784 ?auto_84783 ) ) ( ON ?auto_84784 ?auto_84785 ) ( not ( = ?auto_84782 ?auto_84780 ) ) ( not ( = ?auto_84782 ?auto_84781 ) ) ( not ( = ?auto_84782 ?auto_84783 ) ) ( not ( = ?auto_84780 ?auto_84781 ) ) ( not ( = ?auto_84780 ?auto_84783 ) ) ( not ( = ?auto_84781 ?auto_84783 ) ) ( not ( = ?auto_84778 ?auto_84781 ) ) ( not ( = ?auto_84778 ?auto_84782 ) ) ( not ( = ?auto_84778 ?auto_84780 ) ) ( not ( = ?auto_84779 ?auto_84781 ) ) ( not ( = ?auto_84779 ?auto_84782 ) ) ( not ( = ?auto_84779 ?auto_84780 ) ) ( not ( = ?auto_84785 ?auto_84781 ) ) ( not ( = ?auto_84785 ?auto_84782 ) ) ( not ( = ?auto_84785 ?auto_84780 ) ) ( not ( = ?auto_84784 ?auto_84781 ) ) ( not ( = ?auto_84784 ?auto_84782 ) ) ( not ( = ?auto_84784 ?auto_84780 ) ) ( ON ?auto_84783 ?auto_84784 ) ( ON ?auto_84781 ?auto_84783 ) ( ON ?auto_84780 ?auto_84781 ) ( ON ?auto_84782 ?auto_84780 ) ( CLEAR ?auto_84782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_84778 ?auto_84779 ?auto_84785 ?auto_84784 ?auto_84783 ?auto_84781 ?auto_84780 )
      ( MAKE-2PILE ?auto_84778 ?auto_84779 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84792 - BLOCK
      ?auto_84793 - BLOCK
      ?auto_84794 - BLOCK
      ?auto_84795 - BLOCK
      ?auto_84796 - BLOCK
      ?auto_84797 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_84797 ) ( CLEAR ?auto_84796 ) ( ON-TABLE ?auto_84792 ) ( ON ?auto_84793 ?auto_84792 ) ( ON ?auto_84794 ?auto_84793 ) ( ON ?auto_84795 ?auto_84794 ) ( ON ?auto_84796 ?auto_84795 ) ( not ( = ?auto_84792 ?auto_84793 ) ) ( not ( = ?auto_84792 ?auto_84794 ) ) ( not ( = ?auto_84792 ?auto_84795 ) ) ( not ( = ?auto_84792 ?auto_84796 ) ) ( not ( = ?auto_84792 ?auto_84797 ) ) ( not ( = ?auto_84793 ?auto_84794 ) ) ( not ( = ?auto_84793 ?auto_84795 ) ) ( not ( = ?auto_84793 ?auto_84796 ) ) ( not ( = ?auto_84793 ?auto_84797 ) ) ( not ( = ?auto_84794 ?auto_84795 ) ) ( not ( = ?auto_84794 ?auto_84796 ) ) ( not ( = ?auto_84794 ?auto_84797 ) ) ( not ( = ?auto_84795 ?auto_84796 ) ) ( not ( = ?auto_84795 ?auto_84797 ) ) ( not ( = ?auto_84796 ?auto_84797 ) ) )
    :subtasks
    ( ( !STACK ?auto_84797 ?auto_84796 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84798 - BLOCK
      ?auto_84799 - BLOCK
      ?auto_84800 - BLOCK
      ?auto_84801 - BLOCK
      ?auto_84802 - BLOCK
      ?auto_84803 - BLOCK
    )
    :vars
    (
      ?auto_84804 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_84802 ) ( ON-TABLE ?auto_84798 ) ( ON ?auto_84799 ?auto_84798 ) ( ON ?auto_84800 ?auto_84799 ) ( ON ?auto_84801 ?auto_84800 ) ( ON ?auto_84802 ?auto_84801 ) ( not ( = ?auto_84798 ?auto_84799 ) ) ( not ( = ?auto_84798 ?auto_84800 ) ) ( not ( = ?auto_84798 ?auto_84801 ) ) ( not ( = ?auto_84798 ?auto_84802 ) ) ( not ( = ?auto_84798 ?auto_84803 ) ) ( not ( = ?auto_84799 ?auto_84800 ) ) ( not ( = ?auto_84799 ?auto_84801 ) ) ( not ( = ?auto_84799 ?auto_84802 ) ) ( not ( = ?auto_84799 ?auto_84803 ) ) ( not ( = ?auto_84800 ?auto_84801 ) ) ( not ( = ?auto_84800 ?auto_84802 ) ) ( not ( = ?auto_84800 ?auto_84803 ) ) ( not ( = ?auto_84801 ?auto_84802 ) ) ( not ( = ?auto_84801 ?auto_84803 ) ) ( not ( = ?auto_84802 ?auto_84803 ) ) ( ON ?auto_84803 ?auto_84804 ) ( CLEAR ?auto_84803 ) ( HAND-EMPTY ) ( not ( = ?auto_84798 ?auto_84804 ) ) ( not ( = ?auto_84799 ?auto_84804 ) ) ( not ( = ?auto_84800 ?auto_84804 ) ) ( not ( = ?auto_84801 ?auto_84804 ) ) ( not ( = ?auto_84802 ?auto_84804 ) ) ( not ( = ?auto_84803 ?auto_84804 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_84803 ?auto_84804 )
      ( MAKE-6PILE ?auto_84798 ?auto_84799 ?auto_84800 ?auto_84801 ?auto_84802 ?auto_84803 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84805 - BLOCK
      ?auto_84806 - BLOCK
      ?auto_84807 - BLOCK
      ?auto_84808 - BLOCK
      ?auto_84809 - BLOCK
      ?auto_84810 - BLOCK
    )
    :vars
    (
      ?auto_84811 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84805 ) ( ON ?auto_84806 ?auto_84805 ) ( ON ?auto_84807 ?auto_84806 ) ( ON ?auto_84808 ?auto_84807 ) ( not ( = ?auto_84805 ?auto_84806 ) ) ( not ( = ?auto_84805 ?auto_84807 ) ) ( not ( = ?auto_84805 ?auto_84808 ) ) ( not ( = ?auto_84805 ?auto_84809 ) ) ( not ( = ?auto_84805 ?auto_84810 ) ) ( not ( = ?auto_84806 ?auto_84807 ) ) ( not ( = ?auto_84806 ?auto_84808 ) ) ( not ( = ?auto_84806 ?auto_84809 ) ) ( not ( = ?auto_84806 ?auto_84810 ) ) ( not ( = ?auto_84807 ?auto_84808 ) ) ( not ( = ?auto_84807 ?auto_84809 ) ) ( not ( = ?auto_84807 ?auto_84810 ) ) ( not ( = ?auto_84808 ?auto_84809 ) ) ( not ( = ?auto_84808 ?auto_84810 ) ) ( not ( = ?auto_84809 ?auto_84810 ) ) ( ON ?auto_84810 ?auto_84811 ) ( CLEAR ?auto_84810 ) ( not ( = ?auto_84805 ?auto_84811 ) ) ( not ( = ?auto_84806 ?auto_84811 ) ) ( not ( = ?auto_84807 ?auto_84811 ) ) ( not ( = ?auto_84808 ?auto_84811 ) ) ( not ( = ?auto_84809 ?auto_84811 ) ) ( not ( = ?auto_84810 ?auto_84811 ) ) ( HOLDING ?auto_84809 ) ( CLEAR ?auto_84808 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_84805 ?auto_84806 ?auto_84807 ?auto_84808 ?auto_84809 )
      ( MAKE-6PILE ?auto_84805 ?auto_84806 ?auto_84807 ?auto_84808 ?auto_84809 ?auto_84810 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84812 - BLOCK
      ?auto_84813 - BLOCK
      ?auto_84814 - BLOCK
      ?auto_84815 - BLOCK
      ?auto_84816 - BLOCK
      ?auto_84817 - BLOCK
    )
    :vars
    (
      ?auto_84818 - BLOCK
      ?auto_84819 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84812 ) ( ON ?auto_84813 ?auto_84812 ) ( ON ?auto_84814 ?auto_84813 ) ( ON ?auto_84815 ?auto_84814 ) ( not ( = ?auto_84812 ?auto_84813 ) ) ( not ( = ?auto_84812 ?auto_84814 ) ) ( not ( = ?auto_84812 ?auto_84815 ) ) ( not ( = ?auto_84812 ?auto_84816 ) ) ( not ( = ?auto_84812 ?auto_84817 ) ) ( not ( = ?auto_84813 ?auto_84814 ) ) ( not ( = ?auto_84813 ?auto_84815 ) ) ( not ( = ?auto_84813 ?auto_84816 ) ) ( not ( = ?auto_84813 ?auto_84817 ) ) ( not ( = ?auto_84814 ?auto_84815 ) ) ( not ( = ?auto_84814 ?auto_84816 ) ) ( not ( = ?auto_84814 ?auto_84817 ) ) ( not ( = ?auto_84815 ?auto_84816 ) ) ( not ( = ?auto_84815 ?auto_84817 ) ) ( not ( = ?auto_84816 ?auto_84817 ) ) ( ON ?auto_84817 ?auto_84818 ) ( not ( = ?auto_84812 ?auto_84818 ) ) ( not ( = ?auto_84813 ?auto_84818 ) ) ( not ( = ?auto_84814 ?auto_84818 ) ) ( not ( = ?auto_84815 ?auto_84818 ) ) ( not ( = ?auto_84816 ?auto_84818 ) ) ( not ( = ?auto_84817 ?auto_84818 ) ) ( CLEAR ?auto_84815 ) ( ON ?auto_84816 ?auto_84817 ) ( CLEAR ?auto_84816 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_84819 ) ( ON ?auto_84818 ?auto_84819 ) ( not ( = ?auto_84819 ?auto_84818 ) ) ( not ( = ?auto_84819 ?auto_84817 ) ) ( not ( = ?auto_84819 ?auto_84816 ) ) ( not ( = ?auto_84812 ?auto_84819 ) ) ( not ( = ?auto_84813 ?auto_84819 ) ) ( not ( = ?auto_84814 ?auto_84819 ) ) ( not ( = ?auto_84815 ?auto_84819 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_84819 ?auto_84818 ?auto_84817 )
      ( MAKE-6PILE ?auto_84812 ?auto_84813 ?auto_84814 ?auto_84815 ?auto_84816 ?auto_84817 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84820 - BLOCK
      ?auto_84821 - BLOCK
      ?auto_84822 - BLOCK
      ?auto_84823 - BLOCK
      ?auto_84824 - BLOCK
      ?auto_84825 - BLOCK
    )
    :vars
    (
      ?auto_84827 - BLOCK
      ?auto_84826 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84820 ) ( ON ?auto_84821 ?auto_84820 ) ( ON ?auto_84822 ?auto_84821 ) ( not ( = ?auto_84820 ?auto_84821 ) ) ( not ( = ?auto_84820 ?auto_84822 ) ) ( not ( = ?auto_84820 ?auto_84823 ) ) ( not ( = ?auto_84820 ?auto_84824 ) ) ( not ( = ?auto_84820 ?auto_84825 ) ) ( not ( = ?auto_84821 ?auto_84822 ) ) ( not ( = ?auto_84821 ?auto_84823 ) ) ( not ( = ?auto_84821 ?auto_84824 ) ) ( not ( = ?auto_84821 ?auto_84825 ) ) ( not ( = ?auto_84822 ?auto_84823 ) ) ( not ( = ?auto_84822 ?auto_84824 ) ) ( not ( = ?auto_84822 ?auto_84825 ) ) ( not ( = ?auto_84823 ?auto_84824 ) ) ( not ( = ?auto_84823 ?auto_84825 ) ) ( not ( = ?auto_84824 ?auto_84825 ) ) ( ON ?auto_84825 ?auto_84827 ) ( not ( = ?auto_84820 ?auto_84827 ) ) ( not ( = ?auto_84821 ?auto_84827 ) ) ( not ( = ?auto_84822 ?auto_84827 ) ) ( not ( = ?auto_84823 ?auto_84827 ) ) ( not ( = ?auto_84824 ?auto_84827 ) ) ( not ( = ?auto_84825 ?auto_84827 ) ) ( ON ?auto_84824 ?auto_84825 ) ( CLEAR ?auto_84824 ) ( ON-TABLE ?auto_84826 ) ( ON ?auto_84827 ?auto_84826 ) ( not ( = ?auto_84826 ?auto_84827 ) ) ( not ( = ?auto_84826 ?auto_84825 ) ) ( not ( = ?auto_84826 ?auto_84824 ) ) ( not ( = ?auto_84820 ?auto_84826 ) ) ( not ( = ?auto_84821 ?auto_84826 ) ) ( not ( = ?auto_84822 ?auto_84826 ) ) ( not ( = ?auto_84823 ?auto_84826 ) ) ( HOLDING ?auto_84823 ) ( CLEAR ?auto_84822 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_84820 ?auto_84821 ?auto_84822 ?auto_84823 )
      ( MAKE-6PILE ?auto_84820 ?auto_84821 ?auto_84822 ?auto_84823 ?auto_84824 ?auto_84825 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84828 - BLOCK
      ?auto_84829 - BLOCK
      ?auto_84830 - BLOCK
      ?auto_84831 - BLOCK
      ?auto_84832 - BLOCK
      ?auto_84833 - BLOCK
    )
    :vars
    (
      ?auto_84834 - BLOCK
      ?auto_84835 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84828 ) ( ON ?auto_84829 ?auto_84828 ) ( ON ?auto_84830 ?auto_84829 ) ( not ( = ?auto_84828 ?auto_84829 ) ) ( not ( = ?auto_84828 ?auto_84830 ) ) ( not ( = ?auto_84828 ?auto_84831 ) ) ( not ( = ?auto_84828 ?auto_84832 ) ) ( not ( = ?auto_84828 ?auto_84833 ) ) ( not ( = ?auto_84829 ?auto_84830 ) ) ( not ( = ?auto_84829 ?auto_84831 ) ) ( not ( = ?auto_84829 ?auto_84832 ) ) ( not ( = ?auto_84829 ?auto_84833 ) ) ( not ( = ?auto_84830 ?auto_84831 ) ) ( not ( = ?auto_84830 ?auto_84832 ) ) ( not ( = ?auto_84830 ?auto_84833 ) ) ( not ( = ?auto_84831 ?auto_84832 ) ) ( not ( = ?auto_84831 ?auto_84833 ) ) ( not ( = ?auto_84832 ?auto_84833 ) ) ( ON ?auto_84833 ?auto_84834 ) ( not ( = ?auto_84828 ?auto_84834 ) ) ( not ( = ?auto_84829 ?auto_84834 ) ) ( not ( = ?auto_84830 ?auto_84834 ) ) ( not ( = ?auto_84831 ?auto_84834 ) ) ( not ( = ?auto_84832 ?auto_84834 ) ) ( not ( = ?auto_84833 ?auto_84834 ) ) ( ON ?auto_84832 ?auto_84833 ) ( ON-TABLE ?auto_84835 ) ( ON ?auto_84834 ?auto_84835 ) ( not ( = ?auto_84835 ?auto_84834 ) ) ( not ( = ?auto_84835 ?auto_84833 ) ) ( not ( = ?auto_84835 ?auto_84832 ) ) ( not ( = ?auto_84828 ?auto_84835 ) ) ( not ( = ?auto_84829 ?auto_84835 ) ) ( not ( = ?auto_84830 ?auto_84835 ) ) ( not ( = ?auto_84831 ?auto_84835 ) ) ( CLEAR ?auto_84830 ) ( ON ?auto_84831 ?auto_84832 ) ( CLEAR ?auto_84831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_84835 ?auto_84834 ?auto_84833 ?auto_84832 )
      ( MAKE-6PILE ?auto_84828 ?auto_84829 ?auto_84830 ?auto_84831 ?auto_84832 ?auto_84833 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84836 - BLOCK
      ?auto_84837 - BLOCK
      ?auto_84838 - BLOCK
      ?auto_84839 - BLOCK
      ?auto_84840 - BLOCK
      ?auto_84841 - BLOCK
    )
    :vars
    (
      ?auto_84843 - BLOCK
      ?auto_84842 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84836 ) ( ON ?auto_84837 ?auto_84836 ) ( not ( = ?auto_84836 ?auto_84837 ) ) ( not ( = ?auto_84836 ?auto_84838 ) ) ( not ( = ?auto_84836 ?auto_84839 ) ) ( not ( = ?auto_84836 ?auto_84840 ) ) ( not ( = ?auto_84836 ?auto_84841 ) ) ( not ( = ?auto_84837 ?auto_84838 ) ) ( not ( = ?auto_84837 ?auto_84839 ) ) ( not ( = ?auto_84837 ?auto_84840 ) ) ( not ( = ?auto_84837 ?auto_84841 ) ) ( not ( = ?auto_84838 ?auto_84839 ) ) ( not ( = ?auto_84838 ?auto_84840 ) ) ( not ( = ?auto_84838 ?auto_84841 ) ) ( not ( = ?auto_84839 ?auto_84840 ) ) ( not ( = ?auto_84839 ?auto_84841 ) ) ( not ( = ?auto_84840 ?auto_84841 ) ) ( ON ?auto_84841 ?auto_84843 ) ( not ( = ?auto_84836 ?auto_84843 ) ) ( not ( = ?auto_84837 ?auto_84843 ) ) ( not ( = ?auto_84838 ?auto_84843 ) ) ( not ( = ?auto_84839 ?auto_84843 ) ) ( not ( = ?auto_84840 ?auto_84843 ) ) ( not ( = ?auto_84841 ?auto_84843 ) ) ( ON ?auto_84840 ?auto_84841 ) ( ON-TABLE ?auto_84842 ) ( ON ?auto_84843 ?auto_84842 ) ( not ( = ?auto_84842 ?auto_84843 ) ) ( not ( = ?auto_84842 ?auto_84841 ) ) ( not ( = ?auto_84842 ?auto_84840 ) ) ( not ( = ?auto_84836 ?auto_84842 ) ) ( not ( = ?auto_84837 ?auto_84842 ) ) ( not ( = ?auto_84838 ?auto_84842 ) ) ( not ( = ?auto_84839 ?auto_84842 ) ) ( ON ?auto_84839 ?auto_84840 ) ( CLEAR ?auto_84839 ) ( HOLDING ?auto_84838 ) ( CLEAR ?auto_84837 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_84836 ?auto_84837 ?auto_84838 )
      ( MAKE-6PILE ?auto_84836 ?auto_84837 ?auto_84838 ?auto_84839 ?auto_84840 ?auto_84841 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84844 - BLOCK
      ?auto_84845 - BLOCK
      ?auto_84846 - BLOCK
      ?auto_84847 - BLOCK
      ?auto_84848 - BLOCK
      ?auto_84849 - BLOCK
    )
    :vars
    (
      ?auto_84850 - BLOCK
      ?auto_84851 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84844 ) ( ON ?auto_84845 ?auto_84844 ) ( not ( = ?auto_84844 ?auto_84845 ) ) ( not ( = ?auto_84844 ?auto_84846 ) ) ( not ( = ?auto_84844 ?auto_84847 ) ) ( not ( = ?auto_84844 ?auto_84848 ) ) ( not ( = ?auto_84844 ?auto_84849 ) ) ( not ( = ?auto_84845 ?auto_84846 ) ) ( not ( = ?auto_84845 ?auto_84847 ) ) ( not ( = ?auto_84845 ?auto_84848 ) ) ( not ( = ?auto_84845 ?auto_84849 ) ) ( not ( = ?auto_84846 ?auto_84847 ) ) ( not ( = ?auto_84846 ?auto_84848 ) ) ( not ( = ?auto_84846 ?auto_84849 ) ) ( not ( = ?auto_84847 ?auto_84848 ) ) ( not ( = ?auto_84847 ?auto_84849 ) ) ( not ( = ?auto_84848 ?auto_84849 ) ) ( ON ?auto_84849 ?auto_84850 ) ( not ( = ?auto_84844 ?auto_84850 ) ) ( not ( = ?auto_84845 ?auto_84850 ) ) ( not ( = ?auto_84846 ?auto_84850 ) ) ( not ( = ?auto_84847 ?auto_84850 ) ) ( not ( = ?auto_84848 ?auto_84850 ) ) ( not ( = ?auto_84849 ?auto_84850 ) ) ( ON ?auto_84848 ?auto_84849 ) ( ON-TABLE ?auto_84851 ) ( ON ?auto_84850 ?auto_84851 ) ( not ( = ?auto_84851 ?auto_84850 ) ) ( not ( = ?auto_84851 ?auto_84849 ) ) ( not ( = ?auto_84851 ?auto_84848 ) ) ( not ( = ?auto_84844 ?auto_84851 ) ) ( not ( = ?auto_84845 ?auto_84851 ) ) ( not ( = ?auto_84846 ?auto_84851 ) ) ( not ( = ?auto_84847 ?auto_84851 ) ) ( ON ?auto_84847 ?auto_84848 ) ( CLEAR ?auto_84845 ) ( ON ?auto_84846 ?auto_84847 ) ( CLEAR ?auto_84846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_84851 ?auto_84850 ?auto_84849 ?auto_84848 ?auto_84847 )
      ( MAKE-6PILE ?auto_84844 ?auto_84845 ?auto_84846 ?auto_84847 ?auto_84848 ?auto_84849 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84852 - BLOCK
      ?auto_84853 - BLOCK
      ?auto_84854 - BLOCK
      ?auto_84855 - BLOCK
      ?auto_84856 - BLOCK
      ?auto_84857 - BLOCK
    )
    :vars
    (
      ?auto_84858 - BLOCK
      ?auto_84859 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84852 ) ( not ( = ?auto_84852 ?auto_84853 ) ) ( not ( = ?auto_84852 ?auto_84854 ) ) ( not ( = ?auto_84852 ?auto_84855 ) ) ( not ( = ?auto_84852 ?auto_84856 ) ) ( not ( = ?auto_84852 ?auto_84857 ) ) ( not ( = ?auto_84853 ?auto_84854 ) ) ( not ( = ?auto_84853 ?auto_84855 ) ) ( not ( = ?auto_84853 ?auto_84856 ) ) ( not ( = ?auto_84853 ?auto_84857 ) ) ( not ( = ?auto_84854 ?auto_84855 ) ) ( not ( = ?auto_84854 ?auto_84856 ) ) ( not ( = ?auto_84854 ?auto_84857 ) ) ( not ( = ?auto_84855 ?auto_84856 ) ) ( not ( = ?auto_84855 ?auto_84857 ) ) ( not ( = ?auto_84856 ?auto_84857 ) ) ( ON ?auto_84857 ?auto_84858 ) ( not ( = ?auto_84852 ?auto_84858 ) ) ( not ( = ?auto_84853 ?auto_84858 ) ) ( not ( = ?auto_84854 ?auto_84858 ) ) ( not ( = ?auto_84855 ?auto_84858 ) ) ( not ( = ?auto_84856 ?auto_84858 ) ) ( not ( = ?auto_84857 ?auto_84858 ) ) ( ON ?auto_84856 ?auto_84857 ) ( ON-TABLE ?auto_84859 ) ( ON ?auto_84858 ?auto_84859 ) ( not ( = ?auto_84859 ?auto_84858 ) ) ( not ( = ?auto_84859 ?auto_84857 ) ) ( not ( = ?auto_84859 ?auto_84856 ) ) ( not ( = ?auto_84852 ?auto_84859 ) ) ( not ( = ?auto_84853 ?auto_84859 ) ) ( not ( = ?auto_84854 ?auto_84859 ) ) ( not ( = ?auto_84855 ?auto_84859 ) ) ( ON ?auto_84855 ?auto_84856 ) ( ON ?auto_84854 ?auto_84855 ) ( CLEAR ?auto_84854 ) ( HOLDING ?auto_84853 ) ( CLEAR ?auto_84852 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_84852 ?auto_84853 )
      ( MAKE-6PILE ?auto_84852 ?auto_84853 ?auto_84854 ?auto_84855 ?auto_84856 ?auto_84857 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84860 - BLOCK
      ?auto_84861 - BLOCK
      ?auto_84862 - BLOCK
      ?auto_84863 - BLOCK
      ?auto_84864 - BLOCK
      ?auto_84865 - BLOCK
    )
    :vars
    (
      ?auto_84866 - BLOCK
      ?auto_84867 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84860 ) ( not ( = ?auto_84860 ?auto_84861 ) ) ( not ( = ?auto_84860 ?auto_84862 ) ) ( not ( = ?auto_84860 ?auto_84863 ) ) ( not ( = ?auto_84860 ?auto_84864 ) ) ( not ( = ?auto_84860 ?auto_84865 ) ) ( not ( = ?auto_84861 ?auto_84862 ) ) ( not ( = ?auto_84861 ?auto_84863 ) ) ( not ( = ?auto_84861 ?auto_84864 ) ) ( not ( = ?auto_84861 ?auto_84865 ) ) ( not ( = ?auto_84862 ?auto_84863 ) ) ( not ( = ?auto_84862 ?auto_84864 ) ) ( not ( = ?auto_84862 ?auto_84865 ) ) ( not ( = ?auto_84863 ?auto_84864 ) ) ( not ( = ?auto_84863 ?auto_84865 ) ) ( not ( = ?auto_84864 ?auto_84865 ) ) ( ON ?auto_84865 ?auto_84866 ) ( not ( = ?auto_84860 ?auto_84866 ) ) ( not ( = ?auto_84861 ?auto_84866 ) ) ( not ( = ?auto_84862 ?auto_84866 ) ) ( not ( = ?auto_84863 ?auto_84866 ) ) ( not ( = ?auto_84864 ?auto_84866 ) ) ( not ( = ?auto_84865 ?auto_84866 ) ) ( ON ?auto_84864 ?auto_84865 ) ( ON-TABLE ?auto_84867 ) ( ON ?auto_84866 ?auto_84867 ) ( not ( = ?auto_84867 ?auto_84866 ) ) ( not ( = ?auto_84867 ?auto_84865 ) ) ( not ( = ?auto_84867 ?auto_84864 ) ) ( not ( = ?auto_84860 ?auto_84867 ) ) ( not ( = ?auto_84861 ?auto_84867 ) ) ( not ( = ?auto_84862 ?auto_84867 ) ) ( not ( = ?auto_84863 ?auto_84867 ) ) ( ON ?auto_84863 ?auto_84864 ) ( ON ?auto_84862 ?auto_84863 ) ( CLEAR ?auto_84860 ) ( ON ?auto_84861 ?auto_84862 ) ( CLEAR ?auto_84861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_84867 ?auto_84866 ?auto_84865 ?auto_84864 ?auto_84863 ?auto_84862 )
      ( MAKE-6PILE ?auto_84860 ?auto_84861 ?auto_84862 ?auto_84863 ?auto_84864 ?auto_84865 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84868 - BLOCK
      ?auto_84869 - BLOCK
      ?auto_84870 - BLOCK
      ?auto_84871 - BLOCK
      ?auto_84872 - BLOCK
      ?auto_84873 - BLOCK
    )
    :vars
    (
      ?auto_84874 - BLOCK
      ?auto_84875 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84868 ?auto_84869 ) ) ( not ( = ?auto_84868 ?auto_84870 ) ) ( not ( = ?auto_84868 ?auto_84871 ) ) ( not ( = ?auto_84868 ?auto_84872 ) ) ( not ( = ?auto_84868 ?auto_84873 ) ) ( not ( = ?auto_84869 ?auto_84870 ) ) ( not ( = ?auto_84869 ?auto_84871 ) ) ( not ( = ?auto_84869 ?auto_84872 ) ) ( not ( = ?auto_84869 ?auto_84873 ) ) ( not ( = ?auto_84870 ?auto_84871 ) ) ( not ( = ?auto_84870 ?auto_84872 ) ) ( not ( = ?auto_84870 ?auto_84873 ) ) ( not ( = ?auto_84871 ?auto_84872 ) ) ( not ( = ?auto_84871 ?auto_84873 ) ) ( not ( = ?auto_84872 ?auto_84873 ) ) ( ON ?auto_84873 ?auto_84874 ) ( not ( = ?auto_84868 ?auto_84874 ) ) ( not ( = ?auto_84869 ?auto_84874 ) ) ( not ( = ?auto_84870 ?auto_84874 ) ) ( not ( = ?auto_84871 ?auto_84874 ) ) ( not ( = ?auto_84872 ?auto_84874 ) ) ( not ( = ?auto_84873 ?auto_84874 ) ) ( ON ?auto_84872 ?auto_84873 ) ( ON-TABLE ?auto_84875 ) ( ON ?auto_84874 ?auto_84875 ) ( not ( = ?auto_84875 ?auto_84874 ) ) ( not ( = ?auto_84875 ?auto_84873 ) ) ( not ( = ?auto_84875 ?auto_84872 ) ) ( not ( = ?auto_84868 ?auto_84875 ) ) ( not ( = ?auto_84869 ?auto_84875 ) ) ( not ( = ?auto_84870 ?auto_84875 ) ) ( not ( = ?auto_84871 ?auto_84875 ) ) ( ON ?auto_84871 ?auto_84872 ) ( ON ?auto_84870 ?auto_84871 ) ( ON ?auto_84869 ?auto_84870 ) ( CLEAR ?auto_84869 ) ( HOLDING ?auto_84868 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_84868 )
      ( MAKE-6PILE ?auto_84868 ?auto_84869 ?auto_84870 ?auto_84871 ?auto_84872 ?auto_84873 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84876 - BLOCK
      ?auto_84877 - BLOCK
      ?auto_84878 - BLOCK
      ?auto_84879 - BLOCK
      ?auto_84880 - BLOCK
      ?auto_84881 - BLOCK
    )
    :vars
    (
      ?auto_84882 - BLOCK
      ?auto_84883 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84876 ?auto_84877 ) ) ( not ( = ?auto_84876 ?auto_84878 ) ) ( not ( = ?auto_84876 ?auto_84879 ) ) ( not ( = ?auto_84876 ?auto_84880 ) ) ( not ( = ?auto_84876 ?auto_84881 ) ) ( not ( = ?auto_84877 ?auto_84878 ) ) ( not ( = ?auto_84877 ?auto_84879 ) ) ( not ( = ?auto_84877 ?auto_84880 ) ) ( not ( = ?auto_84877 ?auto_84881 ) ) ( not ( = ?auto_84878 ?auto_84879 ) ) ( not ( = ?auto_84878 ?auto_84880 ) ) ( not ( = ?auto_84878 ?auto_84881 ) ) ( not ( = ?auto_84879 ?auto_84880 ) ) ( not ( = ?auto_84879 ?auto_84881 ) ) ( not ( = ?auto_84880 ?auto_84881 ) ) ( ON ?auto_84881 ?auto_84882 ) ( not ( = ?auto_84876 ?auto_84882 ) ) ( not ( = ?auto_84877 ?auto_84882 ) ) ( not ( = ?auto_84878 ?auto_84882 ) ) ( not ( = ?auto_84879 ?auto_84882 ) ) ( not ( = ?auto_84880 ?auto_84882 ) ) ( not ( = ?auto_84881 ?auto_84882 ) ) ( ON ?auto_84880 ?auto_84881 ) ( ON-TABLE ?auto_84883 ) ( ON ?auto_84882 ?auto_84883 ) ( not ( = ?auto_84883 ?auto_84882 ) ) ( not ( = ?auto_84883 ?auto_84881 ) ) ( not ( = ?auto_84883 ?auto_84880 ) ) ( not ( = ?auto_84876 ?auto_84883 ) ) ( not ( = ?auto_84877 ?auto_84883 ) ) ( not ( = ?auto_84878 ?auto_84883 ) ) ( not ( = ?auto_84879 ?auto_84883 ) ) ( ON ?auto_84879 ?auto_84880 ) ( ON ?auto_84878 ?auto_84879 ) ( ON ?auto_84877 ?auto_84878 ) ( ON ?auto_84876 ?auto_84877 ) ( CLEAR ?auto_84876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_84883 ?auto_84882 ?auto_84881 ?auto_84880 ?auto_84879 ?auto_84878 ?auto_84877 )
      ( MAKE-6PILE ?auto_84876 ?auto_84877 ?auto_84878 ?auto_84879 ?auto_84880 ?auto_84881 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_84885 - BLOCK
    )
    :vars
    (
      ?auto_84886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84886 ?auto_84885 ) ( CLEAR ?auto_84886 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_84885 ) ( not ( = ?auto_84885 ?auto_84886 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_84886 ?auto_84885 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_84887 - BLOCK
    )
    :vars
    (
      ?auto_84888 - BLOCK
      ?auto_84889 - BLOCK
      ?auto_84890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84888 ?auto_84887 ) ( CLEAR ?auto_84888 ) ( ON-TABLE ?auto_84887 ) ( not ( = ?auto_84887 ?auto_84888 ) ) ( HOLDING ?auto_84889 ) ( CLEAR ?auto_84890 ) ( not ( = ?auto_84887 ?auto_84889 ) ) ( not ( = ?auto_84887 ?auto_84890 ) ) ( not ( = ?auto_84888 ?auto_84889 ) ) ( not ( = ?auto_84888 ?auto_84890 ) ) ( not ( = ?auto_84889 ?auto_84890 ) ) )
    :subtasks
    ( ( !STACK ?auto_84889 ?auto_84890 )
      ( MAKE-1PILE ?auto_84887 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_84891 - BLOCK
    )
    :vars
    (
      ?auto_84894 - BLOCK
      ?auto_84892 - BLOCK
      ?auto_84893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84894 ?auto_84891 ) ( ON-TABLE ?auto_84891 ) ( not ( = ?auto_84891 ?auto_84894 ) ) ( CLEAR ?auto_84892 ) ( not ( = ?auto_84891 ?auto_84893 ) ) ( not ( = ?auto_84891 ?auto_84892 ) ) ( not ( = ?auto_84894 ?auto_84893 ) ) ( not ( = ?auto_84894 ?auto_84892 ) ) ( not ( = ?auto_84893 ?auto_84892 ) ) ( ON ?auto_84893 ?auto_84894 ) ( CLEAR ?auto_84893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_84891 ?auto_84894 )
      ( MAKE-1PILE ?auto_84891 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_84895 - BLOCK
    )
    :vars
    (
      ?auto_84898 - BLOCK
      ?auto_84896 - BLOCK
      ?auto_84897 - BLOCK
      ?auto_84901 - BLOCK
      ?auto_84902 - BLOCK
      ?auto_84899 - BLOCK
      ?auto_84900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84898 ?auto_84895 ) ( ON-TABLE ?auto_84895 ) ( not ( = ?auto_84895 ?auto_84898 ) ) ( not ( = ?auto_84895 ?auto_84896 ) ) ( not ( = ?auto_84895 ?auto_84897 ) ) ( not ( = ?auto_84898 ?auto_84896 ) ) ( not ( = ?auto_84898 ?auto_84897 ) ) ( not ( = ?auto_84896 ?auto_84897 ) ) ( ON ?auto_84896 ?auto_84898 ) ( CLEAR ?auto_84896 ) ( HOLDING ?auto_84897 ) ( CLEAR ?auto_84901 ) ( ON-TABLE ?auto_84902 ) ( ON ?auto_84899 ?auto_84902 ) ( ON ?auto_84900 ?auto_84899 ) ( ON ?auto_84901 ?auto_84900 ) ( not ( = ?auto_84902 ?auto_84899 ) ) ( not ( = ?auto_84902 ?auto_84900 ) ) ( not ( = ?auto_84902 ?auto_84901 ) ) ( not ( = ?auto_84902 ?auto_84897 ) ) ( not ( = ?auto_84899 ?auto_84900 ) ) ( not ( = ?auto_84899 ?auto_84901 ) ) ( not ( = ?auto_84899 ?auto_84897 ) ) ( not ( = ?auto_84900 ?auto_84901 ) ) ( not ( = ?auto_84900 ?auto_84897 ) ) ( not ( = ?auto_84901 ?auto_84897 ) ) ( not ( = ?auto_84895 ?auto_84901 ) ) ( not ( = ?auto_84895 ?auto_84902 ) ) ( not ( = ?auto_84895 ?auto_84899 ) ) ( not ( = ?auto_84895 ?auto_84900 ) ) ( not ( = ?auto_84898 ?auto_84901 ) ) ( not ( = ?auto_84898 ?auto_84902 ) ) ( not ( = ?auto_84898 ?auto_84899 ) ) ( not ( = ?auto_84898 ?auto_84900 ) ) ( not ( = ?auto_84896 ?auto_84901 ) ) ( not ( = ?auto_84896 ?auto_84902 ) ) ( not ( = ?auto_84896 ?auto_84899 ) ) ( not ( = ?auto_84896 ?auto_84900 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_84902 ?auto_84899 ?auto_84900 ?auto_84901 ?auto_84897 )
      ( MAKE-1PILE ?auto_84895 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_84903 - BLOCK
    )
    :vars
    (
      ?auto_84905 - BLOCK
      ?auto_84906 - BLOCK
      ?auto_84910 - BLOCK
      ?auto_84908 - BLOCK
      ?auto_84907 - BLOCK
      ?auto_84909 - BLOCK
      ?auto_84904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84905 ?auto_84903 ) ( ON-TABLE ?auto_84903 ) ( not ( = ?auto_84903 ?auto_84905 ) ) ( not ( = ?auto_84903 ?auto_84906 ) ) ( not ( = ?auto_84903 ?auto_84910 ) ) ( not ( = ?auto_84905 ?auto_84906 ) ) ( not ( = ?auto_84905 ?auto_84910 ) ) ( not ( = ?auto_84906 ?auto_84910 ) ) ( ON ?auto_84906 ?auto_84905 ) ( CLEAR ?auto_84908 ) ( ON-TABLE ?auto_84907 ) ( ON ?auto_84909 ?auto_84907 ) ( ON ?auto_84904 ?auto_84909 ) ( ON ?auto_84908 ?auto_84904 ) ( not ( = ?auto_84907 ?auto_84909 ) ) ( not ( = ?auto_84907 ?auto_84904 ) ) ( not ( = ?auto_84907 ?auto_84908 ) ) ( not ( = ?auto_84907 ?auto_84910 ) ) ( not ( = ?auto_84909 ?auto_84904 ) ) ( not ( = ?auto_84909 ?auto_84908 ) ) ( not ( = ?auto_84909 ?auto_84910 ) ) ( not ( = ?auto_84904 ?auto_84908 ) ) ( not ( = ?auto_84904 ?auto_84910 ) ) ( not ( = ?auto_84908 ?auto_84910 ) ) ( not ( = ?auto_84903 ?auto_84908 ) ) ( not ( = ?auto_84903 ?auto_84907 ) ) ( not ( = ?auto_84903 ?auto_84909 ) ) ( not ( = ?auto_84903 ?auto_84904 ) ) ( not ( = ?auto_84905 ?auto_84908 ) ) ( not ( = ?auto_84905 ?auto_84907 ) ) ( not ( = ?auto_84905 ?auto_84909 ) ) ( not ( = ?auto_84905 ?auto_84904 ) ) ( not ( = ?auto_84906 ?auto_84908 ) ) ( not ( = ?auto_84906 ?auto_84907 ) ) ( not ( = ?auto_84906 ?auto_84909 ) ) ( not ( = ?auto_84906 ?auto_84904 ) ) ( ON ?auto_84910 ?auto_84906 ) ( CLEAR ?auto_84910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_84903 ?auto_84905 ?auto_84906 )
      ( MAKE-1PILE ?auto_84903 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_84911 - BLOCK
    )
    :vars
    (
      ?auto_84917 - BLOCK
      ?auto_84914 - BLOCK
      ?auto_84916 - BLOCK
      ?auto_84918 - BLOCK
      ?auto_84915 - BLOCK
      ?auto_84913 - BLOCK
      ?auto_84912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84917 ?auto_84911 ) ( ON-TABLE ?auto_84911 ) ( not ( = ?auto_84911 ?auto_84917 ) ) ( not ( = ?auto_84911 ?auto_84914 ) ) ( not ( = ?auto_84911 ?auto_84916 ) ) ( not ( = ?auto_84917 ?auto_84914 ) ) ( not ( = ?auto_84917 ?auto_84916 ) ) ( not ( = ?auto_84914 ?auto_84916 ) ) ( ON ?auto_84914 ?auto_84917 ) ( ON-TABLE ?auto_84918 ) ( ON ?auto_84915 ?auto_84918 ) ( ON ?auto_84913 ?auto_84915 ) ( not ( = ?auto_84918 ?auto_84915 ) ) ( not ( = ?auto_84918 ?auto_84913 ) ) ( not ( = ?auto_84918 ?auto_84912 ) ) ( not ( = ?auto_84918 ?auto_84916 ) ) ( not ( = ?auto_84915 ?auto_84913 ) ) ( not ( = ?auto_84915 ?auto_84912 ) ) ( not ( = ?auto_84915 ?auto_84916 ) ) ( not ( = ?auto_84913 ?auto_84912 ) ) ( not ( = ?auto_84913 ?auto_84916 ) ) ( not ( = ?auto_84912 ?auto_84916 ) ) ( not ( = ?auto_84911 ?auto_84912 ) ) ( not ( = ?auto_84911 ?auto_84918 ) ) ( not ( = ?auto_84911 ?auto_84915 ) ) ( not ( = ?auto_84911 ?auto_84913 ) ) ( not ( = ?auto_84917 ?auto_84912 ) ) ( not ( = ?auto_84917 ?auto_84918 ) ) ( not ( = ?auto_84917 ?auto_84915 ) ) ( not ( = ?auto_84917 ?auto_84913 ) ) ( not ( = ?auto_84914 ?auto_84912 ) ) ( not ( = ?auto_84914 ?auto_84918 ) ) ( not ( = ?auto_84914 ?auto_84915 ) ) ( not ( = ?auto_84914 ?auto_84913 ) ) ( ON ?auto_84916 ?auto_84914 ) ( CLEAR ?auto_84916 ) ( HOLDING ?auto_84912 ) ( CLEAR ?auto_84913 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_84918 ?auto_84915 ?auto_84913 ?auto_84912 )
      ( MAKE-1PILE ?auto_84911 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_84919 - BLOCK
    )
    :vars
    (
      ?auto_84921 - BLOCK
      ?auto_84922 - BLOCK
      ?auto_84924 - BLOCK
      ?auto_84920 - BLOCK
      ?auto_84925 - BLOCK
      ?auto_84926 - BLOCK
      ?auto_84923 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84921 ?auto_84919 ) ( ON-TABLE ?auto_84919 ) ( not ( = ?auto_84919 ?auto_84921 ) ) ( not ( = ?auto_84919 ?auto_84922 ) ) ( not ( = ?auto_84919 ?auto_84924 ) ) ( not ( = ?auto_84921 ?auto_84922 ) ) ( not ( = ?auto_84921 ?auto_84924 ) ) ( not ( = ?auto_84922 ?auto_84924 ) ) ( ON ?auto_84922 ?auto_84921 ) ( ON-TABLE ?auto_84920 ) ( ON ?auto_84925 ?auto_84920 ) ( ON ?auto_84926 ?auto_84925 ) ( not ( = ?auto_84920 ?auto_84925 ) ) ( not ( = ?auto_84920 ?auto_84926 ) ) ( not ( = ?auto_84920 ?auto_84923 ) ) ( not ( = ?auto_84920 ?auto_84924 ) ) ( not ( = ?auto_84925 ?auto_84926 ) ) ( not ( = ?auto_84925 ?auto_84923 ) ) ( not ( = ?auto_84925 ?auto_84924 ) ) ( not ( = ?auto_84926 ?auto_84923 ) ) ( not ( = ?auto_84926 ?auto_84924 ) ) ( not ( = ?auto_84923 ?auto_84924 ) ) ( not ( = ?auto_84919 ?auto_84923 ) ) ( not ( = ?auto_84919 ?auto_84920 ) ) ( not ( = ?auto_84919 ?auto_84925 ) ) ( not ( = ?auto_84919 ?auto_84926 ) ) ( not ( = ?auto_84921 ?auto_84923 ) ) ( not ( = ?auto_84921 ?auto_84920 ) ) ( not ( = ?auto_84921 ?auto_84925 ) ) ( not ( = ?auto_84921 ?auto_84926 ) ) ( not ( = ?auto_84922 ?auto_84923 ) ) ( not ( = ?auto_84922 ?auto_84920 ) ) ( not ( = ?auto_84922 ?auto_84925 ) ) ( not ( = ?auto_84922 ?auto_84926 ) ) ( ON ?auto_84924 ?auto_84922 ) ( CLEAR ?auto_84926 ) ( ON ?auto_84923 ?auto_84924 ) ( CLEAR ?auto_84923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_84919 ?auto_84921 ?auto_84922 ?auto_84924 )
      ( MAKE-1PILE ?auto_84919 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_84927 - BLOCK
    )
    :vars
    (
      ?auto_84931 - BLOCK
      ?auto_84930 - BLOCK
      ?auto_84928 - BLOCK
      ?auto_84932 - BLOCK
      ?auto_84933 - BLOCK
      ?auto_84929 - BLOCK
      ?auto_84934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84931 ?auto_84927 ) ( ON-TABLE ?auto_84927 ) ( not ( = ?auto_84927 ?auto_84931 ) ) ( not ( = ?auto_84927 ?auto_84930 ) ) ( not ( = ?auto_84927 ?auto_84928 ) ) ( not ( = ?auto_84931 ?auto_84930 ) ) ( not ( = ?auto_84931 ?auto_84928 ) ) ( not ( = ?auto_84930 ?auto_84928 ) ) ( ON ?auto_84930 ?auto_84931 ) ( ON-TABLE ?auto_84932 ) ( ON ?auto_84933 ?auto_84932 ) ( not ( = ?auto_84932 ?auto_84933 ) ) ( not ( = ?auto_84932 ?auto_84929 ) ) ( not ( = ?auto_84932 ?auto_84934 ) ) ( not ( = ?auto_84932 ?auto_84928 ) ) ( not ( = ?auto_84933 ?auto_84929 ) ) ( not ( = ?auto_84933 ?auto_84934 ) ) ( not ( = ?auto_84933 ?auto_84928 ) ) ( not ( = ?auto_84929 ?auto_84934 ) ) ( not ( = ?auto_84929 ?auto_84928 ) ) ( not ( = ?auto_84934 ?auto_84928 ) ) ( not ( = ?auto_84927 ?auto_84934 ) ) ( not ( = ?auto_84927 ?auto_84932 ) ) ( not ( = ?auto_84927 ?auto_84933 ) ) ( not ( = ?auto_84927 ?auto_84929 ) ) ( not ( = ?auto_84931 ?auto_84934 ) ) ( not ( = ?auto_84931 ?auto_84932 ) ) ( not ( = ?auto_84931 ?auto_84933 ) ) ( not ( = ?auto_84931 ?auto_84929 ) ) ( not ( = ?auto_84930 ?auto_84934 ) ) ( not ( = ?auto_84930 ?auto_84932 ) ) ( not ( = ?auto_84930 ?auto_84933 ) ) ( not ( = ?auto_84930 ?auto_84929 ) ) ( ON ?auto_84928 ?auto_84930 ) ( ON ?auto_84934 ?auto_84928 ) ( CLEAR ?auto_84934 ) ( HOLDING ?auto_84929 ) ( CLEAR ?auto_84933 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_84932 ?auto_84933 ?auto_84929 )
      ( MAKE-1PILE ?auto_84927 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_84935 - BLOCK
    )
    :vars
    (
      ?auto_84937 - BLOCK
      ?auto_84939 - BLOCK
      ?auto_84942 - BLOCK
      ?auto_84941 - BLOCK
      ?auto_84940 - BLOCK
      ?auto_84936 - BLOCK
      ?auto_84938 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84937 ?auto_84935 ) ( ON-TABLE ?auto_84935 ) ( not ( = ?auto_84935 ?auto_84937 ) ) ( not ( = ?auto_84935 ?auto_84939 ) ) ( not ( = ?auto_84935 ?auto_84942 ) ) ( not ( = ?auto_84937 ?auto_84939 ) ) ( not ( = ?auto_84937 ?auto_84942 ) ) ( not ( = ?auto_84939 ?auto_84942 ) ) ( ON ?auto_84939 ?auto_84937 ) ( ON-TABLE ?auto_84941 ) ( ON ?auto_84940 ?auto_84941 ) ( not ( = ?auto_84941 ?auto_84940 ) ) ( not ( = ?auto_84941 ?auto_84936 ) ) ( not ( = ?auto_84941 ?auto_84938 ) ) ( not ( = ?auto_84941 ?auto_84942 ) ) ( not ( = ?auto_84940 ?auto_84936 ) ) ( not ( = ?auto_84940 ?auto_84938 ) ) ( not ( = ?auto_84940 ?auto_84942 ) ) ( not ( = ?auto_84936 ?auto_84938 ) ) ( not ( = ?auto_84936 ?auto_84942 ) ) ( not ( = ?auto_84938 ?auto_84942 ) ) ( not ( = ?auto_84935 ?auto_84938 ) ) ( not ( = ?auto_84935 ?auto_84941 ) ) ( not ( = ?auto_84935 ?auto_84940 ) ) ( not ( = ?auto_84935 ?auto_84936 ) ) ( not ( = ?auto_84937 ?auto_84938 ) ) ( not ( = ?auto_84937 ?auto_84941 ) ) ( not ( = ?auto_84937 ?auto_84940 ) ) ( not ( = ?auto_84937 ?auto_84936 ) ) ( not ( = ?auto_84939 ?auto_84938 ) ) ( not ( = ?auto_84939 ?auto_84941 ) ) ( not ( = ?auto_84939 ?auto_84940 ) ) ( not ( = ?auto_84939 ?auto_84936 ) ) ( ON ?auto_84942 ?auto_84939 ) ( ON ?auto_84938 ?auto_84942 ) ( CLEAR ?auto_84940 ) ( ON ?auto_84936 ?auto_84938 ) ( CLEAR ?auto_84936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_84935 ?auto_84937 ?auto_84939 ?auto_84942 ?auto_84938 )
      ( MAKE-1PILE ?auto_84935 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_84943 - BLOCK
    )
    :vars
    (
      ?auto_84945 - BLOCK
      ?auto_84949 - BLOCK
      ?auto_84948 - BLOCK
      ?auto_84947 - BLOCK
      ?auto_84950 - BLOCK
      ?auto_84946 - BLOCK
      ?auto_84944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84945 ?auto_84943 ) ( ON-TABLE ?auto_84943 ) ( not ( = ?auto_84943 ?auto_84945 ) ) ( not ( = ?auto_84943 ?auto_84949 ) ) ( not ( = ?auto_84943 ?auto_84948 ) ) ( not ( = ?auto_84945 ?auto_84949 ) ) ( not ( = ?auto_84945 ?auto_84948 ) ) ( not ( = ?auto_84949 ?auto_84948 ) ) ( ON ?auto_84949 ?auto_84945 ) ( ON-TABLE ?auto_84947 ) ( not ( = ?auto_84947 ?auto_84950 ) ) ( not ( = ?auto_84947 ?auto_84946 ) ) ( not ( = ?auto_84947 ?auto_84944 ) ) ( not ( = ?auto_84947 ?auto_84948 ) ) ( not ( = ?auto_84950 ?auto_84946 ) ) ( not ( = ?auto_84950 ?auto_84944 ) ) ( not ( = ?auto_84950 ?auto_84948 ) ) ( not ( = ?auto_84946 ?auto_84944 ) ) ( not ( = ?auto_84946 ?auto_84948 ) ) ( not ( = ?auto_84944 ?auto_84948 ) ) ( not ( = ?auto_84943 ?auto_84944 ) ) ( not ( = ?auto_84943 ?auto_84947 ) ) ( not ( = ?auto_84943 ?auto_84950 ) ) ( not ( = ?auto_84943 ?auto_84946 ) ) ( not ( = ?auto_84945 ?auto_84944 ) ) ( not ( = ?auto_84945 ?auto_84947 ) ) ( not ( = ?auto_84945 ?auto_84950 ) ) ( not ( = ?auto_84945 ?auto_84946 ) ) ( not ( = ?auto_84949 ?auto_84944 ) ) ( not ( = ?auto_84949 ?auto_84947 ) ) ( not ( = ?auto_84949 ?auto_84950 ) ) ( not ( = ?auto_84949 ?auto_84946 ) ) ( ON ?auto_84948 ?auto_84949 ) ( ON ?auto_84944 ?auto_84948 ) ( ON ?auto_84946 ?auto_84944 ) ( CLEAR ?auto_84946 ) ( HOLDING ?auto_84950 ) ( CLEAR ?auto_84947 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_84947 ?auto_84950 )
      ( MAKE-1PILE ?auto_84943 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_84951 - BLOCK
    )
    :vars
    (
      ?auto_84956 - BLOCK
      ?auto_84955 - BLOCK
      ?auto_84957 - BLOCK
      ?auto_84958 - BLOCK
      ?auto_84953 - BLOCK
      ?auto_84954 - BLOCK
      ?auto_84952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84956 ?auto_84951 ) ( ON-TABLE ?auto_84951 ) ( not ( = ?auto_84951 ?auto_84956 ) ) ( not ( = ?auto_84951 ?auto_84955 ) ) ( not ( = ?auto_84951 ?auto_84957 ) ) ( not ( = ?auto_84956 ?auto_84955 ) ) ( not ( = ?auto_84956 ?auto_84957 ) ) ( not ( = ?auto_84955 ?auto_84957 ) ) ( ON ?auto_84955 ?auto_84956 ) ( ON-TABLE ?auto_84958 ) ( not ( = ?auto_84958 ?auto_84953 ) ) ( not ( = ?auto_84958 ?auto_84954 ) ) ( not ( = ?auto_84958 ?auto_84952 ) ) ( not ( = ?auto_84958 ?auto_84957 ) ) ( not ( = ?auto_84953 ?auto_84954 ) ) ( not ( = ?auto_84953 ?auto_84952 ) ) ( not ( = ?auto_84953 ?auto_84957 ) ) ( not ( = ?auto_84954 ?auto_84952 ) ) ( not ( = ?auto_84954 ?auto_84957 ) ) ( not ( = ?auto_84952 ?auto_84957 ) ) ( not ( = ?auto_84951 ?auto_84952 ) ) ( not ( = ?auto_84951 ?auto_84958 ) ) ( not ( = ?auto_84951 ?auto_84953 ) ) ( not ( = ?auto_84951 ?auto_84954 ) ) ( not ( = ?auto_84956 ?auto_84952 ) ) ( not ( = ?auto_84956 ?auto_84958 ) ) ( not ( = ?auto_84956 ?auto_84953 ) ) ( not ( = ?auto_84956 ?auto_84954 ) ) ( not ( = ?auto_84955 ?auto_84952 ) ) ( not ( = ?auto_84955 ?auto_84958 ) ) ( not ( = ?auto_84955 ?auto_84953 ) ) ( not ( = ?auto_84955 ?auto_84954 ) ) ( ON ?auto_84957 ?auto_84955 ) ( ON ?auto_84952 ?auto_84957 ) ( ON ?auto_84954 ?auto_84952 ) ( CLEAR ?auto_84958 ) ( ON ?auto_84953 ?auto_84954 ) ( CLEAR ?auto_84953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_84951 ?auto_84956 ?auto_84955 ?auto_84957 ?auto_84952 ?auto_84954 )
      ( MAKE-1PILE ?auto_84951 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_84959 - BLOCK
    )
    :vars
    (
      ?auto_84961 - BLOCK
      ?auto_84960 - BLOCK
      ?auto_84963 - BLOCK
      ?auto_84962 - BLOCK
      ?auto_84965 - BLOCK
      ?auto_84964 - BLOCK
      ?auto_84966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84961 ?auto_84959 ) ( ON-TABLE ?auto_84959 ) ( not ( = ?auto_84959 ?auto_84961 ) ) ( not ( = ?auto_84959 ?auto_84960 ) ) ( not ( = ?auto_84959 ?auto_84963 ) ) ( not ( = ?auto_84961 ?auto_84960 ) ) ( not ( = ?auto_84961 ?auto_84963 ) ) ( not ( = ?auto_84960 ?auto_84963 ) ) ( ON ?auto_84960 ?auto_84961 ) ( not ( = ?auto_84962 ?auto_84965 ) ) ( not ( = ?auto_84962 ?auto_84964 ) ) ( not ( = ?auto_84962 ?auto_84966 ) ) ( not ( = ?auto_84962 ?auto_84963 ) ) ( not ( = ?auto_84965 ?auto_84964 ) ) ( not ( = ?auto_84965 ?auto_84966 ) ) ( not ( = ?auto_84965 ?auto_84963 ) ) ( not ( = ?auto_84964 ?auto_84966 ) ) ( not ( = ?auto_84964 ?auto_84963 ) ) ( not ( = ?auto_84966 ?auto_84963 ) ) ( not ( = ?auto_84959 ?auto_84966 ) ) ( not ( = ?auto_84959 ?auto_84962 ) ) ( not ( = ?auto_84959 ?auto_84965 ) ) ( not ( = ?auto_84959 ?auto_84964 ) ) ( not ( = ?auto_84961 ?auto_84966 ) ) ( not ( = ?auto_84961 ?auto_84962 ) ) ( not ( = ?auto_84961 ?auto_84965 ) ) ( not ( = ?auto_84961 ?auto_84964 ) ) ( not ( = ?auto_84960 ?auto_84966 ) ) ( not ( = ?auto_84960 ?auto_84962 ) ) ( not ( = ?auto_84960 ?auto_84965 ) ) ( not ( = ?auto_84960 ?auto_84964 ) ) ( ON ?auto_84963 ?auto_84960 ) ( ON ?auto_84966 ?auto_84963 ) ( ON ?auto_84964 ?auto_84966 ) ( ON ?auto_84965 ?auto_84964 ) ( CLEAR ?auto_84965 ) ( HOLDING ?auto_84962 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_84962 )
      ( MAKE-1PILE ?auto_84959 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_84967 - BLOCK
    )
    :vars
    (
      ?auto_84974 - BLOCK
      ?auto_84973 - BLOCK
      ?auto_84972 - BLOCK
      ?auto_84968 - BLOCK
      ?auto_84970 - BLOCK
      ?auto_84969 - BLOCK
      ?auto_84971 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84974 ?auto_84967 ) ( ON-TABLE ?auto_84967 ) ( not ( = ?auto_84967 ?auto_84974 ) ) ( not ( = ?auto_84967 ?auto_84973 ) ) ( not ( = ?auto_84967 ?auto_84972 ) ) ( not ( = ?auto_84974 ?auto_84973 ) ) ( not ( = ?auto_84974 ?auto_84972 ) ) ( not ( = ?auto_84973 ?auto_84972 ) ) ( ON ?auto_84973 ?auto_84974 ) ( not ( = ?auto_84968 ?auto_84970 ) ) ( not ( = ?auto_84968 ?auto_84969 ) ) ( not ( = ?auto_84968 ?auto_84971 ) ) ( not ( = ?auto_84968 ?auto_84972 ) ) ( not ( = ?auto_84970 ?auto_84969 ) ) ( not ( = ?auto_84970 ?auto_84971 ) ) ( not ( = ?auto_84970 ?auto_84972 ) ) ( not ( = ?auto_84969 ?auto_84971 ) ) ( not ( = ?auto_84969 ?auto_84972 ) ) ( not ( = ?auto_84971 ?auto_84972 ) ) ( not ( = ?auto_84967 ?auto_84971 ) ) ( not ( = ?auto_84967 ?auto_84968 ) ) ( not ( = ?auto_84967 ?auto_84970 ) ) ( not ( = ?auto_84967 ?auto_84969 ) ) ( not ( = ?auto_84974 ?auto_84971 ) ) ( not ( = ?auto_84974 ?auto_84968 ) ) ( not ( = ?auto_84974 ?auto_84970 ) ) ( not ( = ?auto_84974 ?auto_84969 ) ) ( not ( = ?auto_84973 ?auto_84971 ) ) ( not ( = ?auto_84973 ?auto_84968 ) ) ( not ( = ?auto_84973 ?auto_84970 ) ) ( not ( = ?auto_84973 ?auto_84969 ) ) ( ON ?auto_84972 ?auto_84973 ) ( ON ?auto_84971 ?auto_84972 ) ( ON ?auto_84969 ?auto_84971 ) ( ON ?auto_84970 ?auto_84969 ) ( ON ?auto_84968 ?auto_84970 ) ( CLEAR ?auto_84968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_84967 ?auto_84974 ?auto_84973 ?auto_84972 ?auto_84971 ?auto_84969 ?auto_84970 )
      ( MAKE-1PILE ?auto_84967 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84982 - BLOCK
      ?auto_84983 - BLOCK
      ?auto_84984 - BLOCK
      ?auto_84985 - BLOCK
      ?auto_84986 - BLOCK
      ?auto_84987 - BLOCK
      ?auto_84988 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_84988 ) ( CLEAR ?auto_84987 ) ( ON-TABLE ?auto_84982 ) ( ON ?auto_84983 ?auto_84982 ) ( ON ?auto_84984 ?auto_84983 ) ( ON ?auto_84985 ?auto_84984 ) ( ON ?auto_84986 ?auto_84985 ) ( ON ?auto_84987 ?auto_84986 ) ( not ( = ?auto_84982 ?auto_84983 ) ) ( not ( = ?auto_84982 ?auto_84984 ) ) ( not ( = ?auto_84982 ?auto_84985 ) ) ( not ( = ?auto_84982 ?auto_84986 ) ) ( not ( = ?auto_84982 ?auto_84987 ) ) ( not ( = ?auto_84982 ?auto_84988 ) ) ( not ( = ?auto_84983 ?auto_84984 ) ) ( not ( = ?auto_84983 ?auto_84985 ) ) ( not ( = ?auto_84983 ?auto_84986 ) ) ( not ( = ?auto_84983 ?auto_84987 ) ) ( not ( = ?auto_84983 ?auto_84988 ) ) ( not ( = ?auto_84984 ?auto_84985 ) ) ( not ( = ?auto_84984 ?auto_84986 ) ) ( not ( = ?auto_84984 ?auto_84987 ) ) ( not ( = ?auto_84984 ?auto_84988 ) ) ( not ( = ?auto_84985 ?auto_84986 ) ) ( not ( = ?auto_84985 ?auto_84987 ) ) ( not ( = ?auto_84985 ?auto_84988 ) ) ( not ( = ?auto_84986 ?auto_84987 ) ) ( not ( = ?auto_84986 ?auto_84988 ) ) ( not ( = ?auto_84987 ?auto_84988 ) ) )
    :subtasks
    ( ( !STACK ?auto_84988 ?auto_84987 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84989 - BLOCK
      ?auto_84990 - BLOCK
      ?auto_84991 - BLOCK
      ?auto_84992 - BLOCK
      ?auto_84993 - BLOCK
      ?auto_84994 - BLOCK
      ?auto_84995 - BLOCK
    )
    :vars
    (
      ?auto_84996 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_84994 ) ( ON-TABLE ?auto_84989 ) ( ON ?auto_84990 ?auto_84989 ) ( ON ?auto_84991 ?auto_84990 ) ( ON ?auto_84992 ?auto_84991 ) ( ON ?auto_84993 ?auto_84992 ) ( ON ?auto_84994 ?auto_84993 ) ( not ( = ?auto_84989 ?auto_84990 ) ) ( not ( = ?auto_84989 ?auto_84991 ) ) ( not ( = ?auto_84989 ?auto_84992 ) ) ( not ( = ?auto_84989 ?auto_84993 ) ) ( not ( = ?auto_84989 ?auto_84994 ) ) ( not ( = ?auto_84989 ?auto_84995 ) ) ( not ( = ?auto_84990 ?auto_84991 ) ) ( not ( = ?auto_84990 ?auto_84992 ) ) ( not ( = ?auto_84990 ?auto_84993 ) ) ( not ( = ?auto_84990 ?auto_84994 ) ) ( not ( = ?auto_84990 ?auto_84995 ) ) ( not ( = ?auto_84991 ?auto_84992 ) ) ( not ( = ?auto_84991 ?auto_84993 ) ) ( not ( = ?auto_84991 ?auto_84994 ) ) ( not ( = ?auto_84991 ?auto_84995 ) ) ( not ( = ?auto_84992 ?auto_84993 ) ) ( not ( = ?auto_84992 ?auto_84994 ) ) ( not ( = ?auto_84992 ?auto_84995 ) ) ( not ( = ?auto_84993 ?auto_84994 ) ) ( not ( = ?auto_84993 ?auto_84995 ) ) ( not ( = ?auto_84994 ?auto_84995 ) ) ( ON ?auto_84995 ?auto_84996 ) ( CLEAR ?auto_84995 ) ( HAND-EMPTY ) ( not ( = ?auto_84989 ?auto_84996 ) ) ( not ( = ?auto_84990 ?auto_84996 ) ) ( not ( = ?auto_84991 ?auto_84996 ) ) ( not ( = ?auto_84992 ?auto_84996 ) ) ( not ( = ?auto_84993 ?auto_84996 ) ) ( not ( = ?auto_84994 ?auto_84996 ) ) ( not ( = ?auto_84995 ?auto_84996 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_84995 ?auto_84996 )
      ( MAKE-7PILE ?auto_84989 ?auto_84990 ?auto_84991 ?auto_84992 ?auto_84993 ?auto_84994 ?auto_84995 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84997 - BLOCK
      ?auto_84998 - BLOCK
      ?auto_84999 - BLOCK
      ?auto_85000 - BLOCK
      ?auto_85001 - BLOCK
      ?auto_85002 - BLOCK
      ?auto_85003 - BLOCK
    )
    :vars
    (
      ?auto_85004 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84997 ) ( ON ?auto_84998 ?auto_84997 ) ( ON ?auto_84999 ?auto_84998 ) ( ON ?auto_85000 ?auto_84999 ) ( ON ?auto_85001 ?auto_85000 ) ( not ( = ?auto_84997 ?auto_84998 ) ) ( not ( = ?auto_84997 ?auto_84999 ) ) ( not ( = ?auto_84997 ?auto_85000 ) ) ( not ( = ?auto_84997 ?auto_85001 ) ) ( not ( = ?auto_84997 ?auto_85002 ) ) ( not ( = ?auto_84997 ?auto_85003 ) ) ( not ( = ?auto_84998 ?auto_84999 ) ) ( not ( = ?auto_84998 ?auto_85000 ) ) ( not ( = ?auto_84998 ?auto_85001 ) ) ( not ( = ?auto_84998 ?auto_85002 ) ) ( not ( = ?auto_84998 ?auto_85003 ) ) ( not ( = ?auto_84999 ?auto_85000 ) ) ( not ( = ?auto_84999 ?auto_85001 ) ) ( not ( = ?auto_84999 ?auto_85002 ) ) ( not ( = ?auto_84999 ?auto_85003 ) ) ( not ( = ?auto_85000 ?auto_85001 ) ) ( not ( = ?auto_85000 ?auto_85002 ) ) ( not ( = ?auto_85000 ?auto_85003 ) ) ( not ( = ?auto_85001 ?auto_85002 ) ) ( not ( = ?auto_85001 ?auto_85003 ) ) ( not ( = ?auto_85002 ?auto_85003 ) ) ( ON ?auto_85003 ?auto_85004 ) ( CLEAR ?auto_85003 ) ( not ( = ?auto_84997 ?auto_85004 ) ) ( not ( = ?auto_84998 ?auto_85004 ) ) ( not ( = ?auto_84999 ?auto_85004 ) ) ( not ( = ?auto_85000 ?auto_85004 ) ) ( not ( = ?auto_85001 ?auto_85004 ) ) ( not ( = ?auto_85002 ?auto_85004 ) ) ( not ( = ?auto_85003 ?auto_85004 ) ) ( HOLDING ?auto_85002 ) ( CLEAR ?auto_85001 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_84997 ?auto_84998 ?auto_84999 ?auto_85000 ?auto_85001 ?auto_85002 )
      ( MAKE-7PILE ?auto_84997 ?auto_84998 ?auto_84999 ?auto_85000 ?auto_85001 ?auto_85002 ?auto_85003 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_85005 - BLOCK
      ?auto_85006 - BLOCK
      ?auto_85007 - BLOCK
      ?auto_85008 - BLOCK
      ?auto_85009 - BLOCK
      ?auto_85010 - BLOCK
      ?auto_85011 - BLOCK
    )
    :vars
    (
      ?auto_85012 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85005 ) ( ON ?auto_85006 ?auto_85005 ) ( ON ?auto_85007 ?auto_85006 ) ( ON ?auto_85008 ?auto_85007 ) ( ON ?auto_85009 ?auto_85008 ) ( not ( = ?auto_85005 ?auto_85006 ) ) ( not ( = ?auto_85005 ?auto_85007 ) ) ( not ( = ?auto_85005 ?auto_85008 ) ) ( not ( = ?auto_85005 ?auto_85009 ) ) ( not ( = ?auto_85005 ?auto_85010 ) ) ( not ( = ?auto_85005 ?auto_85011 ) ) ( not ( = ?auto_85006 ?auto_85007 ) ) ( not ( = ?auto_85006 ?auto_85008 ) ) ( not ( = ?auto_85006 ?auto_85009 ) ) ( not ( = ?auto_85006 ?auto_85010 ) ) ( not ( = ?auto_85006 ?auto_85011 ) ) ( not ( = ?auto_85007 ?auto_85008 ) ) ( not ( = ?auto_85007 ?auto_85009 ) ) ( not ( = ?auto_85007 ?auto_85010 ) ) ( not ( = ?auto_85007 ?auto_85011 ) ) ( not ( = ?auto_85008 ?auto_85009 ) ) ( not ( = ?auto_85008 ?auto_85010 ) ) ( not ( = ?auto_85008 ?auto_85011 ) ) ( not ( = ?auto_85009 ?auto_85010 ) ) ( not ( = ?auto_85009 ?auto_85011 ) ) ( not ( = ?auto_85010 ?auto_85011 ) ) ( ON ?auto_85011 ?auto_85012 ) ( not ( = ?auto_85005 ?auto_85012 ) ) ( not ( = ?auto_85006 ?auto_85012 ) ) ( not ( = ?auto_85007 ?auto_85012 ) ) ( not ( = ?auto_85008 ?auto_85012 ) ) ( not ( = ?auto_85009 ?auto_85012 ) ) ( not ( = ?auto_85010 ?auto_85012 ) ) ( not ( = ?auto_85011 ?auto_85012 ) ) ( CLEAR ?auto_85009 ) ( ON ?auto_85010 ?auto_85011 ) ( CLEAR ?auto_85010 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_85012 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_85012 ?auto_85011 )
      ( MAKE-7PILE ?auto_85005 ?auto_85006 ?auto_85007 ?auto_85008 ?auto_85009 ?auto_85010 ?auto_85011 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_85013 - BLOCK
      ?auto_85014 - BLOCK
      ?auto_85015 - BLOCK
      ?auto_85016 - BLOCK
      ?auto_85017 - BLOCK
      ?auto_85018 - BLOCK
      ?auto_85019 - BLOCK
    )
    :vars
    (
      ?auto_85020 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85013 ) ( ON ?auto_85014 ?auto_85013 ) ( ON ?auto_85015 ?auto_85014 ) ( ON ?auto_85016 ?auto_85015 ) ( not ( = ?auto_85013 ?auto_85014 ) ) ( not ( = ?auto_85013 ?auto_85015 ) ) ( not ( = ?auto_85013 ?auto_85016 ) ) ( not ( = ?auto_85013 ?auto_85017 ) ) ( not ( = ?auto_85013 ?auto_85018 ) ) ( not ( = ?auto_85013 ?auto_85019 ) ) ( not ( = ?auto_85014 ?auto_85015 ) ) ( not ( = ?auto_85014 ?auto_85016 ) ) ( not ( = ?auto_85014 ?auto_85017 ) ) ( not ( = ?auto_85014 ?auto_85018 ) ) ( not ( = ?auto_85014 ?auto_85019 ) ) ( not ( = ?auto_85015 ?auto_85016 ) ) ( not ( = ?auto_85015 ?auto_85017 ) ) ( not ( = ?auto_85015 ?auto_85018 ) ) ( not ( = ?auto_85015 ?auto_85019 ) ) ( not ( = ?auto_85016 ?auto_85017 ) ) ( not ( = ?auto_85016 ?auto_85018 ) ) ( not ( = ?auto_85016 ?auto_85019 ) ) ( not ( = ?auto_85017 ?auto_85018 ) ) ( not ( = ?auto_85017 ?auto_85019 ) ) ( not ( = ?auto_85018 ?auto_85019 ) ) ( ON ?auto_85019 ?auto_85020 ) ( not ( = ?auto_85013 ?auto_85020 ) ) ( not ( = ?auto_85014 ?auto_85020 ) ) ( not ( = ?auto_85015 ?auto_85020 ) ) ( not ( = ?auto_85016 ?auto_85020 ) ) ( not ( = ?auto_85017 ?auto_85020 ) ) ( not ( = ?auto_85018 ?auto_85020 ) ) ( not ( = ?auto_85019 ?auto_85020 ) ) ( ON ?auto_85018 ?auto_85019 ) ( CLEAR ?auto_85018 ) ( ON-TABLE ?auto_85020 ) ( HOLDING ?auto_85017 ) ( CLEAR ?auto_85016 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_85013 ?auto_85014 ?auto_85015 ?auto_85016 ?auto_85017 )
      ( MAKE-7PILE ?auto_85013 ?auto_85014 ?auto_85015 ?auto_85016 ?auto_85017 ?auto_85018 ?auto_85019 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_85021 - BLOCK
      ?auto_85022 - BLOCK
      ?auto_85023 - BLOCK
      ?auto_85024 - BLOCK
      ?auto_85025 - BLOCK
      ?auto_85026 - BLOCK
      ?auto_85027 - BLOCK
    )
    :vars
    (
      ?auto_85028 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85021 ) ( ON ?auto_85022 ?auto_85021 ) ( ON ?auto_85023 ?auto_85022 ) ( ON ?auto_85024 ?auto_85023 ) ( not ( = ?auto_85021 ?auto_85022 ) ) ( not ( = ?auto_85021 ?auto_85023 ) ) ( not ( = ?auto_85021 ?auto_85024 ) ) ( not ( = ?auto_85021 ?auto_85025 ) ) ( not ( = ?auto_85021 ?auto_85026 ) ) ( not ( = ?auto_85021 ?auto_85027 ) ) ( not ( = ?auto_85022 ?auto_85023 ) ) ( not ( = ?auto_85022 ?auto_85024 ) ) ( not ( = ?auto_85022 ?auto_85025 ) ) ( not ( = ?auto_85022 ?auto_85026 ) ) ( not ( = ?auto_85022 ?auto_85027 ) ) ( not ( = ?auto_85023 ?auto_85024 ) ) ( not ( = ?auto_85023 ?auto_85025 ) ) ( not ( = ?auto_85023 ?auto_85026 ) ) ( not ( = ?auto_85023 ?auto_85027 ) ) ( not ( = ?auto_85024 ?auto_85025 ) ) ( not ( = ?auto_85024 ?auto_85026 ) ) ( not ( = ?auto_85024 ?auto_85027 ) ) ( not ( = ?auto_85025 ?auto_85026 ) ) ( not ( = ?auto_85025 ?auto_85027 ) ) ( not ( = ?auto_85026 ?auto_85027 ) ) ( ON ?auto_85027 ?auto_85028 ) ( not ( = ?auto_85021 ?auto_85028 ) ) ( not ( = ?auto_85022 ?auto_85028 ) ) ( not ( = ?auto_85023 ?auto_85028 ) ) ( not ( = ?auto_85024 ?auto_85028 ) ) ( not ( = ?auto_85025 ?auto_85028 ) ) ( not ( = ?auto_85026 ?auto_85028 ) ) ( not ( = ?auto_85027 ?auto_85028 ) ) ( ON ?auto_85026 ?auto_85027 ) ( ON-TABLE ?auto_85028 ) ( CLEAR ?auto_85024 ) ( ON ?auto_85025 ?auto_85026 ) ( CLEAR ?auto_85025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_85028 ?auto_85027 ?auto_85026 )
      ( MAKE-7PILE ?auto_85021 ?auto_85022 ?auto_85023 ?auto_85024 ?auto_85025 ?auto_85026 ?auto_85027 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_85029 - BLOCK
      ?auto_85030 - BLOCK
      ?auto_85031 - BLOCK
      ?auto_85032 - BLOCK
      ?auto_85033 - BLOCK
      ?auto_85034 - BLOCK
      ?auto_85035 - BLOCK
    )
    :vars
    (
      ?auto_85036 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85029 ) ( ON ?auto_85030 ?auto_85029 ) ( ON ?auto_85031 ?auto_85030 ) ( not ( = ?auto_85029 ?auto_85030 ) ) ( not ( = ?auto_85029 ?auto_85031 ) ) ( not ( = ?auto_85029 ?auto_85032 ) ) ( not ( = ?auto_85029 ?auto_85033 ) ) ( not ( = ?auto_85029 ?auto_85034 ) ) ( not ( = ?auto_85029 ?auto_85035 ) ) ( not ( = ?auto_85030 ?auto_85031 ) ) ( not ( = ?auto_85030 ?auto_85032 ) ) ( not ( = ?auto_85030 ?auto_85033 ) ) ( not ( = ?auto_85030 ?auto_85034 ) ) ( not ( = ?auto_85030 ?auto_85035 ) ) ( not ( = ?auto_85031 ?auto_85032 ) ) ( not ( = ?auto_85031 ?auto_85033 ) ) ( not ( = ?auto_85031 ?auto_85034 ) ) ( not ( = ?auto_85031 ?auto_85035 ) ) ( not ( = ?auto_85032 ?auto_85033 ) ) ( not ( = ?auto_85032 ?auto_85034 ) ) ( not ( = ?auto_85032 ?auto_85035 ) ) ( not ( = ?auto_85033 ?auto_85034 ) ) ( not ( = ?auto_85033 ?auto_85035 ) ) ( not ( = ?auto_85034 ?auto_85035 ) ) ( ON ?auto_85035 ?auto_85036 ) ( not ( = ?auto_85029 ?auto_85036 ) ) ( not ( = ?auto_85030 ?auto_85036 ) ) ( not ( = ?auto_85031 ?auto_85036 ) ) ( not ( = ?auto_85032 ?auto_85036 ) ) ( not ( = ?auto_85033 ?auto_85036 ) ) ( not ( = ?auto_85034 ?auto_85036 ) ) ( not ( = ?auto_85035 ?auto_85036 ) ) ( ON ?auto_85034 ?auto_85035 ) ( ON-TABLE ?auto_85036 ) ( ON ?auto_85033 ?auto_85034 ) ( CLEAR ?auto_85033 ) ( HOLDING ?auto_85032 ) ( CLEAR ?auto_85031 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_85029 ?auto_85030 ?auto_85031 ?auto_85032 )
      ( MAKE-7PILE ?auto_85029 ?auto_85030 ?auto_85031 ?auto_85032 ?auto_85033 ?auto_85034 ?auto_85035 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_85037 - BLOCK
      ?auto_85038 - BLOCK
      ?auto_85039 - BLOCK
      ?auto_85040 - BLOCK
      ?auto_85041 - BLOCK
      ?auto_85042 - BLOCK
      ?auto_85043 - BLOCK
    )
    :vars
    (
      ?auto_85044 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85037 ) ( ON ?auto_85038 ?auto_85037 ) ( ON ?auto_85039 ?auto_85038 ) ( not ( = ?auto_85037 ?auto_85038 ) ) ( not ( = ?auto_85037 ?auto_85039 ) ) ( not ( = ?auto_85037 ?auto_85040 ) ) ( not ( = ?auto_85037 ?auto_85041 ) ) ( not ( = ?auto_85037 ?auto_85042 ) ) ( not ( = ?auto_85037 ?auto_85043 ) ) ( not ( = ?auto_85038 ?auto_85039 ) ) ( not ( = ?auto_85038 ?auto_85040 ) ) ( not ( = ?auto_85038 ?auto_85041 ) ) ( not ( = ?auto_85038 ?auto_85042 ) ) ( not ( = ?auto_85038 ?auto_85043 ) ) ( not ( = ?auto_85039 ?auto_85040 ) ) ( not ( = ?auto_85039 ?auto_85041 ) ) ( not ( = ?auto_85039 ?auto_85042 ) ) ( not ( = ?auto_85039 ?auto_85043 ) ) ( not ( = ?auto_85040 ?auto_85041 ) ) ( not ( = ?auto_85040 ?auto_85042 ) ) ( not ( = ?auto_85040 ?auto_85043 ) ) ( not ( = ?auto_85041 ?auto_85042 ) ) ( not ( = ?auto_85041 ?auto_85043 ) ) ( not ( = ?auto_85042 ?auto_85043 ) ) ( ON ?auto_85043 ?auto_85044 ) ( not ( = ?auto_85037 ?auto_85044 ) ) ( not ( = ?auto_85038 ?auto_85044 ) ) ( not ( = ?auto_85039 ?auto_85044 ) ) ( not ( = ?auto_85040 ?auto_85044 ) ) ( not ( = ?auto_85041 ?auto_85044 ) ) ( not ( = ?auto_85042 ?auto_85044 ) ) ( not ( = ?auto_85043 ?auto_85044 ) ) ( ON ?auto_85042 ?auto_85043 ) ( ON-TABLE ?auto_85044 ) ( ON ?auto_85041 ?auto_85042 ) ( CLEAR ?auto_85039 ) ( ON ?auto_85040 ?auto_85041 ) ( CLEAR ?auto_85040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_85044 ?auto_85043 ?auto_85042 ?auto_85041 )
      ( MAKE-7PILE ?auto_85037 ?auto_85038 ?auto_85039 ?auto_85040 ?auto_85041 ?auto_85042 ?auto_85043 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_85045 - BLOCK
      ?auto_85046 - BLOCK
      ?auto_85047 - BLOCK
      ?auto_85048 - BLOCK
      ?auto_85049 - BLOCK
      ?auto_85050 - BLOCK
      ?auto_85051 - BLOCK
    )
    :vars
    (
      ?auto_85052 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85045 ) ( ON ?auto_85046 ?auto_85045 ) ( not ( = ?auto_85045 ?auto_85046 ) ) ( not ( = ?auto_85045 ?auto_85047 ) ) ( not ( = ?auto_85045 ?auto_85048 ) ) ( not ( = ?auto_85045 ?auto_85049 ) ) ( not ( = ?auto_85045 ?auto_85050 ) ) ( not ( = ?auto_85045 ?auto_85051 ) ) ( not ( = ?auto_85046 ?auto_85047 ) ) ( not ( = ?auto_85046 ?auto_85048 ) ) ( not ( = ?auto_85046 ?auto_85049 ) ) ( not ( = ?auto_85046 ?auto_85050 ) ) ( not ( = ?auto_85046 ?auto_85051 ) ) ( not ( = ?auto_85047 ?auto_85048 ) ) ( not ( = ?auto_85047 ?auto_85049 ) ) ( not ( = ?auto_85047 ?auto_85050 ) ) ( not ( = ?auto_85047 ?auto_85051 ) ) ( not ( = ?auto_85048 ?auto_85049 ) ) ( not ( = ?auto_85048 ?auto_85050 ) ) ( not ( = ?auto_85048 ?auto_85051 ) ) ( not ( = ?auto_85049 ?auto_85050 ) ) ( not ( = ?auto_85049 ?auto_85051 ) ) ( not ( = ?auto_85050 ?auto_85051 ) ) ( ON ?auto_85051 ?auto_85052 ) ( not ( = ?auto_85045 ?auto_85052 ) ) ( not ( = ?auto_85046 ?auto_85052 ) ) ( not ( = ?auto_85047 ?auto_85052 ) ) ( not ( = ?auto_85048 ?auto_85052 ) ) ( not ( = ?auto_85049 ?auto_85052 ) ) ( not ( = ?auto_85050 ?auto_85052 ) ) ( not ( = ?auto_85051 ?auto_85052 ) ) ( ON ?auto_85050 ?auto_85051 ) ( ON-TABLE ?auto_85052 ) ( ON ?auto_85049 ?auto_85050 ) ( ON ?auto_85048 ?auto_85049 ) ( CLEAR ?auto_85048 ) ( HOLDING ?auto_85047 ) ( CLEAR ?auto_85046 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_85045 ?auto_85046 ?auto_85047 )
      ( MAKE-7PILE ?auto_85045 ?auto_85046 ?auto_85047 ?auto_85048 ?auto_85049 ?auto_85050 ?auto_85051 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_85053 - BLOCK
      ?auto_85054 - BLOCK
      ?auto_85055 - BLOCK
      ?auto_85056 - BLOCK
      ?auto_85057 - BLOCK
      ?auto_85058 - BLOCK
      ?auto_85059 - BLOCK
    )
    :vars
    (
      ?auto_85060 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85053 ) ( ON ?auto_85054 ?auto_85053 ) ( not ( = ?auto_85053 ?auto_85054 ) ) ( not ( = ?auto_85053 ?auto_85055 ) ) ( not ( = ?auto_85053 ?auto_85056 ) ) ( not ( = ?auto_85053 ?auto_85057 ) ) ( not ( = ?auto_85053 ?auto_85058 ) ) ( not ( = ?auto_85053 ?auto_85059 ) ) ( not ( = ?auto_85054 ?auto_85055 ) ) ( not ( = ?auto_85054 ?auto_85056 ) ) ( not ( = ?auto_85054 ?auto_85057 ) ) ( not ( = ?auto_85054 ?auto_85058 ) ) ( not ( = ?auto_85054 ?auto_85059 ) ) ( not ( = ?auto_85055 ?auto_85056 ) ) ( not ( = ?auto_85055 ?auto_85057 ) ) ( not ( = ?auto_85055 ?auto_85058 ) ) ( not ( = ?auto_85055 ?auto_85059 ) ) ( not ( = ?auto_85056 ?auto_85057 ) ) ( not ( = ?auto_85056 ?auto_85058 ) ) ( not ( = ?auto_85056 ?auto_85059 ) ) ( not ( = ?auto_85057 ?auto_85058 ) ) ( not ( = ?auto_85057 ?auto_85059 ) ) ( not ( = ?auto_85058 ?auto_85059 ) ) ( ON ?auto_85059 ?auto_85060 ) ( not ( = ?auto_85053 ?auto_85060 ) ) ( not ( = ?auto_85054 ?auto_85060 ) ) ( not ( = ?auto_85055 ?auto_85060 ) ) ( not ( = ?auto_85056 ?auto_85060 ) ) ( not ( = ?auto_85057 ?auto_85060 ) ) ( not ( = ?auto_85058 ?auto_85060 ) ) ( not ( = ?auto_85059 ?auto_85060 ) ) ( ON ?auto_85058 ?auto_85059 ) ( ON-TABLE ?auto_85060 ) ( ON ?auto_85057 ?auto_85058 ) ( ON ?auto_85056 ?auto_85057 ) ( CLEAR ?auto_85054 ) ( ON ?auto_85055 ?auto_85056 ) ( CLEAR ?auto_85055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_85060 ?auto_85059 ?auto_85058 ?auto_85057 ?auto_85056 )
      ( MAKE-7PILE ?auto_85053 ?auto_85054 ?auto_85055 ?auto_85056 ?auto_85057 ?auto_85058 ?auto_85059 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_85061 - BLOCK
      ?auto_85062 - BLOCK
      ?auto_85063 - BLOCK
      ?auto_85064 - BLOCK
      ?auto_85065 - BLOCK
      ?auto_85066 - BLOCK
      ?auto_85067 - BLOCK
    )
    :vars
    (
      ?auto_85068 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85061 ) ( not ( = ?auto_85061 ?auto_85062 ) ) ( not ( = ?auto_85061 ?auto_85063 ) ) ( not ( = ?auto_85061 ?auto_85064 ) ) ( not ( = ?auto_85061 ?auto_85065 ) ) ( not ( = ?auto_85061 ?auto_85066 ) ) ( not ( = ?auto_85061 ?auto_85067 ) ) ( not ( = ?auto_85062 ?auto_85063 ) ) ( not ( = ?auto_85062 ?auto_85064 ) ) ( not ( = ?auto_85062 ?auto_85065 ) ) ( not ( = ?auto_85062 ?auto_85066 ) ) ( not ( = ?auto_85062 ?auto_85067 ) ) ( not ( = ?auto_85063 ?auto_85064 ) ) ( not ( = ?auto_85063 ?auto_85065 ) ) ( not ( = ?auto_85063 ?auto_85066 ) ) ( not ( = ?auto_85063 ?auto_85067 ) ) ( not ( = ?auto_85064 ?auto_85065 ) ) ( not ( = ?auto_85064 ?auto_85066 ) ) ( not ( = ?auto_85064 ?auto_85067 ) ) ( not ( = ?auto_85065 ?auto_85066 ) ) ( not ( = ?auto_85065 ?auto_85067 ) ) ( not ( = ?auto_85066 ?auto_85067 ) ) ( ON ?auto_85067 ?auto_85068 ) ( not ( = ?auto_85061 ?auto_85068 ) ) ( not ( = ?auto_85062 ?auto_85068 ) ) ( not ( = ?auto_85063 ?auto_85068 ) ) ( not ( = ?auto_85064 ?auto_85068 ) ) ( not ( = ?auto_85065 ?auto_85068 ) ) ( not ( = ?auto_85066 ?auto_85068 ) ) ( not ( = ?auto_85067 ?auto_85068 ) ) ( ON ?auto_85066 ?auto_85067 ) ( ON-TABLE ?auto_85068 ) ( ON ?auto_85065 ?auto_85066 ) ( ON ?auto_85064 ?auto_85065 ) ( ON ?auto_85063 ?auto_85064 ) ( CLEAR ?auto_85063 ) ( HOLDING ?auto_85062 ) ( CLEAR ?auto_85061 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_85061 ?auto_85062 )
      ( MAKE-7PILE ?auto_85061 ?auto_85062 ?auto_85063 ?auto_85064 ?auto_85065 ?auto_85066 ?auto_85067 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_85069 - BLOCK
      ?auto_85070 - BLOCK
      ?auto_85071 - BLOCK
      ?auto_85072 - BLOCK
      ?auto_85073 - BLOCK
      ?auto_85074 - BLOCK
      ?auto_85075 - BLOCK
    )
    :vars
    (
      ?auto_85076 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85069 ) ( not ( = ?auto_85069 ?auto_85070 ) ) ( not ( = ?auto_85069 ?auto_85071 ) ) ( not ( = ?auto_85069 ?auto_85072 ) ) ( not ( = ?auto_85069 ?auto_85073 ) ) ( not ( = ?auto_85069 ?auto_85074 ) ) ( not ( = ?auto_85069 ?auto_85075 ) ) ( not ( = ?auto_85070 ?auto_85071 ) ) ( not ( = ?auto_85070 ?auto_85072 ) ) ( not ( = ?auto_85070 ?auto_85073 ) ) ( not ( = ?auto_85070 ?auto_85074 ) ) ( not ( = ?auto_85070 ?auto_85075 ) ) ( not ( = ?auto_85071 ?auto_85072 ) ) ( not ( = ?auto_85071 ?auto_85073 ) ) ( not ( = ?auto_85071 ?auto_85074 ) ) ( not ( = ?auto_85071 ?auto_85075 ) ) ( not ( = ?auto_85072 ?auto_85073 ) ) ( not ( = ?auto_85072 ?auto_85074 ) ) ( not ( = ?auto_85072 ?auto_85075 ) ) ( not ( = ?auto_85073 ?auto_85074 ) ) ( not ( = ?auto_85073 ?auto_85075 ) ) ( not ( = ?auto_85074 ?auto_85075 ) ) ( ON ?auto_85075 ?auto_85076 ) ( not ( = ?auto_85069 ?auto_85076 ) ) ( not ( = ?auto_85070 ?auto_85076 ) ) ( not ( = ?auto_85071 ?auto_85076 ) ) ( not ( = ?auto_85072 ?auto_85076 ) ) ( not ( = ?auto_85073 ?auto_85076 ) ) ( not ( = ?auto_85074 ?auto_85076 ) ) ( not ( = ?auto_85075 ?auto_85076 ) ) ( ON ?auto_85074 ?auto_85075 ) ( ON-TABLE ?auto_85076 ) ( ON ?auto_85073 ?auto_85074 ) ( ON ?auto_85072 ?auto_85073 ) ( ON ?auto_85071 ?auto_85072 ) ( CLEAR ?auto_85069 ) ( ON ?auto_85070 ?auto_85071 ) ( CLEAR ?auto_85070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85076 ?auto_85075 ?auto_85074 ?auto_85073 ?auto_85072 ?auto_85071 )
      ( MAKE-7PILE ?auto_85069 ?auto_85070 ?auto_85071 ?auto_85072 ?auto_85073 ?auto_85074 ?auto_85075 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_85077 - BLOCK
      ?auto_85078 - BLOCK
      ?auto_85079 - BLOCK
      ?auto_85080 - BLOCK
      ?auto_85081 - BLOCK
      ?auto_85082 - BLOCK
      ?auto_85083 - BLOCK
    )
    :vars
    (
      ?auto_85084 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85077 ?auto_85078 ) ) ( not ( = ?auto_85077 ?auto_85079 ) ) ( not ( = ?auto_85077 ?auto_85080 ) ) ( not ( = ?auto_85077 ?auto_85081 ) ) ( not ( = ?auto_85077 ?auto_85082 ) ) ( not ( = ?auto_85077 ?auto_85083 ) ) ( not ( = ?auto_85078 ?auto_85079 ) ) ( not ( = ?auto_85078 ?auto_85080 ) ) ( not ( = ?auto_85078 ?auto_85081 ) ) ( not ( = ?auto_85078 ?auto_85082 ) ) ( not ( = ?auto_85078 ?auto_85083 ) ) ( not ( = ?auto_85079 ?auto_85080 ) ) ( not ( = ?auto_85079 ?auto_85081 ) ) ( not ( = ?auto_85079 ?auto_85082 ) ) ( not ( = ?auto_85079 ?auto_85083 ) ) ( not ( = ?auto_85080 ?auto_85081 ) ) ( not ( = ?auto_85080 ?auto_85082 ) ) ( not ( = ?auto_85080 ?auto_85083 ) ) ( not ( = ?auto_85081 ?auto_85082 ) ) ( not ( = ?auto_85081 ?auto_85083 ) ) ( not ( = ?auto_85082 ?auto_85083 ) ) ( ON ?auto_85083 ?auto_85084 ) ( not ( = ?auto_85077 ?auto_85084 ) ) ( not ( = ?auto_85078 ?auto_85084 ) ) ( not ( = ?auto_85079 ?auto_85084 ) ) ( not ( = ?auto_85080 ?auto_85084 ) ) ( not ( = ?auto_85081 ?auto_85084 ) ) ( not ( = ?auto_85082 ?auto_85084 ) ) ( not ( = ?auto_85083 ?auto_85084 ) ) ( ON ?auto_85082 ?auto_85083 ) ( ON-TABLE ?auto_85084 ) ( ON ?auto_85081 ?auto_85082 ) ( ON ?auto_85080 ?auto_85081 ) ( ON ?auto_85079 ?auto_85080 ) ( ON ?auto_85078 ?auto_85079 ) ( CLEAR ?auto_85078 ) ( HOLDING ?auto_85077 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_85077 )
      ( MAKE-7PILE ?auto_85077 ?auto_85078 ?auto_85079 ?auto_85080 ?auto_85081 ?auto_85082 ?auto_85083 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_85085 - BLOCK
      ?auto_85086 - BLOCK
      ?auto_85087 - BLOCK
      ?auto_85088 - BLOCK
      ?auto_85089 - BLOCK
      ?auto_85090 - BLOCK
      ?auto_85091 - BLOCK
    )
    :vars
    (
      ?auto_85092 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85085 ?auto_85086 ) ) ( not ( = ?auto_85085 ?auto_85087 ) ) ( not ( = ?auto_85085 ?auto_85088 ) ) ( not ( = ?auto_85085 ?auto_85089 ) ) ( not ( = ?auto_85085 ?auto_85090 ) ) ( not ( = ?auto_85085 ?auto_85091 ) ) ( not ( = ?auto_85086 ?auto_85087 ) ) ( not ( = ?auto_85086 ?auto_85088 ) ) ( not ( = ?auto_85086 ?auto_85089 ) ) ( not ( = ?auto_85086 ?auto_85090 ) ) ( not ( = ?auto_85086 ?auto_85091 ) ) ( not ( = ?auto_85087 ?auto_85088 ) ) ( not ( = ?auto_85087 ?auto_85089 ) ) ( not ( = ?auto_85087 ?auto_85090 ) ) ( not ( = ?auto_85087 ?auto_85091 ) ) ( not ( = ?auto_85088 ?auto_85089 ) ) ( not ( = ?auto_85088 ?auto_85090 ) ) ( not ( = ?auto_85088 ?auto_85091 ) ) ( not ( = ?auto_85089 ?auto_85090 ) ) ( not ( = ?auto_85089 ?auto_85091 ) ) ( not ( = ?auto_85090 ?auto_85091 ) ) ( ON ?auto_85091 ?auto_85092 ) ( not ( = ?auto_85085 ?auto_85092 ) ) ( not ( = ?auto_85086 ?auto_85092 ) ) ( not ( = ?auto_85087 ?auto_85092 ) ) ( not ( = ?auto_85088 ?auto_85092 ) ) ( not ( = ?auto_85089 ?auto_85092 ) ) ( not ( = ?auto_85090 ?auto_85092 ) ) ( not ( = ?auto_85091 ?auto_85092 ) ) ( ON ?auto_85090 ?auto_85091 ) ( ON-TABLE ?auto_85092 ) ( ON ?auto_85089 ?auto_85090 ) ( ON ?auto_85088 ?auto_85089 ) ( ON ?auto_85087 ?auto_85088 ) ( ON ?auto_85086 ?auto_85087 ) ( ON ?auto_85085 ?auto_85086 ) ( CLEAR ?auto_85085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_85092 ?auto_85091 ?auto_85090 ?auto_85089 ?auto_85088 ?auto_85087 ?auto_85086 )
      ( MAKE-7PILE ?auto_85085 ?auto_85086 ?auto_85087 ?auto_85088 ?auto_85089 ?auto_85090 ?auto_85091 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_85099 - BLOCK
      ?auto_85100 - BLOCK
      ?auto_85101 - BLOCK
      ?auto_85102 - BLOCK
      ?auto_85103 - BLOCK
      ?auto_85104 - BLOCK
    )
    :vars
    (
      ?auto_85105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85105 ?auto_85104 ) ( CLEAR ?auto_85105 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_85099 ) ( ON ?auto_85100 ?auto_85099 ) ( ON ?auto_85101 ?auto_85100 ) ( ON ?auto_85102 ?auto_85101 ) ( ON ?auto_85103 ?auto_85102 ) ( ON ?auto_85104 ?auto_85103 ) ( not ( = ?auto_85099 ?auto_85100 ) ) ( not ( = ?auto_85099 ?auto_85101 ) ) ( not ( = ?auto_85099 ?auto_85102 ) ) ( not ( = ?auto_85099 ?auto_85103 ) ) ( not ( = ?auto_85099 ?auto_85104 ) ) ( not ( = ?auto_85099 ?auto_85105 ) ) ( not ( = ?auto_85100 ?auto_85101 ) ) ( not ( = ?auto_85100 ?auto_85102 ) ) ( not ( = ?auto_85100 ?auto_85103 ) ) ( not ( = ?auto_85100 ?auto_85104 ) ) ( not ( = ?auto_85100 ?auto_85105 ) ) ( not ( = ?auto_85101 ?auto_85102 ) ) ( not ( = ?auto_85101 ?auto_85103 ) ) ( not ( = ?auto_85101 ?auto_85104 ) ) ( not ( = ?auto_85101 ?auto_85105 ) ) ( not ( = ?auto_85102 ?auto_85103 ) ) ( not ( = ?auto_85102 ?auto_85104 ) ) ( not ( = ?auto_85102 ?auto_85105 ) ) ( not ( = ?auto_85103 ?auto_85104 ) ) ( not ( = ?auto_85103 ?auto_85105 ) ) ( not ( = ?auto_85104 ?auto_85105 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_85105 ?auto_85104 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_85121 - BLOCK
      ?auto_85122 - BLOCK
      ?auto_85123 - BLOCK
      ?auto_85124 - BLOCK
      ?auto_85125 - BLOCK
      ?auto_85126 - BLOCK
    )
    :vars
    (
      ?auto_85127 - BLOCK
      ?auto_85128 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85121 ) ( ON ?auto_85122 ?auto_85121 ) ( ON ?auto_85123 ?auto_85122 ) ( ON ?auto_85124 ?auto_85123 ) ( ON ?auto_85125 ?auto_85124 ) ( not ( = ?auto_85121 ?auto_85122 ) ) ( not ( = ?auto_85121 ?auto_85123 ) ) ( not ( = ?auto_85121 ?auto_85124 ) ) ( not ( = ?auto_85121 ?auto_85125 ) ) ( not ( = ?auto_85121 ?auto_85126 ) ) ( not ( = ?auto_85121 ?auto_85127 ) ) ( not ( = ?auto_85122 ?auto_85123 ) ) ( not ( = ?auto_85122 ?auto_85124 ) ) ( not ( = ?auto_85122 ?auto_85125 ) ) ( not ( = ?auto_85122 ?auto_85126 ) ) ( not ( = ?auto_85122 ?auto_85127 ) ) ( not ( = ?auto_85123 ?auto_85124 ) ) ( not ( = ?auto_85123 ?auto_85125 ) ) ( not ( = ?auto_85123 ?auto_85126 ) ) ( not ( = ?auto_85123 ?auto_85127 ) ) ( not ( = ?auto_85124 ?auto_85125 ) ) ( not ( = ?auto_85124 ?auto_85126 ) ) ( not ( = ?auto_85124 ?auto_85127 ) ) ( not ( = ?auto_85125 ?auto_85126 ) ) ( not ( = ?auto_85125 ?auto_85127 ) ) ( not ( = ?auto_85126 ?auto_85127 ) ) ( ON ?auto_85127 ?auto_85128 ) ( CLEAR ?auto_85127 ) ( not ( = ?auto_85121 ?auto_85128 ) ) ( not ( = ?auto_85122 ?auto_85128 ) ) ( not ( = ?auto_85123 ?auto_85128 ) ) ( not ( = ?auto_85124 ?auto_85128 ) ) ( not ( = ?auto_85125 ?auto_85128 ) ) ( not ( = ?auto_85126 ?auto_85128 ) ) ( not ( = ?auto_85127 ?auto_85128 ) ) ( HOLDING ?auto_85126 ) ( CLEAR ?auto_85125 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_85121 ?auto_85122 ?auto_85123 ?auto_85124 ?auto_85125 ?auto_85126 ?auto_85127 )
      ( MAKE-6PILE ?auto_85121 ?auto_85122 ?auto_85123 ?auto_85124 ?auto_85125 ?auto_85126 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_85129 - BLOCK
      ?auto_85130 - BLOCK
      ?auto_85131 - BLOCK
      ?auto_85132 - BLOCK
      ?auto_85133 - BLOCK
      ?auto_85134 - BLOCK
    )
    :vars
    (
      ?auto_85135 - BLOCK
      ?auto_85136 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85129 ) ( ON ?auto_85130 ?auto_85129 ) ( ON ?auto_85131 ?auto_85130 ) ( ON ?auto_85132 ?auto_85131 ) ( ON ?auto_85133 ?auto_85132 ) ( not ( = ?auto_85129 ?auto_85130 ) ) ( not ( = ?auto_85129 ?auto_85131 ) ) ( not ( = ?auto_85129 ?auto_85132 ) ) ( not ( = ?auto_85129 ?auto_85133 ) ) ( not ( = ?auto_85129 ?auto_85134 ) ) ( not ( = ?auto_85129 ?auto_85135 ) ) ( not ( = ?auto_85130 ?auto_85131 ) ) ( not ( = ?auto_85130 ?auto_85132 ) ) ( not ( = ?auto_85130 ?auto_85133 ) ) ( not ( = ?auto_85130 ?auto_85134 ) ) ( not ( = ?auto_85130 ?auto_85135 ) ) ( not ( = ?auto_85131 ?auto_85132 ) ) ( not ( = ?auto_85131 ?auto_85133 ) ) ( not ( = ?auto_85131 ?auto_85134 ) ) ( not ( = ?auto_85131 ?auto_85135 ) ) ( not ( = ?auto_85132 ?auto_85133 ) ) ( not ( = ?auto_85132 ?auto_85134 ) ) ( not ( = ?auto_85132 ?auto_85135 ) ) ( not ( = ?auto_85133 ?auto_85134 ) ) ( not ( = ?auto_85133 ?auto_85135 ) ) ( not ( = ?auto_85134 ?auto_85135 ) ) ( ON ?auto_85135 ?auto_85136 ) ( not ( = ?auto_85129 ?auto_85136 ) ) ( not ( = ?auto_85130 ?auto_85136 ) ) ( not ( = ?auto_85131 ?auto_85136 ) ) ( not ( = ?auto_85132 ?auto_85136 ) ) ( not ( = ?auto_85133 ?auto_85136 ) ) ( not ( = ?auto_85134 ?auto_85136 ) ) ( not ( = ?auto_85135 ?auto_85136 ) ) ( CLEAR ?auto_85133 ) ( ON ?auto_85134 ?auto_85135 ) ( CLEAR ?auto_85134 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_85136 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_85136 ?auto_85135 )
      ( MAKE-6PILE ?auto_85129 ?auto_85130 ?auto_85131 ?auto_85132 ?auto_85133 ?auto_85134 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_85137 - BLOCK
      ?auto_85138 - BLOCK
      ?auto_85139 - BLOCK
      ?auto_85140 - BLOCK
      ?auto_85141 - BLOCK
      ?auto_85142 - BLOCK
    )
    :vars
    (
      ?auto_85144 - BLOCK
      ?auto_85143 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85137 ) ( ON ?auto_85138 ?auto_85137 ) ( ON ?auto_85139 ?auto_85138 ) ( ON ?auto_85140 ?auto_85139 ) ( not ( = ?auto_85137 ?auto_85138 ) ) ( not ( = ?auto_85137 ?auto_85139 ) ) ( not ( = ?auto_85137 ?auto_85140 ) ) ( not ( = ?auto_85137 ?auto_85141 ) ) ( not ( = ?auto_85137 ?auto_85142 ) ) ( not ( = ?auto_85137 ?auto_85144 ) ) ( not ( = ?auto_85138 ?auto_85139 ) ) ( not ( = ?auto_85138 ?auto_85140 ) ) ( not ( = ?auto_85138 ?auto_85141 ) ) ( not ( = ?auto_85138 ?auto_85142 ) ) ( not ( = ?auto_85138 ?auto_85144 ) ) ( not ( = ?auto_85139 ?auto_85140 ) ) ( not ( = ?auto_85139 ?auto_85141 ) ) ( not ( = ?auto_85139 ?auto_85142 ) ) ( not ( = ?auto_85139 ?auto_85144 ) ) ( not ( = ?auto_85140 ?auto_85141 ) ) ( not ( = ?auto_85140 ?auto_85142 ) ) ( not ( = ?auto_85140 ?auto_85144 ) ) ( not ( = ?auto_85141 ?auto_85142 ) ) ( not ( = ?auto_85141 ?auto_85144 ) ) ( not ( = ?auto_85142 ?auto_85144 ) ) ( ON ?auto_85144 ?auto_85143 ) ( not ( = ?auto_85137 ?auto_85143 ) ) ( not ( = ?auto_85138 ?auto_85143 ) ) ( not ( = ?auto_85139 ?auto_85143 ) ) ( not ( = ?auto_85140 ?auto_85143 ) ) ( not ( = ?auto_85141 ?auto_85143 ) ) ( not ( = ?auto_85142 ?auto_85143 ) ) ( not ( = ?auto_85144 ?auto_85143 ) ) ( ON ?auto_85142 ?auto_85144 ) ( CLEAR ?auto_85142 ) ( ON-TABLE ?auto_85143 ) ( HOLDING ?auto_85141 ) ( CLEAR ?auto_85140 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_85137 ?auto_85138 ?auto_85139 ?auto_85140 ?auto_85141 )
      ( MAKE-6PILE ?auto_85137 ?auto_85138 ?auto_85139 ?auto_85140 ?auto_85141 ?auto_85142 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_85145 - BLOCK
      ?auto_85146 - BLOCK
      ?auto_85147 - BLOCK
      ?auto_85148 - BLOCK
      ?auto_85149 - BLOCK
      ?auto_85150 - BLOCK
    )
    :vars
    (
      ?auto_85151 - BLOCK
      ?auto_85152 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85145 ) ( ON ?auto_85146 ?auto_85145 ) ( ON ?auto_85147 ?auto_85146 ) ( ON ?auto_85148 ?auto_85147 ) ( not ( = ?auto_85145 ?auto_85146 ) ) ( not ( = ?auto_85145 ?auto_85147 ) ) ( not ( = ?auto_85145 ?auto_85148 ) ) ( not ( = ?auto_85145 ?auto_85149 ) ) ( not ( = ?auto_85145 ?auto_85150 ) ) ( not ( = ?auto_85145 ?auto_85151 ) ) ( not ( = ?auto_85146 ?auto_85147 ) ) ( not ( = ?auto_85146 ?auto_85148 ) ) ( not ( = ?auto_85146 ?auto_85149 ) ) ( not ( = ?auto_85146 ?auto_85150 ) ) ( not ( = ?auto_85146 ?auto_85151 ) ) ( not ( = ?auto_85147 ?auto_85148 ) ) ( not ( = ?auto_85147 ?auto_85149 ) ) ( not ( = ?auto_85147 ?auto_85150 ) ) ( not ( = ?auto_85147 ?auto_85151 ) ) ( not ( = ?auto_85148 ?auto_85149 ) ) ( not ( = ?auto_85148 ?auto_85150 ) ) ( not ( = ?auto_85148 ?auto_85151 ) ) ( not ( = ?auto_85149 ?auto_85150 ) ) ( not ( = ?auto_85149 ?auto_85151 ) ) ( not ( = ?auto_85150 ?auto_85151 ) ) ( ON ?auto_85151 ?auto_85152 ) ( not ( = ?auto_85145 ?auto_85152 ) ) ( not ( = ?auto_85146 ?auto_85152 ) ) ( not ( = ?auto_85147 ?auto_85152 ) ) ( not ( = ?auto_85148 ?auto_85152 ) ) ( not ( = ?auto_85149 ?auto_85152 ) ) ( not ( = ?auto_85150 ?auto_85152 ) ) ( not ( = ?auto_85151 ?auto_85152 ) ) ( ON ?auto_85150 ?auto_85151 ) ( ON-TABLE ?auto_85152 ) ( CLEAR ?auto_85148 ) ( ON ?auto_85149 ?auto_85150 ) ( CLEAR ?auto_85149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_85152 ?auto_85151 ?auto_85150 )
      ( MAKE-6PILE ?auto_85145 ?auto_85146 ?auto_85147 ?auto_85148 ?auto_85149 ?auto_85150 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_85153 - BLOCK
      ?auto_85154 - BLOCK
      ?auto_85155 - BLOCK
      ?auto_85156 - BLOCK
      ?auto_85157 - BLOCK
      ?auto_85158 - BLOCK
    )
    :vars
    (
      ?auto_85160 - BLOCK
      ?auto_85159 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85153 ) ( ON ?auto_85154 ?auto_85153 ) ( ON ?auto_85155 ?auto_85154 ) ( not ( = ?auto_85153 ?auto_85154 ) ) ( not ( = ?auto_85153 ?auto_85155 ) ) ( not ( = ?auto_85153 ?auto_85156 ) ) ( not ( = ?auto_85153 ?auto_85157 ) ) ( not ( = ?auto_85153 ?auto_85158 ) ) ( not ( = ?auto_85153 ?auto_85160 ) ) ( not ( = ?auto_85154 ?auto_85155 ) ) ( not ( = ?auto_85154 ?auto_85156 ) ) ( not ( = ?auto_85154 ?auto_85157 ) ) ( not ( = ?auto_85154 ?auto_85158 ) ) ( not ( = ?auto_85154 ?auto_85160 ) ) ( not ( = ?auto_85155 ?auto_85156 ) ) ( not ( = ?auto_85155 ?auto_85157 ) ) ( not ( = ?auto_85155 ?auto_85158 ) ) ( not ( = ?auto_85155 ?auto_85160 ) ) ( not ( = ?auto_85156 ?auto_85157 ) ) ( not ( = ?auto_85156 ?auto_85158 ) ) ( not ( = ?auto_85156 ?auto_85160 ) ) ( not ( = ?auto_85157 ?auto_85158 ) ) ( not ( = ?auto_85157 ?auto_85160 ) ) ( not ( = ?auto_85158 ?auto_85160 ) ) ( ON ?auto_85160 ?auto_85159 ) ( not ( = ?auto_85153 ?auto_85159 ) ) ( not ( = ?auto_85154 ?auto_85159 ) ) ( not ( = ?auto_85155 ?auto_85159 ) ) ( not ( = ?auto_85156 ?auto_85159 ) ) ( not ( = ?auto_85157 ?auto_85159 ) ) ( not ( = ?auto_85158 ?auto_85159 ) ) ( not ( = ?auto_85160 ?auto_85159 ) ) ( ON ?auto_85158 ?auto_85160 ) ( ON-TABLE ?auto_85159 ) ( ON ?auto_85157 ?auto_85158 ) ( CLEAR ?auto_85157 ) ( HOLDING ?auto_85156 ) ( CLEAR ?auto_85155 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_85153 ?auto_85154 ?auto_85155 ?auto_85156 )
      ( MAKE-6PILE ?auto_85153 ?auto_85154 ?auto_85155 ?auto_85156 ?auto_85157 ?auto_85158 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_85161 - BLOCK
      ?auto_85162 - BLOCK
      ?auto_85163 - BLOCK
      ?auto_85164 - BLOCK
      ?auto_85165 - BLOCK
      ?auto_85166 - BLOCK
    )
    :vars
    (
      ?auto_85167 - BLOCK
      ?auto_85168 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85161 ) ( ON ?auto_85162 ?auto_85161 ) ( ON ?auto_85163 ?auto_85162 ) ( not ( = ?auto_85161 ?auto_85162 ) ) ( not ( = ?auto_85161 ?auto_85163 ) ) ( not ( = ?auto_85161 ?auto_85164 ) ) ( not ( = ?auto_85161 ?auto_85165 ) ) ( not ( = ?auto_85161 ?auto_85166 ) ) ( not ( = ?auto_85161 ?auto_85167 ) ) ( not ( = ?auto_85162 ?auto_85163 ) ) ( not ( = ?auto_85162 ?auto_85164 ) ) ( not ( = ?auto_85162 ?auto_85165 ) ) ( not ( = ?auto_85162 ?auto_85166 ) ) ( not ( = ?auto_85162 ?auto_85167 ) ) ( not ( = ?auto_85163 ?auto_85164 ) ) ( not ( = ?auto_85163 ?auto_85165 ) ) ( not ( = ?auto_85163 ?auto_85166 ) ) ( not ( = ?auto_85163 ?auto_85167 ) ) ( not ( = ?auto_85164 ?auto_85165 ) ) ( not ( = ?auto_85164 ?auto_85166 ) ) ( not ( = ?auto_85164 ?auto_85167 ) ) ( not ( = ?auto_85165 ?auto_85166 ) ) ( not ( = ?auto_85165 ?auto_85167 ) ) ( not ( = ?auto_85166 ?auto_85167 ) ) ( ON ?auto_85167 ?auto_85168 ) ( not ( = ?auto_85161 ?auto_85168 ) ) ( not ( = ?auto_85162 ?auto_85168 ) ) ( not ( = ?auto_85163 ?auto_85168 ) ) ( not ( = ?auto_85164 ?auto_85168 ) ) ( not ( = ?auto_85165 ?auto_85168 ) ) ( not ( = ?auto_85166 ?auto_85168 ) ) ( not ( = ?auto_85167 ?auto_85168 ) ) ( ON ?auto_85166 ?auto_85167 ) ( ON-TABLE ?auto_85168 ) ( ON ?auto_85165 ?auto_85166 ) ( CLEAR ?auto_85163 ) ( ON ?auto_85164 ?auto_85165 ) ( CLEAR ?auto_85164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_85168 ?auto_85167 ?auto_85166 ?auto_85165 )
      ( MAKE-6PILE ?auto_85161 ?auto_85162 ?auto_85163 ?auto_85164 ?auto_85165 ?auto_85166 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_85169 - BLOCK
      ?auto_85170 - BLOCK
      ?auto_85171 - BLOCK
      ?auto_85172 - BLOCK
      ?auto_85173 - BLOCK
      ?auto_85174 - BLOCK
    )
    :vars
    (
      ?auto_85176 - BLOCK
      ?auto_85175 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85169 ) ( ON ?auto_85170 ?auto_85169 ) ( not ( = ?auto_85169 ?auto_85170 ) ) ( not ( = ?auto_85169 ?auto_85171 ) ) ( not ( = ?auto_85169 ?auto_85172 ) ) ( not ( = ?auto_85169 ?auto_85173 ) ) ( not ( = ?auto_85169 ?auto_85174 ) ) ( not ( = ?auto_85169 ?auto_85176 ) ) ( not ( = ?auto_85170 ?auto_85171 ) ) ( not ( = ?auto_85170 ?auto_85172 ) ) ( not ( = ?auto_85170 ?auto_85173 ) ) ( not ( = ?auto_85170 ?auto_85174 ) ) ( not ( = ?auto_85170 ?auto_85176 ) ) ( not ( = ?auto_85171 ?auto_85172 ) ) ( not ( = ?auto_85171 ?auto_85173 ) ) ( not ( = ?auto_85171 ?auto_85174 ) ) ( not ( = ?auto_85171 ?auto_85176 ) ) ( not ( = ?auto_85172 ?auto_85173 ) ) ( not ( = ?auto_85172 ?auto_85174 ) ) ( not ( = ?auto_85172 ?auto_85176 ) ) ( not ( = ?auto_85173 ?auto_85174 ) ) ( not ( = ?auto_85173 ?auto_85176 ) ) ( not ( = ?auto_85174 ?auto_85176 ) ) ( ON ?auto_85176 ?auto_85175 ) ( not ( = ?auto_85169 ?auto_85175 ) ) ( not ( = ?auto_85170 ?auto_85175 ) ) ( not ( = ?auto_85171 ?auto_85175 ) ) ( not ( = ?auto_85172 ?auto_85175 ) ) ( not ( = ?auto_85173 ?auto_85175 ) ) ( not ( = ?auto_85174 ?auto_85175 ) ) ( not ( = ?auto_85176 ?auto_85175 ) ) ( ON ?auto_85174 ?auto_85176 ) ( ON-TABLE ?auto_85175 ) ( ON ?auto_85173 ?auto_85174 ) ( ON ?auto_85172 ?auto_85173 ) ( CLEAR ?auto_85172 ) ( HOLDING ?auto_85171 ) ( CLEAR ?auto_85170 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_85169 ?auto_85170 ?auto_85171 )
      ( MAKE-6PILE ?auto_85169 ?auto_85170 ?auto_85171 ?auto_85172 ?auto_85173 ?auto_85174 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_85177 - BLOCK
      ?auto_85178 - BLOCK
      ?auto_85179 - BLOCK
      ?auto_85180 - BLOCK
      ?auto_85181 - BLOCK
      ?auto_85182 - BLOCK
    )
    :vars
    (
      ?auto_85183 - BLOCK
      ?auto_85184 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85177 ) ( ON ?auto_85178 ?auto_85177 ) ( not ( = ?auto_85177 ?auto_85178 ) ) ( not ( = ?auto_85177 ?auto_85179 ) ) ( not ( = ?auto_85177 ?auto_85180 ) ) ( not ( = ?auto_85177 ?auto_85181 ) ) ( not ( = ?auto_85177 ?auto_85182 ) ) ( not ( = ?auto_85177 ?auto_85183 ) ) ( not ( = ?auto_85178 ?auto_85179 ) ) ( not ( = ?auto_85178 ?auto_85180 ) ) ( not ( = ?auto_85178 ?auto_85181 ) ) ( not ( = ?auto_85178 ?auto_85182 ) ) ( not ( = ?auto_85178 ?auto_85183 ) ) ( not ( = ?auto_85179 ?auto_85180 ) ) ( not ( = ?auto_85179 ?auto_85181 ) ) ( not ( = ?auto_85179 ?auto_85182 ) ) ( not ( = ?auto_85179 ?auto_85183 ) ) ( not ( = ?auto_85180 ?auto_85181 ) ) ( not ( = ?auto_85180 ?auto_85182 ) ) ( not ( = ?auto_85180 ?auto_85183 ) ) ( not ( = ?auto_85181 ?auto_85182 ) ) ( not ( = ?auto_85181 ?auto_85183 ) ) ( not ( = ?auto_85182 ?auto_85183 ) ) ( ON ?auto_85183 ?auto_85184 ) ( not ( = ?auto_85177 ?auto_85184 ) ) ( not ( = ?auto_85178 ?auto_85184 ) ) ( not ( = ?auto_85179 ?auto_85184 ) ) ( not ( = ?auto_85180 ?auto_85184 ) ) ( not ( = ?auto_85181 ?auto_85184 ) ) ( not ( = ?auto_85182 ?auto_85184 ) ) ( not ( = ?auto_85183 ?auto_85184 ) ) ( ON ?auto_85182 ?auto_85183 ) ( ON-TABLE ?auto_85184 ) ( ON ?auto_85181 ?auto_85182 ) ( ON ?auto_85180 ?auto_85181 ) ( CLEAR ?auto_85178 ) ( ON ?auto_85179 ?auto_85180 ) ( CLEAR ?auto_85179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_85184 ?auto_85183 ?auto_85182 ?auto_85181 ?auto_85180 )
      ( MAKE-6PILE ?auto_85177 ?auto_85178 ?auto_85179 ?auto_85180 ?auto_85181 ?auto_85182 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_85185 - BLOCK
      ?auto_85186 - BLOCK
      ?auto_85187 - BLOCK
      ?auto_85188 - BLOCK
      ?auto_85189 - BLOCK
      ?auto_85190 - BLOCK
    )
    :vars
    (
      ?auto_85191 - BLOCK
      ?auto_85192 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85185 ) ( not ( = ?auto_85185 ?auto_85186 ) ) ( not ( = ?auto_85185 ?auto_85187 ) ) ( not ( = ?auto_85185 ?auto_85188 ) ) ( not ( = ?auto_85185 ?auto_85189 ) ) ( not ( = ?auto_85185 ?auto_85190 ) ) ( not ( = ?auto_85185 ?auto_85191 ) ) ( not ( = ?auto_85186 ?auto_85187 ) ) ( not ( = ?auto_85186 ?auto_85188 ) ) ( not ( = ?auto_85186 ?auto_85189 ) ) ( not ( = ?auto_85186 ?auto_85190 ) ) ( not ( = ?auto_85186 ?auto_85191 ) ) ( not ( = ?auto_85187 ?auto_85188 ) ) ( not ( = ?auto_85187 ?auto_85189 ) ) ( not ( = ?auto_85187 ?auto_85190 ) ) ( not ( = ?auto_85187 ?auto_85191 ) ) ( not ( = ?auto_85188 ?auto_85189 ) ) ( not ( = ?auto_85188 ?auto_85190 ) ) ( not ( = ?auto_85188 ?auto_85191 ) ) ( not ( = ?auto_85189 ?auto_85190 ) ) ( not ( = ?auto_85189 ?auto_85191 ) ) ( not ( = ?auto_85190 ?auto_85191 ) ) ( ON ?auto_85191 ?auto_85192 ) ( not ( = ?auto_85185 ?auto_85192 ) ) ( not ( = ?auto_85186 ?auto_85192 ) ) ( not ( = ?auto_85187 ?auto_85192 ) ) ( not ( = ?auto_85188 ?auto_85192 ) ) ( not ( = ?auto_85189 ?auto_85192 ) ) ( not ( = ?auto_85190 ?auto_85192 ) ) ( not ( = ?auto_85191 ?auto_85192 ) ) ( ON ?auto_85190 ?auto_85191 ) ( ON-TABLE ?auto_85192 ) ( ON ?auto_85189 ?auto_85190 ) ( ON ?auto_85188 ?auto_85189 ) ( ON ?auto_85187 ?auto_85188 ) ( CLEAR ?auto_85187 ) ( HOLDING ?auto_85186 ) ( CLEAR ?auto_85185 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_85185 ?auto_85186 )
      ( MAKE-6PILE ?auto_85185 ?auto_85186 ?auto_85187 ?auto_85188 ?auto_85189 ?auto_85190 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_85193 - BLOCK
      ?auto_85194 - BLOCK
      ?auto_85195 - BLOCK
      ?auto_85196 - BLOCK
      ?auto_85197 - BLOCK
      ?auto_85198 - BLOCK
    )
    :vars
    (
      ?auto_85199 - BLOCK
      ?auto_85200 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85193 ) ( not ( = ?auto_85193 ?auto_85194 ) ) ( not ( = ?auto_85193 ?auto_85195 ) ) ( not ( = ?auto_85193 ?auto_85196 ) ) ( not ( = ?auto_85193 ?auto_85197 ) ) ( not ( = ?auto_85193 ?auto_85198 ) ) ( not ( = ?auto_85193 ?auto_85199 ) ) ( not ( = ?auto_85194 ?auto_85195 ) ) ( not ( = ?auto_85194 ?auto_85196 ) ) ( not ( = ?auto_85194 ?auto_85197 ) ) ( not ( = ?auto_85194 ?auto_85198 ) ) ( not ( = ?auto_85194 ?auto_85199 ) ) ( not ( = ?auto_85195 ?auto_85196 ) ) ( not ( = ?auto_85195 ?auto_85197 ) ) ( not ( = ?auto_85195 ?auto_85198 ) ) ( not ( = ?auto_85195 ?auto_85199 ) ) ( not ( = ?auto_85196 ?auto_85197 ) ) ( not ( = ?auto_85196 ?auto_85198 ) ) ( not ( = ?auto_85196 ?auto_85199 ) ) ( not ( = ?auto_85197 ?auto_85198 ) ) ( not ( = ?auto_85197 ?auto_85199 ) ) ( not ( = ?auto_85198 ?auto_85199 ) ) ( ON ?auto_85199 ?auto_85200 ) ( not ( = ?auto_85193 ?auto_85200 ) ) ( not ( = ?auto_85194 ?auto_85200 ) ) ( not ( = ?auto_85195 ?auto_85200 ) ) ( not ( = ?auto_85196 ?auto_85200 ) ) ( not ( = ?auto_85197 ?auto_85200 ) ) ( not ( = ?auto_85198 ?auto_85200 ) ) ( not ( = ?auto_85199 ?auto_85200 ) ) ( ON ?auto_85198 ?auto_85199 ) ( ON-TABLE ?auto_85200 ) ( ON ?auto_85197 ?auto_85198 ) ( ON ?auto_85196 ?auto_85197 ) ( ON ?auto_85195 ?auto_85196 ) ( CLEAR ?auto_85193 ) ( ON ?auto_85194 ?auto_85195 ) ( CLEAR ?auto_85194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85200 ?auto_85199 ?auto_85198 ?auto_85197 ?auto_85196 ?auto_85195 )
      ( MAKE-6PILE ?auto_85193 ?auto_85194 ?auto_85195 ?auto_85196 ?auto_85197 ?auto_85198 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_85201 - BLOCK
      ?auto_85202 - BLOCK
      ?auto_85203 - BLOCK
      ?auto_85204 - BLOCK
      ?auto_85205 - BLOCK
      ?auto_85206 - BLOCK
    )
    :vars
    (
      ?auto_85207 - BLOCK
      ?auto_85208 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85201 ?auto_85202 ) ) ( not ( = ?auto_85201 ?auto_85203 ) ) ( not ( = ?auto_85201 ?auto_85204 ) ) ( not ( = ?auto_85201 ?auto_85205 ) ) ( not ( = ?auto_85201 ?auto_85206 ) ) ( not ( = ?auto_85201 ?auto_85207 ) ) ( not ( = ?auto_85202 ?auto_85203 ) ) ( not ( = ?auto_85202 ?auto_85204 ) ) ( not ( = ?auto_85202 ?auto_85205 ) ) ( not ( = ?auto_85202 ?auto_85206 ) ) ( not ( = ?auto_85202 ?auto_85207 ) ) ( not ( = ?auto_85203 ?auto_85204 ) ) ( not ( = ?auto_85203 ?auto_85205 ) ) ( not ( = ?auto_85203 ?auto_85206 ) ) ( not ( = ?auto_85203 ?auto_85207 ) ) ( not ( = ?auto_85204 ?auto_85205 ) ) ( not ( = ?auto_85204 ?auto_85206 ) ) ( not ( = ?auto_85204 ?auto_85207 ) ) ( not ( = ?auto_85205 ?auto_85206 ) ) ( not ( = ?auto_85205 ?auto_85207 ) ) ( not ( = ?auto_85206 ?auto_85207 ) ) ( ON ?auto_85207 ?auto_85208 ) ( not ( = ?auto_85201 ?auto_85208 ) ) ( not ( = ?auto_85202 ?auto_85208 ) ) ( not ( = ?auto_85203 ?auto_85208 ) ) ( not ( = ?auto_85204 ?auto_85208 ) ) ( not ( = ?auto_85205 ?auto_85208 ) ) ( not ( = ?auto_85206 ?auto_85208 ) ) ( not ( = ?auto_85207 ?auto_85208 ) ) ( ON ?auto_85206 ?auto_85207 ) ( ON-TABLE ?auto_85208 ) ( ON ?auto_85205 ?auto_85206 ) ( ON ?auto_85204 ?auto_85205 ) ( ON ?auto_85203 ?auto_85204 ) ( ON ?auto_85202 ?auto_85203 ) ( CLEAR ?auto_85202 ) ( HOLDING ?auto_85201 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_85201 )
      ( MAKE-6PILE ?auto_85201 ?auto_85202 ?auto_85203 ?auto_85204 ?auto_85205 ?auto_85206 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_85209 - BLOCK
      ?auto_85210 - BLOCK
      ?auto_85211 - BLOCK
      ?auto_85212 - BLOCK
      ?auto_85213 - BLOCK
      ?auto_85214 - BLOCK
    )
    :vars
    (
      ?auto_85215 - BLOCK
      ?auto_85216 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85209 ?auto_85210 ) ) ( not ( = ?auto_85209 ?auto_85211 ) ) ( not ( = ?auto_85209 ?auto_85212 ) ) ( not ( = ?auto_85209 ?auto_85213 ) ) ( not ( = ?auto_85209 ?auto_85214 ) ) ( not ( = ?auto_85209 ?auto_85215 ) ) ( not ( = ?auto_85210 ?auto_85211 ) ) ( not ( = ?auto_85210 ?auto_85212 ) ) ( not ( = ?auto_85210 ?auto_85213 ) ) ( not ( = ?auto_85210 ?auto_85214 ) ) ( not ( = ?auto_85210 ?auto_85215 ) ) ( not ( = ?auto_85211 ?auto_85212 ) ) ( not ( = ?auto_85211 ?auto_85213 ) ) ( not ( = ?auto_85211 ?auto_85214 ) ) ( not ( = ?auto_85211 ?auto_85215 ) ) ( not ( = ?auto_85212 ?auto_85213 ) ) ( not ( = ?auto_85212 ?auto_85214 ) ) ( not ( = ?auto_85212 ?auto_85215 ) ) ( not ( = ?auto_85213 ?auto_85214 ) ) ( not ( = ?auto_85213 ?auto_85215 ) ) ( not ( = ?auto_85214 ?auto_85215 ) ) ( ON ?auto_85215 ?auto_85216 ) ( not ( = ?auto_85209 ?auto_85216 ) ) ( not ( = ?auto_85210 ?auto_85216 ) ) ( not ( = ?auto_85211 ?auto_85216 ) ) ( not ( = ?auto_85212 ?auto_85216 ) ) ( not ( = ?auto_85213 ?auto_85216 ) ) ( not ( = ?auto_85214 ?auto_85216 ) ) ( not ( = ?auto_85215 ?auto_85216 ) ) ( ON ?auto_85214 ?auto_85215 ) ( ON-TABLE ?auto_85216 ) ( ON ?auto_85213 ?auto_85214 ) ( ON ?auto_85212 ?auto_85213 ) ( ON ?auto_85211 ?auto_85212 ) ( ON ?auto_85210 ?auto_85211 ) ( ON ?auto_85209 ?auto_85210 ) ( CLEAR ?auto_85209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_85216 ?auto_85215 ?auto_85214 ?auto_85213 ?auto_85212 ?auto_85211 ?auto_85210 )
      ( MAKE-6PILE ?auto_85209 ?auto_85210 ?auto_85211 ?auto_85212 ?auto_85213 ?auto_85214 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_85218 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_85218 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_85218 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_85219 - BLOCK
    )
    :vars
    (
      ?auto_85220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85219 ?auto_85220 ) ( CLEAR ?auto_85219 ) ( HAND-EMPTY ) ( not ( = ?auto_85219 ?auto_85220 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_85219 ?auto_85220 )
      ( MAKE-1PILE ?auto_85219 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_85221 - BLOCK
    )
    :vars
    (
      ?auto_85222 - BLOCK
      ?auto_85226 - BLOCK
      ?auto_85224 - BLOCK
      ?auto_85227 - BLOCK
      ?auto_85225 - BLOCK
      ?auto_85223 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85221 ?auto_85222 ) ) ( HOLDING ?auto_85221 ) ( CLEAR ?auto_85222 ) ( ON-TABLE ?auto_85226 ) ( ON ?auto_85224 ?auto_85226 ) ( ON ?auto_85227 ?auto_85224 ) ( ON ?auto_85225 ?auto_85227 ) ( ON ?auto_85223 ?auto_85225 ) ( ON ?auto_85222 ?auto_85223 ) ( not ( = ?auto_85226 ?auto_85224 ) ) ( not ( = ?auto_85226 ?auto_85227 ) ) ( not ( = ?auto_85226 ?auto_85225 ) ) ( not ( = ?auto_85226 ?auto_85223 ) ) ( not ( = ?auto_85226 ?auto_85222 ) ) ( not ( = ?auto_85226 ?auto_85221 ) ) ( not ( = ?auto_85224 ?auto_85227 ) ) ( not ( = ?auto_85224 ?auto_85225 ) ) ( not ( = ?auto_85224 ?auto_85223 ) ) ( not ( = ?auto_85224 ?auto_85222 ) ) ( not ( = ?auto_85224 ?auto_85221 ) ) ( not ( = ?auto_85227 ?auto_85225 ) ) ( not ( = ?auto_85227 ?auto_85223 ) ) ( not ( = ?auto_85227 ?auto_85222 ) ) ( not ( = ?auto_85227 ?auto_85221 ) ) ( not ( = ?auto_85225 ?auto_85223 ) ) ( not ( = ?auto_85225 ?auto_85222 ) ) ( not ( = ?auto_85225 ?auto_85221 ) ) ( not ( = ?auto_85223 ?auto_85222 ) ) ( not ( = ?auto_85223 ?auto_85221 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_85226 ?auto_85224 ?auto_85227 ?auto_85225 ?auto_85223 ?auto_85222 ?auto_85221 )
      ( MAKE-1PILE ?auto_85221 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_85228 - BLOCK
    )
    :vars
    (
      ?auto_85232 - BLOCK
      ?auto_85234 - BLOCK
      ?auto_85229 - BLOCK
      ?auto_85231 - BLOCK
      ?auto_85230 - BLOCK
      ?auto_85233 - BLOCK
      ?auto_85235 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85228 ?auto_85232 ) ) ( CLEAR ?auto_85232 ) ( ON-TABLE ?auto_85234 ) ( ON ?auto_85229 ?auto_85234 ) ( ON ?auto_85231 ?auto_85229 ) ( ON ?auto_85230 ?auto_85231 ) ( ON ?auto_85233 ?auto_85230 ) ( ON ?auto_85232 ?auto_85233 ) ( not ( = ?auto_85234 ?auto_85229 ) ) ( not ( = ?auto_85234 ?auto_85231 ) ) ( not ( = ?auto_85234 ?auto_85230 ) ) ( not ( = ?auto_85234 ?auto_85233 ) ) ( not ( = ?auto_85234 ?auto_85232 ) ) ( not ( = ?auto_85234 ?auto_85228 ) ) ( not ( = ?auto_85229 ?auto_85231 ) ) ( not ( = ?auto_85229 ?auto_85230 ) ) ( not ( = ?auto_85229 ?auto_85233 ) ) ( not ( = ?auto_85229 ?auto_85232 ) ) ( not ( = ?auto_85229 ?auto_85228 ) ) ( not ( = ?auto_85231 ?auto_85230 ) ) ( not ( = ?auto_85231 ?auto_85233 ) ) ( not ( = ?auto_85231 ?auto_85232 ) ) ( not ( = ?auto_85231 ?auto_85228 ) ) ( not ( = ?auto_85230 ?auto_85233 ) ) ( not ( = ?auto_85230 ?auto_85232 ) ) ( not ( = ?auto_85230 ?auto_85228 ) ) ( not ( = ?auto_85233 ?auto_85232 ) ) ( not ( = ?auto_85233 ?auto_85228 ) ) ( ON ?auto_85228 ?auto_85235 ) ( CLEAR ?auto_85228 ) ( HAND-EMPTY ) ( not ( = ?auto_85228 ?auto_85235 ) ) ( not ( = ?auto_85232 ?auto_85235 ) ) ( not ( = ?auto_85234 ?auto_85235 ) ) ( not ( = ?auto_85229 ?auto_85235 ) ) ( not ( = ?auto_85231 ?auto_85235 ) ) ( not ( = ?auto_85230 ?auto_85235 ) ) ( not ( = ?auto_85233 ?auto_85235 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_85228 ?auto_85235 )
      ( MAKE-1PILE ?auto_85228 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_85236 - BLOCK
    )
    :vars
    (
      ?auto_85242 - BLOCK
      ?auto_85240 - BLOCK
      ?auto_85237 - BLOCK
      ?auto_85243 - BLOCK
      ?auto_85241 - BLOCK
      ?auto_85239 - BLOCK
      ?auto_85238 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85236 ?auto_85242 ) ) ( ON-TABLE ?auto_85240 ) ( ON ?auto_85237 ?auto_85240 ) ( ON ?auto_85243 ?auto_85237 ) ( ON ?auto_85241 ?auto_85243 ) ( ON ?auto_85239 ?auto_85241 ) ( not ( = ?auto_85240 ?auto_85237 ) ) ( not ( = ?auto_85240 ?auto_85243 ) ) ( not ( = ?auto_85240 ?auto_85241 ) ) ( not ( = ?auto_85240 ?auto_85239 ) ) ( not ( = ?auto_85240 ?auto_85242 ) ) ( not ( = ?auto_85240 ?auto_85236 ) ) ( not ( = ?auto_85237 ?auto_85243 ) ) ( not ( = ?auto_85237 ?auto_85241 ) ) ( not ( = ?auto_85237 ?auto_85239 ) ) ( not ( = ?auto_85237 ?auto_85242 ) ) ( not ( = ?auto_85237 ?auto_85236 ) ) ( not ( = ?auto_85243 ?auto_85241 ) ) ( not ( = ?auto_85243 ?auto_85239 ) ) ( not ( = ?auto_85243 ?auto_85242 ) ) ( not ( = ?auto_85243 ?auto_85236 ) ) ( not ( = ?auto_85241 ?auto_85239 ) ) ( not ( = ?auto_85241 ?auto_85242 ) ) ( not ( = ?auto_85241 ?auto_85236 ) ) ( not ( = ?auto_85239 ?auto_85242 ) ) ( not ( = ?auto_85239 ?auto_85236 ) ) ( ON ?auto_85236 ?auto_85238 ) ( CLEAR ?auto_85236 ) ( not ( = ?auto_85236 ?auto_85238 ) ) ( not ( = ?auto_85242 ?auto_85238 ) ) ( not ( = ?auto_85240 ?auto_85238 ) ) ( not ( = ?auto_85237 ?auto_85238 ) ) ( not ( = ?auto_85243 ?auto_85238 ) ) ( not ( = ?auto_85241 ?auto_85238 ) ) ( not ( = ?auto_85239 ?auto_85238 ) ) ( HOLDING ?auto_85242 ) ( CLEAR ?auto_85239 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85240 ?auto_85237 ?auto_85243 ?auto_85241 ?auto_85239 ?auto_85242 )
      ( MAKE-1PILE ?auto_85236 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_85244 - BLOCK
    )
    :vars
    (
      ?auto_85251 - BLOCK
      ?auto_85245 - BLOCK
      ?auto_85247 - BLOCK
      ?auto_85250 - BLOCK
      ?auto_85246 - BLOCK
      ?auto_85249 - BLOCK
      ?auto_85248 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85244 ?auto_85251 ) ) ( ON-TABLE ?auto_85245 ) ( ON ?auto_85247 ?auto_85245 ) ( ON ?auto_85250 ?auto_85247 ) ( ON ?auto_85246 ?auto_85250 ) ( ON ?auto_85249 ?auto_85246 ) ( not ( = ?auto_85245 ?auto_85247 ) ) ( not ( = ?auto_85245 ?auto_85250 ) ) ( not ( = ?auto_85245 ?auto_85246 ) ) ( not ( = ?auto_85245 ?auto_85249 ) ) ( not ( = ?auto_85245 ?auto_85251 ) ) ( not ( = ?auto_85245 ?auto_85244 ) ) ( not ( = ?auto_85247 ?auto_85250 ) ) ( not ( = ?auto_85247 ?auto_85246 ) ) ( not ( = ?auto_85247 ?auto_85249 ) ) ( not ( = ?auto_85247 ?auto_85251 ) ) ( not ( = ?auto_85247 ?auto_85244 ) ) ( not ( = ?auto_85250 ?auto_85246 ) ) ( not ( = ?auto_85250 ?auto_85249 ) ) ( not ( = ?auto_85250 ?auto_85251 ) ) ( not ( = ?auto_85250 ?auto_85244 ) ) ( not ( = ?auto_85246 ?auto_85249 ) ) ( not ( = ?auto_85246 ?auto_85251 ) ) ( not ( = ?auto_85246 ?auto_85244 ) ) ( not ( = ?auto_85249 ?auto_85251 ) ) ( not ( = ?auto_85249 ?auto_85244 ) ) ( ON ?auto_85244 ?auto_85248 ) ( not ( = ?auto_85244 ?auto_85248 ) ) ( not ( = ?auto_85251 ?auto_85248 ) ) ( not ( = ?auto_85245 ?auto_85248 ) ) ( not ( = ?auto_85247 ?auto_85248 ) ) ( not ( = ?auto_85250 ?auto_85248 ) ) ( not ( = ?auto_85246 ?auto_85248 ) ) ( not ( = ?auto_85249 ?auto_85248 ) ) ( CLEAR ?auto_85249 ) ( ON ?auto_85251 ?auto_85244 ) ( CLEAR ?auto_85251 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_85248 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_85248 ?auto_85244 )
      ( MAKE-1PILE ?auto_85244 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_85252 - BLOCK
    )
    :vars
    (
      ?auto_85253 - BLOCK
      ?auto_85258 - BLOCK
      ?auto_85254 - BLOCK
      ?auto_85255 - BLOCK
      ?auto_85259 - BLOCK
      ?auto_85257 - BLOCK
      ?auto_85256 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85252 ?auto_85253 ) ) ( ON-TABLE ?auto_85258 ) ( ON ?auto_85254 ?auto_85258 ) ( ON ?auto_85255 ?auto_85254 ) ( ON ?auto_85259 ?auto_85255 ) ( not ( = ?auto_85258 ?auto_85254 ) ) ( not ( = ?auto_85258 ?auto_85255 ) ) ( not ( = ?auto_85258 ?auto_85259 ) ) ( not ( = ?auto_85258 ?auto_85257 ) ) ( not ( = ?auto_85258 ?auto_85253 ) ) ( not ( = ?auto_85258 ?auto_85252 ) ) ( not ( = ?auto_85254 ?auto_85255 ) ) ( not ( = ?auto_85254 ?auto_85259 ) ) ( not ( = ?auto_85254 ?auto_85257 ) ) ( not ( = ?auto_85254 ?auto_85253 ) ) ( not ( = ?auto_85254 ?auto_85252 ) ) ( not ( = ?auto_85255 ?auto_85259 ) ) ( not ( = ?auto_85255 ?auto_85257 ) ) ( not ( = ?auto_85255 ?auto_85253 ) ) ( not ( = ?auto_85255 ?auto_85252 ) ) ( not ( = ?auto_85259 ?auto_85257 ) ) ( not ( = ?auto_85259 ?auto_85253 ) ) ( not ( = ?auto_85259 ?auto_85252 ) ) ( not ( = ?auto_85257 ?auto_85253 ) ) ( not ( = ?auto_85257 ?auto_85252 ) ) ( ON ?auto_85252 ?auto_85256 ) ( not ( = ?auto_85252 ?auto_85256 ) ) ( not ( = ?auto_85253 ?auto_85256 ) ) ( not ( = ?auto_85258 ?auto_85256 ) ) ( not ( = ?auto_85254 ?auto_85256 ) ) ( not ( = ?auto_85255 ?auto_85256 ) ) ( not ( = ?auto_85259 ?auto_85256 ) ) ( not ( = ?auto_85257 ?auto_85256 ) ) ( ON ?auto_85253 ?auto_85252 ) ( CLEAR ?auto_85253 ) ( ON-TABLE ?auto_85256 ) ( HOLDING ?auto_85257 ) ( CLEAR ?auto_85259 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_85258 ?auto_85254 ?auto_85255 ?auto_85259 ?auto_85257 )
      ( MAKE-1PILE ?auto_85252 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_85260 - BLOCK
    )
    :vars
    (
      ?auto_85261 - BLOCK
      ?auto_85262 - BLOCK
      ?auto_85263 - BLOCK
      ?auto_85264 - BLOCK
      ?auto_85267 - BLOCK
      ?auto_85265 - BLOCK
      ?auto_85266 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85260 ?auto_85261 ) ) ( ON-TABLE ?auto_85262 ) ( ON ?auto_85263 ?auto_85262 ) ( ON ?auto_85264 ?auto_85263 ) ( ON ?auto_85267 ?auto_85264 ) ( not ( = ?auto_85262 ?auto_85263 ) ) ( not ( = ?auto_85262 ?auto_85264 ) ) ( not ( = ?auto_85262 ?auto_85267 ) ) ( not ( = ?auto_85262 ?auto_85265 ) ) ( not ( = ?auto_85262 ?auto_85261 ) ) ( not ( = ?auto_85262 ?auto_85260 ) ) ( not ( = ?auto_85263 ?auto_85264 ) ) ( not ( = ?auto_85263 ?auto_85267 ) ) ( not ( = ?auto_85263 ?auto_85265 ) ) ( not ( = ?auto_85263 ?auto_85261 ) ) ( not ( = ?auto_85263 ?auto_85260 ) ) ( not ( = ?auto_85264 ?auto_85267 ) ) ( not ( = ?auto_85264 ?auto_85265 ) ) ( not ( = ?auto_85264 ?auto_85261 ) ) ( not ( = ?auto_85264 ?auto_85260 ) ) ( not ( = ?auto_85267 ?auto_85265 ) ) ( not ( = ?auto_85267 ?auto_85261 ) ) ( not ( = ?auto_85267 ?auto_85260 ) ) ( not ( = ?auto_85265 ?auto_85261 ) ) ( not ( = ?auto_85265 ?auto_85260 ) ) ( ON ?auto_85260 ?auto_85266 ) ( not ( = ?auto_85260 ?auto_85266 ) ) ( not ( = ?auto_85261 ?auto_85266 ) ) ( not ( = ?auto_85262 ?auto_85266 ) ) ( not ( = ?auto_85263 ?auto_85266 ) ) ( not ( = ?auto_85264 ?auto_85266 ) ) ( not ( = ?auto_85267 ?auto_85266 ) ) ( not ( = ?auto_85265 ?auto_85266 ) ) ( ON ?auto_85261 ?auto_85260 ) ( ON-TABLE ?auto_85266 ) ( CLEAR ?auto_85267 ) ( ON ?auto_85265 ?auto_85261 ) ( CLEAR ?auto_85265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_85266 ?auto_85260 ?auto_85261 )
      ( MAKE-1PILE ?auto_85260 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_85268 - BLOCK
    )
    :vars
    (
      ?auto_85275 - BLOCK
      ?auto_85271 - BLOCK
      ?auto_85269 - BLOCK
      ?auto_85274 - BLOCK
      ?auto_85272 - BLOCK
      ?auto_85273 - BLOCK
      ?auto_85270 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85268 ?auto_85275 ) ) ( ON-TABLE ?auto_85271 ) ( ON ?auto_85269 ?auto_85271 ) ( ON ?auto_85274 ?auto_85269 ) ( not ( = ?auto_85271 ?auto_85269 ) ) ( not ( = ?auto_85271 ?auto_85274 ) ) ( not ( = ?auto_85271 ?auto_85272 ) ) ( not ( = ?auto_85271 ?auto_85273 ) ) ( not ( = ?auto_85271 ?auto_85275 ) ) ( not ( = ?auto_85271 ?auto_85268 ) ) ( not ( = ?auto_85269 ?auto_85274 ) ) ( not ( = ?auto_85269 ?auto_85272 ) ) ( not ( = ?auto_85269 ?auto_85273 ) ) ( not ( = ?auto_85269 ?auto_85275 ) ) ( not ( = ?auto_85269 ?auto_85268 ) ) ( not ( = ?auto_85274 ?auto_85272 ) ) ( not ( = ?auto_85274 ?auto_85273 ) ) ( not ( = ?auto_85274 ?auto_85275 ) ) ( not ( = ?auto_85274 ?auto_85268 ) ) ( not ( = ?auto_85272 ?auto_85273 ) ) ( not ( = ?auto_85272 ?auto_85275 ) ) ( not ( = ?auto_85272 ?auto_85268 ) ) ( not ( = ?auto_85273 ?auto_85275 ) ) ( not ( = ?auto_85273 ?auto_85268 ) ) ( ON ?auto_85268 ?auto_85270 ) ( not ( = ?auto_85268 ?auto_85270 ) ) ( not ( = ?auto_85275 ?auto_85270 ) ) ( not ( = ?auto_85271 ?auto_85270 ) ) ( not ( = ?auto_85269 ?auto_85270 ) ) ( not ( = ?auto_85274 ?auto_85270 ) ) ( not ( = ?auto_85272 ?auto_85270 ) ) ( not ( = ?auto_85273 ?auto_85270 ) ) ( ON ?auto_85275 ?auto_85268 ) ( ON-TABLE ?auto_85270 ) ( ON ?auto_85273 ?auto_85275 ) ( CLEAR ?auto_85273 ) ( HOLDING ?auto_85272 ) ( CLEAR ?auto_85274 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_85271 ?auto_85269 ?auto_85274 ?auto_85272 )
      ( MAKE-1PILE ?auto_85268 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_85276 - BLOCK
    )
    :vars
    (
      ?auto_85282 - BLOCK
      ?auto_85279 - BLOCK
      ?auto_85277 - BLOCK
      ?auto_85278 - BLOCK
      ?auto_85281 - BLOCK
      ?auto_85280 - BLOCK
      ?auto_85283 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85276 ?auto_85282 ) ) ( ON-TABLE ?auto_85279 ) ( ON ?auto_85277 ?auto_85279 ) ( ON ?auto_85278 ?auto_85277 ) ( not ( = ?auto_85279 ?auto_85277 ) ) ( not ( = ?auto_85279 ?auto_85278 ) ) ( not ( = ?auto_85279 ?auto_85281 ) ) ( not ( = ?auto_85279 ?auto_85280 ) ) ( not ( = ?auto_85279 ?auto_85282 ) ) ( not ( = ?auto_85279 ?auto_85276 ) ) ( not ( = ?auto_85277 ?auto_85278 ) ) ( not ( = ?auto_85277 ?auto_85281 ) ) ( not ( = ?auto_85277 ?auto_85280 ) ) ( not ( = ?auto_85277 ?auto_85282 ) ) ( not ( = ?auto_85277 ?auto_85276 ) ) ( not ( = ?auto_85278 ?auto_85281 ) ) ( not ( = ?auto_85278 ?auto_85280 ) ) ( not ( = ?auto_85278 ?auto_85282 ) ) ( not ( = ?auto_85278 ?auto_85276 ) ) ( not ( = ?auto_85281 ?auto_85280 ) ) ( not ( = ?auto_85281 ?auto_85282 ) ) ( not ( = ?auto_85281 ?auto_85276 ) ) ( not ( = ?auto_85280 ?auto_85282 ) ) ( not ( = ?auto_85280 ?auto_85276 ) ) ( ON ?auto_85276 ?auto_85283 ) ( not ( = ?auto_85276 ?auto_85283 ) ) ( not ( = ?auto_85282 ?auto_85283 ) ) ( not ( = ?auto_85279 ?auto_85283 ) ) ( not ( = ?auto_85277 ?auto_85283 ) ) ( not ( = ?auto_85278 ?auto_85283 ) ) ( not ( = ?auto_85281 ?auto_85283 ) ) ( not ( = ?auto_85280 ?auto_85283 ) ) ( ON ?auto_85282 ?auto_85276 ) ( ON-TABLE ?auto_85283 ) ( ON ?auto_85280 ?auto_85282 ) ( CLEAR ?auto_85278 ) ( ON ?auto_85281 ?auto_85280 ) ( CLEAR ?auto_85281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_85283 ?auto_85276 ?auto_85282 ?auto_85280 )
      ( MAKE-1PILE ?auto_85276 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_85284 - BLOCK
    )
    :vars
    (
      ?auto_85289 - BLOCK
      ?auto_85290 - BLOCK
      ?auto_85286 - BLOCK
      ?auto_85285 - BLOCK
      ?auto_85291 - BLOCK
      ?auto_85288 - BLOCK
      ?auto_85287 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85284 ?auto_85289 ) ) ( ON-TABLE ?auto_85290 ) ( ON ?auto_85286 ?auto_85290 ) ( not ( = ?auto_85290 ?auto_85286 ) ) ( not ( = ?auto_85290 ?auto_85285 ) ) ( not ( = ?auto_85290 ?auto_85291 ) ) ( not ( = ?auto_85290 ?auto_85288 ) ) ( not ( = ?auto_85290 ?auto_85289 ) ) ( not ( = ?auto_85290 ?auto_85284 ) ) ( not ( = ?auto_85286 ?auto_85285 ) ) ( not ( = ?auto_85286 ?auto_85291 ) ) ( not ( = ?auto_85286 ?auto_85288 ) ) ( not ( = ?auto_85286 ?auto_85289 ) ) ( not ( = ?auto_85286 ?auto_85284 ) ) ( not ( = ?auto_85285 ?auto_85291 ) ) ( not ( = ?auto_85285 ?auto_85288 ) ) ( not ( = ?auto_85285 ?auto_85289 ) ) ( not ( = ?auto_85285 ?auto_85284 ) ) ( not ( = ?auto_85291 ?auto_85288 ) ) ( not ( = ?auto_85291 ?auto_85289 ) ) ( not ( = ?auto_85291 ?auto_85284 ) ) ( not ( = ?auto_85288 ?auto_85289 ) ) ( not ( = ?auto_85288 ?auto_85284 ) ) ( ON ?auto_85284 ?auto_85287 ) ( not ( = ?auto_85284 ?auto_85287 ) ) ( not ( = ?auto_85289 ?auto_85287 ) ) ( not ( = ?auto_85290 ?auto_85287 ) ) ( not ( = ?auto_85286 ?auto_85287 ) ) ( not ( = ?auto_85285 ?auto_85287 ) ) ( not ( = ?auto_85291 ?auto_85287 ) ) ( not ( = ?auto_85288 ?auto_85287 ) ) ( ON ?auto_85289 ?auto_85284 ) ( ON-TABLE ?auto_85287 ) ( ON ?auto_85288 ?auto_85289 ) ( ON ?auto_85291 ?auto_85288 ) ( CLEAR ?auto_85291 ) ( HOLDING ?auto_85285 ) ( CLEAR ?auto_85286 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_85290 ?auto_85286 ?auto_85285 )
      ( MAKE-1PILE ?auto_85284 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_85292 - BLOCK
    )
    :vars
    (
      ?auto_85294 - BLOCK
      ?auto_85293 - BLOCK
      ?auto_85297 - BLOCK
      ?auto_85299 - BLOCK
      ?auto_85296 - BLOCK
      ?auto_85295 - BLOCK
      ?auto_85298 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85292 ?auto_85294 ) ) ( ON-TABLE ?auto_85293 ) ( ON ?auto_85297 ?auto_85293 ) ( not ( = ?auto_85293 ?auto_85297 ) ) ( not ( = ?auto_85293 ?auto_85299 ) ) ( not ( = ?auto_85293 ?auto_85296 ) ) ( not ( = ?auto_85293 ?auto_85295 ) ) ( not ( = ?auto_85293 ?auto_85294 ) ) ( not ( = ?auto_85293 ?auto_85292 ) ) ( not ( = ?auto_85297 ?auto_85299 ) ) ( not ( = ?auto_85297 ?auto_85296 ) ) ( not ( = ?auto_85297 ?auto_85295 ) ) ( not ( = ?auto_85297 ?auto_85294 ) ) ( not ( = ?auto_85297 ?auto_85292 ) ) ( not ( = ?auto_85299 ?auto_85296 ) ) ( not ( = ?auto_85299 ?auto_85295 ) ) ( not ( = ?auto_85299 ?auto_85294 ) ) ( not ( = ?auto_85299 ?auto_85292 ) ) ( not ( = ?auto_85296 ?auto_85295 ) ) ( not ( = ?auto_85296 ?auto_85294 ) ) ( not ( = ?auto_85296 ?auto_85292 ) ) ( not ( = ?auto_85295 ?auto_85294 ) ) ( not ( = ?auto_85295 ?auto_85292 ) ) ( ON ?auto_85292 ?auto_85298 ) ( not ( = ?auto_85292 ?auto_85298 ) ) ( not ( = ?auto_85294 ?auto_85298 ) ) ( not ( = ?auto_85293 ?auto_85298 ) ) ( not ( = ?auto_85297 ?auto_85298 ) ) ( not ( = ?auto_85299 ?auto_85298 ) ) ( not ( = ?auto_85296 ?auto_85298 ) ) ( not ( = ?auto_85295 ?auto_85298 ) ) ( ON ?auto_85294 ?auto_85292 ) ( ON-TABLE ?auto_85298 ) ( ON ?auto_85295 ?auto_85294 ) ( ON ?auto_85296 ?auto_85295 ) ( CLEAR ?auto_85297 ) ( ON ?auto_85299 ?auto_85296 ) ( CLEAR ?auto_85299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_85298 ?auto_85292 ?auto_85294 ?auto_85295 ?auto_85296 )
      ( MAKE-1PILE ?auto_85292 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_85300 - BLOCK
    )
    :vars
    (
      ?auto_85304 - BLOCK
      ?auto_85302 - BLOCK
      ?auto_85307 - BLOCK
      ?auto_85303 - BLOCK
      ?auto_85305 - BLOCK
      ?auto_85301 - BLOCK
      ?auto_85306 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85300 ?auto_85304 ) ) ( ON-TABLE ?auto_85302 ) ( not ( = ?auto_85302 ?auto_85307 ) ) ( not ( = ?auto_85302 ?auto_85303 ) ) ( not ( = ?auto_85302 ?auto_85305 ) ) ( not ( = ?auto_85302 ?auto_85301 ) ) ( not ( = ?auto_85302 ?auto_85304 ) ) ( not ( = ?auto_85302 ?auto_85300 ) ) ( not ( = ?auto_85307 ?auto_85303 ) ) ( not ( = ?auto_85307 ?auto_85305 ) ) ( not ( = ?auto_85307 ?auto_85301 ) ) ( not ( = ?auto_85307 ?auto_85304 ) ) ( not ( = ?auto_85307 ?auto_85300 ) ) ( not ( = ?auto_85303 ?auto_85305 ) ) ( not ( = ?auto_85303 ?auto_85301 ) ) ( not ( = ?auto_85303 ?auto_85304 ) ) ( not ( = ?auto_85303 ?auto_85300 ) ) ( not ( = ?auto_85305 ?auto_85301 ) ) ( not ( = ?auto_85305 ?auto_85304 ) ) ( not ( = ?auto_85305 ?auto_85300 ) ) ( not ( = ?auto_85301 ?auto_85304 ) ) ( not ( = ?auto_85301 ?auto_85300 ) ) ( ON ?auto_85300 ?auto_85306 ) ( not ( = ?auto_85300 ?auto_85306 ) ) ( not ( = ?auto_85304 ?auto_85306 ) ) ( not ( = ?auto_85302 ?auto_85306 ) ) ( not ( = ?auto_85307 ?auto_85306 ) ) ( not ( = ?auto_85303 ?auto_85306 ) ) ( not ( = ?auto_85305 ?auto_85306 ) ) ( not ( = ?auto_85301 ?auto_85306 ) ) ( ON ?auto_85304 ?auto_85300 ) ( ON-TABLE ?auto_85306 ) ( ON ?auto_85301 ?auto_85304 ) ( ON ?auto_85305 ?auto_85301 ) ( ON ?auto_85303 ?auto_85305 ) ( CLEAR ?auto_85303 ) ( HOLDING ?auto_85307 ) ( CLEAR ?auto_85302 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_85302 ?auto_85307 )
      ( MAKE-1PILE ?auto_85300 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_85308 - BLOCK
    )
    :vars
    (
      ?auto_85311 - BLOCK
      ?auto_85315 - BLOCK
      ?auto_85314 - BLOCK
      ?auto_85313 - BLOCK
      ?auto_85309 - BLOCK
      ?auto_85312 - BLOCK
      ?auto_85310 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85308 ?auto_85311 ) ) ( ON-TABLE ?auto_85315 ) ( not ( = ?auto_85315 ?auto_85314 ) ) ( not ( = ?auto_85315 ?auto_85313 ) ) ( not ( = ?auto_85315 ?auto_85309 ) ) ( not ( = ?auto_85315 ?auto_85312 ) ) ( not ( = ?auto_85315 ?auto_85311 ) ) ( not ( = ?auto_85315 ?auto_85308 ) ) ( not ( = ?auto_85314 ?auto_85313 ) ) ( not ( = ?auto_85314 ?auto_85309 ) ) ( not ( = ?auto_85314 ?auto_85312 ) ) ( not ( = ?auto_85314 ?auto_85311 ) ) ( not ( = ?auto_85314 ?auto_85308 ) ) ( not ( = ?auto_85313 ?auto_85309 ) ) ( not ( = ?auto_85313 ?auto_85312 ) ) ( not ( = ?auto_85313 ?auto_85311 ) ) ( not ( = ?auto_85313 ?auto_85308 ) ) ( not ( = ?auto_85309 ?auto_85312 ) ) ( not ( = ?auto_85309 ?auto_85311 ) ) ( not ( = ?auto_85309 ?auto_85308 ) ) ( not ( = ?auto_85312 ?auto_85311 ) ) ( not ( = ?auto_85312 ?auto_85308 ) ) ( ON ?auto_85308 ?auto_85310 ) ( not ( = ?auto_85308 ?auto_85310 ) ) ( not ( = ?auto_85311 ?auto_85310 ) ) ( not ( = ?auto_85315 ?auto_85310 ) ) ( not ( = ?auto_85314 ?auto_85310 ) ) ( not ( = ?auto_85313 ?auto_85310 ) ) ( not ( = ?auto_85309 ?auto_85310 ) ) ( not ( = ?auto_85312 ?auto_85310 ) ) ( ON ?auto_85311 ?auto_85308 ) ( ON-TABLE ?auto_85310 ) ( ON ?auto_85312 ?auto_85311 ) ( ON ?auto_85309 ?auto_85312 ) ( ON ?auto_85313 ?auto_85309 ) ( CLEAR ?auto_85315 ) ( ON ?auto_85314 ?auto_85313 ) ( CLEAR ?auto_85314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85310 ?auto_85308 ?auto_85311 ?auto_85312 ?auto_85309 ?auto_85313 )
      ( MAKE-1PILE ?auto_85308 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_85316 - BLOCK
    )
    :vars
    (
      ?auto_85317 - BLOCK
      ?auto_85322 - BLOCK
      ?auto_85320 - BLOCK
      ?auto_85321 - BLOCK
      ?auto_85318 - BLOCK
      ?auto_85323 - BLOCK
      ?auto_85319 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85316 ?auto_85317 ) ) ( not ( = ?auto_85322 ?auto_85320 ) ) ( not ( = ?auto_85322 ?auto_85321 ) ) ( not ( = ?auto_85322 ?auto_85318 ) ) ( not ( = ?auto_85322 ?auto_85323 ) ) ( not ( = ?auto_85322 ?auto_85317 ) ) ( not ( = ?auto_85322 ?auto_85316 ) ) ( not ( = ?auto_85320 ?auto_85321 ) ) ( not ( = ?auto_85320 ?auto_85318 ) ) ( not ( = ?auto_85320 ?auto_85323 ) ) ( not ( = ?auto_85320 ?auto_85317 ) ) ( not ( = ?auto_85320 ?auto_85316 ) ) ( not ( = ?auto_85321 ?auto_85318 ) ) ( not ( = ?auto_85321 ?auto_85323 ) ) ( not ( = ?auto_85321 ?auto_85317 ) ) ( not ( = ?auto_85321 ?auto_85316 ) ) ( not ( = ?auto_85318 ?auto_85323 ) ) ( not ( = ?auto_85318 ?auto_85317 ) ) ( not ( = ?auto_85318 ?auto_85316 ) ) ( not ( = ?auto_85323 ?auto_85317 ) ) ( not ( = ?auto_85323 ?auto_85316 ) ) ( ON ?auto_85316 ?auto_85319 ) ( not ( = ?auto_85316 ?auto_85319 ) ) ( not ( = ?auto_85317 ?auto_85319 ) ) ( not ( = ?auto_85322 ?auto_85319 ) ) ( not ( = ?auto_85320 ?auto_85319 ) ) ( not ( = ?auto_85321 ?auto_85319 ) ) ( not ( = ?auto_85318 ?auto_85319 ) ) ( not ( = ?auto_85323 ?auto_85319 ) ) ( ON ?auto_85317 ?auto_85316 ) ( ON-TABLE ?auto_85319 ) ( ON ?auto_85323 ?auto_85317 ) ( ON ?auto_85318 ?auto_85323 ) ( ON ?auto_85321 ?auto_85318 ) ( ON ?auto_85320 ?auto_85321 ) ( CLEAR ?auto_85320 ) ( HOLDING ?auto_85322 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_85322 )
      ( MAKE-1PILE ?auto_85316 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_85324 - BLOCK
    )
    :vars
    (
      ?auto_85330 - BLOCK
      ?auto_85327 - BLOCK
      ?auto_85331 - BLOCK
      ?auto_85329 - BLOCK
      ?auto_85326 - BLOCK
      ?auto_85325 - BLOCK
      ?auto_85328 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85324 ?auto_85330 ) ) ( not ( = ?auto_85327 ?auto_85331 ) ) ( not ( = ?auto_85327 ?auto_85329 ) ) ( not ( = ?auto_85327 ?auto_85326 ) ) ( not ( = ?auto_85327 ?auto_85325 ) ) ( not ( = ?auto_85327 ?auto_85330 ) ) ( not ( = ?auto_85327 ?auto_85324 ) ) ( not ( = ?auto_85331 ?auto_85329 ) ) ( not ( = ?auto_85331 ?auto_85326 ) ) ( not ( = ?auto_85331 ?auto_85325 ) ) ( not ( = ?auto_85331 ?auto_85330 ) ) ( not ( = ?auto_85331 ?auto_85324 ) ) ( not ( = ?auto_85329 ?auto_85326 ) ) ( not ( = ?auto_85329 ?auto_85325 ) ) ( not ( = ?auto_85329 ?auto_85330 ) ) ( not ( = ?auto_85329 ?auto_85324 ) ) ( not ( = ?auto_85326 ?auto_85325 ) ) ( not ( = ?auto_85326 ?auto_85330 ) ) ( not ( = ?auto_85326 ?auto_85324 ) ) ( not ( = ?auto_85325 ?auto_85330 ) ) ( not ( = ?auto_85325 ?auto_85324 ) ) ( ON ?auto_85324 ?auto_85328 ) ( not ( = ?auto_85324 ?auto_85328 ) ) ( not ( = ?auto_85330 ?auto_85328 ) ) ( not ( = ?auto_85327 ?auto_85328 ) ) ( not ( = ?auto_85331 ?auto_85328 ) ) ( not ( = ?auto_85329 ?auto_85328 ) ) ( not ( = ?auto_85326 ?auto_85328 ) ) ( not ( = ?auto_85325 ?auto_85328 ) ) ( ON ?auto_85330 ?auto_85324 ) ( ON-TABLE ?auto_85328 ) ( ON ?auto_85325 ?auto_85330 ) ( ON ?auto_85326 ?auto_85325 ) ( ON ?auto_85329 ?auto_85326 ) ( ON ?auto_85331 ?auto_85329 ) ( ON ?auto_85327 ?auto_85331 ) ( CLEAR ?auto_85327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_85328 ?auto_85324 ?auto_85330 ?auto_85325 ?auto_85326 ?auto_85329 ?auto_85331 )
      ( MAKE-1PILE ?auto_85324 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_85337 - BLOCK
      ?auto_85338 - BLOCK
      ?auto_85339 - BLOCK
      ?auto_85340 - BLOCK
      ?auto_85341 - BLOCK
    )
    :vars
    (
      ?auto_85342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85342 ?auto_85341 ) ( CLEAR ?auto_85342 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_85337 ) ( ON ?auto_85338 ?auto_85337 ) ( ON ?auto_85339 ?auto_85338 ) ( ON ?auto_85340 ?auto_85339 ) ( ON ?auto_85341 ?auto_85340 ) ( not ( = ?auto_85337 ?auto_85338 ) ) ( not ( = ?auto_85337 ?auto_85339 ) ) ( not ( = ?auto_85337 ?auto_85340 ) ) ( not ( = ?auto_85337 ?auto_85341 ) ) ( not ( = ?auto_85337 ?auto_85342 ) ) ( not ( = ?auto_85338 ?auto_85339 ) ) ( not ( = ?auto_85338 ?auto_85340 ) ) ( not ( = ?auto_85338 ?auto_85341 ) ) ( not ( = ?auto_85338 ?auto_85342 ) ) ( not ( = ?auto_85339 ?auto_85340 ) ) ( not ( = ?auto_85339 ?auto_85341 ) ) ( not ( = ?auto_85339 ?auto_85342 ) ) ( not ( = ?auto_85340 ?auto_85341 ) ) ( not ( = ?auto_85340 ?auto_85342 ) ) ( not ( = ?auto_85341 ?auto_85342 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_85342 ?auto_85341 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_85343 - BLOCK
      ?auto_85344 - BLOCK
      ?auto_85345 - BLOCK
      ?auto_85346 - BLOCK
      ?auto_85347 - BLOCK
    )
    :vars
    (
      ?auto_85348 - BLOCK
      ?auto_85349 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85348 ?auto_85347 ) ( CLEAR ?auto_85348 ) ( ON-TABLE ?auto_85343 ) ( ON ?auto_85344 ?auto_85343 ) ( ON ?auto_85345 ?auto_85344 ) ( ON ?auto_85346 ?auto_85345 ) ( ON ?auto_85347 ?auto_85346 ) ( not ( = ?auto_85343 ?auto_85344 ) ) ( not ( = ?auto_85343 ?auto_85345 ) ) ( not ( = ?auto_85343 ?auto_85346 ) ) ( not ( = ?auto_85343 ?auto_85347 ) ) ( not ( = ?auto_85343 ?auto_85348 ) ) ( not ( = ?auto_85344 ?auto_85345 ) ) ( not ( = ?auto_85344 ?auto_85346 ) ) ( not ( = ?auto_85344 ?auto_85347 ) ) ( not ( = ?auto_85344 ?auto_85348 ) ) ( not ( = ?auto_85345 ?auto_85346 ) ) ( not ( = ?auto_85345 ?auto_85347 ) ) ( not ( = ?auto_85345 ?auto_85348 ) ) ( not ( = ?auto_85346 ?auto_85347 ) ) ( not ( = ?auto_85346 ?auto_85348 ) ) ( not ( = ?auto_85347 ?auto_85348 ) ) ( HOLDING ?auto_85349 ) ( not ( = ?auto_85343 ?auto_85349 ) ) ( not ( = ?auto_85344 ?auto_85349 ) ) ( not ( = ?auto_85345 ?auto_85349 ) ) ( not ( = ?auto_85346 ?auto_85349 ) ) ( not ( = ?auto_85347 ?auto_85349 ) ) ( not ( = ?auto_85348 ?auto_85349 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_85349 )
      ( MAKE-5PILE ?auto_85343 ?auto_85344 ?auto_85345 ?auto_85346 ?auto_85347 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_85350 - BLOCK
      ?auto_85351 - BLOCK
      ?auto_85352 - BLOCK
      ?auto_85353 - BLOCK
      ?auto_85354 - BLOCK
    )
    :vars
    (
      ?auto_85355 - BLOCK
      ?auto_85356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85355 ?auto_85354 ) ( ON-TABLE ?auto_85350 ) ( ON ?auto_85351 ?auto_85350 ) ( ON ?auto_85352 ?auto_85351 ) ( ON ?auto_85353 ?auto_85352 ) ( ON ?auto_85354 ?auto_85353 ) ( not ( = ?auto_85350 ?auto_85351 ) ) ( not ( = ?auto_85350 ?auto_85352 ) ) ( not ( = ?auto_85350 ?auto_85353 ) ) ( not ( = ?auto_85350 ?auto_85354 ) ) ( not ( = ?auto_85350 ?auto_85355 ) ) ( not ( = ?auto_85351 ?auto_85352 ) ) ( not ( = ?auto_85351 ?auto_85353 ) ) ( not ( = ?auto_85351 ?auto_85354 ) ) ( not ( = ?auto_85351 ?auto_85355 ) ) ( not ( = ?auto_85352 ?auto_85353 ) ) ( not ( = ?auto_85352 ?auto_85354 ) ) ( not ( = ?auto_85352 ?auto_85355 ) ) ( not ( = ?auto_85353 ?auto_85354 ) ) ( not ( = ?auto_85353 ?auto_85355 ) ) ( not ( = ?auto_85354 ?auto_85355 ) ) ( not ( = ?auto_85350 ?auto_85356 ) ) ( not ( = ?auto_85351 ?auto_85356 ) ) ( not ( = ?auto_85352 ?auto_85356 ) ) ( not ( = ?auto_85353 ?auto_85356 ) ) ( not ( = ?auto_85354 ?auto_85356 ) ) ( not ( = ?auto_85355 ?auto_85356 ) ) ( ON ?auto_85356 ?auto_85355 ) ( CLEAR ?auto_85356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85350 ?auto_85351 ?auto_85352 ?auto_85353 ?auto_85354 ?auto_85355 )
      ( MAKE-5PILE ?auto_85350 ?auto_85351 ?auto_85352 ?auto_85353 ?auto_85354 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_85357 - BLOCK
      ?auto_85358 - BLOCK
      ?auto_85359 - BLOCK
      ?auto_85360 - BLOCK
      ?auto_85361 - BLOCK
    )
    :vars
    (
      ?auto_85362 - BLOCK
      ?auto_85363 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85362 ?auto_85361 ) ( ON-TABLE ?auto_85357 ) ( ON ?auto_85358 ?auto_85357 ) ( ON ?auto_85359 ?auto_85358 ) ( ON ?auto_85360 ?auto_85359 ) ( ON ?auto_85361 ?auto_85360 ) ( not ( = ?auto_85357 ?auto_85358 ) ) ( not ( = ?auto_85357 ?auto_85359 ) ) ( not ( = ?auto_85357 ?auto_85360 ) ) ( not ( = ?auto_85357 ?auto_85361 ) ) ( not ( = ?auto_85357 ?auto_85362 ) ) ( not ( = ?auto_85358 ?auto_85359 ) ) ( not ( = ?auto_85358 ?auto_85360 ) ) ( not ( = ?auto_85358 ?auto_85361 ) ) ( not ( = ?auto_85358 ?auto_85362 ) ) ( not ( = ?auto_85359 ?auto_85360 ) ) ( not ( = ?auto_85359 ?auto_85361 ) ) ( not ( = ?auto_85359 ?auto_85362 ) ) ( not ( = ?auto_85360 ?auto_85361 ) ) ( not ( = ?auto_85360 ?auto_85362 ) ) ( not ( = ?auto_85361 ?auto_85362 ) ) ( not ( = ?auto_85357 ?auto_85363 ) ) ( not ( = ?auto_85358 ?auto_85363 ) ) ( not ( = ?auto_85359 ?auto_85363 ) ) ( not ( = ?auto_85360 ?auto_85363 ) ) ( not ( = ?auto_85361 ?auto_85363 ) ) ( not ( = ?auto_85362 ?auto_85363 ) ) ( HOLDING ?auto_85363 ) ( CLEAR ?auto_85362 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_85357 ?auto_85358 ?auto_85359 ?auto_85360 ?auto_85361 ?auto_85362 ?auto_85363 )
      ( MAKE-5PILE ?auto_85357 ?auto_85358 ?auto_85359 ?auto_85360 ?auto_85361 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_85364 - BLOCK
      ?auto_85365 - BLOCK
      ?auto_85366 - BLOCK
      ?auto_85367 - BLOCK
      ?auto_85368 - BLOCK
    )
    :vars
    (
      ?auto_85370 - BLOCK
      ?auto_85369 - BLOCK
      ?auto_85371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85370 ?auto_85368 ) ( ON-TABLE ?auto_85364 ) ( ON ?auto_85365 ?auto_85364 ) ( ON ?auto_85366 ?auto_85365 ) ( ON ?auto_85367 ?auto_85366 ) ( ON ?auto_85368 ?auto_85367 ) ( not ( = ?auto_85364 ?auto_85365 ) ) ( not ( = ?auto_85364 ?auto_85366 ) ) ( not ( = ?auto_85364 ?auto_85367 ) ) ( not ( = ?auto_85364 ?auto_85368 ) ) ( not ( = ?auto_85364 ?auto_85370 ) ) ( not ( = ?auto_85365 ?auto_85366 ) ) ( not ( = ?auto_85365 ?auto_85367 ) ) ( not ( = ?auto_85365 ?auto_85368 ) ) ( not ( = ?auto_85365 ?auto_85370 ) ) ( not ( = ?auto_85366 ?auto_85367 ) ) ( not ( = ?auto_85366 ?auto_85368 ) ) ( not ( = ?auto_85366 ?auto_85370 ) ) ( not ( = ?auto_85367 ?auto_85368 ) ) ( not ( = ?auto_85367 ?auto_85370 ) ) ( not ( = ?auto_85368 ?auto_85370 ) ) ( not ( = ?auto_85364 ?auto_85369 ) ) ( not ( = ?auto_85365 ?auto_85369 ) ) ( not ( = ?auto_85366 ?auto_85369 ) ) ( not ( = ?auto_85367 ?auto_85369 ) ) ( not ( = ?auto_85368 ?auto_85369 ) ) ( not ( = ?auto_85370 ?auto_85369 ) ) ( CLEAR ?auto_85370 ) ( ON ?auto_85369 ?auto_85371 ) ( CLEAR ?auto_85369 ) ( HAND-EMPTY ) ( not ( = ?auto_85364 ?auto_85371 ) ) ( not ( = ?auto_85365 ?auto_85371 ) ) ( not ( = ?auto_85366 ?auto_85371 ) ) ( not ( = ?auto_85367 ?auto_85371 ) ) ( not ( = ?auto_85368 ?auto_85371 ) ) ( not ( = ?auto_85370 ?auto_85371 ) ) ( not ( = ?auto_85369 ?auto_85371 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_85369 ?auto_85371 )
      ( MAKE-5PILE ?auto_85364 ?auto_85365 ?auto_85366 ?auto_85367 ?auto_85368 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_85388 - BLOCK
      ?auto_85389 - BLOCK
      ?auto_85390 - BLOCK
      ?auto_85391 - BLOCK
      ?auto_85392 - BLOCK
    )
    :vars
    (
      ?auto_85395 - BLOCK
      ?auto_85393 - BLOCK
      ?auto_85394 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85388 ) ( ON ?auto_85389 ?auto_85388 ) ( ON ?auto_85390 ?auto_85389 ) ( ON ?auto_85391 ?auto_85390 ) ( not ( = ?auto_85388 ?auto_85389 ) ) ( not ( = ?auto_85388 ?auto_85390 ) ) ( not ( = ?auto_85388 ?auto_85391 ) ) ( not ( = ?auto_85388 ?auto_85392 ) ) ( not ( = ?auto_85388 ?auto_85395 ) ) ( not ( = ?auto_85389 ?auto_85390 ) ) ( not ( = ?auto_85389 ?auto_85391 ) ) ( not ( = ?auto_85389 ?auto_85392 ) ) ( not ( = ?auto_85389 ?auto_85395 ) ) ( not ( = ?auto_85390 ?auto_85391 ) ) ( not ( = ?auto_85390 ?auto_85392 ) ) ( not ( = ?auto_85390 ?auto_85395 ) ) ( not ( = ?auto_85391 ?auto_85392 ) ) ( not ( = ?auto_85391 ?auto_85395 ) ) ( not ( = ?auto_85392 ?auto_85395 ) ) ( not ( = ?auto_85388 ?auto_85393 ) ) ( not ( = ?auto_85389 ?auto_85393 ) ) ( not ( = ?auto_85390 ?auto_85393 ) ) ( not ( = ?auto_85391 ?auto_85393 ) ) ( not ( = ?auto_85392 ?auto_85393 ) ) ( not ( = ?auto_85395 ?auto_85393 ) ) ( ON ?auto_85393 ?auto_85394 ) ( not ( = ?auto_85388 ?auto_85394 ) ) ( not ( = ?auto_85389 ?auto_85394 ) ) ( not ( = ?auto_85390 ?auto_85394 ) ) ( not ( = ?auto_85391 ?auto_85394 ) ) ( not ( = ?auto_85392 ?auto_85394 ) ) ( not ( = ?auto_85395 ?auto_85394 ) ) ( not ( = ?auto_85393 ?auto_85394 ) ) ( ON ?auto_85395 ?auto_85393 ) ( CLEAR ?auto_85395 ) ( HOLDING ?auto_85392 ) ( CLEAR ?auto_85391 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85388 ?auto_85389 ?auto_85390 ?auto_85391 ?auto_85392 ?auto_85395 )
      ( MAKE-5PILE ?auto_85388 ?auto_85389 ?auto_85390 ?auto_85391 ?auto_85392 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_85396 - BLOCK
      ?auto_85397 - BLOCK
      ?auto_85398 - BLOCK
      ?auto_85399 - BLOCK
      ?auto_85400 - BLOCK
    )
    :vars
    (
      ?auto_85403 - BLOCK
      ?auto_85401 - BLOCK
      ?auto_85402 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85396 ) ( ON ?auto_85397 ?auto_85396 ) ( ON ?auto_85398 ?auto_85397 ) ( ON ?auto_85399 ?auto_85398 ) ( not ( = ?auto_85396 ?auto_85397 ) ) ( not ( = ?auto_85396 ?auto_85398 ) ) ( not ( = ?auto_85396 ?auto_85399 ) ) ( not ( = ?auto_85396 ?auto_85400 ) ) ( not ( = ?auto_85396 ?auto_85403 ) ) ( not ( = ?auto_85397 ?auto_85398 ) ) ( not ( = ?auto_85397 ?auto_85399 ) ) ( not ( = ?auto_85397 ?auto_85400 ) ) ( not ( = ?auto_85397 ?auto_85403 ) ) ( not ( = ?auto_85398 ?auto_85399 ) ) ( not ( = ?auto_85398 ?auto_85400 ) ) ( not ( = ?auto_85398 ?auto_85403 ) ) ( not ( = ?auto_85399 ?auto_85400 ) ) ( not ( = ?auto_85399 ?auto_85403 ) ) ( not ( = ?auto_85400 ?auto_85403 ) ) ( not ( = ?auto_85396 ?auto_85401 ) ) ( not ( = ?auto_85397 ?auto_85401 ) ) ( not ( = ?auto_85398 ?auto_85401 ) ) ( not ( = ?auto_85399 ?auto_85401 ) ) ( not ( = ?auto_85400 ?auto_85401 ) ) ( not ( = ?auto_85403 ?auto_85401 ) ) ( ON ?auto_85401 ?auto_85402 ) ( not ( = ?auto_85396 ?auto_85402 ) ) ( not ( = ?auto_85397 ?auto_85402 ) ) ( not ( = ?auto_85398 ?auto_85402 ) ) ( not ( = ?auto_85399 ?auto_85402 ) ) ( not ( = ?auto_85400 ?auto_85402 ) ) ( not ( = ?auto_85403 ?auto_85402 ) ) ( not ( = ?auto_85401 ?auto_85402 ) ) ( ON ?auto_85403 ?auto_85401 ) ( CLEAR ?auto_85399 ) ( ON ?auto_85400 ?auto_85403 ) ( CLEAR ?auto_85400 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_85402 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_85402 ?auto_85401 ?auto_85403 )
      ( MAKE-5PILE ?auto_85396 ?auto_85397 ?auto_85398 ?auto_85399 ?auto_85400 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_85404 - BLOCK
      ?auto_85405 - BLOCK
      ?auto_85406 - BLOCK
      ?auto_85407 - BLOCK
      ?auto_85408 - BLOCK
    )
    :vars
    (
      ?auto_85410 - BLOCK
      ?auto_85409 - BLOCK
      ?auto_85411 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85404 ) ( ON ?auto_85405 ?auto_85404 ) ( ON ?auto_85406 ?auto_85405 ) ( not ( = ?auto_85404 ?auto_85405 ) ) ( not ( = ?auto_85404 ?auto_85406 ) ) ( not ( = ?auto_85404 ?auto_85407 ) ) ( not ( = ?auto_85404 ?auto_85408 ) ) ( not ( = ?auto_85404 ?auto_85410 ) ) ( not ( = ?auto_85405 ?auto_85406 ) ) ( not ( = ?auto_85405 ?auto_85407 ) ) ( not ( = ?auto_85405 ?auto_85408 ) ) ( not ( = ?auto_85405 ?auto_85410 ) ) ( not ( = ?auto_85406 ?auto_85407 ) ) ( not ( = ?auto_85406 ?auto_85408 ) ) ( not ( = ?auto_85406 ?auto_85410 ) ) ( not ( = ?auto_85407 ?auto_85408 ) ) ( not ( = ?auto_85407 ?auto_85410 ) ) ( not ( = ?auto_85408 ?auto_85410 ) ) ( not ( = ?auto_85404 ?auto_85409 ) ) ( not ( = ?auto_85405 ?auto_85409 ) ) ( not ( = ?auto_85406 ?auto_85409 ) ) ( not ( = ?auto_85407 ?auto_85409 ) ) ( not ( = ?auto_85408 ?auto_85409 ) ) ( not ( = ?auto_85410 ?auto_85409 ) ) ( ON ?auto_85409 ?auto_85411 ) ( not ( = ?auto_85404 ?auto_85411 ) ) ( not ( = ?auto_85405 ?auto_85411 ) ) ( not ( = ?auto_85406 ?auto_85411 ) ) ( not ( = ?auto_85407 ?auto_85411 ) ) ( not ( = ?auto_85408 ?auto_85411 ) ) ( not ( = ?auto_85410 ?auto_85411 ) ) ( not ( = ?auto_85409 ?auto_85411 ) ) ( ON ?auto_85410 ?auto_85409 ) ( ON ?auto_85408 ?auto_85410 ) ( CLEAR ?auto_85408 ) ( ON-TABLE ?auto_85411 ) ( HOLDING ?auto_85407 ) ( CLEAR ?auto_85406 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_85404 ?auto_85405 ?auto_85406 ?auto_85407 )
      ( MAKE-5PILE ?auto_85404 ?auto_85405 ?auto_85406 ?auto_85407 ?auto_85408 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_85412 - BLOCK
      ?auto_85413 - BLOCK
      ?auto_85414 - BLOCK
      ?auto_85415 - BLOCK
      ?auto_85416 - BLOCK
    )
    :vars
    (
      ?auto_85418 - BLOCK
      ?auto_85419 - BLOCK
      ?auto_85417 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85412 ) ( ON ?auto_85413 ?auto_85412 ) ( ON ?auto_85414 ?auto_85413 ) ( not ( = ?auto_85412 ?auto_85413 ) ) ( not ( = ?auto_85412 ?auto_85414 ) ) ( not ( = ?auto_85412 ?auto_85415 ) ) ( not ( = ?auto_85412 ?auto_85416 ) ) ( not ( = ?auto_85412 ?auto_85418 ) ) ( not ( = ?auto_85413 ?auto_85414 ) ) ( not ( = ?auto_85413 ?auto_85415 ) ) ( not ( = ?auto_85413 ?auto_85416 ) ) ( not ( = ?auto_85413 ?auto_85418 ) ) ( not ( = ?auto_85414 ?auto_85415 ) ) ( not ( = ?auto_85414 ?auto_85416 ) ) ( not ( = ?auto_85414 ?auto_85418 ) ) ( not ( = ?auto_85415 ?auto_85416 ) ) ( not ( = ?auto_85415 ?auto_85418 ) ) ( not ( = ?auto_85416 ?auto_85418 ) ) ( not ( = ?auto_85412 ?auto_85419 ) ) ( not ( = ?auto_85413 ?auto_85419 ) ) ( not ( = ?auto_85414 ?auto_85419 ) ) ( not ( = ?auto_85415 ?auto_85419 ) ) ( not ( = ?auto_85416 ?auto_85419 ) ) ( not ( = ?auto_85418 ?auto_85419 ) ) ( ON ?auto_85419 ?auto_85417 ) ( not ( = ?auto_85412 ?auto_85417 ) ) ( not ( = ?auto_85413 ?auto_85417 ) ) ( not ( = ?auto_85414 ?auto_85417 ) ) ( not ( = ?auto_85415 ?auto_85417 ) ) ( not ( = ?auto_85416 ?auto_85417 ) ) ( not ( = ?auto_85418 ?auto_85417 ) ) ( not ( = ?auto_85419 ?auto_85417 ) ) ( ON ?auto_85418 ?auto_85419 ) ( ON ?auto_85416 ?auto_85418 ) ( ON-TABLE ?auto_85417 ) ( CLEAR ?auto_85414 ) ( ON ?auto_85415 ?auto_85416 ) ( CLEAR ?auto_85415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_85417 ?auto_85419 ?auto_85418 ?auto_85416 )
      ( MAKE-5PILE ?auto_85412 ?auto_85413 ?auto_85414 ?auto_85415 ?auto_85416 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_85420 - BLOCK
      ?auto_85421 - BLOCK
      ?auto_85422 - BLOCK
      ?auto_85423 - BLOCK
      ?auto_85424 - BLOCK
    )
    :vars
    (
      ?auto_85425 - BLOCK
      ?auto_85427 - BLOCK
      ?auto_85426 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85420 ) ( ON ?auto_85421 ?auto_85420 ) ( not ( = ?auto_85420 ?auto_85421 ) ) ( not ( = ?auto_85420 ?auto_85422 ) ) ( not ( = ?auto_85420 ?auto_85423 ) ) ( not ( = ?auto_85420 ?auto_85424 ) ) ( not ( = ?auto_85420 ?auto_85425 ) ) ( not ( = ?auto_85421 ?auto_85422 ) ) ( not ( = ?auto_85421 ?auto_85423 ) ) ( not ( = ?auto_85421 ?auto_85424 ) ) ( not ( = ?auto_85421 ?auto_85425 ) ) ( not ( = ?auto_85422 ?auto_85423 ) ) ( not ( = ?auto_85422 ?auto_85424 ) ) ( not ( = ?auto_85422 ?auto_85425 ) ) ( not ( = ?auto_85423 ?auto_85424 ) ) ( not ( = ?auto_85423 ?auto_85425 ) ) ( not ( = ?auto_85424 ?auto_85425 ) ) ( not ( = ?auto_85420 ?auto_85427 ) ) ( not ( = ?auto_85421 ?auto_85427 ) ) ( not ( = ?auto_85422 ?auto_85427 ) ) ( not ( = ?auto_85423 ?auto_85427 ) ) ( not ( = ?auto_85424 ?auto_85427 ) ) ( not ( = ?auto_85425 ?auto_85427 ) ) ( ON ?auto_85427 ?auto_85426 ) ( not ( = ?auto_85420 ?auto_85426 ) ) ( not ( = ?auto_85421 ?auto_85426 ) ) ( not ( = ?auto_85422 ?auto_85426 ) ) ( not ( = ?auto_85423 ?auto_85426 ) ) ( not ( = ?auto_85424 ?auto_85426 ) ) ( not ( = ?auto_85425 ?auto_85426 ) ) ( not ( = ?auto_85427 ?auto_85426 ) ) ( ON ?auto_85425 ?auto_85427 ) ( ON ?auto_85424 ?auto_85425 ) ( ON-TABLE ?auto_85426 ) ( ON ?auto_85423 ?auto_85424 ) ( CLEAR ?auto_85423 ) ( HOLDING ?auto_85422 ) ( CLEAR ?auto_85421 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_85420 ?auto_85421 ?auto_85422 )
      ( MAKE-5PILE ?auto_85420 ?auto_85421 ?auto_85422 ?auto_85423 ?auto_85424 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_85428 - BLOCK
      ?auto_85429 - BLOCK
      ?auto_85430 - BLOCK
      ?auto_85431 - BLOCK
      ?auto_85432 - BLOCK
    )
    :vars
    (
      ?auto_85433 - BLOCK
      ?auto_85435 - BLOCK
      ?auto_85434 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85428 ) ( ON ?auto_85429 ?auto_85428 ) ( not ( = ?auto_85428 ?auto_85429 ) ) ( not ( = ?auto_85428 ?auto_85430 ) ) ( not ( = ?auto_85428 ?auto_85431 ) ) ( not ( = ?auto_85428 ?auto_85432 ) ) ( not ( = ?auto_85428 ?auto_85433 ) ) ( not ( = ?auto_85429 ?auto_85430 ) ) ( not ( = ?auto_85429 ?auto_85431 ) ) ( not ( = ?auto_85429 ?auto_85432 ) ) ( not ( = ?auto_85429 ?auto_85433 ) ) ( not ( = ?auto_85430 ?auto_85431 ) ) ( not ( = ?auto_85430 ?auto_85432 ) ) ( not ( = ?auto_85430 ?auto_85433 ) ) ( not ( = ?auto_85431 ?auto_85432 ) ) ( not ( = ?auto_85431 ?auto_85433 ) ) ( not ( = ?auto_85432 ?auto_85433 ) ) ( not ( = ?auto_85428 ?auto_85435 ) ) ( not ( = ?auto_85429 ?auto_85435 ) ) ( not ( = ?auto_85430 ?auto_85435 ) ) ( not ( = ?auto_85431 ?auto_85435 ) ) ( not ( = ?auto_85432 ?auto_85435 ) ) ( not ( = ?auto_85433 ?auto_85435 ) ) ( ON ?auto_85435 ?auto_85434 ) ( not ( = ?auto_85428 ?auto_85434 ) ) ( not ( = ?auto_85429 ?auto_85434 ) ) ( not ( = ?auto_85430 ?auto_85434 ) ) ( not ( = ?auto_85431 ?auto_85434 ) ) ( not ( = ?auto_85432 ?auto_85434 ) ) ( not ( = ?auto_85433 ?auto_85434 ) ) ( not ( = ?auto_85435 ?auto_85434 ) ) ( ON ?auto_85433 ?auto_85435 ) ( ON ?auto_85432 ?auto_85433 ) ( ON-TABLE ?auto_85434 ) ( ON ?auto_85431 ?auto_85432 ) ( CLEAR ?auto_85429 ) ( ON ?auto_85430 ?auto_85431 ) ( CLEAR ?auto_85430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_85434 ?auto_85435 ?auto_85433 ?auto_85432 ?auto_85431 )
      ( MAKE-5PILE ?auto_85428 ?auto_85429 ?auto_85430 ?auto_85431 ?auto_85432 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_85436 - BLOCK
      ?auto_85437 - BLOCK
      ?auto_85438 - BLOCK
      ?auto_85439 - BLOCK
      ?auto_85440 - BLOCK
    )
    :vars
    (
      ?auto_85443 - BLOCK
      ?auto_85441 - BLOCK
      ?auto_85442 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85436 ) ( not ( = ?auto_85436 ?auto_85437 ) ) ( not ( = ?auto_85436 ?auto_85438 ) ) ( not ( = ?auto_85436 ?auto_85439 ) ) ( not ( = ?auto_85436 ?auto_85440 ) ) ( not ( = ?auto_85436 ?auto_85443 ) ) ( not ( = ?auto_85437 ?auto_85438 ) ) ( not ( = ?auto_85437 ?auto_85439 ) ) ( not ( = ?auto_85437 ?auto_85440 ) ) ( not ( = ?auto_85437 ?auto_85443 ) ) ( not ( = ?auto_85438 ?auto_85439 ) ) ( not ( = ?auto_85438 ?auto_85440 ) ) ( not ( = ?auto_85438 ?auto_85443 ) ) ( not ( = ?auto_85439 ?auto_85440 ) ) ( not ( = ?auto_85439 ?auto_85443 ) ) ( not ( = ?auto_85440 ?auto_85443 ) ) ( not ( = ?auto_85436 ?auto_85441 ) ) ( not ( = ?auto_85437 ?auto_85441 ) ) ( not ( = ?auto_85438 ?auto_85441 ) ) ( not ( = ?auto_85439 ?auto_85441 ) ) ( not ( = ?auto_85440 ?auto_85441 ) ) ( not ( = ?auto_85443 ?auto_85441 ) ) ( ON ?auto_85441 ?auto_85442 ) ( not ( = ?auto_85436 ?auto_85442 ) ) ( not ( = ?auto_85437 ?auto_85442 ) ) ( not ( = ?auto_85438 ?auto_85442 ) ) ( not ( = ?auto_85439 ?auto_85442 ) ) ( not ( = ?auto_85440 ?auto_85442 ) ) ( not ( = ?auto_85443 ?auto_85442 ) ) ( not ( = ?auto_85441 ?auto_85442 ) ) ( ON ?auto_85443 ?auto_85441 ) ( ON ?auto_85440 ?auto_85443 ) ( ON-TABLE ?auto_85442 ) ( ON ?auto_85439 ?auto_85440 ) ( ON ?auto_85438 ?auto_85439 ) ( CLEAR ?auto_85438 ) ( HOLDING ?auto_85437 ) ( CLEAR ?auto_85436 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_85436 ?auto_85437 )
      ( MAKE-5PILE ?auto_85436 ?auto_85437 ?auto_85438 ?auto_85439 ?auto_85440 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_85444 - BLOCK
      ?auto_85445 - BLOCK
      ?auto_85446 - BLOCK
      ?auto_85447 - BLOCK
      ?auto_85448 - BLOCK
    )
    :vars
    (
      ?auto_85449 - BLOCK
      ?auto_85450 - BLOCK
      ?auto_85451 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85444 ) ( not ( = ?auto_85444 ?auto_85445 ) ) ( not ( = ?auto_85444 ?auto_85446 ) ) ( not ( = ?auto_85444 ?auto_85447 ) ) ( not ( = ?auto_85444 ?auto_85448 ) ) ( not ( = ?auto_85444 ?auto_85449 ) ) ( not ( = ?auto_85445 ?auto_85446 ) ) ( not ( = ?auto_85445 ?auto_85447 ) ) ( not ( = ?auto_85445 ?auto_85448 ) ) ( not ( = ?auto_85445 ?auto_85449 ) ) ( not ( = ?auto_85446 ?auto_85447 ) ) ( not ( = ?auto_85446 ?auto_85448 ) ) ( not ( = ?auto_85446 ?auto_85449 ) ) ( not ( = ?auto_85447 ?auto_85448 ) ) ( not ( = ?auto_85447 ?auto_85449 ) ) ( not ( = ?auto_85448 ?auto_85449 ) ) ( not ( = ?auto_85444 ?auto_85450 ) ) ( not ( = ?auto_85445 ?auto_85450 ) ) ( not ( = ?auto_85446 ?auto_85450 ) ) ( not ( = ?auto_85447 ?auto_85450 ) ) ( not ( = ?auto_85448 ?auto_85450 ) ) ( not ( = ?auto_85449 ?auto_85450 ) ) ( ON ?auto_85450 ?auto_85451 ) ( not ( = ?auto_85444 ?auto_85451 ) ) ( not ( = ?auto_85445 ?auto_85451 ) ) ( not ( = ?auto_85446 ?auto_85451 ) ) ( not ( = ?auto_85447 ?auto_85451 ) ) ( not ( = ?auto_85448 ?auto_85451 ) ) ( not ( = ?auto_85449 ?auto_85451 ) ) ( not ( = ?auto_85450 ?auto_85451 ) ) ( ON ?auto_85449 ?auto_85450 ) ( ON ?auto_85448 ?auto_85449 ) ( ON-TABLE ?auto_85451 ) ( ON ?auto_85447 ?auto_85448 ) ( ON ?auto_85446 ?auto_85447 ) ( CLEAR ?auto_85444 ) ( ON ?auto_85445 ?auto_85446 ) ( CLEAR ?auto_85445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85451 ?auto_85450 ?auto_85449 ?auto_85448 ?auto_85447 ?auto_85446 )
      ( MAKE-5PILE ?auto_85444 ?auto_85445 ?auto_85446 ?auto_85447 ?auto_85448 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_85452 - BLOCK
      ?auto_85453 - BLOCK
      ?auto_85454 - BLOCK
      ?auto_85455 - BLOCK
      ?auto_85456 - BLOCK
    )
    :vars
    (
      ?auto_85458 - BLOCK
      ?auto_85457 - BLOCK
      ?auto_85459 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85452 ?auto_85453 ) ) ( not ( = ?auto_85452 ?auto_85454 ) ) ( not ( = ?auto_85452 ?auto_85455 ) ) ( not ( = ?auto_85452 ?auto_85456 ) ) ( not ( = ?auto_85452 ?auto_85458 ) ) ( not ( = ?auto_85453 ?auto_85454 ) ) ( not ( = ?auto_85453 ?auto_85455 ) ) ( not ( = ?auto_85453 ?auto_85456 ) ) ( not ( = ?auto_85453 ?auto_85458 ) ) ( not ( = ?auto_85454 ?auto_85455 ) ) ( not ( = ?auto_85454 ?auto_85456 ) ) ( not ( = ?auto_85454 ?auto_85458 ) ) ( not ( = ?auto_85455 ?auto_85456 ) ) ( not ( = ?auto_85455 ?auto_85458 ) ) ( not ( = ?auto_85456 ?auto_85458 ) ) ( not ( = ?auto_85452 ?auto_85457 ) ) ( not ( = ?auto_85453 ?auto_85457 ) ) ( not ( = ?auto_85454 ?auto_85457 ) ) ( not ( = ?auto_85455 ?auto_85457 ) ) ( not ( = ?auto_85456 ?auto_85457 ) ) ( not ( = ?auto_85458 ?auto_85457 ) ) ( ON ?auto_85457 ?auto_85459 ) ( not ( = ?auto_85452 ?auto_85459 ) ) ( not ( = ?auto_85453 ?auto_85459 ) ) ( not ( = ?auto_85454 ?auto_85459 ) ) ( not ( = ?auto_85455 ?auto_85459 ) ) ( not ( = ?auto_85456 ?auto_85459 ) ) ( not ( = ?auto_85458 ?auto_85459 ) ) ( not ( = ?auto_85457 ?auto_85459 ) ) ( ON ?auto_85458 ?auto_85457 ) ( ON ?auto_85456 ?auto_85458 ) ( ON-TABLE ?auto_85459 ) ( ON ?auto_85455 ?auto_85456 ) ( ON ?auto_85454 ?auto_85455 ) ( ON ?auto_85453 ?auto_85454 ) ( CLEAR ?auto_85453 ) ( HOLDING ?auto_85452 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_85452 )
      ( MAKE-5PILE ?auto_85452 ?auto_85453 ?auto_85454 ?auto_85455 ?auto_85456 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_85460 - BLOCK
      ?auto_85461 - BLOCK
      ?auto_85462 - BLOCK
      ?auto_85463 - BLOCK
      ?auto_85464 - BLOCK
    )
    :vars
    (
      ?auto_85465 - BLOCK
      ?auto_85467 - BLOCK
      ?auto_85466 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85460 ?auto_85461 ) ) ( not ( = ?auto_85460 ?auto_85462 ) ) ( not ( = ?auto_85460 ?auto_85463 ) ) ( not ( = ?auto_85460 ?auto_85464 ) ) ( not ( = ?auto_85460 ?auto_85465 ) ) ( not ( = ?auto_85461 ?auto_85462 ) ) ( not ( = ?auto_85461 ?auto_85463 ) ) ( not ( = ?auto_85461 ?auto_85464 ) ) ( not ( = ?auto_85461 ?auto_85465 ) ) ( not ( = ?auto_85462 ?auto_85463 ) ) ( not ( = ?auto_85462 ?auto_85464 ) ) ( not ( = ?auto_85462 ?auto_85465 ) ) ( not ( = ?auto_85463 ?auto_85464 ) ) ( not ( = ?auto_85463 ?auto_85465 ) ) ( not ( = ?auto_85464 ?auto_85465 ) ) ( not ( = ?auto_85460 ?auto_85467 ) ) ( not ( = ?auto_85461 ?auto_85467 ) ) ( not ( = ?auto_85462 ?auto_85467 ) ) ( not ( = ?auto_85463 ?auto_85467 ) ) ( not ( = ?auto_85464 ?auto_85467 ) ) ( not ( = ?auto_85465 ?auto_85467 ) ) ( ON ?auto_85467 ?auto_85466 ) ( not ( = ?auto_85460 ?auto_85466 ) ) ( not ( = ?auto_85461 ?auto_85466 ) ) ( not ( = ?auto_85462 ?auto_85466 ) ) ( not ( = ?auto_85463 ?auto_85466 ) ) ( not ( = ?auto_85464 ?auto_85466 ) ) ( not ( = ?auto_85465 ?auto_85466 ) ) ( not ( = ?auto_85467 ?auto_85466 ) ) ( ON ?auto_85465 ?auto_85467 ) ( ON ?auto_85464 ?auto_85465 ) ( ON-TABLE ?auto_85466 ) ( ON ?auto_85463 ?auto_85464 ) ( ON ?auto_85462 ?auto_85463 ) ( ON ?auto_85461 ?auto_85462 ) ( ON ?auto_85460 ?auto_85461 ) ( CLEAR ?auto_85460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_85466 ?auto_85467 ?auto_85465 ?auto_85464 ?auto_85463 ?auto_85462 ?auto_85461 )
      ( MAKE-5PILE ?auto_85460 ?auto_85461 ?auto_85462 ?auto_85463 ?auto_85464 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85470 - BLOCK
      ?auto_85471 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_85471 ) ( CLEAR ?auto_85470 ) ( ON-TABLE ?auto_85470 ) ( not ( = ?auto_85470 ?auto_85471 ) ) )
    :subtasks
    ( ( !STACK ?auto_85471 ?auto_85470 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85472 - BLOCK
      ?auto_85473 - BLOCK
    )
    :vars
    (
      ?auto_85474 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_85472 ) ( ON-TABLE ?auto_85472 ) ( not ( = ?auto_85472 ?auto_85473 ) ) ( ON ?auto_85473 ?auto_85474 ) ( CLEAR ?auto_85473 ) ( HAND-EMPTY ) ( not ( = ?auto_85472 ?auto_85474 ) ) ( not ( = ?auto_85473 ?auto_85474 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_85473 ?auto_85474 )
      ( MAKE-2PILE ?auto_85472 ?auto_85473 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85475 - BLOCK
      ?auto_85476 - BLOCK
    )
    :vars
    (
      ?auto_85477 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85475 ?auto_85476 ) ) ( ON ?auto_85476 ?auto_85477 ) ( CLEAR ?auto_85476 ) ( not ( = ?auto_85475 ?auto_85477 ) ) ( not ( = ?auto_85476 ?auto_85477 ) ) ( HOLDING ?auto_85475 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_85475 )
      ( MAKE-2PILE ?auto_85475 ?auto_85476 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85478 - BLOCK
      ?auto_85479 - BLOCK
    )
    :vars
    (
      ?auto_85480 - BLOCK
      ?auto_85482 - BLOCK
      ?auto_85483 - BLOCK
      ?auto_85484 - BLOCK
      ?auto_85481 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85478 ?auto_85479 ) ) ( ON ?auto_85479 ?auto_85480 ) ( not ( = ?auto_85478 ?auto_85480 ) ) ( not ( = ?auto_85479 ?auto_85480 ) ) ( ON ?auto_85478 ?auto_85479 ) ( CLEAR ?auto_85478 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_85482 ) ( ON ?auto_85483 ?auto_85482 ) ( ON ?auto_85484 ?auto_85483 ) ( ON ?auto_85481 ?auto_85484 ) ( ON ?auto_85480 ?auto_85481 ) ( not ( = ?auto_85482 ?auto_85483 ) ) ( not ( = ?auto_85482 ?auto_85484 ) ) ( not ( = ?auto_85482 ?auto_85481 ) ) ( not ( = ?auto_85482 ?auto_85480 ) ) ( not ( = ?auto_85482 ?auto_85479 ) ) ( not ( = ?auto_85482 ?auto_85478 ) ) ( not ( = ?auto_85483 ?auto_85484 ) ) ( not ( = ?auto_85483 ?auto_85481 ) ) ( not ( = ?auto_85483 ?auto_85480 ) ) ( not ( = ?auto_85483 ?auto_85479 ) ) ( not ( = ?auto_85483 ?auto_85478 ) ) ( not ( = ?auto_85484 ?auto_85481 ) ) ( not ( = ?auto_85484 ?auto_85480 ) ) ( not ( = ?auto_85484 ?auto_85479 ) ) ( not ( = ?auto_85484 ?auto_85478 ) ) ( not ( = ?auto_85481 ?auto_85480 ) ) ( not ( = ?auto_85481 ?auto_85479 ) ) ( not ( = ?auto_85481 ?auto_85478 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85482 ?auto_85483 ?auto_85484 ?auto_85481 ?auto_85480 ?auto_85479 )
      ( MAKE-2PILE ?auto_85478 ?auto_85479 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85485 - BLOCK
      ?auto_85486 - BLOCK
    )
    :vars
    (
      ?auto_85489 - BLOCK
      ?auto_85490 - BLOCK
      ?auto_85487 - BLOCK
      ?auto_85491 - BLOCK
      ?auto_85488 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85485 ?auto_85486 ) ) ( ON ?auto_85486 ?auto_85489 ) ( not ( = ?auto_85485 ?auto_85489 ) ) ( not ( = ?auto_85486 ?auto_85489 ) ) ( ON-TABLE ?auto_85490 ) ( ON ?auto_85487 ?auto_85490 ) ( ON ?auto_85491 ?auto_85487 ) ( ON ?auto_85488 ?auto_85491 ) ( ON ?auto_85489 ?auto_85488 ) ( not ( = ?auto_85490 ?auto_85487 ) ) ( not ( = ?auto_85490 ?auto_85491 ) ) ( not ( = ?auto_85490 ?auto_85488 ) ) ( not ( = ?auto_85490 ?auto_85489 ) ) ( not ( = ?auto_85490 ?auto_85486 ) ) ( not ( = ?auto_85490 ?auto_85485 ) ) ( not ( = ?auto_85487 ?auto_85491 ) ) ( not ( = ?auto_85487 ?auto_85488 ) ) ( not ( = ?auto_85487 ?auto_85489 ) ) ( not ( = ?auto_85487 ?auto_85486 ) ) ( not ( = ?auto_85487 ?auto_85485 ) ) ( not ( = ?auto_85491 ?auto_85488 ) ) ( not ( = ?auto_85491 ?auto_85489 ) ) ( not ( = ?auto_85491 ?auto_85486 ) ) ( not ( = ?auto_85491 ?auto_85485 ) ) ( not ( = ?auto_85488 ?auto_85489 ) ) ( not ( = ?auto_85488 ?auto_85486 ) ) ( not ( = ?auto_85488 ?auto_85485 ) ) ( HOLDING ?auto_85485 ) ( CLEAR ?auto_85486 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_85490 ?auto_85487 ?auto_85491 ?auto_85488 ?auto_85489 ?auto_85486 ?auto_85485 )
      ( MAKE-2PILE ?auto_85485 ?auto_85486 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85492 - BLOCK
      ?auto_85493 - BLOCK
    )
    :vars
    (
      ?auto_85498 - BLOCK
      ?auto_85497 - BLOCK
      ?auto_85495 - BLOCK
      ?auto_85496 - BLOCK
      ?auto_85494 - BLOCK
      ?auto_85499 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85492 ?auto_85493 ) ) ( ON ?auto_85493 ?auto_85498 ) ( not ( = ?auto_85492 ?auto_85498 ) ) ( not ( = ?auto_85493 ?auto_85498 ) ) ( ON-TABLE ?auto_85497 ) ( ON ?auto_85495 ?auto_85497 ) ( ON ?auto_85496 ?auto_85495 ) ( ON ?auto_85494 ?auto_85496 ) ( ON ?auto_85498 ?auto_85494 ) ( not ( = ?auto_85497 ?auto_85495 ) ) ( not ( = ?auto_85497 ?auto_85496 ) ) ( not ( = ?auto_85497 ?auto_85494 ) ) ( not ( = ?auto_85497 ?auto_85498 ) ) ( not ( = ?auto_85497 ?auto_85493 ) ) ( not ( = ?auto_85497 ?auto_85492 ) ) ( not ( = ?auto_85495 ?auto_85496 ) ) ( not ( = ?auto_85495 ?auto_85494 ) ) ( not ( = ?auto_85495 ?auto_85498 ) ) ( not ( = ?auto_85495 ?auto_85493 ) ) ( not ( = ?auto_85495 ?auto_85492 ) ) ( not ( = ?auto_85496 ?auto_85494 ) ) ( not ( = ?auto_85496 ?auto_85498 ) ) ( not ( = ?auto_85496 ?auto_85493 ) ) ( not ( = ?auto_85496 ?auto_85492 ) ) ( not ( = ?auto_85494 ?auto_85498 ) ) ( not ( = ?auto_85494 ?auto_85493 ) ) ( not ( = ?auto_85494 ?auto_85492 ) ) ( CLEAR ?auto_85493 ) ( ON ?auto_85492 ?auto_85499 ) ( CLEAR ?auto_85492 ) ( HAND-EMPTY ) ( not ( = ?auto_85492 ?auto_85499 ) ) ( not ( = ?auto_85493 ?auto_85499 ) ) ( not ( = ?auto_85498 ?auto_85499 ) ) ( not ( = ?auto_85497 ?auto_85499 ) ) ( not ( = ?auto_85495 ?auto_85499 ) ) ( not ( = ?auto_85496 ?auto_85499 ) ) ( not ( = ?auto_85494 ?auto_85499 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_85492 ?auto_85499 )
      ( MAKE-2PILE ?auto_85492 ?auto_85493 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85500 - BLOCK
      ?auto_85501 - BLOCK
    )
    :vars
    (
      ?auto_85505 - BLOCK
      ?auto_85502 - BLOCK
      ?auto_85503 - BLOCK
      ?auto_85504 - BLOCK
      ?auto_85506 - BLOCK
      ?auto_85507 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85500 ?auto_85501 ) ) ( not ( = ?auto_85500 ?auto_85505 ) ) ( not ( = ?auto_85501 ?auto_85505 ) ) ( ON-TABLE ?auto_85502 ) ( ON ?auto_85503 ?auto_85502 ) ( ON ?auto_85504 ?auto_85503 ) ( ON ?auto_85506 ?auto_85504 ) ( ON ?auto_85505 ?auto_85506 ) ( not ( = ?auto_85502 ?auto_85503 ) ) ( not ( = ?auto_85502 ?auto_85504 ) ) ( not ( = ?auto_85502 ?auto_85506 ) ) ( not ( = ?auto_85502 ?auto_85505 ) ) ( not ( = ?auto_85502 ?auto_85501 ) ) ( not ( = ?auto_85502 ?auto_85500 ) ) ( not ( = ?auto_85503 ?auto_85504 ) ) ( not ( = ?auto_85503 ?auto_85506 ) ) ( not ( = ?auto_85503 ?auto_85505 ) ) ( not ( = ?auto_85503 ?auto_85501 ) ) ( not ( = ?auto_85503 ?auto_85500 ) ) ( not ( = ?auto_85504 ?auto_85506 ) ) ( not ( = ?auto_85504 ?auto_85505 ) ) ( not ( = ?auto_85504 ?auto_85501 ) ) ( not ( = ?auto_85504 ?auto_85500 ) ) ( not ( = ?auto_85506 ?auto_85505 ) ) ( not ( = ?auto_85506 ?auto_85501 ) ) ( not ( = ?auto_85506 ?auto_85500 ) ) ( ON ?auto_85500 ?auto_85507 ) ( CLEAR ?auto_85500 ) ( not ( = ?auto_85500 ?auto_85507 ) ) ( not ( = ?auto_85501 ?auto_85507 ) ) ( not ( = ?auto_85505 ?auto_85507 ) ) ( not ( = ?auto_85502 ?auto_85507 ) ) ( not ( = ?auto_85503 ?auto_85507 ) ) ( not ( = ?auto_85504 ?auto_85507 ) ) ( not ( = ?auto_85506 ?auto_85507 ) ) ( HOLDING ?auto_85501 ) ( CLEAR ?auto_85505 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85502 ?auto_85503 ?auto_85504 ?auto_85506 ?auto_85505 ?auto_85501 )
      ( MAKE-2PILE ?auto_85500 ?auto_85501 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85508 - BLOCK
      ?auto_85509 - BLOCK
    )
    :vars
    (
      ?auto_85513 - BLOCK
      ?auto_85512 - BLOCK
      ?auto_85515 - BLOCK
      ?auto_85511 - BLOCK
      ?auto_85510 - BLOCK
      ?auto_85514 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85508 ?auto_85509 ) ) ( not ( = ?auto_85508 ?auto_85513 ) ) ( not ( = ?auto_85509 ?auto_85513 ) ) ( ON-TABLE ?auto_85512 ) ( ON ?auto_85515 ?auto_85512 ) ( ON ?auto_85511 ?auto_85515 ) ( ON ?auto_85510 ?auto_85511 ) ( ON ?auto_85513 ?auto_85510 ) ( not ( = ?auto_85512 ?auto_85515 ) ) ( not ( = ?auto_85512 ?auto_85511 ) ) ( not ( = ?auto_85512 ?auto_85510 ) ) ( not ( = ?auto_85512 ?auto_85513 ) ) ( not ( = ?auto_85512 ?auto_85509 ) ) ( not ( = ?auto_85512 ?auto_85508 ) ) ( not ( = ?auto_85515 ?auto_85511 ) ) ( not ( = ?auto_85515 ?auto_85510 ) ) ( not ( = ?auto_85515 ?auto_85513 ) ) ( not ( = ?auto_85515 ?auto_85509 ) ) ( not ( = ?auto_85515 ?auto_85508 ) ) ( not ( = ?auto_85511 ?auto_85510 ) ) ( not ( = ?auto_85511 ?auto_85513 ) ) ( not ( = ?auto_85511 ?auto_85509 ) ) ( not ( = ?auto_85511 ?auto_85508 ) ) ( not ( = ?auto_85510 ?auto_85513 ) ) ( not ( = ?auto_85510 ?auto_85509 ) ) ( not ( = ?auto_85510 ?auto_85508 ) ) ( ON ?auto_85508 ?auto_85514 ) ( not ( = ?auto_85508 ?auto_85514 ) ) ( not ( = ?auto_85509 ?auto_85514 ) ) ( not ( = ?auto_85513 ?auto_85514 ) ) ( not ( = ?auto_85512 ?auto_85514 ) ) ( not ( = ?auto_85515 ?auto_85514 ) ) ( not ( = ?auto_85511 ?auto_85514 ) ) ( not ( = ?auto_85510 ?auto_85514 ) ) ( CLEAR ?auto_85513 ) ( ON ?auto_85509 ?auto_85508 ) ( CLEAR ?auto_85509 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_85514 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_85514 ?auto_85508 )
      ( MAKE-2PILE ?auto_85508 ?auto_85509 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85516 - BLOCK
      ?auto_85517 - BLOCK
    )
    :vars
    (
      ?auto_85520 - BLOCK
      ?auto_85518 - BLOCK
      ?auto_85523 - BLOCK
      ?auto_85522 - BLOCK
      ?auto_85519 - BLOCK
      ?auto_85521 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85516 ?auto_85517 ) ) ( not ( = ?auto_85516 ?auto_85520 ) ) ( not ( = ?auto_85517 ?auto_85520 ) ) ( ON-TABLE ?auto_85518 ) ( ON ?auto_85523 ?auto_85518 ) ( ON ?auto_85522 ?auto_85523 ) ( ON ?auto_85519 ?auto_85522 ) ( not ( = ?auto_85518 ?auto_85523 ) ) ( not ( = ?auto_85518 ?auto_85522 ) ) ( not ( = ?auto_85518 ?auto_85519 ) ) ( not ( = ?auto_85518 ?auto_85520 ) ) ( not ( = ?auto_85518 ?auto_85517 ) ) ( not ( = ?auto_85518 ?auto_85516 ) ) ( not ( = ?auto_85523 ?auto_85522 ) ) ( not ( = ?auto_85523 ?auto_85519 ) ) ( not ( = ?auto_85523 ?auto_85520 ) ) ( not ( = ?auto_85523 ?auto_85517 ) ) ( not ( = ?auto_85523 ?auto_85516 ) ) ( not ( = ?auto_85522 ?auto_85519 ) ) ( not ( = ?auto_85522 ?auto_85520 ) ) ( not ( = ?auto_85522 ?auto_85517 ) ) ( not ( = ?auto_85522 ?auto_85516 ) ) ( not ( = ?auto_85519 ?auto_85520 ) ) ( not ( = ?auto_85519 ?auto_85517 ) ) ( not ( = ?auto_85519 ?auto_85516 ) ) ( ON ?auto_85516 ?auto_85521 ) ( not ( = ?auto_85516 ?auto_85521 ) ) ( not ( = ?auto_85517 ?auto_85521 ) ) ( not ( = ?auto_85520 ?auto_85521 ) ) ( not ( = ?auto_85518 ?auto_85521 ) ) ( not ( = ?auto_85523 ?auto_85521 ) ) ( not ( = ?auto_85522 ?auto_85521 ) ) ( not ( = ?auto_85519 ?auto_85521 ) ) ( ON ?auto_85517 ?auto_85516 ) ( CLEAR ?auto_85517 ) ( ON-TABLE ?auto_85521 ) ( HOLDING ?auto_85520 ) ( CLEAR ?auto_85519 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_85518 ?auto_85523 ?auto_85522 ?auto_85519 ?auto_85520 )
      ( MAKE-2PILE ?auto_85516 ?auto_85517 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85524 - BLOCK
      ?auto_85525 - BLOCK
    )
    :vars
    (
      ?auto_85529 - BLOCK
      ?auto_85527 - BLOCK
      ?auto_85528 - BLOCK
      ?auto_85530 - BLOCK
      ?auto_85531 - BLOCK
      ?auto_85526 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85524 ?auto_85525 ) ) ( not ( = ?auto_85524 ?auto_85529 ) ) ( not ( = ?auto_85525 ?auto_85529 ) ) ( ON-TABLE ?auto_85527 ) ( ON ?auto_85528 ?auto_85527 ) ( ON ?auto_85530 ?auto_85528 ) ( ON ?auto_85531 ?auto_85530 ) ( not ( = ?auto_85527 ?auto_85528 ) ) ( not ( = ?auto_85527 ?auto_85530 ) ) ( not ( = ?auto_85527 ?auto_85531 ) ) ( not ( = ?auto_85527 ?auto_85529 ) ) ( not ( = ?auto_85527 ?auto_85525 ) ) ( not ( = ?auto_85527 ?auto_85524 ) ) ( not ( = ?auto_85528 ?auto_85530 ) ) ( not ( = ?auto_85528 ?auto_85531 ) ) ( not ( = ?auto_85528 ?auto_85529 ) ) ( not ( = ?auto_85528 ?auto_85525 ) ) ( not ( = ?auto_85528 ?auto_85524 ) ) ( not ( = ?auto_85530 ?auto_85531 ) ) ( not ( = ?auto_85530 ?auto_85529 ) ) ( not ( = ?auto_85530 ?auto_85525 ) ) ( not ( = ?auto_85530 ?auto_85524 ) ) ( not ( = ?auto_85531 ?auto_85529 ) ) ( not ( = ?auto_85531 ?auto_85525 ) ) ( not ( = ?auto_85531 ?auto_85524 ) ) ( ON ?auto_85524 ?auto_85526 ) ( not ( = ?auto_85524 ?auto_85526 ) ) ( not ( = ?auto_85525 ?auto_85526 ) ) ( not ( = ?auto_85529 ?auto_85526 ) ) ( not ( = ?auto_85527 ?auto_85526 ) ) ( not ( = ?auto_85528 ?auto_85526 ) ) ( not ( = ?auto_85530 ?auto_85526 ) ) ( not ( = ?auto_85531 ?auto_85526 ) ) ( ON ?auto_85525 ?auto_85524 ) ( ON-TABLE ?auto_85526 ) ( CLEAR ?auto_85531 ) ( ON ?auto_85529 ?auto_85525 ) ( CLEAR ?auto_85529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_85526 ?auto_85524 ?auto_85525 )
      ( MAKE-2PILE ?auto_85524 ?auto_85525 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85532 - BLOCK
      ?auto_85533 - BLOCK
    )
    :vars
    (
      ?auto_85536 - BLOCK
      ?auto_85538 - BLOCK
      ?auto_85534 - BLOCK
      ?auto_85535 - BLOCK
      ?auto_85539 - BLOCK
      ?auto_85537 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85532 ?auto_85533 ) ) ( not ( = ?auto_85532 ?auto_85536 ) ) ( not ( = ?auto_85533 ?auto_85536 ) ) ( ON-TABLE ?auto_85538 ) ( ON ?auto_85534 ?auto_85538 ) ( ON ?auto_85535 ?auto_85534 ) ( not ( = ?auto_85538 ?auto_85534 ) ) ( not ( = ?auto_85538 ?auto_85535 ) ) ( not ( = ?auto_85538 ?auto_85539 ) ) ( not ( = ?auto_85538 ?auto_85536 ) ) ( not ( = ?auto_85538 ?auto_85533 ) ) ( not ( = ?auto_85538 ?auto_85532 ) ) ( not ( = ?auto_85534 ?auto_85535 ) ) ( not ( = ?auto_85534 ?auto_85539 ) ) ( not ( = ?auto_85534 ?auto_85536 ) ) ( not ( = ?auto_85534 ?auto_85533 ) ) ( not ( = ?auto_85534 ?auto_85532 ) ) ( not ( = ?auto_85535 ?auto_85539 ) ) ( not ( = ?auto_85535 ?auto_85536 ) ) ( not ( = ?auto_85535 ?auto_85533 ) ) ( not ( = ?auto_85535 ?auto_85532 ) ) ( not ( = ?auto_85539 ?auto_85536 ) ) ( not ( = ?auto_85539 ?auto_85533 ) ) ( not ( = ?auto_85539 ?auto_85532 ) ) ( ON ?auto_85532 ?auto_85537 ) ( not ( = ?auto_85532 ?auto_85537 ) ) ( not ( = ?auto_85533 ?auto_85537 ) ) ( not ( = ?auto_85536 ?auto_85537 ) ) ( not ( = ?auto_85538 ?auto_85537 ) ) ( not ( = ?auto_85534 ?auto_85537 ) ) ( not ( = ?auto_85535 ?auto_85537 ) ) ( not ( = ?auto_85539 ?auto_85537 ) ) ( ON ?auto_85533 ?auto_85532 ) ( ON-TABLE ?auto_85537 ) ( ON ?auto_85536 ?auto_85533 ) ( CLEAR ?auto_85536 ) ( HOLDING ?auto_85539 ) ( CLEAR ?auto_85535 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_85538 ?auto_85534 ?auto_85535 ?auto_85539 )
      ( MAKE-2PILE ?auto_85532 ?auto_85533 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85540 - BLOCK
      ?auto_85541 - BLOCK
    )
    :vars
    (
      ?auto_85547 - BLOCK
      ?auto_85543 - BLOCK
      ?auto_85542 - BLOCK
      ?auto_85544 - BLOCK
      ?auto_85546 - BLOCK
      ?auto_85545 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85540 ?auto_85541 ) ) ( not ( = ?auto_85540 ?auto_85547 ) ) ( not ( = ?auto_85541 ?auto_85547 ) ) ( ON-TABLE ?auto_85543 ) ( ON ?auto_85542 ?auto_85543 ) ( ON ?auto_85544 ?auto_85542 ) ( not ( = ?auto_85543 ?auto_85542 ) ) ( not ( = ?auto_85543 ?auto_85544 ) ) ( not ( = ?auto_85543 ?auto_85546 ) ) ( not ( = ?auto_85543 ?auto_85547 ) ) ( not ( = ?auto_85543 ?auto_85541 ) ) ( not ( = ?auto_85543 ?auto_85540 ) ) ( not ( = ?auto_85542 ?auto_85544 ) ) ( not ( = ?auto_85542 ?auto_85546 ) ) ( not ( = ?auto_85542 ?auto_85547 ) ) ( not ( = ?auto_85542 ?auto_85541 ) ) ( not ( = ?auto_85542 ?auto_85540 ) ) ( not ( = ?auto_85544 ?auto_85546 ) ) ( not ( = ?auto_85544 ?auto_85547 ) ) ( not ( = ?auto_85544 ?auto_85541 ) ) ( not ( = ?auto_85544 ?auto_85540 ) ) ( not ( = ?auto_85546 ?auto_85547 ) ) ( not ( = ?auto_85546 ?auto_85541 ) ) ( not ( = ?auto_85546 ?auto_85540 ) ) ( ON ?auto_85540 ?auto_85545 ) ( not ( = ?auto_85540 ?auto_85545 ) ) ( not ( = ?auto_85541 ?auto_85545 ) ) ( not ( = ?auto_85547 ?auto_85545 ) ) ( not ( = ?auto_85543 ?auto_85545 ) ) ( not ( = ?auto_85542 ?auto_85545 ) ) ( not ( = ?auto_85544 ?auto_85545 ) ) ( not ( = ?auto_85546 ?auto_85545 ) ) ( ON ?auto_85541 ?auto_85540 ) ( ON-TABLE ?auto_85545 ) ( ON ?auto_85547 ?auto_85541 ) ( CLEAR ?auto_85544 ) ( ON ?auto_85546 ?auto_85547 ) ( CLEAR ?auto_85546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_85545 ?auto_85540 ?auto_85541 ?auto_85547 )
      ( MAKE-2PILE ?auto_85540 ?auto_85541 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85548 - BLOCK
      ?auto_85549 - BLOCK
    )
    :vars
    (
      ?auto_85554 - BLOCK
      ?auto_85551 - BLOCK
      ?auto_85550 - BLOCK
      ?auto_85553 - BLOCK
      ?auto_85552 - BLOCK
      ?auto_85555 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85548 ?auto_85549 ) ) ( not ( = ?auto_85548 ?auto_85554 ) ) ( not ( = ?auto_85549 ?auto_85554 ) ) ( ON-TABLE ?auto_85551 ) ( ON ?auto_85550 ?auto_85551 ) ( not ( = ?auto_85551 ?auto_85550 ) ) ( not ( = ?auto_85551 ?auto_85553 ) ) ( not ( = ?auto_85551 ?auto_85552 ) ) ( not ( = ?auto_85551 ?auto_85554 ) ) ( not ( = ?auto_85551 ?auto_85549 ) ) ( not ( = ?auto_85551 ?auto_85548 ) ) ( not ( = ?auto_85550 ?auto_85553 ) ) ( not ( = ?auto_85550 ?auto_85552 ) ) ( not ( = ?auto_85550 ?auto_85554 ) ) ( not ( = ?auto_85550 ?auto_85549 ) ) ( not ( = ?auto_85550 ?auto_85548 ) ) ( not ( = ?auto_85553 ?auto_85552 ) ) ( not ( = ?auto_85553 ?auto_85554 ) ) ( not ( = ?auto_85553 ?auto_85549 ) ) ( not ( = ?auto_85553 ?auto_85548 ) ) ( not ( = ?auto_85552 ?auto_85554 ) ) ( not ( = ?auto_85552 ?auto_85549 ) ) ( not ( = ?auto_85552 ?auto_85548 ) ) ( ON ?auto_85548 ?auto_85555 ) ( not ( = ?auto_85548 ?auto_85555 ) ) ( not ( = ?auto_85549 ?auto_85555 ) ) ( not ( = ?auto_85554 ?auto_85555 ) ) ( not ( = ?auto_85551 ?auto_85555 ) ) ( not ( = ?auto_85550 ?auto_85555 ) ) ( not ( = ?auto_85553 ?auto_85555 ) ) ( not ( = ?auto_85552 ?auto_85555 ) ) ( ON ?auto_85549 ?auto_85548 ) ( ON-TABLE ?auto_85555 ) ( ON ?auto_85554 ?auto_85549 ) ( ON ?auto_85552 ?auto_85554 ) ( CLEAR ?auto_85552 ) ( HOLDING ?auto_85553 ) ( CLEAR ?auto_85550 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_85551 ?auto_85550 ?auto_85553 )
      ( MAKE-2PILE ?auto_85548 ?auto_85549 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85556 - BLOCK
      ?auto_85557 - BLOCK
    )
    :vars
    (
      ?auto_85560 - BLOCK
      ?auto_85562 - BLOCK
      ?auto_85561 - BLOCK
      ?auto_85563 - BLOCK
      ?auto_85558 - BLOCK
      ?auto_85559 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85556 ?auto_85557 ) ) ( not ( = ?auto_85556 ?auto_85560 ) ) ( not ( = ?auto_85557 ?auto_85560 ) ) ( ON-TABLE ?auto_85562 ) ( ON ?auto_85561 ?auto_85562 ) ( not ( = ?auto_85562 ?auto_85561 ) ) ( not ( = ?auto_85562 ?auto_85563 ) ) ( not ( = ?auto_85562 ?auto_85558 ) ) ( not ( = ?auto_85562 ?auto_85560 ) ) ( not ( = ?auto_85562 ?auto_85557 ) ) ( not ( = ?auto_85562 ?auto_85556 ) ) ( not ( = ?auto_85561 ?auto_85563 ) ) ( not ( = ?auto_85561 ?auto_85558 ) ) ( not ( = ?auto_85561 ?auto_85560 ) ) ( not ( = ?auto_85561 ?auto_85557 ) ) ( not ( = ?auto_85561 ?auto_85556 ) ) ( not ( = ?auto_85563 ?auto_85558 ) ) ( not ( = ?auto_85563 ?auto_85560 ) ) ( not ( = ?auto_85563 ?auto_85557 ) ) ( not ( = ?auto_85563 ?auto_85556 ) ) ( not ( = ?auto_85558 ?auto_85560 ) ) ( not ( = ?auto_85558 ?auto_85557 ) ) ( not ( = ?auto_85558 ?auto_85556 ) ) ( ON ?auto_85556 ?auto_85559 ) ( not ( = ?auto_85556 ?auto_85559 ) ) ( not ( = ?auto_85557 ?auto_85559 ) ) ( not ( = ?auto_85560 ?auto_85559 ) ) ( not ( = ?auto_85562 ?auto_85559 ) ) ( not ( = ?auto_85561 ?auto_85559 ) ) ( not ( = ?auto_85563 ?auto_85559 ) ) ( not ( = ?auto_85558 ?auto_85559 ) ) ( ON ?auto_85557 ?auto_85556 ) ( ON-TABLE ?auto_85559 ) ( ON ?auto_85560 ?auto_85557 ) ( ON ?auto_85558 ?auto_85560 ) ( CLEAR ?auto_85561 ) ( ON ?auto_85563 ?auto_85558 ) ( CLEAR ?auto_85563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_85559 ?auto_85556 ?auto_85557 ?auto_85560 ?auto_85558 )
      ( MAKE-2PILE ?auto_85556 ?auto_85557 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85564 - BLOCK
      ?auto_85565 - BLOCK
    )
    :vars
    (
      ?auto_85569 - BLOCK
      ?auto_85571 - BLOCK
      ?auto_85567 - BLOCK
      ?auto_85566 - BLOCK
      ?auto_85570 - BLOCK
      ?auto_85568 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85564 ?auto_85565 ) ) ( not ( = ?auto_85564 ?auto_85569 ) ) ( not ( = ?auto_85565 ?auto_85569 ) ) ( ON-TABLE ?auto_85571 ) ( not ( = ?auto_85571 ?auto_85567 ) ) ( not ( = ?auto_85571 ?auto_85566 ) ) ( not ( = ?auto_85571 ?auto_85570 ) ) ( not ( = ?auto_85571 ?auto_85569 ) ) ( not ( = ?auto_85571 ?auto_85565 ) ) ( not ( = ?auto_85571 ?auto_85564 ) ) ( not ( = ?auto_85567 ?auto_85566 ) ) ( not ( = ?auto_85567 ?auto_85570 ) ) ( not ( = ?auto_85567 ?auto_85569 ) ) ( not ( = ?auto_85567 ?auto_85565 ) ) ( not ( = ?auto_85567 ?auto_85564 ) ) ( not ( = ?auto_85566 ?auto_85570 ) ) ( not ( = ?auto_85566 ?auto_85569 ) ) ( not ( = ?auto_85566 ?auto_85565 ) ) ( not ( = ?auto_85566 ?auto_85564 ) ) ( not ( = ?auto_85570 ?auto_85569 ) ) ( not ( = ?auto_85570 ?auto_85565 ) ) ( not ( = ?auto_85570 ?auto_85564 ) ) ( ON ?auto_85564 ?auto_85568 ) ( not ( = ?auto_85564 ?auto_85568 ) ) ( not ( = ?auto_85565 ?auto_85568 ) ) ( not ( = ?auto_85569 ?auto_85568 ) ) ( not ( = ?auto_85571 ?auto_85568 ) ) ( not ( = ?auto_85567 ?auto_85568 ) ) ( not ( = ?auto_85566 ?auto_85568 ) ) ( not ( = ?auto_85570 ?auto_85568 ) ) ( ON ?auto_85565 ?auto_85564 ) ( ON-TABLE ?auto_85568 ) ( ON ?auto_85569 ?auto_85565 ) ( ON ?auto_85570 ?auto_85569 ) ( ON ?auto_85566 ?auto_85570 ) ( CLEAR ?auto_85566 ) ( HOLDING ?auto_85567 ) ( CLEAR ?auto_85571 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_85571 ?auto_85567 )
      ( MAKE-2PILE ?auto_85564 ?auto_85565 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85572 - BLOCK
      ?auto_85573 - BLOCK
    )
    :vars
    (
      ?auto_85579 - BLOCK
      ?auto_85576 - BLOCK
      ?auto_85574 - BLOCK
      ?auto_85577 - BLOCK
      ?auto_85575 - BLOCK
      ?auto_85578 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85572 ?auto_85573 ) ) ( not ( = ?auto_85572 ?auto_85579 ) ) ( not ( = ?auto_85573 ?auto_85579 ) ) ( ON-TABLE ?auto_85576 ) ( not ( = ?auto_85576 ?auto_85574 ) ) ( not ( = ?auto_85576 ?auto_85577 ) ) ( not ( = ?auto_85576 ?auto_85575 ) ) ( not ( = ?auto_85576 ?auto_85579 ) ) ( not ( = ?auto_85576 ?auto_85573 ) ) ( not ( = ?auto_85576 ?auto_85572 ) ) ( not ( = ?auto_85574 ?auto_85577 ) ) ( not ( = ?auto_85574 ?auto_85575 ) ) ( not ( = ?auto_85574 ?auto_85579 ) ) ( not ( = ?auto_85574 ?auto_85573 ) ) ( not ( = ?auto_85574 ?auto_85572 ) ) ( not ( = ?auto_85577 ?auto_85575 ) ) ( not ( = ?auto_85577 ?auto_85579 ) ) ( not ( = ?auto_85577 ?auto_85573 ) ) ( not ( = ?auto_85577 ?auto_85572 ) ) ( not ( = ?auto_85575 ?auto_85579 ) ) ( not ( = ?auto_85575 ?auto_85573 ) ) ( not ( = ?auto_85575 ?auto_85572 ) ) ( ON ?auto_85572 ?auto_85578 ) ( not ( = ?auto_85572 ?auto_85578 ) ) ( not ( = ?auto_85573 ?auto_85578 ) ) ( not ( = ?auto_85579 ?auto_85578 ) ) ( not ( = ?auto_85576 ?auto_85578 ) ) ( not ( = ?auto_85574 ?auto_85578 ) ) ( not ( = ?auto_85577 ?auto_85578 ) ) ( not ( = ?auto_85575 ?auto_85578 ) ) ( ON ?auto_85573 ?auto_85572 ) ( ON-TABLE ?auto_85578 ) ( ON ?auto_85579 ?auto_85573 ) ( ON ?auto_85575 ?auto_85579 ) ( ON ?auto_85577 ?auto_85575 ) ( CLEAR ?auto_85576 ) ( ON ?auto_85574 ?auto_85577 ) ( CLEAR ?auto_85574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85578 ?auto_85572 ?auto_85573 ?auto_85579 ?auto_85575 ?auto_85577 )
      ( MAKE-2PILE ?auto_85572 ?auto_85573 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85580 - BLOCK
      ?auto_85581 - BLOCK
    )
    :vars
    (
      ?auto_85586 - BLOCK
      ?auto_85582 - BLOCK
      ?auto_85584 - BLOCK
      ?auto_85585 - BLOCK
      ?auto_85583 - BLOCK
      ?auto_85587 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85580 ?auto_85581 ) ) ( not ( = ?auto_85580 ?auto_85586 ) ) ( not ( = ?auto_85581 ?auto_85586 ) ) ( not ( = ?auto_85582 ?auto_85584 ) ) ( not ( = ?auto_85582 ?auto_85585 ) ) ( not ( = ?auto_85582 ?auto_85583 ) ) ( not ( = ?auto_85582 ?auto_85586 ) ) ( not ( = ?auto_85582 ?auto_85581 ) ) ( not ( = ?auto_85582 ?auto_85580 ) ) ( not ( = ?auto_85584 ?auto_85585 ) ) ( not ( = ?auto_85584 ?auto_85583 ) ) ( not ( = ?auto_85584 ?auto_85586 ) ) ( not ( = ?auto_85584 ?auto_85581 ) ) ( not ( = ?auto_85584 ?auto_85580 ) ) ( not ( = ?auto_85585 ?auto_85583 ) ) ( not ( = ?auto_85585 ?auto_85586 ) ) ( not ( = ?auto_85585 ?auto_85581 ) ) ( not ( = ?auto_85585 ?auto_85580 ) ) ( not ( = ?auto_85583 ?auto_85586 ) ) ( not ( = ?auto_85583 ?auto_85581 ) ) ( not ( = ?auto_85583 ?auto_85580 ) ) ( ON ?auto_85580 ?auto_85587 ) ( not ( = ?auto_85580 ?auto_85587 ) ) ( not ( = ?auto_85581 ?auto_85587 ) ) ( not ( = ?auto_85586 ?auto_85587 ) ) ( not ( = ?auto_85582 ?auto_85587 ) ) ( not ( = ?auto_85584 ?auto_85587 ) ) ( not ( = ?auto_85585 ?auto_85587 ) ) ( not ( = ?auto_85583 ?auto_85587 ) ) ( ON ?auto_85581 ?auto_85580 ) ( ON-TABLE ?auto_85587 ) ( ON ?auto_85586 ?auto_85581 ) ( ON ?auto_85583 ?auto_85586 ) ( ON ?auto_85585 ?auto_85583 ) ( ON ?auto_85584 ?auto_85585 ) ( CLEAR ?auto_85584 ) ( HOLDING ?auto_85582 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_85582 )
      ( MAKE-2PILE ?auto_85580 ?auto_85581 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85588 - BLOCK
      ?auto_85589 - BLOCK
    )
    :vars
    (
      ?auto_85594 - BLOCK
      ?auto_85593 - BLOCK
      ?auto_85592 - BLOCK
      ?auto_85595 - BLOCK
      ?auto_85590 - BLOCK
      ?auto_85591 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85588 ?auto_85589 ) ) ( not ( = ?auto_85588 ?auto_85594 ) ) ( not ( = ?auto_85589 ?auto_85594 ) ) ( not ( = ?auto_85593 ?auto_85592 ) ) ( not ( = ?auto_85593 ?auto_85595 ) ) ( not ( = ?auto_85593 ?auto_85590 ) ) ( not ( = ?auto_85593 ?auto_85594 ) ) ( not ( = ?auto_85593 ?auto_85589 ) ) ( not ( = ?auto_85593 ?auto_85588 ) ) ( not ( = ?auto_85592 ?auto_85595 ) ) ( not ( = ?auto_85592 ?auto_85590 ) ) ( not ( = ?auto_85592 ?auto_85594 ) ) ( not ( = ?auto_85592 ?auto_85589 ) ) ( not ( = ?auto_85592 ?auto_85588 ) ) ( not ( = ?auto_85595 ?auto_85590 ) ) ( not ( = ?auto_85595 ?auto_85594 ) ) ( not ( = ?auto_85595 ?auto_85589 ) ) ( not ( = ?auto_85595 ?auto_85588 ) ) ( not ( = ?auto_85590 ?auto_85594 ) ) ( not ( = ?auto_85590 ?auto_85589 ) ) ( not ( = ?auto_85590 ?auto_85588 ) ) ( ON ?auto_85588 ?auto_85591 ) ( not ( = ?auto_85588 ?auto_85591 ) ) ( not ( = ?auto_85589 ?auto_85591 ) ) ( not ( = ?auto_85594 ?auto_85591 ) ) ( not ( = ?auto_85593 ?auto_85591 ) ) ( not ( = ?auto_85592 ?auto_85591 ) ) ( not ( = ?auto_85595 ?auto_85591 ) ) ( not ( = ?auto_85590 ?auto_85591 ) ) ( ON ?auto_85589 ?auto_85588 ) ( ON-TABLE ?auto_85591 ) ( ON ?auto_85594 ?auto_85589 ) ( ON ?auto_85590 ?auto_85594 ) ( ON ?auto_85595 ?auto_85590 ) ( ON ?auto_85592 ?auto_85595 ) ( ON ?auto_85593 ?auto_85592 ) ( CLEAR ?auto_85593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_85591 ?auto_85588 ?auto_85589 ?auto_85594 ?auto_85590 ?auto_85595 ?auto_85592 )
      ( MAKE-2PILE ?auto_85588 ?auto_85589 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85600 - BLOCK
      ?auto_85601 - BLOCK
      ?auto_85602 - BLOCK
      ?auto_85603 - BLOCK
    )
    :vars
    (
      ?auto_85604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85604 ?auto_85603 ) ( CLEAR ?auto_85604 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_85600 ) ( ON ?auto_85601 ?auto_85600 ) ( ON ?auto_85602 ?auto_85601 ) ( ON ?auto_85603 ?auto_85602 ) ( not ( = ?auto_85600 ?auto_85601 ) ) ( not ( = ?auto_85600 ?auto_85602 ) ) ( not ( = ?auto_85600 ?auto_85603 ) ) ( not ( = ?auto_85600 ?auto_85604 ) ) ( not ( = ?auto_85601 ?auto_85602 ) ) ( not ( = ?auto_85601 ?auto_85603 ) ) ( not ( = ?auto_85601 ?auto_85604 ) ) ( not ( = ?auto_85602 ?auto_85603 ) ) ( not ( = ?auto_85602 ?auto_85604 ) ) ( not ( = ?auto_85603 ?auto_85604 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_85604 ?auto_85603 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85605 - BLOCK
      ?auto_85606 - BLOCK
      ?auto_85607 - BLOCK
      ?auto_85608 - BLOCK
    )
    :vars
    (
      ?auto_85609 - BLOCK
      ?auto_85610 - BLOCK
      ?auto_85611 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85609 ?auto_85608 ) ( CLEAR ?auto_85609 ) ( ON-TABLE ?auto_85605 ) ( ON ?auto_85606 ?auto_85605 ) ( ON ?auto_85607 ?auto_85606 ) ( ON ?auto_85608 ?auto_85607 ) ( not ( = ?auto_85605 ?auto_85606 ) ) ( not ( = ?auto_85605 ?auto_85607 ) ) ( not ( = ?auto_85605 ?auto_85608 ) ) ( not ( = ?auto_85605 ?auto_85609 ) ) ( not ( = ?auto_85606 ?auto_85607 ) ) ( not ( = ?auto_85606 ?auto_85608 ) ) ( not ( = ?auto_85606 ?auto_85609 ) ) ( not ( = ?auto_85607 ?auto_85608 ) ) ( not ( = ?auto_85607 ?auto_85609 ) ) ( not ( = ?auto_85608 ?auto_85609 ) ) ( HOLDING ?auto_85610 ) ( CLEAR ?auto_85611 ) ( not ( = ?auto_85605 ?auto_85610 ) ) ( not ( = ?auto_85605 ?auto_85611 ) ) ( not ( = ?auto_85606 ?auto_85610 ) ) ( not ( = ?auto_85606 ?auto_85611 ) ) ( not ( = ?auto_85607 ?auto_85610 ) ) ( not ( = ?auto_85607 ?auto_85611 ) ) ( not ( = ?auto_85608 ?auto_85610 ) ) ( not ( = ?auto_85608 ?auto_85611 ) ) ( not ( = ?auto_85609 ?auto_85610 ) ) ( not ( = ?auto_85609 ?auto_85611 ) ) ( not ( = ?auto_85610 ?auto_85611 ) ) )
    :subtasks
    ( ( !STACK ?auto_85610 ?auto_85611 )
      ( MAKE-4PILE ?auto_85605 ?auto_85606 ?auto_85607 ?auto_85608 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85612 - BLOCK
      ?auto_85613 - BLOCK
      ?auto_85614 - BLOCK
      ?auto_85615 - BLOCK
    )
    :vars
    (
      ?auto_85618 - BLOCK
      ?auto_85616 - BLOCK
      ?auto_85617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85618 ?auto_85615 ) ( ON-TABLE ?auto_85612 ) ( ON ?auto_85613 ?auto_85612 ) ( ON ?auto_85614 ?auto_85613 ) ( ON ?auto_85615 ?auto_85614 ) ( not ( = ?auto_85612 ?auto_85613 ) ) ( not ( = ?auto_85612 ?auto_85614 ) ) ( not ( = ?auto_85612 ?auto_85615 ) ) ( not ( = ?auto_85612 ?auto_85618 ) ) ( not ( = ?auto_85613 ?auto_85614 ) ) ( not ( = ?auto_85613 ?auto_85615 ) ) ( not ( = ?auto_85613 ?auto_85618 ) ) ( not ( = ?auto_85614 ?auto_85615 ) ) ( not ( = ?auto_85614 ?auto_85618 ) ) ( not ( = ?auto_85615 ?auto_85618 ) ) ( CLEAR ?auto_85616 ) ( not ( = ?auto_85612 ?auto_85617 ) ) ( not ( = ?auto_85612 ?auto_85616 ) ) ( not ( = ?auto_85613 ?auto_85617 ) ) ( not ( = ?auto_85613 ?auto_85616 ) ) ( not ( = ?auto_85614 ?auto_85617 ) ) ( not ( = ?auto_85614 ?auto_85616 ) ) ( not ( = ?auto_85615 ?auto_85617 ) ) ( not ( = ?auto_85615 ?auto_85616 ) ) ( not ( = ?auto_85618 ?auto_85617 ) ) ( not ( = ?auto_85618 ?auto_85616 ) ) ( not ( = ?auto_85617 ?auto_85616 ) ) ( ON ?auto_85617 ?auto_85618 ) ( CLEAR ?auto_85617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_85612 ?auto_85613 ?auto_85614 ?auto_85615 ?auto_85618 )
      ( MAKE-4PILE ?auto_85612 ?auto_85613 ?auto_85614 ?auto_85615 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85619 - BLOCK
      ?auto_85620 - BLOCK
      ?auto_85621 - BLOCK
      ?auto_85622 - BLOCK
    )
    :vars
    (
      ?auto_85625 - BLOCK
      ?auto_85624 - BLOCK
      ?auto_85623 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85625 ?auto_85622 ) ( ON-TABLE ?auto_85619 ) ( ON ?auto_85620 ?auto_85619 ) ( ON ?auto_85621 ?auto_85620 ) ( ON ?auto_85622 ?auto_85621 ) ( not ( = ?auto_85619 ?auto_85620 ) ) ( not ( = ?auto_85619 ?auto_85621 ) ) ( not ( = ?auto_85619 ?auto_85622 ) ) ( not ( = ?auto_85619 ?auto_85625 ) ) ( not ( = ?auto_85620 ?auto_85621 ) ) ( not ( = ?auto_85620 ?auto_85622 ) ) ( not ( = ?auto_85620 ?auto_85625 ) ) ( not ( = ?auto_85621 ?auto_85622 ) ) ( not ( = ?auto_85621 ?auto_85625 ) ) ( not ( = ?auto_85622 ?auto_85625 ) ) ( not ( = ?auto_85619 ?auto_85624 ) ) ( not ( = ?auto_85619 ?auto_85623 ) ) ( not ( = ?auto_85620 ?auto_85624 ) ) ( not ( = ?auto_85620 ?auto_85623 ) ) ( not ( = ?auto_85621 ?auto_85624 ) ) ( not ( = ?auto_85621 ?auto_85623 ) ) ( not ( = ?auto_85622 ?auto_85624 ) ) ( not ( = ?auto_85622 ?auto_85623 ) ) ( not ( = ?auto_85625 ?auto_85624 ) ) ( not ( = ?auto_85625 ?auto_85623 ) ) ( not ( = ?auto_85624 ?auto_85623 ) ) ( ON ?auto_85624 ?auto_85625 ) ( CLEAR ?auto_85624 ) ( HOLDING ?auto_85623 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_85623 )
      ( MAKE-4PILE ?auto_85619 ?auto_85620 ?auto_85621 ?auto_85622 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85626 - BLOCK
      ?auto_85627 - BLOCK
      ?auto_85628 - BLOCK
      ?auto_85629 - BLOCK
    )
    :vars
    (
      ?auto_85632 - BLOCK
      ?auto_85631 - BLOCK
      ?auto_85630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85632 ?auto_85629 ) ( ON-TABLE ?auto_85626 ) ( ON ?auto_85627 ?auto_85626 ) ( ON ?auto_85628 ?auto_85627 ) ( ON ?auto_85629 ?auto_85628 ) ( not ( = ?auto_85626 ?auto_85627 ) ) ( not ( = ?auto_85626 ?auto_85628 ) ) ( not ( = ?auto_85626 ?auto_85629 ) ) ( not ( = ?auto_85626 ?auto_85632 ) ) ( not ( = ?auto_85627 ?auto_85628 ) ) ( not ( = ?auto_85627 ?auto_85629 ) ) ( not ( = ?auto_85627 ?auto_85632 ) ) ( not ( = ?auto_85628 ?auto_85629 ) ) ( not ( = ?auto_85628 ?auto_85632 ) ) ( not ( = ?auto_85629 ?auto_85632 ) ) ( not ( = ?auto_85626 ?auto_85631 ) ) ( not ( = ?auto_85626 ?auto_85630 ) ) ( not ( = ?auto_85627 ?auto_85631 ) ) ( not ( = ?auto_85627 ?auto_85630 ) ) ( not ( = ?auto_85628 ?auto_85631 ) ) ( not ( = ?auto_85628 ?auto_85630 ) ) ( not ( = ?auto_85629 ?auto_85631 ) ) ( not ( = ?auto_85629 ?auto_85630 ) ) ( not ( = ?auto_85632 ?auto_85631 ) ) ( not ( = ?auto_85632 ?auto_85630 ) ) ( not ( = ?auto_85631 ?auto_85630 ) ) ( ON ?auto_85631 ?auto_85632 ) ( ON ?auto_85630 ?auto_85631 ) ( CLEAR ?auto_85630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85626 ?auto_85627 ?auto_85628 ?auto_85629 ?auto_85632 ?auto_85631 )
      ( MAKE-4PILE ?auto_85626 ?auto_85627 ?auto_85628 ?auto_85629 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85633 - BLOCK
      ?auto_85634 - BLOCK
      ?auto_85635 - BLOCK
      ?auto_85636 - BLOCK
    )
    :vars
    (
      ?auto_85638 - BLOCK
      ?auto_85639 - BLOCK
      ?auto_85637 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85638 ?auto_85636 ) ( ON-TABLE ?auto_85633 ) ( ON ?auto_85634 ?auto_85633 ) ( ON ?auto_85635 ?auto_85634 ) ( ON ?auto_85636 ?auto_85635 ) ( not ( = ?auto_85633 ?auto_85634 ) ) ( not ( = ?auto_85633 ?auto_85635 ) ) ( not ( = ?auto_85633 ?auto_85636 ) ) ( not ( = ?auto_85633 ?auto_85638 ) ) ( not ( = ?auto_85634 ?auto_85635 ) ) ( not ( = ?auto_85634 ?auto_85636 ) ) ( not ( = ?auto_85634 ?auto_85638 ) ) ( not ( = ?auto_85635 ?auto_85636 ) ) ( not ( = ?auto_85635 ?auto_85638 ) ) ( not ( = ?auto_85636 ?auto_85638 ) ) ( not ( = ?auto_85633 ?auto_85639 ) ) ( not ( = ?auto_85633 ?auto_85637 ) ) ( not ( = ?auto_85634 ?auto_85639 ) ) ( not ( = ?auto_85634 ?auto_85637 ) ) ( not ( = ?auto_85635 ?auto_85639 ) ) ( not ( = ?auto_85635 ?auto_85637 ) ) ( not ( = ?auto_85636 ?auto_85639 ) ) ( not ( = ?auto_85636 ?auto_85637 ) ) ( not ( = ?auto_85638 ?auto_85639 ) ) ( not ( = ?auto_85638 ?auto_85637 ) ) ( not ( = ?auto_85639 ?auto_85637 ) ) ( ON ?auto_85639 ?auto_85638 ) ( HOLDING ?auto_85637 ) ( CLEAR ?auto_85639 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_85633 ?auto_85634 ?auto_85635 ?auto_85636 ?auto_85638 ?auto_85639 ?auto_85637 )
      ( MAKE-4PILE ?auto_85633 ?auto_85634 ?auto_85635 ?auto_85636 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85640 - BLOCK
      ?auto_85641 - BLOCK
      ?auto_85642 - BLOCK
      ?auto_85643 - BLOCK
    )
    :vars
    (
      ?auto_85645 - BLOCK
      ?auto_85646 - BLOCK
      ?auto_85644 - BLOCK
      ?auto_85647 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85645 ?auto_85643 ) ( ON-TABLE ?auto_85640 ) ( ON ?auto_85641 ?auto_85640 ) ( ON ?auto_85642 ?auto_85641 ) ( ON ?auto_85643 ?auto_85642 ) ( not ( = ?auto_85640 ?auto_85641 ) ) ( not ( = ?auto_85640 ?auto_85642 ) ) ( not ( = ?auto_85640 ?auto_85643 ) ) ( not ( = ?auto_85640 ?auto_85645 ) ) ( not ( = ?auto_85641 ?auto_85642 ) ) ( not ( = ?auto_85641 ?auto_85643 ) ) ( not ( = ?auto_85641 ?auto_85645 ) ) ( not ( = ?auto_85642 ?auto_85643 ) ) ( not ( = ?auto_85642 ?auto_85645 ) ) ( not ( = ?auto_85643 ?auto_85645 ) ) ( not ( = ?auto_85640 ?auto_85646 ) ) ( not ( = ?auto_85640 ?auto_85644 ) ) ( not ( = ?auto_85641 ?auto_85646 ) ) ( not ( = ?auto_85641 ?auto_85644 ) ) ( not ( = ?auto_85642 ?auto_85646 ) ) ( not ( = ?auto_85642 ?auto_85644 ) ) ( not ( = ?auto_85643 ?auto_85646 ) ) ( not ( = ?auto_85643 ?auto_85644 ) ) ( not ( = ?auto_85645 ?auto_85646 ) ) ( not ( = ?auto_85645 ?auto_85644 ) ) ( not ( = ?auto_85646 ?auto_85644 ) ) ( ON ?auto_85646 ?auto_85645 ) ( CLEAR ?auto_85646 ) ( ON ?auto_85644 ?auto_85647 ) ( CLEAR ?auto_85644 ) ( HAND-EMPTY ) ( not ( = ?auto_85640 ?auto_85647 ) ) ( not ( = ?auto_85641 ?auto_85647 ) ) ( not ( = ?auto_85642 ?auto_85647 ) ) ( not ( = ?auto_85643 ?auto_85647 ) ) ( not ( = ?auto_85645 ?auto_85647 ) ) ( not ( = ?auto_85646 ?auto_85647 ) ) ( not ( = ?auto_85644 ?auto_85647 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_85644 ?auto_85647 )
      ( MAKE-4PILE ?auto_85640 ?auto_85641 ?auto_85642 ?auto_85643 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85648 - BLOCK
      ?auto_85649 - BLOCK
      ?auto_85650 - BLOCK
      ?auto_85651 - BLOCK
    )
    :vars
    (
      ?auto_85655 - BLOCK
      ?auto_85654 - BLOCK
      ?auto_85653 - BLOCK
      ?auto_85652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85655 ?auto_85651 ) ( ON-TABLE ?auto_85648 ) ( ON ?auto_85649 ?auto_85648 ) ( ON ?auto_85650 ?auto_85649 ) ( ON ?auto_85651 ?auto_85650 ) ( not ( = ?auto_85648 ?auto_85649 ) ) ( not ( = ?auto_85648 ?auto_85650 ) ) ( not ( = ?auto_85648 ?auto_85651 ) ) ( not ( = ?auto_85648 ?auto_85655 ) ) ( not ( = ?auto_85649 ?auto_85650 ) ) ( not ( = ?auto_85649 ?auto_85651 ) ) ( not ( = ?auto_85649 ?auto_85655 ) ) ( not ( = ?auto_85650 ?auto_85651 ) ) ( not ( = ?auto_85650 ?auto_85655 ) ) ( not ( = ?auto_85651 ?auto_85655 ) ) ( not ( = ?auto_85648 ?auto_85654 ) ) ( not ( = ?auto_85648 ?auto_85653 ) ) ( not ( = ?auto_85649 ?auto_85654 ) ) ( not ( = ?auto_85649 ?auto_85653 ) ) ( not ( = ?auto_85650 ?auto_85654 ) ) ( not ( = ?auto_85650 ?auto_85653 ) ) ( not ( = ?auto_85651 ?auto_85654 ) ) ( not ( = ?auto_85651 ?auto_85653 ) ) ( not ( = ?auto_85655 ?auto_85654 ) ) ( not ( = ?auto_85655 ?auto_85653 ) ) ( not ( = ?auto_85654 ?auto_85653 ) ) ( ON ?auto_85653 ?auto_85652 ) ( CLEAR ?auto_85653 ) ( not ( = ?auto_85648 ?auto_85652 ) ) ( not ( = ?auto_85649 ?auto_85652 ) ) ( not ( = ?auto_85650 ?auto_85652 ) ) ( not ( = ?auto_85651 ?auto_85652 ) ) ( not ( = ?auto_85655 ?auto_85652 ) ) ( not ( = ?auto_85654 ?auto_85652 ) ) ( not ( = ?auto_85653 ?auto_85652 ) ) ( HOLDING ?auto_85654 ) ( CLEAR ?auto_85655 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85648 ?auto_85649 ?auto_85650 ?auto_85651 ?auto_85655 ?auto_85654 )
      ( MAKE-4PILE ?auto_85648 ?auto_85649 ?auto_85650 ?auto_85651 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85656 - BLOCK
      ?auto_85657 - BLOCK
      ?auto_85658 - BLOCK
      ?auto_85659 - BLOCK
    )
    :vars
    (
      ?auto_85661 - BLOCK
      ?auto_85660 - BLOCK
      ?auto_85662 - BLOCK
      ?auto_85663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85661 ?auto_85659 ) ( ON-TABLE ?auto_85656 ) ( ON ?auto_85657 ?auto_85656 ) ( ON ?auto_85658 ?auto_85657 ) ( ON ?auto_85659 ?auto_85658 ) ( not ( = ?auto_85656 ?auto_85657 ) ) ( not ( = ?auto_85656 ?auto_85658 ) ) ( not ( = ?auto_85656 ?auto_85659 ) ) ( not ( = ?auto_85656 ?auto_85661 ) ) ( not ( = ?auto_85657 ?auto_85658 ) ) ( not ( = ?auto_85657 ?auto_85659 ) ) ( not ( = ?auto_85657 ?auto_85661 ) ) ( not ( = ?auto_85658 ?auto_85659 ) ) ( not ( = ?auto_85658 ?auto_85661 ) ) ( not ( = ?auto_85659 ?auto_85661 ) ) ( not ( = ?auto_85656 ?auto_85660 ) ) ( not ( = ?auto_85656 ?auto_85662 ) ) ( not ( = ?auto_85657 ?auto_85660 ) ) ( not ( = ?auto_85657 ?auto_85662 ) ) ( not ( = ?auto_85658 ?auto_85660 ) ) ( not ( = ?auto_85658 ?auto_85662 ) ) ( not ( = ?auto_85659 ?auto_85660 ) ) ( not ( = ?auto_85659 ?auto_85662 ) ) ( not ( = ?auto_85661 ?auto_85660 ) ) ( not ( = ?auto_85661 ?auto_85662 ) ) ( not ( = ?auto_85660 ?auto_85662 ) ) ( ON ?auto_85662 ?auto_85663 ) ( not ( = ?auto_85656 ?auto_85663 ) ) ( not ( = ?auto_85657 ?auto_85663 ) ) ( not ( = ?auto_85658 ?auto_85663 ) ) ( not ( = ?auto_85659 ?auto_85663 ) ) ( not ( = ?auto_85661 ?auto_85663 ) ) ( not ( = ?auto_85660 ?auto_85663 ) ) ( not ( = ?auto_85662 ?auto_85663 ) ) ( CLEAR ?auto_85661 ) ( ON ?auto_85660 ?auto_85662 ) ( CLEAR ?auto_85660 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_85663 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_85663 ?auto_85662 )
      ( MAKE-4PILE ?auto_85656 ?auto_85657 ?auto_85658 ?auto_85659 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85680 - BLOCK
      ?auto_85681 - BLOCK
      ?auto_85682 - BLOCK
      ?auto_85683 - BLOCK
    )
    :vars
    (
      ?auto_85687 - BLOCK
      ?auto_85685 - BLOCK
      ?auto_85684 - BLOCK
      ?auto_85686 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85680 ) ( ON ?auto_85681 ?auto_85680 ) ( ON ?auto_85682 ?auto_85681 ) ( not ( = ?auto_85680 ?auto_85681 ) ) ( not ( = ?auto_85680 ?auto_85682 ) ) ( not ( = ?auto_85680 ?auto_85683 ) ) ( not ( = ?auto_85680 ?auto_85687 ) ) ( not ( = ?auto_85681 ?auto_85682 ) ) ( not ( = ?auto_85681 ?auto_85683 ) ) ( not ( = ?auto_85681 ?auto_85687 ) ) ( not ( = ?auto_85682 ?auto_85683 ) ) ( not ( = ?auto_85682 ?auto_85687 ) ) ( not ( = ?auto_85683 ?auto_85687 ) ) ( not ( = ?auto_85680 ?auto_85685 ) ) ( not ( = ?auto_85680 ?auto_85684 ) ) ( not ( = ?auto_85681 ?auto_85685 ) ) ( not ( = ?auto_85681 ?auto_85684 ) ) ( not ( = ?auto_85682 ?auto_85685 ) ) ( not ( = ?auto_85682 ?auto_85684 ) ) ( not ( = ?auto_85683 ?auto_85685 ) ) ( not ( = ?auto_85683 ?auto_85684 ) ) ( not ( = ?auto_85687 ?auto_85685 ) ) ( not ( = ?auto_85687 ?auto_85684 ) ) ( not ( = ?auto_85685 ?auto_85684 ) ) ( ON ?auto_85684 ?auto_85686 ) ( not ( = ?auto_85680 ?auto_85686 ) ) ( not ( = ?auto_85681 ?auto_85686 ) ) ( not ( = ?auto_85682 ?auto_85686 ) ) ( not ( = ?auto_85683 ?auto_85686 ) ) ( not ( = ?auto_85687 ?auto_85686 ) ) ( not ( = ?auto_85685 ?auto_85686 ) ) ( not ( = ?auto_85684 ?auto_85686 ) ) ( ON ?auto_85685 ?auto_85684 ) ( ON-TABLE ?auto_85686 ) ( ON ?auto_85687 ?auto_85685 ) ( CLEAR ?auto_85687 ) ( HOLDING ?auto_85683 ) ( CLEAR ?auto_85682 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_85680 ?auto_85681 ?auto_85682 ?auto_85683 ?auto_85687 )
      ( MAKE-4PILE ?auto_85680 ?auto_85681 ?auto_85682 ?auto_85683 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85688 - BLOCK
      ?auto_85689 - BLOCK
      ?auto_85690 - BLOCK
      ?auto_85691 - BLOCK
    )
    :vars
    (
      ?auto_85692 - BLOCK
      ?auto_85693 - BLOCK
      ?auto_85694 - BLOCK
      ?auto_85695 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85688 ) ( ON ?auto_85689 ?auto_85688 ) ( ON ?auto_85690 ?auto_85689 ) ( not ( = ?auto_85688 ?auto_85689 ) ) ( not ( = ?auto_85688 ?auto_85690 ) ) ( not ( = ?auto_85688 ?auto_85691 ) ) ( not ( = ?auto_85688 ?auto_85692 ) ) ( not ( = ?auto_85689 ?auto_85690 ) ) ( not ( = ?auto_85689 ?auto_85691 ) ) ( not ( = ?auto_85689 ?auto_85692 ) ) ( not ( = ?auto_85690 ?auto_85691 ) ) ( not ( = ?auto_85690 ?auto_85692 ) ) ( not ( = ?auto_85691 ?auto_85692 ) ) ( not ( = ?auto_85688 ?auto_85693 ) ) ( not ( = ?auto_85688 ?auto_85694 ) ) ( not ( = ?auto_85689 ?auto_85693 ) ) ( not ( = ?auto_85689 ?auto_85694 ) ) ( not ( = ?auto_85690 ?auto_85693 ) ) ( not ( = ?auto_85690 ?auto_85694 ) ) ( not ( = ?auto_85691 ?auto_85693 ) ) ( not ( = ?auto_85691 ?auto_85694 ) ) ( not ( = ?auto_85692 ?auto_85693 ) ) ( not ( = ?auto_85692 ?auto_85694 ) ) ( not ( = ?auto_85693 ?auto_85694 ) ) ( ON ?auto_85694 ?auto_85695 ) ( not ( = ?auto_85688 ?auto_85695 ) ) ( not ( = ?auto_85689 ?auto_85695 ) ) ( not ( = ?auto_85690 ?auto_85695 ) ) ( not ( = ?auto_85691 ?auto_85695 ) ) ( not ( = ?auto_85692 ?auto_85695 ) ) ( not ( = ?auto_85693 ?auto_85695 ) ) ( not ( = ?auto_85694 ?auto_85695 ) ) ( ON ?auto_85693 ?auto_85694 ) ( ON-TABLE ?auto_85695 ) ( ON ?auto_85692 ?auto_85693 ) ( CLEAR ?auto_85690 ) ( ON ?auto_85691 ?auto_85692 ) ( CLEAR ?auto_85691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_85695 ?auto_85694 ?auto_85693 ?auto_85692 )
      ( MAKE-4PILE ?auto_85688 ?auto_85689 ?auto_85690 ?auto_85691 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85696 - BLOCK
      ?auto_85697 - BLOCK
      ?auto_85698 - BLOCK
      ?auto_85699 - BLOCK
    )
    :vars
    (
      ?auto_85700 - BLOCK
      ?auto_85702 - BLOCK
      ?auto_85701 - BLOCK
      ?auto_85703 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85696 ) ( ON ?auto_85697 ?auto_85696 ) ( not ( = ?auto_85696 ?auto_85697 ) ) ( not ( = ?auto_85696 ?auto_85698 ) ) ( not ( = ?auto_85696 ?auto_85699 ) ) ( not ( = ?auto_85696 ?auto_85700 ) ) ( not ( = ?auto_85697 ?auto_85698 ) ) ( not ( = ?auto_85697 ?auto_85699 ) ) ( not ( = ?auto_85697 ?auto_85700 ) ) ( not ( = ?auto_85698 ?auto_85699 ) ) ( not ( = ?auto_85698 ?auto_85700 ) ) ( not ( = ?auto_85699 ?auto_85700 ) ) ( not ( = ?auto_85696 ?auto_85702 ) ) ( not ( = ?auto_85696 ?auto_85701 ) ) ( not ( = ?auto_85697 ?auto_85702 ) ) ( not ( = ?auto_85697 ?auto_85701 ) ) ( not ( = ?auto_85698 ?auto_85702 ) ) ( not ( = ?auto_85698 ?auto_85701 ) ) ( not ( = ?auto_85699 ?auto_85702 ) ) ( not ( = ?auto_85699 ?auto_85701 ) ) ( not ( = ?auto_85700 ?auto_85702 ) ) ( not ( = ?auto_85700 ?auto_85701 ) ) ( not ( = ?auto_85702 ?auto_85701 ) ) ( ON ?auto_85701 ?auto_85703 ) ( not ( = ?auto_85696 ?auto_85703 ) ) ( not ( = ?auto_85697 ?auto_85703 ) ) ( not ( = ?auto_85698 ?auto_85703 ) ) ( not ( = ?auto_85699 ?auto_85703 ) ) ( not ( = ?auto_85700 ?auto_85703 ) ) ( not ( = ?auto_85702 ?auto_85703 ) ) ( not ( = ?auto_85701 ?auto_85703 ) ) ( ON ?auto_85702 ?auto_85701 ) ( ON-TABLE ?auto_85703 ) ( ON ?auto_85700 ?auto_85702 ) ( ON ?auto_85699 ?auto_85700 ) ( CLEAR ?auto_85699 ) ( HOLDING ?auto_85698 ) ( CLEAR ?auto_85697 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_85696 ?auto_85697 ?auto_85698 )
      ( MAKE-4PILE ?auto_85696 ?auto_85697 ?auto_85698 ?auto_85699 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85704 - BLOCK
      ?auto_85705 - BLOCK
      ?auto_85706 - BLOCK
      ?auto_85707 - BLOCK
    )
    :vars
    (
      ?auto_85709 - BLOCK
      ?auto_85710 - BLOCK
      ?auto_85708 - BLOCK
      ?auto_85711 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85704 ) ( ON ?auto_85705 ?auto_85704 ) ( not ( = ?auto_85704 ?auto_85705 ) ) ( not ( = ?auto_85704 ?auto_85706 ) ) ( not ( = ?auto_85704 ?auto_85707 ) ) ( not ( = ?auto_85704 ?auto_85709 ) ) ( not ( = ?auto_85705 ?auto_85706 ) ) ( not ( = ?auto_85705 ?auto_85707 ) ) ( not ( = ?auto_85705 ?auto_85709 ) ) ( not ( = ?auto_85706 ?auto_85707 ) ) ( not ( = ?auto_85706 ?auto_85709 ) ) ( not ( = ?auto_85707 ?auto_85709 ) ) ( not ( = ?auto_85704 ?auto_85710 ) ) ( not ( = ?auto_85704 ?auto_85708 ) ) ( not ( = ?auto_85705 ?auto_85710 ) ) ( not ( = ?auto_85705 ?auto_85708 ) ) ( not ( = ?auto_85706 ?auto_85710 ) ) ( not ( = ?auto_85706 ?auto_85708 ) ) ( not ( = ?auto_85707 ?auto_85710 ) ) ( not ( = ?auto_85707 ?auto_85708 ) ) ( not ( = ?auto_85709 ?auto_85710 ) ) ( not ( = ?auto_85709 ?auto_85708 ) ) ( not ( = ?auto_85710 ?auto_85708 ) ) ( ON ?auto_85708 ?auto_85711 ) ( not ( = ?auto_85704 ?auto_85711 ) ) ( not ( = ?auto_85705 ?auto_85711 ) ) ( not ( = ?auto_85706 ?auto_85711 ) ) ( not ( = ?auto_85707 ?auto_85711 ) ) ( not ( = ?auto_85709 ?auto_85711 ) ) ( not ( = ?auto_85710 ?auto_85711 ) ) ( not ( = ?auto_85708 ?auto_85711 ) ) ( ON ?auto_85710 ?auto_85708 ) ( ON-TABLE ?auto_85711 ) ( ON ?auto_85709 ?auto_85710 ) ( ON ?auto_85707 ?auto_85709 ) ( CLEAR ?auto_85705 ) ( ON ?auto_85706 ?auto_85707 ) ( CLEAR ?auto_85706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_85711 ?auto_85708 ?auto_85710 ?auto_85709 ?auto_85707 )
      ( MAKE-4PILE ?auto_85704 ?auto_85705 ?auto_85706 ?auto_85707 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85712 - BLOCK
      ?auto_85713 - BLOCK
      ?auto_85714 - BLOCK
      ?auto_85715 - BLOCK
    )
    :vars
    (
      ?auto_85717 - BLOCK
      ?auto_85719 - BLOCK
      ?auto_85716 - BLOCK
      ?auto_85718 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85712 ) ( not ( = ?auto_85712 ?auto_85713 ) ) ( not ( = ?auto_85712 ?auto_85714 ) ) ( not ( = ?auto_85712 ?auto_85715 ) ) ( not ( = ?auto_85712 ?auto_85717 ) ) ( not ( = ?auto_85713 ?auto_85714 ) ) ( not ( = ?auto_85713 ?auto_85715 ) ) ( not ( = ?auto_85713 ?auto_85717 ) ) ( not ( = ?auto_85714 ?auto_85715 ) ) ( not ( = ?auto_85714 ?auto_85717 ) ) ( not ( = ?auto_85715 ?auto_85717 ) ) ( not ( = ?auto_85712 ?auto_85719 ) ) ( not ( = ?auto_85712 ?auto_85716 ) ) ( not ( = ?auto_85713 ?auto_85719 ) ) ( not ( = ?auto_85713 ?auto_85716 ) ) ( not ( = ?auto_85714 ?auto_85719 ) ) ( not ( = ?auto_85714 ?auto_85716 ) ) ( not ( = ?auto_85715 ?auto_85719 ) ) ( not ( = ?auto_85715 ?auto_85716 ) ) ( not ( = ?auto_85717 ?auto_85719 ) ) ( not ( = ?auto_85717 ?auto_85716 ) ) ( not ( = ?auto_85719 ?auto_85716 ) ) ( ON ?auto_85716 ?auto_85718 ) ( not ( = ?auto_85712 ?auto_85718 ) ) ( not ( = ?auto_85713 ?auto_85718 ) ) ( not ( = ?auto_85714 ?auto_85718 ) ) ( not ( = ?auto_85715 ?auto_85718 ) ) ( not ( = ?auto_85717 ?auto_85718 ) ) ( not ( = ?auto_85719 ?auto_85718 ) ) ( not ( = ?auto_85716 ?auto_85718 ) ) ( ON ?auto_85719 ?auto_85716 ) ( ON-TABLE ?auto_85718 ) ( ON ?auto_85717 ?auto_85719 ) ( ON ?auto_85715 ?auto_85717 ) ( ON ?auto_85714 ?auto_85715 ) ( CLEAR ?auto_85714 ) ( HOLDING ?auto_85713 ) ( CLEAR ?auto_85712 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_85712 ?auto_85713 )
      ( MAKE-4PILE ?auto_85712 ?auto_85713 ?auto_85714 ?auto_85715 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85720 - BLOCK
      ?auto_85721 - BLOCK
      ?auto_85722 - BLOCK
      ?auto_85723 - BLOCK
    )
    :vars
    (
      ?auto_85724 - BLOCK
      ?auto_85727 - BLOCK
      ?auto_85726 - BLOCK
      ?auto_85725 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85720 ) ( not ( = ?auto_85720 ?auto_85721 ) ) ( not ( = ?auto_85720 ?auto_85722 ) ) ( not ( = ?auto_85720 ?auto_85723 ) ) ( not ( = ?auto_85720 ?auto_85724 ) ) ( not ( = ?auto_85721 ?auto_85722 ) ) ( not ( = ?auto_85721 ?auto_85723 ) ) ( not ( = ?auto_85721 ?auto_85724 ) ) ( not ( = ?auto_85722 ?auto_85723 ) ) ( not ( = ?auto_85722 ?auto_85724 ) ) ( not ( = ?auto_85723 ?auto_85724 ) ) ( not ( = ?auto_85720 ?auto_85727 ) ) ( not ( = ?auto_85720 ?auto_85726 ) ) ( not ( = ?auto_85721 ?auto_85727 ) ) ( not ( = ?auto_85721 ?auto_85726 ) ) ( not ( = ?auto_85722 ?auto_85727 ) ) ( not ( = ?auto_85722 ?auto_85726 ) ) ( not ( = ?auto_85723 ?auto_85727 ) ) ( not ( = ?auto_85723 ?auto_85726 ) ) ( not ( = ?auto_85724 ?auto_85727 ) ) ( not ( = ?auto_85724 ?auto_85726 ) ) ( not ( = ?auto_85727 ?auto_85726 ) ) ( ON ?auto_85726 ?auto_85725 ) ( not ( = ?auto_85720 ?auto_85725 ) ) ( not ( = ?auto_85721 ?auto_85725 ) ) ( not ( = ?auto_85722 ?auto_85725 ) ) ( not ( = ?auto_85723 ?auto_85725 ) ) ( not ( = ?auto_85724 ?auto_85725 ) ) ( not ( = ?auto_85727 ?auto_85725 ) ) ( not ( = ?auto_85726 ?auto_85725 ) ) ( ON ?auto_85727 ?auto_85726 ) ( ON-TABLE ?auto_85725 ) ( ON ?auto_85724 ?auto_85727 ) ( ON ?auto_85723 ?auto_85724 ) ( ON ?auto_85722 ?auto_85723 ) ( CLEAR ?auto_85720 ) ( ON ?auto_85721 ?auto_85722 ) ( CLEAR ?auto_85721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85725 ?auto_85726 ?auto_85727 ?auto_85724 ?auto_85723 ?auto_85722 )
      ( MAKE-4PILE ?auto_85720 ?auto_85721 ?auto_85722 ?auto_85723 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85728 - BLOCK
      ?auto_85729 - BLOCK
      ?auto_85730 - BLOCK
      ?auto_85731 - BLOCK
    )
    :vars
    (
      ?auto_85735 - BLOCK
      ?auto_85732 - BLOCK
      ?auto_85733 - BLOCK
      ?auto_85734 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85728 ?auto_85729 ) ) ( not ( = ?auto_85728 ?auto_85730 ) ) ( not ( = ?auto_85728 ?auto_85731 ) ) ( not ( = ?auto_85728 ?auto_85735 ) ) ( not ( = ?auto_85729 ?auto_85730 ) ) ( not ( = ?auto_85729 ?auto_85731 ) ) ( not ( = ?auto_85729 ?auto_85735 ) ) ( not ( = ?auto_85730 ?auto_85731 ) ) ( not ( = ?auto_85730 ?auto_85735 ) ) ( not ( = ?auto_85731 ?auto_85735 ) ) ( not ( = ?auto_85728 ?auto_85732 ) ) ( not ( = ?auto_85728 ?auto_85733 ) ) ( not ( = ?auto_85729 ?auto_85732 ) ) ( not ( = ?auto_85729 ?auto_85733 ) ) ( not ( = ?auto_85730 ?auto_85732 ) ) ( not ( = ?auto_85730 ?auto_85733 ) ) ( not ( = ?auto_85731 ?auto_85732 ) ) ( not ( = ?auto_85731 ?auto_85733 ) ) ( not ( = ?auto_85735 ?auto_85732 ) ) ( not ( = ?auto_85735 ?auto_85733 ) ) ( not ( = ?auto_85732 ?auto_85733 ) ) ( ON ?auto_85733 ?auto_85734 ) ( not ( = ?auto_85728 ?auto_85734 ) ) ( not ( = ?auto_85729 ?auto_85734 ) ) ( not ( = ?auto_85730 ?auto_85734 ) ) ( not ( = ?auto_85731 ?auto_85734 ) ) ( not ( = ?auto_85735 ?auto_85734 ) ) ( not ( = ?auto_85732 ?auto_85734 ) ) ( not ( = ?auto_85733 ?auto_85734 ) ) ( ON ?auto_85732 ?auto_85733 ) ( ON-TABLE ?auto_85734 ) ( ON ?auto_85735 ?auto_85732 ) ( ON ?auto_85731 ?auto_85735 ) ( ON ?auto_85730 ?auto_85731 ) ( ON ?auto_85729 ?auto_85730 ) ( CLEAR ?auto_85729 ) ( HOLDING ?auto_85728 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_85728 )
      ( MAKE-4PILE ?auto_85728 ?auto_85729 ?auto_85730 ?auto_85731 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85736 - BLOCK
      ?auto_85737 - BLOCK
      ?auto_85738 - BLOCK
      ?auto_85739 - BLOCK
    )
    :vars
    (
      ?auto_85743 - BLOCK
      ?auto_85740 - BLOCK
      ?auto_85742 - BLOCK
      ?auto_85741 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85736 ?auto_85737 ) ) ( not ( = ?auto_85736 ?auto_85738 ) ) ( not ( = ?auto_85736 ?auto_85739 ) ) ( not ( = ?auto_85736 ?auto_85743 ) ) ( not ( = ?auto_85737 ?auto_85738 ) ) ( not ( = ?auto_85737 ?auto_85739 ) ) ( not ( = ?auto_85737 ?auto_85743 ) ) ( not ( = ?auto_85738 ?auto_85739 ) ) ( not ( = ?auto_85738 ?auto_85743 ) ) ( not ( = ?auto_85739 ?auto_85743 ) ) ( not ( = ?auto_85736 ?auto_85740 ) ) ( not ( = ?auto_85736 ?auto_85742 ) ) ( not ( = ?auto_85737 ?auto_85740 ) ) ( not ( = ?auto_85737 ?auto_85742 ) ) ( not ( = ?auto_85738 ?auto_85740 ) ) ( not ( = ?auto_85738 ?auto_85742 ) ) ( not ( = ?auto_85739 ?auto_85740 ) ) ( not ( = ?auto_85739 ?auto_85742 ) ) ( not ( = ?auto_85743 ?auto_85740 ) ) ( not ( = ?auto_85743 ?auto_85742 ) ) ( not ( = ?auto_85740 ?auto_85742 ) ) ( ON ?auto_85742 ?auto_85741 ) ( not ( = ?auto_85736 ?auto_85741 ) ) ( not ( = ?auto_85737 ?auto_85741 ) ) ( not ( = ?auto_85738 ?auto_85741 ) ) ( not ( = ?auto_85739 ?auto_85741 ) ) ( not ( = ?auto_85743 ?auto_85741 ) ) ( not ( = ?auto_85740 ?auto_85741 ) ) ( not ( = ?auto_85742 ?auto_85741 ) ) ( ON ?auto_85740 ?auto_85742 ) ( ON-TABLE ?auto_85741 ) ( ON ?auto_85743 ?auto_85740 ) ( ON ?auto_85739 ?auto_85743 ) ( ON ?auto_85738 ?auto_85739 ) ( ON ?auto_85737 ?auto_85738 ) ( ON ?auto_85736 ?auto_85737 ) ( CLEAR ?auto_85736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_85741 ?auto_85742 ?auto_85740 ?auto_85743 ?auto_85739 ?auto_85738 ?auto_85737 )
      ( MAKE-4PILE ?auto_85736 ?auto_85737 ?auto_85738 ?auto_85739 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85747 - BLOCK
      ?auto_85748 - BLOCK
      ?auto_85749 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_85749 ) ( CLEAR ?auto_85748 ) ( ON-TABLE ?auto_85747 ) ( ON ?auto_85748 ?auto_85747 ) ( not ( = ?auto_85747 ?auto_85748 ) ) ( not ( = ?auto_85747 ?auto_85749 ) ) ( not ( = ?auto_85748 ?auto_85749 ) ) )
    :subtasks
    ( ( !STACK ?auto_85749 ?auto_85748 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85750 - BLOCK
      ?auto_85751 - BLOCK
      ?auto_85752 - BLOCK
    )
    :vars
    (
      ?auto_85753 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_85751 ) ( ON-TABLE ?auto_85750 ) ( ON ?auto_85751 ?auto_85750 ) ( not ( = ?auto_85750 ?auto_85751 ) ) ( not ( = ?auto_85750 ?auto_85752 ) ) ( not ( = ?auto_85751 ?auto_85752 ) ) ( ON ?auto_85752 ?auto_85753 ) ( CLEAR ?auto_85752 ) ( HAND-EMPTY ) ( not ( = ?auto_85750 ?auto_85753 ) ) ( not ( = ?auto_85751 ?auto_85753 ) ) ( not ( = ?auto_85752 ?auto_85753 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_85752 ?auto_85753 )
      ( MAKE-3PILE ?auto_85750 ?auto_85751 ?auto_85752 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85754 - BLOCK
      ?auto_85755 - BLOCK
      ?auto_85756 - BLOCK
    )
    :vars
    (
      ?auto_85757 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85754 ) ( not ( = ?auto_85754 ?auto_85755 ) ) ( not ( = ?auto_85754 ?auto_85756 ) ) ( not ( = ?auto_85755 ?auto_85756 ) ) ( ON ?auto_85756 ?auto_85757 ) ( CLEAR ?auto_85756 ) ( not ( = ?auto_85754 ?auto_85757 ) ) ( not ( = ?auto_85755 ?auto_85757 ) ) ( not ( = ?auto_85756 ?auto_85757 ) ) ( HOLDING ?auto_85755 ) ( CLEAR ?auto_85754 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_85754 ?auto_85755 )
      ( MAKE-3PILE ?auto_85754 ?auto_85755 ?auto_85756 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85758 - BLOCK
      ?auto_85759 - BLOCK
      ?auto_85760 - BLOCK
    )
    :vars
    (
      ?auto_85761 - BLOCK
      ?auto_85763 - BLOCK
      ?auto_85764 - BLOCK
      ?auto_85762 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85758 ) ( not ( = ?auto_85758 ?auto_85759 ) ) ( not ( = ?auto_85758 ?auto_85760 ) ) ( not ( = ?auto_85759 ?auto_85760 ) ) ( ON ?auto_85760 ?auto_85761 ) ( not ( = ?auto_85758 ?auto_85761 ) ) ( not ( = ?auto_85759 ?auto_85761 ) ) ( not ( = ?auto_85760 ?auto_85761 ) ) ( CLEAR ?auto_85758 ) ( ON ?auto_85759 ?auto_85760 ) ( CLEAR ?auto_85759 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_85763 ) ( ON ?auto_85764 ?auto_85763 ) ( ON ?auto_85762 ?auto_85764 ) ( ON ?auto_85761 ?auto_85762 ) ( not ( = ?auto_85763 ?auto_85764 ) ) ( not ( = ?auto_85763 ?auto_85762 ) ) ( not ( = ?auto_85763 ?auto_85761 ) ) ( not ( = ?auto_85763 ?auto_85760 ) ) ( not ( = ?auto_85763 ?auto_85759 ) ) ( not ( = ?auto_85764 ?auto_85762 ) ) ( not ( = ?auto_85764 ?auto_85761 ) ) ( not ( = ?auto_85764 ?auto_85760 ) ) ( not ( = ?auto_85764 ?auto_85759 ) ) ( not ( = ?auto_85762 ?auto_85761 ) ) ( not ( = ?auto_85762 ?auto_85760 ) ) ( not ( = ?auto_85762 ?auto_85759 ) ) ( not ( = ?auto_85758 ?auto_85763 ) ) ( not ( = ?auto_85758 ?auto_85764 ) ) ( not ( = ?auto_85758 ?auto_85762 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_85763 ?auto_85764 ?auto_85762 ?auto_85761 ?auto_85760 )
      ( MAKE-3PILE ?auto_85758 ?auto_85759 ?auto_85760 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85765 - BLOCK
      ?auto_85766 - BLOCK
      ?auto_85767 - BLOCK
    )
    :vars
    (
      ?auto_85770 - BLOCK
      ?auto_85768 - BLOCK
      ?auto_85769 - BLOCK
      ?auto_85771 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85765 ?auto_85766 ) ) ( not ( = ?auto_85765 ?auto_85767 ) ) ( not ( = ?auto_85766 ?auto_85767 ) ) ( ON ?auto_85767 ?auto_85770 ) ( not ( = ?auto_85765 ?auto_85770 ) ) ( not ( = ?auto_85766 ?auto_85770 ) ) ( not ( = ?auto_85767 ?auto_85770 ) ) ( ON ?auto_85766 ?auto_85767 ) ( CLEAR ?auto_85766 ) ( ON-TABLE ?auto_85768 ) ( ON ?auto_85769 ?auto_85768 ) ( ON ?auto_85771 ?auto_85769 ) ( ON ?auto_85770 ?auto_85771 ) ( not ( = ?auto_85768 ?auto_85769 ) ) ( not ( = ?auto_85768 ?auto_85771 ) ) ( not ( = ?auto_85768 ?auto_85770 ) ) ( not ( = ?auto_85768 ?auto_85767 ) ) ( not ( = ?auto_85768 ?auto_85766 ) ) ( not ( = ?auto_85769 ?auto_85771 ) ) ( not ( = ?auto_85769 ?auto_85770 ) ) ( not ( = ?auto_85769 ?auto_85767 ) ) ( not ( = ?auto_85769 ?auto_85766 ) ) ( not ( = ?auto_85771 ?auto_85770 ) ) ( not ( = ?auto_85771 ?auto_85767 ) ) ( not ( = ?auto_85771 ?auto_85766 ) ) ( not ( = ?auto_85765 ?auto_85768 ) ) ( not ( = ?auto_85765 ?auto_85769 ) ) ( not ( = ?auto_85765 ?auto_85771 ) ) ( HOLDING ?auto_85765 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_85765 )
      ( MAKE-3PILE ?auto_85765 ?auto_85766 ?auto_85767 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85772 - BLOCK
      ?auto_85773 - BLOCK
      ?auto_85774 - BLOCK
    )
    :vars
    (
      ?auto_85775 - BLOCK
      ?auto_85778 - BLOCK
      ?auto_85777 - BLOCK
      ?auto_85776 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85772 ?auto_85773 ) ) ( not ( = ?auto_85772 ?auto_85774 ) ) ( not ( = ?auto_85773 ?auto_85774 ) ) ( ON ?auto_85774 ?auto_85775 ) ( not ( = ?auto_85772 ?auto_85775 ) ) ( not ( = ?auto_85773 ?auto_85775 ) ) ( not ( = ?auto_85774 ?auto_85775 ) ) ( ON ?auto_85773 ?auto_85774 ) ( ON-TABLE ?auto_85778 ) ( ON ?auto_85777 ?auto_85778 ) ( ON ?auto_85776 ?auto_85777 ) ( ON ?auto_85775 ?auto_85776 ) ( not ( = ?auto_85778 ?auto_85777 ) ) ( not ( = ?auto_85778 ?auto_85776 ) ) ( not ( = ?auto_85778 ?auto_85775 ) ) ( not ( = ?auto_85778 ?auto_85774 ) ) ( not ( = ?auto_85778 ?auto_85773 ) ) ( not ( = ?auto_85777 ?auto_85776 ) ) ( not ( = ?auto_85777 ?auto_85775 ) ) ( not ( = ?auto_85777 ?auto_85774 ) ) ( not ( = ?auto_85777 ?auto_85773 ) ) ( not ( = ?auto_85776 ?auto_85775 ) ) ( not ( = ?auto_85776 ?auto_85774 ) ) ( not ( = ?auto_85776 ?auto_85773 ) ) ( not ( = ?auto_85772 ?auto_85778 ) ) ( not ( = ?auto_85772 ?auto_85777 ) ) ( not ( = ?auto_85772 ?auto_85776 ) ) ( ON ?auto_85772 ?auto_85773 ) ( CLEAR ?auto_85772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85778 ?auto_85777 ?auto_85776 ?auto_85775 ?auto_85774 ?auto_85773 )
      ( MAKE-3PILE ?auto_85772 ?auto_85773 ?auto_85774 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85779 - BLOCK
      ?auto_85780 - BLOCK
      ?auto_85781 - BLOCK
    )
    :vars
    (
      ?auto_85785 - BLOCK
      ?auto_85783 - BLOCK
      ?auto_85784 - BLOCK
      ?auto_85782 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85779 ?auto_85780 ) ) ( not ( = ?auto_85779 ?auto_85781 ) ) ( not ( = ?auto_85780 ?auto_85781 ) ) ( ON ?auto_85781 ?auto_85785 ) ( not ( = ?auto_85779 ?auto_85785 ) ) ( not ( = ?auto_85780 ?auto_85785 ) ) ( not ( = ?auto_85781 ?auto_85785 ) ) ( ON ?auto_85780 ?auto_85781 ) ( ON-TABLE ?auto_85783 ) ( ON ?auto_85784 ?auto_85783 ) ( ON ?auto_85782 ?auto_85784 ) ( ON ?auto_85785 ?auto_85782 ) ( not ( = ?auto_85783 ?auto_85784 ) ) ( not ( = ?auto_85783 ?auto_85782 ) ) ( not ( = ?auto_85783 ?auto_85785 ) ) ( not ( = ?auto_85783 ?auto_85781 ) ) ( not ( = ?auto_85783 ?auto_85780 ) ) ( not ( = ?auto_85784 ?auto_85782 ) ) ( not ( = ?auto_85784 ?auto_85785 ) ) ( not ( = ?auto_85784 ?auto_85781 ) ) ( not ( = ?auto_85784 ?auto_85780 ) ) ( not ( = ?auto_85782 ?auto_85785 ) ) ( not ( = ?auto_85782 ?auto_85781 ) ) ( not ( = ?auto_85782 ?auto_85780 ) ) ( not ( = ?auto_85779 ?auto_85783 ) ) ( not ( = ?auto_85779 ?auto_85784 ) ) ( not ( = ?auto_85779 ?auto_85782 ) ) ( HOLDING ?auto_85779 ) ( CLEAR ?auto_85780 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_85783 ?auto_85784 ?auto_85782 ?auto_85785 ?auto_85781 ?auto_85780 ?auto_85779 )
      ( MAKE-3PILE ?auto_85779 ?auto_85780 ?auto_85781 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85786 - BLOCK
      ?auto_85787 - BLOCK
      ?auto_85788 - BLOCK
    )
    :vars
    (
      ?auto_85791 - BLOCK
      ?auto_85790 - BLOCK
      ?auto_85789 - BLOCK
      ?auto_85792 - BLOCK
      ?auto_85793 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85786 ?auto_85787 ) ) ( not ( = ?auto_85786 ?auto_85788 ) ) ( not ( = ?auto_85787 ?auto_85788 ) ) ( ON ?auto_85788 ?auto_85791 ) ( not ( = ?auto_85786 ?auto_85791 ) ) ( not ( = ?auto_85787 ?auto_85791 ) ) ( not ( = ?auto_85788 ?auto_85791 ) ) ( ON ?auto_85787 ?auto_85788 ) ( ON-TABLE ?auto_85790 ) ( ON ?auto_85789 ?auto_85790 ) ( ON ?auto_85792 ?auto_85789 ) ( ON ?auto_85791 ?auto_85792 ) ( not ( = ?auto_85790 ?auto_85789 ) ) ( not ( = ?auto_85790 ?auto_85792 ) ) ( not ( = ?auto_85790 ?auto_85791 ) ) ( not ( = ?auto_85790 ?auto_85788 ) ) ( not ( = ?auto_85790 ?auto_85787 ) ) ( not ( = ?auto_85789 ?auto_85792 ) ) ( not ( = ?auto_85789 ?auto_85791 ) ) ( not ( = ?auto_85789 ?auto_85788 ) ) ( not ( = ?auto_85789 ?auto_85787 ) ) ( not ( = ?auto_85792 ?auto_85791 ) ) ( not ( = ?auto_85792 ?auto_85788 ) ) ( not ( = ?auto_85792 ?auto_85787 ) ) ( not ( = ?auto_85786 ?auto_85790 ) ) ( not ( = ?auto_85786 ?auto_85789 ) ) ( not ( = ?auto_85786 ?auto_85792 ) ) ( CLEAR ?auto_85787 ) ( ON ?auto_85786 ?auto_85793 ) ( CLEAR ?auto_85786 ) ( HAND-EMPTY ) ( not ( = ?auto_85786 ?auto_85793 ) ) ( not ( = ?auto_85787 ?auto_85793 ) ) ( not ( = ?auto_85788 ?auto_85793 ) ) ( not ( = ?auto_85791 ?auto_85793 ) ) ( not ( = ?auto_85790 ?auto_85793 ) ) ( not ( = ?auto_85789 ?auto_85793 ) ) ( not ( = ?auto_85792 ?auto_85793 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_85786 ?auto_85793 )
      ( MAKE-3PILE ?auto_85786 ?auto_85787 ?auto_85788 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85794 - BLOCK
      ?auto_85795 - BLOCK
      ?auto_85796 - BLOCK
    )
    :vars
    (
      ?auto_85798 - BLOCK
      ?auto_85799 - BLOCK
      ?auto_85800 - BLOCK
      ?auto_85801 - BLOCK
      ?auto_85797 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85794 ?auto_85795 ) ) ( not ( = ?auto_85794 ?auto_85796 ) ) ( not ( = ?auto_85795 ?auto_85796 ) ) ( ON ?auto_85796 ?auto_85798 ) ( not ( = ?auto_85794 ?auto_85798 ) ) ( not ( = ?auto_85795 ?auto_85798 ) ) ( not ( = ?auto_85796 ?auto_85798 ) ) ( ON-TABLE ?auto_85799 ) ( ON ?auto_85800 ?auto_85799 ) ( ON ?auto_85801 ?auto_85800 ) ( ON ?auto_85798 ?auto_85801 ) ( not ( = ?auto_85799 ?auto_85800 ) ) ( not ( = ?auto_85799 ?auto_85801 ) ) ( not ( = ?auto_85799 ?auto_85798 ) ) ( not ( = ?auto_85799 ?auto_85796 ) ) ( not ( = ?auto_85799 ?auto_85795 ) ) ( not ( = ?auto_85800 ?auto_85801 ) ) ( not ( = ?auto_85800 ?auto_85798 ) ) ( not ( = ?auto_85800 ?auto_85796 ) ) ( not ( = ?auto_85800 ?auto_85795 ) ) ( not ( = ?auto_85801 ?auto_85798 ) ) ( not ( = ?auto_85801 ?auto_85796 ) ) ( not ( = ?auto_85801 ?auto_85795 ) ) ( not ( = ?auto_85794 ?auto_85799 ) ) ( not ( = ?auto_85794 ?auto_85800 ) ) ( not ( = ?auto_85794 ?auto_85801 ) ) ( ON ?auto_85794 ?auto_85797 ) ( CLEAR ?auto_85794 ) ( not ( = ?auto_85794 ?auto_85797 ) ) ( not ( = ?auto_85795 ?auto_85797 ) ) ( not ( = ?auto_85796 ?auto_85797 ) ) ( not ( = ?auto_85798 ?auto_85797 ) ) ( not ( = ?auto_85799 ?auto_85797 ) ) ( not ( = ?auto_85800 ?auto_85797 ) ) ( not ( = ?auto_85801 ?auto_85797 ) ) ( HOLDING ?auto_85795 ) ( CLEAR ?auto_85796 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85799 ?auto_85800 ?auto_85801 ?auto_85798 ?auto_85796 ?auto_85795 )
      ( MAKE-3PILE ?auto_85794 ?auto_85795 ?auto_85796 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85802 - BLOCK
      ?auto_85803 - BLOCK
      ?auto_85804 - BLOCK
    )
    :vars
    (
      ?auto_85809 - BLOCK
      ?auto_85805 - BLOCK
      ?auto_85808 - BLOCK
      ?auto_85807 - BLOCK
      ?auto_85806 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85802 ?auto_85803 ) ) ( not ( = ?auto_85802 ?auto_85804 ) ) ( not ( = ?auto_85803 ?auto_85804 ) ) ( ON ?auto_85804 ?auto_85809 ) ( not ( = ?auto_85802 ?auto_85809 ) ) ( not ( = ?auto_85803 ?auto_85809 ) ) ( not ( = ?auto_85804 ?auto_85809 ) ) ( ON-TABLE ?auto_85805 ) ( ON ?auto_85808 ?auto_85805 ) ( ON ?auto_85807 ?auto_85808 ) ( ON ?auto_85809 ?auto_85807 ) ( not ( = ?auto_85805 ?auto_85808 ) ) ( not ( = ?auto_85805 ?auto_85807 ) ) ( not ( = ?auto_85805 ?auto_85809 ) ) ( not ( = ?auto_85805 ?auto_85804 ) ) ( not ( = ?auto_85805 ?auto_85803 ) ) ( not ( = ?auto_85808 ?auto_85807 ) ) ( not ( = ?auto_85808 ?auto_85809 ) ) ( not ( = ?auto_85808 ?auto_85804 ) ) ( not ( = ?auto_85808 ?auto_85803 ) ) ( not ( = ?auto_85807 ?auto_85809 ) ) ( not ( = ?auto_85807 ?auto_85804 ) ) ( not ( = ?auto_85807 ?auto_85803 ) ) ( not ( = ?auto_85802 ?auto_85805 ) ) ( not ( = ?auto_85802 ?auto_85808 ) ) ( not ( = ?auto_85802 ?auto_85807 ) ) ( ON ?auto_85802 ?auto_85806 ) ( not ( = ?auto_85802 ?auto_85806 ) ) ( not ( = ?auto_85803 ?auto_85806 ) ) ( not ( = ?auto_85804 ?auto_85806 ) ) ( not ( = ?auto_85809 ?auto_85806 ) ) ( not ( = ?auto_85805 ?auto_85806 ) ) ( not ( = ?auto_85808 ?auto_85806 ) ) ( not ( = ?auto_85807 ?auto_85806 ) ) ( CLEAR ?auto_85804 ) ( ON ?auto_85803 ?auto_85802 ) ( CLEAR ?auto_85803 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_85806 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_85806 ?auto_85802 )
      ( MAKE-3PILE ?auto_85802 ?auto_85803 ?auto_85804 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85810 - BLOCK
      ?auto_85811 - BLOCK
      ?auto_85812 - BLOCK
    )
    :vars
    (
      ?auto_85814 - BLOCK
      ?auto_85813 - BLOCK
      ?auto_85815 - BLOCK
      ?auto_85817 - BLOCK
      ?auto_85816 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85810 ?auto_85811 ) ) ( not ( = ?auto_85810 ?auto_85812 ) ) ( not ( = ?auto_85811 ?auto_85812 ) ) ( not ( = ?auto_85810 ?auto_85814 ) ) ( not ( = ?auto_85811 ?auto_85814 ) ) ( not ( = ?auto_85812 ?auto_85814 ) ) ( ON-TABLE ?auto_85813 ) ( ON ?auto_85815 ?auto_85813 ) ( ON ?auto_85817 ?auto_85815 ) ( ON ?auto_85814 ?auto_85817 ) ( not ( = ?auto_85813 ?auto_85815 ) ) ( not ( = ?auto_85813 ?auto_85817 ) ) ( not ( = ?auto_85813 ?auto_85814 ) ) ( not ( = ?auto_85813 ?auto_85812 ) ) ( not ( = ?auto_85813 ?auto_85811 ) ) ( not ( = ?auto_85815 ?auto_85817 ) ) ( not ( = ?auto_85815 ?auto_85814 ) ) ( not ( = ?auto_85815 ?auto_85812 ) ) ( not ( = ?auto_85815 ?auto_85811 ) ) ( not ( = ?auto_85817 ?auto_85814 ) ) ( not ( = ?auto_85817 ?auto_85812 ) ) ( not ( = ?auto_85817 ?auto_85811 ) ) ( not ( = ?auto_85810 ?auto_85813 ) ) ( not ( = ?auto_85810 ?auto_85815 ) ) ( not ( = ?auto_85810 ?auto_85817 ) ) ( ON ?auto_85810 ?auto_85816 ) ( not ( = ?auto_85810 ?auto_85816 ) ) ( not ( = ?auto_85811 ?auto_85816 ) ) ( not ( = ?auto_85812 ?auto_85816 ) ) ( not ( = ?auto_85814 ?auto_85816 ) ) ( not ( = ?auto_85813 ?auto_85816 ) ) ( not ( = ?auto_85815 ?auto_85816 ) ) ( not ( = ?auto_85817 ?auto_85816 ) ) ( ON ?auto_85811 ?auto_85810 ) ( CLEAR ?auto_85811 ) ( ON-TABLE ?auto_85816 ) ( HOLDING ?auto_85812 ) ( CLEAR ?auto_85814 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_85813 ?auto_85815 ?auto_85817 ?auto_85814 ?auto_85812 )
      ( MAKE-3PILE ?auto_85810 ?auto_85811 ?auto_85812 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85818 - BLOCK
      ?auto_85819 - BLOCK
      ?auto_85820 - BLOCK
    )
    :vars
    (
      ?auto_85821 - BLOCK
      ?auto_85822 - BLOCK
      ?auto_85825 - BLOCK
      ?auto_85824 - BLOCK
      ?auto_85823 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85818 ?auto_85819 ) ) ( not ( = ?auto_85818 ?auto_85820 ) ) ( not ( = ?auto_85819 ?auto_85820 ) ) ( not ( = ?auto_85818 ?auto_85821 ) ) ( not ( = ?auto_85819 ?auto_85821 ) ) ( not ( = ?auto_85820 ?auto_85821 ) ) ( ON-TABLE ?auto_85822 ) ( ON ?auto_85825 ?auto_85822 ) ( ON ?auto_85824 ?auto_85825 ) ( ON ?auto_85821 ?auto_85824 ) ( not ( = ?auto_85822 ?auto_85825 ) ) ( not ( = ?auto_85822 ?auto_85824 ) ) ( not ( = ?auto_85822 ?auto_85821 ) ) ( not ( = ?auto_85822 ?auto_85820 ) ) ( not ( = ?auto_85822 ?auto_85819 ) ) ( not ( = ?auto_85825 ?auto_85824 ) ) ( not ( = ?auto_85825 ?auto_85821 ) ) ( not ( = ?auto_85825 ?auto_85820 ) ) ( not ( = ?auto_85825 ?auto_85819 ) ) ( not ( = ?auto_85824 ?auto_85821 ) ) ( not ( = ?auto_85824 ?auto_85820 ) ) ( not ( = ?auto_85824 ?auto_85819 ) ) ( not ( = ?auto_85818 ?auto_85822 ) ) ( not ( = ?auto_85818 ?auto_85825 ) ) ( not ( = ?auto_85818 ?auto_85824 ) ) ( ON ?auto_85818 ?auto_85823 ) ( not ( = ?auto_85818 ?auto_85823 ) ) ( not ( = ?auto_85819 ?auto_85823 ) ) ( not ( = ?auto_85820 ?auto_85823 ) ) ( not ( = ?auto_85821 ?auto_85823 ) ) ( not ( = ?auto_85822 ?auto_85823 ) ) ( not ( = ?auto_85825 ?auto_85823 ) ) ( not ( = ?auto_85824 ?auto_85823 ) ) ( ON ?auto_85819 ?auto_85818 ) ( ON-TABLE ?auto_85823 ) ( CLEAR ?auto_85821 ) ( ON ?auto_85820 ?auto_85819 ) ( CLEAR ?auto_85820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_85823 ?auto_85818 ?auto_85819 )
      ( MAKE-3PILE ?auto_85818 ?auto_85819 ?auto_85820 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85826 - BLOCK
      ?auto_85827 - BLOCK
      ?auto_85828 - BLOCK
    )
    :vars
    (
      ?auto_85831 - BLOCK
      ?auto_85829 - BLOCK
      ?auto_85832 - BLOCK
      ?auto_85830 - BLOCK
      ?auto_85833 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85826 ?auto_85827 ) ) ( not ( = ?auto_85826 ?auto_85828 ) ) ( not ( = ?auto_85827 ?auto_85828 ) ) ( not ( = ?auto_85826 ?auto_85831 ) ) ( not ( = ?auto_85827 ?auto_85831 ) ) ( not ( = ?auto_85828 ?auto_85831 ) ) ( ON-TABLE ?auto_85829 ) ( ON ?auto_85832 ?auto_85829 ) ( ON ?auto_85830 ?auto_85832 ) ( not ( = ?auto_85829 ?auto_85832 ) ) ( not ( = ?auto_85829 ?auto_85830 ) ) ( not ( = ?auto_85829 ?auto_85831 ) ) ( not ( = ?auto_85829 ?auto_85828 ) ) ( not ( = ?auto_85829 ?auto_85827 ) ) ( not ( = ?auto_85832 ?auto_85830 ) ) ( not ( = ?auto_85832 ?auto_85831 ) ) ( not ( = ?auto_85832 ?auto_85828 ) ) ( not ( = ?auto_85832 ?auto_85827 ) ) ( not ( = ?auto_85830 ?auto_85831 ) ) ( not ( = ?auto_85830 ?auto_85828 ) ) ( not ( = ?auto_85830 ?auto_85827 ) ) ( not ( = ?auto_85826 ?auto_85829 ) ) ( not ( = ?auto_85826 ?auto_85832 ) ) ( not ( = ?auto_85826 ?auto_85830 ) ) ( ON ?auto_85826 ?auto_85833 ) ( not ( = ?auto_85826 ?auto_85833 ) ) ( not ( = ?auto_85827 ?auto_85833 ) ) ( not ( = ?auto_85828 ?auto_85833 ) ) ( not ( = ?auto_85831 ?auto_85833 ) ) ( not ( = ?auto_85829 ?auto_85833 ) ) ( not ( = ?auto_85832 ?auto_85833 ) ) ( not ( = ?auto_85830 ?auto_85833 ) ) ( ON ?auto_85827 ?auto_85826 ) ( ON-TABLE ?auto_85833 ) ( ON ?auto_85828 ?auto_85827 ) ( CLEAR ?auto_85828 ) ( HOLDING ?auto_85831 ) ( CLEAR ?auto_85830 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_85829 ?auto_85832 ?auto_85830 ?auto_85831 )
      ( MAKE-3PILE ?auto_85826 ?auto_85827 ?auto_85828 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85834 - BLOCK
      ?auto_85835 - BLOCK
      ?auto_85836 - BLOCK
    )
    :vars
    (
      ?auto_85841 - BLOCK
      ?auto_85837 - BLOCK
      ?auto_85840 - BLOCK
      ?auto_85838 - BLOCK
      ?auto_85839 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85834 ?auto_85835 ) ) ( not ( = ?auto_85834 ?auto_85836 ) ) ( not ( = ?auto_85835 ?auto_85836 ) ) ( not ( = ?auto_85834 ?auto_85841 ) ) ( not ( = ?auto_85835 ?auto_85841 ) ) ( not ( = ?auto_85836 ?auto_85841 ) ) ( ON-TABLE ?auto_85837 ) ( ON ?auto_85840 ?auto_85837 ) ( ON ?auto_85838 ?auto_85840 ) ( not ( = ?auto_85837 ?auto_85840 ) ) ( not ( = ?auto_85837 ?auto_85838 ) ) ( not ( = ?auto_85837 ?auto_85841 ) ) ( not ( = ?auto_85837 ?auto_85836 ) ) ( not ( = ?auto_85837 ?auto_85835 ) ) ( not ( = ?auto_85840 ?auto_85838 ) ) ( not ( = ?auto_85840 ?auto_85841 ) ) ( not ( = ?auto_85840 ?auto_85836 ) ) ( not ( = ?auto_85840 ?auto_85835 ) ) ( not ( = ?auto_85838 ?auto_85841 ) ) ( not ( = ?auto_85838 ?auto_85836 ) ) ( not ( = ?auto_85838 ?auto_85835 ) ) ( not ( = ?auto_85834 ?auto_85837 ) ) ( not ( = ?auto_85834 ?auto_85840 ) ) ( not ( = ?auto_85834 ?auto_85838 ) ) ( ON ?auto_85834 ?auto_85839 ) ( not ( = ?auto_85834 ?auto_85839 ) ) ( not ( = ?auto_85835 ?auto_85839 ) ) ( not ( = ?auto_85836 ?auto_85839 ) ) ( not ( = ?auto_85841 ?auto_85839 ) ) ( not ( = ?auto_85837 ?auto_85839 ) ) ( not ( = ?auto_85840 ?auto_85839 ) ) ( not ( = ?auto_85838 ?auto_85839 ) ) ( ON ?auto_85835 ?auto_85834 ) ( ON-TABLE ?auto_85839 ) ( ON ?auto_85836 ?auto_85835 ) ( CLEAR ?auto_85838 ) ( ON ?auto_85841 ?auto_85836 ) ( CLEAR ?auto_85841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_85839 ?auto_85834 ?auto_85835 ?auto_85836 )
      ( MAKE-3PILE ?auto_85834 ?auto_85835 ?auto_85836 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85842 - BLOCK
      ?auto_85843 - BLOCK
      ?auto_85844 - BLOCK
    )
    :vars
    (
      ?auto_85849 - BLOCK
      ?auto_85847 - BLOCK
      ?auto_85846 - BLOCK
      ?auto_85848 - BLOCK
      ?auto_85845 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85842 ?auto_85843 ) ) ( not ( = ?auto_85842 ?auto_85844 ) ) ( not ( = ?auto_85843 ?auto_85844 ) ) ( not ( = ?auto_85842 ?auto_85849 ) ) ( not ( = ?auto_85843 ?auto_85849 ) ) ( not ( = ?auto_85844 ?auto_85849 ) ) ( ON-TABLE ?auto_85847 ) ( ON ?auto_85846 ?auto_85847 ) ( not ( = ?auto_85847 ?auto_85846 ) ) ( not ( = ?auto_85847 ?auto_85848 ) ) ( not ( = ?auto_85847 ?auto_85849 ) ) ( not ( = ?auto_85847 ?auto_85844 ) ) ( not ( = ?auto_85847 ?auto_85843 ) ) ( not ( = ?auto_85846 ?auto_85848 ) ) ( not ( = ?auto_85846 ?auto_85849 ) ) ( not ( = ?auto_85846 ?auto_85844 ) ) ( not ( = ?auto_85846 ?auto_85843 ) ) ( not ( = ?auto_85848 ?auto_85849 ) ) ( not ( = ?auto_85848 ?auto_85844 ) ) ( not ( = ?auto_85848 ?auto_85843 ) ) ( not ( = ?auto_85842 ?auto_85847 ) ) ( not ( = ?auto_85842 ?auto_85846 ) ) ( not ( = ?auto_85842 ?auto_85848 ) ) ( ON ?auto_85842 ?auto_85845 ) ( not ( = ?auto_85842 ?auto_85845 ) ) ( not ( = ?auto_85843 ?auto_85845 ) ) ( not ( = ?auto_85844 ?auto_85845 ) ) ( not ( = ?auto_85849 ?auto_85845 ) ) ( not ( = ?auto_85847 ?auto_85845 ) ) ( not ( = ?auto_85846 ?auto_85845 ) ) ( not ( = ?auto_85848 ?auto_85845 ) ) ( ON ?auto_85843 ?auto_85842 ) ( ON-TABLE ?auto_85845 ) ( ON ?auto_85844 ?auto_85843 ) ( ON ?auto_85849 ?auto_85844 ) ( CLEAR ?auto_85849 ) ( HOLDING ?auto_85848 ) ( CLEAR ?auto_85846 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_85847 ?auto_85846 ?auto_85848 )
      ( MAKE-3PILE ?auto_85842 ?auto_85843 ?auto_85844 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85850 - BLOCK
      ?auto_85851 - BLOCK
      ?auto_85852 - BLOCK
    )
    :vars
    (
      ?auto_85855 - BLOCK
      ?auto_85856 - BLOCK
      ?auto_85853 - BLOCK
      ?auto_85854 - BLOCK
      ?auto_85857 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85850 ?auto_85851 ) ) ( not ( = ?auto_85850 ?auto_85852 ) ) ( not ( = ?auto_85851 ?auto_85852 ) ) ( not ( = ?auto_85850 ?auto_85855 ) ) ( not ( = ?auto_85851 ?auto_85855 ) ) ( not ( = ?auto_85852 ?auto_85855 ) ) ( ON-TABLE ?auto_85856 ) ( ON ?auto_85853 ?auto_85856 ) ( not ( = ?auto_85856 ?auto_85853 ) ) ( not ( = ?auto_85856 ?auto_85854 ) ) ( not ( = ?auto_85856 ?auto_85855 ) ) ( not ( = ?auto_85856 ?auto_85852 ) ) ( not ( = ?auto_85856 ?auto_85851 ) ) ( not ( = ?auto_85853 ?auto_85854 ) ) ( not ( = ?auto_85853 ?auto_85855 ) ) ( not ( = ?auto_85853 ?auto_85852 ) ) ( not ( = ?auto_85853 ?auto_85851 ) ) ( not ( = ?auto_85854 ?auto_85855 ) ) ( not ( = ?auto_85854 ?auto_85852 ) ) ( not ( = ?auto_85854 ?auto_85851 ) ) ( not ( = ?auto_85850 ?auto_85856 ) ) ( not ( = ?auto_85850 ?auto_85853 ) ) ( not ( = ?auto_85850 ?auto_85854 ) ) ( ON ?auto_85850 ?auto_85857 ) ( not ( = ?auto_85850 ?auto_85857 ) ) ( not ( = ?auto_85851 ?auto_85857 ) ) ( not ( = ?auto_85852 ?auto_85857 ) ) ( not ( = ?auto_85855 ?auto_85857 ) ) ( not ( = ?auto_85856 ?auto_85857 ) ) ( not ( = ?auto_85853 ?auto_85857 ) ) ( not ( = ?auto_85854 ?auto_85857 ) ) ( ON ?auto_85851 ?auto_85850 ) ( ON-TABLE ?auto_85857 ) ( ON ?auto_85852 ?auto_85851 ) ( ON ?auto_85855 ?auto_85852 ) ( CLEAR ?auto_85853 ) ( ON ?auto_85854 ?auto_85855 ) ( CLEAR ?auto_85854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_85857 ?auto_85850 ?auto_85851 ?auto_85852 ?auto_85855 )
      ( MAKE-3PILE ?auto_85850 ?auto_85851 ?auto_85852 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85858 - BLOCK
      ?auto_85859 - BLOCK
      ?auto_85860 - BLOCK
    )
    :vars
    (
      ?auto_85861 - BLOCK
      ?auto_85865 - BLOCK
      ?auto_85864 - BLOCK
      ?auto_85863 - BLOCK
      ?auto_85862 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85858 ?auto_85859 ) ) ( not ( = ?auto_85858 ?auto_85860 ) ) ( not ( = ?auto_85859 ?auto_85860 ) ) ( not ( = ?auto_85858 ?auto_85861 ) ) ( not ( = ?auto_85859 ?auto_85861 ) ) ( not ( = ?auto_85860 ?auto_85861 ) ) ( ON-TABLE ?auto_85865 ) ( not ( = ?auto_85865 ?auto_85864 ) ) ( not ( = ?auto_85865 ?auto_85863 ) ) ( not ( = ?auto_85865 ?auto_85861 ) ) ( not ( = ?auto_85865 ?auto_85860 ) ) ( not ( = ?auto_85865 ?auto_85859 ) ) ( not ( = ?auto_85864 ?auto_85863 ) ) ( not ( = ?auto_85864 ?auto_85861 ) ) ( not ( = ?auto_85864 ?auto_85860 ) ) ( not ( = ?auto_85864 ?auto_85859 ) ) ( not ( = ?auto_85863 ?auto_85861 ) ) ( not ( = ?auto_85863 ?auto_85860 ) ) ( not ( = ?auto_85863 ?auto_85859 ) ) ( not ( = ?auto_85858 ?auto_85865 ) ) ( not ( = ?auto_85858 ?auto_85864 ) ) ( not ( = ?auto_85858 ?auto_85863 ) ) ( ON ?auto_85858 ?auto_85862 ) ( not ( = ?auto_85858 ?auto_85862 ) ) ( not ( = ?auto_85859 ?auto_85862 ) ) ( not ( = ?auto_85860 ?auto_85862 ) ) ( not ( = ?auto_85861 ?auto_85862 ) ) ( not ( = ?auto_85865 ?auto_85862 ) ) ( not ( = ?auto_85864 ?auto_85862 ) ) ( not ( = ?auto_85863 ?auto_85862 ) ) ( ON ?auto_85859 ?auto_85858 ) ( ON-TABLE ?auto_85862 ) ( ON ?auto_85860 ?auto_85859 ) ( ON ?auto_85861 ?auto_85860 ) ( ON ?auto_85863 ?auto_85861 ) ( CLEAR ?auto_85863 ) ( HOLDING ?auto_85864 ) ( CLEAR ?auto_85865 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_85865 ?auto_85864 )
      ( MAKE-3PILE ?auto_85858 ?auto_85859 ?auto_85860 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85866 - BLOCK
      ?auto_85867 - BLOCK
      ?auto_85868 - BLOCK
    )
    :vars
    (
      ?auto_85871 - BLOCK
      ?auto_85869 - BLOCK
      ?auto_85873 - BLOCK
      ?auto_85870 - BLOCK
      ?auto_85872 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85866 ?auto_85867 ) ) ( not ( = ?auto_85866 ?auto_85868 ) ) ( not ( = ?auto_85867 ?auto_85868 ) ) ( not ( = ?auto_85866 ?auto_85871 ) ) ( not ( = ?auto_85867 ?auto_85871 ) ) ( not ( = ?auto_85868 ?auto_85871 ) ) ( ON-TABLE ?auto_85869 ) ( not ( = ?auto_85869 ?auto_85873 ) ) ( not ( = ?auto_85869 ?auto_85870 ) ) ( not ( = ?auto_85869 ?auto_85871 ) ) ( not ( = ?auto_85869 ?auto_85868 ) ) ( not ( = ?auto_85869 ?auto_85867 ) ) ( not ( = ?auto_85873 ?auto_85870 ) ) ( not ( = ?auto_85873 ?auto_85871 ) ) ( not ( = ?auto_85873 ?auto_85868 ) ) ( not ( = ?auto_85873 ?auto_85867 ) ) ( not ( = ?auto_85870 ?auto_85871 ) ) ( not ( = ?auto_85870 ?auto_85868 ) ) ( not ( = ?auto_85870 ?auto_85867 ) ) ( not ( = ?auto_85866 ?auto_85869 ) ) ( not ( = ?auto_85866 ?auto_85873 ) ) ( not ( = ?auto_85866 ?auto_85870 ) ) ( ON ?auto_85866 ?auto_85872 ) ( not ( = ?auto_85866 ?auto_85872 ) ) ( not ( = ?auto_85867 ?auto_85872 ) ) ( not ( = ?auto_85868 ?auto_85872 ) ) ( not ( = ?auto_85871 ?auto_85872 ) ) ( not ( = ?auto_85869 ?auto_85872 ) ) ( not ( = ?auto_85873 ?auto_85872 ) ) ( not ( = ?auto_85870 ?auto_85872 ) ) ( ON ?auto_85867 ?auto_85866 ) ( ON-TABLE ?auto_85872 ) ( ON ?auto_85868 ?auto_85867 ) ( ON ?auto_85871 ?auto_85868 ) ( ON ?auto_85870 ?auto_85871 ) ( CLEAR ?auto_85869 ) ( ON ?auto_85873 ?auto_85870 ) ( CLEAR ?auto_85873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85872 ?auto_85866 ?auto_85867 ?auto_85868 ?auto_85871 ?auto_85870 )
      ( MAKE-3PILE ?auto_85866 ?auto_85867 ?auto_85868 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85874 - BLOCK
      ?auto_85875 - BLOCK
      ?auto_85876 - BLOCK
    )
    :vars
    (
      ?auto_85878 - BLOCK
      ?auto_85880 - BLOCK
      ?auto_85879 - BLOCK
      ?auto_85881 - BLOCK
      ?auto_85877 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85874 ?auto_85875 ) ) ( not ( = ?auto_85874 ?auto_85876 ) ) ( not ( = ?auto_85875 ?auto_85876 ) ) ( not ( = ?auto_85874 ?auto_85878 ) ) ( not ( = ?auto_85875 ?auto_85878 ) ) ( not ( = ?auto_85876 ?auto_85878 ) ) ( not ( = ?auto_85880 ?auto_85879 ) ) ( not ( = ?auto_85880 ?auto_85881 ) ) ( not ( = ?auto_85880 ?auto_85878 ) ) ( not ( = ?auto_85880 ?auto_85876 ) ) ( not ( = ?auto_85880 ?auto_85875 ) ) ( not ( = ?auto_85879 ?auto_85881 ) ) ( not ( = ?auto_85879 ?auto_85878 ) ) ( not ( = ?auto_85879 ?auto_85876 ) ) ( not ( = ?auto_85879 ?auto_85875 ) ) ( not ( = ?auto_85881 ?auto_85878 ) ) ( not ( = ?auto_85881 ?auto_85876 ) ) ( not ( = ?auto_85881 ?auto_85875 ) ) ( not ( = ?auto_85874 ?auto_85880 ) ) ( not ( = ?auto_85874 ?auto_85879 ) ) ( not ( = ?auto_85874 ?auto_85881 ) ) ( ON ?auto_85874 ?auto_85877 ) ( not ( = ?auto_85874 ?auto_85877 ) ) ( not ( = ?auto_85875 ?auto_85877 ) ) ( not ( = ?auto_85876 ?auto_85877 ) ) ( not ( = ?auto_85878 ?auto_85877 ) ) ( not ( = ?auto_85880 ?auto_85877 ) ) ( not ( = ?auto_85879 ?auto_85877 ) ) ( not ( = ?auto_85881 ?auto_85877 ) ) ( ON ?auto_85875 ?auto_85874 ) ( ON-TABLE ?auto_85877 ) ( ON ?auto_85876 ?auto_85875 ) ( ON ?auto_85878 ?auto_85876 ) ( ON ?auto_85881 ?auto_85878 ) ( ON ?auto_85879 ?auto_85881 ) ( CLEAR ?auto_85879 ) ( HOLDING ?auto_85880 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_85880 )
      ( MAKE-3PILE ?auto_85874 ?auto_85875 ?auto_85876 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85882 - BLOCK
      ?auto_85883 - BLOCK
      ?auto_85884 - BLOCK
    )
    :vars
    (
      ?auto_85887 - BLOCK
      ?auto_85886 - BLOCK
      ?auto_85885 - BLOCK
      ?auto_85889 - BLOCK
      ?auto_85888 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85882 ?auto_85883 ) ) ( not ( = ?auto_85882 ?auto_85884 ) ) ( not ( = ?auto_85883 ?auto_85884 ) ) ( not ( = ?auto_85882 ?auto_85887 ) ) ( not ( = ?auto_85883 ?auto_85887 ) ) ( not ( = ?auto_85884 ?auto_85887 ) ) ( not ( = ?auto_85886 ?auto_85885 ) ) ( not ( = ?auto_85886 ?auto_85889 ) ) ( not ( = ?auto_85886 ?auto_85887 ) ) ( not ( = ?auto_85886 ?auto_85884 ) ) ( not ( = ?auto_85886 ?auto_85883 ) ) ( not ( = ?auto_85885 ?auto_85889 ) ) ( not ( = ?auto_85885 ?auto_85887 ) ) ( not ( = ?auto_85885 ?auto_85884 ) ) ( not ( = ?auto_85885 ?auto_85883 ) ) ( not ( = ?auto_85889 ?auto_85887 ) ) ( not ( = ?auto_85889 ?auto_85884 ) ) ( not ( = ?auto_85889 ?auto_85883 ) ) ( not ( = ?auto_85882 ?auto_85886 ) ) ( not ( = ?auto_85882 ?auto_85885 ) ) ( not ( = ?auto_85882 ?auto_85889 ) ) ( ON ?auto_85882 ?auto_85888 ) ( not ( = ?auto_85882 ?auto_85888 ) ) ( not ( = ?auto_85883 ?auto_85888 ) ) ( not ( = ?auto_85884 ?auto_85888 ) ) ( not ( = ?auto_85887 ?auto_85888 ) ) ( not ( = ?auto_85886 ?auto_85888 ) ) ( not ( = ?auto_85885 ?auto_85888 ) ) ( not ( = ?auto_85889 ?auto_85888 ) ) ( ON ?auto_85883 ?auto_85882 ) ( ON-TABLE ?auto_85888 ) ( ON ?auto_85884 ?auto_85883 ) ( ON ?auto_85887 ?auto_85884 ) ( ON ?auto_85889 ?auto_85887 ) ( ON ?auto_85885 ?auto_85889 ) ( ON ?auto_85886 ?auto_85885 ) ( CLEAR ?auto_85886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_85888 ?auto_85882 ?auto_85883 ?auto_85884 ?auto_85887 ?auto_85889 ?auto_85885 )
      ( MAKE-3PILE ?auto_85882 ?auto_85883 ?auto_85884 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85893 - BLOCK
      ?auto_85894 - BLOCK
      ?auto_85895 - BLOCK
    )
    :vars
    (
      ?auto_85896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85896 ?auto_85895 ) ( CLEAR ?auto_85896 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_85893 ) ( ON ?auto_85894 ?auto_85893 ) ( ON ?auto_85895 ?auto_85894 ) ( not ( = ?auto_85893 ?auto_85894 ) ) ( not ( = ?auto_85893 ?auto_85895 ) ) ( not ( = ?auto_85893 ?auto_85896 ) ) ( not ( = ?auto_85894 ?auto_85895 ) ) ( not ( = ?auto_85894 ?auto_85896 ) ) ( not ( = ?auto_85895 ?auto_85896 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_85896 ?auto_85895 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85897 - BLOCK
      ?auto_85898 - BLOCK
      ?auto_85899 - BLOCK
    )
    :vars
    (
      ?auto_85900 - BLOCK
      ?auto_85901 - BLOCK
      ?auto_85902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85900 ?auto_85899 ) ( CLEAR ?auto_85900 ) ( ON-TABLE ?auto_85897 ) ( ON ?auto_85898 ?auto_85897 ) ( ON ?auto_85899 ?auto_85898 ) ( not ( = ?auto_85897 ?auto_85898 ) ) ( not ( = ?auto_85897 ?auto_85899 ) ) ( not ( = ?auto_85897 ?auto_85900 ) ) ( not ( = ?auto_85898 ?auto_85899 ) ) ( not ( = ?auto_85898 ?auto_85900 ) ) ( not ( = ?auto_85899 ?auto_85900 ) ) ( HOLDING ?auto_85901 ) ( CLEAR ?auto_85902 ) ( not ( = ?auto_85897 ?auto_85901 ) ) ( not ( = ?auto_85897 ?auto_85902 ) ) ( not ( = ?auto_85898 ?auto_85901 ) ) ( not ( = ?auto_85898 ?auto_85902 ) ) ( not ( = ?auto_85899 ?auto_85901 ) ) ( not ( = ?auto_85899 ?auto_85902 ) ) ( not ( = ?auto_85900 ?auto_85901 ) ) ( not ( = ?auto_85900 ?auto_85902 ) ) ( not ( = ?auto_85901 ?auto_85902 ) ) )
    :subtasks
    ( ( !STACK ?auto_85901 ?auto_85902 )
      ( MAKE-3PILE ?auto_85897 ?auto_85898 ?auto_85899 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85903 - BLOCK
      ?auto_85904 - BLOCK
      ?auto_85905 - BLOCK
    )
    :vars
    (
      ?auto_85908 - BLOCK
      ?auto_85906 - BLOCK
      ?auto_85907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85908 ?auto_85905 ) ( ON-TABLE ?auto_85903 ) ( ON ?auto_85904 ?auto_85903 ) ( ON ?auto_85905 ?auto_85904 ) ( not ( = ?auto_85903 ?auto_85904 ) ) ( not ( = ?auto_85903 ?auto_85905 ) ) ( not ( = ?auto_85903 ?auto_85908 ) ) ( not ( = ?auto_85904 ?auto_85905 ) ) ( not ( = ?auto_85904 ?auto_85908 ) ) ( not ( = ?auto_85905 ?auto_85908 ) ) ( CLEAR ?auto_85906 ) ( not ( = ?auto_85903 ?auto_85907 ) ) ( not ( = ?auto_85903 ?auto_85906 ) ) ( not ( = ?auto_85904 ?auto_85907 ) ) ( not ( = ?auto_85904 ?auto_85906 ) ) ( not ( = ?auto_85905 ?auto_85907 ) ) ( not ( = ?auto_85905 ?auto_85906 ) ) ( not ( = ?auto_85908 ?auto_85907 ) ) ( not ( = ?auto_85908 ?auto_85906 ) ) ( not ( = ?auto_85907 ?auto_85906 ) ) ( ON ?auto_85907 ?auto_85908 ) ( CLEAR ?auto_85907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_85903 ?auto_85904 ?auto_85905 ?auto_85908 )
      ( MAKE-3PILE ?auto_85903 ?auto_85904 ?auto_85905 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85909 - BLOCK
      ?auto_85910 - BLOCK
      ?auto_85911 - BLOCK
    )
    :vars
    (
      ?auto_85914 - BLOCK
      ?auto_85913 - BLOCK
      ?auto_85912 - BLOCK
      ?auto_85915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85914 ?auto_85911 ) ( ON-TABLE ?auto_85909 ) ( ON ?auto_85910 ?auto_85909 ) ( ON ?auto_85911 ?auto_85910 ) ( not ( = ?auto_85909 ?auto_85910 ) ) ( not ( = ?auto_85909 ?auto_85911 ) ) ( not ( = ?auto_85909 ?auto_85914 ) ) ( not ( = ?auto_85910 ?auto_85911 ) ) ( not ( = ?auto_85910 ?auto_85914 ) ) ( not ( = ?auto_85911 ?auto_85914 ) ) ( not ( = ?auto_85909 ?auto_85913 ) ) ( not ( = ?auto_85909 ?auto_85912 ) ) ( not ( = ?auto_85910 ?auto_85913 ) ) ( not ( = ?auto_85910 ?auto_85912 ) ) ( not ( = ?auto_85911 ?auto_85913 ) ) ( not ( = ?auto_85911 ?auto_85912 ) ) ( not ( = ?auto_85914 ?auto_85913 ) ) ( not ( = ?auto_85914 ?auto_85912 ) ) ( not ( = ?auto_85913 ?auto_85912 ) ) ( ON ?auto_85913 ?auto_85914 ) ( CLEAR ?auto_85913 ) ( HOLDING ?auto_85912 ) ( CLEAR ?auto_85915 ) ( ON-TABLE ?auto_85915 ) ( not ( = ?auto_85915 ?auto_85912 ) ) ( not ( = ?auto_85909 ?auto_85915 ) ) ( not ( = ?auto_85910 ?auto_85915 ) ) ( not ( = ?auto_85911 ?auto_85915 ) ) ( not ( = ?auto_85914 ?auto_85915 ) ) ( not ( = ?auto_85913 ?auto_85915 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_85915 ?auto_85912 )
      ( MAKE-3PILE ?auto_85909 ?auto_85910 ?auto_85911 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85916 - BLOCK
      ?auto_85917 - BLOCK
      ?auto_85918 - BLOCK
    )
    :vars
    (
      ?auto_85922 - BLOCK
      ?auto_85921 - BLOCK
      ?auto_85920 - BLOCK
      ?auto_85919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85922 ?auto_85918 ) ( ON-TABLE ?auto_85916 ) ( ON ?auto_85917 ?auto_85916 ) ( ON ?auto_85918 ?auto_85917 ) ( not ( = ?auto_85916 ?auto_85917 ) ) ( not ( = ?auto_85916 ?auto_85918 ) ) ( not ( = ?auto_85916 ?auto_85922 ) ) ( not ( = ?auto_85917 ?auto_85918 ) ) ( not ( = ?auto_85917 ?auto_85922 ) ) ( not ( = ?auto_85918 ?auto_85922 ) ) ( not ( = ?auto_85916 ?auto_85921 ) ) ( not ( = ?auto_85916 ?auto_85920 ) ) ( not ( = ?auto_85917 ?auto_85921 ) ) ( not ( = ?auto_85917 ?auto_85920 ) ) ( not ( = ?auto_85918 ?auto_85921 ) ) ( not ( = ?auto_85918 ?auto_85920 ) ) ( not ( = ?auto_85922 ?auto_85921 ) ) ( not ( = ?auto_85922 ?auto_85920 ) ) ( not ( = ?auto_85921 ?auto_85920 ) ) ( ON ?auto_85921 ?auto_85922 ) ( CLEAR ?auto_85919 ) ( ON-TABLE ?auto_85919 ) ( not ( = ?auto_85919 ?auto_85920 ) ) ( not ( = ?auto_85916 ?auto_85919 ) ) ( not ( = ?auto_85917 ?auto_85919 ) ) ( not ( = ?auto_85918 ?auto_85919 ) ) ( not ( = ?auto_85922 ?auto_85919 ) ) ( not ( = ?auto_85921 ?auto_85919 ) ) ( ON ?auto_85920 ?auto_85921 ) ( CLEAR ?auto_85920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_85916 ?auto_85917 ?auto_85918 ?auto_85922 ?auto_85921 )
      ( MAKE-3PILE ?auto_85916 ?auto_85917 ?auto_85918 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85923 - BLOCK
      ?auto_85924 - BLOCK
      ?auto_85925 - BLOCK
    )
    :vars
    (
      ?auto_85928 - BLOCK
      ?auto_85929 - BLOCK
      ?auto_85926 - BLOCK
      ?auto_85927 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85928 ?auto_85925 ) ( ON-TABLE ?auto_85923 ) ( ON ?auto_85924 ?auto_85923 ) ( ON ?auto_85925 ?auto_85924 ) ( not ( = ?auto_85923 ?auto_85924 ) ) ( not ( = ?auto_85923 ?auto_85925 ) ) ( not ( = ?auto_85923 ?auto_85928 ) ) ( not ( = ?auto_85924 ?auto_85925 ) ) ( not ( = ?auto_85924 ?auto_85928 ) ) ( not ( = ?auto_85925 ?auto_85928 ) ) ( not ( = ?auto_85923 ?auto_85929 ) ) ( not ( = ?auto_85923 ?auto_85926 ) ) ( not ( = ?auto_85924 ?auto_85929 ) ) ( not ( = ?auto_85924 ?auto_85926 ) ) ( not ( = ?auto_85925 ?auto_85929 ) ) ( not ( = ?auto_85925 ?auto_85926 ) ) ( not ( = ?auto_85928 ?auto_85929 ) ) ( not ( = ?auto_85928 ?auto_85926 ) ) ( not ( = ?auto_85929 ?auto_85926 ) ) ( ON ?auto_85929 ?auto_85928 ) ( not ( = ?auto_85927 ?auto_85926 ) ) ( not ( = ?auto_85923 ?auto_85927 ) ) ( not ( = ?auto_85924 ?auto_85927 ) ) ( not ( = ?auto_85925 ?auto_85927 ) ) ( not ( = ?auto_85928 ?auto_85927 ) ) ( not ( = ?auto_85929 ?auto_85927 ) ) ( ON ?auto_85926 ?auto_85929 ) ( CLEAR ?auto_85926 ) ( HOLDING ?auto_85927 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_85927 )
      ( MAKE-3PILE ?auto_85923 ?auto_85924 ?auto_85925 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85930 - BLOCK
      ?auto_85931 - BLOCK
      ?auto_85932 - BLOCK
    )
    :vars
    (
      ?auto_85934 - BLOCK
      ?auto_85936 - BLOCK
      ?auto_85933 - BLOCK
      ?auto_85935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85934 ?auto_85932 ) ( ON-TABLE ?auto_85930 ) ( ON ?auto_85931 ?auto_85930 ) ( ON ?auto_85932 ?auto_85931 ) ( not ( = ?auto_85930 ?auto_85931 ) ) ( not ( = ?auto_85930 ?auto_85932 ) ) ( not ( = ?auto_85930 ?auto_85934 ) ) ( not ( = ?auto_85931 ?auto_85932 ) ) ( not ( = ?auto_85931 ?auto_85934 ) ) ( not ( = ?auto_85932 ?auto_85934 ) ) ( not ( = ?auto_85930 ?auto_85936 ) ) ( not ( = ?auto_85930 ?auto_85933 ) ) ( not ( = ?auto_85931 ?auto_85936 ) ) ( not ( = ?auto_85931 ?auto_85933 ) ) ( not ( = ?auto_85932 ?auto_85936 ) ) ( not ( = ?auto_85932 ?auto_85933 ) ) ( not ( = ?auto_85934 ?auto_85936 ) ) ( not ( = ?auto_85934 ?auto_85933 ) ) ( not ( = ?auto_85936 ?auto_85933 ) ) ( ON ?auto_85936 ?auto_85934 ) ( not ( = ?auto_85935 ?auto_85933 ) ) ( not ( = ?auto_85930 ?auto_85935 ) ) ( not ( = ?auto_85931 ?auto_85935 ) ) ( not ( = ?auto_85932 ?auto_85935 ) ) ( not ( = ?auto_85934 ?auto_85935 ) ) ( not ( = ?auto_85936 ?auto_85935 ) ) ( ON ?auto_85933 ?auto_85936 ) ( ON ?auto_85935 ?auto_85933 ) ( CLEAR ?auto_85935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85930 ?auto_85931 ?auto_85932 ?auto_85934 ?auto_85936 ?auto_85933 )
      ( MAKE-3PILE ?auto_85930 ?auto_85931 ?auto_85932 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85937 - BLOCK
      ?auto_85938 - BLOCK
      ?auto_85939 - BLOCK
    )
    :vars
    (
      ?auto_85942 - BLOCK
      ?auto_85940 - BLOCK
      ?auto_85941 - BLOCK
      ?auto_85943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85942 ?auto_85939 ) ( ON-TABLE ?auto_85937 ) ( ON ?auto_85938 ?auto_85937 ) ( ON ?auto_85939 ?auto_85938 ) ( not ( = ?auto_85937 ?auto_85938 ) ) ( not ( = ?auto_85937 ?auto_85939 ) ) ( not ( = ?auto_85937 ?auto_85942 ) ) ( not ( = ?auto_85938 ?auto_85939 ) ) ( not ( = ?auto_85938 ?auto_85942 ) ) ( not ( = ?auto_85939 ?auto_85942 ) ) ( not ( = ?auto_85937 ?auto_85940 ) ) ( not ( = ?auto_85937 ?auto_85941 ) ) ( not ( = ?auto_85938 ?auto_85940 ) ) ( not ( = ?auto_85938 ?auto_85941 ) ) ( not ( = ?auto_85939 ?auto_85940 ) ) ( not ( = ?auto_85939 ?auto_85941 ) ) ( not ( = ?auto_85942 ?auto_85940 ) ) ( not ( = ?auto_85942 ?auto_85941 ) ) ( not ( = ?auto_85940 ?auto_85941 ) ) ( ON ?auto_85940 ?auto_85942 ) ( not ( = ?auto_85943 ?auto_85941 ) ) ( not ( = ?auto_85937 ?auto_85943 ) ) ( not ( = ?auto_85938 ?auto_85943 ) ) ( not ( = ?auto_85939 ?auto_85943 ) ) ( not ( = ?auto_85942 ?auto_85943 ) ) ( not ( = ?auto_85940 ?auto_85943 ) ) ( ON ?auto_85941 ?auto_85940 ) ( HOLDING ?auto_85943 ) ( CLEAR ?auto_85941 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_85937 ?auto_85938 ?auto_85939 ?auto_85942 ?auto_85940 ?auto_85941 ?auto_85943 )
      ( MAKE-3PILE ?auto_85937 ?auto_85938 ?auto_85939 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85944 - BLOCK
      ?auto_85945 - BLOCK
      ?auto_85946 - BLOCK
    )
    :vars
    (
      ?auto_85947 - BLOCK
      ?auto_85948 - BLOCK
      ?auto_85949 - BLOCK
      ?auto_85950 - BLOCK
      ?auto_85951 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85947 ?auto_85946 ) ( ON-TABLE ?auto_85944 ) ( ON ?auto_85945 ?auto_85944 ) ( ON ?auto_85946 ?auto_85945 ) ( not ( = ?auto_85944 ?auto_85945 ) ) ( not ( = ?auto_85944 ?auto_85946 ) ) ( not ( = ?auto_85944 ?auto_85947 ) ) ( not ( = ?auto_85945 ?auto_85946 ) ) ( not ( = ?auto_85945 ?auto_85947 ) ) ( not ( = ?auto_85946 ?auto_85947 ) ) ( not ( = ?auto_85944 ?auto_85948 ) ) ( not ( = ?auto_85944 ?auto_85949 ) ) ( not ( = ?auto_85945 ?auto_85948 ) ) ( not ( = ?auto_85945 ?auto_85949 ) ) ( not ( = ?auto_85946 ?auto_85948 ) ) ( not ( = ?auto_85946 ?auto_85949 ) ) ( not ( = ?auto_85947 ?auto_85948 ) ) ( not ( = ?auto_85947 ?auto_85949 ) ) ( not ( = ?auto_85948 ?auto_85949 ) ) ( ON ?auto_85948 ?auto_85947 ) ( not ( = ?auto_85950 ?auto_85949 ) ) ( not ( = ?auto_85944 ?auto_85950 ) ) ( not ( = ?auto_85945 ?auto_85950 ) ) ( not ( = ?auto_85946 ?auto_85950 ) ) ( not ( = ?auto_85947 ?auto_85950 ) ) ( not ( = ?auto_85948 ?auto_85950 ) ) ( ON ?auto_85949 ?auto_85948 ) ( CLEAR ?auto_85949 ) ( ON ?auto_85950 ?auto_85951 ) ( CLEAR ?auto_85950 ) ( HAND-EMPTY ) ( not ( = ?auto_85944 ?auto_85951 ) ) ( not ( = ?auto_85945 ?auto_85951 ) ) ( not ( = ?auto_85946 ?auto_85951 ) ) ( not ( = ?auto_85947 ?auto_85951 ) ) ( not ( = ?auto_85948 ?auto_85951 ) ) ( not ( = ?auto_85949 ?auto_85951 ) ) ( not ( = ?auto_85950 ?auto_85951 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_85950 ?auto_85951 )
      ( MAKE-3PILE ?auto_85944 ?auto_85945 ?auto_85946 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85952 - BLOCK
      ?auto_85953 - BLOCK
      ?auto_85954 - BLOCK
    )
    :vars
    (
      ?auto_85959 - BLOCK
      ?auto_85955 - BLOCK
      ?auto_85956 - BLOCK
      ?auto_85958 - BLOCK
      ?auto_85957 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85959 ?auto_85954 ) ( ON-TABLE ?auto_85952 ) ( ON ?auto_85953 ?auto_85952 ) ( ON ?auto_85954 ?auto_85953 ) ( not ( = ?auto_85952 ?auto_85953 ) ) ( not ( = ?auto_85952 ?auto_85954 ) ) ( not ( = ?auto_85952 ?auto_85959 ) ) ( not ( = ?auto_85953 ?auto_85954 ) ) ( not ( = ?auto_85953 ?auto_85959 ) ) ( not ( = ?auto_85954 ?auto_85959 ) ) ( not ( = ?auto_85952 ?auto_85955 ) ) ( not ( = ?auto_85952 ?auto_85956 ) ) ( not ( = ?auto_85953 ?auto_85955 ) ) ( not ( = ?auto_85953 ?auto_85956 ) ) ( not ( = ?auto_85954 ?auto_85955 ) ) ( not ( = ?auto_85954 ?auto_85956 ) ) ( not ( = ?auto_85959 ?auto_85955 ) ) ( not ( = ?auto_85959 ?auto_85956 ) ) ( not ( = ?auto_85955 ?auto_85956 ) ) ( ON ?auto_85955 ?auto_85959 ) ( not ( = ?auto_85958 ?auto_85956 ) ) ( not ( = ?auto_85952 ?auto_85958 ) ) ( not ( = ?auto_85953 ?auto_85958 ) ) ( not ( = ?auto_85954 ?auto_85958 ) ) ( not ( = ?auto_85959 ?auto_85958 ) ) ( not ( = ?auto_85955 ?auto_85958 ) ) ( ON ?auto_85958 ?auto_85957 ) ( CLEAR ?auto_85958 ) ( not ( = ?auto_85952 ?auto_85957 ) ) ( not ( = ?auto_85953 ?auto_85957 ) ) ( not ( = ?auto_85954 ?auto_85957 ) ) ( not ( = ?auto_85959 ?auto_85957 ) ) ( not ( = ?auto_85955 ?auto_85957 ) ) ( not ( = ?auto_85956 ?auto_85957 ) ) ( not ( = ?auto_85958 ?auto_85957 ) ) ( HOLDING ?auto_85956 ) ( CLEAR ?auto_85955 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85952 ?auto_85953 ?auto_85954 ?auto_85959 ?auto_85955 ?auto_85956 )
      ( MAKE-3PILE ?auto_85952 ?auto_85953 ?auto_85954 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85960 - BLOCK
      ?auto_85961 - BLOCK
      ?auto_85962 - BLOCK
    )
    :vars
    (
      ?auto_85965 - BLOCK
      ?auto_85966 - BLOCK
      ?auto_85967 - BLOCK
      ?auto_85964 - BLOCK
      ?auto_85963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85965 ?auto_85962 ) ( ON-TABLE ?auto_85960 ) ( ON ?auto_85961 ?auto_85960 ) ( ON ?auto_85962 ?auto_85961 ) ( not ( = ?auto_85960 ?auto_85961 ) ) ( not ( = ?auto_85960 ?auto_85962 ) ) ( not ( = ?auto_85960 ?auto_85965 ) ) ( not ( = ?auto_85961 ?auto_85962 ) ) ( not ( = ?auto_85961 ?auto_85965 ) ) ( not ( = ?auto_85962 ?auto_85965 ) ) ( not ( = ?auto_85960 ?auto_85966 ) ) ( not ( = ?auto_85960 ?auto_85967 ) ) ( not ( = ?auto_85961 ?auto_85966 ) ) ( not ( = ?auto_85961 ?auto_85967 ) ) ( not ( = ?auto_85962 ?auto_85966 ) ) ( not ( = ?auto_85962 ?auto_85967 ) ) ( not ( = ?auto_85965 ?auto_85966 ) ) ( not ( = ?auto_85965 ?auto_85967 ) ) ( not ( = ?auto_85966 ?auto_85967 ) ) ( ON ?auto_85966 ?auto_85965 ) ( not ( = ?auto_85964 ?auto_85967 ) ) ( not ( = ?auto_85960 ?auto_85964 ) ) ( not ( = ?auto_85961 ?auto_85964 ) ) ( not ( = ?auto_85962 ?auto_85964 ) ) ( not ( = ?auto_85965 ?auto_85964 ) ) ( not ( = ?auto_85966 ?auto_85964 ) ) ( ON ?auto_85964 ?auto_85963 ) ( not ( = ?auto_85960 ?auto_85963 ) ) ( not ( = ?auto_85961 ?auto_85963 ) ) ( not ( = ?auto_85962 ?auto_85963 ) ) ( not ( = ?auto_85965 ?auto_85963 ) ) ( not ( = ?auto_85966 ?auto_85963 ) ) ( not ( = ?auto_85967 ?auto_85963 ) ) ( not ( = ?auto_85964 ?auto_85963 ) ) ( CLEAR ?auto_85966 ) ( ON ?auto_85967 ?auto_85964 ) ( CLEAR ?auto_85967 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_85963 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_85963 ?auto_85964 )
      ( MAKE-3PILE ?auto_85960 ?auto_85961 ?auto_85962 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85968 - BLOCK
      ?auto_85969 - BLOCK
      ?auto_85970 - BLOCK
    )
    :vars
    (
      ?auto_85974 - BLOCK
      ?auto_85971 - BLOCK
      ?auto_85973 - BLOCK
      ?auto_85972 - BLOCK
      ?auto_85975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85974 ?auto_85970 ) ( ON-TABLE ?auto_85968 ) ( ON ?auto_85969 ?auto_85968 ) ( ON ?auto_85970 ?auto_85969 ) ( not ( = ?auto_85968 ?auto_85969 ) ) ( not ( = ?auto_85968 ?auto_85970 ) ) ( not ( = ?auto_85968 ?auto_85974 ) ) ( not ( = ?auto_85969 ?auto_85970 ) ) ( not ( = ?auto_85969 ?auto_85974 ) ) ( not ( = ?auto_85970 ?auto_85974 ) ) ( not ( = ?auto_85968 ?auto_85971 ) ) ( not ( = ?auto_85968 ?auto_85973 ) ) ( not ( = ?auto_85969 ?auto_85971 ) ) ( not ( = ?auto_85969 ?auto_85973 ) ) ( not ( = ?auto_85970 ?auto_85971 ) ) ( not ( = ?auto_85970 ?auto_85973 ) ) ( not ( = ?auto_85974 ?auto_85971 ) ) ( not ( = ?auto_85974 ?auto_85973 ) ) ( not ( = ?auto_85971 ?auto_85973 ) ) ( not ( = ?auto_85972 ?auto_85973 ) ) ( not ( = ?auto_85968 ?auto_85972 ) ) ( not ( = ?auto_85969 ?auto_85972 ) ) ( not ( = ?auto_85970 ?auto_85972 ) ) ( not ( = ?auto_85974 ?auto_85972 ) ) ( not ( = ?auto_85971 ?auto_85972 ) ) ( ON ?auto_85972 ?auto_85975 ) ( not ( = ?auto_85968 ?auto_85975 ) ) ( not ( = ?auto_85969 ?auto_85975 ) ) ( not ( = ?auto_85970 ?auto_85975 ) ) ( not ( = ?auto_85974 ?auto_85975 ) ) ( not ( = ?auto_85971 ?auto_85975 ) ) ( not ( = ?auto_85973 ?auto_85975 ) ) ( not ( = ?auto_85972 ?auto_85975 ) ) ( ON ?auto_85973 ?auto_85972 ) ( CLEAR ?auto_85973 ) ( ON-TABLE ?auto_85975 ) ( HOLDING ?auto_85971 ) ( CLEAR ?auto_85974 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_85968 ?auto_85969 ?auto_85970 ?auto_85974 ?auto_85971 )
      ( MAKE-3PILE ?auto_85968 ?auto_85969 ?auto_85970 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85976 - BLOCK
      ?auto_85977 - BLOCK
      ?auto_85978 - BLOCK
    )
    :vars
    (
      ?auto_85983 - BLOCK
      ?auto_85981 - BLOCK
      ?auto_85982 - BLOCK
      ?auto_85980 - BLOCK
      ?auto_85979 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85983 ?auto_85978 ) ( ON-TABLE ?auto_85976 ) ( ON ?auto_85977 ?auto_85976 ) ( ON ?auto_85978 ?auto_85977 ) ( not ( = ?auto_85976 ?auto_85977 ) ) ( not ( = ?auto_85976 ?auto_85978 ) ) ( not ( = ?auto_85976 ?auto_85983 ) ) ( not ( = ?auto_85977 ?auto_85978 ) ) ( not ( = ?auto_85977 ?auto_85983 ) ) ( not ( = ?auto_85978 ?auto_85983 ) ) ( not ( = ?auto_85976 ?auto_85981 ) ) ( not ( = ?auto_85976 ?auto_85982 ) ) ( not ( = ?auto_85977 ?auto_85981 ) ) ( not ( = ?auto_85977 ?auto_85982 ) ) ( not ( = ?auto_85978 ?auto_85981 ) ) ( not ( = ?auto_85978 ?auto_85982 ) ) ( not ( = ?auto_85983 ?auto_85981 ) ) ( not ( = ?auto_85983 ?auto_85982 ) ) ( not ( = ?auto_85981 ?auto_85982 ) ) ( not ( = ?auto_85980 ?auto_85982 ) ) ( not ( = ?auto_85976 ?auto_85980 ) ) ( not ( = ?auto_85977 ?auto_85980 ) ) ( not ( = ?auto_85978 ?auto_85980 ) ) ( not ( = ?auto_85983 ?auto_85980 ) ) ( not ( = ?auto_85981 ?auto_85980 ) ) ( ON ?auto_85980 ?auto_85979 ) ( not ( = ?auto_85976 ?auto_85979 ) ) ( not ( = ?auto_85977 ?auto_85979 ) ) ( not ( = ?auto_85978 ?auto_85979 ) ) ( not ( = ?auto_85983 ?auto_85979 ) ) ( not ( = ?auto_85981 ?auto_85979 ) ) ( not ( = ?auto_85982 ?auto_85979 ) ) ( not ( = ?auto_85980 ?auto_85979 ) ) ( ON ?auto_85982 ?auto_85980 ) ( ON-TABLE ?auto_85979 ) ( CLEAR ?auto_85983 ) ( ON ?auto_85981 ?auto_85982 ) ( CLEAR ?auto_85981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_85979 ?auto_85980 ?auto_85982 )
      ( MAKE-3PILE ?auto_85976 ?auto_85977 ?auto_85978 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_86000 - BLOCK
      ?auto_86001 - BLOCK
      ?auto_86002 - BLOCK
    )
    :vars
    (
      ?auto_86004 - BLOCK
      ?auto_86006 - BLOCK
      ?auto_86005 - BLOCK
      ?auto_86007 - BLOCK
      ?auto_86003 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86000 ) ( ON ?auto_86001 ?auto_86000 ) ( not ( = ?auto_86000 ?auto_86001 ) ) ( not ( = ?auto_86000 ?auto_86002 ) ) ( not ( = ?auto_86000 ?auto_86004 ) ) ( not ( = ?auto_86001 ?auto_86002 ) ) ( not ( = ?auto_86001 ?auto_86004 ) ) ( not ( = ?auto_86002 ?auto_86004 ) ) ( not ( = ?auto_86000 ?auto_86006 ) ) ( not ( = ?auto_86000 ?auto_86005 ) ) ( not ( = ?auto_86001 ?auto_86006 ) ) ( not ( = ?auto_86001 ?auto_86005 ) ) ( not ( = ?auto_86002 ?auto_86006 ) ) ( not ( = ?auto_86002 ?auto_86005 ) ) ( not ( = ?auto_86004 ?auto_86006 ) ) ( not ( = ?auto_86004 ?auto_86005 ) ) ( not ( = ?auto_86006 ?auto_86005 ) ) ( not ( = ?auto_86007 ?auto_86005 ) ) ( not ( = ?auto_86000 ?auto_86007 ) ) ( not ( = ?auto_86001 ?auto_86007 ) ) ( not ( = ?auto_86002 ?auto_86007 ) ) ( not ( = ?auto_86004 ?auto_86007 ) ) ( not ( = ?auto_86006 ?auto_86007 ) ) ( ON ?auto_86007 ?auto_86003 ) ( not ( = ?auto_86000 ?auto_86003 ) ) ( not ( = ?auto_86001 ?auto_86003 ) ) ( not ( = ?auto_86002 ?auto_86003 ) ) ( not ( = ?auto_86004 ?auto_86003 ) ) ( not ( = ?auto_86006 ?auto_86003 ) ) ( not ( = ?auto_86005 ?auto_86003 ) ) ( not ( = ?auto_86007 ?auto_86003 ) ) ( ON ?auto_86005 ?auto_86007 ) ( ON-TABLE ?auto_86003 ) ( ON ?auto_86006 ?auto_86005 ) ( ON ?auto_86004 ?auto_86006 ) ( CLEAR ?auto_86004 ) ( HOLDING ?auto_86002 ) ( CLEAR ?auto_86001 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86000 ?auto_86001 ?auto_86002 ?auto_86004 )
      ( MAKE-3PILE ?auto_86000 ?auto_86001 ?auto_86002 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_86008 - BLOCK
      ?auto_86009 - BLOCK
      ?auto_86010 - BLOCK
    )
    :vars
    (
      ?auto_86014 - BLOCK
      ?auto_86015 - BLOCK
      ?auto_86012 - BLOCK
      ?auto_86011 - BLOCK
      ?auto_86013 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86008 ) ( ON ?auto_86009 ?auto_86008 ) ( not ( = ?auto_86008 ?auto_86009 ) ) ( not ( = ?auto_86008 ?auto_86010 ) ) ( not ( = ?auto_86008 ?auto_86014 ) ) ( not ( = ?auto_86009 ?auto_86010 ) ) ( not ( = ?auto_86009 ?auto_86014 ) ) ( not ( = ?auto_86010 ?auto_86014 ) ) ( not ( = ?auto_86008 ?auto_86015 ) ) ( not ( = ?auto_86008 ?auto_86012 ) ) ( not ( = ?auto_86009 ?auto_86015 ) ) ( not ( = ?auto_86009 ?auto_86012 ) ) ( not ( = ?auto_86010 ?auto_86015 ) ) ( not ( = ?auto_86010 ?auto_86012 ) ) ( not ( = ?auto_86014 ?auto_86015 ) ) ( not ( = ?auto_86014 ?auto_86012 ) ) ( not ( = ?auto_86015 ?auto_86012 ) ) ( not ( = ?auto_86011 ?auto_86012 ) ) ( not ( = ?auto_86008 ?auto_86011 ) ) ( not ( = ?auto_86009 ?auto_86011 ) ) ( not ( = ?auto_86010 ?auto_86011 ) ) ( not ( = ?auto_86014 ?auto_86011 ) ) ( not ( = ?auto_86015 ?auto_86011 ) ) ( ON ?auto_86011 ?auto_86013 ) ( not ( = ?auto_86008 ?auto_86013 ) ) ( not ( = ?auto_86009 ?auto_86013 ) ) ( not ( = ?auto_86010 ?auto_86013 ) ) ( not ( = ?auto_86014 ?auto_86013 ) ) ( not ( = ?auto_86015 ?auto_86013 ) ) ( not ( = ?auto_86012 ?auto_86013 ) ) ( not ( = ?auto_86011 ?auto_86013 ) ) ( ON ?auto_86012 ?auto_86011 ) ( ON-TABLE ?auto_86013 ) ( ON ?auto_86015 ?auto_86012 ) ( ON ?auto_86014 ?auto_86015 ) ( CLEAR ?auto_86009 ) ( ON ?auto_86010 ?auto_86014 ) ( CLEAR ?auto_86010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_86013 ?auto_86011 ?auto_86012 ?auto_86015 ?auto_86014 )
      ( MAKE-3PILE ?auto_86008 ?auto_86009 ?auto_86010 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_86016 - BLOCK
      ?auto_86017 - BLOCK
      ?auto_86018 - BLOCK
    )
    :vars
    (
      ?auto_86021 - BLOCK
      ?auto_86020 - BLOCK
      ?auto_86022 - BLOCK
      ?auto_86023 - BLOCK
      ?auto_86019 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86016 ) ( not ( = ?auto_86016 ?auto_86017 ) ) ( not ( = ?auto_86016 ?auto_86018 ) ) ( not ( = ?auto_86016 ?auto_86021 ) ) ( not ( = ?auto_86017 ?auto_86018 ) ) ( not ( = ?auto_86017 ?auto_86021 ) ) ( not ( = ?auto_86018 ?auto_86021 ) ) ( not ( = ?auto_86016 ?auto_86020 ) ) ( not ( = ?auto_86016 ?auto_86022 ) ) ( not ( = ?auto_86017 ?auto_86020 ) ) ( not ( = ?auto_86017 ?auto_86022 ) ) ( not ( = ?auto_86018 ?auto_86020 ) ) ( not ( = ?auto_86018 ?auto_86022 ) ) ( not ( = ?auto_86021 ?auto_86020 ) ) ( not ( = ?auto_86021 ?auto_86022 ) ) ( not ( = ?auto_86020 ?auto_86022 ) ) ( not ( = ?auto_86023 ?auto_86022 ) ) ( not ( = ?auto_86016 ?auto_86023 ) ) ( not ( = ?auto_86017 ?auto_86023 ) ) ( not ( = ?auto_86018 ?auto_86023 ) ) ( not ( = ?auto_86021 ?auto_86023 ) ) ( not ( = ?auto_86020 ?auto_86023 ) ) ( ON ?auto_86023 ?auto_86019 ) ( not ( = ?auto_86016 ?auto_86019 ) ) ( not ( = ?auto_86017 ?auto_86019 ) ) ( not ( = ?auto_86018 ?auto_86019 ) ) ( not ( = ?auto_86021 ?auto_86019 ) ) ( not ( = ?auto_86020 ?auto_86019 ) ) ( not ( = ?auto_86022 ?auto_86019 ) ) ( not ( = ?auto_86023 ?auto_86019 ) ) ( ON ?auto_86022 ?auto_86023 ) ( ON-TABLE ?auto_86019 ) ( ON ?auto_86020 ?auto_86022 ) ( ON ?auto_86021 ?auto_86020 ) ( ON ?auto_86018 ?auto_86021 ) ( CLEAR ?auto_86018 ) ( HOLDING ?auto_86017 ) ( CLEAR ?auto_86016 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86016 ?auto_86017 )
      ( MAKE-3PILE ?auto_86016 ?auto_86017 ?auto_86018 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_86024 - BLOCK
      ?auto_86025 - BLOCK
      ?auto_86026 - BLOCK
    )
    :vars
    (
      ?auto_86028 - BLOCK
      ?auto_86031 - BLOCK
      ?auto_86030 - BLOCK
      ?auto_86027 - BLOCK
      ?auto_86029 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86024 ) ( not ( = ?auto_86024 ?auto_86025 ) ) ( not ( = ?auto_86024 ?auto_86026 ) ) ( not ( = ?auto_86024 ?auto_86028 ) ) ( not ( = ?auto_86025 ?auto_86026 ) ) ( not ( = ?auto_86025 ?auto_86028 ) ) ( not ( = ?auto_86026 ?auto_86028 ) ) ( not ( = ?auto_86024 ?auto_86031 ) ) ( not ( = ?auto_86024 ?auto_86030 ) ) ( not ( = ?auto_86025 ?auto_86031 ) ) ( not ( = ?auto_86025 ?auto_86030 ) ) ( not ( = ?auto_86026 ?auto_86031 ) ) ( not ( = ?auto_86026 ?auto_86030 ) ) ( not ( = ?auto_86028 ?auto_86031 ) ) ( not ( = ?auto_86028 ?auto_86030 ) ) ( not ( = ?auto_86031 ?auto_86030 ) ) ( not ( = ?auto_86027 ?auto_86030 ) ) ( not ( = ?auto_86024 ?auto_86027 ) ) ( not ( = ?auto_86025 ?auto_86027 ) ) ( not ( = ?auto_86026 ?auto_86027 ) ) ( not ( = ?auto_86028 ?auto_86027 ) ) ( not ( = ?auto_86031 ?auto_86027 ) ) ( ON ?auto_86027 ?auto_86029 ) ( not ( = ?auto_86024 ?auto_86029 ) ) ( not ( = ?auto_86025 ?auto_86029 ) ) ( not ( = ?auto_86026 ?auto_86029 ) ) ( not ( = ?auto_86028 ?auto_86029 ) ) ( not ( = ?auto_86031 ?auto_86029 ) ) ( not ( = ?auto_86030 ?auto_86029 ) ) ( not ( = ?auto_86027 ?auto_86029 ) ) ( ON ?auto_86030 ?auto_86027 ) ( ON-TABLE ?auto_86029 ) ( ON ?auto_86031 ?auto_86030 ) ( ON ?auto_86028 ?auto_86031 ) ( ON ?auto_86026 ?auto_86028 ) ( CLEAR ?auto_86024 ) ( ON ?auto_86025 ?auto_86026 ) ( CLEAR ?auto_86025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_86029 ?auto_86027 ?auto_86030 ?auto_86031 ?auto_86028 ?auto_86026 )
      ( MAKE-3PILE ?auto_86024 ?auto_86025 ?auto_86026 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_86032 - BLOCK
      ?auto_86033 - BLOCK
      ?auto_86034 - BLOCK
    )
    :vars
    (
      ?auto_86036 - BLOCK
      ?auto_86038 - BLOCK
      ?auto_86039 - BLOCK
      ?auto_86035 - BLOCK
      ?auto_86037 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86032 ?auto_86033 ) ) ( not ( = ?auto_86032 ?auto_86034 ) ) ( not ( = ?auto_86032 ?auto_86036 ) ) ( not ( = ?auto_86033 ?auto_86034 ) ) ( not ( = ?auto_86033 ?auto_86036 ) ) ( not ( = ?auto_86034 ?auto_86036 ) ) ( not ( = ?auto_86032 ?auto_86038 ) ) ( not ( = ?auto_86032 ?auto_86039 ) ) ( not ( = ?auto_86033 ?auto_86038 ) ) ( not ( = ?auto_86033 ?auto_86039 ) ) ( not ( = ?auto_86034 ?auto_86038 ) ) ( not ( = ?auto_86034 ?auto_86039 ) ) ( not ( = ?auto_86036 ?auto_86038 ) ) ( not ( = ?auto_86036 ?auto_86039 ) ) ( not ( = ?auto_86038 ?auto_86039 ) ) ( not ( = ?auto_86035 ?auto_86039 ) ) ( not ( = ?auto_86032 ?auto_86035 ) ) ( not ( = ?auto_86033 ?auto_86035 ) ) ( not ( = ?auto_86034 ?auto_86035 ) ) ( not ( = ?auto_86036 ?auto_86035 ) ) ( not ( = ?auto_86038 ?auto_86035 ) ) ( ON ?auto_86035 ?auto_86037 ) ( not ( = ?auto_86032 ?auto_86037 ) ) ( not ( = ?auto_86033 ?auto_86037 ) ) ( not ( = ?auto_86034 ?auto_86037 ) ) ( not ( = ?auto_86036 ?auto_86037 ) ) ( not ( = ?auto_86038 ?auto_86037 ) ) ( not ( = ?auto_86039 ?auto_86037 ) ) ( not ( = ?auto_86035 ?auto_86037 ) ) ( ON ?auto_86039 ?auto_86035 ) ( ON-TABLE ?auto_86037 ) ( ON ?auto_86038 ?auto_86039 ) ( ON ?auto_86036 ?auto_86038 ) ( ON ?auto_86034 ?auto_86036 ) ( ON ?auto_86033 ?auto_86034 ) ( CLEAR ?auto_86033 ) ( HOLDING ?auto_86032 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_86032 )
      ( MAKE-3PILE ?auto_86032 ?auto_86033 ?auto_86034 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_86040 - BLOCK
      ?auto_86041 - BLOCK
      ?auto_86042 - BLOCK
    )
    :vars
    (
      ?auto_86044 - BLOCK
      ?auto_86046 - BLOCK
      ?auto_86045 - BLOCK
      ?auto_86043 - BLOCK
      ?auto_86047 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86040 ?auto_86041 ) ) ( not ( = ?auto_86040 ?auto_86042 ) ) ( not ( = ?auto_86040 ?auto_86044 ) ) ( not ( = ?auto_86041 ?auto_86042 ) ) ( not ( = ?auto_86041 ?auto_86044 ) ) ( not ( = ?auto_86042 ?auto_86044 ) ) ( not ( = ?auto_86040 ?auto_86046 ) ) ( not ( = ?auto_86040 ?auto_86045 ) ) ( not ( = ?auto_86041 ?auto_86046 ) ) ( not ( = ?auto_86041 ?auto_86045 ) ) ( not ( = ?auto_86042 ?auto_86046 ) ) ( not ( = ?auto_86042 ?auto_86045 ) ) ( not ( = ?auto_86044 ?auto_86046 ) ) ( not ( = ?auto_86044 ?auto_86045 ) ) ( not ( = ?auto_86046 ?auto_86045 ) ) ( not ( = ?auto_86043 ?auto_86045 ) ) ( not ( = ?auto_86040 ?auto_86043 ) ) ( not ( = ?auto_86041 ?auto_86043 ) ) ( not ( = ?auto_86042 ?auto_86043 ) ) ( not ( = ?auto_86044 ?auto_86043 ) ) ( not ( = ?auto_86046 ?auto_86043 ) ) ( ON ?auto_86043 ?auto_86047 ) ( not ( = ?auto_86040 ?auto_86047 ) ) ( not ( = ?auto_86041 ?auto_86047 ) ) ( not ( = ?auto_86042 ?auto_86047 ) ) ( not ( = ?auto_86044 ?auto_86047 ) ) ( not ( = ?auto_86046 ?auto_86047 ) ) ( not ( = ?auto_86045 ?auto_86047 ) ) ( not ( = ?auto_86043 ?auto_86047 ) ) ( ON ?auto_86045 ?auto_86043 ) ( ON-TABLE ?auto_86047 ) ( ON ?auto_86046 ?auto_86045 ) ( ON ?auto_86044 ?auto_86046 ) ( ON ?auto_86042 ?auto_86044 ) ( ON ?auto_86041 ?auto_86042 ) ( ON ?auto_86040 ?auto_86041 ) ( CLEAR ?auto_86040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_86047 ?auto_86043 ?auto_86045 ?auto_86046 ?auto_86044 ?auto_86042 ?auto_86041 )
      ( MAKE-3PILE ?auto_86040 ?auto_86041 ?auto_86042 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86052 - BLOCK
      ?auto_86053 - BLOCK
      ?auto_86054 - BLOCK
      ?auto_86055 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_86055 ) ( CLEAR ?auto_86054 ) ( ON-TABLE ?auto_86052 ) ( ON ?auto_86053 ?auto_86052 ) ( ON ?auto_86054 ?auto_86053 ) ( not ( = ?auto_86052 ?auto_86053 ) ) ( not ( = ?auto_86052 ?auto_86054 ) ) ( not ( = ?auto_86052 ?auto_86055 ) ) ( not ( = ?auto_86053 ?auto_86054 ) ) ( not ( = ?auto_86053 ?auto_86055 ) ) ( not ( = ?auto_86054 ?auto_86055 ) ) )
    :subtasks
    ( ( !STACK ?auto_86055 ?auto_86054 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86056 - BLOCK
      ?auto_86057 - BLOCK
      ?auto_86058 - BLOCK
      ?auto_86059 - BLOCK
    )
    :vars
    (
      ?auto_86060 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_86058 ) ( ON-TABLE ?auto_86056 ) ( ON ?auto_86057 ?auto_86056 ) ( ON ?auto_86058 ?auto_86057 ) ( not ( = ?auto_86056 ?auto_86057 ) ) ( not ( = ?auto_86056 ?auto_86058 ) ) ( not ( = ?auto_86056 ?auto_86059 ) ) ( not ( = ?auto_86057 ?auto_86058 ) ) ( not ( = ?auto_86057 ?auto_86059 ) ) ( not ( = ?auto_86058 ?auto_86059 ) ) ( ON ?auto_86059 ?auto_86060 ) ( CLEAR ?auto_86059 ) ( HAND-EMPTY ) ( not ( = ?auto_86056 ?auto_86060 ) ) ( not ( = ?auto_86057 ?auto_86060 ) ) ( not ( = ?auto_86058 ?auto_86060 ) ) ( not ( = ?auto_86059 ?auto_86060 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_86059 ?auto_86060 )
      ( MAKE-4PILE ?auto_86056 ?auto_86057 ?auto_86058 ?auto_86059 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86061 - BLOCK
      ?auto_86062 - BLOCK
      ?auto_86063 - BLOCK
      ?auto_86064 - BLOCK
    )
    :vars
    (
      ?auto_86065 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86061 ) ( ON ?auto_86062 ?auto_86061 ) ( not ( = ?auto_86061 ?auto_86062 ) ) ( not ( = ?auto_86061 ?auto_86063 ) ) ( not ( = ?auto_86061 ?auto_86064 ) ) ( not ( = ?auto_86062 ?auto_86063 ) ) ( not ( = ?auto_86062 ?auto_86064 ) ) ( not ( = ?auto_86063 ?auto_86064 ) ) ( ON ?auto_86064 ?auto_86065 ) ( CLEAR ?auto_86064 ) ( not ( = ?auto_86061 ?auto_86065 ) ) ( not ( = ?auto_86062 ?auto_86065 ) ) ( not ( = ?auto_86063 ?auto_86065 ) ) ( not ( = ?auto_86064 ?auto_86065 ) ) ( HOLDING ?auto_86063 ) ( CLEAR ?auto_86062 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86061 ?auto_86062 ?auto_86063 )
      ( MAKE-4PILE ?auto_86061 ?auto_86062 ?auto_86063 ?auto_86064 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86066 - BLOCK
      ?auto_86067 - BLOCK
      ?auto_86068 - BLOCK
      ?auto_86069 - BLOCK
    )
    :vars
    (
      ?auto_86070 - BLOCK
      ?auto_86071 - BLOCK
      ?auto_86072 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86066 ) ( ON ?auto_86067 ?auto_86066 ) ( not ( = ?auto_86066 ?auto_86067 ) ) ( not ( = ?auto_86066 ?auto_86068 ) ) ( not ( = ?auto_86066 ?auto_86069 ) ) ( not ( = ?auto_86067 ?auto_86068 ) ) ( not ( = ?auto_86067 ?auto_86069 ) ) ( not ( = ?auto_86068 ?auto_86069 ) ) ( ON ?auto_86069 ?auto_86070 ) ( not ( = ?auto_86066 ?auto_86070 ) ) ( not ( = ?auto_86067 ?auto_86070 ) ) ( not ( = ?auto_86068 ?auto_86070 ) ) ( not ( = ?auto_86069 ?auto_86070 ) ) ( CLEAR ?auto_86067 ) ( ON ?auto_86068 ?auto_86069 ) ( CLEAR ?auto_86068 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_86071 ) ( ON ?auto_86072 ?auto_86071 ) ( ON ?auto_86070 ?auto_86072 ) ( not ( = ?auto_86071 ?auto_86072 ) ) ( not ( = ?auto_86071 ?auto_86070 ) ) ( not ( = ?auto_86071 ?auto_86069 ) ) ( not ( = ?auto_86071 ?auto_86068 ) ) ( not ( = ?auto_86072 ?auto_86070 ) ) ( not ( = ?auto_86072 ?auto_86069 ) ) ( not ( = ?auto_86072 ?auto_86068 ) ) ( not ( = ?auto_86066 ?auto_86071 ) ) ( not ( = ?auto_86066 ?auto_86072 ) ) ( not ( = ?auto_86067 ?auto_86071 ) ) ( not ( = ?auto_86067 ?auto_86072 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86071 ?auto_86072 ?auto_86070 ?auto_86069 )
      ( MAKE-4PILE ?auto_86066 ?auto_86067 ?auto_86068 ?auto_86069 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86073 - BLOCK
      ?auto_86074 - BLOCK
      ?auto_86075 - BLOCK
      ?auto_86076 - BLOCK
    )
    :vars
    (
      ?auto_86077 - BLOCK
      ?auto_86079 - BLOCK
      ?auto_86078 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86073 ) ( not ( = ?auto_86073 ?auto_86074 ) ) ( not ( = ?auto_86073 ?auto_86075 ) ) ( not ( = ?auto_86073 ?auto_86076 ) ) ( not ( = ?auto_86074 ?auto_86075 ) ) ( not ( = ?auto_86074 ?auto_86076 ) ) ( not ( = ?auto_86075 ?auto_86076 ) ) ( ON ?auto_86076 ?auto_86077 ) ( not ( = ?auto_86073 ?auto_86077 ) ) ( not ( = ?auto_86074 ?auto_86077 ) ) ( not ( = ?auto_86075 ?auto_86077 ) ) ( not ( = ?auto_86076 ?auto_86077 ) ) ( ON ?auto_86075 ?auto_86076 ) ( CLEAR ?auto_86075 ) ( ON-TABLE ?auto_86079 ) ( ON ?auto_86078 ?auto_86079 ) ( ON ?auto_86077 ?auto_86078 ) ( not ( = ?auto_86079 ?auto_86078 ) ) ( not ( = ?auto_86079 ?auto_86077 ) ) ( not ( = ?auto_86079 ?auto_86076 ) ) ( not ( = ?auto_86079 ?auto_86075 ) ) ( not ( = ?auto_86078 ?auto_86077 ) ) ( not ( = ?auto_86078 ?auto_86076 ) ) ( not ( = ?auto_86078 ?auto_86075 ) ) ( not ( = ?auto_86073 ?auto_86079 ) ) ( not ( = ?auto_86073 ?auto_86078 ) ) ( not ( = ?auto_86074 ?auto_86079 ) ) ( not ( = ?auto_86074 ?auto_86078 ) ) ( HOLDING ?auto_86074 ) ( CLEAR ?auto_86073 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86073 ?auto_86074 )
      ( MAKE-4PILE ?auto_86073 ?auto_86074 ?auto_86075 ?auto_86076 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86080 - BLOCK
      ?auto_86081 - BLOCK
      ?auto_86082 - BLOCK
      ?auto_86083 - BLOCK
    )
    :vars
    (
      ?auto_86086 - BLOCK
      ?auto_86084 - BLOCK
      ?auto_86085 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86080 ) ( not ( = ?auto_86080 ?auto_86081 ) ) ( not ( = ?auto_86080 ?auto_86082 ) ) ( not ( = ?auto_86080 ?auto_86083 ) ) ( not ( = ?auto_86081 ?auto_86082 ) ) ( not ( = ?auto_86081 ?auto_86083 ) ) ( not ( = ?auto_86082 ?auto_86083 ) ) ( ON ?auto_86083 ?auto_86086 ) ( not ( = ?auto_86080 ?auto_86086 ) ) ( not ( = ?auto_86081 ?auto_86086 ) ) ( not ( = ?auto_86082 ?auto_86086 ) ) ( not ( = ?auto_86083 ?auto_86086 ) ) ( ON ?auto_86082 ?auto_86083 ) ( ON-TABLE ?auto_86084 ) ( ON ?auto_86085 ?auto_86084 ) ( ON ?auto_86086 ?auto_86085 ) ( not ( = ?auto_86084 ?auto_86085 ) ) ( not ( = ?auto_86084 ?auto_86086 ) ) ( not ( = ?auto_86084 ?auto_86083 ) ) ( not ( = ?auto_86084 ?auto_86082 ) ) ( not ( = ?auto_86085 ?auto_86086 ) ) ( not ( = ?auto_86085 ?auto_86083 ) ) ( not ( = ?auto_86085 ?auto_86082 ) ) ( not ( = ?auto_86080 ?auto_86084 ) ) ( not ( = ?auto_86080 ?auto_86085 ) ) ( not ( = ?auto_86081 ?auto_86084 ) ) ( not ( = ?auto_86081 ?auto_86085 ) ) ( CLEAR ?auto_86080 ) ( ON ?auto_86081 ?auto_86082 ) ( CLEAR ?auto_86081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_86084 ?auto_86085 ?auto_86086 ?auto_86083 ?auto_86082 )
      ( MAKE-4PILE ?auto_86080 ?auto_86081 ?auto_86082 ?auto_86083 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86087 - BLOCK
      ?auto_86088 - BLOCK
      ?auto_86089 - BLOCK
      ?auto_86090 - BLOCK
    )
    :vars
    (
      ?auto_86092 - BLOCK
      ?auto_86093 - BLOCK
      ?auto_86091 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86087 ?auto_86088 ) ) ( not ( = ?auto_86087 ?auto_86089 ) ) ( not ( = ?auto_86087 ?auto_86090 ) ) ( not ( = ?auto_86088 ?auto_86089 ) ) ( not ( = ?auto_86088 ?auto_86090 ) ) ( not ( = ?auto_86089 ?auto_86090 ) ) ( ON ?auto_86090 ?auto_86092 ) ( not ( = ?auto_86087 ?auto_86092 ) ) ( not ( = ?auto_86088 ?auto_86092 ) ) ( not ( = ?auto_86089 ?auto_86092 ) ) ( not ( = ?auto_86090 ?auto_86092 ) ) ( ON ?auto_86089 ?auto_86090 ) ( ON-TABLE ?auto_86093 ) ( ON ?auto_86091 ?auto_86093 ) ( ON ?auto_86092 ?auto_86091 ) ( not ( = ?auto_86093 ?auto_86091 ) ) ( not ( = ?auto_86093 ?auto_86092 ) ) ( not ( = ?auto_86093 ?auto_86090 ) ) ( not ( = ?auto_86093 ?auto_86089 ) ) ( not ( = ?auto_86091 ?auto_86092 ) ) ( not ( = ?auto_86091 ?auto_86090 ) ) ( not ( = ?auto_86091 ?auto_86089 ) ) ( not ( = ?auto_86087 ?auto_86093 ) ) ( not ( = ?auto_86087 ?auto_86091 ) ) ( not ( = ?auto_86088 ?auto_86093 ) ) ( not ( = ?auto_86088 ?auto_86091 ) ) ( ON ?auto_86088 ?auto_86089 ) ( CLEAR ?auto_86088 ) ( HOLDING ?auto_86087 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_86087 )
      ( MAKE-4PILE ?auto_86087 ?auto_86088 ?auto_86089 ?auto_86090 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86094 - BLOCK
      ?auto_86095 - BLOCK
      ?auto_86096 - BLOCK
      ?auto_86097 - BLOCK
    )
    :vars
    (
      ?auto_86099 - BLOCK
      ?auto_86098 - BLOCK
      ?auto_86100 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86094 ?auto_86095 ) ) ( not ( = ?auto_86094 ?auto_86096 ) ) ( not ( = ?auto_86094 ?auto_86097 ) ) ( not ( = ?auto_86095 ?auto_86096 ) ) ( not ( = ?auto_86095 ?auto_86097 ) ) ( not ( = ?auto_86096 ?auto_86097 ) ) ( ON ?auto_86097 ?auto_86099 ) ( not ( = ?auto_86094 ?auto_86099 ) ) ( not ( = ?auto_86095 ?auto_86099 ) ) ( not ( = ?auto_86096 ?auto_86099 ) ) ( not ( = ?auto_86097 ?auto_86099 ) ) ( ON ?auto_86096 ?auto_86097 ) ( ON-TABLE ?auto_86098 ) ( ON ?auto_86100 ?auto_86098 ) ( ON ?auto_86099 ?auto_86100 ) ( not ( = ?auto_86098 ?auto_86100 ) ) ( not ( = ?auto_86098 ?auto_86099 ) ) ( not ( = ?auto_86098 ?auto_86097 ) ) ( not ( = ?auto_86098 ?auto_86096 ) ) ( not ( = ?auto_86100 ?auto_86099 ) ) ( not ( = ?auto_86100 ?auto_86097 ) ) ( not ( = ?auto_86100 ?auto_86096 ) ) ( not ( = ?auto_86094 ?auto_86098 ) ) ( not ( = ?auto_86094 ?auto_86100 ) ) ( not ( = ?auto_86095 ?auto_86098 ) ) ( not ( = ?auto_86095 ?auto_86100 ) ) ( ON ?auto_86095 ?auto_86096 ) ( ON ?auto_86094 ?auto_86095 ) ( CLEAR ?auto_86094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_86098 ?auto_86100 ?auto_86099 ?auto_86097 ?auto_86096 ?auto_86095 )
      ( MAKE-4PILE ?auto_86094 ?auto_86095 ?auto_86096 ?auto_86097 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86101 - BLOCK
      ?auto_86102 - BLOCK
      ?auto_86103 - BLOCK
      ?auto_86104 - BLOCK
    )
    :vars
    (
      ?auto_86106 - BLOCK
      ?auto_86105 - BLOCK
      ?auto_86107 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86101 ?auto_86102 ) ) ( not ( = ?auto_86101 ?auto_86103 ) ) ( not ( = ?auto_86101 ?auto_86104 ) ) ( not ( = ?auto_86102 ?auto_86103 ) ) ( not ( = ?auto_86102 ?auto_86104 ) ) ( not ( = ?auto_86103 ?auto_86104 ) ) ( ON ?auto_86104 ?auto_86106 ) ( not ( = ?auto_86101 ?auto_86106 ) ) ( not ( = ?auto_86102 ?auto_86106 ) ) ( not ( = ?auto_86103 ?auto_86106 ) ) ( not ( = ?auto_86104 ?auto_86106 ) ) ( ON ?auto_86103 ?auto_86104 ) ( ON-TABLE ?auto_86105 ) ( ON ?auto_86107 ?auto_86105 ) ( ON ?auto_86106 ?auto_86107 ) ( not ( = ?auto_86105 ?auto_86107 ) ) ( not ( = ?auto_86105 ?auto_86106 ) ) ( not ( = ?auto_86105 ?auto_86104 ) ) ( not ( = ?auto_86105 ?auto_86103 ) ) ( not ( = ?auto_86107 ?auto_86106 ) ) ( not ( = ?auto_86107 ?auto_86104 ) ) ( not ( = ?auto_86107 ?auto_86103 ) ) ( not ( = ?auto_86101 ?auto_86105 ) ) ( not ( = ?auto_86101 ?auto_86107 ) ) ( not ( = ?auto_86102 ?auto_86105 ) ) ( not ( = ?auto_86102 ?auto_86107 ) ) ( ON ?auto_86102 ?auto_86103 ) ( HOLDING ?auto_86101 ) ( CLEAR ?auto_86102 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_86105 ?auto_86107 ?auto_86106 ?auto_86104 ?auto_86103 ?auto_86102 ?auto_86101 )
      ( MAKE-4PILE ?auto_86101 ?auto_86102 ?auto_86103 ?auto_86104 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86108 - BLOCK
      ?auto_86109 - BLOCK
      ?auto_86110 - BLOCK
      ?auto_86111 - BLOCK
    )
    :vars
    (
      ?auto_86112 - BLOCK
      ?auto_86114 - BLOCK
      ?auto_86113 - BLOCK
      ?auto_86115 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86108 ?auto_86109 ) ) ( not ( = ?auto_86108 ?auto_86110 ) ) ( not ( = ?auto_86108 ?auto_86111 ) ) ( not ( = ?auto_86109 ?auto_86110 ) ) ( not ( = ?auto_86109 ?auto_86111 ) ) ( not ( = ?auto_86110 ?auto_86111 ) ) ( ON ?auto_86111 ?auto_86112 ) ( not ( = ?auto_86108 ?auto_86112 ) ) ( not ( = ?auto_86109 ?auto_86112 ) ) ( not ( = ?auto_86110 ?auto_86112 ) ) ( not ( = ?auto_86111 ?auto_86112 ) ) ( ON ?auto_86110 ?auto_86111 ) ( ON-TABLE ?auto_86114 ) ( ON ?auto_86113 ?auto_86114 ) ( ON ?auto_86112 ?auto_86113 ) ( not ( = ?auto_86114 ?auto_86113 ) ) ( not ( = ?auto_86114 ?auto_86112 ) ) ( not ( = ?auto_86114 ?auto_86111 ) ) ( not ( = ?auto_86114 ?auto_86110 ) ) ( not ( = ?auto_86113 ?auto_86112 ) ) ( not ( = ?auto_86113 ?auto_86111 ) ) ( not ( = ?auto_86113 ?auto_86110 ) ) ( not ( = ?auto_86108 ?auto_86114 ) ) ( not ( = ?auto_86108 ?auto_86113 ) ) ( not ( = ?auto_86109 ?auto_86114 ) ) ( not ( = ?auto_86109 ?auto_86113 ) ) ( ON ?auto_86109 ?auto_86110 ) ( CLEAR ?auto_86109 ) ( ON ?auto_86108 ?auto_86115 ) ( CLEAR ?auto_86108 ) ( HAND-EMPTY ) ( not ( = ?auto_86108 ?auto_86115 ) ) ( not ( = ?auto_86109 ?auto_86115 ) ) ( not ( = ?auto_86110 ?auto_86115 ) ) ( not ( = ?auto_86111 ?auto_86115 ) ) ( not ( = ?auto_86112 ?auto_86115 ) ) ( not ( = ?auto_86114 ?auto_86115 ) ) ( not ( = ?auto_86113 ?auto_86115 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_86108 ?auto_86115 )
      ( MAKE-4PILE ?auto_86108 ?auto_86109 ?auto_86110 ?auto_86111 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86116 - BLOCK
      ?auto_86117 - BLOCK
      ?auto_86118 - BLOCK
      ?auto_86119 - BLOCK
    )
    :vars
    (
      ?auto_86122 - BLOCK
      ?auto_86123 - BLOCK
      ?auto_86121 - BLOCK
      ?auto_86120 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86116 ?auto_86117 ) ) ( not ( = ?auto_86116 ?auto_86118 ) ) ( not ( = ?auto_86116 ?auto_86119 ) ) ( not ( = ?auto_86117 ?auto_86118 ) ) ( not ( = ?auto_86117 ?auto_86119 ) ) ( not ( = ?auto_86118 ?auto_86119 ) ) ( ON ?auto_86119 ?auto_86122 ) ( not ( = ?auto_86116 ?auto_86122 ) ) ( not ( = ?auto_86117 ?auto_86122 ) ) ( not ( = ?auto_86118 ?auto_86122 ) ) ( not ( = ?auto_86119 ?auto_86122 ) ) ( ON ?auto_86118 ?auto_86119 ) ( ON-TABLE ?auto_86123 ) ( ON ?auto_86121 ?auto_86123 ) ( ON ?auto_86122 ?auto_86121 ) ( not ( = ?auto_86123 ?auto_86121 ) ) ( not ( = ?auto_86123 ?auto_86122 ) ) ( not ( = ?auto_86123 ?auto_86119 ) ) ( not ( = ?auto_86123 ?auto_86118 ) ) ( not ( = ?auto_86121 ?auto_86122 ) ) ( not ( = ?auto_86121 ?auto_86119 ) ) ( not ( = ?auto_86121 ?auto_86118 ) ) ( not ( = ?auto_86116 ?auto_86123 ) ) ( not ( = ?auto_86116 ?auto_86121 ) ) ( not ( = ?auto_86117 ?auto_86123 ) ) ( not ( = ?auto_86117 ?auto_86121 ) ) ( ON ?auto_86116 ?auto_86120 ) ( CLEAR ?auto_86116 ) ( not ( = ?auto_86116 ?auto_86120 ) ) ( not ( = ?auto_86117 ?auto_86120 ) ) ( not ( = ?auto_86118 ?auto_86120 ) ) ( not ( = ?auto_86119 ?auto_86120 ) ) ( not ( = ?auto_86122 ?auto_86120 ) ) ( not ( = ?auto_86123 ?auto_86120 ) ) ( not ( = ?auto_86121 ?auto_86120 ) ) ( HOLDING ?auto_86117 ) ( CLEAR ?auto_86118 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_86123 ?auto_86121 ?auto_86122 ?auto_86119 ?auto_86118 ?auto_86117 )
      ( MAKE-4PILE ?auto_86116 ?auto_86117 ?auto_86118 ?auto_86119 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86124 - BLOCK
      ?auto_86125 - BLOCK
      ?auto_86126 - BLOCK
      ?auto_86127 - BLOCK
    )
    :vars
    (
      ?auto_86129 - BLOCK
      ?auto_86130 - BLOCK
      ?auto_86128 - BLOCK
      ?auto_86131 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86124 ?auto_86125 ) ) ( not ( = ?auto_86124 ?auto_86126 ) ) ( not ( = ?auto_86124 ?auto_86127 ) ) ( not ( = ?auto_86125 ?auto_86126 ) ) ( not ( = ?auto_86125 ?auto_86127 ) ) ( not ( = ?auto_86126 ?auto_86127 ) ) ( ON ?auto_86127 ?auto_86129 ) ( not ( = ?auto_86124 ?auto_86129 ) ) ( not ( = ?auto_86125 ?auto_86129 ) ) ( not ( = ?auto_86126 ?auto_86129 ) ) ( not ( = ?auto_86127 ?auto_86129 ) ) ( ON ?auto_86126 ?auto_86127 ) ( ON-TABLE ?auto_86130 ) ( ON ?auto_86128 ?auto_86130 ) ( ON ?auto_86129 ?auto_86128 ) ( not ( = ?auto_86130 ?auto_86128 ) ) ( not ( = ?auto_86130 ?auto_86129 ) ) ( not ( = ?auto_86130 ?auto_86127 ) ) ( not ( = ?auto_86130 ?auto_86126 ) ) ( not ( = ?auto_86128 ?auto_86129 ) ) ( not ( = ?auto_86128 ?auto_86127 ) ) ( not ( = ?auto_86128 ?auto_86126 ) ) ( not ( = ?auto_86124 ?auto_86130 ) ) ( not ( = ?auto_86124 ?auto_86128 ) ) ( not ( = ?auto_86125 ?auto_86130 ) ) ( not ( = ?auto_86125 ?auto_86128 ) ) ( ON ?auto_86124 ?auto_86131 ) ( not ( = ?auto_86124 ?auto_86131 ) ) ( not ( = ?auto_86125 ?auto_86131 ) ) ( not ( = ?auto_86126 ?auto_86131 ) ) ( not ( = ?auto_86127 ?auto_86131 ) ) ( not ( = ?auto_86129 ?auto_86131 ) ) ( not ( = ?auto_86130 ?auto_86131 ) ) ( not ( = ?auto_86128 ?auto_86131 ) ) ( CLEAR ?auto_86126 ) ( ON ?auto_86125 ?auto_86124 ) ( CLEAR ?auto_86125 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_86131 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86131 ?auto_86124 )
      ( MAKE-4PILE ?auto_86124 ?auto_86125 ?auto_86126 ?auto_86127 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86132 - BLOCK
      ?auto_86133 - BLOCK
      ?auto_86134 - BLOCK
      ?auto_86135 - BLOCK
    )
    :vars
    (
      ?auto_86137 - BLOCK
      ?auto_86136 - BLOCK
      ?auto_86138 - BLOCK
      ?auto_86139 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86132 ?auto_86133 ) ) ( not ( = ?auto_86132 ?auto_86134 ) ) ( not ( = ?auto_86132 ?auto_86135 ) ) ( not ( = ?auto_86133 ?auto_86134 ) ) ( not ( = ?auto_86133 ?auto_86135 ) ) ( not ( = ?auto_86134 ?auto_86135 ) ) ( ON ?auto_86135 ?auto_86137 ) ( not ( = ?auto_86132 ?auto_86137 ) ) ( not ( = ?auto_86133 ?auto_86137 ) ) ( not ( = ?auto_86134 ?auto_86137 ) ) ( not ( = ?auto_86135 ?auto_86137 ) ) ( ON-TABLE ?auto_86136 ) ( ON ?auto_86138 ?auto_86136 ) ( ON ?auto_86137 ?auto_86138 ) ( not ( = ?auto_86136 ?auto_86138 ) ) ( not ( = ?auto_86136 ?auto_86137 ) ) ( not ( = ?auto_86136 ?auto_86135 ) ) ( not ( = ?auto_86136 ?auto_86134 ) ) ( not ( = ?auto_86138 ?auto_86137 ) ) ( not ( = ?auto_86138 ?auto_86135 ) ) ( not ( = ?auto_86138 ?auto_86134 ) ) ( not ( = ?auto_86132 ?auto_86136 ) ) ( not ( = ?auto_86132 ?auto_86138 ) ) ( not ( = ?auto_86133 ?auto_86136 ) ) ( not ( = ?auto_86133 ?auto_86138 ) ) ( ON ?auto_86132 ?auto_86139 ) ( not ( = ?auto_86132 ?auto_86139 ) ) ( not ( = ?auto_86133 ?auto_86139 ) ) ( not ( = ?auto_86134 ?auto_86139 ) ) ( not ( = ?auto_86135 ?auto_86139 ) ) ( not ( = ?auto_86137 ?auto_86139 ) ) ( not ( = ?auto_86136 ?auto_86139 ) ) ( not ( = ?auto_86138 ?auto_86139 ) ) ( ON ?auto_86133 ?auto_86132 ) ( CLEAR ?auto_86133 ) ( ON-TABLE ?auto_86139 ) ( HOLDING ?auto_86134 ) ( CLEAR ?auto_86135 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_86136 ?auto_86138 ?auto_86137 ?auto_86135 ?auto_86134 )
      ( MAKE-4PILE ?auto_86132 ?auto_86133 ?auto_86134 ?auto_86135 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86140 - BLOCK
      ?auto_86141 - BLOCK
      ?auto_86142 - BLOCK
      ?auto_86143 - BLOCK
    )
    :vars
    (
      ?auto_86147 - BLOCK
      ?auto_86146 - BLOCK
      ?auto_86144 - BLOCK
      ?auto_86145 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86140 ?auto_86141 ) ) ( not ( = ?auto_86140 ?auto_86142 ) ) ( not ( = ?auto_86140 ?auto_86143 ) ) ( not ( = ?auto_86141 ?auto_86142 ) ) ( not ( = ?auto_86141 ?auto_86143 ) ) ( not ( = ?auto_86142 ?auto_86143 ) ) ( ON ?auto_86143 ?auto_86147 ) ( not ( = ?auto_86140 ?auto_86147 ) ) ( not ( = ?auto_86141 ?auto_86147 ) ) ( not ( = ?auto_86142 ?auto_86147 ) ) ( not ( = ?auto_86143 ?auto_86147 ) ) ( ON-TABLE ?auto_86146 ) ( ON ?auto_86144 ?auto_86146 ) ( ON ?auto_86147 ?auto_86144 ) ( not ( = ?auto_86146 ?auto_86144 ) ) ( not ( = ?auto_86146 ?auto_86147 ) ) ( not ( = ?auto_86146 ?auto_86143 ) ) ( not ( = ?auto_86146 ?auto_86142 ) ) ( not ( = ?auto_86144 ?auto_86147 ) ) ( not ( = ?auto_86144 ?auto_86143 ) ) ( not ( = ?auto_86144 ?auto_86142 ) ) ( not ( = ?auto_86140 ?auto_86146 ) ) ( not ( = ?auto_86140 ?auto_86144 ) ) ( not ( = ?auto_86141 ?auto_86146 ) ) ( not ( = ?auto_86141 ?auto_86144 ) ) ( ON ?auto_86140 ?auto_86145 ) ( not ( = ?auto_86140 ?auto_86145 ) ) ( not ( = ?auto_86141 ?auto_86145 ) ) ( not ( = ?auto_86142 ?auto_86145 ) ) ( not ( = ?auto_86143 ?auto_86145 ) ) ( not ( = ?auto_86147 ?auto_86145 ) ) ( not ( = ?auto_86146 ?auto_86145 ) ) ( not ( = ?auto_86144 ?auto_86145 ) ) ( ON ?auto_86141 ?auto_86140 ) ( ON-TABLE ?auto_86145 ) ( CLEAR ?auto_86143 ) ( ON ?auto_86142 ?auto_86141 ) ( CLEAR ?auto_86142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86145 ?auto_86140 ?auto_86141 )
      ( MAKE-4PILE ?auto_86140 ?auto_86141 ?auto_86142 ?auto_86143 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86148 - BLOCK
      ?auto_86149 - BLOCK
      ?auto_86150 - BLOCK
      ?auto_86151 - BLOCK
    )
    :vars
    (
      ?auto_86152 - BLOCK
      ?auto_86155 - BLOCK
      ?auto_86154 - BLOCK
      ?auto_86153 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86148 ?auto_86149 ) ) ( not ( = ?auto_86148 ?auto_86150 ) ) ( not ( = ?auto_86148 ?auto_86151 ) ) ( not ( = ?auto_86149 ?auto_86150 ) ) ( not ( = ?auto_86149 ?auto_86151 ) ) ( not ( = ?auto_86150 ?auto_86151 ) ) ( not ( = ?auto_86148 ?auto_86152 ) ) ( not ( = ?auto_86149 ?auto_86152 ) ) ( not ( = ?auto_86150 ?auto_86152 ) ) ( not ( = ?auto_86151 ?auto_86152 ) ) ( ON-TABLE ?auto_86155 ) ( ON ?auto_86154 ?auto_86155 ) ( ON ?auto_86152 ?auto_86154 ) ( not ( = ?auto_86155 ?auto_86154 ) ) ( not ( = ?auto_86155 ?auto_86152 ) ) ( not ( = ?auto_86155 ?auto_86151 ) ) ( not ( = ?auto_86155 ?auto_86150 ) ) ( not ( = ?auto_86154 ?auto_86152 ) ) ( not ( = ?auto_86154 ?auto_86151 ) ) ( not ( = ?auto_86154 ?auto_86150 ) ) ( not ( = ?auto_86148 ?auto_86155 ) ) ( not ( = ?auto_86148 ?auto_86154 ) ) ( not ( = ?auto_86149 ?auto_86155 ) ) ( not ( = ?auto_86149 ?auto_86154 ) ) ( ON ?auto_86148 ?auto_86153 ) ( not ( = ?auto_86148 ?auto_86153 ) ) ( not ( = ?auto_86149 ?auto_86153 ) ) ( not ( = ?auto_86150 ?auto_86153 ) ) ( not ( = ?auto_86151 ?auto_86153 ) ) ( not ( = ?auto_86152 ?auto_86153 ) ) ( not ( = ?auto_86155 ?auto_86153 ) ) ( not ( = ?auto_86154 ?auto_86153 ) ) ( ON ?auto_86149 ?auto_86148 ) ( ON-TABLE ?auto_86153 ) ( ON ?auto_86150 ?auto_86149 ) ( CLEAR ?auto_86150 ) ( HOLDING ?auto_86151 ) ( CLEAR ?auto_86152 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86155 ?auto_86154 ?auto_86152 ?auto_86151 )
      ( MAKE-4PILE ?auto_86148 ?auto_86149 ?auto_86150 ?auto_86151 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86156 - BLOCK
      ?auto_86157 - BLOCK
      ?auto_86158 - BLOCK
      ?auto_86159 - BLOCK
    )
    :vars
    (
      ?auto_86162 - BLOCK
      ?auto_86161 - BLOCK
      ?auto_86163 - BLOCK
      ?auto_86160 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86156 ?auto_86157 ) ) ( not ( = ?auto_86156 ?auto_86158 ) ) ( not ( = ?auto_86156 ?auto_86159 ) ) ( not ( = ?auto_86157 ?auto_86158 ) ) ( not ( = ?auto_86157 ?auto_86159 ) ) ( not ( = ?auto_86158 ?auto_86159 ) ) ( not ( = ?auto_86156 ?auto_86162 ) ) ( not ( = ?auto_86157 ?auto_86162 ) ) ( not ( = ?auto_86158 ?auto_86162 ) ) ( not ( = ?auto_86159 ?auto_86162 ) ) ( ON-TABLE ?auto_86161 ) ( ON ?auto_86163 ?auto_86161 ) ( ON ?auto_86162 ?auto_86163 ) ( not ( = ?auto_86161 ?auto_86163 ) ) ( not ( = ?auto_86161 ?auto_86162 ) ) ( not ( = ?auto_86161 ?auto_86159 ) ) ( not ( = ?auto_86161 ?auto_86158 ) ) ( not ( = ?auto_86163 ?auto_86162 ) ) ( not ( = ?auto_86163 ?auto_86159 ) ) ( not ( = ?auto_86163 ?auto_86158 ) ) ( not ( = ?auto_86156 ?auto_86161 ) ) ( not ( = ?auto_86156 ?auto_86163 ) ) ( not ( = ?auto_86157 ?auto_86161 ) ) ( not ( = ?auto_86157 ?auto_86163 ) ) ( ON ?auto_86156 ?auto_86160 ) ( not ( = ?auto_86156 ?auto_86160 ) ) ( not ( = ?auto_86157 ?auto_86160 ) ) ( not ( = ?auto_86158 ?auto_86160 ) ) ( not ( = ?auto_86159 ?auto_86160 ) ) ( not ( = ?auto_86162 ?auto_86160 ) ) ( not ( = ?auto_86161 ?auto_86160 ) ) ( not ( = ?auto_86163 ?auto_86160 ) ) ( ON ?auto_86157 ?auto_86156 ) ( ON-TABLE ?auto_86160 ) ( ON ?auto_86158 ?auto_86157 ) ( CLEAR ?auto_86162 ) ( ON ?auto_86159 ?auto_86158 ) ( CLEAR ?auto_86159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86160 ?auto_86156 ?auto_86157 ?auto_86158 )
      ( MAKE-4PILE ?auto_86156 ?auto_86157 ?auto_86158 ?auto_86159 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86164 - BLOCK
      ?auto_86165 - BLOCK
      ?auto_86166 - BLOCK
      ?auto_86167 - BLOCK
    )
    :vars
    (
      ?auto_86171 - BLOCK
      ?auto_86169 - BLOCK
      ?auto_86170 - BLOCK
      ?auto_86168 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86164 ?auto_86165 ) ) ( not ( = ?auto_86164 ?auto_86166 ) ) ( not ( = ?auto_86164 ?auto_86167 ) ) ( not ( = ?auto_86165 ?auto_86166 ) ) ( not ( = ?auto_86165 ?auto_86167 ) ) ( not ( = ?auto_86166 ?auto_86167 ) ) ( not ( = ?auto_86164 ?auto_86171 ) ) ( not ( = ?auto_86165 ?auto_86171 ) ) ( not ( = ?auto_86166 ?auto_86171 ) ) ( not ( = ?auto_86167 ?auto_86171 ) ) ( ON-TABLE ?auto_86169 ) ( ON ?auto_86170 ?auto_86169 ) ( not ( = ?auto_86169 ?auto_86170 ) ) ( not ( = ?auto_86169 ?auto_86171 ) ) ( not ( = ?auto_86169 ?auto_86167 ) ) ( not ( = ?auto_86169 ?auto_86166 ) ) ( not ( = ?auto_86170 ?auto_86171 ) ) ( not ( = ?auto_86170 ?auto_86167 ) ) ( not ( = ?auto_86170 ?auto_86166 ) ) ( not ( = ?auto_86164 ?auto_86169 ) ) ( not ( = ?auto_86164 ?auto_86170 ) ) ( not ( = ?auto_86165 ?auto_86169 ) ) ( not ( = ?auto_86165 ?auto_86170 ) ) ( ON ?auto_86164 ?auto_86168 ) ( not ( = ?auto_86164 ?auto_86168 ) ) ( not ( = ?auto_86165 ?auto_86168 ) ) ( not ( = ?auto_86166 ?auto_86168 ) ) ( not ( = ?auto_86167 ?auto_86168 ) ) ( not ( = ?auto_86171 ?auto_86168 ) ) ( not ( = ?auto_86169 ?auto_86168 ) ) ( not ( = ?auto_86170 ?auto_86168 ) ) ( ON ?auto_86165 ?auto_86164 ) ( ON-TABLE ?auto_86168 ) ( ON ?auto_86166 ?auto_86165 ) ( ON ?auto_86167 ?auto_86166 ) ( CLEAR ?auto_86167 ) ( HOLDING ?auto_86171 ) ( CLEAR ?auto_86170 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86169 ?auto_86170 ?auto_86171 )
      ( MAKE-4PILE ?auto_86164 ?auto_86165 ?auto_86166 ?auto_86167 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86172 - BLOCK
      ?auto_86173 - BLOCK
      ?auto_86174 - BLOCK
      ?auto_86175 - BLOCK
    )
    :vars
    (
      ?auto_86178 - BLOCK
      ?auto_86179 - BLOCK
      ?auto_86176 - BLOCK
      ?auto_86177 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86172 ?auto_86173 ) ) ( not ( = ?auto_86172 ?auto_86174 ) ) ( not ( = ?auto_86172 ?auto_86175 ) ) ( not ( = ?auto_86173 ?auto_86174 ) ) ( not ( = ?auto_86173 ?auto_86175 ) ) ( not ( = ?auto_86174 ?auto_86175 ) ) ( not ( = ?auto_86172 ?auto_86178 ) ) ( not ( = ?auto_86173 ?auto_86178 ) ) ( not ( = ?auto_86174 ?auto_86178 ) ) ( not ( = ?auto_86175 ?auto_86178 ) ) ( ON-TABLE ?auto_86179 ) ( ON ?auto_86176 ?auto_86179 ) ( not ( = ?auto_86179 ?auto_86176 ) ) ( not ( = ?auto_86179 ?auto_86178 ) ) ( not ( = ?auto_86179 ?auto_86175 ) ) ( not ( = ?auto_86179 ?auto_86174 ) ) ( not ( = ?auto_86176 ?auto_86178 ) ) ( not ( = ?auto_86176 ?auto_86175 ) ) ( not ( = ?auto_86176 ?auto_86174 ) ) ( not ( = ?auto_86172 ?auto_86179 ) ) ( not ( = ?auto_86172 ?auto_86176 ) ) ( not ( = ?auto_86173 ?auto_86179 ) ) ( not ( = ?auto_86173 ?auto_86176 ) ) ( ON ?auto_86172 ?auto_86177 ) ( not ( = ?auto_86172 ?auto_86177 ) ) ( not ( = ?auto_86173 ?auto_86177 ) ) ( not ( = ?auto_86174 ?auto_86177 ) ) ( not ( = ?auto_86175 ?auto_86177 ) ) ( not ( = ?auto_86178 ?auto_86177 ) ) ( not ( = ?auto_86179 ?auto_86177 ) ) ( not ( = ?auto_86176 ?auto_86177 ) ) ( ON ?auto_86173 ?auto_86172 ) ( ON-TABLE ?auto_86177 ) ( ON ?auto_86174 ?auto_86173 ) ( ON ?auto_86175 ?auto_86174 ) ( CLEAR ?auto_86176 ) ( ON ?auto_86178 ?auto_86175 ) ( CLEAR ?auto_86178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_86177 ?auto_86172 ?auto_86173 ?auto_86174 ?auto_86175 )
      ( MAKE-4PILE ?auto_86172 ?auto_86173 ?auto_86174 ?auto_86175 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86180 - BLOCK
      ?auto_86181 - BLOCK
      ?auto_86182 - BLOCK
      ?auto_86183 - BLOCK
    )
    :vars
    (
      ?auto_86186 - BLOCK
      ?auto_86184 - BLOCK
      ?auto_86187 - BLOCK
      ?auto_86185 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86180 ?auto_86181 ) ) ( not ( = ?auto_86180 ?auto_86182 ) ) ( not ( = ?auto_86180 ?auto_86183 ) ) ( not ( = ?auto_86181 ?auto_86182 ) ) ( not ( = ?auto_86181 ?auto_86183 ) ) ( not ( = ?auto_86182 ?auto_86183 ) ) ( not ( = ?auto_86180 ?auto_86186 ) ) ( not ( = ?auto_86181 ?auto_86186 ) ) ( not ( = ?auto_86182 ?auto_86186 ) ) ( not ( = ?auto_86183 ?auto_86186 ) ) ( ON-TABLE ?auto_86184 ) ( not ( = ?auto_86184 ?auto_86187 ) ) ( not ( = ?auto_86184 ?auto_86186 ) ) ( not ( = ?auto_86184 ?auto_86183 ) ) ( not ( = ?auto_86184 ?auto_86182 ) ) ( not ( = ?auto_86187 ?auto_86186 ) ) ( not ( = ?auto_86187 ?auto_86183 ) ) ( not ( = ?auto_86187 ?auto_86182 ) ) ( not ( = ?auto_86180 ?auto_86184 ) ) ( not ( = ?auto_86180 ?auto_86187 ) ) ( not ( = ?auto_86181 ?auto_86184 ) ) ( not ( = ?auto_86181 ?auto_86187 ) ) ( ON ?auto_86180 ?auto_86185 ) ( not ( = ?auto_86180 ?auto_86185 ) ) ( not ( = ?auto_86181 ?auto_86185 ) ) ( not ( = ?auto_86182 ?auto_86185 ) ) ( not ( = ?auto_86183 ?auto_86185 ) ) ( not ( = ?auto_86186 ?auto_86185 ) ) ( not ( = ?auto_86184 ?auto_86185 ) ) ( not ( = ?auto_86187 ?auto_86185 ) ) ( ON ?auto_86181 ?auto_86180 ) ( ON-TABLE ?auto_86185 ) ( ON ?auto_86182 ?auto_86181 ) ( ON ?auto_86183 ?auto_86182 ) ( ON ?auto_86186 ?auto_86183 ) ( CLEAR ?auto_86186 ) ( HOLDING ?auto_86187 ) ( CLEAR ?auto_86184 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86184 ?auto_86187 )
      ( MAKE-4PILE ?auto_86180 ?auto_86181 ?auto_86182 ?auto_86183 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86188 - BLOCK
      ?auto_86189 - BLOCK
      ?auto_86190 - BLOCK
      ?auto_86191 - BLOCK
    )
    :vars
    (
      ?auto_86195 - BLOCK
      ?auto_86192 - BLOCK
      ?auto_86194 - BLOCK
      ?auto_86193 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86188 ?auto_86189 ) ) ( not ( = ?auto_86188 ?auto_86190 ) ) ( not ( = ?auto_86188 ?auto_86191 ) ) ( not ( = ?auto_86189 ?auto_86190 ) ) ( not ( = ?auto_86189 ?auto_86191 ) ) ( not ( = ?auto_86190 ?auto_86191 ) ) ( not ( = ?auto_86188 ?auto_86195 ) ) ( not ( = ?auto_86189 ?auto_86195 ) ) ( not ( = ?auto_86190 ?auto_86195 ) ) ( not ( = ?auto_86191 ?auto_86195 ) ) ( ON-TABLE ?auto_86192 ) ( not ( = ?auto_86192 ?auto_86194 ) ) ( not ( = ?auto_86192 ?auto_86195 ) ) ( not ( = ?auto_86192 ?auto_86191 ) ) ( not ( = ?auto_86192 ?auto_86190 ) ) ( not ( = ?auto_86194 ?auto_86195 ) ) ( not ( = ?auto_86194 ?auto_86191 ) ) ( not ( = ?auto_86194 ?auto_86190 ) ) ( not ( = ?auto_86188 ?auto_86192 ) ) ( not ( = ?auto_86188 ?auto_86194 ) ) ( not ( = ?auto_86189 ?auto_86192 ) ) ( not ( = ?auto_86189 ?auto_86194 ) ) ( ON ?auto_86188 ?auto_86193 ) ( not ( = ?auto_86188 ?auto_86193 ) ) ( not ( = ?auto_86189 ?auto_86193 ) ) ( not ( = ?auto_86190 ?auto_86193 ) ) ( not ( = ?auto_86191 ?auto_86193 ) ) ( not ( = ?auto_86195 ?auto_86193 ) ) ( not ( = ?auto_86192 ?auto_86193 ) ) ( not ( = ?auto_86194 ?auto_86193 ) ) ( ON ?auto_86189 ?auto_86188 ) ( ON-TABLE ?auto_86193 ) ( ON ?auto_86190 ?auto_86189 ) ( ON ?auto_86191 ?auto_86190 ) ( ON ?auto_86195 ?auto_86191 ) ( CLEAR ?auto_86192 ) ( ON ?auto_86194 ?auto_86195 ) ( CLEAR ?auto_86194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_86193 ?auto_86188 ?auto_86189 ?auto_86190 ?auto_86191 ?auto_86195 )
      ( MAKE-4PILE ?auto_86188 ?auto_86189 ?auto_86190 ?auto_86191 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86196 - BLOCK
      ?auto_86197 - BLOCK
      ?auto_86198 - BLOCK
      ?auto_86199 - BLOCK
    )
    :vars
    (
      ?auto_86202 - BLOCK
      ?auto_86200 - BLOCK
      ?auto_86201 - BLOCK
      ?auto_86203 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86196 ?auto_86197 ) ) ( not ( = ?auto_86196 ?auto_86198 ) ) ( not ( = ?auto_86196 ?auto_86199 ) ) ( not ( = ?auto_86197 ?auto_86198 ) ) ( not ( = ?auto_86197 ?auto_86199 ) ) ( not ( = ?auto_86198 ?auto_86199 ) ) ( not ( = ?auto_86196 ?auto_86202 ) ) ( not ( = ?auto_86197 ?auto_86202 ) ) ( not ( = ?auto_86198 ?auto_86202 ) ) ( not ( = ?auto_86199 ?auto_86202 ) ) ( not ( = ?auto_86200 ?auto_86201 ) ) ( not ( = ?auto_86200 ?auto_86202 ) ) ( not ( = ?auto_86200 ?auto_86199 ) ) ( not ( = ?auto_86200 ?auto_86198 ) ) ( not ( = ?auto_86201 ?auto_86202 ) ) ( not ( = ?auto_86201 ?auto_86199 ) ) ( not ( = ?auto_86201 ?auto_86198 ) ) ( not ( = ?auto_86196 ?auto_86200 ) ) ( not ( = ?auto_86196 ?auto_86201 ) ) ( not ( = ?auto_86197 ?auto_86200 ) ) ( not ( = ?auto_86197 ?auto_86201 ) ) ( ON ?auto_86196 ?auto_86203 ) ( not ( = ?auto_86196 ?auto_86203 ) ) ( not ( = ?auto_86197 ?auto_86203 ) ) ( not ( = ?auto_86198 ?auto_86203 ) ) ( not ( = ?auto_86199 ?auto_86203 ) ) ( not ( = ?auto_86202 ?auto_86203 ) ) ( not ( = ?auto_86200 ?auto_86203 ) ) ( not ( = ?auto_86201 ?auto_86203 ) ) ( ON ?auto_86197 ?auto_86196 ) ( ON-TABLE ?auto_86203 ) ( ON ?auto_86198 ?auto_86197 ) ( ON ?auto_86199 ?auto_86198 ) ( ON ?auto_86202 ?auto_86199 ) ( ON ?auto_86201 ?auto_86202 ) ( CLEAR ?auto_86201 ) ( HOLDING ?auto_86200 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_86200 )
      ( MAKE-4PILE ?auto_86196 ?auto_86197 ?auto_86198 ?auto_86199 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86204 - BLOCK
      ?auto_86205 - BLOCK
      ?auto_86206 - BLOCK
      ?auto_86207 - BLOCK
    )
    :vars
    (
      ?auto_86211 - BLOCK
      ?auto_86209 - BLOCK
      ?auto_86208 - BLOCK
      ?auto_86210 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86204 ?auto_86205 ) ) ( not ( = ?auto_86204 ?auto_86206 ) ) ( not ( = ?auto_86204 ?auto_86207 ) ) ( not ( = ?auto_86205 ?auto_86206 ) ) ( not ( = ?auto_86205 ?auto_86207 ) ) ( not ( = ?auto_86206 ?auto_86207 ) ) ( not ( = ?auto_86204 ?auto_86211 ) ) ( not ( = ?auto_86205 ?auto_86211 ) ) ( not ( = ?auto_86206 ?auto_86211 ) ) ( not ( = ?auto_86207 ?auto_86211 ) ) ( not ( = ?auto_86209 ?auto_86208 ) ) ( not ( = ?auto_86209 ?auto_86211 ) ) ( not ( = ?auto_86209 ?auto_86207 ) ) ( not ( = ?auto_86209 ?auto_86206 ) ) ( not ( = ?auto_86208 ?auto_86211 ) ) ( not ( = ?auto_86208 ?auto_86207 ) ) ( not ( = ?auto_86208 ?auto_86206 ) ) ( not ( = ?auto_86204 ?auto_86209 ) ) ( not ( = ?auto_86204 ?auto_86208 ) ) ( not ( = ?auto_86205 ?auto_86209 ) ) ( not ( = ?auto_86205 ?auto_86208 ) ) ( ON ?auto_86204 ?auto_86210 ) ( not ( = ?auto_86204 ?auto_86210 ) ) ( not ( = ?auto_86205 ?auto_86210 ) ) ( not ( = ?auto_86206 ?auto_86210 ) ) ( not ( = ?auto_86207 ?auto_86210 ) ) ( not ( = ?auto_86211 ?auto_86210 ) ) ( not ( = ?auto_86209 ?auto_86210 ) ) ( not ( = ?auto_86208 ?auto_86210 ) ) ( ON ?auto_86205 ?auto_86204 ) ( ON-TABLE ?auto_86210 ) ( ON ?auto_86206 ?auto_86205 ) ( ON ?auto_86207 ?auto_86206 ) ( ON ?auto_86211 ?auto_86207 ) ( ON ?auto_86208 ?auto_86211 ) ( ON ?auto_86209 ?auto_86208 ) ( CLEAR ?auto_86209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_86210 ?auto_86204 ?auto_86205 ?auto_86206 ?auto_86207 ?auto_86211 ?auto_86208 )
      ( MAKE-4PILE ?auto_86204 ?auto_86205 ?auto_86206 ?auto_86207 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_86214 - BLOCK
      ?auto_86215 - BLOCK
    )
    :vars
    (
      ?auto_86216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86216 ?auto_86215 ) ( CLEAR ?auto_86216 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_86214 ) ( ON ?auto_86215 ?auto_86214 ) ( not ( = ?auto_86214 ?auto_86215 ) ) ( not ( = ?auto_86214 ?auto_86216 ) ) ( not ( = ?auto_86215 ?auto_86216 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_86216 ?auto_86215 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_86217 - BLOCK
      ?auto_86218 - BLOCK
    )
    :vars
    (
      ?auto_86219 - BLOCK
      ?auto_86220 - BLOCK
      ?auto_86221 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86219 ?auto_86218 ) ( CLEAR ?auto_86219 ) ( ON-TABLE ?auto_86217 ) ( ON ?auto_86218 ?auto_86217 ) ( not ( = ?auto_86217 ?auto_86218 ) ) ( not ( = ?auto_86217 ?auto_86219 ) ) ( not ( = ?auto_86218 ?auto_86219 ) ) ( HOLDING ?auto_86220 ) ( CLEAR ?auto_86221 ) ( not ( = ?auto_86217 ?auto_86220 ) ) ( not ( = ?auto_86217 ?auto_86221 ) ) ( not ( = ?auto_86218 ?auto_86220 ) ) ( not ( = ?auto_86218 ?auto_86221 ) ) ( not ( = ?auto_86219 ?auto_86220 ) ) ( not ( = ?auto_86219 ?auto_86221 ) ) ( not ( = ?auto_86220 ?auto_86221 ) ) )
    :subtasks
    ( ( !STACK ?auto_86220 ?auto_86221 )
      ( MAKE-2PILE ?auto_86217 ?auto_86218 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_86222 - BLOCK
      ?auto_86223 - BLOCK
    )
    :vars
    (
      ?auto_86226 - BLOCK
      ?auto_86224 - BLOCK
      ?auto_86225 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86226 ?auto_86223 ) ( ON-TABLE ?auto_86222 ) ( ON ?auto_86223 ?auto_86222 ) ( not ( = ?auto_86222 ?auto_86223 ) ) ( not ( = ?auto_86222 ?auto_86226 ) ) ( not ( = ?auto_86223 ?auto_86226 ) ) ( CLEAR ?auto_86224 ) ( not ( = ?auto_86222 ?auto_86225 ) ) ( not ( = ?auto_86222 ?auto_86224 ) ) ( not ( = ?auto_86223 ?auto_86225 ) ) ( not ( = ?auto_86223 ?auto_86224 ) ) ( not ( = ?auto_86226 ?auto_86225 ) ) ( not ( = ?auto_86226 ?auto_86224 ) ) ( not ( = ?auto_86225 ?auto_86224 ) ) ( ON ?auto_86225 ?auto_86226 ) ( CLEAR ?auto_86225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86222 ?auto_86223 ?auto_86226 )
      ( MAKE-2PILE ?auto_86222 ?auto_86223 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_86227 - BLOCK
      ?auto_86228 - BLOCK
    )
    :vars
    (
      ?auto_86229 - BLOCK
      ?auto_86231 - BLOCK
      ?auto_86230 - BLOCK
      ?auto_86232 - BLOCK
      ?auto_86233 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86229 ?auto_86228 ) ( ON-TABLE ?auto_86227 ) ( ON ?auto_86228 ?auto_86227 ) ( not ( = ?auto_86227 ?auto_86228 ) ) ( not ( = ?auto_86227 ?auto_86229 ) ) ( not ( = ?auto_86228 ?auto_86229 ) ) ( not ( = ?auto_86227 ?auto_86231 ) ) ( not ( = ?auto_86227 ?auto_86230 ) ) ( not ( = ?auto_86228 ?auto_86231 ) ) ( not ( = ?auto_86228 ?auto_86230 ) ) ( not ( = ?auto_86229 ?auto_86231 ) ) ( not ( = ?auto_86229 ?auto_86230 ) ) ( not ( = ?auto_86231 ?auto_86230 ) ) ( ON ?auto_86231 ?auto_86229 ) ( CLEAR ?auto_86231 ) ( HOLDING ?auto_86230 ) ( CLEAR ?auto_86232 ) ( ON-TABLE ?auto_86233 ) ( ON ?auto_86232 ?auto_86233 ) ( not ( = ?auto_86233 ?auto_86232 ) ) ( not ( = ?auto_86233 ?auto_86230 ) ) ( not ( = ?auto_86232 ?auto_86230 ) ) ( not ( = ?auto_86227 ?auto_86232 ) ) ( not ( = ?auto_86227 ?auto_86233 ) ) ( not ( = ?auto_86228 ?auto_86232 ) ) ( not ( = ?auto_86228 ?auto_86233 ) ) ( not ( = ?auto_86229 ?auto_86232 ) ) ( not ( = ?auto_86229 ?auto_86233 ) ) ( not ( = ?auto_86231 ?auto_86232 ) ) ( not ( = ?auto_86231 ?auto_86233 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86233 ?auto_86232 ?auto_86230 )
      ( MAKE-2PILE ?auto_86227 ?auto_86228 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_86234 - BLOCK
      ?auto_86235 - BLOCK
    )
    :vars
    (
      ?auto_86240 - BLOCK
      ?auto_86238 - BLOCK
      ?auto_86239 - BLOCK
      ?auto_86236 - BLOCK
      ?auto_86237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86240 ?auto_86235 ) ( ON-TABLE ?auto_86234 ) ( ON ?auto_86235 ?auto_86234 ) ( not ( = ?auto_86234 ?auto_86235 ) ) ( not ( = ?auto_86234 ?auto_86240 ) ) ( not ( = ?auto_86235 ?auto_86240 ) ) ( not ( = ?auto_86234 ?auto_86238 ) ) ( not ( = ?auto_86234 ?auto_86239 ) ) ( not ( = ?auto_86235 ?auto_86238 ) ) ( not ( = ?auto_86235 ?auto_86239 ) ) ( not ( = ?auto_86240 ?auto_86238 ) ) ( not ( = ?auto_86240 ?auto_86239 ) ) ( not ( = ?auto_86238 ?auto_86239 ) ) ( ON ?auto_86238 ?auto_86240 ) ( CLEAR ?auto_86236 ) ( ON-TABLE ?auto_86237 ) ( ON ?auto_86236 ?auto_86237 ) ( not ( = ?auto_86237 ?auto_86236 ) ) ( not ( = ?auto_86237 ?auto_86239 ) ) ( not ( = ?auto_86236 ?auto_86239 ) ) ( not ( = ?auto_86234 ?auto_86236 ) ) ( not ( = ?auto_86234 ?auto_86237 ) ) ( not ( = ?auto_86235 ?auto_86236 ) ) ( not ( = ?auto_86235 ?auto_86237 ) ) ( not ( = ?auto_86240 ?auto_86236 ) ) ( not ( = ?auto_86240 ?auto_86237 ) ) ( not ( = ?auto_86238 ?auto_86236 ) ) ( not ( = ?auto_86238 ?auto_86237 ) ) ( ON ?auto_86239 ?auto_86238 ) ( CLEAR ?auto_86239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86234 ?auto_86235 ?auto_86240 ?auto_86238 )
      ( MAKE-2PILE ?auto_86234 ?auto_86235 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_86241 - BLOCK
      ?auto_86242 - BLOCK
    )
    :vars
    (
      ?auto_86244 - BLOCK
      ?auto_86243 - BLOCK
      ?auto_86246 - BLOCK
      ?auto_86247 - BLOCK
      ?auto_86245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86244 ?auto_86242 ) ( ON-TABLE ?auto_86241 ) ( ON ?auto_86242 ?auto_86241 ) ( not ( = ?auto_86241 ?auto_86242 ) ) ( not ( = ?auto_86241 ?auto_86244 ) ) ( not ( = ?auto_86242 ?auto_86244 ) ) ( not ( = ?auto_86241 ?auto_86243 ) ) ( not ( = ?auto_86241 ?auto_86246 ) ) ( not ( = ?auto_86242 ?auto_86243 ) ) ( not ( = ?auto_86242 ?auto_86246 ) ) ( not ( = ?auto_86244 ?auto_86243 ) ) ( not ( = ?auto_86244 ?auto_86246 ) ) ( not ( = ?auto_86243 ?auto_86246 ) ) ( ON ?auto_86243 ?auto_86244 ) ( ON-TABLE ?auto_86247 ) ( not ( = ?auto_86247 ?auto_86245 ) ) ( not ( = ?auto_86247 ?auto_86246 ) ) ( not ( = ?auto_86245 ?auto_86246 ) ) ( not ( = ?auto_86241 ?auto_86245 ) ) ( not ( = ?auto_86241 ?auto_86247 ) ) ( not ( = ?auto_86242 ?auto_86245 ) ) ( not ( = ?auto_86242 ?auto_86247 ) ) ( not ( = ?auto_86244 ?auto_86245 ) ) ( not ( = ?auto_86244 ?auto_86247 ) ) ( not ( = ?auto_86243 ?auto_86245 ) ) ( not ( = ?auto_86243 ?auto_86247 ) ) ( ON ?auto_86246 ?auto_86243 ) ( CLEAR ?auto_86246 ) ( HOLDING ?auto_86245 ) ( CLEAR ?auto_86247 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86247 ?auto_86245 )
      ( MAKE-2PILE ?auto_86241 ?auto_86242 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_86248 - BLOCK
      ?auto_86249 - BLOCK
    )
    :vars
    (
      ?auto_86254 - BLOCK
      ?auto_86250 - BLOCK
      ?auto_86251 - BLOCK
      ?auto_86252 - BLOCK
      ?auto_86253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86254 ?auto_86249 ) ( ON-TABLE ?auto_86248 ) ( ON ?auto_86249 ?auto_86248 ) ( not ( = ?auto_86248 ?auto_86249 ) ) ( not ( = ?auto_86248 ?auto_86254 ) ) ( not ( = ?auto_86249 ?auto_86254 ) ) ( not ( = ?auto_86248 ?auto_86250 ) ) ( not ( = ?auto_86248 ?auto_86251 ) ) ( not ( = ?auto_86249 ?auto_86250 ) ) ( not ( = ?auto_86249 ?auto_86251 ) ) ( not ( = ?auto_86254 ?auto_86250 ) ) ( not ( = ?auto_86254 ?auto_86251 ) ) ( not ( = ?auto_86250 ?auto_86251 ) ) ( ON ?auto_86250 ?auto_86254 ) ( ON-TABLE ?auto_86252 ) ( not ( = ?auto_86252 ?auto_86253 ) ) ( not ( = ?auto_86252 ?auto_86251 ) ) ( not ( = ?auto_86253 ?auto_86251 ) ) ( not ( = ?auto_86248 ?auto_86253 ) ) ( not ( = ?auto_86248 ?auto_86252 ) ) ( not ( = ?auto_86249 ?auto_86253 ) ) ( not ( = ?auto_86249 ?auto_86252 ) ) ( not ( = ?auto_86254 ?auto_86253 ) ) ( not ( = ?auto_86254 ?auto_86252 ) ) ( not ( = ?auto_86250 ?auto_86253 ) ) ( not ( = ?auto_86250 ?auto_86252 ) ) ( ON ?auto_86251 ?auto_86250 ) ( CLEAR ?auto_86252 ) ( ON ?auto_86253 ?auto_86251 ) ( CLEAR ?auto_86253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_86248 ?auto_86249 ?auto_86254 ?auto_86250 ?auto_86251 )
      ( MAKE-2PILE ?auto_86248 ?auto_86249 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_86255 - BLOCK
      ?auto_86256 - BLOCK
    )
    :vars
    (
      ?auto_86259 - BLOCK
      ?auto_86261 - BLOCK
      ?auto_86260 - BLOCK
      ?auto_86258 - BLOCK
      ?auto_86257 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86259 ?auto_86256 ) ( ON-TABLE ?auto_86255 ) ( ON ?auto_86256 ?auto_86255 ) ( not ( = ?auto_86255 ?auto_86256 ) ) ( not ( = ?auto_86255 ?auto_86259 ) ) ( not ( = ?auto_86256 ?auto_86259 ) ) ( not ( = ?auto_86255 ?auto_86261 ) ) ( not ( = ?auto_86255 ?auto_86260 ) ) ( not ( = ?auto_86256 ?auto_86261 ) ) ( not ( = ?auto_86256 ?auto_86260 ) ) ( not ( = ?auto_86259 ?auto_86261 ) ) ( not ( = ?auto_86259 ?auto_86260 ) ) ( not ( = ?auto_86261 ?auto_86260 ) ) ( ON ?auto_86261 ?auto_86259 ) ( not ( = ?auto_86258 ?auto_86257 ) ) ( not ( = ?auto_86258 ?auto_86260 ) ) ( not ( = ?auto_86257 ?auto_86260 ) ) ( not ( = ?auto_86255 ?auto_86257 ) ) ( not ( = ?auto_86255 ?auto_86258 ) ) ( not ( = ?auto_86256 ?auto_86257 ) ) ( not ( = ?auto_86256 ?auto_86258 ) ) ( not ( = ?auto_86259 ?auto_86257 ) ) ( not ( = ?auto_86259 ?auto_86258 ) ) ( not ( = ?auto_86261 ?auto_86257 ) ) ( not ( = ?auto_86261 ?auto_86258 ) ) ( ON ?auto_86260 ?auto_86261 ) ( ON ?auto_86257 ?auto_86260 ) ( CLEAR ?auto_86257 ) ( HOLDING ?auto_86258 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_86258 )
      ( MAKE-2PILE ?auto_86255 ?auto_86256 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_86262 - BLOCK
      ?auto_86263 - BLOCK
    )
    :vars
    (
      ?auto_86264 - BLOCK
      ?auto_86267 - BLOCK
      ?auto_86268 - BLOCK
      ?auto_86265 - BLOCK
      ?auto_86266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86264 ?auto_86263 ) ( ON-TABLE ?auto_86262 ) ( ON ?auto_86263 ?auto_86262 ) ( not ( = ?auto_86262 ?auto_86263 ) ) ( not ( = ?auto_86262 ?auto_86264 ) ) ( not ( = ?auto_86263 ?auto_86264 ) ) ( not ( = ?auto_86262 ?auto_86267 ) ) ( not ( = ?auto_86262 ?auto_86268 ) ) ( not ( = ?auto_86263 ?auto_86267 ) ) ( not ( = ?auto_86263 ?auto_86268 ) ) ( not ( = ?auto_86264 ?auto_86267 ) ) ( not ( = ?auto_86264 ?auto_86268 ) ) ( not ( = ?auto_86267 ?auto_86268 ) ) ( ON ?auto_86267 ?auto_86264 ) ( not ( = ?auto_86265 ?auto_86266 ) ) ( not ( = ?auto_86265 ?auto_86268 ) ) ( not ( = ?auto_86266 ?auto_86268 ) ) ( not ( = ?auto_86262 ?auto_86266 ) ) ( not ( = ?auto_86262 ?auto_86265 ) ) ( not ( = ?auto_86263 ?auto_86266 ) ) ( not ( = ?auto_86263 ?auto_86265 ) ) ( not ( = ?auto_86264 ?auto_86266 ) ) ( not ( = ?auto_86264 ?auto_86265 ) ) ( not ( = ?auto_86267 ?auto_86266 ) ) ( not ( = ?auto_86267 ?auto_86265 ) ) ( ON ?auto_86268 ?auto_86267 ) ( ON ?auto_86266 ?auto_86268 ) ( ON ?auto_86265 ?auto_86266 ) ( CLEAR ?auto_86265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_86262 ?auto_86263 ?auto_86264 ?auto_86267 ?auto_86268 ?auto_86266 )
      ( MAKE-2PILE ?auto_86262 ?auto_86263 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_86269 - BLOCK
      ?auto_86270 - BLOCK
    )
    :vars
    (
      ?auto_86275 - BLOCK
      ?auto_86274 - BLOCK
      ?auto_86273 - BLOCK
      ?auto_86271 - BLOCK
      ?auto_86272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86275 ?auto_86270 ) ( ON-TABLE ?auto_86269 ) ( ON ?auto_86270 ?auto_86269 ) ( not ( = ?auto_86269 ?auto_86270 ) ) ( not ( = ?auto_86269 ?auto_86275 ) ) ( not ( = ?auto_86270 ?auto_86275 ) ) ( not ( = ?auto_86269 ?auto_86274 ) ) ( not ( = ?auto_86269 ?auto_86273 ) ) ( not ( = ?auto_86270 ?auto_86274 ) ) ( not ( = ?auto_86270 ?auto_86273 ) ) ( not ( = ?auto_86275 ?auto_86274 ) ) ( not ( = ?auto_86275 ?auto_86273 ) ) ( not ( = ?auto_86274 ?auto_86273 ) ) ( ON ?auto_86274 ?auto_86275 ) ( not ( = ?auto_86271 ?auto_86272 ) ) ( not ( = ?auto_86271 ?auto_86273 ) ) ( not ( = ?auto_86272 ?auto_86273 ) ) ( not ( = ?auto_86269 ?auto_86272 ) ) ( not ( = ?auto_86269 ?auto_86271 ) ) ( not ( = ?auto_86270 ?auto_86272 ) ) ( not ( = ?auto_86270 ?auto_86271 ) ) ( not ( = ?auto_86275 ?auto_86272 ) ) ( not ( = ?auto_86275 ?auto_86271 ) ) ( not ( = ?auto_86274 ?auto_86272 ) ) ( not ( = ?auto_86274 ?auto_86271 ) ) ( ON ?auto_86273 ?auto_86274 ) ( ON ?auto_86272 ?auto_86273 ) ( HOLDING ?auto_86271 ) ( CLEAR ?auto_86272 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_86269 ?auto_86270 ?auto_86275 ?auto_86274 ?auto_86273 ?auto_86272 ?auto_86271 )
      ( MAKE-2PILE ?auto_86269 ?auto_86270 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_86276 - BLOCK
      ?auto_86277 - BLOCK
    )
    :vars
    (
      ?auto_86282 - BLOCK
      ?auto_86279 - BLOCK
      ?auto_86280 - BLOCK
      ?auto_86278 - BLOCK
      ?auto_86281 - BLOCK
      ?auto_86283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86282 ?auto_86277 ) ( ON-TABLE ?auto_86276 ) ( ON ?auto_86277 ?auto_86276 ) ( not ( = ?auto_86276 ?auto_86277 ) ) ( not ( = ?auto_86276 ?auto_86282 ) ) ( not ( = ?auto_86277 ?auto_86282 ) ) ( not ( = ?auto_86276 ?auto_86279 ) ) ( not ( = ?auto_86276 ?auto_86280 ) ) ( not ( = ?auto_86277 ?auto_86279 ) ) ( not ( = ?auto_86277 ?auto_86280 ) ) ( not ( = ?auto_86282 ?auto_86279 ) ) ( not ( = ?auto_86282 ?auto_86280 ) ) ( not ( = ?auto_86279 ?auto_86280 ) ) ( ON ?auto_86279 ?auto_86282 ) ( not ( = ?auto_86278 ?auto_86281 ) ) ( not ( = ?auto_86278 ?auto_86280 ) ) ( not ( = ?auto_86281 ?auto_86280 ) ) ( not ( = ?auto_86276 ?auto_86281 ) ) ( not ( = ?auto_86276 ?auto_86278 ) ) ( not ( = ?auto_86277 ?auto_86281 ) ) ( not ( = ?auto_86277 ?auto_86278 ) ) ( not ( = ?auto_86282 ?auto_86281 ) ) ( not ( = ?auto_86282 ?auto_86278 ) ) ( not ( = ?auto_86279 ?auto_86281 ) ) ( not ( = ?auto_86279 ?auto_86278 ) ) ( ON ?auto_86280 ?auto_86279 ) ( ON ?auto_86281 ?auto_86280 ) ( CLEAR ?auto_86281 ) ( ON ?auto_86278 ?auto_86283 ) ( CLEAR ?auto_86278 ) ( HAND-EMPTY ) ( not ( = ?auto_86276 ?auto_86283 ) ) ( not ( = ?auto_86277 ?auto_86283 ) ) ( not ( = ?auto_86282 ?auto_86283 ) ) ( not ( = ?auto_86279 ?auto_86283 ) ) ( not ( = ?auto_86280 ?auto_86283 ) ) ( not ( = ?auto_86278 ?auto_86283 ) ) ( not ( = ?auto_86281 ?auto_86283 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_86278 ?auto_86283 )
      ( MAKE-2PILE ?auto_86276 ?auto_86277 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_86284 - BLOCK
      ?auto_86285 - BLOCK
    )
    :vars
    (
      ?auto_86289 - BLOCK
      ?auto_86291 - BLOCK
      ?auto_86288 - BLOCK
      ?auto_86290 - BLOCK
      ?auto_86286 - BLOCK
      ?auto_86287 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86289 ?auto_86285 ) ( ON-TABLE ?auto_86284 ) ( ON ?auto_86285 ?auto_86284 ) ( not ( = ?auto_86284 ?auto_86285 ) ) ( not ( = ?auto_86284 ?auto_86289 ) ) ( not ( = ?auto_86285 ?auto_86289 ) ) ( not ( = ?auto_86284 ?auto_86291 ) ) ( not ( = ?auto_86284 ?auto_86288 ) ) ( not ( = ?auto_86285 ?auto_86291 ) ) ( not ( = ?auto_86285 ?auto_86288 ) ) ( not ( = ?auto_86289 ?auto_86291 ) ) ( not ( = ?auto_86289 ?auto_86288 ) ) ( not ( = ?auto_86291 ?auto_86288 ) ) ( ON ?auto_86291 ?auto_86289 ) ( not ( = ?auto_86290 ?auto_86286 ) ) ( not ( = ?auto_86290 ?auto_86288 ) ) ( not ( = ?auto_86286 ?auto_86288 ) ) ( not ( = ?auto_86284 ?auto_86286 ) ) ( not ( = ?auto_86284 ?auto_86290 ) ) ( not ( = ?auto_86285 ?auto_86286 ) ) ( not ( = ?auto_86285 ?auto_86290 ) ) ( not ( = ?auto_86289 ?auto_86286 ) ) ( not ( = ?auto_86289 ?auto_86290 ) ) ( not ( = ?auto_86291 ?auto_86286 ) ) ( not ( = ?auto_86291 ?auto_86290 ) ) ( ON ?auto_86288 ?auto_86291 ) ( ON ?auto_86290 ?auto_86287 ) ( CLEAR ?auto_86290 ) ( not ( = ?auto_86284 ?auto_86287 ) ) ( not ( = ?auto_86285 ?auto_86287 ) ) ( not ( = ?auto_86289 ?auto_86287 ) ) ( not ( = ?auto_86291 ?auto_86287 ) ) ( not ( = ?auto_86288 ?auto_86287 ) ) ( not ( = ?auto_86290 ?auto_86287 ) ) ( not ( = ?auto_86286 ?auto_86287 ) ) ( HOLDING ?auto_86286 ) ( CLEAR ?auto_86288 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_86284 ?auto_86285 ?auto_86289 ?auto_86291 ?auto_86288 ?auto_86286 )
      ( MAKE-2PILE ?auto_86284 ?auto_86285 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_86292 - BLOCK
      ?auto_86293 - BLOCK
    )
    :vars
    (
      ?auto_86297 - BLOCK
      ?auto_86295 - BLOCK
      ?auto_86296 - BLOCK
      ?auto_86294 - BLOCK
      ?auto_86299 - BLOCK
      ?auto_86298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86297 ?auto_86293 ) ( ON-TABLE ?auto_86292 ) ( ON ?auto_86293 ?auto_86292 ) ( not ( = ?auto_86292 ?auto_86293 ) ) ( not ( = ?auto_86292 ?auto_86297 ) ) ( not ( = ?auto_86293 ?auto_86297 ) ) ( not ( = ?auto_86292 ?auto_86295 ) ) ( not ( = ?auto_86292 ?auto_86296 ) ) ( not ( = ?auto_86293 ?auto_86295 ) ) ( not ( = ?auto_86293 ?auto_86296 ) ) ( not ( = ?auto_86297 ?auto_86295 ) ) ( not ( = ?auto_86297 ?auto_86296 ) ) ( not ( = ?auto_86295 ?auto_86296 ) ) ( ON ?auto_86295 ?auto_86297 ) ( not ( = ?auto_86294 ?auto_86299 ) ) ( not ( = ?auto_86294 ?auto_86296 ) ) ( not ( = ?auto_86299 ?auto_86296 ) ) ( not ( = ?auto_86292 ?auto_86299 ) ) ( not ( = ?auto_86292 ?auto_86294 ) ) ( not ( = ?auto_86293 ?auto_86299 ) ) ( not ( = ?auto_86293 ?auto_86294 ) ) ( not ( = ?auto_86297 ?auto_86299 ) ) ( not ( = ?auto_86297 ?auto_86294 ) ) ( not ( = ?auto_86295 ?auto_86299 ) ) ( not ( = ?auto_86295 ?auto_86294 ) ) ( ON ?auto_86296 ?auto_86295 ) ( ON ?auto_86294 ?auto_86298 ) ( not ( = ?auto_86292 ?auto_86298 ) ) ( not ( = ?auto_86293 ?auto_86298 ) ) ( not ( = ?auto_86297 ?auto_86298 ) ) ( not ( = ?auto_86295 ?auto_86298 ) ) ( not ( = ?auto_86296 ?auto_86298 ) ) ( not ( = ?auto_86294 ?auto_86298 ) ) ( not ( = ?auto_86299 ?auto_86298 ) ) ( CLEAR ?auto_86296 ) ( ON ?auto_86299 ?auto_86294 ) ( CLEAR ?auto_86299 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_86298 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86298 ?auto_86294 )
      ( MAKE-2PILE ?auto_86292 ?auto_86293 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_86300 - BLOCK
      ?auto_86301 - BLOCK
    )
    :vars
    (
      ?auto_86307 - BLOCK
      ?auto_86305 - BLOCK
      ?auto_86304 - BLOCK
      ?auto_86306 - BLOCK
      ?auto_86303 - BLOCK
      ?auto_86302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86307 ?auto_86301 ) ( ON-TABLE ?auto_86300 ) ( ON ?auto_86301 ?auto_86300 ) ( not ( = ?auto_86300 ?auto_86301 ) ) ( not ( = ?auto_86300 ?auto_86307 ) ) ( not ( = ?auto_86301 ?auto_86307 ) ) ( not ( = ?auto_86300 ?auto_86305 ) ) ( not ( = ?auto_86300 ?auto_86304 ) ) ( not ( = ?auto_86301 ?auto_86305 ) ) ( not ( = ?auto_86301 ?auto_86304 ) ) ( not ( = ?auto_86307 ?auto_86305 ) ) ( not ( = ?auto_86307 ?auto_86304 ) ) ( not ( = ?auto_86305 ?auto_86304 ) ) ( ON ?auto_86305 ?auto_86307 ) ( not ( = ?auto_86306 ?auto_86303 ) ) ( not ( = ?auto_86306 ?auto_86304 ) ) ( not ( = ?auto_86303 ?auto_86304 ) ) ( not ( = ?auto_86300 ?auto_86303 ) ) ( not ( = ?auto_86300 ?auto_86306 ) ) ( not ( = ?auto_86301 ?auto_86303 ) ) ( not ( = ?auto_86301 ?auto_86306 ) ) ( not ( = ?auto_86307 ?auto_86303 ) ) ( not ( = ?auto_86307 ?auto_86306 ) ) ( not ( = ?auto_86305 ?auto_86303 ) ) ( not ( = ?auto_86305 ?auto_86306 ) ) ( ON ?auto_86306 ?auto_86302 ) ( not ( = ?auto_86300 ?auto_86302 ) ) ( not ( = ?auto_86301 ?auto_86302 ) ) ( not ( = ?auto_86307 ?auto_86302 ) ) ( not ( = ?auto_86305 ?auto_86302 ) ) ( not ( = ?auto_86304 ?auto_86302 ) ) ( not ( = ?auto_86306 ?auto_86302 ) ) ( not ( = ?auto_86303 ?auto_86302 ) ) ( ON ?auto_86303 ?auto_86306 ) ( CLEAR ?auto_86303 ) ( ON-TABLE ?auto_86302 ) ( HOLDING ?auto_86304 ) ( CLEAR ?auto_86305 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_86300 ?auto_86301 ?auto_86307 ?auto_86305 ?auto_86304 )
      ( MAKE-2PILE ?auto_86300 ?auto_86301 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_86308 - BLOCK
      ?auto_86309 - BLOCK
    )
    :vars
    (
      ?auto_86312 - BLOCK
      ?auto_86313 - BLOCK
      ?auto_86310 - BLOCK
      ?auto_86311 - BLOCK
      ?auto_86314 - BLOCK
      ?auto_86315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86312 ?auto_86309 ) ( ON-TABLE ?auto_86308 ) ( ON ?auto_86309 ?auto_86308 ) ( not ( = ?auto_86308 ?auto_86309 ) ) ( not ( = ?auto_86308 ?auto_86312 ) ) ( not ( = ?auto_86309 ?auto_86312 ) ) ( not ( = ?auto_86308 ?auto_86313 ) ) ( not ( = ?auto_86308 ?auto_86310 ) ) ( not ( = ?auto_86309 ?auto_86313 ) ) ( not ( = ?auto_86309 ?auto_86310 ) ) ( not ( = ?auto_86312 ?auto_86313 ) ) ( not ( = ?auto_86312 ?auto_86310 ) ) ( not ( = ?auto_86313 ?auto_86310 ) ) ( ON ?auto_86313 ?auto_86312 ) ( not ( = ?auto_86311 ?auto_86314 ) ) ( not ( = ?auto_86311 ?auto_86310 ) ) ( not ( = ?auto_86314 ?auto_86310 ) ) ( not ( = ?auto_86308 ?auto_86314 ) ) ( not ( = ?auto_86308 ?auto_86311 ) ) ( not ( = ?auto_86309 ?auto_86314 ) ) ( not ( = ?auto_86309 ?auto_86311 ) ) ( not ( = ?auto_86312 ?auto_86314 ) ) ( not ( = ?auto_86312 ?auto_86311 ) ) ( not ( = ?auto_86313 ?auto_86314 ) ) ( not ( = ?auto_86313 ?auto_86311 ) ) ( ON ?auto_86311 ?auto_86315 ) ( not ( = ?auto_86308 ?auto_86315 ) ) ( not ( = ?auto_86309 ?auto_86315 ) ) ( not ( = ?auto_86312 ?auto_86315 ) ) ( not ( = ?auto_86313 ?auto_86315 ) ) ( not ( = ?auto_86310 ?auto_86315 ) ) ( not ( = ?auto_86311 ?auto_86315 ) ) ( not ( = ?auto_86314 ?auto_86315 ) ) ( ON ?auto_86314 ?auto_86311 ) ( ON-TABLE ?auto_86315 ) ( CLEAR ?auto_86313 ) ( ON ?auto_86310 ?auto_86314 ) ( CLEAR ?auto_86310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86315 ?auto_86311 ?auto_86314 )
      ( MAKE-2PILE ?auto_86308 ?auto_86309 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_86316 - BLOCK
      ?auto_86317 - BLOCK
    )
    :vars
    (
      ?auto_86321 - BLOCK
      ?auto_86320 - BLOCK
      ?auto_86319 - BLOCK
      ?auto_86318 - BLOCK
      ?auto_86322 - BLOCK
      ?auto_86323 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86321 ?auto_86317 ) ( ON-TABLE ?auto_86316 ) ( ON ?auto_86317 ?auto_86316 ) ( not ( = ?auto_86316 ?auto_86317 ) ) ( not ( = ?auto_86316 ?auto_86321 ) ) ( not ( = ?auto_86317 ?auto_86321 ) ) ( not ( = ?auto_86316 ?auto_86320 ) ) ( not ( = ?auto_86316 ?auto_86319 ) ) ( not ( = ?auto_86317 ?auto_86320 ) ) ( not ( = ?auto_86317 ?auto_86319 ) ) ( not ( = ?auto_86321 ?auto_86320 ) ) ( not ( = ?auto_86321 ?auto_86319 ) ) ( not ( = ?auto_86320 ?auto_86319 ) ) ( not ( = ?auto_86318 ?auto_86322 ) ) ( not ( = ?auto_86318 ?auto_86319 ) ) ( not ( = ?auto_86322 ?auto_86319 ) ) ( not ( = ?auto_86316 ?auto_86322 ) ) ( not ( = ?auto_86316 ?auto_86318 ) ) ( not ( = ?auto_86317 ?auto_86322 ) ) ( not ( = ?auto_86317 ?auto_86318 ) ) ( not ( = ?auto_86321 ?auto_86322 ) ) ( not ( = ?auto_86321 ?auto_86318 ) ) ( not ( = ?auto_86320 ?auto_86322 ) ) ( not ( = ?auto_86320 ?auto_86318 ) ) ( ON ?auto_86318 ?auto_86323 ) ( not ( = ?auto_86316 ?auto_86323 ) ) ( not ( = ?auto_86317 ?auto_86323 ) ) ( not ( = ?auto_86321 ?auto_86323 ) ) ( not ( = ?auto_86320 ?auto_86323 ) ) ( not ( = ?auto_86319 ?auto_86323 ) ) ( not ( = ?auto_86318 ?auto_86323 ) ) ( not ( = ?auto_86322 ?auto_86323 ) ) ( ON ?auto_86322 ?auto_86318 ) ( ON-TABLE ?auto_86323 ) ( ON ?auto_86319 ?auto_86322 ) ( CLEAR ?auto_86319 ) ( HOLDING ?auto_86320 ) ( CLEAR ?auto_86321 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86316 ?auto_86317 ?auto_86321 ?auto_86320 )
      ( MAKE-2PILE ?auto_86316 ?auto_86317 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_86324 - BLOCK
      ?auto_86325 - BLOCK
    )
    :vars
    (
      ?auto_86331 - BLOCK
      ?auto_86329 - BLOCK
      ?auto_86330 - BLOCK
      ?auto_86328 - BLOCK
      ?auto_86327 - BLOCK
      ?auto_86326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86331 ?auto_86325 ) ( ON-TABLE ?auto_86324 ) ( ON ?auto_86325 ?auto_86324 ) ( not ( = ?auto_86324 ?auto_86325 ) ) ( not ( = ?auto_86324 ?auto_86331 ) ) ( not ( = ?auto_86325 ?auto_86331 ) ) ( not ( = ?auto_86324 ?auto_86329 ) ) ( not ( = ?auto_86324 ?auto_86330 ) ) ( not ( = ?auto_86325 ?auto_86329 ) ) ( not ( = ?auto_86325 ?auto_86330 ) ) ( not ( = ?auto_86331 ?auto_86329 ) ) ( not ( = ?auto_86331 ?auto_86330 ) ) ( not ( = ?auto_86329 ?auto_86330 ) ) ( not ( = ?auto_86328 ?auto_86327 ) ) ( not ( = ?auto_86328 ?auto_86330 ) ) ( not ( = ?auto_86327 ?auto_86330 ) ) ( not ( = ?auto_86324 ?auto_86327 ) ) ( not ( = ?auto_86324 ?auto_86328 ) ) ( not ( = ?auto_86325 ?auto_86327 ) ) ( not ( = ?auto_86325 ?auto_86328 ) ) ( not ( = ?auto_86331 ?auto_86327 ) ) ( not ( = ?auto_86331 ?auto_86328 ) ) ( not ( = ?auto_86329 ?auto_86327 ) ) ( not ( = ?auto_86329 ?auto_86328 ) ) ( ON ?auto_86328 ?auto_86326 ) ( not ( = ?auto_86324 ?auto_86326 ) ) ( not ( = ?auto_86325 ?auto_86326 ) ) ( not ( = ?auto_86331 ?auto_86326 ) ) ( not ( = ?auto_86329 ?auto_86326 ) ) ( not ( = ?auto_86330 ?auto_86326 ) ) ( not ( = ?auto_86328 ?auto_86326 ) ) ( not ( = ?auto_86327 ?auto_86326 ) ) ( ON ?auto_86327 ?auto_86328 ) ( ON-TABLE ?auto_86326 ) ( ON ?auto_86330 ?auto_86327 ) ( CLEAR ?auto_86331 ) ( ON ?auto_86329 ?auto_86330 ) ( CLEAR ?auto_86329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86326 ?auto_86328 ?auto_86327 ?auto_86330 )
      ( MAKE-2PILE ?auto_86324 ?auto_86325 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_86348 - BLOCK
      ?auto_86349 - BLOCK
    )
    :vars
    (
      ?auto_86353 - BLOCK
      ?auto_86355 - BLOCK
      ?auto_86351 - BLOCK
      ?auto_86350 - BLOCK
      ?auto_86352 - BLOCK
      ?auto_86354 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86348 ) ( not ( = ?auto_86348 ?auto_86349 ) ) ( not ( = ?auto_86348 ?auto_86353 ) ) ( not ( = ?auto_86349 ?auto_86353 ) ) ( not ( = ?auto_86348 ?auto_86355 ) ) ( not ( = ?auto_86348 ?auto_86351 ) ) ( not ( = ?auto_86349 ?auto_86355 ) ) ( not ( = ?auto_86349 ?auto_86351 ) ) ( not ( = ?auto_86353 ?auto_86355 ) ) ( not ( = ?auto_86353 ?auto_86351 ) ) ( not ( = ?auto_86355 ?auto_86351 ) ) ( not ( = ?auto_86350 ?auto_86352 ) ) ( not ( = ?auto_86350 ?auto_86351 ) ) ( not ( = ?auto_86352 ?auto_86351 ) ) ( not ( = ?auto_86348 ?auto_86352 ) ) ( not ( = ?auto_86348 ?auto_86350 ) ) ( not ( = ?auto_86349 ?auto_86352 ) ) ( not ( = ?auto_86349 ?auto_86350 ) ) ( not ( = ?auto_86353 ?auto_86352 ) ) ( not ( = ?auto_86353 ?auto_86350 ) ) ( not ( = ?auto_86355 ?auto_86352 ) ) ( not ( = ?auto_86355 ?auto_86350 ) ) ( ON ?auto_86350 ?auto_86354 ) ( not ( = ?auto_86348 ?auto_86354 ) ) ( not ( = ?auto_86349 ?auto_86354 ) ) ( not ( = ?auto_86353 ?auto_86354 ) ) ( not ( = ?auto_86355 ?auto_86354 ) ) ( not ( = ?auto_86351 ?auto_86354 ) ) ( not ( = ?auto_86350 ?auto_86354 ) ) ( not ( = ?auto_86352 ?auto_86354 ) ) ( ON ?auto_86352 ?auto_86350 ) ( ON-TABLE ?auto_86354 ) ( ON ?auto_86351 ?auto_86352 ) ( ON ?auto_86355 ?auto_86351 ) ( ON ?auto_86353 ?auto_86355 ) ( CLEAR ?auto_86353 ) ( HOLDING ?auto_86349 ) ( CLEAR ?auto_86348 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86348 ?auto_86349 ?auto_86353 )
      ( MAKE-2PILE ?auto_86348 ?auto_86349 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_86356 - BLOCK
      ?auto_86357 - BLOCK
    )
    :vars
    (
      ?auto_86358 - BLOCK
      ?auto_86362 - BLOCK
      ?auto_86363 - BLOCK
      ?auto_86359 - BLOCK
      ?auto_86360 - BLOCK
      ?auto_86361 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86356 ) ( not ( = ?auto_86356 ?auto_86357 ) ) ( not ( = ?auto_86356 ?auto_86358 ) ) ( not ( = ?auto_86357 ?auto_86358 ) ) ( not ( = ?auto_86356 ?auto_86362 ) ) ( not ( = ?auto_86356 ?auto_86363 ) ) ( not ( = ?auto_86357 ?auto_86362 ) ) ( not ( = ?auto_86357 ?auto_86363 ) ) ( not ( = ?auto_86358 ?auto_86362 ) ) ( not ( = ?auto_86358 ?auto_86363 ) ) ( not ( = ?auto_86362 ?auto_86363 ) ) ( not ( = ?auto_86359 ?auto_86360 ) ) ( not ( = ?auto_86359 ?auto_86363 ) ) ( not ( = ?auto_86360 ?auto_86363 ) ) ( not ( = ?auto_86356 ?auto_86360 ) ) ( not ( = ?auto_86356 ?auto_86359 ) ) ( not ( = ?auto_86357 ?auto_86360 ) ) ( not ( = ?auto_86357 ?auto_86359 ) ) ( not ( = ?auto_86358 ?auto_86360 ) ) ( not ( = ?auto_86358 ?auto_86359 ) ) ( not ( = ?auto_86362 ?auto_86360 ) ) ( not ( = ?auto_86362 ?auto_86359 ) ) ( ON ?auto_86359 ?auto_86361 ) ( not ( = ?auto_86356 ?auto_86361 ) ) ( not ( = ?auto_86357 ?auto_86361 ) ) ( not ( = ?auto_86358 ?auto_86361 ) ) ( not ( = ?auto_86362 ?auto_86361 ) ) ( not ( = ?auto_86363 ?auto_86361 ) ) ( not ( = ?auto_86359 ?auto_86361 ) ) ( not ( = ?auto_86360 ?auto_86361 ) ) ( ON ?auto_86360 ?auto_86359 ) ( ON-TABLE ?auto_86361 ) ( ON ?auto_86363 ?auto_86360 ) ( ON ?auto_86362 ?auto_86363 ) ( ON ?auto_86358 ?auto_86362 ) ( CLEAR ?auto_86356 ) ( ON ?auto_86357 ?auto_86358 ) ( CLEAR ?auto_86357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_86361 ?auto_86359 ?auto_86360 ?auto_86363 ?auto_86362 ?auto_86358 )
      ( MAKE-2PILE ?auto_86356 ?auto_86357 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_86364 - BLOCK
      ?auto_86365 - BLOCK
    )
    :vars
    (
      ?auto_86367 - BLOCK
      ?auto_86371 - BLOCK
      ?auto_86366 - BLOCK
      ?auto_86368 - BLOCK
      ?auto_86370 - BLOCK
      ?auto_86369 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86364 ?auto_86365 ) ) ( not ( = ?auto_86364 ?auto_86367 ) ) ( not ( = ?auto_86365 ?auto_86367 ) ) ( not ( = ?auto_86364 ?auto_86371 ) ) ( not ( = ?auto_86364 ?auto_86366 ) ) ( not ( = ?auto_86365 ?auto_86371 ) ) ( not ( = ?auto_86365 ?auto_86366 ) ) ( not ( = ?auto_86367 ?auto_86371 ) ) ( not ( = ?auto_86367 ?auto_86366 ) ) ( not ( = ?auto_86371 ?auto_86366 ) ) ( not ( = ?auto_86368 ?auto_86370 ) ) ( not ( = ?auto_86368 ?auto_86366 ) ) ( not ( = ?auto_86370 ?auto_86366 ) ) ( not ( = ?auto_86364 ?auto_86370 ) ) ( not ( = ?auto_86364 ?auto_86368 ) ) ( not ( = ?auto_86365 ?auto_86370 ) ) ( not ( = ?auto_86365 ?auto_86368 ) ) ( not ( = ?auto_86367 ?auto_86370 ) ) ( not ( = ?auto_86367 ?auto_86368 ) ) ( not ( = ?auto_86371 ?auto_86370 ) ) ( not ( = ?auto_86371 ?auto_86368 ) ) ( ON ?auto_86368 ?auto_86369 ) ( not ( = ?auto_86364 ?auto_86369 ) ) ( not ( = ?auto_86365 ?auto_86369 ) ) ( not ( = ?auto_86367 ?auto_86369 ) ) ( not ( = ?auto_86371 ?auto_86369 ) ) ( not ( = ?auto_86366 ?auto_86369 ) ) ( not ( = ?auto_86368 ?auto_86369 ) ) ( not ( = ?auto_86370 ?auto_86369 ) ) ( ON ?auto_86370 ?auto_86368 ) ( ON-TABLE ?auto_86369 ) ( ON ?auto_86366 ?auto_86370 ) ( ON ?auto_86371 ?auto_86366 ) ( ON ?auto_86367 ?auto_86371 ) ( ON ?auto_86365 ?auto_86367 ) ( CLEAR ?auto_86365 ) ( HOLDING ?auto_86364 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_86364 )
      ( MAKE-2PILE ?auto_86364 ?auto_86365 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_86372 - BLOCK
      ?auto_86373 - BLOCK
    )
    :vars
    (
      ?auto_86374 - BLOCK
      ?auto_86375 - BLOCK
      ?auto_86376 - BLOCK
      ?auto_86378 - BLOCK
      ?auto_86377 - BLOCK
      ?auto_86379 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86372 ?auto_86373 ) ) ( not ( = ?auto_86372 ?auto_86374 ) ) ( not ( = ?auto_86373 ?auto_86374 ) ) ( not ( = ?auto_86372 ?auto_86375 ) ) ( not ( = ?auto_86372 ?auto_86376 ) ) ( not ( = ?auto_86373 ?auto_86375 ) ) ( not ( = ?auto_86373 ?auto_86376 ) ) ( not ( = ?auto_86374 ?auto_86375 ) ) ( not ( = ?auto_86374 ?auto_86376 ) ) ( not ( = ?auto_86375 ?auto_86376 ) ) ( not ( = ?auto_86378 ?auto_86377 ) ) ( not ( = ?auto_86378 ?auto_86376 ) ) ( not ( = ?auto_86377 ?auto_86376 ) ) ( not ( = ?auto_86372 ?auto_86377 ) ) ( not ( = ?auto_86372 ?auto_86378 ) ) ( not ( = ?auto_86373 ?auto_86377 ) ) ( not ( = ?auto_86373 ?auto_86378 ) ) ( not ( = ?auto_86374 ?auto_86377 ) ) ( not ( = ?auto_86374 ?auto_86378 ) ) ( not ( = ?auto_86375 ?auto_86377 ) ) ( not ( = ?auto_86375 ?auto_86378 ) ) ( ON ?auto_86378 ?auto_86379 ) ( not ( = ?auto_86372 ?auto_86379 ) ) ( not ( = ?auto_86373 ?auto_86379 ) ) ( not ( = ?auto_86374 ?auto_86379 ) ) ( not ( = ?auto_86375 ?auto_86379 ) ) ( not ( = ?auto_86376 ?auto_86379 ) ) ( not ( = ?auto_86378 ?auto_86379 ) ) ( not ( = ?auto_86377 ?auto_86379 ) ) ( ON ?auto_86377 ?auto_86378 ) ( ON-TABLE ?auto_86379 ) ( ON ?auto_86376 ?auto_86377 ) ( ON ?auto_86375 ?auto_86376 ) ( ON ?auto_86374 ?auto_86375 ) ( ON ?auto_86373 ?auto_86374 ) ( ON ?auto_86372 ?auto_86373 ) ( CLEAR ?auto_86372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_86379 ?auto_86378 ?auto_86377 ?auto_86376 ?auto_86375 ?auto_86374 ?auto_86373 )
      ( MAKE-2PILE ?auto_86372 ?auto_86373 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86385 - BLOCK
      ?auto_86386 - BLOCK
      ?auto_86387 - BLOCK
      ?auto_86388 - BLOCK
      ?auto_86389 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_86389 ) ( CLEAR ?auto_86388 ) ( ON-TABLE ?auto_86385 ) ( ON ?auto_86386 ?auto_86385 ) ( ON ?auto_86387 ?auto_86386 ) ( ON ?auto_86388 ?auto_86387 ) ( not ( = ?auto_86385 ?auto_86386 ) ) ( not ( = ?auto_86385 ?auto_86387 ) ) ( not ( = ?auto_86385 ?auto_86388 ) ) ( not ( = ?auto_86385 ?auto_86389 ) ) ( not ( = ?auto_86386 ?auto_86387 ) ) ( not ( = ?auto_86386 ?auto_86388 ) ) ( not ( = ?auto_86386 ?auto_86389 ) ) ( not ( = ?auto_86387 ?auto_86388 ) ) ( not ( = ?auto_86387 ?auto_86389 ) ) ( not ( = ?auto_86388 ?auto_86389 ) ) )
    :subtasks
    ( ( !STACK ?auto_86389 ?auto_86388 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86390 - BLOCK
      ?auto_86391 - BLOCK
      ?auto_86392 - BLOCK
      ?auto_86393 - BLOCK
      ?auto_86394 - BLOCK
    )
    :vars
    (
      ?auto_86395 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_86393 ) ( ON-TABLE ?auto_86390 ) ( ON ?auto_86391 ?auto_86390 ) ( ON ?auto_86392 ?auto_86391 ) ( ON ?auto_86393 ?auto_86392 ) ( not ( = ?auto_86390 ?auto_86391 ) ) ( not ( = ?auto_86390 ?auto_86392 ) ) ( not ( = ?auto_86390 ?auto_86393 ) ) ( not ( = ?auto_86390 ?auto_86394 ) ) ( not ( = ?auto_86391 ?auto_86392 ) ) ( not ( = ?auto_86391 ?auto_86393 ) ) ( not ( = ?auto_86391 ?auto_86394 ) ) ( not ( = ?auto_86392 ?auto_86393 ) ) ( not ( = ?auto_86392 ?auto_86394 ) ) ( not ( = ?auto_86393 ?auto_86394 ) ) ( ON ?auto_86394 ?auto_86395 ) ( CLEAR ?auto_86394 ) ( HAND-EMPTY ) ( not ( = ?auto_86390 ?auto_86395 ) ) ( not ( = ?auto_86391 ?auto_86395 ) ) ( not ( = ?auto_86392 ?auto_86395 ) ) ( not ( = ?auto_86393 ?auto_86395 ) ) ( not ( = ?auto_86394 ?auto_86395 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_86394 ?auto_86395 )
      ( MAKE-5PILE ?auto_86390 ?auto_86391 ?auto_86392 ?auto_86393 ?auto_86394 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86396 - BLOCK
      ?auto_86397 - BLOCK
      ?auto_86398 - BLOCK
      ?auto_86399 - BLOCK
      ?auto_86400 - BLOCK
    )
    :vars
    (
      ?auto_86401 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86396 ) ( ON ?auto_86397 ?auto_86396 ) ( ON ?auto_86398 ?auto_86397 ) ( not ( = ?auto_86396 ?auto_86397 ) ) ( not ( = ?auto_86396 ?auto_86398 ) ) ( not ( = ?auto_86396 ?auto_86399 ) ) ( not ( = ?auto_86396 ?auto_86400 ) ) ( not ( = ?auto_86397 ?auto_86398 ) ) ( not ( = ?auto_86397 ?auto_86399 ) ) ( not ( = ?auto_86397 ?auto_86400 ) ) ( not ( = ?auto_86398 ?auto_86399 ) ) ( not ( = ?auto_86398 ?auto_86400 ) ) ( not ( = ?auto_86399 ?auto_86400 ) ) ( ON ?auto_86400 ?auto_86401 ) ( CLEAR ?auto_86400 ) ( not ( = ?auto_86396 ?auto_86401 ) ) ( not ( = ?auto_86397 ?auto_86401 ) ) ( not ( = ?auto_86398 ?auto_86401 ) ) ( not ( = ?auto_86399 ?auto_86401 ) ) ( not ( = ?auto_86400 ?auto_86401 ) ) ( HOLDING ?auto_86399 ) ( CLEAR ?auto_86398 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86396 ?auto_86397 ?auto_86398 ?auto_86399 )
      ( MAKE-5PILE ?auto_86396 ?auto_86397 ?auto_86398 ?auto_86399 ?auto_86400 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86402 - BLOCK
      ?auto_86403 - BLOCK
      ?auto_86404 - BLOCK
      ?auto_86405 - BLOCK
      ?auto_86406 - BLOCK
    )
    :vars
    (
      ?auto_86407 - BLOCK
      ?auto_86408 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86402 ) ( ON ?auto_86403 ?auto_86402 ) ( ON ?auto_86404 ?auto_86403 ) ( not ( = ?auto_86402 ?auto_86403 ) ) ( not ( = ?auto_86402 ?auto_86404 ) ) ( not ( = ?auto_86402 ?auto_86405 ) ) ( not ( = ?auto_86402 ?auto_86406 ) ) ( not ( = ?auto_86403 ?auto_86404 ) ) ( not ( = ?auto_86403 ?auto_86405 ) ) ( not ( = ?auto_86403 ?auto_86406 ) ) ( not ( = ?auto_86404 ?auto_86405 ) ) ( not ( = ?auto_86404 ?auto_86406 ) ) ( not ( = ?auto_86405 ?auto_86406 ) ) ( ON ?auto_86406 ?auto_86407 ) ( not ( = ?auto_86402 ?auto_86407 ) ) ( not ( = ?auto_86403 ?auto_86407 ) ) ( not ( = ?auto_86404 ?auto_86407 ) ) ( not ( = ?auto_86405 ?auto_86407 ) ) ( not ( = ?auto_86406 ?auto_86407 ) ) ( CLEAR ?auto_86404 ) ( ON ?auto_86405 ?auto_86406 ) ( CLEAR ?auto_86405 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_86408 ) ( ON ?auto_86407 ?auto_86408 ) ( not ( = ?auto_86408 ?auto_86407 ) ) ( not ( = ?auto_86408 ?auto_86406 ) ) ( not ( = ?auto_86408 ?auto_86405 ) ) ( not ( = ?auto_86402 ?auto_86408 ) ) ( not ( = ?auto_86403 ?auto_86408 ) ) ( not ( = ?auto_86404 ?auto_86408 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86408 ?auto_86407 ?auto_86406 )
      ( MAKE-5PILE ?auto_86402 ?auto_86403 ?auto_86404 ?auto_86405 ?auto_86406 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86409 - BLOCK
      ?auto_86410 - BLOCK
      ?auto_86411 - BLOCK
      ?auto_86412 - BLOCK
      ?auto_86413 - BLOCK
    )
    :vars
    (
      ?auto_86414 - BLOCK
      ?auto_86415 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86409 ) ( ON ?auto_86410 ?auto_86409 ) ( not ( = ?auto_86409 ?auto_86410 ) ) ( not ( = ?auto_86409 ?auto_86411 ) ) ( not ( = ?auto_86409 ?auto_86412 ) ) ( not ( = ?auto_86409 ?auto_86413 ) ) ( not ( = ?auto_86410 ?auto_86411 ) ) ( not ( = ?auto_86410 ?auto_86412 ) ) ( not ( = ?auto_86410 ?auto_86413 ) ) ( not ( = ?auto_86411 ?auto_86412 ) ) ( not ( = ?auto_86411 ?auto_86413 ) ) ( not ( = ?auto_86412 ?auto_86413 ) ) ( ON ?auto_86413 ?auto_86414 ) ( not ( = ?auto_86409 ?auto_86414 ) ) ( not ( = ?auto_86410 ?auto_86414 ) ) ( not ( = ?auto_86411 ?auto_86414 ) ) ( not ( = ?auto_86412 ?auto_86414 ) ) ( not ( = ?auto_86413 ?auto_86414 ) ) ( ON ?auto_86412 ?auto_86413 ) ( CLEAR ?auto_86412 ) ( ON-TABLE ?auto_86415 ) ( ON ?auto_86414 ?auto_86415 ) ( not ( = ?auto_86415 ?auto_86414 ) ) ( not ( = ?auto_86415 ?auto_86413 ) ) ( not ( = ?auto_86415 ?auto_86412 ) ) ( not ( = ?auto_86409 ?auto_86415 ) ) ( not ( = ?auto_86410 ?auto_86415 ) ) ( not ( = ?auto_86411 ?auto_86415 ) ) ( HOLDING ?auto_86411 ) ( CLEAR ?auto_86410 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86409 ?auto_86410 ?auto_86411 )
      ( MAKE-5PILE ?auto_86409 ?auto_86410 ?auto_86411 ?auto_86412 ?auto_86413 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86416 - BLOCK
      ?auto_86417 - BLOCK
      ?auto_86418 - BLOCK
      ?auto_86419 - BLOCK
      ?auto_86420 - BLOCK
    )
    :vars
    (
      ?auto_86422 - BLOCK
      ?auto_86421 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86416 ) ( ON ?auto_86417 ?auto_86416 ) ( not ( = ?auto_86416 ?auto_86417 ) ) ( not ( = ?auto_86416 ?auto_86418 ) ) ( not ( = ?auto_86416 ?auto_86419 ) ) ( not ( = ?auto_86416 ?auto_86420 ) ) ( not ( = ?auto_86417 ?auto_86418 ) ) ( not ( = ?auto_86417 ?auto_86419 ) ) ( not ( = ?auto_86417 ?auto_86420 ) ) ( not ( = ?auto_86418 ?auto_86419 ) ) ( not ( = ?auto_86418 ?auto_86420 ) ) ( not ( = ?auto_86419 ?auto_86420 ) ) ( ON ?auto_86420 ?auto_86422 ) ( not ( = ?auto_86416 ?auto_86422 ) ) ( not ( = ?auto_86417 ?auto_86422 ) ) ( not ( = ?auto_86418 ?auto_86422 ) ) ( not ( = ?auto_86419 ?auto_86422 ) ) ( not ( = ?auto_86420 ?auto_86422 ) ) ( ON ?auto_86419 ?auto_86420 ) ( ON-TABLE ?auto_86421 ) ( ON ?auto_86422 ?auto_86421 ) ( not ( = ?auto_86421 ?auto_86422 ) ) ( not ( = ?auto_86421 ?auto_86420 ) ) ( not ( = ?auto_86421 ?auto_86419 ) ) ( not ( = ?auto_86416 ?auto_86421 ) ) ( not ( = ?auto_86417 ?auto_86421 ) ) ( not ( = ?auto_86418 ?auto_86421 ) ) ( CLEAR ?auto_86417 ) ( ON ?auto_86418 ?auto_86419 ) ( CLEAR ?auto_86418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86421 ?auto_86422 ?auto_86420 ?auto_86419 )
      ( MAKE-5PILE ?auto_86416 ?auto_86417 ?auto_86418 ?auto_86419 ?auto_86420 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86423 - BLOCK
      ?auto_86424 - BLOCK
      ?auto_86425 - BLOCK
      ?auto_86426 - BLOCK
      ?auto_86427 - BLOCK
    )
    :vars
    (
      ?auto_86429 - BLOCK
      ?auto_86428 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86423 ) ( not ( = ?auto_86423 ?auto_86424 ) ) ( not ( = ?auto_86423 ?auto_86425 ) ) ( not ( = ?auto_86423 ?auto_86426 ) ) ( not ( = ?auto_86423 ?auto_86427 ) ) ( not ( = ?auto_86424 ?auto_86425 ) ) ( not ( = ?auto_86424 ?auto_86426 ) ) ( not ( = ?auto_86424 ?auto_86427 ) ) ( not ( = ?auto_86425 ?auto_86426 ) ) ( not ( = ?auto_86425 ?auto_86427 ) ) ( not ( = ?auto_86426 ?auto_86427 ) ) ( ON ?auto_86427 ?auto_86429 ) ( not ( = ?auto_86423 ?auto_86429 ) ) ( not ( = ?auto_86424 ?auto_86429 ) ) ( not ( = ?auto_86425 ?auto_86429 ) ) ( not ( = ?auto_86426 ?auto_86429 ) ) ( not ( = ?auto_86427 ?auto_86429 ) ) ( ON ?auto_86426 ?auto_86427 ) ( ON-TABLE ?auto_86428 ) ( ON ?auto_86429 ?auto_86428 ) ( not ( = ?auto_86428 ?auto_86429 ) ) ( not ( = ?auto_86428 ?auto_86427 ) ) ( not ( = ?auto_86428 ?auto_86426 ) ) ( not ( = ?auto_86423 ?auto_86428 ) ) ( not ( = ?auto_86424 ?auto_86428 ) ) ( not ( = ?auto_86425 ?auto_86428 ) ) ( ON ?auto_86425 ?auto_86426 ) ( CLEAR ?auto_86425 ) ( HOLDING ?auto_86424 ) ( CLEAR ?auto_86423 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86423 ?auto_86424 )
      ( MAKE-5PILE ?auto_86423 ?auto_86424 ?auto_86425 ?auto_86426 ?auto_86427 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86430 - BLOCK
      ?auto_86431 - BLOCK
      ?auto_86432 - BLOCK
      ?auto_86433 - BLOCK
      ?auto_86434 - BLOCK
    )
    :vars
    (
      ?auto_86436 - BLOCK
      ?auto_86435 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86430 ) ( not ( = ?auto_86430 ?auto_86431 ) ) ( not ( = ?auto_86430 ?auto_86432 ) ) ( not ( = ?auto_86430 ?auto_86433 ) ) ( not ( = ?auto_86430 ?auto_86434 ) ) ( not ( = ?auto_86431 ?auto_86432 ) ) ( not ( = ?auto_86431 ?auto_86433 ) ) ( not ( = ?auto_86431 ?auto_86434 ) ) ( not ( = ?auto_86432 ?auto_86433 ) ) ( not ( = ?auto_86432 ?auto_86434 ) ) ( not ( = ?auto_86433 ?auto_86434 ) ) ( ON ?auto_86434 ?auto_86436 ) ( not ( = ?auto_86430 ?auto_86436 ) ) ( not ( = ?auto_86431 ?auto_86436 ) ) ( not ( = ?auto_86432 ?auto_86436 ) ) ( not ( = ?auto_86433 ?auto_86436 ) ) ( not ( = ?auto_86434 ?auto_86436 ) ) ( ON ?auto_86433 ?auto_86434 ) ( ON-TABLE ?auto_86435 ) ( ON ?auto_86436 ?auto_86435 ) ( not ( = ?auto_86435 ?auto_86436 ) ) ( not ( = ?auto_86435 ?auto_86434 ) ) ( not ( = ?auto_86435 ?auto_86433 ) ) ( not ( = ?auto_86430 ?auto_86435 ) ) ( not ( = ?auto_86431 ?auto_86435 ) ) ( not ( = ?auto_86432 ?auto_86435 ) ) ( ON ?auto_86432 ?auto_86433 ) ( CLEAR ?auto_86430 ) ( ON ?auto_86431 ?auto_86432 ) ( CLEAR ?auto_86431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_86435 ?auto_86436 ?auto_86434 ?auto_86433 ?auto_86432 )
      ( MAKE-5PILE ?auto_86430 ?auto_86431 ?auto_86432 ?auto_86433 ?auto_86434 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86437 - BLOCK
      ?auto_86438 - BLOCK
      ?auto_86439 - BLOCK
      ?auto_86440 - BLOCK
      ?auto_86441 - BLOCK
    )
    :vars
    (
      ?auto_86443 - BLOCK
      ?auto_86442 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86437 ?auto_86438 ) ) ( not ( = ?auto_86437 ?auto_86439 ) ) ( not ( = ?auto_86437 ?auto_86440 ) ) ( not ( = ?auto_86437 ?auto_86441 ) ) ( not ( = ?auto_86438 ?auto_86439 ) ) ( not ( = ?auto_86438 ?auto_86440 ) ) ( not ( = ?auto_86438 ?auto_86441 ) ) ( not ( = ?auto_86439 ?auto_86440 ) ) ( not ( = ?auto_86439 ?auto_86441 ) ) ( not ( = ?auto_86440 ?auto_86441 ) ) ( ON ?auto_86441 ?auto_86443 ) ( not ( = ?auto_86437 ?auto_86443 ) ) ( not ( = ?auto_86438 ?auto_86443 ) ) ( not ( = ?auto_86439 ?auto_86443 ) ) ( not ( = ?auto_86440 ?auto_86443 ) ) ( not ( = ?auto_86441 ?auto_86443 ) ) ( ON ?auto_86440 ?auto_86441 ) ( ON-TABLE ?auto_86442 ) ( ON ?auto_86443 ?auto_86442 ) ( not ( = ?auto_86442 ?auto_86443 ) ) ( not ( = ?auto_86442 ?auto_86441 ) ) ( not ( = ?auto_86442 ?auto_86440 ) ) ( not ( = ?auto_86437 ?auto_86442 ) ) ( not ( = ?auto_86438 ?auto_86442 ) ) ( not ( = ?auto_86439 ?auto_86442 ) ) ( ON ?auto_86439 ?auto_86440 ) ( ON ?auto_86438 ?auto_86439 ) ( CLEAR ?auto_86438 ) ( HOLDING ?auto_86437 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_86437 )
      ( MAKE-5PILE ?auto_86437 ?auto_86438 ?auto_86439 ?auto_86440 ?auto_86441 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86444 - BLOCK
      ?auto_86445 - BLOCK
      ?auto_86446 - BLOCK
      ?auto_86447 - BLOCK
      ?auto_86448 - BLOCK
    )
    :vars
    (
      ?auto_86450 - BLOCK
      ?auto_86449 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86444 ?auto_86445 ) ) ( not ( = ?auto_86444 ?auto_86446 ) ) ( not ( = ?auto_86444 ?auto_86447 ) ) ( not ( = ?auto_86444 ?auto_86448 ) ) ( not ( = ?auto_86445 ?auto_86446 ) ) ( not ( = ?auto_86445 ?auto_86447 ) ) ( not ( = ?auto_86445 ?auto_86448 ) ) ( not ( = ?auto_86446 ?auto_86447 ) ) ( not ( = ?auto_86446 ?auto_86448 ) ) ( not ( = ?auto_86447 ?auto_86448 ) ) ( ON ?auto_86448 ?auto_86450 ) ( not ( = ?auto_86444 ?auto_86450 ) ) ( not ( = ?auto_86445 ?auto_86450 ) ) ( not ( = ?auto_86446 ?auto_86450 ) ) ( not ( = ?auto_86447 ?auto_86450 ) ) ( not ( = ?auto_86448 ?auto_86450 ) ) ( ON ?auto_86447 ?auto_86448 ) ( ON-TABLE ?auto_86449 ) ( ON ?auto_86450 ?auto_86449 ) ( not ( = ?auto_86449 ?auto_86450 ) ) ( not ( = ?auto_86449 ?auto_86448 ) ) ( not ( = ?auto_86449 ?auto_86447 ) ) ( not ( = ?auto_86444 ?auto_86449 ) ) ( not ( = ?auto_86445 ?auto_86449 ) ) ( not ( = ?auto_86446 ?auto_86449 ) ) ( ON ?auto_86446 ?auto_86447 ) ( ON ?auto_86445 ?auto_86446 ) ( ON ?auto_86444 ?auto_86445 ) ( CLEAR ?auto_86444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_86449 ?auto_86450 ?auto_86448 ?auto_86447 ?auto_86446 ?auto_86445 )
      ( MAKE-5PILE ?auto_86444 ?auto_86445 ?auto_86446 ?auto_86447 ?auto_86448 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86451 - BLOCK
      ?auto_86452 - BLOCK
      ?auto_86453 - BLOCK
      ?auto_86454 - BLOCK
      ?auto_86455 - BLOCK
    )
    :vars
    (
      ?auto_86457 - BLOCK
      ?auto_86456 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86451 ?auto_86452 ) ) ( not ( = ?auto_86451 ?auto_86453 ) ) ( not ( = ?auto_86451 ?auto_86454 ) ) ( not ( = ?auto_86451 ?auto_86455 ) ) ( not ( = ?auto_86452 ?auto_86453 ) ) ( not ( = ?auto_86452 ?auto_86454 ) ) ( not ( = ?auto_86452 ?auto_86455 ) ) ( not ( = ?auto_86453 ?auto_86454 ) ) ( not ( = ?auto_86453 ?auto_86455 ) ) ( not ( = ?auto_86454 ?auto_86455 ) ) ( ON ?auto_86455 ?auto_86457 ) ( not ( = ?auto_86451 ?auto_86457 ) ) ( not ( = ?auto_86452 ?auto_86457 ) ) ( not ( = ?auto_86453 ?auto_86457 ) ) ( not ( = ?auto_86454 ?auto_86457 ) ) ( not ( = ?auto_86455 ?auto_86457 ) ) ( ON ?auto_86454 ?auto_86455 ) ( ON-TABLE ?auto_86456 ) ( ON ?auto_86457 ?auto_86456 ) ( not ( = ?auto_86456 ?auto_86457 ) ) ( not ( = ?auto_86456 ?auto_86455 ) ) ( not ( = ?auto_86456 ?auto_86454 ) ) ( not ( = ?auto_86451 ?auto_86456 ) ) ( not ( = ?auto_86452 ?auto_86456 ) ) ( not ( = ?auto_86453 ?auto_86456 ) ) ( ON ?auto_86453 ?auto_86454 ) ( ON ?auto_86452 ?auto_86453 ) ( HOLDING ?auto_86451 ) ( CLEAR ?auto_86452 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_86456 ?auto_86457 ?auto_86455 ?auto_86454 ?auto_86453 ?auto_86452 ?auto_86451 )
      ( MAKE-5PILE ?auto_86451 ?auto_86452 ?auto_86453 ?auto_86454 ?auto_86455 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86458 - BLOCK
      ?auto_86459 - BLOCK
      ?auto_86460 - BLOCK
      ?auto_86461 - BLOCK
      ?auto_86462 - BLOCK
    )
    :vars
    (
      ?auto_86464 - BLOCK
      ?auto_86463 - BLOCK
      ?auto_86465 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86458 ?auto_86459 ) ) ( not ( = ?auto_86458 ?auto_86460 ) ) ( not ( = ?auto_86458 ?auto_86461 ) ) ( not ( = ?auto_86458 ?auto_86462 ) ) ( not ( = ?auto_86459 ?auto_86460 ) ) ( not ( = ?auto_86459 ?auto_86461 ) ) ( not ( = ?auto_86459 ?auto_86462 ) ) ( not ( = ?auto_86460 ?auto_86461 ) ) ( not ( = ?auto_86460 ?auto_86462 ) ) ( not ( = ?auto_86461 ?auto_86462 ) ) ( ON ?auto_86462 ?auto_86464 ) ( not ( = ?auto_86458 ?auto_86464 ) ) ( not ( = ?auto_86459 ?auto_86464 ) ) ( not ( = ?auto_86460 ?auto_86464 ) ) ( not ( = ?auto_86461 ?auto_86464 ) ) ( not ( = ?auto_86462 ?auto_86464 ) ) ( ON ?auto_86461 ?auto_86462 ) ( ON-TABLE ?auto_86463 ) ( ON ?auto_86464 ?auto_86463 ) ( not ( = ?auto_86463 ?auto_86464 ) ) ( not ( = ?auto_86463 ?auto_86462 ) ) ( not ( = ?auto_86463 ?auto_86461 ) ) ( not ( = ?auto_86458 ?auto_86463 ) ) ( not ( = ?auto_86459 ?auto_86463 ) ) ( not ( = ?auto_86460 ?auto_86463 ) ) ( ON ?auto_86460 ?auto_86461 ) ( ON ?auto_86459 ?auto_86460 ) ( CLEAR ?auto_86459 ) ( ON ?auto_86458 ?auto_86465 ) ( CLEAR ?auto_86458 ) ( HAND-EMPTY ) ( not ( = ?auto_86458 ?auto_86465 ) ) ( not ( = ?auto_86459 ?auto_86465 ) ) ( not ( = ?auto_86460 ?auto_86465 ) ) ( not ( = ?auto_86461 ?auto_86465 ) ) ( not ( = ?auto_86462 ?auto_86465 ) ) ( not ( = ?auto_86464 ?auto_86465 ) ) ( not ( = ?auto_86463 ?auto_86465 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_86458 ?auto_86465 )
      ( MAKE-5PILE ?auto_86458 ?auto_86459 ?auto_86460 ?auto_86461 ?auto_86462 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86466 - BLOCK
      ?auto_86467 - BLOCK
      ?auto_86468 - BLOCK
      ?auto_86469 - BLOCK
      ?auto_86470 - BLOCK
    )
    :vars
    (
      ?auto_86471 - BLOCK
      ?auto_86473 - BLOCK
      ?auto_86472 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86466 ?auto_86467 ) ) ( not ( = ?auto_86466 ?auto_86468 ) ) ( not ( = ?auto_86466 ?auto_86469 ) ) ( not ( = ?auto_86466 ?auto_86470 ) ) ( not ( = ?auto_86467 ?auto_86468 ) ) ( not ( = ?auto_86467 ?auto_86469 ) ) ( not ( = ?auto_86467 ?auto_86470 ) ) ( not ( = ?auto_86468 ?auto_86469 ) ) ( not ( = ?auto_86468 ?auto_86470 ) ) ( not ( = ?auto_86469 ?auto_86470 ) ) ( ON ?auto_86470 ?auto_86471 ) ( not ( = ?auto_86466 ?auto_86471 ) ) ( not ( = ?auto_86467 ?auto_86471 ) ) ( not ( = ?auto_86468 ?auto_86471 ) ) ( not ( = ?auto_86469 ?auto_86471 ) ) ( not ( = ?auto_86470 ?auto_86471 ) ) ( ON ?auto_86469 ?auto_86470 ) ( ON-TABLE ?auto_86473 ) ( ON ?auto_86471 ?auto_86473 ) ( not ( = ?auto_86473 ?auto_86471 ) ) ( not ( = ?auto_86473 ?auto_86470 ) ) ( not ( = ?auto_86473 ?auto_86469 ) ) ( not ( = ?auto_86466 ?auto_86473 ) ) ( not ( = ?auto_86467 ?auto_86473 ) ) ( not ( = ?auto_86468 ?auto_86473 ) ) ( ON ?auto_86468 ?auto_86469 ) ( ON ?auto_86466 ?auto_86472 ) ( CLEAR ?auto_86466 ) ( not ( = ?auto_86466 ?auto_86472 ) ) ( not ( = ?auto_86467 ?auto_86472 ) ) ( not ( = ?auto_86468 ?auto_86472 ) ) ( not ( = ?auto_86469 ?auto_86472 ) ) ( not ( = ?auto_86470 ?auto_86472 ) ) ( not ( = ?auto_86471 ?auto_86472 ) ) ( not ( = ?auto_86473 ?auto_86472 ) ) ( HOLDING ?auto_86467 ) ( CLEAR ?auto_86468 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_86473 ?auto_86471 ?auto_86470 ?auto_86469 ?auto_86468 ?auto_86467 )
      ( MAKE-5PILE ?auto_86466 ?auto_86467 ?auto_86468 ?auto_86469 ?auto_86470 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86474 - BLOCK
      ?auto_86475 - BLOCK
      ?auto_86476 - BLOCK
      ?auto_86477 - BLOCK
      ?auto_86478 - BLOCK
    )
    :vars
    (
      ?auto_86480 - BLOCK
      ?auto_86481 - BLOCK
      ?auto_86479 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86474 ?auto_86475 ) ) ( not ( = ?auto_86474 ?auto_86476 ) ) ( not ( = ?auto_86474 ?auto_86477 ) ) ( not ( = ?auto_86474 ?auto_86478 ) ) ( not ( = ?auto_86475 ?auto_86476 ) ) ( not ( = ?auto_86475 ?auto_86477 ) ) ( not ( = ?auto_86475 ?auto_86478 ) ) ( not ( = ?auto_86476 ?auto_86477 ) ) ( not ( = ?auto_86476 ?auto_86478 ) ) ( not ( = ?auto_86477 ?auto_86478 ) ) ( ON ?auto_86478 ?auto_86480 ) ( not ( = ?auto_86474 ?auto_86480 ) ) ( not ( = ?auto_86475 ?auto_86480 ) ) ( not ( = ?auto_86476 ?auto_86480 ) ) ( not ( = ?auto_86477 ?auto_86480 ) ) ( not ( = ?auto_86478 ?auto_86480 ) ) ( ON ?auto_86477 ?auto_86478 ) ( ON-TABLE ?auto_86481 ) ( ON ?auto_86480 ?auto_86481 ) ( not ( = ?auto_86481 ?auto_86480 ) ) ( not ( = ?auto_86481 ?auto_86478 ) ) ( not ( = ?auto_86481 ?auto_86477 ) ) ( not ( = ?auto_86474 ?auto_86481 ) ) ( not ( = ?auto_86475 ?auto_86481 ) ) ( not ( = ?auto_86476 ?auto_86481 ) ) ( ON ?auto_86476 ?auto_86477 ) ( ON ?auto_86474 ?auto_86479 ) ( not ( = ?auto_86474 ?auto_86479 ) ) ( not ( = ?auto_86475 ?auto_86479 ) ) ( not ( = ?auto_86476 ?auto_86479 ) ) ( not ( = ?auto_86477 ?auto_86479 ) ) ( not ( = ?auto_86478 ?auto_86479 ) ) ( not ( = ?auto_86480 ?auto_86479 ) ) ( not ( = ?auto_86481 ?auto_86479 ) ) ( CLEAR ?auto_86476 ) ( ON ?auto_86475 ?auto_86474 ) ( CLEAR ?auto_86475 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_86479 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86479 ?auto_86474 )
      ( MAKE-5PILE ?auto_86474 ?auto_86475 ?auto_86476 ?auto_86477 ?auto_86478 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86482 - BLOCK
      ?auto_86483 - BLOCK
      ?auto_86484 - BLOCK
      ?auto_86485 - BLOCK
      ?auto_86486 - BLOCK
    )
    :vars
    (
      ?auto_86487 - BLOCK
      ?auto_86489 - BLOCK
      ?auto_86488 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86482 ?auto_86483 ) ) ( not ( = ?auto_86482 ?auto_86484 ) ) ( not ( = ?auto_86482 ?auto_86485 ) ) ( not ( = ?auto_86482 ?auto_86486 ) ) ( not ( = ?auto_86483 ?auto_86484 ) ) ( not ( = ?auto_86483 ?auto_86485 ) ) ( not ( = ?auto_86483 ?auto_86486 ) ) ( not ( = ?auto_86484 ?auto_86485 ) ) ( not ( = ?auto_86484 ?auto_86486 ) ) ( not ( = ?auto_86485 ?auto_86486 ) ) ( ON ?auto_86486 ?auto_86487 ) ( not ( = ?auto_86482 ?auto_86487 ) ) ( not ( = ?auto_86483 ?auto_86487 ) ) ( not ( = ?auto_86484 ?auto_86487 ) ) ( not ( = ?auto_86485 ?auto_86487 ) ) ( not ( = ?auto_86486 ?auto_86487 ) ) ( ON ?auto_86485 ?auto_86486 ) ( ON-TABLE ?auto_86489 ) ( ON ?auto_86487 ?auto_86489 ) ( not ( = ?auto_86489 ?auto_86487 ) ) ( not ( = ?auto_86489 ?auto_86486 ) ) ( not ( = ?auto_86489 ?auto_86485 ) ) ( not ( = ?auto_86482 ?auto_86489 ) ) ( not ( = ?auto_86483 ?auto_86489 ) ) ( not ( = ?auto_86484 ?auto_86489 ) ) ( ON ?auto_86482 ?auto_86488 ) ( not ( = ?auto_86482 ?auto_86488 ) ) ( not ( = ?auto_86483 ?auto_86488 ) ) ( not ( = ?auto_86484 ?auto_86488 ) ) ( not ( = ?auto_86485 ?auto_86488 ) ) ( not ( = ?auto_86486 ?auto_86488 ) ) ( not ( = ?auto_86487 ?auto_86488 ) ) ( not ( = ?auto_86489 ?auto_86488 ) ) ( ON ?auto_86483 ?auto_86482 ) ( CLEAR ?auto_86483 ) ( ON-TABLE ?auto_86488 ) ( HOLDING ?auto_86484 ) ( CLEAR ?auto_86485 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_86489 ?auto_86487 ?auto_86486 ?auto_86485 ?auto_86484 )
      ( MAKE-5PILE ?auto_86482 ?auto_86483 ?auto_86484 ?auto_86485 ?auto_86486 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86490 - BLOCK
      ?auto_86491 - BLOCK
      ?auto_86492 - BLOCK
      ?auto_86493 - BLOCK
      ?auto_86494 - BLOCK
    )
    :vars
    (
      ?auto_86497 - BLOCK
      ?auto_86495 - BLOCK
      ?auto_86496 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86490 ?auto_86491 ) ) ( not ( = ?auto_86490 ?auto_86492 ) ) ( not ( = ?auto_86490 ?auto_86493 ) ) ( not ( = ?auto_86490 ?auto_86494 ) ) ( not ( = ?auto_86491 ?auto_86492 ) ) ( not ( = ?auto_86491 ?auto_86493 ) ) ( not ( = ?auto_86491 ?auto_86494 ) ) ( not ( = ?auto_86492 ?auto_86493 ) ) ( not ( = ?auto_86492 ?auto_86494 ) ) ( not ( = ?auto_86493 ?auto_86494 ) ) ( ON ?auto_86494 ?auto_86497 ) ( not ( = ?auto_86490 ?auto_86497 ) ) ( not ( = ?auto_86491 ?auto_86497 ) ) ( not ( = ?auto_86492 ?auto_86497 ) ) ( not ( = ?auto_86493 ?auto_86497 ) ) ( not ( = ?auto_86494 ?auto_86497 ) ) ( ON ?auto_86493 ?auto_86494 ) ( ON-TABLE ?auto_86495 ) ( ON ?auto_86497 ?auto_86495 ) ( not ( = ?auto_86495 ?auto_86497 ) ) ( not ( = ?auto_86495 ?auto_86494 ) ) ( not ( = ?auto_86495 ?auto_86493 ) ) ( not ( = ?auto_86490 ?auto_86495 ) ) ( not ( = ?auto_86491 ?auto_86495 ) ) ( not ( = ?auto_86492 ?auto_86495 ) ) ( ON ?auto_86490 ?auto_86496 ) ( not ( = ?auto_86490 ?auto_86496 ) ) ( not ( = ?auto_86491 ?auto_86496 ) ) ( not ( = ?auto_86492 ?auto_86496 ) ) ( not ( = ?auto_86493 ?auto_86496 ) ) ( not ( = ?auto_86494 ?auto_86496 ) ) ( not ( = ?auto_86497 ?auto_86496 ) ) ( not ( = ?auto_86495 ?auto_86496 ) ) ( ON ?auto_86491 ?auto_86490 ) ( ON-TABLE ?auto_86496 ) ( CLEAR ?auto_86493 ) ( ON ?auto_86492 ?auto_86491 ) ( CLEAR ?auto_86492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86496 ?auto_86490 ?auto_86491 )
      ( MAKE-5PILE ?auto_86490 ?auto_86491 ?auto_86492 ?auto_86493 ?auto_86494 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86498 - BLOCK
      ?auto_86499 - BLOCK
      ?auto_86500 - BLOCK
      ?auto_86501 - BLOCK
      ?auto_86502 - BLOCK
    )
    :vars
    (
      ?auto_86503 - BLOCK
      ?auto_86505 - BLOCK
      ?auto_86504 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86498 ?auto_86499 ) ) ( not ( = ?auto_86498 ?auto_86500 ) ) ( not ( = ?auto_86498 ?auto_86501 ) ) ( not ( = ?auto_86498 ?auto_86502 ) ) ( not ( = ?auto_86499 ?auto_86500 ) ) ( not ( = ?auto_86499 ?auto_86501 ) ) ( not ( = ?auto_86499 ?auto_86502 ) ) ( not ( = ?auto_86500 ?auto_86501 ) ) ( not ( = ?auto_86500 ?auto_86502 ) ) ( not ( = ?auto_86501 ?auto_86502 ) ) ( ON ?auto_86502 ?auto_86503 ) ( not ( = ?auto_86498 ?auto_86503 ) ) ( not ( = ?auto_86499 ?auto_86503 ) ) ( not ( = ?auto_86500 ?auto_86503 ) ) ( not ( = ?auto_86501 ?auto_86503 ) ) ( not ( = ?auto_86502 ?auto_86503 ) ) ( ON-TABLE ?auto_86505 ) ( ON ?auto_86503 ?auto_86505 ) ( not ( = ?auto_86505 ?auto_86503 ) ) ( not ( = ?auto_86505 ?auto_86502 ) ) ( not ( = ?auto_86505 ?auto_86501 ) ) ( not ( = ?auto_86498 ?auto_86505 ) ) ( not ( = ?auto_86499 ?auto_86505 ) ) ( not ( = ?auto_86500 ?auto_86505 ) ) ( ON ?auto_86498 ?auto_86504 ) ( not ( = ?auto_86498 ?auto_86504 ) ) ( not ( = ?auto_86499 ?auto_86504 ) ) ( not ( = ?auto_86500 ?auto_86504 ) ) ( not ( = ?auto_86501 ?auto_86504 ) ) ( not ( = ?auto_86502 ?auto_86504 ) ) ( not ( = ?auto_86503 ?auto_86504 ) ) ( not ( = ?auto_86505 ?auto_86504 ) ) ( ON ?auto_86499 ?auto_86498 ) ( ON-TABLE ?auto_86504 ) ( ON ?auto_86500 ?auto_86499 ) ( CLEAR ?auto_86500 ) ( HOLDING ?auto_86501 ) ( CLEAR ?auto_86502 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86505 ?auto_86503 ?auto_86502 ?auto_86501 )
      ( MAKE-5PILE ?auto_86498 ?auto_86499 ?auto_86500 ?auto_86501 ?auto_86502 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86506 - BLOCK
      ?auto_86507 - BLOCK
      ?auto_86508 - BLOCK
      ?auto_86509 - BLOCK
      ?auto_86510 - BLOCK
    )
    :vars
    (
      ?auto_86513 - BLOCK
      ?auto_86512 - BLOCK
      ?auto_86511 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86506 ?auto_86507 ) ) ( not ( = ?auto_86506 ?auto_86508 ) ) ( not ( = ?auto_86506 ?auto_86509 ) ) ( not ( = ?auto_86506 ?auto_86510 ) ) ( not ( = ?auto_86507 ?auto_86508 ) ) ( not ( = ?auto_86507 ?auto_86509 ) ) ( not ( = ?auto_86507 ?auto_86510 ) ) ( not ( = ?auto_86508 ?auto_86509 ) ) ( not ( = ?auto_86508 ?auto_86510 ) ) ( not ( = ?auto_86509 ?auto_86510 ) ) ( ON ?auto_86510 ?auto_86513 ) ( not ( = ?auto_86506 ?auto_86513 ) ) ( not ( = ?auto_86507 ?auto_86513 ) ) ( not ( = ?auto_86508 ?auto_86513 ) ) ( not ( = ?auto_86509 ?auto_86513 ) ) ( not ( = ?auto_86510 ?auto_86513 ) ) ( ON-TABLE ?auto_86512 ) ( ON ?auto_86513 ?auto_86512 ) ( not ( = ?auto_86512 ?auto_86513 ) ) ( not ( = ?auto_86512 ?auto_86510 ) ) ( not ( = ?auto_86512 ?auto_86509 ) ) ( not ( = ?auto_86506 ?auto_86512 ) ) ( not ( = ?auto_86507 ?auto_86512 ) ) ( not ( = ?auto_86508 ?auto_86512 ) ) ( ON ?auto_86506 ?auto_86511 ) ( not ( = ?auto_86506 ?auto_86511 ) ) ( not ( = ?auto_86507 ?auto_86511 ) ) ( not ( = ?auto_86508 ?auto_86511 ) ) ( not ( = ?auto_86509 ?auto_86511 ) ) ( not ( = ?auto_86510 ?auto_86511 ) ) ( not ( = ?auto_86513 ?auto_86511 ) ) ( not ( = ?auto_86512 ?auto_86511 ) ) ( ON ?auto_86507 ?auto_86506 ) ( ON-TABLE ?auto_86511 ) ( ON ?auto_86508 ?auto_86507 ) ( CLEAR ?auto_86510 ) ( ON ?auto_86509 ?auto_86508 ) ( CLEAR ?auto_86509 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86511 ?auto_86506 ?auto_86507 ?auto_86508 )
      ( MAKE-5PILE ?auto_86506 ?auto_86507 ?auto_86508 ?auto_86509 ?auto_86510 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86514 - BLOCK
      ?auto_86515 - BLOCK
      ?auto_86516 - BLOCK
      ?auto_86517 - BLOCK
      ?auto_86518 - BLOCK
    )
    :vars
    (
      ?auto_86520 - BLOCK
      ?auto_86519 - BLOCK
      ?auto_86521 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86514 ?auto_86515 ) ) ( not ( = ?auto_86514 ?auto_86516 ) ) ( not ( = ?auto_86514 ?auto_86517 ) ) ( not ( = ?auto_86514 ?auto_86518 ) ) ( not ( = ?auto_86515 ?auto_86516 ) ) ( not ( = ?auto_86515 ?auto_86517 ) ) ( not ( = ?auto_86515 ?auto_86518 ) ) ( not ( = ?auto_86516 ?auto_86517 ) ) ( not ( = ?auto_86516 ?auto_86518 ) ) ( not ( = ?auto_86517 ?auto_86518 ) ) ( not ( = ?auto_86514 ?auto_86520 ) ) ( not ( = ?auto_86515 ?auto_86520 ) ) ( not ( = ?auto_86516 ?auto_86520 ) ) ( not ( = ?auto_86517 ?auto_86520 ) ) ( not ( = ?auto_86518 ?auto_86520 ) ) ( ON-TABLE ?auto_86519 ) ( ON ?auto_86520 ?auto_86519 ) ( not ( = ?auto_86519 ?auto_86520 ) ) ( not ( = ?auto_86519 ?auto_86518 ) ) ( not ( = ?auto_86519 ?auto_86517 ) ) ( not ( = ?auto_86514 ?auto_86519 ) ) ( not ( = ?auto_86515 ?auto_86519 ) ) ( not ( = ?auto_86516 ?auto_86519 ) ) ( ON ?auto_86514 ?auto_86521 ) ( not ( = ?auto_86514 ?auto_86521 ) ) ( not ( = ?auto_86515 ?auto_86521 ) ) ( not ( = ?auto_86516 ?auto_86521 ) ) ( not ( = ?auto_86517 ?auto_86521 ) ) ( not ( = ?auto_86518 ?auto_86521 ) ) ( not ( = ?auto_86520 ?auto_86521 ) ) ( not ( = ?auto_86519 ?auto_86521 ) ) ( ON ?auto_86515 ?auto_86514 ) ( ON-TABLE ?auto_86521 ) ( ON ?auto_86516 ?auto_86515 ) ( ON ?auto_86517 ?auto_86516 ) ( CLEAR ?auto_86517 ) ( HOLDING ?auto_86518 ) ( CLEAR ?auto_86520 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86519 ?auto_86520 ?auto_86518 )
      ( MAKE-5PILE ?auto_86514 ?auto_86515 ?auto_86516 ?auto_86517 ?auto_86518 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86522 - BLOCK
      ?auto_86523 - BLOCK
      ?auto_86524 - BLOCK
      ?auto_86525 - BLOCK
      ?auto_86526 - BLOCK
    )
    :vars
    (
      ?auto_86527 - BLOCK
      ?auto_86528 - BLOCK
      ?auto_86529 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86522 ?auto_86523 ) ) ( not ( = ?auto_86522 ?auto_86524 ) ) ( not ( = ?auto_86522 ?auto_86525 ) ) ( not ( = ?auto_86522 ?auto_86526 ) ) ( not ( = ?auto_86523 ?auto_86524 ) ) ( not ( = ?auto_86523 ?auto_86525 ) ) ( not ( = ?auto_86523 ?auto_86526 ) ) ( not ( = ?auto_86524 ?auto_86525 ) ) ( not ( = ?auto_86524 ?auto_86526 ) ) ( not ( = ?auto_86525 ?auto_86526 ) ) ( not ( = ?auto_86522 ?auto_86527 ) ) ( not ( = ?auto_86523 ?auto_86527 ) ) ( not ( = ?auto_86524 ?auto_86527 ) ) ( not ( = ?auto_86525 ?auto_86527 ) ) ( not ( = ?auto_86526 ?auto_86527 ) ) ( ON-TABLE ?auto_86528 ) ( ON ?auto_86527 ?auto_86528 ) ( not ( = ?auto_86528 ?auto_86527 ) ) ( not ( = ?auto_86528 ?auto_86526 ) ) ( not ( = ?auto_86528 ?auto_86525 ) ) ( not ( = ?auto_86522 ?auto_86528 ) ) ( not ( = ?auto_86523 ?auto_86528 ) ) ( not ( = ?auto_86524 ?auto_86528 ) ) ( ON ?auto_86522 ?auto_86529 ) ( not ( = ?auto_86522 ?auto_86529 ) ) ( not ( = ?auto_86523 ?auto_86529 ) ) ( not ( = ?auto_86524 ?auto_86529 ) ) ( not ( = ?auto_86525 ?auto_86529 ) ) ( not ( = ?auto_86526 ?auto_86529 ) ) ( not ( = ?auto_86527 ?auto_86529 ) ) ( not ( = ?auto_86528 ?auto_86529 ) ) ( ON ?auto_86523 ?auto_86522 ) ( ON-TABLE ?auto_86529 ) ( ON ?auto_86524 ?auto_86523 ) ( ON ?auto_86525 ?auto_86524 ) ( CLEAR ?auto_86527 ) ( ON ?auto_86526 ?auto_86525 ) ( CLEAR ?auto_86526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_86529 ?auto_86522 ?auto_86523 ?auto_86524 ?auto_86525 )
      ( MAKE-5PILE ?auto_86522 ?auto_86523 ?auto_86524 ?auto_86525 ?auto_86526 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86530 - BLOCK
      ?auto_86531 - BLOCK
      ?auto_86532 - BLOCK
      ?auto_86533 - BLOCK
      ?auto_86534 - BLOCK
    )
    :vars
    (
      ?auto_86537 - BLOCK
      ?auto_86535 - BLOCK
      ?auto_86536 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86530 ?auto_86531 ) ) ( not ( = ?auto_86530 ?auto_86532 ) ) ( not ( = ?auto_86530 ?auto_86533 ) ) ( not ( = ?auto_86530 ?auto_86534 ) ) ( not ( = ?auto_86531 ?auto_86532 ) ) ( not ( = ?auto_86531 ?auto_86533 ) ) ( not ( = ?auto_86531 ?auto_86534 ) ) ( not ( = ?auto_86532 ?auto_86533 ) ) ( not ( = ?auto_86532 ?auto_86534 ) ) ( not ( = ?auto_86533 ?auto_86534 ) ) ( not ( = ?auto_86530 ?auto_86537 ) ) ( not ( = ?auto_86531 ?auto_86537 ) ) ( not ( = ?auto_86532 ?auto_86537 ) ) ( not ( = ?auto_86533 ?auto_86537 ) ) ( not ( = ?auto_86534 ?auto_86537 ) ) ( ON-TABLE ?auto_86535 ) ( not ( = ?auto_86535 ?auto_86537 ) ) ( not ( = ?auto_86535 ?auto_86534 ) ) ( not ( = ?auto_86535 ?auto_86533 ) ) ( not ( = ?auto_86530 ?auto_86535 ) ) ( not ( = ?auto_86531 ?auto_86535 ) ) ( not ( = ?auto_86532 ?auto_86535 ) ) ( ON ?auto_86530 ?auto_86536 ) ( not ( = ?auto_86530 ?auto_86536 ) ) ( not ( = ?auto_86531 ?auto_86536 ) ) ( not ( = ?auto_86532 ?auto_86536 ) ) ( not ( = ?auto_86533 ?auto_86536 ) ) ( not ( = ?auto_86534 ?auto_86536 ) ) ( not ( = ?auto_86537 ?auto_86536 ) ) ( not ( = ?auto_86535 ?auto_86536 ) ) ( ON ?auto_86531 ?auto_86530 ) ( ON-TABLE ?auto_86536 ) ( ON ?auto_86532 ?auto_86531 ) ( ON ?auto_86533 ?auto_86532 ) ( ON ?auto_86534 ?auto_86533 ) ( CLEAR ?auto_86534 ) ( HOLDING ?auto_86537 ) ( CLEAR ?auto_86535 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86535 ?auto_86537 )
      ( MAKE-5PILE ?auto_86530 ?auto_86531 ?auto_86532 ?auto_86533 ?auto_86534 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86538 - BLOCK
      ?auto_86539 - BLOCK
      ?auto_86540 - BLOCK
      ?auto_86541 - BLOCK
      ?auto_86542 - BLOCK
    )
    :vars
    (
      ?auto_86544 - BLOCK
      ?auto_86543 - BLOCK
      ?auto_86545 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86538 ?auto_86539 ) ) ( not ( = ?auto_86538 ?auto_86540 ) ) ( not ( = ?auto_86538 ?auto_86541 ) ) ( not ( = ?auto_86538 ?auto_86542 ) ) ( not ( = ?auto_86539 ?auto_86540 ) ) ( not ( = ?auto_86539 ?auto_86541 ) ) ( not ( = ?auto_86539 ?auto_86542 ) ) ( not ( = ?auto_86540 ?auto_86541 ) ) ( not ( = ?auto_86540 ?auto_86542 ) ) ( not ( = ?auto_86541 ?auto_86542 ) ) ( not ( = ?auto_86538 ?auto_86544 ) ) ( not ( = ?auto_86539 ?auto_86544 ) ) ( not ( = ?auto_86540 ?auto_86544 ) ) ( not ( = ?auto_86541 ?auto_86544 ) ) ( not ( = ?auto_86542 ?auto_86544 ) ) ( ON-TABLE ?auto_86543 ) ( not ( = ?auto_86543 ?auto_86544 ) ) ( not ( = ?auto_86543 ?auto_86542 ) ) ( not ( = ?auto_86543 ?auto_86541 ) ) ( not ( = ?auto_86538 ?auto_86543 ) ) ( not ( = ?auto_86539 ?auto_86543 ) ) ( not ( = ?auto_86540 ?auto_86543 ) ) ( ON ?auto_86538 ?auto_86545 ) ( not ( = ?auto_86538 ?auto_86545 ) ) ( not ( = ?auto_86539 ?auto_86545 ) ) ( not ( = ?auto_86540 ?auto_86545 ) ) ( not ( = ?auto_86541 ?auto_86545 ) ) ( not ( = ?auto_86542 ?auto_86545 ) ) ( not ( = ?auto_86544 ?auto_86545 ) ) ( not ( = ?auto_86543 ?auto_86545 ) ) ( ON ?auto_86539 ?auto_86538 ) ( ON-TABLE ?auto_86545 ) ( ON ?auto_86540 ?auto_86539 ) ( ON ?auto_86541 ?auto_86540 ) ( ON ?auto_86542 ?auto_86541 ) ( CLEAR ?auto_86543 ) ( ON ?auto_86544 ?auto_86542 ) ( CLEAR ?auto_86544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_86545 ?auto_86538 ?auto_86539 ?auto_86540 ?auto_86541 ?auto_86542 )
      ( MAKE-5PILE ?auto_86538 ?auto_86539 ?auto_86540 ?auto_86541 ?auto_86542 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86546 - BLOCK
      ?auto_86547 - BLOCK
      ?auto_86548 - BLOCK
      ?auto_86549 - BLOCK
      ?auto_86550 - BLOCK
    )
    :vars
    (
      ?auto_86553 - BLOCK
      ?auto_86552 - BLOCK
      ?auto_86551 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86546 ?auto_86547 ) ) ( not ( = ?auto_86546 ?auto_86548 ) ) ( not ( = ?auto_86546 ?auto_86549 ) ) ( not ( = ?auto_86546 ?auto_86550 ) ) ( not ( = ?auto_86547 ?auto_86548 ) ) ( not ( = ?auto_86547 ?auto_86549 ) ) ( not ( = ?auto_86547 ?auto_86550 ) ) ( not ( = ?auto_86548 ?auto_86549 ) ) ( not ( = ?auto_86548 ?auto_86550 ) ) ( not ( = ?auto_86549 ?auto_86550 ) ) ( not ( = ?auto_86546 ?auto_86553 ) ) ( not ( = ?auto_86547 ?auto_86553 ) ) ( not ( = ?auto_86548 ?auto_86553 ) ) ( not ( = ?auto_86549 ?auto_86553 ) ) ( not ( = ?auto_86550 ?auto_86553 ) ) ( not ( = ?auto_86552 ?auto_86553 ) ) ( not ( = ?auto_86552 ?auto_86550 ) ) ( not ( = ?auto_86552 ?auto_86549 ) ) ( not ( = ?auto_86546 ?auto_86552 ) ) ( not ( = ?auto_86547 ?auto_86552 ) ) ( not ( = ?auto_86548 ?auto_86552 ) ) ( ON ?auto_86546 ?auto_86551 ) ( not ( = ?auto_86546 ?auto_86551 ) ) ( not ( = ?auto_86547 ?auto_86551 ) ) ( not ( = ?auto_86548 ?auto_86551 ) ) ( not ( = ?auto_86549 ?auto_86551 ) ) ( not ( = ?auto_86550 ?auto_86551 ) ) ( not ( = ?auto_86553 ?auto_86551 ) ) ( not ( = ?auto_86552 ?auto_86551 ) ) ( ON ?auto_86547 ?auto_86546 ) ( ON-TABLE ?auto_86551 ) ( ON ?auto_86548 ?auto_86547 ) ( ON ?auto_86549 ?auto_86548 ) ( ON ?auto_86550 ?auto_86549 ) ( ON ?auto_86553 ?auto_86550 ) ( CLEAR ?auto_86553 ) ( HOLDING ?auto_86552 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_86552 )
      ( MAKE-5PILE ?auto_86546 ?auto_86547 ?auto_86548 ?auto_86549 ?auto_86550 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86554 - BLOCK
      ?auto_86555 - BLOCK
      ?auto_86556 - BLOCK
      ?auto_86557 - BLOCK
      ?auto_86558 - BLOCK
    )
    :vars
    (
      ?auto_86561 - BLOCK
      ?auto_86559 - BLOCK
      ?auto_86560 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86554 ?auto_86555 ) ) ( not ( = ?auto_86554 ?auto_86556 ) ) ( not ( = ?auto_86554 ?auto_86557 ) ) ( not ( = ?auto_86554 ?auto_86558 ) ) ( not ( = ?auto_86555 ?auto_86556 ) ) ( not ( = ?auto_86555 ?auto_86557 ) ) ( not ( = ?auto_86555 ?auto_86558 ) ) ( not ( = ?auto_86556 ?auto_86557 ) ) ( not ( = ?auto_86556 ?auto_86558 ) ) ( not ( = ?auto_86557 ?auto_86558 ) ) ( not ( = ?auto_86554 ?auto_86561 ) ) ( not ( = ?auto_86555 ?auto_86561 ) ) ( not ( = ?auto_86556 ?auto_86561 ) ) ( not ( = ?auto_86557 ?auto_86561 ) ) ( not ( = ?auto_86558 ?auto_86561 ) ) ( not ( = ?auto_86559 ?auto_86561 ) ) ( not ( = ?auto_86559 ?auto_86558 ) ) ( not ( = ?auto_86559 ?auto_86557 ) ) ( not ( = ?auto_86554 ?auto_86559 ) ) ( not ( = ?auto_86555 ?auto_86559 ) ) ( not ( = ?auto_86556 ?auto_86559 ) ) ( ON ?auto_86554 ?auto_86560 ) ( not ( = ?auto_86554 ?auto_86560 ) ) ( not ( = ?auto_86555 ?auto_86560 ) ) ( not ( = ?auto_86556 ?auto_86560 ) ) ( not ( = ?auto_86557 ?auto_86560 ) ) ( not ( = ?auto_86558 ?auto_86560 ) ) ( not ( = ?auto_86561 ?auto_86560 ) ) ( not ( = ?auto_86559 ?auto_86560 ) ) ( ON ?auto_86555 ?auto_86554 ) ( ON-TABLE ?auto_86560 ) ( ON ?auto_86556 ?auto_86555 ) ( ON ?auto_86557 ?auto_86556 ) ( ON ?auto_86558 ?auto_86557 ) ( ON ?auto_86561 ?auto_86558 ) ( ON ?auto_86559 ?auto_86561 ) ( CLEAR ?auto_86559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_86560 ?auto_86554 ?auto_86555 ?auto_86556 ?auto_86557 ?auto_86558 ?auto_86561 )
      ( MAKE-5PILE ?auto_86554 ?auto_86555 ?auto_86556 ?auto_86557 ?auto_86558 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86563 - BLOCK
    )
    :vars
    (
      ?auto_86564 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86564 ?auto_86563 ) ( CLEAR ?auto_86564 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_86563 ) ( not ( = ?auto_86563 ?auto_86564 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_86564 ?auto_86563 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86565 - BLOCK
    )
    :vars
    (
      ?auto_86566 - BLOCK
      ?auto_86567 - BLOCK
      ?auto_86568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86566 ?auto_86565 ) ( CLEAR ?auto_86566 ) ( ON-TABLE ?auto_86565 ) ( not ( = ?auto_86565 ?auto_86566 ) ) ( HOLDING ?auto_86567 ) ( CLEAR ?auto_86568 ) ( not ( = ?auto_86565 ?auto_86567 ) ) ( not ( = ?auto_86565 ?auto_86568 ) ) ( not ( = ?auto_86566 ?auto_86567 ) ) ( not ( = ?auto_86566 ?auto_86568 ) ) ( not ( = ?auto_86567 ?auto_86568 ) ) )
    :subtasks
    ( ( !STACK ?auto_86567 ?auto_86568 )
      ( MAKE-1PILE ?auto_86565 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86569 - BLOCK
    )
    :vars
    (
      ?auto_86570 - BLOCK
      ?auto_86571 - BLOCK
      ?auto_86572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86570 ?auto_86569 ) ( ON-TABLE ?auto_86569 ) ( not ( = ?auto_86569 ?auto_86570 ) ) ( CLEAR ?auto_86571 ) ( not ( = ?auto_86569 ?auto_86572 ) ) ( not ( = ?auto_86569 ?auto_86571 ) ) ( not ( = ?auto_86570 ?auto_86572 ) ) ( not ( = ?auto_86570 ?auto_86571 ) ) ( not ( = ?auto_86572 ?auto_86571 ) ) ( ON ?auto_86572 ?auto_86570 ) ( CLEAR ?auto_86572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86569 ?auto_86570 )
      ( MAKE-1PILE ?auto_86569 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86573 - BLOCK
    )
    :vars
    (
      ?auto_86575 - BLOCK
      ?auto_86576 - BLOCK
      ?auto_86574 - BLOCK
      ?auto_86579 - BLOCK
      ?auto_86577 - BLOCK
      ?auto_86578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86575 ?auto_86573 ) ( ON-TABLE ?auto_86573 ) ( not ( = ?auto_86573 ?auto_86575 ) ) ( not ( = ?auto_86573 ?auto_86576 ) ) ( not ( = ?auto_86573 ?auto_86574 ) ) ( not ( = ?auto_86575 ?auto_86576 ) ) ( not ( = ?auto_86575 ?auto_86574 ) ) ( not ( = ?auto_86576 ?auto_86574 ) ) ( ON ?auto_86576 ?auto_86575 ) ( CLEAR ?auto_86576 ) ( HOLDING ?auto_86574 ) ( CLEAR ?auto_86579 ) ( ON-TABLE ?auto_86577 ) ( ON ?auto_86578 ?auto_86577 ) ( ON ?auto_86579 ?auto_86578 ) ( not ( = ?auto_86577 ?auto_86578 ) ) ( not ( = ?auto_86577 ?auto_86579 ) ) ( not ( = ?auto_86577 ?auto_86574 ) ) ( not ( = ?auto_86578 ?auto_86579 ) ) ( not ( = ?auto_86578 ?auto_86574 ) ) ( not ( = ?auto_86579 ?auto_86574 ) ) ( not ( = ?auto_86573 ?auto_86579 ) ) ( not ( = ?auto_86573 ?auto_86577 ) ) ( not ( = ?auto_86573 ?auto_86578 ) ) ( not ( = ?auto_86575 ?auto_86579 ) ) ( not ( = ?auto_86575 ?auto_86577 ) ) ( not ( = ?auto_86575 ?auto_86578 ) ) ( not ( = ?auto_86576 ?auto_86579 ) ) ( not ( = ?auto_86576 ?auto_86577 ) ) ( not ( = ?auto_86576 ?auto_86578 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86577 ?auto_86578 ?auto_86579 ?auto_86574 )
      ( MAKE-1PILE ?auto_86573 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86580 - BLOCK
    )
    :vars
    (
      ?auto_86583 - BLOCK
      ?auto_86582 - BLOCK
      ?auto_86586 - BLOCK
      ?auto_86584 - BLOCK
      ?auto_86581 - BLOCK
      ?auto_86585 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86583 ?auto_86580 ) ( ON-TABLE ?auto_86580 ) ( not ( = ?auto_86580 ?auto_86583 ) ) ( not ( = ?auto_86580 ?auto_86582 ) ) ( not ( = ?auto_86580 ?auto_86586 ) ) ( not ( = ?auto_86583 ?auto_86582 ) ) ( not ( = ?auto_86583 ?auto_86586 ) ) ( not ( = ?auto_86582 ?auto_86586 ) ) ( ON ?auto_86582 ?auto_86583 ) ( CLEAR ?auto_86584 ) ( ON-TABLE ?auto_86581 ) ( ON ?auto_86585 ?auto_86581 ) ( ON ?auto_86584 ?auto_86585 ) ( not ( = ?auto_86581 ?auto_86585 ) ) ( not ( = ?auto_86581 ?auto_86584 ) ) ( not ( = ?auto_86581 ?auto_86586 ) ) ( not ( = ?auto_86585 ?auto_86584 ) ) ( not ( = ?auto_86585 ?auto_86586 ) ) ( not ( = ?auto_86584 ?auto_86586 ) ) ( not ( = ?auto_86580 ?auto_86584 ) ) ( not ( = ?auto_86580 ?auto_86581 ) ) ( not ( = ?auto_86580 ?auto_86585 ) ) ( not ( = ?auto_86583 ?auto_86584 ) ) ( not ( = ?auto_86583 ?auto_86581 ) ) ( not ( = ?auto_86583 ?auto_86585 ) ) ( not ( = ?auto_86582 ?auto_86584 ) ) ( not ( = ?auto_86582 ?auto_86581 ) ) ( not ( = ?auto_86582 ?auto_86585 ) ) ( ON ?auto_86586 ?auto_86582 ) ( CLEAR ?auto_86586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86580 ?auto_86583 ?auto_86582 )
      ( MAKE-1PILE ?auto_86580 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86587 - BLOCK
    )
    :vars
    (
      ?auto_86592 - BLOCK
      ?auto_86588 - BLOCK
      ?auto_86590 - BLOCK
      ?auto_86589 - BLOCK
      ?auto_86591 - BLOCK
      ?auto_86593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86592 ?auto_86587 ) ( ON-TABLE ?auto_86587 ) ( not ( = ?auto_86587 ?auto_86592 ) ) ( not ( = ?auto_86587 ?auto_86588 ) ) ( not ( = ?auto_86587 ?auto_86590 ) ) ( not ( = ?auto_86592 ?auto_86588 ) ) ( not ( = ?auto_86592 ?auto_86590 ) ) ( not ( = ?auto_86588 ?auto_86590 ) ) ( ON ?auto_86588 ?auto_86592 ) ( ON-TABLE ?auto_86589 ) ( ON ?auto_86591 ?auto_86589 ) ( not ( = ?auto_86589 ?auto_86591 ) ) ( not ( = ?auto_86589 ?auto_86593 ) ) ( not ( = ?auto_86589 ?auto_86590 ) ) ( not ( = ?auto_86591 ?auto_86593 ) ) ( not ( = ?auto_86591 ?auto_86590 ) ) ( not ( = ?auto_86593 ?auto_86590 ) ) ( not ( = ?auto_86587 ?auto_86593 ) ) ( not ( = ?auto_86587 ?auto_86589 ) ) ( not ( = ?auto_86587 ?auto_86591 ) ) ( not ( = ?auto_86592 ?auto_86593 ) ) ( not ( = ?auto_86592 ?auto_86589 ) ) ( not ( = ?auto_86592 ?auto_86591 ) ) ( not ( = ?auto_86588 ?auto_86593 ) ) ( not ( = ?auto_86588 ?auto_86589 ) ) ( not ( = ?auto_86588 ?auto_86591 ) ) ( ON ?auto_86590 ?auto_86588 ) ( CLEAR ?auto_86590 ) ( HOLDING ?auto_86593 ) ( CLEAR ?auto_86591 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86589 ?auto_86591 ?auto_86593 )
      ( MAKE-1PILE ?auto_86587 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86594 - BLOCK
    )
    :vars
    (
      ?auto_86595 - BLOCK
      ?auto_86598 - BLOCK
      ?auto_86599 - BLOCK
      ?auto_86597 - BLOCK
      ?auto_86600 - BLOCK
      ?auto_86596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86595 ?auto_86594 ) ( ON-TABLE ?auto_86594 ) ( not ( = ?auto_86594 ?auto_86595 ) ) ( not ( = ?auto_86594 ?auto_86598 ) ) ( not ( = ?auto_86594 ?auto_86599 ) ) ( not ( = ?auto_86595 ?auto_86598 ) ) ( not ( = ?auto_86595 ?auto_86599 ) ) ( not ( = ?auto_86598 ?auto_86599 ) ) ( ON ?auto_86598 ?auto_86595 ) ( ON-TABLE ?auto_86597 ) ( ON ?auto_86600 ?auto_86597 ) ( not ( = ?auto_86597 ?auto_86600 ) ) ( not ( = ?auto_86597 ?auto_86596 ) ) ( not ( = ?auto_86597 ?auto_86599 ) ) ( not ( = ?auto_86600 ?auto_86596 ) ) ( not ( = ?auto_86600 ?auto_86599 ) ) ( not ( = ?auto_86596 ?auto_86599 ) ) ( not ( = ?auto_86594 ?auto_86596 ) ) ( not ( = ?auto_86594 ?auto_86597 ) ) ( not ( = ?auto_86594 ?auto_86600 ) ) ( not ( = ?auto_86595 ?auto_86596 ) ) ( not ( = ?auto_86595 ?auto_86597 ) ) ( not ( = ?auto_86595 ?auto_86600 ) ) ( not ( = ?auto_86598 ?auto_86596 ) ) ( not ( = ?auto_86598 ?auto_86597 ) ) ( not ( = ?auto_86598 ?auto_86600 ) ) ( ON ?auto_86599 ?auto_86598 ) ( CLEAR ?auto_86600 ) ( ON ?auto_86596 ?auto_86599 ) ( CLEAR ?auto_86596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86594 ?auto_86595 ?auto_86598 ?auto_86599 )
      ( MAKE-1PILE ?auto_86594 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86601 - BLOCK
    )
    :vars
    (
      ?auto_86607 - BLOCK
      ?auto_86602 - BLOCK
      ?auto_86604 - BLOCK
      ?auto_86603 - BLOCK
      ?auto_86605 - BLOCK
      ?auto_86606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86607 ?auto_86601 ) ( ON-TABLE ?auto_86601 ) ( not ( = ?auto_86601 ?auto_86607 ) ) ( not ( = ?auto_86601 ?auto_86602 ) ) ( not ( = ?auto_86601 ?auto_86604 ) ) ( not ( = ?auto_86607 ?auto_86602 ) ) ( not ( = ?auto_86607 ?auto_86604 ) ) ( not ( = ?auto_86602 ?auto_86604 ) ) ( ON ?auto_86602 ?auto_86607 ) ( ON-TABLE ?auto_86603 ) ( not ( = ?auto_86603 ?auto_86605 ) ) ( not ( = ?auto_86603 ?auto_86606 ) ) ( not ( = ?auto_86603 ?auto_86604 ) ) ( not ( = ?auto_86605 ?auto_86606 ) ) ( not ( = ?auto_86605 ?auto_86604 ) ) ( not ( = ?auto_86606 ?auto_86604 ) ) ( not ( = ?auto_86601 ?auto_86606 ) ) ( not ( = ?auto_86601 ?auto_86603 ) ) ( not ( = ?auto_86601 ?auto_86605 ) ) ( not ( = ?auto_86607 ?auto_86606 ) ) ( not ( = ?auto_86607 ?auto_86603 ) ) ( not ( = ?auto_86607 ?auto_86605 ) ) ( not ( = ?auto_86602 ?auto_86606 ) ) ( not ( = ?auto_86602 ?auto_86603 ) ) ( not ( = ?auto_86602 ?auto_86605 ) ) ( ON ?auto_86604 ?auto_86602 ) ( ON ?auto_86606 ?auto_86604 ) ( CLEAR ?auto_86606 ) ( HOLDING ?auto_86605 ) ( CLEAR ?auto_86603 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86603 ?auto_86605 )
      ( MAKE-1PILE ?auto_86601 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86608 - BLOCK
    )
    :vars
    (
      ?auto_86611 - BLOCK
      ?auto_86612 - BLOCK
      ?auto_86614 - BLOCK
      ?auto_86609 - BLOCK
      ?auto_86610 - BLOCK
      ?auto_86613 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86611 ?auto_86608 ) ( ON-TABLE ?auto_86608 ) ( not ( = ?auto_86608 ?auto_86611 ) ) ( not ( = ?auto_86608 ?auto_86612 ) ) ( not ( = ?auto_86608 ?auto_86614 ) ) ( not ( = ?auto_86611 ?auto_86612 ) ) ( not ( = ?auto_86611 ?auto_86614 ) ) ( not ( = ?auto_86612 ?auto_86614 ) ) ( ON ?auto_86612 ?auto_86611 ) ( ON-TABLE ?auto_86609 ) ( not ( = ?auto_86609 ?auto_86610 ) ) ( not ( = ?auto_86609 ?auto_86613 ) ) ( not ( = ?auto_86609 ?auto_86614 ) ) ( not ( = ?auto_86610 ?auto_86613 ) ) ( not ( = ?auto_86610 ?auto_86614 ) ) ( not ( = ?auto_86613 ?auto_86614 ) ) ( not ( = ?auto_86608 ?auto_86613 ) ) ( not ( = ?auto_86608 ?auto_86609 ) ) ( not ( = ?auto_86608 ?auto_86610 ) ) ( not ( = ?auto_86611 ?auto_86613 ) ) ( not ( = ?auto_86611 ?auto_86609 ) ) ( not ( = ?auto_86611 ?auto_86610 ) ) ( not ( = ?auto_86612 ?auto_86613 ) ) ( not ( = ?auto_86612 ?auto_86609 ) ) ( not ( = ?auto_86612 ?auto_86610 ) ) ( ON ?auto_86614 ?auto_86612 ) ( ON ?auto_86613 ?auto_86614 ) ( CLEAR ?auto_86609 ) ( ON ?auto_86610 ?auto_86613 ) ( CLEAR ?auto_86610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_86608 ?auto_86611 ?auto_86612 ?auto_86614 ?auto_86613 )
      ( MAKE-1PILE ?auto_86608 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86615 - BLOCK
    )
    :vars
    (
      ?auto_86617 - BLOCK
      ?auto_86618 - BLOCK
      ?auto_86619 - BLOCK
      ?auto_86616 - BLOCK
      ?auto_86620 - BLOCK
      ?auto_86621 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86617 ?auto_86615 ) ( ON-TABLE ?auto_86615 ) ( not ( = ?auto_86615 ?auto_86617 ) ) ( not ( = ?auto_86615 ?auto_86618 ) ) ( not ( = ?auto_86615 ?auto_86619 ) ) ( not ( = ?auto_86617 ?auto_86618 ) ) ( not ( = ?auto_86617 ?auto_86619 ) ) ( not ( = ?auto_86618 ?auto_86619 ) ) ( ON ?auto_86618 ?auto_86617 ) ( not ( = ?auto_86616 ?auto_86620 ) ) ( not ( = ?auto_86616 ?auto_86621 ) ) ( not ( = ?auto_86616 ?auto_86619 ) ) ( not ( = ?auto_86620 ?auto_86621 ) ) ( not ( = ?auto_86620 ?auto_86619 ) ) ( not ( = ?auto_86621 ?auto_86619 ) ) ( not ( = ?auto_86615 ?auto_86621 ) ) ( not ( = ?auto_86615 ?auto_86616 ) ) ( not ( = ?auto_86615 ?auto_86620 ) ) ( not ( = ?auto_86617 ?auto_86621 ) ) ( not ( = ?auto_86617 ?auto_86616 ) ) ( not ( = ?auto_86617 ?auto_86620 ) ) ( not ( = ?auto_86618 ?auto_86621 ) ) ( not ( = ?auto_86618 ?auto_86616 ) ) ( not ( = ?auto_86618 ?auto_86620 ) ) ( ON ?auto_86619 ?auto_86618 ) ( ON ?auto_86621 ?auto_86619 ) ( ON ?auto_86620 ?auto_86621 ) ( CLEAR ?auto_86620 ) ( HOLDING ?auto_86616 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_86616 )
      ( MAKE-1PILE ?auto_86615 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86622 - BLOCK
    )
    :vars
    (
      ?auto_86625 - BLOCK
      ?auto_86626 - BLOCK
      ?auto_86628 - BLOCK
      ?auto_86624 - BLOCK
      ?auto_86627 - BLOCK
      ?auto_86623 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86625 ?auto_86622 ) ( ON-TABLE ?auto_86622 ) ( not ( = ?auto_86622 ?auto_86625 ) ) ( not ( = ?auto_86622 ?auto_86626 ) ) ( not ( = ?auto_86622 ?auto_86628 ) ) ( not ( = ?auto_86625 ?auto_86626 ) ) ( not ( = ?auto_86625 ?auto_86628 ) ) ( not ( = ?auto_86626 ?auto_86628 ) ) ( ON ?auto_86626 ?auto_86625 ) ( not ( = ?auto_86624 ?auto_86627 ) ) ( not ( = ?auto_86624 ?auto_86623 ) ) ( not ( = ?auto_86624 ?auto_86628 ) ) ( not ( = ?auto_86627 ?auto_86623 ) ) ( not ( = ?auto_86627 ?auto_86628 ) ) ( not ( = ?auto_86623 ?auto_86628 ) ) ( not ( = ?auto_86622 ?auto_86623 ) ) ( not ( = ?auto_86622 ?auto_86624 ) ) ( not ( = ?auto_86622 ?auto_86627 ) ) ( not ( = ?auto_86625 ?auto_86623 ) ) ( not ( = ?auto_86625 ?auto_86624 ) ) ( not ( = ?auto_86625 ?auto_86627 ) ) ( not ( = ?auto_86626 ?auto_86623 ) ) ( not ( = ?auto_86626 ?auto_86624 ) ) ( not ( = ?auto_86626 ?auto_86627 ) ) ( ON ?auto_86628 ?auto_86626 ) ( ON ?auto_86623 ?auto_86628 ) ( ON ?auto_86627 ?auto_86623 ) ( ON ?auto_86624 ?auto_86627 ) ( CLEAR ?auto_86624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_86622 ?auto_86625 ?auto_86626 ?auto_86628 ?auto_86623 ?auto_86627 )
      ( MAKE-1PILE ?auto_86622 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86629 - BLOCK
    )
    :vars
    (
      ?auto_86633 - BLOCK
      ?auto_86635 - BLOCK
      ?auto_86634 - BLOCK
      ?auto_86631 - BLOCK
      ?auto_86632 - BLOCK
      ?auto_86630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86633 ?auto_86629 ) ( ON-TABLE ?auto_86629 ) ( not ( = ?auto_86629 ?auto_86633 ) ) ( not ( = ?auto_86629 ?auto_86635 ) ) ( not ( = ?auto_86629 ?auto_86634 ) ) ( not ( = ?auto_86633 ?auto_86635 ) ) ( not ( = ?auto_86633 ?auto_86634 ) ) ( not ( = ?auto_86635 ?auto_86634 ) ) ( ON ?auto_86635 ?auto_86633 ) ( not ( = ?auto_86631 ?auto_86632 ) ) ( not ( = ?auto_86631 ?auto_86630 ) ) ( not ( = ?auto_86631 ?auto_86634 ) ) ( not ( = ?auto_86632 ?auto_86630 ) ) ( not ( = ?auto_86632 ?auto_86634 ) ) ( not ( = ?auto_86630 ?auto_86634 ) ) ( not ( = ?auto_86629 ?auto_86630 ) ) ( not ( = ?auto_86629 ?auto_86631 ) ) ( not ( = ?auto_86629 ?auto_86632 ) ) ( not ( = ?auto_86633 ?auto_86630 ) ) ( not ( = ?auto_86633 ?auto_86631 ) ) ( not ( = ?auto_86633 ?auto_86632 ) ) ( not ( = ?auto_86635 ?auto_86630 ) ) ( not ( = ?auto_86635 ?auto_86631 ) ) ( not ( = ?auto_86635 ?auto_86632 ) ) ( ON ?auto_86634 ?auto_86635 ) ( ON ?auto_86630 ?auto_86634 ) ( ON ?auto_86632 ?auto_86630 ) ( HOLDING ?auto_86631 ) ( CLEAR ?auto_86632 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_86629 ?auto_86633 ?auto_86635 ?auto_86634 ?auto_86630 ?auto_86632 ?auto_86631 )
      ( MAKE-1PILE ?auto_86629 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86636 - BLOCK
    )
    :vars
    (
      ?auto_86640 - BLOCK
      ?auto_86638 - BLOCK
      ?auto_86637 - BLOCK
      ?auto_86642 - BLOCK
      ?auto_86641 - BLOCK
      ?auto_86639 - BLOCK
      ?auto_86643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86640 ?auto_86636 ) ( ON-TABLE ?auto_86636 ) ( not ( = ?auto_86636 ?auto_86640 ) ) ( not ( = ?auto_86636 ?auto_86638 ) ) ( not ( = ?auto_86636 ?auto_86637 ) ) ( not ( = ?auto_86640 ?auto_86638 ) ) ( not ( = ?auto_86640 ?auto_86637 ) ) ( not ( = ?auto_86638 ?auto_86637 ) ) ( ON ?auto_86638 ?auto_86640 ) ( not ( = ?auto_86642 ?auto_86641 ) ) ( not ( = ?auto_86642 ?auto_86639 ) ) ( not ( = ?auto_86642 ?auto_86637 ) ) ( not ( = ?auto_86641 ?auto_86639 ) ) ( not ( = ?auto_86641 ?auto_86637 ) ) ( not ( = ?auto_86639 ?auto_86637 ) ) ( not ( = ?auto_86636 ?auto_86639 ) ) ( not ( = ?auto_86636 ?auto_86642 ) ) ( not ( = ?auto_86636 ?auto_86641 ) ) ( not ( = ?auto_86640 ?auto_86639 ) ) ( not ( = ?auto_86640 ?auto_86642 ) ) ( not ( = ?auto_86640 ?auto_86641 ) ) ( not ( = ?auto_86638 ?auto_86639 ) ) ( not ( = ?auto_86638 ?auto_86642 ) ) ( not ( = ?auto_86638 ?auto_86641 ) ) ( ON ?auto_86637 ?auto_86638 ) ( ON ?auto_86639 ?auto_86637 ) ( ON ?auto_86641 ?auto_86639 ) ( CLEAR ?auto_86641 ) ( ON ?auto_86642 ?auto_86643 ) ( CLEAR ?auto_86642 ) ( HAND-EMPTY ) ( not ( = ?auto_86636 ?auto_86643 ) ) ( not ( = ?auto_86640 ?auto_86643 ) ) ( not ( = ?auto_86638 ?auto_86643 ) ) ( not ( = ?auto_86637 ?auto_86643 ) ) ( not ( = ?auto_86642 ?auto_86643 ) ) ( not ( = ?auto_86641 ?auto_86643 ) ) ( not ( = ?auto_86639 ?auto_86643 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_86642 ?auto_86643 )
      ( MAKE-1PILE ?auto_86636 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86644 - BLOCK
    )
    :vars
    (
      ?auto_86649 - BLOCK
      ?auto_86647 - BLOCK
      ?auto_86651 - BLOCK
      ?auto_86650 - BLOCK
      ?auto_86648 - BLOCK
      ?auto_86646 - BLOCK
      ?auto_86645 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86649 ?auto_86644 ) ( ON-TABLE ?auto_86644 ) ( not ( = ?auto_86644 ?auto_86649 ) ) ( not ( = ?auto_86644 ?auto_86647 ) ) ( not ( = ?auto_86644 ?auto_86651 ) ) ( not ( = ?auto_86649 ?auto_86647 ) ) ( not ( = ?auto_86649 ?auto_86651 ) ) ( not ( = ?auto_86647 ?auto_86651 ) ) ( ON ?auto_86647 ?auto_86649 ) ( not ( = ?auto_86650 ?auto_86648 ) ) ( not ( = ?auto_86650 ?auto_86646 ) ) ( not ( = ?auto_86650 ?auto_86651 ) ) ( not ( = ?auto_86648 ?auto_86646 ) ) ( not ( = ?auto_86648 ?auto_86651 ) ) ( not ( = ?auto_86646 ?auto_86651 ) ) ( not ( = ?auto_86644 ?auto_86646 ) ) ( not ( = ?auto_86644 ?auto_86650 ) ) ( not ( = ?auto_86644 ?auto_86648 ) ) ( not ( = ?auto_86649 ?auto_86646 ) ) ( not ( = ?auto_86649 ?auto_86650 ) ) ( not ( = ?auto_86649 ?auto_86648 ) ) ( not ( = ?auto_86647 ?auto_86646 ) ) ( not ( = ?auto_86647 ?auto_86650 ) ) ( not ( = ?auto_86647 ?auto_86648 ) ) ( ON ?auto_86651 ?auto_86647 ) ( ON ?auto_86646 ?auto_86651 ) ( ON ?auto_86650 ?auto_86645 ) ( CLEAR ?auto_86650 ) ( not ( = ?auto_86644 ?auto_86645 ) ) ( not ( = ?auto_86649 ?auto_86645 ) ) ( not ( = ?auto_86647 ?auto_86645 ) ) ( not ( = ?auto_86651 ?auto_86645 ) ) ( not ( = ?auto_86650 ?auto_86645 ) ) ( not ( = ?auto_86648 ?auto_86645 ) ) ( not ( = ?auto_86646 ?auto_86645 ) ) ( HOLDING ?auto_86648 ) ( CLEAR ?auto_86646 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_86644 ?auto_86649 ?auto_86647 ?auto_86651 ?auto_86646 ?auto_86648 )
      ( MAKE-1PILE ?auto_86644 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86652 - BLOCK
    )
    :vars
    (
      ?auto_86657 - BLOCK
      ?auto_86655 - BLOCK
      ?auto_86656 - BLOCK
      ?auto_86658 - BLOCK
      ?auto_86654 - BLOCK
      ?auto_86653 - BLOCK
      ?auto_86659 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86657 ?auto_86652 ) ( ON-TABLE ?auto_86652 ) ( not ( = ?auto_86652 ?auto_86657 ) ) ( not ( = ?auto_86652 ?auto_86655 ) ) ( not ( = ?auto_86652 ?auto_86656 ) ) ( not ( = ?auto_86657 ?auto_86655 ) ) ( not ( = ?auto_86657 ?auto_86656 ) ) ( not ( = ?auto_86655 ?auto_86656 ) ) ( ON ?auto_86655 ?auto_86657 ) ( not ( = ?auto_86658 ?auto_86654 ) ) ( not ( = ?auto_86658 ?auto_86653 ) ) ( not ( = ?auto_86658 ?auto_86656 ) ) ( not ( = ?auto_86654 ?auto_86653 ) ) ( not ( = ?auto_86654 ?auto_86656 ) ) ( not ( = ?auto_86653 ?auto_86656 ) ) ( not ( = ?auto_86652 ?auto_86653 ) ) ( not ( = ?auto_86652 ?auto_86658 ) ) ( not ( = ?auto_86652 ?auto_86654 ) ) ( not ( = ?auto_86657 ?auto_86653 ) ) ( not ( = ?auto_86657 ?auto_86658 ) ) ( not ( = ?auto_86657 ?auto_86654 ) ) ( not ( = ?auto_86655 ?auto_86653 ) ) ( not ( = ?auto_86655 ?auto_86658 ) ) ( not ( = ?auto_86655 ?auto_86654 ) ) ( ON ?auto_86656 ?auto_86655 ) ( ON ?auto_86653 ?auto_86656 ) ( ON ?auto_86658 ?auto_86659 ) ( not ( = ?auto_86652 ?auto_86659 ) ) ( not ( = ?auto_86657 ?auto_86659 ) ) ( not ( = ?auto_86655 ?auto_86659 ) ) ( not ( = ?auto_86656 ?auto_86659 ) ) ( not ( = ?auto_86658 ?auto_86659 ) ) ( not ( = ?auto_86654 ?auto_86659 ) ) ( not ( = ?auto_86653 ?auto_86659 ) ) ( CLEAR ?auto_86653 ) ( ON ?auto_86654 ?auto_86658 ) ( CLEAR ?auto_86654 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_86659 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86659 ?auto_86658 )
      ( MAKE-1PILE ?auto_86652 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86660 - BLOCK
    )
    :vars
    (
      ?auto_86663 - BLOCK
      ?auto_86665 - BLOCK
      ?auto_86664 - BLOCK
      ?auto_86662 - BLOCK
      ?auto_86661 - BLOCK
      ?auto_86666 - BLOCK
      ?auto_86667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86663 ?auto_86660 ) ( ON-TABLE ?auto_86660 ) ( not ( = ?auto_86660 ?auto_86663 ) ) ( not ( = ?auto_86660 ?auto_86665 ) ) ( not ( = ?auto_86660 ?auto_86664 ) ) ( not ( = ?auto_86663 ?auto_86665 ) ) ( not ( = ?auto_86663 ?auto_86664 ) ) ( not ( = ?auto_86665 ?auto_86664 ) ) ( ON ?auto_86665 ?auto_86663 ) ( not ( = ?auto_86662 ?auto_86661 ) ) ( not ( = ?auto_86662 ?auto_86666 ) ) ( not ( = ?auto_86662 ?auto_86664 ) ) ( not ( = ?auto_86661 ?auto_86666 ) ) ( not ( = ?auto_86661 ?auto_86664 ) ) ( not ( = ?auto_86666 ?auto_86664 ) ) ( not ( = ?auto_86660 ?auto_86666 ) ) ( not ( = ?auto_86660 ?auto_86662 ) ) ( not ( = ?auto_86660 ?auto_86661 ) ) ( not ( = ?auto_86663 ?auto_86666 ) ) ( not ( = ?auto_86663 ?auto_86662 ) ) ( not ( = ?auto_86663 ?auto_86661 ) ) ( not ( = ?auto_86665 ?auto_86666 ) ) ( not ( = ?auto_86665 ?auto_86662 ) ) ( not ( = ?auto_86665 ?auto_86661 ) ) ( ON ?auto_86664 ?auto_86665 ) ( ON ?auto_86662 ?auto_86667 ) ( not ( = ?auto_86660 ?auto_86667 ) ) ( not ( = ?auto_86663 ?auto_86667 ) ) ( not ( = ?auto_86665 ?auto_86667 ) ) ( not ( = ?auto_86664 ?auto_86667 ) ) ( not ( = ?auto_86662 ?auto_86667 ) ) ( not ( = ?auto_86661 ?auto_86667 ) ) ( not ( = ?auto_86666 ?auto_86667 ) ) ( ON ?auto_86661 ?auto_86662 ) ( CLEAR ?auto_86661 ) ( ON-TABLE ?auto_86667 ) ( HOLDING ?auto_86666 ) ( CLEAR ?auto_86664 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_86660 ?auto_86663 ?auto_86665 ?auto_86664 ?auto_86666 )
      ( MAKE-1PILE ?auto_86660 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86668 - BLOCK
    )
    :vars
    (
      ?auto_86672 - BLOCK
      ?auto_86674 - BLOCK
      ?auto_86670 - BLOCK
      ?auto_86671 - BLOCK
      ?auto_86669 - BLOCK
      ?auto_86675 - BLOCK
      ?auto_86673 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86672 ?auto_86668 ) ( ON-TABLE ?auto_86668 ) ( not ( = ?auto_86668 ?auto_86672 ) ) ( not ( = ?auto_86668 ?auto_86674 ) ) ( not ( = ?auto_86668 ?auto_86670 ) ) ( not ( = ?auto_86672 ?auto_86674 ) ) ( not ( = ?auto_86672 ?auto_86670 ) ) ( not ( = ?auto_86674 ?auto_86670 ) ) ( ON ?auto_86674 ?auto_86672 ) ( not ( = ?auto_86671 ?auto_86669 ) ) ( not ( = ?auto_86671 ?auto_86675 ) ) ( not ( = ?auto_86671 ?auto_86670 ) ) ( not ( = ?auto_86669 ?auto_86675 ) ) ( not ( = ?auto_86669 ?auto_86670 ) ) ( not ( = ?auto_86675 ?auto_86670 ) ) ( not ( = ?auto_86668 ?auto_86675 ) ) ( not ( = ?auto_86668 ?auto_86671 ) ) ( not ( = ?auto_86668 ?auto_86669 ) ) ( not ( = ?auto_86672 ?auto_86675 ) ) ( not ( = ?auto_86672 ?auto_86671 ) ) ( not ( = ?auto_86672 ?auto_86669 ) ) ( not ( = ?auto_86674 ?auto_86675 ) ) ( not ( = ?auto_86674 ?auto_86671 ) ) ( not ( = ?auto_86674 ?auto_86669 ) ) ( ON ?auto_86670 ?auto_86674 ) ( ON ?auto_86671 ?auto_86673 ) ( not ( = ?auto_86668 ?auto_86673 ) ) ( not ( = ?auto_86672 ?auto_86673 ) ) ( not ( = ?auto_86674 ?auto_86673 ) ) ( not ( = ?auto_86670 ?auto_86673 ) ) ( not ( = ?auto_86671 ?auto_86673 ) ) ( not ( = ?auto_86669 ?auto_86673 ) ) ( not ( = ?auto_86675 ?auto_86673 ) ) ( ON ?auto_86669 ?auto_86671 ) ( ON-TABLE ?auto_86673 ) ( CLEAR ?auto_86670 ) ( ON ?auto_86675 ?auto_86669 ) ( CLEAR ?auto_86675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86673 ?auto_86671 ?auto_86669 )
      ( MAKE-1PILE ?auto_86668 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86676 - BLOCK
    )
    :vars
    (
      ?auto_86678 - BLOCK
      ?auto_86682 - BLOCK
      ?auto_86680 - BLOCK
      ?auto_86679 - BLOCK
      ?auto_86683 - BLOCK
      ?auto_86677 - BLOCK
      ?auto_86681 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86678 ?auto_86676 ) ( ON-TABLE ?auto_86676 ) ( not ( = ?auto_86676 ?auto_86678 ) ) ( not ( = ?auto_86676 ?auto_86682 ) ) ( not ( = ?auto_86676 ?auto_86680 ) ) ( not ( = ?auto_86678 ?auto_86682 ) ) ( not ( = ?auto_86678 ?auto_86680 ) ) ( not ( = ?auto_86682 ?auto_86680 ) ) ( ON ?auto_86682 ?auto_86678 ) ( not ( = ?auto_86679 ?auto_86683 ) ) ( not ( = ?auto_86679 ?auto_86677 ) ) ( not ( = ?auto_86679 ?auto_86680 ) ) ( not ( = ?auto_86683 ?auto_86677 ) ) ( not ( = ?auto_86683 ?auto_86680 ) ) ( not ( = ?auto_86677 ?auto_86680 ) ) ( not ( = ?auto_86676 ?auto_86677 ) ) ( not ( = ?auto_86676 ?auto_86679 ) ) ( not ( = ?auto_86676 ?auto_86683 ) ) ( not ( = ?auto_86678 ?auto_86677 ) ) ( not ( = ?auto_86678 ?auto_86679 ) ) ( not ( = ?auto_86678 ?auto_86683 ) ) ( not ( = ?auto_86682 ?auto_86677 ) ) ( not ( = ?auto_86682 ?auto_86679 ) ) ( not ( = ?auto_86682 ?auto_86683 ) ) ( ON ?auto_86679 ?auto_86681 ) ( not ( = ?auto_86676 ?auto_86681 ) ) ( not ( = ?auto_86678 ?auto_86681 ) ) ( not ( = ?auto_86682 ?auto_86681 ) ) ( not ( = ?auto_86680 ?auto_86681 ) ) ( not ( = ?auto_86679 ?auto_86681 ) ) ( not ( = ?auto_86683 ?auto_86681 ) ) ( not ( = ?auto_86677 ?auto_86681 ) ) ( ON ?auto_86683 ?auto_86679 ) ( ON-TABLE ?auto_86681 ) ( ON ?auto_86677 ?auto_86683 ) ( CLEAR ?auto_86677 ) ( HOLDING ?auto_86680 ) ( CLEAR ?auto_86682 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86676 ?auto_86678 ?auto_86682 ?auto_86680 )
      ( MAKE-1PILE ?auto_86676 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86684 - BLOCK
    )
    :vars
    (
      ?auto_86688 - BLOCK
      ?auto_86686 - BLOCK
      ?auto_86690 - BLOCK
      ?auto_86689 - BLOCK
      ?auto_86685 - BLOCK
      ?auto_86687 - BLOCK
      ?auto_86691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86688 ?auto_86684 ) ( ON-TABLE ?auto_86684 ) ( not ( = ?auto_86684 ?auto_86688 ) ) ( not ( = ?auto_86684 ?auto_86686 ) ) ( not ( = ?auto_86684 ?auto_86690 ) ) ( not ( = ?auto_86688 ?auto_86686 ) ) ( not ( = ?auto_86688 ?auto_86690 ) ) ( not ( = ?auto_86686 ?auto_86690 ) ) ( ON ?auto_86686 ?auto_86688 ) ( not ( = ?auto_86689 ?auto_86685 ) ) ( not ( = ?auto_86689 ?auto_86687 ) ) ( not ( = ?auto_86689 ?auto_86690 ) ) ( not ( = ?auto_86685 ?auto_86687 ) ) ( not ( = ?auto_86685 ?auto_86690 ) ) ( not ( = ?auto_86687 ?auto_86690 ) ) ( not ( = ?auto_86684 ?auto_86687 ) ) ( not ( = ?auto_86684 ?auto_86689 ) ) ( not ( = ?auto_86684 ?auto_86685 ) ) ( not ( = ?auto_86688 ?auto_86687 ) ) ( not ( = ?auto_86688 ?auto_86689 ) ) ( not ( = ?auto_86688 ?auto_86685 ) ) ( not ( = ?auto_86686 ?auto_86687 ) ) ( not ( = ?auto_86686 ?auto_86689 ) ) ( not ( = ?auto_86686 ?auto_86685 ) ) ( ON ?auto_86689 ?auto_86691 ) ( not ( = ?auto_86684 ?auto_86691 ) ) ( not ( = ?auto_86688 ?auto_86691 ) ) ( not ( = ?auto_86686 ?auto_86691 ) ) ( not ( = ?auto_86690 ?auto_86691 ) ) ( not ( = ?auto_86689 ?auto_86691 ) ) ( not ( = ?auto_86685 ?auto_86691 ) ) ( not ( = ?auto_86687 ?auto_86691 ) ) ( ON ?auto_86685 ?auto_86689 ) ( ON-TABLE ?auto_86691 ) ( ON ?auto_86687 ?auto_86685 ) ( CLEAR ?auto_86686 ) ( ON ?auto_86690 ?auto_86687 ) ( CLEAR ?auto_86690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86691 ?auto_86689 ?auto_86685 ?auto_86687 )
      ( MAKE-1PILE ?auto_86684 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86692 - BLOCK
    )
    :vars
    (
      ?auto_86695 - BLOCK
      ?auto_86698 - BLOCK
      ?auto_86694 - BLOCK
      ?auto_86696 - BLOCK
      ?auto_86699 - BLOCK
      ?auto_86693 - BLOCK
      ?auto_86697 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86695 ?auto_86692 ) ( ON-TABLE ?auto_86692 ) ( not ( = ?auto_86692 ?auto_86695 ) ) ( not ( = ?auto_86692 ?auto_86698 ) ) ( not ( = ?auto_86692 ?auto_86694 ) ) ( not ( = ?auto_86695 ?auto_86698 ) ) ( not ( = ?auto_86695 ?auto_86694 ) ) ( not ( = ?auto_86698 ?auto_86694 ) ) ( not ( = ?auto_86696 ?auto_86699 ) ) ( not ( = ?auto_86696 ?auto_86693 ) ) ( not ( = ?auto_86696 ?auto_86694 ) ) ( not ( = ?auto_86699 ?auto_86693 ) ) ( not ( = ?auto_86699 ?auto_86694 ) ) ( not ( = ?auto_86693 ?auto_86694 ) ) ( not ( = ?auto_86692 ?auto_86693 ) ) ( not ( = ?auto_86692 ?auto_86696 ) ) ( not ( = ?auto_86692 ?auto_86699 ) ) ( not ( = ?auto_86695 ?auto_86693 ) ) ( not ( = ?auto_86695 ?auto_86696 ) ) ( not ( = ?auto_86695 ?auto_86699 ) ) ( not ( = ?auto_86698 ?auto_86693 ) ) ( not ( = ?auto_86698 ?auto_86696 ) ) ( not ( = ?auto_86698 ?auto_86699 ) ) ( ON ?auto_86696 ?auto_86697 ) ( not ( = ?auto_86692 ?auto_86697 ) ) ( not ( = ?auto_86695 ?auto_86697 ) ) ( not ( = ?auto_86698 ?auto_86697 ) ) ( not ( = ?auto_86694 ?auto_86697 ) ) ( not ( = ?auto_86696 ?auto_86697 ) ) ( not ( = ?auto_86699 ?auto_86697 ) ) ( not ( = ?auto_86693 ?auto_86697 ) ) ( ON ?auto_86699 ?auto_86696 ) ( ON-TABLE ?auto_86697 ) ( ON ?auto_86693 ?auto_86699 ) ( ON ?auto_86694 ?auto_86693 ) ( CLEAR ?auto_86694 ) ( HOLDING ?auto_86698 ) ( CLEAR ?auto_86695 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86692 ?auto_86695 ?auto_86698 )
      ( MAKE-1PILE ?auto_86692 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86700 - BLOCK
    )
    :vars
    (
      ?auto_86704 - BLOCK
      ?auto_86701 - BLOCK
      ?auto_86702 - BLOCK
      ?auto_86705 - BLOCK
      ?auto_86703 - BLOCK
      ?auto_86706 - BLOCK
      ?auto_86707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86704 ?auto_86700 ) ( ON-TABLE ?auto_86700 ) ( not ( = ?auto_86700 ?auto_86704 ) ) ( not ( = ?auto_86700 ?auto_86701 ) ) ( not ( = ?auto_86700 ?auto_86702 ) ) ( not ( = ?auto_86704 ?auto_86701 ) ) ( not ( = ?auto_86704 ?auto_86702 ) ) ( not ( = ?auto_86701 ?auto_86702 ) ) ( not ( = ?auto_86705 ?auto_86703 ) ) ( not ( = ?auto_86705 ?auto_86706 ) ) ( not ( = ?auto_86705 ?auto_86702 ) ) ( not ( = ?auto_86703 ?auto_86706 ) ) ( not ( = ?auto_86703 ?auto_86702 ) ) ( not ( = ?auto_86706 ?auto_86702 ) ) ( not ( = ?auto_86700 ?auto_86706 ) ) ( not ( = ?auto_86700 ?auto_86705 ) ) ( not ( = ?auto_86700 ?auto_86703 ) ) ( not ( = ?auto_86704 ?auto_86706 ) ) ( not ( = ?auto_86704 ?auto_86705 ) ) ( not ( = ?auto_86704 ?auto_86703 ) ) ( not ( = ?auto_86701 ?auto_86706 ) ) ( not ( = ?auto_86701 ?auto_86705 ) ) ( not ( = ?auto_86701 ?auto_86703 ) ) ( ON ?auto_86705 ?auto_86707 ) ( not ( = ?auto_86700 ?auto_86707 ) ) ( not ( = ?auto_86704 ?auto_86707 ) ) ( not ( = ?auto_86701 ?auto_86707 ) ) ( not ( = ?auto_86702 ?auto_86707 ) ) ( not ( = ?auto_86705 ?auto_86707 ) ) ( not ( = ?auto_86703 ?auto_86707 ) ) ( not ( = ?auto_86706 ?auto_86707 ) ) ( ON ?auto_86703 ?auto_86705 ) ( ON-TABLE ?auto_86707 ) ( ON ?auto_86706 ?auto_86703 ) ( ON ?auto_86702 ?auto_86706 ) ( CLEAR ?auto_86704 ) ( ON ?auto_86701 ?auto_86702 ) ( CLEAR ?auto_86701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_86707 ?auto_86705 ?auto_86703 ?auto_86706 ?auto_86702 )
      ( MAKE-1PILE ?auto_86700 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86724 - BLOCK
    )
    :vars
    (
      ?auto_86729 - BLOCK
      ?auto_86730 - BLOCK
      ?auto_86725 - BLOCK
      ?auto_86728 - BLOCK
      ?auto_86726 - BLOCK
      ?auto_86727 - BLOCK
      ?auto_86731 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86724 ?auto_86729 ) ) ( not ( = ?auto_86724 ?auto_86730 ) ) ( not ( = ?auto_86724 ?auto_86725 ) ) ( not ( = ?auto_86729 ?auto_86730 ) ) ( not ( = ?auto_86729 ?auto_86725 ) ) ( not ( = ?auto_86730 ?auto_86725 ) ) ( not ( = ?auto_86728 ?auto_86726 ) ) ( not ( = ?auto_86728 ?auto_86727 ) ) ( not ( = ?auto_86728 ?auto_86725 ) ) ( not ( = ?auto_86726 ?auto_86727 ) ) ( not ( = ?auto_86726 ?auto_86725 ) ) ( not ( = ?auto_86727 ?auto_86725 ) ) ( not ( = ?auto_86724 ?auto_86727 ) ) ( not ( = ?auto_86724 ?auto_86728 ) ) ( not ( = ?auto_86724 ?auto_86726 ) ) ( not ( = ?auto_86729 ?auto_86727 ) ) ( not ( = ?auto_86729 ?auto_86728 ) ) ( not ( = ?auto_86729 ?auto_86726 ) ) ( not ( = ?auto_86730 ?auto_86727 ) ) ( not ( = ?auto_86730 ?auto_86728 ) ) ( not ( = ?auto_86730 ?auto_86726 ) ) ( ON ?auto_86728 ?auto_86731 ) ( not ( = ?auto_86724 ?auto_86731 ) ) ( not ( = ?auto_86729 ?auto_86731 ) ) ( not ( = ?auto_86730 ?auto_86731 ) ) ( not ( = ?auto_86725 ?auto_86731 ) ) ( not ( = ?auto_86728 ?auto_86731 ) ) ( not ( = ?auto_86726 ?auto_86731 ) ) ( not ( = ?auto_86727 ?auto_86731 ) ) ( ON ?auto_86726 ?auto_86728 ) ( ON-TABLE ?auto_86731 ) ( ON ?auto_86727 ?auto_86726 ) ( ON ?auto_86725 ?auto_86727 ) ( ON ?auto_86730 ?auto_86725 ) ( ON ?auto_86729 ?auto_86730 ) ( CLEAR ?auto_86729 ) ( HOLDING ?auto_86724 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86724 ?auto_86729 )
      ( MAKE-1PILE ?auto_86724 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86732 - BLOCK
    )
    :vars
    (
      ?auto_86735 - BLOCK
      ?auto_86733 - BLOCK
      ?auto_86736 - BLOCK
      ?auto_86739 - BLOCK
      ?auto_86737 - BLOCK
      ?auto_86734 - BLOCK
      ?auto_86738 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86732 ?auto_86735 ) ) ( not ( = ?auto_86732 ?auto_86733 ) ) ( not ( = ?auto_86732 ?auto_86736 ) ) ( not ( = ?auto_86735 ?auto_86733 ) ) ( not ( = ?auto_86735 ?auto_86736 ) ) ( not ( = ?auto_86733 ?auto_86736 ) ) ( not ( = ?auto_86739 ?auto_86737 ) ) ( not ( = ?auto_86739 ?auto_86734 ) ) ( not ( = ?auto_86739 ?auto_86736 ) ) ( not ( = ?auto_86737 ?auto_86734 ) ) ( not ( = ?auto_86737 ?auto_86736 ) ) ( not ( = ?auto_86734 ?auto_86736 ) ) ( not ( = ?auto_86732 ?auto_86734 ) ) ( not ( = ?auto_86732 ?auto_86739 ) ) ( not ( = ?auto_86732 ?auto_86737 ) ) ( not ( = ?auto_86735 ?auto_86734 ) ) ( not ( = ?auto_86735 ?auto_86739 ) ) ( not ( = ?auto_86735 ?auto_86737 ) ) ( not ( = ?auto_86733 ?auto_86734 ) ) ( not ( = ?auto_86733 ?auto_86739 ) ) ( not ( = ?auto_86733 ?auto_86737 ) ) ( ON ?auto_86739 ?auto_86738 ) ( not ( = ?auto_86732 ?auto_86738 ) ) ( not ( = ?auto_86735 ?auto_86738 ) ) ( not ( = ?auto_86733 ?auto_86738 ) ) ( not ( = ?auto_86736 ?auto_86738 ) ) ( not ( = ?auto_86739 ?auto_86738 ) ) ( not ( = ?auto_86737 ?auto_86738 ) ) ( not ( = ?auto_86734 ?auto_86738 ) ) ( ON ?auto_86737 ?auto_86739 ) ( ON-TABLE ?auto_86738 ) ( ON ?auto_86734 ?auto_86737 ) ( ON ?auto_86736 ?auto_86734 ) ( ON ?auto_86733 ?auto_86736 ) ( ON ?auto_86735 ?auto_86733 ) ( ON ?auto_86732 ?auto_86735 ) ( CLEAR ?auto_86732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_86738 ?auto_86739 ?auto_86737 ?auto_86734 ?auto_86736 ?auto_86733 ?auto_86735 )
      ( MAKE-1PILE ?auto_86732 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86746 - BLOCK
      ?auto_86747 - BLOCK
      ?auto_86748 - BLOCK
      ?auto_86749 - BLOCK
      ?auto_86750 - BLOCK
      ?auto_86751 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_86751 ) ( CLEAR ?auto_86750 ) ( ON-TABLE ?auto_86746 ) ( ON ?auto_86747 ?auto_86746 ) ( ON ?auto_86748 ?auto_86747 ) ( ON ?auto_86749 ?auto_86748 ) ( ON ?auto_86750 ?auto_86749 ) ( not ( = ?auto_86746 ?auto_86747 ) ) ( not ( = ?auto_86746 ?auto_86748 ) ) ( not ( = ?auto_86746 ?auto_86749 ) ) ( not ( = ?auto_86746 ?auto_86750 ) ) ( not ( = ?auto_86746 ?auto_86751 ) ) ( not ( = ?auto_86747 ?auto_86748 ) ) ( not ( = ?auto_86747 ?auto_86749 ) ) ( not ( = ?auto_86747 ?auto_86750 ) ) ( not ( = ?auto_86747 ?auto_86751 ) ) ( not ( = ?auto_86748 ?auto_86749 ) ) ( not ( = ?auto_86748 ?auto_86750 ) ) ( not ( = ?auto_86748 ?auto_86751 ) ) ( not ( = ?auto_86749 ?auto_86750 ) ) ( not ( = ?auto_86749 ?auto_86751 ) ) ( not ( = ?auto_86750 ?auto_86751 ) ) )
    :subtasks
    ( ( !STACK ?auto_86751 ?auto_86750 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86752 - BLOCK
      ?auto_86753 - BLOCK
      ?auto_86754 - BLOCK
      ?auto_86755 - BLOCK
      ?auto_86756 - BLOCK
      ?auto_86757 - BLOCK
    )
    :vars
    (
      ?auto_86758 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_86756 ) ( ON-TABLE ?auto_86752 ) ( ON ?auto_86753 ?auto_86752 ) ( ON ?auto_86754 ?auto_86753 ) ( ON ?auto_86755 ?auto_86754 ) ( ON ?auto_86756 ?auto_86755 ) ( not ( = ?auto_86752 ?auto_86753 ) ) ( not ( = ?auto_86752 ?auto_86754 ) ) ( not ( = ?auto_86752 ?auto_86755 ) ) ( not ( = ?auto_86752 ?auto_86756 ) ) ( not ( = ?auto_86752 ?auto_86757 ) ) ( not ( = ?auto_86753 ?auto_86754 ) ) ( not ( = ?auto_86753 ?auto_86755 ) ) ( not ( = ?auto_86753 ?auto_86756 ) ) ( not ( = ?auto_86753 ?auto_86757 ) ) ( not ( = ?auto_86754 ?auto_86755 ) ) ( not ( = ?auto_86754 ?auto_86756 ) ) ( not ( = ?auto_86754 ?auto_86757 ) ) ( not ( = ?auto_86755 ?auto_86756 ) ) ( not ( = ?auto_86755 ?auto_86757 ) ) ( not ( = ?auto_86756 ?auto_86757 ) ) ( ON ?auto_86757 ?auto_86758 ) ( CLEAR ?auto_86757 ) ( HAND-EMPTY ) ( not ( = ?auto_86752 ?auto_86758 ) ) ( not ( = ?auto_86753 ?auto_86758 ) ) ( not ( = ?auto_86754 ?auto_86758 ) ) ( not ( = ?auto_86755 ?auto_86758 ) ) ( not ( = ?auto_86756 ?auto_86758 ) ) ( not ( = ?auto_86757 ?auto_86758 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_86757 ?auto_86758 )
      ( MAKE-6PILE ?auto_86752 ?auto_86753 ?auto_86754 ?auto_86755 ?auto_86756 ?auto_86757 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86759 - BLOCK
      ?auto_86760 - BLOCK
      ?auto_86761 - BLOCK
      ?auto_86762 - BLOCK
      ?auto_86763 - BLOCK
      ?auto_86764 - BLOCK
    )
    :vars
    (
      ?auto_86765 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86759 ) ( ON ?auto_86760 ?auto_86759 ) ( ON ?auto_86761 ?auto_86760 ) ( ON ?auto_86762 ?auto_86761 ) ( not ( = ?auto_86759 ?auto_86760 ) ) ( not ( = ?auto_86759 ?auto_86761 ) ) ( not ( = ?auto_86759 ?auto_86762 ) ) ( not ( = ?auto_86759 ?auto_86763 ) ) ( not ( = ?auto_86759 ?auto_86764 ) ) ( not ( = ?auto_86760 ?auto_86761 ) ) ( not ( = ?auto_86760 ?auto_86762 ) ) ( not ( = ?auto_86760 ?auto_86763 ) ) ( not ( = ?auto_86760 ?auto_86764 ) ) ( not ( = ?auto_86761 ?auto_86762 ) ) ( not ( = ?auto_86761 ?auto_86763 ) ) ( not ( = ?auto_86761 ?auto_86764 ) ) ( not ( = ?auto_86762 ?auto_86763 ) ) ( not ( = ?auto_86762 ?auto_86764 ) ) ( not ( = ?auto_86763 ?auto_86764 ) ) ( ON ?auto_86764 ?auto_86765 ) ( CLEAR ?auto_86764 ) ( not ( = ?auto_86759 ?auto_86765 ) ) ( not ( = ?auto_86760 ?auto_86765 ) ) ( not ( = ?auto_86761 ?auto_86765 ) ) ( not ( = ?auto_86762 ?auto_86765 ) ) ( not ( = ?auto_86763 ?auto_86765 ) ) ( not ( = ?auto_86764 ?auto_86765 ) ) ( HOLDING ?auto_86763 ) ( CLEAR ?auto_86762 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_86759 ?auto_86760 ?auto_86761 ?auto_86762 ?auto_86763 )
      ( MAKE-6PILE ?auto_86759 ?auto_86760 ?auto_86761 ?auto_86762 ?auto_86763 ?auto_86764 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86766 - BLOCK
      ?auto_86767 - BLOCK
      ?auto_86768 - BLOCK
      ?auto_86769 - BLOCK
      ?auto_86770 - BLOCK
      ?auto_86771 - BLOCK
    )
    :vars
    (
      ?auto_86772 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86766 ) ( ON ?auto_86767 ?auto_86766 ) ( ON ?auto_86768 ?auto_86767 ) ( ON ?auto_86769 ?auto_86768 ) ( not ( = ?auto_86766 ?auto_86767 ) ) ( not ( = ?auto_86766 ?auto_86768 ) ) ( not ( = ?auto_86766 ?auto_86769 ) ) ( not ( = ?auto_86766 ?auto_86770 ) ) ( not ( = ?auto_86766 ?auto_86771 ) ) ( not ( = ?auto_86767 ?auto_86768 ) ) ( not ( = ?auto_86767 ?auto_86769 ) ) ( not ( = ?auto_86767 ?auto_86770 ) ) ( not ( = ?auto_86767 ?auto_86771 ) ) ( not ( = ?auto_86768 ?auto_86769 ) ) ( not ( = ?auto_86768 ?auto_86770 ) ) ( not ( = ?auto_86768 ?auto_86771 ) ) ( not ( = ?auto_86769 ?auto_86770 ) ) ( not ( = ?auto_86769 ?auto_86771 ) ) ( not ( = ?auto_86770 ?auto_86771 ) ) ( ON ?auto_86771 ?auto_86772 ) ( not ( = ?auto_86766 ?auto_86772 ) ) ( not ( = ?auto_86767 ?auto_86772 ) ) ( not ( = ?auto_86768 ?auto_86772 ) ) ( not ( = ?auto_86769 ?auto_86772 ) ) ( not ( = ?auto_86770 ?auto_86772 ) ) ( not ( = ?auto_86771 ?auto_86772 ) ) ( CLEAR ?auto_86769 ) ( ON ?auto_86770 ?auto_86771 ) ( CLEAR ?auto_86770 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_86772 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86772 ?auto_86771 )
      ( MAKE-6PILE ?auto_86766 ?auto_86767 ?auto_86768 ?auto_86769 ?auto_86770 ?auto_86771 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86773 - BLOCK
      ?auto_86774 - BLOCK
      ?auto_86775 - BLOCK
      ?auto_86776 - BLOCK
      ?auto_86777 - BLOCK
      ?auto_86778 - BLOCK
    )
    :vars
    (
      ?auto_86779 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86773 ) ( ON ?auto_86774 ?auto_86773 ) ( ON ?auto_86775 ?auto_86774 ) ( not ( = ?auto_86773 ?auto_86774 ) ) ( not ( = ?auto_86773 ?auto_86775 ) ) ( not ( = ?auto_86773 ?auto_86776 ) ) ( not ( = ?auto_86773 ?auto_86777 ) ) ( not ( = ?auto_86773 ?auto_86778 ) ) ( not ( = ?auto_86774 ?auto_86775 ) ) ( not ( = ?auto_86774 ?auto_86776 ) ) ( not ( = ?auto_86774 ?auto_86777 ) ) ( not ( = ?auto_86774 ?auto_86778 ) ) ( not ( = ?auto_86775 ?auto_86776 ) ) ( not ( = ?auto_86775 ?auto_86777 ) ) ( not ( = ?auto_86775 ?auto_86778 ) ) ( not ( = ?auto_86776 ?auto_86777 ) ) ( not ( = ?auto_86776 ?auto_86778 ) ) ( not ( = ?auto_86777 ?auto_86778 ) ) ( ON ?auto_86778 ?auto_86779 ) ( not ( = ?auto_86773 ?auto_86779 ) ) ( not ( = ?auto_86774 ?auto_86779 ) ) ( not ( = ?auto_86775 ?auto_86779 ) ) ( not ( = ?auto_86776 ?auto_86779 ) ) ( not ( = ?auto_86777 ?auto_86779 ) ) ( not ( = ?auto_86778 ?auto_86779 ) ) ( ON ?auto_86777 ?auto_86778 ) ( CLEAR ?auto_86777 ) ( ON-TABLE ?auto_86779 ) ( HOLDING ?auto_86776 ) ( CLEAR ?auto_86775 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86773 ?auto_86774 ?auto_86775 ?auto_86776 )
      ( MAKE-6PILE ?auto_86773 ?auto_86774 ?auto_86775 ?auto_86776 ?auto_86777 ?auto_86778 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86780 - BLOCK
      ?auto_86781 - BLOCK
      ?auto_86782 - BLOCK
      ?auto_86783 - BLOCK
      ?auto_86784 - BLOCK
      ?auto_86785 - BLOCK
    )
    :vars
    (
      ?auto_86786 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86780 ) ( ON ?auto_86781 ?auto_86780 ) ( ON ?auto_86782 ?auto_86781 ) ( not ( = ?auto_86780 ?auto_86781 ) ) ( not ( = ?auto_86780 ?auto_86782 ) ) ( not ( = ?auto_86780 ?auto_86783 ) ) ( not ( = ?auto_86780 ?auto_86784 ) ) ( not ( = ?auto_86780 ?auto_86785 ) ) ( not ( = ?auto_86781 ?auto_86782 ) ) ( not ( = ?auto_86781 ?auto_86783 ) ) ( not ( = ?auto_86781 ?auto_86784 ) ) ( not ( = ?auto_86781 ?auto_86785 ) ) ( not ( = ?auto_86782 ?auto_86783 ) ) ( not ( = ?auto_86782 ?auto_86784 ) ) ( not ( = ?auto_86782 ?auto_86785 ) ) ( not ( = ?auto_86783 ?auto_86784 ) ) ( not ( = ?auto_86783 ?auto_86785 ) ) ( not ( = ?auto_86784 ?auto_86785 ) ) ( ON ?auto_86785 ?auto_86786 ) ( not ( = ?auto_86780 ?auto_86786 ) ) ( not ( = ?auto_86781 ?auto_86786 ) ) ( not ( = ?auto_86782 ?auto_86786 ) ) ( not ( = ?auto_86783 ?auto_86786 ) ) ( not ( = ?auto_86784 ?auto_86786 ) ) ( not ( = ?auto_86785 ?auto_86786 ) ) ( ON ?auto_86784 ?auto_86785 ) ( ON-TABLE ?auto_86786 ) ( CLEAR ?auto_86782 ) ( ON ?auto_86783 ?auto_86784 ) ( CLEAR ?auto_86783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86786 ?auto_86785 ?auto_86784 )
      ( MAKE-6PILE ?auto_86780 ?auto_86781 ?auto_86782 ?auto_86783 ?auto_86784 ?auto_86785 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86787 - BLOCK
      ?auto_86788 - BLOCK
      ?auto_86789 - BLOCK
      ?auto_86790 - BLOCK
      ?auto_86791 - BLOCK
      ?auto_86792 - BLOCK
    )
    :vars
    (
      ?auto_86793 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86787 ) ( ON ?auto_86788 ?auto_86787 ) ( not ( = ?auto_86787 ?auto_86788 ) ) ( not ( = ?auto_86787 ?auto_86789 ) ) ( not ( = ?auto_86787 ?auto_86790 ) ) ( not ( = ?auto_86787 ?auto_86791 ) ) ( not ( = ?auto_86787 ?auto_86792 ) ) ( not ( = ?auto_86788 ?auto_86789 ) ) ( not ( = ?auto_86788 ?auto_86790 ) ) ( not ( = ?auto_86788 ?auto_86791 ) ) ( not ( = ?auto_86788 ?auto_86792 ) ) ( not ( = ?auto_86789 ?auto_86790 ) ) ( not ( = ?auto_86789 ?auto_86791 ) ) ( not ( = ?auto_86789 ?auto_86792 ) ) ( not ( = ?auto_86790 ?auto_86791 ) ) ( not ( = ?auto_86790 ?auto_86792 ) ) ( not ( = ?auto_86791 ?auto_86792 ) ) ( ON ?auto_86792 ?auto_86793 ) ( not ( = ?auto_86787 ?auto_86793 ) ) ( not ( = ?auto_86788 ?auto_86793 ) ) ( not ( = ?auto_86789 ?auto_86793 ) ) ( not ( = ?auto_86790 ?auto_86793 ) ) ( not ( = ?auto_86791 ?auto_86793 ) ) ( not ( = ?auto_86792 ?auto_86793 ) ) ( ON ?auto_86791 ?auto_86792 ) ( ON-TABLE ?auto_86793 ) ( ON ?auto_86790 ?auto_86791 ) ( CLEAR ?auto_86790 ) ( HOLDING ?auto_86789 ) ( CLEAR ?auto_86788 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86787 ?auto_86788 ?auto_86789 )
      ( MAKE-6PILE ?auto_86787 ?auto_86788 ?auto_86789 ?auto_86790 ?auto_86791 ?auto_86792 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86794 - BLOCK
      ?auto_86795 - BLOCK
      ?auto_86796 - BLOCK
      ?auto_86797 - BLOCK
      ?auto_86798 - BLOCK
      ?auto_86799 - BLOCK
    )
    :vars
    (
      ?auto_86800 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86794 ) ( ON ?auto_86795 ?auto_86794 ) ( not ( = ?auto_86794 ?auto_86795 ) ) ( not ( = ?auto_86794 ?auto_86796 ) ) ( not ( = ?auto_86794 ?auto_86797 ) ) ( not ( = ?auto_86794 ?auto_86798 ) ) ( not ( = ?auto_86794 ?auto_86799 ) ) ( not ( = ?auto_86795 ?auto_86796 ) ) ( not ( = ?auto_86795 ?auto_86797 ) ) ( not ( = ?auto_86795 ?auto_86798 ) ) ( not ( = ?auto_86795 ?auto_86799 ) ) ( not ( = ?auto_86796 ?auto_86797 ) ) ( not ( = ?auto_86796 ?auto_86798 ) ) ( not ( = ?auto_86796 ?auto_86799 ) ) ( not ( = ?auto_86797 ?auto_86798 ) ) ( not ( = ?auto_86797 ?auto_86799 ) ) ( not ( = ?auto_86798 ?auto_86799 ) ) ( ON ?auto_86799 ?auto_86800 ) ( not ( = ?auto_86794 ?auto_86800 ) ) ( not ( = ?auto_86795 ?auto_86800 ) ) ( not ( = ?auto_86796 ?auto_86800 ) ) ( not ( = ?auto_86797 ?auto_86800 ) ) ( not ( = ?auto_86798 ?auto_86800 ) ) ( not ( = ?auto_86799 ?auto_86800 ) ) ( ON ?auto_86798 ?auto_86799 ) ( ON-TABLE ?auto_86800 ) ( ON ?auto_86797 ?auto_86798 ) ( CLEAR ?auto_86795 ) ( ON ?auto_86796 ?auto_86797 ) ( CLEAR ?auto_86796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86800 ?auto_86799 ?auto_86798 ?auto_86797 )
      ( MAKE-6PILE ?auto_86794 ?auto_86795 ?auto_86796 ?auto_86797 ?auto_86798 ?auto_86799 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86801 - BLOCK
      ?auto_86802 - BLOCK
      ?auto_86803 - BLOCK
      ?auto_86804 - BLOCK
      ?auto_86805 - BLOCK
      ?auto_86806 - BLOCK
    )
    :vars
    (
      ?auto_86807 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86801 ) ( not ( = ?auto_86801 ?auto_86802 ) ) ( not ( = ?auto_86801 ?auto_86803 ) ) ( not ( = ?auto_86801 ?auto_86804 ) ) ( not ( = ?auto_86801 ?auto_86805 ) ) ( not ( = ?auto_86801 ?auto_86806 ) ) ( not ( = ?auto_86802 ?auto_86803 ) ) ( not ( = ?auto_86802 ?auto_86804 ) ) ( not ( = ?auto_86802 ?auto_86805 ) ) ( not ( = ?auto_86802 ?auto_86806 ) ) ( not ( = ?auto_86803 ?auto_86804 ) ) ( not ( = ?auto_86803 ?auto_86805 ) ) ( not ( = ?auto_86803 ?auto_86806 ) ) ( not ( = ?auto_86804 ?auto_86805 ) ) ( not ( = ?auto_86804 ?auto_86806 ) ) ( not ( = ?auto_86805 ?auto_86806 ) ) ( ON ?auto_86806 ?auto_86807 ) ( not ( = ?auto_86801 ?auto_86807 ) ) ( not ( = ?auto_86802 ?auto_86807 ) ) ( not ( = ?auto_86803 ?auto_86807 ) ) ( not ( = ?auto_86804 ?auto_86807 ) ) ( not ( = ?auto_86805 ?auto_86807 ) ) ( not ( = ?auto_86806 ?auto_86807 ) ) ( ON ?auto_86805 ?auto_86806 ) ( ON-TABLE ?auto_86807 ) ( ON ?auto_86804 ?auto_86805 ) ( ON ?auto_86803 ?auto_86804 ) ( CLEAR ?auto_86803 ) ( HOLDING ?auto_86802 ) ( CLEAR ?auto_86801 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86801 ?auto_86802 )
      ( MAKE-6PILE ?auto_86801 ?auto_86802 ?auto_86803 ?auto_86804 ?auto_86805 ?auto_86806 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86808 - BLOCK
      ?auto_86809 - BLOCK
      ?auto_86810 - BLOCK
      ?auto_86811 - BLOCK
      ?auto_86812 - BLOCK
      ?auto_86813 - BLOCK
    )
    :vars
    (
      ?auto_86814 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86808 ) ( not ( = ?auto_86808 ?auto_86809 ) ) ( not ( = ?auto_86808 ?auto_86810 ) ) ( not ( = ?auto_86808 ?auto_86811 ) ) ( not ( = ?auto_86808 ?auto_86812 ) ) ( not ( = ?auto_86808 ?auto_86813 ) ) ( not ( = ?auto_86809 ?auto_86810 ) ) ( not ( = ?auto_86809 ?auto_86811 ) ) ( not ( = ?auto_86809 ?auto_86812 ) ) ( not ( = ?auto_86809 ?auto_86813 ) ) ( not ( = ?auto_86810 ?auto_86811 ) ) ( not ( = ?auto_86810 ?auto_86812 ) ) ( not ( = ?auto_86810 ?auto_86813 ) ) ( not ( = ?auto_86811 ?auto_86812 ) ) ( not ( = ?auto_86811 ?auto_86813 ) ) ( not ( = ?auto_86812 ?auto_86813 ) ) ( ON ?auto_86813 ?auto_86814 ) ( not ( = ?auto_86808 ?auto_86814 ) ) ( not ( = ?auto_86809 ?auto_86814 ) ) ( not ( = ?auto_86810 ?auto_86814 ) ) ( not ( = ?auto_86811 ?auto_86814 ) ) ( not ( = ?auto_86812 ?auto_86814 ) ) ( not ( = ?auto_86813 ?auto_86814 ) ) ( ON ?auto_86812 ?auto_86813 ) ( ON-TABLE ?auto_86814 ) ( ON ?auto_86811 ?auto_86812 ) ( ON ?auto_86810 ?auto_86811 ) ( CLEAR ?auto_86808 ) ( ON ?auto_86809 ?auto_86810 ) ( CLEAR ?auto_86809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_86814 ?auto_86813 ?auto_86812 ?auto_86811 ?auto_86810 )
      ( MAKE-6PILE ?auto_86808 ?auto_86809 ?auto_86810 ?auto_86811 ?auto_86812 ?auto_86813 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86815 - BLOCK
      ?auto_86816 - BLOCK
      ?auto_86817 - BLOCK
      ?auto_86818 - BLOCK
      ?auto_86819 - BLOCK
      ?auto_86820 - BLOCK
    )
    :vars
    (
      ?auto_86821 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86815 ?auto_86816 ) ) ( not ( = ?auto_86815 ?auto_86817 ) ) ( not ( = ?auto_86815 ?auto_86818 ) ) ( not ( = ?auto_86815 ?auto_86819 ) ) ( not ( = ?auto_86815 ?auto_86820 ) ) ( not ( = ?auto_86816 ?auto_86817 ) ) ( not ( = ?auto_86816 ?auto_86818 ) ) ( not ( = ?auto_86816 ?auto_86819 ) ) ( not ( = ?auto_86816 ?auto_86820 ) ) ( not ( = ?auto_86817 ?auto_86818 ) ) ( not ( = ?auto_86817 ?auto_86819 ) ) ( not ( = ?auto_86817 ?auto_86820 ) ) ( not ( = ?auto_86818 ?auto_86819 ) ) ( not ( = ?auto_86818 ?auto_86820 ) ) ( not ( = ?auto_86819 ?auto_86820 ) ) ( ON ?auto_86820 ?auto_86821 ) ( not ( = ?auto_86815 ?auto_86821 ) ) ( not ( = ?auto_86816 ?auto_86821 ) ) ( not ( = ?auto_86817 ?auto_86821 ) ) ( not ( = ?auto_86818 ?auto_86821 ) ) ( not ( = ?auto_86819 ?auto_86821 ) ) ( not ( = ?auto_86820 ?auto_86821 ) ) ( ON ?auto_86819 ?auto_86820 ) ( ON-TABLE ?auto_86821 ) ( ON ?auto_86818 ?auto_86819 ) ( ON ?auto_86817 ?auto_86818 ) ( ON ?auto_86816 ?auto_86817 ) ( CLEAR ?auto_86816 ) ( HOLDING ?auto_86815 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_86815 )
      ( MAKE-6PILE ?auto_86815 ?auto_86816 ?auto_86817 ?auto_86818 ?auto_86819 ?auto_86820 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86822 - BLOCK
      ?auto_86823 - BLOCK
      ?auto_86824 - BLOCK
      ?auto_86825 - BLOCK
      ?auto_86826 - BLOCK
      ?auto_86827 - BLOCK
    )
    :vars
    (
      ?auto_86828 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86822 ?auto_86823 ) ) ( not ( = ?auto_86822 ?auto_86824 ) ) ( not ( = ?auto_86822 ?auto_86825 ) ) ( not ( = ?auto_86822 ?auto_86826 ) ) ( not ( = ?auto_86822 ?auto_86827 ) ) ( not ( = ?auto_86823 ?auto_86824 ) ) ( not ( = ?auto_86823 ?auto_86825 ) ) ( not ( = ?auto_86823 ?auto_86826 ) ) ( not ( = ?auto_86823 ?auto_86827 ) ) ( not ( = ?auto_86824 ?auto_86825 ) ) ( not ( = ?auto_86824 ?auto_86826 ) ) ( not ( = ?auto_86824 ?auto_86827 ) ) ( not ( = ?auto_86825 ?auto_86826 ) ) ( not ( = ?auto_86825 ?auto_86827 ) ) ( not ( = ?auto_86826 ?auto_86827 ) ) ( ON ?auto_86827 ?auto_86828 ) ( not ( = ?auto_86822 ?auto_86828 ) ) ( not ( = ?auto_86823 ?auto_86828 ) ) ( not ( = ?auto_86824 ?auto_86828 ) ) ( not ( = ?auto_86825 ?auto_86828 ) ) ( not ( = ?auto_86826 ?auto_86828 ) ) ( not ( = ?auto_86827 ?auto_86828 ) ) ( ON ?auto_86826 ?auto_86827 ) ( ON-TABLE ?auto_86828 ) ( ON ?auto_86825 ?auto_86826 ) ( ON ?auto_86824 ?auto_86825 ) ( ON ?auto_86823 ?auto_86824 ) ( ON ?auto_86822 ?auto_86823 ) ( CLEAR ?auto_86822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_86828 ?auto_86827 ?auto_86826 ?auto_86825 ?auto_86824 ?auto_86823 )
      ( MAKE-6PILE ?auto_86822 ?auto_86823 ?auto_86824 ?auto_86825 ?auto_86826 ?auto_86827 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86829 - BLOCK
      ?auto_86830 - BLOCK
      ?auto_86831 - BLOCK
      ?auto_86832 - BLOCK
      ?auto_86833 - BLOCK
      ?auto_86834 - BLOCK
    )
    :vars
    (
      ?auto_86835 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86829 ?auto_86830 ) ) ( not ( = ?auto_86829 ?auto_86831 ) ) ( not ( = ?auto_86829 ?auto_86832 ) ) ( not ( = ?auto_86829 ?auto_86833 ) ) ( not ( = ?auto_86829 ?auto_86834 ) ) ( not ( = ?auto_86830 ?auto_86831 ) ) ( not ( = ?auto_86830 ?auto_86832 ) ) ( not ( = ?auto_86830 ?auto_86833 ) ) ( not ( = ?auto_86830 ?auto_86834 ) ) ( not ( = ?auto_86831 ?auto_86832 ) ) ( not ( = ?auto_86831 ?auto_86833 ) ) ( not ( = ?auto_86831 ?auto_86834 ) ) ( not ( = ?auto_86832 ?auto_86833 ) ) ( not ( = ?auto_86832 ?auto_86834 ) ) ( not ( = ?auto_86833 ?auto_86834 ) ) ( ON ?auto_86834 ?auto_86835 ) ( not ( = ?auto_86829 ?auto_86835 ) ) ( not ( = ?auto_86830 ?auto_86835 ) ) ( not ( = ?auto_86831 ?auto_86835 ) ) ( not ( = ?auto_86832 ?auto_86835 ) ) ( not ( = ?auto_86833 ?auto_86835 ) ) ( not ( = ?auto_86834 ?auto_86835 ) ) ( ON ?auto_86833 ?auto_86834 ) ( ON-TABLE ?auto_86835 ) ( ON ?auto_86832 ?auto_86833 ) ( ON ?auto_86831 ?auto_86832 ) ( ON ?auto_86830 ?auto_86831 ) ( HOLDING ?auto_86829 ) ( CLEAR ?auto_86830 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_86835 ?auto_86834 ?auto_86833 ?auto_86832 ?auto_86831 ?auto_86830 ?auto_86829 )
      ( MAKE-6PILE ?auto_86829 ?auto_86830 ?auto_86831 ?auto_86832 ?auto_86833 ?auto_86834 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86836 - BLOCK
      ?auto_86837 - BLOCK
      ?auto_86838 - BLOCK
      ?auto_86839 - BLOCK
      ?auto_86840 - BLOCK
      ?auto_86841 - BLOCK
    )
    :vars
    (
      ?auto_86842 - BLOCK
      ?auto_86843 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86836 ?auto_86837 ) ) ( not ( = ?auto_86836 ?auto_86838 ) ) ( not ( = ?auto_86836 ?auto_86839 ) ) ( not ( = ?auto_86836 ?auto_86840 ) ) ( not ( = ?auto_86836 ?auto_86841 ) ) ( not ( = ?auto_86837 ?auto_86838 ) ) ( not ( = ?auto_86837 ?auto_86839 ) ) ( not ( = ?auto_86837 ?auto_86840 ) ) ( not ( = ?auto_86837 ?auto_86841 ) ) ( not ( = ?auto_86838 ?auto_86839 ) ) ( not ( = ?auto_86838 ?auto_86840 ) ) ( not ( = ?auto_86838 ?auto_86841 ) ) ( not ( = ?auto_86839 ?auto_86840 ) ) ( not ( = ?auto_86839 ?auto_86841 ) ) ( not ( = ?auto_86840 ?auto_86841 ) ) ( ON ?auto_86841 ?auto_86842 ) ( not ( = ?auto_86836 ?auto_86842 ) ) ( not ( = ?auto_86837 ?auto_86842 ) ) ( not ( = ?auto_86838 ?auto_86842 ) ) ( not ( = ?auto_86839 ?auto_86842 ) ) ( not ( = ?auto_86840 ?auto_86842 ) ) ( not ( = ?auto_86841 ?auto_86842 ) ) ( ON ?auto_86840 ?auto_86841 ) ( ON-TABLE ?auto_86842 ) ( ON ?auto_86839 ?auto_86840 ) ( ON ?auto_86838 ?auto_86839 ) ( ON ?auto_86837 ?auto_86838 ) ( CLEAR ?auto_86837 ) ( ON ?auto_86836 ?auto_86843 ) ( CLEAR ?auto_86836 ) ( HAND-EMPTY ) ( not ( = ?auto_86836 ?auto_86843 ) ) ( not ( = ?auto_86837 ?auto_86843 ) ) ( not ( = ?auto_86838 ?auto_86843 ) ) ( not ( = ?auto_86839 ?auto_86843 ) ) ( not ( = ?auto_86840 ?auto_86843 ) ) ( not ( = ?auto_86841 ?auto_86843 ) ) ( not ( = ?auto_86842 ?auto_86843 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_86836 ?auto_86843 )
      ( MAKE-6PILE ?auto_86836 ?auto_86837 ?auto_86838 ?auto_86839 ?auto_86840 ?auto_86841 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86844 - BLOCK
      ?auto_86845 - BLOCK
      ?auto_86846 - BLOCK
      ?auto_86847 - BLOCK
      ?auto_86848 - BLOCK
      ?auto_86849 - BLOCK
    )
    :vars
    (
      ?auto_86851 - BLOCK
      ?auto_86850 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86844 ?auto_86845 ) ) ( not ( = ?auto_86844 ?auto_86846 ) ) ( not ( = ?auto_86844 ?auto_86847 ) ) ( not ( = ?auto_86844 ?auto_86848 ) ) ( not ( = ?auto_86844 ?auto_86849 ) ) ( not ( = ?auto_86845 ?auto_86846 ) ) ( not ( = ?auto_86845 ?auto_86847 ) ) ( not ( = ?auto_86845 ?auto_86848 ) ) ( not ( = ?auto_86845 ?auto_86849 ) ) ( not ( = ?auto_86846 ?auto_86847 ) ) ( not ( = ?auto_86846 ?auto_86848 ) ) ( not ( = ?auto_86846 ?auto_86849 ) ) ( not ( = ?auto_86847 ?auto_86848 ) ) ( not ( = ?auto_86847 ?auto_86849 ) ) ( not ( = ?auto_86848 ?auto_86849 ) ) ( ON ?auto_86849 ?auto_86851 ) ( not ( = ?auto_86844 ?auto_86851 ) ) ( not ( = ?auto_86845 ?auto_86851 ) ) ( not ( = ?auto_86846 ?auto_86851 ) ) ( not ( = ?auto_86847 ?auto_86851 ) ) ( not ( = ?auto_86848 ?auto_86851 ) ) ( not ( = ?auto_86849 ?auto_86851 ) ) ( ON ?auto_86848 ?auto_86849 ) ( ON-TABLE ?auto_86851 ) ( ON ?auto_86847 ?auto_86848 ) ( ON ?auto_86846 ?auto_86847 ) ( ON ?auto_86844 ?auto_86850 ) ( CLEAR ?auto_86844 ) ( not ( = ?auto_86844 ?auto_86850 ) ) ( not ( = ?auto_86845 ?auto_86850 ) ) ( not ( = ?auto_86846 ?auto_86850 ) ) ( not ( = ?auto_86847 ?auto_86850 ) ) ( not ( = ?auto_86848 ?auto_86850 ) ) ( not ( = ?auto_86849 ?auto_86850 ) ) ( not ( = ?auto_86851 ?auto_86850 ) ) ( HOLDING ?auto_86845 ) ( CLEAR ?auto_86846 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_86851 ?auto_86849 ?auto_86848 ?auto_86847 ?auto_86846 ?auto_86845 )
      ( MAKE-6PILE ?auto_86844 ?auto_86845 ?auto_86846 ?auto_86847 ?auto_86848 ?auto_86849 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86852 - BLOCK
      ?auto_86853 - BLOCK
      ?auto_86854 - BLOCK
      ?auto_86855 - BLOCK
      ?auto_86856 - BLOCK
      ?auto_86857 - BLOCK
    )
    :vars
    (
      ?auto_86859 - BLOCK
      ?auto_86858 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86852 ?auto_86853 ) ) ( not ( = ?auto_86852 ?auto_86854 ) ) ( not ( = ?auto_86852 ?auto_86855 ) ) ( not ( = ?auto_86852 ?auto_86856 ) ) ( not ( = ?auto_86852 ?auto_86857 ) ) ( not ( = ?auto_86853 ?auto_86854 ) ) ( not ( = ?auto_86853 ?auto_86855 ) ) ( not ( = ?auto_86853 ?auto_86856 ) ) ( not ( = ?auto_86853 ?auto_86857 ) ) ( not ( = ?auto_86854 ?auto_86855 ) ) ( not ( = ?auto_86854 ?auto_86856 ) ) ( not ( = ?auto_86854 ?auto_86857 ) ) ( not ( = ?auto_86855 ?auto_86856 ) ) ( not ( = ?auto_86855 ?auto_86857 ) ) ( not ( = ?auto_86856 ?auto_86857 ) ) ( ON ?auto_86857 ?auto_86859 ) ( not ( = ?auto_86852 ?auto_86859 ) ) ( not ( = ?auto_86853 ?auto_86859 ) ) ( not ( = ?auto_86854 ?auto_86859 ) ) ( not ( = ?auto_86855 ?auto_86859 ) ) ( not ( = ?auto_86856 ?auto_86859 ) ) ( not ( = ?auto_86857 ?auto_86859 ) ) ( ON ?auto_86856 ?auto_86857 ) ( ON-TABLE ?auto_86859 ) ( ON ?auto_86855 ?auto_86856 ) ( ON ?auto_86854 ?auto_86855 ) ( ON ?auto_86852 ?auto_86858 ) ( not ( = ?auto_86852 ?auto_86858 ) ) ( not ( = ?auto_86853 ?auto_86858 ) ) ( not ( = ?auto_86854 ?auto_86858 ) ) ( not ( = ?auto_86855 ?auto_86858 ) ) ( not ( = ?auto_86856 ?auto_86858 ) ) ( not ( = ?auto_86857 ?auto_86858 ) ) ( not ( = ?auto_86859 ?auto_86858 ) ) ( CLEAR ?auto_86854 ) ( ON ?auto_86853 ?auto_86852 ) ( CLEAR ?auto_86853 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_86858 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86858 ?auto_86852 )
      ( MAKE-6PILE ?auto_86852 ?auto_86853 ?auto_86854 ?auto_86855 ?auto_86856 ?auto_86857 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86860 - BLOCK
      ?auto_86861 - BLOCK
      ?auto_86862 - BLOCK
      ?auto_86863 - BLOCK
      ?auto_86864 - BLOCK
      ?auto_86865 - BLOCK
    )
    :vars
    (
      ?auto_86867 - BLOCK
      ?auto_86866 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86860 ?auto_86861 ) ) ( not ( = ?auto_86860 ?auto_86862 ) ) ( not ( = ?auto_86860 ?auto_86863 ) ) ( not ( = ?auto_86860 ?auto_86864 ) ) ( not ( = ?auto_86860 ?auto_86865 ) ) ( not ( = ?auto_86861 ?auto_86862 ) ) ( not ( = ?auto_86861 ?auto_86863 ) ) ( not ( = ?auto_86861 ?auto_86864 ) ) ( not ( = ?auto_86861 ?auto_86865 ) ) ( not ( = ?auto_86862 ?auto_86863 ) ) ( not ( = ?auto_86862 ?auto_86864 ) ) ( not ( = ?auto_86862 ?auto_86865 ) ) ( not ( = ?auto_86863 ?auto_86864 ) ) ( not ( = ?auto_86863 ?auto_86865 ) ) ( not ( = ?auto_86864 ?auto_86865 ) ) ( ON ?auto_86865 ?auto_86867 ) ( not ( = ?auto_86860 ?auto_86867 ) ) ( not ( = ?auto_86861 ?auto_86867 ) ) ( not ( = ?auto_86862 ?auto_86867 ) ) ( not ( = ?auto_86863 ?auto_86867 ) ) ( not ( = ?auto_86864 ?auto_86867 ) ) ( not ( = ?auto_86865 ?auto_86867 ) ) ( ON ?auto_86864 ?auto_86865 ) ( ON-TABLE ?auto_86867 ) ( ON ?auto_86863 ?auto_86864 ) ( ON ?auto_86860 ?auto_86866 ) ( not ( = ?auto_86860 ?auto_86866 ) ) ( not ( = ?auto_86861 ?auto_86866 ) ) ( not ( = ?auto_86862 ?auto_86866 ) ) ( not ( = ?auto_86863 ?auto_86866 ) ) ( not ( = ?auto_86864 ?auto_86866 ) ) ( not ( = ?auto_86865 ?auto_86866 ) ) ( not ( = ?auto_86867 ?auto_86866 ) ) ( ON ?auto_86861 ?auto_86860 ) ( CLEAR ?auto_86861 ) ( ON-TABLE ?auto_86866 ) ( HOLDING ?auto_86862 ) ( CLEAR ?auto_86863 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_86867 ?auto_86865 ?auto_86864 ?auto_86863 ?auto_86862 )
      ( MAKE-6PILE ?auto_86860 ?auto_86861 ?auto_86862 ?auto_86863 ?auto_86864 ?auto_86865 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86868 - BLOCK
      ?auto_86869 - BLOCK
      ?auto_86870 - BLOCK
      ?auto_86871 - BLOCK
      ?auto_86872 - BLOCK
      ?auto_86873 - BLOCK
    )
    :vars
    (
      ?auto_86874 - BLOCK
      ?auto_86875 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86868 ?auto_86869 ) ) ( not ( = ?auto_86868 ?auto_86870 ) ) ( not ( = ?auto_86868 ?auto_86871 ) ) ( not ( = ?auto_86868 ?auto_86872 ) ) ( not ( = ?auto_86868 ?auto_86873 ) ) ( not ( = ?auto_86869 ?auto_86870 ) ) ( not ( = ?auto_86869 ?auto_86871 ) ) ( not ( = ?auto_86869 ?auto_86872 ) ) ( not ( = ?auto_86869 ?auto_86873 ) ) ( not ( = ?auto_86870 ?auto_86871 ) ) ( not ( = ?auto_86870 ?auto_86872 ) ) ( not ( = ?auto_86870 ?auto_86873 ) ) ( not ( = ?auto_86871 ?auto_86872 ) ) ( not ( = ?auto_86871 ?auto_86873 ) ) ( not ( = ?auto_86872 ?auto_86873 ) ) ( ON ?auto_86873 ?auto_86874 ) ( not ( = ?auto_86868 ?auto_86874 ) ) ( not ( = ?auto_86869 ?auto_86874 ) ) ( not ( = ?auto_86870 ?auto_86874 ) ) ( not ( = ?auto_86871 ?auto_86874 ) ) ( not ( = ?auto_86872 ?auto_86874 ) ) ( not ( = ?auto_86873 ?auto_86874 ) ) ( ON ?auto_86872 ?auto_86873 ) ( ON-TABLE ?auto_86874 ) ( ON ?auto_86871 ?auto_86872 ) ( ON ?auto_86868 ?auto_86875 ) ( not ( = ?auto_86868 ?auto_86875 ) ) ( not ( = ?auto_86869 ?auto_86875 ) ) ( not ( = ?auto_86870 ?auto_86875 ) ) ( not ( = ?auto_86871 ?auto_86875 ) ) ( not ( = ?auto_86872 ?auto_86875 ) ) ( not ( = ?auto_86873 ?auto_86875 ) ) ( not ( = ?auto_86874 ?auto_86875 ) ) ( ON ?auto_86869 ?auto_86868 ) ( ON-TABLE ?auto_86875 ) ( CLEAR ?auto_86871 ) ( ON ?auto_86870 ?auto_86869 ) ( CLEAR ?auto_86870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86875 ?auto_86868 ?auto_86869 )
      ( MAKE-6PILE ?auto_86868 ?auto_86869 ?auto_86870 ?auto_86871 ?auto_86872 ?auto_86873 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86876 - BLOCK
      ?auto_86877 - BLOCK
      ?auto_86878 - BLOCK
      ?auto_86879 - BLOCK
      ?auto_86880 - BLOCK
      ?auto_86881 - BLOCK
    )
    :vars
    (
      ?auto_86883 - BLOCK
      ?auto_86882 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86876 ?auto_86877 ) ) ( not ( = ?auto_86876 ?auto_86878 ) ) ( not ( = ?auto_86876 ?auto_86879 ) ) ( not ( = ?auto_86876 ?auto_86880 ) ) ( not ( = ?auto_86876 ?auto_86881 ) ) ( not ( = ?auto_86877 ?auto_86878 ) ) ( not ( = ?auto_86877 ?auto_86879 ) ) ( not ( = ?auto_86877 ?auto_86880 ) ) ( not ( = ?auto_86877 ?auto_86881 ) ) ( not ( = ?auto_86878 ?auto_86879 ) ) ( not ( = ?auto_86878 ?auto_86880 ) ) ( not ( = ?auto_86878 ?auto_86881 ) ) ( not ( = ?auto_86879 ?auto_86880 ) ) ( not ( = ?auto_86879 ?auto_86881 ) ) ( not ( = ?auto_86880 ?auto_86881 ) ) ( ON ?auto_86881 ?auto_86883 ) ( not ( = ?auto_86876 ?auto_86883 ) ) ( not ( = ?auto_86877 ?auto_86883 ) ) ( not ( = ?auto_86878 ?auto_86883 ) ) ( not ( = ?auto_86879 ?auto_86883 ) ) ( not ( = ?auto_86880 ?auto_86883 ) ) ( not ( = ?auto_86881 ?auto_86883 ) ) ( ON ?auto_86880 ?auto_86881 ) ( ON-TABLE ?auto_86883 ) ( ON ?auto_86876 ?auto_86882 ) ( not ( = ?auto_86876 ?auto_86882 ) ) ( not ( = ?auto_86877 ?auto_86882 ) ) ( not ( = ?auto_86878 ?auto_86882 ) ) ( not ( = ?auto_86879 ?auto_86882 ) ) ( not ( = ?auto_86880 ?auto_86882 ) ) ( not ( = ?auto_86881 ?auto_86882 ) ) ( not ( = ?auto_86883 ?auto_86882 ) ) ( ON ?auto_86877 ?auto_86876 ) ( ON-TABLE ?auto_86882 ) ( ON ?auto_86878 ?auto_86877 ) ( CLEAR ?auto_86878 ) ( HOLDING ?auto_86879 ) ( CLEAR ?auto_86880 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86883 ?auto_86881 ?auto_86880 ?auto_86879 )
      ( MAKE-6PILE ?auto_86876 ?auto_86877 ?auto_86878 ?auto_86879 ?auto_86880 ?auto_86881 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86884 - BLOCK
      ?auto_86885 - BLOCK
      ?auto_86886 - BLOCK
      ?auto_86887 - BLOCK
      ?auto_86888 - BLOCK
      ?auto_86889 - BLOCK
    )
    :vars
    (
      ?auto_86891 - BLOCK
      ?auto_86890 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86884 ?auto_86885 ) ) ( not ( = ?auto_86884 ?auto_86886 ) ) ( not ( = ?auto_86884 ?auto_86887 ) ) ( not ( = ?auto_86884 ?auto_86888 ) ) ( not ( = ?auto_86884 ?auto_86889 ) ) ( not ( = ?auto_86885 ?auto_86886 ) ) ( not ( = ?auto_86885 ?auto_86887 ) ) ( not ( = ?auto_86885 ?auto_86888 ) ) ( not ( = ?auto_86885 ?auto_86889 ) ) ( not ( = ?auto_86886 ?auto_86887 ) ) ( not ( = ?auto_86886 ?auto_86888 ) ) ( not ( = ?auto_86886 ?auto_86889 ) ) ( not ( = ?auto_86887 ?auto_86888 ) ) ( not ( = ?auto_86887 ?auto_86889 ) ) ( not ( = ?auto_86888 ?auto_86889 ) ) ( ON ?auto_86889 ?auto_86891 ) ( not ( = ?auto_86884 ?auto_86891 ) ) ( not ( = ?auto_86885 ?auto_86891 ) ) ( not ( = ?auto_86886 ?auto_86891 ) ) ( not ( = ?auto_86887 ?auto_86891 ) ) ( not ( = ?auto_86888 ?auto_86891 ) ) ( not ( = ?auto_86889 ?auto_86891 ) ) ( ON ?auto_86888 ?auto_86889 ) ( ON-TABLE ?auto_86891 ) ( ON ?auto_86884 ?auto_86890 ) ( not ( = ?auto_86884 ?auto_86890 ) ) ( not ( = ?auto_86885 ?auto_86890 ) ) ( not ( = ?auto_86886 ?auto_86890 ) ) ( not ( = ?auto_86887 ?auto_86890 ) ) ( not ( = ?auto_86888 ?auto_86890 ) ) ( not ( = ?auto_86889 ?auto_86890 ) ) ( not ( = ?auto_86891 ?auto_86890 ) ) ( ON ?auto_86885 ?auto_86884 ) ( ON-TABLE ?auto_86890 ) ( ON ?auto_86886 ?auto_86885 ) ( CLEAR ?auto_86888 ) ( ON ?auto_86887 ?auto_86886 ) ( CLEAR ?auto_86887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86890 ?auto_86884 ?auto_86885 ?auto_86886 )
      ( MAKE-6PILE ?auto_86884 ?auto_86885 ?auto_86886 ?auto_86887 ?auto_86888 ?auto_86889 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86892 - BLOCK
      ?auto_86893 - BLOCK
      ?auto_86894 - BLOCK
      ?auto_86895 - BLOCK
      ?auto_86896 - BLOCK
      ?auto_86897 - BLOCK
    )
    :vars
    (
      ?auto_86899 - BLOCK
      ?auto_86898 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86892 ?auto_86893 ) ) ( not ( = ?auto_86892 ?auto_86894 ) ) ( not ( = ?auto_86892 ?auto_86895 ) ) ( not ( = ?auto_86892 ?auto_86896 ) ) ( not ( = ?auto_86892 ?auto_86897 ) ) ( not ( = ?auto_86893 ?auto_86894 ) ) ( not ( = ?auto_86893 ?auto_86895 ) ) ( not ( = ?auto_86893 ?auto_86896 ) ) ( not ( = ?auto_86893 ?auto_86897 ) ) ( not ( = ?auto_86894 ?auto_86895 ) ) ( not ( = ?auto_86894 ?auto_86896 ) ) ( not ( = ?auto_86894 ?auto_86897 ) ) ( not ( = ?auto_86895 ?auto_86896 ) ) ( not ( = ?auto_86895 ?auto_86897 ) ) ( not ( = ?auto_86896 ?auto_86897 ) ) ( ON ?auto_86897 ?auto_86899 ) ( not ( = ?auto_86892 ?auto_86899 ) ) ( not ( = ?auto_86893 ?auto_86899 ) ) ( not ( = ?auto_86894 ?auto_86899 ) ) ( not ( = ?auto_86895 ?auto_86899 ) ) ( not ( = ?auto_86896 ?auto_86899 ) ) ( not ( = ?auto_86897 ?auto_86899 ) ) ( ON-TABLE ?auto_86899 ) ( ON ?auto_86892 ?auto_86898 ) ( not ( = ?auto_86892 ?auto_86898 ) ) ( not ( = ?auto_86893 ?auto_86898 ) ) ( not ( = ?auto_86894 ?auto_86898 ) ) ( not ( = ?auto_86895 ?auto_86898 ) ) ( not ( = ?auto_86896 ?auto_86898 ) ) ( not ( = ?auto_86897 ?auto_86898 ) ) ( not ( = ?auto_86899 ?auto_86898 ) ) ( ON ?auto_86893 ?auto_86892 ) ( ON-TABLE ?auto_86898 ) ( ON ?auto_86894 ?auto_86893 ) ( ON ?auto_86895 ?auto_86894 ) ( CLEAR ?auto_86895 ) ( HOLDING ?auto_86896 ) ( CLEAR ?auto_86897 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86899 ?auto_86897 ?auto_86896 )
      ( MAKE-6PILE ?auto_86892 ?auto_86893 ?auto_86894 ?auto_86895 ?auto_86896 ?auto_86897 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86900 - BLOCK
      ?auto_86901 - BLOCK
      ?auto_86902 - BLOCK
      ?auto_86903 - BLOCK
      ?auto_86904 - BLOCK
      ?auto_86905 - BLOCK
    )
    :vars
    (
      ?auto_86906 - BLOCK
      ?auto_86907 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86900 ?auto_86901 ) ) ( not ( = ?auto_86900 ?auto_86902 ) ) ( not ( = ?auto_86900 ?auto_86903 ) ) ( not ( = ?auto_86900 ?auto_86904 ) ) ( not ( = ?auto_86900 ?auto_86905 ) ) ( not ( = ?auto_86901 ?auto_86902 ) ) ( not ( = ?auto_86901 ?auto_86903 ) ) ( not ( = ?auto_86901 ?auto_86904 ) ) ( not ( = ?auto_86901 ?auto_86905 ) ) ( not ( = ?auto_86902 ?auto_86903 ) ) ( not ( = ?auto_86902 ?auto_86904 ) ) ( not ( = ?auto_86902 ?auto_86905 ) ) ( not ( = ?auto_86903 ?auto_86904 ) ) ( not ( = ?auto_86903 ?auto_86905 ) ) ( not ( = ?auto_86904 ?auto_86905 ) ) ( ON ?auto_86905 ?auto_86906 ) ( not ( = ?auto_86900 ?auto_86906 ) ) ( not ( = ?auto_86901 ?auto_86906 ) ) ( not ( = ?auto_86902 ?auto_86906 ) ) ( not ( = ?auto_86903 ?auto_86906 ) ) ( not ( = ?auto_86904 ?auto_86906 ) ) ( not ( = ?auto_86905 ?auto_86906 ) ) ( ON-TABLE ?auto_86906 ) ( ON ?auto_86900 ?auto_86907 ) ( not ( = ?auto_86900 ?auto_86907 ) ) ( not ( = ?auto_86901 ?auto_86907 ) ) ( not ( = ?auto_86902 ?auto_86907 ) ) ( not ( = ?auto_86903 ?auto_86907 ) ) ( not ( = ?auto_86904 ?auto_86907 ) ) ( not ( = ?auto_86905 ?auto_86907 ) ) ( not ( = ?auto_86906 ?auto_86907 ) ) ( ON ?auto_86901 ?auto_86900 ) ( ON-TABLE ?auto_86907 ) ( ON ?auto_86902 ?auto_86901 ) ( ON ?auto_86903 ?auto_86902 ) ( CLEAR ?auto_86905 ) ( ON ?auto_86904 ?auto_86903 ) ( CLEAR ?auto_86904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_86907 ?auto_86900 ?auto_86901 ?auto_86902 ?auto_86903 )
      ( MAKE-6PILE ?auto_86900 ?auto_86901 ?auto_86902 ?auto_86903 ?auto_86904 ?auto_86905 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86908 - BLOCK
      ?auto_86909 - BLOCK
      ?auto_86910 - BLOCK
      ?auto_86911 - BLOCK
      ?auto_86912 - BLOCK
      ?auto_86913 - BLOCK
    )
    :vars
    (
      ?auto_86914 - BLOCK
      ?auto_86915 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86908 ?auto_86909 ) ) ( not ( = ?auto_86908 ?auto_86910 ) ) ( not ( = ?auto_86908 ?auto_86911 ) ) ( not ( = ?auto_86908 ?auto_86912 ) ) ( not ( = ?auto_86908 ?auto_86913 ) ) ( not ( = ?auto_86909 ?auto_86910 ) ) ( not ( = ?auto_86909 ?auto_86911 ) ) ( not ( = ?auto_86909 ?auto_86912 ) ) ( not ( = ?auto_86909 ?auto_86913 ) ) ( not ( = ?auto_86910 ?auto_86911 ) ) ( not ( = ?auto_86910 ?auto_86912 ) ) ( not ( = ?auto_86910 ?auto_86913 ) ) ( not ( = ?auto_86911 ?auto_86912 ) ) ( not ( = ?auto_86911 ?auto_86913 ) ) ( not ( = ?auto_86912 ?auto_86913 ) ) ( not ( = ?auto_86908 ?auto_86914 ) ) ( not ( = ?auto_86909 ?auto_86914 ) ) ( not ( = ?auto_86910 ?auto_86914 ) ) ( not ( = ?auto_86911 ?auto_86914 ) ) ( not ( = ?auto_86912 ?auto_86914 ) ) ( not ( = ?auto_86913 ?auto_86914 ) ) ( ON-TABLE ?auto_86914 ) ( ON ?auto_86908 ?auto_86915 ) ( not ( = ?auto_86908 ?auto_86915 ) ) ( not ( = ?auto_86909 ?auto_86915 ) ) ( not ( = ?auto_86910 ?auto_86915 ) ) ( not ( = ?auto_86911 ?auto_86915 ) ) ( not ( = ?auto_86912 ?auto_86915 ) ) ( not ( = ?auto_86913 ?auto_86915 ) ) ( not ( = ?auto_86914 ?auto_86915 ) ) ( ON ?auto_86909 ?auto_86908 ) ( ON-TABLE ?auto_86915 ) ( ON ?auto_86910 ?auto_86909 ) ( ON ?auto_86911 ?auto_86910 ) ( ON ?auto_86912 ?auto_86911 ) ( CLEAR ?auto_86912 ) ( HOLDING ?auto_86913 ) ( CLEAR ?auto_86914 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86914 ?auto_86913 )
      ( MAKE-6PILE ?auto_86908 ?auto_86909 ?auto_86910 ?auto_86911 ?auto_86912 ?auto_86913 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86916 - BLOCK
      ?auto_86917 - BLOCK
      ?auto_86918 - BLOCK
      ?auto_86919 - BLOCK
      ?auto_86920 - BLOCK
      ?auto_86921 - BLOCK
    )
    :vars
    (
      ?auto_86923 - BLOCK
      ?auto_86922 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86916 ?auto_86917 ) ) ( not ( = ?auto_86916 ?auto_86918 ) ) ( not ( = ?auto_86916 ?auto_86919 ) ) ( not ( = ?auto_86916 ?auto_86920 ) ) ( not ( = ?auto_86916 ?auto_86921 ) ) ( not ( = ?auto_86917 ?auto_86918 ) ) ( not ( = ?auto_86917 ?auto_86919 ) ) ( not ( = ?auto_86917 ?auto_86920 ) ) ( not ( = ?auto_86917 ?auto_86921 ) ) ( not ( = ?auto_86918 ?auto_86919 ) ) ( not ( = ?auto_86918 ?auto_86920 ) ) ( not ( = ?auto_86918 ?auto_86921 ) ) ( not ( = ?auto_86919 ?auto_86920 ) ) ( not ( = ?auto_86919 ?auto_86921 ) ) ( not ( = ?auto_86920 ?auto_86921 ) ) ( not ( = ?auto_86916 ?auto_86923 ) ) ( not ( = ?auto_86917 ?auto_86923 ) ) ( not ( = ?auto_86918 ?auto_86923 ) ) ( not ( = ?auto_86919 ?auto_86923 ) ) ( not ( = ?auto_86920 ?auto_86923 ) ) ( not ( = ?auto_86921 ?auto_86923 ) ) ( ON-TABLE ?auto_86923 ) ( ON ?auto_86916 ?auto_86922 ) ( not ( = ?auto_86916 ?auto_86922 ) ) ( not ( = ?auto_86917 ?auto_86922 ) ) ( not ( = ?auto_86918 ?auto_86922 ) ) ( not ( = ?auto_86919 ?auto_86922 ) ) ( not ( = ?auto_86920 ?auto_86922 ) ) ( not ( = ?auto_86921 ?auto_86922 ) ) ( not ( = ?auto_86923 ?auto_86922 ) ) ( ON ?auto_86917 ?auto_86916 ) ( ON-TABLE ?auto_86922 ) ( ON ?auto_86918 ?auto_86917 ) ( ON ?auto_86919 ?auto_86918 ) ( ON ?auto_86920 ?auto_86919 ) ( CLEAR ?auto_86923 ) ( ON ?auto_86921 ?auto_86920 ) ( CLEAR ?auto_86921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_86922 ?auto_86916 ?auto_86917 ?auto_86918 ?auto_86919 ?auto_86920 )
      ( MAKE-6PILE ?auto_86916 ?auto_86917 ?auto_86918 ?auto_86919 ?auto_86920 ?auto_86921 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86924 - BLOCK
      ?auto_86925 - BLOCK
      ?auto_86926 - BLOCK
      ?auto_86927 - BLOCK
      ?auto_86928 - BLOCK
      ?auto_86929 - BLOCK
    )
    :vars
    (
      ?auto_86931 - BLOCK
      ?auto_86930 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86924 ?auto_86925 ) ) ( not ( = ?auto_86924 ?auto_86926 ) ) ( not ( = ?auto_86924 ?auto_86927 ) ) ( not ( = ?auto_86924 ?auto_86928 ) ) ( not ( = ?auto_86924 ?auto_86929 ) ) ( not ( = ?auto_86925 ?auto_86926 ) ) ( not ( = ?auto_86925 ?auto_86927 ) ) ( not ( = ?auto_86925 ?auto_86928 ) ) ( not ( = ?auto_86925 ?auto_86929 ) ) ( not ( = ?auto_86926 ?auto_86927 ) ) ( not ( = ?auto_86926 ?auto_86928 ) ) ( not ( = ?auto_86926 ?auto_86929 ) ) ( not ( = ?auto_86927 ?auto_86928 ) ) ( not ( = ?auto_86927 ?auto_86929 ) ) ( not ( = ?auto_86928 ?auto_86929 ) ) ( not ( = ?auto_86924 ?auto_86931 ) ) ( not ( = ?auto_86925 ?auto_86931 ) ) ( not ( = ?auto_86926 ?auto_86931 ) ) ( not ( = ?auto_86927 ?auto_86931 ) ) ( not ( = ?auto_86928 ?auto_86931 ) ) ( not ( = ?auto_86929 ?auto_86931 ) ) ( ON ?auto_86924 ?auto_86930 ) ( not ( = ?auto_86924 ?auto_86930 ) ) ( not ( = ?auto_86925 ?auto_86930 ) ) ( not ( = ?auto_86926 ?auto_86930 ) ) ( not ( = ?auto_86927 ?auto_86930 ) ) ( not ( = ?auto_86928 ?auto_86930 ) ) ( not ( = ?auto_86929 ?auto_86930 ) ) ( not ( = ?auto_86931 ?auto_86930 ) ) ( ON ?auto_86925 ?auto_86924 ) ( ON-TABLE ?auto_86930 ) ( ON ?auto_86926 ?auto_86925 ) ( ON ?auto_86927 ?auto_86926 ) ( ON ?auto_86928 ?auto_86927 ) ( ON ?auto_86929 ?auto_86928 ) ( CLEAR ?auto_86929 ) ( HOLDING ?auto_86931 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_86931 )
      ( MAKE-6PILE ?auto_86924 ?auto_86925 ?auto_86926 ?auto_86927 ?auto_86928 ?auto_86929 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86932 - BLOCK
      ?auto_86933 - BLOCK
      ?auto_86934 - BLOCK
      ?auto_86935 - BLOCK
      ?auto_86936 - BLOCK
      ?auto_86937 - BLOCK
    )
    :vars
    (
      ?auto_86939 - BLOCK
      ?auto_86938 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86932 ?auto_86933 ) ) ( not ( = ?auto_86932 ?auto_86934 ) ) ( not ( = ?auto_86932 ?auto_86935 ) ) ( not ( = ?auto_86932 ?auto_86936 ) ) ( not ( = ?auto_86932 ?auto_86937 ) ) ( not ( = ?auto_86933 ?auto_86934 ) ) ( not ( = ?auto_86933 ?auto_86935 ) ) ( not ( = ?auto_86933 ?auto_86936 ) ) ( not ( = ?auto_86933 ?auto_86937 ) ) ( not ( = ?auto_86934 ?auto_86935 ) ) ( not ( = ?auto_86934 ?auto_86936 ) ) ( not ( = ?auto_86934 ?auto_86937 ) ) ( not ( = ?auto_86935 ?auto_86936 ) ) ( not ( = ?auto_86935 ?auto_86937 ) ) ( not ( = ?auto_86936 ?auto_86937 ) ) ( not ( = ?auto_86932 ?auto_86939 ) ) ( not ( = ?auto_86933 ?auto_86939 ) ) ( not ( = ?auto_86934 ?auto_86939 ) ) ( not ( = ?auto_86935 ?auto_86939 ) ) ( not ( = ?auto_86936 ?auto_86939 ) ) ( not ( = ?auto_86937 ?auto_86939 ) ) ( ON ?auto_86932 ?auto_86938 ) ( not ( = ?auto_86932 ?auto_86938 ) ) ( not ( = ?auto_86933 ?auto_86938 ) ) ( not ( = ?auto_86934 ?auto_86938 ) ) ( not ( = ?auto_86935 ?auto_86938 ) ) ( not ( = ?auto_86936 ?auto_86938 ) ) ( not ( = ?auto_86937 ?auto_86938 ) ) ( not ( = ?auto_86939 ?auto_86938 ) ) ( ON ?auto_86933 ?auto_86932 ) ( ON-TABLE ?auto_86938 ) ( ON ?auto_86934 ?auto_86933 ) ( ON ?auto_86935 ?auto_86934 ) ( ON ?auto_86936 ?auto_86935 ) ( ON ?auto_86937 ?auto_86936 ) ( ON ?auto_86939 ?auto_86937 ) ( CLEAR ?auto_86939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_86938 ?auto_86932 ?auto_86933 ?auto_86934 ?auto_86935 ?auto_86936 ?auto_86937 )
      ( MAKE-6PILE ?auto_86932 ?auto_86933 ?auto_86934 ?auto_86935 ?auto_86936 ?auto_86937 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_86947 - BLOCK
      ?auto_86948 - BLOCK
      ?auto_86949 - BLOCK
      ?auto_86950 - BLOCK
      ?auto_86951 - BLOCK
      ?auto_86952 - BLOCK
      ?auto_86953 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_86953 ) ( CLEAR ?auto_86952 ) ( ON-TABLE ?auto_86947 ) ( ON ?auto_86948 ?auto_86947 ) ( ON ?auto_86949 ?auto_86948 ) ( ON ?auto_86950 ?auto_86949 ) ( ON ?auto_86951 ?auto_86950 ) ( ON ?auto_86952 ?auto_86951 ) ( not ( = ?auto_86947 ?auto_86948 ) ) ( not ( = ?auto_86947 ?auto_86949 ) ) ( not ( = ?auto_86947 ?auto_86950 ) ) ( not ( = ?auto_86947 ?auto_86951 ) ) ( not ( = ?auto_86947 ?auto_86952 ) ) ( not ( = ?auto_86947 ?auto_86953 ) ) ( not ( = ?auto_86948 ?auto_86949 ) ) ( not ( = ?auto_86948 ?auto_86950 ) ) ( not ( = ?auto_86948 ?auto_86951 ) ) ( not ( = ?auto_86948 ?auto_86952 ) ) ( not ( = ?auto_86948 ?auto_86953 ) ) ( not ( = ?auto_86949 ?auto_86950 ) ) ( not ( = ?auto_86949 ?auto_86951 ) ) ( not ( = ?auto_86949 ?auto_86952 ) ) ( not ( = ?auto_86949 ?auto_86953 ) ) ( not ( = ?auto_86950 ?auto_86951 ) ) ( not ( = ?auto_86950 ?auto_86952 ) ) ( not ( = ?auto_86950 ?auto_86953 ) ) ( not ( = ?auto_86951 ?auto_86952 ) ) ( not ( = ?auto_86951 ?auto_86953 ) ) ( not ( = ?auto_86952 ?auto_86953 ) ) )
    :subtasks
    ( ( !STACK ?auto_86953 ?auto_86952 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_86954 - BLOCK
      ?auto_86955 - BLOCK
      ?auto_86956 - BLOCK
      ?auto_86957 - BLOCK
      ?auto_86958 - BLOCK
      ?auto_86959 - BLOCK
      ?auto_86960 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_86959 ) ( ON-TABLE ?auto_86954 ) ( ON ?auto_86955 ?auto_86954 ) ( ON ?auto_86956 ?auto_86955 ) ( ON ?auto_86957 ?auto_86956 ) ( ON ?auto_86958 ?auto_86957 ) ( ON ?auto_86959 ?auto_86958 ) ( not ( = ?auto_86954 ?auto_86955 ) ) ( not ( = ?auto_86954 ?auto_86956 ) ) ( not ( = ?auto_86954 ?auto_86957 ) ) ( not ( = ?auto_86954 ?auto_86958 ) ) ( not ( = ?auto_86954 ?auto_86959 ) ) ( not ( = ?auto_86954 ?auto_86960 ) ) ( not ( = ?auto_86955 ?auto_86956 ) ) ( not ( = ?auto_86955 ?auto_86957 ) ) ( not ( = ?auto_86955 ?auto_86958 ) ) ( not ( = ?auto_86955 ?auto_86959 ) ) ( not ( = ?auto_86955 ?auto_86960 ) ) ( not ( = ?auto_86956 ?auto_86957 ) ) ( not ( = ?auto_86956 ?auto_86958 ) ) ( not ( = ?auto_86956 ?auto_86959 ) ) ( not ( = ?auto_86956 ?auto_86960 ) ) ( not ( = ?auto_86957 ?auto_86958 ) ) ( not ( = ?auto_86957 ?auto_86959 ) ) ( not ( = ?auto_86957 ?auto_86960 ) ) ( not ( = ?auto_86958 ?auto_86959 ) ) ( not ( = ?auto_86958 ?auto_86960 ) ) ( not ( = ?auto_86959 ?auto_86960 ) ) ( ON-TABLE ?auto_86960 ) ( CLEAR ?auto_86960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_86960 )
      ( MAKE-7PILE ?auto_86954 ?auto_86955 ?auto_86956 ?auto_86957 ?auto_86958 ?auto_86959 ?auto_86960 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_86961 - BLOCK
      ?auto_86962 - BLOCK
      ?auto_86963 - BLOCK
      ?auto_86964 - BLOCK
      ?auto_86965 - BLOCK
      ?auto_86966 - BLOCK
      ?auto_86967 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86961 ) ( ON ?auto_86962 ?auto_86961 ) ( ON ?auto_86963 ?auto_86962 ) ( ON ?auto_86964 ?auto_86963 ) ( ON ?auto_86965 ?auto_86964 ) ( not ( = ?auto_86961 ?auto_86962 ) ) ( not ( = ?auto_86961 ?auto_86963 ) ) ( not ( = ?auto_86961 ?auto_86964 ) ) ( not ( = ?auto_86961 ?auto_86965 ) ) ( not ( = ?auto_86961 ?auto_86966 ) ) ( not ( = ?auto_86961 ?auto_86967 ) ) ( not ( = ?auto_86962 ?auto_86963 ) ) ( not ( = ?auto_86962 ?auto_86964 ) ) ( not ( = ?auto_86962 ?auto_86965 ) ) ( not ( = ?auto_86962 ?auto_86966 ) ) ( not ( = ?auto_86962 ?auto_86967 ) ) ( not ( = ?auto_86963 ?auto_86964 ) ) ( not ( = ?auto_86963 ?auto_86965 ) ) ( not ( = ?auto_86963 ?auto_86966 ) ) ( not ( = ?auto_86963 ?auto_86967 ) ) ( not ( = ?auto_86964 ?auto_86965 ) ) ( not ( = ?auto_86964 ?auto_86966 ) ) ( not ( = ?auto_86964 ?auto_86967 ) ) ( not ( = ?auto_86965 ?auto_86966 ) ) ( not ( = ?auto_86965 ?auto_86967 ) ) ( not ( = ?auto_86966 ?auto_86967 ) ) ( ON-TABLE ?auto_86967 ) ( CLEAR ?auto_86967 ) ( HOLDING ?auto_86966 ) ( CLEAR ?auto_86965 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_86961 ?auto_86962 ?auto_86963 ?auto_86964 ?auto_86965 ?auto_86966 )
      ( MAKE-7PILE ?auto_86961 ?auto_86962 ?auto_86963 ?auto_86964 ?auto_86965 ?auto_86966 ?auto_86967 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_86968 - BLOCK
      ?auto_86969 - BLOCK
      ?auto_86970 - BLOCK
      ?auto_86971 - BLOCK
      ?auto_86972 - BLOCK
      ?auto_86973 - BLOCK
      ?auto_86974 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86968 ) ( ON ?auto_86969 ?auto_86968 ) ( ON ?auto_86970 ?auto_86969 ) ( ON ?auto_86971 ?auto_86970 ) ( ON ?auto_86972 ?auto_86971 ) ( not ( = ?auto_86968 ?auto_86969 ) ) ( not ( = ?auto_86968 ?auto_86970 ) ) ( not ( = ?auto_86968 ?auto_86971 ) ) ( not ( = ?auto_86968 ?auto_86972 ) ) ( not ( = ?auto_86968 ?auto_86973 ) ) ( not ( = ?auto_86968 ?auto_86974 ) ) ( not ( = ?auto_86969 ?auto_86970 ) ) ( not ( = ?auto_86969 ?auto_86971 ) ) ( not ( = ?auto_86969 ?auto_86972 ) ) ( not ( = ?auto_86969 ?auto_86973 ) ) ( not ( = ?auto_86969 ?auto_86974 ) ) ( not ( = ?auto_86970 ?auto_86971 ) ) ( not ( = ?auto_86970 ?auto_86972 ) ) ( not ( = ?auto_86970 ?auto_86973 ) ) ( not ( = ?auto_86970 ?auto_86974 ) ) ( not ( = ?auto_86971 ?auto_86972 ) ) ( not ( = ?auto_86971 ?auto_86973 ) ) ( not ( = ?auto_86971 ?auto_86974 ) ) ( not ( = ?auto_86972 ?auto_86973 ) ) ( not ( = ?auto_86972 ?auto_86974 ) ) ( not ( = ?auto_86973 ?auto_86974 ) ) ( ON-TABLE ?auto_86974 ) ( CLEAR ?auto_86972 ) ( ON ?auto_86973 ?auto_86974 ) ( CLEAR ?auto_86973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_86974 )
      ( MAKE-7PILE ?auto_86968 ?auto_86969 ?auto_86970 ?auto_86971 ?auto_86972 ?auto_86973 ?auto_86974 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_86975 - BLOCK
      ?auto_86976 - BLOCK
      ?auto_86977 - BLOCK
      ?auto_86978 - BLOCK
      ?auto_86979 - BLOCK
      ?auto_86980 - BLOCK
      ?auto_86981 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86975 ) ( ON ?auto_86976 ?auto_86975 ) ( ON ?auto_86977 ?auto_86976 ) ( ON ?auto_86978 ?auto_86977 ) ( not ( = ?auto_86975 ?auto_86976 ) ) ( not ( = ?auto_86975 ?auto_86977 ) ) ( not ( = ?auto_86975 ?auto_86978 ) ) ( not ( = ?auto_86975 ?auto_86979 ) ) ( not ( = ?auto_86975 ?auto_86980 ) ) ( not ( = ?auto_86975 ?auto_86981 ) ) ( not ( = ?auto_86976 ?auto_86977 ) ) ( not ( = ?auto_86976 ?auto_86978 ) ) ( not ( = ?auto_86976 ?auto_86979 ) ) ( not ( = ?auto_86976 ?auto_86980 ) ) ( not ( = ?auto_86976 ?auto_86981 ) ) ( not ( = ?auto_86977 ?auto_86978 ) ) ( not ( = ?auto_86977 ?auto_86979 ) ) ( not ( = ?auto_86977 ?auto_86980 ) ) ( not ( = ?auto_86977 ?auto_86981 ) ) ( not ( = ?auto_86978 ?auto_86979 ) ) ( not ( = ?auto_86978 ?auto_86980 ) ) ( not ( = ?auto_86978 ?auto_86981 ) ) ( not ( = ?auto_86979 ?auto_86980 ) ) ( not ( = ?auto_86979 ?auto_86981 ) ) ( not ( = ?auto_86980 ?auto_86981 ) ) ( ON-TABLE ?auto_86981 ) ( ON ?auto_86980 ?auto_86981 ) ( CLEAR ?auto_86980 ) ( HOLDING ?auto_86979 ) ( CLEAR ?auto_86978 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_86975 ?auto_86976 ?auto_86977 ?auto_86978 ?auto_86979 )
      ( MAKE-7PILE ?auto_86975 ?auto_86976 ?auto_86977 ?auto_86978 ?auto_86979 ?auto_86980 ?auto_86981 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_86982 - BLOCK
      ?auto_86983 - BLOCK
      ?auto_86984 - BLOCK
      ?auto_86985 - BLOCK
      ?auto_86986 - BLOCK
      ?auto_86987 - BLOCK
      ?auto_86988 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86982 ) ( ON ?auto_86983 ?auto_86982 ) ( ON ?auto_86984 ?auto_86983 ) ( ON ?auto_86985 ?auto_86984 ) ( not ( = ?auto_86982 ?auto_86983 ) ) ( not ( = ?auto_86982 ?auto_86984 ) ) ( not ( = ?auto_86982 ?auto_86985 ) ) ( not ( = ?auto_86982 ?auto_86986 ) ) ( not ( = ?auto_86982 ?auto_86987 ) ) ( not ( = ?auto_86982 ?auto_86988 ) ) ( not ( = ?auto_86983 ?auto_86984 ) ) ( not ( = ?auto_86983 ?auto_86985 ) ) ( not ( = ?auto_86983 ?auto_86986 ) ) ( not ( = ?auto_86983 ?auto_86987 ) ) ( not ( = ?auto_86983 ?auto_86988 ) ) ( not ( = ?auto_86984 ?auto_86985 ) ) ( not ( = ?auto_86984 ?auto_86986 ) ) ( not ( = ?auto_86984 ?auto_86987 ) ) ( not ( = ?auto_86984 ?auto_86988 ) ) ( not ( = ?auto_86985 ?auto_86986 ) ) ( not ( = ?auto_86985 ?auto_86987 ) ) ( not ( = ?auto_86985 ?auto_86988 ) ) ( not ( = ?auto_86986 ?auto_86987 ) ) ( not ( = ?auto_86986 ?auto_86988 ) ) ( not ( = ?auto_86987 ?auto_86988 ) ) ( ON-TABLE ?auto_86988 ) ( ON ?auto_86987 ?auto_86988 ) ( CLEAR ?auto_86985 ) ( ON ?auto_86986 ?auto_86987 ) ( CLEAR ?auto_86986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86988 ?auto_86987 )
      ( MAKE-7PILE ?auto_86982 ?auto_86983 ?auto_86984 ?auto_86985 ?auto_86986 ?auto_86987 ?auto_86988 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_86989 - BLOCK
      ?auto_86990 - BLOCK
      ?auto_86991 - BLOCK
      ?auto_86992 - BLOCK
      ?auto_86993 - BLOCK
      ?auto_86994 - BLOCK
      ?auto_86995 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86989 ) ( ON ?auto_86990 ?auto_86989 ) ( ON ?auto_86991 ?auto_86990 ) ( not ( = ?auto_86989 ?auto_86990 ) ) ( not ( = ?auto_86989 ?auto_86991 ) ) ( not ( = ?auto_86989 ?auto_86992 ) ) ( not ( = ?auto_86989 ?auto_86993 ) ) ( not ( = ?auto_86989 ?auto_86994 ) ) ( not ( = ?auto_86989 ?auto_86995 ) ) ( not ( = ?auto_86990 ?auto_86991 ) ) ( not ( = ?auto_86990 ?auto_86992 ) ) ( not ( = ?auto_86990 ?auto_86993 ) ) ( not ( = ?auto_86990 ?auto_86994 ) ) ( not ( = ?auto_86990 ?auto_86995 ) ) ( not ( = ?auto_86991 ?auto_86992 ) ) ( not ( = ?auto_86991 ?auto_86993 ) ) ( not ( = ?auto_86991 ?auto_86994 ) ) ( not ( = ?auto_86991 ?auto_86995 ) ) ( not ( = ?auto_86992 ?auto_86993 ) ) ( not ( = ?auto_86992 ?auto_86994 ) ) ( not ( = ?auto_86992 ?auto_86995 ) ) ( not ( = ?auto_86993 ?auto_86994 ) ) ( not ( = ?auto_86993 ?auto_86995 ) ) ( not ( = ?auto_86994 ?auto_86995 ) ) ( ON-TABLE ?auto_86995 ) ( ON ?auto_86994 ?auto_86995 ) ( ON ?auto_86993 ?auto_86994 ) ( CLEAR ?auto_86993 ) ( HOLDING ?auto_86992 ) ( CLEAR ?auto_86991 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86989 ?auto_86990 ?auto_86991 ?auto_86992 )
      ( MAKE-7PILE ?auto_86989 ?auto_86990 ?auto_86991 ?auto_86992 ?auto_86993 ?auto_86994 ?auto_86995 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_86996 - BLOCK
      ?auto_86997 - BLOCK
      ?auto_86998 - BLOCK
      ?auto_86999 - BLOCK
      ?auto_87000 - BLOCK
      ?auto_87001 - BLOCK
      ?auto_87002 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86996 ) ( ON ?auto_86997 ?auto_86996 ) ( ON ?auto_86998 ?auto_86997 ) ( not ( = ?auto_86996 ?auto_86997 ) ) ( not ( = ?auto_86996 ?auto_86998 ) ) ( not ( = ?auto_86996 ?auto_86999 ) ) ( not ( = ?auto_86996 ?auto_87000 ) ) ( not ( = ?auto_86996 ?auto_87001 ) ) ( not ( = ?auto_86996 ?auto_87002 ) ) ( not ( = ?auto_86997 ?auto_86998 ) ) ( not ( = ?auto_86997 ?auto_86999 ) ) ( not ( = ?auto_86997 ?auto_87000 ) ) ( not ( = ?auto_86997 ?auto_87001 ) ) ( not ( = ?auto_86997 ?auto_87002 ) ) ( not ( = ?auto_86998 ?auto_86999 ) ) ( not ( = ?auto_86998 ?auto_87000 ) ) ( not ( = ?auto_86998 ?auto_87001 ) ) ( not ( = ?auto_86998 ?auto_87002 ) ) ( not ( = ?auto_86999 ?auto_87000 ) ) ( not ( = ?auto_86999 ?auto_87001 ) ) ( not ( = ?auto_86999 ?auto_87002 ) ) ( not ( = ?auto_87000 ?auto_87001 ) ) ( not ( = ?auto_87000 ?auto_87002 ) ) ( not ( = ?auto_87001 ?auto_87002 ) ) ( ON-TABLE ?auto_87002 ) ( ON ?auto_87001 ?auto_87002 ) ( ON ?auto_87000 ?auto_87001 ) ( CLEAR ?auto_86998 ) ( ON ?auto_86999 ?auto_87000 ) ( CLEAR ?auto_86999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_87002 ?auto_87001 ?auto_87000 )
      ( MAKE-7PILE ?auto_86996 ?auto_86997 ?auto_86998 ?auto_86999 ?auto_87000 ?auto_87001 ?auto_87002 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87003 - BLOCK
      ?auto_87004 - BLOCK
      ?auto_87005 - BLOCK
      ?auto_87006 - BLOCK
      ?auto_87007 - BLOCK
      ?auto_87008 - BLOCK
      ?auto_87009 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87003 ) ( ON ?auto_87004 ?auto_87003 ) ( not ( = ?auto_87003 ?auto_87004 ) ) ( not ( = ?auto_87003 ?auto_87005 ) ) ( not ( = ?auto_87003 ?auto_87006 ) ) ( not ( = ?auto_87003 ?auto_87007 ) ) ( not ( = ?auto_87003 ?auto_87008 ) ) ( not ( = ?auto_87003 ?auto_87009 ) ) ( not ( = ?auto_87004 ?auto_87005 ) ) ( not ( = ?auto_87004 ?auto_87006 ) ) ( not ( = ?auto_87004 ?auto_87007 ) ) ( not ( = ?auto_87004 ?auto_87008 ) ) ( not ( = ?auto_87004 ?auto_87009 ) ) ( not ( = ?auto_87005 ?auto_87006 ) ) ( not ( = ?auto_87005 ?auto_87007 ) ) ( not ( = ?auto_87005 ?auto_87008 ) ) ( not ( = ?auto_87005 ?auto_87009 ) ) ( not ( = ?auto_87006 ?auto_87007 ) ) ( not ( = ?auto_87006 ?auto_87008 ) ) ( not ( = ?auto_87006 ?auto_87009 ) ) ( not ( = ?auto_87007 ?auto_87008 ) ) ( not ( = ?auto_87007 ?auto_87009 ) ) ( not ( = ?auto_87008 ?auto_87009 ) ) ( ON-TABLE ?auto_87009 ) ( ON ?auto_87008 ?auto_87009 ) ( ON ?auto_87007 ?auto_87008 ) ( ON ?auto_87006 ?auto_87007 ) ( CLEAR ?auto_87006 ) ( HOLDING ?auto_87005 ) ( CLEAR ?auto_87004 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_87003 ?auto_87004 ?auto_87005 )
      ( MAKE-7PILE ?auto_87003 ?auto_87004 ?auto_87005 ?auto_87006 ?auto_87007 ?auto_87008 ?auto_87009 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87010 - BLOCK
      ?auto_87011 - BLOCK
      ?auto_87012 - BLOCK
      ?auto_87013 - BLOCK
      ?auto_87014 - BLOCK
      ?auto_87015 - BLOCK
      ?auto_87016 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87010 ) ( ON ?auto_87011 ?auto_87010 ) ( not ( = ?auto_87010 ?auto_87011 ) ) ( not ( = ?auto_87010 ?auto_87012 ) ) ( not ( = ?auto_87010 ?auto_87013 ) ) ( not ( = ?auto_87010 ?auto_87014 ) ) ( not ( = ?auto_87010 ?auto_87015 ) ) ( not ( = ?auto_87010 ?auto_87016 ) ) ( not ( = ?auto_87011 ?auto_87012 ) ) ( not ( = ?auto_87011 ?auto_87013 ) ) ( not ( = ?auto_87011 ?auto_87014 ) ) ( not ( = ?auto_87011 ?auto_87015 ) ) ( not ( = ?auto_87011 ?auto_87016 ) ) ( not ( = ?auto_87012 ?auto_87013 ) ) ( not ( = ?auto_87012 ?auto_87014 ) ) ( not ( = ?auto_87012 ?auto_87015 ) ) ( not ( = ?auto_87012 ?auto_87016 ) ) ( not ( = ?auto_87013 ?auto_87014 ) ) ( not ( = ?auto_87013 ?auto_87015 ) ) ( not ( = ?auto_87013 ?auto_87016 ) ) ( not ( = ?auto_87014 ?auto_87015 ) ) ( not ( = ?auto_87014 ?auto_87016 ) ) ( not ( = ?auto_87015 ?auto_87016 ) ) ( ON-TABLE ?auto_87016 ) ( ON ?auto_87015 ?auto_87016 ) ( ON ?auto_87014 ?auto_87015 ) ( ON ?auto_87013 ?auto_87014 ) ( CLEAR ?auto_87011 ) ( ON ?auto_87012 ?auto_87013 ) ( CLEAR ?auto_87012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_87016 ?auto_87015 ?auto_87014 ?auto_87013 )
      ( MAKE-7PILE ?auto_87010 ?auto_87011 ?auto_87012 ?auto_87013 ?auto_87014 ?auto_87015 ?auto_87016 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87017 - BLOCK
      ?auto_87018 - BLOCK
      ?auto_87019 - BLOCK
      ?auto_87020 - BLOCK
      ?auto_87021 - BLOCK
      ?auto_87022 - BLOCK
      ?auto_87023 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87017 ) ( not ( = ?auto_87017 ?auto_87018 ) ) ( not ( = ?auto_87017 ?auto_87019 ) ) ( not ( = ?auto_87017 ?auto_87020 ) ) ( not ( = ?auto_87017 ?auto_87021 ) ) ( not ( = ?auto_87017 ?auto_87022 ) ) ( not ( = ?auto_87017 ?auto_87023 ) ) ( not ( = ?auto_87018 ?auto_87019 ) ) ( not ( = ?auto_87018 ?auto_87020 ) ) ( not ( = ?auto_87018 ?auto_87021 ) ) ( not ( = ?auto_87018 ?auto_87022 ) ) ( not ( = ?auto_87018 ?auto_87023 ) ) ( not ( = ?auto_87019 ?auto_87020 ) ) ( not ( = ?auto_87019 ?auto_87021 ) ) ( not ( = ?auto_87019 ?auto_87022 ) ) ( not ( = ?auto_87019 ?auto_87023 ) ) ( not ( = ?auto_87020 ?auto_87021 ) ) ( not ( = ?auto_87020 ?auto_87022 ) ) ( not ( = ?auto_87020 ?auto_87023 ) ) ( not ( = ?auto_87021 ?auto_87022 ) ) ( not ( = ?auto_87021 ?auto_87023 ) ) ( not ( = ?auto_87022 ?auto_87023 ) ) ( ON-TABLE ?auto_87023 ) ( ON ?auto_87022 ?auto_87023 ) ( ON ?auto_87021 ?auto_87022 ) ( ON ?auto_87020 ?auto_87021 ) ( ON ?auto_87019 ?auto_87020 ) ( CLEAR ?auto_87019 ) ( HOLDING ?auto_87018 ) ( CLEAR ?auto_87017 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_87017 ?auto_87018 )
      ( MAKE-7PILE ?auto_87017 ?auto_87018 ?auto_87019 ?auto_87020 ?auto_87021 ?auto_87022 ?auto_87023 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87024 - BLOCK
      ?auto_87025 - BLOCK
      ?auto_87026 - BLOCK
      ?auto_87027 - BLOCK
      ?auto_87028 - BLOCK
      ?auto_87029 - BLOCK
      ?auto_87030 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87024 ) ( not ( = ?auto_87024 ?auto_87025 ) ) ( not ( = ?auto_87024 ?auto_87026 ) ) ( not ( = ?auto_87024 ?auto_87027 ) ) ( not ( = ?auto_87024 ?auto_87028 ) ) ( not ( = ?auto_87024 ?auto_87029 ) ) ( not ( = ?auto_87024 ?auto_87030 ) ) ( not ( = ?auto_87025 ?auto_87026 ) ) ( not ( = ?auto_87025 ?auto_87027 ) ) ( not ( = ?auto_87025 ?auto_87028 ) ) ( not ( = ?auto_87025 ?auto_87029 ) ) ( not ( = ?auto_87025 ?auto_87030 ) ) ( not ( = ?auto_87026 ?auto_87027 ) ) ( not ( = ?auto_87026 ?auto_87028 ) ) ( not ( = ?auto_87026 ?auto_87029 ) ) ( not ( = ?auto_87026 ?auto_87030 ) ) ( not ( = ?auto_87027 ?auto_87028 ) ) ( not ( = ?auto_87027 ?auto_87029 ) ) ( not ( = ?auto_87027 ?auto_87030 ) ) ( not ( = ?auto_87028 ?auto_87029 ) ) ( not ( = ?auto_87028 ?auto_87030 ) ) ( not ( = ?auto_87029 ?auto_87030 ) ) ( ON-TABLE ?auto_87030 ) ( ON ?auto_87029 ?auto_87030 ) ( ON ?auto_87028 ?auto_87029 ) ( ON ?auto_87027 ?auto_87028 ) ( ON ?auto_87026 ?auto_87027 ) ( CLEAR ?auto_87024 ) ( ON ?auto_87025 ?auto_87026 ) ( CLEAR ?auto_87025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_87030 ?auto_87029 ?auto_87028 ?auto_87027 ?auto_87026 )
      ( MAKE-7PILE ?auto_87024 ?auto_87025 ?auto_87026 ?auto_87027 ?auto_87028 ?auto_87029 ?auto_87030 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87031 - BLOCK
      ?auto_87032 - BLOCK
      ?auto_87033 - BLOCK
      ?auto_87034 - BLOCK
      ?auto_87035 - BLOCK
      ?auto_87036 - BLOCK
      ?auto_87037 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87031 ?auto_87032 ) ) ( not ( = ?auto_87031 ?auto_87033 ) ) ( not ( = ?auto_87031 ?auto_87034 ) ) ( not ( = ?auto_87031 ?auto_87035 ) ) ( not ( = ?auto_87031 ?auto_87036 ) ) ( not ( = ?auto_87031 ?auto_87037 ) ) ( not ( = ?auto_87032 ?auto_87033 ) ) ( not ( = ?auto_87032 ?auto_87034 ) ) ( not ( = ?auto_87032 ?auto_87035 ) ) ( not ( = ?auto_87032 ?auto_87036 ) ) ( not ( = ?auto_87032 ?auto_87037 ) ) ( not ( = ?auto_87033 ?auto_87034 ) ) ( not ( = ?auto_87033 ?auto_87035 ) ) ( not ( = ?auto_87033 ?auto_87036 ) ) ( not ( = ?auto_87033 ?auto_87037 ) ) ( not ( = ?auto_87034 ?auto_87035 ) ) ( not ( = ?auto_87034 ?auto_87036 ) ) ( not ( = ?auto_87034 ?auto_87037 ) ) ( not ( = ?auto_87035 ?auto_87036 ) ) ( not ( = ?auto_87035 ?auto_87037 ) ) ( not ( = ?auto_87036 ?auto_87037 ) ) ( ON-TABLE ?auto_87037 ) ( ON ?auto_87036 ?auto_87037 ) ( ON ?auto_87035 ?auto_87036 ) ( ON ?auto_87034 ?auto_87035 ) ( ON ?auto_87033 ?auto_87034 ) ( ON ?auto_87032 ?auto_87033 ) ( CLEAR ?auto_87032 ) ( HOLDING ?auto_87031 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_87031 )
      ( MAKE-7PILE ?auto_87031 ?auto_87032 ?auto_87033 ?auto_87034 ?auto_87035 ?auto_87036 ?auto_87037 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87038 - BLOCK
      ?auto_87039 - BLOCK
      ?auto_87040 - BLOCK
      ?auto_87041 - BLOCK
      ?auto_87042 - BLOCK
      ?auto_87043 - BLOCK
      ?auto_87044 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87038 ?auto_87039 ) ) ( not ( = ?auto_87038 ?auto_87040 ) ) ( not ( = ?auto_87038 ?auto_87041 ) ) ( not ( = ?auto_87038 ?auto_87042 ) ) ( not ( = ?auto_87038 ?auto_87043 ) ) ( not ( = ?auto_87038 ?auto_87044 ) ) ( not ( = ?auto_87039 ?auto_87040 ) ) ( not ( = ?auto_87039 ?auto_87041 ) ) ( not ( = ?auto_87039 ?auto_87042 ) ) ( not ( = ?auto_87039 ?auto_87043 ) ) ( not ( = ?auto_87039 ?auto_87044 ) ) ( not ( = ?auto_87040 ?auto_87041 ) ) ( not ( = ?auto_87040 ?auto_87042 ) ) ( not ( = ?auto_87040 ?auto_87043 ) ) ( not ( = ?auto_87040 ?auto_87044 ) ) ( not ( = ?auto_87041 ?auto_87042 ) ) ( not ( = ?auto_87041 ?auto_87043 ) ) ( not ( = ?auto_87041 ?auto_87044 ) ) ( not ( = ?auto_87042 ?auto_87043 ) ) ( not ( = ?auto_87042 ?auto_87044 ) ) ( not ( = ?auto_87043 ?auto_87044 ) ) ( ON-TABLE ?auto_87044 ) ( ON ?auto_87043 ?auto_87044 ) ( ON ?auto_87042 ?auto_87043 ) ( ON ?auto_87041 ?auto_87042 ) ( ON ?auto_87040 ?auto_87041 ) ( ON ?auto_87039 ?auto_87040 ) ( ON ?auto_87038 ?auto_87039 ) ( CLEAR ?auto_87038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_87044 ?auto_87043 ?auto_87042 ?auto_87041 ?auto_87040 ?auto_87039 )
      ( MAKE-7PILE ?auto_87038 ?auto_87039 ?auto_87040 ?auto_87041 ?auto_87042 ?auto_87043 ?auto_87044 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87045 - BLOCK
      ?auto_87046 - BLOCK
      ?auto_87047 - BLOCK
      ?auto_87048 - BLOCK
      ?auto_87049 - BLOCK
      ?auto_87050 - BLOCK
      ?auto_87051 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87045 ?auto_87046 ) ) ( not ( = ?auto_87045 ?auto_87047 ) ) ( not ( = ?auto_87045 ?auto_87048 ) ) ( not ( = ?auto_87045 ?auto_87049 ) ) ( not ( = ?auto_87045 ?auto_87050 ) ) ( not ( = ?auto_87045 ?auto_87051 ) ) ( not ( = ?auto_87046 ?auto_87047 ) ) ( not ( = ?auto_87046 ?auto_87048 ) ) ( not ( = ?auto_87046 ?auto_87049 ) ) ( not ( = ?auto_87046 ?auto_87050 ) ) ( not ( = ?auto_87046 ?auto_87051 ) ) ( not ( = ?auto_87047 ?auto_87048 ) ) ( not ( = ?auto_87047 ?auto_87049 ) ) ( not ( = ?auto_87047 ?auto_87050 ) ) ( not ( = ?auto_87047 ?auto_87051 ) ) ( not ( = ?auto_87048 ?auto_87049 ) ) ( not ( = ?auto_87048 ?auto_87050 ) ) ( not ( = ?auto_87048 ?auto_87051 ) ) ( not ( = ?auto_87049 ?auto_87050 ) ) ( not ( = ?auto_87049 ?auto_87051 ) ) ( not ( = ?auto_87050 ?auto_87051 ) ) ( ON-TABLE ?auto_87051 ) ( ON ?auto_87050 ?auto_87051 ) ( ON ?auto_87049 ?auto_87050 ) ( ON ?auto_87048 ?auto_87049 ) ( ON ?auto_87047 ?auto_87048 ) ( ON ?auto_87046 ?auto_87047 ) ( HOLDING ?auto_87045 ) ( CLEAR ?auto_87046 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_87051 ?auto_87050 ?auto_87049 ?auto_87048 ?auto_87047 ?auto_87046 ?auto_87045 )
      ( MAKE-7PILE ?auto_87045 ?auto_87046 ?auto_87047 ?auto_87048 ?auto_87049 ?auto_87050 ?auto_87051 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87052 - BLOCK
      ?auto_87053 - BLOCK
      ?auto_87054 - BLOCK
      ?auto_87055 - BLOCK
      ?auto_87056 - BLOCK
      ?auto_87057 - BLOCK
      ?auto_87058 - BLOCK
    )
    :vars
    (
      ?auto_87059 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87052 ?auto_87053 ) ) ( not ( = ?auto_87052 ?auto_87054 ) ) ( not ( = ?auto_87052 ?auto_87055 ) ) ( not ( = ?auto_87052 ?auto_87056 ) ) ( not ( = ?auto_87052 ?auto_87057 ) ) ( not ( = ?auto_87052 ?auto_87058 ) ) ( not ( = ?auto_87053 ?auto_87054 ) ) ( not ( = ?auto_87053 ?auto_87055 ) ) ( not ( = ?auto_87053 ?auto_87056 ) ) ( not ( = ?auto_87053 ?auto_87057 ) ) ( not ( = ?auto_87053 ?auto_87058 ) ) ( not ( = ?auto_87054 ?auto_87055 ) ) ( not ( = ?auto_87054 ?auto_87056 ) ) ( not ( = ?auto_87054 ?auto_87057 ) ) ( not ( = ?auto_87054 ?auto_87058 ) ) ( not ( = ?auto_87055 ?auto_87056 ) ) ( not ( = ?auto_87055 ?auto_87057 ) ) ( not ( = ?auto_87055 ?auto_87058 ) ) ( not ( = ?auto_87056 ?auto_87057 ) ) ( not ( = ?auto_87056 ?auto_87058 ) ) ( not ( = ?auto_87057 ?auto_87058 ) ) ( ON-TABLE ?auto_87058 ) ( ON ?auto_87057 ?auto_87058 ) ( ON ?auto_87056 ?auto_87057 ) ( ON ?auto_87055 ?auto_87056 ) ( ON ?auto_87054 ?auto_87055 ) ( ON ?auto_87053 ?auto_87054 ) ( CLEAR ?auto_87053 ) ( ON ?auto_87052 ?auto_87059 ) ( CLEAR ?auto_87052 ) ( HAND-EMPTY ) ( not ( = ?auto_87052 ?auto_87059 ) ) ( not ( = ?auto_87053 ?auto_87059 ) ) ( not ( = ?auto_87054 ?auto_87059 ) ) ( not ( = ?auto_87055 ?auto_87059 ) ) ( not ( = ?auto_87056 ?auto_87059 ) ) ( not ( = ?auto_87057 ?auto_87059 ) ) ( not ( = ?auto_87058 ?auto_87059 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_87052 ?auto_87059 )
      ( MAKE-7PILE ?auto_87052 ?auto_87053 ?auto_87054 ?auto_87055 ?auto_87056 ?auto_87057 ?auto_87058 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87060 - BLOCK
      ?auto_87061 - BLOCK
      ?auto_87062 - BLOCK
      ?auto_87063 - BLOCK
      ?auto_87064 - BLOCK
      ?auto_87065 - BLOCK
      ?auto_87066 - BLOCK
    )
    :vars
    (
      ?auto_87067 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87060 ?auto_87061 ) ) ( not ( = ?auto_87060 ?auto_87062 ) ) ( not ( = ?auto_87060 ?auto_87063 ) ) ( not ( = ?auto_87060 ?auto_87064 ) ) ( not ( = ?auto_87060 ?auto_87065 ) ) ( not ( = ?auto_87060 ?auto_87066 ) ) ( not ( = ?auto_87061 ?auto_87062 ) ) ( not ( = ?auto_87061 ?auto_87063 ) ) ( not ( = ?auto_87061 ?auto_87064 ) ) ( not ( = ?auto_87061 ?auto_87065 ) ) ( not ( = ?auto_87061 ?auto_87066 ) ) ( not ( = ?auto_87062 ?auto_87063 ) ) ( not ( = ?auto_87062 ?auto_87064 ) ) ( not ( = ?auto_87062 ?auto_87065 ) ) ( not ( = ?auto_87062 ?auto_87066 ) ) ( not ( = ?auto_87063 ?auto_87064 ) ) ( not ( = ?auto_87063 ?auto_87065 ) ) ( not ( = ?auto_87063 ?auto_87066 ) ) ( not ( = ?auto_87064 ?auto_87065 ) ) ( not ( = ?auto_87064 ?auto_87066 ) ) ( not ( = ?auto_87065 ?auto_87066 ) ) ( ON-TABLE ?auto_87066 ) ( ON ?auto_87065 ?auto_87066 ) ( ON ?auto_87064 ?auto_87065 ) ( ON ?auto_87063 ?auto_87064 ) ( ON ?auto_87062 ?auto_87063 ) ( ON ?auto_87060 ?auto_87067 ) ( CLEAR ?auto_87060 ) ( not ( = ?auto_87060 ?auto_87067 ) ) ( not ( = ?auto_87061 ?auto_87067 ) ) ( not ( = ?auto_87062 ?auto_87067 ) ) ( not ( = ?auto_87063 ?auto_87067 ) ) ( not ( = ?auto_87064 ?auto_87067 ) ) ( not ( = ?auto_87065 ?auto_87067 ) ) ( not ( = ?auto_87066 ?auto_87067 ) ) ( HOLDING ?auto_87061 ) ( CLEAR ?auto_87062 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_87066 ?auto_87065 ?auto_87064 ?auto_87063 ?auto_87062 ?auto_87061 )
      ( MAKE-7PILE ?auto_87060 ?auto_87061 ?auto_87062 ?auto_87063 ?auto_87064 ?auto_87065 ?auto_87066 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87068 - BLOCK
      ?auto_87069 - BLOCK
      ?auto_87070 - BLOCK
      ?auto_87071 - BLOCK
      ?auto_87072 - BLOCK
      ?auto_87073 - BLOCK
      ?auto_87074 - BLOCK
    )
    :vars
    (
      ?auto_87075 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87068 ?auto_87069 ) ) ( not ( = ?auto_87068 ?auto_87070 ) ) ( not ( = ?auto_87068 ?auto_87071 ) ) ( not ( = ?auto_87068 ?auto_87072 ) ) ( not ( = ?auto_87068 ?auto_87073 ) ) ( not ( = ?auto_87068 ?auto_87074 ) ) ( not ( = ?auto_87069 ?auto_87070 ) ) ( not ( = ?auto_87069 ?auto_87071 ) ) ( not ( = ?auto_87069 ?auto_87072 ) ) ( not ( = ?auto_87069 ?auto_87073 ) ) ( not ( = ?auto_87069 ?auto_87074 ) ) ( not ( = ?auto_87070 ?auto_87071 ) ) ( not ( = ?auto_87070 ?auto_87072 ) ) ( not ( = ?auto_87070 ?auto_87073 ) ) ( not ( = ?auto_87070 ?auto_87074 ) ) ( not ( = ?auto_87071 ?auto_87072 ) ) ( not ( = ?auto_87071 ?auto_87073 ) ) ( not ( = ?auto_87071 ?auto_87074 ) ) ( not ( = ?auto_87072 ?auto_87073 ) ) ( not ( = ?auto_87072 ?auto_87074 ) ) ( not ( = ?auto_87073 ?auto_87074 ) ) ( ON-TABLE ?auto_87074 ) ( ON ?auto_87073 ?auto_87074 ) ( ON ?auto_87072 ?auto_87073 ) ( ON ?auto_87071 ?auto_87072 ) ( ON ?auto_87070 ?auto_87071 ) ( ON ?auto_87068 ?auto_87075 ) ( not ( = ?auto_87068 ?auto_87075 ) ) ( not ( = ?auto_87069 ?auto_87075 ) ) ( not ( = ?auto_87070 ?auto_87075 ) ) ( not ( = ?auto_87071 ?auto_87075 ) ) ( not ( = ?auto_87072 ?auto_87075 ) ) ( not ( = ?auto_87073 ?auto_87075 ) ) ( not ( = ?auto_87074 ?auto_87075 ) ) ( CLEAR ?auto_87070 ) ( ON ?auto_87069 ?auto_87068 ) ( CLEAR ?auto_87069 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_87075 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_87075 ?auto_87068 )
      ( MAKE-7PILE ?auto_87068 ?auto_87069 ?auto_87070 ?auto_87071 ?auto_87072 ?auto_87073 ?auto_87074 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87076 - BLOCK
      ?auto_87077 - BLOCK
      ?auto_87078 - BLOCK
      ?auto_87079 - BLOCK
      ?auto_87080 - BLOCK
      ?auto_87081 - BLOCK
      ?auto_87082 - BLOCK
    )
    :vars
    (
      ?auto_87083 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87076 ?auto_87077 ) ) ( not ( = ?auto_87076 ?auto_87078 ) ) ( not ( = ?auto_87076 ?auto_87079 ) ) ( not ( = ?auto_87076 ?auto_87080 ) ) ( not ( = ?auto_87076 ?auto_87081 ) ) ( not ( = ?auto_87076 ?auto_87082 ) ) ( not ( = ?auto_87077 ?auto_87078 ) ) ( not ( = ?auto_87077 ?auto_87079 ) ) ( not ( = ?auto_87077 ?auto_87080 ) ) ( not ( = ?auto_87077 ?auto_87081 ) ) ( not ( = ?auto_87077 ?auto_87082 ) ) ( not ( = ?auto_87078 ?auto_87079 ) ) ( not ( = ?auto_87078 ?auto_87080 ) ) ( not ( = ?auto_87078 ?auto_87081 ) ) ( not ( = ?auto_87078 ?auto_87082 ) ) ( not ( = ?auto_87079 ?auto_87080 ) ) ( not ( = ?auto_87079 ?auto_87081 ) ) ( not ( = ?auto_87079 ?auto_87082 ) ) ( not ( = ?auto_87080 ?auto_87081 ) ) ( not ( = ?auto_87080 ?auto_87082 ) ) ( not ( = ?auto_87081 ?auto_87082 ) ) ( ON-TABLE ?auto_87082 ) ( ON ?auto_87081 ?auto_87082 ) ( ON ?auto_87080 ?auto_87081 ) ( ON ?auto_87079 ?auto_87080 ) ( ON ?auto_87076 ?auto_87083 ) ( not ( = ?auto_87076 ?auto_87083 ) ) ( not ( = ?auto_87077 ?auto_87083 ) ) ( not ( = ?auto_87078 ?auto_87083 ) ) ( not ( = ?auto_87079 ?auto_87083 ) ) ( not ( = ?auto_87080 ?auto_87083 ) ) ( not ( = ?auto_87081 ?auto_87083 ) ) ( not ( = ?auto_87082 ?auto_87083 ) ) ( ON ?auto_87077 ?auto_87076 ) ( CLEAR ?auto_87077 ) ( ON-TABLE ?auto_87083 ) ( HOLDING ?auto_87078 ) ( CLEAR ?auto_87079 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_87082 ?auto_87081 ?auto_87080 ?auto_87079 ?auto_87078 )
      ( MAKE-7PILE ?auto_87076 ?auto_87077 ?auto_87078 ?auto_87079 ?auto_87080 ?auto_87081 ?auto_87082 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87084 - BLOCK
      ?auto_87085 - BLOCK
      ?auto_87086 - BLOCK
      ?auto_87087 - BLOCK
      ?auto_87088 - BLOCK
      ?auto_87089 - BLOCK
      ?auto_87090 - BLOCK
    )
    :vars
    (
      ?auto_87091 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87084 ?auto_87085 ) ) ( not ( = ?auto_87084 ?auto_87086 ) ) ( not ( = ?auto_87084 ?auto_87087 ) ) ( not ( = ?auto_87084 ?auto_87088 ) ) ( not ( = ?auto_87084 ?auto_87089 ) ) ( not ( = ?auto_87084 ?auto_87090 ) ) ( not ( = ?auto_87085 ?auto_87086 ) ) ( not ( = ?auto_87085 ?auto_87087 ) ) ( not ( = ?auto_87085 ?auto_87088 ) ) ( not ( = ?auto_87085 ?auto_87089 ) ) ( not ( = ?auto_87085 ?auto_87090 ) ) ( not ( = ?auto_87086 ?auto_87087 ) ) ( not ( = ?auto_87086 ?auto_87088 ) ) ( not ( = ?auto_87086 ?auto_87089 ) ) ( not ( = ?auto_87086 ?auto_87090 ) ) ( not ( = ?auto_87087 ?auto_87088 ) ) ( not ( = ?auto_87087 ?auto_87089 ) ) ( not ( = ?auto_87087 ?auto_87090 ) ) ( not ( = ?auto_87088 ?auto_87089 ) ) ( not ( = ?auto_87088 ?auto_87090 ) ) ( not ( = ?auto_87089 ?auto_87090 ) ) ( ON-TABLE ?auto_87090 ) ( ON ?auto_87089 ?auto_87090 ) ( ON ?auto_87088 ?auto_87089 ) ( ON ?auto_87087 ?auto_87088 ) ( ON ?auto_87084 ?auto_87091 ) ( not ( = ?auto_87084 ?auto_87091 ) ) ( not ( = ?auto_87085 ?auto_87091 ) ) ( not ( = ?auto_87086 ?auto_87091 ) ) ( not ( = ?auto_87087 ?auto_87091 ) ) ( not ( = ?auto_87088 ?auto_87091 ) ) ( not ( = ?auto_87089 ?auto_87091 ) ) ( not ( = ?auto_87090 ?auto_87091 ) ) ( ON ?auto_87085 ?auto_87084 ) ( ON-TABLE ?auto_87091 ) ( CLEAR ?auto_87087 ) ( ON ?auto_87086 ?auto_87085 ) ( CLEAR ?auto_87086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_87091 ?auto_87084 ?auto_87085 )
      ( MAKE-7PILE ?auto_87084 ?auto_87085 ?auto_87086 ?auto_87087 ?auto_87088 ?auto_87089 ?auto_87090 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87092 - BLOCK
      ?auto_87093 - BLOCK
      ?auto_87094 - BLOCK
      ?auto_87095 - BLOCK
      ?auto_87096 - BLOCK
      ?auto_87097 - BLOCK
      ?auto_87098 - BLOCK
    )
    :vars
    (
      ?auto_87099 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87092 ?auto_87093 ) ) ( not ( = ?auto_87092 ?auto_87094 ) ) ( not ( = ?auto_87092 ?auto_87095 ) ) ( not ( = ?auto_87092 ?auto_87096 ) ) ( not ( = ?auto_87092 ?auto_87097 ) ) ( not ( = ?auto_87092 ?auto_87098 ) ) ( not ( = ?auto_87093 ?auto_87094 ) ) ( not ( = ?auto_87093 ?auto_87095 ) ) ( not ( = ?auto_87093 ?auto_87096 ) ) ( not ( = ?auto_87093 ?auto_87097 ) ) ( not ( = ?auto_87093 ?auto_87098 ) ) ( not ( = ?auto_87094 ?auto_87095 ) ) ( not ( = ?auto_87094 ?auto_87096 ) ) ( not ( = ?auto_87094 ?auto_87097 ) ) ( not ( = ?auto_87094 ?auto_87098 ) ) ( not ( = ?auto_87095 ?auto_87096 ) ) ( not ( = ?auto_87095 ?auto_87097 ) ) ( not ( = ?auto_87095 ?auto_87098 ) ) ( not ( = ?auto_87096 ?auto_87097 ) ) ( not ( = ?auto_87096 ?auto_87098 ) ) ( not ( = ?auto_87097 ?auto_87098 ) ) ( ON-TABLE ?auto_87098 ) ( ON ?auto_87097 ?auto_87098 ) ( ON ?auto_87096 ?auto_87097 ) ( ON ?auto_87092 ?auto_87099 ) ( not ( = ?auto_87092 ?auto_87099 ) ) ( not ( = ?auto_87093 ?auto_87099 ) ) ( not ( = ?auto_87094 ?auto_87099 ) ) ( not ( = ?auto_87095 ?auto_87099 ) ) ( not ( = ?auto_87096 ?auto_87099 ) ) ( not ( = ?auto_87097 ?auto_87099 ) ) ( not ( = ?auto_87098 ?auto_87099 ) ) ( ON ?auto_87093 ?auto_87092 ) ( ON-TABLE ?auto_87099 ) ( ON ?auto_87094 ?auto_87093 ) ( CLEAR ?auto_87094 ) ( HOLDING ?auto_87095 ) ( CLEAR ?auto_87096 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_87098 ?auto_87097 ?auto_87096 ?auto_87095 )
      ( MAKE-7PILE ?auto_87092 ?auto_87093 ?auto_87094 ?auto_87095 ?auto_87096 ?auto_87097 ?auto_87098 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87100 - BLOCK
      ?auto_87101 - BLOCK
      ?auto_87102 - BLOCK
      ?auto_87103 - BLOCK
      ?auto_87104 - BLOCK
      ?auto_87105 - BLOCK
      ?auto_87106 - BLOCK
    )
    :vars
    (
      ?auto_87107 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87100 ?auto_87101 ) ) ( not ( = ?auto_87100 ?auto_87102 ) ) ( not ( = ?auto_87100 ?auto_87103 ) ) ( not ( = ?auto_87100 ?auto_87104 ) ) ( not ( = ?auto_87100 ?auto_87105 ) ) ( not ( = ?auto_87100 ?auto_87106 ) ) ( not ( = ?auto_87101 ?auto_87102 ) ) ( not ( = ?auto_87101 ?auto_87103 ) ) ( not ( = ?auto_87101 ?auto_87104 ) ) ( not ( = ?auto_87101 ?auto_87105 ) ) ( not ( = ?auto_87101 ?auto_87106 ) ) ( not ( = ?auto_87102 ?auto_87103 ) ) ( not ( = ?auto_87102 ?auto_87104 ) ) ( not ( = ?auto_87102 ?auto_87105 ) ) ( not ( = ?auto_87102 ?auto_87106 ) ) ( not ( = ?auto_87103 ?auto_87104 ) ) ( not ( = ?auto_87103 ?auto_87105 ) ) ( not ( = ?auto_87103 ?auto_87106 ) ) ( not ( = ?auto_87104 ?auto_87105 ) ) ( not ( = ?auto_87104 ?auto_87106 ) ) ( not ( = ?auto_87105 ?auto_87106 ) ) ( ON-TABLE ?auto_87106 ) ( ON ?auto_87105 ?auto_87106 ) ( ON ?auto_87104 ?auto_87105 ) ( ON ?auto_87100 ?auto_87107 ) ( not ( = ?auto_87100 ?auto_87107 ) ) ( not ( = ?auto_87101 ?auto_87107 ) ) ( not ( = ?auto_87102 ?auto_87107 ) ) ( not ( = ?auto_87103 ?auto_87107 ) ) ( not ( = ?auto_87104 ?auto_87107 ) ) ( not ( = ?auto_87105 ?auto_87107 ) ) ( not ( = ?auto_87106 ?auto_87107 ) ) ( ON ?auto_87101 ?auto_87100 ) ( ON-TABLE ?auto_87107 ) ( ON ?auto_87102 ?auto_87101 ) ( CLEAR ?auto_87104 ) ( ON ?auto_87103 ?auto_87102 ) ( CLEAR ?auto_87103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_87107 ?auto_87100 ?auto_87101 ?auto_87102 )
      ( MAKE-7PILE ?auto_87100 ?auto_87101 ?auto_87102 ?auto_87103 ?auto_87104 ?auto_87105 ?auto_87106 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87108 - BLOCK
      ?auto_87109 - BLOCK
      ?auto_87110 - BLOCK
      ?auto_87111 - BLOCK
      ?auto_87112 - BLOCK
      ?auto_87113 - BLOCK
      ?auto_87114 - BLOCK
    )
    :vars
    (
      ?auto_87115 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87108 ?auto_87109 ) ) ( not ( = ?auto_87108 ?auto_87110 ) ) ( not ( = ?auto_87108 ?auto_87111 ) ) ( not ( = ?auto_87108 ?auto_87112 ) ) ( not ( = ?auto_87108 ?auto_87113 ) ) ( not ( = ?auto_87108 ?auto_87114 ) ) ( not ( = ?auto_87109 ?auto_87110 ) ) ( not ( = ?auto_87109 ?auto_87111 ) ) ( not ( = ?auto_87109 ?auto_87112 ) ) ( not ( = ?auto_87109 ?auto_87113 ) ) ( not ( = ?auto_87109 ?auto_87114 ) ) ( not ( = ?auto_87110 ?auto_87111 ) ) ( not ( = ?auto_87110 ?auto_87112 ) ) ( not ( = ?auto_87110 ?auto_87113 ) ) ( not ( = ?auto_87110 ?auto_87114 ) ) ( not ( = ?auto_87111 ?auto_87112 ) ) ( not ( = ?auto_87111 ?auto_87113 ) ) ( not ( = ?auto_87111 ?auto_87114 ) ) ( not ( = ?auto_87112 ?auto_87113 ) ) ( not ( = ?auto_87112 ?auto_87114 ) ) ( not ( = ?auto_87113 ?auto_87114 ) ) ( ON-TABLE ?auto_87114 ) ( ON ?auto_87113 ?auto_87114 ) ( ON ?auto_87108 ?auto_87115 ) ( not ( = ?auto_87108 ?auto_87115 ) ) ( not ( = ?auto_87109 ?auto_87115 ) ) ( not ( = ?auto_87110 ?auto_87115 ) ) ( not ( = ?auto_87111 ?auto_87115 ) ) ( not ( = ?auto_87112 ?auto_87115 ) ) ( not ( = ?auto_87113 ?auto_87115 ) ) ( not ( = ?auto_87114 ?auto_87115 ) ) ( ON ?auto_87109 ?auto_87108 ) ( ON-TABLE ?auto_87115 ) ( ON ?auto_87110 ?auto_87109 ) ( ON ?auto_87111 ?auto_87110 ) ( CLEAR ?auto_87111 ) ( HOLDING ?auto_87112 ) ( CLEAR ?auto_87113 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_87114 ?auto_87113 ?auto_87112 )
      ( MAKE-7PILE ?auto_87108 ?auto_87109 ?auto_87110 ?auto_87111 ?auto_87112 ?auto_87113 ?auto_87114 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87116 - BLOCK
      ?auto_87117 - BLOCK
      ?auto_87118 - BLOCK
      ?auto_87119 - BLOCK
      ?auto_87120 - BLOCK
      ?auto_87121 - BLOCK
      ?auto_87122 - BLOCK
    )
    :vars
    (
      ?auto_87123 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87116 ?auto_87117 ) ) ( not ( = ?auto_87116 ?auto_87118 ) ) ( not ( = ?auto_87116 ?auto_87119 ) ) ( not ( = ?auto_87116 ?auto_87120 ) ) ( not ( = ?auto_87116 ?auto_87121 ) ) ( not ( = ?auto_87116 ?auto_87122 ) ) ( not ( = ?auto_87117 ?auto_87118 ) ) ( not ( = ?auto_87117 ?auto_87119 ) ) ( not ( = ?auto_87117 ?auto_87120 ) ) ( not ( = ?auto_87117 ?auto_87121 ) ) ( not ( = ?auto_87117 ?auto_87122 ) ) ( not ( = ?auto_87118 ?auto_87119 ) ) ( not ( = ?auto_87118 ?auto_87120 ) ) ( not ( = ?auto_87118 ?auto_87121 ) ) ( not ( = ?auto_87118 ?auto_87122 ) ) ( not ( = ?auto_87119 ?auto_87120 ) ) ( not ( = ?auto_87119 ?auto_87121 ) ) ( not ( = ?auto_87119 ?auto_87122 ) ) ( not ( = ?auto_87120 ?auto_87121 ) ) ( not ( = ?auto_87120 ?auto_87122 ) ) ( not ( = ?auto_87121 ?auto_87122 ) ) ( ON-TABLE ?auto_87122 ) ( ON ?auto_87121 ?auto_87122 ) ( ON ?auto_87116 ?auto_87123 ) ( not ( = ?auto_87116 ?auto_87123 ) ) ( not ( = ?auto_87117 ?auto_87123 ) ) ( not ( = ?auto_87118 ?auto_87123 ) ) ( not ( = ?auto_87119 ?auto_87123 ) ) ( not ( = ?auto_87120 ?auto_87123 ) ) ( not ( = ?auto_87121 ?auto_87123 ) ) ( not ( = ?auto_87122 ?auto_87123 ) ) ( ON ?auto_87117 ?auto_87116 ) ( ON-TABLE ?auto_87123 ) ( ON ?auto_87118 ?auto_87117 ) ( ON ?auto_87119 ?auto_87118 ) ( CLEAR ?auto_87121 ) ( ON ?auto_87120 ?auto_87119 ) ( CLEAR ?auto_87120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_87123 ?auto_87116 ?auto_87117 ?auto_87118 ?auto_87119 )
      ( MAKE-7PILE ?auto_87116 ?auto_87117 ?auto_87118 ?auto_87119 ?auto_87120 ?auto_87121 ?auto_87122 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87124 - BLOCK
      ?auto_87125 - BLOCK
      ?auto_87126 - BLOCK
      ?auto_87127 - BLOCK
      ?auto_87128 - BLOCK
      ?auto_87129 - BLOCK
      ?auto_87130 - BLOCK
    )
    :vars
    (
      ?auto_87131 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87124 ?auto_87125 ) ) ( not ( = ?auto_87124 ?auto_87126 ) ) ( not ( = ?auto_87124 ?auto_87127 ) ) ( not ( = ?auto_87124 ?auto_87128 ) ) ( not ( = ?auto_87124 ?auto_87129 ) ) ( not ( = ?auto_87124 ?auto_87130 ) ) ( not ( = ?auto_87125 ?auto_87126 ) ) ( not ( = ?auto_87125 ?auto_87127 ) ) ( not ( = ?auto_87125 ?auto_87128 ) ) ( not ( = ?auto_87125 ?auto_87129 ) ) ( not ( = ?auto_87125 ?auto_87130 ) ) ( not ( = ?auto_87126 ?auto_87127 ) ) ( not ( = ?auto_87126 ?auto_87128 ) ) ( not ( = ?auto_87126 ?auto_87129 ) ) ( not ( = ?auto_87126 ?auto_87130 ) ) ( not ( = ?auto_87127 ?auto_87128 ) ) ( not ( = ?auto_87127 ?auto_87129 ) ) ( not ( = ?auto_87127 ?auto_87130 ) ) ( not ( = ?auto_87128 ?auto_87129 ) ) ( not ( = ?auto_87128 ?auto_87130 ) ) ( not ( = ?auto_87129 ?auto_87130 ) ) ( ON-TABLE ?auto_87130 ) ( ON ?auto_87124 ?auto_87131 ) ( not ( = ?auto_87124 ?auto_87131 ) ) ( not ( = ?auto_87125 ?auto_87131 ) ) ( not ( = ?auto_87126 ?auto_87131 ) ) ( not ( = ?auto_87127 ?auto_87131 ) ) ( not ( = ?auto_87128 ?auto_87131 ) ) ( not ( = ?auto_87129 ?auto_87131 ) ) ( not ( = ?auto_87130 ?auto_87131 ) ) ( ON ?auto_87125 ?auto_87124 ) ( ON-TABLE ?auto_87131 ) ( ON ?auto_87126 ?auto_87125 ) ( ON ?auto_87127 ?auto_87126 ) ( ON ?auto_87128 ?auto_87127 ) ( CLEAR ?auto_87128 ) ( HOLDING ?auto_87129 ) ( CLEAR ?auto_87130 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_87130 ?auto_87129 )
      ( MAKE-7PILE ?auto_87124 ?auto_87125 ?auto_87126 ?auto_87127 ?auto_87128 ?auto_87129 ?auto_87130 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87132 - BLOCK
      ?auto_87133 - BLOCK
      ?auto_87134 - BLOCK
      ?auto_87135 - BLOCK
      ?auto_87136 - BLOCK
      ?auto_87137 - BLOCK
      ?auto_87138 - BLOCK
    )
    :vars
    (
      ?auto_87139 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87132 ?auto_87133 ) ) ( not ( = ?auto_87132 ?auto_87134 ) ) ( not ( = ?auto_87132 ?auto_87135 ) ) ( not ( = ?auto_87132 ?auto_87136 ) ) ( not ( = ?auto_87132 ?auto_87137 ) ) ( not ( = ?auto_87132 ?auto_87138 ) ) ( not ( = ?auto_87133 ?auto_87134 ) ) ( not ( = ?auto_87133 ?auto_87135 ) ) ( not ( = ?auto_87133 ?auto_87136 ) ) ( not ( = ?auto_87133 ?auto_87137 ) ) ( not ( = ?auto_87133 ?auto_87138 ) ) ( not ( = ?auto_87134 ?auto_87135 ) ) ( not ( = ?auto_87134 ?auto_87136 ) ) ( not ( = ?auto_87134 ?auto_87137 ) ) ( not ( = ?auto_87134 ?auto_87138 ) ) ( not ( = ?auto_87135 ?auto_87136 ) ) ( not ( = ?auto_87135 ?auto_87137 ) ) ( not ( = ?auto_87135 ?auto_87138 ) ) ( not ( = ?auto_87136 ?auto_87137 ) ) ( not ( = ?auto_87136 ?auto_87138 ) ) ( not ( = ?auto_87137 ?auto_87138 ) ) ( ON-TABLE ?auto_87138 ) ( ON ?auto_87132 ?auto_87139 ) ( not ( = ?auto_87132 ?auto_87139 ) ) ( not ( = ?auto_87133 ?auto_87139 ) ) ( not ( = ?auto_87134 ?auto_87139 ) ) ( not ( = ?auto_87135 ?auto_87139 ) ) ( not ( = ?auto_87136 ?auto_87139 ) ) ( not ( = ?auto_87137 ?auto_87139 ) ) ( not ( = ?auto_87138 ?auto_87139 ) ) ( ON ?auto_87133 ?auto_87132 ) ( ON-TABLE ?auto_87139 ) ( ON ?auto_87134 ?auto_87133 ) ( ON ?auto_87135 ?auto_87134 ) ( ON ?auto_87136 ?auto_87135 ) ( CLEAR ?auto_87138 ) ( ON ?auto_87137 ?auto_87136 ) ( CLEAR ?auto_87137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_87139 ?auto_87132 ?auto_87133 ?auto_87134 ?auto_87135 ?auto_87136 )
      ( MAKE-7PILE ?auto_87132 ?auto_87133 ?auto_87134 ?auto_87135 ?auto_87136 ?auto_87137 ?auto_87138 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87140 - BLOCK
      ?auto_87141 - BLOCK
      ?auto_87142 - BLOCK
      ?auto_87143 - BLOCK
      ?auto_87144 - BLOCK
      ?auto_87145 - BLOCK
      ?auto_87146 - BLOCK
    )
    :vars
    (
      ?auto_87147 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87140 ?auto_87141 ) ) ( not ( = ?auto_87140 ?auto_87142 ) ) ( not ( = ?auto_87140 ?auto_87143 ) ) ( not ( = ?auto_87140 ?auto_87144 ) ) ( not ( = ?auto_87140 ?auto_87145 ) ) ( not ( = ?auto_87140 ?auto_87146 ) ) ( not ( = ?auto_87141 ?auto_87142 ) ) ( not ( = ?auto_87141 ?auto_87143 ) ) ( not ( = ?auto_87141 ?auto_87144 ) ) ( not ( = ?auto_87141 ?auto_87145 ) ) ( not ( = ?auto_87141 ?auto_87146 ) ) ( not ( = ?auto_87142 ?auto_87143 ) ) ( not ( = ?auto_87142 ?auto_87144 ) ) ( not ( = ?auto_87142 ?auto_87145 ) ) ( not ( = ?auto_87142 ?auto_87146 ) ) ( not ( = ?auto_87143 ?auto_87144 ) ) ( not ( = ?auto_87143 ?auto_87145 ) ) ( not ( = ?auto_87143 ?auto_87146 ) ) ( not ( = ?auto_87144 ?auto_87145 ) ) ( not ( = ?auto_87144 ?auto_87146 ) ) ( not ( = ?auto_87145 ?auto_87146 ) ) ( ON ?auto_87140 ?auto_87147 ) ( not ( = ?auto_87140 ?auto_87147 ) ) ( not ( = ?auto_87141 ?auto_87147 ) ) ( not ( = ?auto_87142 ?auto_87147 ) ) ( not ( = ?auto_87143 ?auto_87147 ) ) ( not ( = ?auto_87144 ?auto_87147 ) ) ( not ( = ?auto_87145 ?auto_87147 ) ) ( not ( = ?auto_87146 ?auto_87147 ) ) ( ON ?auto_87141 ?auto_87140 ) ( ON-TABLE ?auto_87147 ) ( ON ?auto_87142 ?auto_87141 ) ( ON ?auto_87143 ?auto_87142 ) ( ON ?auto_87144 ?auto_87143 ) ( ON ?auto_87145 ?auto_87144 ) ( CLEAR ?auto_87145 ) ( HOLDING ?auto_87146 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_87146 )
      ( MAKE-7PILE ?auto_87140 ?auto_87141 ?auto_87142 ?auto_87143 ?auto_87144 ?auto_87145 ?auto_87146 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87148 - BLOCK
      ?auto_87149 - BLOCK
      ?auto_87150 - BLOCK
      ?auto_87151 - BLOCK
      ?auto_87152 - BLOCK
      ?auto_87153 - BLOCK
      ?auto_87154 - BLOCK
    )
    :vars
    (
      ?auto_87155 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87148 ?auto_87149 ) ) ( not ( = ?auto_87148 ?auto_87150 ) ) ( not ( = ?auto_87148 ?auto_87151 ) ) ( not ( = ?auto_87148 ?auto_87152 ) ) ( not ( = ?auto_87148 ?auto_87153 ) ) ( not ( = ?auto_87148 ?auto_87154 ) ) ( not ( = ?auto_87149 ?auto_87150 ) ) ( not ( = ?auto_87149 ?auto_87151 ) ) ( not ( = ?auto_87149 ?auto_87152 ) ) ( not ( = ?auto_87149 ?auto_87153 ) ) ( not ( = ?auto_87149 ?auto_87154 ) ) ( not ( = ?auto_87150 ?auto_87151 ) ) ( not ( = ?auto_87150 ?auto_87152 ) ) ( not ( = ?auto_87150 ?auto_87153 ) ) ( not ( = ?auto_87150 ?auto_87154 ) ) ( not ( = ?auto_87151 ?auto_87152 ) ) ( not ( = ?auto_87151 ?auto_87153 ) ) ( not ( = ?auto_87151 ?auto_87154 ) ) ( not ( = ?auto_87152 ?auto_87153 ) ) ( not ( = ?auto_87152 ?auto_87154 ) ) ( not ( = ?auto_87153 ?auto_87154 ) ) ( ON ?auto_87148 ?auto_87155 ) ( not ( = ?auto_87148 ?auto_87155 ) ) ( not ( = ?auto_87149 ?auto_87155 ) ) ( not ( = ?auto_87150 ?auto_87155 ) ) ( not ( = ?auto_87151 ?auto_87155 ) ) ( not ( = ?auto_87152 ?auto_87155 ) ) ( not ( = ?auto_87153 ?auto_87155 ) ) ( not ( = ?auto_87154 ?auto_87155 ) ) ( ON ?auto_87149 ?auto_87148 ) ( ON-TABLE ?auto_87155 ) ( ON ?auto_87150 ?auto_87149 ) ( ON ?auto_87151 ?auto_87150 ) ( ON ?auto_87152 ?auto_87151 ) ( ON ?auto_87153 ?auto_87152 ) ( ON ?auto_87154 ?auto_87153 ) ( CLEAR ?auto_87154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_87155 ?auto_87148 ?auto_87149 ?auto_87150 ?auto_87151 ?auto_87152 ?auto_87153 )
      ( MAKE-7PILE ?auto_87148 ?auto_87149 ?auto_87150 ?auto_87151 ?auto_87152 ?auto_87153 ?auto_87154 ) )
  )

)

