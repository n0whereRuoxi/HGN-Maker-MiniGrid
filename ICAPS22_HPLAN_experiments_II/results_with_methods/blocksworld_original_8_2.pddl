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

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_141278 - BLOCK
      ?auto_141279 - BLOCK
      ?auto_141280 - BLOCK
      ?auto_141281 - BLOCK
      ?auto_141282 - BLOCK
      ?auto_141283 - BLOCK
      ?auto_141284 - BLOCK
      ?auto_141285 - BLOCK
    )
    :vars
    (
      ?auto_141286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141286 ?auto_141285 ) ( CLEAR ?auto_141286 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_141278 ) ( ON ?auto_141279 ?auto_141278 ) ( ON ?auto_141280 ?auto_141279 ) ( ON ?auto_141281 ?auto_141280 ) ( ON ?auto_141282 ?auto_141281 ) ( ON ?auto_141283 ?auto_141282 ) ( ON ?auto_141284 ?auto_141283 ) ( ON ?auto_141285 ?auto_141284 ) ( not ( = ?auto_141278 ?auto_141279 ) ) ( not ( = ?auto_141278 ?auto_141280 ) ) ( not ( = ?auto_141278 ?auto_141281 ) ) ( not ( = ?auto_141278 ?auto_141282 ) ) ( not ( = ?auto_141278 ?auto_141283 ) ) ( not ( = ?auto_141278 ?auto_141284 ) ) ( not ( = ?auto_141278 ?auto_141285 ) ) ( not ( = ?auto_141278 ?auto_141286 ) ) ( not ( = ?auto_141279 ?auto_141280 ) ) ( not ( = ?auto_141279 ?auto_141281 ) ) ( not ( = ?auto_141279 ?auto_141282 ) ) ( not ( = ?auto_141279 ?auto_141283 ) ) ( not ( = ?auto_141279 ?auto_141284 ) ) ( not ( = ?auto_141279 ?auto_141285 ) ) ( not ( = ?auto_141279 ?auto_141286 ) ) ( not ( = ?auto_141280 ?auto_141281 ) ) ( not ( = ?auto_141280 ?auto_141282 ) ) ( not ( = ?auto_141280 ?auto_141283 ) ) ( not ( = ?auto_141280 ?auto_141284 ) ) ( not ( = ?auto_141280 ?auto_141285 ) ) ( not ( = ?auto_141280 ?auto_141286 ) ) ( not ( = ?auto_141281 ?auto_141282 ) ) ( not ( = ?auto_141281 ?auto_141283 ) ) ( not ( = ?auto_141281 ?auto_141284 ) ) ( not ( = ?auto_141281 ?auto_141285 ) ) ( not ( = ?auto_141281 ?auto_141286 ) ) ( not ( = ?auto_141282 ?auto_141283 ) ) ( not ( = ?auto_141282 ?auto_141284 ) ) ( not ( = ?auto_141282 ?auto_141285 ) ) ( not ( = ?auto_141282 ?auto_141286 ) ) ( not ( = ?auto_141283 ?auto_141284 ) ) ( not ( = ?auto_141283 ?auto_141285 ) ) ( not ( = ?auto_141283 ?auto_141286 ) ) ( not ( = ?auto_141284 ?auto_141285 ) ) ( not ( = ?auto_141284 ?auto_141286 ) ) ( not ( = ?auto_141285 ?auto_141286 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_141286 ?auto_141285 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_141288 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_141288 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_141288 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_141289 - BLOCK
    )
    :vars
    (
      ?auto_141290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141289 ?auto_141290 ) ( CLEAR ?auto_141289 ) ( HAND-EMPTY ) ( not ( = ?auto_141289 ?auto_141290 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_141289 ?auto_141290 )
      ( MAKE-1PILE ?auto_141289 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_141298 - BLOCK
      ?auto_141299 - BLOCK
      ?auto_141300 - BLOCK
      ?auto_141301 - BLOCK
      ?auto_141302 - BLOCK
      ?auto_141303 - BLOCK
      ?auto_141304 - BLOCK
    )
    :vars
    (
      ?auto_141305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141305 ?auto_141304 ) ( CLEAR ?auto_141305 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_141298 ) ( ON ?auto_141299 ?auto_141298 ) ( ON ?auto_141300 ?auto_141299 ) ( ON ?auto_141301 ?auto_141300 ) ( ON ?auto_141302 ?auto_141301 ) ( ON ?auto_141303 ?auto_141302 ) ( ON ?auto_141304 ?auto_141303 ) ( not ( = ?auto_141298 ?auto_141299 ) ) ( not ( = ?auto_141298 ?auto_141300 ) ) ( not ( = ?auto_141298 ?auto_141301 ) ) ( not ( = ?auto_141298 ?auto_141302 ) ) ( not ( = ?auto_141298 ?auto_141303 ) ) ( not ( = ?auto_141298 ?auto_141304 ) ) ( not ( = ?auto_141298 ?auto_141305 ) ) ( not ( = ?auto_141299 ?auto_141300 ) ) ( not ( = ?auto_141299 ?auto_141301 ) ) ( not ( = ?auto_141299 ?auto_141302 ) ) ( not ( = ?auto_141299 ?auto_141303 ) ) ( not ( = ?auto_141299 ?auto_141304 ) ) ( not ( = ?auto_141299 ?auto_141305 ) ) ( not ( = ?auto_141300 ?auto_141301 ) ) ( not ( = ?auto_141300 ?auto_141302 ) ) ( not ( = ?auto_141300 ?auto_141303 ) ) ( not ( = ?auto_141300 ?auto_141304 ) ) ( not ( = ?auto_141300 ?auto_141305 ) ) ( not ( = ?auto_141301 ?auto_141302 ) ) ( not ( = ?auto_141301 ?auto_141303 ) ) ( not ( = ?auto_141301 ?auto_141304 ) ) ( not ( = ?auto_141301 ?auto_141305 ) ) ( not ( = ?auto_141302 ?auto_141303 ) ) ( not ( = ?auto_141302 ?auto_141304 ) ) ( not ( = ?auto_141302 ?auto_141305 ) ) ( not ( = ?auto_141303 ?auto_141304 ) ) ( not ( = ?auto_141303 ?auto_141305 ) ) ( not ( = ?auto_141304 ?auto_141305 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_141305 ?auto_141304 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_141306 - BLOCK
      ?auto_141307 - BLOCK
      ?auto_141308 - BLOCK
      ?auto_141309 - BLOCK
      ?auto_141310 - BLOCK
      ?auto_141311 - BLOCK
      ?auto_141312 - BLOCK
    )
    :vars
    (
      ?auto_141313 - BLOCK
      ?auto_141314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141313 ?auto_141312 ) ( CLEAR ?auto_141313 ) ( ON-TABLE ?auto_141306 ) ( ON ?auto_141307 ?auto_141306 ) ( ON ?auto_141308 ?auto_141307 ) ( ON ?auto_141309 ?auto_141308 ) ( ON ?auto_141310 ?auto_141309 ) ( ON ?auto_141311 ?auto_141310 ) ( ON ?auto_141312 ?auto_141311 ) ( not ( = ?auto_141306 ?auto_141307 ) ) ( not ( = ?auto_141306 ?auto_141308 ) ) ( not ( = ?auto_141306 ?auto_141309 ) ) ( not ( = ?auto_141306 ?auto_141310 ) ) ( not ( = ?auto_141306 ?auto_141311 ) ) ( not ( = ?auto_141306 ?auto_141312 ) ) ( not ( = ?auto_141306 ?auto_141313 ) ) ( not ( = ?auto_141307 ?auto_141308 ) ) ( not ( = ?auto_141307 ?auto_141309 ) ) ( not ( = ?auto_141307 ?auto_141310 ) ) ( not ( = ?auto_141307 ?auto_141311 ) ) ( not ( = ?auto_141307 ?auto_141312 ) ) ( not ( = ?auto_141307 ?auto_141313 ) ) ( not ( = ?auto_141308 ?auto_141309 ) ) ( not ( = ?auto_141308 ?auto_141310 ) ) ( not ( = ?auto_141308 ?auto_141311 ) ) ( not ( = ?auto_141308 ?auto_141312 ) ) ( not ( = ?auto_141308 ?auto_141313 ) ) ( not ( = ?auto_141309 ?auto_141310 ) ) ( not ( = ?auto_141309 ?auto_141311 ) ) ( not ( = ?auto_141309 ?auto_141312 ) ) ( not ( = ?auto_141309 ?auto_141313 ) ) ( not ( = ?auto_141310 ?auto_141311 ) ) ( not ( = ?auto_141310 ?auto_141312 ) ) ( not ( = ?auto_141310 ?auto_141313 ) ) ( not ( = ?auto_141311 ?auto_141312 ) ) ( not ( = ?auto_141311 ?auto_141313 ) ) ( not ( = ?auto_141312 ?auto_141313 ) ) ( HOLDING ?auto_141314 ) ( not ( = ?auto_141306 ?auto_141314 ) ) ( not ( = ?auto_141307 ?auto_141314 ) ) ( not ( = ?auto_141308 ?auto_141314 ) ) ( not ( = ?auto_141309 ?auto_141314 ) ) ( not ( = ?auto_141310 ?auto_141314 ) ) ( not ( = ?auto_141311 ?auto_141314 ) ) ( not ( = ?auto_141312 ?auto_141314 ) ) ( not ( = ?auto_141313 ?auto_141314 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_141314 )
      ( MAKE-7PILE ?auto_141306 ?auto_141307 ?auto_141308 ?auto_141309 ?auto_141310 ?auto_141311 ?auto_141312 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_141315 - BLOCK
      ?auto_141316 - BLOCK
      ?auto_141317 - BLOCK
      ?auto_141318 - BLOCK
      ?auto_141319 - BLOCK
      ?auto_141320 - BLOCK
      ?auto_141321 - BLOCK
    )
    :vars
    (
      ?auto_141323 - BLOCK
      ?auto_141322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141323 ?auto_141321 ) ( ON-TABLE ?auto_141315 ) ( ON ?auto_141316 ?auto_141315 ) ( ON ?auto_141317 ?auto_141316 ) ( ON ?auto_141318 ?auto_141317 ) ( ON ?auto_141319 ?auto_141318 ) ( ON ?auto_141320 ?auto_141319 ) ( ON ?auto_141321 ?auto_141320 ) ( not ( = ?auto_141315 ?auto_141316 ) ) ( not ( = ?auto_141315 ?auto_141317 ) ) ( not ( = ?auto_141315 ?auto_141318 ) ) ( not ( = ?auto_141315 ?auto_141319 ) ) ( not ( = ?auto_141315 ?auto_141320 ) ) ( not ( = ?auto_141315 ?auto_141321 ) ) ( not ( = ?auto_141315 ?auto_141323 ) ) ( not ( = ?auto_141316 ?auto_141317 ) ) ( not ( = ?auto_141316 ?auto_141318 ) ) ( not ( = ?auto_141316 ?auto_141319 ) ) ( not ( = ?auto_141316 ?auto_141320 ) ) ( not ( = ?auto_141316 ?auto_141321 ) ) ( not ( = ?auto_141316 ?auto_141323 ) ) ( not ( = ?auto_141317 ?auto_141318 ) ) ( not ( = ?auto_141317 ?auto_141319 ) ) ( not ( = ?auto_141317 ?auto_141320 ) ) ( not ( = ?auto_141317 ?auto_141321 ) ) ( not ( = ?auto_141317 ?auto_141323 ) ) ( not ( = ?auto_141318 ?auto_141319 ) ) ( not ( = ?auto_141318 ?auto_141320 ) ) ( not ( = ?auto_141318 ?auto_141321 ) ) ( not ( = ?auto_141318 ?auto_141323 ) ) ( not ( = ?auto_141319 ?auto_141320 ) ) ( not ( = ?auto_141319 ?auto_141321 ) ) ( not ( = ?auto_141319 ?auto_141323 ) ) ( not ( = ?auto_141320 ?auto_141321 ) ) ( not ( = ?auto_141320 ?auto_141323 ) ) ( not ( = ?auto_141321 ?auto_141323 ) ) ( not ( = ?auto_141315 ?auto_141322 ) ) ( not ( = ?auto_141316 ?auto_141322 ) ) ( not ( = ?auto_141317 ?auto_141322 ) ) ( not ( = ?auto_141318 ?auto_141322 ) ) ( not ( = ?auto_141319 ?auto_141322 ) ) ( not ( = ?auto_141320 ?auto_141322 ) ) ( not ( = ?auto_141321 ?auto_141322 ) ) ( not ( = ?auto_141323 ?auto_141322 ) ) ( ON ?auto_141322 ?auto_141323 ) ( CLEAR ?auto_141322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_141315 ?auto_141316 ?auto_141317 ?auto_141318 ?auto_141319 ?auto_141320 ?auto_141321 ?auto_141323 )
      ( MAKE-7PILE ?auto_141315 ?auto_141316 ?auto_141317 ?auto_141318 ?auto_141319 ?auto_141320 ?auto_141321 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_141326 - BLOCK
      ?auto_141327 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_141327 ) ( CLEAR ?auto_141326 ) ( ON-TABLE ?auto_141326 ) ( not ( = ?auto_141326 ?auto_141327 ) ) )
    :subtasks
    ( ( !STACK ?auto_141327 ?auto_141326 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_141328 - BLOCK
      ?auto_141329 - BLOCK
    )
    :vars
    (
      ?auto_141330 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_141328 ) ( ON-TABLE ?auto_141328 ) ( not ( = ?auto_141328 ?auto_141329 ) ) ( ON ?auto_141329 ?auto_141330 ) ( CLEAR ?auto_141329 ) ( HAND-EMPTY ) ( not ( = ?auto_141328 ?auto_141330 ) ) ( not ( = ?auto_141329 ?auto_141330 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_141329 ?auto_141330 )
      ( MAKE-2PILE ?auto_141328 ?auto_141329 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_141331 - BLOCK
      ?auto_141332 - BLOCK
    )
    :vars
    (
      ?auto_141333 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141331 ?auto_141332 ) ) ( ON ?auto_141332 ?auto_141333 ) ( CLEAR ?auto_141332 ) ( not ( = ?auto_141331 ?auto_141333 ) ) ( not ( = ?auto_141332 ?auto_141333 ) ) ( HOLDING ?auto_141331 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_141331 )
      ( MAKE-2PILE ?auto_141331 ?auto_141332 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_141334 - BLOCK
      ?auto_141335 - BLOCK
    )
    :vars
    (
      ?auto_141336 - BLOCK
      ?auto_141342 - BLOCK
      ?auto_141339 - BLOCK
      ?auto_141340 - BLOCK
      ?auto_141341 - BLOCK
      ?auto_141338 - BLOCK
      ?auto_141337 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141334 ?auto_141335 ) ) ( ON ?auto_141335 ?auto_141336 ) ( not ( = ?auto_141334 ?auto_141336 ) ) ( not ( = ?auto_141335 ?auto_141336 ) ) ( ON ?auto_141334 ?auto_141335 ) ( CLEAR ?auto_141334 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_141342 ) ( ON ?auto_141339 ?auto_141342 ) ( ON ?auto_141340 ?auto_141339 ) ( ON ?auto_141341 ?auto_141340 ) ( ON ?auto_141338 ?auto_141341 ) ( ON ?auto_141337 ?auto_141338 ) ( ON ?auto_141336 ?auto_141337 ) ( not ( = ?auto_141342 ?auto_141339 ) ) ( not ( = ?auto_141342 ?auto_141340 ) ) ( not ( = ?auto_141342 ?auto_141341 ) ) ( not ( = ?auto_141342 ?auto_141338 ) ) ( not ( = ?auto_141342 ?auto_141337 ) ) ( not ( = ?auto_141342 ?auto_141336 ) ) ( not ( = ?auto_141342 ?auto_141335 ) ) ( not ( = ?auto_141342 ?auto_141334 ) ) ( not ( = ?auto_141339 ?auto_141340 ) ) ( not ( = ?auto_141339 ?auto_141341 ) ) ( not ( = ?auto_141339 ?auto_141338 ) ) ( not ( = ?auto_141339 ?auto_141337 ) ) ( not ( = ?auto_141339 ?auto_141336 ) ) ( not ( = ?auto_141339 ?auto_141335 ) ) ( not ( = ?auto_141339 ?auto_141334 ) ) ( not ( = ?auto_141340 ?auto_141341 ) ) ( not ( = ?auto_141340 ?auto_141338 ) ) ( not ( = ?auto_141340 ?auto_141337 ) ) ( not ( = ?auto_141340 ?auto_141336 ) ) ( not ( = ?auto_141340 ?auto_141335 ) ) ( not ( = ?auto_141340 ?auto_141334 ) ) ( not ( = ?auto_141341 ?auto_141338 ) ) ( not ( = ?auto_141341 ?auto_141337 ) ) ( not ( = ?auto_141341 ?auto_141336 ) ) ( not ( = ?auto_141341 ?auto_141335 ) ) ( not ( = ?auto_141341 ?auto_141334 ) ) ( not ( = ?auto_141338 ?auto_141337 ) ) ( not ( = ?auto_141338 ?auto_141336 ) ) ( not ( = ?auto_141338 ?auto_141335 ) ) ( not ( = ?auto_141338 ?auto_141334 ) ) ( not ( = ?auto_141337 ?auto_141336 ) ) ( not ( = ?auto_141337 ?auto_141335 ) ) ( not ( = ?auto_141337 ?auto_141334 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_141342 ?auto_141339 ?auto_141340 ?auto_141341 ?auto_141338 ?auto_141337 ?auto_141336 ?auto_141335 )
      ( MAKE-2PILE ?auto_141334 ?auto_141335 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_141349 - BLOCK
      ?auto_141350 - BLOCK
      ?auto_141351 - BLOCK
      ?auto_141352 - BLOCK
      ?auto_141353 - BLOCK
      ?auto_141354 - BLOCK
    )
    :vars
    (
      ?auto_141355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141355 ?auto_141354 ) ( CLEAR ?auto_141355 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_141349 ) ( ON ?auto_141350 ?auto_141349 ) ( ON ?auto_141351 ?auto_141350 ) ( ON ?auto_141352 ?auto_141351 ) ( ON ?auto_141353 ?auto_141352 ) ( ON ?auto_141354 ?auto_141353 ) ( not ( = ?auto_141349 ?auto_141350 ) ) ( not ( = ?auto_141349 ?auto_141351 ) ) ( not ( = ?auto_141349 ?auto_141352 ) ) ( not ( = ?auto_141349 ?auto_141353 ) ) ( not ( = ?auto_141349 ?auto_141354 ) ) ( not ( = ?auto_141349 ?auto_141355 ) ) ( not ( = ?auto_141350 ?auto_141351 ) ) ( not ( = ?auto_141350 ?auto_141352 ) ) ( not ( = ?auto_141350 ?auto_141353 ) ) ( not ( = ?auto_141350 ?auto_141354 ) ) ( not ( = ?auto_141350 ?auto_141355 ) ) ( not ( = ?auto_141351 ?auto_141352 ) ) ( not ( = ?auto_141351 ?auto_141353 ) ) ( not ( = ?auto_141351 ?auto_141354 ) ) ( not ( = ?auto_141351 ?auto_141355 ) ) ( not ( = ?auto_141352 ?auto_141353 ) ) ( not ( = ?auto_141352 ?auto_141354 ) ) ( not ( = ?auto_141352 ?auto_141355 ) ) ( not ( = ?auto_141353 ?auto_141354 ) ) ( not ( = ?auto_141353 ?auto_141355 ) ) ( not ( = ?auto_141354 ?auto_141355 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_141355 ?auto_141354 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_141356 - BLOCK
      ?auto_141357 - BLOCK
      ?auto_141358 - BLOCK
      ?auto_141359 - BLOCK
      ?auto_141360 - BLOCK
      ?auto_141361 - BLOCK
    )
    :vars
    (
      ?auto_141362 - BLOCK
      ?auto_141363 - BLOCK
      ?auto_141364 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141362 ?auto_141361 ) ( CLEAR ?auto_141362 ) ( ON-TABLE ?auto_141356 ) ( ON ?auto_141357 ?auto_141356 ) ( ON ?auto_141358 ?auto_141357 ) ( ON ?auto_141359 ?auto_141358 ) ( ON ?auto_141360 ?auto_141359 ) ( ON ?auto_141361 ?auto_141360 ) ( not ( = ?auto_141356 ?auto_141357 ) ) ( not ( = ?auto_141356 ?auto_141358 ) ) ( not ( = ?auto_141356 ?auto_141359 ) ) ( not ( = ?auto_141356 ?auto_141360 ) ) ( not ( = ?auto_141356 ?auto_141361 ) ) ( not ( = ?auto_141356 ?auto_141362 ) ) ( not ( = ?auto_141357 ?auto_141358 ) ) ( not ( = ?auto_141357 ?auto_141359 ) ) ( not ( = ?auto_141357 ?auto_141360 ) ) ( not ( = ?auto_141357 ?auto_141361 ) ) ( not ( = ?auto_141357 ?auto_141362 ) ) ( not ( = ?auto_141358 ?auto_141359 ) ) ( not ( = ?auto_141358 ?auto_141360 ) ) ( not ( = ?auto_141358 ?auto_141361 ) ) ( not ( = ?auto_141358 ?auto_141362 ) ) ( not ( = ?auto_141359 ?auto_141360 ) ) ( not ( = ?auto_141359 ?auto_141361 ) ) ( not ( = ?auto_141359 ?auto_141362 ) ) ( not ( = ?auto_141360 ?auto_141361 ) ) ( not ( = ?auto_141360 ?auto_141362 ) ) ( not ( = ?auto_141361 ?auto_141362 ) ) ( HOLDING ?auto_141363 ) ( CLEAR ?auto_141364 ) ( not ( = ?auto_141356 ?auto_141363 ) ) ( not ( = ?auto_141356 ?auto_141364 ) ) ( not ( = ?auto_141357 ?auto_141363 ) ) ( not ( = ?auto_141357 ?auto_141364 ) ) ( not ( = ?auto_141358 ?auto_141363 ) ) ( not ( = ?auto_141358 ?auto_141364 ) ) ( not ( = ?auto_141359 ?auto_141363 ) ) ( not ( = ?auto_141359 ?auto_141364 ) ) ( not ( = ?auto_141360 ?auto_141363 ) ) ( not ( = ?auto_141360 ?auto_141364 ) ) ( not ( = ?auto_141361 ?auto_141363 ) ) ( not ( = ?auto_141361 ?auto_141364 ) ) ( not ( = ?auto_141362 ?auto_141363 ) ) ( not ( = ?auto_141362 ?auto_141364 ) ) ( not ( = ?auto_141363 ?auto_141364 ) ) )
    :subtasks
    ( ( !STACK ?auto_141363 ?auto_141364 )
      ( MAKE-6PILE ?auto_141356 ?auto_141357 ?auto_141358 ?auto_141359 ?auto_141360 ?auto_141361 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_141365 - BLOCK
      ?auto_141366 - BLOCK
      ?auto_141367 - BLOCK
      ?auto_141368 - BLOCK
      ?auto_141369 - BLOCK
      ?auto_141370 - BLOCK
    )
    :vars
    (
      ?auto_141371 - BLOCK
      ?auto_141372 - BLOCK
      ?auto_141373 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141371 ?auto_141370 ) ( ON-TABLE ?auto_141365 ) ( ON ?auto_141366 ?auto_141365 ) ( ON ?auto_141367 ?auto_141366 ) ( ON ?auto_141368 ?auto_141367 ) ( ON ?auto_141369 ?auto_141368 ) ( ON ?auto_141370 ?auto_141369 ) ( not ( = ?auto_141365 ?auto_141366 ) ) ( not ( = ?auto_141365 ?auto_141367 ) ) ( not ( = ?auto_141365 ?auto_141368 ) ) ( not ( = ?auto_141365 ?auto_141369 ) ) ( not ( = ?auto_141365 ?auto_141370 ) ) ( not ( = ?auto_141365 ?auto_141371 ) ) ( not ( = ?auto_141366 ?auto_141367 ) ) ( not ( = ?auto_141366 ?auto_141368 ) ) ( not ( = ?auto_141366 ?auto_141369 ) ) ( not ( = ?auto_141366 ?auto_141370 ) ) ( not ( = ?auto_141366 ?auto_141371 ) ) ( not ( = ?auto_141367 ?auto_141368 ) ) ( not ( = ?auto_141367 ?auto_141369 ) ) ( not ( = ?auto_141367 ?auto_141370 ) ) ( not ( = ?auto_141367 ?auto_141371 ) ) ( not ( = ?auto_141368 ?auto_141369 ) ) ( not ( = ?auto_141368 ?auto_141370 ) ) ( not ( = ?auto_141368 ?auto_141371 ) ) ( not ( = ?auto_141369 ?auto_141370 ) ) ( not ( = ?auto_141369 ?auto_141371 ) ) ( not ( = ?auto_141370 ?auto_141371 ) ) ( CLEAR ?auto_141372 ) ( not ( = ?auto_141365 ?auto_141373 ) ) ( not ( = ?auto_141365 ?auto_141372 ) ) ( not ( = ?auto_141366 ?auto_141373 ) ) ( not ( = ?auto_141366 ?auto_141372 ) ) ( not ( = ?auto_141367 ?auto_141373 ) ) ( not ( = ?auto_141367 ?auto_141372 ) ) ( not ( = ?auto_141368 ?auto_141373 ) ) ( not ( = ?auto_141368 ?auto_141372 ) ) ( not ( = ?auto_141369 ?auto_141373 ) ) ( not ( = ?auto_141369 ?auto_141372 ) ) ( not ( = ?auto_141370 ?auto_141373 ) ) ( not ( = ?auto_141370 ?auto_141372 ) ) ( not ( = ?auto_141371 ?auto_141373 ) ) ( not ( = ?auto_141371 ?auto_141372 ) ) ( not ( = ?auto_141373 ?auto_141372 ) ) ( ON ?auto_141373 ?auto_141371 ) ( CLEAR ?auto_141373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_141365 ?auto_141366 ?auto_141367 ?auto_141368 ?auto_141369 ?auto_141370 ?auto_141371 )
      ( MAKE-6PILE ?auto_141365 ?auto_141366 ?auto_141367 ?auto_141368 ?auto_141369 ?auto_141370 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_141374 - BLOCK
      ?auto_141375 - BLOCK
      ?auto_141376 - BLOCK
      ?auto_141377 - BLOCK
      ?auto_141378 - BLOCK
      ?auto_141379 - BLOCK
    )
    :vars
    (
      ?auto_141382 - BLOCK
      ?auto_141381 - BLOCK
      ?auto_141380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141382 ?auto_141379 ) ( ON-TABLE ?auto_141374 ) ( ON ?auto_141375 ?auto_141374 ) ( ON ?auto_141376 ?auto_141375 ) ( ON ?auto_141377 ?auto_141376 ) ( ON ?auto_141378 ?auto_141377 ) ( ON ?auto_141379 ?auto_141378 ) ( not ( = ?auto_141374 ?auto_141375 ) ) ( not ( = ?auto_141374 ?auto_141376 ) ) ( not ( = ?auto_141374 ?auto_141377 ) ) ( not ( = ?auto_141374 ?auto_141378 ) ) ( not ( = ?auto_141374 ?auto_141379 ) ) ( not ( = ?auto_141374 ?auto_141382 ) ) ( not ( = ?auto_141375 ?auto_141376 ) ) ( not ( = ?auto_141375 ?auto_141377 ) ) ( not ( = ?auto_141375 ?auto_141378 ) ) ( not ( = ?auto_141375 ?auto_141379 ) ) ( not ( = ?auto_141375 ?auto_141382 ) ) ( not ( = ?auto_141376 ?auto_141377 ) ) ( not ( = ?auto_141376 ?auto_141378 ) ) ( not ( = ?auto_141376 ?auto_141379 ) ) ( not ( = ?auto_141376 ?auto_141382 ) ) ( not ( = ?auto_141377 ?auto_141378 ) ) ( not ( = ?auto_141377 ?auto_141379 ) ) ( not ( = ?auto_141377 ?auto_141382 ) ) ( not ( = ?auto_141378 ?auto_141379 ) ) ( not ( = ?auto_141378 ?auto_141382 ) ) ( not ( = ?auto_141379 ?auto_141382 ) ) ( not ( = ?auto_141374 ?auto_141381 ) ) ( not ( = ?auto_141374 ?auto_141380 ) ) ( not ( = ?auto_141375 ?auto_141381 ) ) ( not ( = ?auto_141375 ?auto_141380 ) ) ( not ( = ?auto_141376 ?auto_141381 ) ) ( not ( = ?auto_141376 ?auto_141380 ) ) ( not ( = ?auto_141377 ?auto_141381 ) ) ( not ( = ?auto_141377 ?auto_141380 ) ) ( not ( = ?auto_141378 ?auto_141381 ) ) ( not ( = ?auto_141378 ?auto_141380 ) ) ( not ( = ?auto_141379 ?auto_141381 ) ) ( not ( = ?auto_141379 ?auto_141380 ) ) ( not ( = ?auto_141382 ?auto_141381 ) ) ( not ( = ?auto_141382 ?auto_141380 ) ) ( not ( = ?auto_141381 ?auto_141380 ) ) ( ON ?auto_141381 ?auto_141382 ) ( CLEAR ?auto_141381 ) ( HOLDING ?auto_141380 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_141380 )
      ( MAKE-6PILE ?auto_141374 ?auto_141375 ?auto_141376 ?auto_141377 ?auto_141378 ?auto_141379 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_141383 - BLOCK
      ?auto_141384 - BLOCK
      ?auto_141385 - BLOCK
      ?auto_141386 - BLOCK
      ?auto_141387 - BLOCK
      ?auto_141388 - BLOCK
    )
    :vars
    (
      ?auto_141389 - BLOCK
      ?auto_141391 - BLOCK
      ?auto_141390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141389 ?auto_141388 ) ( ON-TABLE ?auto_141383 ) ( ON ?auto_141384 ?auto_141383 ) ( ON ?auto_141385 ?auto_141384 ) ( ON ?auto_141386 ?auto_141385 ) ( ON ?auto_141387 ?auto_141386 ) ( ON ?auto_141388 ?auto_141387 ) ( not ( = ?auto_141383 ?auto_141384 ) ) ( not ( = ?auto_141383 ?auto_141385 ) ) ( not ( = ?auto_141383 ?auto_141386 ) ) ( not ( = ?auto_141383 ?auto_141387 ) ) ( not ( = ?auto_141383 ?auto_141388 ) ) ( not ( = ?auto_141383 ?auto_141389 ) ) ( not ( = ?auto_141384 ?auto_141385 ) ) ( not ( = ?auto_141384 ?auto_141386 ) ) ( not ( = ?auto_141384 ?auto_141387 ) ) ( not ( = ?auto_141384 ?auto_141388 ) ) ( not ( = ?auto_141384 ?auto_141389 ) ) ( not ( = ?auto_141385 ?auto_141386 ) ) ( not ( = ?auto_141385 ?auto_141387 ) ) ( not ( = ?auto_141385 ?auto_141388 ) ) ( not ( = ?auto_141385 ?auto_141389 ) ) ( not ( = ?auto_141386 ?auto_141387 ) ) ( not ( = ?auto_141386 ?auto_141388 ) ) ( not ( = ?auto_141386 ?auto_141389 ) ) ( not ( = ?auto_141387 ?auto_141388 ) ) ( not ( = ?auto_141387 ?auto_141389 ) ) ( not ( = ?auto_141388 ?auto_141389 ) ) ( not ( = ?auto_141383 ?auto_141391 ) ) ( not ( = ?auto_141383 ?auto_141390 ) ) ( not ( = ?auto_141384 ?auto_141391 ) ) ( not ( = ?auto_141384 ?auto_141390 ) ) ( not ( = ?auto_141385 ?auto_141391 ) ) ( not ( = ?auto_141385 ?auto_141390 ) ) ( not ( = ?auto_141386 ?auto_141391 ) ) ( not ( = ?auto_141386 ?auto_141390 ) ) ( not ( = ?auto_141387 ?auto_141391 ) ) ( not ( = ?auto_141387 ?auto_141390 ) ) ( not ( = ?auto_141388 ?auto_141391 ) ) ( not ( = ?auto_141388 ?auto_141390 ) ) ( not ( = ?auto_141389 ?auto_141391 ) ) ( not ( = ?auto_141389 ?auto_141390 ) ) ( not ( = ?auto_141391 ?auto_141390 ) ) ( ON ?auto_141391 ?auto_141389 ) ( ON ?auto_141390 ?auto_141391 ) ( CLEAR ?auto_141390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_141383 ?auto_141384 ?auto_141385 ?auto_141386 ?auto_141387 ?auto_141388 ?auto_141389 ?auto_141391 )
      ( MAKE-6PILE ?auto_141383 ?auto_141384 ?auto_141385 ?auto_141386 ?auto_141387 ?auto_141388 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141395 - BLOCK
      ?auto_141396 - BLOCK
      ?auto_141397 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_141397 ) ( CLEAR ?auto_141396 ) ( ON-TABLE ?auto_141395 ) ( ON ?auto_141396 ?auto_141395 ) ( not ( = ?auto_141395 ?auto_141396 ) ) ( not ( = ?auto_141395 ?auto_141397 ) ) ( not ( = ?auto_141396 ?auto_141397 ) ) )
    :subtasks
    ( ( !STACK ?auto_141397 ?auto_141396 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141398 - BLOCK
      ?auto_141399 - BLOCK
      ?auto_141400 - BLOCK
    )
    :vars
    (
      ?auto_141401 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_141399 ) ( ON-TABLE ?auto_141398 ) ( ON ?auto_141399 ?auto_141398 ) ( not ( = ?auto_141398 ?auto_141399 ) ) ( not ( = ?auto_141398 ?auto_141400 ) ) ( not ( = ?auto_141399 ?auto_141400 ) ) ( ON ?auto_141400 ?auto_141401 ) ( CLEAR ?auto_141400 ) ( HAND-EMPTY ) ( not ( = ?auto_141398 ?auto_141401 ) ) ( not ( = ?auto_141399 ?auto_141401 ) ) ( not ( = ?auto_141400 ?auto_141401 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_141400 ?auto_141401 )
      ( MAKE-3PILE ?auto_141398 ?auto_141399 ?auto_141400 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141402 - BLOCK
      ?auto_141403 - BLOCK
      ?auto_141404 - BLOCK
    )
    :vars
    (
      ?auto_141405 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141402 ) ( not ( = ?auto_141402 ?auto_141403 ) ) ( not ( = ?auto_141402 ?auto_141404 ) ) ( not ( = ?auto_141403 ?auto_141404 ) ) ( ON ?auto_141404 ?auto_141405 ) ( CLEAR ?auto_141404 ) ( not ( = ?auto_141402 ?auto_141405 ) ) ( not ( = ?auto_141403 ?auto_141405 ) ) ( not ( = ?auto_141404 ?auto_141405 ) ) ( HOLDING ?auto_141403 ) ( CLEAR ?auto_141402 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_141402 ?auto_141403 )
      ( MAKE-3PILE ?auto_141402 ?auto_141403 ?auto_141404 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141406 - BLOCK
      ?auto_141407 - BLOCK
      ?auto_141408 - BLOCK
    )
    :vars
    (
      ?auto_141409 - BLOCK
      ?auto_141414 - BLOCK
      ?auto_141412 - BLOCK
      ?auto_141413 - BLOCK
      ?auto_141410 - BLOCK
      ?auto_141411 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141406 ) ( not ( = ?auto_141406 ?auto_141407 ) ) ( not ( = ?auto_141406 ?auto_141408 ) ) ( not ( = ?auto_141407 ?auto_141408 ) ) ( ON ?auto_141408 ?auto_141409 ) ( not ( = ?auto_141406 ?auto_141409 ) ) ( not ( = ?auto_141407 ?auto_141409 ) ) ( not ( = ?auto_141408 ?auto_141409 ) ) ( CLEAR ?auto_141406 ) ( ON ?auto_141407 ?auto_141408 ) ( CLEAR ?auto_141407 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_141414 ) ( ON ?auto_141412 ?auto_141414 ) ( ON ?auto_141413 ?auto_141412 ) ( ON ?auto_141410 ?auto_141413 ) ( ON ?auto_141411 ?auto_141410 ) ( ON ?auto_141409 ?auto_141411 ) ( not ( = ?auto_141414 ?auto_141412 ) ) ( not ( = ?auto_141414 ?auto_141413 ) ) ( not ( = ?auto_141414 ?auto_141410 ) ) ( not ( = ?auto_141414 ?auto_141411 ) ) ( not ( = ?auto_141414 ?auto_141409 ) ) ( not ( = ?auto_141414 ?auto_141408 ) ) ( not ( = ?auto_141414 ?auto_141407 ) ) ( not ( = ?auto_141412 ?auto_141413 ) ) ( not ( = ?auto_141412 ?auto_141410 ) ) ( not ( = ?auto_141412 ?auto_141411 ) ) ( not ( = ?auto_141412 ?auto_141409 ) ) ( not ( = ?auto_141412 ?auto_141408 ) ) ( not ( = ?auto_141412 ?auto_141407 ) ) ( not ( = ?auto_141413 ?auto_141410 ) ) ( not ( = ?auto_141413 ?auto_141411 ) ) ( not ( = ?auto_141413 ?auto_141409 ) ) ( not ( = ?auto_141413 ?auto_141408 ) ) ( not ( = ?auto_141413 ?auto_141407 ) ) ( not ( = ?auto_141410 ?auto_141411 ) ) ( not ( = ?auto_141410 ?auto_141409 ) ) ( not ( = ?auto_141410 ?auto_141408 ) ) ( not ( = ?auto_141410 ?auto_141407 ) ) ( not ( = ?auto_141411 ?auto_141409 ) ) ( not ( = ?auto_141411 ?auto_141408 ) ) ( not ( = ?auto_141411 ?auto_141407 ) ) ( not ( = ?auto_141406 ?auto_141414 ) ) ( not ( = ?auto_141406 ?auto_141412 ) ) ( not ( = ?auto_141406 ?auto_141413 ) ) ( not ( = ?auto_141406 ?auto_141410 ) ) ( not ( = ?auto_141406 ?auto_141411 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_141414 ?auto_141412 ?auto_141413 ?auto_141410 ?auto_141411 ?auto_141409 ?auto_141408 )
      ( MAKE-3PILE ?auto_141406 ?auto_141407 ?auto_141408 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141415 - BLOCK
      ?auto_141416 - BLOCK
      ?auto_141417 - BLOCK
    )
    :vars
    (
      ?auto_141423 - BLOCK
      ?auto_141419 - BLOCK
      ?auto_141418 - BLOCK
      ?auto_141420 - BLOCK
      ?auto_141421 - BLOCK
      ?auto_141422 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141415 ?auto_141416 ) ) ( not ( = ?auto_141415 ?auto_141417 ) ) ( not ( = ?auto_141416 ?auto_141417 ) ) ( ON ?auto_141417 ?auto_141423 ) ( not ( = ?auto_141415 ?auto_141423 ) ) ( not ( = ?auto_141416 ?auto_141423 ) ) ( not ( = ?auto_141417 ?auto_141423 ) ) ( ON ?auto_141416 ?auto_141417 ) ( CLEAR ?auto_141416 ) ( ON-TABLE ?auto_141419 ) ( ON ?auto_141418 ?auto_141419 ) ( ON ?auto_141420 ?auto_141418 ) ( ON ?auto_141421 ?auto_141420 ) ( ON ?auto_141422 ?auto_141421 ) ( ON ?auto_141423 ?auto_141422 ) ( not ( = ?auto_141419 ?auto_141418 ) ) ( not ( = ?auto_141419 ?auto_141420 ) ) ( not ( = ?auto_141419 ?auto_141421 ) ) ( not ( = ?auto_141419 ?auto_141422 ) ) ( not ( = ?auto_141419 ?auto_141423 ) ) ( not ( = ?auto_141419 ?auto_141417 ) ) ( not ( = ?auto_141419 ?auto_141416 ) ) ( not ( = ?auto_141418 ?auto_141420 ) ) ( not ( = ?auto_141418 ?auto_141421 ) ) ( not ( = ?auto_141418 ?auto_141422 ) ) ( not ( = ?auto_141418 ?auto_141423 ) ) ( not ( = ?auto_141418 ?auto_141417 ) ) ( not ( = ?auto_141418 ?auto_141416 ) ) ( not ( = ?auto_141420 ?auto_141421 ) ) ( not ( = ?auto_141420 ?auto_141422 ) ) ( not ( = ?auto_141420 ?auto_141423 ) ) ( not ( = ?auto_141420 ?auto_141417 ) ) ( not ( = ?auto_141420 ?auto_141416 ) ) ( not ( = ?auto_141421 ?auto_141422 ) ) ( not ( = ?auto_141421 ?auto_141423 ) ) ( not ( = ?auto_141421 ?auto_141417 ) ) ( not ( = ?auto_141421 ?auto_141416 ) ) ( not ( = ?auto_141422 ?auto_141423 ) ) ( not ( = ?auto_141422 ?auto_141417 ) ) ( not ( = ?auto_141422 ?auto_141416 ) ) ( not ( = ?auto_141415 ?auto_141419 ) ) ( not ( = ?auto_141415 ?auto_141418 ) ) ( not ( = ?auto_141415 ?auto_141420 ) ) ( not ( = ?auto_141415 ?auto_141421 ) ) ( not ( = ?auto_141415 ?auto_141422 ) ) ( HOLDING ?auto_141415 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_141415 )
      ( MAKE-3PILE ?auto_141415 ?auto_141416 ?auto_141417 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141424 - BLOCK
      ?auto_141425 - BLOCK
      ?auto_141426 - BLOCK
    )
    :vars
    (
      ?auto_141427 - BLOCK
      ?auto_141432 - BLOCK
      ?auto_141428 - BLOCK
      ?auto_141430 - BLOCK
      ?auto_141431 - BLOCK
      ?auto_141429 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141424 ?auto_141425 ) ) ( not ( = ?auto_141424 ?auto_141426 ) ) ( not ( = ?auto_141425 ?auto_141426 ) ) ( ON ?auto_141426 ?auto_141427 ) ( not ( = ?auto_141424 ?auto_141427 ) ) ( not ( = ?auto_141425 ?auto_141427 ) ) ( not ( = ?auto_141426 ?auto_141427 ) ) ( ON ?auto_141425 ?auto_141426 ) ( ON-TABLE ?auto_141432 ) ( ON ?auto_141428 ?auto_141432 ) ( ON ?auto_141430 ?auto_141428 ) ( ON ?auto_141431 ?auto_141430 ) ( ON ?auto_141429 ?auto_141431 ) ( ON ?auto_141427 ?auto_141429 ) ( not ( = ?auto_141432 ?auto_141428 ) ) ( not ( = ?auto_141432 ?auto_141430 ) ) ( not ( = ?auto_141432 ?auto_141431 ) ) ( not ( = ?auto_141432 ?auto_141429 ) ) ( not ( = ?auto_141432 ?auto_141427 ) ) ( not ( = ?auto_141432 ?auto_141426 ) ) ( not ( = ?auto_141432 ?auto_141425 ) ) ( not ( = ?auto_141428 ?auto_141430 ) ) ( not ( = ?auto_141428 ?auto_141431 ) ) ( not ( = ?auto_141428 ?auto_141429 ) ) ( not ( = ?auto_141428 ?auto_141427 ) ) ( not ( = ?auto_141428 ?auto_141426 ) ) ( not ( = ?auto_141428 ?auto_141425 ) ) ( not ( = ?auto_141430 ?auto_141431 ) ) ( not ( = ?auto_141430 ?auto_141429 ) ) ( not ( = ?auto_141430 ?auto_141427 ) ) ( not ( = ?auto_141430 ?auto_141426 ) ) ( not ( = ?auto_141430 ?auto_141425 ) ) ( not ( = ?auto_141431 ?auto_141429 ) ) ( not ( = ?auto_141431 ?auto_141427 ) ) ( not ( = ?auto_141431 ?auto_141426 ) ) ( not ( = ?auto_141431 ?auto_141425 ) ) ( not ( = ?auto_141429 ?auto_141427 ) ) ( not ( = ?auto_141429 ?auto_141426 ) ) ( not ( = ?auto_141429 ?auto_141425 ) ) ( not ( = ?auto_141424 ?auto_141432 ) ) ( not ( = ?auto_141424 ?auto_141428 ) ) ( not ( = ?auto_141424 ?auto_141430 ) ) ( not ( = ?auto_141424 ?auto_141431 ) ) ( not ( = ?auto_141424 ?auto_141429 ) ) ( ON ?auto_141424 ?auto_141425 ) ( CLEAR ?auto_141424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_141432 ?auto_141428 ?auto_141430 ?auto_141431 ?auto_141429 ?auto_141427 ?auto_141426 ?auto_141425 )
      ( MAKE-3PILE ?auto_141424 ?auto_141425 ?auto_141426 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141438 - BLOCK
      ?auto_141439 - BLOCK
      ?auto_141440 - BLOCK
      ?auto_141441 - BLOCK
      ?auto_141442 - BLOCK
    )
    :vars
    (
      ?auto_141443 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141443 ?auto_141442 ) ( CLEAR ?auto_141443 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_141438 ) ( ON ?auto_141439 ?auto_141438 ) ( ON ?auto_141440 ?auto_141439 ) ( ON ?auto_141441 ?auto_141440 ) ( ON ?auto_141442 ?auto_141441 ) ( not ( = ?auto_141438 ?auto_141439 ) ) ( not ( = ?auto_141438 ?auto_141440 ) ) ( not ( = ?auto_141438 ?auto_141441 ) ) ( not ( = ?auto_141438 ?auto_141442 ) ) ( not ( = ?auto_141438 ?auto_141443 ) ) ( not ( = ?auto_141439 ?auto_141440 ) ) ( not ( = ?auto_141439 ?auto_141441 ) ) ( not ( = ?auto_141439 ?auto_141442 ) ) ( not ( = ?auto_141439 ?auto_141443 ) ) ( not ( = ?auto_141440 ?auto_141441 ) ) ( not ( = ?auto_141440 ?auto_141442 ) ) ( not ( = ?auto_141440 ?auto_141443 ) ) ( not ( = ?auto_141441 ?auto_141442 ) ) ( not ( = ?auto_141441 ?auto_141443 ) ) ( not ( = ?auto_141442 ?auto_141443 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_141443 ?auto_141442 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141444 - BLOCK
      ?auto_141445 - BLOCK
      ?auto_141446 - BLOCK
      ?auto_141447 - BLOCK
      ?auto_141448 - BLOCK
    )
    :vars
    (
      ?auto_141449 - BLOCK
      ?auto_141450 - BLOCK
      ?auto_141451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141449 ?auto_141448 ) ( CLEAR ?auto_141449 ) ( ON-TABLE ?auto_141444 ) ( ON ?auto_141445 ?auto_141444 ) ( ON ?auto_141446 ?auto_141445 ) ( ON ?auto_141447 ?auto_141446 ) ( ON ?auto_141448 ?auto_141447 ) ( not ( = ?auto_141444 ?auto_141445 ) ) ( not ( = ?auto_141444 ?auto_141446 ) ) ( not ( = ?auto_141444 ?auto_141447 ) ) ( not ( = ?auto_141444 ?auto_141448 ) ) ( not ( = ?auto_141444 ?auto_141449 ) ) ( not ( = ?auto_141445 ?auto_141446 ) ) ( not ( = ?auto_141445 ?auto_141447 ) ) ( not ( = ?auto_141445 ?auto_141448 ) ) ( not ( = ?auto_141445 ?auto_141449 ) ) ( not ( = ?auto_141446 ?auto_141447 ) ) ( not ( = ?auto_141446 ?auto_141448 ) ) ( not ( = ?auto_141446 ?auto_141449 ) ) ( not ( = ?auto_141447 ?auto_141448 ) ) ( not ( = ?auto_141447 ?auto_141449 ) ) ( not ( = ?auto_141448 ?auto_141449 ) ) ( HOLDING ?auto_141450 ) ( CLEAR ?auto_141451 ) ( not ( = ?auto_141444 ?auto_141450 ) ) ( not ( = ?auto_141444 ?auto_141451 ) ) ( not ( = ?auto_141445 ?auto_141450 ) ) ( not ( = ?auto_141445 ?auto_141451 ) ) ( not ( = ?auto_141446 ?auto_141450 ) ) ( not ( = ?auto_141446 ?auto_141451 ) ) ( not ( = ?auto_141447 ?auto_141450 ) ) ( not ( = ?auto_141447 ?auto_141451 ) ) ( not ( = ?auto_141448 ?auto_141450 ) ) ( not ( = ?auto_141448 ?auto_141451 ) ) ( not ( = ?auto_141449 ?auto_141450 ) ) ( not ( = ?auto_141449 ?auto_141451 ) ) ( not ( = ?auto_141450 ?auto_141451 ) ) )
    :subtasks
    ( ( !STACK ?auto_141450 ?auto_141451 )
      ( MAKE-5PILE ?auto_141444 ?auto_141445 ?auto_141446 ?auto_141447 ?auto_141448 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141452 - BLOCK
      ?auto_141453 - BLOCK
      ?auto_141454 - BLOCK
      ?auto_141455 - BLOCK
      ?auto_141456 - BLOCK
    )
    :vars
    (
      ?auto_141457 - BLOCK
      ?auto_141458 - BLOCK
      ?auto_141459 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141457 ?auto_141456 ) ( ON-TABLE ?auto_141452 ) ( ON ?auto_141453 ?auto_141452 ) ( ON ?auto_141454 ?auto_141453 ) ( ON ?auto_141455 ?auto_141454 ) ( ON ?auto_141456 ?auto_141455 ) ( not ( = ?auto_141452 ?auto_141453 ) ) ( not ( = ?auto_141452 ?auto_141454 ) ) ( not ( = ?auto_141452 ?auto_141455 ) ) ( not ( = ?auto_141452 ?auto_141456 ) ) ( not ( = ?auto_141452 ?auto_141457 ) ) ( not ( = ?auto_141453 ?auto_141454 ) ) ( not ( = ?auto_141453 ?auto_141455 ) ) ( not ( = ?auto_141453 ?auto_141456 ) ) ( not ( = ?auto_141453 ?auto_141457 ) ) ( not ( = ?auto_141454 ?auto_141455 ) ) ( not ( = ?auto_141454 ?auto_141456 ) ) ( not ( = ?auto_141454 ?auto_141457 ) ) ( not ( = ?auto_141455 ?auto_141456 ) ) ( not ( = ?auto_141455 ?auto_141457 ) ) ( not ( = ?auto_141456 ?auto_141457 ) ) ( CLEAR ?auto_141458 ) ( not ( = ?auto_141452 ?auto_141459 ) ) ( not ( = ?auto_141452 ?auto_141458 ) ) ( not ( = ?auto_141453 ?auto_141459 ) ) ( not ( = ?auto_141453 ?auto_141458 ) ) ( not ( = ?auto_141454 ?auto_141459 ) ) ( not ( = ?auto_141454 ?auto_141458 ) ) ( not ( = ?auto_141455 ?auto_141459 ) ) ( not ( = ?auto_141455 ?auto_141458 ) ) ( not ( = ?auto_141456 ?auto_141459 ) ) ( not ( = ?auto_141456 ?auto_141458 ) ) ( not ( = ?auto_141457 ?auto_141459 ) ) ( not ( = ?auto_141457 ?auto_141458 ) ) ( not ( = ?auto_141459 ?auto_141458 ) ) ( ON ?auto_141459 ?auto_141457 ) ( CLEAR ?auto_141459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_141452 ?auto_141453 ?auto_141454 ?auto_141455 ?auto_141456 ?auto_141457 )
      ( MAKE-5PILE ?auto_141452 ?auto_141453 ?auto_141454 ?auto_141455 ?auto_141456 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141460 - BLOCK
      ?auto_141461 - BLOCK
      ?auto_141462 - BLOCK
      ?auto_141463 - BLOCK
      ?auto_141464 - BLOCK
    )
    :vars
    (
      ?auto_141467 - BLOCK
      ?auto_141465 - BLOCK
      ?auto_141466 - BLOCK
      ?auto_141468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141467 ?auto_141464 ) ( ON-TABLE ?auto_141460 ) ( ON ?auto_141461 ?auto_141460 ) ( ON ?auto_141462 ?auto_141461 ) ( ON ?auto_141463 ?auto_141462 ) ( ON ?auto_141464 ?auto_141463 ) ( not ( = ?auto_141460 ?auto_141461 ) ) ( not ( = ?auto_141460 ?auto_141462 ) ) ( not ( = ?auto_141460 ?auto_141463 ) ) ( not ( = ?auto_141460 ?auto_141464 ) ) ( not ( = ?auto_141460 ?auto_141467 ) ) ( not ( = ?auto_141461 ?auto_141462 ) ) ( not ( = ?auto_141461 ?auto_141463 ) ) ( not ( = ?auto_141461 ?auto_141464 ) ) ( not ( = ?auto_141461 ?auto_141467 ) ) ( not ( = ?auto_141462 ?auto_141463 ) ) ( not ( = ?auto_141462 ?auto_141464 ) ) ( not ( = ?auto_141462 ?auto_141467 ) ) ( not ( = ?auto_141463 ?auto_141464 ) ) ( not ( = ?auto_141463 ?auto_141467 ) ) ( not ( = ?auto_141464 ?auto_141467 ) ) ( not ( = ?auto_141460 ?auto_141465 ) ) ( not ( = ?auto_141460 ?auto_141466 ) ) ( not ( = ?auto_141461 ?auto_141465 ) ) ( not ( = ?auto_141461 ?auto_141466 ) ) ( not ( = ?auto_141462 ?auto_141465 ) ) ( not ( = ?auto_141462 ?auto_141466 ) ) ( not ( = ?auto_141463 ?auto_141465 ) ) ( not ( = ?auto_141463 ?auto_141466 ) ) ( not ( = ?auto_141464 ?auto_141465 ) ) ( not ( = ?auto_141464 ?auto_141466 ) ) ( not ( = ?auto_141467 ?auto_141465 ) ) ( not ( = ?auto_141467 ?auto_141466 ) ) ( not ( = ?auto_141465 ?auto_141466 ) ) ( ON ?auto_141465 ?auto_141467 ) ( CLEAR ?auto_141465 ) ( HOLDING ?auto_141466 ) ( CLEAR ?auto_141468 ) ( ON-TABLE ?auto_141468 ) ( not ( = ?auto_141468 ?auto_141466 ) ) ( not ( = ?auto_141460 ?auto_141468 ) ) ( not ( = ?auto_141461 ?auto_141468 ) ) ( not ( = ?auto_141462 ?auto_141468 ) ) ( not ( = ?auto_141463 ?auto_141468 ) ) ( not ( = ?auto_141464 ?auto_141468 ) ) ( not ( = ?auto_141467 ?auto_141468 ) ) ( not ( = ?auto_141465 ?auto_141468 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_141468 ?auto_141466 )
      ( MAKE-5PILE ?auto_141460 ?auto_141461 ?auto_141462 ?auto_141463 ?auto_141464 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141469 - BLOCK
      ?auto_141470 - BLOCK
      ?auto_141471 - BLOCK
      ?auto_141472 - BLOCK
      ?auto_141473 - BLOCK
    )
    :vars
    (
      ?auto_141474 - BLOCK
      ?auto_141476 - BLOCK
      ?auto_141477 - BLOCK
      ?auto_141475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141474 ?auto_141473 ) ( ON-TABLE ?auto_141469 ) ( ON ?auto_141470 ?auto_141469 ) ( ON ?auto_141471 ?auto_141470 ) ( ON ?auto_141472 ?auto_141471 ) ( ON ?auto_141473 ?auto_141472 ) ( not ( = ?auto_141469 ?auto_141470 ) ) ( not ( = ?auto_141469 ?auto_141471 ) ) ( not ( = ?auto_141469 ?auto_141472 ) ) ( not ( = ?auto_141469 ?auto_141473 ) ) ( not ( = ?auto_141469 ?auto_141474 ) ) ( not ( = ?auto_141470 ?auto_141471 ) ) ( not ( = ?auto_141470 ?auto_141472 ) ) ( not ( = ?auto_141470 ?auto_141473 ) ) ( not ( = ?auto_141470 ?auto_141474 ) ) ( not ( = ?auto_141471 ?auto_141472 ) ) ( not ( = ?auto_141471 ?auto_141473 ) ) ( not ( = ?auto_141471 ?auto_141474 ) ) ( not ( = ?auto_141472 ?auto_141473 ) ) ( not ( = ?auto_141472 ?auto_141474 ) ) ( not ( = ?auto_141473 ?auto_141474 ) ) ( not ( = ?auto_141469 ?auto_141476 ) ) ( not ( = ?auto_141469 ?auto_141477 ) ) ( not ( = ?auto_141470 ?auto_141476 ) ) ( not ( = ?auto_141470 ?auto_141477 ) ) ( not ( = ?auto_141471 ?auto_141476 ) ) ( not ( = ?auto_141471 ?auto_141477 ) ) ( not ( = ?auto_141472 ?auto_141476 ) ) ( not ( = ?auto_141472 ?auto_141477 ) ) ( not ( = ?auto_141473 ?auto_141476 ) ) ( not ( = ?auto_141473 ?auto_141477 ) ) ( not ( = ?auto_141474 ?auto_141476 ) ) ( not ( = ?auto_141474 ?auto_141477 ) ) ( not ( = ?auto_141476 ?auto_141477 ) ) ( ON ?auto_141476 ?auto_141474 ) ( CLEAR ?auto_141475 ) ( ON-TABLE ?auto_141475 ) ( not ( = ?auto_141475 ?auto_141477 ) ) ( not ( = ?auto_141469 ?auto_141475 ) ) ( not ( = ?auto_141470 ?auto_141475 ) ) ( not ( = ?auto_141471 ?auto_141475 ) ) ( not ( = ?auto_141472 ?auto_141475 ) ) ( not ( = ?auto_141473 ?auto_141475 ) ) ( not ( = ?auto_141474 ?auto_141475 ) ) ( not ( = ?auto_141476 ?auto_141475 ) ) ( ON ?auto_141477 ?auto_141476 ) ( CLEAR ?auto_141477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_141469 ?auto_141470 ?auto_141471 ?auto_141472 ?auto_141473 ?auto_141474 ?auto_141476 )
      ( MAKE-5PILE ?auto_141469 ?auto_141470 ?auto_141471 ?auto_141472 ?auto_141473 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141478 - BLOCK
      ?auto_141479 - BLOCK
      ?auto_141480 - BLOCK
      ?auto_141481 - BLOCK
      ?auto_141482 - BLOCK
    )
    :vars
    (
      ?auto_141486 - BLOCK
      ?auto_141485 - BLOCK
      ?auto_141483 - BLOCK
      ?auto_141484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141486 ?auto_141482 ) ( ON-TABLE ?auto_141478 ) ( ON ?auto_141479 ?auto_141478 ) ( ON ?auto_141480 ?auto_141479 ) ( ON ?auto_141481 ?auto_141480 ) ( ON ?auto_141482 ?auto_141481 ) ( not ( = ?auto_141478 ?auto_141479 ) ) ( not ( = ?auto_141478 ?auto_141480 ) ) ( not ( = ?auto_141478 ?auto_141481 ) ) ( not ( = ?auto_141478 ?auto_141482 ) ) ( not ( = ?auto_141478 ?auto_141486 ) ) ( not ( = ?auto_141479 ?auto_141480 ) ) ( not ( = ?auto_141479 ?auto_141481 ) ) ( not ( = ?auto_141479 ?auto_141482 ) ) ( not ( = ?auto_141479 ?auto_141486 ) ) ( not ( = ?auto_141480 ?auto_141481 ) ) ( not ( = ?auto_141480 ?auto_141482 ) ) ( not ( = ?auto_141480 ?auto_141486 ) ) ( not ( = ?auto_141481 ?auto_141482 ) ) ( not ( = ?auto_141481 ?auto_141486 ) ) ( not ( = ?auto_141482 ?auto_141486 ) ) ( not ( = ?auto_141478 ?auto_141485 ) ) ( not ( = ?auto_141478 ?auto_141483 ) ) ( not ( = ?auto_141479 ?auto_141485 ) ) ( not ( = ?auto_141479 ?auto_141483 ) ) ( not ( = ?auto_141480 ?auto_141485 ) ) ( not ( = ?auto_141480 ?auto_141483 ) ) ( not ( = ?auto_141481 ?auto_141485 ) ) ( not ( = ?auto_141481 ?auto_141483 ) ) ( not ( = ?auto_141482 ?auto_141485 ) ) ( not ( = ?auto_141482 ?auto_141483 ) ) ( not ( = ?auto_141486 ?auto_141485 ) ) ( not ( = ?auto_141486 ?auto_141483 ) ) ( not ( = ?auto_141485 ?auto_141483 ) ) ( ON ?auto_141485 ?auto_141486 ) ( not ( = ?auto_141484 ?auto_141483 ) ) ( not ( = ?auto_141478 ?auto_141484 ) ) ( not ( = ?auto_141479 ?auto_141484 ) ) ( not ( = ?auto_141480 ?auto_141484 ) ) ( not ( = ?auto_141481 ?auto_141484 ) ) ( not ( = ?auto_141482 ?auto_141484 ) ) ( not ( = ?auto_141486 ?auto_141484 ) ) ( not ( = ?auto_141485 ?auto_141484 ) ) ( ON ?auto_141483 ?auto_141485 ) ( CLEAR ?auto_141483 ) ( HOLDING ?auto_141484 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_141484 )
      ( MAKE-5PILE ?auto_141478 ?auto_141479 ?auto_141480 ?auto_141481 ?auto_141482 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141487 - BLOCK
      ?auto_141488 - BLOCK
      ?auto_141489 - BLOCK
      ?auto_141490 - BLOCK
      ?auto_141491 - BLOCK
    )
    :vars
    (
      ?auto_141493 - BLOCK
      ?auto_141495 - BLOCK
      ?auto_141494 - BLOCK
      ?auto_141492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141493 ?auto_141491 ) ( ON-TABLE ?auto_141487 ) ( ON ?auto_141488 ?auto_141487 ) ( ON ?auto_141489 ?auto_141488 ) ( ON ?auto_141490 ?auto_141489 ) ( ON ?auto_141491 ?auto_141490 ) ( not ( = ?auto_141487 ?auto_141488 ) ) ( not ( = ?auto_141487 ?auto_141489 ) ) ( not ( = ?auto_141487 ?auto_141490 ) ) ( not ( = ?auto_141487 ?auto_141491 ) ) ( not ( = ?auto_141487 ?auto_141493 ) ) ( not ( = ?auto_141488 ?auto_141489 ) ) ( not ( = ?auto_141488 ?auto_141490 ) ) ( not ( = ?auto_141488 ?auto_141491 ) ) ( not ( = ?auto_141488 ?auto_141493 ) ) ( not ( = ?auto_141489 ?auto_141490 ) ) ( not ( = ?auto_141489 ?auto_141491 ) ) ( not ( = ?auto_141489 ?auto_141493 ) ) ( not ( = ?auto_141490 ?auto_141491 ) ) ( not ( = ?auto_141490 ?auto_141493 ) ) ( not ( = ?auto_141491 ?auto_141493 ) ) ( not ( = ?auto_141487 ?auto_141495 ) ) ( not ( = ?auto_141487 ?auto_141494 ) ) ( not ( = ?auto_141488 ?auto_141495 ) ) ( not ( = ?auto_141488 ?auto_141494 ) ) ( not ( = ?auto_141489 ?auto_141495 ) ) ( not ( = ?auto_141489 ?auto_141494 ) ) ( not ( = ?auto_141490 ?auto_141495 ) ) ( not ( = ?auto_141490 ?auto_141494 ) ) ( not ( = ?auto_141491 ?auto_141495 ) ) ( not ( = ?auto_141491 ?auto_141494 ) ) ( not ( = ?auto_141493 ?auto_141495 ) ) ( not ( = ?auto_141493 ?auto_141494 ) ) ( not ( = ?auto_141495 ?auto_141494 ) ) ( ON ?auto_141495 ?auto_141493 ) ( not ( = ?auto_141492 ?auto_141494 ) ) ( not ( = ?auto_141487 ?auto_141492 ) ) ( not ( = ?auto_141488 ?auto_141492 ) ) ( not ( = ?auto_141489 ?auto_141492 ) ) ( not ( = ?auto_141490 ?auto_141492 ) ) ( not ( = ?auto_141491 ?auto_141492 ) ) ( not ( = ?auto_141493 ?auto_141492 ) ) ( not ( = ?auto_141495 ?auto_141492 ) ) ( ON ?auto_141494 ?auto_141495 ) ( ON ?auto_141492 ?auto_141494 ) ( CLEAR ?auto_141492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_141487 ?auto_141488 ?auto_141489 ?auto_141490 ?auto_141491 ?auto_141493 ?auto_141495 ?auto_141494 )
      ( MAKE-5PILE ?auto_141487 ?auto_141488 ?auto_141489 ?auto_141490 ?auto_141491 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141500 - BLOCK
      ?auto_141501 - BLOCK
      ?auto_141502 - BLOCK
      ?auto_141503 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_141503 ) ( CLEAR ?auto_141502 ) ( ON-TABLE ?auto_141500 ) ( ON ?auto_141501 ?auto_141500 ) ( ON ?auto_141502 ?auto_141501 ) ( not ( = ?auto_141500 ?auto_141501 ) ) ( not ( = ?auto_141500 ?auto_141502 ) ) ( not ( = ?auto_141500 ?auto_141503 ) ) ( not ( = ?auto_141501 ?auto_141502 ) ) ( not ( = ?auto_141501 ?auto_141503 ) ) ( not ( = ?auto_141502 ?auto_141503 ) ) )
    :subtasks
    ( ( !STACK ?auto_141503 ?auto_141502 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141504 - BLOCK
      ?auto_141505 - BLOCK
      ?auto_141506 - BLOCK
      ?auto_141507 - BLOCK
    )
    :vars
    (
      ?auto_141508 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_141506 ) ( ON-TABLE ?auto_141504 ) ( ON ?auto_141505 ?auto_141504 ) ( ON ?auto_141506 ?auto_141505 ) ( not ( = ?auto_141504 ?auto_141505 ) ) ( not ( = ?auto_141504 ?auto_141506 ) ) ( not ( = ?auto_141504 ?auto_141507 ) ) ( not ( = ?auto_141505 ?auto_141506 ) ) ( not ( = ?auto_141505 ?auto_141507 ) ) ( not ( = ?auto_141506 ?auto_141507 ) ) ( ON ?auto_141507 ?auto_141508 ) ( CLEAR ?auto_141507 ) ( HAND-EMPTY ) ( not ( = ?auto_141504 ?auto_141508 ) ) ( not ( = ?auto_141505 ?auto_141508 ) ) ( not ( = ?auto_141506 ?auto_141508 ) ) ( not ( = ?auto_141507 ?auto_141508 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_141507 ?auto_141508 )
      ( MAKE-4PILE ?auto_141504 ?auto_141505 ?auto_141506 ?auto_141507 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141509 - BLOCK
      ?auto_141510 - BLOCK
      ?auto_141511 - BLOCK
      ?auto_141512 - BLOCK
    )
    :vars
    (
      ?auto_141513 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141509 ) ( ON ?auto_141510 ?auto_141509 ) ( not ( = ?auto_141509 ?auto_141510 ) ) ( not ( = ?auto_141509 ?auto_141511 ) ) ( not ( = ?auto_141509 ?auto_141512 ) ) ( not ( = ?auto_141510 ?auto_141511 ) ) ( not ( = ?auto_141510 ?auto_141512 ) ) ( not ( = ?auto_141511 ?auto_141512 ) ) ( ON ?auto_141512 ?auto_141513 ) ( CLEAR ?auto_141512 ) ( not ( = ?auto_141509 ?auto_141513 ) ) ( not ( = ?auto_141510 ?auto_141513 ) ) ( not ( = ?auto_141511 ?auto_141513 ) ) ( not ( = ?auto_141512 ?auto_141513 ) ) ( HOLDING ?auto_141511 ) ( CLEAR ?auto_141510 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_141509 ?auto_141510 ?auto_141511 )
      ( MAKE-4PILE ?auto_141509 ?auto_141510 ?auto_141511 ?auto_141512 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141514 - BLOCK
      ?auto_141515 - BLOCK
      ?auto_141516 - BLOCK
      ?auto_141517 - BLOCK
    )
    :vars
    (
      ?auto_141518 - BLOCK
      ?auto_141522 - BLOCK
      ?auto_141521 - BLOCK
      ?auto_141519 - BLOCK
      ?auto_141520 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141514 ) ( ON ?auto_141515 ?auto_141514 ) ( not ( = ?auto_141514 ?auto_141515 ) ) ( not ( = ?auto_141514 ?auto_141516 ) ) ( not ( = ?auto_141514 ?auto_141517 ) ) ( not ( = ?auto_141515 ?auto_141516 ) ) ( not ( = ?auto_141515 ?auto_141517 ) ) ( not ( = ?auto_141516 ?auto_141517 ) ) ( ON ?auto_141517 ?auto_141518 ) ( not ( = ?auto_141514 ?auto_141518 ) ) ( not ( = ?auto_141515 ?auto_141518 ) ) ( not ( = ?auto_141516 ?auto_141518 ) ) ( not ( = ?auto_141517 ?auto_141518 ) ) ( CLEAR ?auto_141515 ) ( ON ?auto_141516 ?auto_141517 ) ( CLEAR ?auto_141516 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_141522 ) ( ON ?auto_141521 ?auto_141522 ) ( ON ?auto_141519 ?auto_141521 ) ( ON ?auto_141520 ?auto_141519 ) ( ON ?auto_141518 ?auto_141520 ) ( not ( = ?auto_141522 ?auto_141521 ) ) ( not ( = ?auto_141522 ?auto_141519 ) ) ( not ( = ?auto_141522 ?auto_141520 ) ) ( not ( = ?auto_141522 ?auto_141518 ) ) ( not ( = ?auto_141522 ?auto_141517 ) ) ( not ( = ?auto_141522 ?auto_141516 ) ) ( not ( = ?auto_141521 ?auto_141519 ) ) ( not ( = ?auto_141521 ?auto_141520 ) ) ( not ( = ?auto_141521 ?auto_141518 ) ) ( not ( = ?auto_141521 ?auto_141517 ) ) ( not ( = ?auto_141521 ?auto_141516 ) ) ( not ( = ?auto_141519 ?auto_141520 ) ) ( not ( = ?auto_141519 ?auto_141518 ) ) ( not ( = ?auto_141519 ?auto_141517 ) ) ( not ( = ?auto_141519 ?auto_141516 ) ) ( not ( = ?auto_141520 ?auto_141518 ) ) ( not ( = ?auto_141520 ?auto_141517 ) ) ( not ( = ?auto_141520 ?auto_141516 ) ) ( not ( = ?auto_141514 ?auto_141522 ) ) ( not ( = ?auto_141514 ?auto_141521 ) ) ( not ( = ?auto_141514 ?auto_141519 ) ) ( not ( = ?auto_141514 ?auto_141520 ) ) ( not ( = ?auto_141515 ?auto_141522 ) ) ( not ( = ?auto_141515 ?auto_141521 ) ) ( not ( = ?auto_141515 ?auto_141519 ) ) ( not ( = ?auto_141515 ?auto_141520 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_141522 ?auto_141521 ?auto_141519 ?auto_141520 ?auto_141518 ?auto_141517 )
      ( MAKE-4PILE ?auto_141514 ?auto_141515 ?auto_141516 ?auto_141517 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141523 - BLOCK
      ?auto_141524 - BLOCK
      ?auto_141525 - BLOCK
      ?auto_141526 - BLOCK
    )
    :vars
    (
      ?auto_141531 - BLOCK
      ?auto_141527 - BLOCK
      ?auto_141528 - BLOCK
      ?auto_141530 - BLOCK
      ?auto_141529 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141523 ) ( not ( = ?auto_141523 ?auto_141524 ) ) ( not ( = ?auto_141523 ?auto_141525 ) ) ( not ( = ?auto_141523 ?auto_141526 ) ) ( not ( = ?auto_141524 ?auto_141525 ) ) ( not ( = ?auto_141524 ?auto_141526 ) ) ( not ( = ?auto_141525 ?auto_141526 ) ) ( ON ?auto_141526 ?auto_141531 ) ( not ( = ?auto_141523 ?auto_141531 ) ) ( not ( = ?auto_141524 ?auto_141531 ) ) ( not ( = ?auto_141525 ?auto_141531 ) ) ( not ( = ?auto_141526 ?auto_141531 ) ) ( ON ?auto_141525 ?auto_141526 ) ( CLEAR ?auto_141525 ) ( ON-TABLE ?auto_141527 ) ( ON ?auto_141528 ?auto_141527 ) ( ON ?auto_141530 ?auto_141528 ) ( ON ?auto_141529 ?auto_141530 ) ( ON ?auto_141531 ?auto_141529 ) ( not ( = ?auto_141527 ?auto_141528 ) ) ( not ( = ?auto_141527 ?auto_141530 ) ) ( not ( = ?auto_141527 ?auto_141529 ) ) ( not ( = ?auto_141527 ?auto_141531 ) ) ( not ( = ?auto_141527 ?auto_141526 ) ) ( not ( = ?auto_141527 ?auto_141525 ) ) ( not ( = ?auto_141528 ?auto_141530 ) ) ( not ( = ?auto_141528 ?auto_141529 ) ) ( not ( = ?auto_141528 ?auto_141531 ) ) ( not ( = ?auto_141528 ?auto_141526 ) ) ( not ( = ?auto_141528 ?auto_141525 ) ) ( not ( = ?auto_141530 ?auto_141529 ) ) ( not ( = ?auto_141530 ?auto_141531 ) ) ( not ( = ?auto_141530 ?auto_141526 ) ) ( not ( = ?auto_141530 ?auto_141525 ) ) ( not ( = ?auto_141529 ?auto_141531 ) ) ( not ( = ?auto_141529 ?auto_141526 ) ) ( not ( = ?auto_141529 ?auto_141525 ) ) ( not ( = ?auto_141523 ?auto_141527 ) ) ( not ( = ?auto_141523 ?auto_141528 ) ) ( not ( = ?auto_141523 ?auto_141530 ) ) ( not ( = ?auto_141523 ?auto_141529 ) ) ( not ( = ?auto_141524 ?auto_141527 ) ) ( not ( = ?auto_141524 ?auto_141528 ) ) ( not ( = ?auto_141524 ?auto_141530 ) ) ( not ( = ?auto_141524 ?auto_141529 ) ) ( HOLDING ?auto_141524 ) ( CLEAR ?auto_141523 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_141523 ?auto_141524 )
      ( MAKE-4PILE ?auto_141523 ?auto_141524 ?auto_141525 ?auto_141526 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141532 - BLOCK
      ?auto_141533 - BLOCK
      ?auto_141534 - BLOCK
      ?auto_141535 - BLOCK
    )
    :vars
    (
      ?auto_141537 - BLOCK
      ?auto_141539 - BLOCK
      ?auto_141540 - BLOCK
      ?auto_141536 - BLOCK
      ?auto_141538 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141532 ) ( not ( = ?auto_141532 ?auto_141533 ) ) ( not ( = ?auto_141532 ?auto_141534 ) ) ( not ( = ?auto_141532 ?auto_141535 ) ) ( not ( = ?auto_141533 ?auto_141534 ) ) ( not ( = ?auto_141533 ?auto_141535 ) ) ( not ( = ?auto_141534 ?auto_141535 ) ) ( ON ?auto_141535 ?auto_141537 ) ( not ( = ?auto_141532 ?auto_141537 ) ) ( not ( = ?auto_141533 ?auto_141537 ) ) ( not ( = ?auto_141534 ?auto_141537 ) ) ( not ( = ?auto_141535 ?auto_141537 ) ) ( ON ?auto_141534 ?auto_141535 ) ( ON-TABLE ?auto_141539 ) ( ON ?auto_141540 ?auto_141539 ) ( ON ?auto_141536 ?auto_141540 ) ( ON ?auto_141538 ?auto_141536 ) ( ON ?auto_141537 ?auto_141538 ) ( not ( = ?auto_141539 ?auto_141540 ) ) ( not ( = ?auto_141539 ?auto_141536 ) ) ( not ( = ?auto_141539 ?auto_141538 ) ) ( not ( = ?auto_141539 ?auto_141537 ) ) ( not ( = ?auto_141539 ?auto_141535 ) ) ( not ( = ?auto_141539 ?auto_141534 ) ) ( not ( = ?auto_141540 ?auto_141536 ) ) ( not ( = ?auto_141540 ?auto_141538 ) ) ( not ( = ?auto_141540 ?auto_141537 ) ) ( not ( = ?auto_141540 ?auto_141535 ) ) ( not ( = ?auto_141540 ?auto_141534 ) ) ( not ( = ?auto_141536 ?auto_141538 ) ) ( not ( = ?auto_141536 ?auto_141537 ) ) ( not ( = ?auto_141536 ?auto_141535 ) ) ( not ( = ?auto_141536 ?auto_141534 ) ) ( not ( = ?auto_141538 ?auto_141537 ) ) ( not ( = ?auto_141538 ?auto_141535 ) ) ( not ( = ?auto_141538 ?auto_141534 ) ) ( not ( = ?auto_141532 ?auto_141539 ) ) ( not ( = ?auto_141532 ?auto_141540 ) ) ( not ( = ?auto_141532 ?auto_141536 ) ) ( not ( = ?auto_141532 ?auto_141538 ) ) ( not ( = ?auto_141533 ?auto_141539 ) ) ( not ( = ?auto_141533 ?auto_141540 ) ) ( not ( = ?auto_141533 ?auto_141536 ) ) ( not ( = ?auto_141533 ?auto_141538 ) ) ( CLEAR ?auto_141532 ) ( ON ?auto_141533 ?auto_141534 ) ( CLEAR ?auto_141533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_141539 ?auto_141540 ?auto_141536 ?auto_141538 ?auto_141537 ?auto_141535 ?auto_141534 )
      ( MAKE-4PILE ?auto_141532 ?auto_141533 ?auto_141534 ?auto_141535 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141541 - BLOCK
      ?auto_141542 - BLOCK
      ?auto_141543 - BLOCK
      ?auto_141544 - BLOCK
    )
    :vars
    (
      ?auto_141547 - BLOCK
      ?auto_141549 - BLOCK
      ?auto_141548 - BLOCK
      ?auto_141545 - BLOCK
      ?auto_141546 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141541 ?auto_141542 ) ) ( not ( = ?auto_141541 ?auto_141543 ) ) ( not ( = ?auto_141541 ?auto_141544 ) ) ( not ( = ?auto_141542 ?auto_141543 ) ) ( not ( = ?auto_141542 ?auto_141544 ) ) ( not ( = ?auto_141543 ?auto_141544 ) ) ( ON ?auto_141544 ?auto_141547 ) ( not ( = ?auto_141541 ?auto_141547 ) ) ( not ( = ?auto_141542 ?auto_141547 ) ) ( not ( = ?auto_141543 ?auto_141547 ) ) ( not ( = ?auto_141544 ?auto_141547 ) ) ( ON ?auto_141543 ?auto_141544 ) ( ON-TABLE ?auto_141549 ) ( ON ?auto_141548 ?auto_141549 ) ( ON ?auto_141545 ?auto_141548 ) ( ON ?auto_141546 ?auto_141545 ) ( ON ?auto_141547 ?auto_141546 ) ( not ( = ?auto_141549 ?auto_141548 ) ) ( not ( = ?auto_141549 ?auto_141545 ) ) ( not ( = ?auto_141549 ?auto_141546 ) ) ( not ( = ?auto_141549 ?auto_141547 ) ) ( not ( = ?auto_141549 ?auto_141544 ) ) ( not ( = ?auto_141549 ?auto_141543 ) ) ( not ( = ?auto_141548 ?auto_141545 ) ) ( not ( = ?auto_141548 ?auto_141546 ) ) ( not ( = ?auto_141548 ?auto_141547 ) ) ( not ( = ?auto_141548 ?auto_141544 ) ) ( not ( = ?auto_141548 ?auto_141543 ) ) ( not ( = ?auto_141545 ?auto_141546 ) ) ( not ( = ?auto_141545 ?auto_141547 ) ) ( not ( = ?auto_141545 ?auto_141544 ) ) ( not ( = ?auto_141545 ?auto_141543 ) ) ( not ( = ?auto_141546 ?auto_141547 ) ) ( not ( = ?auto_141546 ?auto_141544 ) ) ( not ( = ?auto_141546 ?auto_141543 ) ) ( not ( = ?auto_141541 ?auto_141549 ) ) ( not ( = ?auto_141541 ?auto_141548 ) ) ( not ( = ?auto_141541 ?auto_141545 ) ) ( not ( = ?auto_141541 ?auto_141546 ) ) ( not ( = ?auto_141542 ?auto_141549 ) ) ( not ( = ?auto_141542 ?auto_141548 ) ) ( not ( = ?auto_141542 ?auto_141545 ) ) ( not ( = ?auto_141542 ?auto_141546 ) ) ( ON ?auto_141542 ?auto_141543 ) ( CLEAR ?auto_141542 ) ( HOLDING ?auto_141541 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_141541 )
      ( MAKE-4PILE ?auto_141541 ?auto_141542 ?auto_141543 ?auto_141544 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141550 - BLOCK
      ?auto_141551 - BLOCK
      ?auto_141552 - BLOCK
      ?auto_141553 - BLOCK
    )
    :vars
    (
      ?auto_141554 - BLOCK
      ?auto_141556 - BLOCK
      ?auto_141558 - BLOCK
      ?auto_141555 - BLOCK
      ?auto_141557 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141550 ?auto_141551 ) ) ( not ( = ?auto_141550 ?auto_141552 ) ) ( not ( = ?auto_141550 ?auto_141553 ) ) ( not ( = ?auto_141551 ?auto_141552 ) ) ( not ( = ?auto_141551 ?auto_141553 ) ) ( not ( = ?auto_141552 ?auto_141553 ) ) ( ON ?auto_141553 ?auto_141554 ) ( not ( = ?auto_141550 ?auto_141554 ) ) ( not ( = ?auto_141551 ?auto_141554 ) ) ( not ( = ?auto_141552 ?auto_141554 ) ) ( not ( = ?auto_141553 ?auto_141554 ) ) ( ON ?auto_141552 ?auto_141553 ) ( ON-TABLE ?auto_141556 ) ( ON ?auto_141558 ?auto_141556 ) ( ON ?auto_141555 ?auto_141558 ) ( ON ?auto_141557 ?auto_141555 ) ( ON ?auto_141554 ?auto_141557 ) ( not ( = ?auto_141556 ?auto_141558 ) ) ( not ( = ?auto_141556 ?auto_141555 ) ) ( not ( = ?auto_141556 ?auto_141557 ) ) ( not ( = ?auto_141556 ?auto_141554 ) ) ( not ( = ?auto_141556 ?auto_141553 ) ) ( not ( = ?auto_141556 ?auto_141552 ) ) ( not ( = ?auto_141558 ?auto_141555 ) ) ( not ( = ?auto_141558 ?auto_141557 ) ) ( not ( = ?auto_141558 ?auto_141554 ) ) ( not ( = ?auto_141558 ?auto_141553 ) ) ( not ( = ?auto_141558 ?auto_141552 ) ) ( not ( = ?auto_141555 ?auto_141557 ) ) ( not ( = ?auto_141555 ?auto_141554 ) ) ( not ( = ?auto_141555 ?auto_141553 ) ) ( not ( = ?auto_141555 ?auto_141552 ) ) ( not ( = ?auto_141557 ?auto_141554 ) ) ( not ( = ?auto_141557 ?auto_141553 ) ) ( not ( = ?auto_141557 ?auto_141552 ) ) ( not ( = ?auto_141550 ?auto_141556 ) ) ( not ( = ?auto_141550 ?auto_141558 ) ) ( not ( = ?auto_141550 ?auto_141555 ) ) ( not ( = ?auto_141550 ?auto_141557 ) ) ( not ( = ?auto_141551 ?auto_141556 ) ) ( not ( = ?auto_141551 ?auto_141558 ) ) ( not ( = ?auto_141551 ?auto_141555 ) ) ( not ( = ?auto_141551 ?auto_141557 ) ) ( ON ?auto_141551 ?auto_141552 ) ( ON ?auto_141550 ?auto_141551 ) ( CLEAR ?auto_141550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_141556 ?auto_141558 ?auto_141555 ?auto_141557 ?auto_141554 ?auto_141553 ?auto_141552 ?auto_141551 )
      ( MAKE-4PILE ?auto_141550 ?auto_141551 ?auto_141552 ?auto_141553 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141563 - BLOCK
      ?auto_141564 - BLOCK
      ?auto_141565 - BLOCK
      ?auto_141566 - BLOCK
    )
    :vars
    (
      ?auto_141567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141567 ?auto_141566 ) ( CLEAR ?auto_141567 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_141563 ) ( ON ?auto_141564 ?auto_141563 ) ( ON ?auto_141565 ?auto_141564 ) ( ON ?auto_141566 ?auto_141565 ) ( not ( = ?auto_141563 ?auto_141564 ) ) ( not ( = ?auto_141563 ?auto_141565 ) ) ( not ( = ?auto_141563 ?auto_141566 ) ) ( not ( = ?auto_141563 ?auto_141567 ) ) ( not ( = ?auto_141564 ?auto_141565 ) ) ( not ( = ?auto_141564 ?auto_141566 ) ) ( not ( = ?auto_141564 ?auto_141567 ) ) ( not ( = ?auto_141565 ?auto_141566 ) ) ( not ( = ?auto_141565 ?auto_141567 ) ) ( not ( = ?auto_141566 ?auto_141567 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_141567 ?auto_141566 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141568 - BLOCK
      ?auto_141569 - BLOCK
      ?auto_141570 - BLOCK
      ?auto_141571 - BLOCK
    )
    :vars
    (
      ?auto_141572 - BLOCK
      ?auto_141573 - BLOCK
      ?auto_141574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141572 ?auto_141571 ) ( CLEAR ?auto_141572 ) ( ON-TABLE ?auto_141568 ) ( ON ?auto_141569 ?auto_141568 ) ( ON ?auto_141570 ?auto_141569 ) ( ON ?auto_141571 ?auto_141570 ) ( not ( = ?auto_141568 ?auto_141569 ) ) ( not ( = ?auto_141568 ?auto_141570 ) ) ( not ( = ?auto_141568 ?auto_141571 ) ) ( not ( = ?auto_141568 ?auto_141572 ) ) ( not ( = ?auto_141569 ?auto_141570 ) ) ( not ( = ?auto_141569 ?auto_141571 ) ) ( not ( = ?auto_141569 ?auto_141572 ) ) ( not ( = ?auto_141570 ?auto_141571 ) ) ( not ( = ?auto_141570 ?auto_141572 ) ) ( not ( = ?auto_141571 ?auto_141572 ) ) ( HOLDING ?auto_141573 ) ( CLEAR ?auto_141574 ) ( not ( = ?auto_141568 ?auto_141573 ) ) ( not ( = ?auto_141568 ?auto_141574 ) ) ( not ( = ?auto_141569 ?auto_141573 ) ) ( not ( = ?auto_141569 ?auto_141574 ) ) ( not ( = ?auto_141570 ?auto_141573 ) ) ( not ( = ?auto_141570 ?auto_141574 ) ) ( not ( = ?auto_141571 ?auto_141573 ) ) ( not ( = ?auto_141571 ?auto_141574 ) ) ( not ( = ?auto_141572 ?auto_141573 ) ) ( not ( = ?auto_141572 ?auto_141574 ) ) ( not ( = ?auto_141573 ?auto_141574 ) ) )
    :subtasks
    ( ( !STACK ?auto_141573 ?auto_141574 )
      ( MAKE-4PILE ?auto_141568 ?auto_141569 ?auto_141570 ?auto_141571 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141575 - BLOCK
      ?auto_141576 - BLOCK
      ?auto_141577 - BLOCK
      ?auto_141578 - BLOCK
    )
    :vars
    (
      ?auto_141579 - BLOCK
      ?auto_141580 - BLOCK
      ?auto_141581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141579 ?auto_141578 ) ( ON-TABLE ?auto_141575 ) ( ON ?auto_141576 ?auto_141575 ) ( ON ?auto_141577 ?auto_141576 ) ( ON ?auto_141578 ?auto_141577 ) ( not ( = ?auto_141575 ?auto_141576 ) ) ( not ( = ?auto_141575 ?auto_141577 ) ) ( not ( = ?auto_141575 ?auto_141578 ) ) ( not ( = ?auto_141575 ?auto_141579 ) ) ( not ( = ?auto_141576 ?auto_141577 ) ) ( not ( = ?auto_141576 ?auto_141578 ) ) ( not ( = ?auto_141576 ?auto_141579 ) ) ( not ( = ?auto_141577 ?auto_141578 ) ) ( not ( = ?auto_141577 ?auto_141579 ) ) ( not ( = ?auto_141578 ?auto_141579 ) ) ( CLEAR ?auto_141580 ) ( not ( = ?auto_141575 ?auto_141581 ) ) ( not ( = ?auto_141575 ?auto_141580 ) ) ( not ( = ?auto_141576 ?auto_141581 ) ) ( not ( = ?auto_141576 ?auto_141580 ) ) ( not ( = ?auto_141577 ?auto_141581 ) ) ( not ( = ?auto_141577 ?auto_141580 ) ) ( not ( = ?auto_141578 ?auto_141581 ) ) ( not ( = ?auto_141578 ?auto_141580 ) ) ( not ( = ?auto_141579 ?auto_141581 ) ) ( not ( = ?auto_141579 ?auto_141580 ) ) ( not ( = ?auto_141581 ?auto_141580 ) ) ( ON ?auto_141581 ?auto_141579 ) ( CLEAR ?auto_141581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_141575 ?auto_141576 ?auto_141577 ?auto_141578 ?auto_141579 )
      ( MAKE-4PILE ?auto_141575 ?auto_141576 ?auto_141577 ?auto_141578 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141582 - BLOCK
      ?auto_141583 - BLOCK
      ?auto_141584 - BLOCK
      ?auto_141585 - BLOCK
    )
    :vars
    (
      ?auto_141587 - BLOCK
      ?auto_141588 - BLOCK
      ?auto_141586 - BLOCK
      ?auto_141590 - BLOCK
      ?auto_141589 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141587 ?auto_141585 ) ( ON-TABLE ?auto_141582 ) ( ON ?auto_141583 ?auto_141582 ) ( ON ?auto_141584 ?auto_141583 ) ( ON ?auto_141585 ?auto_141584 ) ( not ( = ?auto_141582 ?auto_141583 ) ) ( not ( = ?auto_141582 ?auto_141584 ) ) ( not ( = ?auto_141582 ?auto_141585 ) ) ( not ( = ?auto_141582 ?auto_141587 ) ) ( not ( = ?auto_141583 ?auto_141584 ) ) ( not ( = ?auto_141583 ?auto_141585 ) ) ( not ( = ?auto_141583 ?auto_141587 ) ) ( not ( = ?auto_141584 ?auto_141585 ) ) ( not ( = ?auto_141584 ?auto_141587 ) ) ( not ( = ?auto_141585 ?auto_141587 ) ) ( not ( = ?auto_141582 ?auto_141588 ) ) ( not ( = ?auto_141582 ?auto_141586 ) ) ( not ( = ?auto_141583 ?auto_141588 ) ) ( not ( = ?auto_141583 ?auto_141586 ) ) ( not ( = ?auto_141584 ?auto_141588 ) ) ( not ( = ?auto_141584 ?auto_141586 ) ) ( not ( = ?auto_141585 ?auto_141588 ) ) ( not ( = ?auto_141585 ?auto_141586 ) ) ( not ( = ?auto_141587 ?auto_141588 ) ) ( not ( = ?auto_141587 ?auto_141586 ) ) ( not ( = ?auto_141588 ?auto_141586 ) ) ( ON ?auto_141588 ?auto_141587 ) ( CLEAR ?auto_141588 ) ( HOLDING ?auto_141586 ) ( CLEAR ?auto_141590 ) ( ON-TABLE ?auto_141589 ) ( ON ?auto_141590 ?auto_141589 ) ( not ( = ?auto_141589 ?auto_141590 ) ) ( not ( = ?auto_141589 ?auto_141586 ) ) ( not ( = ?auto_141590 ?auto_141586 ) ) ( not ( = ?auto_141582 ?auto_141590 ) ) ( not ( = ?auto_141582 ?auto_141589 ) ) ( not ( = ?auto_141583 ?auto_141590 ) ) ( not ( = ?auto_141583 ?auto_141589 ) ) ( not ( = ?auto_141584 ?auto_141590 ) ) ( not ( = ?auto_141584 ?auto_141589 ) ) ( not ( = ?auto_141585 ?auto_141590 ) ) ( not ( = ?auto_141585 ?auto_141589 ) ) ( not ( = ?auto_141587 ?auto_141590 ) ) ( not ( = ?auto_141587 ?auto_141589 ) ) ( not ( = ?auto_141588 ?auto_141590 ) ) ( not ( = ?auto_141588 ?auto_141589 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_141589 ?auto_141590 ?auto_141586 )
      ( MAKE-4PILE ?auto_141582 ?auto_141583 ?auto_141584 ?auto_141585 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141591 - BLOCK
      ?auto_141592 - BLOCK
      ?auto_141593 - BLOCK
      ?auto_141594 - BLOCK
    )
    :vars
    (
      ?auto_141597 - BLOCK
      ?auto_141598 - BLOCK
      ?auto_141596 - BLOCK
      ?auto_141599 - BLOCK
      ?auto_141595 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141597 ?auto_141594 ) ( ON-TABLE ?auto_141591 ) ( ON ?auto_141592 ?auto_141591 ) ( ON ?auto_141593 ?auto_141592 ) ( ON ?auto_141594 ?auto_141593 ) ( not ( = ?auto_141591 ?auto_141592 ) ) ( not ( = ?auto_141591 ?auto_141593 ) ) ( not ( = ?auto_141591 ?auto_141594 ) ) ( not ( = ?auto_141591 ?auto_141597 ) ) ( not ( = ?auto_141592 ?auto_141593 ) ) ( not ( = ?auto_141592 ?auto_141594 ) ) ( not ( = ?auto_141592 ?auto_141597 ) ) ( not ( = ?auto_141593 ?auto_141594 ) ) ( not ( = ?auto_141593 ?auto_141597 ) ) ( not ( = ?auto_141594 ?auto_141597 ) ) ( not ( = ?auto_141591 ?auto_141598 ) ) ( not ( = ?auto_141591 ?auto_141596 ) ) ( not ( = ?auto_141592 ?auto_141598 ) ) ( not ( = ?auto_141592 ?auto_141596 ) ) ( not ( = ?auto_141593 ?auto_141598 ) ) ( not ( = ?auto_141593 ?auto_141596 ) ) ( not ( = ?auto_141594 ?auto_141598 ) ) ( not ( = ?auto_141594 ?auto_141596 ) ) ( not ( = ?auto_141597 ?auto_141598 ) ) ( not ( = ?auto_141597 ?auto_141596 ) ) ( not ( = ?auto_141598 ?auto_141596 ) ) ( ON ?auto_141598 ?auto_141597 ) ( CLEAR ?auto_141599 ) ( ON-TABLE ?auto_141595 ) ( ON ?auto_141599 ?auto_141595 ) ( not ( = ?auto_141595 ?auto_141599 ) ) ( not ( = ?auto_141595 ?auto_141596 ) ) ( not ( = ?auto_141599 ?auto_141596 ) ) ( not ( = ?auto_141591 ?auto_141599 ) ) ( not ( = ?auto_141591 ?auto_141595 ) ) ( not ( = ?auto_141592 ?auto_141599 ) ) ( not ( = ?auto_141592 ?auto_141595 ) ) ( not ( = ?auto_141593 ?auto_141599 ) ) ( not ( = ?auto_141593 ?auto_141595 ) ) ( not ( = ?auto_141594 ?auto_141599 ) ) ( not ( = ?auto_141594 ?auto_141595 ) ) ( not ( = ?auto_141597 ?auto_141599 ) ) ( not ( = ?auto_141597 ?auto_141595 ) ) ( not ( = ?auto_141598 ?auto_141599 ) ) ( not ( = ?auto_141598 ?auto_141595 ) ) ( ON ?auto_141596 ?auto_141598 ) ( CLEAR ?auto_141596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_141591 ?auto_141592 ?auto_141593 ?auto_141594 ?auto_141597 ?auto_141598 )
      ( MAKE-4PILE ?auto_141591 ?auto_141592 ?auto_141593 ?auto_141594 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141600 - BLOCK
      ?auto_141601 - BLOCK
      ?auto_141602 - BLOCK
      ?auto_141603 - BLOCK
    )
    :vars
    (
      ?auto_141608 - BLOCK
      ?auto_141605 - BLOCK
      ?auto_141604 - BLOCK
      ?auto_141606 - BLOCK
      ?auto_141607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141608 ?auto_141603 ) ( ON-TABLE ?auto_141600 ) ( ON ?auto_141601 ?auto_141600 ) ( ON ?auto_141602 ?auto_141601 ) ( ON ?auto_141603 ?auto_141602 ) ( not ( = ?auto_141600 ?auto_141601 ) ) ( not ( = ?auto_141600 ?auto_141602 ) ) ( not ( = ?auto_141600 ?auto_141603 ) ) ( not ( = ?auto_141600 ?auto_141608 ) ) ( not ( = ?auto_141601 ?auto_141602 ) ) ( not ( = ?auto_141601 ?auto_141603 ) ) ( not ( = ?auto_141601 ?auto_141608 ) ) ( not ( = ?auto_141602 ?auto_141603 ) ) ( not ( = ?auto_141602 ?auto_141608 ) ) ( not ( = ?auto_141603 ?auto_141608 ) ) ( not ( = ?auto_141600 ?auto_141605 ) ) ( not ( = ?auto_141600 ?auto_141604 ) ) ( not ( = ?auto_141601 ?auto_141605 ) ) ( not ( = ?auto_141601 ?auto_141604 ) ) ( not ( = ?auto_141602 ?auto_141605 ) ) ( not ( = ?auto_141602 ?auto_141604 ) ) ( not ( = ?auto_141603 ?auto_141605 ) ) ( not ( = ?auto_141603 ?auto_141604 ) ) ( not ( = ?auto_141608 ?auto_141605 ) ) ( not ( = ?auto_141608 ?auto_141604 ) ) ( not ( = ?auto_141605 ?auto_141604 ) ) ( ON ?auto_141605 ?auto_141608 ) ( ON-TABLE ?auto_141606 ) ( not ( = ?auto_141606 ?auto_141607 ) ) ( not ( = ?auto_141606 ?auto_141604 ) ) ( not ( = ?auto_141607 ?auto_141604 ) ) ( not ( = ?auto_141600 ?auto_141607 ) ) ( not ( = ?auto_141600 ?auto_141606 ) ) ( not ( = ?auto_141601 ?auto_141607 ) ) ( not ( = ?auto_141601 ?auto_141606 ) ) ( not ( = ?auto_141602 ?auto_141607 ) ) ( not ( = ?auto_141602 ?auto_141606 ) ) ( not ( = ?auto_141603 ?auto_141607 ) ) ( not ( = ?auto_141603 ?auto_141606 ) ) ( not ( = ?auto_141608 ?auto_141607 ) ) ( not ( = ?auto_141608 ?auto_141606 ) ) ( not ( = ?auto_141605 ?auto_141607 ) ) ( not ( = ?auto_141605 ?auto_141606 ) ) ( ON ?auto_141604 ?auto_141605 ) ( CLEAR ?auto_141604 ) ( HOLDING ?auto_141607 ) ( CLEAR ?auto_141606 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_141606 ?auto_141607 )
      ( MAKE-4PILE ?auto_141600 ?auto_141601 ?auto_141602 ?auto_141603 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141609 - BLOCK
      ?auto_141610 - BLOCK
      ?auto_141611 - BLOCK
      ?auto_141612 - BLOCK
    )
    :vars
    (
      ?auto_141617 - BLOCK
      ?auto_141614 - BLOCK
      ?auto_141613 - BLOCK
      ?auto_141616 - BLOCK
      ?auto_141615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141617 ?auto_141612 ) ( ON-TABLE ?auto_141609 ) ( ON ?auto_141610 ?auto_141609 ) ( ON ?auto_141611 ?auto_141610 ) ( ON ?auto_141612 ?auto_141611 ) ( not ( = ?auto_141609 ?auto_141610 ) ) ( not ( = ?auto_141609 ?auto_141611 ) ) ( not ( = ?auto_141609 ?auto_141612 ) ) ( not ( = ?auto_141609 ?auto_141617 ) ) ( not ( = ?auto_141610 ?auto_141611 ) ) ( not ( = ?auto_141610 ?auto_141612 ) ) ( not ( = ?auto_141610 ?auto_141617 ) ) ( not ( = ?auto_141611 ?auto_141612 ) ) ( not ( = ?auto_141611 ?auto_141617 ) ) ( not ( = ?auto_141612 ?auto_141617 ) ) ( not ( = ?auto_141609 ?auto_141614 ) ) ( not ( = ?auto_141609 ?auto_141613 ) ) ( not ( = ?auto_141610 ?auto_141614 ) ) ( not ( = ?auto_141610 ?auto_141613 ) ) ( not ( = ?auto_141611 ?auto_141614 ) ) ( not ( = ?auto_141611 ?auto_141613 ) ) ( not ( = ?auto_141612 ?auto_141614 ) ) ( not ( = ?auto_141612 ?auto_141613 ) ) ( not ( = ?auto_141617 ?auto_141614 ) ) ( not ( = ?auto_141617 ?auto_141613 ) ) ( not ( = ?auto_141614 ?auto_141613 ) ) ( ON ?auto_141614 ?auto_141617 ) ( ON-TABLE ?auto_141616 ) ( not ( = ?auto_141616 ?auto_141615 ) ) ( not ( = ?auto_141616 ?auto_141613 ) ) ( not ( = ?auto_141615 ?auto_141613 ) ) ( not ( = ?auto_141609 ?auto_141615 ) ) ( not ( = ?auto_141609 ?auto_141616 ) ) ( not ( = ?auto_141610 ?auto_141615 ) ) ( not ( = ?auto_141610 ?auto_141616 ) ) ( not ( = ?auto_141611 ?auto_141615 ) ) ( not ( = ?auto_141611 ?auto_141616 ) ) ( not ( = ?auto_141612 ?auto_141615 ) ) ( not ( = ?auto_141612 ?auto_141616 ) ) ( not ( = ?auto_141617 ?auto_141615 ) ) ( not ( = ?auto_141617 ?auto_141616 ) ) ( not ( = ?auto_141614 ?auto_141615 ) ) ( not ( = ?auto_141614 ?auto_141616 ) ) ( ON ?auto_141613 ?auto_141614 ) ( CLEAR ?auto_141616 ) ( ON ?auto_141615 ?auto_141613 ) ( CLEAR ?auto_141615 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_141609 ?auto_141610 ?auto_141611 ?auto_141612 ?auto_141617 ?auto_141614 ?auto_141613 )
      ( MAKE-4PILE ?auto_141609 ?auto_141610 ?auto_141611 ?auto_141612 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141618 - BLOCK
      ?auto_141619 - BLOCK
      ?auto_141620 - BLOCK
      ?auto_141621 - BLOCK
    )
    :vars
    (
      ?auto_141625 - BLOCK
      ?auto_141623 - BLOCK
      ?auto_141622 - BLOCK
      ?auto_141626 - BLOCK
      ?auto_141624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141625 ?auto_141621 ) ( ON-TABLE ?auto_141618 ) ( ON ?auto_141619 ?auto_141618 ) ( ON ?auto_141620 ?auto_141619 ) ( ON ?auto_141621 ?auto_141620 ) ( not ( = ?auto_141618 ?auto_141619 ) ) ( not ( = ?auto_141618 ?auto_141620 ) ) ( not ( = ?auto_141618 ?auto_141621 ) ) ( not ( = ?auto_141618 ?auto_141625 ) ) ( not ( = ?auto_141619 ?auto_141620 ) ) ( not ( = ?auto_141619 ?auto_141621 ) ) ( not ( = ?auto_141619 ?auto_141625 ) ) ( not ( = ?auto_141620 ?auto_141621 ) ) ( not ( = ?auto_141620 ?auto_141625 ) ) ( not ( = ?auto_141621 ?auto_141625 ) ) ( not ( = ?auto_141618 ?auto_141623 ) ) ( not ( = ?auto_141618 ?auto_141622 ) ) ( not ( = ?auto_141619 ?auto_141623 ) ) ( not ( = ?auto_141619 ?auto_141622 ) ) ( not ( = ?auto_141620 ?auto_141623 ) ) ( not ( = ?auto_141620 ?auto_141622 ) ) ( not ( = ?auto_141621 ?auto_141623 ) ) ( not ( = ?auto_141621 ?auto_141622 ) ) ( not ( = ?auto_141625 ?auto_141623 ) ) ( not ( = ?auto_141625 ?auto_141622 ) ) ( not ( = ?auto_141623 ?auto_141622 ) ) ( ON ?auto_141623 ?auto_141625 ) ( not ( = ?auto_141626 ?auto_141624 ) ) ( not ( = ?auto_141626 ?auto_141622 ) ) ( not ( = ?auto_141624 ?auto_141622 ) ) ( not ( = ?auto_141618 ?auto_141624 ) ) ( not ( = ?auto_141618 ?auto_141626 ) ) ( not ( = ?auto_141619 ?auto_141624 ) ) ( not ( = ?auto_141619 ?auto_141626 ) ) ( not ( = ?auto_141620 ?auto_141624 ) ) ( not ( = ?auto_141620 ?auto_141626 ) ) ( not ( = ?auto_141621 ?auto_141624 ) ) ( not ( = ?auto_141621 ?auto_141626 ) ) ( not ( = ?auto_141625 ?auto_141624 ) ) ( not ( = ?auto_141625 ?auto_141626 ) ) ( not ( = ?auto_141623 ?auto_141624 ) ) ( not ( = ?auto_141623 ?auto_141626 ) ) ( ON ?auto_141622 ?auto_141623 ) ( ON ?auto_141624 ?auto_141622 ) ( CLEAR ?auto_141624 ) ( HOLDING ?auto_141626 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_141626 )
      ( MAKE-4PILE ?auto_141618 ?auto_141619 ?auto_141620 ?auto_141621 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141627 - BLOCK
      ?auto_141628 - BLOCK
      ?auto_141629 - BLOCK
      ?auto_141630 - BLOCK
    )
    :vars
    (
      ?auto_141631 - BLOCK
      ?auto_141635 - BLOCK
      ?auto_141634 - BLOCK
      ?auto_141632 - BLOCK
      ?auto_141633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141631 ?auto_141630 ) ( ON-TABLE ?auto_141627 ) ( ON ?auto_141628 ?auto_141627 ) ( ON ?auto_141629 ?auto_141628 ) ( ON ?auto_141630 ?auto_141629 ) ( not ( = ?auto_141627 ?auto_141628 ) ) ( not ( = ?auto_141627 ?auto_141629 ) ) ( not ( = ?auto_141627 ?auto_141630 ) ) ( not ( = ?auto_141627 ?auto_141631 ) ) ( not ( = ?auto_141628 ?auto_141629 ) ) ( not ( = ?auto_141628 ?auto_141630 ) ) ( not ( = ?auto_141628 ?auto_141631 ) ) ( not ( = ?auto_141629 ?auto_141630 ) ) ( not ( = ?auto_141629 ?auto_141631 ) ) ( not ( = ?auto_141630 ?auto_141631 ) ) ( not ( = ?auto_141627 ?auto_141635 ) ) ( not ( = ?auto_141627 ?auto_141634 ) ) ( not ( = ?auto_141628 ?auto_141635 ) ) ( not ( = ?auto_141628 ?auto_141634 ) ) ( not ( = ?auto_141629 ?auto_141635 ) ) ( not ( = ?auto_141629 ?auto_141634 ) ) ( not ( = ?auto_141630 ?auto_141635 ) ) ( not ( = ?auto_141630 ?auto_141634 ) ) ( not ( = ?auto_141631 ?auto_141635 ) ) ( not ( = ?auto_141631 ?auto_141634 ) ) ( not ( = ?auto_141635 ?auto_141634 ) ) ( ON ?auto_141635 ?auto_141631 ) ( not ( = ?auto_141632 ?auto_141633 ) ) ( not ( = ?auto_141632 ?auto_141634 ) ) ( not ( = ?auto_141633 ?auto_141634 ) ) ( not ( = ?auto_141627 ?auto_141633 ) ) ( not ( = ?auto_141627 ?auto_141632 ) ) ( not ( = ?auto_141628 ?auto_141633 ) ) ( not ( = ?auto_141628 ?auto_141632 ) ) ( not ( = ?auto_141629 ?auto_141633 ) ) ( not ( = ?auto_141629 ?auto_141632 ) ) ( not ( = ?auto_141630 ?auto_141633 ) ) ( not ( = ?auto_141630 ?auto_141632 ) ) ( not ( = ?auto_141631 ?auto_141633 ) ) ( not ( = ?auto_141631 ?auto_141632 ) ) ( not ( = ?auto_141635 ?auto_141633 ) ) ( not ( = ?auto_141635 ?auto_141632 ) ) ( ON ?auto_141634 ?auto_141635 ) ( ON ?auto_141633 ?auto_141634 ) ( ON ?auto_141632 ?auto_141633 ) ( CLEAR ?auto_141632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_141627 ?auto_141628 ?auto_141629 ?auto_141630 ?auto_141631 ?auto_141635 ?auto_141634 ?auto_141633 )
      ( MAKE-4PILE ?auto_141627 ?auto_141628 ?auto_141629 ?auto_141630 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141641 - BLOCK
      ?auto_141642 - BLOCK
      ?auto_141643 - BLOCK
      ?auto_141644 - BLOCK
      ?auto_141645 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_141645 ) ( CLEAR ?auto_141644 ) ( ON-TABLE ?auto_141641 ) ( ON ?auto_141642 ?auto_141641 ) ( ON ?auto_141643 ?auto_141642 ) ( ON ?auto_141644 ?auto_141643 ) ( not ( = ?auto_141641 ?auto_141642 ) ) ( not ( = ?auto_141641 ?auto_141643 ) ) ( not ( = ?auto_141641 ?auto_141644 ) ) ( not ( = ?auto_141641 ?auto_141645 ) ) ( not ( = ?auto_141642 ?auto_141643 ) ) ( not ( = ?auto_141642 ?auto_141644 ) ) ( not ( = ?auto_141642 ?auto_141645 ) ) ( not ( = ?auto_141643 ?auto_141644 ) ) ( not ( = ?auto_141643 ?auto_141645 ) ) ( not ( = ?auto_141644 ?auto_141645 ) ) )
    :subtasks
    ( ( !STACK ?auto_141645 ?auto_141644 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141646 - BLOCK
      ?auto_141647 - BLOCK
      ?auto_141648 - BLOCK
      ?auto_141649 - BLOCK
      ?auto_141650 - BLOCK
    )
    :vars
    (
      ?auto_141651 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_141649 ) ( ON-TABLE ?auto_141646 ) ( ON ?auto_141647 ?auto_141646 ) ( ON ?auto_141648 ?auto_141647 ) ( ON ?auto_141649 ?auto_141648 ) ( not ( = ?auto_141646 ?auto_141647 ) ) ( not ( = ?auto_141646 ?auto_141648 ) ) ( not ( = ?auto_141646 ?auto_141649 ) ) ( not ( = ?auto_141646 ?auto_141650 ) ) ( not ( = ?auto_141647 ?auto_141648 ) ) ( not ( = ?auto_141647 ?auto_141649 ) ) ( not ( = ?auto_141647 ?auto_141650 ) ) ( not ( = ?auto_141648 ?auto_141649 ) ) ( not ( = ?auto_141648 ?auto_141650 ) ) ( not ( = ?auto_141649 ?auto_141650 ) ) ( ON ?auto_141650 ?auto_141651 ) ( CLEAR ?auto_141650 ) ( HAND-EMPTY ) ( not ( = ?auto_141646 ?auto_141651 ) ) ( not ( = ?auto_141647 ?auto_141651 ) ) ( not ( = ?auto_141648 ?auto_141651 ) ) ( not ( = ?auto_141649 ?auto_141651 ) ) ( not ( = ?auto_141650 ?auto_141651 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_141650 ?auto_141651 )
      ( MAKE-5PILE ?auto_141646 ?auto_141647 ?auto_141648 ?auto_141649 ?auto_141650 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141652 - BLOCK
      ?auto_141653 - BLOCK
      ?auto_141654 - BLOCK
      ?auto_141655 - BLOCK
      ?auto_141656 - BLOCK
    )
    :vars
    (
      ?auto_141657 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141652 ) ( ON ?auto_141653 ?auto_141652 ) ( ON ?auto_141654 ?auto_141653 ) ( not ( = ?auto_141652 ?auto_141653 ) ) ( not ( = ?auto_141652 ?auto_141654 ) ) ( not ( = ?auto_141652 ?auto_141655 ) ) ( not ( = ?auto_141652 ?auto_141656 ) ) ( not ( = ?auto_141653 ?auto_141654 ) ) ( not ( = ?auto_141653 ?auto_141655 ) ) ( not ( = ?auto_141653 ?auto_141656 ) ) ( not ( = ?auto_141654 ?auto_141655 ) ) ( not ( = ?auto_141654 ?auto_141656 ) ) ( not ( = ?auto_141655 ?auto_141656 ) ) ( ON ?auto_141656 ?auto_141657 ) ( CLEAR ?auto_141656 ) ( not ( = ?auto_141652 ?auto_141657 ) ) ( not ( = ?auto_141653 ?auto_141657 ) ) ( not ( = ?auto_141654 ?auto_141657 ) ) ( not ( = ?auto_141655 ?auto_141657 ) ) ( not ( = ?auto_141656 ?auto_141657 ) ) ( HOLDING ?auto_141655 ) ( CLEAR ?auto_141654 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_141652 ?auto_141653 ?auto_141654 ?auto_141655 )
      ( MAKE-5PILE ?auto_141652 ?auto_141653 ?auto_141654 ?auto_141655 ?auto_141656 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141658 - BLOCK
      ?auto_141659 - BLOCK
      ?auto_141660 - BLOCK
      ?auto_141661 - BLOCK
      ?auto_141662 - BLOCK
    )
    :vars
    (
      ?auto_141663 - BLOCK
      ?auto_141666 - BLOCK
      ?auto_141665 - BLOCK
      ?auto_141664 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141658 ) ( ON ?auto_141659 ?auto_141658 ) ( ON ?auto_141660 ?auto_141659 ) ( not ( = ?auto_141658 ?auto_141659 ) ) ( not ( = ?auto_141658 ?auto_141660 ) ) ( not ( = ?auto_141658 ?auto_141661 ) ) ( not ( = ?auto_141658 ?auto_141662 ) ) ( not ( = ?auto_141659 ?auto_141660 ) ) ( not ( = ?auto_141659 ?auto_141661 ) ) ( not ( = ?auto_141659 ?auto_141662 ) ) ( not ( = ?auto_141660 ?auto_141661 ) ) ( not ( = ?auto_141660 ?auto_141662 ) ) ( not ( = ?auto_141661 ?auto_141662 ) ) ( ON ?auto_141662 ?auto_141663 ) ( not ( = ?auto_141658 ?auto_141663 ) ) ( not ( = ?auto_141659 ?auto_141663 ) ) ( not ( = ?auto_141660 ?auto_141663 ) ) ( not ( = ?auto_141661 ?auto_141663 ) ) ( not ( = ?auto_141662 ?auto_141663 ) ) ( CLEAR ?auto_141660 ) ( ON ?auto_141661 ?auto_141662 ) ( CLEAR ?auto_141661 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_141666 ) ( ON ?auto_141665 ?auto_141666 ) ( ON ?auto_141664 ?auto_141665 ) ( ON ?auto_141663 ?auto_141664 ) ( not ( = ?auto_141666 ?auto_141665 ) ) ( not ( = ?auto_141666 ?auto_141664 ) ) ( not ( = ?auto_141666 ?auto_141663 ) ) ( not ( = ?auto_141666 ?auto_141662 ) ) ( not ( = ?auto_141666 ?auto_141661 ) ) ( not ( = ?auto_141665 ?auto_141664 ) ) ( not ( = ?auto_141665 ?auto_141663 ) ) ( not ( = ?auto_141665 ?auto_141662 ) ) ( not ( = ?auto_141665 ?auto_141661 ) ) ( not ( = ?auto_141664 ?auto_141663 ) ) ( not ( = ?auto_141664 ?auto_141662 ) ) ( not ( = ?auto_141664 ?auto_141661 ) ) ( not ( = ?auto_141658 ?auto_141666 ) ) ( not ( = ?auto_141658 ?auto_141665 ) ) ( not ( = ?auto_141658 ?auto_141664 ) ) ( not ( = ?auto_141659 ?auto_141666 ) ) ( not ( = ?auto_141659 ?auto_141665 ) ) ( not ( = ?auto_141659 ?auto_141664 ) ) ( not ( = ?auto_141660 ?auto_141666 ) ) ( not ( = ?auto_141660 ?auto_141665 ) ) ( not ( = ?auto_141660 ?auto_141664 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_141666 ?auto_141665 ?auto_141664 ?auto_141663 ?auto_141662 )
      ( MAKE-5PILE ?auto_141658 ?auto_141659 ?auto_141660 ?auto_141661 ?auto_141662 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141667 - BLOCK
      ?auto_141668 - BLOCK
      ?auto_141669 - BLOCK
      ?auto_141670 - BLOCK
      ?auto_141671 - BLOCK
    )
    :vars
    (
      ?auto_141673 - BLOCK
      ?auto_141674 - BLOCK
      ?auto_141675 - BLOCK
      ?auto_141672 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141667 ) ( ON ?auto_141668 ?auto_141667 ) ( not ( = ?auto_141667 ?auto_141668 ) ) ( not ( = ?auto_141667 ?auto_141669 ) ) ( not ( = ?auto_141667 ?auto_141670 ) ) ( not ( = ?auto_141667 ?auto_141671 ) ) ( not ( = ?auto_141668 ?auto_141669 ) ) ( not ( = ?auto_141668 ?auto_141670 ) ) ( not ( = ?auto_141668 ?auto_141671 ) ) ( not ( = ?auto_141669 ?auto_141670 ) ) ( not ( = ?auto_141669 ?auto_141671 ) ) ( not ( = ?auto_141670 ?auto_141671 ) ) ( ON ?auto_141671 ?auto_141673 ) ( not ( = ?auto_141667 ?auto_141673 ) ) ( not ( = ?auto_141668 ?auto_141673 ) ) ( not ( = ?auto_141669 ?auto_141673 ) ) ( not ( = ?auto_141670 ?auto_141673 ) ) ( not ( = ?auto_141671 ?auto_141673 ) ) ( ON ?auto_141670 ?auto_141671 ) ( CLEAR ?auto_141670 ) ( ON-TABLE ?auto_141674 ) ( ON ?auto_141675 ?auto_141674 ) ( ON ?auto_141672 ?auto_141675 ) ( ON ?auto_141673 ?auto_141672 ) ( not ( = ?auto_141674 ?auto_141675 ) ) ( not ( = ?auto_141674 ?auto_141672 ) ) ( not ( = ?auto_141674 ?auto_141673 ) ) ( not ( = ?auto_141674 ?auto_141671 ) ) ( not ( = ?auto_141674 ?auto_141670 ) ) ( not ( = ?auto_141675 ?auto_141672 ) ) ( not ( = ?auto_141675 ?auto_141673 ) ) ( not ( = ?auto_141675 ?auto_141671 ) ) ( not ( = ?auto_141675 ?auto_141670 ) ) ( not ( = ?auto_141672 ?auto_141673 ) ) ( not ( = ?auto_141672 ?auto_141671 ) ) ( not ( = ?auto_141672 ?auto_141670 ) ) ( not ( = ?auto_141667 ?auto_141674 ) ) ( not ( = ?auto_141667 ?auto_141675 ) ) ( not ( = ?auto_141667 ?auto_141672 ) ) ( not ( = ?auto_141668 ?auto_141674 ) ) ( not ( = ?auto_141668 ?auto_141675 ) ) ( not ( = ?auto_141668 ?auto_141672 ) ) ( not ( = ?auto_141669 ?auto_141674 ) ) ( not ( = ?auto_141669 ?auto_141675 ) ) ( not ( = ?auto_141669 ?auto_141672 ) ) ( HOLDING ?auto_141669 ) ( CLEAR ?auto_141668 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_141667 ?auto_141668 ?auto_141669 )
      ( MAKE-5PILE ?auto_141667 ?auto_141668 ?auto_141669 ?auto_141670 ?auto_141671 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141676 - BLOCK
      ?auto_141677 - BLOCK
      ?auto_141678 - BLOCK
      ?auto_141679 - BLOCK
      ?auto_141680 - BLOCK
    )
    :vars
    (
      ?auto_141682 - BLOCK
      ?auto_141684 - BLOCK
      ?auto_141681 - BLOCK
      ?auto_141683 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141676 ) ( ON ?auto_141677 ?auto_141676 ) ( not ( = ?auto_141676 ?auto_141677 ) ) ( not ( = ?auto_141676 ?auto_141678 ) ) ( not ( = ?auto_141676 ?auto_141679 ) ) ( not ( = ?auto_141676 ?auto_141680 ) ) ( not ( = ?auto_141677 ?auto_141678 ) ) ( not ( = ?auto_141677 ?auto_141679 ) ) ( not ( = ?auto_141677 ?auto_141680 ) ) ( not ( = ?auto_141678 ?auto_141679 ) ) ( not ( = ?auto_141678 ?auto_141680 ) ) ( not ( = ?auto_141679 ?auto_141680 ) ) ( ON ?auto_141680 ?auto_141682 ) ( not ( = ?auto_141676 ?auto_141682 ) ) ( not ( = ?auto_141677 ?auto_141682 ) ) ( not ( = ?auto_141678 ?auto_141682 ) ) ( not ( = ?auto_141679 ?auto_141682 ) ) ( not ( = ?auto_141680 ?auto_141682 ) ) ( ON ?auto_141679 ?auto_141680 ) ( ON-TABLE ?auto_141684 ) ( ON ?auto_141681 ?auto_141684 ) ( ON ?auto_141683 ?auto_141681 ) ( ON ?auto_141682 ?auto_141683 ) ( not ( = ?auto_141684 ?auto_141681 ) ) ( not ( = ?auto_141684 ?auto_141683 ) ) ( not ( = ?auto_141684 ?auto_141682 ) ) ( not ( = ?auto_141684 ?auto_141680 ) ) ( not ( = ?auto_141684 ?auto_141679 ) ) ( not ( = ?auto_141681 ?auto_141683 ) ) ( not ( = ?auto_141681 ?auto_141682 ) ) ( not ( = ?auto_141681 ?auto_141680 ) ) ( not ( = ?auto_141681 ?auto_141679 ) ) ( not ( = ?auto_141683 ?auto_141682 ) ) ( not ( = ?auto_141683 ?auto_141680 ) ) ( not ( = ?auto_141683 ?auto_141679 ) ) ( not ( = ?auto_141676 ?auto_141684 ) ) ( not ( = ?auto_141676 ?auto_141681 ) ) ( not ( = ?auto_141676 ?auto_141683 ) ) ( not ( = ?auto_141677 ?auto_141684 ) ) ( not ( = ?auto_141677 ?auto_141681 ) ) ( not ( = ?auto_141677 ?auto_141683 ) ) ( not ( = ?auto_141678 ?auto_141684 ) ) ( not ( = ?auto_141678 ?auto_141681 ) ) ( not ( = ?auto_141678 ?auto_141683 ) ) ( CLEAR ?auto_141677 ) ( ON ?auto_141678 ?auto_141679 ) ( CLEAR ?auto_141678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_141684 ?auto_141681 ?auto_141683 ?auto_141682 ?auto_141680 ?auto_141679 )
      ( MAKE-5PILE ?auto_141676 ?auto_141677 ?auto_141678 ?auto_141679 ?auto_141680 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141685 - BLOCK
      ?auto_141686 - BLOCK
      ?auto_141687 - BLOCK
      ?auto_141688 - BLOCK
      ?auto_141689 - BLOCK
    )
    :vars
    (
      ?auto_141690 - BLOCK
      ?auto_141692 - BLOCK
      ?auto_141693 - BLOCK
      ?auto_141691 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141685 ) ( not ( = ?auto_141685 ?auto_141686 ) ) ( not ( = ?auto_141685 ?auto_141687 ) ) ( not ( = ?auto_141685 ?auto_141688 ) ) ( not ( = ?auto_141685 ?auto_141689 ) ) ( not ( = ?auto_141686 ?auto_141687 ) ) ( not ( = ?auto_141686 ?auto_141688 ) ) ( not ( = ?auto_141686 ?auto_141689 ) ) ( not ( = ?auto_141687 ?auto_141688 ) ) ( not ( = ?auto_141687 ?auto_141689 ) ) ( not ( = ?auto_141688 ?auto_141689 ) ) ( ON ?auto_141689 ?auto_141690 ) ( not ( = ?auto_141685 ?auto_141690 ) ) ( not ( = ?auto_141686 ?auto_141690 ) ) ( not ( = ?auto_141687 ?auto_141690 ) ) ( not ( = ?auto_141688 ?auto_141690 ) ) ( not ( = ?auto_141689 ?auto_141690 ) ) ( ON ?auto_141688 ?auto_141689 ) ( ON-TABLE ?auto_141692 ) ( ON ?auto_141693 ?auto_141692 ) ( ON ?auto_141691 ?auto_141693 ) ( ON ?auto_141690 ?auto_141691 ) ( not ( = ?auto_141692 ?auto_141693 ) ) ( not ( = ?auto_141692 ?auto_141691 ) ) ( not ( = ?auto_141692 ?auto_141690 ) ) ( not ( = ?auto_141692 ?auto_141689 ) ) ( not ( = ?auto_141692 ?auto_141688 ) ) ( not ( = ?auto_141693 ?auto_141691 ) ) ( not ( = ?auto_141693 ?auto_141690 ) ) ( not ( = ?auto_141693 ?auto_141689 ) ) ( not ( = ?auto_141693 ?auto_141688 ) ) ( not ( = ?auto_141691 ?auto_141690 ) ) ( not ( = ?auto_141691 ?auto_141689 ) ) ( not ( = ?auto_141691 ?auto_141688 ) ) ( not ( = ?auto_141685 ?auto_141692 ) ) ( not ( = ?auto_141685 ?auto_141693 ) ) ( not ( = ?auto_141685 ?auto_141691 ) ) ( not ( = ?auto_141686 ?auto_141692 ) ) ( not ( = ?auto_141686 ?auto_141693 ) ) ( not ( = ?auto_141686 ?auto_141691 ) ) ( not ( = ?auto_141687 ?auto_141692 ) ) ( not ( = ?auto_141687 ?auto_141693 ) ) ( not ( = ?auto_141687 ?auto_141691 ) ) ( ON ?auto_141687 ?auto_141688 ) ( CLEAR ?auto_141687 ) ( HOLDING ?auto_141686 ) ( CLEAR ?auto_141685 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_141685 ?auto_141686 )
      ( MAKE-5PILE ?auto_141685 ?auto_141686 ?auto_141687 ?auto_141688 ?auto_141689 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141694 - BLOCK
      ?auto_141695 - BLOCK
      ?auto_141696 - BLOCK
      ?auto_141697 - BLOCK
      ?auto_141698 - BLOCK
    )
    :vars
    (
      ?auto_141699 - BLOCK
      ?auto_141702 - BLOCK
      ?auto_141700 - BLOCK
      ?auto_141701 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141694 ) ( not ( = ?auto_141694 ?auto_141695 ) ) ( not ( = ?auto_141694 ?auto_141696 ) ) ( not ( = ?auto_141694 ?auto_141697 ) ) ( not ( = ?auto_141694 ?auto_141698 ) ) ( not ( = ?auto_141695 ?auto_141696 ) ) ( not ( = ?auto_141695 ?auto_141697 ) ) ( not ( = ?auto_141695 ?auto_141698 ) ) ( not ( = ?auto_141696 ?auto_141697 ) ) ( not ( = ?auto_141696 ?auto_141698 ) ) ( not ( = ?auto_141697 ?auto_141698 ) ) ( ON ?auto_141698 ?auto_141699 ) ( not ( = ?auto_141694 ?auto_141699 ) ) ( not ( = ?auto_141695 ?auto_141699 ) ) ( not ( = ?auto_141696 ?auto_141699 ) ) ( not ( = ?auto_141697 ?auto_141699 ) ) ( not ( = ?auto_141698 ?auto_141699 ) ) ( ON ?auto_141697 ?auto_141698 ) ( ON-TABLE ?auto_141702 ) ( ON ?auto_141700 ?auto_141702 ) ( ON ?auto_141701 ?auto_141700 ) ( ON ?auto_141699 ?auto_141701 ) ( not ( = ?auto_141702 ?auto_141700 ) ) ( not ( = ?auto_141702 ?auto_141701 ) ) ( not ( = ?auto_141702 ?auto_141699 ) ) ( not ( = ?auto_141702 ?auto_141698 ) ) ( not ( = ?auto_141702 ?auto_141697 ) ) ( not ( = ?auto_141700 ?auto_141701 ) ) ( not ( = ?auto_141700 ?auto_141699 ) ) ( not ( = ?auto_141700 ?auto_141698 ) ) ( not ( = ?auto_141700 ?auto_141697 ) ) ( not ( = ?auto_141701 ?auto_141699 ) ) ( not ( = ?auto_141701 ?auto_141698 ) ) ( not ( = ?auto_141701 ?auto_141697 ) ) ( not ( = ?auto_141694 ?auto_141702 ) ) ( not ( = ?auto_141694 ?auto_141700 ) ) ( not ( = ?auto_141694 ?auto_141701 ) ) ( not ( = ?auto_141695 ?auto_141702 ) ) ( not ( = ?auto_141695 ?auto_141700 ) ) ( not ( = ?auto_141695 ?auto_141701 ) ) ( not ( = ?auto_141696 ?auto_141702 ) ) ( not ( = ?auto_141696 ?auto_141700 ) ) ( not ( = ?auto_141696 ?auto_141701 ) ) ( ON ?auto_141696 ?auto_141697 ) ( CLEAR ?auto_141694 ) ( ON ?auto_141695 ?auto_141696 ) ( CLEAR ?auto_141695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_141702 ?auto_141700 ?auto_141701 ?auto_141699 ?auto_141698 ?auto_141697 ?auto_141696 )
      ( MAKE-5PILE ?auto_141694 ?auto_141695 ?auto_141696 ?auto_141697 ?auto_141698 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141703 - BLOCK
      ?auto_141704 - BLOCK
      ?auto_141705 - BLOCK
      ?auto_141706 - BLOCK
      ?auto_141707 - BLOCK
    )
    :vars
    (
      ?auto_141710 - BLOCK
      ?auto_141709 - BLOCK
      ?auto_141711 - BLOCK
      ?auto_141708 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141703 ?auto_141704 ) ) ( not ( = ?auto_141703 ?auto_141705 ) ) ( not ( = ?auto_141703 ?auto_141706 ) ) ( not ( = ?auto_141703 ?auto_141707 ) ) ( not ( = ?auto_141704 ?auto_141705 ) ) ( not ( = ?auto_141704 ?auto_141706 ) ) ( not ( = ?auto_141704 ?auto_141707 ) ) ( not ( = ?auto_141705 ?auto_141706 ) ) ( not ( = ?auto_141705 ?auto_141707 ) ) ( not ( = ?auto_141706 ?auto_141707 ) ) ( ON ?auto_141707 ?auto_141710 ) ( not ( = ?auto_141703 ?auto_141710 ) ) ( not ( = ?auto_141704 ?auto_141710 ) ) ( not ( = ?auto_141705 ?auto_141710 ) ) ( not ( = ?auto_141706 ?auto_141710 ) ) ( not ( = ?auto_141707 ?auto_141710 ) ) ( ON ?auto_141706 ?auto_141707 ) ( ON-TABLE ?auto_141709 ) ( ON ?auto_141711 ?auto_141709 ) ( ON ?auto_141708 ?auto_141711 ) ( ON ?auto_141710 ?auto_141708 ) ( not ( = ?auto_141709 ?auto_141711 ) ) ( not ( = ?auto_141709 ?auto_141708 ) ) ( not ( = ?auto_141709 ?auto_141710 ) ) ( not ( = ?auto_141709 ?auto_141707 ) ) ( not ( = ?auto_141709 ?auto_141706 ) ) ( not ( = ?auto_141711 ?auto_141708 ) ) ( not ( = ?auto_141711 ?auto_141710 ) ) ( not ( = ?auto_141711 ?auto_141707 ) ) ( not ( = ?auto_141711 ?auto_141706 ) ) ( not ( = ?auto_141708 ?auto_141710 ) ) ( not ( = ?auto_141708 ?auto_141707 ) ) ( not ( = ?auto_141708 ?auto_141706 ) ) ( not ( = ?auto_141703 ?auto_141709 ) ) ( not ( = ?auto_141703 ?auto_141711 ) ) ( not ( = ?auto_141703 ?auto_141708 ) ) ( not ( = ?auto_141704 ?auto_141709 ) ) ( not ( = ?auto_141704 ?auto_141711 ) ) ( not ( = ?auto_141704 ?auto_141708 ) ) ( not ( = ?auto_141705 ?auto_141709 ) ) ( not ( = ?auto_141705 ?auto_141711 ) ) ( not ( = ?auto_141705 ?auto_141708 ) ) ( ON ?auto_141705 ?auto_141706 ) ( ON ?auto_141704 ?auto_141705 ) ( CLEAR ?auto_141704 ) ( HOLDING ?auto_141703 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_141703 )
      ( MAKE-5PILE ?auto_141703 ?auto_141704 ?auto_141705 ?auto_141706 ?auto_141707 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141712 - BLOCK
      ?auto_141713 - BLOCK
      ?auto_141714 - BLOCK
      ?auto_141715 - BLOCK
      ?auto_141716 - BLOCK
    )
    :vars
    (
      ?auto_141717 - BLOCK
      ?auto_141718 - BLOCK
      ?auto_141720 - BLOCK
      ?auto_141719 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141712 ?auto_141713 ) ) ( not ( = ?auto_141712 ?auto_141714 ) ) ( not ( = ?auto_141712 ?auto_141715 ) ) ( not ( = ?auto_141712 ?auto_141716 ) ) ( not ( = ?auto_141713 ?auto_141714 ) ) ( not ( = ?auto_141713 ?auto_141715 ) ) ( not ( = ?auto_141713 ?auto_141716 ) ) ( not ( = ?auto_141714 ?auto_141715 ) ) ( not ( = ?auto_141714 ?auto_141716 ) ) ( not ( = ?auto_141715 ?auto_141716 ) ) ( ON ?auto_141716 ?auto_141717 ) ( not ( = ?auto_141712 ?auto_141717 ) ) ( not ( = ?auto_141713 ?auto_141717 ) ) ( not ( = ?auto_141714 ?auto_141717 ) ) ( not ( = ?auto_141715 ?auto_141717 ) ) ( not ( = ?auto_141716 ?auto_141717 ) ) ( ON ?auto_141715 ?auto_141716 ) ( ON-TABLE ?auto_141718 ) ( ON ?auto_141720 ?auto_141718 ) ( ON ?auto_141719 ?auto_141720 ) ( ON ?auto_141717 ?auto_141719 ) ( not ( = ?auto_141718 ?auto_141720 ) ) ( not ( = ?auto_141718 ?auto_141719 ) ) ( not ( = ?auto_141718 ?auto_141717 ) ) ( not ( = ?auto_141718 ?auto_141716 ) ) ( not ( = ?auto_141718 ?auto_141715 ) ) ( not ( = ?auto_141720 ?auto_141719 ) ) ( not ( = ?auto_141720 ?auto_141717 ) ) ( not ( = ?auto_141720 ?auto_141716 ) ) ( not ( = ?auto_141720 ?auto_141715 ) ) ( not ( = ?auto_141719 ?auto_141717 ) ) ( not ( = ?auto_141719 ?auto_141716 ) ) ( not ( = ?auto_141719 ?auto_141715 ) ) ( not ( = ?auto_141712 ?auto_141718 ) ) ( not ( = ?auto_141712 ?auto_141720 ) ) ( not ( = ?auto_141712 ?auto_141719 ) ) ( not ( = ?auto_141713 ?auto_141718 ) ) ( not ( = ?auto_141713 ?auto_141720 ) ) ( not ( = ?auto_141713 ?auto_141719 ) ) ( not ( = ?auto_141714 ?auto_141718 ) ) ( not ( = ?auto_141714 ?auto_141720 ) ) ( not ( = ?auto_141714 ?auto_141719 ) ) ( ON ?auto_141714 ?auto_141715 ) ( ON ?auto_141713 ?auto_141714 ) ( ON ?auto_141712 ?auto_141713 ) ( CLEAR ?auto_141712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_141718 ?auto_141720 ?auto_141719 ?auto_141717 ?auto_141716 ?auto_141715 ?auto_141714 ?auto_141713 )
      ( MAKE-5PILE ?auto_141712 ?auto_141713 ?auto_141714 ?auto_141715 ?auto_141716 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141724 - BLOCK
      ?auto_141725 - BLOCK
      ?auto_141726 - BLOCK
    )
    :vars
    (
      ?auto_141727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141727 ?auto_141726 ) ( CLEAR ?auto_141727 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_141724 ) ( ON ?auto_141725 ?auto_141724 ) ( ON ?auto_141726 ?auto_141725 ) ( not ( = ?auto_141724 ?auto_141725 ) ) ( not ( = ?auto_141724 ?auto_141726 ) ) ( not ( = ?auto_141724 ?auto_141727 ) ) ( not ( = ?auto_141725 ?auto_141726 ) ) ( not ( = ?auto_141725 ?auto_141727 ) ) ( not ( = ?auto_141726 ?auto_141727 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_141727 ?auto_141726 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141728 - BLOCK
      ?auto_141729 - BLOCK
      ?auto_141730 - BLOCK
    )
    :vars
    (
      ?auto_141731 - BLOCK
      ?auto_141732 - BLOCK
      ?auto_141733 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141731 ?auto_141730 ) ( CLEAR ?auto_141731 ) ( ON-TABLE ?auto_141728 ) ( ON ?auto_141729 ?auto_141728 ) ( ON ?auto_141730 ?auto_141729 ) ( not ( = ?auto_141728 ?auto_141729 ) ) ( not ( = ?auto_141728 ?auto_141730 ) ) ( not ( = ?auto_141728 ?auto_141731 ) ) ( not ( = ?auto_141729 ?auto_141730 ) ) ( not ( = ?auto_141729 ?auto_141731 ) ) ( not ( = ?auto_141730 ?auto_141731 ) ) ( HOLDING ?auto_141732 ) ( CLEAR ?auto_141733 ) ( not ( = ?auto_141728 ?auto_141732 ) ) ( not ( = ?auto_141728 ?auto_141733 ) ) ( not ( = ?auto_141729 ?auto_141732 ) ) ( not ( = ?auto_141729 ?auto_141733 ) ) ( not ( = ?auto_141730 ?auto_141732 ) ) ( not ( = ?auto_141730 ?auto_141733 ) ) ( not ( = ?auto_141731 ?auto_141732 ) ) ( not ( = ?auto_141731 ?auto_141733 ) ) ( not ( = ?auto_141732 ?auto_141733 ) ) )
    :subtasks
    ( ( !STACK ?auto_141732 ?auto_141733 )
      ( MAKE-3PILE ?auto_141728 ?auto_141729 ?auto_141730 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141734 - BLOCK
      ?auto_141735 - BLOCK
      ?auto_141736 - BLOCK
    )
    :vars
    (
      ?auto_141737 - BLOCK
      ?auto_141739 - BLOCK
      ?auto_141738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141737 ?auto_141736 ) ( ON-TABLE ?auto_141734 ) ( ON ?auto_141735 ?auto_141734 ) ( ON ?auto_141736 ?auto_141735 ) ( not ( = ?auto_141734 ?auto_141735 ) ) ( not ( = ?auto_141734 ?auto_141736 ) ) ( not ( = ?auto_141734 ?auto_141737 ) ) ( not ( = ?auto_141735 ?auto_141736 ) ) ( not ( = ?auto_141735 ?auto_141737 ) ) ( not ( = ?auto_141736 ?auto_141737 ) ) ( CLEAR ?auto_141739 ) ( not ( = ?auto_141734 ?auto_141738 ) ) ( not ( = ?auto_141734 ?auto_141739 ) ) ( not ( = ?auto_141735 ?auto_141738 ) ) ( not ( = ?auto_141735 ?auto_141739 ) ) ( not ( = ?auto_141736 ?auto_141738 ) ) ( not ( = ?auto_141736 ?auto_141739 ) ) ( not ( = ?auto_141737 ?auto_141738 ) ) ( not ( = ?auto_141737 ?auto_141739 ) ) ( not ( = ?auto_141738 ?auto_141739 ) ) ( ON ?auto_141738 ?auto_141737 ) ( CLEAR ?auto_141738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_141734 ?auto_141735 ?auto_141736 ?auto_141737 )
      ( MAKE-3PILE ?auto_141734 ?auto_141735 ?auto_141736 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141740 - BLOCK
      ?auto_141741 - BLOCK
      ?auto_141742 - BLOCK
    )
    :vars
    (
      ?auto_141743 - BLOCK
      ?auto_141745 - BLOCK
      ?auto_141744 - BLOCK
      ?auto_141748 - BLOCK
      ?auto_141747 - BLOCK
      ?auto_141746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141743 ?auto_141742 ) ( ON-TABLE ?auto_141740 ) ( ON ?auto_141741 ?auto_141740 ) ( ON ?auto_141742 ?auto_141741 ) ( not ( = ?auto_141740 ?auto_141741 ) ) ( not ( = ?auto_141740 ?auto_141742 ) ) ( not ( = ?auto_141740 ?auto_141743 ) ) ( not ( = ?auto_141741 ?auto_141742 ) ) ( not ( = ?auto_141741 ?auto_141743 ) ) ( not ( = ?auto_141742 ?auto_141743 ) ) ( not ( = ?auto_141740 ?auto_141745 ) ) ( not ( = ?auto_141740 ?auto_141744 ) ) ( not ( = ?auto_141741 ?auto_141745 ) ) ( not ( = ?auto_141741 ?auto_141744 ) ) ( not ( = ?auto_141742 ?auto_141745 ) ) ( not ( = ?auto_141742 ?auto_141744 ) ) ( not ( = ?auto_141743 ?auto_141745 ) ) ( not ( = ?auto_141743 ?auto_141744 ) ) ( not ( = ?auto_141745 ?auto_141744 ) ) ( ON ?auto_141745 ?auto_141743 ) ( CLEAR ?auto_141745 ) ( HOLDING ?auto_141744 ) ( CLEAR ?auto_141748 ) ( ON-TABLE ?auto_141747 ) ( ON ?auto_141746 ?auto_141747 ) ( ON ?auto_141748 ?auto_141746 ) ( not ( = ?auto_141747 ?auto_141746 ) ) ( not ( = ?auto_141747 ?auto_141748 ) ) ( not ( = ?auto_141747 ?auto_141744 ) ) ( not ( = ?auto_141746 ?auto_141748 ) ) ( not ( = ?auto_141746 ?auto_141744 ) ) ( not ( = ?auto_141748 ?auto_141744 ) ) ( not ( = ?auto_141740 ?auto_141748 ) ) ( not ( = ?auto_141740 ?auto_141747 ) ) ( not ( = ?auto_141740 ?auto_141746 ) ) ( not ( = ?auto_141741 ?auto_141748 ) ) ( not ( = ?auto_141741 ?auto_141747 ) ) ( not ( = ?auto_141741 ?auto_141746 ) ) ( not ( = ?auto_141742 ?auto_141748 ) ) ( not ( = ?auto_141742 ?auto_141747 ) ) ( not ( = ?auto_141742 ?auto_141746 ) ) ( not ( = ?auto_141743 ?auto_141748 ) ) ( not ( = ?auto_141743 ?auto_141747 ) ) ( not ( = ?auto_141743 ?auto_141746 ) ) ( not ( = ?auto_141745 ?auto_141748 ) ) ( not ( = ?auto_141745 ?auto_141747 ) ) ( not ( = ?auto_141745 ?auto_141746 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_141747 ?auto_141746 ?auto_141748 ?auto_141744 )
      ( MAKE-3PILE ?auto_141740 ?auto_141741 ?auto_141742 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141749 - BLOCK
      ?auto_141750 - BLOCK
      ?auto_141751 - BLOCK
    )
    :vars
    (
      ?auto_141754 - BLOCK
      ?auto_141755 - BLOCK
      ?auto_141753 - BLOCK
      ?auto_141756 - BLOCK
      ?auto_141757 - BLOCK
      ?auto_141752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141754 ?auto_141751 ) ( ON-TABLE ?auto_141749 ) ( ON ?auto_141750 ?auto_141749 ) ( ON ?auto_141751 ?auto_141750 ) ( not ( = ?auto_141749 ?auto_141750 ) ) ( not ( = ?auto_141749 ?auto_141751 ) ) ( not ( = ?auto_141749 ?auto_141754 ) ) ( not ( = ?auto_141750 ?auto_141751 ) ) ( not ( = ?auto_141750 ?auto_141754 ) ) ( not ( = ?auto_141751 ?auto_141754 ) ) ( not ( = ?auto_141749 ?auto_141755 ) ) ( not ( = ?auto_141749 ?auto_141753 ) ) ( not ( = ?auto_141750 ?auto_141755 ) ) ( not ( = ?auto_141750 ?auto_141753 ) ) ( not ( = ?auto_141751 ?auto_141755 ) ) ( not ( = ?auto_141751 ?auto_141753 ) ) ( not ( = ?auto_141754 ?auto_141755 ) ) ( not ( = ?auto_141754 ?auto_141753 ) ) ( not ( = ?auto_141755 ?auto_141753 ) ) ( ON ?auto_141755 ?auto_141754 ) ( CLEAR ?auto_141756 ) ( ON-TABLE ?auto_141757 ) ( ON ?auto_141752 ?auto_141757 ) ( ON ?auto_141756 ?auto_141752 ) ( not ( = ?auto_141757 ?auto_141752 ) ) ( not ( = ?auto_141757 ?auto_141756 ) ) ( not ( = ?auto_141757 ?auto_141753 ) ) ( not ( = ?auto_141752 ?auto_141756 ) ) ( not ( = ?auto_141752 ?auto_141753 ) ) ( not ( = ?auto_141756 ?auto_141753 ) ) ( not ( = ?auto_141749 ?auto_141756 ) ) ( not ( = ?auto_141749 ?auto_141757 ) ) ( not ( = ?auto_141749 ?auto_141752 ) ) ( not ( = ?auto_141750 ?auto_141756 ) ) ( not ( = ?auto_141750 ?auto_141757 ) ) ( not ( = ?auto_141750 ?auto_141752 ) ) ( not ( = ?auto_141751 ?auto_141756 ) ) ( not ( = ?auto_141751 ?auto_141757 ) ) ( not ( = ?auto_141751 ?auto_141752 ) ) ( not ( = ?auto_141754 ?auto_141756 ) ) ( not ( = ?auto_141754 ?auto_141757 ) ) ( not ( = ?auto_141754 ?auto_141752 ) ) ( not ( = ?auto_141755 ?auto_141756 ) ) ( not ( = ?auto_141755 ?auto_141757 ) ) ( not ( = ?auto_141755 ?auto_141752 ) ) ( ON ?auto_141753 ?auto_141755 ) ( CLEAR ?auto_141753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_141749 ?auto_141750 ?auto_141751 ?auto_141754 ?auto_141755 )
      ( MAKE-3PILE ?auto_141749 ?auto_141750 ?auto_141751 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141758 - BLOCK
      ?auto_141759 - BLOCK
      ?auto_141760 - BLOCK
    )
    :vars
    (
      ?auto_141766 - BLOCK
      ?auto_141765 - BLOCK
      ?auto_141763 - BLOCK
      ?auto_141764 - BLOCK
      ?auto_141762 - BLOCK
      ?auto_141761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141766 ?auto_141760 ) ( ON-TABLE ?auto_141758 ) ( ON ?auto_141759 ?auto_141758 ) ( ON ?auto_141760 ?auto_141759 ) ( not ( = ?auto_141758 ?auto_141759 ) ) ( not ( = ?auto_141758 ?auto_141760 ) ) ( not ( = ?auto_141758 ?auto_141766 ) ) ( not ( = ?auto_141759 ?auto_141760 ) ) ( not ( = ?auto_141759 ?auto_141766 ) ) ( not ( = ?auto_141760 ?auto_141766 ) ) ( not ( = ?auto_141758 ?auto_141765 ) ) ( not ( = ?auto_141758 ?auto_141763 ) ) ( not ( = ?auto_141759 ?auto_141765 ) ) ( not ( = ?auto_141759 ?auto_141763 ) ) ( not ( = ?auto_141760 ?auto_141765 ) ) ( not ( = ?auto_141760 ?auto_141763 ) ) ( not ( = ?auto_141766 ?auto_141765 ) ) ( not ( = ?auto_141766 ?auto_141763 ) ) ( not ( = ?auto_141765 ?auto_141763 ) ) ( ON ?auto_141765 ?auto_141766 ) ( ON-TABLE ?auto_141764 ) ( ON ?auto_141762 ?auto_141764 ) ( not ( = ?auto_141764 ?auto_141762 ) ) ( not ( = ?auto_141764 ?auto_141761 ) ) ( not ( = ?auto_141764 ?auto_141763 ) ) ( not ( = ?auto_141762 ?auto_141761 ) ) ( not ( = ?auto_141762 ?auto_141763 ) ) ( not ( = ?auto_141761 ?auto_141763 ) ) ( not ( = ?auto_141758 ?auto_141761 ) ) ( not ( = ?auto_141758 ?auto_141764 ) ) ( not ( = ?auto_141758 ?auto_141762 ) ) ( not ( = ?auto_141759 ?auto_141761 ) ) ( not ( = ?auto_141759 ?auto_141764 ) ) ( not ( = ?auto_141759 ?auto_141762 ) ) ( not ( = ?auto_141760 ?auto_141761 ) ) ( not ( = ?auto_141760 ?auto_141764 ) ) ( not ( = ?auto_141760 ?auto_141762 ) ) ( not ( = ?auto_141766 ?auto_141761 ) ) ( not ( = ?auto_141766 ?auto_141764 ) ) ( not ( = ?auto_141766 ?auto_141762 ) ) ( not ( = ?auto_141765 ?auto_141761 ) ) ( not ( = ?auto_141765 ?auto_141764 ) ) ( not ( = ?auto_141765 ?auto_141762 ) ) ( ON ?auto_141763 ?auto_141765 ) ( CLEAR ?auto_141763 ) ( HOLDING ?auto_141761 ) ( CLEAR ?auto_141762 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_141764 ?auto_141762 ?auto_141761 )
      ( MAKE-3PILE ?auto_141758 ?auto_141759 ?auto_141760 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141767 - BLOCK
      ?auto_141768 - BLOCK
      ?auto_141769 - BLOCK
    )
    :vars
    (
      ?auto_141774 - BLOCK
      ?auto_141770 - BLOCK
      ?auto_141772 - BLOCK
      ?auto_141775 - BLOCK
      ?auto_141773 - BLOCK
      ?auto_141771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141774 ?auto_141769 ) ( ON-TABLE ?auto_141767 ) ( ON ?auto_141768 ?auto_141767 ) ( ON ?auto_141769 ?auto_141768 ) ( not ( = ?auto_141767 ?auto_141768 ) ) ( not ( = ?auto_141767 ?auto_141769 ) ) ( not ( = ?auto_141767 ?auto_141774 ) ) ( not ( = ?auto_141768 ?auto_141769 ) ) ( not ( = ?auto_141768 ?auto_141774 ) ) ( not ( = ?auto_141769 ?auto_141774 ) ) ( not ( = ?auto_141767 ?auto_141770 ) ) ( not ( = ?auto_141767 ?auto_141772 ) ) ( not ( = ?auto_141768 ?auto_141770 ) ) ( not ( = ?auto_141768 ?auto_141772 ) ) ( not ( = ?auto_141769 ?auto_141770 ) ) ( not ( = ?auto_141769 ?auto_141772 ) ) ( not ( = ?auto_141774 ?auto_141770 ) ) ( not ( = ?auto_141774 ?auto_141772 ) ) ( not ( = ?auto_141770 ?auto_141772 ) ) ( ON ?auto_141770 ?auto_141774 ) ( ON-TABLE ?auto_141775 ) ( ON ?auto_141773 ?auto_141775 ) ( not ( = ?auto_141775 ?auto_141773 ) ) ( not ( = ?auto_141775 ?auto_141771 ) ) ( not ( = ?auto_141775 ?auto_141772 ) ) ( not ( = ?auto_141773 ?auto_141771 ) ) ( not ( = ?auto_141773 ?auto_141772 ) ) ( not ( = ?auto_141771 ?auto_141772 ) ) ( not ( = ?auto_141767 ?auto_141771 ) ) ( not ( = ?auto_141767 ?auto_141775 ) ) ( not ( = ?auto_141767 ?auto_141773 ) ) ( not ( = ?auto_141768 ?auto_141771 ) ) ( not ( = ?auto_141768 ?auto_141775 ) ) ( not ( = ?auto_141768 ?auto_141773 ) ) ( not ( = ?auto_141769 ?auto_141771 ) ) ( not ( = ?auto_141769 ?auto_141775 ) ) ( not ( = ?auto_141769 ?auto_141773 ) ) ( not ( = ?auto_141774 ?auto_141771 ) ) ( not ( = ?auto_141774 ?auto_141775 ) ) ( not ( = ?auto_141774 ?auto_141773 ) ) ( not ( = ?auto_141770 ?auto_141771 ) ) ( not ( = ?auto_141770 ?auto_141775 ) ) ( not ( = ?auto_141770 ?auto_141773 ) ) ( ON ?auto_141772 ?auto_141770 ) ( CLEAR ?auto_141773 ) ( ON ?auto_141771 ?auto_141772 ) ( CLEAR ?auto_141771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_141767 ?auto_141768 ?auto_141769 ?auto_141774 ?auto_141770 ?auto_141772 )
      ( MAKE-3PILE ?auto_141767 ?auto_141768 ?auto_141769 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141776 - BLOCK
      ?auto_141777 - BLOCK
      ?auto_141778 - BLOCK
    )
    :vars
    (
      ?auto_141779 - BLOCK
      ?auto_141780 - BLOCK
      ?auto_141784 - BLOCK
      ?auto_141783 - BLOCK
      ?auto_141781 - BLOCK
      ?auto_141782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141779 ?auto_141778 ) ( ON-TABLE ?auto_141776 ) ( ON ?auto_141777 ?auto_141776 ) ( ON ?auto_141778 ?auto_141777 ) ( not ( = ?auto_141776 ?auto_141777 ) ) ( not ( = ?auto_141776 ?auto_141778 ) ) ( not ( = ?auto_141776 ?auto_141779 ) ) ( not ( = ?auto_141777 ?auto_141778 ) ) ( not ( = ?auto_141777 ?auto_141779 ) ) ( not ( = ?auto_141778 ?auto_141779 ) ) ( not ( = ?auto_141776 ?auto_141780 ) ) ( not ( = ?auto_141776 ?auto_141784 ) ) ( not ( = ?auto_141777 ?auto_141780 ) ) ( not ( = ?auto_141777 ?auto_141784 ) ) ( not ( = ?auto_141778 ?auto_141780 ) ) ( not ( = ?auto_141778 ?auto_141784 ) ) ( not ( = ?auto_141779 ?auto_141780 ) ) ( not ( = ?auto_141779 ?auto_141784 ) ) ( not ( = ?auto_141780 ?auto_141784 ) ) ( ON ?auto_141780 ?auto_141779 ) ( ON-TABLE ?auto_141783 ) ( not ( = ?auto_141783 ?auto_141781 ) ) ( not ( = ?auto_141783 ?auto_141782 ) ) ( not ( = ?auto_141783 ?auto_141784 ) ) ( not ( = ?auto_141781 ?auto_141782 ) ) ( not ( = ?auto_141781 ?auto_141784 ) ) ( not ( = ?auto_141782 ?auto_141784 ) ) ( not ( = ?auto_141776 ?auto_141782 ) ) ( not ( = ?auto_141776 ?auto_141783 ) ) ( not ( = ?auto_141776 ?auto_141781 ) ) ( not ( = ?auto_141777 ?auto_141782 ) ) ( not ( = ?auto_141777 ?auto_141783 ) ) ( not ( = ?auto_141777 ?auto_141781 ) ) ( not ( = ?auto_141778 ?auto_141782 ) ) ( not ( = ?auto_141778 ?auto_141783 ) ) ( not ( = ?auto_141778 ?auto_141781 ) ) ( not ( = ?auto_141779 ?auto_141782 ) ) ( not ( = ?auto_141779 ?auto_141783 ) ) ( not ( = ?auto_141779 ?auto_141781 ) ) ( not ( = ?auto_141780 ?auto_141782 ) ) ( not ( = ?auto_141780 ?auto_141783 ) ) ( not ( = ?auto_141780 ?auto_141781 ) ) ( ON ?auto_141784 ?auto_141780 ) ( ON ?auto_141782 ?auto_141784 ) ( CLEAR ?auto_141782 ) ( HOLDING ?auto_141781 ) ( CLEAR ?auto_141783 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_141783 ?auto_141781 )
      ( MAKE-3PILE ?auto_141776 ?auto_141777 ?auto_141778 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141785 - BLOCK
      ?auto_141786 - BLOCK
      ?auto_141787 - BLOCK
    )
    :vars
    (
      ?auto_141789 - BLOCK
      ?auto_141790 - BLOCK
      ?auto_141793 - BLOCK
      ?auto_141791 - BLOCK
      ?auto_141792 - BLOCK
      ?auto_141788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141789 ?auto_141787 ) ( ON-TABLE ?auto_141785 ) ( ON ?auto_141786 ?auto_141785 ) ( ON ?auto_141787 ?auto_141786 ) ( not ( = ?auto_141785 ?auto_141786 ) ) ( not ( = ?auto_141785 ?auto_141787 ) ) ( not ( = ?auto_141785 ?auto_141789 ) ) ( not ( = ?auto_141786 ?auto_141787 ) ) ( not ( = ?auto_141786 ?auto_141789 ) ) ( not ( = ?auto_141787 ?auto_141789 ) ) ( not ( = ?auto_141785 ?auto_141790 ) ) ( not ( = ?auto_141785 ?auto_141793 ) ) ( not ( = ?auto_141786 ?auto_141790 ) ) ( not ( = ?auto_141786 ?auto_141793 ) ) ( not ( = ?auto_141787 ?auto_141790 ) ) ( not ( = ?auto_141787 ?auto_141793 ) ) ( not ( = ?auto_141789 ?auto_141790 ) ) ( not ( = ?auto_141789 ?auto_141793 ) ) ( not ( = ?auto_141790 ?auto_141793 ) ) ( ON ?auto_141790 ?auto_141789 ) ( ON-TABLE ?auto_141791 ) ( not ( = ?auto_141791 ?auto_141792 ) ) ( not ( = ?auto_141791 ?auto_141788 ) ) ( not ( = ?auto_141791 ?auto_141793 ) ) ( not ( = ?auto_141792 ?auto_141788 ) ) ( not ( = ?auto_141792 ?auto_141793 ) ) ( not ( = ?auto_141788 ?auto_141793 ) ) ( not ( = ?auto_141785 ?auto_141788 ) ) ( not ( = ?auto_141785 ?auto_141791 ) ) ( not ( = ?auto_141785 ?auto_141792 ) ) ( not ( = ?auto_141786 ?auto_141788 ) ) ( not ( = ?auto_141786 ?auto_141791 ) ) ( not ( = ?auto_141786 ?auto_141792 ) ) ( not ( = ?auto_141787 ?auto_141788 ) ) ( not ( = ?auto_141787 ?auto_141791 ) ) ( not ( = ?auto_141787 ?auto_141792 ) ) ( not ( = ?auto_141789 ?auto_141788 ) ) ( not ( = ?auto_141789 ?auto_141791 ) ) ( not ( = ?auto_141789 ?auto_141792 ) ) ( not ( = ?auto_141790 ?auto_141788 ) ) ( not ( = ?auto_141790 ?auto_141791 ) ) ( not ( = ?auto_141790 ?auto_141792 ) ) ( ON ?auto_141793 ?auto_141790 ) ( ON ?auto_141788 ?auto_141793 ) ( CLEAR ?auto_141791 ) ( ON ?auto_141792 ?auto_141788 ) ( CLEAR ?auto_141792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_141785 ?auto_141786 ?auto_141787 ?auto_141789 ?auto_141790 ?auto_141793 ?auto_141788 )
      ( MAKE-3PILE ?auto_141785 ?auto_141786 ?auto_141787 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141794 - BLOCK
      ?auto_141795 - BLOCK
      ?auto_141796 - BLOCK
    )
    :vars
    (
      ?auto_141800 - BLOCK
      ?auto_141802 - BLOCK
      ?auto_141798 - BLOCK
      ?auto_141801 - BLOCK
      ?auto_141799 - BLOCK
      ?auto_141797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141800 ?auto_141796 ) ( ON-TABLE ?auto_141794 ) ( ON ?auto_141795 ?auto_141794 ) ( ON ?auto_141796 ?auto_141795 ) ( not ( = ?auto_141794 ?auto_141795 ) ) ( not ( = ?auto_141794 ?auto_141796 ) ) ( not ( = ?auto_141794 ?auto_141800 ) ) ( not ( = ?auto_141795 ?auto_141796 ) ) ( not ( = ?auto_141795 ?auto_141800 ) ) ( not ( = ?auto_141796 ?auto_141800 ) ) ( not ( = ?auto_141794 ?auto_141802 ) ) ( not ( = ?auto_141794 ?auto_141798 ) ) ( not ( = ?auto_141795 ?auto_141802 ) ) ( not ( = ?auto_141795 ?auto_141798 ) ) ( not ( = ?auto_141796 ?auto_141802 ) ) ( not ( = ?auto_141796 ?auto_141798 ) ) ( not ( = ?auto_141800 ?auto_141802 ) ) ( not ( = ?auto_141800 ?auto_141798 ) ) ( not ( = ?auto_141802 ?auto_141798 ) ) ( ON ?auto_141802 ?auto_141800 ) ( not ( = ?auto_141801 ?auto_141799 ) ) ( not ( = ?auto_141801 ?auto_141797 ) ) ( not ( = ?auto_141801 ?auto_141798 ) ) ( not ( = ?auto_141799 ?auto_141797 ) ) ( not ( = ?auto_141799 ?auto_141798 ) ) ( not ( = ?auto_141797 ?auto_141798 ) ) ( not ( = ?auto_141794 ?auto_141797 ) ) ( not ( = ?auto_141794 ?auto_141801 ) ) ( not ( = ?auto_141794 ?auto_141799 ) ) ( not ( = ?auto_141795 ?auto_141797 ) ) ( not ( = ?auto_141795 ?auto_141801 ) ) ( not ( = ?auto_141795 ?auto_141799 ) ) ( not ( = ?auto_141796 ?auto_141797 ) ) ( not ( = ?auto_141796 ?auto_141801 ) ) ( not ( = ?auto_141796 ?auto_141799 ) ) ( not ( = ?auto_141800 ?auto_141797 ) ) ( not ( = ?auto_141800 ?auto_141801 ) ) ( not ( = ?auto_141800 ?auto_141799 ) ) ( not ( = ?auto_141802 ?auto_141797 ) ) ( not ( = ?auto_141802 ?auto_141801 ) ) ( not ( = ?auto_141802 ?auto_141799 ) ) ( ON ?auto_141798 ?auto_141802 ) ( ON ?auto_141797 ?auto_141798 ) ( ON ?auto_141799 ?auto_141797 ) ( CLEAR ?auto_141799 ) ( HOLDING ?auto_141801 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_141801 )
      ( MAKE-3PILE ?auto_141794 ?auto_141795 ?auto_141796 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141803 - BLOCK
      ?auto_141804 - BLOCK
      ?auto_141805 - BLOCK
    )
    :vars
    (
      ?auto_141808 - BLOCK
      ?auto_141811 - BLOCK
      ?auto_141810 - BLOCK
      ?auto_141807 - BLOCK
      ?auto_141806 - BLOCK
      ?auto_141809 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141808 ?auto_141805 ) ( ON-TABLE ?auto_141803 ) ( ON ?auto_141804 ?auto_141803 ) ( ON ?auto_141805 ?auto_141804 ) ( not ( = ?auto_141803 ?auto_141804 ) ) ( not ( = ?auto_141803 ?auto_141805 ) ) ( not ( = ?auto_141803 ?auto_141808 ) ) ( not ( = ?auto_141804 ?auto_141805 ) ) ( not ( = ?auto_141804 ?auto_141808 ) ) ( not ( = ?auto_141805 ?auto_141808 ) ) ( not ( = ?auto_141803 ?auto_141811 ) ) ( not ( = ?auto_141803 ?auto_141810 ) ) ( not ( = ?auto_141804 ?auto_141811 ) ) ( not ( = ?auto_141804 ?auto_141810 ) ) ( not ( = ?auto_141805 ?auto_141811 ) ) ( not ( = ?auto_141805 ?auto_141810 ) ) ( not ( = ?auto_141808 ?auto_141811 ) ) ( not ( = ?auto_141808 ?auto_141810 ) ) ( not ( = ?auto_141811 ?auto_141810 ) ) ( ON ?auto_141811 ?auto_141808 ) ( not ( = ?auto_141807 ?auto_141806 ) ) ( not ( = ?auto_141807 ?auto_141809 ) ) ( not ( = ?auto_141807 ?auto_141810 ) ) ( not ( = ?auto_141806 ?auto_141809 ) ) ( not ( = ?auto_141806 ?auto_141810 ) ) ( not ( = ?auto_141809 ?auto_141810 ) ) ( not ( = ?auto_141803 ?auto_141809 ) ) ( not ( = ?auto_141803 ?auto_141807 ) ) ( not ( = ?auto_141803 ?auto_141806 ) ) ( not ( = ?auto_141804 ?auto_141809 ) ) ( not ( = ?auto_141804 ?auto_141807 ) ) ( not ( = ?auto_141804 ?auto_141806 ) ) ( not ( = ?auto_141805 ?auto_141809 ) ) ( not ( = ?auto_141805 ?auto_141807 ) ) ( not ( = ?auto_141805 ?auto_141806 ) ) ( not ( = ?auto_141808 ?auto_141809 ) ) ( not ( = ?auto_141808 ?auto_141807 ) ) ( not ( = ?auto_141808 ?auto_141806 ) ) ( not ( = ?auto_141811 ?auto_141809 ) ) ( not ( = ?auto_141811 ?auto_141807 ) ) ( not ( = ?auto_141811 ?auto_141806 ) ) ( ON ?auto_141810 ?auto_141811 ) ( ON ?auto_141809 ?auto_141810 ) ( ON ?auto_141806 ?auto_141809 ) ( ON ?auto_141807 ?auto_141806 ) ( CLEAR ?auto_141807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_141803 ?auto_141804 ?auto_141805 ?auto_141808 ?auto_141811 ?auto_141810 ?auto_141809 ?auto_141806 )
      ( MAKE-3PILE ?auto_141803 ?auto_141804 ?auto_141805 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_141818 - BLOCK
      ?auto_141819 - BLOCK
      ?auto_141820 - BLOCK
      ?auto_141821 - BLOCK
      ?auto_141822 - BLOCK
      ?auto_141823 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_141823 ) ( CLEAR ?auto_141822 ) ( ON-TABLE ?auto_141818 ) ( ON ?auto_141819 ?auto_141818 ) ( ON ?auto_141820 ?auto_141819 ) ( ON ?auto_141821 ?auto_141820 ) ( ON ?auto_141822 ?auto_141821 ) ( not ( = ?auto_141818 ?auto_141819 ) ) ( not ( = ?auto_141818 ?auto_141820 ) ) ( not ( = ?auto_141818 ?auto_141821 ) ) ( not ( = ?auto_141818 ?auto_141822 ) ) ( not ( = ?auto_141818 ?auto_141823 ) ) ( not ( = ?auto_141819 ?auto_141820 ) ) ( not ( = ?auto_141819 ?auto_141821 ) ) ( not ( = ?auto_141819 ?auto_141822 ) ) ( not ( = ?auto_141819 ?auto_141823 ) ) ( not ( = ?auto_141820 ?auto_141821 ) ) ( not ( = ?auto_141820 ?auto_141822 ) ) ( not ( = ?auto_141820 ?auto_141823 ) ) ( not ( = ?auto_141821 ?auto_141822 ) ) ( not ( = ?auto_141821 ?auto_141823 ) ) ( not ( = ?auto_141822 ?auto_141823 ) ) )
    :subtasks
    ( ( !STACK ?auto_141823 ?auto_141822 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_141824 - BLOCK
      ?auto_141825 - BLOCK
      ?auto_141826 - BLOCK
      ?auto_141827 - BLOCK
      ?auto_141828 - BLOCK
      ?auto_141829 - BLOCK
    )
    :vars
    (
      ?auto_141830 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_141828 ) ( ON-TABLE ?auto_141824 ) ( ON ?auto_141825 ?auto_141824 ) ( ON ?auto_141826 ?auto_141825 ) ( ON ?auto_141827 ?auto_141826 ) ( ON ?auto_141828 ?auto_141827 ) ( not ( = ?auto_141824 ?auto_141825 ) ) ( not ( = ?auto_141824 ?auto_141826 ) ) ( not ( = ?auto_141824 ?auto_141827 ) ) ( not ( = ?auto_141824 ?auto_141828 ) ) ( not ( = ?auto_141824 ?auto_141829 ) ) ( not ( = ?auto_141825 ?auto_141826 ) ) ( not ( = ?auto_141825 ?auto_141827 ) ) ( not ( = ?auto_141825 ?auto_141828 ) ) ( not ( = ?auto_141825 ?auto_141829 ) ) ( not ( = ?auto_141826 ?auto_141827 ) ) ( not ( = ?auto_141826 ?auto_141828 ) ) ( not ( = ?auto_141826 ?auto_141829 ) ) ( not ( = ?auto_141827 ?auto_141828 ) ) ( not ( = ?auto_141827 ?auto_141829 ) ) ( not ( = ?auto_141828 ?auto_141829 ) ) ( ON ?auto_141829 ?auto_141830 ) ( CLEAR ?auto_141829 ) ( HAND-EMPTY ) ( not ( = ?auto_141824 ?auto_141830 ) ) ( not ( = ?auto_141825 ?auto_141830 ) ) ( not ( = ?auto_141826 ?auto_141830 ) ) ( not ( = ?auto_141827 ?auto_141830 ) ) ( not ( = ?auto_141828 ?auto_141830 ) ) ( not ( = ?auto_141829 ?auto_141830 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_141829 ?auto_141830 )
      ( MAKE-6PILE ?auto_141824 ?auto_141825 ?auto_141826 ?auto_141827 ?auto_141828 ?auto_141829 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_141831 - BLOCK
      ?auto_141832 - BLOCK
      ?auto_141833 - BLOCK
      ?auto_141834 - BLOCK
      ?auto_141835 - BLOCK
      ?auto_141836 - BLOCK
    )
    :vars
    (
      ?auto_141837 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141831 ) ( ON ?auto_141832 ?auto_141831 ) ( ON ?auto_141833 ?auto_141832 ) ( ON ?auto_141834 ?auto_141833 ) ( not ( = ?auto_141831 ?auto_141832 ) ) ( not ( = ?auto_141831 ?auto_141833 ) ) ( not ( = ?auto_141831 ?auto_141834 ) ) ( not ( = ?auto_141831 ?auto_141835 ) ) ( not ( = ?auto_141831 ?auto_141836 ) ) ( not ( = ?auto_141832 ?auto_141833 ) ) ( not ( = ?auto_141832 ?auto_141834 ) ) ( not ( = ?auto_141832 ?auto_141835 ) ) ( not ( = ?auto_141832 ?auto_141836 ) ) ( not ( = ?auto_141833 ?auto_141834 ) ) ( not ( = ?auto_141833 ?auto_141835 ) ) ( not ( = ?auto_141833 ?auto_141836 ) ) ( not ( = ?auto_141834 ?auto_141835 ) ) ( not ( = ?auto_141834 ?auto_141836 ) ) ( not ( = ?auto_141835 ?auto_141836 ) ) ( ON ?auto_141836 ?auto_141837 ) ( CLEAR ?auto_141836 ) ( not ( = ?auto_141831 ?auto_141837 ) ) ( not ( = ?auto_141832 ?auto_141837 ) ) ( not ( = ?auto_141833 ?auto_141837 ) ) ( not ( = ?auto_141834 ?auto_141837 ) ) ( not ( = ?auto_141835 ?auto_141837 ) ) ( not ( = ?auto_141836 ?auto_141837 ) ) ( HOLDING ?auto_141835 ) ( CLEAR ?auto_141834 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_141831 ?auto_141832 ?auto_141833 ?auto_141834 ?auto_141835 )
      ( MAKE-6PILE ?auto_141831 ?auto_141832 ?auto_141833 ?auto_141834 ?auto_141835 ?auto_141836 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_141838 - BLOCK
      ?auto_141839 - BLOCK
      ?auto_141840 - BLOCK
      ?auto_141841 - BLOCK
      ?auto_141842 - BLOCK
      ?auto_141843 - BLOCK
    )
    :vars
    (
      ?auto_141844 - BLOCK
      ?auto_141846 - BLOCK
      ?auto_141845 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141838 ) ( ON ?auto_141839 ?auto_141838 ) ( ON ?auto_141840 ?auto_141839 ) ( ON ?auto_141841 ?auto_141840 ) ( not ( = ?auto_141838 ?auto_141839 ) ) ( not ( = ?auto_141838 ?auto_141840 ) ) ( not ( = ?auto_141838 ?auto_141841 ) ) ( not ( = ?auto_141838 ?auto_141842 ) ) ( not ( = ?auto_141838 ?auto_141843 ) ) ( not ( = ?auto_141839 ?auto_141840 ) ) ( not ( = ?auto_141839 ?auto_141841 ) ) ( not ( = ?auto_141839 ?auto_141842 ) ) ( not ( = ?auto_141839 ?auto_141843 ) ) ( not ( = ?auto_141840 ?auto_141841 ) ) ( not ( = ?auto_141840 ?auto_141842 ) ) ( not ( = ?auto_141840 ?auto_141843 ) ) ( not ( = ?auto_141841 ?auto_141842 ) ) ( not ( = ?auto_141841 ?auto_141843 ) ) ( not ( = ?auto_141842 ?auto_141843 ) ) ( ON ?auto_141843 ?auto_141844 ) ( not ( = ?auto_141838 ?auto_141844 ) ) ( not ( = ?auto_141839 ?auto_141844 ) ) ( not ( = ?auto_141840 ?auto_141844 ) ) ( not ( = ?auto_141841 ?auto_141844 ) ) ( not ( = ?auto_141842 ?auto_141844 ) ) ( not ( = ?auto_141843 ?auto_141844 ) ) ( CLEAR ?auto_141841 ) ( ON ?auto_141842 ?auto_141843 ) ( CLEAR ?auto_141842 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_141846 ) ( ON ?auto_141845 ?auto_141846 ) ( ON ?auto_141844 ?auto_141845 ) ( not ( = ?auto_141846 ?auto_141845 ) ) ( not ( = ?auto_141846 ?auto_141844 ) ) ( not ( = ?auto_141846 ?auto_141843 ) ) ( not ( = ?auto_141846 ?auto_141842 ) ) ( not ( = ?auto_141845 ?auto_141844 ) ) ( not ( = ?auto_141845 ?auto_141843 ) ) ( not ( = ?auto_141845 ?auto_141842 ) ) ( not ( = ?auto_141838 ?auto_141846 ) ) ( not ( = ?auto_141838 ?auto_141845 ) ) ( not ( = ?auto_141839 ?auto_141846 ) ) ( not ( = ?auto_141839 ?auto_141845 ) ) ( not ( = ?auto_141840 ?auto_141846 ) ) ( not ( = ?auto_141840 ?auto_141845 ) ) ( not ( = ?auto_141841 ?auto_141846 ) ) ( not ( = ?auto_141841 ?auto_141845 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_141846 ?auto_141845 ?auto_141844 ?auto_141843 )
      ( MAKE-6PILE ?auto_141838 ?auto_141839 ?auto_141840 ?auto_141841 ?auto_141842 ?auto_141843 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_141847 - BLOCK
      ?auto_141848 - BLOCK
      ?auto_141849 - BLOCK
      ?auto_141850 - BLOCK
      ?auto_141851 - BLOCK
      ?auto_141852 - BLOCK
    )
    :vars
    (
      ?auto_141853 - BLOCK
      ?auto_141854 - BLOCK
      ?auto_141855 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141847 ) ( ON ?auto_141848 ?auto_141847 ) ( ON ?auto_141849 ?auto_141848 ) ( not ( = ?auto_141847 ?auto_141848 ) ) ( not ( = ?auto_141847 ?auto_141849 ) ) ( not ( = ?auto_141847 ?auto_141850 ) ) ( not ( = ?auto_141847 ?auto_141851 ) ) ( not ( = ?auto_141847 ?auto_141852 ) ) ( not ( = ?auto_141848 ?auto_141849 ) ) ( not ( = ?auto_141848 ?auto_141850 ) ) ( not ( = ?auto_141848 ?auto_141851 ) ) ( not ( = ?auto_141848 ?auto_141852 ) ) ( not ( = ?auto_141849 ?auto_141850 ) ) ( not ( = ?auto_141849 ?auto_141851 ) ) ( not ( = ?auto_141849 ?auto_141852 ) ) ( not ( = ?auto_141850 ?auto_141851 ) ) ( not ( = ?auto_141850 ?auto_141852 ) ) ( not ( = ?auto_141851 ?auto_141852 ) ) ( ON ?auto_141852 ?auto_141853 ) ( not ( = ?auto_141847 ?auto_141853 ) ) ( not ( = ?auto_141848 ?auto_141853 ) ) ( not ( = ?auto_141849 ?auto_141853 ) ) ( not ( = ?auto_141850 ?auto_141853 ) ) ( not ( = ?auto_141851 ?auto_141853 ) ) ( not ( = ?auto_141852 ?auto_141853 ) ) ( ON ?auto_141851 ?auto_141852 ) ( CLEAR ?auto_141851 ) ( ON-TABLE ?auto_141854 ) ( ON ?auto_141855 ?auto_141854 ) ( ON ?auto_141853 ?auto_141855 ) ( not ( = ?auto_141854 ?auto_141855 ) ) ( not ( = ?auto_141854 ?auto_141853 ) ) ( not ( = ?auto_141854 ?auto_141852 ) ) ( not ( = ?auto_141854 ?auto_141851 ) ) ( not ( = ?auto_141855 ?auto_141853 ) ) ( not ( = ?auto_141855 ?auto_141852 ) ) ( not ( = ?auto_141855 ?auto_141851 ) ) ( not ( = ?auto_141847 ?auto_141854 ) ) ( not ( = ?auto_141847 ?auto_141855 ) ) ( not ( = ?auto_141848 ?auto_141854 ) ) ( not ( = ?auto_141848 ?auto_141855 ) ) ( not ( = ?auto_141849 ?auto_141854 ) ) ( not ( = ?auto_141849 ?auto_141855 ) ) ( not ( = ?auto_141850 ?auto_141854 ) ) ( not ( = ?auto_141850 ?auto_141855 ) ) ( HOLDING ?auto_141850 ) ( CLEAR ?auto_141849 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_141847 ?auto_141848 ?auto_141849 ?auto_141850 )
      ( MAKE-6PILE ?auto_141847 ?auto_141848 ?auto_141849 ?auto_141850 ?auto_141851 ?auto_141852 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_141856 - BLOCK
      ?auto_141857 - BLOCK
      ?auto_141858 - BLOCK
      ?auto_141859 - BLOCK
      ?auto_141860 - BLOCK
      ?auto_141861 - BLOCK
    )
    :vars
    (
      ?auto_141864 - BLOCK
      ?auto_141862 - BLOCK
      ?auto_141863 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141856 ) ( ON ?auto_141857 ?auto_141856 ) ( ON ?auto_141858 ?auto_141857 ) ( not ( = ?auto_141856 ?auto_141857 ) ) ( not ( = ?auto_141856 ?auto_141858 ) ) ( not ( = ?auto_141856 ?auto_141859 ) ) ( not ( = ?auto_141856 ?auto_141860 ) ) ( not ( = ?auto_141856 ?auto_141861 ) ) ( not ( = ?auto_141857 ?auto_141858 ) ) ( not ( = ?auto_141857 ?auto_141859 ) ) ( not ( = ?auto_141857 ?auto_141860 ) ) ( not ( = ?auto_141857 ?auto_141861 ) ) ( not ( = ?auto_141858 ?auto_141859 ) ) ( not ( = ?auto_141858 ?auto_141860 ) ) ( not ( = ?auto_141858 ?auto_141861 ) ) ( not ( = ?auto_141859 ?auto_141860 ) ) ( not ( = ?auto_141859 ?auto_141861 ) ) ( not ( = ?auto_141860 ?auto_141861 ) ) ( ON ?auto_141861 ?auto_141864 ) ( not ( = ?auto_141856 ?auto_141864 ) ) ( not ( = ?auto_141857 ?auto_141864 ) ) ( not ( = ?auto_141858 ?auto_141864 ) ) ( not ( = ?auto_141859 ?auto_141864 ) ) ( not ( = ?auto_141860 ?auto_141864 ) ) ( not ( = ?auto_141861 ?auto_141864 ) ) ( ON ?auto_141860 ?auto_141861 ) ( ON-TABLE ?auto_141862 ) ( ON ?auto_141863 ?auto_141862 ) ( ON ?auto_141864 ?auto_141863 ) ( not ( = ?auto_141862 ?auto_141863 ) ) ( not ( = ?auto_141862 ?auto_141864 ) ) ( not ( = ?auto_141862 ?auto_141861 ) ) ( not ( = ?auto_141862 ?auto_141860 ) ) ( not ( = ?auto_141863 ?auto_141864 ) ) ( not ( = ?auto_141863 ?auto_141861 ) ) ( not ( = ?auto_141863 ?auto_141860 ) ) ( not ( = ?auto_141856 ?auto_141862 ) ) ( not ( = ?auto_141856 ?auto_141863 ) ) ( not ( = ?auto_141857 ?auto_141862 ) ) ( not ( = ?auto_141857 ?auto_141863 ) ) ( not ( = ?auto_141858 ?auto_141862 ) ) ( not ( = ?auto_141858 ?auto_141863 ) ) ( not ( = ?auto_141859 ?auto_141862 ) ) ( not ( = ?auto_141859 ?auto_141863 ) ) ( CLEAR ?auto_141858 ) ( ON ?auto_141859 ?auto_141860 ) ( CLEAR ?auto_141859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_141862 ?auto_141863 ?auto_141864 ?auto_141861 ?auto_141860 )
      ( MAKE-6PILE ?auto_141856 ?auto_141857 ?auto_141858 ?auto_141859 ?auto_141860 ?auto_141861 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_141865 - BLOCK
      ?auto_141866 - BLOCK
      ?auto_141867 - BLOCK
      ?auto_141868 - BLOCK
      ?auto_141869 - BLOCK
      ?auto_141870 - BLOCK
    )
    :vars
    (
      ?auto_141872 - BLOCK
      ?auto_141873 - BLOCK
      ?auto_141871 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141865 ) ( ON ?auto_141866 ?auto_141865 ) ( not ( = ?auto_141865 ?auto_141866 ) ) ( not ( = ?auto_141865 ?auto_141867 ) ) ( not ( = ?auto_141865 ?auto_141868 ) ) ( not ( = ?auto_141865 ?auto_141869 ) ) ( not ( = ?auto_141865 ?auto_141870 ) ) ( not ( = ?auto_141866 ?auto_141867 ) ) ( not ( = ?auto_141866 ?auto_141868 ) ) ( not ( = ?auto_141866 ?auto_141869 ) ) ( not ( = ?auto_141866 ?auto_141870 ) ) ( not ( = ?auto_141867 ?auto_141868 ) ) ( not ( = ?auto_141867 ?auto_141869 ) ) ( not ( = ?auto_141867 ?auto_141870 ) ) ( not ( = ?auto_141868 ?auto_141869 ) ) ( not ( = ?auto_141868 ?auto_141870 ) ) ( not ( = ?auto_141869 ?auto_141870 ) ) ( ON ?auto_141870 ?auto_141872 ) ( not ( = ?auto_141865 ?auto_141872 ) ) ( not ( = ?auto_141866 ?auto_141872 ) ) ( not ( = ?auto_141867 ?auto_141872 ) ) ( not ( = ?auto_141868 ?auto_141872 ) ) ( not ( = ?auto_141869 ?auto_141872 ) ) ( not ( = ?auto_141870 ?auto_141872 ) ) ( ON ?auto_141869 ?auto_141870 ) ( ON-TABLE ?auto_141873 ) ( ON ?auto_141871 ?auto_141873 ) ( ON ?auto_141872 ?auto_141871 ) ( not ( = ?auto_141873 ?auto_141871 ) ) ( not ( = ?auto_141873 ?auto_141872 ) ) ( not ( = ?auto_141873 ?auto_141870 ) ) ( not ( = ?auto_141873 ?auto_141869 ) ) ( not ( = ?auto_141871 ?auto_141872 ) ) ( not ( = ?auto_141871 ?auto_141870 ) ) ( not ( = ?auto_141871 ?auto_141869 ) ) ( not ( = ?auto_141865 ?auto_141873 ) ) ( not ( = ?auto_141865 ?auto_141871 ) ) ( not ( = ?auto_141866 ?auto_141873 ) ) ( not ( = ?auto_141866 ?auto_141871 ) ) ( not ( = ?auto_141867 ?auto_141873 ) ) ( not ( = ?auto_141867 ?auto_141871 ) ) ( not ( = ?auto_141868 ?auto_141873 ) ) ( not ( = ?auto_141868 ?auto_141871 ) ) ( ON ?auto_141868 ?auto_141869 ) ( CLEAR ?auto_141868 ) ( HOLDING ?auto_141867 ) ( CLEAR ?auto_141866 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_141865 ?auto_141866 ?auto_141867 )
      ( MAKE-6PILE ?auto_141865 ?auto_141866 ?auto_141867 ?auto_141868 ?auto_141869 ?auto_141870 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_141874 - BLOCK
      ?auto_141875 - BLOCK
      ?auto_141876 - BLOCK
      ?auto_141877 - BLOCK
      ?auto_141878 - BLOCK
      ?auto_141879 - BLOCK
    )
    :vars
    (
      ?auto_141881 - BLOCK
      ?auto_141882 - BLOCK
      ?auto_141880 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141874 ) ( ON ?auto_141875 ?auto_141874 ) ( not ( = ?auto_141874 ?auto_141875 ) ) ( not ( = ?auto_141874 ?auto_141876 ) ) ( not ( = ?auto_141874 ?auto_141877 ) ) ( not ( = ?auto_141874 ?auto_141878 ) ) ( not ( = ?auto_141874 ?auto_141879 ) ) ( not ( = ?auto_141875 ?auto_141876 ) ) ( not ( = ?auto_141875 ?auto_141877 ) ) ( not ( = ?auto_141875 ?auto_141878 ) ) ( not ( = ?auto_141875 ?auto_141879 ) ) ( not ( = ?auto_141876 ?auto_141877 ) ) ( not ( = ?auto_141876 ?auto_141878 ) ) ( not ( = ?auto_141876 ?auto_141879 ) ) ( not ( = ?auto_141877 ?auto_141878 ) ) ( not ( = ?auto_141877 ?auto_141879 ) ) ( not ( = ?auto_141878 ?auto_141879 ) ) ( ON ?auto_141879 ?auto_141881 ) ( not ( = ?auto_141874 ?auto_141881 ) ) ( not ( = ?auto_141875 ?auto_141881 ) ) ( not ( = ?auto_141876 ?auto_141881 ) ) ( not ( = ?auto_141877 ?auto_141881 ) ) ( not ( = ?auto_141878 ?auto_141881 ) ) ( not ( = ?auto_141879 ?auto_141881 ) ) ( ON ?auto_141878 ?auto_141879 ) ( ON-TABLE ?auto_141882 ) ( ON ?auto_141880 ?auto_141882 ) ( ON ?auto_141881 ?auto_141880 ) ( not ( = ?auto_141882 ?auto_141880 ) ) ( not ( = ?auto_141882 ?auto_141881 ) ) ( not ( = ?auto_141882 ?auto_141879 ) ) ( not ( = ?auto_141882 ?auto_141878 ) ) ( not ( = ?auto_141880 ?auto_141881 ) ) ( not ( = ?auto_141880 ?auto_141879 ) ) ( not ( = ?auto_141880 ?auto_141878 ) ) ( not ( = ?auto_141874 ?auto_141882 ) ) ( not ( = ?auto_141874 ?auto_141880 ) ) ( not ( = ?auto_141875 ?auto_141882 ) ) ( not ( = ?auto_141875 ?auto_141880 ) ) ( not ( = ?auto_141876 ?auto_141882 ) ) ( not ( = ?auto_141876 ?auto_141880 ) ) ( not ( = ?auto_141877 ?auto_141882 ) ) ( not ( = ?auto_141877 ?auto_141880 ) ) ( ON ?auto_141877 ?auto_141878 ) ( CLEAR ?auto_141875 ) ( ON ?auto_141876 ?auto_141877 ) ( CLEAR ?auto_141876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_141882 ?auto_141880 ?auto_141881 ?auto_141879 ?auto_141878 ?auto_141877 )
      ( MAKE-6PILE ?auto_141874 ?auto_141875 ?auto_141876 ?auto_141877 ?auto_141878 ?auto_141879 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_141883 - BLOCK
      ?auto_141884 - BLOCK
      ?auto_141885 - BLOCK
      ?auto_141886 - BLOCK
      ?auto_141887 - BLOCK
      ?auto_141888 - BLOCK
    )
    :vars
    (
      ?auto_141889 - BLOCK
      ?auto_141891 - BLOCK
      ?auto_141890 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141883 ) ( not ( = ?auto_141883 ?auto_141884 ) ) ( not ( = ?auto_141883 ?auto_141885 ) ) ( not ( = ?auto_141883 ?auto_141886 ) ) ( not ( = ?auto_141883 ?auto_141887 ) ) ( not ( = ?auto_141883 ?auto_141888 ) ) ( not ( = ?auto_141884 ?auto_141885 ) ) ( not ( = ?auto_141884 ?auto_141886 ) ) ( not ( = ?auto_141884 ?auto_141887 ) ) ( not ( = ?auto_141884 ?auto_141888 ) ) ( not ( = ?auto_141885 ?auto_141886 ) ) ( not ( = ?auto_141885 ?auto_141887 ) ) ( not ( = ?auto_141885 ?auto_141888 ) ) ( not ( = ?auto_141886 ?auto_141887 ) ) ( not ( = ?auto_141886 ?auto_141888 ) ) ( not ( = ?auto_141887 ?auto_141888 ) ) ( ON ?auto_141888 ?auto_141889 ) ( not ( = ?auto_141883 ?auto_141889 ) ) ( not ( = ?auto_141884 ?auto_141889 ) ) ( not ( = ?auto_141885 ?auto_141889 ) ) ( not ( = ?auto_141886 ?auto_141889 ) ) ( not ( = ?auto_141887 ?auto_141889 ) ) ( not ( = ?auto_141888 ?auto_141889 ) ) ( ON ?auto_141887 ?auto_141888 ) ( ON-TABLE ?auto_141891 ) ( ON ?auto_141890 ?auto_141891 ) ( ON ?auto_141889 ?auto_141890 ) ( not ( = ?auto_141891 ?auto_141890 ) ) ( not ( = ?auto_141891 ?auto_141889 ) ) ( not ( = ?auto_141891 ?auto_141888 ) ) ( not ( = ?auto_141891 ?auto_141887 ) ) ( not ( = ?auto_141890 ?auto_141889 ) ) ( not ( = ?auto_141890 ?auto_141888 ) ) ( not ( = ?auto_141890 ?auto_141887 ) ) ( not ( = ?auto_141883 ?auto_141891 ) ) ( not ( = ?auto_141883 ?auto_141890 ) ) ( not ( = ?auto_141884 ?auto_141891 ) ) ( not ( = ?auto_141884 ?auto_141890 ) ) ( not ( = ?auto_141885 ?auto_141891 ) ) ( not ( = ?auto_141885 ?auto_141890 ) ) ( not ( = ?auto_141886 ?auto_141891 ) ) ( not ( = ?auto_141886 ?auto_141890 ) ) ( ON ?auto_141886 ?auto_141887 ) ( ON ?auto_141885 ?auto_141886 ) ( CLEAR ?auto_141885 ) ( HOLDING ?auto_141884 ) ( CLEAR ?auto_141883 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_141883 ?auto_141884 )
      ( MAKE-6PILE ?auto_141883 ?auto_141884 ?auto_141885 ?auto_141886 ?auto_141887 ?auto_141888 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_141892 - BLOCK
      ?auto_141893 - BLOCK
      ?auto_141894 - BLOCK
      ?auto_141895 - BLOCK
      ?auto_141896 - BLOCK
      ?auto_141897 - BLOCK
    )
    :vars
    (
      ?auto_141900 - BLOCK
      ?auto_141899 - BLOCK
      ?auto_141898 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141892 ) ( not ( = ?auto_141892 ?auto_141893 ) ) ( not ( = ?auto_141892 ?auto_141894 ) ) ( not ( = ?auto_141892 ?auto_141895 ) ) ( not ( = ?auto_141892 ?auto_141896 ) ) ( not ( = ?auto_141892 ?auto_141897 ) ) ( not ( = ?auto_141893 ?auto_141894 ) ) ( not ( = ?auto_141893 ?auto_141895 ) ) ( not ( = ?auto_141893 ?auto_141896 ) ) ( not ( = ?auto_141893 ?auto_141897 ) ) ( not ( = ?auto_141894 ?auto_141895 ) ) ( not ( = ?auto_141894 ?auto_141896 ) ) ( not ( = ?auto_141894 ?auto_141897 ) ) ( not ( = ?auto_141895 ?auto_141896 ) ) ( not ( = ?auto_141895 ?auto_141897 ) ) ( not ( = ?auto_141896 ?auto_141897 ) ) ( ON ?auto_141897 ?auto_141900 ) ( not ( = ?auto_141892 ?auto_141900 ) ) ( not ( = ?auto_141893 ?auto_141900 ) ) ( not ( = ?auto_141894 ?auto_141900 ) ) ( not ( = ?auto_141895 ?auto_141900 ) ) ( not ( = ?auto_141896 ?auto_141900 ) ) ( not ( = ?auto_141897 ?auto_141900 ) ) ( ON ?auto_141896 ?auto_141897 ) ( ON-TABLE ?auto_141899 ) ( ON ?auto_141898 ?auto_141899 ) ( ON ?auto_141900 ?auto_141898 ) ( not ( = ?auto_141899 ?auto_141898 ) ) ( not ( = ?auto_141899 ?auto_141900 ) ) ( not ( = ?auto_141899 ?auto_141897 ) ) ( not ( = ?auto_141899 ?auto_141896 ) ) ( not ( = ?auto_141898 ?auto_141900 ) ) ( not ( = ?auto_141898 ?auto_141897 ) ) ( not ( = ?auto_141898 ?auto_141896 ) ) ( not ( = ?auto_141892 ?auto_141899 ) ) ( not ( = ?auto_141892 ?auto_141898 ) ) ( not ( = ?auto_141893 ?auto_141899 ) ) ( not ( = ?auto_141893 ?auto_141898 ) ) ( not ( = ?auto_141894 ?auto_141899 ) ) ( not ( = ?auto_141894 ?auto_141898 ) ) ( not ( = ?auto_141895 ?auto_141899 ) ) ( not ( = ?auto_141895 ?auto_141898 ) ) ( ON ?auto_141895 ?auto_141896 ) ( ON ?auto_141894 ?auto_141895 ) ( CLEAR ?auto_141892 ) ( ON ?auto_141893 ?auto_141894 ) ( CLEAR ?auto_141893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_141899 ?auto_141898 ?auto_141900 ?auto_141897 ?auto_141896 ?auto_141895 ?auto_141894 )
      ( MAKE-6PILE ?auto_141892 ?auto_141893 ?auto_141894 ?auto_141895 ?auto_141896 ?auto_141897 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_141901 - BLOCK
      ?auto_141902 - BLOCK
      ?auto_141903 - BLOCK
      ?auto_141904 - BLOCK
      ?auto_141905 - BLOCK
      ?auto_141906 - BLOCK
    )
    :vars
    (
      ?auto_141908 - BLOCK
      ?auto_141909 - BLOCK
      ?auto_141907 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141901 ?auto_141902 ) ) ( not ( = ?auto_141901 ?auto_141903 ) ) ( not ( = ?auto_141901 ?auto_141904 ) ) ( not ( = ?auto_141901 ?auto_141905 ) ) ( not ( = ?auto_141901 ?auto_141906 ) ) ( not ( = ?auto_141902 ?auto_141903 ) ) ( not ( = ?auto_141902 ?auto_141904 ) ) ( not ( = ?auto_141902 ?auto_141905 ) ) ( not ( = ?auto_141902 ?auto_141906 ) ) ( not ( = ?auto_141903 ?auto_141904 ) ) ( not ( = ?auto_141903 ?auto_141905 ) ) ( not ( = ?auto_141903 ?auto_141906 ) ) ( not ( = ?auto_141904 ?auto_141905 ) ) ( not ( = ?auto_141904 ?auto_141906 ) ) ( not ( = ?auto_141905 ?auto_141906 ) ) ( ON ?auto_141906 ?auto_141908 ) ( not ( = ?auto_141901 ?auto_141908 ) ) ( not ( = ?auto_141902 ?auto_141908 ) ) ( not ( = ?auto_141903 ?auto_141908 ) ) ( not ( = ?auto_141904 ?auto_141908 ) ) ( not ( = ?auto_141905 ?auto_141908 ) ) ( not ( = ?auto_141906 ?auto_141908 ) ) ( ON ?auto_141905 ?auto_141906 ) ( ON-TABLE ?auto_141909 ) ( ON ?auto_141907 ?auto_141909 ) ( ON ?auto_141908 ?auto_141907 ) ( not ( = ?auto_141909 ?auto_141907 ) ) ( not ( = ?auto_141909 ?auto_141908 ) ) ( not ( = ?auto_141909 ?auto_141906 ) ) ( not ( = ?auto_141909 ?auto_141905 ) ) ( not ( = ?auto_141907 ?auto_141908 ) ) ( not ( = ?auto_141907 ?auto_141906 ) ) ( not ( = ?auto_141907 ?auto_141905 ) ) ( not ( = ?auto_141901 ?auto_141909 ) ) ( not ( = ?auto_141901 ?auto_141907 ) ) ( not ( = ?auto_141902 ?auto_141909 ) ) ( not ( = ?auto_141902 ?auto_141907 ) ) ( not ( = ?auto_141903 ?auto_141909 ) ) ( not ( = ?auto_141903 ?auto_141907 ) ) ( not ( = ?auto_141904 ?auto_141909 ) ) ( not ( = ?auto_141904 ?auto_141907 ) ) ( ON ?auto_141904 ?auto_141905 ) ( ON ?auto_141903 ?auto_141904 ) ( ON ?auto_141902 ?auto_141903 ) ( CLEAR ?auto_141902 ) ( HOLDING ?auto_141901 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_141901 )
      ( MAKE-6PILE ?auto_141901 ?auto_141902 ?auto_141903 ?auto_141904 ?auto_141905 ?auto_141906 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_141910 - BLOCK
      ?auto_141911 - BLOCK
      ?auto_141912 - BLOCK
      ?auto_141913 - BLOCK
      ?auto_141914 - BLOCK
      ?auto_141915 - BLOCK
    )
    :vars
    (
      ?auto_141916 - BLOCK
      ?auto_141917 - BLOCK
      ?auto_141918 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141910 ?auto_141911 ) ) ( not ( = ?auto_141910 ?auto_141912 ) ) ( not ( = ?auto_141910 ?auto_141913 ) ) ( not ( = ?auto_141910 ?auto_141914 ) ) ( not ( = ?auto_141910 ?auto_141915 ) ) ( not ( = ?auto_141911 ?auto_141912 ) ) ( not ( = ?auto_141911 ?auto_141913 ) ) ( not ( = ?auto_141911 ?auto_141914 ) ) ( not ( = ?auto_141911 ?auto_141915 ) ) ( not ( = ?auto_141912 ?auto_141913 ) ) ( not ( = ?auto_141912 ?auto_141914 ) ) ( not ( = ?auto_141912 ?auto_141915 ) ) ( not ( = ?auto_141913 ?auto_141914 ) ) ( not ( = ?auto_141913 ?auto_141915 ) ) ( not ( = ?auto_141914 ?auto_141915 ) ) ( ON ?auto_141915 ?auto_141916 ) ( not ( = ?auto_141910 ?auto_141916 ) ) ( not ( = ?auto_141911 ?auto_141916 ) ) ( not ( = ?auto_141912 ?auto_141916 ) ) ( not ( = ?auto_141913 ?auto_141916 ) ) ( not ( = ?auto_141914 ?auto_141916 ) ) ( not ( = ?auto_141915 ?auto_141916 ) ) ( ON ?auto_141914 ?auto_141915 ) ( ON-TABLE ?auto_141917 ) ( ON ?auto_141918 ?auto_141917 ) ( ON ?auto_141916 ?auto_141918 ) ( not ( = ?auto_141917 ?auto_141918 ) ) ( not ( = ?auto_141917 ?auto_141916 ) ) ( not ( = ?auto_141917 ?auto_141915 ) ) ( not ( = ?auto_141917 ?auto_141914 ) ) ( not ( = ?auto_141918 ?auto_141916 ) ) ( not ( = ?auto_141918 ?auto_141915 ) ) ( not ( = ?auto_141918 ?auto_141914 ) ) ( not ( = ?auto_141910 ?auto_141917 ) ) ( not ( = ?auto_141910 ?auto_141918 ) ) ( not ( = ?auto_141911 ?auto_141917 ) ) ( not ( = ?auto_141911 ?auto_141918 ) ) ( not ( = ?auto_141912 ?auto_141917 ) ) ( not ( = ?auto_141912 ?auto_141918 ) ) ( not ( = ?auto_141913 ?auto_141917 ) ) ( not ( = ?auto_141913 ?auto_141918 ) ) ( ON ?auto_141913 ?auto_141914 ) ( ON ?auto_141912 ?auto_141913 ) ( ON ?auto_141911 ?auto_141912 ) ( ON ?auto_141910 ?auto_141911 ) ( CLEAR ?auto_141910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_141917 ?auto_141918 ?auto_141916 ?auto_141915 ?auto_141914 ?auto_141913 ?auto_141912 ?auto_141911 )
      ( MAKE-6PILE ?auto_141910 ?auto_141911 ?auto_141912 ?auto_141913 ?auto_141914 ?auto_141915 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_141921 - BLOCK
      ?auto_141922 - BLOCK
    )
    :vars
    (
      ?auto_141923 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141923 ?auto_141922 ) ( CLEAR ?auto_141923 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_141921 ) ( ON ?auto_141922 ?auto_141921 ) ( not ( = ?auto_141921 ?auto_141922 ) ) ( not ( = ?auto_141921 ?auto_141923 ) ) ( not ( = ?auto_141922 ?auto_141923 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_141923 ?auto_141922 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_141924 - BLOCK
      ?auto_141925 - BLOCK
    )
    :vars
    (
      ?auto_141926 - BLOCK
      ?auto_141927 - BLOCK
      ?auto_141928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141926 ?auto_141925 ) ( CLEAR ?auto_141926 ) ( ON-TABLE ?auto_141924 ) ( ON ?auto_141925 ?auto_141924 ) ( not ( = ?auto_141924 ?auto_141925 ) ) ( not ( = ?auto_141924 ?auto_141926 ) ) ( not ( = ?auto_141925 ?auto_141926 ) ) ( HOLDING ?auto_141927 ) ( CLEAR ?auto_141928 ) ( not ( = ?auto_141924 ?auto_141927 ) ) ( not ( = ?auto_141924 ?auto_141928 ) ) ( not ( = ?auto_141925 ?auto_141927 ) ) ( not ( = ?auto_141925 ?auto_141928 ) ) ( not ( = ?auto_141926 ?auto_141927 ) ) ( not ( = ?auto_141926 ?auto_141928 ) ) ( not ( = ?auto_141927 ?auto_141928 ) ) )
    :subtasks
    ( ( !STACK ?auto_141927 ?auto_141928 )
      ( MAKE-2PILE ?auto_141924 ?auto_141925 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_141929 - BLOCK
      ?auto_141930 - BLOCK
    )
    :vars
    (
      ?auto_141931 - BLOCK
      ?auto_141932 - BLOCK
      ?auto_141933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141931 ?auto_141930 ) ( ON-TABLE ?auto_141929 ) ( ON ?auto_141930 ?auto_141929 ) ( not ( = ?auto_141929 ?auto_141930 ) ) ( not ( = ?auto_141929 ?auto_141931 ) ) ( not ( = ?auto_141930 ?auto_141931 ) ) ( CLEAR ?auto_141932 ) ( not ( = ?auto_141929 ?auto_141933 ) ) ( not ( = ?auto_141929 ?auto_141932 ) ) ( not ( = ?auto_141930 ?auto_141933 ) ) ( not ( = ?auto_141930 ?auto_141932 ) ) ( not ( = ?auto_141931 ?auto_141933 ) ) ( not ( = ?auto_141931 ?auto_141932 ) ) ( not ( = ?auto_141933 ?auto_141932 ) ) ( ON ?auto_141933 ?auto_141931 ) ( CLEAR ?auto_141933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_141929 ?auto_141930 ?auto_141931 )
      ( MAKE-2PILE ?auto_141929 ?auto_141930 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_141934 - BLOCK
      ?auto_141935 - BLOCK
    )
    :vars
    (
      ?auto_141937 - BLOCK
      ?auto_141936 - BLOCK
      ?auto_141938 - BLOCK
      ?auto_141941 - BLOCK
      ?auto_141940 - BLOCK
      ?auto_141939 - BLOCK
      ?auto_141942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141937 ?auto_141935 ) ( ON-TABLE ?auto_141934 ) ( ON ?auto_141935 ?auto_141934 ) ( not ( = ?auto_141934 ?auto_141935 ) ) ( not ( = ?auto_141934 ?auto_141937 ) ) ( not ( = ?auto_141935 ?auto_141937 ) ) ( not ( = ?auto_141934 ?auto_141936 ) ) ( not ( = ?auto_141934 ?auto_141938 ) ) ( not ( = ?auto_141935 ?auto_141936 ) ) ( not ( = ?auto_141935 ?auto_141938 ) ) ( not ( = ?auto_141937 ?auto_141936 ) ) ( not ( = ?auto_141937 ?auto_141938 ) ) ( not ( = ?auto_141936 ?auto_141938 ) ) ( ON ?auto_141936 ?auto_141937 ) ( CLEAR ?auto_141936 ) ( HOLDING ?auto_141938 ) ( CLEAR ?auto_141941 ) ( ON-TABLE ?auto_141940 ) ( ON ?auto_141939 ?auto_141940 ) ( ON ?auto_141942 ?auto_141939 ) ( ON ?auto_141941 ?auto_141942 ) ( not ( = ?auto_141940 ?auto_141939 ) ) ( not ( = ?auto_141940 ?auto_141942 ) ) ( not ( = ?auto_141940 ?auto_141941 ) ) ( not ( = ?auto_141940 ?auto_141938 ) ) ( not ( = ?auto_141939 ?auto_141942 ) ) ( not ( = ?auto_141939 ?auto_141941 ) ) ( not ( = ?auto_141939 ?auto_141938 ) ) ( not ( = ?auto_141942 ?auto_141941 ) ) ( not ( = ?auto_141942 ?auto_141938 ) ) ( not ( = ?auto_141941 ?auto_141938 ) ) ( not ( = ?auto_141934 ?auto_141941 ) ) ( not ( = ?auto_141934 ?auto_141940 ) ) ( not ( = ?auto_141934 ?auto_141939 ) ) ( not ( = ?auto_141934 ?auto_141942 ) ) ( not ( = ?auto_141935 ?auto_141941 ) ) ( not ( = ?auto_141935 ?auto_141940 ) ) ( not ( = ?auto_141935 ?auto_141939 ) ) ( not ( = ?auto_141935 ?auto_141942 ) ) ( not ( = ?auto_141937 ?auto_141941 ) ) ( not ( = ?auto_141937 ?auto_141940 ) ) ( not ( = ?auto_141937 ?auto_141939 ) ) ( not ( = ?auto_141937 ?auto_141942 ) ) ( not ( = ?auto_141936 ?auto_141941 ) ) ( not ( = ?auto_141936 ?auto_141940 ) ) ( not ( = ?auto_141936 ?auto_141939 ) ) ( not ( = ?auto_141936 ?auto_141942 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_141940 ?auto_141939 ?auto_141942 ?auto_141941 ?auto_141938 )
      ( MAKE-2PILE ?auto_141934 ?auto_141935 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_141943 - BLOCK
      ?auto_141944 - BLOCK
    )
    :vars
    (
      ?auto_141947 - BLOCK
      ?auto_141945 - BLOCK
      ?auto_141951 - BLOCK
      ?auto_141948 - BLOCK
      ?auto_141950 - BLOCK
      ?auto_141949 - BLOCK
      ?auto_141946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141947 ?auto_141944 ) ( ON-TABLE ?auto_141943 ) ( ON ?auto_141944 ?auto_141943 ) ( not ( = ?auto_141943 ?auto_141944 ) ) ( not ( = ?auto_141943 ?auto_141947 ) ) ( not ( = ?auto_141944 ?auto_141947 ) ) ( not ( = ?auto_141943 ?auto_141945 ) ) ( not ( = ?auto_141943 ?auto_141951 ) ) ( not ( = ?auto_141944 ?auto_141945 ) ) ( not ( = ?auto_141944 ?auto_141951 ) ) ( not ( = ?auto_141947 ?auto_141945 ) ) ( not ( = ?auto_141947 ?auto_141951 ) ) ( not ( = ?auto_141945 ?auto_141951 ) ) ( ON ?auto_141945 ?auto_141947 ) ( CLEAR ?auto_141948 ) ( ON-TABLE ?auto_141950 ) ( ON ?auto_141949 ?auto_141950 ) ( ON ?auto_141946 ?auto_141949 ) ( ON ?auto_141948 ?auto_141946 ) ( not ( = ?auto_141950 ?auto_141949 ) ) ( not ( = ?auto_141950 ?auto_141946 ) ) ( not ( = ?auto_141950 ?auto_141948 ) ) ( not ( = ?auto_141950 ?auto_141951 ) ) ( not ( = ?auto_141949 ?auto_141946 ) ) ( not ( = ?auto_141949 ?auto_141948 ) ) ( not ( = ?auto_141949 ?auto_141951 ) ) ( not ( = ?auto_141946 ?auto_141948 ) ) ( not ( = ?auto_141946 ?auto_141951 ) ) ( not ( = ?auto_141948 ?auto_141951 ) ) ( not ( = ?auto_141943 ?auto_141948 ) ) ( not ( = ?auto_141943 ?auto_141950 ) ) ( not ( = ?auto_141943 ?auto_141949 ) ) ( not ( = ?auto_141943 ?auto_141946 ) ) ( not ( = ?auto_141944 ?auto_141948 ) ) ( not ( = ?auto_141944 ?auto_141950 ) ) ( not ( = ?auto_141944 ?auto_141949 ) ) ( not ( = ?auto_141944 ?auto_141946 ) ) ( not ( = ?auto_141947 ?auto_141948 ) ) ( not ( = ?auto_141947 ?auto_141950 ) ) ( not ( = ?auto_141947 ?auto_141949 ) ) ( not ( = ?auto_141947 ?auto_141946 ) ) ( not ( = ?auto_141945 ?auto_141948 ) ) ( not ( = ?auto_141945 ?auto_141950 ) ) ( not ( = ?auto_141945 ?auto_141949 ) ) ( not ( = ?auto_141945 ?auto_141946 ) ) ( ON ?auto_141951 ?auto_141945 ) ( CLEAR ?auto_141951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_141943 ?auto_141944 ?auto_141947 ?auto_141945 )
      ( MAKE-2PILE ?auto_141943 ?auto_141944 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_141952 - BLOCK
      ?auto_141953 - BLOCK
    )
    :vars
    (
      ?auto_141958 - BLOCK
      ?auto_141956 - BLOCK
      ?auto_141959 - BLOCK
      ?auto_141957 - BLOCK
      ?auto_141954 - BLOCK
      ?auto_141955 - BLOCK
      ?auto_141960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141958 ?auto_141953 ) ( ON-TABLE ?auto_141952 ) ( ON ?auto_141953 ?auto_141952 ) ( not ( = ?auto_141952 ?auto_141953 ) ) ( not ( = ?auto_141952 ?auto_141958 ) ) ( not ( = ?auto_141953 ?auto_141958 ) ) ( not ( = ?auto_141952 ?auto_141956 ) ) ( not ( = ?auto_141952 ?auto_141959 ) ) ( not ( = ?auto_141953 ?auto_141956 ) ) ( not ( = ?auto_141953 ?auto_141959 ) ) ( not ( = ?auto_141958 ?auto_141956 ) ) ( not ( = ?auto_141958 ?auto_141959 ) ) ( not ( = ?auto_141956 ?auto_141959 ) ) ( ON ?auto_141956 ?auto_141958 ) ( ON-TABLE ?auto_141957 ) ( ON ?auto_141954 ?auto_141957 ) ( ON ?auto_141955 ?auto_141954 ) ( not ( = ?auto_141957 ?auto_141954 ) ) ( not ( = ?auto_141957 ?auto_141955 ) ) ( not ( = ?auto_141957 ?auto_141960 ) ) ( not ( = ?auto_141957 ?auto_141959 ) ) ( not ( = ?auto_141954 ?auto_141955 ) ) ( not ( = ?auto_141954 ?auto_141960 ) ) ( not ( = ?auto_141954 ?auto_141959 ) ) ( not ( = ?auto_141955 ?auto_141960 ) ) ( not ( = ?auto_141955 ?auto_141959 ) ) ( not ( = ?auto_141960 ?auto_141959 ) ) ( not ( = ?auto_141952 ?auto_141960 ) ) ( not ( = ?auto_141952 ?auto_141957 ) ) ( not ( = ?auto_141952 ?auto_141954 ) ) ( not ( = ?auto_141952 ?auto_141955 ) ) ( not ( = ?auto_141953 ?auto_141960 ) ) ( not ( = ?auto_141953 ?auto_141957 ) ) ( not ( = ?auto_141953 ?auto_141954 ) ) ( not ( = ?auto_141953 ?auto_141955 ) ) ( not ( = ?auto_141958 ?auto_141960 ) ) ( not ( = ?auto_141958 ?auto_141957 ) ) ( not ( = ?auto_141958 ?auto_141954 ) ) ( not ( = ?auto_141958 ?auto_141955 ) ) ( not ( = ?auto_141956 ?auto_141960 ) ) ( not ( = ?auto_141956 ?auto_141957 ) ) ( not ( = ?auto_141956 ?auto_141954 ) ) ( not ( = ?auto_141956 ?auto_141955 ) ) ( ON ?auto_141959 ?auto_141956 ) ( CLEAR ?auto_141959 ) ( HOLDING ?auto_141960 ) ( CLEAR ?auto_141955 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_141957 ?auto_141954 ?auto_141955 ?auto_141960 )
      ( MAKE-2PILE ?auto_141952 ?auto_141953 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_141961 - BLOCK
      ?auto_141962 - BLOCK
    )
    :vars
    (
      ?auto_141963 - BLOCK
      ?auto_141966 - BLOCK
      ?auto_141967 - BLOCK
      ?auto_141964 - BLOCK
      ?auto_141969 - BLOCK
      ?auto_141965 - BLOCK
      ?auto_141968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141963 ?auto_141962 ) ( ON-TABLE ?auto_141961 ) ( ON ?auto_141962 ?auto_141961 ) ( not ( = ?auto_141961 ?auto_141962 ) ) ( not ( = ?auto_141961 ?auto_141963 ) ) ( not ( = ?auto_141962 ?auto_141963 ) ) ( not ( = ?auto_141961 ?auto_141966 ) ) ( not ( = ?auto_141961 ?auto_141967 ) ) ( not ( = ?auto_141962 ?auto_141966 ) ) ( not ( = ?auto_141962 ?auto_141967 ) ) ( not ( = ?auto_141963 ?auto_141966 ) ) ( not ( = ?auto_141963 ?auto_141967 ) ) ( not ( = ?auto_141966 ?auto_141967 ) ) ( ON ?auto_141966 ?auto_141963 ) ( ON-TABLE ?auto_141964 ) ( ON ?auto_141969 ?auto_141964 ) ( ON ?auto_141965 ?auto_141969 ) ( not ( = ?auto_141964 ?auto_141969 ) ) ( not ( = ?auto_141964 ?auto_141965 ) ) ( not ( = ?auto_141964 ?auto_141968 ) ) ( not ( = ?auto_141964 ?auto_141967 ) ) ( not ( = ?auto_141969 ?auto_141965 ) ) ( not ( = ?auto_141969 ?auto_141968 ) ) ( not ( = ?auto_141969 ?auto_141967 ) ) ( not ( = ?auto_141965 ?auto_141968 ) ) ( not ( = ?auto_141965 ?auto_141967 ) ) ( not ( = ?auto_141968 ?auto_141967 ) ) ( not ( = ?auto_141961 ?auto_141968 ) ) ( not ( = ?auto_141961 ?auto_141964 ) ) ( not ( = ?auto_141961 ?auto_141969 ) ) ( not ( = ?auto_141961 ?auto_141965 ) ) ( not ( = ?auto_141962 ?auto_141968 ) ) ( not ( = ?auto_141962 ?auto_141964 ) ) ( not ( = ?auto_141962 ?auto_141969 ) ) ( not ( = ?auto_141962 ?auto_141965 ) ) ( not ( = ?auto_141963 ?auto_141968 ) ) ( not ( = ?auto_141963 ?auto_141964 ) ) ( not ( = ?auto_141963 ?auto_141969 ) ) ( not ( = ?auto_141963 ?auto_141965 ) ) ( not ( = ?auto_141966 ?auto_141968 ) ) ( not ( = ?auto_141966 ?auto_141964 ) ) ( not ( = ?auto_141966 ?auto_141969 ) ) ( not ( = ?auto_141966 ?auto_141965 ) ) ( ON ?auto_141967 ?auto_141966 ) ( CLEAR ?auto_141965 ) ( ON ?auto_141968 ?auto_141967 ) ( CLEAR ?auto_141968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_141961 ?auto_141962 ?auto_141963 ?auto_141966 ?auto_141967 )
      ( MAKE-2PILE ?auto_141961 ?auto_141962 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_141970 - BLOCK
      ?auto_141971 - BLOCK
    )
    :vars
    (
      ?auto_141973 - BLOCK
      ?auto_141974 - BLOCK
      ?auto_141972 - BLOCK
      ?auto_141977 - BLOCK
      ?auto_141978 - BLOCK
      ?auto_141976 - BLOCK
      ?auto_141975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141973 ?auto_141971 ) ( ON-TABLE ?auto_141970 ) ( ON ?auto_141971 ?auto_141970 ) ( not ( = ?auto_141970 ?auto_141971 ) ) ( not ( = ?auto_141970 ?auto_141973 ) ) ( not ( = ?auto_141971 ?auto_141973 ) ) ( not ( = ?auto_141970 ?auto_141974 ) ) ( not ( = ?auto_141970 ?auto_141972 ) ) ( not ( = ?auto_141971 ?auto_141974 ) ) ( not ( = ?auto_141971 ?auto_141972 ) ) ( not ( = ?auto_141973 ?auto_141974 ) ) ( not ( = ?auto_141973 ?auto_141972 ) ) ( not ( = ?auto_141974 ?auto_141972 ) ) ( ON ?auto_141974 ?auto_141973 ) ( ON-TABLE ?auto_141977 ) ( ON ?auto_141978 ?auto_141977 ) ( not ( = ?auto_141977 ?auto_141978 ) ) ( not ( = ?auto_141977 ?auto_141976 ) ) ( not ( = ?auto_141977 ?auto_141975 ) ) ( not ( = ?auto_141977 ?auto_141972 ) ) ( not ( = ?auto_141978 ?auto_141976 ) ) ( not ( = ?auto_141978 ?auto_141975 ) ) ( not ( = ?auto_141978 ?auto_141972 ) ) ( not ( = ?auto_141976 ?auto_141975 ) ) ( not ( = ?auto_141976 ?auto_141972 ) ) ( not ( = ?auto_141975 ?auto_141972 ) ) ( not ( = ?auto_141970 ?auto_141975 ) ) ( not ( = ?auto_141970 ?auto_141977 ) ) ( not ( = ?auto_141970 ?auto_141978 ) ) ( not ( = ?auto_141970 ?auto_141976 ) ) ( not ( = ?auto_141971 ?auto_141975 ) ) ( not ( = ?auto_141971 ?auto_141977 ) ) ( not ( = ?auto_141971 ?auto_141978 ) ) ( not ( = ?auto_141971 ?auto_141976 ) ) ( not ( = ?auto_141973 ?auto_141975 ) ) ( not ( = ?auto_141973 ?auto_141977 ) ) ( not ( = ?auto_141973 ?auto_141978 ) ) ( not ( = ?auto_141973 ?auto_141976 ) ) ( not ( = ?auto_141974 ?auto_141975 ) ) ( not ( = ?auto_141974 ?auto_141977 ) ) ( not ( = ?auto_141974 ?auto_141978 ) ) ( not ( = ?auto_141974 ?auto_141976 ) ) ( ON ?auto_141972 ?auto_141974 ) ( ON ?auto_141975 ?auto_141972 ) ( CLEAR ?auto_141975 ) ( HOLDING ?auto_141976 ) ( CLEAR ?auto_141978 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_141977 ?auto_141978 ?auto_141976 )
      ( MAKE-2PILE ?auto_141970 ?auto_141971 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_141979 - BLOCK
      ?auto_141980 - BLOCK
    )
    :vars
    (
      ?auto_141984 - BLOCK
      ?auto_141987 - BLOCK
      ?auto_141986 - BLOCK
      ?auto_141982 - BLOCK
      ?auto_141981 - BLOCK
      ?auto_141983 - BLOCK
      ?auto_141985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141984 ?auto_141980 ) ( ON-TABLE ?auto_141979 ) ( ON ?auto_141980 ?auto_141979 ) ( not ( = ?auto_141979 ?auto_141980 ) ) ( not ( = ?auto_141979 ?auto_141984 ) ) ( not ( = ?auto_141980 ?auto_141984 ) ) ( not ( = ?auto_141979 ?auto_141987 ) ) ( not ( = ?auto_141979 ?auto_141986 ) ) ( not ( = ?auto_141980 ?auto_141987 ) ) ( not ( = ?auto_141980 ?auto_141986 ) ) ( not ( = ?auto_141984 ?auto_141987 ) ) ( not ( = ?auto_141984 ?auto_141986 ) ) ( not ( = ?auto_141987 ?auto_141986 ) ) ( ON ?auto_141987 ?auto_141984 ) ( ON-TABLE ?auto_141982 ) ( ON ?auto_141981 ?auto_141982 ) ( not ( = ?auto_141982 ?auto_141981 ) ) ( not ( = ?auto_141982 ?auto_141983 ) ) ( not ( = ?auto_141982 ?auto_141985 ) ) ( not ( = ?auto_141982 ?auto_141986 ) ) ( not ( = ?auto_141981 ?auto_141983 ) ) ( not ( = ?auto_141981 ?auto_141985 ) ) ( not ( = ?auto_141981 ?auto_141986 ) ) ( not ( = ?auto_141983 ?auto_141985 ) ) ( not ( = ?auto_141983 ?auto_141986 ) ) ( not ( = ?auto_141985 ?auto_141986 ) ) ( not ( = ?auto_141979 ?auto_141985 ) ) ( not ( = ?auto_141979 ?auto_141982 ) ) ( not ( = ?auto_141979 ?auto_141981 ) ) ( not ( = ?auto_141979 ?auto_141983 ) ) ( not ( = ?auto_141980 ?auto_141985 ) ) ( not ( = ?auto_141980 ?auto_141982 ) ) ( not ( = ?auto_141980 ?auto_141981 ) ) ( not ( = ?auto_141980 ?auto_141983 ) ) ( not ( = ?auto_141984 ?auto_141985 ) ) ( not ( = ?auto_141984 ?auto_141982 ) ) ( not ( = ?auto_141984 ?auto_141981 ) ) ( not ( = ?auto_141984 ?auto_141983 ) ) ( not ( = ?auto_141987 ?auto_141985 ) ) ( not ( = ?auto_141987 ?auto_141982 ) ) ( not ( = ?auto_141987 ?auto_141981 ) ) ( not ( = ?auto_141987 ?auto_141983 ) ) ( ON ?auto_141986 ?auto_141987 ) ( ON ?auto_141985 ?auto_141986 ) ( CLEAR ?auto_141981 ) ( ON ?auto_141983 ?auto_141985 ) ( CLEAR ?auto_141983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_141979 ?auto_141980 ?auto_141984 ?auto_141987 ?auto_141986 ?auto_141985 )
      ( MAKE-2PILE ?auto_141979 ?auto_141980 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_141988 - BLOCK
      ?auto_141989 - BLOCK
    )
    :vars
    (
      ?auto_141993 - BLOCK
      ?auto_141994 - BLOCK
      ?auto_141995 - BLOCK
      ?auto_141991 - BLOCK
      ?auto_141992 - BLOCK
      ?auto_141990 - BLOCK
      ?auto_141996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141993 ?auto_141989 ) ( ON-TABLE ?auto_141988 ) ( ON ?auto_141989 ?auto_141988 ) ( not ( = ?auto_141988 ?auto_141989 ) ) ( not ( = ?auto_141988 ?auto_141993 ) ) ( not ( = ?auto_141989 ?auto_141993 ) ) ( not ( = ?auto_141988 ?auto_141994 ) ) ( not ( = ?auto_141988 ?auto_141995 ) ) ( not ( = ?auto_141989 ?auto_141994 ) ) ( not ( = ?auto_141989 ?auto_141995 ) ) ( not ( = ?auto_141993 ?auto_141994 ) ) ( not ( = ?auto_141993 ?auto_141995 ) ) ( not ( = ?auto_141994 ?auto_141995 ) ) ( ON ?auto_141994 ?auto_141993 ) ( ON-TABLE ?auto_141991 ) ( not ( = ?auto_141991 ?auto_141992 ) ) ( not ( = ?auto_141991 ?auto_141990 ) ) ( not ( = ?auto_141991 ?auto_141996 ) ) ( not ( = ?auto_141991 ?auto_141995 ) ) ( not ( = ?auto_141992 ?auto_141990 ) ) ( not ( = ?auto_141992 ?auto_141996 ) ) ( not ( = ?auto_141992 ?auto_141995 ) ) ( not ( = ?auto_141990 ?auto_141996 ) ) ( not ( = ?auto_141990 ?auto_141995 ) ) ( not ( = ?auto_141996 ?auto_141995 ) ) ( not ( = ?auto_141988 ?auto_141996 ) ) ( not ( = ?auto_141988 ?auto_141991 ) ) ( not ( = ?auto_141988 ?auto_141992 ) ) ( not ( = ?auto_141988 ?auto_141990 ) ) ( not ( = ?auto_141989 ?auto_141996 ) ) ( not ( = ?auto_141989 ?auto_141991 ) ) ( not ( = ?auto_141989 ?auto_141992 ) ) ( not ( = ?auto_141989 ?auto_141990 ) ) ( not ( = ?auto_141993 ?auto_141996 ) ) ( not ( = ?auto_141993 ?auto_141991 ) ) ( not ( = ?auto_141993 ?auto_141992 ) ) ( not ( = ?auto_141993 ?auto_141990 ) ) ( not ( = ?auto_141994 ?auto_141996 ) ) ( not ( = ?auto_141994 ?auto_141991 ) ) ( not ( = ?auto_141994 ?auto_141992 ) ) ( not ( = ?auto_141994 ?auto_141990 ) ) ( ON ?auto_141995 ?auto_141994 ) ( ON ?auto_141996 ?auto_141995 ) ( ON ?auto_141990 ?auto_141996 ) ( CLEAR ?auto_141990 ) ( HOLDING ?auto_141992 ) ( CLEAR ?auto_141991 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_141991 ?auto_141992 )
      ( MAKE-2PILE ?auto_141988 ?auto_141989 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_141997 - BLOCK
      ?auto_141998 - BLOCK
    )
    :vars
    (
      ?auto_142005 - BLOCK
      ?auto_142002 - BLOCK
      ?auto_141999 - BLOCK
      ?auto_142004 - BLOCK
      ?auto_142003 - BLOCK
      ?auto_142000 - BLOCK
      ?auto_142001 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142005 ?auto_141998 ) ( ON-TABLE ?auto_141997 ) ( ON ?auto_141998 ?auto_141997 ) ( not ( = ?auto_141997 ?auto_141998 ) ) ( not ( = ?auto_141997 ?auto_142005 ) ) ( not ( = ?auto_141998 ?auto_142005 ) ) ( not ( = ?auto_141997 ?auto_142002 ) ) ( not ( = ?auto_141997 ?auto_141999 ) ) ( not ( = ?auto_141998 ?auto_142002 ) ) ( not ( = ?auto_141998 ?auto_141999 ) ) ( not ( = ?auto_142005 ?auto_142002 ) ) ( not ( = ?auto_142005 ?auto_141999 ) ) ( not ( = ?auto_142002 ?auto_141999 ) ) ( ON ?auto_142002 ?auto_142005 ) ( ON-TABLE ?auto_142004 ) ( not ( = ?auto_142004 ?auto_142003 ) ) ( not ( = ?auto_142004 ?auto_142000 ) ) ( not ( = ?auto_142004 ?auto_142001 ) ) ( not ( = ?auto_142004 ?auto_141999 ) ) ( not ( = ?auto_142003 ?auto_142000 ) ) ( not ( = ?auto_142003 ?auto_142001 ) ) ( not ( = ?auto_142003 ?auto_141999 ) ) ( not ( = ?auto_142000 ?auto_142001 ) ) ( not ( = ?auto_142000 ?auto_141999 ) ) ( not ( = ?auto_142001 ?auto_141999 ) ) ( not ( = ?auto_141997 ?auto_142001 ) ) ( not ( = ?auto_141997 ?auto_142004 ) ) ( not ( = ?auto_141997 ?auto_142003 ) ) ( not ( = ?auto_141997 ?auto_142000 ) ) ( not ( = ?auto_141998 ?auto_142001 ) ) ( not ( = ?auto_141998 ?auto_142004 ) ) ( not ( = ?auto_141998 ?auto_142003 ) ) ( not ( = ?auto_141998 ?auto_142000 ) ) ( not ( = ?auto_142005 ?auto_142001 ) ) ( not ( = ?auto_142005 ?auto_142004 ) ) ( not ( = ?auto_142005 ?auto_142003 ) ) ( not ( = ?auto_142005 ?auto_142000 ) ) ( not ( = ?auto_142002 ?auto_142001 ) ) ( not ( = ?auto_142002 ?auto_142004 ) ) ( not ( = ?auto_142002 ?auto_142003 ) ) ( not ( = ?auto_142002 ?auto_142000 ) ) ( ON ?auto_141999 ?auto_142002 ) ( ON ?auto_142001 ?auto_141999 ) ( ON ?auto_142000 ?auto_142001 ) ( CLEAR ?auto_142004 ) ( ON ?auto_142003 ?auto_142000 ) ( CLEAR ?auto_142003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_141997 ?auto_141998 ?auto_142005 ?auto_142002 ?auto_141999 ?auto_142001 ?auto_142000 )
      ( MAKE-2PILE ?auto_141997 ?auto_141998 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_142006 - BLOCK
      ?auto_142007 - BLOCK
    )
    :vars
    (
      ?auto_142012 - BLOCK
      ?auto_142014 - BLOCK
      ?auto_142013 - BLOCK
      ?auto_142009 - BLOCK
      ?auto_142011 - BLOCK
      ?auto_142010 - BLOCK
      ?auto_142008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142012 ?auto_142007 ) ( ON-TABLE ?auto_142006 ) ( ON ?auto_142007 ?auto_142006 ) ( not ( = ?auto_142006 ?auto_142007 ) ) ( not ( = ?auto_142006 ?auto_142012 ) ) ( not ( = ?auto_142007 ?auto_142012 ) ) ( not ( = ?auto_142006 ?auto_142014 ) ) ( not ( = ?auto_142006 ?auto_142013 ) ) ( not ( = ?auto_142007 ?auto_142014 ) ) ( not ( = ?auto_142007 ?auto_142013 ) ) ( not ( = ?auto_142012 ?auto_142014 ) ) ( not ( = ?auto_142012 ?auto_142013 ) ) ( not ( = ?auto_142014 ?auto_142013 ) ) ( ON ?auto_142014 ?auto_142012 ) ( not ( = ?auto_142009 ?auto_142011 ) ) ( not ( = ?auto_142009 ?auto_142010 ) ) ( not ( = ?auto_142009 ?auto_142008 ) ) ( not ( = ?auto_142009 ?auto_142013 ) ) ( not ( = ?auto_142011 ?auto_142010 ) ) ( not ( = ?auto_142011 ?auto_142008 ) ) ( not ( = ?auto_142011 ?auto_142013 ) ) ( not ( = ?auto_142010 ?auto_142008 ) ) ( not ( = ?auto_142010 ?auto_142013 ) ) ( not ( = ?auto_142008 ?auto_142013 ) ) ( not ( = ?auto_142006 ?auto_142008 ) ) ( not ( = ?auto_142006 ?auto_142009 ) ) ( not ( = ?auto_142006 ?auto_142011 ) ) ( not ( = ?auto_142006 ?auto_142010 ) ) ( not ( = ?auto_142007 ?auto_142008 ) ) ( not ( = ?auto_142007 ?auto_142009 ) ) ( not ( = ?auto_142007 ?auto_142011 ) ) ( not ( = ?auto_142007 ?auto_142010 ) ) ( not ( = ?auto_142012 ?auto_142008 ) ) ( not ( = ?auto_142012 ?auto_142009 ) ) ( not ( = ?auto_142012 ?auto_142011 ) ) ( not ( = ?auto_142012 ?auto_142010 ) ) ( not ( = ?auto_142014 ?auto_142008 ) ) ( not ( = ?auto_142014 ?auto_142009 ) ) ( not ( = ?auto_142014 ?auto_142011 ) ) ( not ( = ?auto_142014 ?auto_142010 ) ) ( ON ?auto_142013 ?auto_142014 ) ( ON ?auto_142008 ?auto_142013 ) ( ON ?auto_142010 ?auto_142008 ) ( ON ?auto_142011 ?auto_142010 ) ( CLEAR ?auto_142011 ) ( HOLDING ?auto_142009 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_142009 )
      ( MAKE-2PILE ?auto_142006 ?auto_142007 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_142015 - BLOCK
      ?auto_142016 - BLOCK
    )
    :vars
    (
      ?auto_142022 - BLOCK
      ?auto_142017 - BLOCK
      ?auto_142019 - BLOCK
      ?auto_142020 - BLOCK
      ?auto_142021 - BLOCK
      ?auto_142018 - BLOCK
      ?auto_142023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142022 ?auto_142016 ) ( ON-TABLE ?auto_142015 ) ( ON ?auto_142016 ?auto_142015 ) ( not ( = ?auto_142015 ?auto_142016 ) ) ( not ( = ?auto_142015 ?auto_142022 ) ) ( not ( = ?auto_142016 ?auto_142022 ) ) ( not ( = ?auto_142015 ?auto_142017 ) ) ( not ( = ?auto_142015 ?auto_142019 ) ) ( not ( = ?auto_142016 ?auto_142017 ) ) ( not ( = ?auto_142016 ?auto_142019 ) ) ( not ( = ?auto_142022 ?auto_142017 ) ) ( not ( = ?auto_142022 ?auto_142019 ) ) ( not ( = ?auto_142017 ?auto_142019 ) ) ( ON ?auto_142017 ?auto_142022 ) ( not ( = ?auto_142020 ?auto_142021 ) ) ( not ( = ?auto_142020 ?auto_142018 ) ) ( not ( = ?auto_142020 ?auto_142023 ) ) ( not ( = ?auto_142020 ?auto_142019 ) ) ( not ( = ?auto_142021 ?auto_142018 ) ) ( not ( = ?auto_142021 ?auto_142023 ) ) ( not ( = ?auto_142021 ?auto_142019 ) ) ( not ( = ?auto_142018 ?auto_142023 ) ) ( not ( = ?auto_142018 ?auto_142019 ) ) ( not ( = ?auto_142023 ?auto_142019 ) ) ( not ( = ?auto_142015 ?auto_142023 ) ) ( not ( = ?auto_142015 ?auto_142020 ) ) ( not ( = ?auto_142015 ?auto_142021 ) ) ( not ( = ?auto_142015 ?auto_142018 ) ) ( not ( = ?auto_142016 ?auto_142023 ) ) ( not ( = ?auto_142016 ?auto_142020 ) ) ( not ( = ?auto_142016 ?auto_142021 ) ) ( not ( = ?auto_142016 ?auto_142018 ) ) ( not ( = ?auto_142022 ?auto_142023 ) ) ( not ( = ?auto_142022 ?auto_142020 ) ) ( not ( = ?auto_142022 ?auto_142021 ) ) ( not ( = ?auto_142022 ?auto_142018 ) ) ( not ( = ?auto_142017 ?auto_142023 ) ) ( not ( = ?auto_142017 ?auto_142020 ) ) ( not ( = ?auto_142017 ?auto_142021 ) ) ( not ( = ?auto_142017 ?auto_142018 ) ) ( ON ?auto_142019 ?auto_142017 ) ( ON ?auto_142023 ?auto_142019 ) ( ON ?auto_142018 ?auto_142023 ) ( ON ?auto_142021 ?auto_142018 ) ( ON ?auto_142020 ?auto_142021 ) ( CLEAR ?auto_142020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_142015 ?auto_142016 ?auto_142022 ?auto_142017 ?auto_142019 ?auto_142023 ?auto_142018 ?auto_142021 )
      ( MAKE-2PILE ?auto_142015 ?auto_142016 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142031 - BLOCK
      ?auto_142032 - BLOCK
      ?auto_142033 - BLOCK
      ?auto_142034 - BLOCK
      ?auto_142035 - BLOCK
      ?auto_142036 - BLOCK
      ?auto_142037 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_142037 ) ( CLEAR ?auto_142036 ) ( ON-TABLE ?auto_142031 ) ( ON ?auto_142032 ?auto_142031 ) ( ON ?auto_142033 ?auto_142032 ) ( ON ?auto_142034 ?auto_142033 ) ( ON ?auto_142035 ?auto_142034 ) ( ON ?auto_142036 ?auto_142035 ) ( not ( = ?auto_142031 ?auto_142032 ) ) ( not ( = ?auto_142031 ?auto_142033 ) ) ( not ( = ?auto_142031 ?auto_142034 ) ) ( not ( = ?auto_142031 ?auto_142035 ) ) ( not ( = ?auto_142031 ?auto_142036 ) ) ( not ( = ?auto_142031 ?auto_142037 ) ) ( not ( = ?auto_142032 ?auto_142033 ) ) ( not ( = ?auto_142032 ?auto_142034 ) ) ( not ( = ?auto_142032 ?auto_142035 ) ) ( not ( = ?auto_142032 ?auto_142036 ) ) ( not ( = ?auto_142032 ?auto_142037 ) ) ( not ( = ?auto_142033 ?auto_142034 ) ) ( not ( = ?auto_142033 ?auto_142035 ) ) ( not ( = ?auto_142033 ?auto_142036 ) ) ( not ( = ?auto_142033 ?auto_142037 ) ) ( not ( = ?auto_142034 ?auto_142035 ) ) ( not ( = ?auto_142034 ?auto_142036 ) ) ( not ( = ?auto_142034 ?auto_142037 ) ) ( not ( = ?auto_142035 ?auto_142036 ) ) ( not ( = ?auto_142035 ?auto_142037 ) ) ( not ( = ?auto_142036 ?auto_142037 ) ) )
    :subtasks
    ( ( !STACK ?auto_142037 ?auto_142036 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142038 - BLOCK
      ?auto_142039 - BLOCK
      ?auto_142040 - BLOCK
      ?auto_142041 - BLOCK
      ?auto_142042 - BLOCK
      ?auto_142043 - BLOCK
      ?auto_142044 - BLOCK
    )
    :vars
    (
      ?auto_142045 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_142043 ) ( ON-TABLE ?auto_142038 ) ( ON ?auto_142039 ?auto_142038 ) ( ON ?auto_142040 ?auto_142039 ) ( ON ?auto_142041 ?auto_142040 ) ( ON ?auto_142042 ?auto_142041 ) ( ON ?auto_142043 ?auto_142042 ) ( not ( = ?auto_142038 ?auto_142039 ) ) ( not ( = ?auto_142038 ?auto_142040 ) ) ( not ( = ?auto_142038 ?auto_142041 ) ) ( not ( = ?auto_142038 ?auto_142042 ) ) ( not ( = ?auto_142038 ?auto_142043 ) ) ( not ( = ?auto_142038 ?auto_142044 ) ) ( not ( = ?auto_142039 ?auto_142040 ) ) ( not ( = ?auto_142039 ?auto_142041 ) ) ( not ( = ?auto_142039 ?auto_142042 ) ) ( not ( = ?auto_142039 ?auto_142043 ) ) ( not ( = ?auto_142039 ?auto_142044 ) ) ( not ( = ?auto_142040 ?auto_142041 ) ) ( not ( = ?auto_142040 ?auto_142042 ) ) ( not ( = ?auto_142040 ?auto_142043 ) ) ( not ( = ?auto_142040 ?auto_142044 ) ) ( not ( = ?auto_142041 ?auto_142042 ) ) ( not ( = ?auto_142041 ?auto_142043 ) ) ( not ( = ?auto_142041 ?auto_142044 ) ) ( not ( = ?auto_142042 ?auto_142043 ) ) ( not ( = ?auto_142042 ?auto_142044 ) ) ( not ( = ?auto_142043 ?auto_142044 ) ) ( ON ?auto_142044 ?auto_142045 ) ( CLEAR ?auto_142044 ) ( HAND-EMPTY ) ( not ( = ?auto_142038 ?auto_142045 ) ) ( not ( = ?auto_142039 ?auto_142045 ) ) ( not ( = ?auto_142040 ?auto_142045 ) ) ( not ( = ?auto_142041 ?auto_142045 ) ) ( not ( = ?auto_142042 ?auto_142045 ) ) ( not ( = ?auto_142043 ?auto_142045 ) ) ( not ( = ?auto_142044 ?auto_142045 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_142044 ?auto_142045 )
      ( MAKE-7PILE ?auto_142038 ?auto_142039 ?auto_142040 ?auto_142041 ?auto_142042 ?auto_142043 ?auto_142044 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142046 - BLOCK
      ?auto_142047 - BLOCK
      ?auto_142048 - BLOCK
      ?auto_142049 - BLOCK
      ?auto_142050 - BLOCK
      ?auto_142051 - BLOCK
      ?auto_142052 - BLOCK
    )
    :vars
    (
      ?auto_142053 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142046 ) ( ON ?auto_142047 ?auto_142046 ) ( ON ?auto_142048 ?auto_142047 ) ( ON ?auto_142049 ?auto_142048 ) ( ON ?auto_142050 ?auto_142049 ) ( not ( = ?auto_142046 ?auto_142047 ) ) ( not ( = ?auto_142046 ?auto_142048 ) ) ( not ( = ?auto_142046 ?auto_142049 ) ) ( not ( = ?auto_142046 ?auto_142050 ) ) ( not ( = ?auto_142046 ?auto_142051 ) ) ( not ( = ?auto_142046 ?auto_142052 ) ) ( not ( = ?auto_142047 ?auto_142048 ) ) ( not ( = ?auto_142047 ?auto_142049 ) ) ( not ( = ?auto_142047 ?auto_142050 ) ) ( not ( = ?auto_142047 ?auto_142051 ) ) ( not ( = ?auto_142047 ?auto_142052 ) ) ( not ( = ?auto_142048 ?auto_142049 ) ) ( not ( = ?auto_142048 ?auto_142050 ) ) ( not ( = ?auto_142048 ?auto_142051 ) ) ( not ( = ?auto_142048 ?auto_142052 ) ) ( not ( = ?auto_142049 ?auto_142050 ) ) ( not ( = ?auto_142049 ?auto_142051 ) ) ( not ( = ?auto_142049 ?auto_142052 ) ) ( not ( = ?auto_142050 ?auto_142051 ) ) ( not ( = ?auto_142050 ?auto_142052 ) ) ( not ( = ?auto_142051 ?auto_142052 ) ) ( ON ?auto_142052 ?auto_142053 ) ( CLEAR ?auto_142052 ) ( not ( = ?auto_142046 ?auto_142053 ) ) ( not ( = ?auto_142047 ?auto_142053 ) ) ( not ( = ?auto_142048 ?auto_142053 ) ) ( not ( = ?auto_142049 ?auto_142053 ) ) ( not ( = ?auto_142050 ?auto_142053 ) ) ( not ( = ?auto_142051 ?auto_142053 ) ) ( not ( = ?auto_142052 ?auto_142053 ) ) ( HOLDING ?auto_142051 ) ( CLEAR ?auto_142050 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_142046 ?auto_142047 ?auto_142048 ?auto_142049 ?auto_142050 ?auto_142051 )
      ( MAKE-7PILE ?auto_142046 ?auto_142047 ?auto_142048 ?auto_142049 ?auto_142050 ?auto_142051 ?auto_142052 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142054 - BLOCK
      ?auto_142055 - BLOCK
      ?auto_142056 - BLOCK
      ?auto_142057 - BLOCK
      ?auto_142058 - BLOCK
      ?auto_142059 - BLOCK
      ?auto_142060 - BLOCK
    )
    :vars
    (
      ?auto_142061 - BLOCK
      ?auto_142062 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142054 ) ( ON ?auto_142055 ?auto_142054 ) ( ON ?auto_142056 ?auto_142055 ) ( ON ?auto_142057 ?auto_142056 ) ( ON ?auto_142058 ?auto_142057 ) ( not ( = ?auto_142054 ?auto_142055 ) ) ( not ( = ?auto_142054 ?auto_142056 ) ) ( not ( = ?auto_142054 ?auto_142057 ) ) ( not ( = ?auto_142054 ?auto_142058 ) ) ( not ( = ?auto_142054 ?auto_142059 ) ) ( not ( = ?auto_142054 ?auto_142060 ) ) ( not ( = ?auto_142055 ?auto_142056 ) ) ( not ( = ?auto_142055 ?auto_142057 ) ) ( not ( = ?auto_142055 ?auto_142058 ) ) ( not ( = ?auto_142055 ?auto_142059 ) ) ( not ( = ?auto_142055 ?auto_142060 ) ) ( not ( = ?auto_142056 ?auto_142057 ) ) ( not ( = ?auto_142056 ?auto_142058 ) ) ( not ( = ?auto_142056 ?auto_142059 ) ) ( not ( = ?auto_142056 ?auto_142060 ) ) ( not ( = ?auto_142057 ?auto_142058 ) ) ( not ( = ?auto_142057 ?auto_142059 ) ) ( not ( = ?auto_142057 ?auto_142060 ) ) ( not ( = ?auto_142058 ?auto_142059 ) ) ( not ( = ?auto_142058 ?auto_142060 ) ) ( not ( = ?auto_142059 ?auto_142060 ) ) ( ON ?auto_142060 ?auto_142061 ) ( not ( = ?auto_142054 ?auto_142061 ) ) ( not ( = ?auto_142055 ?auto_142061 ) ) ( not ( = ?auto_142056 ?auto_142061 ) ) ( not ( = ?auto_142057 ?auto_142061 ) ) ( not ( = ?auto_142058 ?auto_142061 ) ) ( not ( = ?auto_142059 ?auto_142061 ) ) ( not ( = ?auto_142060 ?auto_142061 ) ) ( CLEAR ?auto_142058 ) ( ON ?auto_142059 ?auto_142060 ) ( CLEAR ?auto_142059 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_142062 ) ( ON ?auto_142061 ?auto_142062 ) ( not ( = ?auto_142062 ?auto_142061 ) ) ( not ( = ?auto_142062 ?auto_142060 ) ) ( not ( = ?auto_142062 ?auto_142059 ) ) ( not ( = ?auto_142054 ?auto_142062 ) ) ( not ( = ?auto_142055 ?auto_142062 ) ) ( not ( = ?auto_142056 ?auto_142062 ) ) ( not ( = ?auto_142057 ?auto_142062 ) ) ( not ( = ?auto_142058 ?auto_142062 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_142062 ?auto_142061 ?auto_142060 )
      ( MAKE-7PILE ?auto_142054 ?auto_142055 ?auto_142056 ?auto_142057 ?auto_142058 ?auto_142059 ?auto_142060 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142063 - BLOCK
      ?auto_142064 - BLOCK
      ?auto_142065 - BLOCK
      ?auto_142066 - BLOCK
      ?auto_142067 - BLOCK
      ?auto_142068 - BLOCK
      ?auto_142069 - BLOCK
    )
    :vars
    (
      ?auto_142070 - BLOCK
      ?auto_142071 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142063 ) ( ON ?auto_142064 ?auto_142063 ) ( ON ?auto_142065 ?auto_142064 ) ( ON ?auto_142066 ?auto_142065 ) ( not ( = ?auto_142063 ?auto_142064 ) ) ( not ( = ?auto_142063 ?auto_142065 ) ) ( not ( = ?auto_142063 ?auto_142066 ) ) ( not ( = ?auto_142063 ?auto_142067 ) ) ( not ( = ?auto_142063 ?auto_142068 ) ) ( not ( = ?auto_142063 ?auto_142069 ) ) ( not ( = ?auto_142064 ?auto_142065 ) ) ( not ( = ?auto_142064 ?auto_142066 ) ) ( not ( = ?auto_142064 ?auto_142067 ) ) ( not ( = ?auto_142064 ?auto_142068 ) ) ( not ( = ?auto_142064 ?auto_142069 ) ) ( not ( = ?auto_142065 ?auto_142066 ) ) ( not ( = ?auto_142065 ?auto_142067 ) ) ( not ( = ?auto_142065 ?auto_142068 ) ) ( not ( = ?auto_142065 ?auto_142069 ) ) ( not ( = ?auto_142066 ?auto_142067 ) ) ( not ( = ?auto_142066 ?auto_142068 ) ) ( not ( = ?auto_142066 ?auto_142069 ) ) ( not ( = ?auto_142067 ?auto_142068 ) ) ( not ( = ?auto_142067 ?auto_142069 ) ) ( not ( = ?auto_142068 ?auto_142069 ) ) ( ON ?auto_142069 ?auto_142070 ) ( not ( = ?auto_142063 ?auto_142070 ) ) ( not ( = ?auto_142064 ?auto_142070 ) ) ( not ( = ?auto_142065 ?auto_142070 ) ) ( not ( = ?auto_142066 ?auto_142070 ) ) ( not ( = ?auto_142067 ?auto_142070 ) ) ( not ( = ?auto_142068 ?auto_142070 ) ) ( not ( = ?auto_142069 ?auto_142070 ) ) ( ON ?auto_142068 ?auto_142069 ) ( CLEAR ?auto_142068 ) ( ON-TABLE ?auto_142071 ) ( ON ?auto_142070 ?auto_142071 ) ( not ( = ?auto_142071 ?auto_142070 ) ) ( not ( = ?auto_142071 ?auto_142069 ) ) ( not ( = ?auto_142071 ?auto_142068 ) ) ( not ( = ?auto_142063 ?auto_142071 ) ) ( not ( = ?auto_142064 ?auto_142071 ) ) ( not ( = ?auto_142065 ?auto_142071 ) ) ( not ( = ?auto_142066 ?auto_142071 ) ) ( not ( = ?auto_142067 ?auto_142071 ) ) ( HOLDING ?auto_142067 ) ( CLEAR ?auto_142066 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_142063 ?auto_142064 ?auto_142065 ?auto_142066 ?auto_142067 )
      ( MAKE-7PILE ?auto_142063 ?auto_142064 ?auto_142065 ?auto_142066 ?auto_142067 ?auto_142068 ?auto_142069 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142072 - BLOCK
      ?auto_142073 - BLOCK
      ?auto_142074 - BLOCK
      ?auto_142075 - BLOCK
      ?auto_142076 - BLOCK
      ?auto_142077 - BLOCK
      ?auto_142078 - BLOCK
    )
    :vars
    (
      ?auto_142079 - BLOCK
      ?auto_142080 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142072 ) ( ON ?auto_142073 ?auto_142072 ) ( ON ?auto_142074 ?auto_142073 ) ( ON ?auto_142075 ?auto_142074 ) ( not ( = ?auto_142072 ?auto_142073 ) ) ( not ( = ?auto_142072 ?auto_142074 ) ) ( not ( = ?auto_142072 ?auto_142075 ) ) ( not ( = ?auto_142072 ?auto_142076 ) ) ( not ( = ?auto_142072 ?auto_142077 ) ) ( not ( = ?auto_142072 ?auto_142078 ) ) ( not ( = ?auto_142073 ?auto_142074 ) ) ( not ( = ?auto_142073 ?auto_142075 ) ) ( not ( = ?auto_142073 ?auto_142076 ) ) ( not ( = ?auto_142073 ?auto_142077 ) ) ( not ( = ?auto_142073 ?auto_142078 ) ) ( not ( = ?auto_142074 ?auto_142075 ) ) ( not ( = ?auto_142074 ?auto_142076 ) ) ( not ( = ?auto_142074 ?auto_142077 ) ) ( not ( = ?auto_142074 ?auto_142078 ) ) ( not ( = ?auto_142075 ?auto_142076 ) ) ( not ( = ?auto_142075 ?auto_142077 ) ) ( not ( = ?auto_142075 ?auto_142078 ) ) ( not ( = ?auto_142076 ?auto_142077 ) ) ( not ( = ?auto_142076 ?auto_142078 ) ) ( not ( = ?auto_142077 ?auto_142078 ) ) ( ON ?auto_142078 ?auto_142079 ) ( not ( = ?auto_142072 ?auto_142079 ) ) ( not ( = ?auto_142073 ?auto_142079 ) ) ( not ( = ?auto_142074 ?auto_142079 ) ) ( not ( = ?auto_142075 ?auto_142079 ) ) ( not ( = ?auto_142076 ?auto_142079 ) ) ( not ( = ?auto_142077 ?auto_142079 ) ) ( not ( = ?auto_142078 ?auto_142079 ) ) ( ON ?auto_142077 ?auto_142078 ) ( ON-TABLE ?auto_142080 ) ( ON ?auto_142079 ?auto_142080 ) ( not ( = ?auto_142080 ?auto_142079 ) ) ( not ( = ?auto_142080 ?auto_142078 ) ) ( not ( = ?auto_142080 ?auto_142077 ) ) ( not ( = ?auto_142072 ?auto_142080 ) ) ( not ( = ?auto_142073 ?auto_142080 ) ) ( not ( = ?auto_142074 ?auto_142080 ) ) ( not ( = ?auto_142075 ?auto_142080 ) ) ( not ( = ?auto_142076 ?auto_142080 ) ) ( CLEAR ?auto_142075 ) ( ON ?auto_142076 ?auto_142077 ) ( CLEAR ?auto_142076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_142080 ?auto_142079 ?auto_142078 ?auto_142077 )
      ( MAKE-7PILE ?auto_142072 ?auto_142073 ?auto_142074 ?auto_142075 ?auto_142076 ?auto_142077 ?auto_142078 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142081 - BLOCK
      ?auto_142082 - BLOCK
      ?auto_142083 - BLOCK
      ?auto_142084 - BLOCK
      ?auto_142085 - BLOCK
      ?auto_142086 - BLOCK
      ?auto_142087 - BLOCK
    )
    :vars
    (
      ?auto_142088 - BLOCK
      ?auto_142089 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142081 ) ( ON ?auto_142082 ?auto_142081 ) ( ON ?auto_142083 ?auto_142082 ) ( not ( = ?auto_142081 ?auto_142082 ) ) ( not ( = ?auto_142081 ?auto_142083 ) ) ( not ( = ?auto_142081 ?auto_142084 ) ) ( not ( = ?auto_142081 ?auto_142085 ) ) ( not ( = ?auto_142081 ?auto_142086 ) ) ( not ( = ?auto_142081 ?auto_142087 ) ) ( not ( = ?auto_142082 ?auto_142083 ) ) ( not ( = ?auto_142082 ?auto_142084 ) ) ( not ( = ?auto_142082 ?auto_142085 ) ) ( not ( = ?auto_142082 ?auto_142086 ) ) ( not ( = ?auto_142082 ?auto_142087 ) ) ( not ( = ?auto_142083 ?auto_142084 ) ) ( not ( = ?auto_142083 ?auto_142085 ) ) ( not ( = ?auto_142083 ?auto_142086 ) ) ( not ( = ?auto_142083 ?auto_142087 ) ) ( not ( = ?auto_142084 ?auto_142085 ) ) ( not ( = ?auto_142084 ?auto_142086 ) ) ( not ( = ?auto_142084 ?auto_142087 ) ) ( not ( = ?auto_142085 ?auto_142086 ) ) ( not ( = ?auto_142085 ?auto_142087 ) ) ( not ( = ?auto_142086 ?auto_142087 ) ) ( ON ?auto_142087 ?auto_142088 ) ( not ( = ?auto_142081 ?auto_142088 ) ) ( not ( = ?auto_142082 ?auto_142088 ) ) ( not ( = ?auto_142083 ?auto_142088 ) ) ( not ( = ?auto_142084 ?auto_142088 ) ) ( not ( = ?auto_142085 ?auto_142088 ) ) ( not ( = ?auto_142086 ?auto_142088 ) ) ( not ( = ?auto_142087 ?auto_142088 ) ) ( ON ?auto_142086 ?auto_142087 ) ( ON-TABLE ?auto_142089 ) ( ON ?auto_142088 ?auto_142089 ) ( not ( = ?auto_142089 ?auto_142088 ) ) ( not ( = ?auto_142089 ?auto_142087 ) ) ( not ( = ?auto_142089 ?auto_142086 ) ) ( not ( = ?auto_142081 ?auto_142089 ) ) ( not ( = ?auto_142082 ?auto_142089 ) ) ( not ( = ?auto_142083 ?auto_142089 ) ) ( not ( = ?auto_142084 ?auto_142089 ) ) ( not ( = ?auto_142085 ?auto_142089 ) ) ( ON ?auto_142085 ?auto_142086 ) ( CLEAR ?auto_142085 ) ( HOLDING ?auto_142084 ) ( CLEAR ?auto_142083 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_142081 ?auto_142082 ?auto_142083 ?auto_142084 )
      ( MAKE-7PILE ?auto_142081 ?auto_142082 ?auto_142083 ?auto_142084 ?auto_142085 ?auto_142086 ?auto_142087 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142090 - BLOCK
      ?auto_142091 - BLOCK
      ?auto_142092 - BLOCK
      ?auto_142093 - BLOCK
      ?auto_142094 - BLOCK
      ?auto_142095 - BLOCK
      ?auto_142096 - BLOCK
    )
    :vars
    (
      ?auto_142098 - BLOCK
      ?auto_142097 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142090 ) ( ON ?auto_142091 ?auto_142090 ) ( ON ?auto_142092 ?auto_142091 ) ( not ( = ?auto_142090 ?auto_142091 ) ) ( not ( = ?auto_142090 ?auto_142092 ) ) ( not ( = ?auto_142090 ?auto_142093 ) ) ( not ( = ?auto_142090 ?auto_142094 ) ) ( not ( = ?auto_142090 ?auto_142095 ) ) ( not ( = ?auto_142090 ?auto_142096 ) ) ( not ( = ?auto_142091 ?auto_142092 ) ) ( not ( = ?auto_142091 ?auto_142093 ) ) ( not ( = ?auto_142091 ?auto_142094 ) ) ( not ( = ?auto_142091 ?auto_142095 ) ) ( not ( = ?auto_142091 ?auto_142096 ) ) ( not ( = ?auto_142092 ?auto_142093 ) ) ( not ( = ?auto_142092 ?auto_142094 ) ) ( not ( = ?auto_142092 ?auto_142095 ) ) ( not ( = ?auto_142092 ?auto_142096 ) ) ( not ( = ?auto_142093 ?auto_142094 ) ) ( not ( = ?auto_142093 ?auto_142095 ) ) ( not ( = ?auto_142093 ?auto_142096 ) ) ( not ( = ?auto_142094 ?auto_142095 ) ) ( not ( = ?auto_142094 ?auto_142096 ) ) ( not ( = ?auto_142095 ?auto_142096 ) ) ( ON ?auto_142096 ?auto_142098 ) ( not ( = ?auto_142090 ?auto_142098 ) ) ( not ( = ?auto_142091 ?auto_142098 ) ) ( not ( = ?auto_142092 ?auto_142098 ) ) ( not ( = ?auto_142093 ?auto_142098 ) ) ( not ( = ?auto_142094 ?auto_142098 ) ) ( not ( = ?auto_142095 ?auto_142098 ) ) ( not ( = ?auto_142096 ?auto_142098 ) ) ( ON ?auto_142095 ?auto_142096 ) ( ON-TABLE ?auto_142097 ) ( ON ?auto_142098 ?auto_142097 ) ( not ( = ?auto_142097 ?auto_142098 ) ) ( not ( = ?auto_142097 ?auto_142096 ) ) ( not ( = ?auto_142097 ?auto_142095 ) ) ( not ( = ?auto_142090 ?auto_142097 ) ) ( not ( = ?auto_142091 ?auto_142097 ) ) ( not ( = ?auto_142092 ?auto_142097 ) ) ( not ( = ?auto_142093 ?auto_142097 ) ) ( not ( = ?auto_142094 ?auto_142097 ) ) ( ON ?auto_142094 ?auto_142095 ) ( CLEAR ?auto_142092 ) ( ON ?auto_142093 ?auto_142094 ) ( CLEAR ?auto_142093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_142097 ?auto_142098 ?auto_142096 ?auto_142095 ?auto_142094 )
      ( MAKE-7PILE ?auto_142090 ?auto_142091 ?auto_142092 ?auto_142093 ?auto_142094 ?auto_142095 ?auto_142096 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142099 - BLOCK
      ?auto_142100 - BLOCK
      ?auto_142101 - BLOCK
      ?auto_142102 - BLOCK
      ?auto_142103 - BLOCK
      ?auto_142104 - BLOCK
      ?auto_142105 - BLOCK
    )
    :vars
    (
      ?auto_142107 - BLOCK
      ?auto_142106 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142099 ) ( ON ?auto_142100 ?auto_142099 ) ( not ( = ?auto_142099 ?auto_142100 ) ) ( not ( = ?auto_142099 ?auto_142101 ) ) ( not ( = ?auto_142099 ?auto_142102 ) ) ( not ( = ?auto_142099 ?auto_142103 ) ) ( not ( = ?auto_142099 ?auto_142104 ) ) ( not ( = ?auto_142099 ?auto_142105 ) ) ( not ( = ?auto_142100 ?auto_142101 ) ) ( not ( = ?auto_142100 ?auto_142102 ) ) ( not ( = ?auto_142100 ?auto_142103 ) ) ( not ( = ?auto_142100 ?auto_142104 ) ) ( not ( = ?auto_142100 ?auto_142105 ) ) ( not ( = ?auto_142101 ?auto_142102 ) ) ( not ( = ?auto_142101 ?auto_142103 ) ) ( not ( = ?auto_142101 ?auto_142104 ) ) ( not ( = ?auto_142101 ?auto_142105 ) ) ( not ( = ?auto_142102 ?auto_142103 ) ) ( not ( = ?auto_142102 ?auto_142104 ) ) ( not ( = ?auto_142102 ?auto_142105 ) ) ( not ( = ?auto_142103 ?auto_142104 ) ) ( not ( = ?auto_142103 ?auto_142105 ) ) ( not ( = ?auto_142104 ?auto_142105 ) ) ( ON ?auto_142105 ?auto_142107 ) ( not ( = ?auto_142099 ?auto_142107 ) ) ( not ( = ?auto_142100 ?auto_142107 ) ) ( not ( = ?auto_142101 ?auto_142107 ) ) ( not ( = ?auto_142102 ?auto_142107 ) ) ( not ( = ?auto_142103 ?auto_142107 ) ) ( not ( = ?auto_142104 ?auto_142107 ) ) ( not ( = ?auto_142105 ?auto_142107 ) ) ( ON ?auto_142104 ?auto_142105 ) ( ON-TABLE ?auto_142106 ) ( ON ?auto_142107 ?auto_142106 ) ( not ( = ?auto_142106 ?auto_142107 ) ) ( not ( = ?auto_142106 ?auto_142105 ) ) ( not ( = ?auto_142106 ?auto_142104 ) ) ( not ( = ?auto_142099 ?auto_142106 ) ) ( not ( = ?auto_142100 ?auto_142106 ) ) ( not ( = ?auto_142101 ?auto_142106 ) ) ( not ( = ?auto_142102 ?auto_142106 ) ) ( not ( = ?auto_142103 ?auto_142106 ) ) ( ON ?auto_142103 ?auto_142104 ) ( ON ?auto_142102 ?auto_142103 ) ( CLEAR ?auto_142102 ) ( HOLDING ?auto_142101 ) ( CLEAR ?auto_142100 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_142099 ?auto_142100 ?auto_142101 )
      ( MAKE-7PILE ?auto_142099 ?auto_142100 ?auto_142101 ?auto_142102 ?auto_142103 ?auto_142104 ?auto_142105 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142108 - BLOCK
      ?auto_142109 - BLOCK
      ?auto_142110 - BLOCK
      ?auto_142111 - BLOCK
      ?auto_142112 - BLOCK
      ?auto_142113 - BLOCK
      ?auto_142114 - BLOCK
    )
    :vars
    (
      ?auto_142116 - BLOCK
      ?auto_142115 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142108 ) ( ON ?auto_142109 ?auto_142108 ) ( not ( = ?auto_142108 ?auto_142109 ) ) ( not ( = ?auto_142108 ?auto_142110 ) ) ( not ( = ?auto_142108 ?auto_142111 ) ) ( not ( = ?auto_142108 ?auto_142112 ) ) ( not ( = ?auto_142108 ?auto_142113 ) ) ( not ( = ?auto_142108 ?auto_142114 ) ) ( not ( = ?auto_142109 ?auto_142110 ) ) ( not ( = ?auto_142109 ?auto_142111 ) ) ( not ( = ?auto_142109 ?auto_142112 ) ) ( not ( = ?auto_142109 ?auto_142113 ) ) ( not ( = ?auto_142109 ?auto_142114 ) ) ( not ( = ?auto_142110 ?auto_142111 ) ) ( not ( = ?auto_142110 ?auto_142112 ) ) ( not ( = ?auto_142110 ?auto_142113 ) ) ( not ( = ?auto_142110 ?auto_142114 ) ) ( not ( = ?auto_142111 ?auto_142112 ) ) ( not ( = ?auto_142111 ?auto_142113 ) ) ( not ( = ?auto_142111 ?auto_142114 ) ) ( not ( = ?auto_142112 ?auto_142113 ) ) ( not ( = ?auto_142112 ?auto_142114 ) ) ( not ( = ?auto_142113 ?auto_142114 ) ) ( ON ?auto_142114 ?auto_142116 ) ( not ( = ?auto_142108 ?auto_142116 ) ) ( not ( = ?auto_142109 ?auto_142116 ) ) ( not ( = ?auto_142110 ?auto_142116 ) ) ( not ( = ?auto_142111 ?auto_142116 ) ) ( not ( = ?auto_142112 ?auto_142116 ) ) ( not ( = ?auto_142113 ?auto_142116 ) ) ( not ( = ?auto_142114 ?auto_142116 ) ) ( ON ?auto_142113 ?auto_142114 ) ( ON-TABLE ?auto_142115 ) ( ON ?auto_142116 ?auto_142115 ) ( not ( = ?auto_142115 ?auto_142116 ) ) ( not ( = ?auto_142115 ?auto_142114 ) ) ( not ( = ?auto_142115 ?auto_142113 ) ) ( not ( = ?auto_142108 ?auto_142115 ) ) ( not ( = ?auto_142109 ?auto_142115 ) ) ( not ( = ?auto_142110 ?auto_142115 ) ) ( not ( = ?auto_142111 ?auto_142115 ) ) ( not ( = ?auto_142112 ?auto_142115 ) ) ( ON ?auto_142112 ?auto_142113 ) ( ON ?auto_142111 ?auto_142112 ) ( CLEAR ?auto_142109 ) ( ON ?auto_142110 ?auto_142111 ) ( CLEAR ?auto_142110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_142115 ?auto_142116 ?auto_142114 ?auto_142113 ?auto_142112 ?auto_142111 )
      ( MAKE-7PILE ?auto_142108 ?auto_142109 ?auto_142110 ?auto_142111 ?auto_142112 ?auto_142113 ?auto_142114 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142117 - BLOCK
      ?auto_142118 - BLOCK
      ?auto_142119 - BLOCK
      ?auto_142120 - BLOCK
      ?auto_142121 - BLOCK
      ?auto_142122 - BLOCK
      ?auto_142123 - BLOCK
    )
    :vars
    (
      ?auto_142124 - BLOCK
      ?auto_142125 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142117 ) ( not ( = ?auto_142117 ?auto_142118 ) ) ( not ( = ?auto_142117 ?auto_142119 ) ) ( not ( = ?auto_142117 ?auto_142120 ) ) ( not ( = ?auto_142117 ?auto_142121 ) ) ( not ( = ?auto_142117 ?auto_142122 ) ) ( not ( = ?auto_142117 ?auto_142123 ) ) ( not ( = ?auto_142118 ?auto_142119 ) ) ( not ( = ?auto_142118 ?auto_142120 ) ) ( not ( = ?auto_142118 ?auto_142121 ) ) ( not ( = ?auto_142118 ?auto_142122 ) ) ( not ( = ?auto_142118 ?auto_142123 ) ) ( not ( = ?auto_142119 ?auto_142120 ) ) ( not ( = ?auto_142119 ?auto_142121 ) ) ( not ( = ?auto_142119 ?auto_142122 ) ) ( not ( = ?auto_142119 ?auto_142123 ) ) ( not ( = ?auto_142120 ?auto_142121 ) ) ( not ( = ?auto_142120 ?auto_142122 ) ) ( not ( = ?auto_142120 ?auto_142123 ) ) ( not ( = ?auto_142121 ?auto_142122 ) ) ( not ( = ?auto_142121 ?auto_142123 ) ) ( not ( = ?auto_142122 ?auto_142123 ) ) ( ON ?auto_142123 ?auto_142124 ) ( not ( = ?auto_142117 ?auto_142124 ) ) ( not ( = ?auto_142118 ?auto_142124 ) ) ( not ( = ?auto_142119 ?auto_142124 ) ) ( not ( = ?auto_142120 ?auto_142124 ) ) ( not ( = ?auto_142121 ?auto_142124 ) ) ( not ( = ?auto_142122 ?auto_142124 ) ) ( not ( = ?auto_142123 ?auto_142124 ) ) ( ON ?auto_142122 ?auto_142123 ) ( ON-TABLE ?auto_142125 ) ( ON ?auto_142124 ?auto_142125 ) ( not ( = ?auto_142125 ?auto_142124 ) ) ( not ( = ?auto_142125 ?auto_142123 ) ) ( not ( = ?auto_142125 ?auto_142122 ) ) ( not ( = ?auto_142117 ?auto_142125 ) ) ( not ( = ?auto_142118 ?auto_142125 ) ) ( not ( = ?auto_142119 ?auto_142125 ) ) ( not ( = ?auto_142120 ?auto_142125 ) ) ( not ( = ?auto_142121 ?auto_142125 ) ) ( ON ?auto_142121 ?auto_142122 ) ( ON ?auto_142120 ?auto_142121 ) ( ON ?auto_142119 ?auto_142120 ) ( CLEAR ?auto_142119 ) ( HOLDING ?auto_142118 ) ( CLEAR ?auto_142117 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_142117 ?auto_142118 )
      ( MAKE-7PILE ?auto_142117 ?auto_142118 ?auto_142119 ?auto_142120 ?auto_142121 ?auto_142122 ?auto_142123 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142126 - BLOCK
      ?auto_142127 - BLOCK
      ?auto_142128 - BLOCK
      ?auto_142129 - BLOCK
      ?auto_142130 - BLOCK
      ?auto_142131 - BLOCK
      ?auto_142132 - BLOCK
    )
    :vars
    (
      ?auto_142133 - BLOCK
      ?auto_142134 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142126 ) ( not ( = ?auto_142126 ?auto_142127 ) ) ( not ( = ?auto_142126 ?auto_142128 ) ) ( not ( = ?auto_142126 ?auto_142129 ) ) ( not ( = ?auto_142126 ?auto_142130 ) ) ( not ( = ?auto_142126 ?auto_142131 ) ) ( not ( = ?auto_142126 ?auto_142132 ) ) ( not ( = ?auto_142127 ?auto_142128 ) ) ( not ( = ?auto_142127 ?auto_142129 ) ) ( not ( = ?auto_142127 ?auto_142130 ) ) ( not ( = ?auto_142127 ?auto_142131 ) ) ( not ( = ?auto_142127 ?auto_142132 ) ) ( not ( = ?auto_142128 ?auto_142129 ) ) ( not ( = ?auto_142128 ?auto_142130 ) ) ( not ( = ?auto_142128 ?auto_142131 ) ) ( not ( = ?auto_142128 ?auto_142132 ) ) ( not ( = ?auto_142129 ?auto_142130 ) ) ( not ( = ?auto_142129 ?auto_142131 ) ) ( not ( = ?auto_142129 ?auto_142132 ) ) ( not ( = ?auto_142130 ?auto_142131 ) ) ( not ( = ?auto_142130 ?auto_142132 ) ) ( not ( = ?auto_142131 ?auto_142132 ) ) ( ON ?auto_142132 ?auto_142133 ) ( not ( = ?auto_142126 ?auto_142133 ) ) ( not ( = ?auto_142127 ?auto_142133 ) ) ( not ( = ?auto_142128 ?auto_142133 ) ) ( not ( = ?auto_142129 ?auto_142133 ) ) ( not ( = ?auto_142130 ?auto_142133 ) ) ( not ( = ?auto_142131 ?auto_142133 ) ) ( not ( = ?auto_142132 ?auto_142133 ) ) ( ON ?auto_142131 ?auto_142132 ) ( ON-TABLE ?auto_142134 ) ( ON ?auto_142133 ?auto_142134 ) ( not ( = ?auto_142134 ?auto_142133 ) ) ( not ( = ?auto_142134 ?auto_142132 ) ) ( not ( = ?auto_142134 ?auto_142131 ) ) ( not ( = ?auto_142126 ?auto_142134 ) ) ( not ( = ?auto_142127 ?auto_142134 ) ) ( not ( = ?auto_142128 ?auto_142134 ) ) ( not ( = ?auto_142129 ?auto_142134 ) ) ( not ( = ?auto_142130 ?auto_142134 ) ) ( ON ?auto_142130 ?auto_142131 ) ( ON ?auto_142129 ?auto_142130 ) ( ON ?auto_142128 ?auto_142129 ) ( CLEAR ?auto_142126 ) ( ON ?auto_142127 ?auto_142128 ) ( CLEAR ?auto_142127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_142134 ?auto_142133 ?auto_142132 ?auto_142131 ?auto_142130 ?auto_142129 ?auto_142128 )
      ( MAKE-7PILE ?auto_142126 ?auto_142127 ?auto_142128 ?auto_142129 ?auto_142130 ?auto_142131 ?auto_142132 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142135 - BLOCK
      ?auto_142136 - BLOCK
      ?auto_142137 - BLOCK
      ?auto_142138 - BLOCK
      ?auto_142139 - BLOCK
      ?auto_142140 - BLOCK
      ?auto_142141 - BLOCK
    )
    :vars
    (
      ?auto_142142 - BLOCK
      ?auto_142143 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142135 ?auto_142136 ) ) ( not ( = ?auto_142135 ?auto_142137 ) ) ( not ( = ?auto_142135 ?auto_142138 ) ) ( not ( = ?auto_142135 ?auto_142139 ) ) ( not ( = ?auto_142135 ?auto_142140 ) ) ( not ( = ?auto_142135 ?auto_142141 ) ) ( not ( = ?auto_142136 ?auto_142137 ) ) ( not ( = ?auto_142136 ?auto_142138 ) ) ( not ( = ?auto_142136 ?auto_142139 ) ) ( not ( = ?auto_142136 ?auto_142140 ) ) ( not ( = ?auto_142136 ?auto_142141 ) ) ( not ( = ?auto_142137 ?auto_142138 ) ) ( not ( = ?auto_142137 ?auto_142139 ) ) ( not ( = ?auto_142137 ?auto_142140 ) ) ( not ( = ?auto_142137 ?auto_142141 ) ) ( not ( = ?auto_142138 ?auto_142139 ) ) ( not ( = ?auto_142138 ?auto_142140 ) ) ( not ( = ?auto_142138 ?auto_142141 ) ) ( not ( = ?auto_142139 ?auto_142140 ) ) ( not ( = ?auto_142139 ?auto_142141 ) ) ( not ( = ?auto_142140 ?auto_142141 ) ) ( ON ?auto_142141 ?auto_142142 ) ( not ( = ?auto_142135 ?auto_142142 ) ) ( not ( = ?auto_142136 ?auto_142142 ) ) ( not ( = ?auto_142137 ?auto_142142 ) ) ( not ( = ?auto_142138 ?auto_142142 ) ) ( not ( = ?auto_142139 ?auto_142142 ) ) ( not ( = ?auto_142140 ?auto_142142 ) ) ( not ( = ?auto_142141 ?auto_142142 ) ) ( ON ?auto_142140 ?auto_142141 ) ( ON-TABLE ?auto_142143 ) ( ON ?auto_142142 ?auto_142143 ) ( not ( = ?auto_142143 ?auto_142142 ) ) ( not ( = ?auto_142143 ?auto_142141 ) ) ( not ( = ?auto_142143 ?auto_142140 ) ) ( not ( = ?auto_142135 ?auto_142143 ) ) ( not ( = ?auto_142136 ?auto_142143 ) ) ( not ( = ?auto_142137 ?auto_142143 ) ) ( not ( = ?auto_142138 ?auto_142143 ) ) ( not ( = ?auto_142139 ?auto_142143 ) ) ( ON ?auto_142139 ?auto_142140 ) ( ON ?auto_142138 ?auto_142139 ) ( ON ?auto_142137 ?auto_142138 ) ( ON ?auto_142136 ?auto_142137 ) ( CLEAR ?auto_142136 ) ( HOLDING ?auto_142135 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_142135 )
      ( MAKE-7PILE ?auto_142135 ?auto_142136 ?auto_142137 ?auto_142138 ?auto_142139 ?auto_142140 ?auto_142141 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142144 - BLOCK
      ?auto_142145 - BLOCK
      ?auto_142146 - BLOCK
      ?auto_142147 - BLOCK
      ?auto_142148 - BLOCK
      ?auto_142149 - BLOCK
      ?auto_142150 - BLOCK
    )
    :vars
    (
      ?auto_142152 - BLOCK
      ?auto_142151 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142144 ?auto_142145 ) ) ( not ( = ?auto_142144 ?auto_142146 ) ) ( not ( = ?auto_142144 ?auto_142147 ) ) ( not ( = ?auto_142144 ?auto_142148 ) ) ( not ( = ?auto_142144 ?auto_142149 ) ) ( not ( = ?auto_142144 ?auto_142150 ) ) ( not ( = ?auto_142145 ?auto_142146 ) ) ( not ( = ?auto_142145 ?auto_142147 ) ) ( not ( = ?auto_142145 ?auto_142148 ) ) ( not ( = ?auto_142145 ?auto_142149 ) ) ( not ( = ?auto_142145 ?auto_142150 ) ) ( not ( = ?auto_142146 ?auto_142147 ) ) ( not ( = ?auto_142146 ?auto_142148 ) ) ( not ( = ?auto_142146 ?auto_142149 ) ) ( not ( = ?auto_142146 ?auto_142150 ) ) ( not ( = ?auto_142147 ?auto_142148 ) ) ( not ( = ?auto_142147 ?auto_142149 ) ) ( not ( = ?auto_142147 ?auto_142150 ) ) ( not ( = ?auto_142148 ?auto_142149 ) ) ( not ( = ?auto_142148 ?auto_142150 ) ) ( not ( = ?auto_142149 ?auto_142150 ) ) ( ON ?auto_142150 ?auto_142152 ) ( not ( = ?auto_142144 ?auto_142152 ) ) ( not ( = ?auto_142145 ?auto_142152 ) ) ( not ( = ?auto_142146 ?auto_142152 ) ) ( not ( = ?auto_142147 ?auto_142152 ) ) ( not ( = ?auto_142148 ?auto_142152 ) ) ( not ( = ?auto_142149 ?auto_142152 ) ) ( not ( = ?auto_142150 ?auto_142152 ) ) ( ON ?auto_142149 ?auto_142150 ) ( ON-TABLE ?auto_142151 ) ( ON ?auto_142152 ?auto_142151 ) ( not ( = ?auto_142151 ?auto_142152 ) ) ( not ( = ?auto_142151 ?auto_142150 ) ) ( not ( = ?auto_142151 ?auto_142149 ) ) ( not ( = ?auto_142144 ?auto_142151 ) ) ( not ( = ?auto_142145 ?auto_142151 ) ) ( not ( = ?auto_142146 ?auto_142151 ) ) ( not ( = ?auto_142147 ?auto_142151 ) ) ( not ( = ?auto_142148 ?auto_142151 ) ) ( ON ?auto_142148 ?auto_142149 ) ( ON ?auto_142147 ?auto_142148 ) ( ON ?auto_142146 ?auto_142147 ) ( ON ?auto_142145 ?auto_142146 ) ( ON ?auto_142144 ?auto_142145 ) ( CLEAR ?auto_142144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_142151 ?auto_142152 ?auto_142150 ?auto_142149 ?auto_142148 ?auto_142147 ?auto_142146 ?auto_142145 )
      ( MAKE-7PILE ?auto_142144 ?auto_142145 ?auto_142146 ?auto_142147 ?auto_142148 ?auto_142149 ?auto_142150 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142154 - BLOCK
    )
    :vars
    (
      ?auto_142155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142155 ?auto_142154 ) ( CLEAR ?auto_142155 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_142154 ) ( not ( = ?auto_142154 ?auto_142155 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_142155 ?auto_142154 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142156 - BLOCK
    )
    :vars
    (
      ?auto_142157 - BLOCK
      ?auto_142158 - BLOCK
      ?auto_142159 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142157 ?auto_142156 ) ( CLEAR ?auto_142157 ) ( ON-TABLE ?auto_142156 ) ( not ( = ?auto_142156 ?auto_142157 ) ) ( HOLDING ?auto_142158 ) ( CLEAR ?auto_142159 ) ( not ( = ?auto_142156 ?auto_142158 ) ) ( not ( = ?auto_142156 ?auto_142159 ) ) ( not ( = ?auto_142157 ?auto_142158 ) ) ( not ( = ?auto_142157 ?auto_142159 ) ) ( not ( = ?auto_142158 ?auto_142159 ) ) )
    :subtasks
    ( ( !STACK ?auto_142158 ?auto_142159 )
      ( MAKE-1PILE ?auto_142156 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142160 - BLOCK
    )
    :vars
    (
      ?auto_142162 - BLOCK
      ?auto_142163 - BLOCK
      ?auto_142161 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142162 ?auto_142160 ) ( ON-TABLE ?auto_142160 ) ( not ( = ?auto_142160 ?auto_142162 ) ) ( CLEAR ?auto_142163 ) ( not ( = ?auto_142160 ?auto_142161 ) ) ( not ( = ?auto_142160 ?auto_142163 ) ) ( not ( = ?auto_142162 ?auto_142161 ) ) ( not ( = ?auto_142162 ?auto_142163 ) ) ( not ( = ?auto_142161 ?auto_142163 ) ) ( ON ?auto_142161 ?auto_142162 ) ( CLEAR ?auto_142161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_142160 ?auto_142162 )
      ( MAKE-1PILE ?auto_142160 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142164 - BLOCK
    )
    :vars
    (
      ?auto_142165 - BLOCK
      ?auto_142166 - BLOCK
      ?auto_142167 - BLOCK
      ?auto_142169 - BLOCK
      ?auto_142170 - BLOCK
      ?auto_142171 - BLOCK
      ?auto_142168 - BLOCK
      ?auto_142172 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142165 ?auto_142164 ) ( ON-TABLE ?auto_142164 ) ( not ( = ?auto_142164 ?auto_142165 ) ) ( not ( = ?auto_142164 ?auto_142166 ) ) ( not ( = ?auto_142164 ?auto_142167 ) ) ( not ( = ?auto_142165 ?auto_142166 ) ) ( not ( = ?auto_142165 ?auto_142167 ) ) ( not ( = ?auto_142166 ?auto_142167 ) ) ( ON ?auto_142166 ?auto_142165 ) ( CLEAR ?auto_142166 ) ( HOLDING ?auto_142167 ) ( CLEAR ?auto_142169 ) ( ON-TABLE ?auto_142170 ) ( ON ?auto_142171 ?auto_142170 ) ( ON ?auto_142168 ?auto_142171 ) ( ON ?auto_142172 ?auto_142168 ) ( ON ?auto_142169 ?auto_142172 ) ( not ( = ?auto_142170 ?auto_142171 ) ) ( not ( = ?auto_142170 ?auto_142168 ) ) ( not ( = ?auto_142170 ?auto_142172 ) ) ( not ( = ?auto_142170 ?auto_142169 ) ) ( not ( = ?auto_142170 ?auto_142167 ) ) ( not ( = ?auto_142171 ?auto_142168 ) ) ( not ( = ?auto_142171 ?auto_142172 ) ) ( not ( = ?auto_142171 ?auto_142169 ) ) ( not ( = ?auto_142171 ?auto_142167 ) ) ( not ( = ?auto_142168 ?auto_142172 ) ) ( not ( = ?auto_142168 ?auto_142169 ) ) ( not ( = ?auto_142168 ?auto_142167 ) ) ( not ( = ?auto_142172 ?auto_142169 ) ) ( not ( = ?auto_142172 ?auto_142167 ) ) ( not ( = ?auto_142169 ?auto_142167 ) ) ( not ( = ?auto_142164 ?auto_142169 ) ) ( not ( = ?auto_142164 ?auto_142170 ) ) ( not ( = ?auto_142164 ?auto_142171 ) ) ( not ( = ?auto_142164 ?auto_142168 ) ) ( not ( = ?auto_142164 ?auto_142172 ) ) ( not ( = ?auto_142165 ?auto_142169 ) ) ( not ( = ?auto_142165 ?auto_142170 ) ) ( not ( = ?auto_142165 ?auto_142171 ) ) ( not ( = ?auto_142165 ?auto_142168 ) ) ( not ( = ?auto_142165 ?auto_142172 ) ) ( not ( = ?auto_142166 ?auto_142169 ) ) ( not ( = ?auto_142166 ?auto_142170 ) ) ( not ( = ?auto_142166 ?auto_142171 ) ) ( not ( = ?auto_142166 ?auto_142168 ) ) ( not ( = ?auto_142166 ?auto_142172 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_142170 ?auto_142171 ?auto_142168 ?auto_142172 ?auto_142169 ?auto_142167 )
      ( MAKE-1PILE ?auto_142164 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142173 - BLOCK
    )
    :vars
    (
      ?auto_142174 - BLOCK
      ?auto_142178 - BLOCK
      ?auto_142175 - BLOCK
      ?auto_142180 - BLOCK
      ?auto_142179 - BLOCK
      ?auto_142177 - BLOCK
      ?auto_142181 - BLOCK
      ?auto_142176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142174 ?auto_142173 ) ( ON-TABLE ?auto_142173 ) ( not ( = ?auto_142173 ?auto_142174 ) ) ( not ( = ?auto_142173 ?auto_142178 ) ) ( not ( = ?auto_142173 ?auto_142175 ) ) ( not ( = ?auto_142174 ?auto_142178 ) ) ( not ( = ?auto_142174 ?auto_142175 ) ) ( not ( = ?auto_142178 ?auto_142175 ) ) ( ON ?auto_142178 ?auto_142174 ) ( CLEAR ?auto_142180 ) ( ON-TABLE ?auto_142179 ) ( ON ?auto_142177 ?auto_142179 ) ( ON ?auto_142181 ?auto_142177 ) ( ON ?auto_142176 ?auto_142181 ) ( ON ?auto_142180 ?auto_142176 ) ( not ( = ?auto_142179 ?auto_142177 ) ) ( not ( = ?auto_142179 ?auto_142181 ) ) ( not ( = ?auto_142179 ?auto_142176 ) ) ( not ( = ?auto_142179 ?auto_142180 ) ) ( not ( = ?auto_142179 ?auto_142175 ) ) ( not ( = ?auto_142177 ?auto_142181 ) ) ( not ( = ?auto_142177 ?auto_142176 ) ) ( not ( = ?auto_142177 ?auto_142180 ) ) ( not ( = ?auto_142177 ?auto_142175 ) ) ( not ( = ?auto_142181 ?auto_142176 ) ) ( not ( = ?auto_142181 ?auto_142180 ) ) ( not ( = ?auto_142181 ?auto_142175 ) ) ( not ( = ?auto_142176 ?auto_142180 ) ) ( not ( = ?auto_142176 ?auto_142175 ) ) ( not ( = ?auto_142180 ?auto_142175 ) ) ( not ( = ?auto_142173 ?auto_142180 ) ) ( not ( = ?auto_142173 ?auto_142179 ) ) ( not ( = ?auto_142173 ?auto_142177 ) ) ( not ( = ?auto_142173 ?auto_142181 ) ) ( not ( = ?auto_142173 ?auto_142176 ) ) ( not ( = ?auto_142174 ?auto_142180 ) ) ( not ( = ?auto_142174 ?auto_142179 ) ) ( not ( = ?auto_142174 ?auto_142177 ) ) ( not ( = ?auto_142174 ?auto_142181 ) ) ( not ( = ?auto_142174 ?auto_142176 ) ) ( not ( = ?auto_142178 ?auto_142180 ) ) ( not ( = ?auto_142178 ?auto_142179 ) ) ( not ( = ?auto_142178 ?auto_142177 ) ) ( not ( = ?auto_142178 ?auto_142181 ) ) ( not ( = ?auto_142178 ?auto_142176 ) ) ( ON ?auto_142175 ?auto_142178 ) ( CLEAR ?auto_142175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_142173 ?auto_142174 ?auto_142178 )
      ( MAKE-1PILE ?auto_142173 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142182 - BLOCK
    )
    :vars
    (
      ?auto_142185 - BLOCK
      ?auto_142183 - BLOCK
      ?auto_142188 - BLOCK
      ?auto_142190 - BLOCK
      ?auto_142184 - BLOCK
      ?auto_142186 - BLOCK
      ?auto_142189 - BLOCK
      ?auto_142187 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142185 ?auto_142182 ) ( ON-TABLE ?auto_142182 ) ( not ( = ?auto_142182 ?auto_142185 ) ) ( not ( = ?auto_142182 ?auto_142183 ) ) ( not ( = ?auto_142182 ?auto_142188 ) ) ( not ( = ?auto_142185 ?auto_142183 ) ) ( not ( = ?auto_142185 ?auto_142188 ) ) ( not ( = ?auto_142183 ?auto_142188 ) ) ( ON ?auto_142183 ?auto_142185 ) ( ON-TABLE ?auto_142190 ) ( ON ?auto_142184 ?auto_142190 ) ( ON ?auto_142186 ?auto_142184 ) ( ON ?auto_142189 ?auto_142186 ) ( not ( = ?auto_142190 ?auto_142184 ) ) ( not ( = ?auto_142190 ?auto_142186 ) ) ( not ( = ?auto_142190 ?auto_142189 ) ) ( not ( = ?auto_142190 ?auto_142187 ) ) ( not ( = ?auto_142190 ?auto_142188 ) ) ( not ( = ?auto_142184 ?auto_142186 ) ) ( not ( = ?auto_142184 ?auto_142189 ) ) ( not ( = ?auto_142184 ?auto_142187 ) ) ( not ( = ?auto_142184 ?auto_142188 ) ) ( not ( = ?auto_142186 ?auto_142189 ) ) ( not ( = ?auto_142186 ?auto_142187 ) ) ( not ( = ?auto_142186 ?auto_142188 ) ) ( not ( = ?auto_142189 ?auto_142187 ) ) ( not ( = ?auto_142189 ?auto_142188 ) ) ( not ( = ?auto_142187 ?auto_142188 ) ) ( not ( = ?auto_142182 ?auto_142187 ) ) ( not ( = ?auto_142182 ?auto_142190 ) ) ( not ( = ?auto_142182 ?auto_142184 ) ) ( not ( = ?auto_142182 ?auto_142186 ) ) ( not ( = ?auto_142182 ?auto_142189 ) ) ( not ( = ?auto_142185 ?auto_142187 ) ) ( not ( = ?auto_142185 ?auto_142190 ) ) ( not ( = ?auto_142185 ?auto_142184 ) ) ( not ( = ?auto_142185 ?auto_142186 ) ) ( not ( = ?auto_142185 ?auto_142189 ) ) ( not ( = ?auto_142183 ?auto_142187 ) ) ( not ( = ?auto_142183 ?auto_142190 ) ) ( not ( = ?auto_142183 ?auto_142184 ) ) ( not ( = ?auto_142183 ?auto_142186 ) ) ( not ( = ?auto_142183 ?auto_142189 ) ) ( ON ?auto_142188 ?auto_142183 ) ( CLEAR ?auto_142188 ) ( HOLDING ?auto_142187 ) ( CLEAR ?auto_142189 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_142190 ?auto_142184 ?auto_142186 ?auto_142189 ?auto_142187 )
      ( MAKE-1PILE ?auto_142182 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142191 - BLOCK
    )
    :vars
    (
      ?auto_142197 - BLOCK
      ?auto_142198 - BLOCK
      ?auto_142192 - BLOCK
      ?auto_142199 - BLOCK
      ?auto_142194 - BLOCK
      ?auto_142196 - BLOCK
      ?auto_142193 - BLOCK
      ?auto_142195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142197 ?auto_142191 ) ( ON-TABLE ?auto_142191 ) ( not ( = ?auto_142191 ?auto_142197 ) ) ( not ( = ?auto_142191 ?auto_142198 ) ) ( not ( = ?auto_142191 ?auto_142192 ) ) ( not ( = ?auto_142197 ?auto_142198 ) ) ( not ( = ?auto_142197 ?auto_142192 ) ) ( not ( = ?auto_142198 ?auto_142192 ) ) ( ON ?auto_142198 ?auto_142197 ) ( ON-TABLE ?auto_142199 ) ( ON ?auto_142194 ?auto_142199 ) ( ON ?auto_142196 ?auto_142194 ) ( ON ?auto_142193 ?auto_142196 ) ( not ( = ?auto_142199 ?auto_142194 ) ) ( not ( = ?auto_142199 ?auto_142196 ) ) ( not ( = ?auto_142199 ?auto_142193 ) ) ( not ( = ?auto_142199 ?auto_142195 ) ) ( not ( = ?auto_142199 ?auto_142192 ) ) ( not ( = ?auto_142194 ?auto_142196 ) ) ( not ( = ?auto_142194 ?auto_142193 ) ) ( not ( = ?auto_142194 ?auto_142195 ) ) ( not ( = ?auto_142194 ?auto_142192 ) ) ( not ( = ?auto_142196 ?auto_142193 ) ) ( not ( = ?auto_142196 ?auto_142195 ) ) ( not ( = ?auto_142196 ?auto_142192 ) ) ( not ( = ?auto_142193 ?auto_142195 ) ) ( not ( = ?auto_142193 ?auto_142192 ) ) ( not ( = ?auto_142195 ?auto_142192 ) ) ( not ( = ?auto_142191 ?auto_142195 ) ) ( not ( = ?auto_142191 ?auto_142199 ) ) ( not ( = ?auto_142191 ?auto_142194 ) ) ( not ( = ?auto_142191 ?auto_142196 ) ) ( not ( = ?auto_142191 ?auto_142193 ) ) ( not ( = ?auto_142197 ?auto_142195 ) ) ( not ( = ?auto_142197 ?auto_142199 ) ) ( not ( = ?auto_142197 ?auto_142194 ) ) ( not ( = ?auto_142197 ?auto_142196 ) ) ( not ( = ?auto_142197 ?auto_142193 ) ) ( not ( = ?auto_142198 ?auto_142195 ) ) ( not ( = ?auto_142198 ?auto_142199 ) ) ( not ( = ?auto_142198 ?auto_142194 ) ) ( not ( = ?auto_142198 ?auto_142196 ) ) ( not ( = ?auto_142198 ?auto_142193 ) ) ( ON ?auto_142192 ?auto_142198 ) ( CLEAR ?auto_142193 ) ( ON ?auto_142195 ?auto_142192 ) ( CLEAR ?auto_142195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_142191 ?auto_142197 ?auto_142198 ?auto_142192 )
      ( MAKE-1PILE ?auto_142191 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142200 - BLOCK
    )
    :vars
    (
      ?auto_142206 - BLOCK
      ?auto_142204 - BLOCK
      ?auto_142207 - BLOCK
      ?auto_142202 - BLOCK
      ?auto_142203 - BLOCK
      ?auto_142201 - BLOCK
      ?auto_142208 - BLOCK
      ?auto_142205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142206 ?auto_142200 ) ( ON-TABLE ?auto_142200 ) ( not ( = ?auto_142200 ?auto_142206 ) ) ( not ( = ?auto_142200 ?auto_142204 ) ) ( not ( = ?auto_142200 ?auto_142207 ) ) ( not ( = ?auto_142206 ?auto_142204 ) ) ( not ( = ?auto_142206 ?auto_142207 ) ) ( not ( = ?auto_142204 ?auto_142207 ) ) ( ON ?auto_142204 ?auto_142206 ) ( ON-TABLE ?auto_142202 ) ( ON ?auto_142203 ?auto_142202 ) ( ON ?auto_142201 ?auto_142203 ) ( not ( = ?auto_142202 ?auto_142203 ) ) ( not ( = ?auto_142202 ?auto_142201 ) ) ( not ( = ?auto_142202 ?auto_142208 ) ) ( not ( = ?auto_142202 ?auto_142205 ) ) ( not ( = ?auto_142202 ?auto_142207 ) ) ( not ( = ?auto_142203 ?auto_142201 ) ) ( not ( = ?auto_142203 ?auto_142208 ) ) ( not ( = ?auto_142203 ?auto_142205 ) ) ( not ( = ?auto_142203 ?auto_142207 ) ) ( not ( = ?auto_142201 ?auto_142208 ) ) ( not ( = ?auto_142201 ?auto_142205 ) ) ( not ( = ?auto_142201 ?auto_142207 ) ) ( not ( = ?auto_142208 ?auto_142205 ) ) ( not ( = ?auto_142208 ?auto_142207 ) ) ( not ( = ?auto_142205 ?auto_142207 ) ) ( not ( = ?auto_142200 ?auto_142205 ) ) ( not ( = ?auto_142200 ?auto_142202 ) ) ( not ( = ?auto_142200 ?auto_142203 ) ) ( not ( = ?auto_142200 ?auto_142201 ) ) ( not ( = ?auto_142200 ?auto_142208 ) ) ( not ( = ?auto_142206 ?auto_142205 ) ) ( not ( = ?auto_142206 ?auto_142202 ) ) ( not ( = ?auto_142206 ?auto_142203 ) ) ( not ( = ?auto_142206 ?auto_142201 ) ) ( not ( = ?auto_142206 ?auto_142208 ) ) ( not ( = ?auto_142204 ?auto_142205 ) ) ( not ( = ?auto_142204 ?auto_142202 ) ) ( not ( = ?auto_142204 ?auto_142203 ) ) ( not ( = ?auto_142204 ?auto_142201 ) ) ( not ( = ?auto_142204 ?auto_142208 ) ) ( ON ?auto_142207 ?auto_142204 ) ( ON ?auto_142205 ?auto_142207 ) ( CLEAR ?auto_142205 ) ( HOLDING ?auto_142208 ) ( CLEAR ?auto_142201 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_142202 ?auto_142203 ?auto_142201 ?auto_142208 )
      ( MAKE-1PILE ?auto_142200 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142209 - BLOCK
    )
    :vars
    (
      ?auto_142214 - BLOCK
      ?auto_142213 - BLOCK
      ?auto_142215 - BLOCK
      ?auto_142211 - BLOCK
      ?auto_142212 - BLOCK
      ?auto_142210 - BLOCK
      ?auto_142216 - BLOCK
      ?auto_142217 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142214 ?auto_142209 ) ( ON-TABLE ?auto_142209 ) ( not ( = ?auto_142209 ?auto_142214 ) ) ( not ( = ?auto_142209 ?auto_142213 ) ) ( not ( = ?auto_142209 ?auto_142215 ) ) ( not ( = ?auto_142214 ?auto_142213 ) ) ( not ( = ?auto_142214 ?auto_142215 ) ) ( not ( = ?auto_142213 ?auto_142215 ) ) ( ON ?auto_142213 ?auto_142214 ) ( ON-TABLE ?auto_142211 ) ( ON ?auto_142212 ?auto_142211 ) ( ON ?auto_142210 ?auto_142212 ) ( not ( = ?auto_142211 ?auto_142212 ) ) ( not ( = ?auto_142211 ?auto_142210 ) ) ( not ( = ?auto_142211 ?auto_142216 ) ) ( not ( = ?auto_142211 ?auto_142217 ) ) ( not ( = ?auto_142211 ?auto_142215 ) ) ( not ( = ?auto_142212 ?auto_142210 ) ) ( not ( = ?auto_142212 ?auto_142216 ) ) ( not ( = ?auto_142212 ?auto_142217 ) ) ( not ( = ?auto_142212 ?auto_142215 ) ) ( not ( = ?auto_142210 ?auto_142216 ) ) ( not ( = ?auto_142210 ?auto_142217 ) ) ( not ( = ?auto_142210 ?auto_142215 ) ) ( not ( = ?auto_142216 ?auto_142217 ) ) ( not ( = ?auto_142216 ?auto_142215 ) ) ( not ( = ?auto_142217 ?auto_142215 ) ) ( not ( = ?auto_142209 ?auto_142217 ) ) ( not ( = ?auto_142209 ?auto_142211 ) ) ( not ( = ?auto_142209 ?auto_142212 ) ) ( not ( = ?auto_142209 ?auto_142210 ) ) ( not ( = ?auto_142209 ?auto_142216 ) ) ( not ( = ?auto_142214 ?auto_142217 ) ) ( not ( = ?auto_142214 ?auto_142211 ) ) ( not ( = ?auto_142214 ?auto_142212 ) ) ( not ( = ?auto_142214 ?auto_142210 ) ) ( not ( = ?auto_142214 ?auto_142216 ) ) ( not ( = ?auto_142213 ?auto_142217 ) ) ( not ( = ?auto_142213 ?auto_142211 ) ) ( not ( = ?auto_142213 ?auto_142212 ) ) ( not ( = ?auto_142213 ?auto_142210 ) ) ( not ( = ?auto_142213 ?auto_142216 ) ) ( ON ?auto_142215 ?auto_142213 ) ( ON ?auto_142217 ?auto_142215 ) ( CLEAR ?auto_142210 ) ( ON ?auto_142216 ?auto_142217 ) ( CLEAR ?auto_142216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_142209 ?auto_142214 ?auto_142213 ?auto_142215 ?auto_142217 )
      ( MAKE-1PILE ?auto_142209 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142218 - BLOCK
    )
    :vars
    (
      ?auto_142224 - BLOCK
      ?auto_142222 - BLOCK
      ?auto_142221 - BLOCK
      ?auto_142220 - BLOCK
      ?auto_142226 - BLOCK
      ?auto_142225 - BLOCK
      ?auto_142223 - BLOCK
      ?auto_142219 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142224 ?auto_142218 ) ( ON-TABLE ?auto_142218 ) ( not ( = ?auto_142218 ?auto_142224 ) ) ( not ( = ?auto_142218 ?auto_142222 ) ) ( not ( = ?auto_142218 ?auto_142221 ) ) ( not ( = ?auto_142224 ?auto_142222 ) ) ( not ( = ?auto_142224 ?auto_142221 ) ) ( not ( = ?auto_142222 ?auto_142221 ) ) ( ON ?auto_142222 ?auto_142224 ) ( ON-TABLE ?auto_142220 ) ( ON ?auto_142226 ?auto_142220 ) ( not ( = ?auto_142220 ?auto_142226 ) ) ( not ( = ?auto_142220 ?auto_142225 ) ) ( not ( = ?auto_142220 ?auto_142223 ) ) ( not ( = ?auto_142220 ?auto_142219 ) ) ( not ( = ?auto_142220 ?auto_142221 ) ) ( not ( = ?auto_142226 ?auto_142225 ) ) ( not ( = ?auto_142226 ?auto_142223 ) ) ( not ( = ?auto_142226 ?auto_142219 ) ) ( not ( = ?auto_142226 ?auto_142221 ) ) ( not ( = ?auto_142225 ?auto_142223 ) ) ( not ( = ?auto_142225 ?auto_142219 ) ) ( not ( = ?auto_142225 ?auto_142221 ) ) ( not ( = ?auto_142223 ?auto_142219 ) ) ( not ( = ?auto_142223 ?auto_142221 ) ) ( not ( = ?auto_142219 ?auto_142221 ) ) ( not ( = ?auto_142218 ?auto_142219 ) ) ( not ( = ?auto_142218 ?auto_142220 ) ) ( not ( = ?auto_142218 ?auto_142226 ) ) ( not ( = ?auto_142218 ?auto_142225 ) ) ( not ( = ?auto_142218 ?auto_142223 ) ) ( not ( = ?auto_142224 ?auto_142219 ) ) ( not ( = ?auto_142224 ?auto_142220 ) ) ( not ( = ?auto_142224 ?auto_142226 ) ) ( not ( = ?auto_142224 ?auto_142225 ) ) ( not ( = ?auto_142224 ?auto_142223 ) ) ( not ( = ?auto_142222 ?auto_142219 ) ) ( not ( = ?auto_142222 ?auto_142220 ) ) ( not ( = ?auto_142222 ?auto_142226 ) ) ( not ( = ?auto_142222 ?auto_142225 ) ) ( not ( = ?auto_142222 ?auto_142223 ) ) ( ON ?auto_142221 ?auto_142222 ) ( ON ?auto_142219 ?auto_142221 ) ( ON ?auto_142223 ?auto_142219 ) ( CLEAR ?auto_142223 ) ( HOLDING ?auto_142225 ) ( CLEAR ?auto_142226 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_142220 ?auto_142226 ?auto_142225 )
      ( MAKE-1PILE ?auto_142218 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142227 - BLOCK
    )
    :vars
    (
      ?auto_142231 - BLOCK
      ?auto_142232 - BLOCK
      ?auto_142229 - BLOCK
      ?auto_142228 - BLOCK
      ?auto_142234 - BLOCK
      ?auto_142235 - BLOCK
      ?auto_142233 - BLOCK
      ?auto_142230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142231 ?auto_142227 ) ( ON-TABLE ?auto_142227 ) ( not ( = ?auto_142227 ?auto_142231 ) ) ( not ( = ?auto_142227 ?auto_142232 ) ) ( not ( = ?auto_142227 ?auto_142229 ) ) ( not ( = ?auto_142231 ?auto_142232 ) ) ( not ( = ?auto_142231 ?auto_142229 ) ) ( not ( = ?auto_142232 ?auto_142229 ) ) ( ON ?auto_142232 ?auto_142231 ) ( ON-TABLE ?auto_142228 ) ( ON ?auto_142234 ?auto_142228 ) ( not ( = ?auto_142228 ?auto_142234 ) ) ( not ( = ?auto_142228 ?auto_142235 ) ) ( not ( = ?auto_142228 ?auto_142233 ) ) ( not ( = ?auto_142228 ?auto_142230 ) ) ( not ( = ?auto_142228 ?auto_142229 ) ) ( not ( = ?auto_142234 ?auto_142235 ) ) ( not ( = ?auto_142234 ?auto_142233 ) ) ( not ( = ?auto_142234 ?auto_142230 ) ) ( not ( = ?auto_142234 ?auto_142229 ) ) ( not ( = ?auto_142235 ?auto_142233 ) ) ( not ( = ?auto_142235 ?auto_142230 ) ) ( not ( = ?auto_142235 ?auto_142229 ) ) ( not ( = ?auto_142233 ?auto_142230 ) ) ( not ( = ?auto_142233 ?auto_142229 ) ) ( not ( = ?auto_142230 ?auto_142229 ) ) ( not ( = ?auto_142227 ?auto_142230 ) ) ( not ( = ?auto_142227 ?auto_142228 ) ) ( not ( = ?auto_142227 ?auto_142234 ) ) ( not ( = ?auto_142227 ?auto_142235 ) ) ( not ( = ?auto_142227 ?auto_142233 ) ) ( not ( = ?auto_142231 ?auto_142230 ) ) ( not ( = ?auto_142231 ?auto_142228 ) ) ( not ( = ?auto_142231 ?auto_142234 ) ) ( not ( = ?auto_142231 ?auto_142235 ) ) ( not ( = ?auto_142231 ?auto_142233 ) ) ( not ( = ?auto_142232 ?auto_142230 ) ) ( not ( = ?auto_142232 ?auto_142228 ) ) ( not ( = ?auto_142232 ?auto_142234 ) ) ( not ( = ?auto_142232 ?auto_142235 ) ) ( not ( = ?auto_142232 ?auto_142233 ) ) ( ON ?auto_142229 ?auto_142232 ) ( ON ?auto_142230 ?auto_142229 ) ( ON ?auto_142233 ?auto_142230 ) ( CLEAR ?auto_142234 ) ( ON ?auto_142235 ?auto_142233 ) ( CLEAR ?auto_142235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_142227 ?auto_142231 ?auto_142232 ?auto_142229 ?auto_142230 ?auto_142233 )
      ( MAKE-1PILE ?auto_142227 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142236 - BLOCK
    )
    :vars
    (
      ?auto_142242 - BLOCK
      ?auto_142238 - BLOCK
      ?auto_142241 - BLOCK
      ?auto_142244 - BLOCK
      ?auto_142237 - BLOCK
      ?auto_142240 - BLOCK
      ?auto_142243 - BLOCK
      ?auto_142239 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142242 ?auto_142236 ) ( ON-TABLE ?auto_142236 ) ( not ( = ?auto_142236 ?auto_142242 ) ) ( not ( = ?auto_142236 ?auto_142238 ) ) ( not ( = ?auto_142236 ?auto_142241 ) ) ( not ( = ?auto_142242 ?auto_142238 ) ) ( not ( = ?auto_142242 ?auto_142241 ) ) ( not ( = ?auto_142238 ?auto_142241 ) ) ( ON ?auto_142238 ?auto_142242 ) ( ON-TABLE ?auto_142244 ) ( not ( = ?auto_142244 ?auto_142237 ) ) ( not ( = ?auto_142244 ?auto_142240 ) ) ( not ( = ?auto_142244 ?auto_142243 ) ) ( not ( = ?auto_142244 ?auto_142239 ) ) ( not ( = ?auto_142244 ?auto_142241 ) ) ( not ( = ?auto_142237 ?auto_142240 ) ) ( not ( = ?auto_142237 ?auto_142243 ) ) ( not ( = ?auto_142237 ?auto_142239 ) ) ( not ( = ?auto_142237 ?auto_142241 ) ) ( not ( = ?auto_142240 ?auto_142243 ) ) ( not ( = ?auto_142240 ?auto_142239 ) ) ( not ( = ?auto_142240 ?auto_142241 ) ) ( not ( = ?auto_142243 ?auto_142239 ) ) ( not ( = ?auto_142243 ?auto_142241 ) ) ( not ( = ?auto_142239 ?auto_142241 ) ) ( not ( = ?auto_142236 ?auto_142239 ) ) ( not ( = ?auto_142236 ?auto_142244 ) ) ( not ( = ?auto_142236 ?auto_142237 ) ) ( not ( = ?auto_142236 ?auto_142240 ) ) ( not ( = ?auto_142236 ?auto_142243 ) ) ( not ( = ?auto_142242 ?auto_142239 ) ) ( not ( = ?auto_142242 ?auto_142244 ) ) ( not ( = ?auto_142242 ?auto_142237 ) ) ( not ( = ?auto_142242 ?auto_142240 ) ) ( not ( = ?auto_142242 ?auto_142243 ) ) ( not ( = ?auto_142238 ?auto_142239 ) ) ( not ( = ?auto_142238 ?auto_142244 ) ) ( not ( = ?auto_142238 ?auto_142237 ) ) ( not ( = ?auto_142238 ?auto_142240 ) ) ( not ( = ?auto_142238 ?auto_142243 ) ) ( ON ?auto_142241 ?auto_142238 ) ( ON ?auto_142239 ?auto_142241 ) ( ON ?auto_142243 ?auto_142239 ) ( ON ?auto_142240 ?auto_142243 ) ( CLEAR ?auto_142240 ) ( HOLDING ?auto_142237 ) ( CLEAR ?auto_142244 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_142244 ?auto_142237 )
      ( MAKE-1PILE ?auto_142236 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142245 - BLOCK
    )
    :vars
    (
      ?auto_142253 - BLOCK
      ?auto_142251 - BLOCK
      ?auto_142249 - BLOCK
      ?auto_142246 - BLOCK
      ?auto_142252 - BLOCK
      ?auto_142248 - BLOCK
      ?auto_142247 - BLOCK
      ?auto_142250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142253 ?auto_142245 ) ( ON-TABLE ?auto_142245 ) ( not ( = ?auto_142245 ?auto_142253 ) ) ( not ( = ?auto_142245 ?auto_142251 ) ) ( not ( = ?auto_142245 ?auto_142249 ) ) ( not ( = ?auto_142253 ?auto_142251 ) ) ( not ( = ?auto_142253 ?auto_142249 ) ) ( not ( = ?auto_142251 ?auto_142249 ) ) ( ON ?auto_142251 ?auto_142253 ) ( ON-TABLE ?auto_142246 ) ( not ( = ?auto_142246 ?auto_142252 ) ) ( not ( = ?auto_142246 ?auto_142248 ) ) ( not ( = ?auto_142246 ?auto_142247 ) ) ( not ( = ?auto_142246 ?auto_142250 ) ) ( not ( = ?auto_142246 ?auto_142249 ) ) ( not ( = ?auto_142252 ?auto_142248 ) ) ( not ( = ?auto_142252 ?auto_142247 ) ) ( not ( = ?auto_142252 ?auto_142250 ) ) ( not ( = ?auto_142252 ?auto_142249 ) ) ( not ( = ?auto_142248 ?auto_142247 ) ) ( not ( = ?auto_142248 ?auto_142250 ) ) ( not ( = ?auto_142248 ?auto_142249 ) ) ( not ( = ?auto_142247 ?auto_142250 ) ) ( not ( = ?auto_142247 ?auto_142249 ) ) ( not ( = ?auto_142250 ?auto_142249 ) ) ( not ( = ?auto_142245 ?auto_142250 ) ) ( not ( = ?auto_142245 ?auto_142246 ) ) ( not ( = ?auto_142245 ?auto_142252 ) ) ( not ( = ?auto_142245 ?auto_142248 ) ) ( not ( = ?auto_142245 ?auto_142247 ) ) ( not ( = ?auto_142253 ?auto_142250 ) ) ( not ( = ?auto_142253 ?auto_142246 ) ) ( not ( = ?auto_142253 ?auto_142252 ) ) ( not ( = ?auto_142253 ?auto_142248 ) ) ( not ( = ?auto_142253 ?auto_142247 ) ) ( not ( = ?auto_142251 ?auto_142250 ) ) ( not ( = ?auto_142251 ?auto_142246 ) ) ( not ( = ?auto_142251 ?auto_142252 ) ) ( not ( = ?auto_142251 ?auto_142248 ) ) ( not ( = ?auto_142251 ?auto_142247 ) ) ( ON ?auto_142249 ?auto_142251 ) ( ON ?auto_142250 ?auto_142249 ) ( ON ?auto_142247 ?auto_142250 ) ( ON ?auto_142248 ?auto_142247 ) ( CLEAR ?auto_142246 ) ( ON ?auto_142252 ?auto_142248 ) ( CLEAR ?auto_142252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_142245 ?auto_142253 ?auto_142251 ?auto_142249 ?auto_142250 ?auto_142247 ?auto_142248 )
      ( MAKE-1PILE ?auto_142245 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142254 - BLOCK
    )
    :vars
    (
      ?auto_142258 - BLOCK
      ?auto_142261 - BLOCK
      ?auto_142257 - BLOCK
      ?auto_142262 - BLOCK
      ?auto_142260 - BLOCK
      ?auto_142255 - BLOCK
      ?auto_142259 - BLOCK
      ?auto_142256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142258 ?auto_142254 ) ( ON-TABLE ?auto_142254 ) ( not ( = ?auto_142254 ?auto_142258 ) ) ( not ( = ?auto_142254 ?auto_142261 ) ) ( not ( = ?auto_142254 ?auto_142257 ) ) ( not ( = ?auto_142258 ?auto_142261 ) ) ( not ( = ?auto_142258 ?auto_142257 ) ) ( not ( = ?auto_142261 ?auto_142257 ) ) ( ON ?auto_142261 ?auto_142258 ) ( not ( = ?auto_142262 ?auto_142260 ) ) ( not ( = ?auto_142262 ?auto_142255 ) ) ( not ( = ?auto_142262 ?auto_142259 ) ) ( not ( = ?auto_142262 ?auto_142256 ) ) ( not ( = ?auto_142262 ?auto_142257 ) ) ( not ( = ?auto_142260 ?auto_142255 ) ) ( not ( = ?auto_142260 ?auto_142259 ) ) ( not ( = ?auto_142260 ?auto_142256 ) ) ( not ( = ?auto_142260 ?auto_142257 ) ) ( not ( = ?auto_142255 ?auto_142259 ) ) ( not ( = ?auto_142255 ?auto_142256 ) ) ( not ( = ?auto_142255 ?auto_142257 ) ) ( not ( = ?auto_142259 ?auto_142256 ) ) ( not ( = ?auto_142259 ?auto_142257 ) ) ( not ( = ?auto_142256 ?auto_142257 ) ) ( not ( = ?auto_142254 ?auto_142256 ) ) ( not ( = ?auto_142254 ?auto_142262 ) ) ( not ( = ?auto_142254 ?auto_142260 ) ) ( not ( = ?auto_142254 ?auto_142255 ) ) ( not ( = ?auto_142254 ?auto_142259 ) ) ( not ( = ?auto_142258 ?auto_142256 ) ) ( not ( = ?auto_142258 ?auto_142262 ) ) ( not ( = ?auto_142258 ?auto_142260 ) ) ( not ( = ?auto_142258 ?auto_142255 ) ) ( not ( = ?auto_142258 ?auto_142259 ) ) ( not ( = ?auto_142261 ?auto_142256 ) ) ( not ( = ?auto_142261 ?auto_142262 ) ) ( not ( = ?auto_142261 ?auto_142260 ) ) ( not ( = ?auto_142261 ?auto_142255 ) ) ( not ( = ?auto_142261 ?auto_142259 ) ) ( ON ?auto_142257 ?auto_142261 ) ( ON ?auto_142256 ?auto_142257 ) ( ON ?auto_142259 ?auto_142256 ) ( ON ?auto_142255 ?auto_142259 ) ( ON ?auto_142260 ?auto_142255 ) ( CLEAR ?auto_142260 ) ( HOLDING ?auto_142262 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_142262 )
      ( MAKE-1PILE ?auto_142254 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142263 - BLOCK
    )
    :vars
    (
      ?auto_142269 - BLOCK
      ?auto_142271 - BLOCK
      ?auto_142264 - BLOCK
      ?auto_142265 - BLOCK
      ?auto_142270 - BLOCK
      ?auto_142267 - BLOCK
      ?auto_142266 - BLOCK
      ?auto_142268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142269 ?auto_142263 ) ( ON-TABLE ?auto_142263 ) ( not ( = ?auto_142263 ?auto_142269 ) ) ( not ( = ?auto_142263 ?auto_142271 ) ) ( not ( = ?auto_142263 ?auto_142264 ) ) ( not ( = ?auto_142269 ?auto_142271 ) ) ( not ( = ?auto_142269 ?auto_142264 ) ) ( not ( = ?auto_142271 ?auto_142264 ) ) ( ON ?auto_142271 ?auto_142269 ) ( not ( = ?auto_142265 ?auto_142270 ) ) ( not ( = ?auto_142265 ?auto_142267 ) ) ( not ( = ?auto_142265 ?auto_142266 ) ) ( not ( = ?auto_142265 ?auto_142268 ) ) ( not ( = ?auto_142265 ?auto_142264 ) ) ( not ( = ?auto_142270 ?auto_142267 ) ) ( not ( = ?auto_142270 ?auto_142266 ) ) ( not ( = ?auto_142270 ?auto_142268 ) ) ( not ( = ?auto_142270 ?auto_142264 ) ) ( not ( = ?auto_142267 ?auto_142266 ) ) ( not ( = ?auto_142267 ?auto_142268 ) ) ( not ( = ?auto_142267 ?auto_142264 ) ) ( not ( = ?auto_142266 ?auto_142268 ) ) ( not ( = ?auto_142266 ?auto_142264 ) ) ( not ( = ?auto_142268 ?auto_142264 ) ) ( not ( = ?auto_142263 ?auto_142268 ) ) ( not ( = ?auto_142263 ?auto_142265 ) ) ( not ( = ?auto_142263 ?auto_142270 ) ) ( not ( = ?auto_142263 ?auto_142267 ) ) ( not ( = ?auto_142263 ?auto_142266 ) ) ( not ( = ?auto_142269 ?auto_142268 ) ) ( not ( = ?auto_142269 ?auto_142265 ) ) ( not ( = ?auto_142269 ?auto_142270 ) ) ( not ( = ?auto_142269 ?auto_142267 ) ) ( not ( = ?auto_142269 ?auto_142266 ) ) ( not ( = ?auto_142271 ?auto_142268 ) ) ( not ( = ?auto_142271 ?auto_142265 ) ) ( not ( = ?auto_142271 ?auto_142270 ) ) ( not ( = ?auto_142271 ?auto_142267 ) ) ( not ( = ?auto_142271 ?auto_142266 ) ) ( ON ?auto_142264 ?auto_142271 ) ( ON ?auto_142268 ?auto_142264 ) ( ON ?auto_142266 ?auto_142268 ) ( ON ?auto_142267 ?auto_142266 ) ( ON ?auto_142270 ?auto_142267 ) ( ON ?auto_142265 ?auto_142270 ) ( CLEAR ?auto_142265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_142263 ?auto_142269 ?auto_142271 ?auto_142264 ?auto_142268 ?auto_142266 ?auto_142267 ?auto_142270 )
      ( MAKE-1PILE ?auto_142263 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142280 - BLOCK
      ?auto_142281 - BLOCK
      ?auto_142282 - BLOCK
      ?auto_142283 - BLOCK
      ?auto_142284 - BLOCK
      ?auto_142285 - BLOCK
      ?auto_142286 - BLOCK
      ?auto_142287 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_142287 ) ( CLEAR ?auto_142286 ) ( ON-TABLE ?auto_142280 ) ( ON ?auto_142281 ?auto_142280 ) ( ON ?auto_142282 ?auto_142281 ) ( ON ?auto_142283 ?auto_142282 ) ( ON ?auto_142284 ?auto_142283 ) ( ON ?auto_142285 ?auto_142284 ) ( ON ?auto_142286 ?auto_142285 ) ( not ( = ?auto_142280 ?auto_142281 ) ) ( not ( = ?auto_142280 ?auto_142282 ) ) ( not ( = ?auto_142280 ?auto_142283 ) ) ( not ( = ?auto_142280 ?auto_142284 ) ) ( not ( = ?auto_142280 ?auto_142285 ) ) ( not ( = ?auto_142280 ?auto_142286 ) ) ( not ( = ?auto_142280 ?auto_142287 ) ) ( not ( = ?auto_142281 ?auto_142282 ) ) ( not ( = ?auto_142281 ?auto_142283 ) ) ( not ( = ?auto_142281 ?auto_142284 ) ) ( not ( = ?auto_142281 ?auto_142285 ) ) ( not ( = ?auto_142281 ?auto_142286 ) ) ( not ( = ?auto_142281 ?auto_142287 ) ) ( not ( = ?auto_142282 ?auto_142283 ) ) ( not ( = ?auto_142282 ?auto_142284 ) ) ( not ( = ?auto_142282 ?auto_142285 ) ) ( not ( = ?auto_142282 ?auto_142286 ) ) ( not ( = ?auto_142282 ?auto_142287 ) ) ( not ( = ?auto_142283 ?auto_142284 ) ) ( not ( = ?auto_142283 ?auto_142285 ) ) ( not ( = ?auto_142283 ?auto_142286 ) ) ( not ( = ?auto_142283 ?auto_142287 ) ) ( not ( = ?auto_142284 ?auto_142285 ) ) ( not ( = ?auto_142284 ?auto_142286 ) ) ( not ( = ?auto_142284 ?auto_142287 ) ) ( not ( = ?auto_142285 ?auto_142286 ) ) ( not ( = ?auto_142285 ?auto_142287 ) ) ( not ( = ?auto_142286 ?auto_142287 ) ) )
    :subtasks
    ( ( !STACK ?auto_142287 ?auto_142286 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142288 - BLOCK
      ?auto_142289 - BLOCK
      ?auto_142290 - BLOCK
      ?auto_142291 - BLOCK
      ?auto_142292 - BLOCK
      ?auto_142293 - BLOCK
      ?auto_142294 - BLOCK
      ?auto_142295 - BLOCK
    )
    :vars
    (
      ?auto_142296 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_142294 ) ( ON-TABLE ?auto_142288 ) ( ON ?auto_142289 ?auto_142288 ) ( ON ?auto_142290 ?auto_142289 ) ( ON ?auto_142291 ?auto_142290 ) ( ON ?auto_142292 ?auto_142291 ) ( ON ?auto_142293 ?auto_142292 ) ( ON ?auto_142294 ?auto_142293 ) ( not ( = ?auto_142288 ?auto_142289 ) ) ( not ( = ?auto_142288 ?auto_142290 ) ) ( not ( = ?auto_142288 ?auto_142291 ) ) ( not ( = ?auto_142288 ?auto_142292 ) ) ( not ( = ?auto_142288 ?auto_142293 ) ) ( not ( = ?auto_142288 ?auto_142294 ) ) ( not ( = ?auto_142288 ?auto_142295 ) ) ( not ( = ?auto_142289 ?auto_142290 ) ) ( not ( = ?auto_142289 ?auto_142291 ) ) ( not ( = ?auto_142289 ?auto_142292 ) ) ( not ( = ?auto_142289 ?auto_142293 ) ) ( not ( = ?auto_142289 ?auto_142294 ) ) ( not ( = ?auto_142289 ?auto_142295 ) ) ( not ( = ?auto_142290 ?auto_142291 ) ) ( not ( = ?auto_142290 ?auto_142292 ) ) ( not ( = ?auto_142290 ?auto_142293 ) ) ( not ( = ?auto_142290 ?auto_142294 ) ) ( not ( = ?auto_142290 ?auto_142295 ) ) ( not ( = ?auto_142291 ?auto_142292 ) ) ( not ( = ?auto_142291 ?auto_142293 ) ) ( not ( = ?auto_142291 ?auto_142294 ) ) ( not ( = ?auto_142291 ?auto_142295 ) ) ( not ( = ?auto_142292 ?auto_142293 ) ) ( not ( = ?auto_142292 ?auto_142294 ) ) ( not ( = ?auto_142292 ?auto_142295 ) ) ( not ( = ?auto_142293 ?auto_142294 ) ) ( not ( = ?auto_142293 ?auto_142295 ) ) ( not ( = ?auto_142294 ?auto_142295 ) ) ( ON ?auto_142295 ?auto_142296 ) ( CLEAR ?auto_142295 ) ( HAND-EMPTY ) ( not ( = ?auto_142288 ?auto_142296 ) ) ( not ( = ?auto_142289 ?auto_142296 ) ) ( not ( = ?auto_142290 ?auto_142296 ) ) ( not ( = ?auto_142291 ?auto_142296 ) ) ( not ( = ?auto_142292 ?auto_142296 ) ) ( not ( = ?auto_142293 ?auto_142296 ) ) ( not ( = ?auto_142294 ?auto_142296 ) ) ( not ( = ?auto_142295 ?auto_142296 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_142295 ?auto_142296 )
      ( MAKE-8PILE ?auto_142288 ?auto_142289 ?auto_142290 ?auto_142291 ?auto_142292 ?auto_142293 ?auto_142294 ?auto_142295 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142297 - BLOCK
      ?auto_142298 - BLOCK
      ?auto_142299 - BLOCK
      ?auto_142300 - BLOCK
      ?auto_142301 - BLOCK
      ?auto_142302 - BLOCK
      ?auto_142303 - BLOCK
      ?auto_142304 - BLOCK
    )
    :vars
    (
      ?auto_142305 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142297 ) ( ON ?auto_142298 ?auto_142297 ) ( ON ?auto_142299 ?auto_142298 ) ( ON ?auto_142300 ?auto_142299 ) ( ON ?auto_142301 ?auto_142300 ) ( ON ?auto_142302 ?auto_142301 ) ( not ( = ?auto_142297 ?auto_142298 ) ) ( not ( = ?auto_142297 ?auto_142299 ) ) ( not ( = ?auto_142297 ?auto_142300 ) ) ( not ( = ?auto_142297 ?auto_142301 ) ) ( not ( = ?auto_142297 ?auto_142302 ) ) ( not ( = ?auto_142297 ?auto_142303 ) ) ( not ( = ?auto_142297 ?auto_142304 ) ) ( not ( = ?auto_142298 ?auto_142299 ) ) ( not ( = ?auto_142298 ?auto_142300 ) ) ( not ( = ?auto_142298 ?auto_142301 ) ) ( not ( = ?auto_142298 ?auto_142302 ) ) ( not ( = ?auto_142298 ?auto_142303 ) ) ( not ( = ?auto_142298 ?auto_142304 ) ) ( not ( = ?auto_142299 ?auto_142300 ) ) ( not ( = ?auto_142299 ?auto_142301 ) ) ( not ( = ?auto_142299 ?auto_142302 ) ) ( not ( = ?auto_142299 ?auto_142303 ) ) ( not ( = ?auto_142299 ?auto_142304 ) ) ( not ( = ?auto_142300 ?auto_142301 ) ) ( not ( = ?auto_142300 ?auto_142302 ) ) ( not ( = ?auto_142300 ?auto_142303 ) ) ( not ( = ?auto_142300 ?auto_142304 ) ) ( not ( = ?auto_142301 ?auto_142302 ) ) ( not ( = ?auto_142301 ?auto_142303 ) ) ( not ( = ?auto_142301 ?auto_142304 ) ) ( not ( = ?auto_142302 ?auto_142303 ) ) ( not ( = ?auto_142302 ?auto_142304 ) ) ( not ( = ?auto_142303 ?auto_142304 ) ) ( ON ?auto_142304 ?auto_142305 ) ( CLEAR ?auto_142304 ) ( not ( = ?auto_142297 ?auto_142305 ) ) ( not ( = ?auto_142298 ?auto_142305 ) ) ( not ( = ?auto_142299 ?auto_142305 ) ) ( not ( = ?auto_142300 ?auto_142305 ) ) ( not ( = ?auto_142301 ?auto_142305 ) ) ( not ( = ?auto_142302 ?auto_142305 ) ) ( not ( = ?auto_142303 ?auto_142305 ) ) ( not ( = ?auto_142304 ?auto_142305 ) ) ( HOLDING ?auto_142303 ) ( CLEAR ?auto_142302 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_142297 ?auto_142298 ?auto_142299 ?auto_142300 ?auto_142301 ?auto_142302 ?auto_142303 )
      ( MAKE-8PILE ?auto_142297 ?auto_142298 ?auto_142299 ?auto_142300 ?auto_142301 ?auto_142302 ?auto_142303 ?auto_142304 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142306 - BLOCK
      ?auto_142307 - BLOCK
      ?auto_142308 - BLOCK
      ?auto_142309 - BLOCK
      ?auto_142310 - BLOCK
      ?auto_142311 - BLOCK
      ?auto_142312 - BLOCK
      ?auto_142313 - BLOCK
    )
    :vars
    (
      ?auto_142314 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142306 ) ( ON ?auto_142307 ?auto_142306 ) ( ON ?auto_142308 ?auto_142307 ) ( ON ?auto_142309 ?auto_142308 ) ( ON ?auto_142310 ?auto_142309 ) ( ON ?auto_142311 ?auto_142310 ) ( not ( = ?auto_142306 ?auto_142307 ) ) ( not ( = ?auto_142306 ?auto_142308 ) ) ( not ( = ?auto_142306 ?auto_142309 ) ) ( not ( = ?auto_142306 ?auto_142310 ) ) ( not ( = ?auto_142306 ?auto_142311 ) ) ( not ( = ?auto_142306 ?auto_142312 ) ) ( not ( = ?auto_142306 ?auto_142313 ) ) ( not ( = ?auto_142307 ?auto_142308 ) ) ( not ( = ?auto_142307 ?auto_142309 ) ) ( not ( = ?auto_142307 ?auto_142310 ) ) ( not ( = ?auto_142307 ?auto_142311 ) ) ( not ( = ?auto_142307 ?auto_142312 ) ) ( not ( = ?auto_142307 ?auto_142313 ) ) ( not ( = ?auto_142308 ?auto_142309 ) ) ( not ( = ?auto_142308 ?auto_142310 ) ) ( not ( = ?auto_142308 ?auto_142311 ) ) ( not ( = ?auto_142308 ?auto_142312 ) ) ( not ( = ?auto_142308 ?auto_142313 ) ) ( not ( = ?auto_142309 ?auto_142310 ) ) ( not ( = ?auto_142309 ?auto_142311 ) ) ( not ( = ?auto_142309 ?auto_142312 ) ) ( not ( = ?auto_142309 ?auto_142313 ) ) ( not ( = ?auto_142310 ?auto_142311 ) ) ( not ( = ?auto_142310 ?auto_142312 ) ) ( not ( = ?auto_142310 ?auto_142313 ) ) ( not ( = ?auto_142311 ?auto_142312 ) ) ( not ( = ?auto_142311 ?auto_142313 ) ) ( not ( = ?auto_142312 ?auto_142313 ) ) ( ON ?auto_142313 ?auto_142314 ) ( not ( = ?auto_142306 ?auto_142314 ) ) ( not ( = ?auto_142307 ?auto_142314 ) ) ( not ( = ?auto_142308 ?auto_142314 ) ) ( not ( = ?auto_142309 ?auto_142314 ) ) ( not ( = ?auto_142310 ?auto_142314 ) ) ( not ( = ?auto_142311 ?auto_142314 ) ) ( not ( = ?auto_142312 ?auto_142314 ) ) ( not ( = ?auto_142313 ?auto_142314 ) ) ( CLEAR ?auto_142311 ) ( ON ?auto_142312 ?auto_142313 ) ( CLEAR ?auto_142312 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_142314 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_142314 ?auto_142313 )
      ( MAKE-8PILE ?auto_142306 ?auto_142307 ?auto_142308 ?auto_142309 ?auto_142310 ?auto_142311 ?auto_142312 ?auto_142313 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142315 - BLOCK
      ?auto_142316 - BLOCK
      ?auto_142317 - BLOCK
      ?auto_142318 - BLOCK
      ?auto_142319 - BLOCK
      ?auto_142320 - BLOCK
      ?auto_142321 - BLOCK
      ?auto_142322 - BLOCK
    )
    :vars
    (
      ?auto_142323 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142315 ) ( ON ?auto_142316 ?auto_142315 ) ( ON ?auto_142317 ?auto_142316 ) ( ON ?auto_142318 ?auto_142317 ) ( ON ?auto_142319 ?auto_142318 ) ( not ( = ?auto_142315 ?auto_142316 ) ) ( not ( = ?auto_142315 ?auto_142317 ) ) ( not ( = ?auto_142315 ?auto_142318 ) ) ( not ( = ?auto_142315 ?auto_142319 ) ) ( not ( = ?auto_142315 ?auto_142320 ) ) ( not ( = ?auto_142315 ?auto_142321 ) ) ( not ( = ?auto_142315 ?auto_142322 ) ) ( not ( = ?auto_142316 ?auto_142317 ) ) ( not ( = ?auto_142316 ?auto_142318 ) ) ( not ( = ?auto_142316 ?auto_142319 ) ) ( not ( = ?auto_142316 ?auto_142320 ) ) ( not ( = ?auto_142316 ?auto_142321 ) ) ( not ( = ?auto_142316 ?auto_142322 ) ) ( not ( = ?auto_142317 ?auto_142318 ) ) ( not ( = ?auto_142317 ?auto_142319 ) ) ( not ( = ?auto_142317 ?auto_142320 ) ) ( not ( = ?auto_142317 ?auto_142321 ) ) ( not ( = ?auto_142317 ?auto_142322 ) ) ( not ( = ?auto_142318 ?auto_142319 ) ) ( not ( = ?auto_142318 ?auto_142320 ) ) ( not ( = ?auto_142318 ?auto_142321 ) ) ( not ( = ?auto_142318 ?auto_142322 ) ) ( not ( = ?auto_142319 ?auto_142320 ) ) ( not ( = ?auto_142319 ?auto_142321 ) ) ( not ( = ?auto_142319 ?auto_142322 ) ) ( not ( = ?auto_142320 ?auto_142321 ) ) ( not ( = ?auto_142320 ?auto_142322 ) ) ( not ( = ?auto_142321 ?auto_142322 ) ) ( ON ?auto_142322 ?auto_142323 ) ( not ( = ?auto_142315 ?auto_142323 ) ) ( not ( = ?auto_142316 ?auto_142323 ) ) ( not ( = ?auto_142317 ?auto_142323 ) ) ( not ( = ?auto_142318 ?auto_142323 ) ) ( not ( = ?auto_142319 ?auto_142323 ) ) ( not ( = ?auto_142320 ?auto_142323 ) ) ( not ( = ?auto_142321 ?auto_142323 ) ) ( not ( = ?auto_142322 ?auto_142323 ) ) ( ON ?auto_142321 ?auto_142322 ) ( CLEAR ?auto_142321 ) ( ON-TABLE ?auto_142323 ) ( HOLDING ?auto_142320 ) ( CLEAR ?auto_142319 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_142315 ?auto_142316 ?auto_142317 ?auto_142318 ?auto_142319 ?auto_142320 )
      ( MAKE-8PILE ?auto_142315 ?auto_142316 ?auto_142317 ?auto_142318 ?auto_142319 ?auto_142320 ?auto_142321 ?auto_142322 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142324 - BLOCK
      ?auto_142325 - BLOCK
      ?auto_142326 - BLOCK
      ?auto_142327 - BLOCK
      ?auto_142328 - BLOCK
      ?auto_142329 - BLOCK
      ?auto_142330 - BLOCK
      ?auto_142331 - BLOCK
    )
    :vars
    (
      ?auto_142332 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142324 ) ( ON ?auto_142325 ?auto_142324 ) ( ON ?auto_142326 ?auto_142325 ) ( ON ?auto_142327 ?auto_142326 ) ( ON ?auto_142328 ?auto_142327 ) ( not ( = ?auto_142324 ?auto_142325 ) ) ( not ( = ?auto_142324 ?auto_142326 ) ) ( not ( = ?auto_142324 ?auto_142327 ) ) ( not ( = ?auto_142324 ?auto_142328 ) ) ( not ( = ?auto_142324 ?auto_142329 ) ) ( not ( = ?auto_142324 ?auto_142330 ) ) ( not ( = ?auto_142324 ?auto_142331 ) ) ( not ( = ?auto_142325 ?auto_142326 ) ) ( not ( = ?auto_142325 ?auto_142327 ) ) ( not ( = ?auto_142325 ?auto_142328 ) ) ( not ( = ?auto_142325 ?auto_142329 ) ) ( not ( = ?auto_142325 ?auto_142330 ) ) ( not ( = ?auto_142325 ?auto_142331 ) ) ( not ( = ?auto_142326 ?auto_142327 ) ) ( not ( = ?auto_142326 ?auto_142328 ) ) ( not ( = ?auto_142326 ?auto_142329 ) ) ( not ( = ?auto_142326 ?auto_142330 ) ) ( not ( = ?auto_142326 ?auto_142331 ) ) ( not ( = ?auto_142327 ?auto_142328 ) ) ( not ( = ?auto_142327 ?auto_142329 ) ) ( not ( = ?auto_142327 ?auto_142330 ) ) ( not ( = ?auto_142327 ?auto_142331 ) ) ( not ( = ?auto_142328 ?auto_142329 ) ) ( not ( = ?auto_142328 ?auto_142330 ) ) ( not ( = ?auto_142328 ?auto_142331 ) ) ( not ( = ?auto_142329 ?auto_142330 ) ) ( not ( = ?auto_142329 ?auto_142331 ) ) ( not ( = ?auto_142330 ?auto_142331 ) ) ( ON ?auto_142331 ?auto_142332 ) ( not ( = ?auto_142324 ?auto_142332 ) ) ( not ( = ?auto_142325 ?auto_142332 ) ) ( not ( = ?auto_142326 ?auto_142332 ) ) ( not ( = ?auto_142327 ?auto_142332 ) ) ( not ( = ?auto_142328 ?auto_142332 ) ) ( not ( = ?auto_142329 ?auto_142332 ) ) ( not ( = ?auto_142330 ?auto_142332 ) ) ( not ( = ?auto_142331 ?auto_142332 ) ) ( ON ?auto_142330 ?auto_142331 ) ( ON-TABLE ?auto_142332 ) ( CLEAR ?auto_142328 ) ( ON ?auto_142329 ?auto_142330 ) ( CLEAR ?auto_142329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_142332 ?auto_142331 ?auto_142330 )
      ( MAKE-8PILE ?auto_142324 ?auto_142325 ?auto_142326 ?auto_142327 ?auto_142328 ?auto_142329 ?auto_142330 ?auto_142331 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142333 - BLOCK
      ?auto_142334 - BLOCK
      ?auto_142335 - BLOCK
      ?auto_142336 - BLOCK
      ?auto_142337 - BLOCK
      ?auto_142338 - BLOCK
      ?auto_142339 - BLOCK
      ?auto_142340 - BLOCK
    )
    :vars
    (
      ?auto_142341 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142333 ) ( ON ?auto_142334 ?auto_142333 ) ( ON ?auto_142335 ?auto_142334 ) ( ON ?auto_142336 ?auto_142335 ) ( not ( = ?auto_142333 ?auto_142334 ) ) ( not ( = ?auto_142333 ?auto_142335 ) ) ( not ( = ?auto_142333 ?auto_142336 ) ) ( not ( = ?auto_142333 ?auto_142337 ) ) ( not ( = ?auto_142333 ?auto_142338 ) ) ( not ( = ?auto_142333 ?auto_142339 ) ) ( not ( = ?auto_142333 ?auto_142340 ) ) ( not ( = ?auto_142334 ?auto_142335 ) ) ( not ( = ?auto_142334 ?auto_142336 ) ) ( not ( = ?auto_142334 ?auto_142337 ) ) ( not ( = ?auto_142334 ?auto_142338 ) ) ( not ( = ?auto_142334 ?auto_142339 ) ) ( not ( = ?auto_142334 ?auto_142340 ) ) ( not ( = ?auto_142335 ?auto_142336 ) ) ( not ( = ?auto_142335 ?auto_142337 ) ) ( not ( = ?auto_142335 ?auto_142338 ) ) ( not ( = ?auto_142335 ?auto_142339 ) ) ( not ( = ?auto_142335 ?auto_142340 ) ) ( not ( = ?auto_142336 ?auto_142337 ) ) ( not ( = ?auto_142336 ?auto_142338 ) ) ( not ( = ?auto_142336 ?auto_142339 ) ) ( not ( = ?auto_142336 ?auto_142340 ) ) ( not ( = ?auto_142337 ?auto_142338 ) ) ( not ( = ?auto_142337 ?auto_142339 ) ) ( not ( = ?auto_142337 ?auto_142340 ) ) ( not ( = ?auto_142338 ?auto_142339 ) ) ( not ( = ?auto_142338 ?auto_142340 ) ) ( not ( = ?auto_142339 ?auto_142340 ) ) ( ON ?auto_142340 ?auto_142341 ) ( not ( = ?auto_142333 ?auto_142341 ) ) ( not ( = ?auto_142334 ?auto_142341 ) ) ( not ( = ?auto_142335 ?auto_142341 ) ) ( not ( = ?auto_142336 ?auto_142341 ) ) ( not ( = ?auto_142337 ?auto_142341 ) ) ( not ( = ?auto_142338 ?auto_142341 ) ) ( not ( = ?auto_142339 ?auto_142341 ) ) ( not ( = ?auto_142340 ?auto_142341 ) ) ( ON ?auto_142339 ?auto_142340 ) ( ON-TABLE ?auto_142341 ) ( ON ?auto_142338 ?auto_142339 ) ( CLEAR ?auto_142338 ) ( HOLDING ?auto_142337 ) ( CLEAR ?auto_142336 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_142333 ?auto_142334 ?auto_142335 ?auto_142336 ?auto_142337 )
      ( MAKE-8PILE ?auto_142333 ?auto_142334 ?auto_142335 ?auto_142336 ?auto_142337 ?auto_142338 ?auto_142339 ?auto_142340 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142342 - BLOCK
      ?auto_142343 - BLOCK
      ?auto_142344 - BLOCK
      ?auto_142345 - BLOCK
      ?auto_142346 - BLOCK
      ?auto_142347 - BLOCK
      ?auto_142348 - BLOCK
      ?auto_142349 - BLOCK
    )
    :vars
    (
      ?auto_142350 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142342 ) ( ON ?auto_142343 ?auto_142342 ) ( ON ?auto_142344 ?auto_142343 ) ( ON ?auto_142345 ?auto_142344 ) ( not ( = ?auto_142342 ?auto_142343 ) ) ( not ( = ?auto_142342 ?auto_142344 ) ) ( not ( = ?auto_142342 ?auto_142345 ) ) ( not ( = ?auto_142342 ?auto_142346 ) ) ( not ( = ?auto_142342 ?auto_142347 ) ) ( not ( = ?auto_142342 ?auto_142348 ) ) ( not ( = ?auto_142342 ?auto_142349 ) ) ( not ( = ?auto_142343 ?auto_142344 ) ) ( not ( = ?auto_142343 ?auto_142345 ) ) ( not ( = ?auto_142343 ?auto_142346 ) ) ( not ( = ?auto_142343 ?auto_142347 ) ) ( not ( = ?auto_142343 ?auto_142348 ) ) ( not ( = ?auto_142343 ?auto_142349 ) ) ( not ( = ?auto_142344 ?auto_142345 ) ) ( not ( = ?auto_142344 ?auto_142346 ) ) ( not ( = ?auto_142344 ?auto_142347 ) ) ( not ( = ?auto_142344 ?auto_142348 ) ) ( not ( = ?auto_142344 ?auto_142349 ) ) ( not ( = ?auto_142345 ?auto_142346 ) ) ( not ( = ?auto_142345 ?auto_142347 ) ) ( not ( = ?auto_142345 ?auto_142348 ) ) ( not ( = ?auto_142345 ?auto_142349 ) ) ( not ( = ?auto_142346 ?auto_142347 ) ) ( not ( = ?auto_142346 ?auto_142348 ) ) ( not ( = ?auto_142346 ?auto_142349 ) ) ( not ( = ?auto_142347 ?auto_142348 ) ) ( not ( = ?auto_142347 ?auto_142349 ) ) ( not ( = ?auto_142348 ?auto_142349 ) ) ( ON ?auto_142349 ?auto_142350 ) ( not ( = ?auto_142342 ?auto_142350 ) ) ( not ( = ?auto_142343 ?auto_142350 ) ) ( not ( = ?auto_142344 ?auto_142350 ) ) ( not ( = ?auto_142345 ?auto_142350 ) ) ( not ( = ?auto_142346 ?auto_142350 ) ) ( not ( = ?auto_142347 ?auto_142350 ) ) ( not ( = ?auto_142348 ?auto_142350 ) ) ( not ( = ?auto_142349 ?auto_142350 ) ) ( ON ?auto_142348 ?auto_142349 ) ( ON-TABLE ?auto_142350 ) ( ON ?auto_142347 ?auto_142348 ) ( CLEAR ?auto_142345 ) ( ON ?auto_142346 ?auto_142347 ) ( CLEAR ?auto_142346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_142350 ?auto_142349 ?auto_142348 ?auto_142347 )
      ( MAKE-8PILE ?auto_142342 ?auto_142343 ?auto_142344 ?auto_142345 ?auto_142346 ?auto_142347 ?auto_142348 ?auto_142349 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142351 - BLOCK
      ?auto_142352 - BLOCK
      ?auto_142353 - BLOCK
      ?auto_142354 - BLOCK
      ?auto_142355 - BLOCK
      ?auto_142356 - BLOCK
      ?auto_142357 - BLOCK
      ?auto_142358 - BLOCK
    )
    :vars
    (
      ?auto_142359 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142351 ) ( ON ?auto_142352 ?auto_142351 ) ( ON ?auto_142353 ?auto_142352 ) ( not ( = ?auto_142351 ?auto_142352 ) ) ( not ( = ?auto_142351 ?auto_142353 ) ) ( not ( = ?auto_142351 ?auto_142354 ) ) ( not ( = ?auto_142351 ?auto_142355 ) ) ( not ( = ?auto_142351 ?auto_142356 ) ) ( not ( = ?auto_142351 ?auto_142357 ) ) ( not ( = ?auto_142351 ?auto_142358 ) ) ( not ( = ?auto_142352 ?auto_142353 ) ) ( not ( = ?auto_142352 ?auto_142354 ) ) ( not ( = ?auto_142352 ?auto_142355 ) ) ( not ( = ?auto_142352 ?auto_142356 ) ) ( not ( = ?auto_142352 ?auto_142357 ) ) ( not ( = ?auto_142352 ?auto_142358 ) ) ( not ( = ?auto_142353 ?auto_142354 ) ) ( not ( = ?auto_142353 ?auto_142355 ) ) ( not ( = ?auto_142353 ?auto_142356 ) ) ( not ( = ?auto_142353 ?auto_142357 ) ) ( not ( = ?auto_142353 ?auto_142358 ) ) ( not ( = ?auto_142354 ?auto_142355 ) ) ( not ( = ?auto_142354 ?auto_142356 ) ) ( not ( = ?auto_142354 ?auto_142357 ) ) ( not ( = ?auto_142354 ?auto_142358 ) ) ( not ( = ?auto_142355 ?auto_142356 ) ) ( not ( = ?auto_142355 ?auto_142357 ) ) ( not ( = ?auto_142355 ?auto_142358 ) ) ( not ( = ?auto_142356 ?auto_142357 ) ) ( not ( = ?auto_142356 ?auto_142358 ) ) ( not ( = ?auto_142357 ?auto_142358 ) ) ( ON ?auto_142358 ?auto_142359 ) ( not ( = ?auto_142351 ?auto_142359 ) ) ( not ( = ?auto_142352 ?auto_142359 ) ) ( not ( = ?auto_142353 ?auto_142359 ) ) ( not ( = ?auto_142354 ?auto_142359 ) ) ( not ( = ?auto_142355 ?auto_142359 ) ) ( not ( = ?auto_142356 ?auto_142359 ) ) ( not ( = ?auto_142357 ?auto_142359 ) ) ( not ( = ?auto_142358 ?auto_142359 ) ) ( ON ?auto_142357 ?auto_142358 ) ( ON-TABLE ?auto_142359 ) ( ON ?auto_142356 ?auto_142357 ) ( ON ?auto_142355 ?auto_142356 ) ( CLEAR ?auto_142355 ) ( HOLDING ?auto_142354 ) ( CLEAR ?auto_142353 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_142351 ?auto_142352 ?auto_142353 ?auto_142354 )
      ( MAKE-8PILE ?auto_142351 ?auto_142352 ?auto_142353 ?auto_142354 ?auto_142355 ?auto_142356 ?auto_142357 ?auto_142358 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142360 - BLOCK
      ?auto_142361 - BLOCK
      ?auto_142362 - BLOCK
      ?auto_142363 - BLOCK
      ?auto_142364 - BLOCK
      ?auto_142365 - BLOCK
      ?auto_142366 - BLOCK
      ?auto_142367 - BLOCK
    )
    :vars
    (
      ?auto_142368 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142360 ) ( ON ?auto_142361 ?auto_142360 ) ( ON ?auto_142362 ?auto_142361 ) ( not ( = ?auto_142360 ?auto_142361 ) ) ( not ( = ?auto_142360 ?auto_142362 ) ) ( not ( = ?auto_142360 ?auto_142363 ) ) ( not ( = ?auto_142360 ?auto_142364 ) ) ( not ( = ?auto_142360 ?auto_142365 ) ) ( not ( = ?auto_142360 ?auto_142366 ) ) ( not ( = ?auto_142360 ?auto_142367 ) ) ( not ( = ?auto_142361 ?auto_142362 ) ) ( not ( = ?auto_142361 ?auto_142363 ) ) ( not ( = ?auto_142361 ?auto_142364 ) ) ( not ( = ?auto_142361 ?auto_142365 ) ) ( not ( = ?auto_142361 ?auto_142366 ) ) ( not ( = ?auto_142361 ?auto_142367 ) ) ( not ( = ?auto_142362 ?auto_142363 ) ) ( not ( = ?auto_142362 ?auto_142364 ) ) ( not ( = ?auto_142362 ?auto_142365 ) ) ( not ( = ?auto_142362 ?auto_142366 ) ) ( not ( = ?auto_142362 ?auto_142367 ) ) ( not ( = ?auto_142363 ?auto_142364 ) ) ( not ( = ?auto_142363 ?auto_142365 ) ) ( not ( = ?auto_142363 ?auto_142366 ) ) ( not ( = ?auto_142363 ?auto_142367 ) ) ( not ( = ?auto_142364 ?auto_142365 ) ) ( not ( = ?auto_142364 ?auto_142366 ) ) ( not ( = ?auto_142364 ?auto_142367 ) ) ( not ( = ?auto_142365 ?auto_142366 ) ) ( not ( = ?auto_142365 ?auto_142367 ) ) ( not ( = ?auto_142366 ?auto_142367 ) ) ( ON ?auto_142367 ?auto_142368 ) ( not ( = ?auto_142360 ?auto_142368 ) ) ( not ( = ?auto_142361 ?auto_142368 ) ) ( not ( = ?auto_142362 ?auto_142368 ) ) ( not ( = ?auto_142363 ?auto_142368 ) ) ( not ( = ?auto_142364 ?auto_142368 ) ) ( not ( = ?auto_142365 ?auto_142368 ) ) ( not ( = ?auto_142366 ?auto_142368 ) ) ( not ( = ?auto_142367 ?auto_142368 ) ) ( ON ?auto_142366 ?auto_142367 ) ( ON-TABLE ?auto_142368 ) ( ON ?auto_142365 ?auto_142366 ) ( ON ?auto_142364 ?auto_142365 ) ( CLEAR ?auto_142362 ) ( ON ?auto_142363 ?auto_142364 ) ( CLEAR ?auto_142363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_142368 ?auto_142367 ?auto_142366 ?auto_142365 ?auto_142364 )
      ( MAKE-8PILE ?auto_142360 ?auto_142361 ?auto_142362 ?auto_142363 ?auto_142364 ?auto_142365 ?auto_142366 ?auto_142367 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142369 - BLOCK
      ?auto_142370 - BLOCK
      ?auto_142371 - BLOCK
      ?auto_142372 - BLOCK
      ?auto_142373 - BLOCK
      ?auto_142374 - BLOCK
      ?auto_142375 - BLOCK
      ?auto_142376 - BLOCK
    )
    :vars
    (
      ?auto_142377 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142369 ) ( ON ?auto_142370 ?auto_142369 ) ( not ( = ?auto_142369 ?auto_142370 ) ) ( not ( = ?auto_142369 ?auto_142371 ) ) ( not ( = ?auto_142369 ?auto_142372 ) ) ( not ( = ?auto_142369 ?auto_142373 ) ) ( not ( = ?auto_142369 ?auto_142374 ) ) ( not ( = ?auto_142369 ?auto_142375 ) ) ( not ( = ?auto_142369 ?auto_142376 ) ) ( not ( = ?auto_142370 ?auto_142371 ) ) ( not ( = ?auto_142370 ?auto_142372 ) ) ( not ( = ?auto_142370 ?auto_142373 ) ) ( not ( = ?auto_142370 ?auto_142374 ) ) ( not ( = ?auto_142370 ?auto_142375 ) ) ( not ( = ?auto_142370 ?auto_142376 ) ) ( not ( = ?auto_142371 ?auto_142372 ) ) ( not ( = ?auto_142371 ?auto_142373 ) ) ( not ( = ?auto_142371 ?auto_142374 ) ) ( not ( = ?auto_142371 ?auto_142375 ) ) ( not ( = ?auto_142371 ?auto_142376 ) ) ( not ( = ?auto_142372 ?auto_142373 ) ) ( not ( = ?auto_142372 ?auto_142374 ) ) ( not ( = ?auto_142372 ?auto_142375 ) ) ( not ( = ?auto_142372 ?auto_142376 ) ) ( not ( = ?auto_142373 ?auto_142374 ) ) ( not ( = ?auto_142373 ?auto_142375 ) ) ( not ( = ?auto_142373 ?auto_142376 ) ) ( not ( = ?auto_142374 ?auto_142375 ) ) ( not ( = ?auto_142374 ?auto_142376 ) ) ( not ( = ?auto_142375 ?auto_142376 ) ) ( ON ?auto_142376 ?auto_142377 ) ( not ( = ?auto_142369 ?auto_142377 ) ) ( not ( = ?auto_142370 ?auto_142377 ) ) ( not ( = ?auto_142371 ?auto_142377 ) ) ( not ( = ?auto_142372 ?auto_142377 ) ) ( not ( = ?auto_142373 ?auto_142377 ) ) ( not ( = ?auto_142374 ?auto_142377 ) ) ( not ( = ?auto_142375 ?auto_142377 ) ) ( not ( = ?auto_142376 ?auto_142377 ) ) ( ON ?auto_142375 ?auto_142376 ) ( ON-TABLE ?auto_142377 ) ( ON ?auto_142374 ?auto_142375 ) ( ON ?auto_142373 ?auto_142374 ) ( ON ?auto_142372 ?auto_142373 ) ( CLEAR ?auto_142372 ) ( HOLDING ?auto_142371 ) ( CLEAR ?auto_142370 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_142369 ?auto_142370 ?auto_142371 )
      ( MAKE-8PILE ?auto_142369 ?auto_142370 ?auto_142371 ?auto_142372 ?auto_142373 ?auto_142374 ?auto_142375 ?auto_142376 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142378 - BLOCK
      ?auto_142379 - BLOCK
      ?auto_142380 - BLOCK
      ?auto_142381 - BLOCK
      ?auto_142382 - BLOCK
      ?auto_142383 - BLOCK
      ?auto_142384 - BLOCK
      ?auto_142385 - BLOCK
    )
    :vars
    (
      ?auto_142386 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142378 ) ( ON ?auto_142379 ?auto_142378 ) ( not ( = ?auto_142378 ?auto_142379 ) ) ( not ( = ?auto_142378 ?auto_142380 ) ) ( not ( = ?auto_142378 ?auto_142381 ) ) ( not ( = ?auto_142378 ?auto_142382 ) ) ( not ( = ?auto_142378 ?auto_142383 ) ) ( not ( = ?auto_142378 ?auto_142384 ) ) ( not ( = ?auto_142378 ?auto_142385 ) ) ( not ( = ?auto_142379 ?auto_142380 ) ) ( not ( = ?auto_142379 ?auto_142381 ) ) ( not ( = ?auto_142379 ?auto_142382 ) ) ( not ( = ?auto_142379 ?auto_142383 ) ) ( not ( = ?auto_142379 ?auto_142384 ) ) ( not ( = ?auto_142379 ?auto_142385 ) ) ( not ( = ?auto_142380 ?auto_142381 ) ) ( not ( = ?auto_142380 ?auto_142382 ) ) ( not ( = ?auto_142380 ?auto_142383 ) ) ( not ( = ?auto_142380 ?auto_142384 ) ) ( not ( = ?auto_142380 ?auto_142385 ) ) ( not ( = ?auto_142381 ?auto_142382 ) ) ( not ( = ?auto_142381 ?auto_142383 ) ) ( not ( = ?auto_142381 ?auto_142384 ) ) ( not ( = ?auto_142381 ?auto_142385 ) ) ( not ( = ?auto_142382 ?auto_142383 ) ) ( not ( = ?auto_142382 ?auto_142384 ) ) ( not ( = ?auto_142382 ?auto_142385 ) ) ( not ( = ?auto_142383 ?auto_142384 ) ) ( not ( = ?auto_142383 ?auto_142385 ) ) ( not ( = ?auto_142384 ?auto_142385 ) ) ( ON ?auto_142385 ?auto_142386 ) ( not ( = ?auto_142378 ?auto_142386 ) ) ( not ( = ?auto_142379 ?auto_142386 ) ) ( not ( = ?auto_142380 ?auto_142386 ) ) ( not ( = ?auto_142381 ?auto_142386 ) ) ( not ( = ?auto_142382 ?auto_142386 ) ) ( not ( = ?auto_142383 ?auto_142386 ) ) ( not ( = ?auto_142384 ?auto_142386 ) ) ( not ( = ?auto_142385 ?auto_142386 ) ) ( ON ?auto_142384 ?auto_142385 ) ( ON-TABLE ?auto_142386 ) ( ON ?auto_142383 ?auto_142384 ) ( ON ?auto_142382 ?auto_142383 ) ( ON ?auto_142381 ?auto_142382 ) ( CLEAR ?auto_142379 ) ( ON ?auto_142380 ?auto_142381 ) ( CLEAR ?auto_142380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_142386 ?auto_142385 ?auto_142384 ?auto_142383 ?auto_142382 ?auto_142381 )
      ( MAKE-8PILE ?auto_142378 ?auto_142379 ?auto_142380 ?auto_142381 ?auto_142382 ?auto_142383 ?auto_142384 ?auto_142385 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142387 - BLOCK
      ?auto_142388 - BLOCK
      ?auto_142389 - BLOCK
      ?auto_142390 - BLOCK
      ?auto_142391 - BLOCK
      ?auto_142392 - BLOCK
      ?auto_142393 - BLOCK
      ?auto_142394 - BLOCK
    )
    :vars
    (
      ?auto_142395 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142387 ) ( not ( = ?auto_142387 ?auto_142388 ) ) ( not ( = ?auto_142387 ?auto_142389 ) ) ( not ( = ?auto_142387 ?auto_142390 ) ) ( not ( = ?auto_142387 ?auto_142391 ) ) ( not ( = ?auto_142387 ?auto_142392 ) ) ( not ( = ?auto_142387 ?auto_142393 ) ) ( not ( = ?auto_142387 ?auto_142394 ) ) ( not ( = ?auto_142388 ?auto_142389 ) ) ( not ( = ?auto_142388 ?auto_142390 ) ) ( not ( = ?auto_142388 ?auto_142391 ) ) ( not ( = ?auto_142388 ?auto_142392 ) ) ( not ( = ?auto_142388 ?auto_142393 ) ) ( not ( = ?auto_142388 ?auto_142394 ) ) ( not ( = ?auto_142389 ?auto_142390 ) ) ( not ( = ?auto_142389 ?auto_142391 ) ) ( not ( = ?auto_142389 ?auto_142392 ) ) ( not ( = ?auto_142389 ?auto_142393 ) ) ( not ( = ?auto_142389 ?auto_142394 ) ) ( not ( = ?auto_142390 ?auto_142391 ) ) ( not ( = ?auto_142390 ?auto_142392 ) ) ( not ( = ?auto_142390 ?auto_142393 ) ) ( not ( = ?auto_142390 ?auto_142394 ) ) ( not ( = ?auto_142391 ?auto_142392 ) ) ( not ( = ?auto_142391 ?auto_142393 ) ) ( not ( = ?auto_142391 ?auto_142394 ) ) ( not ( = ?auto_142392 ?auto_142393 ) ) ( not ( = ?auto_142392 ?auto_142394 ) ) ( not ( = ?auto_142393 ?auto_142394 ) ) ( ON ?auto_142394 ?auto_142395 ) ( not ( = ?auto_142387 ?auto_142395 ) ) ( not ( = ?auto_142388 ?auto_142395 ) ) ( not ( = ?auto_142389 ?auto_142395 ) ) ( not ( = ?auto_142390 ?auto_142395 ) ) ( not ( = ?auto_142391 ?auto_142395 ) ) ( not ( = ?auto_142392 ?auto_142395 ) ) ( not ( = ?auto_142393 ?auto_142395 ) ) ( not ( = ?auto_142394 ?auto_142395 ) ) ( ON ?auto_142393 ?auto_142394 ) ( ON-TABLE ?auto_142395 ) ( ON ?auto_142392 ?auto_142393 ) ( ON ?auto_142391 ?auto_142392 ) ( ON ?auto_142390 ?auto_142391 ) ( ON ?auto_142389 ?auto_142390 ) ( CLEAR ?auto_142389 ) ( HOLDING ?auto_142388 ) ( CLEAR ?auto_142387 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_142387 ?auto_142388 )
      ( MAKE-8PILE ?auto_142387 ?auto_142388 ?auto_142389 ?auto_142390 ?auto_142391 ?auto_142392 ?auto_142393 ?auto_142394 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142396 - BLOCK
      ?auto_142397 - BLOCK
      ?auto_142398 - BLOCK
      ?auto_142399 - BLOCK
      ?auto_142400 - BLOCK
      ?auto_142401 - BLOCK
      ?auto_142402 - BLOCK
      ?auto_142403 - BLOCK
    )
    :vars
    (
      ?auto_142404 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142396 ) ( not ( = ?auto_142396 ?auto_142397 ) ) ( not ( = ?auto_142396 ?auto_142398 ) ) ( not ( = ?auto_142396 ?auto_142399 ) ) ( not ( = ?auto_142396 ?auto_142400 ) ) ( not ( = ?auto_142396 ?auto_142401 ) ) ( not ( = ?auto_142396 ?auto_142402 ) ) ( not ( = ?auto_142396 ?auto_142403 ) ) ( not ( = ?auto_142397 ?auto_142398 ) ) ( not ( = ?auto_142397 ?auto_142399 ) ) ( not ( = ?auto_142397 ?auto_142400 ) ) ( not ( = ?auto_142397 ?auto_142401 ) ) ( not ( = ?auto_142397 ?auto_142402 ) ) ( not ( = ?auto_142397 ?auto_142403 ) ) ( not ( = ?auto_142398 ?auto_142399 ) ) ( not ( = ?auto_142398 ?auto_142400 ) ) ( not ( = ?auto_142398 ?auto_142401 ) ) ( not ( = ?auto_142398 ?auto_142402 ) ) ( not ( = ?auto_142398 ?auto_142403 ) ) ( not ( = ?auto_142399 ?auto_142400 ) ) ( not ( = ?auto_142399 ?auto_142401 ) ) ( not ( = ?auto_142399 ?auto_142402 ) ) ( not ( = ?auto_142399 ?auto_142403 ) ) ( not ( = ?auto_142400 ?auto_142401 ) ) ( not ( = ?auto_142400 ?auto_142402 ) ) ( not ( = ?auto_142400 ?auto_142403 ) ) ( not ( = ?auto_142401 ?auto_142402 ) ) ( not ( = ?auto_142401 ?auto_142403 ) ) ( not ( = ?auto_142402 ?auto_142403 ) ) ( ON ?auto_142403 ?auto_142404 ) ( not ( = ?auto_142396 ?auto_142404 ) ) ( not ( = ?auto_142397 ?auto_142404 ) ) ( not ( = ?auto_142398 ?auto_142404 ) ) ( not ( = ?auto_142399 ?auto_142404 ) ) ( not ( = ?auto_142400 ?auto_142404 ) ) ( not ( = ?auto_142401 ?auto_142404 ) ) ( not ( = ?auto_142402 ?auto_142404 ) ) ( not ( = ?auto_142403 ?auto_142404 ) ) ( ON ?auto_142402 ?auto_142403 ) ( ON-TABLE ?auto_142404 ) ( ON ?auto_142401 ?auto_142402 ) ( ON ?auto_142400 ?auto_142401 ) ( ON ?auto_142399 ?auto_142400 ) ( ON ?auto_142398 ?auto_142399 ) ( CLEAR ?auto_142396 ) ( ON ?auto_142397 ?auto_142398 ) ( CLEAR ?auto_142397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_142404 ?auto_142403 ?auto_142402 ?auto_142401 ?auto_142400 ?auto_142399 ?auto_142398 )
      ( MAKE-8PILE ?auto_142396 ?auto_142397 ?auto_142398 ?auto_142399 ?auto_142400 ?auto_142401 ?auto_142402 ?auto_142403 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142405 - BLOCK
      ?auto_142406 - BLOCK
      ?auto_142407 - BLOCK
      ?auto_142408 - BLOCK
      ?auto_142409 - BLOCK
      ?auto_142410 - BLOCK
      ?auto_142411 - BLOCK
      ?auto_142412 - BLOCK
    )
    :vars
    (
      ?auto_142413 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142405 ?auto_142406 ) ) ( not ( = ?auto_142405 ?auto_142407 ) ) ( not ( = ?auto_142405 ?auto_142408 ) ) ( not ( = ?auto_142405 ?auto_142409 ) ) ( not ( = ?auto_142405 ?auto_142410 ) ) ( not ( = ?auto_142405 ?auto_142411 ) ) ( not ( = ?auto_142405 ?auto_142412 ) ) ( not ( = ?auto_142406 ?auto_142407 ) ) ( not ( = ?auto_142406 ?auto_142408 ) ) ( not ( = ?auto_142406 ?auto_142409 ) ) ( not ( = ?auto_142406 ?auto_142410 ) ) ( not ( = ?auto_142406 ?auto_142411 ) ) ( not ( = ?auto_142406 ?auto_142412 ) ) ( not ( = ?auto_142407 ?auto_142408 ) ) ( not ( = ?auto_142407 ?auto_142409 ) ) ( not ( = ?auto_142407 ?auto_142410 ) ) ( not ( = ?auto_142407 ?auto_142411 ) ) ( not ( = ?auto_142407 ?auto_142412 ) ) ( not ( = ?auto_142408 ?auto_142409 ) ) ( not ( = ?auto_142408 ?auto_142410 ) ) ( not ( = ?auto_142408 ?auto_142411 ) ) ( not ( = ?auto_142408 ?auto_142412 ) ) ( not ( = ?auto_142409 ?auto_142410 ) ) ( not ( = ?auto_142409 ?auto_142411 ) ) ( not ( = ?auto_142409 ?auto_142412 ) ) ( not ( = ?auto_142410 ?auto_142411 ) ) ( not ( = ?auto_142410 ?auto_142412 ) ) ( not ( = ?auto_142411 ?auto_142412 ) ) ( ON ?auto_142412 ?auto_142413 ) ( not ( = ?auto_142405 ?auto_142413 ) ) ( not ( = ?auto_142406 ?auto_142413 ) ) ( not ( = ?auto_142407 ?auto_142413 ) ) ( not ( = ?auto_142408 ?auto_142413 ) ) ( not ( = ?auto_142409 ?auto_142413 ) ) ( not ( = ?auto_142410 ?auto_142413 ) ) ( not ( = ?auto_142411 ?auto_142413 ) ) ( not ( = ?auto_142412 ?auto_142413 ) ) ( ON ?auto_142411 ?auto_142412 ) ( ON-TABLE ?auto_142413 ) ( ON ?auto_142410 ?auto_142411 ) ( ON ?auto_142409 ?auto_142410 ) ( ON ?auto_142408 ?auto_142409 ) ( ON ?auto_142407 ?auto_142408 ) ( ON ?auto_142406 ?auto_142407 ) ( CLEAR ?auto_142406 ) ( HOLDING ?auto_142405 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_142405 )
      ( MAKE-8PILE ?auto_142405 ?auto_142406 ?auto_142407 ?auto_142408 ?auto_142409 ?auto_142410 ?auto_142411 ?auto_142412 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142414 - BLOCK
      ?auto_142415 - BLOCK
      ?auto_142416 - BLOCK
      ?auto_142417 - BLOCK
      ?auto_142418 - BLOCK
      ?auto_142419 - BLOCK
      ?auto_142420 - BLOCK
      ?auto_142421 - BLOCK
    )
    :vars
    (
      ?auto_142422 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142414 ?auto_142415 ) ) ( not ( = ?auto_142414 ?auto_142416 ) ) ( not ( = ?auto_142414 ?auto_142417 ) ) ( not ( = ?auto_142414 ?auto_142418 ) ) ( not ( = ?auto_142414 ?auto_142419 ) ) ( not ( = ?auto_142414 ?auto_142420 ) ) ( not ( = ?auto_142414 ?auto_142421 ) ) ( not ( = ?auto_142415 ?auto_142416 ) ) ( not ( = ?auto_142415 ?auto_142417 ) ) ( not ( = ?auto_142415 ?auto_142418 ) ) ( not ( = ?auto_142415 ?auto_142419 ) ) ( not ( = ?auto_142415 ?auto_142420 ) ) ( not ( = ?auto_142415 ?auto_142421 ) ) ( not ( = ?auto_142416 ?auto_142417 ) ) ( not ( = ?auto_142416 ?auto_142418 ) ) ( not ( = ?auto_142416 ?auto_142419 ) ) ( not ( = ?auto_142416 ?auto_142420 ) ) ( not ( = ?auto_142416 ?auto_142421 ) ) ( not ( = ?auto_142417 ?auto_142418 ) ) ( not ( = ?auto_142417 ?auto_142419 ) ) ( not ( = ?auto_142417 ?auto_142420 ) ) ( not ( = ?auto_142417 ?auto_142421 ) ) ( not ( = ?auto_142418 ?auto_142419 ) ) ( not ( = ?auto_142418 ?auto_142420 ) ) ( not ( = ?auto_142418 ?auto_142421 ) ) ( not ( = ?auto_142419 ?auto_142420 ) ) ( not ( = ?auto_142419 ?auto_142421 ) ) ( not ( = ?auto_142420 ?auto_142421 ) ) ( ON ?auto_142421 ?auto_142422 ) ( not ( = ?auto_142414 ?auto_142422 ) ) ( not ( = ?auto_142415 ?auto_142422 ) ) ( not ( = ?auto_142416 ?auto_142422 ) ) ( not ( = ?auto_142417 ?auto_142422 ) ) ( not ( = ?auto_142418 ?auto_142422 ) ) ( not ( = ?auto_142419 ?auto_142422 ) ) ( not ( = ?auto_142420 ?auto_142422 ) ) ( not ( = ?auto_142421 ?auto_142422 ) ) ( ON ?auto_142420 ?auto_142421 ) ( ON-TABLE ?auto_142422 ) ( ON ?auto_142419 ?auto_142420 ) ( ON ?auto_142418 ?auto_142419 ) ( ON ?auto_142417 ?auto_142418 ) ( ON ?auto_142416 ?auto_142417 ) ( ON ?auto_142415 ?auto_142416 ) ( ON ?auto_142414 ?auto_142415 ) ( CLEAR ?auto_142414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_142422 ?auto_142421 ?auto_142420 ?auto_142419 ?auto_142418 ?auto_142417 ?auto_142416 ?auto_142415 )
      ( MAKE-8PILE ?auto_142414 ?auto_142415 ?auto_142416 ?auto_142417 ?auto_142418 ?auto_142419 ?auto_142420 ?auto_142421 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142430 - BLOCK
      ?auto_142431 - BLOCK
      ?auto_142432 - BLOCK
      ?auto_142433 - BLOCK
      ?auto_142434 - BLOCK
      ?auto_142435 - BLOCK
      ?auto_142436 - BLOCK
    )
    :vars
    (
      ?auto_142437 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142437 ?auto_142436 ) ( CLEAR ?auto_142437 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_142430 ) ( ON ?auto_142431 ?auto_142430 ) ( ON ?auto_142432 ?auto_142431 ) ( ON ?auto_142433 ?auto_142432 ) ( ON ?auto_142434 ?auto_142433 ) ( ON ?auto_142435 ?auto_142434 ) ( ON ?auto_142436 ?auto_142435 ) ( not ( = ?auto_142430 ?auto_142431 ) ) ( not ( = ?auto_142430 ?auto_142432 ) ) ( not ( = ?auto_142430 ?auto_142433 ) ) ( not ( = ?auto_142430 ?auto_142434 ) ) ( not ( = ?auto_142430 ?auto_142435 ) ) ( not ( = ?auto_142430 ?auto_142436 ) ) ( not ( = ?auto_142430 ?auto_142437 ) ) ( not ( = ?auto_142431 ?auto_142432 ) ) ( not ( = ?auto_142431 ?auto_142433 ) ) ( not ( = ?auto_142431 ?auto_142434 ) ) ( not ( = ?auto_142431 ?auto_142435 ) ) ( not ( = ?auto_142431 ?auto_142436 ) ) ( not ( = ?auto_142431 ?auto_142437 ) ) ( not ( = ?auto_142432 ?auto_142433 ) ) ( not ( = ?auto_142432 ?auto_142434 ) ) ( not ( = ?auto_142432 ?auto_142435 ) ) ( not ( = ?auto_142432 ?auto_142436 ) ) ( not ( = ?auto_142432 ?auto_142437 ) ) ( not ( = ?auto_142433 ?auto_142434 ) ) ( not ( = ?auto_142433 ?auto_142435 ) ) ( not ( = ?auto_142433 ?auto_142436 ) ) ( not ( = ?auto_142433 ?auto_142437 ) ) ( not ( = ?auto_142434 ?auto_142435 ) ) ( not ( = ?auto_142434 ?auto_142436 ) ) ( not ( = ?auto_142434 ?auto_142437 ) ) ( not ( = ?auto_142435 ?auto_142436 ) ) ( not ( = ?auto_142435 ?auto_142437 ) ) ( not ( = ?auto_142436 ?auto_142437 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_142437 ?auto_142436 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142455 - BLOCK
      ?auto_142456 - BLOCK
      ?auto_142457 - BLOCK
      ?auto_142458 - BLOCK
      ?auto_142459 - BLOCK
      ?auto_142460 - BLOCK
      ?auto_142461 - BLOCK
    )
    :vars
    (
      ?auto_142462 - BLOCK
      ?auto_142463 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142455 ) ( ON ?auto_142456 ?auto_142455 ) ( ON ?auto_142457 ?auto_142456 ) ( ON ?auto_142458 ?auto_142457 ) ( ON ?auto_142459 ?auto_142458 ) ( ON ?auto_142460 ?auto_142459 ) ( not ( = ?auto_142455 ?auto_142456 ) ) ( not ( = ?auto_142455 ?auto_142457 ) ) ( not ( = ?auto_142455 ?auto_142458 ) ) ( not ( = ?auto_142455 ?auto_142459 ) ) ( not ( = ?auto_142455 ?auto_142460 ) ) ( not ( = ?auto_142455 ?auto_142461 ) ) ( not ( = ?auto_142455 ?auto_142462 ) ) ( not ( = ?auto_142456 ?auto_142457 ) ) ( not ( = ?auto_142456 ?auto_142458 ) ) ( not ( = ?auto_142456 ?auto_142459 ) ) ( not ( = ?auto_142456 ?auto_142460 ) ) ( not ( = ?auto_142456 ?auto_142461 ) ) ( not ( = ?auto_142456 ?auto_142462 ) ) ( not ( = ?auto_142457 ?auto_142458 ) ) ( not ( = ?auto_142457 ?auto_142459 ) ) ( not ( = ?auto_142457 ?auto_142460 ) ) ( not ( = ?auto_142457 ?auto_142461 ) ) ( not ( = ?auto_142457 ?auto_142462 ) ) ( not ( = ?auto_142458 ?auto_142459 ) ) ( not ( = ?auto_142458 ?auto_142460 ) ) ( not ( = ?auto_142458 ?auto_142461 ) ) ( not ( = ?auto_142458 ?auto_142462 ) ) ( not ( = ?auto_142459 ?auto_142460 ) ) ( not ( = ?auto_142459 ?auto_142461 ) ) ( not ( = ?auto_142459 ?auto_142462 ) ) ( not ( = ?auto_142460 ?auto_142461 ) ) ( not ( = ?auto_142460 ?auto_142462 ) ) ( not ( = ?auto_142461 ?auto_142462 ) ) ( ON ?auto_142462 ?auto_142463 ) ( CLEAR ?auto_142462 ) ( not ( = ?auto_142455 ?auto_142463 ) ) ( not ( = ?auto_142456 ?auto_142463 ) ) ( not ( = ?auto_142457 ?auto_142463 ) ) ( not ( = ?auto_142458 ?auto_142463 ) ) ( not ( = ?auto_142459 ?auto_142463 ) ) ( not ( = ?auto_142460 ?auto_142463 ) ) ( not ( = ?auto_142461 ?auto_142463 ) ) ( not ( = ?auto_142462 ?auto_142463 ) ) ( HOLDING ?auto_142461 ) ( CLEAR ?auto_142460 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_142455 ?auto_142456 ?auto_142457 ?auto_142458 ?auto_142459 ?auto_142460 ?auto_142461 ?auto_142462 )
      ( MAKE-7PILE ?auto_142455 ?auto_142456 ?auto_142457 ?auto_142458 ?auto_142459 ?auto_142460 ?auto_142461 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142464 - BLOCK
      ?auto_142465 - BLOCK
      ?auto_142466 - BLOCK
      ?auto_142467 - BLOCK
      ?auto_142468 - BLOCK
      ?auto_142469 - BLOCK
      ?auto_142470 - BLOCK
    )
    :vars
    (
      ?auto_142472 - BLOCK
      ?auto_142471 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142464 ) ( ON ?auto_142465 ?auto_142464 ) ( ON ?auto_142466 ?auto_142465 ) ( ON ?auto_142467 ?auto_142466 ) ( ON ?auto_142468 ?auto_142467 ) ( ON ?auto_142469 ?auto_142468 ) ( not ( = ?auto_142464 ?auto_142465 ) ) ( not ( = ?auto_142464 ?auto_142466 ) ) ( not ( = ?auto_142464 ?auto_142467 ) ) ( not ( = ?auto_142464 ?auto_142468 ) ) ( not ( = ?auto_142464 ?auto_142469 ) ) ( not ( = ?auto_142464 ?auto_142470 ) ) ( not ( = ?auto_142464 ?auto_142472 ) ) ( not ( = ?auto_142465 ?auto_142466 ) ) ( not ( = ?auto_142465 ?auto_142467 ) ) ( not ( = ?auto_142465 ?auto_142468 ) ) ( not ( = ?auto_142465 ?auto_142469 ) ) ( not ( = ?auto_142465 ?auto_142470 ) ) ( not ( = ?auto_142465 ?auto_142472 ) ) ( not ( = ?auto_142466 ?auto_142467 ) ) ( not ( = ?auto_142466 ?auto_142468 ) ) ( not ( = ?auto_142466 ?auto_142469 ) ) ( not ( = ?auto_142466 ?auto_142470 ) ) ( not ( = ?auto_142466 ?auto_142472 ) ) ( not ( = ?auto_142467 ?auto_142468 ) ) ( not ( = ?auto_142467 ?auto_142469 ) ) ( not ( = ?auto_142467 ?auto_142470 ) ) ( not ( = ?auto_142467 ?auto_142472 ) ) ( not ( = ?auto_142468 ?auto_142469 ) ) ( not ( = ?auto_142468 ?auto_142470 ) ) ( not ( = ?auto_142468 ?auto_142472 ) ) ( not ( = ?auto_142469 ?auto_142470 ) ) ( not ( = ?auto_142469 ?auto_142472 ) ) ( not ( = ?auto_142470 ?auto_142472 ) ) ( ON ?auto_142472 ?auto_142471 ) ( not ( = ?auto_142464 ?auto_142471 ) ) ( not ( = ?auto_142465 ?auto_142471 ) ) ( not ( = ?auto_142466 ?auto_142471 ) ) ( not ( = ?auto_142467 ?auto_142471 ) ) ( not ( = ?auto_142468 ?auto_142471 ) ) ( not ( = ?auto_142469 ?auto_142471 ) ) ( not ( = ?auto_142470 ?auto_142471 ) ) ( not ( = ?auto_142472 ?auto_142471 ) ) ( CLEAR ?auto_142469 ) ( ON ?auto_142470 ?auto_142472 ) ( CLEAR ?auto_142470 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_142471 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_142471 ?auto_142472 )
      ( MAKE-7PILE ?auto_142464 ?auto_142465 ?auto_142466 ?auto_142467 ?auto_142468 ?auto_142469 ?auto_142470 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142473 - BLOCK
      ?auto_142474 - BLOCK
      ?auto_142475 - BLOCK
      ?auto_142476 - BLOCK
      ?auto_142477 - BLOCK
      ?auto_142478 - BLOCK
      ?auto_142479 - BLOCK
    )
    :vars
    (
      ?auto_142480 - BLOCK
      ?auto_142481 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142473 ) ( ON ?auto_142474 ?auto_142473 ) ( ON ?auto_142475 ?auto_142474 ) ( ON ?auto_142476 ?auto_142475 ) ( ON ?auto_142477 ?auto_142476 ) ( not ( = ?auto_142473 ?auto_142474 ) ) ( not ( = ?auto_142473 ?auto_142475 ) ) ( not ( = ?auto_142473 ?auto_142476 ) ) ( not ( = ?auto_142473 ?auto_142477 ) ) ( not ( = ?auto_142473 ?auto_142478 ) ) ( not ( = ?auto_142473 ?auto_142479 ) ) ( not ( = ?auto_142473 ?auto_142480 ) ) ( not ( = ?auto_142474 ?auto_142475 ) ) ( not ( = ?auto_142474 ?auto_142476 ) ) ( not ( = ?auto_142474 ?auto_142477 ) ) ( not ( = ?auto_142474 ?auto_142478 ) ) ( not ( = ?auto_142474 ?auto_142479 ) ) ( not ( = ?auto_142474 ?auto_142480 ) ) ( not ( = ?auto_142475 ?auto_142476 ) ) ( not ( = ?auto_142475 ?auto_142477 ) ) ( not ( = ?auto_142475 ?auto_142478 ) ) ( not ( = ?auto_142475 ?auto_142479 ) ) ( not ( = ?auto_142475 ?auto_142480 ) ) ( not ( = ?auto_142476 ?auto_142477 ) ) ( not ( = ?auto_142476 ?auto_142478 ) ) ( not ( = ?auto_142476 ?auto_142479 ) ) ( not ( = ?auto_142476 ?auto_142480 ) ) ( not ( = ?auto_142477 ?auto_142478 ) ) ( not ( = ?auto_142477 ?auto_142479 ) ) ( not ( = ?auto_142477 ?auto_142480 ) ) ( not ( = ?auto_142478 ?auto_142479 ) ) ( not ( = ?auto_142478 ?auto_142480 ) ) ( not ( = ?auto_142479 ?auto_142480 ) ) ( ON ?auto_142480 ?auto_142481 ) ( not ( = ?auto_142473 ?auto_142481 ) ) ( not ( = ?auto_142474 ?auto_142481 ) ) ( not ( = ?auto_142475 ?auto_142481 ) ) ( not ( = ?auto_142476 ?auto_142481 ) ) ( not ( = ?auto_142477 ?auto_142481 ) ) ( not ( = ?auto_142478 ?auto_142481 ) ) ( not ( = ?auto_142479 ?auto_142481 ) ) ( not ( = ?auto_142480 ?auto_142481 ) ) ( ON ?auto_142479 ?auto_142480 ) ( CLEAR ?auto_142479 ) ( ON-TABLE ?auto_142481 ) ( HOLDING ?auto_142478 ) ( CLEAR ?auto_142477 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_142473 ?auto_142474 ?auto_142475 ?auto_142476 ?auto_142477 ?auto_142478 )
      ( MAKE-7PILE ?auto_142473 ?auto_142474 ?auto_142475 ?auto_142476 ?auto_142477 ?auto_142478 ?auto_142479 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142482 - BLOCK
      ?auto_142483 - BLOCK
      ?auto_142484 - BLOCK
      ?auto_142485 - BLOCK
      ?auto_142486 - BLOCK
      ?auto_142487 - BLOCK
      ?auto_142488 - BLOCK
    )
    :vars
    (
      ?auto_142490 - BLOCK
      ?auto_142489 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142482 ) ( ON ?auto_142483 ?auto_142482 ) ( ON ?auto_142484 ?auto_142483 ) ( ON ?auto_142485 ?auto_142484 ) ( ON ?auto_142486 ?auto_142485 ) ( not ( = ?auto_142482 ?auto_142483 ) ) ( not ( = ?auto_142482 ?auto_142484 ) ) ( not ( = ?auto_142482 ?auto_142485 ) ) ( not ( = ?auto_142482 ?auto_142486 ) ) ( not ( = ?auto_142482 ?auto_142487 ) ) ( not ( = ?auto_142482 ?auto_142488 ) ) ( not ( = ?auto_142482 ?auto_142490 ) ) ( not ( = ?auto_142483 ?auto_142484 ) ) ( not ( = ?auto_142483 ?auto_142485 ) ) ( not ( = ?auto_142483 ?auto_142486 ) ) ( not ( = ?auto_142483 ?auto_142487 ) ) ( not ( = ?auto_142483 ?auto_142488 ) ) ( not ( = ?auto_142483 ?auto_142490 ) ) ( not ( = ?auto_142484 ?auto_142485 ) ) ( not ( = ?auto_142484 ?auto_142486 ) ) ( not ( = ?auto_142484 ?auto_142487 ) ) ( not ( = ?auto_142484 ?auto_142488 ) ) ( not ( = ?auto_142484 ?auto_142490 ) ) ( not ( = ?auto_142485 ?auto_142486 ) ) ( not ( = ?auto_142485 ?auto_142487 ) ) ( not ( = ?auto_142485 ?auto_142488 ) ) ( not ( = ?auto_142485 ?auto_142490 ) ) ( not ( = ?auto_142486 ?auto_142487 ) ) ( not ( = ?auto_142486 ?auto_142488 ) ) ( not ( = ?auto_142486 ?auto_142490 ) ) ( not ( = ?auto_142487 ?auto_142488 ) ) ( not ( = ?auto_142487 ?auto_142490 ) ) ( not ( = ?auto_142488 ?auto_142490 ) ) ( ON ?auto_142490 ?auto_142489 ) ( not ( = ?auto_142482 ?auto_142489 ) ) ( not ( = ?auto_142483 ?auto_142489 ) ) ( not ( = ?auto_142484 ?auto_142489 ) ) ( not ( = ?auto_142485 ?auto_142489 ) ) ( not ( = ?auto_142486 ?auto_142489 ) ) ( not ( = ?auto_142487 ?auto_142489 ) ) ( not ( = ?auto_142488 ?auto_142489 ) ) ( not ( = ?auto_142490 ?auto_142489 ) ) ( ON ?auto_142488 ?auto_142490 ) ( ON-TABLE ?auto_142489 ) ( CLEAR ?auto_142486 ) ( ON ?auto_142487 ?auto_142488 ) ( CLEAR ?auto_142487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_142489 ?auto_142490 ?auto_142488 )
      ( MAKE-7PILE ?auto_142482 ?auto_142483 ?auto_142484 ?auto_142485 ?auto_142486 ?auto_142487 ?auto_142488 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142491 - BLOCK
      ?auto_142492 - BLOCK
      ?auto_142493 - BLOCK
      ?auto_142494 - BLOCK
      ?auto_142495 - BLOCK
      ?auto_142496 - BLOCK
      ?auto_142497 - BLOCK
    )
    :vars
    (
      ?auto_142499 - BLOCK
      ?auto_142498 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142491 ) ( ON ?auto_142492 ?auto_142491 ) ( ON ?auto_142493 ?auto_142492 ) ( ON ?auto_142494 ?auto_142493 ) ( not ( = ?auto_142491 ?auto_142492 ) ) ( not ( = ?auto_142491 ?auto_142493 ) ) ( not ( = ?auto_142491 ?auto_142494 ) ) ( not ( = ?auto_142491 ?auto_142495 ) ) ( not ( = ?auto_142491 ?auto_142496 ) ) ( not ( = ?auto_142491 ?auto_142497 ) ) ( not ( = ?auto_142491 ?auto_142499 ) ) ( not ( = ?auto_142492 ?auto_142493 ) ) ( not ( = ?auto_142492 ?auto_142494 ) ) ( not ( = ?auto_142492 ?auto_142495 ) ) ( not ( = ?auto_142492 ?auto_142496 ) ) ( not ( = ?auto_142492 ?auto_142497 ) ) ( not ( = ?auto_142492 ?auto_142499 ) ) ( not ( = ?auto_142493 ?auto_142494 ) ) ( not ( = ?auto_142493 ?auto_142495 ) ) ( not ( = ?auto_142493 ?auto_142496 ) ) ( not ( = ?auto_142493 ?auto_142497 ) ) ( not ( = ?auto_142493 ?auto_142499 ) ) ( not ( = ?auto_142494 ?auto_142495 ) ) ( not ( = ?auto_142494 ?auto_142496 ) ) ( not ( = ?auto_142494 ?auto_142497 ) ) ( not ( = ?auto_142494 ?auto_142499 ) ) ( not ( = ?auto_142495 ?auto_142496 ) ) ( not ( = ?auto_142495 ?auto_142497 ) ) ( not ( = ?auto_142495 ?auto_142499 ) ) ( not ( = ?auto_142496 ?auto_142497 ) ) ( not ( = ?auto_142496 ?auto_142499 ) ) ( not ( = ?auto_142497 ?auto_142499 ) ) ( ON ?auto_142499 ?auto_142498 ) ( not ( = ?auto_142491 ?auto_142498 ) ) ( not ( = ?auto_142492 ?auto_142498 ) ) ( not ( = ?auto_142493 ?auto_142498 ) ) ( not ( = ?auto_142494 ?auto_142498 ) ) ( not ( = ?auto_142495 ?auto_142498 ) ) ( not ( = ?auto_142496 ?auto_142498 ) ) ( not ( = ?auto_142497 ?auto_142498 ) ) ( not ( = ?auto_142499 ?auto_142498 ) ) ( ON ?auto_142497 ?auto_142499 ) ( ON-TABLE ?auto_142498 ) ( ON ?auto_142496 ?auto_142497 ) ( CLEAR ?auto_142496 ) ( HOLDING ?auto_142495 ) ( CLEAR ?auto_142494 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_142491 ?auto_142492 ?auto_142493 ?auto_142494 ?auto_142495 )
      ( MAKE-7PILE ?auto_142491 ?auto_142492 ?auto_142493 ?auto_142494 ?auto_142495 ?auto_142496 ?auto_142497 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142500 - BLOCK
      ?auto_142501 - BLOCK
      ?auto_142502 - BLOCK
      ?auto_142503 - BLOCK
      ?auto_142504 - BLOCK
      ?auto_142505 - BLOCK
      ?auto_142506 - BLOCK
    )
    :vars
    (
      ?auto_142507 - BLOCK
      ?auto_142508 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142500 ) ( ON ?auto_142501 ?auto_142500 ) ( ON ?auto_142502 ?auto_142501 ) ( ON ?auto_142503 ?auto_142502 ) ( not ( = ?auto_142500 ?auto_142501 ) ) ( not ( = ?auto_142500 ?auto_142502 ) ) ( not ( = ?auto_142500 ?auto_142503 ) ) ( not ( = ?auto_142500 ?auto_142504 ) ) ( not ( = ?auto_142500 ?auto_142505 ) ) ( not ( = ?auto_142500 ?auto_142506 ) ) ( not ( = ?auto_142500 ?auto_142507 ) ) ( not ( = ?auto_142501 ?auto_142502 ) ) ( not ( = ?auto_142501 ?auto_142503 ) ) ( not ( = ?auto_142501 ?auto_142504 ) ) ( not ( = ?auto_142501 ?auto_142505 ) ) ( not ( = ?auto_142501 ?auto_142506 ) ) ( not ( = ?auto_142501 ?auto_142507 ) ) ( not ( = ?auto_142502 ?auto_142503 ) ) ( not ( = ?auto_142502 ?auto_142504 ) ) ( not ( = ?auto_142502 ?auto_142505 ) ) ( not ( = ?auto_142502 ?auto_142506 ) ) ( not ( = ?auto_142502 ?auto_142507 ) ) ( not ( = ?auto_142503 ?auto_142504 ) ) ( not ( = ?auto_142503 ?auto_142505 ) ) ( not ( = ?auto_142503 ?auto_142506 ) ) ( not ( = ?auto_142503 ?auto_142507 ) ) ( not ( = ?auto_142504 ?auto_142505 ) ) ( not ( = ?auto_142504 ?auto_142506 ) ) ( not ( = ?auto_142504 ?auto_142507 ) ) ( not ( = ?auto_142505 ?auto_142506 ) ) ( not ( = ?auto_142505 ?auto_142507 ) ) ( not ( = ?auto_142506 ?auto_142507 ) ) ( ON ?auto_142507 ?auto_142508 ) ( not ( = ?auto_142500 ?auto_142508 ) ) ( not ( = ?auto_142501 ?auto_142508 ) ) ( not ( = ?auto_142502 ?auto_142508 ) ) ( not ( = ?auto_142503 ?auto_142508 ) ) ( not ( = ?auto_142504 ?auto_142508 ) ) ( not ( = ?auto_142505 ?auto_142508 ) ) ( not ( = ?auto_142506 ?auto_142508 ) ) ( not ( = ?auto_142507 ?auto_142508 ) ) ( ON ?auto_142506 ?auto_142507 ) ( ON-TABLE ?auto_142508 ) ( ON ?auto_142505 ?auto_142506 ) ( CLEAR ?auto_142503 ) ( ON ?auto_142504 ?auto_142505 ) ( CLEAR ?auto_142504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_142508 ?auto_142507 ?auto_142506 ?auto_142505 )
      ( MAKE-7PILE ?auto_142500 ?auto_142501 ?auto_142502 ?auto_142503 ?auto_142504 ?auto_142505 ?auto_142506 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142509 - BLOCK
      ?auto_142510 - BLOCK
      ?auto_142511 - BLOCK
      ?auto_142512 - BLOCK
      ?auto_142513 - BLOCK
      ?auto_142514 - BLOCK
      ?auto_142515 - BLOCK
    )
    :vars
    (
      ?auto_142516 - BLOCK
      ?auto_142517 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142509 ) ( ON ?auto_142510 ?auto_142509 ) ( ON ?auto_142511 ?auto_142510 ) ( not ( = ?auto_142509 ?auto_142510 ) ) ( not ( = ?auto_142509 ?auto_142511 ) ) ( not ( = ?auto_142509 ?auto_142512 ) ) ( not ( = ?auto_142509 ?auto_142513 ) ) ( not ( = ?auto_142509 ?auto_142514 ) ) ( not ( = ?auto_142509 ?auto_142515 ) ) ( not ( = ?auto_142509 ?auto_142516 ) ) ( not ( = ?auto_142510 ?auto_142511 ) ) ( not ( = ?auto_142510 ?auto_142512 ) ) ( not ( = ?auto_142510 ?auto_142513 ) ) ( not ( = ?auto_142510 ?auto_142514 ) ) ( not ( = ?auto_142510 ?auto_142515 ) ) ( not ( = ?auto_142510 ?auto_142516 ) ) ( not ( = ?auto_142511 ?auto_142512 ) ) ( not ( = ?auto_142511 ?auto_142513 ) ) ( not ( = ?auto_142511 ?auto_142514 ) ) ( not ( = ?auto_142511 ?auto_142515 ) ) ( not ( = ?auto_142511 ?auto_142516 ) ) ( not ( = ?auto_142512 ?auto_142513 ) ) ( not ( = ?auto_142512 ?auto_142514 ) ) ( not ( = ?auto_142512 ?auto_142515 ) ) ( not ( = ?auto_142512 ?auto_142516 ) ) ( not ( = ?auto_142513 ?auto_142514 ) ) ( not ( = ?auto_142513 ?auto_142515 ) ) ( not ( = ?auto_142513 ?auto_142516 ) ) ( not ( = ?auto_142514 ?auto_142515 ) ) ( not ( = ?auto_142514 ?auto_142516 ) ) ( not ( = ?auto_142515 ?auto_142516 ) ) ( ON ?auto_142516 ?auto_142517 ) ( not ( = ?auto_142509 ?auto_142517 ) ) ( not ( = ?auto_142510 ?auto_142517 ) ) ( not ( = ?auto_142511 ?auto_142517 ) ) ( not ( = ?auto_142512 ?auto_142517 ) ) ( not ( = ?auto_142513 ?auto_142517 ) ) ( not ( = ?auto_142514 ?auto_142517 ) ) ( not ( = ?auto_142515 ?auto_142517 ) ) ( not ( = ?auto_142516 ?auto_142517 ) ) ( ON ?auto_142515 ?auto_142516 ) ( ON-TABLE ?auto_142517 ) ( ON ?auto_142514 ?auto_142515 ) ( ON ?auto_142513 ?auto_142514 ) ( CLEAR ?auto_142513 ) ( HOLDING ?auto_142512 ) ( CLEAR ?auto_142511 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_142509 ?auto_142510 ?auto_142511 ?auto_142512 )
      ( MAKE-7PILE ?auto_142509 ?auto_142510 ?auto_142511 ?auto_142512 ?auto_142513 ?auto_142514 ?auto_142515 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142518 - BLOCK
      ?auto_142519 - BLOCK
      ?auto_142520 - BLOCK
      ?auto_142521 - BLOCK
      ?auto_142522 - BLOCK
      ?auto_142523 - BLOCK
      ?auto_142524 - BLOCK
    )
    :vars
    (
      ?auto_142526 - BLOCK
      ?auto_142525 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142518 ) ( ON ?auto_142519 ?auto_142518 ) ( ON ?auto_142520 ?auto_142519 ) ( not ( = ?auto_142518 ?auto_142519 ) ) ( not ( = ?auto_142518 ?auto_142520 ) ) ( not ( = ?auto_142518 ?auto_142521 ) ) ( not ( = ?auto_142518 ?auto_142522 ) ) ( not ( = ?auto_142518 ?auto_142523 ) ) ( not ( = ?auto_142518 ?auto_142524 ) ) ( not ( = ?auto_142518 ?auto_142526 ) ) ( not ( = ?auto_142519 ?auto_142520 ) ) ( not ( = ?auto_142519 ?auto_142521 ) ) ( not ( = ?auto_142519 ?auto_142522 ) ) ( not ( = ?auto_142519 ?auto_142523 ) ) ( not ( = ?auto_142519 ?auto_142524 ) ) ( not ( = ?auto_142519 ?auto_142526 ) ) ( not ( = ?auto_142520 ?auto_142521 ) ) ( not ( = ?auto_142520 ?auto_142522 ) ) ( not ( = ?auto_142520 ?auto_142523 ) ) ( not ( = ?auto_142520 ?auto_142524 ) ) ( not ( = ?auto_142520 ?auto_142526 ) ) ( not ( = ?auto_142521 ?auto_142522 ) ) ( not ( = ?auto_142521 ?auto_142523 ) ) ( not ( = ?auto_142521 ?auto_142524 ) ) ( not ( = ?auto_142521 ?auto_142526 ) ) ( not ( = ?auto_142522 ?auto_142523 ) ) ( not ( = ?auto_142522 ?auto_142524 ) ) ( not ( = ?auto_142522 ?auto_142526 ) ) ( not ( = ?auto_142523 ?auto_142524 ) ) ( not ( = ?auto_142523 ?auto_142526 ) ) ( not ( = ?auto_142524 ?auto_142526 ) ) ( ON ?auto_142526 ?auto_142525 ) ( not ( = ?auto_142518 ?auto_142525 ) ) ( not ( = ?auto_142519 ?auto_142525 ) ) ( not ( = ?auto_142520 ?auto_142525 ) ) ( not ( = ?auto_142521 ?auto_142525 ) ) ( not ( = ?auto_142522 ?auto_142525 ) ) ( not ( = ?auto_142523 ?auto_142525 ) ) ( not ( = ?auto_142524 ?auto_142525 ) ) ( not ( = ?auto_142526 ?auto_142525 ) ) ( ON ?auto_142524 ?auto_142526 ) ( ON-TABLE ?auto_142525 ) ( ON ?auto_142523 ?auto_142524 ) ( ON ?auto_142522 ?auto_142523 ) ( CLEAR ?auto_142520 ) ( ON ?auto_142521 ?auto_142522 ) ( CLEAR ?auto_142521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_142525 ?auto_142526 ?auto_142524 ?auto_142523 ?auto_142522 )
      ( MAKE-7PILE ?auto_142518 ?auto_142519 ?auto_142520 ?auto_142521 ?auto_142522 ?auto_142523 ?auto_142524 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142527 - BLOCK
      ?auto_142528 - BLOCK
      ?auto_142529 - BLOCK
      ?auto_142530 - BLOCK
      ?auto_142531 - BLOCK
      ?auto_142532 - BLOCK
      ?auto_142533 - BLOCK
    )
    :vars
    (
      ?auto_142534 - BLOCK
      ?auto_142535 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142527 ) ( ON ?auto_142528 ?auto_142527 ) ( not ( = ?auto_142527 ?auto_142528 ) ) ( not ( = ?auto_142527 ?auto_142529 ) ) ( not ( = ?auto_142527 ?auto_142530 ) ) ( not ( = ?auto_142527 ?auto_142531 ) ) ( not ( = ?auto_142527 ?auto_142532 ) ) ( not ( = ?auto_142527 ?auto_142533 ) ) ( not ( = ?auto_142527 ?auto_142534 ) ) ( not ( = ?auto_142528 ?auto_142529 ) ) ( not ( = ?auto_142528 ?auto_142530 ) ) ( not ( = ?auto_142528 ?auto_142531 ) ) ( not ( = ?auto_142528 ?auto_142532 ) ) ( not ( = ?auto_142528 ?auto_142533 ) ) ( not ( = ?auto_142528 ?auto_142534 ) ) ( not ( = ?auto_142529 ?auto_142530 ) ) ( not ( = ?auto_142529 ?auto_142531 ) ) ( not ( = ?auto_142529 ?auto_142532 ) ) ( not ( = ?auto_142529 ?auto_142533 ) ) ( not ( = ?auto_142529 ?auto_142534 ) ) ( not ( = ?auto_142530 ?auto_142531 ) ) ( not ( = ?auto_142530 ?auto_142532 ) ) ( not ( = ?auto_142530 ?auto_142533 ) ) ( not ( = ?auto_142530 ?auto_142534 ) ) ( not ( = ?auto_142531 ?auto_142532 ) ) ( not ( = ?auto_142531 ?auto_142533 ) ) ( not ( = ?auto_142531 ?auto_142534 ) ) ( not ( = ?auto_142532 ?auto_142533 ) ) ( not ( = ?auto_142532 ?auto_142534 ) ) ( not ( = ?auto_142533 ?auto_142534 ) ) ( ON ?auto_142534 ?auto_142535 ) ( not ( = ?auto_142527 ?auto_142535 ) ) ( not ( = ?auto_142528 ?auto_142535 ) ) ( not ( = ?auto_142529 ?auto_142535 ) ) ( not ( = ?auto_142530 ?auto_142535 ) ) ( not ( = ?auto_142531 ?auto_142535 ) ) ( not ( = ?auto_142532 ?auto_142535 ) ) ( not ( = ?auto_142533 ?auto_142535 ) ) ( not ( = ?auto_142534 ?auto_142535 ) ) ( ON ?auto_142533 ?auto_142534 ) ( ON-TABLE ?auto_142535 ) ( ON ?auto_142532 ?auto_142533 ) ( ON ?auto_142531 ?auto_142532 ) ( ON ?auto_142530 ?auto_142531 ) ( CLEAR ?auto_142530 ) ( HOLDING ?auto_142529 ) ( CLEAR ?auto_142528 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_142527 ?auto_142528 ?auto_142529 )
      ( MAKE-7PILE ?auto_142527 ?auto_142528 ?auto_142529 ?auto_142530 ?auto_142531 ?auto_142532 ?auto_142533 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142536 - BLOCK
      ?auto_142537 - BLOCK
      ?auto_142538 - BLOCK
      ?auto_142539 - BLOCK
      ?auto_142540 - BLOCK
      ?auto_142541 - BLOCK
      ?auto_142542 - BLOCK
    )
    :vars
    (
      ?auto_142543 - BLOCK
      ?auto_142544 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142536 ) ( ON ?auto_142537 ?auto_142536 ) ( not ( = ?auto_142536 ?auto_142537 ) ) ( not ( = ?auto_142536 ?auto_142538 ) ) ( not ( = ?auto_142536 ?auto_142539 ) ) ( not ( = ?auto_142536 ?auto_142540 ) ) ( not ( = ?auto_142536 ?auto_142541 ) ) ( not ( = ?auto_142536 ?auto_142542 ) ) ( not ( = ?auto_142536 ?auto_142543 ) ) ( not ( = ?auto_142537 ?auto_142538 ) ) ( not ( = ?auto_142537 ?auto_142539 ) ) ( not ( = ?auto_142537 ?auto_142540 ) ) ( not ( = ?auto_142537 ?auto_142541 ) ) ( not ( = ?auto_142537 ?auto_142542 ) ) ( not ( = ?auto_142537 ?auto_142543 ) ) ( not ( = ?auto_142538 ?auto_142539 ) ) ( not ( = ?auto_142538 ?auto_142540 ) ) ( not ( = ?auto_142538 ?auto_142541 ) ) ( not ( = ?auto_142538 ?auto_142542 ) ) ( not ( = ?auto_142538 ?auto_142543 ) ) ( not ( = ?auto_142539 ?auto_142540 ) ) ( not ( = ?auto_142539 ?auto_142541 ) ) ( not ( = ?auto_142539 ?auto_142542 ) ) ( not ( = ?auto_142539 ?auto_142543 ) ) ( not ( = ?auto_142540 ?auto_142541 ) ) ( not ( = ?auto_142540 ?auto_142542 ) ) ( not ( = ?auto_142540 ?auto_142543 ) ) ( not ( = ?auto_142541 ?auto_142542 ) ) ( not ( = ?auto_142541 ?auto_142543 ) ) ( not ( = ?auto_142542 ?auto_142543 ) ) ( ON ?auto_142543 ?auto_142544 ) ( not ( = ?auto_142536 ?auto_142544 ) ) ( not ( = ?auto_142537 ?auto_142544 ) ) ( not ( = ?auto_142538 ?auto_142544 ) ) ( not ( = ?auto_142539 ?auto_142544 ) ) ( not ( = ?auto_142540 ?auto_142544 ) ) ( not ( = ?auto_142541 ?auto_142544 ) ) ( not ( = ?auto_142542 ?auto_142544 ) ) ( not ( = ?auto_142543 ?auto_142544 ) ) ( ON ?auto_142542 ?auto_142543 ) ( ON-TABLE ?auto_142544 ) ( ON ?auto_142541 ?auto_142542 ) ( ON ?auto_142540 ?auto_142541 ) ( ON ?auto_142539 ?auto_142540 ) ( CLEAR ?auto_142537 ) ( ON ?auto_142538 ?auto_142539 ) ( CLEAR ?auto_142538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_142544 ?auto_142543 ?auto_142542 ?auto_142541 ?auto_142540 ?auto_142539 )
      ( MAKE-7PILE ?auto_142536 ?auto_142537 ?auto_142538 ?auto_142539 ?auto_142540 ?auto_142541 ?auto_142542 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142545 - BLOCK
      ?auto_142546 - BLOCK
      ?auto_142547 - BLOCK
      ?auto_142548 - BLOCK
      ?auto_142549 - BLOCK
      ?auto_142550 - BLOCK
      ?auto_142551 - BLOCK
    )
    :vars
    (
      ?auto_142552 - BLOCK
      ?auto_142553 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142545 ) ( not ( = ?auto_142545 ?auto_142546 ) ) ( not ( = ?auto_142545 ?auto_142547 ) ) ( not ( = ?auto_142545 ?auto_142548 ) ) ( not ( = ?auto_142545 ?auto_142549 ) ) ( not ( = ?auto_142545 ?auto_142550 ) ) ( not ( = ?auto_142545 ?auto_142551 ) ) ( not ( = ?auto_142545 ?auto_142552 ) ) ( not ( = ?auto_142546 ?auto_142547 ) ) ( not ( = ?auto_142546 ?auto_142548 ) ) ( not ( = ?auto_142546 ?auto_142549 ) ) ( not ( = ?auto_142546 ?auto_142550 ) ) ( not ( = ?auto_142546 ?auto_142551 ) ) ( not ( = ?auto_142546 ?auto_142552 ) ) ( not ( = ?auto_142547 ?auto_142548 ) ) ( not ( = ?auto_142547 ?auto_142549 ) ) ( not ( = ?auto_142547 ?auto_142550 ) ) ( not ( = ?auto_142547 ?auto_142551 ) ) ( not ( = ?auto_142547 ?auto_142552 ) ) ( not ( = ?auto_142548 ?auto_142549 ) ) ( not ( = ?auto_142548 ?auto_142550 ) ) ( not ( = ?auto_142548 ?auto_142551 ) ) ( not ( = ?auto_142548 ?auto_142552 ) ) ( not ( = ?auto_142549 ?auto_142550 ) ) ( not ( = ?auto_142549 ?auto_142551 ) ) ( not ( = ?auto_142549 ?auto_142552 ) ) ( not ( = ?auto_142550 ?auto_142551 ) ) ( not ( = ?auto_142550 ?auto_142552 ) ) ( not ( = ?auto_142551 ?auto_142552 ) ) ( ON ?auto_142552 ?auto_142553 ) ( not ( = ?auto_142545 ?auto_142553 ) ) ( not ( = ?auto_142546 ?auto_142553 ) ) ( not ( = ?auto_142547 ?auto_142553 ) ) ( not ( = ?auto_142548 ?auto_142553 ) ) ( not ( = ?auto_142549 ?auto_142553 ) ) ( not ( = ?auto_142550 ?auto_142553 ) ) ( not ( = ?auto_142551 ?auto_142553 ) ) ( not ( = ?auto_142552 ?auto_142553 ) ) ( ON ?auto_142551 ?auto_142552 ) ( ON-TABLE ?auto_142553 ) ( ON ?auto_142550 ?auto_142551 ) ( ON ?auto_142549 ?auto_142550 ) ( ON ?auto_142548 ?auto_142549 ) ( ON ?auto_142547 ?auto_142548 ) ( CLEAR ?auto_142547 ) ( HOLDING ?auto_142546 ) ( CLEAR ?auto_142545 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_142545 ?auto_142546 )
      ( MAKE-7PILE ?auto_142545 ?auto_142546 ?auto_142547 ?auto_142548 ?auto_142549 ?auto_142550 ?auto_142551 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142554 - BLOCK
      ?auto_142555 - BLOCK
      ?auto_142556 - BLOCK
      ?auto_142557 - BLOCK
      ?auto_142558 - BLOCK
      ?auto_142559 - BLOCK
      ?auto_142560 - BLOCK
    )
    :vars
    (
      ?auto_142562 - BLOCK
      ?auto_142561 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142554 ) ( not ( = ?auto_142554 ?auto_142555 ) ) ( not ( = ?auto_142554 ?auto_142556 ) ) ( not ( = ?auto_142554 ?auto_142557 ) ) ( not ( = ?auto_142554 ?auto_142558 ) ) ( not ( = ?auto_142554 ?auto_142559 ) ) ( not ( = ?auto_142554 ?auto_142560 ) ) ( not ( = ?auto_142554 ?auto_142562 ) ) ( not ( = ?auto_142555 ?auto_142556 ) ) ( not ( = ?auto_142555 ?auto_142557 ) ) ( not ( = ?auto_142555 ?auto_142558 ) ) ( not ( = ?auto_142555 ?auto_142559 ) ) ( not ( = ?auto_142555 ?auto_142560 ) ) ( not ( = ?auto_142555 ?auto_142562 ) ) ( not ( = ?auto_142556 ?auto_142557 ) ) ( not ( = ?auto_142556 ?auto_142558 ) ) ( not ( = ?auto_142556 ?auto_142559 ) ) ( not ( = ?auto_142556 ?auto_142560 ) ) ( not ( = ?auto_142556 ?auto_142562 ) ) ( not ( = ?auto_142557 ?auto_142558 ) ) ( not ( = ?auto_142557 ?auto_142559 ) ) ( not ( = ?auto_142557 ?auto_142560 ) ) ( not ( = ?auto_142557 ?auto_142562 ) ) ( not ( = ?auto_142558 ?auto_142559 ) ) ( not ( = ?auto_142558 ?auto_142560 ) ) ( not ( = ?auto_142558 ?auto_142562 ) ) ( not ( = ?auto_142559 ?auto_142560 ) ) ( not ( = ?auto_142559 ?auto_142562 ) ) ( not ( = ?auto_142560 ?auto_142562 ) ) ( ON ?auto_142562 ?auto_142561 ) ( not ( = ?auto_142554 ?auto_142561 ) ) ( not ( = ?auto_142555 ?auto_142561 ) ) ( not ( = ?auto_142556 ?auto_142561 ) ) ( not ( = ?auto_142557 ?auto_142561 ) ) ( not ( = ?auto_142558 ?auto_142561 ) ) ( not ( = ?auto_142559 ?auto_142561 ) ) ( not ( = ?auto_142560 ?auto_142561 ) ) ( not ( = ?auto_142562 ?auto_142561 ) ) ( ON ?auto_142560 ?auto_142562 ) ( ON-TABLE ?auto_142561 ) ( ON ?auto_142559 ?auto_142560 ) ( ON ?auto_142558 ?auto_142559 ) ( ON ?auto_142557 ?auto_142558 ) ( ON ?auto_142556 ?auto_142557 ) ( CLEAR ?auto_142554 ) ( ON ?auto_142555 ?auto_142556 ) ( CLEAR ?auto_142555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_142561 ?auto_142562 ?auto_142560 ?auto_142559 ?auto_142558 ?auto_142557 ?auto_142556 )
      ( MAKE-7PILE ?auto_142554 ?auto_142555 ?auto_142556 ?auto_142557 ?auto_142558 ?auto_142559 ?auto_142560 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142563 - BLOCK
      ?auto_142564 - BLOCK
      ?auto_142565 - BLOCK
      ?auto_142566 - BLOCK
      ?auto_142567 - BLOCK
      ?auto_142568 - BLOCK
      ?auto_142569 - BLOCK
    )
    :vars
    (
      ?auto_142571 - BLOCK
      ?auto_142570 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142563 ?auto_142564 ) ) ( not ( = ?auto_142563 ?auto_142565 ) ) ( not ( = ?auto_142563 ?auto_142566 ) ) ( not ( = ?auto_142563 ?auto_142567 ) ) ( not ( = ?auto_142563 ?auto_142568 ) ) ( not ( = ?auto_142563 ?auto_142569 ) ) ( not ( = ?auto_142563 ?auto_142571 ) ) ( not ( = ?auto_142564 ?auto_142565 ) ) ( not ( = ?auto_142564 ?auto_142566 ) ) ( not ( = ?auto_142564 ?auto_142567 ) ) ( not ( = ?auto_142564 ?auto_142568 ) ) ( not ( = ?auto_142564 ?auto_142569 ) ) ( not ( = ?auto_142564 ?auto_142571 ) ) ( not ( = ?auto_142565 ?auto_142566 ) ) ( not ( = ?auto_142565 ?auto_142567 ) ) ( not ( = ?auto_142565 ?auto_142568 ) ) ( not ( = ?auto_142565 ?auto_142569 ) ) ( not ( = ?auto_142565 ?auto_142571 ) ) ( not ( = ?auto_142566 ?auto_142567 ) ) ( not ( = ?auto_142566 ?auto_142568 ) ) ( not ( = ?auto_142566 ?auto_142569 ) ) ( not ( = ?auto_142566 ?auto_142571 ) ) ( not ( = ?auto_142567 ?auto_142568 ) ) ( not ( = ?auto_142567 ?auto_142569 ) ) ( not ( = ?auto_142567 ?auto_142571 ) ) ( not ( = ?auto_142568 ?auto_142569 ) ) ( not ( = ?auto_142568 ?auto_142571 ) ) ( not ( = ?auto_142569 ?auto_142571 ) ) ( ON ?auto_142571 ?auto_142570 ) ( not ( = ?auto_142563 ?auto_142570 ) ) ( not ( = ?auto_142564 ?auto_142570 ) ) ( not ( = ?auto_142565 ?auto_142570 ) ) ( not ( = ?auto_142566 ?auto_142570 ) ) ( not ( = ?auto_142567 ?auto_142570 ) ) ( not ( = ?auto_142568 ?auto_142570 ) ) ( not ( = ?auto_142569 ?auto_142570 ) ) ( not ( = ?auto_142571 ?auto_142570 ) ) ( ON ?auto_142569 ?auto_142571 ) ( ON-TABLE ?auto_142570 ) ( ON ?auto_142568 ?auto_142569 ) ( ON ?auto_142567 ?auto_142568 ) ( ON ?auto_142566 ?auto_142567 ) ( ON ?auto_142565 ?auto_142566 ) ( ON ?auto_142564 ?auto_142565 ) ( CLEAR ?auto_142564 ) ( HOLDING ?auto_142563 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_142563 )
      ( MAKE-7PILE ?auto_142563 ?auto_142564 ?auto_142565 ?auto_142566 ?auto_142567 ?auto_142568 ?auto_142569 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142572 - BLOCK
      ?auto_142573 - BLOCK
      ?auto_142574 - BLOCK
      ?auto_142575 - BLOCK
      ?auto_142576 - BLOCK
      ?auto_142577 - BLOCK
      ?auto_142578 - BLOCK
    )
    :vars
    (
      ?auto_142579 - BLOCK
      ?auto_142580 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142572 ?auto_142573 ) ) ( not ( = ?auto_142572 ?auto_142574 ) ) ( not ( = ?auto_142572 ?auto_142575 ) ) ( not ( = ?auto_142572 ?auto_142576 ) ) ( not ( = ?auto_142572 ?auto_142577 ) ) ( not ( = ?auto_142572 ?auto_142578 ) ) ( not ( = ?auto_142572 ?auto_142579 ) ) ( not ( = ?auto_142573 ?auto_142574 ) ) ( not ( = ?auto_142573 ?auto_142575 ) ) ( not ( = ?auto_142573 ?auto_142576 ) ) ( not ( = ?auto_142573 ?auto_142577 ) ) ( not ( = ?auto_142573 ?auto_142578 ) ) ( not ( = ?auto_142573 ?auto_142579 ) ) ( not ( = ?auto_142574 ?auto_142575 ) ) ( not ( = ?auto_142574 ?auto_142576 ) ) ( not ( = ?auto_142574 ?auto_142577 ) ) ( not ( = ?auto_142574 ?auto_142578 ) ) ( not ( = ?auto_142574 ?auto_142579 ) ) ( not ( = ?auto_142575 ?auto_142576 ) ) ( not ( = ?auto_142575 ?auto_142577 ) ) ( not ( = ?auto_142575 ?auto_142578 ) ) ( not ( = ?auto_142575 ?auto_142579 ) ) ( not ( = ?auto_142576 ?auto_142577 ) ) ( not ( = ?auto_142576 ?auto_142578 ) ) ( not ( = ?auto_142576 ?auto_142579 ) ) ( not ( = ?auto_142577 ?auto_142578 ) ) ( not ( = ?auto_142577 ?auto_142579 ) ) ( not ( = ?auto_142578 ?auto_142579 ) ) ( ON ?auto_142579 ?auto_142580 ) ( not ( = ?auto_142572 ?auto_142580 ) ) ( not ( = ?auto_142573 ?auto_142580 ) ) ( not ( = ?auto_142574 ?auto_142580 ) ) ( not ( = ?auto_142575 ?auto_142580 ) ) ( not ( = ?auto_142576 ?auto_142580 ) ) ( not ( = ?auto_142577 ?auto_142580 ) ) ( not ( = ?auto_142578 ?auto_142580 ) ) ( not ( = ?auto_142579 ?auto_142580 ) ) ( ON ?auto_142578 ?auto_142579 ) ( ON-TABLE ?auto_142580 ) ( ON ?auto_142577 ?auto_142578 ) ( ON ?auto_142576 ?auto_142577 ) ( ON ?auto_142575 ?auto_142576 ) ( ON ?auto_142574 ?auto_142575 ) ( ON ?auto_142573 ?auto_142574 ) ( ON ?auto_142572 ?auto_142573 ) ( CLEAR ?auto_142572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_142580 ?auto_142579 ?auto_142578 ?auto_142577 ?auto_142576 ?auto_142575 ?auto_142574 ?auto_142573 )
      ( MAKE-7PILE ?auto_142572 ?auto_142573 ?auto_142574 ?auto_142575 ?auto_142576 ?auto_142577 ?auto_142578 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142582 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_142582 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_142582 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142583 - BLOCK
    )
    :vars
    (
      ?auto_142584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142583 ?auto_142584 ) ( CLEAR ?auto_142583 ) ( HAND-EMPTY ) ( not ( = ?auto_142583 ?auto_142584 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_142583 ?auto_142584 )
      ( MAKE-1PILE ?auto_142583 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142585 - BLOCK
    )
    :vars
    (
      ?auto_142586 - BLOCK
      ?auto_142590 - BLOCK
      ?auto_142587 - BLOCK
      ?auto_142592 - BLOCK
      ?auto_142591 - BLOCK
      ?auto_142588 - BLOCK
      ?auto_142589 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142585 ?auto_142586 ) ) ( HOLDING ?auto_142585 ) ( CLEAR ?auto_142586 ) ( ON-TABLE ?auto_142590 ) ( ON ?auto_142587 ?auto_142590 ) ( ON ?auto_142592 ?auto_142587 ) ( ON ?auto_142591 ?auto_142592 ) ( ON ?auto_142588 ?auto_142591 ) ( ON ?auto_142589 ?auto_142588 ) ( ON ?auto_142586 ?auto_142589 ) ( not ( = ?auto_142590 ?auto_142587 ) ) ( not ( = ?auto_142590 ?auto_142592 ) ) ( not ( = ?auto_142590 ?auto_142591 ) ) ( not ( = ?auto_142590 ?auto_142588 ) ) ( not ( = ?auto_142590 ?auto_142589 ) ) ( not ( = ?auto_142590 ?auto_142586 ) ) ( not ( = ?auto_142590 ?auto_142585 ) ) ( not ( = ?auto_142587 ?auto_142592 ) ) ( not ( = ?auto_142587 ?auto_142591 ) ) ( not ( = ?auto_142587 ?auto_142588 ) ) ( not ( = ?auto_142587 ?auto_142589 ) ) ( not ( = ?auto_142587 ?auto_142586 ) ) ( not ( = ?auto_142587 ?auto_142585 ) ) ( not ( = ?auto_142592 ?auto_142591 ) ) ( not ( = ?auto_142592 ?auto_142588 ) ) ( not ( = ?auto_142592 ?auto_142589 ) ) ( not ( = ?auto_142592 ?auto_142586 ) ) ( not ( = ?auto_142592 ?auto_142585 ) ) ( not ( = ?auto_142591 ?auto_142588 ) ) ( not ( = ?auto_142591 ?auto_142589 ) ) ( not ( = ?auto_142591 ?auto_142586 ) ) ( not ( = ?auto_142591 ?auto_142585 ) ) ( not ( = ?auto_142588 ?auto_142589 ) ) ( not ( = ?auto_142588 ?auto_142586 ) ) ( not ( = ?auto_142588 ?auto_142585 ) ) ( not ( = ?auto_142589 ?auto_142586 ) ) ( not ( = ?auto_142589 ?auto_142585 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_142590 ?auto_142587 ?auto_142592 ?auto_142591 ?auto_142588 ?auto_142589 ?auto_142586 ?auto_142585 )
      ( MAKE-1PILE ?auto_142585 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142593 - BLOCK
    )
    :vars
    (
      ?auto_142594 - BLOCK
      ?auto_142597 - BLOCK
      ?auto_142595 - BLOCK
      ?auto_142599 - BLOCK
      ?auto_142600 - BLOCK
      ?auto_142598 - BLOCK
      ?auto_142596 - BLOCK
      ?auto_142601 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142593 ?auto_142594 ) ) ( CLEAR ?auto_142594 ) ( ON-TABLE ?auto_142597 ) ( ON ?auto_142595 ?auto_142597 ) ( ON ?auto_142599 ?auto_142595 ) ( ON ?auto_142600 ?auto_142599 ) ( ON ?auto_142598 ?auto_142600 ) ( ON ?auto_142596 ?auto_142598 ) ( ON ?auto_142594 ?auto_142596 ) ( not ( = ?auto_142597 ?auto_142595 ) ) ( not ( = ?auto_142597 ?auto_142599 ) ) ( not ( = ?auto_142597 ?auto_142600 ) ) ( not ( = ?auto_142597 ?auto_142598 ) ) ( not ( = ?auto_142597 ?auto_142596 ) ) ( not ( = ?auto_142597 ?auto_142594 ) ) ( not ( = ?auto_142597 ?auto_142593 ) ) ( not ( = ?auto_142595 ?auto_142599 ) ) ( not ( = ?auto_142595 ?auto_142600 ) ) ( not ( = ?auto_142595 ?auto_142598 ) ) ( not ( = ?auto_142595 ?auto_142596 ) ) ( not ( = ?auto_142595 ?auto_142594 ) ) ( not ( = ?auto_142595 ?auto_142593 ) ) ( not ( = ?auto_142599 ?auto_142600 ) ) ( not ( = ?auto_142599 ?auto_142598 ) ) ( not ( = ?auto_142599 ?auto_142596 ) ) ( not ( = ?auto_142599 ?auto_142594 ) ) ( not ( = ?auto_142599 ?auto_142593 ) ) ( not ( = ?auto_142600 ?auto_142598 ) ) ( not ( = ?auto_142600 ?auto_142596 ) ) ( not ( = ?auto_142600 ?auto_142594 ) ) ( not ( = ?auto_142600 ?auto_142593 ) ) ( not ( = ?auto_142598 ?auto_142596 ) ) ( not ( = ?auto_142598 ?auto_142594 ) ) ( not ( = ?auto_142598 ?auto_142593 ) ) ( not ( = ?auto_142596 ?auto_142594 ) ) ( not ( = ?auto_142596 ?auto_142593 ) ) ( ON ?auto_142593 ?auto_142601 ) ( CLEAR ?auto_142593 ) ( HAND-EMPTY ) ( not ( = ?auto_142593 ?auto_142601 ) ) ( not ( = ?auto_142594 ?auto_142601 ) ) ( not ( = ?auto_142597 ?auto_142601 ) ) ( not ( = ?auto_142595 ?auto_142601 ) ) ( not ( = ?auto_142599 ?auto_142601 ) ) ( not ( = ?auto_142600 ?auto_142601 ) ) ( not ( = ?auto_142598 ?auto_142601 ) ) ( not ( = ?auto_142596 ?auto_142601 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_142593 ?auto_142601 )
      ( MAKE-1PILE ?auto_142593 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142602 - BLOCK
    )
    :vars
    (
      ?auto_142604 - BLOCK
      ?auto_142608 - BLOCK
      ?auto_142606 - BLOCK
      ?auto_142610 - BLOCK
      ?auto_142605 - BLOCK
      ?auto_142603 - BLOCK
      ?auto_142607 - BLOCK
      ?auto_142609 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142602 ?auto_142604 ) ) ( ON-TABLE ?auto_142608 ) ( ON ?auto_142606 ?auto_142608 ) ( ON ?auto_142610 ?auto_142606 ) ( ON ?auto_142605 ?auto_142610 ) ( ON ?auto_142603 ?auto_142605 ) ( ON ?auto_142607 ?auto_142603 ) ( not ( = ?auto_142608 ?auto_142606 ) ) ( not ( = ?auto_142608 ?auto_142610 ) ) ( not ( = ?auto_142608 ?auto_142605 ) ) ( not ( = ?auto_142608 ?auto_142603 ) ) ( not ( = ?auto_142608 ?auto_142607 ) ) ( not ( = ?auto_142608 ?auto_142604 ) ) ( not ( = ?auto_142608 ?auto_142602 ) ) ( not ( = ?auto_142606 ?auto_142610 ) ) ( not ( = ?auto_142606 ?auto_142605 ) ) ( not ( = ?auto_142606 ?auto_142603 ) ) ( not ( = ?auto_142606 ?auto_142607 ) ) ( not ( = ?auto_142606 ?auto_142604 ) ) ( not ( = ?auto_142606 ?auto_142602 ) ) ( not ( = ?auto_142610 ?auto_142605 ) ) ( not ( = ?auto_142610 ?auto_142603 ) ) ( not ( = ?auto_142610 ?auto_142607 ) ) ( not ( = ?auto_142610 ?auto_142604 ) ) ( not ( = ?auto_142610 ?auto_142602 ) ) ( not ( = ?auto_142605 ?auto_142603 ) ) ( not ( = ?auto_142605 ?auto_142607 ) ) ( not ( = ?auto_142605 ?auto_142604 ) ) ( not ( = ?auto_142605 ?auto_142602 ) ) ( not ( = ?auto_142603 ?auto_142607 ) ) ( not ( = ?auto_142603 ?auto_142604 ) ) ( not ( = ?auto_142603 ?auto_142602 ) ) ( not ( = ?auto_142607 ?auto_142604 ) ) ( not ( = ?auto_142607 ?auto_142602 ) ) ( ON ?auto_142602 ?auto_142609 ) ( CLEAR ?auto_142602 ) ( not ( = ?auto_142602 ?auto_142609 ) ) ( not ( = ?auto_142604 ?auto_142609 ) ) ( not ( = ?auto_142608 ?auto_142609 ) ) ( not ( = ?auto_142606 ?auto_142609 ) ) ( not ( = ?auto_142610 ?auto_142609 ) ) ( not ( = ?auto_142605 ?auto_142609 ) ) ( not ( = ?auto_142603 ?auto_142609 ) ) ( not ( = ?auto_142607 ?auto_142609 ) ) ( HOLDING ?auto_142604 ) ( CLEAR ?auto_142607 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_142608 ?auto_142606 ?auto_142610 ?auto_142605 ?auto_142603 ?auto_142607 ?auto_142604 )
      ( MAKE-1PILE ?auto_142602 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142611 - BLOCK
    )
    :vars
    (
      ?auto_142614 - BLOCK
      ?auto_142616 - BLOCK
      ?auto_142617 - BLOCK
      ?auto_142619 - BLOCK
      ?auto_142618 - BLOCK
      ?auto_142613 - BLOCK
      ?auto_142615 - BLOCK
      ?auto_142612 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142611 ?auto_142614 ) ) ( ON-TABLE ?auto_142616 ) ( ON ?auto_142617 ?auto_142616 ) ( ON ?auto_142619 ?auto_142617 ) ( ON ?auto_142618 ?auto_142619 ) ( ON ?auto_142613 ?auto_142618 ) ( ON ?auto_142615 ?auto_142613 ) ( not ( = ?auto_142616 ?auto_142617 ) ) ( not ( = ?auto_142616 ?auto_142619 ) ) ( not ( = ?auto_142616 ?auto_142618 ) ) ( not ( = ?auto_142616 ?auto_142613 ) ) ( not ( = ?auto_142616 ?auto_142615 ) ) ( not ( = ?auto_142616 ?auto_142614 ) ) ( not ( = ?auto_142616 ?auto_142611 ) ) ( not ( = ?auto_142617 ?auto_142619 ) ) ( not ( = ?auto_142617 ?auto_142618 ) ) ( not ( = ?auto_142617 ?auto_142613 ) ) ( not ( = ?auto_142617 ?auto_142615 ) ) ( not ( = ?auto_142617 ?auto_142614 ) ) ( not ( = ?auto_142617 ?auto_142611 ) ) ( not ( = ?auto_142619 ?auto_142618 ) ) ( not ( = ?auto_142619 ?auto_142613 ) ) ( not ( = ?auto_142619 ?auto_142615 ) ) ( not ( = ?auto_142619 ?auto_142614 ) ) ( not ( = ?auto_142619 ?auto_142611 ) ) ( not ( = ?auto_142618 ?auto_142613 ) ) ( not ( = ?auto_142618 ?auto_142615 ) ) ( not ( = ?auto_142618 ?auto_142614 ) ) ( not ( = ?auto_142618 ?auto_142611 ) ) ( not ( = ?auto_142613 ?auto_142615 ) ) ( not ( = ?auto_142613 ?auto_142614 ) ) ( not ( = ?auto_142613 ?auto_142611 ) ) ( not ( = ?auto_142615 ?auto_142614 ) ) ( not ( = ?auto_142615 ?auto_142611 ) ) ( ON ?auto_142611 ?auto_142612 ) ( not ( = ?auto_142611 ?auto_142612 ) ) ( not ( = ?auto_142614 ?auto_142612 ) ) ( not ( = ?auto_142616 ?auto_142612 ) ) ( not ( = ?auto_142617 ?auto_142612 ) ) ( not ( = ?auto_142619 ?auto_142612 ) ) ( not ( = ?auto_142618 ?auto_142612 ) ) ( not ( = ?auto_142613 ?auto_142612 ) ) ( not ( = ?auto_142615 ?auto_142612 ) ) ( CLEAR ?auto_142615 ) ( ON ?auto_142614 ?auto_142611 ) ( CLEAR ?auto_142614 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_142612 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_142612 ?auto_142611 )
      ( MAKE-1PILE ?auto_142611 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142620 - BLOCK
    )
    :vars
    (
      ?auto_142626 - BLOCK
      ?auto_142623 - BLOCK
      ?auto_142622 - BLOCK
      ?auto_142627 - BLOCK
      ?auto_142624 - BLOCK
      ?auto_142625 - BLOCK
      ?auto_142621 - BLOCK
      ?auto_142628 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142620 ?auto_142626 ) ) ( ON-TABLE ?auto_142623 ) ( ON ?auto_142622 ?auto_142623 ) ( ON ?auto_142627 ?auto_142622 ) ( ON ?auto_142624 ?auto_142627 ) ( ON ?auto_142625 ?auto_142624 ) ( not ( = ?auto_142623 ?auto_142622 ) ) ( not ( = ?auto_142623 ?auto_142627 ) ) ( not ( = ?auto_142623 ?auto_142624 ) ) ( not ( = ?auto_142623 ?auto_142625 ) ) ( not ( = ?auto_142623 ?auto_142621 ) ) ( not ( = ?auto_142623 ?auto_142626 ) ) ( not ( = ?auto_142623 ?auto_142620 ) ) ( not ( = ?auto_142622 ?auto_142627 ) ) ( not ( = ?auto_142622 ?auto_142624 ) ) ( not ( = ?auto_142622 ?auto_142625 ) ) ( not ( = ?auto_142622 ?auto_142621 ) ) ( not ( = ?auto_142622 ?auto_142626 ) ) ( not ( = ?auto_142622 ?auto_142620 ) ) ( not ( = ?auto_142627 ?auto_142624 ) ) ( not ( = ?auto_142627 ?auto_142625 ) ) ( not ( = ?auto_142627 ?auto_142621 ) ) ( not ( = ?auto_142627 ?auto_142626 ) ) ( not ( = ?auto_142627 ?auto_142620 ) ) ( not ( = ?auto_142624 ?auto_142625 ) ) ( not ( = ?auto_142624 ?auto_142621 ) ) ( not ( = ?auto_142624 ?auto_142626 ) ) ( not ( = ?auto_142624 ?auto_142620 ) ) ( not ( = ?auto_142625 ?auto_142621 ) ) ( not ( = ?auto_142625 ?auto_142626 ) ) ( not ( = ?auto_142625 ?auto_142620 ) ) ( not ( = ?auto_142621 ?auto_142626 ) ) ( not ( = ?auto_142621 ?auto_142620 ) ) ( ON ?auto_142620 ?auto_142628 ) ( not ( = ?auto_142620 ?auto_142628 ) ) ( not ( = ?auto_142626 ?auto_142628 ) ) ( not ( = ?auto_142623 ?auto_142628 ) ) ( not ( = ?auto_142622 ?auto_142628 ) ) ( not ( = ?auto_142627 ?auto_142628 ) ) ( not ( = ?auto_142624 ?auto_142628 ) ) ( not ( = ?auto_142625 ?auto_142628 ) ) ( not ( = ?auto_142621 ?auto_142628 ) ) ( ON ?auto_142626 ?auto_142620 ) ( CLEAR ?auto_142626 ) ( ON-TABLE ?auto_142628 ) ( HOLDING ?auto_142621 ) ( CLEAR ?auto_142625 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_142623 ?auto_142622 ?auto_142627 ?auto_142624 ?auto_142625 ?auto_142621 )
      ( MAKE-1PILE ?auto_142620 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142629 - BLOCK
    )
    :vars
    (
      ?auto_142634 - BLOCK
      ?auto_142635 - BLOCK
      ?auto_142633 - BLOCK
      ?auto_142636 - BLOCK
      ?auto_142631 - BLOCK
      ?auto_142630 - BLOCK
      ?auto_142637 - BLOCK
      ?auto_142632 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142629 ?auto_142634 ) ) ( ON-TABLE ?auto_142635 ) ( ON ?auto_142633 ?auto_142635 ) ( ON ?auto_142636 ?auto_142633 ) ( ON ?auto_142631 ?auto_142636 ) ( ON ?auto_142630 ?auto_142631 ) ( not ( = ?auto_142635 ?auto_142633 ) ) ( not ( = ?auto_142635 ?auto_142636 ) ) ( not ( = ?auto_142635 ?auto_142631 ) ) ( not ( = ?auto_142635 ?auto_142630 ) ) ( not ( = ?auto_142635 ?auto_142637 ) ) ( not ( = ?auto_142635 ?auto_142634 ) ) ( not ( = ?auto_142635 ?auto_142629 ) ) ( not ( = ?auto_142633 ?auto_142636 ) ) ( not ( = ?auto_142633 ?auto_142631 ) ) ( not ( = ?auto_142633 ?auto_142630 ) ) ( not ( = ?auto_142633 ?auto_142637 ) ) ( not ( = ?auto_142633 ?auto_142634 ) ) ( not ( = ?auto_142633 ?auto_142629 ) ) ( not ( = ?auto_142636 ?auto_142631 ) ) ( not ( = ?auto_142636 ?auto_142630 ) ) ( not ( = ?auto_142636 ?auto_142637 ) ) ( not ( = ?auto_142636 ?auto_142634 ) ) ( not ( = ?auto_142636 ?auto_142629 ) ) ( not ( = ?auto_142631 ?auto_142630 ) ) ( not ( = ?auto_142631 ?auto_142637 ) ) ( not ( = ?auto_142631 ?auto_142634 ) ) ( not ( = ?auto_142631 ?auto_142629 ) ) ( not ( = ?auto_142630 ?auto_142637 ) ) ( not ( = ?auto_142630 ?auto_142634 ) ) ( not ( = ?auto_142630 ?auto_142629 ) ) ( not ( = ?auto_142637 ?auto_142634 ) ) ( not ( = ?auto_142637 ?auto_142629 ) ) ( ON ?auto_142629 ?auto_142632 ) ( not ( = ?auto_142629 ?auto_142632 ) ) ( not ( = ?auto_142634 ?auto_142632 ) ) ( not ( = ?auto_142635 ?auto_142632 ) ) ( not ( = ?auto_142633 ?auto_142632 ) ) ( not ( = ?auto_142636 ?auto_142632 ) ) ( not ( = ?auto_142631 ?auto_142632 ) ) ( not ( = ?auto_142630 ?auto_142632 ) ) ( not ( = ?auto_142637 ?auto_142632 ) ) ( ON ?auto_142634 ?auto_142629 ) ( ON-TABLE ?auto_142632 ) ( CLEAR ?auto_142630 ) ( ON ?auto_142637 ?auto_142634 ) ( CLEAR ?auto_142637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_142632 ?auto_142629 ?auto_142634 )
      ( MAKE-1PILE ?auto_142629 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142638 - BLOCK
    )
    :vars
    (
      ?auto_142641 - BLOCK
      ?auto_142639 - BLOCK
      ?auto_142643 - BLOCK
      ?auto_142642 - BLOCK
      ?auto_142645 - BLOCK
      ?auto_142644 - BLOCK
      ?auto_142640 - BLOCK
      ?auto_142646 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142638 ?auto_142641 ) ) ( ON-TABLE ?auto_142639 ) ( ON ?auto_142643 ?auto_142639 ) ( ON ?auto_142642 ?auto_142643 ) ( ON ?auto_142645 ?auto_142642 ) ( not ( = ?auto_142639 ?auto_142643 ) ) ( not ( = ?auto_142639 ?auto_142642 ) ) ( not ( = ?auto_142639 ?auto_142645 ) ) ( not ( = ?auto_142639 ?auto_142644 ) ) ( not ( = ?auto_142639 ?auto_142640 ) ) ( not ( = ?auto_142639 ?auto_142641 ) ) ( not ( = ?auto_142639 ?auto_142638 ) ) ( not ( = ?auto_142643 ?auto_142642 ) ) ( not ( = ?auto_142643 ?auto_142645 ) ) ( not ( = ?auto_142643 ?auto_142644 ) ) ( not ( = ?auto_142643 ?auto_142640 ) ) ( not ( = ?auto_142643 ?auto_142641 ) ) ( not ( = ?auto_142643 ?auto_142638 ) ) ( not ( = ?auto_142642 ?auto_142645 ) ) ( not ( = ?auto_142642 ?auto_142644 ) ) ( not ( = ?auto_142642 ?auto_142640 ) ) ( not ( = ?auto_142642 ?auto_142641 ) ) ( not ( = ?auto_142642 ?auto_142638 ) ) ( not ( = ?auto_142645 ?auto_142644 ) ) ( not ( = ?auto_142645 ?auto_142640 ) ) ( not ( = ?auto_142645 ?auto_142641 ) ) ( not ( = ?auto_142645 ?auto_142638 ) ) ( not ( = ?auto_142644 ?auto_142640 ) ) ( not ( = ?auto_142644 ?auto_142641 ) ) ( not ( = ?auto_142644 ?auto_142638 ) ) ( not ( = ?auto_142640 ?auto_142641 ) ) ( not ( = ?auto_142640 ?auto_142638 ) ) ( ON ?auto_142638 ?auto_142646 ) ( not ( = ?auto_142638 ?auto_142646 ) ) ( not ( = ?auto_142641 ?auto_142646 ) ) ( not ( = ?auto_142639 ?auto_142646 ) ) ( not ( = ?auto_142643 ?auto_142646 ) ) ( not ( = ?auto_142642 ?auto_142646 ) ) ( not ( = ?auto_142645 ?auto_142646 ) ) ( not ( = ?auto_142644 ?auto_142646 ) ) ( not ( = ?auto_142640 ?auto_142646 ) ) ( ON ?auto_142641 ?auto_142638 ) ( ON-TABLE ?auto_142646 ) ( ON ?auto_142640 ?auto_142641 ) ( CLEAR ?auto_142640 ) ( HOLDING ?auto_142644 ) ( CLEAR ?auto_142645 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_142639 ?auto_142643 ?auto_142642 ?auto_142645 ?auto_142644 )
      ( MAKE-1PILE ?auto_142638 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142647 - BLOCK
    )
    :vars
    (
      ?auto_142648 - BLOCK
      ?auto_142650 - BLOCK
      ?auto_142654 - BLOCK
      ?auto_142652 - BLOCK
      ?auto_142655 - BLOCK
      ?auto_142651 - BLOCK
      ?auto_142653 - BLOCK
      ?auto_142649 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142647 ?auto_142648 ) ) ( ON-TABLE ?auto_142650 ) ( ON ?auto_142654 ?auto_142650 ) ( ON ?auto_142652 ?auto_142654 ) ( ON ?auto_142655 ?auto_142652 ) ( not ( = ?auto_142650 ?auto_142654 ) ) ( not ( = ?auto_142650 ?auto_142652 ) ) ( not ( = ?auto_142650 ?auto_142655 ) ) ( not ( = ?auto_142650 ?auto_142651 ) ) ( not ( = ?auto_142650 ?auto_142653 ) ) ( not ( = ?auto_142650 ?auto_142648 ) ) ( not ( = ?auto_142650 ?auto_142647 ) ) ( not ( = ?auto_142654 ?auto_142652 ) ) ( not ( = ?auto_142654 ?auto_142655 ) ) ( not ( = ?auto_142654 ?auto_142651 ) ) ( not ( = ?auto_142654 ?auto_142653 ) ) ( not ( = ?auto_142654 ?auto_142648 ) ) ( not ( = ?auto_142654 ?auto_142647 ) ) ( not ( = ?auto_142652 ?auto_142655 ) ) ( not ( = ?auto_142652 ?auto_142651 ) ) ( not ( = ?auto_142652 ?auto_142653 ) ) ( not ( = ?auto_142652 ?auto_142648 ) ) ( not ( = ?auto_142652 ?auto_142647 ) ) ( not ( = ?auto_142655 ?auto_142651 ) ) ( not ( = ?auto_142655 ?auto_142653 ) ) ( not ( = ?auto_142655 ?auto_142648 ) ) ( not ( = ?auto_142655 ?auto_142647 ) ) ( not ( = ?auto_142651 ?auto_142653 ) ) ( not ( = ?auto_142651 ?auto_142648 ) ) ( not ( = ?auto_142651 ?auto_142647 ) ) ( not ( = ?auto_142653 ?auto_142648 ) ) ( not ( = ?auto_142653 ?auto_142647 ) ) ( ON ?auto_142647 ?auto_142649 ) ( not ( = ?auto_142647 ?auto_142649 ) ) ( not ( = ?auto_142648 ?auto_142649 ) ) ( not ( = ?auto_142650 ?auto_142649 ) ) ( not ( = ?auto_142654 ?auto_142649 ) ) ( not ( = ?auto_142652 ?auto_142649 ) ) ( not ( = ?auto_142655 ?auto_142649 ) ) ( not ( = ?auto_142651 ?auto_142649 ) ) ( not ( = ?auto_142653 ?auto_142649 ) ) ( ON ?auto_142648 ?auto_142647 ) ( ON-TABLE ?auto_142649 ) ( ON ?auto_142653 ?auto_142648 ) ( CLEAR ?auto_142655 ) ( ON ?auto_142651 ?auto_142653 ) ( CLEAR ?auto_142651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_142649 ?auto_142647 ?auto_142648 ?auto_142653 )
      ( MAKE-1PILE ?auto_142647 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142656 - BLOCK
    )
    :vars
    (
      ?auto_142662 - BLOCK
      ?auto_142660 - BLOCK
      ?auto_142658 - BLOCK
      ?auto_142661 - BLOCK
      ?auto_142659 - BLOCK
      ?auto_142657 - BLOCK
      ?auto_142664 - BLOCK
      ?auto_142663 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142656 ?auto_142662 ) ) ( ON-TABLE ?auto_142660 ) ( ON ?auto_142658 ?auto_142660 ) ( ON ?auto_142661 ?auto_142658 ) ( not ( = ?auto_142660 ?auto_142658 ) ) ( not ( = ?auto_142660 ?auto_142661 ) ) ( not ( = ?auto_142660 ?auto_142659 ) ) ( not ( = ?auto_142660 ?auto_142657 ) ) ( not ( = ?auto_142660 ?auto_142664 ) ) ( not ( = ?auto_142660 ?auto_142662 ) ) ( not ( = ?auto_142660 ?auto_142656 ) ) ( not ( = ?auto_142658 ?auto_142661 ) ) ( not ( = ?auto_142658 ?auto_142659 ) ) ( not ( = ?auto_142658 ?auto_142657 ) ) ( not ( = ?auto_142658 ?auto_142664 ) ) ( not ( = ?auto_142658 ?auto_142662 ) ) ( not ( = ?auto_142658 ?auto_142656 ) ) ( not ( = ?auto_142661 ?auto_142659 ) ) ( not ( = ?auto_142661 ?auto_142657 ) ) ( not ( = ?auto_142661 ?auto_142664 ) ) ( not ( = ?auto_142661 ?auto_142662 ) ) ( not ( = ?auto_142661 ?auto_142656 ) ) ( not ( = ?auto_142659 ?auto_142657 ) ) ( not ( = ?auto_142659 ?auto_142664 ) ) ( not ( = ?auto_142659 ?auto_142662 ) ) ( not ( = ?auto_142659 ?auto_142656 ) ) ( not ( = ?auto_142657 ?auto_142664 ) ) ( not ( = ?auto_142657 ?auto_142662 ) ) ( not ( = ?auto_142657 ?auto_142656 ) ) ( not ( = ?auto_142664 ?auto_142662 ) ) ( not ( = ?auto_142664 ?auto_142656 ) ) ( ON ?auto_142656 ?auto_142663 ) ( not ( = ?auto_142656 ?auto_142663 ) ) ( not ( = ?auto_142662 ?auto_142663 ) ) ( not ( = ?auto_142660 ?auto_142663 ) ) ( not ( = ?auto_142658 ?auto_142663 ) ) ( not ( = ?auto_142661 ?auto_142663 ) ) ( not ( = ?auto_142659 ?auto_142663 ) ) ( not ( = ?auto_142657 ?auto_142663 ) ) ( not ( = ?auto_142664 ?auto_142663 ) ) ( ON ?auto_142662 ?auto_142656 ) ( ON-TABLE ?auto_142663 ) ( ON ?auto_142664 ?auto_142662 ) ( ON ?auto_142657 ?auto_142664 ) ( CLEAR ?auto_142657 ) ( HOLDING ?auto_142659 ) ( CLEAR ?auto_142661 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_142660 ?auto_142658 ?auto_142661 ?auto_142659 )
      ( MAKE-1PILE ?auto_142656 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142665 - BLOCK
    )
    :vars
    (
      ?auto_142668 - BLOCK
      ?auto_142672 - BLOCK
      ?auto_142670 - BLOCK
      ?auto_142666 - BLOCK
      ?auto_142667 - BLOCK
      ?auto_142673 - BLOCK
      ?auto_142671 - BLOCK
      ?auto_142669 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142665 ?auto_142668 ) ) ( ON-TABLE ?auto_142672 ) ( ON ?auto_142670 ?auto_142672 ) ( ON ?auto_142666 ?auto_142670 ) ( not ( = ?auto_142672 ?auto_142670 ) ) ( not ( = ?auto_142672 ?auto_142666 ) ) ( not ( = ?auto_142672 ?auto_142667 ) ) ( not ( = ?auto_142672 ?auto_142673 ) ) ( not ( = ?auto_142672 ?auto_142671 ) ) ( not ( = ?auto_142672 ?auto_142668 ) ) ( not ( = ?auto_142672 ?auto_142665 ) ) ( not ( = ?auto_142670 ?auto_142666 ) ) ( not ( = ?auto_142670 ?auto_142667 ) ) ( not ( = ?auto_142670 ?auto_142673 ) ) ( not ( = ?auto_142670 ?auto_142671 ) ) ( not ( = ?auto_142670 ?auto_142668 ) ) ( not ( = ?auto_142670 ?auto_142665 ) ) ( not ( = ?auto_142666 ?auto_142667 ) ) ( not ( = ?auto_142666 ?auto_142673 ) ) ( not ( = ?auto_142666 ?auto_142671 ) ) ( not ( = ?auto_142666 ?auto_142668 ) ) ( not ( = ?auto_142666 ?auto_142665 ) ) ( not ( = ?auto_142667 ?auto_142673 ) ) ( not ( = ?auto_142667 ?auto_142671 ) ) ( not ( = ?auto_142667 ?auto_142668 ) ) ( not ( = ?auto_142667 ?auto_142665 ) ) ( not ( = ?auto_142673 ?auto_142671 ) ) ( not ( = ?auto_142673 ?auto_142668 ) ) ( not ( = ?auto_142673 ?auto_142665 ) ) ( not ( = ?auto_142671 ?auto_142668 ) ) ( not ( = ?auto_142671 ?auto_142665 ) ) ( ON ?auto_142665 ?auto_142669 ) ( not ( = ?auto_142665 ?auto_142669 ) ) ( not ( = ?auto_142668 ?auto_142669 ) ) ( not ( = ?auto_142672 ?auto_142669 ) ) ( not ( = ?auto_142670 ?auto_142669 ) ) ( not ( = ?auto_142666 ?auto_142669 ) ) ( not ( = ?auto_142667 ?auto_142669 ) ) ( not ( = ?auto_142673 ?auto_142669 ) ) ( not ( = ?auto_142671 ?auto_142669 ) ) ( ON ?auto_142668 ?auto_142665 ) ( ON-TABLE ?auto_142669 ) ( ON ?auto_142671 ?auto_142668 ) ( ON ?auto_142673 ?auto_142671 ) ( CLEAR ?auto_142666 ) ( ON ?auto_142667 ?auto_142673 ) ( CLEAR ?auto_142667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_142669 ?auto_142665 ?auto_142668 ?auto_142671 ?auto_142673 )
      ( MAKE-1PILE ?auto_142665 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142674 - BLOCK
    )
    :vars
    (
      ?auto_142675 - BLOCK
      ?auto_142682 - BLOCK
      ?auto_142679 - BLOCK
      ?auto_142676 - BLOCK
      ?auto_142678 - BLOCK
      ?auto_142680 - BLOCK
      ?auto_142677 - BLOCK
      ?auto_142681 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142674 ?auto_142675 ) ) ( ON-TABLE ?auto_142682 ) ( ON ?auto_142679 ?auto_142682 ) ( not ( = ?auto_142682 ?auto_142679 ) ) ( not ( = ?auto_142682 ?auto_142676 ) ) ( not ( = ?auto_142682 ?auto_142678 ) ) ( not ( = ?auto_142682 ?auto_142680 ) ) ( not ( = ?auto_142682 ?auto_142677 ) ) ( not ( = ?auto_142682 ?auto_142675 ) ) ( not ( = ?auto_142682 ?auto_142674 ) ) ( not ( = ?auto_142679 ?auto_142676 ) ) ( not ( = ?auto_142679 ?auto_142678 ) ) ( not ( = ?auto_142679 ?auto_142680 ) ) ( not ( = ?auto_142679 ?auto_142677 ) ) ( not ( = ?auto_142679 ?auto_142675 ) ) ( not ( = ?auto_142679 ?auto_142674 ) ) ( not ( = ?auto_142676 ?auto_142678 ) ) ( not ( = ?auto_142676 ?auto_142680 ) ) ( not ( = ?auto_142676 ?auto_142677 ) ) ( not ( = ?auto_142676 ?auto_142675 ) ) ( not ( = ?auto_142676 ?auto_142674 ) ) ( not ( = ?auto_142678 ?auto_142680 ) ) ( not ( = ?auto_142678 ?auto_142677 ) ) ( not ( = ?auto_142678 ?auto_142675 ) ) ( not ( = ?auto_142678 ?auto_142674 ) ) ( not ( = ?auto_142680 ?auto_142677 ) ) ( not ( = ?auto_142680 ?auto_142675 ) ) ( not ( = ?auto_142680 ?auto_142674 ) ) ( not ( = ?auto_142677 ?auto_142675 ) ) ( not ( = ?auto_142677 ?auto_142674 ) ) ( ON ?auto_142674 ?auto_142681 ) ( not ( = ?auto_142674 ?auto_142681 ) ) ( not ( = ?auto_142675 ?auto_142681 ) ) ( not ( = ?auto_142682 ?auto_142681 ) ) ( not ( = ?auto_142679 ?auto_142681 ) ) ( not ( = ?auto_142676 ?auto_142681 ) ) ( not ( = ?auto_142678 ?auto_142681 ) ) ( not ( = ?auto_142680 ?auto_142681 ) ) ( not ( = ?auto_142677 ?auto_142681 ) ) ( ON ?auto_142675 ?auto_142674 ) ( ON-TABLE ?auto_142681 ) ( ON ?auto_142677 ?auto_142675 ) ( ON ?auto_142680 ?auto_142677 ) ( ON ?auto_142678 ?auto_142680 ) ( CLEAR ?auto_142678 ) ( HOLDING ?auto_142676 ) ( CLEAR ?auto_142679 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_142682 ?auto_142679 ?auto_142676 )
      ( MAKE-1PILE ?auto_142674 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142683 - BLOCK
    )
    :vars
    (
      ?auto_142691 - BLOCK
      ?auto_142689 - BLOCK
      ?auto_142684 - BLOCK
      ?auto_142687 - BLOCK
      ?auto_142686 - BLOCK
      ?auto_142685 - BLOCK
      ?auto_142688 - BLOCK
      ?auto_142690 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142683 ?auto_142691 ) ) ( ON-TABLE ?auto_142689 ) ( ON ?auto_142684 ?auto_142689 ) ( not ( = ?auto_142689 ?auto_142684 ) ) ( not ( = ?auto_142689 ?auto_142687 ) ) ( not ( = ?auto_142689 ?auto_142686 ) ) ( not ( = ?auto_142689 ?auto_142685 ) ) ( not ( = ?auto_142689 ?auto_142688 ) ) ( not ( = ?auto_142689 ?auto_142691 ) ) ( not ( = ?auto_142689 ?auto_142683 ) ) ( not ( = ?auto_142684 ?auto_142687 ) ) ( not ( = ?auto_142684 ?auto_142686 ) ) ( not ( = ?auto_142684 ?auto_142685 ) ) ( not ( = ?auto_142684 ?auto_142688 ) ) ( not ( = ?auto_142684 ?auto_142691 ) ) ( not ( = ?auto_142684 ?auto_142683 ) ) ( not ( = ?auto_142687 ?auto_142686 ) ) ( not ( = ?auto_142687 ?auto_142685 ) ) ( not ( = ?auto_142687 ?auto_142688 ) ) ( not ( = ?auto_142687 ?auto_142691 ) ) ( not ( = ?auto_142687 ?auto_142683 ) ) ( not ( = ?auto_142686 ?auto_142685 ) ) ( not ( = ?auto_142686 ?auto_142688 ) ) ( not ( = ?auto_142686 ?auto_142691 ) ) ( not ( = ?auto_142686 ?auto_142683 ) ) ( not ( = ?auto_142685 ?auto_142688 ) ) ( not ( = ?auto_142685 ?auto_142691 ) ) ( not ( = ?auto_142685 ?auto_142683 ) ) ( not ( = ?auto_142688 ?auto_142691 ) ) ( not ( = ?auto_142688 ?auto_142683 ) ) ( ON ?auto_142683 ?auto_142690 ) ( not ( = ?auto_142683 ?auto_142690 ) ) ( not ( = ?auto_142691 ?auto_142690 ) ) ( not ( = ?auto_142689 ?auto_142690 ) ) ( not ( = ?auto_142684 ?auto_142690 ) ) ( not ( = ?auto_142687 ?auto_142690 ) ) ( not ( = ?auto_142686 ?auto_142690 ) ) ( not ( = ?auto_142685 ?auto_142690 ) ) ( not ( = ?auto_142688 ?auto_142690 ) ) ( ON ?auto_142691 ?auto_142683 ) ( ON-TABLE ?auto_142690 ) ( ON ?auto_142688 ?auto_142691 ) ( ON ?auto_142685 ?auto_142688 ) ( ON ?auto_142686 ?auto_142685 ) ( CLEAR ?auto_142684 ) ( ON ?auto_142687 ?auto_142686 ) ( CLEAR ?auto_142687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_142690 ?auto_142683 ?auto_142691 ?auto_142688 ?auto_142685 ?auto_142686 )
      ( MAKE-1PILE ?auto_142683 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142692 - BLOCK
    )
    :vars
    (
      ?auto_142700 - BLOCK
      ?auto_142697 - BLOCK
      ?auto_142696 - BLOCK
      ?auto_142699 - BLOCK
      ?auto_142695 - BLOCK
      ?auto_142698 - BLOCK
      ?auto_142694 - BLOCK
      ?auto_142693 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142692 ?auto_142700 ) ) ( ON-TABLE ?auto_142697 ) ( not ( = ?auto_142697 ?auto_142696 ) ) ( not ( = ?auto_142697 ?auto_142699 ) ) ( not ( = ?auto_142697 ?auto_142695 ) ) ( not ( = ?auto_142697 ?auto_142698 ) ) ( not ( = ?auto_142697 ?auto_142694 ) ) ( not ( = ?auto_142697 ?auto_142700 ) ) ( not ( = ?auto_142697 ?auto_142692 ) ) ( not ( = ?auto_142696 ?auto_142699 ) ) ( not ( = ?auto_142696 ?auto_142695 ) ) ( not ( = ?auto_142696 ?auto_142698 ) ) ( not ( = ?auto_142696 ?auto_142694 ) ) ( not ( = ?auto_142696 ?auto_142700 ) ) ( not ( = ?auto_142696 ?auto_142692 ) ) ( not ( = ?auto_142699 ?auto_142695 ) ) ( not ( = ?auto_142699 ?auto_142698 ) ) ( not ( = ?auto_142699 ?auto_142694 ) ) ( not ( = ?auto_142699 ?auto_142700 ) ) ( not ( = ?auto_142699 ?auto_142692 ) ) ( not ( = ?auto_142695 ?auto_142698 ) ) ( not ( = ?auto_142695 ?auto_142694 ) ) ( not ( = ?auto_142695 ?auto_142700 ) ) ( not ( = ?auto_142695 ?auto_142692 ) ) ( not ( = ?auto_142698 ?auto_142694 ) ) ( not ( = ?auto_142698 ?auto_142700 ) ) ( not ( = ?auto_142698 ?auto_142692 ) ) ( not ( = ?auto_142694 ?auto_142700 ) ) ( not ( = ?auto_142694 ?auto_142692 ) ) ( ON ?auto_142692 ?auto_142693 ) ( not ( = ?auto_142692 ?auto_142693 ) ) ( not ( = ?auto_142700 ?auto_142693 ) ) ( not ( = ?auto_142697 ?auto_142693 ) ) ( not ( = ?auto_142696 ?auto_142693 ) ) ( not ( = ?auto_142699 ?auto_142693 ) ) ( not ( = ?auto_142695 ?auto_142693 ) ) ( not ( = ?auto_142698 ?auto_142693 ) ) ( not ( = ?auto_142694 ?auto_142693 ) ) ( ON ?auto_142700 ?auto_142692 ) ( ON-TABLE ?auto_142693 ) ( ON ?auto_142694 ?auto_142700 ) ( ON ?auto_142698 ?auto_142694 ) ( ON ?auto_142695 ?auto_142698 ) ( ON ?auto_142699 ?auto_142695 ) ( CLEAR ?auto_142699 ) ( HOLDING ?auto_142696 ) ( CLEAR ?auto_142697 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_142697 ?auto_142696 )
      ( MAKE-1PILE ?auto_142692 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142701 - BLOCK
    )
    :vars
    (
      ?auto_142707 - BLOCK
      ?auto_142702 - BLOCK
      ?auto_142704 - BLOCK
      ?auto_142709 - BLOCK
      ?auto_142705 - BLOCK
      ?auto_142703 - BLOCK
      ?auto_142706 - BLOCK
      ?auto_142708 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142701 ?auto_142707 ) ) ( ON-TABLE ?auto_142702 ) ( not ( = ?auto_142702 ?auto_142704 ) ) ( not ( = ?auto_142702 ?auto_142709 ) ) ( not ( = ?auto_142702 ?auto_142705 ) ) ( not ( = ?auto_142702 ?auto_142703 ) ) ( not ( = ?auto_142702 ?auto_142706 ) ) ( not ( = ?auto_142702 ?auto_142707 ) ) ( not ( = ?auto_142702 ?auto_142701 ) ) ( not ( = ?auto_142704 ?auto_142709 ) ) ( not ( = ?auto_142704 ?auto_142705 ) ) ( not ( = ?auto_142704 ?auto_142703 ) ) ( not ( = ?auto_142704 ?auto_142706 ) ) ( not ( = ?auto_142704 ?auto_142707 ) ) ( not ( = ?auto_142704 ?auto_142701 ) ) ( not ( = ?auto_142709 ?auto_142705 ) ) ( not ( = ?auto_142709 ?auto_142703 ) ) ( not ( = ?auto_142709 ?auto_142706 ) ) ( not ( = ?auto_142709 ?auto_142707 ) ) ( not ( = ?auto_142709 ?auto_142701 ) ) ( not ( = ?auto_142705 ?auto_142703 ) ) ( not ( = ?auto_142705 ?auto_142706 ) ) ( not ( = ?auto_142705 ?auto_142707 ) ) ( not ( = ?auto_142705 ?auto_142701 ) ) ( not ( = ?auto_142703 ?auto_142706 ) ) ( not ( = ?auto_142703 ?auto_142707 ) ) ( not ( = ?auto_142703 ?auto_142701 ) ) ( not ( = ?auto_142706 ?auto_142707 ) ) ( not ( = ?auto_142706 ?auto_142701 ) ) ( ON ?auto_142701 ?auto_142708 ) ( not ( = ?auto_142701 ?auto_142708 ) ) ( not ( = ?auto_142707 ?auto_142708 ) ) ( not ( = ?auto_142702 ?auto_142708 ) ) ( not ( = ?auto_142704 ?auto_142708 ) ) ( not ( = ?auto_142709 ?auto_142708 ) ) ( not ( = ?auto_142705 ?auto_142708 ) ) ( not ( = ?auto_142703 ?auto_142708 ) ) ( not ( = ?auto_142706 ?auto_142708 ) ) ( ON ?auto_142707 ?auto_142701 ) ( ON-TABLE ?auto_142708 ) ( ON ?auto_142706 ?auto_142707 ) ( ON ?auto_142703 ?auto_142706 ) ( ON ?auto_142705 ?auto_142703 ) ( ON ?auto_142709 ?auto_142705 ) ( CLEAR ?auto_142702 ) ( ON ?auto_142704 ?auto_142709 ) ( CLEAR ?auto_142704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_142708 ?auto_142701 ?auto_142707 ?auto_142706 ?auto_142703 ?auto_142705 ?auto_142709 )
      ( MAKE-1PILE ?auto_142701 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142710 - BLOCK
    )
    :vars
    (
      ?auto_142717 - BLOCK
      ?auto_142715 - BLOCK
      ?auto_142712 - BLOCK
      ?auto_142714 - BLOCK
      ?auto_142713 - BLOCK
      ?auto_142716 - BLOCK
      ?auto_142711 - BLOCK
      ?auto_142718 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142710 ?auto_142717 ) ) ( not ( = ?auto_142715 ?auto_142712 ) ) ( not ( = ?auto_142715 ?auto_142714 ) ) ( not ( = ?auto_142715 ?auto_142713 ) ) ( not ( = ?auto_142715 ?auto_142716 ) ) ( not ( = ?auto_142715 ?auto_142711 ) ) ( not ( = ?auto_142715 ?auto_142717 ) ) ( not ( = ?auto_142715 ?auto_142710 ) ) ( not ( = ?auto_142712 ?auto_142714 ) ) ( not ( = ?auto_142712 ?auto_142713 ) ) ( not ( = ?auto_142712 ?auto_142716 ) ) ( not ( = ?auto_142712 ?auto_142711 ) ) ( not ( = ?auto_142712 ?auto_142717 ) ) ( not ( = ?auto_142712 ?auto_142710 ) ) ( not ( = ?auto_142714 ?auto_142713 ) ) ( not ( = ?auto_142714 ?auto_142716 ) ) ( not ( = ?auto_142714 ?auto_142711 ) ) ( not ( = ?auto_142714 ?auto_142717 ) ) ( not ( = ?auto_142714 ?auto_142710 ) ) ( not ( = ?auto_142713 ?auto_142716 ) ) ( not ( = ?auto_142713 ?auto_142711 ) ) ( not ( = ?auto_142713 ?auto_142717 ) ) ( not ( = ?auto_142713 ?auto_142710 ) ) ( not ( = ?auto_142716 ?auto_142711 ) ) ( not ( = ?auto_142716 ?auto_142717 ) ) ( not ( = ?auto_142716 ?auto_142710 ) ) ( not ( = ?auto_142711 ?auto_142717 ) ) ( not ( = ?auto_142711 ?auto_142710 ) ) ( ON ?auto_142710 ?auto_142718 ) ( not ( = ?auto_142710 ?auto_142718 ) ) ( not ( = ?auto_142717 ?auto_142718 ) ) ( not ( = ?auto_142715 ?auto_142718 ) ) ( not ( = ?auto_142712 ?auto_142718 ) ) ( not ( = ?auto_142714 ?auto_142718 ) ) ( not ( = ?auto_142713 ?auto_142718 ) ) ( not ( = ?auto_142716 ?auto_142718 ) ) ( not ( = ?auto_142711 ?auto_142718 ) ) ( ON ?auto_142717 ?auto_142710 ) ( ON-TABLE ?auto_142718 ) ( ON ?auto_142711 ?auto_142717 ) ( ON ?auto_142716 ?auto_142711 ) ( ON ?auto_142713 ?auto_142716 ) ( ON ?auto_142714 ?auto_142713 ) ( ON ?auto_142712 ?auto_142714 ) ( CLEAR ?auto_142712 ) ( HOLDING ?auto_142715 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_142715 )
      ( MAKE-1PILE ?auto_142710 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142719 - BLOCK
    )
    :vars
    (
      ?auto_142720 - BLOCK
      ?auto_142724 - BLOCK
      ?auto_142723 - BLOCK
      ?auto_142722 - BLOCK
      ?auto_142727 - BLOCK
      ?auto_142726 - BLOCK
      ?auto_142721 - BLOCK
      ?auto_142725 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142719 ?auto_142720 ) ) ( not ( = ?auto_142724 ?auto_142723 ) ) ( not ( = ?auto_142724 ?auto_142722 ) ) ( not ( = ?auto_142724 ?auto_142727 ) ) ( not ( = ?auto_142724 ?auto_142726 ) ) ( not ( = ?auto_142724 ?auto_142721 ) ) ( not ( = ?auto_142724 ?auto_142720 ) ) ( not ( = ?auto_142724 ?auto_142719 ) ) ( not ( = ?auto_142723 ?auto_142722 ) ) ( not ( = ?auto_142723 ?auto_142727 ) ) ( not ( = ?auto_142723 ?auto_142726 ) ) ( not ( = ?auto_142723 ?auto_142721 ) ) ( not ( = ?auto_142723 ?auto_142720 ) ) ( not ( = ?auto_142723 ?auto_142719 ) ) ( not ( = ?auto_142722 ?auto_142727 ) ) ( not ( = ?auto_142722 ?auto_142726 ) ) ( not ( = ?auto_142722 ?auto_142721 ) ) ( not ( = ?auto_142722 ?auto_142720 ) ) ( not ( = ?auto_142722 ?auto_142719 ) ) ( not ( = ?auto_142727 ?auto_142726 ) ) ( not ( = ?auto_142727 ?auto_142721 ) ) ( not ( = ?auto_142727 ?auto_142720 ) ) ( not ( = ?auto_142727 ?auto_142719 ) ) ( not ( = ?auto_142726 ?auto_142721 ) ) ( not ( = ?auto_142726 ?auto_142720 ) ) ( not ( = ?auto_142726 ?auto_142719 ) ) ( not ( = ?auto_142721 ?auto_142720 ) ) ( not ( = ?auto_142721 ?auto_142719 ) ) ( ON ?auto_142719 ?auto_142725 ) ( not ( = ?auto_142719 ?auto_142725 ) ) ( not ( = ?auto_142720 ?auto_142725 ) ) ( not ( = ?auto_142724 ?auto_142725 ) ) ( not ( = ?auto_142723 ?auto_142725 ) ) ( not ( = ?auto_142722 ?auto_142725 ) ) ( not ( = ?auto_142727 ?auto_142725 ) ) ( not ( = ?auto_142726 ?auto_142725 ) ) ( not ( = ?auto_142721 ?auto_142725 ) ) ( ON ?auto_142720 ?auto_142719 ) ( ON-TABLE ?auto_142725 ) ( ON ?auto_142721 ?auto_142720 ) ( ON ?auto_142726 ?auto_142721 ) ( ON ?auto_142727 ?auto_142726 ) ( ON ?auto_142722 ?auto_142727 ) ( ON ?auto_142723 ?auto_142722 ) ( ON ?auto_142724 ?auto_142723 ) ( CLEAR ?auto_142724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_142725 ?auto_142719 ?auto_142720 ?auto_142721 ?auto_142726 ?auto_142727 ?auto_142722 ?auto_142723 )
      ( MAKE-1PILE ?auto_142719 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142734 - BLOCK
      ?auto_142735 - BLOCK
      ?auto_142736 - BLOCK
      ?auto_142737 - BLOCK
      ?auto_142738 - BLOCK
      ?auto_142739 - BLOCK
    )
    :vars
    (
      ?auto_142740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142740 ?auto_142739 ) ( CLEAR ?auto_142740 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_142734 ) ( ON ?auto_142735 ?auto_142734 ) ( ON ?auto_142736 ?auto_142735 ) ( ON ?auto_142737 ?auto_142736 ) ( ON ?auto_142738 ?auto_142737 ) ( ON ?auto_142739 ?auto_142738 ) ( not ( = ?auto_142734 ?auto_142735 ) ) ( not ( = ?auto_142734 ?auto_142736 ) ) ( not ( = ?auto_142734 ?auto_142737 ) ) ( not ( = ?auto_142734 ?auto_142738 ) ) ( not ( = ?auto_142734 ?auto_142739 ) ) ( not ( = ?auto_142734 ?auto_142740 ) ) ( not ( = ?auto_142735 ?auto_142736 ) ) ( not ( = ?auto_142735 ?auto_142737 ) ) ( not ( = ?auto_142735 ?auto_142738 ) ) ( not ( = ?auto_142735 ?auto_142739 ) ) ( not ( = ?auto_142735 ?auto_142740 ) ) ( not ( = ?auto_142736 ?auto_142737 ) ) ( not ( = ?auto_142736 ?auto_142738 ) ) ( not ( = ?auto_142736 ?auto_142739 ) ) ( not ( = ?auto_142736 ?auto_142740 ) ) ( not ( = ?auto_142737 ?auto_142738 ) ) ( not ( = ?auto_142737 ?auto_142739 ) ) ( not ( = ?auto_142737 ?auto_142740 ) ) ( not ( = ?auto_142738 ?auto_142739 ) ) ( not ( = ?auto_142738 ?auto_142740 ) ) ( not ( = ?auto_142739 ?auto_142740 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_142740 ?auto_142739 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142741 - BLOCK
      ?auto_142742 - BLOCK
      ?auto_142743 - BLOCK
      ?auto_142744 - BLOCK
      ?auto_142745 - BLOCK
      ?auto_142746 - BLOCK
    )
    :vars
    (
      ?auto_142747 - BLOCK
      ?auto_142748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142747 ?auto_142746 ) ( CLEAR ?auto_142747 ) ( ON-TABLE ?auto_142741 ) ( ON ?auto_142742 ?auto_142741 ) ( ON ?auto_142743 ?auto_142742 ) ( ON ?auto_142744 ?auto_142743 ) ( ON ?auto_142745 ?auto_142744 ) ( ON ?auto_142746 ?auto_142745 ) ( not ( = ?auto_142741 ?auto_142742 ) ) ( not ( = ?auto_142741 ?auto_142743 ) ) ( not ( = ?auto_142741 ?auto_142744 ) ) ( not ( = ?auto_142741 ?auto_142745 ) ) ( not ( = ?auto_142741 ?auto_142746 ) ) ( not ( = ?auto_142741 ?auto_142747 ) ) ( not ( = ?auto_142742 ?auto_142743 ) ) ( not ( = ?auto_142742 ?auto_142744 ) ) ( not ( = ?auto_142742 ?auto_142745 ) ) ( not ( = ?auto_142742 ?auto_142746 ) ) ( not ( = ?auto_142742 ?auto_142747 ) ) ( not ( = ?auto_142743 ?auto_142744 ) ) ( not ( = ?auto_142743 ?auto_142745 ) ) ( not ( = ?auto_142743 ?auto_142746 ) ) ( not ( = ?auto_142743 ?auto_142747 ) ) ( not ( = ?auto_142744 ?auto_142745 ) ) ( not ( = ?auto_142744 ?auto_142746 ) ) ( not ( = ?auto_142744 ?auto_142747 ) ) ( not ( = ?auto_142745 ?auto_142746 ) ) ( not ( = ?auto_142745 ?auto_142747 ) ) ( not ( = ?auto_142746 ?auto_142747 ) ) ( HOLDING ?auto_142748 ) ( not ( = ?auto_142741 ?auto_142748 ) ) ( not ( = ?auto_142742 ?auto_142748 ) ) ( not ( = ?auto_142743 ?auto_142748 ) ) ( not ( = ?auto_142744 ?auto_142748 ) ) ( not ( = ?auto_142745 ?auto_142748 ) ) ( not ( = ?auto_142746 ?auto_142748 ) ) ( not ( = ?auto_142747 ?auto_142748 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_142748 )
      ( MAKE-6PILE ?auto_142741 ?auto_142742 ?auto_142743 ?auto_142744 ?auto_142745 ?auto_142746 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142749 - BLOCK
      ?auto_142750 - BLOCK
      ?auto_142751 - BLOCK
      ?auto_142752 - BLOCK
      ?auto_142753 - BLOCK
      ?auto_142754 - BLOCK
    )
    :vars
    (
      ?auto_142756 - BLOCK
      ?auto_142755 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142756 ?auto_142754 ) ( ON-TABLE ?auto_142749 ) ( ON ?auto_142750 ?auto_142749 ) ( ON ?auto_142751 ?auto_142750 ) ( ON ?auto_142752 ?auto_142751 ) ( ON ?auto_142753 ?auto_142752 ) ( ON ?auto_142754 ?auto_142753 ) ( not ( = ?auto_142749 ?auto_142750 ) ) ( not ( = ?auto_142749 ?auto_142751 ) ) ( not ( = ?auto_142749 ?auto_142752 ) ) ( not ( = ?auto_142749 ?auto_142753 ) ) ( not ( = ?auto_142749 ?auto_142754 ) ) ( not ( = ?auto_142749 ?auto_142756 ) ) ( not ( = ?auto_142750 ?auto_142751 ) ) ( not ( = ?auto_142750 ?auto_142752 ) ) ( not ( = ?auto_142750 ?auto_142753 ) ) ( not ( = ?auto_142750 ?auto_142754 ) ) ( not ( = ?auto_142750 ?auto_142756 ) ) ( not ( = ?auto_142751 ?auto_142752 ) ) ( not ( = ?auto_142751 ?auto_142753 ) ) ( not ( = ?auto_142751 ?auto_142754 ) ) ( not ( = ?auto_142751 ?auto_142756 ) ) ( not ( = ?auto_142752 ?auto_142753 ) ) ( not ( = ?auto_142752 ?auto_142754 ) ) ( not ( = ?auto_142752 ?auto_142756 ) ) ( not ( = ?auto_142753 ?auto_142754 ) ) ( not ( = ?auto_142753 ?auto_142756 ) ) ( not ( = ?auto_142754 ?auto_142756 ) ) ( not ( = ?auto_142749 ?auto_142755 ) ) ( not ( = ?auto_142750 ?auto_142755 ) ) ( not ( = ?auto_142751 ?auto_142755 ) ) ( not ( = ?auto_142752 ?auto_142755 ) ) ( not ( = ?auto_142753 ?auto_142755 ) ) ( not ( = ?auto_142754 ?auto_142755 ) ) ( not ( = ?auto_142756 ?auto_142755 ) ) ( ON ?auto_142755 ?auto_142756 ) ( CLEAR ?auto_142755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_142749 ?auto_142750 ?auto_142751 ?auto_142752 ?auto_142753 ?auto_142754 ?auto_142756 )
      ( MAKE-6PILE ?auto_142749 ?auto_142750 ?auto_142751 ?auto_142752 ?auto_142753 ?auto_142754 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142757 - BLOCK
      ?auto_142758 - BLOCK
      ?auto_142759 - BLOCK
      ?auto_142760 - BLOCK
      ?auto_142761 - BLOCK
      ?auto_142762 - BLOCK
    )
    :vars
    (
      ?auto_142764 - BLOCK
      ?auto_142763 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142764 ?auto_142762 ) ( ON-TABLE ?auto_142757 ) ( ON ?auto_142758 ?auto_142757 ) ( ON ?auto_142759 ?auto_142758 ) ( ON ?auto_142760 ?auto_142759 ) ( ON ?auto_142761 ?auto_142760 ) ( ON ?auto_142762 ?auto_142761 ) ( not ( = ?auto_142757 ?auto_142758 ) ) ( not ( = ?auto_142757 ?auto_142759 ) ) ( not ( = ?auto_142757 ?auto_142760 ) ) ( not ( = ?auto_142757 ?auto_142761 ) ) ( not ( = ?auto_142757 ?auto_142762 ) ) ( not ( = ?auto_142757 ?auto_142764 ) ) ( not ( = ?auto_142758 ?auto_142759 ) ) ( not ( = ?auto_142758 ?auto_142760 ) ) ( not ( = ?auto_142758 ?auto_142761 ) ) ( not ( = ?auto_142758 ?auto_142762 ) ) ( not ( = ?auto_142758 ?auto_142764 ) ) ( not ( = ?auto_142759 ?auto_142760 ) ) ( not ( = ?auto_142759 ?auto_142761 ) ) ( not ( = ?auto_142759 ?auto_142762 ) ) ( not ( = ?auto_142759 ?auto_142764 ) ) ( not ( = ?auto_142760 ?auto_142761 ) ) ( not ( = ?auto_142760 ?auto_142762 ) ) ( not ( = ?auto_142760 ?auto_142764 ) ) ( not ( = ?auto_142761 ?auto_142762 ) ) ( not ( = ?auto_142761 ?auto_142764 ) ) ( not ( = ?auto_142762 ?auto_142764 ) ) ( not ( = ?auto_142757 ?auto_142763 ) ) ( not ( = ?auto_142758 ?auto_142763 ) ) ( not ( = ?auto_142759 ?auto_142763 ) ) ( not ( = ?auto_142760 ?auto_142763 ) ) ( not ( = ?auto_142761 ?auto_142763 ) ) ( not ( = ?auto_142762 ?auto_142763 ) ) ( not ( = ?auto_142764 ?auto_142763 ) ) ( HOLDING ?auto_142763 ) ( CLEAR ?auto_142764 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_142757 ?auto_142758 ?auto_142759 ?auto_142760 ?auto_142761 ?auto_142762 ?auto_142764 ?auto_142763 )
      ( MAKE-6PILE ?auto_142757 ?auto_142758 ?auto_142759 ?auto_142760 ?auto_142761 ?auto_142762 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142765 - BLOCK
      ?auto_142766 - BLOCK
      ?auto_142767 - BLOCK
      ?auto_142768 - BLOCK
      ?auto_142769 - BLOCK
      ?auto_142770 - BLOCK
    )
    :vars
    (
      ?auto_142771 - BLOCK
      ?auto_142772 - BLOCK
      ?auto_142773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142771 ?auto_142770 ) ( ON-TABLE ?auto_142765 ) ( ON ?auto_142766 ?auto_142765 ) ( ON ?auto_142767 ?auto_142766 ) ( ON ?auto_142768 ?auto_142767 ) ( ON ?auto_142769 ?auto_142768 ) ( ON ?auto_142770 ?auto_142769 ) ( not ( = ?auto_142765 ?auto_142766 ) ) ( not ( = ?auto_142765 ?auto_142767 ) ) ( not ( = ?auto_142765 ?auto_142768 ) ) ( not ( = ?auto_142765 ?auto_142769 ) ) ( not ( = ?auto_142765 ?auto_142770 ) ) ( not ( = ?auto_142765 ?auto_142771 ) ) ( not ( = ?auto_142766 ?auto_142767 ) ) ( not ( = ?auto_142766 ?auto_142768 ) ) ( not ( = ?auto_142766 ?auto_142769 ) ) ( not ( = ?auto_142766 ?auto_142770 ) ) ( not ( = ?auto_142766 ?auto_142771 ) ) ( not ( = ?auto_142767 ?auto_142768 ) ) ( not ( = ?auto_142767 ?auto_142769 ) ) ( not ( = ?auto_142767 ?auto_142770 ) ) ( not ( = ?auto_142767 ?auto_142771 ) ) ( not ( = ?auto_142768 ?auto_142769 ) ) ( not ( = ?auto_142768 ?auto_142770 ) ) ( not ( = ?auto_142768 ?auto_142771 ) ) ( not ( = ?auto_142769 ?auto_142770 ) ) ( not ( = ?auto_142769 ?auto_142771 ) ) ( not ( = ?auto_142770 ?auto_142771 ) ) ( not ( = ?auto_142765 ?auto_142772 ) ) ( not ( = ?auto_142766 ?auto_142772 ) ) ( not ( = ?auto_142767 ?auto_142772 ) ) ( not ( = ?auto_142768 ?auto_142772 ) ) ( not ( = ?auto_142769 ?auto_142772 ) ) ( not ( = ?auto_142770 ?auto_142772 ) ) ( not ( = ?auto_142771 ?auto_142772 ) ) ( CLEAR ?auto_142771 ) ( ON ?auto_142772 ?auto_142773 ) ( CLEAR ?auto_142772 ) ( HAND-EMPTY ) ( not ( = ?auto_142765 ?auto_142773 ) ) ( not ( = ?auto_142766 ?auto_142773 ) ) ( not ( = ?auto_142767 ?auto_142773 ) ) ( not ( = ?auto_142768 ?auto_142773 ) ) ( not ( = ?auto_142769 ?auto_142773 ) ) ( not ( = ?auto_142770 ?auto_142773 ) ) ( not ( = ?auto_142771 ?auto_142773 ) ) ( not ( = ?auto_142772 ?auto_142773 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_142772 ?auto_142773 )
      ( MAKE-6PILE ?auto_142765 ?auto_142766 ?auto_142767 ?auto_142768 ?auto_142769 ?auto_142770 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142792 - BLOCK
      ?auto_142793 - BLOCK
      ?auto_142794 - BLOCK
      ?auto_142795 - BLOCK
      ?auto_142796 - BLOCK
      ?auto_142797 - BLOCK
    )
    :vars
    (
      ?auto_142798 - BLOCK
      ?auto_142799 - BLOCK
      ?auto_142800 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142792 ) ( ON ?auto_142793 ?auto_142792 ) ( ON ?auto_142794 ?auto_142793 ) ( ON ?auto_142795 ?auto_142794 ) ( ON ?auto_142796 ?auto_142795 ) ( not ( = ?auto_142792 ?auto_142793 ) ) ( not ( = ?auto_142792 ?auto_142794 ) ) ( not ( = ?auto_142792 ?auto_142795 ) ) ( not ( = ?auto_142792 ?auto_142796 ) ) ( not ( = ?auto_142792 ?auto_142797 ) ) ( not ( = ?auto_142792 ?auto_142798 ) ) ( not ( = ?auto_142793 ?auto_142794 ) ) ( not ( = ?auto_142793 ?auto_142795 ) ) ( not ( = ?auto_142793 ?auto_142796 ) ) ( not ( = ?auto_142793 ?auto_142797 ) ) ( not ( = ?auto_142793 ?auto_142798 ) ) ( not ( = ?auto_142794 ?auto_142795 ) ) ( not ( = ?auto_142794 ?auto_142796 ) ) ( not ( = ?auto_142794 ?auto_142797 ) ) ( not ( = ?auto_142794 ?auto_142798 ) ) ( not ( = ?auto_142795 ?auto_142796 ) ) ( not ( = ?auto_142795 ?auto_142797 ) ) ( not ( = ?auto_142795 ?auto_142798 ) ) ( not ( = ?auto_142796 ?auto_142797 ) ) ( not ( = ?auto_142796 ?auto_142798 ) ) ( not ( = ?auto_142797 ?auto_142798 ) ) ( not ( = ?auto_142792 ?auto_142799 ) ) ( not ( = ?auto_142793 ?auto_142799 ) ) ( not ( = ?auto_142794 ?auto_142799 ) ) ( not ( = ?auto_142795 ?auto_142799 ) ) ( not ( = ?auto_142796 ?auto_142799 ) ) ( not ( = ?auto_142797 ?auto_142799 ) ) ( not ( = ?auto_142798 ?auto_142799 ) ) ( ON ?auto_142799 ?auto_142800 ) ( not ( = ?auto_142792 ?auto_142800 ) ) ( not ( = ?auto_142793 ?auto_142800 ) ) ( not ( = ?auto_142794 ?auto_142800 ) ) ( not ( = ?auto_142795 ?auto_142800 ) ) ( not ( = ?auto_142796 ?auto_142800 ) ) ( not ( = ?auto_142797 ?auto_142800 ) ) ( not ( = ?auto_142798 ?auto_142800 ) ) ( not ( = ?auto_142799 ?auto_142800 ) ) ( ON ?auto_142798 ?auto_142799 ) ( CLEAR ?auto_142798 ) ( HOLDING ?auto_142797 ) ( CLEAR ?auto_142796 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_142792 ?auto_142793 ?auto_142794 ?auto_142795 ?auto_142796 ?auto_142797 ?auto_142798 )
      ( MAKE-6PILE ?auto_142792 ?auto_142793 ?auto_142794 ?auto_142795 ?auto_142796 ?auto_142797 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142801 - BLOCK
      ?auto_142802 - BLOCK
      ?auto_142803 - BLOCK
      ?auto_142804 - BLOCK
      ?auto_142805 - BLOCK
      ?auto_142806 - BLOCK
    )
    :vars
    (
      ?auto_142809 - BLOCK
      ?auto_142807 - BLOCK
      ?auto_142808 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142801 ) ( ON ?auto_142802 ?auto_142801 ) ( ON ?auto_142803 ?auto_142802 ) ( ON ?auto_142804 ?auto_142803 ) ( ON ?auto_142805 ?auto_142804 ) ( not ( = ?auto_142801 ?auto_142802 ) ) ( not ( = ?auto_142801 ?auto_142803 ) ) ( not ( = ?auto_142801 ?auto_142804 ) ) ( not ( = ?auto_142801 ?auto_142805 ) ) ( not ( = ?auto_142801 ?auto_142806 ) ) ( not ( = ?auto_142801 ?auto_142809 ) ) ( not ( = ?auto_142802 ?auto_142803 ) ) ( not ( = ?auto_142802 ?auto_142804 ) ) ( not ( = ?auto_142802 ?auto_142805 ) ) ( not ( = ?auto_142802 ?auto_142806 ) ) ( not ( = ?auto_142802 ?auto_142809 ) ) ( not ( = ?auto_142803 ?auto_142804 ) ) ( not ( = ?auto_142803 ?auto_142805 ) ) ( not ( = ?auto_142803 ?auto_142806 ) ) ( not ( = ?auto_142803 ?auto_142809 ) ) ( not ( = ?auto_142804 ?auto_142805 ) ) ( not ( = ?auto_142804 ?auto_142806 ) ) ( not ( = ?auto_142804 ?auto_142809 ) ) ( not ( = ?auto_142805 ?auto_142806 ) ) ( not ( = ?auto_142805 ?auto_142809 ) ) ( not ( = ?auto_142806 ?auto_142809 ) ) ( not ( = ?auto_142801 ?auto_142807 ) ) ( not ( = ?auto_142802 ?auto_142807 ) ) ( not ( = ?auto_142803 ?auto_142807 ) ) ( not ( = ?auto_142804 ?auto_142807 ) ) ( not ( = ?auto_142805 ?auto_142807 ) ) ( not ( = ?auto_142806 ?auto_142807 ) ) ( not ( = ?auto_142809 ?auto_142807 ) ) ( ON ?auto_142807 ?auto_142808 ) ( not ( = ?auto_142801 ?auto_142808 ) ) ( not ( = ?auto_142802 ?auto_142808 ) ) ( not ( = ?auto_142803 ?auto_142808 ) ) ( not ( = ?auto_142804 ?auto_142808 ) ) ( not ( = ?auto_142805 ?auto_142808 ) ) ( not ( = ?auto_142806 ?auto_142808 ) ) ( not ( = ?auto_142809 ?auto_142808 ) ) ( not ( = ?auto_142807 ?auto_142808 ) ) ( ON ?auto_142809 ?auto_142807 ) ( CLEAR ?auto_142805 ) ( ON ?auto_142806 ?auto_142809 ) ( CLEAR ?auto_142806 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_142808 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_142808 ?auto_142807 ?auto_142809 )
      ( MAKE-6PILE ?auto_142801 ?auto_142802 ?auto_142803 ?auto_142804 ?auto_142805 ?auto_142806 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142810 - BLOCK
      ?auto_142811 - BLOCK
      ?auto_142812 - BLOCK
      ?auto_142813 - BLOCK
      ?auto_142814 - BLOCK
      ?auto_142815 - BLOCK
    )
    :vars
    (
      ?auto_142817 - BLOCK
      ?auto_142818 - BLOCK
      ?auto_142816 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142810 ) ( ON ?auto_142811 ?auto_142810 ) ( ON ?auto_142812 ?auto_142811 ) ( ON ?auto_142813 ?auto_142812 ) ( not ( = ?auto_142810 ?auto_142811 ) ) ( not ( = ?auto_142810 ?auto_142812 ) ) ( not ( = ?auto_142810 ?auto_142813 ) ) ( not ( = ?auto_142810 ?auto_142814 ) ) ( not ( = ?auto_142810 ?auto_142815 ) ) ( not ( = ?auto_142810 ?auto_142817 ) ) ( not ( = ?auto_142811 ?auto_142812 ) ) ( not ( = ?auto_142811 ?auto_142813 ) ) ( not ( = ?auto_142811 ?auto_142814 ) ) ( not ( = ?auto_142811 ?auto_142815 ) ) ( not ( = ?auto_142811 ?auto_142817 ) ) ( not ( = ?auto_142812 ?auto_142813 ) ) ( not ( = ?auto_142812 ?auto_142814 ) ) ( not ( = ?auto_142812 ?auto_142815 ) ) ( not ( = ?auto_142812 ?auto_142817 ) ) ( not ( = ?auto_142813 ?auto_142814 ) ) ( not ( = ?auto_142813 ?auto_142815 ) ) ( not ( = ?auto_142813 ?auto_142817 ) ) ( not ( = ?auto_142814 ?auto_142815 ) ) ( not ( = ?auto_142814 ?auto_142817 ) ) ( not ( = ?auto_142815 ?auto_142817 ) ) ( not ( = ?auto_142810 ?auto_142818 ) ) ( not ( = ?auto_142811 ?auto_142818 ) ) ( not ( = ?auto_142812 ?auto_142818 ) ) ( not ( = ?auto_142813 ?auto_142818 ) ) ( not ( = ?auto_142814 ?auto_142818 ) ) ( not ( = ?auto_142815 ?auto_142818 ) ) ( not ( = ?auto_142817 ?auto_142818 ) ) ( ON ?auto_142818 ?auto_142816 ) ( not ( = ?auto_142810 ?auto_142816 ) ) ( not ( = ?auto_142811 ?auto_142816 ) ) ( not ( = ?auto_142812 ?auto_142816 ) ) ( not ( = ?auto_142813 ?auto_142816 ) ) ( not ( = ?auto_142814 ?auto_142816 ) ) ( not ( = ?auto_142815 ?auto_142816 ) ) ( not ( = ?auto_142817 ?auto_142816 ) ) ( not ( = ?auto_142818 ?auto_142816 ) ) ( ON ?auto_142817 ?auto_142818 ) ( ON ?auto_142815 ?auto_142817 ) ( CLEAR ?auto_142815 ) ( ON-TABLE ?auto_142816 ) ( HOLDING ?auto_142814 ) ( CLEAR ?auto_142813 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_142810 ?auto_142811 ?auto_142812 ?auto_142813 ?auto_142814 )
      ( MAKE-6PILE ?auto_142810 ?auto_142811 ?auto_142812 ?auto_142813 ?auto_142814 ?auto_142815 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142819 - BLOCK
      ?auto_142820 - BLOCK
      ?auto_142821 - BLOCK
      ?auto_142822 - BLOCK
      ?auto_142823 - BLOCK
      ?auto_142824 - BLOCK
    )
    :vars
    (
      ?auto_142825 - BLOCK
      ?auto_142827 - BLOCK
      ?auto_142826 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142819 ) ( ON ?auto_142820 ?auto_142819 ) ( ON ?auto_142821 ?auto_142820 ) ( ON ?auto_142822 ?auto_142821 ) ( not ( = ?auto_142819 ?auto_142820 ) ) ( not ( = ?auto_142819 ?auto_142821 ) ) ( not ( = ?auto_142819 ?auto_142822 ) ) ( not ( = ?auto_142819 ?auto_142823 ) ) ( not ( = ?auto_142819 ?auto_142824 ) ) ( not ( = ?auto_142819 ?auto_142825 ) ) ( not ( = ?auto_142820 ?auto_142821 ) ) ( not ( = ?auto_142820 ?auto_142822 ) ) ( not ( = ?auto_142820 ?auto_142823 ) ) ( not ( = ?auto_142820 ?auto_142824 ) ) ( not ( = ?auto_142820 ?auto_142825 ) ) ( not ( = ?auto_142821 ?auto_142822 ) ) ( not ( = ?auto_142821 ?auto_142823 ) ) ( not ( = ?auto_142821 ?auto_142824 ) ) ( not ( = ?auto_142821 ?auto_142825 ) ) ( not ( = ?auto_142822 ?auto_142823 ) ) ( not ( = ?auto_142822 ?auto_142824 ) ) ( not ( = ?auto_142822 ?auto_142825 ) ) ( not ( = ?auto_142823 ?auto_142824 ) ) ( not ( = ?auto_142823 ?auto_142825 ) ) ( not ( = ?auto_142824 ?auto_142825 ) ) ( not ( = ?auto_142819 ?auto_142827 ) ) ( not ( = ?auto_142820 ?auto_142827 ) ) ( not ( = ?auto_142821 ?auto_142827 ) ) ( not ( = ?auto_142822 ?auto_142827 ) ) ( not ( = ?auto_142823 ?auto_142827 ) ) ( not ( = ?auto_142824 ?auto_142827 ) ) ( not ( = ?auto_142825 ?auto_142827 ) ) ( ON ?auto_142827 ?auto_142826 ) ( not ( = ?auto_142819 ?auto_142826 ) ) ( not ( = ?auto_142820 ?auto_142826 ) ) ( not ( = ?auto_142821 ?auto_142826 ) ) ( not ( = ?auto_142822 ?auto_142826 ) ) ( not ( = ?auto_142823 ?auto_142826 ) ) ( not ( = ?auto_142824 ?auto_142826 ) ) ( not ( = ?auto_142825 ?auto_142826 ) ) ( not ( = ?auto_142827 ?auto_142826 ) ) ( ON ?auto_142825 ?auto_142827 ) ( ON ?auto_142824 ?auto_142825 ) ( ON-TABLE ?auto_142826 ) ( CLEAR ?auto_142822 ) ( ON ?auto_142823 ?auto_142824 ) ( CLEAR ?auto_142823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_142826 ?auto_142827 ?auto_142825 ?auto_142824 )
      ( MAKE-6PILE ?auto_142819 ?auto_142820 ?auto_142821 ?auto_142822 ?auto_142823 ?auto_142824 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142828 - BLOCK
      ?auto_142829 - BLOCK
      ?auto_142830 - BLOCK
      ?auto_142831 - BLOCK
      ?auto_142832 - BLOCK
      ?auto_142833 - BLOCK
    )
    :vars
    (
      ?auto_142836 - BLOCK
      ?auto_142835 - BLOCK
      ?auto_142834 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142828 ) ( ON ?auto_142829 ?auto_142828 ) ( ON ?auto_142830 ?auto_142829 ) ( not ( = ?auto_142828 ?auto_142829 ) ) ( not ( = ?auto_142828 ?auto_142830 ) ) ( not ( = ?auto_142828 ?auto_142831 ) ) ( not ( = ?auto_142828 ?auto_142832 ) ) ( not ( = ?auto_142828 ?auto_142833 ) ) ( not ( = ?auto_142828 ?auto_142836 ) ) ( not ( = ?auto_142829 ?auto_142830 ) ) ( not ( = ?auto_142829 ?auto_142831 ) ) ( not ( = ?auto_142829 ?auto_142832 ) ) ( not ( = ?auto_142829 ?auto_142833 ) ) ( not ( = ?auto_142829 ?auto_142836 ) ) ( not ( = ?auto_142830 ?auto_142831 ) ) ( not ( = ?auto_142830 ?auto_142832 ) ) ( not ( = ?auto_142830 ?auto_142833 ) ) ( not ( = ?auto_142830 ?auto_142836 ) ) ( not ( = ?auto_142831 ?auto_142832 ) ) ( not ( = ?auto_142831 ?auto_142833 ) ) ( not ( = ?auto_142831 ?auto_142836 ) ) ( not ( = ?auto_142832 ?auto_142833 ) ) ( not ( = ?auto_142832 ?auto_142836 ) ) ( not ( = ?auto_142833 ?auto_142836 ) ) ( not ( = ?auto_142828 ?auto_142835 ) ) ( not ( = ?auto_142829 ?auto_142835 ) ) ( not ( = ?auto_142830 ?auto_142835 ) ) ( not ( = ?auto_142831 ?auto_142835 ) ) ( not ( = ?auto_142832 ?auto_142835 ) ) ( not ( = ?auto_142833 ?auto_142835 ) ) ( not ( = ?auto_142836 ?auto_142835 ) ) ( ON ?auto_142835 ?auto_142834 ) ( not ( = ?auto_142828 ?auto_142834 ) ) ( not ( = ?auto_142829 ?auto_142834 ) ) ( not ( = ?auto_142830 ?auto_142834 ) ) ( not ( = ?auto_142831 ?auto_142834 ) ) ( not ( = ?auto_142832 ?auto_142834 ) ) ( not ( = ?auto_142833 ?auto_142834 ) ) ( not ( = ?auto_142836 ?auto_142834 ) ) ( not ( = ?auto_142835 ?auto_142834 ) ) ( ON ?auto_142836 ?auto_142835 ) ( ON ?auto_142833 ?auto_142836 ) ( ON-TABLE ?auto_142834 ) ( ON ?auto_142832 ?auto_142833 ) ( CLEAR ?auto_142832 ) ( HOLDING ?auto_142831 ) ( CLEAR ?auto_142830 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_142828 ?auto_142829 ?auto_142830 ?auto_142831 )
      ( MAKE-6PILE ?auto_142828 ?auto_142829 ?auto_142830 ?auto_142831 ?auto_142832 ?auto_142833 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142837 - BLOCK
      ?auto_142838 - BLOCK
      ?auto_142839 - BLOCK
      ?auto_142840 - BLOCK
      ?auto_142841 - BLOCK
      ?auto_142842 - BLOCK
    )
    :vars
    (
      ?auto_142843 - BLOCK
      ?auto_142845 - BLOCK
      ?auto_142844 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142837 ) ( ON ?auto_142838 ?auto_142837 ) ( ON ?auto_142839 ?auto_142838 ) ( not ( = ?auto_142837 ?auto_142838 ) ) ( not ( = ?auto_142837 ?auto_142839 ) ) ( not ( = ?auto_142837 ?auto_142840 ) ) ( not ( = ?auto_142837 ?auto_142841 ) ) ( not ( = ?auto_142837 ?auto_142842 ) ) ( not ( = ?auto_142837 ?auto_142843 ) ) ( not ( = ?auto_142838 ?auto_142839 ) ) ( not ( = ?auto_142838 ?auto_142840 ) ) ( not ( = ?auto_142838 ?auto_142841 ) ) ( not ( = ?auto_142838 ?auto_142842 ) ) ( not ( = ?auto_142838 ?auto_142843 ) ) ( not ( = ?auto_142839 ?auto_142840 ) ) ( not ( = ?auto_142839 ?auto_142841 ) ) ( not ( = ?auto_142839 ?auto_142842 ) ) ( not ( = ?auto_142839 ?auto_142843 ) ) ( not ( = ?auto_142840 ?auto_142841 ) ) ( not ( = ?auto_142840 ?auto_142842 ) ) ( not ( = ?auto_142840 ?auto_142843 ) ) ( not ( = ?auto_142841 ?auto_142842 ) ) ( not ( = ?auto_142841 ?auto_142843 ) ) ( not ( = ?auto_142842 ?auto_142843 ) ) ( not ( = ?auto_142837 ?auto_142845 ) ) ( not ( = ?auto_142838 ?auto_142845 ) ) ( not ( = ?auto_142839 ?auto_142845 ) ) ( not ( = ?auto_142840 ?auto_142845 ) ) ( not ( = ?auto_142841 ?auto_142845 ) ) ( not ( = ?auto_142842 ?auto_142845 ) ) ( not ( = ?auto_142843 ?auto_142845 ) ) ( ON ?auto_142845 ?auto_142844 ) ( not ( = ?auto_142837 ?auto_142844 ) ) ( not ( = ?auto_142838 ?auto_142844 ) ) ( not ( = ?auto_142839 ?auto_142844 ) ) ( not ( = ?auto_142840 ?auto_142844 ) ) ( not ( = ?auto_142841 ?auto_142844 ) ) ( not ( = ?auto_142842 ?auto_142844 ) ) ( not ( = ?auto_142843 ?auto_142844 ) ) ( not ( = ?auto_142845 ?auto_142844 ) ) ( ON ?auto_142843 ?auto_142845 ) ( ON ?auto_142842 ?auto_142843 ) ( ON-TABLE ?auto_142844 ) ( ON ?auto_142841 ?auto_142842 ) ( CLEAR ?auto_142839 ) ( ON ?auto_142840 ?auto_142841 ) ( CLEAR ?auto_142840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_142844 ?auto_142845 ?auto_142843 ?auto_142842 ?auto_142841 )
      ( MAKE-6PILE ?auto_142837 ?auto_142838 ?auto_142839 ?auto_142840 ?auto_142841 ?auto_142842 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142846 - BLOCK
      ?auto_142847 - BLOCK
      ?auto_142848 - BLOCK
      ?auto_142849 - BLOCK
      ?auto_142850 - BLOCK
      ?auto_142851 - BLOCK
    )
    :vars
    (
      ?auto_142852 - BLOCK
      ?auto_142854 - BLOCK
      ?auto_142853 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142846 ) ( ON ?auto_142847 ?auto_142846 ) ( not ( = ?auto_142846 ?auto_142847 ) ) ( not ( = ?auto_142846 ?auto_142848 ) ) ( not ( = ?auto_142846 ?auto_142849 ) ) ( not ( = ?auto_142846 ?auto_142850 ) ) ( not ( = ?auto_142846 ?auto_142851 ) ) ( not ( = ?auto_142846 ?auto_142852 ) ) ( not ( = ?auto_142847 ?auto_142848 ) ) ( not ( = ?auto_142847 ?auto_142849 ) ) ( not ( = ?auto_142847 ?auto_142850 ) ) ( not ( = ?auto_142847 ?auto_142851 ) ) ( not ( = ?auto_142847 ?auto_142852 ) ) ( not ( = ?auto_142848 ?auto_142849 ) ) ( not ( = ?auto_142848 ?auto_142850 ) ) ( not ( = ?auto_142848 ?auto_142851 ) ) ( not ( = ?auto_142848 ?auto_142852 ) ) ( not ( = ?auto_142849 ?auto_142850 ) ) ( not ( = ?auto_142849 ?auto_142851 ) ) ( not ( = ?auto_142849 ?auto_142852 ) ) ( not ( = ?auto_142850 ?auto_142851 ) ) ( not ( = ?auto_142850 ?auto_142852 ) ) ( not ( = ?auto_142851 ?auto_142852 ) ) ( not ( = ?auto_142846 ?auto_142854 ) ) ( not ( = ?auto_142847 ?auto_142854 ) ) ( not ( = ?auto_142848 ?auto_142854 ) ) ( not ( = ?auto_142849 ?auto_142854 ) ) ( not ( = ?auto_142850 ?auto_142854 ) ) ( not ( = ?auto_142851 ?auto_142854 ) ) ( not ( = ?auto_142852 ?auto_142854 ) ) ( ON ?auto_142854 ?auto_142853 ) ( not ( = ?auto_142846 ?auto_142853 ) ) ( not ( = ?auto_142847 ?auto_142853 ) ) ( not ( = ?auto_142848 ?auto_142853 ) ) ( not ( = ?auto_142849 ?auto_142853 ) ) ( not ( = ?auto_142850 ?auto_142853 ) ) ( not ( = ?auto_142851 ?auto_142853 ) ) ( not ( = ?auto_142852 ?auto_142853 ) ) ( not ( = ?auto_142854 ?auto_142853 ) ) ( ON ?auto_142852 ?auto_142854 ) ( ON ?auto_142851 ?auto_142852 ) ( ON-TABLE ?auto_142853 ) ( ON ?auto_142850 ?auto_142851 ) ( ON ?auto_142849 ?auto_142850 ) ( CLEAR ?auto_142849 ) ( HOLDING ?auto_142848 ) ( CLEAR ?auto_142847 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_142846 ?auto_142847 ?auto_142848 )
      ( MAKE-6PILE ?auto_142846 ?auto_142847 ?auto_142848 ?auto_142849 ?auto_142850 ?auto_142851 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142855 - BLOCK
      ?auto_142856 - BLOCK
      ?auto_142857 - BLOCK
      ?auto_142858 - BLOCK
      ?auto_142859 - BLOCK
      ?auto_142860 - BLOCK
    )
    :vars
    (
      ?auto_142863 - BLOCK
      ?auto_142861 - BLOCK
      ?auto_142862 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142855 ) ( ON ?auto_142856 ?auto_142855 ) ( not ( = ?auto_142855 ?auto_142856 ) ) ( not ( = ?auto_142855 ?auto_142857 ) ) ( not ( = ?auto_142855 ?auto_142858 ) ) ( not ( = ?auto_142855 ?auto_142859 ) ) ( not ( = ?auto_142855 ?auto_142860 ) ) ( not ( = ?auto_142855 ?auto_142863 ) ) ( not ( = ?auto_142856 ?auto_142857 ) ) ( not ( = ?auto_142856 ?auto_142858 ) ) ( not ( = ?auto_142856 ?auto_142859 ) ) ( not ( = ?auto_142856 ?auto_142860 ) ) ( not ( = ?auto_142856 ?auto_142863 ) ) ( not ( = ?auto_142857 ?auto_142858 ) ) ( not ( = ?auto_142857 ?auto_142859 ) ) ( not ( = ?auto_142857 ?auto_142860 ) ) ( not ( = ?auto_142857 ?auto_142863 ) ) ( not ( = ?auto_142858 ?auto_142859 ) ) ( not ( = ?auto_142858 ?auto_142860 ) ) ( not ( = ?auto_142858 ?auto_142863 ) ) ( not ( = ?auto_142859 ?auto_142860 ) ) ( not ( = ?auto_142859 ?auto_142863 ) ) ( not ( = ?auto_142860 ?auto_142863 ) ) ( not ( = ?auto_142855 ?auto_142861 ) ) ( not ( = ?auto_142856 ?auto_142861 ) ) ( not ( = ?auto_142857 ?auto_142861 ) ) ( not ( = ?auto_142858 ?auto_142861 ) ) ( not ( = ?auto_142859 ?auto_142861 ) ) ( not ( = ?auto_142860 ?auto_142861 ) ) ( not ( = ?auto_142863 ?auto_142861 ) ) ( ON ?auto_142861 ?auto_142862 ) ( not ( = ?auto_142855 ?auto_142862 ) ) ( not ( = ?auto_142856 ?auto_142862 ) ) ( not ( = ?auto_142857 ?auto_142862 ) ) ( not ( = ?auto_142858 ?auto_142862 ) ) ( not ( = ?auto_142859 ?auto_142862 ) ) ( not ( = ?auto_142860 ?auto_142862 ) ) ( not ( = ?auto_142863 ?auto_142862 ) ) ( not ( = ?auto_142861 ?auto_142862 ) ) ( ON ?auto_142863 ?auto_142861 ) ( ON ?auto_142860 ?auto_142863 ) ( ON-TABLE ?auto_142862 ) ( ON ?auto_142859 ?auto_142860 ) ( ON ?auto_142858 ?auto_142859 ) ( CLEAR ?auto_142856 ) ( ON ?auto_142857 ?auto_142858 ) ( CLEAR ?auto_142857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_142862 ?auto_142861 ?auto_142863 ?auto_142860 ?auto_142859 ?auto_142858 )
      ( MAKE-6PILE ?auto_142855 ?auto_142856 ?auto_142857 ?auto_142858 ?auto_142859 ?auto_142860 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142864 - BLOCK
      ?auto_142865 - BLOCK
      ?auto_142866 - BLOCK
      ?auto_142867 - BLOCK
      ?auto_142868 - BLOCK
      ?auto_142869 - BLOCK
    )
    :vars
    (
      ?auto_142870 - BLOCK
      ?auto_142871 - BLOCK
      ?auto_142872 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142864 ) ( not ( = ?auto_142864 ?auto_142865 ) ) ( not ( = ?auto_142864 ?auto_142866 ) ) ( not ( = ?auto_142864 ?auto_142867 ) ) ( not ( = ?auto_142864 ?auto_142868 ) ) ( not ( = ?auto_142864 ?auto_142869 ) ) ( not ( = ?auto_142864 ?auto_142870 ) ) ( not ( = ?auto_142865 ?auto_142866 ) ) ( not ( = ?auto_142865 ?auto_142867 ) ) ( not ( = ?auto_142865 ?auto_142868 ) ) ( not ( = ?auto_142865 ?auto_142869 ) ) ( not ( = ?auto_142865 ?auto_142870 ) ) ( not ( = ?auto_142866 ?auto_142867 ) ) ( not ( = ?auto_142866 ?auto_142868 ) ) ( not ( = ?auto_142866 ?auto_142869 ) ) ( not ( = ?auto_142866 ?auto_142870 ) ) ( not ( = ?auto_142867 ?auto_142868 ) ) ( not ( = ?auto_142867 ?auto_142869 ) ) ( not ( = ?auto_142867 ?auto_142870 ) ) ( not ( = ?auto_142868 ?auto_142869 ) ) ( not ( = ?auto_142868 ?auto_142870 ) ) ( not ( = ?auto_142869 ?auto_142870 ) ) ( not ( = ?auto_142864 ?auto_142871 ) ) ( not ( = ?auto_142865 ?auto_142871 ) ) ( not ( = ?auto_142866 ?auto_142871 ) ) ( not ( = ?auto_142867 ?auto_142871 ) ) ( not ( = ?auto_142868 ?auto_142871 ) ) ( not ( = ?auto_142869 ?auto_142871 ) ) ( not ( = ?auto_142870 ?auto_142871 ) ) ( ON ?auto_142871 ?auto_142872 ) ( not ( = ?auto_142864 ?auto_142872 ) ) ( not ( = ?auto_142865 ?auto_142872 ) ) ( not ( = ?auto_142866 ?auto_142872 ) ) ( not ( = ?auto_142867 ?auto_142872 ) ) ( not ( = ?auto_142868 ?auto_142872 ) ) ( not ( = ?auto_142869 ?auto_142872 ) ) ( not ( = ?auto_142870 ?auto_142872 ) ) ( not ( = ?auto_142871 ?auto_142872 ) ) ( ON ?auto_142870 ?auto_142871 ) ( ON ?auto_142869 ?auto_142870 ) ( ON-TABLE ?auto_142872 ) ( ON ?auto_142868 ?auto_142869 ) ( ON ?auto_142867 ?auto_142868 ) ( ON ?auto_142866 ?auto_142867 ) ( CLEAR ?auto_142866 ) ( HOLDING ?auto_142865 ) ( CLEAR ?auto_142864 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_142864 ?auto_142865 )
      ( MAKE-6PILE ?auto_142864 ?auto_142865 ?auto_142866 ?auto_142867 ?auto_142868 ?auto_142869 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142873 - BLOCK
      ?auto_142874 - BLOCK
      ?auto_142875 - BLOCK
      ?auto_142876 - BLOCK
      ?auto_142877 - BLOCK
      ?auto_142878 - BLOCK
    )
    :vars
    (
      ?auto_142880 - BLOCK
      ?auto_142879 - BLOCK
      ?auto_142881 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142873 ) ( not ( = ?auto_142873 ?auto_142874 ) ) ( not ( = ?auto_142873 ?auto_142875 ) ) ( not ( = ?auto_142873 ?auto_142876 ) ) ( not ( = ?auto_142873 ?auto_142877 ) ) ( not ( = ?auto_142873 ?auto_142878 ) ) ( not ( = ?auto_142873 ?auto_142880 ) ) ( not ( = ?auto_142874 ?auto_142875 ) ) ( not ( = ?auto_142874 ?auto_142876 ) ) ( not ( = ?auto_142874 ?auto_142877 ) ) ( not ( = ?auto_142874 ?auto_142878 ) ) ( not ( = ?auto_142874 ?auto_142880 ) ) ( not ( = ?auto_142875 ?auto_142876 ) ) ( not ( = ?auto_142875 ?auto_142877 ) ) ( not ( = ?auto_142875 ?auto_142878 ) ) ( not ( = ?auto_142875 ?auto_142880 ) ) ( not ( = ?auto_142876 ?auto_142877 ) ) ( not ( = ?auto_142876 ?auto_142878 ) ) ( not ( = ?auto_142876 ?auto_142880 ) ) ( not ( = ?auto_142877 ?auto_142878 ) ) ( not ( = ?auto_142877 ?auto_142880 ) ) ( not ( = ?auto_142878 ?auto_142880 ) ) ( not ( = ?auto_142873 ?auto_142879 ) ) ( not ( = ?auto_142874 ?auto_142879 ) ) ( not ( = ?auto_142875 ?auto_142879 ) ) ( not ( = ?auto_142876 ?auto_142879 ) ) ( not ( = ?auto_142877 ?auto_142879 ) ) ( not ( = ?auto_142878 ?auto_142879 ) ) ( not ( = ?auto_142880 ?auto_142879 ) ) ( ON ?auto_142879 ?auto_142881 ) ( not ( = ?auto_142873 ?auto_142881 ) ) ( not ( = ?auto_142874 ?auto_142881 ) ) ( not ( = ?auto_142875 ?auto_142881 ) ) ( not ( = ?auto_142876 ?auto_142881 ) ) ( not ( = ?auto_142877 ?auto_142881 ) ) ( not ( = ?auto_142878 ?auto_142881 ) ) ( not ( = ?auto_142880 ?auto_142881 ) ) ( not ( = ?auto_142879 ?auto_142881 ) ) ( ON ?auto_142880 ?auto_142879 ) ( ON ?auto_142878 ?auto_142880 ) ( ON-TABLE ?auto_142881 ) ( ON ?auto_142877 ?auto_142878 ) ( ON ?auto_142876 ?auto_142877 ) ( ON ?auto_142875 ?auto_142876 ) ( CLEAR ?auto_142873 ) ( ON ?auto_142874 ?auto_142875 ) ( CLEAR ?auto_142874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_142881 ?auto_142879 ?auto_142880 ?auto_142878 ?auto_142877 ?auto_142876 ?auto_142875 )
      ( MAKE-6PILE ?auto_142873 ?auto_142874 ?auto_142875 ?auto_142876 ?auto_142877 ?auto_142878 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142882 - BLOCK
      ?auto_142883 - BLOCK
      ?auto_142884 - BLOCK
      ?auto_142885 - BLOCK
      ?auto_142886 - BLOCK
      ?auto_142887 - BLOCK
    )
    :vars
    (
      ?auto_142890 - BLOCK
      ?auto_142889 - BLOCK
      ?auto_142888 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142882 ?auto_142883 ) ) ( not ( = ?auto_142882 ?auto_142884 ) ) ( not ( = ?auto_142882 ?auto_142885 ) ) ( not ( = ?auto_142882 ?auto_142886 ) ) ( not ( = ?auto_142882 ?auto_142887 ) ) ( not ( = ?auto_142882 ?auto_142890 ) ) ( not ( = ?auto_142883 ?auto_142884 ) ) ( not ( = ?auto_142883 ?auto_142885 ) ) ( not ( = ?auto_142883 ?auto_142886 ) ) ( not ( = ?auto_142883 ?auto_142887 ) ) ( not ( = ?auto_142883 ?auto_142890 ) ) ( not ( = ?auto_142884 ?auto_142885 ) ) ( not ( = ?auto_142884 ?auto_142886 ) ) ( not ( = ?auto_142884 ?auto_142887 ) ) ( not ( = ?auto_142884 ?auto_142890 ) ) ( not ( = ?auto_142885 ?auto_142886 ) ) ( not ( = ?auto_142885 ?auto_142887 ) ) ( not ( = ?auto_142885 ?auto_142890 ) ) ( not ( = ?auto_142886 ?auto_142887 ) ) ( not ( = ?auto_142886 ?auto_142890 ) ) ( not ( = ?auto_142887 ?auto_142890 ) ) ( not ( = ?auto_142882 ?auto_142889 ) ) ( not ( = ?auto_142883 ?auto_142889 ) ) ( not ( = ?auto_142884 ?auto_142889 ) ) ( not ( = ?auto_142885 ?auto_142889 ) ) ( not ( = ?auto_142886 ?auto_142889 ) ) ( not ( = ?auto_142887 ?auto_142889 ) ) ( not ( = ?auto_142890 ?auto_142889 ) ) ( ON ?auto_142889 ?auto_142888 ) ( not ( = ?auto_142882 ?auto_142888 ) ) ( not ( = ?auto_142883 ?auto_142888 ) ) ( not ( = ?auto_142884 ?auto_142888 ) ) ( not ( = ?auto_142885 ?auto_142888 ) ) ( not ( = ?auto_142886 ?auto_142888 ) ) ( not ( = ?auto_142887 ?auto_142888 ) ) ( not ( = ?auto_142890 ?auto_142888 ) ) ( not ( = ?auto_142889 ?auto_142888 ) ) ( ON ?auto_142890 ?auto_142889 ) ( ON ?auto_142887 ?auto_142890 ) ( ON-TABLE ?auto_142888 ) ( ON ?auto_142886 ?auto_142887 ) ( ON ?auto_142885 ?auto_142886 ) ( ON ?auto_142884 ?auto_142885 ) ( ON ?auto_142883 ?auto_142884 ) ( CLEAR ?auto_142883 ) ( HOLDING ?auto_142882 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_142882 )
      ( MAKE-6PILE ?auto_142882 ?auto_142883 ?auto_142884 ?auto_142885 ?auto_142886 ?auto_142887 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142891 - BLOCK
      ?auto_142892 - BLOCK
      ?auto_142893 - BLOCK
      ?auto_142894 - BLOCK
      ?auto_142895 - BLOCK
      ?auto_142896 - BLOCK
    )
    :vars
    (
      ?auto_142899 - BLOCK
      ?auto_142898 - BLOCK
      ?auto_142897 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142891 ?auto_142892 ) ) ( not ( = ?auto_142891 ?auto_142893 ) ) ( not ( = ?auto_142891 ?auto_142894 ) ) ( not ( = ?auto_142891 ?auto_142895 ) ) ( not ( = ?auto_142891 ?auto_142896 ) ) ( not ( = ?auto_142891 ?auto_142899 ) ) ( not ( = ?auto_142892 ?auto_142893 ) ) ( not ( = ?auto_142892 ?auto_142894 ) ) ( not ( = ?auto_142892 ?auto_142895 ) ) ( not ( = ?auto_142892 ?auto_142896 ) ) ( not ( = ?auto_142892 ?auto_142899 ) ) ( not ( = ?auto_142893 ?auto_142894 ) ) ( not ( = ?auto_142893 ?auto_142895 ) ) ( not ( = ?auto_142893 ?auto_142896 ) ) ( not ( = ?auto_142893 ?auto_142899 ) ) ( not ( = ?auto_142894 ?auto_142895 ) ) ( not ( = ?auto_142894 ?auto_142896 ) ) ( not ( = ?auto_142894 ?auto_142899 ) ) ( not ( = ?auto_142895 ?auto_142896 ) ) ( not ( = ?auto_142895 ?auto_142899 ) ) ( not ( = ?auto_142896 ?auto_142899 ) ) ( not ( = ?auto_142891 ?auto_142898 ) ) ( not ( = ?auto_142892 ?auto_142898 ) ) ( not ( = ?auto_142893 ?auto_142898 ) ) ( not ( = ?auto_142894 ?auto_142898 ) ) ( not ( = ?auto_142895 ?auto_142898 ) ) ( not ( = ?auto_142896 ?auto_142898 ) ) ( not ( = ?auto_142899 ?auto_142898 ) ) ( ON ?auto_142898 ?auto_142897 ) ( not ( = ?auto_142891 ?auto_142897 ) ) ( not ( = ?auto_142892 ?auto_142897 ) ) ( not ( = ?auto_142893 ?auto_142897 ) ) ( not ( = ?auto_142894 ?auto_142897 ) ) ( not ( = ?auto_142895 ?auto_142897 ) ) ( not ( = ?auto_142896 ?auto_142897 ) ) ( not ( = ?auto_142899 ?auto_142897 ) ) ( not ( = ?auto_142898 ?auto_142897 ) ) ( ON ?auto_142899 ?auto_142898 ) ( ON ?auto_142896 ?auto_142899 ) ( ON-TABLE ?auto_142897 ) ( ON ?auto_142895 ?auto_142896 ) ( ON ?auto_142894 ?auto_142895 ) ( ON ?auto_142893 ?auto_142894 ) ( ON ?auto_142892 ?auto_142893 ) ( ON ?auto_142891 ?auto_142892 ) ( CLEAR ?auto_142891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_142897 ?auto_142898 ?auto_142899 ?auto_142896 ?auto_142895 ?auto_142894 ?auto_142893 ?auto_142892 )
      ( MAKE-6PILE ?auto_142891 ?auto_142892 ?auto_142893 ?auto_142894 ?auto_142895 ?auto_142896 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_142902 - BLOCK
      ?auto_142903 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_142903 ) ( CLEAR ?auto_142902 ) ( ON-TABLE ?auto_142902 ) ( not ( = ?auto_142902 ?auto_142903 ) ) )
    :subtasks
    ( ( !STACK ?auto_142903 ?auto_142902 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_142904 - BLOCK
      ?auto_142905 - BLOCK
    )
    :vars
    (
      ?auto_142906 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_142904 ) ( ON-TABLE ?auto_142904 ) ( not ( = ?auto_142904 ?auto_142905 ) ) ( ON ?auto_142905 ?auto_142906 ) ( CLEAR ?auto_142905 ) ( HAND-EMPTY ) ( not ( = ?auto_142904 ?auto_142906 ) ) ( not ( = ?auto_142905 ?auto_142906 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_142905 ?auto_142906 )
      ( MAKE-2PILE ?auto_142904 ?auto_142905 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_142907 - BLOCK
      ?auto_142908 - BLOCK
    )
    :vars
    (
      ?auto_142909 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142907 ?auto_142908 ) ) ( ON ?auto_142908 ?auto_142909 ) ( CLEAR ?auto_142908 ) ( not ( = ?auto_142907 ?auto_142909 ) ) ( not ( = ?auto_142908 ?auto_142909 ) ) ( HOLDING ?auto_142907 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_142907 )
      ( MAKE-2PILE ?auto_142907 ?auto_142908 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_142910 - BLOCK
      ?auto_142911 - BLOCK
    )
    :vars
    (
      ?auto_142912 - BLOCK
      ?auto_142915 - BLOCK
      ?auto_142914 - BLOCK
      ?auto_142916 - BLOCK
      ?auto_142917 - BLOCK
      ?auto_142913 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142910 ?auto_142911 ) ) ( ON ?auto_142911 ?auto_142912 ) ( not ( = ?auto_142910 ?auto_142912 ) ) ( not ( = ?auto_142911 ?auto_142912 ) ) ( ON ?auto_142910 ?auto_142911 ) ( CLEAR ?auto_142910 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_142915 ) ( ON ?auto_142914 ?auto_142915 ) ( ON ?auto_142916 ?auto_142914 ) ( ON ?auto_142917 ?auto_142916 ) ( ON ?auto_142913 ?auto_142917 ) ( ON ?auto_142912 ?auto_142913 ) ( not ( = ?auto_142915 ?auto_142914 ) ) ( not ( = ?auto_142915 ?auto_142916 ) ) ( not ( = ?auto_142915 ?auto_142917 ) ) ( not ( = ?auto_142915 ?auto_142913 ) ) ( not ( = ?auto_142915 ?auto_142912 ) ) ( not ( = ?auto_142915 ?auto_142911 ) ) ( not ( = ?auto_142915 ?auto_142910 ) ) ( not ( = ?auto_142914 ?auto_142916 ) ) ( not ( = ?auto_142914 ?auto_142917 ) ) ( not ( = ?auto_142914 ?auto_142913 ) ) ( not ( = ?auto_142914 ?auto_142912 ) ) ( not ( = ?auto_142914 ?auto_142911 ) ) ( not ( = ?auto_142914 ?auto_142910 ) ) ( not ( = ?auto_142916 ?auto_142917 ) ) ( not ( = ?auto_142916 ?auto_142913 ) ) ( not ( = ?auto_142916 ?auto_142912 ) ) ( not ( = ?auto_142916 ?auto_142911 ) ) ( not ( = ?auto_142916 ?auto_142910 ) ) ( not ( = ?auto_142917 ?auto_142913 ) ) ( not ( = ?auto_142917 ?auto_142912 ) ) ( not ( = ?auto_142917 ?auto_142911 ) ) ( not ( = ?auto_142917 ?auto_142910 ) ) ( not ( = ?auto_142913 ?auto_142912 ) ) ( not ( = ?auto_142913 ?auto_142911 ) ) ( not ( = ?auto_142913 ?auto_142910 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_142915 ?auto_142914 ?auto_142916 ?auto_142917 ?auto_142913 ?auto_142912 ?auto_142911 )
      ( MAKE-2PILE ?auto_142910 ?auto_142911 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_142918 - BLOCK
      ?auto_142919 - BLOCK
    )
    :vars
    (
      ?auto_142921 - BLOCK
      ?auto_142922 - BLOCK
      ?auto_142924 - BLOCK
      ?auto_142925 - BLOCK
      ?auto_142923 - BLOCK
      ?auto_142920 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142918 ?auto_142919 ) ) ( ON ?auto_142919 ?auto_142921 ) ( not ( = ?auto_142918 ?auto_142921 ) ) ( not ( = ?auto_142919 ?auto_142921 ) ) ( ON-TABLE ?auto_142922 ) ( ON ?auto_142924 ?auto_142922 ) ( ON ?auto_142925 ?auto_142924 ) ( ON ?auto_142923 ?auto_142925 ) ( ON ?auto_142920 ?auto_142923 ) ( ON ?auto_142921 ?auto_142920 ) ( not ( = ?auto_142922 ?auto_142924 ) ) ( not ( = ?auto_142922 ?auto_142925 ) ) ( not ( = ?auto_142922 ?auto_142923 ) ) ( not ( = ?auto_142922 ?auto_142920 ) ) ( not ( = ?auto_142922 ?auto_142921 ) ) ( not ( = ?auto_142922 ?auto_142919 ) ) ( not ( = ?auto_142922 ?auto_142918 ) ) ( not ( = ?auto_142924 ?auto_142925 ) ) ( not ( = ?auto_142924 ?auto_142923 ) ) ( not ( = ?auto_142924 ?auto_142920 ) ) ( not ( = ?auto_142924 ?auto_142921 ) ) ( not ( = ?auto_142924 ?auto_142919 ) ) ( not ( = ?auto_142924 ?auto_142918 ) ) ( not ( = ?auto_142925 ?auto_142923 ) ) ( not ( = ?auto_142925 ?auto_142920 ) ) ( not ( = ?auto_142925 ?auto_142921 ) ) ( not ( = ?auto_142925 ?auto_142919 ) ) ( not ( = ?auto_142925 ?auto_142918 ) ) ( not ( = ?auto_142923 ?auto_142920 ) ) ( not ( = ?auto_142923 ?auto_142921 ) ) ( not ( = ?auto_142923 ?auto_142919 ) ) ( not ( = ?auto_142923 ?auto_142918 ) ) ( not ( = ?auto_142920 ?auto_142921 ) ) ( not ( = ?auto_142920 ?auto_142919 ) ) ( not ( = ?auto_142920 ?auto_142918 ) ) ( HOLDING ?auto_142918 ) ( CLEAR ?auto_142919 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_142922 ?auto_142924 ?auto_142925 ?auto_142923 ?auto_142920 ?auto_142921 ?auto_142919 ?auto_142918 )
      ( MAKE-2PILE ?auto_142918 ?auto_142919 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_142926 - BLOCK
      ?auto_142927 - BLOCK
    )
    :vars
    (
      ?auto_142930 - BLOCK
      ?auto_142928 - BLOCK
      ?auto_142929 - BLOCK
      ?auto_142931 - BLOCK
      ?auto_142932 - BLOCK
      ?auto_142933 - BLOCK
      ?auto_142934 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142926 ?auto_142927 ) ) ( ON ?auto_142927 ?auto_142930 ) ( not ( = ?auto_142926 ?auto_142930 ) ) ( not ( = ?auto_142927 ?auto_142930 ) ) ( ON-TABLE ?auto_142928 ) ( ON ?auto_142929 ?auto_142928 ) ( ON ?auto_142931 ?auto_142929 ) ( ON ?auto_142932 ?auto_142931 ) ( ON ?auto_142933 ?auto_142932 ) ( ON ?auto_142930 ?auto_142933 ) ( not ( = ?auto_142928 ?auto_142929 ) ) ( not ( = ?auto_142928 ?auto_142931 ) ) ( not ( = ?auto_142928 ?auto_142932 ) ) ( not ( = ?auto_142928 ?auto_142933 ) ) ( not ( = ?auto_142928 ?auto_142930 ) ) ( not ( = ?auto_142928 ?auto_142927 ) ) ( not ( = ?auto_142928 ?auto_142926 ) ) ( not ( = ?auto_142929 ?auto_142931 ) ) ( not ( = ?auto_142929 ?auto_142932 ) ) ( not ( = ?auto_142929 ?auto_142933 ) ) ( not ( = ?auto_142929 ?auto_142930 ) ) ( not ( = ?auto_142929 ?auto_142927 ) ) ( not ( = ?auto_142929 ?auto_142926 ) ) ( not ( = ?auto_142931 ?auto_142932 ) ) ( not ( = ?auto_142931 ?auto_142933 ) ) ( not ( = ?auto_142931 ?auto_142930 ) ) ( not ( = ?auto_142931 ?auto_142927 ) ) ( not ( = ?auto_142931 ?auto_142926 ) ) ( not ( = ?auto_142932 ?auto_142933 ) ) ( not ( = ?auto_142932 ?auto_142930 ) ) ( not ( = ?auto_142932 ?auto_142927 ) ) ( not ( = ?auto_142932 ?auto_142926 ) ) ( not ( = ?auto_142933 ?auto_142930 ) ) ( not ( = ?auto_142933 ?auto_142927 ) ) ( not ( = ?auto_142933 ?auto_142926 ) ) ( CLEAR ?auto_142927 ) ( ON ?auto_142926 ?auto_142934 ) ( CLEAR ?auto_142926 ) ( HAND-EMPTY ) ( not ( = ?auto_142926 ?auto_142934 ) ) ( not ( = ?auto_142927 ?auto_142934 ) ) ( not ( = ?auto_142930 ?auto_142934 ) ) ( not ( = ?auto_142928 ?auto_142934 ) ) ( not ( = ?auto_142929 ?auto_142934 ) ) ( not ( = ?auto_142931 ?auto_142934 ) ) ( not ( = ?auto_142932 ?auto_142934 ) ) ( not ( = ?auto_142933 ?auto_142934 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_142926 ?auto_142934 )
      ( MAKE-2PILE ?auto_142926 ?auto_142927 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_142935 - BLOCK
      ?auto_142936 - BLOCK
    )
    :vars
    (
      ?auto_142937 - BLOCK
      ?auto_142943 - BLOCK
      ?auto_142942 - BLOCK
      ?auto_142938 - BLOCK
      ?auto_142939 - BLOCK
      ?auto_142941 - BLOCK
      ?auto_142940 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142935 ?auto_142936 ) ) ( not ( = ?auto_142935 ?auto_142937 ) ) ( not ( = ?auto_142936 ?auto_142937 ) ) ( ON-TABLE ?auto_142943 ) ( ON ?auto_142942 ?auto_142943 ) ( ON ?auto_142938 ?auto_142942 ) ( ON ?auto_142939 ?auto_142938 ) ( ON ?auto_142941 ?auto_142939 ) ( ON ?auto_142937 ?auto_142941 ) ( not ( = ?auto_142943 ?auto_142942 ) ) ( not ( = ?auto_142943 ?auto_142938 ) ) ( not ( = ?auto_142943 ?auto_142939 ) ) ( not ( = ?auto_142943 ?auto_142941 ) ) ( not ( = ?auto_142943 ?auto_142937 ) ) ( not ( = ?auto_142943 ?auto_142936 ) ) ( not ( = ?auto_142943 ?auto_142935 ) ) ( not ( = ?auto_142942 ?auto_142938 ) ) ( not ( = ?auto_142942 ?auto_142939 ) ) ( not ( = ?auto_142942 ?auto_142941 ) ) ( not ( = ?auto_142942 ?auto_142937 ) ) ( not ( = ?auto_142942 ?auto_142936 ) ) ( not ( = ?auto_142942 ?auto_142935 ) ) ( not ( = ?auto_142938 ?auto_142939 ) ) ( not ( = ?auto_142938 ?auto_142941 ) ) ( not ( = ?auto_142938 ?auto_142937 ) ) ( not ( = ?auto_142938 ?auto_142936 ) ) ( not ( = ?auto_142938 ?auto_142935 ) ) ( not ( = ?auto_142939 ?auto_142941 ) ) ( not ( = ?auto_142939 ?auto_142937 ) ) ( not ( = ?auto_142939 ?auto_142936 ) ) ( not ( = ?auto_142939 ?auto_142935 ) ) ( not ( = ?auto_142941 ?auto_142937 ) ) ( not ( = ?auto_142941 ?auto_142936 ) ) ( not ( = ?auto_142941 ?auto_142935 ) ) ( ON ?auto_142935 ?auto_142940 ) ( CLEAR ?auto_142935 ) ( not ( = ?auto_142935 ?auto_142940 ) ) ( not ( = ?auto_142936 ?auto_142940 ) ) ( not ( = ?auto_142937 ?auto_142940 ) ) ( not ( = ?auto_142943 ?auto_142940 ) ) ( not ( = ?auto_142942 ?auto_142940 ) ) ( not ( = ?auto_142938 ?auto_142940 ) ) ( not ( = ?auto_142939 ?auto_142940 ) ) ( not ( = ?auto_142941 ?auto_142940 ) ) ( HOLDING ?auto_142936 ) ( CLEAR ?auto_142937 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_142943 ?auto_142942 ?auto_142938 ?auto_142939 ?auto_142941 ?auto_142937 ?auto_142936 )
      ( MAKE-2PILE ?auto_142935 ?auto_142936 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_142944 - BLOCK
      ?auto_142945 - BLOCK
    )
    :vars
    (
      ?auto_142948 - BLOCK
      ?auto_142950 - BLOCK
      ?auto_142951 - BLOCK
      ?auto_142949 - BLOCK
      ?auto_142947 - BLOCK
      ?auto_142946 - BLOCK
      ?auto_142952 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142944 ?auto_142945 ) ) ( not ( = ?auto_142944 ?auto_142948 ) ) ( not ( = ?auto_142945 ?auto_142948 ) ) ( ON-TABLE ?auto_142950 ) ( ON ?auto_142951 ?auto_142950 ) ( ON ?auto_142949 ?auto_142951 ) ( ON ?auto_142947 ?auto_142949 ) ( ON ?auto_142946 ?auto_142947 ) ( ON ?auto_142948 ?auto_142946 ) ( not ( = ?auto_142950 ?auto_142951 ) ) ( not ( = ?auto_142950 ?auto_142949 ) ) ( not ( = ?auto_142950 ?auto_142947 ) ) ( not ( = ?auto_142950 ?auto_142946 ) ) ( not ( = ?auto_142950 ?auto_142948 ) ) ( not ( = ?auto_142950 ?auto_142945 ) ) ( not ( = ?auto_142950 ?auto_142944 ) ) ( not ( = ?auto_142951 ?auto_142949 ) ) ( not ( = ?auto_142951 ?auto_142947 ) ) ( not ( = ?auto_142951 ?auto_142946 ) ) ( not ( = ?auto_142951 ?auto_142948 ) ) ( not ( = ?auto_142951 ?auto_142945 ) ) ( not ( = ?auto_142951 ?auto_142944 ) ) ( not ( = ?auto_142949 ?auto_142947 ) ) ( not ( = ?auto_142949 ?auto_142946 ) ) ( not ( = ?auto_142949 ?auto_142948 ) ) ( not ( = ?auto_142949 ?auto_142945 ) ) ( not ( = ?auto_142949 ?auto_142944 ) ) ( not ( = ?auto_142947 ?auto_142946 ) ) ( not ( = ?auto_142947 ?auto_142948 ) ) ( not ( = ?auto_142947 ?auto_142945 ) ) ( not ( = ?auto_142947 ?auto_142944 ) ) ( not ( = ?auto_142946 ?auto_142948 ) ) ( not ( = ?auto_142946 ?auto_142945 ) ) ( not ( = ?auto_142946 ?auto_142944 ) ) ( ON ?auto_142944 ?auto_142952 ) ( not ( = ?auto_142944 ?auto_142952 ) ) ( not ( = ?auto_142945 ?auto_142952 ) ) ( not ( = ?auto_142948 ?auto_142952 ) ) ( not ( = ?auto_142950 ?auto_142952 ) ) ( not ( = ?auto_142951 ?auto_142952 ) ) ( not ( = ?auto_142949 ?auto_142952 ) ) ( not ( = ?auto_142947 ?auto_142952 ) ) ( not ( = ?auto_142946 ?auto_142952 ) ) ( CLEAR ?auto_142948 ) ( ON ?auto_142945 ?auto_142944 ) ( CLEAR ?auto_142945 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_142952 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_142952 ?auto_142944 )
      ( MAKE-2PILE ?auto_142944 ?auto_142945 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_142953 - BLOCK
      ?auto_142954 - BLOCK
    )
    :vars
    (
      ?auto_142961 - BLOCK
      ?auto_142958 - BLOCK
      ?auto_142957 - BLOCK
      ?auto_142960 - BLOCK
      ?auto_142955 - BLOCK
      ?auto_142956 - BLOCK
      ?auto_142959 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142953 ?auto_142954 ) ) ( not ( = ?auto_142953 ?auto_142961 ) ) ( not ( = ?auto_142954 ?auto_142961 ) ) ( ON-TABLE ?auto_142958 ) ( ON ?auto_142957 ?auto_142958 ) ( ON ?auto_142960 ?auto_142957 ) ( ON ?auto_142955 ?auto_142960 ) ( ON ?auto_142956 ?auto_142955 ) ( not ( = ?auto_142958 ?auto_142957 ) ) ( not ( = ?auto_142958 ?auto_142960 ) ) ( not ( = ?auto_142958 ?auto_142955 ) ) ( not ( = ?auto_142958 ?auto_142956 ) ) ( not ( = ?auto_142958 ?auto_142961 ) ) ( not ( = ?auto_142958 ?auto_142954 ) ) ( not ( = ?auto_142958 ?auto_142953 ) ) ( not ( = ?auto_142957 ?auto_142960 ) ) ( not ( = ?auto_142957 ?auto_142955 ) ) ( not ( = ?auto_142957 ?auto_142956 ) ) ( not ( = ?auto_142957 ?auto_142961 ) ) ( not ( = ?auto_142957 ?auto_142954 ) ) ( not ( = ?auto_142957 ?auto_142953 ) ) ( not ( = ?auto_142960 ?auto_142955 ) ) ( not ( = ?auto_142960 ?auto_142956 ) ) ( not ( = ?auto_142960 ?auto_142961 ) ) ( not ( = ?auto_142960 ?auto_142954 ) ) ( not ( = ?auto_142960 ?auto_142953 ) ) ( not ( = ?auto_142955 ?auto_142956 ) ) ( not ( = ?auto_142955 ?auto_142961 ) ) ( not ( = ?auto_142955 ?auto_142954 ) ) ( not ( = ?auto_142955 ?auto_142953 ) ) ( not ( = ?auto_142956 ?auto_142961 ) ) ( not ( = ?auto_142956 ?auto_142954 ) ) ( not ( = ?auto_142956 ?auto_142953 ) ) ( ON ?auto_142953 ?auto_142959 ) ( not ( = ?auto_142953 ?auto_142959 ) ) ( not ( = ?auto_142954 ?auto_142959 ) ) ( not ( = ?auto_142961 ?auto_142959 ) ) ( not ( = ?auto_142958 ?auto_142959 ) ) ( not ( = ?auto_142957 ?auto_142959 ) ) ( not ( = ?auto_142960 ?auto_142959 ) ) ( not ( = ?auto_142955 ?auto_142959 ) ) ( not ( = ?auto_142956 ?auto_142959 ) ) ( ON ?auto_142954 ?auto_142953 ) ( CLEAR ?auto_142954 ) ( ON-TABLE ?auto_142959 ) ( HOLDING ?auto_142961 ) ( CLEAR ?auto_142956 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_142958 ?auto_142957 ?auto_142960 ?auto_142955 ?auto_142956 ?auto_142961 )
      ( MAKE-2PILE ?auto_142953 ?auto_142954 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_142962 - BLOCK
      ?auto_142963 - BLOCK
    )
    :vars
    (
      ?auto_142967 - BLOCK
      ?auto_142964 - BLOCK
      ?auto_142969 - BLOCK
      ?auto_142970 - BLOCK
      ?auto_142965 - BLOCK
      ?auto_142966 - BLOCK
      ?auto_142968 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142962 ?auto_142963 ) ) ( not ( = ?auto_142962 ?auto_142967 ) ) ( not ( = ?auto_142963 ?auto_142967 ) ) ( ON-TABLE ?auto_142964 ) ( ON ?auto_142969 ?auto_142964 ) ( ON ?auto_142970 ?auto_142969 ) ( ON ?auto_142965 ?auto_142970 ) ( ON ?auto_142966 ?auto_142965 ) ( not ( = ?auto_142964 ?auto_142969 ) ) ( not ( = ?auto_142964 ?auto_142970 ) ) ( not ( = ?auto_142964 ?auto_142965 ) ) ( not ( = ?auto_142964 ?auto_142966 ) ) ( not ( = ?auto_142964 ?auto_142967 ) ) ( not ( = ?auto_142964 ?auto_142963 ) ) ( not ( = ?auto_142964 ?auto_142962 ) ) ( not ( = ?auto_142969 ?auto_142970 ) ) ( not ( = ?auto_142969 ?auto_142965 ) ) ( not ( = ?auto_142969 ?auto_142966 ) ) ( not ( = ?auto_142969 ?auto_142967 ) ) ( not ( = ?auto_142969 ?auto_142963 ) ) ( not ( = ?auto_142969 ?auto_142962 ) ) ( not ( = ?auto_142970 ?auto_142965 ) ) ( not ( = ?auto_142970 ?auto_142966 ) ) ( not ( = ?auto_142970 ?auto_142967 ) ) ( not ( = ?auto_142970 ?auto_142963 ) ) ( not ( = ?auto_142970 ?auto_142962 ) ) ( not ( = ?auto_142965 ?auto_142966 ) ) ( not ( = ?auto_142965 ?auto_142967 ) ) ( not ( = ?auto_142965 ?auto_142963 ) ) ( not ( = ?auto_142965 ?auto_142962 ) ) ( not ( = ?auto_142966 ?auto_142967 ) ) ( not ( = ?auto_142966 ?auto_142963 ) ) ( not ( = ?auto_142966 ?auto_142962 ) ) ( ON ?auto_142962 ?auto_142968 ) ( not ( = ?auto_142962 ?auto_142968 ) ) ( not ( = ?auto_142963 ?auto_142968 ) ) ( not ( = ?auto_142967 ?auto_142968 ) ) ( not ( = ?auto_142964 ?auto_142968 ) ) ( not ( = ?auto_142969 ?auto_142968 ) ) ( not ( = ?auto_142970 ?auto_142968 ) ) ( not ( = ?auto_142965 ?auto_142968 ) ) ( not ( = ?auto_142966 ?auto_142968 ) ) ( ON ?auto_142963 ?auto_142962 ) ( ON-TABLE ?auto_142968 ) ( CLEAR ?auto_142966 ) ( ON ?auto_142967 ?auto_142963 ) ( CLEAR ?auto_142967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_142968 ?auto_142962 ?auto_142963 )
      ( MAKE-2PILE ?auto_142962 ?auto_142963 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_142971 - BLOCK
      ?auto_142972 - BLOCK
    )
    :vars
    (
      ?auto_142979 - BLOCK
      ?auto_142975 - BLOCK
      ?auto_142978 - BLOCK
      ?auto_142976 - BLOCK
      ?auto_142973 - BLOCK
      ?auto_142974 - BLOCK
      ?auto_142977 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142971 ?auto_142972 ) ) ( not ( = ?auto_142971 ?auto_142979 ) ) ( not ( = ?auto_142972 ?auto_142979 ) ) ( ON-TABLE ?auto_142975 ) ( ON ?auto_142978 ?auto_142975 ) ( ON ?auto_142976 ?auto_142978 ) ( ON ?auto_142973 ?auto_142976 ) ( not ( = ?auto_142975 ?auto_142978 ) ) ( not ( = ?auto_142975 ?auto_142976 ) ) ( not ( = ?auto_142975 ?auto_142973 ) ) ( not ( = ?auto_142975 ?auto_142974 ) ) ( not ( = ?auto_142975 ?auto_142979 ) ) ( not ( = ?auto_142975 ?auto_142972 ) ) ( not ( = ?auto_142975 ?auto_142971 ) ) ( not ( = ?auto_142978 ?auto_142976 ) ) ( not ( = ?auto_142978 ?auto_142973 ) ) ( not ( = ?auto_142978 ?auto_142974 ) ) ( not ( = ?auto_142978 ?auto_142979 ) ) ( not ( = ?auto_142978 ?auto_142972 ) ) ( not ( = ?auto_142978 ?auto_142971 ) ) ( not ( = ?auto_142976 ?auto_142973 ) ) ( not ( = ?auto_142976 ?auto_142974 ) ) ( not ( = ?auto_142976 ?auto_142979 ) ) ( not ( = ?auto_142976 ?auto_142972 ) ) ( not ( = ?auto_142976 ?auto_142971 ) ) ( not ( = ?auto_142973 ?auto_142974 ) ) ( not ( = ?auto_142973 ?auto_142979 ) ) ( not ( = ?auto_142973 ?auto_142972 ) ) ( not ( = ?auto_142973 ?auto_142971 ) ) ( not ( = ?auto_142974 ?auto_142979 ) ) ( not ( = ?auto_142974 ?auto_142972 ) ) ( not ( = ?auto_142974 ?auto_142971 ) ) ( ON ?auto_142971 ?auto_142977 ) ( not ( = ?auto_142971 ?auto_142977 ) ) ( not ( = ?auto_142972 ?auto_142977 ) ) ( not ( = ?auto_142979 ?auto_142977 ) ) ( not ( = ?auto_142975 ?auto_142977 ) ) ( not ( = ?auto_142978 ?auto_142977 ) ) ( not ( = ?auto_142976 ?auto_142977 ) ) ( not ( = ?auto_142973 ?auto_142977 ) ) ( not ( = ?auto_142974 ?auto_142977 ) ) ( ON ?auto_142972 ?auto_142971 ) ( ON-TABLE ?auto_142977 ) ( ON ?auto_142979 ?auto_142972 ) ( CLEAR ?auto_142979 ) ( HOLDING ?auto_142974 ) ( CLEAR ?auto_142973 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_142975 ?auto_142978 ?auto_142976 ?auto_142973 ?auto_142974 )
      ( MAKE-2PILE ?auto_142971 ?auto_142972 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_142980 - BLOCK
      ?auto_142981 - BLOCK
    )
    :vars
    (
      ?auto_142986 - BLOCK
      ?auto_142988 - BLOCK
      ?auto_142985 - BLOCK
      ?auto_142982 - BLOCK
      ?auto_142984 - BLOCK
      ?auto_142987 - BLOCK
      ?auto_142983 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142980 ?auto_142981 ) ) ( not ( = ?auto_142980 ?auto_142986 ) ) ( not ( = ?auto_142981 ?auto_142986 ) ) ( ON-TABLE ?auto_142988 ) ( ON ?auto_142985 ?auto_142988 ) ( ON ?auto_142982 ?auto_142985 ) ( ON ?auto_142984 ?auto_142982 ) ( not ( = ?auto_142988 ?auto_142985 ) ) ( not ( = ?auto_142988 ?auto_142982 ) ) ( not ( = ?auto_142988 ?auto_142984 ) ) ( not ( = ?auto_142988 ?auto_142987 ) ) ( not ( = ?auto_142988 ?auto_142986 ) ) ( not ( = ?auto_142988 ?auto_142981 ) ) ( not ( = ?auto_142988 ?auto_142980 ) ) ( not ( = ?auto_142985 ?auto_142982 ) ) ( not ( = ?auto_142985 ?auto_142984 ) ) ( not ( = ?auto_142985 ?auto_142987 ) ) ( not ( = ?auto_142985 ?auto_142986 ) ) ( not ( = ?auto_142985 ?auto_142981 ) ) ( not ( = ?auto_142985 ?auto_142980 ) ) ( not ( = ?auto_142982 ?auto_142984 ) ) ( not ( = ?auto_142982 ?auto_142987 ) ) ( not ( = ?auto_142982 ?auto_142986 ) ) ( not ( = ?auto_142982 ?auto_142981 ) ) ( not ( = ?auto_142982 ?auto_142980 ) ) ( not ( = ?auto_142984 ?auto_142987 ) ) ( not ( = ?auto_142984 ?auto_142986 ) ) ( not ( = ?auto_142984 ?auto_142981 ) ) ( not ( = ?auto_142984 ?auto_142980 ) ) ( not ( = ?auto_142987 ?auto_142986 ) ) ( not ( = ?auto_142987 ?auto_142981 ) ) ( not ( = ?auto_142987 ?auto_142980 ) ) ( ON ?auto_142980 ?auto_142983 ) ( not ( = ?auto_142980 ?auto_142983 ) ) ( not ( = ?auto_142981 ?auto_142983 ) ) ( not ( = ?auto_142986 ?auto_142983 ) ) ( not ( = ?auto_142988 ?auto_142983 ) ) ( not ( = ?auto_142985 ?auto_142983 ) ) ( not ( = ?auto_142982 ?auto_142983 ) ) ( not ( = ?auto_142984 ?auto_142983 ) ) ( not ( = ?auto_142987 ?auto_142983 ) ) ( ON ?auto_142981 ?auto_142980 ) ( ON-TABLE ?auto_142983 ) ( ON ?auto_142986 ?auto_142981 ) ( CLEAR ?auto_142984 ) ( ON ?auto_142987 ?auto_142986 ) ( CLEAR ?auto_142987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_142983 ?auto_142980 ?auto_142981 ?auto_142986 )
      ( MAKE-2PILE ?auto_142980 ?auto_142981 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_142989 - BLOCK
      ?auto_142990 - BLOCK
    )
    :vars
    (
      ?auto_142996 - BLOCK
      ?auto_142993 - BLOCK
      ?auto_142992 - BLOCK
      ?auto_142994 - BLOCK
      ?auto_142991 - BLOCK
      ?auto_142995 - BLOCK
      ?auto_142997 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142989 ?auto_142990 ) ) ( not ( = ?auto_142989 ?auto_142996 ) ) ( not ( = ?auto_142990 ?auto_142996 ) ) ( ON-TABLE ?auto_142993 ) ( ON ?auto_142992 ?auto_142993 ) ( ON ?auto_142994 ?auto_142992 ) ( not ( = ?auto_142993 ?auto_142992 ) ) ( not ( = ?auto_142993 ?auto_142994 ) ) ( not ( = ?auto_142993 ?auto_142991 ) ) ( not ( = ?auto_142993 ?auto_142995 ) ) ( not ( = ?auto_142993 ?auto_142996 ) ) ( not ( = ?auto_142993 ?auto_142990 ) ) ( not ( = ?auto_142993 ?auto_142989 ) ) ( not ( = ?auto_142992 ?auto_142994 ) ) ( not ( = ?auto_142992 ?auto_142991 ) ) ( not ( = ?auto_142992 ?auto_142995 ) ) ( not ( = ?auto_142992 ?auto_142996 ) ) ( not ( = ?auto_142992 ?auto_142990 ) ) ( not ( = ?auto_142992 ?auto_142989 ) ) ( not ( = ?auto_142994 ?auto_142991 ) ) ( not ( = ?auto_142994 ?auto_142995 ) ) ( not ( = ?auto_142994 ?auto_142996 ) ) ( not ( = ?auto_142994 ?auto_142990 ) ) ( not ( = ?auto_142994 ?auto_142989 ) ) ( not ( = ?auto_142991 ?auto_142995 ) ) ( not ( = ?auto_142991 ?auto_142996 ) ) ( not ( = ?auto_142991 ?auto_142990 ) ) ( not ( = ?auto_142991 ?auto_142989 ) ) ( not ( = ?auto_142995 ?auto_142996 ) ) ( not ( = ?auto_142995 ?auto_142990 ) ) ( not ( = ?auto_142995 ?auto_142989 ) ) ( ON ?auto_142989 ?auto_142997 ) ( not ( = ?auto_142989 ?auto_142997 ) ) ( not ( = ?auto_142990 ?auto_142997 ) ) ( not ( = ?auto_142996 ?auto_142997 ) ) ( not ( = ?auto_142993 ?auto_142997 ) ) ( not ( = ?auto_142992 ?auto_142997 ) ) ( not ( = ?auto_142994 ?auto_142997 ) ) ( not ( = ?auto_142991 ?auto_142997 ) ) ( not ( = ?auto_142995 ?auto_142997 ) ) ( ON ?auto_142990 ?auto_142989 ) ( ON-TABLE ?auto_142997 ) ( ON ?auto_142996 ?auto_142990 ) ( ON ?auto_142995 ?auto_142996 ) ( CLEAR ?auto_142995 ) ( HOLDING ?auto_142991 ) ( CLEAR ?auto_142994 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_142993 ?auto_142992 ?auto_142994 ?auto_142991 )
      ( MAKE-2PILE ?auto_142989 ?auto_142990 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_142998 - BLOCK
      ?auto_142999 - BLOCK
    )
    :vars
    (
      ?auto_143006 - BLOCK
      ?auto_143004 - BLOCK
      ?auto_143000 - BLOCK
      ?auto_143005 - BLOCK
      ?auto_143002 - BLOCK
      ?auto_143001 - BLOCK
      ?auto_143003 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142998 ?auto_142999 ) ) ( not ( = ?auto_142998 ?auto_143006 ) ) ( not ( = ?auto_142999 ?auto_143006 ) ) ( ON-TABLE ?auto_143004 ) ( ON ?auto_143000 ?auto_143004 ) ( ON ?auto_143005 ?auto_143000 ) ( not ( = ?auto_143004 ?auto_143000 ) ) ( not ( = ?auto_143004 ?auto_143005 ) ) ( not ( = ?auto_143004 ?auto_143002 ) ) ( not ( = ?auto_143004 ?auto_143001 ) ) ( not ( = ?auto_143004 ?auto_143006 ) ) ( not ( = ?auto_143004 ?auto_142999 ) ) ( not ( = ?auto_143004 ?auto_142998 ) ) ( not ( = ?auto_143000 ?auto_143005 ) ) ( not ( = ?auto_143000 ?auto_143002 ) ) ( not ( = ?auto_143000 ?auto_143001 ) ) ( not ( = ?auto_143000 ?auto_143006 ) ) ( not ( = ?auto_143000 ?auto_142999 ) ) ( not ( = ?auto_143000 ?auto_142998 ) ) ( not ( = ?auto_143005 ?auto_143002 ) ) ( not ( = ?auto_143005 ?auto_143001 ) ) ( not ( = ?auto_143005 ?auto_143006 ) ) ( not ( = ?auto_143005 ?auto_142999 ) ) ( not ( = ?auto_143005 ?auto_142998 ) ) ( not ( = ?auto_143002 ?auto_143001 ) ) ( not ( = ?auto_143002 ?auto_143006 ) ) ( not ( = ?auto_143002 ?auto_142999 ) ) ( not ( = ?auto_143002 ?auto_142998 ) ) ( not ( = ?auto_143001 ?auto_143006 ) ) ( not ( = ?auto_143001 ?auto_142999 ) ) ( not ( = ?auto_143001 ?auto_142998 ) ) ( ON ?auto_142998 ?auto_143003 ) ( not ( = ?auto_142998 ?auto_143003 ) ) ( not ( = ?auto_142999 ?auto_143003 ) ) ( not ( = ?auto_143006 ?auto_143003 ) ) ( not ( = ?auto_143004 ?auto_143003 ) ) ( not ( = ?auto_143000 ?auto_143003 ) ) ( not ( = ?auto_143005 ?auto_143003 ) ) ( not ( = ?auto_143002 ?auto_143003 ) ) ( not ( = ?auto_143001 ?auto_143003 ) ) ( ON ?auto_142999 ?auto_142998 ) ( ON-TABLE ?auto_143003 ) ( ON ?auto_143006 ?auto_142999 ) ( ON ?auto_143001 ?auto_143006 ) ( CLEAR ?auto_143005 ) ( ON ?auto_143002 ?auto_143001 ) ( CLEAR ?auto_143002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_143003 ?auto_142998 ?auto_142999 ?auto_143006 ?auto_143001 )
      ( MAKE-2PILE ?auto_142998 ?auto_142999 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_143007 - BLOCK
      ?auto_143008 - BLOCK
    )
    :vars
    (
      ?auto_143012 - BLOCK
      ?auto_143011 - BLOCK
      ?auto_143015 - BLOCK
      ?auto_143009 - BLOCK
      ?auto_143010 - BLOCK
      ?auto_143013 - BLOCK
      ?auto_143014 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143007 ?auto_143008 ) ) ( not ( = ?auto_143007 ?auto_143012 ) ) ( not ( = ?auto_143008 ?auto_143012 ) ) ( ON-TABLE ?auto_143011 ) ( ON ?auto_143015 ?auto_143011 ) ( not ( = ?auto_143011 ?auto_143015 ) ) ( not ( = ?auto_143011 ?auto_143009 ) ) ( not ( = ?auto_143011 ?auto_143010 ) ) ( not ( = ?auto_143011 ?auto_143013 ) ) ( not ( = ?auto_143011 ?auto_143012 ) ) ( not ( = ?auto_143011 ?auto_143008 ) ) ( not ( = ?auto_143011 ?auto_143007 ) ) ( not ( = ?auto_143015 ?auto_143009 ) ) ( not ( = ?auto_143015 ?auto_143010 ) ) ( not ( = ?auto_143015 ?auto_143013 ) ) ( not ( = ?auto_143015 ?auto_143012 ) ) ( not ( = ?auto_143015 ?auto_143008 ) ) ( not ( = ?auto_143015 ?auto_143007 ) ) ( not ( = ?auto_143009 ?auto_143010 ) ) ( not ( = ?auto_143009 ?auto_143013 ) ) ( not ( = ?auto_143009 ?auto_143012 ) ) ( not ( = ?auto_143009 ?auto_143008 ) ) ( not ( = ?auto_143009 ?auto_143007 ) ) ( not ( = ?auto_143010 ?auto_143013 ) ) ( not ( = ?auto_143010 ?auto_143012 ) ) ( not ( = ?auto_143010 ?auto_143008 ) ) ( not ( = ?auto_143010 ?auto_143007 ) ) ( not ( = ?auto_143013 ?auto_143012 ) ) ( not ( = ?auto_143013 ?auto_143008 ) ) ( not ( = ?auto_143013 ?auto_143007 ) ) ( ON ?auto_143007 ?auto_143014 ) ( not ( = ?auto_143007 ?auto_143014 ) ) ( not ( = ?auto_143008 ?auto_143014 ) ) ( not ( = ?auto_143012 ?auto_143014 ) ) ( not ( = ?auto_143011 ?auto_143014 ) ) ( not ( = ?auto_143015 ?auto_143014 ) ) ( not ( = ?auto_143009 ?auto_143014 ) ) ( not ( = ?auto_143010 ?auto_143014 ) ) ( not ( = ?auto_143013 ?auto_143014 ) ) ( ON ?auto_143008 ?auto_143007 ) ( ON-TABLE ?auto_143014 ) ( ON ?auto_143012 ?auto_143008 ) ( ON ?auto_143013 ?auto_143012 ) ( ON ?auto_143010 ?auto_143013 ) ( CLEAR ?auto_143010 ) ( HOLDING ?auto_143009 ) ( CLEAR ?auto_143015 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_143011 ?auto_143015 ?auto_143009 )
      ( MAKE-2PILE ?auto_143007 ?auto_143008 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_143016 - BLOCK
      ?auto_143017 - BLOCK
    )
    :vars
    (
      ?auto_143022 - BLOCK
      ?auto_143021 - BLOCK
      ?auto_143020 - BLOCK
      ?auto_143019 - BLOCK
      ?auto_143024 - BLOCK
      ?auto_143018 - BLOCK
      ?auto_143023 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143016 ?auto_143017 ) ) ( not ( = ?auto_143016 ?auto_143022 ) ) ( not ( = ?auto_143017 ?auto_143022 ) ) ( ON-TABLE ?auto_143021 ) ( ON ?auto_143020 ?auto_143021 ) ( not ( = ?auto_143021 ?auto_143020 ) ) ( not ( = ?auto_143021 ?auto_143019 ) ) ( not ( = ?auto_143021 ?auto_143024 ) ) ( not ( = ?auto_143021 ?auto_143018 ) ) ( not ( = ?auto_143021 ?auto_143022 ) ) ( not ( = ?auto_143021 ?auto_143017 ) ) ( not ( = ?auto_143021 ?auto_143016 ) ) ( not ( = ?auto_143020 ?auto_143019 ) ) ( not ( = ?auto_143020 ?auto_143024 ) ) ( not ( = ?auto_143020 ?auto_143018 ) ) ( not ( = ?auto_143020 ?auto_143022 ) ) ( not ( = ?auto_143020 ?auto_143017 ) ) ( not ( = ?auto_143020 ?auto_143016 ) ) ( not ( = ?auto_143019 ?auto_143024 ) ) ( not ( = ?auto_143019 ?auto_143018 ) ) ( not ( = ?auto_143019 ?auto_143022 ) ) ( not ( = ?auto_143019 ?auto_143017 ) ) ( not ( = ?auto_143019 ?auto_143016 ) ) ( not ( = ?auto_143024 ?auto_143018 ) ) ( not ( = ?auto_143024 ?auto_143022 ) ) ( not ( = ?auto_143024 ?auto_143017 ) ) ( not ( = ?auto_143024 ?auto_143016 ) ) ( not ( = ?auto_143018 ?auto_143022 ) ) ( not ( = ?auto_143018 ?auto_143017 ) ) ( not ( = ?auto_143018 ?auto_143016 ) ) ( ON ?auto_143016 ?auto_143023 ) ( not ( = ?auto_143016 ?auto_143023 ) ) ( not ( = ?auto_143017 ?auto_143023 ) ) ( not ( = ?auto_143022 ?auto_143023 ) ) ( not ( = ?auto_143021 ?auto_143023 ) ) ( not ( = ?auto_143020 ?auto_143023 ) ) ( not ( = ?auto_143019 ?auto_143023 ) ) ( not ( = ?auto_143024 ?auto_143023 ) ) ( not ( = ?auto_143018 ?auto_143023 ) ) ( ON ?auto_143017 ?auto_143016 ) ( ON-TABLE ?auto_143023 ) ( ON ?auto_143022 ?auto_143017 ) ( ON ?auto_143018 ?auto_143022 ) ( ON ?auto_143024 ?auto_143018 ) ( CLEAR ?auto_143020 ) ( ON ?auto_143019 ?auto_143024 ) ( CLEAR ?auto_143019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_143023 ?auto_143016 ?auto_143017 ?auto_143022 ?auto_143018 ?auto_143024 )
      ( MAKE-2PILE ?auto_143016 ?auto_143017 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_143025 - BLOCK
      ?auto_143026 - BLOCK
    )
    :vars
    (
      ?auto_143031 - BLOCK
      ?auto_143028 - BLOCK
      ?auto_143032 - BLOCK
      ?auto_143033 - BLOCK
      ?auto_143030 - BLOCK
      ?auto_143029 - BLOCK
      ?auto_143027 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143025 ?auto_143026 ) ) ( not ( = ?auto_143025 ?auto_143031 ) ) ( not ( = ?auto_143026 ?auto_143031 ) ) ( ON-TABLE ?auto_143028 ) ( not ( = ?auto_143028 ?auto_143032 ) ) ( not ( = ?auto_143028 ?auto_143033 ) ) ( not ( = ?auto_143028 ?auto_143030 ) ) ( not ( = ?auto_143028 ?auto_143029 ) ) ( not ( = ?auto_143028 ?auto_143031 ) ) ( not ( = ?auto_143028 ?auto_143026 ) ) ( not ( = ?auto_143028 ?auto_143025 ) ) ( not ( = ?auto_143032 ?auto_143033 ) ) ( not ( = ?auto_143032 ?auto_143030 ) ) ( not ( = ?auto_143032 ?auto_143029 ) ) ( not ( = ?auto_143032 ?auto_143031 ) ) ( not ( = ?auto_143032 ?auto_143026 ) ) ( not ( = ?auto_143032 ?auto_143025 ) ) ( not ( = ?auto_143033 ?auto_143030 ) ) ( not ( = ?auto_143033 ?auto_143029 ) ) ( not ( = ?auto_143033 ?auto_143031 ) ) ( not ( = ?auto_143033 ?auto_143026 ) ) ( not ( = ?auto_143033 ?auto_143025 ) ) ( not ( = ?auto_143030 ?auto_143029 ) ) ( not ( = ?auto_143030 ?auto_143031 ) ) ( not ( = ?auto_143030 ?auto_143026 ) ) ( not ( = ?auto_143030 ?auto_143025 ) ) ( not ( = ?auto_143029 ?auto_143031 ) ) ( not ( = ?auto_143029 ?auto_143026 ) ) ( not ( = ?auto_143029 ?auto_143025 ) ) ( ON ?auto_143025 ?auto_143027 ) ( not ( = ?auto_143025 ?auto_143027 ) ) ( not ( = ?auto_143026 ?auto_143027 ) ) ( not ( = ?auto_143031 ?auto_143027 ) ) ( not ( = ?auto_143028 ?auto_143027 ) ) ( not ( = ?auto_143032 ?auto_143027 ) ) ( not ( = ?auto_143033 ?auto_143027 ) ) ( not ( = ?auto_143030 ?auto_143027 ) ) ( not ( = ?auto_143029 ?auto_143027 ) ) ( ON ?auto_143026 ?auto_143025 ) ( ON-TABLE ?auto_143027 ) ( ON ?auto_143031 ?auto_143026 ) ( ON ?auto_143029 ?auto_143031 ) ( ON ?auto_143030 ?auto_143029 ) ( ON ?auto_143033 ?auto_143030 ) ( CLEAR ?auto_143033 ) ( HOLDING ?auto_143032 ) ( CLEAR ?auto_143028 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143028 ?auto_143032 )
      ( MAKE-2PILE ?auto_143025 ?auto_143026 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_143034 - BLOCK
      ?auto_143035 - BLOCK
    )
    :vars
    (
      ?auto_143037 - BLOCK
      ?auto_143038 - BLOCK
      ?auto_143041 - BLOCK
      ?auto_143040 - BLOCK
      ?auto_143036 - BLOCK
      ?auto_143042 - BLOCK
      ?auto_143039 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143034 ?auto_143035 ) ) ( not ( = ?auto_143034 ?auto_143037 ) ) ( not ( = ?auto_143035 ?auto_143037 ) ) ( ON-TABLE ?auto_143038 ) ( not ( = ?auto_143038 ?auto_143041 ) ) ( not ( = ?auto_143038 ?auto_143040 ) ) ( not ( = ?auto_143038 ?auto_143036 ) ) ( not ( = ?auto_143038 ?auto_143042 ) ) ( not ( = ?auto_143038 ?auto_143037 ) ) ( not ( = ?auto_143038 ?auto_143035 ) ) ( not ( = ?auto_143038 ?auto_143034 ) ) ( not ( = ?auto_143041 ?auto_143040 ) ) ( not ( = ?auto_143041 ?auto_143036 ) ) ( not ( = ?auto_143041 ?auto_143042 ) ) ( not ( = ?auto_143041 ?auto_143037 ) ) ( not ( = ?auto_143041 ?auto_143035 ) ) ( not ( = ?auto_143041 ?auto_143034 ) ) ( not ( = ?auto_143040 ?auto_143036 ) ) ( not ( = ?auto_143040 ?auto_143042 ) ) ( not ( = ?auto_143040 ?auto_143037 ) ) ( not ( = ?auto_143040 ?auto_143035 ) ) ( not ( = ?auto_143040 ?auto_143034 ) ) ( not ( = ?auto_143036 ?auto_143042 ) ) ( not ( = ?auto_143036 ?auto_143037 ) ) ( not ( = ?auto_143036 ?auto_143035 ) ) ( not ( = ?auto_143036 ?auto_143034 ) ) ( not ( = ?auto_143042 ?auto_143037 ) ) ( not ( = ?auto_143042 ?auto_143035 ) ) ( not ( = ?auto_143042 ?auto_143034 ) ) ( ON ?auto_143034 ?auto_143039 ) ( not ( = ?auto_143034 ?auto_143039 ) ) ( not ( = ?auto_143035 ?auto_143039 ) ) ( not ( = ?auto_143037 ?auto_143039 ) ) ( not ( = ?auto_143038 ?auto_143039 ) ) ( not ( = ?auto_143041 ?auto_143039 ) ) ( not ( = ?auto_143040 ?auto_143039 ) ) ( not ( = ?auto_143036 ?auto_143039 ) ) ( not ( = ?auto_143042 ?auto_143039 ) ) ( ON ?auto_143035 ?auto_143034 ) ( ON-TABLE ?auto_143039 ) ( ON ?auto_143037 ?auto_143035 ) ( ON ?auto_143042 ?auto_143037 ) ( ON ?auto_143036 ?auto_143042 ) ( ON ?auto_143040 ?auto_143036 ) ( CLEAR ?auto_143038 ) ( ON ?auto_143041 ?auto_143040 ) ( CLEAR ?auto_143041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_143039 ?auto_143034 ?auto_143035 ?auto_143037 ?auto_143042 ?auto_143036 ?auto_143040 )
      ( MAKE-2PILE ?auto_143034 ?auto_143035 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_143043 - BLOCK
      ?auto_143044 - BLOCK
    )
    :vars
    (
      ?auto_143045 - BLOCK
      ?auto_143051 - BLOCK
      ?auto_143046 - BLOCK
      ?auto_143047 - BLOCK
      ?auto_143048 - BLOCK
      ?auto_143050 - BLOCK
      ?auto_143049 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143043 ?auto_143044 ) ) ( not ( = ?auto_143043 ?auto_143045 ) ) ( not ( = ?auto_143044 ?auto_143045 ) ) ( not ( = ?auto_143051 ?auto_143046 ) ) ( not ( = ?auto_143051 ?auto_143047 ) ) ( not ( = ?auto_143051 ?auto_143048 ) ) ( not ( = ?auto_143051 ?auto_143050 ) ) ( not ( = ?auto_143051 ?auto_143045 ) ) ( not ( = ?auto_143051 ?auto_143044 ) ) ( not ( = ?auto_143051 ?auto_143043 ) ) ( not ( = ?auto_143046 ?auto_143047 ) ) ( not ( = ?auto_143046 ?auto_143048 ) ) ( not ( = ?auto_143046 ?auto_143050 ) ) ( not ( = ?auto_143046 ?auto_143045 ) ) ( not ( = ?auto_143046 ?auto_143044 ) ) ( not ( = ?auto_143046 ?auto_143043 ) ) ( not ( = ?auto_143047 ?auto_143048 ) ) ( not ( = ?auto_143047 ?auto_143050 ) ) ( not ( = ?auto_143047 ?auto_143045 ) ) ( not ( = ?auto_143047 ?auto_143044 ) ) ( not ( = ?auto_143047 ?auto_143043 ) ) ( not ( = ?auto_143048 ?auto_143050 ) ) ( not ( = ?auto_143048 ?auto_143045 ) ) ( not ( = ?auto_143048 ?auto_143044 ) ) ( not ( = ?auto_143048 ?auto_143043 ) ) ( not ( = ?auto_143050 ?auto_143045 ) ) ( not ( = ?auto_143050 ?auto_143044 ) ) ( not ( = ?auto_143050 ?auto_143043 ) ) ( ON ?auto_143043 ?auto_143049 ) ( not ( = ?auto_143043 ?auto_143049 ) ) ( not ( = ?auto_143044 ?auto_143049 ) ) ( not ( = ?auto_143045 ?auto_143049 ) ) ( not ( = ?auto_143051 ?auto_143049 ) ) ( not ( = ?auto_143046 ?auto_143049 ) ) ( not ( = ?auto_143047 ?auto_143049 ) ) ( not ( = ?auto_143048 ?auto_143049 ) ) ( not ( = ?auto_143050 ?auto_143049 ) ) ( ON ?auto_143044 ?auto_143043 ) ( ON-TABLE ?auto_143049 ) ( ON ?auto_143045 ?auto_143044 ) ( ON ?auto_143050 ?auto_143045 ) ( ON ?auto_143048 ?auto_143050 ) ( ON ?auto_143047 ?auto_143048 ) ( ON ?auto_143046 ?auto_143047 ) ( CLEAR ?auto_143046 ) ( HOLDING ?auto_143051 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_143051 )
      ( MAKE-2PILE ?auto_143043 ?auto_143044 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_143052 - BLOCK
      ?auto_143053 - BLOCK
    )
    :vars
    (
      ?auto_143055 - BLOCK
      ?auto_143056 - BLOCK
      ?auto_143057 - BLOCK
      ?auto_143054 - BLOCK
      ?auto_143059 - BLOCK
      ?auto_143058 - BLOCK
      ?auto_143060 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143052 ?auto_143053 ) ) ( not ( = ?auto_143052 ?auto_143055 ) ) ( not ( = ?auto_143053 ?auto_143055 ) ) ( not ( = ?auto_143056 ?auto_143057 ) ) ( not ( = ?auto_143056 ?auto_143054 ) ) ( not ( = ?auto_143056 ?auto_143059 ) ) ( not ( = ?auto_143056 ?auto_143058 ) ) ( not ( = ?auto_143056 ?auto_143055 ) ) ( not ( = ?auto_143056 ?auto_143053 ) ) ( not ( = ?auto_143056 ?auto_143052 ) ) ( not ( = ?auto_143057 ?auto_143054 ) ) ( not ( = ?auto_143057 ?auto_143059 ) ) ( not ( = ?auto_143057 ?auto_143058 ) ) ( not ( = ?auto_143057 ?auto_143055 ) ) ( not ( = ?auto_143057 ?auto_143053 ) ) ( not ( = ?auto_143057 ?auto_143052 ) ) ( not ( = ?auto_143054 ?auto_143059 ) ) ( not ( = ?auto_143054 ?auto_143058 ) ) ( not ( = ?auto_143054 ?auto_143055 ) ) ( not ( = ?auto_143054 ?auto_143053 ) ) ( not ( = ?auto_143054 ?auto_143052 ) ) ( not ( = ?auto_143059 ?auto_143058 ) ) ( not ( = ?auto_143059 ?auto_143055 ) ) ( not ( = ?auto_143059 ?auto_143053 ) ) ( not ( = ?auto_143059 ?auto_143052 ) ) ( not ( = ?auto_143058 ?auto_143055 ) ) ( not ( = ?auto_143058 ?auto_143053 ) ) ( not ( = ?auto_143058 ?auto_143052 ) ) ( ON ?auto_143052 ?auto_143060 ) ( not ( = ?auto_143052 ?auto_143060 ) ) ( not ( = ?auto_143053 ?auto_143060 ) ) ( not ( = ?auto_143055 ?auto_143060 ) ) ( not ( = ?auto_143056 ?auto_143060 ) ) ( not ( = ?auto_143057 ?auto_143060 ) ) ( not ( = ?auto_143054 ?auto_143060 ) ) ( not ( = ?auto_143059 ?auto_143060 ) ) ( not ( = ?auto_143058 ?auto_143060 ) ) ( ON ?auto_143053 ?auto_143052 ) ( ON-TABLE ?auto_143060 ) ( ON ?auto_143055 ?auto_143053 ) ( ON ?auto_143058 ?auto_143055 ) ( ON ?auto_143059 ?auto_143058 ) ( ON ?auto_143054 ?auto_143059 ) ( ON ?auto_143057 ?auto_143054 ) ( ON ?auto_143056 ?auto_143057 ) ( CLEAR ?auto_143056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_143060 ?auto_143052 ?auto_143053 ?auto_143055 ?auto_143058 ?auto_143059 ?auto_143054 ?auto_143057 )
      ( MAKE-2PILE ?auto_143052 ?auto_143053 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143066 - BLOCK
      ?auto_143067 - BLOCK
      ?auto_143068 - BLOCK
      ?auto_143069 - BLOCK
      ?auto_143070 - BLOCK
    )
    :vars
    (
      ?auto_143071 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143071 ?auto_143070 ) ( CLEAR ?auto_143071 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_143066 ) ( ON ?auto_143067 ?auto_143066 ) ( ON ?auto_143068 ?auto_143067 ) ( ON ?auto_143069 ?auto_143068 ) ( ON ?auto_143070 ?auto_143069 ) ( not ( = ?auto_143066 ?auto_143067 ) ) ( not ( = ?auto_143066 ?auto_143068 ) ) ( not ( = ?auto_143066 ?auto_143069 ) ) ( not ( = ?auto_143066 ?auto_143070 ) ) ( not ( = ?auto_143066 ?auto_143071 ) ) ( not ( = ?auto_143067 ?auto_143068 ) ) ( not ( = ?auto_143067 ?auto_143069 ) ) ( not ( = ?auto_143067 ?auto_143070 ) ) ( not ( = ?auto_143067 ?auto_143071 ) ) ( not ( = ?auto_143068 ?auto_143069 ) ) ( not ( = ?auto_143068 ?auto_143070 ) ) ( not ( = ?auto_143068 ?auto_143071 ) ) ( not ( = ?auto_143069 ?auto_143070 ) ) ( not ( = ?auto_143069 ?auto_143071 ) ) ( not ( = ?auto_143070 ?auto_143071 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143071 ?auto_143070 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143072 - BLOCK
      ?auto_143073 - BLOCK
      ?auto_143074 - BLOCK
      ?auto_143075 - BLOCK
      ?auto_143076 - BLOCK
    )
    :vars
    (
      ?auto_143077 - BLOCK
      ?auto_143078 - BLOCK
      ?auto_143079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143077 ?auto_143076 ) ( CLEAR ?auto_143077 ) ( ON-TABLE ?auto_143072 ) ( ON ?auto_143073 ?auto_143072 ) ( ON ?auto_143074 ?auto_143073 ) ( ON ?auto_143075 ?auto_143074 ) ( ON ?auto_143076 ?auto_143075 ) ( not ( = ?auto_143072 ?auto_143073 ) ) ( not ( = ?auto_143072 ?auto_143074 ) ) ( not ( = ?auto_143072 ?auto_143075 ) ) ( not ( = ?auto_143072 ?auto_143076 ) ) ( not ( = ?auto_143072 ?auto_143077 ) ) ( not ( = ?auto_143073 ?auto_143074 ) ) ( not ( = ?auto_143073 ?auto_143075 ) ) ( not ( = ?auto_143073 ?auto_143076 ) ) ( not ( = ?auto_143073 ?auto_143077 ) ) ( not ( = ?auto_143074 ?auto_143075 ) ) ( not ( = ?auto_143074 ?auto_143076 ) ) ( not ( = ?auto_143074 ?auto_143077 ) ) ( not ( = ?auto_143075 ?auto_143076 ) ) ( not ( = ?auto_143075 ?auto_143077 ) ) ( not ( = ?auto_143076 ?auto_143077 ) ) ( HOLDING ?auto_143078 ) ( CLEAR ?auto_143079 ) ( not ( = ?auto_143072 ?auto_143078 ) ) ( not ( = ?auto_143072 ?auto_143079 ) ) ( not ( = ?auto_143073 ?auto_143078 ) ) ( not ( = ?auto_143073 ?auto_143079 ) ) ( not ( = ?auto_143074 ?auto_143078 ) ) ( not ( = ?auto_143074 ?auto_143079 ) ) ( not ( = ?auto_143075 ?auto_143078 ) ) ( not ( = ?auto_143075 ?auto_143079 ) ) ( not ( = ?auto_143076 ?auto_143078 ) ) ( not ( = ?auto_143076 ?auto_143079 ) ) ( not ( = ?auto_143077 ?auto_143078 ) ) ( not ( = ?auto_143077 ?auto_143079 ) ) ( not ( = ?auto_143078 ?auto_143079 ) ) )
    :subtasks
    ( ( !STACK ?auto_143078 ?auto_143079 )
      ( MAKE-5PILE ?auto_143072 ?auto_143073 ?auto_143074 ?auto_143075 ?auto_143076 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143080 - BLOCK
      ?auto_143081 - BLOCK
      ?auto_143082 - BLOCK
      ?auto_143083 - BLOCK
      ?auto_143084 - BLOCK
    )
    :vars
    (
      ?auto_143086 - BLOCK
      ?auto_143087 - BLOCK
      ?auto_143085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143086 ?auto_143084 ) ( ON-TABLE ?auto_143080 ) ( ON ?auto_143081 ?auto_143080 ) ( ON ?auto_143082 ?auto_143081 ) ( ON ?auto_143083 ?auto_143082 ) ( ON ?auto_143084 ?auto_143083 ) ( not ( = ?auto_143080 ?auto_143081 ) ) ( not ( = ?auto_143080 ?auto_143082 ) ) ( not ( = ?auto_143080 ?auto_143083 ) ) ( not ( = ?auto_143080 ?auto_143084 ) ) ( not ( = ?auto_143080 ?auto_143086 ) ) ( not ( = ?auto_143081 ?auto_143082 ) ) ( not ( = ?auto_143081 ?auto_143083 ) ) ( not ( = ?auto_143081 ?auto_143084 ) ) ( not ( = ?auto_143081 ?auto_143086 ) ) ( not ( = ?auto_143082 ?auto_143083 ) ) ( not ( = ?auto_143082 ?auto_143084 ) ) ( not ( = ?auto_143082 ?auto_143086 ) ) ( not ( = ?auto_143083 ?auto_143084 ) ) ( not ( = ?auto_143083 ?auto_143086 ) ) ( not ( = ?auto_143084 ?auto_143086 ) ) ( CLEAR ?auto_143087 ) ( not ( = ?auto_143080 ?auto_143085 ) ) ( not ( = ?auto_143080 ?auto_143087 ) ) ( not ( = ?auto_143081 ?auto_143085 ) ) ( not ( = ?auto_143081 ?auto_143087 ) ) ( not ( = ?auto_143082 ?auto_143085 ) ) ( not ( = ?auto_143082 ?auto_143087 ) ) ( not ( = ?auto_143083 ?auto_143085 ) ) ( not ( = ?auto_143083 ?auto_143087 ) ) ( not ( = ?auto_143084 ?auto_143085 ) ) ( not ( = ?auto_143084 ?auto_143087 ) ) ( not ( = ?auto_143086 ?auto_143085 ) ) ( not ( = ?auto_143086 ?auto_143087 ) ) ( not ( = ?auto_143085 ?auto_143087 ) ) ( ON ?auto_143085 ?auto_143086 ) ( CLEAR ?auto_143085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_143080 ?auto_143081 ?auto_143082 ?auto_143083 ?auto_143084 ?auto_143086 )
      ( MAKE-5PILE ?auto_143080 ?auto_143081 ?auto_143082 ?auto_143083 ?auto_143084 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143088 - BLOCK
      ?auto_143089 - BLOCK
      ?auto_143090 - BLOCK
      ?auto_143091 - BLOCK
      ?auto_143092 - BLOCK
    )
    :vars
    (
      ?auto_143094 - BLOCK
      ?auto_143093 - BLOCK
      ?auto_143095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143094 ?auto_143092 ) ( ON-TABLE ?auto_143088 ) ( ON ?auto_143089 ?auto_143088 ) ( ON ?auto_143090 ?auto_143089 ) ( ON ?auto_143091 ?auto_143090 ) ( ON ?auto_143092 ?auto_143091 ) ( not ( = ?auto_143088 ?auto_143089 ) ) ( not ( = ?auto_143088 ?auto_143090 ) ) ( not ( = ?auto_143088 ?auto_143091 ) ) ( not ( = ?auto_143088 ?auto_143092 ) ) ( not ( = ?auto_143088 ?auto_143094 ) ) ( not ( = ?auto_143089 ?auto_143090 ) ) ( not ( = ?auto_143089 ?auto_143091 ) ) ( not ( = ?auto_143089 ?auto_143092 ) ) ( not ( = ?auto_143089 ?auto_143094 ) ) ( not ( = ?auto_143090 ?auto_143091 ) ) ( not ( = ?auto_143090 ?auto_143092 ) ) ( not ( = ?auto_143090 ?auto_143094 ) ) ( not ( = ?auto_143091 ?auto_143092 ) ) ( not ( = ?auto_143091 ?auto_143094 ) ) ( not ( = ?auto_143092 ?auto_143094 ) ) ( not ( = ?auto_143088 ?auto_143093 ) ) ( not ( = ?auto_143088 ?auto_143095 ) ) ( not ( = ?auto_143089 ?auto_143093 ) ) ( not ( = ?auto_143089 ?auto_143095 ) ) ( not ( = ?auto_143090 ?auto_143093 ) ) ( not ( = ?auto_143090 ?auto_143095 ) ) ( not ( = ?auto_143091 ?auto_143093 ) ) ( not ( = ?auto_143091 ?auto_143095 ) ) ( not ( = ?auto_143092 ?auto_143093 ) ) ( not ( = ?auto_143092 ?auto_143095 ) ) ( not ( = ?auto_143094 ?auto_143093 ) ) ( not ( = ?auto_143094 ?auto_143095 ) ) ( not ( = ?auto_143093 ?auto_143095 ) ) ( ON ?auto_143093 ?auto_143094 ) ( CLEAR ?auto_143093 ) ( HOLDING ?auto_143095 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_143095 )
      ( MAKE-5PILE ?auto_143088 ?auto_143089 ?auto_143090 ?auto_143091 ?auto_143092 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143096 - BLOCK
      ?auto_143097 - BLOCK
      ?auto_143098 - BLOCK
      ?auto_143099 - BLOCK
      ?auto_143100 - BLOCK
    )
    :vars
    (
      ?auto_143102 - BLOCK
      ?auto_143103 - BLOCK
      ?auto_143101 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143102 ?auto_143100 ) ( ON-TABLE ?auto_143096 ) ( ON ?auto_143097 ?auto_143096 ) ( ON ?auto_143098 ?auto_143097 ) ( ON ?auto_143099 ?auto_143098 ) ( ON ?auto_143100 ?auto_143099 ) ( not ( = ?auto_143096 ?auto_143097 ) ) ( not ( = ?auto_143096 ?auto_143098 ) ) ( not ( = ?auto_143096 ?auto_143099 ) ) ( not ( = ?auto_143096 ?auto_143100 ) ) ( not ( = ?auto_143096 ?auto_143102 ) ) ( not ( = ?auto_143097 ?auto_143098 ) ) ( not ( = ?auto_143097 ?auto_143099 ) ) ( not ( = ?auto_143097 ?auto_143100 ) ) ( not ( = ?auto_143097 ?auto_143102 ) ) ( not ( = ?auto_143098 ?auto_143099 ) ) ( not ( = ?auto_143098 ?auto_143100 ) ) ( not ( = ?auto_143098 ?auto_143102 ) ) ( not ( = ?auto_143099 ?auto_143100 ) ) ( not ( = ?auto_143099 ?auto_143102 ) ) ( not ( = ?auto_143100 ?auto_143102 ) ) ( not ( = ?auto_143096 ?auto_143103 ) ) ( not ( = ?auto_143096 ?auto_143101 ) ) ( not ( = ?auto_143097 ?auto_143103 ) ) ( not ( = ?auto_143097 ?auto_143101 ) ) ( not ( = ?auto_143098 ?auto_143103 ) ) ( not ( = ?auto_143098 ?auto_143101 ) ) ( not ( = ?auto_143099 ?auto_143103 ) ) ( not ( = ?auto_143099 ?auto_143101 ) ) ( not ( = ?auto_143100 ?auto_143103 ) ) ( not ( = ?auto_143100 ?auto_143101 ) ) ( not ( = ?auto_143102 ?auto_143103 ) ) ( not ( = ?auto_143102 ?auto_143101 ) ) ( not ( = ?auto_143103 ?auto_143101 ) ) ( ON ?auto_143103 ?auto_143102 ) ( ON ?auto_143101 ?auto_143103 ) ( CLEAR ?auto_143101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_143096 ?auto_143097 ?auto_143098 ?auto_143099 ?auto_143100 ?auto_143102 ?auto_143103 )
      ( MAKE-5PILE ?auto_143096 ?auto_143097 ?auto_143098 ?auto_143099 ?auto_143100 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143104 - BLOCK
      ?auto_143105 - BLOCK
      ?auto_143106 - BLOCK
      ?auto_143107 - BLOCK
      ?auto_143108 - BLOCK
    )
    :vars
    (
      ?auto_143111 - BLOCK
      ?auto_143109 - BLOCK
      ?auto_143110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143111 ?auto_143108 ) ( ON-TABLE ?auto_143104 ) ( ON ?auto_143105 ?auto_143104 ) ( ON ?auto_143106 ?auto_143105 ) ( ON ?auto_143107 ?auto_143106 ) ( ON ?auto_143108 ?auto_143107 ) ( not ( = ?auto_143104 ?auto_143105 ) ) ( not ( = ?auto_143104 ?auto_143106 ) ) ( not ( = ?auto_143104 ?auto_143107 ) ) ( not ( = ?auto_143104 ?auto_143108 ) ) ( not ( = ?auto_143104 ?auto_143111 ) ) ( not ( = ?auto_143105 ?auto_143106 ) ) ( not ( = ?auto_143105 ?auto_143107 ) ) ( not ( = ?auto_143105 ?auto_143108 ) ) ( not ( = ?auto_143105 ?auto_143111 ) ) ( not ( = ?auto_143106 ?auto_143107 ) ) ( not ( = ?auto_143106 ?auto_143108 ) ) ( not ( = ?auto_143106 ?auto_143111 ) ) ( not ( = ?auto_143107 ?auto_143108 ) ) ( not ( = ?auto_143107 ?auto_143111 ) ) ( not ( = ?auto_143108 ?auto_143111 ) ) ( not ( = ?auto_143104 ?auto_143109 ) ) ( not ( = ?auto_143104 ?auto_143110 ) ) ( not ( = ?auto_143105 ?auto_143109 ) ) ( not ( = ?auto_143105 ?auto_143110 ) ) ( not ( = ?auto_143106 ?auto_143109 ) ) ( not ( = ?auto_143106 ?auto_143110 ) ) ( not ( = ?auto_143107 ?auto_143109 ) ) ( not ( = ?auto_143107 ?auto_143110 ) ) ( not ( = ?auto_143108 ?auto_143109 ) ) ( not ( = ?auto_143108 ?auto_143110 ) ) ( not ( = ?auto_143111 ?auto_143109 ) ) ( not ( = ?auto_143111 ?auto_143110 ) ) ( not ( = ?auto_143109 ?auto_143110 ) ) ( ON ?auto_143109 ?auto_143111 ) ( HOLDING ?auto_143110 ) ( CLEAR ?auto_143109 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_143104 ?auto_143105 ?auto_143106 ?auto_143107 ?auto_143108 ?auto_143111 ?auto_143109 ?auto_143110 )
      ( MAKE-5PILE ?auto_143104 ?auto_143105 ?auto_143106 ?auto_143107 ?auto_143108 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143112 - BLOCK
      ?auto_143113 - BLOCK
      ?auto_143114 - BLOCK
      ?auto_143115 - BLOCK
      ?auto_143116 - BLOCK
    )
    :vars
    (
      ?auto_143117 - BLOCK
      ?auto_143118 - BLOCK
      ?auto_143119 - BLOCK
      ?auto_143120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143117 ?auto_143116 ) ( ON-TABLE ?auto_143112 ) ( ON ?auto_143113 ?auto_143112 ) ( ON ?auto_143114 ?auto_143113 ) ( ON ?auto_143115 ?auto_143114 ) ( ON ?auto_143116 ?auto_143115 ) ( not ( = ?auto_143112 ?auto_143113 ) ) ( not ( = ?auto_143112 ?auto_143114 ) ) ( not ( = ?auto_143112 ?auto_143115 ) ) ( not ( = ?auto_143112 ?auto_143116 ) ) ( not ( = ?auto_143112 ?auto_143117 ) ) ( not ( = ?auto_143113 ?auto_143114 ) ) ( not ( = ?auto_143113 ?auto_143115 ) ) ( not ( = ?auto_143113 ?auto_143116 ) ) ( not ( = ?auto_143113 ?auto_143117 ) ) ( not ( = ?auto_143114 ?auto_143115 ) ) ( not ( = ?auto_143114 ?auto_143116 ) ) ( not ( = ?auto_143114 ?auto_143117 ) ) ( not ( = ?auto_143115 ?auto_143116 ) ) ( not ( = ?auto_143115 ?auto_143117 ) ) ( not ( = ?auto_143116 ?auto_143117 ) ) ( not ( = ?auto_143112 ?auto_143118 ) ) ( not ( = ?auto_143112 ?auto_143119 ) ) ( not ( = ?auto_143113 ?auto_143118 ) ) ( not ( = ?auto_143113 ?auto_143119 ) ) ( not ( = ?auto_143114 ?auto_143118 ) ) ( not ( = ?auto_143114 ?auto_143119 ) ) ( not ( = ?auto_143115 ?auto_143118 ) ) ( not ( = ?auto_143115 ?auto_143119 ) ) ( not ( = ?auto_143116 ?auto_143118 ) ) ( not ( = ?auto_143116 ?auto_143119 ) ) ( not ( = ?auto_143117 ?auto_143118 ) ) ( not ( = ?auto_143117 ?auto_143119 ) ) ( not ( = ?auto_143118 ?auto_143119 ) ) ( ON ?auto_143118 ?auto_143117 ) ( CLEAR ?auto_143118 ) ( ON ?auto_143119 ?auto_143120 ) ( CLEAR ?auto_143119 ) ( HAND-EMPTY ) ( not ( = ?auto_143112 ?auto_143120 ) ) ( not ( = ?auto_143113 ?auto_143120 ) ) ( not ( = ?auto_143114 ?auto_143120 ) ) ( not ( = ?auto_143115 ?auto_143120 ) ) ( not ( = ?auto_143116 ?auto_143120 ) ) ( not ( = ?auto_143117 ?auto_143120 ) ) ( not ( = ?auto_143118 ?auto_143120 ) ) ( not ( = ?auto_143119 ?auto_143120 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143119 ?auto_143120 )
      ( MAKE-5PILE ?auto_143112 ?auto_143113 ?auto_143114 ?auto_143115 ?auto_143116 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143121 - BLOCK
      ?auto_143122 - BLOCK
      ?auto_143123 - BLOCK
      ?auto_143124 - BLOCK
      ?auto_143125 - BLOCK
    )
    :vars
    (
      ?auto_143127 - BLOCK
      ?auto_143129 - BLOCK
      ?auto_143128 - BLOCK
      ?auto_143126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143127 ?auto_143125 ) ( ON-TABLE ?auto_143121 ) ( ON ?auto_143122 ?auto_143121 ) ( ON ?auto_143123 ?auto_143122 ) ( ON ?auto_143124 ?auto_143123 ) ( ON ?auto_143125 ?auto_143124 ) ( not ( = ?auto_143121 ?auto_143122 ) ) ( not ( = ?auto_143121 ?auto_143123 ) ) ( not ( = ?auto_143121 ?auto_143124 ) ) ( not ( = ?auto_143121 ?auto_143125 ) ) ( not ( = ?auto_143121 ?auto_143127 ) ) ( not ( = ?auto_143122 ?auto_143123 ) ) ( not ( = ?auto_143122 ?auto_143124 ) ) ( not ( = ?auto_143122 ?auto_143125 ) ) ( not ( = ?auto_143122 ?auto_143127 ) ) ( not ( = ?auto_143123 ?auto_143124 ) ) ( not ( = ?auto_143123 ?auto_143125 ) ) ( not ( = ?auto_143123 ?auto_143127 ) ) ( not ( = ?auto_143124 ?auto_143125 ) ) ( not ( = ?auto_143124 ?auto_143127 ) ) ( not ( = ?auto_143125 ?auto_143127 ) ) ( not ( = ?auto_143121 ?auto_143129 ) ) ( not ( = ?auto_143121 ?auto_143128 ) ) ( not ( = ?auto_143122 ?auto_143129 ) ) ( not ( = ?auto_143122 ?auto_143128 ) ) ( not ( = ?auto_143123 ?auto_143129 ) ) ( not ( = ?auto_143123 ?auto_143128 ) ) ( not ( = ?auto_143124 ?auto_143129 ) ) ( not ( = ?auto_143124 ?auto_143128 ) ) ( not ( = ?auto_143125 ?auto_143129 ) ) ( not ( = ?auto_143125 ?auto_143128 ) ) ( not ( = ?auto_143127 ?auto_143129 ) ) ( not ( = ?auto_143127 ?auto_143128 ) ) ( not ( = ?auto_143129 ?auto_143128 ) ) ( ON ?auto_143128 ?auto_143126 ) ( CLEAR ?auto_143128 ) ( not ( = ?auto_143121 ?auto_143126 ) ) ( not ( = ?auto_143122 ?auto_143126 ) ) ( not ( = ?auto_143123 ?auto_143126 ) ) ( not ( = ?auto_143124 ?auto_143126 ) ) ( not ( = ?auto_143125 ?auto_143126 ) ) ( not ( = ?auto_143127 ?auto_143126 ) ) ( not ( = ?auto_143129 ?auto_143126 ) ) ( not ( = ?auto_143128 ?auto_143126 ) ) ( HOLDING ?auto_143129 ) ( CLEAR ?auto_143127 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_143121 ?auto_143122 ?auto_143123 ?auto_143124 ?auto_143125 ?auto_143127 ?auto_143129 )
      ( MAKE-5PILE ?auto_143121 ?auto_143122 ?auto_143123 ?auto_143124 ?auto_143125 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143130 - BLOCK
      ?auto_143131 - BLOCK
      ?auto_143132 - BLOCK
      ?auto_143133 - BLOCK
      ?auto_143134 - BLOCK
    )
    :vars
    (
      ?auto_143135 - BLOCK
      ?auto_143138 - BLOCK
      ?auto_143137 - BLOCK
      ?auto_143136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143135 ?auto_143134 ) ( ON-TABLE ?auto_143130 ) ( ON ?auto_143131 ?auto_143130 ) ( ON ?auto_143132 ?auto_143131 ) ( ON ?auto_143133 ?auto_143132 ) ( ON ?auto_143134 ?auto_143133 ) ( not ( = ?auto_143130 ?auto_143131 ) ) ( not ( = ?auto_143130 ?auto_143132 ) ) ( not ( = ?auto_143130 ?auto_143133 ) ) ( not ( = ?auto_143130 ?auto_143134 ) ) ( not ( = ?auto_143130 ?auto_143135 ) ) ( not ( = ?auto_143131 ?auto_143132 ) ) ( not ( = ?auto_143131 ?auto_143133 ) ) ( not ( = ?auto_143131 ?auto_143134 ) ) ( not ( = ?auto_143131 ?auto_143135 ) ) ( not ( = ?auto_143132 ?auto_143133 ) ) ( not ( = ?auto_143132 ?auto_143134 ) ) ( not ( = ?auto_143132 ?auto_143135 ) ) ( not ( = ?auto_143133 ?auto_143134 ) ) ( not ( = ?auto_143133 ?auto_143135 ) ) ( not ( = ?auto_143134 ?auto_143135 ) ) ( not ( = ?auto_143130 ?auto_143138 ) ) ( not ( = ?auto_143130 ?auto_143137 ) ) ( not ( = ?auto_143131 ?auto_143138 ) ) ( not ( = ?auto_143131 ?auto_143137 ) ) ( not ( = ?auto_143132 ?auto_143138 ) ) ( not ( = ?auto_143132 ?auto_143137 ) ) ( not ( = ?auto_143133 ?auto_143138 ) ) ( not ( = ?auto_143133 ?auto_143137 ) ) ( not ( = ?auto_143134 ?auto_143138 ) ) ( not ( = ?auto_143134 ?auto_143137 ) ) ( not ( = ?auto_143135 ?auto_143138 ) ) ( not ( = ?auto_143135 ?auto_143137 ) ) ( not ( = ?auto_143138 ?auto_143137 ) ) ( ON ?auto_143137 ?auto_143136 ) ( not ( = ?auto_143130 ?auto_143136 ) ) ( not ( = ?auto_143131 ?auto_143136 ) ) ( not ( = ?auto_143132 ?auto_143136 ) ) ( not ( = ?auto_143133 ?auto_143136 ) ) ( not ( = ?auto_143134 ?auto_143136 ) ) ( not ( = ?auto_143135 ?auto_143136 ) ) ( not ( = ?auto_143138 ?auto_143136 ) ) ( not ( = ?auto_143137 ?auto_143136 ) ) ( CLEAR ?auto_143135 ) ( ON ?auto_143138 ?auto_143137 ) ( CLEAR ?auto_143138 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_143136 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143136 ?auto_143137 )
      ( MAKE-5PILE ?auto_143130 ?auto_143131 ?auto_143132 ?auto_143133 ?auto_143134 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143157 - BLOCK
      ?auto_143158 - BLOCK
      ?auto_143159 - BLOCK
      ?auto_143160 - BLOCK
      ?auto_143161 - BLOCK
    )
    :vars
    (
      ?auto_143164 - BLOCK
      ?auto_143162 - BLOCK
      ?auto_143163 - BLOCK
      ?auto_143165 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143157 ) ( ON ?auto_143158 ?auto_143157 ) ( ON ?auto_143159 ?auto_143158 ) ( ON ?auto_143160 ?auto_143159 ) ( not ( = ?auto_143157 ?auto_143158 ) ) ( not ( = ?auto_143157 ?auto_143159 ) ) ( not ( = ?auto_143157 ?auto_143160 ) ) ( not ( = ?auto_143157 ?auto_143161 ) ) ( not ( = ?auto_143157 ?auto_143164 ) ) ( not ( = ?auto_143158 ?auto_143159 ) ) ( not ( = ?auto_143158 ?auto_143160 ) ) ( not ( = ?auto_143158 ?auto_143161 ) ) ( not ( = ?auto_143158 ?auto_143164 ) ) ( not ( = ?auto_143159 ?auto_143160 ) ) ( not ( = ?auto_143159 ?auto_143161 ) ) ( not ( = ?auto_143159 ?auto_143164 ) ) ( not ( = ?auto_143160 ?auto_143161 ) ) ( not ( = ?auto_143160 ?auto_143164 ) ) ( not ( = ?auto_143161 ?auto_143164 ) ) ( not ( = ?auto_143157 ?auto_143162 ) ) ( not ( = ?auto_143157 ?auto_143163 ) ) ( not ( = ?auto_143158 ?auto_143162 ) ) ( not ( = ?auto_143158 ?auto_143163 ) ) ( not ( = ?auto_143159 ?auto_143162 ) ) ( not ( = ?auto_143159 ?auto_143163 ) ) ( not ( = ?auto_143160 ?auto_143162 ) ) ( not ( = ?auto_143160 ?auto_143163 ) ) ( not ( = ?auto_143161 ?auto_143162 ) ) ( not ( = ?auto_143161 ?auto_143163 ) ) ( not ( = ?auto_143164 ?auto_143162 ) ) ( not ( = ?auto_143164 ?auto_143163 ) ) ( not ( = ?auto_143162 ?auto_143163 ) ) ( ON ?auto_143163 ?auto_143165 ) ( not ( = ?auto_143157 ?auto_143165 ) ) ( not ( = ?auto_143158 ?auto_143165 ) ) ( not ( = ?auto_143159 ?auto_143165 ) ) ( not ( = ?auto_143160 ?auto_143165 ) ) ( not ( = ?auto_143161 ?auto_143165 ) ) ( not ( = ?auto_143164 ?auto_143165 ) ) ( not ( = ?auto_143162 ?auto_143165 ) ) ( not ( = ?auto_143163 ?auto_143165 ) ) ( ON ?auto_143162 ?auto_143163 ) ( ON-TABLE ?auto_143165 ) ( ON ?auto_143164 ?auto_143162 ) ( CLEAR ?auto_143164 ) ( HOLDING ?auto_143161 ) ( CLEAR ?auto_143160 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_143157 ?auto_143158 ?auto_143159 ?auto_143160 ?auto_143161 ?auto_143164 )
      ( MAKE-5PILE ?auto_143157 ?auto_143158 ?auto_143159 ?auto_143160 ?auto_143161 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143166 - BLOCK
      ?auto_143167 - BLOCK
      ?auto_143168 - BLOCK
      ?auto_143169 - BLOCK
      ?auto_143170 - BLOCK
    )
    :vars
    (
      ?auto_143171 - BLOCK
      ?auto_143172 - BLOCK
      ?auto_143173 - BLOCK
      ?auto_143174 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143166 ) ( ON ?auto_143167 ?auto_143166 ) ( ON ?auto_143168 ?auto_143167 ) ( ON ?auto_143169 ?auto_143168 ) ( not ( = ?auto_143166 ?auto_143167 ) ) ( not ( = ?auto_143166 ?auto_143168 ) ) ( not ( = ?auto_143166 ?auto_143169 ) ) ( not ( = ?auto_143166 ?auto_143170 ) ) ( not ( = ?auto_143166 ?auto_143171 ) ) ( not ( = ?auto_143167 ?auto_143168 ) ) ( not ( = ?auto_143167 ?auto_143169 ) ) ( not ( = ?auto_143167 ?auto_143170 ) ) ( not ( = ?auto_143167 ?auto_143171 ) ) ( not ( = ?auto_143168 ?auto_143169 ) ) ( not ( = ?auto_143168 ?auto_143170 ) ) ( not ( = ?auto_143168 ?auto_143171 ) ) ( not ( = ?auto_143169 ?auto_143170 ) ) ( not ( = ?auto_143169 ?auto_143171 ) ) ( not ( = ?auto_143170 ?auto_143171 ) ) ( not ( = ?auto_143166 ?auto_143172 ) ) ( not ( = ?auto_143166 ?auto_143173 ) ) ( not ( = ?auto_143167 ?auto_143172 ) ) ( not ( = ?auto_143167 ?auto_143173 ) ) ( not ( = ?auto_143168 ?auto_143172 ) ) ( not ( = ?auto_143168 ?auto_143173 ) ) ( not ( = ?auto_143169 ?auto_143172 ) ) ( not ( = ?auto_143169 ?auto_143173 ) ) ( not ( = ?auto_143170 ?auto_143172 ) ) ( not ( = ?auto_143170 ?auto_143173 ) ) ( not ( = ?auto_143171 ?auto_143172 ) ) ( not ( = ?auto_143171 ?auto_143173 ) ) ( not ( = ?auto_143172 ?auto_143173 ) ) ( ON ?auto_143173 ?auto_143174 ) ( not ( = ?auto_143166 ?auto_143174 ) ) ( not ( = ?auto_143167 ?auto_143174 ) ) ( not ( = ?auto_143168 ?auto_143174 ) ) ( not ( = ?auto_143169 ?auto_143174 ) ) ( not ( = ?auto_143170 ?auto_143174 ) ) ( not ( = ?auto_143171 ?auto_143174 ) ) ( not ( = ?auto_143172 ?auto_143174 ) ) ( not ( = ?auto_143173 ?auto_143174 ) ) ( ON ?auto_143172 ?auto_143173 ) ( ON-TABLE ?auto_143174 ) ( ON ?auto_143171 ?auto_143172 ) ( CLEAR ?auto_143169 ) ( ON ?auto_143170 ?auto_143171 ) ( CLEAR ?auto_143170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_143174 ?auto_143173 ?auto_143172 ?auto_143171 )
      ( MAKE-5PILE ?auto_143166 ?auto_143167 ?auto_143168 ?auto_143169 ?auto_143170 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143175 - BLOCK
      ?auto_143176 - BLOCK
      ?auto_143177 - BLOCK
      ?auto_143178 - BLOCK
      ?auto_143179 - BLOCK
    )
    :vars
    (
      ?auto_143181 - BLOCK
      ?auto_143182 - BLOCK
      ?auto_143183 - BLOCK
      ?auto_143180 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143175 ) ( ON ?auto_143176 ?auto_143175 ) ( ON ?auto_143177 ?auto_143176 ) ( not ( = ?auto_143175 ?auto_143176 ) ) ( not ( = ?auto_143175 ?auto_143177 ) ) ( not ( = ?auto_143175 ?auto_143178 ) ) ( not ( = ?auto_143175 ?auto_143179 ) ) ( not ( = ?auto_143175 ?auto_143181 ) ) ( not ( = ?auto_143176 ?auto_143177 ) ) ( not ( = ?auto_143176 ?auto_143178 ) ) ( not ( = ?auto_143176 ?auto_143179 ) ) ( not ( = ?auto_143176 ?auto_143181 ) ) ( not ( = ?auto_143177 ?auto_143178 ) ) ( not ( = ?auto_143177 ?auto_143179 ) ) ( not ( = ?auto_143177 ?auto_143181 ) ) ( not ( = ?auto_143178 ?auto_143179 ) ) ( not ( = ?auto_143178 ?auto_143181 ) ) ( not ( = ?auto_143179 ?auto_143181 ) ) ( not ( = ?auto_143175 ?auto_143182 ) ) ( not ( = ?auto_143175 ?auto_143183 ) ) ( not ( = ?auto_143176 ?auto_143182 ) ) ( not ( = ?auto_143176 ?auto_143183 ) ) ( not ( = ?auto_143177 ?auto_143182 ) ) ( not ( = ?auto_143177 ?auto_143183 ) ) ( not ( = ?auto_143178 ?auto_143182 ) ) ( not ( = ?auto_143178 ?auto_143183 ) ) ( not ( = ?auto_143179 ?auto_143182 ) ) ( not ( = ?auto_143179 ?auto_143183 ) ) ( not ( = ?auto_143181 ?auto_143182 ) ) ( not ( = ?auto_143181 ?auto_143183 ) ) ( not ( = ?auto_143182 ?auto_143183 ) ) ( ON ?auto_143183 ?auto_143180 ) ( not ( = ?auto_143175 ?auto_143180 ) ) ( not ( = ?auto_143176 ?auto_143180 ) ) ( not ( = ?auto_143177 ?auto_143180 ) ) ( not ( = ?auto_143178 ?auto_143180 ) ) ( not ( = ?auto_143179 ?auto_143180 ) ) ( not ( = ?auto_143181 ?auto_143180 ) ) ( not ( = ?auto_143182 ?auto_143180 ) ) ( not ( = ?auto_143183 ?auto_143180 ) ) ( ON ?auto_143182 ?auto_143183 ) ( ON-TABLE ?auto_143180 ) ( ON ?auto_143181 ?auto_143182 ) ( ON ?auto_143179 ?auto_143181 ) ( CLEAR ?auto_143179 ) ( HOLDING ?auto_143178 ) ( CLEAR ?auto_143177 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_143175 ?auto_143176 ?auto_143177 ?auto_143178 )
      ( MAKE-5PILE ?auto_143175 ?auto_143176 ?auto_143177 ?auto_143178 ?auto_143179 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143184 - BLOCK
      ?auto_143185 - BLOCK
      ?auto_143186 - BLOCK
      ?auto_143187 - BLOCK
      ?auto_143188 - BLOCK
    )
    :vars
    (
      ?auto_143189 - BLOCK
      ?auto_143190 - BLOCK
      ?auto_143192 - BLOCK
      ?auto_143191 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143184 ) ( ON ?auto_143185 ?auto_143184 ) ( ON ?auto_143186 ?auto_143185 ) ( not ( = ?auto_143184 ?auto_143185 ) ) ( not ( = ?auto_143184 ?auto_143186 ) ) ( not ( = ?auto_143184 ?auto_143187 ) ) ( not ( = ?auto_143184 ?auto_143188 ) ) ( not ( = ?auto_143184 ?auto_143189 ) ) ( not ( = ?auto_143185 ?auto_143186 ) ) ( not ( = ?auto_143185 ?auto_143187 ) ) ( not ( = ?auto_143185 ?auto_143188 ) ) ( not ( = ?auto_143185 ?auto_143189 ) ) ( not ( = ?auto_143186 ?auto_143187 ) ) ( not ( = ?auto_143186 ?auto_143188 ) ) ( not ( = ?auto_143186 ?auto_143189 ) ) ( not ( = ?auto_143187 ?auto_143188 ) ) ( not ( = ?auto_143187 ?auto_143189 ) ) ( not ( = ?auto_143188 ?auto_143189 ) ) ( not ( = ?auto_143184 ?auto_143190 ) ) ( not ( = ?auto_143184 ?auto_143192 ) ) ( not ( = ?auto_143185 ?auto_143190 ) ) ( not ( = ?auto_143185 ?auto_143192 ) ) ( not ( = ?auto_143186 ?auto_143190 ) ) ( not ( = ?auto_143186 ?auto_143192 ) ) ( not ( = ?auto_143187 ?auto_143190 ) ) ( not ( = ?auto_143187 ?auto_143192 ) ) ( not ( = ?auto_143188 ?auto_143190 ) ) ( not ( = ?auto_143188 ?auto_143192 ) ) ( not ( = ?auto_143189 ?auto_143190 ) ) ( not ( = ?auto_143189 ?auto_143192 ) ) ( not ( = ?auto_143190 ?auto_143192 ) ) ( ON ?auto_143192 ?auto_143191 ) ( not ( = ?auto_143184 ?auto_143191 ) ) ( not ( = ?auto_143185 ?auto_143191 ) ) ( not ( = ?auto_143186 ?auto_143191 ) ) ( not ( = ?auto_143187 ?auto_143191 ) ) ( not ( = ?auto_143188 ?auto_143191 ) ) ( not ( = ?auto_143189 ?auto_143191 ) ) ( not ( = ?auto_143190 ?auto_143191 ) ) ( not ( = ?auto_143192 ?auto_143191 ) ) ( ON ?auto_143190 ?auto_143192 ) ( ON-TABLE ?auto_143191 ) ( ON ?auto_143189 ?auto_143190 ) ( ON ?auto_143188 ?auto_143189 ) ( CLEAR ?auto_143186 ) ( ON ?auto_143187 ?auto_143188 ) ( CLEAR ?auto_143187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_143191 ?auto_143192 ?auto_143190 ?auto_143189 ?auto_143188 )
      ( MAKE-5PILE ?auto_143184 ?auto_143185 ?auto_143186 ?auto_143187 ?auto_143188 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143193 - BLOCK
      ?auto_143194 - BLOCK
      ?auto_143195 - BLOCK
      ?auto_143196 - BLOCK
      ?auto_143197 - BLOCK
    )
    :vars
    (
      ?auto_143200 - BLOCK
      ?auto_143199 - BLOCK
      ?auto_143201 - BLOCK
      ?auto_143198 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143193 ) ( ON ?auto_143194 ?auto_143193 ) ( not ( = ?auto_143193 ?auto_143194 ) ) ( not ( = ?auto_143193 ?auto_143195 ) ) ( not ( = ?auto_143193 ?auto_143196 ) ) ( not ( = ?auto_143193 ?auto_143197 ) ) ( not ( = ?auto_143193 ?auto_143200 ) ) ( not ( = ?auto_143194 ?auto_143195 ) ) ( not ( = ?auto_143194 ?auto_143196 ) ) ( not ( = ?auto_143194 ?auto_143197 ) ) ( not ( = ?auto_143194 ?auto_143200 ) ) ( not ( = ?auto_143195 ?auto_143196 ) ) ( not ( = ?auto_143195 ?auto_143197 ) ) ( not ( = ?auto_143195 ?auto_143200 ) ) ( not ( = ?auto_143196 ?auto_143197 ) ) ( not ( = ?auto_143196 ?auto_143200 ) ) ( not ( = ?auto_143197 ?auto_143200 ) ) ( not ( = ?auto_143193 ?auto_143199 ) ) ( not ( = ?auto_143193 ?auto_143201 ) ) ( not ( = ?auto_143194 ?auto_143199 ) ) ( not ( = ?auto_143194 ?auto_143201 ) ) ( not ( = ?auto_143195 ?auto_143199 ) ) ( not ( = ?auto_143195 ?auto_143201 ) ) ( not ( = ?auto_143196 ?auto_143199 ) ) ( not ( = ?auto_143196 ?auto_143201 ) ) ( not ( = ?auto_143197 ?auto_143199 ) ) ( not ( = ?auto_143197 ?auto_143201 ) ) ( not ( = ?auto_143200 ?auto_143199 ) ) ( not ( = ?auto_143200 ?auto_143201 ) ) ( not ( = ?auto_143199 ?auto_143201 ) ) ( ON ?auto_143201 ?auto_143198 ) ( not ( = ?auto_143193 ?auto_143198 ) ) ( not ( = ?auto_143194 ?auto_143198 ) ) ( not ( = ?auto_143195 ?auto_143198 ) ) ( not ( = ?auto_143196 ?auto_143198 ) ) ( not ( = ?auto_143197 ?auto_143198 ) ) ( not ( = ?auto_143200 ?auto_143198 ) ) ( not ( = ?auto_143199 ?auto_143198 ) ) ( not ( = ?auto_143201 ?auto_143198 ) ) ( ON ?auto_143199 ?auto_143201 ) ( ON-TABLE ?auto_143198 ) ( ON ?auto_143200 ?auto_143199 ) ( ON ?auto_143197 ?auto_143200 ) ( ON ?auto_143196 ?auto_143197 ) ( CLEAR ?auto_143196 ) ( HOLDING ?auto_143195 ) ( CLEAR ?auto_143194 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_143193 ?auto_143194 ?auto_143195 )
      ( MAKE-5PILE ?auto_143193 ?auto_143194 ?auto_143195 ?auto_143196 ?auto_143197 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143202 - BLOCK
      ?auto_143203 - BLOCK
      ?auto_143204 - BLOCK
      ?auto_143205 - BLOCK
      ?auto_143206 - BLOCK
    )
    :vars
    (
      ?auto_143207 - BLOCK
      ?auto_143209 - BLOCK
      ?auto_143210 - BLOCK
      ?auto_143208 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143202 ) ( ON ?auto_143203 ?auto_143202 ) ( not ( = ?auto_143202 ?auto_143203 ) ) ( not ( = ?auto_143202 ?auto_143204 ) ) ( not ( = ?auto_143202 ?auto_143205 ) ) ( not ( = ?auto_143202 ?auto_143206 ) ) ( not ( = ?auto_143202 ?auto_143207 ) ) ( not ( = ?auto_143203 ?auto_143204 ) ) ( not ( = ?auto_143203 ?auto_143205 ) ) ( not ( = ?auto_143203 ?auto_143206 ) ) ( not ( = ?auto_143203 ?auto_143207 ) ) ( not ( = ?auto_143204 ?auto_143205 ) ) ( not ( = ?auto_143204 ?auto_143206 ) ) ( not ( = ?auto_143204 ?auto_143207 ) ) ( not ( = ?auto_143205 ?auto_143206 ) ) ( not ( = ?auto_143205 ?auto_143207 ) ) ( not ( = ?auto_143206 ?auto_143207 ) ) ( not ( = ?auto_143202 ?auto_143209 ) ) ( not ( = ?auto_143202 ?auto_143210 ) ) ( not ( = ?auto_143203 ?auto_143209 ) ) ( not ( = ?auto_143203 ?auto_143210 ) ) ( not ( = ?auto_143204 ?auto_143209 ) ) ( not ( = ?auto_143204 ?auto_143210 ) ) ( not ( = ?auto_143205 ?auto_143209 ) ) ( not ( = ?auto_143205 ?auto_143210 ) ) ( not ( = ?auto_143206 ?auto_143209 ) ) ( not ( = ?auto_143206 ?auto_143210 ) ) ( not ( = ?auto_143207 ?auto_143209 ) ) ( not ( = ?auto_143207 ?auto_143210 ) ) ( not ( = ?auto_143209 ?auto_143210 ) ) ( ON ?auto_143210 ?auto_143208 ) ( not ( = ?auto_143202 ?auto_143208 ) ) ( not ( = ?auto_143203 ?auto_143208 ) ) ( not ( = ?auto_143204 ?auto_143208 ) ) ( not ( = ?auto_143205 ?auto_143208 ) ) ( not ( = ?auto_143206 ?auto_143208 ) ) ( not ( = ?auto_143207 ?auto_143208 ) ) ( not ( = ?auto_143209 ?auto_143208 ) ) ( not ( = ?auto_143210 ?auto_143208 ) ) ( ON ?auto_143209 ?auto_143210 ) ( ON-TABLE ?auto_143208 ) ( ON ?auto_143207 ?auto_143209 ) ( ON ?auto_143206 ?auto_143207 ) ( ON ?auto_143205 ?auto_143206 ) ( CLEAR ?auto_143203 ) ( ON ?auto_143204 ?auto_143205 ) ( CLEAR ?auto_143204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_143208 ?auto_143210 ?auto_143209 ?auto_143207 ?auto_143206 ?auto_143205 )
      ( MAKE-5PILE ?auto_143202 ?auto_143203 ?auto_143204 ?auto_143205 ?auto_143206 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143211 - BLOCK
      ?auto_143212 - BLOCK
      ?auto_143213 - BLOCK
      ?auto_143214 - BLOCK
      ?auto_143215 - BLOCK
    )
    :vars
    (
      ?auto_143217 - BLOCK
      ?auto_143219 - BLOCK
      ?auto_143218 - BLOCK
      ?auto_143216 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143211 ) ( not ( = ?auto_143211 ?auto_143212 ) ) ( not ( = ?auto_143211 ?auto_143213 ) ) ( not ( = ?auto_143211 ?auto_143214 ) ) ( not ( = ?auto_143211 ?auto_143215 ) ) ( not ( = ?auto_143211 ?auto_143217 ) ) ( not ( = ?auto_143212 ?auto_143213 ) ) ( not ( = ?auto_143212 ?auto_143214 ) ) ( not ( = ?auto_143212 ?auto_143215 ) ) ( not ( = ?auto_143212 ?auto_143217 ) ) ( not ( = ?auto_143213 ?auto_143214 ) ) ( not ( = ?auto_143213 ?auto_143215 ) ) ( not ( = ?auto_143213 ?auto_143217 ) ) ( not ( = ?auto_143214 ?auto_143215 ) ) ( not ( = ?auto_143214 ?auto_143217 ) ) ( not ( = ?auto_143215 ?auto_143217 ) ) ( not ( = ?auto_143211 ?auto_143219 ) ) ( not ( = ?auto_143211 ?auto_143218 ) ) ( not ( = ?auto_143212 ?auto_143219 ) ) ( not ( = ?auto_143212 ?auto_143218 ) ) ( not ( = ?auto_143213 ?auto_143219 ) ) ( not ( = ?auto_143213 ?auto_143218 ) ) ( not ( = ?auto_143214 ?auto_143219 ) ) ( not ( = ?auto_143214 ?auto_143218 ) ) ( not ( = ?auto_143215 ?auto_143219 ) ) ( not ( = ?auto_143215 ?auto_143218 ) ) ( not ( = ?auto_143217 ?auto_143219 ) ) ( not ( = ?auto_143217 ?auto_143218 ) ) ( not ( = ?auto_143219 ?auto_143218 ) ) ( ON ?auto_143218 ?auto_143216 ) ( not ( = ?auto_143211 ?auto_143216 ) ) ( not ( = ?auto_143212 ?auto_143216 ) ) ( not ( = ?auto_143213 ?auto_143216 ) ) ( not ( = ?auto_143214 ?auto_143216 ) ) ( not ( = ?auto_143215 ?auto_143216 ) ) ( not ( = ?auto_143217 ?auto_143216 ) ) ( not ( = ?auto_143219 ?auto_143216 ) ) ( not ( = ?auto_143218 ?auto_143216 ) ) ( ON ?auto_143219 ?auto_143218 ) ( ON-TABLE ?auto_143216 ) ( ON ?auto_143217 ?auto_143219 ) ( ON ?auto_143215 ?auto_143217 ) ( ON ?auto_143214 ?auto_143215 ) ( ON ?auto_143213 ?auto_143214 ) ( CLEAR ?auto_143213 ) ( HOLDING ?auto_143212 ) ( CLEAR ?auto_143211 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143211 ?auto_143212 )
      ( MAKE-5PILE ?auto_143211 ?auto_143212 ?auto_143213 ?auto_143214 ?auto_143215 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143220 - BLOCK
      ?auto_143221 - BLOCK
      ?auto_143222 - BLOCK
      ?auto_143223 - BLOCK
      ?auto_143224 - BLOCK
    )
    :vars
    (
      ?auto_143228 - BLOCK
      ?auto_143225 - BLOCK
      ?auto_143226 - BLOCK
      ?auto_143227 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143220 ) ( not ( = ?auto_143220 ?auto_143221 ) ) ( not ( = ?auto_143220 ?auto_143222 ) ) ( not ( = ?auto_143220 ?auto_143223 ) ) ( not ( = ?auto_143220 ?auto_143224 ) ) ( not ( = ?auto_143220 ?auto_143228 ) ) ( not ( = ?auto_143221 ?auto_143222 ) ) ( not ( = ?auto_143221 ?auto_143223 ) ) ( not ( = ?auto_143221 ?auto_143224 ) ) ( not ( = ?auto_143221 ?auto_143228 ) ) ( not ( = ?auto_143222 ?auto_143223 ) ) ( not ( = ?auto_143222 ?auto_143224 ) ) ( not ( = ?auto_143222 ?auto_143228 ) ) ( not ( = ?auto_143223 ?auto_143224 ) ) ( not ( = ?auto_143223 ?auto_143228 ) ) ( not ( = ?auto_143224 ?auto_143228 ) ) ( not ( = ?auto_143220 ?auto_143225 ) ) ( not ( = ?auto_143220 ?auto_143226 ) ) ( not ( = ?auto_143221 ?auto_143225 ) ) ( not ( = ?auto_143221 ?auto_143226 ) ) ( not ( = ?auto_143222 ?auto_143225 ) ) ( not ( = ?auto_143222 ?auto_143226 ) ) ( not ( = ?auto_143223 ?auto_143225 ) ) ( not ( = ?auto_143223 ?auto_143226 ) ) ( not ( = ?auto_143224 ?auto_143225 ) ) ( not ( = ?auto_143224 ?auto_143226 ) ) ( not ( = ?auto_143228 ?auto_143225 ) ) ( not ( = ?auto_143228 ?auto_143226 ) ) ( not ( = ?auto_143225 ?auto_143226 ) ) ( ON ?auto_143226 ?auto_143227 ) ( not ( = ?auto_143220 ?auto_143227 ) ) ( not ( = ?auto_143221 ?auto_143227 ) ) ( not ( = ?auto_143222 ?auto_143227 ) ) ( not ( = ?auto_143223 ?auto_143227 ) ) ( not ( = ?auto_143224 ?auto_143227 ) ) ( not ( = ?auto_143228 ?auto_143227 ) ) ( not ( = ?auto_143225 ?auto_143227 ) ) ( not ( = ?auto_143226 ?auto_143227 ) ) ( ON ?auto_143225 ?auto_143226 ) ( ON-TABLE ?auto_143227 ) ( ON ?auto_143228 ?auto_143225 ) ( ON ?auto_143224 ?auto_143228 ) ( ON ?auto_143223 ?auto_143224 ) ( ON ?auto_143222 ?auto_143223 ) ( CLEAR ?auto_143220 ) ( ON ?auto_143221 ?auto_143222 ) ( CLEAR ?auto_143221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_143227 ?auto_143226 ?auto_143225 ?auto_143228 ?auto_143224 ?auto_143223 ?auto_143222 )
      ( MAKE-5PILE ?auto_143220 ?auto_143221 ?auto_143222 ?auto_143223 ?auto_143224 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143229 - BLOCK
      ?auto_143230 - BLOCK
      ?auto_143231 - BLOCK
      ?auto_143232 - BLOCK
      ?auto_143233 - BLOCK
    )
    :vars
    (
      ?auto_143234 - BLOCK
      ?auto_143236 - BLOCK
      ?auto_143235 - BLOCK
      ?auto_143237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143229 ?auto_143230 ) ) ( not ( = ?auto_143229 ?auto_143231 ) ) ( not ( = ?auto_143229 ?auto_143232 ) ) ( not ( = ?auto_143229 ?auto_143233 ) ) ( not ( = ?auto_143229 ?auto_143234 ) ) ( not ( = ?auto_143230 ?auto_143231 ) ) ( not ( = ?auto_143230 ?auto_143232 ) ) ( not ( = ?auto_143230 ?auto_143233 ) ) ( not ( = ?auto_143230 ?auto_143234 ) ) ( not ( = ?auto_143231 ?auto_143232 ) ) ( not ( = ?auto_143231 ?auto_143233 ) ) ( not ( = ?auto_143231 ?auto_143234 ) ) ( not ( = ?auto_143232 ?auto_143233 ) ) ( not ( = ?auto_143232 ?auto_143234 ) ) ( not ( = ?auto_143233 ?auto_143234 ) ) ( not ( = ?auto_143229 ?auto_143236 ) ) ( not ( = ?auto_143229 ?auto_143235 ) ) ( not ( = ?auto_143230 ?auto_143236 ) ) ( not ( = ?auto_143230 ?auto_143235 ) ) ( not ( = ?auto_143231 ?auto_143236 ) ) ( not ( = ?auto_143231 ?auto_143235 ) ) ( not ( = ?auto_143232 ?auto_143236 ) ) ( not ( = ?auto_143232 ?auto_143235 ) ) ( not ( = ?auto_143233 ?auto_143236 ) ) ( not ( = ?auto_143233 ?auto_143235 ) ) ( not ( = ?auto_143234 ?auto_143236 ) ) ( not ( = ?auto_143234 ?auto_143235 ) ) ( not ( = ?auto_143236 ?auto_143235 ) ) ( ON ?auto_143235 ?auto_143237 ) ( not ( = ?auto_143229 ?auto_143237 ) ) ( not ( = ?auto_143230 ?auto_143237 ) ) ( not ( = ?auto_143231 ?auto_143237 ) ) ( not ( = ?auto_143232 ?auto_143237 ) ) ( not ( = ?auto_143233 ?auto_143237 ) ) ( not ( = ?auto_143234 ?auto_143237 ) ) ( not ( = ?auto_143236 ?auto_143237 ) ) ( not ( = ?auto_143235 ?auto_143237 ) ) ( ON ?auto_143236 ?auto_143235 ) ( ON-TABLE ?auto_143237 ) ( ON ?auto_143234 ?auto_143236 ) ( ON ?auto_143233 ?auto_143234 ) ( ON ?auto_143232 ?auto_143233 ) ( ON ?auto_143231 ?auto_143232 ) ( ON ?auto_143230 ?auto_143231 ) ( CLEAR ?auto_143230 ) ( HOLDING ?auto_143229 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_143229 )
      ( MAKE-5PILE ?auto_143229 ?auto_143230 ?auto_143231 ?auto_143232 ?auto_143233 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143238 - BLOCK
      ?auto_143239 - BLOCK
      ?auto_143240 - BLOCK
      ?auto_143241 - BLOCK
      ?auto_143242 - BLOCK
    )
    :vars
    (
      ?auto_143245 - BLOCK
      ?auto_143244 - BLOCK
      ?auto_143246 - BLOCK
      ?auto_143243 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143238 ?auto_143239 ) ) ( not ( = ?auto_143238 ?auto_143240 ) ) ( not ( = ?auto_143238 ?auto_143241 ) ) ( not ( = ?auto_143238 ?auto_143242 ) ) ( not ( = ?auto_143238 ?auto_143245 ) ) ( not ( = ?auto_143239 ?auto_143240 ) ) ( not ( = ?auto_143239 ?auto_143241 ) ) ( not ( = ?auto_143239 ?auto_143242 ) ) ( not ( = ?auto_143239 ?auto_143245 ) ) ( not ( = ?auto_143240 ?auto_143241 ) ) ( not ( = ?auto_143240 ?auto_143242 ) ) ( not ( = ?auto_143240 ?auto_143245 ) ) ( not ( = ?auto_143241 ?auto_143242 ) ) ( not ( = ?auto_143241 ?auto_143245 ) ) ( not ( = ?auto_143242 ?auto_143245 ) ) ( not ( = ?auto_143238 ?auto_143244 ) ) ( not ( = ?auto_143238 ?auto_143246 ) ) ( not ( = ?auto_143239 ?auto_143244 ) ) ( not ( = ?auto_143239 ?auto_143246 ) ) ( not ( = ?auto_143240 ?auto_143244 ) ) ( not ( = ?auto_143240 ?auto_143246 ) ) ( not ( = ?auto_143241 ?auto_143244 ) ) ( not ( = ?auto_143241 ?auto_143246 ) ) ( not ( = ?auto_143242 ?auto_143244 ) ) ( not ( = ?auto_143242 ?auto_143246 ) ) ( not ( = ?auto_143245 ?auto_143244 ) ) ( not ( = ?auto_143245 ?auto_143246 ) ) ( not ( = ?auto_143244 ?auto_143246 ) ) ( ON ?auto_143246 ?auto_143243 ) ( not ( = ?auto_143238 ?auto_143243 ) ) ( not ( = ?auto_143239 ?auto_143243 ) ) ( not ( = ?auto_143240 ?auto_143243 ) ) ( not ( = ?auto_143241 ?auto_143243 ) ) ( not ( = ?auto_143242 ?auto_143243 ) ) ( not ( = ?auto_143245 ?auto_143243 ) ) ( not ( = ?auto_143244 ?auto_143243 ) ) ( not ( = ?auto_143246 ?auto_143243 ) ) ( ON ?auto_143244 ?auto_143246 ) ( ON-TABLE ?auto_143243 ) ( ON ?auto_143245 ?auto_143244 ) ( ON ?auto_143242 ?auto_143245 ) ( ON ?auto_143241 ?auto_143242 ) ( ON ?auto_143240 ?auto_143241 ) ( ON ?auto_143239 ?auto_143240 ) ( ON ?auto_143238 ?auto_143239 ) ( CLEAR ?auto_143238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_143243 ?auto_143246 ?auto_143244 ?auto_143245 ?auto_143242 ?auto_143241 ?auto_143240 ?auto_143239 )
      ( MAKE-5PILE ?auto_143238 ?auto_143239 ?auto_143240 ?auto_143241 ?auto_143242 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143250 - BLOCK
      ?auto_143251 - BLOCK
      ?auto_143252 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_143252 ) ( CLEAR ?auto_143251 ) ( ON-TABLE ?auto_143250 ) ( ON ?auto_143251 ?auto_143250 ) ( not ( = ?auto_143250 ?auto_143251 ) ) ( not ( = ?auto_143250 ?auto_143252 ) ) ( not ( = ?auto_143251 ?auto_143252 ) ) )
    :subtasks
    ( ( !STACK ?auto_143252 ?auto_143251 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143253 - BLOCK
      ?auto_143254 - BLOCK
      ?auto_143255 - BLOCK
    )
    :vars
    (
      ?auto_143256 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_143254 ) ( ON-TABLE ?auto_143253 ) ( ON ?auto_143254 ?auto_143253 ) ( not ( = ?auto_143253 ?auto_143254 ) ) ( not ( = ?auto_143253 ?auto_143255 ) ) ( not ( = ?auto_143254 ?auto_143255 ) ) ( ON ?auto_143255 ?auto_143256 ) ( CLEAR ?auto_143255 ) ( HAND-EMPTY ) ( not ( = ?auto_143253 ?auto_143256 ) ) ( not ( = ?auto_143254 ?auto_143256 ) ) ( not ( = ?auto_143255 ?auto_143256 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143255 ?auto_143256 )
      ( MAKE-3PILE ?auto_143253 ?auto_143254 ?auto_143255 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143257 - BLOCK
      ?auto_143258 - BLOCK
      ?auto_143259 - BLOCK
    )
    :vars
    (
      ?auto_143260 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143257 ) ( not ( = ?auto_143257 ?auto_143258 ) ) ( not ( = ?auto_143257 ?auto_143259 ) ) ( not ( = ?auto_143258 ?auto_143259 ) ) ( ON ?auto_143259 ?auto_143260 ) ( CLEAR ?auto_143259 ) ( not ( = ?auto_143257 ?auto_143260 ) ) ( not ( = ?auto_143258 ?auto_143260 ) ) ( not ( = ?auto_143259 ?auto_143260 ) ) ( HOLDING ?auto_143258 ) ( CLEAR ?auto_143257 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143257 ?auto_143258 )
      ( MAKE-3PILE ?auto_143257 ?auto_143258 ?auto_143259 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143261 - BLOCK
      ?auto_143262 - BLOCK
      ?auto_143263 - BLOCK
    )
    :vars
    (
      ?auto_143264 - BLOCK
      ?auto_143265 - BLOCK
      ?auto_143268 - BLOCK
      ?auto_143266 - BLOCK
      ?auto_143267 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143261 ) ( not ( = ?auto_143261 ?auto_143262 ) ) ( not ( = ?auto_143261 ?auto_143263 ) ) ( not ( = ?auto_143262 ?auto_143263 ) ) ( ON ?auto_143263 ?auto_143264 ) ( not ( = ?auto_143261 ?auto_143264 ) ) ( not ( = ?auto_143262 ?auto_143264 ) ) ( not ( = ?auto_143263 ?auto_143264 ) ) ( CLEAR ?auto_143261 ) ( ON ?auto_143262 ?auto_143263 ) ( CLEAR ?auto_143262 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_143265 ) ( ON ?auto_143268 ?auto_143265 ) ( ON ?auto_143266 ?auto_143268 ) ( ON ?auto_143267 ?auto_143266 ) ( ON ?auto_143264 ?auto_143267 ) ( not ( = ?auto_143265 ?auto_143268 ) ) ( not ( = ?auto_143265 ?auto_143266 ) ) ( not ( = ?auto_143265 ?auto_143267 ) ) ( not ( = ?auto_143265 ?auto_143264 ) ) ( not ( = ?auto_143265 ?auto_143263 ) ) ( not ( = ?auto_143265 ?auto_143262 ) ) ( not ( = ?auto_143268 ?auto_143266 ) ) ( not ( = ?auto_143268 ?auto_143267 ) ) ( not ( = ?auto_143268 ?auto_143264 ) ) ( not ( = ?auto_143268 ?auto_143263 ) ) ( not ( = ?auto_143268 ?auto_143262 ) ) ( not ( = ?auto_143266 ?auto_143267 ) ) ( not ( = ?auto_143266 ?auto_143264 ) ) ( not ( = ?auto_143266 ?auto_143263 ) ) ( not ( = ?auto_143266 ?auto_143262 ) ) ( not ( = ?auto_143267 ?auto_143264 ) ) ( not ( = ?auto_143267 ?auto_143263 ) ) ( not ( = ?auto_143267 ?auto_143262 ) ) ( not ( = ?auto_143261 ?auto_143265 ) ) ( not ( = ?auto_143261 ?auto_143268 ) ) ( not ( = ?auto_143261 ?auto_143266 ) ) ( not ( = ?auto_143261 ?auto_143267 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_143265 ?auto_143268 ?auto_143266 ?auto_143267 ?auto_143264 ?auto_143263 )
      ( MAKE-3PILE ?auto_143261 ?auto_143262 ?auto_143263 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143269 - BLOCK
      ?auto_143270 - BLOCK
      ?auto_143271 - BLOCK
    )
    :vars
    (
      ?auto_143276 - BLOCK
      ?auto_143275 - BLOCK
      ?auto_143274 - BLOCK
      ?auto_143272 - BLOCK
      ?auto_143273 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143269 ?auto_143270 ) ) ( not ( = ?auto_143269 ?auto_143271 ) ) ( not ( = ?auto_143270 ?auto_143271 ) ) ( ON ?auto_143271 ?auto_143276 ) ( not ( = ?auto_143269 ?auto_143276 ) ) ( not ( = ?auto_143270 ?auto_143276 ) ) ( not ( = ?auto_143271 ?auto_143276 ) ) ( ON ?auto_143270 ?auto_143271 ) ( CLEAR ?auto_143270 ) ( ON-TABLE ?auto_143275 ) ( ON ?auto_143274 ?auto_143275 ) ( ON ?auto_143272 ?auto_143274 ) ( ON ?auto_143273 ?auto_143272 ) ( ON ?auto_143276 ?auto_143273 ) ( not ( = ?auto_143275 ?auto_143274 ) ) ( not ( = ?auto_143275 ?auto_143272 ) ) ( not ( = ?auto_143275 ?auto_143273 ) ) ( not ( = ?auto_143275 ?auto_143276 ) ) ( not ( = ?auto_143275 ?auto_143271 ) ) ( not ( = ?auto_143275 ?auto_143270 ) ) ( not ( = ?auto_143274 ?auto_143272 ) ) ( not ( = ?auto_143274 ?auto_143273 ) ) ( not ( = ?auto_143274 ?auto_143276 ) ) ( not ( = ?auto_143274 ?auto_143271 ) ) ( not ( = ?auto_143274 ?auto_143270 ) ) ( not ( = ?auto_143272 ?auto_143273 ) ) ( not ( = ?auto_143272 ?auto_143276 ) ) ( not ( = ?auto_143272 ?auto_143271 ) ) ( not ( = ?auto_143272 ?auto_143270 ) ) ( not ( = ?auto_143273 ?auto_143276 ) ) ( not ( = ?auto_143273 ?auto_143271 ) ) ( not ( = ?auto_143273 ?auto_143270 ) ) ( not ( = ?auto_143269 ?auto_143275 ) ) ( not ( = ?auto_143269 ?auto_143274 ) ) ( not ( = ?auto_143269 ?auto_143272 ) ) ( not ( = ?auto_143269 ?auto_143273 ) ) ( HOLDING ?auto_143269 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_143269 )
      ( MAKE-3PILE ?auto_143269 ?auto_143270 ?auto_143271 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143277 - BLOCK
      ?auto_143278 - BLOCK
      ?auto_143279 - BLOCK
    )
    :vars
    (
      ?auto_143283 - BLOCK
      ?auto_143280 - BLOCK
      ?auto_143282 - BLOCK
      ?auto_143284 - BLOCK
      ?auto_143281 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143277 ?auto_143278 ) ) ( not ( = ?auto_143277 ?auto_143279 ) ) ( not ( = ?auto_143278 ?auto_143279 ) ) ( ON ?auto_143279 ?auto_143283 ) ( not ( = ?auto_143277 ?auto_143283 ) ) ( not ( = ?auto_143278 ?auto_143283 ) ) ( not ( = ?auto_143279 ?auto_143283 ) ) ( ON ?auto_143278 ?auto_143279 ) ( ON-TABLE ?auto_143280 ) ( ON ?auto_143282 ?auto_143280 ) ( ON ?auto_143284 ?auto_143282 ) ( ON ?auto_143281 ?auto_143284 ) ( ON ?auto_143283 ?auto_143281 ) ( not ( = ?auto_143280 ?auto_143282 ) ) ( not ( = ?auto_143280 ?auto_143284 ) ) ( not ( = ?auto_143280 ?auto_143281 ) ) ( not ( = ?auto_143280 ?auto_143283 ) ) ( not ( = ?auto_143280 ?auto_143279 ) ) ( not ( = ?auto_143280 ?auto_143278 ) ) ( not ( = ?auto_143282 ?auto_143284 ) ) ( not ( = ?auto_143282 ?auto_143281 ) ) ( not ( = ?auto_143282 ?auto_143283 ) ) ( not ( = ?auto_143282 ?auto_143279 ) ) ( not ( = ?auto_143282 ?auto_143278 ) ) ( not ( = ?auto_143284 ?auto_143281 ) ) ( not ( = ?auto_143284 ?auto_143283 ) ) ( not ( = ?auto_143284 ?auto_143279 ) ) ( not ( = ?auto_143284 ?auto_143278 ) ) ( not ( = ?auto_143281 ?auto_143283 ) ) ( not ( = ?auto_143281 ?auto_143279 ) ) ( not ( = ?auto_143281 ?auto_143278 ) ) ( not ( = ?auto_143277 ?auto_143280 ) ) ( not ( = ?auto_143277 ?auto_143282 ) ) ( not ( = ?auto_143277 ?auto_143284 ) ) ( not ( = ?auto_143277 ?auto_143281 ) ) ( ON ?auto_143277 ?auto_143278 ) ( CLEAR ?auto_143277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_143280 ?auto_143282 ?auto_143284 ?auto_143281 ?auto_143283 ?auto_143279 ?auto_143278 )
      ( MAKE-3PILE ?auto_143277 ?auto_143278 ?auto_143279 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143285 - BLOCK
      ?auto_143286 - BLOCK
      ?auto_143287 - BLOCK
    )
    :vars
    (
      ?auto_143288 - BLOCK
      ?auto_143292 - BLOCK
      ?auto_143291 - BLOCK
      ?auto_143289 - BLOCK
      ?auto_143290 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143285 ?auto_143286 ) ) ( not ( = ?auto_143285 ?auto_143287 ) ) ( not ( = ?auto_143286 ?auto_143287 ) ) ( ON ?auto_143287 ?auto_143288 ) ( not ( = ?auto_143285 ?auto_143288 ) ) ( not ( = ?auto_143286 ?auto_143288 ) ) ( not ( = ?auto_143287 ?auto_143288 ) ) ( ON ?auto_143286 ?auto_143287 ) ( ON-TABLE ?auto_143292 ) ( ON ?auto_143291 ?auto_143292 ) ( ON ?auto_143289 ?auto_143291 ) ( ON ?auto_143290 ?auto_143289 ) ( ON ?auto_143288 ?auto_143290 ) ( not ( = ?auto_143292 ?auto_143291 ) ) ( not ( = ?auto_143292 ?auto_143289 ) ) ( not ( = ?auto_143292 ?auto_143290 ) ) ( not ( = ?auto_143292 ?auto_143288 ) ) ( not ( = ?auto_143292 ?auto_143287 ) ) ( not ( = ?auto_143292 ?auto_143286 ) ) ( not ( = ?auto_143291 ?auto_143289 ) ) ( not ( = ?auto_143291 ?auto_143290 ) ) ( not ( = ?auto_143291 ?auto_143288 ) ) ( not ( = ?auto_143291 ?auto_143287 ) ) ( not ( = ?auto_143291 ?auto_143286 ) ) ( not ( = ?auto_143289 ?auto_143290 ) ) ( not ( = ?auto_143289 ?auto_143288 ) ) ( not ( = ?auto_143289 ?auto_143287 ) ) ( not ( = ?auto_143289 ?auto_143286 ) ) ( not ( = ?auto_143290 ?auto_143288 ) ) ( not ( = ?auto_143290 ?auto_143287 ) ) ( not ( = ?auto_143290 ?auto_143286 ) ) ( not ( = ?auto_143285 ?auto_143292 ) ) ( not ( = ?auto_143285 ?auto_143291 ) ) ( not ( = ?auto_143285 ?auto_143289 ) ) ( not ( = ?auto_143285 ?auto_143290 ) ) ( HOLDING ?auto_143285 ) ( CLEAR ?auto_143286 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_143292 ?auto_143291 ?auto_143289 ?auto_143290 ?auto_143288 ?auto_143287 ?auto_143286 ?auto_143285 )
      ( MAKE-3PILE ?auto_143285 ?auto_143286 ?auto_143287 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143293 - BLOCK
      ?auto_143294 - BLOCK
      ?auto_143295 - BLOCK
    )
    :vars
    (
      ?auto_143298 - BLOCK
      ?auto_143300 - BLOCK
      ?auto_143299 - BLOCK
      ?auto_143296 - BLOCK
      ?auto_143297 - BLOCK
      ?auto_143301 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143293 ?auto_143294 ) ) ( not ( = ?auto_143293 ?auto_143295 ) ) ( not ( = ?auto_143294 ?auto_143295 ) ) ( ON ?auto_143295 ?auto_143298 ) ( not ( = ?auto_143293 ?auto_143298 ) ) ( not ( = ?auto_143294 ?auto_143298 ) ) ( not ( = ?auto_143295 ?auto_143298 ) ) ( ON ?auto_143294 ?auto_143295 ) ( ON-TABLE ?auto_143300 ) ( ON ?auto_143299 ?auto_143300 ) ( ON ?auto_143296 ?auto_143299 ) ( ON ?auto_143297 ?auto_143296 ) ( ON ?auto_143298 ?auto_143297 ) ( not ( = ?auto_143300 ?auto_143299 ) ) ( not ( = ?auto_143300 ?auto_143296 ) ) ( not ( = ?auto_143300 ?auto_143297 ) ) ( not ( = ?auto_143300 ?auto_143298 ) ) ( not ( = ?auto_143300 ?auto_143295 ) ) ( not ( = ?auto_143300 ?auto_143294 ) ) ( not ( = ?auto_143299 ?auto_143296 ) ) ( not ( = ?auto_143299 ?auto_143297 ) ) ( not ( = ?auto_143299 ?auto_143298 ) ) ( not ( = ?auto_143299 ?auto_143295 ) ) ( not ( = ?auto_143299 ?auto_143294 ) ) ( not ( = ?auto_143296 ?auto_143297 ) ) ( not ( = ?auto_143296 ?auto_143298 ) ) ( not ( = ?auto_143296 ?auto_143295 ) ) ( not ( = ?auto_143296 ?auto_143294 ) ) ( not ( = ?auto_143297 ?auto_143298 ) ) ( not ( = ?auto_143297 ?auto_143295 ) ) ( not ( = ?auto_143297 ?auto_143294 ) ) ( not ( = ?auto_143293 ?auto_143300 ) ) ( not ( = ?auto_143293 ?auto_143299 ) ) ( not ( = ?auto_143293 ?auto_143296 ) ) ( not ( = ?auto_143293 ?auto_143297 ) ) ( CLEAR ?auto_143294 ) ( ON ?auto_143293 ?auto_143301 ) ( CLEAR ?auto_143293 ) ( HAND-EMPTY ) ( not ( = ?auto_143293 ?auto_143301 ) ) ( not ( = ?auto_143294 ?auto_143301 ) ) ( not ( = ?auto_143295 ?auto_143301 ) ) ( not ( = ?auto_143298 ?auto_143301 ) ) ( not ( = ?auto_143300 ?auto_143301 ) ) ( not ( = ?auto_143299 ?auto_143301 ) ) ( not ( = ?auto_143296 ?auto_143301 ) ) ( not ( = ?auto_143297 ?auto_143301 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143293 ?auto_143301 )
      ( MAKE-3PILE ?auto_143293 ?auto_143294 ?auto_143295 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143302 - BLOCK
      ?auto_143303 - BLOCK
      ?auto_143304 - BLOCK
    )
    :vars
    (
      ?auto_143309 - BLOCK
      ?auto_143308 - BLOCK
      ?auto_143305 - BLOCK
      ?auto_143307 - BLOCK
      ?auto_143306 - BLOCK
      ?auto_143310 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143302 ?auto_143303 ) ) ( not ( = ?auto_143302 ?auto_143304 ) ) ( not ( = ?auto_143303 ?auto_143304 ) ) ( ON ?auto_143304 ?auto_143309 ) ( not ( = ?auto_143302 ?auto_143309 ) ) ( not ( = ?auto_143303 ?auto_143309 ) ) ( not ( = ?auto_143304 ?auto_143309 ) ) ( ON-TABLE ?auto_143308 ) ( ON ?auto_143305 ?auto_143308 ) ( ON ?auto_143307 ?auto_143305 ) ( ON ?auto_143306 ?auto_143307 ) ( ON ?auto_143309 ?auto_143306 ) ( not ( = ?auto_143308 ?auto_143305 ) ) ( not ( = ?auto_143308 ?auto_143307 ) ) ( not ( = ?auto_143308 ?auto_143306 ) ) ( not ( = ?auto_143308 ?auto_143309 ) ) ( not ( = ?auto_143308 ?auto_143304 ) ) ( not ( = ?auto_143308 ?auto_143303 ) ) ( not ( = ?auto_143305 ?auto_143307 ) ) ( not ( = ?auto_143305 ?auto_143306 ) ) ( not ( = ?auto_143305 ?auto_143309 ) ) ( not ( = ?auto_143305 ?auto_143304 ) ) ( not ( = ?auto_143305 ?auto_143303 ) ) ( not ( = ?auto_143307 ?auto_143306 ) ) ( not ( = ?auto_143307 ?auto_143309 ) ) ( not ( = ?auto_143307 ?auto_143304 ) ) ( not ( = ?auto_143307 ?auto_143303 ) ) ( not ( = ?auto_143306 ?auto_143309 ) ) ( not ( = ?auto_143306 ?auto_143304 ) ) ( not ( = ?auto_143306 ?auto_143303 ) ) ( not ( = ?auto_143302 ?auto_143308 ) ) ( not ( = ?auto_143302 ?auto_143305 ) ) ( not ( = ?auto_143302 ?auto_143307 ) ) ( not ( = ?auto_143302 ?auto_143306 ) ) ( ON ?auto_143302 ?auto_143310 ) ( CLEAR ?auto_143302 ) ( not ( = ?auto_143302 ?auto_143310 ) ) ( not ( = ?auto_143303 ?auto_143310 ) ) ( not ( = ?auto_143304 ?auto_143310 ) ) ( not ( = ?auto_143309 ?auto_143310 ) ) ( not ( = ?auto_143308 ?auto_143310 ) ) ( not ( = ?auto_143305 ?auto_143310 ) ) ( not ( = ?auto_143307 ?auto_143310 ) ) ( not ( = ?auto_143306 ?auto_143310 ) ) ( HOLDING ?auto_143303 ) ( CLEAR ?auto_143304 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_143308 ?auto_143305 ?auto_143307 ?auto_143306 ?auto_143309 ?auto_143304 ?auto_143303 )
      ( MAKE-3PILE ?auto_143302 ?auto_143303 ?auto_143304 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143311 - BLOCK
      ?auto_143312 - BLOCK
      ?auto_143313 - BLOCK
    )
    :vars
    (
      ?auto_143318 - BLOCK
      ?auto_143319 - BLOCK
      ?auto_143317 - BLOCK
      ?auto_143315 - BLOCK
      ?auto_143314 - BLOCK
      ?auto_143316 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143311 ?auto_143312 ) ) ( not ( = ?auto_143311 ?auto_143313 ) ) ( not ( = ?auto_143312 ?auto_143313 ) ) ( ON ?auto_143313 ?auto_143318 ) ( not ( = ?auto_143311 ?auto_143318 ) ) ( not ( = ?auto_143312 ?auto_143318 ) ) ( not ( = ?auto_143313 ?auto_143318 ) ) ( ON-TABLE ?auto_143319 ) ( ON ?auto_143317 ?auto_143319 ) ( ON ?auto_143315 ?auto_143317 ) ( ON ?auto_143314 ?auto_143315 ) ( ON ?auto_143318 ?auto_143314 ) ( not ( = ?auto_143319 ?auto_143317 ) ) ( not ( = ?auto_143319 ?auto_143315 ) ) ( not ( = ?auto_143319 ?auto_143314 ) ) ( not ( = ?auto_143319 ?auto_143318 ) ) ( not ( = ?auto_143319 ?auto_143313 ) ) ( not ( = ?auto_143319 ?auto_143312 ) ) ( not ( = ?auto_143317 ?auto_143315 ) ) ( not ( = ?auto_143317 ?auto_143314 ) ) ( not ( = ?auto_143317 ?auto_143318 ) ) ( not ( = ?auto_143317 ?auto_143313 ) ) ( not ( = ?auto_143317 ?auto_143312 ) ) ( not ( = ?auto_143315 ?auto_143314 ) ) ( not ( = ?auto_143315 ?auto_143318 ) ) ( not ( = ?auto_143315 ?auto_143313 ) ) ( not ( = ?auto_143315 ?auto_143312 ) ) ( not ( = ?auto_143314 ?auto_143318 ) ) ( not ( = ?auto_143314 ?auto_143313 ) ) ( not ( = ?auto_143314 ?auto_143312 ) ) ( not ( = ?auto_143311 ?auto_143319 ) ) ( not ( = ?auto_143311 ?auto_143317 ) ) ( not ( = ?auto_143311 ?auto_143315 ) ) ( not ( = ?auto_143311 ?auto_143314 ) ) ( ON ?auto_143311 ?auto_143316 ) ( not ( = ?auto_143311 ?auto_143316 ) ) ( not ( = ?auto_143312 ?auto_143316 ) ) ( not ( = ?auto_143313 ?auto_143316 ) ) ( not ( = ?auto_143318 ?auto_143316 ) ) ( not ( = ?auto_143319 ?auto_143316 ) ) ( not ( = ?auto_143317 ?auto_143316 ) ) ( not ( = ?auto_143315 ?auto_143316 ) ) ( not ( = ?auto_143314 ?auto_143316 ) ) ( CLEAR ?auto_143313 ) ( ON ?auto_143312 ?auto_143311 ) ( CLEAR ?auto_143312 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_143316 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143316 ?auto_143311 )
      ( MAKE-3PILE ?auto_143311 ?auto_143312 ?auto_143313 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143320 - BLOCK
      ?auto_143321 - BLOCK
      ?auto_143322 - BLOCK
    )
    :vars
    (
      ?auto_143326 - BLOCK
      ?auto_143323 - BLOCK
      ?auto_143328 - BLOCK
      ?auto_143327 - BLOCK
      ?auto_143324 - BLOCK
      ?auto_143325 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143320 ?auto_143321 ) ) ( not ( = ?auto_143320 ?auto_143322 ) ) ( not ( = ?auto_143321 ?auto_143322 ) ) ( not ( = ?auto_143320 ?auto_143326 ) ) ( not ( = ?auto_143321 ?auto_143326 ) ) ( not ( = ?auto_143322 ?auto_143326 ) ) ( ON-TABLE ?auto_143323 ) ( ON ?auto_143328 ?auto_143323 ) ( ON ?auto_143327 ?auto_143328 ) ( ON ?auto_143324 ?auto_143327 ) ( ON ?auto_143326 ?auto_143324 ) ( not ( = ?auto_143323 ?auto_143328 ) ) ( not ( = ?auto_143323 ?auto_143327 ) ) ( not ( = ?auto_143323 ?auto_143324 ) ) ( not ( = ?auto_143323 ?auto_143326 ) ) ( not ( = ?auto_143323 ?auto_143322 ) ) ( not ( = ?auto_143323 ?auto_143321 ) ) ( not ( = ?auto_143328 ?auto_143327 ) ) ( not ( = ?auto_143328 ?auto_143324 ) ) ( not ( = ?auto_143328 ?auto_143326 ) ) ( not ( = ?auto_143328 ?auto_143322 ) ) ( not ( = ?auto_143328 ?auto_143321 ) ) ( not ( = ?auto_143327 ?auto_143324 ) ) ( not ( = ?auto_143327 ?auto_143326 ) ) ( not ( = ?auto_143327 ?auto_143322 ) ) ( not ( = ?auto_143327 ?auto_143321 ) ) ( not ( = ?auto_143324 ?auto_143326 ) ) ( not ( = ?auto_143324 ?auto_143322 ) ) ( not ( = ?auto_143324 ?auto_143321 ) ) ( not ( = ?auto_143320 ?auto_143323 ) ) ( not ( = ?auto_143320 ?auto_143328 ) ) ( not ( = ?auto_143320 ?auto_143327 ) ) ( not ( = ?auto_143320 ?auto_143324 ) ) ( ON ?auto_143320 ?auto_143325 ) ( not ( = ?auto_143320 ?auto_143325 ) ) ( not ( = ?auto_143321 ?auto_143325 ) ) ( not ( = ?auto_143322 ?auto_143325 ) ) ( not ( = ?auto_143326 ?auto_143325 ) ) ( not ( = ?auto_143323 ?auto_143325 ) ) ( not ( = ?auto_143328 ?auto_143325 ) ) ( not ( = ?auto_143327 ?auto_143325 ) ) ( not ( = ?auto_143324 ?auto_143325 ) ) ( ON ?auto_143321 ?auto_143320 ) ( CLEAR ?auto_143321 ) ( ON-TABLE ?auto_143325 ) ( HOLDING ?auto_143322 ) ( CLEAR ?auto_143326 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_143323 ?auto_143328 ?auto_143327 ?auto_143324 ?auto_143326 ?auto_143322 )
      ( MAKE-3PILE ?auto_143320 ?auto_143321 ?auto_143322 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143329 - BLOCK
      ?auto_143330 - BLOCK
      ?auto_143331 - BLOCK
    )
    :vars
    (
      ?auto_143332 - BLOCK
      ?auto_143336 - BLOCK
      ?auto_143334 - BLOCK
      ?auto_143337 - BLOCK
      ?auto_143335 - BLOCK
      ?auto_143333 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143329 ?auto_143330 ) ) ( not ( = ?auto_143329 ?auto_143331 ) ) ( not ( = ?auto_143330 ?auto_143331 ) ) ( not ( = ?auto_143329 ?auto_143332 ) ) ( not ( = ?auto_143330 ?auto_143332 ) ) ( not ( = ?auto_143331 ?auto_143332 ) ) ( ON-TABLE ?auto_143336 ) ( ON ?auto_143334 ?auto_143336 ) ( ON ?auto_143337 ?auto_143334 ) ( ON ?auto_143335 ?auto_143337 ) ( ON ?auto_143332 ?auto_143335 ) ( not ( = ?auto_143336 ?auto_143334 ) ) ( not ( = ?auto_143336 ?auto_143337 ) ) ( not ( = ?auto_143336 ?auto_143335 ) ) ( not ( = ?auto_143336 ?auto_143332 ) ) ( not ( = ?auto_143336 ?auto_143331 ) ) ( not ( = ?auto_143336 ?auto_143330 ) ) ( not ( = ?auto_143334 ?auto_143337 ) ) ( not ( = ?auto_143334 ?auto_143335 ) ) ( not ( = ?auto_143334 ?auto_143332 ) ) ( not ( = ?auto_143334 ?auto_143331 ) ) ( not ( = ?auto_143334 ?auto_143330 ) ) ( not ( = ?auto_143337 ?auto_143335 ) ) ( not ( = ?auto_143337 ?auto_143332 ) ) ( not ( = ?auto_143337 ?auto_143331 ) ) ( not ( = ?auto_143337 ?auto_143330 ) ) ( not ( = ?auto_143335 ?auto_143332 ) ) ( not ( = ?auto_143335 ?auto_143331 ) ) ( not ( = ?auto_143335 ?auto_143330 ) ) ( not ( = ?auto_143329 ?auto_143336 ) ) ( not ( = ?auto_143329 ?auto_143334 ) ) ( not ( = ?auto_143329 ?auto_143337 ) ) ( not ( = ?auto_143329 ?auto_143335 ) ) ( ON ?auto_143329 ?auto_143333 ) ( not ( = ?auto_143329 ?auto_143333 ) ) ( not ( = ?auto_143330 ?auto_143333 ) ) ( not ( = ?auto_143331 ?auto_143333 ) ) ( not ( = ?auto_143332 ?auto_143333 ) ) ( not ( = ?auto_143336 ?auto_143333 ) ) ( not ( = ?auto_143334 ?auto_143333 ) ) ( not ( = ?auto_143337 ?auto_143333 ) ) ( not ( = ?auto_143335 ?auto_143333 ) ) ( ON ?auto_143330 ?auto_143329 ) ( ON-TABLE ?auto_143333 ) ( CLEAR ?auto_143332 ) ( ON ?auto_143331 ?auto_143330 ) ( CLEAR ?auto_143331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_143333 ?auto_143329 ?auto_143330 )
      ( MAKE-3PILE ?auto_143329 ?auto_143330 ?auto_143331 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143338 - BLOCK
      ?auto_143339 - BLOCK
      ?auto_143340 - BLOCK
    )
    :vars
    (
      ?auto_143344 - BLOCK
      ?auto_143343 - BLOCK
      ?auto_143341 - BLOCK
      ?auto_143345 - BLOCK
      ?auto_143346 - BLOCK
      ?auto_143342 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143338 ?auto_143339 ) ) ( not ( = ?auto_143338 ?auto_143340 ) ) ( not ( = ?auto_143339 ?auto_143340 ) ) ( not ( = ?auto_143338 ?auto_143344 ) ) ( not ( = ?auto_143339 ?auto_143344 ) ) ( not ( = ?auto_143340 ?auto_143344 ) ) ( ON-TABLE ?auto_143343 ) ( ON ?auto_143341 ?auto_143343 ) ( ON ?auto_143345 ?auto_143341 ) ( ON ?auto_143346 ?auto_143345 ) ( not ( = ?auto_143343 ?auto_143341 ) ) ( not ( = ?auto_143343 ?auto_143345 ) ) ( not ( = ?auto_143343 ?auto_143346 ) ) ( not ( = ?auto_143343 ?auto_143344 ) ) ( not ( = ?auto_143343 ?auto_143340 ) ) ( not ( = ?auto_143343 ?auto_143339 ) ) ( not ( = ?auto_143341 ?auto_143345 ) ) ( not ( = ?auto_143341 ?auto_143346 ) ) ( not ( = ?auto_143341 ?auto_143344 ) ) ( not ( = ?auto_143341 ?auto_143340 ) ) ( not ( = ?auto_143341 ?auto_143339 ) ) ( not ( = ?auto_143345 ?auto_143346 ) ) ( not ( = ?auto_143345 ?auto_143344 ) ) ( not ( = ?auto_143345 ?auto_143340 ) ) ( not ( = ?auto_143345 ?auto_143339 ) ) ( not ( = ?auto_143346 ?auto_143344 ) ) ( not ( = ?auto_143346 ?auto_143340 ) ) ( not ( = ?auto_143346 ?auto_143339 ) ) ( not ( = ?auto_143338 ?auto_143343 ) ) ( not ( = ?auto_143338 ?auto_143341 ) ) ( not ( = ?auto_143338 ?auto_143345 ) ) ( not ( = ?auto_143338 ?auto_143346 ) ) ( ON ?auto_143338 ?auto_143342 ) ( not ( = ?auto_143338 ?auto_143342 ) ) ( not ( = ?auto_143339 ?auto_143342 ) ) ( not ( = ?auto_143340 ?auto_143342 ) ) ( not ( = ?auto_143344 ?auto_143342 ) ) ( not ( = ?auto_143343 ?auto_143342 ) ) ( not ( = ?auto_143341 ?auto_143342 ) ) ( not ( = ?auto_143345 ?auto_143342 ) ) ( not ( = ?auto_143346 ?auto_143342 ) ) ( ON ?auto_143339 ?auto_143338 ) ( ON-TABLE ?auto_143342 ) ( ON ?auto_143340 ?auto_143339 ) ( CLEAR ?auto_143340 ) ( HOLDING ?auto_143344 ) ( CLEAR ?auto_143346 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_143343 ?auto_143341 ?auto_143345 ?auto_143346 ?auto_143344 )
      ( MAKE-3PILE ?auto_143338 ?auto_143339 ?auto_143340 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143347 - BLOCK
      ?auto_143348 - BLOCK
      ?auto_143349 - BLOCK
    )
    :vars
    (
      ?auto_143351 - BLOCK
      ?auto_143353 - BLOCK
      ?auto_143355 - BLOCK
      ?auto_143350 - BLOCK
      ?auto_143352 - BLOCK
      ?auto_143354 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143347 ?auto_143348 ) ) ( not ( = ?auto_143347 ?auto_143349 ) ) ( not ( = ?auto_143348 ?auto_143349 ) ) ( not ( = ?auto_143347 ?auto_143351 ) ) ( not ( = ?auto_143348 ?auto_143351 ) ) ( not ( = ?auto_143349 ?auto_143351 ) ) ( ON-TABLE ?auto_143353 ) ( ON ?auto_143355 ?auto_143353 ) ( ON ?auto_143350 ?auto_143355 ) ( ON ?auto_143352 ?auto_143350 ) ( not ( = ?auto_143353 ?auto_143355 ) ) ( not ( = ?auto_143353 ?auto_143350 ) ) ( not ( = ?auto_143353 ?auto_143352 ) ) ( not ( = ?auto_143353 ?auto_143351 ) ) ( not ( = ?auto_143353 ?auto_143349 ) ) ( not ( = ?auto_143353 ?auto_143348 ) ) ( not ( = ?auto_143355 ?auto_143350 ) ) ( not ( = ?auto_143355 ?auto_143352 ) ) ( not ( = ?auto_143355 ?auto_143351 ) ) ( not ( = ?auto_143355 ?auto_143349 ) ) ( not ( = ?auto_143355 ?auto_143348 ) ) ( not ( = ?auto_143350 ?auto_143352 ) ) ( not ( = ?auto_143350 ?auto_143351 ) ) ( not ( = ?auto_143350 ?auto_143349 ) ) ( not ( = ?auto_143350 ?auto_143348 ) ) ( not ( = ?auto_143352 ?auto_143351 ) ) ( not ( = ?auto_143352 ?auto_143349 ) ) ( not ( = ?auto_143352 ?auto_143348 ) ) ( not ( = ?auto_143347 ?auto_143353 ) ) ( not ( = ?auto_143347 ?auto_143355 ) ) ( not ( = ?auto_143347 ?auto_143350 ) ) ( not ( = ?auto_143347 ?auto_143352 ) ) ( ON ?auto_143347 ?auto_143354 ) ( not ( = ?auto_143347 ?auto_143354 ) ) ( not ( = ?auto_143348 ?auto_143354 ) ) ( not ( = ?auto_143349 ?auto_143354 ) ) ( not ( = ?auto_143351 ?auto_143354 ) ) ( not ( = ?auto_143353 ?auto_143354 ) ) ( not ( = ?auto_143355 ?auto_143354 ) ) ( not ( = ?auto_143350 ?auto_143354 ) ) ( not ( = ?auto_143352 ?auto_143354 ) ) ( ON ?auto_143348 ?auto_143347 ) ( ON-TABLE ?auto_143354 ) ( ON ?auto_143349 ?auto_143348 ) ( CLEAR ?auto_143352 ) ( ON ?auto_143351 ?auto_143349 ) ( CLEAR ?auto_143351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_143354 ?auto_143347 ?auto_143348 ?auto_143349 )
      ( MAKE-3PILE ?auto_143347 ?auto_143348 ?auto_143349 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143356 - BLOCK
      ?auto_143357 - BLOCK
      ?auto_143358 - BLOCK
    )
    :vars
    (
      ?auto_143360 - BLOCK
      ?auto_143363 - BLOCK
      ?auto_143364 - BLOCK
      ?auto_143362 - BLOCK
      ?auto_143361 - BLOCK
      ?auto_143359 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143356 ?auto_143357 ) ) ( not ( = ?auto_143356 ?auto_143358 ) ) ( not ( = ?auto_143357 ?auto_143358 ) ) ( not ( = ?auto_143356 ?auto_143360 ) ) ( not ( = ?auto_143357 ?auto_143360 ) ) ( not ( = ?auto_143358 ?auto_143360 ) ) ( ON-TABLE ?auto_143363 ) ( ON ?auto_143364 ?auto_143363 ) ( ON ?auto_143362 ?auto_143364 ) ( not ( = ?auto_143363 ?auto_143364 ) ) ( not ( = ?auto_143363 ?auto_143362 ) ) ( not ( = ?auto_143363 ?auto_143361 ) ) ( not ( = ?auto_143363 ?auto_143360 ) ) ( not ( = ?auto_143363 ?auto_143358 ) ) ( not ( = ?auto_143363 ?auto_143357 ) ) ( not ( = ?auto_143364 ?auto_143362 ) ) ( not ( = ?auto_143364 ?auto_143361 ) ) ( not ( = ?auto_143364 ?auto_143360 ) ) ( not ( = ?auto_143364 ?auto_143358 ) ) ( not ( = ?auto_143364 ?auto_143357 ) ) ( not ( = ?auto_143362 ?auto_143361 ) ) ( not ( = ?auto_143362 ?auto_143360 ) ) ( not ( = ?auto_143362 ?auto_143358 ) ) ( not ( = ?auto_143362 ?auto_143357 ) ) ( not ( = ?auto_143361 ?auto_143360 ) ) ( not ( = ?auto_143361 ?auto_143358 ) ) ( not ( = ?auto_143361 ?auto_143357 ) ) ( not ( = ?auto_143356 ?auto_143363 ) ) ( not ( = ?auto_143356 ?auto_143364 ) ) ( not ( = ?auto_143356 ?auto_143362 ) ) ( not ( = ?auto_143356 ?auto_143361 ) ) ( ON ?auto_143356 ?auto_143359 ) ( not ( = ?auto_143356 ?auto_143359 ) ) ( not ( = ?auto_143357 ?auto_143359 ) ) ( not ( = ?auto_143358 ?auto_143359 ) ) ( not ( = ?auto_143360 ?auto_143359 ) ) ( not ( = ?auto_143363 ?auto_143359 ) ) ( not ( = ?auto_143364 ?auto_143359 ) ) ( not ( = ?auto_143362 ?auto_143359 ) ) ( not ( = ?auto_143361 ?auto_143359 ) ) ( ON ?auto_143357 ?auto_143356 ) ( ON-TABLE ?auto_143359 ) ( ON ?auto_143358 ?auto_143357 ) ( ON ?auto_143360 ?auto_143358 ) ( CLEAR ?auto_143360 ) ( HOLDING ?auto_143361 ) ( CLEAR ?auto_143362 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_143363 ?auto_143364 ?auto_143362 ?auto_143361 )
      ( MAKE-3PILE ?auto_143356 ?auto_143357 ?auto_143358 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143365 - BLOCK
      ?auto_143366 - BLOCK
      ?auto_143367 - BLOCK
    )
    :vars
    (
      ?auto_143369 - BLOCK
      ?auto_143371 - BLOCK
      ?auto_143370 - BLOCK
      ?auto_143372 - BLOCK
      ?auto_143368 - BLOCK
      ?auto_143373 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143365 ?auto_143366 ) ) ( not ( = ?auto_143365 ?auto_143367 ) ) ( not ( = ?auto_143366 ?auto_143367 ) ) ( not ( = ?auto_143365 ?auto_143369 ) ) ( not ( = ?auto_143366 ?auto_143369 ) ) ( not ( = ?auto_143367 ?auto_143369 ) ) ( ON-TABLE ?auto_143371 ) ( ON ?auto_143370 ?auto_143371 ) ( ON ?auto_143372 ?auto_143370 ) ( not ( = ?auto_143371 ?auto_143370 ) ) ( not ( = ?auto_143371 ?auto_143372 ) ) ( not ( = ?auto_143371 ?auto_143368 ) ) ( not ( = ?auto_143371 ?auto_143369 ) ) ( not ( = ?auto_143371 ?auto_143367 ) ) ( not ( = ?auto_143371 ?auto_143366 ) ) ( not ( = ?auto_143370 ?auto_143372 ) ) ( not ( = ?auto_143370 ?auto_143368 ) ) ( not ( = ?auto_143370 ?auto_143369 ) ) ( not ( = ?auto_143370 ?auto_143367 ) ) ( not ( = ?auto_143370 ?auto_143366 ) ) ( not ( = ?auto_143372 ?auto_143368 ) ) ( not ( = ?auto_143372 ?auto_143369 ) ) ( not ( = ?auto_143372 ?auto_143367 ) ) ( not ( = ?auto_143372 ?auto_143366 ) ) ( not ( = ?auto_143368 ?auto_143369 ) ) ( not ( = ?auto_143368 ?auto_143367 ) ) ( not ( = ?auto_143368 ?auto_143366 ) ) ( not ( = ?auto_143365 ?auto_143371 ) ) ( not ( = ?auto_143365 ?auto_143370 ) ) ( not ( = ?auto_143365 ?auto_143372 ) ) ( not ( = ?auto_143365 ?auto_143368 ) ) ( ON ?auto_143365 ?auto_143373 ) ( not ( = ?auto_143365 ?auto_143373 ) ) ( not ( = ?auto_143366 ?auto_143373 ) ) ( not ( = ?auto_143367 ?auto_143373 ) ) ( not ( = ?auto_143369 ?auto_143373 ) ) ( not ( = ?auto_143371 ?auto_143373 ) ) ( not ( = ?auto_143370 ?auto_143373 ) ) ( not ( = ?auto_143372 ?auto_143373 ) ) ( not ( = ?auto_143368 ?auto_143373 ) ) ( ON ?auto_143366 ?auto_143365 ) ( ON-TABLE ?auto_143373 ) ( ON ?auto_143367 ?auto_143366 ) ( ON ?auto_143369 ?auto_143367 ) ( CLEAR ?auto_143372 ) ( ON ?auto_143368 ?auto_143369 ) ( CLEAR ?auto_143368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_143373 ?auto_143365 ?auto_143366 ?auto_143367 ?auto_143369 )
      ( MAKE-3PILE ?auto_143365 ?auto_143366 ?auto_143367 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143374 - BLOCK
      ?auto_143375 - BLOCK
      ?auto_143376 - BLOCK
    )
    :vars
    (
      ?auto_143381 - BLOCK
      ?auto_143378 - BLOCK
      ?auto_143377 - BLOCK
      ?auto_143382 - BLOCK
      ?auto_143379 - BLOCK
      ?auto_143380 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143374 ?auto_143375 ) ) ( not ( = ?auto_143374 ?auto_143376 ) ) ( not ( = ?auto_143375 ?auto_143376 ) ) ( not ( = ?auto_143374 ?auto_143381 ) ) ( not ( = ?auto_143375 ?auto_143381 ) ) ( not ( = ?auto_143376 ?auto_143381 ) ) ( ON-TABLE ?auto_143378 ) ( ON ?auto_143377 ?auto_143378 ) ( not ( = ?auto_143378 ?auto_143377 ) ) ( not ( = ?auto_143378 ?auto_143382 ) ) ( not ( = ?auto_143378 ?auto_143379 ) ) ( not ( = ?auto_143378 ?auto_143381 ) ) ( not ( = ?auto_143378 ?auto_143376 ) ) ( not ( = ?auto_143378 ?auto_143375 ) ) ( not ( = ?auto_143377 ?auto_143382 ) ) ( not ( = ?auto_143377 ?auto_143379 ) ) ( not ( = ?auto_143377 ?auto_143381 ) ) ( not ( = ?auto_143377 ?auto_143376 ) ) ( not ( = ?auto_143377 ?auto_143375 ) ) ( not ( = ?auto_143382 ?auto_143379 ) ) ( not ( = ?auto_143382 ?auto_143381 ) ) ( not ( = ?auto_143382 ?auto_143376 ) ) ( not ( = ?auto_143382 ?auto_143375 ) ) ( not ( = ?auto_143379 ?auto_143381 ) ) ( not ( = ?auto_143379 ?auto_143376 ) ) ( not ( = ?auto_143379 ?auto_143375 ) ) ( not ( = ?auto_143374 ?auto_143378 ) ) ( not ( = ?auto_143374 ?auto_143377 ) ) ( not ( = ?auto_143374 ?auto_143382 ) ) ( not ( = ?auto_143374 ?auto_143379 ) ) ( ON ?auto_143374 ?auto_143380 ) ( not ( = ?auto_143374 ?auto_143380 ) ) ( not ( = ?auto_143375 ?auto_143380 ) ) ( not ( = ?auto_143376 ?auto_143380 ) ) ( not ( = ?auto_143381 ?auto_143380 ) ) ( not ( = ?auto_143378 ?auto_143380 ) ) ( not ( = ?auto_143377 ?auto_143380 ) ) ( not ( = ?auto_143382 ?auto_143380 ) ) ( not ( = ?auto_143379 ?auto_143380 ) ) ( ON ?auto_143375 ?auto_143374 ) ( ON-TABLE ?auto_143380 ) ( ON ?auto_143376 ?auto_143375 ) ( ON ?auto_143381 ?auto_143376 ) ( ON ?auto_143379 ?auto_143381 ) ( CLEAR ?auto_143379 ) ( HOLDING ?auto_143382 ) ( CLEAR ?auto_143377 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_143378 ?auto_143377 ?auto_143382 )
      ( MAKE-3PILE ?auto_143374 ?auto_143375 ?auto_143376 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143383 - BLOCK
      ?auto_143384 - BLOCK
      ?auto_143385 - BLOCK
    )
    :vars
    (
      ?auto_143388 - BLOCK
      ?auto_143391 - BLOCK
      ?auto_143387 - BLOCK
      ?auto_143390 - BLOCK
      ?auto_143389 - BLOCK
      ?auto_143386 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143383 ?auto_143384 ) ) ( not ( = ?auto_143383 ?auto_143385 ) ) ( not ( = ?auto_143384 ?auto_143385 ) ) ( not ( = ?auto_143383 ?auto_143388 ) ) ( not ( = ?auto_143384 ?auto_143388 ) ) ( not ( = ?auto_143385 ?auto_143388 ) ) ( ON-TABLE ?auto_143391 ) ( ON ?auto_143387 ?auto_143391 ) ( not ( = ?auto_143391 ?auto_143387 ) ) ( not ( = ?auto_143391 ?auto_143390 ) ) ( not ( = ?auto_143391 ?auto_143389 ) ) ( not ( = ?auto_143391 ?auto_143388 ) ) ( not ( = ?auto_143391 ?auto_143385 ) ) ( not ( = ?auto_143391 ?auto_143384 ) ) ( not ( = ?auto_143387 ?auto_143390 ) ) ( not ( = ?auto_143387 ?auto_143389 ) ) ( not ( = ?auto_143387 ?auto_143388 ) ) ( not ( = ?auto_143387 ?auto_143385 ) ) ( not ( = ?auto_143387 ?auto_143384 ) ) ( not ( = ?auto_143390 ?auto_143389 ) ) ( not ( = ?auto_143390 ?auto_143388 ) ) ( not ( = ?auto_143390 ?auto_143385 ) ) ( not ( = ?auto_143390 ?auto_143384 ) ) ( not ( = ?auto_143389 ?auto_143388 ) ) ( not ( = ?auto_143389 ?auto_143385 ) ) ( not ( = ?auto_143389 ?auto_143384 ) ) ( not ( = ?auto_143383 ?auto_143391 ) ) ( not ( = ?auto_143383 ?auto_143387 ) ) ( not ( = ?auto_143383 ?auto_143390 ) ) ( not ( = ?auto_143383 ?auto_143389 ) ) ( ON ?auto_143383 ?auto_143386 ) ( not ( = ?auto_143383 ?auto_143386 ) ) ( not ( = ?auto_143384 ?auto_143386 ) ) ( not ( = ?auto_143385 ?auto_143386 ) ) ( not ( = ?auto_143388 ?auto_143386 ) ) ( not ( = ?auto_143391 ?auto_143386 ) ) ( not ( = ?auto_143387 ?auto_143386 ) ) ( not ( = ?auto_143390 ?auto_143386 ) ) ( not ( = ?auto_143389 ?auto_143386 ) ) ( ON ?auto_143384 ?auto_143383 ) ( ON-TABLE ?auto_143386 ) ( ON ?auto_143385 ?auto_143384 ) ( ON ?auto_143388 ?auto_143385 ) ( ON ?auto_143389 ?auto_143388 ) ( CLEAR ?auto_143387 ) ( ON ?auto_143390 ?auto_143389 ) ( CLEAR ?auto_143390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_143386 ?auto_143383 ?auto_143384 ?auto_143385 ?auto_143388 ?auto_143389 )
      ( MAKE-3PILE ?auto_143383 ?auto_143384 ?auto_143385 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143392 - BLOCK
      ?auto_143393 - BLOCK
      ?auto_143394 - BLOCK
    )
    :vars
    (
      ?auto_143397 - BLOCK
      ?auto_143398 - BLOCK
      ?auto_143396 - BLOCK
      ?auto_143399 - BLOCK
      ?auto_143395 - BLOCK
      ?auto_143400 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143392 ?auto_143393 ) ) ( not ( = ?auto_143392 ?auto_143394 ) ) ( not ( = ?auto_143393 ?auto_143394 ) ) ( not ( = ?auto_143392 ?auto_143397 ) ) ( not ( = ?auto_143393 ?auto_143397 ) ) ( not ( = ?auto_143394 ?auto_143397 ) ) ( ON-TABLE ?auto_143398 ) ( not ( = ?auto_143398 ?auto_143396 ) ) ( not ( = ?auto_143398 ?auto_143399 ) ) ( not ( = ?auto_143398 ?auto_143395 ) ) ( not ( = ?auto_143398 ?auto_143397 ) ) ( not ( = ?auto_143398 ?auto_143394 ) ) ( not ( = ?auto_143398 ?auto_143393 ) ) ( not ( = ?auto_143396 ?auto_143399 ) ) ( not ( = ?auto_143396 ?auto_143395 ) ) ( not ( = ?auto_143396 ?auto_143397 ) ) ( not ( = ?auto_143396 ?auto_143394 ) ) ( not ( = ?auto_143396 ?auto_143393 ) ) ( not ( = ?auto_143399 ?auto_143395 ) ) ( not ( = ?auto_143399 ?auto_143397 ) ) ( not ( = ?auto_143399 ?auto_143394 ) ) ( not ( = ?auto_143399 ?auto_143393 ) ) ( not ( = ?auto_143395 ?auto_143397 ) ) ( not ( = ?auto_143395 ?auto_143394 ) ) ( not ( = ?auto_143395 ?auto_143393 ) ) ( not ( = ?auto_143392 ?auto_143398 ) ) ( not ( = ?auto_143392 ?auto_143396 ) ) ( not ( = ?auto_143392 ?auto_143399 ) ) ( not ( = ?auto_143392 ?auto_143395 ) ) ( ON ?auto_143392 ?auto_143400 ) ( not ( = ?auto_143392 ?auto_143400 ) ) ( not ( = ?auto_143393 ?auto_143400 ) ) ( not ( = ?auto_143394 ?auto_143400 ) ) ( not ( = ?auto_143397 ?auto_143400 ) ) ( not ( = ?auto_143398 ?auto_143400 ) ) ( not ( = ?auto_143396 ?auto_143400 ) ) ( not ( = ?auto_143399 ?auto_143400 ) ) ( not ( = ?auto_143395 ?auto_143400 ) ) ( ON ?auto_143393 ?auto_143392 ) ( ON-TABLE ?auto_143400 ) ( ON ?auto_143394 ?auto_143393 ) ( ON ?auto_143397 ?auto_143394 ) ( ON ?auto_143395 ?auto_143397 ) ( ON ?auto_143399 ?auto_143395 ) ( CLEAR ?auto_143399 ) ( HOLDING ?auto_143396 ) ( CLEAR ?auto_143398 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143398 ?auto_143396 )
      ( MAKE-3PILE ?auto_143392 ?auto_143393 ?auto_143394 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143401 - BLOCK
      ?auto_143402 - BLOCK
      ?auto_143403 - BLOCK
    )
    :vars
    (
      ?auto_143408 - BLOCK
      ?auto_143407 - BLOCK
      ?auto_143409 - BLOCK
      ?auto_143404 - BLOCK
      ?auto_143405 - BLOCK
      ?auto_143406 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143401 ?auto_143402 ) ) ( not ( = ?auto_143401 ?auto_143403 ) ) ( not ( = ?auto_143402 ?auto_143403 ) ) ( not ( = ?auto_143401 ?auto_143408 ) ) ( not ( = ?auto_143402 ?auto_143408 ) ) ( not ( = ?auto_143403 ?auto_143408 ) ) ( ON-TABLE ?auto_143407 ) ( not ( = ?auto_143407 ?auto_143409 ) ) ( not ( = ?auto_143407 ?auto_143404 ) ) ( not ( = ?auto_143407 ?auto_143405 ) ) ( not ( = ?auto_143407 ?auto_143408 ) ) ( not ( = ?auto_143407 ?auto_143403 ) ) ( not ( = ?auto_143407 ?auto_143402 ) ) ( not ( = ?auto_143409 ?auto_143404 ) ) ( not ( = ?auto_143409 ?auto_143405 ) ) ( not ( = ?auto_143409 ?auto_143408 ) ) ( not ( = ?auto_143409 ?auto_143403 ) ) ( not ( = ?auto_143409 ?auto_143402 ) ) ( not ( = ?auto_143404 ?auto_143405 ) ) ( not ( = ?auto_143404 ?auto_143408 ) ) ( not ( = ?auto_143404 ?auto_143403 ) ) ( not ( = ?auto_143404 ?auto_143402 ) ) ( not ( = ?auto_143405 ?auto_143408 ) ) ( not ( = ?auto_143405 ?auto_143403 ) ) ( not ( = ?auto_143405 ?auto_143402 ) ) ( not ( = ?auto_143401 ?auto_143407 ) ) ( not ( = ?auto_143401 ?auto_143409 ) ) ( not ( = ?auto_143401 ?auto_143404 ) ) ( not ( = ?auto_143401 ?auto_143405 ) ) ( ON ?auto_143401 ?auto_143406 ) ( not ( = ?auto_143401 ?auto_143406 ) ) ( not ( = ?auto_143402 ?auto_143406 ) ) ( not ( = ?auto_143403 ?auto_143406 ) ) ( not ( = ?auto_143408 ?auto_143406 ) ) ( not ( = ?auto_143407 ?auto_143406 ) ) ( not ( = ?auto_143409 ?auto_143406 ) ) ( not ( = ?auto_143404 ?auto_143406 ) ) ( not ( = ?auto_143405 ?auto_143406 ) ) ( ON ?auto_143402 ?auto_143401 ) ( ON-TABLE ?auto_143406 ) ( ON ?auto_143403 ?auto_143402 ) ( ON ?auto_143408 ?auto_143403 ) ( ON ?auto_143405 ?auto_143408 ) ( ON ?auto_143404 ?auto_143405 ) ( CLEAR ?auto_143407 ) ( ON ?auto_143409 ?auto_143404 ) ( CLEAR ?auto_143409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_143406 ?auto_143401 ?auto_143402 ?auto_143403 ?auto_143408 ?auto_143405 ?auto_143404 )
      ( MAKE-3PILE ?auto_143401 ?auto_143402 ?auto_143403 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143410 - BLOCK
      ?auto_143411 - BLOCK
      ?auto_143412 - BLOCK
    )
    :vars
    (
      ?auto_143415 - BLOCK
      ?auto_143413 - BLOCK
      ?auto_143418 - BLOCK
      ?auto_143416 - BLOCK
      ?auto_143414 - BLOCK
      ?auto_143417 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143410 ?auto_143411 ) ) ( not ( = ?auto_143410 ?auto_143412 ) ) ( not ( = ?auto_143411 ?auto_143412 ) ) ( not ( = ?auto_143410 ?auto_143415 ) ) ( not ( = ?auto_143411 ?auto_143415 ) ) ( not ( = ?auto_143412 ?auto_143415 ) ) ( not ( = ?auto_143413 ?auto_143418 ) ) ( not ( = ?auto_143413 ?auto_143416 ) ) ( not ( = ?auto_143413 ?auto_143414 ) ) ( not ( = ?auto_143413 ?auto_143415 ) ) ( not ( = ?auto_143413 ?auto_143412 ) ) ( not ( = ?auto_143413 ?auto_143411 ) ) ( not ( = ?auto_143418 ?auto_143416 ) ) ( not ( = ?auto_143418 ?auto_143414 ) ) ( not ( = ?auto_143418 ?auto_143415 ) ) ( not ( = ?auto_143418 ?auto_143412 ) ) ( not ( = ?auto_143418 ?auto_143411 ) ) ( not ( = ?auto_143416 ?auto_143414 ) ) ( not ( = ?auto_143416 ?auto_143415 ) ) ( not ( = ?auto_143416 ?auto_143412 ) ) ( not ( = ?auto_143416 ?auto_143411 ) ) ( not ( = ?auto_143414 ?auto_143415 ) ) ( not ( = ?auto_143414 ?auto_143412 ) ) ( not ( = ?auto_143414 ?auto_143411 ) ) ( not ( = ?auto_143410 ?auto_143413 ) ) ( not ( = ?auto_143410 ?auto_143418 ) ) ( not ( = ?auto_143410 ?auto_143416 ) ) ( not ( = ?auto_143410 ?auto_143414 ) ) ( ON ?auto_143410 ?auto_143417 ) ( not ( = ?auto_143410 ?auto_143417 ) ) ( not ( = ?auto_143411 ?auto_143417 ) ) ( not ( = ?auto_143412 ?auto_143417 ) ) ( not ( = ?auto_143415 ?auto_143417 ) ) ( not ( = ?auto_143413 ?auto_143417 ) ) ( not ( = ?auto_143418 ?auto_143417 ) ) ( not ( = ?auto_143416 ?auto_143417 ) ) ( not ( = ?auto_143414 ?auto_143417 ) ) ( ON ?auto_143411 ?auto_143410 ) ( ON-TABLE ?auto_143417 ) ( ON ?auto_143412 ?auto_143411 ) ( ON ?auto_143415 ?auto_143412 ) ( ON ?auto_143414 ?auto_143415 ) ( ON ?auto_143416 ?auto_143414 ) ( ON ?auto_143418 ?auto_143416 ) ( CLEAR ?auto_143418 ) ( HOLDING ?auto_143413 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_143413 )
      ( MAKE-3PILE ?auto_143410 ?auto_143411 ?auto_143412 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143419 - BLOCK
      ?auto_143420 - BLOCK
      ?auto_143421 - BLOCK
    )
    :vars
    (
      ?auto_143423 - BLOCK
      ?auto_143426 - BLOCK
      ?auto_143425 - BLOCK
      ?auto_143424 - BLOCK
      ?auto_143422 - BLOCK
      ?auto_143427 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143419 ?auto_143420 ) ) ( not ( = ?auto_143419 ?auto_143421 ) ) ( not ( = ?auto_143420 ?auto_143421 ) ) ( not ( = ?auto_143419 ?auto_143423 ) ) ( not ( = ?auto_143420 ?auto_143423 ) ) ( not ( = ?auto_143421 ?auto_143423 ) ) ( not ( = ?auto_143426 ?auto_143425 ) ) ( not ( = ?auto_143426 ?auto_143424 ) ) ( not ( = ?auto_143426 ?auto_143422 ) ) ( not ( = ?auto_143426 ?auto_143423 ) ) ( not ( = ?auto_143426 ?auto_143421 ) ) ( not ( = ?auto_143426 ?auto_143420 ) ) ( not ( = ?auto_143425 ?auto_143424 ) ) ( not ( = ?auto_143425 ?auto_143422 ) ) ( not ( = ?auto_143425 ?auto_143423 ) ) ( not ( = ?auto_143425 ?auto_143421 ) ) ( not ( = ?auto_143425 ?auto_143420 ) ) ( not ( = ?auto_143424 ?auto_143422 ) ) ( not ( = ?auto_143424 ?auto_143423 ) ) ( not ( = ?auto_143424 ?auto_143421 ) ) ( not ( = ?auto_143424 ?auto_143420 ) ) ( not ( = ?auto_143422 ?auto_143423 ) ) ( not ( = ?auto_143422 ?auto_143421 ) ) ( not ( = ?auto_143422 ?auto_143420 ) ) ( not ( = ?auto_143419 ?auto_143426 ) ) ( not ( = ?auto_143419 ?auto_143425 ) ) ( not ( = ?auto_143419 ?auto_143424 ) ) ( not ( = ?auto_143419 ?auto_143422 ) ) ( ON ?auto_143419 ?auto_143427 ) ( not ( = ?auto_143419 ?auto_143427 ) ) ( not ( = ?auto_143420 ?auto_143427 ) ) ( not ( = ?auto_143421 ?auto_143427 ) ) ( not ( = ?auto_143423 ?auto_143427 ) ) ( not ( = ?auto_143426 ?auto_143427 ) ) ( not ( = ?auto_143425 ?auto_143427 ) ) ( not ( = ?auto_143424 ?auto_143427 ) ) ( not ( = ?auto_143422 ?auto_143427 ) ) ( ON ?auto_143420 ?auto_143419 ) ( ON-TABLE ?auto_143427 ) ( ON ?auto_143421 ?auto_143420 ) ( ON ?auto_143423 ?auto_143421 ) ( ON ?auto_143422 ?auto_143423 ) ( ON ?auto_143424 ?auto_143422 ) ( ON ?auto_143425 ?auto_143424 ) ( ON ?auto_143426 ?auto_143425 ) ( CLEAR ?auto_143426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_143427 ?auto_143419 ?auto_143420 ?auto_143421 ?auto_143423 ?auto_143422 ?auto_143424 ?auto_143425 )
      ( MAKE-3PILE ?auto_143419 ?auto_143420 ?auto_143421 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143432 - BLOCK
      ?auto_143433 - BLOCK
      ?auto_143434 - BLOCK
      ?auto_143435 - BLOCK
    )
    :vars
    (
      ?auto_143436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143436 ?auto_143435 ) ( CLEAR ?auto_143436 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_143432 ) ( ON ?auto_143433 ?auto_143432 ) ( ON ?auto_143434 ?auto_143433 ) ( ON ?auto_143435 ?auto_143434 ) ( not ( = ?auto_143432 ?auto_143433 ) ) ( not ( = ?auto_143432 ?auto_143434 ) ) ( not ( = ?auto_143432 ?auto_143435 ) ) ( not ( = ?auto_143432 ?auto_143436 ) ) ( not ( = ?auto_143433 ?auto_143434 ) ) ( not ( = ?auto_143433 ?auto_143435 ) ) ( not ( = ?auto_143433 ?auto_143436 ) ) ( not ( = ?auto_143434 ?auto_143435 ) ) ( not ( = ?auto_143434 ?auto_143436 ) ) ( not ( = ?auto_143435 ?auto_143436 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143436 ?auto_143435 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143437 - BLOCK
      ?auto_143438 - BLOCK
      ?auto_143439 - BLOCK
      ?auto_143440 - BLOCK
    )
    :vars
    (
      ?auto_143441 - BLOCK
      ?auto_143442 - BLOCK
      ?auto_143443 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143441 ?auto_143440 ) ( CLEAR ?auto_143441 ) ( ON-TABLE ?auto_143437 ) ( ON ?auto_143438 ?auto_143437 ) ( ON ?auto_143439 ?auto_143438 ) ( ON ?auto_143440 ?auto_143439 ) ( not ( = ?auto_143437 ?auto_143438 ) ) ( not ( = ?auto_143437 ?auto_143439 ) ) ( not ( = ?auto_143437 ?auto_143440 ) ) ( not ( = ?auto_143437 ?auto_143441 ) ) ( not ( = ?auto_143438 ?auto_143439 ) ) ( not ( = ?auto_143438 ?auto_143440 ) ) ( not ( = ?auto_143438 ?auto_143441 ) ) ( not ( = ?auto_143439 ?auto_143440 ) ) ( not ( = ?auto_143439 ?auto_143441 ) ) ( not ( = ?auto_143440 ?auto_143441 ) ) ( HOLDING ?auto_143442 ) ( CLEAR ?auto_143443 ) ( not ( = ?auto_143437 ?auto_143442 ) ) ( not ( = ?auto_143437 ?auto_143443 ) ) ( not ( = ?auto_143438 ?auto_143442 ) ) ( not ( = ?auto_143438 ?auto_143443 ) ) ( not ( = ?auto_143439 ?auto_143442 ) ) ( not ( = ?auto_143439 ?auto_143443 ) ) ( not ( = ?auto_143440 ?auto_143442 ) ) ( not ( = ?auto_143440 ?auto_143443 ) ) ( not ( = ?auto_143441 ?auto_143442 ) ) ( not ( = ?auto_143441 ?auto_143443 ) ) ( not ( = ?auto_143442 ?auto_143443 ) ) )
    :subtasks
    ( ( !STACK ?auto_143442 ?auto_143443 )
      ( MAKE-4PILE ?auto_143437 ?auto_143438 ?auto_143439 ?auto_143440 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143444 - BLOCK
      ?auto_143445 - BLOCK
      ?auto_143446 - BLOCK
      ?auto_143447 - BLOCK
    )
    :vars
    (
      ?auto_143448 - BLOCK
      ?auto_143449 - BLOCK
      ?auto_143450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143448 ?auto_143447 ) ( ON-TABLE ?auto_143444 ) ( ON ?auto_143445 ?auto_143444 ) ( ON ?auto_143446 ?auto_143445 ) ( ON ?auto_143447 ?auto_143446 ) ( not ( = ?auto_143444 ?auto_143445 ) ) ( not ( = ?auto_143444 ?auto_143446 ) ) ( not ( = ?auto_143444 ?auto_143447 ) ) ( not ( = ?auto_143444 ?auto_143448 ) ) ( not ( = ?auto_143445 ?auto_143446 ) ) ( not ( = ?auto_143445 ?auto_143447 ) ) ( not ( = ?auto_143445 ?auto_143448 ) ) ( not ( = ?auto_143446 ?auto_143447 ) ) ( not ( = ?auto_143446 ?auto_143448 ) ) ( not ( = ?auto_143447 ?auto_143448 ) ) ( CLEAR ?auto_143449 ) ( not ( = ?auto_143444 ?auto_143450 ) ) ( not ( = ?auto_143444 ?auto_143449 ) ) ( not ( = ?auto_143445 ?auto_143450 ) ) ( not ( = ?auto_143445 ?auto_143449 ) ) ( not ( = ?auto_143446 ?auto_143450 ) ) ( not ( = ?auto_143446 ?auto_143449 ) ) ( not ( = ?auto_143447 ?auto_143450 ) ) ( not ( = ?auto_143447 ?auto_143449 ) ) ( not ( = ?auto_143448 ?auto_143450 ) ) ( not ( = ?auto_143448 ?auto_143449 ) ) ( not ( = ?auto_143450 ?auto_143449 ) ) ( ON ?auto_143450 ?auto_143448 ) ( CLEAR ?auto_143450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_143444 ?auto_143445 ?auto_143446 ?auto_143447 ?auto_143448 )
      ( MAKE-4PILE ?auto_143444 ?auto_143445 ?auto_143446 ?auto_143447 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143451 - BLOCK
      ?auto_143452 - BLOCK
      ?auto_143453 - BLOCK
      ?auto_143454 - BLOCK
    )
    :vars
    (
      ?auto_143455 - BLOCK
      ?auto_143456 - BLOCK
      ?auto_143457 - BLOCK
      ?auto_143458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143455 ?auto_143454 ) ( ON-TABLE ?auto_143451 ) ( ON ?auto_143452 ?auto_143451 ) ( ON ?auto_143453 ?auto_143452 ) ( ON ?auto_143454 ?auto_143453 ) ( not ( = ?auto_143451 ?auto_143452 ) ) ( not ( = ?auto_143451 ?auto_143453 ) ) ( not ( = ?auto_143451 ?auto_143454 ) ) ( not ( = ?auto_143451 ?auto_143455 ) ) ( not ( = ?auto_143452 ?auto_143453 ) ) ( not ( = ?auto_143452 ?auto_143454 ) ) ( not ( = ?auto_143452 ?auto_143455 ) ) ( not ( = ?auto_143453 ?auto_143454 ) ) ( not ( = ?auto_143453 ?auto_143455 ) ) ( not ( = ?auto_143454 ?auto_143455 ) ) ( not ( = ?auto_143451 ?auto_143456 ) ) ( not ( = ?auto_143451 ?auto_143457 ) ) ( not ( = ?auto_143452 ?auto_143456 ) ) ( not ( = ?auto_143452 ?auto_143457 ) ) ( not ( = ?auto_143453 ?auto_143456 ) ) ( not ( = ?auto_143453 ?auto_143457 ) ) ( not ( = ?auto_143454 ?auto_143456 ) ) ( not ( = ?auto_143454 ?auto_143457 ) ) ( not ( = ?auto_143455 ?auto_143456 ) ) ( not ( = ?auto_143455 ?auto_143457 ) ) ( not ( = ?auto_143456 ?auto_143457 ) ) ( ON ?auto_143456 ?auto_143455 ) ( CLEAR ?auto_143456 ) ( HOLDING ?auto_143457 ) ( CLEAR ?auto_143458 ) ( ON-TABLE ?auto_143458 ) ( not ( = ?auto_143458 ?auto_143457 ) ) ( not ( = ?auto_143451 ?auto_143458 ) ) ( not ( = ?auto_143452 ?auto_143458 ) ) ( not ( = ?auto_143453 ?auto_143458 ) ) ( not ( = ?auto_143454 ?auto_143458 ) ) ( not ( = ?auto_143455 ?auto_143458 ) ) ( not ( = ?auto_143456 ?auto_143458 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143458 ?auto_143457 )
      ( MAKE-4PILE ?auto_143451 ?auto_143452 ?auto_143453 ?auto_143454 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143459 - BLOCK
      ?auto_143460 - BLOCK
      ?auto_143461 - BLOCK
      ?auto_143462 - BLOCK
    )
    :vars
    (
      ?auto_143465 - BLOCK
      ?auto_143466 - BLOCK
      ?auto_143464 - BLOCK
      ?auto_143463 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143465 ?auto_143462 ) ( ON-TABLE ?auto_143459 ) ( ON ?auto_143460 ?auto_143459 ) ( ON ?auto_143461 ?auto_143460 ) ( ON ?auto_143462 ?auto_143461 ) ( not ( = ?auto_143459 ?auto_143460 ) ) ( not ( = ?auto_143459 ?auto_143461 ) ) ( not ( = ?auto_143459 ?auto_143462 ) ) ( not ( = ?auto_143459 ?auto_143465 ) ) ( not ( = ?auto_143460 ?auto_143461 ) ) ( not ( = ?auto_143460 ?auto_143462 ) ) ( not ( = ?auto_143460 ?auto_143465 ) ) ( not ( = ?auto_143461 ?auto_143462 ) ) ( not ( = ?auto_143461 ?auto_143465 ) ) ( not ( = ?auto_143462 ?auto_143465 ) ) ( not ( = ?auto_143459 ?auto_143466 ) ) ( not ( = ?auto_143459 ?auto_143464 ) ) ( not ( = ?auto_143460 ?auto_143466 ) ) ( not ( = ?auto_143460 ?auto_143464 ) ) ( not ( = ?auto_143461 ?auto_143466 ) ) ( not ( = ?auto_143461 ?auto_143464 ) ) ( not ( = ?auto_143462 ?auto_143466 ) ) ( not ( = ?auto_143462 ?auto_143464 ) ) ( not ( = ?auto_143465 ?auto_143466 ) ) ( not ( = ?auto_143465 ?auto_143464 ) ) ( not ( = ?auto_143466 ?auto_143464 ) ) ( ON ?auto_143466 ?auto_143465 ) ( CLEAR ?auto_143463 ) ( ON-TABLE ?auto_143463 ) ( not ( = ?auto_143463 ?auto_143464 ) ) ( not ( = ?auto_143459 ?auto_143463 ) ) ( not ( = ?auto_143460 ?auto_143463 ) ) ( not ( = ?auto_143461 ?auto_143463 ) ) ( not ( = ?auto_143462 ?auto_143463 ) ) ( not ( = ?auto_143465 ?auto_143463 ) ) ( not ( = ?auto_143466 ?auto_143463 ) ) ( ON ?auto_143464 ?auto_143466 ) ( CLEAR ?auto_143464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_143459 ?auto_143460 ?auto_143461 ?auto_143462 ?auto_143465 ?auto_143466 )
      ( MAKE-4PILE ?auto_143459 ?auto_143460 ?auto_143461 ?auto_143462 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143467 - BLOCK
      ?auto_143468 - BLOCK
      ?auto_143469 - BLOCK
      ?auto_143470 - BLOCK
    )
    :vars
    (
      ?auto_143473 - BLOCK
      ?auto_143471 - BLOCK
      ?auto_143474 - BLOCK
      ?auto_143472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143473 ?auto_143470 ) ( ON-TABLE ?auto_143467 ) ( ON ?auto_143468 ?auto_143467 ) ( ON ?auto_143469 ?auto_143468 ) ( ON ?auto_143470 ?auto_143469 ) ( not ( = ?auto_143467 ?auto_143468 ) ) ( not ( = ?auto_143467 ?auto_143469 ) ) ( not ( = ?auto_143467 ?auto_143470 ) ) ( not ( = ?auto_143467 ?auto_143473 ) ) ( not ( = ?auto_143468 ?auto_143469 ) ) ( not ( = ?auto_143468 ?auto_143470 ) ) ( not ( = ?auto_143468 ?auto_143473 ) ) ( not ( = ?auto_143469 ?auto_143470 ) ) ( not ( = ?auto_143469 ?auto_143473 ) ) ( not ( = ?auto_143470 ?auto_143473 ) ) ( not ( = ?auto_143467 ?auto_143471 ) ) ( not ( = ?auto_143467 ?auto_143474 ) ) ( not ( = ?auto_143468 ?auto_143471 ) ) ( not ( = ?auto_143468 ?auto_143474 ) ) ( not ( = ?auto_143469 ?auto_143471 ) ) ( not ( = ?auto_143469 ?auto_143474 ) ) ( not ( = ?auto_143470 ?auto_143471 ) ) ( not ( = ?auto_143470 ?auto_143474 ) ) ( not ( = ?auto_143473 ?auto_143471 ) ) ( not ( = ?auto_143473 ?auto_143474 ) ) ( not ( = ?auto_143471 ?auto_143474 ) ) ( ON ?auto_143471 ?auto_143473 ) ( not ( = ?auto_143472 ?auto_143474 ) ) ( not ( = ?auto_143467 ?auto_143472 ) ) ( not ( = ?auto_143468 ?auto_143472 ) ) ( not ( = ?auto_143469 ?auto_143472 ) ) ( not ( = ?auto_143470 ?auto_143472 ) ) ( not ( = ?auto_143473 ?auto_143472 ) ) ( not ( = ?auto_143471 ?auto_143472 ) ) ( ON ?auto_143474 ?auto_143471 ) ( CLEAR ?auto_143474 ) ( HOLDING ?auto_143472 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_143472 )
      ( MAKE-4PILE ?auto_143467 ?auto_143468 ?auto_143469 ?auto_143470 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143475 - BLOCK
      ?auto_143476 - BLOCK
      ?auto_143477 - BLOCK
      ?auto_143478 - BLOCK
    )
    :vars
    (
      ?auto_143481 - BLOCK
      ?auto_143480 - BLOCK
      ?auto_143482 - BLOCK
      ?auto_143479 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143481 ?auto_143478 ) ( ON-TABLE ?auto_143475 ) ( ON ?auto_143476 ?auto_143475 ) ( ON ?auto_143477 ?auto_143476 ) ( ON ?auto_143478 ?auto_143477 ) ( not ( = ?auto_143475 ?auto_143476 ) ) ( not ( = ?auto_143475 ?auto_143477 ) ) ( not ( = ?auto_143475 ?auto_143478 ) ) ( not ( = ?auto_143475 ?auto_143481 ) ) ( not ( = ?auto_143476 ?auto_143477 ) ) ( not ( = ?auto_143476 ?auto_143478 ) ) ( not ( = ?auto_143476 ?auto_143481 ) ) ( not ( = ?auto_143477 ?auto_143478 ) ) ( not ( = ?auto_143477 ?auto_143481 ) ) ( not ( = ?auto_143478 ?auto_143481 ) ) ( not ( = ?auto_143475 ?auto_143480 ) ) ( not ( = ?auto_143475 ?auto_143482 ) ) ( not ( = ?auto_143476 ?auto_143480 ) ) ( not ( = ?auto_143476 ?auto_143482 ) ) ( not ( = ?auto_143477 ?auto_143480 ) ) ( not ( = ?auto_143477 ?auto_143482 ) ) ( not ( = ?auto_143478 ?auto_143480 ) ) ( not ( = ?auto_143478 ?auto_143482 ) ) ( not ( = ?auto_143481 ?auto_143480 ) ) ( not ( = ?auto_143481 ?auto_143482 ) ) ( not ( = ?auto_143480 ?auto_143482 ) ) ( ON ?auto_143480 ?auto_143481 ) ( not ( = ?auto_143479 ?auto_143482 ) ) ( not ( = ?auto_143475 ?auto_143479 ) ) ( not ( = ?auto_143476 ?auto_143479 ) ) ( not ( = ?auto_143477 ?auto_143479 ) ) ( not ( = ?auto_143478 ?auto_143479 ) ) ( not ( = ?auto_143481 ?auto_143479 ) ) ( not ( = ?auto_143480 ?auto_143479 ) ) ( ON ?auto_143482 ?auto_143480 ) ( ON ?auto_143479 ?auto_143482 ) ( CLEAR ?auto_143479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_143475 ?auto_143476 ?auto_143477 ?auto_143478 ?auto_143481 ?auto_143480 ?auto_143482 )
      ( MAKE-4PILE ?auto_143475 ?auto_143476 ?auto_143477 ?auto_143478 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143483 - BLOCK
      ?auto_143484 - BLOCK
      ?auto_143485 - BLOCK
      ?auto_143486 - BLOCK
    )
    :vars
    (
      ?auto_143489 - BLOCK
      ?auto_143487 - BLOCK
      ?auto_143490 - BLOCK
      ?auto_143488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143489 ?auto_143486 ) ( ON-TABLE ?auto_143483 ) ( ON ?auto_143484 ?auto_143483 ) ( ON ?auto_143485 ?auto_143484 ) ( ON ?auto_143486 ?auto_143485 ) ( not ( = ?auto_143483 ?auto_143484 ) ) ( not ( = ?auto_143483 ?auto_143485 ) ) ( not ( = ?auto_143483 ?auto_143486 ) ) ( not ( = ?auto_143483 ?auto_143489 ) ) ( not ( = ?auto_143484 ?auto_143485 ) ) ( not ( = ?auto_143484 ?auto_143486 ) ) ( not ( = ?auto_143484 ?auto_143489 ) ) ( not ( = ?auto_143485 ?auto_143486 ) ) ( not ( = ?auto_143485 ?auto_143489 ) ) ( not ( = ?auto_143486 ?auto_143489 ) ) ( not ( = ?auto_143483 ?auto_143487 ) ) ( not ( = ?auto_143483 ?auto_143490 ) ) ( not ( = ?auto_143484 ?auto_143487 ) ) ( not ( = ?auto_143484 ?auto_143490 ) ) ( not ( = ?auto_143485 ?auto_143487 ) ) ( not ( = ?auto_143485 ?auto_143490 ) ) ( not ( = ?auto_143486 ?auto_143487 ) ) ( not ( = ?auto_143486 ?auto_143490 ) ) ( not ( = ?auto_143489 ?auto_143487 ) ) ( not ( = ?auto_143489 ?auto_143490 ) ) ( not ( = ?auto_143487 ?auto_143490 ) ) ( ON ?auto_143487 ?auto_143489 ) ( not ( = ?auto_143488 ?auto_143490 ) ) ( not ( = ?auto_143483 ?auto_143488 ) ) ( not ( = ?auto_143484 ?auto_143488 ) ) ( not ( = ?auto_143485 ?auto_143488 ) ) ( not ( = ?auto_143486 ?auto_143488 ) ) ( not ( = ?auto_143489 ?auto_143488 ) ) ( not ( = ?auto_143487 ?auto_143488 ) ) ( ON ?auto_143490 ?auto_143487 ) ( HOLDING ?auto_143488 ) ( CLEAR ?auto_143490 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_143483 ?auto_143484 ?auto_143485 ?auto_143486 ?auto_143489 ?auto_143487 ?auto_143490 ?auto_143488 )
      ( MAKE-4PILE ?auto_143483 ?auto_143484 ?auto_143485 ?auto_143486 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143491 - BLOCK
      ?auto_143492 - BLOCK
      ?auto_143493 - BLOCK
      ?auto_143494 - BLOCK
    )
    :vars
    (
      ?auto_143498 - BLOCK
      ?auto_143496 - BLOCK
      ?auto_143497 - BLOCK
      ?auto_143495 - BLOCK
      ?auto_143499 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143498 ?auto_143494 ) ( ON-TABLE ?auto_143491 ) ( ON ?auto_143492 ?auto_143491 ) ( ON ?auto_143493 ?auto_143492 ) ( ON ?auto_143494 ?auto_143493 ) ( not ( = ?auto_143491 ?auto_143492 ) ) ( not ( = ?auto_143491 ?auto_143493 ) ) ( not ( = ?auto_143491 ?auto_143494 ) ) ( not ( = ?auto_143491 ?auto_143498 ) ) ( not ( = ?auto_143492 ?auto_143493 ) ) ( not ( = ?auto_143492 ?auto_143494 ) ) ( not ( = ?auto_143492 ?auto_143498 ) ) ( not ( = ?auto_143493 ?auto_143494 ) ) ( not ( = ?auto_143493 ?auto_143498 ) ) ( not ( = ?auto_143494 ?auto_143498 ) ) ( not ( = ?auto_143491 ?auto_143496 ) ) ( not ( = ?auto_143491 ?auto_143497 ) ) ( not ( = ?auto_143492 ?auto_143496 ) ) ( not ( = ?auto_143492 ?auto_143497 ) ) ( not ( = ?auto_143493 ?auto_143496 ) ) ( not ( = ?auto_143493 ?auto_143497 ) ) ( not ( = ?auto_143494 ?auto_143496 ) ) ( not ( = ?auto_143494 ?auto_143497 ) ) ( not ( = ?auto_143498 ?auto_143496 ) ) ( not ( = ?auto_143498 ?auto_143497 ) ) ( not ( = ?auto_143496 ?auto_143497 ) ) ( ON ?auto_143496 ?auto_143498 ) ( not ( = ?auto_143495 ?auto_143497 ) ) ( not ( = ?auto_143491 ?auto_143495 ) ) ( not ( = ?auto_143492 ?auto_143495 ) ) ( not ( = ?auto_143493 ?auto_143495 ) ) ( not ( = ?auto_143494 ?auto_143495 ) ) ( not ( = ?auto_143498 ?auto_143495 ) ) ( not ( = ?auto_143496 ?auto_143495 ) ) ( ON ?auto_143497 ?auto_143496 ) ( CLEAR ?auto_143497 ) ( ON ?auto_143495 ?auto_143499 ) ( CLEAR ?auto_143495 ) ( HAND-EMPTY ) ( not ( = ?auto_143491 ?auto_143499 ) ) ( not ( = ?auto_143492 ?auto_143499 ) ) ( not ( = ?auto_143493 ?auto_143499 ) ) ( not ( = ?auto_143494 ?auto_143499 ) ) ( not ( = ?auto_143498 ?auto_143499 ) ) ( not ( = ?auto_143496 ?auto_143499 ) ) ( not ( = ?auto_143497 ?auto_143499 ) ) ( not ( = ?auto_143495 ?auto_143499 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143495 ?auto_143499 )
      ( MAKE-4PILE ?auto_143491 ?auto_143492 ?auto_143493 ?auto_143494 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143500 - BLOCK
      ?auto_143501 - BLOCK
      ?auto_143502 - BLOCK
      ?auto_143503 - BLOCK
    )
    :vars
    (
      ?auto_143505 - BLOCK
      ?auto_143507 - BLOCK
      ?auto_143508 - BLOCK
      ?auto_143506 - BLOCK
      ?auto_143504 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143505 ?auto_143503 ) ( ON-TABLE ?auto_143500 ) ( ON ?auto_143501 ?auto_143500 ) ( ON ?auto_143502 ?auto_143501 ) ( ON ?auto_143503 ?auto_143502 ) ( not ( = ?auto_143500 ?auto_143501 ) ) ( not ( = ?auto_143500 ?auto_143502 ) ) ( not ( = ?auto_143500 ?auto_143503 ) ) ( not ( = ?auto_143500 ?auto_143505 ) ) ( not ( = ?auto_143501 ?auto_143502 ) ) ( not ( = ?auto_143501 ?auto_143503 ) ) ( not ( = ?auto_143501 ?auto_143505 ) ) ( not ( = ?auto_143502 ?auto_143503 ) ) ( not ( = ?auto_143502 ?auto_143505 ) ) ( not ( = ?auto_143503 ?auto_143505 ) ) ( not ( = ?auto_143500 ?auto_143507 ) ) ( not ( = ?auto_143500 ?auto_143508 ) ) ( not ( = ?auto_143501 ?auto_143507 ) ) ( not ( = ?auto_143501 ?auto_143508 ) ) ( not ( = ?auto_143502 ?auto_143507 ) ) ( not ( = ?auto_143502 ?auto_143508 ) ) ( not ( = ?auto_143503 ?auto_143507 ) ) ( not ( = ?auto_143503 ?auto_143508 ) ) ( not ( = ?auto_143505 ?auto_143507 ) ) ( not ( = ?auto_143505 ?auto_143508 ) ) ( not ( = ?auto_143507 ?auto_143508 ) ) ( ON ?auto_143507 ?auto_143505 ) ( not ( = ?auto_143506 ?auto_143508 ) ) ( not ( = ?auto_143500 ?auto_143506 ) ) ( not ( = ?auto_143501 ?auto_143506 ) ) ( not ( = ?auto_143502 ?auto_143506 ) ) ( not ( = ?auto_143503 ?auto_143506 ) ) ( not ( = ?auto_143505 ?auto_143506 ) ) ( not ( = ?auto_143507 ?auto_143506 ) ) ( ON ?auto_143506 ?auto_143504 ) ( CLEAR ?auto_143506 ) ( not ( = ?auto_143500 ?auto_143504 ) ) ( not ( = ?auto_143501 ?auto_143504 ) ) ( not ( = ?auto_143502 ?auto_143504 ) ) ( not ( = ?auto_143503 ?auto_143504 ) ) ( not ( = ?auto_143505 ?auto_143504 ) ) ( not ( = ?auto_143507 ?auto_143504 ) ) ( not ( = ?auto_143508 ?auto_143504 ) ) ( not ( = ?auto_143506 ?auto_143504 ) ) ( HOLDING ?auto_143508 ) ( CLEAR ?auto_143507 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_143500 ?auto_143501 ?auto_143502 ?auto_143503 ?auto_143505 ?auto_143507 ?auto_143508 )
      ( MAKE-4PILE ?auto_143500 ?auto_143501 ?auto_143502 ?auto_143503 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143509 - BLOCK
      ?auto_143510 - BLOCK
      ?auto_143511 - BLOCK
      ?auto_143512 - BLOCK
    )
    :vars
    (
      ?auto_143516 - BLOCK
      ?auto_143515 - BLOCK
      ?auto_143514 - BLOCK
      ?auto_143513 - BLOCK
      ?auto_143517 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143516 ?auto_143512 ) ( ON-TABLE ?auto_143509 ) ( ON ?auto_143510 ?auto_143509 ) ( ON ?auto_143511 ?auto_143510 ) ( ON ?auto_143512 ?auto_143511 ) ( not ( = ?auto_143509 ?auto_143510 ) ) ( not ( = ?auto_143509 ?auto_143511 ) ) ( not ( = ?auto_143509 ?auto_143512 ) ) ( not ( = ?auto_143509 ?auto_143516 ) ) ( not ( = ?auto_143510 ?auto_143511 ) ) ( not ( = ?auto_143510 ?auto_143512 ) ) ( not ( = ?auto_143510 ?auto_143516 ) ) ( not ( = ?auto_143511 ?auto_143512 ) ) ( not ( = ?auto_143511 ?auto_143516 ) ) ( not ( = ?auto_143512 ?auto_143516 ) ) ( not ( = ?auto_143509 ?auto_143515 ) ) ( not ( = ?auto_143509 ?auto_143514 ) ) ( not ( = ?auto_143510 ?auto_143515 ) ) ( not ( = ?auto_143510 ?auto_143514 ) ) ( not ( = ?auto_143511 ?auto_143515 ) ) ( not ( = ?auto_143511 ?auto_143514 ) ) ( not ( = ?auto_143512 ?auto_143515 ) ) ( not ( = ?auto_143512 ?auto_143514 ) ) ( not ( = ?auto_143516 ?auto_143515 ) ) ( not ( = ?auto_143516 ?auto_143514 ) ) ( not ( = ?auto_143515 ?auto_143514 ) ) ( ON ?auto_143515 ?auto_143516 ) ( not ( = ?auto_143513 ?auto_143514 ) ) ( not ( = ?auto_143509 ?auto_143513 ) ) ( not ( = ?auto_143510 ?auto_143513 ) ) ( not ( = ?auto_143511 ?auto_143513 ) ) ( not ( = ?auto_143512 ?auto_143513 ) ) ( not ( = ?auto_143516 ?auto_143513 ) ) ( not ( = ?auto_143515 ?auto_143513 ) ) ( ON ?auto_143513 ?auto_143517 ) ( not ( = ?auto_143509 ?auto_143517 ) ) ( not ( = ?auto_143510 ?auto_143517 ) ) ( not ( = ?auto_143511 ?auto_143517 ) ) ( not ( = ?auto_143512 ?auto_143517 ) ) ( not ( = ?auto_143516 ?auto_143517 ) ) ( not ( = ?auto_143515 ?auto_143517 ) ) ( not ( = ?auto_143514 ?auto_143517 ) ) ( not ( = ?auto_143513 ?auto_143517 ) ) ( CLEAR ?auto_143515 ) ( ON ?auto_143514 ?auto_143513 ) ( CLEAR ?auto_143514 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_143517 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143517 ?auto_143513 )
      ( MAKE-4PILE ?auto_143509 ?auto_143510 ?auto_143511 ?auto_143512 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143518 - BLOCK
      ?auto_143519 - BLOCK
      ?auto_143520 - BLOCK
      ?auto_143521 - BLOCK
    )
    :vars
    (
      ?auto_143523 - BLOCK
      ?auto_143522 - BLOCK
      ?auto_143525 - BLOCK
      ?auto_143524 - BLOCK
      ?auto_143526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143523 ?auto_143521 ) ( ON-TABLE ?auto_143518 ) ( ON ?auto_143519 ?auto_143518 ) ( ON ?auto_143520 ?auto_143519 ) ( ON ?auto_143521 ?auto_143520 ) ( not ( = ?auto_143518 ?auto_143519 ) ) ( not ( = ?auto_143518 ?auto_143520 ) ) ( not ( = ?auto_143518 ?auto_143521 ) ) ( not ( = ?auto_143518 ?auto_143523 ) ) ( not ( = ?auto_143519 ?auto_143520 ) ) ( not ( = ?auto_143519 ?auto_143521 ) ) ( not ( = ?auto_143519 ?auto_143523 ) ) ( not ( = ?auto_143520 ?auto_143521 ) ) ( not ( = ?auto_143520 ?auto_143523 ) ) ( not ( = ?auto_143521 ?auto_143523 ) ) ( not ( = ?auto_143518 ?auto_143522 ) ) ( not ( = ?auto_143518 ?auto_143525 ) ) ( not ( = ?auto_143519 ?auto_143522 ) ) ( not ( = ?auto_143519 ?auto_143525 ) ) ( not ( = ?auto_143520 ?auto_143522 ) ) ( not ( = ?auto_143520 ?auto_143525 ) ) ( not ( = ?auto_143521 ?auto_143522 ) ) ( not ( = ?auto_143521 ?auto_143525 ) ) ( not ( = ?auto_143523 ?auto_143522 ) ) ( not ( = ?auto_143523 ?auto_143525 ) ) ( not ( = ?auto_143522 ?auto_143525 ) ) ( not ( = ?auto_143524 ?auto_143525 ) ) ( not ( = ?auto_143518 ?auto_143524 ) ) ( not ( = ?auto_143519 ?auto_143524 ) ) ( not ( = ?auto_143520 ?auto_143524 ) ) ( not ( = ?auto_143521 ?auto_143524 ) ) ( not ( = ?auto_143523 ?auto_143524 ) ) ( not ( = ?auto_143522 ?auto_143524 ) ) ( ON ?auto_143524 ?auto_143526 ) ( not ( = ?auto_143518 ?auto_143526 ) ) ( not ( = ?auto_143519 ?auto_143526 ) ) ( not ( = ?auto_143520 ?auto_143526 ) ) ( not ( = ?auto_143521 ?auto_143526 ) ) ( not ( = ?auto_143523 ?auto_143526 ) ) ( not ( = ?auto_143522 ?auto_143526 ) ) ( not ( = ?auto_143525 ?auto_143526 ) ) ( not ( = ?auto_143524 ?auto_143526 ) ) ( ON ?auto_143525 ?auto_143524 ) ( CLEAR ?auto_143525 ) ( ON-TABLE ?auto_143526 ) ( HOLDING ?auto_143522 ) ( CLEAR ?auto_143523 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_143518 ?auto_143519 ?auto_143520 ?auto_143521 ?auto_143523 ?auto_143522 )
      ( MAKE-4PILE ?auto_143518 ?auto_143519 ?auto_143520 ?auto_143521 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143527 - BLOCK
      ?auto_143528 - BLOCK
      ?auto_143529 - BLOCK
      ?auto_143530 - BLOCK
    )
    :vars
    (
      ?auto_143531 - BLOCK
      ?auto_143533 - BLOCK
      ?auto_143534 - BLOCK
      ?auto_143535 - BLOCK
      ?auto_143532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143531 ?auto_143530 ) ( ON-TABLE ?auto_143527 ) ( ON ?auto_143528 ?auto_143527 ) ( ON ?auto_143529 ?auto_143528 ) ( ON ?auto_143530 ?auto_143529 ) ( not ( = ?auto_143527 ?auto_143528 ) ) ( not ( = ?auto_143527 ?auto_143529 ) ) ( not ( = ?auto_143527 ?auto_143530 ) ) ( not ( = ?auto_143527 ?auto_143531 ) ) ( not ( = ?auto_143528 ?auto_143529 ) ) ( not ( = ?auto_143528 ?auto_143530 ) ) ( not ( = ?auto_143528 ?auto_143531 ) ) ( not ( = ?auto_143529 ?auto_143530 ) ) ( not ( = ?auto_143529 ?auto_143531 ) ) ( not ( = ?auto_143530 ?auto_143531 ) ) ( not ( = ?auto_143527 ?auto_143533 ) ) ( not ( = ?auto_143527 ?auto_143534 ) ) ( not ( = ?auto_143528 ?auto_143533 ) ) ( not ( = ?auto_143528 ?auto_143534 ) ) ( not ( = ?auto_143529 ?auto_143533 ) ) ( not ( = ?auto_143529 ?auto_143534 ) ) ( not ( = ?auto_143530 ?auto_143533 ) ) ( not ( = ?auto_143530 ?auto_143534 ) ) ( not ( = ?auto_143531 ?auto_143533 ) ) ( not ( = ?auto_143531 ?auto_143534 ) ) ( not ( = ?auto_143533 ?auto_143534 ) ) ( not ( = ?auto_143535 ?auto_143534 ) ) ( not ( = ?auto_143527 ?auto_143535 ) ) ( not ( = ?auto_143528 ?auto_143535 ) ) ( not ( = ?auto_143529 ?auto_143535 ) ) ( not ( = ?auto_143530 ?auto_143535 ) ) ( not ( = ?auto_143531 ?auto_143535 ) ) ( not ( = ?auto_143533 ?auto_143535 ) ) ( ON ?auto_143535 ?auto_143532 ) ( not ( = ?auto_143527 ?auto_143532 ) ) ( not ( = ?auto_143528 ?auto_143532 ) ) ( not ( = ?auto_143529 ?auto_143532 ) ) ( not ( = ?auto_143530 ?auto_143532 ) ) ( not ( = ?auto_143531 ?auto_143532 ) ) ( not ( = ?auto_143533 ?auto_143532 ) ) ( not ( = ?auto_143534 ?auto_143532 ) ) ( not ( = ?auto_143535 ?auto_143532 ) ) ( ON ?auto_143534 ?auto_143535 ) ( ON-TABLE ?auto_143532 ) ( CLEAR ?auto_143531 ) ( ON ?auto_143533 ?auto_143534 ) ( CLEAR ?auto_143533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_143532 ?auto_143535 ?auto_143534 )
      ( MAKE-4PILE ?auto_143527 ?auto_143528 ?auto_143529 ?auto_143530 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143554 - BLOCK
      ?auto_143555 - BLOCK
      ?auto_143556 - BLOCK
      ?auto_143557 - BLOCK
    )
    :vars
    (
      ?auto_143562 - BLOCK
      ?auto_143560 - BLOCK
      ?auto_143558 - BLOCK
      ?auto_143561 - BLOCK
      ?auto_143559 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143554 ) ( ON ?auto_143555 ?auto_143554 ) ( ON ?auto_143556 ?auto_143555 ) ( not ( = ?auto_143554 ?auto_143555 ) ) ( not ( = ?auto_143554 ?auto_143556 ) ) ( not ( = ?auto_143554 ?auto_143557 ) ) ( not ( = ?auto_143554 ?auto_143562 ) ) ( not ( = ?auto_143555 ?auto_143556 ) ) ( not ( = ?auto_143555 ?auto_143557 ) ) ( not ( = ?auto_143555 ?auto_143562 ) ) ( not ( = ?auto_143556 ?auto_143557 ) ) ( not ( = ?auto_143556 ?auto_143562 ) ) ( not ( = ?auto_143557 ?auto_143562 ) ) ( not ( = ?auto_143554 ?auto_143560 ) ) ( not ( = ?auto_143554 ?auto_143558 ) ) ( not ( = ?auto_143555 ?auto_143560 ) ) ( not ( = ?auto_143555 ?auto_143558 ) ) ( not ( = ?auto_143556 ?auto_143560 ) ) ( not ( = ?auto_143556 ?auto_143558 ) ) ( not ( = ?auto_143557 ?auto_143560 ) ) ( not ( = ?auto_143557 ?auto_143558 ) ) ( not ( = ?auto_143562 ?auto_143560 ) ) ( not ( = ?auto_143562 ?auto_143558 ) ) ( not ( = ?auto_143560 ?auto_143558 ) ) ( not ( = ?auto_143561 ?auto_143558 ) ) ( not ( = ?auto_143554 ?auto_143561 ) ) ( not ( = ?auto_143555 ?auto_143561 ) ) ( not ( = ?auto_143556 ?auto_143561 ) ) ( not ( = ?auto_143557 ?auto_143561 ) ) ( not ( = ?auto_143562 ?auto_143561 ) ) ( not ( = ?auto_143560 ?auto_143561 ) ) ( ON ?auto_143561 ?auto_143559 ) ( not ( = ?auto_143554 ?auto_143559 ) ) ( not ( = ?auto_143555 ?auto_143559 ) ) ( not ( = ?auto_143556 ?auto_143559 ) ) ( not ( = ?auto_143557 ?auto_143559 ) ) ( not ( = ?auto_143562 ?auto_143559 ) ) ( not ( = ?auto_143560 ?auto_143559 ) ) ( not ( = ?auto_143558 ?auto_143559 ) ) ( not ( = ?auto_143561 ?auto_143559 ) ) ( ON ?auto_143558 ?auto_143561 ) ( ON-TABLE ?auto_143559 ) ( ON ?auto_143560 ?auto_143558 ) ( ON ?auto_143562 ?auto_143560 ) ( CLEAR ?auto_143562 ) ( HOLDING ?auto_143557 ) ( CLEAR ?auto_143556 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_143554 ?auto_143555 ?auto_143556 ?auto_143557 ?auto_143562 )
      ( MAKE-4PILE ?auto_143554 ?auto_143555 ?auto_143556 ?auto_143557 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143563 - BLOCK
      ?auto_143564 - BLOCK
      ?auto_143565 - BLOCK
      ?auto_143566 - BLOCK
    )
    :vars
    (
      ?auto_143571 - BLOCK
      ?auto_143570 - BLOCK
      ?auto_143567 - BLOCK
      ?auto_143569 - BLOCK
      ?auto_143568 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143563 ) ( ON ?auto_143564 ?auto_143563 ) ( ON ?auto_143565 ?auto_143564 ) ( not ( = ?auto_143563 ?auto_143564 ) ) ( not ( = ?auto_143563 ?auto_143565 ) ) ( not ( = ?auto_143563 ?auto_143566 ) ) ( not ( = ?auto_143563 ?auto_143571 ) ) ( not ( = ?auto_143564 ?auto_143565 ) ) ( not ( = ?auto_143564 ?auto_143566 ) ) ( not ( = ?auto_143564 ?auto_143571 ) ) ( not ( = ?auto_143565 ?auto_143566 ) ) ( not ( = ?auto_143565 ?auto_143571 ) ) ( not ( = ?auto_143566 ?auto_143571 ) ) ( not ( = ?auto_143563 ?auto_143570 ) ) ( not ( = ?auto_143563 ?auto_143567 ) ) ( not ( = ?auto_143564 ?auto_143570 ) ) ( not ( = ?auto_143564 ?auto_143567 ) ) ( not ( = ?auto_143565 ?auto_143570 ) ) ( not ( = ?auto_143565 ?auto_143567 ) ) ( not ( = ?auto_143566 ?auto_143570 ) ) ( not ( = ?auto_143566 ?auto_143567 ) ) ( not ( = ?auto_143571 ?auto_143570 ) ) ( not ( = ?auto_143571 ?auto_143567 ) ) ( not ( = ?auto_143570 ?auto_143567 ) ) ( not ( = ?auto_143569 ?auto_143567 ) ) ( not ( = ?auto_143563 ?auto_143569 ) ) ( not ( = ?auto_143564 ?auto_143569 ) ) ( not ( = ?auto_143565 ?auto_143569 ) ) ( not ( = ?auto_143566 ?auto_143569 ) ) ( not ( = ?auto_143571 ?auto_143569 ) ) ( not ( = ?auto_143570 ?auto_143569 ) ) ( ON ?auto_143569 ?auto_143568 ) ( not ( = ?auto_143563 ?auto_143568 ) ) ( not ( = ?auto_143564 ?auto_143568 ) ) ( not ( = ?auto_143565 ?auto_143568 ) ) ( not ( = ?auto_143566 ?auto_143568 ) ) ( not ( = ?auto_143571 ?auto_143568 ) ) ( not ( = ?auto_143570 ?auto_143568 ) ) ( not ( = ?auto_143567 ?auto_143568 ) ) ( not ( = ?auto_143569 ?auto_143568 ) ) ( ON ?auto_143567 ?auto_143569 ) ( ON-TABLE ?auto_143568 ) ( ON ?auto_143570 ?auto_143567 ) ( ON ?auto_143571 ?auto_143570 ) ( CLEAR ?auto_143565 ) ( ON ?auto_143566 ?auto_143571 ) ( CLEAR ?auto_143566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_143568 ?auto_143569 ?auto_143567 ?auto_143570 ?auto_143571 )
      ( MAKE-4PILE ?auto_143563 ?auto_143564 ?auto_143565 ?auto_143566 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143572 - BLOCK
      ?auto_143573 - BLOCK
      ?auto_143574 - BLOCK
      ?auto_143575 - BLOCK
    )
    :vars
    (
      ?auto_143577 - BLOCK
      ?auto_143578 - BLOCK
      ?auto_143579 - BLOCK
      ?auto_143580 - BLOCK
      ?auto_143576 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143572 ) ( ON ?auto_143573 ?auto_143572 ) ( not ( = ?auto_143572 ?auto_143573 ) ) ( not ( = ?auto_143572 ?auto_143574 ) ) ( not ( = ?auto_143572 ?auto_143575 ) ) ( not ( = ?auto_143572 ?auto_143577 ) ) ( not ( = ?auto_143573 ?auto_143574 ) ) ( not ( = ?auto_143573 ?auto_143575 ) ) ( not ( = ?auto_143573 ?auto_143577 ) ) ( not ( = ?auto_143574 ?auto_143575 ) ) ( not ( = ?auto_143574 ?auto_143577 ) ) ( not ( = ?auto_143575 ?auto_143577 ) ) ( not ( = ?auto_143572 ?auto_143578 ) ) ( not ( = ?auto_143572 ?auto_143579 ) ) ( not ( = ?auto_143573 ?auto_143578 ) ) ( not ( = ?auto_143573 ?auto_143579 ) ) ( not ( = ?auto_143574 ?auto_143578 ) ) ( not ( = ?auto_143574 ?auto_143579 ) ) ( not ( = ?auto_143575 ?auto_143578 ) ) ( not ( = ?auto_143575 ?auto_143579 ) ) ( not ( = ?auto_143577 ?auto_143578 ) ) ( not ( = ?auto_143577 ?auto_143579 ) ) ( not ( = ?auto_143578 ?auto_143579 ) ) ( not ( = ?auto_143580 ?auto_143579 ) ) ( not ( = ?auto_143572 ?auto_143580 ) ) ( not ( = ?auto_143573 ?auto_143580 ) ) ( not ( = ?auto_143574 ?auto_143580 ) ) ( not ( = ?auto_143575 ?auto_143580 ) ) ( not ( = ?auto_143577 ?auto_143580 ) ) ( not ( = ?auto_143578 ?auto_143580 ) ) ( ON ?auto_143580 ?auto_143576 ) ( not ( = ?auto_143572 ?auto_143576 ) ) ( not ( = ?auto_143573 ?auto_143576 ) ) ( not ( = ?auto_143574 ?auto_143576 ) ) ( not ( = ?auto_143575 ?auto_143576 ) ) ( not ( = ?auto_143577 ?auto_143576 ) ) ( not ( = ?auto_143578 ?auto_143576 ) ) ( not ( = ?auto_143579 ?auto_143576 ) ) ( not ( = ?auto_143580 ?auto_143576 ) ) ( ON ?auto_143579 ?auto_143580 ) ( ON-TABLE ?auto_143576 ) ( ON ?auto_143578 ?auto_143579 ) ( ON ?auto_143577 ?auto_143578 ) ( ON ?auto_143575 ?auto_143577 ) ( CLEAR ?auto_143575 ) ( HOLDING ?auto_143574 ) ( CLEAR ?auto_143573 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_143572 ?auto_143573 ?auto_143574 )
      ( MAKE-4PILE ?auto_143572 ?auto_143573 ?auto_143574 ?auto_143575 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143581 - BLOCK
      ?auto_143582 - BLOCK
      ?auto_143583 - BLOCK
      ?auto_143584 - BLOCK
    )
    :vars
    (
      ?auto_143585 - BLOCK
      ?auto_143588 - BLOCK
      ?auto_143586 - BLOCK
      ?auto_143587 - BLOCK
      ?auto_143589 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143581 ) ( ON ?auto_143582 ?auto_143581 ) ( not ( = ?auto_143581 ?auto_143582 ) ) ( not ( = ?auto_143581 ?auto_143583 ) ) ( not ( = ?auto_143581 ?auto_143584 ) ) ( not ( = ?auto_143581 ?auto_143585 ) ) ( not ( = ?auto_143582 ?auto_143583 ) ) ( not ( = ?auto_143582 ?auto_143584 ) ) ( not ( = ?auto_143582 ?auto_143585 ) ) ( not ( = ?auto_143583 ?auto_143584 ) ) ( not ( = ?auto_143583 ?auto_143585 ) ) ( not ( = ?auto_143584 ?auto_143585 ) ) ( not ( = ?auto_143581 ?auto_143588 ) ) ( not ( = ?auto_143581 ?auto_143586 ) ) ( not ( = ?auto_143582 ?auto_143588 ) ) ( not ( = ?auto_143582 ?auto_143586 ) ) ( not ( = ?auto_143583 ?auto_143588 ) ) ( not ( = ?auto_143583 ?auto_143586 ) ) ( not ( = ?auto_143584 ?auto_143588 ) ) ( not ( = ?auto_143584 ?auto_143586 ) ) ( not ( = ?auto_143585 ?auto_143588 ) ) ( not ( = ?auto_143585 ?auto_143586 ) ) ( not ( = ?auto_143588 ?auto_143586 ) ) ( not ( = ?auto_143587 ?auto_143586 ) ) ( not ( = ?auto_143581 ?auto_143587 ) ) ( not ( = ?auto_143582 ?auto_143587 ) ) ( not ( = ?auto_143583 ?auto_143587 ) ) ( not ( = ?auto_143584 ?auto_143587 ) ) ( not ( = ?auto_143585 ?auto_143587 ) ) ( not ( = ?auto_143588 ?auto_143587 ) ) ( ON ?auto_143587 ?auto_143589 ) ( not ( = ?auto_143581 ?auto_143589 ) ) ( not ( = ?auto_143582 ?auto_143589 ) ) ( not ( = ?auto_143583 ?auto_143589 ) ) ( not ( = ?auto_143584 ?auto_143589 ) ) ( not ( = ?auto_143585 ?auto_143589 ) ) ( not ( = ?auto_143588 ?auto_143589 ) ) ( not ( = ?auto_143586 ?auto_143589 ) ) ( not ( = ?auto_143587 ?auto_143589 ) ) ( ON ?auto_143586 ?auto_143587 ) ( ON-TABLE ?auto_143589 ) ( ON ?auto_143588 ?auto_143586 ) ( ON ?auto_143585 ?auto_143588 ) ( ON ?auto_143584 ?auto_143585 ) ( CLEAR ?auto_143582 ) ( ON ?auto_143583 ?auto_143584 ) ( CLEAR ?auto_143583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_143589 ?auto_143587 ?auto_143586 ?auto_143588 ?auto_143585 ?auto_143584 )
      ( MAKE-4PILE ?auto_143581 ?auto_143582 ?auto_143583 ?auto_143584 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143590 - BLOCK
      ?auto_143591 - BLOCK
      ?auto_143592 - BLOCK
      ?auto_143593 - BLOCK
    )
    :vars
    (
      ?auto_143596 - BLOCK
      ?auto_143594 - BLOCK
      ?auto_143595 - BLOCK
      ?auto_143598 - BLOCK
      ?auto_143597 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143590 ) ( not ( = ?auto_143590 ?auto_143591 ) ) ( not ( = ?auto_143590 ?auto_143592 ) ) ( not ( = ?auto_143590 ?auto_143593 ) ) ( not ( = ?auto_143590 ?auto_143596 ) ) ( not ( = ?auto_143591 ?auto_143592 ) ) ( not ( = ?auto_143591 ?auto_143593 ) ) ( not ( = ?auto_143591 ?auto_143596 ) ) ( not ( = ?auto_143592 ?auto_143593 ) ) ( not ( = ?auto_143592 ?auto_143596 ) ) ( not ( = ?auto_143593 ?auto_143596 ) ) ( not ( = ?auto_143590 ?auto_143594 ) ) ( not ( = ?auto_143590 ?auto_143595 ) ) ( not ( = ?auto_143591 ?auto_143594 ) ) ( not ( = ?auto_143591 ?auto_143595 ) ) ( not ( = ?auto_143592 ?auto_143594 ) ) ( not ( = ?auto_143592 ?auto_143595 ) ) ( not ( = ?auto_143593 ?auto_143594 ) ) ( not ( = ?auto_143593 ?auto_143595 ) ) ( not ( = ?auto_143596 ?auto_143594 ) ) ( not ( = ?auto_143596 ?auto_143595 ) ) ( not ( = ?auto_143594 ?auto_143595 ) ) ( not ( = ?auto_143598 ?auto_143595 ) ) ( not ( = ?auto_143590 ?auto_143598 ) ) ( not ( = ?auto_143591 ?auto_143598 ) ) ( not ( = ?auto_143592 ?auto_143598 ) ) ( not ( = ?auto_143593 ?auto_143598 ) ) ( not ( = ?auto_143596 ?auto_143598 ) ) ( not ( = ?auto_143594 ?auto_143598 ) ) ( ON ?auto_143598 ?auto_143597 ) ( not ( = ?auto_143590 ?auto_143597 ) ) ( not ( = ?auto_143591 ?auto_143597 ) ) ( not ( = ?auto_143592 ?auto_143597 ) ) ( not ( = ?auto_143593 ?auto_143597 ) ) ( not ( = ?auto_143596 ?auto_143597 ) ) ( not ( = ?auto_143594 ?auto_143597 ) ) ( not ( = ?auto_143595 ?auto_143597 ) ) ( not ( = ?auto_143598 ?auto_143597 ) ) ( ON ?auto_143595 ?auto_143598 ) ( ON-TABLE ?auto_143597 ) ( ON ?auto_143594 ?auto_143595 ) ( ON ?auto_143596 ?auto_143594 ) ( ON ?auto_143593 ?auto_143596 ) ( ON ?auto_143592 ?auto_143593 ) ( CLEAR ?auto_143592 ) ( HOLDING ?auto_143591 ) ( CLEAR ?auto_143590 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143590 ?auto_143591 )
      ( MAKE-4PILE ?auto_143590 ?auto_143591 ?auto_143592 ?auto_143593 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143599 - BLOCK
      ?auto_143600 - BLOCK
      ?auto_143601 - BLOCK
      ?auto_143602 - BLOCK
    )
    :vars
    (
      ?auto_143604 - BLOCK
      ?auto_143607 - BLOCK
      ?auto_143603 - BLOCK
      ?auto_143605 - BLOCK
      ?auto_143606 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143599 ) ( not ( = ?auto_143599 ?auto_143600 ) ) ( not ( = ?auto_143599 ?auto_143601 ) ) ( not ( = ?auto_143599 ?auto_143602 ) ) ( not ( = ?auto_143599 ?auto_143604 ) ) ( not ( = ?auto_143600 ?auto_143601 ) ) ( not ( = ?auto_143600 ?auto_143602 ) ) ( not ( = ?auto_143600 ?auto_143604 ) ) ( not ( = ?auto_143601 ?auto_143602 ) ) ( not ( = ?auto_143601 ?auto_143604 ) ) ( not ( = ?auto_143602 ?auto_143604 ) ) ( not ( = ?auto_143599 ?auto_143607 ) ) ( not ( = ?auto_143599 ?auto_143603 ) ) ( not ( = ?auto_143600 ?auto_143607 ) ) ( not ( = ?auto_143600 ?auto_143603 ) ) ( not ( = ?auto_143601 ?auto_143607 ) ) ( not ( = ?auto_143601 ?auto_143603 ) ) ( not ( = ?auto_143602 ?auto_143607 ) ) ( not ( = ?auto_143602 ?auto_143603 ) ) ( not ( = ?auto_143604 ?auto_143607 ) ) ( not ( = ?auto_143604 ?auto_143603 ) ) ( not ( = ?auto_143607 ?auto_143603 ) ) ( not ( = ?auto_143605 ?auto_143603 ) ) ( not ( = ?auto_143599 ?auto_143605 ) ) ( not ( = ?auto_143600 ?auto_143605 ) ) ( not ( = ?auto_143601 ?auto_143605 ) ) ( not ( = ?auto_143602 ?auto_143605 ) ) ( not ( = ?auto_143604 ?auto_143605 ) ) ( not ( = ?auto_143607 ?auto_143605 ) ) ( ON ?auto_143605 ?auto_143606 ) ( not ( = ?auto_143599 ?auto_143606 ) ) ( not ( = ?auto_143600 ?auto_143606 ) ) ( not ( = ?auto_143601 ?auto_143606 ) ) ( not ( = ?auto_143602 ?auto_143606 ) ) ( not ( = ?auto_143604 ?auto_143606 ) ) ( not ( = ?auto_143607 ?auto_143606 ) ) ( not ( = ?auto_143603 ?auto_143606 ) ) ( not ( = ?auto_143605 ?auto_143606 ) ) ( ON ?auto_143603 ?auto_143605 ) ( ON-TABLE ?auto_143606 ) ( ON ?auto_143607 ?auto_143603 ) ( ON ?auto_143604 ?auto_143607 ) ( ON ?auto_143602 ?auto_143604 ) ( ON ?auto_143601 ?auto_143602 ) ( CLEAR ?auto_143599 ) ( ON ?auto_143600 ?auto_143601 ) ( CLEAR ?auto_143600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_143606 ?auto_143605 ?auto_143603 ?auto_143607 ?auto_143604 ?auto_143602 ?auto_143601 )
      ( MAKE-4PILE ?auto_143599 ?auto_143600 ?auto_143601 ?auto_143602 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143608 - BLOCK
      ?auto_143609 - BLOCK
      ?auto_143610 - BLOCK
      ?auto_143611 - BLOCK
    )
    :vars
    (
      ?auto_143614 - BLOCK
      ?auto_143616 - BLOCK
      ?auto_143612 - BLOCK
      ?auto_143615 - BLOCK
      ?auto_143613 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143608 ?auto_143609 ) ) ( not ( = ?auto_143608 ?auto_143610 ) ) ( not ( = ?auto_143608 ?auto_143611 ) ) ( not ( = ?auto_143608 ?auto_143614 ) ) ( not ( = ?auto_143609 ?auto_143610 ) ) ( not ( = ?auto_143609 ?auto_143611 ) ) ( not ( = ?auto_143609 ?auto_143614 ) ) ( not ( = ?auto_143610 ?auto_143611 ) ) ( not ( = ?auto_143610 ?auto_143614 ) ) ( not ( = ?auto_143611 ?auto_143614 ) ) ( not ( = ?auto_143608 ?auto_143616 ) ) ( not ( = ?auto_143608 ?auto_143612 ) ) ( not ( = ?auto_143609 ?auto_143616 ) ) ( not ( = ?auto_143609 ?auto_143612 ) ) ( not ( = ?auto_143610 ?auto_143616 ) ) ( not ( = ?auto_143610 ?auto_143612 ) ) ( not ( = ?auto_143611 ?auto_143616 ) ) ( not ( = ?auto_143611 ?auto_143612 ) ) ( not ( = ?auto_143614 ?auto_143616 ) ) ( not ( = ?auto_143614 ?auto_143612 ) ) ( not ( = ?auto_143616 ?auto_143612 ) ) ( not ( = ?auto_143615 ?auto_143612 ) ) ( not ( = ?auto_143608 ?auto_143615 ) ) ( not ( = ?auto_143609 ?auto_143615 ) ) ( not ( = ?auto_143610 ?auto_143615 ) ) ( not ( = ?auto_143611 ?auto_143615 ) ) ( not ( = ?auto_143614 ?auto_143615 ) ) ( not ( = ?auto_143616 ?auto_143615 ) ) ( ON ?auto_143615 ?auto_143613 ) ( not ( = ?auto_143608 ?auto_143613 ) ) ( not ( = ?auto_143609 ?auto_143613 ) ) ( not ( = ?auto_143610 ?auto_143613 ) ) ( not ( = ?auto_143611 ?auto_143613 ) ) ( not ( = ?auto_143614 ?auto_143613 ) ) ( not ( = ?auto_143616 ?auto_143613 ) ) ( not ( = ?auto_143612 ?auto_143613 ) ) ( not ( = ?auto_143615 ?auto_143613 ) ) ( ON ?auto_143612 ?auto_143615 ) ( ON-TABLE ?auto_143613 ) ( ON ?auto_143616 ?auto_143612 ) ( ON ?auto_143614 ?auto_143616 ) ( ON ?auto_143611 ?auto_143614 ) ( ON ?auto_143610 ?auto_143611 ) ( ON ?auto_143609 ?auto_143610 ) ( CLEAR ?auto_143609 ) ( HOLDING ?auto_143608 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_143608 )
      ( MAKE-4PILE ?auto_143608 ?auto_143609 ?auto_143610 ?auto_143611 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143617 - BLOCK
      ?auto_143618 - BLOCK
      ?auto_143619 - BLOCK
      ?auto_143620 - BLOCK
    )
    :vars
    (
      ?auto_143622 - BLOCK
      ?auto_143624 - BLOCK
      ?auto_143623 - BLOCK
      ?auto_143621 - BLOCK
      ?auto_143625 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143617 ?auto_143618 ) ) ( not ( = ?auto_143617 ?auto_143619 ) ) ( not ( = ?auto_143617 ?auto_143620 ) ) ( not ( = ?auto_143617 ?auto_143622 ) ) ( not ( = ?auto_143618 ?auto_143619 ) ) ( not ( = ?auto_143618 ?auto_143620 ) ) ( not ( = ?auto_143618 ?auto_143622 ) ) ( not ( = ?auto_143619 ?auto_143620 ) ) ( not ( = ?auto_143619 ?auto_143622 ) ) ( not ( = ?auto_143620 ?auto_143622 ) ) ( not ( = ?auto_143617 ?auto_143624 ) ) ( not ( = ?auto_143617 ?auto_143623 ) ) ( not ( = ?auto_143618 ?auto_143624 ) ) ( not ( = ?auto_143618 ?auto_143623 ) ) ( not ( = ?auto_143619 ?auto_143624 ) ) ( not ( = ?auto_143619 ?auto_143623 ) ) ( not ( = ?auto_143620 ?auto_143624 ) ) ( not ( = ?auto_143620 ?auto_143623 ) ) ( not ( = ?auto_143622 ?auto_143624 ) ) ( not ( = ?auto_143622 ?auto_143623 ) ) ( not ( = ?auto_143624 ?auto_143623 ) ) ( not ( = ?auto_143621 ?auto_143623 ) ) ( not ( = ?auto_143617 ?auto_143621 ) ) ( not ( = ?auto_143618 ?auto_143621 ) ) ( not ( = ?auto_143619 ?auto_143621 ) ) ( not ( = ?auto_143620 ?auto_143621 ) ) ( not ( = ?auto_143622 ?auto_143621 ) ) ( not ( = ?auto_143624 ?auto_143621 ) ) ( ON ?auto_143621 ?auto_143625 ) ( not ( = ?auto_143617 ?auto_143625 ) ) ( not ( = ?auto_143618 ?auto_143625 ) ) ( not ( = ?auto_143619 ?auto_143625 ) ) ( not ( = ?auto_143620 ?auto_143625 ) ) ( not ( = ?auto_143622 ?auto_143625 ) ) ( not ( = ?auto_143624 ?auto_143625 ) ) ( not ( = ?auto_143623 ?auto_143625 ) ) ( not ( = ?auto_143621 ?auto_143625 ) ) ( ON ?auto_143623 ?auto_143621 ) ( ON-TABLE ?auto_143625 ) ( ON ?auto_143624 ?auto_143623 ) ( ON ?auto_143622 ?auto_143624 ) ( ON ?auto_143620 ?auto_143622 ) ( ON ?auto_143619 ?auto_143620 ) ( ON ?auto_143618 ?auto_143619 ) ( ON ?auto_143617 ?auto_143618 ) ( CLEAR ?auto_143617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_143625 ?auto_143621 ?auto_143623 ?auto_143624 ?auto_143622 ?auto_143620 ?auto_143619 ?auto_143618 )
      ( MAKE-4PILE ?auto_143617 ?auto_143618 ?auto_143619 ?auto_143620 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143630 - BLOCK
      ?auto_143631 - BLOCK
      ?auto_143632 - BLOCK
      ?auto_143633 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_143633 ) ( CLEAR ?auto_143632 ) ( ON-TABLE ?auto_143630 ) ( ON ?auto_143631 ?auto_143630 ) ( ON ?auto_143632 ?auto_143631 ) ( not ( = ?auto_143630 ?auto_143631 ) ) ( not ( = ?auto_143630 ?auto_143632 ) ) ( not ( = ?auto_143630 ?auto_143633 ) ) ( not ( = ?auto_143631 ?auto_143632 ) ) ( not ( = ?auto_143631 ?auto_143633 ) ) ( not ( = ?auto_143632 ?auto_143633 ) ) )
    :subtasks
    ( ( !STACK ?auto_143633 ?auto_143632 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143634 - BLOCK
      ?auto_143635 - BLOCK
      ?auto_143636 - BLOCK
      ?auto_143637 - BLOCK
    )
    :vars
    (
      ?auto_143638 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_143636 ) ( ON-TABLE ?auto_143634 ) ( ON ?auto_143635 ?auto_143634 ) ( ON ?auto_143636 ?auto_143635 ) ( not ( = ?auto_143634 ?auto_143635 ) ) ( not ( = ?auto_143634 ?auto_143636 ) ) ( not ( = ?auto_143634 ?auto_143637 ) ) ( not ( = ?auto_143635 ?auto_143636 ) ) ( not ( = ?auto_143635 ?auto_143637 ) ) ( not ( = ?auto_143636 ?auto_143637 ) ) ( ON ?auto_143637 ?auto_143638 ) ( CLEAR ?auto_143637 ) ( HAND-EMPTY ) ( not ( = ?auto_143634 ?auto_143638 ) ) ( not ( = ?auto_143635 ?auto_143638 ) ) ( not ( = ?auto_143636 ?auto_143638 ) ) ( not ( = ?auto_143637 ?auto_143638 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143637 ?auto_143638 )
      ( MAKE-4PILE ?auto_143634 ?auto_143635 ?auto_143636 ?auto_143637 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143639 - BLOCK
      ?auto_143640 - BLOCK
      ?auto_143641 - BLOCK
      ?auto_143642 - BLOCK
    )
    :vars
    (
      ?auto_143643 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143639 ) ( ON ?auto_143640 ?auto_143639 ) ( not ( = ?auto_143639 ?auto_143640 ) ) ( not ( = ?auto_143639 ?auto_143641 ) ) ( not ( = ?auto_143639 ?auto_143642 ) ) ( not ( = ?auto_143640 ?auto_143641 ) ) ( not ( = ?auto_143640 ?auto_143642 ) ) ( not ( = ?auto_143641 ?auto_143642 ) ) ( ON ?auto_143642 ?auto_143643 ) ( CLEAR ?auto_143642 ) ( not ( = ?auto_143639 ?auto_143643 ) ) ( not ( = ?auto_143640 ?auto_143643 ) ) ( not ( = ?auto_143641 ?auto_143643 ) ) ( not ( = ?auto_143642 ?auto_143643 ) ) ( HOLDING ?auto_143641 ) ( CLEAR ?auto_143640 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_143639 ?auto_143640 ?auto_143641 )
      ( MAKE-4PILE ?auto_143639 ?auto_143640 ?auto_143641 ?auto_143642 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143644 - BLOCK
      ?auto_143645 - BLOCK
      ?auto_143646 - BLOCK
      ?auto_143647 - BLOCK
    )
    :vars
    (
      ?auto_143648 - BLOCK
      ?auto_143649 - BLOCK
      ?auto_143651 - BLOCK
      ?auto_143650 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143644 ) ( ON ?auto_143645 ?auto_143644 ) ( not ( = ?auto_143644 ?auto_143645 ) ) ( not ( = ?auto_143644 ?auto_143646 ) ) ( not ( = ?auto_143644 ?auto_143647 ) ) ( not ( = ?auto_143645 ?auto_143646 ) ) ( not ( = ?auto_143645 ?auto_143647 ) ) ( not ( = ?auto_143646 ?auto_143647 ) ) ( ON ?auto_143647 ?auto_143648 ) ( not ( = ?auto_143644 ?auto_143648 ) ) ( not ( = ?auto_143645 ?auto_143648 ) ) ( not ( = ?auto_143646 ?auto_143648 ) ) ( not ( = ?auto_143647 ?auto_143648 ) ) ( CLEAR ?auto_143645 ) ( ON ?auto_143646 ?auto_143647 ) ( CLEAR ?auto_143646 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_143649 ) ( ON ?auto_143651 ?auto_143649 ) ( ON ?auto_143650 ?auto_143651 ) ( ON ?auto_143648 ?auto_143650 ) ( not ( = ?auto_143649 ?auto_143651 ) ) ( not ( = ?auto_143649 ?auto_143650 ) ) ( not ( = ?auto_143649 ?auto_143648 ) ) ( not ( = ?auto_143649 ?auto_143647 ) ) ( not ( = ?auto_143649 ?auto_143646 ) ) ( not ( = ?auto_143651 ?auto_143650 ) ) ( not ( = ?auto_143651 ?auto_143648 ) ) ( not ( = ?auto_143651 ?auto_143647 ) ) ( not ( = ?auto_143651 ?auto_143646 ) ) ( not ( = ?auto_143650 ?auto_143648 ) ) ( not ( = ?auto_143650 ?auto_143647 ) ) ( not ( = ?auto_143650 ?auto_143646 ) ) ( not ( = ?auto_143644 ?auto_143649 ) ) ( not ( = ?auto_143644 ?auto_143651 ) ) ( not ( = ?auto_143644 ?auto_143650 ) ) ( not ( = ?auto_143645 ?auto_143649 ) ) ( not ( = ?auto_143645 ?auto_143651 ) ) ( not ( = ?auto_143645 ?auto_143650 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_143649 ?auto_143651 ?auto_143650 ?auto_143648 ?auto_143647 )
      ( MAKE-4PILE ?auto_143644 ?auto_143645 ?auto_143646 ?auto_143647 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143652 - BLOCK
      ?auto_143653 - BLOCK
      ?auto_143654 - BLOCK
      ?auto_143655 - BLOCK
    )
    :vars
    (
      ?auto_143659 - BLOCK
      ?auto_143656 - BLOCK
      ?auto_143657 - BLOCK
      ?auto_143658 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143652 ) ( not ( = ?auto_143652 ?auto_143653 ) ) ( not ( = ?auto_143652 ?auto_143654 ) ) ( not ( = ?auto_143652 ?auto_143655 ) ) ( not ( = ?auto_143653 ?auto_143654 ) ) ( not ( = ?auto_143653 ?auto_143655 ) ) ( not ( = ?auto_143654 ?auto_143655 ) ) ( ON ?auto_143655 ?auto_143659 ) ( not ( = ?auto_143652 ?auto_143659 ) ) ( not ( = ?auto_143653 ?auto_143659 ) ) ( not ( = ?auto_143654 ?auto_143659 ) ) ( not ( = ?auto_143655 ?auto_143659 ) ) ( ON ?auto_143654 ?auto_143655 ) ( CLEAR ?auto_143654 ) ( ON-TABLE ?auto_143656 ) ( ON ?auto_143657 ?auto_143656 ) ( ON ?auto_143658 ?auto_143657 ) ( ON ?auto_143659 ?auto_143658 ) ( not ( = ?auto_143656 ?auto_143657 ) ) ( not ( = ?auto_143656 ?auto_143658 ) ) ( not ( = ?auto_143656 ?auto_143659 ) ) ( not ( = ?auto_143656 ?auto_143655 ) ) ( not ( = ?auto_143656 ?auto_143654 ) ) ( not ( = ?auto_143657 ?auto_143658 ) ) ( not ( = ?auto_143657 ?auto_143659 ) ) ( not ( = ?auto_143657 ?auto_143655 ) ) ( not ( = ?auto_143657 ?auto_143654 ) ) ( not ( = ?auto_143658 ?auto_143659 ) ) ( not ( = ?auto_143658 ?auto_143655 ) ) ( not ( = ?auto_143658 ?auto_143654 ) ) ( not ( = ?auto_143652 ?auto_143656 ) ) ( not ( = ?auto_143652 ?auto_143657 ) ) ( not ( = ?auto_143652 ?auto_143658 ) ) ( not ( = ?auto_143653 ?auto_143656 ) ) ( not ( = ?auto_143653 ?auto_143657 ) ) ( not ( = ?auto_143653 ?auto_143658 ) ) ( HOLDING ?auto_143653 ) ( CLEAR ?auto_143652 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143652 ?auto_143653 )
      ( MAKE-4PILE ?auto_143652 ?auto_143653 ?auto_143654 ?auto_143655 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143660 - BLOCK
      ?auto_143661 - BLOCK
      ?auto_143662 - BLOCK
      ?auto_143663 - BLOCK
    )
    :vars
    (
      ?auto_143667 - BLOCK
      ?auto_143664 - BLOCK
      ?auto_143665 - BLOCK
      ?auto_143666 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143660 ) ( not ( = ?auto_143660 ?auto_143661 ) ) ( not ( = ?auto_143660 ?auto_143662 ) ) ( not ( = ?auto_143660 ?auto_143663 ) ) ( not ( = ?auto_143661 ?auto_143662 ) ) ( not ( = ?auto_143661 ?auto_143663 ) ) ( not ( = ?auto_143662 ?auto_143663 ) ) ( ON ?auto_143663 ?auto_143667 ) ( not ( = ?auto_143660 ?auto_143667 ) ) ( not ( = ?auto_143661 ?auto_143667 ) ) ( not ( = ?auto_143662 ?auto_143667 ) ) ( not ( = ?auto_143663 ?auto_143667 ) ) ( ON ?auto_143662 ?auto_143663 ) ( ON-TABLE ?auto_143664 ) ( ON ?auto_143665 ?auto_143664 ) ( ON ?auto_143666 ?auto_143665 ) ( ON ?auto_143667 ?auto_143666 ) ( not ( = ?auto_143664 ?auto_143665 ) ) ( not ( = ?auto_143664 ?auto_143666 ) ) ( not ( = ?auto_143664 ?auto_143667 ) ) ( not ( = ?auto_143664 ?auto_143663 ) ) ( not ( = ?auto_143664 ?auto_143662 ) ) ( not ( = ?auto_143665 ?auto_143666 ) ) ( not ( = ?auto_143665 ?auto_143667 ) ) ( not ( = ?auto_143665 ?auto_143663 ) ) ( not ( = ?auto_143665 ?auto_143662 ) ) ( not ( = ?auto_143666 ?auto_143667 ) ) ( not ( = ?auto_143666 ?auto_143663 ) ) ( not ( = ?auto_143666 ?auto_143662 ) ) ( not ( = ?auto_143660 ?auto_143664 ) ) ( not ( = ?auto_143660 ?auto_143665 ) ) ( not ( = ?auto_143660 ?auto_143666 ) ) ( not ( = ?auto_143661 ?auto_143664 ) ) ( not ( = ?auto_143661 ?auto_143665 ) ) ( not ( = ?auto_143661 ?auto_143666 ) ) ( CLEAR ?auto_143660 ) ( ON ?auto_143661 ?auto_143662 ) ( CLEAR ?auto_143661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_143664 ?auto_143665 ?auto_143666 ?auto_143667 ?auto_143663 ?auto_143662 )
      ( MAKE-4PILE ?auto_143660 ?auto_143661 ?auto_143662 ?auto_143663 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143668 - BLOCK
      ?auto_143669 - BLOCK
      ?auto_143670 - BLOCK
      ?auto_143671 - BLOCK
    )
    :vars
    (
      ?auto_143673 - BLOCK
      ?auto_143675 - BLOCK
      ?auto_143672 - BLOCK
      ?auto_143674 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143668 ?auto_143669 ) ) ( not ( = ?auto_143668 ?auto_143670 ) ) ( not ( = ?auto_143668 ?auto_143671 ) ) ( not ( = ?auto_143669 ?auto_143670 ) ) ( not ( = ?auto_143669 ?auto_143671 ) ) ( not ( = ?auto_143670 ?auto_143671 ) ) ( ON ?auto_143671 ?auto_143673 ) ( not ( = ?auto_143668 ?auto_143673 ) ) ( not ( = ?auto_143669 ?auto_143673 ) ) ( not ( = ?auto_143670 ?auto_143673 ) ) ( not ( = ?auto_143671 ?auto_143673 ) ) ( ON ?auto_143670 ?auto_143671 ) ( ON-TABLE ?auto_143675 ) ( ON ?auto_143672 ?auto_143675 ) ( ON ?auto_143674 ?auto_143672 ) ( ON ?auto_143673 ?auto_143674 ) ( not ( = ?auto_143675 ?auto_143672 ) ) ( not ( = ?auto_143675 ?auto_143674 ) ) ( not ( = ?auto_143675 ?auto_143673 ) ) ( not ( = ?auto_143675 ?auto_143671 ) ) ( not ( = ?auto_143675 ?auto_143670 ) ) ( not ( = ?auto_143672 ?auto_143674 ) ) ( not ( = ?auto_143672 ?auto_143673 ) ) ( not ( = ?auto_143672 ?auto_143671 ) ) ( not ( = ?auto_143672 ?auto_143670 ) ) ( not ( = ?auto_143674 ?auto_143673 ) ) ( not ( = ?auto_143674 ?auto_143671 ) ) ( not ( = ?auto_143674 ?auto_143670 ) ) ( not ( = ?auto_143668 ?auto_143675 ) ) ( not ( = ?auto_143668 ?auto_143672 ) ) ( not ( = ?auto_143668 ?auto_143674 ) ) ( not ( = ?auto_143669 ?auto_143675 ) ) ( not ( = ?auto_143669 ?auto_143672 ) ) ( not ( = ?auto_143669 ?auto_143674 ) ) ( ON ?auto_143669 ?auto_143670 ) ( CLEAR ?auto_143669 ) ( HOLDING ?auto_143668 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_143668 )
      ( MAKE-4PILE ?auto_143668 ?auto_143669 ?auto_143670 ?auto_143671 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143676 - BLOCK
      ?auto_143677 - BLOCK
      ?auto_143678 - BLOCK
      ?auto_143679 - BLOCK
    )
    :vars
    (
      ?auto_143681 - BLOCK
      ?auto_143683 - BLOCK
      ?auto_143680 - BLOCK
      ?auto_143682 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143676 ?auto_143677 ) ) ( not ( = ?auto_143676 ?auto_143678 ) ) ( not ( = ?auto_143676 ?auto_143679 ) ) ( not ( = ?auto_143677 ?auto_143678 ) ) ( not ( = ?auto_143677 ?auto_143679 ) ) ( not ( = ?auto_143678 ?auto_143679 ) ) ( ON ?auto_143679 ?auto_143681 ) ( not ( = ?auto_143676 ?auto_143681 ) ) ( not ( = ?auto_143677 ?auto_143681 ) ) ( not ( = ?auto_143678 ?auto_143681 ) ) ( not ( = ?auto_143679 ?auto_143681 ) ) ( ON ?auto_143678 ?auto_143679 ) ( ON-TABLE ?auto_143683 ) ( ON ?auto_143680 ?auto_143683 ) ( ON ?auto_143682 ?auto_143680 ) ( ON ?auto_143681 ?auto_143682 ) ( not ( = ?auto_143683 ?auto_143680 ) ) ( not ( = ?auto_143683 ?auto_143682 ) ) ( not ( = ?auto_143683 ?auto_143681 ) ) ( not ( = ?auto_143683 ?auto_143679 ) ) ( not ( = ?auto_143683 ?auto_143678 ) ) ( not ( = ?auto_143680 ?auto_143682 ) ) ( not ( = ?auto_143680 ?auto_143681 ) ) ( not ( = ?auto_143680 ?auto_143679 ) ) ( not ( = ?auto_143680 ?auto_143678 ) ) ( not ( = ?auto_143682 ?auto_143681 ) ) ( not ( = ?auto_143682 ?auto_143679 ) ) ( not ( = ?auto_143682 ?auto_143678 ) ) ( not ( = ?auto_143676 ?auto_143683 ) ) ( not ( = ?auto_143676 ?auto_143680 ) ) ( not ( = ?auto_143676 ?auto_143682 ) ) ( not ( = ?auto_143677 ?auto_143683 ) ) ( not ( = ?auto_143677 ?auto_143680 ) ) ( not ( = ?auto_143677 ?auto_143682 ) ) ( ON ?auto_143677 ?auto_143678 ) ( ON ?auto_143676 ?auto_143677 ) ( CLEAR ?auto_143676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_143683 ?auto_143680 ?auto_143682 ?auto_143681 ?auto_143679 ?auto_143678 ?auto_143677 )
      ( MAKE-4PILE ?auto_143676 ?auto_143677 ?auto_143678 ?auto_143679 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143684 - BLOCK
      ?auto_143685 - BLOCK
      ?auto_143686 - BLOCK
      ?auto_143687 - BLOCK
    )
    :vars
    (
      ?auto_143691 - BLOCK
      ?auto_143689 - BLOCK
      ?auto_143688 - BLOCK
      ?auto_143690 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143684 ?auto_143685 ) ) ( not ( = ?auto_143684 ?auto_143686 ) ) ( not ( = ?auto_143684 ?auto_143687 ) ) ( not ( = ?auto_143685 ?auto_143686 ) ) ( not ( = ?auto_143685 ?auto_143687 ) ) ( not ( = ?auto_143686 ?auto_143687 ) ) ( ON ?auto_143687 ?auto_143691 ) ( not ( = ?auto_143684 ?auto_143691 ) ) ( not ( = ?auto_143685 ?auto_143691 ) ) ( not ( = ?auto_143686 ?auto_143691 ) ) ( not ( = ?auto_143687 ?auto_143691 ) ) ( ON ?auto_143686 ?auto_143687 ) ( ON-TABLE ?auto_143689 ) ( ON ?auto_143688 ?auto_143689 ) ( ON ?auto_143690 ?auto_143688 ) ( ON ?auto_143691 ?auto_143690 ) ( not ( = ?auto_143689 ?auto_143688 ) ) ( not ( = ?auto_143689 ?auto_143690 ) ) ( not ( = ?auto_143689 ?auto_143691 ) ) ( not ( = ?auto_143689 ?auto_143687 ) ) ( not ( = ?auto_143689 ?auto_143686 ) ) ( not ( = ?auto_143688 ?auto_143690 ) ) ( not ( = ?auto_143688 ?auto_143691 ) ) ( not ( = ?auto_143688 ?auto_143687 ) ) ( not ( = ?auto_143688 ?auto_143686 ) ) ( not ( = ?auto_143690 ?auto_143691 ) ) ( not ( = ?auto_143690 ?auto_143687 ) ) ( not ( = ?auto_143690 ?auto_143686 ) ) ( not ( = ?auto_143684 ?auto_143689 ) ) ( not ( = ?auto_143684 ?auto_143688 ) ) ( not ( = ?auto_143684 ?auto_143690 ) ) ( not ( = ?auto_143685 ?auto_143689 ) ) ( not ( = ?auto_143685 ?auto_143688 ) ) ( not ( = ?auto_143685 ?auto_143690 ) ) ( ON ?auto_143685 ?auto_143686 ) ( HOLDING ?auto_143684 ) ( CLEAR ?auto_143685 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_143689 ?auto_143688 ?auto_143690 ?auto_143691 ?auto_143687 ?auto_143686 ?auto_143685 ?auto_143684 )
      ( MAKE-4PILE ?auto_143684 ?auto_143685 ?auto_143686 ?auto_143687 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143692 - BLOCK
      ?auto_143693 - BLOCK
      ?auto_143694 - BLOCK
      ?auto_143695 - BLOCK
    )
    :vars
    (
      ?auto_143699 - BLOCK
      ?auto_143696 - BLOCK
      ?auto_143698 - BLOCK
      ?auto_143697 - BLOCK
      ?auto_143700 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143692 ?auto_143693 ) ) ( not ( = ?auto_143692 ?auto_143694 ) ) ( not ( = ?auto_143692 ?auto_143695 ) ) ( not ( = ?auto_143693 ?auto_143694 ) ) ( not ( = ?auto_143693 ?auto_143695 ) ) ( not ( = ?auto_143694 ?auto_143695 ) ) ( ON ?auto_143695 ?auto_143699 ) ( not ( = ?auto_143692 ?auto_143699 ) ) ( not ( = ?auto_143693 ?auto_143699 ) ) ( not ( = ?auto_143694 ?auto_143699 ) ) ( not ( = ?auto_143695 ?auto_143699 ) ) ( ON ?auto_143694 ?auto_143695 ) ( ON-TABLE ?auto_143696 ) ( ON ?auto_143698 ?auto_143696 ) ( ON ?auto_143697 ?auto_143698 ) ( ON ?auto_143699 ?auto_143697 ) ( not ( = ?auto_143696 ?auto_143698 ) ) ( not ( = ?auto_143696 ?auto_143697 ) ) ( not ( = ?auto_143696 ?auto_143699 ) ) ( not ( = ?auto_143696 ?auto_143695 ) ) ( not ( = ?auto_143696 ?auto_143694 ) ) ( not ( = ?auto_143698 ?auto_143697 ) ) ( not ( = ?auto_143698 ?auto_143699 ) ) ( not ( = ?auto_143698 ?auto_143695 ) ) ( not ( = ?auto_143698 ?auto_143694 ) ) ( not ( = ?auto_143697 ?auto_143699 ) ) ( not ( = ?auto_143697 ?auto_143695 ) ) ( not ( = ?auto_143697 ?auto_143694 ) ) ( not ( = ?auto_143692 ?auto_143696 ) ) ( not ( = ?auto_143692 ?auto_143698 ) ) ( not ( = ?auto_143692 ?auto_143697 ) ) ( not ( = ?auto_143693 ?auto_143696 ) ) ( not ( = ?auto_143693 ?auto_143698 ) ) ( not ( = ?auto_143693 ?auto_143697 ) ) ( ON ?auto_143693 ?auto_143694 ) ( CLEAR ?auto_143693 ) ( ON ?auto_143692 ?auto_143700 ) ( CLEAR ?auto_143692 ) ( HAND-EMPTY ) ( not ( = ?auto_143692 ?auto_143700 ) ) ( not ( = ?auto_143693 ?auto_143700 ) ) ( not ( = ?auto_143694 ?auto_143700 ) ) ( not ( = ?auto_143695 ?auto_143700 ) ) ( not ( = ?auto_143699 ?auto_143700 ) ) ( not ( = ?auto_143696 ?auto_143700 ) ) ( not ( = ?auto_143698 ?auto_143700 ) ) ( not ( = ?auto_143697 ?auto_143700 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143692 ?auto_143700 )
      ( MAKE-4PILE ?auto_143692 ?auto_143693 ?auto_143694 ?auto_143695 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143701 - BLOCK
      ?auto_143702 - BLOCK
      ?auto_143703 - BLOCK
      ?auto_143704 - BLOCK
    )
    :vars
    (
      ?auto_143706 - BLOCK
      ?auto_143708 - BLOCK
      ?auto_143707 - BLOCK
      ?auto_143709 - BLOCK
      ?auto_143705 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143701 ?auto_143702 ) ) ( not ( = ?auto_143701 ?auto_143703 ) ) ( not ( = ?auto_143701 ?auto_143704 ) ) ( not ( = ?auto_143702 ?auto_143703 ) ) ( not ( = ?auto_143702 ?auto_143704 ) ) ( not ( = ?auto_143703 ?auto_143704 ) ) ( ON ?auto_143704 ?auto_143706 ) ( not ( = ?auto_143701 ?auto_143706 ) ) ( not ( = ?auto_143702 ?auto_143706 ) ) ( not ( = ?auto_143703 ?auto_143706 ) ) ( not ( = ?auto_143704 ?auto_143706 ) ) ( ON ?auto_143703 ?auto_143704 ) ( ON-TABLE ?auto_143708 ) ( ON ?auto_143707 ?auto_143708 ) ( ON ?auto_143709 ?auto_143707 ) ( ON ?auto_143706 ?auto_143709 ) ( not ( = ?auto_143708 ?auto_143707 ) ) ( not ( = ?auto_143708 ?auto_143709 ) ) ( not ( = ?auto_143708 ?auto_143706 ) ) ( not ( = ?auto_143708 ?auto_143704 ) ) ( not ( = ?auto_143708 ?auto_143703 ) ) ( not ( = ?auto_143707 ?auto_143709 ) ) ( not ( = ?auto_143707 ?auto_143706 ) ) ( not ( = ?auto_143707 ?auto_143704 ) ) ( not ( = ?auto_143707 ?auto_143703 ) ) ( not ( = ?auto_143709 ?auto_143706 ) ) ( not ( = ?auto_143709 ?auto_143704 ) ) ( not ( = ?auto_143709 ?auto_143703 ) ) ( not ( = ?auto_143701 ?auto_143708 ) ) ( not ( = ?auto_143701 ?auto_143707 ) ) ( not ( = ?auto_143701 ?auto_143709 ) ) ( not ( = ?auto_143702 ?auto_143708 ) ) ( not ( = ?auto_143702 ?auto_143707 ) ) ( not ( = ?auto_143702 ?auto_143709 ) ) ( ON ?auto_143701 ?auto_143705 ) ( CLEAR ?auto_143701 ) ( not ( = ?auto_143701 ?auto_143705 ) ) ( not ( = ?auto_143702 ?auto_143705 ) ) ( not ( = ?auto_143703 ?auto_143705 ) ) ( not ( = ?auto_143704 ?auto_143705 ) ) ( not ( = ?auto_143706 ?auto_143705 ) ) ( not ( = ?auto_143708 ?auto_143705 ) ) ( not ( = ?auto_143707 ?auto_143705 ) ) ( not ( = ?auto_143709 ?auto_143705 ) ) ( HOLDING ?auto_143702 ) ( CLEAR ?auto_143703 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_143708 ?auto_143707 ?auto_143709 ?auto_143706 ?auto_143704 ?auto_143703 ?auto_143702 )
      ( MAKE-4PILE ?auto_143701 ?auto_143702 ?auto_143703 ?auto_143704 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143710 - BLOCK
      ?auto_143711 - BLOCK
      ?auto_143712 - BLOCK
      ?auto_143713 - BLOCK
    )
    :vars
    (
      ?auto_143714 - BLOCK
      ?auto_143717 - BLOCK
      ?auto_143715 - BLOCK
      ?auto_143718 - BLOCK
      ?auto_143716 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143710 ?auto_143711 ) ) ( not ( = ?auto_143710 ?auto_143712 ) ) ( not ( = ?auto_143710 ?auto_143713 ) ) ( not ( = ?auto_143711 ?auto_143712 ) ) ( not ( = ?auto_143711 ?auto_143713 ) ) ( not ( = ?auto_143712 ?auto_143713 ) ) ( ON ?auto_143713 ?auto_143714 ) ( not ( = ?auto_143710 ?auto_143714 ) ) ( not ( = ?auto_143711 ?auto_143714 ) ) ( not ( = ?auto_143712 ?auto_143714 ) ) ( not ( = ?auto_143713 ?auto_143714 ) ) ( ON ?auto_143712 ?auto_143713 ) ( ON-TABLE ?auto_143717 ) ( ON ?auto_143715 ?auto_143717 ) ( ON ?auto_143718 ?auto_143715 ) ( ON ?auto_143714 ?auto_143718 ) ( not ( = ?auto_143717 ?auto_143715 ) ) ( not ( = ?auto_143717 ?auto_143718 ) ) ( not ( = ?auto_143717 ?auto_143714 ) ) ( not ( = ?auto_143717 ?auto_143713 ) ) ( not ( = ?auto_143717 ?auto_143712 ) ) ( not ( = ?auto_143715 ?auto_143718 ) ) ( not ( = ?auto_143715 ?auto_143714 ) ) ( not ( = ?auto_143715 ?auto_143713 ) ) ( not ( = ?auto_143715 ?auto_143712 ) ) ( not ( = ?auto_143718 ?auto_143714 ) ) ( not ( = ?auto_143718 ?auto_143713 ) ) ( not ( = ?auto_143718 ?auto_143712 ) ) ( not ( = ?auto_143710 ?auto_143717 ) ) ( not ( = ?auto_143710 ?auto_143715 ) ) ( not ( = ?auto_143710 ?auto_143718 ) ) ( not ( = ?auto_143711 ?auto_143717 ) ) ( not ( = ?auto_143711 ?auto_143715 ) ) ( not ( = ?auto_143711 ?auto_143718 ) ) ( ON ?auto_143710 ?auto_143716 ) ( not ( = ?auto_143710 ?auto_143716 ) ) ( not ( = ?auto_143711 ?auto_143716 ) ) ( not ( = ?auto_143712 ?auto_143716 ) ) ( not ( = ?auto_143713 ?auto_143716 ) ) ( not ( = ?auto_143714 ?auto_143716 ) ) ( not ( = ?auto_143717 ?auto_143716 ) ) ( not ( = ?auto_143715 ?auto_143716 ) ) ( not ( = ?auto_143718 ?auto_143716 ) ) ( CLEAR ?auto_143712 ) ( ON ?auto_143711 ?auto_143710 ) ( CLEAR ?auto_143711 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_143716 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143716 ?auto_143710 )
      ( MAKE-4PILE ?auto_143710 ?auto_143711 ?auto_143712 ?auto_143713 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143719 - BLOCK
      ?auto_143720 - BLOCK
      ?auto_143721 - BLOCK
      ?auto_143722 - BLOCK
    )
    :vars
    (
      ?auto_143726 - BLOCK
      ?auto_143724 - BLOCK
      ?auto_143725 - BLOCK
      ?auto_143727 - BLOCK
      ?auto_143723 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143719 ?auto_143720 ) ) ( not ( = ?auto_143719 ?auto_143721 ) ) ( not ( = ?auto_143719 ?auto_143722 ) ) ( not ( = ?auto_143720 ?auto_143721 ) ) ( not ( = ?auto_143720 ?auto_143722 ) ) ( not ( = ?auto_143721 ?auto_143722 ) ) ( ON ?auto_143722 ?auto_143726 ) ( not ( = ?auto_143719 ?auto_143726 ) ) ( not ( = ?auto_143720 ?auto_143726 ) ) ( not ( = ?auto_143721 ?auto_143726 ) ) ( not ( = ?auto_143722 ?auto_143726 ) ) ( ON-TABLE ?auto_143724 ) ( ON ?auto_143725 ?auto_143724 ) ( ON ?auto_143727 ?auto_143725 ) ( ON ?auto_143726 ?auto_143727 ) ( not ( = ?auto_143724 ?auto_143725 ) ) ( not ( = ?auto_143724 ?auto_143727 ) ) ( not ( = ?auto_143724 ?auto_143726 ) ) ( not ( = ?auto_143724 ?auto_143722 ) ) ( not ( = ?auto_143724 ?auto_143721 ) ) ( not ( = ?auto_143725 ?auto_143727 ) ) ( not ( = ?auto_143725 ?auto_143726 ) ) ( not ( = ?auto_143725 ?auto_143722 ) ) ( not ( = ?auto_143725 ?auto_143721 ) ) ( not ( = ?auto_143727 ?auto_143726 ) ) ( not ( = ?auto_143727 ?auto_143722 ) ) ( not ( = ?auto_143727 ?auto_143721 ) ) ( not ( = ?auto_143719 ?auto_143724 ) ) ( not ( = ?auto_143719 ?auto_143725 ) ) ( not ( = ?auto_143719 ?auto_143727 ) ) ( not ( = ?auto_143720 ?auto_143724 ) ) ( not ( = ?auto_143720 ?auto_143725 ) ) ( not ( = ?auto_143720 ?auto_143727 ) ) ( ON ?auto_143719 ?auto_143723 ) ( not ( = ?auto_143719 ?auto_143723 ) ) ( not ( = ?auto_143720 ?auto_143723 ) ) ( not ( = ?auto_143721 ?auto_143723 ) ) ( not ( = ?auto_143722 ?auto_143723 ) ) ( not ( = ?auto_143726 ?auto_143723 ) ) ( not ( = ?auto_143724 ?auto_143723 ) ) ( not ( = ?auto_143725 ?auto_143723 ) ) ( not ( = ?auto_143727 ?auto_143723 ) ) ( ON ?auto_143720 ?auto_143719 ) ( CLEAR ?auto_143720 ) ( ON-TABLE ?auto_143723 ) ( HOLDING ?auto_143721 ) ( CLEAR ?auto_143722 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_143724 ?auto_143725 ?auto_143727 ?auto_143726 ?auto_143722 ?auto_143721 )
      ( MAKE-4PILE ?auto_143719 ?auto_143720 ?auto_143721 ?auto_143722 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143728 - BLOCK
      ?auto_143729 - BLOCK
      ?auto_143730 - BLOCK
      ?auto_143731 - BLOCK
    )
    :vars
    (
      ?auto_143733 - BLOCK
      ?auto_143732 - BLOCK
      ?auto_143734 - BLOCK
      ?auto_143736 - BLOCK
      ?auto_143735 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143728 ?auto_143729 ) ) ( not ( = ?auto_143728 ?auto_143730 ) ) ( not ( = ?auto_143728 ?auto_143731 ) ) ( not ( = ?auto_143729 ?auto_143730 ) ) ( not ( = ?auto_143729 ?auto_143731 ) ) ( not ( = ?auto_143730 ?auto_143731 ) ) ( ON ?auto_143731 ?auto_143733 ) ( not ( = ?auto_143728 ?auto_143733 ) ) ( not ( = ?auto_143729 ?auto_143733 ) ) ( not ( = ?auto_143730 ?auto_143733 ) ) ( not ( = ?auto_143731 ?auto_143733 ) ) ( ON-TABLE ?auto_143732 ) ( ON ?auto_143734 ?auto_143732 ) ( ON ?auto_143736 ?auto_143734 ) ( ON ?auto_143733 ?auto_143736 ) ( not ( = ?auto_143732 ?auto_143734 ) ) ( not ( = ?auto_143732 ?auto_143736 ) ) ( not ( = ?auto_143732 ?auto_143733 ) ) ( not ( = ?auto_143732 ?auto_143731 ) ) ( not ( = ?auto_143732 ?auto_143730 ) ) ( not ( = ?auto_143734 ?auto_143736 ) ) ( not ( = ?auto_143734 ?auto_143733 ) ) ( not ( = ?auto_143734 ?auto_143731 ) ) ( not ( = ?auto_143734 ?auto_143730 ) ) ( not ( = ?auto_143736 ?auto_143733 ) ) ( not ( = ?auto_143736 ?auto_143731 ) ) ( not ( = ?auto_143736 ?auto_143730 ) ) ( not ( = ?auto_143728 ?auto_143732 ) ) ( not ( = ?auto_143728 ?auto_143734 ) ) ( not ( = ?auto_143728 ?auto_143736 ) ) ( not ( = ?auto_143729 ?auto_143732 ) ) ( not ( = ?auto_143729 ?auto_143734 ) ) ( not ( = ?auto_143729 ?auto_143736 ) ) ( ON ?auto_143728 ?auto_143735 ) ( not ( = ?auto_143728 ?auto_143735 ) ) ( not ( = ?auto_143729 ?auto_143735 ) ) ( not ( = ?auto_143730 ?auto_143735 ) ) ( not ( = ?auto_143731 ?auto_143735 ) ) ( not ( = ?auto_143733 ?auto_143735 ) ) ( not ( = ?auto_143732 ?auto_143735 ) ) ( not ( = ?auto_143734 ?auto_143735 ) ) ( not ( = ?auto_143736 ?auto_143735 ) ) ( ON ?auto_143729 ?auto_143728 ) ( ON-TABLE ?auto_143735 ) ( CLEAR ?auto_143731 ) ( ON ?auto_143730 ?auto_143729 ) ( CLEAR ?auto_143730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_143735 ?auto_143728 ?auto_143729 )
      ( MAKE-4PILE ?auto_143728 ?auto_143729 ?auto_143730 ?auto_143731 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143737 - BLOCK
      ?auto_143738 - BLOCK
      ?auto_143739 - BLOCK
      ?auto_143740 - BLOCK
    )
    :vars
    (
      ?auto_143741 - BLOCK
      ?auto_143745 - BLOCK
      ?auto_143742 - BLOCK
      ?auto_143743 - BLOCK
      ?auto_143744 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143737 ?auto_143738 ) ) ( not ( = ?auto_143737 ?auto_143739 ) ) ( not ( = ?auto_143737 ?auto_143740 ) ) ( not ( = ?auto_143738 ?auto_143739 ) ) ( not ( = ?auto_143738 ?auto_143740 ) ) ( not ( = ?auto_143739 ?auto_143740 ) ) ( not ( = ?auto_143737 ?auto_143741 ) ) ( not ( = ?auto_143738 ?auto_143741 ) ) ( not ( = ?auto_143739 ?auto_143741 ) ) ( not ( = ?auto_143740 ?auto_143741 ) ) ( ON-TABLE ?auto_143745 ) ( ON ?auto_143742 ?auto_143745 ) ( ON ?auto_143743 ?auto_143742 ) ( ON ?auto_143741 ?auto_143743 ) ( not ( = ?auto_143745 ?auto_143742 ) ) ( not ( = ?auto_143745 ?auto_143743 ) ) ( not ( = ?auto_143745 ?auto_143741 ) ) ( not ( = ?auto_143745 ?auto_143740 ) ) ( not ( = ?auto_143745 ?auto_143739 ) ) ( not ( = ?auto_143742 ?auto_143743 ) ) ( not ( = ?auto_143742 ?auto_143741 ) ) ( not ( = ?auto_143742 ?auto_143740 ) ) ( not ( = ?auto_143742 ?auto_143739 ) ) ( not ( = ?auto_143743 ?auto_143741 ) ) ( not ( = ?auto_143743 ?auto_143740 ) ) ( not ( = ?auto_143743 ?auto_143739 ) ) ( not ( = ?auto_143737 ?auto_143745 ) ) ( not ( = ?auto_143737 ?auto_143742 ) ) ( not ( = ?auto_143737 ?auto_143743 ) ) ( not ( = ?auto_143738 ?auto_143745 ) ) ( not ( = ?auto_143738 ?auto_143742 ) ) ( not ( = ?auto_143738 ?auto_143743 ) ) ( ON ?auto_143737 ?auto_143744 ) ( not ( = ?auto_143737 ?auto_143744 ) ) ( not ( = ?auto_143738 ?auto_143744 ) ) ( not ( = ?auto_143739 ?auto_143744 ) ) ( not ( = ?auto_143740 ?auto_143744 ) ) ( not ( = ?auto_143741 ?auto_143744 ) ) ( not ( = ?auto_143745 ?auto_143744 ) ) ( not ( = ?auto_143742 ?auto_143744 ) ) ( not ( = ?auto_143743 ?auto_143744 ) ) ( ON ?auto_143738 ?auto_143737 ) ( ON-TABLE ?auto_143744 ) ( ON ?auto_143739 ?auto_143738 ) ( CLEAR ?auto_143739 ) ( HOLDING ?auto_143740 ) ( CLEAR ?auto_143741 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_143745 ?auto_143742 ?auto_143743 ?auto_143741 ?auto_143740 )
      ( MAKE-4PILE ?auto_143737 ?auto_143738 ?auto_143739 ?auto_143740 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143746 - BLOCK
      ?auto_143747 - BLOCK
      ?auto_143748 - BLOCK
      ?auto_143749 - BLOCK
    )
    :vars
    (
      ?auto_143752 - BLOCK
      ?auto_143750 - BLOCK
      ?auto_143753 - BLOCK
      ?auto_143754 - BLOCK
      ?auto_143751 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143746 ?auto_143747 ) ) ( not ( = ?auto_143746 ?auto_143748 ) ) ( not ( = ?auto_143746 ?auto_143749 ) ) ( not ( = ?auto_143747 ?auto_143748 ) ) ( not ( = ?auto_143747 ?auto_143749 ) ) ( not ( = ?auto_143748 ?auto_143749 ) ) ( not ( = ?auto_143746 ?auto_143752 ) ) ( not ( = ?auto_143747 ?auto_143752 ) ) ( not ( = ?auto_143748 ?auto_143752 ) ) ( not ( = ?auto_143749 ?auto_143752 ) ) ( ON-TABLE ?auto_143750 ) ( ON ?auto_143753 ?auto_143750 ) ( ON ?auto_143754 ?auto_143753 ) ( ON ?auto_143752 ?auto_143754 ) ( not ( = ?auto_143750 ?auto_143753 ) ) ( not ( = ?auto_143750 ?auto_143754 ) ) ( not ( = ?auto_143750 ?auto_143752 ) ) ( not ( = ?auto_143750 ?auto_143749 ) ) ( not ( = ?auto_143750 ?auto_143748 ) ) ( not ( = ?auto_143753 ?auto_143754 ) ) ( not ( = ?auto_143753 ?auto_143752 ) ) ( not ( = ?auto_143753 ?auto_143749 ) ) ( not ( = ?auto_143753 ?auto_143748 ) ) ( not ( = ?auto_143754 ?auto_143752 ) ) ( not ( = ?auto_143754 ?auto_143749 ) ) ( not ( = ?auto_143754 ?auto_143748 ) ) ( not ( = ?auto_143746 ?auto_143750 ) ) ( not ( = ?auto_143746 ?auto_143753 ) ) ( not ( = ?auto_143746 ?auto_143754 ) ) ( not ( = ?auto_143747 ?auto_143750 ) ) ( not ( = ?auto_143747 ?auto_143753 ) ) ( not ( = ?auto_143747 ?auto_143754 ) ) ( ON ?auto_143746 ?auto_143751 ) ( not ( = ?auto_143746 ?auto_143751 ) ) ( not ( = ?auto_143747 ?auto_143751 ) ) ( not ( = ?auto_143748 ?auto_143751 ) ) ( not ( = ?auto_143749 ?auto_143751 ) ) ( not ( = ?auto_143752 ?auto_143751 ) ) ( not ( = ?auto_143750 ?auto_143751 ) ) ( not ( = ?auto_143753 ?auto_143751 ) ) ( not ( = ?auto_143754 ?auto_143751 ) ) ( ON ?auto_143747 ?auto_143746 ) ( ON-TABLE ?auto_143751 ) ( ON ?auto_143748 ?auto_143747 ) ( CLEAR ?auto_143752 ) ( ON ?auto_143749 ?auto_143748 ) ( CLEAR ?auto_143749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_143751 ?auto_143746 ?auto_143747 ?auto_143748 )
      ( MAKE-4PILE ?auto_143746 ?auto_143747 ?auto_143748 ?auto_143749 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143755 - BLOCK
      ?auto_143756 - BLOCK
      ?auto_143757 - BLOCK
      ?auto_143758 - BLOCK
    )
    :vars
    (
      ?auto_143762 - BLOCK
      ?auto_143761 - BLOCK
      ?auto_143763 - BLOCK
      ?auto_143760 - BLOCK
      ?auto_143759 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143755 ?auto_143756 ) ) ( not ( = ?auto_143755 ?auto_143757 ) ) ( not ( = ?auto_143755 ?auto_143758 ) ) ( not ( = ?auto_143756 ?auto_143757 ) ) ( not ( = ?auto_143756 ?auto_143758 ) ) ( not ( = ?auto_143757 ?auto_143758 ) ) ( not ( = ?auto_143755 ?auto_143762 ) ) ( not ( = ?auto_143756 ?auto_143762 ) ) ( not ( = ?auto_143757 ?auto_143762 ) ) ( not ( = ?auto_143758 ?auto_143762 ) ) ( ON-TABLE ?auto_143761 ) ( ON ?auto_143763 ?auto_143761 ) ( ON ?auto_143760 ?auto_143763 ) ( not ( = ?auto_143761 ?auto_143763 ) ) ( not ( = ?auto_143761 ?auto_143760 ) ) ( not ( = ?auto_143761 ?auto_143762 ) ) ( not ( = ?auto_143761 ?auto_143758 ) ) ( not ( = ?auto_143761 ?auto_143757 ) ) ( not ( = ?auto_143763 ?auto_143760 ) ) ( not ( = ?auto_143763 ?auto_143762 ) ) ( not ( = ?auto_143763 ?auto_143758 ) ) ( not ( = ?auto_143763 ?auto_143757 ) ) ( not ( = ?auto_143760 ?auto_143762 ) ) ( not ( = ?auto_143760 ?auto_143758 ) ) ( not ( = ?auto_143760 ?auto_143757 ) ) ( not ( = ?auto_143755 ?auto_143761 ) ) ( not ( = ?auto_143755 ?auto_143763 ) ) ( not ( = ?auto_143755 ?auto_143760 ) ) ( not ( = ?auto_143756 ?auto_143761 ) ) ( not ( = ?auto_143756 ?auto_143763 ) ) ( not ( = ?auto_143756 ?auto_143760 ) ) ( ON ?auto_143755 ?auto_143759 ) ( not ( = ?auto_143755 ?auto_143759 ) ) ( not ( = ?auto_143756 ?auto_143759 ) ) ( not ( = ?auto_143757 ?auto_143759 ) ) ( not ( = ?auto_143758 ?auto_143759 ) ) ( not ( = ?auto_143762 ?auto_143759 ) ) ( not ( = ?auto_143761 ?auto_143759 ) ) ( not ( = ?auto_143763 ?auto_143759 ) ) ( not ( = ?auto_143760 ?auto_143759 ) ) ( ON ?auto_143756 ?auto_143755 ) ( ON-TABLE ?auto_143759 ) ( ON ?auto_143757 ?auto_143756 ) ( ON ?auto_143758 ?auto_143757 ) ( CLEAR ?auto_143758 ) ( HOLDING ?auto_143762 ) ( CLEAR ?auto_143760 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_143761 ?auto_143763 ?auto_143760 ?auto_143762 )
      ( MAKE-4PILE ?auto_143755 ?auto_143756 ?auto_143757 ?auto_143758 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143764 - BLOCK
      ?auto_143765 - BLOCK
      ?auto_143766 - BLOCK
      ?auto_143767 - BLOCK
    )
    :vars
    (
      ?auto_143768 - BLOCK
      ?auto_143770 - BLOCK
      ?auto_143769 - BLOCK
      ?auto_143771 - BLOCK
      ?auto_143772 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143764 ?auto_143765 ) ) ( not ( = ?auto_143764 ?auto_143766 ) ) ( not ( = ?auto_143764 ?auto_143767 ) ) ( not ( = ?auto_143765 ?auto_143766 ) ) ( not ( = ?auto_143765 ?auto_143767 ) ) ( not ( = ?auto_143766 ?auto_143767 ) ) ( not ( = ?auto_143764 ?auto_143768 ) ) ( not ( = ?auto_143765 ?auto_143768 ) ) ( not ( = ?auto_143766 ?auto_143768 ) ) ( not ( = ?auto_143767 ?auto_143768 ) ) ( ON-TABLE ?auto_143770 ) ( ON ?auto_143769 ?auto_143770 ) ( ON ?auto_143771 ?auto_143769 ) ( not ( = ?auto_143770 ?auto_143769 ) ) ( not ( = ?auto_143770 ?auto_143771 ) ) ( not ( = ?auto_143770 ?auto_143768 ) ) ( not ( = ?auto_143770 ?auto_143767 ) ) ( not ( = ?auto_143770 ?auto_143766 ) ) ( not ( = ?auto_143769 ?auto_143771 ) ) ( not ( = ?auto_143769 ?auto_143768 ) ) ( not ( = ?auto_143769 ?auto_143767 ) ) ( not ( = ?auto_143769 ?auto_143766 ) ) ( not ( = ?auto_143771 ?auto_143768 ) ) ( not ( = ?auto_143771 ?auto_143767 ) ) ( not ( = ?auto_143771 ?auto_143766 ) ) ( not ( = ?auto_143764 ?auto_143770 ) ) ( not ( = ?auto_143764 ?auto_143769 ) ) ( not ( = ?auto_143764 ?auto_143771 ) ) ( not ( = ?auto_143765 ?auto_143770 ) ) ( not ( = ?auto_143765 ?auto_143769 ) ) ( not ( = ?auto_143765 ?auto_143771 ) ) ( ON ?auto_143764 ?auto_143772 ) ( not ( = ?auto_143764 ?auto_143772 ) ) ( not ( = ?auto_143765 ?auto_143772 ) ) ( not ( = ?auto_143766 ?auto_143772 ) ) ( not ( = ?auto_143767 ?auto_143772 ) ) ( not ( = ?auto_143768 ?auto_143772 ) ) ( not ( = ?auto_143770 ?auto_143772 ) ) ( not ( = ?auto_143769 ?auto_143772 ) ) ( not ( = ?auto_143771 ?auto_143772 ) ) ( ON ?auto_143765 ?auto_143764 ) ( ON-TABLE ?auto_143772 ) ( ON ?auto_143766 ?auto_143765 ) ( ON ?auto_143767 ?auto_143766 ) ( CLEAR ?auto_143771 ) ( ON ?auto_143768 ?auto_143767 ) ( CLEAR ?auto_143768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_143772 ?auto_143764 ?auto_143765 ?auto_143766 ?auto_143767 )
      ( MAKE-4PILE ?auto_143764 ?auto_143765 ?auto_143766 ?auto_143767 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143773 - BLOCK
      ?auto_143774 - BLOCK
      ?auto_143775 - BLOCK
      ?auto_143776 - BLOCK
    )
    :vars
    (
      ?auto_143779 - BLOCK
      ?auto_143780 - BLOCK
      ?auto_143781 - BLOCK
      ?auto_143777 - BLOCK
      ?auto_143778 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143773 ?auto_143774 ) ) ( not ( = ?auto_143773 ?auto_143775 ) ) ( not ( = ?auto_143773 ?auto_143776 ) ) ( not ( = ?auto_143774 ?auto_143775 ) ) ( not ( = ?auto_143774 ?auto_143776 ) ) ( not ( = ?auto_143775 ?auto_143776 ) ) ( not ( = ?auto_143773 ?auto_143779 ) ) ( not ( = ?auto_143774 ?auto_143779 ) ) ( not ( = ?auto_143775 ?auto_143779 ) ) ( not ( = ?auto_143776 ?auto_143779 ) ) ( ON-TABLE ?auto_143780 ) ( ON ?auto_143781 ?auto_143780 ) ( not ( = ?auto_143780 ?auto_143781 ) ) ( not ( = ?auto_143780 ?auto_143777 ) ) ( not ( = ?auto_143780 ?auto_143779 ) ) ( not ( = ?auto_143780 ?auto_143776 ) ) ( not ( = ?auto_143780 ?auto_143775 ) ) ( not ( = ?auto_143781 ?auto_143777 ) ) ( not ( = ?auto_143781 ?auto_143779 ) ) ( not ( = ?auto_143781 ?auto_143776 ) ) ( not ( = ?auto_143781 ?auto_143775 ) ) ( not ( = ?auto_143777 ?auto_143779 ) ) ( not ( = ?auto_143777 ?auto_143776 ) ) ( not ( = ?auto_143777 ?auto_143775 ) ) ( not ( = ?auto_143773 ?auto_143780 ) ) ( not ( = ?auto_143773 ?auto_143781 ) ) ( not ( = ?auto_143773 ?auto_143777 ) ) ( not ( = ?auto_143774 ?auto_143780 ) ) ( not ( = ?auto_143774 ?auto_143781 ) ) ( not ( = ?auto_143774 ?auto_143777 ) ) ( ON ?auto_143773 ?auto_143778 ) ( not ( = ?auto_143773 ?auto_143778 ) ) ( not ( = ?auto_143774 ?auto_143778 ) ) ( not ( = ?auto_143775 ?auto_143778 ) ) ( not ( = ?auto_143776 ?auto_143778 ) ) ( not ( = ?auto_143779 ?auto_143778 ) ) ( not ( = ?auto_143780 ?auto_143778 ) ) ( not ( = ?auto_143781 ?auto_143778 ) ) ( not ( = ?auto_143777 ?auto_143778 ) ) ( ON ?auto_143774 ?auto_143773 ) ( ON-TABLE ?auto_143778 ) ( ON ?auto_143775 ?auto_143774 ) ( ON ?auto_143776 ?auto_143775 ) ( ON ?auto_143779 ?auto_143776 ) ( CLEAR ?auto_143779 ) ( HOLDING ?auto_143777 ) ( CLEAR ?auto_143781 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_143780 ?auto_143781 ?auto_143777 )
      ( MAKE-4PILE ?auto_143773 ?auto_143774 ?auto_143775 ?auto_143776 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143782 - BLOCK
      ?auto_143783 - BLOCK
      ?auto_143784 - BLOCK
      ?auto_143785 - BLOCK
    )
    :vars
    (
      ?auto_143790 - BLOCK
      ?auto_143786 - BLOCK
      ?auto_143788 - BLOCK
      ?auto_143789 - BLOCK
      ?auto_143787 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143782 ?auto_143783 ) ) ( not ( = ?auto_143782 ?auto_143784 ) ) ( not ( = ?auto_143782 ?auto_143785 ) ) ( not ( = ?auto_143783 ?auto_143784 ) ) ( not ( = ?auto_143783 ?auto_143785 ) ) ( not ( = ?auto_143784 ?auto_143785 ) ) ( not ( = ?auto_143782 ?auto_143790 ) ) ( not ( = ?auto_143783 ?auto_143790 ) ) ( not ( = ?auto_143784 ?auto_143790 ) ) ( not ( = ?auto_143785 ?auto_143790 ) ) ( ON-TABLE ?auto_143786 ) ( ON ?auto_143788 ?auto_143786 ) ( not ( = ?auto_143786 ?auto_143788 ) ) ( not ( = ?auto_143786 ?auto_143789 ) ) ( not ( = ?auto_143786 ?auto_143790 ) ) ( not ( = ?auto_143786 ?auto_143785 ) ) ( not ( = ?auto_143786 ?auto_143784 ) ) ( not ( = ?auto_143788 ?auto_143789 ) ) ( not ( = ?auto_143788 ?auto_143790 ) ) ( not ( = ?auto_143788 ?auto_143785 ) ) ( not ( = ?auto_143788 ?auto_143784 ) ) ( not ( = ?auto_143789 ?auto_143790 ) ) ( not ( = ?auto_143789 ?auto_143785 ) ) ( not ( = ?auto_143789 ?auto_143784 ) ) ( not ( = ?auto_143782 ?auto_143786 ) ) ( not ( = ?auto_143782 ?auto_143788 ) ) ( not ( = ?auto_143782 ?auto_143789 ) ) ( not ( = ?auto_143783 ?auto_143786 ) ) ( not ( = ?auto_143783 ?auto_143788 ) ) ( not ( = ?auto_143783 ?auto_143789 ) ) ( ON ?auto_143782 ?auto_143787 ) ( not ( = ?auto_143782 ?auto_143787 ) ) ( not ( = ?auto_143783 ?auto_143787 ) ) ( not ( = ?auto_143784 ?auto_143787 ) ) ( not ( = ?auto_143785 ?auto_143787 ) ) ( not ( = ?auto_143790 ?auto_143787 ) ) ( not ( = ?auto_143786 ?auto_143787 ) ) ( not ( = ?auto_143788 ?auto_143787 ) ) ( not ( = ?auto_143789 ?auto_143787 ) ) ( ON ?auto_143783 ?auto_143782 ) ( ON-TABLE ?auto_143787 ) ( ON ?auto_143784 ?auto_143783 ) ( ON ?auto_143785 ?auto_143784 ) ( ON ?auto_143790 ?auto_143785 ) ( CLEAR ?auto_143788 ) ( ON ?auto_143789 ?auto_143790 ) ( CLEAR ?auto_143789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_143787 ?auto_143782 ?auto_143783 ?auto_143784 ?auto_143785 ?auto_143790 )
      ( MAKE-4PILE ?auto_143782 ?auto_143783 ?auto_143784 ?auto_143785 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143791 - BLOCK
      ?auto_143792 - BLOCK
      ?auto_143793 - BLOCK
      ?auto_143794 - BLOCK
    )
    :vars
    (
      ?auto_143796 - BLOCK
      ?auto_143795 - BLOCK
      ?auto_143797 - BLOCK
      ?auto_143798 - BLOCK
      ?auto_143799 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143791 ?auto_143792 ) ) ( not ( = ?auto_143791 ?auto_143793 ) ) ( not ( = ?auto_143791 ?auto_143794 ) ) ( not ( = ?auto_143792 ?auto_143793 ) ) ( not ( = ?auto_143792 ?auto_143794 ) ) ( not ( = ?auto_143793 ?auto_143794 ) ) ( not ( = ?auto_143791 ?auto_143796 ) ) ( not ( = ?auto_143792 ?auto_143796 ) ) ( not ( = ?auto_143793 ?auto_143796 ) ) ( not ( = ?auto_143794 ?auto_143796 ) ) ( ON-TABLE ?auto_143795 ) ( not ( = ?auto_143795 ?auto_143797 ) ) ( not ( = ?auto_143795 ?auto_143798 ) ) ( not ( = ?auto_143795 ?auto_143796 ) ) ( not ( = ?auto_143795 ?auto_143794 ) ) ( not ( = ?auto_143795 ?auto_143793 ) ) ( not ( = ?auto_143797 ?auto_143798 ) ) ( not ( = ?auto_143797 ?auto_143796 ) ) ( not ( = ?auto_143797 ?auto_143794 ) ) ( not ( = ?auto_143797 ?auto_143793 ) ) ( not ( = ?auto_143798 ?auto_143796 ) ) ( not ( = ?auto_143798 ?auto_143794 ) ) ( not ( = ?auto_143798 ?auto_143793 ) ) ( not ( = ?auto_143791 ?auto_143795 ) ) ( not ( = ?auto_143791 ?auto_143797 ) ) ( not ( = ?auto_143791 ?auto_143798 ) ) ( not ( = ?auto_143792 ?auto_143795 ) ) ( not ( = ?auto_143792 ?auto_143797 ) ) ( not ( = ?auto_143792 ?auto_143798 ) ) ( ON ?auto_143791 ?auto_143799 ) ( not ( = ?auto_143791 ?auto_143799 ) ) ( not ( = ?auto_143792 ?auto_143799 ) ) ( not ( = ?auto_143793 ?auto_143799 ) ) ( not ( = ?auto_143794 ?auto_143799 ) ) ( not ( = ?auto_143796 ?auto_143799 ) ) ( not ( = ?auto_143795 ?auto_143799 ) ) ( not ( = ?auto_143797 ?auto_143799 ) ) ( not ( = ?auto_143798 ?auto_143799 ) ) ( ON ?auto_143792 ?auto_143791 ) ( ON-TABLE ?auto_143799 ) ( ON ?auto_143793 ?auto_143792 ) ( ON ?auto_143794 ?auto_143793 ) ( ON ?auto_143796 ?auto_143794 ) ( ON ?auto_143798 ?auto_143796 ) ( CLEAR ?auto_143798 ) ( HOLDING ?auto_143797 ) ( CLEAR ?auto_143795 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143795 ?auto_143797 )
      ( MAKE-4PILE ?auto_143791 ?auto_143792 ?auto_143793 ?auto_143794 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143800 - BLOCK
      ?auto_143801 - BLOCK
      ?auto_143802 - BLOCK
      ?auto_143803 - BLOCK
    )
    :vars
    (
      ?auto_143804 - BLOCK
      ?auto_143806 - BLOCK
      ?auto_143807 - BLOCK
      ?auto_143808 - BLOCK
      ?auto_143805 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143800 ?auto_143801 ) ) ( not ( = ?auto_143800 ?auto_143802 ) ) ( not ( = ?auto_143800 ?auto_143803 ) ) ( not ( = ?auto_143801 ?auto_143802 ) ) ( not ( = ?auto_143801 ?auto_143803 ) ) ( not ( = ?auto_143802 ?auto_143803 ) ) ( not ( = ?auto_143800 ?auto_143804 ) ) ( not ( = ?auto_143801 ?auto_143804 ) ) ( not ( = ?auto_143802 ?auto_143804 ) ) ( not ( = ?auto_143803 ?auto_143804 ) ) ( ON-TABLE ?auto_143806 ) ( not ( = ?auto_143806 ?auto_143807 ) ) ( not ( = ?auto_143806 ?auto_143808 ) ) ( not ( = ?auto_143806 ?auto_143804 ) ) ( not ( = ?auto_143806 ?auto_143803 ) ) ( not ( = ?auto_143806 ?auto_143802 ) ) ( not ( = ?auto_143807 ?auto_143808 ) ) ( not ( = ?auto_143807 ?auto_143804 ) ) ( not ( = ?auto_143807 ?auto_143803 ) ) ( not ( = ?auto_143807 ?auto_143802 ) ) ( not ( = ?auto_143808 ?auto_143804 ) ) ( not ( = ?auto_143808 ?auto_143803 ) ) ( not ( = ?auto_143808 ?auto_143802 ) ) ( not ( = ?auto_143800 ?auto_143806 ) ) ( not ( = ?auto_143800 ?auto_143807 ) ) ( not ( = ?auto_143800 ?auto_143808 ) ) ( not ( = ?auto_143801 ?auto_143806 ) ) ( not ( = ?auto_143801 ?auto_143807 ) ) ( not ( = ?auto_143801 ?auto_143808 ) ) ( ON ?auto_143800 ?auto_143805 ) ( not ( = ?auto_143800 ?auto_143805 ) ) ( not ( = ?auto_143801 ?auto_143805 ) ) ( not ( = ?auto_143802 ?auto_143805 ) ) ( not ( = ?auto_143803 ?auto_143805 ) ) ( not ( = ?auto_143804 ?auto_143805 ) ) ( not ( = ?auto_143806 ?auto_143805 ) ) ( not ( = ?auto_143807 ?auto_143805 ) ) ( not ( = ?auto_143808 ?auto_143805 ) ) ( ON ?auto_143801 ?auto_143800 ) ( ON-TABLE ?auto_143805 ) ( ON ?auto_143802 ?auto_143801 ) ( ON ?auto_143803 ?auto_143802 ) ( ON ?auto_143804 ?auto_143803 ) ( ON ?auto_143808 ?auto_143804 ) ( CLEAR ?auto_143806 ) ( ON ?auto_143807 ?auto_143808 ) ( CLEAR ?auto_143807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_143805 ?auto_143800 ?auto_143801 ?auto_143802 ?auto_143803 ?auto_143804 ?auto_143808 )
      ( MAKE-4PILE ?auto_143800 ?auto_143801 ?auto_143802 ?auto_143803 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143809 - BLOCK
      ?auto_143810 - BLOCK
      ?auto_143811 - BLOCK
      ?auto_143812 - BLOCK
    )
    :vars
    (
      ?auto_143814 - BLOCK
      ?auto_143817 - BLOCK
      ?auto_143815 - BLOCK
      ?auto_143813 - BLOCK
      ?auto_143816 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143809 ?auto_143810 ) ) ( not ( = ?auto_143809 ?auto_143811 ) ) ( not ( = ?auto_143809 ?auto_143812 ) ) ( not ( = ?auto_143810 ?auto_143811 ) ) ( not ( = ?auto_143810 ?auto_143812 ) ) ( not ( = ?auto_143811 ?auto_143812 ) ) ( not ( = ?auto_143809 ?auto_143814 ) ) ( not ( = ?auto_143810 ?auto_143814 ) ) ( not ( = ?auto_143811 ?auto_143814 ) ) ( not ( = ?auto_143812 ?auto_143814 ) ) ( not ( = ?auto_143817 ?auto_143815 ) ) ( not ( = ?auto_143817 ?auto_143813 ) ) ( not ( = ?auto_143817 ?auto_143814 ) ) ( not ( = ?auto_143817 ?auto_143812 ) ) ( not ( = ?auto_143817 ?auto_143811 ) ) ( not ( = ?auto_143815 ?auto_143813 ) ) ( not ( = ?auto_143815 ?auto_143814 ) ) ( not ( = ?auto_143815 ?auto_143812 ) ) ( not ( = ?auto_143815 ?auto_143811 ) ) ( not ( = ?auto_143813 ?auto_143814 ) ) ( not ( = ?auto_143813 ?auto_143812 ) ) ( not ( = ?auto_143813 ?auto_143811 ) ) ( not ( = ?auto_143809 ?auto_143817 ) ) ( not ( = ?auto_143809 ?auto_143815 ) ) ( not ( = ?auto_143809 ?auto_143813 ) ) ( not ( = ?auto_143810 ?auto_143817 ) ) ( not ( = ?auto_143810 ?auto_143815 ) ) ( not ( = ?auto_143810 ?auto_143813 ) ) ( ON ?auto_143809 ?auto_143816 ) ( not ( = ?auto_143809 ?auto_143816 ) ) ( not ( = ?auto_143810 ?auto_143816 ) ) ( not ( = ?auto_143811 ?auto_143816 ) ) ( not ( = ?auto_143812 ?auto_143816 ) ) ( not ( = ?auto_143814 ?auto_143816 ) ) ( not ( = ?auto_143817 ?auto_143816 ) ) ( not ( = ?auto_143815 ?auto_143816 ) ) ( not ( = ?auto_143813 ?auto_143816 ) ) ( ON ?auto_143810 ?auto_143809 ) ( ON-TABLE ?auto_143816 ) ( ON ?auto_143811 ?auto_143810 ) ( ON ?auto_143812 ?auto_143811 ) ( ON ?auto_143814 ?auto_143812 ) ( ON ?auto_143813 ?auto_143814 ) ( ON ?auto_143815 ?auto_143813 ) ( CLEAR ?auto_143815 ) ( HOLDING ?auto_143817 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_143817 )
      ( MAKE-4PILE ?auto_143809 ?auto_143810 ?auto_143811 ?auto_143812 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143818 - BLOCK
      ?auto_143819 - BLOCK
      ?auto_143820 - BLOCK
      ?auto_143821 - BLOCK
    )
    :vars
    (
      ?auto_143826 - BLOCK
      ?auto_143822 - BLOCK
      ?auto_143824 - BLOCK
      ?auto_143825 - BLOCK
      ?auto_143823 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143818 ?auto_143819 ) ) ( not ( = ?auto_143818 ?auto_143820 ) ) ( not ( = ?auto_143818 ?auto_143821 ) ) ( not ( = ?auto_143819 ?auto_143820 ) ) ( not ( = ?auto_143819 ?auto_143821 ) ) ( not ( = ?auto_143820 ?auto_143821 ) ) ( not ( = ?auto_143818 ?auto_143826 ) ) ( not ( = ?auto_143819 ?auto_143826 ) ) ( not ( = ?auto_143820 ?auto_143826 ) ) ( not ( = ?auto_143821 ?auto_143826 ) ) ( not ( = ?auto_143822 ?auto_143824 ) ) ( not ( = ?auto_143822 ?auto_143825 ) ) ( not ( = ?auto_143822 ?auto_143826 ) ) ( not ( = ?auto_143822 ?auto_143821 ) ) ( not ( = ?auto_143822 ?auto_143820 ) ) ( not ( = ?auto_143824 ?auto_143825 ) ) ( not ( = ?auto_143824 ?auto_143826 ) ) ( not ( = ?auto_143824 ?auto_143821 ) ) ( not ( = ?auto_143824 ?auto_143820 ) ) ( not ( = ?auto_143825 ?auto_143826 ) ) ( not ( = ?auto_143825 ?auto_143821 ) ) ( not ( = ?auto_143825 ?auto_143820 ) ) ( not ( = ?auto_143818 ?auto_143822 ) ) ( not ( = ?auto_143818 ?auto_143824 ) ) ( not ( = ?auto_143818 ?auto_143825 ) ) ( not ( = ?auto_143819 ?auto_143822 ) ) ( not ( = ?auto_143819 ?auto_143824 ) ) ( not ( = ?auto_143819 ?auto_143825 ) ) ( ON ?auto_143818 ?auto_143823 ) ( not ( = ?auto_143818 ?auto_143823 ) ) ( not ( = ?auto_143819 ?auto_143823 ) ) ( not ( = ?auto_143820 ?auto_143823 ) ) ( not ( = ?auto_143821 ?auto_143823 ) ) ( not ( = ?auto_143826 ?auto_143823 ) ) ( not ( = ?auto_143822 ?auto_143823 ) ) ( not ( = ?auto_143824 ?auto_143823 ) ) ( not ( = ?auto_143825 ?auto_143823 ) ) ( ON ?auto_143819 ?auto_143818 ) ( ON-TABLE ?auto_143823 ) ( ON ?auto_143820 ?auto_143819 ) ( ON ?auto_143821 ?auto_143820 ) ( ON ?auto_143826 ?auto_143821 ) ( ON ?auto_143825 ?auto_143826 ) ( ON ?auto_143824 ?auto_143825 ) ( ON ?auto_143822 ?auto_143824 ) ( CLEAR ?auto_143822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_143823 ?auto_143818 ?auto_143819 ?auto_143820 ?auto_143821 ?auto_143826 ?auto_143825 ?auto_143824 )
      ( MAKE-4PILE ?auto_143818 ?auto_143819 ?auto_143820 ?auto_143821 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143830 - BLOCK
      ?auto_143831 - BLOCK
      ?auto_143832 - BLOCK
    )
    :vars
    (
      ?auto_143833 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143833 ?auto_143832 ) ( CLEAR ?auto_143833 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_143830 ) ( ON ?auto_143831 ?auto_143830 ) ( ON ?auto_143832 ?auto_143831 ) ( not ( = ?auto_143830 ?auto_143831 ) ) ( not ( = ?auto_143830 ?auto_143832 ) ) ( not ( = ?auto_143830 ?auto_143833 ) ) ( not ( = ?auto_143831 ?auto_143832 ) ) ( not ( = ?auto_143831 ?auto_143833 ) ) ( not ( = ?auto_143832 ?auto_143833 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143833 ?auto_143832 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143834 - BLOCK
      ?auto_143835 - BLOCK
      ?auto_143836 - BLOCK
    )
    :vars
    (
      ?auto_143837 - BLOCK
      ?auto_143838 - BLOCK
      ?auto_143839 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143837 ?auto_143836 ) ( CLEAR ?auto_143837 ) ( ON-TABLE ?auto_143834 ) ( ON ?auto_143835 ?auto_143834 ) ( ON ?auto_143836 ?auto_143835 ) ( not ( = ?auto_143834 ?auto_143835 ) ) ( not ( = ?auto_143834 ?auto_143836 ) ) ( not ( = ?auto_143834 ?auto_143837 ) ) ( not ( = ?auto_143835 ?auto_143836 ) ) ( not ( = ?auto_143835 ?auto_143837 ) ) ( not ( = ?auto_143836 ?auto_143837 ) ) ( HOLDING ?auto_143838 ) ( CLEAR ?auto_143839 ) ( not ( = ?auto_143834 ?auto_143838 ) ) ( not ( = ?auto_143834 ?auto_143839 ) ) ( not ( = ?auto_143835 ?auto_143838 ) ) ( not ( = ?auto_143835 ?auto_143839 ) ) ( not ( = ?auto_143836 ?auto_143838 ) ) ( not ( = ?auto_143836 ?auto_143839 ) ) ( not ( = ?auto_143837 ?auto_143838 ) ) ( not ( = ?auto_143837 ?auto_143839 ) ) ( not ( = ?auto_143838 ?auto_143839 ) ) )
    :subtasks
    ( ( !STACK ?auto_143838 ?auto_143839 )
      ( MAKE-3PILE ?auto_143834 ?auto_143835 ?auto_143836 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143840 - BLOCK
      ?auto_143841 - BLOCK
      ?auto_143842 - BLOCK
    )
    :vars
    (
      ?auto_143843 - BLOCK
      ?auto_143845 - BLOCK
      ?auto_143844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143843 ?auto_143842 ) ( ON-TABLE ?auto_143840 ) ( ON ?auto_143841 ?auto_143840 ) ( ON ?auto_143842 ?auto_143841 ) ( not ( = ?auto_143840 ?auto_143841 ) ) ( not ( = ?auto_143840 ?auto_143842 ) ) ( not ( = ?auto_143840 ?auto_143843 ) ) ( not ( = ?auto_143841 ?auto_143842 ) ) ( not ( = ?auto_143841 ?auto_143843 ) ) ( not ( = ?auto_143842 ?auto_143843 ) ) ( CLEAR ?auto_143845 ) ( not ( = ?auto_143840 ?auto_143844 ) ) ( not ( = ?auto_143840 ?auto_143845 ) ) ( not ( = ?auto_143841 ?auto_143844 ) ) ( not ( = ?auto_143841 ?auto_143845 ) ) ( not ( = ?auto_143842 ?auto_143844 ) ) ( not ( = ?auto_143842 ?auto_143845 ) ) ( not ( = ?auto_143843 ?auto_143844 ) ) ( not ( = ?auto_143843 ?auto_143845 ) ) ( not ( = ?auto_143844 ?auto_143845 ) ) ( ON ?auto_143844 ?auto_143843 ) ( CLEAR ?auto_143844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_143840 ?auto_143841 ?auto_143842 ?auto_143843 )
      ( MAKE-3PILE ?auto_143840 ?auto_143841 ?auto_143842 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143846 - BLOCK
      ?auto_143847 - BLOCK
      ?auto_143848 - BLOCK
    )
    :vars
    (
      ?auto_143851 - BLOCK
      ?auto_143850 - BLOCK
      ?auto_143849 - BLOCK
      ?auto_143853 - BLOCK
      ?auto_143852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143851 ?auto_143848 ) ( ON-TABLE ?auto_143846 ) ( ON ?auto_143847 ?auto_143846 ) ( ON ?auto_143848 ?auto_143847 ) ( not ( = ?auto_143846 ?auto_143847 ) ) ( not ( = ?auto_143846 ?auto_143848 ) ) ( not ( = ?auto_143846 ?auto_143851 ) ) ( not ( = ?auto_143847 ?auto_143848 ) ) ( not ( = ?auto_143847 ?auto_143851 ) ) ( not ( = ?auto_143848 ?auto_143851 ) ) ( not ( = ?auto_143846 ?auto_143850 ) ) ( not ( = ?auto_143846 ?auto_143849 ) ) ( not ( = ?auto_143847 ?auto_143850 ) ) ( not ( = ?auto_143847 ?auto_143849 ) ) ( not ( = ?auto_143848 ?auto_143850 ) ) ( not ( = ?auto_143848 ?auto_143849 ) ) ( not ( = ?auto_143851 ?auto_143850 ) ) ( not ( = ?auto_143851 ?auto_143849 ) ) ( not ( = ?auto_143850 ?auto_143849 ) ) ( ON ?auto_143850 ?auto_143851 ) ( CLEAR ?auto_143850 ) ( HOLDING ?auto_143849 ) ( CLEAR ?auto_143853 ) ( ON-TABLE ?auto_143852 ) ( ON ?auto_143853 ?auto_143852 ) ( not ( = ?auto_143852 ?auto_143853 ) ) ( not ( = ?auto_143852 ?auto_143849 ) ) ( not ( = ?auto_143853 ?auto_143849 ) ) ( not ( = ?auto_143846 ?auto_143853 ) ) ( not ( = ?auto_143846 ?auto_143852 ) ) ( not ( = ?auto_143847 ?auto_143853 ) ) ( not ( = ?auto_143847 ?auto_143852 ) ) ( not ( = ?auto_143848 ?auto_143853 ) ) ( not ( = ?auto_143848 ?auto_143852 ) ) ( not ( = ?auto_143851 ?auto_143853 ) ) ( not ( = ?auto_143851 ?auto_143852 ) ) ( not ( = ?auto_143850 ?auto_143853 ) ) ( not ( = ?auto_143850 ?auto_143852 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_143852 ?auto_143853 ?auto_143849 )
      ( MAKE-3PILE ?auto_143846 ?auto_143847 ?auto_143848 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143854 - BLOCK
      ?auto_143855 - BLOCK
      ?auto_143856 - BLOCK
    )
    :vars
    (
      ?auto_143858 - BLOCK
      ?auto_143859 - BLOCK
      ?auto_143860 - BLOCK
      ?auto_143861 - BLOCK
      ?auto_143857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143858 ?auto_143856 ) ( ON-TABLE ?auto_143854 ) ( ON ?auto_143855 ?auto_143854 ) ( ON ?auto_143856 ?auto_143855 ) ( not ( = ?auto_143854 ?auto_143855 ) ) ( not ( = ?auto_143854 ?auto_143856 ) ) ( not ( = ?auto_143854 ?auto_143858 ) ) ( not ( = ?auto_143855 ?auto_143856 ) ) ( not ( = ?auto_143855 ?auto_143858 ) ) ( not ( = ?auto_143856 ?auto_143858 ) ) ( not ( = ?auto_143854 ?auto_143859 ) ) ( not ( = ?auto_143854 ?auto_143860 ) ) ( not ( = ?auto_143855 ?auto_143859 ) ) ( not ( = ?auto_143855 ?auto_143860 ) ) ( not ( = ?auto_143856 ?auto_143859 ) ) ( not ( = ?auto_143856 ?auto_143860 ) ) ( not ( = ?auto_143858 ?auto_143859 ) ) ( not ( = ?auto_143858 ?auto_143860 ) ) ( not ( = ?auto_143859 ?auto_143860 ) ) ( ON ?auto_143859 ?auto_143858 ) ( CLEAR ?auto_143861 ) ( ON-TABLE ?auto_143857 ) ( ON ?auto_143861 ?auto_143857 ) ( not ( = ?auto_143857 ?auto_143861 ) ) ( not ( = ?auto_143857 ?auto_143860 ) ) ( not ( = ?auto_143861 ?auto_143860 ) ) ( not ( = ?auto_143854 ?auto_143861 ) ) ( not ( = ?auto_143854 ?auto_143857 ) ) ( not ( = ?auto_143855 ?auto_143861 ) ) ( not ( = ?auto_143855 ?auto_143857 ) ) ( not ( = ?auto_143856 ?auto_143861 ) ) ( not ( = ?auto_143856 ?auto_143857 ) ) ( not ( = ?auto_143858 ?auto_143861 ) ) ( not ( = ?auto_143858 ?auto_143857 ) ) ( not ( = ?auto_143859 ?auto_143861 ) ) ( not ( = ?auto_143859 ?auto_143857 ) ) ( ON ?auto_143860 ?auto_143859 ) ( CLEAR ?auto_143860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_143854 ?auto_143855 ?auto_143856 ?auto_143858 ?auto_143859 )
      ( MAKE-3PILE ?auto_143854 ?auto_143855 ?auto_143856 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143862 - BLOCK
      ?auto_143863 - BLOCK
      ?auto_143864 - BLOCK
    )
    :vars
    (
      ?auto_143867 - BLOCK
      ?auto_143868 - BLOCK
      ?auto_143866 - BLOCK
      ?auto_143869 - BLOCK
      ?auto_143865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143867 ?auto_143864 ) ( ON-TABLE ?auto_143862 ) ( ON ?auto_143863 ?auto_143862 ) ( ON ?auto_143864 ?auto_143863 ) ( not ( = ?auto_143862 ?auto_143863 ) ) ( not ( = ?auto_143862 ?auto_143864 ) ) ( not ( = ?auto_143862 ?auto_143867 ) ) ( not ( = ?auto_143863 ?auto_143864 ) ) ( not ( = ?auto_143863 ?auto_143867 ) ) ( not ( = ?auto_143864 ?auto_143867 ) ) ( not ( = ?auto_143862 ?auto_143868 ) ) ( not ( = ?auto_143862 ?auto_143866 ) ) ( not ( = ?auto_143863 ?auto_143868 ) ) ( not ( = ?auto_143863 ?auto_143866 ) ) ( not ( = ?auto_143864 ?auto_143868 ) ) ( not ( = ?auto_143864 ?auto_143866 ) ) ( not ( = ?auto_143867 ?auto_143868 ) ) ( not ( = ?auto_143867 ?auto_143866 ) ) ( not ( = ?auto_143868 ?auto_143866 ) ) ( ON ?auto_143868 ?auto_143867 ) ( ON-TABLE ?auto_143869 ) ( not ( = ?auto_143869 ?auto_143865 ) ) ( not ( = ?auto_143869 ?auto_143866 ) ) ( not ( = ?auto_143865 ?auto_143866 ) ) ( not ( = ?auto_143862 ?auto_143865 ) ) ( not ( = ?auto_143862 ?auto_143869 ) ) ( not ( = ?auto_143863 ?auto_143865 ) ) ( not ( = ?auto_143863 ?auto_143869 ) ) ( not ( = ?auto_143864 ?auto_143865 ) ) ( not ( = ?auto_143864 ?auto_143869 ) ) ( not ( = ?auto_143867 ?auto_143865 ) ) ( not ( = ?auto_143867 ?auto_143869 ) ) ( not ( = ?auto_143868 ?auto_143865 ) ) ( not ( = ?auto_143868 ?auto_143869 ) ) ( ON ?auto_143866 ?auto_143868 ) ( CLEAR ?auto_143866 ) ( HOLDING ?auto_143865 ) ( CLEAR ?auto_143869 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143869 ?auto_143865 )
      ( MAKE-3PILE ?auto_143862 ?auto_143863 ?auto_143864 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143870 - BLOCK
      ?auto_143871 - BLOCK
      ?auto_143872 - BLOCK
    )
    :vars
    (
      ?auto_143873 - BLOCK
      ?auto_143875 - BLOCK
      ?auto_143874 - BLOCK
      ?auto_143876 - BLOCK
      ?auto_143877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143873 ?auto_143872 ) ( ON-TABLE ?auto_143870 ) ( ON ?auto_143871 ?auto_143870 ) ( ON ?auto_143872 ?auto_143871 ) ( not ( = ?auto_143870 ?auto_143871 ) ) ( not ( = ?auto_143870 ?auto_143872 ) ) ( not ( = ?auto_143870 ?auto_143873 ) ) ( not ( = ?auto_143871 ?auto_143872 ) ) ( not ( = ?auto_143871 ?auto_143873 ) ) ( not ( = ?auto_143872 ?auto_143873 ) ) ( not ( = ?auto_143870 ?auto_143875 ) ) ( not ( = ?auto_143870 ?auto_143874 ) ) ( not ( = ?auto_143871 ?auto_143875 ) ) ( not ( = ?auto_143871 ?auto_143874 ) ) ( not ( = ?auto_143872 ?auto_143875 ) ) ( not ( = ?auto_143872 ?auto_143874 ) ) ( not ( = ?auto_143873 ?auto_143875 ) ) ( not ( = ?auto_143873 ?auto_143874 ) ) ( not ( = ?auto_143875 ?auto_143874 ) ) ( ON ?auto_143875 ?auto_143873 ) ( ON-TABLE ?auto_143876 ) ( not ( = ?auto_143876 ?auto_143877 ) ) ( not ( = ?auto_143876 ?auto_143874 ) ) ( not ( = ?auto_143877 ?auto_143874 ) ) ( not ( = ?auto_143870 ?auto_143877 ) ) ( not ( = ?auto_143870 ?auto_143876 ) ) ( not ( = ?auto_143871 ?auto_143877 ) ) ( not ( = ?auto_143871 ?auto_143876 ) ) ( not ( = ?auto_143872 ?auto_143877 ) ) ( not ( = ?auto_143872 ?auto_143876 ) ) ( not ( = ?auto_143873 ?auto_143877 ) ) ( not ( = ?auto_143873 ?auto_143876 ) ) ( not ( = ?auto_143875 ?auto_143877 ) ) ( not ( = ?auto_143875 ?auto_143876 ) ) ( ON ?auto_143874 ?auto_143875 ) ( CLEAR ?auto_143876 ) ( ON ?auto_143877 ?auto_143874 ) ( CLEAR ?auto_143877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_143870 ?auto_143871 ?auto_143872 ?auto_143873 ?auto_143875 ?auto_143874 )
      ( MAKE-3PILE ?auto_143870 ?auto_143871 ?auto_143872 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143878 - BLOCK
      ?auto_143879 - BLOCK
      ?auto_143880 - BLOCK
    )
    :vars
    (
      ?auto_143882 - BLOCK
      ?auto_143885 - BLOCK
      ?auto_143884 - BLOCK
      ?auto_143883 - BLOCK
      ?auto_143881 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143882 ?auto_143880 ) ( ON-TABLE ?auto_143878 ) ( ON ?auto_143879 ?auto_143878 ) ( ON ?auto_143880 ?auto_143879 ) ( not ( = ?auto_143878 ?auto_143879 ) ) ( not ( = ?auto_143878 ?auto_143880 ) ) ( not ( = ?auto_143878 ?auto_143882 ) ) ( not ( = ?auto_143879 ?auto_143880 ) ) ( not ( = ?auto_143879 ?auto_143882 ) ) ( not ( = ?auto_143880 ?auto_143882 ) ) ( not ( = ?auto_143878 ?auto_143885 ) ) ( not ( = ?auto_143878 ?auto_143884 ) ) ( not ( = ?auto_143879 ?auto_143885 ) ) ( not ( = ?auto_143879 ?auto_143884 ) ) ( not ( = ?auto_143880 ?auto_143885 ) ) ( not ( = ?auto_143880 ?auto_143884 ) ) ( not ( = ?auto_143882 ?auto_143885 ) ) ( not ( = ?auto_143882 ?auto_143884 ) ) ( not ( = ?auto_143885 ?auto_143884 ) ) ( ON ?auto_143885 ?auto_143882 ) ( not ( = ?auto_143883 ?auto_143881 ) ) ( not ( = ?auto_143883 ?auto_143884 ) ) ( not ( = ?auto_143881 ?auto_143884 ) ) ( not ( = ?auto_143878 ?auto_143881 ) ) ( not ( = ?auto_143878 ?auto_143883 ) ) ( not ( = ?auto_143879 ?auto_143881 ) ) ( not ( = ?auto_143879 ?auto_143883 ) ) ( not ( = ?auto_143880 ?auto_143881 ) ) ( not ( = ?auto_143880 ?auto_143883 ) ) ( not ( = ?auto_143882 ?auto_143881 ) ) ( not ( = ?auto_143882 ?auto_143883 ) ) ( not ( = ?auto_143885 ?auto_143881 ) ) ( not ( = ?auto_143885 ?auto_143883 ) ) ( ON ?auto_143884 ?auto_143885 ) ( ON ?auto_143881 ?auto_143884 ) ( CLEAR ?auto_143881 ) ( HOLDING ?auto_143883 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_143883 )
      ( MAKE-3PILE ?auto_143878 ?auto_143879 ?auto_143880 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143886 - BLOCK
      ?auto_143887 - BLOCK
      ?auto_143888 - BLOCK
    )
    :vars
    (
      ?auto_143893 - BLOCK
      ?auto_143890 - BLOCK
      ?auto_143889 - BLOCK
      ?auto_143891 - BLOCK
      ?auto_143892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143893 ?auto_143888 ) ( ON-TABLE ?auto_143886 ) ( ON ?auto_143887 ?auto_143886 ) ( ON ?auto_143888 ?auto_143887 ) ( not ( = ?auto_143886 ?auto_143887 ) ) ( not ( = ?auto_143886 ?auto_143888 ) ) ( not ( = ?auto_143886 ?auto_143893 ) ) ( not ( = ?auto_143887 ?auto_143888 ) ) ( not ( = ?auto_143887 ?auto_143893 ) ) ( not ( = ?auto_143888 ?auto_143893 ) ) ( not ( = ?auto_143886 ?auto_143890 ) ) ( not ( = ?auto_143886 ?auto_143889 ) ) ( not ( = ?auto_143887 ?auto_143890 ) ) ( not ( = ?auto_143887 ?auto_143889 ) ) ( not ( = ?auto_143888 ?auto_143890 ) ) ( not ( = ?auto_143888 ?auto_143889 ) ) ( not ( = ?auto_143893 ?auto_143890 ) ) ( not ( = ?auto_143893 ?auto_143889 ) ) ( not ( = ?auto_143890 ?auto_143889 ) ) ( ON ?auto_143890 ?auto_143893 ) ( not ( = ?auto_143891 ?auto_143892 ) ) ( not ( = ?auto_143891 ?auto_143889 ) ) ( not ( = ?auto_143892 ?auto_143889 ) ) ( not ( = ?auto_143886 ?auto_143892 ) ) ( not ( = ?auto_143886 ?auto_143891 ) ) ( not ( = ?auto_143887 ?auto_143892 ) ) ( not ( = ?auto_143887 ?auto_143891 ) ) ( not ( = ?auto_143888 ?auto_143892 ) ) ( not ( = ?auto_143888 ?auto_143891 ) ) ( not ( = ?auto_143893 ?auto_143892 ) ) ( not ( = ?auto_143893 ?auto_143891 ) ) ( not ( = ?auto_143890 ?auto_143892 ) ) ( not ( = ?auto_143890 ?auto_143891 ) ) ( ON ?auto_143889 ?auto_143890 ) ( ON ?auto_143892 ?auto_143889 ) ( ON ?auto_143891 ?auto_143892 ) ( CLEAR ?auto_143891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_143886 ?auto_143887 ?auto_143888 ?auto_143893 ?auto_143890 ?auto_143889 ?auto_143892 )
      ( MAKE-3PILE ?auto_143886 ?auto_143887 ?auto_143888 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143894 - BLOCK
      ?auto_143895 - BLOCK
      ?auto_143896 - BLOCK
    )
    :vars
    (
      ?auto_143898 - BLOCK
      ?auto_143900 - BLOCK
      ?auto_143899 - BLOCK
      ?auto_143901 - BLOCK
      ?auto_143897 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143898 ?auto_143896 ) ( ON-TABLE ?auto_143894 ) ( ON ?auto_143895 ?auto_143894 ) ( ON ?auto_143896 ?auto_143895 ) ( not ( = ?auto_143894 ?auto_143895 ) ) ( not ( = ?auto_143894 ?auto_143896 ) ) ( not ( = ?auto_143894 ?auto_143898 ) ) ( not ( = ?auto_143895 ?auto_143896 ) ) ( not ( = ?auto_143895 ?auto_143898 ) ) ( not ( = ?auto_143896 ?auto_143898 ) ) ( not ( = ?auto_143894 ?auto_143900 ) ) ( not ( = ?auto_143894 ?auto_143899 ) ) ( not ( = ?auto_143895 ?auto_143900 ) ) ( not ( = ?auto_143895 ?auto_143899 ) ) ( not ( = ?auto_143896 ?auto_143900 ) ) ( not ( = ?auto_143896 ?auto_143899 ) ) ( not ( = ?auto_143898 ?auto_143900 ) ) ( not ( = ?auto_143898 ?auto_143899 ) ) ( not ( = ?auto_143900 ?auto_143899 ) ) ( ON ?auto_143900 ?auto_143898 ) ( not ( = ?auto_143901 ?auto_143897 ) ) ( not ( = ?auto_143901 ?auto_143899 ) ) ( not ( = ?auto_143897 ?auto_143899 ) ) ( not ( = ?auto_143894 ?auto_143897 ) ) ( not ( = ?auto_143894 ?auto_143901 ) ) ( not ( = ?auto_143895 ?auto_143897 ) ) ( not ( = ?auto_143895 ?auto_143901 ) ) ( not ( = ?auto_143896 ?auto_143897 ) ) ( not ( = ?auto_143896 ?auto_143901 ) ) ( not ( = ?auto_143898 ?auto_143897 ) ) ( not ( = ?auto_143898 ?auto_143901 ) ) ( not ( = ?auto_143900 ?auto_143897 ) ) ( not ( = ?auto_143900 ?auto_143901 ) ) ( ON ?auto_143899 ?auto_143900 ) ( ON ?auto_143897 ?auto_143899 ) ( HOLDING ?auto_143901 ) ( CLEAR ?auto_143897 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_143894 ?auto_143895 ?auto_143896 ?auto_143898 ?auto_143900 ?auto_143899 ?auto_143897 ?auto_143901 )
      ( MAKE-3PILE ?auto_143894 ?auto_143895 ?auto_143896 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143902 - BLOCK
      ?auto_143903 - BLOCK
      ?auto_143904 - BLOCK
    )
    :vars
    (
      ?auto_143905 - BLOCK
      ?auto_143909 - BLOCK
      ?auto_143907 - BLOCK
      ?auto_143908 - BLOCK
      ?auto_143906 - BLOCK
      ?auto_143910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143905 ?auto_143904 ) ( ON-TABLE ?auto_143902 ) ( ON ?auto_143903 ?auto_143902 ) ( ON ?auto_143904 ?auto_143903 ) ( not ( = ?auto_143902 ?auto_143903 ) ) ( not ( = ?auto_143902 ?auto_143904 ) ) ( not ( = ?auto_143902 ?auto_143905 ) ) ( not ( = ?auto_143903 ?auto_143904 ) ) ( not ( = ?auto_143903 ?auto_143905 ) ) ( not ( = ?auto_143904 ?auto_143905 ) ) ( not ( = ?auto_143902 ?auto_143909 ) ) ( not ( = ?auto_143902 ?auto_143907 ) ) ( not ( = ?auto_143903 ?auto_143909 ) ) ( not ( = ?auto_143903 ?auto_143907 ) ) ( not ( = ?auto_143904 ?auto_143909 ) ) ( not ( = ?auto_143904 ?auto_143907 ) ) ( not ( = ?auto_143905 ?auto_143909 ) ) ( not ( = ?auto_143905 ?auto_143907 ) ) ( not ( = ?auto_143909 ?auto_143907 ) ) ( ON ?auto_143909 ?auto_143905 ) ( not ( = ?auto_143908 ?auto_143906 ) ) ( not ( = ?auto_143908 ?auto_143907 ) ) ( not ( = ?auto_143906 ?auto_143907 ) ) ( not ( = ?auto_143902 ?auto_143906 ) ) ( not ( = ?auto_143902 ?auto_143908 ) ) ( not ( = ?auto_143903 ?auto_143906 ) ) ( not ( = ?auto_143903 ?auto_143908 ) ) ( not ( = ?auto_143904 ?auto_143906 ) ) ( not ( = ?auto_143904 ?auto_143908 ) ) ( not ( = ?auto_143905 ?auto_143906 ) ) ( not ( = ?auto_143905 ?auto_143908 ) ) ( not ( = ?auto_143909 ?auto_143906 ) ) ( not ( = ?auto_143909 ?auto_143908 ) ) ( ON ?auto_143907 ?auto_143909 ) ( ON ?auto_143906 ?auto_143907 ) ( CLEAR ?auto_143906 ) ( ON ?auto_143908 ?auto_143910 ) ( CLEAR ?auto_143908 ) ( HAND-EMPTY ) ( not ( = ?auto_143902 ?auto_143910 ) ) ( not ( = ?auto_143903 ?auto_143910 ) ) ( not ( = ?auto_143904 ?auto_143910 ) ) ( not ( = ?auto_143905 ?auto_143910 ) ) ( not ( = ?auto_143909 ?auto_143910 ) ) ( not ( = ?auto_143907 ?auto_143910 ) ) ( not ( = ?auto_143908 ?auto_143910 ) ) ( not ( = ?auto_143906 ?auto_143910 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143908 ?auto_143910 )
      ( MAKE-3PILE ?auto_143902 ?auto_143903 ?auto_143904 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143911 - BLOCK
      ?auto_143912 - BLOCK
      ?auto_143913 - BLOCK
    )
    :vars
    (
      ?auto_143915 - BLOCK
      ?auto_143917 - BLOCK
      ?auto_143916 - BLOCK
      ?auto_143918 - BLOCK
      ?auto_143914 - BLOCK
      ?auto_143919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143915 ?auto_143913 ) ( ON-TABLE ?auto_143911 ) ( ON ?auto_143912 ?auto_143911 ) ( ON ?auto_143913 ?auto_143912 ) ( not ( = ?auto_143911 ?auto_143912 ) ) ( not ( = ?auto_143911 ?auto_143913 ) ) ( not ( = ?auto_143911 ?auto_143915 ) ) ( not ( = ?auto_143912 ?auto_143913 ) ) ( not ( = ?auto_143912 ?auto_143915 ) ) ( not ( = ?auto_143913 ?auto_143915 ) ) ( not ( = ?auto_143911 ?auto_143917 ) ) ( not ( = ?auto_143911 ?auto_143916 ) ) ( not ( = ?auto_143912 ?auto_143917 ) ) ( not ( = ?auto_143912 ?auto_143916 ) ) ( not ( = ?auto_143913 ?auto_143917 ) ) ( not ( = ?auto_143913 ?auto_143916 ) ) ( not ( = ?auto_143915 ?auto_143917 ) ) ( not ( = ?auto_143915 ?auto_143916 ) ) ( not ( = ?auto_143917 ?auto_143916 ) ) ( ON ?auto_143917 ?auto_143915 ) ( not ( = ?auto_143918 ?auto_143914 ) ) ( not ( = ?auto_143918 ?auto_143916 ) ) ( not ( = ?auto_143914 ?auto_143916 ) ) ( not ( = ?auto_143911 ?auto_143914 ) ) ( not ( = ?auto_143911 ?auto_143918 ) ) ( not ( = ?auto_143912 ?auto_143914 ) ) ( not ( = ?auto_143912 ?auto_143918 ) ) ( not ( = ?auto_143913 ?auto_143914 ) ) ( not ( = ?auto_143913 ?auto_143918 ) ) ( not ( = ?auto_143915 ?auto_143914 ) ) ( not ( = ?auto_143915 ?auto_143918 ) ) ( not ( = ?auto_143917 ?auto_143914 ) ) ( not ( = ?auto_143917 ?auto_143918 ) ) ( ON ?auto_143916 ?auto_143917 ) ( ON ?auto_143918 ?auto_143919 ) ( CLEAR ?auto_143918 ) ( not ( = ?auto_143911 ?auto_143919 ) ) ( not ( = ?auto_143912 ?auto_143919 ) ) ( not ( = ?auto_143913 ?auto_143919 ) ) ( not ( = ?auto_143915 ?auto_143919 ) ) ( not ( = ?auto_143917 ?auto_143919 ) ) ( not ( = ?auto_143916 ?auto_143919 ) ) ( not ( = ?auto_143918 ?auto_143919 ) ) ( not ( = ?auto_143914 ?auto_143919 ) ) ( HOLDING ?auto_143914 ) ( CLEAR ?auto_143916 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_143911 ?auto_143912 ?auto_143913 ?auto_143915 ?auto_143917 ?auto_143916 ?auto_143914 )
      ( MAKE-3PILE ?auto_143911 ?auto_143912 ?auto_143913 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143920 - BLOCK
      ?auto_143921 - BLOCK
      ?auto_143922 - BLOCK
    )
    :vars
    (
      ?auto_143925 - BLOCK
      ?auto_143926 - BLOCK
      ?auto_143927 - BLOCK
      ?auto_143923 - BLOCK
      ?auto_143924 - BLOCK
      ?auto_143928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143925 ?auto_143922 ) ( ON-TABLE ?auto_143920 ) ( ON ?auto_143921 ?auto_143920 ) ( ON ?auto_143922 ?auto_143921 ) ( not ( = ?auto_143920 ?auto_143921 ) ) ( not ( = ?auto_143920 ?auto_143922 ) ) ( not ( = ?auto_143920 ?auto_143925 ) ) ( not ( = ?auto_143921 ?auto_143922 ) ) ( not ( = ?auto_143921 ?auto_143925 ) ) ( not ( = ?auto_143922 ?auto_143925 ) ) ( not ( = ?auto_143920 ?auto_143926 ) ) ( not ( = ?auto_143920 ?auto_143927 ) ) ( not ( = ?auto_143921 ?auto_143926 ) ) ( not ( = ?auto_143921 ?auto_143927 ) ) ( not ( = ?auto_143922 ?auto_143926 ) ) ( not ( = ?auto_143922 ?auto_143927 ) ) ( not ( = ?auto_143925 ?auto_143926 ) ) ( not ( = ?auto_143925 ?auto_143927 ) ) ( not ( = ?auto_143926 ?auto_143927 ) ) ( ON ?auto_143926 ?auto_143925 ) ( not ( = ?auto_143923 ?auto_143924 ) ) ( not ( = ?auto_143923 ?auto_143927 ) ) ( not ( = ?auto_143924 ?auto_143927 ) ) ( not ( = ?auto_143920 ?auto_143924 ) ) ( not ( = ?auto_143920 ?auto_143923 ) ) ( not ( = ?auto_143921 ?auto_143924 ) ) ( not ( = ?auto_143921 ?auto_143923 ) ) ( not ( = ?auto_143922 ?auto_143924 ) ) ( not ( = ?auto_143922 ?auto_143923 ) ) ( not ( = ?auto_143925 ?auto_143924 ) ) ( not ( = ?auto_143925 ?auto_143923 ) ) ( not ( = ?auto_143926 ?auto_143924 ) ) ( not ( = ?auto_143926 ?auto_143923 ) ) ( ON ?auto_143927 ?auto_143926 ) ( ON ?auto_143923 ?auto_143928 ) ( not ( = ?auto_143920 ?auto_143928 ) ) ( not ( = ?auto_143921 ?auto_143928 ) ) ( not ( = ?auto_143922 ?auto_143928 ) ) ( not ( = ?auto_143925 ?auto_143928 ) ) ( not ( = ?auto_143926 ?auto_143928 ) ) ( not ( = ?auto_143927 ?auto_143928 ) ) ( not ( = ?auto_143923 ?auto_143928 ) ) ( not ( = ?auto_143924 ?auto_143928 ) ) ( CLEAR ?auto_143927 ) ( ON ?auto_143924 ?auto_143923 ) ( CLEAR ?auto_143924 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_143928 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143928 ?auto_143923 )
      ( MAKE-3PILE ?auto_143920 ?auto_143921 ?auto_143922 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143929 - BLOCK
      ?auto_143930 - BLOCK
      ?auto_143931 - BLOCK
    )
    :vars
    (
      ?auto_143933 - BLOCK
      ?auto_143934 - BLOCK
      ?auto_143937 - BLOCK
      ?auto_143935 - BLOCK
      ?auto_143932 - BLOCK
      ?auto_143936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143933 ?auto_143931 ) ( ON-TABLE ?auto_143929 ) ( ON ?auto_143930 ?auto_143929 ) ( ON ?auto_143931 ?auto_143930 ) ( not ( = ?auto_143929 ?auto_143930 ) ) ( not ( = ?auto_143929 ?auto_143931 ) ) ( not ( = ?auto_143929 ?auto_143933 ) ) ( not ( = ?auto_143930 ?auto_143931 ) ) ( not ( = ?auto_143930 ?auto_143933 ) ) ( not ( = ?auto_143931 ?auto_143933 ) ) ( not ( = ?auto_143929 ?auto_143934 ) ) ( not ( = ?auto_143929 ?auto_143937 ) ) ( not ( = ?auto_143930 ?auto_143934 ) ) ( not ( = ?auto_143930 ?auto_143937 ) ) ( not ( = ?auto_143931 ?auto_143934 ) ) ( not ( = ?auto_143931 ?auto_143937 ) ) ( not ( = ?auto_143933 ?auto_143934 ) ) ( not ( = ?auto_143933 ?auto_143937 ) ) ( not ( = ?auto_143934 ?auto_143937 ) ) ( ON ?auto_143934 ?auto_143933 ) ( not ( = ?auto_143935 ?auto_143932 ) ) ( not ( = ?auto_143935 ?auto_143937 ) ) ( not ( = ?auto_143932 ?auto_143937 ) ) ( not ( = ?auto_143929 ?auto_143932 ) ) ( not ( = ?auto_143929 ?auto_143935 ) ) ( not ( = ?auto_143930 ?auto_143932 ) ) ( not ( = ?auto_143930 ?auto_143935 ) ) ( not ( = ?auto_143931 ?auto_143932 ) ) ( not ( = ?auto_143931 ?auto_143935 ) ) ( not ( = ?auto_143933 ?auto_143932 ) ) ( not ( = ?auto_143933 ?auto_143935 ) ) ( not ( = ?auto_143934 ?auto_143932 ) ) ( not ( = ?auto_143934 ?auto_143935 ) ) ( ON ?auto_143935 ?auto_143936 ) ( not ( = ?auto_143929 ?auto_143936 ) ) ( not ( = ?auto_143930 ?auto_143936 ) ) ( not ( = ?auto_143931 ?auto_143936 ) ) ( not ( = ?auto_143933 ?auto_143936 ) ) ( not ( = ?auto_143934 ?auto_143936 ) ) ( not ( = ?auto_143937 ?auto_143936 ) ) ( not ( = ?auto_143935 ?auto_143936 ) ) ( not ( = ?auto_143932 ?auto_143936 ) ) ( ON ?auto_143932 ?auto_143935 ) ( CLEAR ?auto_143932 ) ( ON-TABLE ?auto_143936 ) ( HOLDING ?auto_143937 ) ( CLEAR ?auto_143934 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_143929 ?auto_143930 ?auto_143931 ?auto_143933 ?auto_143934 ?auto_143937 )
      ( MAKE-3PILE ?auto_143929 ?auto_143930 ?auto_143931 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143938 - BLOCK
      ?auto_143939 - BLOCK
      ?auto_143940 - BLOCK
    )
    :vars
    (
      ?auto_143945 - BLOCK
      ?auto_143942 - BLOCK
      ?auto_143944 - BLOCK
      ?auto_143946 - BLOCK
      ?auto_143943 - BLOCK
      ?auto_143941 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143945 ?auto_143940 ) ( ON-TABLE ?auto_143938 ) ( ON ?auto_143939 ?auto_143938 ) ( ON ?auto_143940 ?auto_143939 ) ( not ( = ?auto_143938 ?auto_143939 ) ) ( not ( = ?auto_143938 ?auto_143940 ) ) ( not ( = ?auto_143938 ?auto_143945 ) ) ( not ( = ?auto_143939 ?auto_143940 ) ) ( not ( = ?auto_143939 ?auto_143945 ) ) ( not ( = ?auto_143940 ?auto_143945 ) ) ( not ( = ?auto_143938 ?auto_143942 ) ) ( not ( = ?auto_143938 ?auto_143944 ) ) ( not ( = ?auto_143939 ?auto_143942 ) ) ( not ( = ?auto_143939 ?auto_143944 ) ) ( not ( = ?auto_143940 ?auto_143942 ) ) ( not ( = ?auto_143940 ?auto_143944 ) ) ( not ( = ?auto_143945 ?auto_143942 ) ) ( not ( = ?auto_143945 ?auto_143944 ) ) ( not ( = ?auto_143942 ?auto_143944 ) ) ( ON ?auto_143942 ?auto_143945 ) ( not ( = ?auto_143946 ?auto_143943 ) ) ( not ( = ?auto_143946 ?auto_143944 ) ) ( not ( = ?auto_143943 ?auto_143944 ) ) ( not ( = ?auto_143938 ?auto_143943 ) ) ( not ( = ?auto_143938 ?auto_143946 ) ) ( not ( = ?auto_143939 ?auto_143943 ) ) ( not ( = ?auto_143939 ?auto_143946 ) ) ( not ( = ?auto_143940 ?auto_143943 ) ) ( not ( = ?auto_143940 ?auto_143946 ) ) ( not ( = ?auto_143945 ?auto_143943 ) ) ( not ( = ?auto_143945 ?auto_143946 ) ) ( not ( = ?auto_143942 ?auto_143943 ) ) ( not ( = ?auto_143942 ?auto_143946 ) ) ( ON ?auto_143946 ?auto_143941 ) ( not ( = ?auto_143938 ?auto_143941 ) ) ( not ( = ?auto_143939 ?auto_143941 ) ) ( not ( = ?auto_143940 ?auto_143941 ) ) ( not ( = ?auto_143945 ?auto_143941 ) ) ( not ( = ?auto_143942 ?auto_143941 ) ) ( not ( = ?auto_143944 ?auto_143941 ) ) ( not ( = ?auto_143946 ?auto_143941 ) ) ( not ( = ?auto_143943 ?auto_143941 ) ) ( ON ?auto_143943 ?auto_143946 ) ( ON-TABLE ?auto_143941 ) ( CLEAR ?auto_143942 ) ( ON ?auto_143944 ?auto_143943 ) ( CLEAR ?auto_143944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_143941 ?auto_143946 ?auto_143943 )
      ( MAKE-3PILE ?auto_143938 ?auto_143939 ?auto_143940 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143947 - BLOCK
      ?auto_143948 - BLOCK
      ?auto_143949 - BLOCK
    )
    :vars
    (
      ?auto_143952 - BLOCK
      ?auto_143951 - BLOCK
      ?auto_143950 - BLOCK
      ?auto_143954 - BLOCK
      ?auto_143953 - BLOCK
      ?auto_143955 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143952 ?auto_143949 ) ( ON-TABLE ?auto_143947 ) ( ON ?auto_143948 ?auto_143947 ) ( ON ?auto_143949 ?auto_143948 ) ( not ( = ?auto_143947 ?auto_143948 ) ) ( not ( = ?auto_143947 ?auto_143949 ) ) ( not ( = ?auto_143947 ?auto_143952 ) ) ( not ( = ?auto_143948 ?auto_143949 ) ) ( not ( = ?auto_143948 ?auto_143952 ) ) ( not ( = ?auto_143949 ?auto_143952 ) ) ( not ( = ?auto_143947 ?auto_143951 ) ) ( not ( = ?auto_143947 ?auto_143950 ) ) ( not ( = ?auto_143948 ?auto_143951 ) ) ( not ( = ?auto_143948 ?auto_143950 ) ) ( not ( = ?auto_143949 ?auto_143951 ) ) ( not ( = ?auto_143949 ?auto_143950 ) ) ( not ( = ?auto_143952 ?auto_143951 ) ) ( not ( = ?auto_143952 ?auto_143950 ) ) ( not ( = ?auto_143951 ?auto_143950 ) ) ( not ( = ?auto_143954 ?auto_143953 ) ) ( not ( = ?auto_143954 ?auto_143950 ) ) ( not ( = ?auto_143953 ?auto_143950 ) ) ( not ( = ?auto_143947 ?auto_143953 ) ) ( not ( = ?auto_143947 ?auto_143954 ) ) ( not ( = ?auto_143948 ?auto_143953 ) ) ( not ( = ?auto_143948 ?auto_143954 ) ) ( not ( = ?auto_143949 ?auto_143953 ) ) ( not ( = ?auto_143949 ?auto_143954 ) ) ( not ( = ?auto_143952 ?auto_143953 ) ) ( not ( = ?auto_143952 ?auto_143954 ) ) ( not ( = ?auto_143951 ?auto_143953 ) ) ( not ( = ?auto_143951 ?auto_143954 ) ) ( ON ?auto_143954 ?auto_143955 ) ( not ( = ?auto_143947 ?auto_143955 ) ) ( not ( = ?auto_143948 ?auto_143955 ) ) ( not ( = ?auto_143949 ?auto_143955 ) ) ( not ( = ?auto_143952 ?auto_143955 ) ) ( not ( = ?auto_143951 ?auto_143955 ) ) ( not ( = ?auto_143950 ?auto_143955 ) ) ( not ( = ?auto_143954 ?auto_143955 ) ) ( not ( = ?auto_143953 ?auto_143955 ) ) ( ON ?auto_143953 ?auto_143954 ) ( ON-TABLE ?auto_143955 ) ( ON ?auto_143950 ?auto_143953 ) ( CLEAR ?auto_143950 ) ( HOLDING ?auto_143951 ) ( CLEAR ?auto_143952 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_143947 ?auto_143948 ?auto_143949 ?auto_143952 ?auto_143951 )
      ( MAKE-3PILE ?auto_143947 ?auto_143948 ?auto_143949 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143956 - BLOCK
      ?auto_143957 - BLOCK
      ?auto_143958 - BLOCK
    )
    :vars
    (
      ?auto_143961 - BLOCK
      ?auto_143962 - BLOCK
      ?auto_143959 - BLOCK
      ?auto_143963 - BLOCK
      ?auto_143960 - BLOCK
      ?auto_143964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143961 ?auto_143958 ) ( ON-TABLE ?auto_143956 ) ( ON ?auto_143957 ?auto_143956 ) ( ON ?auto_143958 ?auto_143957 ) ( not ( = ?auto_143956 ?auto_143957 ) ) ( not ( = ?auto_143956 ?auto_143958 ) ) ( not ( = ?auto_143956 ?auto_143961 ) ) ( not ( = ?auto_143957 ?auto_143958 ) ) ( not ( = ?auto_143957 ?auto_143961 ) ) ( not ( = ?auto_143958 ?auto_143961 ) ) ( not ( = ?auto_143956 ?auto_143962 ) ) ( not ( = ?auto_143956 ?auto_143959 ) ) ( not ( = ?auto_143957 ?auto_143962 ) ) ( not ( = ?auto_143957 ?auto_143959 ) ) ( not ( = ?auto_143958 ?auto_143962 ) ) ( not ( = ?auto_143958 ?auto_143959 ) ) ( not ( = ?auto_143961 ?auto_143962 ) ) ( not ( = ?auto_143961 ?auto_143959 ) ) ( not ( = ?auto_143962 ?auto_143959 ) ) ( not ( = ?auto_143963 ?auto_143960 ) ) ( not ( = ?auto_143963 ?auto_143959 ) ) ( not ( = ?auto_143960 ?auto_143959 ) ) ( not ( = ?auto_143956 ?auto_143960 ) ) ( not ( = ?auto_143956 ?auto_143963 ) ) ( not ( = ?auto_143957 ?auto_143960 ) ) ( not ( = ?auto_143957 ?auto_143963 ) ) ( not ( = ?auto_143958 ?auto_143960 ) ) ( not ( = ?auto_143958 ?auto_143963 ) ) ( not ( = ?auto_143961 ?auto_143960 ) ) ( not ( = ?auto_143961 ?auto_143963 ) ) ( not ( = ?auto_143962 ?auto_143960 ) ) ( not ( = ?auto_143962 ?auto_143963 ) ) ( ON ?auto_143963 ?auto_143964 ) ( not ( = ?auto_143956 ?auto_143964 ) ) ( not ( = ?auto_143957 ?auto_143964 ) ) ( not ( = ?auto_143958 ?auto_143964 ) ) ( not ( = ?auto_143961 ?auto_143964 ) ) ( not ( = ?auto_143962 ?auto_143964 ) ) ( not ( = ?auto_143959 ?auto_143964 ) ) ( not ( = ?auto_143963 ?auto_143964 ) ) ( not ( = ?auto_143960 ?auto_143964 ) ) ( ON ?auto_143960 ?auto_143963 ) ( ON-TABLE ?auto_143964 ) ( ON ?auto_143959 ?auto_143960 ) ( CLEAR ?auto_143961 ) ( ON ?auto_143962 ?auto_143959 ) ( CLEAR ?auto_143962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_143964 ?auto_143963 ?auto_143960 ?auto_143959 )
      ( MAKE-3PILE ?auto_143956 ?auto_143957 ?auto_143958 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143983 - BLOCK
      ?auto_143984 - BLOCK
      ?auto_143985 - BLOCK
    )
    :vars
    (
      ?auto_143991 - BLOCK
      ?auto_143989 - BLOCK
      ?auto_143987 - BLOCK
      ?auto_143988 - BLOCK
      ?auto_143990 - BLOCK
      ?auto_143986 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143983 ) ( ON ?auto_143984 ?auto_143983 ) ( not ( = ?auto_143983 ?auto_143984 ) ) ( not ( = ?auto_143983 ?auto_143985 ) ) ( not ( = ?auto_143983 ?auto_143991 ) ) ( not ( = ?auto_143984 ?auto_143985 ) ) ( not ( = ?auto_143984 ?auto_143991 ) ) ( not ( = ?auto_143985 ?auto_143991 ) ) ( not ( = ?auto_143983 ?auto_143989 ) ) ( not ( = ?auto_143983 ?auto_143987 ) ) ( not ( = ?auto_143984 ?auto_143989 ) ) ( not ( = ?auto_143984 ?auto_143987 ) ) ( not ( = ?auto_143985 ?auto_143989 ) ) ( not ( = ?auto_143985 ?auto_143987 ) ) ( not ( = ?auto_143991 ?auto_143989 ) ) ( not ( = ?auto_143991 ?auto_143987 ) ) ( not ( = ?auto_143989 ?auto_143987 ) ) ( not ( = ?auto_143988 ?auto_143990 ) ) ( not ( = ?auto_143988 ?auto_143987 ) ) ( not ( = ?auto_143990 ?auto_143987 ) ) ( not ( = ?auto_143983 ?auto_143990 ) ) ( not ( = ?auto_143983 ?auto_143988 ) ) ( not ( = ?auto_143984 ?auto_143990 ) ) ( not ( = ?auto_143984 ?auto_143988 ) ) ( not ( = ?auto_143985 ?auto_143990 ) ) ( not ( = ?auto_143985 ?auto_143988 ) ) ( not ( = ?auto_143991 ?auto_143990 ) ) ( not ( = ?auto_143991 ?auto_143988 ) ) ( not ( = ?auto_143989 ?auto_143990 ) ) ( not ( = ?auto_143989 ?auto_143988 ) ) ( ON ?auto_143988 ?auto_143986 ) ( not ( = ?auto_143983 ?auto_143986 ) ) ( not ( = ?auto_143984 ?auto_143986 ) ) ( not ( = ?auto_143985 ?auto_143986 ) ) ( not ( = ?auto_143991 ?auto_143986 ) ) ( not ( = ?auto_143989 ?auto_143986 ) ) ( not ( = ?auto_143987 ?auto_143986 ) ) ( not ( = ?auto_143988 ?auto_143986 ) ) ( not ( = ?auto_143990 ?auto_143986 ) ) ( ON ?auto_143990 ?auto_143988 ) ( ON-TABLE ?auto_143986 ) ( ON ?auto_143987 ?auto_143990 ) ( ON ?auto_143989 ?auto_143987 ) ( ON ?auto_143991 ?auto_143989 ) ( CLEAR ?auto_143991 ) ( HOLDING ?auto_143985 ) ( CLEAR ?auto_143984 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_143983 ?auto_143984 ?auto_143985 ?auto_143991 )
      ( MAKE-3PILE ?auto_143983 ?auto_143984 ?auto_143985 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143992 - BLOCK
      ?auto_143993 - BLOCK
      ?auto_143994 - BLOCK
    )
    :vars
    (
      ?auto_143997 - BLOCK
      ?auto_143998 - BLOCK
      ?auto_143999 - BLOCK
      ?auto_144000 - BLOCK
      ?auto_143995 - BLOCK
      ?auto_143996 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_143992 ) ( ON ?auto_143993 ?auto_143992 ) ( not ( = ?auto_143992 ?auto_143993 ) ) ( not ( = ?auto_143992 ?auto_143994 ) ) ( not ( = ?auto_143992 ?auto_143997 ) ) ( not ( = ?auto_143993 ?auto_143994 ) ) ( not ( = ?auto_143993 ?auto_143997 ) ) ( not ( = ?auto_143994 ?auto_143997 ) ) ( not ( = ?auto_143992 ?auto_143998 ) ) ( not ( = ?auto_143992 ?auto_143999 ) ) ( not ( = ?auto_143993 ?auto_143998 ) ) ( not ( = ?auto_143993 ?auto_143999 ) ) ( not ( = ?auto_143994 ?auto_143998 ) ) ( not ( = ?auto_143994 ?auto_143999 ) ) ( not ( = ?auto_143997 ?auto_143998 ) ) ( not ( = ?auto_143997 ?auto_143999 ) ) ( not ( = ?auto_143998 ?auto_143999 ) ) ( not ( = ?auto_144000 ?auto_143995 ) ) ( not ( = ?auto_144000 ?auto_143999 ) ) ( not ( = ?auto_143995 ?auto_143999 ) ) ( not ( = ?auto_143992 ?auto_143995 ) ) ( not ( = ?auto_143992 ?auto_144000 ) ) ( not ( = ?auto_143993 ?auto_143995 ) ) ( not ( = ?auto_143993 ?auto_144000 ) ) ( not ( = ?auto_143994 ?auto_143995 ) ) ( not ( = ?auto_143994 ?auto_144000 ) ) ( not ( = ?auto_143997 ?auto_143995 ) ) ( not ( = ?auto_143997 ?auto_144000 ) ) ( not ( = ?auto_143998 ?auto_143995 ) ) ( not ( = ?auto_143998 ?auto_144000 ) ) ( ON ?auto_144000 ?auto_143996 ) ( not ( = ?auto_143992 ?auto_143996 ) ) ( not ( = ?auto_143993 ?auto_143996 ) ) ( not ( = ?auto_143994 ?auto_143996 ) ) ( not ( = ?auto_143997 ?auto_143996 ) ) ( not ( = ?auto_143998 ?auto_143996 ) ) ( not ( = ?auto_143999 ?auto_143996 ) ) ( not ( = ?auto_144000 ?auto_143996 ) ) ( not ( = ?auto_143995 ?auto_143996 ) ) ( ON ?auto_143995 ?auto_144000 ) ( ON-TABLE ?auto_143996 ) ( ON ?auto_143999 ?auto_143995 ) ( ON ?auto_143998 ?auto_143999 ) ( ON ?auto_143997 ?auto_143998 ) ( CLEAR ?auto_143993 ) ( ON ?auto_143994 ?auto_143997 ) ( CLEAR ?auto_143994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_143996 ?auto_144000 ?auto_143995 ?auto_143999 ?auto_143998 ?auto_143997 )
      ( MAKE-3PILE ?auto_143992 ?auto_143993 ?auto_143994 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_144001 - BLOCK
      ?auto_144002 - BLOCK
      ?auto_144003 - BLOCK
    )
    :vars
    (
      ?auto_144009 - BLOCK
      ?auto_144004 - BLOCK
      ?auto_144008 - BLOCK
      ?auto_144005 - BLOCK
      ?auto_144007 - BLOCK
      ?auto_144006 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_144001 ) ( not ( = ?auto_144001 ?auto_144002 ) ) ( not ( = ?auto_144001 ?auto_144003 ) ) ( not ( = ?auto_144001 ?auto_144009 ) ) ( not ( = ?auto_144002 ?auto_144003 ) ) ( not ( = ?auto_144002 ?auto_144009 ) ) ( not ( = ?auto_144003 ?auto_144009 ) ) ( not ( = ?auto_144001 ?auto_144004 ) ) ( not ( = ?auto_144001 ?auto_144008 ) ) ( not ( = ?auto_144002 ?auto_144004 ) ) ( not ( = ?auto_144002 ?auto_144008 ) ) ( not ( = ?auto_144003 ?auto_144004 ) ) ( not ( = ?auto_144003 ?auto_144008 ) ) ( not ( = ?auto_144009 ?auto_144004 ) ) ( not ( = ?auto_144009 ?auto_144008 ) ) ( not ( = ?auto_144004 ?auto_144008 ) ) ( not ( = ?auto_144005 ?auto_144007 ) ) ( not ( = ?auto_144005 ?auto_144008 ) ) ( not ( = ?auto_144007 ?auto_144008 ) ) ( not ( = ?auto_144001 ?auto_144007 ) ) ( not ( = ?auto_144001 ?auto_144005 ) ) ( not ( = ?auto_144002 ?auto_144007 ) ) ( not ( = ?auto_144002 ?auto_144005 ) ) ( not ( = ?auto_144003 ?auto_144007 ) ) ( not ( = ?auto_144003 ?auto_144005 ) ) ( not ( = ?auto_144009 ?auto_144007 ) ) ( not ( = ?auto_144009 ?auto_144005 ) ) ( not ( = ?auto_144004 ?auto_144007 ) ) ( not ( = ?auto_144004 ?auto_144005 ) ) ( ON ?auto_144005 ?auto_144006 ) ( not ( = ?auto_144001 ?auto_144006 ) ) ( not ( = ?auto_144002 ?auto_144006 ) ) ( not ( = ?auto_144003 ?auto_144006 ) ) ( not ( = ?auto_144009 ?auto_144006 ) ) ( not ( = ?auto_144004 ?auto_144006 ) ) ( not ( = ?auto_144008 ?auto_144006 ) ) ( not ( = ?auto_144005 ?auto_144006 ) ) ( not ( = ?auto_144007 ?auto_144006 ) ) ( ON ?auto_144007 ?auto_144005 ) ( ON-TABLE ?auto_144006 ) ( ON ?auto_144008 ?auto_144007 ) ( ON ?auto_144004 ?auto_144008 ) ( ON ?auto_144009 ?auto_144004 ) ( ON ?auto_144003 ?auto_144009 ) ( CLEAR ?auto_144003 ) ( HOLDING ?auto_144002 ) ( CLEAR ?auto_144001 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_144001 ?auto_144002 )
      ( MAKE-3PILE ?auto_144001 ?auto_144002 ?auto_144003 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_144010 - BLOCK
      ?auto_144011 - BLOCK
      ?auto_144012 - BLOCK
    )
    :vars
    (
      ?auto_144015 - BLOCK
      ?auto_144018 - BLOCK
      ?auto_144014 - BLOCK
      ?auto_144017 - BLOCK
      ?auto_144016 - BLOCK
      ?auto_144013 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_144010 ) ( not ( = ?auto_144010 ?auto_144011 ) ) ( not ( = ?auto_144010 ?auto_144012 ) ) ( not ( = ?auto_144010 ?auto_144015 ) ) ( not ( = ?auto_144011 ?auto_144012 ) ) ( not ( = ?auto_144011 ?auto_144015 ) ) ( not ( = ?auto_144012 ?auto_144015 ) ) ( not ( = ?auto_144010 ?auto_144018 ) ) ( not ( = ?auto_144010 ?auto_144014 ) ) ( not ( = ?auto_144011 ?auto_144018 ) ) ( not ( = ?auto_144011 ?auto_144014 ) ) ( not ( = ?auto_144012 ?auto_144018 ) ) ( not ( = ?auto_144012 ?auto_144014 ) ) ( not ( = ?auto_144015 ?auto_144018 ) ) ( not ( = ?auto_144015 ?auto_144014 ) ) ( not ( = ?auto_144018 ?auto_144014 ) ) ( not ( = ?auto_144017 ?auto_144016 ) ) ( not ( = ?auto_144017 ?auto_144014 ) ) ( not ( = ?auto_144016 ?auto_144014 ) ) ( not ( = ?auto_144010 ?auto_144016 ) ) ( not ( = ?auto_144010 ?auto_144017 ) ) ( not ( = ?auto_144011 ?auto_144016 ) ) ( not ( = ?auto_144011 ?auto_144017 ) ) ( not ( = ?auto_144012 ?auto_144016 ) ) ( not ( = ?auto_144012 ?auto_144017 ) ) ( not ( = ?auto_144015 ?auto_144016 ) ) ( not ( = ?auto_144015 ?auto_144017 ) ) ( not ( = ?auto_144018 ?auto_144016 ) ) ( not ( = ?auto_144018 ?auto_144017 ) ) ( ON ?auto_144017 ?auto_144013 ) ( not ( = ?auto_144010 ?auto_144013 ) ) ( not ( = ?auto_144011 ?auto_144013 ) ) ( not ( = ?auto_144012 ?auto_144013 ) ) ( not ( = ?auto_144015 ?auto_144013 ) ) ( not ( = ?auto_144018 ?auto_144013 ) ) ( not ( = ?auto_144014 ?auto_144013 ) ) ( not ( = ?auto_144017 ?auto_144013 ) ) ( not ( = ?auto_144016 ?auto_144013 ) ) ( ON ?auto_144016 ?auto_144017 ) ( ON-TABLE ?auto_144013 ) ( ON ?auto_144014 ?auto_144016 ) ( ON ?auto_144018 ?auto_144014 ) ( ON ?auto_144015 ?auto_144018 ) ( ON ?auto_144012 ?auto_144015 ) ( CLEAR ?auto_144010 ) ( ON ?auto_144011 ?auto_144012 ) ( CLEAR ?auto_144011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_144013 ?auto_144017 ?auto_144016 ?auto_144014 ?auto_144018 ?auto_144015 ?auto_144012 )
      ( MAKE-3PILE ?auto_144010 ?auto_144011 ?auto_144012 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_144019 - BLOCK
      ?auto_144020 - BLOCK
      ?auto_144021 - BLOCK
    )
    :vars
    (
      ?auto_144026 - BLOCK
      ?auto_144027 - BLOCK
      ?auto_144025 - BLOCK
      ?auto_144024 - BLOCK
      ?auto_144023 - BLOCK
      ?auto_144022 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144019 ?auto_144020 ) ) ( not ( = ?auto_144019 ?auto_144021 ) ) ( not ( = ?auto_144019 ?auto_144026 ) ) ( not ( = ?auto_144020 ?auto_144021 ) ) ( not ( = ?auto_144020 ?auto_144026 ) ) ( not ( = ?auto_144021 ?auto_144026 ) ) ( not ( = ?auto_144019 ?auto_144027 ) ) ( not ( = ?auto_144019 ?auto_144025 ) ) ( not ( = ?auto_144020 ?auto_144027 ) ) ( not ( = ?auto_144020 ?auto_144025 ) ) ( not ( = ?auto_144021 ?auto_144027 ) ) ( not ( = ?auto_144021 ?auto_144025 ) ) ( not ( = ?auto_144026 ?auto_144027 ) ) ( not ( = ?auto_144026 ?auto_144025 ) ) ( not ( = ?auto_144027 ?auto_144025 ) ) ( not ( = ?auto_144024 ?auto_144023 ) ) ( not ( = ?auto_144024 ?auto_144025 ) ) ( not ( = ?auto_144023 ?auto_144025 ) ) ( not ( = ?auto_144019 ?auto_144023 ) ) ( not ( = ?auto_144019 ?auto_144024 ) ) ( not ( = ?auto_144020 ?auto_144023 ) ) ( not ( = ?auto_144020 ?auto_144024 ) ) ( not ( = ?auto_144021 ?auto_144023 ) ) ( not ( = ?auto_144021 ?auto_144024 ) ) ( not ( = ?auto_144026 ?auto_144023 ) ) ( not ( = ?auto_144026 ?auto_144024 ) ) ( not ( = ?auto_144027 ?auto_144023 ) ) ( not ( = ?auto_144027 ?auto_144024 ) ) ( ON ?auto_144024 ?auto_144022 ) ( not ( = ?auto_144019 ?auto_144022 ) ) ( not ( = ?auto_144020 ?auto_144022 ) ) ( not ( = ?auto_144021 ?auto_144022 ) ) ( not ( = ?auto_144026 ?auto_144022 ) ) ( not ( = ?auto_144027 ?auto_144022 ) ) ( not ( = ?auto_144025 ?auto_144022 ) ) ( not ( = ?auto_144024 ?auto_144022 ) ) ( not ( = ?auto_144023 ?auto_144022 ) ) ( ON ?auto_144023 ?auto_144024 ) ( ON-TABLE ?auto_144022 ) ( ON ?auto_144025 ?auto_144023 ) ( ON ?auto_144027 ?auto_144025 ) ( ON ?auto_144026 ?auto_144027 ) ( ON ?auto_144021 ?auto_144026 ) ( ON ?auto_144020 ?auto_144021 ) ( CLEAR ?auto_144020 ) ( HOLDING ?auto_144019 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_144019 )
      ( MAKE-3PILE ?auto_144019 ?auto_144020 ?auto_144021 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_144028 - BLOCK
      ?auto_144029 - BLOCK
      ?auto_144030 - BLOCK
    )
    :vars
    (
      ?auto_144033 - BLOCK
      ?auto_144036 - BLOCK
      ?auto_144032 - BLOCK
      ?auto_144031 - BLOCK
      ?auto_144034 - BLOCK
      ?auto_144035 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144028 ?auto_144029 ) ) ( not ( = ?auto_144028 ?auto_144030 ) ) ( not ( = ?auto_144028 ?auto_144033 ) ) ( not ( = ?auto_144029 ?auto_144030 ) ) ( not ( = ?auto_144029 ?auto_144033 ) ) ( not ( = ?auto_144030 ?auto_144033 ) ) ( not ( = ?auto_144028 ?auto_144036 ) ) ( not ( = ?auto_144028 ?auto_144032 ) ) ( not ( = ?auto_144029 ?auto_144036 ) ) ( not ( = ?auto_144029 ?auto_144032 ) ) ( not ( = ?auto_144030 ?auto_144036 ) ) ( not ( = ?auto_144030 ?auto_144032 ) ) ( not ( = ?auto_144033 ?auto_144036 ) ) ( not ( = ?auto_144033 ?auto_144032 ) ) ( not ( = ?auto_144036 ?auto_144032 ) ) ( not ( = ?auto_144031 ?auto_144034 ) ) ( not ( = ?auto_144031 ?auto_144032 ) ) ( not ( = ?auto_144034 ?auto_144032 ) ) ( not ( = ?auto_144028 ?auto_144034 ) ) ( not ( = ?auto_144028 ?auto_144031 ) ) ( not ( = ?auto_144029 ?auto_144034 ) ) ( not ( = ?auto_144029 ?auto_144031 ) ) ( not ( = ?auto_144030 ?auto_144034 ) ) ( not ( = ?auto_144030 ?auto_144031 ) ) ( not ( = ?auto_144033 ?auto_144034 ) ) ( not ( = ?auto_144033 ?auto_144031 ) ) ( not ( = ?auto_144036 ?auto_144034 ) ) ( not ( = ?auto_144036 ?auto_144031 ) ) ( ON ?auto_144031 ?auto_144035 ) ( not ( = ?auto_144028 ?auto_144035 ) ) ( not ( = ?auto_144029 ?auto_144035 ) ) ( not ( = ?auto_144030 ?auto_144035 ) ) ( not ( = ?auto_144033 ?auto_144035 ) ) ( not ( = ?auto_144036 ?auto_144035 ) ) ( not ( = ?auto_144032 ?auto_144035 ) ) ( not ( = ?auto_144031 ?auto_144035 ) ) ( not ( = ?auto_144034 ?auto_144035 ) ) ( ON ?auto_144034 ?auto_144031 ) ( ON-TABLE ?auto_144035 ) ( ON ?auto_144032 ?auto_144034 ) ( ON ?auto_144036 ?auto_144032 ) ( ON ?auto_144033 ?auto_144036 ) ( ON ?auto_144030 ?auto_144033 ) ( ON ?auto_144029 ?auto_144030 ) ( ON ?auto_144028 ?auto_144029 ) ( CLEAR ?auto_144028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_144035 ?auto_144031 ?auto_144034 ?auto_144032 ?auto_144036 ?auto_144033 ?auto_144030 ?auto_144029 )
      ( MAKE-3PILE ?auto_144028 ?auto_144029 ?auto_144030 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_144042 - BLOCK
      ?auto_144043 - BLOCK
      ?auto_144044 - BLOCK
      ?auto_144045 - BLOCK
      ?auto_144046 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_144046 ) ( CLEAR ?auto_144045 ) ( ON-TABLE ?auto_144042 ) ( ON ?auto_144043 ?auto_144042 ) ( ON ?auto_144044 ?auto_144043 ) ( ON ?auto_144045 ?auto_144044 ) ( not ( = ?auto_144042 ?auto_144043 ) ) ( not ( = ?auto_144042 ?auto_144044 ) ) ( not ( = ?auto_144042 ?auto_144045 ) ) ( not ( = ?auto_144042 ?auto_144046 ) ) ( not ( = ?auto_144043 ?auto_144044 ) ) ( not ( = ?auto_144043 ?auto_144045 ) ) ( not ( = ?auto_144043 ?auto_144046 ) ) ( not ( = ?auto_144044 ?auto_144045 ) ) ( not ( = ?auto_144044 ?auto_144046 ) ) ( not ( = ?auto_144045 ?auto_144046 ) ) )
    :subtasks
    ( ( !STACK ?auto_144046 ?auto_144045 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_144047 - BLOCK
      ?auto_144048 - BLOCK
      ?auto_144049 - BLOCK
      ?auto_144050 - BLOCK
      ?auto_144051 - BLOCK
    )
    :vars
    (
      ?auto_144052 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_144050 ) ( ON-TABLE ?auto_144047 ) ( ON ?auto_144048 ?auto_144047 ) ( ON ?auto_144049 ?auto_144048 ) ( ON ?auto_144050 ?auto_144049 ) ( not ( = ?auto_144047 ?auto_144048 ) ) ( not ( = ?auto_144047 ?auto_144049 ) ) ( not ( = ?auto_144047 ?auto_144050 ) ) ( not ( = ?auto_144047 ?auto_144051 ) ) ( not ( = ?auto_144048 ?auto_144049 ) ) ( not ( = ?auto_144048 ?auto_144050 ) ) ( not ( = ?auto_144048 ?auto_144051 ) ) ( not ( = ?auto_144049 ?auto_144050 ) ) ( not ( = ?auto_144049 ?auto_144051 ) ) ( not ( = ?auto_144050 ?auto_144051 ) ) ( ON ?auto_144051 ?auto_144052 ) ( CLEAR ?auto_144051 ) ( HAND-EMPTY ) ( not ( = ?auto_144047 ?auto_144052 ) ) ( not ( = ?auto_144048 ?auto_144052 ) ) ( not ( = ?auto_144049 ?auto_144052 ) ) ( not ( = ?auto_144050 ?auto_144052 ) ) ( not ( = ?auto_144051 ?auto_144052 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_144051 ?auto_144052 )
      ( MAKE-5PILE ?auto_144047 ?auto_144048 ?auto_144049 ?auto_144050 ?auto_144051 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_144053 - BLOCK
      ?auto_144054 - BLOCK
      ?auto_144055 - BLOCK
      ?auto_144056 - BLOCK
      ?auto_144057 - BLOCK
    )
    :vars
    (
      ?auto_144058 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_144053 ) ( ON ?auto_144054 ?auto_144053 ) ( ON ?auto_144055 ?auto_144054 ) ( not ( = ?auto_144053 ?auto_144054 ) ) ( not ( = ?auto_144053 ?auto_144055 ) ) ( not ( = ?auto_144053 ?auto_144056 ) ) ( not ( = ?auto_144053 ?auto_144057 ) ) ( not ( = ?auto_144054 ?auto_144055 ) ) ( not ( = ?auto_144054 ?auto_144056 ) ) ( not ( = ?auto_144054 ?auto_144057 ) ) ( not ( = ?auto_144055 ?auto_144056 ) ) ( not ( = ?auto_144055 ?auto_144057 ) ) ( not ( = ?auto_144056 ?auto_144057 ) ) ( ON ?auto_144057 ?auto_144058 ) ( CLEAR ?auto_144057 ) ( not ( = ?auto_144053 ?auto_144058 ) ) ( not ( = ?auto_144054 ?auto_144058 ) ) ( not ( = ?auto_144055 ?auto_144058 ) ) ( not ( = ?auto_144056 ?auto_144058 ) ) ( not ( = ?auto_144057 ?auto_144058 ) ) ( HOLDING ?auto_144056 ) ( CLEAR ?auto_144055 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_144053 ?auto_144054 ?auto_144055 ?auto_144056 )
      ( MAKE-5PILE ?auto_144053 ?auto_144054 ?auto_144055 ?auto_144056 ?auto_144057 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_144059 - BLOCK
      ?auto_144060 - BLOCK
      ?auto_144061 - BLOCK
      ?auto_144062 - BLOCK
      ?auto_144063 - BLOCK
    )
    :vars
    (
      ?auto_144064 - BLOCK
      ?auto_144066 - BLOCK
      ?auto_144065 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_144059 ) ( ON ?auto_144060 ?auto_144059 ) ( ON ?auto_144061 ?auto_144060 ) ( not ( = ?auto_144059 ?auto_144060 ) ) ( not ( = ?auto_144059 ?auto_144061 ) ) ( not ( = ?auto_144059 ?auto_144062 ) ) ( not ( = ?auto_144059 ?auto_144063 ) ) ( not ( = ?auto_144060 ?auto_144061 ) ) ( not ( = ?auto_144060 ?auto_144062 ) ) ( not ( = ?auto_144060 ?auto_144063 ) ) ( not ( = ?auto_144061 ?auto_144062 ) ) ( not ( = ?auto_144061 ?auto_144063 ) ) ( not ( = ?auto_144062 ?auto_144063 ) ) ( ON ?auto_144063 ?auto_144064 ) ( not ( = ?auto_144059 ?auto_144064 ) ) ( not ( = ?auto_144060 ?auto_144064 ) ) ( not ( = ?auto_144061 ?auto_144064 ) ) ( not ( = ?auto_144062 ?auto_144064 ) ) ( not ( = ?auto_144063 ?auto_144064 ) ) ( CLEAR ?auto_144061 ) ( ON ?auto_144062 ?auto_144063 ) ( CLEAR ?auto_144062 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_144066 ) ( ON ?auto_144065 ?auto_144066 ) ( ON ?auto_144064 ?auto_144065 ) ( not ( = ?auto_144066 ?auto_144065 ) ) ( not ( = ?auto_144066 ?auto_144064 ) ) ( not ( = ?auto_144066 ?auto_144063 ) ) ( not ( = ?auto_144066 ?auto_144062 ) ) ( not ( = ?auto_144065 ?auto_144064 ) ) ( not ( = ?auto_144065 ?auto_144063 ) ) ( not ( = ?auto_144065 ?auto_144062 ) ) ( not ( = ?auto_144059 ?auto_144066 ) ) ( not ( = ?auto_144059 ?auto_144065 ) ) ( not ( = ?auto_144060 ?auto_144066 ) ) ( not ( = ?auto_144060 ?auto_144065 ) ) ( not ( = ?auto_144061 ?auto_144066 ) ) ( not ( = ?auto_144061 ?auto_144065 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_144066 ?auto_144065 ?auto_144064 ?auto_144063 )
      ( MAKE-5PILE ?auto_144059 ?auto_144060 ?auto_144061 ?auto_144062 ?auto_144063 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_144067 - BLOCK
      ?auto_144068 - BLOCK
      ?auto_144069 - BLOCK
      ?auto_144070 - BLOCK
      ?auto_144071 - BLOCK
    )
    :vars
    (
      ?auto_144074 - BLOCK
      ?auto_144072 - BLOCK
      ?auto_144073 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_144067 ) ( ON ?auto_144068 ?auto_144067 ) ( not ( = ?auto_144067 ?auto_144068 ) ) ( not ( = ?auto_144067 ?auto_144069 ) ) ( not ( = ?auto_144067 ?auto_144070 ) ) ( not ( = ?auto_144067 ?auto_144071 ) ) ( not ( = ?auto_144068 ?auto_144069 ) ) ( not ( = ?auto_144068 ?auto_144070 ) ) ( not ( = ?auto_144068 ?auto_144071 ) ) ( not ( = ?auto_144069 ?auto_144070 ) ) ( not ( = ?auto_144069 ?auto_144071 ) ) ( not ( = ?auto_144070 ?auto_144071 ) ) ( ON ?auto_144071 ?auto_144074 ) ( not ( = ?auto_144067 ?auto_144074 ) ) ( not ( = ?auto_144068 ?auto_144074 ) ) ( not ( = ?auto_144069 ?auto_144074 ) ) ( not ( = ?auto_144070 ?auto_144074 ) ) ( not ( = ?auto_144071 ?auto_144074 ) ) ( ON ?auto_144070 ?auto_144071 ) ( CLEAR ?auto_144070 ) ( ON-TABLE ?auto_144072 ) ( ON ?auto_144073 ?auto_144072 ) ( ON ?auto_144074 ?auto_144073 ) ( not ( = ?auto_144072 ?auto_144073 ) ) ( not ( = ?auto_144072 ?auto_144074 ) ) ( not ( = ?auto_144072 ?auto_144071 ) ) ( not ( = ?auto_144072 ?auto_144070 ) ) ( not ( = ?auto_144073 ?auto_144074 ) ) ( not ( = ?auto_144073 ?auto_144071 ) ) ( not ( = ?auto_144073 ?auto_144070 ) ) ( not ( = ?auto_144067 ?auto_144072 ) ) ( not ( = ?auto_144067 ?auto_144073 ) ) ( not ( = ?auto_144068 ?auto_144072 ) ) ( not ( = ?auto_144068 ?auto_144073 ) ) ( not ( = ?auto_144069 ?auto_144072 ) ) ( not ( = ?auto_144069 ?auto_144073 ) ) ( HOLDING ?auto_144069 ) ( CLEAR ?auto_144068 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_144067 ?auto_144068 ?auto_144069 )
      ( MAKE-5PILE ?auto_144067 ?auto_144068 ?auto_144069 ?auto_144070 ?auto_144071 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_144075 - BLOCK
      ?auto_144076 - BLOCK
      ?auto_144077 - BLOCK
      ?auto_144078 - BLOCK
      ?auto_144079 - BLOCK
    )
    :vars
    (
      ?auto_144081 - BLOCK
      ?auto_144082 - BLOCK
      ?auto_144080 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_144075 ) ( ON ?auto_144076 ?auto_144075 ) ( not ( = ?auto_144075 ?auto_144076 ) ) ( not ( = ?auto_144075 ?auto_144077 ) ) ( not ( = ?auto_144075 ?auto_144078 ) ) ( not ( = ?auto_144075 ?auto_144079 ) ) ( not ( = ?auto_144076 ?auto_144077 ) ) ( not ( = ?auto_144076 ?auto_144078 ) ) ( not ( = ?auto_144076 ?auto_144079 ) ) ( not ( = ?auto_144077 ?auto_144078 ) ) ( not ( = ?auto_144077 ?auto_144079 ) ) ( not ( = ?auto_144078 ?auto_144079 ) ) ( ON ?auto_144079 ?auto_144081 ) ( not ( = ?auto_144075 ?auto_144081 ) ) ( not ( = ?auto_144076 ?auto_144081 ) ) ( not ( = ?auto_144077 ?auto_144081 ) ) ( not ( = ?auto_144078 ?auto_144081 ) ) ( not ( = ?auto_144079 ?auto_144081 ) ) ( ON ?auto_144078 ?auto_144079 ) ( ON-TABLE ?auto_144082 ) ( ON ?auto_144080 ?auto_144082 ) ( ON ?auto_144081 ?auto_144080 ) ( not ( = ?auto_144082 ?auto_144080 ) ) ( not ( = ?auto_144082 ?auto_144081 ) ) ( not ( = ?auto_144082 ?auto_144079 ) ) ( not ( = ?auto_144082 ?auto_144078 ) ) ( not ( = ?auto_144080 ?auto_144081 ) ) ( not ( = ?auto_144080 ?auto_144079 ) ) ( not ( = ?auto_144080 ?auto_144078 ) ) ( not ( = ?auto_144075 ?auto_144082 ) ) ( not ( = ?auto_144075 ?auto_144080 ) ) ( not ( = ?auto_144076 ?auto_144082 ) ) ( not ( = ?auto_144076 ?auto_144080 ) ) ( not ( = ?auto_144077 ?auto_144082 ) ) ( not ( = ?auto_144077 ?auto_144080 ) ) ( CLEAR ?auto_144076 ) ( ON ?auto_144077 ?auto_144078 ) ( CLEAR ?auto_144077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_144082 ?auto_144080 ?auto_144081 ?auto_144079 ?auto_144078 )
      ( MAKE-5PILE ?auto_144075 ?auto_144076 ?auto_144077 ?auto_144078 ?auto_144079 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_144083 - BLOCK
      ?auto_144084 - BLOCK
      ?auto_144085 - BLOCK
      ?auto_144086 - BLOCK
      ?auto_144087 - BLOCK
    )
    :vars
    (
      ?auto_144090 - BLOCK
      ?auto_144089 - BLOCK
      ?auto_144088 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_144083 ) ( not ( = ?auto_144083 ?auto_144084 ) ) ( not ( = ?auto_144083 ?auto_144085 ) ) ( not ( = ?auto_144083 ?auto_144086 ) ) ( not ( = ?auto_144083 ?auto_144087 ) ) ( not ( = ?auto_144084 ?auto_144085 ) ) ( not ( = ?auto_144084 ?auto_144086 ) ) ( not ( = ?auto_144084 ?auto_144087 ) ) ( not ( = ?auto_144085 ?auto_144086 ) ) ( not ( = ?auto_144085 ?auto_144087 ) ) ( not ( = ?auto_144086 ?auto_144087 ) ) ( ON ?auto_144087 ?auto_144090 ) ( not ( = ?auto_144083 ?auto_144090 ) ) ( not ( = ?auto_144084 ?auto_144090 ) ) ( not ( = ?auto_144085 ?auto_144090 ) ) ( not ( = ?auto_144086 ?auto_144090 ) ) ( not ( = ?auto_144087 ?auto_144090 ) ) ( ON ?auto_144086 ?auto_144087 ) ( ON-TABLE ?auto_144089 ) ( ON ?auto_144088 ?auto_144089 ) ( ON ?auto_144090 ?auto_144088 ) ( not ( = ?auto_144089 ?auto_144088 ) ) ( not ( = ?auto_144089 ?auto_144090 ) ) ( not ( = ?auto_144089 ?auto_144087 ) ) ( not ( = ?auto_144089 ?auto_144086 ) ) ( not ( = ?auto_144088 ?auto_144090 ) ) ( not ( = ?auto_144088 ?auto_144087 ) ) ( not ( = ?auto_144088 ?auto_144086 ) ) ( not ( = ?auto_144083 ?auto_144089 ) ) ( not ( = ?auto_144083 ?auto_144088 ) ) ( not ( = ?auto_144084 ?auto_144089 ) ) ( not ( = ?auto_144084 ?auto_144088 ) ) ( not ( = ?auto_144085 ?auto_144089 ) ) ( not ( = ?auto_144085 ?auto_144088 ) ) ( ON ?auto_144085 ?auto_144086 ) ( CLEAR ?auto_144085 ) ( HOLDING ?auto_144084 ) ( CLEAR ?auto_144083 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_144083 ?auto_144084 )
      ( MAKE-5PILE ?auto_144083 ?auto_144084 ?auto_144085 ?auto_144086 ?auto_144087 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_144091 - BLOCK
      ?auto_144092 - BLOCK
      ?auto_144093 - BLOCK
      ?auto_144094 - BLOCK
      ?auto_144095 - BLOCK
    )
    :vars
    (
      ?auto_144096 - BLOCK
      ?auto_144097 - BLOCK
      ?auto_144098 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_144091 ) ( not ( = ?auto_144091 ?auto_144092 ) ) ( not ( = ?auto_144091 ?auto_144093 ) ) ( not ( = ?auto_144091 ?auto_144094 ) ) ( not ( = ?auto_144091 ?auto_144095 ) ) ( not ( = ?auto_144092 ?auto_144093 ) ) ( not ( = ?auto_144092 ?auto_144094 ) ) ( not ( = ?auto_144092 ?auto_144095 ) ) ( not ( = ?auto_144093 ?auto_144094 ) ) ( not ( = ?auto_144093 ?auto_144095 ) ) ( not ( = ?auto_144094 ?auto_144095 ) ) ( ON ?auto_144095 ?auto_144096 ) ( not ( = ?auto_144091 ?auto_144096 ) ) ( not ( = ?auto_144092 ?auto_144096 ) ) ( not ( = ?auto_144093 ?auto_144096 ) ) ( not ( = ?auto_144094 ?auto_144096 ) ) ( not ( = ?auto_144095 ?auto_144096 ) ) ( ON ?auto_144094 ?auto_144095 ) ( ON-TABLE ?auto_144097 ) ( ON ?auto_144098 ?auto_144097 ) ( ON ?auto_144096 ?auto_144098 ) ( not ( = ?auto_144097 ?auto_144098 ) ) ( not ( = ?auto_144097 ?auto_144096 ) ) ( not ( = ?auto_144097 ?auto_144095 ) ) ( not ( = ?auto_144097 ?auto_144094 ) ) ( not ( = ?auto_144098 ?auto_144096 ) ) ( not ( = ?auto_144098 ?auto_144095 ) ) ( not ( = ?auto_144098 ?auto_144094 ) ) ( not ( = ?auto_144091 ?auto_144097 ) ) ( not ( = ?auto_144091 ?auto_144098 ) ) ( not ( = ?auto_144092 ?auto_144097 ) ) ( not ( = ?auto_144092 ?auto_144098 ) ) ( not ( = ?auto_144093 ?auto_144097 ) ) ( not ( = ?auto_144093 ?auto_144098 ) ) ( ON ?auto_144093 ?auto_144094 ) ( CLEAR ?auto_144091 ) ( ON ?auto_144092 ?auto_144093 ) ( CLEAR ?auto_144092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_144097 ?auto_144098 ?auto_144096 ?auto_144095 ?auto_144094 ?auto_144093 )
      ( MAKE-5PILE ?auto_144091 ?auto_144092 ?auto_144093 ?auto_144094 ?auto_144095 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_144099 - BLOCK
      ?auto_144100 - BLOCK
      ?auto_144101 - BLOCK
      ?auto_144102 - BLOCK
      ?auto_144103 - BLOCK
    )
    :vars
    (
      ?auto_144105 - BLOCK
      ?auto_144106 - BLOCK
      ?auto_144104 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144099 ?auto_144100 ) ) ( not ( = ?auto_144099 ?auto_144101 ) ) ( not ( = ?auto_144099 ?auto_144102 ) ) ( not ( = ?auto_144099 ?auto_144103 ) ) ( not ( = ?auto_144100 ?auto_144101 ) ) ( not ( = ?auto_144100 ?auto_144102 ) ) ( not ( = ?auto_144100 ?auto_144103 ) ) ( not ( = ?auto_144101 ?auto_144102 ) ) ( not ( = ?auto_144101 ?auto_144103 ) ) ( not ( = ?auto_144102 ?auto_144103 ) ) ( ON ?auto_144103 ?auto_144105 ) ( not ( = ?auto_144099 ?auto_144105 ) ) ( not ( = ?auto_144100 ?auto_144105 ) ) ( not ( = ?auto_144101 ?auto_144105 ) ) ( not ( = ?auto_144102 ?auto_144105 ) ) ( not ( = ?auto_144103 ?auto_144105 ) ) ( ON ?auto_144102 ?auto_144103 ) ( ON-TABLE ?auto_144106 ) ( ON ?auto_144104 ?auto_144106 ) ( ON ?auto_144105 ?auto_144104 ) ( not ( = ?auto_144106 ?auto_144104 ) ) ( not ( = ?auto_144106 ?auto_144105 ) ) ( not ( = ?auto_144106 ?auto_144103 ) ) ( not ( = ?auto_144106 ?auto_144102 ) ) ( not ( = ?auto_144104 ?auto_144105 ) ) ( not ( = ?auto_144104 ?auto_144103 ) ) ( not ( = ?auto_144104 ?auto_144102 ) ) ( not ( = ?auto_144099 ?auto_144106 ) ) ( not ( = ?auto_144099 ?auto_144104 ) ) ( not ( = ?auto_144100 ?auto_144106 ) ) ( not ( = ?auto_144100 ?auto_144104 ) ) ( not ( = ?auto_144101 ?auto_144106 ) ) ( not ( = ?auto_144101 ?auto_144104 ) ) ( ON ?auto_144101 ?auto_144102 ) ( ON ?auto_144100 ?auto_144101 ) ( CLEAR ?auto_144100 ) ( HOLDING ?auto_144099 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_144099 )
      ( MAKE-5PILE ?auto_144099 ?auto_144100 ?auto_144101 ?auto_144102 ?auto_144103 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_144107 - BLOCK
      ?auto_144108 - BLOCK
      ?auto_144109 - BLOCK
      ?auto_144110 - BLOCK
      ?auto_144111 - BLOCK
    )
    :vars
    (
      ?auto_144114 - BLOCK
      ?auto_144112 - BLOCK
      ?auto_144113 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144107 ?auto_144108 ) ) ( not ( = ?auto_144107 ?auto_144109 ) ) ( not ( = ?auto_144107 ?auto_144110 ) ) ( not ( = ?auto_144107 ?auto_144111 ) ) ( not ( = ?auto_144108 ?auto_144109 ) ) ( not ( = ?auto_144108 ?auto_144110 ) ) ( not ( = ?auto_144108 ?auto_144111 ) ) ( not ( = ?auto_144109 ?auto_144110 ) ) ( not ( = ?auto_144109 ?auto_144111 ) ) ( not ( = ?auto_144110 ?auto_144111 ) ) ( ON ?auto_144111 ?auto_144114 ) ( not ( = ?auto_144107 ?auto_144114 ) ) ( not ( = ?auto_144108 ?auto_144114 ) ) ( not ( = ?auto_144109 ?auto_144114 ) ) ( not ( = ?auto_144110 ?auto_144114 ) ) ( not ( = ?auto_144111 ?auto_144114 ) ) ( ON ?auto_144110 ?auto_144111 ) ( ON-TABLE ?auto_144112 ) ( ON ?auto_144113 ?auto_144112 ) ( ON ?auto_144114 ?auto_144113 ) ( not ( = ?auto_144112 ?auto_144113 ) ) ( not ( = ?auto_144112 ?auto_144114 ) ) ( not ( = ?auto_144112 ?auto_144111 ) ) ( not ( = ?auto_144112 ?auto_144110 ) ) ( not ( = ?auto_144113 ?auto_144114 ) ) ( not ( = ?auto_144113 ?auto_144111 ) ) ( not ( = ?auto_144113 ?auto_144110 ) ) ( not ( = ?auto_144107 ?auto_144112 ) ) ( not ( = ?auto_144107 ?auto_144113 ) ) ( not ( = ?auto_144108 ?auto_144112 ) ) ( not ( = ?auto_144108 ?auto_144113 ) ) ( not ( = ?auto_144109 ?auto_144112 ) ) ( not ( = ?auto_144109 ?auto_144113 ) ) ( ON ?auto_144109 ?auto_144110 ) ( ON ?auto_144108 ?auto_144109 ) ( ON ?auto_144107 ?auto_144108 ) ( CLEAR ?auto_144107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_144112 ?auto_144113 ?auto_144114 ?auto_144111 ?auto_144110 ?auto_144109 ?auto_144108 )
      ( MAKE-5PILE ?auto_144107 ?auto_144108 ?auto_144109 ?auto_144110 ?auto_144111 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_144115 - BLOCK
      ?auto_144116 - BLOCK
      ?auto_144117 - BLOCK
      ?auto_144118 - BLOCK
      ?auto_144119 - BLOCK
    )
    :vars
    (
      ?auto_144121 - BLOCK
      ?auto_144120 - BLOCK
      ?auto_144122 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144115 ?auto_144116 ) ) ( not ( = ?auto_144115 ?auto_144117 ) ) ( not ( = ?auto_144115 ?auto_144118 ) ) ( not ( = ?auto_144115 ?auto_144119 ) ) ( not ( = ?auto_144116 ?auto_144117 ) ) ( not ( = ?auto_144116 ?auto_144118 ) ) ( not ( = ?auto_144116 ?auto_144119 ) ) ( not ( = ?auto_144117 ?auto_144118 ) ) ( not ( = ?auto_144117 ?auto_144119 ) ) ( not ( = ?auto_144118 ?auto_144119 ) ) ( ON ?auto_144119 ?auto_144121 ) ( not ( = ?auto_144115 ?auto_144121 ) ) ( not ( = ?auto_144116 ?auto_144121 ) ) ( not ( = ?auto_144117 ?auto_144121 ) ) ( not ( = ?auto_144118 ?auto_144121 ) ) ( not ( = ?auto_144119 ?auto_144121 ) ) ( ON ?auto_144118 ?auto_144119 ) ( ON-TABLE ?auto_144120 ) ( ON ?auto_144122 ?auto_144120 ) ( ON ?auto_144121 ?auto_144122 ) ( not ( = ?auto_144120 ?auto_144122 ) ) ( not ( = ?auto_144120 ?auto_144121 ) ) ( not ( = ?auto_144120 ?auto_144119 ) ) ( not ( = ?auto_144120 ?auto_144118 ) ) ( not ( = ?auto_144122 ?auto_144121 ) ) ( not ( = ?auto_144122 ?auto_144119 ) ) ( not ( = ?auto_144122 ?auto_144118 ) ) ( not ( = ?auto_144115 ?auto_144120 ) ) ( not ( = ?auto_144115 ?auto_144122 ) ) ( not ( = ?auto_144116 ?auto_144120 ) ) ( not ( = ?auto_144116 ?auto_144122 ) ) ( not ( = ?auto_144117 ?auto_144120 ) ) ( not ( = ?auto_144117 ?auto_144122 ) ) ( ON ?auto_144117 ?auto_144118 ) ( ON ?auto_144116 ?auto_144117 ) ( HOLDING ?auto_144115 ) ( CLEAR ?auto_144116 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_144120 ?auto_144122 ?auto_144121 ?auto_144119 ?auto_144118 ?auto_144117 ?auto_144116 ?auto_144115 )
      ( MAKE-5PILE ?auto_144115 ?auto_144116 ?auto_144117 ?auto_144118 ?auto_144119 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_144123 - BLOCK
      ?auto_144124 - BLOCK
      ?auto_144125 - BLOCK
      ?auto_144126 - BLOCK
      ?auto_144127 - BLOCK
    )
    :vars
    (
      ?auto_144130 - BLOCK
      ?auto_144129 - BLOCK
      ?auto_144128 - BLOCK
      ?auto_144131 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144123 ?auto_144124 ) ) ( not ( = ?auto_144123 ?auto_144125 ) ) ( not ( = ?auto_144123 ?auto_144126 ) ) ( not ( = ?auto_144123 ?auto_144127 ) ) ( not ( = ?auto_144124 ?auto_144125 ) ) ( not ( = ?auto_144124 ?auto_144126 ) ) ( not ( = ?auto_144124 ?auto_144127 ) ) ( not ( = ?auto_144125 ?auto_144126 ) ) ( not ( = ?auto_144125 ?auto_144127 ) ) ( not ( = ?auto_144126 ?auto_144127 ) ) ( ON ?auto_144127 ?auto_144130 ) ( not ( = ?auto_144123 ?auto_144130 ) ) ( not ( = ?auto_144124 ?auto_144130 ) ) ( not ( = ?auto_144125 ?auto_144130 ) ) ( not ( = ?auto_144126 ?auto_144130 ) ) ( not ( = ?auto_144127 ?auto_144130 ) ) ( ON ?auto_144126 ?auto_144127 ) ( ON-TABLE ?auto_144129 ) ( ON ?auto_144128 ?auto_144129 ) ( ON ?auto_144130 ?auto_144128 ) ( not ( = ?auto_144129 ?auto_144128 ) ) ( not ( = ?auto_144129 ?auto_144130 ) ) ( not ( = ?auto_144129 ?auto_144127 ) ) ( not ( = ?auto_144129 ?auto_144126 ) ) ( not ( = ?auto_144128 ?auto_144130 ) ) ( not ( = ?auto_144128 ?auto_144127 ) ) ( not ( = ?auto_144128 ?auto_144126 ) ) ( not ( = ?auto_144123 ?auto_144129 ) ) ( not ( = ?auto_144123 ?auto_144128 ) ) ( not ( = ?auto_144124 ?auto_144129 ) ) ( not ( = ?auto_144124 ?auto_144128 ) ) ( not ( = ?auto_144125 ?auto_144129 ) ) ( not ( = ?auto_144125 ?auto_144128 ) ) ( ON ?auto_144125 ?auto_144126 ) ( ON ?auto_144124 ?auto_144125 ) ( CLEAR ?auto_144124 ) ( ON ?auto_144123 ?auto_144131 ) ( CLEAR ?auto_144123 ) ( HAND-EMPTY ) ( not ( = ?auto_144123 ?auto_144131 ) ) ( not ( = ?auto_144124 ?auto_144131 ) ) ( not ( = ?auto_144125 ?auto_144131 ) ) ( not ( = ?auto_144126 ?auto_144131 ) ) ( not ( = ?auto_144127 ?auto_144131 ) ) ( not ( = ?auto_144130 ?auto_144131 ) ) ( not ( = ?auto_144129 ?auto_144131 ) ) ( not ( = ?auto_144128 ?auto_144131 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_144123 ?auto_144131 )
      ( MAKE-5PILE ?auto_144123 ?auto_144124 ?auto_144125 ?auto_144126 ?auto_144127 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_144132 - BLOCK
      ?auto_144133 - BLOCK
      ?auto_144134 - BLOCK
      ?auto_144135 - BLOCK
      ?auto_144136 - BLOCK
    )
    :vars
    (
      ?auto_144138 - BLOCK
      ?auto_144140 - BLOCK
      ?auto_144137 - BLOCK
      ?auto_144139 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144132 ?auto_144133 ) ) ( not ( = ?auto_144132 ?auto_144134 ) ) ( not ( = ?auto_144132 ?auto_144135 ) ) ( not ( = ?auto_144132 ?auto_144136 ) ) ( not ( = ?auto_144133 ?auto_144134 ) ) ( not ( = ?auto_144133 ?auto_144135 ) ) ( not ( = ?auto_144133 ?auto_144136 ) ) ( not ( = ?auto_144134 ?auto_144135 ) ) ( not ( = ?auto_144134 ?auto_144136 ) ) ( not ( = ?auto_144135 ?auto_144136 ) ) ( ON ?auto_144136 ?auto_144138 ) ( not ( = ?auto_144132 ?auto_144138 ) ) ( not ( = ?auto_144133 ?auto_144138 ) ) ( not ( = ?auto_144134 ?auto_144138 ) ) ( not ( = ?auto_144135 ?auto_144138 ) ) ( not ( = ?auto_144136 ?auto_144138 ) ) ( ON ?auto_144135 ?auto_144136 ) ( ON-TABLE ?auto_144140 ) ( ON ?auto_144137 ?auto_144140 ) ( ON ?auto_144138 ?auto_144137 ) ( not ( = ?auto_144140 ?auto_144137 ) ) ( not ( = ?auto_144140 ?auto_144138 ) ) ( not ( = ?auto_144140 ?auto_144136 ) ) ( not ( = ?auto_144140 ?auto_144135 ) ) ( not ( = ?auto_144137 ?auto_144138 ) ) ( not ( = ?auto_144137 ?auto_144136 ) ) ( not ( = ?auto_144137 ?auto_144135 ) ) ( not ( = ?auto_144132 ?auto_144140 ) ) ( not ( = ?auto_144132 ?auto_144137 ) ) ( not ( = ?auto_144133 ?auto_144140 ) ) ( not ( = ?auto_144133 ?auto_144137 ) ) ( not ( = ?auto_144134 ?auto_144140 ) ) ( not ( = ?auto_144134 ?auto_144137 ) ) ( ON ?auto_144134 ?auto_144135 ) ( ON ?auto_144132 ?auto_144139 ) ( CLEAR ?auto_144132 ) ( not ( = ?auto_144132 ?auto_144139 ) ) ( not ( = ?auto_144133 ?auto_144139 ) ) ( not ( = ?auto_144134 ?auto_144139 ) ) ( not ( = ?auto_144135 ?auto_144139 ) ) ( not ( = ?auto_144136 ?auto_144139 ) ) ( not ( = ?auto_144138 ?auto_144139 ) ) ( not ( = ?auto_144140 ?auto_144139 ) ) ( not ( = ?auto_144137 ?auto_144139 ) ) ( HOLDING ?auto_144133 ) ( CLEAR ?auto_144134 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_144140 ?auto_144137 ?auto_144138 ?auto_144136 ?auto_144135 ?auto_144134 ?auto_144133 )
      ( MAKE-5PILE ?auto_144132 ?auto_144133 ?auto_144134 ?auto_144135 ?auto_144136 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_144141 - BLOCK
      ?auto_144142 - BLOCK
      ?auto_144143 - BLOCK
      ?auto_144144 - BLOCK
      ?auto_144145 - BLOCK
    )
    :vars
    (
      ?auto_144147 - BLOCK
      ?auto_144146 - BLOCK
      ?auto_144148 - BLOCK
      ?auto_144149 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144141 ?auto_144142 ) ) ( not ( = ?auto_144141 ?auto_144143 ) ) ( not ( = ?auto_144141 ?auto_144144 ) ) ( not ( = ?auto_144141 ?auto_144145 ) ) ( not ( = ?auto_144142 ?auto_144143 ) ) ( not ( = ?auto_144142 ?auto_144144 ) ) ( not ( = ?auto_144142 ?auto_144145 ) ) ( not ( = ?auto_144143 ?auto_144144 ) ) ( not ( = ?auto_144143 ?auto_144145 ) ) ( not ( = ?auto_144144 ?auto_144145 ) ) ( ON ?auto_144145 ?auto_144147 ) ( not ( = ?auto_144141 ?auto_144147 ) ) ( not ( = ?auto_144142 ?auto_144147 ) ) ( not ( = ?auto_144143 ?auto_144147 ) ) ( not ( = ?auto_144144 ?auto_144147 ) ) ( not ( = ?auto_144145 ?auto_144147 ) ) ( ON ?auto_144144 ?auto_144145 ) ( ON-TABLE ?auto_144146 ) ( ON ?auto_144148 ?auto_144146 ) ( ON ?auto_144147 ?auto_144148 ) ( not ( = ?auto_144146 ?auto_144148 ) ) ( not ( = ?auto_144146 ?auto_144147 ) ) ( not ( = ?auto_144146 ?auto_144145 ) ) ( not ( = ?auto_144146 ?auto_144144 ) ) ( not ( = ?auto_144148 ?auto_144147 ) ) ( not ( = ?auto_144148 ?auto_144145 ) ) ( not ( = ?auto_144148 ?auto_144144 ) ) ( not ( = ?auto_144141 ?auto_144146 ) ) ( not ( = ?auto_144141 ?auto_144148 ) ) ( not ( = ?auto_144142 ?auto_144146 ) ) ( not ( = ?auto_144142 ?auto_144148 ) ) ( not ( = ?auto_144143 ?auto_144146 ) ) ( not ( = ?auto_144143 ?auto_144148 ) ) ( ON ?auto_144143 ?auto_144144 ) ( ON ?auto_144141 ?auto_144149 ) ( not ( = ?auto_144141 ?auto_144149 ) ) ( not ( = ?auto_144142 ?auto_144149 ) ) ( not ( = ?auto_144143 ?auto_144149 ) ) ( not ( = ?auto_144144 ?auto_144149 ) ) ( not ( = ?auto_144145 ?auto_144149 ) ) ( not ( = ?auto_144147 ?auto_144149 ) ) ( not ( = ?auto_144146 ?auto_144149 ) ) ( not ( = ?auto_144148 ?auto_144149 ) ) ( CLEAR ?auto_144143 ) ( ON ?auto_144142 ?auto_144141 ) ( CLEAR ?auto_144142 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_144149 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_144149 ?auto_144141 )
      ( MAKE-5PILE ?auto_144141 ?auto_144142 ?auto_144143 ?auto_144144 ?auto_144145 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_144150 - BLOCK
      ?auto_144151 - BLOCK
      ?auto_144152 - BLOCK
      ?auto_144153 - BLOCK
      ?auto_144154 - BLOCK
    )
    :vars
    (
      ?auto_144155 - BLOCK
      ?auto_144157 - BLOCK
      ?auto_144158 - BLOCK
      ?auto_144156 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144150 ?auto_144151 ) ) ( not ( = ?auto_144150 ?auto_144152 ) ) ( not ( = ?auto_144150 ?auto_144153 ) ) ( not ( = ?auto_144150 ?auto_144154 ) ) ( not ( = ?auto_144151 ?auto_144152 ) ) ( not ( = ?auto_144151 ?auto_144153 ) ) ( not ( = ?auto_144151 ?auto_144154 ) ) ( not ( = ?auto_144152 ?auto_144153 ) ) ( not ( = ?auto_144152 ?auto_144154 ) ) ( not ( = ?auto_144153 ?auto_144154 ) ) ( ON ?auto_144154 ?auto_144155 ) ( not ( = ?auto_144150 ?auto_144155 ) ) ( not ( = ?auto_144151 ?auto_144155 ) ) ( not ( = ?auto_144152 ?auto_144155 ) ) ( not ( = ?auto_144153 ?auto_144155 ) ) ( not ( = ?auto_144154 ?auto_144155 ) ) ( ON ?auto_144153 ?auto_144154 ) ( ON-TABLE ?auto_144157 ) ( ON ?auto_144158 ?auto_144157 ) ( ON ?auto_144155 ?auto_144158 ) ( not ( = ?auto_144157 ?auto_144158 ) ) ( not ( = ?auto_144157 ?auto_144155 ) ) ( not ( = ?auto_144157 ?auto_144154 ) ) ( not ( = ?auto_144157 ?auto_144153 ) ) ( not ( = ?auto_144158 ?auto_144155 ) ) ( not ( = ?auto_144158 ?auto_144154 ) ) ( not ( = ?auto_144158 ?auto_144153 ) ) ( not ( = ?auto_144150 ?auto_144157 ) ) ( not ( = ?auto_144150 ?auto_144158 ) ) ( not ( = ?auto_144151 ?auto_144157 ) ) ( not ( = ?auto_144151 ?auto_144158 ) ) ( not ( = ?auto_144152 ?auto_144157 ) ) ( not ( = ?auto_144152 ?auto_144158 ) ) ( ON ?auto_144150 ?auto_144156 ) ( not ( = ?auto_144150 ?auto_144156 ) ) ( not ( = ?auto_144151 ?auto_144156 ) ) ( not ( = ?auto_144152 ?auto_144156 ) ) ( not ( = ?auto_144153 ?auto_144156 ) ) ( not ( = ?auto_144154 ?auto_144156 ) ) ( not ( = ?auto_144155 ?auto_144156 ) ) ( not ( = ?auto_144157 ?auto_144156 ) ) ( not ( = ?auto_144158 ?auto_144156 ) ) ( ON ?auto_144151 ?auto_144150 ) ( CLEAR ?auto_144151 ) ( ON-TABLE ?auto_144156 ) ( HOLDING ?auto_144152 ) ( CLEAR ?auto_144153 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_144157 ?auto_144158 ?auto_144155 ?auto_144154 ?auto_144153 ?auto_144152 )
      ( MAKE-5PILE ?auto_144150 ?auto_144151 ?auto_144152 ?auto_144153 ?auto_144154 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_144159 - BLOCK
      ?auto_144160 - BLOCK
      ?auto_144161 - BLOCK
      ?auto_144162 - BLOCK
      ?auto_144163 - BLOCK
    )
    :vars
    (
      ?auto_144167 - BLOCK
      ?auto_144165 - BLOCK
      ?auto_144164 - BLOCK
      ?auto_144166 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144159 ?auto_144160 ) ) ( not ( = ?auto_144159 ?auto_144161 ) ) ( not ( = ?auto_144159 ?auto_144162 ) ) ( not ( = ?auto_144159 ?auto_144163 ) ) ( not ( = ?auto_144160 ?auto_144161 ) ) ( not ( = ?auto_144160 ?auto_144162 ) ) ( not ( = ?auto_144160 ?auto_144163 ) ) ( not ( = ?auto_144161 ?auto_144162 ) ) ( not ( = ?auto_144161 ?auto_144163 ) ) ( not ( = ?auto_144162 ?auto_144163 ) ) ( ON ?auto_144163 ?auto_144167 ) ( not ( = ?auto_144159 ?auto_144167 ) ) ( not ( = ?auto_144160 ?auto_144167 ) ) ( not ( = ?auto_144161 ?auto_144167 ) ) ( not ( = ?auto_144162 ?auto_144167 ) ) ( not ( = ?auto_144163 ?auto_144167 ) ) ( ON ?auto_144162 ?auto_144163 ) ( ON-TABLE ?auto_144165 ) ( ON ?auto_144164 ?auto_144165 ) ( ON ?auto_144167 ?auto_144164 ) ( not ( = ?auto_144165 ?auto_144164 ) ) ( not ( = ?auto_144165 ?auto_144167 ) ) ( not ( = ?auto_144165 ?auto_144163 ) ) ( not ( = ?auto_144165 ?auto_144162 ) ) ( not ( = ?auto_144164 ?auto_144167 ) ) ( not ( = ?auto_144164 ?auto_144163 ) ) ( not ( = ?auto_144164 ?auto_144162 ) ) ( not ( = ?auto_144159 ?auto_144165 ) ) ( not ( = ?auto_144159 ?auto_144164 ) ) ( not ( = ?auto_144160 ?auto_144165 ) ) ( not ( = ?auto_144160 ?auto_144164 ) ) ( not ( = ?auto_144161 ?auto_144165 ) ) ( not ( = ?auto_144161 ?auto_144164 ) ) ( ON ?auto_144159 ?auto_144166 ) ( not ( = ?auto_144159 ?auto_144166 ) ) ( not ( = ?auto_144160 ?auto_144166 ) ) ( not ( = ?auto_144161 ?auto_144166 ) ) ( not ( = ?auto_144162 ?auto_144166 ) ) ( not ( = ?auto_144163 ?auto_144166 ) ) ( not ( = ?auto_144167 ?auto_144166 ) ) ( not ( = ?auto_144165 ?auto_144166 ) ) ( not ( = ?auto_144164 ?auto_144166 ) ) ( ON ?auto_144160 ?auto_144159 ) ( ON-TABLE ?auto_144166 ) ( CLEAR ?auto_144162 ) ( ON ?auto_144161 ?auto_144160 ) ( CLEAR ?auto_144161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_144166 ?auto_144159 ?auto_144160 )
      ( MAKE-5PILE ?auto_144159 ?auto_144160 ?auto_144161 ?auto_144162 ?auto_144163 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_144168 - BLOCK
      ?auto_144169 - BLOCK
      ?auto_144170 - BLOCK
      ?auto_144171 - BLOCK
      ?auto_144172 - BLOCK
    )
    :vars
    (
      ?auto_144174 - BLOCK
      ?auto_144173 - BLOCK
      ?auto_144176 - BLOCK
      ?auto_144175 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144168 ?auto_144169 ) ) ( not ( = ?auto_144168 ?auto_144170 ) ) ( not ( = ?auto_144168 ?auto_144171 ) ) ( not ( = ?auto_144168 ?auto_144172 ) ) ( not ( = ?auto_144169 ?auto_144170 ) ) ( not ( = ?auto_144169 ?auto_144171 ) ) ( not ( = ?auto_144169 ?auto_144172 ) ) ( not ( = ?auto_144170 ?auto_144171 ) ) ( not ( = ?auto_144170 ?auto_144172 ) ) ( not ( = ?auto_144171 ?auto_144172 ) ) ( ON ?auto_144172 ?auto_144174 ) ( not ( = ?auto_144168 ?auto_144174 ) ) ( not ( = ?auto_144169 ?auto_144174 ) ) ( not ( = ?auto_144170 ?auto_144174 ) ) ( not ( = ?auto_144171 ?auto_144174 ) ) ( not ( = ?auto_144172 ?auto_144174 ) ) ( ON-TABLE ?auto_144173 ) ( ON ?auto_144176 ?auto_144173 ) ( ON ?auto_144174 ?auto_144176 ) ( not ( = ?auto_144173 ?auto_144176 ) ) ( not ( = ?auto_144173 ?auto_144174 ) ) ( not ( = ?auto_144173 ?auto_144172 ) ) ( not ( = ?auto_144173 ?auto_144171 ) ) ( not ( = ?auto_144176 ?auto_144174 ) ) ( not ( = ?auto_144176 ?auto_144172 ) ) ( not ( = ?auto_144176 ?auto_144171 ) ) ( not ( = ?auto_144168 ?auto_144173 ) ) ( not ( = ?auto_144168 ?auto_144176 ) ) ( not ( = ?auto_144169 ?auto_144173 ) ) ( not ( = ?auto_144169 ?auto_144176 ) ) ( not ( = ?auto_144170 ?auto_144173 ) ) ( not ( = ?auto_144170 ?auto_144176 ) ) ( ON ?auto_144168 ?auto_144175 ) ( not ( = ?auto_144168 ?auto_144175 ) ) ( not ( = ?auto_144169 ?auto_144175 ) ) ( not ( = ?auto_144170 ?auto_144175 ) ) ( not ( = ?auto_144171 ?auto_144175 ) ) ( not ( = ?auto_144172 ?auto_144175 ) ) ( not ( = ?auto_144174 ?auto_144175 ) ) ( not ( = ?auto_144173 ?auto_144175 ) ) ( not ( = ?auto_144176 ?auto_144175 ) ) ( ON ?auto_144169 ?auto_144168 ) ( ON-TABLE ?auto_144175 ) ( ON ?auto_144170 ?auto_144169 ) ( CLEAR ?auto_144170 ) ( HOLDING ?auto_144171 ) ( CLEAR ?auto_144172 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_144173 ?auto_144176 ?auto_144174 ?auto_144172 ?auto_144171 )
      ( MAKE-5PILE ?auto_144168 ?auto_144169 ?auto_144170 ?auto_144171 ?auto_144172 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_144177 - BLOCK
      ?auto_144178 - BLOCK
      ?auto_144179 - BLOCK
      ?auto_144180 - BLOCK
      ?auto_144181 - BLOCK
    )
    :vars
    (
      ?auto_144184 - BLOCK
      ?auto_144183 - BLOCK
      ?auto_144182 - BLOCK
      ?auto_144185 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144177 ?auto_144178 ) ) ( not ( = ?auto_144177 ?auto_144179 ) ) ( not ( = ?auto_144177 ?auto_144180 ) ) ( not ( = ?auto_144177 ?auto_144181 ) ) ( not ( = ?auto_144178 ?auto_144179 ) ) ( not ( = ?auto_144178 ?auto_144180 ) ) ( not ( = ?auto_144178 ?auto_144181 ) ) ( not ( = ?auto_144179 ?auto_144180 ) ) ( not ( = ?auto_144179 ?auto_144181 ) ) ( not ( = ?auto_144180 ?auto_144181 ) ) ( ON ?auto_144181 ?auto_144184 ) ( not ( = ?auto_144177 ?auto_144184 ) ) ( not ( = ?auto_144178 ?auto_144184 ) ) ( not ( = ?auto_144179 ?auto_144184 ) ) ( not ( = ?auto_144180 ?auto_144184 ) ) ( not ( = ?auto_144181 ?auto_144184 ) ) ( ON-TABLE ?auto_144183 ) ( ON ?auto_144182 ?auto_144183 ) ( ON ?auto_144184 ?auto_144182 ) ( not ( = ?auto_144183 ?auto_144182 ) ) ( not ( = ?auto_144183 ?auto_144184 ) ) ( not ( = ?auto_144183 ?auto_144181 ) ) ( not ( = ?auto_144183 ?auto_144180 ) ) ( not ( = ?auto_144182 ?auto_144184 ) ) ( not ( = ?auto_144182 ?auto_144181 ) ) ( not ( = ?auto_144182 ?auto_144180 ) ) ( not ( = ?auto_144177 ?auto_144183 ) ) ( not ( = ?auto_144177 ?auto_144182 ) ) ( not ( = ?auto_144178 ?auto_144183 ) ) ( not ( = ?auto_144178 ?auto_144182 ) ) ( not ( = ?auto_144179 ?auto_144183 ) ) ( not ( = ?auto_144179 ?auto_144182 ) ) ( ON ?auto_144177 ?auto_144185 ) ( not ( = ?auto_144177 ?auto_144185 ) ) ( not ( = ?auto_144178 ?auto_144185 ) ) ( not ( = ?auto_144179 ?auto_144185 ) ) ( not ( = ?auto_144180 ?auto_144185 ) ) ( not ( = ?auto_144181 ?auto_144185 ) ) ( not ( = ?auto_144184 ?auto_144185 ) ) ( not ( = ?auto_144183 ?auto_144185 ) ) ( not ( = ?auto_144182 ?auto_144185 ) ) ( ON ?auto_144178 ?auto_144177 ) ( ON-TABLE ?auto_144185 ) ( ON ?auto_144179 ?auto_144178 ) ( CLEAR ?auto_144181 ) ( ON ?auto_144180 ?auto_144179 ) ( CLEAR ?auto_144180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_144185 ?auto_144177 ?auto_144178 ?auto_144179 )
      ( MAKE-5PILE ?auto_144177 ?auto_144178 ?auto_144179 ?auto_144180 ?auto_144181 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_144186 - BLOCK
      ?auto_144187 - BLOCK
      ?auto_144188 - BLOCK
      ?auto_144189 - BLOCK
      ?auto_144190 - BLOCK
    )
    :vars
    (
      ?auto_144194 - BLOCK
      ?auto_144191 - BLOCK
      ?auto_144192 - BLOCK
      ?auto_144193 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144186 ?auto_144187 ) ) ( not ( = ?auto_144186 ?auto_144188 ) ) ( not ( = ?auto_144186 ?auto_144189 ) ) ( not ( = ?auto_144186 ?auto_144190 ) ) ( not ( = ?auto_144187 ?auto_144188 ) ) ( not ( = ?auto_144187 ?auto_144189 ) ) ( not ( = ?auto_144187 ?auto_144190 ) ) ( not ( = ?auto_144188 ?auto_144189 ) ) ( not ( = ?auto_144188 ?auto_144190 ) ) ( not ( = ?auto_144189 ?auto_144190 ) ) ( not ( = ?auto_144186 ?auto_144194 ) ) ( not ( = ?auto_144187 ?auto_144194 ) ) ( not ( = ?auto_144188 ?auto_144194 ) ) ( not ( = ?auto_144189 ?auto_144194 ) ) ( not ( = ?auto_144190 ?auto_144194 ) ) ( ON-TABLE ?auto_144191 ) ( ON ?auto_144192 ?auto_144191 ) ( ON ?auto_144194 ?auto_144192 ) ( not ( = ?auto_144191 ?auto_144192 ) ) ( not ( = ?auto_144191 ?auto_144194 ) ) ( not ( = ?auto_144191 ?auto_144190 ) ) ( not ( = ?auto_144191 ?auto_144189 ) ) ( not ( = ?auto_144192 ?auto_144194 ) ) ( not ( = ?auto_144192 ?auto_144190 ) ) ( not ( = ?auto_144192 ?auto_144189 ) ) ( not ( = ?auto_144186 ?auto_144191 ) ) ( not ( = ?auto_144186 ?auto_144192 ) ) ( not ( = ?auto_144187 ?auto_144191 ) ) ( not ( = ?auto_144187 ?auto_144192 ) ) ( not ( = ?auto_144188 ?auto_144191 ) ) ( not ( = ?auto_144188 ?auto_144192 ) ) ( ON ?auto_144186 ?auto_144193 ) ( not ( = ?auto_144186 ?auto_144193 ) ) ( not ( = ?auto_144187 ?auto_144193 ) ) ( not ( = ?auto_144188 ?auto_144193 ) ) ( not ( = ?auto_144189 ?auto_144193 ) ) ( not ( = ?auto_144190 ?auto_144193 ) ) ( not ( = ?auto_144194 ?auto_144193 ) ) ( not ( = ?auto_144191 ?auto_144193 ) ) ( not ( = ?auto_144192 ?auto_144193 ) ) ( ON ?auto_144187 ?auto_144186 ) ( ON-TABLE ?auto_144193 ) ( ON ?auto_144188 ?auto_144187 ) ( ON ?auto_144189 ?auto_144188 ) ( CLEAR ?auto_144189 ) ( HOLDING ?auto_144190 ) ( CLEAR ?auto_144194 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_144191 ?auto_144192 ?auto_144194 ?auto_144190 )
      ( MAKE-5PILE ?auto_144186 ?auto_144187 ?auto_144188 ?auto_144189 ?auto_144190 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_144195 - BLOCK
      ?auto_144196 - BLOCK
      ?auto_144197 - BLOCK
      ?auto_144198 - BLOCK
      ?auto_144199 - BLOCK
    )
    :vars
    (
      ?auto_144200 - BLOCK
      ?auto_144203 - BLOCK
      ?auto_144202 - BLOCK
      ?auto_144201 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144195 ?auto_144196 ) ) ( not ( = ?auto_144195 ?auto_144197 ) ) ( not ( = ?auto_144195 ?auto_144198 ) ) ( not ( = ?auto_144195 ?auto_144199 ) ) ( not ( = ?auto_144196 ?auto_144197 ) ) ( not ( = ?auto_144196 ?auto_144198 ) ) ( not ( = ?auto_144196 ?auto_144199 ) ) ( not ( = ?auto_144197 ?auto_144198 ) ) ( not ( = ?auto_144197 ?auto_144199 ) ) ( not ( = ?auto_144198 ?auto_144199 ) ) ( not ( = ?auto_144195 ?auto_144200 ) ) ( not ( = ?auto_144196 ?auto_144200 ) ) ( not ( = ?auto_144197 ?auto_144200 ) ) ( not ( = ?auto_144198 ?auto_144200 ) ) ( not ( = ?auto_144199 ?auto_144200 ) ) ( ON-TABLE ?auto_144203 ) ( ON ?auto_144202 ?auto_144203 ) ( ON ?auto_144200 ?auto_144202 ) ( not ( = ?auto_144203 ?auto_144202 ) ) ( not ( = ?auto_144203 ?auto_144200 ) ) ( not ( = ?auto_144203 ?auto_144199 ) ) ( not ( = ?auto_144203 ?auto_144198 ) ) ( not ( = ?auto_144202 ?auto_144200 ) ) ( not ( = ?auto_144202 ?auto_144199 ) ) ( not ( = ?auto_144202 ?auto_144198 ) ) ( not ( = ?auto_144195 ?auto_144203 ) ) ( not ( = ?auto_144195 ?auto_144202 ) ) ( not ( = ?auto_144196 ?auto_144203 ) ) ( not ( = ?auto_144196 ?auto_144202 ) ) ( not ( = ?auto_144197 ?auto_144203 ) ) ( not ( = ?auto_144197 ?auto_144202 ) ) ( ON ?auto_144195 ?auto_144201 ) ( not ( = ?auto_144195 ?auto_144201 ) ) ( not ( = ?auto_144196 ?auto_144201 ) ) ( not ( = ?auto_144197 ?auto_144201 ) ) ( not ( = ?auto_144198 ?auto_144201 ) ) ( not ( = ?auto_144199 ?auto_144201 ) ) ( not ( = ?auto_144200 ?auto_144201 ) ) ( not ( = ?auto_144203 ?auto_144201 ) ) ( not ( = ?auto_144202 ?auto_144201 ) ) ( ON ?auto_144196 ?auto_144195 ) ( ON-TABLE ?auto_144201 ) ( ON ?auto_144197 ?auto_144196 ) ( ON ?auto_144198 ?auto_144197 ) ( CLEAR ?auto_144200 ) ( ON ?auto_144199 ?auto_144198 ) ( CLEAR ?auto_144199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_144201 ?auto_144195 ?auto_144196 ?auto_144197 ?auto_144198 )
      ( MAKE-5PILE ?auto_144195 ?auto_144196 ?auto_144197 ?auto_144198 ?auto_144199 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_144204 - BLOCK
      ?auto_144205 - BLOCK
      ?auto_144206 - BLOCK
      ?auto_144207 - BLOCK
      ?auto_144208 - BLOCK
    )
    :vars
    (
      ?auto_144212 - BLOCK
      ?auto_144211 - BLOCK
      ?auto_144209 - BLOCK
      ?auto_144210 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144204 ?auto_144205 ) ) ( not ( = ?auto_144204 ?auto_144206 ) ) ( not ( = ?auto_144204 ?auto_144207 ) ) ( not ( = ?auto_144204 ?auto_144208 ) ) ( not ( = ?auto_144205 ?auto_144206 ) ) ( not ( = ?auto_144205 ?auto_144207 ) ) ( not ( = ?auto_144205 ?auto_144208 ) ) ( not ( = ?auto_144206 ?auto_144207 ) ) ( not ( = ?auto_144206 ?auto_144208 ) ) ( not ( = ?auto_144207 ?auto_144208 ) ) ( not ( = ?auto_144204 ?auto_144212 ) ) ( not ( = ?auto_144205 ?auto_144212 ) ) ( not ( = ?auto_144206 ?auto_144212 ) ) ( not ( = ?auto_144207 ?auto_144212 ) ) ( not ( = ?auto_144208 ?auto_144212 ) ) ( ON-TABLE ?auto_144211 ) ( ON ?auto_144209 ?auto_144211 ) ( not ( = ?auto_144211 ?auto_144209 ) ) ( not ( = ?auto_144211 ?auto_144212 ) ) ( not ( = ?auto_144211 ?auto_144208 ) ) ( not ( = ?auto_144211 ?auto_144207 ) ) ( not ( = ?auto_144209 ?auto_144212 ) ) ( not ( = ?auto_144209 ?auto_144208 ) ) ( not ( = ?auto_144209 ?auto_144207 ) ) ( not ( = ?auto_144204 ?auto_144211 ) ) ( not ( = ?auto_144204 ?auto_144209 ) ) ( not ( = ?auto_144205 ?auto_144211 ) ) ( not ( = ?auto_144205 ?auto_144209 ) ) ( not ( = ?auto_144206 ?auto_144211 ) ) ( not ( = ?auto_144206 ?auto_144209 ) ) ( ON ?auto_144204 ?auto_144210 ) ( not ( = ?auto_144204 ?auto_144210 ) ) ( not ( = ?auto_144205 ?auto_144210 ) ) ( not ( = ?auto_144206 ?auto_144210 ) ) ( not ( = ?auto_144207 ?auto_144210 ) ) ( not ( = ?auto_144208 ?auto_144210 ) ) ( not ( = ?auto_144212 ?auto_144210 ) ) ( not ( = ?auto_144211 ?auto_144210 ) ) ( not ( = ?auto_144209 ?auto_144210 ) ) ( ON ?auto_144205 ?auto_144204 ) ( ON-TABLE ?auto_144210 ) ( ON ?auto_144206 ?auto_144205 ) ( ON ?auto_144207 ?auto_144206 ) ( ON ?auto_144208 ?auto_144207 ) ( CLEAR ?auto_144208 ) ( HOLDING ?auto_144212 ) ( CLEAR ?auto_144209 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_144211 ?auto_144209 ?auto_144212 )
      ( MAKE-5PILE ?auto_144204 ?auto_144205 ?auto_144206 ?auto_144207 ?auto_144208 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_144213 - BLOCK
      ?auto_144214 - BLOCK
      ?auto_144215 - BLOCK
      ?auto_144216 - BLOCK
      ?auto_144217 - BLOCK
    )
    :vars
    (
      ?auto_144218 - BLOCK
      ?auto_144219 - BLOCK
      ?auto_144220 - BLOCK
      ?auto_144221 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144213 ?auto_144214 ) ) ( not ( = ?auto_144213 ?auto_144215 ) ) ( not ( = ?auto_144213 ?auto_144216 ) ) ( not ( = ?auto_144213 ?auto_144217 ) ) ( not ( = ?auto_144214 ?auto_144215 ) ) ( not ( = ?auto_144214 ?auto_144216 ) ) ( not ( = ?auto_144214 ?auto_144217 ) ) ( not ( = ?auto_144215 ?auto_144216 ) ) ( not ( = ?auto_144215 ?auto_144217 ) ) ( not ( = ?auto_144216 ?auto_144217 ) ) ( not ( = ?auto_144213 ?auto_144218 ) ) ( not ( = ?auto_144214 ?auto_144218 ) ) ( not ( = ?auto_144215 ?auto_144218 ) ) ( not ( = ?auto_144216 ?auto_144218 ) ) ( not ( = ?auto_144217 ?auto_144218 ) ) ( ON-TABLE ?auto_144219 ) ( ON ?auto_144220 ?auto_144219 ) ( not ( = ?auto_144219 ?auto_144220 ) ) ( not ( = ?auto_144219 ?auto_144218 ) ) ( not ( = ?auto_144219 ?auto_144217 ) ) ( not ( = ?auto_144219 ?auto_144216 ) ) ( not ( = ?auto_144220 ?auto_144218 ) ) ( not ( = ?auto_144220 ?auto_144217 ) ) ( not ( = ?auto_144220 ?auto_144216 ) ) ( not ( = ?auto_144213 ?auto_144219 ) ) ( not ( = ?auto_144213 ?auto_144220 ) ) ( not ( = ?auto_144214 ?auto_144219 ) ) ( not ( = ?auto_144214 ?auto_144220 ) ) ( not ( = ?auto_144215 ?auto_144219 ) ) ( not ( = ?auto_144215 ?auto_144220 ) ) ( ON ?auto_144213 ?auto_144221 ) ( not ( = ?auto_144213 ?auto_144221 ) ) ( not ( = ?auto_144214 ?auto_144221 ) ) ( not ( = ?auto_144215 ?auto_144221 ) ) ( not ( = ?auto_144216 ?auto_144221 ) ) ( not ( = ?auto_144217 ?auto_144221 ) ) ( not ( = ?auto_144218 ?auto_144221 ) ) ( not ( = ?auto_144219 ?auto_144221 ) ) ( not ( = ?auto_144220 ?auto_144221 ) ) ( ON ?auto_144214 ?auto_144213 ) ( ON-TABLE ?auto_144221 ) ( ON ?auto_144215 ?auto_144214 ) ( ON ?auto_144216 ?auto_144215 ) ( ON ?auto_144217 ?auto_144216 ) ( CLEAR ?auto_144220 ) ( ON ?auto_144218 ?auto_144217 ) ( CLEAR ?auto_144218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_144221 ?auto_144213 ?auto_144214 ?auto_144215 ?auto_144216 ?auto_144217 )
      ( MAKE-5PILE ?auto_144213 ?auto_144214 ?auto_144215 ?auto_144216 ?auto_144217 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_144222 - BLOCK
      ?auto_144223 - BLOCK
      ?auto_144224 - BLOCK
      ?auto_144225 - BLOCK
      ?auto_144226 - BLOCK
    )
    :vars
    (
      ?auto_144228 - BLOCK
      ?auto_144229 - BLOCK
      ?auto_144227 - BLOCK
      ?auto_144230 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144222 ?auto_144223 ) ) ( not ( = ?auto_144222 ?auto_144224 ) ) ( not ( = ?auto_144222 ?auto_144225 ) ) ( not ( = ?auto_144222 ?auto_144226 ) ) ( not ( = ?auto_144223 ?auto_144224 ) ) ( not ( = ?auto_144223 ?auto_144225 ) ) ( not ( = ?auto_144223 ?auto_144226 ) ) ( not ( = ?auto_144224 ?auto_144225 ) ) ( not ( = ?auto_144224 ?auto_144226 ) ) ( not ( = ?auto_144225 ?auto_144226 ) ) ( not ( = ?auto_144222 ?auto_144228 ) ) ( not ( = ?auto_144223 ?auto_144228 ) ) ( not ( = ?auto_144224 ?auto_144228 ) ) ( not ( = ?auto_144225 ?auto_144228 ) ) ( not ( = ?auto_144226 ?auto_144228 ) ) ( ON-TABLE ?auto_144229 ) ( not ( = ?auto_144229 ?auto_144227 ) ) ( not ( = ?auto_144229 ?auto_144228 ) ) ( not ( = ?auto_144229 ?auto_144226 ) ) ( not ( = ?auto_144229 ?auto_144225 ) ) ( not ( = ?auto_144227 ?auto_144228 ) ) ( not ( = ?auto_144227 ?auto_144226 ) ) ( not ( = ?auto_144227 ?auto_144225 ) ) ( not ( = ?auto_144222 ?auto_144229 ) ) ( not ( = ?auto_144222 ?auto_144227 ) ) ( not ( = ?auto_144223 ?auto_144229 ) ) ( not ( = ?auto_144223 ?auto_144227 ) ) ( not ( = ?auto_144224 ?auto_144229 ) ) ( not ( = ?auto_144224 ?auto_144227 ) ) ( ON ?auto_144222 ?auto_144230 ) ( not ( = ?auto_144222 ?auto_144230 ) ) ( not ( = ?auto_144223 ?auto_144230 ) ) ( not ( = ?auto_144224 ?auto_144230 ) ) ( not ( = ?auto_144225 ?auto_144230 ) ) ( not ( = ?auto_144226 ?auto_144230 ) ) ( not ( = ?auto_144228 ?auto_144230 ) ) ( not ( = ?auto_144229 ?auto_144230 ) ) ( not ( = ?auto_144227 ?auto_144230 ) ) ( ON ?auto_144223 ?auto_144222 ) ( ON-TABLE ?auto_144230 ) ( ON ?auto_144224 ?auto_144223 ) ( ON ?auto_144225 ?auto_144224 ) ( ON ?auto_144226 ?auto_144225 ) ( ON ?auto_144228 ?auto_144226 ) ( CLEAR ?auto_144228 ) ( HOLDING ?auto_144227 ) ( CLEAR ?auto_144229 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_144229 ?auto_144227 )
      ( MAKE-5PILE ?auto_144222 ?auto_144223 ?auto_144224 ?auto_144225 ?auto_144226 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_144231 - BLOCK
      ?auto_144232 - BLOCK
      ?auto_144233 - BLOCK
      ?auto_144234 - BLOCK
      ?auto_144235 - BLOCK
    )
    :vars
    (
      ?auto_144236 - BLOCK
      ?auto_144238 - BLOCK
      ?auto_144239 - BLOCK
      ?auto_144237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144231 ?auto_144232 ) ) ( not ( = ?auto_144231 ?auto_144233 ) ) ( not ( = ?auto_144231 ?auto_144234 ) ) ( not ( = ?auto_144231 ?auto_144235 ) ) ( not ( = ?auto_144232 ?auto_144233 ) ) ( not ( = ?auto_144232 ?auto_144234 ) ) ( not ( = ?auto_144232 ?auto_144235 ) ) ( not ( = ?auto_144233 ?auto_144234 ) ) ( not ( = ?auto_144233 ?auto_144235 ) ) ( not ( = ?auto_144234 ?auto_144235 ) ) ( not ( = ?auto_144231 ?auto_144236 ) ) ( not ( = ?auto_144232 ?auto_144236 ) ) ( not ( = ?auto_144233 ?auto_144236 ) ) ( not ( = ?auto_144234 ?auto_144236 ) ) ( not ( = ?auto_144235 ?auto_144236 ) ) ( ON-TABLE ?auto_144238 ) ( not ( = ?auto_144238 ?auto_144239 ) ) ( not ( = ?auto_144238 ?auto_144236 ) ) ( not ( = ?auto_144238 ?auto_144235 ) ) ( not ( = ?auto_144238 ?auto_144234 ) ) ( not ( = ?auto_144239 ?auto_144236 ) ) ( not ( = ?auto_144239 ?auto_144235 ) ) ( not ( = ?auto_144239 ?auto_144234 ) ) ( not ( = ?auto_144231 ?auto_144238 ) ) ( not ( = ?auto_144231 ?auto_144239 ) ) ( not ( = ?auto_144232 ?auto_144238 ) ) ( not ( = ?auto_144232 ?auto_144239 ) ) ( not ( = ?auto_144233 ?auto_144238 ) ) ( not ( = ?auto_144233 ?auto_144239 ) ) ( ON ?auto_144231 ?auto_144237 ) ( not ( = ?auto_144231 ?auto_144237 ) ) ( not ( = ?auto_144232 ?auto_144237 ) ) ( not ( = ?auto_144233 ?auto_144237 ) ) ( not ( = ?auto_144234 ?auto_144237 ) ) ( not ( = ?auto_144235 ?auto_144237 ) ) ( not ( = ?auto_144236 ?auto_144237 ) ) ( not ( = ?auto_144238 ?auto_144237 ) ) ( not ( = ?auto_144239 ?auto_144237 ) ) ( ON ?auto_144232 ?auto_144231 ) ( ON-TABLE ?auto_144237 ) ( ON ?auto_144233 ?auto_144232 ) ( ON ?auto_144234 ?auto_144233 ) ( ON ?auto_144235 ?auto_144234 ) ( ON ?auto_144236 ?auto_144235 ) ( CLEAR ?auto_144238 ) ( ON ?auto_144239 ?auto_144236 ) ( CLEAR ?auto_144239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_144237 ?auto_144231 ?auto_144232 ?auto_144233 ?auto_144234 ?auto_144235 ?auto_144236 )
      ( MAKE-5PILE ?auto_144231 ?auto_144232 ?auto_144233 ?auto_144234 ?auto_144235 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_144240 - BLOCK
      ?auto_144241 - BLOCK
      ?auto_144242 - BLOCK
      ?auto_144243 - BLOCK
      ?auto_144244 - BLOCK
    )
    :vars
    (
      ?auto_144248 - BLOCK
      ?auto_144246 - BLOCK
      ?auto_144245 - BLOCK
      ?auto_144247 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144240 ?auto_144241 ) ) ( not ( = ?auto_144240 ?auto_144242 ) ) ( not ( = ?auto_144240 ?auto_144243 ) ) ( not ( = ?auto_144240 ?auto_144244 ) ) ( not ( = ?auto_144241 ?auto_144242 ) ) ( not ( = ?auto_144241 ?auto_144243 ) ) ( not ( = ?auto_144241 ?auto_144244 ) ) ( not ( = ?auto_144242 ?auto_144243 ) ) ( not ( = ?auto_144242 ?auto_144244 ) ) ( not ( = ?auto_144243 ?auto_144244 ) ) ( not ( = ?auto_144240 ?auto_144248 ) ) ( not ( = ?auto_144241 ?auto_144248 ) ) ( not ( = ?auto_144242 ?auto_144248 ) ) ( not ( = ?auto_144243 ?auto_144248 ) ) ( not ( = ?auto_144244 ?auto_144248 ) ) ( not ( = ?auto_144246 ?auto_144245 ) ) ( not ( = ?auto_144246 ?auto_144248 ) ) ( not ( = ?auto_144246 ?auto_144244 ) ) ( not ( = ?auto_144246 ?auto_144243 ) ) ( not ( = ?auto_144245 ?auto_144248 ) ) ( not ( = ?auto_144245 ?auto_144244 ) ) ( not ( = ?auto_144245 ?auto_144243 ) ) ( not ( = ?auto_144240 ?auto_144246 ) ) ( not ( = ?auto_144240 ?auto_144245 ) ) ( not ( = ?auto_144241 ?auto_144246 ) ) ( not ( = ?auto_144241 ?auto_144245 ) ) ( not ( = ?auto_144242 ?auto_144246 ) ) ( not ( = ?auto_144242 ?auto_144245 ) ) ( ON ?auto_144240 ?auto_144247 ) ( not ( = ?auto_144240 ?auto_144247 ) ) ( not ( = ?auto_144241 ?auto_144247 ) ) ( not ( = ?auto_144242 ?auto_144247 ) ) ( not ( = ?auto_144243 ?auto_144247 ) ) ( not ( = ?auto_144244 ?auto_144247 ) ) ( not ( = ?auto_144248 ?auto_144247 ) ) ( not ( = ?auto_144246 ?auto_144247 ) ) ( not ( = ?auto_144245 ?auto_144247 ) ) ( ON ?auto_144241 ?auto_144240 ) ( ON-TABLE ?auto_144247 ) ( ON ?auto_144242 ?auto_144241 ) ( ON ?auto_144243 ?auto_144242 ) ( ON ?auto_144244 ?auto_144243 ) ( ON ?auto_144248 ?auto_144244 ) ( ON ?auto_144245 ?auto_144248 ) ( CLEAR ?auto_144245 ) ( HOLDING ?auto_144246 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_144246 )
      ( MAKE-5PILE ?auto_144240 ?auto_144241 ?auto_144242 ?auto_144243 ?auto_144244 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_144249 - BLOCK
      ?auto_144250 - BLOCK
      ?auto_144251 - BLOCK
      ?auto_144252 - BLOCK
      ?auto_144253 - BLOCK
    )
    :vars
    (
      ?auto_144257 - BLOCK
      ?auto_144255 - BLOCK
      ?auto_144254 - BLOCK
      ?auto_144256 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144249 ?auto_144250 ) ) ( not ( = ?auto_144249 ?auto_144251 ) ) ( not ( = ?auto_144249 ?auto_144252 ) ) ( not ( = ?auto_144249 ?auto_144253 ) ) ( not ( = ?auto_144250 ?auto_144251 ) ) ( not ( = ?auto_144250 ?auto_144252 ) ) ( not ( = ?auto_144250 ?auto_144253 ) ) ( not ( = ?auto_144251 ?auto_144252 ) ) ( not ( = ?auto_144251 ?auto_144253 ) ) ( not ( = ?auto_144252 ?auto_144253 ) ) ( not ( = ?auto_144249 ?auto_144257 ) ) ( not ( = ?auto_144250 ?auto_144257 ) ) ( not ( = ?auto_144251 ?auto_144257 ) ) ( not ( = ?auto_144252 ?auto_144257 ) ) ( not ( = ?auto_144253 ?auto_144257 ) ) ( not ( = ?auto_144255 ?auto_144254 ) ) ( not ( = ?auto_144255 ?auto_144257 ) ) ( not ( = ?auto_144255 ?auto_144253 ) ) ( not ( = ?auto_144255 ?auto_144252 ) ) ( not ( = ?auto_144254 ?auto_144257 ) ) ( not ( = ?auto_144254 ?auto_144253 ) ) ( not ( = ?auto_144254 ?auto_144252 ) ) ( not ( = ?auto_144249 ?auto_144255 ) ) ( not ( = ?auto_144249 ?auto_144254 ) ) ( not ( = ?auto_144250 ?auto_144255 ) ) ( not ( = ?auto_144250 ?auto_144254 ) ) ( not ( = ?auto_144251 ?auto_144255 ) ) ( not ( = ?auto_144251 ?auto_144254 ) ) ( ON ?auto_144249 ?auto_144256 ) ( not ( = ?auto_144249 ?auto_144256 ) ) ( not ( = ?auto_144250 ?auto_144256 ) ) ( not ( = ?auto_144251 ?auto_144256 ) ) ( not ( = ?auto_144252 ?auto_144256 ) ) ( not ( = ?auto_144253 ?auto_144256 ) ) ( not ( = ?auto_144257 ?auto_144256 ) ) ( not ( = ?auto_144255 ?auto_144256 ) ) ( not ( = ?auto_144254 ?auto_144256 ) ) ( ON ?auto_144250 ?auto_144249 ) ( ON-TABLE ?auto_144256 ) ( ON ?auto_144251 ?auto_144250 ) ( ON ?auto_144252 ?auto_144251 ) ( ON ?auto_144253 ?auto_144252 ) ( ON ?auto_144257 ?auto_144253 ) ( ON ?auto_144254 ?auto_144257 ) ( ON ?auto_144255 ?auto_144254 ) ( CLEAR ?auto_144255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_144256 ?auto_144249 ?auto_144250 ?auto_144251 ?auto_144252 ?auto_144253 ?auto_144257 ?auto_144254 )
      ( MAKE-5PILE ?auto_144249 ?auto_144250 ?auto_144251 ?auto_144252 ?auto_144253 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144260 - BLOCK
      ?auto_144261 - BLOCK
    )
    :vars
    (
      ?auto_144262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144262 ?auto_144261 ) ( CLEAR ?auto_144262 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_144260 ) ( ON ?auto_144261 ?auto_144260 ) ( not ( = ?auto_144260 ?auto_144261 ) ) ( not ( = ?auto_144260 ?auto_144262 ) ) ( not ( = ?auto_144261 ?auto_144262 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_144262 ?auto_144261 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144263 - BLOCK
      ?auto_144264 - BLOCK
    )
    :vars
    (
      ?auto_144265 - BLOCK
      ?auto_144266 - BLOCK
      ?auto_144267 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144265 ?auto_144264 ) ( CLEAR ?auto_144265 ) ( ON-TABLE ?auto_144263 ) ( ON ?auto_144264 ?auto_144263 ) ( not ( = ?auto_144263 ?auto_144264 ) ) ( not ( = ?auto_144263 ?auto_144265 ) ) ( not ( = ?auto_144264 ?auto_144265 ) ) ( HOLDING ?auto_144266 ) ( CLEAR ?auto_144267 ) ( not ( = ?auto_144263 ?auto_144266 ) ) ( not ( = ?auto_144263 ?auto_144267 ) ) ( not ( = ?auto_144264 ?auto_144266 ) ) ( not ( = ?auto_144264 ?auto_144267 ) ) ( not ( = ?auto_144265 ?auto_144266 ) ) ( not ( = ?auto_144265 ?auto_144267 ) ) ( not ( = ?auto_144266 ?auto_144267 ) ) )
    :subtasks
    ( ( !STACK ?auto_144266 ?auto_144267 )
      ( MAKE-2PILE ?auto_144263 ?auto_144264 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144268 - BLOCK
      ?auto_144269 - BLOCK
    )
    :vars
    (
      ?auto_144270 - BLOCK
      ?auto_144272 - BLOCK
      ?auto_144271 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144270 ?auto_144269 ) ( ON-TABLE ?auto_144268 ) ( ON ?auto_144269 ?auto_144268 ) ( not ( = ?auto_144268 ?auto_144269 ) ) ( not ( = ?auto_144268 ?auto_144270 ) ) ( not ( = ?auto_144269 ?auto_144270 ) ) ( CLEAR ?auto_144272 ) ( not ( = ?auto_144268 ?auto_144271 ) ) ( not ( = ?auto_144268 ?auto_144272 ) ) ( not ( = ?auto_144269 ?auto_144271 ) ) ( not ( = ?auto_144269 ?auto_144272 ) ) ( not ( = ?auto_144270 ?auto_144271 ) ) ( not ( = ?auto_144270 ?auto_144272 ) ) ( not ( = ?auto_144271 ?auto_144272 ) ) ( ON ?auto_144271 ?auto_144270 ) ( CLEAR ?auto_144271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_144268 ?auto_144269 ?auto_144270 )
      ( MAKE-2PILE ?auto_144268 ?auto_144269 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144273 - BLOCK
      ?auto_144274 - BLOCK
    )
    :vars
    (
      ?auto_144277 - BLOCK
      ?auto_144275 - BLOCK
      ?auto_144276 - BLOCK
      ?auto_144280 - BLOCK
      ?auto_144278 - BLOCK
      ?auto_144279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144277 ?auto_144274 ) ( ON-TABLE ?auto_144273 ) ( ON ?auto_144274 ?auto_144273 ) ( not ( = ?auto_144273 ?auto_144274 ) ) ( not ( = ?auto_144273 ?auto_144277 ) ) ( not ( = ?auto_144274 ?auto_144277 ) ) ( not ( = ?auto_144273 ?auto_144275 ) ) ( not ( = ?auto_144273 ?auto_144276 ) ) ( not ( = ?auto_144274 ?auto_144275 ) ) ( not ( = ?auto_144274 ?auto_144276 ) ) ( not ( = ?auto_144277 ?auto_144275 ) ) ( not ( = ?auto_144277 ?auto_144276 ) ) ( not ( = ?auto_144275 ?auto_144276 ) ) ( ON ?auto_144275 ?auto_144277 ) ( CLEAR ?auto_144275 ) ( HOLDING ?auto_144276 ) ( CLEAR ?auto_144280 ) ( ON-TABLE ?auto_144278 ) ( ON ?auto_144279 ?auto_144278 ) ( ON ?auto_144280 ?auto_144279 ) ( not ( = ?auto_144278 ?auto_144279 ) ) ( not ( = ?auto_144278 ?auto_144280 ) ) ( not ( = ?auto_144278 ?auto_144276 ) ) ( not ( = ?auto_144279 ?auto_144280 ) ) ( not ( = ?auto_144279 ?auto_144276 ) ) ( not ( = ?auto_144280 ?auto_144276 ) ) ( not ( = ?auto_144273 ?auto_144280 ) ) ( not ( = ?auto_144273 ?auto_144278 ) ) ( not ( = ?auto_144273 ?auto_144279 ) ) ( not ( = ?auto_144274 ?auto_144280 ) ) ( not ( = ?auto_144274 ?auto_144278 ) ) ( not ( = ?auto_144274 ?auto_144279 ) ) ( not ( = ?auto_144277 ?auto_144280 ) ) ( not ( = ?auto_144277 ?auto_144278 ) ) ( not ( = ?auto_144277 ?auto_144279 ) ) ( not ( = ?auto_144275 ?auto_144280 ) ) ( not ( = ?auto_144275 ?auto_144278 ) ) ( not ( = ?auto_144275 ?auto_144279 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_144278 ?auto_144279 ?auto_144280 ?auto_144276 )
      ( MAKE-2PILE ?auto_144273 ?auto_144274 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144281 - BLOCK
      ?auto_144282 - BLOCK
    )
    :vars
    (
      ?auto_144283 - BLOCK
      ?auto_144284 - BLOCK
      ?auto_144285 - BLOCK
      ?auto_144288 - BLOCK
      ?auto_144287 - BLOCK
      ?auto_144286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144283 ?auto_144282 ) ( ON-TABLE ?auto_144281 ) ( ON ?auto_144282 ?auto_144281 ) ( not ( = ?auto_144281 ?auto_144282 ) ) ( not ( = ?auto_144281 ?auto_144283 ) ) ( not ( = ?auto_144282 ?auto_144283 ) ) ( not ( = ?auto_144281 ?auto_144284 ) ) ( not ( = ?auto_144281 ?auto_144285 ) ) ( not ( = ?auto_144282 ?auto_144284 ) ) ( not ( = ?auto_144282 ?auto_144285 ) ) ( not ( = ?auto_144283 ?auto_144284 ) ) ( not ( = ?auto_144283 ?auto_144285 ) ) ( not ( = ?auto_144284 ?auto_144285 ) ) ( ON ?auto_144284 ?auto_144283 ) ( CLEAR ?auto_144288 ) ( ON-TABLE ?auto_144287 ) ( ON ?auto_144286 ?auto_144287 ) ( ON ?auto_144288 ?auto_144286 ) ( not ( = ?auto_144287 ?auto_144286 ) ) ( not ( = ?auto_144287 ?auto_144288 ) ) ( not ( = ?auto_144287 ?auto_144285 ) ) ( not ( = ?auto_144286 ?auto_144288 ) ) ( not ( = ?auto_144286 ?auto_144285 ) ) ( not ( = ?auto_144288 ?auto_144285 ) ) ( not ( = ?auto_144281 ?auto_144288 ) ) ( not ( = ?auto_144281 ?auto_144287 ) ) ( not ( = ?auto_144281 ?auto_144286 ) ) ( not ( = ?auto_144282 ?auto_144288 ) ) ( not ( = ?auto_144282 ?auto_144287 ) ) ( not ( = ?auto_144282 ?auto_144286 ) ) ( not ( = ?auto_144283 ?auto_144288 ) ) ( not ( = ?auto_144283 ?auto_144287 ) ) ( not ( = ?auto_144283 ?auto_144286 ) ) ( not ( = ?auto_144284 ?auto_144288 ) ) ( not ( = ?auto_144284 ?auto_144287 ) ) ( not ( = ?auto_144284 ?auto_144286 ) ) ( ON ?auto_144285 ?auto_144284 ) ( CLEAR ?auto_144285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_144281 ?auto_144282 ?auto_144283 ?auto_144284 )
      ( MAKE-2PILE ?auto_144281 ?auto_144282 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144289 - BLOCK
      ?auto_144290 - BLOCK
    )
    :vars
    (
      ?auto_144296 - BLOCK
      ?auto_144294 - BLOCK
      ?auto_144292 - BLOCK
      ?auto_144293 - BLOCK
      ?auto_144295 - BLOCK
      ?auto_144291 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144296 ?auto_144290 ) ( ON-TABLE ?auto_144289 ) ( ON ?auto_144290 ?auto_144289 ) ( not ( = ?auto_144289 ?auto_144290 ) ) ( not ( = ?auto_144289 ?auto_144296 ) ) ( not ( = ?auto_144290 ?auto_144296 ) ) ( not ( = ?auto_144289 ?auto_144294 ) ) ( not ( = ?auto_144289 ?auto_144292 ) ) ( not ( = ?auto_144290 ?auto_144294 ) ) ( not ( = ?auto_144290 ?auto_144292 ) ) ( not ( = ?auto_144296 ?auto_144294 ) ) ( not ( = ?auto_144296 ?auto_144292 ) ) ( not ( = ?auto_144294 ?auto_144292 ) ) ( ON ?auto_144294 ?auto_144296 ) ( ON-TABLE ?auto_144293 ) ( ON ?auto_144295 ?auto_144293 ) ( not ( = ?auto_144293 ?auto_144295 ) ) ( not ( = ?auto_144293 ?auto_144291 ) ) ( not ( = ?auto_144293 ?auto_144292 ) ) ( not ( = ?auto_144295 ?auto_144291 ) ) ( not ( = ?auto_144295 ?auto_144292 ) ) ( not ( = ?auto_144291 ?auto_144292 ) ) ( not ( = ?auto_144289 ?auto_144291 ) ) ( not ( = ?auto_144289 ?auto_144293 ) ) ( not ( = ?auto_144289 ?auto_144295 ) ) ( not ( = ?auto_144290 ?auto_144291 ) ) ( not ( = ?auto_144290 ?auto_144293 ) ) ( not ( = ?auto_144290 ?auto_144295 ) ) ( not ( = ?auto_144296 ?auto_144291 ) ) ( not ( = ?auto_144296 ?auto_144293 ) ) ( not ( = ?auto_144296 ?auto_144295 ) ) ( not ( = ?auto_144294 ?auto_144291 ) ) ( not ( = ?auto_144294 ?auto_144293 ) ) ( not ( = ?auto_144294 ?auto_144295 ) ) ( ON ?auto_144292 ?auto_144294 ) ( CLEAR ?auto_144292 ) ( HOLDING ?auto_144291 ) ( CLEAR ?auto_144295 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_144293 ?auto_144295 ?auto_144291 )
      ( MAKE-2PILE ?auto_144289 ?auto_144290 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144297 - BLOCK
      ?auto_144298 - BLOCK
    )
    :vars
    (
      ?auto_144301 - BLOCK
      ?auto_144302 - BLOCK
      ?auto_144303 - BLOCK
      ?auto_144304 - BLOCK
      ?auto_144299 - BLOCK
      ?auto_144300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144301 ?auto_144298 ) ( ON-TABLE ?auto_144297 ) ( ON ?auto_144298 ?auto_144297 ) ( not ( = ?auto_144297 ?auto_144298 ) ) ( not ( = ?auto_144297 ?auto_144301 ) ) ( not ( = ?auto_144298 ?auto_144301 ) ) ( not ( = ?auto_144297 ?auto_144302 ) ) ( not ( = ?auto_144297 ?auto_144303 ) ) ( not ( = ?auto_144298 ?auto_144302 ) ) ( not ( = ?auto_144298 ?auto_144303 ) ) ( not ( = ?auto_144301 ?auto_144302 ) ) ( not ( = ?auto_144301 ?auto_144303 ) ) ( not ( = ?auto_144302 ?auto_144303 ) ) ( ON ?auto_144302 ?auto_144301 ) ( ON-TABLE ?auto_144304 ) ( ON ?auto_144299 ?auto_144304 ) ( not ( = ?auto_144304 ?auto_144299 ) ) ( not ( = ?auto_144304 ?auto_144300 ) ) ( not ( = ?auto_144304 ?auto_144303 ) ) ( not ( = ?auto_144299 ?auto_144300 ) ) ( not ( = ?auto_144299 ?auto_144303 ) ) ( not ( = ?auto_144300 ?auto_144303 ) ) ( not ( = ?auto_144297 ?auto_144300 ) ) ( not ( = ?auto_144297 ?auto_144304 ) ) ( not ( = ?auto_144297 ?auto_144299 ) ) ( not ( = ?auto_144298 ?auto_144300 ) ) ( not ( = ?auto_144298 ?auto_144304 ) ) ( not ( = ?auto_144298 ?auto_144299 ) ) ( not ( = ?auto_144301 ?auto_144300 ) ) ( not ( = ?auto_144301 ?auto_144304 ) ) ( not ( = ?auto_144301 ?auto_144299 ) ) ( not ( = ?auto_144302 ?auto_144300 ) ) ( not ( = ?auto_144302 ?auto_144304 ) ) ( not ( = ?auto_144302 ?auto_144299 ) ) ( ON ?auto_144303 ?auto_144302 ) ( CLEAR ?auto_144299 ) ( ON ?auto_144300 ?auto_144303 ) ( CLEAR ?auto_144300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_144297 ?auto_144298 ?auto_144301 ?auto_144302 ?auto_144303 )
      ( MAKE-2PILE ?auto_144297 ?auto_144298 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144305 - BLOCK
      ?auto_144306 - BLOCK
    )
    :vars
    (
      ?auto_144311 - BLOCK
      ?auto_144310 - BLOCK
      ?auto_144307 - BLOCK
      ?auto_144308 - BLOCK
      ?auto_144309 - BLOCK
      ?auto_144312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144311 ?auto_144306 ) ( ON-TABLE ?auto_144305 ) ( ON ?auto_144306 ?auto_144305 ) ( not ( = ?auto_144305 ?auto_144306 ) ) ( not ( = ?auto_144305 ?auto_144311 ) ) ( not ( = ?auto_144306 ?auto_144311 ) ) ( not ( = ?auto_144305 ?auto_144310 ) ) ( not ( = ?auto_144305 ?auto_144307 ) ) ( not ( = ?auto_144306 ?auto_144310 ) ) ( not ( = ?auto_144306 ?auto_144307 ) ) ( not ( = ?auto_144311 ?auto_144310 ) ) ( not ( = ?auto_144311 ?auto_144307 ) ) ( not ( = ?auto_144310 ?auto_144307 ) ) ( ON ?auto_144310 ?auto_144311 ) ( ON-TABLE ?auto_144308 ) ( not ( = ?auto_144308 ?auto_144309 ) ) ( not ( = ?auto_144308 ?auto_144312 ) ) ( not ( = ?auto_144308 ?auto_144307 ) ) ( not ( = ?auto_144309 ?auto_144312 ) ) ( not ( = ?auto_144309 ?auto_144307 ) ) ( not ( = ?auto_144312 ?auto_144307 ) ) ( not ( = ?auto_144305 ?auto_144312 ) ) ( not ( = ?auto_144305 ?auto_144308 ) ) ( not ( = ?auto_144305 ?auto_144309 ) ) ( not ( = ?auto_144306 ?auto_144312 ) ) ( not ( = ?auto_144306 ?auto_144308 ) ) ( not ( = ?auto_144306 ?auto_144309 ) ) ( not ( = ?auto_144311 ?auto_144312 ) ) ( not ( = ?auto_144311 ?auto_144308 ) ) ( not ( = ?auto_144311 ?auto_144309 ) ) ( not ( = ?auto_144310 ?auto_144312 ) ) ( not ( = ?auto_144310 ?auto_144308 ) ) ( not ( = ?auto_144310 ?auto_144309 ) ) ( ON ?auto_144307 ?auto_144310 ) ( ON ?auto_144312 ?auto_144307 ) ( CLEAR ?auto_144312 ) ( HOLDING ?auto_144309 ) ( CLEAR ?auto_144308 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_144308 ?auto_144309 )
      ( MAKE-2PILE ?auto_144305 ?auto_144306 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144313 - BLOCK
      ?auto_144314 - BLOCK
    )
    :vars
    (
      ?auto_144315 - BLOCK
      ?auto_144316 - BLOCK
      ?auto_144317 - BLOCK
      ?auto_144319 - BLOCK
      ?auto_144320 - BLOCK
      ?auto_144318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144315 ?auto_144314 ) ( ON-TABLE ?auto_144313 ) ( ON ?auto_144314 ?auto_144313 ) ( not ( = ?auto_144313 ?auto_144314 ) ) ( not ( = ?auto_144313 ?auto_144315 ) ) ( not ( = ?auto_144314 ?auto_144315 ) ) ( not ( = ?auto_144313 ?auto_144316 ) ) ( not ( = ?auto_144313 ?auto_144317 ) ) ( not ( = ?auto_144314 ?auto_144316 ) ) ( not ( = ?auto_144314 ?auto_144317 ) ) ( not ( = ?auto_144315 ?auto_144316 ) ) ( not ( = ?auto_144315 ?auto_144317 ) ) ( not ( = ?auto_144316 ?auto_144317 ) ) ( ON ?auto_144316 ?auto_144315 ) ( ON-TABLE ?auto_144319 ) ( not ( = ?auto_144319 ?auto_144320 ) ) ( not ( = ?auto_144319 ?auto_144318 ) ) ( not ( = ?auto_144319 ?auto_144317 ) ) ( not ( = ?auto_144320 ?auto_144318 ) ) ( not ( = ?auto_144320 ?auto_144317 ) ) ( not ( = ?auto_144318 ?auto_144317 ) ) ( not ( = ?auto_144313 ?auto_144318 ) ) ( not ( = ?auto_144313 ?auto_144319 ) ) ( not ( = ?auto_144313 ?auto_144320 ) ) ( not ( = ?auto_144314 ?auto_144318 ) ) ( not ( = ?auto_144314 ?auto_144319 ) ) ( not ( = ?auto_144314 ?auto_144320 ) ) ( not ( = ?auto_144315 ?auto_144318 ) ) ( not ( = ?auto_144315 ?auto_144319 ) ) ( not ( = ?auto_144315 ?auto_144320 ) ) ( not ( = ?auto_144316 ?auto_144318 ) ) ( not ( = ?auto_144316 ?auto_144319 ) ) ( not ( = ?auto_144316 ?auto_144320 ) ) ( ON ?auto_144317 ?auto_144316 ) ( ON ?auto_144318 ?auto_144317 ) ( CLEAR ?auto_144319 ) ( ON ?auto_144320 ?auto_144318 ) ( CLEAR ?auto_144320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_144313 ?auto_144314 ?auto_144315 ?auto_144316 ?auto_144317 ?auto_144318 )
      ( MAKE-2PILE ?auto_144313 ?auto_144314 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144321 - BLOCK
      ?auto_144322 - BLOCK
    )
    :vars
    (
      ?auto_144324 - BLOCK
      ?auto_144326 - BLOCK
      ?auto_144327 - BLOCK
      ?auto_144328 - BLOCK
      ?auto_144323 - BLOCK
      ?auto_144325 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144324 ?auto_144322 ) ( ON-TABLE ?auto_144321 ) ( ON ?auto_144322 ?auto_144321 ) ( not ( = ?auto_144321 ?auto_144322 ) ) ( not ( = ?auto_144321 ?auto_144324 ) ) ( not ( = ?auto_144322 ?auto_144324 ) ) ( not ( = ?auto_144321 ?auto_144326 ) ) ( not ( = ?auto_144321 ?auto_144327 ) ) ( not ( = ?auto_144322 ?auto_144326 ) ) ( not ( = ?auto_144322 ?auto_144327 ) ) ( not ( = ?auto_144324 ?auto_144326 ) ) ( not ( = ?auto_144324 ?auto_144327 ) ) ( not ( = ?auto_144326 ?auto_144327 ) ) ( ON ?auto_144326 ?auto_144324 ) ( not ( = ?auto_144328 ?auto_144323 ) ) ( not ( = ?auto_144328 ?auto_144325 ) ) ( not ( = ?auto_144328 ?auto_144327 ) ) ( not ( = ?auto_144323 ?auto_144325 ) ) ( not ( = ?auto_144323 ?auto_144327 ) ) ( not ( = ?auto_144325 ?auto_144327 ) ) ( not ( = ?auto_144321 ?auto_144325 ) ) ( not ( = ?auto_144321 ?auto_144328 ) ) ( not ( = ?auto_144321 ?auto_144323 ) ) ( not ( = ?auto_144322 ?auto_144325 ) ) ( not ( = ?auto_144322 ?auto_144328 ) ) ( not ( = ?auto_144322 ?auto_144323 ) ) ( not ( = ?auto_144324 ?auto_144325 ) ) ( not ( = ?auto_144324 ?auto_144328 ) ) ( not ( = ?auto_144324 ?auto_144323 ) ) ( not ( = ?auto_144326 ?auto_144325 ) ) ( not ( = ?auto_144326 ?auto_144328 ) ) ( not ( = ?auto_144326 ?auto_144323 ) ) ( ON ?auto_144327 ?auto_144326 ) ( ON ?auto_144325 ?auto_144327 ) ( ON ?auto_144323 ?auto_144325 ) ( CLEAR ?auto_144323 ) ( HOLDING ?auto_144328 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_144328 )
      ( MAKE-2PILE ?auto_144321 ?auto_144322 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144329 - BLOCK
      ?auto_144330 - BLOCK
    )
    :vars
    (
      ?auto_144336 - BLOCK
      ?auto_144334 - BLOCK
      ?auto_144331 - BLOCK
      ?auto_144333 - BLOCK
      ?auto_144335 - BLOCK
      ?auto_144332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144336 ?auto_144330 ) ( ON-TABLE ?auto_144329 ) ( ON ?auto_144330 ?auto_144329 ) ( not ( = ?auto_144329 ?auto_144330 ) ) ( not ( = ?auto_144329 ?auto_144336 ) ) ( not ( = ?auto_144330 ?auto_144336 ) ) ( not ( = ?auto_144329 ?auto_144334 ) ) ( not ( = ?auto_144329 ?auto_144331 ) ) ( not ( = ?auto_144330 ?auto_144334 ) ) ( not ( = ?auto_144330 ?auto_144331 ) ) ( not ( = ?auto_144336 ?auto_144334 ) ) ( not ( = ?auto_144336 ?auto_144331 ) ) ( not ( = ?auto_144334 ?auto_144331 ) ) ( ON ?auto_144334 ?auto_144336 ) ( not ( = ?auto_144333 ?auto_144335 ) ) ( not ( = ?auto_144333 ?auto_144332 ) ) ( not ( = ?auto_144333 ?auto_144331 ) ) ( not ( = ?auto_144335 ?auto_144332 ) ) ( not ( = ?auto_144335 ?auto_144331 ) ) ( not ( = ?auto_144332 ?auto_144331 ) ) ( not ( = ?auto_144329 ?auto_144332 ) ) ( not ( = ?auto_144329 ?auto_144333 ) ) ( not ( = ?auto_144329 ?auto_144335 ) ) ( not ( = ?auto_144330 ?auto_144332 ) ) ( not ( = ?auto_144330 ?auto_144333 ) ) ( not ( = ?auto_144330 ?auto_144335 ) ) ( not ( = ?auto_144336 ?auto_144332 ) ) ( not ( = ?auto_144336 ?auto_144333 ) ) ( not ( = ?auto_144336 ?auto_144335 ) ) ( not ( = ?auto_144334 ?auto_144332 ) ) ( not ( = ?auto_144334 ?auto_144333 ) ) ( not ( = ?auto_144334 ?auto_144335 ) ) ( ON ?auto_144331 ?auto_144334 ) ( ON ?auto_144332 ?auto_144331 ) ( ON ?auto_144335 ?auto_144332 ) ( ON ?auto_144333 ?auto_144335 ) ( CLEAR ?auto_144333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_144329 ?auto_144330 ?auto_144336 ?auto_144334 ?auto_144331 ?auto_144332 ?auto_144335 )
      ( MAKE-2PILE ?auto_144329 ?auto_144330 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144337 - BLOCK
      ?auto_144338 - BLOCK
    )
    :vars
    (
      ?auto_144340 - BLOCK
      ?auto_144343 - BLOCK
      ?auto_144339 - BLOCK
      ?auto_144342 - BLOCK
      ?auto_144344 - BLOCK
      ?auto_144341 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144340 ?auto_144338 ) ( ON-TABLE ?auto_144337 ) ( ON ?auto_144338 ?auto_144337 ) ( not ( = ?auto_144337 ?auto_144338 ) ) ( not ( = ?auto_144337 ?auto_144340 ) ) ( not ( = ?auto_144338 ?auto_144340 ) ) ( not ( = ?auto_144337 ?auto_144343 ) ) ( not ( = ?auto_144337 ?auto_144339 ) ) ( not ( = ?auto_144338 ?auto_144343 ) ) ( not ( = ?auto_144338 ?auto_144339 ) ) ( not ( = ?auto_144340 ?auto_144343 ) ) ( not ( = ?auto_144340 ?auto_144339 ) ) ( not ( = ?auto_144343 ?auto_144339 ) ) ( ON ?auto_144343 ?auto_144340 ) ( not ( = ?auto_144342 ?auto_144344 ) ) ( not ( = ?auto_144342 ?auto_144341 ) ) ( not ( = ?auto_144342 ?auto_144339 ) ) ( not ( = ?auto_144344 ?auto_144341 ) ) ( not ( = ?auto_144344 ?auto_144339 ) ) ( not ( = ?auto_144341 ?auto_144339 ) ) ( not ( = ?auto_144337 ?auto_144341 ) ) ( not ( = ?auto_144337 ?auto_144342 ) ) ( not ( = ?auto_144337 ?auto_144344 ) ) ( not ( = ?auto_144338 ?auto_144341 ) ) ( not ( = ?auto_144338 ?auto_144342 ) ) ( not ( = ?auto_144338 ?auto_144344 ) ) ( not ( = ?auto_144340 ?auto_144341 ) ) ( not ( = ?auto_144340 ?auto_144342 ) ) ( not ( = ?auto_144340 ?auto_144344 ) ) ( not ( = ?auto_144343 ?auto_144341 ) ) ( not ( = ?auto_144343 ?auto_144342 ) ) ( not ( = ?auto_144343 ?auto_144344 ) ) ( ON ?auto_144339 ?auto_144343 ) ( ON ?auto_144341 ?auto_144339 ) ( ON ?auto_144344 ?auto_144341 ) ( HOLDING ?auto_144342 ) ( CLEAR ?auto_144344 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_144337 ?auto_144338 ?auto_144340 ?auto_144343 ?auto_144339 ?auto_144341 ?auto_144344 ?auto_144342 )
      ( MAKE-2PILE ?auto_144337 ?auto_144338 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144345 - BLOCK
      ?auto_144346 - BLOCK
    )
    :vars
    (
      ?auto_144351 - BLOCK
      ?auto_144350 - BLOCK
      ?auto_144352 - BLOCK
      ?auto_144347 - BLOCK
      ?auto_144348 - BLOCK
      ?auto_144349 - BLOCK
      ?auto_144353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144351 ?auto_144346 ) ( ON-TABLE ?auto_144345 ) ( ON ?auto_144346 ?auto_144345 ) ( not ( = ?auto_144345 ?auto_144346 ) ) ( not ( = ?auto_144345 ?auto_144351 ) ) ( not ( = ?auto_144346 ?auto_144351 ) ) ( not ( = ?auto_144345 ?auto_144350 ) ) ( not ( = ?auto_144345 ?auto_144352 ) ) ( not ( = ?auto_144346 ?auto_144350 ) ) ( not ( = ?auto_144346 ?auto_144352 ) ) ( not ( = ?auto_144351 ?auto_144350 ) ) ( not ( = ?auto_144351 ?auto_144352 ) ) ( not ( = ?auto_144350 ?auto_144352 ) ) ( ON ?auto_144350 ?auto_144351 ) ( not ( = ?auto_144347 ?auto_144348 ) ) ( not ( = ?auto_144347 ?auto_144349 ) ) ( not ( = ?auto_144347 ?auto_144352 ) ) ( not ( = ?auto_144348 ?auto_144349 ) ) ( not ( = ?auto_144348 ?auto_144352 ) ) ( not ( = ?auto_144349 ?auto_144352 ) ) ( not ( = ?auto_144345 ?auto_144349 ) ) ( not ( = ?auto_144345 ?auto_144347 ) ) ( not ( = ?auto_144345 ?auto_144348 ) ) ( not ( = ?auto_144346 ?auto_144349 ) ) ( not ( = ?auto_144346 ?auto_144347 ) ) ( not ( = ?auto_144346 ?auto_144348 ) ) ( not ( = ?auto_144351 ?auto_144349 ) ) ( not ( = ?auto_144351 ?auto_144347 ) ) ( not ( = ?auto_144351 ?auto_144348 ) ) ( not ( = ?auto_144350 ?auto_144349 ) ) ( not ( = ?auto_144350 ?auto_144347 ) ) ( not ( = ?auto_144350 ?auto_144348 ) ) ( ON ?auto_144352 ?auto_144350 ) ( ON ?auto_144349 ?auto_144352 ) ( ON ?auto_144348 ?auto_144349 ) ( CLEAR ?auto_144348 ) ( ON ?auto_144347 ?auto_144353 ) ( CLEAR ?auto_144347 ) ( HAND-EMPTY ) ( not ( = ?auto_144345 ?auto_144353 ) ) ( not ( = ?auto_144346 ?auto_144353 ) ) ( not ( = ?auto_144351 ?auto_144353 ) ) ( not ( = ?auto_144350 ?auto_144353 ) ) ( not ( = ?auto_144352 ?auto_144353 ) ) ( not ( = ?auto_144347 ?auto_144353 ) ) ( not ( = ?auto_144348 ?auto_144353 ) ) ( not ( = ?auto_144349 ?auto_144353 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_144347 ?auto_144353 )
      ( MAKE-2PILE ?auto_144345 ?auto_144346 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144354 - BLOCK
      ?auto_144355 - BLOCK
    )
    :vars
    (
      ?auto_144356 - BLOCK
      ?auto_144358 - BLOCK
      ?auto_144361 - BLOCK
      ?auto_144360 - BLOCK
      ?auto_144362 - BLOCK
      ?auto_144357 - BLOCK
      ?auto_144359 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144356 ?auto_144355 ) ( ON-TABLE ?auto_144354 ) ( ON ?auto_144355 ?auto_144354 ) ( not ( = ?auto_144354 ?auto_144355 ) ) ( not ( = ?auto_144354 ?auto_144356 ) ) ( not ( = ?auto_144355 ?auto_144356 ) ) ( not ( = ?auto_144354 ?auto_144358 ) ) ( not ( = ?auto_144354 ?auto_144361 ) ) ( not ( = ?auto_144355 ?auto_144358 ) ) ( not ( = ?auto_144355 ?auto_144361 ) ) ( not ( = ?auto_144356 ?auto_144358 ) ) ( not ( = ?auto_144356 ?auto_144361 ) ) ( not ( = ?auto_144358 ?auto_144361 ) ) ( ON ?auto_144358 ?auto_144356 ) ( not ( = ?auto_144360 ?auto_144362 ) ) ( not ( = ?auto_144360 ?auto_144357 ) ) ( not ( = ?auto_144360 ?auto_144361 ) ) ( not ( = ?auto_144362 ?auto_144357 ) ) ( not ( = ?auto_144362 ?auto_144361 ) ) ( not ( = ?auto_144357 ?auto_144361 ) ) ( not ( = ?auto_144354 ?auto_144357 ) ) ( not ( = ?auto_144354 ?auto_144360 ) ) ( not ( = ?auto_144354 ?auto_144362 ) ) ( not ( = ?auto_144355 ?auto_144357 ) ) ( not ( = ?auto_144355 ?auto_144360 ) ) ( not ( = ?auto_144355 ?auto_144362 ) ) ( not ( = ?auto_144356 ?auto_144357 ) ) ( not ( = ?auto_144356 ?auto_144360 ) ) ( not ( = ?auto_144356 ?auto_144362 ) ) ( not ( = ?auto_144358 ?auto_144357 ) ) ( not ( = ?auto_144358 ?auto_144360 ) ) ( not ( = ?auto_144358 ?auto_144362 ) ) ( ON ?auto_144361 ?auto_144358 ) ( ON ?auto_144357 ?auto_144361 ) ( ON ?auto_144360 ?auto_144359 ) ( CLEAR ?auto_144360 ) ( not ( = ?auto_144354 ?auto_144359 ) ) ( not ( = ?auto_144355 ?auto_144359 ) ) ( not ( = ?auto_144356 ?auto_144359 ) ) ( not ( = ?auto_144358 ?auto_144359 ) ) ( not ( = ?auto_144361 ?auto_144359 ) ) ( not ( = ?auto_144360 ?auto_144359 ) ) ( not ( = ?auto_144362 ?auto_144359 ) ) ( not ( = ?auto_144357 ?auto_144359 ) ) ( HOLDING ?auto_144362 ) ( CLEAR ?auto_144357 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_144354 ?auto_144355 ?auto_144356 ?auto_144358 ?auto_144361 ?auto_144357 ?auto_144362 )
      ( MAKE-2PILE ?auto_144354 ?auto_144355 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144363 - BLOCK
      ?auto_144364 - BLOCK
    )
    :vars
    (
      ?auto_144368 - BLOCK
      ?auto_144365 - BLOCK
      ?auto_144366 - BLOCK
      ?auto_144369 - BLOCK
      ?auto_144371 - BLOCK
      ?auto_144370 - BLOCK
      ?auto_144367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144368 ?auto_144364 ) ( ON-TABLE ?auto_144363 ) ( ON ?auto_144364 ?auto_144363 ) ( not ( = ?auto_144363 ?auto_144364 ) ) ( not ( = ?auto_144363 ?auto_144368 ) ) ( not ( = ?auto_144364 ?auto_144368 ) ) ( not ( = ?auto_144363 ?auto_144365 ) ) ( not ( = ?auto_144363 ?auto_144366 ) ) ( not ( = ?auto_144364 ?auto_144365 ) ) ( not ( = ?auto_144364 ?auto_144366 ) ) ( not ( = ?auto_144368 ?auto_144365 ) ) ( not ( = ?auto_144368 ?auto_144366 ) ) ( not ( = ?auto_144365 ?auto_144366 ) ) ( ON ?auto_144365 ?auto_144368 ) ( not ( = ?auto_144369 ?auto_144371 ) ) ( not ( = ?auto_144369 ?auto_144370 ) ) ( not ( = ?auto_144369 ?auto_144366 ) ) ( not ( = ?auto_144371 ?auto_144370 ) ) ( not ( = ?auto_144371 ?auto_144366 ) ) ( not ( = ?auto_144370 ?auto_144366 ) ) ( not ( = ?auto_144363 ?auto_144370 ) ) ( not ( = ?auto_144363 ?auto_144369 ) ) ( not ( = ?auto_144363 ?auto_144371 ) ) ( not ( = ?auto_144364 ?auto_144370 ) ) ( not ( = ?auto_144364 ?auto_144369 ) ) ( not ( = ?auto_144364 ?auto_144371 ) ) ( not ( = ?auto_144368 ?auto_144370 ) ) ( not ( = ?auto_144368 ?auto_144369 ) ) ( not ( = ?auto_144368 ?auto_144371 ) ) ( not ( = ?auto_144365 ?auto_144370 ) ) ( not ( = ?auto_144365 ?auto_144369 ) ) ( not ( = ?auto_144365 ?auto_144371 ) ) ( ON ?auto_144366 ?auto_144365 ) ( ON ?auto_144370 ?auto_144366 ) ( ON ?auto_144369 ?auto_144367 ) ( not ( = ?auto_144363 ?auto_144367 ) ) ( not ( = ?auto_144364 ?auto_144367 ) ) ( not ( = ?auto_144368 ?auto_144367 ) ) ( not ( = ?auto_144365 ?auto_144367 ) ) ( not ( = ?auto_144366 ?auto_144367 ) ) ( not ( = ?auto_144369 ?auto_144367 ) ) ( not ( = ?auto_144371 ?auto_144367 ) ) ( not ( = ?auto_144370 ?auto_144367 ) ) ( CLEAR ?auto_144370 ) ( ON ?auto_144371 ?auto_144369 ) ( CLEAR ?auto_144371 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_144367 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_144367 ?auto_144369 )
      ( MAKE-2PILE ?auto_144363 ?auto_144364 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144372 - BLOCK
      ?auto_144373 - BLOCK
    )
    :vars
    (
      ?auto_144378 - BLOCK
      ?auto_144380 - BLOCK
      ?auto_144379 - BLOCK
      ?auto_144376 - BLOCK
      ?auto_144375 - BLOCK
      ?auto_144377 - BLOCK
      ?auto_144374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144378 ?auto_144373 ) ( ON-TABLE ?auto_144372 ) ( ON ?auto_144373 ?auto_144372 ) ( not ( = ?auto_144372 ?auto_144373 ) ) ( not ( = ?auto_144372 ?auto_144378 ) ) ( not ( = ?auto_144373 ?auto_144378 ) ) ( not ( = ?auto_144372 ?auto_144380 ) ) ( not ( = ?auto_144372 ?auto_144379 ) ) ( not ( = ?auto_144373 ?auto_144380 ) ) ( not ( = ?auto_144373 ?auto_144379 ) ) ( not ( = ?auto_144378 ?auto_144380 ) ) ( not ( = ?auto_144378 ?auto_144379 ) ) ( not ( = ?auto_144380 ?auto_144379 ) ) ( ON ?auto_144380 ?auto_144378 ) ( not ( = ?auto_144376 ?auto_144375 ) ) ( not ( = ?auto_144376 ?auto_144377 ) ) ( not ( = ?auto_144376 ?auto_144379 ) ) ( not ( = ?auto_144375 ?auto_144377 ) ) ( not ( = ?auto_144375 ?auto_144379 ) ) ( not ( = ?auto_144377 ?auto_144379 ) ) ( not ( = ?auto_144372 ?auto_144377 ) ) ( not ( = ?auto_144372 ?auto_144376 ) ) ( not ( = ?auto_144372 ?auto_144375 ) ) ( not ( = ?auto_144373 ?auto_144377 ) ) ( not ( = ?auto_144373 ?auto_144376 ) ) ( not ( = ?auto_144373 ?auto_144375 ) ) ( not ( = ?auto_144378 ?auto_144377 ) ) ( not ( = ?auto_144378 ?auto_144376 ) ) ( not ( = ?auto_144378 ?auto_144375 ) ) ( not ( = ?auto_144380 ?auto_144377 ) ) ( not ( = ?auto_144380 ?auto_144376 ) ) ( not ( = ?auto_144380 ?auto_144375 ) ) ( ON ?auto_144379 ?auto_144380 ) ( ON ?auto_144376 ?auto_144374 ) ( not ( = ?auto_144372 ?auto_144374 ) ) ( not ( = ?auto_144373 ?auto_144374 ) ) ( not ( = ?auto_144378 ?auto_144374 ) ) ( not ( = ?auto_144380 ?auto_144374 ) ) ( not ( = ?auto_144379 ?auto_144374 ) ) ( not ( = ?auto_144376 ?auto_144374 ) ) ( not ( = ?auto_144375 ?auto_144374 ) ) ( not ( = ?auto_144377 ?auto_144374 ) ) ( ON ?auto_144375 ?auto_144376 ) ( CLEAR ?auto_144375 ) ( ON-TABLE ?auto_144374 ) ( HOLDING ?auto_144377 ) ( CLEAR ?auto_144379 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_144372 ?auto_144373 ?auto_144378 ?auto_144380 ?auto_144379 ?auto_144377 )
      ( MAKE-2PILE ?auto_144372 ?auto_144373 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144381 - BLOCK
      ?auto_144382 - BLOCK
    )
    :vars
    (
      ?auto_144389 - BLOCK
      ?auto_144383 - BLOCK
      ?auto_144386 - BLOCK
      ?auto_144384 - BLOCK
      ?auto_144388 - BLOCK
      ?auto_144387 - BLOCK
      ?auto_144385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144389 ?auto_144382 ) ( ON-TABLE ?auto_144381 ) ( ON ?auto_144382 ?auto_144381 ) ( not ( = ?auto_144381 ?auto_144382 ) ) ( not ( = ?auto_144381 ?auto_144389 ) ) ( not ( = ?auto_144382 ?auto_144389 ) ) ( not ( = ?auto_144381 ?auto_144383 ) ) ( not ( = ?auto_144381 ?auto_144386 ) ) ( not ( = ?auto_144382 ?auto_144383 ) ) ( not ( = ?auto_144382 ?auto_144386 ) ) ( not ( = ?auto_144389 ?auto_144383 ) ) ( not ( = ?auto_144389 ?auto_144386 ) ) ( not ( = ?auto_144383 ?auto_144386 ) ) ( ON ?auto_144383 ?auto_144389 ) ( not ( = ?auto_144384 ?auto_144388 ) ) ( not ( = ?auto_144384 ?auto_144387 ) ) ( not ( = ?auto_144384 ?auto_144386 ) ) ( not ( = ?auto_144388 ?auto_144387 ) ) ( not ( = ?auto_144388 ?auto_144386 ) ) ( not ( = ?auto_144387 ?auto_144386 ) ) ( not ( = ?auto_144381 ?auto_144387 ) ) ( not ( = ?auto_144381 ?auto_144384 ) ) ( not ( = ?auto_144381 ?auto_144388 ) ) ( not ( = ?auto_144382 ?auto_144387 ) ) ( not ( = ?auto_144382 ?auto_144384 ) ) ( not ( = ?auto_144382 ?auto_144388 ) ) ( not ( = ?auto_144389 ?auto_144387 ) ) ( not ( = ?auto_144389 ?auto_144384 ) ) ( not ( = ?auto_144389 ?auto_144388 ) ) ( not ( = ?auto_144383 ?auto_144387 ) ) ( not ( = ?auto_144383 ?auto_144384 ) ) ( not ( = ?auto_144383 ?auto_144388 ) ) ( ON ?auto_144386 ?auto_144383 ) ( ON ?auto_144384 ?auto_144385 ) ( not ( = ?auto_144381 ?auto_144385 ) ) ( not ( = ?auto_144382 ?auto_144385 ) ) ( not ( = ?auto_144389 ?auto_144385 ) ) ( not ( = ?auto_144383 ?auto_144385 ) ) ( not ( = ?auto_144386 ?auto_144385 ) ) ( not ( = ?auto_144384 ?auto_144385 ) ) ( not ( = ?auto_144388 ?auto_144385 ) ) ( not ( = ?auto_144387 ?auto_144385 ) ) ( ON ?auto_144388 ?auto_144384 ) ( ON-TABLE ?auto_144385 ) ( CLEAR ?auto_144386 ) ( ON ?auto_144387 ?auto_144388 ) ( CLEAR ?auto_144387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_144385 ?auto_144384 ?auto_144388 )
      ( MAKE-2PILE ?auto_144381 ?auto_144382 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144390 - BLOCK
      ?auto_144391 - BLOCK
    )
    :vars
    (
      ?auto_144396 - BLOCK
      ?auto_144393 - BLOCK
      ?auto_144397 - BLOCK
      ?auto_144398 - BLOCK
      ?auto_144392 - BLOCK
      ?auto_144394 - BLOCK
      ?auto_144395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144396 ?auto_144391 ) ( ON-TABLE ?auto_144390 ) ( ON ?auto_144391 ?auto_144390 ) ( not ( = ?auto_144390 ?auto_144391 ) ) ( not ( = ?auto_144390 ?auto_144396 ) ) ( not ( = ?auto_144391 ?auto_144396 ) ) ( not ( = ?auto_144390 ?auto_144393 ) ) ( not ( = ?auto_144390 ?auto_144397 ) ) ( not ( = ?auto_144391 ?auto_144393 ) ) ( not ( = ?auto_144391 ?auto_144397 ) ) ( not ( = ?auto_144396 ?auto_144393 ) ) ( not ( = ?auto_144396 ?auto_144397 ) ) ( not ( = ?auto_144393 ?auto_144397 ) ) ( ON ?auto_144393 ?auto_144396 ) ( not ( = ?auto_144398 ?auto_144392 ) ) ( not ( = ?auto_144398 ?auto_144394 ) ) ( not ( = ?auto_144398 ?auto_144397 ) ) ( not ( = ?auto_144392 ?auto_144394 ) ) ( not ( = ?auto_144392 ?auto_144397 ) ) ( not ( = ?auto_144394 ?auto_144397 ) ) ( not ( = ?auto_144390 ?auto_144394 ) ) ( not ( = ?auto_144390 ?auto_144398 ) ) ( not ( = ?auto_144390 ?auto_144392 ) ) ( not ( = ?auto_144391 ?auto_144394 ) ) ( not ( = ?auto_144391 ?auto_144398 ) ) ( not ( = ?auto_144391 ?auto_144392 ) ) ( not ( = ?auto_144396 ?auto_144394 ) ) ( not ( = ?auto_144396 ?auto_144398 ) ) ( not ( = ?auto_144396 ?auto_144392 ) ) ( not ( = ?auto_144393 ?auto_144394 ) ) ( not ( = ?auto_144393 ?auto_144398 ) ) ( not ( = ?auto_144393 ?auto_144392 ) ) ( ON ?auto_144398 ?auto_144395 ) ( not ( = ?auto_144390 ?auto_144395 ) ) ( not ( = ?auto_144391 ?auto_144395 ) ) ( not ( = ?auto_144396 ?auto_144395 ) ) ( not ( = ?auto_144393 ?auto_144395 ) ) ( not ( = ?auto_144397 ?auto_144395 ) ) ( not ( = ?auto_144398 ?auto_144395 ) ) ( not ( = ?auto_144392 ?auto_144395 ) ) ( not ( = ?auto_144394 ?auto_144395 ) ) ( ON ?auto_144392 ?auto_144398 ) ( ON-TABLE ?auto_144395 ) ( ON ?auto_144394 ?auto_144392 ) ( CLEAR ?auto_144394 ) ( HOLDING ?auto_144397 ) ( CLEAR ?auto_144393 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_144390 ?auto_144391 ?auto_144396 ?auto_144393 ?auto_144397 )
      ( MAKE-2PILE ?auto_144390 ?auto_144391 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144399 - BLOCK
      ?auto_144400 - BLOCK
    )
    :vars
    (
      ?auto_144407 - BLOCK
      ?auto_144401 - BLOCK
      ?auto_144405 - BLOCK
      ?auto_144406 - BLOCK
      ?auto_144403 - BLOCK
      ?auto_144404 - BLOCK
      ?auto_144402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144407 ?auto_144400 ) ( ON-TABLE ?auto_144399 ) ( ON ?auto_144400 ?auto_144399 ) ( not ( = ?auto_144399 ?auto_144400 ) ) ( not ( = ?auto_144399 ?auto_144407 ) ) ( not ( = ?auto_144400 ?auto_144407 ) ) ( not ( = ?auto_144399 ?auto_144401 ) ) ( not ( = ?auto_144399 ?auto_144405 ) ) ( not ( = ?auto_144400 ?auto_144401 ) ) ( not ( = ?auto_144400 ?auto_144405 ) ) ( not ( = ?auto_144407 ?auto_144401 ) ) ( not ( = ?auto_144407 ?auto_144405 ) ) ( not ( = ?auto_144401 ?auto_144405 ) ) ( ON ?auto_144401 ?auto_144407 ) ( not ( = ?auto_144406 ?auto_144403 ) ) ( not ( = ?auto_144406 ?auto_144404 ) ) ( not ( = ?auto_144406 ?auto_144405 ) ) ( not ( = ?auto_144403 ?auto_144404 ) ) ( not ( = ?auto_144403 ?auto_144405 ) ) ( not ( = ?auto_144404 ?auto_144405 ) ) ( not ( = ?auto_144399 ?auto_144404 ) ) ( not ( = ?auto_144399 ?auto_144406 ) ) ( not ( = ?auto_144399 ?auto_144403 ) ) ( not ( = ?auto_144400 ?auto_144404 ) ) ( not ( = ?auto_144400 ?auto_144406 ) ) ( not ( = ?auto_144400 ?auto_144403 ) ) ( not ( = ?auto_144407 ?auto_144404 ) ) ( not ( = ?auto_144407 ?auto_144406 ) ) ( not ( = ?auto_144407 ?auto_144403 ) ) ( not ( = ?auto_144401 ?auto_144404 ) ) ( not ( = ?auto_144401 ?auto_144406 ) ) ( not ( = ?auto_144401 ?auto_144403 ) ) ( ON ?auto_144406 ?auto_144402 ) ( not ( = ?auto_144399 ?auto_144402 ) ) ( not ( = ?auto_144400 ?auto_144402 ) ) ( not ( = ?auto_144407 ?auto_144402 ) ) ( not ( = ?auto_144401 ?auto_144402 ) ) ( not ( = ?auto_144405 ?auto_144402 ) ) ( not ( = ?auto_144406 ?auto_144402 ) ) ( not ( = ?auto_144403 ?auto_144402 ) ) ( not ( = ?auto_144404 ?auto_144402 ) ) ( ON ?auto_144403 ?auto_144406 ) ( ON-TABLE ?auto_144402 ) ( ON ?auto_144404 ?auto_144403 ) ( CLEAR ?auto_144401 ) ( ON ?auto_144405 ?auto_144404 ) ( CLEAR ?auto_144405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_144402 ?auto_144406 ?auto_144403 ?auto_144404 )
      ( MAKE-2PILE ?auto_144399 ?auto_144400 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144408 - BLOCK
      ?auto_144409 - BLOCK
    )
    :vars
    (
      ?auto_144416 - BLOCK
      ?auto_144410 - BLOCK
      ?auto_144414 - BLOCK
      ?auto_144412 - BLOCK
      ?auto_144413 - BLOCK
      ?auto_144411 - BLOCK
      ?auto_144415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144416 ?auto_144409 ) ( ON-TABLE ?auto_144408 ) ( ON ?auto_144409 ?auto_144408 ) ( not ( = ?auto_144408 ?auto_144409 ) ) ( not ( = ?auto_144408 ?auto_144416 ) ) ( not ( = ?auto_144409 ?auto_144416 ) ) ( not ( = ?auto_144408 ?auto_144410 ) ) ( not ( = ?auto_144408 ?auto_144414 ) ) ( not ( = ?auto_144409 ?auto_144410 ) ) ( not ( = ?auto_144409 ?auto_144414 ) ) ( not ( = ?auto_144416 ?auto_144410 ) ) ( not ( = ?auto_144416 ?auto_144414 ) ) ( not ( = ?auto_144410 ?auto_144414 ) ) ( not ( = ?auto_144412 ?auto_144413 ) ) ( not ( = ?auto_144412 ?auto_144411 ) ) ( not ( = ?auto_144412 ?auto_144414 ) ) ( not ( = ?auto_144413 ?auto_144411 ) ) ( not ( = ?auto_144413 ?auto_144414 ) ) ( not ( = ?auto_144411 ?auto_144414 ) ) ( not ( = ?auto_144408 ?auto_144411 ) ) ( not ( = ?auto_144408 ?auto_144412 ) ) ( not ( = ?auto_144408 ?auto_144413 ) ) ( not ( = ?auto_144409 ?auto_144411 ) ) ( not ( = ?auto_144409 ?auto_144412 ) ) ( not ( = ?auto_144409 ?auto_144413 ) ) ( not ( = ?auto_144416 ?auto_144411 ) ) ( not ( = ?auto_144416 ?auto_144412 ) ) ( not ( = ?auto_144416 ?auto_144413 ) ) ( not ( = ?auto_144410 ?auto_144411 ) ) ( not ( = ?auto_144410 ?auto_144412 ) ) ( not ( = ?auto_144410 ?auto_144413 ) ) ( ON ?auto_144412 ?auto_144415 ) ( not ( = ?auto_144408 ?auto_144415 ) ) ( not ( = ?auto_144409 ?auto_144415 ) ) ( not ( = ?auto_144416 ?auto_144415 ) ) ( not ( = ?auto_144410 ?auto_144415 ) ) ( not ( = ?auto_144414 ?auto_144415 ) ) ( not ( = ?auto_144412 ?auto_144415 ) ) ( not ( = ?auto_144413 ?auto_144415 ) ) ( not ( = ?auto_144411 ?auto_144415 ) ) ( ON ?auto_144413 ?auto_144412 ) ( ON-TABLE ?auto_144415 ) ( ON ?auto_144411 ?auto_144413 ) ( ON ?auto_144414 ?auto_144411 ) ( CLEAR ?auto_144414 ) ( HOLDING ?auto_144410 ) ( CLEAR ?auto_144416 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_144408 ?auto_144409 ?auto_144416 ?auto_144410 )
      ( MAKE-2PILE ?auto_144408 ?auto_144409 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144417 - BLOCK
      ?auto_144418 - BLOCK
    )
    :vars
    (
      ?auto_144420 - BLOCK
      ?auto_144419 - BLOCK
      ?auto_144424 - BLOCK
      ?auto_144421 - BLOCK
      ?auto_144423 - BLOCK
      ?auto_144425 - BLOCK
      ?auto_144422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144420 ?auto_144418 ) ( ON-TABLE ?auto_144417 ) ( ON ?auto_144418 ?auto_144417 ) ( not ( = ?auto_144417 ?auto_144418 ) ) ( not ( = ?auto_144417 ?auto_144420 ) ) ( not ( = ?auto_144418 ?auto_144420 ) ) ( not ( = ?auto_144417 ?auto_144419 ) ) ( not ( = ?auto_144417 ?auto_144424 ) ) ( not ( = ?auto_144418 ?auto_144419 ) ) ( not ( = ?auto_144418 ?auto_144424 ) ) ( not ( = ?auto_144420 ?auto_144419 ) ) ( not ( = ?auto_144420 ?auto_144424 ) ) ( not ( = ?auto_144419 ?auto_144424 ) ) ( not ( = ?auto_144421 ?auto_144423 ) ) ( not ( = ?auto_144421 ?auto_144425 ) ) ( not ( = ?auto_144421 ?auto_144424 ) ) ( not ( = ?auto_144423 ?auto_144425 ) ) ( not ( = ?auto_144423 ?auto_144424 ) ) ( not ( = ?auto_144425 ?auto_144424 ) ) ( not ( = ?auto_144417 ?auto_144425 ) ) ( not ( = ?auto_144417 ?auto_144421 ) ) ( not ( = ?auto_144417 ?auto_144423 ) ) ( not ( = ?auto_144418 ?auto_144425 ) ) ( not ( = ?auto_144418 ?auto_144421 ) ) ( not ( = ?auto_144418 ?auto_144423 ) ) ( not ( = ?auto_144420 ?auto_144425 ) ) ( not ( = ?auto_144420 ?auto_144421 ) ) ( not ( = ?auto_144420 ?auto_144423 ) ) ( not ( = ?auto_144419 ?auto_144425 ) ) ( not ( = ?auto_144419 ?auto_144421 ) ) ( not ( = ?auto_144419 ?auto_144423 ) ) ( ON ?auto_144421 ?auto_144422 ) ( not ( = ?auto_144417 ?auto_144422 ) ) ( not ( = ?auto_144418 ?auto_144422 ) ) ( not ( = ?auto_144420 ?auto_144422 ) ) ( not ( = ?auto_144419 ?auto_144422 ) ) ( not ( = ?auto_144424 ?auto_144422 ) ) ( not ( = ?auto_144421 ?auto_144422 ) ) ( not ( = ?auto_144423 ?auto_144422 ) ) ( not ( = ?auto_144425 ?auto_144422 ) ) ( ON ?auto_144423 ?auto_144421 ) ( ON-TABLE ?auto_144422 ) ( ON ?auto_144425 ?auto_144423 ) ( ON ?auto_144424 ?auto_144425 ) ( CLEAR ?auto_144420 ) ( ON ?auto_144419 ?auto_144424 ) ( CLEAR ?auto_144419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_144422 ?auto_144421 ?auto_144423 ?auto_144425 ?auto_144424 )
      ( MAKE-2PILE ?auto_144417 ?auto_144418 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144444 - BLOCK
      ?auto_144445 - BLOCK
    )
    :vars
    (
      ?auto_144451 - BLOCK
      ?auto_144448 - BLOCK
      ?auto_144449 - BLOCK
      ?auto_144446 - BLOCK
      ?auto_144450 - BLOCK
      ?auto_144447 - BLOCK
      ?auto_144452 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_144444 ) ( not ( = ?auto_144444 ?auto_144445 ) ) ( not ( = ?auto_144444 ?auto_144451 ) ) ( not ( = ?auto_144445 ?auto_144451 ) ) ( not ( = ?auto_144444 ?auto_144448 ) ) ( not ( = ?auto_144444 ?auto_144449 ) ) ( not ( = ?auto_144445 ?auto_144448 ) ) ( not ( = ?auto_144445 ?auto_144449 ) ) ( not ( = ?auto_144451 ?auto_144448 ) ) ( not ( = ?auto_144451 ?auto_144449 ) ) ( not ( = ?auto_144448 ?auto_144449 ) ) ( not ( = ?auto_144446 ?auto_144450 ) ) ( not ( = ?auto_144446 ?auto_144447 ) ) ( not ( = ?auto_144446 ?auto_144449 ) ) ( not ( = ?auto_144450 ?auto_144447 ) ) ( not ( = ?auto_144450 ?auto_144449 ) ) ( not ( = ?auto_144447 ?auto_144449 ) ) ( not ( = ?auto_144444 ?auto_144447 ) ) ( not ( = ?auto_144444 ?auto_144446 ) ) ( not ( = ?auto_144444 ?auto_144450 ) ) ( not ( = ?auto_144445 ?auto_144447 ) ) ( not ( = ?auto_144445 ?auto_144446 ) ) ( not ( = ?auto_144445 ?auto_144450 ) ) ( not ( = ?auto_144451 ?auto_144447 ) ) ( not ( = ?auto_144451 ?auto_144446 ) ) ( not ( = ?auto_144451 ?auto_144450 ) ) ( not ( = ?auto_144448 ?auto_144447 ) ) ( not ( = ?auto_144448 ?auto_144446 ) ) ( not ( = ?auto_144448 ?auto_144450 ) ) ( ON ?auto_144446 ?auto_144452 ) ( not ( = ?auto_144444 ?auto_144452 ) ) ( not ( = ?auto_144445 ?auto_144452 ) ) ( not ( = ?auto_144451 ?auto_144452 ) ) ( not ( = ?auto_144448 ?auto_144452 ) ) ( not ( = ?auto_144449 ?auto_144452 ) ) ( not ( = ?auto_144446 ?auto_144452 ) ) ( not ( = ?auto_144450 ?auto_144452 ) ) ( not ( = ?auto_144447 ?auto_144452 ) ) ( ON ?auto_144450 ?auto_144446 ) ( ON-TABLE ?auto_144452 ) ( ON ?auto_144447 ?auto_144450 ) ( ON ?auto_144449 ?auto_144447 ) ( ON ?auto_144448 ?auto_144449 ) ( ON ?auto_144451 ?auto_144448 ) ( CLEAR ?auto_144451 ) ( HOLDING ?auto_144445 ) ( CLEAR ?auto_144444 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_144444 ?auto_144445 ?auto_144451 )
      ( MAKE-2PILE ?auto_144444 ?auto_144445 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144453 - BLOCK
      ?auto_144454 - BLOCK
    )
    :vars
    (
      ?auto_144455 - BLOCK
      ?auto_144457 - BLOCK
      ?auto_144459 - BLOCK
      ?auto_144456 - BLOCK
      ?auto_144461 - BLOCK
      ?auto_144458 - BLOCK
      ?auto_144460 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_144453 ) ( not ( = ?auto_144453 ?auto_144454 ) ) ( not ( = ?auto_144453 ?auto_144455 ) ) ( not ( = ?auto_144454 ?auto_144455 ) ) ( not ( = ?auto_144453 ?auto_144457 ) ) ( not ( = ?auto_144453 ?auto_144459 ) ) ( not ( = ?auto_144454 ?auto_144457 ) ) ( not ( = ?auto_144454 ?auto_144459 ) ) ( not ( = ?auto_144455 ?auto_144457 ) ) ( not ( = ?auto_144455 ?auto_144459 ) ) ( not ( = ?auto_144457 ?auto_144459 ) ) ( not ( = ?auto_144456 ?auto_144461 ) ) ( not ( = ?auto_144456 ?auto_144458 ) ) ( not ( = ?auto_144456 ?auto_144459 ) ) ( not ( = ?auto_144461 ?auto_144458 ) ) ( not ( = ?auto_144461 ?auto_144459 ) ) ( not ( = ?auto_144458 ?auto_144459 ) ) ( not ( = ?auto_144453 ?auto_144458 ) ) ( not ( = ?auto_144453 ?auto_144456 ) ) ( not ( = ?auto_144453 ?auto_144461 ) ) ( not ( = ?auto_144454 ?auto_144458 ) ) ( not ( = ?auto_144454 ?auto_144456 ) ) ( not ( = ?auto_144454 ?auto_144461 ) ) ( not ( = ?auto_144455 ?auto_144458 ) ) ( not ( = ?auto_144455 ?auto_144456 ) ) ( not ( = ?auto_144455 ?auto_144461 ) ) ( not ( = ?auto_144457 ?auto_144458 ) ) ( not ( = ?auto_144457 ?auto_144456 ) ) ( not ( = ?auto_144457 ?auto_144461 ) ) ( ON ?auto_144456 ?auto_144460 ) ( not ( = ?auto_144453 ?auto_144460 ) ) ( not ( = ?auto_144454 ?auto_144460 ) ) ( not ( = ?auto_144455 ?auto_144460 ) ) ( not ( = ?auto_144457 ?auto_144460 ) ) ( not ( = ?auto_144459 ?auto_144460 ) ) ( not ( = ?auto_144456 ?auto_144460 ) ) ( not ( = ?auto_144461 ?auto_144460 ) ) ( not ( = ?auto_144458 ?auto_144460 ) ) ( ON ?auto_144461 ?auto_144456 ) ( ON-TABLE ?auto_144460 ) ( ON ?auto_144458 ?auto_144461 ) ( ON ?auto_144459 ?auto_144458 ) ( ON ?auto_144457 ?auto_144459 ) ( ON ?auto_144455 ?auto_144457 ) ( CLEAR ?auto_144453 ) ( ON ?auto_144454 ?auto_144455 ) ( CLEAR ?auto_144454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_144460 ?auto_144456 ?auto_144461 ?auto_144458 ?auto_144459 ?auto_144457 ?auto_144455 )
      ( MAKE-2PILE ?auto_144453 ?auto_144454 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144462 - BLOCK
      ?auto_144463 - BLOCK
    )
    :vars
    (
      ?auto_144467 - BLOCK
      ?auto_144470 - BLOCK
      ?auto_144464 - BLOCK
      ?auto_144469 - BLOCK
      ?auto_144466 - BLOCK
      ?auto_144465 - BLOCK
      ?auto_144468 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144462 ?auto_144463 ) ) ( not ( = ?auto_144462 ?auto_144467 ) ) ( not ( = ?auto_144463 ?auto_144467 ) ) ( not ( = ?auto_144462 ?auto_144470 ) ) ( not ( = ?auto_144462 ?auto_144464 ) ) ( not ( = ?auto_144463 ?auto_144470 ) ) ( not ( = ?auto_144463 ?auto_144464 ) ) ( not ( = ?auto_144467 ?auto_144470 ) ) ( not ( = ?auto_144467 ?auto_144464 ) ) ( not ( = ?auto_144470 ?auto_144464 ) ) ( not ( = ?auto_144469 ?auto_144466 ) ) ( not ( = ?auto_144469 ?auto_144465 ) ) ( not ( = ?auto_144469 ?auto_144464 ) ) ( not ( = ?auto_144466 ?auto_144465 ) ) ( not ( = ?auto_144466 ?auto_144464 ) ) ( not ( = ?auto_144465 ?auto_144464 ) ) ( not ( = ?auto_144462 ?auto_144465 ) ) ( not ( = ?auto_144462 ?auto_144469 ) ) ( not ( = ?auto_144462 ?auto_144466 ) ) ( not ( = ?auto_144463 ?auto_144465 ) ) ( not ( = ?auto_144463 ?auto_144469 ) ) ( not ( = ?auto_144463 ?auto_144466 ) ) ( not ( = ?auto_144467 ?auto_144465 ) ) ( not ( = ?auto_144467 ?auto_144469 ) ) ( not ( = ?auto_144467 ?auto_144466 ) ) ( not ( = ?auto_144470 ?auto_144465 ) ) ( not ( = ?auto_144470 ?auto_144469 ) ) ( not ( = ?auto_144470 ?auto_144466 ) ) ( ON ?auto_144469 ?auto_144468 ) ( not ( = ?auto_144462 ?auto_144468 ) ) ( not ( = ?auto_144463 ?auto_144468 ) ) ( not ( = ?auto_144467 ?auto_144468 ) ) ( not ( = ?auto_144470 ?auto_144468 ) ) ( not ( = ?auto_144464 ?auto_144468 ) ) ( not ( = ?auto_144469 ?auto_144468 ) ) ( not ( = ?auto_144466 ?auto_144468 ) ) ( not ( = ?auto_144465 ?auto_144468 ) ) ( ON ?auto_144466 ?auto_144469 ) ( ON-TABLE ?auto_144468 ) ( ON ?auto_144465 ?auto_144466 ) ( ON ?auto_144464 ?auto_144465 ) ( ON ?auto_144470 ?auto_144464 ) ( ON ?auto_144467 ?auto_144470 ) ( ON ?auto_144463 ?auto_144467 ) ( CLEAR ?auto_144463 ) ( HOLDING ?auto_144462 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_144462 )
      ( MAKE-2PILE ?auto_144462 ?auto_144463 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_144471 - BLOCK
      ?auto_144472 - BLOCK
    )
    :vars
    (
      ?auto_144479 - BLOCK
      ?auto_144474 - BLOCK
      ?auto_144473 - BLOCK
      ?auto_144475 - BLOCK
      ?auto_144476 - BLOCK
      ?auto_144478 - BLOCK
      ?auto_144477 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144471 ?auto_144472 ) ) ( not ( = ?auto_144471 ?auto_144479 ) ) ( not ( = ?auto_144472 ?auto_144479 ) ) ( not ( = ?auto_144471 ?auto_144474 ) ) ( not ( = ?auto_144471 ?auto_144473 ) ) ( not ( = ?auto_144472 ?auto_144474 ) ) ( not ( = ?auto_144472 ?auto_144473 ) ) ( not ( = ?auto_144479 ?auto_144474 ) ) ( not ( = ?auto_144479 ?auto_144473 ) ) ( not ( = ?auto_144474 ?auto_144473 ) ) ( not ( = ?auto_144475 ?auto_144476 ) ) ( not ( = ?auto_144475 ?auto_144478 ) ) ( not ( = ?auto_144475 ?auto_144473 ) ) ( not ( = ?auto_144476 ?auto_144478 ) ) ( not ( = ?auto_144476 ?auto_144473 ) ) ( not ( = ?auto_144478 ?auto_144473 ) ) ( not ( = ?auto_144471 ?auto_144478 ) ) ( not ( = ?auto_144471 ?auto_144475 ) ) ( not ( = ?auto_144471 ?auto_144476 ) ) ( not ( = ?auto_144472 ?auto_144478 ) ) ( not ( = ?auto_144472 ?auto_144475 ) ) ( not ( = ?auto_144472 ?auto_144476 ) ) ( not ( = ?auto_144479 ?auto_144478 ) ) ( not ( = ?auto_144479 ?auto_144475 ) ) ( not ( = ?auto_144479 ?auto_144476 ) ) ( not ( = ?auto_144474 ?auto_144478 ) ) ( not ( = ?auto_144474 ?auto_144475 ) ) ( not ( = ?auto_144474 ?auto_144476 ) ) ( ON ?auto_144475 ?auto_144477 ) ( not ( = ?auto_144471 ?auto_144477 ) ) ( not ( = ?auto_144472 ?auto_144477 ) ) ( not ( = ?auto_144479 ?auto_144477 ) ) ( not ( = ?auto_144474 ?auto_144477 ) ) ( not ( = ?auto_144473 ?auto_144477 ) ) ( not ( = ?auto_144475 ?auto_144477 ) ) ( not ( = ?auto_144476 ?auto_144477 ) ) ( not ( = ?auto_144478 ?auto_144477 ) ) ( ON ?auto_144476 ?auto_144475 ) ( ON-TABLE ?auto_144477 ) ( ON ?auto_144478 ?auto_144476 ) ( ON ?auto_144473 ?auto_144478 ) ( ON ?auto_144474 ?auto_144473 ) ( ON ?auto_144479 ?auto_144474 ) ( ON ?auto_144472 ?auto_144479 ) ( ON ?auto_144471 ?auto_144472 ) ( CLEAR ?auto_144471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_144477 ?auto_144475 ?auto_144476 ?auto_144478 ?auto_144473 ?auto_144474 ?auto_144479 ?auto_144472 )
      ( MAKE-2PILE ?auto_144471 ?auto_144472 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_144486 - BLOCK
      ?auto_144487 - BLOCK
      ?auto_144488 - BLOCK
      ?auto_144489 - BLOCK
      ?auto_144490 - BLOCK
      ?auto_144491 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_144491 ) ( CLEAR ?auto_144490 ) ( ON-TABLE ?auto_144486 ) ( ON ?auto_144487 ?auto_144486 ) ( ON ?auto_144488 ?auto_144487 ) ( ON ?auto_144489 ?auto_144488 ) ( ON ?auto_144490 ?auto_144489 ) ( not ( = ?auto_144486 ?auto_144487 ) ) ( not ( = ?auto_144486 ?auto_144488 ) ) ( not ( = ?auto_144486 ?auto_144489 ) ) ( not ( = ?auto_144486 ?auto_144490 ) ) ( not ( = ?auto_144486 ?auto_144491 ) ) ( not ( = ?auto_144487 ?auto_144488 ) ) ( not ( = ?auto_144487 ?auto_144489 ) ) ( not ( = ?auto_144487 ?auto_144490 ) ) ( not ( = ?auto_144487 ?auto_144491 ) ) ( not ( = ?auto_144488 ?auto_144489 ) ) ( not ( = ?auto_144488 ?auto_144490 ) ) ( not ( = ?auto_144488 ?auto_144491 ) ) ( not ( = ?auto_144489 ?auto_144490 ) ) ( not ( = ?auto_144489 ?auto_144491 ) ) ( not ( = ?auto_144490 ?auto_144491 ) ) )
    :subtasks
    ( ( !STACK ?auto_144491 ?auto_144490 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_144492 - BLOCK
      ?auto_144493 - BLOCK
      ?auto_144494 - BLOCK
      ?auto_144495 - BLOCK
      ?auto_144496 - BLOCK
      ?auto_144497 - BLOCK
    )
    :vars
    (
      ?auto_144498 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_144496 ) ( ON-TABLE ?auto_144492 ) ( ON ?auto_144493 ?auto_144492 ) ( ON ?auto_144494 ?auto_144493 ) ( ON ?auto_144495 ?auto_144494 ) ( ON ?auto_144496 ?auto_144495 ) ( not ( = ?auto_144492 ?auto_144493 ) ) ( not ( = ?auto_144492 ?auto_144494 ) ) ( not ( = ?auto_144492 ?auto_144495 ) ) ( not ( = ?auto_144492 ?auto_144496 ) ) ( not ( = ?auto_144492 ?auto_144497 ) ) ( not ( = ?auto_144493 ?auto_144494 ) ) ( not ( = ?auto_144493 ?auto_144495 ) ) ( not ( = ?auto_144493 ?auto_144496 ) ) ( not ( = ?auto_144493 ?auto_144497 ) ) ( not ( = ?auto_144494 ?auto_144495 ) ) ( not ( = ?auto_144494 ?auto_144496 ) ) ( not ( = ?auto_144494 ?auto_144497 ) ) ( not ( = ?auto_144495 ?auto_144496 ) ) ( not ( = ?auto_144495 ?auto_144497 ) ) ( not ( = ?auto_144496 ?auto_144497 ) ) ( ON ?auto_144497 ?auto_144498 ) ( CLEAR ?auto_144497 ) ( HAND-EMPTY ) ( not ( = ?auto_144492 ?auto_144498 ) ) ( not ( = ?auto_144493 ?auto_144498 ) ) ( not ( = ?auto_144494 ?auto_144498 ) ) ( not ( = ?auto_144495 ?auto_144498 ) ) ( not ( = ?auto_144496 ?auto_144498 ) ) ( not ( = ?auto_144497 ?auto_144498 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_144497 ?auto_144498 )
      ( MAKE-6PILE ?auto_144492 ?auto_144493 ?auto_144494 ?auto_144495 ?auto_144496 ?auto_144497 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_144499 - BLOCK
      ?auto_144500 - BLOCK
      ?auto_144501 - BLOCK
      ?auto_144502 - BLOCK
      ?auto_144503 - BLOCK
      ?auto_144504 - BLOCK
    )
    :vars
    (
      ?auto_144505 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_144499 ) ( ON ?auto_144500 ?auto_144499 ) ( ON ?auto_144501 ?auto_144500 ) ( ON ?auto_144502 ?auto_144501 ) ( not ( = ?auto_144499 ?auto_144500 ) ) ( not ( = ?auto_144499 ?auto_144501 ) ) ( not ( = ?auto_144499 ?auto_144502 ) ) ( not ( = ?auto_144499 ?auto_144503 ) ) ( not ( = ?auto_144499 ?auto_144504 ) ) ( not ( = ?auto_144500 ?auto_144501 ) ) ( not ( = ?auto_144500 ?auto_144502 ) ) ( not ( = ?auto_144500 ?auto_144503 ) ) ( not ( = ?auto_144500 ?auto_144504 ) ) ( not ( = ?auto_144501 ?auto_144502 ) ) ( not ( = ?auto_144501 ?auto_144503 ) ) ( not ( = ?auto_144501 ?auto_144504 ) ) ( not ( = ?auto_144502 ?auto_144503 ) ) ( not ( = ?auto_144502 ?auto_144504 ) ) ( not ( = ?auto_144503 ?auto_144504 ) ) ( ON ?auto_144504 ?auto_144505 ) ( CLEAR ?auto_144504 ) ( not ( = ?auto_144499 ?auto_144505 ) ) ( not ( = ?auto_144500 ?auto_144505 ) ) ( not ( = ?auto_144501 ?auto_144505 ) ) ( not ( = ?auto_144502 ?auto_144505 ) ) ( not ( = ?auto_144503 ?auto_144505 ) ) ( not ( = ?auto_144504 ?auto_144505 ) ) ( HOLDING ?auto_144503 ) ( CLEAR ?auto_144502 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_144499 ?auto_144500 ?auto_144501 ?auto_144502 ?auto_144503 )
      ( MAKE-6PILE ?auto_144499 ?auto_144500 ?auto_144501 ?auto_144502 ?auto_144503 ?auto_144504 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_144506 - BLOCK
      ?auto_144507 - BLOCK
      ?auto_144508 - BLOCK
      ?auto_144509 - BLOCK
      ?auto_144510 - BLOCK
      ?auto_144511 - BLOCK
    )
    :vars
    (
      ?auto_144512 - BLOCK
      ?auto_144513 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_144506 ) ( ON ?auto_144507 ?auto_144506 ) ( ON ?auto_144508 ?auto_144507 ) ( ON ?auto_144509 ?auto_144508 ) ( not ( = ?auto_144506 ?auto_144507 ) ) ( not ( = ?auto_144506 ?auto_144508 ) ) ( not ( = ?auto_144506 ?auto_144509 ) ) ( not ( = ?auto_144506 ?auto_144510 ) ) ( not ( = ?auto_144506 ?auto_144511 ) ) ( not ( = ?auto_144507 ?auto_144508 ) ) ( not ( = ?auto_144507 ?auto_144509 ) ) ( not ( = ?auto_144507 ?auto_144510 ) ) ( not ( = ?auto_144507 ?auto_144511 ) ) ( not ( = ?auto_144508 ?auto_144509 ) ) ( not ( = ?auto_144508 ?auto_144510 ) ) ( not ( = ?auto_144508 ?auto_144511 ) ) ( not ( = ?auto_144509 ?auto_144510 ) ) ( not ( = ?auto_144509 ?auto_144511 ) ) ( not ( = ?auto_144510 ?auto_144511 ) ) ( ON ?auto_144511 ?auto_144512 ) ( not ( = ?auto_144506 ?auto_144512 ) ) ( not ( = ?auto_144507 ?auto_144512 ) ) ( not ( = ?auto_144508 ?auto_144512 ) ) ( not ( = ?auto_144509 ?auto_144512 ) ) ( not ( = ?auto_144510 ?auto_144512 ) ) ( not ( = ?auto_144511 ?auto_144512 ) ) ( CLEAR ?auto_144509 ) ( ON ?auto_144510 ?auto_144511 ) ( CLEAR ?auto_144510 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_144513 ) ( ON ?auto_144512 ?auto_144513 ) ( not ( = ?auto_144513 ?auto_144512 ) ) ( not ( = ?auto_144513 ?auto_144511 ) ) ( not ( = ?auto_144513 ?auto_144510 ) ) ( not ( = ?auto_144506 ?auto_144513 ) ) ( not ( = ?auto_144507 ?auto_144513 ) ) ( not ( = ?auto_144508 ?auto_144513 ) ) ( not ( = ?auto_144509 ?auto_144513 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_144513 ?auto_144512 ?auto_144511 )
      ( MAKE-6PILE ?auto_144506 ?auto_144507 ?auto_144508 ?auto_144509 ?auto_144510 ?auto_144511 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_144514 - BLOCK
      ?auto_144515 - BLOCK
      ?auto_144516 - BLOCK
      ?auto_144517 - BLOCK
      ?auto_144518 - BLOCK
      ?auto_144519 - BLOCK
    )
    :vars
    (
      ?auto_144521 - BLOCK
      ?auto_144520 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_144514 ) ( ON ?auto_144515 ?auto_144514 ) ( ON ?auto_144516 ?auto_144515 ) ( not ( = ?auto_144514 ?auto_144515 ) ) ( not ( = ?auto_144514 ?auto_144516 ) ) ( not ( = ?auto_144514 ?auto_144517 ) ) ( not ( = ?auto_144514 ?auto_144518 ) ) ( not ( = ?auto_144514 ?auto_144519 ) ) ( not ( = ?auto_144515 ?auto_144516 ) ) ( not ( = ?auto_144515 ?auto_144517 ) ) ( not ( = ?auto_144515 ?auto_144518 ) ) ( not ( = ?auto_144515 ?auto_144519 ) ) ( not ( = ?auto_144516 ?auto_144517 ) ) ( not ( = ?auto_144516 ?auto_144518 ) ) ( not ( = ?auto_144516 ?auto_144519 ) ) ( not ( = ?auto_144517 ?auto_144518 ) ) ( not ( = ?auto_144517 ?auto_144519 ) ) ( not ( = ?auto_144518 ?auto_144519 ) ) ( ON ?auto_144519 ?auto_144521 ) ( not ( = ?auto_144514 ?auto_144521 ) ) ( not ( = ?auto_144515 ?auto_144521 ) ) ( not ( = ?auto_144516 ?auto_144521 ) ) ( not ( = ?auto_144517 ?auto_144521 ) ) ( not ( = ?auto_144518 ?auto_144521 ) ) ( not ( = ?auto_144519 ?auto_144521 ) ) ( ON ?auto_144518 ?auto_144519 ) ( CLEAR ?auto_144518 ) ( ON-TABLE ?auto_144520 ) ( ON ?auto_144521 ?auto_144520 ) ( not ( = ?auto_144520 ?auto_144521 ) ) ( not ( = ?auto_144520 ?auto_144519 ) ) ( not ( = ?auto_144520 ?auto_144518 ) ) ( not ( = ?auto_144514 ?auto_144520 ) ) ( not ( = ?auto_144515 ?auto_144520 ) ) ( not ( = ?auto_144516 ?auto_144520 ) ) ( not ( = ?auto_144517 ?auto_144520 ) ) ( HOLDING ?auto_144517 ) ( CLEAR ?auto_144516 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_144514 ?auto_144515 ?auto_144516 ?auto_144517 )
      ( MAKE-6PILE ?auto_144514 ?auto_144515 ?auto_144516 ?auto_144517 ?auto_144518 ?auto_144519 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_144522 - BLOCK
      ?auto_144523 - BLOCK
      ?auto_144524 - BLOCK
      ?auto_144525 - BLOCK
      ?auto_144526 - BLOCK
      ?auto_144527 - BLOCK
    )
    :vars
    (
      ?auto_144528 - BLOCK
      ?auto_144529 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_144522 ) ( ON ?auto_144523 ?auto_144522 ) ( ON ?auto_144524 ?auto_144523 ) ( not ( = ?auto_144522 ?auto_144523 ) ) ( not ( = ?auto_144522 ?auto_144524 ) ) ( not ( = ?auto_144522 ?auto_144525 ) ) ( not ( = ?auto_144522 ?auto_144526 ) ) ( not ( = ?auto_144522 ?auto_144527 ) ) ( not ( = ?auto_144523 ?auto_144524 ) ) ( not ( = ?auto_144523 ?auto_144525 ) ) ( not ( = ?auto_144523 ?auto_144526 ) ) ( not ( = ?auto_144523 ?auto_144527 ) ) ( not ( = ?auto_144524 ?auto_144525 ) ) ( not ( = ?auto_144524 ?auto_144526 ) ) ( not ( = ?auto_144524 ?auto_144527 ) ) ( not ( = ?auto_144525 ?auto_144526 ) ) ( not ( = ?auto_144525 ?auto_144527 ) ) ( not ( = ?auto_144526 ?auto_144527 ) ) ( ON ?auto_144527 ?auto_144528 ) ( not ( = ?auto_144522 ?auto_144528 ) ) ( not ( = ?auto_144523 ?auto_144528 ) ) ( not ( = ?auto_144524 ?auto_144528 ) ) ( not ( = ?auto_144525 ?auto_144528 ) ) ( not ( = ?auto_144526 ?auto_144528 ) ) ( not ( = ?auto_144527 ?auto_144528 ) ) ( ON ?auto_144526 ?auto_144527 ) ( ON-TABLE ?auto_144529 ) ( ON ?auto_144528 ?auto_144529 ) ( not ( = ?auto_144529 ?auto_144528 ) ) ( not ( = ?auto_144529 ?auto_144527 ) ) ( not ( = ?auto_144529 ?auto_144526 ) ) ( not ( = ?auto_144522 ?auto_144529 ) ) ( not ( = ?auto_144523 ?auto_144529 ) ) ( not ( = ?auto_144524 ?auto_144529 ) ) ( not ( = ?auto_144525 ?auto_144529 ) ) ( CLEAR ?auto_144524 ) ( ON ?auto_144525 ?auto_144526 ) ( CLEAR ?auto_144525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_144529 ?auto_144528 ?auto_144527 ?auto_144526 )
      ( MAKE-6PILE ?auto_144522 ?auto_144523 ?auto_144524 ?auto_144525 ?auto_144526 ?auto_144527 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_144530 - BLOCK
      ?auto_144531 - BLOCK
      ?auto_144532 - BLOCK
      ?auto_144533 - BLOCK
      ?auto_144534 - BLOCK
      ?auto_144535 - BLOCK
    )
    :vars
    (
      ?auto_144537 - BLOCK
      ?auto_144536 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_144530 ) ( ON ?auto_144531 ?auto_144530 ) ( not ( = ?auto_144530 ?auto_144531 ) ) ( not ( = ?auto_144530 ?auto_144532 ) ) ( not ( = ?auto_144530 ?auto_144533 ) ) ( not ( = ?auto_144530 ?auto_144534 ) ) ( not ( = ?auto_144530 ?auto_144535 ) ) ( not ( = ?auto_144531 ?auto_144532 ) ) ( not ( = ?auto_144531 ?auto_144533 ) ) ( not ( = ?auto_144531 ?auto_144534 ) ) ( not ( = ?auto_144531 ?auto_144535 ) ) ( not ( = ?auto_144532 ?auto_144533 ) ) ( not ( = ?auto_144532 ?auto_144534 ) ) ( not ( = ?auto_144532 ?auto_144535 ) ) ( not ( = ?auto_144533 ?auto_144534 ) ) ( not ( = ?auto_144533 ?auto_144535 ) ) ( not ( = ?auto_144534 ?auto_144535 ) ) ( ON ?auto_144535 ?auto_144537 ) ( not ( = ?auto_144530 ?auto_144537 ) ) ( not ( = ?auto_144531 ?auto_144537 ) ) ( not ( = ?auto_144532 ?auto_144537 ) ) ( not ( = ?auto_144533 ?auto_144537 ) ) ( not ( = ?auto_144534 ?auto_144537 ) ) ( not ( = ?auto_144535 ?auto_144537 ) ) ( ON ?auto_144534 ?auto_144535 ) ( ON-TABLE ?auto_144536 ) ( ON ?auto_144537 ?auto_144536 ) ( not ( = ?auto_144536 ?auto_144537 ) ) ( not ( = ?auto_144536 ?auto_144535 ) ) ( not ( = ?auto_144536 ?auto_144534 ) ) ( not ( = ?auto_144530 ?auto_144536 ) ) ( not ( = ?auto_144531 ?auto_144536 ) ) ( not ( = ?auto_144532 ?auto_144536 ) ) ( not ( = ?auto_144533 ?auto_144536 ) ) ( ON ?auto_144533 ?auto_144534 ) ( CLEAR ?auto_144533 ) ( HOLDING ?auto_144532 ) ( CLEAR ?auto_144531 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_144530 ?auto_144531 ?auto_144532 )
      ( MAKE-6PILE ?auto_144530 ?auto_144531 ?auto_144532 ?auto_144533 ?auto_144534 ?auto_144535 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_144538 - BLOCK
      ?auto_144539 - BLOCK
      ?auto_144540 - BLOCK
      ?auto_144541 - BLOCK
      ?auto_144542 - BLOCK
      ?auto_144543 - BLOCK
    )
    :vars
    (
      ?auto_144545 - BLOCK
      ?auto_144544 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_144538 ) ( ON ?auto_144539 ?auto_144538 ) ( not ( = ?auto_144538 ?auto_144539 ) ) ( not ( = ?auto_144538 ?auto_144540 ) ) ( not ( = ?auto_144538 ?auto_144541 ) ) ( not ( = ?auto_144538 ?auto_144542 ) ) ( not ( = ?auto_144538 ?auto_144543 ) ) ( not ( = ?auto_144539 ?auto_144540 ) ) ( not ( = ?auto_144539 ?auto_144541 ) ) ( not ( = ?auto_144539 ?auto_144542 ) ) ( not ( = ?auto_144539 ?auto_144543 ) ) ( not ( = ?auto_144540 ?auto_144541 ) ) ( not ( = ?auto_144540 ?auto_144542 ) ) ( not ( = ?auto_144540 ?auto_144543 ) ) ( not ( = ?auto_144541 ?auto_144542 ) ) ( not ( = ?auto_144541 ?auto_144543 ) ) ( not ( = ?auto_144542 ?auto_144543 ) ) ( ON ?auto_144543 ?auto_144545 ) ( not ( = ?auto_144538 ?auto_144545 ) ) ( not ( = ?auto_144539 ?auto_144545 ) ) ( not ( = ?auto_144540 ?auto_144545 ) ) ( not ( = ?auto_144541 ?auto_144545 ) ) ( not ( = ?auto_144542 ?auto_144545 ) ) ( not ( = ?auto_144543 ?auto_144545 ) ) ( ON ?auto_144542 ?auto_144543 ) ( ON-TABLE ?auto_144544 ) ( ON ?auto_144545 ?auto_144544 ) ( not ( = ?auto_144544 ?auto_144545 ) ) ( not ( = ?auto_144544 ?auto_144543 ) ) ( not ( = ?auto_144544 ?auto_144542 ) ) ( not ( = ?auto_144538 ?auto_144544 ) ) ( not ( = ?auto_144539 ?auto_144544 ) ) ( not ( = ?auto_144540 ?auto_144544 ) ) ( not ( = ?auto_144541 ?auto_144544 ) ) ( ON ?auto_144541 ?auto_144542 ) ( CLEAR ?auto_144539 ) ( ON ?auto_144540 ?auto_144541 ) ( CLEAR ?auto_144540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_144544 ?auto_144545 ?auto_144543 ?auto_144542 ?auto_144541 )
      ( MAKE-6PILE ?auto_144538 ?auto_144539 ?auto_144540 ?auto_144541 ?auto_144542 ?auto_144543 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_144546 - BLOCK
      ?auto_144547 - BLOCK
      ?auto_144548 - BLOCK
      ?auto_144549 - BLOCK
      ?auto_144550 - BLOCK
      ?auto_144551 - BLOCK
    )
    :vars
    (
      ?auto_144552 - BLOCK
      ?auto_144553 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_144546 ) ( not ( = ?auto_144546 ?auto_144547 ) ) ( not ( = ?auto_144546 ?auto_144548 ) ) ( not ( = ?auto_144546 ?auto_144549 ) ) ( not ( = ?auto_144546 ?auto_144550 ) ) ( not ( = ?auto_144546 ?auto_144551 ) ) ( not ( = ?auto_144547 ?auto_144548 ) ) ( not ( = ?auto_144547 ?auto_144549 ) ) ( not ( = ?auto_144547 ?auto_144550 ) ) ( not ( = ?auto_144547 ?auto_144551 ) ) ( not ( = ?auto_144548 ?auto_144549 ) ) ( not ( = ?auto_144548 ?auto_144550 ) ) ( not ( = ?auto_144548 ?auto_144551 ) ) ( not ( = ?auto_144549 ?auto_144550 ) ) ( not ( = ?auto_144549 ?auto_144551 ) ) ( not ( = ?auto_144550 ?auto_144551 ) ) ( ON ?auto_144551 ?auto_144552 ) ( not ( = ?auto_144546 ?auto_144552 ) ) ( not ( = ?auto_144547 ?auto_144552 ) ) ( not ( = ?auto_144548 ?auto_144552 ) ) ( not ( = ?auto_144549 ?auto_144552 ) ) ( not ( = ?auto_144550 ?auto_144552 ) ) ( not ( = ?auto_144551 ?auto_144552 ) ) ( ON ?auto_144550 ?auto_144551 ) ( ON-TABLE ?auto_144553 ) ( ON ?auto_144552 ?auto_144553 ) ( not ( = ?auto_144553 ?auto_144552 ) ) ( not ( = ?auto_144553 ?auto_144551 ) ) ( not ( = ?auto_144553 ?auto_144550 ) ) ( not ( = ?auto_144546 ?auto_144553 ) ) ( not ( = ?auto_144547 ?auto_144553 ) ) ( not ( = ?auto_144548 ?auto_144553 ) ) ( not ( = ?auto_144549 ?auto_144553 ) ) ( ON ?auto_144549 ?auto_144550 ) ( ON ?auto_144548 ?auto_144549 ) ( CLEAR ?auto_144548 ) ( HOLDING ?auto_144547 ) ( CLEAR ?auto_144546 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_144546 ?auto_144547 )
      ( MAKE-6PILE ?auto_144546 ?auto_144547 ?auto_144548 ?auto_144549 ?auto_144550 ?auto_144551 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_144554 - BLOCK
      ?auto_144555 - BLOCK
      ?auto_144556 - BLOCK
      ?auto_144557 - BLOCK
      ?auto_144558 - BLOCK
      ?auto_144559 - BLOCK
    )
    :vars
    (
      ?auto_144561 - BLOCK
      ?auto_144560 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_144554 ) ( not ( = ?auto_144554 ?auto_144555 ) ) ( not ( = ?auto_144554 ?auto_144556 ) ) ( not ( = ?auto_144554 ?auto_144557 ) ) ( not ( = ?auto_144554 ?auto_144558 ) ) ( not ( = ?auto_144554 ?auto_144559 ) ) ( not ( = ?auto_144555 ?auto_144556 ) ) ( not ( = ?auto_144555 ?auto_144557 ) ) ( not ( = ?auto_144555 ?auto_144558 ) ) ( not ( = ?auto_144555 ?auto_144559 ) ) ( not ( = ?auto_144556 ?auto_144557 ) ) ( not ( = ?auto_144556 ?auto_144558 ) ) ( not ( = ?auto_144556 ?auto_144559 ) ) ( not ( = ?auto_144557 ?auto_144558 ) ) ( not ( = ?auto_144557 ?auto_144559 ) ) ( not ( = ?auto_144558 ?auto_144559 ) ) ( ON ?auto_144559 ?auto_144561 ) ( not ( = ?auto_144554 ?auto_144561 ) ) ( not ( = ?auto_144555 ?auto_144561 ) ) ( not ( = ?auto_144556 ?auto_144561 ) ) ( not ( = ?auto_144557 ?auto_144561 ) ) ( not ( = ?auto_144558 ?auto_144561 ) ) ( not ( = ?auto_144559 ?auto_144561 ) ) ( ON ?auto_144558 ?auto_144559 ) ( ON-TABLE ?auto_144560 ) ( ON ?auto_144561 ?auto_144560 ) ( not ( = ?auto_144560 ?auto_144561 ) ) ( not ( = ?auto_144560 ?auto_144559 ) ) ( not ( = ?auto_144560 ?auto_144558 ) ) ( not ( = ?auto_144554 ?auto_144560 ) ) ( not ( = ?auto_144555 ?auto_144560 ) ) ( not ( = ?auto_144556 ?auto_144560 ) ) ( not ( = ?auto_144557 ?auto_144560 ) ) ( ON ?auto_144557 ?auto_144558 ) ( ON ?auto_144556 ?auto_144557 ) ( CLEAR ?auto_144554 ) ( ON ?auto_144555 ?auto_144556 ) ( CLEAR ?auto_144555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_144560 ?auto_144561 ?auto_144559 ?auto_144558 ?auto_144557 ?auto_144556 )
      ( MAKE-6PILE ?auto_144554 ?auto_144555 ?auto_144556 ?auto_144557 ?auto_144558 ?auto_144559 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_144562 - BLOCK
      ?auto_144563 - BLOCK
      ?auto_144564 - BLOCK
      ?auto_144565 - BLOCK
      ?auto_144566 - BLOCK
      ?auto_144567 - BLOCK
    )
    :vars
    (
      ?auto_144569 - BLOCK
      ?auto_144568 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144562 ?auto_144563 ) ) ( not ( = ?auto_144562 ?auto_144564 ) ) ( not ( = ?auto_144562 ?auto_144565 ) ) ( not ( = ?auto_144562 ?auto_144566 ) ) ( not ( = ?auto_144562 ?auto_144567 ) ) ( not ( = ?auto_144563 ?auto_144564 ) ) ( not ( = ?auto_144563 ?auto_144565 ) ) ( not ( = ?auto_144563 ?auto_144566 ) ) ( not ( = ?auto_144563 ?auto_144567 ) ) ( not ( = ?auto_144564 ?auto_144565 ) ) ( not ( = ?auto_144564 ?auto_144566 ) ) ( not ( = ?auto_144564 ?auto_144567 ) ) ( not ( = ?auto_144565 ?auto_144566 ) ) ( not ( = ?auto_144565 ?auto_144567 ) ) ( not ( = ?auto_144566 ?auto_144567 ) ) ( ON ?auto_144567 ?auto_144569 ) ( not ( = ?auto_144562 ?auto_144569 ) ) ( not ( = ?auto_144563 ?auto_144569 ) ) ( not ( = ?auto_144564 ?auto_144569 ) ) ( not ( = ?auto_144565 ?auto_144569 ) ) ( not ( = ?auto_144566 ?auto_144569 ) ) ( not ( = ?auto_144567 ?auto_144569 ) ) ( ON ?auto_144566 ?auto_144567 ) ( ON-TABLE ?auto_144568 ) ( ON ?auto_144569 ?auto_144568 ) ( not ( = ?auto_144568 ?auto_144569 ) ) ( not ( = ?auto_144568 ?auto_144567 ) ) ( not ( = ?auto_144568 ?auto_144566 ) ) ( not ( = ?auto_144562 ?auto_144568 ) ) ( not ( = ?auto_144563 ?auto_144568 ) ) ( not ( = ?auto_144564 ?auto_144568 ) ) ( not ( = ?auto_144565 ?auto_144568 ) ) ( ON ?auto_144565 ?auto_144566 ) ( ON ?auto_144564 ?auto_144565 ) ( ON ?auto_144563 ?auto_144564 ) ( CLEAR ?auto_144563 ) ( HOLDING ?auto_144562 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_144562 )
      ( MAKE-6PILE ?auto_144562 ?auto_144563 ?auto_144564 ?auto_144565 ?auto_144566 ?auto_144567 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_144570 - BLOCK
      ?auto_144571 - BLOCK
      ?auto_144572 - BLOCK
      ?auto_144573 - BLOCK
      ?auto_144574 - BLOCK
      ?auto_144575 - BLOCK
    )
    :vars
    (
      ?auto_144577 - BLOCK
      ?auto_144576 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144570 ?auto_144571 ) ) ( not ( = ?auto_144570 ?auto_144572 ) ) ( not ( = ?auto_144570 ?auto_144573 ) ) ( not ( = ?auto_144570 ?auto_144574 ) ) ( not ( = ?auto_144570 ?auto_144575 ) ) ( not ( = ?auto_144571 ?auto_144572 ) ) ( not ( = ?auto_144571 ?auto_144573 ) ) ( not ( = ?auto_144571 ?auto_144574 ) ) ( not ( = ?auto_144571 ?auto_144575 ) ) ( not ( = ?auto_144572 ?auto_144573 ) ) ( not ( = ?auto_144572 ?auto_144574 ) ) ( not ( = ?auto_144572 ?auto_144575 ) ) ( not ( = ?auto_144573 ?auto_144574 ) ) ( not ( = ?auto_144573 ?auto_144575 ) ) ( not ( = ?auto_144574 ?auto_144575 ) ) ( ON ?auto_144575 ?auto_144577 ) ( not ( = ?auto_144570 ?auto_144577 ) ) ( not ( = ?auto_144571 ?auto_144577 ) ) ( not ( = ?auto_144572 ?auto_144577 ) ) ( not ( = ?auto_144573 ?auto_144577 ) ) ( not ( = ?auto_144574 ?auto_144577 ) ) ( not ( = ?auto_144575 ?auto_144577 ) ) ( ON ?auto_144574 ?auto_144575 ) ( ON-TABLE ?auto_144576 ) ( ON ?auto_144577 ?auto_144576 ) ( not ( = ?auto_144576 ?auto_144577 ) ) ( not ( = ?auto_144576 ?auto_144575 ) ) ( not ( = ?auto_144576 ?auto_144574 ) ) ( not ( = ?auto_144570 ?auto_144576 ) ) ( not ( = ?auto_144571 ?auto_144576 ) ) ( not ( = ?auto_144572 ?auto_144576 ) ) ( not ( = ?auto_144573 ?auto_144576 ) ) ( ON ?auto_144573 ?auto_144574 ) ( ON ?auto_144572 ?auto_144573 ) ( ON ?auto_144571 ?auto_144572 ) ( ON ?auto_144570 ?auto_144571 ) ( CLEAR ?auto_144570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_144576 ?auto_144577 ?auto_144575 ?auto_144574 ?auto_144573 ?auto_144572 ?auto_144571 )
      ( MAKE-6PILE ?auto_144570 ?auto_144571 ?auto_144572 ?auto_144573 ?auto_144574 ?auto_144575 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_144578 - BLOCK
      ?auto_144579 - BLOCK
      ?auto_144580 - BLOCK
      ?auto_144581 - BLOCK
      ?auto_144582 - BLOCK
      ?auto_144583 - BLOCK
    )
    :vars
    (
      ?auto_144584 - BLOCK
      ?auto_144585 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144578 ?auto_144579 ) ) ( not ( = ?auto_144578 ?auto_144580 ) ) ( not ( = ?auto_144578 ?auto_144581 ) ) ( not ( = ?auto_144578 ?auto_144582 ) ) ( not ( = ?auto_144578 ?auto_144583 ) ) ( not ( = ?auto_144579 ?auto_144580 ) ) ( not ( = ?auto_144579 ?auto_144581 ) ) ( not ( = ?auto_144579 ?auto_144582 ) ) ( not ( = ?auto_144579 ?auto_144583 ) ) ( not ( = ?auto_144580 ?auto_144581 ) ) ( not ( = ?auto_144580 ?auto_144582 ) ) ( not ( = ?auto_144580 ?auto_144583 ) ) ( not ( = ?auto_144581 ?auto_144582 ) ) ( not ( = ?auto_144581 ?auto_144583 ) ) ( not ( = ?auto_144582 ?auto_144583 ) ) ( ON ?auto_144583 ?auto_144584 ) ( not ( = ?auto_144578 ?auto_144584 ) ) ( not ( = ?auto_144579 ?auto_144584 ) ) ( not ( = ?auto_144580 ?auto_144584 ) ) ( not ( = ?auto_144581 ?auto_144584 ) ) ( not ( = ?auto_144582 ?auto_144584 ) ) ( not ( = ?auto_144583 ?auto_144584 ) ) ( ON ?auto_144582 ?auto_144583 ) ( ON-TABLE ?auto_144585 ) ( ON ?auto_144584 ?auto_144585 ) ( not ( = ?auto_144585 ?auto_144584 ) ) ( not ( = ?auto_144585 ?auto_144583 ) ) ( not ( = ?auto_144585 ?auto_144582 ) ) ( not ( = ?auto_144578 ?auto_144585 ) ) ( not ( = ?auto_144579 ?auto_144585 ) ) ( not ( = ?auto_144580 ?auto_144585 ) ) ( not ( = ?auto_144581 ?auto_144585 ) ) ( ON ?auto_144581 ?auto_144582 ) ( ON ?auto_144580 ?auto_144581 ) ( ON ?auto_144579 ?auto_144580 ) ( HOLDING ?auto_144578 ) ( CLEAR ?auto_144579 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_144585 ?auto_144584 ?auto_144583 ?auto_144582 ?auto_144581 ?auto_144580 ?auto_144579 ?auto_144578 )
      ( MAKE-6PILE ?auto_144578 ?auto_144579 ?auto_144580 ?auto_144581 ?auto_144582 ?auto_144583 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_144586 - BLOCK
      ?auto_144587 - BLOCK
      ?auto_144588 - BLOCK
      ?auto_144589 - BLOCK
      ?auto_144590 - BLOCK
      ?auto_144591 - BLOCK
    )
    :vars
    (
      ?auto_144593 - BLOCK
      ?auto_144592 - BLOCK
      ?auto_144594 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144586 ?auto_144587 ) ) ( not ( = ?auto_144586 ?auto_144588 ) ) ( not ( = ?auto_144586 ?auto_144589 ) ) ( not ( = ?auto_144586 ?auto_144590 ) ) ( not ( = ?auto_144586 ?auto_144591 ) ) ( not ( = ?auto_144587 ?auto_144588 ) ) ( not ( = ?auto_144587 ?auto_144589 ) ) ( not ( = ?auto_144587 ?auto_144590 ) ) ( not ( = ?auto_144587 ?auto_144591 ) ) ( not ( = ?auto_144588 ?auto_144589 ) ) ( not ( = ?auto_144588 ?auto_144590 ) ) ( not ( = ?auto_144588 ?auto_144591 ) ) ( not ( = ?auto_144589 ?auto_144590 ) ) ( not ( = ?auto_144589 ?auto_144591 ) ) ( not ( = ?auto_144590 ?auto_144591 ) ) ( ON ?auto_144591 ?auto_144593 ) ( not ( = ?auto_144586 ?auto_144593 ) ) ( not ( = ?auto_144587 ?auto_144593 ) ) ( not ( = ?auto_144588 ?auto_144593 ) ) ( not ( = ?auto_144589 ?auto_144593 ) ) ( not ( = ?auto_144590 ?auto_144593 ) ) ( not ( = ?auto_144591 ?auto_144593 ) ) ( ON ?auto_144590 ?auto_144591 ) ( ON-TABLE ?auto_144592 ) ( ON ?auto_144593 ?auto_144592 ) ( not ( = ?auto_144592 ?auto_144593 ) ) ( not ( = ?auto_144592 ?auto_144591 ) ) ( not ( = ?auto_144592 ?auto_144590 ) ) ( not ( = ?auto_144586 ?auto_144592 ) ) ( not ( = ?auto_144587 ?auto_144592 ) ) ( not ( = ?auto_144588 ?auto_144592 ) ) ( not ( = ?auto_144589 ?auto_144592 ) ) ( ON ?auto_144589 ?auto_144590 ) ( ON ?auto_144588 ?auto_144589 ) ( ON ?auto_144587 ?auto_144588 ) ( CLEAR ?auto_144587 ) ( ON ?auto_144586 ?auto_144594 ) ( CLEAR ?auto_144586 ) ( HAND-EMPTY ) ( not ( = ?auto_144586 ?auto_144594 ) ) ( not ( = ?auto_144587 ?auto_144594 ) ) ( not ( = ?auto_144588 ?auto_144594 ) ) ( not ( = ?auto_144589 ?auto_144594 ) ) ( not ( = ?auto_144590 ?auto_144594 ) ) ( not ( = ?auto_144591 ?auto_144594 ) ) ( not ( = ?auto_144593 ?auto_144594 ) ) ( not ( = ?auto_144592 ?auto_144594 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_144586 ?auto_144594 )
      ( MAKE-6PILE ?auto_144586 ?auto_144587 ?auto_144588 ?auto_144589 ?auto_144590 ?auto_144591 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_144595 - BLOCK
      ?auto_144596 - BLOCK
      ?auto_144597 - BLOCK
      ?auto_144598 - BLOCK
      ?auto_144599 - BLOCK
      ?auto_144600 - BLOCK
    )
    :vars
    (
      ?auto_144601 - BLOCK
      ?auto_144602 - BLOCK
      ?auto_144603 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144595 ?auto_144596 ) ) ( not ( = ?auto_144595 ?auto_144597 ) ) ( not ( = ?auto_144595 ?auto_144598 ) ) ( not ( = ?auto_144595 ?auto_144599 ) ) ( not ( = ?auto_144595 ?auto_144600 ) ) ( not ( = ?auto_144596 ?auto_144597 ) ) ( not ( = ?auto_144596 ?auto_144598 ) ) ( not ( = ?auto_144596 ?auto_144599 ) ) ( not ( = ?auto_144596 ?auto_144600 ) ) ( not ( = ?auto_144597 ?auto_144598 ) ) ( not ( = ?auto_144597 ?auto_144599 ) ) ( not ( = ?auto_144597 ?auto_144600 ) ) ( not ( = ?auto_144598 ?auto_144599 ) ) ( not ( = ?auto_144598 ?auto_144600 ) ) ( not ( = ?auto_144599 ?auto_144600 ) ) ( ON ?auto_144600 ?auto_144601 ) ( not ( = ?auto_144595 ?auto_144601 ) ) ( not ( = ?auto_144596 ?auto_144601 ) ) ( not ( = ?auto_144597 ?auto_144601 ) ) ( not ( = ?auto_144598 ?auto_144601 ) ) ( not ( = ?auto_144599 ?auto_144601 ) ) ( not ( = ?auto_144600 ?auto_144601 ) ) ( ON ?auto_144599 ?auto_144600 ) ( ON-TABLE ?auto_144602 ) ( ON ?auto_144601 ?auto_144602 ) ( not ( = ?auto_144602 ?auto_144601 ) ) ( not ( = ?auto_144602 ?auto_144600 ) ) ( not ( = ?auto_144602 ?auto_144599 ) ) ( not ( = ?auto_144595 ?auto_144602 ) ) ( not ( = ?auto_144596 ?auto_144602 ) ) ( not ( = ?auto_144597 ?auto_144602 ) ) ( not ( = ?auto_144598 ?auto_144602 ) ) ( ON ?auto_144598 ?auto_144599 ) ( ON ?auto_144597 ?auto_144598 ) ( ON ?auto_144595 ?auto_144603 ) ( CLEAR ?auto_144595 ) ( not ( = ?auto_144595 ?auto_144603 ) ) ( not ( = ?auto_144596 ?auto_144603 ) ) ( not ( = ?auto_144597 ?auto_144603 ) ) ( not ( = ?auto_144598 ?auto_144603 ) ) ( not ( = ?auto_144599 ?auto_144603 ) ) ( not ( = ?auto_144600 ?auto_144603 ) ) ( not ( = ?auto_144601 ?auto_144603 ) ) ( not ( = ?auto_144602 ?auto_144603 ) ) ( HOLDING ?auto_144596 ) ( CLEAR ?auto_144597 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_144602 ?auto_144601 ?auto_144600 ?auto_144599 ?auto_144598 ?auto_144597 ?auto_144596 )
      ( MAKE-6PILE ?auto_144595 ?auto_144596 ?auto_144597 ?auto_144598 ?auto_144599 ?auto_144600 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_144604 - BLOCK
      ?auto_144605 - BLOCK
      ?auto_144606 - BLOCK
      ?auto_144607 - BLOCK
      ?auto_144608 - BLOCK
      ?auto_144609 - BLOCK
    )
    :vars
    (
      ?auto_144612 - BLOCK
      ?auto_144610 - BLOCK
      ?auto_144611 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144604 ?auto_144605 ) ) ( not ( = ?auto_144604 ?auto_144606 ) ) ( not ( = ?auto_144604 ?auto_144607 ) ) ( not ( = ?auto_144604 ?auto_144608 ) ) ( not ( = ?auto_144604 ?auto_144609 ) ) ( not ( = ?auto_144605 ?auto_144606 ) ) ( not ( = ?auto_144605 ?auto_144607 ) ) ( not ( = ?auto_144605 ?auto_144608 ) ) ( not ( = ?auto_144605 ?auto_144609 ) ) ( not ( = ?auto_144606 ?auto_144607 ) ) ( not ( = ?auto_144606 ?auto_144608 ) ) ( not ( = ?auto_144606 ?auto_144609 ) ) ( not ( = ?auto_144607 ?auto_144608 ) ) ( not ( = ?auto_144607 ?auto_144609 ) ) ( not ( = ?auto_144608 ?auto_144609 ) ) ( ON ?auto_144609 ?auto_144612 ) ( not ( = ?auto_144604 ?auto_144612 ) ) ( not ( = ?auto_144605 ?auto_144612 ) ) ( not ( = ?auto_144606 ?auto_144612 ) ) ( not ( = ?auto_144607 ?auto_144612 ) ) ( not ( = ?auto_144608 ?auto_144612 ) ) ( not ( = ?auto_144609 ?auto_144612 ) ) ( ON ?auto_144608 ?auto_144609 ) ( ON-TABLE ?auto_144610 ) ( ON ?auto_144612 ?auto_144610 ) ( not ( = ?auto_144610 ?auto_144612 ) ) ( not ( = ?auto_144610 ?auto_144609 ) ) ( not ( = ?auto_144610 ?auto_144608 ) ) ( not ( = ?auto_144604 ?auto_144610 ) ) ( not ( = ?auto_144605 ?auto_144610 ) ) ( not ( = ?auto_144606 ?auto_144610 ) ) ( not ( = ?auto_144607 ?auto_144610 ) ) ( ON ?auto_144607 ?auto_144608 ) ( ON ?auto_144606 ?auto_144607 ) ( ON ?auto_144604 ?auto_144611 ) ( not ( = ?auto_144604 ?auto_144611 ) ) ( not ( = ?auto_144605 ?auto_144611 ) ) ( not ( = ?auto_144606 ?auto_144611 ) ) ( not ( = ?auto_144607 ?auto_144611 ) ) ( not ( = ?auto_144608 ?auto_144611 ) ) ( not ( = ?auto_144609 ?auto_144611 ) ) ( not ( = ?auto_144612 ?auto_144611 ) ) ( not ( = ?auto_144610 ?auto_144611 ) ) ( CLEAR ?auto_144606 ) ( ON ?auto_144605 ?auto_144604 ) ( CLEAR ?auto_144605 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_144611 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_144611 ?auto_144604 )
      ( MAKE-6PILE ?auto_144604 ?auto_144605 ?auto_144606 ?auto_144607 ?auto_144608 ?auto_144609 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_144613 - BLOCK
      ?auto_144614 - BLOCK
      ?auto_144615 - BLOCK
      ?auto_144616 - BLOCK
      ?auto_144617 - BLOCK
      ?auto_144618 - BLOCK
    )
    :vars
    (
      ?auto_144620 - BLOCK
      ?auto_144619 - BLOCK
      ?auto_144621 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144613 ?auto_144614 ) ) ( not ( = ?auto_144613 ?auto_144615 ) ) ( not ( = ?auto_144613 ?auto_144616 ) ) ( not ( = ?auto_144613 ?auto_144617 ) ) ( not ( = ?auto_144613 ?auto_144618 ) ) ( not ( = ?auto_144614 ?auto_144615 ) ) ( not ( = ?auto_144614 ?auto_144616 ) ) ( not ( = ?auto_144614 ?auto_144617 ) ) ( not ( = ?auto_144614 ?auto_144618 ) ) ( not ( = ?auto_144615 ?auto_144616 ) ) ( not ( = ?auto_144615 ?auto_144617 ) ) ( not ( = ?auto_144615 ?auto_144618 ) ) ( not ( = ?auto_144616 ?auto_144617 ) ) ( not ( = ?auto_144616 ?auto_144618 ) ) ( not ( = ?auto_144617 ?auto_144618 ) ) ( ON ?auto_144618 ?auto_144620 ) ( not ( = ?auto_144613 ?auto_144620 ) ) ( not ( = ?auto_144614 ?auto_144620 ) ) ( not ( = ?auto_144615 ?auto_144620 ) ) ( not ( = ?auto_144616 ?auto_144620 ) ) ( not ( = ?auto_144617 ?auto_144620 ) ) ( not ( = ?auto_144618 ?auto_144620 ) ) ( ON ?auto_144617 ?auto_144618 ) ( ON-TABLE ?auto_144619 ) ( ON ?auto_144620 ?auto_144619 ) ( not ( = ?auto_144619 ?auto_144620 ) ) ( not ( = ?auto_144619 ?auto_144618 ) ) ( not ( = ?auto_144619 ?auto_144617 ) ) ( not ( = ?auto_144613 ?auto_144619 ) ) ( not ( = ?auto_144614 ?auto_144619 ) ) ( not ( = ?auto_144615 ?auto_144619 ) ) ( not ( = ?auto_144616 ?auto_144619 ) ) ( ON ?auto_144616 ?auto_144617 ) ( ON ?auto_144613 ?auto_144621 ) ( not ( = ?auto_144613 ?auto_144621 ) ) ( not ( = ?auto_144614 ?auto_144621 ) ) ( not ( = ?auto_144615 ?auto_144621 ) ) ( not ( = ?auto_144616 ?auto_144621 ) ) ( not ( = ?auto_144617 ?auto_144621 ) ) ( not ( = ?auto_144618 ?auto_144621 ) ) ( not ( = ?auto_144620 ?auto_144621 ) ) ( not ( = ?auto_144619 ?auto_144621 ) ) ( ON ?auto_144614 ?auto_144613 ) ( CLEAR ?auto_144614 ) ( ON-TABLE ?auto_144621 ) ( HOLDING ?auto_144615 ) ( CLEAR ?auto_144616 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_144619 ?auto_144620 ?auto_144618 ?auto_144617 ?auto_144616 ?auto_144615 )
      ( MAKE-6PILE ?auto_144613 ?auto_144614 ?auto_144615 ?auto_144616 ?auto_144617 ?auto_144618 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_144622 - BLOCK
      ?auto_144623 - BLOCK
      ?auto_144624 - BLOCK
      ?auto_144625 - BLOCK
      ?auto_144626 - BLOCK
      ?auto_144627 - BLOCK
    )
    :vars
    (
      ?auto_144629 - BLOCK
      ?auto_144628 - BLOCK
      ?auto_144630 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144622 ?auto_144623 ) ) ( not ( = ?auto_144622 ?auto_144624 ) ) ( not ( = ?auto_144622 ?auto_144625 ) ) ( not ( = ?auto_144622 ?auto_144626 ) ) ( not ( = ?auto_144622 ?auto_144627 ) ) ( not ( = ?auto_144623 ?auto_144624 ) ) ( not ( = ?auto_144623 ?auto_144625 ) ) ( not ( = ?auto_144623 ?auto_144626 ) ) ( not ( = ?auto_144623 ?auto_144627 ) ) ( not ( = ?auto_144624 ?auto_144625 ) ) ( not ( = ?auto_144624 ?auto_144626 ) ) ( not ( = ?auto_144624 ?auto_144627 ) ) ( not ( = ?auto_144625 ?auto_144626 ) ) ( not ( = ?auto_144625 ?auto_144627 ) ) ( not ( = ?auto_144626 ?auto_144627 ) ) ( ON ?auto_144627 ?auto_144629 ) ( not ( = ?auto_144622 ?auto_144629 ) ) ( not ( = ?auto_144623 ?auto_144629 ) ) ( not ( = ?auto_144624 ?auto_144629 ) ) ( not ( = ?auto_144625 ?auto_144629 ) ) ( not ( = ?auto_144626 ?auto_144629 ) ) ( not ( = ?auto_144627 ?auto_144629 ) ) ( ON ?auto_144626 ?auto_144627 ) ( ON-TABLE ?auto_144628 ) ( ON ?auto_144629 ?auto_144628 ) ( not ( = ?auto_144628 ?auto_144629 ) ) ( not ( = ?auto_144628 ?auto_144627 ) ) ( not ( = ?auto_144628 ?auto_144626 ) ) ( not ( = ?auto_144622 ?auto_144628 ) ) ( not ( = ?auto_144623 ?auto_144628 ) ) ( not ( = ?auto_144624 ?auto_144628 ) ) ( not ( = ?auto_144625 ?auto_144628 ) ) ( ON ?auto_144625 ?auto_144626 ) ( ON ?auto_144622 ?auto_144630 ) ( not ( = ?auto_144622 ?auto_144630 ) ) ( not ( = ?auto_144623 ?auto_144630 ) ) ( not ( = ?auto_144624 ?auto_144630 ) ) ( not ( = ?auto_144625 ?auto_144630 ) ) ( not ( = ?auto_144626 ?auto_144630 ) ) ( not ( = ?auto_144627 ?auto_144630 ) ) ( not ( = ?auto_144629 ?auto_144630 ) ) ( not ( = ?auto_144628 ?auto_144630 ) ) ( ON ?auto_144623 ?auto_144622 ) ( ON-TABLE ?auto_144630 ) ( CLEAR ?auto_144625 ) ( ON ?auto_144624 ?auto_144623 ) ( CLEAR ?auto_144624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_144630 ?auto_144622 ?auto_144623 )
      ( MAKE-6PILE ?auto_144622 ?auto_144623 ?auto_144624 ?auto_144625 ?auto_144626 ?auto_144627 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_144631 - BLOCK
      ?auto_144632 - BLOCK
      ?auto_144633 - BLOCK
      ?auto_144634 - BLOCK
      ?auto_144635 - BLOCK
      ?auto_144636 - BLOCK
    )
    :vars
    (
      ?auto_144638 - BLOCK
      ?auto_144637 - BLOCK
      ?auto_144639 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144631 ?auto_144632 ) ) ( not ( = ?auto_144631 ?auto_144633 ) ) ( not ( = ?auto_144631 ?auto_144634 ) ) ( not ( = ?auto_144631 ?auto_144635 ) ) ( not ( = ?auto_144631 ?auto_144636 ) ) ( not ( = ?auto_144632 ?auto_144633 ) ) ( not ( = ?auto_144632 ?auto_144634 ) ) ( not ( = ?auto_144632 ?auto_144635 ) ) ( not ( = ?auto_144632 ?auto_144636 ) ) ( not ( = ?auto_144633 ?auto_144634 ) ) ( not ( = ?auto_144633 ?auto_144635 ) ) ( not ( = ?auto_144633 ?auto_144636 ) ) ( not ( = ?auto_144634 ?auto_144635 ) ) ( not ( = ?auto_144634 ?auto_144636 ) ) ( not ( = ?auto_144635 ?auto_144636 ) ) ( ON ?auto_144636 ?auto_144638 ) ( not ( = ?auto_144631 ?auto_144638 ) ) ( not ( = ?auto_144632 ?auto_144638 ) ) ( not ( = ?auto_144633 ?auto_144638 ) ) ( not ( = ?auto_144634 ?auto_144638 ) ) ( not ( = ?auto_144635 ?auto_144638 ) ) ( not ( = ?auto_144636 ?auto_144638 ) ) ( ON ?auto_144635 ?auto_144636 ) ( ON-TABLE ?auto_144637 ) ( ON ?auto_144638 ?auto_144637 ) ( not ( = ?auto_144637 ?auto_144638 ) ) ( not ( = ?auto_144637 ?auto_144636 ) ) ( not ( = ?auto_144637 ?auto_144635 ) ) ( not ( = ?auto_144631 ?auto_144637 ) ) ( not ( = ?auto_144632 ?auto_144637 ) ) ( not ( = ?auto_144633 ?auto_144637 ) ) ( not ( = ?auto_144634 ?auto_144637 ) ) ( ON ?auto_144631 ?auto_144639 ) ( not ( = ?auto_144631 ?auto_144639 ) ) ( not ( = ?auto_144632 ?auto_144639 ) ) ( not ( = ?auto_144633 ?auto_144639 ) ) ( not ( = ?auto_144634 ?auto_144639 ) ) ( not ( = ?auto_144635 ?auto_144639 ) ) ( not ( = ?auto_144636 ?auto_144639 ) ) ( not ( = ?auto_144638 ?auto_144639 ) ) ( not ( = ?auto_144637 ?auto_144639 ) ) ( ON ?auto_144632 ?auto_144631 ) ( ON-TABLE ?auto_144639 ) ( ON ?auto_144633 ?auto_144632 ) ( CLEAR ?auto_144633 ) ( HOLDING ?auto_144634 ) ( CLEAR ?auto_144635 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_144637 ?auto_144638 ?auto_144636 ?auto_144635 ?auto_144634 )
      ( MAKE-6PILE ?auto_144631 ?auto_144632 ?auto_144633 ?auto_144634 ?auto_144635 ?auto_144636 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_144640 - BLOCK
      ?auto_144641 - BLOCK
      ?auto_144642 - BLOCK
      ?auto_144643 - BLOCK
      ?auto_144644 - BLOCK
      ?auto_144645 - BLOCK
    )
    :vars
    (
      ?auto_144648 - BLOCK
      ?auto_144647 - BLOCK
      ?auto_144646 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144640 ?auto_144641 ) ) ( not ( = ?auto_144640 ?auto_144642 ) ) ( not ( = ?auto_144640 ?auto_144643 ) ) ( not ( = ?auto_144640 ?auto_144644 ) ) ( not ( = ?auto_144640 ?auto_144645 ) ) ( not ( = ?auto_144641 ?auto_144642 ) ) ( not ( = ?auto_144641 ?auto_144643 ) ) ( not ( = ?auto_144641 ?auto_144644 ) ) ( not ( = ?auto_144641 ?auto_144645 ) ) ( not ( = ?auto_144642 ?auto_144643 ) ) ( not ( = ?auto_144642 ?auto_144644 ) ) ( not ( = ?auto_144642 ?auto_144645 ) ) ( not ( = ?auto_144643 ?auto_144644 ) ) ( not ( = ?auto_144643 ?auto_144645 ) ) ( not ( = ?auto_144644 ?auto_144645 ) ) ( ON ?auto_144645 ?auto_144648 ) ( not ( = ?auto_144640 ?auto_144648 ) ) ( not ( = ?auto_144641 ?auto_144648 ) ) ( not ( = ?auto_144642 ?auto_144648 ) ) ( not ( = ?auto_144643 ?auto_144648 ) ) ( not ( = ?auto_144644 ?auto_144648 ) ) ( not ( = ?auto_144645 ?auto_144648 ) ) ( ON ?auto_144644 ?auto_144645 ) ( ON-TABLE ?auto_144647 ) ( ON ?auto_144648 ?auto_144647 ) ( not ( = ?auto_144647 ?auto_144648 ) ) ( not ( = ?auto_144647 ?auto_144645 ) ) ( not ( = ?auto_144647 ?auto_144644 ) ) ( not ( = ?auto_144640 ?auto_144647 ) ) ( not ( = ?auto_144641 ?auto_144647 ) ) ( not ( = ?auto_144642 ?auto_144647 ) ) ( not ( = ?auto_144643 ?auto_144647 ) ) ( ON ?auto_144640 ?auto_144646 ) ( not ( = ?auto_144640 ?auto_144646 ) ) ( not ( = ?auto_144641 ?auto_144646 ) ) ( not ( = ?auto_144642 ?auto_144646 ) ) ( not ( = ?auto_144643 ?auto_144646 ) ) ( not ( = ?auto_144644 ?auto_144646 ) ) ( not ( = ?auto_144645 ?auto_144646 ) ) ( not ( = ?auto_144648 ?auto_144646 ) ) ( not ( = ?auto_144647 ?auto_144646 ) ) ( ON ?auto_144641 ?auto_144640 ) ( ON-TABLE ?auto_144646 ) ( ON ?auto_144642 ?auto_144641 ) ( CLEAR ?auto_144644 ) ( ON ?auto_144643 ?auto_144642 ) ( CLEAR ?auto_144643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_144646 ?auto_144640 ?auto_144641 ?auto_144642 )
      ( MAKE-6PILE ?auto_144640 ?auto_144641 ?auto_144642 ?auto_144643 ?auto_144644 ?auto_144645 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_144649 - BLOCK
      ?auto_144650 - BLOCK
      ?auto_144651 - BLOCK
      ?auto_144652 - BLOCK
      ?auto_144653 - BLOCK
      ?auto_144654 - BLOCK
    )
    :vars
    (
      ?auto_144655 - BLOCK
      ?auto_144657 - BLOCK
      ?auto_144656 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144649 ?auto_144650 ) ) ( not ( = ?auto_144649 ?auto_144651 ) ) ( not ( = ?auto_144649 ?auto_144652 ) ) ( not ( = ?auto_144649 ?auto_144653 ) ) ( not ( = ?auto_144649 ?auto_144654 ) ) ( not ( = ?auto_144650 ?auto_144651 ) ) ( not ( = ?auto_144650 ?auto_144652 ) ) ( not ( = ?auto_144650 ?auto_144653 ) ) ( not ( = ?auto_144650 ?auto_144654 ) ) ( not ( = ?auto_144651 ?auto_144652 ) ) ( not ( = ?auto_144651 ?auto_144653 ) ) ( not ( = ?auto_144651 ?auto_144654 ) ) ( not ( = ?auto_144652 ?auto_144653 ) ) ( not ( = ?auto_144652 ?auto_144654 ) ) ( not ( = ?auto_144653 ?auto_144654 ) ) ( ON ?auto_144654 ?auto_144655 ) ( not ( = ?auto_144649 ?auto_144655 ) ) ( not ( = ?auto_144650 ?auto_144655 ) ) ( not ( = ?auto_144651 ?auto_144655 ) ) ( not ( = ?auto_144652 ?auto_144655 ) ) ( not ( = ?auto_144653 ?auto_144655 ) ) ( not ( = ?auto_144654 ?auto_144655 ) ) ( ON-TABLE ?auto_144657 ) ( ON ?auto_144655 ?auto_144657 ) ( not ( = ?auto_144657 ?auto_144655 ) ) ( not ( = ?auto_144657 ?auto_144654 ) ) ( not ( = ?auto_144657 ?auto_144653 ) ) ( not ( = ?auto_144649 ?auto_144657 ) ) ( not ( = ?auto_144650 ?auto_144657 ) ) ( not ( = ?auto_144651 ?auto_144657 ) ) ( not ( = ?auto_144652 ?auto_144657 ) ) ( ON ?auto_144649 ?auto_144656 ) ( not ( = ?auto_144649 ?auto_144656 ) ) ( not ( = ?auto_144650 ?auto_144656 ) ) ( not ( = ?auto_144651 ?auto_144656 ) ) ( not ( = ?auto_144652 ?auto_144656 ) ) ( not ( = ?auto_144653 ?auto_144656 ) ) ( not ( = ?auto_144654 ?auto_144656 ) ) ( not ( = ?auto_144655 ?auto_144656 ) ) ( not ( = ?auto_144657 ?auto_144656 ) ) ( ON ?auto_144650 ?auto_144649 ) ( ON-TABLE ?auto_144656 ) ( ON ?auto_144651 ?auto_144650 ) ( ON ?auto_144652 ?auto_144651 ) ( CLEAR ?auto_144652 ) ( HOLDING ?auto_144653 ) ( CLEAR ?auto_144654 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_144657 ?auto_144655 ?auto_144654 ?auto_144653 )
      ( MAKE-6PILE ?auto_144649 ?auto_144650 ?auto_144651 ?auto_144652 ?auto_144653 ?auto_144654 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_144658 - BLOCK
      ?auto_144659 - BLOCK
      ?auto_144660 - BLOCK
      ?auto_144661 - BLOCK
      ?auto_144662 - BLOCK
      ?auto_144663 - BLOCK
    )
    :vars
    (
      ?auto_144666 - BLOCK
      ?auto_144665 - BLOCK
      ?auto_144664 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144658 ?auto_144659 ) ) ( not ( = ?auto_144658 ?auto_144660 ) ) ( not ( = ?auto_144658 ?auto_144661 ) ) ( not ( = ?auto_144658 ?auto_144662 ) ) ( not ( = ?auto_144658 ?auto_144663 ) ) ( not ( = ?auto_144659 ?auto_144660 ) ) ( not ( = ?auto_144659 ?auto_144661 ) ) ( not ( = ?auto_144659 ?auto_144662 ) ) ( not ( = ?auto_144659 ?auto_144663 ) ) ( not ( = ?auto_144660 ?auto_144661 ) ) ( not ( = ?auto_144660 ?auto_144662 ) ) ( not ( = ?auto_144660 ?auto_144663 ) ) ( not ( = ?auto_144661 ?auto_144662 ) ) ( not ( = ?auto_144661 ?auto_144663 ) ) ( not ( = ?auto_144662 ?auto_144663 ) ) ( ON ?auto_144663 ?auto_144666 ) ( not ( = ?auto_144658 ?auto_144666 ) ) ( not ( = ?auto_144659 ?auto_144666 ) ) ( not ( = ?auto_144660 ?auto_144666 ) ) ( not ( = ?auto_144661 ?auto_144666 ) ) ( not ( = ?auto_144662 ?auto_144666 ) ) ( not ( = ?auto_144663 ?auto_144666 ) ) ( ON-TABLE ?auto_144665 ) ( ON ?auto_144666 ?auto_144665 ) ( not ( = ?auto_144665 ?auto_144666 ) ) ( not ( = ?auto_144665 ?auto_144663 ) ) ( not ( = ?auto_144665 ?auto_144662 ) ) ( not ( = ?auto_144658 ?auto_144665 ) ) ( not ( = ?auto_144659 ?auto_144665 ) ) ( not ( = ?auto_144660 ?auto_144665 ) ) ( not ( = ?auto_144661 ?auto_144665 ) ) ( ON ?auto_144658 ?auto_144664 ) ( not ( = ?auto_144658 ?auto_144664 ) ) ( not ( = ?auto_144659 ?auto_144664 ) ) ( not ( = ?auto_144660 ?auto_144664 ) ) ( not ( = ?auto_144661 ?auto_144664 ) ) ( not ( = ?auto_144662 ?auto_144664 ) ) ( not ( = ?auto_144663 ?auto_144664 ) ) ( not ( = ?auto_144666 ?auto_144664 ) ) ( not ( = ?auto_144665 ?auto_144664 ) ) ( ON ?auto_144659 ?auto_144658 ) ( ON-TABLE ?auto_144664 ) ( ON ?auto_144660 ?auto_144659 ) ( ON ?auto_144661 ?auto_144660 ) ( CLEAR ?auto_144663 ) ( ON ?auto_144662 ?auto_144661 ) ( CLEAR ?auto_144662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_144664 ?auto_144658 ?auto_144659 ?auto_144660 ?auto_144661 )
      ( MAKE-6PILE ?auto_144658 ?auto_144659 ?auto_144660 ?auto_144661 ?auto_144662 ?auto_144663 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_144667 - BLOCK
      ?auto_144668 - BLOCK
      ?auto_144669 - BLOCK
      ?auto_144670 - BLOCK
      ?auto_144671 - BLOCK
      ?auto_144672 - BLOCK
    )
    :vars
    (
      ?auto_144675 - BLOCK
      ?auto_144673 - BLOCK
      ?auto_144674 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144667 ?auto_144668 ) ) ( not ( = ?auto_144667 ?auto_144669 ) ) ( not ( = ?auto_144667 ?auto_144670 ) ) ( not ( = ?auto_144667 ?auto_144671 ) ) ( not ( = ?auto_144667 ?auto_144672 ) ) ( not ( = ?auto_144668 ?auto_144669 ) ) ( not ( = ?auto_144668 ?auto_144670 ) ) ( not ( = ?auto_144668 ?auto_144671 ) ) ( not ( = ?auto_144668 ?auto_144672 ) ) ( not ( = ?auto_144669 ?auto_144670 ) ) ( not ( = ?auto_144669 ?auto_144671 ) ) ( not ( = ?auto_144669 ?auto_144672 ) ) ( not ( = ?auto_144670 ?auto_144671 ) ) ( not ( = ?auto_144670 ?auto_144672 ) ) ( not ( = ?auto_144671 ?auto_144672 ) ) ( not ( = ?auto_144667 ?auto_144675 ) ) ( not ( = ?auto_144668 ?auto_144675 ) ) ( not ( = ?auto_144669 ?auto_144675 ) ) ( not ( = ?auto_144670 ?auto_144675 ) ) ( not ( = ?auto_144671 ?auto_144675 ) ) ( not ( = ?auto_144672 ?auto_144675 ) ) ( ON-TABLE ?auto_144673 ) ( ON ?auto_144675 ?auto_144673 ) ( not ( = ?auto_144673 ?auto_144675 ) ) ( not ( = ?auto_144673 ?auto_144672 ) ) ( not ( = ?auto_144673 ?auto_144671 ) ) ( not ( = ?auto_144667 ?auto_144673 ) ) ( not ( = ?auto_144668 ?auto_144673 ) ) ( not ( = ?auto_144669 ?auto_144673 ) ) ( not ( = ?auto_144670 ?auto_144673 ) ) ( ON ?auto_144667 ?auto_144674 ) ( not ( = ?auto_144667 ?auto_144674 ) ) ( not ( = ?auto_144668 ?auto_144674 ) ) ( not ( = ?auto_144669 ?auto_144674 ) ) ( not ( = ?auto_144670 ?auto_144674 ) ) ( not ( = ?auto_144671 ?auto_144674 ) ) ( not ( = ?auto_144672 ?auto_144674 ) ) ( not ( = ?auto_144675 ?auto_144674 ) ) ( not ( = ?auto_144673 ?auto_144674 ) ) ( ON ?auto_144668 ?auto_144667 ) ( ON-TABLE ?auto_144674 ) ( ON ?auto_144669 ?auto_144668 ) ( ON ?auto_144670 ?auto_144669 ) ( ON ?auto_144671 ?auto_144670 ) ( CLEAR ?auto_144671 ) ( HOLDING ?auto_144672 ) ( CLEAR ?auto_144675 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_144673 ?auto_144675 ?auto_144672 )
      ( MAKE-6PILE ?auto_144667 ?auto_144668 ?auto_144669 ?auto_144670 ?auto_144671 ?auto_144672 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_144676 - BLOCK
      ?auto_144677 - BLOCK
      ?auto_144678 - BLOCK
      ?auto_144679 - BLOCK
      ?auto_144680 - BLOCK
      ?auto_144681 - BLOCK
    )
    :vars
    (
      ?auto_144683 - BLOCK
      ?auto_144682 - BLOCK
      ?auto_144684 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144676 ?auto_144677 ) ) ( not ( = ?auto_144676 ?auto_144678 ) ) ( not ( = ?auto_144676 ?auto_144679 ) ) ( not ( = ?auto_144676 ?auto_144680 ) ) ( not ( = ?auto_144676 ?auto_144681 ) ) ( not ( = ?auto_144677 ?auto_144678 ) ) ( not ( = ?auto_144677 ?auto_144679 ) ) ( not ( = ?auto_144677 ?auto_144680 ) ) ( not ( = ?auto_144677 ?auto_144681 ) ) ( not ( = ?auto_144678 ?auto_144679 ) ) ( not ( = ?auto_144678 ?auto_144680 ) ) ( not ( = ?auto_144678 ?auto_144681 ) ) ( not ( = ?auto_144679 ?auto_144680 ) ) ( not ( = ?auto_144679 ?auto_144681 ) ) ( not ( = ?auto_144680 ?auto_144681 ) ) ( not ( = ?auto_144676 ?auto_144683 ) ) ( not ( = ?auto_144677 ?auto_144683 ) ) ( not ( = ?auto_144678 ?auto_144683 ) ) ( not ( = ?auto_144679 ?auto_144683 ) ) ( not ( = ?auto_144680 ?auto_144683 ) ) ( not ( = ?auto_144681 ?auto_144683 ) ) ( ON-TABLE ?auto_144682 ) ( ON ?auto_144683 ?auto_144682 ) ( not ( = ?auto_144682 ?auto_144683 ) ) ( not ( = ?auto_144682 ?auto_144681 ) ) ( not ( = ?auto_144682 ?auto_144680 ) ) ( not ( = ?auto_144676 ?auto_144682 ) ) ( not ( = ?auto_144677 ?auto_144682 ) ) ( not ( = ?auto_144678 ?auto_144682 ) ) ( not ( = ?auto_144679 ?auto_144682 ) ) ( ON ?auto_144676 ?auto_144684 ) ( not ( = ?auto_144676 ?auto_144684 ) ) ( not ( = ?auto_144677 ?auto_144684 ) ) ( not ( = ?auto_144678 ?auto_144684 ) ) ( not ( = ?auto_144679 ?auto_144684 ) ) ( not ( = ?auto_144680 ?auto_144684 ) ) ( not ( = ?auto_144681 ?auto_144684 ) ) ( not ( = ?auto_144683 ?auto_144684 ) ) ( not ( = ?auto_144682 ?auto_144684 ) ) ( ON ?auto_144677 ?auto_144676 ) ( ON-TABLE ?auto_144684 ) ( ON ?auto_144678 ?auto_144677 ) ( ON ?auto_144679 ?auto_144678 ) ( ON ?auto_144680 ?auto_144679 ) ( CLEAR ?auto_144683 ) ( ON ?auto_144681 ?auto_144680 ) ( CLEAR ?auto_144681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_144684 ?auto_144676 ?auto_144677 ?auto_144678 ?auto_144679 ?auto_144680 )
      ( MAKE-6PILE ?auto_144676 ?auto_144677 ?auto_144678 ?auto_144679 ?auto_144680 ?auto_144681 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_144685 - BLOCK
      ?auto_144686 - BLOCK
      ?auto_144687 - BLOCK
      ?auto_144688 - BLOCK
      ?auto_144689 - BLOCK
      ?auto_144690 - BLOCK
    )
    :vars
    (
      ?auto_144691 - BLOCK
      ?auto_144692 - BLOCK
      ?auto_144693 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144685 ?auto_144686 ) ) ( not ( = ?auto_144685 ?auto_144687 ) ) ( not ( = ?auto_144685 ?auto_144688 ) ) ( not ( = ?auto_144685 ?auto_144689 ) ) ( not ( = ?auto_144685 ?auto_144690 ) ) ( not ( = ?auto_144686 ?auto_144687 ) ) ( not ( = ?auto_144686 ?auto_144688 ) ) ( not ( = ?auto_144686 ?auto_144689 ) ) ( not ( = ?auto_144686 ?auto_144690 ) ) ( not ( = ?auto_144687 ?auto_144688 ) ) ( not ( = ?auto_144687 ?auto_144689 ) ) ( not ( = ?auto_144687 ?auto_144690 ) ) ( not ( = ?auto_144688 ?auto_144689 ) ) ( not ( = ?auto_144688 ?auto_144690 ) ) ( not ( = ?auto_144689 ?auto_144690 ) ) ( not ( = ?auto_144685 ?auto_144691 ) ) ( not ( = ?auto_144686 ?auto_144691 ) ) ( not ( = ?auto_144687 ?auto_144691 ) ) ( not ( = ?auto_144688 ?auto_144691 ) ) ( not ( = ?auto_144689 ?auto_144691 ) ) ( not ( = ?auto_144690 ?auto_144691 ) ) ( ON-TABLE ?auto_144692 ) ( not ( = ?auto_144692 ?auto_144691 ) ) ( not ( = ?auto_144692 ?auto_144690 ) ) ( not ( = ?auto_144692 ?auto_144689 ) ) ( not ( = ?auto_144685 ?auto_144692 ) ) ( not ( = ?auto_144686 ?auto_144692 ) ) ( not ( = ?auto_144687 ?auto_144692 ) ) ( not ( = ?auto_144688 ?auto_144692 ) ) ( ON ?auto_144685 ?auto_144693 ) ( not ( = ?auto_144685 ?auto_144693 ) ) ( not ( = ?auto_144686 ?auto_144693 ) ) ( not ( = ?auto_144687 ?auto_144693 ) ) ( not ( = ?auto_144688 ?auto_144693 ) ) ( not ( = ?auto_144689 ?auto_144693 ) ) ( not ( = ?auto_144690 ?auto_144693 ) ) ( not ( = ?auto_144691 ?auto_144693 ) ) ( not ( = ?auto_144692 ?auto_144693 ) ) ( ON ?auto_144686 ?auto_144685 ) ( ON-TABLE ?auto_144693 ) ( ON ?auto_144687 ?auto_144686 ) ( ON ?auto_144688 ?auto_144687 ) ( ON ?auto_144689 ?auto_144688 ) ( ON ?auto_144690 ?auto_144689 ) ( CLEAR ?auto_144690 ) ( HOLDING ?auto_144691 ) ( CLEAR ?auto_144692 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_144692 ?auto_144691 )
      ( MAKE-6PILE ?auto_144685 ?auto_144686 ?auto_144687 ?auto_144688 ?auto_144689 ?auto_144690 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_144694 - BLOCK
      ?auto_144695 - BLOCK
      ?auto_144696 - BLOCK
      ?auto_144697 - BLOCK
      ?auto_144698 - BLOCK
      ?auto_144699 - BLOCK
    )
    :vars
    (
      ?auto_144702 - BLOCK
      ?auto_144700 - BLOCK
      ?auto_144701 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144694 ?auto_144695 ) ) ( not ( = ?auto_144694 ?auto_144696 ) ) ( not ( = ?auto_144694 ?auto_144697 ) ) ( not ( = ?auto_144694 ?auto_144698 ) ) ( not ( = ?auto_144694 ?auto_144699 ) ) ( not ( = ?auto_144695 ?auto_144696 ) ) ( not ( = ?auto_144695 ?auto_144697 ) ) ( not ( = ?auto_144695 ?auto_144698 ) ) ( not ( = ?auto_144695 ?auto_144699 ) ) ( not ( = ?auto_144696 ?auto_144697 ) ) ( not ( = ?auto_144696 ?auto_144698 ) ) ( not ( = ?auto_144696 ?auto_144699 ) ) ( not ( = ?auto_144697 ?auto_144698 ) ) ( not ( = ?auto_144697 ?auto_144699 ) ) ( not ( = ?auto_144698 ?auto_144699 ) ) ( not ( = ?auto_144694 ?auto_144702 ) ) ( not ( = ?auto_144695 ?auto_144702 ) ) ( not ( = ?auto_144696 ?auto_144702 ) ) ( not ( = ?auto_144697 ?auto_144702 ) ) ( not ( = ?auto_144698 ?auto_144702 ) ) ( not ( = ?auto_144699 ?auto_144702 ) ) ( ON-TABLE ?auto_144700 ) ( not ( = ?auto_144700 ?auto_144702 ) ) ( not ( = ?auto_144700 ?auto_144699 ) ) ( not ( = ?auto_144700 ?auto_144698 ) ) ( not ( = ?auto_144694 ?auto_144700 ) ) ( not ( = ?auto_144695 ?auto_144700 ) ) ( not ( = ?auto_144696 ?auto_144700 ) ) ( not ( = ?auto_144697 ?auto_144700 ) ) ( ON ?auto_144694 ?auto_144701 ) ( not ( = ?auto_144694 ?auto_144701 ) ) ( not ( = ?auto_144695 ?auto_144701 ) ) ( not ( = ?auto_144696 ?auto_144701 ) ) ( not ( = ?auto_144697 ?auto_144701 ) ) ( not ( = ?auto_144698 ?auto_144701 ) ) ( not ( = ?auto_144699 ?auto_144701 ) ) ( not ( = ?auto_144702 ?auto_144701 ) ) ( not ( = ?auto_144700 ?auto_144701 ) ) ( ON ?auto_144695 ?auto_144694 ) ( ON-TABLE ?auto_144701 ) ( ON ?auto_144696 ?auto_144695 ) ( ON ?auto_144697 ?auto_144696 ) ( ON ?auto_144698 ?auto_144697 ) ( ON ?auto_144699 ?auto_144698 ) ( CLEAR ?auto_144700 ) ( ON ?auto_144702 ?auto_144699 ) ( CLEAR ?auto_144702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_144701 ?auto_144694 ?auto_144695 ?auto_144696 ?auto_144697 ?auto_144698 ?auto_144699 )
      ( MAKE-6PILE ?auto_144694 ?auto_144695 ?auto_144696 ?auto_144697 ?auto_144698 ?auto_144699 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_144703 - BLOCK
      ?auto_144704 - BLOCK
      ?auto_144705 - BLOCK
      ?auto_144706 - BLOCK
      ?auto_144707 - BLOCK
      ?auto_144708 - BLOCK
    )
    :vars
    (
      ?auto_144711 - BLOCK
      ?auto_144709 - BLOCK
      ?auto_144710 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144703 ?auto_144704 ) ) ( not ( = ?auto_144703 ?auto_144705 ) ) ( not ( = ?auto_144703 ?auto_144706 ) ) ( not ( = ?auto_144703 ?auto_144707 ) ) ( not ( = ?auto_144703 ?auto_144708 ) ) ( not ( = ?auto_144704 ?auto_144705 ) ) ( not ( = ?auto_144704 ?auto_144706 ) ) ( not ( = ?auto_144704 ?auto_144707 ) ) ( not ( = ?auto_144704 ?auto_144708 ) ) ( not ( = ?auto_144705 ?auto_144706 ) ) ( not ( = ?auto_144705 ?auto_144707 ) ) ( not ( = ?auto_144705 ?auto_144708 ) ) ( not ( = ?auto_144706 ?auto_144707 ) ) ( not ( = ?auto_144706 ?auto_144708 ) ) ( not ( = ?auto_144707 ?auto_144708 ) ) ( not ( = ?auto_144703 ?auto_144711 ) ) ( not ( = ?auto_144704 ?auto_144711 ) ) ( not ( = ?auto_144705 ?auto_144711 ) ) ( not ( = ?auto_144706 ?auto_144711 ) ) ( not ( = ?auto_144707 ?auto_144711 ) ) ( not ( = ?auto_144708 ?auto_144711 ) ) ( not ( = ?auto_144709 ?auto_144711 ) ) ( not ( = ?auto_144709 ?auto_144708 ) ) ( not ( = ?auto_144709 ?auto_144707 ) ) ( not ( = ?auto_144703 ?auto_144709 ) ) ( not ( = ?auto_144704 ?auto_144709 ) ) ( not ( = ?auto_144705 ?auto_144709 ) ) ( not ( = ?auto_144706 ?auto_144709 ) ) ( ON ?auto_144703 ?auto_144710 ) ( not ( = ?auto_144703 ?auto_144710 ) ) ( not ( = ?auto_144704 ?auto_144710 ) ) ( not ( = ?auto_144705 ?auto_144710 ) ) ( not ( = ?auto_144706 ?auto_144710 ) ) ( not ( = ?auto_144707 ?auto_144710 ) ) ( not ( = ?auto_144708 ?auto_144710 ) ) ( not ( = ?auto_144711 ?auto_144710 ) ) ( not ( = ?auto_144709 ?auto_144710 ) ) ( ON ?auto_144704 ?auto_144703 ) ( ON-TABLE ?auto_144710 ) ( ON ?auto_144705 ?auto_144704 ) ( ON ?auto_144706 ?auto_144705 ) ( ON ?auto_144707 ?auto_144706 ) ( ON ?auto_144708 ?auto_144707 ) ( ON ?auto_144711 ?auto_144708 ) ( CLEAR ?auto_144711 ) ( HOLDING ?auto_144709 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_144709 )
      ( MAKE-6PILE ?auto_144703 ?auto_144704 ?auto_144705 ?auto_144706 ?auto_144707 ?auto_144708 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_144712 - BLOCK
      ?auto_144713 - BLOCK
      ?auto_144714 - BLOCK
      ?auto_144715 - BLOCK
      ?auto_144716 - BLOCK
      ?auto_144717 - BLOCK
    )
    :vars
    (
      ?auto_144719 - BLOCK
      ?auto_144720 - BLOCK
      ?auto_144718 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144712 ?auto_144713 ) ) ( not ( = ?auto_144712 ?auto_144714 ) ) ( not ( = ?auto_144712 ?auto_144715 ) ) ( not ( = ?auto_144712 ?auto_144716 ) ) ( not ( = ?auto_144712 ?auto_144717 ) ) ( not ( = ?auto_144713 ?auto_144714 ) ) ( not ( = ?auto_144713 ?auto_144715 ) ) ( not ( = ?auto_144713 ?auto_144716 ) ) ( not ( = ?auto_144713 ?auto_144717 ) ) ( not ( = ?auto_144714 ?auto_144715 ) ) ( not ( = ?auto_144714 ?auto_144716 ) ) ( not ( = ?auto_144714 ?auto_144717 ) ) ( not ( = ?auto_144715 ?auto_144716 ) ) ( not ( = ?auto_144715 ?auto_144717 ) ) ( not ( = ?auto_144716 ?auto_144717 ) ) ( not ( = ?auto_144712 ?auto_144719 ) ) ( not ( = ?auto_144713 ?auto_144719 ) ) ( not ( = ?auto_144714 ?auto_144719 ) ) ( not ( = ?auto_144715 ?auto_144719 ) ) ( not ( = ?auto_144716 ?auto_144719 ) ) ( not ( = ?auto_144717 ?auto_144719 ) ) ( not ( = ?auto_144720 ?auto_144719 ) ) ( not ( = ?auto_144720 ?auto_144717 ) ) ( not ( = ?auto_144720 ?auto_144716 ) ) ( not ( = ?auto_144712 ?auto_144720 ) ) ( not ( = ?auto_144713 ?auto_144720 ) ) ( not ( = ?auto_144714 ?auto_144720 ) ) ( not ( = ?auto_144715 ?auto_144720 ) ) ( ON ?auto_144712 ?auto_144718 ) ( not ( = ?auto_144712 ?auto_144718 ) ) ( not ( = ?auto_144713 ?auto_144718 ) ) ( not ( = ?auto_144714 ?auto_144718 ) ) ( not ( = ?auto_144715 ?auto_144718 ) ) ( not ( = ?auto_144716 ?auto_144718 ) ) ( not ( = ?auto_144717 ?auto_144718 ) ) ( not ( = ?auto_144719 ?auto_144718 ) ) ( not ( = ?auto_144720 ?auto_144718 ) ) ( ON ?auto_144713 ?auto_144712 ) ( ON-TABLE ?auto_144718 ) ( ON ?auto_144714 ?auto_144713 ) ( ON ?auto_144715 ?auto_144714 ) ( ON ?auto_144716 ?auto_144715 ) ( ON ?auto_144717 ?auto_144716 ) ( ON ?auto_144719 ?auto_144717 ) ( ON ?auto_144720 ?auto_144719 ) ( CLEAR ?auto_144720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_144718 ?auto_144712 ?auto_144713 ?auto_144714 ?auto_144715 ?auto_144716 ?auto_144717 ?auto_144719 )
      ( MAKE-6PILE ?auto_144712 ?auto_144713 ?auto_144714 ?auto_144715 ?auto_144716 ?auto_144717 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144722 - BLOCK
    )
    :vars
    (
      ?auto_144723 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144723 ?auto_144722 ) ( CLEAR ?auto_144723 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_144722 ) ( not ( = ?auto_144722 ?auto_144723 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_144723 ?auto_144722 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144724 - BLOCK
    )
    :vars
    (
      ?auto_144725 - BLOCK
      ?auto_144726 - BLOCK
      ?auto_144727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144725 ?auto_144724 ) ( CLEAR ?auto_144725 ) ( ON-TABLE ?auto_144724 ) ( not ( = ?auto_144724 ?auto_144725 ) ) ( HOLDING ?auto_144726 ) ( CLEAR ?auto_144727 ) ( not ( = ?auto_144724 ?auto_144726 ) ) ( not ( = ?auto_144724 ?auto_144727 ) ) ( not ( = ?auto_144725 ?auto_144726 ) ) ( not ( = ?auto_144725 ?auto_144727 ) ) ( not ( = ?auto_144726 ?auto_144727 ) ) )
    :subtasks
    ( ( !STACK ?auto_144726 ?auto_144727 )
      ( MAKE-1PILE ?auto_144724 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144728 - BLOCK
    )
    :vars
    (
      ?auto_144729 - BLOCK
      ?auto_144730 - BLOCK
      ?auto_144731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144729 ?auto_144728 ) ( ON-TABLE ?auto_144728 ) ( not ( = ?auto_144728 ?auto_144729 ) ) ( CLEAR ?auto_144730 ) ( not ( = ?auto_144728 ?auto_144731 ) ) ( not ( = ?auto_144728 ?auto_144730 ) ) ( not ( = ?auto_144729 ?auto_144731 ) ) ( not ( = ?auto_144729 ?auto_144730 ) ) ( not ( = ?auto_144731 ?auto_144730 ) ) ( ON ?auto_144731 ?auto_144729 ) ( CLEAR ?auto_144731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_144728 ?auto_144729 )
      ( MAKE-1PILE ?auto_144728 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144732 - BLOCK
    )
    :vars
    (
      ?auto_144735 - BLOCK
      ?auto_144734 - BLOCK
      ?auto_144733 - BLOCK
      ?auto_144737 - BLOCK
      ?auto_144738 - BLOCK
      ?auto_144739 - BLOCK
      ?auto_144736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144735 ?auto_144732 ) ( ON-TABLE ?auto_144732 ) ( not ( = ?auto_144732 ?auto_144735 ) ) ( not ( = ?auto_144732 ?auto_144734 ) ) ( not ( = ?auto_144732 ?auto_144733 ) ) ( not ( = ?auto_144735 ?auto_144734 ) ) ( not ( = ?auto_144735 ?auto_144733 ) ) ( not ( = ?auto_144734 ?auto_144733 ) ) ( ON ?auto_144734 ?auto_144735 ) ( CLEAR ?auto_144734 ) ( HOLDING ?auto_144733 ) ( CLEAR ?auto_144737 ) ( ON-TABLE ?auto_144738 ) ( ON ?auto_144739 ?auto_144738 ) ( ON ?auto_144736 ?auto_144739 ) ( ON ?auto_144737 ?auto_144736 ) ( not ( = ?auto_144738 ?auto_144739 ) ) ( not ( = ?auto_144738 ?auto_144736 ) ) ( not ( = ?auto_144738 ?auto_144737 ) ) ( not ( = ?auto_144738 ?auto_144733 ) ) ( not ( = ?auto_144739 ?auto_144736 ) ) ( not ( = ?auto_144739 ?auto_144737 ) ) ( not ( = ?auto_144739 ?auto_144733 ) ) ( not ( = ?auto_144736 ?auto_144737 ) ) ( not ( = ?auto_144736 ?auto_144733 ) ) ( not ( = ?auto_144737 ?auto_144733 ) ) ( not ( = ?auto_144732 ?auto_144737 ) ) ( not ( = ?auto_144732 ?auto_144738 ) ) ( not ( = ?auto_144732 ?auto_144739 ) ) ( not ( = ?auto_144732 ?auto_144736 ) ) ( not ( = ?auto_144735 ?auto_144737 ) ) ( not ( = ?auto_144735 ?auto_144738 ) ) ( not ( = ?auto_144735 ?auto_144739 ) ) ( not ( = ?auto_144735 ?auto_144736 ) ) ( not ( = ?auto_144734 ?auto_144737 ) ) ( not ( = ?auto_144734 ?auto_144738 ) ) ( not ( = ?auto_144734 ?auto_144739 ) ) ( not ( = ?auto_144734 ?auto_144736 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_144738 ?auto_144739 ?auto_144736 ?auto_144737 ?auto_144733 )
      ( MAKE-1PILE ?auto_144732 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144740 - BLOCK
    )
    :vars
    (
      ?auto_144746 - BLOCK
      ?auto_144747 - BLOCK
      ?auto_144745 - BLOCK
      ?auto_144741 - BLOCK
      ?auto_144742 - BLOCK
      ?auto_144744 - BLOCK
      ?auto_144743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144746 ?auto_144740 ) ( ON-TABLE ?auto_144740 ) ( not ( = ?auto_144740 ?auto_144746 ) ) ( not ( = ?auto_144740 ?auto_144747 ) ) ( not ( = ?auto_144740 ?auto_144745 ) ) ( not ( = ?auto_144746 ?auto_144747 ) ) ( not ( = ?auto_144746 ?auto_144745 ) ) ( not ( = ?auto_144747 ?auto_144745 ) ) ( ON ?auto_144747 ?auto_144746 ) ( CLEAR ?auto_144741 ) ( ON-TABLE ?auto_144742 ) ( ON ?auto_144744 ?auto_144742 ) ( ON ?auto_144743 ?auto_144744 ) ( ON ?auto_144741 ?auto_144743 ) ( not ( = ?auto_144742 ?auto_144744 ) ) ( not ( = ?auto_144742 ?auto_144743 ) ) ( not ( = ?auto_144742 ?auto_144741 ) ) ( not ( = ?auto_144742 ?auto_144745 ) ) ( not ( = ?auto_144744 ?auto_144743 ) ) ( not ( = ?auto_144744 ?auto_144741 ) ) ( not ( = ?auto_144744 ?auto_144745 ) ) ( not ( = ?auto_144743 ?auto_144741 ) ) ( not ( = ?auto_144743 ?auto_144745 ) ) ( not ( = ?auto_144741 ?auto_144745 ) ) ( not ( = ?auto_144740 ?auto_144741 ) ) ( not ( = ?auto_144740 ?auto_144742 ) ) ( not ( = ?auto_144740 ?auto_144744 ) ) ( not ( = ?auto_144740 ?auto_144743 ) ) ( not ( = ?auto_144746 ?auto_144741 ) ) ( not ( = ?auto_144746 ?auto_144742 ) ) ( not ( = ?auto_144746 ?auto_144744 ) ) ( not ( = ?auto_144746 ?auto_144743 ) ) ( not ( = ?auto_144747 ?auto_144741 ) ) ( not ( = ?auto_144747 ?auto_144742 ) ) ( not ( = ?auto_144747 ?auto_144744 ) ) ( not ( = ?auto_144747 ?auto_144743 ) ) ( ON ?auto_144745 ?auto_144747 ) ( CLEAR ?auto_144745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_144740 ?auto_144746 ?auto_144747 )
      ( MAKE-1PILE ?auto_144740 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144748 - BLOCK
    )
    :vars
    (
      ?auto_144750 - BLOCK
      ?auto_144751 - BLOCK
      ?auto_144754 - BLOCK
      ?auto_144749 - BLOCK
      ?auto_144753 - BLOCK
      ?auto_144755 - BLOCK
      ?auto_144752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144750 ?auto_144748 ) ( ON-TABLE ?auto_144748 ) ( not ( = ?auto_144748 ?auto_144750 ) ) ( not ( = ?auto_144748 ?auto_144751 ) ) ( not ( = ?auto_144748 ?auto_144754 ) ) ( not ( = ?auto_144750 ?auto_144751 ) ) ( not ( = ?auto_144750 ?auto_144754 ) ) ( not ( = ?auto_144751 ?auto_144754 ) ) ( ON ?auto_144751 ?auto_144750 ) ( ON-TABLE ?auto_144749 ) ( ON ?auto_144753 ?auto_144749 ) ( ON ?auto_144755 ?auto_144753 ) ( not ( = ?auto_144749 ?auto_144753 ) ) ( not ( = ?auto_144749 ?auto_144755 ) ) ( not ( = ?auto_144749 ?auto_144752 ) ) ( not ( = ?auto_144749 ?auto_144754 ) ) ( not ( = ?auto_144753 ?auto_144755 ) ) ( not ( = ?auto_144753 ?auto_144752 ) ) ( not ( = ?auto_144753 ?auto_144754 ) ) ( not ( = ?auto_144755 ?auto_144752 ) ) ( not ( = ?auto_144755 ?auto_144754 ) ) ( not ( = ?auto_144752 ?auto_144754 ) ) ( not ( = ?auto_144748 ?auto_144752 ) ) ( not ( = ?auto_144748 ?auto_144749 ) ) ( not ( = ?auto_144748 ?auto_144753 ) ) ( not ( = ?auto_144748 ?auto_144755 ) ) ( not ( = ?auto_144750 ?auto_144752 ) ) ( not ( = ?auto_144750 ?auto_144749 ) ) ( not ( = ?auto_144750 ?auto_144753 ) ) ( not ( = ?auto_144750 ?auto_144755 ) ) ( not ( = ?auto_144751 ?auto_144752 ) ) ( not ( = ?auto_144751 ?auto_144749 ) ) ( not ( = ?auto_144751 ?auto_144753 ) ) ( not ( = ?auto_144751 ?auto_144755 ) ) ( ON ?auto_144754 ?auto_144751 ) ( CLEAR ?auto_144754 ) ( HOLDING ?auto_144752 ) ( CLEAR ?auto_144755 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_144749 ?auto_144753 ?auto_144755 ?auto_144752 )
      ( MAKE-1PILE ?auto_144748 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144756 - BLOCK
    )
    :vars
    (
      ?auto_144763 - BLOCK
      ?auto_144760 - BLOCK
      ?auto_144759 - BLOCK
      ?auto_144762 - BLOCK
      ?auto_144757 - BLOCK
      ?auto_144758 - BLOCK
      ?auto_144761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144763 ?auto_144756 ) ( ON-TABLE ?auto_144756 ) ( not ( = ?auto_144756 ?auto_144763 ) ) ( not ( = ?auto_144756 ?auto_144760 ) ) ( not ( = ?auto_144756 ?auto_144759 ) ) ( not ( = ?auto_144763 ?auto_144760 ) ) ( not ( = ?auto_144763 ?auto_144759 ) ) ( not ( = ?auto_144760 ?auto_144759 ) ) ( ON ?auto_144760 ?auto_144763 ) ( ON-TABLE ?auto_144762 ) ( ON ?auto_144757 ?auto_144762 ) ( ON ?auto_144758 ?auto_144757 ) ( not ( = ?auto_144762 ?auto_144757 ) ) ( not ( = ?auto_144762 ?auto_144758 ) ) ( not ( = ?auto_144762 ?auto_144761 ) ) ( not ( = ?auto_144762 ?auto_144759 ) ) ( not ( = ?auto_144757 ?auto_144758 ) ) ( not ( = ?auto_144757 ?auto_144761 ) ) ( not ( = ?auto_144757 ?auto_144759 ) ) ( not ( = ?auto_144758 ?auto_144761 ) ) ( not ( = ?auto_144758 ?auto_144759 ) ) ( not ( = ?auto_144761 ?auto_144759 ) ) ( not ( = ?auto_144756 ?auto_144761 ) ) ( not ( = ?auto_144756 ?auto_144762 ) ) ( not ( = ?auto_144756 ?auto_144757 ) ) ( not ( = ?auto_144756 ?auto_144758 ) ) ( not ( = ?auto_144763 ?auto_144761 ) ) ( not ( = ?auto_144763 ?auto_144762 ) ) ( not ( = ?auto_144763 ?auto_144757 ) ) ( not ( = ?auto_144763 ?auto_144758 ) ) ( not ( = ?auto_144760 ?auto_144761 ) ) ( not ( = ?auto_144760 ?auto_144762 ) ) ( not ( = ?auto_144760 ?auto_144757 ) ) ( not ( = ?auto_144760 ?auto_144758 ) ) ( ON ?auto_144759 ?auto_144760 ) ( CLEAR ?auto_144758 ) ( ON ?auto_144761 ?auto_144759 ) ( CLEAR ?auto_144761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_144756 ?auto_144763 ?auto_144760 ?auto_144759 )
      ( MAKE-1PILE ?auto_144756 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144764 - BLOCK
    )
    :vars
    (
      ?auto_144770 - BLOCK
      ?auto_144768 - BLOCK
      ?auto_144766 - BLOCK
      ?auto_144767 - BLOCK
      ?auto_144769 - BLOCK
      ?auto_144771 - BLOCK
      ?auto_144765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144770 ?auto_144764 ) ( ON-TABLE ?auto_144764 ) ( not ( = ?auto_144764 ?auto_144770 ) ) ( not ( = ?auto_144764 ?auto_144768 ) ) ( not ( = ?auto_144764 ?auto_144766 ) ) ( not ( = ?auto_144770 ?auto_144768 ) ) ( not ( = ?auto_144770 ?auto_144766 ) ) ( not ( = ?auto_144768 ?auto_144766 ) ) ( ON ?auto_144768 ?auto_144770 ) ( ON-TABLE ?auto_144767 ) ( ON ?auto_144769 ?auto_144767 ) ( not ( = ?auto_144767 ?auto_144769 ) ) ( not ( = ?auto_144767 ?auto_144771 ) ) ( not ( = ?auto_144767 ?auto_144765 ) ) ( not ( = ?auto_144767 ?auto_144766 ) ) ( not ( = ?auto_144769 ?auto_144771 ) ) ( not ( = ?auto_144769 ?auto_144765 ) ) ( not ( = ?auto_144769 ?auto_144766 ) ) ( not ( = ?auto_144771 ?auto_144765 ) ) ( not ( = ?auto_144771 ?auto_144766 ) ) ( not ( = ?auto_144765 ?auto_144766 ) ) ( not ( = ?auto_144764 ?auto_144765 ) ) ( not ( = ?auto_144764 ?auto_144767 ) ) ( not ( = ?auto_144764 ?auto_144769 ) ) ( not ( = ?auto_144764 ?auto_144771 ) ) ( not ( = ?auto_144770 ?auto_144765 ) ) ( not ( = ?auto_144770 ?auto_144767 ) ) ( not ( = ?auto_144770 ?auto_144769 ) ) ( not ( = ?auto_144770 ?auto_144771 ) ) ( not ( = ?auto_144768 ?auto_144765 ) ) ( not ( = ?auto_144768 ?auto_144767 ) ) ( not ( = ?auto_144768 ?auto_144769 ) ) ( not ( = ?auto_144768 ?auto_144771 ) ) ( ON ?auto_144766 ?auto_144768 ) ( ON ?auto_144765 ?auto_144766 ) ( CLEAR ?auto_144765 ) ( HOLDING ?auto_144771 ) ( CLEAR ?auto_144769 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_144767 ?auto_144769 ?auto_144771 )
      ( MAKE-1PILE ?auto_144764 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144772 - BLOCK
    )
    :vars
    (
      ?auto_144773 - BLOCK
      ?auto_144779 - BLOCK
      ?auto_144775 - BLOCK
      ?auto_144776 - BLOCK
      ?auto_144778 - BLOCK
      ?auto_144774 - BLOCK
      ?auto_144777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144773 ?auto_144772 ) ( ON-TABLE ?auto_144772 ) ( not ( = ?auto_144772 ?auto_144773 ) ) ( not ( = ?auto_144772 ?auto_144779 ) ) ( not ( = ?auto_144772 ?auto_144775 ) ) ( not ( = ?auto_144773 ?auto_144779 ) ) ( not ( = ?auto_144773 ?auto_144775 ) ) ( not ( = ?auto_144779 ?auto_144775 ) ) ( ON ?auto_144779 ?auto_144773 ) ( ON-TABLE ?auto_144776 ) ( ON ?auto_144778 ?auto_144776 ) ( not ( = ?auto_144776 ?auto_144778 ) ) ( not ( = ?auto_144776 ?auto_144774 ) ) ( not ( = ?auto_144776 ?auto_144777 ) ) ( not ( = ?auto_144776 ?auto_144775 ) ) ( not ( = ?auto_144778 ?auto_144774 ) ) ( not ( = ?auto_144778 ?auto_144777 ) ) ( not ( = ?auto_144778 ?auto_144775 ) ) ( not ( = ?auto_144774 ?auto_144777 ) ) ( not ( = ?auto_144774 ?auto_144775 ) ) ( not ( = ?auto_144777 ?auto_144775 ) ) ( not ( = ?auto_144772 ?auto_144777 ) ) ( not ( = ?auto_144772 ?auto_144776 ) ) ( not ( = ?auto_144772 ?auto_144778 ) ) ( not ( = ?auto_144772 ?auto_144774 ) ) ( not ( = ?auto_144773 ?auto_144777 ) ) ( not ( = ?auto_144773 ?auto_144776 ) ) ( not ( = ?auto_144773 ?auto_144778 ) ) ( not ( = ?auto_144773 ?auto_144774 ) ) ( not ( = ?auto_144779 ?auto_144777 ) ) ( not ( = ?auto_144779 ?auto_144776 ) ) ( not ( = ?auto_144779 ?auto_144778 ) ) ( not ( = ?auto_144779 ?auto_144774 ) ) ( ON ?auto_144775 ?auto_144779 ) ( ON ?auto_144777 ?auto_144775 ) ( CLEAR ?auto_144778 ) ( ON ?auto_144774 ?auto_144777 ) ( CLEAR ?auto_144774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_144772 ?auto_144773 ?auto_144779 ?auto_144775 ?auto_144777 )
      ( MAKE-1PILE ?auto_144772 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144780 - BLOCK
    )
    :vars
    (
      ?auto_144784 - BLOCK
      ?auto_144786 - BLOCK
      ?auto_144781 - BLOCK
      ?auto_144787 - BLOCK
      ?auto_144782 - BLOCK
      ?auto_144783 - BLOCK
      ?auto_144785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144784 ?auto_144780 ) ( ON-TABLE ?auto_144780 ) ( not ( = ?auto_144780 ?auto_144784 ) ) ( not ( = ?auto_144780 ?auto_144786 ) ) ( not ( = ?auto_144780 ?auto_144781 ) ) ( not ( = ?auto_144784 ?auto_144786 ) ) ( not ( = ?auto_144784 ?auto_144781 ) ) ( not ( = ?auto_144786 ?auto_144781 ) ) ( ON ?auto_144786 ?auto_144784 ) ( ON-TABLE ?auto_144787 ) ( not ( = ?auto_144787 ?auto_144782 ) ) ( not ( = ?auto_144787 ?auto_144783 ) ) ( not ( = ?auto_144787 ?auto_144785 ) ) ( not ( = ?auto_144787 ?auto_144781 ) ) ( not ( = ?auto_144782 ?auto_144783 ) ) ( not ( = ?auto_144782 ?auto_144785 ) ) ( not ( = ?auto_144782 ?auto_144781 ) ) ( not ( = ?auto_144783 ?auto_144785 ) ) ( not ( = ?auto_144783 ?auto_144781 ) ) ( not ( = ?auto_144785 ?auto_144781 ) ) ( not ( = ?auto_144780 ?auto_144785 ) ) ( not ( = ?auto_144780 ?auto_144787 ) ) ( not ( = ?auto_144780 ?auto_144782 ) ) ( not ( = ?auto_144780 ?auto_144783 ) ) ( not ( = ?auto_144784 ?auto_144785 ) ) ( not ( = ?auto_144784 ?auto_144787 ) ) ( not ( = ?auto_144784 ?auto_144782 ) ) ( not ( = ?auto_144784 ?auto_144783 ) ) ( not ( = ?auto_144786 ?auto_144785 ) ) ( not ( = ?auto_144786 ?auto_144787 ) ) ( not ( = ?auto_144786 ?auto_144782 ) ) ( not ( = ?auto_144786 ?auto_144783 ) ) ( ON ?auto_144781 ?auto_144786 ) ( ON ?auto_144785 ?auto_144781 ) ( ON ?auto_144783 ?auto_144785 ) ( CLEAR ?auto_144783 ) ( HOLDING ?auto_144782 ) ( CLEAR ?auto_144787 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_144787 ?auto_144782 )
      ( MAKE-1PILE ?auto_144780 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144788 - BLOCK
    )
    :vars
    (
      ?auto_144794 - BLOCK
      ?auto_144789 - BLOCK
      ?auto_144790 - BLOCK
      ?auto_144795 - BLOCK
      ?auto_144791 - BLOCK
      ?auto_144793 - BLOCK
      ?auto_144792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144794 ?auto_144788 ) ( ON-TABLE ?auto_144788 ) ( not ( = ?auto_144788 ?auto_144794 ) ) ( not ( = ?auto_144788 ?auto_144789 ) ) ( not ( = ?auto_144788 ?auto_144790 ) ) ( not ( = ?auto_144794 ?auto_144789 ) ) ( not ( = ?auto_144794 ?auto_144790 ) ) ( not ( = ?auto_144789 ?auto_144790 ) ) ( ON ?auto_144789 ?auto_144794 ) ( ON-TABLE ?auto_144795 ) ( not ( = ?auto_144795 ?auto_144791 ) ) ( not ( = ?auto_144795 ?auto_144793 ) ) ( not ( = ?auto_144795 ?auto_144792 ) ) ( not ( = ?auto_144795 ?auto_144790 ) ) ( not ( = ?auto_144791 ?auto_144793 ) ) ( not ( = ?auto_144791 ?auto_144792 ) ) ( not ( = ?auto_144791 ?auto_144790 ) ) ( not ( = ?auto_144793 ?auto_144792 ) ) ( not ( = ?auto_144793 ?auto_144790 ) ) ( not ( = ?auto_144792 ?auto_144790 ) ) ( not ( = ?auto_144788 ?auto_144792 ) ) ( not ( = ?auto_144788 ?auto_144795 ) ) ( not ( = ?auto_144788 ?auto_144791 ) ) ( not ( = ?auto_144788 ?auto_144793 ) ) ( not ( = ?auto_144794 ?auto_144792 ) ) ( not ( = ?auto_144794 ?auto_144795 ) ) ( not ( = ?auto_144794 ?auto_144791 ) ) ( not ( = ?auto_144794 ?auto_144793 ) ) ( not ( = ?auto_144789 ?auto_144792 ) ) ( not ( = ?auto_144789 ?auto_144795 ) ) ( not ( = ?auto_144789 ?auto_144791 ) ) ( not ( = ?auto_144789 ?auto_144793 ) ) ( ON ?auto_144790 ?auto_144789 ) ( ON ?auto_144792 ?auto_144790 ) ( ON ?auto_144793 ?auto_144792 ) ( CLEAR ?auto_144795 ) ( ON ?auto_144791 ?auto_144793 ) ( CLEAR ?auto_144791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_144788 ?auto_144794 ?auto_144789 ?auto_144790 ?auto_144792 ?auto_144793 )
      ( MAKE-1PILE ?auto_144788 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144796 - BLOCK
    )
    :vars
    (
      ?auto_144801 - BLOCK
      ?auto_144800 - BLOCK
      ?auto_144803 - BLOCK
      ?auto_144799 - BLOCK
      ?auto_144798 - BLOCK
      ?auto_144797 - BLOCK
      ?auto_144802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144801 ?auto_144796 ) ( ON-TABLE ?auto_144796 ) ( not ( = ?auto_144796 ?auto_144801 ) ) ( not ( = ?auto_144796 ?auto_144800 ) ) ( not ( = ?auto_144796 ?auto_144803 ) ) ( not ( = ?auto_144801 ?auto_144800 ) ) ( not ( = ?auto_144801 ?auto_144803 ) ) ( not ( = ?auto_144800 ?auto_144803 ) ) ( ON ?auto_144800 ?auto_144801 ) ( not ( = ?auto_144799 ?auto_144798 ) ) ( not ( = ?auto_144799 ?auto_144797 ) ) ( not ( = ?auto_144799 ?auto_144802 ) ) ( not ( = ?auto_144799 ?auto_144803 ) ) ( not ( = ?auto_144798 ?auto_144797 ) ) ( not ( = ?auto_144798 ?auto_144802 ) ) ( not ( = ?auto_144798 ?auto_144803 ) ) ( not ( = ?auto_144797 ?auto_144802 ) ) ( not ( = ?auto_144797 ?auto_144803 ) ) ( not ( = ?auto_144802 ?auto_144803 ) ) ( not ( = ?auto_144796 ?auto_144802 ) ) ( not ( = ?auto_144796 ?auto_144799 ) ) ( not ( = ?auto_144796 ?auto_144798 ) ) ( not ( = ?auto_144796 ?auto_144797 ) ) ( not ( = ?auto_144801 ?auto_144802 ) ) ( not ( = ?auto_144801 ?auto_144799 ) ) ( not ( = ?auto_144801 ?auto_144798 ) ) ( not ( = ?auto_144801 ?auto_144797 ) ) ( not ( = ?auto_144800 ?auto_144802 ) ) ( not ( = ?auto_144800 ?auto_144799 ) ) ( not ( = ?auto_144800 ?auto_144798 ) ) ( not ( = ?auto_144800 ?auto_144797 ) ) ( ON ?auto_144803 ?auto_144800 ) ( ON ?auto_144802 ?auto_144803 ) ( ON ?auto_144797 ?auto_144802 ) ( ON ?auto_144798 ?auto_144797 ) ( CLEAR ?auto_144798 ) ( HOLDING ?auto_144799 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_144799 )
      ( MAKE-1PILE ?auto_144796 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144804 - BLOCK
    )
    :vars
    (
      ?auto_144808 - BLOCK
      ?auto_144809 - BLOCK
      ?auto_144807 - BLOCK
      ?auto_144810 - BLOCK
      ?auto_144806 - BLOCK
      ?auto_144811 - BLOCK
      ?auto_144805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144808 ?auto_144804 ) ( ON-TABLE ?auto_144804 ) ( not ( = ?auto_144804 ?auto_144808 ) ) ( not ( = ?auto_144804 ?auto_144809 ) ) ( not ( = ?auto_144804 ?auto_144807 ) ) ( not ( = ?auto_144808 ?auto_144809 ) ) ( not ( = ?auto_144808 ?auto_144807 ) ) ( not ( = ?auto_144809 ?auto_144807 ) ) ( ON ?auto_144809 ?auto_144808 ) ( not ( = ?auto_144810 ?auto_144806 ) ) ( not ( = ?auto_144810 ?auto_144811 ) ) ( not ( = ?auto_144810 ?auto_144805 ) ) ( not ( = ?auto_144810 ?auto_144807 ) ) ( not ( = ?auto_144806 ?auto_144811 ) ) ( not ( = ?auto_144806 ?auto_144805 ) ) ( not ( = ?auto_144806 ?auto_144807 ) ) ( not ( = ?auto_144811 ?auto_144805 ) ) ( not ( = ?auto_144811 ?auto_144807 ) ) ( not ( = ?auto_144805 ?auto_144807 ) ) ( not ( = ?auto_144804 ?auto_144805 ) ) ( not ( = ?auto_144804 ?auto_144810 ) ) ( not ( = ?auto_144804 ?auto_144806 ) ) ( not ( = ?auto_144804 ?auto_144811 ) ) ( not ( = ?auto_144808 ?auto_144805 ) ) ( not ( = ?auto_144808 ?auto_144810 ) ) ( not ( = ?auto_144808 ?auto_144806 ) ) ( not ( = ?auto_144808 ?auto_144811 ) ) ( not ( = ?auto_144809 ?auto_144805 ) ) ( not ( = ?auto_144809 ?auto_144810 ) ) ( not ( = ?auto_144809 ?auto_144806 ) ) ( not ( = ?auto_144809 ?auto_144811 ) ) ( ON ?auto_144807 ?auto_144809 ) ( ON ?auto_144805 ?auto_144807 ) ( ON ?auto_144811 ?auto_144805 ) ( ON ?auto_144806 ?auto_144811 ) ( ON ?auto_144810 ?auto_144806 ) ( CLEAR ?auto_144810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_144804 ?auto_144808 ?auto_144809 ?auto_144807 ?auto_144805 ?auto_144811 ?auto_144806 )
      ( MAKE-1PILE ?auto_144804 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144812 - BLOCK
    )
    :vars
    (
      ?auto_144816 - BLOCK
      ?auto_144818 - BLOCK
      ?auto_144813 - BLOCK
      ?auto_144814 - BLOCK
      ?auto_144815 - BLOCK
      ?auto_144817 - BLOCK
      ?auto_144819 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144816 ?auto_144812 ) ( ON-TABLE ?auto_144812 ) ( not ( = ?auto_144812 ?auto_144816 ) ) ( not ( = ?auto_144812 ?auto_144818 ) ) ( not ( = ?auto_144812 ?auto_144813 ) ) ( not ( = ?auto_144816 ?auto_144818 ) ) ( not ( = ?auto_144816 ?auto_144813 ) ) ( not ( = ?auto_144818 ?auto_144813 ) ) ( ON ?auto_144818 ?auto_144816 ) ( not ( = ?auto_144814 ?auto_144815 ) ) ( not ( = ?auto_144814 ?auto_144817 ) ) ( not ( = ?auto_144814 ?auto_144819 ) ) ( not ( = ?auto_144814 ?auto_144813 ) ) ( not ( = ?auto_144815 ?auto_144817 ) ) ( not ( = ?auto_144815 ?auto_144819 ) ) ( not ( = ?auto_144815 ?auto_144813 ) ) ( not ( = ?auto_144817 ?auto_144819 ) ) ( not ( = ?auto_144817 ?auto_144813 ) ) ( not ( = ?auto_144819 ?auto_144813 ) ) ( not ( = ?auto_144812 ?auto_144819 ) ) ( not ( = ?auto_144812 ?auto_144814 ) ) ( not ( = ?auto_144812 ?auto_144815 ) ) ( not ( = ?auto_144812 ?auto_144817 ) ) ( not ( = ?auto_144816 ?auto_144819 ) ) ( not ( = ?auto_144816 ?auto_144814 ) ) ( not ( = ?auto_144816 ?auto_144815 ) ) ( not ( = ?auto_144816 ?auto_144817 ) ) ( not ( = ?auto_144818 ?auto_144819 ) ) ( not ( = ?auto_144818 ?auto_144814 ) ) ( not ( = ?auto_144818 ?auto_144815 ) ) ( not ( = ?auto_144818 ?auto_144817 ) ) ( ON ?auto_144813 ?auto_144818 ) ( ON ?auto_144819 ?auto_144813 ) ( ON ?auto_144817 ?auto_144819 ) ( ON ?auto_144815 ?auto_144817 ) ( HOLDING ?auto_144814 ) ( CLEAR ?auto_144815 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_144812 ?auto_144816 ?auto_144818 ?auto_144813 ?auto_144819 ?auto_144817 ?auto_144815 ?auto_144814 )
      ( MAKE-1PILE ?auto_144812 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144820 - BLOCK
    )
    :vars
    (
      ?auto_144822 - BLOCK
      ?auto_144826 - BLOCK
      ?auto_144821 - BLOCK
      ?auto_144827 - BLOCK
      ?auto_144823 - BLOCK
      ?auto_144825 - BLOCK
      ?auto_144824 - BLOCK
      ?auto_144828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144822 ?auto_144820 ) ( ON-TABLE ?auto_144820 ) ( not ( = ?auto_144820 ?auto_144822 ) ) ( not ( = ?auto_144820 ?auto_144826 ) ) ( not ( = ?auto_144820 ?auto_144821 ) ) ( not ( = ?auto_144822 ?auto_144826 ) ) ( not ( = ?auto_144822 ?auto_144821 ) ) ( not ( = ?auto_144826 ?auto_144821 ) ) ( ON ?auto_144826 ?auto_144822 ) ( not ( = ?auto_144827 ?auto_144823 ) ) ( not ( = ?auto_144827 ?auto_144825 ) ) ( not ( = ?auto_144827 ?auto_144824 ) ) ( not ( = ?auto_144827 ?auto_144821 ) ) ( not ( = ?auto_144823 ?auto_144825 ) ) ( not ( = ?auto_144823 ?auto_144824 ) ) ( not ( = ?auto_144823 ?auto_144821 ) ) ( not ( = ?auto_144825 ?auto_144824 ) ) ( not ( = ?auto_144825 ?auto_144821 ) ) ( not ( = ?auto_144824 ?auto_144821 ) ) ( not ( = ?auto_144820 ?auto_144824 ) ) ( not ( = ?auto_144820 ?auto_144827 ) ) ( not ( = ?auto_144820 ?auto_144823 ) ) ( not ( = ?auto_144820 ?auto_144825 ) ) ( not ( = ?auto_144822 ?auto_144824 ) ) ( not ( = ?auto_144822 ?auto_144827 ) ) ( not ( = ?auto_144822 ?auto_144823 ) ) ( not ( = ?auto_144822 ?auto_144825 ) ) ( not ( = ?auto_144826 ?auto_144824 ) ) ( not ( = ?auto_144826 ?auto_144827 ) ) ( not ( = ?auto_144826 ?auto_144823 ) ) ( not ( = ?auto_144826 ?auto_144825 ) ) ( ON ?auto_144821 ?auto_144826 ) ( ON ?auto_144824 ?auto_144821 ) ( ON ?auto_144825 ?auto_144824 ) ( ON ?auto_144823 ?auto_144825 ) ( CLEAR ?auto_144823 ) ( ON ?auto_144827 ?auto_144828 ) ( CLEAR ?auto_144827 ) ( HAND-EMPTY ) ( not ( = ?auto_144820 ?auto_144828 ) ) ( not ( = ?auto_144822 ?auto_144828 ) ) ( not ( = ?auto_144826 ?auto_144828 ) ) ( not ( = ?auto_144821 ?auto_144828 ) ) ( not ( = ?auto_144827 ?auto_144828 ) ) ( not ( = ?auto_144823 ?auto_144828 ) ) ( not ( = ?auto_144825 ?auto_144828 ) ) ( not ( = ?auto_144824 ?auto_144828 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_144827 ?auto_144828 )
      ( MAKE-1PILE ?auto_144820 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144829 - BLOCK
    )
    :vars
    (
      ?auto_144835 - BLOCK
      ?auto_144831 - BLOCK
      ?auto_144830 - BLOCK
      ?auto_144837 - BLOCK
      ?auto_144833 - BLOCK
      ?auto_144836 - BLOCK
      ?auto_144832 - BLOCK
      ?auto_144834 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144835 ?auto_144829 ) ( ON-TABLE ?auto_144829 ) ( not ( = ?auto_144829 ?auto_144835 ) ) ( not ( = ?auto_144829 ?auto_144831 ) ) ( not ( = ?auto_144829 ?auto_144830 ) ) ( not ( = ?auto_144835 ?auto_144831 ) ) ( not ( = ?auto_144835 ?auto_144830 ) ) ( not ( = ?auto_144831 ?auto_144830 ) ) ( ON ?auto_144831 ?auto_144835 ) ( not ( = ?auto_144837 ?auto_144833 ) ) ( not ( = ?auto_144837 ?auto_144836 ) ) ( not ( = ?auto_144837 ?auto_144832 ) ) ( not ( = ?auto_144837 ?auto_144830 ) ) ( not ( = ?auto_144833 ?auto_144836 ) ) ( not ( = ?auto_144833 ?auto_144832 ) ) ( not ( = ?auto_144833 ?auto_144830 ) ) ( not ( = ?auto_144836 ?auto_144832 ) ) ( not ( = ?auto_144836 ?auto_144830 ) ) ( not ( = ?auto_144832 ?auto_144830 ) ) ( not ( = ?auto_144829 ?auto_144832 ) ) ( not ( = ?auto_144829 ?auto_144837 ) ) ( not ( = ?auto_144829 ?auto_144833 ) ) ( not ( = ?auto_144829 ?auto_144836 ) ) ( not ( = ?auto_144835 ?auto_144832 ) ) ( not ( = ?auto_144835 ?auto_144837 ) ) ( not ( = ?auto_144835 ?auto_144833 ) ) ( not ( = ?auto_144835 ?auto_144836 ) ) ( not ( = ?auto_144831 ?auto_144832 ) ) ( not ( = ?auto_144831 ?auto_144837 ) ) ( not ( = ?auto_144831 ?auto_144833 ) ) ( not ( = ?auto_144831 ?auto_144836 ) ) ( ON ?auto_144830 ?auto_144831 ) ( ON ?auto_144832 ?auto_144830 ) ( ON ?auto_144836 ?auto_144832 ) ( ON ?auto_144837 ?auto_144834 ) ( CLEAR ?auto_144837 ) ( not ( = ?auto_144829 ?auto_144834 ) ) ( not ( = ?auto_144835 ?auto_144834 ) ) ( not ( = ?auto_144831 ?auto_144834 ) ) ( not ( = ?auto_144830 ?auto_144834 ) ) ( not ( = ?auto_144837 ?auto_144834 ) ) ( not ( = ?auto_144833 ?auto_144834 ) ) ( not ( = ?auto_144836 ?auto_144834 ) ) ( not ( = ?auto_144832 ?auto_144834 ) ) ( HOLDING ?auto_144833 ) ( CLEAR ?auto_144836 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_144829 ?auto_144835 ?auto_144831 ?auto_144830 ?auto_144832 ?auto_144836 ?auto_144833 )
      ( MAKE-1PILE ?auto_144829 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144838 - BLOCK
    )
    :vars
    (
      ?auto_144842 - BLOCK
      ?auto_144846 - BLOCK
      ?auto_144843 - BLOCK
      ?auto_144840 - BLOCK
      ?auto_144841 - BLOCK
      ?auto_144845 - BLOCK
      ?auto_144839 - BLOCK
      ?auto_144844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144842 ?auto_144838 ) ( ON-TABLE ?auto_144838 ) ( not ( = ?auto_144838 ?auto_144842 ) ) ( not ( = ?auto_144838 ?auto_144846 ) ) ( not ( = ?auto_144838 ?auto_144843 ) ) ( not ( = ?auto_144842 ?auto_144846 ) ) ( not ( = ?auto_144842 ?auto_144843 ) ) ( not ( = ?auto_144846 ?auto_144843 ) ) ( ON ?auto_144846 ?auto_144842 ) ( not ( = ?auto_144840 ?auto_144841 ) ) ( not ( = ?auto_144840 ?auto_144845 ) ) ( not ( = ?auto_144840 ?auto_144839 ) ) ( not ( = ?auto_144840 ?auto_144843 ) ) ( not ( = ?auto_144841 ?auto_144845 ) ) ( not ( = ?auto_144841 ?auto_144839 ) ) ( not ( = ?auto_144841 ?auto_144843 ) ) ( not ( = ?auto_144845 ?auto_144839 ) ) ( not ( = ?auto_144845 ?auto_144843 ) ) ( not ( = ?auto_144839 ?auto_144843 ) ) ( not ( = ?auto_144838 ?auto_144839 ) ) ( not ( = ?auto_144838 ?auto_144840 ) ) ( not ( = ?auto_144838 ?auto_144841 ) ) ( not ( = ?auto_144838 ?auto_144845 ) ) ( not ( = ?auto_144842 ?auto_144839 ) ) ( not ( = ?auto_144842 ?auto_144840 ) ) ( not ( = ?auto_144842 ?auto_144841 ) ) ( not ( = ?auto_144842 ?auto_144845 ) ) ( not ( = ?auto_144846 ?auto_144839 ) ) ( not ( = ?auto_144846 ?auto_144840 ) ) ( not ( = ?auto_144846 ?auto_144841 ) ) ( not ( = ?auto_144846 ?auto_144845 ) ) ( ON ?auto_144843 ?auto_144846 ) ( ON ?auto_144839 ?auto_144843 ) ( ON ?auto_144845 ?auto_144839 ) ( ON ?auto_144840 ?auto_144844 ) ( not ( = ?auto_144838 ?auto_144844 ) ) ( not ( = ?auto_144842 ?auto_144844 ) ) ( not ( = ?auto_144846 ?auto_144844 ) ) ( not ( = ?auto_144843 ?auto_144844 ) ) ( not ( = ?auto_144840 ?auto_144844 ) ) ( not ( = ?auto_144841 ?auto_144844 ) ) ( not ( = ?auto_144845 ?auto_144844 ) ) ( not ( = ?auto_144839 ?auto_144844 ) ) ( CLEAR ?auto_144845 ) ( ON ?auto_144841 ?auto_144840 ) ( CLEAR ?auto_144841 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_144844 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_144844 ?auto_144840 )
      ( MAKE-1PILE ?auto_144838 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144847 - BLOCK
    )
    :vars
    (
      ?auto_144854 - BLOCK
      ?auto_144849 - BLOCK
      ?auto_144851 - BLOCK
      ?auto_144848 - BLOCK
      ?auto_144855 - BLOCK
      ?auto_144852 - BLOCK
      ?auto_144853 - BLOCK
      ?auto_144850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144854 ?auto_144847 ) ( ON-TABLE ?auto_144847 ) ( not ( = ?auto_144847 ?auto_144854 ) ) ( not ( = ?auto_144847 ?auto_144849 ) ) ( not ( = ?auto_144847 ?auto_144851 ) ) ( not ( = ?auto_144854 ?auto_144849 ) ) ( not ( = ?auto_144854 ?auto_144851 ) ) ( not ( = ?auto_144849 ?auto_144851 ) ) ( ON ?auto_144849 ?auto_144854 ) ( not ( = ?auto_144848 ?auto_144855 ) ) ( not ( = ?auto_144848 ?auto_144852 ) ) ( not ( = ?auto_144848 ?auto_144853 ) ) ( not ( = ?auto_144848 ?auto_144851 ) ) ( not ( = ?auto_144855 ?auto_144852 ) ) ( not ( = ?auto_144855 ?auto_144853 ) ) ( not ( = ?auto_144855 ?auto_144851 ) ) ( not ( = ?auto_144852 ?auto_144853 ) ) ( not ( = ?auto_144852 ?auto_144851 ) ) ( not ( = ?auto_144853 ?auto_144851 ) ) ( not ( = ?auto_144847 ?auto_144853 ) ) ( not ( = ?auto_144847 ?auto_144848 ) ) ( not ( = ?auto_144847 ?auto_144855 ) ) ( not ( = ?auto_144847 ?auto_144852 ) ) ( not ( = ?auto_144854 ?auto_144853 ) ) ( not ( = ?auto_144854 ?auto_144848 ) ) ( not ( = ?auto_144854 ?auto_144855 ) ) ( not ( = ?auto_144854 ?auto_144852 ) ) ( not ( = ?auto_144849 ?auto_144853 ) ) ( not ( = ?auto_144849 ?auto_144848 ) ) ( not ( = ?auto_144849 ?auto_144855 ) ) ( not ( = ?auto_144849 ?auto_144852 ) ) ( ON ?auto_144851 ?auto_144849 ) ( ON ?auto_144853 ?auto_144851 ) ( ON ?auto_144848 ?auto_144850 ) ( not ( = ?auto_144847 ?auto_144850 ) ) ( not ( = ?auto_144854 ?auto_144850 ) ) ( not ( = ?auto_144849 ?auto_144850 ) ) ( not ( = ?auto_144851 ?auto_144850 ) ) ( not ( = ?auto_144848 ?auto_144850 ) ) ( not ( = ?auto_144855 ?auto_144850 ) ) ( not ( = ?auto_144852 ?auto_144850 ) ) ( not ( = ?auto_144853 ?auto_144850 ) ) ( ON ?auto_144855 ?auto_144848 ) ( CLEAR ?auto_144855 ) ( ON-TABLE ?auto_144850 ) ( HOLDING ?auto_144852 ) ( CLEAR ?auto_144853 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_144847 ?auto_144854 ?auto_144849 ?auto_144851 ?auto_144853 ?auto_144852 )
      ( MAKE-1PILE ?auto_144847 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144856 - BLOCK
    )
    :vars
    (
      ?auto_144863 - BLOCK
      ?auto_144857 - BLOCK
      ?auto_144858 - BLOCK
      ?auto_144862 - BLOCK
      ?auto_144860 - BLOCK
      ?auto_144861 - BLOCK
      ?auto_144864 - BLOCK
      ?auto_144859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144863 ?auto_144856 ) ( ON-TABLE ?auto_144856 ) ( not ( = ?auto_144856 ?auto_144863 ) ) ( not ( = ?auto_144856 ?auto_144857 ) ) ( not ( = ?auto_144856 ?auto_144858 ) ) ( not ( = ?auto_144863 ?auto_144857 ) ) ( not ( = ?auto_144863 ?auto_144858 ) ) ( not ( = ?auto_144857 ?auto_144858 ) ) ( ON ?auto_144857 ?auto_144863 ) ( not ( = ?auto_144862 ?auto_144860 ) ) ( not ( = ?auto_144862 ?auto_144861 ) ) ( not ( = ?auto_144862 ?auto_144864 ) ) ( not ( = ?auto_144862 ?auto_144858 ) ) ( not ( = ?auto_144860 ?auto_144861 ) ) ( not ( = ?auto_144860 ?auto_144864 ) ) ( not ( = ?auto_144860 ?auto_144858 ) ) ( not ( = ?auto_144861 ?auto_144864 ) ) ( not ( = ?auto_144861 ?auto_144858 ) ) ( not ( = ?auto_144864 ?auto_144858 ) ) ( not ( = ?auto_144856 ?auto_144864 ) ) ( not ( = ?auto_144856 ?auto_144862 ) ) ( not ( = ?auto_144856 ?auto_144860 ) ) ( not ( = ?auto_144856 ?auto_144861 ) ) ( not ( = ?auto_144863 ?auto_144864 ) ) ( not ( = ?auto_144863 ?auto_144862 ) ) ( not ( = ?auto_144863 ?auto_144860 ) ) ( not ( = ?auto_144863 ?auto_144861 ) ) ( not ( = ?auto_144857 ?auto_144864 ) ) ( not ( = ?auto_144857 ?auto_144862 ) ) ( not ( = ?auto_144857 ?auto_144860 ) ) ( not ( = ?auto_144857 ?auto_144861 ) ) ( ON ?auto_144858 ?auto_144857 ) ( ON ?auto_144864 ?auto_144858 ) ( ON ?auto_144862 ?auto_144859 ) ( not ( = ?auto_144856 ?auto_144859 ) ) ( not ( = ?auto_144863 ?auto_144859 ) ) ( not ( = ?auto_144857 ?auto_144859 ) ) ( not ( = ?auto_144858 ?auto_144859 ) ) ( not ( = ?auto_144862 ?auto_144859 ) ) ( not ( = ?auto_144860 ?auto_144859 ) ) ( not ( = ?auto_144861 ?auto_144859 ) ) ( not ( = ?auto_144864 ?auto_144859 ) ) ( ON ?auto_144860 ?auto_144862 ) ( ON-TABLE ?auto_144859 ) ( CLEAR ?auto_144864 ) ( ON ?auto_144861 ?auto_144860 ) ( CLEAR ?auto_144861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_144859 ?auto_144862 ?auto_144860 )
      ( MAKE-1PILE ?auto_144856 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144865 - BLOCK
    )
    :vars
    (
      ?auto_144871 - BLOCK
      ?auto_144873 - BLOCK
      ?auto_144867 - BLOCK
      ?auto_144872 - BLOCK
      ?auto_144870 - BLOCK
      ?auto_144868 - BLOCK
      ?auto_144869 - BLOCK
      ?auto_144866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144871 ?auto_144865 ) ( ON-TABLE ?auto_144865 ) ( not ( = ?auto_144865 ?auto_144871 ) ) ( not ( = ?auto_144865 ?auto_144873 ) ) ( not ( = ?auto_144865 ?auto_144867 ) ) ( not ( = ?auto_144871 ?auto_144873 ) ) ( not ( = ?auto_144871 ?auto_144867 ) ) ( not ( = ?auto_144873 ?auto_144867 ) ) ( ON ?auto_144873 ?auto_144871 ) ( not ( = ?auto_144872 ?auto_144870 ) ) ( not ( = ?auto_144872 ?auto_144868 ) ) ( not ( = ?auto_144872 ?auto_144869 ) ) ( not ( = ?auto_144872 ?auto_144867 ) ) ( not ( = ?auto_144870 ?auto_144868 ) ) ( not ( = ?auto_144870 ?auto_144869 ) ) ( not ( = ?auto_144870 ?auto_144867 ) ) ( not ( = ?auto_144868 ?auto_144869 ) ) ( not ( = ?auto_144868 ?auto_144867 ) ) ( not ( = ?auto_144869 ?auto_144867 ) ) ( not ( = ?auto_144865 ?auto_144869 ) ) ( not ( = ?auto_144865 ?auto_144872 ) ) ( not ( = ?auto_144865 ?auto_144870 ) ) ( not ( = ?auto_144865 ?auto_144868 ) ) ( not ( = ?auto_144871 ?auto_144869 ) ) ( not ( = ?auto_144871 ?auto_144872 ) ) ( not ( = ?auto_144871 ?auto_144870 ) ) ( not ( = ?auto_144871 ?auto_144868 ) ) ( not ( = ?auto_144873 ?auto_144869 ) ) ( not ( = ?auto_144873 ?auto_144872 ) ) ( not ( = ?auto_144873 ?auto_144870 ) ) ( not ( = ?auto_144873 ?auto_144868 ) ) ( ON ?auto_144867 ?auto_144873 ) ( ON ?auto_144872 ?auto_144866 ) ( not ( = ?auto_144865 ?auto_144866 ) ) ( not ( = ?auto_144871 ?auto_144866 ) ) ( not ( = ?auto_144873 ?auto_144866 ) ) ( not ( = ?auto_144867 ?auto_144866 ) ) ( not ( = ?auto_144872 ?auto_144866 ) ) ( not ( = ?auto_144870 ?auto_144866 ) ) ( not ( = ?auto_144868 ?auto_144866 ) ) ( not ( = ?auto_144869 ?auto_144866 ) ) ( ON ?auto_144870 ?auto_144872 ) ( ON-TABLE ?auto_144866 ) ( ON ?auto_144868 ?auto_144870 ) ( CLEAR ?auto_144868 ) ( HOLDING ?auto_144869 ) ( CLEAR ?auto_144867 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_144865 ?auto_144871 ?auto_144873 ?auto_144867 ?auto_144869 )
      ( MAKE-1PILE ?auto_144865 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144874 - BLOCK
    )
    :vars
    (
      ?auto_144879 - BLOCK
      ?auto_144877 - BLOCK
      ?auto_144875 - BLOCK
      ?auto_144882 - BLOCK
      ?auto_144881 - BLOCK
      ?auto_144876 - BLOCK
      ?auto_144878 - BLOCK
      ?auto_144880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144879 ?auto_144874 ) ( ON-TABLE ?auto_144874 ) ( not ( = ?auto_144874 ?auto_144879 ) ) ( not ( = ?auto_144874 ?auto_144877 ) ) ( not ( = ?auto_144874 ?auto_144875 ) ) ( not ( = ?auto_144879 ?auto_144877 ) ) ( not ( = ?auto_144879 ?auto_144875 ) ) ( not ( = ?auto_144877 ?auto_144875 ) ) ( ON ?auto_144877 ?auto_144879 ) ( not ( = ?auto_144882 ?auto_144881 ) ) ( not ( = ?auto_144882 ?auto_144876 ) ) ( not ( = ?auto_144882 ?auto_144878 ) ) ( not ( = ?auto_144882 ?auto_144875 ) ) ( not ( = ?auto_144881 ?auto_144876 ) ) ( not ( = ?auto_144881 ?auto_144878 ) ) ( not ( = ?auto_144881 ?auto_144875 ) ) ( not ( = ?auto_144876 ?auto_144878 ) ) ( not ( = ?auto_144876 ?auto_144875 ) ) ( not ( = ?auto_144878 ?auto_144875 ) ) ( not ( = ?auto_144874 ?auto_144878 ) ) ( not ( = ?auto_144874 ?auto_144882 ) ) ( not ( = ?auto_144874 ?auto_144881 ) ) ( not ( = ?auto_144874 ?auto_144876 ) ) ( not ( = ?auto_144879 ?auto_144878 ) ) ( not ( = ?auto_144879 ?auto_144882 ) ) ( not ( = ?auto_144879 ?auto_144881 ) ) ( not ( = ?auto_144879 ?auto_144876 ) ) ( not ( = ?auto_144877 ?auto_144878 ) ) ( not ( = ?auto_144877 ?auto_144882 ) ) ( not ( = ?auto_144877 ?auto_144881 ) ) ( not ( = ?auto_144877 ?auto_144876 ) ) ( ON ?auto_144875 ?auto_144877 ) ( ON ?auto_144882 ?auto_144880 ) ( not ( = ?auto_144874 ?auto_144880 ) ) ( not ( = ?auto_144879 ?auto_144880 ) ) ( not ( = ?auto_144877 ?auto_144880 ) ) ( not ( = ?auto_144875 ?auto_144880 ) ) ( not ( = ?auto_144882 ?auto_144880 ) ) ( not ( = ?auto_144881 ?auto_144880 ) ) ( not ( = ?auto_144876 ?auto_144880 ) ) ( not ( = ?auto_144878 ?auto_144880 ) ) ( ON ?auto_144881 ?auto_144882 ) ( ON-TABLE ?auto_144880 ) ( ON ?auto_144876 ?auto_144881 ) ( CLEAR ?auto_144875 ) ( ON ?auto_144878 ?auto_144876 ) ( CLEAR ?auto_144878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_144880 ?auto_144882 ?auto_144881 ?auto_144876 )
      ( MAKE-1PILE ?auto_144874 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144883 - BLOCK
    )
    :vars
    (
      ?auto_144889 - BLOCK
      ?auto_144890 - BLOCK
      ?auto_144891 - BLOCK
      ?auto_144888 - BLOCK
      ?auto_144884 - BLOCK
      ?auto_144886 - BLOCK
      ?auto_144887 - BLOCK
      ?auto_144885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144889 ?auto_144883 ) ( ON-TABLE ?auto_144883 ) ( not ( = ?auto_144883 ?auto_144889 ) ) ( not ( = ?auto_144883 ?auto_144890 ) ) ( not ( = ?auto_144883 ?auto_144891 ) ) ( not ( = ?auto_144889 ?auto_144890 ) ) ( not ( = ?auto_144889 ?auto_144891 ) ) ( not ( = ?auto_144890 ?auto_144891 ) ) ( ON ?auto_144890 ?auto_144889 ) ( not ( = ?auto_144888 ?auto_144884 ) ) ( not ( = ?auto_144888 ?auto_144886 ) ) ( not ( = ?auto_144888 ?auto_144887 ) ) ( not ( = ?auto_144888 ?auto_144891 ) ) ( not ( = ?auto_144884 ?auto_144886 ) ) ( not ( = ?auto_144884 ?auto_144887 ) ) ( not ( = ?auto_144884 ?auto_144891 ) ) ( not ( = ?auto_144886 ?auto_144887 ) ) ( not ( = ?auto_144886 ?auto_144891 ) ) ( not ( = ?auto_144887 ?auto_144891 ) ) ( not ( = ?auto_144883 ?auto_144887 ) ) ( not ( = ?auto_144883 ?auto_144888 ) ) ( not ( = ?auto_144883 ?auto_144884 ) ) ( not ( = ?auto_144883 ?auto_144886 ) ) ( not ( = ?auto_144889 ?auto_144887 ) ) ( not ( = ?auto_144889 ?auto_144888 ) ) ( not ( = ?auto_144889 ?auto_144884 ) ) ( not ( = ?auto_144889 ?auto_144886 ) ) ( not ( = ?auto_144890 ?auto_144887 ) ) ( not ( = ?auto_144890 ?auto_144888 ) ) ( not ( = ?auto_144890 ?auto_144884 ) ) ( not ( = ?auto_144890 ?auto_144886 ) ) ( ON ?auto_144888 ?auto_144885 ) ( not ( = ?auto_144883 ?auto_144885 ) ) ( not ( = ?auto_144889 ?auto_144885 ) ) ( not ( = ?auto_144890 ?auto_144885 ) ) ( not ( = ?auto_144891 ?auto_144885 ) ) ( not ( = ?auto_144888 ?auto_144885 ) ) ( not ( = ?auto_144884 ?auto_144885 ) ) ( not ( = ?auto_144886 ?auto_144885 ) ) ( not ( = ?auto_144887 ?auto_144885 ) ) ( ON ?auto_144884 ?auto_144888 ) ( ON-TABLE ?auto_144885 ) ( ON ?auto_144886 ?auto_144884 ) ( ON ?auto_144887 ?auto_144886 ) ( CLEAR ?auto_144887 ) ( HOLDING ?auto_144891 ) ( CLEAR ?auto_144890 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_144883 ?auto_144889 ?auto_144890 ?auto_144891 )
      ( MAKE-1PILE ?auto_144883 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144892 - BLOCK
    )
    :vars
    (
      ?auto_144900 - BLOCK
      ?auto_144899 - BLOCK
      ?auto_144893 - BLOCK
      ?auto_144897 - BLOCK
      ?auto_144895 - BLOCK
      ?auto_144896 - BLOCK
      ?auto_144898 - BLOCK
      ?auto_144894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144900 ?auto_144892 ) ( ON-TABLE ?auto_144892 ) ( not ( = ?auto_144892 ?auto_144900 ) ) ( not ( = ?auto_144892 ?auto_144899 ) ) ( not ( = ?auto_144892 ?auto_144893 ) ) ( not ( = ?auto_144900 ?auto_144899 ) ) ( not ( = ?auto_144900 ?auto_144893 ) ) ( not ( = ?auto_144899 ?auto_144893 ) ) ( ON ?auto_144899 ?auto_144900 ) ( not ( = ?auto_144897 ?auto_144895 ) ) ( not ( = ?auto_144897 ?auto_144896 ) ) ( not ( = ?auto_144897 ?auto_144898 ) ) ( not ( = ?auto_144897 ?auto_144893 ) ) ( not ( = ?auto_144895 ?auto_144896 ) ) ( not ( = ?auto_144895 ?auto_144898 ) ) ( not ( = ?auto_144895 ?auto_144893 ) ) ( not ( = ?auto_144896 ?auto_144898 ) ) ( not ( = ?auto_144896 ?auto_144893 ) ) ( not ( = ?auto_144898 ?auto_144893 ) ) ( not ( = ?auto_144892 ?auto_144898 ) ) ( not ( = ?auto_144892 ?auto_144897 ) ) ( not ( = ?auto_144892 ?auto_144895 ) ) ( not ( = ?auto_144892 ?auto_144896 ) ) ( not ( = ?auto_144900 ?auto_144898 ) ) ( not ( = ?auto_144900 ?auto_144897 ) ) ( not ( = ?auto_144900 ?auto_144895 ) ) ( not ( = ?auto_144900 ?auto_144896 ) ) ( not ( = ?auto_144899 ?auto_144898 ) ) ( not ( = ?auto_144899 ?auto_144897 ) ) ( not ( = ?auto_144899 ?auto_144895 ) ) ( not ( = ?auto_144899 ?auto_144896 ) ) ( ON ?auto_144897 ?auto_144894 ) ( not ( = ?auto_144892 ?auto_144894 ) ) ( not ( = ?auto_144900 ?auto_144894 ) ) ( not ( = ?auto_144899 ?auto_144894 ) ) ( not ( = ?auto_144893 ?auto_144894 ) ) ( not ( = ?auto_144897 ?auto_144894 ) ) ( not ( = ?auto_144895 ?auto_144894 ) ) ( not ( = ?auto_144896 ?auto_144894 ) ) ( not ( = ?auto_144898 ?auto_144894 ) ) ( ON ?auto_144895 ?auto_144897 ) ( ON-TABLE ?auto_144894 ) ( ON ?auto_144896 ?auto_144895 ) ( ON ?auto_144898 ?auto_144896 ) ( CLEAR ?auto_144899 ) ( ON ?auto_144893 ?auto_144898 ) ( CLEAR ?auto_144893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_144894 ?auto_144897 ?auto_144895 ?auto_144896 ?auto_144898 )
      ( MAKE-1PILE ?auto_144892 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144901 - BLOCK
    )
    :vars
    (
      ?auto_144905 - BLOCK
      ?auto_144907 - BLOCK
      ?auto_144908 - BLOCK
      ?auto_144904 - BLOCK
      ?auto_144906 - BLOCK
      ?auto_144902 - BLOCK
      ?auto_144903 - BLOCK
      ?auto_144909 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144905 ?auto_144901 ) ( ON-TABLE ?auto_144901 ) ( not ( = ?auto_144901 ?auto_144905 ) ) ( not ( = ?auto_144901 ?auto_144907 ) ) ( not ( = ?auto_144901 ?auto_144908 ) ) ( not ( = ?auto_144905 ?auto_144907 ) ) ( not ( = ?auto_144905 ?auto_144908 ) ) ( not ( = ?auto_144907 ?auto_144908 ) ) ( not ( = ?auto_144904 ?auto_144906 ) ) ( not ( = ?auto_144904 ?auto_144902 ) ) ( not ( = ?auto_144904 ?auto_144903 ) ) ( not ( = ?auto_144904 ?auto_144908 ) ) ( not ( = ?auto_144906 ?auto_144902 ) ) ( not ( = ?auto_144906 ?auto_144903 ) ) ( not ( = ?auto_144906 ?auto_144908 ) ) ( not ( = ?auto_144902 ?auto_144903 ) ) ( not ( = ?auto_144902 ?auto_144908 ) ) ( not ( = ?auto_144903 ?auto_144908 ) ) ( not ( = ?auto_144901 ?auto_144903 ) ) ( not ( = ?auto_144901 ?auto_144904 ) ) ( not ( = ?auto_144901 ?auto_144906 ) ) ( not ( = ?auto_144901 ?auto_144902 ) ) ( not ( = ?auto_144905 ?auto_144903 ) ) ( not ( = ?auto_144905 ?auto_144904 ) ) ( not ( = ?auto_144905 ?auto_144906 ) ) ( not ( = ?auto_144905 ?auto_144902 ) ) ( not ( = ?auto_144907 ?auto_144903 ) ) ( not ( = ?auto_144907 ?auto_144904 ) ) ( not ( = ?auto_144907 ?auto_144906 ) ) ( not ( = ?auto_144907 ?auto_144902 ) ) ( ON ?auto_144904 ?auto_144909 ) ( not ( = ?auto_144901 ?auto_144909 ) ) ( not ( = ?auto_144905 ?auto_144909 ) ) ( not ( = ?auto_144907 ?auto_144909 ) ) ( not ( = ?auto_144908 ?auto_144909 ) ) ( not ( = ?auto_144904 ?auto_144909 ) ) ( not ( = ?auto_144906 ?auto_144909 ) ) ( not ( = ?auto_144902 ?auto_144909 ) ) ( not ( = ?auto_144903 ?auto_144909 ) ) ( ON ?auto_144906 ?auto_144904 ) ( ON-TABLE ?auto_144909 ) ( ON ?auto_144902 ?auto_144906 ) ( ON ?auto_144903 ?auto_144902 ) ( ON ?auto_144908 ?auto_144903 ) ( CLEAR ?auto_144908 ) ( HOLDING ?auto_144907 ) ( CLEAR ?auto_144905 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_144901 ?auto_144905 ?auto_144907 )
      ( MAKE-1PILE ?auto_144901 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144910 - BLOCK
    )
    :vars
    (
      ?auto_144914 - BLOCK
      ?auto_144915 - BLOCK
      ?auto_144912 - BLOCK
      ?auto_144918 - BLOCK
      ?auto_144917 - BLOCK
      ?auto_144916 - BLOCK
      ?auto_144911 - BLOCK
      ?auto_144913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144914 ?auto_144910 ) ( ON-TABLE ?auto_144910 ) ( not ( = ?auto_144910 ?auto_144914 ) ) ( not ( = ?auto_144910 ?auto_144915 ) ) ( not ( = ?auto_144910 ?auto_144912 ) ) ( not ( = ?auto_144914 ?auto_144915 ) ) ( not ( = ?auto_144914 ?auto_144912 ) ) ( not ( = ?auto_144915 ?auto_144912 ) ) ( not ( = ?auto_144918 ?auto_144917 ) ) ( not ( = ?auto_144918 ?auto_144916 ) ) ( not ( = ?auto_144918 ?auto_144911 ) ) ( not ( = ?auto_144918 ?auto_144912 ) ) ( not ( = ?auto_144917 ?auto_144916 ) ) ( not ( = ?auto_144917 ?auto_144911 ) ) ( not ( = ?auto_144917 ?auto_144912 ) ) ( not ( = ?auto_144916 ?auto_144911 ) ) ( not ( = ?auto_144916 ?auto_144912 ) ) ( not ( = ?auto_144911 ?auto_144912 ) ) ( not ( = ?auto_144910 ?auto_144911 ) ) ( not ( = ?auto_144910 ?auto_144918 ) ) ( not ( = ?auto_144910 ?auto_144917 ) ) ( not ( = ?auto_144910 ?auto_144916 ) ) ( not ( = ?auto_144914 ?auto_144911 ) ) ( not ( = ?auto_144914 ?auto_144918 ) ) ( not ( = ?auto_144914 ?auto_144917 ) ) ( not ( = ?auto_144914 ?auto_144916 ) ) ( not ( = ?auto_144915 ?auto_144911 ) ) ( not ( = ?auto_144915 ?auto_144918 ) ) ( not ( = ?auto_144915 ?auto_144917 ) ) ( not ( = ?auto_144915 ?auto_144916 ) ) ( ON ?auto_144918 ?auto_144913 ) ( not ( = ?auto_144910 ?auto_144913 ) ) ( not ( = ?auto_144914 ?auto_144913 ) ) ( not ( = ?auto_144915 ?auto_144913 ) ) ( not ( = ?auto_144912 ?auto_144913 ) ) ( not ( = ?auto_144918 ?auto_144913 ) ) ( not ( = ?auto_144917 ?auto_144913 ) ) ( not ( = ?auto_144916 ?auto_144913 ) ) ( not ( = ?auto_144911 ?auto_144913 ) ) ( ON ?auto_144917 ?auto_144918 ) ( ON-TABLE ?auto_144913 ) ( ON ?auto_144916 ?auto_144917 ) ( ON ?auto_144911 ?auto_144916 ) ( ON ?auto_144912 ?auto_144911 ) ( CLEAR ?auto_144914 ) ( ON ?auto_144915 ?auto_144912 ) ( CLEAR ?auto_144915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_144913 ?auto_144918 ?auto_144917 ?auto_144916 ?auto_144911 ?auto_144912 )
      ( MAKE-1PILE ?auto_144910 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144937 - BLOCK
    )
    :vars
    (
      ?auto_144940 - BLOCK
      ?auto_144942 - BLOCK
      ?auto_144939 - BLOCK
      ?auto_144943 - BLOCK
      ?auto_144944 - BLOCK
      ?auto_144945 - BLOCK
      ?auto_144938 - BLOCK
      ?auto_144941 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144937 ?auto_144940 ) ) ( not ( = ?auto_144937 ?auto_144942 ) ) ( not ( = ?auto_144937 ?auto_144939 ) ) ( not ( = ?auto_144940 ?auto_144942 ) ) ( not ( = ?auto_144940 ?auto_144939 ) ) ( not ( = ?auto_144942 ?auto_144939 ) ) ( not ( = ?auto_144943 ?auto_144944 ) ) ( not ( = ?auto_144943 ?auto_144945 ) ) ( not ( = ?auto_144943 ?auto_144938 ) ) ( not ( = ?auto_144943 ?auto_144939 ) ) ( not ( = ?auto_144944 ?auto_144945 ) ) ( not ( = ?auto_144944 ?auto_144938 ) ) ( not ( = ?auto_144944 ?auto_144939 ) ) ( not ( = ?auto_144945 ?auto_144938 ) ) ( not ( = ?auto_144945 ?auto_144939 ) ) ( not ( = ?auto_144938 ?auto_144939 ) ) ( not ( = ?auto_144937 ?auto_144938 ) ) ( not ( = ?auto_144937 ?auto_144943 ) ) ( not ( = ?auto_144937 ?auto_144944 ) ) ( not ( = ?auto_144937 ?auto_144945 ) ) ( not ( = ?auto_144940 ?auto_144938 ) ) ( not ( = ?auto_144940 ?auto_144943 ) ) ( not ( = ?auto_144940 ?auto_144944 ) ) ( not ( = ?auto_144940 ?auto_144945 ) ) ( not ( = ?auto_144942 ?auto_144938 ) ) ( not ( = ?auto_144942 ?auto_144943 ) ) ( not ( = ?auto_144942 ?auto_144944 ) ) ( not ( = ?auto_144942 ?auto_144945 ) ) ( ON ?auto_144943 ?auto_144941 ) ( not ( = ?auto_144937 ?auto_144941 ) ) ( not ( = ?auto_144940 ?auto_144941 ) ) ( not ( = ?auto_144942 ?auto_144941 ) ) ( not ( = ?auto_144939 ?auto_144941 ) ) ( not ( = ?auto_144943 ?auto_144941 ) ) ( not ( = ?auto_144944 ?auto_144941 ) ) ( not ( = ?auto_144945 ?auto_144941 ) ) ( not ( = ?auto_144938 ?auto_144941 ) ) ( ON ?auto_144944 ?auto_144943 ) ( ON-TABLE ?auto_144941 ) ( ON ?auto_144945 ?auto_144944 ) ( ON ?auto_144938 ?auto_144945 ) ( ON ?auto_144939 ?auto_144938 ) ( ON ?auto_144942 ?auto_144939 ) ( ON ?auto_144940 ?auto_144942 ) ( CLEAR ?auto_144940 ) ( HOLDING ?auto_144937 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_144937 ?auto_144940 )
      ( MAKE-1PILE ?auto_144937 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_144946 - BLOCK
    )
    :vars
    (
      ?auto_144953 - BLOCK
      ?auto_144951 - BLOCK
      ?auto_144950 - BLOCK
      ?auto_144954 - BLOCK
      ?auto_144952 - BLOCK
      ?auto_144947 - BLOCK
      ?auto_144949 - BLOCK
      ?auto_144948 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_144946 ?auto_144953 ) ) ( not ( = ?auto_144946 ?auto_144951 ) ) ( not ( = ?auto_144946 ?auto_144950 ) ) ( not ( = ?auto_144953 ?auto_144951 ) ) ( not ( = ?auto_144953 ?auto_144950 ) ) ( not ( = ?auto_144951 ?auto_144950 ) ) ( not ( = ?auto_144954 ?auto_144952 ) ) ( not ( = ?auto_144954 ?auto_144947 ) ) ( not ( = ?auto_144954 ?auto_144949 ) ) ( not ( = ?auto_144954 ?auto_144950 ) ) ( not ( = ?auto_144952 ?auto_144947 ) ) ( not ( = ?auto_144952 ?auto_144949 ) ) ( not ( = ?auto_144952 ?auto_144950 ) ) ( not ( = ?auto_144947 ?auto_144949 ) ) ( not ( = ?auto_144947 ?auto_144950 ) ) ( not ( = ?auto_144949 ?auto_144950 ) ) ( not ( = ?auto_144946 ?auto_144949 ) ) ( not ( = ?auto_144946 ?auto_144954 ) ) ( not ( = ?auto_144946 ?auto_144952 ) ) ( not ( = ?auto_144946 ?auto_144947 ) ) ( not ( = ?auto_144953 ?auto_144949 ) ) ( not ( = ?auto_144953 ?auto_144954 ) ) ( not ( = ?auto_144953 ?auto_144952 ) ) ( not ( = ?auto_144953 ?auto_144947 ) ) ( not ( = ?auto_144951 ?auto_144949 ) ) ( not ( = ?auto_144951 ?auto_144954 ) ) ( not ( = ?auto_144951 ?auto_144952 ) ) ( not ( = ?auto_144951 ?auto_144947 ) ) ( ON ?auto_144954 ?auto_144948 ) ( not ( = ?auto_144946 ?auto_144948 ) ) ( not ( = ?auto_144953 ?auto_144948 ) ) ( not ( = ?auto_144951 ?auto_144948 ) ) ( not ( = ?auto_144950 ?auto_144948 ) ) ( not ( = ?auto_144954 ?auto_144948 ) ) ( not ( = ?auto_144952 ?auto_144948 ) ) ( not ( = ?auto_144947 ?auto_144948 ) ) ( not ( = ?auto_144949 ?auto_144948 ) ) ( ON ?auto_144952 ?auto_144954 ) ( ON-TABLE ?auto_144948 ) ( ON ?auto_144947 ?auto_144952 ) ( ON ?auto_144949 ?auto_144947 ) ( ON ?auto_144950 ?auto_144949 ) ( ON ?auto_144951 ?auto_144950 ) ( ON ?auto_144953 ?auto_144951 ) ( ON ?auto_144946 ?auto_144953 ) ( CLEAR ?auto_144946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_144948 ?auto_144954 ?auto_144952 ?auto_144947 ?auto_144949 ?auto_144950 ?auto_144951 ?auto_144953 )
      ( MAKE-1PILE ?auto_144946 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_144962 - BLOCK
      ?auto_144963 - BLOCK
      ?auto_144964 - BLOCK
      ?auto_144965 - BLOCK
      ?auto_144966 - BLOCK
      ?auto_144967 - BLOCK
      ?auto_144968 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_144968 ) ( CLEAR ?auto_144967 ) ( ON-TABLE ?auto_144962 ) ( ON ?auto_144963 ?auto_144962 ) ( ON ?auto_144964 ?auto_144963 ) ( ON ?auto_144965 ?auto_144964 ) ( ON ?auto_144966 ?auto_144965 ) ( ON ?auto_144967 ?auto_144966 ) ( not ( = ?auto_144962 ?auto_144963 ) ) ( not ( = ?auto_144962 ?auto_144964 ) ) ( not ( = ?auto_144962 ?auto_144965 ) ) ( not ( = ?auto_144962 ?auto_144966 ) ) ( not ( = ?auto_144962 ?auto_144967 ) ) ( not ( = ?auto_144962 ?auto_144968 ) ) ( not ( = ?auto_144963 ?auto_144964 ) ) ( not ( = ?auto_144963 ?auto_144965 ) ) ( not ( = ?auto_144963 ?auto_144966 ) ) ( not ( = ?auto_144963 ?auto_144967 ) ) ( not ( = ?auto_144963 ?auto_144968 ) ) ( not ( = ?auto_144964 ?auto_144965 ) ) ( not ( = ?auto_144964 ?auto_144966 ) ) ( not ( = ?auto_144964 ?auto_144967 ) ) ( not ( = ?auto_144964 ?auto_144968 ) ) ( not ( = ?auto_144965 ?auto_144966 ) ) ( not ( = ?auto_144965 ?auto_144967 ) ) ( not ( = ?auto_144965 ?auto_144968 ) ) ( not ( = ?auto_144966 ?auto_144967 ) ) ( not ( = ?auto_144966 ?auto_144968 ) ) ( not ( = ?auto_144967 ?auto_144968 ) ) )
    :subtasks
    ( ( !STACK ?auto_144968 ?auto_144967 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_144969 - BLOCK
      ?auto_144970 - BLOCK
      ?auto_144971 - BLOCK
      ?auto_144972 - BLOCK
      ?auto_144973 - BLOCK
      ?auto_144974 - BLOCK
      ?auto_144975 - BLOCK
    )
    :vars
    (
      ?auto_144976 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_144974 ) ( ON-TABLE ?auto_144969 ) ( ON ?auto_144970 ?auto_144969 ) ( ON ?auto_144971 ?auto_144970 ) ( ON ?auto_144972 ?auto_144971 ) ( ON ?auto_144973 ?auto_144972 ) ( ON ?auto_144974 ?auto_144973 ) ( not ( = ?auto_144969 ?auto_144970 ) ) ( not ( = ?auto_144969 ?auto_144971 ) ) ( not ( = ?auto_144969 ?auto_144972 ) ) ( not ( = ?auto_144969 ?auto_144973 ) ) ( not ( = ?auto_144969 ?auto_144974 ) ) ( not ( = ?auto_144969 ?auto_144975 ) ) ( not ( = ?auto_144970 ?auto_144971 ) ) ( not ( = ?auto_144970 ?auto_144972 ) ) ( not ( = ?auto_144970 ?auto_144973 ) ) ( not ( = ?auto_144970 ?auto_144974 ) ) ( not ( = ?auto_144970 ?auto_144975 ) ) ( not ( = ?auto_144971 ?auto_144972 ) ) ( not ( = ?auto_144971 ?auto_144973 ) ) ( not ( = ?auto_144971 ?auto_144974 ) ) ( not ( = ?auto_144971 ?auto_144975 ) ) ( not ( = ?auto_144972 ?auto_144973 ) ) ( not ( = ?auto_144972 ?auto_144974 ) ) ( not ( = ?auto_144972 ?auto_144975 ) ) ( not ( = ?auto_144973 ?auto_144974 ) ) ( not ( = ?auto_144973 ?auto_144975 ) ) ( not ( = ?auto_144974 ?auto_144975 ) ) ( ON ?auto_144975 ?auto_144976 ) ( CLEAR ?auto_144975 ) ( HAND-EMPTY ) ( not ( = ?auto_144969 ?auto_144976 ) ) ( not ( = ?auto_144970 ?auto_144976 ) ) ( not ( = ?auto_144971 ?auto_144976 ) ) ( not ( = ?auto_144972 ?auto_144976 ) ) ( not ( = ?auto_144973 ?auto_144976 ) ) ( not ( = ?auto_144974 ?auto_144976 ) ) ( not ( = ?auto_144975 ?auto_144976 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_144975 ?auto_144976 )
      ( MAKE-7PILE ?auto_144969 ?auto_144970 ?auto_144971 ?auto_144972 ?auto_144973 ?auto_144974 ?auto_144975 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_144977 - BLOCK
      ?auto_144978 - BLOCK
      ?auto_144979 - BLOCK
      ?auto_144980 - BLOCK
      ?auto_144981 - BLOCK
      ?auto_144982 - BLOCK
      ?auto_144983 - BLOCK
    )
    :vars
    (
      ?auto_144984 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_144977 ) ( ON ?auto_144978 ?auto_144977 ) ( ON ?auto_144979 ?auto_144978 ) ( ON ?auto_144980 ?auto_144979 ) ( ON ?auto_144981 ?auto_144980 ) ( not ( = ?auto_144977 ?auto_144978 ) ) ( not ( = ?auto_144977 ?auto_144979 ) ) ( not ( = ?auto_144977 ?auto_144980 ) ) ( not ( = ?auto_144977 ?auto_144981 ) ) ( not ( = ?auto_144977 ?auto_144982 ) ) ( not ( = ?auto_144977 ?auto_144983 ) ) ( not ( = ?auto_144978 ?auto_144979 ) ) ( not ( = ?auto_144978 ?auto_144980 ) ) ( not ( = ?auto_144978 ?auto_144981 ) ) ( not ( = ?auto_144978 ?auto_144982 ) ) ( not ( = ?auto_144978 ?auto_144983 ) ) ( not ( = ?auto_144979 ?auto_144980 ) ) ( not ( = ?auto_144979 ?auto_144981 ) ) ( not ( = ?auto_144979 ?auto_144982 ) ) ( not ( = ?auto_144979 ?auto_144983 ) ) ( not ( = ?auto_144980 ?auto_144981 ) ) ( not ( = ?auto_144980 ?auto_144982 ) ) ( not ( = ?auto_144980 ?auto_144983 ) ) ( not ( = ?auto_144981 ?auto_144982 ) ) ( not ( = ?auto_144981 ?auto_144983 ) ) ( not ( = ?auto_144982 ?auto_144983 ) ) ( ON ?auto_144983 ?auto_144984 ) ( CLEAR ?auto_144983 ) ( not ( = ?auto_144977 ?auto_144984 ) ) ( not ( = ?auto_144978 ?auto_144984 ) ) ( not ( = ?auto_144979 ?auto_144984 ) ) ( not ( = ?auto_144980 ?auto_144984 ) ) ( not ( = ?auto_144981 ?auto_144984 ) ) ( not ( = ?auto_144982 ?auto_144984 ) ) ( not ( = ?auto_144983 ?auto_144984 ) ) ( HOLDING ?auto_144982 ) ( CLEAR ?auto_144981 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_144977 ?auto_144978 ?auto_144979 ?auto_144980 ?auto_144981 ?auto_144982 )
      ( MAKE-7PILE ?auto_144977 ?auto_144978 ?auto_144979 ?auto_144980 ?auto_144981 ?auto_144982 ?auto_144983 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_144985 - BLOCK
      ?auto_144986 - BLOCK
      ?auto_144987 - BLOCK
      ?auto_144988 - BLOCK
      ?auto_144989 - BLOCK
      ?auto_144990 - BLOCK
      ?auto_144991 - BLOCK
    )
    :vars
    (
      ?auto_144992 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_144985 ) ( ON ?auto_144986 ?auto_144985 ) ( ON ?auto_144987 ?auto_144986 ) ( ON ?auto_144988 ?auto_144987 ) ( ON ?auto_144989 ?auto_144988 ) ( not ( = ?auto_144985 ?auto_144986 ) ) ( not ( = ?auto_144985 ?auto_144987 ) ) ( not ( = ?auto_144985 ?auto_144988 ) ) ( not ( = ?auto_144985 ?auto_144989 ) ) ( not ( = ?auto_144985 ?auto_144990 ) ) ( not ( = ?auto_144985 ?auto_144991 ) ) ( not ( = ?auto_144986 ?auto_144987 ) ) ( not ( = ?auto_144986 ?auto_144988 ) ) ( not ( = ?auto_144986 ?auto_144989 ) ) ( not ( = ?auto_144986 ?auto_144990 ) ) ( not ( = ?auto_144986 ?auto_144991 ) ) ( not ( = ?auto_144987 ?auto_144988 ) ) ( not ( = ?auto_144987 ?auto_144989 ) ) ( not ( = ?auto_144987 ?auto_144990 ) ) ( not ( = ?auto_144987 ?auto_144991 ) ) ( not ( = ?auto_144988 ?auto_144989 ) ) ( not ( = ?auto_144988 ?auto_144990 ) ) ( not ( = ?auto_144988 ?auto_144991 ) ) ( not ( = ?auto_144989 ?auto_144990 ) ) ( not ( = ?auto_144989 ?auto_144991 ) ) ( not ( = ?auto_144990 ?auto_144991 ) ) ( ON ?auto_144991 ?auto_144992 ) ( not ( = ?auto_144985 ?auto_144992 ) ) ( not ( = ?auto_144986 ?auto_144992 ) ) ( not ( = ?auto_144987 ?auto_144992 ) ) ( not ( = ?auto_144988 ?auto_144992 ) ) ( not ( = ?auto_144989 ?auto_144992 ) ) ( not ( = ?auto_144990 ?auto_144992 ) ) ( not ( = ?auto_144991 ?auto_144992 ) ) ( CLEAR ?auto_144989 ) ( ON ?auto_144990 ?auto_144991 ) ( CLEAR ?auto_144990 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_144992 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_144992 ?auto_144991 )
      ( MAKE-7PILE ?auto_144985 ?auto_144986 ?auto_144987 ?auto_144988 ?auto_144989 ?auto_144990 ?auto_144991 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_144993 - BLOCK
      ?auto_144994 - BLOCK
      ?auto_144995 - BLOCK
      ?auto_144996 - BLOCK
      ?auto_144997 - BLOCK
      ?auto_144998 - BLOCK
      ?auto_144999 - BLOCK
    )
    :vars
    (
      ?auto_145000 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_144993 ) ( ON ?auto_144994 ?auto_144993 ) ( ON ?auto_144995 ?auto_144994 ) ( ON ?auto_144996 ?auto_144995 ) ( not ( = ?auto_144993 ?auto_144994 ) ) ( not ( = ?auto_144993 ?auto_144995 ) ) ( not ( = ?auto_144993 ?auto_144996 ) ) ( not ( = ?auto_144993 ?auto_144997 ) ) ( not ( = ?auto_144993 ?auto_144998 ) ) ( not ( = ?auto_144993 ?auto_144999 ) ) ( not ( = ?auto_144994 ?auto_144995 ) ) ( not ( = ?auto_144994 ?auto_144996 ) ) ( not ( = ?auto_144994 ?auto_144997 ) ) ( not ( = ?auto_144994 ?auto_144998 ) ) ( not ( = ?auto_144994 ?auto_144999 ) ) ( not ( = ?auto_144995 ?auto_144996 ) ) ( not ( = ?auto_144995 ?auto_144997 ) ) ( not ( = ?auto_144995 ?auto_144998 ) ) ( not ( = ?auto_144995 ?auto_144999 ) ) ( not ( = ?auto_144996 ?auto_144997 ) ) ( not ( = ?auto_144996 ?auto_144998 ) ) ( not ( = ?auto_144996 ?auto_144999 ) ) ( not ( = ?auto_144997 ?auto_144998 ) ) ( not ( = ?auto_144997 ?auto_144999 ) ) ( not ( = ?auto_144998 ?auto_144999 ) ) ( ON ?auto_144999 ?auto_145000 ) ( not ( = ?auto_144993 ?auto_145000 ) ) ( not ( = ?auto_144994 ?auto_145000 ) ) ( not ( = ?auto_144995 ?auto_145000 ) ) ( not ( = ?auto_144996 ?auto_145000 ) ) ( not ( = ?auto_144997 ?auto_145000 ) ) ( not ( = ?auto_144998 ?auto_145000 ) ) ( not ( = ?auto_144999 ?auto_145000 ) ) ( ON ?auto_144998 ?auto_144999 ) ( CLEAR ?auto_144998 ) ( ON-TABLE ?auto_145000 ) ( HOLDING ?auto_144997 ) ( CLEAR ?auto_144996 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_144993 ?auto_144994 ?auto_144995 ?auto_144996 ?auto_144997 )
      ( MAKE-7PILE ?auto_144993 ?auto_144994 ?auto_144995 ?auto_144996 ?auto_144997 ?auto_144998 ?auto_144999 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_145001 - BLOCK
      ?auto_145002 - BLOCK
      ?auto_145003 - BLOCK
      ?auto_145004 - BLOCK
      ?auto_145005 - BLOCK
      ?auto_145006 - BLOCK
      ?auto_145007 - BLOCK
    )
    :vars
    (
      ?auto_145008 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145001 ) ( ON ?auto_145002 ?auto_145001 ) ( ON ?auto_145003 ?auto_145002 ) ( ON ?auto_145004 ?auto_145003 ) ( not ( = ?auto_145001 ?auto_145002 ) ) ( not ( = ?auto_145001 ?auto_145003 ) ) ( not ( = ?auto_145001 ?auto_145004 ) ) ( not ( = ?auto_145001 ?auto_145005 ) ) ( not ( = ?auto_145001 ?auto_145006 ) ) ( not ( = ?auto_145001 ?auto_145007 ) ) ( not ( = ?auto_145002 ?auto_145003 ) ) ( not ( = ?auto_145002 ?auto_145004 ) ) ( not ( = ?auto_145002 ?auto_145005 ) ) ( not ( = ?auto_145002 ?auto_145006 ) ) ( not ( = ?auto_145002 ?auto_145007 ) ) ( not ( = ?auto_145003 ?auto_145004 ) ) ( not ( = ?auto_145003 ?auto_145005 ) ) ( not ( = ?auto_145003 ?auto_145006 ) ) ( not ( = ?auto_145003 ?auto_145007 ) ) ( not ( = ?auto_145004 ?auto_145005 ) ) ( not ( = ?auto_145004 ?auto_145006 ) ) ( not ( = ?auto_145004 ?auto_145007 ) ) ( not ( = ?auto_145005 ?auto_145006 ) ) ( not ( = ?auto_145005 ?auto_145007 ) ) ( not ( = ?auto_145006 ?auto_145007 ) ) ( ON ?auto_145007 ?auto_145008 ) ( not ( = ?auto_145001 ?auto_145008 ) ) ( not ( = ?auto_145002 ?auto_145008 ) ) ( not ( = ?auto_145003 ?auto_145008 ) ) ( not ( = ?auto_145004 ?auto_145008 ) ) ( not ( = ?auto_145005 ?auto_145008 ) ) ( not ( = ?auto_145006 ?auto_145008 ) ) ( not ( = ?auto_145007 ?auto_145008 ) ) ( ON ?auto_145006 ?auto_145007 ) ( ON-TABLE ?auto_145008 ) ( CLEAR ?auto_145004 ) ( ON ?auto_145005 ?auto_145006 ) ( CLEAR ?auto_145005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_145008 ?auto_145007 ?auto_145006 )
      ( MAKE-7PILE ?auto_145001 ?auto_145002 ?auto_145003 ?auto_145004 ?auto_145005 ?auto_145006 ?auto_145007 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_145009 - BLOCK
      ?auto_145010 - BLOCK
      ?auto_145011 - BLOCK
      ?auto_145012 - BLOCK
      ?auto_145013 - BLOCK
      ?auto_145014 - BLOCK
      ?auto_145015 - BLOCK
    )
    :vars
    (
      ?auto_145016 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145009 ) ( ON ?auto_145010 ?auto_145009 ) ( ON ?auto_145011 ?auto_145010 ) ( not ( = ?auto_145009 ?auto_145010 ) ) ( not ( = ?auto_145009 ?auto_145011 ) ) ( not ( = ?auto_145009 ?auto_145012 ) ) ( not ( = ?auto_145009 ?auto_145013 ) ) ( not ( = ?auto_145009 ?auto_145014 ) ) ( not ( = ?auto_145009 ?auto_145015 ) ) ( not ( = ?auto_145010 ?auto_145011 ) ) ( not ( = ?auto_145010 ?auto_145012 ) ) ( not ( = ?auto_145010 ?auto_145013 ) ) ( not ( = ?auto_145010 ?auto_145014 ) ) ( not ( = ?auto_145010 ?auto_145015 ) ) ( not ( = ?auto_145011 ?auto_145012 ) ) ( not ( = ?auto_145011 ?auto_145013 ) ) ( not ( = ?auto_145011 ?auto_145014 ) ) ( not ( = ?auto_145011 ?auto_145015 ) ) ( not ( = ?auto_145012 ?auto_145013 ) ) ( not ( = ?auto_145012 ?auto_145014 ) ) ( not ( = ?auto_145012 ?auto_145015 ) ) ( not ( = ?auto_145013 ?auto_145014 ) ) ( not ( = ?auto_145013 ?auto_145015 ) ) ( not ( = ?auto_145014 ?auto_145015 ) ) ( ON ?auto_145015 ?auto_145016 ) ( not ( = ?auto_145009 ?auto_145016 ) ) ( not ( = ?auto_145010 ?auto_145016 ) ) ( not ( = ?auto_145011 ?auto_145016 ) ) ( not ( = ?auto_145012 ?auto_145016 ) ) ( not ( = ?auto_145013 ?auto_145016 ) ) ( not ( = ?auto_145014 ?auto_145016 ) ) ( not ( = ?auto_145015 ?auto_145016 ) ) ( ON ?auto_145014 ?auto_145015 ) ( ON-TABLE ?auto_145016 ) ( ON ?auto_145013 ?auto_145014 ) ( CLEAR ?auto_145013 ) ( HOLDING ?auto_145012 ) ( CLEAR ?auto_145011 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_145009 ?auto_145010 ?auto_145011 ?auto_145012 )
      ( MAKE-7PILE ?auto_145009 ?auto_145010 ?auto_145011 ?auto_145012 ?auto_145013 ?auto_145014 ?auto_145015 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_145017 - BLOCK
      ?auto_145018 - BLOCK
      ?auto_145019 - BLOCK
      ?auto_145020 - BLOCK
      ?auto_145021 - BLOCK
      ?auto_145022 - BLOCK
      ?auto_145023 - BLOCK
    )
    :vars
    (
      ?auto_145024 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145017 ) ( ON ?auto_145018 ?auto_145017 ) ( ON ?auto_145019 ?auto_145018 ) ( not ( = ?auto_145017 ?auto_145018 ) ) ( not ( = ?auto_145017 ?auto_145019 ) ) ( not ( = ?auto_145017 ?auto_145020 ) ) ( not ( = ?auto_145017 ?auto_145021 ) ) ( not ( = ?auto_145017 ?auto_145022 ) ) ( not ( = ?auto_145017 ?auto_145023 ) ) ( not ( = ?auto_145018 ?auto_145019 ) ) ( not ( = ?auto_145018 ?auto_145020 ) ) ( not ( = ?auto_145018 ?auto_145021 ) ) ( not ( = ?auto_145018 ?auto_145022 ) ) ( not ( = ?auto_145018 ?auto_145023 ) ) ( not ( = ?auto_145019 ?auto_145020 ) ) ( not ( = ?auto_145019 ?auto_145021 ) ) ( not ( = ?auto_145019 ?auto_145022 ) ) ( not ( = ?auto_145019 ?auto_145023 ) ) ( not ( = ?auto_145020 ?auto_145021 ) ) ( not ( = ?auto_145020 ?auto_145022 ) ) ( not ( = ?auto_145020 ?auto_145023 ) ) ( not ( = ?auto_145021 ?auto_145022 ) ) ( not ( = ?auto_145021 ?auto_145023 ) ) ( not ( = ?auto_145022 ?auto_145023 ) ) ( ON ?auto_145023 ?auto_145024 ) ( not ( = ?auto_145017 ?auto_145024 ) ) ( not ( = ?auto_145018 ?auto_145024 ) ) ( not ( = ?auto_145019 ?auto_145024 ) ) ( not ( = ?auto_145020 ?auto_145024 ) ) ( not ( = ?auto_145021 ?auto_145024 ) ) ( not ( = ?auto_145022 ?auto_145024 ) ) ( not ( = ?auto_145023 ?auto_145024 ) ) ( ON ?auto_145022 ?auto_145023 ) ( ON-TABLE ?auto_145024 ) ( ON ?auto_145021 ?auto_145022 ) ( CLEAR ?auto_145019 ) ( ON ?auto_145020 ?auto_145021 ) ( CLEAR ?auto_145020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_145024 ?auto_145023 ?auto_145022 ?auto_145021 )
      ( MAKE-7PILE ?auto_145017 ?auto_145018 ?auto_145019 ?auto_145020 ?auto_145021 ?auto_145022 ?auto_145023 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_145025 - BLOCK
      ?auto_145026 - BLOCK
      ?auto_145027 - BLOCK
      ?auto_145028 - BLOCK
      ?auto_145029 - BLOCK
      ?auto_145030 - BLOCK
      ?auto_145031 - BLOCK
    )
    :vars
    (
      ?auto_145032 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145025 ) ( ON ?auto_145026 ?auto_145025 ) ( not ( = ?auto_145025 ?auto_145026 ) ) ( not ( = ?auto_145025 ?auto_145027 ) ) ( not ( = ?auto_145025 ?auto_145028 ) ) ( not ( = ?auto_145025 ?auto_145029 ) ) ( not ( = ?auto_145025 ?auto_145030 ) ) ( not ( = ?auto_145025 ?auto_145031 ) ) ( not ( = ?auto_145026 ?auto_145027 ) ) ( not ( = ?auto_145026 ?auto_145028 ) ) ( not ( = ?auto_145026 ?auto_145029 ) ) ( not ( = ?auto_145026 ?auto_145030 ) ) ( not ( = ?auto_145026 ?auto_145031 ) ) ( not ( = ?auto_145027 ?auto_145028 ) ) ( not ( = ?auto_145027 ?auto_145029 ) ) ( not ( = ?auto_145027 ?auto_145030 ) ) ( not ( = ?auto_145027 ?auto_145031 ) ) ( not ( = ?auto_145028 ?auto_145029 ) ) ( not ( = ?auto_145028 ?auto_145030 ) ) ( not ( = ?auto_145028 ?auto_145031 ) ) ( not ( = ?auto_145029 ?auto_145030 ) ) ( not ( = ?auto_145029 ?auto_145031 ) ) ( not ( = ?auto_145030 ?auto_145031 ) ) ( ON ?auto_145031 ?auto_145032 ) ( not ( = ?auto_145025 ?auto_145032 ) ) ( not ( = ?auto_145026 ?auto_145032 ) ) ( not ( = ?auto_145027 ?auto_145032 ) ) ( not ( = ?auto_145028 ?auto_145032 ) ) ( not ( = ?auto_145029 ?auto_145032 ) ) ( not ( = ?auto_145030 ?auto_145032 ) ) ( not ( = ?auto_145031 ?auto_145032 ) ) ( ON ?auto_145030 ?auto_145031 ) ( ON-TABLE ?auto_145032 ) ( ON ?auto_145029 ?auto_145030 ) ( ON ?auto_145028 ?auto_145029 ) ( CLEAR ?auto_145028 ) ( HOLDING ?auto_145027 ) ( CLEAR ?auto_145026 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_145025 ?auto_145026 ?auto_145027 )
      ( MAKE-7PILE ?auto_145025 ?auto_145026 ?auto_145027 ?auto_145028 ?auto_145029 ?auto_145030 ?auto_145031 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_145033 - BLOCK
      ?auto_145034 - BLOCK
      ?auto_145035 - BLOCK
      ?auto_145036 - BLOCK
      ?auto_145037 - BLOCK
      ?auto_145038 - BLOCK
      ?auto_145039 - BLOCK
    )
    :vars
    (
      ?auto_145040 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145033 ) ( ON ?auto_145034 ?auto_145033 ) ( not ( = ?auto_145033 ?auto_145034 ) ) ( not ( = ?auto_145033 ?auto_145035 ) ) ( not ( = ?auto_145033 ?auto_145036 ) ) ( not ( = ?auto_145033 ?auto_145037 ) ) ( not ( = ?auto_145033 ?auto_145038 ) ) ( not ( = ?auto_145033 ?auto_145039 ) ) ( not ( = ?auto_145034 ?auto_145035 ) ) ( not ( = ?auto_145034 ?auto_145036 ) ) ( not ( = ?auto_145034 ?auto_145037 ) ) ( not ( = ?auto_145034 ?auto_145038 ) ) ( not ( = ?auto_145034 ?auto_145039 ) ) ( not ( = ?auto_145035 ?auto_145036 ) ) ( not ( = ?auto_145035 ?auto_145037 ) ) ( not ( = ?auto_145035 ?auto_145038 ) ) ( not ( = ?auto_145035 ?auto_145039 ) ) ( not ( = ?auto_145036 ?auto_145037 ) ) ( not ( = ?auto_145036 ?auto_145038 ) ) ( not ( = ?auto_145036 ?auto_145039 ) ) ( not ( = ?auto_145037 ?auto_145038 ) ) ( not ( = ?auto_145037 ?auto_145039 ) ) ( not ( = ?auto_145038 ?auto_145039 ) ) ( ON ?auto_145039 ?auto_145040 ) ( not ( = ?auto_145033 ?auto_145040 ) ) ( not ( = ?auto_145034 ?auto_145040 ) ) ( not ( = ?auto_145035 ?auto_145040 ) ) ( not ( = ?auto_145036 ?auto_145040 ) ) ( not ( = ?auto_145037 ?auto_145040 ) ) ( not ( = ?auto_145038 ?auto_145040 ) ) ( not ( = ?auto_145039 ?auto_145040 ) ) ( ON ?auto_145038 ?auto_145039 ) ( ON-TABLE ?auto_145040 ) ( ON ?auto_145037 ?auto_145038 ) ( ON ?auto_145036 ?auto_145037 ) ( CLEAR ?auto_145034 ) ( ON ?auto_145035 ?auto_145036 ) ( CLEAR ?auto_145035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_145040 ?auto_145039 ?auto_145038 ?auto_145037 ?auto_145036 )
      ( MAKE-7PILE ?auto_145033 ?auto_145034 ?auto_145035 ?auto_145036 ?auto_145037 ?auto_145038 ?auto_145039 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_145041 - BLOCK
      ?auto_145042 - BLOCK
      ?auto_145043 - BLOCK
      ?auto_145044 - BLOCK
      ?auto_145045 - BLOCK
      ?auto_145046 - BLOCK
      ?auto_145047 - BLOCK
    )
    :vars
    (
      ?auto_145048 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145041 ) ( not ( = ?auto_145041 ?auto_145042 ) ) ( not ( = ?auto_145041 ?auto_145043 ) ) ( not ( = ?auto_145041 ?auto_145044 ) ) ( not ( = ?auto_145041 ?auto_145045 ) ) ( not ( = ?auto_145041 ?auto_145046 ) ) ( not ( = ?auto_145041 ?auto_145047 ) ) ( not ( = ?auto_145042 ?auto_145043 ) ) ( not ( = ?auto_145042 ?auto_145044 ) ) ( not ( = ?auto_145042 ?auto_145045 ) ) ( not ( = ?auto_145042 ?auto_145046 ) ) ( not ( = ?auto_145042 ?auto_145047 ) ) ( not ( = ?auto_145043 ?auto_145044 ) ) ( not ( = ?auto_145043 ?auto_145045 ) ) ( not ( = ?auto_145043 ?auto_145046 ) ) ( not ( = ?auto_145043 ?auto_145047 ) ) ( not ( = ?auto_145044 ?auto_145045 ) ) ( not ( = ?auto_145044 ?auto_145046 ) ) ( not ( = ?auto_145044 ?auto_145047 ) ) ( not ( = ?auto_145045 ?auto_145046 ) ) ( not ( = ?auto_145045 ?auto_145047 ) ) ( not ( = ?auto_145046 ?auto_145047 ) ) ( ON ?auto_145047 ?auto_145048 ) ( not ( = ?auto_145041 ?auto_145048 ) ) ( not ( = ?auto_145042 ?auto_145048 ) ) ( not ( = ?auto_145043 ?auto_145048 ) ) ( not ( = ?auto_145044 ?auto_145048 ) ) ( not ( = ?auto_145045 ?auto_145048 ) ) ( not ( = ?auto_145046 ?auto_145048 ) ) ( not ( = ?auto_145047 ?auto_145048 ) ) ( ON ?auto_145046 ?auto_145047 ) ( ON-TABLE ?auto_145048 ) ( ON ?auto_145045 ?auto_145046 ) ( ON ?auto_145044 ?auto_145045 ) ( ON ?auto_145043 ?auto_145044 ) ( CLEAR ?auto_145043 ) ( HOLDING ?auto_145042 ) ( CLEAR ?auto_145041 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_145041 ?auto_145042 )
      ( MAKE-7PILE ?auto_145041 ?auto_145042 ?auto_145043 ?auto_145044 ?auto_145045 ?auto_145046 ?auto_145047 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_145049 - BLOCK
      ?auto_145050 - BLOCK
      ?auto_145051 - BLOCK
      ?auto_145052 - BLOCK
      ?auto_145053 - BLOCK
      ?auto_145054 - BLOCK
      ?auto_145055 - BLOCK
    )
    :vars
    (
      ?auto_145056 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145049 ) ( not ( = ?auto_145049 ?auto_145050 ) ) ( not ( = ?auto_145049 ?auto_145051 ) ) ( not ( = ?auto_145049 ?auto_145052 ) ) ( not ( = ?auto_145049 ?auto_145053 ) ) ( not ( = ?auto_145049 ?auto_145054 ) ) ( not ( = ?auto_145049 ?auto_145055 ) ) ( not ( = ?auto_145050 ?auto_145051 ) ) ( not ( = ?auto_145050 ?auto_145052 ) ) ( not ( = ?auto_145050 ?auto_145053 ) ) ( not ( = ?auto_145050 ?auto_145054 ) ) ( not ( = ?auto_145050 ?auto_145055 ) ) ( not ( = ?auto_145051 ?auto_145052 ) ) ( not ( = ?auto_145051 ?auto_145053 ) ) ( not ( = ?auto_145051 ?auto_145054 ) ) ( not ( = ?auto_145051 ?auto_145055 ) ) ( not ( = ?auto_145052 ?auto_145053 ) ) ( not ( = ?auto_145052 ?auto_145054 ) ) ( not ( = ?auto_145052 ?auto_145055 ) ) ( not ( = ?auto_145053 ?auto_145054 ) ) ( not ( = ?auto_145053 ?auto_145055 ) ) ( not ( = ?auto_145054 ?auto_145055 ) ) ( ON ?auto_145055 ?auto_145056 ) ( not ( = ?auto_145049 ?auto_145056 ) ) ( not ( = ?auto_145050 ?auto_145056 ) ) ( not ( = ?auto_145051 ?auto_145056 ) ) ( not ( = ?auto_145052 ?auto_145056 ) ) ( not ( = ?auto_145053 ?auto_145056 ) ) ( not ( = ?auto_145054 ?auto_145056 ) ) ( not ( = ?auto_145055 ?auto_145056 ) ) ( ON ?auto_145054 ?auto_145055 ) ( ON-TABLE ?auto_145056 ) ( ON ?auto_145053 ?auto_145054 ) ( ON ?auto_145052 ?auto_145053 ) ( ON ?auto_145051 ?auto_145052 ) ( CLEAR ?auto_145049 ) ( ON ?auto_145050 ?auto_145051 ) ( CLEAR ?auto_145050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_145056 ?auto_145055 ?auto_145054 ?auto_145053 ?auto_145052 ?auto_145051 )
      ( MAKE-7PILE ?auto_145049 ?auto_145050 ?auto_145051 ?auto_145052 ?auto_145053 ?auto_145054 ?auto_145055 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_145057 - BLOCK
      ?auto_145058 - BLOCK
      ?auto_145059 - BLOCK
      ?auto_145060 - BLOCK
      ?auto_145061 - BLOCK
      ?auto_145062 - BLOCK
      ?auto_145063 - BLOCK
    )
    :vars
    (
      ?auto_145064 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145057 ?auto_145058 ) ) ( not ( = ?auto_145057 ?auto_145059 ) ) ( not ( = ?auto_145057 ?auto_145060 ) ) ( not ( = ?auto_145057 ?auto_145061 ) ) ( not ( = ?auto_145057 ?auto_145062 ) ) ( not ( = ?auto_145057 ?auto_145063 ) ) ( not ( = ?auto_145058 ?auto_145059 ) ) ( not ( = ?auto_145058 ?auto_145060 ) ) ( not ( = ?auto_145058 ?auto_145061 ) ) ( not ( = ?auto_145058 ?auto_145062 ) ) ( not ( = ?auto_145058 ?auto_145063 ) ) ( not ( = ?auto_145059 ?auto_145060 ) ) ( not ( = ?auto_145059 ?auto_145061 ) ) ( not ( = ?auto_145059 ?auto_145062 ) ) ( not ( = ?auto_145059 ?auto_145063 ) ) ( not ( = ?auto_145060 ?auto_145061 ) ) ( not ( = ?auto_145060 ?auto_145062 ) ) ( not ( = ?auto_145060 ?auto_145063 ) ) ( not ( = ?auto_145061 ?auto_145062 ) ) ( not ( = ?auto_145061 ?auto_145063 ) ) ( not ( = ?auto_145062 ?auto_145063 ) ) ( ON ?auto_145063 ?auto_145064 ) ( not ( = ?auto_145057 ?auto_145064 ) ) ( not ( = ?auto_145058 ?auto_145064 ) ) ( not ( = ?auto_145059 ?auto_145064 ) ) ( not ( = ?auto_145060 ?auto_145064 ) ) ( not ( = ?auto_145061 ?auto_145064 ) ) ( not ( = ?auto_145062 ?auto_145064 ) ) ( not ( = ?auto_145063 ?auto_145064 ) ) ( ON ?auto_145062 ?auto_145063 ) ( ON-TABLE ?auto_145064 ) ( ON ?auto_145061 ?auto_145062 ) ( ON ?auto_145060 ?auto_145061 ) ( ON ?auto_145059 ?auto_145060 ) ( ON ?auto_145058 ?auto_145059 ) ( CLEAR ?auto_145058 ) ( HOLDING ?auto_145057 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_145057 )
      ( MAKE-7PILE ?auto_145057 ?auto_145058 ?auto_145059 ?auto_145060 ?auto_145061 ?auto_145062 ?auto_145063 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_145065 - BLOCK
      ?auto_145066 - BLOCK
      ?auto_145067 - BLOCK
      ?auto_145068 - BLOCK
      ?auto_145069 - BLOCK
      ?auto_145070 - BLOCK
      ?auto_145071 - BLOCK
    )
    :vars
    (
      ?auto_145072 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145065 ?auto_145066 ) ) ( not ( = ?auto_145065 ?auto_145067 ) ) ( not ( = ?auto_145065 ?auto_145068 ) ) ( not ( = ?auto_145065 ?auto_145069 ) ) ( not ( = ?auto_145065 ?auto_145070 ) ) ( not ( = ?auto_145065 ?auto_145071 ) ) ( not ( = ?auto_145066 ?auto_145067 ) ) ( not ( = ?auto_145066 ?auto_145068 ) ) ( not ( = ?auto_145066 ?auto_145069 ) ) ( not ( = ?auto_145066 ?auto_145070 ) ) ( not ( = ?auto_145066 ?auto_145071 ) ) ( not ( = ?auto_145067 ?auto_145068 ) ) ( not ( = ?auto_145067 ?auto_145069 ) ) ( not ( = ?auto_145067 ?auto_145070 ) ) ( not ( = ?auto_145067 ?auto_145071 ) ) ( not ( = ?auto_145068 ?auto_145069 ) ) ( not ( = ?auto_145068 ?auto_145070 ) ) ( not ( = ?auto_145068 ?auto_145071 ) ) ( not ( = ?auto_145069 ?auto_145070 ) ) ( not ( = ?auto_145069 ?auto_145071 ) ) ( not ( = ?auto_145070 ?auto_145071 ) ) ( ON ?auto_145071 ?auto_145072 ) ( not ( = ?auto_145065 ?auto_145072 ) ) ( not ( = ?auto_145066 ?auto_145072 ) ) ( not ( = ?auto_145067 ?auto_145072 ) ) ( not ( = ?auto_145068 ?auto_145072 ) ) ( not ( = ?auto_145069 ?auto_145072 ) ) ( not ( = ?auto_145070 ?auto_145072 ) ) ( not ( = ?auto_145071 ?auto_145072 ) ) ( ON ?auto_145070 ?auto_145071 ) ( ON-TABLE ?auto_145072 ) ( ON ?auto_145069 ?auto_145070 ) ( ON ?auto_145068 ?auto_145069 ) ( ON ?auto_145067 ?auto_145068 ) ( ON ?auto_145066 ?auto_145067 ) ( ON ?auto_145065 ?auto_145066 ) ( CLEAR ?auto_145065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_145072 ?auto_145071 ?auto_145070 ?auto_145069 ?auto_145068 ?auto_145067 ?auto_145066 )
      ( MAKE-7PILE ?auto_145065 ?auto_145066 ?auto_145067 ?auto_145068 ?auto_145069 ?auto_145070 ?auto_145071 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_145073 - BLOCK
      ?auto_145074 - BLOCK
      ?auto_145075 - BLOCK
      ?auto_145076 - BLOCK
      ?auto_145077 - BLOCK
      ?auto_145078 - BLOCK
      ?auto_145079 - BLOCK
    )
    :vars
    (
      ?auto_145080 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145073 ?auto_145074 ) ) ( not ( = ?auto_145073 ?auto_145075 ) ) ( not ( = ?auto_145073 ?auto_145076 ) ) ( not ( = ?auto_145073 ?auto_145077 ) ) ( not ( = ?auto_145073 ?auto_145078 ) ) ( not ( = ?auto_145073 ?auto_145079 ) ) ( not ( = ?auto_145074 ?auto_145075 ) ) ( not ( = ?auto_145074 ?auto_145076 ) ) ( not ( = ?auto_145074 ?auto_145077 ) ) ( not ( = ?auto_145074 ?auto_145078 ) ) ( not ( = ?auto_145074 ?auto_145079 ) ) ( not ( = ?auto_145075 ?auto_145076 ) ) ( not ( = ?auto_145075 ?auto_145077 ) ) ( not ( = ?auto_145075 ?auto_145078 ) ) ( not ( = ?auto_145075 ?auto_145079 ) ) ( not ( = ?auto_145076 ?auto_145077 ) ) ( not ( = ?auto_145076 ?auto_145078 ) ) ( not ( = ?auto_145076 ?auto_145079 ) ) ( not ( = ?auto_145077 ?auto_145078 ) ) ( not ( = ?auto_145077 ?auto_145079 ) ) ( not ( = ?auto_145078 ?auto_145079 ) ) ( ON ?auto_145079 ?auto_145080 ) ( not ( = ?auto_145073 ?auto_145080 ) ) ( not ( = ?auto_145074 ?auto_145080 ) ) ( not ( = ?auto_145075 ?auto_145080 ) ) ( not ( = ?auto_145076 ?auto_145080 ) ) ( not ( = ?auto_145077 ?auto_145080 ) ) ( not ( = ?auto_145078 ?auto_145080 ) ) ( not ( = ?auto_145079 ?auto_145080 ) ) ( ON ?auto_145078 ?auto_145079 ) ( ON-TABLE ?auto_145080 ) ( ON ?auto_145077 ?auto_145078 ) ( ON ?auto_145076 ?auto_145077 ) ( ON ?auto_145075 ?auto_145076 ) ( ON ?auto_145074 ?auto_145075 ) ( HOLDING ?auto_145073 ) ( CLEAR ?auto_145074 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_145080 ?auto_145079 ?auto_145078 ?auto_145077 ?auto_145076 ?auto_145075 ?auto_145074 ?auto_145073 )
      ( MAKE-7PILE ?auto_145073 ?auto_145074 ?auto_145075 ?auto_145076 ?auto_145077 ?auto_145078 ?auto_145079 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_145081 - BLOCK
      ?auto_145082 - BLOCK
      ?auto_145083 - BLOCK
      ?auto_145084 - BLOCK
      ?auto_145085 - BLOCK
      ?auto_145086 - BLOCK
      ?auto_145087 - BLOCK
    )
    :vars
    (
      ?auto_145088 - BLOCK
      ?auto_145089 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145081 ?auto_145082 ) ) ( not ( = ?auto_145081 ?auto_145083 ) ) ( not ( = ?auto_145081 ?auto_145084 ) ) ( not ( = ?auto_145081 ?auto_145085 ) ) ( not ( = ?auto_145081 ?auto_145086 ) ) ( not ( = ?auto_145081 ?auto_145087 ) ) ( not ( = ?auto_145082 ?auto_145083 ) ) ( not ( = ?auto_145082 ?auto_145084 ) ) ( not ( = ?auto_145082 ?auto_145085 ) ) ( not ( = ?auto_145082 ?auto_145086 ) ) ( not ( = ?auto_145082 ?auto_145087 ) ) ( not ( = ?auto_145083 ?auto_145084 ) ) ( not ( = ?auto_145083 ?auto_145085 ) ) ( not ( = ?auto_145083 ?auto_145086 ) ) ( not ( = ?auto_145083 ?auto_145087 ) ) ( not ( = ?auto_145084 ?auto_145085 ) ) ( not ( = ?auto_145084 ?auto_145086 ) ) ( not ( = ?auto_145084 ?auto_145087 ) ) ( not ( = ?auto_145085 ?auto_145086 ) ) ( not ( = ?auto_145085 ?auto_145087 ) ) ( not ( = ?auto_145086 ?auto_145087 ) ) ( ON ?auto_145087 ?auto_145088 ) ( not ( = ?auto_145081 ?auto_145088 ) ) ( not ( = ?auto_145082 ?auto_145088 ) ) ( not ( = ?auto_145083 ?auto_145088 ) ) ( not ( = ?auto_145084 ?auto_145088 ) ) ( not ( = ?auto_145085 ?auto_145088 ) ) ( not ( = ?auto_145086 ?auto_145088 ) ) ( not ( = ?auto_145087 ?auto_145088 ) ) ( ON ?auto_145086 ?auto_145087 ) ( ON-TABLE ?auto_145088 ) ( ON ?auto_145085 ?auto_145086 ) ( ON ?auto_145084 ?auto_145085 ) ( ON ?auto_145083 ?auto_145084 ) ( ON ?auto_145082 ?auto_145083 ) ( CLEAR ?auto_145082 ) ( ON ?auto_145081 ?auto_145089 ) ( CLEAR ?auto_145081 ) ( HAND-EMPTY ) ( not ( = ?auto_145081 ?auto_145089 ) ) ( not ( = ?auto_145082 ?auto_145089 ) ) ( not ( = ?auto_145083 ?auto_145089 ) ) ( not ( = ?auto_145084 ?auto_145089 ) ) ( not ( = ?auto_145085 ?auto_145089 ) ) ( not ( = ?auto_145086 ?auto_145089 ) ) ( not ( = ?auto_145087 ?auto_145089 ) ) ( not ( = ?auto_145088 ?auto_145089 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_145081 ?auto_145089 )
      ( MAKE-7PILE ?auto_145081 ?auto_145082 ?auto_145083 ?auto_145084 ?auto_145085 ?auto_145086 ?auto_145087 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_145090 - BLOCK
      ?auto_145091 - BLOCK
      ?auto_145092 - BLOCK
      ?auto_145093 - BLOCK
      ?auto_145094 - BLOCK
      ?auto_145095 - BLOCK
      ?auto_145096 - BLOCK
    )
    :vars
    (
      ?auto_145098 - BLOCK
      ?auto_145097 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145090 ?auto_145091 ) ) ( not ( = ?auto_145090 ?auto_145092 ) ) ( not ( = ?auto_145090 ?auto_145093 ) ) ( not ( = ?auto_145090 ?auto_145094 ) ) ( not ( = ?auto_145090 ?auto_145095 ) ) ( not ( = ?auto_145090 ?auto_145096 ) ) ( not ( = ?auto_145091 ?auto_145092 ) ) ( not ( = ?auto_145091 ?auto_145093 ) ) ( not ( = ?auto_145091 ?auto_145094 ) ) ( not ( = ?auto_145091 ?auto_145095 ) ) ( not ( = ?auto_145091 ?auto_145096 ) ) ( not ( = ?auto_145092 ?auto_145093 ) ) ( not ( = ?auto_145092 ?auto_145094 ) ) ( not ( = ?auto_145092 ?auto_145095 ) ) ( not ( = ?auto_145092 ?auto_145096 ) ) ( not ( = ?auto_145093 ?auto_145094 ) ) ( not ( = ?auto_145093 ?auto_145095 ) ) ( not ( = ?auto_145093 ?auto_145096 ) ) ( not ( = ?auto_145094 ?auto_145095 ) ) ( not ( = ?auto_145094 ?auto_145096 ) ) ( not ( = ?auto_145095 ?auto_145096 ) ) ( ON ?auto_145096 ?auto_145098 ) ( not ( = ?auto_145090 ?auto_145098 ) ) ( not ( = ?auto_145091 ?auto_145098 ) ) ( not ( = ?auto_145092 ?auto_145098 ) ) ( not ( = ?auto_145093 ?auto_145098 ) ) ( not ( = ?auto_145094 ?auto_145098 ) ) ( not ( = ?auto_145095 ?auto_145098 ) ) ( not ( = ?auto_145096 ?auto_145098 ) ) ( ON ?auto_145095 ?auto_145096 ) ( ON-TABLE ?auto_145098 ) ( ON ?auto_145094 ?auto_145095 ) ( ON ?auto_145093 ?auto_145094 ) ( ON ?auto_145092 ?auto_145093 ) ( ON ?auto_145090 ?auto_145097 ) ( CLEAR ?auto_145090 ) ( not ( = ?auto_145090 ?auto_145097 ) ) ( not ( = ?auto_145091 ?auto_145097 ) ) ( not ( = ?auto_145092 ?auto_145097 ) ) ( not ( = ?auto_145093 ?auto_145097 ) ) ( not ( = ?auto_145094 ?auto_145097 ) ) ( not ( = ?auto_145095 ?auto_145097 ) ) ( not ( = ?auto_145096 ?auto_145097 ) ) ( not ( = ?auto_145098 ?auto_145097 ) ) ( HOLDING ?auto_145091 ) ( CLEAR ?auto_145092 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_145098 ?auto_145096 ?auto_145095 ?auto_145094 ?auto_145093 ?auto_145092 ?auto_145091 )
      ( MAKE-7PILE ?auto_145090 ?auto_145091 ?auto_145092 ?auto_145093 ?auto_145094 ?auto_145095 ?auto_145096 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_145099 - BLOCK
      ?auto_145100 - BLOCK
      ?auto_145101 - BLOCK
      ?auto_145102 - BLOCK
      ?auto_145103 - BLOCK
      ?auto_145104 - BLOCK
      ?auto_145105 - BLOCK
    )
    :vars
    (
      ?auto_145106 - BLOCK
      ?auto_145107 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145099 ?auto_145100 ) ) ( not ( = ?auto_145099 ?auto_145101 ) ) ( not ( = ?auto_145099 ?auto_145102 ) ) ( not ( = ?auto_145099 ?auto_145103 ) ) ( not ( = ?auto_145099 ?auto_145104 ) ) ( not ( = ?auto_145099 ?auto_145105 ) ) ( not ( = ?auto_145100 ?auto_145101 ) ) ( not ( = ?auto_145100 ?auto_145102 ) ) ( not ( = ?auto_145100 ?auto_145103 ) ) ( not ( = ?auto_145100 ?auto_145104 ) ) ( not ( = ?auto_145100 ?auto_145105 ) ) ( not ( = ?auto_145101 ?auto_145102 ) ) ( not ( = ?auto_145101 ?auto_145103 ) ) ( not ( = ?auto_145101 ?auto_145104 ) ) ( not ( = ?auto_145101 ?auto_145105 ) ) ( not ( = ?auto_145102 ?auto_145103 ) ) ( not ( = ?auto_145102 ?auto_145104 ) ) ( not ( = ?auto_145102 ?auto_145105 ) ) ( not ( = ?auto_145103 ?auto_145104 ) ) ( not ( = ?auto_145103 ?auto_145105 ) ) ( not ( = ?auto_145104 ?auto_145105 ) ) ( ON ?auto_145105 ?auto_145106 ) ( not ( = ?auto_145099 ?auto_145106 ) ) ( not ( = ?auto_145100 ?auto_145106 ) ) ( not ( = ?auto_145101 ?auto_145106 ) ) ( not ( = ?auto_145102 ?auto_145106 ) ) ( not ( = ?auto_145103 ?auto_145106 ) ) ( not ( = ?auto_145104 ?auto_145106 ) ) ( not ( = ?auto_145105 ?auto_145106 ) ) ( ON ?auto_145104 ?auto_145105 ) ( ON-TABLE ?auto_145106 ) ( ON ?auto_145103 ?auto_145104 ) ( ON ?auto_145102 ?auto_145103 ) ( ON ?auto_145101 ?auto_145102 ) ( ON ?auto_145099 ?auto_145107 ) ( not ( = ?auto_145099 ?auto_145107 ) ) ( not ( = ?auto_145100 ?auto_145107 ) ) ( not ( = ?auto_145101 ?auto_145107 ) ) ( not ( = ?auto_145102 ?auto_145107 ) ) ( not ( = ?auto_145103 ?auto_145107 ) ) ( not ( = ?auto_145104 ?auto_145107 ) ) ( not ( = ?auto_145105 ?auto_145107 ) ) ( not ( = ?auto_145106 ?auto_145107 ) ) ( CLEAR ?auto_145101 ) ( ON ?auto_145100 ?auto_145099 ) ( CLEAR ?auto_145100 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_145107 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_145107 ?auto_145099 )
      ( MAKE-7PILE ?auto_145099 ?auto_145100 ?auto_145101 ?auto_145102 ?auto_145103 ?auto_145104 ?auto_145105 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_145108 - BLOCK
      ?auto_145109 - BLOCK
      ?auto_145110 - BLOCK
      ?auto_145111 - BLOCK
      ?auto_145112 - BLOCK
      ?auto_145113 - BLOCK
      ?auto_145114 - BLOCK
    )
    :vars
    (
      ?auto_145116 - BLOCK
      ?auto_145115 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145108 ?auto_145109 ) ) ( not ( = ?auto_145108 ?auto_145110 ) ) ( not ( = ?auto_145108 ?auto_145111 ) ) ( not ( = ?auto_145108 ?auto_145112 ) ) ( not ( = ?auto_145108 ?auto_145113 ) ) ( not ( = ?auto_145108 ?auto_145114 ) ) ( not ( = ?auto_145109 ?auto_145110 ) ) ( not ( = ?auto_145109 ?auto_145111 ) ) ( not ( = ?auto_145109 ?auto_145112 ) ) ( not ( = ?auto_145109 ?auto_145113 ) ) ( not ( = ?auto_145109 ?auto_145114 ) ) ( not ( = ?auto_145110 ?auto_145111 ) ) ( not ( = ?auto_145110 ?auto_145112 ) ) ( not ( = ?auto_145110 ?auto_145113 ) ) ( not ( = ?auto_145110 ?auto_145114 ) ) ( not ( = ?auto_145111 ?auto_145112 ) ) ( not ( = ?auto_145111 ?auto_145113 ) ) ( not ( = ?auto_145111 ?auto_145114 ) ) ( not ( = ?auto_145112 ?auto_145113 ) ) ( not ( = ?auto_145112 ?auto_145114 ) ) ( not ( = ?auto_145113 ?auto_145114 ) ) ( ON ?auto_145114 ?auto_145116 ) ( not ( = ?auto_145108 ?auto_145116 ) ) ( not ( = ?auto_145109 ?auto_145116 ) ) ( not ( = ?auto_145110 ?auto_145116 ) ) ( not ( = ?auto_145111 ?auto_145116 ) ) ( not ( = ?auto_145112 ?auto_145116 ) ) ( not ( = ?auto_145113 ?auto_145116 ) ) ( not ( = ?auto_145114 ?auto_145116 ) ) ( ON ?auto_145113 ?auto_145114 ) ( ON-TABLE ?auto_145116 ) ( ON ?auto_145112 ?auto_145113 ) ( ON ?auto_145111 ?auto_145112 ) ( ON ?auto_145108 ?auto_145115 ) ( not ( = ?auto_145108 ?auto_145115 ) ) ( not ( = ?auto_145109 ?auto_145115 ) ) ( not ( = ?auto_145110 ?auto_145115 ) ) ( not ( = ?auto_145111 ?auto_145115 ) ) ( not ( = ?auto_145112 ?auto_145115 ) ) ( not ( = ?auto_145113 ?auto_145115 ) ) ( not ( = ?auto_145114 ?auto_145115 ) ) ( not ( = ?auto_145116 ?auto_145115 ) ) ( ON ?auto_145109 ?auto_145108 ) ( CLEAR ?auto_145109 ) ( ON-TABLE ?auto_145115 ) ( HOLDING ?auto_145110 ) ( CLEAR ?auto_145111 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_145116 ?auto_145114 ?auto_145113 ?auto_145112 ?auto_145111 ?auto_145110 )
      ( MAKE-7PILE ?auto_145108 ?auto_145109 ?auto_145110 ?auto_145111 ?auto_145112 ?auto_145113 ?auto_145114 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_145117 - BLOCK
      ?auto_145118 - BLOCK
      ?auto_145119 - BLOCK
      ?auto_145120 - BLOCK
      ?auto_145121 - BLOCK
      ?auto_145122 - BLOCK
      ?auto_145123 - BLOCK
    )
    :vars
    (
      ?auto_145124 - BLOCK
      ?auto_145125 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145117 ?auto_145118 ) ) ( not ( = ?auto_145117 ?auto_145119 ) ) ( not ( = ?auto_145117 ?auto_145120 ) ) ( not ( = ?auto_145117 ?auto_145121 ) ) ( not ( = ?auto_145117 ?auto_145122 ) ) ( not ( = ?auto_145117 ?auto_145123 ) ) ( not ( = ?auto_145118 ?auto_145119 ) ) ( not ( = ?auto_145118 ?auto_145120 ) ) ( not ( = ?auto_145118 ?auto_145121 ) ) ( not ( = ?auto_145118 ?auto_145122 ) ) ( not ( = ?auto_145118 ?auto_145123 ) ) ( not ( = ?auto_145119 ?auto_145120 ) ) ( not ( = ?auto_145119 ?auto_145121 ) ) ( not ( = ?auto_145119 ?auto_145122 ) ) ( not ( = ?auto_145119 ?auto_145123 ) ) ( not ( = ?auto_145120 ?auto_145121 ) ) ( not ( = ?auto_145120 ?auto_145122 ) ) ( not ( = ?auto_145120 ?auto_145123 ) ) ( not ( = ?auto_145121 ?auto_145122 ) ) ( not ( = ?auto_145121 ?auto_145123 ) ) ( not ( = ?auto_145122 ?auto_145123 ) ) ( ON ?auto_145123 ?auto_145124 ) ( not ( = ?auto_145117 ?auto_145124 ) ) ( not ( = ?auto_145118 ?auto_145124 ) ) ( not ( = ?auto_145119 ?auto_145124 ) ) ( not ( = ?auto_145120 ?auto_145124 ) ) ( not ( = ?auto_145121 ?auto_145124 ) ) ( not ( = ?auto_145122 ?auto_145124 ) ) ( not ( = ?auto_145123 ?auto_145124 ) ) ( ON ?auto_145122 ?auto_145123 ) ( ON-TABLE ?auto_145124 ) ( ON ?auto_145121 ?auto_145122 ) ( ON ?auto_145120 ?auto_145121 ) ( ON ?auto_145117 ?auto_145125 ) ( not ( = ?auto_145117 ?auto_145125 ) ) ( not ( = ?auto_145118 ?auto_145125 ) ) ( not ( = ?auto_145119 ?auto_145125 ) ) ( not ( = ?auto_145120 ?auto_145125 ) ) ( not ( = ?auto_145121 ?auto_145125 ) ) ( not ( = ?auto_145122 ?auto_145125 ) ) ( not ( = ?auto_145123 ?auto_145125 ) ) ( not ( = ?auto_145124 ?auto_145125 ) ) ( ON ?auto_145118 ?auto_145117 ) ( ON-TABLE ?auto_145125 ) ( CLEAR ?auto_145120 ) ( ON ?auto_145119 ?auto_145118 ) ( CLEAR ?auto_145119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_145125 ?auto_145117 ?auto_145118 )
      ( MAKE-7PILE ?auto_145117 ?auto_145118 ?auto_145119 ?auto_145120 ?auto_145121 ?auto_145122 ?auto_145123 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_145126 - BLOCK
      ?auto_145127 - BLOCK
      ?auto_145128 - BLOCK
      ?auto_145129 - BLOCK
      ?auto_145130 - BLOCK
      ?auto_145131 - BLOCK
      ?auto_145132 - BLOCK
    )
    :vars
    (
      ?auto_145134 - BLOCK
      ?auto_145133 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145126 ?auto_145127 ) ) ( not ( = ?auto_145126 ?auto_145128 ) ) ( not ( = ?auto_145126 ?auto_145129 ) ) ( not ( = ?auto_145126 ?auto_145130 ) ) ( not ( = ?auto_145126 ?auto_145131 ) ) ( not ( = ?auto_145126 ?auto_145132 ) ) ( not ( = ?auto_145127 ?auto_145128 ) ) ( not ( = ?auto_145127 ?auto_145129 ) ) ( not ( = ?auto_145127 ?auto_145130 ) ) ( not ( = ?auto_145127 ?auto_145131 ) ) ( not ( = ?auto_145127 ?auto_145132 ) ) ( not ( = ?auto_145128 ?auto_145129 ) ) ( not ( = ?auto_145128 ?auto_145130 ) ) ( not ( = ?auto_145128 ?auto_145131 ) ) ( not ( = ?auto_145128 ?auto_145132 ) ) ( not ( = ?auto_145129 ?auto_145130 ) ) ( not ( = ?auto_145129 ?auto_145131 ) ) ( not ( = ?auto_145129 ?auto_145132 ) ) ( not ( = ?auto_145130 ?auto_145131 ) ) ( not ( = ?auto_145130 ?auto_145132 ) ) ( not ( = ?auto_145131 ?auto_145132 ) ) ( ON ?auto_145132 ?auto_145134 ) ( not ( = ?auto_145126 ?auto_145134 ) ) ( not ( = ?auto_145127 ?auto_145134 ) ) ( not ( = ?auto_145128 ?auto_145134 ) ) ( not ( = ?auto_145129 ?auto_145134 ) ) ( not ( = ?auto_145130 ?auto_145134 ) ) ( not ( = ?auto_145131 ?auto_145134 ) ) ( not ( = ?auto_145132 ?auto_145134 ) ) ( ON ?auto_145131 ?auto_145132 ) ( ON-TABLE ?auto_145134 ) ( ON ?auto_145130 ?auto_145131 ) ( ON ?auto_145126 ?auto_145133 ) ( not ( = ?auto_145126 ?auto_145133 ) ) ( not ( = ?auto_145127 ?auto_145133 ) ) ( not ( = ?auto_145128 ?auto_145133 ) ) ( not ( = ?auto_145129 ?auto_145133 ) ) ( not ( = ?auto_145130 ?auto_145133 ) ) ( not ( = ?auto_145131 ?auto_145133 ) ) ( not ( = ?auto_145132 ?auto_145133 ) ) ( not ( = ?auto_145134 ?auto_145133 ) ) ( ON ?auto_145127 ?auto_145126 ) ( ON-TABLE ?auto_145133 ) ( ON ?auto_145128 ?auto_145127 ) ( CLEAR ?auto_145128 ) ( HOLDING ?auto_145129 ) ( CLEAR ?auto_145130 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_145134 ?auto_145132 ?auto_145131 ?auto_145130 ?auto_145129 )
      ( MAKE-7PILE ?auto_145126 ?auto_145127 ?auto_145128 ?auto_145129 ?auto_145130 ?auto_145131 ?auto_145132 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_145135 - BLOCK
      ?auto_145136 - BLOCK
      ?auto_145137 - BLOCK
      ?auto_145138 - BLOCK
      ?auto_145139 - BLOCK
      ?auto_145140 - BLOCK
      ?auto_145141 - BLOCK
    )
    :vars
    (
      ?auto_145142 - BLOCK
      ?auto_145143 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145135 ?auto_145136 ) ) ( not ( = ?auto_145135 ?auto_145137 ) ) ( not ( = ?auto_145135 ?auto_145138 ) ) ( not ( = ?auto_145135 ?auto_145139 ) ) ( not ( = ?auto_145135 ?auto_145140 ) ) ( not ( = ?auto_145135 ?auto_145141 ) ) ( not ( = ?auto_145136 ?auto_145137 ) ) ( not ( = ?auto_145136 ?auto_145138 ) ) ( not ( = ?auto_145136 ?auto_145139 ) ) ( not ( = ?auto_145136 ?auto_145140 ) ) ( not ( = ?auto_145136 ?auto_145141 ) ) ( not ( = ?auto_145137 ?auto_145138 ) ) ( not ( = ?auto_145137 ?auto_145139 ) ) ( not ( = ?auto_145137 ?auto_145140 ) ) ( not ( = ?auto_145137 ?auto_145141 ) ) ( not ( = ?auto_145138 ?auto_145139 ) ) ( not ( = ?auto_145138 ?auto_145140 ) ) ( not ( = ?auto_145138 ?auto_145141 ) ) ( not ( = ?auto_145139 ?auto_145140 ) ) ( not ( = ?auto_145139 ?auto_145141 ) ) ( not ( = ?auto_145140 ?auto_145141 ) ) ( ON ?auto_145141 ?auto_145142 ) ( not ( = ?auto_145135 ?auto_145142 ) ) ( not ( = ?auto_145136 ?auto_145142 ) ) ( not ( = ?auto_145137 ?auto_145142 ) ) ( not ( = ?auto_145138 ?auto_145142 ) ) ( not ( = ?auto_145139 ?auto_145142 ) ) ( not ( = ?auto_145140 ?auto_145142 ) ) ( not ( = ?auto_145141 ?auto_145142 ) ) ( ON ?auto_145140 ?auto_145141 ) ( ON-TABLE ?auto_145142 ) ( ON ?auto_145139 ?auto_145140 ) ( ON ?auto_145135 ?auto_145143 ) ( not ( = ?auto_145135 ?auto_145143 ) ) ( not ( = ?auto_145136 ?auto_145143 ) ) ( not ( = ?auto_145137 ?auto_145143 ) ) ( not ( = ?auto_145138 ?auto_145143 ) ) ( not ( = ?auto_145139 ?auto_145143 ) ) ( not ( = ?auto_145140 ?auto_145143 ) ) ( not ( = ?auto_145141 ?auto_145143 ) ) ( not ( = ?auto_145142 ?auto_145143 ) ) ( ON ?auto_145136 ?auto_145135 ) ( ON-TABLE ?auto_145143 ) ( ON ?auto_145137 ?auto_145136 ) ( CLEAR ?auto_145139 ) ( ON ?auto_145138 ?auto_145137 ) ( CLEAR ?auto_145138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_145143 ?auto_145135 ?auto_145136 ?auto_145137 )
      ( MAKE-7PILE ?auto_145135 ?auto_145136 ?auto_145137 ?auto_145138 ?auto_145139 ?auto_145140 ?auto_145141 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_145144 - BLOCK
      ?auto_145145 - BLOCK
      ?auto_145146 - BLOCK
      ?auto_145147 - BLOCK
      ?auto_145148 - BLOCK
      ?auto_145149 - BLOCK
      ?auto_145150 - BLOCK
    )
    :vars
    (
      ?auto_145152 - BLOCK
      ?auto_145151 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145144 ?auto_145145 ) ) ( not ( = ?auto_145144 ?auto_145146 ) ) ( not ( = ?auto_145144 ?auto_145147 ) ) ( not ( = ?auto_145144 ?auto_145148 ) ) ( not ( = ?auto_145144 ?auto_145149 ) ) ( not ( = ?auto_145144 ?auto_145150 ) ) ( not ( = ?auto_145145 ?auto_145146 ) ) ( not ( = ?auto_145145 ?auto_145147 ) ) ( not ( = ?auto_145145 ?auto_145148 ) ) ( not ( = ?auto_145145 ?auto_145149 ) ) ( not ( = ?auto_145145 ?auto_145150 ) ) ( not ( = ?auto_145146 ?auto_145147 ) ) ( not ( = ?auto_145146 ?auto_145148 ) ) ( not ( = ?auto_145146 ?auto_145149 ) ) ( not ( = ?auto_145146 ?auto_145150 ) ) ( not ( = ?auto_145147 ?auto_145148 ) ) ( not ( = ?auto_145147 ?auto_145149 ) ) ( not ( = ?auto_145147 ?auto_145150 ) ) ( not ( = ?auto_145148 ?auto_145149 ) ) ( not ( = ?auto_145148 ?auto_145150 ) ) ( not ( = ?auto_145149 ?auto_145150 ) ) ( ON ?auto_145150 ?auto_145152 ) ( not ( = ?auto_145144 ?auto_145152 ) ) ( not ( = ?auto_145145 ?auto_145152 ) ) ( not ( = ?auto_145146 ?auto_145152 ) ) ( not ( = ?auto_145147 ?auto_145152 ) ) ( not ( = ?auto_145148 ?auto_145152 ) ) ( not ( = ?auto_145149 ?auto_145152 ) ) ( not ( = ?auto_145150 ?auto_145152 ) ) ( ON ?auto_145149 ?auto_145150 ) ( ON-TABLE ?auto_145152 ) ( ON ?auto_145144 ?auto_145151 ) ( not ( = ?auto_145144 ?auto_145151 ) ) ( not ( = ?auto_145145 ?auto_145151 ) ) ( not ( = ?auto_145146 ?auto_145151 ) ) ( not ( = ?auto_145147 ?auto_145151 ) ) ( not ( = ?auto_145148 ?auto_145151 ) ) ( not ( = ?auto_145149 ?auto_145151 ) ) ( not ( = ?auto_145150 ?auto_145151 ) ) ( not ( = ?auto_145152 ?auto_145151 ) ) ( ON ?auto_145145 ?auto_145144 ) ( ON-TABLE ?auto_145151 ) ( ON ?auto_145146 ?auto_145145 ) ( ON ?auto_145147 ?auto_145146 ) ( CLEAR ?auto_145147 ) ( HOLDING ?auto_145148 ) ( CLEAR ?auto_145149 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_145152 ?auto_145150 ?auto_145149 ?auto_145148 )
      ( MAKE-7PILE ?auto_145144 ?auto_145145 ?auto_145146 ?auto_145147 ?auto_145148 ?auto_145149 ?auto_145150 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_145153 - BLOCK
      ?auto_145154 - BLOCK
      ?auto_145155 - BLOCK
      ?auto_145156 - BLOCK
      ?auto_145157 - BLOCK
      ?auto_145158 - BLOCK
      ?auto_145159 - BLOCK
    )
    :vars
    (
      ?auto_145160 - BLOCK
      ?auto_145161 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145153 ?auto_145154 ) ) ( not ( = ?auto_145153 ?auto_145155 ) ) ( not ( = ?auto_145153 ?auto_145156 ) ) ( not ( = ?auto_145153 ?auto_145157 ) ) ( not ( = ?auto_145153 ?auto_145158 ) ) ( not ( = ?auto_145153 ?auto_145159 ) ) ( not ( = ?auto_145154 ?auto_145155 ) ) ( not ( = ?auto_145154 ?auto_145156 ) ) ( not ( = ?auto_145154 ?auto_145157 ) ) ( not ( = ?auto_145154 ?auto_145158 ) ) ( not ( = ?auto_145154 ?auto_145159 ) ) ( not ( = ?auto_145155 ?auto_145156 ) ) ( not ( = ?auto_145155 ?auto_145157 ) ) ( not ( = ?auto_145155 ?auto_145158 ) ) ( not ( = ?auto_145155 ?auto_145159 ) ) ( not ( = ?auto_145156 ?auto_145157 ) ) ( not ( = ?auto_145156 ?auto_145158 ) ) ( not ( = ?auto_145156 ?auto_145159 ) ) ( not ( = ?auto_145157 ?auto_145158 ) ) ( not ( = ?auto_145157 ?auto_145159 ) ) ( not ( = ?auto_145158 ?auto_145159 ) ) ( ON ?auto_145159 ?auto_145160 ) ( not ( = ?auto_145153 ?auto_145160 ) ) ( not ( = ?auto_145154 ?auto_145160 ) ) ( not ( = ?auto_145155 ?auto_145160 ) ) ( not ( = ?auto_145156 ?auto_145160 ) ) ( not ( = ?auto_145157 ?auto_145160 ) ) ( not ( = ?auto_145158 ?auto_145160 ) ) ( not ( = ?auto_145159 ?auto_145160 ) ) ( ON ?auto_145158 ?auto_145159 ) ( ON-TABLE ?auto_145160 ) ( ON ?auto_145153 ?auto_145161 ) ( not ( = ?auto_145153 ?auto_145161 ) ) ( not ( = ?auto_145154 ?auto_145161 ) ) ( not ( = ?auto_145155 ?auto_145161 ) ) ( not ( = ?auto_145156 ?auto_145161 ) ) ( not ( = ?auto_145157 ?auto_145161 ) ) ( not ( = ?auto_145158 ?auto_145161 ) ) ( not ( = ?auto_145159 ?auto_145161 ) ) ( not ( = ?auto_145160 ?auto_145161 ) ) ( ON ?auto_145154 ?auto_145153 ) ( ON-TABLE ?auto_145161 ) ( ON ?auto_145155 ?auto_145154 ) ( ON ?auto_145156 ?auto_145155 ) ( CLEAR ?auto_145158 ) ( ON ?auto_145157 ?auto_145156 ) ( CLEAR ?auto_145157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_145161 ?auto_145153 ?auto_145154 ?auto_145155 ?auto_145156 )
      ( MAKE-7PILE ?auto_145153 ?auto_145154 ?auto_145155 ?auto_145156 ?auto_145157 ?auto_145158 ?auto_145159 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_145162 - BLOCK
      ?auto_145163 - BLOCK
      ?auto_145164 - BLOCK
      ?auto_145165 - BLOCK
      ?auto_145166 - BLOCK
      ?auto_145167 - BLOCK
      ?auto_145168 - BLOCK
    )
    :vars
    (
      ?auto_145169 - BLOCK
      ?auto_145170 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145162 ?auto_145163 ) ) ( not ( = ?auto_145162 ?auto_145164 ) ) ( not ( = ?auto_145162 ?auto_145165 ) ) ( not ( = ?auto_145162 ?auto_145166 ) ) ( not ( = ?auto_145162 ?auto_145167 ) ) ( not ( = ?auto_145162 ?auto_145168 ) ) ( not ( = ?auto_145163 ?auto_145164 ) ) ( not ( = ?auto_145163 ?auto_145165 ) ) ( not ( = ?auto_145163 ?auto_145166 ) ) ( not ( = ?auto_145163 ?auto_145167 ) ) ( not ( = ?auto_145163 ?auto_145168 ) ) ( not ( = ?auto_145164 ?auto_145165 ) ) ( not ( = ?auto_145164 ?auto_145166 ) ) ( not ( = ?auto_145164 ?auto_145167 ) ) ( not ( = ?auto_145164 ?auto_145168 ) ) ( not ( = ?auto_145165 ?auto_145166 ) ) ( not ( = ?auto_145165 ?auto_145167 ) ) ( not ( = ?auto_145165 ?auto_145168 ) ) ( not ( = ?auto_145166 ?auto_145167 ) ) ( not ( = ?auto_145166 ?auto_145168 ) ) ( not ( = ?auto_145167 ?auto_145168 ) ) ( ON ?auto_145168 ?auto_145169 ) ( not ( = ?auto_145162 ?auto_145169 ) ) ( not ( = ?auto_145163 ?auto_145169 ) ) ( not ( = ?auto_145164 ?auto_145169 ) ) ( not ( = ?auto_145165 ?auto_145169 ) ) ( not ( = ?auto_145166 ?auto_145169 ) ) ( not ( = ?auto_145167 ?auto_145169 ) ) ( not ( = ?auto_145168 ?auto_145169 ) ) ( ON-TABLE ?auto_145169 ) ( ON ?auto_145162 ?auto_145170 ) ( not ( = ?auto_145162 ?auto_145170 ) ) ( not ( = ?auto_145163 ?auto_145170 ) ) ( not ( = ?auto_145164 ?auto_145170 ) ) ( not ( = ?auto_145165 ?auto_145170 ) ) ( not ( = ?auto_145166 ?auto_145170 ) ) ( not ( = ?auto_145167 ?auto_145170 ) ) ( not ( = ?auto_145168 ?auto_145170 ) ) ( not ( = ?auto_145169 ?auto_145170 ) ) ( ON ?auto_145163 ?auto_145162 ) ( ON-TABLE ?auto_145170 ) ( ON ?auto_145164 ?auto_145163 ) ( ON ?auto_145165 ?auto_145164 ) ( ON ?auto_145166 ?auto_145165 ) ( CLEAR ?auto_145166 ) ( HOLDING ?auto_145167 ) ( CLEAR ?auto_145168 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_145169 ?auto_145168 ?auto_145167 )
      ( MAKE-7PILE ?auto_145162 ?auto_145163 ?auto_145164 ?auto_145165 ?auto_145166 ?auto_145167 ?auto_145168 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_145171 - BLOCK
      ?auto_145172 - BLOCK
      ?auto_145173 - BLOCK
      ?auto_145174 - BLOCK
      ?auto_145175 - BLOCK
      ?auto_145176 - BLOCK
      ?auto_145177 - BLOCK
    )
    :vars
    (
      ?auto_145178 - BLOCK
      ?auto_145179 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145171 ?auto_145172 ) ) ( not ( = ?auto_145171 ?auto_145173 ) ) ( not ( = ?auto_145171 ?auto_145174 ) ) ( not ( = ?auto_145171 ?auto_145175 ) ) ( not ( = ?auto_145171 ?auto_145176 ) ) ( not ( = ?auto_145171 ?auto_145177 ) ) ( not ( = ?auto_145172 ?auto_145173 ) ) ( not ( = ?auto_145172 ?auto_145174 ) ) ( not ( = ?auto_145172 ?auto_145175 ) ) ( not ( = ?auto_145172 ?auto_145176 ) ) ( not ( = ?auto_145172 ?auto_145177 ) ) ( not ( = ?auto_145173 ?auto_145174 ) ) ( not ( = ?auto_145173 ?auto_145175 ) ) ( not ( = ?auto_145173 ?auto_145176 ) ) ( not ( = ?auto_145173 ?auto_145177 ) ) ( not ( = ?auto_145174 ?auto_145175 ) ) ( not ( = ?auto_145174 ?auto_145176 ) ) ( not ( = ?auto_145174 ?auto_145177 ) ) ( not ( = ?auto_145175 ?auto_145176 ) ) ( not ( = ?auto_145175 ?auto_145177 ) ) ( not ( = ?auto_145176 ?auto_145177 ) ) ( ON ?auto_145177 ?auto_145178 ) ( not ( = ?auto_145171 ?auto_145178 ) ) ( not ( = ?auto_145172 ?auto_145178 ) ) ( not ( = ?auto_145173 ?auto_145178 ) ) ( not ( = ?auto_145174 ?auto_145178 ) ) ( not ( = ?auto_145175 ?auto_145178 ) ) ( not ( = ?auto_145176 ?auto_145178 ) ) ( not ( = ?auto_145177 ?auto_145178 ) ) ( ON-TABLE ?auto_145178 ) ( ON ?auto_145171 ?auto_145179 ) ( not ( = ?auto_145171 ?auto_145179 ) ) ( not ( = ?auto_145172 ?auto_145179 ) ) ( not ( = ?auto_145173 ?auto_145179 ) ) ( not ( = ?auto_145174 ?auto_145179 ) ) ( not ( = ?auto_145175 ?auto_145179 ) ) ( not ( = ?auto_145176 ?auto_145179 ) ) ( not ( = ?auto_145177 ?auto_145179 ) ) ( not ( = ?auto_145178 ?auto_145179 ) ) ( ON ?auto_145172 ?auto_145171 ) ( ON-TABLE ?auto_145179 ) ( ON ?auto_145173 ?auto_145172 ) ( ON ?auto_145174 ?auto_145173 ) ( ON ?auto_145175 ?auto_145174 ) ( CLEAR ?auto_145177 ) ( ON ?auto_145176 ?auto_145175 ) ( CLEAR ?auto_145176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_145179 ?auto_145171 ?auto_145172 ?auto_145173 ?auto_145174 ?auto_145175 )
      ( MAKE-7PILE ?auto_145171 ?auto_145172 ?auto_145173 ?auto_145174 ?auto_145175 ?auto_145176 ?auto_145177 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_145180 - BLOCK
      ?auto_145181 - BLOCK
      ?auto_145182 - BLOCK
      ?auto_145183 - BLOCK
      ?auto_145184 - BLOCK
      ?auto_145185 - BLOCK
      ?auto_145186 - BLOCK
    )
    :vars
    (
      ?auto_145188 - BLOCK
      ?auto_145187 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145180 ?auto_145181 ) ) ( not ( = ?auto_145180 ?auto_145182 ) ) ( not ( = ?auto_145180 ?auto_145183 ) ) ( not ( = ?auto_145180 ?auto_145184 ) ) ( not ( = ?auto_145180 ?auto_145185 ) ) ( not ( = ?auto_145180 ?auto_145186 ) ) ( not ( = ?auto_145181 ?auto_145182 ) ) ( not ( = ?auto_145181 ?auto_145183 ) ) ( not ( = ?auto_145181 ?auto_145184 ) ) ( not ( = ?auto_145181 ?auto_145185 ) ) ( not ( = ?auto_145181 ?auto_145186 ) ) ( not ( = ?auto_145182 ?auto_145183 ) ) ( not ( = ?auto_145182 ?auto_145184 ) ) ( not ( = ?auto_145182 ?auto_145185 ) ) ( not ( = ?auto_145182 ?auto_145186 ) ) ( not ( = ?auto_145183 ?auto_145184 ) ) ( not ( = ?auto_145183 ?auto_145185 ) ) ( not ( = ?auto_145183 ?auto_145186 ) ) ( not ( = ?auto_145184 ?auto_145185 ) ) ( not ( = ?auto_145184 ?auto_145186 ) ) ( not ( = ?auto_145185 ?auto_145186 ) ) ( not ( = ?auto_145180 ?auto_145188 ) ) ( not ( = ?auto_145181 ?auto_145188 ) ) ( not ( = ?auto_145182 ?auto_145188 ) ) ( not ( = ?auto_145183 ?auto_145188 ) ) ( not ( = ?auto_145184 ?auto_145188 ) ) ( not ( = ?auto_145185 ?auto_145188 ) ) ( not ( = ?auto_145186 ?auto_145188 ) ) ( ON-TABLE ?auto_145188 ) ( ON ?auto_145180 ?auto_145187 ) ( not ( = ?auto_145180 ?auto_145187 ) ) ( not ( = ?auto_145181 ?auto_145187 ) ) ( not ( = ?auto_145182 ?auto_145187 ) ) ( not ( = ?auto_145183 ?auto_145187 ) ) ( not ( = ?auto_145184 ?auto_145187 ) ) ( not ( = ?auto_145185 ?auto_145187 ) ) ( not ( = ?auto_145186 ?auto_145187 ) ) ( not ( = ?auto_145188 ?auto_145187 ) ) ( ON ?auto_145181 ?auto_145180 ) ( ON-TABLE ?auto_145187 ) ( ON ?auto_145182 ?auto_145181 ) ( ON ?auto_145183 ?auto_145182 ) ( ON ?auto_145184 ?auto_145183 ) ( ON ?auto_145185 ?auto_145184 ) ( CLEAR ?auto_145185 ) ( HOLDING ?auto_145186 ) ( CLEAR ?auto_145188 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_145188 ?auto_145186 )
      ( MAKE-7PILE ?auto_145180 ?auto_145181 ?auto_145182 ?auto_145183 ?auto_145184 ?auto_145185 ?auto_145186 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_145189 - BLOCK
      ?auto_145190 - BLOCK
      ?auto_145191 - BLOCK
      ?auto_145192 - BLOCK
      ?auto_145193 - BLOCK
      ?auto_145194 - BLOCK
      ?auto_145195 - BLOCK
    )
    :vars
    (
      ?auto_145197 - BLOCK
      ?auto_145196 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145189 ?auto_145190 ) ) ( not ( = ?auto_145189 ?auto_145191 ) ) ( not ( = ?auto_145189 ?auto_145192 ) ) ( not ( = ?auto_145189 ?auto_145193 ) ) ( not ( = ?auto_145189 ?auto_145194 ) ) ( not ( = ?auto_145189 ?auto_145195 ) ) ( not ( = ?auto_145190 ?auto_145191 ) ) ( not ( = ?auto_145190 ?auto_145192 ) ) ( not ( = ?auto_145190 ?auto_145193 ) ) ( not ( = ?auto_145190 ?auto_145194 ) ) ( not ( = ?auto_145190 ?auto_145195 ) ) ( not ( = ?auto_145191 ?auto_145192 ) ) ( not ( = ?auto_145191 ?auto_145193 ) ) ( not ( = ?auto_145191 ?auto_145194 ) ) ( not ( = ?auto_145191 ?auto_145195 ) ) ( not ( = ?auto_145192 ?auto_145193 ) ) ( not ( = ?auto_145192 ?auto_145194 ) ) ( not ( = ?auto_145192 ?auto_145195 ) ) ( not ( = ?auto_145193 ?auto_145194 ) ) ( not ( = ?auto_145193 ?auto_145195 ) ) ( not ( = ?auto_145194 ?auto_145195 ) ) ( not ( = ?auto_145189 ?auto_145197 ) ) ( not ( = ?auto_145190 ?auto_145197 ) ) ( not ( = ?auto_145191 ?auto_145197 ) ) ( not ( = ?auto_145192 ?auto_145197 ) ) ( not ( = ?auto_145193 ?auto_145197 ) ) ( not ( = ?auto_145194 ?auto_145197 ) ) ( not ( = ?auto_145195 ?auto_145197 ) ) ( ON-TABLE ?auto_145197 ) ( ON ?auto_145189 ?auto_145196 ) ( not ( = ?auto_145189 ?auto_145196 ) ) ( not ( = ?auto_145190 ?auto_145196 ) ) ( not ( = ?auto_145191 ?auto_145196 ) ) ( not ( = ?auto_145192 ?auto_145196 ) ) ( not ( = ?auto_145193 ?auto_145196 ) ) ( not ( = ?auto_145194 ?auto_145196 ) ) ( not ( = ?auto_145195 ?auto_145196 ) ) ( not ( = ?auto_145197 ?auto_145196 ) ) ( ON ?auto_145190 ?auto_145189 ) ( ON-TABLE ?auto_145196 ) ( ON ?auto_145191 ?auto_145190 ) ( ON ?auto_145192 ?auto_145191 ) ( ON ?auto_145193 ?auto_145192 ) ( ON ?auto_145194 ?auto_145193 ) ( CLEAR ?auto_145197 ) ( ON ?auto_145195 ?auto_145194 ) ( CLEAR ?auto_145195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_145196 ?auto_145189 ?auto_145190 ?auto_145191 ?auto_145192 ?auto_145193 ?auto_145194 )
      ( MAKE-7PILE ?auto_145189 ?auto_145190 ?auto_145191 ?auto_145192 ?auto_145193 ?auto_145194 ?auto_145195 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_145198 - BLOCK
      ?auto_145199 - BLOCK
      ?auto_145200 - BLOCK
      ?auto_145201 - BLOCK
      ?auto_145202 - BLOCK
      ?auto_145203 - BLOCK
      ?auto_145204 - BLOCK
    )
    :vars
    (
      ?auto_145206 - BLOCK
      ?auto_145205 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145198 ?auto_145199 ) ) ( not ( = ?auto_145198 ?auto_145200 ) ) ( not ( = ?auto_145198 ?auto_145201 ) ) ( not ( = ?auto_145198 ?auto_145202 ) ) ( not ( = ?auto_145198 ?auto_145203 ) ) ( not ( = ?auto_145198 ?auto_145204 ) ) ( not ( = ?auto_145199 ?auto_145200 ) ) ( not ( = ?auto_145199 ?auto_145201 ) ) ( not ( = ?auto_145199 ?auto_145202 ) ) ( not ( = ?auto_145199 ?auto_145203 ) ) ( not ( = ?auto_145199 ?auto_145204 ) ) ( not ( = ?auto_145200 ?auto_145201 ) ) ( not ( = ?auto_145200 ?auto_145202 ) ) ( not ( = ?auto_145200 ?auto_145203 ) ) ( not ( = ?auto_145200 ?auto_145204 ) ) ( not ( = ?auto_145201 ?auto_145202 ) ) ( not ( = ?auto_145201 ?auto_145203 ) ) ( not ( = ?auto_145201 ?auto_145204 ) ) ( not ( = ?auto_145202 ?auto_145203 ) ) ( not ( = ?auto_145202 ?auto_145204 ) ) ( not ( = ?auto_145203 ?auto_145204 ) ) ( not ( = ?auto_145198 ?auto_145206 ) ) ( not ( = ?auto_145199 ?auto_145206 ) ) ( not ( = ?auto_145200 ?auto_145206 ) ) ( not ( = ?auto_145201 ?auto_145206 ) ) ( not ( = ?auto_145202 ?auto_145206 ) ) ( not ( = ?auto_145203 ?auto_145206 ) ) ( not ( = ?auto_145204 ?auto_145206 ) ) ( ON ?auto_145198 ?auto_145205 ) ( not ( = ?auto_145198 ?auto_145205 ) ) ( not ( = ?auto_145199 ?auto_145205 ) ) ( not ( = ?auto_145200 ?auto_145205 ) ) ( not ( = ?auto_145201 ?auto_145205 ) ) ( not ( = ?auto_145202 ?auto_145205 ) ) ( not ( = ?auto_145203 ?auto_145205 ) ) ( not ( = ?auto_145204 ?auto_145205 ) ) ( not ( = ?auto_145206 ?auto_145205 ) ) ( ON ?auto_145199 ?auto_145198 ) ( ON-TABLE ?auto_145205 ) ( ON ?auto_145200 ?auto_145199 ) ( ON ?auto_145201 ?auto_145200 ) ( ON ?auto_145202 ?auto_145201 ) ( ON ?auto_145203 ?auto_145202 ) ( ON ?auto_145204 ?auto_145203 ) ( CLEAR ?auto_145204 ) ( HOLDING ?auto_145206 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_145206 )
      ( MAKE-7PILE ?auto_145198 ?auto_145199 ?auto_145200 ?auto_145201 ?auto_145202 ?auto_145203 ?auto_145204 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_145207 - BLOCK
      ?auto_145208 - BLOCK
      ?auto_145209 - BLOCK
      ?auto_145210 - BLOCK
      ?auto_145211 - BLOCK
      ?auto_145212 - BLOCK
      ?auto_145213 - BLOCK
    )
    :vars
    (
      ?auto_145215 - BLOCK
      ?auto_145214 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145207 ?auto_145208 ) ) ( not ( = ?auto_145207 ?auto_145209 ) ) ( not ( = ?auto_145207 ?auto_145210 ) ) ( not ( = ?auto_145207 ?auto_145211 ) ) ( not ( = ?auto_145207 ?auto_145212 ) ) ( not ( = ?auto_145207 ?auto_145213 ) ) ( not ( = ?auto_145208 ?auto_145209 ) ) ( not ( = ?auto_145208 ?auto_145210 ) ) ( not ( = ?auto_145208 ?auto_145211 ) ) ( not ( = ?auto_145208 ?auto_145212 ) ) ( not ( = ?auto_145208 ?auto_145213 ) ) ( not ( = ?auto_145209 ?auto_145210 ) ) ( not ( = ?auto_145209 ?auto_145211 ) ) ( not ( = ?auto_145209 ?auto_145212 ) ) ( not ( = ?auto_145209 ?auto_145213 ) ) ( not ( = ?auto_145210 ?auto_145211 ) ) ( not ( = ?auto_145210 ?auto_145212 ) ) ( not ( = ?auto_145210 ?auto_145213 ) ) ( not ( = ?auto_145211 ?auto_145212 ) ) ( not ( = ?auto_145211 ?auto_145213 ) ) ( not ( = ?auto_145212 ?auto_145213 ) ) ( not ( = ?auto_145207 ?auto_145215 ) ) ( not ( = ?auto_145208 ?auto_145215 ) ) ( not ( = ?auto_145209 ?auto_145215 ) ) ( not ( = ?auto_145210 ?auto_145215 ) ) ( not ( = ?auto_145211 ?auto_145215 ) ) ( not ( = ?auto_145212 ?auto_145215 ) ) ( not ( = ?auto_145213 ?auto_145215 ) ) ( ON ?auto_145207 ?auto_145214 ) ( not ( = ?auto_145207 ?auto_145214 ) ) ( not ( = ?auto_145208 ?auto_145214 ) ) ( not ( = ?auto_145209 ?auto_145214 ) ) ( not ( = ?auto_145210 ?auto_145214 ) ) ( not ( = ?auto_145211 ?auto_145214 ) ) ( not ( = ?auto_145212 ?auto_145214 ) ) ( not ( = ?auto_145213 ?auto_145214 ) ) ( not ( = ?auto_145215 ?auto_145214 ) ) ( ON ?auto_145208 ?auto_145207 ) ( ON-TABLE ?auto_145214 ) ( ON ?auto_145209 ?auto_145208 ) ( ON ?auto_145210 ?auto_145209 ) ( ON ?auto_145211 ?auto_145210 ) ( ON ?auto_145212 ?auto_145211 ) ( ON ?auto_145213 ?auto_145212 ) ( ON ?auto_145215 ?auto_145213 ) ( CLEAR ?auto_145215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_145214 ?auto_145207 ?auto_145208 ?auto_145209 ?auto_145210 ?auto_145211 ?auto_145212 ?auto_145213 )
      ( MAKE-7PILE ?auto_145207 ?auto_145208 ?auto_145209 ?auto_145210 ?auto_145211 ?auto_145212 ?auto_145213 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_145224 - BLOCK
      ?auto_145225 - BLOCK
      ?auto_145226 - BLOCK
      ?auto_145227 - BLOCK
      ?auto_145228 - BLOCK
      ?auto_145229 - BLOCK
      ?auto_145230 - BLOCK
      ?auto_145231 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_145231 ) ( CLEAR ?auto_145230 ) ( ON-TABLE ?auto_145224 ) ( ON ?auto_145225 ?auto_145224 ) ( ON ?auto_145226 ?auto_145225 ) ( ON ?auto_145227 ?auto_145226 ) ( ON ?auto_145228 ?auto_145227 ) ( ON ?auto_145229 ?auto_145228 ) ( ON ?auto_145230 ?auto_145229 ) ( not ( = ?auto_145224 ?auto_145225 ) ) ( not ( = ?auto_145224 ?auto_145226 ) ) ( not ( = ?auto_145224 ?auto_145227 ) ) ( not ( = ?auto_145224 ?auto_145228 ) ) ( not ( = ?auto_145224 ?auto_145229 ) ) ( not ( = ?auto_145224 ?auto_145230 ) ) ( not ( = ?auto_145224 ?auto_145231 ) ) ( not ( = ?auto_145225 ?auto_145226 ) ) ( not ( = ?auto_145225 ?auto_145227 ) ) ( not ( = ?auto_145225 ?auto_145228 ) ) ( not ( = ?auto_145225 ?auto_145229 ) ) ( not ( = ?auto_145225 ?auto_145230 ) ) ( not ( = ?auto_145225 ?auto_145231 ) ) ( not ( = ?auto_145226 ?auto_145227 ) ) ( not ( = ?auto_145226 ?auto_145228 ) ) ( not ( = ?auto_145226 ?auto_145229 ) ) ( not ( = ?auto_145226 ?auto_145230 ) ) ( not ( = ?auto_145226 ?auto_145231 ) ) ( not ( = ?auto_145227 ?auto_145228 ) ) ( not ( = ?auto_145227 ?auto_145229 ) ) ( not ( = ?auto_145227 ?auto_145230 ) ) ( not ( = ?auto_145227 ?auto_145231 ) ) ( not ( = ?auto_145228 ?auto_145229 ) ) ( not ( = ?auto_145228 ?auto_145230 ) ) ( not ( = ?auto_145228 ?auto_145231 ) ) ( not ( = ?auto_145229 ?auto_145230 ) ) ( not ( = ?auto_145229 ?auto_145231 ) ) ( not ( = ?auto_145230 ?auto_145231 ) ) )
    :subtasks
    ( ( !STACK ?auto_145231 ?auto_145230 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_145232 - BLOCK
      ?auto_145233 - BLOCK
      ?auto_145234 - BLOCK
      ?auto_145235 - BLOCK
      ?auto_145236 - BLOCK
      ?auto_145237 - BLOCK
      ?auto_145238 - BLOCK
      ?auto_145239 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_145238 ) ( ON-TABLE ?auto_145232 ) ( ON ?auto_145233 ?auto_145232 ) ( ON ?auto_145234 ?auto_145233 ) ( ON ?auto_145235 ?auto_145234 ) ( ON ?auto_145236 ?auto_145235 ) ( ON ?auto_145237 ?auto_145236 ) ( ON ?auto_145238 ?auto_145237 ) ( not ( = ?auto_145232 ?auto_145233 ) ) ( not ( = ?auto_145232 ?auto_145234 ) ) ( not ( = ?auto_145232 ?auto_145235 ) ) ( not ( = ?auto_145232 ?auto_145236 ) ) ( not ( = ?auto_145232 ?auto_145237 ) ) ( not ( = ?auto_145232 ?auto_145238 ) ) ( not ( = ?auto_145232 ?auto_145239 ) ) ( not ( = ?auto_145233 ?auto_145234 ) ) ( not ( = ?auto_145233 ?auto_145235 ) ) ( not ( = ?auto_145233 ?auto_145236 ) ) ( not ( = ?auto_145233 ?auto_145237 ) ) ( not ( = ?auto_145233 ?auto_145238 ) ) ( not ( = ?auto_145233 ?auto_145239 ) ) ( not ( = ?auto_145234 ?auto_145235 ) ) ( not ( = ?auto_145234 ?auto_145236 ) ) ( not ( = ?auto_145234 ?auto_145237 ) ) ( not ( = ?auto_145234 ?auto_145238 ) ) ( not ( = ?auto_145234 ?auto_145239 ) ) ( not ( = ?auto_145235 ?auto_145236 ) ) ( not ( = ?auto_145235 ?auto_145237 ) ) ( not ( = ?auto_145235 ?auto_145238 ) ) ( not ( = ?auto_145235 ?auto_145239 ) ) ( not ( = ?auto_145236 ?auto_145237 ) ) ( not ( = ?auto_145236 ?auto_145238 ) ) ( not ( = ?auto_145236 ?auto_145239 ) ) ( not ( = ?auto_145237 ?auto_145238 ) ) ( not ( = ?auto_145237 ?auto_145239 ) ) ( not ( = ?auto_145238 ?auto_145239 ) ) ( ON-TABLE ?auto_145239 ) ( CLEAR ?auto_145239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_145239 )
      ( MAKE-8PILE ?auto_145232 ?auto_145233 ?auto_145234 ?auto_145235 ?auto_145236 ?auto_145237 ?auto_145238 ?auto_145239 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_145240 - BLOCK
      ?auto_145241 - BLOCK
      ?auto_145242 - BLOCK
      ?auto_145243 - BLOCK
      ?auto_145244 - BLOCK
      ?auto_145245 - BLOCK
      ?auto_145246 - BLOCK
      ?auto_145247 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145240 ) ( ON ?auto_145241 ?auto_145240 ) ( ON ?auto_145242 ?auto_145241 ) ( ON ?auto_145243 ?auto_145242 ) ( ON ?auto_145244 ?auto_145243 ) ( ON ?auto_145245 ?auto_145244 ) ( not ( = ?auto_145240 ?auto_145241 ) ) ( not ( = ?auto_145240 ?auto_145242 ) ) ( not ( = ?auto_145240 ?auto_145243 ) ) ( not ( = ?auto_145240 ?auto_145244 ) ) ( not ( = ?auto_145240 ?auto_145245 ) ) ( not ( = ?auto_145240 ?auto_145246 ) ) ( not ( = ?auto_145240 ?auto_145247 ) ) ( not ( = ?auto_145241 ?auto_145242 ) ) ( not ( = ?auto_145241 ?auto_145243 ) ) ( not ( = ?auto_145241 ?auto_145244 ) ) ( not ( = ?auto_145241 ?auto_145245 ) ) ( not ( = ?auto_145241 ?auto_145246 ) ) ( not ( = ?auto_145241 ?auto_145247 ) ) ( not ( = ?auto_145242 ?auto_145243 ) ) ( not ( = ?auto_145242 ?auto_145244 ) ) ( not ( = ?auto_145242 ?auto_145245 ) ) ( not ( = ?auto_145242 ?auto_145246 ) ) ( not ( = ?auto_145242 ?auto_145247 ) ) ( not ( = ?auto_145243 ?auto_145244 ) ) ( not ( = ?auto_145243 ?auto_145245 ) ) ( not ( = ?auto_145243 ?auto_145246 ) ) ( not ( = ?auto_145243 ?auto_145247 ) ) ( not ( = ?auto_145244 ?auto_145245 ) ) ( not ( = ?auto_145244 ?auto_145246 ) ) ( not ( = ?auto_145244 ?auto_145247 ) ) ( not ( = ?auto_145245 ?auto_145246 ) ) ( not ( = ?auto_145245 ?auto_145247 ) ) ( not ( = ?auto_145246 ?auto_145247 ) ) ( ON-TABLE ?auto_145247 ) ( CLEAR ?auto_145247 ) ( HOLDING ?auto_145246 ) ( CLEAR ?auto_145245 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_145240 ?auto_145241 ?auto_145242 ?auto_145243 ?auto_145244 ?auto_145245 ?auto_145246 )
      ( MAKE-8PILE ?auto_145240 ?auto_145241 ?auto_145242 ?auto_145243 ?auto_145244 ?auto_145245 ?auto_145246 ?auto_145247 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_145248 - BLOCK
      ?auto_145249 - BLOCK
      ?auto_145250 - BLOCK
      ?auto_145251 - BLOCK
      ?auto_145252 - BLOCK
      ?auto_145253 - BLOCK
      ?auto_145254 - BLOCK
      ?auto_145255 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145248 ) ( ON ?auto_145249 ?auto_145248 ) ( ON ?auto_145250 ?auto_145249 ) ( ON ?auto_145251 ?auto_145250 ) ( ON ?auto_145252 ?auto_145251 ) ( ON ?auto_145253 ?auto_145252 ) ( not ( = ?auto_145248 ?auto_145249 ) ) ( not ( = ?auto_145248 ?auto_145250 ) ) ( not ( = ?auto_145248 ?auto_145251 ) ) ( not ( = ?auto_145248 ?auto_145252 ) ) ( not ( = ?auto_145248 ?auto_145253 ) ) ( not ( = ?auto_145248 ?auto_145254 ) ) ( not ( = ?auto_145248 ?auto_145255 ) ) ( not ( = ?auto_145249 ?auto_145250 ) ) ( not ( = ?auto_145249 ?auto_145251 ) ) ( not ( = ?auto_145249 ?auto_145252 ) ) ( not ( = ?auto_145249 ?auto_145253 ) ) ( not ( = ?auto_145249 ?auto_145254 ) ) ( not ( = ?auto_145249 ?auto_145255 ) ) ( not ( = ?auto_145250 ?auto_145251 ) ) ( not ( = ?auto_145250 ?auto_145252 ) ) ( not ( = ?auto_145250 ?auto_145253 ) ) ( not ( = ?auto_145250 ?auto_145254 ) ) ( not ( = ?auto_145250 ?auto_145255 ) ) ( not ( = ?auto_145251 ?auto_145252 ) ) ( not ( = ?auto_145251 ?auto_145253 ) ) ( not ( = ?auto_145251 ?auto_145254 ) ) ( not ( = ?auto_145251 ?auto_145255 ) ) ( not ( = ?auto_145252 ?auto_145253 ) ) ( not ( = ?auto_145252 ?auto_145254 ) ) ( not ( = ?auto_145252 ?auto_145255 ) ) ( not ( = ?auto_145253 ?auto_145254 ) ) ( not ( = ?auto_145253 ?auto_145255 ) ) ( not ( = ?auto_145254 ?auto_145255 ) ) ( ON-TABLE ?auto_145255 ) ( CLEAR ?auto_145253 ) ( ON ?auto_145254 ?auto_145255 ) ( CLEAR ?auto_145254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_145255 )
      ( MAKE-8PILE ?auto_145248 ?auto_145249 ?auto_145250 ?auto_145251 ?auto_145252 ?auto_145253 ?auto_145254 ?auto_145255 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_145256 - BLOCK
      ?auto_145257 - BLOCK
      ?auto_145258 - BLOCK
      ?auto_145259 - BLOCK
      ?auto_145260 - BLOCK
      ?auto_145261 - BLOCK
      ?auto_145262 - BLOCK
      ?auto_145263 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145256 ) ( ON ?auto_145257 ?auto_145256 ) ( ON ?auto_145258 ?auto_145257 ) ( ON ?auto_145259 ?auto_145258 ) ( ON ?auto_145260 ?auto_145259 ) ( not ( = ?auto_145256 ?auto_145257 ) ) ( not ( = ?auto_145256 ?auto_145258 ) ) ( not ( = ?auto_145256 ?auto_145259 ) ) ( not ( = ?auto_145256 ?auto_145260 ) ) ( not ( = ?auto_145256 ?auto_145261 ) ) ( not ( = ?auto_145256 ?auto_145262 ) ) ( not ( = ?auto_145256 ?auto_145263 ) ) ( not ( = ?auto_145257 ?auto_145258 ) ) ( not ( = ?auto_145257 ?auto_145259 ) ) ( not ( = ?auto_145257 ?auto_145260 ) ) ( not ( = ?auto_145257 ?auto_145261 ) ) ( not ( = ?auto_145257 ?auto_145262 ) ) ( not ( = ?auto_145257 ?auto_145263 ) ) ( not ( = ?auto_145258 ?auto_145259 ) ) ( not ( = ?auto_145258 ?auto_145260 ) ) ( not ( = ?auto_145258 ?auto_145261 ) ) ( not ( = ?auto_145258 ?auto_145262 ) ) ( not ( = ?auto_145258 ?auto_145263 ) ) ( not ( = ?auto_145259 ?auto_145260 ) ) ( not ( = ?auto_145259 ?auto_145261 ) ) ( not ( = ?auto_145259 ?auto_145262 ) ) ( not ( = ?auto_145259 ?auto_145263 ) ) ( not ( = ?auto_145260 ?auto_145261 ) ) ( not ( = ?auto_145260 ?auto_145262 ) ) ( not ( = ?auto_145260 ?auto_145263 ) ) ( not ( = ?auto_145261 ?auto_145262 ) ) ( not ( = ?auto_145261 ?auto_145263 ) ) ( not ( = ?auto_145262 ?auto_145263 ) ) ( ON-TABLE ?auto_145263 ) ( ON ?auto_145262 ?auto_145263 ) ( CLEAR ?auto_145262 ) ( HOLDING ?auto_145261 ) ( CLEAR ?auto_145260 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_145256 ?auto_145257 ?auto_145258 ?auto_145259 ?auto_145260 ?auto_145261 )
      ( MAKE-8PILE ?auto_145256 ?auto_145257 ?auto_145258 ?auto_145259 ?auto_145260 ?auto_145261 ?auto_145262 ?auto_145263 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_145264 - BLOCK
      ?auto_145265 - BLOCK
      ?auto_145266 - BLOCK
      ?auto_145267 - BLOCK
      ?auto_145268 - BLOCK
      ?auto_145269 - BLOCK
      ?auto_145270 - BLOCK
      ?auto_145271 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145264 ) ( ON ?auto_145265 ?auto_145264 ) ( ON ?auto_145266 ?auto_145265 ) ( ON ?auto_145267 ?auto_145266 ) ( ON ?auto_145268 ?auto_145267 ) ( not ( = ?auto_145264 ?auto_145265 ) ) ( not ( = ?auto_145264 ?auto_145266 ) ) ( not ( = ?auto_145264 ?auto_145267 ) ) ( not ( = ?auto_145264 ?auto_145268 ) ) ( not ( = ?auto_145264 ?auto_145269 ) ) ( not ( = ?auto_145264 ?auto_145270 ) ) ( not ( = ?auto_145264 ?auto_145271 ) ) ( not ( = ?auto_145265 ?auto_145266 ) ) ( not ( = ?auto_145265 ?auto_145267 ) ) ( not ( = ?auto_145265 ?auto_145268 ) ) ( not ( = ?auto_145265 ?auto_145269 ) ) ( not ( = ?auto_145265 ?auto_145270 ) ) ( not ( = ?auto_145265 ?auto_145271 ) ) ( not ( = ?auto_145266 ?auto_145267 ) ) ( not ( = ?auto_145266 ?auto_145268 ) ) ( not ( = ?auto_145266 ?auto_145269 ) ) ( not ( = ?auto_145266 ?auto_145270 ) ) ( not ( = ?auto_145266 ?auto_145271 ) ) ( not ( = ?auto_145267 ?auto_145268 ) ) ( not ( = ?auto_145267 ?auto_145269 ) ) ( not ( = ?auto_145267 ?auto_145270 ) ) ( not ( = ?auto_145267 ?auto_145271 ) ) ( not ( = ?auto_145268 ?auto_145269 ) ) ( not ( = ?auto_145268 ?auto_145270 ) ) ( not ( = ?auto_145268 ?auto_145271 ) ) ( not ( = ?auto_145269 ?auto_145270 ) ) ( not ( = ?auto_145269 ?auto_145271 ) ) ( not ( = ?auto_145270 ?auto_145271 ) ) ( ON-TABLE ?auto_145271 ) ( ON ?auto_145270 ?auto_145271 ) ( CLEAR ?auto_145268 ) ( ON ?auto_145269 ?auto_145270 ) ( CLEAR ?auto_145269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_145271 ?auto_145270 )
      ( MAKE-8PILE ?auto_145264 ?auto_145265 ?auto_145266 ?auto_145267 ?auto_145268 ?auto_145269 ?auto_145270 ?auto_145271 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_145272 - BLOCK
      ?auto_145273 - BLOCK
      ?auto_145274 - BLOCK
      ?auto_145275 - BLOCK
      ?auto_145276 - BLOCK
      ?auto_145277 - BLOCK
      ?auto_145278 - BLOCK
      ?auto_145279 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145272 ) ( ON ?auto_145273 ?auto_145272 ) ( ON ?auto_145274 ?auto_145273 ) ( ON ?auto_145275 ?auto_145274 ) ( not ( = ?auto_145272 ?auto_145273 ) ) ( not ( = ?auto_145272 ?auto_145274 ) ) ( not ( = ?auto_145272 ?auto_145275 ) ) ( not ( = ?auto_145272 ?auto_145276 ) ) ( not ( = ?auto_145272 ?auto_145277 ) ) ( not ( = ?auto_145272 ?auto_145278 ) ) ( not ( = ?auto_145272 ?auto_145279 ) ) ( not ( = ?auto_145273 ?auto_145274 ) ) ( not ( = ?auto_145273 ?auto_145275 ) ) ( not ( = ?auto_145273 ?auto_145276 ) ) ( not ( = ?auto_145273 ?auto_145277 ) ) ( not ( = ?auto_145273 ?auto_145278 ) ) ( not ( = ?auto_145273 ?auto_145279 ) ) ( not ( = ?auto_145274 ?auto_145275 ) ) ( not ( = ?auto_145274 ?auto_145276 ) ) ( not ( = ?auto_145274 ?auto_145277 ) ) ( not ( = ?auto_145274 ?auto_145278 ) ) ( not ( = ?auto_145274 ?auto_145279 ) ) ( not ( = ?auto_145275 ?auto_145276 ) ) ( not ( = ?auto_145275 ?auto_145277 ) ) ( not ( = ?auto_145275 ?auto_145278 ) ) ( not ( = ?auto_145275 ?auto_145279 ) ) ( not ( = ?auto_145276 ?auto_145277 ) ) ( not ( = ?auto_145276 ?auto_145278 ) ) ( not ( = ?auto_145276 ?auto_145279 ) ) ( not ( = ?auto_145277 ?auto_145278 ) ) ( not ( = ?auto_145277 ?auto_145279 ) ) ( not ( = ?auto_145278 ?auto_145279 ) ) ( ON-TABLE ?auto_145279 ) ( ON ?auto_145278 ?auto_145279 ) ( ON ?auto_145277 ?auto_145278 ) ( CLEAR ?auto_145277 ) ( HOLDING ?auto_145276 ) ( CLEAR ?auto_145275 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_145272 ?auto_145273 ?auto_145274 ?auto_145275 ?auto_145276 )
      ( MAKE-8PILE ?auto_145272 ?auto_145273 ?auto_145274 ?auto_145275 ?auto_145276 ?auto_145277 ?auto_145278 ?auto_145279 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_145280 - BLOCK
      ?auto_145281 - BLOCK
      ?auto_145282 - BLOCK
      ?auto_145283 - BLOCK
      ?auto_145284 - BLOCK
      ?auto_145285 - BLOCK
      ?auto_145286 - BLOCK
      ?auto_145287 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145280 ) ( ON ?auto_145281 ?auto_145280 ) ( ON ?auto_145282 ?auto_145281 ) ( ON ?auto_145283 ?auto_145282 ) ( not ( = ?auto_145280 ?auto_145281 ) ) ( not ( = ?auto_145280 ?auto_145282 ) ) ( not ( = ?auto_145280 ?auto_145283 ) ) ( not ( = ?auto_145280 ?auto_145284 ) ) ( not ( = ?auto_145280 ?auto_145285 ) ) ( not ( = ?auto_145280 ?auto_145286 ) ) ( not ( = ?auto_145280 ?auto_145287 ) ) ( not ( = ?auto_145281 ?auto_145282 ) ) ( not ( = ?auto_145281 ?auto_145283 ) ) ( not ( = ?auto_145281 ?auto_145284 ) ) ( not ( = ?auto_145281 ?auto_145285 ) ) ( not ( = ?auto_145281 ?auto_145286 ) ) ( not ( = ?auto_145281 ?auto_145287 ) ) ( not ( = ?auto_145282 ?auto_145283 ) ) ( not ( = ?auto_145282 ?auto_145284 ) ) ( not ( = ?auto_145282 ?auto_145285 ) ) ( not ( = ?auto_145282 ?auto_145286 ) ) ( not ( = ?auto_145282 ?auto_145287 ) ) ( not ( = ?auto_145283 ?auto_145284 ) ) ( not ( = ?auto_145283 ?auto_145285 ) ) ( not ( = ?auto_145283 ?auto_145286 ) ) ( not ( = ?auto_145283 ?auto_145287 ) ) ( not ( = ?auto_145284 ?auto_145285 ) ) ( not ( = ?auto_145284 ?auto_145286 ) ) ( not ( = ?auto_145284 ?auto_145287 ) ) ( not ( = ?auto_145285 ?auto_145286 ) ) ( not ( = ?auto_145285 ?auto_145287 ) ) ( not ( = ?auto_145286 ?auto_145287 ) ) ( ON-TABLE ?auto_145287 ) ( ON ?auto_145286 ?auto_145287 ) ( ON ?auto_145285 ?auto_145286 ) ( CLEAR ?auto_145283 ) ( ON ?auto_145284 ?auto_145285 ) ( CLEAR ?auto_145284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_145287 ?auto_145286 ?auto_145285 )
      ( MAKE-8PILE ?auto_145280 ?auto_145281 ?auto_145282 ?auto_145283 ?auto_145284 ?auto_145285 ?auto_145286 ?auto_145287 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_145288 - BLOCK
      ?auto_145289 - BLOCK
      ?auto_145290 - BLOCK
      ?auto_145291 - BLOCK
      ?auto_145292 - BLOCK
      ?auto_145293 - BLOCK
      ?auto_145294 - BLOCK
      ?auto_145295 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145288 ) ( ON ?auto_145289 ?auto_145288 ) ( ON ?auto_145290 ?auto_145289 ) ( not ( = ?auto_145288 ?auto_145289 ) ) ( not ( = ?auto_145288 ?auto_145290 ) ) ( not ( = ?auto_145288 ?auto_145291 ) ) ( not ( = ?auto_145288 ?auto_145292 ) ) ( not ( = ?auto_145288 ?auto_145293 ) ) ( not ( = ?auto_145288 ?auto_145294 ) ) ( not ( = ?auto_145288 ?auto_145295 ) ) ( not ( = ?auto_145289 ?auto_145290 ) ) ( not ( = ?auto_145289 ?auto_145291 ) ) ( not ( = ?auto_145289 ?auto_145292 ) ) ( not ( = ?auto_145289 ?auto_145293 ) ) ( not ( = ?auto_145289 ?auto_145294 ) ) ( not ( = ?auto_145289 ?auto_145295 ) ) ( not ( = ?auto_145290 ?auto_145291 ) ) ( not ( = ?auto_145290 ?auto_145292 ) ) ( not ( = ?auto_145290 ?auto_145293 ) ) ( not ( = ?auto_145290 ?auto_145294 ) ) ( not ( = ?auto_145290 ?auto_145295 ) ) ( not ( = ?auto_145291 ?auto_145292 ) ) ( not ( = ?auto_145291 ?auto_145293 ) ) ( not ( = ?auto_145291 ?auto_145294 ) ) ( not ( = ?auto_145291 ?auto_145295 ) ) ( not ( = ?auto_145292 ?auto_145293 ) ) ( not ( = ?auto_145292 ?auto_145294 ) ) ( not ( = ?auto_145292 ?auto_145295 ) ) ( not ( = ?auto_145293 ?auto_145294 ) ) ( not ( = ?auto_145293 ?auto_145295 ) ) ( not ( = ?auto_145294 ?auto_145295 ) ) ( ON-TABLE ?auto_145295 ) ( ON ?auto_145294 ?auto_145295 ) ( ON ?auto_145293 ?auto_145294 ) ( ON ?auto_145292 ?auto_145293 ) ( CLEAR ?auto_145292 ) ( HOLDING ?auto_145291 ) ( CLEAR ?auto_145290 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_145288 ?auto_145289 ?auto_145290 ?auto_145291 )
      ( MAKE-8PILE ?auto_145288 ?auto_145289 ?auto_145290 ?auto_145291 ?auto_145292 ?auto_145293 ?auto_145294 ?auto_145295 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_145296 - BLOCK
      ?auto_145297 - BLOCK
      ?auto_145298 - BLOCK
      ?auto_145299 - BLOCK
      ?auto_145300 - BLOCK
      ?auto_145301 - BLOCK
      ?auto_145302 - BLOCK
      ?auto_145303 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145296 ) ( ON ?auto_145297 ?auto_145296 ) ( ON ?auto_145298 ?auto_145297 ) ( not ( = ?auto_145296 ?auto_145297 ) ) ( not ( = ?auto_145296 ?auto_145298 ) ) ( not ( = ?auto_145296 ?auto_145299 ) ) ( not ( = ?auto_145296 ?auto_145300 ) ) ( not ( = ?auto_145296 ?auto_145301 ) ) ( not ( = ?auto_145296 ?auto_145302 ) ) ( not ( = ?auto_145296 ?auto_145303 ) ) ( not ( = ?auto_145297 ?auto_145298 ) ) ( not ( = ?auto_145297 ?auto_145299 ) ) ( not ( = ?auto_145297 ?auto_145300 ) ) ( not ( = ?auto_145297 ?auto_145301 ) ) ( not ( = ?auto_145297 ?auto_145302 ) ) ( not ( = ?auto_145297 ?auto_145303 ) ) ( not ( = ?auto_145298 ?auto_145299 ) ) ( not ( = ?auto_145298 ?auto_145300 ) ) ( not ( = ?auto_145298 ?auto_145301 ) ) ( not ( = ?auto_145298 ?auto_145302 ) ) ( not ( = ?auto_145298 ?auto_145303 ) ) ( not ( = ?auto_145299 ?auto_145300 ) ) ( not ( = ?auto_145299 ?auto_145301 ) ) ( not ( = ?auto_145299 ?auto_145302 ) ) ( not ( = ?auto_145299 ?auto_145303 ) ) ( not ( = ?auto_145300 ?auto_145301 ) ) ( not ( = ?auto_145300 ?auto_145302 ) ) ( not ( = ?auto_145300 ?auto_145303 ) ) ( not ( = ?auto_145301 ?auto_145302 ) ) ( not ( = ?auto_145301 ?auto_145303 ) ) ( not ( = ?auto_145302 ?auto_145303 ) ) ( ON-TABLE ?auto_145303 ) ( ON ?auto_145302 ?auto_145303 ) ( ON ?auto_145301 ?auto_145302 ) ( ON ?auto_145300 ?auto_145301 ) ( CLEAR ?auto_145298 ) ( ON ?auto_145299 ?auto_145300 ) ( CLEAR ?auto_145299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_145303 ?auto_145302 ?auto_145301 ?auto_145300 )
      ( MAKE-8PILE ?auto_145296 ?auto_145297 ?auto_145298 ?auto_145299 ?auto_145300 ?auto_145301 ?auto_145302 ?auto_145303 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_145304 - BLOCK
      ?auto_145305 - BLOCK
      ?auto_145306 - BLOCK
      ?auto_145307 - BLOCK
      ?auto_145308 - BLOCK
      ?auto_145309 - BLOCK
      ?auto_145310 - BLOCK
      ?auto_145311 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145304 ) ( ON ?auto_145305 ?auto_145304 ) ( not ( = ?auto_145304 ?auto_145305 ) ) ( not ( = ?auto_145304 ?auto_145306 ) ) ( not ( = ?auto_145304 ?auto_145307 ) ) ( not ( = ?auto_145304 ?auto_145308 ) ) ( not ( = ?auto_145304 ?auto_145309 ) ) ( not ( = ?auto_145304 ?auto_145310 ) ) ( not ( = ?auto_145304 ?auto_145311 ) ) ( not ( = ?auto_145305 ?auto_145306 ) ) ( not ( = ?auto_145305 ?auto_145307 ) ) ( not ( = ?auto_145305 ?auto_145308 ) ) ( not ( = ?auto_145305 ?auto_145309 ) ) ( not ( = ?auto_145305 ?auto_145310 ) ) ( not ( = ?auto_145305 ?auto_145311 ) ) ( not ( = ?auto_145306 ?auto_145307 ) ) ( not ( = ?auto_145306 ?auto_145308 ) ) ( not ( = ?auto_145306 ?auto_145309 ) ) ( not ( = ?auto_145306 ?auto_145310 ) ) ( not ( = ?auto_145306 ?auto_145311 ) ) ( not ( = ?auto_145307 ?auto_145308 ) ) ( not ( = ?auto_145307 ?auto_145309 ) ) ( not ( = ?auto_145307 ?auto_145310 ) ) ( not ( = ?auto_145307 ?auto_145311 ) ) ( not ( = ?auto_145308 ?auto_145309 ) ) ( not ( = ?auto_145308 ?auto_145310 ) ) ( not ( = ?auto_145308 ?auto_145311 ) ) ( not ( = ?auto_145309 ?auto_145310 ) ) ( not ( = ?auto_145309 ?auto_145311 ) ) ( not ( = ?auto_145310 ?auto_145311 ) ) ( ON-TABLE ?auto_145311 ) ( ON ?auto_145310 ?auto_145311 ) ( ON ?auto_145309 ?auto_145310 ) ( ON ?auto_145308 ?auto_145309 ) ( ON ?auto_145307 ?auto_145308 ) ( CLEAR ?auto_145307 ) ( HOLDING ?auto_145306 ) ( CLEAR ?auto_145305 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_145304 ?auto_145305 ?auto_145306 )
      ( MAKE-8PILE ?auto_145304 ?auto_145305 ?auto_145306 ?auto_145307 ?auto_145308 ?auto_145309 ?auto_145310 ?auto_145311 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_145312 - BLOCK
      ?auto_145313 - BLOCK
      ?auto_145314 - BLOCK
      ?auto_145315 - BLOCK
      ?auto_145316 - BLOCK
      ?auto_145317 - BLOCK
      ?auto_145318 - BLOCK
      ?auto_145319 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145312 ) ( ON ?auto_145313 ?auto_145312 ) ( not ( = ?auto_145312 ?auto_145313 ) ) ( not ( = ?auto_145312 ?auto_145314 ) ) ( not ( = ?auto_145312 ?auto_145315 ) ) ( not ( = ?auto_145312 ?auto_145316 ) ) ( not ( = ?auto_145312 ?auto_145317 ) ) ( not ( = ?auto_145312 ?auto_145318 ) ) ( not ( = ?auto_145312 ?auto_145319 ) ) ( not ( = ?auto_145313 ?auto_145314 ) ) ( not ( = ?auto_145313 ?auto_145315 ) ) ( not ( = ?auto_145313 ?auto_145316 ) ) ( not ( = ?auto_145313 ?auto_145317 ) ) ( not ( = ?auto_145313 ?auto_145318 ) ) ( not ( = ?auto_145313 ?auto_145319 ) ) ( not ( = ?auto_145314 ?auto_145315 ) ) ( not ( = ?auto_145314 ?auto_145316 ) ) ( not ( = ?auto_145314 ?auto_145317 ) ) ( not ( = ?auto_145314 ?auto_145318 ) ) ( not ( = ?auto_145314 ?auto_145319 ) ) ( not ( = ?auto_145315 ?auto_145316 ) ) ( not ( = ?auto_145315 ?auto_145317 ) ) ( not ( = ?auto_145315 ?auto_145318 ) ) ( not ( = ?auto_145315 ?auto_145319 ) ) ( not ( = ?auto_145316 ?auto_145317 ) ) ( not ( = ?auto_145316 ?auto_145318 ) ) ( not ( = ?auto_145316 ?auto_145319 ) ) ( not ( = ?auto_145317 ?auto_145318 ) ) ( not ( = ?auto_145317 ?auto_145319 ) ) ( not ( = ?auto_145318 ?auto_145319 ) ) ( ON-TABLE ?auto_145319 ) ( ON ?auto_145318 ?auto_145319 ) ( ON ?auto_145317 ?auto_145318 ) ( ON ?auto_145316 ?auto_145317 ) ( ON ?auto_145315 ?auto_145316 ) ( CLEAR ?auto_145313 ) ( ON ?auto_145314 ?auto_145315 ) ( CLEAR ?auto_145314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_145319 ?auto_145318 ?auto_145317 ?auto_145316 ?auto_145315 )
      ( MAKE-8PILE ?auto_145312 ?auto_145313 ?auto_145314 ?auto_145315 ?auto_145316 ?auto_145317 ?auto_145318 ?auto_145319 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_145320 - BLOCK
      ?auto_145321 - BLOCK
      ?auto_145322 - BLOCK
      ?auto_145323 - BLOCK
      ?auto_145324 - BLOCK
      ?auto_145325 - BLOCK
      ?auto_145326 - BLOCK
      ?auto_145327 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145320 ) ( not ( = ?auto_145320 ?auto_145321 ) ) ( not ( = ?auto_145320 ?auto_145322 ) ) ( not ( = ?auto_145320 ?auto_145323 ) ) ( not ( = ?auto_145320 ?auto_145324 ) ) ( not ( = ?auto_145320 ?auto_145325 ) ) ( not ( = ?auto_145320 ?auto_145326 ) ) ( not ( = ?auto_145320 ?auto_145327 ) ) ( not ( = ?auto_145321 ?auto_145322 ) ) ( not ( = ?auto_145321 ?auto_145323 ) ) ( not ( = ?auto_145321 ?auto_145324 ) ) ( not ( = ?auto_145321 ?auto_145325 ) ) ( not ( = ?auto_145321 ?auto_145326 ) ) ( not ( = ?auto_145321 ?auto_145327 ) ) ( not ( = ?auto_145322 ?auto_145323 ) ) ( not ( = ?auto_145322 ?auto_145324 ) ) ( not ( = ?auto_145322 ?auto_145325 ) ) ( not ( = ?auto_145322 ?auto_145326 ) ) ( not ( = ?auto_145322 ?auto_145327 ) ) ( not ( = ?auto_145323 ?auto_145324 ) ) ( not ( = ?auto_145323 ?auto_145325 ) ) ( not ( = ?auto_145323 ?auto_145326 ) ) ( not ( = ?auto_145323 ?auto_145327 ) ) ( not ( = ?auto_145324 ?auto_145325 ) ) ( not ( = ?auto_145324 ?auto_145326 ) ) ( not ( = ?auto_145324 ?auto_145327 ) ) ( not ( = ?auto_145325 ?auto_145326 ) ) ( not ( = ?auto_145325 ?auto_145327 ) ) ( not ( = ?auto_145326 ?auto_145327 ) ) ( ON-TABLE ?auto_145327 ) ( ON ?auto_145326 ?auto_145327 ) ( ON ?auto_145325 ?auto_145326 ) ( ON ?auto_145324 ?auto_145325 ) ( ON ?auto_145323 ?auto_145324 ) ( ON ?auto_145322 ?auto_145323 ) ( CLEAR ?auto_145322 ) ( HOLDING ?auto_145321 ) ( CLEAR ?auto_145320 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_145320 ?auto_145321 )
      ( MAKE-8PILE ?auto_145320 ?auto_145321 ?auto_145322 ?auto_145323 ?auto_145324 ?auto_145325 ?auto_145326 ?auto_145327 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_145328 - BLOCK
      ?auto_145329 - BLOCK
      ?auto_145330 - BLOCK
      ?auto_145331 - BLOCK
      ?auto_145332 - BLOCK
      ?auto_145333 - BLOCK
      ?auto_145334 - BLOCK
      ?auto_145335 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145328 ) ( not ( = ?auto_145328 ?auto_145329 ) ) ( not ( = ?auto_145328 ?auto_145330 ) ) ( not ( = ?auto_145328 ?auto_145331 ) ) ( not ( = ?auto_145328 ?auto_145332 ) ) ( not ( = ?auto_145328 ?auto_145333 ) ) ( not ( = ?auto_145328 ?auto_145334 ) ) ( not ( = ?auto_145328 ?auto_145335 ) ) ( not ( = ?auto_145329 ?auto_145330 ) ) ( not ( = ?auto_145329 ?auto_145331 ) ) ( not ( = ?auto_145329 ?auto_145332 ) ) ( not ( = ?auto_145329 ?auto_145333 ) ) ( not ( = ?auto_145329 ?auto_145334 ) ) ( not ( = ?auto_145329 ?auto_145335 ) ) ( not ( = ?auto_145330 ?auto_145331 ) ) ( not ( = ?auto_145330 ?auto_145332 ) ) ( not ( = ?auto_145330 ?auto_145333 ) ) ( not ( = ?auto_145330 ?auto_145334 ) ) ( not ( = ?auto_145330 ?auto_145335 ) ) ( not ( = ?auto_145331 ?auto_145332 ) ) ( not ( = ?auto_145331 ?auto_145333 ) ) ( not ( = ?auto_145331 ?auto_145334 ) ) ( not ( = ?auto_145331 ?auto_145335 ) ) ( not ( = ?auto_145332 ?auto_145333 ) ) ( not ( = ?auto_145332 ?auto_145334 ) ) ( not ( = ?auto_145332 ?auto_145335 ) ) ( not ( = ?auto_145333 ?auto_145334 ) ) ( not ( = ?auto_145333 ?auto_145335 ) ) ( not ( = ?auto_145334 ?auto_145335 ) ) ( ON-TABLE ?auto_145335 ) ( ON ?auto_145334 ?auto_145335 ) ( ON ?auto_145333 ?auto_145334 ) ( ON ?auto_145332 ?auto_145333 ) ( ON ?auto_145331 ?auto_145332 ) ( ON ?auto_145330 ?auto_145331 ) ( CLEAR ?auto_145328 ) ( ON ?auto_145329 ?auto_145330 ) ( CLEAR ?auto_145329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_145335 ?auto_145334 ?auto_145333 ?auto_145332 ?auto_145331 ?auto_145330 )
      ( MAKE-8PILE ?auto_145328 ?auto_145329 ?auto_145330 ?auto_145331 ?auto_145332 ?auto_145333 ?auto_145334 ?auto_145335 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_145336 - BLOCK
      ?auto_145337 - BLOCK
      ?auto_145338 - BLOCK
      ?auto_145339 - BLOCK
      ?auto_145340 - BLOCK
      ?auto_145341 - BLOCK
      ?auto_145342 - BLOCK
      ?auto_145343 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145336 ?auto_145337 ) ) ( not ( = ?auto_145336 ?auto_145338 ) ) ( not ( = ?auto_145336 ?auto_145339 ) ) ( not ( = ?auto_145336 ?auto_145340 ) ) ( not ( = ?auto_145336 ?auto_145341 ) ) ( not ( = ?auto_145336 ?auto_145342 ) ) ( not ( = ?auto_145336 ?auto_145343 ) ) ( not ( = ?auto_145337 ?auto_145338 ) ) ( not ( = ?auto_145337 ?auto_145339 ) ) ( not ( = ?auto_145337 ?auto_145340 ) ) ( not ( = ?auto_145337 ?auto_145341 ) ) ( not ( = ?auto_145337 ?auto_145342 ) ) ( not ( = ?auto_145337 ?auto_145343 ) ) ( not ( = ?auto_145338 ?auto_145339 ) ) ( not ( = ?auto_145338 ?auto_145340 ) ) ( not ( = ?auto_145338 ?auto_145341 ) ) ( not ( = ?auto_145338 ?auto_145342 ) ) ( not ( = ?auto_145338 ?auto_145343 ) ) ( not ( = ?auto_145339 ?auto_145340 ) ) ( not ( = ?auto_145339 ?auto_145341 ) ) ( not ( = ?auto_145339 ?auto_145342 ) ) ( not ( = ?auto_145339 ?auto_145343 ) ) ( not ( = ?auto_145340 ?auto_145341 ) ) ( not ( = ?auto_145340 ?auto_145342 ) ) ( not ( = ?auto_145340 ?auto_145343 ) ) ( not ( = ?auto_145341 ?auto_145342 ) ) ( not ( = ?auto_145341 ?auto_145343 ) ) ( not ( = ?auto_145342 ?auto_145343 ) ) ( ON-TABLE ?auto_145343 ) ( ON ?auto_145342 ?auto_145343 ) ( ON ?auto_145341 ?auto_145342 ) ( ON ?auto_145340 ?auto_145341 ) ( ON ?auto_145339 ?auto_145340 ) ( ON ?auto_145338 ?auto_145339 ) ( ON ?auto_145337 ?auto_145338 ) ( CLEAR ?auto_145337 ) ( HOLDING ?auto_145336 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_145336 )
      ( MAKE-8PILE ?auto_145336 ?auto_145337 ?auto_145338 ?auto_145339 ?auto_145340 ?auto_145341 ?auto_145342 ?auto_145343 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_145344 - BLOCK
      ?auto_145345 - BLOCK
      ?auto_145346 - BLOCK
      ?auto_145347 - BLOCK
      ?auto_145348 - BLOCK
      ?auto_145349 - BLOCK
      ?auto_145350 - BLOCK
      ?auto_145351 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145344 ?auto_145345 ) ) ( not ( = ?auto_145344 ?auto_145346 ) ) ( not ( = ?auto_145344 ?auto_145347 ) ) ( not ( = ?auto_145344 ?auto_145348 ) ) ( not ( = ?auto_145344 ?auto_145349 ) ) ( not ( = ?auto_145344 ?auto_145350 ) ) ( not ( = ?auto_145344 ?auto_145351 ) ) ( not ( = ?auto_145345 ?auto_145346 ) ) ( not ( = ?auto_145345 ?auto_145347 ) ) ( not ( = ?auto_145345 ?auto_145348 ) ) ( not ( = ?auto_145345 ?auto_145349 ) ) ( not ( = ?auto_145345 ?auto_145350 ) ) ( not ( = ?auto_145345 ?auto_145351 ) ) ( not ( = ?auto_145346 ?auto_145347 ) ) ( not ( = ?auto_145346 ?auto_145348 ) ) ( not ( = ?auto_145346 ?auto_145349 ) ) ( not ( = ?auto_145346 ?auto_145350 ) ) ( not ( = ?auto_145346 ?auto_145351 ) ) ( not ( = ?auto_145347 ?auto_145348 ) ) ( not ( = ?auto_145347 ?auto_145349 ) ) ( not ( = ?auto_145347 ?auto_145350 ) ) ( not ( = ?auto_145347 ?auto_145351 ) ) ( not ( = ?auto_145348 ?auto_145349 ) ) ( not ( = ?auto_145348 ?auto_145350 ) ) ( not ( = ?auto_145348 ?auto_145351 ) ) ( not ( = ?auto_145349 ?auto_145350 ) ) ( not ( = ?auto_145349 ?auto_145351 ) ) ( not ( = ?auto_145350 ?auto_145351 ) ) ( ON-TABLE ?auto_145351 ) ( ON ?auto_145350 ?auto_145351 ) ( ON ?auto_145349 ?auto_145350 ) ( ON ?auto_145348 ?auto_145349 ) ( ON ?auto_145347 ?auto_145348 ) ( ON ?auto_145346 ?auto_145347 ) ( ON ?auto_145345 ?auto_145346 ) ( ON ?auto_145344 ?auto_145345 ) ( CLEAR ?auto_145344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_145351 ?auto_145350 ?auto_145349 ?auto_145348 ?auto_145347 ?auto_145346 ?auto_145345 )
      ( MAKE-8PILE ?auto_145344 ?auto_145345 ?auto_145346 ?auto_145347 ?auto_145348 ?auto_145349 ?auto_145350 ?auto_145351 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_145352 - BLOCK
      ?auto_145353 - BLOCK
      ?auto_145354 - BLOCK
      ?auto_145355 - BLOCK
      ?auto_145356 - BLOCK
      ?auto_145357 - BLOCK
      ?auto_145358 - BLOCK
      ?auto_145359 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145352 ?auto_145353 ) ) ( not ( = ?auto_145352 ?auto_145354 ) ) ( not ( = ?auto_145352 ?auto_145355 ) ) ( not ( = ?auto_145352 ?auto_145356 ) ) ( not ( = ?auto_145352 ?auto_145357 ) ) ( not ( = ?auto_145352 ?auto_145358 ) ) ( not ( = ?auto_145352 ?auto_145359 ) ) ( not ( = ?auto_145353 ?auto_145354 ) ) ( not ( = ?auto_145353 ?auto_145355 ) ) ( not ( = ?auto_145353 ?auto_145356 ) ) ( not ( = ?auto_145353 ?auto_145357 ) ) ( not ( = ?auto_145353 ?auto_145358 ) ) ( not ( = ?auto_145353 ?auto_145359 ) ) ( not ( = ?auto_145354 ?auto_145355 ) ) ( not ( = ?auto_145354 ?auto_145356 ) ) ( not ( = ?auto_145354 ?auto_145357 ) ) ( not ( = ?auto_145354 ?auto_145358 ) ) ( not ( = ?auto_145354 ?auto_145359 ) ) ( not ( = ?auto_145355 ?auto_145356 ) ) ( not ( = ?auto_145355 ?auto_145357 ) ) ( not ( = ?auto_145355 ?auto_145358 ) ) ( not ( = ?auto_145355 ?auto_145359 ) ) ( not ( = ?auto_145356 ?auto_145357 ) ) ( not ( = ?auto_145356 ?auto_145358 ) ) ( not ( = ?auto_145356 ?auto_145359 ) ) ( not ( = ?auto_145357 ?auto_145358 ) ) ( not ( = ?auto_145357 ?auto_145359 ) ) ( not ( = ?auto_145358 ?auto_145359 ) ) ( ON-TABLE ?auto_145359 ) ( ON ?auto_145358 ?auto_145359 ) ( ON ?auto_145357 ?auto_145358 ) ( ON ?auto_145356 ?auto_145357 ) ( ON ?auto_145355 ?auto_145356 ) ( ON ?auto_145354 ?auto_145355 ) ( ON ?auto_145353 ?auto_145354 ) ( HOLDING ?auto_145352 ) ( CLEAR ?auto_145353 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_145359 ?auto_145358 ?auto_145357 ?auto_145356 ?auto_145355 ?auto_145354 ?auto_145353 ?auto_145352 )
      ( MAKE-8PILE ?auto_145352 ?auto_145353 ?auto_145354 ?auto_145355 ?auto_145356 ?auto_145357 ?auto_145358 ?auto_145359 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_145360 - BLOCK
      ?auto_145361 - BLOCK
      ?auto_145362 - BLOCK
      ?auto_145363 - BLOCK
      ?auto_145364 - BLOCK
      ?auto_145365 - BLOCK
      ?auto_145366 - BLOCK
      ?auto_145367 - BLOCK
    )
    :vars
    (
      ?auto_145368 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145360 ?auto_145361 ) ) ( not ( = ?auto_145360 ?auto_145362 ) ) ( not ( = ?auto_145360 ?auto_145363 ) ) ( not ( = ?auto_145360 ?auto_145364 ) ) ( not ( = ?auto_145360 ?auto_145365 ) ) ( not ( = ?auto_145360 ?auto_145366 ) ) ( not ( = ?auto_145360 ?auto_145367 ) ) ( not ( = ?auto_145361 ?auto_145362 ) ) ( not ( = ?auto_145361 ?auto_145363 ) ) ( not ( = ?auto_145361 ?auto_145364 ) ) ( not ( = ?auto_145361 ?auto_145365 ) ) ( not ( = ?auto_145361 ?auto_145366 ) ) ( not ( = ?auto_145361 ?auto_145367 ) ) ( not ( = ?auto_145362 ?auto_145363 ) ) ( not ( = ?auto_145362 ?auto_145364 ) ) ( not ( = ?auto_145362 ?auto_145365 ) ) ( not ( = ?auto_145362 ?auto_145366 ) ) ( not ( = ?auto_145362 ?auto_145367 ) ) ( not ( = ?auto_145363 ?auto_145364 ) ) ( not ( = ?auto_145363 ?auto_145365 ) ) ( not ( = ?auto_145363 ?auto_145366 ) ) ( not ( = ?auto_145363 ?auto_145367 ) ) ( not ( = ?auto_145364 ?auto_145365 ) ) ( not ( = ?auto_145364 ?auto_145366 ) ) ( not ( = ?auto_145364 ?auto_145367 ) ) ( not ( = ?auto_145365 ?auto_145366 ) ) ( not ( = ?auto_145365 ?auto_145367 ) ) ( not ( = ?auto_145366 ?auto_145367 ) ) ( ON-TABLE ?auto_145367 ) ( ON ?auto_145366 ?auto_145367 ) ( ON ?auto_145365 ?auto_145366 ) ( ON ?auto_145364 ?auto_145365 ) ( ON ?auto_145363 ?auto_145364 ) ( ON ?auto_145362 ?auto_145363 ) ( ON ?auto_145361 ?auto_145362 ) ( CLEAR ?auto_145361 ) ( ON ?auto_145360 ?auto_145368 ) ( CLEAR ?auto_145360 ) ( HAND-EMPTY ) ( not ( = ?auto_145360 ?auto_145368 ) ) ( not ( = ?auto_145361 ?auto_145368 ) ) ( not ( = ?auto_145362 ?auto_145368 ) ) ( not ( = ?auto_145363 ?auto_145368 ) ) ( not ( = ?auto_145364 ?auto_145368 ) ) ( not ( = ?auto_145365 ?auto_145368 ) ) ( not ( = ?auto_145366 ?auto_145368 ) ) ( not ( = ?auto_145367 ?auto_145368 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_145360 ?auto_145368 )
      ( MAKE-8PILE ?auto_145360 ?auto_145361 ?auto_145362 ?auto_145363 ?auto_145364 ?auto_145365 ?auto_145366 ?auto_145367 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_145369 - BLOCK
      ?auto_145370 - BLOCK
      ?auto_145371 - BLOCK
      ?auto_145372 - BLOCK
      ?auto_145373 - BLOCK
      ?auto_145374 - BLOCK
      ?auto_145375 - BLOCK
      ?auto_145376 - BLOCK
    )
    :vars
    (
      ?auto_145377 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145369 ?auto_145370 ) ) ( not ( = ?auto_145369 ?auto_145371 ) ) ( not ( = ?auto_145369 ?auto_145372 ) ) ( not ( = ?auto_145369 ?auto_145373 ) ) ( not ( = ?auto_145369 ?auto_145374 ) ) ( not ( = ?auto_145369 ?auto_145375 ) ) ( not ( = ?auto_145369 ?auto_145376 ) ) ( not ( = ?auto_145370 ?auto_145371 ) ) ( not ( = ?auto_145370 ?auto_145372 ) ) ( not ( = ?auto_145370 ?auto_145373 ) ) ( not ( = ?auto_145370 ?auto_145374 ) ) ( not ( = ?auto_145370 ?auto_145375 ) ) ( not ( = ?auto_145370 ?auto_145376 ) ) ( not ( = ?auto_145371 ?auto_145372 ) ) ( not ( = ?auto_145371 ?auto_145373 ) ) ( not ( = ?auto_145371 ?auto_145374 ) ) ( not ( = ?auto_145371 ?auto_145375 ) ) ( not ( = ?auto_145371 ?auto_145376 ) ) ( not ( = ?auto_145372 ?auto_145373 ) ) ( not ( = ?auto_145372 ?auto_145374 ) ) ( not ( = ?auto_145372 ?auto_145375 ) ) ( not ( = ?auto_145372 ?auto_145376 ) ) ( not ( = ?auto_145373 ?auto_145374 ) ) ( not ( = ?auto_145373 ?auto_145375 ) ) ( not ( = ?auto_145373 ?auto_145376 ) ) ( not ( = ?auto_145374 ?auto_145375 ) ) ( not ( = ?auto_145374 ?auto_145376 ) ) ( not ( = ?auto_145375 ?auto_145376 ) ) ( ON-TABLE ?auto_145376 ) ( ON ?auto_145375 ?auto_145376 ) ( ON ?auto_145374 ?auto_145375 ) ( ON ?auto_145373 ?auto_145374 ) ( ON ?auto_145372 ?auto_145373 ) ( ON ?auto_145371 ?auto_145372 ) ( ON ?auto_145369 ?auto_145377 ) ( CLEAR ?auto_145369 ) ( not ( = ?auto_145369 ?auto_145377 ) ) ( not ( = ?auto_145370 ?auto_145377 ) ) ( not ( = ?auto_145371 ?auto_145377 ) ) ( not ( = ?auto_145372 ?auto_145377 ) ) ( not ( = ?auto_145373 ?auto_145377 ) ) ( not ( = ?auto_145374 ?auto_145377 ) ) ( not ( = ?auto_145375 ?auto_145377 ) ) ( not ( = ?auto_145376 ?auto_145377 ) ) ( HOLDING ?auto_145370 ) ( CLEAR ?auto_145371 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_145376 ?auto_145375 ?auto_145374 ?auto_145373 ?auto_145372 ?auto_145371 ?auto_145370 )
      ( MAKE-8PILE ?auto_145369 ?auto_145370 ?auto_145371 ?auto_145372 ?auto_145373 ?auto_145374 ?auto_145375 ?auto_145376 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_145378 - BLOCK
      ?auto_145379 - BLOCK
      ?auto_145380 - BLOCK
      ?auto_145381 - BLOCK
      ?auto_145382 - BLOCK
      ?auto_145383 - BLOCK
      ?auto_145384 - BLOCK
      ?auto_145385 - BLOCK
    )
    :vars
    (
      ?auto_145386 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145378 ?auto_145379 ) ) ( not ( = ?auto_145378 ?auto_145380 ) ) ( not ( = ?auto_145378 ?auto_145381 ) ) ( not ( = ?auto_145378 ?auto_145382 ) ) ( not ( = ?auto_145378 ?auto_145383 ) ) ( not ( = ?auto_145378 ?auto_145384 ) ) ( not ( = ?auto_145378 ?auto_145385 ) ) ( not ( = ?auto_145379 ?auto_145380 ) ) ( not ( = ?auto_145379 ?auto_145381 ) ) ( not ( = ?auto_145379 ?auto_145382 ) ) ( not ( = ?auto_145379 ?auto_145383 ) ) ( not ( = ?auto_145379 ?auto_145384 ) ) ( not ( = ?auto_145379 ?auto_145385 ) ) ( not ( = ?auto_145380 ?auto_145381 ) ) ( not ( = ?auto_145380 ?auto_145382 ) ) ( not ( = ?auto_145380 ?auto_145383 ) ) ( not ( = ?auto_145380 ?auto_145384 ) ) ( not ( = ?auto_145380 ?auto_145385 ) ) ( not ( = ?auto_145381 ?auto_145382 ) ) ( not ( = ?auto_145381 ?auto_145383 ) ) ( not ( = ?auto_145381 ?auto_145384 ) ) ( not ( = ?auto_145381 ?auto_145385 ) ) ( not ( = ?auto_145382 ?auto_145383 ) ) ( not ( = ?auto_145382 ?auto_145384 ) ) ( not ( = ?auto_145382 ?auto_145385 ) ) ( not ( = ?auto_145383 ?auto_145384 ) ) ( not ( = ?auto_145383 ?auto_145385 ) ) ( not ( = ?auto_145384 ?auto_145385 ) ) ( ON-TABLE ?auto_145385 ) ( ON ?auto_145384 ?auto_145385 ) ( ON ?auto_145383 ?auto_145384 ) ( ON ?auto_145382 ?auto_145383 ) ( ON ?auto_145381 ?auto_145382 ) ( ON ?auto_145380 ?auto_145381 ) ( ON ?auto_145378 ?auto_145386 ) ( not ( = ?auto_145378 ?auto_145386 ) ) ( not ( = ?auto_145379 ?auto_145386 ) ) ( not ( = ?auto_145380 ?auto_145386 ) ) ( not ( = ?auto_145381 ?auto_145386 ) ) ( not ( = ?auto_145382 ?auto_145386 ) ) ( not ( = ?auto_145383 ?auto_145386 ) ) ( not ( = ?auto_145384 ?auto_145386 ) ) ( not ( = ?auto_145385 ?auto_145386 ) ) ( CLEAR ?auto_145380 ) ( ON ?auto_145379 ?auto_145378 ) ( CLEAR ?auto_145379 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_145386 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_145386 ?auto_145378 )
      ( MAKE-8PILE ?auto_145378 ?auto_145379 ?auto_145380 ?auto_145381 ?auto_145382 ?auto_145383 ?auto_145384 ?auto_145385 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_145387 - BLOCK
      ?auto_145388 - BLOCK
      ?auto_145389 - BLOCK
      ?auto_145390 - BLOCK
      ?auto_145391 - BLOCK
      ?auto_145392 - BLOCK
      ?auto_145393 - BLOCK
      ?auto_145394 - BLOCK
    )
    :vars
    (
      ?auto_145395 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145387 ?auto_145388 ) ) ( not ( = ?auto_145387 ?auto_145389 ) ) ( not ( = ?auto_145387 ?auto_145390 ) ) ( not ( = ?auto_145387 ?auto_145391 ) ) ( not ( = ?auto_145387 ?auto_145392 ) ) ( not ( = ?auto_145387 ?auto_145393 ) ) ( not ( = ?auto_145387 ?auto_145394 ) ) ( not ( = ?auto_145388 ?auto_145389 ) ) ( not ( = ?auto_145388 ?auto_145390 ) ) ( not ( = ?auto_145388 ?auto_145391 ) ) ( not ( = ?auto_145388 ?auto_145392 ) ) ( not ( = ?auto_145388 ?auto_145393 ) ) ( not ( = ?auto_145388 ?auto_145394 ) ) ( not ( = ?auto_145389 ?auto_145390 ) ) ( not ( = ?auto_145389 ?auto_145391 ) ) ( not ( = ?auto_145389 ?auto_145392 ) ) ( not ( = ?auto_145389 ?auto_145393 ) ) ( not ( = ?auto_145389 ?auto_145394 ) ) ( not ( = ?auto_145390 ?auto_145391 ) ) ( not ( = ?auto_145390 ?auto_145392 ) ) ( not ( = ?auto_145390 ?auto_145393 ) ) ( not ( = ?auto_145390 ?auto_145394 ) ) ( not ( = ?auto_145391 ?auto_145392 ) ) ( not ( = ?auto_145391 ?auto_145393 ) ) ( not ( = ?auto_145391 ?auto_145394 ) ) ( not ( = ?auto_145392 ?auto_145393 ) ) ( not ( = ?auto_145392 ?auto_145394 ) ) ( not ( = ?auto_145393 ?auto_145394 ) ) ( ON-TABLE ?auto_145394 ) ( ON ?auto_145393 ?auto_145394 ) ( ON ?auto_145392 ?auto_145393 ) ( ON ?auto_145391 ?auto_145392 ) ( ON ?auto_145390 ?auto_145391 ) ( ON ?auto_145387 ?auto_145395 ) ( not ( = ?auto_145387 ?auto_145395 ) ) ( not ( = ?auto_145388 ?auto_145395 ) ) ( not ( = ?auto_145389 ?auto_145395 ) ) ( not ( = ?auto_145390 ?auto_145395 ) ) ( not ( = ?auto_145391 ?auto_145395 ) ) ( not ( = ?auto_145392 ?auto_145395 ) ) ( not ( = ?auto_145393 ?auto_145395 ) ) ( not ( = ?auto_145394 ?auto_145395 ) ) ( ON ?auto_145388 ?auto_145387 ) ( CLEAR ?auto_145388 ) ( ON-TABLE ?auto_145395 ) ( HOLDING ?auto_145389 ) ( CLEAR ?auto_145390 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_145394 ?auto_145393 ?auto_145392 ?auto_145391 ?auto_145390 ?auto_145389 )
      ( MAKE-8PILE ?auto_145387 ?auto_145388 ?auto_145389 ?auto_145390 ?auto_145391 ?auto_145392 ?auto_145393 ?auto_145394 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_145396 - BLOCK
      ?auto_145397 - BLOCK
      ?auto_145398 - BLOCK
      ?auto_145399 - BLOCK
      ?auto_145400 - BLOCK
      ?auto_145401 - BLOCK
      ?auto_145402 - BLOCK
      ?auto_145403 - BLOCK
    )
    :vars
    (
      ?auto_145404 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145396 ?auto_145397 ) ) ( not ( = ?auto_145396 ?auto_145398 ) ) ( not ( = ?auto_145396 ?auto_145399 ) ) ( not ( = ?auto_145396 ?auto_145400 ) ) ( not ( = ?auto_145396 ?auto_145401 ) ) ( not ( = ?auto_145396 ?auto_145402 ) ) ( not ( = ?auto_145396 ?auto_145403 ) ) ( not ( = ?auto_145397 ?auto_145398 ) ) ( not ( = ?auto_145397 ?auto_145399 ) ) ( not ( = ?auto_145397 ?auto_145400 ) ) ( not ( = ?auto_145397 ?auto_145401 ) ) ( not ( = ?auto_145397 ?auto_145402 ) ) ( not ( = ?auto_145397 ?auto_145403 ) ) ( not ( = ?auto_145398 ?auto_145399 ) ) ( not ( = ?auto_145398 ?auto_145400 ) ) ( not ( = ?auto_145398 ?auto_145401 ) ) ( not ( = ?auto_145398 ?auto_145402 ) ) ( not ( = ?auto_145398 ?auto_145403 ) ) ( not ( = ?auto_145399 ?auto_145400 ) ) ( not ( = ?auto_145399 ?auto_145401 ) ) ( not ( = ?auto_145399 ?auto_145402 ) ) ( not ( = ?auto_145399 ?auto_145403 ) ) ( not ( = ?auto_145400 ?auto_145401 ) ) ( not ( = ?auto_145400 ?auto_145402 ) ) ( not ( = ?auto_145400 ?auto_145403 ) ) ( not ( = ?auto_145401 ?auto_145402 ) ) ( not ( = ?auto_145401 ?auto_145403 ) ) ( not ( = ?auto_145402 ?auto_145403 ) ) ( ON-TABLE ?auto_145403 ) ( ON ?auto_145402 ?auto_145403 ) ( ON ?auto_145401 ?auto_145402 ) ( ON ?auto_145400 ?auto_145401 ) ( ON ?auto_145399 ?auto_145400 ) ( ON ?auto_145396 ?auto_145404 ) ( not ( = ?auto_145396 ?auto_145404 ) ) ( not ( = ?auto_145397 ?auto_145404 ) ) ( not ( = ?auto_145398 ?auto_145404 ) ) ( not ( = ?auto_145399 ?auto_145404 ) ) ( not ( = ?auto_145400 ?auto_145404 ) ) ( not ( = ?auto_145401 ?auto_145404 ) ) ( not ( = ?auto_145402 ?auto_145404 ) ) ( not ( = ?auto_145403 ?auto_145404 ) ) ( ON ?auto_145397 ?auto_145396 ) ( ON-TABLE ?auto_145404 ) ( CLEAR ?auto_145399 ) ( ON ?auto_145398 ?auto_145397 ) ( CLEAR ?auto_145398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_145404 ?auto_145396 ?auto_145397 )
      ( MAKE-8PILE ?auto_145396 ?auto_145397 ?auto_145398 ?auto_145399 ?auto_145400 ?auto_145401 ?auto_145402 ?auto_145403 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_145405 - BLOCK
      ?auto_145406 - BLOCK
      ?auto_145407 - BLOCK
      ?auto_145408 - BLOCK
      ?auto_145409 - BLOCK
      ?auto_145410 - BLOCK
      ?auto_145411 - BLOCK
      ?auto_145412 - BLOCK
    )
    :vars
    (
      ?auto_145413 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145405 ?auto_145406 ) ) ( not ( = ?auto_145405 ?auto_145407 ) ) ( not ( = ?auto_145405 ?auto_145408 ) ) ( not ( = ?auto_145405 ?auto_145409 ) ) ( not ( = ?auto_145405 ?auto_145410 ) ) ( not ( = ?auto_145405 ?auto_145411 ) ) ( not ( = ?auto_145405 ?auto_145412 ) ) ( not ( = ?auto_145406 ?auto_145407 ) ) ( not ( = ?auto_145406 ?auto_145408 ) ) ( not ( = ?auto_145406 ?auto_145409 ) ) ( not ( = ?auto_145406 ?auto_145410 ) ) ( not ( = ?auto_145406 ?auto_145411 ) ) ( not ( = ?auto_145406 ?auto_145412 ) ) ( not ( = ?auto_145407 ?auto_145408 ) ) ( not ( = ?auto_145407 ?auto_145409 ) ) ( not ( = ?auto_145407 ?auto_145410 ) ) ( not ( = ?auto_145407 ?auto_145411 ) ) ( not ( = ?auto_145407 ?auto_145412 ) ) ( not ( = ?auto_145408 ?auto_145409 ) ) ( not ( = ?auto_145408 ?auto_145410 ) ) ( not ( = ?auto_145408 ?auto_145411 ) ) ( not ( = ?auto_145408 ?auto_145412 ) ) ( not ( = ?auto_145409 ?auto_145410 ) ) ( not ( = ?auto_145409 ?auto_145411 ) ) ( not ( = ?auto_145409 ?auto_145412 ) ) ( not ( = ?auto_145410 ?auto_145411 ) ) ( not ( = ?auto_145410 ?auto_145412 ) ) ( not ( = ?auto_145411 ?auto_145412 ) ) ( ON-TABLE ?auto_145412 ) ( ON ?auto_145411 ?auto_145412 ) ( ON ?auto_145410 ?auto_145411 ) ( ON ?auto_145409 ?auto_145410 ) ( ON ?auto_145405 ?auto_145413 ) ( not ( = ?auto_145405 ?auto_145413 ) ) ( not ( = ?auto_145406 ?auto_145413 ) ) ( not ( = ?auto_145407 ?auto_145413 ) ) ( not ( = ?auto_145408 ?auto_145413 ) ) ( not ( = ?auto_145409 ?auto_145413 ) ) ( not ( = ?auto_145410 ?auto_145413 ) ) ( not ( = ?auto_145411 ?auto_145413 ) ) ( not ( = ?auto_145412 ?auto_145413 ) ) ( ON ?auto_145406 ?auto_145405 ) ( ON-TABLE ?auto_145413 ) ( ON ?auto_145407 ?auto_145406 ) ( CLEAR ?auto_145407 ) ( HOLDING ?auto_145408 ) ( CLEAR ?auto_145409 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_145412 ?auto_145411 ?auto_145410 ?auto_145409 ?auto_145408 )
      ( MAKE-8PILE ?auto_145405 ?auto_145406 ?auto_145407 ?auto_145408 ?auto_145409 ?auto_145410 ?auto_145411 ?auto_145412 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_145414 - BLOCK
      ?auto_145415 - BLOCK
      ?auto_145416 - BLOCK
      ?auto_145417 - BLOCK
      ?auto_145418 - BLOCK
      ?auto_145419 - BLOCK
      ?auto_145420 - BLOCK
      ?auto_145421 - BLOCK
    )
    :vars
    (
      ?auto_145422 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145414 ?auto_145415 ) ) ( not ( = ?auto_145414 ?auto_145416 ) ) ( not ( = ?auto_145414 ?auto_145417 ) ) ( not ( = ?auto_145414 ?auto_145418 ) ) ( not ( = ?auto_145414 ?auto_145419 ) ) ( not ( = ?auto_145414 ?auto_145420 ) ) ( not ( = ?auto_145414 ?auto_145421 ) ) ( not ( = ?auto_145415 ?auto_145416 ) ) ( not ( = ?auto_145415 ?auto_145417 ) ) ( not ( = ?auto_145415 ?auto_145418 ) ) ( not ( = ?auto_145415 ?auto_145419 ) ) ( not ( = ?auto_145415 ?auto_145420 ) ) ( not ( = ?auto_145415 ?auto_145421 ) ) ( not ( = ?auto_145416 ?auto_145417 ) ) ( not ( = ?auto_145416 ?auto_145418 ) ) ( not ( = ?auto_145416 ?auto_145419 ) ) ( not ( = ?auto_145416 ?auto_145420 ) ) ( not ( = ?auto_145416 ?auto_145421 ) ) ( not ( = ?auto_145417 ?auto_145418 ) ) ( not ( = ?auto_145417 ?auto_145419 ) ) ( not ( = ?auto_145417 ?auto_145420 ) ) ( not ( = ?auto_145417 ?auto_145421 ) ) ( not ( = ?auto_145418 ?auto_145419 ) ) ( not ( = ?auto_145418 ?auto_145420 ) ) ( not ( = ?auto_145418 ?auto_145421 ) ) ( not ( = ?auto_145419 ?auto_145420 ) ) ( not ( = ?auto_145419 ?auto_145421 ) ) ( not ( = ?auto_145420 ?auto_145421 ) ) ( ON-TABLE ?auto_145421 ) ( ON ?auto_145420 ?auto_145421 ) ( ON ?auto_145419 ?auto_145420 ) ( ON ?auto_145418 ?auto_145419 ) ( ON ?auto_145414 ?auto_145422 ) ( not ( = ?auto_145414 ?auto_145422 ) ) ( not ( = ?auto_145415 ?auto_145422 ) ) ( not ( = ?auto_145416 ?auto_145422 ) ) ( not ( = ?auto_145417 ?auto_145422 ) ) ( not ( = ?auto_145418 ?auto_145422 ) ) ( not ( = ?auto_145419 ?auto_145422 ) ) ( not ( = ?auto_145420 ?auto_145422 ) ) ( not ( = ?auto_145421 ?auto_145422 ) ) ( ON ?auto_145415 ?auto_145414 ) ( ON-TABLE ?auto_145422 ) ( ON ?auto_145416 ?auto_145415 ) ( CLEAR ?auto_145418 ) ( ON ?auto_145417 ?auto_145416 ) ( CLEAR ?auto_145417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_145422 ?auto_145414 ?auto_145415 ?auto_145416 )
      ( MAKE-8PILE ?auto_145414 ?auto_145415 ?auto_145416 ?auto_145417 ?auto_145418 ?auto_145419 ?auto_145420 ?auto_145421 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_145423 - BLOCK
      ?auto_145424 - BLOCK
      ?auto_145425 - BLOCK
      ?auto_145426 - BLOCK
      ?auto_145427 - BLOCK
      ?auto_145428 - BLOCK
      ?auto_145429 - BLOCK
      ?auto_145430 - BLOCK
    )
    :vars
    (
      ?auto_145431 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145423 ?auto_145424 ) ) ( not ( = ?auto_145423 ?auto_145425 ) ) ( not ( = ?auto_145423 ?auto_145426 ) ) ( not ( = ?auto_145423 ?auto_145427 ) ) ( not ( = ?auto_145423 ?auto_145428 ) ) ( not ( = ?auto_145423 ?auto_145429 ) ) ( not ( = ?auto_145423 ?auto_145430 ) ) ( not ( = ?auto_145424 ?auto_145425 ) ) ( not ( = ?auto_145424 ?auto_145426 ) ) ( not ( = ?auto_145424 ?auto_145427 ) ) ( not ( = ?auto_145424 ?auto_145428 ) ) ( not ( = ?auto_145424 ?auto_145429 ) ) ( not ( = ?auto_145424 ?auto_145430 ) ) ( not ( = ?auto_145425 ?auto_145426 ) ) ( not ( = ?auto_145425 ?auto_145427 ) ) ( not ( = ?auto_145425 ?auto_145428 ) ) ( not ( = ?auto_145425 ?auto_145429 ) ) ( not ( = ?auto_145425 ?auto_145430 ) ) ( not ( = ?auto_145426 ?auto_145427 ) ) ( not ( = ?auto_145426 ?auto_145428 ) ) ( not ( = ?auto_145426 ?auto_145429 ) ) ( not ( = ?auto_145426 ?auto_145430 ) ) ( not ( = ?auto_145427 ?auto_145428 ) ) ( not ( = ?auto_145427 ?auto_145429 ) ) ( not ( = ?auto_145427 ?auto_145430 ) ) ( not ( = ?auto_145428 ?auto_145429 ) ) ( not ( = ?auto_145428 ?auto_145430 ) ) ( not ( = ?auto_145429 ?auto_145430 ) ) ( ON-TABLE ?auto_145430 ) ( ON ?auto_145429 ?auto_145430 ) ( ON ?auto_145428 ?auto_145429 ) ( ON ?auto_145423 ?auto_145431 ) ( not ( = ?auto_145423 ?auto_145431 ) ) ( not ( = ?auto_145424 ?auto_145431 ) ) ( not ( = ?auto_145425 ?auto_145431 ) ) ( not ( = ?auto_145426 ?auto_145431 ) ) ( not ( = ?auto_145427 ?auto_145431 ) ) ( not ( = ?auto_145428 ?auto_145431 ) ) ( not ( = ?auto_145429 ?auto_145431 ) ) ( not ( = ?auto_145430 ?auto_145431 ) ) ( ON ?auto_145424 ?auto_145423 ) ( ON-TABLE ?auto_145431 ) ( ON ?auto_145425 ?auto_145424 ) ( ON ?auto_145426 ?auto_145425 ) ( CLEAR ?auto_145426 ) ( HOLDING ?auto_145427 ) ( CLEAR ?auto_145428 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_145430 ?auto_145429 ?auto_145428 ?auto_145427 )
      ( MAKE-8PILE ?auto_145423 ?auto_145424 ?auto_145425 ?auto_145426 ?auto_145427 ?auto_145428 ?auto_145429 ?auto_145430 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_145432 - BLOCK
      ?auto_145433 - BLOCK
      ?auto_145434 - BLOCK
      ?auto_145435 - BLOCK
      ?auto_145436 - BLOCK
      ?auto_145437 - BLOCK
      ?auto_145438 - BLOCK
      ?auto_145439 - BLOCK
    )
    :vars
    (
      ?auto_145440 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145432 ?auto_145433 ) ) ( not ( = ?auto_145432 ?auto_145434 ) ) ( not ( = ?auto_145432 ?auto_145435 ) ) ( not ( = ?auto_145432 ?auto_145436 ) ) ( not ( = ?auto_145432 ?auto_145437 ) ) ( not ( = ?auto_145432 ?auto_145438 ) ) ( not ( = ?auto_145432 ?auto_145439 ) ) ( not ( = ?auto_145433 ?auto_145434 ) ) ( not ( = ?auto_145433 ?auto_145435 ) ) ( not ( = ?auto_145433 ?auto_145436 ) ) ( not ( = ?auto_145433 ?auto_145437 ) ) ( not ( = ?auto_145433 ?auto_145438 ) ) ( not ( = ?auto_145433 ?auto_145439 ) ) ( not ( = ?auto_145434 ?auto_145435 ) ) ( not ( = ?auto_145434 ?auto_145436 ) ) ( not ( = ?auto_145434 ?auto_145437 ) ) ( not ( = ?auto_145434 ?auto_145438 ) ) ( not ( = ?auto_145434 ?auto_145439 ) ) ( not ( = ?auto_145435 ?auto_145436 ) ) ( not ( = ?auto_145435 ?auto_145437 ) ) ( not ( = ?auto_145435 ?auto_145438 ) ) ( not ( = ?auto_145435 ?auto_145439 ) ) ( not ( = ?auto_145436 ?auto_145437 ) ) ( not ( = ?auto_145436 ?auto_145438 ) ) ( not ( = ?auto_145436 ?auto_145439 ) ) ( not ( = ?auto_145437 ?auto_145438 ) ) ( not ( = ?auto_145437 ?auto_145439 ) ) ( not ( = ?auto_145438 ?auto_145439 ) ) ( ON-TABLE ?auto_145439 ) ( ON ?auto_145438 ?auto_145439 ) ( ON ?auto_145437 ?auto_145438 ) ( ON ?auto_145432 ?auto_145440 ) ( not ( = ?auto_145432 ?auto_145440 ) ) ( not ( = ?auto_145433 ?auto_145440 ) ) ( not ( = ?auto_145434 ?auto_145440 ) ) ( not ( = ?auto_145435 ?auto_145440 ) ) ( not ( = ?auto_145436 ?auto_145440 ) ) ( not ( = ?auto_145437 ?auto_145440 ) ) ( not ( = ?auto_145438 ?auto_145440 ) ) ( not ( = ?auto_145439 ?auto_145440 ) ) ( ON ?auto_145433 ?auto_145432 ) ( ON-TABLE ?auto_145440 ) ( ON ?auto_145434 ?auto_145433 ) ( ON ?auto_145435 ?auto_145434 ) ( CLEAR ?auto_145437 ) ( ON ?auto_145436 ?auto_145435 ) ( CLEAR ?auto_145436 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_145440 ?auto_145432 ?auto_145433 ?auto_145434 ?auto_145435 )
      ( MAKE-8PILE ?auto_145432 ?auto_145433 ?auto_145434 ?auto_145435 ?auto_145436 ?auto_145437 ?auto_145438 ?auto_145439 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_145441 - BLOCK
      ?auto_145442 - BLOCK
      ?auto_145443 - BLOCK
      ?auto_145444 - BLOCK
      ?auto_145445 - BLOCK
      ?auto_145446 - BLOCK
      ?auto_145447 - BLOCK
      ?auto_145448 - BLOCK
    )
    :vars
    (
      ?auto_145449 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145441 ?auto_145442 ) ) ( not ( = ?auto_145441 ?auto_145443 ) ) ( not ( = ?auto_145441 ?auto_145444 ) ) ( not ( = ?auto_145441 ?auto_145445 ) ) ( not ( = ?auto_145441 ?auto_145446 ) ) ( not ( = ?auto_145441 ?auto_145447 ) ) ( not ( = ?auto_145441 ?auto_145448 ) ) ( not ( = ?auto_145442 ?auto_145443 ) ) ( not ( = ?auto_145442 ?auto_145444 ) ) ( not ( = ?auto_145442 ?auto_145445 ) ) ( not ( = ?auto_145442 ?auto_145446 ) ) ( not ( = ?auto_145442 ?auto_145447 ) ) ( not ( = ?auto_145442 ?auto_145448 ) ) ( not ( = ?auto_145443 ?auto_145444 ) ) ( not ( = ?auto_145443 ?auto_145445 ) ) ( not ( = ?auto_145443 ?auto_145446 ) ) ( not ( = ?auto_145443 ?auto_145447 ) ) ( not ( = ?auto_145443 ?auto_145448 ) ) ( not ( = ?auto_145444 ?auto_145445 ) ) ( not ( = ?auto_145444 ?auto_145446 ) ) ( not ( = ?auto_145444 ?auto_145447 ) ) ( not ( = ?auto_145444 ?auto_145448 ) ) ( not ( = ?auto_145445 ?auto_145446 ) ) ( not ( = ?auto_145445 ?auto_145447 ) ) ( not ( = ?auto_145445 ?auto_145448 ) ) ( not ( = ?auto_145446 ?auto_145447 ) ) ( not ( = ?auto_145446 ?auto_145448 ) ) ( not ( = ?auto_145447 ?auto_145448 ) ) ( ON-TABLE ?auto_145448 ) ( ON ?auto_145447 ?auto_145448 ) ( ON ?auto_145441 ?auto_145449 ) ( not ( = ?auto_145441 ?auto_145449 ) ) ( not ( = ?auto_145442 ?auto_145449 ) ) ( not ( = ?auto_145443 ?auto_145449 ) ) ( not ( = ?auto_145444 ?auto_145449 ) ) ( not ( = ?auto_145445 ?auto_145449 ) ) ( not ( = ?auto_145446 ?auto_145449 ) ) ( not ( = ?auto_145447 ?auto_145449 ) ) ( not ( = ?auto_145448 ?auto_145449 ) ) ( ON ?auto_145442 ?auto_145441 ) ( ON-TABLE ?auto_145449 ) ( ON ?auto_145443 ?auto_145442 ) ( ON ?auto_145444 ?auto_145443 ) ( ON ?auto_145445 ?auto_145444 ) ( CLEAR ?auto_145445 ) ( HOLDING ?auto_145446 ) ( CLEAR ?auto_145447 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_145448 ?auto_145447 ?auto_145446 )
      ( MAKE-8PILE ?auto_145441 ?auto_145442 ?auto_145443 ?auto_145444 ?auto_145445 ?auto_145446 ?auto_145447 ?auto_145448 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_145450 - BLOCK
      ?auto_145451 - BLOCK
      ?auto_145452 - BLOCK
      ?auto_145453 - BLOCK
      ?auto_145454 - BLOCK
      ?auto_145455 - BLOCK
      ?auto_145456 - BLOCK
      ?auto_145457 - BLOCK
    )
    :vars
    (
      ?auto_145458 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145450 ?auto_145451 ) ) ( not ( = ?auto_145450 ?auto_145452 ) ) ( not ( = ?auto_145450 ?auto_145453 ) ) ( not ( = ?auto_145450 ?auto_145454 ) ) ( not ( = ?auto_145450 ?auto_145455 ) ) ( not ( = ?auto_145450 ?auto_145456 ) ) ( not ( = ?auto_145450 ?auto_145457 ) ) ( not ( = ?auto_145451 ?auto_145452 ) ) ( not ( = ?auto_145451 ?auto_145453 ) ) ( not ( = ?auto_145451 ?auto_145454 ) ) ( not ( = ?auto_145451 ?auto_145455 ) ) ( not ( = ?auto_145451 ?auto_145456 ) ) ( not ( = ?auto_145451 ?auto_145457 ) ) ( not ( = ?auto_145452 ?auto_145453 ) ) ( not ( = ?auto_145452 ?auto_145454 ) ) ( not ( = ?auto_145452 ?auto_145455 ) ) ( not ( = ?auto_145452 ?auto_145456 ) ) ( not ( = ?auto_145452 ?auto_145457 ) ) ( not ( = ?auto_145453 ?auto_145454 ) ) ( not ( = ?auto_145453 ?auto_145455 ) ) ( not ( = ?auto_145453 ?auto_145456 ) ) ( not ( = ?auto_145453 ?auto_145457 ) ) ( not ( = ?auto_145454 ?auto_145455 ) ) ( not ( = ?auto_145454 ?auto_145456 ) ) ( not ( = ?auto_145454 ?auto_145457 ) ) ( not ( = ?auto_145455 ?auto_145456 ) ) ( not ( = ?auto_145455 ?auto_145457 ) ) ( not ( = ?auto_145456 ?auto_145457 ) ) ( ON-TABLE ?auto_145457 ) ( ON ?auto_145456 ?auto_145457 ) ( ON ?auto_145450 ?auto_145458 ) ( not ( = ?auto_145450 ?auto_145458 ) ) ( not ( = ?auto_145451 ?auto_145458 ) ) ( not ( = ?auto_145452 ?auto_145458 ) ) ( not ( = ?auto_145453 ?auto_145458 ) ) ( not ( = ?auto_145454 ?auto_145458 ) ) ( not ( = ?auto_145455 ?auto_145458 ) ) ( not ( = ?auto_145456 ?auto_145458 ) ) ( not ( = ?auto_145457 ?auto_145458 ) ) ( ON ?auto_145451 ?auto_145450 ) ( ON-TABLE ?auto_145458 ) ( ON ?auto_145452 ?auto_145451 ) ( ON ?auto_145453 ?auto_145452 ) ( ON ?auto_145454 ?auto_145453 ) ( CLEAR ?auto_145456 ) ( ON ?auto_145455 ?auto_145454 ) ( CLEAR ?auto_145455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_145458 ?auto_145450 ?auto_145451 ?auto_145452 ?auto_145453 ?auto_145454 )
      ( MAKE-8PILE ?auto_145450 ?auto_145451 ?auto_145452 ?auto_145453 ?auto_145454 ?auto_145455 ?auto_145456 ?auto_145457 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_145459 - BLOCK
      ?auto_145460 - BLOCK
      ?auto_145461 - BLOCK
      ?auto_145462 - BLOCK
      ?auto_145463 - BLOCK
      ?auto_145464 - BLOCK
      ?auto_145465 - BLOCK
      ?auto_145466 - BLOCK
    )
    :vars
    (
      ?auto_145467 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145459 ?auto_145460 ) ) ( not ( = ?auto_145459 ?auto_145461 ) ) ( not ( = ?auto_145459 ?auto_145462 ) ) ( not ( = ?auto_145459 ?auto_145463 ) ) ( not ( = ?auto_145459 ?auto_145464 ) ) ( not ( = ?auto_145459 ?auto_145465 ) ) ( not ( = ?auto_145459 ?auto_145466 ) ) ( not ( = ?auto_145460 ?auto_145461 ) ) ( not ( = ?auto_145460 ?auto_145462 ) ) ( not ( = ?auto_145460 ?auto_145463 ) ) ( not ( = ?auto_145460 ?auto_145464 ) ) ( not ( = ?auto_145460 ?auto_145465 ) ) ( not ( = ?auto_145460 ?auto_145466 ) ) ( not ( = ?auto_145461 ?auto_145462 ) ) ( not ( = ?auto_145461 ?auto_145463 ) ) ( not ( = ?auto_145461 ?auto_145464 ) ) ( not ( = ?auto_145461 ?auto_145465 ) ) ( not ( = ?auto_145461 ?auto_145466 ) ) ( not ( = ?auto_145462 ?auto_145463 ) ) ( not ( = ?auto_145462 ?auto_145464 ) ) ( not ( = ?auto_145462 ?auto_145465 ) ) ( not ( = ?auto_145462 ?auto_145466 ) ) ( not ( = ?auto_145463 ?auto_145464 ) ) ( not ( = ?auto_145463 ?auto_145465 ) ) ( not ( = ?auto_145463 ?auto_145466 ) ) ( not ( = ?auto_145464 ?auto_145465 ) ) ( not ( = ?auto_145464 ?auto_145466 ) ) ( not ( = ?auto_145465 ?auto_145466 ) ) ( ON-TABLE ?auto_145466 ) ( ON ?auto_145459 ?auto_145467 ) ( not ( = ?auto_145459 ?auto_145467 ) ) ( not ( = ?auto_145460 ?auto_145467 ) ) ( not ( = ?auto_145461 ?auto_145467 ) ) ( not ( = ?auto_145462 ?auto_145467 ) ) ( not ( = ?auto_145463 ?auto_145467 ) ) ( not ( = ?auto_145464 ?auto_145467 ) ) ( not ( = ?auto_145465 ?auto_145467 ) ) ( not ( = ?auto_145466 ?auto_145467 ) ) ( ON ?auto_145460 ?auto_145459 ) ( ON-TABLE ?auto_145467 ) ( ON ?auto_145461 ?auto_145460 ) ( ON ?auto_145462 ?auto_145461 ) ( ON ?auto_145463 ?auto_145462 ) ( ON ?auto_145464 ?auto_145463 ) ( CLEAR ?auto_145464 ) ( HOLDING ?auto_145465 ) ( CLEAR ?auto_145466 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_145466 ?auto_145465 )
      ( MAKE-8PILE ?auto_145459 ?auto_145460 ?auto_145461 ?auto_145462 ?auto_145463 ?auto_145464 ?auto_145465 ?auto_145466 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_145468 - BLOCK
      ?auto_145469 - BLOCK
      ?auto_145470 - BLOCK
      ?auto_145471 - BLOCK
      ?auto_145472 - BLOCK
      ?auto_145473 - BLOCK
      ?auto_145474 - BLOCK
      ?auto_145475 - BLOCK
    )
    :vars
    (
      ?auto_145476 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145468 ?auto_145469 ) ) ( not ( = ?auto_145468 ?auto_145470 ) ) ( not ( = ?auto_145468 ?auto_145471 ) ) ( not ( = ?auto_145468 ?auto_145472 ) ) ( not ( = ?auto_145468 ?auto_145473 ) ) ( not ( = ?auto_145468 ?auto_145474 ) ) ( not ( = ?auto_145468 ?auto_145475 ) ) ( not ( = ?auto_145469 ?auto_145470 ) ) ( not ( = ?auto_145469 ?auto_145471 ) ) ( not ( = ?auto_145469 ?auto_145472 ) ) ( not ( = ?auto_145469 ?auto_145473 ) ) ( not ( = ?auto_145469 ?auto_145474 ) ) ( not ( = ?auto_145469 ?auto_145475 ) ) ( not ( = ?auto_145470 ?auto_145471 ) ) ( not ( = ?auto_145470 ?auto_145472 ) ) ( not ( = ?auto_145470 ?auto_145473 ) ) ( not ( = ?auto_145470 ?auto_145474 ) ) ( not ( = ?auto_145470 ?auto_145475 ) ) ( not ( = ?auto_145471 ?auto_145472 ) ) ( not ( = ?auto_145471 ?auto_145473 ) ) ( not ( = ?auto_145471 ?auto_145474 ) ) ( not ( = ?auto_145471 ?auto_145475 ) ) ( not ( = ?auto_145472 ?auto_145473 ) ) ( not ( = ?auto_145472 ?auto_145474 ) ) ( not ( = ?auto_145472 ?auto_145475 ) ) ( not ( = ?auto_145473 ?auto_145474 ) ) ( not ( = ?auto_145473 ?auto_145475 ) ) ( not ( = ?auto_145474 ?auto_145475 ) ) ( ON-TABLE ?auto_145475 ) ( ON ?auto_145468 ?auto_145476 ) ( not ( = ?auto_145468 ?auto_145476 ) ) ( not ( = ?auto_145469 ?auto_145476 ) ) ( not ( = ?auto_145470 ?auto_145476 ) ) ( not ( = ?auto_145471 ?auto_145476 ) ) ( not ( = ?auto_145472 ?auto_145476 ) ) ( not ( = ?auto_145473 ?auto_145476 ) ) ( not ( = ?auto_145474 ?auto_145476 ) ) ( not ( = ?auto_145475 ?auto_145476 ) ) ( ON ?auto_145469 ?auto_145468 ) ( ON-TABLE ?auto_145476 ) ( ON ?auto_145470 ?auto_145469 ) ( ON ?auto_145471 ?auto_145470 ) ( ON ?auto_145472 ?auto_145471 ) ( ON ?auto_145473 ?auto_145472 ) ( CLEAR ?auto_145475 ) ( ON ?auto_145474 ?auto_145473 ) ( CLEAR ?auto_145474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_145476 ?auto_145468 ?auto_145469 ?auto_145470 ?auto_145471 ?auto_145472 ?auto_145473 )
      ( MAKE-8PILE ?auto_145468 ?auto_145469 ?auto_145470 ?auto_145471 ?auto_145472 ?auto_145473 ?auto_145474 ?auto_145475 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_145477 - BLOCK
      ?auto_145478 - BLOCK
      ?auto_145479 - BLOCK
      ?auto_145480 - BLOCK
      ?auto_145481 - BLOCK
      ?auto_145482 - BLOCK
      ?auto_145483 - BLOCK
      ?auto_145484 - BLOCK
    )
    :vars
    (
      ?auto_145485 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145477 ?auto_145478 ) ) ( not ( = ?auto_145477 ?auto_145479 ) ) ( not ( = ?auto_145477 ?auto_145480 ) ) ( not ( = ?auto_145477 ?auto_145481 ) ) ( not ( = ?auto_145477 ?auto_145482 ) ) ( not ( = ?auto_145477 ?auto_145483 ) ) ( not ( = ?auto_145477 ?auto_145484 ) ) ( not ( = ?auto_145478 ?auto_145479 ) ) ( not ( = ?auto_145478 ?auto_145480 ) ) ( not ( = ?auto_145478 ?auto_145481 ) ) ( not ( = ?auto_145478 ?auto_145482 ) ) ( not ( = ?auto_145478 ?auto_145483 ) ) ( not ( = ?auto_145478 ?auto_145484 ) ) ( not ( = ?auto_145479 ?auto_145480 ) ) ( not ( = ?auto_145479 ?auto_145481 ) ) ( not ( = ?auto_145479 ?auto_145482 ) ) ( not ( = ?auto_145479 ?auto_145483 ) ) ( not ( = ?auto_145479 ?auto_145484 ) ) ( not ( = ?auto_145480 ?auto_145481 ) ) ( not ( = ?auto_145480 ?auto_145482 ) ) ( not ( = ?auto_145480 ?auto_145483 ) ) ( not ( = ?auto_145480 ?auto_145484 ) ) ( not ( = ?auto_145481 ?auto_145482 ) ) ( not ( = ?auto_145481 ?auto_145483 ) ) ( not ( = ?auto_145481 ?auto_145484 ) ) ( not ( = ?auto_145482 ?auto_145483 ) ) ( not ( = ?auto_145482 ?auto_145484 ) ) ( not ( = ?auto_145483 ?auto_145484 ) ) ( ON ?auto_145477 ?auto_145485 ) ( not ( = ?auto_145477 ?auto_145485 ) ) ( not ( = ?auto_145478 ?auto_145485 ) ) ( not ( = ?auto_145479 ?auto_145485 ) ) ( not ( = ?auto_145480 ?auto_145485 ) ) ( not ( = ?auto_145481 ?auto_145485 ) ) ( not ( = ?auto_145482 ?auto_145485 ) ) ( not ( = ?auto_145483 ?auto_145485 ) ) ( not ( = ?auto_145484 ?auto_145485 ) ) ( ON ?auto_145478 ?auto_145477 ) ( ON-TABLE ?auto_145485 ) ( ON ?auto_145479 ?auto_145478 ) ( ON ?auto_145480 ?auto_145479 ) ( ON ?auto_145481 ?auto_145480 ) ( ON ?auto_145482 ?auto_145481 ) ( ON ?auto_145483 ?auto_145482 ) ( CLEAR ?auto_145483 ) ( HOLDING ?auto_145484 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_145484 )
      ( MAKE-8PILE ?auto_145477 ?auto_145478 ?auto_145479 ?auto_145480 ?auto_145481 ?auto_145482 ?auto_145483 ?auto_145484 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_145486 - BLOCK
      ?auto_145487 - BLOCK
      ?auto_145488 - BLOCK
      ?auto_145489 - BLOCK
      ?auto_145490 - BLOCK
      ?auto_145491 - BLOCK
      ?auto_145492 - BLOCK
      ?auto_145493 - BLOCK
    )
    :vars
    (
      ?auto_145494 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145486 ?auto_145487 ) ) ( not ( = ?auto_145486 ?auto_145488 ) ) ( not ( = ?auto_145486 ?auto_145489 ) ) ( not ( = ?auto_145486 ?auto_145490 ) ) ( not ( = ?auto_145486 ?auto_145491 ) ) ( not ( = ?auto_145486 ?auto_145492 ) ) ( not ( = ?auto_145486 ?auto_145493 ) ) ( not ( = ?auto_145487 ?auto_145488 ) ) ( not ( = ?auto_145487 ?auto_145489 ) ) ( not ( = ?auto_145487 ?auto_145490 ) ) ( not ( = ?auto_145487 ?auto_145491 ) ) ( not ( = ?auto_145487 ?auto_145492 ) ) ( not ( = ?auto_145487 ?auto_145493 ) ) ( not ( = ?auto_145488 ?auto_145489 ) ) ( not ( = ?auto_145488 ?auto_145490 ) ) ( not ( = ?auto_145488 ?auto_145491 ) ) ( not ( = ?auto_145488 ?auto_145492 ) ) ( not ( = ?auto_145488 ?auto_145493 ) ) ( not ( = ?auto_145489 ?auto_145490 ) ) ( not ( = ?auto_145489 ?auto_145491 ) ) ( not ( = ?auto_145489 ?auto_145492 ) ) ( not ( = ?auto_145489 ?auto_145493 ) ) ( not ( = ?auto_145490 ?auto_145491 ) ) ( not ( = ?auto_145490 ?auto_145492 ) ) ( not ( = ?auto_145490 ?auto_145493 ) ) ( not ( = ?auto_145491 ?auto_145492 ) ) ( not ( = ?auto_145491 ?auto_145493 ) ) ( not ( = ?auto_145492 ?auto_145493 ) ) ( ON ?auto_145486 ?auto_145494 ) ( not ( = ?auto_145486 ?auto_145494 ) ) ( not ( = ?auto_145487 ?auto_145494 ) ) ( not ( = ?auto_145488 ?auto_145494 ) ) ( not ( = ?auto_145489 ?auto_145494 ) ) ( not ( = ?auto_145490 ?auto_145494 ) ) ( not ( = ?auto_145491 ?auto_145494 ) ) ( not ( = ?auto_145492 ?auto_145494 ) ) ( not ( = ?auto_145493 ?auto_145494 ) ) ( ON ?auto_145487 ?auto_145486 ) ( ON-TABLE ?auto_145494 ) ( ON ?auto_145488 ?auto_145487 ) ( ON ?auto_145489 ?auto_145488 ) ( ON ?auto_145490 ?auto_145489 ) ( ON ?auto_145491 ?auto_145490 ) ( ON ?auto_145492 ?auto_145491 ) ( ON ?auto_145493 ?auto_145492 ) ( CLEAR ?auto_145493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_145494 ?auto_145486 ?auto_145487 ?auto_145488 ?auto_145489 ?auto_145490 ?auto_145491 ?auto_145492 )
      ( MAKE-8PILE ?auto_145486 ?auto_145487 ?auto_145488 ?auto_145489 ?auto_145490 ?auto_145491 ?auto_145492 ?auto_145493 ) )
  )

)

