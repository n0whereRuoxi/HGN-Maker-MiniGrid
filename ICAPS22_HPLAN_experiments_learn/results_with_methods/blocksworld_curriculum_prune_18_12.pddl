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

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_845245 - BLOCK
    )
    :vars
    (
      ?auto_845246 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_845245 ?auto_845246 ) ( CLEAR ?auto_845245 ) ( HAND-EMPTY ) ( not ( = ?auto_845245 ?auto_845246 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_845245 ?auto_845246 )
      ( !PUTDOWN ?auto_845245 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_845252 - BLOCK
      ?auto_845253 - BLOCK
    )
    :vars
    (
      ?auto_845254 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_845252 ) ( ON ?auto_845253 ?auto_845254 ) ( CLEAR ?auto_845253 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_845252 ) ( not ( = ?auto_845252 ?auto_845253 ) ) ( not ( = ?auto_845252 ?auto_845254 ) ) ( not ( = ?auto_845253 ?auto_845254 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_845253 ?auto_845254 )
      ( !STACK ?auto_845253 ?auto_845252 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_845262 - BLOCK
      ?auto_845263 - BLOCK
    )
    :vars
    (
      ?auto_845264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_845263 ?auto_845264 ) ( not ( = ?auto_845262 ?auto_845263 ) ) ( not ( = ?auto_845262 ?auto_845264 ) ) ( not ( = ?auto_845263 ?auto_845264 ) ) ( ON ?auto_845262 ?auto_845263 ) ( CLEAR ?auto_845262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_845262 )
      ( MAKE-2PILE ?auto_845262 ?auto_845263 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_845273 - BLOCK
      ?auto_845274 - BLOCK
      ?auto_845275 - BLOCK
    )
    :vars
    (
      ?auto_845276 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_845274 ) ( ON ?auto_845275 ?auto_845276 ) ( CLEAR ?auto_845275 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_845273 ) ( ON ?auto_845274 ?auto_845273 ) ( not ( = ?auto_845273 ?auto_845274 ) ) ( not ( = ?auto_845273 ?auto_845275 ) ) ( not ( = ?auto_845273 ?auto_845276 ) ) ( not ( = ?auto_845274 ?auto_845275 ) ) ( not ( = ?auto_845274 ?auto_845276 ) ) ( not ( = ?auto_845275 ?auto_845276 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_845275 ?auto_845276 )
      ( !STACK ?auto_845275 ?auto_845274 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_845287 - BLOCK
      ?auto_845288 - BLOCK
      ?auto_845289 - BLOCK
    )
    :vars
    (
      ?auto_845290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_845289 ?auto_845290 ) ( ON-TABLE ?auto_845287 ) ( not ( = ?auto_845287 ?auto_845288 ) ) ( not ( = ?auto_845287 ?auto_845289 ) ) ( not ( = ?auto_845287 ?auto_845290 ) ) ( not ( = ?auto_845288 ?auto_845289 ) ) ( not ( = ?auto_845288 ?auto_845290 ) ) ( not ( = ?auto_845289 ?auto_845290 ) ) ( CLEAR ?auto_845287 ) ( ON ?auto_845288 ?auto_845289 ) ( CLEAR ?auto_845288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_845287 ?auto_845288 )
      ( MAKE-3PILE ?auto_845287 ?auto_845288 ?auto_845289 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_845301 - BLOCK
      ?auto_845302 - BLOCK
      ?auto_845303 - BLOCK
    )
    :vars
    (
      ?auto_845304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_845303 ?auto_845304 ) ( not ( = ?auto_845301 ?auto_845302 ) ) ( not ( = ?auto_845301 ?auto_845303 ) ) ( not ( = ?auto_845301 ?auto_845304 ) ) ( not ( = ?auto_845302 ?auto_845303 ) ) ( not ( = ?auto_845302 ?auto_845304 ) ) ( not ( = ?auto_845303 ?auto_845304 ) ) ( ON ?auto_845302 ?auto_845303 ) ( ON ?auto_845301 ?auto_845302 ) ( CLEAR ?auto_845301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_845301 )
      ( MAKE-3PILE ?auto_845301 ?auto_845302 ?auto_845303 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_845316 - BLOCK
      ?auto_845317 - BLOCK
      ?auto_845318 - BLOCK
      ?auto_845319 - BLOCK
    )
    :vars
    (
      ?auto_845320 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_845318 ) ( ON ?auto_845319 ?auto_845320 ) ( CLEAR ?auto_845319 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_845316 ) ( ON ?auto_845317 ?auto_845316 ) ( ON ?auto_845318 ?auto_845317 ) ( not ( = ?auto_845316 ?auto_845317 ) ) ( not ( = ?auto_845316 ?auto_845318 ) ) ( not ( = ?auto_845316 ?auto_845319 ) ) ( not ( = ?auto_845316 ?auto_845320 ) ) ( not ( = ?auto_845317 ?auto_845318 ) ) ( not ( = ?auto_845317 ?auto_845319 ) ) ( not ( = ?auto_845317 ?auto_845320 ) ) ( not ( = ?auto_845318 ?auto_845319 ) ) ( not ( = ?auto_845318 ?auto_845320 ) ) ( not ( = ?auto_845319 ?auto_845320 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_845319 ?auto_845320 )
      ( !STACK ?auto_845319 ?auto_845318 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_845334 - BLOCK
      ?auto_845335 - BLOCK
      ?auto_845336 - BLOCK
      ?auto_845337 - BLOCK
    )
    :vars
    (
      ?auto_845338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_845337 ?auto_845338 ) ( ON-TABLE ?auto_845334 ) ( ON ?auto_845335 ?auto_845334 ) ( not ( = ?auto_845334 ?auto_845335 ) ) ( not ( = ?auto_845334 ?auto_845336 ) ) ( not ( = ?auto_845334 ?auto_845337 ) ) ( not ( = ?auto_845334 ?auto_845338 ) ) ( not ( = ?auto_845335 ?auto_845336 ) ) ( not ( = ?auto_845335 ?auto_845337 ) ) ( not ( = ?auto_845335 ?auto_845338 ) ) ( not ( = ?auto_845336 ?auto_845337 ) ) ( not ( = ?auto_845336 ?auto_845338 ) ) ( not ( = ?auto_845337 ?auto_845338 ) ) ( CLEAR ?auto_845335 ) ( ON ?auto_845336 ?auto_845337 ) ( CLEAR ?auto_845336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_845334 ?auto_845335 ?auto_845336 )
      ( MAKE-4PILE ?auto_845334 ?auto_845335 ?auto_845336 ?auto_845337 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_845352 - BLOCK
      ?auto_845353 - BLOCK
      ?auto_845354 - BLOCK
      ?auto_845355 - BLOCK
    )
    :vars
    (
      ?auto_845356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_845355 ?auto_845356 ) ( ON-TABLE ?auto_845352 ) ( not ( = ?auto_845352 ?auto_845353 ) ) ( not ( = ?auto_845352 ?auto_845354 ) ) ( not ( = ?auto_845352 ?auto_845355 ) ) ( not ( = ?auto_845352 ?auto_845356 ) ) ( not ( = ?auto_845353 ?auto_845354 ) ) ( not ( = ?auto_845353 ?auto_845355 ) ) ( not ( = ?auto_845353 ?auto_845356 ) ) ( not ( = ?auto_845354 ?auto_845355 ) ) ( not ( = ?auto_845354 ?auto_845356 ) ) ( not ( = ?auto_845355 ?auto_845356 ) ) ( ON ?auto_845354 ?auto_845355 ) ( CLEAR ?auto_845352 ) ( ON ?auto_845353 ?auto_845354 ) ( CLEAR ?auto_845353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_845352 ?auto_845353 )
      ( MAKE-4PILE ?auto_845352 ?auto_845353 ?auto_845354 ?auto_845355 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_845370 - BLOCK
      ?auto_845371 - BLOCK
      ?auto_845372 - BLOCK
      ?auto_845373 - BLOCK
    )
    :vars
    (
      ?auto_845374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_845373 ?auto_845374 ) ( not ( = ?auto_845370 ?auto_845371 ) ) ( not ( = ?auto_845370 ?auto_845372 ) ) ( not ( = ?auto_845370 ?auto_845373 ) ) ( not ( = ?auto_845370 ?auto_845374 ) ) ( not ( = ?auto_845371 ?auto_845372 ) ) ( not ( = ?auto_845371 ?auto_845373 ) ) ( not ( = ?auto_845371 ?auto_845374 ) ) ( not ( = ?auto_845372 ?auto_845373 ) ) ( not ( = ?auto_845372 ?auto_845374 ) ) ( not ( = ?auto_845373 ?auto_845374 ) ) ( ON ?auto_845372 ?auto_845373 ) ( ON ?auto_845371 ?auto_845372 ) ( ON ?auto_845370 ?auto_845371 ) ( CLEAR ?auto_845370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_845370 )
      ( MAKE-4PILE ?auto_845370 ?auto_845371 ?auto_845372 ?auto_845373 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_845389 - BLOCK
      ?auto_845390 - BLOCK
      ?auto_845391 - BLOCK
      ?auto_845392 - BLOCK
      ?auto_845393 - BLOCK
    )
    :vars
    (
      ?auto_845394 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_845392 ) ( ON ?auto_845393 ?auto_845394 ) ( CLEAR ?auto_845393 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_845389 ) ( ON ?auto_845390 ?auto_845389 ) ( ON ?auto_845391 ?auto_845390 ) ( ON ?auto_845392 ?auto_845391 ) ( not ( = ?auto_845389 ?auto_845390 ) ) ( not ( = ?auto_845389 ?auto_845391 ) ) ( not ( = ?auto_845389 ?auto_845392 ) ) ( not ( = ?auto_845389 ?auto_845393 ) ) ( not ( = ?auto_845389 ?auto_845394 ) ) ( not ( = ?auto_845390 ?auto_845391 ) ) ( not ( = ?auto_845390 ?auto_845392 ) ) ( not ( = ?auto_845390 ?auto_845393 ) ) ( not ( = ?auto_845390 ?auto_845394 ) ) ( not ( = ?auto_845391 ?auto_845392 ) ) ( not ( = ?auto_845391 ?auto_845393 ) ) ( not ( = ?auto_845391 ?auto_845394 ) ) ( not ( = ?auto_845392 ?auto_845393 ) ) ( not ( = ?auto_845392 ?auto_845394 ) ) ( not ( = ?auto_845393 ?auto_845394 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_845393 ?auto_845394 )
      ( !STACK ?auto_845393 ?auto_845392 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_845411 - BLOCK
      ?auto_845412 - BLOCK
      ?auto_845413 - BLOCK
      ?auto_845414 - BLOCK
      ?auto_845415 - BLOCK
    )
    :vars
    (
      ?auto_845416 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_845415 ?auto_845416 ) ( ON-TABLE ?auto_845411 ) ( ON ?auto_845412 ?auto_845411 ) ( ON ?auto_845413 ?auto_845412 ) ( not ( = ?auto_845411 ?auto_845412 ) ) ( not ( = ?auto_845411 ?auto_845413 ) ) ( not ( = ?auto_845411 ?auto_845414 ) ) ( not ( = ?auto_845411 ?auto_845415 ) ) ( not ( = ?auto_845411 ?auto_845416 ) ) ( not ( = ?auto_845412 ?auto_845413 ) ) ( not ( = ?auto_845412 ?auto_845414 ) ) ( not ( = ?auto_845412 ?auto_845415 ) ) ( not ( = ?auto_845412 ?auto_845416 ) ) ( not ( = ?auto_845413 ?auto_845414 ) ) ( not ( = ?auto_845413 ?auto_845415 ) ) ( not ( = ?auto_845413 ?auto_845416 ) ) ( not ( = ?auto_845414 ?auto_845415 ) ) ( not ( = ?auto_845414 ?auto_845416 ) ) ( not ( = ?auto_845415 ?auto_845416 ) ) ( CLEAR ?auto_845413 ) ( ON ?auto_845414 ?auto_845415 ) ( CLEAR ?auto_845414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_845411 ?auto_845412 ?auto_845413 ?auto_845414 )
      ( MAKE-5PILE ?auto_845411 ?auto_845412 ?auto_845413 ?auto_845414 ?auto_845415 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_845433 - BLOCK
      ?auto_845434 - BLOCK
      ?auto_845435 - BLOCK
      ?auto_845436 - BLOCK
      ?auto_845437 - BLOCK
    )
    :vars
    (
      ?auto_845438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_845437 ?auto_845438 ) ( ON-TABLE ?auto_845433 ) ( ON ?auto_845434 ?auto_845433 ) ( not ( = ?auto_845433 ?auto_845434 ) ) ( not ( = ?auto_845433 ?auto_845435 ) ) ( not ( = ?auto_845433 ?auto_845436 ) ) ( not ( = ?auto_845433 ?auto_845437 ) ) ( not ( = ?auto_845433 ?auto_845438 ) ) ( not ( = ?auto_845434 ?auto_845435 ) ) ( not ( = ?auto_845434 ?auto_845436 ) ) ( not ( = ?auto_845434 ?auto_845437 ) ) ( not ( = ?auto_845434 ?auto_845438 ) ) ( not ( = ?auto_845435 ?auto_845436 ) ) ( not ( = ?auto_845435 ?auto_845437 ) ) ( not ( = ?auto_845435 ?auto_845438 ) ) ( not ( = ?auto_845436 ?auto_845437 ) ) ( not ( = ?auto_845436 ?auto_845438 ) ) ( not ( = ?auto_845437 ?auto_845438 ) ) ( ON ?auto_845436 ?auto_845437 ) ( CLEAR ?auto_845434 ) ( ON ?auto_845435 ?auto_845436 ) ( CLEAR ?auto_845435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_845433 ?auto_845434 ?auto_845435 )
      ( MAKE-5PILE ?auto_845433 ?auto_845434 ?auto_845435 ?auto_845436 ?auto_845437 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_845455 - BLOCK
      ?auto_845456 - BLOCK
      ?auto_845457 - BLOCK
      ?auto_845458 - BLOCK
      ?auto_845459 - BLOCK
    )
    :vars
    (
      ?auto_845460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_845459 ?auto_845460 ) ( ON-TABLE ?auto_845455 ) ( not ( = ?auto_845455 ?auto_845456 ) ) ( not ( = ?auto_845455 ?auto_845457 ) ) ( not ( = ?auto_845455 ?auto_845458 ) ) ( not ( = ?auto_845455 ?auto_845459 ) ) ( not ( = ?auto_845455 ?auto_845460 ) ) ( not ( = ?auto_845456 ?auto_845457 ) ) ( not ( = ?auto_845456 ?auto_845458 ) ) ( not ( = ?auto_845456 ?auto_845459 ) ) ( not ( = ?auto_845456 ?auto_845460 ) ) ( not ( = ?auto_845457 ?auto_845458 ) ) ( not ( = ?auto_845457 ?auto_845459 ) ) ( not ( = ?auto_845457 ?auto_845460 ) ) ( not ( = ?auto_845458 ?auto_845459 ) ) ( not ( = ?auto_845458 ?auto_845460 ) ) ( not ( = ?auto_845459 ?auto_845460 ) ) ( ON ?auto_845458 ?auto_845459 ) ( ON ?auto_845457 ?auto_845458 ) ( CLEAR ?auto_845455 ) ( ON ?auto_845456 ?auto_845457 ) ( CLEAR ?auto_845456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_845455 ?auto_845456 )
      ( MAKE-5PILE ?auto_845455 ?auto_845456 ?auto_845457 ?auto_845458 ?auto_845459 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_845477 - BLOCK
      ?auto_845478 - BLOCK
      ?auto_845479 - BLOCK
      ?auto_845480 - BLOCK
      ?auto_845481 - BLOCK
    )
    :vars
    (
      ?auto_845482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_845481 ?auto_845482 ) ( not ( = ?auto_845477 ?auto_845478 ) ) ( not ( = ?auto_845477 ?auto_845479 ) ) ( not ( = ?auto_845477 ?auto_845480 ) ) ( not ( = ?auto_845477 ?auto_845481 ) ) ( not ( = ?auto_845477 ?auto_845482 ) ) ( not ( = ?auto_845478 ?auto_845479 ) ) ( not ( = ?auto_845478 ?auto_845480 ) ) ( not ( = ?auto_845478 ?auto_845481 ) ) ( not ( = ?auto_845478 ?auto_845482 ) ) ( not ( = ?auto_845479 ?auto_845480 ) ) ( not ( = ?auto_845479 ?auto_845481 ) ) ( not ( = ?auto_845479 ?auto_845482 ) ) ( not ( = ?auto_845480 ?auto_845481 ) ) ( not ( = ?auto_845480 ?auto_845482 ) ) ( not ( = ?auto_845481 ?auto_845482 ) ) ( ON ?auto_845480 ?auto_845481 ) ( ON ?auto_845479 ?auto_845480 ) ( ON ?auto_845478 ?auto_845479 ) ( ON ?auto_845477 ?auto_845478 ) ( CLEAR ?auto_845477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_845477 )
      ( MAKE-5PILE ?auto_845477 ?auto_845478 ?auto_845479 ?auto_845480 ?auto_845481 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_845500 - BLOCK
      ?auto_845501 - BLOCK
      ?auto_845502 - BLOCK
      ?auto_845503 - BLOCK
      ?auto_845504 - BLOCK
      ?auto_845505 - BLOCK
    )
    :vars
    (
      ?auto_845506 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_845504 ) ( ON ?auto_845505 ?auto_845506 ) ( CLEAR ?auto_845505 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_845500 ) ( ON ?auto_845501 ?auto_845500 ) ( ON ?auto_845502 ?auto_845501 ) ( ON ?auto_845503 ?auto_845502 ) ( ON ?auto_845504 ?auto_845503 ) ( not ( = ?auto_845500 ?auto_845501 ) ) ( not ( = ?auto_845500 ?auto_845502 ) ) ( not ( = ?auto_845500 ?auto_845503 ) ) ( not ( = ?auto_845500 ?auto_845504 ) ) ( not ( = ?auto_845500 ?auto_845505 ) ) ( not ( = ?auto_845500 ?auto_845506 ) ) ( not ( = ?auto_845501 ?auto_845502 ) ) ( not ( = ?auto_845501 ?auto_845503 ) ) ( not ( = ?auto_845501 ?auto_845504 ) ) ( not ( = ?auto_845501 ?auto_845505 ) ) ( not ( = ?auto_845501 ?auto_845506 ) ) ( not ( = ?auto_845502 ?auto_845503 ) ) ( not ( = ?auto_845502 ?auto_845504 ) ) ( not ( = ?auto_845502 ?auto_845505 ) ) ( not ( = ?auto_845502 ?auto_845506 ) ) ( not ( = ?auto_845503 ?auto_845504 ) ) ( not ( = ?auto_845503 ?auto_845505 ) ) ( not ( = ?auto_845503 ?auto_845506 ) ) ( not ( = ?auto_845504 ?auto_845505 ) ) ( not ( = ?auto_845504 ?auto_845506 ) ) ( not ( = ?auto_845505 ?auto_845506 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_845505 ?auto_845506 )
      ( !STACK ?auto_845505 ?auto_845504 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_845526 - BLOCK
      ?auto_845527 - BLOCK
      ?auto_845528 - BLOCK
      ?auto_845529 - BLOCK
      ?auto_845530 - BLOCK
      ?auto_845531 - BLOCK
    )
    :vars
    (
      ?auto_845532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_845531 ?auto_845532 ) ( ON-TABLE ?auto_845526 ) ( ON ?auto_845527 ?auto_845526 ) ( ON ?auto_845528 ?auto_845527 ) ( ON ?auto_845529 ?auto_845528 ) ( not ( = ?auto_845526 ?auto_845527 ) ) ( not ( = ?auto_845526 ?auto_845528 ) ) ( not ( = ?auto_845526 ?auto_845529 ) ) ( not ( = ?auto_845526 ?auto_845530 ) ) ( not ( = ?auto_845526 ?auto_845531 ) ) ( not ( = ?auto_845526 ?auto_845532 ) ) ( not ( = ?auto_845527 ?auto_845528 ) ) ( not ( = ?auto_845527 ?auto_845529 ) ) ( not ( = ?auto_845527 ?auto_845530 ) ) ( not ( = ?auto_845527 ?auto_845531 ) ) ( not ( = ?auto_845527 ?auto_845532 ) ) ( not ( = ?auto_845528 ?auto_845529 ) ) ( not ( = ?auto_845528 ?auto_845530 ) ) ( not ( = ?auto_845528 ?auto_845531 ) ) ( not ( = ?auto_845528 ?auto_845532 ) ) ( not ( = ?auto_845529 ?auto_845530 ) ) ( not ( = ?auto_845529 ?auto_845531 ) ) ( not ( = ?auto_845529 ?auto_845532 ) ) ( not ( = ?auto_845530 ?auto_845531 ) ) ( not ( = ?auto_845530 ?auto_845532 ) ) ( not ( = ?auto_845531 ?auto_845532 ) ) ( CLEAR ?auto_845529 ) ( ON ?auto_845530 ?auto_845531 ) ( CLEAR ?auto_845530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_845526 ?auto_845527 ?auto_845528 ?auto_845529 ?auto_845530 )
      ( MAKE-6PILE ?auto_845526 ?auto_845527 ?auto_845528 ?auto_845529 ?auto_845530 ?auto_845531 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_845552 - BLOCK
      ?auto_845553 - BLOCK
      ?auto_845554 - BLOCK
      ?auto_845555 - BLOCK
      ?auto_845556 - BLOCK
      ?auto_845557 - BLOCK
    )
    :vars
    (
      ?auto_845558 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_845557 ?auto_845558 ) ( ON-TABLE ?auto_845552 ) ( ON ?auto_845553 ?auto_845552 ) ( ON ?auto_845554 ?auto_845553 ) ( not ( = ?auto_845552 ?auto_845553 ) ) ( not ( = ?auto_845552 ?auto_845554 ) ) ( not ( = ?auto_845552 ?auto_845555 ) ) ( not ( = ?auto_845552 ?auto_845556 ) ) ( not ( = ?auto_845552 ?auto_845557 ) ) ( not ( = ?auto_845552 ?auto_845558 ) ) ( not ( = ?auto_845553 ?auto_845554 ) ) ( not ( = ?auto_845553 ?auto_845555 ) ) ( not ( = ?auto_845553 ?auto_845556 ) ) ( not ( = ?auto_845553 ?auto_845557 ) ) ( not ( = ?auto_845553 ?auto_845558 ) ) ( not ( = ?auto_845554 ?auto_845555 ) ) ( not ( = ?auto_845554 ?auto_845556 ) ) ( not ( = ?auto_845554 ?auto_845557 ) ) ( not ( = ?auto_845554 ?auto_845558 ) ) ( not ( = ?auto_845555 ?auto_845556 ) ) ( not ( = ?auto_845555 ?auto_845557 ) ) ( not ( = ?auto_845555 ?auto_845558 ) ) ( not ( = ?auto_845556 ?auto_845557 ) ) ( not ( = ?auto_845556 ?auto_845558 ) ) ( not ( = ?auto_845557 ?auto_845558 ) ) ( ON ?auto_845556 ?auto_845557 ) ( CLEAR ?auto_845554 ) ( ON ?auto_845555 ?auto_845556 ) ( CLEAR ?auto_845555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_845552 ?auto_845553 ?auto_845554 ?auto_845555 )
      ( MAKE-6PILE ?auto_845552 ?auto_845553 ?auto_845554 ?auto_845555 ?auto_845556 ?auto_845557 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_845578 - BLOCK
      ?auto_845579 - BLOCK
      ?auto_845580 - BLOCK
      ?auto_845581 - BLOCK
      ?auto_845582 - BLOCK
      ?auto_845583 - BLOCK
    )
    :vars
    (
      ?auto_845584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_845583 ?auto_845584 ) ( ON-TABLE ?auto_845578 ) ( ON ?auto_845579 ?auto_845578 ) ( not ( = ?auto_845578 ?auto_845579 ) ) ( not ( = ?auto_845578 ?auto_845580 ) ) ( not ( = ?auto_845578 ?auto_845581 ) ) ( not ( = ?auto_845578 ?auto_845582 ) ) ( not ( = ?auto_845578 ?auto_845583 ) ) ( not ( = ?auto_845578 ?auto_845584 ) ) ( not ( = ?auto_845579 ?auto_845580 ) ) ( not ( = ?auto_845579 ?auto_845581 ) ) ( not ( = ?auto_845579 ?auto_845582 ) ) ( not ( = ?auto_845579 ?auto_845583 ) ) ( not ( = ?auto_845579 ?auto_845584 ) ) ( not ( = ?auto_845580 ?auto_845581 ) ) ( not ( = ?auto_845580 ?auto_845582 ) ) ( not ( = ?auto_845580 ?auto_845583 ) ) ( not ( = ?auto_845580 ?auto_845584 ) ) ( not ( = ?auto_845581 ?auto_845582 ) ) ( not ( = ?auto_845581 ?auto_845583 ) ) ( not ( = ?auto_845581 ?auto_845584 ) ) ( not ( = ?auto_845582 ?auto_845583 ) ) ( not ( = ?auto_845582 ?auto_845584 ) ) ( not ( = ?auto_845583 ?auto_845584 ) ) ( ON ?auto_845582 ?auto_845583 ) ( ON ?auto_845581 ?auto_845582 ) ( CLEAR ?auto_845579 ) ( ON ?auto_845580 ?auto_845581 ) ( CLEAR ?auto_845580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_845578 ?auto_845579 ?auto_845580 )
      ( MAKE-6PILE ?auto_845578 ?auto_845579 ?auto_845580 ?auto_845581 ?auto_845582 ?auto_845583 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_845604 - BLOCK
      ?auto_845605 - BLOCK
      ?auto_845606 - BLOCK
      ?auto_845607 - BLOCK
      ?auto_845608 - BLOCK
      ?auto_845609 - BLOCK
    )
    :vars
    (
      ?auto_845610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_845609 ?auto_845610 ) ( ON-TABLE ?auto_845604 ) ( not ( = ?auto_845604 ?auto_845605 ) ) ( not ( = ?auto_845604 ?auto_845606 ) ) ( not ( = ?auto_845604 ?auto_845607 ) ) ( not ( = ?auto_845604 ?auto_845608 ) ) ( not ( = ?auto_845604 ?auto_845609 ) ) ( not ( = ?auto_845604 ?auto_845610 ) ) ( not ( = ?auto_845605 ?auto_845606 ) ) ( not ( = ?auto_845605 ?auto_845607 ) ) ( not ( = ?auto_845605 ?auto_845608 ) ) ( not ( = ?auto_845605 ?auto_845609 ) ) ( not ( = ?auto_845605 ?auto_845610 ) ) ( not ( = ?auto_845606 ?auto_845607 ) ) ( not ( = ?auto_845606 ?auto_845608 ) ) ( not ( = ?auto_845606 ?auto_845609 ) ) ( not ( = ?auto_845606 ?auto_845610 ) ) ( not ( = ?auto_845607 ?auto_845608 ) ) ( not ( = ?auto_845607 ?auto_845609 ) ) ( not ( = ?auto_845607 ?auto_845610 ) ) ( not ( = ?auto_845608 ?auto_845609 ) ) ( not ( = ?auto_845608 ?auto_845610 ) ) ( not ( = ?auto_845609 ?auto_845610 ) ) ( ON ?auto_845608 ?auto_845609 ) ( ON ?auto_845607 ?auto_845608 ) ( ON ?auto_845606 ?auto_845607 ) ( CLEAR ?auto_845604 ) ( ON ?auto_845605 ?auto_845606 ) ( CLEAR ?auto_845605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_845604 ?auto_845605 )
      ( MAKE-6PILE ?auto_845604 ?auto_845605 ?auto_845606 ?auto_845607 ?auto_845608 ?auto_845609 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_845630 - BLOCK
      ?auto_845631 - BLOCK
      ?auto_845632 - BLOCK
      ?auto_845633 - BLOCK
      ?auto_845634 - BLOCK
      ?auto_845635 - BLOCK
    )
    :vars
    (
      ?auto_845636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_845635 ?auto_845636 ) ( not ( = ?auto_845630 ?auto_845631 ) ) ( not ( = ?auto_845630 ?auto_845632 ) ) ( not ( = ?auto_845630 ?auto_845633 ) ) ( not ( = ?auto_845630 ?auto_845634 ) ) ( not ( = ?auto_845630 ?auto_845635 ) ) ( not ( = ?auto_845630 ?auto_845636 ) ) ( not ( = ?auto_845631 ?auto_845632 ) ) ( not ( = ?auto_845631 ?auto_845633 ) ) ( not ( = ?auto_845631 ?auto_845634 ) ) ( not ( = ?auto_845631 ?auto_845635 ) ) ( not ( = ?auto_845631 ?auto_845636 ) ) ( not ( = ?auto_845632 ?auto_845633 ) ) ( not ( = ?auto_845632 ?auto_845634 ) ) ( not ( = ?auto_845632 ?auto_845635 ) ) ( not ( = ?auto_845632 ?auto_845636 ) ) ( not ( = ?auto_845633 ?auto_845634 ) ) ( not ( = ?auto_845633 ?auto_845635 ) ) ( not ( = ?auto_845633 ?auto_845636 ) ) ( not ( = ?auto_845634 ?auto_845635 ) ) ( not ( = ?auto_845634 ?auto_845636 ) ) ( not ( = ?auto_845635 ?auto_845636 ) ) ( ON ?auto_845634 ?auto_845635 ) ( ON ?auto_845633 ?auto_845634 ) ( ON ?auto_845632 ?auto_845633 ) ( ON ?auto_845631 ?auto_845632 ) ( ON ?auto_845630 ?auto_845631 ) ( CLEAR ?auto_845630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_845630 )
      ( MAKE-6PILE ?auto_845630 ?auto_845631 ?auto_845632 ?auto_845633 ?auto_845634 ?auto_845635 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_845657 - BLOCK
      ?auto_845658 - BLOCK
      ?auto_845659 - BLOCK
      ?auto_845660 - BLOCK
      ?auto_845661 - BLOCK
      ?auto_845662 - BLOCK
      ?auto_845663 - BLOCK
    )
    :vars
    (
      ?auto_845664 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_845662 ) ( ON ?auto_845663 ?auto_845664 ) ( CLEAR ?auto_845663 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_845657 ) ( ON ?auto_845658 ?auto_845657 ) ( ON ?auto_845659 ?auto_845658 ) ( ON ?auto_845660 ?auto_845659 ) ( ON ?auto_845661 ?auto_845660 ) ( ON ?auto_845662 ?auto_845661 ) ( not ( = ?auto_845657 ?auto_845658 ) ) ( not ( = ?auto_845657 ?auto_845659 ) ) ( not ( = ?auto_845657 ?auto_845660 ) ) ( not ( = ?auto_845657 ?auto_845661 ) ) ( not ( = ?auto_845657 ?auto_845662 ) ) ( not ( = ?auto_845657 ?auto_845663 ) ) ( not ( = ?auto_845657 ?auto_845664 ) ) ( not ( = ?auto_845658 ?auto_845659 ) ) ( not ( = ?auto_845658 ?auto_845660 ) ) ( not ( = ?auto_845658 ?auto_845661 ) ) ( not ( = ?auto_845658 ?auto_845662 ) ) ( not ( = ?auto_845658 ?auto_845663 ) ) ( not ( = ?auto_845658 ?auto_845664 ) ) ( not ( = ?auto_845659 ?auto_845660 ) ) ( not ( = ?auto_845659 ?auto_845661 ) ) ( not ( = ?auto_845659 ?auto_845662 ) ) ( not ( = ?auto_845659 ?auto_845663 ) ) ( not ( = ?auto_845659 ?auto_845664 ) ) ( not ( = ?auto_845660 ?auto_845661 ) ) ( not ( = ?auto_845660 ?auto_845662 ) ) ( not ( = ?auto_845660 ?auto_845663 ) ) ( not ( = ?auto_845660 ?auto_845664 ) ) ( not ( = ?auto_845661 ?auto_845662 ) ) ( not ( = ?auto_845661 ?auto_845663 ) ) ( not ( = ?auto_845661 ?auto_845664 ) ) ( not ( = ?auto_845662 ?auto_845663 ) ) ( not ( = ?auto_845662 ?auto_845664 ) ) ( not ( = ?auto_845663 ?auto_845664 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_845663 ?auto_845664 )
      ( !STACK ?auto_845663 ?auto_845662 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_845687 - BLOCK
      ?auto_845688 - BLOCK
      ?auto_845689 - BLOCK
      ?auto_845690 - BLOCK
      ?auto_845691 - BLOCK
      ?auto_845692 - BLOCK
      ?auto_845693 - BLOCK
    )
    :vars
    (
      ?auto_845694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_845693 ?auto_845694 ) ( ON-TABLE ?auto_845687 ) ( ON ?auto_845688 ?auto_845687 ) ( ON ?auto_845689 ?auto_845688 ) ( ON ?auto_845690 ?auto_845689 ) ( ON ?auto_845691 ?auto_845690 ) ( not ( = ?auto_845687 ?auto_845688 ) ) ( not ( = ?auto_845687 ?auto_845689 ) ) ( not ( = ?auto_845687 ?auto_845690 ) ) ( not ( = ?auto_845687 ?auto_845691 ) ) ( not ( = ?auto_845687 ?auto_845692 ) ) ( not ( = ?auto_845687 ?auto_845693 ) ) ( not ( = ?auto_845687 ?auto_845694 ) ) ( not ( = ?auto_845688 ?auto_845689 ) ) ( not ( = ?auto_845688 ?auto_845690 ) ) ( not ( = ?auto_845688 ?auto_845691 ) ) ( not ( = ?auto_845688 ?auto_845692 ) ) ( not ( = ?auto_845688 ?auto_845693 ) ) ( not ( = ?auto_845688 ?auto_845694 ) ) ( not ( = ?auto_845689 ?auto_845690 ) ) ( not ( = ?auto_845689 ?auto_845691 ) ) ( not ( = ?auto_845689 ?auto_845692 ) ) ( not ( = ?auto_845689 ?auto_845693 ) ) ( not ( = ?auto_845689 ?auto_845694 ) ) ( not ( = ?auto_845690 ?auto_845691 ) ) ( not ( = ?auto_845690 ?auto_845692 ) ) ( not ( = ?auto_845690 ?auto_845693 ) ) ( not ( = ?auto_845690 ?auto_845694 ) ) ( not ( = ?auto_845691 ?auto_845692 ) ) ( not ( = ?auto_845691 ?auto_845693 ) ) ( not ( = ?auto_845691 ?auto_845694 ) ) ( not ( = ?auto_845692 ?auto_845693 ) ) ( not ( = ?auto_845692 ?auto_845694 ) ) ( not ( = ?auto_845693 ?auto_845694 ) ) ( CLEAR ?auto_845691 ) ( ON ?auto_845692 ?auto_845693 ) ( CLEAR ?auto_845692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_845687 ?auto_845688 ?auto_845689 ?auto_845690 ?auto_845691 ?auto_845692 )
      ( MAKE-7PILE ?auto_845687 ?auto_845688 ?auto_845689 ?auto_845690 ?auto_845691 ?auto_845692 ?auto_845693 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_845717 - BLOCK
      ?auto_845718 - BLOCK
      ?auto_845719 - BLOCK
      ?auto_845720 - BLOCK
      ?auto_845721 - BLOCK
      ?auto_845722 - BLOCK
      ?auto_845723 - BLOCK
    )
    :vars
    (
      ?auto_845724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_845723 ?auto_845724 ) ( ON-TABLE ?auto_845717 ) ( ON ?auto_845718 ?auto_845717 ) ( ON ?auto_845719 ?auto_845718 ) ( ON ?auto_845720 ?auto_845719 ) ( not ( = ?auto_845717 ?auto_845718 ) ) ( not ( = ?auto_845717 ?auto_845719 ) ) ( not ( = ?auto_845717 ?auto_845720 ) ) ( not ( = ?auto_845717 ?auto_845721 ) ) ( not ( = ?auto_845717 ?auto_845722 ) ) ( not ( = ?auto_845717 ?auto_845723 ) ) ( not ( = ?auto_845717 ?auto_845724 ) ) ( not ( = ?auto_845718 ?auto_845719 ) ) ( not ( = ?auto_845718 ?auto_845720 ) ) ( not ( = ?auto_845718 ?auto_845721 ) ) ( not ( = ?auto_845718 ?auto_845722 ) ) ( not ( = ?auto_845718 ?auto_845723 ) ) ( not ( = ?auto_845718 ?auto_845724 ) ) ( not ( = ?auto_845719 ?auto_845720 ) ) ( not ( = ?auto_845719 ?auto_845721 ) ) ( not ( = ?auto_845719 ?auto_845722 ) ) ( not ( = ?auto_845719 ?auto_845723 ) ) ( not ( = ?auto_845719 ?auto_845724 ) ) ( not ( = ?auto_845720 ?auto_845721 ) ) ( not ( = ?auto_845720 ?auto_845722 ) ) ( not ( = ?auto_845720 ?auto_845723 ) ) ( not ( = ?auto_845720 ?auto_845724 ) ) ( not ( = ?auto_845721 ?auto_845722 ) ) ( not ( = ?auto_845721 ?auto_845723 ) ) ( not ( = ?auto_845721 ?auto_845724 ) ) ( not ( = ?auto_845722 ?auto_845723 ) ) ( not ( = ?auto_845722 ?auto_845724 ) ) ( not ( = ?auto_845723 ?auto_845724 ) ) ( ON ?auto_845722 ?auto_845723 ) ( CLEAR ?auto_845720 ) ( ON ?auto_845721 ?auto_845722 ) ( CLEAR ?auto_845721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_845717 ?auto_845718 ?auto_845719 ?auto_845720 ?auto_845721 )
      ( MAKE-7PILE ?auto_845717 ?auto_845718 ?auto_845719 ?auto_845720 ?auto_845721 ?auto_845722 ?auto_845723 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_845747 - BLOCK
      ?auto_845748 - BLOCK
      ?auto_845749 - BLOCK
      ?auto_845750 - BLOCK
      ?auto_845751 - BLOCK
      ?auto_845752 - BLOCK
      ?auto_845753 - BLOCK
    )
    :vars
    (
      ?auto_845754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_845753 ?auto_845754 ) ( ON-TABLE ?auto_845747 ) ( ON ?auto_845748 ?auto_845747 ) ( ON ?auto_845749 ?auto_845748 ) ( not ( = ?auto_845747 ?auto_845748 ) ) ( not ( = ?auto_845747 ?auto_845749 ) ) ( not ( = ?auto_845747 ?auto_845750 ) ) ( not ( = ?auto_845747 ?auto_845751 ) ) ( not ( = ?auto_845747 ?auto_845752 ) ) ( not ( = ?auto_845747 ?auto_845753 ) ) ( not ( = ?auto_845747 ?auto_845754 ) ) ( not ( = ?auto_845748 ?auto_845749 ) ) ( not ( = ?auto_845748 ?auto_845750 ) ) ( not ( = ?auto_845748 ?auto_845751 ) ) ( not ( = ?auto_845748 ?auto_845752 ) ) ( not ( = ?auto_845748 ?auto_845753 ) ) ( not ( = ?auto_845748 ?auto_845754 ) ) ( not ( = ?auto_845749 ?auto_845750 ) ) ( not ( = ?auto_845749 ?auto_845751 ) ) ( not ( = ?auto_845749 ?auto_845752 ) ) ( not ( = ?auto_845749 ?auto_845753 ) ) ( not ( = ?auto_845749 ?auto_845754 ) ) ( not ( = ?auto_845750 ?auto_845751 ) ) ( not ( = ?auto_845750 ?auto_845752 ) ) ( not ( = ?auto_845750 ?auto_845753 ) ) ( not ( = ?auto_845750 ?auto_845754 ) ) ( not ( = ?auto_845751 ?auto_845752 ) ) ( not ( = ?auto_845751 ?auto_845753 ) ) ( not ( = ?auto_845751 ?auto_845754 ) ) ( not ( = ?auto_845752 ?auto_845753 ) ) ( not ( = ?auto_845752 ?auto_845754 ) ) ( not ( = ?auto_845753 ?auto_845754 ) ) ( ON ?auto_845752 ?auto_845753 ) ( ON ?auto_845751 ?auto_845752 ) ( CLEAR ?auto_845749 ) ( ON ?auto_845750 ?auto_845751 ) ( CLEAR ?auto_845750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_845747 ?auto_845748 ?auto_845749 ?auto_845750 )
      ( MAKE-7PILE ?auto_845747 ?auto_845748 ?auto_845749 ?auto_845750 ?auto_845751 ?auto_845752 ?auto_845753 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_845777 - BLOCK
      ?auto_845778 - BLOCK
      ?auto_845779 - BLOCK
      ?auto_845780 - BLOCK
      ?auto_845781 - BLOCK
      ?auto_845782 - BLOCK
      ?auto_845783 - BLOCK
    )
    :vars
    (
      ?auto_845784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_845783 ?auto_845784 ) ( ON-TABLE ?auto_845777 ) ( ON ?auto_845778 ?auto_845777 ) ( not ( = ?auto_845777 ?auto_845778 ) ) ( not ( = ?auto_845777 ?auto_845779 ) ) ( not ( = ?auto_845777 ?auto_845780 ) ) ( not ( = ?auto_845777 ?auto_845781 ) ) ( not ( = ?auto_845777 ?auto_845782 ) ) ( not ( = ?auto_845777 ?auto_845783 ) ) ( not ( = ?auto_845777 ?auto_845784 ) ) ( not ( = ?auto_845778 ?auto_845779 ) ) ( not ( = ?auto_845778 ?auto_845780 ) ) ( not ( = ?auto_845778 ?auto_845781 ) ) ( not ( = ?auto_845778 ?auto_845782 ) ) ( not ( = ?auto_845778 ?auto_845783 ) ) ( not ( = ?auto_845778 ?auto_845784 ) ) ( not ( = ?auto_845779 ?auto_845780 ) ) ( not ( = ?auto_845779 ?auto_845781 ) ) ( not ( = ?auto_845779 ?auto_845782 ) ) ( not ( = ?auto_845779 ?auto_845783 ) ) ( not ( = ?auto_845779 ?auto_845784 ) ) ( not ( = ?auto_845780 ?auto_845781 ) ) ( not ( = ?auto_845780 ?auto_845782 ) ) ( not ( = ?auto_845780 ?auto_845783 ) ) ( not ( = ?auto_845780 ?auto_845784 ) ) ( not ( = ?auto_845781 ?auto_845782 ) ) ( not ( = ?auto_845781 ?auto_845783 ) ) ( not ( = ?auto_845781 ?auto_845784 ) ) ( not ( = ?auto_845782 ?auto_845783 ) ) ( not ( = ?auto_845782 ?auto_845784 ) ) ( not ( = ?auto_845783 ?auto_845784 ) ) ( ON ?auto_845782 ?auto_845783 ) ( ON ?auto_845781 ?auto_845782 ) ( ON ?auto_845780 ?auto_845781 ) ( CLEAR ?auto_845778 ) ( ON ?auto_845779 ?auto_845780 ) ( CLEAR ?auto_845779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_845777 ?auto_845778 ?auto_845779 )
      ( MAKE-7PILE ?auto_845777 ?auto_845778 ?auto_845779 ?auto_845780 ?auto_845781 ?auto_845782 ?auto_845783 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_845807 - BLOCK
      ?auto_845808 - BLOCK
      ?auto_845809 - BLOCK
      ?auto_845810 - BLOCK
      ?auto_845811 - BLOCK
      ?auto_845812 - BLOCK
      ?auto_845813 - BLOCK
    )
    :vars
    (
      ?auto_845814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_845813 ?auto_845814 ) ( ON-TABLE ?auto_845807 ) ( not ( = ?auto_845807 ?auto_845808 ) ) ( not ( = ?auto_845807 ?auto_845809 ) ) ( not ( = ?auto_845807 ?auto_845810 ) ) ( not ( = ?auto_845807 ?auto_845811 ) ) ( not ( = ?auto_845807 ?auto_845812 ) ) ( not ( = ?auto_845807 ?auto_845813 ) ) ( not ( = ?auto_845807 ?auto_845814 ) ) ( not ( = ?auto_845808 ?auto_845809 ) ) ( not ( = ?auto_845808 ?auto_845810 ) ) ( not ( = ?auto_845808 ?auto_845811 ) ) ( not ( = ?auto_845808 ?auto_845812 ) ) ( not ( = ?auto_845808 ?auto_845813 ) ) ( not ( = ?auto_845808 ?auto_845814 ) ) ( not ( = ?auto_845809 ?auto_845810 ) ) ( not ( = ?auto_845809 ?auto_845811 ) ) ( not ( = ?auto_845809 ?auto_845812 ) ) ( not ( = ?auto_845809 ?auto_845813 ) ) ( not ( = ?auto_845809 ?auto_845814 ) ) ( not ( = ?auto_845810 ?auto_845811 ) ) ( not ( = ?auto_845810 ?auto_845812 ) ) ( not ( = ?auto_845810 ?auto_845813 ) ) ( not ( = ?auto_845810 ?auto_845814 ) ) ( not ( = ?auto_845811 ?auto_845812 ) ) ( not ( = ?auto_845811 ?auto_845813 ) ) ( not ( = ?auto_845811 ?auto_845814 ) ) ( not ( = ?auto_845812 ?auto_845813 ) ) ( not ( = ?auto_845812 ?auto_845814 ) ) ( not ( = ?auto_845813 ?auto_845814 ) ) ( ON ?auto_845812 ?auto_845813 ) ( ON ?auto_845811 ?auto_845812 ) ( ON ?auto_845810 ?auto_845811 ) ( ON ?auto_845809 ?auto_845810 ) ( CLEAR ?auto_845807 ) ( ON ?auto_845808 ?auto_845809 ) ( CLEAR ?auto_845808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_845807 ?auto_845808 )
      ( MAKE-7PILE ?auto_845807 ?auto_845808 ?auto_845809 ?auto_845810 ?auto_845811 ?auto_845812 ?auto_845813 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_845837 - BLOCK
      ?auto_845838 - BLOCK
      ?auto_845839 - BLOCK
      ?auto_845840 - BLOCK
      ?auto_845841 - BLOCK
      ?auto_845842 - BLOCK
      ?auto_845843 - BLOCK
    )
    :vars
    (
      ?auto_845844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_845843 ?auto_845844 ) ( not ( = ?auto_845837 ?auto_845838 ) ) ( not ( = ?auto_845837 ?auto_845839 ) ) ( not ( = ?auto_845837 ?auto_845840 ) ) ( not ( = ?auto_845837 ?auto_845841 ) ) ( not ( = ?auto_845837 ?auto_845842 ) ) ( not ( = ?auto_845837 ?auto_845843 ) ) ( not ( = ?auto_845837 ?auto_845844 ) ) ( not ( = ?auto_845838 ?auto_845839 ) ) ( not ( = ?auto_845838 ?auto_845840 ) ) ( not ( = ?auto_845838 ?auto_845841 ) ) ( not ( = ?auto_845838 ?auto_845842 ) ) ( not ( = ?auto_845838 ?auto_845843 ) ) ( not ( = ?auto_845838 ?auto_845844 ) ) ( not ( = ?auto_845839 ?auto_845840 ) ) ( not ( = ?auto_845839 ?auto_845841 ) ) ( not ( = ?auto_845839 ?auto_845842 ) ) ( not ( = ?auto_845839 ?auto_845843 ) ) ( not ( = ?auto_845839 ?auto_845844 ) ) ( not ( = ?auto_845840 ?auto_845841 ) ) ( not ( = ?auto_845840 ?auto_845842 ) ) ( not ( = ?auto_845840 ?auto_845843 ) ) ( not ( = ?auto_845840 ?auto_845844 ) ) ( not ( = ?auto_845841 ?auto_845842 ) ) ( not ( = ?auto_845841 ?auto_845843 ) ) ( not ( = ?auto_845841 ?auto_845844 ) ) ( not ( = ?auto_845842 ?auto_845843 ) ) ( not ( = ?auto_845842 ?auto_845844 ) ) ( not ( = ?auto_845843 ?auto_845844 ) ) ( ON ?auto_845842 ?auto_845843 ) ( ON ?auto_845841 ?auto_845842 ) ( ON ?auto_845840 ?auto_845841 ) ( ON ?auto_845839 ?auto_845840 ) ( ON ?auto_845838 ?auto_845839 ) ( ON ?auto_845837 ?auto_845838 ) ( CLEAR ?auto_845837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_845837 )
      ( MAKE-7PILE ?auto_845837 ?auto_845838 ?auto_845839 ?auto_845840 ?auto_845841 ?auto_845842 ?auto_845843 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_845868 - BLOCK
      ?auto_845869 - BLOCK
      ?auto_845870 - BLOCK
      ?auto_845871 - BLOCK
      ?auto_845872 - BLOCK
      ?auto_845873 - BLOCK
      ?auto_845874 - BLOCK
      ?auto_845875 - BLOCK
    )
    :vars
    (
      ?auto_845876 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_845874 ) ( ON ?auto_845875 ?auto_845876 ) ( CLEAR ?auto_845875 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_845868 ) ( ON ?auto_845869 ?auto_845868 ) ( ON ?auto_845870 ?auto_845869 ) ( ON ?auto_845871 ?auto_845870 ) ( ON ?auto_845872 ?auto_845871 ) ( ON ?auto_845873 ?auto_845872 ) ( ON ?auto_845874 ?auto_845873 ) ( not ( = ?auto_845868 ?auto_845869 ) ) ( not ( = ?auto_845868 ?auto_845870 ) ) ( not ( = ?auto_845868 ?auto_845871 ) ) ( not ( = ?auto_845868 ?auto_845872 ) ) ( not ( = ?auto_845868 ?auto_845873 ) ) ( not ( = ?auto_845868 ?auto_845874 ) ) ( not ( = ?auto_845868 ?auto_845875 ) ) ( not ( = ?auto_845868 ?auto_845876 ) ) ( not ( = ?auto_845869 ?auto_845870 ) ) ( not ( = ?auto_845869 ?auto_845871 ) ) ( not ( = ?auto_845869 ?auto_845872 ) ) ( not ( = ?auto_845869 ?auto_845873 ) ) ( not ( = ?auto_845869 ?auto_845874 ) ) ( not ( = ?auto_845869 ?auto_845875 ) ) ( not ( = ?auto_845869 ?auto_845876 ) ) ( not ( = ?auto_845870 ?auto_845871 ) ) ( not ( = ?auto_845870 ?auto_845872 ) ) ( not ( = ?auto_845870 ?auto_845873 ) ) ( not ( = ?auto_845870 ?auto_845874 ) ) ( not ( = ?auto_845870 ?auto_845875 ) ) ( not ( = ?auto_845870 ?auto_845876 ) ) ( not ( = ?auto_845871 ?auto_845872 ) ) ( not ( = ?auto_845871 ?auto_845873 ) ) ( not ( = ?auto_845871 ?auto_845874 ) ) ( not ( = ?auto_845871 ?auto_845875 ) ) ( not ( = ?auto_845871 ?auto_845876 ) ) ( not ( = ?auto_845872 ?auto_845873 ) ) ( not ( = ?auto_845872 ?auto_845874 ) ) ( not ( = ?auto_845872 ?auto_845875 ) ) ( not ( = ?auto_845872 ?auto_845876 ) ) ( not ( = ?auto_845873 ?auto_845874 ) ) ( not ( = ?auto_845873 ?auto_845875 ) ) ( not ( = ?auto_845873 ?auto_845876 ) ) ( not ( = ?auto_845874 ?auto_845875 ) ) ( not ( = ?auto_845874 ?auto_845876 ) ) ( not ( = ?auto_845875 ?auto_845876 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_845875 ?auto_845876 )
      ( !STACK ?auto_845875 ?auto_845874 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_845902 - BLOCK
      ?auto_845903 - BLOCK
      ?auto_845904 - BLOCK
      ?auto_845905 - BLOCK
      ?auto_845906 - BLOCK
      ?auto_845907 - BLOCK
      ?auto_845908 - BLOCK
      ?auto_845909 - BLOCK
    )
    :vars
    (
      ?auto_845910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_845909 ?auto_845910 ) ( ON-TABLE ?auto_845902 ) ( ON ?auto_845903 ?auto_845902 ) ( ON ?auto_845904 ?auto_845903 ) ( ON ?auto_845905 ?auto_845904 ) ( ON ?auto_845906 ?auto_845905 ) ( ON ?auto_845907 ?auto_845906 ) ( not ( = ?auto_845902 ?auto_845903 ) ) ( not ( = ?auto_845902 ?auto_845904 ) ) ( not ( = ?auto_845902 ?auto_845905 ) ) ( not ( = ?auto_845902 ?auto_845906 ) ) ( not ( = ?auto_845902 ?auto_845907 ) ) ( not ( = ?auto_845902 ?auto_845908 ) ) ( not ( = ?auto_845902 ?auto_845909 ) ) ( not ( = ?auto_845902 ?auto_845910 ) ) ( not ( = ?auto_845903 ?auto_845904 ) ) ( not ( = ?auto_845903 ?auto_845905 ) ) ( not ( = ?auto_845903 ?auto_845906 ) ) ( not ( = ?auto_845903 ?auto_845907 ) ) ( not ( = ?auto_845903 ?auto_845908 ) ) ( not ( = ?auto_845903 ?auto_845909 ) ) ( not ( = ?auto_845903 ?auto_845910 ) ) ( not ( = ?auto_845904 ?auto_845905 ) ) ( not ( = ?auto_845904 ?auto_845906 ) ) ( not ( = ?auto_845904 ?auto_845907 ) ) ( not ( = ?auto_845904 ?auto_845908 ) ) ( not ( = ?auto_845904 ?auto_845909 ) ) ( not ( = ?auto_845904 ?auto_845910 ) ) ( not ( = ?auto_845905 ?auto_845906 ) ) ( not ( = ?auto_845905 ?auto_845907 ) ) ( not ( = ?auto_845905 ?auto_845908 ) ) ( not ( = ?auto_845905 ?auto_845909 ) ) ( not ( = ?auto_845905 ?auto_845910 ) ) ( not ( = ?auto_845906 ?auto_845907 ) ) ( not ( = ?auto_845906 ?auto_845908 ) ) ( not ( = ?auto_845906 ?auto_845909 ) ) ( not ( = ?auto_845906 ?auto_845910 ) ) ( not ( = ?auto_845907 ?auto_845908 ) ) ( not ( = ?auto_845907 ?auto_845909 ) ) ( not ( = ?auto_845907 ?auto_845910 ) ) ( not ( = ?auto_845908 ?auto_845909 ) ) ( not ( = ?auto_845908 ?auto_845910 ) ) ( not ( = ?auto_845909 ?auto_845910 ) ) ( CLEAR ?auto_845907 ) ( ON ?auto_845908 ?auto_845909 ) ( CLEAR ?auto_845908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_845902 ?auto_845903 ?auto_845904 ?auto_845905 ?auto_845906 ?auto_845907 ?auto_845908 )
      ( MAKE-8PILE ?auto_845902 ?auto_845903 ?auto_845904 ?auto_845905 ?auto_845906 ?auto_845907 ?auto_845908 ?auto_845909 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_845936 - BLOCK
      ?auto_845937 - BLOCK
      ?auto_845938 - BLOCK
      ?auto_845939 - BLOCK
      ?auto_845940 - BLOCK
      ?auto_845941 - BLOCK
      ?auto_845942 - BLOCK
      ?auto_845943 - BLOCK
    )
    :vars
    (
      ?auto_845944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_845943 ?auto_845944 ) ( ON-TABLE ?auto_845936 ) ( ON ?auto_845937 ?auto_845936 ) ( ON ?auto_845938 ?auto_845937 ) ( ON ?auto_845939 ?auto_845938 ) ( ON ?auto_845940 ?auto_845939 ) ( not ( = ?auto_845936 ?auto_845937 ) ) ( not ( = ?auto_845936 ?auto_845938 ) ) ( not ( = ?auto_845936 ?auto_845939 ) ) ( not ( = ?auto_845936 ?auto_845940 ) ) ( not ( = ?auto_845936 ?auto_845941 ) ) ( not ( = ?auto_845936 ?auto_845942 ) ) ( not ( = ?auto_845936 ?auto_845943 ) ) ( not ( = ?auto_845936 ?auto_845944 ) ) ( not ( = ?auto_845937 ?auto_845938 ) ) ( not ( = ?auto_845937 ?auto_845939 ) ) ( not ( = ?auto_845937 ?auto_845940 ) ) ( not ( = ?auto_845937 ?auto_845941 ) ) ( not ( = ?auto_845937 ?auto_845942 ) ) ( not ( = ?auto_845937 ?auto_845943 ) ) ( not ( = ?auto_845937 ?auto_845944 ) ) ( not ( = ?auto_845938 ?auto_845939 ) ) ( not ( = ?auto_845938 ?auto_845940 ) ) ( not ( = ?auto_845938 ?auto_845941 ) ) ( not ( = ?auto_845938 ?auto_845942 ) ) ( not ( = ?auto_845938 ?auto_845943 ) ) ( not ( = ?auto_845938 ?auto_845944 ) ) ( not ( = ?auto_845939 ?auto_845940 ) ) ( not ( = ?auto_845939 ?auto_845941 ) ) ( not ( = ?auto_845939 ?auto_845942 ) ) ( not ( = ?auto_845939 ?auto_845943 ) ) ( not ( = ?auto_845939 ?auto_845944 ) ) ( not ( = ?auto_845940 ?auto_845941 ) ) ( not ( = ?auto_845940 ?auto_845942 ) ) ( not ( = ?auto_845940 ?auto_845943 ) ) ( not ( = ?auto_845940 ?auto_845944 ) ) ( not ( = ?auto_845941 ?auto_845942 ) ) ( not ( = ?auto_845941 ?auto_845943 ) ) ( not ( = ?auto_845941 ?auto_845944 ) ) ( not ( = ?auto_845942 ?auto_845943 ) ) ( not ( = ?auto_845942 ?auto_845944 ) ) ( not ( = ?auto_845943 ?auto_845944 ) ) ( ON ?auto_845942 ?auto_845943 ) ( CLEAR ?auto_845940 ) ( ON ?auto_845941 ?auto_845942 ) ( CLEAR ?auto_845941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_845936 ?auto_845937 ?auto_845938 ?auto_845939 ?auto_845940 ?auto_845941 )
      ( MAKE-8PILE ?auto_845936 ?auto_845937 ?auto_845938 ?auto_845939 ?auto_845940 ?auto_845941 ?auto_845942 ?auto_845943 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_845970 - BLOCK
      ?auto_845971 - BLOCK
      ?auto_845972 - BLOCK
      ?auto_845973 - BLOCK
      ?auto_845974 - BLOCK
      ?auto_845975 - BLOCK
      ?auto_845976 - BLOCK
      ?auto_845977 - BLOCK
    )
    :vars
    (
      ?auto_845978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_845977 ?auto_845978 ) ( ON-TABLE ?auto_845970 ) ( ON ?auto_845971 ?auto_845970 ) ( ON ?auto_845972 ?auto_845971 ) ( ON ?auto_845973 ?auto_845972 ) ( not ( = ?auto_845970 ?auto_845971 ) ) ( not ( = ?auto_845970 ?auto_845972 ) ) ( not ( = ?auto_845970 ?auto_845973 ) ) ( not ( = ?auto_845970 ?auto_845974 ) ) ( not ( = ?auto_845970 ?auto_845975 ) ) ( not ( = ?auto_845970 ?auto_845976 ) ) ( not ( = ?auto_845970 ?auto_845977 ) ) ( not ( = ?auto_845970 ?auto_845978 ) ) ( not ( = ?auto_845971 ?auto_845972 ) ) ( not ( = ?auto_845971 ?auto_845973 ) ) ( not ( = ?auto_845971 ?auto_845974 ) ) ( not ( = ?auto_845971 ?auto_845975 ) ) ( not ( = ?auto_845971 ?auto_845976 ) ) ( not ( = ?auto_845971 ?auto_845977 ) ) ( not ( = ?auto_845971 ?auto_845978 ) ) ( not ( = ?auto_845972 ?auto_845973 ) ) ( not ( = ?auto_845972 ?auto_845974 ) ) ( not ( = ?auto_845972 ?auto_845975 ) ) ( not ( = ?auto_845972 ?auto_845976 ) ) ( not ( = ?auto_845972 ?auto_845977 ) ) ( not ( = ?auto_845972 ?auto_845978 ) ) ( not ( = ?auto_845973 ?auto_845974 ) ) ( not ( = ?auto_845973 ?auto_845975 ) ) ( not ( = ?auto_845973 ?auto_845976 ) ) ( not ( = ?auto_845973 ?auto_845977 ) ) ( not ( = ?auto_845973 ?auto_845978 ) ) ( not ( = ?auto_845974 ?auto_845975 ) ) ( not ( = ?auto_845974 ?auto_845976 ) ) ( not ( = ?auto_845974 ?auto_845977 ) ) ( not ( = ?auto_845974 ?auto_845978 ) ) ( not ( = ?auto_845975 ?auto_845976 ) ) ( not ( = ?auto_845975 ?auto_845977 ) ) ( not ( = ?auto_845975 ?auto_845978 ) ) ( not ( = ?auto_845976 ?auto_845977 ) ) ( not ( = ?auto_845976 ?auto_845978 ) ) ( not ( = ?auto_845977 ?auto_845978 ) ) ( ON ?auto_845976 ?auto_845977 ) ( ON ?auto_845975 ?auto_845976 ) ( CLEAR ?auto_845973 ) ( ON ?auto_845974 ?auto_845975 ) ( CLEAR ?auto_845974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_845970 ?auto_845971 ?auto_845972 ?auto_845973 ?auto_845974 )
      ( MAKE-8PILE ?auto_845970 ?auto_845971 ?auto_845972 ?auto_845973 ?auto_845974 ?auto_845975 ?auto_845976 ?auto_845977 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_846004 - BLOCK
      ?auto_846005 - BLOCK
      ?auto_846006 - BLOCK
      ?auto_846007 - BLOCK
      ?auto_846008 - BLOCK
      ?auto_846009 - BLOCK
      ?auto_846010 - BLOCK
      ?auto_846011 - BLOCK
    )
    :vars
    (
      ?auto_846012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_846011 ?auto_846012 ) ( ON-TABLE ?auto_846004 ) ( ON ?auto_846005 ?auto_846004 ) ( ON ?auto_846006 ?auto_846005 ) ( not ( = ?auto_846004 ?auto_846005 ) ) ( not ( = ?auto_846004 ?auto_846006 ) ) ( not ( = ?auto_846004 ?auto_846007 ) ) ( not ( = ?auto_846004 ?auto_846008 ) ) ( not ( = ?auto_846004 ?auto_846009 ) ) ( not ( = ?auto_846004 ?auto_846010 ) ) ( not ( = ?auto_846004 ?auto_846011 ) ) ( not ( = ?auto_846004 ?auto_846012 ) ) ( not ( = ?auto_846005 ?auto_846006 ) ) ( not ( = ?auto_846005 ?auto_846007 ) ) ( not ( = ?auto_846005 ?auto_846008 ) ) ( not ( = ?auto_846005 ?auto_846009 ) ) ( not ( = ?auto_846005 ?auto_846010 ) ) ( not ( = ?auto_846005 ?auto_846011 ) ) ( not ( = ?auto_846005 ?auto_846012 ) ) ( not ( = ?auto_846006 ?auto_846007 ) ) ( not ( = ?auto_846006 ?auto_846008 ) ) ( not ( = ?auto_846006 ?auto_846009 ) ) ( not ( = ?auto_846006 ?auto_846010 ) ) ( not ( = ?auto_846006 ?auto_846011 ) ) ( not ( = ?auto_846006 ?auto_846012 ) ) ( not ( = ?auto_846007 ?auto_846008 ) ) ( not ( = ?auto_846007 ?auto_846009 ) ) ( not ( = ?auto_846007 ?auto_846010 ) ) ( not ( = ?auto_846007 ?auto_846011 ) ) ( not ( = ?auto_846007 ?auto_846012 ) ) ( not ( = ?auto_846008 ?auto_846009 ) ) ( not ( = ?auto_846008 ?auto_846010 ) ) ( not ( = ?auto_846008 ?auto_846011 ) ) ( not ( = ?auto_846008 ?auto_846012 ) ) ( not ( = ?auto_846009 ?auto_846010 ) ) ( not ( = ?auto_846009 ?auto_846011 ) ) ( not ( = ?auto_846009 ?auto_846012 ) ) ( not ( = ?auto_846010 ?auto_846011 ) ) ( not ( = ?auto_846010 ?auto_846012 ) ) ( not ( = ?auto_846011 ?auto_846012 ) ) ( ON ?auto_846010 ?auto_846011 ) ( ON ?auto_846009 ?auto_846010 ) ( ON ?auto_846008 ?auto_846009 ) ( CLEAR ?auto_846006 ) ( ON ?auto_846007 ?auto_846008 ) ( CLEAR ?auto_846007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_846004 ?auto_846005 ?auto_846006 ?auto_846007 )
      ( MAKE-8PILE ?auto_846004 ?auto_846005 ?auto_846006 ?auto_846007 ?auto_846008 ?auto_846009 ?auto_846010 ?auto_846011 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_846038 - BLOCK
      ?auto_846039 - BLOCK
      ?auto_846040 - BLOCK
      ?auto_846041 - BLOCK
      ?auto_846042 - BLOCK
      ?auto_846043 - BLOCK
      ?auto_846044 - BLOCK
      ?auto_846045 - BLOCK
    )
    :vars
    (
      ?auto_846046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_846045 ?auto_846046 ) ( ON-TABLE ?auto_846038 ) ( ON ?auto_846039 ?auto_846038 ) ( not ( = ?auto_846038 ?auto_846039 ) ) ( not ( = ?auto_846038 ?auto_846040 ) ) ( not ( = ?auto_846038 ?auto_846041 ) ) ( not ( = ?auto_846038 ?auto_846042 ) ) ( not ( = ?auto_846038 ?auto_846043 ) ) ( not ( = ?auto_846038 ?auto_846044 ) ) ( not ( = ?auto_846038 ?auto_846045 ) ) ( not ( = ?auto_846038 ?auto_846046 ) ) ( not ( = ?auto_846039 ?auto_846040 ) ) ( not ( = ?auto_846039 ?auto_846041 ) ) ( not ( = ?auto_846039 ?auto_846042 ) ) ( not ( = ?auto_846039 ?auto_846043 ) ) ( not ( = ?auto_846039 ?auto_846044 ) ) ( not ( = ?auto_846039 ?auto_846045 ) ) ( not ( = ?auto_846039 ?auto_846046 ) ) ( not ( = ?auto_846040 ?auto_846041 ) ) ( not ( = ?auto_846040 ?auto_846042 ) ) ( not ( = ?auto_846040 ?auto_846043 ) ) ( not ( = ?auto_846040 ?auto_846044 ) ) ( not ( = ?auto_846040 ?auto_846045 ) ) ( not ( = ?auto_846040 ?auto_846046 ) ) ( not ( = ?auto_846041 ?auto_846042 ) ) ( not ( = ?auto_846041 ?auto_846043 ) ) ( not ( = ?auto_846041 ?auto_846044 ) ) ( not ( = ?auto_846041 ?auto_846045 ) ) ( not ( = ?auto_846041 ?auto_846046 ) ) ( not ( = ?auto_846042 ?auto_846043 ) ) ( not ( = ?auto_846042 ?auto_846044 ) ) ( not ( = ?auto_846042 ?auto_846045 ) ) ( not ( = ?auto_846042 ?auto_846046 ) ) ( not ( = ?auto_846043 ?auto_846044 ) ) ( not ( = ?auto_846043 ?auto_846045 ) ) ( not ( = ?auto_846043 ?auto_846046 ) ) ( not ( = ?auto_846044 ?auto_846045 ) ) ( not ( = ?auto_846044 ?auto_846046 ) ) ( not ( = ?auto_846045 ?auto_846046 ) ) ( ON ?auto_846044 ?auto_846045 ) ( ON ?auto_846043 ?auto_846044 ) ( ON ?auto_846042 ?auto_846043 ) ( ON ?auto_846041 ?auto_846042 ) ( CLEAR ?auto_846039 ) ( ON ?auto_846040 ?auto_846041 ) ( CLEAR ?auto_846040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_846038 ?auto_846039 ?auto_846040 )
      ( MAKE-8PILE ?auto_846038 ?auto_846039 ?auto_846040 ?auto_846041 ?auto_846042 ?auto_846043 ?auto_846044 ?auto_846045 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_846072 - BLOCK
      ?auto_846073 - BLOCK
      ?auto_846074 - BLOCK
      ?auto_846075 - BLOCK
      ?auto_846076 - BLOCK
      ?auto_846077 - BLOCK
      ?auto_846078 - BLOCK
      ?auto_846079 - BLOCK
    )
    :vars
    (
      ?auto_846080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_846079 ?auto_846080 ) ( ON-TABLE ?auto_846072 ) ( not ( = ?auto_846072 ?auto_846073 ) ) ( not ( = ?auto_846072 ?auto_846074 ) ) ( not ( = ?auto_846072 ?auto_846075 ) ) ( not ( = ?auto_846072 ?auto_846076 ) ) ( not ( = ?auto_846072 ?auto_846077 ) ) ( not ( = ?auto_846072 ?auto_846078 ) ) ( not ( = ?auto_846072 ?auto_846079 ) ) ( not ( = ?auto_846072 ?auto_846080 ) ) ( not ( = ?auto_846073 ?auto_846074 ) ) ( not ( = ?auto_846073 ?auto_846075 ) ) ( not ( = ?auto_846073 ?auto_846076 ) ) ( not ( = ?auto_846073 ?auto_846077 ) ) ( not ( = ?auto_846073 ?auto_846078 ) ) ( not ( = ?auto_846073 ?auto_846079 ) ) ( not ( = ?auto_846073 ?auto_846080 ) ) ( not ( = ?auto_846074 ?auto_846075 ) ) ( not ( = ?auto_846074 ?auto_846076 ) ) ( not ( = ?auto_846074 ?auto_846077 ) ) ( not ( = ?auto_846074 ?auto_846078 ) ) ( not ( = ?auto_846074 ?auto_846079 ) ) ( not ( = ?auto_846074 ?auto_846080 ) ) ( not ( = ?auto_846075 ?auto_846076 ) ) ( not ( = ?auto_846075 ?auto_846077 ) ) ( not ( = ?auto_846075 ?auto_846078 ) ) ( not ( = ?auto_846075 ?auto_846079 ) ) ( not ( = ?auto_846075 ?auto_846080 ) ) ( not ( = ?auto_846076 ?auto_846077 ) ) ( not ( = ?auto_846076 ?auto_846078 ) ) ( not ( = ?auto_846076 ?auto_846079 ) ) ( not ( = ?auto_846076 ?auto_846080 ) ) ( not ( = ?auto_846077 ?auto_846078 ) ) ( not ( = ?auto_846077 ?auto_846079 ) ) ( not ( = ?auto_846077 ?auto_846080 ) ) ( not ( = ?auto_846078 ?auto_846079 ) ) ( not ( = ?auto_846078 ?auto_846080 ) ) ( not ( = ?auto_846079 ?auto_846080 ) ) ( ON ?auto_846078 ?auto_846079 ) ( ON ?auto_846077 ?auto_846078 ) ( ON ?auto_846076 ?auto_846077 ) ( ON ?auto_846075 ?auto_846076 ) ( ON ?auto_846074 ?auto_846075 ) ( CLEAR ?auto_846072 ) ( ON ?auto_846073 ?auto_846074 ) ( CLEAR ?auto_846073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_846072 ?auto_846073 )
      ( MAKE-8PILE ?auto_846072 ?auto_846073 ?auto_846074 ?auto_846075 ?auto_846076 ?auto_846077 ?auto_846078 ?auto_846079 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_846106 - BLOCK
      ?auto_846107 - BLOCK
      ?auto_846108 - BLOCK
      ?auto_846109 - BLOCK
      ?auto_846110 - BLOCK
      ?auto_846111 - BLOCK
      ?auto_846112 - BLOCK
      ?auto_846113 - BLOCK
    )
    :vars
    (
      ?auto_846114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_846113 ?auto_846114 ) ( not ( = ?auto_846106 ?auto_846107 ) ) ( not ( = ?auto_846106 ?auto_846108 ) ) ( not ( = ?auto_846106 ?auto_846109 ) ) ( not ( = ?auto_846106 ?auto_846110 ) ) ( not ( = ?auto_846106 ?auto_846111 ) ) ( not ( = ?auto_846106 ?auto_846112 ) ) ( not ( = ?auto_846106 ?auto_846113 ) ) ( not ( = ?auto_846106 ?auto_846114 ) ) ( not ( = ?auto_846107 ?auto_846108 ) ) ( not ( = ?auto_846107 ?auto_846109 ) ) ( not ( = ?auto_846107 ?auto_846110 ) ) ( not ( = ?auto_846107 ?auto_846111 ) ) ( not ( = ?auto_846107 ?auto_846112 ) ) ( not ( = ?auto_846107 ?auto_846113 ) ) ( not ( = ?auto_846107 ?auto_846114 ) ) ( not ( = ?auto_846108 ?auto_846109 ) ) ( not ( = ?auto_846108 ?auto_846110 ) ) ( not ( = ?auto_846108 ?auto_846111 ) ) ( not ( = ?auto_846108 ?auto_846112 ) ) ( not ( = ?auto_846108 ?auto_846113 ) ) ( not ( = ?auto_846108 ?auto_846114 ) ) ( not ( = ?auto_846109 ?auto_846110 ) ) ( not ( = ?auto_846109 ?auto_846111 ) ) ( not ( = ?auto_846109 ?auto_846112 ) ) ( not ( = ?auto_846109 ?auto_846113 ) ) ( not ( = ?auto_846109 ?auto_846114 ) ) ( not ( = ?auto_846110 ?auto_846111 ) ) ( not ( = ?auto_846110 ?auto_846112 ) ) ( not ( = ?auto_846110 ?auto_846113 ) ) ( not ( = ?auto_846110 ?auto_846114 ) ) ( not ( = ?auto_846111 ?auto_846112 ) ) ( not ( = ?auto_846111 ?auto_846113 ) ) ( not ( = ?auto_846111 ?auto_846114 ) ) ( not ( = ?auto_846112 ?auto_846113 ) ) ( not ( = ?auto_846112 ?auto_846114 ) ) ( not ( = ?auto_846113 ?auto_846114 ) ) ( ON ?auto_846112 ?auto_846113 ) ( ON ?auto_846111 ?auto_846112 ) ( ON ?auto_846110 ?auto_846111 ) ( ON ?auto_846109 ?auto_846110 ) ( ON ?auto_846108 ?auto_846109 ) ( ON ?auto_846107 ?auto_846108 ) ( ON ?auto_846106 ?auto_846107 ) ( CLEAR ?auto_846106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_846106 )
      ( MAKE-8PILE ?auto_846106 ?auto_846107 ?auto_846108 ?auto_846109 ?auto_846110 ?auto_846111 ?auto_846112 ?auto_846113 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_846141 - BLOCK
      ?auto_846142 - BLOCK
      ?auto_846143 - BLOCK
      ?auto_846144 - BLOCK
      ?auto_846145 - BLOCK
      ?auto_846146 - BLOCK
      ?auto_846147 - BLOCK
      ?auto_846148 - BLOCK
      ?auto_846149 - BLOCK
    )
    :vars
    (
      ?auto_846150 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_846148 ) ( ON ?auto_846149 ?auto_846150 ) ( CLEAR ?auto_846149 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_846141 ) ( ON ?auto_846142 ?auto_846141 ) ( ON ?auto_846143 ?auto_846142 ) ( ON ?auto_846144 ?auto_846143 ) ( ON ?auto_846145 ?auto_846144 ) ( ON ?auto_846146 ?auto_846145 ) ( ON ?auto_846147 ?auto_846146 ) ( ON ?auto_846148 ?auto_846147 ) ( not ( = ?auto_846141 ?auto_846142 ) ) ( not ( = ?auto_846141 ?auto_846143 ) ) ( not ( = ?auto_846141 ?auto_846144 ) ) ( not ( = ?auto_846141 ?auto_846145 ) ) ( not ( = ?auto_846141 ?auto_846146 ) ) ( not ( = ?auto_846141 ?auto_846147 ) ) ( not ( = ?auto_846141 ?auto_846148 ) ) ( not ( = ?auto_846141 ?auto_846149 ) ) ( not ( = ?auto_846141 ?auto_846150 ) ) ( not ( = ?auto_846142 ?auto_846143 ) ) ( not ( = ?auto_846142 ?auto_846144 ) ) ( not ( = ?auto_846142 ?auto_846145 ) ) ( not ( = ?auto_846142 ?auto_846146 ) ) ( not ( = ?auto_846142 ?auto_846147 ) ) ( not ( = ?auto_846142 ?auto_846148 ) ) ( not ( = ?auto_846142 ?auto_846149 ) ) ( not ( = ?auto_846142 ?auto_846150 ) ) ( not ( = ?auto_846143 ?auto_846144 ) ) ( not ( = ?auto_846143 ?auto_846145 ) ) ( not ( = ?auto_846143 ?auto_846146 ) ) ( not ( = ?auto_846143 ?auto_846147 ) ) ( not ( = ?auto_846143 ?auto_846148 ) ) ( not ( = ?auto_846143 ?auto_846149 ) ) ( not ( = ?auto_846143 ?auto_846150 ) ) ( not ( = ?auto_846144 ?auto_846145 ) ) ( not ( = ?auto_846144 ?auto_846146 ) ) ( not ( = ?auto_846144 ?auto_846147 ) ) ( not ( = ?auto_846144 ?auto_846148 ) ) ( not ( = ?auto_846144 ?auto_846149 ) ) ( not ( = ?auto_846144 ?auto_846150 ) ) ( not ( = ?auto_846145 ?auto_846146 ) ) ( not ( = ?auto_846145 ?auto_846147 ) ) ( not ( = ?auto_846145 ?auto_846148 ) ) ( not ( = ?auto_846145 ?auto_846149 ) ) ( not ( = ?auto_846145 ?auto_846150 ) ) ( not ( = ?auto_846146 ?auto_846147 ) ) ( not ( = ?auto_846146 ?auto_846148 ) ) ( not ( = ?auto_846146 ?auto_846149 ) ) ( not ( = ?auto_846146 ?auto_846150 ) ) ( not ( = ?auto_846147 ?auto_846148 ) ) ( not ( = ?auto_846147 ?auto_846149 ) ) ( not ( = ?auto_846147 ?auto_846150 ) ) ( not ( = ?auto_846148 ?auto_846149 ) ) ( not ( = ?auto_846148 ?auto_846150 ) ) ( not ( = ?auto_846149 ?auto_846150 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_846149 ?auto_846150 )
      ( !STACK ?auto_846149 ?auto_846148 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_846179 - BLOCK
      ?auto_846180 - BLOCK
      ?auto_846181 - BLOCK
      ?auto_846182 - BLOCK
      ?auto_846183 - BLOCK
      ?auto_846184 - BLOCK
      ?auto_846185 - BLOCK
      ?auto_846186 - BLOCK
      ?auto_846187 - BLOCK
    )
    :vars
    (
      ?auto_846188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_846187 ?auto_846188 ) ( ON-TABLE ?auto_846179 ) ( ON ?auto_846180 ?auto_846179 ) ( ON ?auto_846181 ?auto_846180 ) ( ON ?auto_846182 ?auto_846181 ) ( ON ?auto_846183 ?auto_846182 ) ( ON ?auto_846184 ?auto_846183 ) ( ON ?auto_846185 ?auto_846184 ) ( not ( = ?auto_846179 ?auto_846180 ) ) ( not ( = ?auto_846179 ?auto_846181 ) ) ( not ( = ?auto_846179 ?auto_846182 ) ) ( not ( = ?auto_846179 ?auto_846183 ) ) ( not ( = ?auto_846179 ?auto_846184 ) ) ( not ( = ?auto_846179 ?auto_846185 ) ) ( not ( = ?auto_846179 ?auto_846186 ) ) ( not ( = ?auto_846179 ?auto_846187 ) ) ( not ( = ?auto_846179 ?auto_846188 ) ) ( not ( = ?auto_846180 ?auto_846181 ) ) ( not ( = ?auto_846180 ?auto_846182 ) ) ( not ( = ?auto_846180 ?auto_846183 ) ) ( not ( = ?auto_846180 ?auto_846184 ) ) ( not ( = ?auto_846180 ?auto_846185 ) ) ( not ( = ?auto_846180 ?auto_846186 ) ) ( not ( = ?auto_846180 ?auto_846187 ) ) ( not ( = ?auto_846180 ?auto_846188 ) ) ( not ( = ?auto_846181 ?auto_846182 ) ) ( not ( = ?auto_846181 ?auto_846183 ) ) ( not ( = ?auto_846181 ?auto_846184 ) ) ( not ( = ?auto_846181 ?auto_846185 ) ) ( not ( = ?auto_846181 ?auto_846186 ) ) ( not ( = ?auto_846181 ?auto_846187 ) ) ( not ( = ?auto_846181 ?auto_846188 ) ) ( not ( = ?auto_846182 ?auto_846183 ) ) ( not ( = ?auto_846182 ?auto_846184 ) ) ( not ( = ?auto_846182 ?auto_846185 ) ) ( not ( = ?auto_846182 ?auto_846186 ) ) ( not ( = ?auto_846182 ?auto_846187 ) ) ( not ( = ?auto_846182 ?auto_846188 ) ) ( not ( = ?auto_846183 ?auto_846184 ) ) ( not ( = ?auto_846183 ?auto_846185 ) ) ( not ( = ?auto_846183 ?auto_846186 ) ) ( not ( = ?auto_846183 ?auto_846187 ) ) ( not ( = ?auto_846183 ?auto_846188 ) ) ( not ( = ?auto_846184 ?auto_846185 ) ) ( not ( = ?auto_846184 ?auto_846186 ) ) ( not ( = ?auto_846184 ?auto_846187 ) ) ( not ( = ?auto_846184 ?auto_846188 ) ) ( not ( = ?auto_846185 ?auto_846186 ) ) ( not ( = ?auto_846185 ?auto_846187 ) ) ( not ( = ?auto_846185 ?auto_846188 ) ) ( not ( = ?auto_846186 ?auto_846187 ) ) ( not ( = ?auto_846186 ?auto_846188 ) ) ( not ( = ?auto_846187 ?auto_846188 ) ) ( CLEAR ?auto_846185 ) ( ON ?auto_846186 ?auto_846187 ) ( CLEAR ?auto_846186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_846179 ?auto_846180 ?auto_846181 ?auto_846182 ?auto_846183 ?auto_846184 ?auto_846185 ?auto_846186 )
      ( MAKE-9PILE ?auto_846179 ?auto_846180 ?auto_846181 ?auto_846182 ?auto_846183 ?auto_846184 ?auto_846185 ?auto_846186 ?auto_846187 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_846217 - BLOCK
      ?auto_846218 - BLOCK
      ?auto_846219 - BLOCK
      ?auto_846220 - BLOCK
      ?auto_846221 - BLOCK
      ?auto_846222 - BLOCK
      ?auto_846223 - BLOCK
      ?auto_846224 - BLOCK
      ?auto_846225 - BLOCK
    )
    :vars
    (
      ?auto_846226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_846225 ?auto_846226 ) ( ON-TABLE ?auto_846217 ) ( ON ?auto_846218 ?auto_846217 ) ( ON ?auto_846219 ?auto_846218 ) ( ON ?auto_846220 ?auto_846219 ) ( ON ?auto_846221 ?auto_846220 ) ( ON ?auto_846222 ?auto_846221 ) ( not ( = ?auto_846217 ?auto_846218 ) ) ( not ( = ?auto_846217 ?auto_846219 ) ) ( not ( = ?auto_846217 ?auto_846220 ) ) ( not ( = ?auto_846217 ?auto_846221 ) ) ( not ( = ?auto_846217 ?auto_846222 ) ) ( not ( = ?auto_846217 ?auto_846223 ) ) ( not ( = ?auto_846217 ?auto_846224 ) ) ( not ( = ?auto_846217 ?auto_846225 ) ) ( not ( = ?auto_846217 ?auto_846226 ) ) ( not ( = ?auto_846218 ?auto_846219 ) ) ( not ( = ?auto_846218 ?auto_846220 ) ) ( not ( = ?auto_846218 ?auto_846221 ) ) ( not ( = ?auto_846218 ?auto_846222 ) ) ( not ( = ?auto_846218 ?auto_846223 ) ) ( not ( = ?auto_846218 ?auto_846224 ) ) ( not ( = ?auto_846218 ?auto_846225 ) ) ( not ( = ?auto_846218 ?auto_846226 ) ) ( not ( = ?auto_846219 ?auto_846220 ) ) ( not ( = ?auto_846219 ?auto_846221 ) ) ( not ( = ?auto_846219 ?auto_846222 ) ) ( not ( = ?auto_846219 ?auto_846223 ) ) ( not ( = ?auto_846219 ?auto_846224 ) ) ( not ( = ?auto_846219 ?auto_846225 ) ) ( not ( = ?auto_846219 ?auto_846226 ) ) ( not ( = ?auto_846220 ?auto_846221 ) ) ( not ( = ?auto_846220 ?auto_846222 ) ) ( not ( = ?auto_846220 ?auto_846223 ) ) ( not ( = ?auto_846220 ?auto_846224 ) ) ( not ( = ?auto_846220 ?auto_846225 ) ) ( not ( = ?auto_846220 ?auto_846226 ) ) ( not ( = ?auto_846221 ?auto_846222 ) ) ( not ( = ?auto_846221 ?auto_846223 ) ) ( not ( = ?auto_846221 ?auto_846224 ) ) ( not ( = ?auto_846221 ?auto_846225 ) ) ( not ( = ?auto_846221 ?auto_846226 ) ) ( not ( = ?auto_846222 ?auto_846223 ) ) ( not ( = ?auto_846222 ?auto_846224 ) ) ( not ( = ?auto_846222 ?auto_846225 ) ) ( not ( = ?auto_846222 ?auto_846226 ) ) ( not ( = ?auto_846223 ?auto_846224 ) ) ( not ( = ?auto_846223 ?auto_846225 ) ) ( not ( = ?auto_846223 ?auto_846226 ) ) ( not ( = ?auto_846224 ?auto_846225 ) ) ( not ( = ?auto_846224 ?auto_846226 ) ) ( not ( = ?auto_846225 ?auto_846226 ) ) ( ON ?auto_846224 ?auto_846225 ) ( CLEAR ?auto_846222 ) ( ON ?auto_846223 ?auto_846224 ) ( CLEAR ?auto_846223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_846217 ?auto_846218 ?auto_846219 ?auto_846220 ?auto_846221 ?auto_846222 ?auto_846223 )
      ( MAKE-9PILE ?auto_846217 ?auto_846218 ?auto_846219 ?auto_846220 ?auto_846221 ?auto_846222 ?auto_846223 ?auto_846224 ?auto_846225 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_846255 - BLOCK
      ?auto_846256 - BLOCK
      ?auto_846257 - BLOCK
      ?auto_846258 - BLOCK
      ?auto_846259 - BLOCK
      ?auto_846260 - BLOCK
      ?auto_846261 - BLOCK
      ?auto_846262 - BLOCK
      ?auto_846263 - BLOCK
    )
    :vars
    (
      ?auto_846264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_846263 ?auto_846264 ) ( ON-TABLE ?auto_846255 ) ( ON ?auto_846256 ?auto_846255 ) ( ON ?auto_846257 ?auto_846256 ) ( ON ?auto_846258 ?auto_846257 ) ( ON ?auto_846259 ?auto_846258 ) ( not ( = ?auto_846255 ?auto_846256 ) ) ( not ( = ?auto_846255 ?auto_846257 ) ) ( not ( = ?auto_846255 ?auto_846258 ) ) ( not ( = ?auto_846255 ?auto_846259 ) ) ( not ( = ?auto_846255 ?auto_846260 ) ) ( not ( = ?auto_846255 ?auto_846261 ) ) ( not ( = ?auto_846255 ?auto_846262 ) ) ( not ( = ?auto_846255 ?auto_846263 ) ) ( not ( = ?auto_846255 ?auto_846264 ) ) ( not ( = ?auto_846256 ?auto_846257 ) ) ( not ( = ?auto_846256 ?auto_846258 ) ) ( not ( = ?auto_846256 ?auto_846259 ) ) ( not ( = ?auto_846256 ?auto_846260 ) ) ( not ( = ?auto_846256 ?auto_846261 ) ) ( not ( = ?auto_846256 ?auto_846262 ) ) ( not ( = ?auto_846256 ?auto_846263 ) ) ( not ( = ?auto_846256 ?auto_846264 ) ) ( not ( = ?auto_846257 ?auto_846258 ) ) ( not ( = ?auto_846257 ?auto_846259 ) ) ( not ( = ?auto_846257 ?auto_846260 ) ) ( not ( = ?auto_846257 ?auto_846261 ) ) ( not ( = ?auto_846257 ?auto_846262 ) ) ( not ( = ?auto_846257 ?auto_846263 ) ) ( not ( = ?auto_846257 ?auto_846264 ) ) ( not ( = ?auto_846258 ?auto_846259 ) ) ( not ( = ?auto_846258 ?auto_846260 ) ) ( not ( = ?auto_846258 ?auto_846261 ) ) ( not ( = ?auto_846258 ?auto_846262 ) ) ( not ( = ?auto_846258 ?auto_846263 ) ) ( not ( = ?auto_846258 ?auto_846264 ) ) ( not ( = ?auto_846259 ?auto_846260 ) ) ( not ( = ?auto_846259 ?auto_846261 ) ) ( not ( = ?auto_846259 ?auto_846262 ) ) ( not ( = ?auto_846259 ?auto_846263 ) ) ( not ( = ?auto_846259 ?auto_846264 ) ) ( not ( = ?auto_846260 ?auto_846261 ) ) ( not ( = ?auto_846260 ?auto_846262 ) ) ( not ( = ?auto_846260 ?auto_846263 ) ) ( not ( = ?auto_846260 ?auto_846264 ) ) ( not ( = ?auto_846261 ?auto_846262 ) ) ( not ( = ?auto_846261 ?auto_846263 ) ) ( not ( = ?auto_846261 ?auto_846264 ) ) ( not ( = ?auto_846262 ?auto_846263 ) ) ( not ( = ?auto_846262 ?auto_846264 ) ) ( not ( = ?auto_846263 ?auto_846264 ) ) ( ON ?auto_846262 ?auto_846263 ) ( ON ?auto_846261 ?auto_846262 ) ( CLEAR ?auto_846259 ) ( ON ?auto_846260 ?auto_846261 ) ( CLEAR ?auto_846260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_846255 ?auto_846256 ?auto_846257 ?auto_846258 ?auto_846259 ?auto_846260 )
      ( MAKE-9PILE ?auto_846255 ?auto_846256 ?auto_846257 ?auto_846258 ?auto_846259 ?auto_846260 ?auto_846261 ?auto_846262 ?auto_846263 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_846293 - BLOCK
      ?auto_846294 - BLOCK
      ?auto_846295 - BLOCK
      ?auto_846296 - BLOCK
      ?auto_846297 - BLOCK
      ?auto_846298 - BLOCK
      ?auto_846299 - BLOCK
      ?auto_846300 - BLOCK
      ?auto_846301 - BLOCK
    )
    :vars
    (
      ?auto_846302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_846301 ?auto_846302 ) ( ON-TABLE ?auto_846293 ) ( ON ?auto_846294 ?auto_846293 ) ( ON ?auto_846295 ?auto_846294 ) ( ON ?auto_846296 ?auto_846295 ) ( not ( = ?auto_846293 ?auto_846294 ) ) ( not ( = ?auto_846293 ?auto_846295 ) ) ( not ( = ?auto_846293 ?auto_846296 ) ) ( not ( = ?auto_846293 ?auto_846297 ) ) ( not ( = ?auto_846293 ?auto_846298 ) ) ( not ( = ?auto_846293 ?auto_846299 ) ) ( not ( = ?auto_846293 ?auto_846300 ) ) ( not ( = ?auto_846293 ?auto_846301 ) ) ( not ( = ?auto_846293 ?auto_846302 ) ) ( not ( = ?auto_846294 ?auto_846295 ) ) ( not ( = ?auto_846294 ?auto_846296 ) ) ( not ( = ?auto_846294 ?auto_846297 ) ) ( not ( = ?auto_846294 ?auto_846298 ) ) ( not ( = ?auto_846294 ?auto_846299 ) ) ( not ( = ?auto_846294 ?auto_846300 ) ) ( not ( = ?auto_846294 ?auto_846301 ) ) ( not ( = ?auto_846294 ?auto_846302 ) ) ( not ( = ?auto_846295 ?auto_846296 ) ) ( not ( = ?auto_846295 ?auto_846297 ) ) ( not ( = ?auto_846295 ?auto_846298 ) ) ( not ( = ?auto_846295 ?auto_846299 ) ) ( not ( = ?auto_846295 ?auto_846300 ) ) ( not ( = ?auto_846295 ?auto_846301 ) ) ( not ( = ?auto_846295 ?auto_846302 ) ) ( not ( = ?auto_846296 ?auto_846297 ) ) ( not ( = ?auto_846296 ?auto_846298 ) ) ( not ( = ?auto_846296 ?auto_846299 ) ) ( not ( = ?auto_846296 ?auto_846300 ) ) ( not ( = ?auto_846296 ?auto_846301 ) ) ( not ( = ?auto_846296 ?auto_846302 ) ) ( not ( = ?auto_846297 ?auto_846298 ) ) ( not ( = ?auto_846297 ?auto_846299 ) ) ( not ( = ?auto_846297 ?auto_846300 ) ) ( not ( = ?auto_846297 ?auto_846301 ) ) ( not ( = ?auto_846297 ?auto_846302 ) ) ( not ( = ?auto_846298 ?auto_846299 ) ) ( not ( = ?auto_846298 ?auto_846300 ) ) ( not ( = ?auto_846298 ?auto_846301 ) ) ( not ( = ?auto_846298 ?auto_846302 ) ) ( not ( = ?auto_846299 ?auto_846300 ) ) ( not ( = ?auto_846299 ?auto_846301 ) ) ( not ( = ?auto_846299 ?auto_846302 ) ) ( not ( = ?auto_846300 ?auto_846301 ) ) ( not ( = ?auto_846300 ?auto_846302 ) ) ( not ( = ?auto_846301 ?auto_846302 ) ) ( ON ?auto_846300 ?auto_846301 ) ( ON ?auto_846299 ?auto_846300 ) ( ON ?auto_846298 ?auto_846299 ) ( CLEAR ?auto_846296 ) ( ON ?auto_846297 ?auto_846298 ) ( CLEAR ?auto_846297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_846293 ?auto_846294 ?auto_846295 ?auto_846296 ?auto_846297 )
      ( MAKE-9PILE ?auto_846293 ?auto_846294 ?auto_846295 ?auto_846296 ?auto_846297 ?auto_846298 ?auto_846299 ?auto_846300 ?auto_846301 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_846331 - BLOCK
      ?auto_846332 - BLOCK
      ?auto_846333 - BLOCK
      ?auto_846334 - BLOCK
      ?auto_846335 - BLOCK
      ?auto_846336 - BLOCK
      ?auto_846337 - BLOCK
      ?auto_846338 - BLOCK
      ?auto_846339 - BLOCK
    )
    :vars
    (
      ?auto_846340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_846339 ?auto_846340 ) ( ON-TABLE ?auto_846331 ) ( ON ?auto_846332 ?auto_846331 ) ( ON ?auto_846333 ?auto_846332 ) ( not ( = ?auto_846331 ?auto_846332 ) ) ( not ( = ?auto_846331 ?auto_846333 ) ) ( not ( = ?auto_846331 ?auto_846334 ) ) ( not ( = ?auto_846331 ?auto_846335 ) ) ( not ( = ?auto_846331 ?auto_846336 ) ) ( not ( = ?auto_846331 ?auto_846337 ) ) ( not ( = ?auto_846331 ?auto_846338 ) ) ( not ( = ?auto_846331 ?auto_846339 ) ) ( not ( = ?auto_846331 ?auto_846340 ) ) ( not ( = ?auto_846332 ?auto_846333 ) ) ( not ( = ?auto_846332 ?auto_846334 ) ) ( not ( = ?auto_846332 ?auto_846335 ) ) ( not ( = ?auto_846332 ?auto_846336 ) ) ( not ( = ?auto_846332 ?auto_846337 ) ) ( not ( = ?auto_846332 ?auto_846338 ) ) ( not ( = ?auto_846332 ?auto_846339 ) ) ( not ( = ?auto_846332 ?auto_846340 ) ) ( not ( = ?auto_846333 ?auto_846334 ) ) ( not ( = ?auto_846333 ?auto_846335 ) ) ( not ( = ?auto_846333 ?auto_846336 ) ) ( not ( = ?auto_846333 ?auto_846337 ) ) ( not ( = ?auto_846333 ?auto_846338 ) ) ( not ( = ?auto_846333 ?auto_846339 ) ) ( not ( = ?auto_846333 ?auto_846340 ) ) ( not ( = ?auto_846334 ?auto_846335 ) ) ( not ( = ?auto_846334 ?auto_846336 ) ) ( not ( = ?auto_846334 ?auto_846337 ) ) ( not ( = ?auto_846334 ?auto_846338 ) ) ( not ( = ?auto_846334 ?auto_846339 ) ) ( not ( = ?auto_846334 ?auto_846340 ) ) ( not ( = ?auto_846335 ?auto_846336 ) ) ( not ( = ?auto_846335 ?auto_846337 ) ) ( not ( = ?auto_846335 ?auto_846338 ) ) ( not ( = ?auto_846335 ?auto_846339 ) ) ( not ( = ?auto_846335 ?auto_846340 ) ) ( not ( = ?auto_846336 ?auto_846337 ) ) ( not ( = ?auto_846336 ?auto_846338 ) ) ( not ( = ?auto_846336 ?auto_846339 ) ) ( not ( = ?auto_846336 ?auto_846340 ) ) ( not ( = ?auto_846337 ?auto_846338 ) ) ( not ( = ?auto_846337 ?auto_846339 ) ) ( not ( = ?auto_846337 ?auto_846340 ) ) ( not ( = ?auto_846338 ?auto_846339 ) ) ( not ( = ?auto_846338 ?auto_846340 ) ) ( not ( = ?auto_846339 ?auto_846340 ) ) ( ON ?auto_846338 ?auto_846339 ) ( ON ?auto_846337 ?auto_846338 ) ( ON ?auto_846336 ?auto_846337 ) ( ON ?auto_846335 ?auto_846336 ) ( CLEAR ?auto_846333 ) ( ON ?auto_846334 ?auto_846335 ) ( CLEAR ?auto_846334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_846331 ?auto_846332 ?auto_846333 ?auto_846334 )
      ( MAKE-9PILE ?auto_846331 ?auto_846332 ?auto_846333 ?auto_846334 ?auto_846335 ?auto_846336 ?auto_846337 ?auto_846338 ?auto_846339 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_846369 - BLOCK
      ?auto_846370 - BLOCK
      ?auto_846371 - BLOCK
      ?auto_846372 - BLOCK
      ?auto_846373 - BLOCK
      ?auto_846374 - BLOCK
      ?auto_846375 - BLOCK
      ?auto_846376 - BLOCK
      ?auto_846377 - BLOCK
    )
    :vars
    (
      ?auto_846378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_846377 ?auto_846378 ) ( ON-TABLE ?auto_846369 ) ( ON ?auto_846370 ?auto_846369 ) ( not ( = ?auto_846369 ?auto_846370 ) ) ( not ( = ?auto_846369 ?auto_846371 ) ) ( not ( = ?auto_846369 ?auto_846372 ) ) ( not ( = ?auto_846369 ?auto_846373 ) ) ( not ( = ?auto_846369 ?auto_846374 ) ) ( not ( = ?auto_846369 ?auto_846375 ) ) ( not ( = ?auto_846369 ?auto_846376 ) ) ( not ( = ?auto_846369 ?auto_846377 ) ) ( not ( = ?auto_846369 ?auto_846378 ) ) ( not ( = ?auto_846370 ?auto_846371 ) ) ( not ( = ?auto_846370 ?auto_846372 ) ) ( not ( = ?auto_846370 ?auto_846373 ) ) ( not ( = ?auto_846370 ?auto_846374 ) ) ( not ( = ?auto_846370 ?auto_846375 ) ) ( not ( = ?auto_846370 ?auto_846376 ) ) ( not ( = ?auto_846370 ?auto_846377 ) ) ( not ( = ?auto_846370 ?auto_846378 ) ) ( not ( = ?auto_846371 ?auto_846372 ) ) ( not ( = ?auto_846371 ?auto_846373 ) ) ( not ( = ?auto_846371 ?auto_846374 ) ) ( not ( = ?auto_846371 ?auto_846375 ) ) ( not ( = ?auto_846371 ?auto_846376 ) ) ( not ( = ?auto_846371 ?auto_846377 ) ) ( not ( = ?auto_846371 ?auto_846378 ) ) ( not ( = ?auto_846372 ?auto_846373 ) ) ( not ( = ?auto_846372 ?auto_846374 ) ) ( not ( = ?auto_846372 ?auto_846375 ) ) ( not ( = ?auto_846372 ?auto_846376 ) ) ( not ( = ?auto_846372 ?auto_846377 ) ) ( not ( = ?auto_846372 ?auto_846378 ) ) ( not ( = ?auto_846373 ?auto_846374 ) ) ( not ( = ?auto_846373 ?auto_846375 ) ) ( not ( = ?auto_846373 ?auto_846376 ) ) ( not ( = ?auto_846373 ?auto_846377 ) ) ( not ( = ?auto_846373 ?auto_846378 ) ) ( not ( = ?auto_846374 ?auto_846375 ) ) ( not ( = ?auto_846374 ?auto_846376 ) ) ( not ( = ?auto_846374 ?auto_846377 ) ) ( not ( = ?auto_846374 ?auto_846378 ) ) ( not ( = ?auto_846375 ?auto_846376 ) ) ( not ( = ?auto_846375 ?auto_846377 ) ) ( not ( = ?auto_846375 ?auto_846378 ) ) ( not ( = ?auto_846376 ?auto_846377 ) ) ( not ( = ?auto_846376 ?auto_846378 ) ) ( not ( = ?auto_846377 ?auto_846378 ) ) ( ON ?auto_846376 ?auto_846377 ) ( ON ?auto_846375 ?auto_846376 ) ( ON ?auto_846374 ?auto_846375 ) ( ON ?auto_846373 ?auto_846374 ) ( ON ?auto_846372 ?auto_846373 ) ( CLEAR ?auto_846370 ) ( ON ?auto_846371 ?auto_846372 ) ( CLEAR ?auto_846371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_846369 ?auto_846370 ?auto_846371 )
      ( MAKE-9PILE ?auto_846369 ?auto_846370 ?auto_846371 ?auto_846372 ?auto_846373 ?auto_846374 ?auto_846375 ?auto_846376 ?auto_846377 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_846407 - BLOCK
      ?auto_846408 - BLOCK
      ?auto_846409 - BLOCK
      ?auto_846410 - BLOCK
      ?auto_846411 - BLOCK
      ?auto_846412 - BLOCK
      ?auto_846413 - BLOCK
      ?auto_846414 - BLOCK
      ?auto_846415 - BLOCK
    )
    :vars
    (
      ?auto_846416 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_846415 ?auto_846416 ) ( ON-TABLE ?auto_846407 ) ( not ( = ?auto_846407 ?auto_846408 ) ) ( not ( = ?auto_846407 ?auto_846409 ) ) ( not ( = ?auto_846407 ?auto_846410 ) ) ( not ( = ?auto_846407 ?auto_846411 ) ) ( not ( = ?auto_846407 ?auto_846412 ) ) ( not ( = ?auto_846407 ?auto_846413 ) ) ( not ( = ?auto_846407 ?auto_846414 ) ) ( not ( = ?auto_846407 ?auto_846415 ) ) ( not ( = ?auto_846407 ?auto_846416 ) ) ( not ( = ?auto_846408 ?auto_846409 ) ) ( not ( = ?auto_846408 ?auto_846410 ) ) ( not ( = ?auto_846408 ?auto_846411 ) ) ( not ( = ?auto_846408 ?auto_846412 ) ) ( not ( = ?auto_846408 ?auto_846413 ) ) ( not ( = ?auto_846408 ?auto_846414 ) ) ( not ( = ?auto_846408 ?auto_846415 ) ) ( not ( = ?auto_846408 ?auto_846416 ) ) ( not ( = ?auto_846409 ?auto_846410 ) ) ( not ( = ?auto_846409 ?auto_846411 ) ) ( not ( = ?auto_846409 ?auto_846412 ) ) ( not ( = ?auto_846409 ?auto_846413 ) ) ( not ( = ?auto_846409 ?auto_846414 ) ) ( not ( = ?auto_846409 ?auto_846415 ) ) ( not ( = ?auto_846409 ?auto_846416 ) ) ( not ( = ?auto_846410 ?auto_846411 ) ) ( not ( = ?auto_846410 ?auto_846412 ) ) ( not ( = ?auto_846410 ?auto_846413 ) ) ( not ( = ?auto_846410 ?auto_846414 ) ) ( not ( = ?auto_846410 ?auto_846415 ) ) ( not ( = ?auto_846410 ?auto_846416 ) ) ( not ( = ?auto_846411 ?auto_846412 ) ) ( not ( = ?auto_846411 ?auto_846413 ) ) ( not ( = ?auto_846411 ?auto_846414 ) ) ( not ( = ?auto_846411 ?auto_846415 ) ) ( not ( = ?auto_846411 ?auto_846416 ) ) ( not ( = ?auto_846412 ?auto_846413 ) ) ( not ( = ?auto_846412 ?auto_846414 ) ) ( not ( = ?auto_846412 ?auto_846415 ) ) ( not ( = ?auto_846412 ?auto_846416 ) ) ( not ( = ?auto_846413 ?auto_846414 ) ) ( not ( = ?auto_846413 ?auto_846415 ) ) ( not ( = ?auto_846413 ?auto_846416 ) ) ( not ( = ?auto_846414 ?auto_846415 ) ) ( not ( = ?auto_846414 ?auto_846416 ) ) ( not ( = ?auto_846415 ?auto_846416 ) ) ( ON ?auto_846414 ?auto_846415 ) ( ON ?auto_846413 ?auto_846414 ) ( ON ?auto_846412 ?auto_846413 ) ( ON ?auto_846411 ?auto_846412 ) ( ON ?auto_846410 ?auto_846411 ) ( ON ?auto_846409 ?auto_846410 ) ( CLEAR ?auto_846407 ) ( ON ?auto_846408 ?auto_846409 ) ( CLEAR ?auto_846408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_846407 ?auto_846408 )
      ( MAKE-9PILE ?auto_846407 ?auto_846408 ?auto_846409 ?auto_846410 ?auto_846411 ?auto_846412 ?auto_846413 ?auto_846414 ?auto_846415 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_846445 - BLOCK
      ?auto_846446 - BLOCK
      ?auto_846447 - BLOCK
      ?auto_846448 - BLOCK
      ?auto_846449 - BLOCK
      ?auto_846450 - BLOCK
      ?auto_846451 - BLOCK
      ?auto_846452 - BLOCK
      ?auto_846453 - BLOCK
    )
    :vars
    (
      ?auto_846454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_846453 ?auto_846454 ) ( not ( = ?auto_846445 ?auto_846446 ) ) ( not ( = ?auto_846445 ?auto_846447 ) ) ( not ( = ?auto_846445 ?auto_846448 ) ) ( not ( = ?auto_846445 ?auto_846449 ) ) ( not ( = ?auto_846445 ?auto_846450 ) ) ( not ( = ?auto_846445 ?auto_846451 ) ) ( not ( = ?auto_846445 ?auto_846452 ) ) ( not ( = ?auto_846445 ?auto_846453 ) ) ( not ( = ?auto_846445 ?auto_846454 ) ) ( not ( = ?auto_846446 ?auto_846447 ) ) ( not ( = ?auto_846446 ?auto_846448 ) ) ( not ( = ?auto_846446 ?auto_846449 ) ) ( not ( = ?auto_846446 ?auto_846450 ) ) ( not ( = ?auto_846446 ?auto_846451 ) ) ( not ( = ?auto_846446 ?auto_846452 ) ) ( not ( = ?auto_846446 ?auto_846453 ) ) ( not ( = ?auto_846446 ?auto_846454 ) ) ( not ( = ?auto_846447 ?auto_846448 ) ) ( not ( = ?auto_846447 ?auto_846449 ) ) ( not ( = ?auto_846447 ?auto_846450 ) ) ( not ( = ?auto_846447 ?auto_846451 ) ) ( not ( = ?auto_846447 ?auto_846452 ) ) ( not ( = ?auto_846447 ?auto_846453 ) ) ( not ( = ?auto_846447 ?auto_846454 ) ) ( not ( = ?auto_846448 ?auto_846449 ) ) ( not ( = ?auto_846448 ?auto_846450 ) ) ( not ( = ?auto_846448 ?auto_846451 ) ) ( not ( = ?auto_846448 ?auto_846452 ) ) ( not ( = ?auto_846448 ?auto_846453 ) ) ( not ( = ?auto_846448 ?auto_846454 ) ) ( not ( = ?auto_846449 ?auto_846450 ) ) ( not ( = ?auto_846449 ?auto_846451 ) ) ( not ( = ?auto_846449 ?auto_846452 ) ) ( not ( = ?auto_846449 ?auto_846453 ) ) ( not ( = ?auto_846449 ?auto_846454 ) ) ( not ( = ?auto_846450 ?auto_846451 ) ) ( not ( = ?auto_846450 ?auto_846452 ) ) ( not ( = ?auto_846450 ?auto_846453 ) ) ( not ( = ?auto_846450 ?auto_846454 ) ) ( not ( = ?auto_846451 ?auto_846452 ) ) ( not ( = ?auto_846451 ?auto_846453 ) ) ( not ( = ?auto_846451 ?auto_846454 ) ) ( not ( = ?auto_846452 ?auto_846453 ) ) ( not ( = ?auto_846452 ?auto_846454 ) ) ( not ( = ?auto_846453 ?auto_846454 ) ) ( ON ?auto_846452 ?auto_846453 ) ( ON ?auto_846451 ?auto_846452 ) ( ON ?auto_846450 ?auto_846451 ) ( ON ?auto_846449 ?auto_846450 ) ( ON ?auto_846448 ?auto_846449 ) ( ON ?auto_846447 ?auto_846448 ) ( ON ?auto_846446 ?auto_846447 ) ( ON ?auto_846445 ?auto_846446 ) ( CLEAR ?auto_846445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_846445 )
      ( MAKE-9PILE ?auto_846445 ?auto_846446 ?auto_846447 ?auto_846448 ?auto_846449 ?auto_846450 ?auto_846451 ?auto_846452 ?auto_846453 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_846484 - BLOCK
      ?auto_846485 - BLOCK
      ?auto_846486 - BLOCK
      ?auto_846487 - BLOCK
      ?auto_846488 - BLOCK
      ?auto_846489 - BLOCK
      ?auto_846490 - BLOCK
      ?auto_846491 - BLOCK
      ?auto_846492 - BLOCK
      ?auto_846493 - BLOCK
    )
    :vars
    (
      ?auto_846494 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_846492 ) ( ON ?auto_846493 ?auto_846494 ) ( CLEAR ?auto_846493 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_846484 ) ( ON ?auto_846485 ?auto_846484 ) ( ON ?auto_846486 ?auto_846485 ) ( ON ?auto_846487 ?auto_846486 ) ( ON ?auto_846488 ?auto_846487 ) ( ON ?auto_846489 ?auto_846488 ) ( ON ?auto_846490 ?auto_846489 ) ( ON ?auto_846491 ?auto_846490 ) ( ON ?auto_846492 ?auto_846491 ) ( not ( = ?auto_846484 ?auto_846485 ) ) ( not ( = ?auto_846484 ?auto_846486 ) ) ( not ( = ?auto_846484 ?auto_846487 ) ) ( not ( = ?auto_846484 ?auto_846488 ) ) ( not ( = ?auto_846484 ?auto_846489 ) ) ( not ( = ?auto_846484 ?auto_846490 ) ) ( not ( = ?auto_846484 ?auto_846491 ) ) ( not ( = ?auto_846484 ?auto_846492 ) ) ( not ( = ?auto_846484 ?auto_846493 ) ) ( not ( = ?auto_846484 ?auto_846494 ) ) ( not ( = ?auto_846485 ?auto_846486 ) ) ( not ( = ?auto_846485 ?auto_846487 ) ) ( not ( = ?auto_846485 ?auto_846488 ) ) ( not ( = ?auto_846485 ?auto_846489 ) ) ( not ( = ?auto_846485 ?auto_846490 ) ) ( not ( = ?auto_846485 ?auto_846491 ) ) ( not ( = ?auto_846485 ?auto_846492 ) ) ( not ( = ?auto_846485 ?auto_846493 ) ) ( not ( = ?auto_846485 ?auto_846494 ) ) ( not ( = ?auto_846486 ?auto_846487 ) ) ( not ( = ?auto_846486 ?auto_846488 ) ) ( not ( = ?auto_846486 ?auto_846489 ) ) ( not ( = ?auto_846486 ?auto_846490 ) ) ( not ( = ?auto_846486 ?auto_846491 ) ) ( not ( = ?auto_846486 ?auto_846492 ) ) ( not ( = ?auto_846486 ?auto_846493 ) ) ( not ( = ?auto_846486 ?auto_846494 ) ) ( not ( = ?auto_846487 ?auto_846488 ) ) ( not ( = ?auto_846487 ?auto_846489 ) ) ( not ( = ?auto_846487 ?auto_846490 ) ) ( not ( = ?auto_846487 ?auto_846491 ) ) ( not ( = ?auto_846487 ?auto_846492 ) ) ( not ( = ?auto_846487 ?auto_846493 ) ) ( not ( = ?auto_846487 ?auto_846494 ) ) ( not ( = ?auto_846488 ?auto_846489 ) ) ( not ( = ?auto_846488 ?auto_846490 ) ) ( not ( = ?auto_846488 ?auto_846491 ) ) ( not ( = ?auto_846488 ?auto_846492 ) ) ( not ( = ?auto_846488 ?auto_846493 ) ) ( not ( = ?auto_846488 ?auto_846494 ) ) ( not ( = ?auto_846489 ?auto_846490 ) ) ( not ( = ?auto_846489 ?auto_846491 ) ) ( not ( = ?auto_846489 ?auto_846492 ) ) ( not ( = ?auto_846489 ?auto_846493 ) ) ( not ( = ?auto_846489 ?auto_846494 ) ) ( not ( = ?auto_846490 ?auto_846491 ) ) ( not ( = ?auto_846490 ?auto_846492 ) ) ( not ( = ?auto_846490 ?auto_846493 ) ) ( not ( = ?auto_846490 ?auto_846494 ) ) ( not ( = ?auto_846491 ?auto_846492 ) ) ( not ( = ?auto_846491 ?auto_846493 ) ) ( not ( = ?auto_846491 ?auto_846494 ) ) ( not ( = ?auto_846492 ?auto_846493 ) ) ( not ( = ?auto_846492 ?auto_846494 ) ) ( not ( = ?auto_846493 ?auto_846494 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_846493 ?auto_846494 )
      ( !STACK ?auto_846493 ?auto_846492 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_846526 - BLOCK
      ?auto_846527 - BLOCK
      ?auto_846528 - BLOCK
      ?auto_846529 - BLOCK
      ?auto_846530 - BLOCK
      ?auto_846531 - BLOCK
      ?auto_846532 - BLOCK
      ?auto_846533 - BLOCK
      ?auto_846534 - BLOCK
      ?auto_846535 - BLOCK
    )
    :vars
    (
      ?auto_846536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_846535 ?auto_846536 ) ( ON-TABLE ?auto_846526 ) ( ON ?auto_846527 ?auto_846526 ) ( ON ?auto_846528 ?auto_846527 ) ( ON ?auto_846529 ?auto_846528 ) ( ON ?auto_846530 ?auto_846529 ) ( ON ?auto_846531 ?auto_846530 ) ( ON ?auto_846532 ?auto_846531 ) ( ON ?auto_846533 ?auto_846532 ) ( not ( = ?auto_846526 ?auto_846527 ) ) ( not ( = ?auto_846526 ?auto_846528 ) ) ( not ( = ?auto_846526 ?auto_846529 ) ) ( not ( = ?auto_846526 ?auto_846530 ) ) ( not ( = ?auto_846526 ?auto_846531 ) ) ( not ( = ?auto_846526 ?auto_846532 ) ) ( not ( = ?auto_846526 ?auto_846533 ) ) ( not ( = ?auto_846526 ?auto_846534 ) ) ( not ( = ?auto_846526 ?auto_846535 ) ) ( not ( = ?auto_846526 ?auto_846536 ) ) ( not ( = ?auto_846527 ?auto_846528 ) ) ( not ( = ?auto_846527 ?auto_846529 ) ) ( not ( = ?auto_846527 ?auto_846530 ) ) ( not ( = ?auto_846527 ?auto_846531 ) ) ( not ( = ?auto_846527 ?auto_846532 ) ) ( not ( = ?auto_846527 ?auto_846533 ) ) ( not ( = ?auto_846527 ?auto_846534 ) ) ( not ( = ?auto_846527 ?auto_846535 ) ) ( not ( = ?auto_846527 ?auto_846536 ) ) ( not ( = ?auto_846528 ?auto_846529 ) ) ( not ( = ?auto_846528 ?auto_846530 ) ) ( not ( = ?auto_846528 ?auto_846531 ) ) ( not ( = ?auto_846528 ?auto_846532 ) ) ( not ( = ?auto_846528 ?auto_846533 ) ) ( not ( = ?auto_846528 ?auto_846534 ) ) ( not ( = ?auto_846528 ?auto_846535 ) ) ( not ( = ?auto_846528 ?auto_846536 ) ) ( not ( = ?auto_846529 ?auto_846530 ) ) ( not ( = ?auto_846529 ?auto_846531 ) ) ( not ( = ?auto_846529 ?auto_846532 ) ) ( not ( = ?auto_846529 ?auto_846533 ) ) ( not ( = ?auto_846529 ?auto_846534 ) ) ( not ( = ?auto_846529 ?auto_846535 ) ) ( not ( = ?auto_846529 ?auto_846536 ) ) ( not ( = ?auto_846530 ?auto_846531 ) ) ( not ( = ?auto_846530 ?auto_846532 ) ) ( not ( = ?auto_846530 ?auto_846533 ) ) ( not ( = ?auto_846530 ?auto_846534 ) ) ( not ( = ?auto_846530 ?auto_846535 ) ) ( not ( = ?auto_846530 ?auto_846536 ) ) ( not ( = ?auto_846531 ?auto_846532 ) ) ( not ( = ?auto_846531 ?auto_846533 ) ) ( not ( = ?auto_846531 ?auto_846534 ) ) ( not ( = ?auto_846531 ?auto_846535 ) ) ( not ( = ?auto_846531 ?auto_846536 ) ) ( not ( = ?auto_846532 ?auto_846533 ) ) ( not ( = ?auto_846532 ?auto_846534 ) ) ( not ( = ?auto_846532 ?auto_846535 ) ) ( not ( = ?auto_846532 ?auto_846536 ) ) ( not ( = ?auto_846533 ?auto_846534 ) ) ( not ( = ?auto_846533 ?auto_846535 ) ) ( not ( = ?auto_846533 ?auto_846536 ) ) ( not ( = ?auto_846534 ?auto_846535 ) ) ( not ( = ?auto_846534 ?auto_846536 ) ) ( not ( = ?auto_846535 ?auto_846536 ) ) ( CLEAR ?auto_846533 ) ( ON ?auto_846534 ?auto_846535 ) ( CLEAR ?auto_846534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_846526 ?auto_846527 ?auto_846528 ?auto_846529 ?auto_846530 ?auto_846531 ?auto_846532 ?auto_846533 ?auto_846534 )
      ( MAKE-10PILE ?auto_846526 ?auto_846527 ?auto_846528 ?auto_846529 ?auto_846530 ?auto_846531 ?auto_846532 ?auto_846533 ?auto_846534 ?auto_846535 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_846568 - BLOCK
      ?auto_846569 - BLOCK
      ?auto_846570 - BLOCK
      ?auto_846571 - BLOCK
      ?auto_846572 - BLOCK
      ?auto_846573 - BLOCK
      ?auto_846574 - BLOCK
      ?auto_846575 - BLOCK
      ?auto_846576 - BLOCK
      ?auto_846577 - BLOCK
    )
    :vars
    (
      ?auto_846578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_846577 ?auto_846578 ) ( ON-TABLE ?auto_846568 ) ( ON ?auto_846569 ?auto_846568 ) ( ON ?auto_846570 ?auto_846569 ) ( ON ?auto_846571 ?auto_846570 ) ( ON ?auto_846572 ?auto_846571 ) ( ON ?auto_846573 ?auto_846572 ) ( ON ?auto_846574 ?auto_846573 ) ( not ( = ?auto_846568 ?auto_846569 ) ) ( not ( = ?auto_846568 ?auto_846570 ) ) ( not ( = ?auto_846568 ?auto_846571 ) ) ( not ( = ?auto_846568 ?auto_846572 ) ) ( not ( = ?auto_846568 ?auto_846573 ) ) ( not ( = ?auto_846568 ?auto_846574 ) ) ( not ( = ?auto_846568 ?auto_846575 ) ) ( not ( = ?auto_846568 ?auto_846576 ) ) ( not ( = ?auto_846568 ?auto_846577 ) ) ( not ( = ?auto_846568 ?auto_846578 ) ) ( not ( = ?auto_846569 ?auto_846570 ) ) ( not ( = ?auto_846569 ?auto_846571 ) ) ( not ( = ?auto_846569 ?auto_846572 ) ) ( not ( = ?auto_846569 ?auto_846573 ) ) ( not ( = ?auto_846569 ?auto_846574 ) ) ( not ( = ?auto_846569 ?auto_846575 ) ) ( not ( = ?auto_846569 ?auto_846576 ) ) ( not ( = ?auto_846569 ?auto_846577 ) ) ( not ( = ?auto_846569 ?auto_846578 ) ) ( not ( = ?auto_846570 ?auto_846571 ) ) ( not ( = ?auto_846570 ?auto_846572 ) ) ( not ( = ?auto_846570 ?auto_846573 ) ) ( not ( = ?auto_846570 ?auto_846574 ) ) ( not ( = ?auto_846570 ?auto_846575 ) ) ( not ( = ?auto_846570 ?auto_846576 ) ) ( not ( = ?auto_846570 ?auto_846577 ) ) ( not ( = ?auto_846570 ?auto_846578 ) ) ( not ( = ?auto_846571 ?auto_846572 ) ) ( not ( = ?auto_846571 ?auto_846573 ) ) ( not ( = ?auto_846571 ?auto_846574 ) ) ( not ( = ?auto_846571 ?auto_846575 ) ) ( not ( = ?auto_846571 ?auto_846576 ) ) ( not ( = ?auto_846571 ?auto_846577 ) ) ( not ( = ?auto_846571 ?auto_846578 ) ) ( not ( = ?auto_846572 ?auto_846573 ) ) ( not ( = ?auto_846572 ?auto_846574 ) ) ( not ( = ?auto_846572 ?auto_846575 ) ) ( not ( = ?auto_846572 ?auto_846576 ) ) ( not ( = ?auto_846572 ?auto_846577 ) ) ( not ( = ?auto_846572 ?auto_846578 ) ) ( not ( = ?auto_846573 ?auto_846574 ) ) ( not ( = ?auto_846573 ?auto_846575 ) ) ( not ( = ?auto_846573 ?auto_846576 ) ) ( not ( = ?auto_846573 ?auto_846577 ) ) ( not ( = ?auto_846573 ?auto_846578 ) ) ( not ( = ?auto_846574 ?auto_846575 ) ) ( not ( = ?auto_846574 ?auto_846576 ) ) ( not ( = ?auto_846574 ?auto_846577 ) ) ( not ( = ?auto_846574 ?auto_846578 ) ) ( not ( = ?auto_846575 ?auto_846576 ) ) ( not ( = ?auto_846575 ?auto_846577 ) ) ( not ( = ?auto_846575 ?auto_846578 ) ) ( not ( = ?auto_846576 ?auto_846577 ) ) ( not ( = ?auto_846576 ?auto_846578 ) ) ( not ( = ?auto_846577 ?auto_846578 ) ) ( ON ?auto_846576 ?auto_846577 ) ( CLEAR ?auto_846574 ) ( ON ?auto_846575 ?auto_846576 ) ( CLEAR ?auto_846575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_846568 ?auto_846569 ?auto_846570 ?auto_846571 ?auto_846572 ?auto_846573 ?auto_846574 ?auto_846575 )
      ( MAKE-10PILE ?auto_846568 ?auto_846569 ?auto_846570 ?auto_846571 ?auto_846572 ?auto_846573 ?auto_846574 ?auto_846575 ?auto_846576 ?auto_846577 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_846610 - BLOCK
      ?auto_846611 - BLOCK
      ?auto_846612 - BLOCK
      ?auto_846613 - BLOCK
      ?auto_846614 - BLOCK
      ?auto_846615 - BLOCK
      ?auto_846616 - BLOCK
      ?auto_846617 - BLOCK
      ?auto_846618 - BLOCK
      ?auto_846619 - BLOCK
    )
    :vars
    (
      ?auto_846620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_846619 ?auto_846620 ) ( ON-TABLE ?auto_846610 ) ( ON ?auto_846611 ?auto_846610 ) ( ON ?auto_846612 ?auto_846611 ) ( ON ?auto_846613 ?auto_846612 ) ( ON ?auto_846614 ?auto_846613 ) ( ON ?auto_846615 ?auto_846614 ) ( not ( = ?auto_846610 ?auto_846611 ) ) ( not ( = ?auto_846610 ?auto_846612 ) ) ( not ( = ?auto_846610 ?auto_846613 ) ) ( not ( = ?auto_846610 ?auto_846614 ) ) ( not ( = ?auto_846610 ?auto_846615 ) ) ( not ( = ?auto_846610 ?auto_846616 ) ) ( not ( = ?auto_846610 ?auto_846617 ) ) ( not ( = ?auto_846610 ?auto_846618 ) ) ( not ( = ?auto_846610 ?auto_846619 ) ) ( not ( = ?auto_846610 ?auto_846620 ) ) ( not ( = ?auto_846611 ?auto_846612 ) ) ( not ( = ?auto_846611 ?auto_846613 ) ) ( not ( = ?auto_846611 ?auto_846614 ) ) ( not ( = ?auto_846611 ?auto_846615 ) ) ( not ( = ?auto_846611 ?auto_846616 ) ) ( not ( = ?auto_846611 ?auto_846617 ) ) ( not ( = ?auto_846611 ?auto_846618 ) ) ( not ( = ?auto_846611 ?auto_846619 ) ) ( not ( = ?auto_846611 ?auto_846620 ) ) ( not ( = ?auto_846612 ?auto_846613 ) ) ( not ( = ?auto_846612 ?auto_846614 ) ) ( not ( = ?auto_846612 ?auto_846615 ) ) ( not ( = ?auto_846612 ?auto_846616 ) ) ( not ( = ?auto_846612 ?auto_846617 ) ) ( not ( = ?auto_846612 ?auto_846618 ) ) ( not ( = ?auto_846612 ?auto_846619 ) ) ( not ( = ?auto_846612 ?auto_846620 ) ) ( not ( = ?auto_846613 ?auto_846614 ) ) ( not ( = ?auto_846613 ?auto_846615 ) ) ( not ( = ?auto_846613 ?auto_846616 ) ) ( not ( = ?auto_846613 ?auto_846617 ) ) ( not ( = ?auto_846613 ?auto_846618 ) ) ( not ( = ?auto_846613 ?auto_846619 ) ) ( not ( = ?auto_846613 ?auto_846620 ) ) ( not ( = ?auto_846614 ?auto_846615 ) ) ( not ( = ?auto_846614 ?auto_846616 ) ) ( not ( = ?auto_846614 ?auto_846617 ) ) ( not ( = ?auto_846614 ?auto_846618 ) ) ( not ( = ?auto_846614 ?auto_846619 ) ) ( not ( = ?auto_846614 ?auto_846620 ) ) ( not ( = ?auto_846615 ?auto_846616 ) ) ( not ( = ?auto_846615 ?auto_846617 ) ) ( not ( = ?auto_846615 ?auto_846618 ) ) ( not ( = ?auto_846615 ?auto_846619 ) ) ( not ( = ?auto_846615 ?auto_846620 ) ) ( not ( = ?auto_846616 ?auto_846617 ) ) ( not ( = ?auto_846616 ?auto_846618 ) ) ( not ( = ?auto_846616 ?auto_846619 ) ) ( not ( = ?auto_846616 ?auto_846620 ) ) ( not ( = ?auto_846617 ?auto_846618 ) ) ( not ( = ?auto_846617 ?auto_846619 ) ) ( not ( = ?auto_846617 ?auto_846620 ) ) ( not ( = ?auto_846618 ?auto_846619 ) ) ( not ( = ?auto_846618 ?auto_846620 ) ) ( not ( = ?auto_846619 ?auto_846620 ) ) ( ON ?auto_846618 ?auto_846619 ) ( ON ?auto_846617 ?auto_846618 ) ( CLEAR ?auto_846615 ) ( ON ?auto_846616 ?auto_846617 ) ( CLEAR ?auto_846616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_846610 ?auto_846611 ?auto_846612 ?auto_846613 ?auto_846614 ?auto_846615 ?auto_846616 )
      ( MAKE-10PILE ?auto_846610 ?auto_846611 ?auto_846612 ?auto_846613 ?auto_846614 ?auto_846615 ?auto_846616 ?auto_846617 ?auto_846618 ?auto_846619 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_846652 - BLOCK
      ?auto_846653 - BLOCK
      ?auto_846654 - BLOCK
      ?auto_846655 - BLOCK
      ?auto_846656 - BLOCK
      ?auto_846657 - BLOCK
      ?auto_846658 - BLOCK
      ?auto_846659 - BLOCK
      ?auto_846660 - BLOCK
      ?auto_846661 - BLOCK
    )
    :vars
    (
      ?auto_846662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_846661 ?auto_846662 ) ( ON-TABLE ?auto_846652 ) ( ON ?auto_846653 ?auto_846652 ) ( ON ?auto_846654 ?auto_846653 ) ( ON ?auto_846655 ?auto_846654 ) ( ON ?auto_846656 ?auto_846655 ) ( not ( = ?auto_846652 ?auto_846653 ) ) ( not ( = ?auto_846652 ?auto_846654 ) ) ( not ( = ?auto_846652 ?auto_846655 ) ) ( not ( = ?auto_846652 ?auto_846656 ) ) ( not ( = ?auto_846652 ?auto_846657 ) ) ( not ( = ?auto_846652 ?auto_846658 ) ) ( not ( = ?auto_846652 ?auto_846659 ) ) ( not ( = ?auto_846652 ?auto_846660 ) ) ( not ( = ?auto_846652 ?auto_846661 ) ) ( not ( = ?auto_846652 ?auto_846662 ) ) ( not ( = ?auto_846653 ?auto_846654 ) ) ( not ( = ?auto_846653 ?auto_846655 ) ) ( not ( = ?auto_846653 ?auto_846656 ) ) ( not ( = ?auto_846653 ?auto_846657 ) ) ( not ( = ?auto_846653 ?auto_846658 ) ) ( not ( = ?auto_846653 ?auto_846659 ) ) ( not ( = ?auto_846653 ?auto_846660 ) ) ( not ( = ?auto_846653 ?auto_846661 ) ) ( not ( = ?auto_846653 ?auto_846662 ) ) ( not ( = ?auto_846654 ?auto_846655 ) ) ( not ( = ?auto_846654 ?auto_846656 ) ) ( not ( = ?auto_846654 ?auto_846657 ) ) ( not ( = ?auto_846654 ?auto_846658 ) ) ( not ( = ?auto_846654 ?auto_846659 ) ) ( not ( = ?auto_846654 ?auto_846660 ) ) ( not ( = ?auto_846654 ?auto_846661 ) ) ( not ( = ?auto_846654 ?auto_846662 ) ) ( not ( = ?auto_846655 ?auto_846656 ) ) ( not ( = ?auto_846655 ?auto_846657 ) ) ( not ( = ?auto_846655 ?auto_846658 ) ) ( not ( = ?auto_846655 ?auto_846659 ) ) ( not ( = ?auto_846655 ?auto_846660 ) ) ( not ( = ?auto_846655 ?auto_846661 ) ) ( not ( = ?auto_846655 ?auto_846662 ) ) ( not ( = ?auto_846656 ?auto_846657 ) ) ( not ( = ?auto_846656 ?auto_846658 ) ) ( not ( = ?auto_846656 ?auto_846659 ) ) ( not ( = ?auto_846656 ?auto_846660 ) ) ( not ( = ?auto_846656 ?auto_846661 ) ) ( not ( = ?auto_846656 ?auto_846662 ) ) ( not ( = ?auto_846657 ?auto_846658 ) ) ( not ( = ?auto_846657 ?auto_846659 ) ) ( not ( = ?auto_846657 ?auto_846660 ) ) ( not ( = ?auto_846657 ?auto_846661 ) ) ( not ( = ?auto_846657 ?auto_846662 ) ) ( not ( = ?auto_846658 ?auto_846659 ) ) ( not ( = ?auto_846658 ?auto_846660 ) ) ( not ( = ?auto_846658 ?auto_846661 ) ) ( not ( = ?auto_846658 ?auto_846662 ) ) ( not ( = ?auto_846659 ?auto_846660 ) ) ( not ( = ?auto_846659 ?auto_846661 ) ) ( not ( = ?auto_846659 ?auto_846662 ) ) ( not ( = ?auto_846660 ?auto_846661 ) ) ( not ( = ?auto_846660 ?auto_846662 ) ) ( not ( = ?auto_846661 ?auto_846662 ) ) ( ON ?auto_846660 ?auto_846661 ) ( ON ?auto_846659 ?auto_846660 ) ( ON ?auto_846658 ?auto_846659 ) ( CLEAR ?auto_846656 ) ( ON ?auto_846657 ?auto_846658 ) ( CLEAR ?auto_846657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_846652 ?auto_846653 ?auto_846654 ?auto_846655 ?auto_846656 ?auto_846657 )
      ( MAKE-10PILE ?auto_846652 ?auto_846653 ?auto_846654 ?auto_846655 ?auto_846656 ?auto_846657 ?auto_846658 ?auto_846659 ?auto_846660 ?auto_846661 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_846694 - BLOCK
      ?auto_846695 - BLOCK
      ?auto_846696 - BLOCK
      ?auto_846697 - BLOCK
      ?auto_846698 - BLOCK
      ?auto_846699 - BLOCK
      ?auto_846700 - BLOCK
      ?auto_846701 - BLOCK
      ?auto_846702 - BLOCK
      ?auto_846703 - BLOCK
    )
    :vars
    (
      ?auto_846704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_846703 ?auto_846704 ) ( ON-TABLE ?auto_846694 ) ( ON ?auto_846695 ?auto_846694 ) ( ON ?auto_846696 ?auto_846695 ) ( ON ?auto_846697 ?auto_846696 ) ( not ( = ?auto_846694 ?auto_846695 ) ) ( not ( = ?auto_846694 ?auto_846696 ) ) ( not ( = ?auto_846694 ?auto_846697 ) ) ( not ( = ?auto_846694 ?auto_846698 ) ) ( not ( = ?auto_846694 ?auto_846699 ) ) ( not ( = ?auto_846694 ?auto_846700 ) ) ( not ( = ?auto_846694 ?auto_846701 ) ) ( not ( = ?auto_846694 ?auto_846702 ) ) ( not ( = ?auto_846694 ?auto_846703 ) ) ( not ( = ?auto_846694 ?auto_846704 ) ) ( not ( = ?auto_846695 ?auto_846696 ) ) ( not ( = ?auto_846695 ?auto_846697 ) ) ( not ( = ?auto_846695 ?auto_846698 ) ) ( not ( = ?auto_846695 ?auto_846699 ) ) ( not ( = ?auto_846695 ?auto_846700 ) ) ( not ( = ?auto_846695 ?auto_846701 ) ) ( not ( = ?auto_846695 ?auto_846702 ) ) ( not ( = ?auto_846695 ?auto_846703 ) ) ( not ( = ?auto_846695 ?auto_846704 ) ) ( not ( = ?auto_846696 ?auto_846697 ) ) ( not ( = ?auto_846696 ?auto_846698 ) ) ( not ( = ?auto_846696 ?auto_846699 ) ) ( not ( = ?auto_846696 ?auto_846700 ) ) ( not ( = ?auto_846696 ?auto_846701 ) ) ( not ( = ?auto_846696 ?auto_846702 ) ) ( not ( = ?auto_846696 ?auto_846703 ) ) ( not ( = ?auto_846696 ?auto_846704 ) ) ( not ( = ?auto_846697 ?auto_846698 ) ) ( not ( = ?auto_846697 ?auto_846699 ) ) ( not ( = ?auto_846697 ?auto_846700 ) ) ( not ( = ?auto_846697 ?auto_846701 ) ) ( not ( = ?auto_846697 ?auto_846702 ) ) ( not ( = ?auto_846697 ?auto_846703 ) ) ( not ( = ?auto_846697 ?auto_846704 ) ) ( not ( = ?auto_846698 ?auto_846699 ) ) ( not ( = ?auto_846698 ?auto_846700 ) ) ( not ( = ?auto_846698 ?auto_846701 ) ) ( not ( = ?auto_846698 ?auto_846702 ) ) ( not ( = ?auto_846698 ?auto_846703 ) ) ( not ( = ?auto_846698 ?auto_846704 ) ) ( not ( = ?auto_846699 ?auto_846700 ) ) ( not ( = ?auto_846699 ?auto_846701 ) ) ( not ( = ?auto_846699 ?auto_846702 ) ) ( not ( = ?auto_846699 ?auto_846703 ) ) ( not ( = ?auto_846699 ?auto_846704 ) ) ( not ( = ?auto_846700 ?auto_846701 ) ) ( not ( = ?auto_846700 ?auto_846702 ) ) ( not ( = ?auto_846700 ?auto_846703 ) ) ( not ( = ?auto_846700 ?auto_846704 ) ) ( not ( = ?auto_846701 ?auto_846702 ) ) ( not ( = ?auto_846701 ?auto_846703 ) ) ( not ( = ?auto_846701 ?auto_846704 ) ) ( not ( = ?auto_846702 ?auto_846703 ) ) ( not ( = ?auto_846702 ?auto_846704 ) ) ( not ( = ?auto_846703 ?auto_846704 ) ) ( ON ?auto_846702 ?auto_846703 ) ( ON ?auto_846701 ?auto_846702 ) ( ON ?auto_846700 ?auto_846701 ) ( ON ?auto_846699 ?auto_846700 ) ( CLEAR ?auto_846697 ) ( ON ?auto_846698 ?auto_846699 ) ( CLEAR ?auto_846698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_846694 ?auto_846695 ?auto_846696 ?auto_846697 ?auto_846698 )
      ( MAKE-10PILE ?auto_846694 ?auto_846695 ?auto_846696 ?auto_846697 ?auto_846698 ?auto_846699 ?auto_846700 ?auto_846701 ?auto_846702 ?auto_846703 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_846736 - BLOCK
      ?auto_846737 - BLOCK
      ?auto_846738 - BLOCK
      ?auto_846739 - BLOCK
      ?auto_846740 - BLOCK
      ?auto_846741 - BLOCK
      ?auto_846742 - BLOCK
      ?auto_846743 - BLOCK
      ?auto_846744 - BLOCK
      ?auto_846745 - BLOCK
    )
    :vars
    (
      ?auto_846746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_846745 ?auto_846746 ) ( ON-TABLE ?auto_846736 ) ( ON ?auto_846737 ?auto_846736 ) ( ON ?auto_846738 ?auto_846737 ) ( not ( = ?auto_846736 ?auto_846737 ) ) ( not ( = ?auto_846736 ?auto_846738 ) ) ( not ( = ?auto_846736 ?auto_846739 ) ) ( not ( = ?auto_846736 ?auto_846740 ) ) ( not ( = ?auto_846736 ?auto_846741 ) ) ( not ( = ?auto_846736 ?auto_846742 ) ) ( not ( = ?auto_846736 ?auto_846743 ) ) ( not ( = ?auto_846736 ?auto_846744 ) ) ( not ( = ?auto_846736 ?auto_846745 ) ) ( not ( = ?auto_846736 ?auto_846746 ) ) ( not ( = ?auto_846737 ?auto_846738 ) ) ( not ( = ?auto_846737 ?auto_846739 ) ) ( not ( = ?auto_846737 ?auto_846740 ) ) ( not ( = ?auto_846737 ?auto_846741 ) ) ( not ( = ?auto_846737 ?auto_846742 ) ) ( not ( = ?auto_846737 ?auto_846743 ) ) ( not ( = ?auto_846737 ?auto_846744 ) ) ( not ( = ?auto_846737 ?auto_846745 ) ) ( not ( = ?auto_846737 ?auto_846746 ) ) ( not ( = ?auto_846738 ?auto_846739 ) ) ( not ( = ?auto_846738 ?auto_846740 ) ) ( not ( = ?auto_846738 ?auto_846741 ) ) ( not ( = ?auto_846738 ?auto_846742 ) ) ( not ( = ?auto_846738 ?auto_846743 ) ) ( not ( = ?auto_846738 ?auto_846744 ) ) ( not ( = ?auto_846738 ?auto_846745 ) ) ( not ( = ?auto_846738 ?auto_846746 ) ) ( not ( = ?auto_846739 ?auto_846740 ) ) ( not ( = ?auto_846739 ?auto_846741 ) ) ( not ( = ?auto_846739 ?auto_846742 ) ) ( not ( = ?auto_846739 ?auto_846743 ) ) ( not ( = ?auto_846739 ?auto_846744 ) ) ( not ( = ?auto_846739 ?auto_846745 ) ) ( not ( = ?auto_846739 ?auto_846746 ) ) ( not ( = ?auto_846740 ?auto_846741 ) ) ( not ( = ?auto_846740 ?auto_846742 ) ) ( not ( = ?auto_846740 ?auto_846743 ) ) ( not ( = ?auto_846740 ?auto_846744 ) ) ( not ( = ?auto_846740 ?auto_846745 ) ) ( not ( = ?auto_846740 ?auto_846746 ) ) ( not ( = ?auto_846741 ?auto_846742 ) ) ( not ( = ?auto_846741 ?auto_846743 ) ) ( not ( = ?auto_846741 ?auto_846744 ) ) ( not ( = ?auto_846741 ?auto_846745 ) ) ( not ( = ?auto_846741 ?auto_846746 ) ) ( not ( = ?auto_846742 ?auto_846743 ) ) ( not ( = ?auto_846742 ?auto_846744 ) ) ( not ( = ?auto_846742 ?auto_846745 ) ) ( not ( = ?auto_846742 ?auto_846746 ) ) ( not ( = ?auto_846743 ?auto_846744 ) ) ( not ( = ?auto_846743 ?auto_846745 ) ) ( not ( = ?auto_846743 ?auto_846746 ) ) ( not ( = ?auto_846744 ?auto_846745 ) ) ( not ( = ?auto_846744 ?auto_846746 ) ) ( not ( = ?auto_846745 ?auto_846746 ) ) ( ON ?auto_846744 ?auto_846745 ) ( ON ?auto_846743 ?auto_846744 ) ( ON ?auto_846742 ?auto_846743 ) ( ON ?auto_846741 ?auto_846742 ) ( ON ?auto_846740 ?auto_846741 ) ( CLEAR ?auto_846738 ) ( ON ?auto_846739 ?auto_846740 ) ( CLEAR ?auto_846739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_846736 ?auto_846737 ?auto_846738 ?auto_846739 )
      ( MAKE-10PILE ?auto_846736 ?auto_846737 ?auto_846738 ?auto_846739 ?auto_846740 ?auto_846741 ?auto_846742 ?auto_846743 ?auto_846744 ?auto_846745 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_846778 - BLOCK
      ?auto_846779 - BLOCK
      ?auto_846780 - BLOCK
      ?auto_846781 - BLOCK
      ?auto_846782 - BLOCK
      ?auto_846783 - BLOCK
      ?auto_846784 - BLOCK
      ?auto_846785 - BLOCK
      ?auto_846786 - BLOCK
      ?auto_846787 - BLOCK
    )
    :vars
    (
      ?auto_846788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_846787 ?auto_846788 ) ( ON-TABLE ?auto_846778 ) ( ON ?auto_846779 ?auto_846778 ) ( not ( = ?auto_846778 ?auto_846779 ) ) ( not ( = ?auto_846778 ?auto_846780 ) ) ( not ( = ?auto_846778 ?auto_846781 ) ) ( not ( = ?auto_846778 ?auto_846782 ) ) ( not ( = ?auto_846778 ?auto_846783 ) ) ( not ( = ?auto_846778 ?auto_846784 ) ) ( not ( = ?auto_846778 ?auto_846785 ) ) ( not ( = ?auto_846778 ?auto_846786 ) ) ( not ( = ?auto_846778 ?auto_846787 ) ) ( not ( = ?auto_846778 ?auto_846788 ) ) ( not ( = ?auto_846779 ?auto_846780 ) ) ( not ( = ?auto_846779 ?auto_846781 ) ) ( not ( = ?auto_846779 ?auto_846782 ) ) ( not ( = ?auto_846779 ?auto_846783 ) ) ( not ( = ?auto_846779 ?auto_846784 ) ) ( not ( = ?auto_846779 ?auto_846785 ) ) ( not ( = ?auto_846779 ?auto_846786 ) ) ( not ( = ?auto_846779 ?auto_846787 ) ) ( not ( = ?auto_846779 ?auto_846788 ) ) ( not ( = ?auto_846780 ?auto_846781 ) ) ( not ( = ?auto_846780 ?auto_846782 ) ) ( not ( = ?auto_846780 ?auto_846783 ) ) ( not ( = ?auto_846780 ?auto_846784 ) ) ( not ( = ?auto_846780 ?auto_846785 ) ) ( not ( = ?auto_846780 ?auto_846786 ) ) ( not ( = ?auto_846780 ?auto_846787 ) ) ( not ( = ?auto_846780 ?auto_846788 ) ) ( not ( = ?auto_846781 ?auto_846782 ) ) ( not ( = ?auto_846781 ?auto_846783 ) ) ( not ( = ?auto_846781 ?auto_846784 ) ) ( not ( = ?auto_846781 ?auto_846785 ) ) ( not ( = ?auto_846781 ?auto_846786 ) ) ( not ( = ?auto_846781 ?auto_846787 ) ) ( not ( = ?auto_846781 ?auto_846788 ) ) ( not ( = ?auto_846782 ?auto_846783 ) ) ( not ( = ?auto_846782 ?auto_846784 ) ) ( not ( = ?auto_846782 ?auto_846785 ) ) ( not ( = ?auto_846782 ?auto_846786 ) ) ( not ( = ?auto_846782 ?auto_846787 ) ) ( not ( = ?auto_846782 ?auto_846788 ) ) ( not ( = ?auto_846783 ?auto_846784 ) ) ( not ( = ?auto_846783 ?auto_846785 ) ) ( not ( = ?auto_846783 ?auto_846786 ) ) ( not ( = ?auto_846783 ?auto_846787 ) ) ( not ( = ?auto_846783 ?auto_846788 ) ) ( not ( = ?auto_846784 ?auto_846785 ) ) ( not ( = ?auto_846784 ?auto_846786 ) ) ( not ( = ?auto_846784 ?auto_846787 ) ) ( not ( = ?auto_846784 ?auto_846788 ) ) ( not ( = ?auto_846785 ?auto_846786 ) ) ( not ( = ?auto_846785 ?auto_846787 ) ) ( not ( = ?auto_846785 ?auto_846788 ) ) ( not ( = ?auto_846786 ?auto_846787 ) ) ( not ( = ?auto_846786 ?auto_846788 ) ) ( not ( = ?auto_846787 ?auto_846788 ) ) ( ON ?auto_846786 ?auto_846787 ) ( ON ?auto_846785 ?auto_846786 ) ( ON ?auto_846784 ?auto_846785 ) ( ON ?auto_846783 ?auto_846784 ) ( ON ?auto_846782 ?auto_846783 ) ( ON ?auto_846781 ?auto_846782 ) ( CLEAR ?auto_846779 ) ( ON ?auto_846780 ?auto_846781 ) ( CLEAR ?auto_846780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_846778 ?auto_846779 ?auto_846780 )
      ( MAKE-10PILE ?auto_846778 ?auto_846779 ?auto_846780 ?auto_846781 ?auto_846782 ?auto_846783 ?auto_846784 ?auto_846785 ?auto_846786 ?auto_846787 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_846820 - BLOCK
      ?auto_846821 - BLOCK
      ?auto_846822 - BLOCK
      ?auto_846823 - BLOCK
      ?auto_846824 - BLOCK
      ?auto_846825 - BLOCK
      ?auto_846826 - BLOCK
      ?auto_846827 - BLOCK
      ?auto_846828 - BLOCK
      ?auto_846829 - BLOCK
    )
    :vars
    (
      ?auto_846830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_846829 ?auto_846830 ) ( ON-TABLE ?auto_846820 ) ( not ( = ?auto_846820 ?auto_846821 ) ) ( not ( = ?auto_846820 ?auto_846822 ) ) ( not ( = ?auto_846820 ?auto_846823 ) ) ( not ( = ?auto_846820 ?auto_846824 ) ) ( not ( = ?auto_846820 ?auto_846825 ) ) ( not ( = ?auto_846820 ?auto_846826 ) ) ( not ( = ?auto_846820 ?auto_846827 ) ) ( not ( = ?auto_846820 ?auto_846828 ) ) ( not ( = ?auto_846820 ?auto_846829 ) ) ( not ( = ?auto_846820 ?auto_846830 ) ) ( not ( = ?auto_846821 ?auto_846822 ) ) ( not ( = ?auto_846821 ?auto_846823 ) ) ( not ( = ?auto_846821 ?auto_846824 ) ) ( not ( = ?auto_846821 ?auto_846825 ) ) ( not ( = ?auto_846821 ?auto_846826 ) ) ( not ( = ?auto_846821 ?auto_846827 ) ) ( not ( = ?auto_846821 ?auto_846828 ) ) ( not ( = ?auto_846821 ?auto_846829 ) ) ( not ( = ?auto_846821 ?auto_846830 ) ) ( not ( = ?auto_846822 ?auto_846823 ) ) ( not ( = ?auto_846822 ?auto_846824 ) ) ( not ( = ?auto_846822 ?auto_846825 ) ) ( not ( = ?auto_846822 ?auto_846826 ) ) ( not ( = ?auto_846822 ?auto_846827 ) ) ( not ( = ?auto_846822 ?auto_846828 ) ) ( not ( = ?auto_846822 ?auto_846829 ) ) ( not ( = ?auto_846822 ?auto_846830 ) ) ( not ( = ?auto_846823 ?auto_846824 ) ) ( not ( = ?auto_846823 ?auto_846825 ) ) ( not ( = ?auto_846823 ?auto_846826 ) ) ( not ( = ?auto_846823 ?auto_846827 ) ) ( not ( = ?auto_846823 ?auto_846828 ) ) ( not ( = ?auto_846823 ?auto_846829 ) ) ( not ( = ?auto_846823 ?auto_846830 ) ) ( not ( = ?auto_846824 ?auto_846825 ) ) ( not ( = ?auto_846824 ?auto_846826 ) ) ( not ( = ?auto_846824 ?auto_846827 ) ) ( not ( = ?auto_846824 ?auto_846828 ) ) ( not ( = ?auto_846824 ?auto_846829 ) ) ( not ( = ?auto_846824 ?auto_846830 ) ) ( not ( = ?auto_846825 ?auto_846826 ) ) ( not ( = ?auto_846825 ?auto_846827 ) ) ( not ( = ?auto_846825 ?auto_846828 ) ) ( not ( = ?auto_846825 ?auto_846829 ) ) ( not ( = ?auto_846825 ?auto_846830 ) ) ( not ( = ?auto_846826 ?auto_846827 ) ) ( not ( = ?auto_846826 ?auto_846828 ) ) ( not ( = ?auto_846826 ?auto_846829 ) ) ( not ( = ?auto_846826 ?auto_846830 ) ) ( not ( = ?auto_846827 ?auto_846828 ) ) ( not ( = ?auto_846827 ?auto_846829 ) ) ( not ( = ?auto_846827 ?auto_846830 ) ) ( not ( = ?auto_846828 ?auto_846829 ) ) ( not ( = ?auto_846828 ?auto_846830 ) ) ( not ( = ?auto_846829 ?auto_846830 ) ) ( ON ?auto_846828 ?auto_846829 ) ( ON ?auto_846827 ?auto_846828 ) ( ON ?auto_846826 ?auto_846827 ) ( ON ?auto_846825 ?auto_846826 ) ( ON ?auto_846824 ?auto_846825 ) ( ON ?auto_846823 ?auto_846824 ) ( ON ?auto_846822 ?auto_846823 ) ( CLEAR ?auto_846820 ) ( ON ?auto_846821 ?auto_846822 ) ( CLEAR ?auto_846821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_846820 ?auto_846821 )
      ( MAKE-10PILE ?auto_846820 ?auto_846821 ?auto_846822 ?auto_846823 ?auto_846824 ?auto_846825 ?auto_846826 ?auto_846827 ?auto_846828 ?auto_846829 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_846862 - BLOCK
      ?auto_846863 - BLOCK
      ?auto_846864 - BLOCK
      ?auto_846865 - BLOCK
      ?auto_846866 - BLOCK
      ?auto_846867 - BLOCK
      ?auto_846868 - BLOCK
      ?auto_846869 - BLOCK
      ?auto_846870 - BLOCK
      ?auto_846871 - BLOCK
    )
    :vars
    (
      ?auto_846872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_846871 ?auto_846872 ) ( not ( = ?auto_846862 ?auto_846863 ) ) ( not ( = ?auto_846862 ?auto_846864 ) ) ( not ( = ?auto_846862 ?auto_846865 ) ) ( not ( = ?auto_846862 ?auto_846866 ) ) ( not ( = ?auto_846862 ?auto_846867 ) ) ( not ( = ?auto_846862 ?auto_846868 ) ) ( not ( = ?auto_846862 ?auto_846869 ) ) ( not ( = ?auto_846862 ?auto_846870 ) ) ( not ( = ?auto_846862 ?auto_846871 ) ) ( not ( = ?auto_846862 ?auto_846872 ) ) ( not ( = ?auto_846863 ?auto_846864 ) ) ( not ( = ?auto_846863 ?auto_846865 ) ) ( not ( = ?auto_846863 ?auto_846866 ) ) ( not ( = ?auto_846863 ?auto_846867 ) ) ( not ( = ?auto_846863 ?auto_846868 ) ) ( not ( = ?auto_846863 ?auto_846869 ) ) ( not ( = ?auto_846863 ?auto_846870 ) ) ( not ( = ?auto_846863 ?auto_846871 ) ) ( not ( = ?auto_846863 ?auto_846872 ) ) ( not ( = ?auto_846864 ?auto_846865 ) ) ( not ( = ?auto_846864 ?auto_846866 ) ) ( not ( = ?auto_846864 ?auto_846867 ) ) ( not ( = ?auto_846864 ?auto_846868 ) ) ( not ( = ?auto_846864 ?auto_846869 ) ) ( not ( = ?auto_846864 ?auto_846870 ) ) ( not ( = ?auto_846864 ?auto_846871 ) ) ( not ( = ?auto_846864 ?auto_846872 ) ) ( not ( = ?auto_846865 ?auto_846866 ) ) ( not ( = ?auto_846865 ?auto_846867 ) ) ( not ( = ?auto_846865 ?auto_846868 ) ) ( not ( = ?auto_846865 ?auto_846869 ) ) ( not ( = ?auto_846865 ?auto_846870 ) ) ( not ( = ?auto_846865 ?auto_846871 ) ) ( not ( = ?auto_846865 ?auto_846872 ) ) ( not ( = ?auto_846866 ?auto_846867 ) ) ( not ( = ?auto_846866 ?auto_846868 ) ) ( not ( = ?auto_846866 ?auto_846869 ) ) ( not ( = ?auto_846866 ?auto_846870 ) ) ( not ( = ?auto_846866 ?auto_846871 ) ) ( not ( = ?auto_846866 ?auto_846872 ) ) ( not ( = ?auto_846867 ?auto_846868 ) ) ( not ( = ?auto_846867 ?auto_846869 ) ) ( not ( = ?auto_846867 ?auto_846870 ) ) ( not ( = ?auto_846867 ?auto_846871 ) ) ( not ( = ?auto_846867 ?auto_846872 ) ) ( not ( = ?auto_846868 ?auto_846869 ) ) ( not ( = ?auto_846868 ?auto_846870 ) ) ( not ( = ?auto_846868 ?auto_846871 ) ) ( not ( = ?auto_846868 ?auto_846872 ) ) ( not ( = ?auto_846869 ?auto_846870 ) ) ( not ( = ?auto_846869 ?auto_846871 ) ) ( not ( = ?auto_846869 ?auto_846872 ) ) ( not ( = ?auto_846870 ?auto_846871 ) ) ( not ( = ?auto_846870 ?auto_846872 ) ) ( not ( = ?auto_846871 ?auto_846872 ) ) ( ON ?auto_846870 ?auto_846871 ) ( ON ?auto_846869 ?auto_846870 ) ( ON ?auto_846868 ?auto_846869 ) ( ON ?auto_846867 ?auto_846868 ) ( ON ?auto_846866 ?auto_846867 ) ( ON ?auto_846865 ?auto_846866 ) ( ON ?auto_846864 ?auto_846865 ) ( ON ?auto_846863 ?auto_846864 ) ( ON ?auto_846862 ?auto_846863 ) ( CLEAR ?auto_846862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_846862 )
      ( MAKE-10PILE ?auto_846862 ?auto_846863 ?auto_846864 ?auto_846865 ?auto_846866 ?auto_846867 ?auto_846868 ?auto_846869 ?auto_846870 ?auto_846871 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_846905 - BLOCK
      ?auto_846906 - BLOCK
      ?auto_846907 - BLOCK
      ?auto_846908 - BLOCK
      ?auto_846909 - BLOCK
      ?auto_846910 - BLOCK
      ?auto_846911 - BLOCK
      ?auto_846912 - BLOCK
      ?auto_846913 - BLOCK
      ?auto_846914 - BLOCK
      ?auto_846915 - BLOCK
    )
    :vars
    (
      ?auto_846916 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_846914 ) ( ON ?auto_846915 ?auto_846916 ) ( CLEAR ?auto_846915 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_846905 ) ( ON ?auto_846906 ?auto_846905 ) ( ON ?auto_846907 ?auto_846906 ) ( ON ?auto_846908 ?auto_846907 ) ( ON ?auto_846909 ?auto_846908 ) ( ON ?auto_846910 ?auto_846909 ) ( ON ?auto_846911 ?auto_846910 ) ( ON ?auto_846912 ?auto_846911 ) ( ON ?auto_846913 ?auto_846912 ) ( ON ?auto_846914 ?auto_846913 ) ( not ( = ?auto_846905 ?auto_846906 ) ) ( not ( = ?auto_846905 ?auto_846907 ) ) ( not ( = ?auto_846905 ?auto_846908 ) ) ( not ( = ?auto_846905 ?auto_846909 ) ) ( not ( = ?auto_846905 ?auto_846910 ) ) ( not ( = ?auto_846905 ?auto_846911 ) ) ( not ( = ?auto_846905 ?auto_846912 ) ) ( not ( = ?auto_846905 ?auto_846913 ) ) ( not ( = ?auto_846905 ?auto_846914 ) ) ( not ( = ?auto_846905 ?auto_846915 ) ) ( not ( = ?auto_846905 ?auto_846916 ) ) ( not ( = ?auto_846906 ?auto_846907 ) ) ( not ( = ?auto_846906 ?auto_846908 ) ) ( not ( = ?auto_846906 ?auto_846909 ) ) ( not ( = ?auto_846906 ?auto_846910 ) ) ( not ( = ?auto_846906 ?auto_846911 ) ) ( not ( = ?auto_846906 ?auto_846912 ) ) ( not ( = ?auto_846906 ?auto_846913 ) ) ( not ( = ?auto_846906 ?auto_846914 ) ) ( not ( = ?auto_846906 ?auto_846915 ) ) ( not ( = ?auto_846906 ?auto_846916 ) ) ( not ( = ?auto_846907 ?auto_846908 ) ) ( not ( = ?auto_846907 ?auto_846909 ) ) ( not ( = ?auto_846907 ?auto_846910 ) ) ( not ( = ?auto_846907 ?auto_846911 ) ) ( not ( = ?auto_846907 ?auto_846912 ) ) ( not ( = ?auto_846907 ?auto_846913 ) ) ( not ( = ?auto_846907 ?auto_846914 ) ) ( not ( = ?auto_846907 ?auto_846915 ) ) ( not ( = ?auto_846907 ?auto_846916 ) ) ( not ( = ?auto_846908 ?auto_846909 ) ) ( not ( = ?auto_846908 ?auto_846910 ) ) ( not ( = ?auto_846908 ?auto_846911 ) ) ( not ( = ?auto_846908 ?auto_846912 ) ) ( not ( = ?auto_846908 ?auto_846913 ) ) ( not ( = ?auto_846908 ?auto_846914 ) ) ( not ( = ?auto_846908 ?auto_846915 ) ) ( not ( = ?auto_846908 ?auto_846916 ) ) ( not ( = ?auto_846909 ?auto_846910 ) ) ( not ( = ?auto_846909 ?auto_846911 ) ) ( not ( = ?auto_846909 ?auto_846912 ) ) ( not ( = ?auto_846909 ?auto_846913 ) ) ( not ( = ?auto_846909 ?auto_846914 ) ) ( not ( = ?auto_846909 ?auto_846915 ) ) ( not ( = ?auto_846909 ?auto_846916 ) ) ( not ( = ?auto_846910 ?auto_846911 ) ) ( not ( = ?auto_846910 ?auto_846912 ) ) ( not ( = ?auto_846910 ?auto_846913 ) ) ( not ( = ?auto_846910 ?auto_846914 ) ) ( not ( = ?auto_846910 ?auto_846915 ) ) ( not ( = ?auto_846910 ?auto_846916 ) ) ( not ( = ?auto_846911 ?auto_846912 ) ) ( not ( = ?auto_846911 ?auto_846913 ) ) ( not ( = ?auto_846911 ?auto_846914 ) ) ( not ( = ?auto_846911 ?auto_846915 ) ) ( not ( = ?auto_846911 ?auto_846916 ) ) ( not ( = ?auto_846912 ?auto_846913 ) ) ( not ( = ?auto_846912 ?auto_846914 ) ) ( not ( = ?auto_846912 ?auto_846915 ) ) ( not ( = ?auto_846912 ?auto_846916 ) ) ( not ( = ?auto_846913 ?auto_846914 ) ) ( not ( = ?auto_846913 ?auto_846915 ) ) ( not ( = ?auto_846913 ?auto_846916 ) ) ( not ( = ?auto_846914 ?auto_846915 ) ) ( not ( = ?auto_846914 ?auto_846916 ) ) ( not ( = ?auto_846915 ?auto_846916 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_846915 ?auto_846916 )
      ( !STACK ?auto_846915 ?auto_846914 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_846951 - BLOCK
      ?auto_846952 - BLOCK
      ?auto_846953 - BLOCK
      ?auto_846954 - BLOCK
      ?auto_846955 - BLOCK
      ?auto_846956 - BLOCK
      ?auto_846957 - BLOCK
      ?auto_846958 - BLOCK
      ?auto_846959 - BLOCK
      ?auto_846960 - BLOCK
      ?auto_846961 - BLOCK
    )
    :vars
    (
      ?auto_846962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_846961 ?auto_846962 ) ( ON-TABLE ?auto_846951 ) ( ON ?auto_846952 ?auto_846951 ) ( ON ?auto_846953 ?auto_846952 ) ( ON ?auto_846954 ?auto_846953 ) ( ON ?auto_846955 ?auto_846954 ) ( ON ?auto_846956 ?auto_846955 ) ( ON ?auto_846957 ?auto_846956 ) ( ON ?auto_846958 ?auto_846957 ) ( ON ?auto_846959 ?auto_846958 ) ( not ( = ?auto_846951 ?auto_846952 ) ) ( not ( = ?auto_846951 ?auto_846953 ) ) ( not ( = ?auto_846951 ?auto_846954 ) ) ( not ( = ?auto_846951 ?auto_846955 ) ) ( not ( = ?auto_846951 ?auto_846956 ) ) ( not ( = ?auto_846951 ?auto_846957 ) ) ( not ( = ?auto_846951 ?auto_846958 ) ) ( not ( = ?auto_846951 ?auto_846959 ) ) ( not ( = ?auto_846951 ?auto_846960 ) ) ( not ( = ?auto_846951 ?auto_846961 ) ) ( not ( = ?auto_846951 ?auto_846962 ) ) ( not ( = ?auto_846952 ?auto_846953 ) ) ( not ( = ?auto_846952 ?auto_846954 ) ) ( not ( = ?auto_846952 ?auto_846955 ) ) ( not ( = ?auto_846952 ?auto_846956 ) ) ( not ( = ?auto_846952 ?auto_846957 ) ) ( not ( = ?auto_846952 ?auto_846958 ) ) ( not ( = ?auto_846952 ?auto_846959 ) ) ( not ( = ?auto_846952 ?auto_846960 ) ) ( not ( = ?auto_846952 ?auto_846961 ) ) ( not ( = ?auto_846952 ?auto_846962 ) ) ( not ( = ?auto_846953 ?auto_846954 ) ) ( not ( = ?auto_846953 ?auto_846955 ) ) ( not ( = ?auto_846953 ?auto_846956 ) ) ( not ( = ?auto_846953 ?auto_846957 ) ) ( not ( = ?auto_846953 ?auto_846958 ) ) ( not ( = ?auto_846953 ?auto_846959 ) ) ( not ( = ?auto_846953 ?auto_846960 ) ) ( not ( = ?auto_846953 ?auto_846961 ) ) ( not ( = ?auto_846953 ?auto_846962 ) ) ( not ( = ?auto_846954 ?auto_846955 ) ) ( not ( = ?auto_846954 ?auto_846956 ) ) ( not ( = ?auto_846954 ?auto_846957 ) ) ( not ( = ?auto_846954 ?auto_846958 ) ) ( not ( = ?auto_846954 ?auto_846959 ) ) ( not ( = ?auto_846954 ?auto_846960 ) ) ( not ( = ?auto_846954 ?auto_846961 ) ) ( not ( = ?auto_846954 ?auto_846962 ) ) ( not ( = ?auto_846955 ?auto_846956 ) ) ( not ( = ?auto_846955 ?auto_846957 ) ) ( not ( = ?auto_846955 ?auto_846958 ) ) ( not ( = ?auto_846955 ?auto_846959 ) ) ( not ( = ?auto_846955 ?auto_846960 ) ) ( not ( = ?auto_846955 ?auto_846961 ) ) ( not ( = ?auto_846955 ?auto_846962 ) ) ( not ( = ?auto_846956 ?auto_846957 ) ) ( not ( = ?auto_846956 ?auto_846958 ) ) ( not ( = ?auto_846956 ?auto_846959 ) ) ( not ( = ?auto_846956 ?auto_846960 ) ) ( not ( = ?auto_846956 ?auto_846961 ) ) ( not ( = ?auto_846956 ?auto_846962 ) ) ( not ( = ?auto_846957 ?auto_846958 ) ) ( not ( = ?auto_846957 ?auto_846959 ) ) ( not ( = ?auto_846957 ?auto_846960 ) ) ( not ( = ?auto_846957 ?auto_846961 ) ) ( not ( = ?auto_846957 ?auto_846962 ) ) ( not ( = ?auto_846958 ?auto_846959 ) ) ( not ( = ?auto_846958 ?auto_846960 ) ) ( not ( = ?auto_846958 ?auto_846961 ) ) ( not ( = ?auto_846958 ?auto_846962 ) ) ( not ( = ?auto_846959 ?auto_846960 ) ) ( not ( = ?auto_846959 ?auto_846961 ) ) ( not ( = ?auto_846959 ?auto_846962 ) ) ( not ( = ?auto_846960 ?auto_846961 ) ) ( not ( = ?auto_846960 ?auto_846962 ) ) ( not ( = ?auto_846961 ?auto_846962 ) ) ( CLEAR ?auto_846959 ) ( ON ?auto_846960 ?auto_846961 ) ( CLEAR ?auto_846960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_846951 ?auto_846952 ?auto_846953 ?auto_846954 ?auto_846955 ?auto_846956 ?auto_846957 ?auto_846958 ?auto_846959 ?auto_846960 )
      ( MAKE-11PILE ?auto_846951 ?auto_846952 ?auto_846953 ?auto_846954 ?auto_846955 ?auto_846956 ?auto_846957 ?auto_846958 ?auto_846959 ?auto_846960 ?auto_846961 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_846997 - BLOCK
      ?auto_846998 - BLOCK
      ?auto_846999 - BLOCK
      ?auto_847000 - BLOCK
      ?auto_847001 - BLOCK
      ?auto_847002 - BLOCK
      ?auto_847003 - BLOCK
      ?auto_847004 - BLOCK
      ?auto_847005 - BLOCK
      ?auto_847006 - BLOCK
      ?auto_847007 - BLOCK
    )
    :vars
    (
      ?auto_847008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_847007 ?auto_847008 ) ( ON-TABLE ?auto_846997 ) ( ON ?auto_846998 ?auto_846997 ) ( ON ?auto_846999 ?auto_846998 ) ( ON ?auto_847000 ?auto_846999 ) ( ON ?auto_847001 ?auto_847000 ) ( ON ?auto_847002 ?auto_847001 ) ( ON ?auto_847003 ?auto_847002 ) ( ON ?auto_847004 ?auto_847003 ) ( not ( = ?auto_846997 ?auto_846998 ) ) ( not ( = ?auto_846997 ?auto_846999 ) ) ( not ( = ?auto_846997 ?auto_847000 ) ) ( not ( = ?auto_846997 ?auto_847001 ) ) ( not ( = ?auto_846997 ?auto_847002 ) ) ( not ( = ?auto_846997 ?auto_847003 ) ) ( not ( = ?auto_846997 ?auto_847004 ) ) ( not ( = ?auto_846997 ?auto_847005 ) ) ( not ( = ?auto_846997 ?auto_847006 ) ) ( not ( = ?auto_846997 ?auto_847007 ) ) ( not ( = ?auto_846997 ?auto_847008 ) ) ( not ( = ?auto_846998 ?auto_846999 ) ) ( not ( = ?auto_846998 ?auto_847000 ) ) ( not ( = ?auto_846998 ?auto_847001 ) ) ( not ( = ?auto_846998 ?auto_847002 ) ) ( not ( = ?auto_846998 ?auto_847003 ) ) ( not ( = ?auto_846998 ?auto_847004 ) ) ( not ( = ?auto_846998 ?auto_847005 ) ) ( not ( = ?auto_846998 ?auto_847006 ) ) ( not ( = ?auto_846998 ?auto_847007 ) ) ( not ( = ?auto_846998 ?auto_847008 ) ) ( not ( = ?auto_846999 ?auto_847000 ) ) ( not ( = ?auto_846999 ?auto_847001 ) ) ( not ( = ?auto_846999 ?auto_847002 ) ) ( not ( = ?auto_846999 ?auto_847003 ) ) ( not ( = ?auto_846999 ?auto_847004 ) ) ( not ( = ?auto_846999 ?auto_847005 ) ) ( not ( = ?auto_846999 ?auto_847006 ) ) ( not ( = ?auto_846999 ?auto_847007 ) ) ( not ( = ?auto_846999 ?auto_847008 ) ) ( not ( = ?auto_847000 ?auto_847001 ) ) ( not ( = ?auto_847000 ?auto_847002 ) ) ( not ( = ?auto_847000 ?auto_847003 ) ) ( not ( = ?auto_847000 ?auto_847004 ) ) ( not ( = ?auto_847000 ?auto_847005 ) ) ( not ( = ?auto_847000 ?auto_847006 ) ) ( not ( = ?auto_847000 ?auto_847007 ) ) ( not ( = ?auto_847000 ?auto_847008 ) ) ( not ( = ?auto_847001 ?auto_847002 ) ) ( not ( = ?auto_847001 ?auto_847003 ) ) ( not ( = ?auto_847001 ?auto_847004 ) ) ( not ( = ?auto_847001 ?auto_847005 ) ) ( not ( = ?auto_847001 ?auto_847006 ) ) ( not ( = ?auto_847001 ?auto_847007 ) ) ( not ( = ?auto_847001 ?auto_847008 ) ) ( not ( = ?auto_847002 ?auto_847003 ) ) ( not ( = ?auto_847002 ?auto_847004 ) ) ( not ( = ?auto_847002 ?auto_847005 ) ) ( not ( = ?auto_847002 ?auto_847006 ) ) ( not ( = ?auto_847002 ?auto_847007 ) ) ( not ( = ?auto_847002 ?auto_847008 ) ) ( not ( = ?auto_847003 ?auto_847004 ) ) ( not ( = ?auto_847003 ?auto_847005 ) ) ( not ( = ?auto_847003 ?auto_847006 ) ) ( not ( = ?auto_847003 ?auto_847007 ) ) ( not ( = ?auto_847003 ?auto_847008 ) ) ( not ( = ?auto_847004 ?auto_847005 ) ) ( not ( = ?auto_847004 ?auto_847006 ) ) ( not ( = ?auto_847004 ?auto_847007 ) ) ( not ( = ?auto_847004 ?auto_847008 ) ) ( not ( = ?auto_847005 ?auto_847006 ) ) ( not ( = ?auto_847005 ?auto_847007 ) ) ( not ( = ?auto_847005 ?auto_847008 ) ) ( not ( = ?auto_847006 ?auto_847007 ) ) ( not ( = ?auto_847006 ?auto_847008 ) ) ( not ( = ?auto_847007 ?auto_847008 ) ) ( ON ?auto_847006 ?auto_847007 ) ( CLEAR ?auto_847004 ) ( ON ?auto_847005 ?auto_847006 ) ( CLEAR ?auto_847005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_846997 ?auto_846998 ?auto_846999 ?auto_847000 ?auto_847001 ?auto_847002 ?auto_847003 ?auto_847004 ?auto_847005 )
      ( MAKE-11PILE ?auto_846997 ?auto_846998 ?auto_846999 ?auto_847000 ?auto_847001 ?auto_847002 ?auto_847003 ?auto_847004 ?auto_847005 ?auto_847006 ?auto_847007 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_847043 - BLOCK
      ?auto_847044 - BLOCK
      ?auto_847045 - BLOCK
      ?auto_847046 - BLOCK
      ?auto_847047 - BLOCK
      ?auto_847048 - BLOCK
      ?auto_847049 - BLOCK
      ?auto_847050 - BLOCK
      ?auto_847051 - BLOCK
      ?auto_847052 - BLOCK
      ?auto_847053 - BLOCK
    )
    :vars
    (
      ?auto_847054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_847053 ?auto_847054 ) ( ON-TABLE ?auto_847043 ) ( ON ?auto_847044 ?auto_847043 ) ( ON ?auto_847045 ?auto_847044 ) ( ON ?auto_847046 ?auto_847045 ) ( ON ?auto_847047 ?auto_847046 ) ( ON ?auto_847048 ?auto_847047 ) ( ON ?auto_847049 ?auto_847048 ) ( not ( = ?auto_847043 ?auto_847044 ) ) ( not ( = ?auto_847043 ?auto_847045 ) ) ( not ( = ?auto_847043 ?auto_847046 ) ) ( not ( = ?auto_847043 ?auto_847047 ) ) ( not ( = ?auto_847043 ?auto_847048 ) ) ( not ( = ?auto_847043 ?auto_847049 ) ) ( not ( = ?auto_847043 ?auto_847050 ) ) ( not ( = ?auto_847043 ?auto_847051 ) ) ( not ( = ?auto_847043 ?auto_847052 ) ) ( not ( = ?auto_847043 ?auto_847053 ) ) ( not ( = ?auto_847043 ?auto_847054 ) ) ( not ( = ?auto_847044 ?auto_847045 ) ) ( not ( = ?auto_847044 ?auto_847046 ) ) ( not ( = ?auto_847044 ?auto_847047 ) ) ( not ( = ?auto_847044 ?auto_847048 ) ) ( not ( = ?auto_847044 ?auto_847049 ) ) ( not ( = ?auto_847044 ?auto_847050 ) ) ( not ( = ?auto_847044 ?auto_847051 ) ) ( not ( = ?auto_847044 ?auto_847052 ) ) ( not ( = ?auto_847044 ?auto_847053 ) ) ( not ( = ?auto_847044 ?auto_847054 ) ) ( not ( = ?auto_847045 ?auto_847046 ) ) ( not ( = ?auto_847045 ?auto_847047 ) ) ( not ( = ?auto_847045 ?auto_847048 ) ) ( not ( = ?auto_847045 ?auto_847049 ) ) ( not ( = ?auto_847045 ?auto_847050 ) ) ( not ( = ?auto_847045 ?auto_847051 ) ) ( not ( = ?auto_847045 ?auto_847052 ) ) ( not ( = ?auto_847045 ?auto_847053 ) ) ( not ( = ?auto_847045 ?auto_847054 ) ) ( not ( = ?auto_847046 ?auto_847047 ) ) ( not ( = ?auto_847046 ?auto_847048 ) ) ( not ( = ?auto_847046 ?auto_847049 ) ) ( not ( = ?auto_847046 ?auto_847050 ) ) ( not ( = ?auto_847046 ?auto_847051 ) ) ( not ( = ?auto_847046 ?auto_847052 ) ) ( not ( = ?auto_847046 ?auto_847053 ) ) ( not ( = ?auto_847046 ?auto_847054 ) ) ( not ( = ?auto_847047 ?auto_847048 ) ) ( not ( = ?auto_847047 ?auto_847049 ) ) ( not ( = ?auto_847047 ?auto_847050 ) ) ( not ( = ?auto_847047 ?auto_847051 ) ) ( not ( = ?auto_847047 ?auto_847052 ) ) ( not ( = ?auto_847047 ?auto_847053 ) ) ( not ( = ?auto_847047 ?auto_847054 ) ) ( not ( = ?auto_847048 ?auto_847049 ) ) ( not ( = ?auto_847048 ?auto_847050 ) ) ( not ( = ?auto_847048 ?auto_847051 ) ) ( not ( = ?auto_847048 ?auto_847052 ) ) ( not ( = ?auto_847048 ?auto_847053 ) ) ( not ( = ?auto_847048 ?auto_847054 ) ) ( not ( = ?auto_847049 ?auto_847050 ) ) ( not ( = ?auto_847049 ?auto_847051 ) ) ( not ( = ?auto_847049 ?auto_847052 ) ) ( not ( = ?auto_847049 ?auto_847053 ) ) ( not ( = ?auto_847049 ?auto_847054 ) ) ( not ( = ?auto_847050 ?auto_847051 ) ) ( not ( = ?auto_847050 ?auto_847052 ) ) ( not ( = ?auto_847050 ?auto_847053 ) ) ( not ( = ?auto_847050 ?auto_847054 ) ) ( not ( = ?auto_847051 ?auto_847052 ) ) ( not ( = ?auto_847051 ?auto_847053 ) ) ( not ( = ?auto_847051 ?auto_847054 ) ) ( not ( = ?auto_847052 ?auto_847053 ) ) ( not ( = ?auto_847052 ?auto_847054 ) ) ( not ( = ?auto_847053 ?auto_847054 ) ) ( ON ?auto_847052 ?auto_847053 ) ( ON ?auto_847051 ?auto_847052 ) ( CLEAR ?auto_847049 ) ( ON ?auto_847050 ?auto_847051 ) ( CLEAR ?auto_847050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_847043 ?auto_847044 ?auto_847045 ?auto_847046 ?auto_847047 ?auto_847048 ?auto_847049 ?auto_847050 )
      ( MAKE-11PILE ?auto_847043 ?auto_847044 ?auto_847045 ?auto_847046 ?auto_847047 ?auto_847048 ?auto_847049 ?auto_847050 ?auto_847051 ?auto_847052 ?auto_847053 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_847089 - BLOCK
      ?auto_847090 - BLOCK
      ?auto_847091 - BLOCK
      ?auto_847092 - BLOCK
      ?auto_847093 - BLOCK
      ?auto_847094 - BLOCK
      ?auto_847095 - BLOCK
      ?auto_847096 - BLOCK
      ?auto_847097 - BLOCK
      ?auto_847098 - BLOCK
      ?auto_847099 - BLOCK
    )
    :vars
    (
      ?auto_847100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_847099 ?auto_847100 ) ( ON-TABLE ?auto_847089 ) ( ON ?auto_847090 ?auto_847089 ) ( ON ?auto_847091 ?auto_847090 ) ( ON ?auto_847092 ?auto_847091 ) ( ON ?auto_847093 ?auto_847092 ) ( ON ?auto_847094 ?auto_847093 ) ( not ( = ?auto_847089 ?auto_847090 ) ) ( not ( = ?auto_847089 ?auto_847091 ) ) ( not ( = ?auto_847089 ?auto_847092 ) ) ( not ( = ?auto_847089 ?auto_847093 ) ) ( not ( = ?auto_847089 ?auto_847094 ) ) ( not ( = ?auto_847089 ?auto_847095 ) ) ( not ( = ?auto_847089 ?auto_847096 ) ) ( not ( = ?auto_847089 ?auto_847097 ) ) ( not ( = ?auto_847089 ?auto_847098 ) ) ( not ( = ?auto_847089 ?auto_847099 ) ) ( not ( = ?auto_847089 ?auto_847100 ) ) ( not ( = ?auto_847090 ?auto_847091 ) ) ( not ( = ?auto_847090 ?auto_847092 ) ) ( not ( = ?auto_847090 ?auto_847093 ) ) ( not ( = ?auto_847090 ?auto_847094 ) ) ( not ( = ?auto_847090 ?auto_847095 ) ) ( not ( = ?auto_847090 ?auto_847096 ) ) ( not ( = ?auto_847090 ?auto_847097 ) ) ( not ( = ?auto_847090 ?auto_847098 ) ) ( not ( = ?auto_847090 ?auto_847099 ) ) ( not ( = ?auto_847090 ?auto_847100 ) ) ( not ( = ?auto_847091 ?auto_847092 ) ) ( not ( = ?auto_847091 ?auto_847093 ) ) ( not ( = ?auto_847091 ?auto_847094 ) ) ( not ( = ?auto_847091 ?auto_847095 ) ) ( not ( = ?auto_847091 ?auto_847096 ) ) ( not ( = ?auto_847091 ?auto_847097 ) ) ( not ( = ?auto_847091 ?auto_847098 ) ) ( not ( = ?auto_847091 ?auto_847099 ) ) ( not ( = ?auto_847091 ?auto_847100 ) ) ( not ( = ?auto_847092 ?auto_847093 ) ) ( not ( = ?auto_847092 ?auto_847094 ) ) ( not ( = ?auto_847092 ?auto_847095 ) ) ( not ( = ?auto_847092 ?auto_847096 ) ) ( not ( = ?auto_847092 ?auto_847097 ) ) ( not ( = ?auto_847092 ?auto_847098 ) ) ( not ( = ?auto_847092 ?auto_847099 ) ) ( not ( = ?auto_847092 ?auto_847100 ) ) ( not ( = ?auto_847093 ?auto_847094 ) ) ( not ( = ?auto_847093 ?auto_847095 ) ) ( not ( = ?auto_847093 ?auto_847096 ) ) ( not ( = ?auto_847093 ?auto_847097 ) ) ( not ( = ?auto_847093 ?auto_847098 ) ) ( not ( = ?auto_847093 ?auto_847099 ) ) ( not ( = ?auto_847093 ?auto_847100 ) ) ( not ( = ?auto_847094 ?auto_847095 ) ) ( not ( = ?auto_847094 ?auto_847096 ) ) ( not ( = ?auto_847094 ?auto_847097 ) ) ( not ( = ?auto_847094 ?auto_847098 ) ) ( not ( = ?auto_847094 ?auto_847099 ) ) ( not ( = ?auto_847094 ?auto_847100 ) ) ( not ( = ?auto_847095 ?auto_847096 ) ) ( not ( = ?auto_847095 ?auto_847097 ) ) ( not ( = ?auto_847095 ?auto_847098 ) ) ( not ( = ?auto_847095 ?auto_847099 ) ) ( not ( = ?auto_847095 ?auto_847100 ) ) ( not ( = ?auto_847096 ?auto_847097 ) ) ( not ( = ?auto_847096 ?auto_847098 ) ) ( not ( = ?auto_847096 ?auto_847099 ) ) ( not ( = ?auto_847096 ?auto_847100 ) ) ( not ( = ?auto_847097 ?auto_847098 ) ) ( not ( = ?auto_847097 ?auto_847099 ) ) ( not ( = ?auto_847097 ?auto_847100 ) ) ( not ( = ?auto_847098 ?auto_847099 ) ) ( not ( = ?auto_847098 ?auto_847100 ) ) ( not ( = ?auto_847099 ?auto_847100 ) ) ( ON ?auto_847098 ?auto_847099 ) ( ON ?auto_847097 ?auto_847098 ) ( ON ?auto_847096 ?auto_847097 ) ( CLEAR ?auto_847094 ) ( ON ?auto_847095 ?auto_847096 ) ( CLEAR ?auto_847095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_847089 ?auto_847090 ?auto_847091 ?auto_847092 ?auto_847093 ?auto_847094 ?auto_847095 )
      ( MAKE-11PILE ?auto_847089 ?auto_847090 ?auto_847091 ?auto_847092 ?auto_847093 ?auto_847094 ?auto_847095 ?auto_847096 ?auto_847097 ?auto_847098 ?auto_847099 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_847135 - BLOCK
      ?auto_847136 - BLOCK
      ?auto_847137 - BLOCK
      ?auto_847138 - BLOCK
      ?auto_847139 - BLOCK
      ?auto_847140 - BLOCK
      ?auto_847141 - BLOCK
      ?auto_847142 - BLOCK
      ?auto_847143 - BLOCK
      ?auto_847144 - BLOCK
      ?auto_847145 - BLOCK
    )
    :vars
    (
      ?auto_847146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_847145 ?auto_847146 ) ( ON-TABLE ?auto_847135 ) ( ON ?auto_847136 ?auto_847135 ) ( ON ?auto_847137 ?auto_847136 ) ( ON ?auto_847138 ?auto_847137 ) ( ON ?auto_847139 ?auto_847138 ) ( not ( = ?auto_847135 ?auto_847136 ) ) ( not ( = ?auto_847135 ?auto_847137 ) ) ( not ( = ?auto_847135 ?auto_847138 ) ) ( not ( = ?auto_847135 ?auto_847139 ) ) ( not ( = ?auto_847135 ?auto_847140 ) ) ( not ( = ?auto_847135 ?auto_847141 ) ) ( not ( = ?auto_847135 ?auto_847142 ) ) ( not ( = ?auto_847135 ?auto_847143 ) ) ( not ( = ?auto_847135 ?auto_847144 ) ) ( not ( = ?auto_847135 ?auto_847145 ) ) ( not ( = ?auto_847135 ?auto_847146 ) ) ( not ( = ?auto_847136 ?auto_847137 ) ) ( not ( = ?auto_847136 ?auto_847138 ) ) ( not ( = ?auto_847136 ?auto_847139 ) ) ( not ( = ?auto_847136 ?auto_847140 ) ) ( not ( = ?auto_847136 ?auto_847141 ) ) ( not ( = ?auto_847136 ?auto_847142 ) ) ( not ( = ?auto_847136 ?auto_847143 ) ) ( not ( = ?auto_847136 ?auto_847144 ) ) ( not ( = ?auto_847136 ?auto_847145 ) ) ( not ( = ?auto_847136 ?auto_847146 ) ) ( not ( = ?auto_847137 ?auto_847138 ) ) ( not ( = ?auto_847137 ?auto_847139 ) ) ( not ( = ?auto_847137 ?auto_847140 ) ) ( not ( = ?auto_847137 ?auto_847141 ) ) ( not ( = ?auto_847137 ?auto_847142 ) ) ( not ( = ?auto_847137 ?auto_847143 ) ) ( not ( = ?auto_847137 ?auto_847144 ) ) ( not ( = ?auto_847137 ?auto_847145 ) ) ( not ( = ?auto_847137 ?auto_847146 ) ) ( not ( = ?auto_847138 ?auto_847139 ) ) ( not ( = ?auto_847138 ?auto_847140 ) ) ( not ( = ?auto_847138 ?auto_847141 ) ) ( not ( = ?auto_847138 ?auto_847142 ) ) ( not ( = ?auto_847138 ?auto_847143 ) ) ( not ( = ?auto_847138 ?auto_847144 ) ) ( not ( = ?auto_847138 ?auto_847145 ) ) ( not ( = ?auto_847138 ?auto_847146 ) ) ( not ( = ?auto_847139 ?auto_847140 ) ) ( not ( = ?auto_847139 ?auto_847141 ) ) ( not ( = ?auto_847139 ?auto_847142 ) ) ( not ( = ?auto_847139 ?auto_847143 ) ) ( not ( = ?auto_847139 ?auto_847144 ) ) ( not ( = ?auto_847139 ?auto_847145 ) ) ( not ( = ?auto_847139 ?auto_847146 ) ) ( not ( = ?auto_847140 ?auto_847141 ) ) ( not ( = ?auto_847140 ?auto_847142 ) ) ( not ( = ?auto_847140 ?auto_847143 ) ) ( not ( = ?auto_847140 ?auto_847144 ) ) ( not ( = ?auto_847140 ?auto_847145 ) ) ( not ( = ?auto_847140 ?auto_847146 ) ) ( not ( = ?auto_847141 ?auto_847142 ) ) ( not ( = ?auto_847141 ?auto_847143 ) ) ( not ( = ?auto_847141 ?auto_847144 ) ) ( not ( = ?auto_847141 ?auto_847145 ) ) ( not ( = ?auto_847141 ?auto_847146 ) ) ( not ( = ?auto_847142 ?auto_847143 ) ) ( not ( = ?auto_847142 ?auto_847144 ) ) ( not ( = ?auto_847142 ?auto_847145 ) ) ( not ( = ?auto_847142 ?auto_847146 ) ) ( not ( = ?auto_847143 ?auto_847144 ) ) ( not ( = ?auto_847143 ?auto_847145 ) ) ( not ( = ?auto_847143 ?auto_847146 ) ) ( not ( = ?auto_847144 ?auto_847145 ) ) ( not ( = ?auto_847144 ?auto_847146 ) ) ( not ( = ?auto_847145 ?auto_847146 ) ) ( ON ?auto_847144 ?auto_847145 ) ( ON ?auto_847143 ?auto_847144 ) ( ON ?auto_847142 ?auto_847143 ) ( ON ?auto_847141 ?auto_847142 ) ( CLEAR ?auto_847139 ) ( ON ?auto_847140 ?auto_847141 ) ( CLEAR ?auto_847140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_847135 ?auto_847136 ?auto_847137 ?auto_847138 ?auto_847139 ?auto_847140 )
      ( MAKE-11PILE ?auto_847135 ?auto_847136 ?auto_847137 ?auto_847138 ?auto_847139 ?auto_847140 ?auto_847141 ?auto_847142 ?auto_847143 ?auto_847144 ?auto_847145 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_847181 - BLOCK
      ?auto_847182 - BLOCK
      ?auto_847183 - BLOCK
      ?auto_847184 - BLOCK
      ?auto_847185 - BLOCK
      ?auto_847186 - BLOCK
      ?auto_847187 - BLOCK
      ?auto_847188 - BLOCK
      ?auto_847189 - BLOCK
      ?auto_847190 - BLOCK
      ?auto_847191 - BLOCK
    )
    :vars
    (
      ?auto_847192 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_847191 ?auto_847192 ) ( ON-TABLE ?auto_847181 ) ( ON ?auto_847182 ?auto_847181 ) ( ON ?auto_847183 ?auto_847182 ) ( ON ?auto_847184 ?auto_847183 ) ( not ( = ?auto_847181 ?auto_847182 ) ) ( not ( = ?auto_847181 ?auto_847183 ) ) ( not ( = ?auto_847181 ?auto_847184 ) ) ( not ( = ?auto_847181 ?auto_847185 ) ) ( not ( = ?auto_847181 ?auto_847186 ) ) ( not ( = ?auto_847181 ?auto_847187 ) ) ( not ( = ?auto_847181 ?auto_847188 ) ) ( not ( = ?auto_847181 ?auto_847189 ) ) ( not ( = ?auto_847181 ?auto_847190 ) ) ( not ( = ?auto_847181 ?auto_847191 ) ) ( not ( = ?auto_847181 ?auto_847192 ) ) ( not ( = ?auto_847182 ?auto_847183 ) ) ( not ( = ?auto_847182 ?auto_847184 ) ) ( not ( = ?auto_847182 ?auto_847185 ) ) ( not ( = ?auto_847182 ?auto_847186 ) ) ( not ( = ?auto_847182 ?auto_847187 ) ) ( not ( = ?auto_847182 ?auto_847188 ) ) ( not ( = ?auto_847182 ?auto_847189 ) ) ( not ( = ?auto_847182 ?auto_847190 ) ) ( not ( = ?auto_847182 ?auto_847191 ) ) ( not ( = ?auto_847182 ?auto_847192 ) ) ( not ( = ?auto_847183 ?auto_847184 ) ) ( not ( = ?auto_847183 ?auto_847185 ) ) ( not ( = ?auto_847183 ?auto_847186 ) ) ( not ( = ?auto_847183 ?auto_847187 ) ) ( not ( = ?auto_847183 ?auto_847188 ) ) ( not ( = ?auto_847183 ?auto_847189 ) ) ( not ( = ?auto_847183 ?auto_847190 ) ) ( not ( = ?auto_847183 ?auto_847191 ) ) ( not ( = ?auto_847183 ?auto_847192 ) ) ( not ( = ?auto_847184 ?auto_847185 ) ) ( not ( = ?auto_847184 ?auto_847186 ) ) ( not ( = ?auto_847184 ?auto_847187 ) ) ( not ( = ?auto_847184 ?auto_847188 ) ) ( not ( = ?auto_847184 ?auto_847189 ) ) ( not ( = ?auto_847184 ?auto_847190 ) ) ( not ( = ?auto_847184 ?auto_847191 ) ) ( not ( = ?auto_847184 ?auto_847192 ) ) ( not ( = ?auto_847185 ?auto_847186 ) ) ( not ( = ?auto_847185 ?auto_847187 ) ) ( not ( = ?auto_847185 ?auto_847188 ) ) ( not ( = ?auto_847185 ?auto_847189 ) ) ( not ( = ?auto_847185 ?auto_847190 ) ) ( not ( = ?auto_847185 ?auto_847191 ) ) ( not ( = ?auto_847185 ?auto_847192 ) ) ( not ( = ?auto_847186 ?auto_847187 ) ) ( not ( = ?auto_847186 ?auto_847188 ) ) ( not ( = ?auto_847186 ?auto_847189 ) ) ( not ( = ?auto_847186 ?auto_847190 ) ) ( not ( = ?auto_847186 ?auto_847191 ) ) ( not ( = ?auto_847186 ?auto_847192 ) ) ( not ( = ?auto_847187 ?auto_847188 ) ) ( not ( = ?auto_847187 ?auto_847189 ) ) ( not ( = ?auto_847187 ?auto_847190 ) ) ( not ( = ?auto_847187 ?auto_847191 ) ) ( not ( = ?auto_847187 ?auto_847192 ) ) ( not ( = ?auto_847188 ?auto_847189 ) ) ( not ( = ?auto_847188 ?auto_847190 ) ) ( not ( = ?auto_847188 ?auto_847191 ) ) ( not ( = ?auto_847188 ?auto_847192 ) ) ( not ( = ?auto_847189 ?auto_847190 ) ) ( not ( = ?auto_847189 ?auto_847191 ) ) ( not ( = ?auto_847189 ?auto_847192 ) ) ( not ( = ?auto_847190 ?auto_847191 ) ) ( not ( = ?auto_847190 ?auto_847192 ) ) ( not ( = ?auto_847191 ?auto_847192 ) ) ( ON ?auto_847190 ?auto_847191 ) ( ON ?auto_847189 ?auto_847190 ) ( ON ?auto_847188 ?auto_847189 ) ( ON ?auto_847187 ?auto_847188 ) ( ON ?auto_847186 ?auto_847187 ) ( CLEAR ?auto_847184 ) ( ON ?auto_847185 ?auto_847186 ) ( CLEAR ?auto_847185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_847181 ?auto_847182 ?auto_847183 ?auto_847184 ?auto_847185 )
      ( MAKE-11PILE ?auto_847181 ?auto_847182 ?auto_847183 ?auto_847184 ?auto_847185 ?auto_847186 ?auto_847187 ?auto_847188 ?auto_847189 ?auto_847190 ?auto_847191 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_847227 - BLOCK
      ?auto_847228 - BLOCK
      ?auto_847229 - BLOCK
      ?auto_847230 - BLOCK
      ?auto_847231 - BLOCK
      ?auto_847232 - BLOCK
      ?auto_847233 - BLOCK
      ?auto_847234 - BLOCK
      ?auto_847235 - BLOCK
      ?auto_847236 - BLOCK
      ?auto_847237 - BLOCK
    )
    :vars
    (
      ?auto_847238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_847237 ?auto_847238 ) ( ON-TABLE ?auto_847227 ) ( ON ?auto_847228 ?auto_847227 ) ( ON ?auto_847229 ?auto_847228 ) ( not ( = ?auto_847227 ?auto_847228 ) ) ( not ( = ?auto_847227 ?auto_847229 ) ) ( not ( = ?auto_847227 ?auto_847230 ) ) ( not ( = ?auto_847227 ?auto_847231 ) ) ( not ( = ?auto_847227 ?auto_847232 ) ) ( not ( = ?auto_847227 ?auto_847233 ) ) ( not ( = ?auto_847227 ?auto_847234 ) ) ( not ( = ?auto_847227 ?auto_847235 ) ) ( not ( = ?auto_847227 ?auto_847236 ) ) ( not ( = ?auto_847227 ?auto_847237 ) ) ( not ( = ?auto_847227 ?auto_847238 ) ) ( not ( = ?auto_847228 ?auto_847229 ) ) ( not ( = ?auto_847228 ?auto_847230 ) ) ( not ( = ?auto_847228 ?auto_847231 ) ) ( not ( = ?auto_847228 ?auto_847232 ) ) ( not ( = ?auto_847228 ?auto_847233 ) ) ( not ( = ?auto_847228 ?auto_847234 ) ) ( not ( = ?auto_847228 ?auto_847235 ) ) ( not ( = ?auto_847228 ?auto_847236 ) ) ( not ( = ?auto_847228 ?auto_847237 ) ) ( not ( = ?auto_847228 ?auto_847238 ) ) ( not ( = ?auto_847229 ?auto_847230 ) ) ( not ( = ?auto_847229 ?auto_847231 ) ) ( not ( = ?auto_847229 ?auto_847232 ) ) ( not ( = ?auto_847229 ?auto_847233 ) ) ( not ( = ?auto_847229 ?auto_847234 ) ) ( not ( = ?auto_847229 ?auto_847235 ) ) ( not ( = ?auto_847229 ?auto_847236 ) ) ( not ( = ?auto_847229 ?auto_847237 ) ) ( not ( = ?auto_847229 ?auto_847238 ) ) ( not ( = ?auto_847230 ?auto_847231 ) ) ( not ( = ?auto_847230 ?auto_847232 ) ) ( not ( = ?auto_847230 ?auto_847233 ) ) ( not ( = ?auto_847230 ?auto_847234 ) ) ( not ( = ?auto_847230 ?auto_847235 ) ) ( not ( = ?auto_847230 ?auto_847236 ) ) ( not ( = ?auto_847230 ?auto_847237 ) ) ( not ( = ?auto_847230 ?auto_847238 ) ) ( not ( = ?auto_847231 ?auto_847232 ) ) ( not ( = ?auto_847231 ?auto_847233 ) ) ( not ( = ?auto_847231 ?auto_847234 ) ) ( not ( = ?auto_847231 ?auto_847235 ) ) ( not ( = ?auto_847231 ?auto_847236 ) ) ( not ( = ?auto_847231 ?auto_847237 ) ) ( not ( = ?auto_847231 ?auto_847238 ) ) ( not ( = ?auto_847232 ?auto_847233 ) ) ( not ( = ?auto_847232 ?auto_847234 ) ) ( not ( = ?auto_847232 ?auto_847235 ) ) ( not ( = ?auto_847232 ?auto_847236 ) ) ( not ( = ?auto_847232 ?auto_847237 ) ) ( not ( = ?auto_847232 ?auto_847238 ) ) ( not ( = ?auto_847233 ?auto_847234 ) ) ( not ( = ?auto_847233 ?auto_847235 ) ) ( not ( = ?auto_847233 ?auto_847236 ) ) ( not ( = ?auto_847233 ?auto_847237 ) ) ( not ( = ?auto_847233 ?auto_847238 ) ) ( not ( = ?auto_847234 ?auto_847235 ) ) ( not ( = ?auto_847234 ?auto_847236 ) ) ( not ( = ?auto_847234 ?auto_847237 ) ) ( not ( = ?auto_847234 ?auto_847238 ) ) ( not ( = ?auto_847235 ?auto_847236 ) ) ( not ( = ?auto_847235 ?auto_847237 ) ) ( not ( = ?auto_847235 ?auto_847238 ) ) ( not ( = ?auto_847236 ?auto_847237 ) ) ( not ( = ?auto_847236 ?auto_847238 ) ) ( not ( = ?auto_847237 ?auto_847238 ) ) ( ON ?auto_847236 ?auto_847237 ) ( ON ?auto_847235 ?auto_847236 ) ( ON ?auto_847234 ?auto_847235 ) ( ON ?auto_847233 ?auto_847234 ) ( ON ?auto_847232 ?auto_847233 ) ( ON ?auto_847231 ?auto_847232 ) ( CLEAR ?auto_847229 ) ( ON ?auto_847230 ?auto_847231 ) ( CLEAR ?auto_847230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_847227 ?auto_847228 ?auto_847229 ?auto_847230 )
      ( MAKE-11PILE ?auto_847227 ?auto_847228 ?auto_847229 ?auto_847230 ?auto_847231 ?auto_847232 ?auto_847233 ?auto_847234 ?auto_847235 ?auto_847236 ?auto_847237 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_847273 - BLOCK
      ?auto_847274 - BLOCK
      ?auto_847275 - BLOCK
      ?auto_847276 - BLOCK
      ?auto_847277 - BLOCK
      ?auto_847278 - BLOCK
      ?auto_847279 - BLOCK
      ?auto_847280 - BLOCK
      ?auto_847281 - BLOCK
      ?auto_847282 - BLOCK
      ?auto_847283 - BLOCK
    )
    :vars
    (
      ?auto_847284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_847283 ?auto_847284 ) ( ON-TABLE ?auto_847273 ) ( ON ?auto_847274 ?auto_847273 ) ( not ( = ?auto_847273 ?auto_847274 ) ) ( not ( = ?auto_847273 ?auto_847275 ) ) ( not ( = ?auto_847273 ?auto_847276 ) ) ( not ( = ?auto_847273 ?auto_847277 ) ) ( not ( = ?auto_847273 ?auto_847278 ) ) ( not ( = ?auto_847273 ?auto_847279 ) ) ( not ( = ?auto_847273 ?auto_847280 ) ) ( not ( = ?auto_847273 ?auto_847281 ) ) ( not ( = ?auto_847273 ?auto_847282 ) ) ( not ( = ?auto_847273 ?auto_847283 ) ) ( not ( = ?auto_847273 ?auto_847284 ) ) ( not ( = ?auto_847274 ?auto_847275 ) ) ( not ( = ?auto_847274 ?auto_847276 ) ) ( not ( = ?auto_847274 ?auto_847277 ) ) ( not ( = ?auto_847274 ?auto_847278 ) ) ( not ( = ?auto_847274 ?auto_847279 ) ) ( not ( = ?auto_847274 ?auto_847280 ) ) ( not ( = ?auto_847274 ?auto_847281 ) ) ( not ( = ?auto_847274 ?auto_847282 ) ) ( not ( = ?auto_847274 ?auto_847283 ) ) ( not ( = ?auto_847274 ?auto_847284 ) ) ( not ( = ?auto_847275 ?auto_847276 ) ) ( not ( = ?auto_847275 ?auto_847277 ) ) ( not ( = ?auto_847275 ?auto_847278 ) ) ( not ( = ?auto_847275 ?auto_847279 ) ) ( not ( = ?auto_847275 ?auto_847280 ) ) ( not ( = ?auto_847275 ?auto_847281 ) ) ( not ( = ?auto_847275 ?auto_847282 ) ) ( not ( = ?auto_847275 ?auto_847283 ) ) ( not ( = ?auto_847275 ?auto_847284 ) ) ( not ( = ?auto_847276 ?auto_847277 ) ) ( not ( = ?auto_847276 ?auto_847278 ) ) ( not ( = ?auto_847276 ?auto_847279 ) ) ( not ( = ?auto_847276 ?auto_847280 ) ) ( not ( = ?auto_847276 ?auto_847281 ) ) ( not ( = ?auto_847276 ?auto_847282 ) ) ( not ( = ?auto_847276 ?auto_847283 ) ) ( not ( = ?auto_847276 ?auto_847284 ) ) ( not ( = ?auto_847277 ?auto_847278 ) ) ( not ( = ?auto_847277 ?auto_847279 ) ) ( not ( = ?auto_847277 ?auto_847280 ) ) ( not ( = ?auto_847277 ?auto_847281 ) ) ( not ( = ?auto_847277 ?auto_847282 ) ) ( not ( = ?auto_847277 ?auto_847283 ) ) ( not ( = ?auto_847277 ?auto_847284 ) ) ( not ( = ?auto_847278 ?auto_847279 ) ) ( not ( = ?auto_847278 ?auto_847280 ) ) ( not ( = ?auto_847278 ?auto_847281 ) ) ( not ( = ?auto_847278 ?auto_847282 ) ) ( not ( = ?auto_847278 ?auto_847283 ) ) ( not ( = ?auto_847278 ?auto_847284 ) ) ( not ( = ?auto_847279 ?auto_847280 ) ) ( not ( = ?auto_847279 ?auto_847281 ) ) ( not ( = ?auto_847279 ?auto_847282 ) ) ( not ( = ?auto_847279 ?auto_847283 ) ) ( not ( = ?auto_847279 ?auto_847284 ) ) ( not ( = ?auto_847280 ?auto_847281 ) ) ( not ( = ?auto_847280 ?auto_847282 ) ) ( not ( = ?auto_847280 ?auto_847283 ) ) ( not ( = ?auto_847280 ?auto_847284 ) ) ( not ( = ?auto_847281 ?auto_847282 ) ) ( not ( = ?auto_847281 ?auto_847283 ) ) ( not ( = ?auto_847281 ?auto_847284 ) ) ( not ( = ?auto_847282 ?auto_847283 ) ) ( not ( = ?auto_847282 ?auto_847284 ) ) ( not ( = ?auto_847283 ?auto_847284 ) ) ( ON ?auto_847282 ?auto_847283 ) ( ON ?auto_847281 ?auto_847282 ) ( ON ?auto_847280 ?auto_847281 ) ( ON ?auto_847279 ?auto_847280 ) ( ON ?auto_847278 ?auto_847279 ) ( ON ?auto_847277 ?auto_847278 ) ( ON ?auto_847276 ?auto_847277 ) ( CLEAR ?auto_847274 ) ( ON ?auto_847275 ?auto_847276 ) ( CLEAR ?auto_847275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_847273 ?auto_847274 ?auto_847275 )
      ( MAKE-11PILE ?auto_847273 ?auto_847274 ?auto_847275 ?auto_847276 ?auto_847277 ?auto_847278 ?auto_847279 ?auto_847280 ?auto_847281 ?auto_847282 ?auto_847283 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_847319 - BLOCK
      ?auto_847320 - BLOCK
      ?auto_847321 - BLOCK
      ?auto_847322 - BLOCK
      ?auto_847323 - BLOCK
      ?auto_847324 - BLOCK
      ?auto_847325 - BLOCK
      ?auto_847326 - BLOCK
      ?auto_847327 - BLOCK
      ?auto_847328 - BLOCK
      ?auto_847329 - BLOCK
    )
    :vars
    (
      ?auto_847330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_847329 ?auto_847330 ) ( ON-TABLE ?auto_847319 ) ( not ( = ?auto_847319 ?auto_847320 ) ) ( not ( = ?auto_847319 ?auto_847321 ) ) ( not ( = ?auto_847319 ?auto_847322 ) ) ( not ( = ?auto_847319 ?auto_847323 ) ) ( not ( = ?auto_847319 ?auto_847324 ) ) ( not ( = ?auto_847319 ?auto_847325 ) ) ( not ( = ?auto_847319 ?auto_847326 ) ) ( not ( = ?auto_847319 ?auto_847327 ) ) ( not ( = ?auto_847319 ?auto_847328 ) ) ( not ( = ?auto_847319 ?auto_847329 ) ) ( not ( = ?auto_847319 ?auto_847330 ) ) ( not ( = ?auto_847320 ?auto_847321 ) ) ( not ( = ?auto_847320 ?auto_847322 ) ) ( not ( = ?auto_847320 ?auto_847323 ) ) ( not ( = ?auto_847320 ?auto_847324 ) ) ( not ( = ?auto_847320 ?auto_847325 ) ) ( not ( = ?auto_847320 ?auto_847326 ) ) ( not ( = ?auto_847320 ?auto_847327 ) ) ( not ( = ?auto_847320 ?auto_847328 ) ) ( not ( = ?auto_847320 ?auto_847329 ) ) ( not ( = ?auto_847320 ?auto_847330 ) ) ( not ( = ?auto_847321 ?auto_847322 ) ) ( not ( = ?auto_847321 ?auto_847323 ) ) ( not ( = ?auto_847321 ?auto_847324 ) ) ( not ( = ?auto_847321 ?auto_847325 ) ) ( not ( = ?auto_847321 ?auto_847326 ) ) ( not ( = ?auto_847321 ?auto_847327 ) ) ( not ( = ?auto_847321 ?auto_847328 ) ) ( not ( = ?auto_847321 ?auto_847329 ) ) ( not ( = ?auto_847321 ?auto_847330 ) ) ( not ( = ?auto_847322 ?auto_847323 ) ) ( not ( = ?auto_847322 ?auto_847324 ) ) ( not ( = ?auto_847322 ?auto_847325 ) ) ( not ( = ?auto_847322 ?auto_847326 ) ) ( not ( = ?auto_847322 ?auto_847327 ) ) ( not ( = ?auto_847322 ?auto_847328 ) ) ( not ( = ?auto_847322 ?auto_847329 ) ) ( not ( = ?auto_847322 ?auto_847330 ) ) ( not ( = ?auto_847323 ?auto_847324 ) ) ( not ( = ?auto_847323 ?auto_847325 ) ) ( not ( = ?auto_847323 ?auto_847326 ) ) ( not ( = ?auto_847323 ?auto_847327 ) ) ( not ( = ?auto_847323 ?auto_847328 ) ) ( not ( = ?auto_847323 ?auto_847329 ) ) ( not ( = ?auto_847323 ?auto_847330 ) ) ( not ( = ?auto_847324 ?auto_847325 ) ) ( not ( = ?auto_847324 ?auto_847326 ) ) ( not ( = ?auto_847324 ?auto_847327 ) ) ( not ( = ?auto_847324 ?auto_847328 ) ) ( not ( = ?auto_847324 ?auto_847329 ) ) ( not ( = ?auto_847324 ?auto_847330 ) ) ( not ( = ?auto_847325 ?auto_847326 ) ) ( not ( = ?auto_847325 ?auto_847327 ) ) ( not ( = ?auto_847325 ?auto_847328 ) ) ( not ( = ?auto_847325 ?auto_847329 ) ) ( not ( = ?auto_847325 ?auto_847330 ) ) ( not ( = ?auto_847326 ?auto_847327 ) ) ( not ( = ?auto_847326 ?auto_847328 ) ) ( not ( = ?auto_847326 ?auto_847329 ) ) ( not ( = ?auto_847326 ?auto_847330 ) ) ( not ( = ?auto_847327 ?auto_847328 ) ) ( not ( = ?auto_847327 ?auto_847329 ) ) ( not ( = ?auto_847327 ?auto_847330 ) ) ( not ( = ?auto_847328 ?auto_847329 ) ) ( not ( = ?auto_847328 ?auto_847330 ) ) ( not ( = ?auto_847329 ?auto_847330 ) ) ( ON ?auto_847328 ?auto_847329 ) ( ON ?auto_847327 ?auto_847328 ) ( ON ?auto_847326 ?auto_847327 ) ( ON ?auto_847325 ?auto_847326 ) ( ON ?auto_847324 ?auto_847325 ) ( ON ?auto_847323 ?auto_847324 ) ( ON ?auto_847322 ?auto_847323 ) ( ON ?auto_847321 ?auto_847322 ) ( CLEAR ?auto_847319 ) ( ON ?auto_847320 ?auto_847321 ) ( CLEAR ?auto_847320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_847319 ?auto_847320 )
      ( MAKE-11PILE ?auto_847319 ?auto_847320 ?auto_847321 ?auto_847322 ?auto_847323 ?auto_847324 ?auto_847325 ?auto_847326 ?auto_847327 ?auto_847328 ?auto_847329 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_847365 - BLOCK
      ?auto_847366 - BLOCK
      ?auto_847367 - BLOCK
      ?auto_847368 - BLOCK
      ?auto_847369 - BLOCK
      ?auto_847370 - BLOCK
      ?auto_847371 - BLOCK
      ?auto_847372 - BLOCK
      ?auto_847373 - BLOCK
      ?auto_847374 - BLOCK
      ?auto_847375 - BLOCK
    )
    :vars
    (
      ?auto_847376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_847375 ?auto_847376 ) ( not ( = ?auto_847365 ?auto_847366 ) ) ( not ( = ?auto_847365 ?auto_847367 ) ) ( not ( = ?auto_847365 ?auto_847368 ) ) ( not ( = ?auto_847365 ?auto_847369 ) ) ( not ( = ?auto_847365 ?auto_847370 ) ) ( not ( = ?auto_847365 ?auto_847371 ) ) ( not ( = ?auto_847365 ?auto_847372 ) ) ( not ( = ?auto_847365 ?auto_847373 ) ) ( not ( = ?auto_847365 ?auto_847374 ) ) ( not ( = ?auto_847365 ?auto_847375 ) ) ( not ( = ?auto_847365 ?auto_847376 ) ) ( not ( = ?auto_847366 ?auto_847367 ) ) ( not ( = ?auto_847366 ?auto_847368 ) ) ( not ( = ?auto_847366 ?auto_847369 ) ) ( not ( = ?auto_847366 ?auto_847370 ) ) ( not ( = ?auto_847366 ?auto_847371 ) ) ( not ( = ?auto_847366 ?auto_847372 ) ) ( not ( = ?auto_847366 ?auto_847373 ) ) ( not ( = ?auto_847366 ?auto_847374 ) ) ( not ( = ?auto_847366 ?auto_847375 ) ) ( not ( = ?auto_847366 ?auto_847376 ) ) ( not ( = ?auto_847367 ?auto_847368 ) ) ( not ( = ?auto_847367 ?auto_847369 ) ) ( not ( = ?auto_847367 ?auto_847370 ) ) ( not ( = ?auto_847367 ?auto_847371 ) ) ( not ( = ?auto_847367 ?auto_847372 ) ) ( not ( = ?auto_847367 ?auto_847373 ) ) ( not ( = ?auto_847367 ?auto_847374 ) ) ( not ( = ?auto_847367 ?auto_847375 ) ) ( not ( = ?auto_847367 ?auto_847376 ) ) ( not ( = ?auto_847368 ?auto_847369 ) ) ( not ( = ?auto_847368 ?auto_847370 ) ) ( not ( = ?auto_847368 ?auto_847371 ) ) ( not ( = ?auto_847368 ?auto_847372 ) ) ( not ( = ?auto_847368 ?auto_847373 ) ) ( not ( = ?auto_847368 ?auto_847374 ) ) ( not ( = ?auto_847368 ?auto_847375 ) ) ( not ( = ?auto_847368 ?auto_847376 ) ) ( not ( = ?auto_847369 ?auto_847370 ) ) ( not ( = ?auto_847369 ?auto_847371 ) ) ( not ( = ?auto_847369 ?auto_847372 ) ) ( not ( = ?auto_847369 ?auto_847373 ) ) ( not ( = ?auto_847369 ?auto_847374 ) ) ( not ( = ?auto_847369 ?auto_847375 ) ) ( not ( = ?auto_847369 ?auto_847376 ) ) ( not ( = ?auto_847370 ?auto_847371 ) ) ( not ( = ?auto_847370 ?auto_847372 ) ) ( not ( = ?auto_847370 ?auto_847373 ) ) ( not ( = ?auto_847370 ?auto_847374 ) ) ( not ( = ?auto_847370 ?auto_847375 ) ) ( not ( = ?auto_847370 ?auto_847376 ) ) ( not ( = ?auto_847371 ?auto_847372 ) ) ( not ( = ?auto_847371 ?auto_847373 ) ) ( not ( = ?auto_847371 ?auto_847374 ) ) ( not ( = ?auto_847371 ?auto_847375 ) ) ( not ( = ?auto_847371 ?auto_847376 ) ) ( not ( = ?auto_847372 ?auto_847373 ) ) ( not ( = ?auto_847372 ?auto_847374 ) ) ( not ( = ?auto_847372 ?auto_847375 ) ) ( not ( = ?auto_847372 ?auto_847376 ) ) ( not ( = ?auto_847373 ?auto_847374 ) ) ( not ( = ?auto_847373 ?auto_847375 ) ) ( not ( = ?auto_847373 ?auto_847376 ) ) ( not ( = ?auto_847374 ?auto_847375 ) ) ( not ( = ?auto_847374 ?auto_847376 ) ) ( not ( = ?auto_847375 ?auto_847376 ) ) ( ON ?auto_847374 ?auto_847375 ) ( ON ?auto_847373 ?auto_847374 ) ( ON ?auto_847372 ?auto_847373 ) ( ON ?auto_847371 ?auto_847372 ) ( ON ?auto_847370 ?auto_847371 ) ( ON ?auto_847369 ?auto_847370 ) ( ON ?auto_847368 ?auto_847369 ) ( ON ?auto_847367 ?auto_847368 ) ( ON ?auto_847366 ?auto_847367 ) ( ON ?auto_847365 ?auto_847366 ) ( CLEAR ?auto_847365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_847365 )
      ( MAKE-11PILE ?auto_847365 ?auto_847366 ?auto_847367 ?auto_847368 ?auto_847369 ?auto_847370 ?auto_847371 ?auto_847372 ?auto_847373 ?auto_847374 ?auto_847375 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_847412 - BLOCK
      ?auto_847413 - BLOCK
      ?auto_847414 - BLOCK
      ?auto_847415 - BLOCK
      ?auto_847416 - BLOCK
      ?auto_847417 - BLOCK
      ?auto_847418 - BLOCK
      ?auto_847419 - BLOCK
      ?auto_847420 - BLOCK
      ?auto_847421 - BLOCK
      ?auto_847422 - BLOCK
      ?auto_847423 - BLOCK
    )
    :vars
    (
      ?auto_847424 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_847422 ) ( ON ?auto_847423 ?auto_847424 ) ( CLEAR ?auto_847423 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_847412 ) ( ON ?auto_847413 ?auto_847412 ) ( ON ?auto_847414 ?auto_847413 ) ( ON ?auto_847415 ?auto_847414 ) ( ON ?auto_847416 ?auto_847415 ) ( ON ?auto_847417 ?auto_847416 ) ( ON ?auto_847418 ?auto_847417 ) ( ON ?auto_847419 ?auto_847418 ) ( ON ?auto_847420 ?auto_847419 ) ( ON ?auto_847421 ?auto_847420 ) ( ON ?auto_847422 ?auto_847421 ) ( not ( = ?auto_847412 ?auto_847413 ) ) ( not ( = ?auto_847412 ?auto_847414 ) ) ( not ( = ?auto_847412 ?auto_847415 ) ) ( not ( = ?auto_847412 ?auto_847416 ) ) ( not ( = ?auto_847412 ?auto_847417 ) ) ( not ( = ?auto_847412 ?auto_847418 ) ) ( not ( = ?auto_847412 ?auto_847419 ) ) ( not ( = ?auto_847412 ?auto_847420 ) ) ( not ( = ?auto_847412 ?auto_847421 ) ) ( not ( = ?auto_847412 ?auto_847422 ) ) ( not ( = ?auto_847412 ?auto_847423 ) ) ( not ( = ?auto_847412 ?auto_847424 ) ) ( not ( = ?auto_847413 ?auto_847414 ) ) ( not ( = ?auto_847413 ?auto_847415 ) ) ( not ( = ?auto_847413 ?auto_847416 ) ) ( not ( = ?auto_847413 ?auto_847417 ) ) ( not ( = ?auto_847413 ?auto_847418 ) ) ( not ( = ?auto_847413 ?auto_847419 ) ) ( not ( = ?auto_847413 ?auto_847420 ) ) ( not ( = ?auto_847413 ?auto_847421 ) ) ( not ( = ?auto_847413 ?auto_847422 ) ) ( not ( = ?auto_847413 ?auto_847423 ) ) ( not ( = ?auto_847413 ?auto_847424 ) ) ( not ( = ?auto_847414 ?auto_847415 ) ) ( not ( = ?auto_847414 ?auto_847416 ) ) ( not ( = ?auto_847414 ?auto_847417 ) ) ( not ( = ?auto_847414 ?auto_847418 ) ) ( not ( = ?auto_847414 ?auto_847419 ) ) ( not ( = ?auto_847414 ?auto_847420 ) ) ( not ( = ?auto_847414 ?auto_847421 ) ) ( not ( = ?auto_847414 ?auto_847422 ) ) ( not ( = ?auto_847414 ?auto_847423 ) ) ( not ( = ?auto_847414 ?auto_847424 ) ) ( not ( = ?auto_847415 ?auto_847416 ) ) ( not ( = ?auto_847415 ?auto_847417 ) ) ( not ( = ?auto_847415 ?auto_847418 ) ) ( not ( = ?auto_847415 ?auto_847419 ) ) ( not ( = ?auto_847415 ?auto_847420 ) ) ( not ( = ?auto_847415 ?auto_847421 ) ) ( not ( = ?auto_847415 ?auto_847422 ) ) ( not ( = ?auto_847415 ?auto_847423 ) ) ( not ( = ?auto_847415 ?auto_847424 ) ) ( not ( = ?auto_847416 ?auto_847417 ) ) ( not ( = ?auto_847416 ?auto_847418 ) ) ( not ( = ?auto_847416 ?auto_847419 ) ) ( not ( = ?auto_847416 ?auto_847420 ) ) ( not ( = ?auto_847416 ?auto_847421 ) ) ( not ( = ?auto_847416 ?auto_847422 ) ) ( not ( = ?auto_847416 ?auto_847423 ) ) ( not ( = ?auto_847416 ?auto_847424 ) ) ( not ( = ?auto_847417 ?auto_847418 ) ) ( not ( = ?auto_847417 ?auto_847419 ) ) ( not ( = ?auto_847417 ?auto_847420 ) ) ( not ( = ?auto_847417 ?auto_847421 ) ) ( not ( = ?auto_847417 ?auto_847422 ) ) ( not ( = ?auto_847417 ?auto_847423 ) ) ( not ( = ?auto_847417 ?auto_847424 ) ) ( not ( = ?auto_847418 ?auto_847419 ) ) ( not ( = ?auto_847418 ?auto_847420 ) ) ( not ( = ?auto_847418 ?auto_847421 ) ) ( not ( = ?auto_847418 ?auto_847422 ) ) ( not ( = ?auto_847418 ?auto_847423 ) ) ( not ( = ?auto_847418 ?auto_847424 ) ) ( not ( = ?auto_847419 ?auto_847420 ) ) ( not ( = ?auto_847419 ?auto_847421 ) ) ( not ( = ?auto_847419 ?auto_847422 ) ) ( not ( = ?auto_847419 ?auto_847423 ) ) ( not ( = ?auto_847419 ?auto_847424 ) ) ( not ( = ?auto_847420 ?auto_847421 ) ) ( not ( = ?auto_847420 ?auto_847422 ) ) ( not ( = ?auto_847420 ?auto_847423 ) ) ( not ( = ?auto_847420 ?auto_847424 ) ) ( not ( = ?auto_847421 ?auto_847422 ) ) ( not ( = ?auto_847421 ?auto_847423 ) ) ( not ( = ?auto_847421 ?auto_847424 ) ) ( not ( = ?auto_847422 ?auto_847423 ) ) ( not ( = ?auto_847422 ?auto_847424 ) ) ( not ( = ?auto_847423 ?auto_847424 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_847423 ?auto_847424 )
      ( !STACK ?auto_847423 ?auto_847422 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_847462 - BLOCK
      ?auto_847463 - BLOCK
      ?auto_847464 - BLOCK
      ?auto_847465 - BLOCK
      ?auto_847466 - BLOCK
      ?auto_847467 - BLOCK
      ?auto_847468 - BLOCK
      ?auto_847469 - BLOCK
      ?auto_847470 - BLOCK
      ?auto_847471 - BLOCK
      ?auto_847472 - BLOCK
      ?auto_847473 - BLOCK
    )
    :vars
    (
      ?auto_847474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_847473 ?auto_847474 ) ( ON-TABLE ?auto_847462 ) ( ON ?auto_847463 ?auto_847462 ) ( ON ?auto_847464 ?auto_847463 ) ( ON ?auto_847465 ?auto_847464 ) ( ON ?auto_847466 ?auto_847465 ) ( ON ?auto_847467 ?auto_847466 ) ( ON ?auto_847468 ?auto_847467 ) ( ON ?auto_847469 ?auto_847468 ) ( ON ?auto_847470 ?auto_847469 ) ( ON ?auto_847471 ?auto_847470 ) ( not ( = ?auto_847462 ?auto_847463 ) ) ( not ( = ?auto_847462 ?auto_847464 ) ) ( not ( = ?auto_847462 ?auto_847465 ) ) ( not ( = ?auto_847462 ?auto_847466 ) ) ( not ( = ?auto_847462 ?auto_847467 ) ) ( not ( = ?auto_847462 ?auto_847468 ) ) ( not ( = ?auto_847462 ?auto_847469 ) ) ( not ( = ?auto_847462 ?auto_847470 ) ) ( not ( = ?auto_847462 ?auto_847471 ) ) ( not ( = ?auto_847462 ?auto_847472 ) ) ( not ( = ?auto_847462 ?auto_847473 ) ) ( not ( = ?auto_847462 ?auto_847474 ) ) ( not ( = ?auto_847463 ?auto_847464 ) ) ( not ( = ?auto_847463 ?auto_847465 ) ) ( not ( = ?auto_847463 ?auto_847466 ) ) ( not ( = ?auto_847463 ?auto_847467 ) ) ( not ( = ?auto_847463 ?auto_847468 ) ) ( not ( = ?auto_847463 ?auto_847469 ) ) ( not ( = ?auto_847463 ?auto_847470 ) ) ( not ( = ?auto_847463 ?auto_847471 ) ) ( not ( = ?auto_847463 ?auto_847472 ) ) ( not ( = ?auto_847463 ?auto_847473 ) ) ( not ( = ?auto_847463 ?auto_847474 ) ) ( not ( = ?auto_847464 ?auto_847465 ) ) ( not ( = ?auto_847464 ?auto_847466 ) ) ( not ( = ?auto_847464 ?auto_847467 ) ) ( not ( = ?auto_847464 ?auto_847468 ) ) ( not ( = ?auto_847464 ?auto_847469 ) ) ( not ( = ?auto_847464 ?auto_847470 ) ) ( not ( = ?auto_847464 ?auto_847471 ) ) ( not ( = ?auto_847464 ?auto_847472 ) ) ( not ( = ?auto_847464 ?auto_847473 ) ) ( not ( = ?auto_847464 ?auto_847474 ) ) ( not ( = ?auto_847465 ?auto_847466 ) ) ( not ( = ?auto_847465 ?auto_847467 ) ) ( not ( = ?auto_847465 ?auto_847468 ) ) ( not ( = ?auto_847465 ?auto_847469 ) ) ( not ( = ?auto_847465 ?auto_847470 ) ) ( not ( = ?auto_847465 ?auto_847471 ) ) ( not ( = ?auto_847465 ?auto_847472 ) ) ( not ( = ?auto_847465 ?auto_847473 ) ) ( not ( = ?auto_847465 ?auto_847474 ) ) ( not ( = ?auto_847466 ?auto_847467 ) ) ( not ( = ?auto_847466 ?auto_847468 ) ) ( not ( = ?auto_847466 ?auto_847469 ) ) ( not ( = ?auto_847466 ?auto_847470 ) ) ( not ( = ?auto_847466 ?auto_847471 ) ) ( not ( = ?auto_847466 ?auto_847472 ) ) ( not ( = ?auto_847466 ?auto_847473 ) ) ( not ( = ?auto_847466 ?auto_847474 ) ) ( not ( = ?auto_847467 ?auto_847468 ) ) ( not ( = ?auto_847467 ?auto_847469 ) ) ( not ( = ?auto_847467 ?auto_847470 ) ) ( not ( = ?auto_847467 ?auto_847471 ) ) ( not ( = ?auto_847467 ?auto_847472 ) ) ( not ( = ?auto_847467 ?auto_847473 ) ) ( not ( = ?auto_847467 ?auto_847474 ) ) ( not ( = ?auto_847468 ?auto_847469 ) ) ( not ( = ?auto_847468 ?auto_847470 ) ) ( not ( = ?auto_847468 ?auto_847471 ) ) ( not ( = ?auto_847468 ?auto_847472 ) ) ( not ( = ?auto_847468 ?auto_847473 ) ) ( not ( = ?auto_847468 ?auto_847474 ) ) ( not ( = ?auto_847469 ?auto_847470 ) ) ( not ( = ?auto_847469 ?auto_847471 ) ) ( not ( = ?auto_847469 ?auto_847472 ) ) ( not ( = ?auto_847469 ?auto_847473 ) ) ( not ( = ?auto_847469 ?auto_847474 ) ) ( not ( = ?auto_847470 ?auto_847471 ) ) ( not ( = ?auto_847470 ?auto_847472 ) ) ( not ( = ?auto_847470 ?auto_847473 ) ) ( not ( = ?auto_847470 ?auto_847474 ) ) ( not ( = ?auto_847471 ?auto_847472 ) ) ( not ( = ?auto_847471 ?auto_847473 ) ) ( not ( = ?auto_847471 ?auto_847474 ) ) ( not ( = ?auto_847472 ?auto_847473 ) ) ( not ( = ?auto_847472 ?auto_847474 ) ) ( not ( = ?auto_847473 ?auto_847474 ) ) ( CLEAR ?auto_847471 ) ( ON ?auto_847472 ?auto_847473 ) ( CLEAR ?auto_847472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_847462 ?auto_847463 ?auto_847464 ?auto_847465 ?auto_847466 ?auto_847467 ?auto_847468 ?auto_847469 ?auto_847470 ?auto_847471 ?auto_847472 )
      ( MAKE-12PILE ?auto_847462 ?auto_847463 ?auto_847464 ?auto_847465 ?auto_847466 ?auto_847467 ?auto_847468 ?auto_847469 ?auto_847470 ?auto_847471 ?auto_847472 ?auto_847473 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_847512 - BLOCK
      ?auto_847513 - BLOCK
      ?auto_847514 - BLOCK
      ?auto_847515 - BLOCK
      ?auto_847516 - BLOCK
      ?auto_847517 - BLOCK
      ?auto_847518 - BLOCK
      ?auto_847519 - BLOCK
      ?auto_847520 - BLOCK
      ?auto_847521 - BLOCK
      ?auto_847522 - BLOCK
      ?auto_847523 - BLOCK
    )
    :vars
    (
      ?auto_847524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_847523 ?auto_847524 ) ( ON-TABLE ?auto_847512 ) ( ON ?auto_847513 ?auto_847512 ) ( ON ?auto_847514 ?auto_847513 ) ( ON ?auto_847515 ?auto_847514 ) ( ON ?auto_847516 ?auto_847515 ) ( ON ?auto_847517 ?auto_847516 ) ( ON ?auto_847518 ?auto_847517 ) ( ON ?auto_847519 ?auto_847518 ) ( ON ?auto_847520 ?auto_847519 ) ( not ( = ?auto_847512 ?auto_847513 ) ) ( not ( = ?auto_847512 ?auto_847514 ) ) ( not ( = ?auto_847512 ?auto_847515 ) ) ( not ( = ?auto_847512 ?auto_847516 ) ) ( not ( = ?auto_847512 ?auto_847517 ) ) ( not ( = ?auto_847512 ?auto_847518 ) ) ( not ( = ?auto_847512 ?auto_847519 ) ) ( not ( = ?auto_847512 ?auto_847520 ) ) ( not ( = ?auto_847512 ?auto_847521 ) ) ( not ( = ?auto_847512 ?auto_847522 ) ) ( not ( = ?auto_847512 ?auto_847523 ) ) ( not ( = ?auto_847512 ?auto_847524 ) ) ( not ( = ?auto_847513 ?auto_847514 ) ) ( not ( = ?auto_847513 ?auto_847515 ) ) ( not ( = ?auto_847513 ?auto_847516 ) ) ( not ( = ?auto_847513 ?auto_847517 ) ) ( not ( = ?auto_847513 ?auto_847518 ) ) ( not ( = ?auto_847513 ?auto_847519 ) ) ( not ( = ?auto_847513 ?auto_847520 ) ) ( not ( = ?auto_847513 ?auto_847521 ) ) ( not ( = ?auto_847513 ?auto_847522 ) ) ( not ( = ?auto_847513 ?auto_847523 ) ) ( not ( = ?auto_847513 ?auto_847524 ) ) ( not ( = ?auto_847514 ?auto_847515 ) ) ( not ( = ?auto_847514 ?auto_847516 ) ) ( not ( = ?auto_847514 ?auto_847517 ) ) ( not ( = ?auto_847514 ?auto_847518 ) ) ( not ( = ?auto_847514 ?auto_847519 ) ) ( not ( = ?auto_847514 ?auto_847520 ) ) ( not ( = ?auto_847514 ?auto_847521 ) ) ( not ( = ?auto_847514 ?auto_847522 ) ) ( not ( = ?auto_847514 ?auto_847523 ) ) ( not ( = ?auto_847514 ?auto_847524 ) ) ( not ( = ?auto_847515 ?auto_847516 ) ) ( not ( = ?auto_847515 ?auto_847517 ) ) ( not ( = ?auto_847515 ?auto_847518 ) ) ( not ( = ?auto_847515 ?auto_847519 ) ) ( not ( = ?auto_847515 ?auto_847520 ) ) ( not ( = ?auto_847515 ?auto_847521 ) ) ( not ( = ?auto_847515 ?auto_847522 ) ) ( not ( = ?auto_847515 ?auto_847523 ) ) ( not ( = ?auto_847515 ?auto_847524 ) ) ( not ( = ?auto_847516 ?auto_847517 ) ) ( not ( = ?auto_847516 ?auto_847518 ) ) ( not ( = ?auto_847516 ?auto_847519 ) ) ( not ( = ?auto_847516 ?auto_847520 ) ) ( not ( = ?auto_847516 ?auto_847521 ) ) ( not ( = ?auto_847516 ?auto_847522 ) ) ( not ( = ?auto_847516 ?auto_847523 ) ) ( not ( = ?auto_847516 ?auto_847524 ) ) ( not ( = ?auto_847517 ?auto_847518 ) ) ( not ( = ?auto_847517 ?auto_847519 ) ) ( not ( = ?auto_847517 ?auto_847520 ) ) ( not ( = ?auto_847517 ?auto_847521 ) ) ( not ( = ?auto_847517 ?auto_847522 ) ) ( not ( = ?auto_847517 ?auto_847523 ) ) ( not ( = ?auto_847517 ?auto_847524 ) ) ( not ( = ?auto_847518 ?auto_847519 ) ) ( not ( = ?auto_847518 ?auto_847520 ) ) ( not ( = ?auto_847518 ?auto_847521 ) ) ( not ( = ?auto_847518 ?auto_847522 ) ) ( not ( = ?auto_847518 ?auto_847523 ) ) ( not ( = ?auto_847518 ?auto_847524 ) ) ( not ( = ?auto_847519 ?auto_847520 ) ) ( not ( = ?auto_847519 ?auto_847521 ) ) ( not ( = ?auto_847519 ?auto_847522 ) ) ( not ( = ?auto_847519 ?auto_847523 ) ) ( not ( = ?auto_847519 ?auto_847524 ) ) ( not ( = ?auto_847520 ?auto_847521 ) ) ( not ( = ?auto_847520 ?auto_847522 ) ) ( not ( = ?auto_847520 ?auto_847523 ) ) ( not ( = ?auto_847520 ?auto_847524 ) ) ( not ( = ?auto_847521 ?auto_847522 ) ) ( not ( = ?auto_847521 ?auto_847523 ) ) ( not ( = ?auto_847521 ?auto_847524 ) ) ( not ( = ?auto_847522 ?auto_847523 ) ) ( not ( = ?auto_847522 ?auto_847524 ) ) ( not ( = ?auto_847523 ?auto_847524 ) ) ( ON ?auto_847522 ?auto_847523 ) ( CLEAR ?auto_847520 ) ( ON ?auto_847521 ?auto_847522 ) ( CLEAR ?auto_847521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_847512 ?auto_847513 ?auto_847514 ?auto_847515 ?auto_847516 ?auto_847517 ?auto_847518 ?auto_847519 ?auto_847520 ?auto_847521 )
      ( MAKE-12PILE ?auto_847512 ?auto_847513 ?auto_847514 ?auto_847515 ?auto_847516 ?auto_847517 ?auto_847518 ?auto_847519 ?auto_847520 ?auto_847521 ?auto_847522 ?auto_847523 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_847562 - BLOCK
      ?auto_847563 - BLOCK
      ?auto_847564 - BLOCK
      ?auto_847565 - BLOCK
      ?auto_847566 - BLOCK
      ?auto_847567 - BLOCK
      ?auto_847568 - BLOCK
      ?auto_847569 - BLOCK
      ?auto_847570 - BLOCK
      ?auto_847571 - BLOCK
      ?auto_847572 - BLOCK
      ?auto_847573 - BLOCK
    )
    :vars
    (
      ?auto_847574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_847573 ?auto_847574 ) ( ON-TABLE ?auto_847562 ) ( ON ?auto_847563 ?auto_847562 ) ( ON ?auto_847564 ?auto_847563 ) ( ON ?auto_847565 ?auto_847564 ) ( ON ?auto_847566 ?auto_847565 ) ( ON ?auto_847567 ?auto_847566 ) ( ON ?auto_847568 ?auto_847567 ) ( ON ?auto_847569 ?auto_847568 ) ( not ( = ?auto_847562 ?auto_847563 ) ) ( not ( = ?auto_847562 ?auto_847564 ) ) ( not ( = ?auto_847562 ?auto_847565 ) ) ( not ( = ?auto_847562 ?auto_847566 ) ) ( not ( = ?auto_847562 ?auto_847567 ) ) ( not ( = ?auto_847562 ?auto_847568 ) ) ( not ( = ?auto_847562 ?auto_847569 ) ) ( not ( = ?auto_847562 ?auto_847570 ) ) ( not ( = ?auto_847562 ?auto_847571 ) ) ( not ( = ?auto_847562 ?auto_847572 ) ) ( not ( = ?auto_847562 ?auto_847573 ) ) ( not ( = ?auto_847562 ?auto_847574 ) ) ( not ( = ?auto_847563 ?auto_847564 ) ) ( not ( = ?auto_847563 ?auto_847565 ) ) ( not ( = ?auto_847563 ?auto_847566 ) ) ( not ( = ?auto_847563 ?auto_847567 ) ) ( not ( = ?auto_847563 ?auto_847568 ) ) ( not ( = ?auto_847563 ?auto_847569 ) ) ( not ( = ?auto_847563 ?auto_847570 ) ) ( not ( = ?auto_847563 ?auto_847571 ) ) ( not ( = ?auto_847563 ?auto_847572 ) ) ( not ( = ?auto_847563 ?auto_847573 ) ) ( not ( = ?auto_847563 ?auto_847574 ) ) ( not ( = ?auto_847564 ?auto_847565 ) ) ( not ( = ?auto_847564 ?auto_847566 ) ) ( not ( = ?auto_847564 ?auto_847567 ) ) ( not ( = ?auto_847564 ?auto_847568 ) ) ( not ( = ?auto_847564 ?auto_847569 ) ) ( not ( = ?auto_847564 ?auto_847570 ) ) ( not ( = ?auto_847564 ?auto_847571 ) ) ( not ( = ?auto_847564 ?auto_847572 ) ) ( not ( = ?auto_847564 ?auto_847573 ) ) ( not ( = ?auto_847564 ?auto_847574 ) ) ( not ( = ?auto_847565 ?auto_847566 ) ) ( not ( = ?auto_847565 ?auto_847567 ) ) ( not ( = ?auto_847565 ?auto_847568 ) ) ( not ( = ?auto_847565 ?auto_847569 ) ) ( not ( = ?auto_847565 ?auto_847570 ) ) ( not ( = ?auto_847565 ?auto_847571 ) ) ( not ( = ?auto_847565 ?auto_847572 ) ) ( not ( = ?auto_847565 ?auto_847573 ) ) ( not ( = ?auto_847565 ?auto_847574 ) ) ( not ( = ?auto_847566 ?auto_847567 ) ) ( not ( = ?auto_847566 ?auto_847568 ) ) ( not ( = ?auto_847566 ?auto_847569 ) ) ( not ( = ?auto_847566 ?auto_847570 ) ) ( not ( = ?auto_847566 ?auto_847571 ) ) ( not ( = ?auto_847566 ?auto_847572 ) ) ( not ( = ?auto_847566 ?auto_847573 ) ) ( not ( = ?auto_847566 ?auto_847574 ) ) ( not ( = ?auto_847567 ?auto_847568 ) ) ( not ( = ?auto_847567 ?auto_847569 ) ) ( not ( = ?auto_847567 ?auto_847570 ) ) ( not ( = ?auto_847567 ?auto_847571 ) ) ( not ( = ?auto_847567 ?auto_847572 ) ) ( not ( = ?auto_847567 ?auto_847573 ) ) ( not ( = ?auto_847567 ?auto_847574 ) ) ( not ( = ?auto_847568 ?auto_847569 ) ) ( not ( = ?auto_847568 ?auto_847570 ) ) ( not ( = ?auto_847568 ?auto_847571 ) ) ( not ( = ?auto_847568 ?auto_847572 ) ) ( not ( = ?auto_847568 ?auto_847573 ) ) ( not ( = ?auto_847568 ?auto_847574 ) ) ( not ( = ?auto_847569 ?auto_847570 ) ) ( not ( = ?auto_847569 ?auto_847571 ) ) ( not ( = ?auto_847569 ?auto_847572 ) ) ( not ( = ?auto_847569 ?auto_847573 ) ) ( not ( = ?auto_847569 ?auto_847574 ) ) ( not ( = ?auto_847570 ?auto_847571 ) ) ( not ( = ?auto_847570 ?auto_847572 ) ) ( not ( = ?auto_847570 ?auto_847573 ) ) ( not ( = ?auto_847570 ?auto_847574 ) ) ( not ( = ?auto_847571 ?auto_847572 ) ) ( not ( = ?auto_847571 ?auto_847573 ) ) ( not ( = ?auto_847571 ?auto_847574 ) ) ( not ( = ?auto_847572 ?auto_847573 ) ) ( not ( = ?auto_847572 ?auto_847574 ) ) ( not ( = ?auto_847573 ?auto_847574 ) ) ( ON ?auto_847572 ?auto_847573 ) ( ON ?auto_847571 ?auto_847572 ) ( CLEAR ?auto_847569 ) ( ON ?auto_847570 ?auto_847571 ) ( CLEAR ?auto_847570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_847562 ?auto_847563 ?auto_847564 ?auto_847565 ?auto_847566 ?auto_847567 ?auto_847568 ?auto_847569 ?auto_847570 )
      ( MAKE-12PILE ?auto_847562 ?auto_847563 ?auto_847564 ?auto_847565 ?auto_847566 ?auto_847567 ?auto_847568 ?auto_847569 ?auto_847570 ?auto_847571 ?auto_847572 ?auto_847573 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_847612 - BLOCK
      ?auto_847613 - BLOCK
      ?auto_847614 - BLOCK
      ?auto_847615 - BLOCK
      ?auto_847616 - BLOCK
      ?auto_847617 - BLOCK
      ?auto_847618 - BLOCK
      ?auto_847619 - BLOCK
      ?auto_847620 - BLOCK
      ?auto_847621 - BLOCK
      ?auto_847622 - BLOCK
      ?auto_847623 - BLOCK
    )
    :vars
    (
      ?auto_847624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_847623 ?auto_847624 ) ( ON-TABLE ?auto_847612 ) ( ON ?auto_847613 ?auto_847612 ) ( ON ?auto_847614 ?auto_847613 ) ( ON ?auto_847615 ?auto_847614 ) ( ON ?auto_847616 ?auto_847615 ) ( ON ?auto_847617 ?auto_847616 ) ( ON ?auto_847618 ?auto_847617 ) ( not ( = ?auto_847612 ?auto_847613 ) ) ( not ( = ?auto_847612 ?auto_847614 ) ) ( not ( = ?auto_847612 ?auto_847615 ) ) ( not ( = ?auto_847612 ?auto_847616 ) ) ( not ( = ?auto_847612 ?auto_847617 ) ) ( not ( = ?auto_847612 ?auto_847618 ) ) ( not ( = ?auto_847612 ?auto_847619 ) ) ( not ( = ?auto_847612 ?auto_847620 ) ) ( not ( = ?auto_847612 ?auto_847621 ) ) ( not ( = ?auto_847612 ?auto_847622 ) ) ( not ( = ?auto_847612 ?auto_847623 ) ) ( not ( = ?auto_847612 ?auto_847624 ) ) ( not ( = ?auto_847613 ?auto_847614 ) ) ( not ( = ?auto_847613 ?auto_847615 ) ) ( not ( = ?auto_847613 ?auto_847616 ) ) ( not ( = ?auto_847613 ?auto_847617 ) ) ( not ( = ?auto_847613 ?auto_847618 ) ) ( not ( = ?auto_847613 ?auto_847619 ) ) ( not ( = ?auto_847613 ?auto_847620 ) ) ( not ( = ?auto_847613 ?auto_847621 ) ) ( not ( = ?auto_847613 ?auto_847622 ) ) ( not ( = ?auto_847613 ?auto_847623 ) ) ( not ( = ?auto_847613 ?auto_847624 ) ) ( not ( = ?auto_847614 ?auto_847615 ) ) ( not ( = ?auto_847614 ?auto_847616 ) ) ( not ( = ?auto_847614 ?auto_847617 ) ) ( not ( = ?auto_847614 ?auto_847618 ) ) ( not ( = ?auto_847614 ?auto_847619 ) ) ( not ( = ?auto_847614 ?auto_847620 ) ) ( not ( = ?auto_847614 ?auto_847621 ) ) ( not ( = ?auto_847614 ?auto_847622 ) ) ( not ( = ?auto_847614 ?auto_847623 ) ) ( not ( = ?auto_847614 ?auto_847624 ) ) ( not ( = ?auto_847615 ?auto_847616 ) ) ( not ( = ?auto_847615 ?auto_847617 ) ) ( not ( = ?auto_847615 ?auto_847618 ) ) ( not ( = ?auto_847615 ?auto_847619 ) ) ( not ( = ?auto_847615 ?auto_847620 ) ) ( not ( = ?auto_847615 ?auto_847621 ) ) ( not ( = ?auto_847615 ?auto_847622 ) ) ( not ( = ?auto_847615 ?auto_847623 ) ) ( not ( = ?auto_847615 ?auto_847624 ) ) ( not ( = ?auto_847616 ?auto_847617 ) ) ( not ( = ?auto_847616 ?auto_847618 ) ) ( not ( = ?auto_847616 ?auto_847619 ) ) ( not ( = ?auto_847616 ?auto_847620 ) ) ( not ( = ?auto_847616 ?auto_847621 ) ) ( not ( = ?auto_847616 ?auto_847622 ) ) ( not ( = ?auto_847616 ?auto_847623 ) ) ( not ( = ?auto_847616 ?auto_847624 ) ) ( not ( = ?auto_847617 ?auto_847618 ) ) ( not ( = ?auto_847617 ?auto_847619 ) ) ( not ( = ?auto_847617 ?auto_847620 ) ) ( not ( = ?auto_847617 ?auto_847621 ) ) ( not ( = ?auto_847617 ?auto_847622 ) ) ( not ( = ?auto_847617 ?auto_847623 ) ) ( not ( = ?auto_847617 ?auto_847624 ) ) ( not ( = ?auto_847618 ?auto_847619 ) ) ( not ( = ?auto_847618 ?auto_847620 ) ) ( not ( = ?auto_847618 ?auto_847621 ) ) ( not ( = ?auto_847618 ?auto_847622 ) ) ( not ( = ?auto_847618 ?auto_847623 ) ) ( not ( = ?auto_847618 ?auto_847624 ) ) ( not ( = ?auto_847619 ?auto_847620 ) ) ( not ( = ?auto_847619 ?auto_847621 ) ) ( not ( = ?auto_847619 ?auto_847622 ) ) ( not ( = ?auto_847619 ?auto_847623 ) ) ( not ( = ?auto_847619 ?auto_847624 ) ) ( not ( = ?auto_847620 ?auto_847621 ) ) ( not ( = ?auto_847620 ?auto_847622 ) ) ( not ( = ?auto_847620 ?auto_847623 ) ) ( not ( = ?auto_847620 ?auto_847624 ) ) ( not ( = ?auto_847621 ?auto_847622 ) ) ( not ( = ?auto_847621 ?auto_847623 ) ) ( not ( = ?auto_847621 ?auto_847624 ) ) ( not ( = ?auto_847622 ?auto_847623 ) ) ( not ( = ?auto_847622 ?auto_847624 ) ) ( not ( = ?auto_847623 ?auto_847624 ) ) ( ON ?auto_847622 ?auto_847623 ) ( ON ?auto_847621 ?auto_847622 ) ( ON ?auto_847620 ?auto_847621 ) ( CLEAR ?auto_847618 ) ( ON ?auto_847619 ?auto_847620 ) ( CLEAR ?auto_847619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_847612 ?auto_847613 ?auto_847614 ?auto_847615 ?auto_847616 ?auto_847617 ?auto_847618 ?auto_847619 )
      ( MAKE-12PILE ?auto_847612 ?auto_847613 ?auto_847614 ?auto_847615 ?auto_847616 ?auto_847617 ?auto_847618 ?auto_847619 ?auto_847620 ?auto_847621 ?auto_847622 ?auto_847623 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_847662 - BLOCK
      ?auto_847663 - BLOCK
      ?auto_847664 - BLOCK
      ?auto_847665 - BLOCK
      ?auto_847666 - BLOCK
      ?auto_847667 - BLOCK
      ?auto_847668 - BLOCK
      ?auto_847669 - BLOCK
      ?auto_847670 - BLOCK
      ?auto_847671 - BLOCK
      ?auto_847672 - BLOCK
      ?auto_847673 - BLOCK
    )
    :vars
    (
      ?auto_847674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_847673 ?auto_847674 ) ( ON-TABLE ?auto_847662 ) ( ON ?auto_847663 ?auto_847662 ) ( ON ?auto_847664 ?auto_847663 ) ( ON ?auto_847665 ?auto_847664 ) ( ON ?auto_847666 ?auto_847665 ) ( ON ?auto_847667 ?auto_847666 ) ( not ( = ?auto_847662 ?auto_847663 ) ) ( not ( = ?auto_847662 ?auto_847664 ) ) ( not ( = ?auto_847662 ?auto_847665 ) ) ( not ( = ?auto_847662 ?auto_847666 ) ) ( not ( = ?auto_847662 ?auto_847667 ) ) ( not ( = ?auto_847662 ?auto_847668 ) ) ( not ( = ?auto_847662 ?auto_847669 ) ) ( not ( = ?auto_847662 ?auto_847670 ) ) ( not ( = ?auto_847662 ?auto_847671 ) ) ( not ( = ?auto_847662 ?auto_847672 ) ) ( not ( = ?auto_847662 ?auto_847673 ) ) ( not ( = ?auto_847662 ?auto_847674 ) ) ( not ( = ?auto_847663 ?auto_847664 ) ) ( not ( = ?auto_847663 ?auto_847665 ) ) ( not ( = ?auto_847663 ?auto_847666 ) ) ( not ( = ?auto_847663 ?auto_847667 ) ) ( not ( = ?auto_847663 ?auto_847668 ) ) ( not ( = ?auto_847663 ?auto_847669 ) ) ( not ( = ?auto_847663 ?auto_847670 ) ) ( not ( = ?auto_847663 ?auto_847671 ) ) ( not ( = ?auto_847663 ?auto_847672 ) ) ( not ( = ?auto_847663 ?auto_847673 ) ) ( not ( = ?auto_847663 ?auto_847674 ) ) ( not ( = ?auto_847664 ?auto_847665 ) ) ( not ( = ?auto_847664 ?auto_847666 ) ) ( not ( = ?auto_847664 ?auto_847667 ) ) ( not ( = ?auto_847664 ?auto_847668 ) ) ( not ( = ?auto_847664 ?auto_847669 ) ) ( not ( = ?auto_847664 ?auto_847670 ) ) ( not ( = ?auto_847664 ?auto_847671 ) ) ( not ( = ?auto_847664 ?auto_847672 ) ) ( not ( = ?auto_847664 ?auto_847673 ) ) ( not ( = ?auto_847664 ?auto_847674 ) ) ( not ( = ?auto_847665 ?auto_847666 ) ) ( not ( = ?auto_847665 ?auto_847667 ) ) ( not ( = ?auto_847665 ?auto_847668 ) ) ( not ( = ?auto_847665 ?auto_847669 ) ) ( not ( = ?auto_847665 ?auto_847670 ) ) ( not ( = ?auto_847665 ?auto_847671 ) ) ( not ( = ?auto_847665 ?auto_847672 ) ) ( not ( = ?auto_847665 ?auto_847673 ) ) ( not ( = ?auto_847665 ?auto_847674 ) ) ( not ( = ?auto_847666 ?auto_847667 ) ) ( not ( = ?auto_847666 ?auto_847668 ) ) ( not ( = ?auto_847666 ?auto_847669 ) ) ( not ( = ?auto_847666 ?auto_847670 ) ) ( not ( = ?auto_847666 ?auto_847671 ) ) ( not ( = ?auto_847666 ?auto_847672 ) ) ( not ( = ?auto_847666 ?auto_847673 ) ) ( not ( = ?auto_847666 ?auto_847674 ) ) ( not ( = ?auto_847667 ?auto_847668 ) ) ( not ( = ?auto_847667 ?auto_847669 ) ) ( not ( = ?auto_847667 ?auto_847670 ) ) ( not ( = ?auto_847667 ?auto_847671 ) ) ( not ( = ?auto_847667 ?auto_847672 ) ) ( not ( = ?auto_847667 ?auto_847673 ) ) ( not ( = ?auto_847667 ?auto_847674 ) ) ( not ( = ?auto_847668 ?auto_847669 ) ) ( not ( = ?auto_847668 ?auto_847670 ) ) ( not ( = ?auto_847668 ?auto_847671 ) ) ( not ( = ?auto_847668 ?auto_847672 ) ) ( not ( = ?auto_847668 ?auto_847673 ) ) ( not ( = ?auto_847668 ?auto_847674 ) ) ( not ( = ?auto_847669 ?auto_847670 ) ) ( not ( = ?auto_847669 ?auto_847671 ) ) ( not ( = ?auto_847669 ?auto_847672 ) ) ( not ( = ?auto_847669 ?auto_847673 ) ) ( not ( = ?auto_847669 ?auto_847674 ) ) ( not ( = ?auto_847670 ?auto_847671 ) ) ( not ( = ?auto_847670 ?auto_847672 ) ) ( not ( = ?auto_847670 ?auto_847673 ) ) ( not ( = ?auto_847670 ?auto_847674 ) ) ( not ( = ?auto_847671 ?auto_847672 ) ) ( not ( = ?auto_847671 ?auto_847673 ) ) ( not ( = ?auto_847671 ?auto_847674 ) ) ( not ( = ?auto_847672 ?auto_847673 ) ) ( not ( = ?auto_847672 ?auto_847674 ) ) ( not ( = ?auto_847673 ?auto_847674 ) ) ( ON ?auto_847672 ?auto_847673 ) ( ON ?auto_847671 ?auto_847672 ) ( ON ?auto_847670 ?auto_847671 ) ( ON ?auto_847669 ?auto_847670 ) ( CLEAR ?auto_847667 ) ( ON ?auto_847668 ?auto_847669 ) ( CLEAR ?auto_847668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_847662 ?auto_847663 ?auto_847664 ?auto_847665 ?auto_847666 ?auto_847667 ?auto_847668 )
      ( MAKE-12PILE ?auto_847662 ?auto_847663 ?auto_847664 ?auto_847665 ?auto_847666 ?auto_847667 ?auto_847668 ?auto_847669 ?auto_847670 ?auto_847671 ?auto_847672 ?auto_847673 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_847712 - BLOCK
      ?auto_847713 - BLOCK
      ?auto_847714 - BLOCK
      ?auto_847715 - BLOCK
      ?auto_847716 - BLOCK
      ?auto_847717 - BLOCK
      ?auto_847718 - BLOCK
      ?auto_847719 - BLOCK
      ?auto_847720 - BLOCK
      ?auto_847721 - BLOCK
      ?auto_847722 - BLOCK
      ?auto_847723 - BLOCK
    )
    :vars
    (
      ?auto_847724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_847723 ?auto_847724 ) ( ON-TABLE ?auto_847712 ) ( ON ?auto_847713 ?auto_847712 ) ( ON ?auto_847714 ?auto_847713 ) ( ON ?auto_847715 ?auto_847714 ) ( ON ?auto_847716 ?auto_847715 ) ( not ( = ?auto_847712 ?auto_847713 ) ) ( not ( = ?auto_847712 ?auto_847714 ) ) ( not ( = ?auto_847712 ?auto_847715 ) ) ( not ( = ?auto_847712 ?auto_847716 ) ) ( not ( = ?auto_847712 ?auto_847717 ) ) ( not ( = ?auto_847712 ?auto_847718 ) ) ( not ( = ?auto_847712 ?auto_847719 ) ) ( not ( = ?auto_847712 ?auto_847720 ) ) ( not ( = ?auto_847712 ?auto_847721 ) ) ( not ( = ?auto_847712 ?auto_847722 ) ) ( not ( = ?auto_847712 ?auto_847723 ) ) ( not ( = ?auto_847712 ?auto_847724 ) ) ( not ( = ?auto_847713 ?auto_847714 ) ) ( not ( = ?auto_847713 ?auto_847715 ) ) ( not ( = ?auto_847713 ?auto_847716 ) ) ( not ( = ?auto_847713 ?auto_847717 ) ) ( not ( = ?auto_847713 ?auto_847718 ) ) ( not ( = ?auto_847713 ?auto_847719 ) ) ( not ( = ?auto_847713 ?auto_847720 ) ) ( not ( = ?auto_847713 ?auto_847721 ) ) ( not ( = ?auto_847713 ?auto_847722 ) ) ( not ( = ?auto_847713 ?auto_847723 ) ) ( not ( = ?auto_847713 ?auto_847724 ) ) ( not ( = ?auto_847714 ?auto_847715 ) ) ( not ( = ?auto_847714 ?auto_847716 ) ) ( not ( = ?auto_847714 ?auto_847717 ) ) ( not ( = ?auto_847714 ?auto_847718 ) ) ( not ( = ?auto_847714 ?auto_847719 ) ) ( not ( = ?auto_847714 ?auto_847720 ) ) ( not ( = ?auto_847714 ?auto_847721 ) ) ( not ( = ?auto_847714 ?auto_847722 ) ) ( not ( = ?auto_847714 ?auto_847723 ) ) ( not ( = ?auto_847714 ?auto_847724 ) ) ( not ( = ?auto_847715 ?auto_847716 ) ) ( not ( = ?auto_847715 ?auto_847717 ) ) ( not ( = ?auto_847715 ?auto_847718 ) ) ( not ( = ?auto_847715 ?auto_847719 ) ) ( not ( = ?auto_847715 ?auto_847720 ) ) ( not ( = ?auto_847715 ?auto_847721 ) ) ( not ( = ?auto_847715 ?auto_847722 ) ) ( not ( = ?auto_847715 ?auto_847723 ) ) ( not ( = ?auto_847715 ?auto_847724 ) ) ( not ( = ?auto_847716 ?auto_847717 ) ) ( not ( = ?auto_847716 ?auto_847718 ) ) ( not ( = ?auto_847716 ?auto_847719 ) ) ( not ( = ?auto_847716 ?auto_847720 ) ) ( not ( = ?auto_847716 ?auto_847721 ) ) ( not ( = ?auto_847716 ?auto_847722 ) ) ( not ( = ?auto_847716 ?auto_847723 ) ) ( not ( = ?auto_847716 ?auto_847724 ) ) ( not ( = ?auto_847717 ?auto_847718 ) ) ( not ( = ?auto_847717 ?auto_847719 ) ) ( not ( = ?auto_847717 ?auto_847720 ) ) ( not ( = ?auto_847717 ?auto_847721 ) ) ( not ( = ?auto_847717 ?auto_847722 ) ) ( not ( = ?auto_847717 ?auto_847723 ) ) ( not ( = ?auto_847717 ?auto_847724 ) ) ( not ( = ?auto_847718 ?auto_847719 ) ) ( not ( = ?auto_847718 ?auto_847720 ) ) ( not ( = ?auto_847718 ?auto_847721 ) ) ( not ( = ?auto_847718 ?auto_847722 ) ) ( not ( = ?auto_847718 ?auto_847723 ) ) ( not ( = ?auto_847718 ?auto_847724 ) ) ( not ( = ?auto_847719 ?auto_847720 ) ) ( not ( = ?auto_847719 ?auto_847721 ) ) ( not ( = ?auto_847719 ?auto_847722 ) ) ( not ( = ?auto_847719 ?auto_847723 ) ) ( not ( = ?auto_847719 ?auto_847724 ) ) ( not ( = ?auto_847720 ?auto_847721 ) ) ( not ( = ?auto_847720 ?auto_847722 ) ) ( not ( = ?auto_847720 ?auto_847723 ) ) ( not ( = ?auto_847720 ?auto_847724 ) ) ( not ( = ?auto_847721 ?auto_847722 ) ) ( not ( = ?auto_847721 ?auto_847723 ) ) ( not ( = ?auto_847721 ?auto_847724 ) ) ( not ( = ?auto_847722 ?auto_847723 ) ) ( not ( = ?auto_847722 ?auto_847724 ) ) ( not ( = ?auto_847723 ?auto_847724 ) ) ( ON ?auto_847722 ?auto_847723 ) ( ON ?auto_847721 ?auto_847722 ) ( ON ?auto_847720 ?auto_847721 ) ( ON ?auto_847719 ?auto_847720 ) ( ON ?auto_847718 ?auto_847719 ) ( CLEAR ?auto_847716 ) ( ON ?auto_847717 ?auto_847718 ) ( CLEAR ?auto_847717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_847712 ?auto_847713 ?auto_847714 ?auto_847715 ?auto_847716 ?auto_847717 )
      ( MAKE-12PILE ?auto_847712 ?auto_847713 ?auto_847714 ?auto_847715 ?auto_847716 ?auto_847717 ?auto_847718 ?auto_847719 ?auto_847720 ?auto_847721 ?auto_847722 ?auto_847723 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_847762 - BLOCK
      ?auto_847763 - BLOCK
      ?auto_847764 - BLOCK
      ?auto_847765 - BLOCK
      ?auto_847766 - BLOCK
      ?auto_847767 - BLOCK
      ?auto_847768 - BLOCK
      ?auto_847769 - BLOCK
      ?auto_847770 - BLOCK
      ?auto_847771 - BLOCK
      ?auto_847772 - BLOCK
      ?auto_847773 - BLOCK
    )
    :vars
    (
      ?auto_847774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_847773 ?auto_847774 ) ( ON-TABLE ?auto_847762 ) ( ON ?auto_847763 ?auto_847762 ) ( ON ?auto_847764 ?auto_847763 ) ( ON ?auto_847765 ?auto_847764 ) ( not ( = ?auto_847762 ?auto_847763 ) ) ( not ( = ?auto_847762 ?auto_847764 ) ) ( not ( = ?auto_847762 ?auto_847765 ) ) ( not ( = ?auto_847762 ?auto_847766 ) ) ( not ( = ?auto_847762 ?auto_847767 ) ) ( not ( = ?auto_847762 ?auto_847768 ) ) ( not ( = ?auto_847762 ?auto_847769 ) ) ( not ( = ?auto_847762 ?auto_847770 ) ) ( not ( = ?auto_847762 ?auto_847771 ) ) ( not ( = ?auto_847762 ?auto_847772 ) ) ( not ( = ?auto_847762 ?auto_847773 ) ) ( not ( = ?auto_847762 ?auto_847774 ) ) ( not ( = ?auto_847763 ?auto_847764 ) ) ( not ( = ?auto_847763 ?auto_847765 ) ) ( not ( = ?auto_847763 ?auto_847766 ) ) ( not ( = ?auto_847763 ?auto_847767 ) ) ( not ( = ?auto_847763 ?auto_847768 ) ) ( not ( = ?auto_847763 ?auto_847769 ) ) ( not ( = ?auto_847763 ?auto_847770 ) ) ( not ( = ?auto_847763 ?auto_847771 ) ) ( not ( = ?auto_847763 ?auto_847772 ) ) ( not ( = ?auto_847763 ?auto_847773 ) ) ( not ( = ?auto_847763 ?auto_847774 ) ) ( not ( = ?auto_847764 ?auto_847765 ) ) ( not ( = ?auto_847764 ?auto_847766 ) ) ( not ( = ?auto_847764 ?auto_847767 ) ) ( not ( = ?auto_847764 ?auto_847768 ) ) ( not ( = ?auto_847764 ?auto_847769 ) ) ( not ( = ?auto_847764 ?auto_847770 ) ) ( not ( = ?auto_847764 ?auto_847771 ) ) ( not ( = ?auto_847764 ?auto_847772 ) ) ( not ( = ?auto_847764 ?auto_847773 ) ) ( not ( = ?auto_847764 ?auto_847774 ) ) ( not ( = ?auto_847765 ?auto_847766 ) ) ( not ( = ?auto_847765 ?auto_847767 ) ) ( not ( = ?auto_847765 ?auto_847768 ) ) ( not ( = ?auto_847765 ?auto_847769 ) ) ( not ( = ?auto_847765 ?auto_847770 ) ) ( not ( = ?auto_847765 ?auto_847771 ) ) ( not ( = ?auto_847765 ?auto_847772 ) ) ( not ( = ?auto_847765 ?auto_847773 ) ) ( not ( = ?auto_847765 ?auto_847774 ) ) ( not ( = ?auto_847766 ?auto_847767 ) ) ( not ( = ?auto_847766 ?auto_847768 ) ) ( not ( = ?auto_847766 ?auto_847769 ) ) ( not ( = ?auto_847766 ?auto_847770 ) ) ( not ( = ?auto_847766 ?auto_847771 ) ) ( not ( = ?auto_847766 ?auto_847772 ) ) ( not ( = ?auto_847766 ?auto_847773 ) ) ( not ( = ?auto_847766 ?auto_847774 ) ) ( not ( = ?auto_847767 ?auto_847768 ) ) ( not ( = ?auto_847767 ?auto_847769 ) ) ( not ( = ?auto_847767 ?auto_847770 ) ) ( not ( = ?auto_847767 ?auto_847771 ) ) ( not ( = ?auto_847767 ?auto_847772 ) ) ( not ( = ?auto_847767 ?auto_847773 ) ) ( not ( = ?auto_847767 ?auto_847774 ) ) ( not ( = ?auto_847768 ?auto_847769 ) ) ( not ( = ?auto_847768 ?auto_847770 ) ) ( not ( = ?auto_847768 ?auto_847771 ) ) ( not ( = ?auto_847768 ?auto_847772 ) ) ( not ( = ?auto_847768 ?auto_847773 ) ) ( not ( = ?auto_847768 ?auto_847774 ) ) ( not ( = ?auto_847769 ?auto_847770 ) ) ( not ( = ?auto_847769 ?auto_847771 ) ) ( not ( = ?auto_847769 ?auto_847772 ) ) ( not ( = ?auto_847769 ?auto_847773 ) ) ( not ( = ?auto_847769 ?auto_847774 ) ) ( not ( = ?auto_847770 ?auto_847771 ) ) ( not ( = ?auto_847770 ?auto_847772 ) ) ( not ( = ?auto_847770 ?auto_847773 ) ) ( not ( = ?auto_847770 ?auto_847774 ) ) ( not ( = ?auto_847771 ?auto_847772 ) ) ( not ( = ?auto_847771 ?auto_847773 ) ) ( not ( = ?auto_847771 ?auto_847774 ) ) ( not ( = ?auto_847772 ?auto_847773 ) ) ( not ( = ?auto_847772 ?auto_847774 ) ) ( not ( = ?auto_847773 ?auto_847774 ) ) ( ON ?auto_847772 ?auto_847773 ) ( ON ?auto_847771 ?auto_847772 ) ( ON ?auto_847770 ?auto_847771 ) ( ON ?auto_847769 ?auto_847770 ) ( ON ?auto_847768 ?auto_847769 ) ( ON ?auto_847767 ?auto_847768 ) ( CLEAR ?auto_847765 ) ( ON ?auto_847766 ?auto_847767 ) ( CLEAR ?auto_847766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_847762 ?auto_847763 ?auto_847764 ?auto_847765 ?auto_847766 )
      ( MAKE-12PILE ?auto_847762 ?auto_847763 ?auto_847764 ?auto_847765 ?auto_847766 ?auto_847767 ?auto_847768 ?auto_847769 ?auto_847770 ?auto_847771 ?auto_847772 ?auto_847773 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_847812 - BLOCK
      ?auto_847813 - BLOCK
      ?auto_847814 - BLOCK
      ?auto_847815 - BLOCK
      ?auto_847816 - BLOCK
      ?auto_847817 - BLOCK
      ?auto_847818 - BLOCK
      ?auto_847819 - BLOCK
      ?auto_847820 - BLOCK
      ?auto_847821 - BLOCK
      ?auto_847822 - BLOCK
      ?auto_847823 - BLOCK
    )
    :vars
    (
      ?auto_847824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_847823 ?auto_847824 ) ( ON-TABLE ?auto_847812 ) ( ON ?auto_847813 ?auto_847812 ) ( ON ?auto_847814 ?auto_847813 ) ( not ( = ?auto_847812 ?auto_847813 ) ) ( not ( = ?auto_847812 ?auto_847814 ) ) ( not ( = ?auto_847812 ?auto_847815 ) ) ( not ( = ?auto_847812 ?auto_847816 ) ) ( not ( = ?auto_847812 ?auto_847817 ) ) ( not ( = ?auto_847812 ?auto_847818 ) ) ( not ( = ?auto_847812 ?auto_847819 ) ) ( not ( = ?auto_847812 ?auto_847820 ) ) ( not ( = ?auto_847812 ?auto_847821 ) ) ( not ( = ?auto_847812 ?auto_847822 ) ) ( not ( = ?auto_847812 ?auto_847823 ) ) ( not ( = ?auto_847812 ?auto_847824 ) ) ( not ( = ?auto_847813 ?auto_847814 ) ) ( not ( = ?auto_847813 ?auto_847815 ) ) ( not ( = ?auto_847813 ?auto_847816 ) ) ( not ( = ?auto_847813 ?auto_847817 ) ) ( not ( = ?auto_847813 ?auto_847818 ) ) ( not ( = ?auto_847813 ?auto_847819 ) ) ( not ( = ?auto_847813 ?auto_847820 ) ) ( not ( = ?auto_847813 ?auto_847821 ) ) ( not ( = ?auto_847813 ?auto_847822 ) ) ( not ( = ?auto_847813 ?auto_847823 ) ) ( not ( = ?auto_847813 ?auto_847824 ) ) ( not ( = ?auto_847814 ?auto_847815 ) ) ( not ( = ?auto_847814 ?auto_847816 ) ) ( not ( = ?auto_847814 ?auto_847817 ) ) ( not ( = ?auto_847814 ?auto_847818 ) ) ( not ( = ?auto_847814 ?auto_847819 ) ) ( not ( = ?auto_847814 ?auto_847820 ) ) ( not ( = ?auto_847814 ?auto_847821 ) ) ( not ( = ?auto_847814 ?auto_847822 ) ) ( not ( = ?auto_847814 ?auto_847823 ) ) ( not ( = ?auto_847814 ?auto_847824 ) ) ( not ( = ?auto_847815 ?auto_847816 ) ) ( not ( = ?auto_847815 ?auto_847817 ) ) ( not ( = ?auto_847815 ?auto_847818 ) ) ( not ( = ?auto_847815 ?auto_847819 ) ) ( not ( = ?auto_847815 ?auto_847820 ) ) ( not ( = ?auto_847815 ?auto_847821 ) ) ( not ( = ?auto_847815 ?auto_847822 ) ) ( not ( = ?auto_847815 ?auto_847823 ) ) ( not ( = ?auto_847815 ?auto_847824 ) ) ( not ( = ?auto_847816 ?auto_847817 ) ) ( not ( = ?auto_847816 ?auto_847818 ) ) ( not ( = ?auto_847816 ?auto_847819 ) ) ( not ( = ?auto_847816 ?auto_847820 ) ) ( not ( = ?auto_847816 ?auto_847821 ) ) ( not ( = ?auto_847816 ?auto_847822 ) ) ( not ( = ?auto_847816 ?auto_847823 ) ) ( not ( = ?auto_847816 ?auto_847824 ) ) ( not ( = ?auto_847817 ?auto_847818 ) ) ( not ( = ?auto_847817 ?auto_847819 ) ) ( not ( = ?auto_847817 ?auto_847820 ) ) ( not ( = ?auto_847817 ?auto_847821 ) ) ( not ( = ?auto_847817 ?auto_847822 ) ) ( not ( = ?auto_847817 ?auto_847823 ) ) ( not ( = ?auto_847817 ?auto_847824 ) ) ( not ( = ?auto_847818 ?auto_847819 ) ) ( not ( = ?auto_847818 ?auto_847820 ) ) ( not ( = ?auto_847818 ?auto_847821 ) ) ( not ( = ?auto_847818 ?auto_847822 ) ) ( not ( = ?auto_847818 ?auto_847823 ) ) ( not ( = ?auto_847818 ?auto_847824 ) ) ( not ( = ?auto_847819 ?auto_847820 ) ) ( not ( = ?auto_847819 ?auto_847821 ) ) ( not ( = ?auto_847819 ?auto_847822 ) ) ( not ( = ?auto_847819 ?auto_847823 ) ) ( not ( = ?auto_847819 ?auto_847824 ) ) ( not ( = ?auto_847820 ?auto_847821 ) ) ( not ( = ?auto_847820 ?auto_847822 ) ) ( not ( = ?auto_847820 ?auto_847823 ) ) ( not ( = ?auto_847820 ?auto_847824 ) ) ( not ( = ?auto_847821 ?auto_847822 ) ) ( not ( = ?auto_847821 ?auto_847823 ) ) ( not ( = ?auto_847821 ?auto_847824 ) ) ( not ( = ?auto_847822 ?auto_847823 ) ) ( not ( = ?auto_847822 ?auto_847824 ) ) ( not ( = ?auto_847823 ?auto_847824 ) ) ( ON ?auto_847822 ?auto_847823 ) ( ON ?auto_847821 ?auto_847822 ) ( ON ?auto_847820 ?auto_847821 ) ( ON ?auto_847819 ?auto_847820 ) ( ON ?auto_847818 ?auto_847819 ) ( ON ?auto_847817 ?auto_847818 ) ( ON ?auto_847816 ?auto_847817 ) ( CLEAR ?auto_847814 ) ( ON ?auto_847815 ?auto_847816 ) ( CLEAR ?auto_847815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_847812 ?auto_847813 ?auto_847814 ?auto_847815 )
      ( MAKE-12PILE ?auto_847812 ?auto_847813 ?auto_847814 ?auto_847815 ?auto_847816 ?auto_847817 ?auto_847818 ?auto_847819 ?auto_847820 ?auto_847821 ?auto_847822 ?auto_847823 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_847862 - BLOCK
      ?auto_847863 - BLOCK
      ?auto_847864 - BLOCK
      ?auto_847865 - BLOCK
      ?auto_847866 - BLOCK
      ?auto_847867 - BLOCK
      ?auto_847868 - BLOCK
      ?auto_847869 - BLOCK
      ?auto_847870 - BLOCK
      ?auto_847871 - BLOCK
      ?auto_847872 - BLOCK
      ?auto_847873 - BLOCK
    )
    :vars
    (
      ?auto_847874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_847873 ?auto_847874 ) ( ON-TABLE ?auto_847862 ) ( ON ?auto_847863 ?auto_847862 ) ( not ( = ?auto_847862 ?auto_847863 ) ) ( not ( = ?auto_847862 ?auto_847864 ) ) ( not ( = ?auto_847862 ?auto_847865 ) ) ( not ( = ?auto_847862 ?auto_847866 ) ) ( not ( = ?auto_847862 ?auto_847867 ) ) ( not ( = ?auto_847862 ?auto_847868 ) ) ( not ( = ?auto_847862 ?auto_847869 ) ) ( not ( = ?auto_847862 ?auto_847870 ) ) ( not ( = ?auto_847862 ?auto_847871 ) ) ( not ( = ?auto_847862 ?auto_847872 ) ) ( not ( = ?auto_847862 ?auto_847873 ) ) ( not ( = ?auto_847862 ?auto_847874 ) ) ( not ( = ?auto_847863 ?auto_847864 ) ) ( not ( = ?auto_847863 ?auto_847865 ) ) ( not ( = ?auto_847863 ?auto_847866 ) ) ( not ( = ?auto_847863 ?auto_847867 ) ) ( not ( = ?auto_847863 ?auto_847868 ) ) ( not ( = ?auto_847863 ?auto_847869 ) ) ( not ( = ?auto_847863 ?auto_847870 ) ) ( not ( = ?auto_847863 ?auto_847871 ) ) ( not ( = ?auto_847863 ?auto_847872 ) ) ( not ( = ?auto_847863 ?auto_847873 ) ) ( not ( = ?auto_847863 ?auto_847874 ) ) ( not ( = ?auto_847864 ?auto_847865 ) ) ( not ( = ?auto_847864 ?auto_847866 ) ) ( not ( = ?auto_847864 ?auto_847867 ) ) ( not ( = ?auto_847864 ?auto_847868 ) ) ( not ( = ?auto_847864 ?auto_847869 ) ) ( not ( = ?auto_847864 ?auto_847870 ) ) ( not ( = ?auto_847864 ?auto_847871 ) ) ( not ( = ?auto_847864 ?auto_847872 ) ) ( not ( = ?auto_847864 ?auto_847873 ) ) ( not ( = ?auto_847864 ?auto_847874 ) ) ( not ( = ?auto_847865 ?auto_847866 ) ) ( not ( = ?auto_847865 ?auto_847867 ) ) ( not ( = ?auto_847865 ?auto_847868 ) ) ( not ( = ?auto_847865 ?auto_847869 ) ) ( not ( = ?auto_847865 ?auto_847870 ) ) ( not ( = ?auto_847865 ?auto_847871 ) ) ( not ( = ?auto_847865 ?auto_847872 ) ) ( not ( = ?auto_847865 ?auto_847873 ) ) ( not ( = ?auto_847865 ?auto_847874 ) ) ( not ( = ?auto_847866 ?auto_847867 ) ) ( not ( = ?auto_847866 ?auto_847868 ) ) ( not ( = ?auto_847866 ?auto_847869 ) ) ( not ( = ?auto_847866 ?auto_847870 ) ) ( not ( = ?auto_847866 ?auto_847871 ) ) ( not ( = ?auto_847866 ?auto_847872 ) ) ( not ( = ?auto_847866 ?auto_847873 ) ) ( not ( = ?auto_847866 ?auto_847874 ) ) ( not ( = ?auto_847867 ?auto_847868 ) ) ( not ( = ?auto_847867 ?auto_847869 ) ) ( not ( = ?auto_847867 ?auto_847870 ) ) ( not ( = ?auto_847867 ?auto_847871 ) ) ( not ( = ?auto_847867 ?auto_847872 ) ) ( not ( = ?auto_847867 ?auto_847873 ) ) ( not ( = ?auto_847867 ?auto_847874 ) ) ( not ( = ?auto_847868 ?auto_847869 ) ) ( not ( = ?auto_847868 ?auto_847870 ) ) ( not ( = ?auto_847868 ?auto_847871 ) ) ( not ( = ?auto_847868 ?auto_847872 ) ) ( not ( = ?auto_847868 ?auto_847873 ) ) ( not ( = ?auto_847868 ?auto_847874 ) ) ( not ( = ?auto_847869 ?auto_847870 ) ) ( not ( = ?auto_847869 ?auto_847871 ) ) ( not ( = ?auto_847869 ?auto_847872 ) ) ( not ( = ?auto_847869 ?auto_847873 ) ) ( not ( = ?auto_847869 ?auto_847874 ) ) ( not ( = ?auto_847870 ?auto_847871 ) ) ( not ( = ?auto_847870 ?auto_847872 ) ) ( not ( = ?auto_847870 ?auto_847873 ) ) ( not ( = ?auto_847870 ?auto_847874 ) ) ( not ( = ?auto_847871 ?auto_847872 ) ) ( not ( = ?auto_847871 ?auto_847873 ) ) ( not ( = ?auto_847871 ?auto_847874 ) ) ( not ( = ?auto_847872 ?auto_847873 ) ) ( not ( = ?auto_847872 ?auto_847874 ) ) ( not ( = ?auto_847873 ?auto_847874 ) ) ( ON ?auto_847872 ?auto_847873 ) ( ON ?auto_847871 ?auto_847872 ) ( ON ?auto_847870 ?auto_847871 ) ( ON ?auto_847869 ?auto_847870 ) ( ON ?auto_847868 ?auto_847869 ) ( ON ?auto_847867 ?auto_847868 ) ( ON ?auto_847866 ?auto_847867 ) ( ON ?auto_847865 ?auto_847866 ) ( CLEAR ?auto_847863 ) ( ON ?auto_847864 ?auto_847865 ) ( CLEAR ?auto_847864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_847862 ?auto_847863 ?auto_847864 )
      ( MAKE-12PILE ?auto_847862 ?auto_847863 ?auto_847864 ?auto_847865 ?auto_847866 ?auto_847867 ?auto_847868 ?auto_847869 ?auto_847870 ?auto_847871 ?auto_847872 ?auto_847873 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_847912 - BLOCK
      ?auto_847913 - BLOCK
      ?auto_847914 - BLOCK
      ?auto_847915 - BLOCK
      ?auto_847916 - BLOCK
      ?auto_847917 - BLOCK
      ?auto_847918 - BLOCK
      ?auto_847919 - BLOCK
      ?auto_847920 - BLOCK
      ?auto_847921 - BLOCK
      ?auto_847922 - BLOCK
      ?auto_847923 - BLOCK
    )
    :vars
    (
      ?auto_847924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_847923 ?auto_847924 ) ( ON-TABLE ?auto_847912 ) ( not ( = ?auto_847912 ?auto_847913 ) ) ( not ( = ?auto_847912 ?auto_847914 ) ) ( not ( = ?auto_847912 ?auto_847915 ) ) ( not ( = ?auto_847912 ?auto_847916 ) ) ( not ( = ?auto_847912 ?auto_847917 ) ) ( not ( = ?auto_847912 ?auto_847918 ) ) ( not ( = ?auto_847912 ?auto_847919 ) ) ( not ( = ?auto_847912 ?auto_847920 ) ) ( not ( = ?auto_847912 ?auto_847921 ) ) ( not ( = ?auto_847912 ?auto_847922 ) ) ( not ( = ?auto_847912 ?auto_847923 ) ) ( not ( = ?auto_847912 ?auto_847924 ) ) ( not ( = ?auto_847913 ?auto_847914 ) ) ( not ( = ?auto_847913 ?auto_847915 ) ) ( not ( = ?auto_847913 ?auto_847916 ) ) ( not ( = ?auto_847913 ?auto_847917 ) ) ( not ( = ?auto_847913 ?auto_847918 ) ) ( not ( = ?auto_847913 ?auto_847919 ) ) ( not ( = ?auto_847913 ?auto_847920 ) ) ( not ( = ?auto_847913 ?auto_847921 ) ) ( not ( = ?auto_847913 ?auto_847922 ) ) ( not ( = ?auto_847913 ?auto_847923 ) ) ( not ( = ?auto_847913 ?auto_847924 ) ) ( not ( = ?auto_847914 ?auto_847915 ) ) ( not ( = ?auto_847914 ?auto_847916 ) ) ( not ( = ?auto_847914 ?auto_847917 ) ) ( not ( = ?auto_847914 ?auto_847918 ) ) ( not ( = ?auto_847914 ?auto_847919 ) ) ( not ( = ?auto_847914 ?auto_847920 ) ) ( not ( = ?auto_847914 ?auto_847921 ) ) ( not ( = ?auto_847914 ?auto_847922 ) ) ( not ( = ?auto_847914 ?auto_847923 ) ) ( not ( = ?auto_847914 ?auto_847924 ) ) ( not ( = ?auto_847915 ?auto_847916 ) ) ( not ( = ?auto_847915 ?auto_847917 ) ) ( not ( = ?auto_847915 ?auto_847918 ) ) ( not ( = ?auto_847915 ?auto_847919 ) ) ( not ( = ?auto_847915 ?auto_847920 ) ) ( not ( = ?auto_847915 ?auto_847921 ) ) ( not ( = ?auto_847915 ?auto_847922 ) ) ( not ( = ?auto_847915 ?auto_847923 ) ) ( not ( = ?auto_847915 ?auto_847924 ) ) ( not ( = ?auto_847916 ?auto_847917 ) ) ( not ( = ?auto_847916 ?auto_847918 ) ) ( not ( = ?auto_847916 ?auto_847919 ) ) ( not ( = ?auto_847916 ?auto_847920 ) ) ( not ( = ?auto_847916 ?auto_847921 ) ) ( not ( = ?auto_847916 ?auto_847922 ) ) ( not ( = ?auto_847916 ?auto_847923 ) ) ( not ( = ?auto_847916 ?auto_847924 ) ) ( not ( = ?auto_847917 ?auto_847918 ) ) ( not ( = ?auto_847917 ?auto_847919 ) ) ( not ( = ?auto_847917 ?auto_847920 ) ) ( not ( = ?auto_847917 ?auto_847921 ) ) ( not ( = ?auto_847917 ?auto_847922 ) ) ( not ( = ?auto_847917 ?auto_847923 ) ) ( not ( = ?auto_847917 ?auto_847924 ) ) ( not ( = ?auto_847918 ?auto_847919 ) ) ( not ( = ?auto_847918 ?auto_847920 ) ) ( not ( = ?auto_847918 ?auto_847921 ) ) ( not ( = ?auto_847918 ?auto_847922 ) ) ( not ( = ?auto_847918 ?auto_847923 ) ) ( not ( = ?auto_847918 ?auto_847924 ) ) ( not ( = ?auto_847919 ?auto_847920 ) ) ( not ( = ?auto_847919 ?auto_847921 ) ) ( not ( = ?auto_847919 ?auto_847922 ) ) ( not ( = ?auto_847919 ?auto_847923 ) ) ( not ( = ?auto_847919 ?auto_847924 ) ) ( not ( = ?auto_847920 ?auto_847921 ) ) ( not ( = ?auto_847920 ?auto_847922 ) ) ( not ( = ?auto_847920 ?auto_847923 ) ) ( not ( = ?auto_847920 ?auto_847924 ) ) ( not ( = ?auto_847921 ?auto_847922 ) ) ( not ( = ?auto_847921 ?auto_847923 ) ) ( not ( = ?auto_847921 ?auto_847924 ) ) ( not ( = ?auto_847922 ?auto_847923 ) ) ( not ( = ?auto_847922 ?auto_847924 ) ) ( not ( = ?auto_847923 ?auto_847924 ) ) ( ON ?auto_847922 ?auto_847923 ) ( ON ?auto_847921 ?auto_847922 ) ( ON ?auto_847920 ?auto_847921 ) ( ON ?auto_847919 ?auto_847920 ) ( ON ?auto_847918 ?auto_847919 ) ( ON ?auto_847917 ?auto_847918 ) ( ON ?auto_847916 ?auto_847917 ) ( ON ?auto_847915 ?auto_847916 ) ( ON ?auto_847914 ?auto_847915 ) ( CLEAR ?auto_847912 ) ( ON ?auto_847913 ?auto_847914 ) ( CLEAR ?auto_847913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_847912 ?auto_847913 )
      ( MAKE-12PILE ?auto_847912 ?auto_847913 ?auto_847914 ?auto_847915 ?auto_847916 ?auto_847917 ?auto_847918 ?auto_847919 ?auto_847920 ?auto_847921 ?auto_847922 ?auto_847923 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_847962 - BLOCK
      ?auto_847963 - BLOCK
      ?auto_847964 - BLOCK
      ?auto_847965 - BLOCK
      ?auto_847966 - BLOCK
      ?auto_847967 - BLOCK
      ?auto_847968 - BLOCK
      ?auto_847969 - BLOCK
      ?auto_847970 - BLOCK
      ?auto_847971 - BLOCK
      ?auto_847972 - BLOCK
      ?auto_847973 - BLOCK
    )
    :vars
    (
      ?auto_847974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_847973 ?auto_847974 ) ( not ( = ?auto_847962 ?auto_847963 ) ) ( not ( = ?auto_847962 ?auto_847964 ) ) ( not ( = ?auto_847962 ?auto_847965 ) ) ( not ( = ?auto_847962 ?auto_847966 ) ) ( not ( = ?auto_847962 ?auto_847967 ) ) ( not ( = ?auto_847962 ?auto_847968 ) ) ( not ( = ?auto_847962 ?auto_847969 ) ) ( not ( = ?auto_847962 ?auto_847970 ) ) ( not ( = ?auto_847962 ?auto_847971 ) ) ( not ( = ?auto_847962 ?auto_847972 ) ) ( not ( = ?auto_847962 ?auto_847973 ) ) ( not ( = ?auto_847962 ?auto_847974 ) ) ( not ( = ?auto_847963 ?auto_847964 ) ) ( not ( = ?auto_847963 ?auto_847965 ) ) ( not ( = ?auto_847963 ?auto_847966 ) ) ( not ( = ?auto_847963 ?auto_847967 ) ) ( not ( = ?auto_847963 ?auto_847968 ) ) ( not ( = ?auto_847963 ?auto_847969 ) ) ( not ( = ?auto_847963 ?auto_847970 ) ) ( not ( = ?auto_847963 ?auto_847971 ) ) ( not ( = ?auto_847963 ?auto_847972 ) ) ( not ( = ?auto_847963 ?auto_847973 ) ) ( not ( = ?auto_847963 ?auto_847974 ) ) ( not ( = ?auto_847964 ?auto_847965 ) ) ( not ( = ?auto_847964 ?auto_847966 ) ) ( not ( = ?auto_847964 ?auto_847967 ) ) ( not ( = ?auto_847964 ?auto_847968 ) ) ( not ( = ?auto_847964 ?auto_847969 ) ) ( not ( = ?auto_847964 ?auto_847970 ) ) ( not ( = ?auto_847964 ?auto_847971 ) ) ( not ( = ?auto_847964 ?auto_847972 ) ) ( not ( = ?auto_847964 ?auto_847973 ) ) ( not ( = ?auto_847964 ?auto_847974 ) ) ( not ( = ?auto_847965 ?auto_847966 ) ) ( not ( = ?auto_847965 ?auto_847967 ) ) ( not ( = ?auto_847965 ?auto_847968 ) ) ( not ( = ?auto_847965 ?auto_847969 ) ) ( not ( = ?auto_847965 ?auto_847970 ) ) ( not ( = ?auto_847965 ?auto_847971 ) ) ( not ( = ?auto_847965 ?auto_847972 ) ) ( not ( = ?auto_847965 ?auto_847973 ) ) ( not ( = ?auto_847965 ?auto_847974 ) ) ( not ( = ?auto_847966 ?auto_847967 ) ) ( not ( = ?auto_847966 ?auto_847968 ) ) ( not ( = ?auto_847966 ?auto_847969 ) ) ( not ( = ?auto_847966 ?auto_847970 ) ) ( not ( = ?auto_847966 ?auto_847971 ) ) ( not ( = ?auto_847966 ?auto_847972 ) ) ( not ( = ?auto_847966 ?auto_847973 ) ) ( not ( = ?auto_847966 ?auto_847974 ) ) ( not ( = ?auto_847967 ?auto_847968 ) ) ( not ( = ?auto_847967 ?auto_847969 ) ) ( not ( = ?auto_847967 ?auto_847970 ) ) ( not ( = ?auto_847967 ?auto_847971 ) ) ( not ( = ?auto_847967 ?auto_847972 ) ) ( not ( = ?auto_847967 ?auto_847973 ) ) ( not ( = ?auto_847967 ?auto_847974 ) ) ( not ( = ?auto_847968 ?auto_847969 ) ) ( not ( = ?auto_847968 ?auto_847970 ) ) ( not ( = ?auto_847968 ?auto_847971 ) ) ( not ( = ?auto_847968 ?auto_847972 ) ) ( not ( = ?auto_847968 ?auto_847973 ) ) ( not ( = ?auto_847968 ?auto_847974 ) ) ( not ( = ?auto_847969 ?auto_847970 ) ) ( not ( = ?auto_847969 ?auto_847971 ) ) ( not ( = ?auto_847969 ?auto_847972 ) ) ( not ( = ?auto_847969 ?auto_847973 ) ) ( not ( = ?auto_847969 ?auto_847974 ) ) ( not ( = ?auto_847970 ?auto_847971 ) ) ( not ( = ?auto_847970 ?auto_847972 ) ) ( not ( = ?auto_847970 ?auto_847973 ) ) ( not ( = ?auto_847970 ?auto_847974 ) ) ( not ( = ?auto_847971 ?auto_847972 ) ) ( not ( = ?auto_847971 ?auto_847973 ) ) ( not ( = ?auto_847971 ?auto_847974 ) ) ( not ( = ?auto_847972 ?auto_847973 ) ) ( not ( = ?auto_847972 ?auto_847974 ) ) ( not ( = ?auto_847973 ?auto_847974 ) ) ( ON ?auto_847972 ?auto_847973 ) ( ON ?auto_847971 ?auto_847972 ) ( ON ?auto_847970 ?auto_847971 ) ( ON ?auto_847969 ?auto_847970 ) ( ON ?auto_847968 ?auto_847969 ) ( ON ?auto_847967 ?auto_847968 ) ( ON ?auto_847966 ?auto_847967 ) ( ON ?auto_847965 ?auto_847966 ) ( ON ?auto_847964 ?auto_847965 ) ( ON ?auto_847963 ?auto_847964 ) ( ON ?auto_847962 ?auto_847963 ) ( CLEAR ?auto_847962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_847962 )
      ( MAKE-12PILE ?auto_847962 ?auto_847963 ?auto_847964 ?auto_847965 ?auto_847966 ?auto_847967 ?auto_847968 ?auto_847969 ?auto_847970 ?auto_847971 ?auto_847972 ?auto_847973 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_848013 - BLOCK
      ?auto_848014 - BLOCK
      ?auto_848015 - BLOCK
      ?auto_848016 - BLOCK
      ?auto_848017 - BLOCK
      ?auto_848018 - BLOCK
      ?auto_848019 - BLOCK
      ?auto_848020 - BLOCK
      ?auto_848021 - BLOCK
      ?auto_848022 - BLOCK
      ?auto_848023 - BLOCK
      ?auto_848024 - BLOCK
      ?auto_848025 - BLOCK
    )
    :vars
    (
      ?auto_848026 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_848024 ) ( ON ?auto_848025 ?auto_848026 ) ( CLEAR ?auto_848025 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_848013 ) ( ON ?auto_848014 ?auto_848013 ) ( ON ?auto_848015 ?auto_848014 ) ( ON ?auto_848016 ?auto_848015 ) ( ON ?auto_848017 ?auto_848016 ) ( ON ?auto_848018 ?auto_848017 ) ( ON ?auto_848019 ?auto_848018 ) ( ON ?auto_848020 ?auto_848019 ) ( ON ?auto_848021 ?auto_848020 ) ( ON ?auto_848022 ?auto_848021 ) ( ON ?auto_848023 ?auto_848022 ) ( ON ?auto_848024 ?auto_848023 ) ( not ( = ?auto_848013 ?auto_848014 ) ) ( not ( = ?auto_848013 ?auto_848015 ) ) ( not ( = ?auto_848013 ?auto_848016 ) ) ( not ( = ?auto_848013 ?auto_848017 ) ) ( not ( = ?auto_848013 ?auto_848018 ) ) ( not ( = ?auto_848013 ?auto_848019 ) ) ( not ( = ?auto_848013 ?auto_848020 ) ) ( not ( = ?auto_848013 ?auto_848021 ) ) ( not ( = ?auto_848013 ?auto_848022 ) ) ( not ( = ?auto_848013 ?auto_848023 ) ) ( not ( = ?auto_848013 ?auto_848024 ) ) ( not ( = ?auto_848013 ?auto_848025 ) ) ( not ( = ?auto_848013 ?auto_848026 ) ) ( not ( = ?auto_848014 ?auto_848015 ) ) ( not ( = ?auto_848014 ?auto_848016 ) ) ( not ( = ?auto_848014 ?auto_848017 ) ) ( not ( = ?auto_848014 ?auto_848018 ) ) ( not ( = ?auto_848014 ?auto_848019 ) ) ( not ( = ?auto_848014 ?auto_848020 ) ) ( not ( = ?auto_848014 ?auto_848021 ) ) ( not ( = ?auto_848014 ?auto_848022 ) ) ( not ( = ?auto_848014 ?auto_848023 ) ) ( not ( = ?auto_848014 ?auto_848024 ) ) ( not ( = ?auto_848014 ?auto_848025 ) ) ( not ( = ?auto_848014 ?auto_848026 ) ) ( not ( = ?auto_848015 ?auto_848016 ) ) ( not ( = ?auto_848015 ?auto_848017 ) ) ( not ( = ?auto_848015 ?auto_848018 ) ) ( not ( = ?auto_848015 ?auto_848019 ) ) ( not ( = ?auto_848015 ?auto_848020 ) ) ( not ( = ?auto_848015 ?auto_848021 ) ) ( not ( = ?auto_848015 ?auto_848022 ) ) ( not ( = ?auto_848015 ?auto_848023 ) ) ( not ( = ?auto_848015 ?auto_848024 ) ) ( not ( = ?auto_848015 ?auto_848025 ) ) ( not ( = ?auto_848015 ?auto_848026 ) ) ( not ( = ?auto_848016 ?auto_848017 ) ) ( not ( = ?auto_848016 ?auto_848018 ) ) ( not ( = ?auto_848016 ?auto_848019 ) ) ( not ( = ?auto_848016 ?auto_848020 ) ) ( not ( = ?auto_848016 ?auto_848021 ) ) ( not ( = ?auto_848016 ?auto_848022 ) ) ( not ( = ?auto_848016 ?auto_848023 ) ) ( not ( = ?auto_848016 ?auto_848024 ) ) ( not ( = ?auto_848016 ?auto_848025 ) ) ( not ( = ?auto_848016 ?auto_848026 ) ) ( not ( = ?auto_848017 ?auto_848018 ) ) ( not ( = ?auto_848017 ?auto_848019 ) ) ( not ( = ?auto_848017 ?auto_848020 ) ) ( not ( = ?auto_848017 ?auto_848021 ) ) ( not ( = ?auto_848017 ?auto_848022 ) ) ( not ( = ?auto_848017 ?auto_848023 ) ) ( not ( = ?auto_848017 ?auto_848024 ) ) ( not ( = ?auto_848017 ?auto_848025 ) ) ( not ( = ?auto_848017 ?auto_848026 ) ) ( not ( = ?auto_848018 ?auto_848019 ) ) ( not ( = ?auto_848018 ?auto_848020 ) ) ( not ( = ?auto_848018 ?auto_848021 ) ) ( not ( = ?auto_848018 ?auto_848022 ) ) ( not ( = ?auto_848018 ?auto_848023 ) ) ( not ( = ?auto_848018 ?auto_848024 ) ) ( not ( = ?auto_848018 ?auto_848025 ) ) ( not ( = ?auto_848018 ?auto_848026 ) ) ( not ( = ?auto_848019 ?auto_848020 ) ) ( not ( = ?auto_848019 ?auto_848021 ) ) ( not ( = ?auto_848019 ?auto_848022 ) ) ( not ( = ?auto_848019 ?auto_848023 ) ) ( not ( = ?auto_848019 ?auto_848024 ) ) ( not ( = ?auto_848019 ?auto_848025 ) ) ( not ( = ?auto_848019 ?auto_848026 ) ) ( not ( = ?auto_848020 ?auto_848021 ) ) ( not ( = ?auto_848020 ?auto_848022 ) ) ( not ( = ?auto_848020 ?auto_848023 ) ) ( not ( = ?auto_848020 ?auto_848024 ) ) ( not ( = ?auto_848020 ?auto_848025 ) ) ( not ( = ?auto_848020 ?auto_848026 ) ) ( not ( = ?auto_848021 ?auto_848022 ) ) ( not ( = ?auto_848021 ?auto_848023 ) ) ( not ( = ?auto_848021 ?auto_848024 ) ) ( not ( = ?auto_848021 ?auto_848025 ) ) ( not ( = ?auto_848021 ?auto_848026 ) ) ( not ( = ?auto_848022 ?auto_848023 ) ) ( not ( = ?auto_848022 ?auto_848024 ) ) ( not ( = ?auto_848022 ?auto_848025 ) ) ( not ( = ?auto_848022 ?auto_848026 ) ) ( not ( = ?auto_848023 ?auto_848024 ) ) ( not ( = ?auto_848023 ?auto_848025 ) ) ( not ( = ?auto_848023 ?auto_848026 ) ) ( not ( = ?auto_848024 ?auto_848025 ) ) ( not ( = ?auto_848024 ?auto_848026 ) ) ( not ( = ?auto_848025 ?auto_848026 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_848025 ?auto_848026 )
      ( !STACK ?auto_848025 ?auto_848024 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_848067 - BLOCK
      ?auto_848068 - BLOCK
      ?auto_848069 - BLOCK
      ?auto_848070 - BLOCK
      ?auto_848071 - BLOCK
      ?auto_848072 - BLOCK
      ?auto_848073 - BLOCK
      ?auto_848074 - BLOCK
      ?auto_848075 - BLOCK
      ?auto_848076 - BLOCK
      ?auto_848077 - BLOCK
      ?auto_848078 - BLOCK
      ?auto_848079 - BLOCK
    )
    :vars
    (
      ?auto_848080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_848079 ?auto_848080 ) ( ON-TABLE ?auto_848067 ) ( ON ?auto_848068 ?auto_848067 ) ( ON ?auto_848069 ?auto_848068 ) ( ON ?auto_848070 ?auto_848069 ) ( ON ?auto_848071 ?auto_848070 ) ( ON ?auto_848072 ?auto_848071 ) ( ON ?auto_848073 ?auto_848072 ) ( ON ?auto_848074 ?auto_848073 ) ( ON ?auto_848075 ?auto_848074 ) ( ON ?auto_848076 ?auto_848075 ) ( ON ?auto_848077 ?auto_848076 ) ( not ( = ?auto_848067 ?auto_848068 ) ) ( not ( = ?auto_848067 ?auto_848069 ) ) ( not ( = ?auto_848067 ?auto_848070 ) ) ( not ( = ?auto_848067 ?auto_848071 ) ) ( not ( = ?auto_848067 ?auto_848072 ) ) ( not ( = ?auto_848067 ?auto_848073 ) ) ( not ( = ?auto_848067 ?auto_848074 ) ) ( not ( = ?auto_848067 ?auto_848075 ) ) ( not ( = ?auto_848067 ?auto_848076 ) ) ( not ( = ?auto_848067 ?auto_848077 ) ) ( not ( = ?auto_848067 ?auto_848078 ) ) ( not ( = ?auto_848067 ?auto_848079 ) ) ( not ( = ?auto_848067 ?auto_848080 ) ) ( not ( = ?auto_848068 ?auto_848069 ) ) ( not ( = ?auto_848068 ?auto_848070 ) ) ( not ( = ?auto_848068 ?auto_848071 ) ) ( not ( = ?auto_848068 ?auto_848072 ) ) ( not ( = ?auto_848068 ?auto_848073 ) ) ( not ( = ?auto_848068 ?auto_848074 ) ) ( not ( = ?auto_848068 ?auto_848075 ) ) ( not ( = ?auto_848068 ?auto_848076 ) ) ( not ( = ?auto_848068 ?auto_848077 ) ) ( not ( = ?auto_848068 ?auto_848078 ) ) ( not ( = ?auto_848068 ?auto_848079 ) ) ( not ( = ?auto_848068 ?auto_848080 ) ) ( not ( = ?auto_848069 ?auto_848070 ) ) ( not ( = ?auto_848069 ?auto_848071 ) ) ( not ( = ?auto_848069 ?auto_848072 ) ) ( not ( = ?auto_848069 ?auto_848073 ) ) ( not ( = ?auto_848069 ?auto_848074 ) ) ( not ( = ?auto_848069 ?auto_848075 ) ) ( not ( = ?auto_848069 ?auto_848076 ) ) ( not ( = ?auto_848069 ?auto_848077 ) ) ( not ( = ?auto_848069 ?auto_848078 ) ) ( not ( = ?auto_848069 ?auto_848079 ) ) ( not ( = ?auto_848069 ?auto_848080 ) ) ( not ( = ?auto_848070 ?auto_848071 ) ) ( not ( = ?auto_848070 ?auto_848072 ) ) ( not ( = ?auto_848070 ?auto_848073 ) ) ( not ( = ?auto_848070 ?auto_848074 ) ) ( not ( = ?auto_848070 ?auto_848075 ) ) ( not ( = ?auto_848070 ?auto_848076 ) ) ( not ( = ?auto_848070 ?auto_848077 ) ) ( not ( = ?auto_848070 ?auto_848078 ) ) ( not ( = ?auto_848070 ?auto_848079 ) ) ( not ( = ?auto_848070 ?auto_848080 ) ) ( not ( = ?auto_848071 ?auto_848072 ) ) ( not ( = ?auto_848071 ?auto_848073 ) ) ( not ( = ?auto_848071 ?auto_848074 ) ) ( not ( = ?auto_848071 ?auto_848075 ) ) ( not ( = ?auto_848071 ?auto_848076 ) ) ( not ( = ?auto_848071 ?auto_848077 ) ) ( not ( = ?auto_848071 ?auto_848078 ) ) ( not ( = ?auto_848071 ?auto_848079 ) ) ( not ( = ?auto_848071 ?auto_848080 ) ) ( not ( = ?auto_848072 ?auto_848073 ) ) ( not ( = ?auto_848072 ?auto_848074 ) ) ( not ( = ?auto_848072 ?auto_848075 ) ) ( not ( = ?auto_848072 ?auto_848076 ) ) ( not ( = ?auto_848072 ?auto_848077 ) ) ( not ( = ?auto_848072 ?auto_848078 ) ) ( not ( = ?auto_848072 ?auto_848079 ) ) ( not ( = ?auto_848072 ?auto_848080 ) ) ( not ( = ?auto_848073 ?auto_848074 ) ) ( not ( = ?auto_848073 ?auto_848075 ) ) ( not ( = ?auto_848073 ?auto_848076 ) ) ( not ( = ?auto_848073 ?auto_848077 ) ) ( not ( = ?auto_848073 ?auto_848078 ) ) ( not ( = ?auto_848073 ?auto_848079 ) ) ( not ( = ?auto_848073 ?auto_848080 ) ) ( not ( = ?auto_848074 ?auto_848075 ) ) ( not ( = ?auto_848074 ?auto_848076 ) ) ( not ( = ?auto_848074 ?auto_848077 ) ) ( not ( = ?auto_848074 ?auto_848078 ) ) ( not ( = ?auto_848074 ?auto_848079 ) ) ( not ( = ?auto_848074 ?auto_848080 ) ) ( not ( = ?auto_848075 ?auto_848076 ) ) ( not ( = ?auto_848075 ?auto_848077 ) ) ( not ( = ?auto_848075 ?auto_848078 ) ) ( not ( = ?auto_848075 ?auto_848079 ) ) ( not ( = ?auto_848075 ?auto_848080 ) ) ( not ( = ?auto_848076 ?auto_848077 ) ) ( not ( = ?auto_848076 ?auto_848078 ) ) ( not ( = ?auto_848076 ?auto_848079 ) ) ( not ( = ?auto_848076 ?auto_848080 ) ) ( not ( = ?auto_848077 ?auto_848078 ) ) ( not ( = ?auto_848077 ?auto_848079 ) ) ( not ( = ?auto_848077 ?auto_848080 ) ) ( not ( = ?auto_848078 ?auto_848079 ) ) ( not ( = ?auto_848078 ?auto_848080 ) ) ( not ( = ?auto_848079 ?auto_848080 ) ) ( CLEAR ?auto_848077 ) ( ON ?auto_848078 ?auto_848079 ) ( CLEAR ?auto_848078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_848067 ?auto_848068 ?auto_848069 ?auto_848070 ?auto_848071 ?auto_848072 ?auto_848073 ?auto_848074 ?auto_848075 ?auto_848076 ?auto_848077 ?auto_848078 )
      ( MAKE-13PILE ?auto_848067 ?auto_848068 ?auto_848069 ?auto_848070 ?auto_848071 ?auto_848072 ?auto_848073 ?auto_848074 ?auto_848075 ?auto_848076 ?auto_848077 ?auto_848078 ?auto_848079 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_848121 - BLOCK
      ?auto_848122 - BLOCK
      ?auto_848123 - BLOCK
      ?auto_848124 - BLOCK
      ?auto_848125 - BLOCK
      ?auto_848126 - BLOCK
      ?auto_848127 - BLOCK
      ?auto_848128 - BLOCK
      ?auto_848129 - BLOCK
      ?auto_848130 - BLOCK
      ?auto_848131 - BLOCK
      ?auto_848132 - BLOCK
      ?auto_848133 - BLOCK
    )
    :vars
    (
      ?auto_848134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_848133 ?auto_848134 ) ( ON-TABLE ?auto_848121 ) ( ON ?auto_848122 ?auto_848121 ) ( ON ?auto_848123 ?auto_848122 ) ( ON ?auto_848124 ?auto_848123 ) ( ON ?auto_848125 ?auto_848124 ) ( ON ?auto_848126 ?auto_848125 ) ( ON ?auto_848127 ?auto_848126 ) ( ON ?auto_848128 ?auto_848127 ) ( ON ?auto_848129 ?auto_848128 ) ( ON ?auto_848130 ?auto_848129 ) ( not ( = ?auto_848121 ?auto_848122 ) ) ( not ( = ?auto_848121 ?auto_848123 ) ) ( not ( = ?auto_848121 ?auto_848124 ) ) ( not ( = ?auto_848121 ?auto_848125 ) ) ( not ( = ?auto_848121 ?auto_848126 ) ) ( not ( = ?auto_848121 ?auto_848127 ) ) ( not ( = ?auto_848121 ?auto_848128 ) ) ( not ( = ?auto_848121 ?auto_848129 ) ) ( not ( = ?auto_848121 ?auto_848130 ) ) ( not ( = ?auto_848121 ?auto_848131 ) ) ( not ( = ?auto_848121 ?auto_848132 ) ) ( not ( = ?auto_848121 ?auto_848133 ) ) ( not ( = ?auto_848121 ?auto_848134 ) ) ( not ( = ?auto_848122 ?auto_848123 ) ) ( not ( = ?auto_848122 ?auto_848124 ) ) ( not ( = ?auto_848122 ?auto_848125 ) ) ( not ( = ?auto_848122 ?auto_848126 ) ) ( not ( = ?auto_848122 ?auto_848127 ) ) ( not ( = ?auto_848122 ?auto_848128 ) ) ( not ( = ?auto_848122 ?auto_848129 ) ) ( not ( = ?auto_848122 ?auto_848130 ) ) ( not ( = ?auto_848122 ?auto_848131 ) ) ( not ( = ?auto_848122 ?auto_848132 ) ) ( not ( = ?auto_848122 ?auto_848133 ) ) ( not ( = ?auto_848122 ?auto_848134 ) ) ( not ( = ?auto_848123 ?auto_848124 ) ) ( not ( = ?auto_848123 ?auto_848125 ) ) ( not ( = ?auto_848123 ?auto_848126 ) ) ( not ( = ?auto_848123 ?auto_848127 ) ) ( not ( = ?auto_848123 ?auto_848128 ) ) ( not ( = ?auto_848123 ?auto_848129 ) ) ( not ( = ?auto_848123 ?auto_848130 ) ) ( not ( = ?auto_848123 ?auto_848131 ) ) ( not ( = ?auto_848123 ?auto_848132 ) ) ( not ( = ?auto_848123 ?auto_848133 ) ) ( not ( = ?auto_848123 ?auto_848134 ) ) ( not ( = ?auto_848124 ?auto_848125 ) ) ( not ( = ?auto_848124 ?auto_848126 ) ) ( not ( = ?auto_848124 ?auto_848127 ) ) ( not ( = ?auto_848124 ?auto_848128 ) ) ( not ( = ?auto_848124 ?auto_848129 ) ) ( not ( = ?auto_848124 ?auto_848130 ) ) ( not ( = ?auto_848124 ?auto_848131 ) ) ( not ( = ?auto_848124 ?auto_848132 ) ) ( not ( = ?auto_848124 ?auto_848133 ) ) ( not ( = ?auto_848124 ?auto_848134 ) ) ( not ( = ?auto_848125 ?auto_848126 ) ) ( not ( = ?auto_848125 ?auto_848127 ) ) ( not ( = ?auto_848125 ?auto_848128 ) ) ( not ( = ?auto_848125 ?auto_848129 ) ) ( not ( = ?auto_848125 ?auto_848130 ) ) ( not ( = ?auto_848125 ?auto_848131 ) ) ( not ( = ?auto_848125 ?auto_848132 ) ) ( not ( = ?auto_848125 ?auto_848133 ) ) ( not ( = ?auto_848125 ?auto_848134 ) ) ( not ( = ?auto_848126 ?auto_848127 ) ) ( not ( = ?auto_848126 ?auto_848128 ) ) ( not ( = ?auto_848126 ?auto_848129 ) ) ( not ( = ?auto_848126 ?auto_848130 ) ) ( not ( = ?auto_848126 ?auto_848131 ) ) ( not ( = ?auto_848126 ?auto_848132 ) ) ( not ( = ?auto_848126 ?auto_848133 ) ) ( not ( = ?auto_848126 ?auto_848134 ) ) ( not ( = ?auto_848127 ?auto_848128 ) ) ( not ( = ?auto_848127 ?auto_848129 ) ) ( not ( = ?auto_848127 ?auto_848130 ) ) ( not ( = ?auto_848127 ?auto_848131 ) ) ( not ( = ?auto_848127 ?auto_848132 ) ) ( not ( = ?auto_848127 ?auto_848133 ) ) ( not ( = ?auto_848127 ?auto_848134 ) ) ( not ( = ?auto_848128 ?auto_848129 ) ) ( not ( = ?auto_848128 ?auto_848130 ) ) ( not ( = ?auto_848128 ?auto_848131 ) ) ( not ( = ?auto_848128 ?auto_848132 ) ) ( not ( = ?auto_848128 ?auto_848133 ) ) ( not ( = ?auto_848128 ?auto_848134 ) ) ( not ( = ?auto_848129 ?auto_848130 ) ) ( not ( = ?auto_848129 ?auto_848131 ) ) ( not ( = ?auto_848129 ?auto_848132 ) ) ( not ( = ?auto_848129 ?auto_848133 ) ) ( not ( = ?auto_848129 ?auto_848134 ) ) ( not ( = ?auto_848130 ?auto_848131 ) ) ( not ( = ?auto_848130 ?auto_848132 ) ) ( not ( = ?auto_848130 ?auto_848133 ) ) ( not ( = ?auto_848130 ?auto_848134 ) ) ( not ( = ?auto_848131 ?auto_848132 ) ) ( not ( = ?auto_848131 ?auto_848133 ) ) ( not ( = ?auto_848131 ?auto_848134 ) ) ( not ( = ?auto_848132 ?auto_848133 ) ) ( not ( = ?auto_848132 ?auto_848134 ) ) ( not ( = ?auto_848133 ?auto_848134 ) ) ( ON ?auto_848132 ?auto_848133 ) ( CLEAR ?auto_848130 ) ( ON ?auto_848131 ?auto_848132 ) ( CLEAR ?auto_848131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_848121 ?auto_848122 ?auto_848123 ?auto_848124 ?auto_848125 ?auto_848126 ?auto_848127 ?auto_848128 ?auto_848129 ?auto_848130 ?auto_848131 )
      ( MAKE-13PILE ?auto_848121 ?auto_848122 ?auto_848123 ?auto_848124 ?auto_848125 ?auto_848126 ?auto_848127 ?auto_848128 ?auto_848129 ?auto_848130 ?auto_848131 ?auto_848132 ?auto_848133 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_848175 - BLOCK
      ?auto_848176 - BLOCK
      ?auto_848177 - BLOCK
      ?auto_848178 - BLOCK
      ?auto_848179 - BLOCK
      ?auto_848180 - BLOCK
      ?auto_848181 - BLOCK
      ?auto_848182 - BLOCK
      ?auto_848183 - BLOCK
      ?auto_848184 - BLOCK
      ?auto_848185 - BLOCK
      ?auto_848186 - BLOCK
      ?auto_848187 - BLOCK
    )
    :vars
    (
      ?auto_848188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_848187 ?auto_848188 ) ( ON-TABLE ?auto_848175 ) ( ON ?auto_848176 ?auto_848175 ) ( ON ?auto_848177 ?auto_848176 ) ( ON ?auto_848178 ?auto_848177 ) ( ON ?auto_848179 ?auto_848178 ) ( ON ?auto_848180 ?auto_848179 ) ( ON ?auto_848181 ?auto_848180 ) ( ON ?auto_848182 ?auto_848181 ) ( ON ?auto_848183 ?auto_848182 ) ( not ( = ?auto_848175 ?auto_848176 ) ) ( not ( = ?auto_848175 ?auto_848177 ) ) ( not ( = ?auto_848175 ?auto_848178 ) ) ( not ( = ?auto_848175 ?auto_848179 ) ) ( not ( = ?auto_848175 ?auto_848180 ) ) ( not ( = ?auto_848175 ?auto_848181 ) ) ( not ( = ?auto_848175 ?auto_848182 ) ) ( not ( = ?auto_848175 ?auto_848183 ) ) ( not ( = ?auto_848175 ?auto_848184 ) ) ( not ( = ?auto_848175 ?auto_848185 ) ) ( not ( = ?auto_848175 ?auto_848186 ) ) ( not ( = ?auto_848175 ?auto_848187 ) ) ( not ( = ?auto_848175 ?auto_848188 ) ) ( not ( = ?auto_848176 ?auto_848177 ) ) ( not ( = ?auto_848176 ?auto_848178 ) ) ( not ( = ?auto_848176 ?auto_848179 ) ) ( not ( = ?auto_848176 ?auto_848180 ) ) ( not ( = ?auto_848176 ?auto_848181 ) ) ( not ( = ?auto_848176 ?auto_848182 ) ) ( not ( = ?auto_848176 ?auto_848183 ) ) ( not ( = ?auto_848176 ?auto_848184 ) ) ( not ( = ?auto_848176 ?auto_848185 ) ) ( not ( = ?auto_848176 ?auto_848186 ) ) ( not ( = ?auto_848176 ?auto_848187 ) ) ( not ( = ?auto_848176 ?auto_848188 ) ) ( not ( = ?auto_848177 ?auto_848178 ) ) ( not ( = ?auto_848177 ?auto_848179 ) ) ( not ( = ?auto_848177 ?auto_848180 ) ) ( not ( = ?auto_848177 ?auto_848181 ) ) ( not ( = ?auto_848177 ?auto_848182 ) ) ( not ( = ?auto_848177 ?auto_848183 ) ) ( not ( = ?auto_848177 ?auto_848184 ) ) ( not ( = ?auto_848177 ?auto_848185 ) ) ( not ( = ?auto_848177 ?auto_848186 ) ) ( not ( = ?auto_848177 ?auto_848187 ) ) ( not ( = ?auto_848177 ?auto_848188 ) ) ( not ( = ?auto_848178 ?auto_848179 ) ) ( not ( = ?auto_848178 ?auto_848180 ) ) ( not ( = ?auto_848178 ?auto_848181 ) ) ( not ( = ?auto_848178 ?auto_848182 ) ) ( not ( = ?auto_848178 ?auto_848183 ) ) ( not ( = ?auto_848178 ?auto_848184 ) ) ( not ( = ?auto_848178 ?auto_848185 ) ) ( not ( = ?auto_848178 ?auto_848186 ) ) ( not ( = ?auto_848178 ?auto_848187 ) ) ( not ( = ?auto_848178 ?auto_848188 ) ) ( not ( = ?auto_848179 ?auto_848180 ) ) ( not ( = ?auto_848179 ?auto_848181 ) ) ( not ( = ?auto_848179 ?auto_848182 ) ) ( not ( = ?auto_848179 ?auto_848183 ) ) ( not ( = ?auto_848179 ?auto_848184 ) ) ( not ( = ?auto_848179 ?auto_848185 ) ) ( not ( = ?auto_848179 ?auto_848186 ) ) ( not ( = ?auto_848179 ?auto_848187 ) ) ( not ( = ?auto_848179 ?auto_848188 ) ) ( not ( = ?auto_848180 ?auto_848181 ) ) ( not ( = ?auto_848180 ?auto_848182 ) ) ( not ( = ?auto_848180 ?auto_848183 ) ) ( not ( = ?auto_848180 ?auto_848184 ) ) ( not ( = ?auto_848180 ?auto_848185 ) ) ( not ( = ?auto_848180 ?auto_848186 ) ) ( not ( = ?auto_848180 ?auto_848187 ) ) ( not ( = ?auto_848180 ?auto_848188 ) ) ( not ( = ?auto_848181 ?auto_848182 ) ) ( not ( = ?auto_848181 ?auto_848183 ) ) ( not ( = ?auto_848181 ?auto_848184 ) ) ( not ( = ?auto_848181 ?auto_848185 ) ) ( not ( = ?auto_848181 ?auto_848186 ) ) ( not ( = ?auto_848181 ?auto_848187 ) ) ( not ( = ?auto_848181 ?auto_848188 ) ) ( not ( = ?auto_848182 ?auto_848183 ) ) ( not ( = ?auto_848182 ?auto_848184 ) ) ( not ( = ?auto_848182 ?auto_848185 ) ) ( not ( = ?auto_848182 ?auto_848186 ) ) ( not ( = ?auto_848182 ?auto_848187 ) ) ( not ( = ?auto_848182 ?auto_848188 ) ) ( not ( = ?auto_848183 ?auto_848184 ) ) ( not ( = ?auto_848183 ?auto_848185 ) ) ( not ( = ?auto_848183 ?auto_848186 ) ) ( not ( = ?auto_848183 ?auto_848187 ) ) ( not ( = ?auto_848183 ?auto_848188 ) ) ( not ( = ?auto_848184 ?auto_848185 ) ) ( not ( = ?auto_848184 ?auto_848186 ) ) ( not ( = ?auto_848184 ?auto_848187 ) ) ( not ( = ?auto_848184 ?auto_848188 ) ) ( not ( = ?auto_848185 ?auto_848186 ) ) ( not ( = ?auto_848185 ?auto_848187 ) ) ( not ( = ?auto_848185 ?auto_848188 ) ) ( not ( = ?auto_848186 ?auto_848187 ) ) ( not ( = ?auto_848186 ?auto_848188 ) ) ( not ( = ?auto_848187 ?auto_848188 ) ) ( ON ?auto_848186 ?auto_848187 ) ( ON ?auto_848185 ?auto_848186 ) ( CLEAR ?auto_848183 ) ( ON ?auto_848184 ?auto_848185 ) ( CLEAR ?auto_848184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_848175 ?auto_848176 ?auto_848177 ?auto_848178 ?auto_848179 ?auto_848180 ?auto_848181 ?auto_848182 ?auto_848183 ?auto_848184 )
      ( MAKE-13PILE ?auto_848175 ?auto_848176 ?auto_848177 ?auto_848178 ?auto_848179 ?auto_848180 ?auto_848181 ?auto_848182 ?auto_848183 ?auto_848184 ?auto_848185 ?auto_848186 ?auto_848187 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_848229 - BLOCK
      ?auto_848230 - BLOCK
      ?auto_848231 - BLOCK
      ?auto_848232 - BLOCK
      ?auto_848233 - BLOCK
      ?auto_848234 - BLOCK
      ?auto_848235 - BLOCK
      ?auto_848236 - BLOCK
      ?auto_848237 - BLOCK
      ?auto_848238 - BLOCK
      ?auto_848239 - BLOCK
      ?auto_848240 - BLOCK
      ?auto_848241 - BLOCK
    )
    :vars
    (
      ?auto_848242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_848241 ?auto_848242 ) ( ON-TABLE ?auto_848229 ) ( ON ?auto_848230 ?auto_848229 ) ( ON ?auto_848231 ?auto_848230 ) ( ON ?auto_848232 ?auto_848231 ) ( ON ?auto_848233 ?auto_848232 ) ( ON ?auto_848234 ?auto_848233 ) ( ON ?auto_848235 ?auto_848234 ) ( ON ?auto_848236 ?auto_848235 ) ( not ( = ?auto_848229 ?auto_848230 ) ) ( not ( = ?auto_848229 ?auto_848231 ) ) ( not ( = ?auto_848229 ?auto_848232 ) ) ( not ( = ?auto_848229 ?auto_848233 ) ) ( not ( = ?auto_848229 ?auto_848234 ) ) ( not ( = ?auto_848229 ?auto_848235 ) ) ( not ( = ?auto_848229 ?auto_848236 ) ) ( not ( = ?auto_848229 ?auto_848237 ) ) ( not ( = ?auto_848229 ?auto_848238 ) ) ( not ( = ?auto_848229 ?auto_848239 ) ) ( not ( = ?auto_848229 ?auto_848240 ) ) ( not ( = ?auto_848229 ?auto_848241 ) ) ( not ( = ?auto_848229 ?auto_848242 ) ) ( not ( = ?auto_848230 ?auto_848231 ) ) ( not ( = ?auto_848230 ?auto_848232 ) ) ( not ( = ?auto_848230 ?auto_848233 ) ) ( not ( = ?auto_848230 ?auto_848234 ) ) ( not ( = ?auto_848230 ?auto_848235 ) ) ( not ( = ?auto_848230 ?auto_848236 ) ) ( not ( = ?auto_848230 ?auto_848237 ) ) ( not ( = ?auto_848230 ?auto_848238 ) ) ( not ( = ?auto_848230 ?auto_848239 ) ) ( not ( = ?auto_848230 ?auto_848240 ) ) ( not ( = ?auto_848230 ?auto_848241 ) ) ( not ( = ?auto_848230 ?auto_848242 ) ) ( not ( = ?auto_848231 ?auto_848232 ) ) ( not ( = ?auto_848231 ?auto_848233 ) ) ( not ( = ?auto_848231 ?auto_848234 ) ) ( not ( = ?auto_848231 ?auto_848235 ) ) ( not ( = ?auto_848231 ?auto_848236 ) ) ( not ( = ?auto_848231 ?auto_848237 ) ) ( not ( = ?auto_848231 ?auto_848238 ) ) ( not ( = ?auto_848231 ?auto_848239 ) ) ( not ( = ?auto_848231 ?auto_848240 ) ) ( not ( = ?auto_848231 ?auto_848241 ) ) ( not ( = ?auto_848231 ?auto_848242 ) ) ( not ( = ?auto_848232 ?auto_848233 ) ) ( not ( = ?auto_848232 ?auto_848234 ) ) ( not ( = ?auto_848232 ?auto_848235 ) ) ( not ( = ?auto_848232 ?auto_848236 ) ) ( not ( = ?auto_848232 ?auto_848237 ) ) ( not ( = ?auto_848232 ?auto_848238 ) ) ( not ( = ?auto_848232 ?auto_848239 ) ) ( not ( = ?auto_848232 ?auto_848240 ) ) ( not ( = ?auto_848232 ?auto_848241 ) ) ( not ( = ?auto_848232 ?auto_848242 ) ) ( not ( = ?auto_848233 ?auto_848234 ) ) ( not ( = ?auto_848233 ?auto_848235 ) ) ( not ( = ?auto_848233 ?auto_848236 ) ) ( not ( = ?auto_848233 ?auto_848237 ) ) ( not ( = ?auto_848233 ?auto_848238 ) ) ( not ( = ?auto_848233 ?auto_848239 ) ) ( not ( = ?auto_848233 ?auto_848240 ) ) ( not ( = ?auto_848233 ?auto_848241 ) ) ( not ( = ?auto_848233 ?auto_848242 ) ) ( not ( = ?auto_848234 ?auto_848235 ) ) ( not ( = ?auto_848234 ?auto_848236 ) ) ( not ( = ?auto_848234 ?auto_848237 ) ) ( not ( = ?auto_848234 ?auto_848238 ) ) ( not ( = ?auto_848234 ?auto_848239 ) ) ( not ( = ?auto_848234 ?auto_848240 ) ) ( not ( = ?auto_848234 ?auto_848241 ) ) ( not ( = ?auto_848234 ?auto_848242 ) ) ( not ( = ?auto_848235 ?auto_848236 ) ) ( not ( = ?auto_848235 ?auto_848237 ) ) ( not ( = ?auto_848235 ?auto_848238 ) ) ( not ( = ?auto_848235 ?auto_848239 ) ) ( not ( = ?auto_848235 ?auto_848240 ) ) ( not ( = ?auto_848235 ?auto_848241 ) ) ( not ( = ?auto_848235 ?auto_848242 ) ) ( not ( = ?auto_848236 ?auto_848237 ) ) ( not ( = ?auto_848236 ?auto_848238 ) ) ( not ( = ?auto_848236 ?auto_848239 ) ) ( not ( = ?auto_848236 ?auto_848240 ) ) ( not ( = ?auto_848236 ?auto_848241 ) ) ( not ( = ?auto_848236 ?auto_848242 ) ) ( not ( = ?auto_848237 ?auto_848238 ) ) ( not ( = ?auto_848237 ?auto_848239 ) ) ( not ( = ?auto_848237 ?auto_848240 ) ) ( not ( = ?auto_848237 ?auto_848241 ) ) ( not ( = ?auto_848237 ?auto_848242 ) ) ( not ( = ?auto_848238 ?auto_848239 ) ) ( not ( = ?auto_848238 ?auto_848240 ) ) ( not ( = ?auto_848238 ?auto_848241 ) ) ( not ( = ?auto_848238 ?auto_848242 ) ) ( not ( = ?auto_848239 ?auto_848240 ) ) ( not ( = ?auto_848239 ?auto_848241 ) ) ( not ( = ?auto_848239 ?auto_848242 ) ) ( not ( = ?auto_848240 ?auto_848241 ) ) ( not ( = ?auto_848240 ?auto_848242 ) ) ( not ( = ?auto_848241 ?auto_848242 ) ) ( ON ?auto_848240 ?auto_848241 ) ( ON ?auto_848239 ?auto_848240 ) ( ON ?auto_848238 ?auto_848239 ) ( CLEAR ?auto_848236 ) ( ON ?auto_848237 ?auto_848238 ) ( CLEAR ?auto_848237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_848229 ?auto_848230 ?auto_848231 ?auto_848232 ?auto_848233 ?auto_848234 ?auto_848235 ?auto_848236 ?auto_848237 )
      ( MAKE-13PILE ?auto_848229 ?auto_848230 ?auto_848231 ?auto_848232 ?auto_848233 ?auto_848234 ?auto_848235 ?auto_848236 ?auto_848237 ?auto_848238 ?auto_848239 ?auto_848240 ?auto_848241 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_848283 - BLOCK
      ?auto_848284 - BLOCK
      ?auto_848285 - BLOCK
      ?auto_848286 - BLOCK
      ?auto_848287 - BLOCK
      ?auto_848288 - BLOCK
      ?auto_848289 - BLOCK
      ?auto_848290 - BLOCK
      ?auto_848291 - BLOCK
      ?auto_848292 - BLOCK
      ?auto_848293 - BLOCK
      ?auto_848294 - BLOCK
      ?auto_848295 - BLOCK
    )
    :vars
    (
      ?auto_848296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_848295 ?auto_848296 ) ( ON-TABLE ?auto_848283 ) ( ON ?auto_848284 ?auto_848283 ) ( ON ?auto_848285 ?auto_848284 ) ( ON ?auto_848286 ?auto_848285 ) ( ON ?auto_848287 ?auto_848286 ) ( ON ?auto_848288 ?auto_848287 ) ( ON ?auto_848289 ?auto_848288 ) ( not ( = ?auto_848283 ?auto_848284 ) ) ( not ( = ?auto_848283 ?auto_848285 ) ) ( not ( = ?auto_848283 ?auto_848286 ) ) ( not ( = ?auto_848283 ?auto_848287 ) ) ( not ( = ?auto_848283 ?auto_848288 ) ) ( not ( = ?auto_848283 ?auto_848289 ) ) ( not ( = ?auto_848283 ?auto_848290 ) ) ( not ( = ?auto_848283 ?auto_848291 ) ) ( not ( = ?auto_848283 ?auto_848292 ) ) ( not ( = ?auto_848283 ?auto_848293 ) ) ( not ( = ?auto_848283 ?auto_848294 ) ) ( not ( = ?auto_848283 ?auto_848295 ) ) ( not ( = ?auto_848283 ?auto_848296 ) ) ( not ( = ?auto_848284 ?auto_848285 ) ) ( not ( = ?auto_848284 ?auto_848286 ) ) ( not ( = ?auto_848284 ?auto_848287 ) ) ( not ( = ?auto_848284 ?auto_848288 ) ) ( not ( = ?auto_848284 ?auto_848289 ) ) ( not ( = ?auto_848284 ?auto_848290 ) ) ( not ( = ?auto_848284 ?auto_848291 ) ) ( not ( = ?auto_848284 ?auto_848292 ) ) ( not ( = ?auto_848284 ?auto_848293 ) ) ( not ( = ?auto_848284 ?auto_848294 ) ) ( not ( = ?auto_848284 ?auto_848295 ) ) ( not ( = ?auto_848284 ?auto_848296 ) ) ( not ( = ?auto_848285 ?auto_848286 ) ) ( not ( = ?auto_848285 ?auto_848287 ) ) ( not ( = ?auto_848285 ?auto_848288 ) ) ( not ( = ?auto_848285 ?auto_848289 ) ) ( not ( = ?auto_848285 ?auto_848290 ) ) ( not ( = ?auto_848285 ?auto_848291 ) ) ( not ( = ?auto_848285 ?auto_848292 ) ) ( not ( = ?auto_848285 ?auto_848293 ) ) ( not ( = ?auto_848285 ?auto_848294 ) ) ( not ( = ?auto_848285 ?auto_848295 ) ) ( not ( = ?auto_848285 ?auto_848296 ) ) ( not ( = ?auto_848286 ?auto_848287 ) ) ( not ( = ?auto_848286 ?auto_848288 ) ) ( not ( = ?auto_848286 ?auto_848289 ) ) ( not ( = ?auto_848286 ?auto_848290 ) ) ( not ( = ?auto_848286 ?auto_848291 ) ) ( not ( = ?auto_848286 ?auto_848292 ) ) ( not ( = ?auto_848286 ?auto_848293 ) ) ( not ( = ?auto_848286 ?auto_848294 ) ) ( not ( = ?auto_848286 ?auto_848295 ) ) ( not ( = ?auto_848286 ?auto_848296 ) ) ( not ( = ?auto_848287 ?auto_848288 ) ) ( not ( = ?auto_848287 ?auto_848289 ) ) ( not ( = ?auto_848287 ?auto_848290 ) ) ( not ( = ?auto_848287 ?auto_848291 ) ) ( not ( = ?auto_848287 ?auto_848292 ) ) ( not ( = ?auto_848287 ?auto_848293 ) ) ( not ( = ?auto_848287 ?auto_848294 ) ) ( not ( = ?auto_848287 ?auto_848295 ) ) ( not ( = ?auto_848287 ?auto_848296 ) ) ( not ( = ?auto_848288 ?auto_848289 ) ) ( not ( = ?auto_848288 ?auto_848290 ) ) ( not ( = ?auto_848288 ?auto_848291 ) ) ( not ( = ?auto_848288 ?auto_848292 ) ) ( not ( = ?auto_848288 ?auto_848293 ) ) ( not ( = ?auto_848288 ?auto_848294 ) ) ( not ( = ?auto_848288 ?auto_848295 ) ) ( not ( = ?auto_848288 ?auto_848296 ) ) ( not ( = ?auto_848289 ?auto_848290 ) ) ( not ( = ?auto_848289 ?auto_848291 ) ) ( not ( = ?auto_848289 ?auto_848292 ) ) ( not ( = ?auto_848289 ?auto_848293 ) ) ( not ( = ?auto_848289 ?auto_848294 ) ) ( not ( = ?auto_848289 ?auto_848295 ) ) ( not ( = ?auto_848289 ?auto_848296 ) ) ( not ( = ?auto_848290 ?auto_848291 ) ) ( not ( = ?auto_848290 ?auto_848292 ) ) ( not ( = ?auto_848290 ?auto_848293 ) ) ( not ( = ?auto_848290 ?auto_848294 ) ) ( not ( = ?auto_848290 ?auto_848295 ) ) ( not ( = ?auto_848290 ?auto_848296 ) ) ( not ( = ?auto_848291 ?auto_848292 ) ) ( not ( = ?auto_848291 ?auto_848293 ) ) ( not ( = ?auto_848291 ?auto_848294 ) ) ( not ( = ?auto_848291 ?auto_848295 ) ) ( not ( = ?auto_848291 ?auto_848296 ) ) ( not ( = ?auto_848292 ?auto_848293 ) ) ( not ( = ?auto_848292 ?auto_848294 ) ) ( not ( = ?auto_848292 ?auto_848295 ) ) ( not ( = ?auto_848292 ?auto_848296 ) ) ( not ( = ?auto_848293 ?auto_848294 ) ) ( not ( = ?auto_848293 ?auto_848295 ) ) ( not ( = ?auto_848293 ?auto_848296 ) ) ( not ( = ?auto_848294 ?auto_848295 ) ) ( not ( = ?auto_848294 ?auto_848296 ) ) ( not ( = ?auto_848295 ?auto_848296 ) ) ( ON ?auto_848294 ?auto_848295 ) ( ON ?auto_848293 ?auto_848294 ) ( ON ?auto_848292 ?auto_848293 ) ( ON ?auto_848291 ?auto_848292 ) ( CLEAR ?auto_848289 ) ( ON ?auto_848290 ?auto_848291 ) ( CLEAR ?auto_848290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_848283 ?auto_848284 ?auto_848285 ?auto_848286 ?auto_848287 ?auto_848288 ?auto_848289 ?auto_848290 )
      ( MAKE-13PILE ?auto_848283 ?auto_848284 ?auto_848285 ?auto_848286 ?auto_848287 ?auto_848288 ?auto_848289 ?auto_848290 ?auto_848291 ?auto_848292 ?auto_848293 ?auto_848294 ?auto_848295 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_848337 - BLOCK
      ?auto_848338 - BLOCK
      ?auto_848339 - BLOCK
      ?auto_848340 - BLOCK
      ?auto_848341 - BLOCK
      ?auto_848342 - BLOCK
      ?auto_848343 - BLOCK
      ?auto_848344 - BLOCK
      ?auto_848345 - BLOCK
      ?auto_848346 - BLOCK
      ?auto_848347 - BLOCK
      ?auto_848348 - BLOCK
      ?auto_848349 - BLOCK
    )
    :vars
    (
      ?auto_848350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_848349 ?auto_848350 ) ( ON-TABLE ?auto_848337 ) ( ON ?auto_848338 ?auto_848337 ) ( ON ?auto_848339 ?auto_848338 ) ( ON ?auto_848340 ?auto_848339 ) ( ON ?auto_848341 ?auto_848340 ) ( ON ?auto_848342 ?auto_848341 ) ( not ( = ?auto_848337 ?auto_848338 ) ) ( not ( = ?auto_848337 ?auto_848339 ) ) ( not ( = ?auto_848337 ?auto_848340 ) ) ( not ( = ?auto_848337 ?auto_848341 ) ) ( not ( = ?auto_848337 ?auto_848342 ) ) ( not ( = ?auto_848337 ?auto_848343 ) ) ( not ( = ?auto_848337 ?auto_848344 ) ) ( not ( = ?auto_848337 ?auto_848345 ) ) ( not ( = ?auto_848337 ?auto_848346 ) ) ( not ( = ?auto_848337 ?auto_848347 ) ) ( not ( = ?auto_848337 ?auto_848348 ) ) ( not ( = ?auto_848337 ?auto_848349 ) ) ( not ( = ?auto_848337 ?auto_848350 ) ) ( not ( = ?auto_848338 ?auto_848339 ) ) ( not ( = ?auto_848338 ?auto_848340 ) ) ( not ( = ?auto_848338 ?auto_848341 ) ) ( not ( = ?auto_848338 ?auto_848342 ) ) ( not ( = ?auto_848338 ?auto_848343 ) ) ( not ( = ?auto_848338 ?auto_848344 ) ) ( not ( = ?auto_848338 ?auto_848345 ) ) ( not ( = ?auto_848338 ?auto_848346 ) ) ( not ( = ?auto_848338 ?auto_848347 ) ) ( not ( = ?auto_848338 ?auto_848348 ) ) ( not ( = ?auto_848338 ?auto_848349 ) ) ( not ( = ?auto_848338 ?auto_848350 ) ) ( not ( = ?auto_848339 ?auto_848340 ) ) ( not ( = ?auto_848339 ?auto_848341 ) ) ( not ( = ?auto_848339 ?auto_848342 ) ) ( not ( = ?auto_848339 ?auto_848343 ) ) ( not ( = ?auto_848339 ?auto_848344 ) ) ( not ( = ?auto_848339 ?auto_848345 ) ) ( not ( = ?auto_848339 ?auto_848346 ) ) ( not ( = ?auto_848339 ?auto_848347 ) ) ( not ( = ?auto_848339 ?auto_848348 ) ) ( not ( = ?auto_848339 ?auto_848349 ) ) ( not ( = ?auto_848339 ?auto_848350 ) ) ( not ( = ?auto_848340 ?auto_848341 ) ) ( not ( = ?auto_848340 ?auto_848342 ) ) ( not ( = ?auto_848340 ?auto_848343 ) ) ( not ( = ?auto_848340 ?auto_848344 ) ) ( not ( = ?auto_848340 ?auto_848345 ) ) ( not ( = ?auto_848340 ?auto_848346 ) ) ( not ( = ?auto_848340 ?auto_848347 ) ) ( not ( = ?auto_848340 ?auto_848348 ) ) ( not ( = ?auto_848340 ?auto_848349 ) ) ( not ( = ?auto_848340 ?auto_848350 ) ) ( not ( = ?auto_848341 ?auto_848342 ) ) ( not ( = ?auto_848341 ?auto_848343 ) ) ( not ( = ?auto_848341 ?auto_848344 ) ) ( not ( = ?auto_848341 ?auto_848345 ) ) ( not ( = ?auto_848341 ?auto_848346 ) ) ( not ( = ?auto_848341 ?auto_848347 ) ) ( not ( = ?auto_848341 ?auto_848348 ) ) ( not ( = ?auto_848341 ?auto_848349 ) ) ( not ( = ?auto_848341 ?auto_848350 ) ) ( not ( = ?auto_848342 ?auto_848343 ) ) ( not ( = ?auto_848342 ?auto_848344 ) ) ( not ( = ?auto_848342 ?auto_848345 ) ) ( not ( = ?auto_848342 ?auto_848346 ) ) ( not ( = ?auto_848342 ?auto_848347 ) ) ( not ( = ?auto_848342 ?auto_848348 ) ) ( not ( = ?auto_848342 ?auto_848349 ) ) ( not ( = ?auto_848342 ?auto_848350 ) ) ( not ( = ?auto_848343 ?auto_848344 ) ) ( not ( = ?auto_848343 ?auto_848345 ) ) ( not ( = ?auto_848343 ?auto_848346 ) ) ( not ( = ?auto_848343 ?auto_848347 ) ) ( not ( = ?auto_848343 ?auto_848348 ) ) ( not ( = ?auto_848343 ?auto_848349 ) ) ( not ( = ?auto_848343 ?auto_848350 ) ) ( not ( = ?auto_848344 ?auto_848345 ) ) ( not ( = ?auto_848344 ?auto_848346 ) ) ( not ( = ?auto_848344 ?auto_848347 ) ) ( not ( = ?auto_848344 ?auto_848348 ) ) ( not ( = ?auto_848344 ?auto_848349 ) ) ( not ( = ?auto_848344 ?auto_848350 ) ) ( not ( = ?auto_848345 ?auto_848346 ) ) ( not ( = ?auto_848345 ?auto_848347 ) ) ( not ( = ?auto_848345 ?auto_848348 ) ) ( not ( = ?auto_848345 ?auto_848349 ) ) ( not ( = ?auto_848345 ?auto_848350 ) ) ( not ( = ?auto_848346 ?auto_848347 ) ) ( not ( = ?auto_848346 ?auto_848348 ) ) ( not ( = ?auto_848346 ?auto_848349 ) ) ( not ( = ?auto_848346 ?auto_848350 ) ) ( not ( = ?auto_848347 ?auto_848348 ) ) ( not ( = ?auto_848347 ?auto_848349 ) ) ( not ( = ?auto_848347 ?auto_848350 ) ) ( not ( = ?auto_848348 ?auto_848349 ) ) ( not ( = ?auto_848348 ?auto_848350 ) ) ( not ( = ?auto_848349 ?auto_848350 ) ) ( ON ?auto_848348 ?auto_848349 ) ( ON ?auto_848347 ?auto_848348 ) ( ON ?auto_848346 ?auto_848347 ) ( ON ?auto_848345 ?auto_848346 ) ( ON ?auto_848344 ?auto_848345 ) ( CLEAR ?auto_848342 ) ( ON ?auto_848343 ?auto_848344 ) ( CLEAR ?auto_848343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_848337 ?auto_848338 ?auto_848339 ?auto_848340 ?auto_848341 ?auto_848342 ?auto_848343 )
      ( MAKE-13PILE ?auto_848337 ?auto_848338 ?auto_848339 ?auto_848340 ?auto_848341 ?auto_848342 ?auto_848343 ?auto_848344 ?auto_848345 ?auto_848346 ?auto_848347 ?auto_848348 ?auto_848349 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_848391 - BLOCK
      ?auto_848392 - BLOCK
      ?auto_848393 - BLOCK
      ?auto_848394 - BLOCK
      ?auto_848395 - BLOCK
      ?auto_848396 - BLOCK
      ?auto_848397 - BLOCK
      ?auto_848398 - BLOCK
      ?auto_848399 - BLOCK
      ?auto_848400 - BLOCK
      ?auto_848401 - BLOCK
      ?auto_848402 - BLOCK
      ?auto_848403 - BLOCK
    )
    :vars
    (
      ?auto_848404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_848403 ?auto_848404 ) ( ON-TABLE ?auto_848391 ) ( ON ?auto_848392 ?auto_848391 ) ( ON ?auto_848393 ?auto_848392 ) ( ON ?auto_848394 ?auto_848393 ) ( ON ?auto_848395 ?auto_848394 ) ( not ( = ?auto_848391 ?auto_848392 ) ) ( not ( = ?auto_848391 ?auto_848393 ) ) ( not ( = ?auto_848391 ?auto_848394 ) ) ( not ( = ?auto_848391 ?auto_848395 ) ) ( not ( = ?auto_848391 ?auto_848396 ) ) ( not ( = ?auto_848391 ?auto_848397 ) ) ( not ( = ?auto_848391 ?auto_848398 ) ) ( not ( = ?auto_848391 ?auto_848399 ) ) ( not ( = ?auto_848391 ?auto_848400 ) ) ( not ( = ?auto_848391 ?auto_848401 ) ) ( not ( = ?auto_848391 ?auto_848402 ) ) ( not ( = ?auto_848391 ?auto_848403 ) ) ( not ( = ?auto_848391 ?auto_848404 ) ) ( not ( = ?auto_848392 ?auto_848393 ) ) ( not ( = ?auto_848392 ?auto_848394 ) ) ( not ( = ?auto_848392 ?auto_848395 ) ) ( not ( = ?auto_848392 ?auto_848396 ) ) ( not ( = ?auto_848392 ?auto_848397 ) ) ( not ( = ?auto_848392 ?auto_848398 ) ) ( not ( = ?auto_848392 ?auto_848399 ) ) ( not ( = ?auto_848392 ?auto_848400 ) ) ( not ( = ?auto_848392 ?auto_848401 ) ) ( not ( = ?auto_848392 ?auto_848402 ) ) ( not ( = ?auto_848392 ?auto_848403 ) ) ( not ( = ?auto_848392 ?auto_848404 ) ) ( not ( = ?auto_848393 ?auto_848394 ) ) ( not ( = ?auto_848393 ?auto_848395 ) ) ( not ( = ?auto_848393 ?auto_848396 ) ) ( not ( = ?auto_848393 ?auto_848397 ) ) ( not ( = ?auto_848393 ?auto_848398 ) ) ( not ( = ?auto_848393 ?auto_848399 ) ) ( not ( = ?auto_848393 ?auto_848400 ) ) ( not ( = ?auto_848393 ?auto_848401 ) ) ( not ( = ?auto_848393 ?auto_848402 ) ) ( not ( = ?auto_848393 ?auto_848403 ) ) ( not ( = ?auto_848393 ?auto_848404 ) ) ( not ( = ?auto_848394 ?auto_848395 ) ) ( not ( = ?auto_848394 ?auto_848396 ) ) ( not ( = ?auto_848394 ?auto_848397 ) ) ( not ( = ?auto_848394 ?auto_848398 ) ) ( not ( = ?auto_848394 ?auto_848399 ) ) ( not ( = ?auto_848394 ?auto_848400 ) ) ( not ( = ?auto_848394 ?auto_848401 ) ) ( not ( = ?auto_848394 ?auto_848402 ) ) ( not ( = ?auto_848394 ?auto_848403 ) ) ( not ( = ?auto_848394 ?auto_848404 ) ) ( not ( = ?auto_848395 ?auto_848396 ) ) ( not ( = ?auto_848395 ?auto_848397 ) ) ( not ( = ?auto_848395 ?auto_848398 ) ) ( not ( = ?auto_848395 ?auto_848399 ) ) ( not ( = ?auto_848395 ?auto_848400 ) ) ( not ( = ?auto_848395 ?auto_848401 ) ) ( not ( = ?auto_848395 ?auto_848402 ) ) ( not ( = ?auto_848395 ?auto_848403 ) ) ( not ( = ?auto_848395 ?auto_848404 ) ) ( not ( = ?auto_848396 ?auto_848397 ) ) ( not ( = ?auto_848396 ?auto_848398 ) ) ( not ( = ?auto_848396 ?auto_848399 ) ) ( not ( = ?auto_848396 ?auto_848400 ) ) ( not ( = ?auto_848396 ?auto_848401 ) ) ( not ( = ?auto_848396 ?auto_848402 ) ) ( not ( = ?auto_848396 ?auto_848403 ) ) ( not ( = ?auto_848396 ?auto_848404 ) ) ( not ( = ?auto_848397 ?auto_848398 ) ) ( not ( = ?auto_848397 ?auto_848399 ) ) ( not ( = ?auto_848397 ?auto_848400 ) ) ( not ( = ?auto_848397 ?auto_848401 ) ) ( not ( = ?auto_848397 ?auto_848402 ) ) ( not ( = ?auto_848397 ?auto_848403 ) ) ( not ( = ?auto_848397 ?auto_848404 ) ) ( not ( = ?auto_848398 ?auto_848399 ) ) ( not ( = ?auto_848398 ?auto_848400 ) ) ( not ( = ?auto_848398 ?auto_848401 ) ) ( not ( = ?auto_848398 ?auto_848402 ) ) ( not ( = ?auto_848398 ?auto_848403 ) ) ( not ( = ?auto_848398 ?auto_848404 ) ) ( not ( = ?auto_848399 ?auto_848400 ) ) ( not ( = ?auto_848399 ?auto_848401 ) ) ( not ( = ?auto_848399 ?auto_848402 ) ) ( not ( = ?auto_848399 ?auto_848403 ) ) ( not ( = ?auto_848399 ?auto_848404 ) ) ( not ( = ?auto_848400 ?auto_848401 ) ) ( not ( = ?auto_848400 ?auto_848402 ) ) ( not ( = ?auto_848400 ?auto_848403 ) ) ( not ( = ?auto_848400 ?auto_848404 ) ) ( not ( = ?auto_848401 ?auto_848402 ) ) ( not ( = ?auto_848401 ?auto_848403 ) ) ( not ( = ?auto_848401 ?auto_848404 ) ) ( not ( = ?auto_848402 ?auto_848403 ) ) ( not ( = ?auto_848402 ?auto_848404 ) ) ( not ( = ?auto_848403 ?auto_848404 ) ) ( ON ?auto_848402 ?auto_848403 ) ( ON ?auto_848401 ?auto_848402 ) ( ON ?auto_848400 ?auto_848401 ) ( ON ?auto_848399 ?auto_848400 ) ( ON ?auto_848398 ?auto_848399 ) ( ON ?auto_848397 ?auto_848398 ) ( CLEAR ?auto_848395 ) ( ON ?auto_848396 ?auto_848397 ) ( CLEAR ?auto_848396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_848391 ?auto_848392 ?auto_848393 ?auto_848394 ?auto_848395 ?auto_848396 )
      ( MAKE-13PILE ?auto_848391 ?auto_848392 ?auto_848393 ?auto_848394 ?auto_848395 ?auto_848396 ?auto_848397 ?auto_848398 ?auto_848399 ?auto_848400 ?auto_848401 ?auto_848402 ?auto_848403 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_848445 - BLOCK
      ?auto_848446 - BLOCK
      ?auto_848447 - BLOCK
      ?auto_848448 - BLOCK
      ?auto_848449 - BLOCK
      ?auto_848450 - BLOCK
      ?auto_848451 - BLOCK
      ?auto_848452 - BLOCK
      ?auto_848453 - BLOCK
      ?auto_848454 - BLOCK
      ?auto_848455 - BLOCK
      ?auto_848456 - BLOCK
      ?auto_848457 - BLOCK
    )
    :vars
    (
      ?auto_848458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_848457 ?auto_848458 ) ( ON-TABLE ?auto_848445 ) ( ON ?auto_848446 ?auto_848445 ) ( ON ?auto_848447 ?auto_848446 ) ( ON ?auto_848448 ?auto_848447 ) ( not ( = ?auto_848445 ?auto_848446 ) ) ( not ( = ?auto_848445 ?auto_848447 ) ) ( not ( = ?auto_848445 ?auto_848448 ) ) ( not ( = ?auto_848445 ?auto_848449 ) ) ( not ( = ?auto_848445 ?auto_848450 ) ) ( not ( = ?auto_848445 ?auto_848451 ) ) ( not ( = ?auto_848445 ?auto_848452 ) ) ( not ( = ?auto_848445 ?auto_848453 ) ) ( not ( = ?auto_848445 ?auto_848454 ) ) ( not ( = ?auto_848445 ?auto_848455 ) ) ( not ( = ?auto_848445 ?auto_848456 ) ) ( not ( = ?auto_848445 ?auto_848457 ) ) ( not ( = ?auto_848445 ?auto_848458 ) ) ( not ( = ?auto_848446 ?auto_848447 ) ) ( not ( = ?auto_848446 ?auto_848448 ) ) ( not ( = ?auto_848446 ?auto_848449 ) ) ( not ( = ?auto_848446 ?auto_848450 ) ) ( not ( = ?auto_848446 ?auto_848451 ) ) ( not ( = ?auto_848446 ?auto_848452 ) ) ( not ( = ?auto_848446 ?auto_848453 ) ) ( not ( = ?auto_848446 ?auto_848454 ) ) ( not ( = ?auto_848446 ?auto_848455 ) ) ( not ( = ?auto_848446 ?auto_848456 ) ) ( not ( = ?auto_848446 ?auto_848457 ) ) ( not ( = ?auto_848446 ?auto_848458 ) ) ( not ( = ?auto_848447 ?auto_848448 ) ) ( not ( = ?auto_848447 ?auto_848449 ) ) ( not ( = ?auto_848447 ?auto_848450 ) ) ( not ( = ?auto_848447 ?auto_848451 ) ) ( not ( = ?auto_848447 ?auto_848452 ) ) ( not ( = ?auto_848447 ?auto_848453 ) ) ( not ( = ?auto_848447 ?auto_848454 ) ) ( not ( = ?auto_848447 ?auto_848455 ) ) ( not ( = ?auto_848447 ?auto_848456 ) ) ( not ( = ?auto_848447 ?auto_848457 ) ) ( not ( = ?auto_848447 ?auto_848458 ) ) ( not ( = ?auto_848448 ?auto_848449 ) ) ( not ( = ?auto_848448 ?auto_848450 ) ) ( not ( = ?auto_848448 ?auto_848451 ) ) ( not ( = ?auto_848448 ?auto_848452 ) ) ( not ( = ?auto_848448 ?auto_848453 ) ) ( not ( = ?auto_848448 ?auto_848454 ) ) ( not ( = ?auto_848448 ?auto_848455 ) ) ( not ( = ?auto_848448 ?auto_848456 ) ) ( not ( = ?auto_848448 ?auto_848457 ) ) ( not ( = ?auto_848448 ?auto_848458 ) ) ( not ( = ?auto_848449 ?auto_848450 ) ) ( not ( = ?auto_848449 ?auto_848451 ) ) ( not ( = ?auto_848449 ?auto_848452 ) ) ( not ( = ?auto_848449 ?auto_848453 ) ) ( not ( = ?auto_848449 ?auto_848454 ) ) ( not ( = ?auto_848449 ?auto_848455 ) ) ( not ( = ?auto_848449 ?auto_848456 ) ) ( not ( = ?auto_848449 ?auto_848457 ) ) ( not ( = ?auto_848449 ?auto_848458 ) ) ( not ( = ?auto_848450 ?auto_848451 ) ) ( not ( = ?auto_848450 ?auto_848452 ) ) ( not ( = ?auto_848450 ?auto_848453 ) ) ( not ( = ?auto_848450 ?auto_848454 ) ) ( not ( = ?auto_848450 ?auto_848455 ) ) ( not ( = ?auto_848450 ?auto_848456 ) ) ( not ( = ?auto_848450 ?auto_848457 ) ) ( not ( = ?auto_848450 ?auto_848458 ) ) ( not ( = ?auto_848451 ?auto_848452 ) ) ( not ( = ?auto_848451 ?auto_848453 ) ) ( not ( = ?auto_848451 ?auto_848454 ) ) ( not ( = ?auto_848451 ?auto_848455 ) ) ( not ( = ?auto_848451 ?auto_848456 ) ) ( not ( = ?auto_848451 ?auto_848457 ) ) ( not ( = ?auto_848451 ?auto_848458 ) ) ( not ( = ?auto_848452 ?auto_848453 ) ) ( not ( = ?auto_848452 ?auto_848454 ) ) ( not ( = ?auto_848452 ?auto_848455 ) ) ( not ( = ?auto_848452 ?auto_848456 ) ) ( not ( = ?auto_848452 ?auto_848457 ) ) ( not ( = ?auto_848452 ?auto_848458 ) ) ( not ( = ?auto_848453 ?auto_848454 ) ) ( not ( = ?auto_848453 ?auto_848455 ) ) ( not ( = ?auto_848453 ?auto_848456 ) ) ( not ( = ?auto_848453 ?auto_848457 ) ) ( not ( = ?auto_848453 ?auto_848458 ) ) ( not ( = ?auto_848454 ?auto_848455 ) ) ( not ( = ?auto_848454 ?auto_848456 ) ) ( not ( = ?auto_848454 ?auto_848457 ) ) ( not ( = ?auto_848454 ?auto_848458 ) ) ( not ( = ?auto_848455 ?auto_848456 ) ) ( not ( = ?auto_848455 ?auto_848457 ) ) ( not ( = ?auto_848455 ?auto_848458 ) ) ( not ( = ?auto_848456 ?auto_848457 ) ) ( not ( = ?auto_848456 ?auto_848458 ) ) ( not ( = ?auto_848457 ?auto_848458 ) ) ( ON ?auto_848456 ?auto_848457 ) ( ON ?auto_848455 ?auto_848456 ) ( ON ?auto_848454 ?auto_848455 ) ( ON ?auto_848453 ?auto_848454 ) ( ON ?auto_848452 ?auto_848453 ) ( ON ?auto_848451 ?auto_848452 ) ( ON ?auto_848450 ?auto_848451 ) ( CLEAR ?auto_848448 ) ( ON ?auto_848449 ?auto_848450 ) ( CLEAR ?auto_848449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_848445 ?auto_848446 ?auto_848447 ?auto_848448 ?auto_848449 )
      ( MAKE-13PILE ?auto_848445 ?auto_848446 ?auto_848447 ?auto_848448 ?auto_848449 ?auto_848450 ?auto_848451 ?auto_848452 ?auto_848453 ?auto_848454 ?auto_848455 ?auto_848456 ?auto_848457 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_848499 - BLOCK
      ?auto_848500 - BLOCK
      ?auto_848501 - BLOCK
      ?auto_848502 - BLOCK
      ?auto_848503 - BLOCK
      ?auto_848504 - BLOCK
      ?auto_848505 - BLOCK
      ?auto_848506 - BLOCK
      ?auto_848507 - BLOCK
      ?auto_848508 - BLOCK
      ?auto_848509 - BLOCK
      ?auto_848510 - BLOCK
      ?auto_848511 - BLOCK
    )
    :vars
    (
      ?auto_848512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_848511 ?auto_848512 ) ( ON-TABLE ?auto_848499 ) ( ON ?auto_848500 ?auto_848499 ) ( ON ?auto_848501 ?auto_848500 ) ( not ( = ?auto_848499 ?auto_848500 ) ) ( not ( = ?auto_848499 ?auto_848501 ) ) ( not ( = ?auto_848499 ?auto_848502 ) ) ( not ( = ?auto_848499 ?auto_848503 ) ) ( not ( = ?auto_848499 ?auto_848504 ) ) ( not ( = ?auto_848499 ?auto_848505 ) ) ( not ( = ?auto_848499 ?auto_848506 ) ) ( not ( = ?auto_848499 ?auto_848507 ) ) ( not ( = ?auto_848499 ?auto_848508 ) ) ( not ( = ?auto_848499 ?auto_848509 ) ) ( not ( = ?auto_848499 ?auto_848510 ) ) ( not ( = ?auto_848499 ?auto_848511 ) ) ( not ( = ?auto_848499 ?auto_848512 ) ) ( not ( = ?auto_848500 ?auto_848501 ) ) ( not ( = ?auto_848500 ?auto_848502 ) ) ( not ( = ?auto_848500 ?auto_848503 ) ) ( not ( = ?auto_848500 ?auto_848504 ) ) ( not ( = ?auto_848500 ?auto_848505 ) ) ( not ( = ?auto_848500 ?auto_848506 ) ) ( not ( = ?auto_848500 ?auto_848507 ) ) ( not ( = ?auto_848500 ?auto_848508 ) ) ( not ( = ?auto_848500 ?auto_848509 ) ) ( not ( = ?auto_848500 ?auto_848510 ) ) ( not ( = ?auto_848500 ?auto_848511 ) ) ( not ( = ?auto_848500 ?auto_848512 ) ) ( not ( = ?auto_848501 ?auto_848502 ) ) ( not ( = ?auto_848501 ?auto_848503 ) ) ( not ( = ?auto_848501 ?auto_848504 ) ) ( not ( = ?auto_848501 ?auto_848505 ) ) ( not ( = ?auto_848501 ?auto_848506 ) ) ( not ( = ?auto_848501 ?auto_848507 ) ) ( not ( = ?auto_848501 ?auto_848508 ) ) ( not ( = ?auto_848501 ?auto_848509 ) ) ( not ( = ?auto_848501 ?auto_848510 ) ) ( not ( = ?auto_848501 ?auto_848511 ) ) ( not ( = ?auto_848501 ?auto_848512 ) ) ( not ( = ?auto_848502 ?auto_848503 ) ) ( not ( = ?auto_848502 ?auto_848504 ) ) ( not ( = ?auto_848502 ?auto_848505 ) ) ( not ( = ?auto_848502 ?auto_848506 ) ) ( not ( = ?auto_848502 ?auto_848507 ) ) ( not ( = ?auto_848502 ?auto_848508 ) ) ( not ( = ?auto_848502 ?auto_848509 ) ) ( not ( = ?auto_848502 ?auto_848510 ) ) ( not ( = ?auto_848502 ?auto_848511 ) ) ( not ( = ?auto_848502 ?auto_848512 ) ) ( not ( = ?auto_848503 ?auto_848504 ) ) ( not ( = ?auto_848503 ?auto_848505 ) ) ( not ( = ?auto_848503 ?auto_848506 ) ) ( not ( = ?auto_848503 ?auto_848507 ) ) ( not ( = ?auto_848503 ?auto_848508 ) ) ( not ( = ?auto_848503 ?auto_848509 ) ) ( not ( = ?auto_848503 ?auto_848510 ) ) ( not ( = ?auto_848503 ?auto_848511 ) ) ( not ( = ?auto_848503 ?auto_848512 ) ) ( not ( = ?auto_848504 ?auto_848505 ) ) ( not ( = ?auto_848504 ?auto_848506 ) ) ( not ( = ?auto_848504 ?auto_848507 ) ) ( not ( = ?auto_848504 ?auto_848508 ) ) ( not ( = ?auto_848504 ?auto_848509 ) ) ( not ( = ?auto_848504 ?auto_848510 ) ) ( not ( = ?auto_848504 ?auto_848511 ) ) ( not ( = ?auto_848504 ?auto_848512 ) ) ( not ( = ?auto_848505 ?auto_848506 ) ) ( not ( = ?auto_848505 ?auto_848507 ) ) ( not ( = ?auto_848505 ?auto_848508 ) ) ( not ( = ?auto_848505 ?auto_848509 ) ) ( not ( = ?auto_848505 ?auto_848510 ) ) ( not ( = ?auto_848505 ?auto_848511 ) ) ( not ( = ?auto_848505 ?auto_848512 ) ) ( not ( = ?auto_848506 ?auto_848507 ) ) ( not ( = ?auto_848506 ?auto_848508 ) ) ( not ( = ?auto_848506 ?auto_848509 ) ) ( not ( = ?auto_848506 ?auto_848510 ) ) ( not ( = ?auto_848506 ?auto_848511 ) ) ( not ( = ?auto_848506 ?auto_848512 ) ) ( not ( = ?auto_848507 ?auto_848508 ) ) ( not ( = ?auto_848507 ?auto_848509 ) ) ( not ( = ?auto_848507 ?auto_848510 ) ) ( not ( = ?auto_848507 ?auto_848511 ) ) ( not ( = ?auto_848507 ?auto_848512 ) ) ( not ( = ?auto_848508 ?auto_848509 ) ) ( not ( = ?auto_848508 ?auto_848510 ) ) ( not ( = ?auto_848508 ?auto_848511 ) ) ( not ( = ?auto_848508 ?auto_848512 ) ) ( not ( = ?auto_848509 ?auto_848510 ) ) ( not ( = ?auto_848509 ?auto_848511 ) ) ( not ( = ?auto_848509 ?auto_848512 ) ) ( not ( = ?auto_848510 ?auto_848511 ) ) ( not ( = ?auto_848510 ?auto_848512 ) ) ( not ( = ?auto_848511 ?auto_848512 ) ) ( ON ?auto_848510 ?auto_848511 ) ( ON ?auto_848509 ?auto_848510 ) ( ON ?auto_848508 ?auto_848509 ) ( ON ?auto_848507 ?auto_848508 ) ( ON ?auto_848506 ?auto_848507 ) ( ON ?auto_848505 ?auto_848506 ) ( ON ?auto_848504 ?auto_848505 ) ( ON ?auto_848503 ?auto_848504 ) ( CLEAR ?auto_848501 ) ( ON ?auto_848502 ?auto_848503 ) ( CLEAR ?auto_848502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_848499 ?auto_848500 ?auto_848501 ?auto_848502 )
      ( MAKE-13PILE ?auto_848499 ?auto_848500 ?auto_848501 ?auto_848502 ?auto_848503 ?auto_848504 ?auto_848505 ?auto_848506 ?auto_848507 ?auto_848508 ?auto_848509 ?auto_848510 ?auto_848511 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_848553 - BLOCK
      ?auto_848554 - BLOCK
      ?auto_848555 - BLOCK
      ?auto_848556 - BLOCK
      ?auto_848557 - BLOCK
      ?auto_848558 - BLOCK
      ?auto_848559 - BLOCK
      ?auto_848560 - BLOCK
      ?auto_848561 - BLOCK
      ?auto_848562 - BLOCK
      ?auto_848563 - BLOCK
      ?auto_848564 - BLOCK
      ?auto_848565 - BLOCK
    )
    :vars
    (
      ?auto_848566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_848565 ?auto_848566 ) ( ON-TABLE ?auto_848553 ) ( ON ?auto_848554 ?auto_848553 ) ( not ( = ?auto_848553 ?auto_848554 ) ) ( not ( = ?auto_848553 ?auto_848555 ) ) ( not ( = ?auto_848553 ?auto_848556 ) ) ( not ( = ?auto_848553 ?auto_848557 ) ) ( not ( = ?auto_848553 ?auto_848558 ) ) ( not ( = ?auto_848553 ?auto_848559 ) ) ( not ( = ?auto_848553 ?auto_848560 ) ) ( not ( = ?auto_848553 ?auto_848561 ) ) ( not ( = ?auto_848553 ?auto_848562 ) ) ( not ( = ?auto_848553 ?auto_848563 ) ) ( not ( = ?auto_848553 ?auto_848564 ) ) ( not ( = ?auto_848553 ?auto_848565 ) ) ( not ( = ?auto_848553 ?auto_848566 ) ) ( not ( = ?auto_848554 ?auto_848555 ) ) ( not ( = ?auto_848554 ?auto_848556 ) ) ( not ( = ?auto_848554 ?auto_848557 ) ) ( not ( = ?auto_848554 ?auto_848558 ) ) ( not ( = ?auto_848554 ?auto_848559 ) ) ( not ( = ?auto_848554 ?auto_848560 ) ) ( not ( = ?auto_848554 ?auto_848561 ) ) ( not ( = ?auto_848554 ?auto_848562 ) ) ( not ( = ?auto_848554 ?auto_848563 ) ) ( not ( = ?auto_848554 ?auto_848564 ) ) ( not ( = ?auto_848554 ?auto_848565 ) ) ( not ( = ?auto_848554 ?auto_848566 ) ) ( not ( = ?auto_848555 ?auto_848556 ) ) ( not ( = ?auto_848555 ?auto_848557 ) ) ( not ( = ?auto_848555 ?auto_848558 ) ) ( not ( = ?auto_848555 ?auto_848559 ) ) ( not ( = ?auto_848555 ?auto_848560 ) ) ( not ( = ?auto_848555 ?auto_848561 ) ) ( not ( = ?auto_848555 ?auto_848562 ) ) ( not ( = ?auto_848555 ?auto_848563 ) ) ( not ( = ?auto_848555 ?auto_848564 ) ) ( not ( = ?auto_848555 ?auto_848565 ) ) ( not ( = ?auto_848555 ?auto_848566 ) ) ( not ( = ?auto_848556 ?auto_848557 ) ) ( not ( = ?auto_848556 ?auto_848558 ) ) ( not ( = ?auto_848556 ?auto_848559 ) ) ( not ( = ?auto_848556 ?auto_848560 ) ) ( not ( = ?auto_848556 ?auto_848561 ) ) ( not ( = ?auto_848556 ?auto_848562 ) ) ( not ( = ?auto_848556 ?auto_848563 ) ) ( not ( = ?auto_848556 ?auto_848564 ) ) ( not ( = ?auto_848556 ?auto_848565 ) ) ( not ( = ?auto_848556 ?auto_848566 ) ) ( not ( = ?auto_848557 ?auto_848558 ) ) ( not ( = ?auto_848557 ?auto_848559 ) ) ( not ( = ?auto_848557 ?auto_848560 ) ) ( not ( = ?auto_848557 ?auto_848561 ) ) ( not ( = ?auto_848557 ?auto_848562 ) ) ( not ( = ?auto_848557 ?auto_848563 ) ) ( not ( = ?auto_848557 ?auto_848564 ) ) ( not ( = ?auto_848557 ?auto_848565 ) ) ( not ( = ?auto_848557 ?auto_848566 ) ) ( not ( = ?auto_848558 ?auto_848559 ) ) ( not ( = ?auto_848558 ?auto_848560 ) ) ( not ( = ?auto_848558 ?auto_848561 ) ) ( not ( = ?auto_848558 ?auto_848562 ) ) ( not ( = ?auto_848558 ?auto_848563 ) ) ( not ( = ?auto_848558 ?auto_848564 ) ) ( not ( = ?auto_848558 ?auto_848565 ) ) ( not ( = ?auto_848558 ?auto_848566 ) ) ( not ( = ?auto_848559 ?auto_848560 ) ) ( not ( = ?auto_848559 ?auto_848561 ) ) ( not ( = ?auto_848559 ?auto_848562 ) ) ( not ( = ?auto_848559 ?auto_848563 ) ) ( not ( = ?auto_848559 ?auto_848564 ) ) ( not ( = ?auto_848559 ?auto_848565 ) ) ( not ( = ?auto_848559 ?auto_848566 ) ) ( not ( = ?auto_848560 ?auto_848561 ) ) ( not ( = ?auto_848560 ?auto_848562 ) ) ( not ( = ?auto_848560 ?auto_848563 ) ) ( not ( = ?auto_848560 ?auto_848564 ) ) ( not ( = ?auto_848560 ?auto_848565 ) ) ( not ( = ?auto_848560 ?auto_848566 ) ) ( not ( = ?auto_848561 ?auto_848562 ) ) ( not ( = ?auto_848561 ?auto_848563 ) ) ( not ( = ?auto_848561 ?auto_848564 ) ) ( not ( = ?auto_848561 ?auto_848565 ) ) ( not ( = ?auto_848561 ?auto_848566 ) ) ( not ( = ?auto_848562 ?auto_848563 ) ) ( not ( = ?auto_848562 ?auto_848564 ) ) ( not ( = ?auto_848562 ?auto_848565 ) ) ( not ( = ?auto_848562 ?auto_848566 ) ) ( not ( = ?auto_848563 ?auto_848564 ) ) ( not ( = ?auto_848563 ?auto_848565 ) ) ( not ( = ?auto_848563 ?auto_848566 ) ) ( not ( = ?auto_848564 ?auto_848565 ) ) ( not ( = ?auto_848564 ?auto_848566 ) ) ( not ( = ?auto_848565 ?auto_848566 ) ) ( ON ?auto_848564 ?auto_848565 ) ( ON ?auto_848563 ?auto_848564 ) ( ON ?auto_848562 ?auto_848563 ) ( ON ?auto_848561 ?auto_848562 ) ( ON ?auto_848560 ?auto_848561 ) ( ON ?auto_848559 ?auto_848560 ) ( ON ?auto_848558 ?auto_848559 ) ( ON ?auto_848557 ?auto_848558 ) ( ON ?auto_848556 ?auto_848557 ) ( CLEAR ?auto_848554 ) ( ON ?auto_848555 ?auto_848556 ) ( CLEAR ?auto_848555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_848553 ?auto_848554 ?auto_848555 )
      ( MAKE-13PILE ?auto_848553 ?auto_848554 ?auto_848555 ?auto_848556 ?auto_848557 ?auto_848558 ?auto_848559 ?auto_848560 ?auto_848561 ?auto_848562 ?auto_848563 ?auto_848564 ?auto_848565 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_848607 - BLOCK
      ?auto_848608 - BLOCK
      ?auto_848609 - BLOCK
      ?auto_848610 - BLOCK
      ?auto_848611 - BLOCK
      ?auto_848612 - BLOCK
      ?auto_848613 - BLOCK
      ?auto_848614 - BLOCK
      ?auto_848615 - BLOCK
      ?auto_848616 - BLOCK
      ?auto_848617 - BLOCK
      ?auto_848618 - BLOCK
      ?auto_848619 - BLOCK
    )
    :vars
    (
      ?auto_848620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_848619 ?auto_848620 ) ( ON-TABLE ?auto_848607 ) ( not ( = ?auto_848607 ?auto_848608 ) ) ( not ( = ?auto_848607 ?auto_848609 ) ) ( not ( = ?auto_848607 ?auto_848610 ) ) ( not ( = ?auto_848607 ?auto_848611 ) ) ( not ( = ?auto_848607 ?auto_848612 ) ) ( not ( = ?auto_848607 ?auto_848613 ) ) ( not ( = ?auto_848607 ?auto_848614 ) ) ( not ( = ?auto_848607 ?auto_848615 ) ) ( not ( = ?auto_848607 ?auto_848616 ) ) ( not ( = ?auto_848607 ?auto_848617 ) ) ( not ( = ?auto_848607 ?auto_848618 ) ) ( not ( = ?auto_848607 ?auto_848619 ) ) ( not ( = ?auto_848607 ?auto_848620 ) ) ( not ( = ?auto_848608 ?auto_848609 ) ) ( not ( = ?auto_848608 ?auto_848610 ) ) ( not ( = ?auto_848608 ?auto_848611 ) ) ( not ( = ?auto_848608 ?auto_848612 ) ) ( not ( = ?auto_848608 ?auto_848613 ) ) ( not ( = ?auto_848608 ?auto_848614 ) ) ( not ( = ?auto_848608 ?auto_848615 ) ) ( not ( = ?auto_848608 ?auto_848616 ) ) ( not ( = ?auto_848608 ?auto_848617 ) ) ( not ( = ?auto_848608 ?auto_848618 ) ) ( not ( = ?auto_848608 ?auto_848619 ) ) ( not ( = ?auto_848608 ?auto_848620 ) ) ( not ( = ?auto_848609 ?auto_848610 ) ) ( not ( = ?auto_848609 ?auto_848611 ) ) ( not ( = ?auto_848609 ?auto_848612 ) ) ( not ( = ?auto_848609 ?auto_848613 ) ) ( not ( = ?auto_848609 ?auto_848614 ) ) ( not ( = ?auto_848609 ?auto_848615 ) ) ( not ( = ?auto_848609 ?auto_848616 ) ) ( not ( = ?auto_848609 ?auto_848617 ) ) ( not ( = ?auto_848609 ?auto_848618 ) ) ( not ( = ?auto_848609 ?auto_848619 ) ) ( not ( = ?auto_848609 ?auto_848620 ) ) ( not ( = ?auto_848610 ?auto_848611 ) ) ( not ( = ?auto_848610 ?auto_848612 ) ) ( not ( = ?auto_848610 ?auto_848613 ) ) ( not ( = ?auto_848610 ?auto_848614 ) ) ( not ( = ?auto_848610 ?auto_848615 ) ) ( not ( = ?auto_848610 ?auto_848616 ) ) ( not ( = ?auto_848610 ?auto_848617 ) ) ( not ( = ?auto_848610 ?auto_848618 ) ) ( not ( = ?auto_848610 ?auto_848619 ) ) ( not ( = ?auto_848610 ?auto_848620 ) ) ( not ( = ?auto_848611 ?auto_848612 ) ) ( not ( = ?auto_848611 ?auto_848613 ) ) ( not ( = ?auto_848611 ?auto_848614 ) ) ( not ( = ?auto_848611 ?auto_848615 ) ) ( not ( = ?auto_848611 ?auto_848616 ) ) ( not ( = ?auto_848611 ?auto_848617 ) ) ( not ( = ?auto_848611 ?auto_848618 ) ) ( not ( = ?auto_848611 ?auto_848619 ) ) ( not ( = ?auto_848611 ?auto_848620 ) ) ( not ( = ?auto_848612 ?auto_848613 ) ) ( not ( = ?auto_848612 ?auto_848614 ) ) ( not ( = ?auto_848612 ?auto_848615 ) ) ( not ( = ?auto_848612 ?auto_848616 ) ) ( not ( = ?auto_848612 ?auto_848617 ) ) ( not ( = ?auto_848612 ?auto_848618 ) ) ( not ( = ?auto_848612 ?auto_848619 ) ) ( not ( = ?auto_848612 ?auto_848620 ) ) ( not ( = ?auto_848613 ?auto_848614 ) ) ( not ( = ?auto_848613 ?auto_848615 ) ) ( not ( = ?auto_848613 ?auto_848616 ) ) ( not ( = ?auto_848613 ?auto_848617 ) ) ( not ( = ?auto_848613 ?auto_848618 ) ) ( not ( = ?auto_848613 ?auto_848619 ) ) ( not ( = ?auto_848613 ?auto_848620 ) ) ( not ( = ?auto_848614 ?auto_848615 ) ) ( not ( = ?auto_848614 ?auto_848616 ) ) ( not ( = ?auto_848614 ?auto_848617 ) ) ( not ( = ?auto_848614 ?auto_848618 ) ) ( not ( = ?auto_848614 ?auto_848619 ) ) ( not ( = ?auto_848614 ?auto_848620 ) ) ( not ( = ?auto_848615 ?auto_848616 ) ) ( not ( = ?auto_848615 ?auto_848617 ) ) ( not ( = ?auto_848615 ?auto_848618 ) ) ( not ( = ?auto_848615 ?auto_848619 ) ) ( not ( = ?auto_848615 ?auto_848620 ) ) ( not ( = ?auto_848616 ?auto_848617 ) ) ( not ( = ?auto_848616 ?auto_848618 ) ) ( not ( = ?auto_848616 ?auto_848619 ) ) ( not ( = ?auto_848616 ?auto_848620 ) ) ( not ( = ?auto_848617 ?auto_848618 ) ) ( not ( = ?auto_848617 ?auto_848619 ) ) ( not ( = ?auto_848617 ?auto_848620 ) ) ( not ( = ?auto_848618 ?auto_848619 ) ) ( not ( = ?auto_848618 ?auto_848620 ) ) ( not ( = ?auto_848619 ?auto_848620 ) ) ( ON ?auto_848618 ?auto_848619 ) ( ON ?auto_848617 ?auto_848618 ) ( ON ?auto_848616 ?auto_848617 ) ( ON ?auto_848615 ?auto_848616 ) ( ON ?auto_848614 ?auto_848615 ) ( ON ?auto_848613 ?auto_848614 ) ( ON ?auto_848612 ?auto_848613 ) ( ON ?auto_848611 ?auto_848612 ) ( ON ?auto_848610 ?auto_848611 ) ( ON ?auto_848609 ?auto_848610 ) ( CLEAR ?auto_848607 ) ( ON ?auto_848608 ?auto_848609 ) ( CLEAR ?auto_848608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_848607 ?auto_848608 )
      ( MAKE-13PILE ?auto_848607 ?auto_848608 ?auto_848609 ?auto_848610 ?auto_848611 ?auto_848612 ?auto_848613 ?auto_848614 ?auto_848615 ?auto_848616 ?auto_848617 ?auto_848618 ?auto_848619 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_848661 - BLOCK
      ?auto_848662 - BLOCK
      ?auto_848663 - BLOCK
      ?auto_848664 - BLOCK
      ?auto_848665 - BLOCK
      ?auto_848666 - BLOCK
      ?auto_848667 - BLOCK
      ?auto_848668 - BLOCK
      ?auto_848669 - BLOCK
      ?auto_848670 - BLOCK
      ?auto_848671 - BLOCK
      ?auto_848672 - BLOCK
      ?auto_848673 - BLOCK
    )
    :vars
    (
      ?auto_848674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_848673 ?auto_848674 ) ( not ( = ?auto_848661 ?auto_848662 ) ) ( not ( = ?auto_848661 ?auto_848663 ) ) ( not ( = ?auto_848661 ?auto_848664 ) ) ( not ( = ?auto_848661 ?auto_848665 ) ) ( not ( = ?auto_848661 ?auto_848666 ) ) ( not ( = ?auto_848661 ?auto_848667 ) ) ( not ( = ?auto_848661 ?auto_848668 ) ) ( not ( = ?auto_848661 ?auto_848669 ) ) ( not ( = ?auto_848661 ?auto_848670 ) ) ( not ( = ?auto_848661 ?auto_848671 ) ) ( not ( = ?auto_848661 ?auto_848672 ) ) ( not ( = ?auto_848661 ?auto_848673 ) ) ( not ( = ?auto_848661 ?auto_848674 ) ) ( not ( = ?auto_848662 ?auto_848663 ) ) ( not ( = ?auto_848662 ?auto_848664 ) ) ( not ( = ?auto_848662 ?auto_848665 ) ) ( not ( = ?auto_848662 ?auto_848666 ) ) ( not ( = ?auto_848662 ?auto_848667 ) ) ( not ( = ?auto_848662 ?auto_848668 ) ) ( not ( = ?auto_848662 ?auto_848669 ) ) ( not ( = ?auto_848662 ?auto_848670 ) ) ( not ( = ?auto_848662 ?auto_848671 ) ) ( not ( = ?auto_848662 ?auto_848672 ) ) ( not ( = ?auto_848662 ?auto_848673 ) ) ( not ( = ?auto_848662 ?auto_848674 ) ) ( not ( = ?auto_848663 ?auto_848664 ) ) ( not ( = ?auto_848663 ?auto_848665 ) ) ( not ( = ?auto_848663 ?auto_848666 ) ) ( not ( = ?auto_848663 ?auto_848667 ) ) ( not ( = ?auto_848663 ?auto_848668 ) ) ( not ( = ?auto_848663 ?auto_848669 ) ) ( not ( = ?auto_848663 ?auto_848670 ) ) ( not ( = ?auto_848663 ?auto_848671 ) ) ( not ( = ?auto_848663 ?auto_848672 ) ) ( not ( = ?auto_848663 ?auto_848673 ) ) ( not ( = ?auto_848663 ?auto_848674 ) ) ( not ( = ?auto_848664 ?auto_848665 ) ) ( not ( = ?auto_848664 ?auto_848666 ) ) ( not ( = ?auto_848664 ?auto_848667 ) ) ( not ( = ?auto_848664 ?auto_848668 ) ) ( not ( = ?auto_848664 ?auto_848669 ) ) ( not ( = ?auto_848664 ?auto_848670 ) ) ( not ( = ?auto_848664 ?auto_848671 ) ) ( not ( = ?auto_848664 ?auto_848672 ) ) ( not ( = ?auto_848664 ?auto_848673 ) ) ( not ( = ?auto_848664 ?auto_848674 ) ) ( not ( = ?auto_848665 ?auto_848666 ) ) ( not ( = ?auto_848665 ?auto_848667 ) ) ( not ( = ?auto_848665 ?auto_848668 ) ) ( not ( = ?auto_848665 ?auto_848669 ) ) ( not ( = ?auto_848665 ?auto_848670 ) ) ( not ( = ?auto_848665 ?auto_848671 ) ) ( not ( = ?auto_848665 ?auto_848672 ) ) ( not ( = ?auto_848665 ?auto_848673 ) ) ( not ( = ?auto_848665 ?auto_848674 ) ) ( not ( = ?auto_848666 ?auto_848667 ) ) ( not ( = ?auto_848666 ?auto_848668 ) ) ( not ( = ?auto_848666 ?auto_848669 ) ) ( not ( = ?auto_848666 ?auto_848670 ) ) ( not ( = ?auto_848666 ?auto_848671 ) ) ( not ( = ?auto_848666 ?auto_848672 ) ) ( not ( = ?auto_848666 ?auto_848673 ) ) ( not ( = ?auto_848666 ?auto_848674 ) ) ( not ( = ?auto_848667 ?auto_848668 ) ) ( not ( = ?auto_848667 ?auto_848669 ) ) ( not ( = ?auto_848667 ?auto_848670 ) ) ( not ( = ?auto_848667 ?auto_848671 ) ) ( not ( = ?auto_848667 ?auto_848672 ) ) ( not ( = ?auto_848667 ?auto_848673 ) ) ( not ( = ?auto_848667 ?auto_848674 ) ) ( not ( = ?auto_848668 ?auto_848669 ) ) ( not ( = ?auto_848668 ?auto_848670 ) ) ( not ( = ?auto_848668 ?auto_848671 ) ) ( not ( = ?auto_848668 ?auto_848672 ) ) ( not ( = ?auto_848668 ?auto_848673 ) ) ( not ( = ?auto_848668 ?auto_848674 ) ) ( not ( = ?auto_848669 ?auto_848670 ) ) ( not ( = ?auto_848669 ?auto_848671 ) ) ( not ( = ?auto_848669 ?auto_848672 ) ) ( not ( = ?auto_848669 ?auto_848673 ) ) ( not ( = ?auto_848669 ?auto_848674 ) ) ( not ( = ?auto_848670 ?auto_848671 ) ) ( not ( = ?auto_848670 ?auto_848672 ) ) ( not ( = ?auto_848670 ?auto_848673 ) ) ( not ( = ?auto_848670 ?auto_848674 ) ) ( not ( = ?auto_848671 ?auto_848672 ) ) ( not ( = ?auto_848671 ?auto_848673 ) ) ( not ( = ?auto_848671 ?auto_848674 ) ) ( not ( = ?auto_848672 ?auto_848673 ) ) ( not ( = ?auto_848672 ?auto_848674 ) ) ( not ( = ?auto_848673 ?auto_848674 ) ) ( ON ?auto_848672 ?auto_848673 ) ( ON ?auto_848671 ?auto_848672 ) ( ON ?auto_848670 ?auto_848671 ) ( ON ?auto_848669 ?auto_848670 ) ( ON ?auto_848668 ?auto_848669 ) ( ON ?auto_848667 ?auto_848668 ) ( ON ?auto_848666 ?auto_848667 ) ( ON ?auto_848665 ?auto_848666 ) ( ON ?auto_848664 ?auto_848665 ) ( ON ?auto_848663 ?auto_848664 ) ( ON ?auto_848662 ?auto_848663 ) ( ON ?auto_848661 ?auto_848662 ) ( CLEAR ?auto_848661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_848661 )
      ( MAKE-13PILE ?auto_848661 ?auto_848662 ?auto_848663 ?auto_848664 ?auto_848665 ?auto_848666 ?auto_848667 ?auto_848668 ?auto_848669 ?auto_848670 ?auto_848671 ?auto_848672 ?auto_848673 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_848716 - BLOCK
      ?auto_848717 - BLOCK
      ?auto_848718 - BLOCK
      ?auto_848719 - BLOCK
      ?auto_848720 - BLOCK
      ?auto_848721 - BLOCK
      ?auto_848722 - BLOCK
      ?auto_848723 - BLOCK
      ?auto_848724 - BLOCK
      ?auto_848725 - BLOCK
      ?auto_848726 - BLOCK
      ?auto_848727 - BLOCK
      ?auto_848728 - BLOCK
      ?auto_848729 - BLOCK
    )
    :vars
    (
      ?auto_848730 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_848728 ) ( ON ?auto_848729 ?auto_848730 ) ( CLEAR ?auto_848729 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_848716 ) ( ON ?auto_848717 ?auto_848716 ) ( ON ?auto_848718 ?auto_848717 ) ( ON ?auto_848719 ?auto_848718 ) ( ON ?auto_848720 ?auto_848719 ) ( ON ?auto_848721 ?auto_848720 ) ( ON ?auto_848722 ?auto_848721 ) ( ON ?auto_848723 ?auto_848722 ) ( ON ?auto_848724 ?auto_848723 ) ( ON ?auto_848725 ?auto_848724 ) ( ON ?auto_848726 ?auto_848725 ) ( ON ?auto_848727 ?auto_848726 ) ( ON ?auto_848728 ?auto_848727 ) ( not ( = ?auto_848716 ?auto_848717 ) ) ( not ( = ?auto_848716 ?auto_848718 ) ) ( not ( = ?auto_848716 ?auto_848719 ) ) ( not ( = ?auto_848716 ?auto_848720 ) ) ( not ( = ?auto_848716 ?auto_848721 ) ) ( not ( = ?auto_848716 ?auto_848722 ) ) ( not ( = ?auto_848716 ?auto_848723 ) ) ( not ( = ?auto_848716 ?auto_848724 ) ) ( not ( = ?auto_848716 ?auto_848725 ) ) ( not ( = ?auto_848716 ?auto_848726 ) ) ( not ( = ?auto_848716 ?auto_848727 ) ) ( not ( = ?auto_848716 ?auto_848728 ) ) ( not ( = ?auto_848716 ?auto_848729 ) ) ( not ( = ?auto_848716 ?auto_848730 ) ) ( not ( = ?auto_848717 ?auto_848718 ) ) ( not ( = ?auto_848717 ?auto_848719 ) ) ( not ( = ?auto_848717 ?auto_848720 ) ) ( not ( = ?auto_848717 ?auto_848721 ) ) ( not ( = ?auto_848717 ?auto_848722 ) ) ( not ( = ?auto_848717 ?auto_848723 ) ) ( not ( = ?auto_848717 ?auto_848724 ) ) ( not ( = ?auto_848717 ?auto_848725 ) ) ( not ( = ?auto_848717 ?auto_848726 ) ) ( not ( = ?auto_848717 ?auto_848727 ) ) ( not ( = ?auto_848717 ?auto_848728 ) ) ( not ( = ?auto_848717 ?auto_848729 ) ) ( not ( = ?auto_848717 ?auto_848730 ) ) ( not ( = ?auto_848718 ?auto_848719 ) ) ( not ( = ?auto_848718 ?auto_848720 ) ) ( not ( = ?auto_848718 ?auto_848721 ) ) ( not ( = ?auto_848718 ?auto_848722 ) ) ( not ( = ?auto_848718 ?auto_848723 ) ) ( not ( = ?auto_848718 ?auto_848724 ) ) ( not ( = ?auto_848718 ?auto_848725 ) ) ( not ( = ?auto_848718 ?auto_848726 ) ) ( not ( = ?auto_848718 ?auto_848727 ) ) ( not ( = ?auto_848718 ?auto_848728 ) ) ( not ( = ?auto_848718 ?auto_848729 ) ) ( not ( = ?auto_848718 ?auto_848730 ) ) ( not ( = ?auto_848719 ?auto_848720 ) ) ( not ( = ?auto_848719 ?auto_848721 ) ) ( not ( = ?auto_848719 ?auto_848722 ) ) ( not ( = ?auto_848719 ?auto_848723 ) ) ( not ( = ?auto_848719 ?auto_848724 ) ) ( not ( = ?auto_848719 ?auto_848725 ) ) ( not ( = ?auto_848719 ?auto_848726 ) ) ( not ( = ?auto_848719 ?auto_848727 ) ) ( not ( = ?auto_848719 ?auto_848728 ) ) ( not ( = ?auto_848719 ?auto_848729 ) ) ( not ( = ?auto_848719 ?auto_848730 ) ) ( not ( = ?auto_848720 ?auto_848721 ) ) ( not ( = ?auto_848720 ?auto_848722 ) ) ( not ( = ?auto_848720 ?auto_848723 ) ) ( not ( = ?auto_848720 ?auto_848724 ) ) ( not ( = ?auto_848720 ?auto_848725 ) ) ( not ( = ?auto_848720 ?auto_848726 ) ) ( not ( = ?auto_848720 ?auto_848727 ) ) ( not ( = ?auto_848720 ?auto_848728 ) ) ( not ( = ?auto_848720 ?auto_848729 ) ) ( not ( = ?auto_848720 ?auto_848730 ) ) ( not ( = ?auto_848721 ?auto_848722 ) ) ( not ( = ?auto_848721 ?auto_848723 ) ) ( not ( = ?auto_848721 ?auto_848724 ) ) ( not ( = ?auto_848721 ?auto_848725 ) ) ( not ( = ?auto_848721 ?auto_848726 ) ) ( not ( = ?auto_848721 ?auto_848727 ) ) ( not ( = ?auto_848721 ?auto_848728 ) ) ( not ( = ?auto_848721 ?auto_848729 ) ) ( not ( = ?auto_848721 ?auto_848730 ) ) ( not ( = ?auto_848722 ?auto_848723 ) ) ( not ( = ?auto_848722 ?auto_848724 ) ) ( not ( = ?auto_848722 ?auto_848725 ) ) ( not ( = ?auto_848722 ?auto_848726 ) ) ( not ( = ?auto_848722 ?auto_848727 ) ) ( not ( = ?auto_848722 ?auto_848728 ) ) ( not ( = ?auto_848722 ?auto_848729 ) ) ( not ( = ?auto_848722 ?auto_848730 ) ) ( not ( = ?auto_848723 ?auto_848724 ) ) ( not ( = ?auto_848723 ?auto_848725 ) ) ( not ( = ?auto_848723 ?auto_848726 ) ) ( not ( = ?auto_848723 ?auto_848727 ) ) ( not ( = ?auto_848723 ?auto_848728 ) ) ( not ( = ?auto_848723 ?auto_848729 ) ) ( not ( = ?auto_848723 ?auto_848730 ) ) ( not ( = ?auto_848724 ?auto_848725 ) ) ( not ( = ?auto_848724 ?auto_848726 ) ) ( not ( = ?auto_848724 ?auto_848727 ) ) ( not ( = ?auto_848724 ?auto_848728 ) ) ( not ( = ?auto_848724 ?auto_848729 ) ) ( not ( = ?auto_848724 ?auto_848730 ) ) ( not ( = ?auto_848725 ?auto_848726 ) ) ( not ( = ?auto_848725 ?auto_848727 ) ) ( not ( = ?auto_848725 ?auto_848728 ) ) ( not ( = ?auto_848725 ?auto_848729 ) ) ( not ( = ?auto_848725 ?auto_848730 ) ) ( not ( = ?auto_848726 ?auto_848727 ) ) ( not ( = ?auto_848726 ?auto_848728 ) ) ( not ( = ?auto_848726 ?auto_848729 ) ) ( not ( = ?auto_848726 ?auto_848730 ) ) ( not ( = ?auto_848727 ?auto_848728 ) ) ( not ( = ?auto_848727 ?auto_848729 ) ) ( not ( = ?auto_848727 ?auto_848730 ) ) ( not ( = ?auto_848728 ?auto_848729 ) ) ( not ( = ?auto_848728 ?auto_848730 ) ) ( not ( = ?auto_848729 ?auto_848730 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_848729 ?auto_848730 )
      ( !STACK ?auto_848729 ?auto_848728 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_848774 - BLOCK
      ?auto_848775 - BLOCK
      ?auto_848776 - BLOCK
      ?auto_848777 - BLOCK
      ?auto_848778 - BLOCK
      ?auto_848779 - BLOCK
      ?auto_848780 - BLOCK
      ?auto_848781 - BLOCK
      ?auto_848782 - BLOCK
      ?auto_848783 - BLOCK
      ?auto_848784 - BLOCK
      ?auto_848785 - BLOCK
      ?auto_848786 - BLOCK
      ?auto_848787 - BLOCK
    )
    :vars
    (
      ?auto_848788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_848787 ?auto_848788 ) ( ON-TABLE ?auto_848774 ) ( ON ?auto_848775 ?auto_848774 ) ( ON ?auto_848776 ?auto_848775 ) ( ON ?auto_848777 ?auto_848776 ) ( ON ?auto_848778 ?auto_848777 ) ( ON ?auto_848779 ?auto_848778 ) ( ON ?auto_848780 ?auto_848779 ) ( ON ?auto_848781 ?auto_848780 ) ( ON ?auto_848782 ?auto_848781 ) ( ON ?auto_848783 ?auto_848782 ) ( ON ?auto_848784 ?auto_848783 ) ( ON ?auto_848785 ?auto_848784 ) ( not ( = ?auto_848774 ?auto_848775 ) ) ( not ( = ?auto_848774 ?auto_848776 ) ) ( not ( = ?auto_848774 ?auto_848777 ) ) ( not ( = ?auto_848774 ?auto_848778 ) ) ( not ( = ?auto_848774 ?auto_848779 ) ) ( not ( = ?auto_848774 ?auto_848780 ) ) ( not ( = ?auto_848774 ?auto_848781 ) ) ( not ( = ?auto_848774 ?auto_848782 ) ) ( not ( = ?auto_848774 ?auto_848783 ) ) ( not ( = ?auto_848774 ?auto_848784 ) ) ( not ( = ?auto_848774 ?auto_848785 ) ) ( not ( = ?auto_848774 ?auto_848786 ) ) ( not ( = ?auto_848774 ?auto_848787 ) ) ( not ( = ?auto_848774 ?auto_848788 ) ) ( not ( = ?auto_848775 ?auto_848776 ) ) ( not ( = ?auto_848775 ?auto_848777 ) ) ( not ( = ?auto_848775 ?auto_848778 ) ) ( not ( = ?auto_848775 ?auto_848779 ) ) ( not ( = ?auto_848775 ?auto_848780 ) ) ( not ( = ?auto_848775 ?auto_848781 ) ) ( not ( = ?auto_848775 ?auto_848782 ) ) ( not ( = ?auto_848775 ?auto_848783 ) ) ( not ( = ?auto_848775 ?auto_848784 ) ) ( not ( = ?auto_848775 ?auto_848785 ) ) ( not ( = ?auto_848775 ?auto_848786 ) ) ( not ( = ?auto_848775 ?auto_848787 ) ) ( not ( = ?auto_848775 ?auto_848788 ) ) ( not ( = ?auto_848776 ?auto_848777 ) ) ( not ( = ?auto_848776 ?auto_848778 ) ) ( not ( = ?auto_848776 ?auto_848779 ) ) ( not ( = ?auto_848776 ?auto_848780 ) ) ( not ( = ?auto_848776 ?auto_848781 ) ) ( not ( = ?auto_848776 ?auto_848782 ) ) ( not ( = ?auto_848776 ?auto_848783 ) ) ( not ( = ?auto_848776 ?auto_848784 ) ) ( not ( = ?auto_848776 ?auto_848785 ) ) ( not ( = ?auto_848776 ?auto_848786 ) ) ( not ( = ?auto_848776 ?auto_848787 ) ) ( not ( = ?auto_848776 ?auto_848788 ) ) ( not ( = ?auto_848777 ?auto_848778 ) ) ( not ( = ?auto_848777 ?auto_848779 ) ) ( not ( = ?auto_848777 ?auto_848780 ) ) ( not ( = ?auto_848777 ?auto_848781 ) ) ( not ( = ?auto_848777 ?auto_848782 ) ) ( not ( = ?auto_848777 ?auto_848783 ) ) ( not ( = ?auto_848777 ?auto_848784 ) ) ( not ( = ?auto_848777 ?auto_848785 ) ) ( not ( = ?auto_848777 ?auto_848786 ) ) ( not ( = ?auto_848777 ?auto_848787 ) ) ( not ( = ?auto_848777 ?auto_848788 ) ) ( not ( = ?auto_848778 ?auto_848779 ) ) ( not ( = ?auto_848778 ?auto_848780 ) ) ( not ( = ?auto_848778 ?auto_848781 ) ) ( not ( = ?auto_848778 ?auto_848782 ) ) ( not ( = ?auto_848778 ?auto_848783 ) ) ( not ( = ?auto_848778 ?auto_848784 ) ) ( not ( = ?auto_848778 ?auto_848785 ) ) ( not ( = ?auto_848778 ?auto_848786 ) ) ( not ( = ?auto_848778 ?auto_848787 ) ) ( not ( = ?auto_848778 ?auto_848788 ) ) ( not ( = ?auto_848779 ?auto_848780 ) ) ( not ( = ?auto_848779 ?auto_848781 ) ) ( not ( = ?auto_848779 ?auto_848782 ) ) ( not ( = ?auto_848779 ?auto_848783 ) ) ( not ( = ?auto_848779 ?auto_848784 ) ) ( not ( = ?auto_848779 ?auto_848785 ) ) ( not ( = ?auto_848779 ?auto_848786 ) ) ( not ( = ?auto_848779 ?auto_848787 ) ) ( not ( = ?auto_848779 ?auto_848788 ) ) ( not ( = ?auto_848780 ?auto_848781 ) ) ( not ( = ?auto_848780 ?auto_848782 ) ) ( not ( = ?auto_848780 ?auto_848783 ) ) ( not ( = ?auto_848780 ?auto_848784 ) ) ( not ( = ?auto_848780 ?auto_848785 ) ) ( not ( = ?auto_848780 ?auto_848786 ) ) ( not ( = ?auto_848780 ?auto_848787 ) ) ( not ( = ?auto_848780 ?auto_848788 ) ) ( not ( = ?auto_848781 ?auto_848782 ) ) ( not ( = ?auto_848781 ?auto_848783 ) ) ( not ( = ?auto_848781 ?auto_848784 ) ) ( not ( = ?auto_848781 ?auto_848785 ) ) ( not ( = ?auto_848781 ?auto_848786 ) ) ( not ( = ?auto_848781 ?auto_848787 ) ) ( not ( = ?auto_848781 ?auto_848788 ) ) ( not ( = ?auto_848782 ?auto_848783 ) ) ( not ( = ?auto_848782 ?auto_848784 ) ) ( not ( = ?auto_848782 ?auto_848785 ) ) ( not ( = ?auto_848782 ?auto_848786 ) ) ( not ( = ?auto_848782 ?auto_848787 ) ) ( not ( = ?auto_848782 ?auto_848788 ) ) ( not ( = ?auto_848783 ?auto_848784 ) ) ( not ( = ?auto_848783 ?auto_848785 ) ) ( not ( = ?auto_848783 ?auto_848786 ) ) ( not ( = ?auto_848783 ?auto_848787 ) ) ( not ( = ?auto_848783 ?auto_848788 ) ) ( not ( = ?auto_848784 ?auto_848785 ) ) ( not ( = ?auto_848784 ?auto_848786 ) ) ( not ( = ?auto_848784 ?auto_848787 ) ) ( not ( = ?auto_848784 ?auto_848788 ) ) ( not ( = ?auto_848785 ?auto_848786 ) ) ( not ( = ?auto_848785 ?auto_848787 ) ) ( not ( = ?auto_848785 ?auto_848788 ) ) ( not ( = ?auto_848786 ?auto_848787 ) ) ( not ( = ?auto_848786 ?auto_848788 ) ) ( not ( = ?auto_848787 ?auto_848788 ) ) ( CLEAR ?auto_848785 ) ( ON ?auto_848786 ?auto_848787 ) ( CLEAR ?auto_848786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_848774 ?auto_848775 ?auto_848776 ?auto_848777 ?auto_848778 ?auto_848779 ?auto_848780 ?auto_848781 ?auto_848782 ?auto_848783 ?auto_848784 ?auto_848785 ?auto_848786 )
      ( MAKE-14PILE ?auto_848774 ?auto_848775 ?auto_848776 ?auto_848777 ?auto_848778 ?auto_848779 ?auto_848780 ?auto_848781 ?auto_848782 ?auto_848783 ?auto_848784 ?auto_848785 ?auto_848786 ?auto_848787 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_848832 - BLOCK
      ?auto_848833 - BLOCK
      ?auto_848834 - BLOCK
      ?auto_848835 - BLOCK
      ?auto_848836 - BLOCK
      ?auto_848837 - BLOCK
      ?auto_848838 - BLOCK
      ?auto_848839 - BLOCK
      ?auto_848840 - BLOCK
      ?auto_848841 - BLOCK
      ?auto_848842 - BLOCK
      ?auto_848843 - BLOCK
      ?auto_848844 - BLOCK
      ?auto_848845 - BLOCK
    )
    :vars
    (
      ?auto_848846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_848845 ?auto_848846 ) ( ON-TABLE ?auto_848832 ) ( ON ?auto_848833 ?auto_848832 ) ( ON ?auto_848834 ?auto_848833 ) ( ON ?auto_848835 ?auto_848834 ) ( ON ?auto_848836 ?auto_848835 ) ( ON ?auto_848837 ?auto_848836 ) ( ON ?auto_848838 ?auto_848837 ) ( ON ?auto_848839 ?auto_848838 ) ( ON ?auto_848840 ?auto_848839 ) ( ON ?auto_848841 ?auto_848840 ) ( ON ?auto_848842 ?auto_848841 ) ( not ( = ?auto_848832 ?auto_848833 ) ) ( not ( = ?auto_848832 ?auto_848834 ) ) ( not ( = ?auto_848832 ?auto_848835 ) ) ( not ( = ?auto_848832 ?auto_848836 ) ) ( not ( = ?auto_848832 ?auto_848837 ) ) ( not ( = ?auto_848832 ?auto_848838 ) ) ( not ( = ?auto_848832 ?auto_848839 ) ) ( not ( = ?auto_848832 ?auto_848840 ) ) ( not ( = ?auto_848832 ?auto_848841 ) ) ( not ( = ?auto_848832 ?auto_848842 ) ) ( not ( = ?auto_848832 ?auto_848843 ) ) ( not ( = ?auto_848832 ?auto_848844 ) ) ( not ( = ?auto_848832 ?auto_848845 ) ) ( not ( = ?auto_848832 ?auto_848846 ) ) ( not ( = ?auto_848833 ?auto_848834 ) ) ( not ( = ?auto_848833 ?auto_848835 ) ) ( not ( = ?auto_848833 ?auto_848836 ) ) ( not ( = ?auto_848833 ?auto_848837 ) ) ( not ( = ?auto_848833 ?auto_848838 ) ) ( not ( = ?auto_848833 ?auto_848839 ) ) ( not ( = ?auto_848833 ?auto_848840 ) ) ( not ( = ?auto_848833 ?auto_848841 ) ) ( not ( = ?auto_848833 ?auto_848842 ) ) ( not ( = ?auto_848833 ?auto_848843 ) ) ( not ( = ?auto_848833 ?auto_848844 ) ) ( not ( = ?auto_848833 ?auto_848845 ) ) ( not ( = ?auto_848833 ?auto_848846 ) ) ( not ( = ?auto_848834 ?auto_848835 ) ) ( not ( = ?auto_848834 ?auto_848836 ) ) ( not ( = ?auto_848834 ?auto_848837 ) ) ( not ( = ?auto_848834 ?auto_848838 ) ) ( not ( = ?auto_848834 ?auto_848839 ) ) ( not ( = ?auto_848834 ?auto_848840 ) ) ( not ( = ?auto_848834 ?auto_848841 ) ) ( not ( = ?auto_848834 ?auto_848842 ) ) ( not ( = ?auto_848834 ?auto_848843 ) ) ( not ( = ?auto_848834 ?auto_848844 ) ) ( not ( = ?auto_848834 ?auto_848845 ) ) ( not ( = ?auto_848834 ?auto_848846 ) ) ( not ( = ?auto_848835 ?auto_848836 ) ) ( not ( = ?auto_848835 ?auto_848837 ) ) ( not ( = ?auto_848835 ?auto_848838 ) ) ( not ( = ?auto_848835 ?auto_848839 ) ) ( not ( = ?auto_848835 ?auto_848840 ) ) ( not ( = ?auto_848835 ?auto_848841 ) ) ( not ( = ?auto_848835 ?auto_848842 ) ) ( not ( = ?auto_848835 ?auto_848843 ) ) ( not ( = ?auto_848835 ?auto_848844 ) ) ( not ( = ?auto_848835 ?auto_848845 ) ) ( not ( = ?auto_848835 ?auto_848846 ) ) ( not ( = ?auto_848836 ?auto_848837 ) ) ( not ( = ?auto_848836 ?auto_848838 ) ) ( not ( = ?auto_848836 ?auto_848839 ) ) ( not ( = ?auto_848836 ?auto_848840 ) ) ( not ( = ?auto_848836 ?auto_848841 ) ) ( not ( = ?auto_848836 ?auto_848842 ) ) ( not ( = ?auto_848836 ?auto_848843 ) ) ( not ( = ?auto_848836 ?auto_848844 ) ) ( not ( = ?auto_848836 ?auto_848845 ) ) ( not ( = ?auto_848836 ?auto_848846 ) ) ( not ( = ?auto_848837 ?auto_848838 ) ) ( not ( = ?auto_848837 ?auto_848839 ) ) ( not ( = ?auto_848837 ?auto_848840 ) ) ( not ( = ?auto_848837 ?auto_848841 ) ) ( not ( = ?auto_848837 ?auto_848842 ) ) ( not ( = ?auto_848837 ?auto_848843 ) ) ( not ( = ?auto_848837 ?auto_848844 ) ) ( not ( = ?auto_848837 ?auto_848845 ) ) ( not ( = ?auto_848837 ?auto_848846 ) ) ( not ( = ?auto_848838 ?auto_848839 ) ) ( not ( = ?auto_848838 ?auto_848840 ) ) ( not ( = ?auto_848838 ?auto_848841 ) ) ( not ( = ?auto_848838 ?auto_848842 ) ) ( not ( = ?auto_848838 ?auto_848843 ) ) ( not ( = ?auto_848838 ?auto_848844 ) ) ( not ( = ?auto_848838 ?auto_848845 ) ) ( not ( = ?auto_848838 ?auto_848846 ) ) ( not ( = ?auto_848839 ?auto_848840 ) ) ( not ( = ?auto_848839 ?auto_848841 ) ) ( not ( = ?auto_848839 ?auto_848842 ) ) ( not ( = ?auto_848839 ?auto_848843 ) ) ( not ( = ?auto_848839 ?auto_848844 ) ) ( not ( = ?auto_848839 ?auto_848845 ) ) ( not ( = ?auto_848839 ?auto_848846 ) ) ( not ( = ?auto_848840 ?auto_848841 ) ) ( not ( = ?auto_848840 ?auto_848842 ) ) ( not ( = ?auto_848840 ?auto_848843 ) ) ( not ( = ?auto_848840 ?auto_848844 ) ) ( not ( = ?auto_848840 ?auto_848845 ) ) ( not ( = ?auto_848840 ?auto_848846 ) ) ( not ( = ?auto_848841 ?auto_848842 ) ) ( not ( = ?auto_848841 ?auto_848843 ) ) ( not ( = ?auto_848841 ?auto_848844 ) ) ( not ( = ?auto_848841 ?auto_848845 ) ) ( not ( = ?auto_848841 ?auto_848846 ) ) ( not ( = ?auto_848842 ?auto_848843 ) ) ( not ( = ?auto_848842 ?auto_848844 ) ) ( not ( = ?auto_848842 ?auto_848845 ) ) ( not ( = ?auto_848842 ?auto_848846 ) ) ( not ( = ?auto_848843 ?auto_848844 ) ) ( not ( = ?auto_848843 ?auto_848845 ) ) ( not ( = ?auto_848843 ?auto_848846 ) ) ( not ( = ?auto_848844 ?auto_848845 ) ) ( not ( = ?auto_848844 ?auto_848846 ) ) ( not ( = ?auto_848845 ?auto_848846 ) ) ( ON ?auto_848844 ?auto_848845 ) ( CLEAR ?auto_848842 ) ( ON ?auto_848843 ?auto_848844 ) ( CLEAR ?auto_848843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_848832 ?auto_848833 ?auto_848834 ?auto_848835 ?auto_848836 ?auto_848837 ?auto_848838 ?auto_848839 ?auto_848840 ?auto_848841 ?auto_848842 ?auto_848843 )
      ( MAKE-14PILE ?auto_848832 ?auto_848833 ?auto_848834 ?auto_848835 ?auto_848836 ?auto_848837 ?auto_848838 ?auto_848839 ?auto_848840 ?auto_848841 ?auto_848842 ?auto_848843 ?auto_848844 ?auto_848845 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_848890 - BLOCK
      ?auto_848891 - BLOCK
      ?auto_848892 - BLOCK
      ?auto_848893 - BLOCK
      ?auto_848894 - BLOCK
      ?auto_848895 - BLOCK
      ?auto_848896 - BLOCK
      ?auto_848897 - BLOCK
      ?auto_848898 - BLOCK
      ?auto_848899 - BLOCK
      ?auto_848900 - BLOCK
      ?auto_848901 - BLOCK
      ?auto_848902 - BLOCK
      ?auto_848903 - BLOCK
    )
    :vars
    (
      ?auto_848904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_848903 ?auto_848904 ) ( ON-TABLE ?auto_848890 ) ( ON ?auto_848891 ?auto_848890 ) ( ON ?auto_848892 ?auto_848891 ) ( ON ?auto_848893 ?auto_848892 ) ( ON ?auto_848894 ?auto_848893 ) ( ON ?auto_848895 ?auto_848894 ) ( ON ?auto_848896 ?auto_848895 ) ( ON ?auto_848897 ?auto_848896 ) ( ON ?auto_848898 ?auto_848897 ) ( ON ?auto_848899 ?auto_848898 ) ( not ( = ?auto_848890 ?auto_848891 ) ) ( not ( = ?auto_848890 ?auto_848892 ) ) ( not ( = ?auto_848890 ?auto_848893 ) ) ( not ( = ?auto_848890 ?auto_848894 ) ) ( not ( = ?auto_848890 ?auto_848895 ) ) ( not ( = ?auto_848890 ?auto_848896 ) ) ( not ( = ?auto_848890 ?auto_848897 ) ) ( not ( = ?auto_848890 ?auto_848898 ) ) ( not ( = ?auto_848890 ?auto_848899 ) ) ( not ( = ?auto_848890 ?auto_848900 ) ) ( not ( = ?auto_848890 ?auto_848901 ) ) ( not ( = ?auto_848890 ?auto_848902 ) ) ( not ( = ?auto_848890 ?auto_848903 ) ) ( not ( = ?auto_848890 ?auto_848904 ) ) ( not ( = ?auto_848891 ?auto_848892 ) ) ( not ( = ?auto_848891 ?auto_848893 ) ) ( not ( = ?auto_848891 ?auto_848894 ) ) ( not ( = ?auto_848891 ?auto_848895 ) ) ( not ( = ?auto_848891 ?auto_848896 ) ) ( not ( = ?auto_848891 ?auto_848897 ) ) ( not ( = ?auto_848891 ?auto_848898 ) ) ( not ( = ?auto_848891 ?auto_848899 ) ) ( not ( = ?auto_848891 ?auto_848900 ) ) ( not ( = ?auto_848891 ?auto_848901 ) ) ( not ( = ?auto_848891 ?auto_848902 ) ) ( not ( = ?auto_848891 ?auto_848903 ) ) ( not ( = ?auto_848891 ?auto_848904 ) ) ( not ( = ?auto_848892 ?auto_848893 ) ) ( not ( = ?auto_848892 ?auto_848894 ) ) ( not ( = ?auto_848892 ?auto_848895 ) ) ( not ( = ?auto_848892 ?auto_848896 ) ) ( not ( = ?auto_848892 ?auto_848897 ) ) ( not ( = ?auto_848892 ?auto_848898 ) ) ( not ( = ?auto_848892 ?auto_848899 ) ) ( not ( = ?auto_848892 ?auto_848900 ) ) ( not ( = ?auto_848892 ?auto_848901 ) ) ( not ( = ?auto_848892 ?auto_848902 ) ) ( not ( = ?auto_848892 ?auto_848903 ) ) ( not ( = ?auto_848892 ?auto_848904 ) ) ( not ( = ?auto_848893 ?auto_848894 ) ) ( not ( = ?auto_848893 ?auto_848895 ) ) ( not ( = ?auto_848893 ?auto_848896 ) ) ( not ( = ?auto_848893 ?auto_848897 ) ) ( not ( = ?auto_848893 ?auto_848898 ) ) ( not ( = ?auto_848893 ?auto_848899 ) ) ( not ( = ?auto_848893 ?auto_848900 ) ) ( not ( = ?auto_848893 ?auto_848901 ) ) ( not ( = ?auto_848893 ?auto_848902 ) ) ( not ( = ?auto_848893 ?auto_848903 ) ) ( not ( = ?auto_848893 ?auto_848904 ) ) ( not ( = ?auto_848894 ?auto_848895 ) ) ( not ( = ?auto_848894 ?auto_848896 ) ) ( not ( = ?auto_848894 ?auto_848897 ) ) ( not ( = ?auto_848894 ?auto_848898 ) ) ( not ( = ?auto_848894 ?auto_848899 ) ) ( not ( = ?auto_848894 ?auto_848900 ) ) ( not ( = ?auto_848894 ?auto_848901 ) ) ( not ( = ?auto_848894 ?auto_848902 ) ) ( not ( = ?auto_848894 ?auto_848903 ) ) ( not ( = ?auto_848894 ?auto_848904 ) ) ( not ( = ?auto_848895 ?auto_848896 ) ) ( not ( = ?auto_848895 ?auto_848897 ) ) ( not ( = ?auto_848895 ?auto_848898 ) ) ( not ( = ?auto_848895 ?auto_848899 ) ) ( not ( = ?auto_848895 ?auto_848900 ) ) ( not ( = ?auto_848895 ?auto_848901 ) ) ( not ( = ?auto_848895 ?auto_848902 ) ) ( not ( = ?auto_848895 ?auto_848903 ) ) ( not ( = ?auto_848895 ?auto_848904 ) ) ( not ( = ?auto_848896 ?auto_848897 ) ) ( not ( = ?auto_848896 ?auto_848898 ) ) ( not ( = ?auto_848896 ?auto_848899 ) ) ( not ( = ?auto_848896 ?auto_848900 ) ) ( not ( = ?auto_848896 ?auto_848901 ) ) ( not ( = ?auto_848896 ?auto_848902 ) ) ( not ( = ?auto_848896 ?auto_848903 ) ) ( not ( = ?auto_848896 ?auto_848904 ) ) ( not ( = ?auto_848897 ?auto_848898 ) ) ( not ( = ?auto_848897 ?auto_848899 ) ) ( not ( = ?auto_848897 ?auto_848900 ) ) ( not ( = ?auto_848897 ?auto_848901 ) ) ( not ( = ?auto_848897 ?auto_848902 ) ) ( not ( = ?auto_848897 ?auto_848903 ) ) ( not ( = ?auto_848897 ?auto_848904 ) ) ( not ( = ?auto_848898 ?auto_848899 ) ) ( not ( = ?auto_848898 ?auto_848900 ) ) ( not ( = ?auto_848898 ?auto_848901 ) ) ( not ( = ?auto_848898 ?auto_848902 ) ) ( not ( = ?auto_848898 ?auto_848903 ) ) ( not ( = ?auto_848898 ?auto_848904 ) ) ( not ( = ?auto_848899 ?auto_848900 ) ) ( not ( = ?auto_848899 ?auto_848901 ) ) ( not ( = ?auto_848899 ?auto_848902 ) ) ( not ( = ?auto_848899 ?auto_848903 ) ) ( not ( = ?auto_848899 ?auto_848904 ) ) ( not ( = ?auto_848900 ?auto_848901 ) ) ( not ( = ?auto_848900 ?auto_848902 ) ) ( not ( = ?auto_848900 ?auto_848903 ) ) ( not ( = ?auto_848900 ?auto_848904 ) ) ( not ( = ?auto_848901 ?auto_848902 ) ) ( not ( = ?auto_848901 ?auto_848903 ) ) ( not ( = ?auto_848901 ?auto_848904 ) ) ( not ( = ?auto_848902 ?auto_848903 ) ) ( not ( = ?auto_848902 ?auto_848904 ) ) ( not ( = ?auto_848903 ?auto_848904 ) ) ( ON ?auto_848902 ?auto_848903 ) ( ON ?auto_848901 ?auto_848902 ) ( CLEAR ?auto_848899 ) ( ON ?auto_848900 ?auto_848901 ) ( CLEAR ?auto_848900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_848890 ?auto_848891 ?auto_848892 ?auto_848893 ?auto_848894 ?auto_848895 ?auto_848896 ?auto_848897 ?auto_848898 ?auto_848899 ?auto_848900 )
      ( MAKE-14PILE ?auto_848890 ?auto_848891 ?auto_848892 ?auto_848893 ?auto_848894 ?auto_848895 ?auto_848896 ?auto_848897 ?auto_848898 ?auto_848899 ?auto_848900 ?auto_848901 ?auto_848902 ?auto_848903 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_848948 - BLOCK
      ?auto_848949 - BLOCK
      ?auto_848950 - BLOCK
      ?auto_848951 - BLOCK
      ?auto_848952 - BLOCK
      ?auto_848953 - BLOCK
      ?auto_848954 - BLOCK
      ?auto_848955 - BLOCK
      ?auto_848956 - BLOCK
      ?auto_848957 - BLOCK
      ?auto_848958 - BLOCK
      ?auto_848959 - BLOCK
      ?auto_848960 - BLOCK
      ?auto_848961 - BLOCK
    )
    :vars
    (
      ?auto_848962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_848961 ?auto_848962 ) ( ON-TABLE ?auto_848948 ) ( ON ?auto_848949 ?auto_848948 ) ( ON ?auto_848950 ?auto_848949 ) ( ON ?auto_848951 ?auto_848950 ) ( ON ?auto_848952 ?auto_848951 ) ( ON ?auto_848953 ?auto_848952 ) ( ON ?auto_848954 ?auto_848953 ) ( ON ?auto_848955 ?auto_848954 ) ( ON ?auto_848956 ?auto_848955 ) ( not ( = ?auto_848948 ?auto_848949 ) ) ( not ( = ?auto_848948 ?auto_848950 ) ) ( not ( = ?auto_848948 ?auto_848951 ) ) ( not ( = ?auto_848948 ?auto_848952 ) ) ( not ( = ?auto_848948 ?auto_848953 ) ) ( not ( = ?auto_848948 ?auto_848954 ) ) ( not ( = ?auto_848948 ?auto_848955 ) ) ( not ( = ?auto_848948 ?auto_848956 ) ) ( not ( = ?auto_848948 ?auto_848957 ) ) ( not ( = ?auto_848948 ?auto_848958 ) ) ( not ( = ?auto_848948 ?auto_848959 ) ) ( not ( = ?auto_848948 ?auto_848960 ) ) ( not ( = ?auto_848948 ?auto_848961 ) ) ( not ( = ?auto_848948 ?auto_848962 ) ) ( not ( = ?auto_848949 ?auto_848950 ) ) ( not ( = ?auto_848949 ?auto_848951 ) ) ( not ( = ?auto_848949 ?auto_848952 ) ) ( not ( = ?auto_848949 ?auto_848953 ) ) ( not ( = ?auto_848949 ?auto_848954 ) ) ( not ( = ?auto_848949 ?auto_848955 ) ) ( not ( = ?auto_848949 ?auto_848956 ) ) ( not ( = ?auto_848949 ?auto_848957 ) ) ( not ( = ?auto_848949 ?auto_848958 ) ) ( not ( = ?auto_848949 ?auto_848959 ) ) ( not ( = ?auto_848949 ?auto_848960 ) ) ( not ( = ?auto_848949 ?auto_848961 ) ) ( not ( = ?auto_848949 ?auto_848962 ) ) ( not ( = ?auto_848950 ?auto_848951 ) ) ( not ( = ?auto_848950 ?auto_848952 ) ) ( not ( = ?auto_848950 ?auto_848953 ) ) ( not ( = ?auto_848950 ?auto_848954 ) ) ( not ( = ?auto_848950 ?auto_848955 ) ) ( not ( = ?auto_848950 ?auto_848956 ) ) ( not ( = ?auto_848950 ?auto_848957 ) ) ( not ( = ?auto_848950 ?auto_848958 ) ) ( not ( = ?auto_848950 ?auto_848959 ) ) ( not ( = ?auto_848950 ?auto_848960 ) ) ( not ( = ?auto_848950 ?auto_848961 ) ) ( not ( = ?auto_848950 ?auto_848962 ) ) ( not ( = ?auto_848951 ?auto_848952 ) ) ( not ( = ?auto_848951 ?auto_848953 ) ) ( not ( = ?auto_848951 ?auto_848954 ) ) ( not ( = ?auto_848951 ?auto_848955 ) ) ( not ( = ?auto_848951 ?auto_848956 ) ) ( not ( = ?auto_848951 ?auto_848957 ) ) ( not ( = ?auto_848951 ?auto_848958 ) ) ( not ( = ?auto_848951 ?auto_848959 ) ) ( not ( = ?auto_848951 ?auto_848960 ) ) ( not ( = ?auto_848951 ?auto_848961 ) ) ( not ( = ?auto_848951 ?auto_848962 ) ) ( not ( = ?auto_848952 ?auto_848953 ) ) ( not ( = ?auto_848952 ?auto_848954 ) ) ( not ( = ?auto_848952 ?auto_848955 ) ) ( not ( = ?auto_848952 ?auto_848956 ) ) ( not ( = ?auto_848952 ?auto_848957 ) ) ( not ( = ?auto_848952 ?auto_848958 ) ) ( not ( = ?auto_848952 ?auto_848959 ) ) ( not ( = ?auto_848952 ?auto_848960 ) ) ( not ( = ?auto_848952 ?auto_848961 ) ) ( not ( = ?auto_848952 ?auto_848962 ) ) ( not ( = ?auto_848953 ?auto_848954 ) ) ( not ( = ?auto_848953 ?auto_848955 ) ) ( not ( = ?auto_848953 ?auto_848956 ) ) ( not ( = ?auto_848953 ?auto_848957 ) ) ( not ( = ?auto_848953 ?auto_848958 ) ) ( not ( = ?auto_848953 ?auto_848959 ) ) ( not ( = ?auto_848953 ?auto_848960 ) ) ( not ( = ?auto_848953 ?auto_848961 ) ) ( not ( = ?auto_848953 ?auto_848962 ) ) ( not ( = ?auto_848954 ?auto_848955 ) ) ( not ( = ?auto_848954 ?auto_848956 ) ) ( not ( = ?auto_848954 ?auto_848957 ) ) ( not ( = ?auto_848954 ?auto_848958 ) ) ( not ( = ?auto_848954 ?auto_848959 ) ) ( not ( = ?auto_848954 ?auto_848960 ) ) ( not ( = ?auto_848954 ?auto_848961 ) ) ( not ( = ?auto_848954 ?auto_848962 ) ) ( not ( = ?auto_848955 ?auto_848956 ) ) ( not ( = ?auto_848955 ?auto_848957 ) ) ( not ( = ?auto_848955 ?auto_848958 ) ) ( not ( = ?auto_848955 ?auto_848959 ) ) ( not ( = ?auto_848955 ?auto_848960 ) ) ( not ( = ?auto_848955 ?auto_848961 ) ) ( not ( = ?auto_848955 ?auto_848962 ) ) ( not ( = ?auto_848956 ?auto_848957 ) ) ( not ( = ?auto_848956 ?auto_848958 ) ) ( not ( = ?auto_848956 ?auto_848959 ) ) ( not ( = ?auto_848956 ?auto_848960 ) ) ( not ( = ?auto_848956 ?auto_848961 ) ) ( not ( = ?auto_848956 ?auto_848962 ) ) ( not ( = ?auto_848957 ?auto_848958 ) ) ( not ( = ?auto_848957 ?auto_848959 ) ) ( not ( = ?auto_848957 ?auto_848960 ) ) ( not ( = ?auto_848957 ?auto_848961 ) ) ( not ( = ?auto_848957 ?auto_848962 ) ) ( not ( = ?auto_848958 ?auto_848959 ) ) ( not ( = ?auto_848958 ?auto_848960 ) ) ( not ( = ?auto_848958 ?auto_848961 ) ) ( not ( = ?auto_848958 ?auto_848962 ) ) ( not ( = ?auto_848959 ?auto_848960 ) ) ( not ( = ?auto_848959 ?auto_848961 ) ) ( not ( = ?auto_848959 ?auto_848962 ) ) ( not ( = ?auto_848960 ?auto_848961 ) ) ( not ( = ?auto_848960 ?auto_848962 ) ) ( not ( = ?auto_848961 ?auto_848962 ) ) ( ON ?auto_848960 ?auto_848961 ) ( ON ?auto_848959 ?auto_848960 ) ( ON ?auto_848958 ?auto_848959 ) ( CLEAR ?auto_848956 ) ( ON ?auto_848957 ?auto_848958 ) ( CLEAR ?auto_848957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_848948 ?auto_848949 ?auto_848950 ?auto_848951 ?auto_848952 ?auto_848953 ?auto_848954 ?auto_848955 ?auto_848956 ?auto_848957 )
      ( MAKE-14PILE ?auto_848948 ?auto_848949 ?auto_848950 ?auto_848951 ?auto_848952 ?auto_848953 ?auto_848954 ?auto_848955 ?auto_848956 ?auto_848957 ?auto_848958 ?auto_848959 ?auto_848960 ?auto_848961 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_849006 - BLOCK
      ?auto_849007 - BLOCK
      ?auto_849008 - BLOCK
      ?auto_849009 - BLOCK
      ?auto_849010 - BLOCK
      ?auto_849011 - BLOCK
      ?auto_849012 - BLOCK
      ?auto_849013 - BLOCK
      ?auto_849014 - BLOCK
      ?auto_849015 - BLOCK
      ?auto_849016 - BLOCK
      ?auto_849017 - BLOCK
      ?auto_849018 - BLOCK
      ?auto_849019 - BLOCK
    )
    :vars
    (
      ?auto_849020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_849019 ?auto_849020 ) ( ON-TABLE ?auto_849006 ) ( ON ?auto_849007 ?auto_849006 ) ( ON ?auto_849008 ?auto_849007 ) ( ON ?auto_849009 ?auto_849008 ) ( ON ?auto_849010 ?auto_849009 ) ( ON ?auto_849011 ?auto_849010 ) ( ON ?auto_849012 ?auto_849011 ) ( ON ?auto_849013 ?auto_849012 ) ( not ( = ?auto_849006 ?auto_849007 ) ) ( not ( = ?auto_849006 ?auto_849008 ) ) ( not ( = ?auto_849006 ?auto_849009 ) ) ( not ( = ?auto_849006 ?auto_849010 ) ) ( not ( = ?auto_849006 ?auto_849011 ) ) ( not ( = ?auto_849006 ?auto_849012 ) ) ( not ( = ?auto_849006 ?auto_849013 ) ) ( not ( = ?auto_849006 ?auto_849014 ) ) ( not ( = ?auto_849006 ?auto_849015 ) ) ( not ( = ?auto_849006 ?auto_849016 ) ) ( not ( = ?auto_849006 ?auto_849017 ) ) ( not ( = ?auto_849006 ?auto_849018 ) ) ( not ( = ?auto_849006 ?auto_849019 ) ) ( not ( = ?auto_849006 ?auto_849020 ) ) ( not ( = ?auto_849007 ?auto_849008 ) ) ( not ( = ?auto_849007 ?auto_849009 ) ) ( not ( = ?auto_849007 ?auto_849010 ) ) ( not ( = ?auto_849007 ?auto_849011 ) ) ( not ( = ?auto_849007 ?auto_849012 ) ) ( not ( = ?auto_849007 ?auto_849013 ) ) ( not ( = ?auto_849007 ?auto_849014 ) ) ( not ( = ?auto_849007 ?auto_849015 ) ) ( not ( = ?auto_849007 ?auto_849016 ) ) ( not ( = ?auto_849007 ?auto_849017 ) ) ( not ( = ?auto_849007 ?auto_849018 ) ) ( not ( = ?auto_849007 ?auto_849019 ) ) ( not ( = ?auto_849007 ?auto_849020 ) ) ( not ( = ?auto_849008 ?auto_849009 ) ) ( not ( = ?auto_849008 ?auto_849010 ) ) ( not ( = ?auto_849008 ?auto_849011 ) ) ( not ( = ?auto_849008 ?auto_849012 ) ) ( not ( = ?auto_849008 ?auto_849013 ) ) ( not ( = ?auto_849008 ?auto_849014 ) ) ( not ( = ?auto_849008 ?auto_849015 ) ) ( not ( = ?auto_849008 ?auto_849016 ) ) ( not ( = ?auto_849008 ?auto_849017 ) ) ( not ( = ?auto_849008 ?auto_849018 ) ) ( not ( = ?auto_849008 ?auto_849019 ) ) ( not ( = ?auto_849008 ?auto_849020 ) ) ( not ( = ?auto_849009 ?auto_849010 ) ) ( not ( = ?auto_849009 ?auto_849011 ) ) ( not ( = ?auto_849009 ?auto_849012 ) ) ( not ( = ?auto_849009 ?auto_849013 ) ) ( not ( = ?auto_849009 ?auto_849014 ) ) ( not ( = ?auto_849009 ?auto_849015 ) ) ( not ( = ?auto_849009 ?auto_849016 ) ) ( not ( = ?auto_849009 ?auto_849017 ) ) ( not ( = ?auto_849009 ?auto_849018 ) ) ( not ( = ?auto_849009 ?auto_849019 ) ) ( not ( = ?auto_849009 ?auto_849020 ) ) ( not ( = ?auto_849010 ?auto_849011 ) ) ( not ( = ?auto_849010 ?auto_849012 ) ) ( not ( = ?auto_849010 ?auto_849013 ) ) ( not ( = ?auto_849010 ?auto_849014 ) ) ( not ( = ?auto_849010 ?auto_849015 ) ) ( not ( = ?auto_849010 ?auto_849016 ) ) ( not ( = ?auto_849010 ?auto_849017 ) ) ( not ( = ?auto_849010 ?auto_849018 ) ) ( not ( = ?auto_849010 ?auto_849019 ) ) ( not ( = ?auto_849010 ?auto_849020 ) ) ( not ( = ?auto_849011 ?auto_849012 ) ) ( not ( = ?auto_849011 ?auto_849013 ) ) ( not ( = ?auto_849011 ?auto_849014 ) ) ( not ( = ?auto_849011 ?auto_849015 ) ) ( not ( = ?auto_849011 ?auto_849016 ) ) ( not ( = ?auto_849011 ?auto_849017 ) ) ( not ( = ?auto_849011 ?auto_849018 ) ) ( not ( = ?auto_849011 ?auto_849019 ) ) ( not ( = ?auto_849011 ?auto_849020 ) ) ( not ( = ?auto_849012 ?auto_849013 ) ) ( not ( = ?auto_849012 ?auto_849014 ) ) ( not ( = ?auto_849012 ?auto_849015 ) ) ( not ( = ?auto_849012 ?auto_849016 ) ) ( not ( = ?auto_849012 ?auto_849017 ) ) ( not ( = ?auto_849012 ?auto_849018 ) ) ( not ( = ?auto_849012 ?auto_849019 ) ) ( not ( = ?auto_849012 ?auto_849020 ) ) ( not ( = ?auto_849013 ?auto_849014 ) ) ( not ( = ?auto_849013 ?auto_849015 ) ) ( not ( = ?auto_849013 ?auto_849016 ) ) ( not ( = ?auto_849013 ?auto_849017 ) ) ( not ( = ?auto_849013 ?auto_849018 ) ) ( not ( = ?auto_849013 ?auto_849019 ) ) ( not ( = ?auto_849013 ?auto_849020 ) ) ( not ( = ?auto_849014 ?auto_849015 ) ) ( not ( = ?auto_849014 ?auto_849016 ) ) ( not ( = ?auto_849014 ?auto_849017 ) ) ( not ( = ?auto_849014 ?auto_849018 ) ) ( not ( = ?auto_849014 ?auto_849019 ) ) ( not ( = ?auto_849014 ?auto_849020 ) ) ( not ( = ?auto_849015 ?auto_849016 ) ) ( not ( = ?auto_849015 ?auto_849017 ) ) ( not ( = ?auto_849015 ?auto_849018 ) ) ( not ( = ?auto_849015 ?auto_849019 ) ) ( not ( = ?auto_849015 ?auto_849020 ) ) ( not ( = ?auto_849016 ?auto_849017 ) ) ( not ( = ?auto_849016 ?auto_849018 ) ) ( not ( = ?auto_849016 ?auto_849019 ) ) ( not ( = ?auto_849016 ?auto_849020 ) ) ( not ( = ?auto_849017 ?auto_849018 ) ) ( not ( = ?auto_849017 ?auto_849019 ) ) ( not ( = ?auto_849017 ?auto_849020 ) ) ( not ( = ?auto_849018 ?auto_849019 ) ) ( not ( = ?auto_849018 ?auto_849020 ) ) ( not ( = ?auto_849019 ?auto_849020 ) ) ( ON ?auto_849018 ?auto_849019 ) ( ON ?auto_849017 ?auto_849018 ) ( ON ?auto_849016 ?auto_849017 ) ( ON ?auto_849015 ?auto_849016 ) ( CLEAR ?auto_849013 ) ( ON ?auto_849014 ?auto_849015 ) ( CLEAR ?auto_849014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_849006 ?auto_849007 ?auto_849008 ?auto_849009 ?auto_849010 ?auto_849011 ?auto_849012 ?auto_849013 ?auto_849014 )
      ( MAKE-14PILE ?auto_849006 ?auto_849007 ?auto_849008 ?auto_849009 ?auto_849010 ?auto_849011 ?auto_849012 ?auto_849013 ?auto_849014 ?auto_849015 ?auto_849016 ?auto_849017 ?auto_849018 ?auto_849019 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_849064 - BLOCK
      ?auto_849065 - BLOCK
      ?auto_849066 - BLOCK
      ?auto_849067 - BLOCK
      ?auto_849068 - BLOCK
      ?auto_849069 - BLOCK
      ?auto_849070 - BLOCK
      ?auto_849071 - BLOCK
      ?auto_849072 - BLOCK
      ?auto_849073 - BLOCK
      ?auto_849074 - BLOCK
      ?auto_849075 - BLOCK
      ?auto_849076 - BLOCK
      ?auto_849077 - BLOCK
    )
    :vars
    (
      ?auto_849078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_849077 ?auto_849078 ) ( ON-TABLE ?auto_849064 ) ( ON ?auto_849065 ?auto_849064 ) ( ON ?auto_849066 ?auto_849065 ) ( ON ?auto_849067 ?auto_849066 ) ( ON ?auto_849068 ?auto_849067 ) ( ON ?auto_849069 ?auto_849068 ) ( ON ?auto_849070 ?auto_849069 ) ( not ( = ?auto_849064 ?auto_849065 ) ) ( not ( = ?auto_849064 ?auto_849066 ) ) ( not ( = ?auto_849064 ?auto_849067 ) ) ( not ( = ?auto_849064 ?auto_849068 ) ) ( not ( = ?auto_849064 ?auto_849069 ) ) ( not ( = ?auto_849064 ?auto_849070 ) ) ( not ( = ?auto_849064 ?auto_849071 ) ) ( not ( = ?auto_849064 ?auto_849072 ) ) ( not ( = ?auto_849064 ?auto_849073 ) ) ( not ( = ?auto_849064 ?auto_849074 ) ) ( not ( = ?auto_849064 ?auto_849075 ) ) ( not ( = ?auto_849064 ?auto_849076 ) ) ( not ( = ?auto_849064 ?auto_849077 ) ) ( not ( = ?auto_849064 ?auto_849078 ) ) ( not ( = ?auto_849065 ?auto_849066 ) ) ( not ( = ?auto_849065 ?auto_849067 ) ) ( not ( = ?auto_849065 ?auto_849068 ) ) ( not ( = ?auto_849065 ?auto_849069 ) ) ( not ( = ?auto_849065 ?auto_849070 ) ) ( not ( = ?auto_849065 ?auto_849071 ) ) ( not ( = ?auto_849065 ?auto_849072 ) ) ( not ( = ?auto_849065 ?auto_849073 ) ) ( not ( = ?auto_849065 ?auto_849074 ) ) ( not ( = ?auto_849065 ?auto_849075 ) ) ( not ( = ?auto_849065 ?auto_849076 ) ) ( not ( = ?auto_849065 ?auto_849077 ) ) ( not ( = ?auto_849065 ?auto_849078 ) ) ( not ( = ?auto_849066 ?auto_849067 ) ) ( not ( = ?auto_849066 ?auto_849068 ) ) ( not ( = ?auto_849066 ?auto_849069 ) ) ( not ( = ?auto_849066 ?auto_849070 ) ) ( not ( = ?auto_849066 ?auto_849071 ) ) ( not ( = ?auto_849066 ?auto_849072 ) ) ( not ( = ?auto_849066 ?auto_849073 ) ) ( not ( = ?auto_849066 ?auto_849074 ) ) ( not ( = ?auto_849066 ?auto_849075 ) ) ( not ( = ?auto_849066 ?auto_849076 ) ) ( not ( = ?auto_849066 ?auto_849077 ) ) ( not ( = ?auto_849066 ?auto_849078 ) ) ( not ( = ?auto_849067 ?auto_849068 ) ) ( not ( = ?auto_849067 ?auto_849069 ) ) ( not ( = ?auto_849067 ?auto_849070 ) ) ( not ( = ?auto_849067 ?auto_849071 ) ) ( not ( = ?auto_849067 ?auto_849072 ) ) ( not ( = ?auto_849067 ?auto_849073 ) ) ( not ( = ?auto_849067 ?auto_849074 ) ) ( not ( = ?auto_849067 ?auto_849075 ) ) ( not ( = ?auto_849067 ?auto_849076 ) ) ( not ( = ?auto_849067 ?auto_849077 ) ) ( not ( = ?auto_849067 ?auto_849078 ) ) ( not ( = ?auto_849068 ?auto_849069 ) ) ( not ( = ?auto_849068 ?auto_849070 ) ) ( not ( = ?auto_849068 ?auto_849071 ) ) ( not ( = ?auto_849068 ?auto_849072 ) ) ( not ( = ?auto_849068 ?auto_849073 ) ) ( not ( = ?auto_849068 ?auto_849074 ) ) ( not ( = ?auto_849068 ?auto_849075 ) ) ( not ( = ?auto_849068 ?auto_849076 ) ) ( not ( = ?auto_849068 ?auto_849077 ) ) ( not ( = ?auto_849068 ?auto_849078 ) ) ( not ( = ?auto_849069 ?auto_849070 ) ) ( not ( = ?auto_849069 ?auto_849071 ) ) ( not ( = ?auto_849069 ?auto_849072 ) ) ( not ( = ?auto_849069 ?auto_849073 ) ) ( not ( = ?auto_849069 ?auto_849074 ) ) ( not ( = ?auto_849069 ?auto_849075 ) ) ( not ( = ?auto_849069 ?auto_849076 ) ) ( not ( = ?auto_849069 ?auto_849077 ) ) ( not ( = ?auto_849069 ?auto_849078 ) ) ( not ( = ?auto_849070 ?auto_849071 ) ) ( not ( = ?auto_849070 ?auto_849072 ) ) ( not ( = ?auto_849070 ?auto_849073 ) ) ( not ( = ?auto_849070 ?auto_849074 ) ) ( not ( = ?auto_849070 ?auto_849075 ) ) ( not ( = ?auto_849070 ?auto_849076 ) ) ( not ( = ?auto_849070 ?auto_849077 ) ) ( not ( = ?auto_849070 ?auto_849078 ) ) ( not ( = ?auto_849071 ?auto_849072 ) ) ( not ( = ?auto_849071 ?auto_849073 ) ) ( not ( = ?auto_849071 ?auto_849074 ) ) ( not ( = ?auto_849071 ?auto_849075 ) ) ( not ( = ?auto_849071 ?auto_849076 ) ) ( not ( = ?auto_849071 ?auto_849077 ) ) ( not ( = ?auto_849071 ?auto_849078 ) ) ( not ( = ?auto_849072 ?auto_849073 ) ) ( not ( = ?auto_849072 ?auto_849074 ) ) ( not ( = ?auto_849072 ?auto_849075 ) ) ( not ( = ?auto_849072 ?auto_849076 ) ) ( not ( = ?auto_849072 ?auto_849077 ) ) ( not ( = ?auto_849072 ?auto_849078 ) ) ( not ( = ?auto_849073 ?auto_849074 ) ) ( not ( = ?auto_849073 ?auto_849075 ) ) ( not ( = ?auto_849073 ?auto_849076 ) ) ( not ( = ?auto_849073 ?auto_849077 ) ) ( not ( = ?auto_849073 ?auto_849078 ) ) ( not ( = ?auto_849074 ?auto_849075 ) ) ( not ( = ?auto_849074 ?auto_849076 ) ) ( not ( = ?auto_849074 ?auto_849077 ) ) ( not ( = ?auto_849074 ?auto_849078 ) ) ( not ( = ?auto_849075 ?auto_849076 ) ) ( not ( = ?auto_849075 ?auto_849077 ) ) ( not ( = ?auto_849075 ?auto_849078 ) ) ( not ( = ?auto_849076 ?auto_849077 ) ) ( not ( = ?auto_849076 ?auto_849078 ) ) ( not ( = ?auto_849077 ?auto_849078 ) ) ( ON ?auto_849076 ?auto_849077 ) ( ON ?auto_849075 ?auto_849076 ) ( ON ?auto_849074 ?auto_849075 ) ( ON ?auto_849073 ?auto_849074 ) ( ON ?auto_849072 ?auto_849073 ) ( CLEAR ?auto_849070 ) ( ON ?auto_849071 ?auto_849072 ) ( CLEAR ?auto_849071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_849064 ?auto_849065 ?auto_849066 ?auto_849067 ?auto_849068 ?auto_849069 ?auto_849070 ?auto_849071 )
      ( MAKE-14PILE ?auto_849064 ?auto_849065 ?auto_849066 ?auto_849067 ?auto_849068 ?auto_849069 ?auto_849070 ?auto_849071 ?auto_849072 ?auto_849073 ?auto_849074 ?auto_849075 ?auto_849076 ?auto_849077 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_849122 - BLOCK
      ?auto_849123 - BLOCK
      ?auto_849124 - BLOCK
      ?auto_849125 - BLOCK
      ?auto_849126 - BLOCK
      ?auto_849127 - BLOCK
      ?auto_849128 - BLOCK
      ?auto_849129 - BLOCK
      ?auto_849130 - BLOCK
      ?auto_849131 - BLOCK
      ?auto_849132 - BLOCK
      ?auto_849133 - BLOCK
      ?auto_849134 - BLOCK
      ?auto_849135 - BLOCK
    )
    :vars
    (
      ?auto_849136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_849135 ?auto_849136 ) ( ON-TABLE ?auto_849122 ) ( ON ?auto_849123 ?auto_849122 ) ( ON ?auto_849124 ?auto_849123 ) ( ON ?auto_849125 ?auto_849124 ) ( ON ?auto_849126 ?auto_849125 ) ( ON ?auto_849127 ?auto_849126 ) ( not ( = ?auto_849122 ?auto_849123 ) ) ( not ( = ?auto_849122 ?auto_849124 ) ) ( not ( = ?auto_849122 ?auto_849125 ) ) ( not ( = ?auto_849122 ?auto_849126 ) ) ( not ( = ?auto_849122 ?auto_849127 ) ) ( not ( = ?auto_849122 ?auto_849128 ) ) ( not ( = ?auto_849122 ?auto_849129 ) ) ( not ( = ?auto_849122 ?auto_849130 ) ) ( not ( = ?auto_849122 ?auto_849131 ) ) ( not ( = ?auto_849122 ?auto_849132 ) ) ( not ( = ?auto_849122 ?auto_849133 ) ) ( not ( = ?auto_849122 ?auto_849134 ) ) ( not ( = ?auto_849122 ?auto_849135 ) ) ( not ( = ?auto_849122 ?auto_849136 ) ) ( not ( = ?auto_849123 ?auto_849124 ) ) ( not ( = ?auto_849123 ?auto_849125 ) ) ( not ( = ?auto_849123 ?auto_849126 ) ) ( not ( = ?auto_849123 ?auto_849127 ) ) ( not ( = ?auto_849123 ?auto_849128 ) ) ( not ( = ?auto_849123 ?auto_849129 ) ) ( not ( = ?auto_849123 ?auto_849130 ) ) ( not ( = ?auto_849123 ?auto_849131 ) ) ( not ( = ?auto_849123 ?auto_849132 ) ) ( not ( = ?auto_849123 ?auto_849133 ) ) ( not ( = ?auto_849123 ?auto_849134 ) ) ( not ( = ?auto_849123 ?auto_849135 ) ) ( not ( = ?auto_849123 ?auto_849136 ) ) ( not ( = ?auto_849124 ?auto_849125 ) ) ( not ( = ?auto_849124 ?auto_849126 ) ) ( not ( = ?auto_849124 ?auto_849127 ) ) ( not ( = ?auto_849124 ?auto_849128 ) ) ( not ( = ?auto_849124 ?auto_849129 ) ) ( not ( = ?auto_849124 ?auto_849130 ) ) ( not ( = ?auto_849124 ?auto_849131 ) ) ( not ( = ?auto_849124 ?auto_849132 ) ) ( not ( = ?auto_849124 ?auto_849133 ) ) ( not ( = ?auto_849124 ?auto_849134 ) ) ( not ( = ?auto_849124 ?auto_849135 ) ) ( not ( = ?auto_849124 ?auto_849136 ) ) ( not ( = ?auto_849125 ?auto_849126 ) ) ( not ( = ?auto_849125 ?auto_849127 ) ) ( not ( = ?auto_849125 ?auto_849128 ) ) ( not ( = ?auto_849125 ?auto_849129 ) ) ( not ( = ?auto_849125 ?auto_849130 ) ) ( not ( = ?auto_849125 ?auto_849131 ) ) ( not ( = ?auto_849125 ?auto_849132 ) ) ( not ( = ?auto_849125 ?auto_849133 ) ) ( not ( = ?auto_849125 ?auto_849134 ) ) ( not ( = ?auto_849125 ?auto_849135 ) ) ( not ( = ?auto_849125 ?auto_849136 ) ) ( not ( = ?auto_849126 ?auto_849127 ) ) ( not ( = ?auto_849126 ?auto_849128 ) ) ( not ( = ?auto_849126 ?auto_849129 ) ) ( not ( = ?auto_849126 ?auto_849130 ) ) ( not ( = ?auto_849126 ?auto_849131 ) ) ( not ( = ?auto_849126 ?auto_849132 ) ) ( not ( = ?auto_849126 ?auto_849133 ) ) ( not ( = ?auto_849126 ?auto_849134 ) ) ( not ( = ?auto_849126 ?auto_849135 ) ) ( not ( = ?auto_849126 ?auto_849136 ) ) ( not ( = ?auto_849127 ?auto_849128 ) ) ( not ( = ?auto_849127 ?auto_849129 ) ) ( not ( = ?auto_849127 ?auto_849130 ) ) ( not ( = ?auto_849127 ?auto_849131 ) ) ( not ( = ?auto_849127 ?auto_849132 ) ) ( not ( = ?auto_849127 ?auto_849133 ) ) ( not ( = ?auto_849127 ?auto_849134 ) ) ( not ( = ?auto_849127 ?auto_849135 ) ) ( not ( = ?auto_849127 ?auto_849136 ) ) ( not ( = ?auto_849128 ?auto_849129 ) ) ( not ( = ?auto_849128 ?auto_849130 ) ) ( not ( = ?auto_849128 ?auto_849131 ) ) ( not ( = ?auto_849128 ?auto_849132 ) ) ( not ( = ?auto_849128 ?auto_849133 ) ) ( not ( = ?auto_849128 ?auto_849134 ) ) ( not ( = ?auto_849128 ?auto_849135 ) ) ( not ( = ?auto_849128 ?auto_849136 ) ) ( not ( = ?auto_849129 ?auto_849130 ) ) ( not ( = ?auto_849129 ?auto_849131 ) ) ( not ( = ?auto_849129 ?auto_849132 ) ) ( not ( = ?auto_849129 ?auto_849133 ) ) ( not ( = ?auto_849129 ?auto_849134 ) ) ( not ( = ?auto_849129 ?auto_849135 ) ) ( not ( = ?auto_849129 ?auto_849136 ) ) ( not ( = ?auto_849130 ?auto_849131 ) ) ( not ( = ?auto_849130 ?auto_849132 ) ) ( not ( = ?auto_849130 ?auto_849133 ) ) ( not ( = ?auto_849130 ?auto_849134 ) ) ( not ( = ?auto_849130 ?auto_849135 ) ) ( not ( = ?auto_849130 ?auto_849136 ) ) ( not ( = ?auto_849131 ?auto_849132 ) ) ( not ( = ?auto_849131 ?auto_849133 ) ) ( not ( = ?auto_849131 ?auto_849134 ) ) ( not ( = ?auto_849131 ?auto_849135 ) ) ( not ( = ?auto_849131 ?auto_849136 ) ) ( not ( = ?auto_849132 ?auto_849133 ) ) ( not ( = ?auto_849132 ?auto_849134 ) ) ( not ( = ?auto_849132 ?auto_849135 ) ) ( not ( = ?auto_849132 ?auto_849136 ) ) ( not ( = ?auto_849133 ?auto_849134 ) ) ( not ( = ?auto_849133 ?auto_849135 ) ) ( not ( = ?auto_849133 ?auto_849136 ) ) ( not ( = ?auto_849134 ?auto_849135 ) ) ( not ( = ?auto_849134 ?auto_849136 ) ) ( not ( = ?auto_849135 ?auto_849136 ) ) ( ON ?auto_849134 ?auto_849135 ) ( ON ?auto_849133 ?auto_849134 ) ( ON ?auto_849132 ?auto_849133 ) ( ON ?auto_849131 ?auto_849132 ) ( ON ?auto_849130 ?auto_849131 ) ( ON ?auto_849129 ?auto_849130 ) ( CLEAR ?auto_849127 ) ( ON ?auto_849128 ?auto_849129 ) ( CLEAR ?auto_849128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_849122 ?auto_849123 ?auto_849124 ?auto_849125 ?auto_849126 ?auto_849127 ?auto_849128 )
      ( MAKE-14PILE ?auto_849122 ?auto_849123 ?auto_849124 ?auto_849125 ?auto_849126 ?auto_849127 ?auto_849128 ?auto_849129 ?auto_849130 ?auto_849131 ?auto_849132 ?auto_849133 ?auto_849134 ?auto_849135 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_849180 - BLOCK
      ?auto_849181 - BLOCK
      ?auto_849182 - BLOCK
      ?auto_849183 - BLOCK
      ?auto_849184 - BLOCK
      ?auto_849185 - BLOCK
      ?auto_849186 - BLOCK
      ?auto_849187 - BLOCK
      ?auto_849188 - BLOCK
      ?auto_849189 - BLOCK
      ?auto_849190 - BLOCK
      ?auto_849191 - BLOCK
      ?auto_849192 - BLOCK
      ?auto_849193 - BLOCK
    )
    :vars
    (
      ?auto_849194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_849193 ?auto_849194 ) ( ON-TABLE ?auto_849180 ) ( ON ?auto_849181 ?auto_849180 ) ( ON ?auto_849182 ?auto_849181 ) ( ON ?auto_849183 ?auto_849182 ) ( ON ?auto_849184 ?auto_849183 ) ( not ( = ?auto_849180 ?auto_849181 ) ) ( not ( = ?auto_849180 ?auto_849182 ) ) ( not ( = ?auto_849180 ?auto_849183 ) ) ( not ( = ?auto_849180 ?auto_849184 ) ) ( not ( = ?auto_849180 ?auto_849185 ) ) ( not ( = ?auto_849180 ?auto_849186 ) ) ( not ( = ?auto_849180 ?auto_849187 ) ) ( not ( = ?auto_849180 ?auto_849188 ) ) ( not ( = ?auto_849180 ?auto_849189 ) ) ( not ( = ?auto_849180 ?auto_849190 ) ) ( not ( = ?auto_849180 ?auto_849191 ) ) ( not ( = ?auto_849180 ?auto_849192 ) ) ( not ( = ?auto_849180 ?auto_849193 ) ) ( not ( = ?auto_849180 ?auto_849194 ) ) ( not ( = ?auto_849181 ?auto_849182 ) ) ( not ( = ?auto_849181 ?auto_849183 ) ) ( not ( = ?auto_849181 ?auto_849184 ) ) ( not ( = ?auto_849181 ?auto_849185 ) ) ( not ( = ?auto_849181 ?auto_849186 ) ) ( not ( = ?auto_849181 ?auto_849187 ) ) ( not ( = ?auto_849181 ?auto_849188 ) ) ( not ( = ?auto_849181 ?auto_849189 ) ) ( not ( = ?auto_849181 ?auto_849190 ) ) ( not ( = ?auto_849181 ?auto_849191 ) ) ( not ( = ?auto_849181 ?auto_849192 ) ) ( not ( = ?auto_849181 ?auto_849193 ) ) ( not ( = ?auto_849181 ?auto_849194 ) ) ( not ( = ?auto_849182 ?auto_849183 ) ) ( not ( = ?auto_849182 ?auto_849184 ) ) ( not ( = ?auto_849182 ?auto_849185 ) ) ( not ( = ?auto_849182 ?auto_849186 ) ) ( not ( = ?auto_849182 ?auto_849187 ) ) ( not ( = ?auto_849182 ?auto_849188 ) ) ( not ( = ?auto_849182 ?auto_849189 ) ) ( not ( = ?auto_849182 ?auto_849190 ) ) ( not ( = ?auto_849182 ?auto_849191 ) ) ( not ( = ?auto_849182 ?auto_849192 ) ) ( not ( = ?auto_849182 ?auto_849193 ) ) ( not ( = ?auto_849182 ?auto_849194 ) ) ( not ( = ?auto_849183 ?auto_849184 ) ) ( not ( = ?auto_849183 ?auto_849185 ) ) ( not ( = ?auto_849183 ?auto_849186 ) ) ( not ( = ?auto_849183 ?auto_849187 ) ) ( not ( = ?auto_849183 ?auto_849188 ) ) ( not ( = ?auto_849183 ?auto_849189 ) ) ( not ( = ?auto_849183 ?auto_849190 ) ) ( not ( = ?auto_849183 ?auto_849191 ) ) ( not ( = ?auto_849183 ?auto_849192 ) ) ( not ( = ?auto_849183 ?auto_849193 ) ) ( not ( = ?auto_849183 ?auto_849194 ) ) ( not ( = ?auto_849184 ?auto_849185 ) ) ( not ( = ?auto_849184 ?auto_849186 ) ) ( not ( = ?auto_849184 ?auto_849187 ) ) ( not ( = ?auto_849184 ?auto_849188 ) ) ( not ( = ?auto_849184 ?auto_849189 ) ) ( not ( = ?auto_849184 ?auto_849190 ) ) ( not ( = ?auto_849184 ?auto_849191 ) ) ( not ( = ?auto_849184 ?auto_849192 ) ) ( not ( = ?auto_849184 ?auto_849193 ) ) ( not ( = ?auto_849184 ?auto_849194 ) ) ( not ( = ?auto_849185 ?auto_849186 ) ) ( not ( = ?auto_849185 ?auto_849187 ) ) ( not ( = ?auto_849185 ?auto_849188 ) ) ( not ( = ?auto_849185 ?auto_849189 ) ) ( not ( = ?auto_849185 ?auto_849190 ) ) ( not ( = ?auto_849185 ?auto_849191 ) ) ( not ( = ?auto_849185 ?auto_849192 ) ) ( not ( = ?auto_849185 ?auto_849193 ) ) ( not ( = ?auto_849185 ?auto_849194 ) ) ( not ( = ?auto_849186 ?auto_849187 ) ) ( not ( = ?auto_849186 ?auto_849188 ) ) ( not ( = ?auto_849186 ?auto_849189 ) ) ( not ( = ?auto_849186 ?auto_849190 ) ) ( not ( = ?auto_849186 ?auto_849191 ) ) ( not ( = ?auto_849186 ?auto_849192 ) ) ( not ( = ?auto_849186 ?auto_849193 ) ) ( not ( = ?auto_849186 ?auto_849194 ) ) ( not ( = ?auto_849187 ?auto_849188 ) ) ( not ( = ?auto_849187 ?auto_849189 ) ) ( not ( = ?auto_849187 ?auto_849190 ) ) ( not ( = ?auto_849187 ?auto_849191 ) ) ( not ( = ?auto_849187 ?auto_849192 ) ) ( not ( = ?auto_849187 ?auto_849193 ) ) ( not ( = ?auto_849187 ?auto_849194 ) ) ( not ( = ?auto_849188 ?auto_849189 ) ) ( not ( = ?auto_849188 ?auto_849190 ) ) ( not ( = ?auto_849188 ?auto_849191 ) ) ( not ( = ?auto_849188 ?auto_849192 ) ) ( not ( = ?auto_849188 ?auto_849193 ) ) ( not ( = ?auto_849188 ?auto_849194 ) ) ( not ( = ?auto_849189 ?auto_849190 ) ) ( not ( = ?auto_849189 ?auto_849191 ) ) ( not ( = ?auto_849189 ?auto_849192 ) ) ( not ( = ?auto_849189 ?auto_849193 ) ) ( not ( = ?auto_849189 ?auto_849194 ) ) ( not ( = ?auto_849190 ?auto_849191 ) ) ( not ( = ?auto_849190 ?auto_849192 ) ) ( not ( = ?auto_849190 ?auto_849193 ) ) ( not ( = ?auto_849190 ?auto_849194 ) ) ( not ( = ?auto_849191 ?auto_849192 ) ) ( not ( = ?auto_849191 ?auto_849193 ) ) ( not ( = ?auto_849191 ?auto_849194 ) ) ( not ( = ?auto_849192 ?auto_849193 ) ) ( not ( = ?auto_849192 ?auto_849194 ) ) ( not ( = ?auto_849193 ?auto_849194 ) ) ( ON ?auto_849192 ?auto_849193 ) ( ON ?auto_849191 ?auto_849192 ) ( ON ?auto_849190 ?auto_849191 ) ( ON ?auto_849189 ?auto_849190 ) ( ON ?auto_849188 ?auto_849189 ) ( ON ?auto_849187 ?auto_849188 ) ( ON ?auto_849186 ?auto_849187 ) ( CLEAR ?auto_849184 ) ( ON ?auto_849185 ?auto_849186 ) ( CLEAR ?auto_849185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_849180 ?auto_849181 ?auto_849182 ?auto_849183 ?auto_849184 ?auto_849185 )
      ( MAKE-14PILE ?auto_849180 ?auto_849181 ?auto_849182 ?auto_849183 ?auto_849184 ?auto_849185 ?auto_849186 ?auto_849187 ?auto_849188 ?auto_849189 ?auto_849190 ?auto_849191 ?auto_849192 ?auto_849193 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_849238 - BLOCK
      ?auto_849239 - BLOCK
      ?auto_849240 - BLOCK
      ?auto_849241 - BLOCK
      ?auto_849242 - BLOCK
      ?auto_849243 - BLOCK
      ?auto_849244 - BLOCK
      ?auto_849245 - BLOCK
      ?auto_849246 - BLOCK
      ?auto_849247 - BLOCK
      ?auto_849248 - BLOCK
      ?auto_849249 - BLOCK
      ?auto_849250 - BLOCK
      ?auto_849251 - BLOCK
    )
    :vars
    (
      ?auto_849252 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_849251 ?auto_849252 ) ( ON-TABLE ?auto_849238 ) ( ON ?auto_849239 ?auto_849238 ) ( ON ?auto_849240 ?auto_849239 ) ( ON ?auto_849241 ?auto_849240 ) ( not ( = ?auto_849238 ?auto_849239 ) ) ( not ( = ?auto_849238 ?auto_849240 ) ) ( not ( = ?auto_849238 ?auto_849241 ) ) ( not ( = ?auto_849238 ?auto_849242 ) ) ( not ( = ?auto_849238 ?auto_849243 ) ) ( not ( = ?auto_849238 ?auto_849244 ) ) ( not ( = ?auto_849238 ?auto_849245 ) ) ( not ( = ?auto_849238 ?auto_849246 ) ) ( not ( = ?auto_849238 ?auto_849247 ) ) ( not ( = ?auto_849238 ?auto_849248 ) ) ( not ( = ?auto_849238 ?auto_849249 ) ) ( not ( = ?auto_849238 ?auto_849250 ) ) ( not ( = ?auto_849238 ?auto_849251 ) ) ( not ( = ?auto_849238 ?auto_849252 ) ) ( not ( = ?auto_849239 ?auto_849240 ) ) ( not ( = ?auto_849239 ?auto_849241 ) ) ( not ( = ?auto_849239 ?auto_849242 ) ) ( not ( = ?auto_849239 ?auto_849243 ) ) ( not ( = ?auto_849239 ?auto_849244 ) ) ( not ( = ?auto_849239 ?auto_849245 ) ) ( not ( = ?auto_849239 ?auto_849246 ) ) ( not ( = ?auto_849239 ?auto_849247 ) ) ( not ( = ?auto_849239 ?auto_849248 ) ) ( not ( = ?auto_849239 ?auto_849249 ) ) ( not ( = ?auto_849239 ?auto_849250 ) ) ( not ( = ?auto_849239 ?auto_849251 ) ) ( not ( = ?auto_849239 ?auto_849252 ) ) ( not ( = ?auto_849240 ?auto_849241 ) ) ( not ( = ?auto_849240 ?auto_849242 ) ) ( not ( = ?auto_849240 ?auto_849243 ) ) ( not ( = ?auto_849240 ?auto_849244 ) ) ( not ( = ?auto_849240 ?auto_849245 ) ) ( not ( = ?auto_849240 ?auto_849246 ) ) ( not ( = ?auto_849240 ?auto_849247 ) ) ( not ( = ?auto_849240 ?auto_849248 ) ) ( not ( = ?auto_849240 ?auto_849249 ) ) ( not ( = ?auto_849240 ?auto_849250 ) ) ( not ( = ?auto_849240 ?auto_849251 ) ) ( not ( = ?auto_849240 ?auto_849252 ) ) ( not ( = ?auto_849241 ?auto_849242 ) ) ( not ( = ?auto_849241 ?auto_849243 ) ) ( not ( = ?auto_849241 ?auto_849244 ) ) ( not ( = ?auto_849241 ?auto_849245 ) ) ( not ( = ?auto_849241 ?auto_849246 ) ) ( not ( = ?auto_849241 ?auto_849247 ) ) ( not ( = ?auto_849241 ?auto_849248 ) ) ( not ( = ?auto_849241 ?auto_849249 ) ) ( not ( = ?auto_849241 ?auto_849250 ) ) ( not ( = ?auto_849241 ?auto_849251 ) ) ( not ( = ?auto_849241 ?auto_849252 ) ) ( not ( = ?auto_849242 ?auto_849243 ) ) ( not ( = ?auto_849242 ?auto_849244 ) ) ( not ( = ?auto_849242 ?auto_849245 ) ) ( not ( = ?auto_849242 ?auto_849246 ) ) ( not ( = ?auto_849242 ?auto_849247 ) ) ( not ( = ?auto_849242 ?auto_849248 ) ) ( not ( = ?auto_849242 ?auto_849249 ) ) ( not ( = ?auto_849242 ?auto_849250 ) ) ( not ( = ?auto_849242 ?auto_849251 ) ) ( not ( = ?auto_849242 ?auto_849252 ) ) ( not ( = ?auto_849243 ?auto_849244 ) ) ( not ( = ?auto_849243 ?auto_849245 ) ) ( not ( = ?auto_849243 ?auto_849246 ) ) ( not ( = ?auto_849243 ?auto_849247 ) ) ( not ( = ?auto_849243 ?auto_849248 ) ) ( not ( = ?auto_849243 ?auto_849249 ) ) ( not ( = ?auto_849243 ?auto_849250 ) ) ( not ( = ?auto_849243 ?auto_849251 ) ) ( not ( = ?auto_849243 ?auto_849252 ) ) ( not ( = ?auto_849244 ?auto_849245 ) ) ( not ( = ?auto_849244 ?auto_849246 ) ) ( not ( = ?auto_849244 ?auto_849247 ) ) ( not ( = ?auto_849244 ?auto_849248 ) ) ( not ( = ?auto_849244 ?auto_849249 ) ) ( not ( = ?auto_849244 ?auto_849250 ) ) ( not ( = ?auto_849244 ?auto_849251 ) ) ( not ( = ?auto_849244 ?auto_849252 ) ) ( not ( = ?auto_849245 ?auto_849246 ) ) ( not ( = ?auto_849245 ?auto_849247 ) ) ( not ( = ?auto_849245 ?auto_849248 ) ) ( not ( = ?auto_849245 ?auto_849249 ) ) ( not ( = ?auto_849245 ?auto_849250 ) ) ( not ( = ?auto_849245 ?auto_849251 ) ) ( not ( = ?auto_849245 ?auto_849252 ) ) ( not ( = ?auto_849246 ?auto_849247 ) ) ( not ( = ?auto_849246 ?auto_849248 ) ) ( not ( = ?auto_849246 ?auto_849249 ) ) ( not ( = ?auto_849246 ?auto_849250 ) ) ( not ( = ?auto_849246 ?auto_849251 ) ) ( not ( = ?auto_849246 ?auto_849252 ) ) ( not ( = ?auto_849247 ?auto_849248 ) ) ( not ( = ?auto_849247 ?auto_849249 ) ) ( not ( = ?auto_849247 ?auto_849250 ) ) ( not ( = ?auto_849247 ?auto_849251 ) ) ( not ( = ?auto_849247 ?auto_849252 ) ) ( not ( = ?auto_849248 ?auto_849249 ) ) ( not ( = ?auto_849248 ?auto_849250 ) ) ( not ( = ?auto_849248 ?auto_849251 ) ) ( not ( = ?auto_849248 ?auto_849252 ) ) ( not ( = ?auto_849249 ?auto_849250 ) ) ( not ( = ?auto_849249 ?auto_849251 ) ) ( not ( = ?auto_849249 ?auto_849252 ) ) ( not ( = ?auto_849250 ?auto_849251 ) ) ( not ( = ?auto_849250 ?auto_849252 ) ) ( not ( = ?auto_849251 ?auto_849252 ) ) ( ON ?auto_849250 ?auto_849251 ) ( ON ?auto_849249 ?auto_849250 ) ( ON ?auto_849248 ?auto_849249 ) ( ON ?auto_849247 ?auto_849248 ) ( ON ?auto_849246 ?auto_849247 ) ( ON ?auto_849245 ?auto_849246 ) ( ON ?auto_849244 ?auto_849245 ) ( ON ?auto_849243 ?auto_849244 ) ( CLEAR ?auto_849241 ) ( ON ?auto_849242 ?auto_849243 ) ( CLEAR ?auto_849242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_849238 ?auto_849239 ?auto_849240 ?auto_849241 ?auto_849242 )
      ( MAKE-14PILE ?auto_849238 ?auto_849239 ?auto_849240 ?auto_849241 ?auto_849242 ?auto_849243 ?auto_849244 ?auto_849245 ?auto_849246 ?auto_849247 ?auto_849248 ?auto_849249 ?auto_849250 ?auto_849251 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_849296 - BLOCK
      ?auto_849297 - BLOCK
      ?auto_849298 - BLOCK
      ?auto_849299 - BLOCK
      ?auto_849300 - BLOCK
      ?auto_849301 - BLOCK
      ?auto_849302 - BLOCK
      ?auto_849303 - BLOCK
      ?auto_849304 - BLOCK
      ?auto_849305 - BLOCK
      ?auto_849306 - BLOCK
      ?auto_849307 - BLOCK
      ?auto_849308 - BLOCK
      ?auto_849309 - BLOCK
    )
    :vars
    (
      ?auto_849310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_849309 ?auto_849310 ) ( ON-TABLE ?auto_849296 ) ( ON ?auto_849297 ?auto_849296 ) ( ON ?auto_849298 ?auto_849297 ) ( not ( = ?auto_849296 ?auto_849297 ) ) ( not ( = ?auto_849296 ?auto_849298 ) ) ( not ( = ?auto_849296 ?auto_849299 ) ) ( not ( = ?auto_849296 ?auto_849300 ) ) ( not ( = ?auto_849296 ?auto_849301 ) ) ( not ( = ?auto_849296 ?auto_849302 ) ) ( not ( = ?auto_849296 ?auto_849303 ) ) ( not ( = ?auto_849296 ?auto_849304 ) ) ( not ( = ?auto_849296 ?auto_849305 ) ) ( not ( = ?auto_849296 ?auto_849306 ) ) ( not ( = ?auto_849296 ?auto_849307 ) ) ( not ( = ?auto_849296 ?auto_849308 ) ) ( not ( = ?auto_849296 ?auto_849309 ) ) ( not ( = ?auto_849296 ?auto_849310 ) ) ( not ( = ?auto_849297 ?auto_849298 ) ) ( not ( = ?auto_849297 ?auto_849299 ) ) ( not ( = ?auto_849297 ?auto_849300 ) ) ( not ( = ?auto_849297 ?auto_849301 ) ) ( not ( = ?auto_849297 ?auto_849302 ) ) ( not ( = ?auto_849297 ?auto_849303 ) ) ( not ( = ?auto_849297 ?auto_849304 ) ) ( not ( = ?auto_849297 ?auto_849305 ) ) ( not ( = ?auto_849297 ?auto_849306 ) ) ( not ( = ?auto_849297 ?auto_849307 ) ) ( not ( = ?auto_849297 ?auto_849308 ) ) ( not ( = ?auto_849297 ?auto_849309 ) ) ( not ( = ?auto_849297 ?auto_849310 ) ) ( not ( = ?auto_849298 ?auto_849299 ) ) ( not ( = ?auto_849298 ?auto_849300 ) ) ( not ( = ?auto_849298 ?auto_849301 ) ) ( not ( = ?auto_849298 ?auto_849302 ) ) ( not ( = ?auto_849298 ?auto_849303 ) ) ( not ( = ?auto_849298 ?auto_849304 ) ) ( not ( = ?auto_849298 ?auto_849305 ) ) ( not ( = ?auto_849298 ?auto_849306 ) ) ( not ( = ?auto_849298 ?auto_849307 ) ) ( not ( = ?auto_849298 ?auto_849308 ) ) ( not ( = ?auto_849298 ?auto_849309 ) ) ( not ( = ?auto_849298 ?auto_849310 ) ) ( not ( = ?auto_849299 ?auto_849300 ) ) ( not ( = ?auto_849299 ?auto_849301 ) ) ( not ( = ?auto_849299 ?auto_849302 ) ) ( not ( = ?auto_849299 ?auto_849303 ) ) ( not ( = ?auto_849299 ?auto_849304 ) ) ( not ( = ?auto_849299 ?auto_849305 ) ) ( not ( = ?auto_849299 ?auto_849306 ) ) ( not ( = ?auto_849299 ?auto_849307 ) ) ( not ( = ?auto_849299 ?auto_849308 ) ) ( not ( = ?auto_849299 ?auto_849309 ) ) ( not ( = ?auto_849299 ?auto_849310 ) ) ( not ( = ?auto_849300 ?auto_849301 ) ) ( not ( = ?auto_849300 ?auto_849302 ) ) ( not ( = ?auto_849300 ?auto_849303 ) ) ( not ( = ?auto_849300 ?auto_849304 ) ) ( not ( = ?auto_849300 ?auto_849305 ) ) ( not ( = ?auto_849300 ?auto_849306 ) ) ( not ( = ?auto_849300 ?auto_849307 ) ) ( not ( = ?auto_849300 ?auto_849308 ) ) ( not ( = ?auto_849300 ?auto_849309 ) ) ( not ( = ?auto_849300 ?auto_849310 ) ) ( not ( = ?auto_849301 ?auto_849302 ) ) ( not ( = ?auto_849301 ?auto_849303 ) ) ( not ( = ?auto_849301 ?auto_849304 ) ) ( not ( = ?auto_849301 ?auto_849305 ) ) ( not ( = ?auto_849301 ?auto_849306 ) ) ( not ( = ?auto_849301 ?auto_849307 ) ) ( not ( = ?auto_849301 ?auto_849308 ) ) ( not ( = ?auto_849301 ?auto_849309 ) ) ( not ( = ?auto_849301 ?auto_849310 ) ) ( not ( = ?auto_849302 ?auto_849303 ) ) ( not ( = ?auto_849302 ?auto_849304 ) ) ( not ( = ?auto_849302 ?auto_849305 ) ) ( not ( = ?auto_849302 ?auto_849306 ) ) ( not ( = ?auto_849302 ?auto_849307 ) ) ( not ( = ?auto_849302 ?auto_849308 ) ) ( not ( = ?auto_849302 ?auto_849309 ) ) ( not ( = ?auto_849302 ?auto_849310 ) ) ( not ( = ?auto_849303 ?auto_849304 ) ) ( not ( = ?auto_849303 ?auto_849305 ) ) ( not ( = ?auto_849303 ?auto_849306 ) ) ( not ( = ?auto_849303 ?auto_849307 ) ) ( not ( = ?auto_849303 ?auto_849308 ) ) ( not ( = ?auto_849303 ?auto_849309 ) ) ( not ( = ?auto_849303 ?auto_849310 ) ) ( not ( = ?auto_849304 ?auto_849305 ) ) ( not ( = ?auto_849304 ?auto_849306 ) ) ( not ( = ?auto_849304 ?auto_849307 ) ) ( not ( = ?auto_849304 ?auto_849308 ) ) ( not ( = ?auto_849304 ?auto_849309 ) ) ( not ( = ?auto_849304 ?auto_849310 ) ) ( not ( = ?auto_849305 ?auto_849306 ) ) ( not ( = ?auto_849305 ?auto_849307 ) ) ( not ( = ?auto_849305 ?auto_849308 ) ) ( not ( = ?auto_849305 ?auto_849309 ) ) ( not ( = ?auto_849305 ?auto_849310 ) ) ( not ( = ?auto_849306 ?auto_849307 ) ) ( not ( = ?auto_849306 ?auto_849308 ) ) ( not ( = ?auto_849306 ?auto_849309 ) ) ( not ( = ?auto_849306 ?auto_849310 ) ) ( not ( = ?auto_849307 ?auto_849308 ) ) ( not ( = ?auto_849307 ?auto_849309 ) ) ( not ( = ?auto_849307 ?auto_849310 ) ) ( not ( = ?auto_849308 ?auto_849309 ) ) ( not ( = ?auto_849308 ?auto_849310 ) ) ( not ( = ?auto_849309 ?auto_849310 ) ) ( ON ?auto_849308 ?auto_849309 ) ( ON ?auto_849307 ?auto_849308 ) ( ON ?auto_849306 ?auto_849307 ) ( ON ?auto_849305 ?auto_849306 ) ( ON ?auto_849304 ?auto_849305 ) ( ON ?auto_849303 ?auto_849304 ) ( ON ?auto_849302 ?auto_849303 ) ( ON ?auto_849301 ?auto_849302 ) ( ON ?auto_849300 ?auto_849301 ) ( CLEAR ?auto_849298 ) ( ON ?auto_849299 ?auto_849300 ) ( CLEAR ?auto_849299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_849296 ?auto_849297 ?auto_849298 ?auto_849299 )
      ( MAKE-14PILE ?auto_849296 ?auto_849297 ?auto_849298 ?auto_849299 ?auto_849300 ?auto_849301 ?auto_849302 ?auto_849303 ?auto_849304 ?auto_849305 ?auto_849306 ?auto_849307 ?auto_849308 ?auto_849309 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_849354 - BLOCK
      ?auto_849355 - BLOCK
      ?auto_849356 - BLOCK
      ?auto_849357 - BLOCK
      ?auto_849358 - BLOCK
      ?auto_849359 - BLOCK
      ?auto_849360 - BLOCK
      ?auto_849361 - BLOCK
      ?auto_849362 - BLOCK
      ?auto_849363 - BLOCK
      ?auto_849364 - BLOCK
      ?auto_849365 - BLOCK
      ?auto_849366 - BLOCK
      ?auto_849367 - BLOCK
    )
    :vars
    (
      ?auto_849368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_849367 ?auto_849368 ) ( ON-TABLE ?auto_849354 ) ( ON ?auto_849355 ?auto_849354 ) ( not ( = ?auto_849354 ?auto_849355 ) ) ( not ( = ?auto_849354 ?auto_849356 ) ) ( not ( = ?auto_849354 ?auto_849357 ) ) ( not ( = ?auto_849354 ?auto_849358 ) ) ( not ( = ?auto_849354 ?auto_849359 ) ) ( not ( = ?auto_849354 ?auto_849360 ) ) ( not ( = ?auto_849354 ?auto_849361 ) ) ( not ( = ?auto_849354 ?auto_849362 ) ) ( not ( = ?auto_849354 ?auto_849363 ) ) ( not ( = ?auto_849354 ?auto_849364 ) ) ( not ( = ?auto_849354 ?auto_849365 ) ) ( not ( = ?auto_849354 ?auto_849366 ) ) ( not ( = ?auto_849354 ?auto_849367 ) ) ( not ( = ?auto_849354 ?auto_849368 ) ) ( not ( = ?auto_849355 ?auto_849356 ) ) ( not ( = ?auto_849355 ?auto_849357 ) ) ( not ( = ?auto_849355 ?auto_849358 ) ) ( not ( = ?auto_849355 ?auto_849359 ) ) ( not ( = ?auto_849355 ?auto_849360 ) ) ( not ( = ?auto_849355 ?auto_849361 ) ) ( not ( = ?auto_849355 ?auto_849362 ) ) ( not ( = ?auto_849355 ?auto_849363 ) ) ( not ( = ?auto_849355 ?auto_849364 ) ) ( not ( = ?auto_849355 ?auto_849365 ) ) ( not ( = ?auto_849355 ?auto_849366 ) ) ( not ( = ?auto_849355 ?auto_849367 ) ) ( not ( = ?auto_849355 ?auto_849368 ) ) ( not ( = ?auto_849356 ?auto_849357 ) ) ( not ( = ?auto_849356 ?auto_849358 ) ) ( not ( = ?auto_849356 ?auto_849359 ) ) ( not ( = ?auto_849356 ?auto_849360 ) ) ( not ( = ?auto_849356 ?auto_849361 ) ) ( not ( = ?auto_849356 ?auto_849362 ) ) ( not ( = ?auto_849356 ?auto_849363 ) ) ( not ( = ?auto_849356 ?auto_849364 ) ) ( not ( = ?auto_849356 ?auto_849365 ) ) ( not ( = ?auto_849356 ?auto_849366 ) ) ( not ( = ?auto_849356 ?auto_849367 ) ) ( not ( = ?auto_849356 ?auto_849368 ) ) ( not ( = ?auto_849357 ?auto_849358 ) ) ( not ( = ?auto_849357 ?auto_849359 ) ) ( not ( = ?auto_849357 ?auto_849360 ) ) ( not ( = ?auto_849357 ?auto_849361 ) ) ( not ( = ?auto_849357 ?auto_849362 ) ) ( not ( = ?auto_849357 ?auto_849363 ) ) ( not ( = ?auto_849357 ?auto_849364 ) ) ( not ( = ?auto_849357 ?auto_849365 ) ) ( not ( = ?auto_849357 ?auto_849366 ) ) ( not ( = ?auto_849357 ?auto_849367 ) ) ( not ( = ?auto_849357 ?auto_849368 ) ) ( not ( = ?auto_849358 ?auto_849359 ) ) ( not ( = ?auto_849358 ?auto_849360 ) ) ( not ( = ?auto_849358 ?auto_849361 ) ) ( not ( = ?auto_849358 ?auto_849362 ) ) ( not ( = ?auto_849358 ?auto_849363 ) ) ( not ( = ?auto_849358 ?auto_849364 ) ) ( not ( = ?auto_849358 ?auto_849365 ) ) ( not ( = ?auto_849358 ?auto_849366 ) ) ( not ( = ?auto_849358 ?auto_849367 ) ) ( not ( = ?auto_849358 ?auto_849368 ) ) ( not ( = ?auto_849359 ?auto_849360 ) ) ( not ( = ?auto_849359 ?auto_849361 ) ) ( not ( = ?auto_849359 ?auto_849362 ) ) ( not ( = ?auto_849359 ?auto_849363 ) ) ( not ( = ?auto_849359 ?auto_849364 ) ) ( not ( = ?auto_849359 ?auto_849365 ) ) ( not ( = ?auto_849359 ?auto_849366 ) ) ( not ( = ?auto_849359 ?auto_849367 ) ) ( not ( = ?auto_849359 ?auto_849368 ) ) ( not ( = ?auto_849360 ?auto_849361 ) ) ( not ( = ?auto_849360 ?auto_849362 ) ) ( not ( = ?auto_849360 ?auto_849363 ) ) ( not ( = ?auto_849360 ?auto_849364 ) ) ( not ( = ?auto_849360 ?auto_849365 ) ) ( not ( = ?auto_849360 ?auto_849366 ) ) ( not ( = ?auto_849360 ?auto_849367 ) ) ( not ( = ?auto_849360 ?auto_849368 ) ) ( not ( = ?auto_849361 ?auto_849362 ) ) ( not ( = ?auto_849361 ?auto_849363 ) ) ( not ( = ?auto_849361 ?auto_849364 ) ) ( not ( = ?auto_849361 ?auto_849365 ) ) ( not ( = ?auto_849361 ?auto_849366 ) ) ( not ( = ?auto_849361 ?auto_849367 ) ) ( not ( = ?auto_849361 ?auto_849368 ) ) ( not ( = ?auto_849362 ?auto_849363 ) ) ( not ( = ?auto_849362 ?auto_849364 ) ) ( not ( = ?auto_849362 ?auto_849365 ) ) ( not ( = ?auto_849362 ?auto_849366 ) ) ( not ( = ?auto_849362 ?auto_849367 ) ) ( not ( = ?auto_849362 ?auto_849368 ) ) ( not ( = ?auto_849363 ?auto_849364 ) ) ( not ( = ?auto_849363 ?auto_849365 ) ) ( not ( = ?auto_849363 ?auto_849366 ) ) ( not ( = ?auto_849363 ?auto_849367 ) ) ( not ( = ?auto_849363 ?auto_849368 ) ) ( not ( = ?auto_849364 ?auto_849365 ) ) ( not ( = ?auto_849364 ?auto_849366 ) ) ( not ( = ?auto_849364 ?auto_849367 ) ) ( not ( = ?auto_849364 ?auto_849368 ) ) ( not ( = ?auto_849365 ?auto_849366 ) ) ( not ( = ?auto_849365 ?auto_849367 ) ) ( not ( = ?auto_849365 ?auto_849368 ) ) ( not ( = ?auto_849366 ?auto_849367 ) ) ( not ( = ?auto_849366 ?auto_849368 ) ) ( not ( = ?auto_849367 ?auto_849368 ) ) ( ON ?auto_849366 ?auto_849367 ) ( ON ?auto_849365 ?auto_849366 ) ( ON ?auto_849364 ?auto_849365 ) ( ON ?auto_849363 ?auto_849364 ) ( ON ?auto_849362 ?auto_849363 ) ( ON ?auto_849361 ?auto_849362 ) ( ON ?auto_849360 ?auto_849361 ) ( ON ?auto_849359 ?auto_849360 ) ( ON ?auto_849358 ?auto_849359 ) ( ON ?auto_849357 ?auto_849358 ) ( CLEAR ?auto_849355 ) ( ON ?auto_849356 ?auto_849357 ) ( CLEAR ?auto_849356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_849354 ?auto_849355 ?auto_849356 )
      ( MAKE-14PILE ?auto_849354 ?auto_849355 ?auto_849356 ?auto_849357 ?auto_849358 ?auto_849359 ?auto_849360 ?auto_849361 ?auto_849362 ?auto_849363 ?auto_849364 ?auto_849365 ?auto_849366 ?auto_849367 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_849412 - BLOCK
      ?auto_849413 - BLOCK
      ?auto_849414 - BLOCK
      ?auto_849415 - BLOCK
      ?auto_849416 - BLOCK
      ?auto_849417 - BLOCK
      ?auto_849418 - BLOCK
      ?auto_849419 - BLOCK
      ?auto_849420 - BLOCK
      ?auto_849421 - BLOCK
      ?auto_849422 - BLOCK
      ?auto_849423 - BLOCK
      ?auto_849424 - BLOCK
      ?auto_849425 - BLOCK
    )
    :vars
    (
      ?auto_849426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_849425 ?auto_849426 ) ( ON-TABLE ?auto_849412 ) ( not ( = ?auto_849412 ?auto_849413 ) ) ( not ( = ?auto_849412 ?auto_849414 ) ) ( not ( = ?auto_849412 ?auto_849415 ) ) ( not ( = ?auto_849412 ?auto_849416 ) ) ( not ( = ?auto_849412 ?auto_849417 ) ) ( not ( = ?auto_849412 ?auto_849418 ) ) ( not ( = ?auto_849412 ?auto_849419 ) ) ( not ( = ?auto_849412 ?auto_849420 ) ) ( not ( = ?auto_849412 ?auto_849421 ) ) ( not ( = ?auto_849412 ?auto_849422 ) ) ( not ( = ?auto_849412 ?auto_849423 ) ) ( not ( = ?auto_849412 ?auto_849424 ) ) ( not ( = ?auto_849412 ?auto_849425 ) ) ( not ( = ?auto_849412 ?auto_849426 ) ) ( not ( = ?auto_849413 ?auto_849414 ) ) ( not ( = ?auto_849413 ?auto_849415 ) ) ( not ( = ?auto_849413 ?auto_849416 ) ) ( not ( = ?auto_849413 ?auto_849417 ) ) ( not ( = ?auto_849413 ?auto_849418 ) ) ( not ( = ?auto_849413 ?auto_849419 ) ) ( not ( = ?auto_849413 ?auto_849420 ) ) ( not ( = ?auto_849413 ?auto_849421 ) ) ( not ( = ?auto_849413 ?auto_849422 ) ) ( not ( = ?auto_849413 ?auto_849423 ) ) ( not ( = ?auto_849413 ?auto_849424 ) ) ( not ( = ?auto_849413 ?auto_849425 ) ) ( not ( = ?auto_849413 ?auto_849426 ) ) ( not ( = ?auto_849414 ?auto_849415 ) ) ( not ( = ?auto_849414 ?auto_849416 ) ) ( not ( = ?auto_849414 ?auto_849417 ) ) ( not ( = ?auto_849414 ?auto_849418 ) ) ( not ( = ?auto_849414 ?auto_849419 ) ) ( not ( = ?auto_849414 ?auto_849420 ) ) ( not ( = ?auto_849414 ?auto_849421 ) ) ( not ( = ?auto_849414 ?auto_849422 ) ) ( not ( = ?auto_849414 ?auto_849423 ) ) ( not ( = ?auto_849414 ?auto_849424 ) ) ( not ( = ?auto_849414 ?auto_849425 ) ) ( not ( = ?auto_849414 ?auto_849426 ) ) ( not ( = ?auto_849415 ?auto_849416 ) ) ( not ( = ?auto_849415 ?auto_849417 ) ) ( not ( = ?auto_849415 ?auto_849418 ) ) ( not ( = ?auto_849415 ?auto_849419 ) ) ( not ( = ?auto_849415 ?auto_849420 ) ) ( not ( = ?auto_849415 ?auto_849421 ) ) ( not ( = ?auto_849415 ?auto_849422 ) ) ( not ( = ?auto_849415 ?auto_849423 ) ) ( not ( = ?auto_849415 ?auto_849424 ) ) ( not ( = ?auto_849415 ?auto_849425 ) ) ( not ( = ?auto_849415 ?auto_849426 ) ) ( not ( = ?auto_849416 ?auto_849417 ) ) ( not ( = ?auto_849416 ?auto_849418 ) ) ( not ( = ?auto_849416 ?auto_849419 ) ) ( not ( = ?auto_849416 ?auto_849420 ) ) ( not ( = ?auto_849416 ?auto_849421 ) ) ( not ( = ?auto_849416 ?auto_849422 ) ) ( not ( = ?auto_849416 ?auto_849423 ) ) ( not ( = ?auto_849416 ?auto_849424 ) ) ( not ( = ?auto_849416 ?auto_849425 ) ) ( not ( = ?auto_849416 ?auto_849426 ) ) ( not ( = ?auto_849417 ?auto_849418 ) ) ( not ( = ?auto_849417 ?auto_849419 ) ) ( not ( = ?auto_849417 ?auto_849420 ) ) ( not ( = ?auto_849417 ?auto_849421 ) ) ( not ( = ?auto_849417 ?auto_849422 ) ) ( not ( = ?auto_849417 ?auto_849423 ) ) ( not ( = ?auto_849417 ?auto_849424 ) ) ( not ( = ?auto_849417 ?auto_849425 ) ) ( not ( = ?auto_849417 ?auto_849426 ) ) ( not ( = ?auto_849418 ?auto_849419 ) ) ( not ( = ?auto_849418 ?auto_849420 ) ) ( not ( = ?auto_849418 ?auto_849421 ) ) ( not ( = ?auto_849418 ?auto_849422 ) ) ( not ( = ?auto_849418 ?auto_849423 ) ) ( not ( = ?auto_849418 ?auto_849424 ) ) ( not ( = ?auto_849418 ?auto_849425 ) ) ( not ( = ?auto_849418 ?auto_849426 ) ) ( not ( = ?auto_849419 ?auto_849420 ) ) ( not ( = ?auto_849419 ?auto_849421 ) ) ( not ( = ?auto_849419 ?auto_849422 ) ) ( not ( = ?auto_849419 ?auto_849423 ) ) ( not ( = ?auto_849419 ?auto_849424 ) ) ( not ( = ?auto_849419 ?auto_849425 ) ) ( not ( = ?auto_849419 ?auto_849426 ) ) ( not ( = ?auto_849420 ?auto_849421 ) ) ( not ( = ?auto_849420 ?auto_849422 ) ) ( not ( = ?auto_849420 ?auto_849423 ) ) ( not ( = ?auto_849420 ?auto_849424 ) ) ( not ( = ?auto_849420 ?auto_849425 ) ) ( not ( = ?auto_849420 ?auto_849426 ) ) ( not ( = ?auto_849421 ?auto_849422 ) ) ( not ( = ?auto_849421 ?auto_849423 ) ) ( not ( = ?auto_849421 ?auto_849424 ) ) ( not ( = ?auto_849421 ?auto_849425 ) ) ( not ( = ?auto_849421 ?auto_849426 ) ) ( not ( = ?auto_849422 ?auto_849423 ) ) ( not ( = ?auto_849422 ?auto_849424 ) ) ( not ( = ?auto_849422 ?auto_849425 ) ) ( not ( = ?auto_849422 ?auto_849426 ) ) ( not ( = ?auto_849423 ?auto_849424 ) ) ( not ( = ?auto_849423 ?auto_849425 ) ) ( not ( = ?auto_849423 ?auto_849426 ) ) ( not ( = ?auto_849424 ?auto_849425 ) ) ( not ( = ?auto_849424 ?auto_849426 ) ) ( not ( = ?auto_849425 ?auto_849426 ) ) ( ON ?auto_849424 ?auto_849425 ) ( ON ?auto_849423 ?auto_849424 ) ( ON ?auto_849422 ?auto_849423 ) ( ON ?auto_849421 ?auto_849422 ) ( ON ?auto_849420 ?auto_849421 ) ( ON ?auto_849419 ?auto_849420 ) ( ON ?auto_849418 ?auto_849419 ) ( ON ?auto_849417 ?auto_849418 ) ( ON ?auto_849416 ?auto_849417 ) ( ON ?auto_849415 ?auto_849416 ) ( ON ?auto_849414 ?auto_849415 ) ( CLEAR ?auto_849412 ) ( ON ?auto_849413 ?auto_849414 ) ( CLEAR ?auto_849413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_849412 ?auto_849413 )
      ( MAKE-14PILE ?auto_849412 ?auto_849413 ?auto_849414 ?auto_849415 ?auto_849416 ?auto_849417 ?auto_849418 ?auto_849419 ?auto_849420 ?auto_849421 ?auto_849422 ?auto_849423 ?auto_849424 ?auto_849425 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_849470 - BLOCK
      ?auto_849471 - BLOCK
      ?auto_849472 - BLOCK
      ?auto_849473 - BLOCK
      ?auto_849474 - BLOCK
      ?auto_849475 - BLOCK
      ?auto_849476 - BLOCK
      ?auto_849477 - BLOCK
      ?auto_849478 - BLOCK
      ?auto_849479 - BLOCK
      ?auto_849480 - BLOCK
      ?auto_849481 - BLOCK
      ?auto_849482 - BLOCK
      ?auto_849483 - BLOCK
    )
    :vars
    (
      ?auto_849484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_849483 ?auto_849484 ) ( not ( = ?auto_849470 ?auto_849471 ) ) ( not ( = ?auto_849470 ?auto_849472 ) ) ( not ( = ?auto_849470 ?auto_849473 ) ) ( not ( = ?auto_849470 ?auto_849474 ) ) ( not ( = ?auto_849470 ?auto_849475 ) ) ( not ( = ?auto_849470 ?auto_849476 ) ) ( not ( = ?auto_849470 ?auto_849477 ) ) ( not ( = ?auto_849470 ?auto_849478 ) ) ( not ( = ?auto_849470 ?auto_849479 ) ) ( not ( = ?auto_849470 ?auto_849480 ) ) ( not ( = ?auto_849470 ?auto_849481 ) ) ( not ( = ?auto_849470 ?auto_849482 ) ) ( not ( = ?auto_849470 ?auto_849483 ) ) ( not ( = ?auto_849470 ?auto_849484 ) ) ( not ( = ?auto_849471 ?auto_849472 ) ) ( not ( = ?auto_849471 ?auto_849473 ) ) ( not ( = ?auto_849471 ?auto_849474 ) ) ( not ( = ?auto_849471 ?auto_849475 ) ) ( not ( = ?auto_849471 ?auto_849476 ) ) ( not ( = ?auto_849471 ?auto_849477 ) ) ( not ( = ?auto_849471 ?auto_849478 ) ) ( not ( = ?auto_849471 ?auto_849479 ) ) ( not ( = ?auto_849471 ?auto_849480 ) ) ( not ( = ?auto_849471 ?auto_849481 ) ) ( not ( = ?auto_849471 ?auto_849482 ) ) ( not ( = ?auto_849471 ?auto_849483 ) ) ( not ( = ?auto_849471 ?auto_849484 ) ) ( not ( = ?auto_849472 ?auto_849473 ) ) ( not ( = ?auto_849472 ?auto_849474 ) ) ( not ( = ?auto_849472 ?auto_849475 ) ) ( not ( = ?auto_849472 ?auto_849476 ) ) ( not ( = ?auto_849472 ?auto_849477 ) ) ( not ( = ?auto_849472 ?auto_849478 ) ) ( not ( = ?auto_849472 ?auto_849479 ) ) ( not ( = ?auto_849472 ?auto_849480 ) ) ( not ( = ?auto_849472 ?auto_849481 ) ) ( not ( = ?auto_849472 ?auto_849482 ) ) ( not ( = ?auto_849472 ?auto_849483 ) ) ( not ( = ?auto_849472 ?auto_849484 ) ) ( not ( = ?auto_849473 ?auto_849474 ) ) ( not ( = ?auto_849473 ?auto_849475 ) ) ( not ( = ?auto_849473 ?auto_849476 ) ) ( not ( = ?auto_849473 ?auto_849477 ) ) ( not ( = ?auto_849473 ?auto_849478 ) ) ( not ( = ?auto_849473 ?auto_849479 ) ) ( not ( = ?auto_849473 ?auto_849480 ) ) ( not ( = ?auto_849473 ?auto_849481 ) ) ( not ( = ?auto_849473 ?auto_849482 ) ) ( not ( = ?auto_849473 ?auto_849483 ) ) ( not ( = ?auto_849473 ?auto_849484 ) ) ( not ( = ?auto_849474 ?auto_849475 ) ) ( not ( = ?auto_849474 ?auto_849476 ) ) ( not ( = ?auto_849474 ?auto_849477 ) ) ( not ( = ?auto_849474 ?auto_849478 ) ) ( not ( = ?auto_849474 ?auto_849479 ) ) ( not ( = ?auto_849474 ?auto_849480 ) ) ( not ( = ?auto_849474 ?auto_849481 ) ) ( not ( = ?auto_849474 ?auto_849482 ) ) ( not ( = ?auto_849474 ?auto_849483 ) ) ( not ( = ?auto_849474 ?auto_849484 ) ) ( not ( = ?auto_849475 ?auto_849476 ) ) ( not ( = ?auto_849475 ?auto_849477 ) ) ( not ( = ?auto_849475 ?auto_849478 ) ) ( not ( = ?auto_849475 ?auto_849479 ) ) ( not ( = ?auto_849475 ?auto_849480 ) ) ( not ( = ?auto_849475 ?auto_849481 ) ) ( not ( = ?auto_849475 ?auto_849482 ) ) ( not ( = ?auto_849475 ?auto_849483 ) ) ( not ( = ?auto_849475 ?auto_849484 ) ) ( not ( = ?auto_849476 ?auto_849477 ) ) ( not ( = ?auto_849476 ?auto_849478 ) ) ( not ( = ?auto_849476 ?auto_849479 ) ) ( not ( = ?auto_849476 ?auto_849480 ) ) ( not ( = ?auto_849476 ?auto_849481 ) ) ( not ( = ?auto_849476 ?auto_849482 ) ) ( not ( = ?auto_849476 ?auto_849483 ) ) ( not ( = ?auto_849476 ?auto_849484 ) ) ( not ( = ?auto_849477 ?auto_849478 ) ) ( not ( = ?auto_849477 ?auto_849479 ) ) ( not ( = ?auto_849477 ?auto_849480 ) ) ( not ( = ?auto_849477 ?auto_849481 ) ) ( not ( = ?auto_849477 ?auto_849482 ) ) ( not ( = ?auto_849477 ?auto_849483 ) ) ( not ( = ?auto_849477 ?auto_849484 ) ) ( not ( = ?auto_849478 ?auto_849479 ) ) ( not ( = ?auto_849478 ?auto_849480 ) ) ( not ( = ?auto_849478 ?auto_849481 ) ) ( not ( = ?auto_849478 ?auto_849482 ) ) ( not ( = ?auto_849478 ?auto_849483 ) ) ( not ( = ?auto_849478 ?auto_849484 ) ) ( not ( = ?auto_849479 ?auto_849480 ) ) ( not ( = ?auto_849479 ?auto_849481 ) ) ( not ( = ?auto_849479 ?auto_849482 ) ) ( not ( = ?auto_849479 ?auto_849483 ) ) ( not ( = ?auto_849479 ?auto_849484 ) ) ( not ( = ?auto_849480 ?auto_849481 ) ) ( not ( = ?auto_849480 ?auto_849482 ) ) ( not ( = ?auto_849480 ?auto_849483 ) ) ( not ( = ?auto_849480 ?auto_849484 ) ) ( not ( = ?auto_849481 ?auto_849482 ) ) ( not ( = ?auto_849481 ?auto_849483 ) ) ( not ( = ?auto_849481 ?auto_849484 ) ) ( not ( = ?auto_849482 ?auto_849483 ) ) ( not ( = ?auto_849482 ?auto_849484 ) ) ( not ( = ?auto_849483 ?auto_849484 ) ) ( ON ?auto_849482 ?auto_849483 ) ( ON ?auto_849481 ?auto_849482 ) ( ON ?auto_849480 ?auto_849481 ) ( ON ?auto_849479 ?auto_849480 ) ( ON ?auto_849478 ?auto_849479 ) ( ON ?auto_849477 ?auto_849478 ) ( ON ?auto_849476 ?auto_849477 ) ( ON ?auto_849475 ?auto_849476 ) ( ON ?auto_849474 ?auto_849475 ) ( ON ?auto_849473 ?auto_849474 ) ( ON ?auto_849472 ?auto_849473 ) ( ON ?auto_849471 ?auto_849472 ) ( ON ?auto_849470 ?auto_849471 ) ( CLEAR ?auto_849470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_849470 )
      ( MAKE-14PILE ?auto_849470 ?auto_849471 ?auto_849472 ?auto_849473 ?auto_849474 ?auto_849475 ?auto_849476 ?auto_849477 ?auto_849478 ?auto_849479 ?auto_849480 ?auto_849481 ?auto_849482 ?auto_849483 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_849529 - BLOCK
      ?auto_849530 - BLOCK
      ?auto_849531 - BLOCK
      ?auto_849532 - BLOCK
      ?auto_849533 - BLOCK
      ?auto_849534 - BLOCK
      ?auto_849535 - BLOCK
      ?auto_849536 - BLOCK
      ?auto_849537 - BLOCK
      ?auto_849538 - BLOCK
      ?auto_849539 - BLOCK
      ?auto_849540 - BLOCK
      ?auto_849541 - BLOCK
      ?auto_849542 - BLOCK
      ?auto_849543 - BLOCK
    )
    :vars
    (
      ?auto_849544 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_849542 ) ( ON ?auto_849543 ?auto_849544 ) ( CLEAR ?auto_849543 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_849529 ) ( ON ?auto_849530 ?auto_849529 ) ( ON ?auto_849531 ?auto_849530 ) ( ON ?auto_849532 ?auto_849531 ) ( ON ?auto_849533 ?auto_849532 ) ( ON ?auto_849534 ?auto_849533 ) ( ON ?auto_849535 ?auto_849534 ) ( ON ?auto_849536 ?auto_849535 ) ( ON ?auto_849537 ?auto_849536 ) ( ON ?auto_849538 ?auto_849537 ) ( ON ?auto_849539 ?auto_849538 ) ( ON ?auto_849540 ?auto_849539 ) ( ON ?auto_849541 ?auto_849540 ) ( ON ?auto_849542 ?auto_849541 ) ( not ( = ?auto_849529 ?auto_849530 ) ) ( not ( = ?auto_849529 ?auto_849531 ) ) ( not ( = ?auto_849529 ?auto_849532 ) ) ( not ( = ?auto_849529 ?auto_849533 ) ) ( not ( = ?auto_849529 ?auto_849534 ) ) ( not ( = ?auto_849529 ?auto_849535 ) ) ( not ( = ?auto_849529 ?auto_849536 ) ) ( not ( = ?auto_849529 ?auto_849537 ) ) ( not ( = ?auto_849529 ?auto_849538 ) ) ( not ( = ?auto_849529 ?auto_849539 ) ) ( not ( = ?auto_849529 ?auto_849540 ) ) ( not ( = ?auto_849529 ?auto_849541 ) ) ( not ( = ?auto_849529 ?auto_849542 ) ) ( not ( = ?auto_849529 ?auto_849543 ) ) ( not ( = ?auto_849529 ?auto_849544 ) ) ( not ( = ?auto_849530 ?auto_849531 ) ) ( not ( = ?auto_849530 ?auto_849532 ) ) ( not ( = ?auto_849530 ?auto_849533 ) ) ( not ( = ?auto_849530 ?auto_849534 ) ) ( not ( = ?auto_849530 ?auto_849535 ) ) ( not ( = ?auto_849530 ?auto_849536 ) ) ( not ( = ?auto_849530 ?auto_849537 ) ) ( not ( = ?auto_849530 ?auto_849538 ) ) ( not ( = ?auto_849530 ?auto_849539 ) ) ( not ( = ?auto_849530 ?auto_849540 ) ) ( not ( = ?auto_849530 ?auto_849541 ) ) ( not ( = ?auto_849530 ?auto_849542 ) ) ( not ( = ?auto_849530 ?auto_849543 ) ) ( not ( = ?auto_849530 ?auto_849544 ) ) ( not ( = ?auto_849531 ?auto_849532 ) ) ( not ( = ?auto_849531 ?auto_849533 ) ) ( not ( = ?auto_849531 ?auto_849534 ) ) ( not ( = ?auto_849531 ?auto_849535 ) ) ( not ( = ?auto_849531 ?auto_849536 ) ) ( not ( = ?auto_849531 ?auto_849537 ) ) ( not ( = ?auto_849531 ?auto_849538 ) ) ( not ( = ?auto_849531 ?auto_849539 ) ) ( not ( = ?auto_849531 ?auto_849540 ) ) ( not ( = ?auto_849531 ?auto_849541 ) ) ( not ( = ?auto_849531 ?auto_849542 ) ) ( not ( = ?auto_849531 ?auto_849543 ) ) ( not ( = ?auto_849531 ?auto_849544 ) ) ( not ( = ?auto_849532 ?auto_849533 ) ) ( not ( = ?auto_849532 ?auto_849534 ) ) ( not ( = ?auto_849532 ?auto_849535 ) ) ( not ( = ?auto_849532 ?auto_849536 ) ) ( not ( = ?auto_849532 ?auto_849537 ) ) ( not ( = ?auto_849532 ?auto_849538 ) ) ( not ( = ?auto_849532 ?auto_849539 ) ) ( not ( = ?auto_849532 ?auto_849540 ) ) ( not ( = ?auto_849532 ?auto_849541 ) ) ( not ( = ?auto_849532 ?auto_849542 ) ) ( not ( = ?auto_849532 ?auto_849543 ) ) ( not ( = ?auto_849532 ?auto_849544 ) ) ( not ( = ?auto_849533 ?auto_849534 ) ) ( not ( = ?auto_849533 ?auto_849535 ) ) ( not ( = ?auto_849533 ?auto_849536 ) ) ( not ( = ?auto_849533 ?auto_849537 ) ) ( not ( = ?auto_849533 ?auto_849538 ) ) ( not ( = ?auto_849533 ?auto_849539 ) ) ( not ( = ?auto_849533 ?auto_849540 ) ) ( not ( = ?auto_849533 ?auto_849541 ) ) ( not ( = ?auto_849533 ?auto_849542 ) ) ( not ( = ?auto_849533 ?auto_849543 ) ) ( not ( = ?auto_849533 ?auto_849544 ) ) ( not ( = ?auto_849534 ?auto_849535 ) ) ( not ( = ?auto_849534 ?auto_849536 ) ) ( not ( = ?auto_849534 ?auto_849537 ) ) ( not ( = ?auto_849534 ?auto_849538 ) ) ( not ( = ?auto_849534 ?auto_849539 ) ) ( not ( = ?auto_849534 ?auto_849540 ) ) ( not ( = ?auto_849534 ?auto_849541 ) ) ( not ( = ?auto_849534 ?auto_849542 ) ) ( not ( = ?auto_849534 ?auto_849543 ) ) ( not ( = ?auto_849534 ?auto_849544 ) ) ( not ( = ?auto_849535 ?auto_849536 ) ) ( not ( = ?auto_849535 ?auto_849537 ) ) ( not ( = ?auto_849535 ?auto_849538 ) ) ( not ( = ?auto_849535 ?auto_849539 ) ) ( not ( = ?auto_849535 ?auto_849540 ) ) ( not ( = ?auto_849535 ?auto_849541 ) ) ( not ( = ?auto_849535 ?auto_849542 ) ) ( not ( = ?auto_849535 ?auto_849543 ) ) ( not ( = ?auto_849535 ?auto_849544 ) ) ( not ( = ?auto_849536 ?auto_849537 ) ) ( not ( = ?auto_849536 ?auto_849538 ) ) ( not ( = ?auto_849536 ?auto_849539 ) ) ( not ( = ?auto_849536 ?auto_849540 ) ) ( not ( = ?auto_849536 ?auto_849541 ) ) ( not ( = ?auto_849536 ?auto_849542 ) ) ( not ( = ?auto_849536 ?auto_849543 ) ) ( not ( = ?auto_849536 ?auto_849544 ) ) ( not ( = ?auto_849537 ?auto_849538 ) ) ( not ( = ?auto_849537 ?auto_849539 ) ) ( not ( = ?auto_849537 ?auto_849540 ) ) ( not ( = ?auto_849537 ?auto_849541 ) ) ( not ( = ?auto_849537 ?auto_849542 ) ) ( not ( = ?auto_849537 ?auto_849543 ) ) ( not ( = ?auto_849537 ?auto_849544 ) ) ( not ( = ?auto_849538 ?auto_849539 ) ) ( not ( = ?auto_849538 ?auto_849540 ) ) ( not ( = ?auto_849538 ?auto_849541 ) ) ( not ( = ?auto_849538 ?auto_849542 ) ) ( not ( = ?auto_849538 ?auto_849543 ) ) ( not ( = ?auto_849538 ?auto_849544 ) ) ( not ( = ?auto_849539 ?auto_849540 ) ) ( not ( = ?auto_849539 ?auto_849541 ) ) ( not ( = ?auto_849539 ?auto_849542 ) ) ( not ( = ?auto_849539 ?auto_849543 ) ) ( not ( = ?auto_849539 ?auto_849544 ) ) ( not ( = ?auto_849540 ?auto_849541 ) ) ( not ( = ?auto_849540 ?auto_849542 ) ) ( not ( = ?auto_849540 ?auto_849543 ) ) ( not ( = ?auto_849540 ?auto_849544 ) ) ( not ( = ?auto_849541 ?auto_849542 ) ) ( not ( = ?auto_849541 ?auto_849543 ) ) ( not ( = ?auto_849541 ?auto_849544 ) ) ( not ( = ?auto_849542 ?auto_849543 ) ) ( not ( = ?auto_849542 ?auto_849544 ) ) ( not ( = ?auto_849543 ?auto_849544 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_849543 ?auto_849544 )
      ( !STACK ?auto_849543 ?auto_849542 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_849591 - BLOCK
      ?auto_849592 - BLOCK
      ?auto_849593 - BLOCK
      ?auto_849594 - BLOCK
      ?auto_849595 - BLOCK
      ?auto_849596 - BLOCK
      ?auto_849597 - BLOCK
      ?auto_849598 - BLOCK
      ?auto_849599 - BLOCK
      ?auto_849600 - BLOCK
      ?auto_849601 - BLOCK
      ?auto_849602 - BLOCK
      ?auto_849603 - BLOCK
      ?auto_849604 - BLOCK
      ?auto_849605 - BLOCK
    )
    :vars
    (
      ?auto_849606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_849605 ?auto_849606 ) ( ON-TABLE ?auto_849591 ) ( ON ?auto_849592 ?auto_849591 ) ( ON ?auto_849593 ?auto_849592 ) ( ON ?auto_849594 ?auto_849593 ) ( ON ?auto_849595 ?auto_849594 ) ( ON ?auto_849596 ?auto_849595 ) ( ON ?auto_849597 ?auto_849596 ) ( ON ?auto_849598 ?auto_849597 ) ( ON ?auto_849599 ?auto_849598 ) ( ON ?auto_849600 ?auto_849599 ) ( ON ?auto_849601 ?auto_849600 ) ( ON ?auto_849602 ?auto_849601 ) ( ON ?auto_849603 ?auto_849602 ) ( not ( = ?auto_849591 ?auto_849592 ) ) ( not ( = ?auto_849591 ?auto_849593 ) ) ( not ( = ?auto_849591 ?auto_849594 ) ) ( not ( = ?auto_849591 ?auto_849595 ) ) ( not ( = ?auto_849591 ?auto_849596 ) ) ( not ( = ?auto_849591 ?auto_849597 ) ) ( not ( = ?auto_849591 ?auto_849598 ) ) ( not ( = ?auto_849591 ?auto_849599 ) ) ( not ( = ?auto_849591 ?auto_849600 ) ) ( not ( = ?auto_849591 ?auto_849601 ) ) ( not ( = ?auto_849591 ?auto_849602 ) ) ( not ( = ?auto_849591 ?auto_849603 ) ) ( not ( = ?auto_849591 ?auto_849604 ) ) ( not ( = ?auto_849591 ?auto_849605 ) ) ( not ( = ?auto_849591 ?auto_849606 ) ) ( not ( = ?auto_849592 ?auto_849593 ) ) ( not ( = ?auto_849592 ?auto_849594 ) ) ( not ( = ?auto_849592 ?auto_849595 ) ) ( not ( = ?auto_849592 ?auto_849596 ) ) ( not ( = ?auto_849592 ?auto_849597 ) ) ( not ( = ?auto_849592 ?auto_849598 ) ) ( not ( = ?auto_849592 ?auto_849599 ) ) ( not ( = ?auto_849592 ?auto_849600 ) ) ( not ( = ?auto_849592 ?auto_849601 ) ) ( not ( = ?auto_849592 ?auto_849602 ) ) ( not ( = ?auto_849592 ?auto_849603 ) ) ( not ( = ?auto_849592 ?auto_849604 ) ) ( not ( = ?auto_849592 ?auto_849605 ) ) ( not ( = ?auto_849592 ?auto_849606 ) ) ( not ( = ?auto_849593 ?auto_849594 ) ) ( not ( = ?auto_849593 ?auto_849595 ) ) ( not ( = ?auto_849593 ?auto_849596 ) ) ( not ( = ?auto_849593 ?auto_849597 ) ) ( not ( = ?auto_849593 ?auto_849598 ) ) ( not ( = ?auto_849593 ?auto_849599 ) ) ( not ( = ?auto_849593 ?auto_849600 ) ) ( not ( = ?auto_849593 ?auto_849601 ) ) ( not ( = ?auto_849593 ?auto_849602 ) ) ( not ( = ?auto_849593 ?auto_849603 ) ) ( not ( = ?auto_849593 ?auto_849604 ) ) ( not ( = ?auto_849593 ?auto_849605 ) ) ( not ( = ?auto_849593 ?auto_849606 ) ) ( not ( = ?auto_849594 ?auto_849595 ) ) ( not ( = ?auto_849594 ?auto_849596 ) ) ( not ( = ?auto_849594 ?auto_849597 ) ) ( not ( = ?auto_849594 ?auto_849598 ) ) ( not ( = ?auto_849594 ?auto_849599 ) ) ( not ( = ?auto_849594 ?auto_849600 ) ) ( not ( = ?auto_849594 ?auto_849601 ) ) ( not ( = ?auto_849594 ?auto_849602 ) ) ( not ( = ?auto_849594 ?auto_849603 ) ) ( not ( = ?auto_849594 ?auto_849604 ) ) ( not ( = ?auto_849594 ?auto_849605 ) ) ( not ( = ?auto_849594 ?auto_849606 ) ) ( not ( = ?auto_849595 ?auto_849596 ) ) ( not ( = ?auto_849595 ?auto_849597 ) ) ( not ( = ?auto_849595 ?auto_849598 ) ) ( not ( = ?auto_849595 ?auto_849599 ) ) ( not ( = ?auto_849595 ?auto_849600 ) ) ( not ( = ?auto_849595 ?auto_849601 ) ) ( not ( = ?auto_849595 ?auto_849602 ) ) ( not ( = ?auto_849595 ?auto_849603 ) ) ( not ( = ?auto_849595 ?auto_849604 ) ) ( not ( = ?auto_849595 ?auto_849605 ) ) ( not ( = ?auto_849595 ?auto_849606 ) ) ( not ( = ?auto_849596 ?auto_849597 ) ) ( not ( = ?auto_849596 ?auto_849598 ) ) ( not ( = ?auto_849596 ?auto_849599 ) ) ( not ( = ?auto_849596 ?auto_849600 ) ) ( not ( = ?auto_849596 ?auto_849601 ) ) ( not ( = ?auto_849596 ?auto_849602 ) ) ( not ( = ?auto_849596 ?auto_849603 ) ) ( not ( = ?auto_849596 ?auto_849604 ) ) ( not ( = ?auto_849596 ?auto_849605 ) ) ( not ( = ?auto_849596 ?auto_849606 ) ) ( not ( = ?auto_849597 ?auto_849598 ) ) ( not ( = ?auto_849597 ?auto_849599 ) ) ( not ( = ?auto_849597 ?auto_849600 ) ) ( not ( = ?auto_849597 ?auto_849601 ) ) ( not ( = ?auto_849597 ?auto_849602 ) ) ( not ( = ?auto_849597 ?auto_849603 ) ) ( not ( = ?auto_849597 ?auto_849604 ) ) ( not ( = ?auto_849597 ?auto_849605 ) ) ( not ( = ?auto_849597 ?auto_849606 ) ) ( not ( = ?auto_849598 ?auto_849599 ) ) ( not ( = ?auto_849598 ?auto_849600 ) ) ( not ( = ?auto_849598 ?auto_849601 ) ) ( not ( = ?auto_849598 ?auto_849602 ) ) ( not ( = ?auto_849598 ?auto_849603 ) ) ( not ( = ?auto_849598 ?auto_849604 ) ) ( not ( = ?auto_849598 ?auto_849605 ) ) ( not ( = ?auto_849598 ?auto_849606 ) ) ( not ( = ?auto_849599 ?auto_849600 ) ) ( not ( = ?auto_849599 ?auto_849601 ) ) ( not ( = ?auto_849599 ?auto_849602 ) ) ( not ( = ?auto_849599 ?auto_849603 ) ) ( not ( = ?auto_849599 ?auto_849604 ) ) ( not ( = ?auto_849599 ?auto_849605 ) ) ( not ( = ?auto_849599 ?auto_849606 ) ) ( not ( = ?auto_849600 ?auto_849601 ) ) ( not ( = ?auto_849600 ?auto_849602 ) ) ( not ( = ?auto_849600 ?auto_849603 ) ) ( not ( = ?auto_849600 ?auto_849604 ) ) ( not ( = ?auto_849600 ?auto_849605 ) ) ( not ( = ?auto_849600 ?auto_849606 ) ) ( not ( = ?auto_849601 ?auto_849602 ) ) ( not ( = ?auto_849601 ?auto_849603 ) ) ( not ( = ?auto_849601 ?auto_849604 ) ) ( not ( = ?auto_849601 ?auto_849605 ) ) ( not ( = ?auto_849601 ?auto_849606 ) ) ( not ( = ?auto_849602 ?auto_849603 ) ) ( not ( = ?auto_849602 ?auto_849604 ) ) ( not ( = ?auto_849602 ?auto_849605 ) ) ( not ( = ?auto_849602 ?auto_849606 ) ) ( not ( = ?auto_849603 ?auto_849604 ) ) ( not ( = ?auto_849603 ?auto_849605 ) ) ( not ( = ?auto_849603 ?auto_849606 ) ) ( not ( = ?auto_849604 ?auto_849605 ) ) ( not ( = ?auto_849604 ?auto_849606 ) ) ( not ( = ?auto_849605 ?auto_849606 ) ) ( CLEAR ?auto_849603 ) ( ON ?auto_849604 ?auto_849605 ) ( CLEAR ?auto_849604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_849591 ?auto_849592 ?auto_849593 ?auto_849594 ?auto_849595 ?auto_849596 ?auto_849597 ?auto_849598 ?auto_849599 ?auto_849600 ?auto_849601 ?auto_849602 ?auto_849603 ?auto_849604 )
      ( MAKE-15PILE ?auto_849591 ?auto_849592 ?auto_849593 ?auto_849594 ?auto_849595 ?auto_849596 ?auto_849597 ?auto_849598 ?auto_849599 ?auto_849600 ?auto_849601 ?auto_849602 ?auto_849603 ?auto_849604 ?auto_849605 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_849653 - BLOCK
      ?auto_849654 - BLOCK
      ?auto_849655 - BLOCK
      ?auto_849656 - BLOCK
      ?auto_849657 - BLOCK
      ?auto_849658 - BLOCK
      ?auto_849659 - BLOCK
      ?auto_849660 - BLOCK
      ?auto_849661 - BLOCK
      ?auto_849662 - BLOCK
      ?auto_849663 - BLOCK
      ?auto_849664 - BLOCK
      ?auto_849665 - BLOCK
      ?auto_849666 - BLOCK
      ?auto_849667 - BLOCK
    )
    :vars
    (
      ?auto_849668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_849667 ?auto_849668 ) ( ON-TABLE ?auto_849653 ) ( ON ?auto_849654 ?auto_849653 ) ( ON ?auto_849655 ?auto_849654 ) ( ON ?auto_849656 ?auto_849655 ) ( ON ?auto_849657 ?auto_849656 ) ( ON ?auto_849658 ?auto_849657 ) ( ON ?auto_849659 ?auto_849658 ) ( ON ?auto_849660 ?auto_849659 ) ( ON ?auto_849661 ?auto_849660 ) ( ON ?auto_849662 ?auto_849661 ) ( ON ?auto_849663 ?auto_849662 ) ( ON ?auto_849664 ?auto_849663 ) ( not ( = ?auto_849653 ?auto_849654 ) ) ( not ( = ?auto_849653 ?auto_849655 ) ) ( not ( = ?auto_849653 ?auto_849656 ) ) ( not ( = ?auto_849653 ?auto_849657 ) ) ( not ( = ?auto_849653 ?auto_849658 ) ) ( not ( = ?auto_849653 ?auto_849659 ) ) ( not ( = ?auto_849653 ?auto_849660 ) ) ( not ( = ?auto_849653 ?auto_849661 ) ) ( not ( = ?auto_849653 ?auto_849662 ) ) ( not ( = ?auto_849653 ?auto_849663 ) ) ( not ( = ?auto_849653 ?auto_849664 ) ) ( not ( = ?auto_849653 ?auto_849665 ) ) ( not ( = ?auto_849653 ?auto_849666 ) ) ( not ( = ?auto_849653 ?auto_849667 ) ) ( not ( = ?auto_849653 ?auto_849668 ) ) ( not ( = ?auto_849654 ?auto_849655 ) ) ( not ( = ?auto_849654 ?auto_849656 ) ) ( not ( = ?auto_849654 ?auto_849657 ) ) ( not ( = ?auto_849654 ?auto_849658 ) ) ( not ( = ?auto_849654 ?auto_849659 ) ) ( not ( = ?auto_849654 ?auto_849660 ) ) ( not ( = ?auto_849654 ?auto_849661 ) ) ( not ( = ?auto_849654 ?auto_849662 ) ) ( not ( = ?auto_849654 ?auto_849663 ) ) ( not ( = ?auto_849654 ?auto_849664 ) ) ( not ( = ?auto_849654 ?auto_849665 ) ) ( not ( = ?auto_849654 ?auto_849666 ) ) ( not ( = ?auto_849654 ?auto_849667 ) ) ( not ( = ?auto_849654 ?auto_849668 ) ) ( not ( = ?auto_849655 ?auto_849656 ) ) ( not ( = ?auto_849655 ?auto_849657 ) ) ( not ( = ?auto_849655 ?auto_849658 ) ) ( not ( = ?auto_849655 ?auto_849659 ) ) ( not ( = ?auto_849655 ?auto_849660 ) ) ( not ( = ?auto_849655 ?auto_849661 ) ) ( not ( = ?auto_849655 ?auto_849662 ) ) ( not ( = ?auto_849655 ?auto_849663 ) ) ( not ( = ?auto_849655 ?auto_849664 ) ) ( not ( = ?auto_849655 ?auto_849665 ) ) ( not ( = ?auto_849655 ?auto_849666 ) ) ( not ( = ?auto_849655 ?auto_849667 ) ) ( not ( = ?auto_849655 ?auto_849668 ) ) ( not ( = ?auto_849656 ?auto_849657 ) ) ( not ( = ?auto_849656 ?auto_849658 ) ) ( not ( = ?auto_849656 ?auto_849659 ) ) ( not ( = ?auto_849656 ?auto_849660 ) ) ( not ( = ?auto_849656 ?auto_849661 ) ) ( not ( = ?auto_849656 ?auto_849662 ) ) ( not ( = ?auto_849656 ?auto_849663 ) ) ( not ( = ?auto_849656 ?auto_849664 ) ) ( not ( = ?auto_849656 ?auto_849665 ) ) ( not ( = ?auto_849656 ?auto_849666 ) ) ( not ( = ?auto_849656 ?auto_849667 ) ) ( not ( = ?auto_849656 ?auto_849668 ) ) ( not ( = ?auto_849657 ?auto_849658 ) ) ( not ( = ?auto_849657 ?auto_849659 ) ) ( not ( = ?auto_849657 ?auto_849660 ) ) ( not ( = ?auto_849657 ?auto_849661 ) ) ( not ( = ?auto_849657 ?auto_849662 ) ) ( not ( = ?auto_849657 ?auto_849663 ) ) ( not ( = ?auto_849657 ?auto_849664 ) ) ( not ( = ?auto_849657 ?auto_849665 ) ) ( not ( = ?auto_849657 ?auto_849666 ) ) ( not ( = ?auto_849657 ?auto_849667 ) ) ( not ( = ?auto_849657 ?auto_849668 ) ) ( not ( = ?auto_849658 ?auto_849659 ) ) ( not ( = ?auto_849658 ?auto_849660 ) ) ( not ( = ?auto_849658 ?auto_849661 ) ) ( not ( = ?auto_849658 ?auto_849662 ) ) ( not ( = ?auto_849658 ?auto_849663 ) ) ( not ( = ?auto_849658 ?auto_849664 ) ) ( not ( = ?auto_849658 ?auto_849665 ) ) ( not ( = ?auto_849658 ?auto_849666 ) ) ( not ( = ?auto_849658 ?auto_849667 ) ) ( not ( = ?auto_849658 ?auto_849668 ) ) ( not ( = ?auto_849659 ?auto_849660 ) ) ( not ( = ?auto_849659 ?auto_849661 ) ) ( not ( = ?auto_849659 ?auto_849662 ) ) ( not ( = ?auto_849659 ?auto_849663 ) ) ( not ( = ?auto_849659 ?auto_849664 ) ) ( not ( = ?auto_849659 ?auto_849665 ) ) ( not ( = ?auto_849659 ?auto_849666 ) ) ( not ( = ?auto_849659 ?auto_849667 ) ) ( not ( = ?auto_849659 ?auto_849668 ) ) ( not ( = ?auto_849660 ?auto_849661 ) ) ( not ( = ?auto_849660 ?auto_849662 ) ) ( not ( = ?auto_849660 ?auto_849663 ) ) ( not ( = ?auto_849660 ?auto_849664 ) ) ( not ( = ?auto_849660 ?auto_849665 ) ) ( not ( = ?auto_849660 ?auto_849666 ) ) ( not ( = ?auto_849660 ?auto_849667 ) ) ( not ( = ?auto_849660 ?auto_849668 ) ) ( not ( = ?auto_849661 ?auto_849662 ) ) ( not ( = ?auto_849661 ?auto_849663 ) ) ( not ( = ?auto_849661 ?auto_849664 ) ) ( not ( = ?auto_849661 ?auto_849665 ) ) ( not ( = ?auto_849661 ?auto_849666 ) ) ( not ( = ?auto_849661 ?auto_849667 ) ) ( not ( = ?auto_849661 ?auto_849668 ) ) ( not ( = ?auto_849662 ?auto_849663 ) ) ( not ( = ?auto_849662 ?auto_849664 ) ) ( not ( = ?auto_849662 ?auto_849665 ) ) ( not ( = ?auto_849662 ?auto_849666 ) ) ( not ( = ?auto_849662 ?auto_849667 ) ) ( not ( = ?auto_849662 ?auto_849668 ) ) ( not ( = ?auto_849663 ?auto_849664 ) ) ( not ( = ?auto_849663 ?auto_849665 ) ) ( not ( = ?auto_849663 ?auto_849666 ) ) ( not ( = ?auto_849663 ?auto_849667 ) ) ( not ( = ?auto_849663 ?auto_849668 ) ) ( not ( = ?auto_849664 ?auto_849665 ) ) ( not ( = ?auto_849664 ?auto_849666 ) ) ( not ( = ?auto_849664 ?auto_849667 ) ) ( not ( = ?auto_849664 ?auto_849668 ) ) ( not ( = ?auto_849665 ?auto_849666 ) ) ( not ( = ?auto_849665 ?auto_849667 ) ) ( not ( = ?auto_849665 ?auto_849668 ) ) ( not ( = ?auto_849666 ?auto_849667 ) ) ( not ( = ?auto_849666 ?auto_849668 ) ) ( not ( = ?auto_849667 ?auto_849668 ) ) ( ON ?auto_849666 ?auto_849667 ) ( CLEAR ?auto_849664 ) ( ON ?auto_849665 ?auto_849666 ) ( CLEAR ?auto_849665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_849653 ?auto_849654 ?auto_849655 ?auto_849656 ?auto_849657 ?auto_849658 ?auto_849659 ?auto_849660 ?auto_849661 ?auto_849662 ?auto_849663 ?auto_849664 ?auto_849665 )
      ( MAKE-15PILE ?auto_849653 ?auto_849654 ?auto_849655 ?auto_849656 ?auto_849657 ?auto_849658 ?auto_849659 ?auto_849660 ?auto_849661 ?auto_849662 ?auto_849663 ?auto_849664 ?auto_849665 ?auto_849666 ?auto_849667 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_849715 - BLOCK
      ?auto_849716 - BLOCK
      ?auto_849717 - BLOCK
      ?auto_849718 - BLOCK
      ?auto_849719 - BLOCK
      ?auto_849720 - BLOCK
      ?auto_849721 - BLOCK
      ?auto_849722 - BLOCK
      ?auto_849723 - BLOCK
      ?auto_849724 - BLOCK
      ?auto_849725 - BLOCK
      ?auto_849726 - BLOCK
      ?auto_849727 - BLOCK
      ?auto_849728 - BLOCK
      ?auto_849729 - BLOCK
    )
    :vars
    (
      ?auto_849730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_849729 ?auto_849730 ) ( ON-TABLE ?auto_849715 ) ( ON ?auto_849716 ?auto_849715 ) ( ON ?auto_849717 ?auto_849716 ) ( ON ?auto_849718 ?auto_849717 ) ( ON ?auto_849719 ?auto_849718 ) ( ON ?auto_849720 ?auto_849719 ) ( ON ?auto_849721 ?auto_849720 ) ( ON ?auto_849722 ?auto_849721 ) ( ON ?auto_849723 ?auto_849722 ) ( ON ?auto_849724 ?auto_849723 ) ( ON ?auto_849725 ?auto_849724 ) ( not ( = ?auto_849715 ?auto_849716 ) ) ( not ( = ?auto_849715 ?auto_849717 ) ) ( not ( = ?auto_849715 ?auto_849718 ) ) ( not ( = ?auto_849715 ?auto_849719 ) ) ( not ( = ?auto_849715 ?auto_849720 ) ) ( not ( = ?auto_849715 ?auto_849721 ) ) ( not ( = ?auto_849715 ?auto_849722 ) ) ( not ( = ?auto_849715 ?auto_849723 ) ) ( not ( = ?auto_849715 ?auto_849724 ) ) ( not ( = ?auto_849715 ?auto_849725 ) ) ( not ( = ?auto_849715 ?auto_849726 ) ) ( not ( = ?auto_849715 ?auto_849727 ) ) ( not ( = ?auto_849715 ?auto_849728 ) ) ( not ( = ?auto_849715 ?auto_849729 ) ) ( not ( = ?auto_849715 ?auto_849730 ) ) ( not ( = ?auto_849716 ?auto_849717 ) ) ( not ( = ?auto_849716 ?auto_849718 ) ) ( not ( = ?auto_849716 ?auto_849719 ) ) ( not ( = ?auto_849716 ?auto_849720 ) ) ( not ( = ?auto_849716 ?auto_849721 ) ) ( not ( = ?auto_849716 ?auto_849722 ) ) ( not ( = ?auto_849716 ?auto_849723 ) ) ( not ( = ?auto_849716 ?auto_849724 ) ) ( not ( = ?auto_849716 ?auto_849725 ) ) ( not ( = ?auto_849716 ?auto_849726 ) ) ( not ( = ?auto_849716 ?auto_849727 ) ) ( not ( = ?auto_849716 ?auto_849728 ) ) ( not ( = ?auto_849716 ?auto_849729 ) ) ( not ( = ?auto_849716 ?auto_849730 ) ) ( not ( = ?auto_849717 ?auto_849718 ) ) ( not ( = ?auto_849717 ?auto_849719 ) ) ( not ( = ?auto_849717 ?auto_849720 ) ) ( not ( = ?auto_849717 ?auto_849721 ) ) ( not ( = ?auto_849717 ?auto_849722 ) ) ( not ( = ?auto_849717 ?auto_849723 ) ) ( not ( = ?auto_849717 ?auto_849724 ) ) ( not ( = ?auto_849717 ?auto_849725 ) ) ( not ( = ?auto_849717 ?auto_849726 ) ) ( not ( = ?auto_849717 ?auto_849727 ) ) ( not ( = ?auto_849717 ?auto_849728 ) ) ( not ( = ?auto_849717 ?auto_849729 ) ) ( not ( = ?auto_849717 ?auto_849730 ) ) ( not ( = ?auto_849718 ?auto_849719 ) ) ( not ( = ?auto_849718 ?auto_849720 ) ) ( not ( = ?auto_849718 ?auto_849721 ) ) ( not ( = ?auto_849718 ?auto_849722 ) ) ( not ( = ?auto_849718 ?auto_849723 ) ) ( not ( = ?auto_849718 ?auto_849724 ) ) ( not ( = ?auto_849718 ?auto_849725 ) ) ( not ( = ?auto_849718 ?auto_849726 ) ) ( not ( = ?auto_849718 ?auto_849727 ) ) ( not ( = ?auto_849718 ?auto_849728 ) ) ( not ( = ?auto_849718 ?auto_849729 ) ) ( not ( = ?auto_849718 ?auto_849730 ) ) ( not ( = ?auto_849719 ?auto_849720 ) ) ( not ( = ?auto_849719 ?auto_849721 ) ) ( not ( = ?auto_849719 ?auto_849722 ) ) ( not ( = ?auto_849719 ?auto_849723 ) ) ( not ( = ?auto_849719 ?auto_849724 ) ) ( not ( = ?auto_849719 ?auto_849725 ) ) ( not ( = ?auto_849719 ?auto_849726 ) ) ( not ( = ?auto_849719 ?auto_849727 ) ) ( not ( = ?auto_849719 ?auto_849728 ) ) ( not ( = ?auto_849719 ?auto_849729 ) ) ( not ( = ?auto_849719 ?auto_849730 ) ) ( not ( = ?auto_849720 ?auto_849721 ) ) ( not ( = ?auto_849720 ?auto_849722 ) ) ( not ( = ?auto_849720 ?auto_849723 ) ) ( not ( = ?auto_849720 ?auto_849724 ) ) ( not ( = ?auto_849720 ?auto_849725 ) ) ( not ( = ?auto_849720 ?auto_849726 ) ) ( not ( = ?auto_849720 ?auto_849727 ) ) ( not ( = ?auto_849720 ?auto_849728 ) ) ( not ( = ?auto_849720 ?auto_849729 ) ) ( not ( = ?auto_849720 ?auto_849730 ) ) ( not ( = ?auto_849721 ?auto_849722 ) ) ( not ( = ?auto_849721 ?auto_849723 ) ) ( not ( = ?auto_849721 ?auto_849724 ) ) ( not ( = ?auto_849721 ?auto_849725 ) ) ( not ( = ?auto_849721 ?auto_849726 ) ) ( not ( = ?auto_849721 ?auto_849727 ) ) ( not ( = ?auto_849721 ?auto_849728 ) ) ( not ( = ?auto_849721 ?auto_849729 ) ) ( not ( = ?auto_849721 ?auto_849730 ) ) ( not ( = ?auto_849722 ?auto_849723 ) ) ( not ( = ?auto_849722 ?auto_849724 ) ) ( not ( = ?auto_849722 ?auto_849725 ) ) ( not ( = ?auto_849722 ?auto_849726 ) ) ( not ( = ?auto_849722 ?auto_849727 ) ) ( not ( = ?auto_849722 ?auto_849728 ) ) ( not ( = ?auto_849722 ?auto_849729 ) ) ( not ( = ?auto_849722 ?auto_849730 ) ) ( not ( = ?auto_849723 ?auto_849724 ) ) ( not ( = ?auto_849723 ?auto_849725 ) ) ( not ( = ?auto_849723 ?auto_849726 ) ) ( not ( = ?auto_849723 ?auto_849727 ) ) ( not ( = ?auto_849723 ?auto_849728 ) ) ( not ( = ?auto_849723 ?auto_849729 ) ) ( not ( = ?auto_849723 ?auto_849730 ) ) ( not ( = ?auto_849724 ?auto_849725 ) ) ( not ( = ?auto_849724 ?auto_849726 ) ) ( not ( = ?auto_849724 ?auto_849727 ) ) ( not ( = ?auto_849724 ?auto_849728 ) ) ( not ( = ?auto_849724 ?auto_849729 ) ) ( not ( = ?auto_849724 ?auto_849730 ) ) ( not ( = ?auto_849725 ?auto_849726 ) ) ( not ( = ?auto_849725 ?auto_849727 ) ) ( not ( = ?auto_849725 ?auto_849728 ) ) ( not ( = ?auto_849725 ?auto_849729 ) ) ( not ( = ?auto_849725 ?auto_849730 ) ) ( not ( = ?auto_849726 ?auto_849727 ) ) ( not ( = ?auto_849726 ?auto_849728 ) ) ( not ( = ?auto_849726 ?auto_849729 ) ) ( not ( = ?auto_849726 ?auto_849730 ) ) ( not ( = ?auto_849727 ?auto_849728 ) ) ( not ( = ?auto_849727 ?auto_849729 ) ) ( not ( = ?auto_849727 ?auto_849730 ) ) ( not ( = ?auto_849728 ?auto_849729 ) ) ( not ( = ?auto_849728 ?auto_849730 ) ) ( not ( = ?auto_849729 ?auto_849730 ) ) ( ON ?auto_849728 ?auto_849729 ) ( ON ?auto_849727 ?auto_849728 ) ( CLEAR ?auto_849725 ) ( ON ?auto_849726 ?auto_849727 ) ( CLEAR ?auto_849726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_849715 ?auto_849716 ?auto_849717 ?auto_849718 ?auto_849719 ?auto_849720 ?auto_849721 ?auto_849722 ?auto_849723 ?auto_849724 ?auto_849725 ?auto_849726 )
      ( MAKE-15PILE ?auto_849715 ?auto_849716 ?auto_849717 ?auto_849718 ?auto_849719 ?auto_849720 ?auto_849721 ?auto_849722 ?auto_849723 ?auto_849724 ?auto_849725 ?auto_849726 ?auto_849727 ?auto_849728 ?auto_849729 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_849777 - BLOCK
      ?auto_849778 - BLOCK
      ?auto_849779 - BLOCK
      ?auto_849780 - BLOCK
      ?auto_849781 - BLOCK
      ?auto_849782 - BLOCK
      ?auto_849783 - BLOCK
      ?auto_849784 - BLOCK
      ?auto_849785 - BLOCK
      ?auto_849786 - BLOCK
      ?auto_849787 - BLOCK
      ?auto_849788 - BLOCK
      ?auto_849789 - BLOCK
      ?auto_849790 - BLOCK
      ?auto_849791 - BLOCK
    )
    :vars
    (
      ?auto_849792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_849791 ?auto_849792 ) ( ON-TABLE ?auto_849777 ) ( ON ?auto_849778 ?auto_849777 ) ( ON ?auto_849779 ?auto_849778 ) ( ON ?auto_849780 ?auto_849779 ) ( ON ?auto_849781 ?auto_849780 ) ( ON ?auto_849782 ?auto_849781 ) ( ON ?auto_849783 ?auto_849782 ) ( ON ?auto_849784 ?auto_849783 ) ( ON ?auto_849785 ?auto_849784 ) ( ON ?auto_849786 ?auto_849785 ) ( not ( = ?auto_849777 ?auto_849778 ) ) ( not ( = ?auto_849777 ?auto_849779 ) ) ( not ( = ?auto_849777 ?auto_849780 ) ) ( not ( = ?auto_849777 ?auto_849781 ) ) ( not ( = ?auto_849777 ?auto_849782 ) ) ( not ( = ?auto_849777 ?auto_849783 ) ) ( not ( = ?auto_849777 ?auto_849784 ) ) ( not ( = ?auto_849777 ?auto_849785 ) ) ( not ( = ?auto_849777 ?auto_849786 ) ) ( not ( = ?auto_849777 ?auto_849787 ) ) ( not ( = ?auto_849777 ?auto_849788 ) ) ( not ( = ?auto_849777 ?auto_849789 ) ) ( not ( = ?auto_849777 ?auto_849790 ) ) ( not ( = ?auto_849777 ?auto_849791 ) ) ( not ( = ?auto_849777 ?auto_849792 ) ) ( not ( = ?auto_849778 ?auto_849779 ) ) ( not ( = ?auto_849778 ?auto_849780 ) ) ( not ( = ?auto_849778 ?auto_849781 ) ) ( not ( = ?auto_849778 ?auto_849782 ) ) ( not ( = ?auto_849778 ?auto_849783 ) ) ( not ( = ?auto_849778 ?auto_849784 ) ) ( not ( = ?auto_849778 ?auto_849785 ) ) ( not ( = ?auto_849778 ?auto_849786 ) ) ( not ( = ?auto_849778 ?auto_849787 ) ) ( not ( = ?auto_849778 ?auto_849788 ) ) ( not ( = ?auto_849778 ?auto_849789 ) ) ( not ( = ?auto_849778 ?auto_849790 ) ) ( not ( = ?auto_849778 ?auto_849791 ) ) ( not ( = ?auto_849778 ?auto_849792 ) ) ( not ( = ?auto_849779 ?auto_849780 ) ) ( not ( = ?auto_849779 ?auto_849781 ) ) ( not ( = ?auto_849779 ?auto_849782 ) ) ( not ( = ?auto_849779 ?auto_849783 ) ) ( not ( = ?auto_849779 ?auto_849784 ) ) ( not ( = ?auto_849779 ?auto_849785 ) ) ( not ( = ?auto_849779 ?auto_849786 ) ) ( not ( = ?auto_849779 ?auto_849787 ) ) ( not ( = ?auto_849779 ?auto_849788 ) ) ( not ( = ?auto_849779 ?auto_849789 ) ) ( not ( = ?auto_849779 ?auto_849790 ) ) ( not ( = ?auto_849779 ?auto_849791 ) ) ( not ( = ?auto_849779 ?auto_849792 ) ) ( not ( = ?auto_849780 ?auto_849781 ) ) ( not ( = ?auto_849780 ?auto_849782 ) ) ( not ( = ?auto_849780 ?auto_849783 ) ) ( not ( = ?auto_849780 ?auto_849784 ) ) ( not ( = ?auto_849780 ?auto_849785 ) ) ( not ( = ?auto_849780 ?auto_849786 ) ) ( not ( = ?auto_849780 ?auto_849787 ) ) ( not ( = ?auto_849780 ?auto_849788 ) ) ( not ( = ?auto_849780 ?auto_849789 ) ) ( not ( = ?auto_849780 ?auto_849790 ) ) ( not ( = ?auto_849780 ?auto_849791 ) ) ( not ( = ?auto_849780 ?auto_849792 ) ) ( not ( = ?auto_849781 ?auto_849782 ) ) ( not ( = ?auto_849781 ?auto_849783 ) ) ( not ( = ?auto_849781 ?auto_849784 ) ) ( not ( = ?auto_849781 ?auto_849785 ) ) ( not ( = ?auto_849781 ?auto_849786 ) ) ( not ( = ?auto_849781 ?auto_849787 ) ) ( not ( = ?auto_849781 ?auto_849788 ) ) ( not ( = ?auto_849781 ?auto_849789 ) ) ( not ( = ?auto_849781 ?auto_849790 ) ) ( not ( = ?auto_849781 ?auto_849791 ) ) ( not ( = ?auto_849781 ?auto_849792 ) ) ( not ( = ?auto_849782 ?auto_849783 ) ) ( not ( = ?auto_849782 ?auto_849784 ) ) ( not ( = ?auto_849782 ?auto_849785 ) ) ( not ( = ?auto_849782 ?auto_849786 ) ) ( not ( = ?auto_849782 ?auto_849787 ) ) ( not ( = ?auto_849782 ?auto_849788 ) ) ( not ( = ?auto_849782 ?auto_849789 ) ) ( not ( = ?auto_849782 ?auto_849790 ) ) ( not ( = ?auto_849782 ?auto_849791 ) ) ( not ( = ?auto_849782 ?auto_849792 ) ) ( not ( = ?auto_849783 ?auto_849784 ) ) ( not ( = ?auto_849783 ?auto_849785 ) ) ( not ( = ?auto_849783 ?auto_849786 ) ) ( not ( = ?auto_849783 ?auto_849787 ) ) ( not ( = ?auto_849783 ?auto_849788 ) ) ( not ( = ?auto_849783 ?auto_849789 ) ) ( not ( = ?auto_849783 ?auto_849790 ) ) ( not ( = ?auto_849783 ?auto_849791 ) ) ( not ( = ?auto_849783 ?auto_849792 ) ) ( not ( = ?auto_849784 ?auto_849785 ) ) ( not ( = ?auto_849784 ?auto_849786 ) ) ( not ( = ?auto_849784 ?auto_849787 ) ) ( not ( = ?auto_849784 ?auto_849788 ) ) ( not ( = ?auto_849784 ?auto_849789 ) ) ( not ( = ?auto_849784 ?auto_849790 ) ) ( not ( = ?auto_849784 ?auto_849791 ) ) ( not ( = ?auto_849784 ?auto_849792 ) ) ( not ( = ?auto_849785 ?auto_849786 ) ) ( not ( = ?auto_849785 ?auto_849787 ) ) ( not ( = ?auto_849785 ?auto_849788 ) ) ( not ( = ?auto_849785 ?auto_849789 ) ) ( not ( = ?auto_849785 ?auto_849790 ) ) ( not ( = ?auto_849785 ?auto_849791 ) ) ( not ( = ?auto_849785 ?auto_849792 ) ) ( not ( = ?auto_849786 ?auto_849787 ) ) ( not ( = ?auto_849786 ?auto_849788 ) ) ( not ( = ?auto_849786 ?auto_849789 ) ) ( not ( = ?auto_849786 ?auto_849790 ) ) ( not ( = ?auto_849786 ?auto_849791 ) ) ( not ( = ?auto_849786 ?auto_849792 ) ) ( not ( = ?auto_849787 ?auto_849788 ) ) ( not ( = ?auto_849787 ?auto_849789 ) ) ( not ( = ?auto_849787 ?auto_849790 ) ) ( not ( = ?auto_849787 ?auto_849791 ) ) ( not ( = ?auto_849787 ?auto_849792 ) ) ( not ( = ?auto_849788 ?auto_849789 ) ) ( not ( = ?auto_849788 ?auto_849790 ) ) ( not ( = ?auto_849788 ?auto_849791 ) ) ( not ( = ?auto_849788 ?auto_849792 ) ) ( not ( = ?auto_849789 ?auto_849790 ) ) ( not ( = ?auto_849789 ?auto_849791 ) ) ( not ( = ?auto_849789 ?auto_849792 ) ) ( not ( = ?auto_849790 ?auto_849791 ) ) ( not ( = ?auto_849790 ?auto_849792 ) ) ( not ( = ?auto_849791 ?auto_849792 ) ) ( ON ?auto_849790 ?auto_849791 ) ( ON ?auto_849789 ?auto_849790 ) ( ON ?auto_849788 ?auto_849789 ) ( CLEAR ?auto_849786 ) ( ON ?auto_849787 ?auto_849788 ) ( CLEAR ?auto_849787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_849777 ?auto_849778 ?auto_849779 ?auto_849780 ?auto_849781 ?auto_849782 ?auto_849783 ?auto_849784 ?auto_849785 ?auto_849786 ?auto_849787 )
      ( MAKE-15PILE ?auto_849777 ?auto_849778 ?auto_849779 ?auto_849780 ?auto_849781 ?auto_849782 ?auto_849783 ?auto_849784 ?auto_849785 ?auto_849786 ?auto_849787 ?auto_849788 ?auto_849789 ?auto_849790 ?auto_849791 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_849839 - BLOCK
      ?auto_849840 - BLOCK
      ?auto_849841 - BLOCK
      ?auto_849842 - BLOCK
      ?auto_849843 - BLOCK
      ?auto_849844 - BLOCK
      ?auto_849845 - BLOCK
      ?auto_849846 - BLOCK
      ?auto_849847 - BLOCK
      ?auto_849848 - BLOCK
      ?auto_849849 - BLOCK
      ?auto_849850 - BLOCK
      ?auto_849851 - BLOCK
      ?auto_849852 - BLOCK
      ?auto_849853 - BLOCK
    )
    :vars
    (
      ?auto_849854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_849853 ?auto_849854 ) ( ON-TABLE ?auto_849839 ) ( ON ?auto_849840 ?auto_849839 ) ( ON ?auto_849841 ?auto_849840 ) ( ON ?auto_849842 ?auto_849841 ) ( ON ?auto_849843 ?auto_849842 ) ( ON ?auto_849844 ?auto_849843 ) ( ON ?auto_849845 ?auto_849844 ) ( ON ?auto_849846 ?auto_849845 ) ( ON ?auto_849847 ?auto_849846 ) ( not ( = ?auto_849839 ?auto_849840 ) ) ( not ( = ?auto_849839 ?auto_849841 ) ) ( not ( = ?auto_849839 ?auto_849842 ) ) ( not ( = ?auto_849839 ?auto_849843 ) ) ( not ( = ?auto_849839 ?auto_849844 ) ) ( not ( = ?auto_849839 ?auto_849845 ) ) ( not ( = ?auto_849839 ?auto_849846 ) ) ( not ( = ?auto_849839 ?auto_849847 ) ) ( not ( = ?auto_849839 ?auto_849848 ) ) ( not ( = ?auto_849839 ?auto_849849 ) ) ( not ( = ?auto_849839 ?auto_849850 ) ) ( not ( = ?auto_849839 ?auto_849851 ) ) ( not ( = ?auto_849839 ?auto_849852 ) ) ( not ( = ?auto_849839 ?auto_849853 ) ) ( not ( = ?auto_849839 ?auto_849854 ) ) ( not ( = ?auto_849840 ?auto_849841 ) ) ( not ( = ?auto_849840 ?auto_849842 ) ) ( not ( = ?auto_849840 ?auto_849843 ) ) ( not ( = ?auto_849840 ?auto_849844 ) ) ( not ( = ?auto_849840 ?auto_849845 ) ) ( not ( = ?auto_849840 ?auto_849846 ) ) ( not ( = ?auto_849840 ?auto_849847 ) ) ( not ( = ?auto_849840 ?auto_849848 ) ) ( not ( = ?auto_849840 ?auto_849849 ) ) ( not ( = ?auto_849840 ?auto_849850 ) ) ( not ( = ?auto_849840 ?auto_849851 ) ) ( not ( = ?auto_849840 ?auto_849852 ) ) ( not ( = ?auto_849840 ?auto_849853 ) ) ( not ( = ?auto_849840 ?auto_849854 ) ) ( not ( = ?auto_849841 ?auto_849842 ) ) ( not ( = ?auto_849841 ?auto_849843 ) ) ( not ( = ?auto_849841 ?auto_849844 ) ) ( not ( = ?auto_849841 ?auto_849845 ) ) ( not ( = ?auto_849841 ?auto_849846 ) ) ( not ( = ?auto_849841 ?auto_849847 ) ) ( not ( = ?auto_849841 ?auto_849848 ) ) ( not ( = ?auto_849841 ?auto_849849 ) ) ( not ( = ?auto_849841 ?auto_849850 ) ) ( not ( = ?auto_849841 ?auto_849851 ) ) ( not ( = ?auto_849841 ?auto_849852 ) ) ( not ( = ?auto_849841 ?auto_849853 ) ) ( not ( = ?auto_849841 ?auto_849854 ) ) ( not ( = ?auto_849842 ?auto_849843 ) ) ( not ( = ?auto_849842 ?auto_849844 ) ) ( not ( = ?auto_849842 ?auto_849845 ) ) ( not ( = ?auto_849842 ?auto_849846 ) ) ( not ( = ?auto_849842 ?auto_849847 ) ) ( not ( = ?auto_849842 ?auto_849848 ) ) ( not ( = ?auto_849842 ?auto_849849 ) ) ( not ( = ?auto_849842 ?auto_849850 ) ) ( not ( = ?auto_849842 ?auto_849851 ) ) ( not ( = ?auto_849842 ?auto_849852 ) ) ( not ( = ?auto_849842 ?auto_849853 ) ) ( not ( = ?auto_849842 ?auto_849854 ) ) ( not ( = ?auto_849843 ?auto_849844 ) ) ( not ( = ?auto_849843 ?auto_849845 ) ) ( not ( = ?auto_849843 ?auto_849846 ) ) ( not ( = ?auto_849843 ?auto_849847 ) ) ( not ( = ?auto_849843 ?auto_849848 ) ) ( not ( = ?auto_849843 ?auto_849849 ) ) ( not ( = ?auto_849843 ?auto_849850 ) ) ( not ( = ?auto_849843 ?auto_849851 ) ) ( not ( = ?auto_849843 ?auto_849852 ) ) ( not ( = ?auto_849843 ?auto_849853 ) ) ( not ( = ?auto_849843 ?auto_849854 ) ) ( not ( = ?auto_849844 ?auto_849845 ) ) ( not ( = ?auto_849844 ?auto_849846 ) ) ( not ( = ?auto_849844 ?auto_849847 ) ) ( not ( = ?auto_849844 ?auto_849848 ) ) ( not ( = ?auto_849844 ?auto_849849 ) ) ( not ( = ?auto_849844 ?auto_849850 ) ) ( not ( = ?auto_849844 ?auto_849851 ) ) ( not ( = ?auto_849844 ?auto_849852 ) ) ( not ( = ?auto_849844 ?auto_849853 ) ) ( not ( = ?auto_849844 ?auto_849854 ) ) ( not ( = ?auto_849845 ?auto_849846 ) ) ( not ( = ?auto_849845 ?auto_849847 ) ) ( not ( = ?auto_849845 ?auto_849848 ) ) ( not ( = ?auto_849845 ?auto_849849 ) ) ( not ( = ?auto_849845 ?auto_849850 ) ) ( not ( = ?auto_849845 ?auto_849851 ) ) ( not ( = ?auto_849845 ?auto_849852 ) ) ( not ( = ?auto_849845 ?auto_849853 ) ) ( not ( = ?auto_849845 ?auto_849854 ) ) ( not ( = ?auto_849846 ?auto_849847 ) ) ( not ( = ?auto_849846 ?auto_849848 ) ) ( not ( = ?auto_849846 ?auto_849849 ) ) ( not ( = ?auto_849846 ?auto_849850 ) ) ( not ( = ?auto_849846 ?auto_849851 ) ) ( not ( = ?auto_849846 ?auto_849852 ) ) ( not ( = ?auto_849846 ?auto_849853 ) ) ( not ( = ?auto_849846 ?auto_849854 ) ) ( not ( = ?auto_849847 ?auto_849848 ) ) ( not ( = ?auto_849847 ?auto_849849 ) ) ( not ( = ?auto_849847 ?auto_849850 ) ) ( not ( = ?auto_849847 ?auto_849851 ) ) ( not ( = ?auto_849847 ?auto_849852 ) ) ( not ( = ?auto_849847 ?auto_849853 ) ) ( not ( = ?auto_849847 ?auto_849854 ) ) ( not ( = ?auto_849848 ?auto_849849 ) ) ( not ( = ?auto_849848 ?auto_849850 ) ) ( not ( = ?auto_849848 ?auto_849851 ) ) ( not ( = ?auto_849848 ?auto_849852 ) ) ( not ( = ?auto_849848 ?auto_849853 ) ) ( not ( = ?auto_849848 ?auto_849854 ) ) ( not ( = ?auto_849849 ?auto_849850 ) ) ( not ( = ?auto_849849 ?auto_849851 ) ) ( not ( = ?auto_849849 ?auto_849852 ) ) ( not ( = ?auto_849849 ?auto_849853 ) ) ( not ( = ?auto_849849 ?auto_849854 ) ) ( not ( = ?auto_849850 ?auto_849851 ) ) ( not ( = ?auto_849850 ?auto_849852 ) ) ( not ( = ?auto_849850 ?auto_849853 ) ) ( not ( = ?auto_849850 ?auto_849854 ) ) ( not ( = ?auto_849851 ?auto_849852 ) ) ( not ( = ?auto_849851 ?auto_849853 ) ) ( not ( = ?auto_849851 ?auto_849854 ) ) ( not ( = ?auto_849852 ?auto_849853 ) ) ( not ( = ?auto_849852 ?auto_849854 ) ) ( not ( = ?auto_849853 ?auto_849854 ) ) ( ON ?auto_849852 ?auto_849853 ) ( ON ?auto_849851 ?auto_849852 ) ( ON ?auto_849850 ?auto_849851 ) ( ON ?auto_849849 ?auto_849850 ) ( CLEAR ?auto_849847 ) ( ON ?auto_849848 ?auto_849849 ) ( CLEAR ?auto_849848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_849839 ?auto_849840 ?auto_849841 ?auto_849842 ?auto_849843 ?auto_849844 ?auto_849845 ?auto_849846 ?auto_849847 ?auto_849848 )
      ( MAKE-15PILE ?auto_849839 ?auto_849840 ?auto_849841 ?auto_849842 ?auto_849843 ?auto_849844 ?auto_849845 ?auto_849846 ?auto_849847 ?auto_849848 ?auto_849849 ?auto_849850 ?auto_849851 ?auto_849852 ?auto_849853 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_849901 - BLOCK
      ?auto_849902 - BLOCK
      ?auto_849903 - BLOCK
      ?auto_849904 - BLOCK
      ?auto_849905 - BLOCK
      ?auto_849906 - BLOCK
      ?auto_849907 - BLOCK
      ?auto_849908 - BLOCK
      ?auto_849909 - BLOCK
      ?auto_849910 - BLOCK
      ?auto_849911 - BLOCK
      ?auto_849912 - BLOCK
      ?auto_849913 - BLOCK
      ?auto_849914 - BLOCK
      ?auto_849915 - BLOCK
    )
    :vars
    (
      ?auto_849916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_849915 ?auto_849916 ) ( ON-TABLE ?auto_849901 ) ( ON ?auto_849902 ?auto_849901 ) ( ON ?auto_849903 ?auto_849902 ) ( ON ?auto_849904 ?auto_849903 ) ( ON ?auto_849905 ?auto_849904 ) ( ON ?auto_849906 ?auto_849905 ) ( ON ?auto_849907 ?auto_849906 ) ( ON ?auto_849908 ?auto_849907 ) ( not ( = ?auto_849901 ?auto_849902 ) ) ( not ( = ?auto_849901 ?auto_849903 ) ) ( not ( = ?auto_849901 ?auto_849904 ) ) ( not ( = ?auto_849901 ?auto_849905 ) ) ( not ( = ?auto_849901 ?auto_849906 ) ) ( not ( = ?auto_849901 ?auto_849907 ) ) ( not ( = ?auto_849901 ?auto_849908 ) ) ( not ( = ?auto_849901 ?auto_849909 ) ) ( not ( = ?auto_849901 ?auto_849910 ) ) ( not ( = ?auto_849901 ?auto_849911 ) ) ( not ( = ?auto_849901 ?auto_849912 ) ) ( not ( = ?auto_849901 ?auto_849913 ) ) ( not ( = ?auto_849901 ?auto_849914 ) ) ( not ( = ?auto_849901 ?auto_849915 ) ) ( not ( = ?auto_849901 ?auto_849916 ) ) ( not ( = ?auto_849902 ?auto_849903 ) ) ( not ( = ?auto_849902 ?auto_849904 ) ) ( not ( = ?auto_849902 ?auto_849905 ) ) ( not ( = ?auto_849902 ?auto_849906 ) ) ( not ( = ?auto_849902 ?auto_849907 ) ) ( not ( = ?auto_849902 ?auto_849908 ) ) ( not ( = ?auto_849902 ?auto_849909 ) ) ( not ( = ?auto_849902 ?auto_849910 ) ) ( not ( = ?auto_849902 ?auto_849911 ) ) ( not ( = ?auto_849902 ?auto_849912 ) ) ( not ( = ?auto_849902 ?auto_849913 ) ) ( not ( = ?auto_849902 ?auto_849914 ) ) ( not ( = ?auto_849902 ?auto_849915 ) ) ( not ( = ?auto_849902 ?auto_849916 ) ) ( not ( = ?auto_849903 ?auto_849904 ) ) ( not ( = ?auto_849903 ?auto_849905 ) ) ( not ( = ?auto_849903 ?auto_849906 ) ) ( not ( = ?auto_849903 ?auto_849907 ) ) ( not ( = ?auto_849903 ?auto_849908 ) ) ( not ( = ?auto_849903 ?auto_849909 ) ) ( not ( = ?auto_849903 ?auto_849910 ) ) ( not ( = ?auto_849903 ?auto_849911 ) ) ( not ( = ?auto_849903 ?auto_849912 ) ) ( not ( = ?auto_849903 ?auto_849913 ) ) ( not ( = ?auto_849903 ?auto_849914 ) ) ( not ( = ?auto_849903 ?auto_849915 ) ) ( not ( = ?auto_849903 ?auto_849916 ) ) ( not ( = ?auto_849904 ?auto_849905 ) ) ( not ( = ?auto_849904 ?auto_849906 ) ) ( not ( = ?auto_849904 ?auto_849907 ) ) ( not ( = ?auto_849904 ?auto_849908 ) ) ( not ( = ?auto_849904 ?auto_849909 ) ) ( not ( = ?auto_849904 ?auto_849910 ) ) ( not ( = ?auto_849904 ?auto_849911 ) ) ( not ( = ?auto_849904 ?auto_849912 ) ) ( not ( = ?auto_849904 ?auto_849913 ) ) ( not ( = ?auto_849904 ?auto_849914 ) ) ( not ( = ?auto_849904 ?auto_849915 ) ) ( not ( = ?auto_849904 ?auto_849916 ) ) ( not ( = ?auto_849905 ?auto_849906 ) ) ( not ( = ?auto_849905 ?auto_849907 ) ) ( not ( = ?auto_849905 ?auto_849908 ) ) ( not ( = ?auto_849905 ?auto_849909 ) ) ( not ( = ?auto_849905 ?auto_849910 ) ) ( not ( = ?auto_849905 ?auto_849911 ) ) ( not ( = ?auto_849905 ?auto_849912 ) ) ( not ( = ?auto_849905 ?auto_849913 ) ) ( not ( = ?auto_849905 ?auto_849914 ) ) ( not ( = ?auto_849905 ?auto_849915 ) ) ( not ( = ?auto_849905 ?auto_849916 ) ) ( not ( = ?auto_849906 ?auto_849907 ) ) ( not ( = ?auto_849906 ?auto_849908 ) ) ( not ( = ?auto_849906 ?auto_849909 ) ) ( not ( = ?auto_849906 ?auto_849910 ) ) ( not ( = ?auto_849906 ?auto_849911 ) ) ( not ( = ?auto_849906 ?auto_849912 ) ) ( not ( = ?auto_849906 ?auto_849913 ) ) ( not ( = ?auto_849906 ?auto_849914 ) ) ( not ( = ?auto_849906 ?auto_849915 ) ) ( not ( = ?auto_849906 ?auto_849916 ) ) ( not ( = ?auto_849907 ?auto_849908 ) ) ( not ( = ?auto_849907 ?auto_849909 ) ) ( not ( = ?auto_849907 ?auto_849910 ) ) ( not ( = ?auto_849907 ?auto_849911 ) ) ( not ( = ?auto_849907 ?auto_849912 ) ) ( not ( = ?auto_849907 ?auto_849913 ) ) ( not ( = ?auto_849907 ?auto_849914 ) ) ( not ( = ?auto_849907 ?auto_849915 ) ) ( not ( = ?auto_849907 ?auto_849916 ) ) ( not ( = ?auto_849908 ?auto_849909 ) ) ( not ( = ?auto_849908 ?auto_849910 ) ) ( not ( = ?auto_849908 ?auto_849911 ) ) ( not ( = ?auto_849908 ?auto_849912 ) ) ( not ( = ?auto_849908 ?auto_849913 ) ) ( not ( = ?auto_849908 ?auto_849914 ) ) ( not ( = ?auto_849908 ?auto_849915 ) ) ( not ( = ?auto_849908 ?auto_849916 ) ) ( not ( = ?auto_849909 ?auto_849910 ) ) ( not ( = ?auto_849909 ?auto_849911 ) ) ( not ( = ?auto_849909 ?auto_849912 ) ) ( not ( = ?auto_849909 ?auto_849913 ) ) ( not ( = ?auto_849909 ?auto_849914 ) ) ( not ( = ?auto_849909 ?auto_849915 ) ) ( not ( = ?auto_849909 ?auto_849916 ) ) ( not ( = ?auto_849910 ?auto_849911 ) ) ( not ( = ?auto_849910 ?auto_849912 ) ) ( not ( = ?auto_849910 ?auto_849913 ) ) ( not ( = ?auto_849910 ?auto_849914 ) ) ( not ( = ?auto_849910 ?auto_849915 ) ) ( not ( = ?auto_849910 ?auto_849916 ) ) ( not ( = ?auto_849911 ?auto_849912 ) ) ( not ( = ?auto_849911 ?auto_849913 ) ) ( not ( = ?auto_849911 ?auto_849914 ) ) ( not ( = ?auto_849911 ?auto_849915 ) ) ( not ( = ?auto_849911 ?auto_849916 ) ) ( not ( = ?auto_849912 ?auto_849913 ) ) ( not ( = ?auto_849912 ?auto_849914 ) ) ( not ( = ?auto_849912 ?auto_849915 ) ) ( not ( = ?auto_849912 ?auto_849916 ) ) ( not ( = ?auto_849913 ?auto_849914 ) ) ( not ( = ?auto_849913 ?auto_849915 ) ) ( not ( = ?auto_849913 ?auto_849916 ) ) ( not ( = ?auto_849914 ?auto_849915 ) ) ( not ( = ?auto_849914 ?auto_849916 ) ) ( not ( = ?auto_849915 ?auto_849916 ) ) ( ON ?auto_849914 ?auto_849915 ) ( ON ?auto_849913 ?auto_849914 ) ( ON ?auto_849912 ?auto_849913 ) ( ON ?auto_849911 ?auto_849912 ) ( ON ?auto_849910 ?auto_849911 ) ( CLEAR ?auto_849908 ) ( ON ?auto_849909 ?auto_849910 ) ( CLEAR ?auto_849909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_849901 ?auto_849902 ?auto_849903 ?auto_849904 ?auto_849905 ?auto_849906 ?auto_849907 ?auto_849908 ?auto_849909 )
      ( MAKE-15PILE ?auto_849901 ?auto_849902 ?auto_849903 ?auto_849904 ?auto_849905 ?auto_849906 ?auto_849907 ?auto_849908 ?auto_849909 ?auto_849910 ?auto_849911 ?auto_849912 ?auto_849913 ?auto_849914 ?auto_849915 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_849963 - BLOCK
      ?auto_849964 - BLOCK
      ?auto_849965 - BLOCK
      ?auto_849966 - BLOCK
      ?auto_849967 - BLOCK
      ?auto_849968 - BLOCK
      ?auto_849969 - BLOCK
      ?auto_849970 - BLOCK
      ?auto_849971 - BLOCK
      ?auto_849972 - BLOCK
      ?auto_849973 - BLOCK
      ?auto_849974 - BLOCK
      ?auto_849975 - BLOCK
      ?auto_849976 - BLOCK
      ?auto_849977 - BLOCK
    )
    :vars
    (
      ?auto_849978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_849977 ?auto_849978 ) ( ON-TABLE ?auto_849963 ) ( ON ?auto_849964 ?auto_849963 ) ( ON ?auto_849965 ?auto_849964 ) ( ON ?auto_849966 ?auto_849965 ) ( ON ?auto_849967 ?auto_849966 ) ( ON ?auto_849968 ?auto_849967 ) ( ON ?auto_849969 ?auto_849968 ) ( not ( = ?auto_849963 ?auto_849964 ) ) ( not ( = ?auto_849963 ?auto_849965 ) ) ( not ( = ?auto_849963 ?auto_849966 ) ) ( not ( = ?auto_849963 ?auto_849967 ) ) ( not ( = ?auto_849963 ?auto_849968 ) ) ( not ( = ?auto_849963 ?auto_849969 ) ) ( not ( = ?auto_849963 ?auto_849970 ) ) ( not ( = ?auto_849963 ?auto_849971 ) ) ( not ( = ?auto_849963 ?auto_849972 ) ) ( not ( = ?auto_849963 ?auto_849973 ) ) ( not ( = ?auto_849963 ?auto_849974 ) ) ( not ( = ?auto_849963 ?auto_849975 ) ) ( not ( = ?auto_849963 ?auto_849976 ) ) ( not ( = ?auto_849963 ?auto_849977 ) ) ( not ( = ?auto_849963 ?auto_849978 ) ) ( not ( = ?auto_849964 ?auto_849965 ) ) ( not ( = ?auto_849964 ?auto_849966 ) ) ( not ( = ?auto_849964 ?auto_849967 ) ) ( not ( = ?auto_849964 ?auto_849968 ) ) ( not ( = ?auto_849964 ?auto_849969 ) ) ( not ( = ?auto_849964 ?auto_849970 ) ) ( not ( = ?auto_849964 ?auto_849971 ) ) ( not ( = ?auto_849964 ?auto_849972 ) ) ( not ( = ?auto_849964 ?auto_849973 ) ) ( not ( = ?auto_849964 ?auto_849974 ) ) ( not ( = ?auto_849964 ?auto_849975 ) ) ( not ( = ?auto_849964 ?auto_849976 ) ) ( not ( = ?auto_849964 ?auto_849977 ) ) ( not ( = ?auto_849964 ?auto_849978 ) ) ( not ( = ?auto_849965 ?auto_849966 ) ) ( not ( = ?auto_849965 ?auto_849967 ) ) ( not ( = ?auto_849965 ?auto_849968 ) ) ( not ( = ?auto_849965 ?auto_849969 ) ) ( not ( = ?auto_849965 ?auto_849970 ) ) ( not ( = ?auto_849965 ?auto_849971 ) ) ( not ( = ?auto_849965 ?auto_849972 ) ) ( not ( = ?auto_849965 ?auto_849973 ) ) ( not ( = ?auto_849965 ?auto_849974 ) ) ( not ( = ?auto_849965 ?auto_849975 ) ) ( not ( = ?auto_849965 ?auto_849976 ) ) ( not ( = ?auto_849965 ?auto_849977 ) ) ( not ( = ?auto_849965 ?auto_849978 ) ) ( not ( = ?auto_849966 ?auto_849967 ) ) ( not ( = ?auto_849966 ?auto_849968 ) ) ( not ( = ?auto_849966 ?auto_849969 ) ) ( not ( = ?auto_849966 ?auto_849970 ) ) ( not ( = ?auto_849966 ?auto_849971 ) ) ( not ( = ?auto_849966 ?auto_849972 ) ) ( not ( = ?auto_849966 ?auto_849973 ) ) ( not ( = ?auto_849966 ?auto_849974 ) ) ( not ( = ?auto_849966 ?auto_849975 ) ) ( not ( = ?auto_849966 ?auto_849976 ) ) ( not ( = ?auto_849966 ?auto_849977 ) ) ( not ( = ?auto_849966 ?auto_849978 ) ) ( not ( = ?auto_849967 ?auto_849968 ) ) ( not ( = ?auto_849967 ?auto_849969 ) ) ( not ( = ?auto_849967 ?auto_849970 ) ) ( not ( = ?auto_849967 ?auto_849971 ) ) ( not ( = ?auto_849967 ?auto_849972 ) ) ( not ( = ?auto_849967 ?auto_849973 ) ) ( not ( = ?auto_849967 ?auto_849974 ) ) ( not ( = ?auto_849967 ?auto_849975 ) ) ( not ( = ?auto_849967 ?auto_849976 ) ) ( not ( = ?auto_849967 ?auto_849977 ) ) ( not ( = ?auto_849967 ?auto_849978 ) ) ( not ( = ?auto_849968 ?auto_849969 ) ) ( not ( = ?auto_849968 ?auto_849970 ) ) ( not ( = ?auto_849968 ?auto_849971 ) ) ( not ( = ?auto_849968 ?auto_849972 ) ) ( not ( = ?auto_849968 ?auto_849973 ) ) ( not ( = ?auto_849968 ?auto_849974 ) ) ( not ( = ?auto_849968 ?auto_849975 ) ) ( not ( = ?auto_849968 ?auto_849976 ) ) ( not ( = ?auto_849968 ?auto_849977 ) ) ( not ( = ?auto_849968 ?auto_849978 ) ) ( not ( = ?auto_849969 ?auto_849970 ) ) ( not ( = ?auto_849969 ?auto_849971 ) ) ( not ( = ?auto_849969 ?auto_849972 ) ) ( not ( = ?auto_849969 ?auto_849973 ) ) ( not ( = ?auto_849969 ?auto_849974 ) ) ( not ( = ?auto_849969 ?auto_849975 ) ) ( not ( = ?auto_849969 ?auto_849976 ) ) ( not ( = ?auto_849969 ?auto_849977 ) ) ( not ( = ?auto_849969 ?auto_849978 ) ) ( not ( = ?auto_849970 ?auto_849971 ) ) ( not ( = ?auto_849970 ?auto_849972 ) ) ( not ( = ?auto_849970 ?auto_849973 ) ) ( not ( = ?auto_849970 ?auto_849974 ) ) ( not ( = ?auto_849970 ?auto_849975 ) ) ( not ( = ?auto_849970 ?auto_849976 ) ) ( not ( = ?auto_849970 ?auto_849977 ) ) ( not ( = ?auto_849970 ?auto_849978 ) ) ( not ( = ?auto_849971 ?auto_849972 ) ) ( not ( = ?auto_849971 ?auto_849973 ) ) ( not ( = ?auto_849971 ?auto_849974 ) ) ( not ( = ?auto_849971 ?auto_849975 ) ) ( not ( = ?auto_849971 ?auto_849976 ) ) ( not ( = ?auto_849971 ?auto_849977 ) ) ( not ( = ?auto_849971 ?auto_849978 ) ) ( not ( = ?auto_849972 ?auto_849973 ) ) ( not ( = ?auto_849972 ?auto_849974 ) ) ( not ( = ?auto_849972 ?auto_849975 ) ) ( not ( = ?auto_849972 ?auto_849976 ) ) ( not ( = ?auto_849972 ?auto_849977 ) ) ( not ( = ?auto_849972 ?auto_849978 ) ) ( not ( = ?auto_849973 ?auto_849974 ) ) ( not ( = ?auto_849973 ?auto_849975 ) ) ( not ( = ?auto_849973 ?auto_849976 ) ) ( not ( = ?auto_849973 ?auto_849977 ) ) ( not ( = ?auto_849973 ?auto_849978 ) ) ( not ( = ?auto_849974 ?auto_849975 ) ) ( not ( = ?auto_849974 ?auto_849976 ) ) ( not ( = ?auto_849974 ?auto_849977 ) ) ( not ( = ?auto_849974 ?auto_849978 ) ) ( not ( = ?auto_849975 ?auto_849976 ) ) ( not ( = ?auto_849975 ?auto_849977 ) ) ( not ( = ?auto_849975 ?auto_849978 ) ) ( not ( = ?auto_849976 ?auto_849977 ) ) ( not ( = ?auto_849976 ?auto_849978 ) ) ( not ( = ?auto_849977 ?auto_849978 ) ) ( ON ?auto_849976 ?auto_849977 ) ( ON ?auto_849975 ?auto_849976 ) ( ON ?auto_849974 ?auto_849975 ) ( ON ?auto_849973 ?auto_849974 ) ( ON ?auto_849972 ?auto_849973 ) ( ON ?auto_849971 ?auto_849972 ) ( CLEAR ?auto_849969 ) ( ON ?auto_849970 ?auto_849971 ) ( CLEAR ?auto_849970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_849963 ?auto_849964 ?auto_849965 ?auto_849966 ?auto_849967 ?auto_849968 ?auto_849969 ?auto_849970 )
      ( MAKE-15PILE ?auto_849963 ?auto_849964 ?auto_849965 ?auto_849966 ?auto_849967 ?auto_849968 ?auto_849969 ?auto_849970 ?auto_849971 ?auto_849972 ?auto_849973 ?auto_849974 ?auto_849975 ?auto_849976 ?auto_849977 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_850025 - BLOCK
      ?auto_850026 - BLOCK
      ?auto_850027 - BLOCK
      ?auto_850028 - BLOCK
      ?auto_850029 - BLOCK
      ?auto_850030 - BLOCK
      ?auto_850031 - BLOCK
      ?auto_850032 - BLOCK
      ?auto_850033 - BLOCK
      ?auto_850034 - BLOCK
      ?auto_850035 - BLOCK
      ?auto_850036 - BLOCK
      ?auto_850037 - BLOCK
      ?auto_850038 - BLOCK
      ?auto_850039 - BLOCK
    )
    :vars
    (
      ?auto_850040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_850039 ?auto_850040 ) ( ON-TABLE ?auto_850025 ) ( ON ?auto_850026 ?auto_850025 ) ( ON ?auto_850027 ?auto_850026 ) ( ON ?auto_850028 ?auto_850027 ) ( ON ?auto_850029 ?auto_850028 ) ( ON ?auto_850030 ?auto_850029 ) ( not ( = ?auto_850025 ?auto_850026 ) ) ( not ( = ?auto_850025 ?auto_850027 ) ) ( not ( = ?auto_850025 ?auto_850028 ) ) ( not ( = ?auto_850025 ?auto_850029 ) ) ( not ( = ?auto_850025 ?auto_850030 ) ) ( not ( = ?auto_850025 ?auto_850031 ) ) ( not ( = ?auto_850025 ?auto_850032 ) ) ( not ( = ?auto_850025 ?auto_850033 ) ) ( not ( = ?auto_850025 ?auto_850034 ) ) ( not ( = ?auto_850025 ?auto_850035 ) ) ( not ( = ?auto_850025 ?auto_850036 ) ) ( not ( = ?auto_850025 ?auto_850037 ) ) ( not ( = ?auto_850025 ?auto_850038 ) ) ( not ( = ?auto_850025 ?auto_850039 ) ) ( not ( = ?auto_850025 ?auto_850040 ) ) ( not ( = ?auto_850026 ?auto_850027 ) ) ( not ( = ?auto_850026 ?auto_850028 ) ) ( not ( = ?auto_850026 ?auto_850029 ) ) ( not ( = ?auto_850026 ?auto_850030 ) ) ( not ( = ?auto_850026 ?auto_850031 ) ) ( not ( = ?auto_850026 ?auto_850032 ) ) ( not ( = ?auto_850026 ?auto_850033 ) ) ( not ( = ?auto_850026 ?auto_850034 ) ) ( not ( = ?auto_850026 ?auto_850035 ) ) ( not ( = ?auto_850026 ?auto_850036 ) ) ( not ( = ?auto_850026 ?auto_850037 ) ) ( not ( = ?auto_850026 ?auto_850038 ) ) ( not ( = ?auto_850026 ?auto_850039 ) ) ( not ( = ?auto_850026 ?auto_850040 ) ) ( not ( = ?auto_850027 ?auto_850028 ) ) ( not ( = ?auto_850027 ?auto_850029 ) ) ( not ( = ?auto_850027 ?auto_850030 ) ) ( not ( = ?auto_850027 ?auto_850031 ) ) ( not ( = ?auto_850027 ?auto_850032 ) ) ( not ( = ?auto_850027 ?auto_850033 ) ) ( not ( = ?auto_850027 ?auto_850034 ) ) ( not ( = ?auto_850027 ?auto_850035 ) ) ( not ( = ?auto_850027 ?auto_850036 ) ) ( not ( = ?auto_850027 ?auto_850037 ) ) ( not ( = ?auto_850027 ?auto_850038 ) ) ( not ( = ?auto_850027 ?auto_850039 ) ) ( not ( = ?auto_850027 ?auto_850040 ) ) ( not ( = ?auto_850028 ?auto_850029 ) ) ( not ( = ?auto_850028 ?auto_850030 ) ) ( not ( = ?auto_850028 ?auto_850031 ) ) ( not ( = ?auto_850028 ?auto_850032 ) ) ( not ( = ?auto_850028 ?auto_850033 ) ) ( not ( = ?auto_850028 ?auto_850034 ) ) ( not ( = ?auto_850028 ?auto_850035 ) ) ( not ( = ?auto_850028 ?auto_850036 ) ) ( not ( = ?auto_850028 ?auto_850037 ) ) ( not ( = ?auto_850028 ?auto_850038 ) ) ( not ( = ?auto_850028 ?auto_850039 ) ) ( not ( = ?auto_850028 ?auto_850040 ) ) ( not ( = ?auto_850029 ?auto_850030 ) ) ( not ( = ?auto_850029 ?auto_850031 ) ) ( not ( = ?auto_850029 ?auto_850032 ) ) ( not ( = ?auto_850029 ?auto_850033 ) ) ( not ( = ?auto_850029 ?auto_850034 ) ) ( not ( = ?auto_850029 ?auto_850035 ) ) ( not ( = ?auto_850029 ?auto_850036 ) ) ( not ( = ?auto_850029 ?auto_850037 ) ) ( not ( = ?auto_850029 ?auto_850038 ) ) ( not ( = ?auto_850029 ?auto_850039 ) ) ( not ( = ?auto_850029 ?auto_850040 ) ) ( not ( = ?auto_850030 ?auto_850031 ) ) ( not ( = ?auto_850030 ?auto_850032 ) ) ( not ( = ?auto_850030 ?auto_850033 ) ) ( not ( = ?auto_850030 ?auto_850034 ) ) ( not ( = ?auto_850030 ?auto_850035 ) ) ( not ( = ?auto_850030 ?auto_850036 ) ) ( not ( = ?auto_850030 ?auto_850037 ) ) ( not ( = ?auto_850030 ?auto_850038 ) ) ( not ( = ?auto_850030 ?auto_850039 ) ) ( not ( = ?auto_850030 ?auto_850040 ) ) ( not ( = ?auto_850031 ?auto_850032 ) ) ( not ( = ?auto_850031 ?auto_850033 ) ) ( not ( = ?auto_850031 ?auto_850034 ) ) ( not ( = ?auto_850031 ?auto_850035 ) ) ( not ( = ?auto_850031 ?auto_850036 ) ) ( not ( = ?auto_850031 ?auto_850037 ) ) ( not ( = ?auto_850031 ?auto_850038 ) ) ( not ( = ?auto_850031 ?auto_850039 ) ) ( not ( = ?auto_850031 ?auto_850040 ) ) ( not ( = ?auto_850032 ?auto_850033 ) ) ( not ( = ?auto_850032 ?auto_850034 ) ) ( not ( = ?auto_850032 ?auto_850035 ) ) ( not ( = ?auto_850032 ?auto_850036 ) ) ( not ( = ?auto_850032 ?auto_850037 ) ) ( not ( = ?auto_850032 ?auto_850038 ) ) ( not ( = ?auto_850032 ?auto_850039 ) ) ( not ( = ?auto_850032 ?auto_850040 ) ) ( not ( = ?auto_850033 ?auto_850034 ) ) ( not ( = ?auto_850033 ?auto_850035 ) ) ( not ( = ?auto_850033 ?auto_850036 ) ) ( not ( = ?auto_850033 ?auto_850037 ) ) ( not ( = ?auto_850033 ?auto_850038 ) ) ( not ( = ?auto_850033 ?auto_850039 ) ) ( not ( = ?auto_850033 ?auto_850040 ) ) ( not ( = ?auto_850034 ?auto_850035 ) ) ( not ( = ?auto_850034 ?auto_850036 ) ) ( not ( = ?auto_850034 ?auto_850037 ) ) ( not ( = ?auto_850034 ?auto_850038 ) ) ( not ( = ?auto_850034 ?auto_850039 ) ) ( not ( = ?auto_850034 ?auto_850040 ) ) ( not ( = ?auto_850035 ?auto_850036 ) ) ( not ( = ?auto_850035 ?auto_850037 ) ) ( not ( = ?auto_850035 ?auto_850038 ) ) ( not ( = ?auto_850035 ?auto_850039 ) ) ( not ( = ?auto_850035 ?auto_850040 ) ) ( not ( = ?auto_850036 ?auto_850037 ) ) ( not ( = ?auto_850036 ?auto_850038 ) ) ( not ( = ?auto_850036 ?auto_850039 ) ) ( not ( = ?auto_850036 ?auto_850040 ) ) ( not ( = ?auto_850037 ?auto_850038 ) ) ( not ( = ?auto_850037 ?auto_850039 ) ) ( not ( = ?auto_850037 ?auto_850040 ) ) ( not ( = ?auto_850038 ?auto_850039 ) ) ( not ( = ?auto_850038 ?auto_850040 ) ) ( not ( = ?auto_850039 ?auto_850040 ) ) ( ON ?auto_850038 ?auto_850039 ) ( ON ?auto_850037 ?auto_850038 ) ( ON ?auto_850036 ?auto_850037 ) ( ON ?auto_850035 ?auto_850036 ) ( ON ?auto_850034 ?auto_850035 ) ( ON ?auto_850033 ?auto_850034 ) ( ON ?auto_850032 ?auto_850033 ) ( CLEAR ?auto_850030 ) ( ON ?auto_850031 ?auto_850032 ) ( CLEAR ?auto_850031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_850025 ?auto_850026 ?auto_850027 ?auto_850028 ?auto_850029 ?auto_850030 ?auto_850031 )
      ( MAKE-15PILE ?auto_850025 ?auto_850026 ?auto_850027 ?auto_850028 ?auto_850029 ?auto_850030 ?auto_850031 ?auto_850032 ?auto_850033 ?auto_850034 ?auto_850035 ?auto_850036 ?auto_850037 ?auto_850038 ?auto_850039 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_850087 - BLOCK
      ?auto_850088 - BLOCK
      ?auto_850089 - BLOCK
      ?auto_850090 - BLOCK
      ?auto_850091 - BLOCK
      ?auto_850092 - BLOCK
      ?auto_850093 - BLOCK
      ?auto_850094 - BLOCK
      ?auto_850095 - BLOCK
      ?auto_850096 - BLOCK
      ?auto_850097 - BLOCK
      ?auto_850098 - BLOCK
      ?auto_850099 - BLOCK
      ?auto_850100 - BLOCK
      ?auto_850101 - BLOCK
    )
    :vars
    (
      ?auto_850102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_850101 ?auto_850102 ) ( ON-TABLE ?auto_850087 ) ( ON ?auto_850088 ?auto_850087 ) ( ON ?auto_850089 ?auto_850088 ) ( ON ?auto_850090 ?auto_850089 ) ( ON ?auto_850091 ?auto_850090 ) ( not ( = ?auto_850087 ?auto_850088 ) ) ( not ( = ?auto_850087 ?auto_850089 ) ) ( not ( = ?auto_850087 ?auto_850090 ) ) ( not ( = ?auto_850087 ?auto_850091 ) ) ( not ( = ?auto_850087 ?auto_850092 ) ) ( not ( = ?auto_850087 ?auto_850093 ) ) ( not ( = ?auto_850087 ?auto_850094 ) ) ( not ( = ?auto_850087 ?auto_850095 ) ) ( not ( = ?auto_850087 ?auto_850096 ) ) ( not ( = ?auto_850087 ?auto_850097 ) ) ( not ( = ?auto_850087 ?auto_850098 ) ) ( not ( = ?auto_850087 ?auto_850099 ) ) ( not ( = ?auto_850087 ?auto_850100 ) ) ( not ( = ?auto_850087 ?auto_850101 ) ) ( not ( = ?auto_850087 ?auto_850102 ) ) ( not ( = ?auto_850088 ?auto_850089 ) ) ( not ( = ?auto_850088 ?auto_850090 ) ) ( not ( = ?auto_850088 ?auto_850091 ) ) ( not ( = ?auto_850088 ?auto_850092 ) ) ( not ( = ?auto_850088 ?auto_850093 ) ) ( not ( = ?auto_850088 ?auto_850094 ) ) ( not ( = ?auto_850088 ?auto_850095 ) ) ( not ( = ?auto_850088 ?auto_850096 ) ) ( not ( = ?auto_850088 ?auto_850097 ) ) ( not ( = ?auto_850088 ?auto_850098 ) ) ( not ( = ?auto_850088 ?auto_850099 ) ) ( not ( = ?auto_850088 ?auto_850100 ) ) ( not ( = ?auto_850088 ?auto_850101 ) ) ( not ( = ?auto_850088 ?auto_850102 ) ) ( not ( = ?auto_850089 ?auto_850090 ) ) ( not ( = ?auto_850089 ?auto_850091 ) ) ( not ( = ?auto_850089 ?auto_850092 ) ) ( not ( = ?auto_850089 ?auto_850093 ) ) ( not ( = ?auto_850089 ?auto_850094 ) ) ( not ( = ?auto_850089 ?auto_850095 ) ) ( not ( = ?auto_850089 ?auto_850096 ) ) ( not ( = ?auto_850089 ?auto_850097 ) ) ( not ( = ?auto_850089 ?auto_850098 ) ) ( not ( = ?auto_850089 ?auto_850099 ) ) ( not ( = ?auto_850089 ?auto_850100 ) ) ( not ( = ?auto_850089 ?auto_850101 ) ) ( not ( = ?auto_850089 ?auto_850102 ) ) ( not ( = ?auto_850090 ?auto_850091 ) ) ( not ( = ?auto_850090 ?auto_850092 ) ) ( not ( = ?auto_850090 ?auto_850093 ) ) ( not ( = ?auto_850090 ?auto_850094 ) ) ( not ( = ?auto_850090 ?auto_850095 ) ) ( not ( = ?auto_850090 ?auto_850096 ) ) ( not ( = ?auto_850090 ?auto_850097 ) ) ( not ( = ?auto_850090 ?auto_850098 ) ) ( not ( = ?auto_850090 ?auto_850099 ) ) ( not ( = ?auto_850090 ?auto_850100 ) ) ( not ( = ?auto_850090 ?auto_850101 ) ) ( not ( = ?auto_850090 ?auto_850102 ) ) ( not ( = ?auto_850091 ?auto_850092 ) ) ( not ( = ?auto_850091 ?auto_850093 ) ) ( not ( = ?auto_850091 ?auto_850094 ) ) ( not ( = ?auto_850091 ?auto_850095 ) ) ( not ( = ?auto_850091 ?auto_850096 ) ) ( not ( = ?auto_850091 ?auto_850097 ) ) ( not ( = ?auto_850091 ?auto_850098 ) ) ( not ( = ?auto_850091 ?auto_850099 ) ) ( not ( = ?auto_850091 ?auto_850100 ) ) ( not ( = ?auto_850091 ?auto_850101 ) ) ( not ( = ?auto_850091 ?auto_850102 ) ) ( not ( = ?auto_850092 ?auto_850093 ) ) ( not ( = ?auto_850092 ?auto_850094 ) ) ( not ( = ?auto_850092 ?auto_850095 ) ) ( not ( = ?auto_850092 ?auto_850096 ) ) ( not ( = ?auto_850092 ?auto_850097 ) ) ( not ( = ?auto_850092 ?auto_850098 ) ) ( not ( = ?auto_850092 ?auto_850099 ) ) ( not ( = ?auto_850092 ?auto_850100 ) ) ( not ( = ?auto_850092 ?auto_850101 ) ) ( not ( = ?auto_850092 ?auto_850102 ) ) ( not ( = ?auto_850093 ?auto_850094 ) ) ( not ( = ?auto_850093 ?auto_850095 ) ) ( not ( = ?auto_850093 ?auto_850096 ) ) ( not ( = ?auto_850093 ?auto_850097 ) ) ( not ( = ?auto_850093 ?auto_850098 ) ) ( not ( = ?auto_850093 ?auto_850099 ) ) ( not ( = ?auto_850093 ?auto_850100 ) ) ( not ( = ?auto_850093 ?auto_850101 ) ) ( not ( = ?auto_850093 ?auto_850102 ) ) ( not ( = ?auto_850094 ?auto_850095 ) ) ( not ( = ?auto_850094 ?auto_850096 ) ) ( not ( = ?auto_850094 ?auto_850097 ) ) ( not ( = ?auto_850094 ?auto_850098 ) ) ( not ( = ?auto_850094 ?auto_850099 ) ) ( not ( = ?auto_850094 ?auto_850100 ) ) ( not ( = ?auto_850094 ?auto_850101 ) ) ( not ( = ?auto_850094 ?auto_850102 ) ) ( not ( = ?auto_850095 ?auto_850096 ) ) ( not ( = ?auto_850095 ?auto_850097 ) ) ( not ( = ?auto_850095 ?auto_850098 ) ) ( not ( = ?auto_850095 ?auto_850099 ) ) ( not ( = ?auto_850095 ?auto_850100 ) ) ( not ( = ?auto_850095 ?auto_850101 ) ) ( not ( = ?auto_850095 ?auto_850102 ) ) ( not ( = ?auto_850096 ?auto_850097 ) ) ( not ( = ?auto_850096 ?auto_850098 ) ) ( not ( = ?auto_850096 ?auto_850099 ) ) ( not ( = ?auto_850096 ?auto_850100 ) ) ( not ( = ?auto_850096 ?auto_850101 ) ) ( not ( = ?auto_850096 ?auto_850102 ) ) ( not ( = ?auto_850097 ?auto_850098 ) ) ( not ( = ?auto_850097 ?auto_850099 ) ) ( not ( = ?auto_850097 ?auto_850100 ) ) ( not ( = ?auto_850097 ?auto_850101 ) ) ( not ( = ?auto_850097 ?auto_850102 ) ) ( not ( = ?auto_850098 ?auto_850099 ) ) ( not ( = ?auto_850098 ?auto_850100 ) ) ( not ( = ?auto_850098 ?auto_850101 ) ) ( not ( = ?auto_850098 ?auto_850102 ) ) ( not ( = ?auto_850099 ?auto_850100 ) ) ( not ( = ?auto_850099 ?auto_850101 ) ) ( not ( = ?auto_850099 ?auto_850102 ) ) ( not ( = ?auto_850100 ?auto_850101 ) ) ( not ( = ?auto_850100 ?auto_850102 ) ) ( not ( = ?auto_850101 ?auto_850102 ) ) ( ON ?auto_850100 ?auto_850101 ) ( ON ?auto_850099 ?auto_850100 ) ( ON ?auto_850098 ?auto_850099 ) ( ON ?auto_850097 ?auto_850098 ) ( ON ?auto_850096 ?auto_850097 ) ( ON ?auto_850095 ?auto_850096 ) ( ON ?auto_850094 ?auto_850095 ) ( ON ?auto_850093 ?auto_850094 ) ( CLEAR ?auto_850091 ) ( ON ?auto_850092 ?auto_850093 ) ( CLEAR ?auto_850092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_850087 ?auto_850088 ?auto_850089 ?auto_850090 ?auto_850091 ?auto_850092 )
      ( MAKE-15PILE ?auto_850087 ?auto_850088 ?auto_850089 ?auto_850090 ?auto_850091 ?auto_850092 ?auto_850093 ?auto_850094 ?auto_850095 ?auto_850096 ?auto_850097 ?auto_850098 ?auto_850099 ?auto_850100 ?auto_850101 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_850149 - BLOCK
      ?auto_850150 - BLOCK
      ?auto_850151 - BLOCK
      ?auto_850152 - BLOCK
      ?auto_850153 - BLOCK
      ?auto_850154 - BLOCK
      ?auto_850155 - BLOCK
      ?auto_850156 - BLOCK
      ?auto_850157 - BLOCK
      ?auto_850158 - BLOCK
      ?auto_850159 - BLOCK
      ?auto_850160 - BLOCK
      ?auto_850161 - BLOCK
      ?auto_850162 - BLOCK
      ?auto_850163 - BLOCK
    )
    :vars
    (
      ?auto_850164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_850163 ?auto_850164 ) ( ON-TABLE ?auto_850149 ) ( ON ?auto_850150 ?auto_850149 ) ( ON ?auto_850151 ?auto_850150 ) ( ON ?auto_850152 ?auto_850151 ) ( not ( = ?auto_850149 ?auto_850150 ) ) ( not ( = ?auto_850149 ?auto_850151 ) ) ( not ( = ?auto_850149 ?auto_850152 ) ) ( not ( = ?auto_850149 ?auto_850153 ) ) ( not ( = ?auto_850149 ?auto_850154 ) ) ( not ( = ?auto_850149 ?auto_850155 ) ) ( not ( = ?auto_850149 ?auto_850156 ) ) ( not ( = ?auto_850149 ?auto_850157 ) ) ( not ( = ?auto_850149 ?auto_850158 ) ) ( not ( = ?auto_850149 ?auto_850159 ) ) ( not ( = ?auto_850149 ?auto_850160 ) ) ( not ( = ?auto_850149 ?auto_850161 ) ) ( not ( = ?auto_850149 ?auto_850162 ) ) ( not ( = ?auto_850149 ?auto_850163 ) ) ( not ( = ?auto_850149 ?auto_850164 ) ) ( not ( = ?auto_850150 ?auto_850151 ) ) ( not ( = ?auto_850150 ?auto_850152 ) ) ( not ( = ?auto_850150 ?auto_850153 ) ) ( not ( = ?auto_850150 ?auto_850154 ) ) ( not ( = ?auto_850150 ?auto_850155 ) ) ( not ( = ?auto_850150 ?auto_850156 ) ) ( not ( = ?auto_850150 ?auto_850157 ) ) ( not ( = ?auto_850150 ?auto_850158 ) ) ( not ( = ?auto_850150 ?auto_850159 ) ) ( not ( = ?auto_850150 ?auto_850160 ) ) ( not ( = ?auto_850150 ?auto_850161 ) ) ( not ( = ?auto_850150 ?auto_850162 ) ) ( not ( = ?auto_850150 ?auto_850163 ) ) ( not ( = ?auto_850150 ?auto_850164 ) ) ( not ( = ?auto_850151 ?auto_850152 ) ) ( not ( = ?auto_850151 ?auto_850153 ) ) ( not ( = ?auto_850151 ?auto_850154 ) ) ( not ( = ?auto_850151 ?auto_850155 ) ) ( not ( = ?auto_850151 ?auto_850156 ) ) ( not ( = ?auto_850151 ?auto_850157 ) ) ( not ( = ?auto_850151 ?auto_850158 ) ) ( not ( = ?auto_850151 ?auto_850159 ) ) ( not ( = ?auto_850151 ?auto_850160 ) ) ( not ( = ?auto_850151 ?auto_850161 ) ) ( not ( = ?auto_850151 ?auto_850162 ) ) ( not ( = ?auto_850151 ?auto_850163 ) ) ( not ( = ?auto_850151 ?auto_850164 ) ) ( not ( = ?auto_850152 ?auto_850153 ) ) ( not ( = ?auto_850152 ?auto_850154 ) ) ( not ( = ?auto_850152 ?auto_850155 ) ) ( not ( = ?auto_850152 ?auto_850156 ) ) ( not ( = ?auto_850152 ?auto_850157 ) ) ( not ( = ?auto_850152 ?auto_850158 ) ) ( not ( = ?auto_850152 ?auto_850159 ) ) ( not ( = ?auto_850152 ?auto_850160 ) ) ( not ( = ?auto_850152 ?auto_850161 ) ) ( not ( = ?auto_850152 ?auto_850162 ) ) ( not ( = ?auto_850152 ?auto_850163 ) ) ( not ( = ?auto_850152 ?auto_850164 ) ) ( not ( = ?auto_850153 ?auto_850154 ) ) ( not ( = ?auto_850153 ?auto_850155 ) ) ( not ( = ?auto_850153 ?auto_850156 ) ) ( not ( = ?auto_850153 ?auto_850157 ) ) ( not ( = ?auto_850153 ?auto_850158 ) ) ( not ( = ?auto_850153 ?auto_850159 ) ) ( not ( = ?auto_850153 ?auto_850160 ) ) ( not ( = ?auto_850153 ?auto_850161 ) ) ( not ( = ?auto_850153 ?auto_850162 ) ) ( not ( = ?auto_850153 ?auto_850163 ) ) ( not ( = ?auto_850153 ?auto_850164 ) ) ( not ( = ?auto_850154 ?auto_850155 ) ) ( not ( = ?auto_850154 ?auto_850156 ) ) ( not ( = ?auto_850154 ?auto_850157 ) ) ( not ( = ?auto_850154 ?auto_850158 ) ) ( not ( = ?auto_850154 ?auto_850159 ) ) ( not ( = ?auto_850154 ?auto_850160 ) ) ( not ( = ?auto_850154 ?auto_850161 ) ) ( not ( = ?auto_850154 ?auto_850162 ) ) ( not ( = ?auto_850154 ?auto_850163 ) ) ( not ( = ?auto_850154 ?auto_850164 ) ) ( not ( = ?auto_850155 ?auto_850156 ) ) ( not ( = ?auto_850155 ?auto_850157 ) ) ( not ( = ?auto_850155 ?auto_850158 ) ) ( not ( = ?auto_850155 ?auto_850159 ) ) ( not ( = ?auto_850155 ?auto_850160 ) ) ( not ( = ?auto_850155 ?auto_850161 ) ) ( not ( = ?auto_850155 ?auto_850162 ) ) ( not ( = ?auto_850155 ?auto_850163 ) ) ( not ( = ?auto_850155 ?auto_850164 ) ) ( not ( = ?auto_850156 ?auto_850157 ) ) ( not ( = ?auto_850156 ?auto_850158 ) ) ( not ( = ?auto_850156 ?auto_850159 ) ) ( not ( = ?auto_850156 ?auto_850160 ) ) ( not ( = ?auto_850156 ?auto_850161 ) ) ( not ( = ?auto_850156 ?auto_850162 ) ) ( not ( = ?auto_850156 ?auto_850163 ) ) ( not ( = ?auto_850156 ?auto_850164 ) ) ( not ( = ?auto_850157 ?auto_850158 ) ) ( not ( = ?auto_850157 ?auto_850159 ) ) ( not ( = ?auto_850157 ?auto_850160 ) ) ( not ( = ?auto_850157 ?auto_850161 ) ) ( not ( = ?auto_850157 ?auto_850162 ) ) ( not ( = ?auto_850157 ?auto_850163 ) ) ( not ( = ?auto_850157 ?auto_850164 ) ) ( not ( = ?auto_850158 ?auto_850159 ) ) ( not ( = ?auto_850158 ?auto_850160 ) ) ( not ( = ?auto_850158 ?auto_850161 ) ) ( not ( = ?auto_850158 ?auto_850162 ) ) ( not ( = ?auto_850158 ?auto_850163 ) ) ( not ( = ?auto_850158 ?auto_850164 ) ) ( not ( = ?auto_850159 ?auto_850160 ) ) ( not ( = ?auto_850159 ?auto_850161 ) ) ( not ( = ?auto_850159 ?auto_850162 ) ) ( not ( = ?auto_850159 ?auto_850163 ) ) ( not ( = ?auto_850159 ?auto_850164 ) ) ( not ( = ?auto_850160 ?auto_850161 ) ) ( not ( = ?auto_850160 ?auto_850162 ) ) ( not ( = ?auto_850160 ?auto_850163 ) ) ( not ( = ?auto_850160 ?auto_850164 ) ) ( not ( = ?auto_850161 ?auto_850162 ) ) ( not ( = ?auto_850161 ?auto_850163 ) ) ( not ( = ?auto_850161 ?auto_850164 ) ) ( not ( = ?auto_850162 ?auto_850163 ) ) ( not ( = ?auto_850162 ?auto_850164 ) ) ( not ( = ?auto_850163 ?auto_850164 ) ) ( ON ?auto_850162 ?auto_850163 ) ( ON ?auto_850161 ?auto_850162 ) ( ON ?auto_850160 ?auto_850161 ) ( ON ?auto_850159 ?auto_850160 ) ( ON ?auto_850158 ?auto_850159 ) ( ON ?auto_850157 ?auto_850158 ) ( ON ?auto_850156 ?auto_850157 ) ( ON ?auto_850155 ?auto_850156 ) ( ON ?auto_850154 ?auto_850155 ) ( CLEAR ?auto_850152 ) ( ON ?auto_850153 ?auto_850154 ) ( CLEAR ?auto_850153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_850149 ?auto_850150 ?auto_850151 ?auto_850152 ?auto_850153 )
      ( MAKE-15PILE ?auto_850149 ?auto_850150 ?auto_850151 ?auto_850152 ?auto_850153 ?auto_850154 ?auto_850155 ?auto_850156 ?auto_850157 ?auto_850158 ?auto_850159 ?auto_850160 ?auto_850161 ?auto_850162 ?auto_850163 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_850211 - BLOCK
      ?auto_850212 - BLOCK
      ?auto_850213 - BLOCK
      ?auto_850214 - BLOCK
      ?auto_850215 - BLOCK
      ?auto_850216 - BLOCK
      ?auto_850217 - BLOCK
      ?auto_850218 - BLOCK
      ?auto_850219 - BLOCK
      ?auto_850220 - BLOCK
      ?auto_850221 - BLOCK
      ?auto_850222 - BLOCK
      ?auto_850223 - BLOCK
      ?auto_850224 - BLOCK
      ?auto_850225 - BLOCK
    )
    :vars
    (
      ?auto_850226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_850225 ?auto_850226 ) ( ON-TABLE ?auto_850211 ) ( ON ?auto_850212 ?auto_850211 ) ( ON ?auto_850213 ?auto_850212 ) ( not ( = ?auto_850211 ?auto_850212 ) ) ( not ( = ?auto_850211 ?auto_850213 ) ) ( not ( = ?auto_850211 ?auto_850214 ) ) ( not ( = ?auto_850211 ?auto_850215 ) ) ( not ( = ?auto_850211 ?auto_850216 ) ) ( not ( = ?auto_850211 ?auto_850217 ) ) ( not ( = ?auto_850211 ?auto_850218 ) ) ( not ( = ?auto_850211 ?auto_850219 ) ) ( not ( = ?auto_850211 ?auto_850220 ) ) ( not ( = ?auto_850211 ?auto_850221 ) ) ( not ( = ?auto_850211 ?auto_850222 ) ) ( not ( = ?auto_850211 ?auto_850223 ) ) ( not ( = ?auto_850211 ?auto_850224 ) ) ( not ( = ?auto_850211 ?auto_850225 ) ) ( not ( = ?auto_850211 ?auto_850226 ) ) ( not ( = ?auto_850212 ?auto_850213 ) ) ( not ( = ?auto_850212 ?auto_850214 ) ) ( not ( = ?auto_850212 ?auto_850215 ) ) ( not ( = ?auto_850212 ?auto_850216 ) ) ( not ( = ?auto_850212 ?auto_850217 ) ) ( not ( = ?auto_850212 ?auto_850218 ) ) ( not ( = ?auto_850212 ?auto_850219 ) ) ( not ( = ?auto_850212 ?auto_850220 ) ) ( not ( = ?auto_850212 ?auto_850221 ) ) ( not ( = ?auto_850212 ?auto_850222 ) ) ( not ( = ?auto_850212 ?auto_850223 ) ) ( not ( = ?auto_850212 ?auto_850224 ) ) ( not ( = ?auto_850212 ?auto_850225 ) ) ( not ( = ?auto_850212 ?auto_850226 ) ) ( not ( = ?auto_850213 ?auto_850214 ) ) ( not ( = ?auto_850213 ?auto_850215 ) ) ( not ( = ?auto_850213 ?auto_850216 ) ) ( not ( = ?auto_850213 ?auto_850217 ) ) ( not ( = ?auto_850213 ?auto_850218 ) ) ( not ( = ?auto_850213 ?auto_850219 ) ) ( not ( = ?auto_850213 ?auto_850220 ) ) ( not ( = ?auto_850213 ?auto_850221 ) ) ( not ( = ?auto_850213 ?auto_850222 ) ) ( not ( = ?auto_850213 ?auto_850223 ) ) ( not ( = ?auto_850213 ?auto_850224 ) ) ( not ( = ?auto_850213 ?auto_850225 ) ) ( not ( = ?auto_850213 ?auto_850226 ) ) ( not ( = ?auto_850214 ?auto_850215 ) ) ( not ( = ?auto_850214 ?auto_850216 ) ) ( not ( = ?auto_850214 ?auto_850217 ) ) ( not ( = ?auto_850214 ?auto_850218 ) ) ( not ( = ?auto_850214 ?auto_850219 ) ) ( not ( = ?auto_850214 ?auto_850220 ) ) ( not ( = ?auto_850214 ?auto_850221 ) ) ( not ( = ?auto_850214 ?auto_850222 ) ) ( not ( = ?auto_850214 ?auto_850223 ) ) ( not ( = ?auto_850214 ?auto_850224 ) ) ( not ( = ?auto_850214 ?auto_850225 ) ) ( not ( = ?auto_850214 ?auto_850226 ) ) ( not ( = ?auto_850215 ?auto_850216 ) ) ( not ( = ?auto_850215 ?auto_850217 ) ) ( not ( = ?auto_850215 ?auto_850218 ) ) ( not ( = ?auto_850215 ?auto_850219 ) ) ( not ( = ?auto_850215 ?auto_850220 ) ) ( not ( = ?auto_850215 ?auto_850221 ) ) ( not ( = ?auto_850215 ?auto_850222 ) ) ( not ( = ?auto_850215 ?auto_850223 ) ) ( not ( = ?auto_850215 ?auto_850224 ) ) ( not ( = ?auto_850215 ?auto_850225 ) ) ( not ( = ?auto_850215 ?auto_850226 ) ) ( not ( = ?auto_850216 ?auto_850217 ) ) ( not ( = ?auto_850216 ?auto_850218 ) ) ( not ( = ?auto_850216 ?auto_850219 ) ) ( not ( = ?auto_850216 ?auto_850220 ) ) ( not ( = ?auto_850216 ?auto_850221 ) ) ( not ( = ?auto_850216 ?auto_850222 ) ) ( not ( = ?auto_850216 ?auto_850223 ) ) ( not ( = ?auto_850216 ?auto_850224 ) ) ( not ( = ?auto_850216 ?auto_850225 ) ) ( not ( = ?auto_850216 ?auto_850226 ) ) ( not ( = ?auto_850217 ?auto_850218 ) ) ( not ( = ?auto_850217 ?auto_850219 ) ) ( not ( = ?auto_850217 ?auto_850220 ) ) ( not ( = ?auto_850217 ?auto_850221 ) ) ( not ( = ?auto_850217 ?auto_850222 ) ) ( not ( = ?auto_850217 ?auto_850223 ) ) ( not ( = ?auto_850217 ?auto_850224 ) ) ( not ( = ?auto_850217 ?auto_850225 ) ) ( not ( = ?auto_850217 ?auto_850226 ) ) ( not ( = ?auto_850218 ?auto_850219 ) ) ( not ( = ?auto_850218 ?auto_850220 ) ) ( not ( = ?auto_850218 ?auto_850221 ) ) ( not ( = ?auto_850218 ?auto_850222 ) ) ( not ( = ?auto_850218 ?auto_850223 ) ) ( not ( = ?auto_850218 ?auto_850224 ) ) ( not ( = ?auto_850218 ?auto_850225 ) ) ( not ( = ?auto_850218 ?auto_850226 ) ) ( not ( = ?auto_850219 ?auto_850220 ) ) ( not ( = ?auto_850219 ?auto_850221 ) ) ( not ( = ?auto_850219 ?auto_850222 ) ) ( not ( = ?auto_850219 ?auto_850223 ) ) ( not ( = ?auto_850219 ?auto_850224 ) ) ( not ( = ?auto_850219 ?auto_850225 ) ) ( not ( = ?auto_850219 ?auto_850226 ) ) ( not ( = ?auto_850220 ?auto_850221 ) ) ( not ( = ?auto_850220 ?auto_850222 ) ) ( not ( = ?auto_850220 ?auto_850223 ) ) ( not ( = ?auto_850220 ?auto_850224 ) ) ( not ( = ?auto_850220 ?auto_850225 ) ) ( not ( = ?auto_850220 ?auto_850226 ) ) ( not ( = ?auto_850221 ?auto_850222 ) ) ( not ( = ?auto_850221 ?auto_850223 ) ) ( not ( = ?auto_850221 ?auto_850224 ) ) ( not ( = ?auto_850221 ?auto_850225 ) ) ( not ( = ?auto_850221 ?auto_850226 ) ) ( not ( = ?auto_850222 ?auto_850223 ) ) ( not ( = ?auto_850222 ?auto_850224 ) ) ( not ( = ?auto_850222 ?auto_850225 ) ) ( not ( = ?auto_850222 ?auto_850226 ) ) ( not ( = ?auto_850223 ?auto_850224 ) ) ( not ( = ?auto_850223 ?auto_850225 ) ) ( not ( = ?auto_850223 ?auto_850226 ) ) ( not ( = ?auto_850224 ?auto_850225 ) ) ( not ( = ?auto_850224 ?auto_850226 ) ) ( not ( = ?auto_850225 ?auto_850226 ) ) ( ON ?auto_850224 ?auto_850225 ) ( ON ?auto_850223 ?auto_850224 ) ( ON ?auto_850222 ?auto_850223 ) ( ON ?auto_850221 ?auto_850222 ) ( ON ?auto_850220 ?auto_850221 ) ( ON ?auto_850219 ?auto_850220 ) ( ON ?auto_850218 ?auto_850219 ) ( ON ?auto_850217 ?auto_850218 ) ( ON ?auto_850216 ?auto_850217 ) ( ON ?auto_850215 ?auto_850216 ) ( CLEAR ?auto_850213 ) ( ON ?auto_850214 ?auto_850215 ) ( CLEAR ?auto_850214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_850211 ?auto_850212 ?auto_850213 ?auto_850214 )
      ( MAKE-15PILE ?auto_850211 ?auto_850212 ?auto_850213 ?auto_850214 ?auto_850215 ?auto_850216 ?auto_850217 ?auto_850218 ?auto_850219 ?auto_850220 ?auto_850221 ?auto_850222 ?auto_850223 ?auto_850224 ?auto_850225 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_850273 - BLOCK
      ?auto_850274 - BLOCK
      ?auto_850275 - BLOCK
      ?auto_850276 - BLOCK
      ?auto_850277 - BLOCK
      ?auto_850278 - BLOCK
      ?auto_850279 - BLOCK
      ?auto_850280 - BLOCK
      ?auto_850281 - BLOCK
      ?auto_850282 - BLOCK
      ?auto_850283 - BLOCK
      ?auto_850284 - BLOCK
      ?auto_850285 - BLOCK
      ?auto_850286 - BLOCK
      ?auto_850287 - BLOCK
    )
    :vars
    (
      ?auto_850288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_850287 ?auto_850288 ) ( ON-TABLE ?auto_850273 ) ( ON ?auto_850274 ?auto_850273 ) ( not ( = ?auto_850273 ?auto_850274 ) ) ( not ( = ?auto_850273 ?auto_850275 ) ) ( not ( = ?auto_850273 ?auto_850276 ) ) ( not ( = ?auto_850273 ?auto_850277 ) ) ( not ( = ?auto_850273 ?auto_850278 ) ) ( not ( = ?auto_850273 ?auto_850279 ) ) ( not ( = ?auto_850273 ?auto_850280 ) ) ( not ( = ?auto_850273 ?auto_850281 ) ) ( not ( = ?auto_850273 ?auto_850282 ) ) ( not ( = ?auto_850273 ?auto_850283 ) ) ( not ( = ?auto_850273 ?auto_850284 ) ) ( not ( = ?auto_850273 ?auto_850285 ) ) ( not ( = ?auto_850273 ?auto_850286 ) ) ( not ( = ?auto_850273 ?auto_850287 ) ) ( not ( = ?auto_850273 ?auto_850288 ) ) ( not ( = ?auto_850274 ?auto_850275 ) ) ( not ( = ?auto_850274 ?auto_850276 ) ) ( not ( = ?auto_850274 ?auto_850277 ) ) ( not ( = ?auto_850274 ?auto_850278 ) ) ( not ( = ?auto_850274 ?auto_850279 ) ) ( not ( = ?auto_850274 ?auto_850280 ) ) ( not ( = ?auto_850274 ?auto_850281 ) ) ( not ( = ?auto_850274 ?auto_850282 ) ) ( not ( = ?auto_850274 ?auto_850283 ) ) ( not ( = ?auto_850274 ?auto_850284 ) ) ( not ( = ?auto_850274 ?auto_850285 ) ) ( not ( = ?auto_850274 ?auto_850286 ) ) ( not ( = ?auto_850274 ?auto_850287 ) ) ( not ( = ?auto_850274 ?auto_850288 ) ) ( not ( = ?auto_850275 ?auto_850276 ) ) ( not ( = ?auto_850275 ?auto_850277 ) ) ( not ( = ?auto_850275 ?auto_850278 ) ) ( not ( = ?auto_850275 ?auto_850279 ) ) ( not ( = ?auto_850275 ?auto_850280 ) ) ( not ( = ?auto_850275 ?auto_850281 ) ) ( not ( = ?auto_850275 ?auto_850282 ) ) ( not ( = ?auto_850275 ?auto_850283 ) ) ( not ( = ?auto_850275 ?auto_850284 ) ) ( not ( = ?auto_850275 ?auto_850285 ) ) ( not ( = ?auto_850275 ?auto_850286 ) ) ( not ( = ?auto_850275 ?auto_850287 ) ) ( not ( = ?auto_850275 ?auto_850288 ) ) ( not ( = ?auto_850276 ?auto_850277 ) ) ( not ( = ?auto_850276 ?auto_850278 ) ) ( not ( = ?auto_850276 ?auto_850279 ) ) ( not ( = ?auto_850276 ?auto_850280 ) ) ( not ( = ?auto_850276 ?auto_850281 ) ) ( not ( = ?auto_850276 ?auto_850282 ) ) ( not ( = ?auto_850276 ?auto_850283 ) ) ( not ( = ?auto_850276 ?auto_850284 ) ) ( not ( = ?auto_850276 ?auto_850285 ) ) ( not ( = ?auto_850276 ?auto_850286 ) ) ( not ( = ?auto_850276 ?auto_850287 ) ) ( not ( = ?auto_850276 ?auto_850288 ) ) ( not ( = ?auto_850277 ?auto_850278 ) ) ( not ( = ?auto_850277 ?auto_850279 ) ) ( not ( = ?auto_850277 ?auto_850280 ) ) ( not ( = ?auto_850277 ?auto_850281 ) ) ( not ( = ?auto_850277 ?auto_850282 ) ) ( not ( = ?auto_850277 ?auto_850283 ) ) ( not ( = ?auto_850277 ?auto_850284 ) ) ( not ( = ?auto_850277 ?auto_850285 ) ) ( not ( = ?auto_850277 ?auto_850286 ) ) ( not ( = ?auto_850277 ?auto_850287 ) ) ( not ( = ?auto_850277 ?auto_850288 ) ) ( not ( = ?auto_850278 ?auto_850279 ) ) ( not ( = ?auto_850278 ?auto_850280 ) ) ( not ( = ?auto_850278 ?auto_850281 ) ) ( not ( = ?auto_850278 ?auto_850282 ) ) ( not ( = ?auto_850278 ?auto_850283 ) ) ( not ( = ?auto_850278 ?auto_850284 ) ) ( not ( = ?auto_850278 ?auto_850285 ) ) ( not ( = ?auto_850278 ?auto_850286 ) ) ( not ( = ?auto_850278 ?auto_850287 ) ) ( not ( = ?auto_850278 ?auto_850288 ) ) ( not ( = ?auto_850279 ?auto_850280 ) ) ( not ( = ?auto_850279 ?auto_850281 ) ) ( not ( = ?auto_850279 ?auto_850282 ) ) ( not ( = ?auto_850279 ?auto_850283 ) ) ( not ( = ?auto_850279 ?auto_850284 ) ) ( not ( = ?auto_850279 ?auto_850285 ) ) ( not ( = ?auto_850279 ?auto_850286 ) ) ( not ( = ?auto_850279 ?auto_850287 ) ) ( not ( = ?auto_850279 ?auto_850288 ) ) ( not ( = ?auto_850280 ?auto_850281 ) ) ( not ( = ?auto_850280 ?auto_850282 ) ) ( not ( = ?auto_850280 ?auto_850283 ) ) ( not ( = ?auto_850280 ?auto_850284 ) ) ( not ( = ?auto_850280 ?auto_850285 ) ) ( not ( = ?auto_850280 ?auto_850286 ) ) ( not ( = ?auto_850280 ?auto_850287 ) ) ( not ( = ?auto_850280 ?auto_850288 ) ) ( not ( = ?auto_850281 ?auto_850282 ) ) ( not ( = ?auto_850281 ?auto_850283 ) ) ( not ( = ?auto_850281 ?auto_850284 ) ) ( not ( = ?auto_850281 ?auto_850285 ) ) ( not ( = ?auto_850281 ?auto_850286 ) ) ( not ( = ?auto_850281 ?auto_850287 ) ) ( not ( = ?auto_850281 ?auto_850288 ) ) ( not ( = ?auto_850282 ?auto_850283 ) ) ( not ( = ?auto_850282 ?auto_850284 ) ) ( not ( = ?auto_850282 ?auto_850285 ) ) ( not ( = ?auto_850282 ?auto_850286 ) ) ( not ( = ?auto_850282 ?auto_850287 ) ) ( not ( = ?auto_850282 ?auto_850288 ) ) ( not ( = ?auto_850283 ?auto_850284 ) ) ( not ( = ?auto_850283 ?auto_850285 ) ) ( not ( = ?auto_850283 ?auto_850286 ) ) ( not ( = ?auto_850283 ?auto_850287 ) ) ( not ( = ?auto_850283 ?auto_850288 ) ) ( not ( = ?auto_850284 ?auto_850285 ) ) ( not ( = ?auto_850284 ?auto_850286 ) ) ( not ( = ?auto_850284 ?auto_850287 ) ) ( not ( = ?auto_850284 ?auto_850288 ) ) ( not ( = ?auto_850285 ?auto_850286 ) ) ( not ( = ?auto_850285 ?auto_850287 ) ) ( not ( = ?auto_850285 ?auto_850288 ) ) ( not ( = ?auto_850286 ?auto_850287 ) ) ( not ( = ?auto_850286 ?auto_850288 ) ) ( not ( = ?auto_850287 ?auto_850288 ) ) ( ON ?auto_850286 ?auto_850287 ) ( ON ?auto_850285 ?auto_850286 ) ( ON ?auto_850284 ?auto_850285 ) ( ON ?auto_850283 ?auto_850284 ) ( ON ?auto_850282 ?auto_850283 ) ( ON ?auto_850281 ?auto_850282 ) ( ON ?auto_850280 ?auto_850281 ) ( ON ?auto_850279 ?auto_850280 ) ( ON ?auto_850278 ?auto_850279 ) ( ON ?auto_850277 ?auto_850278 ) ( ON ?auto_850276 ?auto_850277 ) ( CLEAR ?auto_850274 ) ( ON ?auto_850275 ?auto_850276 ) ( CLEAR ?auto_850275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_850273 ?auto_850274 ?auto_850275 )
      ( MAKE-15PILE ?auto_850273 ?auto_850274 ?auto_850275 ?auto_850276 ?auto_850277 ?auto_850278 ?auto_850279 ?auto_850280 ?auto_850281 ?auto_850282 ?auto_850283 ?auto_850284 ?auto_850285 ?auto_850286 ?auto_850287 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_850335 - BLOCK
      ?auto_850336 - BLOCK
      ?auto_850337 - BLOCK
      ?auto_850338 - BLOCK
      ?auto_850339 - BLOCK
      ?auto_850340 - BLOCK
      ?auto_850341 - BLOCK
      ?auto_850342 - BLOCK
      ?auto_850343 - BLOCK
      ?auto_850344 - BLOCK
      ?auto_850345 - BLOCK
      ?auto_850346 - BLOCK
      ?auto_850347 - BLOCK
      ?auto_850348 - BLOCK
      ?auto_850349 - BLOCK
    )
    :vars
    (
      ?auto_850350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_850349 ?auto_850350 ) ( ON-TABLE ?auto_850335 ) ( not ( = ?auto_850335 ?auto_850336 ) ) ( not ( = ?auto_850335 ?auto_850337 ) ) ( not ( = ?auto_850335 ?auto_850338 ) ) ( not ( = ?auto_850335 ?auto_850339 ) ) ( not ( = ?auto_850335 ?auto_850340 ) ) ( not ( = ?auto_850335 ?auto_850341 ) ) ( not ( = ?auto_850335 ?auto_850342 ) ) ( not ( = ?auto_850335 ?auto_850343 ) ) ( not ( = ?auto_850335 ?auto_850344 ) ) ( not ( = ?auto_850335 ?auto_850345 ) ) ( not ( = ?auto_850335 ?auto_850346 ) ) ( not ( = ?auto_850335 ?auto_850347 ) ) ( not ( = ?auto_850335 ?auto_850348 ) ) ( not ( = ?auto_850335 ?auto_850349 ) ) ( not ( = ?auto_850335 ?auto_850350 ) ) ( not ( = ?auto_850336 ?auto_850337 ) ) ( not ( = ?auto_850336 ?auto_850338 ) ) ( not ( = ?auto_850336 ?auto_850339 ) ) ( not ( = ?auto_850336 ?auto_850340 ) ) ( not ( = ?auto_850336 ?auto_850341 ) ) ( not ( = ?auto_850336 ?auto_850342 ) ) ( not ( = ?auto_850336 ?auto_850343 ) ) ( not ( = ?auto_850336 ?auto_850344 ) ) ( not ( = ?auto_850336 ?auto_850345 ) ) ( not ( = ?auto_850336 ?auto_850346 ) ) ( not ( = ?auto_850336 ?auto_850347 ) ) ( not ( = ?auto_850336 ?auto_850348 ) ) ( not ( = ?auto_850336 ?auto_850349 ) ) ( not ( = ?auto_850336 ?auto_850350 ) ) ( not ( = ?auto_850337 ?auto_850338 ) ) ( not ( = ?auto_850337 ?auto_850339 ) ) ( not ( = ?auto_850337 ?auto_850340 ) ) ( not ( = ?auto_850337 ?auto_850341 ) ) ( not ( = ?auto_850337 ?auto_850342 ) ) ( not ( = ?auto_850337 ?auto_850343 ) ) ( not ( = ?auto_850337 ?auto_850344 ) ) ( not ( = ?auto_850337 ?auto_850345 ) ) ( not ( = ?auto_850337 ?auto_850346 ) ) ( not ( = ?auto_850337 ?auto_850347 ) ) ( not ( = ?auto_850337 ?auto_850348 ) ) ( not ( = ?auto_850337 ?auto_850349 ) ) ( not ( = ?auto_850337 ?auto_850350 ) ) ( not ( = ?auto_850338 ?auto_850339 ) ) ( not ( = ?auto_850338 ?auto_850340 ) ) ( not ( = ?auto_850338 ?auto_850341 ) ) ( not ( = ?auto_850338 ?auto_850342 ) ) ( not ( = ?auto_850338 ?auto_850343 ) ) ( not ( = ?auto_850338 ?auto_850344 ) ) ( not ( = ?auto_850338 ?auto_850345 ) ) ( not ( = ?auto_850338 ?auto_850346 ) ) ( not ( = ?auto_850338 ?auto_850347 ) ) ( not ( = ?auto_850338 ?auto_850348 ) ) ( not ( = ?auto_850338 ?auto_850349 ) ) ( not ( = ?auto_850338 ?auto_850350 ) ) ( not ( = ?auto_850339 ?auto_850340 ) ) ( not ( = ?auto_850339 ?auto_850341 ) ) ( not ( = ?auto_850339 ?auto_850342 ) ) ( not ( = ?auto_850339 ?auto_850343 ) ) ( not ( = ?auto_850339 ?auto_850344 ) ) ( not ( = ?auto_850339 ?auto_850345 ) ) ( not ( = ?auto_850339 ?auto_850346 ) ) ( not ( = ?auto_850339 ?auto_850347 ) ) ( not ( = ?auto_850339 ?auto_850348 ) ) ( not ( = ?auto_850339 ?auto_850349 ) ) ( not ( = ?auto_850339 ?auto_850350 ) ) ( not ( = ?auto_850340 ?auto_850341 ) ) ( not ( = ?auto_850340 ?auto_850342 ) ) ( not ( = ?auto_850340 ?auto_850343 ) ) ( not ( = ?auto_850340 ?auto_850344 ) ) ( not ( = ?auto_850340 ?auto_850345 ) ) ( not ( = ?auto_850340 ?auto_850346 ) ) ( not ( = ?auto_850340 ?auto_850347 ) ) ( not ( = ?auto_850340 ?auto_850348 ) ) ( not ( = ?auto_850340 ?auto_850349 ) ) ( not ( = ?auto_850340 ?auto_850350 ) ) ( not ( = ?auto_850341 ?auto_850342 ) ) ( not ( = ?auto_850341 ?auto_850343 ) ) ( not ( = ?auto_850341 ?auto_850344 ) ) ( not ( = ?auto_850341 ?auto_850345 ) ) ( not ( = ?auto_850341 ?auto_850346 ) ) ( not ( = ?auto_850341 ?auto_850347 ) ) ( not ( = ?auto_850341 ?auto_850348 ) ) ( not ( = ?auto_850341 ?auto_850349 ) ) ( not ( = ?auto_850341 ?auto_850350 ) ) ( not ( = ?auto_850342 ?auto_850343 ) ) ( not ( = ?auto_850342 ?auto_850344 ) ) ( not ( = ?auto_850342 ?auto_850345 ) ) ( not ( = ?auto_850342 ?auto_850346 ) ) ( not ( = ?auto_850342 ?auto_850347 ) ) ( not ( = ?auto_850342 ?auto_850348 ) ) ( not ( = ?auto_850342 ?auto_850349 ) ) ( not ( = ?auto_850342 ?auto_850350 ) ) ( not ( = ?auto_850343 ?auto_850344 ) ) ( not ( = ?auto_850343 ?auto_850345 ) ) ( not ( = ?auto_850343 ?auto_850346 ) ) ( not ( = ?auto_850343 ?auto_850347 ) ) ( not ( = ?auto_850343 ?auto_850348 ) ) ( not ( = ?auto_850343 ?auto_850349 ) ) ( not ( = ?auto_850343 ?auto_850350 ) ) ( not ( = ?auto_850344 ?auto_850345 ) ) ( not ( = ?auto_850344 ?auto_850346 ) ) ( not ( = ?auto_850344 ?auto_850347 ) ) ( not ( = ?auto_850344 ?auto_850348 ) ) ( not ( = ?auto_850344 ?auto_850349 ) ) ( not ( = ?auto_850344 ?auto_850350 ) ) ( not ( = ?auto_850345 ?auto_850346 ) ) ( not ( = ?auto_850345 ?auto_850347 ) ) ( not ( = ?auto_850345 ?auto_850348 ) ) ( not ( = ?auto_850345 ?auto_850349 ) ) ( not ( = ?auto_850345 ?auto_850350 ) ) ( not ( = ?auto_850346 ?auto_850347 ) ) ( not ( = ?auto_850346 ?auto_850348 ) ) ( not ( = ?auto_850346 ?auto_850349 ) ) ( not ( = ?auto_850346 ?auto_850350 ) ) ( not ( = ?auto_850347 ?auto_850348 ) ) ( not ( = ?auto_850347 ?auto_850349 ) ) ( not ( = ?auto_850347 ?auto_850350 ) ) ( not ( = ?auto_850348 ?auto_850349 ) ) ( not ( = ?auto_850348 ?auto_850350 ) ) ( not ( = ?auto_850349 ?auto_850350 ) ) ( ON ?auto_850348 ?auto_850349 ) ( ON ?auto_850347 ?auto_850348 ) ( ON ?auto_850346 ?auto_850347 ) ( ON ?auto_850345 ?auto_850346 ) ( ON ?auto_850344 ?auto_850345 ) ( ON ?auto_850343 ?auto_850344 ) ( ON ?auto_850342 ?auto_850343 ) ( ON ?auto_850341 ?auto_850342 ) ( ON ?auto_850340 ?auto_850341 ) ( ON ?auto_850339 ?auto_850340 ) ( ON ?auto_850338 ?auto_850339 ) ( ON ?auto_850337 ?auto_850338 ) ( CLEAR ?auto_850335 ) ( ON ?auto_850336 ?auto_850337 ) ( CLEAR ?auto_850336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_850335 ?auto_850336 )
      ( MAKE-15PILE ?auto_850335 ?auto_850336 ?auto_850337 ?auto_850338 ?auto_850339 ?auto_850340 ?auto_850341 ?auto_850342 ?auto_850343 ?auto_850344 ?auto_850345 ?auto_850346 ?auto_850347 ?auto_850348 ?auto_850349 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_850397 - BLOCK
      ?auto_850398 - BLOCK
      ?auto_850399 - BLOCK
      ?auto_850400 - BLOCK
      ?auto_850401 - BLOCK
      ?auto_850402 - BLOCK
      ?auto_850403 - BLOCK
      ?auto_850404 - BLOCK
      ?auto_850405 - BLOCK
      ?auto_850406 - BLOCK
      ?auto_850407 - BLOCK
      ?auto_850408 - BLOCK
      ?auto_850409 - BLOCK
      ?auto_850410 - BLOCK
      ?auto_850411 - BLOCK
    )
    :vars
    (
      ?auto_850412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_850411 ?auto_850412 ) ( not ( = ?auto_850397 ?auto_850398 ) ) ( not ( = ?auto_850397 ?auto_850399 ) ) ( not ( = ?auto_850397 ?auto_850400 ) ) ( not ( = ?auto_850397 ?auto_850401 ) ) ( not ( = ?auto_850397 ?auto_850402 ) ) ( not ( = ?auto_850397 ?auto_850403 ) ) ( not ( = ?auto_850397 ?auto_850404 ) ) ( not ( = ?auto_850397 ?auto_850405 ) ) ( not ( = ?auto_850397 ?auto_850406 ) ) ( not ( = ?auto_850397 ?auto_850407 ) ) ( not ( = ?auto_850397 ?auto_850408 ) ) ( not ( = ?auto_850397 ?auto_850409 ) ) ( not ( = ?auto_850397 ?auto_850410 ) ) ( not ( = ?auto_850397 ?auto_850411 ) ) ( not ( = ?auto_850397 ?auto_850412 ) ) ( not ( = ?auto_850398 ?auto_850399 ) ) ( not ( = ?auto_850398 ?auto_850400 ) ) ( not ( = ?auto_850398 ?auto_850401 ) ) ( not ( = ?auto_850398 ?auto_850402 ) ) ( not ( = ?auto_850398 ?auto_850403 ) ) ( not ( = ?auto_850398 ?auto_850404 ) ) ( not ( = ?auto_850398 ?auto_850405 ) ) ( not ( = ?auto_850398 ?auto_850406 ) ) ( not ( = ?auto_850398 ?auto_850407 ) ) ( not ( = ?auto_850398 ?auto_850408 ) ) ( not ( = ?auto_850398 ?auto_850409 ) ) ( not ( = ?auto_850398 ?auto_850410 ) ) ( not ( = ?auto_850398 ?auto_850411 ) ) ( not ( = ?auto_850398 ?auto_850412 ) ) ( not ( = ?auto_850399 ?auto_850400 ) ) ( not ( = ?auto_850399 ?auto_850401 ) ) ( not ( = ?auto_850399 ?auto_850402 ) ) ( not ( = ?auto_850399 ?auto_850403 ) ) ( not ( = ?auto_850399 ?auto_850404 ) ) ( not ( = ?auto_850399 ?auto_850405 ) ) ( not ( = ?auto_850399 ?auto_850406 ) ) ( not ( = ?auto_850399 ?auto_850407 ) ) ( not ( = ?auto_850399 ?auto_850408 ) ) ( not ( = ?auto_850399 ?auto_850409 ) ) ( not ( = ?auto_850399 ?auto_850410 ) ) ( not ( = ?auto_850399 ?auto_850411 ) ) ( not ( = ?auto_850399 ?auto_850412 ) ) ( not ( = ?auto_850400 ?auto_850401 ) ) ( not ( = ?auto_850400 ?auto_850402 ) ) ( not ( = ?auto_850400 ?auto_850403 ) ) ( not ( = ?auto_850400 ?auto_850404 ) ) ( not ( = ?auto_850400 ?auto_850405 ) ) ( not ( = ?auto_850400 ?auto_850406 ) ) ( not ( = ?auto_850400 ?auto_850407 ) ) ( not ( = ?auto_850400 ?auto_850408 ) ) ( not ( = ?auto_850400 ?auto_850409 ) ) ( not ( = ?auto_850400 ?auto_850410 ) ) ( not ( = ?auto_850400 ?auto_850411 ) ) ( not ( = ?auto_850400 ?auto_850412 ) ) ( not ( = ?auto_850401 ?auto_850402 ) ) ( not ( = ?auto_850401 ?auto_850403 ) ) ( not ( = ?auto_850401 ?auto_850404 ) ) ( not ( = ?auto_850401 ?auto_850405 ) ) ( not ( = ?auto_850401 ?auto_850406 ) ) ( not ( = ?auto_850401 ?auto_850407 ) ) ( not ( = ?auto_850401 ?auto_850408 ) ) ( not ( = ?auto_850401 ?auto_850409 ) ) ( not ( = ?auto_850401 ?auto_850410 ) ) ( not ( = ?auto_850401 ?auto_850411 ) ) ( not ( = ?auto_850401 ?auto_850412 ) ) ( not ( = ?auto_850402 ?auto_850403 ) ) ( not ( = ?auto_850402 ?auto_850404 ) ) ( not ( = ?auto_850402 ?auto_850405 ) ) ( not ( = ?auto_850402 ?auto_850406 ) ) ( not ( = ?auto_850402 ?auto_850407 ) ) ( not ( = ?auto_850402 ?auto_850408 ) ) ( not ( = ?auto_850402 ?auto_850409 ) ) ( not ( = ?auto_850402 ?auto_850410 ) ) ( not ( = ?auto_850402 ?auto_850411 ) ) ( not ( = ?auto_850402 ?auto_850412 ) ) ( not ( = ?auto_850403 ?auto_850404 ) ) ( not ( = ?auto_850403 ?auto_850405 ) ) ( not ( = ?auto_850403 ?auto_850406 ) ) ( not ( = ?auto_850403 ?auto_850407 ) ) ( not ( = ?auto_850403 ?auto_850408 ) ) ( not ( = ?auto_850403 ?auto_850409 ) ) ( not ( = ?auto_850403 ?auto_850410 ) ) ( not ( = ?auto_850403 ?auto_850411 ) ) ( not ( = ?auto_850403 ?auto_850412 ) ) ( not ( = ?auto_850404 ?auto_850405 ) ) ( not ( = ?auto_850404 ?auto_850406 ) ) ( not ( = ?auto_850404 ?auto_850407 ) ) ( not ( = ?auto_850404 ?auto_850408 ) ) ( not ( = ?auto_850404 ?auto_850409 ) ) ( not ( = ?auto_850404 ?auto_850410 ) ) ( not ( = ?auto_850404 ?auto_850411 ) ) ( not ( = ?auto_850404 ?auto_850412 ) ) ( not ( = ?auto_850405 ?auto_850406 ) ) ( not ( = ?auto_850405 ?auto_850407 ) ) ( not ( = ?auto_850405 ?auto_850408 ) ) ( not ( = ?auto_850405 ?auto_850409 ) ) ( not ( = ?auto_850405 ?auto_850410 ) ) ( not ( = ?auto_850405 ?auto_850411 ) ) ( not ( = ?auto_850405 ?auto_850412 ) ) ( not ( = ?auto_850406 ?auto_850407 ) ) ( not ( = ?auto_850406 ?auto_850408 ) ) ( not ( = ?auto_850406 ?auto_850409 ) ) ( not ( = ?auto_850406 ?auto_850410 ) ) ( not ( = ?auto_850406 ?auto_850411 ) ) ( not ( = ?auto_850406 ?auto_850412 ) ) ( not ( = ?auto_850407 ?auto_850408 ) ) ( not ( = ?auto_850407 ?auto_850409 ) ) ( not ( = ?auto_850407 ?auto_850410 ) ) ( not ( = ?auto_850407 ?auto_850411 ) ) ( not ( = ?auto_850407 ?auto_850412 ) ) ( not ( = ?auto_850408 ?auto_850409 ) ) ( not ( = ?auto_850408 ?auto_850410 ) ) ( not ( = ?auto_850408 ?auto_850411 ) ) ( not ( = ?auto_850408 ?auto_850412 ) ) ( not ( = ?auto_850409 ?auto_850410 ) ) ( not ( = ?auto_850409 ?auto_850411 ) ) ( not ( = ?auto_850409 ?auto_850412 ) ) ( not ( = ?auto_850410 ?auto_850411 ) ) ( not ( = ?auto_850410 ?auto_850412 ) ) ( not ( = ?auto_850411 ?auto_850412 ) ) ( ON ?auto_850410 ?auto_850411 ) ( ON ?auto_850409 ?auto_850410 ) ( ON ?auto_850408 ?auto_850409 ) ( ON ?auto_850407 ?auto_850408 ) ( ON ?auto_850406 ?auto_850407 ) ( ON ?auto_850405 ?auto_850406 ) ( ON ?auto_850404 ?auto_850405 ) ( ON ?auto_850403 ?auto_850404 ) ( ON ?auto_850402 ?auto_850403 ) ( ON ?auto_850401 ?auto_850402 ) ( ON ?auto_850400 ?auto_850401 ) ( ON ?auto_850399 ?auto_850400 ) ( ON ?auto_850398 ?auto_850399 ) ( ON ?auto_850397 ?auto_850398 ) ( CLEAR ?auto_850397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_850397 )
      ( MAKE-15PILE ?auto_850397 ?auto_850398 ?auto_850399 ?auto_850400 ?auto_850401 ?auto_850402 ?auto_850403 ?auto_850404 ?auto_850405 ?auto_850406 ?auto_850407 ?auto_850408 ?auto_850409 ?auto_850410 ?auto_850411 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_850460 - BLOCK
      ?auto_850461 - BLOCK
      ?auto_850462 - BLOCK
      ?auto_850463 - BLOCK
      ?auto_850464 - BLOCK
      ?auto_850465 - BLOCK
      ?auto_850466 - BLOCK
      ?auto_850467 - BLOCK
      ?auto_850468 - BLOCK
      ?auto_850469 - BLOCK
      ?auto_850470 - BLOCK
      ?auto_850471 - BLOCK
      ?auto_850472 - BLOCK
      ?auto_850473 - BLOCK
      ?auto_850474 - BLOCK
      ?auto_850475 - BLOCK
    )
    :vars
    (
      ?auto_850476 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_850474 ) ( ON ?auto_850475 ?auto_850476 ) ( CLEAR ?auto_850475 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_850460 ) ( ON ?auto_850461 ?auto_850460 ) ( ON ?auto_850462 ?auto_850461 ) ( ON ?auto_850463 ?auto_850462 ) ( ON ?auto_850464 ?auto_850463 ) ( ON ?auto_850465 ?auto_850464 ) ( ON ?auto_850466 ?auto_850465 ) ( ON ?auto_850467 ?auto_850466 ) ( ON ?auto_850468 ?auto_850467 ) ( ON ?auto_850469 ?auto_850468 ) ( ON ?auto_850470 ?auto_850469 ) ( ON ?auto_850471 ?auto_850470 ) ( ON ?auto_850472 ?auto_850471 ) ( ON ?auto_850473 ?auto_850472 ) ( ON ?auto_850474 ?auto_850473 ) ( not ( = ?auto_850460 ?auto_850461 ) ) ( not ( = ?auto_850460 ?auto_850462 ) ) ( not ( = ?auto_850460 ?auto_850463 ) ) ( not ( = ?auto_850460 ?auto_850464 ) ) ( not ( = ?auto_850460 ?auto_850465 ) ) ( not ( = ?auto_850460 ?auto_850466 ) ) ( not ( = ?auto_850460 ?auto_850467 ) ) ( not ( = ?auto_850460 ?auto_850468 ) ) ( not ( = ?auto_850460 ?auto_850469 ) ) ( not ( = ?auto_850460 ?auto_850470 ) ) ( not ( = ?auto_850460 ?auto_850471 ) ) ( not ( = ?auto_850460 ?auto_850472 ) ) ( not ( = ?auto_850460 ?auto_850473 ) ) ( not ( = ?auto_850460 ?auto_850474 ) ) ( not ( = ?auto_850460 ?auto_850475 ) ) ( not ( = ?auto_850460 ?auto_850476 ) ) ( not ( = ?auto_850461 ?auto_850462 ) ) ( not ( = ?auto_850461 ?auto_850463 ) ) ( not ( = ?auto_850461 ?auto_850464 ) ) ( not ( = ?auto_850461 ?auto_850465 ) ) ( not ( = ?auto_850461 ?auto_850466 ) ) ( not ( = ?auto_850461 ?auto_850467 ) ) ( not ( = ?auto_850461 ?auto_850468 ) ) ( not ( = ?auto_850461 ?auto_850469 ) ) ( not ( = ?auto_850461 ?auto_850470 ) ) ( not ( = ?auto_850461 ?auto_850471 ) ) ( not ( = ?auto_850461 ?auto_850472 ) ) ( not ( = ?auto_850461 ?auto_850473 ) ) ( not ( = ?auto_850461 ?auto_850474 ) ) ( not ( = ?auto_850461 ?auto_850475 ) ) ( not ( = ?auto_850461 ?auto_850476 ) ) ( not ( = ?auto_850462 ?auto_850463 ) ) ( not ( = ?auto_850462 ?auto_850464 ) ) ( not ( = ?auto_850462 ?auto_850465 ) ) ( not ( = ?auto_850462 ?auto_850466 ) ) ( not ( = ?auto_850462 ?auto_850467 ) ) ( not ( = ?auto_850462 ?auto_850468 ) ) ( not ( = ?auto_850462 ?auto_850469 ) ) ( not ( = ?auto_850462 ?auto_850470 ) ) ( not ( = ?auto_850462 ?auto_850471 ) ) ( not ( = ?auto_850462 ?auto_850472 ) ) ( not ( = ?auto_850462 ?auto_850473 ) ) ( not ( = ?auto_850462 ?auto_850474 ) ) ( not ( = ?auto_850462 ?auto_850475 ) ) ( not ( = ?auto_850462 ?auto_850476 ) ) ( not ( = ?auto_850463 ?auto_850464 ) ) ( not ( = ?auto_850463 ?auto_850465 ) ) ( not ( = ?auto_850463 ?auto_850466 ) ) ( not ( = ?auto_850463 ?auto_850467 ) ) ( not ( = ?auto_850463 ?auto_850468 ) ) ( not ( = ?auto_850463 ?auto_850469 ) ) ( not ( = ?auto_850463 ?auto_850470 ) ) ( not ( = ?auto_850463 ?auto_850471 ) ) ( not ( = ?auto_850463 ?auto_850472 ) ) ( not ( = ?auto_850463 ?auto_850473 ) ) ( not ( = ?auto_850463 ?auto_850474 ) ) ( not ( = ?auto_850463 ?auto_850475 ) ) ( not ( = ?auto_850463 ?auto_850476 ) ) ( not ( = ?auto_850464 ?auto_850465 ) ) ( not ( = ?auto_850464 ?auto_850466 ) ) ( not ( = ?auto_850464 ?auto_850467 ) ) ( not ( = ?auto_850464 ?auto_850468 ) ) ( not ( = ?auto_850464 ?auto_850469 ) ) ( not ( = ?auto_850464 ?auto_850470 ) ) ( not ( = ?auto_850464 ?auto_850471 ) ) ( not ( = ?auto_850464 ?auto_850472 ) ) ( not ( = ?auto_850464 ?auto_850473 ) ) ( not ( = ?auto_850464 ?auto_850474 ) ) ( not ( = ?auto_850464 ?auto_850475 ) ) ( not ( = ?auto_850464 ?auto_850476 ) ) ( not ( = ?auto_850465 ?auto_850466 ) ) ( not ( = ?auto_850465 ?auto_850467 ) ) ( not ( = ?auto_850465 ?auto_850468 ) ) ( not ( = ?auto_850465 ?auto_850469 ) ) ( not ( = ?auto_850465 ?auto_850470 ) ) ( not ( = ?auto_850465 ?auto_850471 ) ) ( not ( = ?auto_850465 ?auto_850472 ) ) ( not ( = ?auto_850465 ?auto_850473 ) ) ( not ( = ?auto_850465 ?auto_850474 ) ) ( not ( = ?auto_850465 ?auto_850475 ) ) ( not ( = ?auto_850465 ?auto_850476 ) ) ( not ( = ?auto_850466 ?auto_850467 ) ) ( not ( = ?auto_850466 ?auto_850468 ) ) ( not ( = ?auto_850466 ?auto_850469 ) ) ( not ( = ?auto_850466 ?auto_850470 ) ) ( not ( = ?auto_850466 ?auto_850471 ) ) ( not ( = ?auto_850466 ?auto_850472 ) ) ( not ( = ?auto_850466 ?auto_850473 ) ) ( not ( = ?auto_850466 ?auto_850474 ) ) ( not ( = ?auto_850466 ?auto_850475 ) ) ( not ( = ?auto_850466 ?auto_850476 ) ) ( not ( = ?auto_850467 ?auto_850468 ) ) ( not ( = ?auto_850467 ?auto_850469 ) ) ( not ( = ?auto_850467 ?auto_850470 ) ) ( not ( = ?auto_850467 ?auto_850471 ) ) ( not ( = ?auto_850467 ?auto_850472 ) ) ( not ( = ?auto_850467 ?auto_850473 ) ) ( not ( = ?auto_850467 ?auto_850474 ) ) ( not ( = ?auto_850467 ?auto_850475 ) ) ( not ( = ?auto_850467 ?auto_850476 ) ) ( not ( = ?auto_850468 ?auto_850469 ) ) ( not ( = ?auto_850468 ?auto_850470 ) ) ( not ( = ?auto_850468 ?auto_850471 ) ) ( not ( = ?auto_850468 ?auto_850472 ) ) ( not ( = ?auto_850468 ?auto_850473 ) ) ( not ( = ?auto_850468 ?auto_850474 ) ) ( not ( = ?auto_850468 ?auto_850475 ) ) ( not ( = ?auto_850468 ?auto_850476 ) ) ( not ( = ?auto_850469 ?auto_850470 ) ) ( not ( = ?auto_850469 ?auto_850471 ) ) ( not ( = ?auto_850469 ?auto_850472 ) ) ( not ( = ?auto_850469 ?auto_850473 ) ) ( not ( = ?auto_850469 ?auto_850474 ) ) ( not ( = ?auto_850469 ?auto_850475 ) ) ( not ( = ?auto_850469 ?auto_850476 ) ) ( not ( = ?auto_850470 ?auto_850471 ) ) ( not ( = ?auto_850470 ?auto_850472 ) ) ( not ( = ?auto_850470 ?auto_850473 ) ) ( not ( = ?auto_850470 ?auto_850474 ) ) ( not ( = ?auto_850470 ?auto_850475 ) ) ( not ( = ?auto_850470 ?auto_850476 ) ) ( not ( = ?auto_850471 ?auto_850472 ) ) ( not ( = ?auto_850471 ?auto_850473 ) ) ( not ( = ?auto_850471 ?auto_850474 ) ) ( not ( = ?auto_850471 ?auto_850475 ) ) ( not ( = ?auto_850471 ?auto_850476 ) ) ( not ( = ?auto_850472 ?auto_850473 ) ) ( not ( = ?auto_850472 ?auto_850474 ) ) ( not ( = ?auto_850472 ?auto_850475 ) ) ( not ( = ?auto_850472 ?auto_850476 ) ) ( not ( = ?auto_850473 ?auto_850474 ) ) ( not ( = ?auto_850473 ?auto_850475 ) ) ( not ( = ?auto_850473 ?auto_850476 ) ) ( not ( = ?auto_850474 ?auto_850475 ) ) ( not ( = ?auto_850474 ?auto_850476 ) ) ( not ( = ?auto_850475 ?auto_850476 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_850475 ?auto_850476 )
      ( !STACK ?auto_850475 ?auto_850474 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_850526 - BLOCK
      ?auto_850527 - BLOCK
      ?auto_850528 - BLOCK
      ?auto_850529 - BLOCK
      ?auto_850530 - BLOCK
      ?auto_850531 - BLOCK
      ?auto_850532 - BLOCK
      ?auto_850533 - BLOCK
      ?auto_850534 - BLOCK
      ?auto_850535 - BLOCK
      ?auto_850536 - BLOCK
      ?auto_850537 - BLOCK
      ?auto_850538 - BLOCK
      ?auto_850539 - BLOCK
      ?auto_850540 - BLOCK
      ?auto_850541 - BLOCK
    )
    :vars
    (
      ?auto_850542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_850541 ?auto_850542 ) ( ON-TABLE ?auto_850526 ) ( ON ?auto_850527 ?auto_850526 ) ( ON ?auto_850528 ?auto_850527 ) ( ON ?auto_850529 ?auto_850528 ) ( ON ?auto_850530 ?auto_850529 ) ( ON ?auto_850531 ?auto_850530 ) ( ON ?auto_850532 ?auto_850531 ) ( ON ?auto_850533 ?auto_850532 ) ( ON ?auto_850534 ?auto_850533 ) ( ON ?auto_850535 ?auto_850534 ) ( ON ?auto_850536 ?auto_850535 ) ( ON ?auto_850537 ?auto_850536 ) ( ON ?auto_850538 ?auto_850537 ) ( ON ?auto_850539 ?auto_850538 ) ( not ( = ?auto_850526 ?auto_850527 ) ) ( not ( = ?auto_850526 ?auto_850528 ) ) ( not ( = ?auto_850526 ?auto_850529 ) ) ( not ( = ?auto_850526 ?auto_850530 ) ) ( not ( = ?auto_850526 ?auto_850531 ) ) ( not ( = ?auto_850526 ?auto_850532 ) ) ( not ( = ?auto_850526 ?auto_850533 ) ) ( not ( = ?auto_850526 ?auto_850534 ) ) ( not ( = ?auto_850526 ?auto_850535 ) ) ( not ( = ?auto_850526 ?auto_850536 ) ) ( not ( = ?auto_850526 ?auto_850537 ) ) ( not ( = ?auto_850526 ?auto_850538 ) ) ( not ( = ?auto_850526 ?auto_850539 ) ) ( not ( = ?auto_850526 ?auto_850540 ) ) ( not ( = ?auto_850526 ?auto_850541 ) ) ( not ( = ?auto_850526 ?auto_850542 ) ) ( not ( = ?auto_850527 ?auto_850528 ) ) ( not ( = ?auto_850527 ?auto_850529 ) ) ( not ( = ?auto_850527 ?auto_850530 ) ) ( not ( = ?auto_850527 ?auto_850531 ) ) ( not ( = ?auto_850527 ?auto_850532 ) ) ( not ( = ?auto_850527 ?auto_850533 ) ) ( not ( = ?auto_850527 ?auto_850534 ) ) ( not ( = ?auto_850527 ?auto_850535 ) ) ( not ( = ?auto_850527 ?auto_850536 ) ) ( not ( = ?auto_850527 ?auto_850537 ) ) ( not ( = ?auto_850527 ?auto_850538 ) ) ( not ( = ?auto_850527 ?auto_850539 ) ) ( not ( = ?auto_850527 ?auto_850540 ) ) ( not ( = ?auto_850527 ?auto_850541 ) ) ( not ( = ?auto_850527 ?auto_850542 ) ) ( not ( = ?auto_850528 ?auto_850529 ) ) ( not ( = ?auto_850528 ?auto_850530 ) ) ( not ( = ?auto_850528 ?auto_850531 ) ) ( not ( = ?auto_850528 ?auto_850532 ) ) ( not ( = ?auto_850528 ?auto_850533 ) ) ( not ( = ?auto_850528 ?auto_850534 ) ) ( not ( = ?auto_850528 ?auto_850535 ) ) ( not ( = ?auto_850528 ?auto_850536 ) ) ( not ( = ?auto_850528 ?auto_850537 ) ) ( not ( = ?auto_850528 ?auto_850538 ) ) ( not ( = ?auto_850528 ?auto_850539 ) ) ( not ( = ?auto_850528 ?auto_850540 ) ) ( not ( = ?auto_850528 ?auto_850541 ) ) ( not ( = ?auto_850528 ?auto_850542 ) ) ( not ( = ?auto_850529 ?auto_850530 ) ) ( not ( = ?auto_850529 ?auto_850531 ) ) ( not ( = ?auto_850529 ?auto_850532 ) ) ( not ( = ?auto_850529 ?auto_850533 ) ) ( not ( = ?auto_850529 ?auto_850534 ) ) ( not ( = ?auto_850529 ?auto_850535 ) ) ( not ( = ?auto_850529 ?auto_850536 ) ) ( not ( = ?auto_850529 ?auto_850537 ) ) ( not ( = ?auto_850529 ?auto_850538 ) ) ( not ( = ?auto_850529 ?auto_850539 ) ) ( not ( = ?auto_850529 ?auto_850540 ) ) ( not ( = ?auto_850529 ?auto_850541 ) ) ( not ( = ?auto_850529 ?auto_850542 ) ) ( not ( = ?auto_850530 ?auto_850531 ) ) ( not ( = ?auto_850530 ?auto_850532 ) ) ( not ( = ?auto_850530 ?auto_850533 ) ) ( not ( = ?auto_850530 ?auto_850534 ) ) ( not ( = ?auto_850530 ?auto_850535 ) ) ( not ( = ?auto_850530 ?auto_850536 ) ) ( not ( = ?auto_850530 ?auto_850537 ) ) ( not ( = ?auto_850530 ?auto_850538 ) ) ( not ( = ?auto_850530 ?auto_850539 ) ) ( not ( = ?auto_850530 ?auto_850540 ) ) ( not ( = ?auto_850530 ?auto_850541 ) ) ( not ( = ?auto_850530 ?auto_850542 ) ) ( not ( = ?auto_850531 ?auto_850532 ) ) ( not ( = ?auto_850531 ?auto_850533 ) ) ( not ( = ?auto_850531 ?auto_850534 ) ) ( not ( = ?auto_850531 ?auto_850535 ) ) ( not ( = ?auto_850531 ?auto_850536 ) ) ( not ( = ?auto_850531 ?auto_850537 ) ) ( not ( = ?auto_850531 ?auto_850538 ) ) ( not ( = ?auto_850531 ?auto_850539 ) ) ( not ( = ?auto_850531 ?auto_850540 ) ) ( not ( = ?auto_850531 ?auto_850541 ) ) ( not ( = ?auto_850531 ?auto_850542 ) ) ( not ( = ?auto_850532 ?auto_850533 ) ) ( not ( = ?auto_850532 ?auto_850534 ) ) ( not ( = ?auto_850532 ?auto_850535 ) ) ( not ( = ?auto_850532 ?auto_850536 ) ) ( not ( = ?auto_850532 ?auto_850537 ) ) ( not ( = ?auto_850532 ?auto_850538 ) ) ( not ( = ?auto_850532 ?auto_850539 ) ) ( not ( = ?auto_850532 ?auto_850540 ) ) ( not ( = ?auto_850532 ?auto_850541 ) ) ( not ( = ?auto_850532 ?auto_850542 ) ) ( not ( = ?auto_850533 ?auto_850534 ) ) ( not ( = ?auto_850533 ?auto_850535 ) ) ( not ( = ?auto_850533 ?auto_850536 ) ) ( not ( = ?auto_850533 ?auto_850537 ) ) ( not ( = ?auto_850533 ?auto_850538 ) ) ( not ( = ?auto_850533 ?auto_850539 ) ) ( not ( = ?auto_850533 ?auto_850540 ) ) ( not ( = ?auto_850533 ?auto_850541 ) ) ( not ( = ?auto_850533 ?auto_850542 ) ) ( not ( = ?auto_850534 ?auto_850535 ) ) ( not ( = ?auto_850534 ?auto_850536 ) ) ( not ( = ?auto_850534 ?auto_850537 ) ) ( not ( = ?auto_850534 ?auto_850538 ) ) ( not ( = ?auto_850534 ?auto_850539 ) ) ( not ( = ?auto_850534 ?auto_850540 ) ) ( not ( = ?auto_850534 ?auto_850541 ) ) ( not ( = ?auto_850534 ?auto_850542 ) ) ( not ( = ?auto_850535 ?auto_850536 ) ) ( not ( = ?auto_850535 ?auto_850537 ) ) ( not ( = ?auto_850535 ?auto_850538 ) ) ( not ( = ?auto_850535 ?auto_850539 ) ) ( not ( = ?auto_850535 ?auto_850540 ) ) ( not ( = ?auto_850535 ?auto_850541 ) ) ( not ( = ?auto_850535 ?auto_850542 ) ) ( not ( = ?auto_850536 ?auto_850537 ) ) ( not ( = ?auto_850536 ?auto_850538 ) ) ( not ( = ?auto_850536 ?auto_850539 ) ) ( not ( = ?auto_850536 ?auto_850540 ) ) ( not ( = ?auto_850536 ?auto_850541 ) ) ( not ( = ?auto_850536 ?auto_850542 ) ) ( not ( = ?auto_850537 ?auto_850538 ) ) ( not ( = ?auto_850537 ?auto_850539 ) ) ( not ( = ?auto_850537 ?auto_850540 ) ) ( not ( = ?auto_850537 ?auto_850541 ) ) ( not ( = ?auto_850537 ?auto_850542 ) ) ( not ( = ?auto_850538 ?auto_850539 ) ) ( not ( = ?auto_850538 ?auto_850540 ) ) ( not ( = ?auto_850538 ?auto_850541 ) ) ( not ( = ?auto_850538 ?auto_850542 ) ) ( not ( = ?auto_850539 ?auto_850540 ) ) ( not ( = ?auto_850539 ?auto_850541 ) ) ( not ( = ?auto_850539 ?auto_850542 ) ) ( not ( = ?auto_850540 ?auto_850541 ) ) ( not ( = ?auto_850540 ?auto_850542 ) ) ( not ( = ?auto_850541 ?auto_850542 ) ) ( CLEAR ?auto_850539 ) ( ON ?auto_850540 ?auto_850541 ) ( CLEAR ?auto_850540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_850526 ?auto_850527 ?auto_850528 ?auto_850529 ?auto_850530 ?auto_850531 ?auto_850532 ?auto_850533 ?auto_850534 ?auto_850535 ?auto_850536 ?auto_850537 ?auto_850538 ?auto_850539 ?auto_850540 )
      ( MAKE-16PILE ?auto_850526 ?auto_850527 ?auto_850528 ?auto_850529 ?auto_850530 ?auto_850531 ?auto_850532 ?auto_850533 ?auto_850534 ?auto_850535 ?auto_850536 ?auto_850537 ?auto_850538 ?auto_850539 ?auto_850540 ?auto_850541 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_850592 - BLOCK
      ?auto_850593 - BLOCK
      ?auto_850594 - BLOCK
      ?auto_850595 - BLOCK
      ?auto_850596 - BLOCK
      ?auto_850597 - BLOCK
      ?auto_850598 - BLOCK
      ?auto_850599 - BLOCK
      ?auto_850600 - BLOCK
      ?auto_850601 - BLOCK
      ?auto_850602 - BLOCK
      ?auto_850603 - BLOCK
      ?auto_850604 - BLOCK
      ?auto_850605 - BLOCK
      ?auto_850606 - BLOCK
      ?auto_850607 - BLOCK
    )
    :vars
    (
      ?auto_850608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_850607 ?auto_850608 ) ( ON-TABLE ?auto_850592 ) ( ON ?auto_850593 ?auto_850592 ) ( ON ?auto_850594 ?auto_850593 ) ( ON ?auto_850595 ?auto_850594 ) ( ON ?auto_850596 ?auto_850595 ) ( ON ?auto_850597 ?auto_850596 ) ( ON ?auto_850598 ?auto_850597 ) ( ON ?auto_850599 ?auto_850598 ) ( ON ?auto_850600 ?auto_850599 ) ( ON ?auto_850601 ?auto_850600 ) ( ON ?auto_850602 ?auto_850601 ) ( ON ?auto_850603 ?auto_850602 ) ( ON ?auto_850604 ?auto_850603 ) ( not ( = ?auto_850592 ?auto_850593 ) ) ( not ( = ?auto_850592 ?auto_850594 ) ) ( not ( = ?auto_850592 ?auto_850595 ) ) ( not ( = ?auto_850592 ?auto_850596 ) ) ( not ( = ?auto_850592 ?auto_850597 ) ) ( not ( = ?auto_850592 ?auto_850598 ) ) ( not ( = ?auto_850592 ?auto_850599 ) ) ( not ( = ?auto_850592 ?auto_850600 ) ) ( not ( = ?auto_850592 ?auto_850601 ) ) ( not ( = ?auto_850592 ?auto_850602 ) ) ( not ( = ?auto_850592 ?auto_850603 ) ) ( not ( = ?auto_850592 ?auto_850604 ) ) ( not ( = ?auto_850592 ?auto_850605 ) ) ( not ( = ?auto_850592 ?auto_850606 ) ) ( not ( = ?auto_850592 ?auto_850607 ) ) ( not ( = ?auto_850592 ?auto_850608 ) ) ( not ( = ?auto_850593 ?auto_850594 ) ) ( not ( = ?auto_850593 ?auto_850595 ) ) ( not ( = ?auto_850593 ?auto_850596 ) ) ( not ( = ?auto_850593 ?auto_850597 ) ) ( not ( = ?auto_850593 ?auto_850598 ) ) ( not ( = ?auto_850593 ?auto_850599 ) ) ( not ( = ?auto_850593 ?auto_850600 ) ) ( not ( = ?auto_850593 ?auto_850601 ) ) ( not ( = ?auto_850593 ?auto_850602 ) ) ( not ( = ?auto_850593 ?auto_850603 ) ) ( not ( = ?auto_850593 ?auto_850604 ) ) ( not ( = ?auto_850593 ?auto_850605 ) ) ( not ( = ?auto_850593 ?auto_850606 ) ) ( not ( = ?auto_850593 ?auto_850607 ) ) ( not ( = ?auto_850593 ?auto_850608 ) ) ( not ( = ?auto_850594 ?auto_850595 ) ) ( not ( = ?auto_850594 ?auto_850596 ) ) ( not ( = ?auto_850594 ?auto_850597 ) ) ( not ( = ?auto_850594 ?auto_850598 ) ) ( not ( = ?auto_850594 ?auto_850599 ) ) ( not ( = ?auto_850594 ?auto_850600 ) ) ( not ( = ?auto_850594 ?auto_850601 ) ) ( not ( = ?auto_850594 ?auto_850602 ) ) ( not ( = ?auto_850594 ?auto_850603 ) ) ( not ( = ?auto_850594 ?auto_850604 ) ) ( not ( = ?auto_850594 ?auto_850605 ) ) ( not ( = ?auto_850594 ?auto_850606 ) ) ( not ( = ?auto_850594 ?auto_850607 ) ) ( not ( = ?auto_850594 ?auto_850608 ) ) ( not ( = ?auto_850595 ?auto_850596 ) ) ( not ( = ?auto_850595 ?auto_850597 ) ) ( not ( = ?auto_850595 ?auto_850598 ) ) ( not ( = ?auto_850595 ?auto_850599 ) ) ( not ( = ?auto_850595 ?auto_850600 ) ) ( not ( = ?auto_850595 ?auto_850601 ) ) ( not ( = ?auto_850595 ?auto_850602 ) ) ( not ( = ?auto_850595 ?auto_850603 ) ) ( not ( = ?auto_850595 ?auto_850604 ) ) ( not ( = ?auto_850595 ?auto_850605 ) ) ( not ( = ?auto_850595 ?auto_850606 ) ) ( not ( = ?auto_850595 ?auto_850607 ) ) ( not ( = ?auto_850595 ?auto_850608 ) ) ( not ( = ?auto_850596 ?auto_850597 ) ) ( not ( = ?auto_850596 ?auto_850598 ) ) ( not ( = ?auto_850596 ?auto_850599 ) ) ( not ( = ?auto_850596 ?auto_850600 ) ) ( not ( = ?auto_850596 ?auto_850601 ) ) ( not ( = ?auto_850596 ?auto_850602 ) ) ( not ( = ?auto_850596 ?auto_850603 ) ) ( not ( = ?auto_850596 ?auto_850604 ) ) ( not ( = ?auto_850596 ?auto_850605 ) ) ( not ( = ?auto_850596 ?auto_850606 ) ) ( not ( = ?auto_850596 ?auto_850607 ) ) ( not ( = ?auto_850596 ?auto_850608 ) ) ( not ( = ?auto_850597 ?auto_850598 ) ) ( not ( = ?auto_850597 ?auto_850599 ) ) ( not ( = ?auto_850597 ?auto_850600 ) ) ( not ( = ?auto_850597 ?auto_850601 ) ) ( not ( = ?auto_850597 ?auto_850602 ) ) ( not ( = ?auto_850597 ?auto_850603 ) ) ( not ( = ?auto_850597 ?auto_850604 ) ) ( not ( = ?auto_850597 ?auto_850605 ) ) ( not ( = ?auto_850597 ?auto_850606 ) ) ( not ( = ?auto_850597 ?auto_850607 ) ) ( not ( = ?auto_850597 ?auto_850608 ) ) ( not ( = ?auto_850598 ?auto_850599 ) ) ( not ( = ?auto_850598 ?auto_850600 ) ) ( not ( = ?auto_850598 ?auto_850601 ) ) ( not ( = ?auto_850598 ?auto_850602 ) ) ( not ( = ?auto_850598 ?auto_850603 ) ) ( not ( = ?auto_850598 ?auto_850604 ) ) ( not ( = ?auto_850598 ?auto_850605 ) ) ( not ( = ?auto_850598 ?auto_850606 ) ) ( not ( = ?auto_850598 ?auto_850607 ) ) ( not ( = ?auto_850598 ?auto_850608 ) ) ( not ( = ?auto_850599 ?auto_850600 ) ) ( not ( = ?auto_850599 ?auto_850601 ) ) ( not ( = ?auto_850599 ?auto_850602 ) ) ( not ( = ?auto_850599 ?auto_850603 ) ) ( not ( = ?auto_850599 ?auto_850604 ) ) ( not ( = ?auto_850599 ?auto_850605 ) ) ( not ( = ?auto_850599 ?auto_850606 ) ) ( not ( = ?auto_850599 ?auto_850607 ) ) ( not ( = ?auto_850599 ?auto_850608 ) ) ( not ( = ?auto_850600 ?auto_850601 ) ) ( not ( = ?auto_850600 ?auto_850602 ) ) ( not ( = ?auto_850600 ?auto_850603 ) ) ( not ( = ?auto_850600 ?auto_850604 ) ) ( not ( = ?auto_850600 ?auto_850605 ) ) ( not ( = ?auto_850600 ?auto_850606 ) ) ( not ( = ?auto_850600 ?auto_850607 ) ) ( not ( = ?auto_850600 ?auto_850608 ) ) ( not ( = ?auto_850601 ?auto_850602 ) ) ( not ( = ?auto_850601 ?auto_850603 ) ) ( not ( = ?auto_850601 ?auto_850604 ) ) ( not ( = ?auto_850601 ?auto_850605 ) ) ( not ( = ?auto_850601 ?auto_850606 ) ) ( not ( = ?auto_850601 ?auto_850607 ) ) ( not ( = ?auto_850601 ?auto_850608 ) ) ( not ( = ?auto_850602 ?auto_850603 ) ) ( not ( = ?auto_850602 ?auto_850604 ) ) ( not ( = ?auto_850602 ?auto_850605 ) ) ( not ( = ?auto_850602 ?auto_850606 ) ) ( not ( = ?auto_850602 ?auto_850607 ) ) ( not ( = ?auto_850602 ?auto_850608 ) ) ( not ( = ?auto_850603 ?auto_850604 ) ) ( not ( = ?auto_850603 ?auto_850605 ) ) ( not ( = ?auto_850603 ?auto_850606 ) ) ( not ( = ?auto_850603 ?auto_850607 ) ) ( not ( = ?auto_850603 ?auto_850608 ) ) ( not ( = ?auto_850604 ?auto_850605 ) ) ( not ( = ?auto_850604 ?auto_850606 ) ) ( not ( = ?auto_850604 ?auto_850607 ) ) ( not ( = ?auto_850604 ?auto_850608 ) ) ( not ( = ?auto_850605 ?auto_850606 ) ) ( not ( = ?auto_850605 ?auto_850607 ) ) ( not ( = ?auto_850605 ?auto_850608 ) ) ( not ( = ?auto_850606 ?auto_850607 ) ) ( not ( = ?auto_850606 ?auto_850608 ) ) ( not ( = ?auto_850607 ?auto_850608 ) ) ( ON ?auto_850606 ?auto_850607 ) ( CLEAR ?auto_850604 ) ( ON ?auto_850605 ?auto_850606 ) ( CLEAR ?auto_850605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_850592 ?auto_850593 ?auto_850594 ?auto_850595 ?auto_850596 ?auto_850597 ?auto_850598 ?auto_850599 ?auto_850600 ?auto_850601 ?auto_850602 ?auto_850603 ?auto_850604 ?auto_850605 )
      ( MAKE-16PILE ?auto_850592 ?auto_850593 ?auto_850594 ?auto_850595 ?auto_850596 ?auto_850597 ?auto_850598 ?auto_850599 ?auto_850600 ?auto_850601 ?auto_850602 ?auto_850603 ?auto_850604 ?auto_850605 ?auto_850606 ?auto_850607 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_850658 - BLOCK
      ?auto_850659 - BLOCK
      ?auto_850660 - BLOCK
      ?auto_850661 - BLOCK
      ?auto_850662 - BLOCK
      ?auto_850663 - BLOCK
      ?auto_850664 - BLOCK
      ?auto_850665 - BLOCK
      ?auto_850666 - BLOCK
      ?auto_850667 - BLOCK
      ?auto_850668 - BLOCK
      ?auto_850669 - BLOCK
      ?auto_850670 - BLOCK
      ?auto_850671 - BLOCK
      ?auto_850672 - BLOCK
      ?auto_850673 - BLOCK
    )
    :vars
    (
      ?auto_850674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_850673 ?auto_850674 ) ( ON-TABLE ?auto_850658 ) ( ON ?auto_850659 ?auto_850658 ) ( ON ?auto_850660 ?auto_850659 ) ( ON ?auto_850661 ?auto_850660 ) ( ON ?auto_850662 ?auto_850661 ) ( ON ?auto_850663 ?auto_850662 ) ( ON ?auto_850664 ?auto_850663 ) ( ON ?auto_850665 ?auto_850664 ) ( ON ?auto_850666 ?auto_850665 ) ( ON ?auto_850667 ?auto_850666 ) ( ON ?auto_850668 ?auto_850667 ) ( ON ?auto_850669 ?auto_850668 ) ( not ( = ?auto_850658 ?auto_850659 ) ) ( not ( = ?auto_850658 ?auto_850660 ) ) ( not ( = ?auto_850658 ?auto_850661 ) ) ( not ( = ?auto_850658 ?auto_850662 ) ) ( not ( = ?auto_850658 ?auto_850663 ) ) ( not ( = ?auto_850658 ?auto_850664 ) ) ( not ( = ?auto_850658 ?auto_850665 ) ) ( not ( = ?auto_850658 ?auto_850666 ) ) ( not ( = ?auto_850658 ?auto_850667 ) ) ( not ( = ?auto_850658 ?auto_850668 ) ) ( not ( = ?auto_850658 ?auto_850669 ) ) ( not ( = ?auto_850658 ?auto_850670 ) ) ( not ( = ?auto_850658 ?auto_850671 ) ) ( not ( = ?auto_850658 ?auto_850672 ) ) ( not ( = ?auto_850658 ?auto_850673 ) ) ( not ( = ?auto_850658 ?auto_850674 ) ) ( not ( = ?auto_850659 ?auto_850660 ) ) ( not ( = ?auto_850659 ?auto_850661 ) ) ( not ( = ?auto_850659 ?auto_850662 ) ) ( not ( = ?auto_850659 ?auto_850663 ) ) ( not ( = ?auto_850659 ?auto_850664 ) ) ( not ( = ?auto_850659 ?auto_850665 ) ) ( not ( = ?auto_850659 ?auto_850666 ) ) ( not ( = ?auto_850659 ?auto_850667 ) ) ( not ( = ?auto_850659 ?auto_850668 ) ) ( not ( = ?auto_850659 ?auto_850669 ) ) ( not ( = ?auto_850659 ?auto_850670 ) ) ( not ( = ?auto_850659 ?auto_850671 ) ) ( not ( = ?auto_850659 ?auto_850672 ) ) ( not ( = ?auto_850659 ?auto_850673 ) ) ( not ( = ?auto_850659 ?auto_850674 ) ) ( not ( = ?auto_850660 ?auto_850661 ) ) ( not ( = ?auto_850660 ?auto_850662 ) ) ( not ( = ?auto_850660 ?auto_850663 ) ) ( not ( = ?auto_850660 ?auto_850664 ) ) ( not ( = ?auto_850660 ?auto_850665 ) ) ( not ( = ?auto_850660 ?auto_850666 ) ) ( not ( = ?auto_850660 ?auto_850667 ) ) ( not ( = ?auto_850660 ?auto_850668 ) ) ( not ( = ?auto_850660 ?auto_850669 ) ) ( not ( = ?auto_850660 ?auto_850670 ) ) ( not ( = ?auto_850660 ?auto_850671 ) ) ( not ( = ?auto_850660 ?auto_850672 ) ) ( not ( = ?auto_850660 ?auto_850673 ) ) ( not ( = ?auto_850660 ?auto_850674 ) ) ( not ( = ?auto_850661 ?auto_850662 ) ) ( not ( = ?auto_850661 ?auto_850663 ) ) ( not ( = ?auto_850661 ?auto_850664 ) ) ( not ( = ?auto_850661 ?auto_850665 ) ) ( not ( = ?auto_850661 ?auto_850666 ) ) ( not ( = ?auto_850661 ?auto_850667 ) ) ( not ( = ?auto_850661 ?auto_850668 ) ) ( not ( = ?auto_850661 ?auto_850669 ) ) ( not ( = ?auto_850661 ?auto_850670 ) ) ( not ( = ?auto_850661 ?auto_850671 ) ) ( not ( = ?auto_850661 ?auto_850672 ) ) ( not ( = ?auto_850661 ?auto_850673 ) ) ( not ( = ?auto_850661 ?auto_850674 ) ) ( not ( = ?auto_850662 ?auto_850663 ) ) ( not ( = ?auto_850662 ?auto_850664 ) ) ( not ( = ?auto_850662 ?auto_850665 ) ) ( not ( = ?auto_850662 ?auto_850666 ) ) ( not ( = ?auto_850662 ?auto_850667 ) ) ( not ( = ?auto_850662 ?auto_850668 ) ) ( not ( = ?auto_850662 ?auto_850669 ) ) ( not ( = ?auto_850662 ?auto_850670 ) ) ( not ( = ?auto_850662 ?auto_850671 ) ) ( not ( = ?auto_850662 ?auto_850672 ) ) ( not ( = ?auto_850662 ?auto_850673 ) ) ( not ( = ?auto_850662 ?auto_850674 ) ) ( not ( = ?auto_850663 ?auto_850664 ) ) ( not ( = ?auto_850663 ?auto_850665 ) ) ( not ( = ?auto_850663 ?auto_850666 ) ) ( not ( = ?auto_850663 ?auto_850667 ) ) ( not ( = ?auto_850663 ?auto_850668 ) ) ( not ( = ?auto_850663 ?auto_850669 ) ) ( not ( = ?auto_850663 ?auto_850670 ) ) ( not ( = ?auto_850663 ?auto_850671 ) ) ( not ( = ?auto_850663 ?auto_850672 ) ) ( not ( = ?auto_850663 ?auto_850673 ) ) ( not ( = ?auto_850663 ?auto_850674 ) ) ( not ( = ?auto_850664 ?auto_850665 ) ) ( not ( = ?auto_850664 ?auto_850666 ) ) ( not ( = ?auto_850664 ?auto_850667 ) ) ( not ( = ?auto_850664 ?auto_850668 ) ) ( not ( = ?auto_850664 ?auto_850669 ) ) ( not ( = ?auto_850664 ?auto_850670 ) ) ( not ( = ?auto_850664 ?auto_850671 ) ) ( not ( = ?auto_850664 ?auto_850672 ) ) ( not ( = ?auto_850664 ?auto_850673 ) ) ( not ( = ?auto_850664 ?auto_850674 ) ) ( not ( = ?auto_850665 ?auto_850666 ) ) ( not ( = ?auto_850665 ?auto_850667 ) ) ( not ( = ?auto_850665 ?auto_850668 ) ) ( not ( = ?auto_850665 ?auto_850669 ) ) ( not ( = ?auto_850665 ?auto_850670 ) ) ( not ( = ?auto_850665 ?auto_850671 ) ) ( not ( = ?auto_850665 ?auto_850672 ) ) ( not ( = ?auto_850665 ?auto_850673 ) ) ( not ( = ?auto_850665 ?auto_850674 ) ) ( not ( = ?auto_850666 ?auto_850667 ) ) ( not ( = ?auto_850666 ?auto_850668 ) ) ( not ( = ?auto_850666 ?auto_850669 ) ) ( not ( = ?auto_850666 ?auto_850670 ) ) ( not ( = ?auto_850666 ?auto_850671 ) ) ( not ( = ?auto_850666 ?auto_850672 ) ) ( not ( = ?auto_850666 ?auto_850673 ) ) ( not ( = ?auto_850666 ?auto_850674 ) ) ( not ( = ?auto_850667 ?auto_850668 ) ) ( not ( = ?auto_850667 ?auto_850669 ) ) ( not ( = ?auto_850667 ?auto_850670 ) ) ( not ( = ?auto_850667 ?auto_850671 ) ) ( not ( = ?auto_850667 ?auto_850672 ) ) ( not ( = ?auto_850667 ?auto_850673 ) ) ( not ( = ?auto_850667 ?auto_850674 ) ) ( not ( = ?auto_850668 ?auto_850669 ) ) ( not ( = ?auto_850668 ?auto_850670 ) ) ( not ( = ?auto_850668 ?auto_850671 ) ) ( not ( = ?auto_850668 ?auto_850672 ) ) ( not ( = ?auto_850668 ?auto_850673 ) ) ( not ( = ?auto_850668 ?auto_850674 ) ) ( not ( = ?auto_850669 ?auto_850670 ) ) ( not ( = ?auto_850669 ?auto_850671 ) ) ( not ( = ?auto_850669 ?auto_850672 ) ) ( not ( = ?auto_850669 ?auto_850673 ) ) ( not ( = ?auto_850669 ?auto_850674 ) ) ( not ( = ?auto_850670 ?auto_850671 ) ) ( not ( = ?auto_850670 ?auto_850672 ) ) ( not ( = ?auto_850670 ?auto_850673 ) ) ( not ( = ?auto_850670 ?auto_850674 ) ) ( not ( = ?auto_850671 ?auto_850672 ) ) ( not ( = ?auto_850671 ?auto_850673 ) ) ( not ( = ?auto_850671 ?auto_850674 ) ) ( not ( = ?auto_850672 ?auto_850673 ) ) ( not ( = ?auto_850672 ?auto_850674 ) ) ( not ( = ?auto_850673 ?auto_850674 ) ) ( ON ?auto_850672 ?auto_850673 ) ( ON ?auto_850671 ?auto_850672 ) ( CLEAR ?auto_850669 ) ( ON ?auto_850670 ?auto_850671 ) ( CLEAR ?auto_850670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_850658 ?auto_850659 ?auto_850660 ?auto_850661 ?auto_850662 ?auto_850663 ?auto_850664 ?auto_850665 ?auto_850666 ?auto_850667 ?auto_850668 ?auto_850669 ?auto_850670 )
      ( MAKE-16PILE ?auto_850658 ?auto_850659 ?auto_850660 ?auto_850661 ?auto_850662 ?auto_850663 ?auto_850664 ?auto_850665 ?auto_850666 ?auto_850667 ?auto_850668 ?auto_850669 ?auto_850670 ?auto_850671 ?auto_850672 ?auto_850673 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_850724 - BLOCK
      ?auto_850725 - BLOCK
      ?auto_850726 - BLOCK
      ?auto_850727 - BLOCK
      ?auto_850728 - BLOCK
      ?auto_850729 - BLOCK
      ?auto_850730 - BLOCK
      ?auto_850731 - BLOCK
      ?auto_850732 - BLOCK
      ?auto_850733 - BLOCK
      ?auto_850734 - BLOCK
      ?auto_850735 - BLOCK
      ?auto_850736 - BLOCK
      ?auto_850737 - BLOCK
      ?auto_850738 - BLOCK
      ?auto_850739 - BLOCK
    )
    :vars
    (
      ?auto_850740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_850739 ?auto_850740 ) ( ON-TABLE ?auto_850724 ) ( ON ?auto_850725 ?auto_850724 ) ( ON ?auto_850726 ?auto_850725 ) ( ON ?auto_850727 ?auto_850726 ) ( ON ?auto_850728 ?auto_850727 ) ( ON ?auto_850729 ?auto_850728 ) ( ON ?auto_850730 ?auto_850729 ) ( ON ?auto_850731 ?auto_850730 ) ( ON ?auto_850732 ?auto_850731 ) ( ON ?auto_850733 ?auto_850732 ) ( ON ?auto_850734 ?auto_850733 ) ( not ( = ?auto_850724 ?auto_850725 ) ) ( not ( = ?auto_850724 ?auto_850726 ) ) ( not ( = ?auto_850724 ?auto_850727 ) ) ( not ( = ?auto_850724 ?auto_850728 ) ) ( not ( = ?auto_850724 ?auto_850729 ) ) ( not ( = ?auto_850724 ?auto_850730 ) ) ( not ( = ?auto_850724 ?auto_850731 ) ) ( not ( = ?auto_850724 ?auto_850732 ) ) ( not ( = ?auto_850724 ?auto_850733 ) ) ( not ( = ?auto_850724 ?auto_850734 ) ) ( not ( = ?auto_850724 ?auto_850735 ) ) ( not ( = ?auto_850724 ?auto_850736 ) ) ( not ( = ?auto_850724 ?auto_850737 ) ) ( not ( = ?auto_850724 ?auto_850738 ) ) ( not ( = ?auto_850724 ?auto_850739 ) ) ( not ( = ?auto_850724 ?auto_850740 ) ) ( not ( = ?auto_850725 ?auto_850726 ) ) ( not ( = ?auto_850725 ?auto_850727 ) ) ( not ( = ?auto_850725 ?auto_850728 ) ) ( not ( = ?auto_850725 ?auto_850729 ) ) ( not ( = ?auto_850725 ?auto_850730 ) ) ( not ( = ?auto_850725 ?auto_850731 ) ) ( not ( = ?auto_850725 ?auto_850732 ) ) ( not ( = ?auto_850725 ?auto_850733 ) ) ( not ( = ?auto_850725 ?auto_850734 ) ) ( not ( = ?auto_850725 ?auto_850735 ) ) ( not ( = ?auto_850725 ?auto_850736 ) ) ( not ( = ?auto_850725 ?auto_850737 ) ) ( not ( = ?auto_850725 ?auto_850738 ) ) ( not ( = ?auto_850725 ?auto_850739 ) ) ( not ( = ?auto_850725 ?auto_850740 ) ) ( not ( = ?auto_850726 ?auto_850727 ) ) ( not ( = ?auto_850726 ?auto_850728 ) ) ( not ( = ?auto_850726 ?auto_850729 ) ) ( not ( = ?auto_850726 ?auto_850730 ) ) ( not ( = ?auto_850726 ?auto_850731 ) ) ( not ( = ?auto_850726 ?auto_850732 ) ) ( not ( = ?auto_850726 ?auto_850733 ) ) ( not ( = ?auto_850726 ?auto_850734 ) ) ( not ( = ?auto_850726 ?auto_850735 ) ) ( not ( = ?auto_850726 ?auto_850736 ) ) ( not ( = ?auto_850726 ?auto_850737 ) ) ( not ( = ?auto_850726 ?auto_850738 ) ) ( not ( = ?auto_850726 ?auto_850739 ) ) ( not ( = ?auto_850726 ?auto_850740 ) ) ( not ( = ?auto_850727 ?auto_850728 ) ) ( not ( = ?auto_850727 ?auto_850729 ) ) ( not ( = ?auto_850727 ?auto_850730 ) ) ( not ( = ?auto_850727 ?auto_850731 ) ) ( not ( = ?auto_850727 ?auto_850732 ) ) ( not ( = ?auto_850727 ?auto_850733 ) ) ( not ( = ?auto_850727 ?auto_850734 ) ) ( not ( = ?auto_850727 ?auto_850735 ) ) ( not ( = ?auto_850727 ?auto_850736 ) ) ( not ( = ?auto_850727 ?auto_850737 ) ) ( not ( = ?auto_850727 ?auto_850738 ) ) ( not ( = ?auto_850727 ?auto_850739 ) ) ( not ( = ?auto_850727 ?auto_850740 ) ) ( not ( = ?auto_850728 ?auto_850729 ) ) ( not ( = ?auto_850728 ?auto_850730 ) ) ( not ( = ?auto_850728 ?auto_850731 ) ) ( not ( = ?auto_850728 ?auto_850732 ) ) ( not ( = ?auto_850728 ?auto_850733 ) ) ( not ( = ?auto_850728 ?auto_850734 ) ) ( not ( = ?auto_850728 ?auto_850735 ) ) ( not ( = ?auto_850728 ?auto_850736 ) ) ( not ( = ?auto_850728 ?auto_850737 ) ) ( not ( = ?auto_850728 ?auto_850738 ) ) ( not ( = ?auto_850728 ?auto_850739 ) ) ( not ( = ?auto_850728 ?auto_850740 ) ) ( not ( = ?auto_850729 ?auto_850730 ) ) ( not ( = ?auto_850729 ?auto_850731 ) ) ( not ( = ?auto_850729 ?auto_850732 ) ) ( not ( = ?auto_850729 ?auto_850733 ) ) ( not ( = ?auto_850729 ?auto_850734 ) ) ( not ( = ?auto_850729 ?auto_850735 ) ) ( not ( = ?auto_850729 ?auto_850736 ) ) ( not ( = ?auto_850729 ?auto_850737 ) ) ( not ( = ?auto_850729 ?auto_850738 ) ) ( not ( = ?auto_850729 ?auto_850739 ) ) ( not ( = ?auto_850729 ?auto_850740 ) ) ( not ( = ?auto_850730 ?auto_850731 ) ) ( not ( = ?auto_850730 ?auto_850732 ) ) ( not ( = ?auto_850730 ?auto_850733 ) ) ( not ( = ?auto_850730 ?auto_850734 ) ) ( not ( = ?auto_850730 ?auto_850735 ) ) ( not ( = ?auto_850730 ?auto_850736 ) ) ( not ( = ?auto_850730 ?auto_850737 ) ) ( not ( = ?auto_850730 ?auto_850738 ) ) ( not ( = ?auto_850730 ?auto_850739 ) ) ( not ( = ?auto_850730 ?auto_850740 ) ) ( not ( = ?auto_850731 ?auto_850732 ) ) ( not ( = ?auto_850731 ?auto_850733 ) ) ( not ( = ?auto_850731 ?auto_850734 ) ) ( not ( = ?auto_850731 ?auto_850735 ) ) ( not ( = ?auto_850731 ?auto_850736 ) ) ( not ( = ?auto_850731 ?auto_850737 ) ) ( not ( = ?auto_850731 ?auto_850738 ) ) ( not ( = ?auto_850731 ?auto_850739 ) ) ( not ( = ?auto_850731 ?auto_850740 ) ) ( not ( = ?auto_850732 ?auto_850733 ) ) ( not ( = ?auto_850732 ?auto_850734 ) ) ( not ( = ?auto_850732 ?auto_850735 ) ) ( not ( = ?auto_850732 ?auto_850736 ) ) ( not ( = ?auto_850732 ?auto_850737 ) ) ( not ( = ?auto_850732 ?auto_850738 ) ) ( not ( = ?auto_850732 ?auto_850739 ) ) ( not ( = ?auto_850732 ?auto_850740 ) ) ( not ( = ?auto_850733 ?auto_850734 ) ) ( not ( = ?auto_850733 ?auto_850735 ) ) ( not ( = ?auto_850733 ?auto_850736 ) ) ( not ( = ?auto_850733 ?auto_850737 ) ) ( not ( = ?auto_850733 ?auto_850738 ) ) ( not ( = ?auto_850733 ?auto_850739 ) ) ( not ( = ?auto_850733 ?auto_850740 ) ) ( not ( = ?auto_850734 ?auto_850735 ) ) ( not ( = ?auto_850734 ?auto_850736 ) ) ( not ( = ?auto_850734 ?auto_850737 ) ) ( not ( = ?auto_850734 ?auto_850738 ) ) ( not ( = ?auto_850734 ?auto_850739 ) ) ( not ( = ?auto_850734 ?auto_850740 ) ) ( not ( = ?auto_850735 ?auto_850736 ) ) ( not ( = ?auto_850735 ?auto_850737 ) ) ( not ( = ?auto_850735 ?auto_850738 ) ) ( not ( = ?auto_850735 ?auto_850739 ) ) ( not ( = ?auto_850735 ?auto_850740 ) ) ( not ( = ?auto_850736 ?auto_850737 ) ) ( not ( = ?auto_850736 ?auto_850738 ) ) ( not ( = ?auto_850736 ?auto_850739 ) ) ( not ( = ?auto_850736 ?auto_850740 ) ) ( not ( = ?auto_850737 ?auto_850738 ) ) ( not ( = ?auto_850737 ?auto_850739 ) ) ( not ( = ?auto_850737 ?auto_850740 ) ) ( not ( = ?auto_850738 ?auto_850739 ) ) ( not ( = ?auto_850738 ?auto_850740 ) ) ( not ( = ?auto_850739 ?auto_850740 ) ) ( ON ?auto_850738 ?auto_850739 ) ( ON ?auto_850737 ?auto_850738 ) ( ON ?auto_850736 ?auto_850737 ) ( CLEAR ?auto_850734 ) ( ON ?auto_850735 ?auto_850736 ) ( CLEAR ?auto_850735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_850724 ?auto_850725 ?auto_850726 ?auto_850727 ?auto_850728 ?auto_850729 ?auto_850730 ?auto_850731 ?auto_850732 ?auto_850733 ?auto_850734 ?auto_850735 )
      ( MAKE-16PILE ?auto_850724 ?auto_850725 ?auto_850726 ?auto_850727 ?auto_850728 ?auto_850729 ?auto_850730 ?auto_850731 ?auto_850732 ?auto_850733 ?auto_850734 ?auto_850735 ?auto_850736 ?auto_850737 ?auto_850738 ?auto_850739 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_850790 - BLOCK
      ?auto_850791 - BLOCK
      ?auto_850792 - BLOCK
      ?auto_850793 - BLOCK
      ?auto_850794 - BLOCK
      ?auto_850795 - BLOCK
      ?auto_850796 - BLOCK
      ?auto_850797 - BLOCK
      ?auto_850798 - BLOCK
      ?auto_850799 - BLOCK
      ?auto_850800 - BLOCK
      ?auto_850801 - BLOCK
      ?auto_850802 - BLOCK
      ?auto_850803 - BLOCK
      ?auto_850804 - BLOCK
      ?auto_850805 - BLOCK
    )
    :vars
    (
      ?auto_850806 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_850805 ?auto_850806 ) ( ON-TABLE ?auto_850790 ) ( ON ?auto_850791 ?auto_850790 ) ( ON ?auto_850792 ?auto_850791 ) ( ON ?auto_850793 ?auto_850792 ) ( ON ?auto_850794 ?auto_850793 ) ( ON ?auto_850795 ?auto_850794 ) ( ON ?auto_850796 ?auto_850795 ) ( ON ?auto_850797 ?auto_850796 ) ( ON ?auto_850798 ?auto_850797 ) ( ON ?auto_850799 ?auto_850798 ) ( not ( = ?auto_850790 ?auto_850791 ) ) ( not ( = ?auto_850790 ?auto_850792 ) ) ( not ( = ?auto_850790 ?auto_850793 ) ) ( not ( = ?auto_850790 ?auto_850794 ) ) ( not ( = ?auto_850790 ?auto_850795 ) ) ( not ( = ?auto_850790 ?auto_850796 ) ) ( not ( = ?auto_850790 ?auto_850797 ) ) ( not ( = ?auto_850790 ?auto_850798 ) ) ( not ( = ?auto_850790 ?auto_850799 ) ) ( not ( = ?auto_850790 ?auto_850800 ) ) ( not ( = ?auto_850790 ?auto_850801 ) ) ( not ( = ?auto_850790 ?auto_850802 ) ) ( not ( = ?auto_850790 ?auto_850803 ) ) ( not ( = ?auto_850790 ?auto_850804 ) ) ( not ( = ?auto_850790 ?auto_850805 ) ) ( not ( = ?auto_850790 ?auto_850806 ) ) ( not ( = ?auto_850791 ?auto_850792 ) ) ( not ( = ?auto_850791 ?auto_850793 ) ) ( not ( = ?auto_850791 ?auto_850794 ) ) ( not ( = ?auto_850791 ?auto_850795 ) ) ( not ( = ?auto_850791 ?auto_850796 ) ) ( not ( = ?auto_850791 ?auto_850797 ) ) ( not ( = ?auto_850791 ?auto_850798 ) ) ( not ( = ?auto_850791 ?auto_850799 ) ) ( not ( = ?auto_850791 ?auto_850800 ) ) ( not ( = ?auto_850791 ?auto_850801 ) ) ( not ( = ?auto_850791 ?auto_850802 ) ) ( not ( = ?auto_850791 ?auto_850803 ) ) ( not ( = ?auto_850791 ?auto_850804 ) ) ( not ( = ?auto_850791 ?auto_850805 ) ) ( not ( = ?auto_850791 ?auto_850806 ) ) ( not ( = ?auto_850792 ?auto_850793 ) ) ( not ( = ?auto_850792 ?auto_850794 ) ) ( not ( = ?auto_850792 ?auto_850795 ) ) ( not ( = ?auto_850792 ?auto_850796 ) ) ( not ( = ?auto_850792 ?auto_850797 ) ) ( not ( = ?auto_850792 ?auto_850798 ) ) ( not ( = ?auto_850792 ?auto_850799 ) ) ( not ( = ?auto_850792 ?auto_850800 ) ) ( not ( = ?auto_850792 ?auto_850801 ) ) ( not ( = ?auto_850792 ?auto_850802 ) ) ( not ( = ?auto_850792 ?auto_850803 ) ) ( not ( = ?auto_850792 ?auto_850804 ) ) ( not ( = ?auto_850792 ?auto_850805 ) ) ( not ( = ?auto_850792 ?auto_850806 ) ) ( not ( = ?auto_850793 ?auto_850794 ) ) ( not ( = ?auto_850793 ?auto_850795 ) ) ( not ( = ?auto_850793 ?auto_850796 ) ) ( not ( = ?auto_850793 ?auto_850797 ) ) ( not ( = ?auto_850793 ?auto_850798 ) ) ( not ( = ?auto_850793 ?auto_850799 ) ) ( not ( = ?auto_850793 ?auto_850800 ) ) ( not ( = ?auto_850793 ?auto_850801 ) ) ( not ( = ?auto_850793 ?auto_850802 ) ) ( not ( = ?auto_850793 ?auto_850803 ) ) ( not ( = ?auto_850793 ?auto_850804 ) ) ( not ( = ?auto_850793 ?auto_850805 ) ) ( not ( = ?auto_850793 ?auto_850806 ) ) ( not ( = ?auto_850794 ?auto_850795 ) ) ( not ( = ?auto_850794 ?auto_850796 ) ) ( not ( = ?auto_850794 ?auto_850797 ) ) ( not ( = ?auto_850794 ?auto_850798 ) ) ( not ( = ?auto_850794 ?auto_850799 ) ) ( not ( = ?auto_850794 ?auto_850800 ) ) ( not ( = ?auto_850794 ?auto_850801 ) ) ( not ( = ?auto_850794 ?auto_850802 ) ) ( not ( = ?auto_850794 ?auto_850803 ) ) ( not ( = ?auto_850794 ?auto_850804 ) ) ( not ( = ?auto_850794 ?auto_850805 ) ) ( not ( = ?auto_850794 ?auto_850806 ) ) ( not ( = ?auto_850795 ?auto_850796 ) ) ( not ( = ?auto_850795 ?auto_850797 ) ) ( not ( = ?auto_850795 ?auto_850798 ) ) ( not ( = ?auto_850795 ?auto_850799 ) ) ( not ( = ?auto_850795 ?auto_850800 ) ) ( not ( = ?auto_850795 ?auto_850801 ) ) ( not ( = ?auto_850795 ?auto_850802 ) ) ( not ( = ?auto_850795 ?auto_850803 ) ) ( not ( = ?auto_850795 ?auto_850804 ) ) ( not ( = ?auto_850795 ?auto_850805 ) ) ( not ( = ?auto_850795 ?auto_850806 ) ) ( not ( = ?auto_850796 ?auto_850797 ) ) ( not ( = ?auto_850796 ?auto_850798 ) ) ( not ( = ?auto_850796 ?auto_850799 ) ) ( not ( = ?auto_850796 ?auto_850800 ) ) ( not ( = ?auto_850796 ?auto_850801 ) ) ( not ( = ?auto_850796 ?auto_850802 ) ) ( not ( = ?auto_850796 ?auto_850803 ) ) ( not ( = ?auto_850796 ?auto_850804 ) ) ( not ( = ?auto_850796 ?auto_850805 ) ) ( not ( = ?auto_850796 ?auto_850806 ) ) ( not ( = ?auto_850797 ?auto_850798 ) ) ( not ( = ?auto_850797 ?auto_850799 ) ) ( not ( = ?auto_850797 ?auto_850800 ) ) ( not ( = ?auto_850797 ?auto_850801 ) ) ( not ( = ?auto_850797 ?auto_850802 ) ) ( not ( = ?auto_850797 ?auto_850803 ) ) ( not ( = ?auto_850797 ?auto_850804 ) ) ( not ( = ?auto_850797 ?auto_850805 ) ) ( not ( = ?auto_850797 ?auto_850806 ) ) ( not ( = ?auto_850798 ?auto_850799 ) ) ( not ( = ?auto_850798 ?auto_850800 ) ) ( not ( = ?auto_850798 ?auto_850801 ) ) ( not ( = ?auto_850798 ?auto_850802 ) ) ( not ( = ?auto_850798 ?auto_850803 ) ) ( not ( = ?auto_850798 ?auto_850804 ) ) ( not ( = ?auto_850798 ?auto_850805 ) ) ( not ( = ?auto_850798 ?auto_850806 ) ) ( not ( = ?auto_850799 ?auto_850800 ) ) ( not ( = ?auto_850799 ?auto_850801 ) ) ( not ( = ?auto_850799 ?auto_850802 ) ) ( not ( = ?auto_850799 ?auto_850803 ) ) ( not ( = ?auto_850799 ?auto_850804 ) ) ( not ( = ?auto_850799 ?auto_850805 ) ) ( not ( = ?auto_850799 ?auto_850806 ) ) ( not ( = ?auto_850800 ?auto_850801 ) ) ( not ( = ?auto_850800 ?auto_850802 ) ) ( not ( = ?auto_850800 ?auto_850803 ) ) ( not ( = ?auto_850800 ?auto_850804 ) ) ( not ( = ?auto_850800 ?auto_850805 ) ) ( not ( = ?auto_850800 ?auto_850806 ) ) ( not ( = ?auto_850801 ?auto_850802 ) ) ( not ( = ?auto_850801 ?auto_850803 ) ) ( not ( = ?auto_850801 ?auto_850804 ) ) ( not ( = ?auto_850801 ?auto_850805 ) ) ( not ( = ?auto_850801 ?auto_850806 ) ) ( not ( = ?auto_850802 ?auto_850803 ) ) ( not ( = ?auto_850802 ?auto_850804 ) ) ( not ( = ?auto_850802 ?auto_850805 ) ) ( not ( = ?auto_850802 ?auto_850806 ) ) ( not ( = ?auto_850803 ?auto_850804 ) ) ( not ( = ?auto_850803 ?auto_850805 ) ) ( not ( = ?auto_850803 ?auto_850806 ) ) ( not ( = ?auto_850804 ?auto_850805 ) ) ( not ( = ?auto_850804 ?auto_850806 ) ) ( not ( = ?auto_850805 ?auto_850806 ) ) ( ON ?auto_850804 ?auto_850805 ) ( ON ?auto_850803 ?auto_850804 ) ( ON ?auto_850802 ?auto_850803 ) ( ON ?auto_850801 ?auto_850802 ) ( CLEAR ?auto_850799 ) ( ON ?auto_850800 ?auto_850801 ) ( CLEAR ?auto_850800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_850790 ?auto_850791 ?auto_850792 ?auto_850793 ?auto_850794 ?auto_850795 ?auto_850796 ?auto_850797 ?auto_850798 ?auto_850799 ?auto_850800 )
      ( MAKE-16PILE ?auto_850790 ?auto_850791 ?auto_850792 ?auto_850793 ?auto_850794 ?auto_850795 ?auto_850796 ?auto_850797 ?auto_850798 ?auto_850799 ?auto_850800 ?auto_850801 ?auto_850802 ?auto_850803 ?auto_850804 ?auto_850805 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_850856 - BLOCK
      ?auto_850857 - BLOCK
      ?auto_850858 - BLOCK
      ?auto_850859 - BLOCK
      ?auto_850860 - BLOCK
      ?auto_850861 - BLOCK
      ?auto_850862 - BLOCK
      ?auto_850863 - BLOCK
      ?auto_850864 - BLOCK
      ?auto_850865 - BLOCK
      ?auto_850866 - BLOCK
      ?auto_850867 - BLOCK
      ?auto_850868 - BLOCK
      ?auto_850869 - BLOCK
      ?auto_850870 - BLOCK
      ?auto_850871 - BLOCK
    )
    :vars
    (
      ?auto_850872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_850871 ?auto_850872 ) ( ON-TABLE ?auto_850856 ) ( ON ?auto_850857 ?auto_850856 ) ( ON ?auto_850858 ?auto_850857 ) ( ON ?auto_850859 ?auto_850858 ) ( ON ?auto_850860 ?auto_850859 ) ( ON ?auto_850861 ?auto_850860 ) ( ON ?auto_850862 ?auto_850861 ) ( ON ?auto_850863 ?auto_850862 ) ( ON ?auto_850864 ?auto_850863 ) ( not ( = ?auto_850856 ?auto_850857 ) ) ( not ( = ?auto_850856 ?auto_850858 ) ) ( not ( = ?auto_850856 ?auto_850859 ) ) ( not ( = ?auto_850856 ?auto_850860 ) ) ( not ( = ?auto_850856 ?auto_850861 ) ) ( not ( = ?auto_850856 ?auto_850862 ) ) ( not ( = ?auto_850856 ?auto_850863 ) ) ( not ( = ?auto_850856 ?auto_850864 ) ) ( not ( = ?auto_850856 ?auto_850865 ) ) ( not ( = ?auto_850856 ?auto_850866 ) ) ( not ( = ?auto_850856 ?auto_850867 ) ) ( not ( = ?auto_850856 ?auto_850868 ) ) ( not ( = ?auto_850856 ?auto_850869 ) ) ( not ( = ?auto_850856 ?auto_850870 ) ) ( not ( = ?auto_850856 ?auto_850871 ) ) ( not ( = ?auto_850856 ?auto_850872 ) ) ( not ( = ?auto_850857 ?auto_850858 ) ) ( not ( = ?auto_850857 ?auto_850859 ) ) ( not ( = ?auto_850857 ?auto_850860 ) ) ( not ( = ?auto_850857 ?auto_850861 ) ) ( not ( = ?auto_850857 ?auto_850862 ) ) ( not ( = ?auto_850857 ?auto_850863 ) ) ( not ( = ?auto_850857 ?auto_850864 ) ) ( not ( = ?auto_850857 ?auto_850865 ) ) ( not ( = ?auto_850857 ?auto_850866 ) ) ( not ( = ?auto_850857 ?auto_850867 ) ) ( not ( = ?auto_850857 ?auto_850868 ) ) ( not ( = ?auto_850857 ?auto_850869 ) ) ( not ( = ?auto_850857 ?auto_850870 ) ) ( not ( = ?auto_850857 ?auto_850871 ) ) ( not ( = ?auto_850857 ?auto_850872 ) ) ( not ( = ?auto_850858 ?auto_850859 ) ) ( not ( = ?auto_850858 ?auto_850860 ) ) ( not ( = ?auto_850858 ?auto_850861 ) ) ( not ( = ?auto_850858 ?auto_850862 ) ) ( not ( = ?auto_850858 ?auto_850863 ) ) ( not ( = ?auto_850858 ?auto_850864 ) ) ( not ( = ?auto_850858 ?auto_850865 ) ) ( not ( = ?auto_850858 ?auto_850866 ) ) ( not ( = ?auto_850858 ?auto_850867 ) ) ( not ( = ?auto_850858 ?auto_850868 ) ) ( not ( = ?auto_850858 ?auto_850869 ) ) ( not ( = ?auto_850858 ?auto_850870 ) ) ( not ( = ?auto_850858 ?auto_850871 ) ) ( not ( = ?auto_850858 ?auto_850872 ) ) ( not ( = ?auto_850859 ?auto_850860 ) ) ( not ( = ?auto_850859 ?auto_850861 ) ) ( not ( = ?auto_850859 ?auto_850862 ) ) ( not ( = ?auto_850859 ?auto_850863 ) ) ( not ( = ?auto_850859 ?auto_850864 ) ) ( not ( = ?auto_850859 ?auto_850865 ) ) ( not ( = ?auto_850859 ?auto_850866 ) ) ( not ( = ?auto_850859 ?auto_850867 ) ) ( not ( = ?auto_850859 ?auto_850868 ) ) ( not ( = ?auto_850859 ?auto_850869 ) ) ( not ( = ?auto_850859 ?auto_850870 ) ) ( not ( = ?auto_850859 ?auto_850871 ) ) ( not ( = ?auto_850859 ?auto_850872 ) ) ( not ( = ?auto_850860 ?auto_850861 ) ) ( not ( = ?auto_850860 ?auto_850862 ) ) ( not ( = ?auto_850860 ?auto_850863 ) ) ( not ( = ?auto_850860 ?auto_850864 ) ) ( not ( = ?auto_850860 ?auto_850865 ) ) ( not ( = ?auto_850860 ?auto_850866 ) ) ( not ( = ?auto_850860 ?auto_850867 ) ) ( not ( = ?auto_850860 ?auto_850868 ) ) ( not ( = ?auto_850860 ?auto_850869 ) ) ( not ( = ?auto_850860 ?auto_850870 ) ) ( not ( = ?auto_850860 ?auto_850871 ) ) ( not ( = ?auto_850860 ?auto_850872 ) ) ( not ( = ?auto_850861 ?auto_850862 ) ) ( not ( = ?auto_850861 ?auto_850863 ) ) ( not ( = ?auto_850861 ?auto_850864 ) ) ( not ( = ?auto_850861 ?auto_850865 ) ) ( not ( = ?auto_850861 ?auto_850866 ) ) ( not ( = ?auto_850861 ?auto_850867 ) ) ( not ( = ?auto_850861 ?auto_850868 ) ) ( not ( = ?auto_850861 ?auto_850869 ) ) ( not ( = ?auto_850861 ?auto_850870 ) ) ( not ( = ?auto_850861 ?auto_850871 ) ) ( not ( = ?auto_850861 ?auto_850872 ) ) ( not ( = ?auto_850862 ?auto_850863 ) ) ( not ( = ?auto_850862 ?auto_850864 ) ) ( not ( = ?auto_850862 ?auto_850865 ) ) ( not ( = ?auto_850862 ?auto_850866 ) ) ( not ( = ?auto_850862 ?auto_850867 ) ) ( not ( = ?auto_850862 ?auto_850868 ) ) ( not ( = ?auto_850862 ?auto_850869 ) ) ( not ( = ?auto_850862 ?auto_850870 ) ) ( not ( = ?auto_850862 ?auto_850871 ) ) ( not ( = ?auto_850862 ?auto_850872 ) ) ( not ( = ?auto_850863 ?auto_850864 ) ) ( not ( = ?auto_850863 ?auto_850865 ) ) ( not ( = ?auto_850863 ?auto_850866 ) ) ( not ( = ?auto_850863 ?auto_850867 ) ) ( not ( = ?auto_850863 ?auto_850868 ) ) ( not ( = ?auto_850863 ?auto_850869 ) ) ( not ( = ?auto_850863 ?auto_850870 ) ) ( not ( = ?auto_850863 ?auto_850871 ) ) ( not ( = ?auto_850863 ?auto_850872 ) ) ( not ( = ?auto_850864 ?auto_850865 ) ) ( not ( = ?auto_850864 ?auto_850866 ) ) ( not ( = ?auto_850864 ?auto_850867 ) ) ( not ( = ?auto_850864 ?auto_850868 ) ) ( not ( = ?auto_850864 ?auto_850869 ) ) ( not ( = ?auto_850864 ?auto_850870 ) ) ( not ( = ?auto_850864 ?auto_850871 ) ) ( not ( = ?auto_850864 ?auto_850872 ) ) ( not ( = ?auto_850865 ?auto_850866 ) ) ( not ( = ?auto_850865 ?auto_850867 ) ) ( not ( = ?auto_850865 ?auto_850868 ) ) ( not ( = ?auto_850865 ?auto_850869 ) ) ( not ( = ?auto_850865 ?auto_850870 ) ) ( not ( = ?auto_850865 ?auto_850871 ) ) ( not ( = ?auto_850865 ?auto_850872 ) ) ( not ( = ?auto_850866 ?auto_850867 ) ) ( not ( = ?auto_850866 ?auto_850868 ) ) ( not ( = ?auto_850866 ?auto_850869 ) ) ( not ( = ?auto_850866 ?auto_850870 ) ) ( not ( = ?auto_850866 ?auto_850871 ) ) ( not ( = ?auto_850866 ?auto_850872 ) ) ( not ( = ?auto_850867 ?auto_850868 ) ) ( not ( = ?auto_850867 ?auto_850869 ) ) ( not ( = ?auto_850867 ?auto_850870 ) ) ( not ( = ?auto_850867 ?auto_850871 ) ) ( not ( = ?auto_850867 ?auto_850872 ) ) ( not ( = ?auto_850868 ?auto_850869 ) ) ( not ( = ?auto_850868 ?auto_850870 ) ) ( not ( = ?auto_850868 ?auto_850871 ) ) ( not ( = ?auto_850868 ?auto_850872 ) ) ( not ( = ?auto_850869 ?auto_850870 ) ) ( not ( = ?auto_850869 ?auto_850871 ) ) ( not ( = ?auto_850869 ?auto_850872 ) ) ( not ( = ?auto_850870 ?auto_850871 ) ) ( not ( = ?auto_850870 ?auto_850872 ) ) ( not ( = ?auto_850871 ?auto_850872 ) ) ( ON ?auto_850870 ?auto_850871 ) ( ON ?auto_850869 ?auto_850870 ) ( ON ?auto_850868 ?auto_850869 ) ( ON ?auto_850867 ?auto_850868 ) ( ON ?auto_850866 ?auto_850867 ) ( CLEAR ?auto_850864 ) ( ON ?auto_850865 ?auto_850866 ) ( CLEAR ?auto_850865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_850856 ?auto_850857 ?auto_850858 ?auto_850859 ?auto_850860 ?auto_850861 ?auto_850862 ?auto_850863 ?auto_850864 ?auto_850865 )
      ( MAKE-16PILE ?auto_850856 ?auto_850857 ?auto_850858 ?auto_850859 ?auto_850860 ?auto_850861 ?auto_850862 ?auto_850863 ?auto_850864 ?auto_850865 ?auto_850866 ?auto_850867 ?auto_850868 ?auto_850869 ?auto_850870 ?auto_850871 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_850922 - BLOCK
      ?auto_850923 - BLOCK
      ?auto_850924 - BLOCK
      ?auto_850925 - BLOCK
      ?auto_850926 - BLOCK
      ?auto_850927 - BLOCK
      ?auto_850928 - BLOCK
      ?auto_850929 - BLOCK
      ?auto_850930 - BLOCK
      ?auto_850931 - BLOCK
      ?auto_850932 - BLOCK
      ?auto_850933 - BLOCK
      ?auto_850934 - BLOCK
      ?auto_850935 - BLOCK
      ?auto_850936 - BLOCK
      ?auto_850937 - BLOCK
    )
    :vars
    (
      ?auto_850938 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_850937 ?auto_850938 ) ( ON-TABLE ?auto_850922 ) ( ON ?auto_850923 ?auto_850922 ) ( ON ?auto_850924 ?auto_850923 ) ( ON ?auto_850925 ?auto_850924 ) ( ON ?auto_850926 ?auto_850925 ) ( ON ?auto_850927 ?auto_850926 ) ( ON ?auto_850928 ?auto_850927 ) ( ON ?auto_850929 ?auto_850928 ) ( not ( = ?auto_850922 ?auto_850923 ) ) ( not ( = ?auto_850922 ?auto_850924 ) ) ( not ( = ?auto_850922 ?auto_850925 ) ) ( not ( = ?auto_850922 ?auto_850926 ) ) ( not ( = ?auto_850922 ?auto_850927 ) ) ( not ( = ?auto_850922 ?auto_850928 ) ) ( not ( = ?auto_850922 ?auto_850929 ) ) ( not ( = ?auto_850922 ?auto_850930 ) ) ( not ( = ?auto_850922 ?auto_850931 ) ) ( not ( = ?auto_850922 ?auto_850932 ) ) ( not ( = ?auto_850922 ?auto_850933 ) ) ( not ( = ?auto_850922 ?auto_850934 ) ) ( not ( = ?auto_850922 ?auto_850935 ) ) ( not ( = ?auto_850922 ?auto_850936 ) ) ( not ( = ?auto_850922 ?auto_850937 ) ) ( not ( = ?auto_850922 ?auto_850938 ) ) ( not ( = ?auto_850923 ?auto_850924 ) ) ( not ( = ?auto_850923 ?auto_850925 ) ) ( not ( = ?auto_850923 ?auto_850926 ) ) ( not ( = ?auto_850923 ?auto_850927 ) ) ( not ( = ?auto_850923 ?auto_850928 ) ) ( not ( = ?auto_850923 ?auto_850929 ) ) ( not ( = ?auto_850923 ?auto_850930 ) ) ( not ( = ?auto_850923 ?auto_850931 ) ) ( not ( = ?auto_850923 ?auto_850932 ) ) ( not ( = ?auto_850923 ?auto_850933 ) ) ( not ( = ?auto_850923 ?auto_850934 ) ) ( not ( = ?auto_850923 ?auto_850935 ) ) ( not ( = ?auto_850923 ?auto_850936 ) ) ( not ( = ?auto_850923 ?auto_850937 ) ) ( not ( = ?auto_850923 ?auto_850938 ) ) ( not ( = ?auto_850924 ?auto_850925 ) ) ( not ( = ?auto_850924 ?auto_850926 ) ) ( not ( = ?auto_850924 ?auto_850927 ) ) ( not ( = ?auto_850924 ?auto_850928 ) ) ( not ( = ?auto_850924 ?auto_850929 ) ) ( not ( = ?auto_850924 ?auto_850930 ) ) ( not ( = ?auto_850924 ?auto_850931 ) ) ( not ( = ?auto_850924 ?auto_850932 ) ) ( not ( = ?auto_850924 ?auto_850933 ) ) ( not ( = ?auto_850924 ?auto_850934 ) ) ( not ( = ?auto_850924 ?auto_850935 ) ) ( not ( = ?auto_850924 ?auto_850936 ) ) ( not ( = ?auto_850924 ?auto_850937 ) ) ( not ( = ?auto_850924 ?auto_850938 ) ) ( not ( = ?auto_850925 ?auto_850926 ) ) ( not ( = ?auto_850925 ?auto_850927 ) ) ( not ( = ?auto_850925 ?auto_850928 ) ) ( not ( = ?auto_850925 ?auto_850929 ) ) ( not ( = ?auto_850925 ?auto_850930 ) ) ( not ( = ?auto_850925 ?auto_850931 ) ) ( not ( = ?auto_850925 ?auto_850932 ) ) ( not ( = ?auto_850925 ?auto_850933 ) ) ( not ( = ?auto_850925 ?auto_850934 ) ) ( not ( = ?auto_850925 ?auto_850935 ) ) ( not ( = ?auto_850925 ?auto_850936 ) ) ( not ( = ?auto_850925 ?auto_850937 ) ) ( not ( = ?auto_850925 ?auto_850938 ) ) ( not ( = ?auto_850926 ?auto_850927 ) ) ( not ( = ?auto_850926 ?auto_850928 ) ) ( not ( = ?auto_850926 ?auto_850929 ) ) ( not ( = ?auto_850926 ?auto_850930 ) ) ( not ( = ?auto_850926 ?auto_850931 ) ) ( not ( = ?auto_850926 ?auto_850932 ) ) ( not ( = ?auto_850926 ?auto_850933 ) ) ( not ( = ?auto_850926 ?auto_850934 ) ) ( not ( = ?auto_850926 ?auto_850935 ) ) ( not ( = ?auto_850926 ?auto_850936 ) ) ( not ( = ?auto_850926 ?auto_850937 ) ) ( not ( = ?auto_850926 ?auto_850938 ) ) ( not ( = ?auto_850927 ?auto_850928 ) ) ( not ( = ?auto_850927 ?auto_850929 ) ) ( not ( = ?auto_850927 ?auto_850930 ) ) ( not ( = ?auto_850927 ?auto_850931 ) ) ( not ( = ?auto_850927 ?auto_850932 ) ) ( not ( = ?auto_850927 ?auto_850933 ) ) ( not ( = ?auto_850927 ?auto_850934 ) ) ( not ( = ?auto_850927 ?auto_850935 ) ) ( not ( = ?auto_850927 ?auto_850936 ) ) ( not ( = ?auto_850927 ?auto_850937 ) ) ( not ( = ?auto_850927 ?auto_850938 ) ) ( not ( = ?auto_850928 ?auto_850929 ) ) ( not ( = ?auto_850928 ?auto_850930 ) ) ( not ( = ?auto_850928 ?auto_850931 ) ) ( not ( = ?auto_850928 ?auto_850932 ) ) ( not ( = ?auto_850928 ?auto_850933 ) ) ( not ( = ?auto_850928 ?auto_850934 ) ) ( not ( = ?auto_850928 ?auto_850935 ) ) ( not ( = ?auto_850928 ?auto_850936 ) ) ( not ( = ?auto_850928 ?auto_850937 ) ) ( not ( = ?auto_850928 ?auto_850938 ) ) ( not ( = ?auto_850929 ?auto_850930 ) ) ( not ( = ?auto_850929 ?auto_850931 ) ) ( not ( = ?auto_850929 ?auto_850932 ) ) ( not ( = ?auto_850929 ?auto_850933 ) ) ( not ( = ?auto_850929 ?auto_850934 ) ) ( not ( = ?auto_850929 ?auto_850935 ) ) ( not ( = ?auto_850929 ?auto_850936 ) ) ( not ( = ?auto_850929 ?auto_850937 ) ) ( not ( = ?auto_850929 ?auto_850938 ) ) ( not ( = ?auto_850930 ?auto_850931 ) ) ( not ( = ?auto_850930 ?auto_850932 ) ) ( not ( = ?auto_850930 ?auto_850933 ) ) ( not ( = ?auto_850930 ?auto_850934 ) ) ( not ( = ?auto_850930 ?auto_850935 ) ) ( not ( = ?auto_850930 ?auto_850936 ) ) ( not ( = ?auto_850930 ?auto_850937 ) ) ( not ( = ?auto_850930 ?auto_850938 ) ) ( not ( = ?auto_850931 ?auto_850932 ) ) ( not ( = ?auto_850931 ?auto_850933 ) ) ( not ( = ?auto_850931 ?auto_850934 ) ) ( not ( = ?auto_850931 ?auto_850935 ) ) ( not ( = ?auto_850931 ?auto_850936 ) ) ( not ( = ?auto_850931 ?auto_850937 ) ) ( not ( = ?auto_850931 ?auto_850938 ) ) ( not ( = ?auto_850932 ?auto_850933 ) ) ( not ( = ?auto_850932 ?auto_850934 ) ) ( not ( = ?auto_850932 ?auto_850935 ) ) ( not ( = ?auto_850932 ?auto_850936 ) ) ( not ( = ?auto_850932 ?auto_850937 ) ) ( not ( = ?auto_850932 ?auto_850938 ) ) ( not ( = ?auto_850933 ?auto_850934 ) ) ( not ( = ?auto_850933 ?auto_850935 ) ) ( not ( = ?auto_850933 ?auto_850936 ) ) ( not ( = ?auto_850933 ?auto_850937 ) ) ( not ( = ?auto_850933 ?auto_850938 ) ) ( not ( = ?auto_850934 ?auto_850935 ) ) ( not ( = ?auto_850934 ?auto_850936 ) ) ( not ( = ?auto_850934 ?auto_850937 ) ) ( not ( = ?auto_850934 ?auto_850938 ) ) ( not ( = ?auto_850935 ?auto_850936 ) ) ( not ( = ?auto_850935 ?auto_850937 ) ) ( not ( = ?auto_850935 ?auto_850938 ) ) ( not ( = ?auto_850936 ?auto_850937 ) ) ( not ( = ?auto_850936 ?auto_850938 ) ) ( not ( = ?auto_850937 ?auto_850938 ) ) ( ON ?auto_850936 ?auto_850937 ) ( ON ?auto_850935 ?auto_850936 ) ( ON ?auto_850934 ?auto_850935 ) ( ON ?auto_850933 ?auto_850934 ) ( ON ?auto_850932 ?auto_850933 ) ( ON ?auto_850931 ?auto_850932 ) ( CLEAR ?auto_850929 ) ( ON ?auto_850930 ?auto_850931 ) ( CLEAR ?auto_850930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_850922 ?auto_850923 ?auto_850924 ?auto_850925 ?auto_850926 ?auto_850927 ?auto_850928 ?auto_850929 ?auto_850930 )
      ( MAKE-16PILE ?auto_850922 ?auto_850923 ?auto_850924 ?auto_850925 ?auto_850926 ?auto_850927 ?auto_850928 ?auto_850929 ?auto_850930 ?auto_850931 ?auto_850932 ?auto_850933 ?auto_850934 ?auto_850935 ?auto_850936 ?auto_850937 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_850988 - BLOCK
      ?auto_850989 - BLOCK
      ?auto_850990 - BLOCK
      ?auto_850991 - BLOCK
      ?auto_850992 - BLOCK
      ?auto_850993 - BLOCK
      ?auto_850994 - BLOCK
      ?auto_850995 - BLOCK
      ?auto_850996 - BLOCK
      ?auto_850997 - BLOCK
      ?auto_850998 - BLOCK
      ?auto_850999 - BLOCK
      ?auto_851000 - BLOCK
      ?auto_851001 - BLOCK
      ?auto_851002 - BLOCK
      ?auto_851003 - BLOCK
    )
    :vars
    (
      ?auto_851004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_851003 ?auto_851004 ) ( ON-TABLE ?auto_850988 ) ( ON ?auto_850989 ?auto_850988 ) ( ON ?auto_850990 ?auto_850989 ) ( ON ?auto_850991 ?auto_850990 ) ( ON ?auto_850992 ?auto_850991 ) ( ON ?auto_850993 ?auto_850992 ) ( ON ?auto_850994 ?auto_850993 ) ( not ( = ?auto_850988 ?auto_850989 ) ) ( not ( = ?auto_850988 ?auto_850990 ) ) ( not ( = ?auto_850988 ?auto_850991 ) ) ( not ( = ?auto_850988 ?auto_850992 ) ) ( not ( = ?auto_850988 ?auto_850993 ) ) ( not ( = ?auto_850988 ?auto_850994 ) ) ( not ( = ?auto_850988 ?auto_850995 ) ) ( not ( = ?auto_850988 ?auto_850996 ) ) ( not ( = ?auto_850988 ?auto_850997 ) ) ( not ( = ?auto_850988 ?auto_850998 ) ) ( not ( = ?auto_850988 ?auto_850999 ) ) ( not ( = ?auto_850988 ?auto_851000 ) ) ( not ( = ?auto_850988 ?auto_851001 ) ) ( not ( = ?auto_850988 ?auto_851002 ) ) ( not ( = ?auto_850988 ?auto_851003 ) ) ( not ( = ?auto_850988 ?auto_851004 ) ) ( not ( = ?auto_850989 ?auto_850990 ) ) ( not ( = ?auto_850989 ?auto_850991 ) ) ( not ( = ?auto_850989 ?auto_850992 ) ) ( not ( = ?auto_850989 ?auto_850993 ) ) ( not ( = ?auto_850989 ?auto_850994 ) ) ( not ( = ?auto_850989 ?auto_850995 ) ) ( not ( = ?auto_850989 ?auto_850996 ) ) ( not ( = ?auto_850989 ?auto_850997 ) ) ( not ( = ?auto_850989 ?auto_850998 ) ) ( not ( = ?auto_850989 ?auto_850999 ) ) ( not ( = ?auto_850989 ?auto_851000 ) ) ( not ( = ?auto_850989 ?auto_851001 ) ) ( not ( = ?auto_850989 ?auto_851002 ) ) ( not ( = ?auto_850989 ?auto_851003 ) ) ( not ( = ?auto_850989 ?auto_851004 ) ) ( not ( = ?auto_850990 ?auto_850991 ) ) ( not ( = ?auto_850990 ?auto_850992 ) ) ( not ( = ?auto_850990 ?auto_850993 ) ) ( not ( = ?auto_850990 ?auto_850994 ) ) ( not ( = ?auto_850990 ?auto_850995 ) ) ( not ( = ?auto_850990 ?auto_850996 ) ) ( not ( = ?auto_850990 ?auto_850997 ) ) ( not ( = ?auto_850990 ?auto_850998 ) ) ( not ( = ?auto_850990 ?auto_850999 ) ) ( not ( = ?auto_850990 ?auto_851000 ) ) ( not ( = ?auto_850990 ?auto_851001 ) ) ( not ( = ?auto_850990 ?auto_851002 ) ) ( not ( = ?auto_850990 ?auto_851003 ) ) ( not ( = ?auto_850990 ?auto_851004 ) ) ( not ( = ?auto_850991 ?auto_850992 ) ) ( not ( = ?auto_850991 ?auto_850993 ) ) ( not ( = ?auto_850991 ?auto_850994 ) ) ( not ( = ?auto_850991 ?auto_850995 ) ) ( not ( = ?auto_850991 ?auto_850996 ) ) ( not ( = ?auto_850991 ?auto_850997 ) ) ( not ( = ?auto_850991 ?auto_850998 ) ) ( not ( = ?auto_850991 ?auto_850999 ) ) ( not ( = ?auto_850991 ?auto_851000 ) ) ( not ( = ?auto_850991 ?auto_851001 ) ) ( not ( = ?auto_850991 ?auto_851002 ) ) ( not ( = ?auto_850991 ?auto_851003 ) ) ( not ( = ?auto_850991 ?auto_851004 ) ) ( not ( = ?auto_850992 ?auto_850993 ) ) ( not ( = ?auto_850992 ?auto_850994 ) ) ( not ( = ?auto_850992 ?auto_850995 ) ) ( not ( = ?auto_850992 ?auto_850996 ) ) ( not ( = ?auto_850992 ?auto_850997 ) ) ( not ( = ?auto_850992 ?auto_850998 ) ) ( not ( = ?auto_850992 ?auto_850999 ) ) ( not ( = ?auto_850992 ?auto_851000 ) ) ( not ( = ?auto_850992 ?auto_851001 ) ) ( not ( = ?auto_850992 ?auto_851002 ) ) ( not ( = ?auto_850992 ?auto_851003 ) ) ( not ( = ?auto_850992 ?auto_851004 ) ) ( not ( = ?auto_850993 ?auto_850994 ) ) ( not ( = ?auto_850993 ?auto_850995 ) ) ( not ( = ?auto_850993 ?auto_850996 ) ) ( not ( = ?auto_850993 ?auto_850997 ) ) ( not ( = ?auto_850993 ?auto_850998 ) ) ( not ( = ?auto_850993 ?auto_850999 ) ) ( not ( = ?auto_850993 ?auto_851000 ) ) ( not ( = ?auto_850993 ?auto_851001 ) ) ( not ( = ?auto_850993 ?auto_851002 ) ) ( not ( = ?auto_850993 ?auto_851003 ) ) ( not ( = ?auto_850993 ?auto_851004 ) ) ( not ( = ?auto_850994 ?auto_850995 ) ) ( not ( = ?auto_850994 ?auto_850996 ) ) ( not ( = ?auto_850994 ?auto_850997 ) ) ( not ( = ?auto_850994 ?auto_850998 ) ) ( not ( = ?auto_850994 ?auto_850999 ) ) ( not ( = ?auto_850994 ?auto_851000 ) ) ( not ( = ?auto_850994 ?auto_851001 ) ) ( not ( = ?auto_850994 ?auto_851002 ) ) ( not ( = ?auto_850994 ?auto_851003 ) ) ( not ( = ?auto_850994 ?auto_851004 ) ) ( not ( = ?auto_850995 ?auto_850996 ) ) ( not ( = ?auto_850995 ?auto_850997 ) ) ( not ( = ?auto_850995 ?auto_850998 ) ) ( not ( = ?auto_850995 ?auto_850999 ) ) ( not ( = ?auto_850995 ?auto_851000 ) ) ( not ( = ?auto_850995 ?auto_851001 ) ) ( not ( = ?auto_850995 ?auto_851002 ) ) ( not ( = ?auto_850995 ?auto_851003 ) ) ( not ( = ?auto_850995 ?auto_851004 ) ) ( not ( = ?auto_850996 ?auto_850997 ) ) ( not ( = ?auto_850996 ?auto_850998 ) ) ( not ( = ?auto_850996 ?auto_850999 ) ) ( not ( = ?auto_850996 ?auto_851000 ) ) ( not ( = ?auto_850996 ?auto_851001 ) ) ( not ( = ?auto_850996 ?auto_851002 ) ) ( not ( = ?auto_850996 ?auto_851003 ) ) ( not ( = ?auto_850996 ?auto_851004 ) ) ( not ( = ?auto_850997 ?auto_850998 ) ) ( not ( = ?auto_850997 ?auto_850999 ) ) ( not ( = ?auto_850997 ?auto_851000 ) ) ( not ( = ?auto_850997 ?auto_851001 ) ) ( not ( = ?auto_850997 ?auto_851002 ) ) ( not ( = ?auto_850997 ?auto_851003 ) ) ( not ( = ?auto_850997 ?auto_851004 ) ) ( not ( = ?auto_850998 ?auto_850999 ) ) ( not ( = ?auto_850998 ?auto_851000 ) ) ( not ( = ?auto_850998 ?auto_851001 ) ) ( not ( = ?auto_850998 ?auto_851002 ) ) ( not ( = ?auto_850998 ?auto_851003 ) ) ( not ( = ?auto_850998 ?auto_851004 ) ) ( not ( = ?auto_850999 ?auto_851000 ) ) ( not ( = ?auto_850999 ?auto_851001 ) ) ( not ( = ?auto_850999 ?auto_851002 ) ) ( not ( = ?auto_850999 ?auto_851003 ) ) ( not ( = ?auto_850999 ?auto_851004 ) ) ( not ( = ?auto_851000 ?auto_851001 ) ) ( not ( = ?auto_851000 ?auto_851002 ) ) ( not ( = ?auto_851000 ?auto_851003 ) ) ( not ( = ?auto_851000 ?auto_851004 ) ) ( not ( = ?auto_851001 ?auto_851002 ) ) ( not ( = ?auto_851001 ?auto_851003 ) ) ( not ( = ?auto_851001 ?auto_851004 ) ) ( not ( = ?auto_851002 ?auto_851003 ) ) ( not ( = ?auto_851002 ?auto_851004 ) ) ( not ( = ?auto_851003 ?auto_851004 ) ) ( ON ?auto_851002 ?auto_851003 ) ( ON ?auto_851001 ?auto_851002 ) ( ON ?auto_851000 ?auto_851001 ) ( ON ?auto_850999 ?auto_851000 ) ( ON ?auto_850998 ?auto_850999 ) ( ON ?auto_850997 ?auto_850998 ) ( ON ?auto_850996 ?auto_850997 ) ( CLEAR ?auto_850994 ) ( ON ?auto_850995 ?auto_850996 ) ( CLEAR ?auto_850995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_850988 ?auto_850989 ?auto_850990 ?auto_850991 ?auto_850992 ?auto_850993 ?auto_850994 ?auto_850995 )
      ( MAKE-16PILE ?auto_850988 ?auto_850989 ?auto_850990 ?auto_850991 ?auto_850992 ?auto_850993 ?auto_850994 ?auto_850995 ?auto_850996 ?auto_850997 ?auto_850998 ?auto_850999 ?auto_851000 ?auto_851001 ?auto_851002 ?auto_851003 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_851054 - BLOCK
      ?auto_851055 - BLOCK
      ?auto_851056 - BLOCK
      ?auto_851057 - BLOCK
      ?auto_851058 - BLOCK
      ?auto_851059 - BLOCK
      ?auto_851060 - BLOCK
      ?auto_851061 - BLOCK
      ?auto_851062 - BLOCK
      ?auto_851063 - BLOCK
      ?auto_851064 - BLOCK
      ?auto_851065 - BLOCK
      ?auto_851066 - BLOCK
      ?auto_851067 - BLOCK
      ?auto_851068 - BLOCK
      ?auto_851069 - BLOCK
    )
    :vars
    (
      ?auto_851070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_851069 ?auto_851070 ) ( ON-TABLE ?auto_851054 ) ( ON ?auto_851055 ?auto_851054 ) ( ON ?auto_851056 ?auto_851055 ) ( ON ?auto_851057 ?auto_851056 ) ( ON ?auto_851058 ?auto_851057 ) ( ON ?auto_851059 ?auto_851058 ) ( not ( = ?auto_851054 ?auto_851055 ) ) ( not ( = ?auto_851054 ?auto_851056 ) ) ( not ( = ?auto_851054 ?auto_851057 ) ) ( not ( = ?auto_851054 ?auto_851058 ) ) ( not ( = ?auto_851054 ?auto_851059 ) ) ( not ( = ?auto_851054 ?auto_851060 ) ) ( not ( = ?auto_851054 ?auto_851061 ) ) ( not ( = ?auto_851054 ?auto_851062 ) ) ( not ( = ?auto_851054 ?auto_851063 ) ) ( not ( = ?auto_851054 ?auto_851064 ) ) ( not ( = ?auto_851054 ?auto_851065 ) ) ( not ( = ?auto_851054 ?auto_851066 ) ) ( not ( = ?auto_851054 ?auto_851067 ) ) ( not ( = ?auto_851054 ?auto_851068 ) ) ( not ( = ?auto_851054 ?auto_851069 ) ) ( not ( = ?auto_851054 ?auto_851070 ) ) ( not ( = ?auto_851055 ?auto_851056 ) ) ( not ( = ?auto_851055 ?auto_851057 ) ) ( not ( = ?auto_851055 ?auto_851058 ) ) ( not ( = ?auto_851055 ?auto_851059 ) ) ( not ( = ?auto_851055 ?auto_851060 ) ) ( not ( = ?auto_851055 ?auto_851061 ) ) ( not ( = ?auto_851055 ?auto_851062 ) ) ( not ( = ?auto_851055 ?auto_851063 ) ) ( not ( = ?auto_851055 ?auto_851064 ) ) ( not ( = ?auto_851055 ?auto_851065 ) ) ( not ( = ?auto_851055 ?auto_851066 ) ) ( not ( = ?auto_851055 ?auto_851067 ) ) ( not ( = ?auto_851055 ?auto_851068 ) ) ( not ( = ?auto_851055 ?auto_851069 ) ) ( not ( = ?auto_851055 ?auto_851070 ) ) ( not ( = ?auto_851056 ?auto_851057 ) ) ( not ( = ?auto_851056 ?auto_851058 ) ) ( not ( = ?auto_851056 ?auto_851059 ) ) ( not ( = ?auto_851056 ?auto_851060 ) ) ( not ( = ?auto_851056 ?auto_851061 ) ) ( not ( = ?auto_851056 ?auto_851062 ) ) ( not ( = ?auto_851056 ?auto_851063 ) ) ( not ( = ?auto_851056 ?auto_851064 ) ) ( not ( = ?auto_851056 ?auto_851065 ) ) ( not ( = ?auto_851056 ?auto_851066 ) ) ( not ( = ?auto_851056 ?auto_851067 ) ) ( not ( = ?auto_851056 ?auto_851068 ) ) ( not ( = ?auto_851056 ?auto_851069 ) ) ( not ( = ?auto_851056 ?auto_851070 ) ) ( not ( = ?auto_851057 ?auto_851058 ) ) ( not ( = ?auto_851057 ?auto_851059 ) ) ( not ( = ?auto_851057 ?auto_851060 ) ) ( not ( = ?auto_851057 ?auto_851061 ) ) ( not ( = ?auto_851057 ?auto_851062 ) ) ( not ( = ?auto_851057 ?auto_851063 ) ) ( not ( = ?auto_851057 ?auto_851064 ) ) ( not ( = ?auto_851057 ?auto_851065 ) ) ( not ( = ?auto_851057 ?auto_851066 ) ) ( not ( = ?auto_851057 ?auto_851067 ) ) ( not ( = ?auto_851057 ?auto_851068 ) ) ( not ( = ?auto_851057 ?auto_851069 ) ) ( not ( = ?auto_851057 ?auto_851070 ) ) ( not ( = ?auto_851058 ?auto_851059 ) ) ( not ( = ?auto_851058 ?auto_851060 ) ) ( not ( = ?auto_851058 ?auto_851061 ) ) ( not ( = ?auto_851058 ?auto_851062 ) ) ( not ( = ?auto_851058 ?auto_851063 ) ) ( not ( = ?auto_851058 ?auto_851064 ) ) ( not ( = ?auto_851058 ?auto_851065 ) ) ( not ( = ?auto_851058 ?auto_851066 ) ) ( not ( = ?auto_851058 ?auto_851067 ) ) ( not ( = ?auto_851058 ?auto_851068 ) ) ( not ( = ?auto_851058 ?auto_851069 ) ) ( not ( = ?auto_851058 ?auto_851070 ) ) ( not ( = ?auto_851059 ?auto_851060 ) ) ( not ( = ?auto_851059 ?auto_851061 ) ) ( not ( = ?auto_851059 ?auto_851062 ) ) ( not ( = ?auto_851059 ?auto_851063 ) ) ( not ( = ?auto_851059 ?auto_851064 ) ) ( not ( = ?auto_851059 ?auto_851065 ) ) ( not ( = ?auto_851059 ?auto_851066 ) ) ( not ( = ?auto_851059 ?auto_851067 ) ) ( not ( = ?auto_851059 ?auto_851068 ) ) ( not ( = ?auto_851059 ?auto_851069 ) ) ( not ( = ?auto_851059 ?auto_851070 ) ) ( not ( = ?auto_851060 ?auto_851061 ) ) ( not ( = ?auto_851060 ?auto_851062 ) ) ( not ( = ?auto_851060 ?auto_851063 ) ) ( not ( = ?auto_851060 ?auto_851064 ) ) ( not ( = ?auto_851060 ?auto_851065 ) ) ( not ( = ?auto_851060 ?auto_851066 ) ) ( not ( = ?auto_851060 ?auto_851067 ) ) ( not ( = ?auto_851060 ?auto_851068 ) ) ( not ( = ?auto_851060 ?auto_851069 ) ) ( not ( = ?auto_851060 ?auto_851070 ) ) ( not ( = ?auto_851061 ?auto_851062 ) ) ( not ( = ?auto_851061 ?auto_851063 ) ) ( not ( = ?auto_851061 ?auto_851064 ) ) ( not ( = ?auto_851061 ?auto_851065 ) ) ( not ( = ?auto_851061 ?auto_851066 ) ) ( not ( = ?auto_851061 ?auto_851067 ) ) ( not ( = ?auto_851061 ?auto_851068 ) ) ( not ( = ?auto_851061 ?auto_851069 ) ) ( not ( = ?auto_851061 ?auto_851070 ) ) ( not ( = ?auto_851062 ?auto_851063 ) ) ( not ( = ?auto_851062 ?auto_851064 ) ) ( not ( = ?auto_851062 ?auto_851065 ) ) ( not ( = ?auto_851062 ?auto_851066 ) ) ( not ( = ?auto_851062 ?auto_851067 ) ) ( not ( = ?auto_851062 ?auto_851068 ) ) ( not ( = ?auto_851062 ?auto_851069 ) ) ( not ( = ?auto_851062 ?auto_851070 ) ) ( not ( = ?auto_851063 ?auto_851064 ) ) ( not ( = ?auto_851063 ?auto_851065 ) ) ( not ( = ?auto_851063 ?auto_851066 ) ) ( not ( = ?auto_851063 ?auto_851067 ) ) ( not ( = ?auto_851063 ?auto_851068 ) ) ( not ( = ?auto_851063 ?auto_851069 ) ) ( not ( = ?auto_851063 ?auto_851070 ) ) ( not ( = ?auto_851064 ?auto_851065 ) ) ( not ( = ?auto_851064 ?auto_851066 ) ) ( not ( = ?auto_851064 ?auto_851067 ) ) ( not ( = ?auto_851064 ?auto_851068 ) ) ( not ( = ?auto_851064 ?auto_851069 ) ) ( not ( = ?auto_851064 ?auto_851070 ) ) ( not ( = ?auto_851065 ?auto_851066 ) ) ( not ( = ?auto_851065 ?auto_851067 ) ) ( not ( = ?auto_851065 ?auto_851068 ) ) ( not ( = ?auto_851065 ?auto_851069 ) ) ( not ( = ?auto_851065 ?auto_851070 ) ) ( not ( = ?auto_851066 ?auto_851067 ) ) ( not ( = ?auto_851066 ?auto_851068 ) ) ( not ( = ?auto_851066 ?auto_851069 ) ) ( not ( = ?auto_851066 ?auto_851070 ) ) ( not ( = ?auto_851067 ?auto_851068 ) ) ( not ( = ?auto_851067 ?auto_851069 ) ) ( not ( = ?auto_851067 ?auto_851070 ) ) ( not ( = ?auto_851068 ?auto_851069 ) ) ( not ( = ?auto_851068 ?auto_851070 ) ) ( not ( = ?auto_851069 ?auto_851070 ) ) ( ON ?auto_851068 ?auto_851069 ) ( ON ?auto_851067 ?auto_851068 ) ( ON ?auto_851066 ?auto_851067 ) ( ON ?auto_851065 ?auto_851066 ) ( ON ?auto_851064 ?auto_851065 ) ( ON ?auto_851063 ?auto_851064 ) ( ON ?auto_851062 ?auto_851063 ) ( ON ?auto_851061 ?auto_851062 ) ( CLEAR ?auto_851059 ) ( ON ?auto_851060 ?auto_851061 ) ( CLEAR ?auto_851060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_851054 ?auto_851055 ?auto_851056 ?auto_851057 ?auto_851058 ?auto_851059 ?auto_851060 )
      ( MAKE-16PILE ?auto_851054 ?auto_851055 ?auto_851056 ?auto_851057 ?auto_851058 ?auto_851059 ?auto_851060 ?auto_851061 ?auto_851062 ?auto_851063 ?auto_851064 ?auto_851065 ?auto_851066 ?auto_851067 ?auto_851068 ?auto_851069 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_851120 - BLOCK
      ?auto_851121 - BLOCK
      ?auto_851122 - BLOCK
      ?auto_851123 - BLOCK
      ?auto_851124 - BLOCK
      ?auto_851125 - BLOCK
      ?auto_851126 - BLOCK
      ?auto_851127 - BLOCK
      ?auto_851128 - BLOCK
      ?auto_851129 - BLOCK
      ?auto_851130 - BLOCK
      ?auto_851131 - BLOCK
      ?auto_851132 - BLOCK
      ?auto_851133 - BLOCK
      ?auto_851134 - BLOCK
      ?auto_851135 - BLOCK
    )
    :vars
    (
      ?auto_851136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_851135 ?auto_851136 ) ( ON-TABLE ?auto_851120 ) ( ON ?auto_851121 ?auto_851120 ) ( ON ?auto_851122 ?auto_851121 ) ( ON ?auto_851123 ?auto_851122 ) ( ON ?auto_851124 ?auto_851123 ) ( not ( = ?auto_851120 ?auto_851121 ) ) ( not ( = ?auto_851120 ?auto_851122 ) ) ( not ( = ?auto_851120 ?auto_851123 ) ) ( not ( = ?auto_851120 ?auto_851124 ) ) ( not ( = ?auto_851120 ?auto_851125 ) ) ( not ( = ?auto_851120 ?auto_851126 ) ) ( not ( = ?auto_851120 ?auto_851127 ) ) ( not ( = ?auto_851120 ?auto_851128 ) ) ( not ( = ?auto_851120 ?auto_851129 ) ) ( not ( = ?auto_851120 ?auto_851130 ) ) ( not ( = ?auto_851120 ?auto_851131 ) ) ( not ( = ?auto_851120 ?auto_851132 ) ) ( not ( = ?auto_851120 ?auto_851133 ) ) ( not ( = ?auto_851120 ?auto_851134 ) ) ( not ( = ?auto_851120 ?auto_851135 ) ) ( not ( = ?auto_851120 ?auto_851136 ) ) ( not ( = ?auto_851121 ?auto_851122 ) ) ( not ( = ?auto_851121 ?auto_851123 ) ) ( not ( = ?auto_851121 ?auto_851124 ) ) ( not ( = ?auto_851121 ?auto_851125 ) ) ( not ( = ?auto_851121 ?auto_851126 ) ) ( not ( = ?auto_851121 ?auto_851127 ) ) ( not ( = ?auto_851121 ?auto_851128 ) ) ( not ( = ?auto_851121 ?auto_851129 ) ) ( not ( = ?auto_851121 ?auto_851130 ) ) ( not ( = ?auto_851121 ?auto_851131 ) ) ( not ( = ?auto_851121 ?auto_851132 ) ) ( not ( = ?auto_851121 ?auto_851133 ) ) ( not ( = ?auto_851121 ?auto_851134 ) ) ( not ( = ?auto_851121 ?auto_851135 ) ) ( not ( = ?auto_851121 ?auto_851136 ) ) ( not ( = ?auto_851122 ?auto_851123 ) ) ( not ( = ?auto_851122 ?auto_851124 ) ) ( not ( = ?auto_851122 ?auto_851125 ) ) ( not ( = ?auto_851122 ?auto_851126 ) ) ( not ( = ?auto_851122 ?auto_851127 ) ) ( not ( = ?auto_851122 ?auto_851128 ) ) ( not ( = ?auto_851122 ?auto_851129 ) ) ( not ( = ?auto_851122 ?auto_851130 ) ) ( not ( = ?auto_851122 ?auto_851131 ) ) ( not ( = ?auto_851122 ?auto_851132 ) ) ( not ( = ?auto_851122 ?auto_851133 ) ) ( not ( = ?auto_851122 ?auto_851134 ) ) ( not ( = ?auto_851122 ?auto_851135 ) ) ( not ( = ?auto_851122 ?auto_851136 ) ) ( not ( = ?auto_851123 ?auto_851124 ) ) ( not ( = ?auto_851123 ?auto_851125 ) ) ( not ( = ?auto_851123 ?auto_851126 ) ) ( not ( = ?auto_851123 ?auto_851127 ) ) ( not ( = ?auto_851123 ?auto_851128 ) ) ( not ( = ?auto_851123 ?auto_851129 ) ) ( not ( = ?auto_851123 ?auto_851130 ) ) ( not ( = ?auto_851123 ?auto_851131 ) ) ( not ( = ?auto_851123 ?auto_851132 ) ) ( not ( = ?auto_851123 ?auto_851133 ) ) ( not ( = ?auto_851123 ?auto_851134 ) ) ( not ( = ?auto_851123 ?auto_851135 ) ) ( not ( = ?auto_851123 ?auto_851136 ) ) ( not ( = ?auto_851124 ?auto_851125 ) ) ( not ( = ?auto_851124 ?auto_851126 ) ) ( not ( = ?auto_851124 ?auto_851127 ) ) ( not ( = ?auto_851124 ?auto_851128 ) ) ( not ( = ?auto_851124 ?auto_851129 ) ) ( not ( = ?auto_851124 ?auto_851130 ) ) ( not ( = ?auto_851124 ?auto_851131 ) ) ( not ( = ?auto_851124 ?auto_851132 ) ) ( not ( = ?auto_851124 ?auto_851133 ) ) ( not ( = ?auto_851124 ?auto_851134 ) ) ( not ( = ?auto_851124 ?auto_851135 ) ) ( not ( = ?auto_851124 ?auto_851136 ) ) ( not ( = ?auto_851125 ?auto_851126 ) ) ( not ( = ?auto_851125 ?auto_851127 ) ) ( not ( = ?auto_851125 ?auto_851128 ) ) ( not ( = ?auto_851125 ?auto_851129 ) ) ( not ( = ?auto_851125 ?auto_851130 ) ) ( not ( = ?auto_851125 ?auto_851131 ) ) ( not ( = ?auto_851125 ?auto_851132 ) ) ( not ( = ?auto_851125 ?auto_851133 ) ) ( not ( = ?auto_851125 ?auto_851134 ) ) ( not ( = ?auto_851125 ?auto_851135 ) ) ( not ( = ?auto_851125 ?auto_851136 ) ) ( not ( = ?auto_851126 ?auto_851127 ) ) ( not ( = ?auto_851126 ?auto_851128 ) ) ( not ( = ?auto_851126 ?auto_851129 ) ) ( not ( = ?auto_851126 ?auto_851130 ) ) ( not ( = ?auto_851126 ?auto_851131 ) ) ( not ( = ?auto_851126 ?auto_851132 ) ) ( not ( = ?auto_851126 ?auto_851133 ) ) ( not ( = ?auto_851126 ?auto_851134 ) ) ( not ( = ?auto_851126 ?auto_851135 ) ) ( not ( = ?auto_851126 ?auto_851136 ) ) ( not ( = ?auto_851127 ?auto_851128 ) ) ( not ( = ?auto_851127 ?auto_851129 ) ) ( not ( = ?auto_851127 ?auto_851130 ) ) ( not ( = ?auto_851127 ?auto_851131 ) ) ( not ( = ?auto_851127 ?auto_851132 ) ) ( not ( = ?auto_851127 ?auto_851133 ) ) ( not ( = ?auto_851127 ?auto_851134 ) ) ( not ( = ?auto_851127 ?auto_851135 ) ) ( not ( = ?auto_851127 ?auto_851136 ) ) ( not ( = ?auto_851128 ?auto_851129 ) ) ( not ( = ?auto_851128 ?auto_851130 ) ) ( not ( = ?auto_851128 ?auto_851131 ) ) ( not ( = ?auto_851128 ?auto_851132 ) ) ( not ( = ?auto_851128 ?auto_851133 ) ) ( not ( = ?auto_851128 ?auto_851134 ) ) ( not ( = ?auto_851128 ?auto_851135 ) ) ( not ( = ?auto_851128 ?auto_851136 ) ) ( not ( = ?auto_851129 ?auto_851130 ) ) ( not ( = ?auto_851129 ?auto_851131 ) ) ( not ( = ?auto_851129 ?auto_851132 ) ) ( not ( = ?auto_851129 ?auto_851133 ) ) ( not ( = ?auto_851129 ?auto_851134 ) ) ( not ( = ?auto_851129 ?auto_851135 ) ) ( not ( = ?auto_851129 ?auto_851136 ) ) ( not ( = ?auto_851130 ?auto_851131 ) ) ( not ( = ?auto_851130 ?auto_851132 ) ) ( not ( = ?auto_851130 ?auto_851133 ) ) ( not ( = ?auto_851130 ?auto_851134 ) ) ( not ( = ?auto_851130 ?auto_851135 ) ) ( not ( = ?auto_851130 ?auto_851136 ) ) ( not ( = ?auto_851131 ?auto_851132 ) ) ( not ( = ?auto_851131 ?auto_851133 ) ) ( not ( = ?auto_851131 ?auto_851134 ) ) ( not ( = ?auto_851131 ?auto_851135 ) ) ( not ( = ?auto_851131 ?auto_851136 ) ) ( not ( = ?auto_851132 ?auto_851133 ) ) ( not ( = ?auto_851132 ?auto_851134 ) ) ( not ( = ?auto_851132 ?auto_851135 ) ) ( not ( = ?auto_851132 ?auto_851136 ) ) ( not ( = ?auto_851133 ?auto_851134 ) ) ( not ( = ?auto_851133 ?auto_851135 ) ) ( not ( = ?auto_851133 ?auto_851136 ) ) ( not ( = ?auto_851134 ?auto_851135 ) ) ( not ( = ?auto_851134 ?auto_851136 ) ) ( not ( = ?auto_851135 ?auto_851136 ) ) ( ON ?auto_851134 ?auto_851135 ) ( ON ?auto_851133 ?auto_851134 ) ( ON ?auto_851132 ?auto_851133 ) ( ON ?auto_851131 ?auto_851132 ) ( ON ?auto_851130 ?auto_851131 ) ( ON ?auto_851129 ?auto_851130 ) ( ON ?auto_851128 ?auto_851129 ) ( ON ?auto_851127 ?auto_851128 ) ( ON ?auto_851126 ?auto_851127 ) ( CLEAR ?auto_851124 ) ( ON ?auto_851125 ?auto_851126 ) ( CLEAR ?auto_851125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_851120 ?auto_851121 ?auto_851122 ?auto_851123 ?auto_851124 ?auto_851125 )
      ( MAKE-16PILE ?auto_851120 ?auto_851121 ?auto_851122 ?auto_851123 ?auto_851124 ?auto_851125 ?auto_851126 ?auto_851127 ?auto_851128 ?auto_851129 ?auto_851130 ?auto_851131 ?auto_851132 ?auto_851133 ?auto_851134 ?auto_851135 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_851186 - BLOCK
      ?auto_851187 - BLOCK
      ?auto_851188 - BLOCK
      ?auto_851189 - BLOCK
      ?auto_851190 - BLOCK
      ?auto_851191 - BLOCK
      ?auto_851192 - BLOCK
      ?auto_851193 - BLOCK
      ?auto_851194 - BLOCK
      ?auto_851195 - BLOCK
      ?auto_851196 - BLOCK
      ?auto_851197 - BLOCK
      ?auto_851198 - BLOCK
      ?auto_851199 - BLOCK
      ?auto_851200 - BLOCK
      ?auto_851201 - BLOCK
    )
    :vars
    (
      ?auto_851202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_851201 ?auto_851202 ) ( ON-TABLE ?auto_851186 ) ( ON ?auto_851187 ?auto_851186 ) ( ON ?auto_851188 ?auto_851187 ) ( ON ?auto_851189 ?auto_851188 ) ( not ( = ?auto_851186 ?auto_851187 ) ) ( not ( = ?auto_851186 ?auto_851188 ) ) ( not ( = ?auto_851186 ?auto_851189 ) ) ( not ( = ?auto_851186 ?auto_851190 ) ) ( not ( = ?auto_851186 ?auto_851191 ) ) ( not ( = ?auto_851186 ?auto_851192 ) ) ( not ( = ?auto_851186 ?auto_851193 ) ) ( not ( = ?auto_851186 ?auto_851194 ) ) ( not ( = ?auto_851186 ?auto_851195 ) ) ( not ( = ?auto_851186 ?auto_851196 ) ) ( not ( = ?auto_851186 ?auto_851197 ) ) ( not ( = ?auto_851186 ?auto_851198 ) ) ( not ( = ?auto_851186 ?auto_851199 ) ) ( not ( = ?auto_851186 ?auto_851200 ) ) ( not ( = ?auto_851186 ?auto_851201 ) ) ( not ( = ?auto_851186 ?auto_851202 ) ) ( not ( = ?auto_851187 ?auto_851188 ) ) ( not ( = ?auto_851187 ?auto_851189 ) ) ( not ( = ?auto_851187 ?auto_851190 ) ) ( not ( = ?auto_851187 ?auto_851191 ) ) ( not ( = ?auto_851187 ?auto_851192 ) ) ( not ( = ?auto_851187 ?auto_851193 ) ) ( not ( = ?auto_851187 ?auto_851194 ) ) ( not ( = ?auto_851187 ?auto_851195 ) ) ( not ( = ?auto_851187 ?auto_851196 ) ) ( not ( = ?auto_851187 ?auto_851197 ) ) ( not ( = ?auto_851187 ?auto_851198 ) ) ( not ( = ?auto_851187 ?auto_851199 ) ) ( not ( = ?auto_851187 ?auto_851200 ) ) ( not ( = ?auto_851187 ?auto_851201 ) ) ( not ( = ?auto_851187 ?auto_851202 ) ) ( not ( = ?auto_851188 ?auto_851189 ) ) ( not ( = ?auto_851188 ?auto_851190 ) ) ( not ( = ?auto_851188 ?auto_851191 ) ) ( not ( = ?auto_851188 ?auto_851192 ) ) ( not ( = ?auto_851188 ?auto_851193 ) ) ( not ( = ?auto_851188 ?auto_851194 ) ) ( not ( = ?auto_851188 ?auto_851195 ) ) ( not ( = ?auto_851188 ?auto_851196 ) ) ( not ( = ?auto_851188 ?auto_851197 ) ) ( not ( = ?auto_851188 ?auto_851198 ) ) ( not ( = ?auto_851188 ?auto_851199 ) ) ( not ( = ?auto_851188 ?auto_851200 ) ) ( not ( = ?auto_851188 ?auto_851201 ) ) ( not ( = ?auto_851188 ?auto_851202 ) ) ( not ( = ?auto_851189 ?auto_851190 ) ) ( not ( = ?auto_851189 ?auto_851191 ) ) ( not ( = ?auto_851189 ?auto_851192 ) ) ( not ( = ?auto_851189 ?auto_851193 ) ) ( not ( = ?auto_851189 ?auto_851194 ) ) ( not ( = ?auto_851189 ?auto_851195 ) ) ( not ( = ?auto_851189 ?auto_851196 ) ) ( not ( = ?auto_851189 ?auto_851197 ) ) ( not ( = ?auto_851189 ?auto_851198 ) ) ( not ( = ?auto_851189 ?auto_851199 ) ) ( not ( = ?auto_851189 ?auto_851200 ) ) ( not ( = ?auto_851189 ?auto_851201 ) ) ( not ( = ?auto_851189 ?auto_851202 ) ) ( not ( = ?auto_851190 ?auto_851191 ) ) ( not ( = ?auto_851190 ?auto_851192 ) ) ( not ( = ?auto_851190 ?auto_851193 ) ) ( not ( = ?auto_851190 ?auto_851194 ) ) ( not ( = ?auto_851190 ?auto_851195 ) ) ( not ( = ?auto_851190 ?auto_851196 ) ) ( not ( = ?auto_851190 ?auto_851197 ) ) ( not ( = ?auto_851190 ?auto_851198 ) ) ( not ( = ?auto_851190 ?auto_851199 ) ) ( not ( = ?auto_851190 ?auto_851200 ) ) ( not ( = ?auto_851190 ?auto_851201 ) ) ( not ( = ?auto_851190 ?auto_851202 ) ) ( not ( = ?auto_851191 ?auto_851192 ) ) ( not ( = ?auto_851191 ?auto_851193 ) ) ( not ( = ?auto_851191 ?auto_851194 ) ) ( not ( = ?auto_851191 ?auto_851195 ) ) ( not ( = ?auto_851191 ?auto_851196 ) ) ( not ( = ?auto_851191 ?auto_851197 ) ) ( not ( = ?auto_851191 ?auto_851198 ) ) ( not ( = ?auto_851191 ?auto_851199 ) ) ( not ( = ?auto_851191 ?auto_851200 ) ) ( not ( = ?auto_851191 ?auto_851201 ) ) ( not ( = ?auto_851191 ?auto_851202 ) ) ( not ( = ?auto_851192 ?auto_851193 ) ) ( not ( = ?auto_851192 ?auto_851194 ) ) ( not ( = ?auto_851192 ?auto_851195 ) ) ( not ( = ?auto_851192 ?auto_851196 ) ) ( not ( = ?auto_851192 ?auto_851197 ) ) ( not ( = ?auto_851192 ?auto_851198 ) ) ( not ( = ?auto_851192 ?auto_851199 ) ) ( not ( = ?auto_851192 ?auto_851200 ) ) ( not ( = ?auto_851192 ?auto_851201 ) ) ( not ( = ?auto_851192 ?auto_851202 ) ) ( not ( = ?auto_851193 ?auto_851194 ) ) ( not ( = ?auto_851193 ?auto_851195 ) ) ( not ( = ?auto_851193 ?auto_851196 ) ) ( not ( = ?auto_851193 ?auto_851197 ) ) ( not ( = ?auto_851193 ?auto_851198 ) ) ( not ( = ?auto_851193 ?auto_851199 ) ) ( not ( = ?auto_851193 ?auto_851200 ) ) ( not ( = ?auto_851193 ?auto_851201 ) ) ( not ( = ?auto_851193 ?auto_851202 ) ) ( not ( = ?auto_851194 ?auto_851195 ) ) ( not ( = ?auto_851194 ?auto_851196 ) ) ( not ( = ?auto_851194 ?auto_851197 ) ) ( not ( = ?auto_851194 ?auto_851198 ) ) ( not ( = ?auto_851194 ?auto_851199 ) ) ( not ( = ?auto_851194 ?auto_851200 ) ) ( not ( = ?auto_851194 ?auto_851201 ) ) ( not ( = ?auto_851194 ?auto_851202 ) ) ( not ( = ?auto_851195 ?auto_851196 ) ) ( not ( = ?auto_851195 ?auto_851197 ) ) ( not ( = ?auto_851195 ?auto_851198 ) ) ( not ( = ?auto_851195 ?auto_851199 ) ) ( not ( = ?auto_851195 ?auto_851200 ) ) ( not ( = ?auto_851195 ?auto_851201 ) ) ( not ( = ?auto_851195 ?auto_851202 ) ) ( not ( = ?auto_851196 ?auto_851197 ) ) ( not ( = ?auto_851196 ?auto_851198 ) ) ( not ( = ?auto_851196 ?auto_851199 ) ) ( not ( = ?auto_851196 ?auto_851200 ) ) ( not ( = ?auto_851196 ?auto_851201 ) ) ( not ( = ?auto_851196 ?auto_851202 ) ) ( not ( = ?auto_851197 ?auto_851198 ) ) ( not ( = ?auto_851197 ?auto_851199 ) ) ( not ( = ?auto_851197 ?auto_851200 ) ) ( not ( = ?auto_851197 ?auto_851201 ) ) ( not ( = ?auto_851197 ?auto_851202 ) ) ( not ( = ?auto_851198 ?auto_851199 ) ) ( not ( = ?auto_851198 ?auto_851200 ) ) ( not ( = ?auto_851198 ?auto_851201 ) ) ( not ( = ?auto_851198 ?auto_851202 ) ) ( not ( = ?auto_851199 ?auto_851200 ) ) ( not ( = ?auto_851199 ?auto_851201 ) ) ( not ( = ?auto_851199 ?auto_851202 ) ) ( not ( = ?auto_851200 ?auto_851201 ) ) ( not ( = ?auto_851200 ?auto_851202 ) ) ( not ( = ?auto_851201 ?auto_851202 ) ) ( ON ?auto_851200 ?auto_851201 ) ( ON ?auto_851199 ?auto_851200 ) ( ON ?auto_851198 ?auto_851199 ) ( ON ?auto_851197 ?auto_851198 ) ( ON ?auto_851196 ?auto_851197 ) ( ON ?auto_851195 ?auto_851196 ) ( ON ?auto_851194 ?auto_851195 ) ( ON ?auto_851193 ?auto_851194 ) ( ON ?auto_851192 ?auto_851193 ) ( ON ?auto_851191 ?auto_851192 ) ( CLEAR ?auto_851189 ) ( ON ?auto_851190 ?auto_851191 ) ( CLEAR ?auto_851190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_851186 ?auto_851187 ?auto_851188 ?auto_851189 ?auto_851190 )
      ( MAKE-16PILE ?auto_851186 ?auto_851187 ?auto_851188 ?auto_851189 ?auto_851190 ?auto_851191 ?auto_851192 ?auto_851193 ?auto_851194 ?auto_851195 ?auto_851196 ?auto_851197 ?auto_851198 ?auto_851199 ?auto_851200 ?auto_851201 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_851252 - BLOCK
      ?auto_851253 - BLOCK
      ?auto_851254 - BLOCK
      ?auto_851255 - BLOCK
      ?auto_851256 - BLOCK
      ?auto_851257 - BLOCK
      ?auto_851258 - BLOCK
      ?auto_851259 - BLOCK
      ?auto_851260 - BLOCK
      ?auto_851261 - BLOCK
      ?auto_851262 - BLOCK
      ?auto_851263 - BLOCK
      ?auto_851264 - BLOCK
      ?auto_851265 - BLOCK
      ?auto_851266 - BLOCK
      ?auto_851267 - BLOCK
    )
    :vars
    (
      ?auto_851268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_851267 ?auto_851268 ) ( ON-TABLE ?auto_851252 ) ( ON ?auto_851253 ?auto_851252 ) ( ON ?auto_851254 ?auto_851253 ) ( not ( = ?auto_851252 ?auto_851253 ) ) ( not ( = ?auto_851252 ?auto_851254 ) ) ( not ( = ?auto_851252 ?auto_851255 ) ) ( not ( = ?auto_851252 ?auto_851256 ) ) ( not ( = ?auto_851252 ?auto_851257 ) ) ( not ( = ?auto_851252 ?auto_851258 ) ) ( not ( = ?auto_851252 ?auto_851259 ) ) ( not ( = ?auto_851252 ?auto_851260 ) ) ( not ( = ?auto_851252 ?auto_851261 ) ) ( not ( = ?auto_851252 ?auto_851262 ) ) ( not ( = ?auto_851252 ?auto_851263 ) ) ( not ( = ?auto_851252 ?auto_851264 ) ) ( not ( = ?auto_851252 ?auto_851265 ) ) ( not ( = ?auto_851252 ?auto_851266 ) ) ( not ( = ?auto_851252 ?auto_851267 ) ) ( not ( = ?auto_851252 ?auto_851268 ) ) ( not ( = ?auto_851253 ?auto_851254 ) ) ( not ( = ?auto_851253 ?auto_851255 ) ) ( not ( = ?auto_851253 ?auto_851256 ) ) ( not ( = ?auto_851253 ?auto_851257 ) ) ( not ( = ?auto_851253 ?auto_851258 ) ) ( not ( = ?auto_851253 ?auto_851259 ) ) ( not ( = ?auto_851253 ?auto_851260 ) ) ( not ( = ?auto_851253 ?auto_851261 ) ) ( not ( = ?auto_851253 ?auto_851262 ) ) ( not ( = ?auto_851253 ?auto_851263 ) ) ( not ( = ?auto_851253 ?auto_851264 ) ) ( not ( = ?auto_851253 ?auto_851265 ) ) ( not ( = ?auto_851253 ?auto_851266 ) ) ( not ( = ?auto_851253 ?auto_851267 ) ) ( not ( = ?auto_851253 ?auto_851268 ) ) ( not ( = ?auto_851254 ?auto_851255 ) ) ( not ( = ?auto_851254 ?auto_851256 ) ) ( not ( = ?auto_851254 ?auto_851257 ) ) ( not ( = ?auto_851254 ?auto_851258 ) ) ( not ( = ?auto_851254 ?auto_851259 ) ) ( not ( = ?auto_851254 ?auto_851260 ) ) ( not ( = ?auto_851254 ?auto_851261 ) ) ( not ( = ?auto_851254 ?auto_851262 ) ) ( not ( = ?auto_851254 ?auto_851263 ) ) ( not ( = ?auto_851254 ?auto_851264 ) ) ( not ( = ?auto_851254 ?auto_851265 ) ) ( not ( = ?auto_851254 ?auto_851266 ) ) ( not ( = ?auto_851254 ?auto_851267 ) ) ( not ( = ?auto_851254 ?auto_851268 ) ) ( not ( = ?auto_851255 ?auto_851256 ) ) ( not ( = ?auto_851255 ?auto_851257 ) ) ( not ( = ?auto_851255 ?auto_851258 ) ) ( not ( = ?auto_851255 ?auto_851259 ) ) ( not ( = ?auto_851255 ?auto_851260 ) ) ( not ( = ?auto_851255 ?auto_851261 ) ) ( not ( = ?auto_851255 ?auto_851262 ) ) ( not ( = ?auto_851255 ?auto_851263 ) ) ( not ( = ?auto_851255 ?auto_851264 ) ) ( not ( = ?auto_851255 ?auto_851265 ) ) ( not ( = ?auto_851255 ?auto_851266 ) ) ( not ( = ?auto_851255 ?auto_851267 ) ) ( not ( = ?auto_851255 ?auto_851268 ) ) ( not ( = ?auto_851256 ?auto_851257 ) ) ( not ( = ?auto_851256 ?auto_851258 ) ) ( not ( = ?auto_851256 ?auto_851259 ) ) ( not ( = ?auto_851256 ?auto_851260 ) ) ( not ( = ?auto_851256 ?auto_851261 ) ) ( not ( = ?auto_851256 ?auto_851262 ) ) ( not ( = ?auto_851256 ?auto_851263 ) ) ( not ( = ?auto_851256 ?auto_851264 ) ) ( not ( = ?auto_851256 ?auto_851265 ) ) ( not ( = ?auto_851256 ?auto_851266 ) ) ( not ( = ?auto_851256 ?auto_851267 ) ) ( not ( = ?auto_851256 ?auto_851268 ) ) ( not ( = ?auto_851257 ?auto_851258 ) ) ( not ( = ?auto_851257 ?auto_851259 ) ) ( not ( = ?auto_851257 ?auto_851260 ) ) ( not ( = ?auto_851257 ?auto_851261 ) ) ( not ( = ?auto_851257 ?auto_851262 ) ) ( not ( = ?auto_851257 ?auto_851263 ) ) ( not ( = ?auto_851257 ?auto_851264 ) ) ( not ( = ?auto_851257 ?auto_851265 ) ) ( not ( = ?auto_851257 ?auto_851266 ) ) ( not ( = ?auto_851257 ?auto_851267 ) ) ( not ( = ?auto_851257 ?auto_851268 ) ) ( not ( = ?auto_851258 ?auto_851259 ) ) ( not ( = ?auto_851258 ?auto_851260 ) ) ( not ( = ?auto_851258 ?auto_851261 ) ) ( not ( = ?auto_851258 ?auto_851262 ) ) ( not ( = ?auto_851258 ?auto_851263 ) ) ( not ( = ?auto_851258 ?auto_851264 ) ) ( not ( = ?auto_851258 ?auto_851265 ) ) ( not ( = ?auto_851258 ?auto_851266 ) ) ( not ( = ?auto_851258 ?auto_851267 ) ) ( not ( = ?auto_851258 ?auto_851268 ) ) ( not ( = ?auto_851259 ?auto_851260 ) ) ( not ( = ?auto_851259 ?auto_851261 ) ) ( not ( = ?auto_851259 ?auto_851262 ) ) ( not ( = ?auto_851259 ?auto_851263 ) ) ( not ( = ?auto_851259 ?auto_851264 ) ) ( not ( = ?auto_851259 ?auto_851265 ) ) ( not ( = ?auto_851259 ?auto_851266 ) ) ( not ( = ?auto_851259 ?auto_851267 ) ) ( not ( = ?auto_851259 ?auto_851268 ) ) ( not ( = ?auto_851260 ?auto_851261 ) ) ( not ( = ?auto_851260 ?auto_851262 ) ) ( not ( = ?auto_851260 ?auto_851263 ) ) ( not ( = ?auto_851260 ?auto_851264 ) ) ( not ( = ?auto_851260 ?auto_851265 ) ) ( not ( = ?auto_851260 ?auto_851266 ) ) ( not ( = ?auto_851260 ?auto_851267 ) ) ( not ( = ?auto_851260 ?auto_851268 ) ) ( not ( = ?auto_851261 ?auto_851262 ) ) ( not ( = ?auto_851261 ?auto_851263 ) ) ( not ( = ?auto_851261 ?auto_851264 ) ) ( not ( = ?auto_851261 ?auto_851265 ) ) ( not ( = ?auto_851261 ?auto_851266 ) ) ( not ( = ?auto_851261 ?auto_851267 ) ) ( not ( = ?auto_851261 ?auto_851268 ) ) ( not ( = ?auto_851262 ?auto_851263 ) ) ( not ( = ?auto_851262 ?auto_851264 ) ) ( not ( = ?auto_851262 ?auto_851265 ) ) ( not ( = ?auto_851262 ?auto_851266 ) ) ( not ( = ?auto_851262 ?auto_851267 ) ) ( not ( = ?auto_851262 ?auto_851268 ) ) ( not ( = ?auto_851263 ?auto_851264 ) ) ( not ( = ?auto_851263 ?auto_851265 ) ) ( not ( = ?auto_851263 ?auto_851266 ) ) ( not ( = ?auto_851263 ?auto_851267 ) ) ( not ( = ?auto_851263 ?auto_851268 ) ) ( not ( = ?auto_851264 ?auto_851265 ) ) ( not ( = ?auto_851264 ?auto_851266 ) ) ( not ( = ?auto_851264 ?auto_851267 ) ) ( not ( = ?auto_851264 ?auto_851268 ) ) ( not ( = ?auto_851265 ?auto_851266 ) ) ( not ( = ?auto_851265 ?auto_851267 ) ) ( not ( = ?auto_851265 ?auto_851268 ) ) ( not ( = ?auto_851266 ?auto_851267 ) ) ( not ( = ?auto_851266 ?auto_851268 ) ) ( not ( = ?auto_851267 ?auto_851268 ) ) ( ON ?auto_851266 ?auto_851267 ) ( ON ?auto_851265 ?auto_851266 ) ( ON ?auto_851264 ?auto_851265 ) ( ON ?auto_851263 ?auto_851264 ) ( ON ?auto_851262 ?auto_851263 ) ( ON ?auto_851261 ?auto_851262 ) ( ON ?auto_851260 ?auto_851261 ) ( ON ?auto_851259 ?auto_851260 ) ( ON ?auto_851258 ?auto_851259 ) ( ON ?auto_851257 ?auto_851258 ) ( ON ?auto_851256 ?auto_851257 ) ( CLEAR ?auto_851254 ) ( ON ?auto_851255 ?auto_851256 ) ( CLEAR ?auto_851255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_851252 ?auto_851253 ?auto_851254 ?auto_851255 )
      ( MAKE-16PILE ?auto_851252 ?auto_851253 ?auto_851254 ?auto_851255 ?auto_851256 ?auto_851257 ?auto_851258 ?auto_851259 ?auto_851260 ?auto_851261 ?auto_851262 ?auto_851263 ?auto_851264 ?auto_851265 ?auto_851266 ?auto_851267 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_851318 - BLOCK
      ?auto_851319 - BLOCK
      ?auto_851320 - BLOCK
      ?auto_851321 - BLOCK
      ?auto_851322 - BLOCK
      ?auto_851323 - BLOCK
      ?auto_851324 - BLOCK
      ?auto_851325 - BLOCK
      ?auto_851326 - BLOCK
      ?auto_851327 - BLOCK
      ?auto_851328 - BLOCK
      ?auto_851329 - BLOCK
      ?auto_851330 - BLOCK
      ?auto_851331 - BLOCK
      ?auto_851332 - BLOCK
      ?auto_851333 - BLOCK
    )
    :vars
    (
      ?auto_851334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_851333 ?auto_851334 ) ( ON-TABLE ?auto_851318 ) ( ON ?auto_851319 ?auto_851318 ) ( not ( = ?auto_851318 ?auto_851319 ) ) ( not ( = ?auto_851318 ?auto_851320 ) ) ( not ( = ?auto_851318 ?auto_851321 ) ) ( not ( = ?auto_851318 ?auto_851322 ) ) ( not ( = ?auto_851318 ?auto_851323 ) ) ( not ( = ?auto_851318 ?auto_851324 ) ) ( not ( = ?auto_851318 ?auto_851325 ) ) ( not ( = ?auto_851318 ?auto_851326 ) ) ( not ( = ?auto_851318 ?auto_851327 ) ) ( not ( = ?auto_851318 ?auto_851328 ) ) ( not ( = ?auto_851318 ?auto_851329 ) ) ( not ( = ?auto_851318 ?auto_851330 ) ) ( not ( = ?auto_851318 ?auto_851331 ) ) ( not ( = ?auto_851318 ?auto_851332 ) ) ( not ( = ?auto_851318 ?auto_851333 ) ) ( not ( = ?auto_851318 ?auto_851334 ) ) ( not ( = ?auto_851319 ?auto_851320 ) ) ( not ( = ?auto_851319 ?auto_851321 ) ) ( not ( = ?auto_851319 ?auto_851322 ) ) ( not ( = ?auto_851319 ?auto_851323 ) ) ( not ( = ?auto_851319 ?auto_851324 ) ) ( not ( = ?auto_851319 ?auto_851325 ) ) ( not ( = ?auto_851319 ?auto_851326 ) ) ( not ( = ?auto_851319 ?auto_851327 ) ) ( not ( = ?auto_851319 ?auto_851328 ) ) ( not ( = ?auto_851319 ?auto_851329 ) ) ( not ( = ?auto_851319 ?auto_851330 ) ) ( not ( = ?auto_851319 ?auto_851331 ) ) ( not ( = ?auto_851319 ?auto_851332 ) ) ( not ( = ?auto_851319 ?auto_851333 ) ) ( not ( = ?auto_851319 ?auto_851334 ) ) ( not ( = ?auto_851320 ?auto_851321 ) ) ( not ( = ?auto_851320 ?auto_851322 ) ) ( not ( = ?auto_851320 ?auto_851323 ) ) ( not ( = ?auto_851320 ?auto_851324 ) ) ( not ( = ?auto_851320 ?auto_851325 ) ) ( not ( = ?auto_851320 ?auto_851326 ) ) ( not ( = ?auto_851320 ?auto_851327 ) ) ( not ( = ?auto_851320 ?auto_851328 ) ) ( not ( = ?auto_851320 ?auto_851329 ) ) ( not ( = ?auto_851320 ?auto_851330 ) ) ( not ( = ?auto_851320 ?auto_851331 ) ) ( not ( = ?auto_851320 ?auto_851332 ) ) ( not ( = ?auto_851320 ?auto_851333 ) ) ( not ( = ?auto_851320 ?auto_851334 ) ) ( not ( = ?auto_851321 ?auto_851322 ) ) ( not ( = ?auto_851321 ?auto_851323 ) ) ( not ( = ?auto_851321 ?auto_851324 ) ) ( not ( = ?auto_851321 ?auto_851325 ) ) ( not ( = ?auto_851321 ?auto_851326 ) ) ( not ( = ?auto_851321 ?auto_851327 ) ) ( not ( = ?auto_851321 ?auto_851328 ) ) ( not ( = ?auto_851321 ?auto_851329 ) ) ( not ( = ?auto_851321 ?auto_851330 ) ) ( not ( = ?auto_851321 ?auto_851331 ) ) ( not ( = ?auto_851321 ?auto_851332 ) ) ( not ( = ?auto_851321 ?auto_851333 ) ) ( not ( = ?auto_851321 ?auto_851334 ) ) ( not ( = ?auto_851322 ?auto_851323 ) ) ( not ( = ?auto_851322 ?auto_851324 ) ) ( not ( = ?auto_851322 ?auto_851325 ) ) ( not ( = ?auto_851322 ?auto_851326 ) ) ( not ( = ?auto_851322 ?auto_851327 ) ) ( not ( = ?auto_851322 ?auto_851328 ) ) ( not ( = ?auto_851322 ?auto_851329 ) ) ( not ( = ?auto_851322 ?auto_851330 ) ) ( not ( = ?auto_851322 ?auto_851331 ) ) ( not ( = ?auto_851322 ?auto_851332 ) ) ( not ( = ?auto_851322 ?auto_851333 ) ) ( not ( = ?auto_851322 ?auto_851334 ) ) ( not ( = ?auto_851323 ?auto_851324 ) ) ( not ( = ?auto_851323 ?auto_851325 ) ) ( not ( = ?auto_851323 ?auto_851326 ) ) ( not ( = ?auto_851323 ?auto_851327 ) ) ( not ( = ?auto_851323 ?auto_851328 ) ) ( not ( = ?auto_851323 ?auto_851329 ) ) ( not ( = ?auto_851323 ?auto_851330 ) ) ( not ( = ?auto_851323 ?auto_851331 ) ) ( not ( = ?auto_851323 ?auto_851332 ) ) ( not ( = ?auto_851323 ?auto_851333 ) ) ( not ( = ?auto_851323 ?auto_851334 ) ) ( not ( = ?auto_851324 ?auto_851325 ) ) ( not ( = ?auto_851324 ?auto_851326 ) ) ( not ( = ?auto_851324 ?auto_851327 ) ) ( not ( = ?auto_851324 ?auto_851328 ) ) ( not ( = ?auto_851324 ?auto_851329 ) ) ( not ( = ?auto_851324 ?auto_851330 ) ) ( not ( = ?auto_851324 ?auto_851331 ) ) ( not ( = ?auto_851324 ?auto_851332 ) ) ( not ( = ?auto_851324 ?auto_851333 ) ) ( not ( = ?auto_851324 ?auto_851334 ) ) ( not ( = ?auto_851325 ?auto_851326 ) ) ( not ( = ?auto_851325 ?auto_851327 ) ) ( not ( = ?auto_851325 ?auto_851328 ) ) ( not ( = ?auto_851325 ?auto_851329 ) ) ( not ( = ?auto_851325 ?auto_851330 ) ) ( not ( = ?auto_851325 ?auto_851331 ) ) ( not ( = ?auto_851325 ?auto_851332 ) ) ( not ( = ?auto_851325 ?auto_851333 ) ) ( not ( = ?auto_851325 ?auto_851334 ) ) ( not ( = ?auto_851326 ?auto_851327 ) ) ( not ( = ?auto_851326 ?auto_851328 ) ) ( not ( = ?auto_851326 ?auto_851329 ) ) ( not ( = ?auto_851326 ?auto_851330 ) ) ( not ( = ?auto_851326 ?auto_851331 ) ) ( not ( = ?auto_851326 ?auto_851332 ) ) ( not ( = ?auto_851326 ?auto_851333 ) ) ( not ( = ?auto_851326 ?auto_851334 ) ) ( not ( = ?auto_851327 ?auto_851328 ) ) ( not ( = ?auto_851327 ?auto_851329 ) ) ( not ( = ?auto_851327 ?auto_851330 ) ) ( not ( = ?auto_851327 ?auto_851331 ) ) ( not ( = ?auto_851327 ?auto_851332 ) ) ( not ( = ?auto_851327 ?auto_851333 ) ) ( not ( = ?auto_851327 ?auto_851334 ) ) ( not ( = ?auto_851328 ?auto_851329 ) ) ( not ( = ?auto_851328 ?auto_851330 ) ) ( not ( = ?auto_851328 ?auto_851331 ) ) ( not ( = ?auto_851328 ?auto_851332 ) ) ( not ( = ?auto_851328 ?auto_851333 ) ) ( not ( = ?auto_851328 ?auto_851334 ) ) ( not ( = ?auto_851329 ?auto_851330 ) ) ( not ( = ?auto_851329 ?auto_851331 ) ) ( not ( = ?auto_851329 ?auto_851332 ) ) ( not ( = ?auto_851329 ?auto_851333 ) ) ( not ( = ?auto_851329 ?auto_851334 ) ) ( not ( = ?auto_851330 ?auto_851331 ) ) ( not ( = ?auto_851330 ?auto_851332 ) ) ( not ( = ?auto_851330 ?auto_851333 ) ) ( not ( = ?auto_851330 ?auto_851334 ) ) ( not ( = ?auto_851331 ?auto_851332 ) ) ( not ( = ?auto_851331 ?auto_851333 ) ) ( not ( = ?auto_851331 ?auto_851334 ) ) ( not ( = ?auto_851332 ?auto_851333 ) ) ( not ( = ?auto_851332 ?auto_851334 ) ) ( not ( = ?auto_851333 ?auto_851334 ) ) ( ON ?auto_851332 ?auto_851333 ) ( ON ?auto_851331 ?auto_851332 ) ( ON ?auto_851330 ?auto_851331 ) ( ON ?auto_851329 ?auto_851330 ) ( ON ?auto_851328 ?auto_851329 ) ( ON ?auto_851327 ?auto_851328 ) ( ON ?auto_851326 ?auto_851327 ) ( ON ?auto_851325 ?auto_851326 ) ( ON ?auto_851324 ?auto_851325 ) ( ON ?auto_851323 ?auto_851324 ) ( ON ?auto_851322 ?auto_851323 ) ( ON ?auto_851321 ?auto_851322 ) ( CLEAR ?auto_851319 ) ( ON ?auto_851320 ?auto_851321 ) ( CLEAR ?auto_851320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_851318 ?auto_851319 ?auto_851320 )
      ( MAKE-16PILE ?auto_851318 ?auto_851319 ?auto_851320 ?auto_851321 ?auto_851322 ?auto_851323 ?auto_851324 ?auto_851325 ?auto_851326 ?auto_851327 ?auto_851328 ?auto_851329 ?auto_851330 ?auto_851331 ?auto_851332 ?auto_851333 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_851384 - BLOCK
      ?auto_851385 - BLOCK
      ?auto_851386 - BLOCK
      ?auto_851387 - BLOCK
      ?auto_851388 - BLOCK
      ?auto_851389 - BLOCK
      ?auto_851390 - BLOCK
      ?auto_851391 - BLOCK
      ?auto_851392 - BLOCK
      ?auto_851393 - BLOCK
      ?auto_851394 - BLOCK
      ?auto_851395 - BLOCK
      ?auto_851396 - BLOCK
      ?auto_851397 - BLOCK
      ?auto_851398 - BLOCK
      ?auto_851399 - BLOCK
    )
    :vars
    (
      ?auto_851400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_851399 ?auto_851400 ) ( ON-TABLE ?auto_851384 ) ( not ( = ?auto_851384 ?auto_851385 ) ) ( not ( = ?auto_851384 ?auto_851386 ) ) ( not ( = ?auto_851384 ?auto_851387 ) ) ( not ( = ?auto_851384 ?auto_851388 ) ) ( not ( = ?auto_851384 ?auto_851389 ) ) ( not ( = ?auto_851384 ?auto_851390 ) ) ( not ( = ?auto_851384 ?auto_851391 ) ) ( not ( = ?auto_851384 ?auto_851392 ) ) ( not ( = ?auto_851384 ?auto_851393 ) ) ( not ( = ?auto_851384 ?auto_851394 ) ) ( not ( = ?auto_851384 ?auto_851395 ) ) ( not ( = ?auto_851384 ?auto_851396 ) ) ( not ( = ?auto_851384 ?auto_851397 ) ) ( not ( = ?auto_851384 ?auto_851398 ) ) ( not ( = ?auto_851384 ?auto_851399 ) ) ( not ( = ?auto_851384 ?auto_851400 ) ) ( not ( = ?auto_851385 ?auto_851386 ) ) ( not ( = ?auto_851385 ?auto_851387 ) ) ( not ( = ?auto_851385 ?auto_851388 ) ) ( not ( = ?auto_851385 ?auto_851389 ) ) ( not ( = ?auto_851385 ?auto_851390 ) ) ( not ( = ?auto_851385 ?auto_851391 ) ) ( not ( = ?auto_851385 ?auto_851392 ) ) ( not ( = ?auto_851385 ?auto_851393 ) ) ( not ( = ?auto_851385 ?auto_851394 ) ) ( not ( = ?auto_851385 ?auto_851395 ) ) ( not ( = ?auto_851385 ?auto_851396 ) ) ( not ( = ?auto_851385 ?auto_851397 ) ) ( not ( = ?auto_851385 ?auto_851398 ) ) ( not ( = ?auto_851385 ?auto_851399 ) ) ( not ( = ?auto_851385 ?auto_851400 ) ) ( not ( = ?auto_851386 ?auto_851387 ) ) ( not ( = ?auto_851386 ?auto_851388 ) ) ( not ( = ?auto_851386 ?auto_851389 ) ) ( not ( = ?auto_851386 ?auto_851390 ) ) ( not ( = ?auto_851386 ?auto_851391 ) ) ( not ( = ?auto_851386 ?auto_851392 ) ) ( not ( = ?auto_851386 ?auto_851393 ) ) ( not ( = ?auto_851386 ?auto_851394 ) ) ( not ( = ?auto_851386 ?auto_851395 ) ) ( not ( = ?auto_851386 ?auto_851396 ) ) ( not ( = ?auto_851386 ?auto_851397 ) ) ( not ( = ?auto_851386 ?auto_851398 ) ) ( not ( = ?auto_851386 ?auto_851399 ) ) ( not ( = ?auto_851386 ?auto_851400 ) ) ( not ( = ?auto_851387 ?auto_851388 ) ) ( not ( = ?auto_851387 ?auto_851389 ) ) ( not ( = ?auto_851387 ?auto_851390 ) ) ( not ( = ?auto_851387 ?auto_851391 ) ) ( not ( = ?auto_851387 ?auto_851392 ) ) ( not ( = ?auto_851387 ?auto_851393 ) ) ( not ( = ?auto_851387 ?auto_851394 ) ) ( not ( = ?auto_851387 ?auto_851395 ) ) ( not ( = ?auto_851387 ?auto_851396 ) ) ( not ( = ?auto_851387 ?auto_851397 ) ) ( not ( = ?auto_851387 ?auto_851398 ) ) ( not ( = ?auto_851387 ?auto_851399 ) ) ( not ( = ?auto_851387 ?auto_851400 ) ) ( not ( = ?auto_851388 ?auto_851389 ) ) ( not ( = ?auto_851388 ?auto_851390 ) ) ( not ( = ?auto_851388 ?auto_851391 ) ) ( not ( = ?auto_851388 ?auto_851392 ) ) ( not ( = ?auto_851388 ?auto_851393 ) ) ( not ( = ?auto_851388 ?auto_851394 ) ) ( not ( = ?auto_851388 ?auto_851395 ) ) ( not ( = ?auto_851388 ?auto_851396 ) ) ( not ( = ?auto_851388 ?auto_851397 ) ) ( not ( = ?auto_851388 ?auto_851398 ) ) ( not ( = ?auto_851388 ?auto_851399 ) ) ( not ( = ?auto_851388 ?auto_851400 ) ) ( not ( = ?auto_851389 ?auto_851390 ) ) ( not ( = ?auto_851389 ?auto_851391 ) ) ( not ( = ?auto_851389 ?auto_851392 ) ) ( not ( = ?auto_851389 ?auto_851393 ) ) ( not ( = ?auto_851389 ?auto_851394 ) ) ( not ( = ?auto_851389 ?auto_851395 ) ) ( not ( = ?auto_851389 ?auto_851396 ) ) ( not ( = ?auto_851389 ?auto_851397 ) ) ( not ( = ?auto_851389 ?auto_851398 ) ) ( not ( = ?auto_851389 ?auto_851399 ) ) ( not ( = ?auto_851389 ?auto_851400 ) ) ( not ( = ?auto_851390 ?auto_851391 ) ) ( not ( = ?auto_851390 ?auto_851392 ) ) ( not ( = ?auto_851390 ?auto_851393 ) ) ( not ( = ?auto_851390 ?auto_851394 ) ) ( not ( = ?auto_851390 ?auto_851395 ) ) ( not ( = ?auto_851390 ?auto_851396 ) ) ( not ( = ?auto_851390 ?auto_851397 ) ) ( not ( = ?auto_851390 ?auto_851398 ) ) ( not ( = ?auto_851390 ?auto_851399 ) ) ( not ( = ?auto_851390 ?auto_851400 ) ) ( not ( = ?auto_851391 ?auto_851392 ) ) ( not ( = ?auto_851391 ?auto_851393 ) ) ( not ( = ?auto_851391 ?auto_851394 ) ) ( not ( = ?auto_851391 ?auto_851395 ) ) ( not ( = ?auto_851391 ?auto_851396 ) ) ( not ( = ?auto_851391 ?auto_851397 ) ) ( not ( = ?auto_851391 ?auto_851398 ) ) ( not ( = ?auto_851391 ?auto_851399 ) ) ( not ( = ?auto_851391 ?auto_851400 ) ) ( not ( = ?auto_851392 ?auto_851393 ) ) ( not ( = ?auto_851392 ?auto_851394 ) ) ( not ( = ?auto_851392 ?auto_851395 ) ) ( not ( = ?auto_851392 ?auto_851396 ) ) ( not ( = ?auto_851392 ?auto_851397 ) ) ( not ( = ?auto_851392 ?auto_851398 ) ) ( not ( = ?auto_851392 ?auto_851399 ) ) ( not ( = ?auto_851392 ?auto_851400 ) ) ( not ( = ?auto_851393 ?auto_851394 ) ) ( not ( = ?auto_851393 ?auto_851395 ) ) ( not ( = ?auto_851393 ?auto_851396 ) ) ( not ( = ?auto_851393 ?auto_851397 ) ) ( not ( = ?auto_851393 ?auto_851398 ) ) ( not ( = ?auto_851393 ?auto_851399 ) ) ( not ( = ?auto_851393 ?auto_851400 ) ) ( not ( = ?auto_851394 ?auto_851395 ) ) ( not ( = ?auto_851394 ?auto_851396 ) ) ( not ( = ?auto_851394 ?auto_851397 ) ) ( not ( = ?auto_851394 ?auto_851398 ) ) ( not ( = ?auto_851394 ?auto_851399 ) ) ( not ( = ?auto_851394 ?auto_851400 ) ) ( not ( = ?auto_851395 ?auto_851396 ) ) ( not ( = ?auto_851395 ?auto_851397 ) ) ( not ( = ?auto_851395 ?auto_851398 ) ) ( not ( = ?auto_851395 ?auto_851399 ) ) ( not ( = ?auto_851395 ?auto_851400 ) ) ( not ( = ?auto_851396 ?auto_851397 ) ) ( not ( = ?auto_851396 ?auto_851398 ) ) ( not ( = ?auto_851396 ?auto_851399 ) ) ( not ( = ?auto_851396 ?auto_851400 ) ) ( not ( = ?auto_851397 ?auto_851398 ) ) ( not ( = ?auto_851397 ?auto_851399 ) ) ( not ( = ?auto_851397 ?auto_851400 ) ) ( not ( = ?auto_851398 ?auto_851399 ) ) ( not ( = ?auto_851398 ?auto_851400 ) ) ( not ( = ?auto_851399 ?auto_851400 ) ) ( ON ?auto_851398 ?auto_851399 ) ( ON ?auto_851397 ?auto_851398 ) ( ON ?auto_851396 ?auto_851397 ) ( ON ?auto_851395 ?auto_851396 ) ( ON ?auto_851394 ?auto_851395 ) ( ON ?auto_851393 ?auto_851394 ) ( ON ?auto_851392 ?auto_851393 ) ( ON ?auto_851391 ?auto_851392 ) ( ON ?auto_851390 ?auto_851391 ) ( ON ?auto_851389 ?auto_851390 ) ( ON ?auto_851388 ?auto_851389 ) ( ON ?auto_851387 ?auto_851388 ) ( ON ?auto_851386 ?auto_851387 ) ( CLEAR ?auto_851384 ) ( ON ?auto_851385 ?auto_851386 ) ( CLEAR ?auto_851385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_851384 ?auto_851385 )
      ( MAKE-16PILE ?auto_851384 ?auto_851385 ?auto_851386 ?auto_851387 ?auto_851388 ?auto_851389 ?auto_851390 ?auto_851391 ?auto_851392 ?auto_851393 ?auto_851394 ?auto_851395 ?auto_851396 ?auto_851397 ?auto_851398 ?auto_851399 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_851450 - BLOCK
      ?auto_851451 - BLOCK
      ?auto_851452 - BLOCK
      ?auto_851453 - BLOCK
      ?auto_851454 - BLOCK
      ?auto_851455 - BLOCK
      ?auto_851456 - BLOCK
      ?auto_851457 - BLOCK
      ?auto_851458 - BLOCK
      ?auto_851459 - BLOCK
      ?auto_851460 - BLOCK
      ?auto_851461 - BLOCK
      ?auto_851462 - BLOCK
      ?auto_851463 - BLOCK
      ?auto_851464 - BLOCK
      ?auto_851465 - BLOCK
    )
    :vars
    (
      ?auto_851466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_851465 ?auto_851466 ) ( not ( = ?auto_851450 ?auto_851451 ) ) ( not ( = ?auto_851450 ?auto_851452 ) ) ( not ( = ?auto_851450 ?auto_851453 ) ) ( not ( = ?auto_851450 ?auto_851454 ) ) ( not ( = ?auto_851450 ?auto_851455 ) ) ( not ( = ?auto_851450 ?auto_851456 ) ) ( not ( = ?auto_851450 ?auto_851457 ) ) ( not ( = ?auto_851450 ?auto_851458 ) ) ( not ( = ?auto_851450 ?auto_851459 ) ) ( not ( = ?auto_851450 ?auto_851460 ) ) ( not ( = ?auto_851450 ?auto_851461 ) ) ( not ( = ?auto_851450 ?auto_851462 ) ) ( not ( = ?auto_851450 ?auto_851463 ) ) ( not ( = ?auto_851450 ?auto_851464 ) ) ( not ( = ?auto_851450 ?auto_851465 ) ) ( not ( = ?auto_851450 ?auto_851466 ) ) ( not ( = ?auto_851451 ?auto_851452 ) ) ( not ( = ?auto_851451 ?auto_851453 ) ) ( not ( = ?auto_851451 ?auto_851454 ) ) ( not ( = ?auto_851451 ?auto_851455 ) ) ( not ( = ?auto_851451 ?auto_851456 ) ) ( not ( = ?auto_851451 ?auto_851457 ) ) ( not ( = ?auto_851451 ?auto_851458 ) ) ( not ( = ?auto_851451 ?auto_851459 ) ) ( not ( = ?auto_851451 ?auto_851460 ) ) ( not ( = ?auto_851451 ?auto_851461 ) ) ( not ( = ?auto_851451 ?auto_851462 ) ) ( not ( = ?auto_851451 ?auto_851463 ) ) ( not ( = ?auto_851451 ?auto_851464 ) ) ( not ( = ?auto_851451 ?auto_851465 ) ) ( not ( = ?auto_851451 ?auto_851466 ) ) ( not ( = ?auto_851452 ?auto_851453 ) ) ( not ( = ?auto_851452 ?auto_851454 ) ) ( not ( = ?auto_851452 ?auto_851455 ) ) ( not ( = ?auto_851452 ?auto_851456 ) ) ( not ( = ?auto_851452 ?auto_851457 ) ) ( not ( = ?auto_851452 ?auto_851458 ) ) ( not ( = ?auto_851452 ?auto_851459 ) ) ( not ( = ?auto_851452 ?auto_851460 ) ) ( not ( = ?auto_851452 ?auto_851461 ) ) ( not ( = ?auto_851452 ?auto_851462 ) ) ( not ( = ?auto_851452 ?auto_851463 ) ) ( not ( = ?auto_851452 ?auto_851464 ) ) ( not ( = ?auto_851452 ?auto_851465 ) ) ( not ( = ?auto_851452 ?auto_851466 ) ) ( not ( = ?auto_851453 ?auto_851454 ) ) ( not ( = ?auto_851453 ?auto_851455 ) ) ( not ( = ?auto_851453 ?auto_851456 ) ) ( not ( = ?auto_851453 ?auto_851457 ) ) ( not ( = ?auto_851453 ?auto_851458 ) ) ( not ( = ?auto_851453 ?auto_851459 ) ) ( not ( = ?auto_851453 ?auto_851460 ) ) ( not ( = ?auto_851453 ?auto_851461 ) ) ( not ( = ?auto_851453 ?auto_851462 ) ) ( not ( = ?auto_851453 ?auto_851463 ) ) ( not ( = ?auto_851453 ?auto_851464 ) ) ( not ( = ?auto_851453 ?auto_851465 ) ) ( not ( = ?auto_851453 ?auto_851466 ) ) ( not ( = ?auto_851454 ?auto_851455 ) ) ( not ( = ?auto_851454 ?auto_851456 ) ) ( not ( = ?auto_851454 ?auto_851457 ) ) ( not ( = ?auto_851454 ?auto_851458 ) ) ( not ( = ?auto_851454 ?auto_851459 ) ) ( not ( = ?auto_851454 ?auto_851460 ) ) ( not ( = ?auto_851454 ?auto_851461 ) ) ( not ( = ?auto_851454 ?auto_851462 ) ) ( not ( = ?auto_851454 ?auto_851463 ) ) ( not ( = ?auto_851454 ?auto_851464 ) ) ( not ( = ?auto_851454 ?auto_851465 ) ) ( not ( = ?auto_851454 ?auto_851466 ) ) ( not ( = ?auto_851455 ?auto_851456 ) ) ( not ( = ?auto_851455 ?auto_851457 ) ) ( not ( = ?auto_851455 ?auto_851458 ) ) ( not ( = ?auto_851455 ?auto_851459 ) ) ( not ( = ?auto_851455 ?auto_851460 ) ) ( not ( = ?auto_851455 ?auto_851461 ) ) ( not ( = ?auto_851455 ?auto_851462 ) ) ( not ( = ?auto_851455 ?auto_851463 ) ) ( not ( = ?auto_851455 ?auto_851464 ) ) ( not ( = ?auto_851455 ?auto_851465 ) ) ( not ( = ?auto_851455 ?auto_851466 ) ) ( not ( = ?auto_851456 ?auto_851457 ) ) ( not ( = ?auto_851456 ?auto_851458 ) ) ( not ( = ?auto_851456 ?auto_851459 ) ) ( not ( = ?auto_851456 ?auto_851460 ) ) ( not ( = ?auto_851456 ?auto_851461 ) ) ( not ( = ?auto_851456 ?auto_851462 ) ) ( not ( = ?auto_851456 ?auto_851463 ) ) ( not ( = ?auto_851456 ?auto_851464 ) ) ( not ( = ?auto_851456 ?auto_851465 ) ) ( not ( = ?auto_851456 ?auto_851466 ) ) ( not ( = ?auto_851457 ?auto_851458 ) ) ( not ( = ?auto_851457 ?auto_851459 ) ) ( not ( = ?auto_851457 ?auto_851460 ) ) ( not ( = ?auto_851457 ?auto_851461 ) ) ( not ( = ?auto_851457 ?auto_851462 ) ) ( not ( = ?auto_851457 ?auto_851463 ) ) ( not ( = ?auto_851457 ?auto_851464 ) ) ( not ( = ?auto_851457 ?auto_851465 ) ) ( not ( = ?auto_851457 ?auto_851466 ) ) ( not ( = ?auto_851458 ?auto_851459 ) ) ( not ( = ?auto_851458 ?auto_851460 ) ) ( not ( = ?auto_851458 ?auto_851461 ) ) ( not ( = ?auto_851458 ?auto_851462 ) ) ( not ( = ?auto_851458 ?auto_851463 ) ) ( not ( = ?auto_851458 ?auto_851464 ) ) ( not ( = ?auto_851458 ?auto_851465 ) ) ( not ( = ?auto_851458 ?auto_851466 ) ) ( not ( = ?auto_851459 ?auto_851460 ) ) ( not ( = ?auto_851459 ?auto_851461 ) ) ( not ( = ?auto_851459 ?auto_851462 ) ) ( not ( = ?auto_851459 ?auto_851463 ) ) ( not ( = ?auto_851459 ?auto_851464 ) ) ( not ( = ?auto_851459 ?auto_851465 ) ) ( not ( = ?auto_851459 ?auto_851466 ) ) ( not ( = ?auto_851460 ?auto_851461 ) ) ( not ( = ?auto_851460 ?auto_851462 ) ) ( not ( = ?auto_851460 ?auto_851463 ) ) ( not ( = ?auto_851460 ?auto_851464 ) ) ( not ( = ?auto_851460 ?auto_851465 ) ) ( not ( = ?auto_851460 ?auto_851466 ) ) ( not ( = ?auto_851461 ?auto_851462 ) ) ( not ( = ?auto_851461 ?auto_851463 ) ) ( not ( = ?auto_851461 ?auto_851464 ) ) ( not ( = ?auto_851461 ?auto_851465 ) ) ( not ( = ?auto_851461 ?auto_851466 ) ) ( not ( = ?auto_851462 ?auto_851463 ) ) ( not ( = ?auto_851462 ?auto_851464 ) ) ( not ( = ?auto_851462 ?auto_851465 ) ) ( not ( = ?auto_851462 ?auto_851466 ) ) ( not ( = ?auto_851463 ?auto_851464 ) ) ( not ( = ?auto_851463 ?auto_851465 ) ) ( not ( = ?auto_851463 ?auto_851466 ) ) ( not ( = ?auto_851464 ?auto_851465 ) ) ( not ( = ?auto_851464 ?auto_851466 ) ) ( not ( = ?auto_851465 ?auto_851466 ) ) ( ON ?auto_851464 ?auto_851465 ) ( ON ?auto_851463 ?auto_851464 ) ( ON ?auto_851462 ?auto_851463 ) ( ON ?auto_851461 ?auto_851462 ) ( ON ?auto_851460 ?auto_851461 ) ( ON ?auto_851459 ?auto_851460 ) ( ON ?auto_851458 ?auto_851459 ) ( ON ?auto_851457 ?auto_851458 ) ( ON ?auto_851456 ?auto_851457 ) ( ON ?auto_851455 ?auto_851456 ) ( ON ?auto_851454 ?auto_851455 ) ( ON ?auto_851453 ?auto_851454 ) ( ON ?auto_851452 ?auto_851453 ) ( ON ?auto_851451 ?auto_851452 ) ( ON ?auto_851450 ?auto_851451 ) ( CLEAR ?auto_851450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_851450 )
      ( MAKE-16PILE ?auto_851450 ?auto_851451 ?auto_851452 ?auto_851453 ?auto_851454 ?auto_851455 ?auto_851456 ?auto_851457 ?auto_851458 ?auto_851459 ?auto_851460 ?auto_851461 ?auto_851462 ?auto_851463 ?auto_851464 ?auto_851465 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_851517 - BLOCK
      ?auto_851518 - BLOCK
      ?auto_851519 - BLOCK
      ?auto_851520 - BLOCK
      ?auto_851521 - BLOCK
      ?auto_851522 - BLOCK
      ?auto_851523 - BLOCK
      ?auto_851524 - BLOCK
      ?auto_851525 - BLOCK
      ?auto_851526 - BLOCK
      ?auto_851527 - BLOCK
      ?auto_851528 - BLOCK
      ?auto_851529 - BLOCK
      ?auto_851530 - BLOCK
      ?auto_851531 - BLOCK
      ?auto_851532 - BLOCK
      ?auto_851533 - BLOCK
    )
    :vars
    (
      ?auto_851534 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_851532 ) ( ON ?auto_851533 ?auto_851534 ) ( CLEAR ?auto_851533 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_851517 ) ( ON ?auto_851518 ?auto_851517 ) ( ON ?auto_851519 ?auto_851518 ) ( ON ?auto_851520 ?auto_851519 ) ( ON ?auto_851521 ?auto_851520 ) ( ON ?auto_851522 ?auto_851521 ) ( ON ?auto_851523 ?auto_851522 ) ( ON ?auto_851524 ?auto_851523 ) ( ON ?auto_851525 ?auto_851524 ) ( ON ?auto_851526 ?auto_851525 ) ( ON ?auto_851527 ?auto_851526 ) ( ON ?auto_851528 ?auto_851527 ) ( ON ?auto_851529 ?auto_851528 ) ( ON ?auto_851530 ?auto_851529 ) ( ON ?auto_851531 ?auto_851530 ) ( ON ?auto_851532 ?auto_851531 ) ( not ( = ?auto_851517 ?auto_851518 ) ) ( not ( = ?auto_851517 ?auto_851519 ) ) ( not ( = ?auto_851517 ?auto_851520 ) ) ( not ( = ?auto_851517 ?auto_851521 ) ) ( not ( = ?auto_851517 ?auto_851522 ) ) ( not ( = ?auto_851517 ?auto_851523 ) ) ( not ( = ?auto_851517 ?auto_851524 ) ) ( not ( = ?auto_851517 ?auto_851525 ) ) ( not ( = ?auto_851517 ?auto_851526 ) ) ( not ( = ?auto_851517 ?auto_851527 ) ) ( not ( = ?auto_851517 ?auto_851528 ) ) ( not ( = ?auto_851517 ?auto_851529 ) ) ( not ( = ?auto_851517 ?auto_851530 ) ) ( not ( = ?auto_851517 ?auto_851531 ) ) ( not ( = ?auto_851517 ?auto_851532 ) ) ( not ( = ?auto_851517 ?auto_851533 ) ) ( not ( = ?auto_851517 ?auto_851534 ) ) ( not ( = ?auto_851518 ?auto_851519 ) ) ( not ( = ?auto_851518 ?auto_851520 ) ) ( not ( = ?auto_851518 ?auto_851521 ) ) ( not ( = ?auto_851518 ?auto_851522 ) ) ( not ( = ?auto_851518 ?auto_851523 ) ) ( not ( = ?auto_851518 ?auto_851524 ) ) ( not ( = ?auto_851518 ?auto_851525 ) ) ( not ( = ?auto_851518 ?auto_851526 ) ) ( not ( = ?auto_851518 ?auto_851527 ) ) ( not ( = ?auto_851518 ?auto_851528 ) ) ( not ( = ?auto_851518 ?auto_851529 ) ) ( not ( = ?auto_851518 ?auto_851530 ) ) ( not ( = ?auto_851518 ?auto_851531 ) ) ( not ( = ?auto_851518 ?auto_851532 ) ) ( not ( = ?auto_851518 ?auto_851533 ) ) ( not ( = ?auto_851518 ?auto_851534 ) ) ( not ( = ?auto_851519 ?auto_851520 ) ) ( not ( = ?auto_851519 ?auto_851521 ) ) ( not ( = ?auto_851519 ?auto_851522 ) ) ( not ( = ?auto_851519 ?auto_851523 ) ) ( not ( = ?auto_851519 ?auto_851524 ) ) ( not ( = ?auto_851519 ?auto_851525 ) ) ( not ( = ?auto_851519 ?auto_851526 ) ) ( not ( = ?auto_851519 ?auto_851527 ) ) ( not ( = ?auto_851519 ?auto_851528 ) ) ( not ( = ?auto_851519 ?auto_851529 ) ) ( not ( = ?auto_851519 ?auto_851530 ) ) ( not ( = ?auto_851519 ?auto_851531 ) ) ( not ( = ?auto_851519 ?auto_851532 ) ) ( not ( = ?auto_851519 ?auto_851533 ) ) ( not ( = ?auto_851519 ?auto_851534 ) ) ( not ( = ?auto_851520 ?auto_851521 ) ) ( not ( = ?auto_851520 ?auto_851522 ) ) ( not ( = ?auto_851520 ?auto_851523 ) ) ( not ( = ?auto_851520 ?auto_851524 ) ) ( not ( = ?auto_851520 ?auto_851525 ) ) ( not ( = ?auto_851520 ?auto_851526 ) ) ( not ( = ?auto_851520 ?auto_851527 ) ) ( not ( = ?auto_851520 ?auto_851528 ) ) ( not ( = ?auto_851520 ?auto_851529 ) ) ( not ( = ?auto_851520 ?auto_851530 ) ) ( not ( = ?auto_851520 ?auto_851531 ) ) ( not ( = ?auto_851520 ?auto_851532 ) ) ( not ( = ?auto_851520 ?auto_851533 ) ) ( not ( = ?auto_851520 ?auto_851534 ) ) ( not ( = ?auto_851521 ?auto_851522 ) ) ( not ( = ?auto_851521 ?auto_851523 ) ) ( not ( = ?auto_851521 ?auto_851524 ) ) ( not ( = ?auto_851521 ?auto_851525 ) ) ( not ( = ?auto_851521 ?auto_851526 ) ) ( not ( = ?auto_851521 ?auto_851527 ) ) ( not ( = ?auto_851521 ?auto_851528 ) ) ( not ( = ?auto_851521 ?auto_851529 ) ) ( not ( = ?auto_851521 ?auto_851530 ) ) ( not ( = ?auto_851521 ?auto_851531 ) ) ( not ( = ?auto_851521 ?auto_851532 ) ) ( not ( = ?auto_851521 ?auto_851533 ) ) ( not ( = ?auto_851521 ?auto_851534 ) ) ( not ( = ?auto_851522 ?auto_851523 ) ) ( not ( = ?auto_851522 ?auto_851524 ) ) ( not ( = ?auto_851522 ?auto_851525 ) ) ( not ( = ?auto_851522 ?auto_851526 ) ) ( not ( = ?auto_851522 ?auto_851527 ) ) ( not ( = ?auto_851522 ?auto_851528 ) ) ( not ( = ?auto_851522 ?auto_851529 ) ) ( not ( = ?auto_851522 ?auto_851530 ) ) ( not ( = ?auto_851522 ?auto_851531 ) ) ( not ( = ?auto_851522 ?auto_851532 ) ) ( not ( = ?auto_851522 ?auto_851533 ) ) ( not ( = ?auto_851522 ?auto_851534 ) ) ( not ( = ?auto_851523 ?auto_851524 ) ) ( not ( = ?auto_851523 ?auto_851525 ) ) ( not ( = ?auto_851523 ?auto_851526 ) ) ( not ( = ?auto_851523 ?auto_851527 ) ) ( not ( = ?auto_851523 ?auto_851528 ) ) ( not ( = ?auto_851523 ?auto_851529 ) ) ( not ( = ?auto_851523 ?auto_851530 ) ) ( not ( = ?auto_851523 ?auto_851531 ) ) ( not ( = ?auto_851523 ?auto_851532 ) ) ( not ( = ?auto_851523 ?auto_851533 ) ) ( not ( = ?auto_851523 ?auto_851534 ) ) ( not ( = ?auto_851524 ?auto_851525 ) ) ( not ( = ?auto_851524 ?auto_851526 ) ) ( not ( = ?auto_851524 ?auto_851527 ) ) ( not ( = ?auto_851524 ?auto_851528 ) ) ( not ( = ?auto_851524 ?auto_851529 ) ) ( not ( = ?auto_851524 ?auto_851530 ) ) ( not ( = ?auto_851524 ?auto_851531 ) ) ( not ( = ?auto_851524 ?auto_851532 ) ) ( not ( = ?auto_851524 ?auto_851533 ) ) ( not ( = ?auto_851524 ?auto_851534 ) ) ( not ( = ?auto_851525 ?auto_851526 ) ) ( not ( = ?auto_851525 ?auto_851527 ) ) ( not ( = ?auto_851525 ?auto_851528 ) ) ( not ( = ?auto_851525 ?auto_851529 ) ) ( not ( = ?auto_851525 ?auto_851530 ) ) ( not ( = ?auto_851525 ?auto_851531 ) ) ( not ( = ?auto_851525 ?auto_851532 ) ) ( not ( = ?auto_851525 ?auto_851533 ) ) ( not ( = ?auto_851525 ?auto_851534 ) ) ( not ( = ?auto_851526 ?auto_851527 ) ) ( not ( = ?auto_851526 ?auto_851528 ) ) ( not ( = ?auto_851526 ?auto_851529 ) ) ( not ( = ?auto_851526 ?auto_851530 ) ) ( not ( = ?auto_851526 ?auto_851531 ) ) ( not ( = ?auto_851526 ?auto_851532 ) ) ( not ( = ?auto_851526 ?auto_851533 ) ) ( not ( = ?auto_851526 ?auto_851534 ) ) ( not ( = ?auto_851527 ?auto_851528 ) ) ( not ( = ?auto_851527 ?auto_851529 ) ) ( not ( = ?auto_851527 ?auto_851530 ) ) ( not ( = ?auto_851527 ?auto_851531 ) ) ( not ( = ?auto_851527 ?auto_851532 ) ) ( not ( = ?auto_851527 ?auto_851533 ) ) ( not ( = ?auto_851527 ?auto_851534 ) ) ( not ( = ?auto_851528 ?auto_851529 ) ) ( not ( = ?auto_851528 ?auto_851530 ) ) ( not ( = ?auto_851528 ?auto_851531 ) ) ( not ( = ?auto_851528 ?auto_851532 ) ) ( not ( = ?auto_851528 ?auto_851533 ) ) ( not ( = ?auto_851528 ?auto_851534 ) ) ( not ( = ?auto_851529 ?auto_851530 ) ) ( not ( = ?auto_851529 ?auto_851531 ) ) ( not ( = ?auto_851529 ?auto_851532 ) ) ( not ( = ?auto_851529 ?auto_851533 ) ) ( not ( = ?auto_851529 ?auto_851534 ) ) ( not ( = ?auto_851530 ?auto_851531 ) ) ( not ( = ?auto_851530 ?auto_851532 ) ) ( not ( = ?auto_851530 ?auto_851533 ) ) ( not ( = ?auto_851530 ?auto_851534 ) ) ( not ( = ?auto_851531 ?auto_851532 ) ) ( not ( = ?auto_851531 ?auto_851533 ) ) ( not ( = ?auto_851531 ?auto_851534 ) ) ( not ( = ?auto_851532 ?auto_851533 ) ) ( not ( = ?auto_851532 ?auto_851534 ) ) ( not ( = ?auto_851533 ?auto_851534 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_851533 ?auto_851534 )
      ( !STACK ?auto_851533 ?auto_851532 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_851587 - BLOCK
      ?auto_851588 - BLOCK
      ?auto_851589 - BLOCK
      ?auto_851590 - BLOCK
      ?auto_851591 - BLOCK
      ?auto_851592 - BLOCK
      ?auto_851593 - BLOCK
      ?auto_851594 - BLOCK
      ?auto_851595 - BLOCK
      ?auto_851596 - BLOCK
      ?auto_851597 - BLOCK
      ?auto_851598 - BLOCK
      ?auto_851599 - BLOCK
      ?auto_851600 - BLOCK
      ?auto_851601 - BLOCK
      ?auto_851602 - BLOCK
      ?auto_851603 - BLOCK
    )
    :vars
    (
      ?auto_851604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_851603 ?auto_851604 ) ( ON-TABLE ?auto_851587 ) ( ON ?auto_851588 ?auto_851587 ) ( ON ?auto_851589 ?auto_851588 ) ( ON ?auto_851590 ?auto_851589 ) ( ON ?auto_851591 ?auto_851590 ) ( ON ?auto_851592 ?auto_851591 ) ( ON ?auto_851593 ?auto_851592 ) ( ON ?auto_851594 ?auto_851593 ) ( ON ?auto_851595 ?auto_851594 ) ( ON ?auto_851596 ?auto_851595 ) ( ON ?auto_851597 ?auto_851596 ) ( ON ?auto_851598 ?auto_851597 ) ( ON ?auto_851599 ?auto_851598 ) ( ON ?auto_851600 ?auto_851599 ) ( ON ?auto_851601 ?auto_851600 ) ( not ( = ?auto_851587 ?auto_851588 ) ) ( not ( = ?auto_851587 ?auto_851589 ) ) ( not ( = ?auto_851587 ?auto_851590 ) ) ( not ( = ?auto_851587 ?auto_851591 ) ) ( not ( = ?auto_851587 ?auto_851592 ) ) ( not ( = ?auto_851587 ?auto_851593 ) ) ( not ( = ?auto_851587 ?auto_851594 ) ) ( not ( = ?auto_851587 ?auto_851595 ) ) ( not ( = ?auto_851587 ?auto_851596 ) ) ( not ( = ?auto_851587 ?auto_851597 ) ) ( not ( = ?auto_851587 ?auto_851598 ) ) ( not ( = ?auto_851587 ?auto_851599 ) ) ( not ( = ?auto_851587 ?auto_851600 ) ) ( not ( = ?auto_851587 ?auto_851601 ) ) ( not ( = ?auto_851587 ?auto_851602 ) ) ( not ( = ?auto_851587 ?auto_851603 ) ) ( not ( = ?auto_851587 ?auto_851604 ) ) ( not ( = ?auto_851588 ?auto_851589 ) ) ( not ( = ?auto_851588 ?auto_851590 ) ) ( not ( = ?auto_851588 ?auto_851591 ) ) ( not ( = ?auto_851588 ?auto_851592 ) ) ( not ( = ?auto_851588 ?auto_851593 ) ) ( not ( = ?auto_851588 ?auto_851594 ) ) ( not ( = ?auto_851588 ?auto_851595 ) ) ( not ( = ?auto_851588 ?auto_851596 ) ) ( not ( = ?auto_851588 ?auto_851597 ) ) ( not ( = ?auto_851588 ?auto_851598 ) ) ( not ( = ?auto_851588 ?auto_851599 ) ) ( not ( = ?auto_851588 ?auto_851600 ) ) ( not ( = ?auto_851588 ?auto_851601 ) ) ( not ( = ?auto_851588 ?auto_851602 ) ) ( not ( = ?auto_851588 ?auto_851603 ) ) ( not ( = ?auto_851588 ?auto_851604 ) ) ( not ( = ?auto_851589 ?auto_851590 ) ) ( not ( = ?auto_851589 ?auto_851591 ) ) ( not ( = ?auto_851589 ?auto_851592 ) ) ( not ( = ?auto_851589 ?auto_851593 ) ) ( not ( = ?auto_851589 ?auto_851594 ) ) ( not ( = ?auto_851589 ?auto_851595 ) ) ( not ( = ?auto_851589 ?auto_851596 ) ) ( not ( = ?auto_851589 ?auto_851597 ) ) ( not ( = ?auto_851589 ?auto_851598 ) ) ( not ( = ?auto_851589 ?auto_851599 ) ) ( not ( = ?auto_851589 ?auto_851600 ) ) ( not ( = ?auto_851589 ?auto_851601 ) ) ( not ( = ?auto_851589 ?auto_851602 ) ) ( not ( = ?auto_851589 ?auto_851603 ) ) ( not ( = ?auto_851589 ?auto_851604 ) ) ( not ( = ?auto_851590 ?auto_851591 ) ) ( not ( = ?auto_851590 ?auto_851592 ) ) ( not ( = ?auto_851590 ?auto_851593 ) ) ( not ( = ?auto_851590 ?auto_851594 ) ) ( not ( = ?auto_851590 ?auto_851595 ) ) ( not ( = ?auto_851590 ?auto_851596 ) ) ( not ( = ?auto_851590 ?auto_851597 ) ) ( not ( = ?auto_851590 ?auto_851598 ) ) ( not ( = ?auto_851590 ?auto_851599 ) ) ( not ( = ?auto_851590 ?auto_851600 ) ) ( not ( = ?auto_851590 ?auto_851601 ) ) ( not ( = ?auto_851590 ?auto_851602 ) ) ( not ( = ?auto_851590 ?auto_851603 ) ) ( not ( = ?auto_851590 ?auto_851604 ) ) ( not ( = ?auto_851591 ?auto_851592 ) ) ( not ( = ?auto_851591 ?auto_851593 ) ) ( not ( = ?auto_851591 ?auto_851594 ) ) ( not ( = ?auto_851591 ?auto_851595 ) ) ( not ( = ?auto_851591 ?auto_851596 ) ) ( not ( = ?auto_851591 ?auto_851597 ) ) ( not ( = ?auto_851591 ?auto_851598 ) ) ( not ( = ?auto_851591 ?auto_851599 ) ) ( not ( = ?auto_851591 ?auto_851600 ) ) ( not ( = ?auto_851591 ?auto_851601 ) ) ( not ( = ?auto_851591 ?auto_851602 ) ) ( not ( = ?auto_851591 ?auto_851603 ) ) ( not ( = ?auto_851591 ?auto_851604 ) ) ( not ( = ?auto_851592 ?auto_851593 ) ) ( not ( = ?auto_851592 ?auto_851594 ) ) ( not ( = ?auto_851592 ?auto_851595 ) ) ( not ( = ?auto_851592 ?auto_851596 ) ) ( not ( = ?auto_851592 ?auto_851597 ) ) ( not ( = ?auto_851592 ?auto_851598 ) ) ( not ( = ?auto_851592 ?auto_851599 ) ) ( not ( = ?auto_851592 ?auto_851600 ) ) ( not ( = ?auto_851592 ?auto_851601 ) ) ( not ( = ?auto_851592 ?auto_851602 ) ) ( not ( = ?auto_851592 ?auto_851603 ) ) ( not ( = ?auto_851592 ?auto_851604 ) ) ( not ( = ?auto_851593 ?auto_851594 ) ) ( not ( = ?auto_851593 ?auto_851595 ) ) ( not ( = ?auto_851593 ?auto_851596 ) ) ( not ( = ?auto_851593 ?auto_851597 ) ) ( not ( = ?auto_851593 ?auto_851598 ) ) ( not ( = ?auto_851593 ?auto_851599 ) ) ( not ( = ?auto_851593 ?auto_851600 ) ) ( not ( = ?auto_851593 ?auto_851601 ) ) ( not ( = ?auto_851593 ?auto_851602 ) ) ( not ( = ?auto_851593 ?auto_851603 ) ) ( not ( = ?auto_851593 ?auto_851604 ) ) ( not ( = ?auto_851594 ?auto_851595 ) ) ( not ( = ?auto_851594 ?auto_851596 ) ) ( not ( = ?auto_851594 ?auto_851597 ) ) ( not ( = ?auto_851594 ?auto_851598 ) ) ( not ( = ?auto_851594 ?auto_851599 ) ) ( not ( = ?auto_851594 ?auto_851600 ) ) ( not ( = ?auto_851594 ?auto_851601 ) ) ( not ( = ?auto_851594 ?auto_851602 ) ) ( not ( = ?auto_851594 ?auto_851603 ) ) ( not ( = ?auto_851594 ?auto_851604 ) ) ( not ( = ?auto_851595 ?auto_851596 ) ) ( not ( = ?auto_851595 ?auto_851597 ) ) ( not ( = ?auto_851595 ?auto_851598 ) ) ( not ( = ?auto_851595 ?auto_851599 ) ) ( not ( = ?auto_851595 ?auto_851600 ) ) ( not ( = ?auto_851595 ?auto_851601 ) ) ( not ( = ?auto_851595 ?auto_851602 ) ) ( not ( = ?auto_851595 ?auto_851603 ) ) ( not ( = ?auto_851595 ?auto_851604 ) ) ( not ( = ?auto_851596 ?auto_851597 ) ) ( not ( = ?auto_851596 ?auto_851598 ) ) ( not ( = ?auto_851596 ?auto_851599 ) ) ( not ( = ?auto_851596 ?auto_851600 ) ) ( not ( = ?auto_851596 ?auto_851601 ) ) ( not ( = ?auto_851596 ?auto_851602 ) ) ( not ( = ?auto_851596 ?auto_851603 ) ) ( not ( = ?auto_851596 ?auto_851604 ) ) ( not ( = ?auto_851597 ?auto_851598 ) ) ( not ( = ?auto_851597 ?auto_851599 ) ) ( not ( = ?auto_851597 ?auto_851600 ) ) ( not ( = ?auto_851597 ?auto_851601 ) ) ( not ( = ?auto_851597 ?auto_851602 ) ) ( not ( = ?auto_851597 ?auto_851603 ) ) ( not ( = ?auto_851597 ?auto_851604 ) ) ( not ( = ?auto_851598 ?auto_851599 ) ) ( not ( = ?auto_851598 ?auto_851600 ) ) ( not ( = ?auto_851598 ?auto_851601 ) ) ( not ( = ?auto_851598 ?auto_851602 ) ) ( not ( = ?auto_851598 ?auto_851603 ) ) ( not ( = ?auto_851598 ?auto_851604 ) ) ( not ( = ?auto_851599 ?auto_851600 ) ) ( not ( = ?auto_851599 ?auto_851601 ) ) ( not ( = ?auto_851599 ?auto_851602 ) ) ( not ( = ?auto_851599 ?auto_851603 ) ) ( not ( = ?auto_851599 ?auto_851604 ) ) ( not ( = ?auto_851600 ?auto_851601 ) ) ( not ( = ?auto_851600 ?auto_851602 ) ) ( not ( = ?auto_851600 ?auto_851603 ) ) ( not ( = ?auto_851600 ?auto_851604 ) ) ( not ( = ?auto_851601 ?auto_851602 ) ) ( not ( = ?auto_851601 ?auto_851603 ) ) ( not ( = ?auto_851601 ?auto_851604 ) ) ( not ( = ?auto_851602 ?auto_851603 ) ) ( not ( = ?auto_851602 ?auto_851604 ) ) ( not ( = ?auto_851603 ?auto_851604 ) ) ( CLEAR ?auto_851601 ) ( ON ?auto_851602 ?auto_851603 ) ( CLEAR ?auto_851602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_851587 ?auto_851588 ?auto_851589 ?auto_851590 ?auto_851591 ?auto_851592 ?auto_851593 ?auto_851594 ?auto_851595 ?auto_851596 ?auto_851597 ?auto_851598 ?auto_851599 ?auto_851600 ?auto_851601 ?auto_851602 )
      ( MAKE-17PILE ?auto_851587 ?auto_851588 ?auto_851589 ?auto_851590 ?auto_851591 ?auto_851592 ?auto_851593 ?auto_851594 ?auto_851595 ?auto_851596 ?auto_851597 ?auto_851598 ?auto_851599 ?auto_851600 ?auto_851601 ?auto_851602 ?auto_851603 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_851657 - BLOCK
      ?auto_851658 - BLOCK
      ?auto_851659 - BLOCK
      ?auto_851660 - BLOCK
      ?auto_851661 - BLOCK
      ?auto_851662 - BLOCK
      ?auto_851663 - BLOCK
      ?auto_851664 - BLOCK
      ?auto_851665 - BLOCK
      ?auto_851666 - BLOCK
      ?auto_851667 - BLOCK
      ?auto_851668 - BLOCK
      ?auto_851669 - BLOCK
      ?auto_851670 - BLOCK
      ?auto_851671 - BLOCK
      ?auto_851672 - BLOCK
      ?auto_851673 - BLOCK
    )
    :vars
    (
      ?auto_851674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_851673 ?auto_851674 ) ( ON-TABLE ?auto_851657 ) ( ON ?auto_851658 ?auto_851657 ) ( ON ?auto_851659 ?auto_851658 ) ( ON ?auto_851660 ?auto_851659 ) ( ON ?auto_851661 ?auto_851660 ) ( ON ?auto_851662 ?auto_851661 ) ( ON ?auto_851663 ?auto_851662 ) ( ON ?auto_851664 ?auto_851663 ) ( ON ?auto_851665 ?auto_851664 ) ( ON ?auto_851666 ?auto_851665 ) ( ON ?auto_851667 ?auto_851666 ) ( ON ?auto_851668 ?auto_851667 ) ( ON ?auto_851669 ?auto_851668 ) ( ON ?auto_851670 ?auto_851669 ) ( not ( = ?auto_851657 ?auto_851658 ) ) ( not ( = ?auto_851657 ?auto_851659 ) ) ( not ( = ?auto_851657 ?auto_851660 ) ) ( not ( = ?auto_851657 ?auto_851661 ) ) ( not ( = ?auto_851657 ?auto_851662 ) ) ( not ( = ?auto_851657 ?auto_851663 ) ) ( not ( = ?auto_851657 ?auto_851664 ) ) ( not ( = ?auto_851657 ?auto_851665 ) ) ( not ( = ?auto_851657 ?auto_851666 ) ) ( not ( = ?auto_851657 ?auto_851667 ) ) ( not ( = ?auto_851657 ?auto_851668 ) ) ( not ( = ?auto_851657 ?auto_851669 ) ) ( not ( = ?auto_851657 ?auto_851670 ) ) ( not ( = ?auto_851657 ?auto_851671 ) ) ( not ( = ?auto_851657 ?auto_851672 ) ) ( not ( = ?auto_851657 ?auto_851673 ) ) ( not ( = ?auto_851657 ?auto_851674 ) ) ( not ( = ?auto_851658 ?auto_851659 ) ) ( not ( = ?auto_851658 ?auto_851660 ) ) ( not ( = ?auto_851658 ?auto_851661 ) ) ( not ( = ?auto_851658 ?auto_851662 ) ) ( not ( = ?auto_851658 ?auto_851663 ) ) ( not ( = ?auto_851658 ?auto_851664 ) ) ( not ( = ?auto_851658 ?auto_851665 ) ) ( not ( = ?auto_851658 ?auto_851666 ) ) ( not ( = ?auto_851658 ?auto_851667 ) ) ( not ( = ?auto_851658 ?auto_851668 ) ) ( not ( = ?auto_851658 ?auto_851669 ) ) ( not ( = ?auto_851658 ?auto_851670 ) ) ( not ( = ?auto_851658 ?auto_851671 ) ) ( not ( = ?auto_851658 ?auto_851672 ) ) ( not ( = ?auto_851658 ?auto_851673 ) ) ( not ( = ?auto_851658 ?auto_851674 ) ) ( not ( = ?auto_851659 ?auto_851660 ) ) ( not ( = ?auto_851659 ?auto_851661 ) ) ( not ( = ?auto_851659 ?auto_851662 ) ) ( not ( = ?auto_851659 ?auto_851663 ) ) ( not ( = ?auto_851659 ?auto_851664 ) ) ( not ( = ?auto_851659 ?auto_851665 ) ) ( not ( = ?auto_851659 ?auto_851666 ) ) ( not ( = ?auto_851659 ?auto_851667 ) ) ( not ( = ?auto_851659 ?auto_851668 ) ) ( not ( = ?auto_851659 ?auto_851669 ) ) ( not ( = ?auto_851659 ?auto_851670 ) ) ( not ( = ?auto_851659 ?auto_851671 ) ) ( not ( = ?auto_851659 ?auto_851672 ) ) ( not ( = ?auto_851659 ?auto_851673 ) ) ( not ( = ?auto_851659 ?auto_851674 ) ) ( not ( = ?auto_851660 ?auto_851661 ) ) ( not ( = ?auto_851660 ?auto_851662 ) ) ( not ( = ?auto_851660 ?auto_851663 ) ) ( not ( = ?auto_851660 ?auto_851664 ) ) ( not ( = ?auto_851660 ?auto_851665 ) ) ( not ( = ?auto_851660 ?auto_851666 ) ) ( not ( = ?auto_851660 ?auto_851667 ) ) ( not ( = ?auto_851660 ?auto_851668 ) ) ( not ( = ?auto_851660 ?auto_851669 ) ) ( not ( = ?auto_851660 ?auto_851670 ) ) ( not ( = ?auto_851660 ?auto_851671 ) ) ( not ( = ?auto_851660 ?auto_851672 ) ) ( not ( = ?auto_851660 ?auto_851673 ) ) ( not ( = ?auto_851660 ?auto_851674 ) ) ( not ( = ?auto_851661 ?auto_851662 ) ) ( not ( = ?auto_851661 ?auto_851663 ) ) ( not ( = ?auto_851661 ?auto_851664 ) ) ( not ( = ?auto_851661 ?auto_851665 ) ) ( not ( = ?auto_851661 ?auto_851666 ) ) ( not ( = ?auto_851661 ?auto_851667 ) ) ( not ( = ?auto_851661 ?auto_851668 ) ) ( not ( = ?auto_851661 ?auto_851669 ) ) ( not ( = ?auto_851661 ?auto_851670 ) ) ( not ( = ?auto_851661 ?auto_851671 ) ) ( not ( = ?auto_851661 ?auto_851672 ) ) ( not ( = ?auto_851661 ?auto_851673 ) ) ( not ( = ?auto_851661 ?auto_851674 ) ) ( not ( = ?auto_851662 ?auto_851663 ) ) ( not ( = ?auto_851662 ?auto_851664 ) ) ( not ( = ?auto_851662 ?auto_851665 ) ) ( not ( = ?auto_851662 ?auto_851666 ) ) ( not ( = ?auto_851662 ?auto_851667 ) ) ( not ( = ?auto_851662 ?auto_851668 ) ) ( not ( = ?auto_851662 ?auto_851669 ) ) ( not ( = ?auto_851662 ?auto_851670 ) ) ( not ( = ?auto_851662 ?auto_851671 ) ) ( not ( = ?auto_851662 ?auto_851672 ) ) ( not ( = ?auto_851662 ?auto_851673 ) ) ( not ( = ?auto_851662 ?auto_851674 ) ) ( not ( = ?auto_851663 ?auto_851664 ) ) ( not ( = ?auto_851663 ?auto_851665 ) ) ( not ( = ?auto_851663 ?auto_851666 ) ) ( not ( = ?auto_851663 ?auto_851667 ) ) ( not ( = ?auto_851663 ?auto_851668 ) ) ( not ( = ?auto_851663 ?auto_851669 ) ) ( not ( = ?auto_851663 ?auto_851670 ) ) ( not ( = ?auto_851663 ?auto_851671 ) ) ( not ( = ?auto_851663 ?auto_851672 ) ) ( not ( = ?auto_851663 ?auto_851673 ) ) ( not ( = ?auto_851663 ?auto_851674 ) ) ( not ( = ?auto_851664 ?auto_851665 ) ) ( not ( = ?auto_851664 ?auto_851666 ) ) ( not ( = ?auto_851664 ?auto_851667 ) ) ( not ( = ?auto_851664 ?auto_851668 ) ) ( not ( = ?auto_851664 ?auto_851669 ) ) ( not ( = ?auto_851664 ?auto_851670 ) ) ( not ( = ?auto_851664 ?auto_851671 ) ) ( not ( = ?auto_851664 ?auto_851672 ) ) ( not ( = ?auto_851664 ?auto_851673 ) ) ( not ( = ?auto_851664 ?auto_851674 ) ) ( not ( = ?auto_851665 ?auto_851666 ) ) ( not ( = ?auto_851665 ?auto_851667 ) ) ( not ( = ?auto_851665 ?auto_851668 ) ) ( not ( = ?auto_851665 ?auto_851669 ) ) ( not ( = ?auto_851665 ?auto_851670 ) ) ( not ( = ?auto_851665 ?auto_851671 ) ) ( not ( = ?auto_851665 ?auto_851672 ) ) ( not ( = ?auto_851665 ?auto_851673 ) ) ( not ( = ?auto_851665 ?auto_851674 ) ) ( not ( = ?auto_851666 ?auto_851667 ) ) ( not ( = ?auto_851666 ?auto_851668 ) ) ( not ( = ?auto_851666 ?auto_851669 ) ) ( not ( = ?auto_851666 ?auto_851670 ) ) ( not ( = ?auto_851666 ?auto_851671 ) ) ( not ( = ?auto_851666 ?auto_851672 ) ) ( not ( = ?auto_851666 ?auto_851673 ) ) ( not ( = ?auto_851666 ?auto_851674 ) ) ( not ( = ?auto_851667 ?auto_851668 ) ) ( not ( = ?auto_851667 ?auto_851669 ) ) ( not ( = ?auto_851667 ?auto_851670 ) ) ( not ( = ?auto_851667 ?auto_851671 ) ) ( not ( = ?auto_851667 ?auto_851672 ) ) ( not ( = ?auto_851667 ?auto_851673 ) ) ( not ( = ?auto_851667 ?auto_851674 ) ) ( not ( = ?auto_851668 ?auto_851669 ) ) ( not ( = ?auto_851668 ?auto_851670 ) ) ( not ( = ?auto_851668 ?auto_851671 ) ) ( not ( = ?auto_851668 ?auto_851672 ) ) ( not ( = ?auto_851668 ?auto_851673 ) ) ( not ( = ?auto_851668 ?auto_851674 ) ) ( not ( = ?auto_851669 ?auto_851670 ) ) ( not ( = ?auto_851669 ?auto_851671 ) ) ( not ( = ?auto_851669 ?auto_851672 ) ) ( not ( = ?auto_851669 ?auto_851673 ) ) ( not ( = ?auto_851669 ?auto_851674 ) ) ( not ( = ?auto_851670 ?auto_851671 ) ) ( not ( = ?auto_851670 ?auto_851672 ) ) ( not ( = ?auto_851670 ?auto_851673 ) ) ( not ( = ?auto_851670 ?auto_851674 ) ) ( not ( = ?auto_851671 ?auto_851672 ) ) ( not ( = ?auto_851671 ?auto_851673 ) ) ( not ( = ?auto_851671 ?auto_851674 ) ) ( not ( = ?auto_851672 ?auto_851673 ) ) ( not ( = ?auto_851672 ?auto_851674 ) ) ( not ( = ?auto_851673 ?auto_851674 ) ) ( ON ?auto_851672 ?auto_851673 ) ( CLEAR ?auto_851670 ) ( ON ?auto_851671 ?auto_851672 ) ( CLEAR ?auto_851671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_851657 ?auto_851658 ?auto_851659 ?auto_851660 ?auto_851661 ?auto_851662 ?auto_851663 ?auto_851664 ?auto_851665 ?auto_851666 ?auto_851667 ?auto_851668 ?auto_851669 ?auto_851670 ?auto_851671 )
      ( MAKE-17PILE ?auto_851657 ?auto_851658 ?auto_851659 ?auto_851660 ?auto_851661 ?auto_851662 ?auto_851663 ?auto_851664 ?auto_851665 ?auto_851666 ?auto_851667 ?auto_851668 ?auto_851669 ?auto_851670 ?auto_851671 ?auto_851672 ?auto_851673 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_851727 - BLOCK
      ?auto_851728 - BLOCK
      ?auto_851729 - BLOCK
      ?auto_851730 - BLOCK
      ?auto_851731 - BLOCK
      ?auto_851732 - BLOCK
      ?auto_851733 - BLOCK
      ?auto_851734 - BLOCK
      ?auto_851735 - BLOCK
      ?auto_851736 - BLOCK
      ?auto_851737 - BLOCK
      ?auto_851738 - BLOCK
      ?auto_851739 - BLOCK
      ?auto_851740 - BLOCK
      ?auto_851741 - BLOCK
      ?auto_851742 - BLOCK
      ?auto_851743 - BLOCK
    )
    :vars
    (
      ?auto_851744 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_851743 ?auto_851744 ) ( ON-TABLE ?auto_851727 ) ( ON ?auto_851728 ?auto_851727 ) ( ON ?auto_851729 ?auto_851728 ) ( ON ?auto_851730 ?auto_851729 ) ( ON ?auto_851731 ?auto_851730 ) ( ON ?auto_851732 ?auto_851731 ) ( ON ?auto_851733 ?auto_851732 ) ( ON ?auto_851734 ?auto_851733 ) ( ON ?auto_851735 ?auto_851734 ) ( ON ?auto_851736 ?auto_851735 ) ( ON ?auto_851737 ?auto_851736 ) ( ON ?auto_851738 ?auto_851737 ) ( ON ?auto_851739 ?auto_851738 ) ( not ( = ?auto_851727 ?auto_851728 ) ) ( not ( = ?auto_851727 ?auto_851729 ) ) ( not ( = ?auto_851727 ?auto_851730 ) ) ( not ( = ?auto_851727 ?auto_851731 ) ) ( not ( = ?auto_851727 ?auto_851732 ) ) ( not ( = ?auto_851727 ?auto_851733 ) ) ( not ( = ?auto_851727 ?auto_851734 ) ) ( not ( = ?auto_851727 ?auto_851735 ) ) ( not ( = ?auto_851727 ?auto_851736 ) ) ( not ( = ?auto_851727 ?auto_851737 ) ) ( not ( = ?auto_851727 ?auto_851738 ) ) ( not ( = ?auto_851727 ?auto_851739 ) ) ( not ( = ?auto_851727 ?auto_851740 ) ) ( not ( = ?auto_851727 ?auto_851741 ) ) ( not ( = ?auto_851727 ?auto_851742 ) ) ( not ( = ?auto_851727 ?auto_851743 ) ) ( not ( = ?auto_851727 ?auto_851744 ) ) ( not ( = ?auto_851728 ?auto_851729 ) ) ( not ( = ?auto_851728 ?auto_851730 ) ) ( not ( = ?auto_851728 ?auto_851731 ) ) ( not ( = ?auto_851728 ?auto_851732 ) ) ( not ( = ?auto_851728 ?auto_851733 ) ) ( not ( = ?auto_851728 ?auto_851734 ) ) ( not ( = ?auto_851728 ?auto_851735 ) ) ( not ( = ?auto_851728 ?auto_851736 ) ) ( not ( = ?auto_851728 ?auto_851737 ) ) ( not ( = ?auto_851728 ?auto_851738 ) ) ( not ( = ?auto_851728 ?auto_851739 ) ) ( not ( = ?auto_851728 ?auto_851740 ) ) ( not ( = ?auto_851728 ?auto_851741 ) ) ( not ( = ?auto_851728 ?auto_851742 ) ) ( not ( = ?auto_851728 ?auto_851743 ) ) ( not ( = ?auto_851728 ?auto_851744 ) ) ( not ( = ?auto_851729 ?auto_851730 ) ) ( not ( = ?auto_851729 ?auto_851731 ) ) ( not ( = ?auto_851729 ?auto_851732 ) ) ( not ( = ?auto_851729 ?auto_851733 ) ) ( not ( = ?auto_851729 ?auto_851734 ) ) ( not ( = ?auto_851729 ?auto_851735 ) ) ( not ( = ?auto_851729 ?auto_851736 ) ) ( not ( = ?auto_851729 ?auto_851737 ) ) ( not ( = ?auto_851729 ?auto_851738 ) ) ( not ( = ?auto_851729 ?auto_851739 ) ) ( not ( = ?auto_851729 ?auto_851740 ) ) ( not ( = ?auto_851729 ?auto_851741 ) ) ( not ( = ?auto_851729 ?auto_851742 ) ) ( not ( = ?auto_851729 ?auto_851743 ) ) ( not ( = ?auto_851729 ?auto_851744 ) ) ( not ( = ?auto_851730 ?auto_851731 ) ) ( not ( = ?auto_851730 ?auto_851732 ) ) ( not ( = ?auto_851730 ?auto_851733 ) ) ( not ( = ?auto_851730 ?auto_851734 ) ) ( not ( = ?auto_851730 ?auto_851735 ) ) ( not ( = ?auto_851730 ?auto_851736 ) ) ( not ( = ?auto_851730 ?auto_851737 ) ) ( not ( = ?auto_851730 ?auto_851738 ) ) ( not ( = ?auto_851730 ?auto_851739 ) ) ( not ( = ?auto_851730 ?auto_851740 ) ) ( not ( = ?auto_851730 ?auto_851741 ) ) ( not ( = ?auto_851730 ?auto_851742 ) ) ( not ( = ?auto_851730 ?auto_851743 ) ) ( not ( = ?auto_851730 ?auto_851744 ) ) ( not ( = ?auto_851731 ?auto_851732 ) ) ( not ( = ?auto_851731 ?auto_851733 ) ) ( not ( = ?auto_851731 ?auto_851734 ) ) ( not ( = ?auto_851731 ?auto_851735 ) ) ( not ( = ?auto_851731 ?auto_851736 ) ) ( not ( = ?auto_851731 ?auto_851737 ) ) ( not ( = ?auto_851731 ?auto_851738 ) ) ( not ( = ?auto_851731 ?auto_851739 ) ) ( not ( = ?auto_851731 ?auto_851740 ) ) ( not ( = ?auto_851731 ?auto_851741 ) ) ( not ( = ?auto_851731 ?auto_851742 ) ) ( not ( = ?auto_851731 ?auto_851743 ) ) ( not ( = ?auto_851731 ?auto_851744 ) ) ( not ( = ?auto_851732 ?auto_851733 ) ) ( not ( = ?auto_851732 ?auto_851734 ) ) ( not ( = ?auto_851732 ?auto_851735 ) ) ( not ( = ?auto_851732 ?auto_851736 ) ) ( not ( = ?auto_851732 ?auto_851737 ) ) ( not ( = ?auto_851732 ?auto_851738 ) ) ( not ( = ?auto_851732 ?auto_851739 ) ) ( not ( = ?auto_851732 ?auto_851740 ) ) ( not ( = ?auto_851732 ?auto_851741 ) ) ( not ( = ?auto_851732 ?auto_851742 ) ) ( not ( = ?auto_851732 ?auto_851743 ) ) ( not ( = ?auto_851732 ?auto_851744 ) ) ( not ( = ?auto_851733 ?auto_851734 ) ) ( not ( = ?auto_851733 ?auto_851735 ) ) ( not ( = ?auto_851733 ?auto_851736 ) ) ( not ( = ?auto_851733 ?auto_851737 ) ) ( not ( = ?auto_851733 ?auto_851738 ) ) ( not ( = ?auto_851733 ?auto_851739 ) ) ( not ( = ?auto_851733 ?auto_851740 ) ) ( not ( = ?auto_851733 ?auto_851741 ) ) ( not ( = ?auto_851733 ?auto_851742 ) ) ( not ( = ?auto_851733 ?auto_851743 ) ) ( not ( = ?auto_851733 ?auto_851744 ) ) ( not ( = ?auto_851734 ?auto_851735 ) ) ( not ( = ?auto_851734 ?auto_851736 ) ) ( not ( = ?auto_851734 ?auto_851737 ) ) ( not ( = ?auto_851734 ?auto_851738 ) ) ( not ( = ?auto_851734 ?auto_851739 ) ) ( not ( = ?auto_851734 ?auto_851740 ) ) ( not ( = ?auto_851734 ?auto_851741 ) ) ( not ( = ?auto_851734 ?auto_851742 ) ) ( not ( = ?auto_851734 ?auto_851743 ) ) ( not ( = ?auto_851734 ?auto_851744 ) ) ( not ( = ?auto_851735 ?auto_851736 ) ) ( not ( = ?auto_851735 ?auto_851737 ) ) ( not ( = ?auto_851735 ?auto_851738 ) ) ( not ( = ?auto_851735 ?auto_851739 ) ) ( not ( = ?auto_851735 ?auto_851740 ) ) ( not ( = ?auto_851735 ?auto_851741 ) ) ( not ( = ?auto_851735 ?auto_851742 ) ) ( not ( = ?auto_851735 ?auto_851743 ) ) ( not ( = ?auto_851735 ?auto_851744 ) ) ( not ( = ?auto_851736 ?auto_851737 ) ) ( not ( = ?auto_851736 ?auto_851738 ) ) ( not ( = ?auto_851736 ?auto_851739 ) ) ( not ( = ?auto_851736 ?auto_851740 ) ) ( not ( = ?auto_851736 ?auto_851741 ) ) ( not ( = ?auto_851736 ?auto_851742 ) ) ( not ( = ?auto_851736 ?auto_851743 ) ) ( not ( = ?auto_851736 ?auto_851744 ) ) ( not ( = ?auto_851737 ?auto_851738 ) ) ( not ( = ?auto_851737 ?auto_851739 ) ) ( not ( = ?auto_851737 ?auto_851740 ) ) ( not ( = ?auto_851737 ?auto_851741 ) ) ( not ( = ?auto_851737 ?auto_851742 ) ) ( not ( = ?auto_851737 ?auto_851743 ) ) ( not ( = ?auto_851737 ?auto_851744 ) ) ( not ( = ?auto_851738 ?auto_851739 ) ) ( not ( = ?auto_851738 ?auto_851740 ) ) ( not ( = ?auto_851738 ?auto_851741 ) ) ( not ( = ?auto_851738 ?auto_851742 ) ) ( not ( = ?auto_851738 ?auto_851743 ) ) ( not ( = ?auto_851738 ?auto_851744 ) ) ( not ( = ?auto_851739 ?auto_851740 ) ) ( not ( = ?auto_851739 ?auto_851741 ) ) ( not ( = ?auto_851739 ?auto_851742 ) ) ( not ( = ?auto_851739 ?auto_851743 ) ) ( not ( = ?auto_851739 ?auto_851744 ) ) ( not ( = ?auto_851740 ?auto_851741 ) ) ( not ( = ?auto_851740 ?auto_851742 ) ) ( not ( = ?auto_851740 ?auto_851743 ) ) ( not ( = ?auto_851740 ?auto_851744 ) ) ( not ( = ?auto_851741 ?auto_851742 ) ) ( not ( = ?auto_851741 ?auto_851743 ) ) ( not ( = ?auto_851741 ?auto_851744 ) ) ( not ( = ?auto_851742 ?auto_851743 ) ) ( not ( = ?auto_851742 ?auto_851744 ) ) ( not ( = ?auto_851743 ?auto_851744 ) ) ( ON ?auto_851742 ?auto_851743 ) ( ON ?auto_851741 ?auto_851742 ) ( CLEAR ?auto_851739 ) ( ON ?auto_851740 ?auto_851741 ) ( CLEAR ?auto_851740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_851727 ?auto_851728 ?auto_851729 ?auto_851730 ?auto_851731 ?auto_851732 ?auto_851733 ?auto_851734 ?auto_851735 ?auto_851736 ?auto_851737 ?auto_851738 ?auto_851739 ?auto_851740 )
      ( MAKE-17PILE ?auto_851727 ?auto_851728 ?auto_851729 ?auto_851730 ?auto_851731 ?auto_851732 ?auto_851733 ?auto_851734 ?auto_851735 ?auto_851736 ?auto_851737 ?auto_851738 ?auto_851739 ?auto_851740 ?auto_851741 ?auto_851742 ?auto_851743 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_851797 - BLOCK
      ?auto_851798 - BLOCK
      ?auto_851799 - BLOCK
      ?auto_851800 - BLOCK
      ?auto_851801 - BLOCK
      ?auto_851802 - BLOCK
      ?auto_851803 - BLOCK
      ?auto_851804 - BLOCK
      ?auto_851805 - BLOCK
      ?auto_851806 - BLOCK
      ?auto_851807 - BLOCK
      ?auto_851808 - BLOCK
      ?auto_851809 - BLOCK
      ?auto_851810 - BLOCK
      ?auto_851811 - BLOCK
      ?auto_851812 - BLOCK
      ?auto_851813 - BLOCK
    )
    :vars
    (
      ?auto_851814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_851813 ?auto_851814 ) ( ON-TABLE ?auto_851797 ) ( ON ?auto_851798 ?auto_851797 ) ( ON ?auto_851799 ?auto_851798 ) ( ON ?auto_851800 ?auto_851799 ) ( ON ?auto_851801 ?auto_851800 ) ( ON ?auto_851802 ?auto_851801 ) ( ON ?auto_851803 ?auto_851802 ) ( ON ?auto_851804 ?auto_851803 ) ( ON ?auto_851805 ?auto_851804 ) ( ON ?auto_851806 ?auto_851805 ) ( ON ?auto_851807 ?auto_851806 ) ( ON ?auto_851808 ?auto_851807 ) ( not ( = ?auto_851797 ?auto_851798 ) ) ( not ( = ?auto_851797 ?auto_851799 ) ) ( not ( = ?auto_851797 ?auto_851800 ) ) ( not ( = ?auto_851797 ?auto_851801 ) ) ( not ( = ?auto_851797 ?auto_851802 ) ) ( not ( = ?auto_851797 ?auto_851803 ) ) ( not ( = ?auto_851797 ?auto_851804 ) ) ( not ( = ?auto_851797 ?auto_851805 ) ) ( not ( = ?auto_851797 ?auto_851806 ) ) ( not ( = ?auto_851797 ?auto_851807 ) ) ( not ( = ?auto_851797 ?auto_851808 ) ) ( not ( = ?auto_851797 ?auto_851809 ) ) ( not ( = ?auto_851797 ?auto_851810 ) ) ( not ( = ?auto_851797 ?auto_851811 ) ) ( not ( = ?auto_851797 ?auto_851812 ) ) ( not ( = ?auto_851797 ?auto_851813 ) ) ( not ( = ?auto_851797 ?auto_851814 ) ) ( not ( = ?auto_851798 ?auto_851799 ) ) ( not ( = ?auto_851798 ?auto_851800 ) ) ( not ( = ?auto_851798 ?auto_851801 ) ) ( not ( = ?auto_851798 ?auto_851802 ) ) ( not ( = ?auto_851798 ?auto_851803 ) ) ( not ( = ?auto_851798 ?auto_851804 ) ) ( not ( = ?auto_851798 ?auto_851805 ) ) ( not ( = ?auto_851798 ?auto_851806 ) ) ( not ( = ?auto_851798 ?auto_851807 ) ) ( not ( = ?auto_851798 ?auto_851808 ) ) ( not ( = ?auto_851798 ?auto_851809 ) ) ( not ( = ?auto_851798 ?auto_851810 ) ) ( not ( = ?auto_851798 ?auto_851811 ) ) ( not ( = ?auto_851798 ?auto_851812 ) ) ( not ( = ?auto_851798 ?auto_851813 ) ) ( not ( = ?auto_851798 ?auto_851814 ) ) ( not ( = ?auto_851799 ?auto_851800 ) ) ( not ( = ?auto_851799 ?auto_851801 ) ) ( not ( = ?auto_851799 ?auto_851802 ) ) ( not ( = ?auto_851799 ?auto_851803 ) ) ( not ( = ?auto_851799 ?auto_851804 ) ) ( not ( = ?auto_851799 ?auto_851805 ) ) ( not ( = ?auto_851799 ?auto_851806 ) ) ( not ( = ?auto_851799 ?auto_851807 ) ) ( not ( = ?auto_851799 ?auto_851808 ) ) ( not ( = ?auto_851799 ?auto_851809 ) ) ( not ( = ?auto_851799 ?auto_851810 ) ) ( not ( = ?auto_851799 ?auto_851811 ) ) ( not ( = ?auto_851799 ?auto_851812 ) ) ( not ( = ?auto_851799 ?auto_851813 ) ) ( not ( = ?auto_851799 ?auto_851814 ) ) ( not ( = ?auto_851800 ?auto_851801 ) ) ( not ( = ?auto_851800 ?auto_851802 ) ) ( not ( = ?auto_851800 ?auto_851803 ) ) ( not ( = ?auto_851800 ?auto_851804 ) ) ( not ( = ?auto_851800 ?auto_851805 ) ) ( not ( = ?auto_851800 ?auto_851806 ) ) ( not ( = ?auto_851800 ?auto_851807 ) ) ( not ( = ?auto_851800 ?auto_851808 ) ) ( not ( = ?auto_851800 ?auto_851809 ) ) ( not ( = ?auto_851800 ?auto_851810 ) ) ( not ( = ?auto_851800 ?auto_851811 ) ) ( not ( = ?auto_851800 ?auto_851812 ) ) ( not ( = ?auto_851800 ?auto_851813 ) ) ( not ( = ?auto_851800 ?auto_851814 ) ) ( not ( = ?auto_851801 ?auto_851802 ) ) ( not ( = ?auto_851801 ?auto_851803 ) ) ( not ( = ?auto_851801 ?auto_851804 ) ) ( not ( = ?auto_851801 ?auto_851805 ) ) ( not ( = ?auto_851801 ?auto_851806 ) ) ( not ( = ?auto_851801 ?auto_851807 ) ) ( not ( = ?auto_851801 ?auto_851808 ) ) ( not ( = ?auto_851801 ?auto_851809 ) ) ( not ( = ?auto_851801 ?auto_851810 ) ) ( not ( = ?auto_851801 ?auto_851811 ) ) ( not ( = ?auto_851801 ?auto_851812 ) ) ( not ( = ?auto_851801 ?auto_851813 ) ) ( not ( = ?auto_851801 ?auto_851814 ) ) ( not ( = ?auto_851802 ?auto_851803 ) ) ( not ( = ?auto_851802 ?auto_851804 ) ) ( not ( = ?auto_851802 ?auto_851805 ) ) ( not ( = ?auto_851802 ?auto_851806 ) ) ( not ( = ?auto_851802 ?auto_851807 ) ) ( not ( = ?auto_851802 ?auto_851808 ) ) ( not ( = ?auto_851802 ?auto_851809 ) ) ( not ( = ?auto_851802 ?auto_851810 ) ) ( not ( = ?auto_851802 ?auto_851811 ) ) ( not ( = ?auto_851802 ?auto_851812 ) ) ( not ( = ?auto_851802 ?auto_851813 ) ) ( not ( = ?auto_851802 ?auto_851814 ) ) ( not ( = ?auto_851803 ?auto_851804 ) ) ( not ( = ?auto_851803 ?auto_851805 ) ) ( not ( = ?auto_851803 ?auto_851806 ) ) ( not ( = ?auto_851803 ?auto_851807 ) ) ( not ( = ?auto_851803 ?auto_851808 ) ) ( not ( = ?auto_851803 ?auto_851809 ) ) ( not ( = ?auto_851803 ?auto_851810 ) ) ( not ( = ?auto_851803 ?auto_851811 ) ) ( not ( = ?auto_851803 ?auto_851812 ) ) ( not ( = ?auto_851803 ?auto_851813 ) ) ( not ( = ?auto_851803 ?auto_851814 ) ) ( not ( = ?auto_851804 ?auto_851805 ) ) ( not ( = ?auto_851804 ?auto_851806 ) ) ( not ( = ?auto_851804 ?auto_851807 ) ) ( not ( = ?auto_851804 ?auto_851808 ) ) ( not ( = ?auto_851804 ?auto_851809 ) ) ( not ( = ?auto_851804 ?auto_851810 ) ) ( not ( = ?auto_851804 ?auto_851811 ) ) ( not ( = ?auto_851804 ?auto_851812 ) ) ( not ( = ?auto_851804 ?auto_851813 ) ) ( not ( = ?auto_851804 ?auto_851814 ) ) ( not ( = ?auto_851805 ?auto_851806 ) ) ( not ( = ?auto_851805 ?auto_851807 ) ) ( not ( = ?auto_851805 ?auto_851808 ) ) ( not ( = ?auto_851805 ?auto_851809 ) ) ( not ( = ?auto_851805 ?auto_851810 ) ) ( not ( = ?auto_851805 ?auto_851811 ) ) ( not ( = ?auto_851805 ?auto_851812 ) ) ( not ( = ?auto_851805 ?auto_851813 ) ) ( not ( = ?auto_851805 ?auto_851814 ) ) ( not ( = ?auto_851806 ?auto_851807 ) ) ( not ( = ?auto_851806 ?auto_851808 ) ) ( not ( = ?auto_851806 ?auto_851809 ) ) ( not ( = ?auto_851806 ?auto_851810 ) ) ( not ( = ?auto_851806 ?auto_851811 ) ) ( not ( = ?auto_851806 ?auto_851812 ) ) ( not ( = ?auto_851806 ?auto_851813 ) ) ( not ( = ?auto_851806 ?auto_851814 ) ) ( not ( = ?auto_851807 ?auto_851808 ) ) ( not ( = ?auto_851807 ?auto_851809 ) ) ( not ( = ?auto_851807 ?auto_851810 ) ) ( not ( = ?auto_851807 ?auto_851811 ) ) ( not ( = ?auto_851807 ?auto_851812 ) ) ( not ( = ?auto_851807 ?auto_851813 ) ) ( not ( = ?auto_851807 ?auto_851814 ) ) ( not ( = ?auto_851808 ?auto_851809 ) ) ( not ( = ?auto_851808 ?auto_851810 ) ) ( not ( = ?auto_851808 ?auto_851811 ) ) ( not ( = ?auto_851808 ?auto_851812 ) ) ( not ( = ?auto_851808 ?auto_851813 ) ) ( not ( = ?auto_851808 ?auto_851814 ) ) ( not ( = ?auto_851809 ?auto_851810 ) ) ( not ( = ?auto_851809 ?auto_851811 ) ) ( not ( = ?auto_851809 ?auto_851812 ) ) ( not ( = ?auto_851809 ?auto_851813 ) ) ( not ( = ?auto_851809 ?auto_851814 ) ) ( not ( = ?auto_851810 ?auto_851811 ) ) ( not ( = ?auto_851810 ?auto_851812 ) ) ( not ( = ?auto_851810 ?auto_851813 ) ) ( not ( = ?auto_851810 ?auto_851814 ) ) ( not ( = ?auto_851811 ?auto_851812 ) ) ( not ( = ?auto_851811 ?auto_851813 ) ) ( not ( = ?auto_851811 ?auto_851814 ) ) ( not ( = ?auto_851812 ?auto_851813 ) ) ( not ( = ?auto_851812 ?auto_851814 ) ) ( not ( = ?auto_851813 ?auto_851814 ) ) ( ON ?auto_851812 ?auto_851813 ) ( ON ?auto_851811 ?auto_851812 ) ( ON ?auto_851810 ?auto_851811 ) ( CLEAR ?auto_851808 ) ( ON ?auto_851809 ?auto_851810 ) ( CLEAR ?auto_851809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_851797 ?auto_851798 ?auto_851799 ?auto_851800 ?auto_851801 ?auto_851802 ?auto_851803 ?auto_851804 ?auto_851805 ?auto_851806 ?auto_851807 ?auto_851808 ?auto_851809 )
      ( MAKE-17PILE ?auto_851797 ?auto_851798 ?auto_851799 ?auto_851800 ?auto_851801 ?auto_851802 ?auto_851803 ?auto_851804 ?auto_851805 ?auto_851806 ?auto_851807 ?auto_851808 ?auto_851809 ?auto_851810 ?auto_851811 ?auto_851812 ?auto_851813 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_851867 - BLOCK
      ?auto_851868 - BLOCK
      ?auto_851869 - BLOCK
      ?auto_851870 - BLOCK
      ?auto_851871 - BLOCK
      ?auto_851872 - BLOCK
      ?auto_851873 - BLOCK
      ?auto_851874 - BLOCK
      ?auto_851875 - BLOCK
      ?auto_851876 - BLOCK
      ?auto_851877 - BLOCK
      ?auto_851878 - BLOCK
      ?auto_851879 - BLOCK
      ?auto_851880 - BLOCK
      ?auto_851881 - BLOCK
      ?auto_851882 - BLOCK
      ?auto_851883 - BLOCK
    )
    :vars
    (
      ?auto_851884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_851883 ?auto_851884 ) ( ON-TABLE ?auto_851867 ) ( ON ?auto_851868 ?auto_851867 ) ( ON ?auto_851869 ?auto_851868 ) ( ON ?auto_851870 ?auto_851869 ) ( ON ?auto_851871 ?auto_851870 ) ( ON ?auto_851872 ?auto_851871 ) ( ON ?auto_851873 ?auto_851872 ) ( ON ?auto_851874 ?auto_851873 ) ( ON ?auto_851875 ?auto_851874 ) ( ON ?auto_851876 ?auto_851875 ) ( ON ?auto_851877 ?auto_851876 ) ( not ( = ?auto_851867 ?auto_851868 ) ) ( not ( = ?auto_851867 ?auto_851869 ) ) ( not ( = ?auto_851867 ?auto_851870 ) ) ( not ( = ?auto_851867 ?auto_851871 ) ) ( not ( = ?auto_851867 ?auto_851872 ) ) ( not ( = ?auto_851867 ?auto_851873 ) ) ( not ( = ?auto_851867 ?auto_851874 ) ) ( not ( = ?auto_851867 ?auto_851875 ) ) ( not ( = ?auto_851867 ?auto_851876 ) ) ( not ( = ?auto_851867 ?auto_851877 ) ) ( not ( = ?auto_851867 ?auto_851878 ) ) ( not ( = ?auto_851867 ?auto_851879 ) ) ( not ( = ?auto_851867 ?auto_851880 ) ) ( not ( = ?auto_851867 ?auto_851881 ) ) ( not ( = ?auto_851867 ?auto_851882 ) ) ( not ( = ?auto_851867 ?auto_851883 ) ) ( not ( = ?auto_851867 ?auto_851884 ) ) ( not ( = ?auto_851868 ?auto_851869 ) ) ( not ( = ?auto_851868 ?auto_851870 ) ) ( not ( = ?auto_851868 ?auto_851871 ) ) ( not ( = ?auto_851868 ?auto_851872 ) ) ( not ( = ?auto_851868 ?auto_851873 ) ) ( not ( = ?auto_851868 ?auto_851874 ) ) ( not ( = ?auto_851868 ?auto_851875 ) ) ( not ( = ?auto_851868 ?auto_851876 ) ) ( not ( = ?auto_851868 ?auto_851877 ) ) ( not ( = ?auto_851868 ?auto_851878 ) ) ( not ( = ?auto_851868 ?auto_851879 ) ) ( not ( = ?auto_851868 ?auto_851880 ) ) ( not ( = ?auto_851868 ?auto_851881 ) ) ( not ( = ?auto_851868 ?auto_851882 ) ) ( not ( = ?auto_851868 ?auto_851883 ) ) ( not ( = ?auto_851868 ?auto_851884 ) ) ( not ( = ?auto_851869 ?auto_851870 ) ) ( not ( = ?auto_851869 ?auto_851871 ) ) ( not ( = ?auto_851869 ?auto_851872 ) ) ( not ( = ?auto_851869 ?auto_851873 ) ) ( not ( = ?auto_851869 ?auto_851874 ) ) ( not ( = ?auto_851869 ?auto_851875 ) ) ( not ( = ?auto_851869 ?auto_851876 ) ) ( not ( = ?auto_851869 ?auto_851877 ) ) ( not ( = ?auto_851869 ?auto_851878 ) ) ( not ( = ?auto_851869 ?auto_851879 ) ) ( not ( = ?auto_851869 ?auto_851880 ) ) ( not ( = ?auto_851869 ?auto_851881 ) ) ( not ( = ?auto_851869 ?auto_851882 ) ) ( not ( = ?auto_851869 ?auto_851883 ) ) ( not ( = ?auto_851869 ?auto_851884 ) ) ( not ( = ?auto_851870 ?auto_851871 ) ) ( not ( = ?auto_851870 ?auto_851872 ) ) ( not ( = ?auto_851870 ?auto_851873 ) ) ( not ( = ?auto_851870 ?auto_851874 ) ) ( not ( = ?auto_851870 ?auto_851875 ) ) ( not ( = ?auto_851870 ?auto_851876 ) ) ( not ( = ?auto_851870 ?auto_851877 ) ) ( not ( = ?auto_851870 ?auto_851878 ) ) ( not ( = ?auto_851870 ?auto_851879 ) ) ( not ( = ?auto_851870 ?auto_851880 ) ) ( not ( = ?auto_851870 ?auto_851881 ) ) ( not ( = ?auto_851870 ?auto_851882 ) ) ( not ( = ?auto_851870 ?auto_851883 ) ) ( not ( = ?auto_851870 ?auto_851884 ) ) ( not ( = ?auto_851871 ?auto_851872 ) ) ( not ( = ?auto_851871 ?auto_851873 ) ) ( not ( = ?auto_851871 ?auto_851874 ) ) ( not ( = ?auto_851871 ?auto_851875 ) ) ( not ( = ?auto_851871 ?auto_851876 ) ) ( not ( = ?auto_851871 ?auto_851877 ) ) ( not ( = ?auto_851871 ?auto_851878 ) ) ( not ( = ?auto_851871 ?auto_851879 ) ) ( not ( = ?auto_851871 ?auto_851880 ) ) ( not ( = ?auto_851871 ?auto_851881 ) ) ( not ( = ?auto_851871 ?auto_851882 ) ) ( not ( = ?auto_851871 ?auto_851883 ) ) ( not ( = ?auto_851871 ?auto_851884 ) ) ( not ( = ?auto_851872 ?auto_851873 ) ) ( not ( = ?auto_851872 ?auto_851874 ) ) ( not ( = ?auto_851872 ?auto_851875 ) ) ( not ( = ?auto_851872 ?auto_851876 ) ) ( not ( = ?auto_851872 ?auto_851877 ) ) ( not ( = ?auto_851872 ?auto_851878 ) ) ( not ( = ?auto_851872 ?auto_851879 ) ) ( not ( = ?auto_851872 ?auto_851880 ) ) ( not ( = ?auto_851872 ?auto_851881 ) ) ( not ( = ?auto_851872 ?auto_851882 ) ) ( not ( = ?auto_851872 ?auto_851883 ) ) ( not ( = ?auto_851872 ?auto_851884 ) ) ( not ( = ?auto_851873 ?auto_851874 ) ) ( not ( = ?auto_851873 ?auto_851875 ) ) ( not ( = ?auto_851873 ?auto_851876 ) ) ( not ( = ?auto_851873 ?auto_851877 ) ) ( not ( = ?auto_851873 ?auto_851878 ) ) ( not ( = ?auto_851873 ?auto_851879 ) ) ( not ( = ?auto_851873 ?auto_851880 ) ) ( not ( = ?auto_851873 ?auto_851881 ) ) ( not ( = ?auto_851873 ?auto_851882 ) ) ( not ( = ?auto_851873 ?auto_851883 ) ) ( not ( = ?auto_851873 ?auto_851884 ) ) ( not ( = ?auto_851874 ?auto_851875 ) ) ( not ( = ?auto_851874 ?auto_851876 ) ) ( not ( = ?auto_851874 ?auto_851877 ) ) ( not ( = ?auto_851874 ?auto_851878 ) ) ( not ( = ?auto_851874 ?auto_851879 ) ) ( not ( = ?auto_851874 ?auto_851880 ) ) ( not ( = ?auto_851874 ?auto_851881 ) ) ( not ( = ?auto_851874 ?auto_851882 ) ) ( not ( = ?auto_851874 ?auto_851883 ) ) ( not ( = ?auto_851874 ?auto_851884 ) ) ( not ( = ?auto_851875 ?auto_851876 ) ) ( not ( = ?auto_851875 ?auto_851877 ) ) ( not ( = ?auto_851875 ?auto_851878 ) ) ( not ( = ?auto_851875 ?auto_851879 ) ) ( not ( = ?auto_851875 ?auto_851880 ) ) ( not ( = ?auto_851875 ?auto_851881 ) ) ( not ( = ?auto_851875 ?auto_851882 ) ) ( not ( = ?auto_851875 ?auto_851883 ) ) ( not ( = ?auto_851875 ?auto_851884 ) ) ( not ( = ?auto_851876 ?auto_851877 ) ) ( not ( = ?auto_851876 ?auto_851878 ) ) ( not ( = ?auto_851876 ?auto_851879 ) ) ( not ( = ?auto_851876 ?auto_851880 ) ) ( not ( = ?auto_851876 ?auto_851881 ) ) ( not ( = ?auto_851876 ?auto_851882 ) ) ( not ( = ?auto_851876 ?auto_851883 ) ) ( not ( = ?auto_851876 ?auto_851884 ) ) ( not ( = ?auto_851877 ?auto_851878 ) ) ( not ( = ?auto_851877 ?auto_851879 ) ) ( not ( = ?auto_851877 ?auto_851880 ) ) ( not ( = ?auto_851877 ?auto_851881 ) ) ( not ( = ?auto_851877 ?auto_851882 ) ) ( not ( = ?auto_851877 ?auto_851883 ) ) ( not ( = ?auto_851877 ?auto_851884 ) ) ( not ( = ?auto_851878 ?auto_851879 ) ) ( not ( = ?auto_851878 ?auto_851880 ) ) ( not ( = ?auto_851878 ?auto_851881 ) ) ( not ( = ?auto_851878 ?auto_851882 ) ) ( not ( = ?auto_851878 ?auto_851883 ) ) ( not ( = ?auto_851878 ?auto_851884 ) ) ( not ( = ?auto_851879 ?auto_851880 ) ) ( not ( = ?auto_851879 ?auto_851881 ) ) ( not ( = ?auto_851879 ?auto_851882 ) ) ( not ( = ?auto_851879 ?auto_851883 ) ) ( not ( = ?auto_851879 ?auto_851884 ) ) ( not ( = ?auto_851880 ?auto_851881 ) ) ( not ( = ?auto_851880 ?auto_851882 ) ) ( not ( = ?auto_851880 ?auto_851883 ) ) ( not ( = ?auto_851880 ?auto_851884 ) ) ( not ( = ?auto_851881 ?auto_851882 ) ) ( not ( = ?auto_851881 ?auto_851883 ) ) ( not ( = ?auto_851881 ?auto_851884 ) ) ( not ( = ?auto_851882 ?auto_851883 ) ) ( not ( = ?auto_851882 ?auto_851884 ) ) ( not ( = ?auto_851883 ?auto_851884 ) ) ( ON ?auto_851882 ?auto_851883 ) ( ON ?auto_851881 ?auto_851882 ) ( ON ?auto_851880 ?auto_851881 ) ( ON ?auto_851879 ?auto_851880 ) ( CLEAR ?auto_851877 ) ( ON ?auto_851878 ?auto_851879 ) ( CLEAR ?auto_851878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_851867 ?auto_851868 ?auto_851869 ?auto_851870 ?auto_851871 ?auto_851872 ?auto_851873 ?auto_851874 ?auto_851875 ?auto_851876 ?auto_851877 ?auto_851878 )
      ( MAKE-17PILE ?auto_851867 ?auto_851868 ?auto_851869 ?auto_851870 ?auto_851871 ?auto_851872 ?auto_851873 ?auto_851874 ?auto_851875 ?auto_851876 ?auto_851877 ?auto_851878 ?auto_851879 ?auto_851880 ?auto_851881 ?auto_851882 ?auto_851883 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_851937 - BLOCK
      ?auto_851938 - BLOCK
      ?auto_851939 - BLOCK
      ?auto_851940 - BLOCK
      ?auto_851941 - BLOCK
      ?auto_851942 - BLOCK
      ?auto_851943 - BLOCK
      ?auto_851944 - BLOCK
      ?auto_851945 - BLOCK
      ?auto_851946 - BLOCK
      ?auto_851947 - BLOCK
      ?auto_851948 - BLOCK
      ?auto_851949 - BLOCK
      ?auto_851950 - BLOCK
      ?auto_851951 - BLOCK
      ?auto_851952 - BLOCK
      ?auto_851953 - BLOCK
    )
    :vars
    (
      ?auto_851954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_851953 ?auto_851954 ) ( ON-TABLE ?auto_851937 ) ( ON ?auto_851938 ?auto_851937 ) ( ON ?auto_851939 ?auto_851938 ) ( ON ?auto_851940 ?auto_851939 ) ( ON ?auto_851941 ?auto_851940 ) ( ON ?auto_851942 ?auto_851941 ) ( ON ?auto_851943 ?auto_851942 ) ( ON ?auto_851944 ?auto_851943 ) ( ON ?auto_851945 ?auto_851944 ) ( ON ?auto_851946 ?auto_851945 ) ( not ( = ?auto_851937 ?auto_851938 ) ) ( not ( = ?auto_851937 ?auto_851939 ) ) ( not ( = ?auto_851937 ?auto_851940 ) ) ( not ( = ?auto_851937 ?auto_851941 ) ) ( not ( = ?auto_851937 ?auto_851942 ) ) ( not ( = ?auto_851937 ?auto_851943 ) ) ( not ( = ?auto_851937 ?auto_851944 ) ) ( not ( = ?auto_851937 ?auto_851945 ) ) ( not ( = ?auto_851937 ?auto_851946 ) ) ( not ( = ?auto_851937 ?auto_851947 ) ) ( not ( = ?auto_851937 ?auto_851948 ) ) ( not ( = ?auto_851937 ?auto_851949 ) ) ( not ( = ?auto_851937 ?auto_851950 ) ) ( not ( = ?auto_851937 ?auto_851951 ) ) ( not ( = ?auto_851937 ?auto_851952 ) ) ( not ( = ?auto_851937 ?auto_851953 ) ) ( not ( = ?auto_851937 ?auto_851954 ) ) ( not ( = ?auto_851938 ?auto_851939 ) ) ( not ( = ?auto_851938 ?auto_851940 ) ) ( not ( = ?auto_851938 ?auto_851941 ) ) ( not ( = ?auto_851938 ?auto_851942 ) ) ( not ( = ?auto_851938 ?auto_851943 ) ) ( not ( = ?auto_851938 ?auto_851944 ) ) ( not ( = ?auto_851938 ?auto_851945 ) ) ( not ( = ?auto_851938 ?auto_851946 ) ) ( not ( = ?auto_851938 ?auto_851947 ) ) ( not ( = ?auto_851938 ?auto_851948 ) ) ( not ( = ?auto_851938 ?auto_851949 ) ) ( not ( = ?auto_851938 ?auto_851950 ) ) ( not ( = ?auto_851938 ?auto_851951 ) ) ( not ( = ?auto_851938 ?auto_851952 ) ) ( not ( = ?auto_851938 ?auto_851953 ) ) ( not ( = ?auto_851938 ?auto_851954 ) ) ( not ( = ?auto_851939 ?auto_851940 ) ) ( not ( = ?auto_851939 ?auto_851941 ) ) ( not ( = ?auto_851939 ?auto_851942 ) ) ( not ( = ?auto_851939 ?auto_851943 ) ) ( not ( = ?auto_851939 ?auto_851944 ) ) ( not ( = ?auto_851939 ?auto_851945 ) ) ( not ( = ?auto_851939 ?auto_851946 ) ) ( not ( = ?auto_851939 ?auto_851947 ) ) ( not ( = ?auto_851939 ?auto_851948 ) ) ( not ( = ?auto_851939 ?auto_851949 ) ) ( not ( = ?auto_851939 ?auto_851950 ) ) ( not ( = ?auto_851939 ?auto_851951 ) ) ( not ( = ?auto_851939 ?auto_851952 ) ) ( not ( = ?auto_851939 ?auto_851953 ) ) ( not ( = ?auto_851939 ?auto_851954 ) ) ( not ( = ?auto_851940 ?auto_851941 ) ) ( not ( = ?auto_851940 ?auto_851942 ) ) ( not ( = ?auto_851940 ?auto_851943 ) ) ( not ( = ?auto_851940 ?auto_851944 ) ) ( not ( = ?auto_851940 ?auto_851945 ) ) ( not ( = ?auto_851940 ?auto_851946 ) ) ( not ( = ?auto_851940 ?auto_851947 ) ) ( not ( = ?auto_851940 ?auto_851948 ) ) ( not ( = ?auto_851940 ?auto_851949 ) ) ( not ( = ?auto_851940 ?auto_851950 ) ) ( not ( = ?auto_851940 ?auto_851951 ) ) ( not ( = ?auto_851940 ?auto_851952 ) ) ( not ( = ?auto_851940 ?auto_851953 ) ) ( not ( = ?auto_851940 ?auto_851954 ) ) ( not ( = ?auto_851941 ?auto_851942 ) ) ( not ( = ?auto_851941 ?auto_851943 ) ) ( not ( = ?auto_851941 ?auto_851944 ) ) ( not ( = ?auto_851941 ?auto_851945 ) ) ( not ( = ?auto_851941 ?auto_851946 ) ) ( not ( = ?auto_851941 ?auto_851947 ) ) ( not ( = ?auto_851941 ?auto_851948 ) ) ( not ( = ?auto_851941 ?auto_851949 ) ) ( not ( = ?auto_851941 ?auto_851950 ) ) ( not ( = ?auto_851941 ?auto_851951 ) ) ( not ( = ?auto_851941 ?auto_851952 ) ) ( not ( = ?auto_851941 ?auto_851953 ) ) ( not ( = ?auto_851941 ?auto_851954 ) ) ( not ( = ?auto_851942 ?auto_851943 ) ) ( not ( = ?auto_851942 ?auto_851944 ) ) ( not ( = ?auto_851942 ?auto_851945 ) ) ( not ( = ?auto_851942 ?auto_851946 ) ) ( not ( = ?auto_851942 ?auto_851947 ) ) ( not ( = ?auto_851942 ?auto_851948 ) ) ( not ( = ?auto_851942 ?auto_851949 ) ) ( not ( = ?auto_851942 ?auto_851950 ) ) ( not ( = ?auto_851942 ?auto_851951 ) ) ( not ( = ?auto_851942 ?auto_851952 ) ) ( not ( = ?auto_851942 ?auto_851953 ) ) ( not ( = ?auto_851942 ?auto_851954 ) ) ( not ( = ?auto_851943 ?auto_851944 ) ) ( not ( = ?auto_851943 ?auto_851945 ) ) ( not ( = ?auto_851943 ?auto_851946 ) ) ( not ( = ?auto_851943 ?auto_851947 ) ) ( not ( = ?auto_851943 ?auto_851948 ) ) ( not ( = ?auto_851943 ?auto_851949 ) ) ( not ( = ?auto_851943 ?auto_851950 ) ) ( not ( = ?auto_851943 ?auto_851951 ) ) ( not ( = ?auto_851943 ?auto_851952 ) ) ( not ( = ?auto_851943 ?auto_851953 ) ) ( not ( = ?auto_851943 ?auto_851954 ) ) ( not ( = ?auto_851944 ?auto_851945 ) ) ( not ( = ?auto_851944 ?auto_851946 ) ) ( not ( = ?auto_851944 ?auto_851947 ) ) ( not ( = ?auto_851944 ?auto_851948 ) ) ( not ( = ?auto_851944 ?auto_851949 ) ) ( not ( = ?auto_851944 ?auto_851950 ) ) ( not ( = ?auto_851944 ?auto_851951 ) ) ( not ( = ?auto_851944 ?auto_851952 ) ) ( not ( = ?auto_851944 ?auto_851953 ) ) ( not ( = ?auto_851944 ?auto_851954 ) ) ( not ( = ?auto_851945 ?auto_851946 ) ) ( not ( = ?auto_851945 ?auto_851947 ) ) ( not ( = ?auto_851945 ?auto_851948 ) ) ( not ( = ?auto_851945 ?auto_851949 ) ) ( not ( = ?auto_851945 ?auto_851950 ) ) ( not ( = ?auto_851945 ?auto_851951 ) ) ( not ( = ?auto_851945 ?auto_851952 ) ) ( not ( = ?auto_851945 ?auto_851953 ) ) ( not ( = ?auto_851945 ?auto_851954 ) ) ( not ( = ?auto_851946 ?auto_851947 ) ) ( not ( = ?auto_851946 ?auto_851948 ) ) ( not ( = ?auto_851946 ?auto_851949 ) ) ( not ( = ?auto_851946 ?auto_851950 ) ) ( not ( = ?auto_851946 ?auto_851951 ) ) ( not ( = ?auto_851946 ?auto_851952 ) ) ( not ( = ?auto_851946 ?auto_851953 ) ) ( not ( = ?auto_851946 ?auto_851954 ) ) ( not ( = ?auto_851947 ?auto_851948 ) ) ( not ( = ?auto_851947 ?auto_851949 ) ) ( not ( = ?auto_851947 ?auto_851950 ) ) ( not ( = ?auto_851947 ?auto_851951 ) ) ( not ( = ?auto_851947 ?auto_851952 ) ) ( not ( = ?auto_851947 ?auto_851953 ) ) ( not ( = ?auto_851947 ?auto_851954 ) ) ( not ( = ?auto_851948 ?auto_851949 ) ) ( not ( = ?auto_851948 ?auto_851950 ) ) ( not ( = ?auto_851948 ?auto_851951 ) ) ( not ( = ?auto_851948 ?auto_851952 ) ) ( not ( = ?auto_851948 ?auto_851953 ) ) ( not ( = ?auto_851948 ?auto_851954 ) ) ( not ( = ?auto_851949 ?auto_851950 ) ) ( not ( = ?auto_851949 ?auto_851951 ) ) ( not ( = ?auto_851949 ?auto_851952 ) ) ( not ( = ?auto_851949 ?auto_851953 ) ) ( not ( = ?auto_851949 ?auto_851954 ) ) ( not ( = ?auto_851950 ?auto_851951 ) ) ( not ( = ?auto_851950 ?auto_851952 ) ) ( not ( = ?auto_851950 ?auto_851953 ) ) ( not ( = ?auto_851950 ?auto_851954 ) ) ( not ( = ?auto_851951 ?auto_851952 ) ) ( not ( = ?auto_851951 ?auto_851953 ) ) ( not ( = ?auto_851951 ?auto_851954 ) ) ( not ( = ?auto_851952 ?auto_851953 ) ) ( not ( = ?auto_851952 ?auto_851954 ) ) ( not ( = ?auto_851953 ?auto_851954 ) ) ( ON ?auto_851952 ?auto_851953 ) ( ON ?auto_851951 ?auto_851952 ) ( ON ?auto_851950 ?auto_851951 ) ( ON ?auto_851949 ?auto_851950 ) ( ON ?auto_851948 ?auto_851949 ) ( CLEAR ?auto_851946 ) ( ON ?auto_851947 ?auto_851948 ) ( CLEAR ?auto_851947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_851937 ?auto_851938 ?auto_851939 ?auto_851940 ?auto_851941 ?auto_851942 ?auto_851943 ?auto_851944 ?auto_851945 ?auto_851946 ?auto_851947 )
      ( MAKE-17PILE ?auto_851937 ?auto_851938 ?auto_851939 ?auto_851940 ?auto_851941 ?auto_851942 ?auto_851943 ?auto_851944 ?auto_851945 ?auto_851946 ?auto_851947 ?auto_851948 ?auto_851949 ?auto_851950 ?auto_851951 ?auto_851952 ?auto_851953 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_852007 - BLOCK
      ?auto_852008 - BLOCK
      ?auto_852009 - BLOCK
      ?auto_852010 - BLOCK
      ?auto_852011 - BLOCK
      ?auto_852012 - BLOCK
      ?auto_852013 - BLOCK
      ?auto_852014 - BLOCK
      ?auto_852015 - BLOCK
      ?auto_852016 - BLOCK
      ?auto_852017 - BLOCK
      ?auto_852018 - BLOCK
      ?auto_852019 - BLOCK
      ?auto_852020 - BLOCK
      ?auto_852021 - BLOCK
      ?auto_852022 - BLOCK
      ?auto_852023 - BLOCK
    )
    :vars
    (
      ?auto_852024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_852023 ?auto_852024 ) ( ON-TABLE ?auto_852007 ) ( ON ?auto_852008 ?auto_852007 ) ( ON ?auto_852009 ?auto_852008 ) ( ON ?auto_852010 ?auto_852009 ) ( ON ?auto_852011 ?auto_852010 ) ( ON ?auto_852012 ?auto_852011 ) ( ON ?auto_852013 ?auto_852012 ) ( ON ?auto_852014 ?auto_852013 ) ( ON ?auto_852015 ?auto_852014 ) ( not ( = ?auto_852007 ?auto_852008 ) ) ( not ( = ?auto_852007 ?auto_852009 ) ) ( not ( = ?auto_852007 ?auto_852010 ) ) ( not ( = ?auto_852007 ?auto_852011 ) ) ( not ( = ?auto_852007 ?auto_852012 ) ) ( not ( = ?auto_852007 ?auto_852013 ) ) ( not ( = ?auto_852007 ?auto_852014 ) ) ( not ( = ?auto_852007 ?auto_852015 ) ) ( not ( = ?auto_852007 ?auto_852016 ) ) ( not ( = ?auto_852007 ?auto_852017 ) ) ( not ( = ?auto_852007 ?auto_852018 ) ) ( not ( = ?auto_852007 ?auto_852019 ) ) ( not ( = ?auto_852007 ?auto_852020 ) ) ( not ( = ?auto_852007 ?auto_852021 ) ) ( not ( = ?auto_852007 ?auto_852022 ) ) ( not ( = ?auto_852007 ?auto_852023 ) ) ( not ( = ?auto_852007 ?auto_852024 ) ) ( not ( = ?auto_852008 ?auto_852009 ) ) ( not ( = ?auto_852008 ?auto_852010 ) ) ( not ( = ?auto_852008 ?auto_852011 ) ) ( not ( = ?auto_852008 ?auto_852012 ) ) ( not ( = ?auto_852008 ?auto_852013 ) ) ( not ( = ?auto_852008 ?auto_852014 ) ) ( not ( = ?auto_852008 ?auto_852015 ) ) ( not ( = ?auto_852008 ?auto_852016 ) ) ( not ( = ?auto_852008 ?auto_852017 ) ) ( not ( = ?auto_852008 ?auto_852018 ) ) ( not ( = ?auto_852008 ?auto_852019 ) ) ( not ( = ?auto_852008 ?auto_852020 ) ) ( not ( = ?auto_852008 ?auto_852021 ) ) ( not ( = ?auto_852008 ?auto_852022 ) ) ( not ( = ?auto_852008 ?auto_852023 ) ) ( not ( = ?auto_852008 ?auto_852024 ) ) ( not ( = ?auto_852009 ?auto_852010 ) ) ( not ( = ?auto_852009 ?auto_852011 ) ) ( not ( = ?auto_852009 ?auto_852012 ) ) ( not ( = ?auto_852009 ?auto_852013 ) ) ( not ( = ?auto_852009 ?auto_852014 ) ) ( not ( = ?auto_852009 ?auto_852015 ) ) ( not ( = ?auto_852009 ?auto_852016 ) ) ( not ( = ?auto_852009 ?auto_852017 ) ) ( not ( = ?auto_852009 ?auto_852018 ) ) ( not ( = ?auto_852009 ?auto_852019 ) ) ( not ( = ?auto_852009 ?auto_852020 ) ) ( not ( = ?auto_852009 ?auto_852021 ) ) ( not ( = ?auto_852009 ?auto_852022 ) ) ( not ( = ?auto_852009 ?auto_852023 ) ) ( not ( = ?auto_852009 ?auto_852024 ) ) ( not ( = ?auto_852010 ?auto_852011 ) ) ( not ( = ?auto_852010 ?auto_852012 ) ) ( not ( = ?auto_852010 ?auto_852013 ) ) ( not ( = ?auto_852010 ?auto_852014 ) ) ( not ( = ?auto_852010 ?auto_852015 ) ) ( not ( = ?auto_852010 ?auto_852016 ) ) ( not ( = ?auto_852010 ?auto_852017 ) ) ( not ( = ?auto_852010 ?auto_852018 ) ) ( not ( = ?auto_852010 ?auto_852019 ) ) ( not ( = ?auto_852010 ?auto_852020 ) ) ( not ( = ?auto_852010 ?auto_852021 ) ) ( not ( = ?auto_852010 ?auto_852022 ) ) ( not ( = ?auto_852010 ?auto_852023 ) ) ( not ( = ?auto_852010 ?auto_852024 ) ) ( not ( = ?auto_852011 ?auto_852012 ) ) ( not ( = ?auto_852011 ?auto_852013 ) ) ( not ( = ?auto_852011 ?auto_852014 ) ) ( not ( = ?auto_852011 ?auto_852015 ) ) ( not ( = ?auto_852011 ?auto_852016 ) ) ( not ( = ?auto_852011 ?auto_852017 ) ) ( not ( = ?auto_852011 ?auto_852018 ) ) ( not ( = ?auto_852011 ?auto_852019 ) ) ( not ( = ?auto_852011 ?auto_852020 ) ) ( not ( = ?auto_852011 ?auto_852021 ) ) ( not ( = ?auto_852011 ?auto_852022 ) ) ( not ( = ?auto_852011 ?auto_852023 ) ) ( not ( = ?auto_852011 ?auto_852024 ) ) ( not ( = ?auto_852012 ?auto_852013 ) ) ( not ( = ?auto_852012 ?auto_852014 ) ) ( not ( = ?auto_852012 ?auto_852015 ) ) ( not ( = ?auto_852012 ?auto_852016 ) ) ( not ( = ?auto_852012 ?auto_852017 ) ) ( not ( = ?auto_852012 ?auto_852018 ) ) ( not ( = ?auto_852012 ?auto_852019 ) ) ( not ( = ?auto_852012 ?auto_852020 ) ) ( not ( = ?auto_852012 ?auto_852021 ) ) ( not ( = ?auto_852012 ?auto_852022 ) ) ( not ( = ?auto_852012 ?auto_852023 ) ) ( not ( = ?auto_852012 ?auto_852024 ) ) ( not ( = ?auto_852013 ?auto_852014 ) ) ( not ( = ?auto_852013 ?auto_852015 ) ) ( not ( = ?auto_852013 ?auto_852016 ) ) ( not ( = ?auto_852013 ?auto_852017 ) ) ( not ( = ?auto_852013 ?auto_852018 ) ) ( not ( = ?auto_852013 ?auto_852019 ) ) ( not ( = ?auto_852013 ?auto_852020 ) ) ( not ( = ?auto_852013 ?auto_852021 ) ) ( not ( = ?auto_852013 ?auto_852022 ) ) ( not ( = ?auto_852013 ?auto_852023 ) ) ( not ( = ?auto_852013 ?auto_852024 ) ) ( not ( = ?auto_852014 ?auto_852015 ) ) ( not ( = ?auto_852014 ?auto_852016 ) ) ( not ( = ?auto_852014 ?auto_852017 ) ) ( not ( = ?auto_852014 ?auto_852018 ) ) ( not ( = ?auto_852014 ?auto_852019 ) ) ( not ( = ?auto_852014 ?auto_852020 ) ) ( not ( = ?auto_852014 ?auto_852021 ) ) ( not ( = ?auto_852014 ?auto_852022 ) ) ( not ( = ?auto_852014 ?auto_852023 ) ) ( not ( = ?auto_852014 ?auto_852024 ) ) ( not ( = ?auto_852015 ?auto_852016 ) ) ( not ( = ?auto_852015 ?auto_852017 ) ) ( not ( = ?auto_852015 ?auto_852018 ) ) ( not ( = ?auto_852015 ?auto_852019 ) ) ( not ( = ?auto_852015 ?auto_852020 ) ) ( not ( = ?auto_852015 ?auto_852021 ) ) ( not ( = ?auto_852015 ?auto_852022 ) ) ( not ( = ?auto_852015 ?auto_852023 ) ) ( not ( = ?auto_852015 ?auto_852024 ) ) ( not ( = ?auto_852016 ?auto_852017 ) ) ( not ( = ?auto_852016 ?auto_852018 ) ) ( not ( = ?auto_852016 ?auto_852019 ) ) ( not ( = ?auto_852016 ?auto_852020 ) ) ( not ( = ?auto_852016 ?auto_852021 ) ) ( not ( = ?auto_852016 ?auto_852022 ) ) ( not ( = ?auto_852016 ?auto_852023 ) ) ( not ( = ?auto_852016 ?auto_852024 ) ) ( not ( = ?auto_852017 ?auto_852018 ) ) ( not ( = ?auto_852017 ?auto_852019 ) ) ( not ( = ?auto_852017 ?auto_852020 ) ) ( not ( = ?auto_852017 ?auto_852021 ) ) ( not ( = ?auto_852017 ?auto_852022 ) ) ( not ( = ?auto_852017 ?auto_852023 ) ) ( not ( = ?auto_852017 ?auto_852024 ) ) ( not ( = ?auto_852018 ?auto_852019 ) ) ( not ( = ?auto_852018 ?auto_852020 ) ) ( not ( = ?auto_852018 ?auto_852021 ) ) ( not ( = ?auto_852018 ?auto_852022 ) ) ( not ( = ?auto_852018 ?auto_852023 ) ) ( not ( = ?auto_852018 ?auto_852024 ) ) ( not ( = ?auto_852019 ?auto_852020 ) ) ( not ( = ?auto_852019 ?auto_852021 ) ) ( not ( = ?auto_852019 ?auto_852022 ) ) ( not ( = ?auto_852019 ?auto_852023 ) ) ( not ( = ?auto_852019 ?auto_852024 ) ) ( not ( = ?auto_852020 ?auto_852021 ) ) ( not ( = ?auto_852020 ?auto_852022 ) ) ( not ( = ?auto_852020 ?auto_852023 ) ) ( not ( = ?auto_852020 ?auto_852024 ) ) ( not ( = ?auto_852021 ?auto_852022 ) ) ( not ( = ?auto_852021 ?auto_852023 ) ) ( not ( = ?auto_852021 ?auto_852024 ) ) ( not ( = ?auto_852022 ?auto_852023 ) ) ( not ( = ?auto_852022 ?auto_852024 ) ) ( not ( = ?auto_852023 ?auto_852024 ) ) ( ON ?auto_852022 ?auto_852023 ) ( ON ?auto_852021 ?auto_852022 ) ( ON ?auto_852020 ?auto_852021 ) ( ON ?auto_852019 ?auto_852020 ) ( ON ?auto_852018 ?auto_852019 ) ( ON ?auto_852017 ?auto_852018 ) ( CLEAR ?auto_852015 ) ( ON ?auto_852016 ?auto_852017 ) ( CLEAR ?auto_852016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_852007 ?auto_852008 ?auto_852009 ?auto_852010 ?auto_852011 ?auto_852012 ?auto_852013 ?auto_852014 ?auto_852015 ?auto_852016 )
      ( MAKE-17PILE ?auto_852007 ?auto_852008 ?auto_852009 ?auto_852010 ?auto_852011 ?auto_852012 ?auto_852013 ?auto_852014 ?auto_852015 ?auto_852016 ?auto_852017 ?auto_852018 ?auto_852019 ?auto_852020 ?auto_852021 ?auto_852022 ?auto_852023 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_852077 - BLOCK
      ?auto_852078 - BLOCK
      ?auto_852079 - BLOCK
      ?auto_852080 - BLOCK
      ?auto_852081 - BLOCK
      ?auto_852082 - BLOCK
      ?auto_852083 - BLOCK
      ?auto_852084 - BLOCK
      ?auto_852085 - BLOCK
      ?auto_852086 - BLOCK
      ?auto_852087 - BLOCK
      ?auto_852088 - BLOCK
      ?auto_852089 - BLOCK
      ?auto_852090 - BLOCK
      ?auto_852091 - BLOCK
      ?auto_852092 - BLOCK
      ?auto_852093 - BLOCK
    )
    :vars
    (
      ?auto_852094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_852093 ?auto_852094 ) ( ON-TABLE ?auto_852077 ) ( ON ?auto_852078 ?auto_852077 ) ( ON ?auto_852079 ?auto_852078 ) ( ON ?auto_852080 ?auto_852079 ) ( ON ?auto_852081 ?auto_852080 ) ( ON ?auto_852082 ?auto_852081 ) ( ON ?auto_852083 ?auto_852082 ) ( ON ?auto_852084 ?auto_852083 ) ( not ( = ?auto_852077 ?auto_852078 ) ) ( not ( = ?auto_852077 ?auto_852079 ) ) ( not ( = ?auto_852077 ?auto_852080 ) ) ( not ( = ?auto_852077 ?auto_852081 ) ) ( not ( = ?auto_852077 ?auto_852082 ) ) ( not ( = ?auto_852077 ?auto_852083 ) ) ( not ( = ?auto_852077 ?auto_852084 ) ) ( not ( = ?auto_852077 ?auto_852085 ) ) ( not ( = ?auto_852077 ?auto_852086 ) ) ( not ( = ?auto_852077 ?auto_852087 ) ) ( not ( = ?auto_852077 ?auto_852088 ) ) ( not ( = ?auto_852077 ?auto_852089 ) ) ( not ( = ?auto_852077 ?auto_852090 ) ) ( not ( = ?auto_852077 ?auto_852091 ) ) ( not ( = ?auto_852077 ?auto_852092 ) ) ( not ( = ?auto_852077 ?auto_852093 ) ) ( not ( = ?auto_852077 ?auto_852094 ) ) ( not ( = ?auto_852078 ?auto_852079 ) ) ( not ( = ?auto_852078 ?auto_852080 ) ) ( not ( = ?auto_852078 ?auto_852081 ) ) ( not ( = ?auto_852078 ?auto_852082 ) ) ( not ( = ?auto_852078 ?auto_852083 ) ) ( not ( = ?auto_852078 ?auto_852084 ) ) ( not ( = ?auto_852078 ?auto_852085 ) ) ( not ( = ?auto_852078 ?auto_852086 ) ) ( not ( = ?auto_852078 ?auto_852087 ) ) ( not ( = ?auto_852078 ?auto_852088 ) ) ( not ( = ?auto_852078 ?auto_852089 ) ) ( not ( = ?auto_852078 ?auto_852090 ) ) ( not ( = ?auto_852078 ?auto_852091 ) ) ( not ( = ?auto_852078 ?auto_852092 ) ) ( not ( = ?auto_852078 ?auto_852093 ) ) ( not ( = ?auto_852078 ?auto_852094 ) ) ( not ( = ?auto_852079 ?auto_852080 ) ) ( not ( = ?auto_852079 ?auto_852081 ) ) ( not ( = ?auto_852079 ?auto_852082 ) ) ( not ( = ?auto_852079 ?auto_852083 ) ) ( not ( = ?auto_852079 ?auto_852084 ) ) ( not ( = ?auto_852079 ?auto_852085 ) ) ( not ( = ?auto_852079 ?auto_852086 ) ) ( not ( = ?auto_852079 ?auto_852087 ) ) ( not ( = ?auto_852079 ?auto_852088 ) ) ( not ( = ?auto_852079 ?auto_852089 ) ) ( not ( = ?auto_852079 ?auto_852090 ) ) ( not ( = ?auto_852079 ?auto_852091 ) ) ( not ( = ?auto_852079 ?auto_852092 ) ) ( not ( = ?auto_852079 ?auto_852093 ) ) ( not ( = ?auto_852079 ?auto_852094 ) ) ( not ( = ?auto_852080 ?auto_852081 ) ) ( not ( = ?auto_852080 ?auto_852082 ) ) ( not ( = ?auto_852080 ?auto_852083 ) ) ( not ( = ?auto_852080 ?auto_852084 ) ) ( not ( = ?auto_852080 ?auto_852085 ) ) ( not ( = ?auto_852080 ?auto_852086 ) ) ( not ( = ?auto_852080 ?auto_852087 ) ) ( not ( = ?auto_852080 ?auto_852088 ) ) ( not ( = ?auto_852080 ?auto_852089 ) ) ( not ( = ?auto_852080 ?auto_852090 ) ) ( not ( = ?auto_852080 ?auto_852091 ) ) ( not ( = ?auto_852080 ?auto_852092 ) ) ( not ( = ?auto_852080 ?auto_852093 ) ) ( not ( = ?auto_852080 ?auto_852094 ) ) ( not ( = ?auto_852081 ?auto_852082 ) ) ( not ( = ?auto_852081 ?auto_852083 ) ) ( not ( = ?auto_852081 ?auto_852084 ) ) ( not ( = ?auto_852081 ?auto_852085 ) ) ( not ( = ?auto_852081 ?auto_852086 ) ) ( not ( = ?auto_852081 ?auto_852087 ) ) ( not ( = ?auto_852081 ?auto_852088 ) ) ( not ( = ?auto_852081 ?auto_852089 ) ) ( not ( = ?auto_852081 ?auto_852090 ) ) ( not ( = ?auto_852081 ?auto_852091 ) ) ( not ( = ?auto_852081 ?auto_852092 ) ) ( not ( = ?auto_852081 ?auto_852093 ) ) ( not ( = ?auto_852081 ?auto_852094 ) ) ( not ( = ?auto_852082 ?auto_852083 ) ) ( not ( = ?auto_852082 ?auto_852084 ) ) ( not ( = ?auto_852082 ?auto_852085 ) ) ( not ( = ?auto_852082 ?auto_852086 ) ) ( not ( = ?auto_852082 ?auto_852087 ) ) ( not ( = ?auto_852082 ?auto_852088 ) ) ( not ( = ?auto_852082 ?auto_852089 ) ) ( not ( = ?auto_852082 ?auto_852090 ) ) ( not ( = ?auto_852082 ?auto_852091 ) ) ( not ( = ?auto_852082 ?auto_852092 ) ) ( not ( = ?auto_852082 ?auto_852093 ) ) ( not ( = ?auto_852082 ?auto_852094 ) ) ( not ( = ?auto_852083 ?auto_852084 ) ) ( not ( = ?auto_852083 ?auto_852085 ) ) ( not ( = ?auto_852083 ?auto_852086 ) ) ( not ( = ?auto_852083 ?auto_852087 ) ) ( not ( = ?auto_852083 ?auto_852088 ) ) ( not ( = ?auto_852083 ?auto_852089 ) ) ( not ( = ?auto_852083 ?auto_852090 ) ) ( not ( = ?auto_852083 ?auto_852091 ) ) ( not ( = ?auto_852083 ?auto_852092 ) ) ( not ( = ?auto_852083 ?auto_852093 ) ) ( not ( = ?auto_852083 ?auto_852094 ) ) ( not ( = ?auto_852084 ?auto_852085 ) ) ( not ( = ?auto_852084 ?auto_852086 ) ) ( not ( = ?auto_852084 ?auto_852087 ) ) ( not ( = ?auto_852084 ?auto_852088 ) ) ( not ( = ?auto_852084 ?auto_852089 ) ) ( not ( = ?auto_852084 ?auto_852090 ) ) ( not ( = ?auto_852084 ?auto_852091 ) ) ( not ( = ?auto_852084 ?auto_852092 ) ) ( not ( = ?auto_852084 ?auto_852093 ) ) ( not ( = ?auto_852084 ?auto_852094 ) ) ( not ( = ?auto_852085 ?auto_852086 ) ) ( not ( = ?auto_852085 ?auto_852087 ) ) ( not ( = ?auto_852085 ?auto_852088 ) ) ( not ( = ?auto_852085 ?auto_852089 ) ) ( not ( = ?auto_852085 ?auto_852090 ) ) ( not ( = ?auto_852085 ?auto_852091 ) ) ( not ( = ?auto_852085 ?auto_852092 ) ) ( not ( = ?auto_852085 ?auto_852093 ) ) ( not ( = ?auto_852085 ?auto_852094 ) ) ( not ( = ?auto_852086 ?auto_852087 ) ) ( not ( = ?auto_852086 ?auto_852088 ) ) ( not ( = ?auto_852086 ?auto_852089 ) ) ( not ( = ?auto_852086 ?auto_852090 ) ) ( not ( = ?auto_852086 ?auto_852091 ) ) ( not ( = ?auto_852086 ?auto_852092 ) ) ( not ( = ?auto_852086 ?auto_852093 ) ) ( not ( = ?auto_852086 ?auto_852094 ) ) ( not ( = ?auto_852087 ?auto_852088 ) ) ( not ( = ?auto_852087 ?auto_852089 ) ) ( not ( = ?auto_852087 ?auto_852090 ) ) ( not ( = ?auto_852087 ?auto_852091 ) ) ( not ( = ?auto_852087 ?auto_852092 ) ) ( not ( = ?auto_852087 ?auto_852093 ) ) ( not ( = ?auto_852087 ?auto_852094 ) ) ( not ( = ?auto_852088 ?auto_852089 ) ) ( not ( = ?auto_852088 ?auto_852090 ) ) ( not ( = ?auto_852088 ?auto_852091 ) ) ( not ( = ?auto_852088 ?auto_852092 ) ) ( not ( = ?auto_852088 ?auto_852093 ) ) ( not ( = ?auto_852088 ?auto_852094 ) ) ( not ( = ?auto_852089 ?auto_852090 ) ) ( not ( = ?auto_852089 ?auto_852091 ) ) ( not ( = ?auto_852089 ?auto_852092 ) ) ( not ( = ?auto_852089 ?auto_852093 ) ) ( not ( = ?auto_852089 ?auto_852094 ) ) ( not ( = ?auto_852090 ?auto_852091 ) ) ( not ( = ?auto_852090 ?auto_852092 ) ) ( not ( = ?auto_852090 ?auto_852093 ) ) ( not ( = ?auto_852090 ?auto_852094 ) ) ( not ( = ?auto_852091 ?auto_852092 ) ) ( not ( = ?auto_852091 ?auto_852093 ) ) ( not ( = ?auto_852091 ?auto_852094 ) ) ( not ( = ?auto_852092 ?auto_852093 ) ) ( not ( = ?auto_852092 ?auto_852094 ) ) ( not ( = ?auto_852093 ?auto_852094 ) ) ( ON ?auto_852092 ?auto_852093 ) ( ON ?auto_852091 ?auto_852092 ) ( ON ?auto_852090 ?auto_852091 ) ( ON ?auto_852089 ?auto_852090 ) ( ON ?auto_852088 ?auto_852089 ) ( ON ?auto_852087 ?auto_852088 ) ( ON ?auto_852086 ?auto_852087 ) ( CLEAR ?auto_852084 ) ( ON ?auto_852085 ?auto_852086 ) ( CLEAR ?auto_852085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_852077 ?auto_852078 ?auto_852079 ?auto_852080 ?auto_852081 ?auto_852082 ?auto_852083 ?auto_852084 ?auto_852085 )
      ( MAKE-17PILE ?auto_852077 ?auto_852078 ?auto_852079 ?auto_852080 ?auto_852081 ?auto_852082 ?auto_852083 ?auto_852084 ?auto_852085 ?auto_852086 ?auto_852087 ?auto_852088 ?auto_852089 ?auto_852090 ?auto_852091 ?auto_852092 ?auto_852093 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_852147 - BLOCK
      ?auto_852148 - BLOCK
      ?auto_852149 - BLOCK
      ?auto_852150 - BLOCK
      ?auto_852151 - BLOCK
      ?auto_852152 - BLOCK
      ?auto_852153 - BLOCK
      ?auto_852154 - BLOCK
      ?auto_852155 - BLOCK
      ?auto_852156 - BLOCK
      ?auto_852157 - BLOCK
      ?auto_852158 - BLOCK
      ?auto_852159 - BLOCK
      ?auto_852160 - BLOCK
      ?auto_852161 - BLOCK
      ?auto_852162 - BLOCK
      ?auto_852163 - BLOCK
    )
    :vars
    (
      ?auto_852164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_852163 ?auto_852164 ) ( ON-TABLE ?auto_852147 ) ( ON ?auto_852148 ?auto_852147 ) ( ON ?auto_852149 ?auto_852148 ) ( ON ?auto_852150 ?auto_852149 ) ( ON ?auto_852151 ?auto_852150 ) ( ON ?auto_852152 ?auto_852151 ) ( ON ?auto_852153 ?auto_852152 ) ( not ( = ?auto_852147 ?auto_852148 ) ) ( not ( = ?auto_852147 ?auto_852149 ) ) ( not ( = ?auto_852147 ?auto_852150 ) ) ( not ( = ?auto_852147 ?auto_852151 ) ) ( not ( = ?auto_852147 ?auto_852152 ) ) ( not ( = ?auto_852147 ?auto_852153 ) ) ( not ( = ?auto_852147 ?auto_852154 ) ) ( not ( = ?auto_852147 ?auto_852155 ) ) ( not ( = ?auto_852147 ?auto_852156 ) ) ( not ( = ?auto_852147 ?auto_852157 ) ) ( not ( = ?auto_852147 ?auto_852158 ) ) ( not ( = ?auto_852147 ?auto_852159 ) ) ( not ( = ?auto_852147 ?auto_852160 ) ) ( not ( = ?auto_852147 ?auto_852161 ) ) ( not ( = ?auto_852147 ?auto_852162 ) ) ( not ( = ?auto_852147 ?auto_852163 ) ) ( not ( = ?auto_852147 ?auto_852164 ) ) ( not ( = ?auto_852148 ?auto_852149 ) ) ( not ( = ?auto_852148 ?auto_852150 ) ) ( not ( = ?auto_852148 ?auto_852151 ) ) ( not ( = ?auto_852148 ?auto_852152 ) ) ( not ( = ?auto_852148 ?auto_852153 ) ) ( not ( = ?auto_852148 ?auto_852154 ) ) ( not ( = ?auto_852148 ?auto_852155 ) ) ( not ( = ?auto_852148 ?auto_852156 ) ) ( not ( = ?auto_852148 ?auto_852157 ) ) ( not ( = ?auto_852148 ?auto_852158 ) ) ( not ( = ?auto_852148 ?auto_852159 ) ) ( not ( = ?auto_852148 ?auto_852160 ) ) ( not ( = ?auto_852148 ?auto_852161 ) ) ( not ( = ?auto_852148 ?auto_852162 ) ) ( not ( = ?auto_852148 ?auto_852163 ) ) ( not ( = ?auto_852148 ?auto_852164 ) ) ( not ( = ?auto_852149 ?auto_852150 ) ) ( not ( = ?auto_852149 ?auto_852151 ) ) ( not ( = ?auto_852149 ?auto_852152 ) ) ( not ( = ?auto_852149 ?auto_852153 ) ) ( not ( = ?auto_852149 ?auto_852154 ) ) ( not ( = ?auto_852149 ?auto_852155 ) ) ( not ( = ?auto_852149 ?auto_852156 ) ) ( not ( = ?auto_852149 ?auto_852157 ) ) ( not ( = ?auto_852149 ?auto_852158 ) ) ( not ( = ?auto_852149 ?auto_852159 ) ) ( not ( = ?auto_852149 ?auto_852160 ) ) ( not ( = ?auto_852149 ?auto_852161 ) ) ( not ( = ?auto_852149 ?auto_852162 ) ) ( not ( = ?auto_852149 ?auto_852163 ) ) ( not ( = ?auto_852149 ?auto_852164 ) ) ( not ( = ?auto_852150 ?auto_852151 ) ) ( not ( = ?auto_852150 ?auto_852152 ) ) ( not ( = ?auto_852150 ?auto_852153 ) ) ( not ( = ?auto_852150 ?auto_852154 ) ) ( not ( = ?auto_852150 ?auto_852155 ) ) ( not ( = ?auto_852150 ?auto_852156 ) ) ( not ( = ?auto_852150 ?auto_852157 ) ) ( not ( = ?auto_852150 ?auto_852158 ) ) ( not ( = ?auto_852150 ?auto_852159 ) ) ( not ( = ?auto_852150 ?auto_852160 ) ) ( not ( = ?auto_852150 ?auto_852161 ) ) ( not ( = ?auto_852150 ?auto_852162 ) ) ( not ( = ?auto_852150 ?auto_852163 ) ) ( not ( = ?auto_852150 ?auto_852164 ) ) ( not ( = ?auto_852151 ?auto_852152 ) ) ( not ( = ?auto_852151 ?auto_852153 ) ) ( not ( = ?auto_852151 ?auto_852154 ) ) ( not ( = ?auto_852151 ?auto_852155 ) ) ( not ( = ?auto_852151 ?auto_852156 ) ) ( not ( = ?auto_852151 ?auto_852157 ) ) ( not ( = ?auto_852151 ?auto_852158 ) ) ( not ( = ?auto_852151 ?auto_852159 ) ) ( not ( = ?auto_852151 ?auto_852160 ) ) ( not ( = ?auto_852151 ?auto_852161 ) ) ( not ( = ?auto_852151 ?auto_852162 ) ) ( not ( = ?auto_852151 ?auto_852163 ) ) ( not ( = ?auto_852151 ?auto_852164 ) ) ( not ( = ?auto_852152 ?auto_852153 ) ) ( not ( = ?auto_852152 ?auto_852154 ) ) ( not ( = ?auto_852152 ?auto_852155 ) ) ( not ( = ?auto_852152 ?auto_852156 ) ) ( not ( = ?auto_852152 ?auto_852157 ) ) ( not ( = ?auto_852152 ?auto_852158 ) ) ( not ( = ?auto_852152 ?auto_852159 ) ) ( not ( = ?auto_852152 ?auto_852160 ) ) ( not ( = ?auto_852152 ?auto_852161 ) ) ( not ( = ?auto_852152 ?auto_852162 ) ) ( not ( = ?auto_852152 ?auto_852163 ) ) ( not ( = ?auto_852152 ?auto_852164 ) ) ( not ( = ?auto_852153 ?auto_852154 ) ) ( not ( = ?auto_852153 ?auto_852155 ) ) ( not ( = ?auto_852153 ?auto_852156 ) ) ( not ( = ?auto_852153 ?auto_852157 ) ) ( not ( = ?auto_852153 ?auto_852158 ) ) ( not ( = ?auto_852153 ?auto_852159 ) ) ( not ( = ?auto_852153 ?auto_852160 ) ) ( not ( = ?auto_852153 ?auto_852161 ) ) ( not ( = ?auto_852153 ?auto_852162 ) ) ( not ( = ?auto_852153 ?auto_852163 ) ) ( not ( = ?auto_852153 ?auto_852164 ) ) ( not ( = ?auto_852154 ?auto_852155 ) ) ( not ( = ?auto_852154 ?auto_852156 ) ) ( not ( = ?auto_852154 ?auto_852157 ) ) ( not ( = ?auto_852154 ?auto_852158 ) ) ( not ( = ?auto_852154 ?auto_852159 ) ) ( not ( = ?auto_852154 ?auto_852160 ) ) ( not ( = ?auto_852154 ?auto_852161 ) ) ( not ( = ?auto_852154 ?auto_852162 ) ) ( not ( = ?auto_852154 ?auto_852163 ) ) ( not ( = ?auto_852154 ?auto_852164 ) ) ( not ( = ?auto_852155 ?auto_852156 ) ) ( not ( = ?auto_852155 ?auto_852157 ) ) ( not ( = ?auto_852155 ?auto_852158 ) ) ( not ( = ?auto_852155 ?auto_852159 ) ) ( not ( = ?auto_852155 ?auto_852160 ) ) ( not ( = ?auto_852155 ?auto_852161 ) ) ( not ( = ?auto_852155 ?auto_852162 ) ) ( not ( = ?auto_852155 ?auto_852163 ) ) ( not ( = ?auto_852155 ?auto_852164 ) ) ( not ( = ?auto_852156 ?auto_852157 ) ) ( not ( = ?auto_852156 ?auto_852158 ) ) ( not ( = ?auto_852156 ?auto_852159 ) ) ( not ( = ?auto_852156 ?auto_852160 ) ) ( not ( = ?auto_852156 ?auto_852161 ) ) ( not ( = ?auto_852156 ?auto_852162 ) ) ( not ( = ?auto_852156 ?auto_852163 ) ) ( not ( = ?auto_852156 ?auto_852164 ) ) ( not ( = ?auto_852157 ?auto_852158 ) ) ( not ( = ?auto_852157 ?auto_852159 ) ) ( not ( = ?auto_852157 ?auto_852160 ) ) ( not ( = ?auto_852157 ?auto_852161 ) ) ( not ( = ?auto_852157 ?auto_852162 ) ) ( not ( = ?auto_852157 ?auto_852163 ) ) ( not ( = ?auto_852157 ?auto_852164 ) ) ( not ( = ?auto_852158 ?auto_852159 ) ) ( not ( = ?auto_852158 ?auto_852160 ) ) ( not ( = ?auto_852158 ?auto_852161 ) ) ( not ( = ?auto_852158 ?auto_852162 ) ) ( not ( = ?auto_852158 ?auto_852163 ) ) ( not ( = ?auto_852158 ?auto_852164 ) ) ( not ( = ?auto_852159 ?auto_852160 ) ) ( not ( = ?auto_852159 ?auto_852161 ) ) ( not ( = ?auto_852159 ?auto_852162 ) ) ( not ( = ?auto_852159 ?auto_852163 ) ) ( not ( = ?auto_852159 ?auto_852164 ) ) ( not ( = ?auto_852160 ?auto_852161 ) ) ( not ( = ?auto_852160 ?auto_852162 ) ) ( not ( = ?auto_852160 ?auto_852163 ) ) ( not ( = ?auto_852160 ?auto_852164 ) ) ( not ( = ?auto_852161 ?auto_852162 ) ) ( not ( = ?auto_852161 ?auto_852163 ) ) ( not ( = ?auto_852161 ?auto_852164 ) ) ( not ( = ?auto_852162 ?auto_852163 ) ) ( not ( = ?auto_852162 ?auto_852164 ) ) ( not ( = ?auto_852163 ?auto_852164 ) ) ( ON ?auto_852162 ?auto_852163 ) ( ON ?auto_852161 ?auto_852162 ) ( ON ?auto_852160 ?auto_852161 ) ( ON ?auto_852159 ?auto_852160 ) ( ON ?auto_852158 ?auto_852159 ) ( ON ?auto_852157 ?auto_852158 ) ( ON ?auto_852156 ?auto_852157 ) ( ON ?auto_852155 ?auto_852156 ) ( CLEAR ?auto_852153 ) ( ON ?auto_852154 ?auto_852155 ) ( CLEAR ?auto_852154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_852147 ?auto_852148 ?auto_852149 ?auto_852150 ?auto_852151 ?auto_852152 ?auto_852153 ?auto_852154 )
      ( MAKE-17PILE ?auto_852147 ?auto_852148 ?auto_852149 ?auto_852150 ?auto_852151 ?auto_852152 ?auto_852153 ?auto_852154 ?auto_852155 ?auto_852156 ?auto_852157 ?auto_852158 ?auto_852159 ?auto_852160 ?auto_852161 ?auto_852162 ?auto_852163 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_852217 - BLOCK
      ?auto_852218 - BLOCK
      ?auto_852219 - BLOCK
      ?auto_852220 - BLOCK
      ?auto_852221 - BLOCK
      ?auto_852222 - BLOCK
      ?auto_852223 - BLOCK
      ?auto_852224 - BLOCK
      ?auto_852225 - BLOCK
      ?auto_852226 - BLOCK
      ?auto_852227 - BLOCK
      ?auto_852228 - BLOCK
      ?auto_852229 - BLOCK
      ?auto_852230 - BLOCK
      ?auto_852231 - BLOCK
      ?auto_852232 - BLOCK
      ?auto_852233 - BLOCK
    )
    :vars
    (
      ?auto_852234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_852233 ?auto_852234 ) ( ON-TABLE ?auto_852217 ) ( ON ?auto_852218 ?auto_852217 ) ( ON ?auto_852219 ?auto_852218 ) ( ON ?auto_852220 ?auto_852219 ) ( ON ?auto_852221 ?auto_852220 ) ( ON ?auto_852222 ?auto_852221 ) ( not ( = ?auto_852217 ?auto_852218 ) ) ( not ( = ?auto_852217 ?auto_852219 ) ) ( not ( = ?auto_852217 ?auto_852220 ) ) ( not ( = ?auto_852217 ?auto_852221 ) ) ( not ( = ?auto_852217 ?auto_852222 ) ) ( not ( = ?auto_852217 ?auto_852223 ) ) ( not ( = ?auto_852217 ?auto_852224 ) ) ( not ( = ?auto_852217 ?auto_852225 ) ) ( not ( = ?auto_852217 ?auto_852226 ) ) ( not ( = ?auto_852217 ?auto_852227 ) ) ( not ( = ?auto_852217 ?auto_852228 ) ) ( not ( = ?auto_852217 ?auto_852229 ) ) ( not ( = ?auto_852217 ?auto_852230 ) ) ( not ( = ?auto_852217 ?auto_852231 ) ) ( not ( = ?auto_852217 ?auto_852232 ) ) ( not ( = ?auto_852217 ?auto_852233 ) ) ( not ( = ?auto_852217 ?auto_852234 ) ) ( not ( = ?auto_852218 ?auto_852219 ) ) ( not ( = ?auto_852218 ?auto_852220 ) ) ( not ( = ?auto_852218 ?auto_852221 ) ) ( not ( = ?auto_852218 ?auto_852222 ) ) ( not ( = ?auto_852218 ?auto_852223 ) ) ( not ( = ?auto_852218 ?auto_852224 ) ) ( not ( = ?auto_852218 ?auto_852225 ) ) ( not ( = ?auto_852218 ?auto_852226 ) ) ( not ( = ?auto_852218 ?auto_852227 ) ) ( not ( = ?auto_852218 ?auto_852228 ) ) ( not ( = ?auto_852218 ?auto_852229 ) ) ( not ( = ?auto_852218 ?auto_852230 ) ) ( not ( = ?auto_852218 ?auto_852231 ) ) ( not ( = ?auto_852218 ?auto_852232 ) ) ( not ( = ?auto_852218 ?auto_852233 ) ) ( not ( = ?auto_852218 ?auto_852234 ) ) ( not ( = ?auto_852219 ?auto_852220 ) ) ( not ( = ?auto_852219 ?auto_852221 ) ) ( not ( = ?auto_852219 ?auto_852222 ) ) ( not ( = ?auto_852219 ?auto_852223 ) ) ( not ( = ?auto_852219 ?auto_852224 ) ) ( not ( = ?auto_852219 ?auto_852225 ) ) ( not ( = ?auto_852219 ?auto_852226 ) ) ( not ( = ?auto_852219 ?auto_852227 ) ) ( not ( = ?auto_852219 ?auto_852228 ) ) ( not ( = ?auto_852219 ?auto_852229 ) ) ( not ( = ?auto_852219 ?auto_852230 ) ) ( not ( = ?auto_852219 ?auto_852231 ) ) ( not ( = ?auto_852219 ?auto_852232 ) ) ( not ( = ?auto_852219 ?auto_852233 ) ) ( not ( = ?auto_852219 ?auto_852234 ) ) ( not ( = ?auto_852220 ?auto_852221 ) ) ( not ( = ?auto_852220 ?auto_852222 ) ) ( not ( = ?auto_852220 ?auto_852223 ) ) ( not ( = ?auto_852220 ?auto_852224 ) ) ( not ( = ?auto_852220 ?auto_852225 ) ) ( not ( = ?auto_852220 ?auto_852226 ) ) ( not ( = ?auto_852220 ?auto_852227 ) ) ( not ( = ?auto_852220 ?auto_852228 ) ) ( not ( = ?auto_852220 ?auto_852229 ) ) ( not ( = ?auto_852220 ?auto_852230 ) ) ( not ( = ?auto_852220 ?auto_852231 ) ) ( not ( = ?auto_852220 ?auto_852232 ) ) ( not ( = ?auto_852220 ?auto_852233 ) ) ( not ( = ?auto_852220 ?auto_852234 ) ) ( not ( = ?auto_852221 ?auto_852222 ) ) ( not ( = ?auto_852221 ?auto_852223 ) ) ( not ( = ?auto_852221 ?auto_852224 ) ) ( not ( = ?auto_852221 ?auto_852225 ) ) ( not ( = ?auto_852221 ?auto_852226 ) ) ( not ( = ?auto_852221 ?auto_852227 ) ) ( not ( = ?auto_852221 ?auto_852228 ) ) ( not ( = ?auto_852221 ?auto_852229 ) ) ( not ( = ?auto_852221 ?auto_852230 ) ) ( not ( = ?auto_852221 ?auto_852231 ) ) ( not ( = ?auto_852221 ?auto_852232 ) ) ( not ( = ?auto_852221 ?auto_852233 ) ) ( not ( = ?auto_852221 ?auto_852234 ) ) ( not ( = ?auto_852222 ?auto_852223 ) ) ( not ( = ?auto_852222 ?auto_852224 ) ) ( not ( = ?auto_852222 ?auto_852225 ) ) ( not ( = ?auto_852222 ?auto_852226 ) ) ( not ( = ?auto_852222 ?auto_852227 ) ) ( not ( = ?auto_852222 ?auto_852228 ) ) ( not ( = ?auto_852222 ?auto_852229 ) ) ( not ( = ?auto_852222 ?auto_852230 ) ) ( not ( = ?auto_852222 ?auto_852231 ) ) ( not ( = ?auto_852222 ?auto_852232 ) ) ( not ( = ?auto_852222 ?auto_852233 ) ) ( not ( = ?auto_852222 ?auto_852234 ) ) ( not ( = ?auto_852223 ?auto_852224 ) ) ( not ( = ?auto_852223 ?auto_852225 ) ) ( not ( = ?auto_852223 ?auto_852226 ) ) ( not ( = ?auto_852223 ?auto_852227 ) ) ( not ( = ?auto_852223 ?auto_852228 ) ) ( not ( = ?auto_852223 ?auto_852229 ) ) ( not ( = ?auto_852223 ?auto_852230 ) ) ( not ( = ?auto_852223 ?auto_852231 ) ) ( not ( = ?auto_852223 ?auto_852232 ) ) ( not ( = ?auto_852223 ?auto_852233 ) ) ( not ( = ?auto_852223 ?auto_852234 ) ) ( not ( = ?auto_852224 ?auto_852225 ) ) ( not ( = ?auto_852224 ?auto_852226 ) ) ( not ( = ?auto_852224 ?auto_852227 ) ) ( not ( = ?auto_852224 ?auto_852228 ) ) ( not ( = ?auto_852224 ?auto_852229 ) ) ( not ( = ?auto_852224 ?auto_852230 ) ) ( not ( = ?auto_852224 ?auto_852231 ) ) ( not ( = ?auto_852224 ?auto_852232 ) ) ( not ( = ?auto_852224 ?auto_852233 ) ) ( not ( = ?auto_852224 ?auto_852234 ) ) ( not ( = ?auto_852225 ?auto_852226 ) ) ( not ( = ?auto_852225 ?auto_852227 ) ) ( not ( = ?auto_852225 ?auto_852228 ) ) ( not ( = ?auto_852225 ?auto_852229 ) ) ( not ( = ?auto_852225 ?auto_852230 ) ) ( not ( = ?auto_852225 ?auto_852231 ) ) ( not ( = ?auto_852225 ?auto_852232 ) ) ( not ( = ?auto_852225 ?auto_852233 ) ) ( not ( = ?auto_852225 ?auto_852234 ) ) ( not ( = ?auto_852226 ?auto_852227 ) ) ( not ( = ?auto_852226 ?auto_852228 ) ) ( not ( = ?auto_852226 ?auto_852229 ) ) ( not ( = ?auto_852226 ?auto_852230 ) ) ( not ( = ?auto_852226 ?auto_852231 ) ) ( not ( = ?auto_852226 ?auto_852232 ) ) ( not ( = ?auto_852226 ?auto_852233 ) ) ( not ( = ?auto_852226 ?auto_852234 ) ) ( not ( = ?auto_852227 ?auto_852228 ) ) ( not ( = ?auto_852227 ?auto_852229 ) ) ( not ( = ?auto_852227 ?auto_852230 ) ) ( not ( = ?auto_852227 ?auto_852231 ) ) ( not ( = ?auto_852227 ?auto_852232 ) ) ( not ( = ?auto_852227 ?auto_852233 ) ) ( not ( = ?auto_852227 ?auto_852234 ) ) ( not ( = ?auto_852228 ?auto_852229 ) ) ( not ( = ?auto_852228 ?auto_852230 ) ) ( not ( = ?auto_852228 ?auto_852231 ) ) ( not ( = ?auto_852228 ?auto_852232 ) ) ( not ( = ?auto_852228 ?auto_852233 ) ) ( not ( = ?auto_852228 ?auto_852234 ) ) ( not ( = ?auto_852229 ?auto_852230 ) ) ( not ( = ?auto_852229 ?auto_852231 ) ) ( not ( = ?auto_852229 ?auto_852232 ) ) ( not ( = ?auto_852229 ?auto_852233 ) ) ( not ( = ?auto_852229 ?auto_852234 ) ) ( not ( = ?auto_852230 ?auto_852231 ) ) ( not ( = ?auto_852230 ?auto_852232 ) ) ( not ( = ?auto_852230 ?auto_852233 ) ) ( not ( = ?auto_852230 ?auto_852234 ) ) ( not ( = ?auto_852231 ?auto_852232 ) ) ( not ( = ?auto_852231 ?auto_852233 ) ) ( not ( = ?auto_852231 ?auto_852234 ) ) ( not ( = ?auto_852232 ?auto_852233 ) ) ( not ( = ?auto_852232 ?auto_852234 ) ) ( not ( = ?auto_852233 ?auto_852234 ) ) ( ON ?auto_852232 ?auto_852233 ) ( ON ?auto_852231 ?auto_852232 ) ( ON ?auto_852230 ?auto_852231 ) ( ON ?auto_852229 ?auto_852230 ) ( ON ?auto_852228 ?auto_852229 ) ( ON ?auto_852227 ?auto_852228 ) ( ON ?auto_852226 ?auto_852227 ) ( ON ?auto_852225 ?auto_852226 ) ( ON ?auto_852224 ?auto_852225 ) ( CLEAR ?auto_852222 ) ( ON ?auto_852223 ?auto_852224 ) ( CLEAR ?auto_852223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_852217 ?auto_852218 ?auto_852219 ?auto_852220 ?auto_852221 ?auto_852222 ?auto_852223 )
      ( MAKE-17PILE ?auto_852217 ?auto_852218 ?auto_852219 ?auto_852220 ?auto_852221 ?auto_852222 ?auto_852223 ?auto_852224 ?auto_852225 ?auto_852226 ?auto_852227 ?auto_852228 ?auto_852229 ?auto_852230 ?auto_852231 ?auto_852232 ?auto_852233 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_852287 - BLOCK
      ?auto_852288 - BLOCK
      ?auto_852289 - BLOCK
      ?auto_852290 - BLOCK
      ?auto_852291 - BLOCK
      ?auto_852292 - BLOCK
      ?auto_852293 - BLOCK
      ?auto_852294 - BLOCK
      ?auto_852295 - BLOCK
      ?auto_852296 - BLOCK
      ?auto_852297 - BLOCK
      ?auto_852298 - BLOCK
      ?auto_852299 - BLOCK
      ?auto_852300 - BLOCK
      ?auto_852301 - BLOCK
      ?auto_852302 - BLOCK
      ?auto_852303 - BLOCK
    )
    :vars
    (
      ?auto_852304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_852303 ?auto_852304 ) ( ON-TABLE ?auto_852287 ) ( ON ?auto_852288 ?auto_852287 ) ( ON ?auto_852289 ?auto_852288 ) ( ON ?auto_852290 ?auto_852289 ) ( ON ?auto_852291 ?auto_852290 ) ( not ( = ?auto_852287 ?auto_852288 ) ) ( not ( = ?auto_852287 ?auto_852289 ) ) ( not ( = ?auto_852287 ?auto_852290 ) ) ( not ( = ?auto_852287 ?auto_852291 ) ) ( not ( = ?auto_852287 ?auto_852292 ) ) ( not ( = ?auto_852287 ?auto_852293 ) ) ( not ( = ?auto_852287 ?auto_852294 ) ) ( not ( = ?auto_852287 ?auto_852295 ) ) ( not ( = ?auto_852287 ?auto_852296 ) ) ( not ( = ?auto_852287 ?auto_852297 ) ) ( not ( = ?auto_852287 ?auto_852298 ) ) ( not ( = ?auto_852287 ?auto_852299 ) ) ( not ( = ?auto_852287 ?auto_852300 ) ) ( not ( = ?auto_852287 ?auto_852301 ) ) ( not ( = ?auto_852287 ?auto_852302 ) ) ( not ( = ?auto_852287 ?auto_852303 ) ) ( not ( = ?auto_852287 ?auto_852304 ) ) ( not ( = ?auto_852288 ?auto_852289 ) ) ( not ( = ?auto_852288 ?auto_852290 ) ) ( not ( = ?auto_852288 ?auto_852291 ) ) ( not ( = ?auto_852288 ?auto_852292 ) ) ( not ( = ?auto_852288 ?auto_852293 ) ) ( not ( = ?auto_852288 ?auto_852294 ) ) ( not ( = ?auto_852288 ?auto_852295 ) ) ( not ( = ?auto_852288 ?auto_852296 ) ) ( not ( = ?auto_852288 ?auto_852297 ) ) ( not ( = ?auto_852288 ?auto_852298 ) ) ( not ( = ?auto_852288 ?auto_852299 ) ) ( not ( = ?auto_852288 ?auto_852300 ) ) ( not ( = ?auto_852288 ?auto_852301 ) ) ( not ( = ?auto_852288 ?auto_852302 ) ) ( not ( = ?auto_852288 ?auto_852303 ) ) ( not ( = ?auto_852288 ?auto_852304 ) ) ( not ( = ?auto_852289 ?auto_852290 ) ) ( not ( = ?auto_852289 ?auto_852291 ) ) ( not ( = ?auto_852289 ?auto_852292 ) ) ( not ( = ?auto_852289 ?auto_852293 ) ) ( not ( = ?auto_852289 ?auto_852294 ) ) ( not ( = ?auto_852289 ?auto_852295 ) ) ( not ( = ?auto_852289 ?auto_852296 ) ) ( not ( = ?auto_852289 ?auto_852297 ) ) ( not ( = ?auto_852289 ?auto_852298 ) ) ( not ( = ?auto_852289 ?auto_852299 ) ) ( not ( = ?auto_852289 ?auto_852300 ) ) ( not ( = ?auto_852289 ?auto_852301 ) ) ( not ( = ?auto_852289 ?auto_852302 ) ) ( not ( = ?auto_852289 ?auto_852303 ) ) ( not ( = ?auto_852289 ?auto_852304 ) ) ( not ( = ?auto_852290 ?auto_852291 ) ) ( not ( = ?auto_852290 ?auto_852292 ) ) ( not ( = ?auto_852290 ?auto_852293 ) ) ( not ( = ?auto_852290 ?auto_852294 ) ) ( not ( = ?auto_852290 ?auto_852295 ) ) ( not ( = ?auto_852290 ?auto_852296 ) ) ( not ( = ?auto_852290 ?auto_852297 ) ) ( not ( = ?auto_852290 ?auto_852298 ) ) ( not ( = ?auto_852290 ?auto_852299 ) ) ( not ( = ?auto_852290 ?auto_852300 ) ) ( not ( = ?auto_852290 ?auto_852301 ) ) ( not ( = ?auto_852290 ?auto_852302 ) ) ( not ( = ?auto_852290 ?auto_852303 ) ) ( not ( = ?auto_852290 ?auto_852304 ) ) ( not ( = ?auto_852291 ?auto_852292 ) ) ( not ( = ?auto_852291 ?auto_852293 ) ) ( not ( = ?auto_852291 ?auto_852294 ) ) ( not ( = ?auto_852291 ?auto_852295 ) ) ( not ( = ?auto_852291 ?auto_852296 ) ) ( not ( = ?auto_852291 ?auto_852297 ) ) ( not ( = ?auto_852291 ?auto_852298 ) ) ( not ( = ?auto_852291 ?auto_852299 ) ) ( not ( = ?auto_852291 ?auto_852300 ) ) ( not ( = ?auto_852291 ?auto_852301 ) ) ( not ( = ?auto_852291 ?auto_852302 ) ) ( not ( = ?auto_852291 ?auto_852303 ) ) ( not ( = ?auto_852291 ?auto_852304 ) ) ( not ( = ?auto_852292 ?auto_852293 ) ) ( not ( = ?auto_852292 ?auto_852294 ) ) ( not ( = ?auto_852292 ?auto_852295 ) ) ( not ( = ?auto_852292 ?auto_852296 ) ) ( not ( = ?auto_852292 ?auto_852297 ) ) ( not ( = ?auto_852292 ?auto_852298 ) ) ( not ( = ?auto_852292 ?auto_852299 ) ) ( not ( = ?auto_852292 ?auto_852300 ) ) ( not ( = ?auto_852292 ?auto_852301 ) ) ( not ( = ?auto_852292 ?auto_852302 ) ) ( not ( = ?auto_852292 ?auto_852303 ) ) ( not ( = ?auto_852292 ?auto_852304 ) ) ( not ( = ?auto_852293 ?auto_852294 ) ) ( not ( = ?auto_852293 ?auto_852295 ) ) ( not ( = ?auto_852293 ?auto_852296 ) ) ( not ( = ?auto_852293 ?auto_852297 ) ) ( not ( = ?auto_852293 ?auto_852298 ) ) ( not ( = ?auto_852293 ?auto_852299 ) ) ( not ( = ?auto_852293 ?auto_852300 ) ) ( not ( = ?auto_852293 ?auto_852301 ) ) ( not ( = ?auto_852293 ?auto_852302 ) ) ( not ( = ?auto_852293 ?auto_852303 ) ) ( not ( = ?auto_852293 ?auto_852304 ) ) ( not ( = ?auto_852294 ?auto_852295 ) ) ( not ( = ?auto_852294 ?auto_852296 ) ) ( not ( = ?auto_852294 ?auto_852297 ) ) ( not ( = ?auto_852294 ?auto_852298 ) ) ( not ( = ?auto_852294 ?auto_852299 ) ) ( not ( = ?auto_852294 ?auto_852300 ) ) ( not ( = ?auto_852294 ?auto_852301 ) ) ( not ( = ?auto_852294 ?auto_852302 ) ) ( not ( = ?auto_852294 ?auto_852303 ) ) ( not ( = ?auto_852294 ?auto_852304 ) ) ( not ( = ?auto_852295 ?auto_852296 ) ) ( not ( = ?auto_852295 ?auto_852297 ) ) ( not ( = ?auto_852295 ?auto_852298 ) ) ( not ( = ?auto_852295 ?auto_852299 ) ) ( not ( = ?auto_852295 ?auto_852300 ) ) ( not ( = ?auto_852295 ?auto_852301 ) ) ( not ( = ?auto_852295 ?auto_852302 ) ) ( not ( = ?auto_852295 ?auto_852303 ) ) ( not ( = ?auto_852295 ?auto_852304 ) ) ( not ( = ?auto_852296 ?auto_852297 ) ) ( not ( = ?auto_852296 ?auto_852298 ) ) ( not ( = ?auto_852296 ?auto_852299 ) ) ( not ( = ?auto_852296 ?auto_852300 ) ) ( not ( = ?auto_852296 ?auto_852301 ) ) ( not ( = ?auto_852296 ?auto_852302 ) ) ( not ( = ?auto_852296 ?auto_852303 ) ) ( not ( = ?auto_852296 ?auto_852304 ) ) ( not ( = ?auto_852297 ?auto_852298 ) ) ( not ( = ?auto_852297 ?auto_852299 ) ) ( not ( = ?auto_852297 ?auto_852300 ) ) ( not ( = ?auto_852297 ?auto_852301 ) ) ( not ( = ?auto_852297 ?auto_852302 ) ) ( not ( = ?auto_852297 ?auto_852303 ) ) ( not ( = ?auto_852297 ?auto_852304 ) ) ( not ( = ?auto_852298 ?auto_852299 ) ) ( not ( = ?auto_852298 ?auto_852300 ) ) ( not ( = ?auto_852298 ?auto_852301 ) ) ( not ( = ?auto_852298 ?auto_852302 ) ) ( not ( = ?auto_852298 ?auto_852303 ) ) ( not ( = ?auto_852298 ?auto_852304 ) ) ( not ( = ?auto_852299 ?auto_852300 ) ) ( not ( = ?auto_852299 ?auto_852301 ) ) ( not ( = ?auto_852299 ?auto_852302 ) ) ( not ( = ?auto_852299 ?auto_852303 ) ) ( not ( = ?auto_852299 ?auto_852304 ) ) ( not ( = ?auto_852300 ?auto_852301 ) ) ( not ( = ?auto_852300 ?auto_852302 ) ) ( not ( = ?auto_852300 ?auto_852303 ) ) ( not ( = ?auto_852300 ?auto_852304 ) ) ( not ( = ?auto_852301 ?auto_852302 ) ) ( not ( = ?auto_852301 ?auto_852303 ) ) ( not ( = ?auto_852301 ?auto_852304 ) ) ( not ( = ?auto_852302 ?auto_852303 ) ) ( not ( = ?auto_852302 ?auto_852304 ) ) ( not ( = ?auto_852303 ?auto_852304 ) ) ( ON ?auto_852302 ?auto_852303 ) ( ON ?auto_852301 ?auto_852302 ) ( ON ?auto_852300 ?auto_852301 ) ( ON ?auto_852299 ?auto_852300 ) ( ON ?auto_852298 ?auto_852299 ) ( ON ?auto_852297 ?auto_852298 ) ( ON ?auto_852296 ?auto_852297 ) ( ON ?auto_852295 ?auto_852296 ) ( ON ?auto_852294 ?auto_852295 ) ( ON ?auto_852293 ?auto_852294 ) ( CLEAR ?auto_852291 ) ( ON ?auto_852292 ?auto_852293 ) ( CLEAR ?auto_852292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_852287 ?auto_852288 ?auto_852289 ?auto_852290 ?auto_852291 ?auto_852292 )
      ( MAKE-17PILE ?auto_852287 ?auto_852288 ?auto_852289 ?auto_852290 ?auto_852291 ?auto_852292 ?auto_852293 ?auto_852294 ?auto_852295 ?auto_852296 ?auto_852297 ?auto_852298 ?auto_852299 ?auto_852300 ?auto_852301 ?auto_852302 ?auto_852303 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_852357 - BLOCK
      ?auto_852358 - BLOCK
      ?auto_852359 - BLOCK
      ?auto_852360 - BLOCK
      ?auto_852361 - BLOCK
      ?auto_852362 - BLOCK
      ?auto_852363 - BLOCK
      ?auto_852364 - BLOCK
      ?auto_852365 - BLOCK
      ?auto_852366 - BLOCK
      ?auto_852367 - BLOCK
      ?auto_852368 - BLOCK
      ?auto_852369 - BLOCK
      ?auto_852370 - BLOCK
      ?auto_852371 - BLOCK
      ?auto_852372 - BLOCK
      ?auto_852373 - BLOCK
    )
    :vars
    (
      ?auto_852374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_852373 ?auto_852374 ) ( ON-TABLE ?auto_852357 ) ( ON ?auto_852358 ?auto_852357 ) ( ON ?auto_852359 ?auto_852358 ) ( ON ?auto_852360 ?auto_852359 ) ( not ( = ?auto_852357 ?auto_852358 ) ) ( not ( = ?auto_852357 ?auto_852359 ) ) ( not ( = ?auto_852357 ?auto_852360 ) ) ( not ( = ?auto_852357 ?auto_852361 ) ) ( not ( = ?auto_852357 ?auto_852362 ) ) ( not ( = ?auto_852357 ?auto_852363 ) ) ( not ( = ?auto_852357 ?auto_852364 ) ) ( not ( = ?auto_852357 ?auto_852365 ) ) ( not ( = ?auto_852357 ?auto_852366 ) ) ( not ( = ?auto_852357 ?auto_852367 ) ) ( not ( = ?auto_852357 ?auto_852368 ) ) ( not ( = ?auto_852357 ?auto_852369 ) ) ( not ( = ?auto_852357 ?auto_852370 ) ) ( not ( = ?auto_852357 ?auto_852371 ) ) ( not ( = ?auto_852357 ?auto_852372 ) ) ( not ( = ?auto_852357 ?auto_852373 ) ) ( not ( = ?auto_852357 ?auto_852374 ) ) ( not ( = ?auto_852358 ?auto_852359 ) ) ( not ( = ?auto_852358 ?auto_852360 ) ) ( not ( = ?auto_852358 ?auto_852361 ) ) ( not ( = ?auto_852358 ?auto_852362 ) ) ( not ( = ?auto_852358 ?auto_852363 ) ) ( not ( = ?auto_852358 ?auto_852364 ) ) ( not ( = ?auto_852358 ?auto_852365 ) ) ( not ( = ?auto_852358 ?auto_852366 ) ) ( not ( = ?auto_852358 ?auto_852367 ) ) ( not ( = ?auto_852358 ?auto_852368 ) ) ( not ( = ?auto_852358 ?auto_852369 ) ) ( not ( = ?auto_852358 ?auto_852370 ) ) ( not ( = ?auto_852358 ?auto_852371 ) ) ( not ( = ?auto_852358 ?auto_852372 ) ) ( not ( = ?auto_852358 ?auto_852373 ) ) ( not ( = ?auto_852358 ?auto_852374 ) ) ( not ( = ?auto_852359 ?auto_852360 ) ) ( not ( = ?auto_852359 ?auto_852361 ) ) ( not ( = ?auto_852359 ?auto_852362 ) ) ( not ( = ?auto_852359 ?auto_852363 ) ) ( not ( = ?auto_852359 ?auto_852364 ) ) ( not ( = ?auto_852359 ?auto_852365 ) ) ( not ( = ?auto_852359 ?auto_852366 ) ) ( not ( = ?auto_852359 ?auto_852367 ) ) ( not ( = ?auto_852359 ?auto_852368 ) ) ( not ( = ?auto_852359 ?auto_852369 ) ) ( not ( = ?auto_852359 ?auto_852370 ) ) ( not ( = ?auto_852359 ?auto_852371 ) ) ( not ( = ?auto_852359 ?auto_852372 ) ) ( not ( = ?auto_852359 ?auto_852373 ) ) ( not ( = ?auto_852359 ?auto_852374 ) ) ( not ( = ?auto_852360 ?auto_852361 ) ) ( not ( = ?auto_852360 ?auto_852362 ) ) ( not ( = ?auto_852360 ?auto_852363 ) ) ( not ( = ?auto_852360 ?auto_852364 ) ) ( not ( = ?auto_852360 ?auto_852365 ) ) ( not ( = ?auto_852360 ?auto_852366 ) ) ( not ( = ?auto_852360 ?auto_852367 ) ) ( not ( = ?auto_852360 ?auto_852368 ) ) ( not ( = ?auto_852360 ?auto_852369 ) ) ( not ( = ?auto_852360 ?auto_852370 ) ) ( not ( = ?auto_852360 ?auto_852371 ) ) ( not ( = ?auto_852360 ?auto_852372 ) ) ( not ( = ?auto_852360 ?auto_852373 ) ) ( not ( = ?auto_852360 ?auto_852374 ) ) ( not ( = ?auto_852361 ?auto_852362 ) ) ( not ( = ?auto_852361 ?auto_852363 ) ) ( not ( = ?auto_852361 ?auto_852364 ) ) ( not ( = ?auto_852361 ?auto_852365 ) ) ( not ( = ?auto_852361 ?auto_852366 ) ) ( not ( = ?auto_852361 ?auto_852367 ) ) ( not ( = ?auto_852361 ?auto_852368 ) ) ( not ( = ?auto_852361 ?auto_852369 ) ) ( not ( = ?auto_852361 ?auto_852370 ) ) ( not ( = ?auto_852361 ?auto_852371 ) ) ( not ( = ?auto_852361 ?auto_852372 ) ) ( not ( = ?auto_852361 ?auto_852373 ) ) ( not ( = ?auto_852361 ?auto_852374 ) ) ( not ( = ?auto_852362 ?auto_852363 ) ) ( not ( = ?auto_852362 ?auto_852364 ) ) ( not ( = ?auto_852362 ?auto_852365 ) ) ( not ( = ?auto_852362 ?auto_852366 ) ) ( not ( = ?auto_852362 ?auto_852367 ) ) ( not ( = ?auto_852362 ?auto_852368 ) ) ( not ( = ?auto_852362 ?auto_852369 ) ) ( not ( = ?auto_852362 ?auto_852370 ) ) ( not ( = ?auto_852362 ?auto_852371 ) ) ( not ( = ?auto_852362 ?auto_852372 ) ) ( not ( = ?auto_852362 ?auto_852373 ) ) ( not ( = ?auto_852362 ?auto_852374 ) ) ( not ( = ?auto_852363 ?auto_852364 ) ) ( not ( = ?auto_852363 ?auto_852365 ) ) ( not ( = ?auto_852363 ?auto_852366 ) ) ( not ( = ?auto_852363 ?auto_852367 ) ) ( not ( = ?auto_852363 ?auto_852368 ) ) ( not ( = ?auto_852363 ?auto_852369 ) ) ( not ( = ?auto_852363 ?auto_852370 ) ) ( not ( = ?auto_852363 ?auto_852371 ) ) ( not ( = ?auto_852363 ?auto_852372 ) ) ( not ( = ?auto_852363 ?auto_852373 ) ) ( not ( = ?auto_852363 ?auto_852374 ) ) ( not ( = ?auto_852364 ?auto_852365 ) ) ( not ( = ?auto_852364 ?auto_852366 ) ) ( not ( = ?auto_852364 ?auto_852367 ) ) ( not ( = ?auto_852364 ?auto_852368 ) ) ( not ( = ?auto_852364 ?auto_852369 ) ) ( not ( = ?auto_852364 ?auto_852370 ) ) ( not ( = ?auto_852364 ?auto_852371 ) ) ( not ( = ?auto_852364 ?auto_852372 ) ) ( not ( = ?auto_852364 ?auto_852373 ) ) ( not ( = ?auto_852364 ?auto_852374 ) ) ( not ( = ?auto_852365 ?auto_852366 ) ) ( not ( = ?auto_852365 ?auto_852367 ) ) ( not ( = ?auto_852365 ?auto_852368 ) ) ( not ( = ?auto_852365 ?auto_852369 ) ) ( not ( = ?auto_852365 ?auto_852370 ) ) ( not ( = ?auto_852365 ?auto_852371 ) ) ( not ( = ?auto_852365 ?auto_852372 ) ) ( not ( = ?auto_852365 ?auto_852373 ) ) ( not ( = ?auto_852365 ?auto_852374 ) ) ( not ( = ?auto_852366 ?auto_852367 ) ) ( not ( = ?auto_852366 ?auto_852368 ) ) ( not ( = ?auto_852366 ?auto_852369 ) ) ( not ( = ?auto_852366 ?auto_852370 ) ) ( not ( = ?auto_852366 ?auto_852371 ) ) ( not ( = ?auto_852366 ?auto_852372 ) ) ( not ( = ?auto_852366 ?auto_852373 ) ) ( not ( = ?auto_852366 ?auto_852374 ) ) ( not ( = ?auto_852367 ?auto_852368 ) ) ( not ( = ?auto_852367 ?auto_852369 ) ) ( not ( = ?auto_852367 ?auto_852370 ) ) ( not ( = ?auto_852367 ?auto_852371 ) ) ( not ( = ?auto_852367 ?auto_852372 ) ) ( not ( = ?auto_852367 ?auto_852373 ) ) ( not ( = ?auto_852367 ?auto_852374 ) ) ( not ( = ?auto_852368 ?auto_852369 ) ) ( not ( = ?auto_852368 ?auto_852370 ) ) ( not ( = ?auto_852368 ?auto_852371 ) ) ( not ( = ?auto_852368 ?auto_852372 ) ) ( not ( = ?auto_852368 ?auto_852373 ) ) ( not ( = ?auto_852368 ?auto_852374 ) ) ( not ( = ?auto_852369 ?auto_852370 ) ) ( not ( = ?auto_852369 ?auto_852371 ) ) ( not ( = ?auto_852369 ?auto_852372 ) ) ( not ( = ?auto_852369 ?auto_852373 ) ) ( not ( = ?auto_852369 ?auto_852374 ) ) ( not ( = ?auto_852370 ?auto_852371 ) ) ( not ( = ?auto_852370 ?auto_852372 ) ) ( not ( = ?auto_852370 ?auto_852373 ) ) ( not ( = ?auto_852370 ?auto_852374 ) ) ( not ( = ?auto_852371 ?auto_852372 ) ) ( not ( = ?auto_852371 ?auto_852373 ) ) ( not ( = ?auto_852371 ?auto_852374 ) ) ( not ( = ?auto_852372 ?auto_852373 ) ) ( not ( = ?auto_852372 ?auto_852374 ) ) ( not ( = ?auto_852373 ?auto_852374 ) ) ( ON ?auto_852372 ?auto_852373 ) ( ON ?auto_852371 ?auto_852372 ) ( ON ?auto_852370 ?auto_852371 ) ( ON ?auto_852369 ?auto_852370 ) ( ON ?auto_852368 ?auto_852369 ) ( ON ?auto_852367 ?auto_852368 ) ( ON ?auto_852366 ?auto_852367 ) ( ON ?auto_852365 ?auto_852366 ) ( ON ?auto_852364 ?auto_852365 ) ( ON ?auto_852363 ?auto_852364 ) ( ON ?auto_852362 ?auto_852363 ) ( CLEAR ?auto_852360 ) ( ON ?auto_852361 ?auto_852362 ) ( CLEAR ?auto_852361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_852357 ?auto_852358 ?auto_852359 ?auto_852360 ?auto_852361 )
      ( MAKE-17PILE ?auto_852357 ?auto_852358 ?auto_852359 ?auto_852360 ?auto_852361 ?auto_852362 ?auto_852363 ?auto_852364 ?auto_852365 ?auto_852366 ?auto_852367 ?auto_852368 ?auto_852369 ?auto_852370 ?auto_852371 ?auto_852372 ?auto_852373 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_852427 - BLOCK
      ?auto_852428 - BLOCK
      ?auto_852429 - BLOCK
      ?auto_852430 - BLOCK
      ?auto_852431 - BLOCK
      ?auto_852432 - BLOCK
      ?auto_852433 - BLOCK
      ?auto_852434 - BLOCK
      ?auto_852435 - BLOCK
      ?auto_852436 - BLOCK
      ?auto_852437 - BLOCK
      ?auto_852438 - BLOCK
      ?auto_852439 - BLOCK
      ?auto_852440 - BLOCK
      ?auto_852441 - BLOCK
      ?auto_852442 - BLOCK
      ?auto_852443 - BLOCK
    )
    :vars
    (
      ?auto_852444 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_852443 ?auto_852444 ) ( ON-TABLE ?auto_852427 ) ( ON ?auto_852428 ?auto_852427 ) ( ON ?auto_852429 ?auto_852428 ) ( not ( = ?auto_852427 ?auto_852428 ) ) ( not ( = ?auto_852427 ?auto_852429 ) ) ( not ( = ?auto_852427 ?auto_852430 ) ) ( not ( = ?auto_852427 ?auto_852431 ) ) ( not ( = ?auto_852427 ?auto_852432 ) ) ( not ( = ?auto_852427 ?auto_852433 ) ) ( not ( = ?auto_852427 ?auto_852434 ) ) ( not ( = ?auto_852427 ?auto_852435 ) ) ( not ( = ?auto_852427 ?auto_852436 ) ) ( not ( = ?auto_852427 ?auto_852437 ) ) ( not ( = ?auto_852427 ?auto_852438 ) ) ( not ( = ?auto_852427 ?auto_852439 ) ) ( not ( = ?auto_852427 ?auto_852440 ) ) ( not ( = ?auto_852427 ?auto_852441 ) ) ( not ( = ?auto_852427 ?auto_852442 ) ) ( not ( = ?auto_852427 ?auto_852443 ) ) ( not ( = ?auto_852427 ?auto_852444 ) ) ( not ( = ?auto_852428 ?auto_852429 ) ) ( not ( = ?auto_852428 ?auto_852430 ) ) ( not ( = ?auto_852428 ?auto_852431 ) ) ( not ( = ?auto_852428 ?auto_852432 ) ) ( not ( = ?auto_852428 ?auto_852433 ) ) ( not ( = ?auto_852428 ?auto_852434 ) ) ( not ( = ?auto_852428 ?auto_852435 ) ) ( not ( = ?auto_852428 ?auto_852436 ) ) ( not ( = ?auto_852428 ?auto_852437 ) ) ( not ( = ?auto_852428 ?auto_852438 ) ) ( not ( = ?auto_852428 ?auto_852439 ) ) ( not ( = ?auto_852428 ?auto_852440 ) ) ( not ( = ?auto_852428 ?auto_852441 ) ) ( not ( = ?auto_852428 ?auto_852442 ) ) ( not ( = ?auto_852428 ?auto_852443 ) ) ( not ( = ?auto_852428 ?auto_852444 ) ) ( not ( = ?auto_852429 ?auto_852430 ) ) ( not ( = ?auto_852429 ?auto_852431 ) ) ( not ( = ?auto_852429 ?auto_852432 ) ) ( not ( = ?auto_852429 ?auto_852433 ) ) ( not ( = ?auto_852429 ?auto_852434 ) ) ( not ( = ?auto_852429 ?auto_852435 ) ) ( not ( = ?auto_852429 ?auto_852436 ) ) ( not ( = ?auto_852429 ?auto_852437 ) ) ( not ( = ?auto_852429 ?auto_852438 ) ) ( not ( = ?auto_852429 ?auto_852439 ) ) ( not ( = ?auto_852429 ?auto_852440 ) ) ( not ( = ?auto_852429 ?auto_852441 ) ) ( not ( = ?auto_852429 ?auto_852442 ) ) ( not ( = ?auto_852429 ?auto_852443 ) ) ( not ( = ?auto_852429 ?auto_852444 ) ) ( not ( = ?auto_852430 ?auto_852431 ) ) ( not ( = ?auto_852430 ?auto_852432 ) ) ( not ( = ?auto_852430 ?auto_852433 ) ) ( not ( = ?auto_852430 ?auto_852434 ) ) ( not ( = ?auto_852430 ?auto_852435 ) ) ( not ( = ?auto_852430 ?auto_852436 ) ) ( not ( = ?auto_852430 ?auto_852437 ) ) ( not ( = ?auto_852430 ?auto_852438 ) ) ( not ( = ?auto_852430 ?auto_852439 ) ) ( not ( = ?auto_852430 ?auto_852440 ) ) ( not ( = ?auto_852430 ?auto_852441 ) ) ( not ( = ?auto_852430 ?auto_852442 ) ) ( not ( = ?auto_852430 ?auto_852443 ) ) ( not ( = ?auto_852430 ?auto_852444 ) ) ( not ( = ?auto_852431 ?auto_852432 ) ) ( not ( = ?auto_852431 ?auto_852433 ) ) ( not ( = ?auto_852431 ?auto_852434 ) ) ( not ( = ?auto_852431 ?auto_852435 ) ) ( not ( = ?auto_852431 ?auto_852436 ) ) ( not ( = ?auto_852431 ?auto_852437 ) ) ( not ( = ?auto_852431 ?auto_852438 ) ) ( not ( = ?auto_852431 ?auto_852439 ) ) ( not ( = ?auto_852431 ?auto_852440 ) ) ( not ( = ?auto_852431 ?auto_852441 ) ) ( not ( = ?auto_852431 ?auto_852442 ) ) ( not ( = ?auto_852431 ?auto_852443 ) ) ( not ( = ?auto_852431 ?auto_852444 ) ) ( not ( = ?auto_852432 ?auto_852433 ) ) ( not ( = ?auto_852432 ?auto_852434 ) ) ( not ( = ?auto_852432 ?auto_852435 ) ) ( not ( = ?auto_852432 ?auto_852436 ) ) ( not ( = ?auto_852432 ?auto_852437 ) ) ( not ( = ?auto_852432 ?auto_852438 ) ) ( not ( = ?auto_852432 ?auto_852439 ) ) ( not ( = ?auto_852432 ?auto_852440 ) ) ( not ( = ?auto_852432 ?auto_852441 ) ) ( not ( = ?auto_852432 ?auto_852442 ) ) ( not ( = ?auto_852432 ?auto_852443 ) ) ( not ( = ?auto_852432 ?auto_852444 ) ) ( not ( = ?auto_852433 ?auto_852434 ) ) ( not ( = ?auto_852433 ?auto_852435 ) ) ( not ( = ?auto_852433 ?auto_852436 ) ) ( not ( = ?auto_852433 ?auto_852437 ) ) ( not ( = ?auto_852433 ?auto_852438 ) ) ( not ( = ?auto_852433 ?auto_852439 ) ) ( not ( = ?auto_852433 ?auto_852440 ) ) ( not ( = ?auto_852433 ?auto_852441 ) ) ( not ( = ?auto_852433 ?auto_852442 ) ) ( not ( = ?auto_852433 ?auto_852443 ) ) ( not ( = ?auto_852433 ?auto_852444 ) ) ( not ( = ?auto_852434 ?auto_852435 ) ) ( not ( = ?auto_852434 ?auto_852436 ) ) ( not ( = ?auto_852434 ?auto_852437 ) ) ( not ( = ?auto_852434 ?auto_852438 ) ) ( not ( = ?auto_852434 ?auto_852439 ) ) ( not ( = ?auto_852434 ?auto_852440 ) ) ( not ( = ?auto_852434 ?auto_852441 ) ) ( not ( = ?auto_852434 ?auto_852442 ) ) ( not ( = ?auto_852434 ?auto_852443 ) ) ( not ( = ?auto_852434 ?auto_852444 ) ) ( not ( = ?auto_852435 ?auto_852436 ) ) ( not ( = ?auto_852435 ?auto_852437 ) ) ( not ( = ?auto_852435 ?auto_852438 ) ) ( not ( = ?auto_852435 ?auto_852439 ) ) ( not ( = ?auto_852435 ?auto_852440 ) ) ( not ( = ?auto_852435 ?auto_852441 ) ) ( not ( = ?auto_852435 ?auto_852442 ) ) ( not ( = ?auto_852435 ?auto_852443 ) ) ( not ( = ?auto_852435 ?auto_852444 ) ) ( not ( = ?auto_852436 ?auto_852437 ) ) ( not ( = ?auto_852436 ?auto_852438 ) ) ( not ( = ?auto_852436 ?auto_852439 ) ) ( not ( = ?auto_852436 ?auto_852440 ) ) ( not ( = ?auto_852436 ?auto_852441 ) ) ( not ( = ?auto_852436 ?auto_852442 ) ) ( not ( = ?auto_852436 ?auto_852443 ) ) ( not ( = ?auto_852436 ?auto_852444 ) ) ( not ( = ?auto_852437 ?auto_852438 ) ) ( not ( = ?auto_852437 ?auto_852439 ) ) ( not ( = ?auto_852437 ?auto_852440 ) ) ( not ( = ?auto_852437 ?auto_852441 ) ) ( not ( = ?auto_852437 ?auto_852442 ) ) ( not ( = ?auto_852437 ?auto_852443 ) ) ( not ( = ?auto_852437 ?auto_852444 ) ) ( not ( = ?auto_852438 ?auto_852439 ) ) ( not ( = ?auto_852438 ?auto_852440 ) ) ( not ( = ?auto_852438 ?auto_852441 ) ) ( not ( = ?auto_852438 ?auto_852442 ) ) ( not ( = ?auto_852438 ?auto_852443 ) ) ( not ( = ?auto_852438 ?auto_852444 ) ) ( not ( = ?auto_852439 ?auto_852440 ) ) ( not ( = ?auto_852439 ?auto_852441 ) ) ( not ( = ?auto_852439 ?auto_852442 ) ) ( not ( = ?auto_852439 ?auto_852443 ) ) ( not ( = ?auto_852439 ?auto_852444 ) ) ( not ( = ?auto_852440 ?auto_852441 ) ) ( not ( = ?auto_852440 ?auto_852442 ) ) ( not ( = ?auto_852440 ?auto_852443 ) ) ( not ( = ?auto_852440 ?auto_852444 ) ) ( not ( = ?auto_852441 ?auto_852442 ) ) ( not ( = ?auto_852441 ?auto_852443 ) ) ( not ( = ?auto_852441 ?auto_852444 ) ) ( not ( = ?auto_852442 ?auto_852443 ) ) ( not ( = ?auto_852442 ?auto_852444 ) ) ( not ( = ?auto_852443 ?auto_852444 ) ) ( ON ?auto_852442 ?auto_852443 ) ( ON ?auto_852441 ?auto_852442 ) ( ON ?auto_852440 ?auto_852441 ) ( ON ?auto_852439 ?auto_852440 ) ( ON ?auto_852438 ?auto_852439 ) ( ON ?auto_852437 ?auto_852438 ) ( ON ?auto_852436 ?auto_852437 ) ( ON ?auto_852435 ?auto_852436 ) ( ON ?auto_852434 ?auto_852435 ) ( ON ?auto_852433 ?auto_852434 ) ( ON ?auto_852432 ?auto_852433 ) ( ON ?auto_852431 ?auto_852432 ) ( CLEAR ?auto_852429 ) ( ON ?auto_852430 ?auto_852431 ) ( CLEAR ?auto_852430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_852427 ?auto_852428 ?auto_852429 ?auto_852430 )
      ( MAKE-17PILE ?auto_852427 ?auto_852428 ?auto_852429 ?auto_852430 ?auto_852431 ?auto_852432 ?auto_852433 ?auto_852434 ?auto_852435 ?auto_852436 ?auto_852437 ?auto_852438 ?auto_852439 ?auto_852440 ?auto_852441 ?auto_852442 ?auto_852443 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_852497 - BLOCK
      ?auto_852498 - BLOCK
      ?auto_852499 - BLOCK
      ?auto_852500 - BLOCK
      ?auto_852501 - BLOCK
      ?auto_852502 - BLOCK
      ?auto_852503 - BLOCK
      ?auto_852504 - BLOCK
      ?auto_852505 - BLOCK
      ?auto_852506 - BLOCK
      ?auto_852507 - BLOCK
      ?auto_852508 - BLOCK
      ?auto_852509 - BLOCK
      ?auto_852510 - BLOCK
      ?auto_852511 - BLOCK
      ?auto_852512 - BLOCK
      ?auto_852513 - BLOCK
    )
    :vars
    (
      ?auto_852514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_852513 ?auto_852514 ) ( ON-TABLE ?auto_852497 ) ( ON ?auto_852498 ?auto_852497 ) ( not ( = ?auto_852497 ?auto_852498 ) ) ( not ( = ?auto_852497 ?auto_852499 ) ) ( not ( = ?auto_852497 ?auto_852500 ) ) ( not ( = ?auto_852497 ?auto_852501 ) ) ( not ( = ?auto_852497 ?auto_852502 ) ) ( not ( = ?auto_852497 ?auto_852503 ) ) ( not ( = ?auto_852497 ?auto_852504 ) ) ( not ( = ?auto_852497 ?auto_852505 ) ) ( not ( = ?auto_852497 ?auto_852506 ) ) ( not ( = ?auto_852497 ?auto_852507 ) ) ( not ( = ?auto_852497 ?auto_852508 ) ) ( not ( = ?auto_852497 ?auto_852509 ) ) ( not ( = ?auto_852497 ?auto_852510 ) ) ( not ( = ?auto_852497 ?auto_852511 ) ) ( not ( = ?auto_852497 ?auto_852512 ) ) ( not ( = ?auto_852497 ?auto_852513 ) ) ( not ( = ?auto_852497 ?auto_852514 ) ) ( not ( = ?auto_852498 ?auto_852499 ) ) ( not ( = ?auto_852498 ?auto_852500 ) ) ( not ( = ?auto_852498 ?auto_852501 ) ) ( not ( = ?auto_852498 ?auto_852502 ) ) ( not ( = ?auto_852498 ?auto_852503 ) ) ( not ( = ?auto_852498 ?auto_852504 ) ) ( not ( = ?auto_852498 ?auto_852505 ) ) ( not ( = ?auto_852498 ?auto_852506 ) ) ( not ( = ?auto_852498 ?auto_852507 ) ) ( not ( = ?auto_852498 ?auto_852508 ) ) ( not ( = ?auto_852498 ?auto_852509 ) ) ( not ( = ?auto_852498 ?auto_852510 ) ) ( not ( = ?auto_852498 ?auto_852511 ) ) ( not ( = ?auto_852498 ?auto_852512 ) ) ( not ( = ?auto_852498 ?auto_852513 ) ) ( not ( = ?auto_852498 ?auto_852514 ) ) ( not ( = ?auto_852499 ?auto_852500 ) ) ( not ( = ?auto_852499 ?auto_852501 ) ) ( not ( = ?auto_852499 ?auto_852502 ) ) ( not ( = ?auto_852499 ?auto_852503 ) ) ( not ( = ?auto_852499 ?auto_852504 ) ) ( not ( = ?auto_852499 ?auto_852505 ) ) ( not ( = ?auto_852499 ?auto_852506 ) ) ( not ( = ?auto_852499 ?auto_852507 ) ) ( not ( = ?auto_852499 ?auto_852508 ) ) ( not ( = ?auto_852499 ?auto_852509 ) ) ( not ( = ?auto_852499 ?auto_852510 ) ) ( not ( = ?auto_852499 ?auto_852511 ) ) ( not ( = ?auto_852499 ?auto_852512 ) ) ( not ( = ?auto_852499 ?auto_852513 ) ) ( not ( = ?auto_852499 ?auto_852514 ) ) ( not ( = ?auto_852500 ?auto_852501 ) ) ( not ( = ?auto_852500 ?auto_852502 ) ) ( not ( = ?auto_852500 ?auto_852503 ) ) ( not ( = ?auto_852500 ?auto_852504 ) ) ( not ( = ?auto_852500 ?auto_852505 ) ) ( not ( = ?auto_852500 ?auto_852506 ) ) ( not ( = ?auto_852500 ?auto_852507 ) ) ( not ( = ?auto_852500 ?auto_852508 ) ) ( not ( = ?auto_852500 ?auto_852509 ) ) ( not ( = ?auto_852500 ?auto_852510 ) ) ( not ( = ?auto_852500 ?auto_852511 ) ) ( not ( = ?auto_852500 ?auto_852512 ) ) ( not ( = ?auto_852500 ?auto_852513 ) ) ( not ( = ?auto_852500 ?auto_852514 ) ) ( not ( = ?auto_852501 ?auto_852502 ) ) ( not ( = ?auto_852501 ?auto_852503 ) ) ( not ( = ?auto_852501 ?auto_852504 ) ) ( not ( = ?auto_852501 ?auto_852505 ) ) ( not ( = ?auto_852501 ?auto_852506 ) ) ( not ( = ?auto_852501 ?auto_852507 ) ) ( not ( = ?auto_852501 ?auto_852508 ) ) ( not ( = ?auto_852501 ?auto_852509 ) ) ( not ( = ?auto_852501 ?auto_852510 ) ) ( not ( = ?auto_852501 ?auto_852511 ) ) ( not ( = ?auto_852501 ?auto_852512 ) ) ( not ( = ?auto_852501 ?auto_852513 ) ) ( not ( = ?auto_852501 ?auto_852514 ) ) ( not ( = ?auto_852502 ?auto_852503 ) ) ( not ( = ?auto_852502 ?auto_852504 ) ) ( not ( = ?auto_852502 ?auto_852505 ) ) ( not ( = ?auto_852502 ?auto_852506 ) ) ( not ( = ?auto_852502 ?auto_852507 ) ) ( not ( = ?auto_852502 ?auto_852508 ) ) ( not ( = ?auto_852502 ?auto_852509 ) ) ( not ( = ?auto_852502 ?auto_852510 ) ) ( not ( = ?auto_852502 ?auto_852511 ) ) ( not ( = ?auto_852502 ?auto_852512 ) ) ( not ( = ?auto_852502 ?auto_852513 ) ) ( not ( = ?auto_852502 ?auto_852514 ) ) ( not ( = ?auto_852503 ?auto_852504 ) ) ( not ( = ?auto_852503 ?auto_852505 ) ) ( not ( = ?auto_852503 ?auto_852506 ) ) ( not ( = ?auto_852503 ?auto_852507 ) ) ( not ( = ?auto_852503 ?auto_852508 ) ) ( not ( = ?auto_852503 ?auto_852509 ) ) ( not ( = ?auto_852503 ?auto_852510 ) ) ( not ( = ?auto_852503 ?auto_852511 ) ) ( not ( = ?auto_852503 ?auto_852512 ) ) ( not ( = ?auto_852503 ?auto_852513 ) ) ( not ( = ?auto_852503 ?auto_852514 ) ) ( not ( = ?auto_852504 ?auto_852505 ) ) ( not ( = ?auto_852504 ?auto_852506 ) ) ( not ( = ?auto_852504 ?auto_852507 ) ) ( not ( = ?auto_852504 ?auto_852508 ) ) ( not ( = ?auto_852504 ?auto_852509 ) ) ( not ( = ?auto_852504 ?auto_852510 ) ) ( not ( = ?auto_852504 ?auto_852511 ) ) ( not ( = ?auto_852504 ?auto_852512 ) ) ( not ( = ?auto_852504 ?auto_852513 ) ) ( not ( = ?auto_852504 ?auto_852514 ) ) ( not ( = ?auto_852505 ?auto_852506 ) ) ( not ( = ?auto_852505 ?auto_852507 ) ) ( not ( = ?auto_852505 ?auto_852508 ) ) ( not ( = ?auto_852505 ?auto_852509 ) ) ( not ( = ?auto_852505 ?auto_852510 ) ) ( not ( = ?auto_852505 ?auto_852511 ) ) ( not ( = ?auto_852505 ?auto_852512 ) ) ( not ( = ?auto_852505 ?auto_852513 ) ) ( not ( = ?auto_852505 ?auto_852514 ) ) ( not ( = ?auto_852506 ?auto_852507 ) ) ( not ( = ?auto_852506 ?auto_852508 ) ) ( not ( = ?auto_852506 ?auto_852509 ) ) ( not ( = ?auto_852506 ?auto_852510 ) ) ( not ( = ?auto_852506 ?auto_852511 ) ) ( not ( = ?auto_852506 ?auto_852512 ) ) ( not ( = ?auto_852506 ?auto_852513 ) ) ( not ( = ?auto_852506 ?auto_852514 ) ) ( not ( = ?auto_852507 ?auto_852508 ) ) ( not ( = ?auto_852507 ?auto_852509 ) ) ( not ( = ?auto_852507 ?auto_852510 ) ) ( not ( = ?auto_852507 ?auto_852511 ) ) ( not ( = ?auto_852507 ?auto_852512 ) ) ( not ( = ?auto_852507 ?auto_852513 ) ) ( not ( = ?auto_852507 ?auto_852514 ) ) ( not ( = ?auto_852508 ?auto_852509 ) ) ( not ( = ?auto_852508 ?auto_852510 ) ) ( not ( = ?auto_852508 ?auto_852511 ) ) ( not ( = ?auto_852508 ?auto_852512 ) ) ( not ( = ?auto_852508 ?auto_852513 ) ) ( not ( = ?auto_852508 ?auto_852514 ) ) ( not ( = ?auto_852509 ?auto_852510 ) ) ( not ( = ?auto_852509 ?auto_852511 ) ) ( not ( = ?auto_852509 ?auto_852512 ) ) ( not ( = ?auto_852509 ?auto_852513 ) ) ( not ( = ?auto_852509 ?auto_852514 ) ) ( not ( = ?auto_852510 ?auto_852511 ) ) ( not ( = ?auto_852510 ?auto_852512 ) ) ( not ( = ?auto_852510 ?auto_852513 ) ) ( not ( = ?auto_852510 ?auto_852514 ) ) ( not ( = ?auto_852511 ?auto_852512 ) ) ( not ( = ?auto_852511 ?auto_852513 ) ) ( not ( = ?auto_852511 ?auto_852514 ) ) ( not ( = ?auto_852512 ?auto_852513 ) ) ( not ( = ?auto_852512 ?auto_852514 ) ) ( not ( = ?auto_852513 ?auto_852514 ) ) ( ON ?auto_852512 ?auto_852513 ) ( ON ?auto_852511 ?auto_852512 ) ( ON ?auto_852510 ?auto_852511 ) ( ON ?auto_852509 ?auto_852510 ) ( ON ?auto_852508 ?auto_852509 ) ( ON ?auto_852507 ?auto_852508 ) ( ON ?auto_852506 ?auto_852507 ) ( ON ?auto_852505 ?auto_852506 ) ( ON ?auto_852504 ?auto_852505 ) ( ON ?auto_852503 ?auto_852504 ) ( ON ?auto_852502 ?auto_852503 ) ( ON ?auto_852501 ?auto_852502 ) ( ON ?auto_852500 ?auto_852501 ) ( CLEAR ?auto_852498 ) ( ON ?auto_852499 ?auto_852500 ) ( CLEAR ?auto_852499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_852497 ?auto_852498 ?auto_852499 )
      ( MAKE-17PILE ?auto_852497 ?auto_852498 ?auto_852499 ?auto_852500 ?auto_852501 ?auto_852502 ?auto_852503 ?auto_852504 ?auto_852505 ?auto_852506 ?auto_852507 ?auto_852508 ?auto_852509 ?auto_852510 ?auto_852511 ?auto_852512 ?auto_852513 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_852567 - BLOCK
      ?auto_852568 - BLOCK
      ?auto_852569 - BLOCK
      ?auto_852570 - BLOCK
      ?auto_852571 - BLOCK
      ?auto_852572 - BLOCK
      ?auto_852573 - BLOCK
      ?auto_852574 - BLOCK
      ?auto_852575 - BLOCK
      ?auto_852576 - BLOCK
      ?auto_852577 - BLOCK
      ?auto_852578 - BLOCK
      ?auto_852579 - BLOCK
      ?auto_852580 - BLOCK
      ?auto_852581 - BLOCK
      ?auto_852582 - BLOCK
      ?auto_852583 - BLOCK
    )
    :vars
    (
      ?auto_852584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_852583 ?auto_852584 ) ( ON-TABLE ?auto_852567 ) ( not ( = ?auto_852567 ?auto_852568 ) ) ( not ( = ?auto_852567 ?auto_852569 ) ) ( not ( = ?auto_852567 ?auto_852570 ) ) ( not ( = ?auto_852567 ?auto_852571 ) ) ( not ( = ?auto_852567 ?auto_852572 ) ) ( not ( = ?auto_852567 ?auto_852573 ) ) ( not ( = ?auto_852567 ?auto_852574 ) ) ( not ( = ?auto_852567 ?auto_852575 ) ) ( not ( = ?auto_852567 ?auto_852576 ) ) ( not ( = ?auto_852567 ?auto_852577 ) ) ( not ( = ?auto_852567 ?auto_852578 ) ) ( not ( = ?auto_852567 ?auto_852579 ) ) ( not ( = ?auto_852567 ?auto_852580 ) ) ( not ( = ?auto_852567 ?auto_852581 ) ) ( not ( = ?auto_852567 ?auto_852582 ) ) ( not ( = ?auto_852567 ?auto_852583 ) ) ( not ( = ?auto_852567 ?auto_852584 ) ) ( not ( = ?auto_852568 ?auto_852569 ) ) ( not ( = ?auto_852568 ?auto_852570 ) ) ( not ( = ?auto_852568 ?auto_852571 ) ) ( not ( = ?auto_852568 ?auto_852572 ) ) ( not ( = ?auto_852568 ?auto_852573 ) ) ( not ( = ?auto_852568 ?auto_852574 ) ) ( not ( = ?auto_852568 ?auto_852575 ) ) ( not ( = ?auto_852568 ?auto_852576 ) ) ( not ( = ?auto_852568 ?auto_852577 ) ) ( not ( = ?auto_852568 ?auto_852578 ) ) ( not ( = ?auto_852568 ?auto_852579 ) ) ( not ( = ?auto_852568 ?auto_852580 ) ) ( not ( = ?auto_852568 ?auto_852581 ) ) ( not ( = ?auto_852568 ?auto_852582 ) ) ( not ( = ?auto_852568 ?auto_852583 ) ) ( not ( = ?auto_852568 ?auto_852584 ) ) ( not ( = ?auto_852569 ?auto_852570 ) ) ( not ( = ?auto_852569 ?auto_852571 ) ) ( not ( = ?auto_852569 ?auto_852572 ) ) ( not ( = ?auto_852569 ?auto_852573 ) ) ( not ( = ?auto_852569 ?auto_852574 ) ) ( not ( = ?auto_852569 ?auto_852575 ) ) ( not ( = ?auto_852569 ?auto_852576 ) ) ( not ( = ?auto_852569 ?auto_852577 ) ) ( not ( = ?auto_852569 ?auto_852578 ) ) ( not ( = ?auto_852569 ?auto_852579 ) ) ( not ( = ?auto_852569 ?auto_852580 ) ) ( not ( = ?auto_852569 ?auto_852581 ) ) ( not ( = ?auto_852569 ?auto_852582 ) ) ( not ( = ?auto_852569 ?auto_852583 ) ) ( not ( = ?auto_852569 ?auto_852584 ) ) ( not ( = ?auto_852570 ?auto_852571 ) ) ( not ( = ?auto_852570 ?auto_852572 ) ) ( not ( = ?auto_852570 ?auto_852573 ) ) ( not ( = ?auto_852570 ?auto_852574 ) ) ( not ( = ?auto_852570 ?auto_852575 ) ) ( not ( = ?auto_852570 ?auto_852576 ) ) ( not ( = ?auto_852570 ?auto_852577 ) ) ( not ( = ?auto_852570 ?auto_852578 ) ) ( not ( = ?auto_852570 ?auto_852579 ) ) ( not ( = ?auto_852570 ?auto_852580 ) ) ( not ( = ?auto_852570 ?auto_852581 ) ) ( not ( = ?auto_852570 ?auto_852582 ) ) ( not ( = ?auto_852570 ?auto_852583 ) ) ( not ( = ?auto_852570 ?auto_852584 ) ) ( not ( = ?auto_852571 ?auto_852572 ) ) ( not ( = ?auto_852571 ?auto_852573 ) ) ( not ( = ?auto_852571 ?auto_852574 ) ) ( not ( = ?auto_852571 ?auto_852575 ) ) ( not ( = ?auto_852571 ?auto_852576 ) ) ( not ( = ?auto_852571 ?auto_852577 ) ) ( not ( = ?auto_852571 ?auto_852578 ) ) ( not ( = ?auto_852571 ?auto_852579 ) ) ( not ( = ?auto_852571 ?auto_852580 ) ) ( not ( = ?auto_852571 ?auto_852581 ) ) ( not ( = ?auto_852571 ?auto_852582 ) ) ( not ( = ?auto_852571 ?auto_852583 ) ) ( not ( = ?auto_852571 ?auto_852584 ) ) ( not ( = ?auto_852572 ?auto_852573 ) ) ( not ( = ?auto_852572 ?auto_852574 ) ) ( not ( = ?auto_852572 ?auto_852575 ) ) ( not ( = ?auto_852572 ?auto_852576 ) ) ( not ( = ?auto_852572 ?auto_852577 ) ) ( not ( = ?auto_852572 ?auto_852578 ) ) ( not ( = ?auto_852572 ?auto_852579 ) ) ( not ( = ?auto_852572 ?auto_852580 ) ) ( not ( = ?auto_852572 ?auto_852581 ) ) ( not ( = ?auto_852572 ?auto_852582 ) ) ( not ( = ?auto_852572 ?auto_852583 ) ) ( not ( = ?auto_852572 ?auto_852584 ) ) ( not ( = ?auto_852573 ?auto_852574 ) ) ( not ( = ?auto_852573 ?auto_852575 ) ) ( not ( = ?auto_852573 ?auto_852576 ) ) ( not ( = ?auto_852573 ?auto_852577 ) ) ( not ( = ?auto_852573 ?auto_852578 ) ) ( not ( = ?auto_852573 ?auto_852579 ) ) ( not ( = ?auto_852573 ?auto_852580 ) ) ( not ( = ?auto_852573 ?auto_852581 ) ) ( not ( = ?auto_852573 ?auto_852582 ) ) ( not ( = ?auto_852573 ?auto_852583 ) ) ( not ( = ?auto_852573 ?auto_852584 ) ) ( not ( = ?auto_852574 ?auto_852575 ) ) ( not ( = ?auto_852574 ?auto_852576 ) ) ( not ( = ?auto_852574 ?auto_852577 ) ) ( not ( = ?auto_852574 ?auto_852578 ) ) ( not ( = ?auto_852574 ?auto_852579 ) ) ( not ( = ?auto_852574 ?auto_852580 ) ) ( not ( = ?auto_852574 ?auto_852581 ) ) ( not ( = ?auto_852574 ?auto_852582 ) ) ( not ( = ?auto_852574 ?auto_852583 ) ) ( not ( = ?auto_852574 ?auto_852584 ) ) ( not ( = ?auto_852575 ?auto_852576 ) ) ( not ( = ?auto_852575 ?auto_852577 ) ) ( not ( = ?auto_852575 ?auto_852578 ) ) ( not ( = ?auto_852575 ?auto_852579 ) ) ( not ( = ?auto_852575 ?auto_852580 ) ) ( not ( = ?auto_852575 ?auto_852581 ) ) ( not ( = ?auto_852575 ?auto_852582 ) ) ( not ( = ?auto_852575 ?auto_852583 ) ) ( not ( = ?auto_852575 ?auto_852584 ) ) ( not ( = ?auto_852576 ?auto_852577 ) ) ( not ( = ?auto_852576 ?auto_852578 ) ) ( not ( = ?auto_852576 ?auto_852579 ) ) ( not ( = ?auto_852576 ?auto_852580 ) ) ( not ( = ?auto_852576 ?auto_852581 ) ) ( not ( = ?auto_852576 ?auto_852582 ) ) ( not ( = ?auto_852576 ?auto_852583 ) ) ( not ( = ?auto_852576 ?auto_852584 ) ) ( not ( = ?auto_852577 ?auto_852578 ) ) ( not ( = ?auto_852577 ?auto_852579 ) ) ( not ( = ?auto_852577 ?auto_852580 ) ) ( not ( = ?auto_852577 ?auto_852581 ) ) ( not ( = ?auto_852577 ?auto_852582 ) ) ( not ( = ?auto_852577 ?auto_852583 ) ) ( not ( = ?auto_852577 ?auto_852584 ) ) ( not ( = ?auto_852578 ?auto_852579 ) ) ( not ( = ?auto_852578 ?auto_852580 ) ) ( not ( = ?auto_852578 ?auto_852581 ) ) ( not ( = ?auto_852578 ?auto_852582 ) ) ( not ( = ?auto_852578 ?auto_852583 ) ) ( not ( = ?auto_852578 ?auto_852584 ) ) ( not ( = ?auto_852579 ?auto_852580 ) ) ( not ( = ?auto_852579 ?auto_852581 ) ) ( not ( = ?auto_852579 ?auto_852582 ) ) ( not ( = ?auto_852579 ?auto_852583 ) ) ( not ( = ?auto_852579 ?auto_852584 ) ) ( not ( = ?auto_852580 ?auto_852581 ) ) ( not ( = ?auto_852580 ?auto_852582 ) ) ( not ( = ?auto_852580 ?auto_852583 ) ) ( not ( = ?auto_852580 ?auto_852584 ) ) ( not ( = ?auto_852581 ?auto_852582 ) ) ( not ( = ?auto_852581 ?auto_852583 ) ) ( not ( = ?auto_852581 ?auto_852584 ) ) ( not ( = ?auto_852582 ?auto_852583 ) ) ( not ( = ?auto_852582 ?auto_852584 ) ) ( not ( = ?auto_852583 ?auto_852584 ) ) ( ON ?auto_852582 ?auto_852583 ) ( ON ?auto_852581 ?auto_852582 ) ( ON ?auto_852580 ?auto_852581 ) ( ON ?auto_852579 ?auto_852580 ) ( ON ?auto_852578 ?auto_852579 ) ( ON ?auto_852577 ?auto_852578 ) ( ON ?auto_852576 ?auto_852577 ) ( ON ?auto_852575 ?auto_852576 ) ( ON ?auto_852574 ?auto_852575 ) ( ON ?auto_852573 ?auto_852574 ) ( ON ?auto_852572 ?auto_852573 ) ( ON ?auto_852571 ?auto_852572 ) ( ON ?auto_852570 ?auto_852571 ) ( ON ?auto_852569 ?auto_852570 ) ( CLEAR ?auto_852567 ) ( ON ?auto_852568 ?auto_852569 ) ( CLEAR ?auto_852568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_852567 ?auto_852568 )
      ( MAKE-17PILE ?auto_852567 ?auto_852568 ?auto_852569 ?auto_852570 ?auto_852571 ?auto_852572 ?auto_852573 ?auto_852574 ?auto_852575 ?auto_852576 ?auto_852577 ?auto_852578 ?auto_852579 ?auto_852580 ?auto_852581 ?auto_852582 ?auto_852583 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_852637 - BLOCK
      ?auto_852638 - BLOCK
      ?auto_852639 - BLOCK
      ?auto_852640 - BLOCK
      ?auto_852641 - BLOCK
      ?auto_852642 - BLOCK
      ?auto_852643 - BLOCK
      ?auto_852644 - BLOCK
      ?auto_852645 - BLOCK
      ?auto_852646 - BLOCK
      ?auto_852647 - BLOCK
      ?auto_852648 - BLOCK
      ?auto_852649 - BLOCK
      ?auto_852650 - BLOCK
      ?auto_852651 - BLOCK
      ?auto_852652 - BLOCK
      ?auto_852653 - BLOCK
    )
    :vars
    (
      ?auto_852654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_852653 ?auto_852654 ) ( not ( = ?auto_852637 ?auto_852638 ) ) ( not ( = ?auto_852637 ?auto_852639 ) ) ( not ( = ?auto_852637 ?auto_852640 ) ) ( not ( = ?auto_852637 ?auto_852641 ) ) ( not ( = ?auto_852637 ?auto_852642 ) ) ( not ( = ?auto_852637 ?auto_852643 ) ) ( not ( = ?auto_852637 ?auto_852644 ) ) ( not ( = ?auto_852637 ?auto_852645 ) ) ( not ( = ?auto_852637 ?auto_852646 ) ) ( not ( = ?auto_852637 ?auto_852647 ) ) ( not ( = ?auto_852637 ?auto_852648 ) ) ( not ( = ?auto_852637 ?auto_852649 ) ) ( not ( = ?auto_852637 ?auto_852650 ) ) ( not ( = ?auto_852637 ?auto_852651 ) ) ( not ( = ?auto_852637 ?auto_852652 ) ) ( not ( = ?auto_852637 ?auto_852653 ) ) ( not ( = ?auto_852637 ?auto_852654 ) ) ( not ( = ?auto_852638 ?auto_852639 ) ) ( not ( = ?auto_852638 ?auto_852640 ) ) ( not ( = ?auto_852638 ?auto_852641 ) ) ( not ( = ?auto_852638 ?auto_852642 ) ) ( not ( = ?auto_852638 ?auto_852643 ) ) ( not ( = ?auto_852638 ?auto_852644 ) ) ( not ( = ?auto_852638 ?auto_852645 ) ) ( not ( = ?auto_852638 ?auto_852646 ) ) ( not ( = ?auto_852638 ?auto_852647 ) ) ( not ( = ?auto_852638 ?auto_852648 ) ) ( not ( = ?auto_852638 ?auto_852649 ) ) ( not ( = ?auto_852638 ?auto_852650 ) ) ( not ( = ?auto_852638 ?auto_852651 ) ) ( not ( = ?auto_852638 ?auto_852652 ) ) ( not ( = ?auto_852638 ?auto_852653 ) ) ( not ( = ?auto_852638 ?auto_852654 ) ) ( not ( = ?auto_852639 ?auto_852640 ) ) ( not ( = ?auto_852639 ?auto_852641 ) ) ( not ( = ?auto_852639 ?auto_852642 ) ) ( not ( = ?auto_852639 ?auto_852643 ) ) ( not ( = ?auto_852639 ?auto_852644 ) ) ( not ( = ?auto_852639 ?auto_852645 ) ) ( not ( = ?auto_852639 ?auto_852646 ) ) ( not ( = ?auto_852639 ?auto_852647 ) ) ( not ( = ?auto_852639 ?auto_852648 ) ) ( not ( = ?auto_852639 ?auto_852649 ) ) ( not ( = ?auto_852639 ?auto_852650 ) ) ( not ( = ?auto_852639 ?auto_852651 ) ) ( not ( = ?auto_852639 ?auto_852652 ) ) ( not ( = ?auto_852639 ?auto_852653 ) ) ( not ( = ?auto_852639 ?auto_852654 ) ) ( not ( = ?auto_852640 ?auto_852641 ) ) ( not ( = ?auto_852640 ?auto_852642 ) ) ( not ( = ?auto_852640 ?auto_852643 ) ) ( not ( = ?auto_852640 ?auto_852644 ) ) ( not ( = ?auto_852640 ?auto_852645 ) ) ( not ( = ?auto_852640 ?auto_852646 ) ) ( not ( = ?auto_852640 ?auto_852647 ) ) ( not ( = ?auto_852640 ?auto_852648 ) ) ( not ( = ?auto_852640 ?auto_852649 ) ) ( not ( = ?auto_852640 ?auto_852650 ) ) ( not ( = ?auto_852640 ?auto_852651 ) ) ( not ( = ?auto_852640 ?auto_852652 ) ) ( not ( = ?auto_852640 ?auto_852653 ) ) ( not ( = ?auto_852640 ?auto_852654 ) ) ( not ( = ?auto_852641 ?auto_852642 ) ) ( not ( = ?auto_852641 ?auto_852643 ) ) ( not ( = ?auto_852641 ?auto_852644 ) ) ( not ( = ?auto_852641 ?auto_852645 ) ) ( not ( = ?auto_852641 ?auto_852646 ) ) ( not ( = ?auto_852641 ?auto_852647 ) ) ( not ( = ?auto_852641 ?auto_852648 ) ) ( not ( = ?auto_852641 ?auto_852649 ) ) ( not ( = ?auto_852641 ?auto_852650 ) ) ( not ( = ?auto_852641 ?auto_852651 ) ) ( not ( = ?auto_852641 ?auto_852652 ) ) ( not ( = ?auto_852641 ?auto_852653 ) ) ( not ( = ?auto_852641 ?auto_852654 ) ) ( not ( = ?auto_852642 ?auto_852643 ) ) ( not ( = ?auto_852642 ?auto_852644 ) ) ( not ( = ?auto_852642 ?auto_852645 ) ) ( not ( = ?auto_852642 ?auto_852646 ) ) ( not ( = ?auto_852642 ?auto_852647 ) ) ( not ( = ?auto_852642 ?auto_852648 ) ) ( not ( = ?auto_852642 ?auto_852649 ) ) ( not ( = ?auto_852642 ?auto_852650 ) ) ( not ( = ?auto_852642 ?auto_852651 ) ) ( not ( = ?auto_852642 ?auto_852652 ) ) ( not ( = ?auto_852642 ?auto_852653 ) ) ( not ( = ?auto_852642 ?auto_852654 ) ) ( not ( = ?auto_852643 ?auto_852644 ) ) ( not ( = ?auto_852643 ?auto_852645 ) ) ( not ( = ?auto_852643 ?auto_852646 ) ) ( not ( = ?auto_852643 ?auto_852647 ) ) ( not ( = ?auto_852643 ?auto_852648 ) ) ( not ( = ?auto_852643 ?auto_852649 ) ) ( not ( = ?auto_852643 ?auto_852650 ) ) ( not ( = ?auto_852643 ?auto_852651 ) ) ( not ( = ?auto_852643 ?auto_852652 ) ) ( not ( = ?auto_852643 ?auto_852653 ) ) ( not ( = ?auto_852643 ?auto_852654 ) ) ( not ( = ?auto_852644 ?auto_852645 ) ) ( not ( = ?auto_852644 ?auto_852646 ) ) ( not ( = ?auto_852644 ?auto_852647 ) ) ( not ( = ?auto_852644 ?auto_852648 ) ) ( not ( = ?auto_852644 ?auto_852649 ) ) ( not ( = ?auto_852644 ?auto_852650 ) ) ( not ( = ?auto_852644 ?auto_852651 ) ) ( not ( = ?auto_852644 ?auto_852652 ) ) ( not ( = ?auto_852644 ?auto_852653 ) ) ( not ( = ?auto_852644 ?auto_852654 ) ) ( not ( = ?auto_852645 ?auto_852646 ) ) ( not ( = ?auto_852645 ?auto_852647 ) ) ( not ( = ?auto_852645 ?auto_852648 ) ) ( not ( = ?auto_852645 ?auto_852649 ) ) ( not ( = ?auto_852645 ?auto_852650 ) ) ( not ( = ?auto_852645 ?auto_852651 ) ) ( not ( = ?auto_852645 ?auto_852652 ) ) ( not ( = ?auto_852645 ?auto_852653 ) ) ( not ( = ?auto_852645 ?auto_852654 ) ) ( not ( = ?auto_852646 ?auto_852647 ) ) ( not ( = ?auto_852646 ?auto_852648 ) ) ( not ( = ?auto_852646 ?auto_852649 ) ) ( not ( = ?auto_852646 ?auto_852650 ) ) ( not ( = ?auto_852646 ?auto_852651 ) ) ( not ( = ?auto_852646 ?auto_852652 ) ) ( not ( = ?auto_852646 ?auto_852653 ) ) ( not ( = ?auto_852646 ?auto_852654 ) ) ( not ( = ?auto_852647 ?auto_852648 ) ) ( not ( = ?auto_852647 ?auto_852649 ) ) ( not ( = ?auto_852647 ?auto_852650 ) ) ( not ( = ?auto_852647 ?auto_852651 ) ) ( not ( = ?auto_852647 ?auto_852652 ) ) ( not ( = ?auto_852647 ?auto_852653 ) ) ( not ( = ?auto_852647 ?auto_852654 ) ) ( not ( = ?auto_852648 ?auto_852649 ) ) ( not ( = ?auto_852648 ?auto_852650 ) ) ( not ( = ?auto_852648 ?auto_852651 ) ) ( not ( = ?auto_852648 ?auto_852652 ) ) ( not ( = ?auto_852648 ?auto_852653 ) ) ( not ( = ?auto_852648 ?auto_852654 ) ) ( not ( = ?auto_852649 ?auto_852650 ) ) ( not ( = ?auto_852649 ?auto_852651 ) ) ( not ( = ?auto_852649 ?auto_852652 ) ) ( not ( = ?auto_852649 ?auto_852653 ) ) ( not ( = ?auto_852649 ?auto_852654 ) ) ( not ( = ?auto_852650 ?auto_852651 ) ) ( not ( = ?auto_852650 ?auto_852652 ) ) ( not ( = ?auto_852650 ?auto_852653 ) ) ( not ( = ?auto_852650 ?auto_852654 ) ) ( not ( = ?auto_852651 ?auto_852652 ) ) ( not ( = ?auto_852651 ?auto_852653 ) ) ( not ( = ?auto_852651 ?auto_852654 ) ) ( not ( = ?auto_852652 ?auto_852653 ) ) ( not ( = ?auto_852652 ?auto_852654 ) ) ( not ( = ?auto_852653 ?auto_852654 ) ) ( ON ?auto_852652 ?auto_852653 ) ( ON ?auto_852651 ?auto_852652 ) ( ON ?auto_852650 ?auto_852651 ) ( ON ?auto_852649 ?auto_852650 ) ( ON ?auto_852648 ?auto_852649 ) ( ON ?auto_852647 ?auto_852648 ) ( ON ?auto_852646 ?auto_852647 ) ( ON ?auto_852645 ?auto_852646 ) ( ON ?auto_852644 ?auto_852645 ) ( ON ?auto_852643 ?auto_852644 ) ( ON ?auto_852642 ?auto_852643 ) ( ON ?auto_852641 ?auto_852642 ) ( ON ?auto_852640 ?auto_852641 ) ( ON ?auto_852639 ?auto_852640 ) ( ON ?auto_852638 ?auto_852639 ) ( ON ?auto_852637 ?auto_852638 ) ( CLEAR ?auto_852637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_852637 )
      ( MAKE-17PILE ?auto_852637 ?auto_852638 ?auto_852639 ?auto_852640 ?auto_852641 ?auto_852642 ?auto_852643 ?auto_852644 ?auto_852645 ?auto_852646 ?auto_852647 ?auto_852648 ?auto_852649 ?auto_852650 ?auto_852651 ?auto_852652 ?auto_852653 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_852708 - BLOCK
      ?auto_852709 - BLOCK
      ?auto_852710 - BLOCK
      ?auto_852711 - BLOCK
      ?auto_852712 - BLOCK
      ?auto_852713 - BLOCK
      ?auto_852714 - BLOCK
      ?auto_852715 - BLOCK
      ?auto_852716 - BLOCK
      ?auto_852717 - BLOCK
      ?auto_852718 - BLOCK
      ?auto_852719 - BLOCK
      ?auto_852720 - BLOCK
      ?auto_852721 - BLOCK
      ?auto_852722 - BLOCK
      ?auto_852723 - BLOCK
      ?auto_852724 - BLOCK
      ?auto_852725 - BLOCK
    )
    :vars
    (
      ?auto_852726 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_852724 ) ( ON ?auto_852725 ?auto_852726 ) ( CLEAR ?auto_852725 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_852708 ) ( ON ?auto_852709 ?auto_852708 ) ( ON ?auto_852710 ?auto_852709 ) ( ON ?auto_852711 ?auto_852710 ) ( ON ?auto_852712 ?auto_852711 ) ( ON ?auto_852713 ?auto_852712 ) ( ON ?auto_852714 ?auto_852713 ) ( ON ?auto_852715 ?auto_852714 ) ( ON ?auto_852716 ?auto_852715 ) ( ON ?auto_852717 ?auto_852716 ) ( ON ?auto_852718 ?auto_852717 ) ( ON ?auto_852719 ?auto_852718 ) ( ON ?auto_852720 ?auto_852719 ) ( ON ?auto_852721 ?auto_852720 ) ( ON ?auto_852722 ?auto_852721 ) ( ON ?auto_852723 ?auto_852722 ) ( ON ?auto_852724 ?auto_852723 ) ( not ( = ?auto_852708 ?auto_852709 ) ) ( not ( = ?auto_852708 ?auto_852710 ) ) ( not ( = ?auto_852708 ?auto_852711 ) ) ( not ( = ?auto_852708 ?auto_852712 ) ) ( not ( = ?auto_852708 ?auto_852713 ) ) ( not ( = ?auto_852708 ?auto_852714 ) ) ( not ( = ?auto_852708 ?auto_852715 ) ) ( not ( = ?auto_852708 ?auto_852716 ) ) ( not ( = ?auto_852708 ?auto_852717 ) ) ( not ( = ?auto_852708 ?auto_852718 ) ) ( not ( = ?auto_852708 ?auto_852719 ) ) ( not ( = ?auto_852708 ?auto_852720 ) ) ( not ( = ?auto_852708 ?auto_852721 ) ) ( not ( = ?auto_852708 ?auto_852722 ) ) ( not ( = ?auto_852708 ?auto_852723 ) ) ( not ( = ?auto_852708 ?auto_852724 ) ) ( not ( = ?auto_852708 ?auto_852725 ) ) ( not ( = ?auto_852708 ?auto_852726 ) ) ( not ( = ?auto_852709 ?auto_852710 ) ) ( not ( = ?auto_852709 ?auto_852711 ) ) ( not ( = ?auto_852709 ?auto_852712 ) ) ( not ( = ?auto_852709 ?auto_852713 ) ) ( not ( = ?auto_852709 ?auto_852714 ) ) ( not ( = ?auto_852709 ?auto_852715 ) ) ( not ( = ?auto_852709 ?auto_852716 ) ) ( not ( = ?auto_852709 ?auto_852717 ) ) ( not ( = ?auto_852709 ?auto_852718 ) ) ( not ( = ?auto_852709 ?auto_852719 ) ) ( not ( = ?auto_852709 ?auto_852720 ) ) ( not ( = ?auto_852709 ?auto_852721 ) ) ( not ( = ?auto_852709 ?auto_852722 ) ) ( not ( = ?auto_852709 ?auto_852723 ) ) ( not ( = ?auto_852709 ?auto_852724 ) ) ( not ( = ?auto_852709 ?auto_852725 ) ) ( not ( = ?auto_852709 ?auto_852726 ) ) ( not ( = ?auto_852710 ?auto_852711 ) ) ( not ( = ?auto_852710 ?auto_852712 ) ) ( not ( = ?auto_852710 ?auto_852713 ) ) ( not ( = ?auto_852710 ?auto_852714 ) ) ( not ( = ?auto_852710 ?auto_852715 ) ) ( not ( = ?auto_852710 ?auto_852716 ) ) ( not ( = ?auto_852710 ?auto_852717 ) ) ( not ( = ?auto_852710 ?auto_852718 ) ) ( not ( = ?auto_852710 ?auto_852719 ) ) ( not ( = ?auto_852710 ?auto_852720 ) ) ( not ( = ?auto_852710 ?auto_852721 ) ) ( not ( = ?auto_852710 ?auto_852722 ) ) ( not ( = ?auto_852710 ?auto_852723 ) ) ( not ( = ?auto_852710 ?auto_852724 ) ) ( not ( = ?auto_852710 ?auto_852725 ) ) ( not ( = ?auto_852710 ?auto_852726 ) ) ( not ( = ?auto_852711 ?auto_852712 ) ) ( not ( = ?auto_852711 ?auto_852713 ) ) ( not ( = ?auto_852711 ?auto_852714 ) ) ( not ( = ?auto_852711 ?auto_852715 ) ) ( not ( = ?auto_852711 ?auto_852716 ) ) ( not ( = ?auto_852711 ?auto_852717 ) ) ( not ( = ?auto_852711 ?auto_852718 ) ) ( not ( = ?auto_852711 ?auto_852719 ) ) ( not ( = ?auto_852711 ?auto_852720 ) ) ( not ( = ?auto_852711 ?auto_852721 ) ) ( not ( = ?auto_852711 ?auto_852722 ) ) ( not ( = ?auto_852711 ?auto_852723 ) ) ( not ( = ?auto_852711 ?auto_852724 ) ) ( not ( = ?auto_852711 ?auto_852725 ) ) ( not ( = ?auto_852711 ?auto_852726 ) ) ( not ( = ?auto_852712 ?auto_852713 ) ) ( not ( = ?auto_852712 ?auto_852714 ) ) ( not ( = ?auto_852712 ?auto_852715 ) ) ( not ( = ?auto_852712 ?auto_852716 ) ) ( not ( = ?auto_852712 ?auto_852717 ) ) ( not ( = ?auto_852712 ?auto_852718 ) ) ( not ( = ?auto_852712 ?auto_852719 ) ) ( not ( = ?auto_852712 ?auto_852720 ) ) ( not ( = ?auto_852712 ?auto_852721 ) ) ( not ( = ?auto_852712 ?auto_852722 ) ) ( not ( = ?auto_852712 ?auto_852723 ) ) ( not ( = ?auto_852712 ?auto_852724 ) ) ( not ( = ?auto_852712 ?auto_852725 ) ) ( not ( = ?auto_852712 ?auto_852726 ) ) ( not ( = ?auto_852713 ?auto_852714 ) ) ( not ( = ?auto_852713 ?auto_852715 ) ) ( not ( = ?auto_852713 ?auto_852716 ) ) ( not ( = ?auto_852713 ?auto_852717 ) ) ( not ( = ?auto_852713 ?auto_852718 ) ) ( not ( = ?auto_852713 ?auto_852719 ) ) ( not ( = ?auto_852713 ?auto_852720 ) ) ( not ( = ?auto_852713 ?auto_852721 ) ) ( not ( = ?auto_852713 ?auto_852722 ) ) ( not ( = ?auto_852713 ?auto_852723 ) ) ( not ( = ?auto_852713 ?auto_852724 ) ) ( not ( = ?auto_852713 ?auto_852725 ) ) ( not ( = ?auto_852713 ?auto_852726 ) ) ( not ( = ?auto_852714 ?auto_852715 ) ) ( not ( = ?auto_852714 ?auto_852716 ) ) ( not ( = ?auto_852714 ?auto_852717 ) ) ( not ( = ?auto_852714 ?auto_852718 ) ) ( not ( = ?auto_852714 ?auto_852719 ) ) ( not ( = ?auto_852714 ?auto_852720 ) ) ( not ( = ?auto_852714 ?auto_852721 ) ) ( not ( = ?auto_852714 ?auto_852722 ) ) ( not ( = ?auto_852714 ?auto_852723 ) ) ( not ( = ?auto_852714 ?auto_852724 ) ) ( not ( = ?auto_852714 ?auto_852725 ) ) ( not ( = ?auto_852714 ?auto_852726 ) ) ( not ( = ?auto_852715 ?auto_852716 ) ) ( not ( = ?auto_852715 ?auto_852717 ) ) ( not ( = ?auto_852715 ?auto_852718 ) ) ( not ( = ?auto_852715 ?auto_852719 ) ) ( not ( = ?auto_852715 ?auto_852720 ) ) ( not ( = ?auto_852715 ?auto_852721 ) ) ( not ( = ?auto_852715 ?auto_852722 ) ) ( not ( = ?auto_852715 ?auto_852723 ) ) ( not ( = ?auto_852715 ?auto_852724 ) ) ( not ( = ?auto_852715 ?auto_852725 ) ) ( not ( = ?auto_852715 ?auto_852726 ) ) ( not ( = ?auto_852716 ?auto_852717 ) ) ( not ( = ?auto_852716 ?auto_852718 ) ) ( not ( = ?auto_852716 ?auto_852719 ) ) ( not ( = ?auto_852716 ?auto_852720 ) ) ( not ( = ?auto_852716 ?auto_852721 ) ) ( not ( = ?auto_852716 ?auto_852722 ) ) ( not ( = ?auto_852716 ?auto_852723 ) ) ( not ( = ?auto_852716 ?auto_852724 ) ) ( not ( = ?auto_852716 ?auto_852725 ) ) ( not ( = ?auto_852716 ?auto_852726 ) ) ( not ( = ?auto_852717 ?auto_852718 ) ) ( not ( = ?auto_852717 ?auto_852719 ) ) ( not ( = ?auto_852717 ?auto_852720 ) ) ( not ( = ?auto_852717 ?auto_852721 ) ) ( not ( = ?auto_852717 ?auto_852722 ) ) ( not ( = ?auto_852717 ?auto_852723 ) ) ( not ( = ?auto_852717 ?auto_852724 ) ) ( not ( = ?auto_852717 ?auto_852725 ) ) ( not ( = ?auto_852717 ?auto_852726 ) ) ( not ( = ?auto_852718 ?auto_852719 ) ) ( not ( = ?auto_852718 ?auto_852720 ) ) ( not ( = ?auto_852718 ?auto_852721 ) ) ( not ( = ?auto_852718 ?auto_852722 ) ) ( not ( = ?auto_852718 ?auto_852723 ) ) ( not ( = ?auto_852718 ?auto_852724 ) ) ( not ( = ?auto_852718 ?auto_852725 ) ) ( not ( = ?auto_852718 ?auto_852726 ) ) ( not ( = ?auto_852719 ?auto_852720 ) ) ( not ( = ?auto_852719 ?auto_852721 ) ) ( not ( = ?auto_852719 ?auto_852722 ) ) ( not ( = ?auto_852719 ?auto_852723 ) ) ( not ( = ?auto_852719 ?auto_852724 ) ) ( not ( = ?auto_852719 ?auto_852725 ) ) ( not ( = ?auto_852719 ?auto_852726 ) ) ( not ( = ?auto_852720 ?auto_852721 ) ) ( not ( = ?auto_852720 ?auto_852722 ) ) ( not ( = ?auto_852720 ?auto_852723 ) ) ( not ( = ?auto_852720 ?auto_852724 ) ) ( not ( = ?auto_852720 ?auto_852725 ) ) ( not ( = ?auto_852720 ?auto_852726 ) ) ( not ( = ?auto_852721 ?auto_852722 ) ) ( not ( = ?auto_852721 ?auto_852723 ) ) ( not ( = ?auto_852721 ?auto_852724 ) ) ( not ( = ?auto_852721 ?auto_852725 ) ) ( not ( = ?auto_852721 ?auto_852726 ) ) ( not ( = ?auto_852722 ?auto_852723 ) ) ( not ( = ?auto_852722 ?auto_852724 ) ) ( not ( = ?auto_852722 ?auto_852725 ) ) ( not ( = ?auto_852722 ?auto_852726 ) ) ( not ( = ?auto_852723 ?auto_852724 ) ) ( not ( = ?auto_852723 ?auto_852725 ) ) ( not ( = ?auto_852723 ?auto_852726 ) ) ( not ( = ?auto_852724 ?auto_852725 ) ) ( not ( = ?auto_852724 ?auto_852726 ) ) ( not ( = ?auto_852725 ?auto_852726 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_852725 ?auto_852726 )
      ( !STACK ?auto_852725 ?auto_852724 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_852745 - BLOCK
      ?auto_852746 - BLOCK
      ?auto_852747 - BLOCK
      ?auto_852748 - BLOCK
      ?auto_852749 - BLOCK
      ?auto_852750 - BLOCK
      ?auto_852751 - BLOCK
      ?auto_852752 - BLOCK
      ?auto_852753 - BLOCK
      ?auto_852754 - BLOCK
      ?auto_852755 - BLOCK
      ?auto_852756 - BLOCK
      ?auto_852757 - BLOCK
      ?auto_852758 - BLOCK
      ?auto_852759 - BLOCK
      ?auto_852760 - BLOCK
      ?auto_852761 - BLOCK
      ?auto_852762 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_852761 ) ( ON-TABLE ?auto_852762 ) ( CLEAR ?auto_852762 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_852745 ) ( ON ?auto_852746 ?auto_852745 ) ( ON ?auto_852747 ?auto_852746 ) ( ON ?auto_852748 ?auto_852747 ) ( ON ?auto_852749 ?auto_852748 ) ( ON ?auto_852750 ?auto_852749 ) ( ON ?auto_852751 ?auto_852750 ) ( ON ?auto_852752 ?auto_852751 ) ( ON ?auto_852753 ?auto_852752 ) ( ON ?auto_852754 ?auto_852753 ) ( ON ?auto_852755 ?auto_852754 ) ( ON ?auto_852756 ?auto_852755 ) ( ON ?auto_852757 ?auto_852756 ) ( ON ?auto_852758 ?auto_852757 ) ( ON ?auto_852759 ?auto_852758 ) ( ON ?auto_852760 ?auto_852759 ) ( ON ?auto_852761 ?auto_852760 ) ( not ( = ?auto_852745 ?auto_852746 ) ) ( not ( = ?auto_852745 ?auto_852747 ) ) ( not ( = ?auto_852745 ?auto_852748 ) ) ( not ( = ?auto_852745 ?auto_852749 ) ) ( not ( = ?auto_852745 ?auto_852750 ) ) ( not ( = ?auto_852745 ?auto_852751 ) ) ( not ( = ?auto_852745 ?auto_852752 ) ) ( not ( = ?auto_852745 ?auto_852753 ) ) ( not ( = ?auto_852745 ?auto_852754 ) ) ( not ( = ?auto_852745 ?auto_852755 ) ) ( not ( = ?auto_852745 ?auto_852756 ) ) ( not ( = ?auto_852745 ?auto_852757 ) ) ( not ( = ?auto_852745 ?auto_852758 ) ) ( not ( = ?auto_852745 ?auto_852759 ) ) ( not ( = ?auto_852745 ?auto_852760 ) ) ( not ( = ?auto_852745 ?auto_852761 ) ) ( not ( = ?auto_852745 ?auto_852762 ) ) ( not ( = ?auto_852746 ?auto_852747 ) ) ( not ( = ?auto_852746 ?auto_852748 ) ) ( not ( = ?auto_852746 ?auto_852749 ) ) ( not ( = ?auto_852746 ?auto_852750 ) ) ( not ( = ?auto_852746 ?auto_852751 ) ) ( not ( = ?auto_852746 ?auto_852752 ) ) ( not ( = ?auto_852746 ?auto_852753 ) ) ( not ( = ?auto_852746 ?auto_852754 ) ) ( not ( = ?auto_852746 ?auto_852755 ) ) ( not ( = ?auto_852746 ?auto_852756 ) ) ( not ( = ?auto_852746 ?auto_852757 ) ) ( not ( = ?auto_852746 ?auto_852758 ) ) ( not ( = ?auto_852746 ?auto_852759 ) ) ( not ( = ?auto_852746 ?auto_852760 ) ) ( not ( = ?auto_852746 ?auto_852761 ) ) ( not ( = ?auto_852746 ?auto_852762 ) ) ( not ( = ?auto_852747 ?auto_852748 ) ) ( not ( = ?auto_852747 ?auto_852749 ) ) ( not ( = ?auto_852747 ?auto_852750 ) ) ( not ( = ?auto_852747 ?auto_852751 ) ) ( not ( = ?auto_852747 ?auto_852752 ) ) ( not ( = ?auto_852747 ?auto_852753 ) ) ( not ( = ?auto_852747 ?auto_852754 ) ) ( not ( = ?auto_852747 ?auto_852755 ) ) ( not ( = ?auto_852747 ?auto_852756 ) ) ( not ( = ?auto_852747 ?auto_852757 ) ) ( not ( = ?auto_852747 ?auto_852758 ) ) ( not ( = ?auto_852747 ?auto_852759 ) ) ( not ( = ?auto_852747 ?auto_852760 ) ) ( not ( = ?auto_852747 ?auto_852761 ) ) ( not ( = ?auto_852747 ?auto_852762 ) ) ( not ( = ?auto_852748 ?auto_852749 ) ) ( not ( = ?auto_852748 ?auto_852750 ) ) ( not ( = ?auto_852748 ?auto_852751 ) ) ( not ( = ?auto_852748 ?auto_852752 ) ) ( not ( = ?auto_852748 ?auto_852753 ) ) ( not ( = ?auto_852748 ?auto_852754 ) ) ( not ( = ?auto_852748 ?auto_852755 ) ) ( not ( = ?auto_852748 ?auto_852756 ) ) ( not ( = ?auto_852748 ?auto_852757 ) ) ( not ( = ?auto_852748 ?auto_852758 ) ) ( not ( = ?auto_852748 ?auto_852759 ) ) ( not ( = ?auto_852748 ?auto_852760 ) ) ( not ( = ?auto_852748 ?auto_852761 ) ) ( not ( = ?auto_852748 ?auto_852762 ) ) ( not ( = ?auto_852749 ?auto_852750 ) ) ( not ( = ?auto_852749 ?auto_852751 ) ) ( not ( = ?auto_852749 ?auto_852752 ) ) ( not ( = ?auto_852749 ?auto_852753 ) ) ( not ( = ?auto_852749 ?auto_852754 ) ) ( not ( = ?auto_852749 ?auto_852755 ) ) ( not ( = ?auto_852749 ?auto_852756 ) ) ( not ( = ?auto_852749 ?auto_852757 ) ) ( not ( = ?auto_852749 ?auto_852758 ) ) ( not ( = ?auto_852749 ?auto_852759 ) ) ( not ( = ?auto_852749 ?auto_852760 ) ) ( not ( = ?auto_852749 ?auto_852761 ) ) ( not ( = ?auto_852749 ?auto_852762 ) ) ( not ( = ?auto_852750 ?auto_852751 ) ) ( not ( = ?auto_852750 ?auto_852752 ) ) ( not ( = ?auto_852750 ?auto_852753 ) ) ( not ( = ?auto_852750 ?auto_852754 ) ) ( not ( = ?auto_852750 ?auto_852755 ) ) ( not ( = ?auto_852750 ?auto_852756 ) ) ( not ( = ?auto_852750 ?auto_852757 ) ) ( not ( = ?auto_852750 ?auto_852758 ) ) ( not ( = ?auto_852750 ?auto_852759 ) ) ( not ( = ?auto_852750 ?auto_852760 ) ) ( not ( = ?auto_852750 ?auto_852761 ) ) ( not ( = ?auto_852750 ?auto_852762 ) ) ( not ( = ?auto_852751 ?auto_852752 ) ) ( not ( = ?auto_852751 ?auto_852753 ) ) ( not ( = ?auto_852751 ?auto_852754 ) ) ( not ( = ?auto_852751 ?auto_852755 ) ) ( not ( = ?auto_852751 ?auto_852756 ) ) ( not ( = ?auto_852751 ?auto_852757 ) ) ( not ( = ?auto_852751 ?auto_852758 ) ) ( not ( = ?auto_852751 ?auto_852759 ) ) ( not ( = ?auto_852751 ?auto_852760 ) ) ( not ( = ?auto_852751 ?auto_852761 ) ) ( not ( = ?auto_852751 ?auto_852762 ) ) ( not ( = ?auto_852752 ?auto_852753 ) ) ( not ( = ?auto_852752 ?auto_852754 ) ) ( not ( = ?auto_852752 ?auto_852755 ) ) ( not ( = ?auto_852752 ?auto_852756 ) ) ( not ( = ?auto_852752 ?auto_852757 ) ) ( not ( = ?auto_852752 ?auto_852758 ) ) ( not ( = ?auto_852752 ?auto_852759 ) ) ( not ( = ?auto_852752 ?auto_852760 ) ) ( not ( = ?auto_852752 ?auto_852761 ) ) ( not ( = ?auto_852752 ?auto_852762 ) ) ( not ( = ?auto_852753 ?auto_852754 ) ) ( not ( = ?auto_852753 ?auto_852755 ) ) ( not ( = ?auto_852753 ?auto_852756 ) ) ( not ( = ?auto_852753 ?auto_852757 ) ) ( not ( = ?auto_852753 ?auto_852758 ) ) ( not ( = ?auto_852753 ?auto_852759 ) ) ( not ( = ?auto_852753 ?auto_852760 ) ) ( not ( = ?auto_852753 ?auto_852761 ) ) ( not ( = ?auto_852753 ?auto_852762 ) ) ( not ( = ?auto_852754 ?auto_852755 ) ) ( not ( = ?auto_852754 ?auto_852756 ) ) ( not ( = ?auto_852754 ?auto_852757 ) ) ( not ( = ?auto_852754 ?auto_852758 ) ) ( not ( = ?auto_852754 ?auto_852759 ) ) ( not ( = ?auto_852754 ?auto_852760 ) ) ( not ( = ?auto_852754 ?auto_852761 ) ) ( not ( = ?auto_852754 ?auto_852762 ) ) ( not ( = ?auto_852755 ?auto_852756 ) ) ( not ( = ?auto_852755 ?auto_852757 ) ) ( not ( = ?auto_852755 ?auto_852758 ) ) ( not ( = ?auto_852755 ?auto_852759 ) ) ( not ( = ?auto_852755 ?auto_852760 ) ) ( not ( = ?auto_852755 ?auto_852761 ) ) ( not ( = ?auto_852755 ?auto_852762 ) ) ( not ( = ?auto_852756 ?auto_852757 ) ) ( not ( = ?auto_852756 ?auto_852758 ) ) ( not ( = ?auto_852756 ?auto_852759 ) ) ( not ( = ?auto_852756 ?auto_852760 ) ) ( not ( = ?auto_852756 ?auto_852761 ) ) ( not ( = ?auto_852756 ?auto_852762 ) ) ( not ( = ?auto_852757 ?auto_852758 ) ) ( not ( = ?auto_852757 ?auto_852759 ) ) ( not ( = ?auto_852757 ?auto_852760 ) ) ( not ( = ?auto_852757 ?auto_852761 ) ) ( not ( = ?auto_852757 ?auto_852762 ) ) ( not ( = ?auto_852758 ?auto_852759 ) ) ( not ( = ?auto_852758 ?auto_852760 ) ) ( not ( = ?auto_852758 ?auto_852761 ) ) ( not ( = ?auto_852758 ?auto_852762 ) ) ( not ( = ?auto_852759 ?auto_852760 ) ) ( not ( = ?auto_852759 ?auto_852761 ) ) ( not ( = ?auto_852759 ?auto_852762 ) ) ( not ( = ?auto_852760 ?auto_852761 ) ) ( not ( = ?auto_852760 ?auto_852762 ) ) ( not ( = ?auto_852761 ?auto_852762 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_852762 )
      ( !STACK ?auto_852762 ?auto_852761 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_852781 - BLOCK
      ?auto_852782 - BLOCK
      ?auto_852783 - BLOCK
      ?auto_852784 - BLOCK
      ?auto_852785 - BLOCK
      ?auto_852786 - BLOCK
      ?auto_852787 - BLOCK
      ?auto_852788 - BLOCK
      ?auto_852789 - BLOCK
      ?auto_852790 - BLOCK
      ?auto_852791 - BLOCK
      ?auto_852792 - BLOCK
      ?auto_852793 - BLOCK
      ?auto_852794 - BLOCK
      ?auto_852795 - BLOCK
      ?auto_852796 - BLOCK
      ?auto_852797 - BLOCK
      ?auto_852798 - BLOCK
    )
    :vars
    (
      ?auto_852799 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_852798 ?auto_852799 ) ( ON-TABLE ?auto_852781 ) ( ON ?auto_852782 ?auto_852781 ) ( ON ?auto_852783 ?auto_852782 ) ( ON ?auto_852784 ?auto_852783 ) ( ON ?auto_852785 ?auto_852784 ) ( ON ?auto_852786 ?auto_852785 ) ( ON ?auto_852787 ?auto_852786 ) ( ON ?auto_852788 ?auto_852787 ) ( ON ?auto_852789 ?auto_852788 ) ( ON ?auto_852790 ?auto_852789 ) ( ON ?auto_852791 ?auto_852790 ) ( ON ?auto_852792 ?auto_852791 ) ( ON ?auto_852793 ?auto_852792 ) ( ON ?auto_852794 ?auto_852793 ) ( ON ?auto_852795 ?auto_852794 ) ( ON ?auto_852796 ?auto_852795 ) ( not ( = ?auto_852781 ?auto_852782 ) ) ( not ( = ?auto_852781 ?auto_852783 ) ) ( not ( = ?auto_852781 ?auto_852784 ) ) ( not ( = ?auto_852781 ?auto_852785 ) ) ( not ( = ?auto_852781 ?auto_852786 ) ) ( not ( = ?auto_852781 ?auto_852787 ) ) ( not ( = ?auto_852781 ?auto_852788 ) ) ( not ( = ?auto_852781 ?auto_852789 ) ) ( not ( = ?auto_852781 ?auto_852790 ) ) ( not ( = ?auto_852781 ?auto_852791 ) ) ( not ( = ?auto_852781 ?auto_852792 ) ) ( not ( = ?auto_852781 ?auto_852793 ) ) ( not ( = ?auto_852781 ?auto_852794 ) ) ( not ( = ?auto_852781 ?auto_852795 ) ) ( not ( = ?auto_852781 ?auto_852796 ) ) ( not ( = ?auto_852781 ?auto_852797 ) ) ( not ( = ?auto_852781 ?auto_852798 ) ) ( not ( = ?auto_852781 ?auto_852799 ) ) ( not ( = ?auto_852782 ?auto_852783 ) ) ( not ( = ?auto_852782 ?auto_852784 ) ) ( not ( = ?auto_852782 ?auto_852785 ) ) ( not ( = ?auto_852782 ?auto_852786 ) ) ( not ( = ?auto_852782 ?auto_852787 ) ) ( not ( = ?auto_852782 ?auto_852788 ) ) ( not ( = ?auto_852782 ?auto_852789 ) ) ( not ( = ?auto_852782 ?auto_852790 ) ) ( not ( = ?auto_852782 ?auto_852791 ) ) ( not ( = ?auto_852782 ?auto_852792 ) ) ( not ( = ?auto_852782 ?auto_852793 ) ) ( not ( = ?auto_852782 ?auto_852794 ) ) ( not ( = ?auto_852782 ?auto_852795 ) ) ( not ( = ?auto_852782 ?auto_852796 ) ) ( not ( = ?auto_852782 ?auto_852797 ) ) ( not ( = ?auto_852782 ?auto_852798 ) ) ( not ( = ?auto_852782 ?auto_852799 ) ) ( not ( = ?auto_852783 ?auto_852784 ) ) ( not ( = ?auto_852783 ?auto_852785 ) ) ( not ( = ?auto_852783 ?auto_852786 ) ) ( not ( = ?auto_852783 ?auto_852787 ) ) ( not ( = ?auto_852783 ?auto_852788 ) ) ( not ( = ?auto_852783 ?auto_852789 ) ) ( not ( = ?auto_852783 ?auto_852790 ) ) ( not ( = ?auto_852783 ?auto_852791 ) ) ( not ( = ?auto_852783 ?auto_852792 ) ) ( not ( = ?auto_852783 ?auto_852793 ) ) ( not ( = ?auto_852783 ?auto_852794 ) ) ( not ( = ?auto_852783 ?auto_852795 ) ) ( not ( = ?auto_852783 ?auto_852796 ) ) ( not ( = ?auto_852783 ?auto_852797 ) ) ( not ( = ?auto_852783 ?auto_852798 ) ) ( not ( = ?auto_852783 ?auto_852799 ) ) ( not ( = ?auto_852784 ?auto_852785 ) ) ( not ( = ?auto_852784 ?auto_852786 ) ) ( not ( = ?auto_852784 ?auto_852787 ) ) ( not ( = ?auto_852784 ?auto_852788 ) ) ( not ( = ?auto_852784 ?auto_852789 ) ) ( not ( = ?auto_852784 ?auto_852790 ) ) ( not ( = ?auto_852784 ?auto_852791 ) ) ( not ( = ?auto_852784 ?auto_852792 ) ) ( not ( = ?auto_852784 ?auto_852793 ) ) ( not ( = ?auto_852784 ?auto_852794 ) ) ( not ( = ?auto_852784 ?auto_852795 ) ) ( not ( = ?auto_852784 ?auto_852796 ) ) ( not ( = ?auto_852784 ?auto_852797 ) ) ( not ( = ?auto_852784 ?auto_852798 ) ) ( not ( = ?auto_852784 ?auto_852799 ) ) ( not ( = ?auto_852785 ?auto_852786 ) ) ( not ( = ?auto_852785 ?auto_852787 ) ) ( not ( = ?auto_852785 ?auto_852788 ) ) ( not ( = ?auto_852785 ?auto_852789 ) ) ( not ( = ?auto_852785 ?auto_852790 ) ) ( not ( = ?auto_852785 ?auto_852791 ) ) ( not ( = ?auto_852785 ?auto_852792 ) ) ( not ( = ?auto_852785 ?auto_852793 ) ) ( not ( = ?auto_852785 ?auto_852794 ) ) ( not ( = ?auto_852785 ?auto_852795 ) ) ( not ( = ?auto_852785 ?auto_852796 ) ) ( not ( = ?auto_852785 ?auto_852797 ) ) ( not ( = ?auto_852785 ?auto_852798 ) ) ( not ( = ?auto_852785 ?auto_852799 ) ) ( not ( = ?auto_852786 ?auto_852787 ) ) ( not ( = ?auto_852786 ?auto_852788 ) ) ( not ( = ?auto_852786 ?auto_852789 ) ) ( not ( = ?auto_852786 ?auto_852790 ) ) ( not ( = ?auto_852786 ?auto_852791 ) ) ( not ( = ?auto_852786 ?auto_852792 ) ) ( not ( = ?auto_852786 ?auto_852793 ) ) ( not ( = ?auto_852786 ?auto_852794 ) ) ( not ( = ?auto_852786 ?auto_852795 ) ) ( not ( = ?auto_852786 ?auto_852796 ) ) ( not ( = ?auto_852786 ?auto_852797 ) ) ( not ( = ?auto_852786 ?auto_852798 ) ) ( not ( = ?auto_852786 ?auto_852799 ) ) ( not ( = ?auto_852787 ?auto_852788 ) ) ( not ( = ?auto_852787 ?auto_852789 ) ) ( not ( = ?auto_852787 ?auto_852790 ) ) ( not ( = ?auto_852787 ?auto_852791 ) ) ( not ( = ?auto_852787 ?auto_852792 ) ) ( not ( = ?auto_852787 ?auto_852793 ) ) ( not ( = ?auto_852787 ?auto_852794 ) ) ( not ( = ?auto_852787 ?auto_852795 ) ) ( not ( = ?auto_852787 ?auto_852796 ) ) ( not ( = ?auto_852787 ?auto_852797 ) ) ( not ( = ?auto_852787 ?auto_852798 ) ) ( not ( = ?auto_852787 ?auto_852799 ) ) ( not ( = ?auto_852788 ?auto_852789 ) ) ( not ( = ?auto_852788 ?auto_852790 ) ) ( not ( = ?auto_852788 ?auto_852791 ) ) ( not ( = ?auto_852788 ?auto_852792 ) ) ( not ( = ?auto_852788 ?auto_852793 ) ) ( not ( = ?auto_852788 ?auto_852794 ) ) ( not ( = ?auto_852788 ?auto_852795 ) ) ( not ( = ?auto_852788 ?auto_852796 ) ) ( not ( = ?auto_852788 ?auto_852797 ) ) ( not ( = ?auto_852788 ?auto_852798 ) ) ( not ( = ?auto_852788 ?auto_852799 ) ) ( not ( = ?auto_852789 ?auto_852790 ) ) ( not ( = ?auto_852789 ?auto_852791 ) ) ( not ( = ?auto_852789 ?auto_852792 ) ) ( not ( = ?auto_852789 ?auto_852793 ) ) ( not ( = ?auto_852789 ?auto_852794 ) ) ( not ( = ?auto_852789 ?auto_852795 ) ) ( not ( = ?auto_852789 ?auto_852796 ) ) ( not ( = ?auto_852789 ?auto_852797 ) ) ( not ( = ?auto_852789 ?auto_852798 ) ) ( not ( = ?auto_852789 ?auto_852799 ) ) ( not ( = ?auto_852790 ?auto_852791 ) ) ( not ( = ?auto_852790 ?auto_852792 ) ) ( not ( = ?auto_852790 ?auto_852793 ) ) ( not ( = ?auto_852790 ?auto_852794 ) ) ( not ( = ?auto_852790 ?auto_852795 ) ) ( not ( = ?auto_852790 ?auto_852796 ) ) ( not ( = ?auto_852790 ?auto_852797 ) ) ( not ( = ?auto_852790 ?auto_852798 ) ) ( not ( = ?auto_852790 ?auto_852799 ) ) ( not ( = ?auto_852791 ?auto_852792 ) ) ( not ( = ?auto_852791 ?auto_852793 ) ) ( not ( = ?auto_852791 ?auto_852794 ) ) ( not ( = ?auto_852791 ?auto_852795 ) ) ( not ( = ?auto_852791 ?auto_852796 ) ) ( not ( = ?auto_852791 ?auto_852797 ) ) ( not ( = ?auto_852791 ?auto_852798 ) ) ( not ( = ?auto_852791 ?auto_852799 ) ) ( not ( = ?auto_852792 ?auto_852793 ) ) ( not ( = ?auto_852792 ?auto_852794 ) ) ( not ( = ?auto_852792 ?auto_852795 ) ) ( not ( = ?auto_852792 ?auto_852796 ) ) ( not ( = ?auto_852792 ?auto_852797 ) ) ( not ( = ?auto_852792 ?auto_852798 ) ) ( not ( = ?auto_852792 ?auto_852799 ) ) ( not ( = ?auto_852793 ?auto_852794 ) ) ( not ( = ?auto_852793 ?auto_852795 ) ) ( not ( = ?auto_852793 ?auto_852796 ) ) ( not ( = ?auto_852793 ?auto_852797 ) ) ( not ( = ?auto_852793 ?auto_852798 ) ) ( not ( = ?auto_852793 ?auto_852799 ) ) ( not ( = ?auto_852794 ?auto_852795 ) ) ( not ( = ?auto_852794 ?auto_852796 ) ) ( not ( = ?auto_852794 ?auto_852797 ) ) ( not ( = ?auto_852794 ?auto_852798 ) ) ( not ( = ?auto_852794 ?auto_852799 ) ) ( not ( = ?auto_852795 ?auto_852796 ) ) ( not ( = ?auto_852795 ?auto_852797 ) ) ( not ( = ?auto_852795 ?auto_852798 ) ) ( not ( = ?auto_852795 ?auto_852799 ) ) ( not ( = ?auto_852796 ?auto_852797 ) ) ( not ( = ?auto_852796 ?auto_852798 ) ) ( not ( = ?auto_852796 ?auto_852799 ) ) ( not ( = ?auto_852797 ?auto_852798 ) ) ( not ( = ?auto_852797 ?auto_852799 ) ) ( not ( = ?auto_852798 ?auto_852799 ) ) ( CLEAR ?auto_852796 ) ( ON ?auto_852797 ?auto_852798 ) ( CLEAR ?auto_852797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_852781 ?auto_852782 ?auto_852783 ?auto_852784 ?auto_852785 ?auto_852786 ?auto_852787 ?auto_852788 ?auto_852789 ?auto_852790 ?auto_852791 ?auto_852792 ?auto_852793 ?auto_852794 ?auto_852795 ?auto_852796 ?auto_852797 )
      ( MAKE-18PILE ?auto_852781 ?auto_852782 ?auto_852783 ?auto_852784 ?auto_852785 ?auto_852786 ?auto_852787 ?auto_852788 ?auto_852789 ?auto_852790 ?auto_852791 ?auto_852792 ?auto_852793 ?auto_852794 ?auto_852795 ?auto_852796 ?auto_852797 ?auto_852798 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_852818 - BLOCK
      ?auto_852819 - BLOCK
      ?auto_852820 - BLOCK
      ?auto_852821 - BLOCK
      ?auto_852822 - BLOCK
      ?auto_852823 - BLOCK
      ?auto_852824 - BLOCK
      ?auto_852825 - BLOCK
      ?auto_852826 - BLOCK
      ?auto_852827 - BLOCK
      ?auto_852828 - BLOCK
      ?auto_852829 - BLOCK
      ?auto_852830 - BLOCK
      ?auto_852831 - BLOCK
      ?auto_852832 - BLOCK
      ?auto_852833 - BLOCK
      ?auto_852834 - BLOCK
      ?auto_852835 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_852835 ) ( ON-TABLE ?auto_852818 ) ( ON ?auto_852819 ?auto_852818 ) ( ON ?auto_852820 ?auto_852819 ) ( ON ?auto_852821 ?auto_852820 ) ( ON ?auto_852822 ?auto_852821 ) ( ON ?auto_852823 ?auto_852822 ) ( ON ?auto_852824 ?auto_852823 ) ( ON ?auto_852825 ?auto_852824 ) ( ON ?auto_852826 ?auto_852825 ) ( ON ?auto_852827 ?auto_852826 ) ( ON ?auto_852828 ?auto_852827 ) ( ON ?auto_852829 ?auto_852828 ) ( ON ?auto_852830 ?auto_852829 ) ( ON ?auto_852831 ?auto_852830 ) ( ON ?auto_852832 ?auto_852831 ) ( ON ?auto_852833 ?auto_852832 ) ( not ( = ?auto_852818 ?auto_852819 ) ) ( not ( = ?auto_852818 ?auto_852820 ) ) ( not ( = ?auto_852818 ?auto_852821 ) ) ( not ( = ?auto_852818 ?auto_852822 ) ) ( not ( = ?auto_852818 ?auto_852823 ) ) ( not ( = ?auto_852818 ?auto_852824 ) ) ( not ( = ?auto_852818 ?auto_852825 ) ) ( not ( = ?auto_852818 ?auto_852826 ) ) ( not ( = ?auto_852818 ?auto_852827 ) ) ( not ( = ?auto_852818 ?auto_852828 ) ) ( not ( = ?auto_852818 ?auto_852829 ) ) ( not ( = ?auto_852818 ?auto_852830 ) ) ( not ( = ?auto_852818 ?auto_852831 ) ) ( not ( = ?auto_852818 ?auto_852832 ) ) ( not ( = ?auto_852818 ?auto_852833 ) ) ( not ( = ?auto_852818 ?auto_852834 ) ) ( not ( = ?auto_852818 ?auto_852835 ) ) ( not ( = ?auto_852819 ?auto_852820 ) ) ( not ( = ?auto_852819 ?auto_852821 ) ) ( not ( = ?auto_852819 ?auto_852822 ) ) ( not ( = ?auto_852819 ?auto_852823 ) ) ( not ( = ?auto_852819 ?auto_852824 ) ) ( not ( = ?auto_852819 ?auto_852825 ) ) ( not ( = ?auto_852819 ?auto_852826 ) ) ( not ( = ?auto_852819 ?auto_852827 ) ) ( not ( = ?auto_852819 ?auto_852828 ) ) ( not ( = ?auto_852819 ?auto_852829 ) ) ( not ( = ?auto_852819 ?auto_852830 ) ) ( not ( = ?auto_852819 ?auto_852831 ) ) ( not ( = ?auto_852819 ?auto_852832 ) ) ( not ( = ?auto_852819 ?auto_852833 ) ) ( not ( = ?auto_852819 ?auto_852834 ) ) ( not ( = ?auto_852819 ?auto_852835 ) ) ( not ( = ?auto_852820 ?auto_852821 ) ) ( not ( = ?auto_852820 ?auto_852822 ) ) ( not ( = ?auto_852820 ?auto_852823 ) ) ( not ( = ?auto_852820 ?auto_852824 ) ) ( not ( = ?auto_852820 ?auto_852825 ) ) ( not ( = ?auto_852820 ?auto_852826 ) ) ( not ( = ?auto_852820 ?auto_852827 ) ) ( not ( = ?auto_852820 ?auto_852828 ) ) ( not ( = ?auto_852820 ?auto_852829 ) ) ( not ( = ?auto_852820 ?auto_852830 ) ) ( not ( = ?auto_852820 ?auto_852831 ) ) ( not ( = ?auto_852820 ?auto_852832 ) ) ( not ( = ?auto_852820 ?auto_852833 ) ) ( not ( = ?auto_852820 ?auto_852834 ) ) ( not ( = ?auto_852820 ?auto_852835 ) ) ( not ( = ?auto_852821 ?auto_852822 ) ) ( not ( = ?auto_852821 ?auto_852823 ) ) ( not ( = ?auto_852821 ?auto_852824 ) ) ( not ( = ?auto_852821 ?auto_852825 ) ) ( not ( = ?auto_852821 ?auto_852826 ) ) ( not ( = ?auto_852821 ?auto_852827 ) ) ( not ( = ?auto_852821 ?auto_852828 ) ) ( not ( = ?auto_852821 ?auto_852829 ) ) ( not ( = ?auto_852821 ?auto_852830 ) ) ( not ( = ?auto_852821 ?auto_852831 ) ) ( not ( = ?auto_852821 ?auto_852832 ) ) ( not ( = ?auto_852821 ?auto_852833 ) ) ( not ( = ?auto_852821 ?auto_852834 ) ) ( not ( = ?auto_852821 ?auto_852835 ) ) ( not ( = ?auto_852822 ?auto_852823 ) ) ( not ( = ?auto_852822 ?auto_852824 ) ) ( not ( = ?auto_852822 ?auto_852825 ) ) ( not ( = ?auto_852822 ?auto_852826 ) ) ( not ( = ?auto_852822 ?auto_852827 ) ) ( not ( = ?auto_852822 ?auto_852828 ) ) ( not ( = ?auto_852822 ?auto_852829 ) ) ( not ( = ?auto_852822 ?auto_852830 ) ) ( not ( = ?auto_852822 ?auto_852831 ) ) ( not ( = ?auto_852822 ?auto_852832 ) ) ( not ( = ?auto_852822 ?auto_852833 ) ) ( not ( = ?auto_852822 ?auto_852834 ) ) ( not ( = ?auto_852822 ?auto_852835 ) ) ( not ( = ?auto_852823 ?auto_852824 ) ) ( not ( = ?auto_852823 ?auto_852825 ) ) ( not ( = ?auto_852823 ?auto_852826 ) ) ( not ( = ?auto_852823 ?auto_852827 ) ) ( not ( = ?auto_852823 ?auto_852828 ) ) ( not ( = ?auto_852823 ?auto_852829 ) ) ( not ( = ?auto_852823 ?auto_852830 ) ) ( not ( = ?auto_852823 ?auto_852831 ) ) ( not ( = ?auto_852823 ?auto_852832 ) ) ( not ( = ?auto_852823 ?auto_852833 ) ) ( not ( = ?auto_852823 ?auto_852834 ) ) ( not ( = ?auto_852823 ?auto_852835 ) ) ( not ( = ?auto_852824 ?auto_852825 ) ) ( not ( = ?auto_852824 ?auto_852826 ) ) ( not ( = ?auto_852824 ?auto_852827 ) ) ( not ( = ?auto_852824 ?auto_852828 ) ) ( not ( = ?auto_852824 ?auto_852829 ) ) ( not ( = ?auto_852824 ?auto_852830 ) ) ( not ( = ?auto_852824 ?auto_852831 ) ) ( not ( = ?auto_852824 ?auto_852832 ) ) ( not ( = ?auto_852824 ?auto_852833 ) ) ( not ( = ?auto_852824 ?auto_852834 ) ) ( not ( = ?auto_852824 ?auto_852835 ) ) ( not ( = ?auto_852825 ?auto_852826 ) ) ( not ( = ?auto_852825 ?auto_852827 ) ) ( not ( = ?auto_852825 ?auto_852828 ) ) ( not ( = ?auto_852825 ?auto_852829 ) ) ( not ( = ?auto_852825 ?auto_852830 ) ) ( not ( = ?auto_852825 ?auto_852831 ) ) ( not ( = ?auto_852825 ?auto_852832 ) ) ( not ( = ?auto_852825 ?auto_852833 ) ) ( not ( = ?auto_852825 ?auto_852834 ) ) ( not ( = ?auto_852825 ?auto_852835 ) ) ( not ( = ?auto_852826 ?auto_852827 ) ) ( not ( = ?auto_852826 ?auto_852828 ) ) ( not ( = ?auto_852826 ?auto_852829 ) ) ( not ( = ?auto_852826 ?auto_852830 ) ) ( not ( = ?auto_852826 ?auto_852831 ) ) ( not ( = ?auto_852826 ?auto_852832 ) ) ( not ( = ?auto_852826 ?auto_852833 ) ) ( not ( = ?auto_852826 ?auto_852834 ) ) ( not ( = ?auto_852826 ?auto_852835 ) ) ( not ( = ?auto_852827 ?auto_852828 ) ) ( not ( = ?auto_852827 ?auto_852829 ) ) ( not ( = ?auto_852827 ?auto_852830 ) ) ( not ( = ?auto_852827 ?auto_852831 ) ) ( not ( = ?auto_852827 ?auto_852832 ) ) ( not ( = ?auto_852827 ?auto_852833 ) ) ( not ( = ?auto_852827 ?auto_852834 ) ) ( not ( = ?auto_852827 ?auto_852835 ) ) ( not ( = ?auto_852828 ?auto_852829 ) ) ( not ( = ?auto_852828 ?auto_852830 ) ) ( not ( = ?auto_852828 ?auto_852831 ) ) ( not ( = ?auto_852828 ?auto_852832 ) ) ( not ( = ?auto_852828 ?auto_852833 ) ) ( not ( = ?auto_852828 ?auto_852834 ) ) ( not ( = ?auto_852828 ?auto_852835 ) ) ( not ( = ?auto_852829 ?auto_852830 ) ) ( not ( = ?auto_852829 ?auto_852831 ) ) ( not ( = ?auto_852829 ?auto_852832 ) ) ( not ( = ?auto_852829 ?auto_852833 ) ) ( not ( = ?auto_852829 ?auto_852834 ) ) ( not ( = ?auto_852829 ?auto_852835 ) ) ( not ( = ?auto_852830 ?auto_852831 ) ) ( not ( = ?auto_852830 ?auto_852832 ) ) ( not ( = ?auto_852830 ?auto_852833 ) ) ( not ( = ?auto_852830 ?auto_852834 ) ) ( not ( = ?auto_852830 ?auto_852835 ) ) ( not ( = ?auto_852831 ?auto_852832 ) ) ( not ( = ?auto_852831 ?auto_852833 ) ) ( not ( = ?auto_852831 ?auto_852834 ) ) ( not ( = ?auto_852831 ?auto_852835 ) ) ( not ( = ?auto_852832 ?auto_852833 ) ) ( not ( = ?auto_852832 ?auto_852834 ) ) ( not ( = ?auto_852832 ?auto_852835 ) ) ( not ( = ?auto_852833 ?auto_852834 ) ) ( not ( = ?auto_852833 ?auto_852835 ) ) ( not ( = ?auto_852834 ?auto_852835 ) ) ( CLEAR ?auto_852833 ) ( ON ?auto_852834 ?auto_852835 ) ( CLEAR ?auto_852834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_852818 ?auto_852819 ?auto_852820 ?auto_852821 ?auto_852822 ?auto_852823 ?auto_852824 ?auto_852825 ?auto_852826 ?auto_852827 ?auto_852828 ?auto_852829 ?auto_852830 ?auto_852831 ?auto_852832 ?auto_852833 ?auto_852834 )
      ( MAKE-18PILE ?auto_852818 ?auto_852819 ?auto_852820 ?auto_852821 ?auto_852822 ?auto_852823 ?auto_852824 ?auto_852825 ?auto_852826 ?auto_852827 ?auto_852828 ?auto_852829 ?auto_852830 ?auto_852831 ?auto_852832 ?auto_852833 ?auto_852834 ?auto_852835 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_852854 - BLOCK
      ?auto_852855 - BLOCK
      ?auto_852856 - BLOCK
      ?auto_852857 - BLOCK
      ?auto_852858 - BLOCK
      ?auto_852859 - BLOCK
      ?auto_852860 - BLOCK
      ?auto_852861 - BLOCK
      ?auto_852862 - BLOCK
      ?auto_852863 - BLOCK
      ?auto_852864 - BLOCK
      ?auto_852865 - BLOCK
      ?auto_852866 - BLOCK
      ?auto_852867 - BLOCK
      ?auto_852868 - BLOCK
      ?auto_852869 - BLOCK
      ?auto_852870 - BLOCK
      ?auto_852871 - BLOCK
    )
    :vars
    (
      ?auto_852872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_852871 ?auto_852872 ) ( ON-TABLE ?auto_852854 ) ( ON ?auto_852855 ?auto_852854 ) ( ON ?auto_852856 ?auto_852855 ) ( ON ?auto_852857 ?auto_852856 ) ( ON ?auto_852858 ?auto_852857 ) ( ON ?auto_852859 ?auto_852858 ) ( ON ?auto_852860 ?auto_852859 ) ( ON ?auto_852861 ?auto_852860 ) ( ON ?auto_852862 ?auto_852861 ) ( ON ?auto_852863 ?auto_852862 ) ( ON ?auto_852864 ?auto_852863 ) ( ON ?auto_852865 ?auto_852864 ) ( ON ?auto_852866 ?auto_852865 ) ( ON ?auto_852867 ?auto_852866 ) ( ON ?auto_852868 ?auto_852867 ) ( not ( = ?auto_852854 ?auto_852855 ) ) ( not ( = ?auto_852854 ?auto_852856 ) ) ( not ( = ?auto_852854 ?auto_852857 ) ) ( not ( = ?auto_852854 ?auto_852858 ) ) ( not ( = ?auto_852854 ?auto_852859 ) ) ( not ( = ?auto_852854 ?auto_852860 ) ) ( not ( = ?auto_852854 ?auto_852861 ) ) ( not ( = ?auto_852854 ?auto_852862 ) ) ( not ( = ?auto_852854 ?auto_852863 ) ) ( not ( = ?auto_852854 ?auto_852864 ) ) ( not ( = ?auto_852854 ?auto_852865 ) ) ( not ( = ?auto_852854 ?auto_852866 ) ) ( not ( = ?auto_852854 ?auto_852867 ) ) ( not ( = ?auto_852854 ?auto_852868 ) ) ( not ( = ?auto_852854 ?auto_852869 ) ) ( not ( = ?auto_852854 ?auto_852870 ) ) ( not ( = ?auto_852854 ?auto_852871 ) ) ( not ( = ?auto_852854 ?auto_852872 ) ) ( not ( = ?auto_852855 ?auto_852856 ) ) ( not ( = ?auto_852855 ?auto_852857 ) ) ( not ( = ?auto_852855 ?auto_852858 ) ) ( not ( = ?auto_852855 ?auto_852859 ) ) ( not ( = ?auto_852855 ?auto_852860 ) ) ( not ( = ?auto_852855 ?auto_852861 ) ) ( not ( = ?auto_852855 ?auto_852862 ) ) ( not ( = ?auto_852855 ?auto_852863 ) ) ( not ( = ?auto_852855 ?auto_852864 ) ) ( not ( = ?auto_852855 ?auto_852865 ) ) ( not ( = ?auto_852855 ?auto_852866 ) ) ( not ( = ?auto_852855 ?auto_852867 ) ) ( not ( = ?auto_852855 ?auto_852868 ) ) ( not ( = ?auto_852855 ?auto_852869 ) ) ( not ( = ?auto_852855 ?auto_852870 ) ) ( not ( = ?auto_852855 ?auto_852871 ) ) ( not ( = ?auto_852855 ?auto_852872 ) ) ( not ( = ?auto_852856 ?auto_852857 ) ) ( not ( = ?auto_852856 ?auto_852858 ) ) ( not ( = ?auto_852856 ?auto_852859 ) ) ( not ( = ?auto_852856 ?auto_852860 ) ) ( not ( = ?auto_852856 ?auto_852861 ) ) ( not ( = ?auto_852856 ?auto_852862 ) ) ( not ( = ?auto_852856 ?auto_852863 ) ) ( not ( = ?auto_852856 ?auto_852864 ) ) ( not ( = ?auto_852856 ?auto_852865 ) ) ( not ( = ?auto_852856 ?auto_852866 ) ) ( not ( = ?auto_852856 ?auto_852867 ) ) ( not ( = ?auto_852856 ?auto_852868 ) ) ( not ( = ?auto_852856 ?auto_852869 ) ) ( not ( = ?auto_852856 ?auto_852870 ) ) ( not ( = ?auto_852856 ?auto_852871 ) ) ( not ( = ?auto_852856 ?auto_852872 ) ) ( not ( = ?auto_852857 ?auto_852858 ) ) ( not ( = ?auto_852857 ?auto_852859 ) ) ( not ( = ?auto_852857 ?auto_852860 ) ) ( not ( = ?auto_852857 ?auto_852861 ) ) ( not ( = ?auto_852857 ?auto_852862 ) ) ( not ( = ?auto_852857 ?auto_852863 ) ) ( not ( = ?auto_852857 ?auto_852864 ) ) ( not ( = ?auto_852857 ?auto_852865 ) ) ( not ( = ?auto_852857 ?auto_852866 ) ) ( not ( = ?auto_852857 ?auto_852867 ) ) ( not ( = ?auto_852857 ?auto_852868 ) ) ( not ( = ?auto_852857 ?auto_852869 ) ) ( not ( = ?auto_852857 ?auto_852870 ) ) ( not ( = ?auto_852857 ?auto_852871 ) ) ( not ( = ?auto_852857 ?auto_852872 ) ) ( not ( = ?auto_852858 ?auto_852859 ) ) ( not ( = ?auto_852858 ?auto_852860 ) ) ( not ( = ?auto_852858 ?auto_852861 ) ) ( not ( = ?auto_852858 ?auto_852862 ) ) ( not ( = ?auto_852858 ?auto_852863 ) ) ( not ( = ?auto_852858 ?auto_852864 ) ) ( not ( = ?auto_852858 ?auto_852865 ) ) ( not ( = ?auto_852858 ?auto_852866 ) ) ( not ( = ?auto_852858 ?auto_852867 ) ) ( not ( = ?auto_852858 ?auto_852868 ) ) ( not ( = ?auto_852858 ?auto_852869 ) ) ( not ( = ?auto_852858 ?auto_852870 ) ) ( not ( = ?auto_852858 ?auto_852871 ) ) ( not ( = ?auto_852858 ?auto_852872 ) ) ( not ( = ?auto_852859 ?auto_852860 ) ) ( not ( = ?auto_852859 ?auto_852861 ) ) ( not ( = ?auto_852859 ?auto_852862 ) ) ( not ( = ?auto_852859 ?auto_852863 ) ) ( not ( = ?auto_852859 ?auto_852864 ) ) ( not ( = ?auto_852859 ?auto_852865 ) ) ( not ( = ?auto_852859 ?auto_852866 ) ) ( not ( = ?auto_852859 ?auto_852867 ) ) ( not ( = ?auto_852859 ?auto_852868 ) ) ( not ( = ?auto_852859 ?auto_852869 ) ) ( not ( = ?auto_852859 ?auto_852870 ) ) ( not ( = ?auto_852859 ?auto_852871 ) ) ( not ( = ?auto_852859 ?auto_852872 ) ) ( not ( = ?auto_852860 ?auto_852861 ) ) ( not ( = ?auto_852860 ?auto_852862 ) ) ( not ( = ?auto_852860 ?auto_852863 ) ) ( not ( = ?auto_852860 ?auto_852864 ) ) ( not ( = ?auto_852860 ?auto_852865 ) ) ( not ( = ?auto_852860 ?auto_852866 ) ) ( not ( = ?auto_852860 ?auto_852867 ) ) ( not ( = ?auto_852860 ?auto_852868 ) ) ( not ( = ?auto_852860 ?auto_852869 ) ) ( not ( = ?auto_852860 ?auto_852870 ) ) ( not ( = ?auto_852860 ?auto_852871 ) ) ( not ( = ?auto_852860 ?auto_852872 ) ) ( not ( = ?auto_852861 ?auto_852862 ) ) ( not ( = ?auto_852861 ?auto_852863 ) ) ( not ( = ?auto_852861 ?auto_852864 ) ) ( not ( = ?auto_852861 ?auto_852865 ) ) ( not ( = ?auto_852861 ?auto_852866 ) ) ( not ( = ?auto_852861 ?auto_852867 ) ) ( not ( = ?auto_852861 ?auto_852868 ) ) ( not ( = ?auto_852861 ?auto_852869 ) ) ( not ( = ?auto_852861 ?auto_852870 ) ) ( not ( = ?auto_852861 ?auto_852871 ) ) ( not ( = ?auto_852861 ?auto_852872 ) ) ( not ( = ?auto_852862 ?auto_852863 ) ) ( not ( = ?auto_852862 ?auto_852864 ) ) ( not ( = ?auto_852862 ?auto_852865 ) ) ( not ( = ?auto_852862 ?auto_852866 ) ) ( not ( = ?auto_852862 ?auto_852867 ) ) ( not ( = ?auto_852862 ?auto_852868 ) ) ( not ( = ?auto_852862 ?auto_852869 ) ) ( not ( = ?auto_852862 ?auto_852870 ) ) ( not ( = ?auto_852862 ?auto_852871 ) ) ( not ( = ?auto_852862 ?auto_852872 ) ) ( not ( = ?auto_852863 ?auto_852864 ) ) ( not ( = ?auto_852863 ?auto_852865 ) ) ( not ( = ?auto_852863 ?auto_852866 ) ) ( not ( = ?auto_852863 ?auto_852867 ) ) ( not ( = ?auto_852863 ?auto_852868 ) ) ( not ( = ?auto_852863 ?auto_852869 ) ) ( not ( = ?auto_852863 ?auto_852870 ) ) ( not ( = ?auto_852863 ?auto_852871 ) ) ( not ( = ?auto_852863 ?auto_852872 ) ) ( not ( = ?auto_852864 ?auto_852865 ) ) ( not ( = ?auto_852864 ?auto_852866 ) ) ( not ( = ?auto_852864 ?auto_852867 ) ) ( not ( = ?auto_852864 ?auto_852868 ) ) ( not ( = ?auto_852864 ?auto_852869 ) ) ( not ( = ?auto_852864 ?auto_852870 ) ) ( not ( = ?auto_852864 ?auto_852871 ) ) ( not ( = ?auto_852864 ?auto_852872 ) ) ( not ( = ?auto_852865 ?auto_852866 ) ) ( not ( = ?auto_852865 ?auto_852867 ) ) ( not ( = ?auto_852865 ?auto_852868 ) ) ( not ( = ?auto_852865 ?auto_852869 ) ) ( not ( = ?auto_852865 ?auto_852870 ) ) ( not ( = ?auto_852865 ?auto_852871 ) ) ( not ( = ?auto_852865 ?auto_852872 ) ) ( not ( = ?auto_852866 ?auto_852867 ) ) ( not ( = ?auto_852866 ?auto_852868 ) ) ( not ( = ?auto_852866 ?auto_852869 ) ) ( not ( = ?auto_852866 ?auto_852870 ) ) ( not ( = ?auto_852866 ?auto_852871 ) ) ( not ( = ?auto_852866 ?auto_852872 ) ) ( not ( = ?auto_852867 ?auto_852868 ) ) ( not ( = ?auto_852867 ?auto_852869 ) ) ( not ( = ?auto_852867 ?auto_852870 ) ) ( not ( = ?auto_852867 ?auto_852871 ) ) ( not ( = ?auto_852867 ?auto_852872 ) ) ( not ( = ?auto_852868 ?auto_852869 ) ) ( not ( = ?auto_852868 ?auto_852870 ) ) ( not ( = ?auto_852868 ?auto_852871 ) ) ( not ( = ?auto_852868 ?auto_852872 ) ) ( not ( = ?auto_852869 ?auto_852870 ) ) ( not ( = ?auto_852869 ?auto_852871 ) ) ( not ( = ?auto_852869 ?auto_852872 ) ) ( not ( = ?auto_852870 ?auto_852871 ) ) ( not ( = ?auto_852870 ?auto_852872 ) ) ( not ( = ?auto_852871 ?auto_852872 ) ) ( ON ?auto_852870 ?auto_852871 ) ( CLEAR ?auto_852868 ) ( ON ?auto_852869 ?auto_852870 ) ( CLEAR ?auto_852869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_852854 ?auto_852855 ?auto_852856 ?auto_852857 ?auto_852858 ?auto_852859 ?auto_852860 ?auto_852861 ?auto_852862 ?auto_852863 ?auto_852864 ?auto_852865 ?auto_852866 ?auto_852867 ?auto_852868 ?auto_852869 )
      ( MAKE-18PILE ?auto_852854 ?auto_852855 ?auto_852856 ?auto_852857 ?auto_852858 ?auto_852859 ?auto_852860 ?auto_852861 ?auto_852862 ?auto_852863 ?auto_852864 ?auto_852865 ?auto_852866 ?auto_852867 ?auto_852868 ?auto_852869 ?auto_852870 ?auto_852871 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_852891 - BLOCK
      ?auto_852892 - BLOCK
      ?auto_852893 - BLOCK
      ?auto_852894 - BLOCK
      ?auto_852895 - BLOCK
      ?auto_852896 - BLOCK
      ?auto_852897 - BLOCK
      ?auto_852898 - BLOCK
      ?auto_852899 - BLOCK
      ?auto_852900 - BLOCK
      ?auto_852901 - BLOCK
      ?auto_852902 - BLOCK
      ?auto_852903 - BLOCK
      ?auto_852904 - BLOCK
      ?auto_852905 - BLOCK
      ?auto_852906 - BLOCK
      ?auto_852907 - BLOCK
      ?auto_852908 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_852908 ) ( ON-TABLE ?auto_852891 ) ( ON ?auto_852892 ?auto_852891 ) ( ON ?auto_852893 ?auto_852892 ) ( ON ?auto_852894 ?auto_852893 ) ( ON ?auto_852895 ?auto_852894 ) ( ON ?auto_852896 ?auto_852895 ) ( ON ?auto_852897 ?auto_852896 ) ( ON ?auto_852898 ?auto_852897 ) ( ON ?auto_852899 ?auto_852898 ) ( ON ?auto_852900 ?auto_852899 ) ( ON ?auto_852901 ?auto_852900 ) ( ON ?auto_852902 ?auto_852901 ) ( ON ?auto_852903 ?auto_852902 ) ( ON ?auto_852904 ?auto_852903 ) ( ON ?auto_852905 ?auto_852904 ) ( not ( = ?auto_852891 ?auto_852892 ) ) ( not ( = ?auto_852891 ?auto_852893 ) ) ( not ( = ?auto_852891 ?auto_852894 ) ) ( not ( = ?auto_852891 ?auto_852895 ) ) ( not ( = ?auto_852891 ?auto_852896 ) ) ( not ( = ?auto_852891 ?auto_852897 ) ) ( not ( = ?auto_852891 ?auto_852898 ) ) ( not ( = ?auto_852891 ?auto_852899 ) ) ( not ( = ?auto_852891 ?auto_852900 ) ) ( not ( = ?auto_852891 ?auto_852901 ) ) ( not ( = ?auto_852891 ?auto_852902 ) ) ( not ( = ?auto_852891 ?auto_852903 ) ) ( not ( = ?auto_852891 ?auto_852904 ) ) ( not ( = ?auto_852891 ?auto_852905 ) ) ( not ( = ?auto_852891 ?auto_852906 ) ) ( not ( = ?auto_852891 ?auto_852907 ) ) ( not ( = ?auto_852891 ?auto_852908 ) ) ( not ( = ?auto_852892 ?auto_852893 ) ) ( not ( = ?auto_852892 ?auto_852894 ) ) ( not ( = ?auto_852892 ?auto_852895 ) ) ( not ( = ?auto_852892 ?auto_852896 ) ) ( not ( = ?auto_852892 ?auto_852897 ) ) ( not ( = ?auto_852892 ?auto_852898 ) ) ( not ( = ?auto_852892 ?auto_852899 ) ) ( not ( = ?auto_852892 ?auto_852900 ) ) ( not ( = ?auto_852892 ?auto_852901 ) ) ( not ( = ?auto_852892 ?auto_852902 ) ) ( not ( = ?auto_852892 ?auto_852903 ) ) ( not ( = ?auto_852892 ?auto_852904 ) ) ( not ( = ?auto_852892 ?auto_852905 ) ) ( not ( = ?auto_852892 ?auto_852906 ) ) ( not ( = ?auto_852892 ?auto_852907 ) ) ( not ( = ?auto_852892 ?auto_852908 ) ) ( not ( = ?auto_852893 ?auto_852894 ) ) ( not ( = ?auto_852893 ?auto_852895 ) ) ( not ( = ?auto_852893 ?auto_852896 ) ) ( not ( = ?auto_852893 ?auto_852897 ) ) ( not ( = ?auto_852893 ?auto_852898 ) ) ( not ( = ?auto_852893 ?auto_852899 ) ) ( not ( = ?auto_852893 ?auto_852900 ) ) ( not ( = ?auto_852893 ?auto_852901 ) ) ( not ( = ?auto_852893 ?auto_852902 ) ) ( not ( = ?auto_852893 ?auto_852903 ) ) ( not ( = ?auto_852893 ?auto_852904 ) ) ( not ( = ?auto_852893 ?auto_852905 ) ) ( not ( = ?auto_852893 ?auto_852906 ) ) ( not ( = ?auto_852893 ?auto_852907 ) ) ( not ( = ?auto_852893 ?auto_852908 ) ) ( not ( = ?auto_852894 ?auto_852895 ) ) ( not ( = ?auto_852894 ?auto_852896 ) ) ( not ( = ?auto_852894 ?auto_852897 ) ) ( not ( = ?auto_852894 ?auto_852898 ) ) ( not ( = ?auto_852894 ?auto_852899 ) ) ( not ( = ?auto_852894 ?auto_852900 ) ) ( not ( = ?auto_852894 ?auto_852901 ) ) ( not ( = ?auto_852894 ?auto_852902 ) ) ( not ( = ?auto_852894 ?auto_852903 ) ) ( not ( = ?auto_852894 ?auto_852904 ) ) ( not ( = ?auto_852894 ?auto_852905 ) ) ( not ( = ?auto_852894 ?auto_852906 ) ) ( not ( = ?auto_852894 ?auto_852907 ) ) ( not ( = ?auto_852894 ?auto_852908 ) ) ( not ( = ?auto_852895 ?auto_852896 ) ) ( not ( = ?auto_852895 ?auto_852897 ) ) ( not ( = ?auto_852895 ?auto_852898 ) ) ( not ( = ?auto_852895 ?auto_852899 ) ) ( not ( = ?auto_852895 ?auto_852900 ) ) ( not ( = ?auto_852895 ?auto_852901 ) ) ( not ( = ?auto_852895 ?auto_852902 ) ) ( not ( = ?auto_852895 ?auto_852903 ) ) ( not ( = ?auto_852895 ?auto_852904 ) ) ( not ( = ?auto_852895 ?auto_852905 ) ) ( not ( = ?auto_852895 ?auto_852906 ) ) ( not ( = ?auto_852895 ?auto_852907 ) ) ( not ( = ?auto_852895 ?auto_852908 ) ) ( not ( = ?auto_852896 ?auto_852897 ) ) ( not ( = ?auto_852896 ?auto_852898 ) ) ( not ( = ?auto_852896 ?auto_852899 ) ) ( not ( = ?auto_852896 ?auto_852900 ) ) ( not ( = ?auto_852896 ?auto_852901 ) ) ( not ( = ?auto_852896 ?auto_852902 ) ) ( not ( = ?auto_852896 ?auto_852903 ) ) ( not ( = ?auto_852896 ?auto_852904 ) ) ( not ( = ?auto_852896 ?auto_852905 ) ) ( not ( = ?auto_852896 ?auto_852906 ) ) ( not ( = ?auto_852896 ?auto_852907 ) ) ( not ( = ?auto_852896 ?auto_852908 ) ) ( not ( = ?auto_852897 ?auto_852898 ) ) ( not ( = ?auto_852897 ?auto_852899 ) ) ( not ( = ?auto_852897 ?auto_852900 ) ) ( not ( = ?auto_852897 ?auto_852901 ) ) ( not ( = ?auto_852897 ?auto_852902 ) ) ( not ( = ?auto_852897 ?auto_852903 ) ) ( not ( = ?auto_852897 ?auto_852904 ) ) ( not ( = ?auto_852897 ?auto_852905 ) ) ( not ( = ?auto_852897 ?auto_852906 ) ) ( not ( = ?auto_852897 ?auto_852907 ) ) ( not ( = ?auto_852897 ?auto_852908 ) ) ( not ( = ?auto_852898 ?auto_852899 ) ) ( not ( = ?auto_852898 ?auto_852900 ) ) ( not ( = ?auto_852898 ?auto_852901 ) ) ( not ( = ?auto_852898 ?auto_852902 ) ) ( not ( = ?auto_852898 ?auto_852903 ) ) ( not ( = ?auto_852898 ?auto_852904 ) ) ( not ( = ?auto_852898 ?auto_852905 ) ) ( not ( = ?auto_852898 ?auto_852906 ) ) ( not ( = ?auto_852898 ?auto_852907 ) ) ( not ( = ?auto_852898 ?auto_852908 ) ) ( not ( = ?auto_852899 ?auto_852900 ) ) ( not ( = ?auto_852899 ?auto_852901 ) ) ( not ( = ?auto_852899 ?auto_852902 ) ) ( not ( = ?auto_852899 ?auto_852903 ) ) ( not ( = ?auto_852899 ?auto_852904 ) ) ( not ( = ?auto_852899 ?auto_852905 ) ) ( not ( = ?auto_852899 ?auto_852906 ) ) ( not ( = ?auto_852899 ?auto_852907 ) ) ( not ( = ?auto_852899 ?auto_852908 ) ) ( not ( = ?auto_852900 ?auto_852901 ) ) ( not ( = ?auto_852900 ?auto_852902 ) ) ( not ( = ?auto_852900 ?auto_852903 ) ) ( not ( = ?auto_852900 ?auto_852904 ) ) ( not ( = ?auto_852900 ?auto_852905 ) ) ( not ( = ?auto_852900 ?auto_852906 ) ) ( not ( = ?auto_852900 ?auto_852907 ) ) ( not ( = ?auto_852900 ?auto_852908 ) ) ( not ( = ?auto_852901 ?auto_852902 ) ) ( not ( = ?auto_852901 ?auto_852903 ) ) ( not ( = ?auto_852901 ?auto_852904 ) ) ( not ( = ?auto_852901 ?auto_852905 ) ) ( not ( = ?auto_852901 ?auto_852906 ) ) ( not ( = ?auto_852901 ?auto_852907 ) ) ( not ( = ?auto_852901 ?auto_852908 ) ) ( not ( = ?auto_852902 ?auto_852903 ) ) ( not ( = ?auto_852902 ?auto_852904 ) ) ( not ( = ?auto_852902 ?auto_852905 ) ) ( not ( = ?auto_852902 ?auto_852906 ) ) ( not ( = ?auto_852902 ?auto_852907 ) ) ( not ( = ?auto_852902 ?auto_852908 ) ) ( not ( = ?auto_852903 ?auto_852904 ) ) ( not ( = ?auto_852903 ?auto_852905 ) ) ( not ( = ?auto_852903 ?auto_852906 ) ) ( not ( = ?auto_852903 ?auto_852907 ) ) ( not ( = ?auto_852903 ?auto_852908 ) ) ( not ( = ?auto_852904 ?auto_852905 ) ) ( not ( = ?auto_852904 ?auto_852906 ) ) ( not ( = ?auto_852904 ?auto_852907 ) ) ( not ( = ?auto_852904 ?auto_852908 ) ) ( not ( = ?auto_852905 ?auto_852906 ) ) ( not ( = ?auto_852905 ?auto_852907 ) ) ( not ( = ?auto_852905 ?auto_852908 ) ) ( not ( = ?auto_852906 ?auto_852907 ) ) ( not ( = ?auto_852906 ?auto_852908 ) ) ( not ( = ?auto_852907 ?auto_852908 ) ) ( ON ?auto_852907 ?auto_852908 ) ( CLEAR ?auto_852905 ) ( ON ?auto_852906 ?auto_852907 ) ( CLEAR ?auto_852906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_852891 ?auto_852892 ?auto_852893 ?auto_852894 ?auto_852895 ?auto_852896 ?auto_852897 ?auto_852898 ?auto_852899 ?auto_852900 ?auto_852901 ?auto_852902 ?auto_852903 ?auto_852904 ?auto_852905 ?auto_852906 )
      ( MAKE-18PILE ?auto_852891 ?auto_852892 ?auto_852893 ?auto_852894 ?auto_852895 ?auto_852896 ?auto_852897 ?auto_852898 ?auto_852899 ?auto_852900 ?auto_852901 ?auto_852902 ?auto_852903 ?auto_852904 ?auto_852905 ?auto_852906 ?auto_852907 ?auto_852908 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_852927 - BLOCK
      ?auto_852928 - BLOCK
      ?auto_852929 - BLOCK
      ?auto_852930 - BLOCK
      ?auto_852931 - BLOCK
      ?auto_852932 - BLOCK
      ?auto_852933 - BLOCK
      ?auto_852934 - BLOCK
      ?auto_852935 - BLOCK
      ?auto_852936 - BLOCK
      ?auto_852937 - BLOCK
      ?auto_852938 - BLOCK
      ?auto_852939 - BLOCK
      ?auto_852940 - BLOCK
      ?auto_852941 - BLOCK
      ?auto_852942 - BLOCK
      ?auto_852943 - BLOCK
      ?auto_852944 - BLOCK
    )
    :vars
    (
      ?auto_852945 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_852944 ?auto_852945 ) ( ON-TABLE ?auto_852927 ) ( ON ?auto_852928 ?auto_852927 ) ( ON ?auto_852929 ?auto_852928 ) ( ON ?auto_852930 ?auto_852929 ) ( ON ?auto_852931 ?auto_852930 ) ( ON ?auto_852932 ?auto_852931 ) ( ON ?auto_852933 ?auto_852932 ) ( ON ?auto_852934 ?auto_852933 ) ( ON ?auto_852935 ?auto_852934 ) ( ON ?auto_852936 ?auto_852935 ) ( ON ?auto_852937 ?auto_852936 ) ( ON ?auto_852938 ?auto_852937 ) ( ON ?auto_852939 ?auto_852938 ) ( ON ?auto_852940 ?auto_852939 ) ( not ( = ?auto_852927 ?auto_852928 ) ) ( not ( = ?auto_852927 ?auto_852929 ) ) ( not ( = ?auto_852927 ?auto_852930 ) ) ( not ( = ?auto_852927 ?auto_852931 ) ) ( not ( = ?auto_852927 ?auto_852932 ) ) ( not ( = ?auto_852927 ?auto_852933 ) ) ( not ( = ?auto_852927 ?auto_852934 ) ) ( not ( = ?auto_852927 ?auto_852935 ) ) ( not ( = ?auto_852927 ?auto_852936 ) ) ( not ( = ?auto_852927 ?auto_852937 ) ) ( not ( = ?auto_852927 ?auto_852938 ) ) ( not ( = ?auto_852927 ?auto_852939 ) ) ( not ( = ?auto_852927 ?auto_852940 ) ) ( not ( = ?auto_852927 ?auto_852941 ) ) ( not ( = ?auto_852927 ?auto_852942 ) ) ( not ( = ?auto_852927 ?auto_852943 ) ) ( not ( = ?auto_852927 ?auto_852944 ) ) ( not ( = ?auto_852927 ?auto_852945 ) ) ( not ( = ?auto_852928 ?auto_852929 ) ) ( not ( = ?auto_852928 ?auto_852930 ) ) ( not ( = ?auto_852928 ?auto_852931 ) ) ( not ( = ?auto_852928 ?auto_852932 ) ) ( not ( = ?auto_852928 ?auto_852933 ) ) ( not ( = ?auto_852928 ?auto_852934 ) ) ( not ( = ?auto_852928 ?auto_852935 ) ) ( not ( = ?auto_852928 ?auto_852936 ) ) ( not ( = ?auto_852928 ?auto_852937 ) ) ( not ( = ?auto_852928 ?auto_852938 ) ) ( not ( = ?auto_852928 ?auto_852939 ) ) ( not ( = ?auto_852928 ?auto_852940 ) ) ( not ( = ?auto_852928 ?auto_852941 ) ) ( not ( = ?auto_852928 ?auto_852942 ) ) ( not ( = ?auto_852928 ?auto_852943 ) ) ( not ( = ?auto_852928 ?auto_852944 ) ) ( not ( = ?auto_852928 ?auto_852945 ) ) ( not ( = ?auto_852929 ?auto_852930 ) ) ( not ( = ?auto_852929 ?auto_852931 ) ) ( not ( = ?auto_852929 ?auto_852932 ) ) ( not ( = ?auto_852929 ?auto_852933 ) ) ( not ( = ?auto_852929 ?auto_852934 ) ) ( not ( = ?auto_852929 ?auto_852935 ) ) ( not ( = ?auto_852929 ?auto_852936 ) ) ( not ( = ?auto_852929 ?auto_852937 ) ) ( not ( = ?auto_852929 ?auto_852938 ) ) ( not ( = ?auto_852929 ?auto_852939 ) ) ( not ( = ?auto_852929 ?auto_852940 ) ) ( not ( = ?auto_852929 ?auto_852941 ) ) ( not ( = ?auto_852929 ?auto_852942 ) ) ( not ( = ?auto_852929 ?auto_852943 ) ) ( not ( = ?auto_852929 ?auto_852944 ) ) ( not ( = ?auto_852929 ?auto_852945 ) ) ( not ( = ?auto_852930 ?auto_852931 ) ) ( not ( = ?auto_852930 ?auto_852932 ) ) ( not ( = ?auto_852930 ?auto_852933 ) ) ( not ( = ?auto_852930 ?auto_852934 ) ) ( not ( = ?auto_852930 ?auto_852935 ) ) ( not ( = ?auto_852930 ?auto_852936 ) ) ( not ( = ?auto_852930 ?auto_852937 ) ) ( not ( = ?auto_852930 ?auto_852938 ) ) ( not ( = ?auto_852930 ?auto_852939 ) ) ( not ( = ?auto_852930 ?auto_852940 ) ) ( not ( = ?auto_852930 ?auto_852941 ) ) ( not ( = ?auto_852930 ?auto_852942 ) ) ( not ( = ?auto_852930 ?auto_852943 ) ) ( not ( = ?auto_852930 ?auto_852944 ) ) ( not ( = ?auto_852930 ?auto_852945 ) ) ( not ( = ?auto_852931 ?auto_852932 ) ) ( not ( = ?auto_852931 ?auto_852933 ) ) ( not ( = ?auto_852931 ?auto_852934 ) ) ( not ( = ?auto_852931 ?auto_852935 ) ) ( not ( = ?auto_852931 ?auto_852936 ) ) ( not ( = ?auto_852931 ?auto_852937 ) ) ( not ( = ?auto_852931 ?auto_852938 ) ) ( not ( = ?auto_852931 ?auto_852939 ) ) ( not ( = ?auto_852931 ?auto_852940 ) ) ( not ( = ?auto_852931 ?auto_852941 ) ) ( not ( = ?auto_852931 ?auto_852942 ) ) ( not ( = ?auto_852931 ?auto_852943 ) ) ( not ( = ?auto_852931 ?auto_852944 ) ) ( not ( = ?auto_852931 ?auto_852945 ) ) ( not ( = ?auto_852932 ?auto_852933 ) ) ( not ( = ?auto_852932 ?auto_852934 ) ) ( not ( = ?auto_852932 ?auto_852935 ) ) ( not ( = ?auto_852932 ?auto_852936 ) ) ( not ( = ?auto_852932 ?auto_852937 ) ) ( not ( = ?auto_852932 ?auto_852938 ) ) ( not ( = ?auto_852932 ?auto_852939 ) ) ( not ( = ?auto_852932 ?auto_852940 ) ) ( not ( = ?auto_852932 ?auto_852941 ) ) ( not ( = ?auto_852932 ?auto_852942 ) ) ( not ( = ?auto_852932 ?auto_852943 ) ) ( not ( = ?auto_852932 ?auto_852944 ) ) ( not ( = ?auto_852932 ?auto_852945 ) ) ( not ( = ?auto_852933 ?auto_852934 ) ) ( not ( = ?auto_852933 ?auto_852935 ) ) ( not ( = ?auto_852933 ?auto_852936 ) ) ( not ( = ?auto_852933 ?auto_852937 ) ) ( not ( = ?auto_852933 ?auto_852938 ) ) ( not ( = ?auto_852933 ?auto_852939 ) ) ( not ( = ?auto_852933 ?auto_852940 ) ) ( not ( = ?auto_852933 ?auto_852941 ) ) ( not ( = ?auto_852933 ?auto_852942 ) ) ( not ( = ?auto_852933 ?auto_852943 ) ) ( not ( = ?auto_852933 ?auto_852944 ) ) ( not ( = ?auto_852933 ?auto_852945 ) ) ( not ( = ?auto_852934 ?auto_852935 ) ) ( not ( = ?auto_852934 ?auto_852936 ) ) ( not ( = ?auto_852934 ?auto_852937 ) ) ( not ( = ?auto_852934 ?auto_852938 ) ) ( not ( = ?auto_852934 ?auto_852939 ) ) ( not ( = ?auto_852934 ?auto_852940 ) ) ( not ( = ?auto_852934 ?auto_852941 ) ) ( not ( = ?auto_852934 ?auto_852942 ) ) ( not ( = ?auto_852934 ?auto_852943 ) ) ( not ( = ?auto_852934 ?auto_852944 ) ) ( not ( = ?auto_852934 ?auto_852945 ) ) ( not ( = ?auto_852935 ?auto_852936 ) ) ( not ( = ?auto_852935 ?auto_852937 ) ) ( not ( = ?auto_852935 ?auto_852938 ) ) ( not ( = ?auto_852935 ?auto_852939 ) ) ( not ( = ?auto_852935 ?auto_852940 ) ) ( not ( = ?auto_852935 ?auto_852941 ) ) ( not ( = ?auto_852935 ?auto_852942 ) ) ( not ( = ?auto_852935 ?auto_852943 ) ) ( not ( = ?auto_852935 ?auto_852944 ) ) ( not ( = ?auto_852935 ?auto_852945 ) ) ( not ( = ?auto_852936 ?auto_852937 ) ) ( not ( = ?auto_852936 ?auto_852938 ) ) ( not ( = ?auto_852936 ?auto_852939 ) ) ( not ( = ?auto_852936 ?auto_852940 ) ) ( not ( = ?auto_852936 ?auto_852941 ) ) ( not ( = ?auto_852936 ?auto_852942 ) ) ( not ( = ?auto_852936 ?auto_852943 ) ) ( not ( = ?auto_852936 ?auto_852944 ) ) ( not ( = ?auto_852936 ?auto_852945 ) ) ( not ( = ?auto_852937 ?auto_852938 ) ) ( not ( = ?auto_852937 ?auto_852939 ) ) ( not ( = ?auto_852937 ?auto_852940 ) ) ( not ( = ?auto_852937 ?auto_852941 ) ) ( not ( = ?auto_852937 ?auto_852942 ) ) ( not ( = ?auto_852937 ?auto_852943 ) ) ( not ( = ?auto_852937 ?auto_852944 ) ) ( not ( = ?auto_852937 ?auto_852945 ) ) ( not ( = ?auto_852938 ?auto_852939 ) ) ( not ( = ?auto_852938 ?auto_852940 ) ) ( not ( = ?auto_852938 ?auto_852941 ) ) ( not ( = ?auto_852938 ?auto_852942 ) ) ( not ( = ?auto_852938 ?auto_852943 ) ) ( not ( = ?auto_852938 ?auto_852944 ) ) ( not ( = ?auto_852938 ?auto_852945 ) ) ( not ( = ?auto_852939 ?auto_852940 ) ) ( not ( = ?auto_852939 ?auto_852941 ) ) ( not ( = ?auto_852939 ?auto_852942 ) ) ( not ( = ?auto_852939 ?auto_852943 ) ) ( not ( = ?auto_852939 ?auto_852944 ) ) ( not ( = ?auto_852939 ?auto_852945 ) ) ( not ( = ?auto_852940 ?auto_852941 ) ) ( not ( = ?auto_852940 ?auto_852942 ) ) ( not ( = ?auto_852940 ?auto_852943 ) ) ( not ( = ?auto_852940 ?auto_852944 ) ) ( not ( = ?auto_852940 ?auto_852945 ) ) ( not ( = ?auto_852941 ?auto_852942 ) ) ( not ( = ?auto_852941 ?auto_852943 ) ) ( not ( = ?auto_852941 ?auto_852944 ) ) ( not ( = ?auto_852941 ?auto_852945 ) ) ( not ( = ?auto_852942 ?auto_852943 ) ) ( not ( = ?auto_852942 ?auto_852944 ) ) ( not ( = ?auto_852942 ?auto_852945 ) ) ( not ( = ?auto_852943 ?auto_852944 ) ) ( not ( = ?auto_852943 ?auto_852945 ) ) ( not ( = ?auto_852944 ?auto_852945 ) ) ( ON ?auto_852943 ?auto_852944 ) ( ON ?auto_852942 ?auto_852943 ) ( CLEAR ?auto_852940 ) ( ON ?auto_852941 ?auto_852942 ) ( CLEAR ?auto_852941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_852927 ?auto_852928 ?auto_852929 ?auto_852930 ?auto_852931 ?auto_852932 ?auto_852933 ?auto_852934 ?auto_852935 ?auto_852936 ?auto_852937 ?auto_852938 ?auto_852939 ?auto_852940 ?auto_852941 )
      ( MAKE-18PILE ?auto_852927 ?auto_852928 ?auto_852929 ?auto_852930 ?auto_852931 ?auto_852932 ?auto_852933 ?auto_852934 ?auto_852935 ?auto_852936 ?auto_852937 ?auto_852938 ?auto_852939 ?auto_852940 ?auto_852941 ?auto_852942 ?auto_852943 ?auto_852944 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_852964 - BLOCK
      ?auto_852965 - BLOCK
      ?auto_852966 - BLOCK
      ?auto_852967 - BLOCK
      ?auto_852968 - BLOCK
      ?auto_852969 - BLOCK
      ?auto_852970 - BLOCK
      ?auto_852971 - BLOCK
      ?auto_852972 - BLOCK
      ?auto_852973 - BLOCK
      ?auto_852974 - BLOCK
      ?auto_852975 - BLOCK
      ?auto_852976 - BLOCK
      ?auto_852977 - BLOCK
      ?auto_852978 - BLOCK
      ?auto_852979 - BLOCK
      ?auto_852980 - BLOCK
      ?auto_852981 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_852981 ) ( ON-TABLE ?auto_852964 ) ( ON ?auto_852965 ?auto_852964 ) ( ON ?auto_852966 ?auto_852965 ) ( ON ?auto_852967 ?auto_852966 ) ( ON ?auto_852968 ?auto_852967 ) ( ON ?auto_852969 ?auto_852968 ) ( ON ?auto_852970 ?auto_852969 ) ( ON ?auto_852971 ?auto_852970 ) ( ON ?auto_852972 ?auto_852971 ) ( ON ?auto_852973 ?auto_852972 ) ( ON ?auto_852974 ?auto_852973 ) ( ON ?auto_852975 ?auto_852974 ) ( ON ?auto_852976 ?auto_852975 ) ( ON ?auto_852977 ?auto_852976 ) ( not ( = ?auto_852964 ?auto_852965 ) ) ( not ( = ?auto_852964 ?auto_852966 ) ) ( not ( = ?auto_852964 ?auto_852967 ) ) ( not ( = ?auto_852964 ?auto_852968 ) ) ( not ( = ?auto_852964 ?auto_852969 ) ) ( not ( = ?auto_852964 ?auto_852970 ) ) ( not ( = ?auto_852964 ?auto_852971 ) ) ( not ( = ?auto_852964 ?auto_852972 ) ) ( not ( = ?auto_852964 ?auto_852973 ) ) ( not ( = ?auto_852964 ?auto_852974 ) ) ( not ( = ?auto_852964 ?auto_852975 ) ) ( not ( = ?auto_852964 ?auto_852976 ) ) ( not ( = ?auto_852964 ?auto_852977 ) ) ( not ( = ?auto_852964 ?auto_852978 ) ) ( not ( = ?auto_852964 ?auto_852979 ) ) ( not ( = ?auto_852964 ?auto_852980 ) ) ( not ( = ?auto_852964 ?auto_852981 ) ) ( not ( = ?auto_852965 ?auto_852966 ) ) ( not ( = ?auto_852965 ?auto_852967 ) ) ( not ( = ?auto_852965 ?auto_852968 ) ) ( not ( = ?auto_852965 ?auto_852969 ) ) ( not ( = ?auto_852965 ?auto_852970 ) ) ( not ( = ?auto_852965 ?auto_852971 ) ) ( not ( = ?auto_852965 ?auto_852972 ) ) ( not ( = ?auto_852965 ?auto_852973 ) ) ( not ( = ?auto_852965 ?auto_852974 ) ) ( not ( = ?auto_852965 ?auto_852975 ) ) ( not ( = ?auto_852965 ?auto_852976 ) ) ( not ( = ?auto_852965 ?auto_852977 ) ) ( not ( = ?auto_852965 ?auto_852978 ) ) ( not ( = ?auto_852965 ?auto_852979 ) ) ( not ( = ?auto_852965 ?auto_852980 ) ) ( not ( = ?auto_852965 ?auto_852981 ) ) ( not ( = ?auto_852966 ?auto_852967 ) ) ( not ( = ?auto_852966 ?auto_852968 ) ) ( not ( = ?auto_852966 ?auto_852969 ) ) ( not ( = ?auto_852966 ?auto_852970 ) ) ( not ( = ?auto_852966 ?auto_852971 ) ) ( not ( = ?auto_852966 ?auto_852972 ) ) ( not ( = ?auto_852966 ?auto_852973 ) ) ( not ( = ?auto_852966 ?auto_852974 ) ) ( not ( = ?auto_852966 ?auto_852975 ) ) ( not ( = ?auto_852966 ?auto_852976 ) ) ( not ( = ?auto_852966 ?auto_852977 ) ) ( not ( = ?auto_852966 ?auto_852978 ) ) ( not ( = ?auto_852966 ?auto_852979 ) ) ( not ( = ?auto_852966 ?auto_852980 ) ) ( not ( = ?auto_852966 ?auto_852981 ) ) ( not ( = ?auto_852967 ?auto_852968 ) ) ( not ( = ?auto_852967 ?auto_852969 ) ) ( not ( = ?auto_852967 ?auto_852970 ) ) ( not ( = ?auto_852967 ?auto_852971 ) ) ( not ( = ?auto_852967 ?auto_852972 ) ) ( not ( = ?auto_852967 ?auto_852973 ) ) ( not ( = ?auto_852967 ?auto_852974 ) ) ( not ( = ?auto_852967 ?auto_852975 ) ) ( not ( = ?auto_852967 ?auto_852976 ) ) ( not ( = ?auto_852967 ?auto_852977 ) ) ( not ( = ?auto_852967 ?auto_852978 ) ) ( not ( = ?auto_852967 ?auto_852979 ) ) ( not ( = ?auto_852967 ?auto_852980 ) ) ( not ( = ?auto_852967 ?auto_852981 ) ) ( not ( = ?auto_852968 ?auto_852969 ) ) ( not ( = ?auto_852968 ?auto_852970 ) ) ( not ( = ?auto_852968 ?auto_852971 ) ) ( not ( = ?auto_852968 ?auto_852972 ) ) ( not ( = ?auto_852968 ?auto_852973 ) ) ( not ( = ?auto_852968 ?auto_852974 ) ) ( not ( = ?auto_852968 ?auto_852975 ) ) ( not ( = ?auto_852968 ?auto_852976 ) ) ( not ( = ?auto_852968 ?auto_852977 ) ) ( not ( = ?auto_852968 ?auto_852978 ) ) ( not ( = ?auto_852968 ?auto_852979 ) ) ( not ( = ?auto_852968 ?auto_852980 ) ) ( not ( = ?auto_852968 ?auto_852981 ) ) ( not ( = ?auto_852969 ?auto_852970 ) ) ( not ( = ?auto_852969 ?auto_852971 ) ) ( not ( = ?auto_852969 ?auto_852972 ) ) ( not ( = ?auto_852969 ?auto_852973 ) ) ( not ( = ?auto_852969 ?auto_852974 ) ) ( not ( = ?auto_852969 ?auto_852975 ) ) ( not ( = ?auto_852969 ?auto_852976 ) ) ( not ( = ?auto_852969 ?auto_852977 ) ) ( not ( = ?auto_852969 ?auto_852978 ) ) ( not ( = ?auto_852969 ?auto_852979 ) ) ( not ( = ?auto_852969 ?auto_852980 ) ) ( not ( = ?auto_852969 ?auto_852981 ) ) ( not ( = ?auto_852970 ?auto_852971 ) ) ( not ( = ?auto_852970 ?auto_852972 ) ) ( not ( = ?auto_852970 ?auto_852973 ) ) ( not ( = ?auto_852970 ?auto_852974 ) ) ( not ( = ?auto_852970 ?auto_852975 ) ) ( not ( = ?auto_852970 ?auto_852976 ) ) ( not ( = ?auto_852970 ?auto_852977 ) ) ( not ( = ?auto_852970 ?auto_852978 ) ) ( not ( = ?auto_852970 ?auto_852979 ) ) ( not ( = ?auto_852970 ?auto_852980 ) ) ( not ( = ?auto_852970 ?auto_852981 ) ) ( not ( = ?auto_852971 ?auto_852972 ) ) ( not ( = ?auto_852971 ?auto_852973 ) ) ( not ( = ?auto_852971 ?auto_852974 ) ) ( not ( = ?auto_852971 ?auto_852975 ) ) ( not ( = ?auto_852971 ?auto_852976 ) ) ( not ( = ?auto_852971 ?auto_852977 ) ) ( not ( = ?auto_852971 ?auto_852978 ) ) ( not ( = ?auto_852971 ?auto_852979 ) ) ( not ( = ?auto_852971 ?auto_852980 ) ) ( not ( = ?auto_852971 ?auto_852981 ) ) ( not ( = ?auto_852972 ?auto_852973 ) ) ( not ( = ?auto_852972 ?auto_852974 ) ) ( not ( = ?auto_852972 ?auto_852975 ) ) ( not ( = ?auto_852972 ?auto_852976 ) ) ( not ( = ?auto_852972 ?auto_852977 ) ) ( not ( = ?auto_852972 ?auto_852978 ) ) ( not ( = ?auto_852972 ?auto_852979 ) ) ( not ( = ?auto_852972 ?auto_852980 ) ) ( not ( = ?auto_852972 ?auto_852981 ) ) ( not ( = ?auto_852973 ?auto_852974 ) ) ( not ( = ?auto_852973 ?auto_852975 ) ) ( not ( = ?auto_852973 ?auto_852976 ) ) ( not ( = ?auto_852973 ?auto_852977 ) ) ( not ( = ?auto_852973 ?auto_852978 ) ) ( not ( = ?auto_852973 ?auto_852979 ) ) ( not ( = ?auto_852973 ?auto_852980 ) ) ( not ( = ?auto_852973 ?auto_852981 ) ) ( not ( = ?auto_852974 ?auto_852975 ) ) ( not ( = ?auto_852974 ?auto_852976 ) ) ( not ( = ?auto_852974 ?auto_852977 ) ) ( not ( = ?auto_852974 ?auto_852978 ) ) ( not ( = ?auto_852974 ?auto_852979 ) ) ( not ( = ?auto_852974 ?auto_852980 ) ) ( not ( = ?auto_852974 ?auto_852981 ) ) ( not ( = ?auto_852975 ?auto_852976 ) ) ( not ( = ?auto_852975 ?auto_852977 ) ) ( not ( = ?auto_852975 ?auto_852978 ) ) ( not ( = ?auto_852975 ?auto_852979 ) ) ( not ( = ?auto_852975 ?auto_852980 ) ) ( not ( = ?auto_852975 ?auto_852981 ) ) ( not ( = ?auto_852976 ?auto_852977 ) ) ( not ( = ?auto_852976 ?auto_852978 ) ) ( not ( = ?auto_852976 ?auto_852979 ) ) ( not ( = ?auto_852976 ?auto_852980 ) ) ( not ( = ?auto_852976 ?auto_852981 ) ) ( not ( = ?auto_852977 ?auto_852978 ) ) ( not ( = ?auto_852977 ?auto_852979 ) ) ( not ( = ?auto_852977 ?auto_852980 ) ) ( not ( = ?auto_852977 ?auto_852981 ) ) ( not ( = ?auto_852978 ?auto_852979 ) ) ( not ( = ?auto_852978 ?auto_852980 ) ) ( not ( = ?auto_852978 ?auto_852981 ) ) ( not ( = ?auto_852979 ?auto_852980 ) ) ( not ( = ?auto_852979 ?auto_852981 ) ) ( not ( = ?auto_852980 ?auto_852981 ) ) ( ON ?auto_852980 ?auto_852981 ) ( ON ?auto_852979 ?auto_852980 ) ( CLEAR ?auto_852977 ) ( ON ?auto_852978 ?auto_852979 ) ( CLEAR ?auto_852978 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_852964 ?auto_852965 ?auto_852966 ?auto_852967 ?auto_852968 ?auto_852969 ?auto_852970 ?auto_852971 ?auto_852972 ?auto_852973 ?auto_852974 ?auto_852975 ?auto_852976 ?auto_852977 ?auto_852978 )
      ( MAKE-18PILE ?auto_852964 ?auto_852965 ?auto_852966 ?auto_852967 ?auto_852968 ?auto_852969 ?auto_852970 ?auto_852971 ?auto_852972 ?auto_852973 ?auto_852974 ?auto_852975 ?auto_852976 ?auto_852977 ?auto_852978 ?auto_852979 ?auto_852980 ?auto_852981 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_853000 - BLOCK
      ?auto_853001 - BLOCK
      ?auto_853002 - BLOCK
      ?auto_853003 - BLOCK
      ?auto_853004 - BLOCK
      ?auto_853005 - BLOCK
      ?auto_853006 - BLOCK
      ?auto_853007 - BLOCK
      ?auto_853008 - BLOCK
      ?auto_853009 - BLOCK
      ?auto_853010 - BLOCK
      ?auto_853011 - BLOCK
      ?auto_853012 - BLOCK
      ?auto_853013 - BLOCK
      ?auto_853014 - BLOCK
      ?auto_853015 - BLOCK
      ?auto_853016 - BLOCK
      ?auto_853017 - BLOCK
    )
    :vars
    (
      ?auto_853018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_853017 ?auto_853018 ) ( ON-TABLE ?auto_853000 ) ( ON ?auto_853001 ?auto_853000 ) ( ON ?auto_853002 ?auto_853001 ) ( ON ?auto_853003 ?auto_853002 ) ( ON ?auto_853004 ?auto_853003 ) ( ON ?auto_853005 ?auto_853004 ) ( ON ?auto_853006 ?auto_853005 ) ( ON ?auto_853007 ?auto_853006 ) ( ON ?auto_853008 ?auto_853007 ) ( ON ?auto_853009 ?auto_853008 ) ( ON ?auto_853010 ?auto_853009 ) ( ON ?auto_853011 ?auto_853010 ) ( ON ?auto_853012 ?auto_853011 ) ( not ( = ?auto_853000 ?auto_853001 ) ) ( not ( = ?auto_853000 ?auto_853002 ) ) ( not ( = ?auto_853000 ?auto_853003 ) ) ( not ( = ?auto_853000 ?auto_853004 ) ) ( not ( = ?auto_853000 ?auto_853005 ) ) ( not ( = ?auto_853000 ?auto_853006 ) ) ( not ( = ?auto_853000 ?auto_853007 ) ) ( not ( = ?auto_853000 ?auto_853008 ) ) ( not ( = ?auto_853000 ?auto_853009 ) ) ( not ( = ?auto_853000 ?auto_853010 ) ) ( not ( = ?auto_853000 ?auto_853011 ) ) ( not ( = ?auto_853000 ?auto_853012 ) ) ( not ( = ?auto_853000 ?auto_853013 ) ) ( not ( = ?auto_853000 ?auto_853014 ) ) ( not ( = ?auto_853000 ?auto_853015 ) ) ( not ( = ?auto_853000 ?auto_853016 ) ) ( not ( = ?auto_853000 ?auto_853017 ) ) ( not ( = ?auto_853000 ?auto_853018 ) ) ( not ( = ?auto_853001 ?auto_853002 ) ) ( not ( = ?auto_853001 ?auto_853003 ) ) ( not ( = ?auto_853001 ?auto_853004 ) ) ( not ( = ?auto_853001 ?auto_853005 ) ) ( not ( = ?auto_853001 ?auto_853006 ) ) ( not ( = ?auto_853001 ?auto_853007 ) ) ( not ( = ?auto_853001 ?auto_853008 ) ) ( not ( = ?auto_853001 ?auto_853009 ) ) ( not ( = ?auto_853001 ?auto_853010 ) ) ( not ( = ?auto_853001 ?auto_853011 ) ) ( not ( = ?auto_853001 ?auto_853012 ) ) ( not ( = ?auto_853001 ?auto_853013 ) ) ( not ( = ?auto_853001 ?auto_853014 ) ) ( not ( = ?auto_853001 ?auto_853015 ) ) ( not ( = ?auto_853001 ?auto_853016 ) ) ( not ( = ?auto_853001 ?auto_853017 ) ) ( not ( = ?auto_853001 ?auto_853018 ) ) ( not ( = ?auto_853002 ?auto_853003 ) ) ( not ( = ?auto_853002 ?auto_853004 ) ) ( not ( = ?auto_853002 ?auto_853005 ) ) ( not ( = ?auto_853002 ?auto_853006 ) ) ( not ( = ?auto_853002 ?auto_853007 ) ) ( not ( = ?auto_853002 ?auto_853008 ) ) ( not ( = ?auto_853002 ?auto_853009 ) ) ( not ( = ?auto_853002 ?auto_853010 ) ) ( not ( = ?auto_853002 ?auto_853011 ) ) ( not ( = ?auto_853002 ?auto_853012 ) ) ( not ( = ?auto_853002 ?auto_853013 ) ) ( not ( = ?auto_853002 ?auto_853014 ) ) ( not ( = ?auto_853002 ?auto_853015 ) ) ( not ( = ?auto_853002 ?auto_853016 ) ) ( not ( = ?auto_853002 ?auto_853017 ) ) ( not ( = ?auto_853002 ?auto_853018 ) ) ( not ( = ?auto_853003 ?auto_853004 ) ) ( not ( = ?auto_853003 ?auto_853005 ) ) ( not ( = ?auto_853003 ?auto_853006 ) ) ( not ( = ?auto_853003 ?auto_853007 ) ) ( not ( = ?auto_853003 ?auto_853008 ) ) ( not ( = ?auto_853003 ?auto_853009 ) ) ( not ( = ?auto_853003 ?auto_853010 ) ) ( not ( = ?auto_853003 ?auto_853011 ) ) ( not ( = ?auto_853003 ?auto_853012 ) ) ( not ( = ?auto_853003 ?auto_853013 ) ) ( not ( = ?auto_853003 ?auto_853014 ) ) ( not ( = ?auto_853003 ?auto_853015 ) ) ( not ( = ?auto_853003 ?auto_853016 ) ) ( not ( = ?auto_853003 ?auto_853017 ) ) ( not ( = ?auto_853003 ?auto_853018 ) ) ( not ( = ?auto_853004 ?auto_853005 ) ) ( not ( = ?auto_853004 ?auto_853006 ) ) ( not ( = ?auto_853004 ?auto_853007 ) ) ( not ( = ?auto_853004 ?auto_853008 ) ) ( not ( = ?auto_853004 ?auto_853009 ) ) ( not ( = ?auto_853004 ?auto_853010 ) ) ( not ( = ?auto_853004 ?auto_853011 ) ) ( not ( = ?auto_853004 ?auto_853012 ) ) ( not ( = ?auto_853004 ?auto_853013 ) ) ( not ( = ?auto_853004 ?auto_853014 ) ) ( not ( = ?auto_853004 ?auto_853015 ) ) ( not ( = ?auto_853004 ?auto_853016 ) ) ( not ( = ?auto_853004 ?auto_853017 ) ) ( not ( = ?auto_853004 ?auto_853018 ) ) ( not ( = ?auto_853005 ?auto_853006 ) ) ( not ( = ?auto_853005 ?auto_853007 ) ) ( not ( = ?auto_853005 ?auto_853008 ) ) ( not ( = ?auto_853005 ?auto_853009 ) ) ( not ( = ?auto_853005 ?auto_853010 ) ) ( not ( = ?auto_853005 ?auto_853011 ) ) ( not ( = ?auto_853005 ?auto_853012 ) ) ( not ( = ?auto_853005 ?auto_853013 ) ) ( not ( = ?auto_853005 ?auto_853014 ) ) ( not ( = ?auto_853005 ?auto_853015 ) ) ( not ( = ?auto_853005 ?auto_853016 ) ) ( not ( = ?auto_853005 ?auto_853017 ) ) ( not ( = ?auto_853005 ?auto_853018 ) ) ( not ( = ?auto_853006 ?auto_853007 ) ) ( not ( = ?auto_853006 ?auto_853008 ) ) ( not ( = ?auto_853006 ?auto_853009 ) ) ( not ( = ?auto_853006 ?auto_853010 ) ) ( not ( = ?auto_853006 ?auto_853011 ) ) ( not ( = ?auto_853006 ?auto_853012 ) ) ( not ( = ?auto_853006 ?auto_853013 ) ) ( not ( = ?auto_853006 ?auto_853014 ) ) ( not ( = ?auto_853006 ?auto_853015 ) ) ( not ( = ?auto_853006 ?auto_853016 ) ) ( not ( = ?auto_853006 ?auto_853017 ) ) ( not ( = ?auto_853006 ?auto_853018 ) ) ( not ( = ?auto_853007 ?auto_853008 ) ) ( not ( = ?auto_853007 ?auto_853009 ) ) ( not ( = ?auto_853007 ?auto_853010 ) ) ( not ( = ?auto_853007 ?auto_853011 ) ) ( not ( = ?auto_853007 ?auto_853012 ) ) ( not ( = ?auto_853007 ?auto_853013 ) ) ( not ( = ?auto_853007 ?auto_853014 ) ) ( not ( = ?auto_853007 ?auto_853015 ) ) ( not ( = ?auto_853007 ?auto_853016 ) ) ( not ( = ?auto_853007 ?auto_853017 ) ) ( not ( = ?auto_853007 ?auto_853018 ) ) ( not ( = ?auto_853008 ?auto_853009 ) ) ( not ( = ?auto_853008 ?auto_853010 ) ) ( not ( = ?auto_853008 ?auto_853011 ) ) ( not ( = ?auto_853008 ?auto_853012 ) ) ( not ( = ?auto_853008 ?auto_853013 ) ) ( not ( = ?auto_853008 ?auto_853014 ) ) ( not ( = ?auto_853008 ?auto_853015 ) ) ( not ( = ?auto_853008 ?auto_853016 ) ) ( not ( = ?auto_853008 ?auto_853017 ) ) ( not ( = ?auto_853008 ?auto_853018 ) ) ( not ( = ?auto_853009 ?auto_853010 ) ) ( not ( = ?auto_853009 ?auto_853011 ) ) ( not ( = ?auto_853009 ?auto_853012 ) ) ( not ( = ?auto_853009 ?auto_853013 ) ) ( not ( = ?auto_853009 ?auto_853014 ) ) ( not ( = ?auto_853009 ?auto_853015 ) ) ( not ( = ?auto_853009 ?auto_853016 ) ) ( not ( = ?auto_853009 ?auto_853017 ) ) ( not ( = ?auto_853009 ?auto_853018 ) ) ( not ( = ?auto_853010 ?auto_853011 ) ) ( not ( = ?auto_853010 ?auto_853012 ) ) ( not ( = ?auto_853010 ?auto_853013 ) ) ( not ( = ?auto_853010 ?auto_853014 ) ) ( not ( = ?auto_853010 ?auto_853015 ) ) ( not ( = ?auto_853010 ?auto_853016 ) ) ( not ( = ?auto_853010 ?auto_853017 ) ) ( not ( = ?auto_853010 ?auto_853018 ) ) ( not ( = ?auto_853011 ?auto_853012 ) ) ( not ( = ?auto_853011 ?auto_853013 ) ) ( not ( = ?auto_853011 ?auto_853014 ) ) ( not ( = ?auto_853011 ?auto_853015 ) ) ( not ( = ?auto_853011 ?auto_853016 ) ) ( not ( = ?auto_853011 ?auto_853017 ) ) ( not ( = ?auto_853011 ?auto_853018 ) ) ( not ( = ?auto_853012 ?auto_853013 ) ) ( not ( = ?auto_853012 ?auto_853014 ) ) ( not ( = ?auto_853012 ?auto_853015 ) ) ( not ( = ?auto_853012 ?auto_853016 ) ) ( not ( = ?auto_853012 ?auto_853017 ) ) ( not ( = ?auto_853012 ?auto_853018 ) ) ( not ( = ?auto_853013 ?auto_853014 ) ) ( not ( = ?auto_853013 ?auto_853015 ) ) ( not ( = ?auto_853013 ?auto_853016 ) ) ( not ( = ?auto_853013 ?auto_853017 ) ) ( not ( = ?auto_853013 ?auto_853018 ) ) ( not ( = ?auto_853014 ?auto_853015 ) ) ( not ( = ?auto_853014 ?auto_853016 ) ) ( not ( = ?auto_853014 ?auto_853017 ) ) ( not ( = ?auto_853014 ?auto_853018 ) ) ( not ( = ?auto_853015 ?auto_853016 ) ) ( not ( = ?auto_853015 ?auto_853017 ) ) ( not ( = ?auto_853015 ?auto_853018 ) ) ( not ( = ?auto_853016 ?auto_853017 ) ) ( not ( = ?auto_853016 ?auto_853018 ) ) ( not ( = ?auto_853017 ?auto_853018 ) ) ( ON ?auto_853016 ?auto_853017 ) ( ON ?auto_853015 ?auto_853016 ) ( ON ?auto_853014 ?auto_853015 ) ( CLEAR ?auto_853012 ) ( ON ?auto_853013 ?auto_853014 ) ( CLEAR ?auto_853013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_853000 ?auto_853001 ?auto_853002 ?auto_853003 ?auto_853004 ?auto_853005 ?auto_853006 ?auto_853007 ?auto_853008 ?auto_853009 ?auto_853010 ?auto_853011 ?auto_853012 ?auto_853013 )
      ( MAKE-18PILE ?auto_853000 ?auto_853001 ?auto_853002 ?auto_853003 ?auto_853004 ?auto_853005 ?auto_853006 ?auto_853007 ?auto_853008 ?auto_853009 ?auto_853010 ?auto_853011 ?auto_853012 ?auto_853013 ?auto_853014 ?auto_853015 ?auto_853016 ?auto_853017 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_853037 - BLOCK
      ?auto_853038 - BLOCK
      ?auto_853039 - BLOCK
      ?auto_853040 - BLOCK
      ?auto_853041 - BLOCK
      ?auto_853042 - BLOCK
      ?auto_853043 - BLOCK
      ?auto_853044 - BLOCK
      ?auto_853045 - BLOCK
      ?auto_853046 - BLOCK
      ?auto_853047 - BLOCK
      ?auto_853048 - BLOCK
      ?auto_853049 - BLOCK
      ?auto_853050 - BLOCK
      ?auto_853051 - BLOCK
      ?auto_853052 - BLOCK
      ?auto_853053 - BLOCK
      ?auto_853054 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_853054 ) ( ON-TABLE ?auto_853037 ) ( ON ?auto_853038 ?auto_853037 ) ( ON ?auto_853039 ?auto_853038 ) ( ON ?auto_853040 ?auto_853039 ) ( ON ?auto_853041 ?auto_853040 ) ( ON ?auto_853042 ?auto_853041 ) ( ON ?auto_853043 ?auto_853042 ) ( ON ?auto_853044 ?auto_853043 ) ( ON ?auto_853045 ?auto_853044 ) ( ON ?auto_853046 ?auto_853045 ) ( ON ?auto_853047 ?auto_853046 ) ( ON ?auto_853048 ?auto_853047 ) ( ON ?auto_853049 ?auto_853048 ) ( not ( = ?auto_853037 ?auto_853038 ) ) ( not ( = ?auto_853037 ?auto_853039 ) ) ( not ( = ?auto_853037 ?auto_853040 ) ) ( not ( = ?auto_853037 ?auto_853041 ) ) ( not ( = ?auto_853037 ?auto_853042 ) ) ( not ( = ?auto_853037 ?auto_853043 ) ) ( not ( = ?auto_853037 ?auto_853044 ) ) ( not ( = ?auto_853037 ?auto_853045 ) ) ( not ( = ?auto_853037 ?auto_853046 ) ) ( not ( = ?auto_853037 ?auto_853047 ) ) ( not ( = ?auto_853037 ?auto_853048 ) ) ( not ( = ?auto_853037 ?auto_853049 ) ) ( not ( = ?auto_853037 ?auto_853050 ) ) ( not ( = ?auto_853037 ?auto_853051 ) ) ( not ( = ?auto_853037 ?auto_853052 ) ) ( not ( = ?auto_853037 ?auto_853053 ) ) ( not ( = ?auto_853037 ?auto_853054 ) ) ( not ( = ?auto_853038 ?auto_853039 ) ) ( not ( = ?auto_853038 ?auto_853040 ) ) ( not ( = ?auto_853038 ?auto_853041 ) ) ( not ( = ?auto_853038 ?auto_853042 ) ) ( not ( = ?auto_853038 ?auto_853043 ) ) ( not ( = ?auto_853038 ?auto_853044 ) ) ( not ( = ?auto_853038 ?auto_853045 ) ) ( not ( = ?auto_853038 ?auto_853046 ) ) ( not ( = ?auto_853038 ?auto_853047 ) ) ( not ( = ?auto_853038 ?auto_853048 ) ) ( not ( = ?auto_853038 ?auto_853049 ) ) ( not ( = ?auto_853038 ?auto_853050 ) ) ( not ( = ?auto_853038 ?auto_853051 ) ) ( not ( = ?auto_853038 ?auto_853052 ) ) ( not ( = ?auto_853038 ?auto_853053 ) ) ( not ( = ?auto_853038 ?auto_853054 ) ) ( not ( = ?auto_853039 ?auto_853040 ) ) ( not ( = ?auto_853039 ?auto_853041 ) ) ( not ( = ?auto_853039 ?auto_853042 ) ) ( not ( = ?auto_853039 ?auto_853043 ) ) ( not ( = ?auto_853039 ?auto_853044 ) ) ( not ( = ?auto_853039 ?auto_853045 ) ) ( not ( = ?auto_853039 ?auto_853046 ) ) ( not ( = ?auto_853039 ?auto_853047 ) ) ( not ( = ?auto_853039 ?auto_853048 ) ) ( not ( = ?auto_853039 ?auto_853049 ) ) ( not ( = ?auto_853039 ?auto_853050 ) ) ( not ( = ?auto_853039 ?auto_853051 ) ) ( not ( = ?auto_853039 ?auto_853052 ) ) ( not ( = ?auto_853039 ?auto_853053 ) ) ( not ( = ?auto_853039 ?auto_853054 ) ) ( not ( = ?auto_853040 ?auto_853041 ) ) ( not ( = ?auto_853040 ?auto_853042 ) ) ( not ( = ?auto_853040 ?auto_853043 ) ) ( not ( = ?auto_853040 ?auto_853044 ) ) ( not ( = ?auto_853040 ?auto_853045 ) ) ( not ( = ?auto_853040 ?auto_853046 ) ) ( not ( = ?auto_853040 ?auto_853047 ) ) ( not ( = ?auto_853040 ?auto_853048 ) ) ( not ( = ?auto_853040 ?auto_853049 ) ) ( not ( = ?auto_853040 ?auto_853050 ) ) ( not ( = ?auto_853040 ?auto_853051 ) ) ( not ( = ?auto_853040 ?auto_853052 ) ) ( not ( = ?auto_853040 ?auto_853053 ) ) ( not ( = ?auto_853040 ?auto_853054 ) ) ( not ( = ?auto_853041 ?auto_853042 ) ) ( not ( = ?auto_853041 ?auto_853043 ) ) ( not ( = ?auto_853041 ?auto_853044 ) ) ( not ( = ?auto_853041 ?auto_853045 ) ) ( not ( = ?auto_853041 ?auto_853046 ) ) ( not ( = ?auto_853041 ?auto_853047 ) ) ( not ( = ?auto_853041 ?auto_853048 ) ) ( not ( = ?auto_853041 ?auto_853049 ) ) ( not ( = ?auto_853041 ?auto_853050 ) ) ( not ( = ?auto_853041 ?auto_853051 ) ) ( not ( = ?auto_853041 ?auto_853052 ) ) ( not ( = ?auto_853041 ?auto_853053 ) ) ( not ( = ?auto_853041 ?auto_853054 ) ) ( not ( = ?auto_853042 ?auto_853043 ) ) ( not ( = ?auto_853042 ?auto_853044 ) ) ( not ( = ?auto_853042 ?auto_853045 ) ) ( not ( = ?auto_853042 ?auto_853046 ) ) ( not ( = ?auto_853042 ?auto_853047 ) ) ( not ( = ?auto_853042 ?auto_853048 ) ) ( not ( = ?auto_853042 ?auto_853049 ) ) ( not ( = ?auto_853042 ?auto_853050 ) ) ( not ( = ?auto_853042 ?auto_853051 ) ) ( not ( = ?auto_853042 ?auto_853052 ) ) ( not ( = ?auto_853042 ?auto_853053 ) ) ( not ( = ?auto_853042 ?auto_853054 ) ) ( not ( = ?auto_853043 ?auto_853044 ) ) ( not ( = ?auto_853043 ?auto_853045 ) ) ( not ( = ?auto_853043 ?auto_853046 ) ) ( not ( = ?auto_853043 ?auto_853047 ) ) ( not ( = ?auto_853043 ?auto_853048 ) ) ( not ( = ?auto_853043 ?auto_853049 ) ) ( not ( = ?auto_853043 ?auto_853050 ) ) ( not ( = ?auto_853043 ?auto_853051 ) ) ( not ( = ?auto_853043 ?auto_853052 ) ) ( not ( = ?auto_853043 ?auto_853053 ) ) ( not ( = ?auto_853043 ?auto_853054 ) ) ( not ( = ?auto_853044 ?auto_853045 ) ) ( not ( = ?auto_853044 ?auto_853046 ) ) ( not ( = ?auto_853044 ?auto_853047 ) ) ( not ( = ?auto_853044 ?auto_853048 ) ) ( not ( = ?auto_853044 ?auto_853049 ) ) ( not ( = ?auto_853044 ?auto_853050 ) ) ( not ( = ?auto_853044 ?auto_853051 ) ) ( not ( = ?auto_853044 ?auto_853052 ) ) ( not ( = ?auto_853044 ?auto_853053 ) ) ( not ( = ?auto_853044 ?auto_853054 ) ) ( not ( = ?auto_853045 ?auto_853046 ) ) ( not ( = ?auto_853045 ?auto_853047 ) ) ( not ( = ?auto_853045 ?auto_853048 ) ) ( not ( = ?auto_853045 ?auto_853049 ) ) ( not ( = ?auto_853045 ?auto_853050 ) ) ( not ( = ?auto_853045 ?auto_853051 ) ) ( not ( = ?auto_853045 ?auto_853052 ) ) ( not ( = ?auto_853045 ?auto_853053 ) ) ( not ( = ?auto_853045 ?auto_853054 ) ) ( not ( = ?auto_853046 ?auto_853047 ) ) ( not ( = ?auto_853046 ?auto_853048 ) ) ( not ( = ?auto_853046 ?auto_853049 ) ) ( not ( = ?auto_853046 ?auto_853050 ) ) ( not ( = ?auto_853046 ?auto_853051 ) ) ( not ( = ?auto_853046 ?auto_853052 ) ) ( not ( = ?auto_853046 ?auto_853053 ) ) ( not ( = ?auto_853046 ?auto_853054 ) ) ( not ( = ?auto_853047 ?auto_853048 ) ) ( not ( = ?auto_853047 ?auto_853049 ) ) ( not ( = ?auto_853047 ?auto_853050 ) ) ( not ( = ?auto_853047 ?auto_853051 ) ) ( not ( = ?auto_853047 ?auto_853052 ) ) ( not ( = ?auto_853047 ?auto_853053 ) ) ( not ( = ?auto_853047 ?auto_853054 ) ) ( not ( = ?auto_853048 ?auto_853049 ) ) ( not ( = ?auto_853048 ?auto_853050 ) ) ( not ( = ?auto_853048 ?auto_853051 ) ) ( not ( = ?auto_853048 ?auto_853052 ) ) ( not ( = ?auto_853048 ?auto_853053 ) ) ( not ( = ?auto_853048 ?auto_853054 ) ) ( not ( = ?auto_853049 ?auto_853050 ) ) ( not ( = ?auto_853049 ?auto_853051 ) ) ( not ( = ?auto_853049 ?auto_853052 ) ) ( not ( = ?auto_853049 ?auto_853053 ) ) ( not ( = ?auto_853049 ?auto_853054 ) ) ( not ( = ?auto_853050 ?auto_853051 ) ) ( not ( = ?auto_853050 ?auto_853052 ) ) ( not ( = ?auto_853050 ?auto_853053 ) ) ( not ( = ?auto_853050 ?auto_853054 ) ) ( not ( = ?auto_853051 ?auto_853052 ) ) ( not ( = ?auto_853051 ?auto_853053 ) ) ( not ( = ?auto_853051 ?auto_853054 ) ) ( not ( = ?auto_853052 ?auto_853053 ) ) ( not ( = ?auto_853052 ?auto_853054 ) ) ( not ( = ?auto_853053 ?auto_853054 ) ) ( ON ?auto_853053 ?auto_853054 ) ( ON ?auto_853052 ?auto_853053 ) ( ON ?auto_853051 ?auto_853052 ) ( CLEAR ?auto_853049 ) ( ON ?auto_853050 ?auto_853051 ) ( CLEAR ?auto_853050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_853037 ?auto_853038 ?auto_853039 ?auto_853040 ?auto_853041 ?auto_853042 ?auto_853043 ?auto_853044 ?auto_853045 ?auto_853046 ?auto_853047 ?auto_853048 ?auto_853049 ?auto_853050 )
      ( MAKE-18PILE ?auto_853037 ?auto_853038 ?auto_853039 ?auto_853040 ?auto_853041 ?auto_853042 ?auto_853043 ?auto_853044 ?auto_853045 ?auto_853046 ?auto_853047 ?auto_853048 ?auto_853049 ?auto_853050 ?auto_853051 ?auto_853052 ?auto_853053 ?auto_853054 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_853073 - BLOCK
      ?auto_853074 - BLOCK
      ?auto_853075 - BLOCK
      ?auto_853076 - BLOCK
      ?auto_853077 - BLOCK
      ?auto_853078 - BLOCK
      ?auto_853079 - BLOCK
      ?auto_853080 - BLOCK
      ?auto_853081 - BLOCK
      ?auto_853082 - BLOCK
      ?auto_853083 - BLOCK
      ?auto_853084 - BLOCK
      ?auto_853085 - BLOCK
      ?auto_853086 - BLOCK
      ?auto_853087 - BLOCK
      ?auto_853088 - BLOCK
      ?auto_853089 - BLOCK
      ?auto_853090 - BLOCK
    )
    :vars
    (
      ?auto_853091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_853090 ?auto_853091 ) ( ON-TABLE ?auto_853073 ) ( ON ?auto_853074 ?auto_853073 ) ( ON ?auto_853075 ?auto_853074 ) ( ON ?auto_853076 ?auto_853075 ) ( ON ?auto_853077 ?auto_853076 ) ( ON ?auto_853078 ?auto_853077 ) ( ON ?auto_853079 ?auto_853078 ) ( ON ?auto_853080 ?auto_853079 ) ( ON ?auto_853081 ?auto_853080 ) ( ON ?auto_853082 ?auto_853081 ) ( ON ?auto_853083 ?auto_853082 ) ( ON ?auto_853084 ?auto_853083 ) ( not ( = ?auto_853073 ?auto_853074 ) ) ( not ( = ?auto_853073 ?auto_853075 ) ) ( not ( = ?auto_853073 ?auto_853076 ) ) ( not ( = ?auto_853073 ?auto_853077 ) ) ( not ( = ?auto_853073 ?auto_853078 ) ) ( not ( = ?auto_853073 ?auto_853079 ) ) ( not ( = ?auto_853073 ?auto_853080 ) ) ( not ( = ?auto_853073 ?auto_853081 ) ) ( not ( = ?auto_853073 ?auto_853082 ) ) ( not ( = ?auto_853073 ?auto_853083 ) ) ( not ( = ?auto_853073 ?auto_853084 ) ) ( not ( = ?auto_853073 ?auto_853085 ) ) ( not ( = ?auto_853073 ?auto_853086 ) ) ( not ( = ?auto_853073 ?auto_853087 ) ) ( not ( = ?auto_853073 ?auto_853088 ) ) ( not ( = ?auto_853073 ?auto_853089 ) ) ( not ( = ?auto_853073 ?auto_853090 ) ) ( not ( = ?auto_853073 ?auto_853091 ) ) ( not ( = ?auto_853074 ?auto_853075 ) ) ( not ( = ?auto_853074 ?auto_853076 ) ) ( not ( = ?auto_853074 ?auto_853077 ) ) ( not ( = ?auto_853074 ?auto_853078 ) ) ( not ( = ?auto_853074 ?auto_853079 ) ) ( not ( = ?auto_853074 ?auto_853080 ) ) ( not ( = ?auto_853074 ?auto_853081 ) ) ( not ( = ?auto_853074 ?auto_853082 ) ) ( not ( = ?auto_853074 ?auto_853083 ) ) ( not ( = ?auto_853074 ?auto_853084 ) ) ( not ( = ?auto_853074 ?auto_853085 ) ) ( not ( = ?auto_853074 ?auto_853086 ) ) ( not ( = ?auto_853074 ?auto_853087 ) ) ( not ( = ?auto_853074 ?auto_853088 ) ) ( not ( = ?auto_853074 ?auto_853089 ) ) ( not ( = ?auto_853074 ?auto_853090 ) ) ( not ( = ?auto_853074 ?auto_853091 ) ) ( not ( = ?auto_853075 ?auto_853076 ) ) ( not ( = ?auto_853075 ?auto_853077 ) ) ( not ( = ?auto_853075 ?auto_853078 ) ) ( not ( = ?auto_853075 ?auto_853079 ) ) ( not ( = ?auto_853075 ?auto_853080 ) ) ( not ( = ?auto_853075 ?auto_853081 ) ) ( not ( = ?auto_853075 ?auto_853082 ) ) ( not ( = ?auto_853075 ?auto_853083 ) ) ( not ( = ?auto_853075 ?auto_853084 ) ) ( not ( = ?auto_853075 ?auto_853085 ) ) ( not ( = ?auto_853075 ?auto_853086 ) ) ( not ( = ?auto_853075 ?auto_853087 ) ) ( not ( = ?auto_853075 ?auto_853088 ) ) ( not ( = ?auto_853075 ?auto_853089 ) ) ( not ( = ?auto_853075 ?auto_853090 ) ) ( not ( = ?auto_853075 ?auto_853091 ) ) ( not ( = ?auto_853076 ?auto_853077 ) ) ( not ( = ?auto_853076 ?auto_853078 ) ) ( not ( = ?auto_853076 ?auto_853079 ) ) ( not ( = ?auto_853076 ?auto_853080 ) ) ( not ( = ?auto_853076 ?auto_853081 ) ) ( not ( = ?auto_853076 ?auto_853082 ) ) ( not ( = ?auto_853076 ?auto_853083 ) ) ( not ( = ?auto_853076 ?auto_853084 ) ) ( not ( = ?auto_853076 ?auto_853085 ) ) ( not ( = ?auto_853076 ?auto_853086 ) ) ( not ( = ?auto_853076 ?auto_853087 ) ) ( not ( = ?auto_853076 ?auto_853088 ) ) ( not ( = ?auto_853076 ?auto_853089 ) ) ( not ( = ?auto_853076 ?auto_853090 ) ) ( not ( = ?auto_853076 ?auto_853091 ) ) ( not ( = ?auto_853077 ?auto_853078 ) ) ( not ( = ?auto_853077 ?auto_853079 ) ) ( not ( = ?auto_853077 ?auto_853080 ) ) ( not ( = ?auto_853077 ?auto_853081 ) ) ( not ( = ?auto_853077 ?auto_853082 ) ) ( not ( = ?auto_853077 ?auto_853083 ) ) ( not ( = ?auto_853077 ?auto_853084 ) ) ( not ( = ?auto_853077 ?auto_853085 ) ) ( not ( = ?auto_853077 ?auto_853086 ) ) ( not ( = ?auto_853077 ?auto_853087 ) ) ( not ( = ?auto_853077 ?auto_853088 ) ) ( not ( = ?auto_853077 ?auto_853089 ) ) ( not ( = ?auto_853077 ?auto_853090 ) ) ( not ( = ?auto_853077 ?auto_853091 ) ) ( not ( = ?auto_853078 ?auto_853079 ) ) ( not ( = ?auto_853078 ?auto_853080 ) ) ( not ( = ?auto_853078 ?auto_853081 ) ) ( not ( = ?auto_853078 ?auto_853082 ) ) ( not ( = ?auto_853078 ?auto_853083 ) ) ( not ( = ?auto_853078 ?auto_853084 ) ) ( not ( = ?auto_853078 ?auto_853085 ) ) ( not ( = ?auto_853078 ?auto_853086 ) ) ( not ( = ?auto_853078 ?auto_853087 ) ) ( not ( = ?auto_853078 ?auto_853088 ) ) ( not ( = ?auto_853078 ?auto_853089 ) ) ( not ( = ?auto_853078 ?auto_853090 ) ) ( not ( = ?auto_853078 ?auto_853091 ) ) ( not ( = ?auto_853079 ?auto_853080 ) ) ( not ( = ?auto_853079 ?auto_853081 ) ) ( not ( = ?auto_853079 ?auto_853082 ) ) ( not ( = ?auto_853079 ?auto_853083 ) ) ( not ( = ?auto_853079 ?auto_853084 ) ) ( not ( = ?auto_853079 ?auto_853085 ) ) ( not ( = ?auto_853079 ?auto_853086 ) ) ( not ( = ?auto_853079 ?auto_853087 ) ) ( not ( = ?auto_853079 ?auto_853088 ) ) ( not ( = ?auto_853079 ?auto_853089 ) ) ( not ( = ?auto_853079 ?auto_853090 ) ) ( not ( = ?auto_853079 ?auto_853091 ) ) ( not ( = ?auto_853080 ?auto_853081 ) ) ( not ( = ?auto_853080 ?auto_853082 ) ) ( not ( = ?auto_853080 ?auto_853083 ) ) ( not ( = ?auto_853080 ?auto_853084 ) ) ( not ( = ?auto_853080 ?auto_853085 ) ) ( not ( = ?auto_853080 ?auto_853086 ) ) ( not ( = ?auto_853080 ?auto_853087 ) ) ( not ( = ?auto_853080 ?auto_853088 ) ) ( not ( = ?auto_853080 ?auto_853089 ) ) ( not ( = ?auto_853080 ?auto_853090 ) ) ( not ( = ?auto_853080 ?auto_853091 ) ) ( not ( = ?auto_853081 ?auto_853082 ) ) ( not ( = ?auto_853081 ?auto_853083 ) ) ( not ( = ?auto_853081 ?auto_853084 ) ) ( not ( = ?auto_853081 ?auto_853085 ) ) ( not ( = ?auto_853081 ?auto_853086 ) ) ( not ( = ?auto_853081 ?auto_853087 ) ) ( not ( = ?auto_853081 ?auto_853088 ) ) ( not ( = ?auto_853081 ?auto_853089 ) ) ( not ( = ?auto_853081 ?auto_853090 ) ) ( not ( = ?auto_853081 ?auto_853091 ) ) ( not ( = ?auto_853082 ?auto_853083 ) ) ( not ( = ?auto_853082 ?auto_853084 ) ) ( not ( = ?auto_853082 ?auto_853085 ) ) ( not ( = ?auto_853082 ?auto_853086 ) ) ( not ( = ?auto_853082 ?auto_853087 ) ) ( not ( = ?auto_853082 ?auto_853088 ) ) ( not ( = ?auto_853082 ?auto_853089 ) ) ( not ( = ?auto_853082 ?auto_853090 ) ) ( not ( = ?auto_853082 ?auto_853091 ) ) ( not ( = ?auto_853083 ?auto_853084 ) ) ( not ( = ?auto_853083 ?auto_853085 ) ) ( not ( = ?auto_853083 ?auto_853086 ) ) ( not ( = ?auto_853083 ?auto_853087 ) ) ( not ( = ?auto_853083 ?auto_853088 ) ) ( not ( = ?auto_853083 ?auto_853089 ) ) ( not ( = ?auto_853083 ?auto_853090 ) ) ( not ( = ?auto_853083 ?auto_853091 ) ) ( not ( = ?auto_853084 ?auto_853085 ) ) ( not ( = ?auto_853084 ?auto_853086 ) ) ( not ( = ?auto_853084 ?auto_853087 ) ) ( not ( = ?auto_853084 ?auto_853088 ) ) ( not ( = ?auto_853084 ?auto_853089 ) ) ( not ( = ?auto_853084 ?auto_853090 ) ) ( not ( = ?auto_853084 ?auto_853091 ) ) ( not ( = ?auto_853085 ?auto_853086 ) ) ( not ( = ?auto_853085 ?auto_853087 ) ) ( not ( = ?auto_853085 ?auto_853088 ) ) ( not ( = ?auto_853085 ?auto_853089 ) ) ( not ( = ?auto_853085 ?auto_853090 ) ) ( not ( = ?auto_853085 ?auto_853091 ) ) ( not ( = ?auto_853086 ?auto_853087 ) ) ( not ( = ?auto_853086 ?auto_853088 ) ) ( not ( = ?auto_853086 ?auto_853089 ) ) ( not ( = ?auto_853086 ?auto_853090 ) ) ( not ( = ?auto_853086 ?auto_853091 ) ) ( not ( = ?auto_853087 ?auto_853088 ) ) ( not ( = ?auto_853087 ?auto_853089 ) ) ( not ( = ?auto_853087 ?auto_853090 ) ) ( not ( = ?auto_853087 ?auto_853091 ) ) ( not ( = ?auto_853088 ?auto_853089 ) ) ( not ( = ?auto_853088 ?auto_853090 ) ) ( not ( = ?auto_853088 ?auto_853091 ) ) ( not ( = ?auto_853089 ?auto_853090 ) ) ( not ( = ?auto_853089 ?auto_853091 ) ) ( not ( = ?auto_853090 ?auto_853091 ) ) ( ON ?auto_853089 ?auto_853090 ) ( ON ?auto_853088 ?auto_853089 ) ( ON ?auto_853087 ?auto_853088 ) ( ON ?auto_853086 ?auto_853087 ) ( CLEAR ?auto_853084 ) ( ON ?auto_853085 ?auto_853086 ) ( CLEAR ?auto_853085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_853073 ?auto_853074 ?auto_853075 ?auto_853076 ?auto_853077 ?auto_853078 ?auto_853079 ?auto_853080 ?auto_853081 ?auto_853082 ?auto_853083 ?auto_853084 ?auto_853085 )
      ( MAKE-18PILE ?auto_853073 ?auto_853074 ?auto_853075 ?auto_853076 ?auto_853077 ?auto_853078 ?auto_853079 ?auto_853080 ?auto_853081 ?auto_853082 ?auto_853083 ?auto_853084 ?auto_853085 ?auto_853086 ?auto_853087 ?auto_853088 ?auto_853089 ?auto_853090 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_853110 - BLOCK
      ?auto_853111 - BLOCK
      ?auto_853112 - BLOCK
      ?auto_853113 - BLOCK
      ?auto_853114 - BLOCK
      ?auto_853115 - BLOCK
      ?auto_853116 - BLOCK
      ?auto_853117 - BLOCK
      ?auto_853118 - BLOCK
      ?auto_853119 - BLOCK
      ?auto_853120 - BLOCK
      ?auto_853121 - BLOCK
      ?auto_853122 - BLOCK
      ?auto_853123 - BLOCK
      ?auto_853124 - BLOCK
      ?auto_853125 - BLOCK
      ?auto_853126 - BLOCK
      ?auto_853127 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_853127 ) ( ON-TABLE ?auto_853110 ) ( ON ?auto_853111 ?auto_853110 ) ( ON ?auto_853112 ?auto_853111 ) ( ON ?auto_853113 ?auto_853112 ) ( ON ?auto_853114 ?auto_853113 ) ( ON ?auto_853115 ?auto_853114 ) ( ON ?auto_853116 ?auto_853115 ) ( ON ?auto_853117 ?auto_853116 ) ( ON ?auto_853118 ?auto_853117 ) ( ON ?auto_853119 ?auto_853118 ) ( ON ?auto_853120 ?auto_853119 ) ( ON ?auto_853121 ?auto_853120 ) ( not ( = ?auto_853110 ?auto_853111 ) ) ( not ( = ?auto_853110 ?auto_853112 ) ) ( not ( = ?auto_853110 ?auto_853113 ) ) ( not ( = ?auto_853110 ?auto_853114 ) ) ( not ( = ?auto_853110 ?auto_853115 ) ) ( not ( = ?auto_853110 ?auto_853116 ) ) ( not ( = ?auto_853110 ?auto_853117 ) ) ( not ( = ?auto_853110 ?auto_853118 ) ) ( not ( = ?auto_853110 ?auto_853119 ) ) ( not ( = ?auto_853110 ?auto_853120 ) ) ( not ( = ?auto_853110 ?auto_853121 ) ) ( not ( = ?auto_853110 ?auto_853122 ) ) ( not ( = ?auto_853110 ?auto_853123 ) ) ( not ( = ?auto_853110 ?auto_853124 ) ) ( not ( = ?auto_853110 ?auto_853125 ) ) ( not ( = ?auto_853110 ?auto_853126 ) ) ( not ( = ?auto_853110 ?auto_853127 ) ) ( not ( = ?auto_853111 ?auto_853112 ) ) ( not ( = ?auto_853111 ?auto_853113 ) ) ( not ( = ?auto_853111 ?auto_853114 ) ) ( not ( = ?auto_853111 ?auto_853115 ) ) ( not ( = ?auto_853111 ?auto_853116 ) ) ( not ( = ?auto_853111 ?auto_853117 ) ) ( not ( = ?auto_853111 ?auto_853118 ) ) ( not ( = ?auto_853111 ?auto_853119 ) ) ( not ( = ?auto_853111 ?auto_853120 ) ) ( not ( = ?auto_853111 ?auto_853121 ) ) ( not ( = ?auto_853111 ?auto_853122 ) ) ( not ( = ?auto_853111 ?auto_853123 ) ) ( not ( = ?auto_853111 ?auto_853124 ) ) ( not ( = ?auto_853111 ?auto_853125 ) ) ( not ( = ?auto_853111 ?auto_853126 ) ) ( not ( = ?auto_853111 ?auto_853127 ) ) ( not ( = ?auto_853112 ?auto_853113 ) ) ( not ( = ?auto_853112 ?auto_853114 ) ) ( not ( = ?auto_853112 ?auto_853115 ) ) ( not ( = ?auto_853112 ?auto_853116 ) ) ( not ( = ?auto_853112 ?auto_853117 ) ) ( not ( = ?auto_853112 ?auto_853118 ) ) ( not ( = ?auto_853112 ?auto_853119 ) ) ( not ( = ?auto_853112 ?auto_853120 ) ) ( not ( = ?auto_853112 ?auto_853121 ) ) ( not ( = ?auto_853112 ?auto_853122 ) ) ( not ( = ?auto_853112 ?auto_853123 ) ) ( not ( = ?auto_853112 ?auto_853124 ) ) ( not ( = ?auto_853112 ?auto_853125 ) ) ( not ( = ?auto_853112 ?auto_853126 ) ) ( not ( = ?auto_853112 ?auto_853127 ) ) ( not ( = ?auto_853113 ?auto_853114 ) ) ( not ( = ?auto_853113 ?auto_853115 ) ) ( not ( = ?auto_853113 ?auto_853116 ) ) ( not ( = ?auto_853113 ?auto_853117 ) ) ( not ( = ?auto_853113 ?auto_853118 ) ) ( not ( = ?auto_853113 ?auto_853119 ) ) ( not ( = ?auto_853113 ?auto_853120 ) ) ( not ( = ?auto_853113 ?auto_853121 ) ) ( not ( = ?auto_853113 ?auto_853122 ) ) ( not ( = ?auto_853113 ?auto_853123 ) ) ( not ( = ?auto_853113 ?auto_853124 ) ) ( not ( = ?auto_853113 ?auto_853125 ) ) ( not ( = ?auto_853113 ?auto_853126 ) ) ( not ( = ?auto_853113 ?auto_853127 ) ) ( not ( = ?auto_853114 ?auto_853115 ) ) ( not ( = ?auto_853114 ?auto_853116 ) ) ( not ( = ?auto_853114 ?auto_853117 ) ) ( not ( = ?auto_853114 ?auto_853118 ) ) ( not ( = ?auto_853114 ?auto_853119 ) ) ( not ( = ?auto_853114 ?auto_853120 ) ) ( not ( = ?auto_853114 ?auto_853121 ) ) ( not ( = ?auto_853114 ?auto_853122 ) ) ( not ( = ?auto_853114 ?auto_853123 ) ) ( not ( = ?auto_853114 ?auto_853124 ) ) ( not ( = ?auto_853114 ?auto_853125 ) ) ( not ( = ?auto_853114 ?auto_853126 ) ) ( not ( = ?auto_853114 ?auto_853127 ) ) ( not ( = ?auto_853115 ?auto_853116 ) ) ( not ( = ?auto_853115 ?auto_853117 ) ) ( not ( = ?auto_853115 ?auto_853118 ) ) ( not ( = ?auto_853115 ?auto_853119 ) ) ( not ( = ?auto_853115 ?auto_853120 ) ) ( not ( = ?auto_853115 ?auto_853121 ) ) ( not ( = ?auto_853115 ?auto_853122 ) ) ( not ( = ?auto_853115 ?auto_853123 ) ) ( not ( = ?auto_853115 ?auto_853124 ) ) ( not ( = ?auto_853115 ?auto_853125 ) ) ( not ( = ?auto_853115 ?auto_853126 ) ) ( not ( = ?auto_853115 ?auto_853127 ) ) ( not ( = ?auto_853116 ?auto_853117 ) ) ( not ( = ?auto_853116 ?auto_853118 ) ) ( not ( = ?auto_853116 ?auto_853119 ) ) ( not ( = ?auto_853116 ?auto_853120 ) ) ( not ( = ?auto_853116 ?auto_853121 ) ) ( not ( = ?auto_853116 ?auto_853122 ) ) ( not ( = ?auto_853116 ?auto_853123 ) ) ( not ( = ?auto_853116 ?auto_853124 ) ) ( not ( = ?auto_853116 ?auto_853125 ) ) ( not ( = ?auto_853116 ?auto_853126 ) ) ( not ( = ?auto_853116 ?auto_853127 ) ) ( not ( = ?auto_853117 ?auto_853118 ) ) ( not ( = ?auto_853117 ?auto_853119 ) ) ( not ( = ?auto_853117 ?auto_853120 ) ) ( not ( = ?auto_853117 ?auto_853121 ) ) ( not ( = ?auto_853117 ?auto_853122 ) ) ( not ( = ?auto_853117 ?auto_853123 ) ) ( not ( = ?auto_853117 ?auto_853124 ) ) ( not ( = ?auto_853117 ?auto_853125 ) ) ( not ( = ?auto_853117 ?auto_853126 ) ) ( not ( = ?auto_853117 ?auto_853127 ) ) ( not ( = ?auto_853118 ?auto_853119 ) ) ( not ( = ?auto_853118 ?auto_853120 ) ) ( not ( = ?auto_853118 ?auto_853121 ) ) ( not ( = ?auto_853118 ?auto_853122 ) ) ( not ( = ?auto_853118 ?auto_853123 ) ) ( not ( = ?auto_853118 ?auto_853124 ) ) ( not ( = ?auto_853118 ?auto_853125 ) ) ( not ( = ?auto_853118 ?auto_853126 ) ) ( not ( = ?auto_853118 ?auto_853127 ) ) ( not ( = ?auto_853119 ?auto_853120 ) ) ( not ( = ?auto_853119 ?auto_853121 ) ) ( not ( = ?auto_853119 ?auto_853122 ) ) ( not ( = ?auto_853119 ?auto_853123 ) ) ( not ( = ?auto_853119 ?auto_853124 ) ) ( not ( = ?auto_853119 ?auto_853125 ) ) ( not ( = ?auto_853119 ?auto_853126 ) ) ( not ( = ?auto_853119 ?auto_853127 ) ) ( not ( = ?auto_853120 ?auto_853121 ) ) ( not ( = ?auto_853120 ?auto_853122 ) ) ( not ( = ?auto_853120 ?auto_853123 ) ) ( not ( = ?auto_853120 ?auto_853124 ) ) ( not ( = ?auto_853120 ?auto_853125 ) ) ( not ( = ?auto_853120 ?auto_853126 ) ) ( not ( = ?auto_853120 ?auto_853127 ) ) ( not ( = ?auto_853121 ?auto_853122 ) ) ( not ( = ?auto_853121 ?auto_853123 ) ) ( not ( = ?auto_853121 ?auto_853124 ) ) ( not ( = ?auto_853121 ?auto_853125 ) ) ( not ( = ?auto_853121 ?auto_853126 ) ) ( not ( = ?auto_853121 ?auto_853127 ) ) ( not ( = ?auto_853122 ?auto_853123 ) ) ( not ( = ?auto_853122 ?auto_853124 ) ) ( not ( = ?auto_853122 ?auto_853125 ) ) ( not ( = ?auto_853122 ?auto_853126 ) ) ( not ( = ?auto_853122 ?auto_853127 ) ) ( not ( = ?auto_853123 ?auto_853124 ) ) ( not ( = ?auto_853123 ?auto_853125 ) ) ( not ( = ?auto_853123 ?auto_853126 ) ) ( not ( = ?auto_853123 ?auto_853127 ) ) ( not ( = ?auto_853124 ?auto_853125 ) ) ( not ( = ?auto_853124 ?auto_853126 ) ) ( not ( = ?auto_853124 ?auto_853127 ) ) ( not ( = ?auto_853125 ?auto_853126 ) ) ( not ( = ?auto_853125 ?auto_853127 ) ) ( not ( = ?auto_853126 ?auto_853127 ) ) ( ON ?auto_853126 ?auto_853127 ) ( ON ?auto_853125 ?auto_853126 ) ( ON ?auto_853124 ?auto_853125 ) ( ON ?auto_853123 ?auto_853124 ) ( CLEAR ?auto_853121 ) ( ON ?auto_853122 ?auto_853123 ) ( CLEAR ?auto_853122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_853110 ?auto_853111 ?auto_853112 ?auto_853113 ?auto_853114 ?auto_853115 ?auto_853116 ?auto_853117 ?auto_853118 ?auto_853119 ?auto_853120 ?auto_853121 ?auto_853122 )
      ( MAKE-18PILE ?auto_853110 ?auto_853111 ?auto_853112 ?auto_853113 ?auto_853114 ?auto_853115 ?auto_853116 ?auto_853117 ?auto_853118 ?auto_853119 ?auto_853120 ?auto_853121 ?auto_853122 ?auto_853123 ?auto_853124 ?auto_853125 ?auto_853126 ?auto_853127 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_853146 - BLOCK
      ?auto_853147 - BLOCK
      ?auto_853148 - BLOCK
      ?auto_853149 - BLOCK
      ?auto_853150 - BLOCK
      ?auto_853151 - BLOCK
      ?auto_853152 - BLOCK
      ?auto_853153 - BLOCK
      ?auto_853154 - BLOCK
      ?auto_853155 - BLOCK
      ?auto_853156 - BLOCK
      ?auto_853157 - BLOCK
      ?auto_853158 - BLOCK
      ?auto_853159 - BLOCK
      ?auto_853160 - BLOCK
      ?auto_853161 - BLOCK
      ?auto_853162 - BLOCK
      ?auto_853163 - BLOCK
    )
    :vars
    (
      ?auto_853164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_853163 ?auto_853164 ) ( ON-TABLE ?auto_853146 ) ( ON ?auto_853147 ?auto_853146 ) ( ON ?auto_853148 ?auto_853147 ) ( ON ?auto_853149 ?auto_853148 ) ( ON ?auto_853150 ?auto_853149 ) ( ON ?auto_853151 ?auto_853150 ) ( ON ?auto_853152 ?auto_853151 ) ( ON ?auto_853153 ?auto_853152 ) ( ON ?auto_853154 ?auto_853153 ) ( ON ?auto_853155 ?auto_853154 ) ( ON ?auto_853156 ?auto_853155 ) ( not ( = ?auto_853146 ?auto_853147 ) ) ( not ( = ?auto_853146 ?auto_853148 ) ) ( not ( = ?auto_853146 ?auto_853149 ) ) ( not ( = ?auto_853146 ?auto_853150 ) ) ( not ( = ?auto_853146 ?auto_853151 ) ) ( not ( = ?auto_853146 ?auto_853152 ) ) ( not ( = ?auto_853146 ?auto_853153 ) ) ( not ( = ?auto_853146 ?auto_853154 ) ) ( not ( = ?auto_853146 ?auto_853155 ) ) ( not ( = ?auto_853146 ?auto_853156 ) ) ( not ( = ?auto_853146 ?auto_853157 ) ) ( not ( = ?auto_853146 ?auto_853158 ) ) ( not ( = ?auto_853146 ?auto_853159 ) ) ( not ( = ?auto_853146 ?auto_853160 ) ) ( not ( = ?auto_853146 ?auto_853161 ) ) ( not ( = ?auto_853146 ?auto_853162 ) ) ( not ( = ?auto_853146 ?auto_853163 ) ) ( not ( = ?auto_853146 ?auto_853164 ) ) ( not ( = ?auto_853147 ?auto_853148 ) ) ( not ( = ?auto_853147 ?auto_853149 ) ) ( not ( = ?auto_853147 ?auto_853150 ) ) ( not ( = ?auto_853147 ?auto_853151 ) ) ( not ( = ?auto_853147 ?auto_853152 ) ) ( not ( = ?auto_853147 ?auto_853153 ) ) ( not ( = ?auto_853147 ?auto_853154 ) ) ( not ( = ?auto_853147 ?auto_853155 ) ) ( not ( = ?auto_853147 ?auto_853156 ) ) ( not ( = ?auto_853147 ?auto_853157 ) ) ( not ( = ?auto_853147 ?auto_853158 ) ) ( not ( = ?auto_853147 ?auto_853159 ) ) ( not ( = ?auto_853147 ?auto_853160 ) ) ( not ( = ?auto_853147 ?auto_853161 ) ) ( not ( = ?auto_853147 ?auto_853162 ) ) ( not ( = ?auto_853147 ?auto_853163 ) ) ( not ( = ?auto_853147 ?auto_853164 ) ) ( not ( = ?auto_853148 ?auto_853149 ) ) ( not ( = ?auto_853148 ?auto_853150 ) ) ( not ( = ?auto_853148 ?auto_853151 ) ) ( not ( = ?auto_853148 ?auto_853152 ) ) ( not ( = ?auto_853148 ?auto_853153 ) ) ( not ( = ?auto_853148 ?auto_853154 ) ) ( not ( = ?auto_853148 ?auto_853155 ) ) ( not ( = ?auto_853148 ?auto_853156 ) ) ( not ( = ?auto_853148 ?auto_853157 ) ) ( not ( = ?auto_853148 ?auto_853158 ) ) ( not ( = ?auto_853148 ?auto_853159 ) ) ( not ( = ?auto_853148 ?auto_853160 ) ) ( not ( = ?auto_853148 ?auto_853161 ) ) ( not ( = ?auto_853148 ?auto_853162 ) ) ( not ( = ?auto_853148 ?auto_853163 ) ) ( not ( = ?auto_853148 ?auto_853164 ) ) ( not ( = ?auto_853149 ?auto_853150 ) ) ( not ( = ?auto_853149 ?auto_853151 ) ) ( not ( = ?auto_853149 ?auto_853152 ) ) ( not ( = ?auto_853149 ?auto_853153 ) ) ( not ( = ?auto_853149 ?auto_853154 ) ) ( not ( = ?auto_853149 ?auto_853155 ) ) ( not ( = ?auto_853149 ?auto_853156 ) ) ( not ( = ?auto_853149 ?auto_853157 ) ) ( not ( = ?auto_853149 ?auto_853158 ) ) ( not ( = ?auto_853149 ?auto_853159 ) ) ( not ( = ?auto_853149 ?auto_853160 ) ) ( not ( = ?auto_853149 ?auto_853161 ) ) ( not ( = ?auto_853149 ?auto_853162 ) ) ( not ( = ?auto_853149 ?auto_853163 ) ) ( not ( = ?auto_853149 ?auto_853164 ) ) ( not ( = ?auto_853150 ?auto_853151 ) ) ( not ( = ?auto_853150 ?auto_853152 ) ) ( not ( = ?auto_853150 ?auto_853153 ) ) ( not ( = ?auto_853150 ?auto_853154 ) ) ( not ( = ?auto_853150 ?auto_853155 ) ) ( not ( = ?auto_853150 ?auto_853156 ) ) ( not ( = ?auto_853150 ?auto_853157 ) ) ( not ( = ?auto_853150 ?auto_853158 ) ) ( not ( = ?auto_853150 ?auto_853159 ) ) ( not ( = ?auto_853150 ?auto_853160 ) ) ( not ( = ?auto_853150 ?auto_853161 ) ) ( not ( = ?auto_853150 ?auto_853162 ) ) ( not ( = ?auto_853150 ?auto_853163 ) ) ( not ( = ?auto_853150 ?auto_853164 ) ) ( not ( = ?auto_853151 ?auto_853152 ) ) ( not ( = ?auto_853151 ?auto_853153 ) ) ( not ( = ?auto_853151 ?auto_853154 ) ) ( not ( = ?auto_853151 ?auto_853155 ) ) ( not ( = ?auto_853151 ?auto_853156 ) ) ( not ( = ?auto_853151 ?auto_853157 ) ) ( not ( = ?auto_853151 ?auto_853158 ) ) ( not ( = ?auto_853151 ?auto_853159 ) ) ( not ( = ?auto_853151 ?auto_853160 ) ) ( not ( = ?auto_853151 ?auto_853161 ) ) ( not ( = ?auto_853151 ?auto_853162 ) ) ( not ( = ?auto_853151 ?auto_853163 ) ) ( not ( = ?auto_853151 ?auto_853164 ) ) ( not ( = ?auto_853152 ?auto_853153 ) ) ( not ( = ?auto_853152 ?auto_853154 ) ) ( not ( = ?auto_853152 ?auto_853155 ) ) ( not ( = ?auto_853152 ?auto_853156 ) ) ( not ( = ?auto_853152 ?auto_853157 ) ) ( not ( = ?auto_853152 ?auto_853158 ) ) ( not ( = ?auto_853152 ?auto_853159 ) ) ( not ( = ?auto_853152 ?auto_853160 ) ) ( not ( = ?auto_853152 ?auto_853161 ) ) ( not ( = ?auto_853152 ?auto_853162 ) ) ( not ( = ?auto_853152 ?auto_853163 ) ) ( not ( = ?auto_853152 ?auto_853164 ) ) ( not ( = ?auto_853153 ?auto_853154 ) ) ( not ( = ?auto_853153 ?auto_853155 ) ) ( not ( = ?auto_853153 ?auto_853156 ) ) ( not ( = ?auto_853153 ?auto_853157 ) ) ( not ( = ?auto_853153 ?auto_853158 ) ) ( not ( = ?auto_853153 ?auto_853159 ) ) ( not ( = ?auto_853153 ?auto_853160 ) ) ( not ( = ?auto_853153 ?auto_853161 ) ) ( not ( = ?auto_853153 ?auto_853162 ) ) ( not ( = ?auto_853153 ?auto_853163 ) ) ( not ( = ?auto_853153 ?auto_853164 ) ) ( not ( = ?auto_853154 ?auto_853155 ) ) ( not ( = ?auto_853154 ?auto_853156 ) ) ( not ( = ?auto_853154 ?auto_853157 ) ) ( not ( = ?auto_853154 ?auto_853158 ) ) ( not ( = ?auto_853154 ?auto_853159 ) ) ( not ( = ?auto_853154 ?auto_853160 ) ) ( not ( = ?auto_853154 ?auto_853161 ) ) ( not ( = ?auto_853154 ?auto_853162 ) ) ( not ( = ?auto_853154 ?auto_853163 ) ) ( not ( = ?auto_853154 ?auto_853164 ) ) ( not ( = ?auto_853155 ?auto_853156 ) ) ( not ( = ?auto_853155 ?auto_853157 ) ) ( not ( = ?auto_853155 ?auto_853158 ) ) ( not ( = ?auto_853155 ?auto_853159 ) ) ( not ( = ?auto_853155 ?auto_853160 ) ) ( not ( = ?auto_853155 ?auto_853161 ) ) ( not ( = ?auto_853155 ?auto_853162 ) ) ( not ( = ?auto_853155 ?auto_853163 ) ) ( not ( = ?auto_853155 ?auto_853164 ) ) ( not ( = ?auto_853156 ?auto_853157 ) ) ( not ( = ?auto_853156 ?auto_853158 ) ) ( not ( = ?auto_853156 ?auto_853159 ) ) ( not ( = ?auto_853156 ?auto_853160 ) ) ( not ( = ?auto_853156 ?auto_853161 ) ) ( not ( = ?auto_853156 ?auto_853162 ) ) ( not ( = ?auto_853156 ?auto_853163 ) ) ( not ( = ?auto_853156 ?auto_853164 ) ) ( not ( = ?auto_853157 ?auto_853158 ) ) ( not ( = ?auto_853157 ?auto_853159 ) ) ( not ( = ?auto_853157 ?auto_853160 ) ) ( not ( = ?auto_853157 ?auto_853161 ) ) ( not ( = ?auto_853157 ?auto_853162 ) ) ( not ( = ?auto_853157 ?auto_853163 ) ) ( not ( = ?auto_853157 ?auto_853164 ) ) ( not ( = ?auto_853158 ?auto_853159 ) ) ( not ( = ?auto_853158 ?auto_853160 ) ) ( not ( = ?auto_853158 ?auto_853161 ) ) ( not ( = ?auto_853158 ?auto_853162 ) ) ( not ( = ?auto_853158 ?auto_853163 ) ) ( not ( = ?auto_853158 ?auto_853164 ) ) ( not ( = ?auto_853159 ?auto_853160 ) ) ( not ( = ?auto_853159 ?auto_853161 ) ) ( not ( = ?auto_853159 ?auto_853162 ) ) ( not ( = ?auto_853159 ?auto_853163 ) ) ( not ( = ?auto_853159 ?auto_853164 ) ) ( not ( = ?auto_853160 ?auto_853161 ) ) ( not ( = ?auto_853160 ?auto_853162 ) ) ( not ( = ?auto_853160 ?auto_853163 ) ) ( not ( = ?auto_853160 ?auto_853164 ) ) ( not ( = ?auto_853161 ?auto_853162 ) ) ( not ( = ?auto_853161 ?auto_853163 ) ) ( not ( = ?auto_853161 ?auto_853164 ) ) ( not ( = ?auto_853162 ?auto_853163 ) ) ( not ( = ?auto_853162 ?auto_853164 ) ) ( not ( = ?auto_853163 ?auto_853164 ) ) ( ON ?auto_853162 ?auto_853163 ) ( ON ?auto_853161 ?auto_853162 ) ( ON ?auto_853160 ?auto_853161 ) ( ON ?auto_853159 ?auto_853160 ) ( ON ?auto_853158 ?auto_853159 ) ( CLEAR ?auto_853156 ) ( ON ?auto_853157 ?auto_853158 ) ( CLEAR ?auto_853157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_853146 ?auto_853147 ?auto_853148 ?auto_853149 ?auto_853150 ?auto_853151 ?auto_853152 ?auto_853153 ?auto_853154 ?auto_853155 ?auto_853156 ?auto_853157 )
      ( MAKE-18PILE ?auto_853146 ?auto_853147 ?auto_853148 ?auto_853149 ?auto_853150 ?auto_853151 ?auto_853152 ?auto_853153 ?auto_853154 ?auto_853155 ?auto_853156 ?auto_853157 ?auto_853158 ?auto_853159 ?auto_853160 ?auto_853161 ?auto_853162 ?auto_853163 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_853183 - BLOCK
      ?auto_853184 - BLOCK
      ?auto_853185 - BLOCK
      ?auto_853186 - BLOCK
      ?auto_853187 - BLOCK
      ?auto_853188 - BLOCK
      ?auto_853189 - BLOCK
      ?auto_853190 - BLOCK
      ?auto_853191 - BLOCK
      ?auto_853192 - BLOCK
      ?auto_853193 - BLOCK
      ?auto_853194 - BLOCK
      ?auto_853195 - BLOCK
      ?auto_853196 - BLOCK
      ?auto_853197 - BLOCK
      ?auto_853198 - BLOCK
      ?auto_853199 - BLOCK
      ?auto_853200 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_853200 ) ( ON-TABLE ?auto_853183 ) ( ON ?auto_853184 ?auto_853183 ) ( ON ?auto_853185 ?auto_853184 ) ( ON ?auto_853186 ?auto_853185 ) ( ON ?auto_853187 ?auto_853186 ) ( ON ?auto_853188 ?auto_853187 ) ( ON ?auto_853189 ?auto_853188 ) ( ON ?auto_853190 ?auto_853189 ) ( ON ?auto_853191 ?auto_853190 ) ( ON ?auto_853192 ?auto_853191 ) ( ON ?auto_853193 ?auto_853192 ) ( not ( = ?auto_853183 ?auto_853184 ) ) ( not ( = ?auto_853183 ?auto_853185 ) ) ( not ( = ?auto_853183 ?auto_853186 ) ) ( not ( = ?auto_853183 ?auto_853187 ) ) ( not ( = ?auto_853183 ?auto_853188 ) ) ( not ( = ?auto_853183 ?auto_853189 ) ) ( not ( = ?auto_853183 ?auto_853190 ) ) ( not ( = ?auto_853183 ?auto_853191 ) ) ( not ( = ?auto_853183 ?auto_853192 ) ) ( not ( = ?auto_853183 ?auto_853193 ) ) ( not ( = ?auto_853183 ?auto_853194 ) ) ( not ( = ?auto_853183 ?auto_853195 ) ) ( not ( = ?auto_853183 ?auto_853196 ) ) ( not ( = ?auto_853183 ?auto_853197 ) ) ( not ( = ?auto_853183 ?auto_853198 ) ) ( not ( = ?auto_853183 ?auto_853199 ) ) ( not ( = ?auto_853183 ?auto_853200 ) ) ( not ( = ?auto_853184 ?auto_853185 ) ) ( not ( = ?auto_853184 ?auto_853186 ) ) ( not ( = ?auto_853184 ?auto_853187 ) ) ( not ( = ?auto_853184 ?auto_853188 ) ) ( not ( = ?auto_853184 ?auto_853189 ) ) ( not ( = ?auto_853184 ?auto_853190 ) ) ( not ( = ?auto_853184 ?auto_853191 ) ) ( not ( = ?auto_853184 ?auto_853192 ) ) ( not ( = ?auto_853184 ?auto_853193 ) ) ( not ( = ?auto_853184 ?auto_853194 ) ) ( not ( = ?auto_853184 ?auto_853195 ) ) ( not ( = ?auto_853184 ?auto_853196 ) ) ( not ( = ?auto_853184 ?auto_853197 ) ) ( not ( = ?auto_853184 ?auto_853198 ) ) ( not ( = ?auto_853184 ?auto_853199 ) ) ( not ( = ?auto_853184 ?auto_853200 ) ) ( not ( = ?auto_853185 ?auto_853186 ) ) ( not ( = ?auto_853185 ?auto_853187 ) ) ( not ( = ?auto_853185 ?auto_853188 ) ) ( not ( = ?auto_853185 ?auto_853189 ) ) ( not ( = ?auto_853185 ?auto_853190 ) ) ( not ( = ?auto_853185 ?auto_853191 ) ) ( not ( = ?auto_853185 ?auto_853192 ) ) ( not ( = ?auto_853185 ?auto_853193 ) ) ( not ( = ?auto_853185 ?auto_853194 ) ) ( not ( = ?auto_853185 ?auto_853195 ) ) ( not ( = ?auto_853185 ?auto_853196 ) ) ( not ( = ?auto_853185 ?auto_853197 ) ) ( not ( = ?auto_853185 ?auto_853198 ) ) ( not ( = ?auto_853185 ?auto_853199 ) ) ( not ( = ?auto_853185 ?auto_853200 ) ) ( not ( = ?auto_853186 ?auto_853187 ) ) ( not ( = ?auto_853186 ?auto_853188 ) ) ( not ( = ?auto_853186 ?auto_853189 ) ) ( not ( = ?auto_853186 ?auto_853190 ) ) ( not ( = ?auto_853186 ?auto_853191 ) ) ( not ( = ?auto_853186 ?auto_853192 ) ) ( not ( = ?auto_853186 ?auto_853193 ) ) ( not ( = ?auto_853186 ?auto_853194 ) ) ( not ( = ?auto_853186 ?auto_853195 ) ) ( not ( = ?auto_853186 ?auto_853196 ) ) ( not ( = ?auto_853186 ?auto_853197 ) ) ( not ( = ?auto_853186 ?auto_853198 ) ) ( not ( = ?auto_853186 ?auto_853199 ) ) ( not ( = ?auto_853186 ?auto_853200 ) ) ( not ( = ?auto_853187 ?auto_853188 ) ) ( not ( = ?auto_853187 ?auto_853189 ) ) ( not ( = ?auto_853187 ?auto_853190 ) ) ( not ( = ?auto_853187 ?auto_853191 ) ) ( not ( = ?auto_853187 ?auto_853192 ) ) ( not ( = ?auto_853187 ?auto_853193 ) ) ( not ( = ?auto_853187 ?auto_853194 ) ) ( not ( = ?auto_853187 ?auto_853195 ) ) ( not ( = ?auto_853187 ?auto_853196 ) ) ( not ( = ?auto_853187 ?auto_853197 ) ) ( not ( = ?auto_853187 ?auto_853198 ) ) ( not ( = ?auto_853187 ?auto_853199 ) ) ( not ( = ?auto_853187 ?auto_853200 ) ) ( not ( = ?auto_853188 ?auto_853189 ) ) ( not ( = ?auto_853188 ?auto_853190 ) ) ( not ( = ?auto_853188 ?auto_853191 ) ) ( not ( = ?auto_853188 ?auto_853192 ) ) ( not ( = ?auto_853188 ?auto_853193 ) ) ( not ( = ?auto_853188 ?auto_853194 ) ) ( not ( = ?auto_853188 ?auto_853195 ) ) ( not ( = ?auto_853188 ?auto_853196 ) ) ( not ( = ?auto_853188 ?auto_853197 ) ) ( not ( = ?auto_853188 ?auto_853198 ) ) ( not ( = ?auto_853188 ?auto_853199 ) ) ( not ( = ?auto_853188 ?auto_853200 ) ) ( not ( = ?auto_853189 ?auto_853190 ) ) ( not ( = ?auto_853189 ?auto_853191 ) ) ( not ( = ?auto_853189 ?auto_853192 ) ) ( not ( = ?auto_853189 ?auto_853193 ) ) ( not ( = ?auto_853189 ?auto_853194 ) ) ( not ( = ?auto_853189 ?auto_853195 ) ) ( not ( = ?auto_853189 ?auto_853196 ) ) ( not ( = ?auto_853189 ?auto_853197 ) ) ( not ( = ?auto_853189 ?auto_853198 ) ) ( not ( = ?auto_853189 ?auto_853199 ) ) ( not ( = ?auto_853189 ?auto_853200 ) ) ( not ( = ?auto_853190 ?auto_853191 ) ) ( not ( = ?auto_853190 ?auto_853192 ) ) ( not ( = ?auto_853190 ?auto_853193 ) ) ( not ( = ?auto_853190 ?auto_853194 ) ) ( not ( = ?auto_853190 ?auto_853195 ) ) ( not ( = ?auto_853190 ?auto_853196 ) ) ( not ( = ?auto_853190 ?auto_853197 ) ) ( not ( = ?auto_853190 ?auto_853198 ) ) ( not ( = ?auto_853190 ?auto_853199 ) ) ( not ( = ?auto_853190 ?auto_853200 ) ) ( not ( = ?auto_853191 ?auto_853192 ) ) ( not ( = ?auto_853191 ?auto_853193 ) ) ( not ( = ?auto_853191 ?auto_853194 ) ) ( not ( = ?auto_853191 ?auto_853195 ) ) ( not ( = ?auto_853191 ?auto_853196 ) ) ( not ( = ?auto_853191 ?auto_853197 ) ) ( not ( = ?auto_853191 ?auto_853198 ) ) ( not ( = ?auto_853191 ?auto_853199 ) ) ( not ( = ?auto_853191 ?auto_853200 ) ) ( not ( = ?auto_853192 ?auto_853193 ) ) ( not ( = ?auto_853192 ?auto_853194 ) ) ( not ( = ?auto_853192 ?auto_853195 ) ) ( not ( = ?auto_853192 ?auto_853196 ) ) ( not ( = ?auto_853192 ?auto_853197 ) ) ( not ( = ?auto_853192 ?auto_853198 ) ) ( not ( = ?auto_853192 ?auto_853199 ) ) ( not ( = ?auto_853192 ?auto_853200 ) ) ( not ( = ?auto_853193 ?auto_853194 ) ) ( not ( = ?auto_853193 ?auto_853195 ) ) ( not ( = ?auto_853193 ?auto_853196 ) ) ( not ( = ?auto_853193 ?auto_853197 ) ) ( not ( = ?auto_853193 ?auto_853198 ) ) ( not ( = ?auto_853193 ?auto_853199 ) ) ( not ( = ?auto_853193 ?auto_853200 ) ) ( not ( = ?auto_853194 ?auto_853195 ) ) ( not ( = ?auto_853194 ?auto_853196 ) ) ( not ( = ?auto_853194 ?auto_853197 ) ) ( not ( = ?auto_853194 ?auto_853198 ) ) ( not ( = ?auto_853194 ?auto_853199 ) ) ( not ( = ?auto_853194 ?auto_853200 ) ) ( not ( = ?auto_853195 ?auto_853196 ) ) ( not ( = ?auto_853195 ?auto_853197 ) ) ( not ( = ?auto_853195 ?auto_853198 ) ) ( not ( = ?auto_853195 ?auto_853199 ) ) ( not ( = ?auto_853195 ?auto_853200 ) ) ( not ( = ?auto_853196 ?auto_853197 ) ) ( not ( = ?auto_853196 ?auto_853198 ) ) ( not ( = ?auto_853196 ?auto_853199 ) ) ( not ( = ?auto_853196 ?auto_853200 ) ) ( not ( = ?auto_853197 ?auto_853198 ) ) ( not ( = ?auto_853197 ?auto_853199 ) ) ( not ( = ?auto_853197 ?auto_853200 ) ) ( not ( = ?auto_853198 ?auto_853199 ) ) ( not ( = ?auto_853198 ?auto_853200 ) ) ( not ( = ?auto_853199 ?auto_853200 ) ) ( ON ?auto_853199 ?auto_853200 ) ( ON ?auto_853198 ?auto_853199 ) ( ON ?auto_853197 ?auto_853198 ) ( ON ?auto_853196 ?auto_853197 ) ( ON ?auto_853195 ?auto_853196 ) ( CLEAR ?auto_853193 ) ( ON ?auto_853194 ?auto_853195 ) ( CLEAR ?auto_853194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_853183 ?auto_853184 ?auto_853185 ?auto_853186 ?auto_853187 ?auto_853188 ?auto_853189 ?auto_853190 ?auto_853191 ?auto_853192 ?auto_853193 ?auto_853194 )
      ( MAKE-18PILE ?auto_853183 ?auto_853184 ?auto_853185 ?auto_853186 ?auto_853187 ?auto_853188 ?auto_853189 ?auto_853190 ?auto_853191 ?auto_853192 ?auto_853193 ?auto_853194 ?auto_853195 ?auto_853196 ?auto_853197 ?auto_853198 ?auto_853199 ?auto_853200 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_853219 - BLOCK
      ?auto_853220 - BLOCK
      ?auto_853221 - BLOCK
      ?auto_853222 - BLOCK
      ?auto_853223 - BLOCK
      ?auto_853224 - BLOCK
      ?auto_853225 - BLOCK
      ?auto_853226 - BLOCK
      ?auto_853227 - BLOCK
      ?auto_853228 - BLOCK
      ?auto_853229 - BLOCK
      ?auto_853230 - BLOCK
      ?auto_853231 - BLOCK
      ?auto_853232 - BLOCK
      ?auto_853233 - BLOCK
      ?auto_853234 - BLOCK
      ?auto_853235 - BLOCK
      ?auto_853236 - BLOCK
    )
    :vars
    (
      ?auto_853237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_853236 ?auto_853237 ) ( ON-TABLE ?auto_853219 ) ( ON ?auto_853220 ?auto_853219 ) ( ON ?auto_853221 ?auto_853220 ) ( ON ?auto_853222 ?auto_853221 ) ( ON ?auto_853223 ?auto_853222 ) ( ON ?auto_853224 ?auto_853223 ) ( ON ?auto_853225 ?auto_853224 ) ( ON ?auto_853226 ?auto_853225 ) ( ON ?auto_853227 ?auto_853226 ) ( ON ?auto_853228 ?auto_853227 ) ( not ( = ?auto_853219 ?auto_853220 ) ) ( not ( = ?auto_853219 ?auto_853221 ) ) ( not ( = ?auto_853219 ?auto_853222 ) ) ( not ( = ?auto_853219 ?auto_853223 ) ) ( not ( = ?auto_853219 ?auto_853224 ) ) ( not ( = ?auto_853219 ?auto_853225 ) ) ( not ( = ?auto_853219 ?auto_853226 ) ) ( not ( = ?auto_853219 ?auto_853227 ) ) ( not ( = ?auto_853219 ?auto_853228 ) ) ( not ( = ?auto_853219 ?auto_853229 ) ) ( not ( = ?auto_853219 ?auto_853230 ) ) ( not ( = ?auto_853219 ?auto_853231 ) ) ( not ( = ?auto_853219 ?auto_853232 ) ) ( not ( = ?auto_853219 ?auto_853233 ) ) ( not ( = ?auto_853219 ?auto_853234 ) ) ( not ( = ?auto_853219 ?auto_853235 ) ) ( not ( = ?auto_853219 ?auto_853236 ) ) ( not ( = ?auto_853219 ?auto_853237 ) ) ( not ( = ?auto_853220 ?auto_853221 ) ) ( not ( = ?auto_853220 ?auto_853222 ) ) ( not ( = ?auto_853220 ?auto_853223 ) ) ( not ( = ?auto_853220 ?auto_853224 ) ) ( not ( = ?auto_853220 ?auto_853225 ) ) ( not ( = ?auto_853220 ?auto_853226 ) ) ( not ( = ?auto_853220 ?auto_853227 ) ) ( not ( = ?auto_853220 ?auto_853228 ) ) ( not ( = ?auto_853220 ?auto_853229 ) ) ( not ( = ?auto_853220 ?auto_853230 ) ) ( not ( = ?auto_853220 ?auto_853231 ) ) ( not ( = ?auto_853220 ?auto_853232 ) ) ( not ( = ?auto_853220 ?auto_853233 ) ) ( not ( = ?auto_853220 ?auto_853234 ) ) ( not ( = ?auto_853220 ?auto_853235 ) ) ( not ( = ?auto_853220 ?auto_853236 ) ) ( not ( = ?auto_853220 ?auto_853237 ) ) ( not ( = ?auto_853221 ?auto_853222 ) ) ( not ( = ?auto_853221 ?auto_853223 ) ) ( not ( = ?auto_853221 ?auto_853224 ) ) ( not ( = ?auto_853221 ?auto_853225 ) ) ( not ( = ?auto_853221 ?auto_853226 ) ) ( not ( = ?auto_853221 ?auto_853227 ) ) ( not ( = ?auto_853221 ?auto_853228 ) ) ( not ( = ?auto_853221 ?auto_853229 ) ) ( not ( = ?auto_853221 ?auto_853230 ) ) ( not ( = ?auto_853221 ?auto_853231 ) ) ( not ( = ?auto_853221 ?auto_853232 ) ) ( not ( = ?auto_853221 ?auto_853233 ) ) ( not ( = ?auto_853221 ?auto_853234 ) ) ( not ( = ?auto_853221 ?auto_853235 ) ) ( not ( = ?auto_853221 ?auto_853236 ) ) ( not ( = ?auto_853221 ?auto_853237 ) ) ( not ( = ?auto_853222 ?auto_853223 ) ) ( not ( = ?auto_853222 ?auto_853224 ) ) ( not ( = ?auto_853222 ?auto_853225 ) ) ( not ( = ?auto_853222 ?auto_853226 ) ) ( not ( = ?auto_853222 ?auto_853227 ) ) ( not ( = ?auto_853222 ?auto_853228 ) ) ( not ( = ?auto_853222 ?auto_853229 ) ) ( not ( = ?auto_853222 ?auto_853230 ) ) ( not ( = ?auto_853222 ?auto_853231 ) ) ( not ( = ?auto_853222 ?auto_853232 ) ) ( not ( = ?auto_853222 ?auto_853233 ) ) ( not ( = ?auto_853222 ?auto_853234 ) ) ( not ( = ?auto_853222 ?auto_853235 ) ) ( not ( = ?auto_853222 ?auto_853236 ) ) ( not ( = ?auto_853222 ?auto_853237 ) ) ( not ( = ?auto_853223 ?auto_853224 ) ) ( not ( = ?auto_853223 ?auto_853225 ) ) ( not ( = ?auto_853223 ?auto_853226 ) ) ( not ( = ?auto_853223 ?auto_853227 ) ) ( not ( = ?auto_853223 ?auto_853228 ) ) ( not ( = ?auto_853223 ?auto_853229 ) ) ( not ( = ?auto_853223 ?auto_853230 ) ) ( not ( = ?auto_853223 ?auto_853231 ) ) ( not ( = ?auto_853223 ?auto_853232 ) ) ( not ( = ?auto_853223 ?auto_853233 ) ) ( not ( = ?auto_853223 ?auto_853234 ) ) ( not ( = ?auto_853223 ?auto_853235 ) ) ( not ( = ?auto_853223 ?auto_853236 ) ) ( not ( = ?auto_853223 ?auto_853237 ) ) ( not ( = ?auto_853224 ?auto_853225 ) ) ( not ( = ?auto_853224 ?auto_853226 ) ) ( not ( = ?auto_853224 ?auto_853227 ) ) ( not ( = ?auto_853224 ?auto_853228 ) ) ( not ( = ?auto_853224 ?auto_853229 ) ) ( not ( = ?auto_853224 ?auto_853230 ) ) ( not ( = ?auto_853224 ?auto_853231 ) ) ( not ( = ?auto_853224 ?auto_853232 ) ) ( not ( = ?auto_853224 ?auto_853233 ) ) ( not ( = ?auto_853224 ?auto_853234 ) ) ( not ( = ?auto_853224 ?auto_853235 ) ) ( not ( = ?auto_853224 ?auto_853236 ) ) ( not ( = ?auto_853224 ?auto_853237 ) ) ( not ( = ?auto_853225 ?auto_853226 ) ) ( not ( = ?auto_853225 ?auto_853227 ) ) ( not ( = ?auto_853225 ?auto_853228 ) ) ( not ( = ?auto_853225 ?auto_853229 ) ) ( not ( = ?auto_853225 ?auto_853230 ) ) ( not ( = ?auto_853225 ?auto_853231 ) ) ( not ( = ?auto_853225 ?auto_853232 ) ) ( not ( = ?auto_853225 ?auto_853233 ) ) ( not ( = ?auto_853225 ?auto_853234 ) ) ( not ( = ?auto_853225 ?auto_853235 ) ) ( not ( = ?auto_853225 ?auto_853236 ) ) ( not ( = ?auto_853225 ?auto_853237 ) ) ( not ( = ?auto_853226 ?auto_853227 ) ) ( not ( = ?auto_853226 ?auto_853228 ) ) ( not ( = ?auto_853226 ?auto_853229 ) ) ( not ( = ?auto_853226 ?auto_853230 ) ) ( not ( = ?auto_853226 ?auto_853231 ) ) ( not ( = ?auto_853226 ?auto_853232 ) ) ( not ( = ?auto_853226 ?auto_853233 ) ) ( not ( = ?auto_853226 ?auto_853234 ) ) ( not ( = ?auto_853226 ?auto_853235 ) ) ( not ( = ?auto_853226 ?auto_853236 ) ) ( not ( = ?auto_853226 ?auto_853237 ) ) ( not ( = ?auto_853227 ?auto_853228 ) ) ( not ( = ?auto_853227 ?auto_853229 ) ) ( not ( = ?auto_853227 ?auto_853230 ) ) ( not ( = ?auto_853227 ?auto_853231 ) ) ( not ( = ?auto_853227 ?auto_853232 ) ) ( not ( = ?auto_853227 ?auto_853233 ) ) ( not ( = ?auto_853227 ?auto_853234 ) ) ( not ( = ?auto_853227 ?auto_853235 ) ) ( not ( = ?auto_853227 ?auto_853236 ) ) ( not ( = ?auto_853227 ?auto_853237 ) ) ( not ( = ?auto_853228 ?auto_853229 ) ) ( not ( = ?auto_853228 ?auto_853230 ) ) ( not ( = ?auto_853228 ?auto_853231 ) ) ( not ( = ?auto_853228 ?auto_853232 ) ) ( not ( = ?auto_853228 ?auto_853233 ) ) ( not ( = ?auto_853228 ?auto_853234 ) ) ( not ( = ?auto_853228 ?auto_853235 ) ) ( not ( = ?auto_853228 ?auto_853236 ) ) ( not ( = ?auto_853228 ?auto_853237 ) ) ( not ( = ?auto_853229 ?auto_853230 ) ) ( not ( = ?auto_853229 ?auto_853231 ) ) ( not ( = ?auto_853229 ?auto_853232 ) ) ( not ( = ?auto_853229 ?auto_853233 ) ) ( not ( = ?auto_853229 ?auto_853234 ) ) ( not ( = ?auto_853229 ?auto_853235 ) ) ( not ( = ?auto_853229 ?auto_853236 ) ) ( not ( = ?auto_853229 ?auto_853237 ) ) ( not ( = ?auto_853230 ?auto_853231 ) ) ( not ( = ?auto_853230 ?auto_853232 ) ) ( not ( = ?auto_853230 ?auto_853233 ) ) ( not ( = ?auto_853230 ?auto_853234 ) ) ( not ( = ?auto_853230 ?auto_853235 ) ) ( not ( = ?auto_853230 ?auto_853236 ) ) ( not ( = ?auto_853230 ?auto_853237 ) ) ( not ( = ?auto_853231 ?auto_853232 ) ) ( not ( = ?auto_853231 ?auto_853233 ) ) ( not ( = ?auto_853231 ?auto_853234 ) ) ( not ( = ?auto_853231 ?auto_853235 ) ) ( not ( = ?auto_853231 ?auto_853236 ) ) ( not ( = ?auto_853231 ?auto_853237 ) ) ( not ( = ?auto_853232 ?auto_853233 ) ) ( not ( = ?auto_853232 ?auto_853234 ) ) ( not ( = ?auto_853232 ?auto_853235 ) ) ( not ( = ?auto_853232 ?auto_853236 ) ) ( not ( = ?auto_853232 ?auto_853237 ) ) ( not ( = ?auto_853233 ?auto_853234 ) ) ( not ( = ?auto_853233 ?auto_853235 ) ) ( not ( = ?auto_853233 ?auto_853236 ) ) ( not ( = ?auto_853233 ?auto_853237 ) ) ( not ( = ?auto_853234 ?auto_853235 ) ) ( not ( = ?auto_853234 ?auto_853236 ) ) ( not ( = ?auto_853234 ?auto_853237 ) ) ( not ( = ?auto_853235 ?auto_853236 ) ) ( not ( = ?auto_853235 ?auto_853237 ) ) ( not ( = ?auto_853236 ?auto_853237 ) ) ( ON ?auto_853235 ?auto_853236 ) ( ON ?auto_853234 ?auto_853235 ) ( ON ?auto_853233 ?auto_853234 ) ( ON ?auto_853232 ?auto_853233 ) ( ON ?auto_853231 ?auto_853232 ) ( ON ?auto_853230 ?auto_853231 ) ( CLEAR ?auto_853228 ) ( ON ?auto_853229 ?auto_853230 ) ( CLEAR ?auto_853229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_853219 ?auto_853220 ?auto_853221 ?auto_853222 ?auto_853223 ?auto_853224 ?auto_853225 ?auto_853226 ?auto_853227 ?auto_853228 ?auto_853229 )
      ( MAKE-18PILE ?auto_853219 ?auto_853220 ?auto_853221 ?auto_853222 ?auto_853223 ?auto_853224 ?auto_853225 ?auto_853226 ?auto_853227 ?auto_853228 ?auto_853229 ?auto_853230 ?auto_853231 ?auto_853232 ?auto_853233 ?auto_853234 ?auto_853235 ?auto_853236 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_853256 - BLOCK
      ?auto_853257 - BLOCK
      ?auto_853258 - BLOCK
      ?auto_853259 - BLOCK
      ?auto_853260 - BLOCK
      ?auto_853261 - BLOCK
      ?auto_853262 - BLOCK
      ?auto_853263 - BLOCK
      ?auto_853264 - BLOCK
      ?auto_853265 - BLOCK
      ?auto_853266 - BLOCK
      ?auto_853267 - BLOCK
      ?auto_853268 - BLOCK
      ?auto_853269 - BLOCK
      ?auto_853270 - BLOCK
      ?auto_853271 - BLOCK
      ?auto_853272 - BLOCK
      ?auto_853273 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_853273 ) ( ON-TABLE ?auto_853256 ) ( ON ?auto_853257 ?auto_853256 ) ( ON ?auto_853258 ?auto_853257 ) ( ON ?auto_853259 ?auto_853258 ) ( ON ?auto_853260 ?auto_853259 ) ( ON ?auto_853261 ?auto_853260 ) ( ON ?auto_853262 ?auto_853261 ) ( ON ?auto_853263 ?auto_853262 ) ( ON ?auto_853264 ?auto_853263 ) ( ON ?auto_853265 ?auto_853264 ) ( not ( = ?auto_853256 ?auto_853257 ) ) ( not ( = ?auto_853256 ?auto_853258 ) ) ( not ( = ?auto_853256 ?auto_853259 ) ) ( not ( = ?auto_853256 ?auto_853260 ) ) ( not ( = ?auto_853256 ?auto_853261 ) ) ( not ( = ?auto_853256 ?auto_853262 ) ) ( not ( = ?auto_853256 ?auto_853263 ) ) ( not ( = ?auto_853256 ?auto_853264 ) ) ( not ( = ?auto_853256 ?auto_853265 ) ) ( not ( = ?auto_853256 ?auto_853266 ) ) ( not ( = ?auto_853256 ?auto_853267 ) ) ( not ( = ?auto_853256 ?auto_853268 ) ) ( not ( = ?auto_853256 ?auto_853269 ) ) ( not ( = ?auto_853256 ?auto_853270 ) ) ( not ( = ?auto_853256 ?auto_853271 ) ) ( not ( = ?auto_853256 ?auto_853272 ) ) ( not ( = ?auto_853256 ?auto_853273 ) ) ( not ( = ?auto_853257 ?auto_853258 ) ) ( not ( = ?auto_853257 ?auto_853259 ) ) ( not ( = ?auto_853257 ?auto_853260 ) ) ( not ( = ?auto_853257 ?auto_853261 ) ) ( not ( = ?auto_853257 ?auto_853262 ) ) ( not ( = ?auto_853257 ?auto_853263 ) ) ( not ( = ?auto_853257 ?auto_853264 ) ) ( not ( = ?auto_853257 ?auto_853265 ) ) ( not ( = ?auto_853257 ?auto_853266 ) ) ( not ( = ?auto_853257 ?auto_853267 ) ) ( not ( = ?auto_853257 ?auto_853268 ) ) ( not ( = ?auto_853257 ?auto_853269 ) ) ( not ( = ?auto_853257 ?auto_853270 ) ) ( not ( = ?auto_853257 ?auto_853271 ) ) ( not ( = ?auto_853257 ?auto_853272 ) ) ( not ( = ?auto_853257 ?auto_853273 ) ) ( not ( = ?auto_853258 ?auto_853259 ) ) ( not ( = ?auto_853258 ?auto_853260 ) ) ( not ( = ?auto_853258 ?auto_853261 ) ) ( not ( = ?auto_853258 ?auto_853262 ) ) ( not ( = ?auto_853258 ?auto_853263 ) ) ( not ( = ?auto_853258 ?auto_853264 ) ) ( not ( = ?auto_853258 ?auto_853265 ) ) ( not ( = ?auto_853258 ?auto_853266 ) ) ( not ( = ?auto_853258 ?auto_853267 ) ) ( not ( = ?auto_853258 ?auto_853268 ) ) ( not ( = ?auto_853258 ?auto_853269 ) ) ( not ( = ?auto_853258 ?auto_853270 ) ) ( not ( = ?auto_853258 ?auto_853271 ) ) ( not ( = ?auto_853258 ?auto_853272 ) ) ( not ( = ?auto_853258 ?auto_853273 ) ) ( not ( = ?auto_853259 ?auto_853260 ) ) ( not ( = ?auto_853259 ?auto_853261 ) ) ( not ( = ?auto_853259 ?auto_853262 ) ) ( not ( = ?auto_853259 ?auto_853263 ) ) ( not ( = ?auto_853259 ?auto_853264 ) ) ( not ( = ?auto_853259 ?auto_853265 ) ) ( not ( = ?auto_853259 ?auto_853266 ) ) ( not ( = ?auto_853259 ?auto_853267 ) ) ( not ( = ?auto_853259 ?auto_853268 ) ) ( not ( = ?auto_853259 ?auto_853269 ) ) ( not ( = ?auto_853259 ?auto_853270 ) ) ( not ( = ?auto_853259 ?auto_853271 ) ) ( not ( = ?auto_853259 ?auto_853272 ) ) ( not ( = ?auto_853259 ?auto_853273 ) ) ( not ( = ?auto_853260 ?auto_853261 ) ) ( not ( = ?auto_853260 ?auto_853262 ) ) ( not ( = ?auto_853260 ?auto_853263 ) ) ( not ( = ?auto_853260 ?auto_853264 ) ) ( not ( = ?auto_853260 ?auto_853265 ) ) ( not ( = ?auto_853260 ?auto_853266 ) ) ( not ( = ?auto_853260 ?auto_853267 ) ) ( not ( = ?auto_853260 ?auto_853268 ) ) ( not ( = ?auto_853260 ?auto_853269 ) ) ( not ( = ?auto_853260 ?auto_853270 ) ) ( not ( = ?auto_853260 ?auto_853271 ) ) ( not ( = ?auto_853260 ?auto_853272 ) ) ( not ( = ?auto_853260 ?auto_853273 ) ) ( not ( = ?auto_853261 ?auto_853262 ) ) ( not ( = ?auto_853261 ?auto_853263 ) ) ( not ( = ?auto_853261 ?auto_853264 ) ) ( not ( = ?auto_853261 ?auto_853265 ) ) ( not ( = ?auto_853261 ?auto_853266 ) ) ( not ( = ?auto_853261 ?auto_853267 ) ) ( not ( = ?auto_853261 ?auto_853268 ) ) ( not ( = ?auto_853261 ?auto_853269 ) ) ( not ( = ?auto_853261 ?auto_853270 ) ) ( not ( = ?auto_853261 ?auto_853271 ) ) ( not ( = ?auto_853261 ?auto_853272 ) ) ( not ( = ?auto_853261 ?auto_853273 ) ) ( not ( = ?auto_853262 ?auto_853263 ) ) ( not ( = ?auto_853262 ?auto_853264 ) ) ( not ( = ?auto_853262 ?auto_853265 ) ) ( not ( = ?auto_853262 ?auto_853266 ) ) ( not ( = ?auto_853262 ?auto_853267 ) ) ( not ( = ?auto_853262 ?auto_853268 ) ) ( not ( = ?auto_853262 ?auto_853269 ) ) ( not ( = ?auto_853262 ?auto_853270 ) ) ( not ( = ?auto_853262 ?auto_853271 ) ) ( not ( = ?auto_853262 ?auto_853272 ) ) ( not ( = ?auto_853262 ?auto_853273 ) ) ( not ( = ?auto_853263 ?auto_853264 ) ) ( not ( = ?auto_853263 ?auto_853265 ) ) ( not ( = ?auto_853263 ?auto_853266 ) ) ( not ( = ?auto_853263 ?auto_853267 ) ) ( not ( = ?auto_853263 ?auto_853268 ) ) ( not ( = ?auto_853263 ?auto_853269 ) ) ( not ( = ?auto_853263 ?auto_853270 ) ) ( not ( = ?auto_853263 ?auto_853271 ) ) ( not ( = ?auto_853263 ?auto_853272 ) ) ( not ( = ?auto_853263 ?auto_853273 ) ) ( not ( = ?auto_853264 ?auto_853265 ) ) ( not ( = ?auto_853264 ?auto_853266 ) ) ( not ( = ?auto_853264 ?auto_853267 ) ) ( not ( = ?auto_853264 ?auto_853268 ) ) ( not ( = ?auto_853264 ?auto_853269 ) ) ( not ( = ?auto_853264 ?auto_853270 ) ) ( not ( = ?auto_853264 ?auto_853271 ) ) ( not ( = ?auto_853264 ?auto_853272 ) ) ( not ( = ?auto_853264 ?auto_853273 ) ) ( not ( = ?auto_853265 ?auto_853266 ) ) ( not ( = ?auto_853265 ?auto_853267 ) ) ( not ( = ?auto_853265 ?auto_853268 ) ) ( not ( = ?auto_853265 ?auto_853269 ) ) ( not ( = ?auto_853265 ?auto_853270 ) ) ( not ( = ?auto_853265 ?auto_853271 ) ) ( not ( = ?auto_853265 ?auto_853272 ) ) ( not ( = ?auto_853265 ?auto_853273 ) ) ( not ( = ?auto_853266 ?auto_853267 ) ) ( not ( = ?auto_853266 ?auto_853268 ) ) ( not ( = ?auto_853266 ?auto_853269 ) ) ( not ( = ?auto_853266 ?auto_853270 ) ) ( not ( = ?auto_853266 ?auto_853271 ) ) ( not ( = ?auto_853266 ?auto_853272 ) ) ( not ( = ?auto_853266 ?auto_853273 ) ) ( not ( = ?auto_853267 ?auto_853268 ) ) ( not ( = ?auto_853267 ?auto_853269 ) ) ( not ( = ?auto_853267 ?auto_853270 ) ) ( not ( = ?auto_853267 ?auto_853271 ) ) ( not ( = ?auto_853267 ?auto_853272 ) ) ( not ( = ?auto_853267 ?auto_853273 ) ) ( not ( = ?auto_853268 ?auto_853269 ) ) ( not ( = ?auto_853268 ?auto_853270 ) ) ( not ( = ?auto_853268 ?auto_853271 ) ) ( not ( = ?auto_853268 ?auto_853272 ) ) ( not ( = ?auto_853268 ?auto_853273 ) ) ( not ( = ?auto_853269 ?auto_853270 ) ) ( not ( = ?auto_853269 ?auto_853271 ) ) ( not ( = ?auto_853269 ?auto_853272 ) ) ( not ( = ?auto_853269 ?auto_853273 ) ) ( not ( = ?auto_853270 ?auto_853271 ) ) ( not ( = ?auto_853270 ?auto_853272 ) ) ( not ( = ?auto_853270 ?auto_853273 ) ) ( not ( = ?auto_853271 ?auto_853272 ) ) ( not ( = ?auto_853271 ?auto_853273 ) ) ( not ( = ?auto_853272 ?auto_853273 ) ) ( ON ?auto_853272 ?auto_853273 ) ( ON ?auto_853271 ?auto_853272 ) ( ON ?auto_853270 ?auto_853271 ) ( ON ?auto_853269 ?auto_853270 ) ( ON ?auto_853268 ?auto_853269 ) ( ON ?auto_853267 ?auto_853268 ) ( CLEAR ?auto_853265 ) ( ON ?auto_853266 ?auto_853267 ) ( CLEAR ?auto_853266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_853256 ?auto_853257 ?auto_853258 ?auto_853259 ?auto_853260 ?auto_853261 ?auto_853262 ?auto_853263 ?auto_853264 ?auto_853265 ?auto_853266 )
      ( MAKE-18PILE ?auto_853256 ?auto_853257 ?auto_853258 ?auto_853259 ?auto_853260 ?auto_853261 ?auto_853262 ?auto_853263 ?auto_853264 ?auto_853265 ?auto_853266 ?auto_853267 ?auto_853268 ?auto_853269 ?auto_853270 ?auto_853271 ?auto_853272 ?auto_853273 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_853292 - BLOCK
      ?auto_853293 - BLOCK
      ?auto_853294 - BLOCK
      ?auto_853295 - BLOCK
      ?auto_853296 - BLOCK
      ?auto_853297 - BLOCK
      ?auto_853298 - BLOCK
      ?auto_853299 - BLOCK
      ?auto_853300 - BLOCK
      ?auto_853301 - BLOCK
      ?auto_853302 - BLOCK
      ?auto_853303 - BLOCK
      ?auto_853304 - BLOCK
      ?auto_853305 - BLOCK
      ?auto_853306 - BLOCK
      ?auto_853307 - BLOCK
      ?auto_853308 - BLOCK
      ?auto_853309 - BLOCK
    )
    :vars
    (
      ?auto_853310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_853309 ?auto_853310 ) ( ON-TABLE ?auto_853292 ) ( ON ?auto_853293 ?auto_853292 ) ( ON ?auto_853294 ?auto_853293 ) ( ON ?auto_853295 ?auto_853294 ) ( ON ?auto_853296 ?auto_853295 ) ( ON ?auto_853297 ?auto_853296 ) ( ON ?auto_853298 ?auto_853297 ) ( ON ?auto_853299 ?auto_853298 ) ( ON ?auto_853300 ?auto_853299 ) ( not ( = ?auto_853292 ?auto_853293 ) ) ( not ( = ?auto_853292 ?auto_853294 ) ) ( not ( = ?auto_853292 ?auto_853295 ) ) ( not ( = ?auto_853292 ?auto_853296 ) ) ( not ( = ?auto_853292 ?auto_853297 ) ) ( not ( = ?auto_853292 ?auto_853298 ) ) ( not ( = ?auto_853292 ?auto_853299 ) ) ( not ( = ?auto_853292 ?auto_853300 ) ) ( not ( = ?auto_853292 ?auto_853301 ) ) ( not ( = ?auto_853292 ?auto_853302 ) ) ( not ( = ?auto_853292 ?auto_853303 ) ) ( not ( = ?auto_853292 ?auto_853304 ) ) ( not ( = ?auto_853292 ?auto_853305 ) ) ( not ( = ?auto_853292 ?auto_853306 ) ) ( not ( = ?auto_853292 ?auto_853307 ) ) ( not ( = ?auto_853292 ?auto_853308 ) ) ( not ( = ?auto_853292 ?auto_853309 ) ) ( not ( = ?auto_853292 ?auto_853310 ) ) ( not ( = ?auto_853293 ?auto_853294 ) ) ( not ( = ?auto_853293 ?auto_853295 ) ) ( not ( = ?auto_853293 ?auto_853296 ) ) ( not ( = ?auto_853293 ?auto_853297 ) ) ( not ( = ?auto_853293 ?auto_853298 ) ) ( not ( = ?auto_853293 ?auto_853299 ) ) ( not ( = ?auto_853293 ?auto_853300 ) ) ( not ( = ?auto_853293 ?auto_853301 ) ) ( not ( = ?auto_853293 ?auto_853302 ) ) ( not ( = ?auto_853293 ?auto_853303 ) ) ( not ( = ?auto_853293 ?auto_853304 ) ) ( not ( = ?auto_853293 ?auto_853305 ) ) ( not ( = ?auto_853293 ?auto_853306 ) ) ( not ( = ?auto_853293 ?auto_853307 ) ) ( not ( = ?auto_853293 ?auto_853308 ) ) ( not ( = ?auto_853293 ?auto_853309 ) ) ( not ( = ?auto_853293 ?auto_853310 ) ) ( not ( = ?auto_853294 ?auto_853295 ) ) ( not ( = ?auto_853294 ?auto_853296 ) ) ( not ( = ?auto_853294 ?auto_853297 ) ) ( not ( = ?auto_853294 ?auto_853298 ) ) ( not ( = ?auto_853294 ?auto_853299 ) ) ( not ( = ?auto_853294 ?auto_853300 ) ) ( not ( = ?auto_853294 ?auto_853301 ) ) ( not ( = ?auto_853294 ?auto_853302 ) ) ( not ( = ?auto_853294 ?auto_853303 ) ) ( not ( = ?auto_853294 ?auto_853304 ) ) ( not ( = ?auto_853294 ?auto_853305 ) ) ( not ( = ?auto_853294 ?auto_853306 ) ) ( not ( = ?auto_853294 ?auto_853307 ) ) ( not ( = ?auto_853294 ?auto_853308 ) ) ( not ( = ?auto_853294 ?auto_853309 ) ) ( not ( = ?auto_853294 ?auto_853310 ) ) ( not ( = ?auto_853295 ?auto_853296 ) ) ( not ( = ?auto_853295 ?auto_853297 ) ) ( not ( = ?auto_853295 ?auto_853298 ) ) ( not ( = ?auto_853295 ?auto_853299 ) ) ( not ( = ?auto_853295 ?auto_853300 ) ) ( not ( = ?auto_853295 ?auto_853301 ) ) ( not ( = ?auto_853295 ?auto_853302 ) ) ( not ( = ?auto_853295 ?auto_853303 ) ) ( not ( = ?auto_853295 ?auto_853304 ) ) ( not ( = ?auto_853295 ?auto_853305 ) ) ( not ( = ?auto_853295 ?auto_853306 ) ) ( not ( = ?auto_853295 ?auto_853307 ) ) ( not ( = ?auto_853295 ?auto_853308 ) ) ( not ( = ?auto_853295 ?auto_853309 ) ) ( not ( = ?auto_853295 ?auto_853310 ) ) ( not ( = ?auto_853296 ?auto_853297 ) ) ( not ( = ?auto_853296 ?auto_853298 ) ) ( not ( = ?auto_853296 ?auto_853299 ) ) ( not ( = ?auto_853296 ?auto_853300 ) ) ( not ( = ?auto_853296 ?auto_853301 ) ) ( not ( = ?auto_853296 ?auto_853302 ) ) ( not ( = ?auto_853296 ?auto_853303 ) ) ( not ( = ?auto_853296 ?auto_853304 ) ) ( not ( = ?auto_853296 ?auto_853305 ) ) ( not ( = ?auto_853296 ?auto_853306 ) ) ( not ( = ?auto_853296 ?auto_853307 ) ) ( not ( = ?auto_853296 ?auto_853308 ) ) ( not ( = ?auto_853296 ?auto_853309 ) ) ( not ( = ?auto_853296 ?auto_853310 ) ) ( not ( = ?auto_853297 ?auto_853298 ) ) ( not ( = ?auto_853297 ?auto_853299 ) ) ( not ( = ?auto_853297 ?auto_853300 ) ) ( not ( = ?auto_853297 ?auto_853301 ) ) ( not ( = ?auto_853297 ?auto_853302 ) ) ( not ( = ?auto_853297 ?auto_853303 ) ) ( not ( = ?auto_853297 ?auto_853304 ) ) ( not ( = ?auto_853297 ?auto_853305 ) ) ( not ( = ?auto_853297 ?auto_853306 ) ) ( not ( = ?auto_853297 ?auto_853307 ) ) ( not ( = ?auto_853297 ?auto_853308 ) ) ( not ( = ?auto_853297 ?auto_853309 ) ) ( not ( = ?auto_853297 ?auto_853310 ) ) ( not ( = ?auto_853298 ?auto_853299 ) ) ( not ( = ?auto_853298 ?auto_853300 ) ) ( not ( = ?auto_853298 ?auto_853301 ) ) ( not ( = ?auto_853298 ?auto_853302 ) ) ( not ( = ?auto_853298 ?auto_853303 ) ) ( not ( = ?auto_853298 ?auto_853304 ) ) ( not ( = ?auto_853298 ?auto_853305 ) ) ( not ( = ?auto_853298 ?auto_853306 ) ) ( not ( = ?auto_853298 ?auto_853307 ) ) ( not ( = ?auto_853298 ?auto_853308 ) ) ( not ( = ?auto_853298 ?auto_853309 ) ) ( not ( = ?auto_853298 ?auto_853310 ) ) ( not ( = ?auto_853299 ?auto_853300 ) ) ( not ( = ?auto_853299 ?auto_853301 ) ) ( not ( = ?auto_853299 ?auto_853302 ) ) ( not ( = ?auto_853299 ?auto_853303 ) ) ( not ( = ?auto_853299 ?auto_853304 ) ) ( not ( = ?auto_853299 ?auto_853305 ) ) ( not ( = ?auto_853299 ?auto_853306 ) ) ( not ( = ?auto_853299 ?auto_853307 ) ) ( not ( = ?auto_853299 ?auto_853308 ) ) ( not ( = ?auto_853299 ?auto_853309 ) ) ( not ( = ?auto_853299 ?auto_853310 ) ) ( not ( = ?auto_853300 ?auto_853301 ) ) ( not ( = ?auto_853300 ?auto_853302 ) ) ( not ( = ?auto_853300 ?auto_853303 ) ) ( not ( = ?auto_853300 ?auto_853304 ) ) ( not ( = ?auto_853300 ?auto_853305 ) ) ( not ( = ?auto_853300 ?auto_853306 ) ) ( not ( = ?auto_853300 ?auto_853307 ) ) ( not ( = ?auto_853300 ?auto_853308 ) ) ( not ( = ?auto_853300 ?auto_853309 ) ) ( not ( = ?auto_853300 ?auto_853310 ) ) ( not ( = ?auto_853301 ?auto_853302 ) ) ( not ( = ?auto_853301 ?auto_853303 ) ) ( not ( = ?auto_853301 ?auto_853304 ) ) ( not ( = ?auto_853301 ?auto_853305 ) ) ( not ( = ?auto_853301 ?auto_853306 ) ) ( not ( = ?auto_853301 ?auto_853307 ) ) ( not ( = ?auto_853301 ?auto_853308 ) ) ( not ( = ?auto_853301 ?auto_853309 ) ) ( not ( = ?auto_853301 ?auto_853310 ) ) ( not ( = ?auto_853302 ?auto_853303 ) ) ( not ( = ?auto_853302 ?auto_853304 ) ) ( not ( = ?auto_853302 ?auto_853305 ) ) ( not ( = ?auto_853302 ?auto_853306 ) ) ( not ( = ?auto_853302 ?auto_853307 ) ) ( not ( = ?auto_853302 ?auto_853308 ) ) ( not ( = ?auto_853302 ?auto_853309 ) ) ( not ( = ?auto_853302 ?auto_853310 ) ) ( not ( = ?auto_853303 ?auto_853304 ) ) ( not ( = ?auto_853303 ?auto_853305 ) ) ( not ( = ?auto_853303 ?auto_853306 ) ) ( not ( = ?auto_853303 ?auto_853307 ) ) ( not ( = ?auto_853303 ?auto_853308 ) ) ( not ( = ?auto_853303 ?auto_853309 ) ) ( not ( = ?auto_853303 ?auto_853310 ) ) ( not ( = ?auto_853304 ?auto_853305 ) ) ( not ( = ?auto_853304 ?auto_853306 ) ) ( not ( = ?auto_853304 ?auto_853307 ) ) ( not ( = ?auto_853304 ?auto_853308 ) ) ( not ( = ?auto_853304 ?auto_853309 ) ) ( not ( = ?auto_853304 ?auto_853310 ) ) ( not ( = ?auto_853305 ?auto_853306 ) ) ( not ( = ?auto_853305 ?auto_853307 ) ) ( not ( = ?auto_853305 ?auto_853308 ) ) ( not ( = ?auto_853305 ?auto_853309 ) ) ( not ( = ?auto_853305 ?auto_853310 ) ) ( not ( = ?auto_853306 ?auto_853307 ) ) ( not ( = ?auto_853306 ?auto_853308 ) ) ( not ( = ?auto_853306 ?auto_853309 ) ) ( not ( = ?auto_853306 ?auto_853310 ) ) ( not ( = ?auto_853307 ?auto_853308 ) ) ( not ( = ?auto_853307 ?auto_853309 ) ) ( not ( = ?auto_853307 ?auto_853310 ) ) ( not ( = ?auto_853308 ?auto_853309 ) ) ( not ( = ?auto_853308 ?auto_853310 ) ) ( not ( = ?auto_853309 ?auto_853310 ) ) ( ON ?auto_853308 ?auto_853309 ) ( ON ?auto_853307 ?auto_853308 ) ( ON ?auto_853306 ?auto_853307 ) ( ON ?auto_853305 ?auto_853306 ) ( ON ?auto_853304 ?auto_853305 ) ( ON ?auto_853303 ?auto_853304 ) ( ON ?auto_853302 ?auto_853303 ) ( CLEAR ?auto_853300 ) ( ON ?auto_853301 ?auto_853302 ) ( CLEAR ?auto_853301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_853292 ?auto_853293 ?auto_853294 ?auto_853295 ?auto_853296 ?auto_853297 ?auto_853298 ?auto_853299 ?auto_853300 ?auto_853301 )
      ( MAKE-18PILE ?auto_853292 ?auto_853293 ?auto_853294 ?auto_853295 ?auto_853296 ?auto_853297 ?auto_853298 ?auto_853299 ?auto_853300 ?auto_853301 ?auto_853302 ?auto_853303 ?auto_853304 ?auto_853305 ?auto_853306 ?auto_853307 ?auto_853308 ?auto_853309 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_853329 - BLOCK
      ?auto_853330 - BLOCK
      ?auto_853331 - BLOCK
      ?auto_853332 - BLOCK
      ?auto_853333 - BLOCK
      ?auto_853334 - BLOCK
      ?auto_853335 - BLOCK
      ?auto_853336 - BLOCK
      ?auto_853337 - BLOCK
      ?auto_853338 - BLOCK
      ?auto_853339 - BLOCK
      ?auto_853340 - BLOCK
      ?auto_853341 - BLOCK
      ?auto_853342 - BLOCK
      ?auto_853343 - BLOCK
      ?auto_853344 - BLOCK
      ?auto_853345 - BLOCK
      ?auto_853346 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_853346 ) ( ON-TABLE ?auto_853329 ) ( ON ?auto_853330 ?auto_853329 ) ( ON ?auto_853331 ?auto_853330 ) ( ON ?auto_853332 ?auto_853331 ) ( ON ?auto_853333 ?auto_853332 ) ( ON ?auto_853334 ?auto_853333 ) ( ON ?auto_853335 ?auto_853334 ) ( ON ?auto_853336 ?auto_853335 ) ( ON ?auto_853337 ?auto_853336 ) ( not ( = ?auto_853329 ?auto_853330 ) ) ( not ( = ?auto_853329 ?auto_853331 ) ) ( not ( = ?auto_853329 ?auto_853332 ) ) ( not ( = ?auto_853329 ?auto_853333 ) ) ( not ( = ?auto_853329 ?auto_853334 ) ) ( not ( = ?auto_853329 ?auto_853335 ) ) ( not ( = ?auto_853329 ?auto_853336 ) ) ( not ( = ?auto_853329 ?auto_853337 ) ) ( not ( = ?auto_853329 ?auto_853338 ) ) ( not ( = ?auto_853329 ?auto_853339 ) ) ( not ( = ?auto_853329 ?auto_853340 ) ) ( not ( = ?auto_853329 ?auto_853341 ) ) ( not ( = ?auto_853329 ?auto_853342 ) ) ( not ( = ?auto_853329 ?auto_853343 ) ) ( not ( = ?auto_853329 ?auto_853344 ) ) ( not ( = ?auto_853329 ?auto_853345 ) ) ( not ( = ?auto_853329 ?auto_853346 ) ) ( not ( = ?auto_853330 ?auto_853331 ) ) ( not ( = ?auto_853330 ?auto_853332 ) ) ( not ( = ?auto_853330 ?auto_853333 ) ) ( not ( = ?auto_853330 ?auto_853334 ) ) ( not ( = ?auto_853330 ?auto_853335 ) ) ( not ( = ?auto_853330 ?auto_853336 ) ) ( not ( = ?auto_853330 ?auto_853337 ) ) ( not ( = ?auto_853330 ?auto_853338 ) ) ( not ( = ?auto_853330 ?auto_853339 ) ) ( not ( = ?auto_853330 ?auto_853340 ) ) ( not ( = ?auto_853330 ?auto_853341 ) ) ( not ( = ?auto_853330 ?auto_853342 ) ) ( not ( = ?auto_853330 ?auto_853343 ) ) ( not ( = ?auto_853330 ?auto_853344 ) ) ( not ( = ?auto_853330 ?auto_853345 ) ) ( not ( = ?auto_853330 ?auto_853346 ) ) ( not ( = ?auto_853331 ?auto_853332 ) ) ( not ( = ?auto_853331 ?auto_853333 ) ) ( not ( = ?auto_853331 ?auto_853334 ) ) ( not ( = ?auto_853331 ?auto_853335 ) ) ( not ( = ?auto_853331 ?auto_853336 ) ) ( not ( = ?auto_853331 ?auto_853337 ) ) ( not ( = ?auto_853331 ?auto_853338 ) ) ( not ( = ?auto_853331 ?auto_853339 ) ) ( not ( = ?auto_853331 ?auto_853340 ) ) ( not ( = ?auto_853331 ?auto_853341 ) ) ( not ( = ?auto_853331 ?auto_853342 ) ) ( not ( = ?auto_853331 ?auto_853343 ) ) ( not ( = ?auto_853331 ?auto_853344 ) ) ( not ( = ?auto_853331 ?auto_853345 ) ) ( not ( = ?auto_853331 ?auto_853346 ) ) ( not ( = ?auto_853332 ?auto_853333 ) ) ( not ( = ?auto_853332 ?auto_853334 ) ) ( not ( = ?auto_853332 ?auto_853335 ) ) ( not ( = ?auto_853332 ?auto_853336 ) ) ( not ( = ?auto_853332 ?auto_853337 ) ) ( not ( = ?auto_853332 ?auto_853338 ) ) ( not ( = ?auto_853332 ?auto_853339 ) ) ( not ( = ?auto_853332 ?auto_853340 ) ) ( not ( = ?auto_853332 ?auto_853341 ) ) ( not ( = ?auto_853332 ?auto_853342 ) ) ( not ( = ?auto_853332 ?auto_853343 ) ) ( not ( = ?auto_853332 ?auto_853344 ) ) ( not ( = ?auto_853332 ?auto_853345 ) ) ( not ( = ?auto_853332 ?auto_853346 ) ) ( not ( = ?auto_853333 ?auto_853334 ) ) ( not ( = ?auto_853333 ?auto_853335 ) ) ( not ( = ?auto_853333 ?auto_853336 ) ) ( not ( = ?auto_853333 ?auto_853337 ) ) ( not ( = ?auto_853333 ?auto_853338 ) ) ( not ( = ?auto_853333 ?auto_853339 ) ) ( not ( = ?auto_853333 ?auto_853340 ) ) ( not ( = ?auto_853333 ?auto_853341 ) ) ( not ( = ?auto_853333 ?auto_853342 ) ) ( not ( = ?auto_853333 ?auto_853343 ) ) ( not ( = ?auto_853333 ?auto_853344 ) ) ( not ( = ?auto_853333 ?auto_853345 ) ) ( not ( = ?auto_853333 ?auto_853346 ) ) ( not ( = ?auto_853334 ?auto_853335 ) ) ( not ( = ?auto_853334 ?auto_853336 ) ) ( not ( = ?auto_853334 ?auto_853337 ) ) ( not ( = ?auto_853334 ?auto_853338 ) ) ( not ( = ?auto_853334 ?auto_853339 ) ) ( not ( = ?auto_853334 ?auto_853340 ) ) ( not ( = ?auto_853334 ?auto_853341 ) ) ( not ( = ?auto_853334 ?auto_853342 ) ) ( not ( = ?auto_853334 ?auto_853343 ) ) ( not ( = ?auto_853334 ?auto_853344 ) ) ( not ( = ?auto_853334 ?auto_853345 ) ) ( not ( = ?auto_853334 ?auto_853346 ) ) ( not ( = ?auto_853335 ?auto_853336 ) ) ( not ( = ?auto_853335 ?auto_853337 ) ) ( not ( = ?auto_853335 ?auto_853338 ) ) ( not ( = ?auto_853335 ?auto_853339 ) ) ( not ( = ?auto_853335 ?auto_853340 ) ) ( not ( = ?auto_853335 ?auto_853341 ) ) ( not ( = ?auto_853335 ?auto_853342 ) ) ( not ( = ?auto_853335 ?auto_853343 ) ) ( not ( = ?auto_853335 ?auto_853344 ) ) ( not ( = ?auto_853335 ?auto_853345 ) ) ( not ( = ?auto_853335 ?auto_853346 ) ) ( not ( = ?auto_853336 ?auto_853337 ) ) ( not ( = ?auto_853336 ?auto_853338 ) ) ( not ( = ?auto_853336 ?auto_853339 ) ) ( not ( = ?auto_853336 ?auto_853340 ) ) ( not ( = ?auto_853336 ?auto_853341 ) ) ( not ( = ?auto_853336 ?auto_853342 ) ) ( not ( = ?auto_853336 ?auto_853343 ) ) ( not ( = ?auto_853336 ?auto_853344 ) ) ( not ( = ?auto_853336 ?auto_853345 ) ) ( not ( = ?auto_853336 ?auto_853346 ) ) ( not ( = ?auto_853337 ?auto_853338 ) ) ( not ( = ?auto_853337 ?auto_853339 ) ) ( not ( = ?auto_853337 ?auto_853340 ) ) ( not ( = ?auto_853337 ?auto_853341 ) ) ( not ( = ?auto_853337 ?auto_853342 ) ) ( not ( = ?auto_853337 ?auto_853343 ) ) ( not ( = ?auto_853337 ?auto_853344 ) ) ( not ( = ?auto_853337 ?auto_853345 ) ) ( not ( = ?auto_853337 ?auto_853346 ) ) ( not ( = ?auto_853338 ?auto_853339 ) ) ( not ( = ?auto_853338 ?auto_853340 ) ) ( not ( = ?auto_853338 ?auto_853341 ) ) ( not ( = ?auto_853338 ?auto_853342 ) ) ( not ( = ?auto_853338 ?auto_853343 ) ) ( not ( = ?auto_853338 ?auto_853344 ) ) ( not ( = ?auto_853338 ?auto_853345 ) ) ( not ( = ?auto_853338 ?auto_853346 ) ) ( not ( = ?auto_853339 ?auto_853340 ) ) ( not ( = ?auto_853339 ?auto_853341 ) ) ( not ( = ?auto_853339 ?auto_853342 ) ) ( not ( = ?auto_853339 ?auto_853343 ) ) ( not ( = ?auto_853339 ?auto_853344 ) ) ( not ( = ?auto_853339 ?auto_853345 ) ) ( not ( = ?auto_853339 ?auto_853346 ) ) ( not ( = ?auto_853340 ?auto_853341 ) ) ( not ( = ?auto_853340 ?auto_853342 ) ) ( not ( = ?auto_853340 ?auto_853343 ) ) ( not ( = ?auto_853340 ?auto_853344 ) ) ( not ( = ?auto_853340 ?auto_853345 ) ) ( not ( = ?auto_853340 ?auto_853346 ) ) ( not ( = ?auto_853341 ?auto_853342 ) ) ( not ( = ?auto_853341 ?auto_853343 ) ) ( not ( = ?auto_853341 ?auto_853344 ) ) ( not ( = ?auto_853341 ?auto_853345 ) ) ( not ( = ?auto_853341 ?auto_853346 ) ) ( not ( = ?auto_853342 ?auto_853343 ) ) ( not ( = ?auto_853342 ?auto_853344 ) ) ( not ( = ?auto_853342 ?auto_853345 ) ) ( not ( = ?auto_853342 ?auto_853346 ) ) ( not ( = ?auto_853343 ?auto_853344 ) ) ( not ( = ?auto_853343 ?auto_853345 ) ) ( not ( = ?auto_853343 ?auto_853346 ) ) ( not ( = ?auto_853344 ?auto_853345 ) ) ( not ( = ?auto_853344 ?auto_853346 ) ) ( not ( = ?auto_853345 ?auto_853346 ) ) ( ON ?auto_853345 ?auto_853346 ) ( ON ?auto_853344 ?auto_853345 ) ( ON ?auto_853343 ?auto_853344 ) ( ON ?auto_853342 ?auto_853343 ) ( ON ?auto_853341 ?auto_853342 ) ( ON ?auto_853340 ?auto_853341 ) ( ON ?auto_853339 ?auto_853340 ) ( CLEAR ?auto_853337 ) ( ON ?auto_853338 ?auto_853339 ) ( CLEAR ?auto_853338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_853329 ?auto_853330 ?auto_853331 ?auto_853332 ?auto_853333 ?auto_853334 ?auto_853335 ?auto_853336 ?auto_853337 ?auto_853338 )
      ( MAKE-18PILE ?auto_853329 ?auto_853330 ?auto_853331 ?auto_853332 ?auto_853333 ?auto_853334 ?auto_853335 ?auto_853336 ?auto_853337 ?auto_853338 ?auto_853339 ?auto_853340 ?auto_853341 ?auto_853342 ?auto_853343 ?auto_853344 ?auto_853345 ?auto_853346 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_853365 - BLOCK
      ?auto_853366 - BLOCK
      ?auto_853367 - BLOCK
      ?auto_853368 - BLOCK
      ?auto_853369 - BLOCK
      ?auto_853370 - BLOCK
      ?auto_853371 - BLOCK
      ?auto_853372 - BLOCK
      ?auto_853373 - BLOCK
      ?auto_853374 - BLOCK
      ?auto_853375 - BLOCK
      ?auto_853376 - BLOCK
      ?auto_853377 - BLOCK
      ?auto_853378 - BLOCK
      ?auto_853379 - BLOCK
      ?auto_853380 - BLOCK
      ?auto_853381 - BLOCK
      ?auto_853382 - BLOCK
    )
    :vars
    (
      ?auto_853383 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_853382 ?auto_853383 ) ( ON-TABLE ?auto_853365 ) ( ON ?auto_853366 ?auto_853365 ) ( ON ?auto_853367 ?auto_853366 ) ( ON ?auto_853368 ?auto_853367 ) ( ON ?auto_853369 ?auto_853368 ) ( ON ?auto_853370 ?auto_853369 ) ( ON ?auto_853371 ?auto_853370 ) ( ON ?auto_853372 ?auto_853371 ) ( not ( = ?auto_853365 ?auto_853366 ) ) ( not ( = ?auto_853365 ?auto_853367 ) ) ( not ( = ?auto_853365 ?auto_853368 ) ) ( not ( = ?auto_853365 ?auto_853369 ) ) ( not ( = ?auto_853365 ?auto_853370 ) ) ( not ( = ?auto_853365 ?auto_853371 ) ) ( not ( = ?auto_853365 ?auto_853372 ) ) ( not ( = ?auto_853365 ?auto_853373 ) ) ( not ( = ?auto_853365 ?auto_853374 ) ) ( not ( = ?auto_853365 ?auto_853375 ) ) ( not ( = ?auto_853365 ?auto_853376 ) ) ( not ( = ?auto_853365 ?auto_853377 ) ) ( not ( = ?auto_853365 ?auto_853378 ) ) ( not ( = ?auto_853365 ?auto_853379 ) ) ( not ( = ?auto_853365 ?auto_853380 ) ) ( not ( = ?auto_853365 ?auto_853381 ) ) ( not ( = ?auto_853365 ?auto_853382 ) ) ( not ( = ?auto_853365 ?auto_853383 ) ) ( not ( = ?auto_853366 ?auto_853367 ) ) ( not ( = ?auto_853366 ?auto_853368 ) ) ( not ( = ?auto_853366 ?auto_853369 ) ) ( not ( = ?auto_853366 ?auto_853370 ) ) ( not ( = ?auto_853366 ?auto_853371 ) ) ( not ( = ?auto_853366 ?auto_853372 ) ) ( not ( = ?auto_853366 ?auto_853373 ) ) ( not ( = ?auto_853366 ?auto_853374 ) ) ( not ( = ?auto_853366 ?auto_853375 ) ) ( not ( = ?auto_853366 ?auto_853376 ) ) ( not ( = ?auto_853366 ?auto_853377 ) ) ( not ( = ?auto_853366 ?auto_853378 ) ) ( not ( = ?auto_853366 ?auto_853379 ) ) ( not ( = ?auto_853366 ?auto_853380 ) ) ( not ( = ?auto_853366 ?auto_853381 ) ) ( not ( = ?auto_853366 ?auto_853382 ) ) ( not ( = ?auto_853366 ?auto_853383 ) ) ( not ( = ?auto_853367 ?auto_853368 ) ) ( not ( = ?auto_853367 ?auto_853369 ) ) ( not ( = ?auto_853367 ?auto_853370 ) ) ( not ( = ?auto_853367 ?auto_853371 ) ) ( not ( = ?auto_853367 ?auto_853372 ) ) ( not ( = ?auto_853367 ?auto_853373 ) ) ( not ( = ?auto_853367 ?auto_853374 ) ) ( not ( = ?auto_853367 ?auto_853375 ) ) ( not ( = ?auto_853367 ?auto_853376 ) ) ( not ( = ?auto_853367 ?auto_853377 ) ) ( not ( = ?auto_853367 ?auto_853378 ) ) ( not ( = ?auto_853367 ?auto_853379 ) ) ( not ( = ?auto_853367 ?auto_853380 ) ) ( not ( = ?auto_853367 ?auto_853381 ) ) ( not ( = ?auto_853367 ?auto_853382 ) ) ( not ( = ?auto_853367 ?auto_853383 ) ) ( not ( = ?auto_853368 ?auto_853369 ) ) ( not ( = ?auto_853368 ?auto_853370 ) ) ( not ( = ?auto_853368 ?auto_853371 ) ) ( not ( = ?auto_853368 ?auto_853372 ) ) ( not ( = ?auto_853368 ?auto_853373 ) ) ( not ( = ?auto_853368 ?auto_853374 ) ) ( not ( = ?auto_853368 ?auto_853375 ) ) ( not ( = ?auto_853368 ?auto_853376 ) ) ( not ( = ?auto_853368 ?auto_853377 ) ) ( not ( = ?auto_853368 ?auto_853378 ) ) ( not ( = ?auto_853368 ?auto_853379 ) ) ( not ( = ?auto_853368 ?auto_853380 ) ) ( not ( = ?auto_853368 ?auto_853381 ) ) ( not ( = ?auto_853368 ?auto_853382 ) ) ( not ( = ?auto_853368 ?auto_853383 ) ) ( not ( = ?auto_853369 ?auto_853370 ) ) ( not ( = ?auto_853369 ?auto_853371 ) ) ( not ( = ?auto_853369 ?auto_853372 ) ) ( not ( = ?auto_853369 ?auto_853373 ) ) ( not ( = ?auto_853369 ?auto_853374 ) ) ( not ( = ?auto_853369 ?auto_853375 ) ) ( not ( = ?auto_853369 ?auto_853376 ) ) ( not ( = ?auto_853369 ?auto_853377 ) ) ( not ( = ?auto_853369 ?auto_853378 ) ) ( not ( = ?auto_853369 ?auto_853379 ) ) ( not ( = ?auto_853369 ?auto_853380 ) ) ( not ( = ?auto_853369 ?auto_853381 ) ) ( not ( = ?auto_853369 ?auto_853382 ) ) ( not ( = ?auto_853369 ?auto_853383 ) ) ( not ( = ?auto_853370 ?auto_853371 ) ) ( not ( = ?auto_853370 ?auto_853372 ) ) ( not ( = ?auto_853370 ?auto_853373 ) ) ( not ( = ?auto_853370 ?auto_853374 ) ) ( not ( = ?auto_853370 ?auto_853375 ) ) ( not ( = ?auto_853370 ?auto_853376 ) ) ( not ( = ?auto_853370 ?auto_853377 ) ) ( not ( = ?auto_853370 ?auto_853378 ) ) ( not ( = ?auto_853370 ?auto_853379 ) ) ( not ( = ?auto_853370 ?auto_853380 ) ) ( not ( = ?auto_853370 ?auto_853381 ) ) ( not ( = ?auto_853370 ?auto_853382 ) ) ( not ( = ?auto_853370 ?auto_853383 ) ) ( not ( = ?auto_853371 ?auto_853372 ) ) ( not ( = ?auto_853371 ?auto_853373 ) ) ( not ( = ?auto_853371 ?auto_853374 ) ) ( not ( = ?auto_853371 ?auto_853375 ) ) ( not ( = ?auto_853371 ?auto_853376 ) ) ( not ( = ?auto_853371 ?auto_853377 ) ) ( not ( = ?auto_853371 ?auto_853378 ) ) ( not ( = ?auto_853371 ?auto_853379 ) ) ( not ( = ?auto_853371 ?auto_853380 ) ) ( not ( = ?auto_853371 ?auto_853381 ) ) ( not ( = ?auto_853371 ?auto_853382 ) ) ( not ( = ?auto_853371 ?auto_853383 ) ) ( not ( = ?auto_853372 ?auto_853373 ) ) ( not ( = ?auto_853372 ?auto_853374 ) ) ( not ( = ?auto_853372 ?auto_853375 ) ) ( not ( = ?auto_853372 ?auto_853376 ) ) ( not ( = ?auto_853372 ?auto_853377 ) ) ( not ( = ?auto_853372 ?auto_853378 ) ) ( not ( = ?auto_853372 ?auto_853379 ) ) ( not ( = ?auto_853372 ?auto_853380 ) ) ( not ( = ?auto_853372 ?auto_853381 ) ) ( not ( = ?auto_853372 ?auto_853382 ) ) ( not ( = ?auto_853372 ?auto_853383 ) ) ( not ( = ?auto_853373 ?auto_853374 ) ) ( not ( = ?auto_853373 ?auto_853375 ) ) ( not ( = ?auto_853373 ?auto_853376 ) ) ( not ( = ?auto_853373 ?auto_853377 ) ) ( not ( = ?auto_853373 ?auto_853378 ) ) ( not ( = ?auto_853373 ?auto_853379 ) ) ( not ( = ?auto_853373 ?auto_853380 ) ) ( not ( = ?auto_853373 ?auto_853381 ) ) ( not ( = ?auto_853373 ?auto_853382 ) ) ( not ( = ?auto_853373 ?auto_853383 ) ) ( not ( = ?auto_853374 ?auto_853375 ) ) ( not ( = ?auto_853374 ?auto_853376 ) ) ( not ( = ?auto_853374 ?auto_853377 ) ) ( not ( = ?auto_853374 ?auto_853378 ) ) ( not ( = ?auto_853374 ?auto_853379 ) ) ( not ( = ?auto_853374 ?auto_853380 ) ) ( not ( = ?auto_853374 ?auto_853381 ) ) ( not ( = ?auto_853374 ?auto_853382 ) ) ( not ( = ?auto_853374 ?auto_853383 ) ) ( not ( = ?auto_853375 ?auto_853376 ) ) ( not ( = ?auto_853375 ?auto_853377 ) ) ( not ( = ?auto_853375 ?auto_853378 ) ) ( not ( = ?auto_853375 ?auto_853379 ) ) ( not ( = ?auto_853375 ?auto_853380 ) ) ( not ( = ?auto_853375 ?auto_853381 ) ) ( not ( = ?auto_853375 ?auto_853382 ) ) ( not ( = ?auto_853375 ?auto_853383 ) ) ( not ( = ?auto_853376 ?auto_853377 ) ) ( not ( = ?auto_853376 ?auto_853378 ) ) ( not ( = ?auto_853376 ?auto_853379 ) ) ( not ( = ?auto_853376 ?auto_853380 ) ) ( not ( = ?auto_853376 ?auto_853381 ) ) ( not ( = ?auto_853376 ?auto_853382 ) ) ( not ( = ?auto_853376 ?auto_853383 ) ) ( not ( = ?auto_853377 ?auto_853378 ) ) ( not ( = ?auto_853377 ?auto_853379 ) ) ( not ( = ?auto_853377 ?auto_853380 ) ) ( not ( = ?auto_853377 ?auto_853381 ) ) ( not ( = ?auto_853377 ?auto_853382 ) ) ( not ( = ?auto_853377 ?auto_853383 ) ) ( not ( = ?auto_853378 ?auto_853379 ) ) ( not ( = ?auto_853378 ?auto_853380 ) ) ( not ( = ?auto_853378 ?auto_853381 ) ) ( not ( = ?auto_853378 ?auto_853382 ) ) ( not ( = ?auto_853378 ?auto_853383 ) ) ( not ( = ?auto_853379 ?auto_853380 ) ) ( not ( = ?auto_853379 ?auto_853381 ) ) ( not ( = ?auto_853379 ?auto_853382 ) ) ( not ( = ?auto_853379 ?auto_853383 ) ) ( not ( = ?auto_853380 ?auto_853381 ) ) ( not ( = ?auto_853380 ?auto_853382 ) ) ( not ( = ?auto_853380 ?auto_853383 ) ) ( not ( = ?auto_853381 ?auto_853382 ) ) ( not ( = ?auto_853381 ?auto_853383 ) ) ( not ( = ?auto_853382 ?auto_853383 ) ) ( ON ?auto_853381 ?auto_853382 ) ( ON ?auto_853380 ?auto_853381 ) ( ON ?auto_853379 ?auto_853380 ) ( ON ?auto_853378 ?auto_853379 ) ( ON ?auto_853377 ?auto_853378 ) ( ON ?auto_853376 ?auto_853377 ) ( ON ?auto_853375 ?auto_853376 ) ( ON ?auto_853374 ?auto_853375 ) ( CLEAR ?auto_853372 ) ( ON ?auto_853373 ?auto_853374 ) ( CLEAR ?auto_853373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_853365 ?auto_853366 ?auto_853367 ?auto_853368 ?auto_853369 ?auto_853370 ?auto_853371 ?auto_853372 ?auto_853373 )
      ( MAKE-18PILE ?auto_853365 ?auto_853366 ?auto_853367 ?auto_853368 ?auto_853369 ?auto_853370 ?auto_853371 ?auto_853372 ?auto_853373 ?auto_853374 ?auto_853375 ?auto_853376 ?auto_853377 ?auto_853378 ?auto_853379 ?auto_853380 ?auto_853381 ?auto_853382 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_853402 - BLOCK
      ?auto_853403 - BLOCK
      ?auto_853404 - BLOCK
      ?auto_853405 - BLOCK
      ?auto_853406 - BLOCK
      ?auto_853407 - BLOCK
      ?auto_853408 - BLOCK
      ?auto_853409 - BLOCK
      ?auto_853410 - BLOCK
      ?auto_853411 - BLOCK
      ?auto_853412 - BLOCK
      ?auto_853413 - BLOCK
      ?auto_853414 - BLOCK
      ?auto_853415 - BLOCK
      ?auto_853416 - BLOCK
      ?auto_853417 - BLOCK
      ?auto_853418 - BLOCK
      ?auto_853419 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_853419 ) ( ON-TABLE ?auto_853402 ) ( ON ?auto_853403 ?auto_853402 ) ( ON ?auto_853404 ?auto_853403 ) ( ON ?auto_853405 ?auto_853404 ) ( ON ?auto_853406 ?auto_853405 ) ( ON ?auto_853407 ?auto_853406 ) ( ON ?auto_853408 ?auto_853407 ) ( ON ?auto_853409 ?auto_853408 ) ( not ( = ?auto_853402 ?auto_853403 ) ) ( not ( = ?auto_853402 ?auto_853404 ) ) ( not ( = ?auto_853402 ?auto_853405 ) ) ( not ( = ?auto_853402 ?auto_853406 ) ) ( not ( = ?auto_853402 ?auto_853407 ) ) ( not ( = ?auto_853402 ?auto_853408 ) ) ( not ( = ?auto_853402 ?auto_853409 ) ) ( not ( = ?auto_853402 ?auto_853410 ) ) ( not ( = ?auto_853402 ?auto_853411 ) ) ( not ( = ?auto_853402 ?auto_853412 ) ) ( not ( = ?auto_853402 ?auto_853413 ) ) ( not ( = ?auto_853402 ?auto_853414 ) ) ( not ( = ?auto_853402 ?auto_853415 ) ) ( not ( = ?auto_853402 ?auto_853416 ) ) ( not ( = ?auto_853402 ?auto_853417 ) ) ( not ( = ?auto_853402 ?auto_853418 ) ) ( not ( = ?auto_853402 ?auto_853419 ) ) ( not ( = ?auto_853403 ?auto_853404 ) ) ( not ( = ?auto_853403 ?auto_853405 ) ) ( not ( = ?auto_853403 ?auto_853406 ) ) ( not ( = ?auto_853403 ?auto_853407 ) ) ( not ( = ?auto_853403 ?auto_853408 ) ) ( not ( = ?auto_853403 ?auto_853409 ) ) ( not ( = ?auto_853403 ?auto_853410 ) ) ( not ( = ?auto_853403 ?auto_853411 ) ) ( not ( = ?auto_853403 ?auto_853412 ) ) ( not ( = ?auto_853403 ?auto_853413 ) ) ( not ( = ?auto_853403 ?auto_853414 ) ) ( not ( = ?auto_853403 ?auto_853415 ) ) ( not ( = ?auto_853403 ?auto_853416 ) ) ( not ( = ?auto_853403 ?auto_853417 ) ) ( not ( = ?auto_853403 ?auto_853418 ) ) ( not ( = ?auto_853403 ?auto_853419 ) ) ( not ( = ?auto_853404 ?auto_853405 ) ) ( not ( = ?auto_853404 ?auto_853406 ) ) ( not ( = ?auto_853404 ?auto_853407 ) ) ( not ( = ?auto_853404 ?auto_853408 ) ) ( not ( = ?auto_853404 ?auto_853409 ) ) ( not ( = ?auto_853404 ?auto_853410 ) ) ( not ( = ?auto_853404 ?auto_853411 ) ) ( not ( = ?auto_853404 ?auto_853412 ) ) ( not ( = ?auto_853404 ?auto_853413 ) ) ( not ( = ?auto_853404 ?auto_853414 ) ) ( not ( = ?auto_853404 ?auto_853415 ) ) ( not ( = ?auto_853404 ?auto_853416 ) ) ( not ( = ?auto_853404 ?auto_853417 ) ) ( not ( = ?auto_853404 ?auto_853418 ) ) ( not ( = ?auto_853404 ?auto_853419 ) ) ( not ( = ?auto_853405 ?auto_853406 ) ) ( not ( = ?auto_853405 ?auto_853407 ) ) ( not ( = ?auto_853405 ?auto_853408 ) ) ( not ( = ?auto_853405 ?auto_853409 ) ) ( not ( = ?auto_853405 ?auto_853410 ) ) ( not ( = ?auto_853405 ?auto_853411 ) ) ( not ( = ?auto_853405 ?auto_853412 ) ) ( not ( = ?auto_853405 ?auto_853413 ) ) ( not ( = ?auto_853405 ?auto_853414 ) ) ( not ( = ?auto_853405 ?auto_853415 ) ) ( not ( = ?auto_853405 ?auto_853416 ) ) ( not ( = ?auto_853405 ?auto_853417 ) ) ( not ( = ?auto_853405 ?auto_853418 ) ) ( not ( = ?auto_853405 ?auto_853419 ) ) ( not ( = ?auto_853406 ?auto_853407 ) ) ( not ( = ?auto_853406 ?auto_853408 ) ) ( not ( = ?auto_853406 ?auto_853409 ) ) ( not ( = ?auto_853406 ?auto_853410 ) ) ( not ( = ?auto_853406 ?auto_853411 ) ) ( not ( = ?auto_853406 ?auto_853412 ) ) ( not ( = ?auto_853406 ?auto_853413 ) ) ( not ( = ?auto_853406 ?auto_853414 ) ) ( not ( = ?auto_853406 ?auto_853415 ) ) ( not ( = ?auto_853406 ?auto_853416 ) ) ( not ( = ?auto_853406 ?auto_853417 ) ) ( not ( = ?auto_853406 ?auto_853418 ) ) ( not ( = ?auto_853406 ?auto_853419 ) ) ( not ( = ?auto_853407 ?auto_853408 ) ) ( not ( = ?auto_853407 ?auto_853409 ) ) ( not ( = ?auto_853407 ?auto_853410 ) ) ( not ( = ?auto_853407 ?auto_853411 ) ) ( not ( = ?auto_853407 ?auto_853412 ) ) ( not ( = ?auto_853407 ?auto_853413 ) ) ( not ( = ?auto_853407 ?auto_853414 ) ) ( not ( = ?auto_853407 ?auto_853415 ) ) ( not ( = ?auto_853407 ?auto_853416 ) ) ( not ( = ?auto_853407 ?auto_853417 ) ) ( not ( = ?auto_853407 ?auto_853418 ) ) ( not ( = ?auto_853407 ?auto_853419 ) ) ( not ( = ?auto_853408 ?auto_853409 ) ) ( not ( = ?auto_853408 ?auto_853410 ) ) ( not ( = ?auto_853408 ?auto_853411 ) ) ( not ( = ?auto_853408 ?auto_853412 ) ) ( not ( = ?auto_853408 ?auto_853413 ) ) ( not ( = ?auto_853408 ?auto_853414 ) ) ( not ( = ?auto_853408 ?auto_853415 ) ) ( not ( = ?auto_853408 ?auto_853416 ) ) ( not ( = ?auto_853408 ?auto_853417 ) ) ( not ( = ?auto_853408 ?auto_853418 ) ) ( not ( = ?auto_853408 ?auto_853419 ) ) ( not ( = ?auto_853409 ?auto_853410 ) ) ( not ( = ?auto_853409 ?auto_853411 ) ) ( not ( = ?auto_853409 ?auto_853412 ) ) ( not ( = ?auto_853409 ?auto_853413 ) ) ( not ( = ?auto_853409 ?auto_853414 ) ) ( not ( = ?auto_853409 ?auto_853415 ) ) ( not ( = ?auto_853409 ?auto_853416 ) ) ( not ( = ?auto_853409 ?auto_853417 ) ) ( not ( = ?auto_853409 ?auto_853418 ) ) ( not ( = ?auto_853409 ?auto_853419 ) ) ( not ( = ?auto_853410 ?auto_853411 ) ) ( not ( = ?auto_853410 ?auto_853412 ) ) ( not ( = ?auto_853410 ?auto_853413 ) ) ( not ( = ?auto_853410 ?auto_853414 ) ) ( not ( = ?auto_853410 ?auto_853415 ) ) ( not ( = ?auto_853410 ?auto_853416 ) ) ( not ( = ?auto_853410 ?auto_853417 ) ) ( not ( = ?auto_853410 ?auto_853418 ) ) ( not ( = ?auto_853410 ?auto_853419 ) ) ( not ( = ?auto_853411 ?auto_853412 ) ) ( not ( = ?auto_853411 ?auto_853413 ) ) ( not ( = ?auto_853411 ?auto_853414 ) ) ( not ( = ?auto_853411 ?auto_853415 ) ) ( not ( = ?auto_853411 ?auto_853416 ) ) ( not ( = ?auto_853411 ?auto_853417 ) ) ( not ( = ?auto_853411 ?auto_853418 ) ) ( not ( = ?auto_853411 ?auto_853419 ) ) ( not ( = ?auto_853412 ?auto_853413 ) ) ( not ( = ?auto_853412 ?auto_853414 ) ) ( not ( = ?auto_853412 ?auto_853415 ) ) ( not ( = ?auto_853412 ?auto_853416 ) ) ( not ( = ?auto_853412 ?auto_853417 ) ) ( not ( = ?auto_853412 ?auto_853418 ) ) ( not ( = ?auto_853412 ?auto_853419 ) ) ( not ( = ?auto_853413 ?auto_853414 ) ) ( not ( = ?auto_853413 ?auto_853415 ) ) ( not ( = ?auto_853413 ?auto_853416 ) ) ( not ( = ?auto_853413 ?auto_853417 ) ) ( not ( = ?auto_853413 ?auto_853418 ) ) ( not ( = ?auto_853413 ?auto_853419 ) ) ( not ( = ?auto_853414 ?auto_853415 ) ) ( not ( = ?auto_853414 ?auto_853416 ) ) ( not ( = ?auto_853414 ?auto_853417 ) ) ( not ( = ?auto_853414 ?auto_853418 ) ) ( not ( = ?auto_853414 ?auto_853419 ) ) ( not ( = ?auto_853415 ?auto_853416 ) ) ( not ( = ?auto_853415 ?auto_853417 ) ) ( not ( = ?auto_853415 ?auto_853418 ) ) ( not ( = ?auto_853415 ?auto_853419 ) ) ( not ( = ?auto_853416 ?auto_853417 ) ) ( not ( = ?auto_853416 ?auto_853418 ) ) ( not ( = ?auto_853416 ?auto_853419 ) ) ( not ( = ?auto_853417 ?auto_853418 ) ) ( not ( = ?auto_853417 ?auto_853419 ) ) ( not ( = ?auto_853418 ?auto_853419 ) ) ( ON ?auto_853418 ?auto_853419 ) ( ON ?auto_853417 ?auto_853418 ) ( ON ?auto_853416 ?auto_853417 ) ( ON ?auto_853415 ?auto_853416 ) ( ON ?auto_853414 ?auto_853415 ) ( ON ?auto_853413 ?auto_853414 ) ( ON ?auto_853412 ?auto_853413 ) ( ON ?auto_853411 ?auto_853412 ) ( CLEAR ?auto_853409 ) ( ON ?auto_853410 ?auto_853411 ) ( CLEAR ?auto_853410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_853402 ?auto_853403 ?auto_853404 ?auto_853405 ?auto_853406 ?auto_853407 ?auto_853408 ?auto_853409 ?auto_853410 )
      ( MAKE-18PILE ?auto_853402 ?auto_853403 ?auto_853404 ?auto_853405 ?auto_853406 ?auto_853407 ?auto_853408 ?auto_853409 ?auto_853410 ?auto_853411 ?auto_853412 ?auto_853413 ?auto_853414 ?auto_853415 ?auto_853416 ?auto_853417 ?auto_853418 ?auto_853419 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_853438 - BLOCK
      ?auto_853439 - BLOCK
      ?auto_853440 - BLOCK
      ?auto_853441 - BLOCK
      ?auto_853442 - BLOCK
      ?auto_853443 - BLOCK
      ?auto_853444 - BLOCK
      ?auto_853445 - BLOCK
      ?auto_853446 - BLOCK
      ?auto_853447 - BLOCK
      ?auto_853448 - BLOCK
      ?auto_853449 - BLOCK
      ?auto_853450 - BLOCK
      ?auto_853451 - BLOCK
      ?auto_853452 - BLOCK
      ?auto_853453 - BLOCK
      ?auto_853454 - BLOCK
      ?auto_853455 - BLOCK
    )
    :vars
    (
      ?auto_853456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_853455 ?auto_853456 ) ( ON-TABLE ?auto_853438 ) ( ON ?auto_853439 ?auto_853438 ) ( ON ?auto_853440 ?auto_853439 ) ( ON ?auto_853441 ?auto_853440 ) ( ON ?auto_853442 ?auto_853441 ) ( ON ?auto_853443 ?auto_853442 ) ( ON ?auto_853444 ?auto_853443 ) ( not ( = ?auto_853438 ?auto_853439 ) ) ( not ( = ?auto_853438 ?auto_853440 ) ) ( not ( = ?auto_853438 ?auto_853441 ) ) ( not ( = ?auto_853438 ?auto_853442 ) ) ( not ( = ?auto_853438 ?auto_853443 ) ) ( not ( = ?auto_853438 ?auto_853444 ) ) ( not ( = ?auto_853438 ?auto_853445 ) ) ( not ( = ?auto_853438 ?auto_853446 ) ) ( not ( = ?auto_853438 ?auto_853447 ) ) ( not ( = ?auto_853438 ?auto_853448 ) ) ( not ( = ?auto_853438 ?auto_853449 ) ) ( not ( = ?auto_853438 ?auto_853450 ) ) ( not ( = ?auto_853438 ?auto_853451 ) ) ( not ( = ?auto_853438 ?auto_853452 ) ) ( not ( = ?auto_853438 ?auto_853453 ) ) ( not ( = ?auto_853438 ?auto_853454 ) ) ( not ( = ?auto_853438 ?auto_853455 ) ) ( not ( = ?auto_853438 ?auto_853456 ) ) ( not ( = ?auto_853439 ?auto_853440 ) ) ( not ( = ?auto_853439 ?auto_853441 ) ) ( not ( = ?auto_853439 ?auto_853442 ) ) ( not ( = ?auto_853439 ?auto_853443 ) ) ( not ( = ?auto_853439 ?auto_853444 ) ) ( not ( = ?auto_853439 ?auto_853445 ) ) ( not ( = ?auto_853439 ?auto_853446 ) ) ( not ( = ?auto_853439 ?auto_853447 ) ) ( not ( = ?auto_853439 ?auto_853448 ) ) ( not ( = ?auto_853439 ?auto_853449 ) ) ( not ( = ?auto_853439 ?auto_853450 ) ) ( not ( = ?auto_853439 ?auto_853451 ) ) ( not ( = ?auto_853439 ?auto_853452 ) ) ( not ( = ?auto_853439 ?auto_853453 ) ) ( not ( = ?auto_853439 ?auto_853454 ) ) ( not ( = ?auto_853439 ?auto_853455 ) ) ( not ( = ?auto_853439 ?auto_853456 ) ) ( not ( = ?auto_853440 ?auto_853441 ) ) ( not ( = ?auto_853440 ?auto_853442 ) ) ( not ( = ?auto_853440 ?auto_853443 ) ) ( not ( = ?auto_853440 ?auto_853444 ) ) ( not ( = ?auto_853440 ?auto_853445 ) ) ( not ( = ?auto_853440 ?auto_853446 ) ) ( not ( = ?auto_853440 ?auto_853447 ) ) ( not ( = ?auto_853440 ?auto_853448 ) ) ( not ( = ?auto_853440 ?auto_853449 ) ) ( not ( = ?auto_853440 ?auto_853450 ) ) ( not ( = ?auto_853440 ?auto_853451 ) ) ( not ( = ?auto_853440 ?auto_853452 ) ) ( not ( = ?auto_853440 ?auto_853453 ) ) ( not ( = ?auto_853440 ?auto_853454 ) ) ( not ( = ?auto_853440 ?auto_853455 ) ) ( not ( = ?auto_853440 ?auto_853456 ) ) ( not ( = ?auto_853441 ?auto_853442 ) ) ( not ( = ?auto_853441 ?auto_853443 ) ) ( not ( = ?auto_853441 ?auto_853444 ) ) ( not ( = ?auto_853441 ?auto_853445 ) ) ( not ( = ?auto_853441 ?auto_853446 ) ) ( not ( = ?auto_853441 ?auto_853447 ) ) ( not ( = ?auto_853441 ?auto_853448 ) ) ( not ( = ?auto_853441 ?auto_853449 ) ) ( not ( = ?auto_853441 ?auto_853450 ) ) ( not ( = ?auto_853441 ?auto_853451 ) ) ( not ( = ?auto_853441 ?auto_853452 ) ) ( not ( = ?auto_853441 ?auto_853453 ) ) ( not ( = ?auto_853441 ?auto_853454 ) ) ( not ( = ?auto_853441 ?auto_853455 ) ) ( not ( = ?auto_853441 ?auto_853456 ) ) ( not ( = ?auto_853442 ?auto_853443 ) ) ( not ( = ?auto_853442 ?auto_853444 ) ) ( not ( = ?auto_853442 ?auto_853445 ) ) ( not ( = ?auto_853442 ?auto_853446 ) ) ( not ( = ?auto_853442 ?auto_853447 ) ) ( not ( = ?auto_853442 ?auto_853448 ) ) ( not ( = ?auto_853442 ?auto_853449 ) ) ( not ( = ?auto_853442 ?auto_853450 ) ) ( not ( = ?auto_853442 ?auto_853451 ) ) ( not ( = ?auto_853442 ?auto_853452 ) ) ( not ( = ?auto_853442 ?auto_853453 ) ) ( not ( = ?auto_853442 ?auto_853454 ) ) ( not ( = ?auto_853442 ?auto_853455 ) ) ( not ( = ?auto_853442 ?auto_853456 ) ) ( not ( = ?auto_853443 ?auto_853444 ) ) ( not ( = ?auto_853443 ?auto_853445 ) ) ( not ( = ?auto_853443 ?auto_853446 ) ) ( not ( = ?auto_853443 ?auto_853447 ) ) ( not ( = ?auto_853443 ?auto_853448 ) ) ( not ( = ?auto_853443 ?auto_853449 ) ) ( not ( = ?auto_853443 ?auto_853450 ) ) ( not ( = ?auto_853443 ?auto_853451 ) ) ( not ( = ?auto_853443 ?auto_853452 ) ) ( not ( = ?auto_853443 ?auto_853453 ) ) ( not ( = ?auto_853443 ?auto_853454 ) ) ( not ( = ?auto_853443 ?auto_853455 ) ) ( not ( = ?auto_853443 ?auto_853456 ) ) ( not ( = ?auto_853444 ?auto_853445 ) ) ( not ( = ?auto_853444 ?auto_853446 ) ) ( not ( = ?auto_853444 ?auto_853447 ) ) ( not ( = ?auto_853444 ?auto_853448 ) ) ( not ( = ?auto_853444 ?auto_853449 ) ) ( not ( = ?auto_853444 ?auto_853450 ) ) ( not ( = ?auto_853444 ?auto_853451 ) ) ( not ( = ?auto_853444 ?auto_853452 ) ) ( not ( = ?auto_853444 ?auto_853453 ) ) ( not ( = ?auto_853444 ?auto_853454 ) ) ( not ( = ?auto_853444 ?auto_853455 ) ) ( not ( = ?auto_853444 ?auto_853456 ) ) ( not ( = ?auto_853445 ?auto_853446 ) ) ( not ( = ?auto_853445 ?auto_853447 ) ) ( not ( = ?auto_853445 ?auto_853448 ) ) ( not ( = ?auto_853445 ?auto_853449 ) ) ( not ( = ?auto_853445 ?auto_853450 ) ) ( not ( = ?auto_853445 ?auto_853451 ) ) ( not ( = ?auto_853445 ?auto_853452 ) ) ( not ( = ?auto_853445 ?auto_853453 ) ) ( not ( = ?auto_853445 ?auto_853454 ) ) ( not ( = ?auto_853445 ?auto_853455 ) ) ( not ( = ?auto_853445 ?auto_853456 ) ) ( not ( = ?auto_853446 ?auto_853447 ) ) ( not ( = ?auto_853446 ?auto_853448 ) ) ( not ( = ?auto_853446 ?auto_853449 ) ) ( not ( = ?auto_853446 ?auto_853450 ) ) ( not ( = ?auto_853446 ?auto_853451 ) ) ( not ( = ?auto_853446 ?auto_853452 ) ) ( not ( = ?auto_853446 ?auto_853453 ) ) ( not ( = ?auto_853446 ?auto_853454 ) ) ( not ( = ?auto_853446 ?auto_853455 ) ) ( not ( = ?auto_853446 ?auto_853456 ) ) ( not ( = ?auto_853447 ?auto_853448 ) ) ( not ( = ?auto_853447 ?auto_853449 ) ) ( not ( = ?auto_853447 ?auto_853450 ) ) ( not ( = ?auto_853447 ?auto_853451 ) ) ( not ( = ?auto_853447 ?auto_853452 ) ) ( not ( = ?auto_853447 ?auto_853453 ) ) ( not ( = ?auto_853447 ?auto_853454 ) ) ( not ( = ?auto_853447 ?auto_853455 ) ) ( not ( = ?auto_853447 ?auto_853456 ) ) ( not ( = ?auto_853448 ?auto_853449 ) ) ( not ( = ?auto_853448 ?auto_853450 ) ) ( not ( = ?auto_853448 ?auto_853451 ) ) ( not ( = ?auto_853448 ?auto_853452 ) ) ( not ( = ?auto_853448 ?auto_853453 ) ) ( not ( = ?auto_853448 ?auto_853454 ) ) ( not ( = ?auto_853448 ?auto_853455 ) ) ( not ( = ?auto_853448 ?auto_853456 ) ) ( not ( = ?auto_853449 ?auto_853450 ) ) ( not ( = ?auto_853449 ?auto_853451 ) ) ( not ( = ?auto_853449 ?auto_853452 ) ) ( not ( = ?auto_853449 ?auto_853453 ) ) ( not ( = ?auto_853449 ?auto_853454 ) ) ( not ( = ?auto_853449 ?auto_853455 ) ) ( not ( = ?auto_853449 ?auto_853456 ) ) ( not ( = ?auto_853450 ?auto_853451 ) ) ( not ( = ?auto_853450 ?auto_853452 ) ) ( not ( = ?auto_853450 ?auto_853453 ) ) ( not ( = ?auto_853450 ?auto_853454 ) ) ( not ( = ?auto_853450 ?auto_853455 ) ) ( not ( = ?auto_853450 ?auto_853456 ) ) ( not ( = ?auto_853451 ?auto_853452 ) ) ( not ( = ?auto_853451 ?auto_853453 ) ) ( not ( = ?auto_853451 ?auto_853454 ) ) ( not ( = ?auto_853451 ?auto_853455 ) ) ( not ( = ?auto_853451 ?auto_853456 ) ) ( not ( = ?auto_853452 ?auto_853453 ) ) ( not ( = ?auto_853452 ?auto_853454 ) ) ( not ( = ?auto_853452 ?auto_853455 ) ) ( not ( = ?auto_853452 ?auto_853456 ) ) ( not ( = ?auto_853453 ?auto_853454 ) ) ( not ( = ?auto_853453 ?auto_853455 ) ) ( not ( = ?auto_853453 ?auto_853456 ) ) ( not ( = ?auto_853454 ?auto_853455 ) ) ( not ( = ?auto_853454 ?auto_853456 ) ) ( not ( = ?auto_853455 ?auto_853456 ) ) ( ON ?auto_853454 ?auto_853455 ) ( ON ?auto_853453 ?auto_853454 ) ( ON ?auto_853452 ?auto_853453 ) ( ON ?auto_853451 ?auto_853452 ) ( ON ?auto_853450 ?auto_853451 ) ( ON ?auto_853449 ?auto_853450 ) ( ON ?auto_853448 ?auto_853449 ) ( ON ?auto_853447 ?auto_853448 ) ( ON ?auto_853446 ?auto_853447 ) ( CLEAR ?auto_853444 ) ( ON ?auto_853445 ?auto_853446 ) ( CLEAR ?auto_853445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_853438 ?auto_853439 ?auto_853440 ?auto_853441 ?auto_853442 ?auto_853443 ?auto_853444 ?auto_853445 )
      ( MAKE-18PILE ?auto_853438 ?auto_853439 ?auto_853440 ?auto_853441 ?auto_853442 ?auto_853443 ?auto_853444 ?auto_853445 ?auto_853446 ?auto_853447 ?auto_853448 ?auto_853449 ?auto_853450 ?auto_853451 ?auto_853452 ?auto_853453 ?auto_853454 ?auto_853455 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_853475 - BLOCK
      ?auto_853476 - BLOCK
      ?auto_853477 - BLOCK
      ?auto_853478 - BLOCK
      ?auto_853479 - BLOCK
      ?auto_853480 - BLOCK
      ?auto_853481 - BLOCK
      ?auto_853482 - BLOCK
      ?auto_853483 - BLOCK
      ?auto_853484 - BLOCK
      ?auto_853485 - BLOCK
      ?auto_853486 - BLOCK
      ?auto_853487 - BLOCK
      ?auto_853488 - BLOCK
      ?auto_853489 - BLOCK
      ?auto_853490 - BLOCK
      ?auto_853491 - BLOCK
      ?auto_853492 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_853492 ) ( ON-TABLE ?auto_853475 ) ( ON ?auto_853476 ?auto_853475 ) ( ON ?auto_853477 ?auto_853476 ) ( ON ?auto_853478 ?auto_853477 ) ( ON ?auto_853479 ?auto_853478 ) ( ON ?auto_853480 ?auto_853479 ) ( ON ?auto_853481 ?auto_853480 ) ( not ( = ?auto_853475 ?auto_853476 ) ) ( not ( = ?auto_853475 ?auto_853477 ) ) ( not ( = ?auto_853475 ?auto_853478 ) ) ( not ( = ?auto_853475 ?auto_853479 ) ) ( not ( = ?auto_853475 ?auto_853480 ) ) ( not ( = ?auto_853475 ?auto_853481 ) ) ( not ( = ?auto_853475 ?auto_853482 ) ) ( not ( = ?auto_853475 ?auto_853483 ) ) ( not ( = ?auto_853475 ?auto_853484 ) ) ( not ( = ?auto_853475 ?auto_853485 ) ) ( not ( = ?auto_853475 ?auto_853486 ) ) ( not ( = ?auto_853475 ?auto_853487 ) ) ( not ( = ?auto_853475 ?auto_853488 ) ) ( not ( = ?auto_853475 ?auto_853489 ) ) ( not ( = ?auto_853475 ?auto_853490 ) ) ( not ( = ?auto_853475 ?auto_853491 ) ) ( not ( = ?auto_853475 ?auto_853492 ) ) ( not ( = ?auto_853476 ?auto_853477 ) ) ( not ( = ?auto_853476 ?auto_853478 ) ) ( not ( = ?auto_853476 ?auto_853479 ) ) ( not ( = ?auto_853476 ?auto_853480 ) ) ( not ( = ?auto_853476 ?auto_853481 ) ) ( not ( = ?auto_853476 ?auto_853482 ) ) ( not ( = ?auto_853476 ?auto_853483 ) ) ( not ( = ?auto_853476 ?auto_853484 ) ) ( not ( = ?auto_853476 ?auto_853485 ) ) ( not ( = ?auto_853476 ?auto_853486 ) ) ( not ( = ?auto_853476 ?auto_853487 ) ) ( not ( = ?auto_853476 ?auto_853488 ) ) ( not ( = ?auto_853476 ?auto_853489 ) ) ( not ( = ?auto_853476 ?auto_853490 ) ) ( not ( = ?auto_853476 ?auto_853491 ) ) ( not ( = ?auto_853476 ?auto_853492 ) ) ( not ( = ?auto_853477 ?auto_853478 ) ) ( not ( = ?auto_853477 ?auto_853479 ) ) ( not ( = ?auto_853477 ?auto_853480 ) ) ( not ( = ?auto_853477 ?auto_853481 ) ) ( not ( = ?auto_853477 ?auto_853482 ) ) ( not ( = ?auto_853477 ?auto_853483 ) ) ( not ( = ?auto_853477 ?auto_853484 ) ) ( not ( = ?auto_853477 ?auto_853485 ) ) ( not ( = ?auto_853477 ?auto_853486 ) ) ( not ( = ?auto_853477 ?auto_853487 ) ) ( not ( = ?auto_853477 ?auto_853488 ) ) ( not ( = ?auto_853477 ?auto_853489 ) ) ( not ( = ?auto_853477 ?auto_853490 ) ) ( not ( = ?auto_853477 ?auto_853491 ) ) ( not ( = ?auto_853477 ?auto_853492 ) ) ( not ( = ?auto_853478 ?auto_853479 ) ) ( not ( = ?auto_853478 ?auto_853480 ) ) ( not ( = ?auto_853478 ?auto_853481 ) ) ( not ( = ?auto_853478 ?auto_853482 ) ) ( not ( = ?auto_853478 ?auto_853483 ) ) ( not ( = ?auto_853478 ?auto_853484 ) ) ( not ( = ?auto_853478 ?auto_853485 ) ) ( not ( = ?auto_853478 ?auto_853486 ) ) ( not ( = ?auto_853478 ?auto_853487 ) ) ( not ( = ?auto_853478 ?auto_853488 ) ) ( not ( = ?auto_853478 ?auto_853489 ) ) ( not ( = ?auto_853478 ?auto_853490 ) ) ( not ( = ?auto_853478 ?auto_853491 ) ) ( not ( = ?auto_853478 ?auto_853492 ) ) ( not ( = ?auto_853479 ?auto_853480 ) ) ( not ( = ?auto_853479 ?auto_853481 ) ) ( not ( = ?auto_853479 ?auto_853482 ) ) ( not ( = ?auto_853479 ?auto_853483 ) ) ( not ( = ?auto_853479 ?auto_853484 ) ) ( not ( = ?auto_853479 ?auto_853485 ) ) ( not ( = ?auto_853479 ?auto_853486 ) ) ( not ( = ?auto_853479 ?auto_853487 ) ) ( not ( = ?auto_853479 ?auto_853488 ) ) ( not ( = ?auto_853479 ?auto_853489 ) ) ( not ( = ?auto_853479 ?auto_853490 ) ) ( not ( = ?auto_853479 ?auto_853491 ) ) ( not ( = ?auto_853479 ?auto_853492 ) ) ( not ( = ?auto_853480 ?auto_853481 ) ) ( not ( = ?auto_853480 ?auto_853482 ) ) ( not ( = ?auto_853480 ?auto_853483 ) ) ( not ( = ?auto_853480 ?auto_853484 ) ) ( not ( = ?auto_853480 ?auto_853485 ) ) ( not ( = ?auto_853480 ?auto_853486 ) ) ( not ( = ?auto_853480 ?auto_853487 ) ) ( not ( = ?auto_853480 ?auto_853488 ) ) ( not ( = ?auto_853480 ?auto_853489 ) ) ( not ( = ?auto_853480 ?auto_853490 ) ) ( not ( = ?auto_853480 ?auto_853491 ) ) ( not ( = ?auto_853480 ?auto_853492 ) ) ( not ( = ?auto_853481 ?auto_853482 ) ) ( not ( = ?auto_853481 ?auto_853483 ) ) ( not ( = ?auto_853481 ?auto_853484 ) ) ( not ( = ?auto_853481 ?auto_853485 ) ) ( not ( = ?auto_853481 ?auto_853486 ) ) ( not ( = ?auto_853481 ?auto_853487 ) ) ( not ( = ?auto_853481 ?auto_853488 ) ) ( not ( = ?auto_853481 ?auto_853489 ) ) ( not ( = ?auto_853481 ?auto_853490 ) ) ( not ( = ?auto_853481 ?auto_853491 ) ) ( not ( = ?auto_853481 ?auto_853492 ) ) ( not ( = ?auto_853482 ?auto_853483 ) ) ( not ( = ?auto_853482 ?auto_853484 ) ) ( not ( = ?auto_853482 ?auto_853485 ) ) ( not ( = ?auto_853482 ?auto_853486 ) ) ( not ( = ?auto_853482 ?auto_853487 ) ) ( not ( = ?auto_853482 ?auto_853488 ) ) ( not ( = ?auto_853482 ?auto_853489 ) ) ( not ( = ?auto_853482 ?auto_853490 ) ) ( not ( = ?auto_853482 ?auto_853491 ) ) ( not ( = ?auto_853482 ?auto_853492 ) ) ( not ( = ?auto_853483 ?auto_853484 ) ) ( not ( = ?auto_853483 ?auto_853485 ) ) ( not ( = ?auto_853483 ?auto_853486 ) ) ( not ( = ?auto_853483 ?auto_853487 ) ) ( not ( = ?auto_853483 ?auto_853488 ) ) ( not ( = ?auto_853483 ?auto_853489 ) ) ( not ( = ?auto_853483 ?auto_853490 ) ) ( not ( = ?auto_853483 ?auto_853491 ) ) ( not ( = ?auto_853483 ?auto_853492 ) ) ( not ( = ?auto_853484 ?auto_853485 ) ) ( not ( = ?auto_853484 ?auto_853486 ) ) ( not ( = ?auto_853484 ?auto_853487 ) ) ( not ( = ?auto_853484 ?auto_853488 ) ) ( not ( = ?auto_853484 ?auto_853489 ) ) ( not ( = ?auto_853484 ?auto_853490 ) ) ( not ( = ?auto_853484 ?auto_853491 ) ) ( not ( = ?auto_853484 ?auto_853492 ) ) ( not ( = ?auto_853485 ?auto_853486 ) ) ( not ( = ?auto_853485 ?auto_853487 ) ) ( not ( = ?auto_853485 ?auto_853488 ) ) ( not ( = ?auto_853485 ?auto_853489 ) ) ( not ( = ?auto_853485 ?auto_853490 ) ) ( not ( = ?auto_853485 ?auto_853491 ) ) ( not ( = ?auto_853485 ?auto_853492 ) ) ( not ( = ?auto_853486 ?auto_853487 ) ) ( not ( = ?auto_853486 ?auto_853488 ) ) ( not ( = ?auto_853486 ?auto_853489 ) ) ( not ( = ?auto_853486 ?auto_853490 ) ) ( not ( = ?auto_853486 ?auto_853491 ) ) ( not ( = ?auto_853486 ?auto_853492 ) ) ( not ( = ?auto_853487 ?auto_853488 ) ) ( not ( = ?auto_853487 ?auto_853489 ) ) ( not ( = ?auto_853487 ?auto_853490 ) ) ( not ( = ?auto_853487 ?auto_853491 ) ) ( not ( = ?auto_853487 ?auto_853492 ) ) ( not ( = ?auto_853488 ?auto_853489 ) ) ( not ( = ?auto_853488 ?auto_853490 ) ) ( not ( = ?auto_853488 ?auto_853491 ) ) ( not ( = ?auto_853488 ?auto_853492 ) ) ( not ( = ?auto_853489 ?auto_853490 ) ) ( not ( = ?auto_853489 ?auto_853491 ) ) ( not ( = ?auto_853489 ?auto_853492 ) ) ( not ( = ?auto_853490 ?auto_853491 ) ) ( not ( = ?auto_853490 ?auto_853492 ) ) ( not ( = ?auto_853491 ?auto_853492 ) ) ( ON ?auto_853491 ?auto_853492 ) ( ON ?auto_853490 ?auto_853491 ) ( ON ?auto_853489 ?auto_853490 ) ( ON ?auto_853488 ?auto_853489 ) ( ON ?auto_853487 ?auto_853488 ) ( ON ?auto_853486 ?auto_853487 ) ( ON ?auto_853485 ?auto_853486 ) ( ON ?auto_853484 ?auto_853485 ) ( ON ?auto_853483 ?auto_853484 ) ( CLEAR ?auto_853481 ) ( ON ?auto_853482 ?auto_853483 ) ( CLEAR ?auto_853482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_853475 ?auto_853476 ?auto_853477 ?auto_853478 ?auto_853479 ?auto_853480 ?auto_853481 ?auto_853482 )
      ( MAKE-18PILE ?auto_853475 ?auto_853476 ?auto_853477 ?auto_853478 ?auto_853479 ?auto_853480 ?auto_853481 ?auto_853482 ?auto_853483 ?auto_853484 ?auto_853485 ?auto_853486 ?auto_853487 ?auto_853488 ?auto_853489 ?auto_853490 ?auto_853491 ?auto_853492 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_853511 - BLOCK
      ?auto_853512 - BLOCK
      ?auto_853513 - BLOCK
      ?auto_853514 - BLOCK
      ?auto_853515 - BLOCK
      ?auto_853516 - BLOCK
      ?auto_853517 - BLOCK
      ?auto_853518 - BLOCK
      ?auto_853519 - BLOCK
      ?auto_853520 - BLOCK
      ?auto_853521 - BLOCK
      ?auto_853522 - BLOCK
      ?auto_853523 - BLOCK
      ?auto_853524 - BLOCK
      ?auto_853525 - BLOCK
      ?auto_853526 - BLOCK
      ?auto_853527 - BLOCK
      ?auto_853528 - BLOCK
    )
    :vars
    (
      ?auto_853529 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_853528 ?auto_853529 ) ( ON-TABLE ?auto_853511 ) ( ON ?auto_853512 ?auto_853511 ) ( ON ?auto_853513 ?auto_853512 ) ( ON ?auto_853514 ?auto_853513 ) ( ON ?auto_853515 ?auto_853514 ) ( ON ?auto_853516 ?auto_853515 ) ( not ( = ?auto_853511 ?auto_853512 ) ) ( not ( = ?auto_853511 ?auto_853513 ) ) ( not ( = ?auto_853511 ?auto_853514 ) ) ( not ( = ?auto_853511 ?auto_853515 ) ) ( not ( = ?auto_853511 ?auto_853516 ) ) ( not ( = ?auto_853511 ?auto_853517 ) ) ( not ( = ?auto_853511 ?auto_853518 ) ) ( not ( = ?auto_853511 ?auto_853519 ) ) ( not ( = ?auto_853511 ?auto_853520 ) ) ( not ( = ?auto_853511 ?auto_853521 ) ) ( not ( = ?auto_853511 ?auto_853522 ) ) ( not ( = ?auto_853511 ?auto_853523 ) ) ( not ( = ?auto_853511 ?auto_853524 ) ) ( not ( = ?auto_853511 ?auto_853525 ) ) ( not ( = ?auto_853511 ?auto_853526 ) ) ( not ( = ?auto_853511 ?auto_853527 ) ) ( not ( = ?auto_853511 ?auto_853528 ) ) ( not ( = ?auto_853511 ?auto_853529 ) ) ( not ( = ?auto_853512 ?auto_853513 ) ) ( not ( = ?auto_853512 ?auto_853514 ) ) ( not ( = ?auto_853512 ?auto_853515 ) ) ( not ( = ?auto_853512 ?auto_853516 ) ) ( not ( = ?auto_853512 ?auto_853517 ) ) ( not ( = ?auto_853512 ?auto_853518 ) ) ( not ( = ?auto_853512 ?auto_853519 ) ) ( not ( = ?auto_853512 ?auto_853520 ) ) ( not ( = ?auto_853512 ?auto_853521 ) ) ( not ( = ?auto_853512 ?auto_853522 ) ) ( not ( = ?auto_853512 ?auto_853523 ) ) ( not ( = ?auto_853512 ?auto_853524 ) ) ( not ( = ?auto_853512 ?auto_853525 ) ) ( not ( = ?auto_853512 ?auto_853526 ) ) ( not ( = ?auto_853512 ?auto_853527 ) ) ( not ( = ?auto_853512 ?auto_853528 ) ) ( not ( = ?auto_853512 ?auto_853529 ) ) ( not ( = ?auto_853513 ?auto_853514 ) ) ( not ( = ?auto_853513 ?auto_853515 ) ) ( not ( = ?auto_853513 ?auto_853516 ) ) ( not ( = ?auto_853513 ?auto_853517 ) ) ( not ( = ?auto_853513 ?auto_853518 ) ) ( not ( = ?auto_853513 ?auto_853519 ) ) ( not ( = ?auto_853513 ?auto_853520 ) ) ( not ( = ?auto_853513 ?auto_853521 ) ) ( not ( = ?auto_853513 ?auto_853522 ) ) ( not ( = ?auto_853513 ?auto_853523 ) ) ( not ( = ?auto_853513 ?auto_853524 ) ) ( not ( = ?auto_853513 ?auto_853525 ) ) ( not ( = ?auto_853513 ?auto_853526 ) ) ( not ( = ?auto_853513 ?auto_853527 ) ) ( not ( = ?auto_853513 ?auto_853528 ) ) ( not ( = ?auto_853513 ?auto_853529 ) ) ( not ( = ?auto_853514 ?auto_853515 ) ) ( not ( = ?auto_853514 ?auto_853516 ) ) ( not ( = ?auto_853514 ?auto_853517 ) ) ( not ( = ?auto_853514 ?auto_853518 ) ) ( not ( = ?auto_853514 ?auto_853519 ) ) ( not ( = ?auto_853514 ?auto_853520 ) ) ( not ( = ?auto_853514 ?auto_853521 ) ) ( not ( = ?auto_853514 ?auto_853522 ) ) ( not ( = ?auto_853514 ?auto_853523 ) ) ( not ( = ?auto_853514 ?auto_853524 ) ) ( not ( = ?auto_853514 ?auto_853525 ) ) ( not ( = ?auto_853514 ?auto_853526 ) ) ( not ( = ?auto_853514 ?auto_853527 ) ) ( not ( = ?auto_853514 ?auto_853528 ) ) ( not ( = ?auto_853514 ?auto_853529 ) ) ( not ( = ?auto_853515 ?auto_853516 ) ) ( not ( = ?auto_853515 ?auto_853517 ) ) ( not ( = ?auto_853515 ?auto_853518 ) ) ( not ( = ?auto_853515 ?auto_853519 ) ) ( not ( = ?auto_853515 ?auto_853520 ) ) ( not ( = ?auto_853515 ?auto_853521 ) ) ( not ( = ?auto_853515 ?auto_853522 ) ) ( not ( = ?auto_853515 ?auto_853523 ) ) ( not ( = ?auto_853515 ?auto_853524 ) ) ( not ( = ?auto_853515 ?auto_853525 ) ) ( not ( = ?auto_853515 ?auto_853526 ) ) ( not ( = ?auto_853515 ?auto_853527 ) ) ( not ( = ?auto_853515 ?auto_853528 ) ) ( not ( = ?auto_853515 ?auto_853529 ) ) ( not ( = ?auto_853516 ?auto_853517 ) ) ( not ( = ?auto_853516 ?auto_853518 ) ) ( not ( = ?auto_853516 ?auto_853519 ) ) ( not ( = ?auto_853516 ?auto_853520 ) ) ( not ( = ?auto_853516 ?auto_853521 ) ) ( not ( = ?auto_853516 ?auto_853522 ) ) ( not ( = ?auto_853516 ?auto_853523 ) ) ( not ( = ?auto_853516 ?auto_853524 ) ) ( not ( = ?auto_853516 ?auto_853525 ) ) ( not ( = ?auto_853516 ?auto_853526 ) ) ( not ( = ?auto_853516 ?auto_853527 ) ) ( not ( = ?auto_853516 ?auto_853528 ) ) ( not ( = ?auto_853516 ?auto_853529 ) ) ( not ( = ?auto_853517 ?auto_853518 ) ) ( not ( = ?auto_853517 ?auto_853519 ) ) ( not ( = ?auto_853517 ?auto_853520 ) ) ( not ( = ?auto_853517 ?auto_853521 ) ) ( not ( = ?auto_853517 ?auto_853522 ) ) ( not ( = ?auto_853517 ?auto_853523 ) ) ( not ( = ?auto_853517 ?auto_853524 ) ) ( not ( = ?auto_853517 ?auto_853525 ) ) ( not ( = ?auto_853517 ?auto_853526 ) ) ( not ( = ?auto_853517 ?auto_853527 ) ) ( not ( = ?auto_853517 ?auto_853528 ) ) ( not ( = ?auto_853517 ?auto_853529 ) ) ( not ( = ?auto_853518 ?auto_853519 ) ) ( not ( = ?auto_853518 ?auto_853520 ) ) ( not ( = ?auto_853518 ?auto_853521 ) ) ( not ( = ?auto_853518 ?auto_853522 ) ) ( not ( = ?auto_853518 ?auto_853523 ) ) ( not ( = ?auto_853518 ?auto_853524 ) ) ( not ( = ?auto_853518 ?auto_853525 ) ) ( not ( = ?auto_853518 ?auto_853526 ) ) ( not ( = ?auto_853518 ?auto_853527 ) ) ( not ( = ?auto_853518 ?auto_853528 ) ) ( not ( = ?auto_853518 ?auto_853529 ) ) ( not ( = ?auto_853519 ?auto_853520 ) ) ( not ( = ?auto_853519 ?auto_853521 ) ) ( not ( = ?auto_853519 ?auto_853522 ) ) ( not ( = ?auto_853519 ?auto_853523 ) ) ( not ( = ?auto_853519 ?auto_853524 ) ) ( not ( = ?auto_853519 ?auto_853525 ) ) ( not ( = ?auto_853519 ?auto_853526 ) ) ( not ( = ?auto_853519 ?auto_853527 ) ) ( not ( = ?auto_853519 ?auto_853528 ) ) ( not ( = ?auto_853519 ?auto_853529 ) ) ( not ( = ?auto_853520 ?auto_853521 ) ) ( not ( = ?auto_853520 ?auto_853522 ) ) ( not ( = ?auto_853520 ?auto_853523 ) ) ( not ( = ?auto_853520 ?auto_853524 ) ) ( not ( = ?auto_853520 ?auto_853525 ) ) ( not ( = ?auto_853520 ?auto_853526 ) ) ( not ( = ?auto_853520 ?auto_853527 ) ) ( not ( = ?auto_853520 ?auto_853528 ) ) ( not ( = ?auto_853520 ?auto_853529 ) ) ( not ( = ?auto_853521 ?auto_853522 ) ) ( not ( = ?auto_853521 ?auto_853523 ) ) ( not ( = ?auto_853521 ?auto_853524 ) ) ( not ( = ?auto_853521 ?auto_853525 ) ) ( not ( = ?auto_853521 ?auto_853526 ) ) ( not ( = ?auto_853521 ?auto_853527 ) ) ( not ( = ?auto_853521 ?auto_853528 ) ) ( not ( = ?auto_853521 ?auto_853529 ) ) ( not ( = ?auto_853522 ?auto_853523 ) ) ( not ( = ?auto_853522 ?auto_853524 ) ) ( not ( = ?auto_853522 ?auto_853525 ) ) ( not ( = ?auto_853522 ?auto_853526 ) ) ( not ( = ?auto_853522 ?auto_853527 ) ) ( not ( = ?auto_853522 ?auto_853528 ) ) ( not ( = ?auto_853522 ?auto_853529 ) ) ( not ( = ?auto_853523 ?auto_853524 ) ) ( not ( = ?auto_853523 ?auto_853525 ) ) ( not ( = ?auto_853523 ?auto_853526 ) ) ( not ( = ?auto_853523 ?auto_853527 ) ) ( not ( = ?auto_853523 ?auto_853528 ) ) ( not ( = ?auto_853523 ?auto_853529 ) ) ( not ( = ?auto_853524 ?auto_853525 ) ) ( not ( = ?auto_853524 ?auto_853526 ) ) ( not ( = ?auto_853524 ?auto_853527 ) ) ( not ( = ?auto_853524 ?auto_853528 ) ) ( not ( = ?auto_853524 ?auto_853529 ) ) ( not ( = ?auto_853525 ?auto_853526 ) ) ( not ( = ?auto_853525 ?auto_853527 ) ) ( not ( = ?auto_853525 ?auto_853528 ) ) ( not ( = ?auto_853525 ?auto_853529 ) ) ( not ( = ?auto_853526 ?auto_853527 ) ) ( not ( = ?auto_853526 ?auto_853528 ) ) ( not ( = ?auto_853526 ?auto_853529 ) ) ( not ( = ?auto_853527 ?auto_853528 ) ) ( not ( = ?auto_853527 ?auto_853529 ) ) ( not ( = ?auto_853528 ?auto_853529 ) ) ( ON ?auto_853527 ?auto_853528 ) ( ON ?auto_853526 ?auto_853527 ) ( ON ?auto_853525 ?auto_853526 ) ( ON ?auto_853524 ?auto_853525 ) ( ON ?auto_853523 ?auto_853524 ) ( ON ?auto_853522 ?auto_853523 ) ( ON ?auto_853521 ?auto_853522 ) ( ON ?auto_853520 ?auto_853521 ) ( ON ?auto_853519 ?auto_853520 ) ( ON ?auto_853518 ?auto_853519 ) ( CLEAR ?auto_853516 ) ( ON ?auto_853517 ?auto_853518 ) ( CLEAR ?auto_853517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_853511 ?auto_853512 ?auto_853513 ?auto_853514 ?auto_853515 ?auto_853516 ?auto_853517 )
      ( MAKE-18PILE ?auto_853511 ?auto_853512 ?auto_853513 ?auto_853514 ?auto_853515 ?auto_853516 ?auto_853517 ?auto_853518 ?auto_853519 ?auto_853520 ?auto_853521 ?auto_853522 ?auto_853523 ?auto_853524 ?auto_853525 ?auto_853526 ?auto_853527 ?auto_853528 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_853548 - BLOCK
      ?auto_853549 - BLOCK
      ?auto_853550 - BLOCK
      ?auto_853551 - BLOCK
      ?auto_853552 - BLOCK
      ?auto_853553 - BLOCK
      ?auto_853554 - BLOCK
      ?auto_853555 - BLOCK
      ?auto_853556 - BLOCK
      ?auto_853557 - BLOCK
      ?auto_853558 - BLOCK
      ?auto_853559 - BLOCK
      ?auto_853560 - BLOCK
      ?auto_853561 - BLOCK
      ?auto_853562 - BLOCK
      ?auto_853563 - BLOCK
      ?auto_853564 - BLOCK
      ?auto_853565 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_853565 ) ( ON-TABLE ?auto_853548 ) ( ON ?auto_853549 ?auto_853548 ) ( ON ?auto_853550 ?auto_853549 ) ( ON ?auto_853551 ?auto_853550 ) ( ON ?auto_853552 ?auto_853551 ) ( ON ?auto_853553 ?auto_853552 ) ( not ( = ?auto_853548 ?auto_853549 ) ) ( not ( = ?auto_853548 ?auto_853550 ) ) ( not ( = ?auto_853548 ?auto_853551 ) ) ( not ( = ?auto_853548 ?auto_853552 ) ) ( not ( = ?auto_853548 ?auto_853553 ) ) ( not ( = ?auto_853548 ?auto_853554 ) ) ( not ( = ?auto_853548 ?auto_853555 ) ) ( not ( = ?auto_853548 ?auto_853556 ) ) ( not ( = ?auto_853548 ?auto_853557 ) ) ( not ( = ?auto_853548 ?auto_853558 ) ) ( not ( = ?auto_853548 ?auto_853559 ) ) ( not ( = ?auto_853548 ?auto_853560 ) ) ( not ( = ?auto_853548 ?auto_853561 ) ) ( not ( = ?auto_853548 ?auto_853562 ) ) ( not ( = ?auto_853548 ?auto_853563 ) ) ( not ( = ?auto_853548 ?auto_853564 ) ) ( not ( = ?auto_853548 ?auto_853565 ) ) ( not ( = ?auto_853549 ?auto_853550 ) ) ( not ( = ?auto_853549 ?auto_853551 ) ) ( not ( = ?auto_853549 ?auto_853552 ) ) ( not ( = ?auto_853549 ?auto_853553 ) ) ( not ( = ?auto_853549 ?auto_853554 ) ) ( not ( = ?auto_853549 ?auto_853555 ) ) ( not ( = ?auto_853549 ?auto_853556 ) ) ( not ( = ?auto_853549 ?auto_853557 ) ) ( not ( = ?auto_853549 ?auto_853558 ) ) ( not ( = ?auto_853549 ?auto_853559 ) ) ( not ( = ?auto_853549 ?auto_853560 ) ) ( not ( = ?auto_853549 ?auto_853561 ) ) ( not ( = ?auto_853549 ?auto_853562 ) ) ( not ( = ?auto_853549 ?auto_853563 ) ) ( not ( = ?auto_853549 ?auto_853564 ) ) ( not ( = ?auto_853549 ?auto_853565 ) ) ( not ( = ?auto_853550 ?auto_853551 ) ) ( not ( = ?auto_853550 ?auto_853552 ) ) ( not ( = ?auto_853550 ?auto_853553 ) ) ( not ( = ?auto_853550 ?auto_853554 ) ) ( not ( = ?auto_853550 ?auto_853555 ) ) ( not ( = ?auto_853550 ?auto_853556 ) ) ( not ( = ?auto_853550 ?auto_853557 ) ) ( not ( = ?auto_853550 ?auto_853558 ) ) ( not ( = ?auto_853550 ?auto_853559 ) ) ( not ( = ?auto_853550 ?auto_853560 ) ) ( not ( = ?auto_853550 ?auto_853561 ) ) ( not ( = ?auto_853550 ?auto_853562 ) ) ( not ( = ?auto_853550 ?auto_853563 ) ) ( not ( = ?auto_853550 ?auto_853564 ) ) ( not ( = ?auto_853550 ?auto_853565 ) ) ( not ( = ?auto_853551 ?auto_853552 ) ) ( not ( = ?auto_853551 ?auto_853553 ) ) ( not ( = ?auto_853551 ?auto_853554 ) ) ( not ( = ?auto_853551 ?auto_853555 ) ) ( not ( = ?auto_853551 ?auto_853556 ) ) ( not ( = ?auto_853551 ?auto_853557 ) ) ( not ( = ?auto_853551 ?auto_853558 ) ) ( not ( = ?auto_853551 ?auto_853559 ) ) ( not ( = ?auto_853551 ?auto_853560 ) ) ( not ( = ?auto_853551 ?auto_853561 ) ) ( not ( = ?auto_853551 ?auto_853562 ) ) ( not ( = ?auto_853551 ?auto_853563 ) ) ( not ( = ?auto_853551 ?auto_853564 ) ) ( not ( = ?auto_853551 ?auto_853565 ) ) ( not ( = ?auto_853552 ?auto_853553 ) ) ( not ( = ?auto_853552 ?auto_853554 ) ) ( not ( = ?auto_853552 ?auto_853555 ) ) ( not ( = ?auto_853552 ?auto_853556 ) ) ( not ( = ?auto_853552 ?auto_853557 ) ) ( not ( = ?auto_853552 ?auto_853558 ) ) ( not ( = ?auto_853552 ?auto_853559 ) ) ( not ( = ?auto_853552 ?auto_853560 ) ) ( not ( = ?auto_853552 ?auto_853561 ) ) ( not ( = ?auto_853552 ?auto_853562 ) ) ( not ( = ?auto_853552 ?auto_853563 ) ) ( not ( = ?auto_853552 ?auto_853564 ) ) ( not ( = ?auto_853552 ?auto_853565 ) ) ( not ( = ?auto_853553 ?auto_853554 ) ) ( not ( = ?auto_853553 ?auto_853555 ) ) ( not ( = ?auto_853553 ?auto_853556 ) ) ( not ( = ?auto_853553 ?auto_853557 ) ) ( not ( = ?auto_853553 ?auto_853558 ) ) ( not ( = ?auto_853553 ?auto_853559 ) ) ( not ( = ?auto_853553 ?auto_853560 ) ) ( not ( = ?auto_853553 ?auto_853561 ) ) ( not ( = ?auto_853553 ?auto_853562 ) ) ( not ( = ?auto_853553 ?auto_853563 ) ) ( not ( = ?auto_853553 ?auto_853564 ) ) ( not ( = ?auto_853553 ?auto_853565 ) ) ( not ( = ?auto_853554 ?auto_853555 ) ) ( not ( = ?auto_853554 ?auto_853556 ) ) ( not ( = ?auto_853554 ?auto_853557 ) ) ( not ( = ?auto_853554 ?auto_853558 ) ) ( not ( = ?auto_853554 ?auto_853559 ) ) ( not ( = ?auto_853554 ?auto_853560 ) ) ( not ( = ?auto_853554 ?auto_853561 ) ) ( not ( = ?auto_853554 ?auto_853562 ) ) ( not ( = ?auto_853554 ?auto_853563 ) ) ( not ( = ?auto_853554 ?auto_853564 ) ) ( not ( = ?auto_853554 ?auto_853565 ) ) ( not ( = ?auto_853555 ?auto_853556 ) ) ( not ( = ?auto_853555 ?auto_853557 ) ) ( not ( = ?auto_853555 ?auto_853558 ) ) ( not ( = ?auto_853555 ?auto_853559 ) ) ( not ( = ?auto_853555 ?auto_853560 ) ) ( not ( = ?auto_853555 ?auto_853561 ) ) ( not ( = ?auto_853555 ?auto_853562 ) ) ( not ( = ?auto_853555 ?auto_853563 ) ) ( not ( = ?auto_853555 ?auto_853564 ) ) ( not ( = ?auto_853555 ?auto_853565 ) ) ( not ( = ?auto_853556 ?auto_853557 ) ) ( not ( = ?auto_853556 ?auto_853558 ) ) ( not ( = ?auto_853556 ?auto_853559 ) ) ( not ( = ?auto_853556 ?auto_853560 ) ) ( not ( = ?auto_853556 ?auto_853561 ) ) ( not ( = ?auto_853556 ?auto_853562 ) ) ( not ( = ?auto_853556 ?auto_853563 ) ) ( not ( = ?auto_853556 ?auto_853564 ) ) ( not ( = ?auto_853556 ?auto_853565 ) ) ( not ( = ?auto_853557 ?auto_853558 ) ) ( not ( = ?auto_853557 ?auto_853559 ) ) ( not ( = ?auto_853557 ?auto_853560 ) ) ( not ( = ?auto_853557 ?auto_853561 ) ) ( not ( = ?auto_853557 ?auto_853562 ) ) ( not ( = ?auto_853557 ?auto_853563 ) ) ( not ( = ?auto_853557 ?auto_853564 ) ) ( not ( = ?auto_853557 ?auto_853565 ) ) ( not ( = ?auto_853558 ?auto_853559 ) ) ( not ( = ?auto_853558 ?auto_853560 ) ) ( not ( = ?auto_853558 ?auto_853561 ) ) ( not ( = ?auto_853558 ?auto_853562 ) ) ( not ( = ?auto_853558 ?auto_853563 ) ) ( not ( = ?auto_853558 ?auto_853564 ) ) ( not ( = ?auto_853558 ?auto_853565 ) ) ( not ( = ?auto_853559 ?auto_853560 ) ) ( not ( = ?auto_853559 ?auto_853561 ) ) ( not ( = ?auto_853559 ?auto_853562 ) ) ( not ( = ?auto_853559 ?auto_853563 ) ) ( not ( = ?auto_853559 ?auto_853564 ) ) ( not ( = ?auto_853559 ?auto_853565 ) ) ( not ( = ?auto_853560 ?auto_853561 ) ) ( not ( = ?auto_853560 ?auto_853562 ) ) ( not ( = ?auto_853560 ?auto_853563 ) ) ( not ( = ?auto_853560 ?auto_853564 ) ) ( not ( = ?auto_853560 ?auto_853565 ) ) ( not ( = ?auto_853561 ?auto_853562 ) ) ( not ( = ?auto_853561 ?auto_853563 ) ) ( not ( = ?auto_853561 ?auto_853564 ) ) ( not ( = ?auto_853561 ?auto_853565 ) ) ( not ( = ?auto_853562 ?auto_853563 ) ) ( not ( = ?auto_853562 ?auto_853564 ) ) ( not ( = ?auto_853562 ?auto_853565 ) ) ( not ( = ?auto_853563 ?auto_853564 ) ) ( not ( = ?auto_853563 ?auto_853565 ) ) ( not ( = ?auto_853564 ?auto_853565 ) ) ( ON ?auto_853564 ?auto_853565 ) ( ON ?auto_853563 ?auto_853564 ) ( ON ?auto_853562 ?auto_853563 ) ( ON ?auto_853561 ?auto_853562 ) ( ON ?auto_853560 ?auto_853561 ) ( ON ?auto_853559 ?auto_853560 ) ( ON ?auto_853558 ?auto_853559 ) ( ON ?auto_853557 ?auto_853558 ) ( ON ?auto_853556 ?auto_853557 ) ( ON ?auto_853555 ?auto_853556 ) ( CLEAR ?auto_853553 ) ( ON ?auto_853554 ?auto_853555 ) ( CLEAR ?auto_853554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_853548 ?auto_853549 ?auto_853550 ?auto_853551 ?auto_853552 ?auto_853553 ?auto_853554 )
      ( MAKE-18PILE ?auto_853548 ?auto_853549 ?auto_853550 ?auto_853551 ?auto_853552 ?auto_853553 ?auto_853554 ?auto_853555 ?auto_853556 ?auto_853557 ?auto_853558 ?auto_853559 ?auto_853560 ?auto_853561 ?auto_853562 ?auto_853563 ?auto_853564 ?auto_853565 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_853584 - BLOCK
      ?auto_853585 - BLOCK
      ?auto_853586 - BLOCK
      ?auto_853587 - BLOCK
      ?auto_853588 - BLOCK
      ?auto_853589 - BLOCK
      ?auto_853590 - BLOCK
      ?auto_853591 - BLOCK
      ?auto_853592 - BLOCK
      ?auto_853593 - BLOCK
      ?auto_853594 - BLOCK
      ?auto_853595 - BLOCK
      ?auto_853596 - BLOCK
      ?auto_853597 - BLOCK
      ?auto_853598 - BLOCK
      ?auto_853599 - BLOCK
      ?auto_853600 - BLOCK
      ?auto_853601 - BLOCK
    )
    :vars
    (
      ?auto_853602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_853601 ?auto_853602 ) ( ON-TABLE ?auto_853584 ) ( ON ?auto_853585 ?auto_853584 ) ( ON ?auto_853586 ?auto_853585 ) ( ON ?auto_853587 ?auto_853586 ) ( ON ?auto_853588 ?auto_853587 ) ( not ( = ?auto_853584 ?auto_853585 ) ) ( not ( = ?auto_853584 ?auto_853586 ) ) ( not ( = ?auto_853584 ?auto_853587 ) ) ( not ( = ?auto_853584 ?auto_853588 ) ) ( not ( = ?auto_853584 ?auto_853589 ) ) ( not ( = ?auto_853584 ?auto_853590 ) ) ( not ( = ?auto_853584 ?auto_853591 ) ) ( not ( = ?auto_853584 ?auto_853592 ) ) ( not ( = ?auto_853584 ?auto_853593 ) ) ( not ( = ?auto_853584 ?auto_853594 ) ) ( not ( = ?auto_853584 ?auto_853595 ) ) ( not ( = ?auto_853584 ?auto_853596 ) ) ( not ( = ?auto_853584 ?auto_853597 ) ) ( not ( = ?auto_853584 ?auto_853598 ) ) ( not ( = ?auto_853584 ?auto_853599 ) ) ( not ( = ?auto_853584 ?auto_853600 ) ) ( not ( = ?auto_853584 ?auto_853601 ) ) ( not ( = ?auto_853584 ?auto_853602 ) ) ( not ( = ?auto_853585 ?auto_853586 ) ) ( not ( = ?auto_853585 ?auto_853587 ) ) ( not ( = ?auto_853585 ?auto_853588 ) ) ( not ( = ?auto_853585 ?auto_853589 ) ) ( not ( = ?auto_853585 ?auto_853590 ) ) ( not ( = ?auto_853585 ?auto_853591 ) ) ( not ( = ?auto_853585 ?auto_853592 ) ) ( not ( = ?auto_853585 ?auto_853593 ) ) ( not ( = ?auto_853585 ?auto_853594 ) ) ( not ( = ?auto_853585 ?auto_853595 ) ) ( not ( = ?auto_853585 ?auto_853596 ) ) ( not ( = ?auto_853585 ?auto_853597 ) ) ( not ( = ?auto_853585 ?auto_853598 ) ) ( not ( = ?auto_853585 ?auto_853599 ) ) ( not ( = ?auto_853585 ?auto_853600 ) ) ( not ( = ?auto_853585 ?auto_853601 ) ) ( not ( = ?auto_853585 ?auto_853602 ) ) ( not ( = ?auto_853586 ?auto_853587 ) ) ( not ( = ?auto_853586 ?auto_853588 ) ) ( not ( = ?auto_853586 ?auto_853589 ) ) ( not ( = ?auto_853586 ?auto_853590 ) ) ( not ( = ?auto_853586 ?auto_853591 ) ) ( not ( = ?auto_853586 ?auto_853592 ) ) ( not ( = ?auto_853586 ?auto_853593 ) ) ( not ( = ?auto_853586 ?auto_853594 ) ) ( not ( = ?auto_853586 ?auto_853595 ) ) ( not ( = ?auto_853586 ?auto_853596 ) ) ( not ( = ?auto_853586 ?auto_853597 ) ) ( not ( = ?auto_853586 ?auto_853598 ) ) ( not ( = ?auto_853586 ?auto_853599 ) ) ( not ( = ?auto_853586 ?auto_853600 ) ) ( not ( = ?auto_853586 ?auto_853601 ) ) ( not ( = ?auto_853586 ?auto_853602 ) ) ( not ( = ?auto_853587 ?auto_853588 ) ) ( not ( = ?auto_853587 ?auto_853589 ) ) ( not ( = ?auto_853587 ?auto_853590 ) ) ( not ( = ?auto_853587 ?auto_853591 ) ) ( not ( = ?auto_853587 ?auto_853592 ) ) ( not ( = ?auto_853587 ?auto_853593 ) ) ( not ( = ?auto_853587 ?auto_853594 ) ) ( not ( = ?auto_853587 ?auto_853595 ) ) ( not ( = ?auto_853587 ?auto_853596 ) ) ( not ( = ?auto_853587 ?auto_853597 ) ) ( not ( = ?auto_853587 ?auto_853598 ) ) ( not ( = ?auto_853587 ?auto_853599 ) ) ( not ( = ?auto_853587 ?auto_853600 ) ) ( not ( = ?auto_853587 ?auto_853601 ) ) ( not ( = ?auto_853587 ?auto_853602 ) ) ( not ( = ?auto_853588 ?auto_853589 ) ) ( not ( = ?auto_853588 ?auto_853590 ) ) ( not ( = ?auto_853588 ?auto_853591 ) ) ( not ( = ?auto_853588 ?auto_853592 ) ) ( not ( = ?auto_853588 ?auto_853593 ) ) ( not ( = ?auto_853588 ?auto_853594 ) ) ( not ( = ?auto_853588 ?auto_853595 ) ) ( not ( = ?auto_853588 ?auto_853596 ) ) ( not ( = ?auto_853588 ?auto_853597 ) ) ( not ( = ?auto_853588 ?auto_853598 ) ) ( not ( = ?auto_853588 ?auto_853599 ) ) ( not ( = ?auto_853588 ?auto_853600 ) ) ( not ( = ?auto_853588 ?auto_853601 ) ) ( not ( = ?auto_853588 ?auto_853602 ) ) ( not ( = ?auto_853589 ?auto_853590 ) ) ( not ( = ?auto_853589 ?auto_853591 ) ) ( not ( = ?auto_853589 ?auto_853592 ) ) ( not ( = ?auto_853589 ?auto_853593 ) ) ( not ( = ?auto_853589 ?auto_853594 ) ) ( not ( = ?auto_853589 ?auto_853595 ) ) ( not ( = ?auto_853589 ?auto_853596 ) ) ( not ( = ?auto_853589 ?auto_853597 ) ) ( not ( = ?auto_853589 ?auto_853598 ) ) ( not ( = ?auto_853589 ?auto_853599 ) ) ( not ( = ?auto_853589 ?auto_853600 ) ) ( not ( = ?auto_853589 ?auto_853601 ) ) ( not ( = ?auto_853589 ?auto_853602 ) ) ( not ( = ?auto_853590 ?auto_853591 ) ) ( not ( = ?auto_853590 ?auto_853592 ) ) ( not ( = ?auto_853590 ?auto_853593 ) ) ( not ( = ?auto_853590 ?auto_853594 ) ) ( not ( = ?auto_853590 ?auto_853595 ) ) ( not ( = ?auto_853590 ?auto_853596 ) ) ( not ( = ?auto_853590 ?auto_853597 ) ) ( not ( = ?auto_853590 ?auto_853598 ) ) ( not ( = ?auto_853590 ?auto_853599 ) ) ( not ( = ?auto_853590 ?auto_853600 ) ) ( not ( = ?auto_853590 ?auto_853601 ) ) ( not ( = ?auto_853590 ?auto_853602 ) ) ( not ( = ?auto_853591 ?auto_853592 ) ) ( not ( = ?auto_853591 ?auto_853593 ) ) ( not ( = ?auto_853591 ?auto_853594 ) ) ( not ( = ?auto_853591 ?auto_853595 ) ) ( not ( = ?auto_853591 ?auto_853596 ) ) ( not ( = ?auto_853591 ?auto_853597 ) ) ( not ( = ?auto_853591 ?auto_853598 ) ) ( not ( = ?auto_853591 ?auto_853599 ) ) ( not ( = ?auto_853591 ?auto_853600 ) ) ( not ( = ?auto_853591 ?auto_853601 ) ) ( not ( = ?auto_853591 ?auto_853602 ) ) ( not ( = ?auto_853592 ?auto_853593 ) ) ( not ( = ?auto_853592 ?auto_853594 ) ) ( not ( = ?auto_853592 ?auto_853595 ) ) ( not ( = ?auto_853592 ?auto_853596 ) ) ( not ( = ?auto_853592 ?auto_853597 ) ) ( not ( = ?auto_853592 ?auto_853598 ) ) ( not ( = ?auto_853592 ?auto_853599 ) ) ( not ( = ?auto_853592 ?auto_853600 ) ) ( not ( = ?auto_853592 ?auto_853601 ) ) ( not ( = ?auto_853592 ?auto_853602 ) ) ( not ( = ?auto_853593 ?auto_853594 ) ) ( not ( = ?auto_853593 ?auto_853595 ) ) ( not ( = ?auto_853593 ?auto_853596 ) ) ( not ( = ?auto_853593 ?auto_853597 ) ) ( not ( = ?auto_853593 ?auto_853598 ) ) ( not ( = ?auto_853593 ?auto_853599 ) ) ( not ( = ?auto_853593 ?auto_853600 ) ) ( not ( = ?auto_853593 ?auto_853601 ) ) ( not ( = ?auto_853593 ?auto_853602 ) ) ( not ( = ?auto_853594 ?auto_853595 ) ) ( not ( = ?auto_853594 ?auto_853596 ) ) ( not ( = ?auto_853594 ?auto_853597 ) ) ( not ( = ?auto_853594 ?auto_853598 ) ) ( not ( = ?auto_853594 ?auto_853599 ) ) ( not ( = ?auto_853594 ?auto_853600 ) ) ( not ( = ?auto_853594 ?auto_853601 ) ) ( not ( = ?auto_853594 ?auto_853602 ) ) ( not ( = ?auto_853595 ?auto_853596 ) ) ( not ( = ?auto_853595 ?auto_853597 ) ) ( not ( = ?auto_853595 ?auto_853598 ) ) ( not ( = ?auto_853595 ?auto_853599 ) ) ( not ( = ?auto_853595 ?auto_853600 ) ) ( not ( = ?auto_853595 ?auto_853601 ) ) ( not ( = ?auto_853595 ?auto_853602 ) ) ( not ( = ?auto_853596 ?auto_853597 ) ) ( not ( = ?auto_853596 ?auto_853598 ) ) ( not ( = ?auto_853596 ?auto_853599 ) ) ( not ( = ?auto_853596 ?auto_853600 ) ) ( not ( = ?auto_853596 ?auto_853601 ) ) ( not ( = ?auto_853596 ?auto_853602 ) ) ( not ( = ?auto_853597 ?auto_853598 ) ) ( not ( = ?auto_853597 ?auto_853599 ) ) ( not ( = ?auto_853597 ?auto_853600 ) ) ( not ( = ?auto_853597 ?auto_853601 ) ) ( not ( = ?auto_853597 ?auto_853602 ) ) ( not ( = ?auto_853598 ?auto_853599 ) ) ( not ( = ?auto_853598 ?auto_853600 ) ) ( not ( = ?auto_853598 ?auto_853601 ) ) ( not ( = ?auto_853598 ?auto_853602 ) ) ( not ( = ?auto_853599 ?auto_853600 ) ) ( not ( = ?auto_853599 ?auto_853601 ) ) ( not ( = ?auto_853599 ?auto_853602 ) ) ( not ( = ?auto_853600 ?auto_853601 ) ) ( not ( = ?auto_853600 ?auto_853602 ) ) ( not ( = ?auto_853601 ?auto_853602 ) ) ( ON ?auto_853600 ?auto_853601 ) ( ON ?auto_853599 ?auto_853600 ) ( ON ?auto_853598 ?auto_853599 ) ( ON ?auto_853597 ?auto_853598 ) ( ON ?auto_853596 ?auto_853597 ) ( ON ?auto_853595 ?auto_853596 ) ( ON ?auto_853594 ?auto_853595 ) ( ON ?auto_853593 ?auto_853594 ) ( ON ?auto_853592 ?auto_853593 ) ( ON ?auto_853591 ?auto_853592 ) ( ON ?auto_853590 ?auto_853591 ) ( CLEAR ?auto_853588 ) ( ON ?auto_853589 ?auto_853590 ) ( CLEAR ?auto_853589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_853584 ?auto_853585 ?auto_853586 ?auto_853587 ?auto_853588 ?auto_853589 )
      ( MAKE-18PILE ?auto_853584 ?auto_853585 ?auto_853586 ?auto_853587 ?auto_853588 ?auto_853589 ?auto_853590 ?auto_853591 ?auto_853592 ?auto_853593 ?auto_853594 ?auto_853595 ?auto_853596 ?auto_853597 ?auto_853598 ?auto_853599 ?auto_853600 ?auto_853601 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_853621 - BLOCK
      ?auto_853622 - BLOCK
      ?auto_853623 - BLOCK
      ?auto_853624 - BLOCK
      ?auto_853625 - BLOCK
      ?auto_853626 - BLOCK
      ?auto_853627 - BLOCK
      ?auto_853628 - BLOCK
      ?auto_853629 - BLOCK
      ?auto_853630 - BLOCK
      ?auto_853631 - BLOCK
      ?auto_853632 - BLOCK
      ?auto_853633 - BLOCK
      ?auto_853634 - BLOCK
      ?auto_853635 - BLOCK
      ?auto_853636 - BLOCK
      ?auto_853637 - BLOCK
      ?auto_853638 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_853638 ) ( ON-TABLE ?auto_853621 ) ( ON ?auto_853622 ?auto_853621 ) ( ON ?auto_853623 ?auto_853622 ) ( ON ?auto_853624 ?auto_853623 ) ( ON ?auto_853625 ?auto_853624 ) ( not ( = ?auto_853621 ?auto_853622 ) ) ( not ( = ?auto_853621 ?auto_853623 ) ) ( not ( = ?auto_853621 ?auto_853624 ) ) ( not ( = ?auto_853621 ?auto_853625 ) ) ( not ( = ?auto_853621 ?auto_853626 ) ) ( not ( = ?auto_853621 ?auto_853627 ) ) ( not ( = ?auto_853621 ?auto_853628 ) ) ( not ( = ?auto_853621 ?auto_853629 ) ) ( not ( = ?auto_853621 ?auto_853630 ) ) ( not ( = ?auto_853621 ?auto_853631 ) ) ( not ( = ?auto_853621 ?auto_853632 ) ) ( not ( = ?auto_853621 ?auto_853633 ) ) ( not ( = ?auto_853621 ?auto_853634 ) ) ( not ( = ?auto_853621 ?auto_853635 ) ) ( not ( = ?auto_853621 ?auto_853636 ) ) ( not ( = ?auto_853621 ?auto_853637 ) ) ( not ( = ?auto_853621 ?auto_853638 ) ) ( not ( = ?auto_853622 ?auto_853623 ) ) ( not ( = ?auto_853622 ?auto_853624 ) ) ( not ( = ?auto_853622 ?auto_853625 ) ) ( not ( = ?auto_853622 ?auto_853626 ) ) ( not ( = ?auto_853622 ?auto_853627 ) ) ( not ( = ?auto_853622 ?auto_853628 ) ) ( not ( = ?auto_853622 ?auto_853629 ) ) ( not ( = ?auto_853622 ?auto_853630 ) ) ( not ( = ?auto_853622 ?auto_853631 ) ) ( not ( = ?auto_853622 ?auto_853632 ) ) ( not ( = ?auto_853622 ?auto_853633 ) ) ( not ( = ?auto_853622 ?auto_853634 ) ) ( not ( = ?auto_853622 ?auto_853635 ) ) ( not ( = ?auto_853622 ?auto_853636 ) ) ( not ( = ?auto_853622 ?auto_853637 ) ) ( not ( = ?auto_853622 ?auto_853638 ) ) ( not ( = ?auto_853623 ?auto_853624 ) ) ( not ( = ?auto_853623 ?auto_853625 ) ) ( not ( = ?auto_853623 ?auto_853626 ) ) ( not ( = ?auto_853623 ?auto_853627 ) ) ( not ( = ?auto_853623 ?auto_853628 ) ) ( not ( = ?auto_853623 ?auto_853629 ) ) ( not ( = ?auto_853623 ?auto_853630 ) ) ( not ( = ?auto_853623 ?auto_853631 ) ) ( not ( = ?auto_853623 ?auto_853632 ) ) ( not ( = ?auto_853623 ?auto_853633 ) ) ( not ( = ?auto_853623 ?auto_853634 ) ) ( not ( = ?auto_853623 ?auto_853635 ) ) ( not ( = ?auto_853623 ?auto_853636 ) ) ( not ( = ?auto_853623 ?auto_853637 ) ) ( not ( = ?auto_853623 ?auto_853638 ) ) ( not ( = ?auto_853624 ?auto_853625 ) ) ( not ( = ?auto_853624 ?auto_853626 ) ) ( not ( = ?auto_853624 ?auto_853627 ) ) ( not ( = ?auto_853624 ?auto_853628 ) ) ( not ( = ?auto_853624 ?auto_853629 ) ) ( not ( = ?auto_853624 ?auto_853630 ) ) ( not ( = ?auto_853624 ?auto_853631 ) ) ( not ( = ?auto_853624 ?auto_853632 ) ) ( not ( = ?auto_853624 ?auto_853633 ) ) ( not ( = ?auto_853624 ?auto_853634 ) ) ( not ( = ?auto_853624 ?auto_853635 ) ) ( not ( = ?auto_853624 ?auto_853636 ) ) ( not ( = ?auto_853624 ?auto_853637 ) ) ( not ( = ?auto_853624 ?auto_853638 ) ) ( not ( = ?auto_853625 ?auto_853626 ) ) ( not ( = ?auto_853625 ?auto_853627 ) ) ( not ( = ?auto_853625 ?auto_853628 ) ) ( not ( = ?auto_853625 ?auto_853629 ) ) ( not ( = ?auto_853625 ?auto_853630 ) ) ( not ( = ?auto_853625 ?auto_853631 ) ) ( not ( = ?auto_853625 ?auto_853632 ) ) ( not ( = ?auto_853625 ?auto_853633 ) ) ( not ( = ?auto_853625 ?auto_853634 ) ) ( not ( = ?auto_853625 ?auto_853635 ) ) ( not ( = ?auto_853625 ?auto_853636 ) ) ( not ( = ?auto_853625 ?auto_853637 ) ) ( not ( = ?auto_853625 ?auto_853638 ) ) ( not ( = ?auto_853626 ?auto_853627 ) ) ( not ( = ?auto_853626 ?auto_853628 ) ) ( not ( = ?auto_853626 ?auto_853629 ) ) ( not ( = ?auto_853626 ?auto_853630 ) ) ( not ( = ?auto_853626 ?auto_853631 ) ) ( not ( = ?auto_853626 ?auto_853632 ) ) ( not ( = ?auto_853626 ?auto_853633 ) ) ( not ( = ?auto_853626 ?auto_853634 ) ) ( not ( = ?auto_853626 ?auto_853635 ) ) ( not ( = ?auto_853626 ?auto_853636 ) ) ( not ( = ?auto_853626 ?auto_853637 ) ) ( not ( = ?auto_853626 ?auto_853638 ) ) ( not ( = ?auto_853627 ?auto_853628 ) ) ( not ( = ?auto_853627 ?auto_853629 ) ) ( not ( = ?auto_853627 ?auto_853630 ) ) ( not ( = ?auto_853627 ?auto_853631 ) ) ( not ( = ?auto_853627 ?auto_853632 ) ) ( not ( = ?auto_853627 ?auto_853633 ) ) ( not ( = ?auto_853627 ?auto_853634 ) ) ( not ( = ?auto_853627 ?auto_853635 ) ) ( not ( = ?auto_853627 ?auto_853636 ) ) ( not ( = ?auto_853627 ?auto_853637 ) ) ( not ( = ?auto_853627 ?auto_853638 ) ) ( not ( = ?auto_853628 ?auto_853629 ) ) ( not ( = ?auto_853628 ?auto_853630 ) ) ( not ( = ?auto_853628 ?auto_853631 ) ) ( not ( = ?auto_853628 ?auto_853632 ) ) ( not ( = ?auto_853628 ?auto_853633 ) ) ( not ( = ?auto_853628 ?auto_853634 ) ) ( not ( = ?auto_853628 ?auto_853635 ) ) ( not ( = ?auto_853628 ?auto_853636 ) ) ( not ( = ?auto_853628 ?auto_853637 ) ) ( not ( = ?auto_853628 ?auto_853638 ) ) ( not ( = ?auto_853629 ?auto_853630 ) ) ( not ( = ?auto_853629 ?auto_853631 ) ) ( not ( = ?auto_853629 ?auto_853632 ) ) ( not ( = ?auto_853629 ?auto_853633 ) ) ( not ( = ?auto_853629 ?auto_853634 ) ) ( not ( = ?auto_853629 ?auto_853635 ) ) ( not ( = ?auto_853629 ?auto_853636 ) ) ( not ( = ?auto_853629 ?auto_853637 ) ) ( not ( = ?auto_853629 ?auto_853638 ) ) ( not ( = ?auto_853630 ?auto_853631 ) ) ( not ( = ?auto_853630 ?auto_853632 ) ) ( not ( = ?auto_853630 ?auto_853633 ) ) ( not ( = ?auto_853630 ?auto_853634 ) ) ( not ( = ?auto_853630 ?auto_853635 ) ) ( not ( = ?auto_853630 ?auto_853636 ) ) ( not ( = ?auto_853630 ?auto_853637 ) ) ( not ( = ?auto_853630 ?auto_853638 ) ) ( not ( = ?auto_853631 ?auto_853632 ) ) ( not ( = ?auto_853631 ?auto_853633 ) ) ( not ( = ?auto_853631 ?auto_853634 ) ) ( not ( = ?auto_853631 ?auto_853635 ) ) ( not ( = ?auto_853631 ?auto_853636 ) ) ( not ( = ?auto_853631 ?auto_853637 ) ) ( not ( = ?auto_853631 ?auto_853638 ) ) ( not ( = ?auto_853632 ?auto_853633 ) ) ( not ( = ?auto_853632 ?auto_853634 ) ) ( not ( = ?auto_853632 ?auto_853635 ) ) ( not ( = ?auto_853632 ?auto_853636 ) ) ( not ( = ?auto_853632 ?auto_853637 ) ) ( not ( = ?auto_853632 ?auto_853638 ) ) ( not ( = ?auto_853633 ?auto_853634 ) ) ( not ( = ?auto_853633 ?auto_853635 ) ) ( not ( = ?auto_853633 ?auto_853636 ) ) ( not ( = ?auto_853633 ?auto_853637 ) ) ( not ( = ?auto_853633 ?auto_853638 ) ) ( not ( = ?auto_853634 ?auto_853635 ) ) ( not ( = ?auto_853634 ?auto_853636 ) ) ( not ( = ?auto_853634 ?auto_853637 ) ) ( not ( = ?auto_853634 ?auto_853638 ) ) ( not ( = ?auto_853635 ?auto_853636 ) ) ( not ( = ?auto_853635 ?auto_853637 ) ) ( not ( = ?auto_853635 ?auto_853638 ) ) ( not ( = ?auto_853636 ?auto_853637 ) ) ( not ( = ?auto_853636 ?auto_853638 ) ) ( not ( = ?auto_853637 ?auto_853638 ) ) ( ON ?auto_853637 ?auto_853638 ) ( ON ?auto_853636 ?auto_853637 ) ( ON ?auto_853635 ?auto_853636 ) ( ON ?auto_853634 ?auto_853635 ) ( ON ?auto_853633 ?auto_853634 ) ( ON ?auto_853632 ?auto_853633 ) ( ON ?auto_853631 ?auto_853632 ) ( ON ?auto_853630 ?auto_853631 ) ( ON ?auto_853629 ?auto_853630 ) ( ON ?auto_853628 ?auto_853629 ) ( ON ?auto_853627 ?auto_853628 ) ( CLEAR ?auto_853625 ) ( ON ?auto_853626 ?auto_853627 ) ( CLEAR ?auto_853626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_853621 ?auto_853622 ?auto_853623 ?auto_853624 ?auto_853625 ?auto_853626 )
      ( MAKE-18PILE ?auto_853621 ?auto_853622 ?auto_853623 ?auto_853624 ?auto_853625 ?auto_853626 ?auto_853627 ?auto_853628 ?auto_853629 ?auto_853630 ?auto_853631 ?auto_853632 ?auto_853633 ?auto_853634 ?auto_853635 ?auto_853636 ?auto_853637 ?auto_853638 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_853657 - BLOCK
      ?auto_853658 - BLOCK
      ?auto_853659 - BLOCK
      ?auto_853660 - BLOCK
      ?auto_853661 - BLOCK
      ?auto_853662 - BLOCK
      ?auto_853663 - BLOCK
      ?auto_853664 - BLOCK
      ?auto_853665 - BLOCK
      ?auto_853666 - BLOCK
      ?auto_853667 - BLOCK
      ?auto_853668 - BLOCK
      ?auto_853669 - BLOCK
      ?auto_853670 - BLOCK
      ?auto_853671 - BLOCK
      ?auto_853672 - BLOCK
      ?auto_853673 - BLOCK
      ?auto_853674 - BLOCK
    )
    :vars
    (
      ?auto_853675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_853674 ?auto_853675 ) ( ON-TABLE ?auto_853657 ) ( ON ?auto_853658 ?auto_853657 ) ( ON ?auto_853659 ?auto_853658 ) ( ON ?auto_853660 ?auto_853659 ) ( not ( = ?auto_853657 ?auto_853658 ) ) ( not ( = ?auto_853657 ?auto_853659 ) ) ( not ( = ?auto_853657 ?auto_853660 ) ) ( not ( = ?auto_853657 ?auto_853661 ) ) ( not ( = ?auto_853657 ?auto_853662 ) ) ( not ( = ?auto_853657 ?auto_853663 ) ) ( not ( = ?auto_853657 ?auto_853664 ) ) ( not ( = ?auto_853657 ?auto_853665 ) ) ( not ( = ?auto_853657 ?auto_853666 ) ) ( not ( = ?auto_853657 ?auto_853667 ) ) ( not ( = ?auto_853657 ?auto_853668 ) ) ( not ( = ?auto_853657 ?auto_853669 ) ) ( not ( = ?auto_853657 ?auto_853670 ) ) ( not ( = ?auto_853657 ?auto_853671 ) ) ( not ( = ?auto_853657 ?auto_853672 ) ) ( not ( = ?auto_853657 ?auto_853673 ) ) ( not ( = ?auto_853657 ?auto_853674 ) ) ( not ( = ?auto_853657 ?auto_853675 ) ) ( not ( = ?auto_853658 ?auto_853659 ) ) ( not ( = ?auto_853658 ?auto_853660 ) ) ( not ( = ?auto_853658 ?auto_853661 ) ) ( not ( = ?auto_853658 ?auto_853662 ) ) ( not ( = ?auto_853658 ?auto_853663 ) ) ( not ( = ?auto_853658 ?auto_853664 ) ) ( not ( = ?auto_853658 ?auto_853665 ) ) ( not ( = ?auto_853658 ?auto_853666 ) ) ( not ( = ?auto_853658 ?auto_853667 ) ) ( not ( = ?auto_853658 ?auto_853668 ) ) ( not ( = ?auto_853658 ?auto_853669 ) ) ( not ( = ?auto_853658 ?auto_853670 ) ) ( not ( = ?auto_853658 ?auto_853671 ) ) ( not ( = ?auto_853658 ?auto_853672 ) ) ( not ( = ?auto_853658 ?auto_853673 ) ) ( not ( = ?auto_853658 ?auto_853674 ) ) ( not ( = ?auto_853658 ?auto_853675 ) ) ( not ( = ?auto_853659 ?auto_853660 ) ) ( not ( = ?auto_853659 ?auto_853661 ) ) ( not ( = ?auto_853659 ?auto_853662 ) ) ( not ( = ?auto_853659 ?auto_853663 ) ) ( not ( = ?auto_853659 ?auto_853664 ) ) ( not ( = ?auto_853659 ?auto_853665 ) ) ( not ( = ?auto_853659 ?auto_853666 ) ) ( not ( = ?auto_853659 ?auto_853667 ) ) ( not ( = ?auto_853659 ?auto_853668 ) ) ( not ( = ?auto_853659 ?auto_853669 ) ) ( not ( = ?auto_853659 ?auto_853670 ) ) ( not ( = ?auto_853659 ?auto_853671 ) ) ( not ( = ?auto_853659 ?auto_853672 ) ) ( not ( = ?auto_853659 ?auto_853673 ) ) ( not ( = ?auto_853659 ?auto_853674 ) ) ( not ( = ?auto_853659 ?auto_853675 ) ) ( not ( = ?auto_853660 ?auto_853661 ) ) ( not ( = ?auto_853660 ?auto_853662 ) ) ( not ( = ?auto_853660 ?auto_853663 ) ) ( not ( = ?auto_853660 ?auto_853664 ) ) ( not ( = ?auto_853660 ?auto_853665 ) ) ( not ( = ?auto_853660 ?auto_853666 ) ) ( not ( = ?auto_853660 ?auto_853667 ) ) ( not ( = ?auto_853660 ?auto_853668 ) ) ( not ( = ?auto_853660 ?auto_853669 ) ) ( not ( = ?auto_853660 ?auto_853670 ) ) ( not ( = ?auto_853660 ?auto_853671 ) ) ( not ( = ?auto_853660 ?auto_853672 ) ) ( not ( = ?auto_853660 ?auto_853673 ) ) ( not ( = ?auto_853660 ?auto_853674 ) ) ( not ( = ?auto_853660 ?auto_853675 ) ) ( not ( = ?auto_853661 ?auto_853662 ) ) ( not ( = ?auto_853661 ?auto_853663 ) ) ( not ( = ?auto_853661 ?auto_853664 ) ) ( not ( = ?auto_853661 ?auto_853665 ) ) ( not ( = ?auto_853661 ?auto_853666 ) ) ( not ( = ?auto_853661 ?auto_853667 ) ) ( not ( = ?auto_853661 ?auto_853668 ) ) ( not ( = ?auto_853661 ?auto_853669 ) ) ( not ( = ?auto_853661 ?auto_853670 ) ) ( not ( = ?auto_853661 ?auto_853671 ) ) ( not ( = ?auto_853661 ?auto_853672 ) ) ( not ( = ?auto_853661 ?auto_853673 ) ) ( not ( = ?auto_853661 ?auto_853674 ) ) ( not ( = ?auto_853661 ?auto_853675 ) ) ( not ( = ?auto_853662 ?auto_853663 ) ) ( not ( = ?auto_853662 ?auto_853664 ) ) ( not ( = ?auto_853662 ?auto_853665 ) ) ( not ( = ?auto_853662 ?auto_853666 ) ) ( not ( = ?auto_853662 ?auto_853667 ) ) ( not ( = ?auto_853662 ?auto_853668 ) ) ( not ( = ?auto_853662 ?auto_853669 ) ) ( not ( = ?auto_853662 ?auto_853670 ) ) ( not ( = ?auto_853662 ?auto_853671 ) ) ( not ( = ?auto_853662 ?auto_853672 ) ) ( not ( = ?auto_853662 ?auto_853673 ) ) ( not ( = ?auto_853662 ?auto_853674 ) ) ( not ( = ?auto_853662 ?auto_853675 ) ) ( not ( = ?auto_853663 ?auto_853664 ) ) ( not ( = ?auto_853663 ?auto_853665 ) ) ( not ( = ?auto_853663 ?auto_853666 ) ) ( not ( = ?auto_853663 ?auto_853667 ) ) ( not ( = ?auto_853663 ?auto_853668 ) ) ( not ( = ?auto_853663 ?auto_853669 ) ) ( not ( = ?auto_853663 ?auto_853670 ) ) ( not ( = ?auto_853663 ?auto_853671 ) ) ( not ( = ?auto_853663 ?auto_853672 ) ) ( not ( = ?auto_853663 ?auto_853673 ) ) ( not ( = ?auto_853663 ?auto_853674 ) ) ( not ( = ?auto_853663 ?auto_853675 ) ) ( not ( = ?auto_853664 ?auto_853665 ) ) ( not ( = ?auto_853664 ?auto_853666 ) ) ( not ( = ?auto_853664 ?auto_853667 ) ) ( not ( = ?auto_853664 ?auto_853668 ) ) ( not ( = ?auto_853664 ?auto_853669 ) ) ( not ( = ?auto_853664 ?auto_853670 ) ) ( not ( = ?auto_853664 ?auto_853671 ) ) ( not ( = ?auto_853664 ?auto_853672 ) ) ( not ( = ?auto_853664 ?auto_853673 ) ) ( not ( = ?auto_853664 ?auto_853674 ) ) ( not ( = ?auto_853664 ?auto_853675 ) ) ( not ( = ?auto_853665 ?auto_853666 ) ) ( not ( = ?auto_853665 ?auto_853667 ) ) ( not ( = ?auto_853665 ?auto_853668 ) ) ( not ( = ?auto_853665 ?auto_853669 ) ) ( not ( = ?auto_853665 ?auto_853670 ) ) ( not ( = ?auto_853665 ?auto_853671 ) ) ( not ( = ?auto_853665 ?auto_853672 ) ) ( not ( = ?auto_853665 ?auto_853673 ) ) ( not ( = ?auto_853665 ?auto_853674 ) ) ( not ( = ?auto_853665 ?auto_853675 ) ) ( not ( = ?auto_853666 ?auto_853667 ) ) ( not ( = ?auto_853666 ?auto_853668 ) ) ( not ( = ?auto_853666 ?auto_853669 ) ) ( not ( = ?auto_853666 ?auto_853670 ) ) ( not ( = ?auto_853666 ?auto_853671 ) ) ( not ( = ?auto_853666 ?auto_853672 ) ) ( not ( = ?auto_853666 ?auto_853673 ) ) ( not ( = ?auto_853666 ?auto_853674 ) ) ( not ( = ?auto_853666 ?auto_853675 ) ) ( not ( = ?auto_853667 ?auto_853668 ) ) ( not ( = ?auto_853667 ?auto_853669 ) ) ( not ( = ?auto_853667 ?auto_853670 ) ) ( not ( = ?auto_853667 ?auto_853671 ) ) ( not ( = ?auto_853667 ?auto_853672 ) ) ( not ( = ?auto_853667 ?auto_853673 ) ) ( not ( = ?auto_853667 ?auto_853674 ) ) ( not ( = ?auto_853667 ?auto_853675 ) ) ( not ( = ?auto_853668 ?auto_853669 ) ) ( not ( = ?auto_853668 ?auto_853670 ) ) ( not ( = ?auto_853668 ?auto_853671 ) ) ( not ( = ?auto_853668 ?auto_853672 ) ) ( not ( = ?auto_853668 ?auto_853673 ) ) ( not ( = ?auto_853668 ?auto_853674 ) ) ( not ( = ?auto_853668 ?auto_853675 ) ) ( not ( = ?auto_853669 ?auto_853670 ) ) ( not ( = ?auto_853669 ?auto_853671 ) ) ( not ( = ?auto_853669 ?auto_853672 ) ) ( not ( = ?auto_853669 ?auto_853673 ) ) ( not ( = ?auto_853669 ?auto_853674 ) ) ( not ( = ?auto_853669 ?auto_853675 ) ) ( not ( = ?auto_853670 ?auto_853671 ) ) ( not ( = ?auto_853670 ?auto_853672 ) ) ( not ( = ?auto_853670 ?auto_853673 ) ) ( not ( = ?auto_853670 ?auto_853674 ) ) ( not ( = ?auto_853670 ?auto_853675 ) ) ( not ( = ?auto_853671 ?auto_853672 ) ) ( not ( = ?auto_853671 ?auto_853673 ) ) ( not ( = ?auto_853671 ?auto_853674 ) ) ( not ( = ?auto_853671 ?auto_853675 ) ) ( not ( = ?auto_853672 ?auto_853673 ) ) ( not ( = ?auto_853672 ?auto_853674 ) ) ( not ( = ?auto_853672 ?auto_853675 ) ) ( not ( = ?auto_853673 ?auto_853674 ) ) ( not ( = ?auto_853673 ?auto_853675 ) ) ( not ( = ?auto_853674 ?auto_853675 ) ) ( ON ?auto_853673 ?auto_853674 ) ( ON ?auto_853672 ?auto_853673 ) ( ON ?auto_853671 ?auto_853672 ) ( ON ?auto_853670 ?auto_853671 ) ( ON ?auto_853669 ?auto_853670 ) ( ON ?auto_853668 ?auto_853669 ) ( ON ?auto_853667 ?auto_853668 ) ( ON ?auto_853666 ?auto_853667 ) ( ON ?auto_853665 ?auto_853666 ) ( ON ?auto_853664 ?auto_853665 ) ( ON ?auto_853663 ?auto_853664 ) ( ON ?auto_853662 ?auto_853663 ) ( CLEAR ?auto_853660 ) ( ON ?auto_853661 ?auto_853662 ) ( CLEAR ?auto_853661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_853657 ?auto_853658 ?auto_853659 ?auto_853660 ?auto_853661 )
      ( MAKE-18PILE ?auto_853657 ?auto_853658 ?auto_853659 ?auto_853660 ?auto_853661 ?auto_853662 ?auto_853663 ?auto_853664 ?auto_853665 ?auto_853666 ?auto_853667 ?auto_853668 ?auto_853669 ?auto_853670 ?auto_853671 ?auto_853672 ?auto_853673 ?auto_853674 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_853694 - BLOCK
      ?auto_853695 - BLOCK
      ?auto_853696 - BLOCK
      ?auto_853697 - BLOCK
      ?auto_853698 - BLOCK
      ?auto_853699 - BLOCK
      ?auto_853700 - BLOCK
      ?auto_853701 - BLOCK
      ?auto_853702 - BLOCK
      ?auto_853703 - BLOCK
      ?auto_853704 - BLOCK
      ?auto_853705 - BLOCK
      ?auto_853706 - BLOCK
      ?auto_853707 - BLOCK
      ?auto_853708 - BLOCK
      ?auto_853709 - BLOCK
      ?auto_853710 - BLOCK
      ?auto_853711 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_853711 ) ( ON-TABLE ?auto_853694 ) ( ON ?auto_853695 ?auto_853694 ) ( ON ?auto_853696 ?auto_853695 ) ( ON ?auto_853697 ?auto_853696 ) ( not ( = ?auto_853694 ?auto_853695 ) ) ( not ( = ?auto_853694 ?auto_853696 ) ) ( not ( = ?auto_853694 ?auto_853697 ) ) ( not ( = ?auto_853694 ?auto_853698 ) ) ( not ( = ?auto_853694 ?auto_853699 ) ) ( not ( = ?auto_853694 ?auto_853700 ) ) ( not ( = ?auto_853694 ?auto_853701 ) ) ( not ( = ?auto_853694 ?auto_853702 ) ) ( not ( = ?auto_853694 ?auto_853703 ) ) ( not ( = ?auto_853694 ?auto_853704 ) ) ( not ( = ?auto_853694 ?auto_853705 ) ) ( not ( = ?auto_853694 ?auto_853706 ) ) ( not ( = ?auto_853694 ?auto_853707 ) ) ( not ( = ?auto_853694 ?auto_853708 ) ) ( not ( = ?auto_853694 ?auto_853709 ) ) ( not ( = ?auto_853694 ?auto_853710 ) ) ( not ( = ?auto_853694 ?auto_853711 ) ) ( not ( = ?auto_853695 ?auto_853696 ) ) ( not ( = ?auto_853695 ?auto_853697 ) ) ( not ( = ?auto_853695 ?auto_853698 ) ) ( not ( = ?auto_853695 ?auto_853699 ) ) ( not ( = ?auto_853695 ?auto_853700 ) ) ( not ( = ?auto_853695 ?auto_853701 ) ) ( not ( = ?auto_853695 ?auto_853702 ) ) ( not ( = ?auto_853695 ?auto_853703 ) ) ( not ( = ?auto_853695 ?auto_853704 ) ) ( not ( = ?auto_853695 ?auto_853705 ) ) ( not ( = ?auto_853695 ?auto_853706 ) ) ( not ( = ?auto_853695 ?auto_853707 ) ) ( not ( = ?auto_853695 ?auto_853708 ) ) ( not ( = ?auto_853695 ?auto_853709 ) ) ( not ( = ?auto_853695 ?auto_853710 ) ) ( not ( = ?auto_853695 ?auto_853711 ) ) ( not ( = ?auto_853696 ?auto_853697 ) ) ( not ( = ?auto_853696 ?auto_853698 ) ) ( not ( = ?auto_853696 ?auto_853699 ) ) ( not ( = ?auto_853696 ?auto_853700 ) ) ( not ( = ?auto_853696 ?auto_853701 ) ) ( not ( = ?auto_853696 ?auto_853702 ) ) ( not ( = ?auto_853696 ?auto_853703 ) ) ( not ( = ?auto_853696 ?auto_853704 ) ) ( not ( = ?auto_853696 ?auto_853705 ) ) ( not ( = ?auto_853696 ?auto_853706 ) ) ( not ( = ?auto_853696 ?auto_853707 ) ) ( not ( = ?auto_853696 ?auto_853708 ) ) ( not ( = ?auto_853696 ?auto_853709 ) ) ( not ( = ?auto_853696 ?auto_853710 ) ) ( not ( = ?auto_853696 ?auto_853711 ) ) ( not ( = ?auto_853697 ?auto_853698 ) ) ( not ( = ?auto_853697 ?auto_853699 ) ) ( not ( = ?auto_853697 ?auto_853700 ) ) ( not ( = ?auto_853697 ?auto_853701 ) ) ( not ( = ?auto_853697 ?auto_853702 ) ) ( not ( = ?auto_853697 ?auto_853703 ) ) ( not ( = ?auto_853697 ?auto_853704 ) ) ( not ( = ?auto_853697 ?auto_853705 ) ) ( not ( = ?auto_853697 ?auto_853706 ) ) ( not ( = ?auto_853697 ?auto_853707 ) ) ( not ( = ?auto_853697 ?auto_853708 ) ) ( not ( = ?auto_853697 ?auto_853709 ) ) ( not ( = ?auto_853697 ?auto_853710 ) ) ( not ( = ?auto_853697 ?auto_853711 ) ) ( not ( = ?auto_853698 ?auto_853699 ) ) ( not ( = ?auto_853698 ?auto_853700 ) ) ( not ( = ?auto_853698 ?auto_853701 ) ) ( not ( = ?auto_853698 ?auto_853702 ) ) ( not ( = ?auto_853698 ?auto_853703 ) ) ( not ( = ?auto_853698 ?auto_853704 ) ) ( not ( = ?auto_853698 ?auto_853705 ) ) ( not ( = ?auto_853698 ?auto_853706 ) ) ( not ( = ?auto_853698 ?auto_853707 ) ) ( not ( = ?auto_853698 ?auto_853708 ) ) ( not ( = ?auto_853698 ?auto_853709 ) ) ( not ( = ?auto_853698 ?auto_853710 ) ) ( not ( = ?auto_853698 ?auto_853711 ) ) ( not ( = ?auto_853699 ?auto_853700 ) ) ( not ( = ?auto_853699 ?auto_853701 ) ) ( not ( = ?auto_853699 ?auto_853702 ) ) ( not ( = ?auto_853699 ?auto_853703 ) ) ( not ( = ?auto_853699 ?auto_853704 ) ) ( not ( = ?auto_853699 ?auto_853705 ) ) ( not ( = ?auto_853699 ?auto_853706 ) ) ( not ( = ?auto_853699 ?auto_853707 ) ) ( not ( = ?auto_853699 ?auto_853708 ) ) ( not ( = ?auto_853699 ?auto_853709 ) ) ( not ( = ?auto_853699 ?auto_853710 ) ) ( not ( = ?auto_853699 ?auto_853711 ) ) ( not ( = ?auto_853700 ?auto_853701 ) ) ( not ( = ?auto_853700 ?auto_853702 ) ) ( not ( = ?auto_853700 ?auto_853703 ) ) ( not ( = ?auto_853700 ?auto_853704 ) ) ( not ( = ?auto_853700 ?auto_853705 ) ) ( not ( = ?auto_853700 ?auto_853706 ) ) ( not ( = ?auto_853700 ?auto_853707 ) ) ( not ( = ?auto_853700 ?auto_853708 ) ) ( not ( = ?auto_853700 ?auto_853709 ) ) ( not ( = ?auto_853700 ?auto_853710 ) ) ( not ( = ?auto_853700 ?auto_853711 ) ) ( not ( = ?auto_853701 ?auto_853702 ) ) ( not ( = ?auto_853701 ?auto_853703 ) ) ( not ( = ?auto_853701 ?auto_853704 ) ) ( not ( = ?auto_853701 ?auto_853705 ) ) ( not ( = ?auto_853701 ?auto_853706 ) ) ( not ( = ?auto_853701 ?auto_853707 ) ) ( not ( = ?auto_853701 ?auto_853708 ) ) ( not ( = ?auto_853701 ?auto_853709 ) ) ( not ( = ?auto_853701 ?auto_853710 ) ) ( not ( = ?auto_853701 ?auto_853711 ) ) ( not ( = ?auto_853702 ?auto_853703 ) ) ( not ( = ?auto_853702 ?auto_853704 ) ) ( not ( = ?auto_853702 ?auto_853705 ) ) ( not ( = ?auto_853702 ?auto_853706 ) ) ( not ( = ?auto_853702 ?auto_853707 ) ) ( not ( = ?auto_853702 ?auto_853708 ) ) ( not ( = ?auto_853702 ?auto_853709 ) ) ( not ( = ?auto_853702 ?auto_853710 ) ) ( not ( = ?auto_853702 ?auto_853711 ) ) ( not ( = ?auto_853703 ?auto_853704 ) ) ( not ( = ?auto_853703 ?auto_853705 ) ) ( not ( = ?auto_853703 ?auto_853706 ) ) ( not ( = ?auto_853703 ?auto_853707 ) ) ( not ( = ?auto_853703 ?auto_853708 ) ) ( not ( = ?auto_853703 ?auto_853709 ) ) ( not ( = ?auto_853703 ?auto_853710 ) ) ( not ( = ?auto_853703 ?auto_853711 ) ) ( not ( = ?auto_853704 ?auto_853705 ) ) ( not ( = ?auto_853704 ?auto_853706 ) ) ( not ( = ?auto_853704 ?auto_853707 ) ) ( not ( = ?auto_853704 ?auto_853708 ) ) ( not ( = ?auto_853704 ?auto_853709 ) ) ( not ( = ?auto_853704 ?auto_853710 ) ) ( not ( = ?auto_853704 ?auto_853711 ) ) ( not ( = ?auto_853705 ?auto_853706 ) ) ( not ( = ?auto_853705 ?auto_853707 ) ) ( not ( = ?auto_853705 ?auto_853708 ) ) ( not ( = ?auto_853705 ?auto_853709 ) ) ( not ( = ?auto_853705 ?auto_853710 ) ) ( not ( = ?auto_853705 ?auto_853711 ) ) ( not ( = ?auto_853706 ?auto_853707 ) ) ( not ( = ?auto_853706 ?auto_853708 ) ) ( not ( = ?auto_853706 ?auto_853709 ) ) ( not ( = ?auto_853706 ?auto_853710 ) ) ( not ( = ?auto_853706 ?auto_853711 ) ) ( not ( = ?auto_853707 ?auto_853708 ) ) ( not ( = ?auto_853707 ?auto_853709 ) ) ( not ( = ?auto_853707 ?auto_853710 ) ) ( not ( = ?auto_853707 ?auto_853711 ) ) ( not ( = ?auto_853708 ?auto_853709 ) ) ( not ( = ?auto_853708 ?auto_853710 ) ) ( not ( = ?auto_853708 ?auto_853711 ) ) ( not ( = ?auto_853709 ?auto_853710 ) ) ( not ( = ?auto_853709 ?auto_853711 ) ) ( not ( = ?auto_853710 ?auto_853711 ) ) ( ON ?auto_853710 ?auto_853711 ) ( ON ?auto_853709 ?auto_853710 ) ( ON ?auto_853708 ?auto_853709 ) ( ON ?auto_853707 ?auto_853708 ) ( ON ?auto_853706 ?auto_853707 ) ( ON ?auto_853705 ?auto_853706 ) ( ON ?auto_853704 ?auto_853705 ) ( ON ?auto_853703 ?auto_853704 ) ( ON ?auto_853702 ?auto_853703 ) ( ON ?auto_853701 ?auto_853702 ) ( ON ?auto_853700 ?auto_853701 ) ( ON ?auto_853699 ?auto_853700 ) ( CLEAR ?auto_853697 ) ( ON ?auto_853698 ?auto_853699 ) ( CLEAR ?auto_853698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_853694 ?auto_853695 ?auto_853696 ?auto_853697 ?auto_853698 )
      ( MAKE-18PILE ?auto_853694 ?auto_853695 ?auto_853696 ?auto_853697 ?auto_853698 ?auto_853699 ?auto_853700 ?auto_853701 ?auto_853702 ?auto_853703 ?auto_853704 ?auto_853705 ?auto_853706 ?auto_853707 ?auto_853708 ?auto_853709 ?auto_853710 ?auto_853711 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_853730 - BLOCK
      ?auto_853731 - BLOCK
      ?auto_853732 - BLOCK
      ?auto_853733 - BLOCK
      ?auto_853734 - BLOCK
      ?auto_853735 - BLOCK
      ?auto_853736 - BLOCK
      ?auto_853737 - BLOCK
      ?auto_853738 - BLOCK
      ?auto_853739 - BLOCK
      ?auto_853740 - BLOCK
      ?auto_853741 - BLOCK
      ?auto_853742 - BLOCK
      ?auto_853743 - BLOCK
      ?auto_853744 - BLOCK
      ?auto_853745 - BLOCK
      ?auto_853746 - BLOCK
      ?auto_853747 - BLOCK
    )
    :vars
    (
      ?auto_853748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_853747 ?auto_853748 ) ( ON-TABLE ?auto_853730 ) ( ON ?auto_853731 ?auto_853730 ) ( ON ?auto_853732 ?auto_853731 ) ( not ( = ?auto_853730 ?auto_853731 ) ) ( not ( = ?auto_853730 ?auto_853732 ) ) ( not ( = ?auto_853730 ?auto_853733 ) ) ( not ( = ?auto_853730 ?auto_853734 ) ) ( not ( = ?auto_853730 ?auto_853735 ) ) ( not ( = ?auto_853730 ?auto_853736 ) ) ( not ( = ?auto_853730 ?auto_853737 ) ) ( not ( = ?auto_853730 ?auto_853738 ) ) ( not ( = ?auto_853730 ?auto_853739 ) ) ( not ( = ?auto_853730 ?auto_853740 ) ) ( not ( = ?auto_853730 ?auto_853741 ) ) ( not ( = ?auto_853730 ?auto_853742 ) ) ( not ( = ?auto_853730 ?auto_853743 ) ) ( not ( = ?auto_853730 ?auto_853744 ) ) ( not ( = ?auto_853730 ?auto_853745 ) ) ( not ( = ?auto_853730 ?auto_853746 ) ) ( not ( = ?auto_853730 ?auto_853747 ) ) ( not ( = ?auto_853730 ?auto_853748 ) ) ( not ( = ?auto_853731 ?auto_853732 ) ) ( not ( = ?auto_853731 ?auto_853733 ) ) ( not ( = ?auto_853731 ?auto_853734 ) ) ( not ( = ?auto_853731 ?auto_853735 ) ) ( not ( = ?auto_853731 ?auto_853736 ) ) ( not ( = ?auto_853731 ?auto_853737 ) ) ( not ( = ?auto_853731 ?auto_853738 ) ) ( not ( = ?auto_853731 ?auto_853739 ) ) ( not ( = ?auto_853731 ?auto_853740 ) ) ( not ( = ?auto_853731 ?auto_853741 ) ) ( not ( = ?auto_853731 ?auto_853742 ) ) ( not ( = ?auto_853731 ?auto_853743 ) ) ( not ( = ?auto_853731 ?auto_853744 ) ) ( not ( = ?auto_853731 ?auto_853745 ) ) ( not ( = ?auto_853731 ?auto_853746 ) ) ( not ( = ?auto_853731 ?auto_853747 ) ) ( not ( = ?auto_853731 ?auto_853748 ) ) ( not ( = ?auto_853732 ?auto_853733 ) ) ( not ( = ?auto_853732 ?auto_853734 ) ) ( not ( = ?auto_853732 ?auto_853735 ) ) ( not ( = ?auto_853732 ?auto_853736 ) ) ( not ( = ?auto_853732 ?auto_853737 ) ) ( not ( = ?auto_853732 ?auto_853738 ) ) ( not ( = ?auto_853732 ?auto_853739 ) ) ( not ( = ?auto_853732 ?auto_853740 ) ) ( not ( = ?auto_853732 ?auto_853741 ) ) ( not ( = ?auto_853732 ?auto_853742 ) ) ( not ( = ?auto_853732 ?auto_853743 ) ) ( not ( = ?auto_853732 ?auto_853744 ) ) ( not ( = ?auto_853732 ?auto_853745 ) ) ( not ( = ?auto_853732 ?auto_853746 ) ) ( not ( = ?auto_853732 ?auto_853747 ) ) ( not ( = ?auto_853732 ?auto_853748 ) ) ( not ( = ?auto_853733 ?auto_853734 ) ) ( not ( = ?auto_853733 ?auto_853735 ) ) ( not ( = ?auto_853733 ?auto_853736 ) ) ( not ( = ?auto_853733 ?auto_853737 ) ) ( not ( = ?auto_853733 ?auto_853738 ) ) ( not ( = ?auto_853733 ?auto_853739 ) ) ( not ( = ?auto_853733 ?auto_853740 ) ) ( not ( = ?auto_853733 ?auto_853741 ) ) ( not ( = ?auto_853733 ?auto_853742 ) ) ( not ( = ?auto_853733 ?auto_853743 ) ) ( not ( = ?auto_853733 ?auto_853744 ) ) ( not ( = ?auto_853733 ?auto_853745 ) ) ( not ( = ?auto_853733 ?auto_853746 ) ) ( not ( = ?auto_853733 ?auto_853747 ) ) ( not ( = ?auto_853733 ?auto_853748 ) ) ( not ( = ?auto_853734 ?auto_853735 ) ) ( not ( = ?auto_853734 ?auto_853736 ) ) ( not ( = ?auto_853734 ?auto_853737 ) ) ( not ( = ?auto_853734 ?auto_853738 ) ) ( not ( = ?auto_853734 ?auto_853739 ) ) ( not ( = ?auto_853734 ?auto_853740 ) ) ( not ( = ?auto_853734 ?auto_853741 ) ) ( not ( = ?auto_853734 ?auto_853742 ) ) ( not ( = ?auto_853734 ?auto_853743 ) ) ( not ( = ?auto_853734 ?auto_853744 ) ) ( not ( = ?auto_853734 ?auto_853745 ) ) ( not ( = ?auto_853734 ?auto_853746 ) ) ( not ( = ?auto_853734 ?auto_853747 ) ) ( not ( = ?auto_853734 ?auto_853748 ) ) ( not ( = ?auto_853735 ?auto_853736 ) ) ( not ( = ?auto_853735 ?auto_853737 ) ) ( not ( = ?auto_853735 ?auto_853738 ) ) ( not ( = ?auto_853735 ?auto_853739 ) ) ( not ( = ?auto_853735 ?auto_853740 ) ) ( not ( = ?auto_853735 ?auto_853741 ) ) ( not ( = ?auto_853735 ?auto_853742 ) ) ( not ( = ?auto_853735 ?auto_853743 ) ) ( not ( = ?auto_853735 ?auto_853744 ) ) ( not ( = ?auto_853735 ?auto_853745 ) ) ( not ( = ?auto_853735 ?auto_853746 ) ) ( not ( = ?auto_853735 ?auto_853747 ) ) ( not ( = ?auto_853735 ?auto_853748 ) ) ( not ( = ?auto_853736 ?auto_853737 ) ) ( not ( = ?auto_853736 ?auto_853738 ) ) ( not ( = ?auto_853736 ?auto_853739 ) ) ( not ( = ?auto_853736 ?auto_853740 ) ) ( not ( = ?auto_853736 ?auto_853741 ) ) ( not ( = ?auto_853736 ?auto_853742 ) ) ( not ( = ?auto_853736 ?auto_853743 ) ) ( not ( = ?auto_853736 ?auto_853744 ) ) ( not ( = ?auto_853736 ?auto_853745 ) ) ( not ( = ?auto_853736 ?auto_853746 ) ) ( not ( = ?auto_853736 ?auto_853747 ) ) ( not ( = ?auto_853736 ?auto_853748 ) ) ( not ( = ?auto_853737 ?auto_853738 ) ) ( not ( = ?auto_853737 ?auto_853739 ) ) ( not ( = ?auto_853737 ?auto_853740 ) ) ( not ( = ?auto_853737 ?auto_853741 ) ) ( not ( = ?auto_853737 ?auto_853742 ) ) ( not ( = ?auto_853737 ?auto_853743 ) ) ( not ( = ?auto_853737 ?auto_853744 ) ) ( not ( = ?auto_853737 ?auto_853745 ) ) ( not ( = ?auto_853737 ?auto_853746 ) ) ( not ( = ?auto_853737 ?auto_853747 ) ) ( not ( = ?auto_853737 ?auto_853748 ) ) ( not ( = ?auto_853738 ?auto_853739 ) ) ( not ( = ?auto_853738 ?auto_853740 ) ) ( not ( = ?auto_853738 ?auto_853741 ) ) ( not ( = ?auto_853738 ?auto_853742 ) ) ( not ( = ?auto_853738 ?auto_853743 ) ) ( not ( = ?auto_853738 ?auto_853744 ) ) ( not ( = ?auto_853738 ?auto_853745 ) ) ( not ( = ?auto_853738 ?auto_853746 ) ) ( not ( = ?auto_853738 ?auto_853747 ) ) ( not ( = ?auto_853738 ?auto_853748 ) ) ( not ( = ?auto_853739 ?auto_853740 ) ) ( not ( = ?auto_853739 ?auto_853741 ) ) ( not ( = ?auto_853739 ?auto_853742 ) ) ( not ( = ?auto_853739 ?auto_853743 ) ) ( not ( = ?auto_853739 ?auto_853744 ) ) ( not ( = ?auto_853739 ?auto_853745 ) ) ( not ( = ?auto_853739 ?auto_853746 ) ) ( not ( = ?auto_853739 ?auto_853747 ) ) ( not ( = ?auto_853739 ?auto_853748 ) ) ( not ( = ?auto_853740 ?auto_853741 ) ) ( not ( = ?auto_853740 ?auto_853742 ) ) ( not ( = ?auto_853740 ?auto_853743 ) ) ( not ( = ?auto_853740 ?auto_853744 ) ) ( not ( = ?auto_853740 ?auto_853745 ) ) ( not ( = ?auto_853740 ?auto_853746 ) ) ( not ( = ?auto_853740 ?auto_853747 ) ) ( not ( = ?auto_853740 ?auto_853748 ) ) ( not ( = ?auto_853741 ?auto_853742 ) ) ( not ( = ?auto_853741 ?auto_853743 ) ) ( not ( = ?auto_853741 ?auto_853744 ) ) ( not ( = ?auto_853741 ?auto_853745 ) ) ( not ( = ?auto_853741 ?auto_853746 ) ) ( not ( = ?auto_853741 ?auto_853747 ) ) ( not ( = ?auto_853741 ?auto_853748 ) ) ( not ( = ?auto_853742 ?auto_853743 ) ) ( not ( = ?auto_853742 ?auto_853744 ) ) ( not ( = ?auto_853742 ?auto_853745 ) ) ( not ( = ?auto_853742 ?auto_853746 ) ) ( not ( = ?auto_853742 ?auto_853747 ) ) ( not ( = ?auto_853742 ?auto_853748 ) ) ( not ( = ?auto_853743 ?auto_853744 ) ) ( not ( = ?auto_853743 ?auto_853745 ) ) ( not ( = ?auto_853743 ?auto_853746 ) ) ( not ( = ?auto_853743 ?auto_853747 ) ) ( not ( = ?auto_853743 ?auto_853748 ) ) ( not ( = ?auto_853744 ?auto_853745 ) ) ( not ( = ?auto_853744 ?auto_853746 ) ) ( not ( = ?auto_853744 ?auto_853747 ) ) ( not ( = ?auto_853744 ?auto_853748 ) ) ( not ( = ?auto_853745 ?auto_853746 ) ) ( not ( = ?auto_853745 ?auto_853747 ) ) ( not ( = ?auto_853745 ?auto_853748 ) ) ( not ( = ?auto_853746 ?auto_853747 ) ) ( not ( = ?auto_853746 ?auto_853748 ) ) ( not ( = ?auto_853747 ?auto_853748 ) ) ( ON ?auto_853746 ?auto_853747 ) ( ON ?auto_853745 ?auto_853746 ) ( ON ?auto_853744 ?auto_853745 ) ( ON ?auto_853743 ?auto_853744 ) ( ON ?auto_853742 ?auto_853743 ) ( ON ?auto_853741 ?auto_853742 ) ( ON ?auto_853740 ?auto_853741 ) ( ON ?auto_853739 ?auto_853740 ) ( ON ?auto_853738 ?auto_853739 ) ( ON ?auto_853737 ?auto_853738 ) ( ON ?auto_853736 ?auto_853737 ) ( ON ?auto_853735 ?auto_853736 ) ( ON ?auto_853734 ?auto_853735 ) ( CLEAR ?auto_853732 ) ( ON ?auto_853733 ?auto_853734 ) ( CLEAR ?auto_853733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_853730 ?auto_853731 ?auto_853732 ?auto_853733 )
      ( MAKE-18PILE ?auto_853730 ?auto_853731 ?auto_853732 ?auto_853733 ?auto_853734 ?auto_853735 ?auto_853736 ?auto_853737 ?auto_853738 ?auto_853739 ?auto_853740 ?auto_853741 ?auto_853742 ?auto_853743 ?auto_853744 ?auto_853745 ?auto_853746 ?auto_853747 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_853767 - BLOCK
      ?auto_853768 - BLOCK
      ?auto_853769 - BLOCK
      ?auto_853770 - BLOCK
      ?auto_853771 - BLOCK
      ?auto_853772 - BLOCK
      ?auto_853773 - BLOCK
      ?auto_853774 - BLOCK
      ?auto_853775 - BLOCK
      ?auto_853776 - BLOCK
      ?auto_853777 - BLOCK
      ?auto_853778 - BLOCK
      ?auto_853779 - BLOCK
      ?auto_853780 - BLOCK
      ?auto_853781 - BLOCK
      ?auto_853782 - BLOCK
      ?auto_853783 - BLOCK
      ?auto_853784 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_853784 ) ( ON-TABLE ?auto_853767 ) ( ON ?auto_853768 ?auto_853767 ) ( ON ?auto_853769 ?auto_853768 ) ( not ( = ?auto_853767 ?auto_853768 ) ) ( not ( = ?auto_853767 ?auto_853769 ) ) ( not ( = ?auto_853767 ?auto_853770 ) ) ( not ( = ?auto_853767 ?auto_853771 ) ) ( not ( = ?auto_853767 ?auto_853772 ) ) ( not ( = ?auto_853767 ?auto_853773 ) ) ( not ( = ?auto_853767 ?auto_853774 ) ) ( not ( = ?auto_853767 ?auto_853775 ) ) ( not ( = ?auto_853767 ?auto_853776 ) ) ( not ( = ?auto_853767 ?auto_853777 ) ) ( not ( = ?auto_853767 ?auto_853778 ) ) ( not ( = ?auto_853767 ?auto_853779 ) ) ( not ( = ?auto_853767 ?auto_853780 ) ) ( not ( = ?auto_853767 ?auto_853781 ) ) ( not ( = ?auto_853767 ?auto_853782 ) ) ( not ( = ?auto_853767 ?auto_853783 ) ) ( not ( = ?auto_853767 ?auto_853784 ) ) ( not ( = ?auto_853768 ?auto_853769 ) ) ( not ( = ?auto_853768 ?auto_853770 ) ) ( not ( = ?auto_853768 ?auto_853771 ) ) ( not ( = ?auto_853768 ?auto_853772 ) ) ( not ( = ?auto_853768 ?auto_853773 ) ) ( not ( = ?auto_853768 ?auto_853774 ) ) ( not ( = ?auto_853768 ?auto_853775 ) ) ( not ( = ?auto_853768 ?auto_853776 ) ) ( not ( = ?auto_853768 ?auto_853777 ) ) ( not ( = ?auto_853768 ?auto_853778 ) ) ( not ( = ?auto_853768 ?auto_853779 ) ) ( not ( = ?auto_853768 ?auto_853780 ) ) ( not ( = ?auto_853768 ?auto_853781 ) ) ( not ( = ?auto_853768 ?auto_853782 ) ) ( not ( = ?auto_853768 ?auto_853783 ) ) ( not ( = ?auto_853768 ?auto_853784 ) ) ( not ( = ?auto_853769 ?auto_853770 ) ) ( not ( = ?auto_853769 ?auto_853771 ) ) ( not ( = ?auto_853769 ?auto_853772 ) ) ( not ( = ?auto_853769 ?auto_853773 ) ) ( not ( = ?auto_853769 ?auto_853774 ) ) ( not ( = ?auto_853769 ?auto_853775 ) ) ( not ( = ?auto_853769 ?auto_853776 ) ) ( not ( = ?auto_853769 ?auto_853777 ) ) ( not ( = ?auto_853769 ?auto_853778 ) ) ( not ( = ?auto_853769 ?auto_853779 ) ) ( not ( = ?auto_853769 ?auto_853780 ) ) ( not ( = ?auto_853769 ?auto_853781 ) ) ( not ( = ?auto_853769 ?auto_853782 ) ) ( not ( = ?auto_853769 ?auto_853783 ) ) ( not ( = ?auto_853769 ?auto_853784 ) ) ( not ( = ?auto_853770 ?auto_853771 ) ) ( not ( = ?auto_853770 ?auto_853772 ) ) ( not ( = ?auto_853770 ?auto_853773 ) ) ( not ( = ?auto_853770 ?auto_853774 ) ) ( not ( = ?auto_853770 ?auto_853775 ) ) ( not ( = ?auto_853770 ?auto_853776 ) ) ( not ( = ?auto_853770 ?auto_853777 ) ) ( not ( = ?auto_853770 ?auto_853778 ) ) ( not ( = ?auto_853770 ?auto_853779 ) ) ( not ( = ?auto_853770 ?auto_853780 ) ) ( not ( = ?auto_853770 ?auto_853781 ) ) ( not ( = ?auto_853770 ?auto_853782 ) ) ( not ( = ?auto_853770 ?auto_853783 ) ) ( not ( = ?auto_853770 ?auto_853784 ) ) ( not ( = ?auto_853771 ?auto_853772 ) ) ( not ( = ?auto_853771 ?auto_853773 ) ) ( not ( = ?auto_853771 ?auto_853774 ) ) ( not ( = ?auto_853771 ?auto_853775 ) ) ( not ( = ?auto_853771 ?auto_853776 ) ) ( not ( = ?auto_853771 ?auto_853777 ) ) ( not ( = ?auto_853771 ?auto_853778 ) ) ( not ( = ?auto_853771 ?auto_853779 ) ) ( not ( = ?auto_853771 ?auto_853780 ) ) ( not ( = ?auto_853771 ?auto_853781 ) ) ( not ( = ?auto_853771 ?auto_853782 ) ) ( not ( = ?auto_853771 ?auto_853783 ) ) ( not ( = ?auto_853771 ?auto_853784 ) ) ( not ( = ?auto_853772 ?auto_853773 ) ) ( not ( = ?auto_853772 ?auto_853774 ) ) ( not ( = ?auto_853772 ?auto_853775 ) ) ( not ( = ?auto_853772 ?auto_853776 ) ) ( not ( = ?auto_853772 ?auto_853777 ) ) ( not ( = ?auto_853772 ?auto_853778 ) ) ( not ( = ?auto_853772 ?auto_853779 ) ) ( not ( = ?auto_853772 ?auto_853780 ) ) ( not ( = ?auto_853772 ?auto_853781 ) ) ( not ( = ?auto_853772 ?auto_853782 ) ) ( not ( = ?auto_853772 ?auto_853783 ) ) ( not ( = ?auto_853772 ?auto_853784 ) ) ( not ( = ?auto_853773 ?auto_853774 ) ) ( not ( = ?auto_853773 ?auto_853775 ) ) ( not ( = ?auto_853773 ?auto_853776 ) ) ( not ( = ?auto_853773 ?auto_853777 ) ) ( not ( = ?auto_853773 ?auto_853778 ) ) ( not ( = ?auto_853773 ?auto_853779 ) ) ( not ( = ?auto_853773 ?auto_853780 ) ) ( not ( = ?auto_853773 ?auto_853781 ) ) ( not ( = ?auto_853773 ?auto_853782 ) ) ( not ( = ?auto_853773 ?auto_853783 ) ) ( not ( = ?auto_853773 ?auto_853784 ) ) ( not ( = ?auto_853774 ?auto_853775 ) ) ( not ( = ?auto_853774 ?auto_853776 ) ) ( not ( = ?auto_853774 ?auto_853777 ) ) ( not ( = ?auto_853774 ?auto_853778 ) ) ( not ( = ?auto_853774 ?auto_853779 ) ) ( not ( = ?auto_853774 ?auto_853780 ) ) ( not ( = ?auto_853774 ?auto_853781 ) ) ( not ( = ?auto_853774 ?auto_853782 ) ) ( not ( = ?auto_853774 ?auto_853783 ) ) ( not ( = ?auto_853774 ?auto_853784 ) ) ( not ( = ?auto_853775 ?auto_853776 ) ) ( not ( = ?auto_853775 ?auto_853777 ) ) ( not ( = ?auto_853775 ?auto_853778 ) ) ( not ( = ?auto_853775 ?auto_853779 ) ) ( not ( = ?auto_853775 ?auto_853780 ) ) ( not ( = ?auto_853775 ?auto_853781 ) ) ( not ( = ?auto_853775 ?auto_853782 ) ) ( not ( = ?auto_853775 ?auto_853783 ) ) ( not ( = ?auto_853775 ?auto_853784 ) ) ( not ( = ?auto_853776 ?auto_853777 ) ) ( not ( = ?auto_853776 ?auto_853778 ) ) ( not ( = ?auto_853776 ?auto_853779 ) ) ( not ( = ?auto_853776 ?auto_853780 ) ) ( not ( = ?auto_853776 ?auto_853781 ) ) ( not ( = ?auto_853776 ?auto_853782 ) ) ( not ( = ?auto_853776 ?auto_853783 ) ) ( not ( = ?auto_853776 ?auto_853784 ) ) ( not ( = ?auto_853777 ?auto_853778 ) ) ( not ( = ?auto_853777 ?auto_853779 ) ) ( not ( = ?auto_853777 ?auto_853780 ) ) ( not ( = ?auto_853777 ?auto_853781 ) ) ( not ( = ?auto_853777 ?auto_853782 ) ) ( not ( = ?auto_853777 ?auto_853783 ) ) ( not ( = ?auto_853777 ?auto_853784 ) ) ( not ( = ?auto_853778 ?auto_853779 ) ) ( not ( = ?auto_853778 ?auto_853780 ) ) ( not ( = ?auto_853778 ?auto_853781 ) ) ( not ( = ?auto_853778 ?auto_853782 ) ) ( not ( = ?auto_853778 ?auto_853783 ) ) ( not ( = ?auto_853778 ?auto_853784 ) ) ( not ( = ?auto_853779 ?auto_853780 ) ) ( not ( = ?auto_853779 ?auto_853781 ) ) ( not ( = ?auto_853779 ?auto_853782 ) ) ( not ( = ?auto_853779 ?auto_853783 ) ) ( not ( = ?auto_853779 ?auto_853784 ) ) ( not ( = ?auto_853780 ?auto_853781 ) ) ( not ( = ?auto_853780 ?auto_853782 ) ) ( not ( = ?auto_853780 ?auto_853783 ) ) ( not ( = ?auto_853780 ?auto_853784 ) ) ( not ( = ?auto_853781 ?auto_853782 ) ) ( not ( = ?auto_853781 ?auto_853783 ) ) ( not ( = ?auto_853781 ?auto_853784 ) ) ( not ( = ?auto_853782 ?auto_853783 ) ) ( not ( = ?auto_853782 ?auto_853784 ) ) ( not ( = ?auto_853783 ?auto_853784 ) ) ( ON ?auto_853783 ?auto_853784 ) ( ON ?auto_853782 ?auto_853783 ) ( ON ?auto_853781 ?auto_853782 ) ( ON ?auto_853780 ?auto_853781 ) ( ON ?auto_853779 ?auto_853780 ) ( ON ?auto_853778 ?auto_853779 ) ( ON ?auto_853777 ?auto_853778 ) ( ON ?auto_853776 ?auto_853777 ) ( ON ?auto_853775 ?auto_853776 ) ( ON ?auto_853774 ?auto_853775 ) ( ON ?auto_853773 ?auto_853774 ) ( ON ?auto_853772 ?auto_853773 ) ( ON ?auto_853771 ?auto_853772 ) ( CLEAR ?auto_853769 ) ( ON ?auto_853770 ?auto_853771 ) ( CLEAR ?auto_853770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_853767 ?auto_853768 ?auto_853769 ?auto_853770 )
      ( MAKE-18PILE ?auto_853767 ?auto_853768 ?auto_853769 ?auto_853770 ?auto_853771 ?auto_853772 ?auto_853773 ?auto_853774 ?auto_853775 ?auto_853776 ?auto_853777 ?auto_853778 ?auto_853779 ?auto_853780 ?auto_853781 ?auto_853782 ?auto_853783 ?auto_853784 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_853803 - BLOCK
      ?auto_853804 - BLOCK
      ?auto_853805 - BLOCK
      ?auto_853806 - BLOCK
      ?auto_853807 - BLOCK
      ?auto_853808 - BLOCK
      ?auto_853809 - BLOCK
      ?auto_853810 - BLOCK
      ?auto_853811 - BLOCK
      ?auto_853812 - BLOCK
      ?auto_853813 - BLOCK
      ?auto_853814 - BLOCK
      ?auto_853815 - BLOCK
      ?auto_853816 - BLOCK
      ?auto_853817 - BLOCK
      ?auto_853818 - BLOCK
      ?auto_853819 - BLOCK
      ?auto_853820 - BLOCK
    )
    :vars
    (
      ?auto_853821 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_853820 ?auto_853821 ) ( ON-TABLE ?auto_853803 ) ( ON ?auto_853804 ?auto_853803 ) ( not ( = ?auto_853803 ?auto_853804 ) ) ( not ( = ?auto_853803 ?auto_853805 ) ) ( not ( = ?auto_853803 ?auto_853806 ) ) ( not ( = ?auto_853803 ?auto_853807 ) ) ( not ( = ?auto_853803 ?auto_853808 ) ) ( not ( = ?auto_853803 ?auto_853809 ) ) ( not ( = ?auto_853803 ?auto_853810 ) ) ( not ( = ?auto_853803 ?auto_853811 ) ) ( not ( = ?auto_853803 ?auto_853812 ) ) ( not ( = ?auto_853803 ?auto_853813 ) ) ( not ( = ?auto_853803 ?auto_853814 ) ) ( not ( = ?auto_853803 ?auto_853815 ) ) ( not ( = ?auto_853803 ?auto_853816 ) ) ( not ( = ?auto_853803 ?auto_853817 ) ) ( not ( = ?auto_853803 ?auto_853818 ) ) ( not ( = ?auto_853803 ?auto_853819 ) ) ( not ( = ?auto_853803 ?auto_853820 ) ) ( not ( = ?auto_853803 ?auto_853821 ) ) ( not ( = ?auto_853804 ?auto_853805 ) ) ( not ( = ?auto_853804 ?auto_853806 ) ) ( not ( = ?auto_853804 ?auto_853807 ) ) ( not ( = ?auto_853804 ?auto_853808 ) ) ( not ( = ?auto_853804 ?auto_853809 ) ) ( not ( = ?auto_853804 ?auto_853810 ) ) ( not ( = ?auto_853804 ?auto_853811 ) ) ( not ( = ?auto_853804 ?auto_853812 ) ) ( not ( = ?auto_853804 ?auto_853813 ) ) ( not ( = ?auto_853804 ?auto_853814 ) ) ( not ( = ?auto_853804 ?auto_853815 ) ) ( not ( = ?auto_853804 ?auto_853816 ) ) ( not ( = ?auto_853804 ?auto_853817 ) ) ( not ( = ?auto_853804 ?auto_853818 ) ) ( not ( = ?auto_853804 ?auto_853819 ) ) ( not ( = ?auto_853804 ?auto_853820 ) ) ( not ( = ?auto_853804 ?auto_853821 ) ) ( not ( = ?auto_853805 ?auto_853806 ) ) ( not ( = ?auto_853805 ?auto_853807 ) ) ( not ( = ?auto_853805 ?auto_853808 ) ) ( not ( = ?auto_853805 ?auto_853809 ) ) ( not ( = ?auto_853805 ?auto_853810 ) ) ( not ( = ?auto_853805 ?auto_853811 ) ) ( not ( = ?auto_853805 ?auto_853812 ) ) ( not ( = ?auto_853805 ?auto_853813 ) ) ( not ( = ?auto_853805 ?auto_853814 ) ) ( not ( = ?auto_853805 ?auto_853815 ) ) ( not ( = ?auto_853805 ?auto_853816 ) ) ( not ( = ?auto_853805 ?auto_853817 ) ) ( not ( = ?auto_853805 ?auto_853818 ) ) ( not ( = ?auto_853805 ?auto_853819 ) ) ( not ( = ?auto_853805 ?auto_853820 ) ) ( not ( = ?auto_853805 ?auto_853821 ) ) ( not ( = ?auto_853806 ?auto_853807 ) ) ( not ( = ?auto_853806 ?auto_853808 ) ) ( not ( = ?auto_853806 ?auto_853809 ) ) ( not ( = ?auto_853806 ?auto_853810 ) ) ( not ( = ?auto_853806 ?auto_853811 ) ) ( not ( = ?auto_853806 ?auto_853812 ) ) ( not ( = ?auto_853806 ?auto_853813 ) ) ( not ( = ?auto_853806 ?auto_853814 ) ) ( not ( = ?auto_853806 ?auto_853815 ) ) ( not ( = ?auto_853806 ?auto_853816 ) ) ( not ( = ?auto_853806 ?auto_853817 ) ) ( not ( = ?auto_853806 ?auto_853818 ) ) ( not ( = ?auto_853806 ?auto_853819 ) ) ( not ( = ?auto_853806 ?auto_853820 ) ) ( not ( = ?auto_853806 ?auto_853821 ) ) ( not ( = ?auto_853807 ?auto_853808 ) ) ( not ( = ?auto_853807 ?auto_853809 ) ) ( not ( = ?auto_853807 ?auto_853810 ) ) ( not ( = ?auto_853807 ?auto_853811 ) ) ( not ( = ?auto_853807 ?auto_853812 ) ) ( not ( = ?auto_853807 ?auto_853813 ) ) ( not ( = ?auto_853807 ?auto_853814 ) ) ( not ( = ?auto_853807 ?auto_853815 ) ) ( not ( = ?auto_853807 ?auto_853816 ) ) ( not ( = ?auto_853807 ?auto_853817 ) ) ( not ( = ?auto_853807 ?auto_853818 ) ) ( not ( = ?auto_853807 ?auto_853819 ) ) ( not ( = ?auto_853807 ?auto_853820 ) ) ( not ( = ?auto_853807 ?auto_853821 ) ) ( not ( = ?auto_853808 ?auto_853809 ) ) ( not ( = ?auto_853808 ?auto_853810 ) ) ( not ( = ?auto_853808 ?auto_853811 ) ) ( not ( = ?auto_853808 ?auto_853812 ) ) ( not ( = ?auto_853808 ?auto_853813 ) ) ( not ( = ?auto_853808 ?auto_853814 ) ) ( not ( = ?auto_853808 ?auto_853815 ) ) ( not ( = ?auto_853808 ?auto_853816 ) ) ( not ( = ?auto_853808 ?auto_853817 ) ) ( not ( = ?auto_853808 ?auto_853818 ) ) ( not ( = ?auto_853808 ?auto_853819 ) ) ( not ( = ?auto_853808 ?auto_853820 ) ) ( not ( = ?auto_853808 ?auto_853821 ) ) ( not ( = ?auto_853809 ?auto_853810 ) ) ( not ( = ?auto_853809 ?auto_853811 ) ) ( not ( = ?auto_853809 ?auto_853812 ) ) ( not ( = ?auto_853809 ?auto_853813 ) ) ( not ( = ?auto_853809 ?auto_853814 ) ) ( not ( = ?auto_853809 ?auto_853815 ) ) ( not ( = ?auto_853809 ?auto_853816 ) ) ( not ( = ?auto_853809 ?auto_853817 ) ) ( not ( = ?auto_853809 ?auto_853818 ) ) ( not ( = ?auto_853809 ?auto_853819 ) ) ( not ( = ?auto_853809 ?auto_853820 ) ) ( not ( = ?auto_853809 ?auto_853821 ) ) ( not ( = ?auto_853810 ?auto_853811 ) ) ( not ( = ?auto_853810 ?auto_853812 ) ) ( not ( = ?auto_853810 ?auto_853813 ) ) ( not ( = ?auto_853810 ?auto_853814 ) ) ( not ( = ?auto_853810 ?auto_853815 ) ) ( not ( = ?auto_853810 ?auto_853816 ) ) ( not ( = ?auto_853810 ?auto_853817 ) ) ( not ( = ?auto_853810 ?auto_853818 ) ) ( not ( = ?auto_853810 ?auto_853819 ) ) ( not ( = ?auto_853810 ?auto_853820 ) ) ( not ( = ?auto_853810 ?auto_853821 ) ) ( not ( = ?auto_853811 ?auto_853812 ) ) ( not ( = ?auto_853811 ?auto_853813 ) ) ( not ( = ?auto_853811 ?auto_853814 ) ) ( not ( = ?auto_853811 ?auto_853815 ) ) ( not ( = ?auto_853811 ?auto_853816 ) ) ( not ( = ?auto_853811 ?auto_853817 ) ) ( not ( = ?auto_853811 ?auto_853818 ) ) ( not ( = ?auto_853811 ?auto_853819 ) ) ( not ( = ?auto_853811 ?auto_853820 ) ) ( not ( = ?auto_853811 ?auto_853821 ) ) ( not ( = ?auto_853812 ?auto_853813 ) ) ( not ( = ?auto_853812 ?auto_853814 ) ) ( not ( = ?auto_853812 ?auto_853815 ) ) ( not ( = ?auto_853812 ?auto_853816 ) ) ( not ( = ?auto_853812 ?auto_853817 ) ) ( not ( = ?auto_853812 ?auto_853818 ) ) ( not ( = ?auto_853812 ?auto_853819 ) ) ( not ( = ?auto_853812 ?auto_853820 ) ) ( not ( = ?auto_853812 ?auto_853821 ) ) ( not ( = ?auto_853813 ?auto_853814 ) ) ( not ( = ?auto_853813 ?auto_853815 ) ) ( not ( = ?auto_853813 ?auto_853816 ) ) ( not ( = ?auto_853813 ?auto_853817 ) ) ( not ( = ?auto_853813 ?auto_853818 ) ) ( not ( = ?auto_853813 ?auto_853819 ) ) ( not ( = ?auto_853813 ?auto_853820 ) ) ( not ( = ?auto_853813 ?auto_853821 ) ) ( not ( = ?auto_853814 ?auto_853815 ) ) ( not ( = ?auto_853814 ?auto_853816 ) ) ( not ( = ?auto_853814 ?auto_853817 ) ) ( not ( = ?auto_853814 ?auto_853818 ) ) ( not ( = ?auto_853814 ?auto_853819 ) ) ( not ( = ?auto_853814 ?auto_853820 ) ) ( not ( = ?auto_853814 ?auto_853821 ) ) ( not ( = ?auto_853815 ?auto_853816 ) ) ( not ( = ?auto_853815 ?auto_853817 ) ) ( not ( = ?auto_853815 ?auto_853818 ) ) ( not ( = ?auto_853815 ?auto_853819 ) ) ( not ( = ?auto_853815 ?auto_853820 ) ) ( not ( = ?auto_853815 ?auto_853821 ) ) ( not ( = ?auto_853816 ?auto_853817 ) ) ( not ( = ?auto_853816 ?auto_853818 ) ) ( not ( = ?auto_853816 ?auto_853819 ) ) ( not ( = ?auto_853816 ?auto_853820 ) ) ( not ( = ?auto_853816 ?auto_853821 ) ) ( not ( = ?auto_853817 ?auto_853818 ) ) ( not ( = ?auto_853817 ?auto_853819 ) ) ( not ( = ?auto_853817 ?auto_853820 ) ) ( not ( = ?auto_853817 ?auto_853821 ) ) ( not ( = ?auto_853818 ?auto_853819 ) ) ( not ( = ?auto_853818 ?auto_853820 ) ) ( not ( = ?auto_853818 ?auto_853821 ) ) ( not ( = ?auto_853819 ?auto_853820 ) ) ( not ( = ?auto_853819 ?auto_853821 ) ) ( not ( = ?auto_853820 ?auto_853821 ) ) ( ON ?auto_853819 ?auto_853820 ) ( ON ?auto_853818 ?auto_853819 ) ( ON ?auto_853817 ?auto_853818 ) ( ON ?auto_853816 ?auto_853817 ) ( ON ?auto_853815 ?auto_853816 ) ( ON ?auto_853814 ?auto_853815 ) ( ON ?auto_853813 ?auto_853814 ) ( ON ?auto_853812 ?auto_853813 ) ( ON ?auto_853811 ?auto_853812 ) ( ON ?auto_853810 ?auto_853811 ) ( ON ?auto_853809 ?auto_853810 ) ( ON ?auto_853808 ?auto_853809 ) ( ON ?auto_853807 ?auto_853808 ) ( ON ?auto_853806 ?auto_853807 ) ( CLEAR ?auto_853804 ) ( ON ?auto_853805 ?auto_853806 ) ( CLEAR ?auto_853805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_853803 ?auto_853804 ?auto_853805 )
      ( MAKE-18PILE ?auto_853803 ?auto_853804 ?auto_853805 ?auto_853806 ?auto_853807 ?auto_853808 ?auto_853809 ?auto_853810 ?auto_853811 ?auto_853812 ?auto_853813 ?auto_853814 ?auto_853815 ?auto_853816 ?auto_853817 ?auto_853818 ?auto_853819 ?auto_853820 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_853840 - BLOCK
      ?auto_853841 - BLOCK
      ?auto_853842 - BLOCK
      ?auto_853843 - BLOCK
      ?auto_853844 - BLOCK
      ?auto_853845 - BLOCK
      ?auto_853846 - BLOCK
      ?auto_853847 - BLOCK
      ?auto_853848 - BLOCK
      ?auto_853849 - BLOCK
      ?auto_853850 - BLOCK
      ?auto_853851 - BLOCK
      ?auto_853852 - BLOCK
      ?auto_853853 - BLOCK
      ?auto_853854 - BLOCK
      ?auto_853855 - BLOCK
      ?auto_853856 - BLOCK
      ?auto_853857 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_853857 ) ( ON-TABLE ?auto_853840 ) ( ON ?auto_853841 ?auto_853840 ) ( not ( = ?auto_853840 ?auto_853841 ) ) ( not ( = ?auto_853840 ?auto_853842 ) ) ( not ( = ?auto_853840 ?auto_853843 ) ) ( not ( = ?auto_853840 ?auto_853844 ) ) ( not ( = ?auto_853840 ?auto_853845 ) ) ( not ( = ?auto_853840 ?auto_853846 ) ) ( not ( = ?auto_853840 ?auto_853847 ) ) ( not ( = ?auto_853840 ?auto_853848 ) ) ( not ( = ?auto_853840 ?auto_853849 ) ) ( not ( = ?auto_853840 ?auto_853850 ) ) ( not ( = ?auto_853840 ?auto_853851 ) ) ( not ( = ?auto_853840 ?auto_853852 ) ) ( not ( = ?auto_853840 ?auto_853853 ) ) ( not ( = ?auto_853840 ?auto_853854 ) ) ( not ( = ?auto_853840 ?auto_853855 ) ) ( not ( = ?auto_853840 ?auto_853856 ) ) ( not ( = ?auto_853840 ?auto_853857 ) ) ( not ( = ?auto_853841 ?auto_853842 ) ) ( not ( = ?auto_853841 ?auto_853843 ) ) ( not ( = ?auto_853841 ?auto_853844 ) ) ( not ( = ?auto_853841 ?auto_853845 ) ) ( not ( = ?auto_853841 ?auto_853846 ) ) ( not ( = ?auto_853841 ?auto_853847 ) ) ( not ( = ?auto_853841 ?auto_853848 ) ) ( not ( = ?auto_853841 ?auto_853849 ) ) ( not ( = ?auto_853841 ?auto_853850 ) ) ( not ( = ?auto_853841 ?auto_853851 ) ) ( not ( = ?auto_853841 ?auto_853852 ) ) ( not ( = ?auto_853841 ?auto_853853 ) ) ( not ( = ?auto_853841 ?auto_853854 ) ) ( not ( = ?auto_853841 ?auto_853855 ) ) ( not ( = ?auto_853841 ?auto_853856 ) ) ( not ( = ?auto_853841 ?auto_853857 ) ) ( not ( = ?auto_853842 ?auto_853843 ) ) ( not ( = ?auto_853842 ?auto_853844 ) ) ( not ( = ?auto_853842 ?auto_853845 ) ) ( not ( = ?auto_853842 ?auto_853846 ) ) ( not ( = ?auto_853842 ?auto_853847 ) ) ( not ( = ?auto_853842 ?auto_853848 ) ) ( not ( = ?auto_853842 ?auto_853849 ) ) ( not ( = ?auto_853842 ?auto_853850 ) ) ( not ( = ?auto_853842 ?auto_853851 ) ) ( not ( = ?auto_853842 ?auto_853852 ) ) ( not ( = ?auto_853842 ?auto_853853 ) ) ( not ( = ?auto_853842 ?auto_853854 ) ) ( not ( = ?auto_853842 ?auto_853855 ) ) ( not ( = ?auto_853842 ?auto_853856 ) ) ( not ( = ?auto_853842 ?auto_853857 ) ) ( not ( = ?auto_853843 ?auto_853844 ) ) ( not ( = ?auto_853843 ?auto_853845 ) ) ( not ( = ?auto_853843 ?auto_853846 ) ) ( not ( = ?auto_853843 ?auto_853847 ) ) ( not ( = ?auto_853843 ?auto_853848 ) ) ( not ( = ?auto_853843 ?auto_853849 ) ) ( not ( = ?auto_853843 ?auto_853850 ) ) ( not ( = ?auto_853843 ?auto_853851 ) ) ( not ( = ?auto_853843 ?auto_853852 ) ) ( not ( = ?auto_853843 ?auto_853853 ) ) ( not ( = ?auto_853843 ?auto_853854 ) ) ( not ( = ?auto_853843 ?auto_853855 ) ) ( not ( = ?auto_853843 ?auto_853856 ) ) ( not ( = ?auto_853843 ?auto_853857 ) ) ( not ( = ?auto_853844 ?auto_853845 ) ) ( not ( = ?auto_853844 ?auto_853846 ) ) ( not ( = ?auto_853844 ?auto_853847 ) ) ( not ( = ?auto_853844 ?auto_853848 ) ) ( not ( = ?auto_853844 ?auto_853849 ) ) ( not ( = ?auto_853844 ?auto_853850 ) ) ( not ( = ?auto_853844 ?auto_853851 ) ) ( not ( = ?auto_853844 ?auto_853852 ) ) ( not ( = ?auto_853844 ?auto_853853 ) ) ( not ( = ?auto_853844 ?auto_853854 ) ) ( not ( = ?auto_853844 ?auto_853855 ) ) ( not ( = ?auto_853844 ?auto_853856 ) ) ( not ( = ?auto_853844 ?auto_853857 ) ) ( not ( = ?auto_853845 ?auto_853846 ) ) ( not ( = ?auto_853845 ?auto_853847 ) ) ( not ( = ?auto_853845 ?auto_853848 ) ) ( not ( = ?auto_853845 ?auto_853849 ) ) ( not ( = ?auto_853845 ?auto_853850 ) ) ( not ( = ?auto_853845 ?auto_853851 ) ) ( not ( = ?auto_853845 ?auto_853852 ) ) ( not ( = ?auto_853845 ?auto_853853 ) ) ( not ( = ?auto_853845 ?auto_853854 ) ) ( not ( = ?auto_853845 ?auto_853855 ) ) ( not ( = ?auto_853845 ?auto_853856 ) ) ( not ( = ?auto_853845 ?auto_853857 ) ) ( not ( = ?auto_853846 ?auto_853847 ) ) ( not ( = ?auto_853846 ?auto_853848 ) ) ( not ( = ?auto_853846 ?auto_853849 ) ) ( not ( = ?auto_853846 ?auto_853850 ) ) ( not ( = ?auto_853846 ?auto_853851 ) ) ( not ( = ?auto_853846 ?auto_853852 ) ) ( not ( = ?auto_853846 ?auto_853853 ) ) ( not ( = ?auto_853846 ?auto_853854 ) ) ( not ( = ?auto_853846 ?auto_853855 ) ) ( not ( = ?auto_853846 ?auto_853856 ) ) ( not ( = ?auto_853846 ?auto_853857 ) ) ( not ( = ?auto_853847 ?auto_853848 ) ) ( not ( = ?auto_853847 ?auto_853849 ) ) ( not ( = ?auto_853847 ?auto_853850 ) ) ( not ( = ?auto_853847 ?auto_853851 ) ) ( not ( = ?auto_853847 ?auto_853852 ) ) ( not ( = ?auto_853847 ?auto_853853 ) ) ( not ( = ?auto_853847 ?auto_853854 ) ) ( not ( = ?auto_853847 ?auto_853855 ) ) ( not ( = ?auto_853847 ?auto_853856 ) ) ( not ( = ?auto_853847 ?auto_853857 ) ) ( not ( = ?auto_853848 ?auto_853849 ) ) ( not ( = ?auto_853848 ?auto_853850 ) ) ( not ( = ?auto_853848 ?auto_853851 ) ) ( not ( = ?auto_853848 ?auto_853852 ) ) ( not ( = ?auto_853848 ?auto_853853 ) ) ( not ( = ?auto_853848 ?auto_853854 ) ) ( not ( = ?auto_853848 ?auto_853855 ) ) ( not ( = ?auto_853848 ?auto_853856 ) ) ( not ( = ?auto_853848 ?auto_853857 ) ) ( not ( = ?auto_853849 ?auto_853850 ) ) ( not ( = ?auto_853849 ?auto_853851 ) ) ( not ( = ?auto_853849 ?auto_853852 ) ) ( not ( = ?auto_853849 ?auto_853853 ) ) ( not ( = ?auto_853849 ?auto_853854 ) ) ( not ( = ?auto_853849 ?auto_853855 ) ) ( not ( = ?auto_853849 ?auto_853856 ) ) ( not ( = ?auto_853849 ?auto_853857 ) ) ( not ( = ?auto_853850 ?auto_853851 ) ) ( not ( = ?auto_853850 ?auto_853852 ) ) ( not ( = ?auto_853850 ?auto_853853 ) ) ( not ( = ?auto_853850 ?auto_853854 ) ) ( not ( = ?auto_853850 ?auto_853855 ) ) ( not ( = ?auto_853850 ?auto_853856 ) ) ( not ( = ?auto_853850 ?auto_853857 ) ) ( not ( = ?auto_853851 ?auto_853852 ) ) ( not ( = ?auto_853851 ?auto_853853 ) ) ( not ( = ?auto_853851 ?auto_853854 ) ) ( not ( = ?auto_853851 ?auto_853855 ) ) ( not ( = ?auto_853851 ?auto_853856 ) ) ( not ( = ?auto_853851 ?auto_853857 ) ) ( not ( = ?auto_853852 ?auto_853853 ) ) ( not ( = ?auto_853852 ?auto_853854 ) ) ( not ( = ?auto_853852 ?auto_853855 ) ) ( not ( = ?auto_853852 ?auto_853856 ) ) ( not ( = ?auto_853852 ?auto_853857 ) ) ( not ( = ?auto_853853 ?auto_853854 ) ) ( not ( = ?auto_853853 ?auto_853855 ) ) ( not ( = ?auto_853853 ?auto_853856 ) ) ( not ( = ?auto_853853 ?auto_853857 ) ) ( not ( = ?auto_853854 ?auto_853855 ) ) ( not ( = ?auto_853854 ?auto_853856 ) ) ( not ( = ?auto_853854 ?auto_853857 ) ) ( not ( = ?auto_853855 ?auto_853856 ) ) ( not ( = ?auto_853855 ?auto_853857 ) ) ( not ( = ?auto_853856 ?auto_853857 ) ) ( ON ?auto_853856 ?auto_853857 ) ( ON ?auto_853855 ?auto_853856 ) ( ON ?auto_853854 ?auto_853855 ) ( ON ?auto_853853 ?auto_853854 ) ( ON ?auto_853852 ?auto_853853 ) ( ON ?auto_853851 ?auto_853852 ) ( ON ?auto_853850 ?auto_853851 ) ( ON ?auto_853849 ?auto_853850 ) ( ON ?auto_853848 ?auto_853849 ) ( ON ?auto_853847 ?auto_853848 ) ( ON ?auto_853846 ?auto_853847 ) ( ON ?auto_853845 ?auto_853846 ) ( ON ?auto_853844 ?auto_853845 ) ( ON ?auto_853843 ?auto_853844 ) ( CLEAR ?auto_853841 ) ( ON ?auto_853842 ?auto_853843 ) ( CLEAR ?auto_853842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_853840 ?auto_853841 ?auto_853842 )
      ( MAKE-18PILE ?auto_853840 ?auto_853841 ?auto_853842 ?auto_853843 ?auto_853844 ?auto_853845 ?auto_853846 ?auto_853847 ?auto_853848 ?auto_853849 ?auto_853850 ?auto_853851 ?auto_853852 ?auto_853853 ?auto_853854 ?auto_853855 ?auto_853856 ?auto_853857 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_853876 - BLOCK
      ?auto_853877 - BLOCK
      ?auto_853878 - BLOCK
      ?auto_853879 - BLOCK
      ?auto_853880 - BLOCK
      ?auto_853881 - BLOCK
      ?auto_853882 - BLOCK
      ?auto_853883 - BLOCK
      ?auto_853884 - BLOCK
      ?auto_853885 - BLOCK
      ?auto_853886 - BLOCK
      ?auto_853887 - BLOCK
      ?auto_853888 - BLOCK
      ?auto_853889 - BLOCK
      ?auto_853890 - BLOCK
      ?auto_853891 - BLOCK
      ?auto_853892 - BLOCK
      ?auto_853893 - BLOCK
    )
    :vars
    (
      ?auto_853894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_853893 ?auto_853894 ) ( ON-TABLE ?auto_853876 ) ( not ( = ?auto_853876 ?auto_853877 ) ) ( not ( = ?auto_853876 ?auto_853878 ) ) ( not ( = ?auto_853876 ?auto_853879 ) ) ( not ( = ?auto_853876 ?auto_853880 ) ) ( not ( = ?auto_853876 ?auto_853881 ) ) ( not ( = ?auto_853876 ?auto_853882 ) ) ( not ( = ?auto_853876 ?auto_853883 ) ) ( not ( = ?auto_853876 ?auto_853884 ) ) ( not ( = ?auto_853876 ?auto_853885 ) ) ( not ( = ?auto_853876 ?auto_853886 ) ) ( not ( = ?auto_853876 ?auto_853887 ) ) ( not ( = ?auto_853876 ?auto_853888 ) ) ( not ( = ?auto_853876 ?auto_853889 ) ) ( not ( = ?auto_853876 ?auto_853890 ) ) ( not ( = ?auto_853876 ?auto_853891 ) ) ( not ( = ?auto_853876 ?auto_853892 ) ) ( not ( = ?auto_853876 ?auto_853893 ) ) ( not ( = ?auto_853876 ?auto_853894 ) ) ( not ( = ?auto_853877 ?auto_853878 ) ) ( not ( = ?auto_853877 ?auto_853879 ) ) ( not ( = ?auto_853877 ?auto_853880 ) ) ( not ( = ?auto_853877 ?auto_853881 ) ) ( not ( = ?auto_853877 ?auto_853882 ) ) ( not ( = ?auto_853877 ?auto_853883 ) ) ( not ( = ?auto_853877 ?auto_853884 ) ) ( not ( = ?auto_853877 ?auto_853885 ) ) ( not ( = ?auto_853877 ?auto_853886 ) ) ( not ( = ?auto_853877 ?auto_853887 ) ) ( not ( = ?auto_853877 ?auto_853888 ) ) ( not ( = ?auto_853877 ?auto_853889 ) ) ( not ( = ?auto_853877 ?auto_853890 ) ) ( not ( = ?auto_853877 ?auto_853891 ) ) ( not ( = ?auto_853877 ?auto_853892 ) ) ( not ( = ?auto_853877 ?auto_853893 ) ) ( not ( = ?auto_853877 ?auto_853894 ) ) ( not ( = ?auto_853878 ?auto_853879 ) ) ( not ( = ?auto_853878 ?auto_853880 ) ) ( not ( = ?auto_853878 ?auto_853881 ) ) ( not ( = ?auto_853878 ?auto_853882 ) ) ( not ( = ?auto_853878 ?auto_853883 ) ) ( not ( = ?auto_853878 ?auto_853884 ) ) ( not ( = ?auto_853878 ?auto_853885 ) ) ( not ( = ?auto_853878 ?auto_853886 ) ) ( not ( = ?auto_853878 ?auto_853887 ) ) ( not ( = ?auto_853878 ?auto_853888 ) ) ( not ( = ?auto_853878 ?auto_853889 ) ) ( not ( = ?auto_853878 ?auto_853890 ) ) ( not ( = ?auto_853878 ?auto_853891 ) ) ( not ( = ?auto_853878 ?auto_853892 ) ) ( not ( = ?auto_853878 ?auto_853893 ) ) ( not ( = ?auto_853878 ?auto_853894 ) ) ( not ( = ?auto_853879 ?auto_853880 ) ) ( not ( = ?auto_853879 ?auto_853881 ) ) ( not ( = ?auto_853879 ?auto_853882 ) ) ( not ( = ?auto_853879 ?auto_853883 ) ) ( not ( = ?auto_853879 ?auto_853884 ) ) ( not ( = ?auto_853879 ?auto_853885 ) ) ( not ( = ?auto_853879 ?auto_853886 ) ) ( not ( = ?auto_853879 ?auto_853887 ) ) ( not ( = ?auto_853879 ?auto_853888 ) ) ( not ( = ?auto_853879 ?auto_853889 ) ) ( not ( = ?auto_853879 ?auto_853890 ) ) ( not ( = ?auto_853879 ?auto_853891 ) ) ( not ( = ?auto_853879 ?auto_853892 ) ) ( not ( = ?auto_853879 ?auto_853893 ) ) ( not ( = ?auto_853879 ?auto_853894 ) ) ( not ( = ?auto_853880 ?auto_853881 ) ) ( not ( = ?auto_853880 ?auto_853882 ) ) ( not ( = ?auto_853880 ?auto_853883 ) ) ( not ( = ?auto_853880 ?auto_853884 ) ) ( not ( = ?auto_853880 ?auto_853885 ) ) ( not ( = ?auto_853880 ?auto_853886 ) ) ( not ( = ?auto_853880 ?auto_853887 ) ) ( not ( = ?auto_853880 ?auto_853888 ) ) ( not ( = ?auto_853880 ?auto_853889 ) ) ( not ( = ?auto_853880 ?auto_853890 ) ) ( not ( = ?auto_853880 ?auto_853891 ) ) ( not ( = ?auto_853880 ?auto_853892 ) ) ( not ( = ?auto_853880 ?auto_853893 ) ) ( not ( = ?auto_853880 ?auto_853894 ) ) ( not ( = ?auto_853881 ?auto_853882 ) ) ( not ( = ?auto_853881 ?auto_853883 ) ) ( not ( = ?auto_853881 ?auto_853884 ) ) ( not ( = ?auto_853881 ?auto_853885 ) ) ( not ( = ?auto_853881 ?auto_853886 ) ) ( not ( = ?auto_853881 ?auto_853887 ) ) ( not ( = ?auto_853881 ?auto_853888 ) ) ( not ( = ?auto_853881 ?auto_853889 ) ) ( not ( = ?auto_853881 ?auto_853890 ) ) ( not ( = ?auto_853881 ?auto_853891 ) ) ( not ( = ?auto_853881 ?auto_853892 ) ) ( not ( = ?auto_853881 ?auto_853893 ) ) ( not ( = ?auto_853881 ?auto_853894 ) ) ( not ( = ?auto_853882 ?auto_853883 ) ) ( not ( = ?auto_853882 ?auto_853884 ) ) ( not ( = ?auto_853882 ?auto_853885 ) ) ( not ( = ?auto_853882 ?auto_853886 ) ) ( not ( = ?auto_853882 ?auto_853887 ) ) ( not ( = ?auto_853882 ?auto_853888 ) ) ( not ( = ?auto_853882 ?auto_853889 ) ) ( not ( = ?auto_853882 ?auto_853890 ) ) ( not ( = ?auto_853882 ?auto_853891 ) ) ( not ( = ?auto_853882 ?auto_853892 ) ) ( not ( = ?auto_853882 ?auto_853893 ) ) ( not ( = ?auto_853882 ?auto_853894 ) ) ( not ( = ?auto_853883 ?auto_853884 ) ) ( not ( = ?auto_853883 ?auto_853885 ) ) ( not ( = ?auto_853883 ?auto_853886 ) ) ( not ( = ?auto_853883 ?auto_853887 ) ) ( not ( = ?auto_853883 ?auto_853888 ) ) ( not ( = ?auto_853883 ?auto_853889 ) ) ( not ( = ?auto_853883 ?auto_853890 ) ) ( not ( = ?auto_853883 ?auto_853891 ) ) ( not ( = ?auto_853883 ?auto_853892 ) ) ( not ( = ?auto_853883 ?auto_853893 ) ) ( not ( = ?auto_853883 ?auto_853894 ) ) ( not ( = ?auto_853884 ?auto_853885 ) ) ( not ( = ?auto_853884 ?auto_853886 ) ) ( not ( = ?auto_853884 ?auto_853887 ) ) ( not ( = ?auto_853884 ?auto_853888 ) ) ( not ( = ?auto_853884 ?auto_853889 ) ) ( not ( = ?auto_853884 ?auto_853890 ) ) ( not ( = ?auto_853884 ?auto_853891 ) ) ( not ( = ?auto_853884 ?auto_853892 ) ) ( not ( = ?auto_853884 ?auto_853893 ) ) ( not ( = ?auto_853884 ?auto_853894 ) ) ( not ( = ?auto_853885 ?auto_853886 ) ) ( not ( = ?auto_853885 ?auto_853887 ) ) ( not ( = ?auto_853885 ?auto_853888 ) ) ( not ( = ?auto_853885 ?auto_853889 ) ) ( not ( = ?auto_853885 ?auto_853890 ) ) ( not ( = ?auto_853885 ?auto_853891 ) ) ( not ( = ?auto_853885 ?auto_853892 ) ) ( not ( = ?auto_853885 ?auto_853893 ) ) ( not ( = ?auto_853885 ?auto_853894 ) ) ( not ( = ?auto_853886 ?auto_853887 ) ) ( not ( = ?auto_853886 ?auto_853888 ) ) ( not ( = ?auto_853886 ?auto_853889 ) ) ( not ( = ?auto_853886 ?auto_853890 ) ) ( not ( = ?auto_853886 ?auto_853891 ) ) ( not ( = ?auto_853886 ?auto_853892 ) ) ( not ( = ?auto_853886 ?auto_853893 ) ) ( not ( = ?auto_853886 ?auto_853894 ) ) ( not ( = ?auto_853887 ?auto_853888 ) ) ( not ( = ?auto_853887 ?auto_853889 ) ) ( not ( = ?auto_853887 ?auto_853890 ) ) ( not ( = ?auto_853887 ?auto_853891 ) ) ( not ( = ?auto_853887 ?auto_853892 ) ) ( not ( = ?auto_853887 ?auto_853893 ) ) ( not ( = ?auto_853887 ?auto_853894 ) ) ( not ( = ?auto_853888 ?auto_853889 ) ) ( not ( = ?auto_853888 ?auto_853890 ) ) ( not ( = ?auto_853888 ?auto_853891 ) ) ( not ( = ?auto_853888 ?auto_853892 ) ) ( not ( = ?auto_853888 ?auto_853893 ) ) ( not ( = ?auto_853888 ?auto_853894 ) ) ( not ( = ?auto_853889 ?auto_853890 ) ) ( not ( = ?auto_853889 ?auto_853891 ) ) ( not ( = ?auto_853889 ?auto_853892 ) ) ( not ( = ?auto_853889 ?auto_853893 ) ) ( not ( = ?auto_853889 ?auto_853894 ) ) ( not ( = ?auto_853890 ?auto_853891 ) ) ( not ( = ?auto_853890 ?auto_853892 ) ) ( not ( = ?auto_853890 ?auto_853893 ) ) ( not ( = ?auto_853890 ?auto_853894 ) ) ( not ( = ?auto_853891 ?auto_853892 ) ) ( not ( = ?auto_853891 ?auto_853893 ) ) ( not ( = ?auto_853891 ?auto_853894 ) ) ( not ( = ?auto_853892 ?auto_853893 ) ) ( not ( = ?auto_853892 ?auto_853894 ) ) ( not ( = ?auto_853893 ?auto_853894 ) ) ( ON ?auto_853892 ?auto_853893 ) ( ON ?auto_853891 ?auto_853892 ) ( ON ?auto_853890 ?auto_853891 ) ( ON ?auto_853889 ?auto_853890 ) ( ON ?auto_853888 ?auto_853889 ) ( ON ?auto_853887 ?auto_853888 ) ( ON ?auto_853886 ?auto_853887 ) ( ON ?auto_853885 ?auto_853886 ) ( ON ?auto_853884 ?auto_853885 ) ( ON ?auto_853883 ?auto_853884 ) ( ON ?auto_853882 ?auto_853883 ) ( ON ?auto_853881 ?auto_853882 ) ( ON ?auto_853880 ?auto_853881 ) ( ON ?auto_853879 ?auto_853880 ) ( ON ?auto_853878 ?auto_853879 ) ( CLEAR ?auto_853876 ) ( ON ?auto_853877 ?auto_853878 ) ( CLEAR ?auto_853877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_853876 ?auto_853877 )
      ( MAKE-18PILE ?auto_853876 ?auto_853877 ?auto_853878 ?auto_853879 ?auto_853880 ?auto_853881 ?auto_853882 ?auto_853883 ?auto_853884 ?auto_853885 ?auto_853886 ?auto_853887 ?auto_853888 ?auto_853889 ?auto_853890 ?auto_853891 ?auto_853892 ?auto_853893 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_853913 - BLOCK
      ?auto_853914 - BLOCK
      ?auto_853915 - BLOCK
      ?auto_853916 - BLOCK
      ?auto_853917 - BLOCK
      ?auto_853918 - BLOCK
      ?auto_853919 - BLOCK
      ?auto_853920 - BLOCK
      ?auto_853921 - BLOCK
      ?auto_853922 - BLOCK
      ?auto_853923 - BLOCK
      ?auto_853924 - BLOCK
      ?auto_853925 - BLOCK
      ?auto_853926 - BLOCK
      ?auto_853927 - BLOCK
      ?auto_853928 - BLOCK
      ?auto_853929 - BLOCK
      ?auto_853930 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_853930 ) ( ON-TABLE ?auto_853913 ) ( not ( = ?auto_853913 ?auto_853914 ) ) ( not ( = ?auto_853913 ?auto_853915 ) ) ( not ( = ?auto_853913 ?auto_853916 ) ) ( not ( = ?auto_853913 ?auto_853917 ) ) ( not ( = ?auto_853913 ?auto_853918 ) ) ( not ( = ?auto_853913 ?auto_853919 ) ) ( not ( = ?auto_853913 ?auto_853920 ) ) ( not ( = ?auto_853913 ?auto_853921 ) ) ( not ( = ?auto_853913 ?auto_853922 ) ) ( not ( = ?auto_853913 ?auto_853923 ) ) ( not ( = ?auto_853913 ?auto_853924 ) ) ( not ( = ?auto_853913 ?auto_853925 ) ) ( not ( = ?auto_853913 ?auto_853926 ) ) ( not ( = ?auto_853913 ?auto_853927 ) ) ( not ( = ?auto_853913 ?auto_853928 ) ) ( not ( = ?auto_853913 ?auto_853929 ) ) ( not ( = ?auto_853913 ?auto_853930 ) ) ( not ( = ?auto_853914 ?auto_853915 ) ) ( not ( = ?auto_853914 ?auto_853916 ) ) ( not ( = ?auto_853914 ?auto_853917 ) ) ( not ( = ?auto_853914 ?auto_853918 ) ) ( not ( = ?auto_853914 ?auto_853919 ) ) ( not ( = ?auto_853914 ?auto_853920 ) ) ( not ( = ?auto_853914 ?auto_853921 ) ) ( not ( = ?auto_853914 ?auto_853922 ) ) ( not ( = ?auto_853914 ?auto_853923 ) ) ( not ( = ?auto_853914 ?auto_853924 ) ) ( not ( = ?auto_853914 ?auto_853925 ) ) ( not ( = ?auto_853914 ?auto_853926 ) ) ( not ( = ?auto_853914 ?auto_853927 ) ) ( not ( = ?auto_853914 ?auto_853928 ) ) ( not ( = ?auto_853914 ?auto_853929 ) ) ( not ( = ?auto_853914 ?auto_853930 ) ) ( not ( = ?auto_853915 ?auto_853916 ) ) ( not ( = ?auto_853915 ?auto_853917 ) ) ( not ( = ?auto_853915 ?auto_853918 ) ) ( not ( = ?auto_853915 ?auto_853919 ) ) ( not ( = ?auto_853915 ?auto_853920 ) ) ( not ( = ?auto_853915 ?auto_853921 ) ) ( not ( = ?auto_853915 ?auto_853922 ) ) ( not ( = ?auto_853915 ?auto_853923 ) ) ( not ( = ?auto_853915 ?auto_853924 ) ) ( not ( = ?auto_853915 ?auto_853925 ) ) ( not ( = ?auto_853915 ?auto_853926 ) ) ( not ( = ?auto_853915 ?auto_853927 ) ) ( not ( = ?auto_853915 ?auto_853928 ) ) ( not ( = ?auto_853915 ?auto_853929 ) ) ( not ( = ?auto_853915 ?auto_853930 ) ) ( not ( = ?auto_853916 ?auto_853917 ) ) ( not ( = ?auto_853916 ?auto_853918 ) ) ( not ( = ?auto_853916 ?auto_853919 ) ) ( not ( = ?auto_853916 ?auto_853920 ) ) ( not ( = ?auto_853916 ?auto_853921 ) ) ( not ( = ?auto_853916 ?auto_853922 ) ) ( not ( = ?auto_853916 ?auto_853923 ) ) ( not ( = ?auto_853916 ?auto_853924 ) ) ( not ( = ?auto_853916 ?auto_853925 ) ) ( not ( = ?auto_853916 ?auto_853926 ) ) ( not ( = ?auto_853916 ?auto_853927 ) ) ( not ( = ?auto_853916 ?auto_853928 ) ) ( not ( = ?auto_853916 ?auto_853929 ) ) ( not ( = ?auto_853916 ?auto_853930 ) ) ( not ( = ?auto_853917 ?auto_853918 ) ) ( not ( = ?auto_853917 ?auto_853919 ) ) ( not ( = ?auto_853917 ?auto_853920 ) ) ( not ( = ?auto_853917 ?auto_853921 ) ) ( not ( = ?auto_853917 ?auto_853922 ) ) ( not ( = ?auto_853917 ?auto_853923 ) ) ( not ( = ?auto_853917 ?auto_853924 ) ) ( not ( = ?auto_853917 ?auto_853925 ) ) ( not ( = ?auto_853917 ?auto_853926 ) ) ( not ( = ?auto_853917 ?auto_853927 ) ) ( not ( = ?auto_853917 ?auto_853928 ) ) ( not ( = ?auto_853917 ?auto_853929 ) ) ( not ( = ?auto_853917 ?auto_853930 ) ) ( not ( = ?auto_853918 ?auto_853919 ) ) ( not ( = ?auto_853918 ?auto_853920 ) ) ( not ( = ?auto_853918 ?auto_853921 ) ) ( not ( = ?auto_853918 ?auto_853922 ) ) ( not ( = ?auto_853918 ?auto_853923 ) ) ( not ( = ?auto_853918 ?auto_853924 ) ) ( not ( = ?auto_853918 ?auto_853925 ) ) ( not ( = ?auto_853918 ?auto_853926 ) ) ( not ( = ?auto_853918 ?auto_853927 ) ) ( not ( = ?auto_853918 ?auto_853928 ) ) ( not ( = ?auto_853918 ?auto_853929 ) ) ( not ( = ?auto_853918 ?auto_853930 ) ) ( not ( = ?auto_853919 ?auto_853920 ) ) ( not ( = ?auto_853919 ?auto_853921 ) ) ( not ( = ?auto_853919 ?auto_853922 ) ) ( not ( = ?auto_853919 ?auto_853923 ) ) ( not ( = ?auto_853919 ?auto_853924 ) ) ( not ( = ?auto_853919 ?auto_853925 ) ) ( not ( = ?auto_853919 ?auto_853926 ) ) ( not ( = ?auto_853919 ?auto_853927 ) ) ( not ( = ?auto_853919 ?auto_853928 ) ) ( not ( = ?auto_853919 ?auto_853929 ) ) ( not ( = ?auto_853919 ?auto_853930 ) ) ( not ( = ?auto_853920 ?auto_853921 ) ) ( not ( = ?auto_853920 ?auto_853922 ) ) ( not ( = ?auto_853920 ?auto_853923 ) ) ( not ( = ?auto_853920 ?auto_853924 ) ) ( not ( = ?auto_853920 ?auto_853925 ) ) ( not ( = ?auto_853920 ?auto_853926 ) ) ( not ( = ?auto_853920 ?auto_853927 ) ) ( not ( = ?auto_853920 ?auto_853928 ) ) ( not ( = ?auto_853920 ?auto_853929 ) ) ( not ( = ?auto_853920 ?auto_853930 ) ) ( not ( = ?auto_853921 ?auto_853922 ) ) ( not ( = ?auto_853921 ?auto_853923 ) ) ( not ( = ?auto_853921 ?auto_853924 ) ) ( not ( = ?auto_853921 ?auto_853925 ) ) ( not ( = ?auto_853921 ?auto_853926 ) ) ( not ( = ?auto_853921 ?auto_853927 ) ) ( not ( = ?auto_853921 ?auto_853928 ) ) ( not ( = ?auto_853921 ?auto_853929 ) ) ( not ( = ?auto_853921 ?auto_853930 ) ) ( not ( = ?auto_853922 ?auto_853923 ) ) ( not ( = ?auto_853922 ?auto_853924 ) ) ( not ( = ?auto_853922 ?auto_853925 ) ) ( not ( = ?auto_853922 ?auto_853926 ) ) ( not ( = ?auto_853922 ?auto_853927 ) ) ( not ( = ?auto_853922 ?auto_853928 ) ) ( not ( = ?auto_853922 ?auto_853929 ) ) ( not ( = ?auto_853922 ?auto_853930 ) ) ( not ( = ?auto_853923 ?auto_853924 ) ) ( not ( = ?auto_853923 ?auto_853925 ) ) ( not ( = ?auto_853923 ?auto_853926 ) ) ( not ( = ?auto_853923 ?auto_853927 ) ) ( not ( = ?auto_853923 ?auto_853928 ) ) ( not ( = ?auto_853923 ?auto_853929 ) ) ( not ( = ?auto_853923 ?auto_853930 ) ) ( not ( = ?auto_853924 ?auto_853925 ) ) ( not ( = ?auto_853924 ?auto_853926 ) ) ( not ( = ?auto_853924 ?auto_853927 ) ) ( not ( = ?auto_853924 ?auto_853928 ) ) ( not ( = ?auto_853924 ?auto_853929 ) ) ( not ( = ?auto_853924 ?auto_853930 ) ) ( not ( = ?auto_853925 ?auto_853926 ) ) ( not ( = ?auto_853925 ?auto_853927 ) ) ( not ( = ?auto_853925 ?auto_853928 ) ) ( not ( = ?auto_853925 ?auto_853929 ) ) ( not ( = ?auto_853925 ?auto_853930 ) ) ( not ( = ?auto_853926 ?auto_853927 ) ) ( not ( = ?auto_853926 ?auto_853928 ) ) ( not ( = ?auto_853926 ?auto_853929 ) ) ( not ( = ?auto_853926 ?auto_853930 ) ) ( not ( = ?auto_853927 ?auto_853928 ) ) ( not ( = ?auto_853927 ?auto_853929 ) ) ( not ( = ?auto_853927 ?auto_853930 ) ) ( not ( = ?auto_853928 ?auto_853929 ) ) ( not ( = ?auto_853928 ?auto_853930 ) ) ( not ( = ?auto_853929 ?auto_853930 ) ) ( ON ?auto_853929 ?auto_853930 ) ( ON ?auto_853928 ?auto_853929 ) ( ON ?auto_853927 ?auto_853928 ) ( ON ?auto_853926 ?auto_853927 ) ( ON ?auto_853925 ?auto_853926 ) ( ON ?auto_853924 ?auto_853925 ) ( ON ?auto_853923 ?auto_853924 ) ( ON ?auto_853922 ?auto_853923 ) ( ON ?auto_853921 ?auto_853922 ) ( ON ?auto_853920 ?auto_853921 ) ( ON ?auto_853919 ?auto_853920 ) ( ON ?auto_853918 ?auto_853919 ) ( ON ?auto_853917 ?auto_853918 ) ( ON ?auto_853916 ?auto_853917 ) ( ON ?auto_853915 ?auto_853916 ) ( CLEAR ?auto_853913 ) ( ON ?auto_853914 ?auto_853915 ) ( CLEAR ?auto_853914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_853913 ?auto_853914 )
      ( MAKE-18PILE ?auto_853913 ?auto_853914 ?auto_853915 ?auto_853916 ?auto_853917 ?auto_853918 ?auto_853919 ?auto_853920 ?auto_853921 ?auto_853922 ?auto_853923 ?auto_853924 ?auto_853925 ?auto_853926 ?auto_853927 ?auto_853928 ?auto_853929 ?auto_853930 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_853949 - BLOCK
      ?auto_853950 - BLOCK
      ?auto_853951 - BLOCK
      ?auto_853952 - BLOCK
      ?auto_853953 - BLOCK
      ?auto_853954 - BLOCK
      ?auto_853955 - BLOCK
      ?auto_853956 - BLOCK
      ?auto_853957 - BLOCK
      ?auto_853958 - BLOCK
      ?auto_853959 - BLOCK
      ?auto_853960 - BLOCK
      ?auto_853961 - BLOCK
      ?auto_853962 - BLOCK
      ?auto_853963 - BLOCK
      ?auto_853964 - BLOCK
      ?auto_853965 - BLOCK
      ?auto_853966 - BLOCK
    )
    :vars
    (
      ?auto_853967 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_853966 ?auto_853967 ) ( not ( = ?auto_853949 ?auto_853950 ) ) ( not ( = ?auto_853949 ?auto_853951 ) ) ( not ( = ?auto_853949 ?auto_853952 ) ) ( not ( = ?auto_853949 ?auto_853953 ) ) ( not ( = ?auto_853949 ?auto_853954 ) ) ( not ( = ?auto_853949 ?auto_853955 ) ) ( not ( = ?auto_853949 ?auto_853956 ) ) ( not ( = ?auto_853949 ?auto_853957 ) ) ( not ( = ?auto_853949 ?auto_853958 ) ) ( not ( = ?auto_853949 ?auto_853959 ) ) ( not ( = ?auto_853949 ?auto_853960 ) ) ( not ( = ?auto_853949 ?auto_853961 ) ) ( not ( = ?auto_853949 ?auto_853962 ) ) ( not ( = ?auto_853949 ?auto_853963 ) ) ( not ( = ?auto_853949 ?auto_853964 ) ) ( not ( = ?auto_853949 ?auto_853965 ) ) ( not ( = ?auto_853949 ?auto_853966 ) ) ( not ( = ?auto_853949 ?auto_853967 ) ) ( not ( = ?auto_853950 ?auto_853951 ) ) ( not ( = ?auto_853950 ?auto_853952 ) ) ( not ( = ?auto_853950 ?auto_853953 ) ) ( not ( = ?auto_853950 ?auto_853954 ) ) ( not ( = ?auto_853950 ?auto_853955 ) ) ( not ( = ?auto_853950 ?auto_853956 ) ) ( not ( = ?auto_853950 ?auto_853957 ) ) ( not ( = ?auto_853950 ?auto_853958 ) ) ( not ( = ?auto_853950 ?auto_853959 ) ) ( not ( = ?auto_853950 ?auto_853960 ) ) ( not ( = ?auto_853950 ?auto_853961 ) ) ( not ( = ?auto_853950 ?auto_853962 ) ) ( not ( = ?auto_853950 ?auto_853963 ) ) ( not ( = ?auto_853950 ?auto_853964 ) ) ( not ( = ?auto_853950 ?auto_853965 ) ) ( not ( = ?auto_853950 ?auto_853966 ) ) ( not ( = ?auto_853950 ?auto_853967 ) ) ( not ( = ?auto_853951 ?auto_853952 ) ) ( not ( = ?auto_853951 ?auto_853953 ) ) ( not ( = ?auto_853951 ?auto_853954 ) ) ( not ( = ?auto_853951 ?auto_853955 ) ) ( not ( = ?auto_853951 ?auto_853956 ) ) ( not ( = ?auto_853951 ?auto_853957 ) ) ( not ( = ?auto_853951 ?auto_853958 ) ) ( not ( = ?auto_853951 ?auto_853959 ) ) ( not ( = ?auto_853951 ?auto_853960 ) ) ( not ( = ?auto_853951 ?auto_853961 ) ) ( not ( = ?auto_853951 ?auto_853962 ) ) ( not ( = ?auto_853951 ?auto_853963 ) ) ( not ( = ?auto_853951 ?auto_853964 ) ) ( not ( = ?auto_853951 ?auto_853965 ) ) ( not ( = ?auto_853951 ?auto_853966 ) ) ( not ( = ?auto_853951 ?auto_853967 ) ) ( not ( = ?auto_853952 ?auto_853953 ) ) ( not ( = ?auto_853952 ?auto_853954 ) ) ( not ( = ?auto_853952 ?auto_853955 ) ) ( not ( = ?auto_853952 ?auto_853956 ) ) ( not ( = ?auto_853952 ?auto_853957 ) ) ( not ( = ?auto_853952 ?auto_853958 ) ) ( not ( = ?auto_853952 ?auto_853959 ) ) ( not ( = ?auto_853952 ?auto_853960 ) ) ( not ( = ?auto_853952 ?auto_853961 ) ) ( not ( = ?auto_853952 ?auto_853962 ) ) ( not ( = ?auto_853952 ?auto_853963 ) ) ( not ( = ?auto_853952 ?auto_853964 ) ) ( not ( = ?auto_853952 ?auto_853965 ) ) ( not ( = ?auto_853952 ?auto_853966 ) ) ( not ( = ?auto_853952 ?auto_853967 ) ) ( not ( = ?auto_853953 ?auto_853954 ) ) ( not ( = ?auto_853953 ?auto_853955 ) ) ( not ( = ?auto_853953 ?auto_853956 ) ) ( not ( = ?auto_853953 ?auto_853957 ) ) ( not ( = ?auto_853953 ?auto_853958 ) ) ( not ( = ?auto_853953 ?auto_853959 ) ) ( not ( = ?auto_853953 ?auto_853960 ) ) ( not ( = ?auto_853953 ?auto_853961 ) ) ( not ( = ?auto_853953 ?auto_853962 ) ) ( not ( = ?auto_853953 ?auto_853963 ) ) ( not ( = ?auto_853953 ?auto_853964 ) ) ( not ( = ?auto_853953 ?auto_853965 ) ) ( not ( = ?auto_853953 ?auto_853966 ) ) ( not ( = ?auto_853953 ?auto_853967 ) ) ( not ( = ?auto_853954 ?auto_853955 ) ) ( not ( = ?auto_853954 ?auto_853956 ) ) ( not ( = ?auto_853954 ?auto_853957 ) ) ( not ( = ?auto_853954 ?auto_853958 ) ) ( not ( = ?auto_853954 ?auto_853959 ) ) ( not ( = ?auto_853954 ?auto_853960 ) ) ( not ( = ?auto_853954 ?auto_853961 ) ) ( not ( = ?auto_853954 ?auto_853962 ) ) ( not ( = ?auto_853954 ?auto_853963 ) ) ( not ( = ?auto_853954 ?auto_853964 ) ) ( not ( = ?auto_853954 ?auto_853965 ) ) ( not ( = ?auto_853954 ?auto_853966 ) ) ( not ( = ?auto_853954 ?auto_853967 ) ) ( not ( = ?auto_853955 ?auto_853956 ) ) ( not ( = ?auto_853955 ?auto_853957 ) ) ( not ( = ?auto_853955 ?auto_853958 ) ) ( not ( = ?auto_853955 ?auto_853959 ) ) ( not ( = ?auto_853955 ?auto_853960 ) ) ( not ( = ?auto_853955 ?auto_853961 ) ) ( not ( = ?auto_853955 ?auto_853962 ) ) ( not ( = ?auto_853955 ?auto_853963 ) ) ( not ( = ?auto_853955 ?auto_853964 ) ) ( not ( = ?auto_853955 ?auto_853965 ) ) ( not ( = ?auto_853955 ?auto_853966 ) ) ( not ( = ?auto_853955 ?auto_853967 ) ) ( not ( = ?auto_853956 ?auto_853957 ) ) ( not ( = ?auto_853956 ?auto_853958 ) ) ( not ( = ?auto_853956 ?auto_853959 ) ) ( not ( = ?auto_853956 ?auto_853960 ) ) ( not ( = ?auto_853956 ?auto_853961 ) ) ( not ( = ?auto_853956 ?auto_853962 ) ) ( not ( = ?auto_853956 ?auto_853963 ) ) ( not ( = ?auto_853956 ?auto_853964 ) ) ( not ( = ?auto_853956 ?auto_853965 ) ) ( not ( = ?auto_853956 ?auto_853966 ) ) ( not ( = ?auto_853956 ?auto_853967 ) ) ( not ( = ?auto_853957 ?auto_853958 ) ) ( not ( = ?auto_853957 ?auto_853959 ) ) ( not ( = ?auto_853957 ?auto_853960 ) ) ( not ( = ?auto_853957 ?auto_853961 ) ) ( not ( = ?auto_853957 ?auto_853962 ) ) ( not ( = ?auto_853957 ?auto_853963 ) ) ( not ( = ?auto_853957 ?auto_853964 ) ) ( not ( = ?auto_853957 ?auto_853965 ) ) ( not ( = ?auto_853957 ?auto_853966 ) ) ( not ( = ?auto_853957 ?auto_853967 ) ) ( not ( = ?auto_853958 ?auto_853959 ) ) ( not ( = ?auto_853958 ?auto_853960 ) ) ( not ( = ?auto_853958 ?auto_853961 ) ) ( not ( = ?auto_853958 ?auto_853962 ) ) ( not ( = ?auto_853958 ?auto_853963 ) ) ( not ( = ?auto_853958 ?auto_853964 ) ) ( not ( = ?auto_853958 ?auto_853965 ) ) ( not ( = ?auto_853958 ?auto_853966 ) ) ( not ( = ?auto_853958 ?auto_853967 ) ) ( not ( = ?auto_853959 ?auto_853960 ) ) ( not ( = ?auto_853959 ?auto_853961 ) ) ( not ( = ?auto_853959 ?auto_853962 ) ) ( not ( = ?auto_853959 ?auto_853963 ) ) ( not ( = ?auto_853959 ?auto_853964 ) ) ( not ( = ?auto_853959 ?auto_853965 ) ) ( not ( = ?auto_853959 ?auto_853966 ) ) ( not ( = ?auto_853959 ?auto_853967 ) ) ( not ( = ?auto_853960 ?auto_853961 ) ) ( not ( = ?auto_853960 ?auto_853962 ) ) ( not ( = ?auto_853960 ?auto_853963 ) ) ( not ( = ?auto_853960 ?auto_853964 ) ) ( not ( = ?auto_853960 ?auto_853965 ) ) ( not ( = ?auto_853960 ?auto_853966 ) ) ( not ( = ?auto_853960 ?auto_853967 ) ) ( not ( = ?auto_853961 ?auto_853962 ) ) ( not ( = ?auto_853961 ?auto_853963 ) ) ( not ( = ?auto_853961 ?auto_853964 ) ) ( not ( = ?auto_853961 ?auto_853965 ) ) ( not ( = ?auto_853961 ?auto_853966 ) ) ( not ( = ?auto_853961 ?auto_853967 ) ) ( not ( = ?auto_853962 ?auto_853963 ) ) ( not ( = ?auto_853962 ?auto_853964 ) ) ( not ( = ?auto_853962 ?auto_853965 ) ) ( not ( = ?auto_853962 ?auto_853966 ) ) ( not ( = ?auto_853962 ?auto_853967 ) ) ( not ( = ?auto_853963 ?auto_853964 ) ) ( not ( = ?auto_853963 ?auto_853965 ) ) ( not ( = ?auto_853963 ?auto_853966 ) ) ( not ( = ?auto_853963 ?auto_853967 ) ) ( not ( = ?auto_853964 ?auto_853965 ) ) ( not ( = ?auto_853964 ?auto_853966 ) ) ( not ( = ?auto_853964 ?auto_853967 ) ) ( not ( = ?auto_853965 ?auto_853966 ) ) ( not ( = ?auto_853965 ?auto_853967 ) ) ( not ( = ?auto_853966 ?auto_853967 ) ) ( ON ?auto_853965 ?auto_853966 ) ( ON ?auto_853964 ?auto_853965 ) ( ON ?auto_853963 ?auto_853964 ) ( ON ?auto_853962 ?auto_853963 ) ( ON ?auto_853961 ?auto_853962 ) ( ON ?auto_853960 ?auto_853961 ) ( ON ?auto_853959 ?auto_853960 ) ( ON ?auto_853958 ?auto_853959 ) ( ON ?auto_853957 ?auto_853958 ) ( ON ?auto_853956 ?auto_853957 ) ( ON ?auto_853955 ?auto_853956 ) ( ON ?auto_853954 ?auto_853955 ) ( ON ?auto_853953 ?auto_853954 ) ( ON ?auto_853952 ?auto_853953 ) ( ON ?auto_853951 ?auto_853952 ) ( ON ?auto_853950 ?auto_853951 ) ( ON ?auto_853949 ?auto_853950 ) ( CLEAR ?auto_853949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_853949 )
      ( MAKE-18PILE ?auto_853949 ?auto_853950 ?auto_853951 ?auto_853952 ?auto_853953 ?auto_853954 ?auto_853955 ?auto_853956 ?auto_853957 ?auto_853958 ?auto_853959 ?auto_853960 ?auto_853961 ?auto_853962 ?auto_853963 ?auto_853964 ?auto_853965 ?auto_853966 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_853986 - BLOCK
      ?auto_853987 - BLOCK
      ?auto_853988 - BLOCK
      ?auto_853989 - BLOCK
      ?auto_853990 - BLOCK
      ?auto_853991 - BLOCK
      ?auto_853992 - BLOCK
      ?auto_853993 - BLOCK
      ?auto_853994 - BLOCK
      ?auto_853995 - BLOCK
      ?auto_853996 - BLOCK
      ?auto_853997 - BLOCK
      ?auto_853998 - BLOCK
      ?auto_853999 - BLOCK
      ?auto_854000 - BLOCK
      ?auto_854001 - BLOCK
      ?auto_854002 - BLOCK
      ?auto_854003 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_854003 ) ( not ( = ?auto_853986 ?auto_853987 ) ) ( not ( = ?auto_853986 ?auto_853988 ) ) ( not ( = ?auto_853986 ?auto_853989 ) ) ( not ( = ?auto_853986 ?auto_853990 ) ) ( not ( = ?auto_853986 ?auto_853991 ) ) ( not ( = ?auto_853986 ?auto_853992 ) ) ( not ( = ?auto_853986 ?auto_853993 ) ) ( not ( = ?auto_853986 ?auto_853994 ) ) ( not ( = ?auto_853986 ?auto_853995 ) ) ( not ( = ?auto_853986 ?auto_853996 ) ) ( not ( = ?auto_853986 ?auto_853997 ) ) ( not ( = ?auto_853986 ?auto_853998 ) ) ( not ( = ?auto_853986 ?auto_853999 ) ) ( not ( = ?auto_853986 ?auto_854000 ) ) ( not ( = ?auto_853986 ?auto_854001 ) ) ( not ( = ?auto_853986 ?auto_854002 ) ) ( not ( = ?auto_853986 ?auto_854003 ) ) ( not ( = ?auto_853987 ?auto_853988 ) ) ( not ( = ?auto_853987 ?auto_853989 ) ) ( not ( = ?auto_853987 ?auto_853990 ) ) ( not ( = ?auto_853987 ?auto_853991 ) ) ( not ( = ?auto_853987 ?auto_853992 ) ) ( not ( = ?auto_853987 ?auto_853993 ) ) ( not ( = ?auto_853987 ?auto_853994 ) ) ( not ( = ?auto_853987 ?auto_853995 ) ) ( not ( = ?auto_853987 ?auto_853996 ) ) ( not ( = ?auto_853987 ?auto_853997 ) ) ( not ( = ?auto_853987 ?auto_853998 ) ) ( not ( = ?auto_853987 ?auto_853999 ) ) ( not ( = ?auto_853987 ?auto_854000 ) ) ( not ( = ?auto_853987 ?auto_854001 ) ) ( not ( = ?auto_853987 ?auto_854002 ) ) ( not ( = ?auto_853987 ?auto_854003 ) ) ( not ( = ?auto_853988 ?auto_853989 ) ) ( not ( = ?auto_853988 ?auto_853990 ) ) ( not ( = ?auto_853988 ?auto_853991 ) ) ( not ( = ?auto_853988 ?auto_853992 ) ) ( not ( = ?auto_853988 ?auto_853993 ) ) ( not ( = ?auto_853988 ?auto_853994 ) ) ( not ( = ?auto_853988 ?auto_853995 ) ) ( not ( = ?auto_853988 ?auto_853996 ) ) ( not ( = ?auto_853988 ?auto_853997 ) ) ( not ( = ?auto_853988 ?auto_853998 ) ) ( not ( = ?auto_853988 ?auto_853999 ) ) ( not ( = ?auto_853988 ?auto_854000 ) ) ( not ( = ?auto_853988 ?auto_854001 ) ) ( not ( = ?auto_853988 ?auto_854002 ) ) ( not ( = ?auto_853988 ?auto_854003 ) ) ( not ( = ?auto_853989 ?auto_853990 ) ) ( not ( = ?auto_853989 ?auto_853991 ) ) ( not ( = ?auto_853989 ?auto_853992 ) ) ( not ( = ?auto_853989 ?auto_853993 ) ) ( not ( = ?auto_853989 ?auto_853994 ) ) ( not ( = ?auto_853989 ?auto_853995 ) ) ( not ( = ?auto_853989 ?auto_853996 ) ) ( not ( = ?auto_853989 ?auto_853997 ) ) ( not ( = ?auto_853989 ?auto_853998 ) ) ( not ( = ?auto_853989 ?auto_853999 ) ) ( not ( = ?auto_853989 ?auto_854000 ) ) ( not ( = ?auto_853989 ?auto_854001 ) ) ( not ( = ?auto_853989 ?auto_854002 ) ) ( not ( = ?auto_853989 ?auto_854003 ) ) ( not ( = ?auto_853990 ?auto_853991 ) ) ( not ( = ?auto_853990 ?auto_853992 ) ) ( not ( = ?auto_853990 ?auto_853993 ) ) ( not ( = ?auto_853990 ?auto_853994 ) ) ( not ( = ?auto_853990 ?auto_853995 ) ) ( not ( = ?auto_853990 ?auto_853996 ) ) ( not ( = ?auto_853990 ?auto_853997 ) ) ( not ( = ?auto_853990 ?auto_853998 ) ) ( not ( = ?auto_853990 ?auto_853999 ) ) ( not ( = ?auto_853990 ?auto_854000 ) ) ( not ( = ?auto_853990 ?auto_854001 ) ) ( not ( = ?auto_853990 ?auto_854002 ) ) ( not ( = ?auto_853990 ?auto_854003 ) ) ( not ( = ?auto_853991 ?auto_853992 ) ) ( not ( = ?auto_853991 ?auto_853993 ) ) ( not ( = ?auto_853991 ?auto_853994 ) ) ( not ( = ?auto_853991 ?auto_853995 ) ) ( not ( = ?auto_853991 ?auto_853996 ) ) ( not ( = ?auto_853991 ?auto_853997 ) ) ( not ( = ?auto_853991 ?auto_853998 ) ) ( not ( = ?auto_853991 ?auto_853999 ) ) ( not ( = ?auto_853991 ?auto_854000 ) ) ( not ( = ?auto_853991 ?auto_854001 ) ) ( not ( = ?auto_853991 ?auto_854002 ) ) ( not ( = ?auto_853991 ?auto_854003 ) ) ( not ( = ?auto_853992 ?auto_853993 ) ) ( not ( = ?auto_853992 ?auto_853994 ) ) ( not ( = ?auto_853992 ?auto_853995 ) ) ( not ( = ?auto_853992 ?auto_853996 ) ) ( not ( = ?auto_853992 ?auto_853997 ) ) ( not ( = ?auto_853992 ?auto_853998 ) ) ( not ( = ?auto_853992 ?auto_853999 ) ) ( not ( = ?auto_853992 ?auto_854000 ) ) ( not ( = ?auto_853992 ?auto_854001 ) ) ( not ( = ?auto_853992 ?auto_854002 ) ) ( not ( = ?auto_853992 ?auto_854003 ) ) ( not ( = ?auto_853993 ?auto_853994 ) ) ( not ( = ?auto_853993 ?auto_853995 ) ) ( not ( = ?auto_853993 ?auto_853996 ) ) ( not ( = ?auto_853993 ?auto_853997 ) ) ( not ( = ?auto_853993 ?auto_853998 ) ) ( not ( = ?auto_853993 ?auto_853999 ) ) ( not ( = ?auto_853993 ?auto_854000 ) ) ( not ( = ?auto_853993 ?auto_854001 ) ) ( not ( = ?auto_853993 ?auto_854002 ) ) ( not ( = ?auto_853993 ?auto_854003 ) ) ( not ( = ?auto_853994 ?auto_853995 ) ) ( not ( = ?auto_853994 ?auto_853996 ) ) ( not ( = ?auto_853994 ?auto_853997 ) ) ( not ( = ?auto_853994 ?auto_853998 ) ) ( not ( = ?auto_853994 ?auto_853999 ) ) ( not ( = ?auto_853994 ?auto_854000 ) ) ( not ( = ?auto_853994 ?auto_854001 ) ) ( not ( = ?auto_853994 ?auto_854002 ) ) ( not ( = ?auto_853994 ?auto_854003 ) ) ( not ( = ?auto_853995 ?auto_853996 ) ) ( not ( = ?auto_853995 ?auto_853997 ) ) ( not ( = ?auto_853995 ?auto_853998 ) ) ( not ( = ?auto_853995 ?auto_853999 ) ) ( not ( = ?auto_853995 ?auto_854000 ) ) ( not ( = ?auto_853995 ?auto_854001 ) ) ( not ( = ?auto_853995 ?auto_854002 ) ) ( not ( = ?auto_853995 ?auto_854003 ) ) ( not ( = ?auto_853996 ?auto_853997 ) ) ( not ( = ?auto_853996 ?auto_853998 ) ) ( not ( = ?auto_853996 ?auto_853999 ) ) ( not ( = ?auto_853996 ?auto_854000 ) ) ( not ( = ?auto_853996 ?auto_854001 ) ) ( not ( = ?auto_853996 ?auto_854002 ) ) ( not ( = ?auto_853996 ?auto_854003 ) ) ( not ( = ?auto_853997 ?auto_853998 ) ) ( not ( = ?auto_853997 ?auto_853999 ) ) ( not ( = ?auto_853997 ?auto_854000 ) ) ( not ( = ?auto_853997 ?auto_854001 ) ) ( not ( = ?auto_853997 ?auto_854002 ) ) ( not ( = ?auto_853997 ?auto_854003 ) ) ( not ( = ?auto_853998 ?auto_853999 ) ) ( not ( = ?auto_853998 ?auto_854000 ) ) ( not ( = ?auto_853998 ?auto_854001 ) ) ( not ( = ?auto_853998 ?auto_854002 ) ) ( not ( = ?auto_853998 ?auto_854003 ) ) ( not ( = ?auto_853999 ?auto_854000 ) ) ( not ( = ?auto_853999 ?auto_854001 ) ) ( not ( = ?auto_853999 ?auto_854002 ) ) ( not ( = ?auto_853999 ?auto_854003 ) ) ( not ( = ?auto_854000 ?auto_854001 ) ) ( not ( = ?auto_854000 ?auto_854002 ) ) ( not ( = ?auto_854000 ?auto_854003 ) ) ( not ( = ?auto_854001 ?auto_854002 ) ) ( not ( = ?auto_854001 ?auto_854003 ) ) ( not ( = ?auto_854002 ?auto_854003 ) ) ( ON ?auto_854002 ?auto_854003 ) ( ON ?auto_854001 ?auto_854002 ) ( ON ?auto_854000 ?auto_854001 ) ( ON ?auto_853999 ?auto_854000 ) ( ON ?auto_853998 ?auto_853999 ) ( ON ?auto_853997 ?auto_853998 ) ( ON ?auto_853996 ?auto_853997 ) ( ON ?auto_853995 ?auto_853996 ) ( ON ?auto_853994 ?auto_853995 ) ( ON ?auto_853993 ?auto_853994 ) ( ON ?auto_853992 ?auto_853993 ) ( ON ?auto_853991 ?auto_853992 ) ( ON ?auto_853990 ?auto_853991 ) ( ON ?auto_853989 ?auto_853990 ) ( ON ?auto_853988 ?auto_853989 ) ( ON ?auto_853987 ?auto_853988 ) ( ON ?auto_853986 ?auto_853987 ) ( CLEAR ?auto_853986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_853986 )
      ( MAKE-18PILE ?auto_853986 ?auto_853987 ?auto_853988 ?auto_853989 ?auto_853990 ?auto_853991 ?auto_853992 ?auto_853993 ?auto_853994 ?auto_853995 ?auto_853996 ?auto_853997 ?auto_853998 ?auto_853999 ?auto_854000 ?auto_854001 ?auto_854002 ?auto_854003 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_854022 - BLOCK
      ?auto_854023 - BLOCK
      ?auto_854024 - BLOCK
      ?auto_854025 - BLOCK
      ?auto_854026 - BLOCK
      ?auto_854027 - BLOCK
      ?auto_854028 - BLOCK
      ?auto_854029 - BLOCK
      ?auto_854030 - BLOCK
      ?auto_854031 - BLOCK
      ?auto_854032 - BLOCK
      ?auto_854033 - BLOCK
      ?auto_854034 - BLOCK
      ?auto_854035 - BLOCK
      ?auto_854036 - BLOCK
      ?auto_854037 - BLOCK
      ?auto_854038 - BLOCK
      ?auto_854039 - BLOCK
    )
    :vars
    (
      ?auto_854040 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_854022 ?auto_854023 ) ) ( not ( = ?auto_854022 ?auto_854024 ) ) ( not ( = ?auto_854022 ?auto_854025 ) ) ( not ( = ?auto_854022 ?auto_854026 ) ) ( not ( = ?auto_854022 ?auto_854027 ) ) ( not ( = ?auto_854022 ?auto_854028 ) ) ( not ( = ?auto_854022 ?auto_854029 ) ) ( not ( = ?auto_854022 ?auto_854030 ) ) ( not ( = ?auto_854022 ?auto_854031 ) ) ( not ( = ?auto_854022 ?auto_854032 ) ) ( not ( = ?auto_854022 ?auto_854033 ) ) ( not ( = ?auto_854022 ?auto_854034 ) ) ( not ( = ?auto_854022 ?auto_854035 ) ) ( not ( = ?auto_854022 ?auto_854036 ) ) ( not ( = ?auto_854022 ?auto_854037 ) ) ( not ( = ?auto_854022 ?auto_854038 ) ) ( not ( = ?auto_854022 ?auto_854039 ) ) ( not ( = ?auto_854023 ?auto_854024 ) ) ( not ( = ?auto_854023 ?auto_854025 ) ) ( not ( = ?auto_854023 ?auto_854026 ) ) ( not ( = ?auto_854023 ?auto_854027 ) ) ( not ( = ?auto_854023 ?auto_854028 ) ) ( not ( = ?auto_854023 ?auto_854029 ) ) ( not ( = ?auto_854023 ?auto_854030 ) ) ( not ( = ?auto_854023 ?auto_854031 ) ) ( not ( = ?auto_854023 ?auto_854032 ) ) ( not ( = ?auto_854023 ?auto_854033 ) ) ( not ( = ?auto_854023 ?auto_854034 ) ) ( not ( = ?auto_854023 ?auto_854035 ) ) ( not ( = ?auto_854023 ?auto_854036 ) ) ( not ( = ?auto_854023 ?auto_854037 ) ) ( not ( = ?auto_854023 ?auto_854038 ) ) ( not ( = ?auto_854023 ?auto_854039 ) ) ( not ( = ?auto_854024 ?auto_854025 ) ) ( not ( = ?auto_854024 ?auto_854026 ) ) ( not ( = ?auto_854024 ?auto_854027 ) ) ( not ( = ?auto_854024 ?auto_854028 ) ) ( not ( = ?auto_854024 ?auto_854029 ) ) ( not ( = ?auto_854024 ?auto_854030 ) ) ( not ( = ?auto_854024 ?auto_854031 ) ) ( not ( = ?auto_854024 ?auto_854032 ) ) ( not ( = ?auto_854024 ?auto_854033 ) ) ( not ( = ?auto_854024 ?auto_854034 ) ) ( not ( = ?auto_854024 ?auto_854035 ) ) ( not ( = ?auto_854024 ?auto_854036 ) ) ( not ( = ?auto_854024 ?auto_854037 ) ) ( not ( = ?auto_854024 ?auto_854038 ) ) ( not ( = ?auto_854024 ?auto_854039 ) ) ( not ( = ?auto_854025 ?auto_854026 ) ) ( not ( = ?auto_854025 ?auto_854027 ) ) ( not ( = ?auto_854025 ?auto_854028 ) ) ( not ( = ?auto_854025 ?auto_854029 ) ) ( not ( = ?auto_854025 ?auto_854030 ) ) ( not ( = ?auto_854025 ?auto_854031 ) ) ( not ( = ?auto_854025 ?auto_854032 ) ) ( not ( = ?auto_854025 ?auto_854033 ) ) ( not ( = ?auto_854025 ?auto_854034 ) ) ( not ( = ?auto_854025 ?auto_854035 ) ) ( not ( = ?auto_854025 ?auto_854036 ) ) ( not ( = ?auto_854025 ?auto_854037 ) ) ( not ( = ?auto_854025 ?auto_854038 ) ) ( not ( = ?auto_854025 ?auto_854039 ) ) ( not ( = ?auto_854026 ?auto_854027 ) ) ( not ( = ?auto_854026 ?auto_854028 ) ) ( not ( = ?auto_854026 ?auto_854029 ) ) ( not ( = ?auto_854026 ?auto_854030 ) ) ( not ( = ?auto_854026 ?auto_854031 ) ) ( not ( = ?auto_854026 ?auto_854032 ) ) ( not ( = ?auto_854026 ?auto_854033 ) ) ( not ( = ?auto_854026 ?auto_854034 ) ) ( not ( = ?auto_854026 ?auto_854035 ) ) ( not ( = ?auto_854026 ?auto_854036 ) ) ( not ( = ?auto_854026 ?auto_854037 ) ) ( not ( = ?auto_854026 ?auto_854038 ) ) ( not ( = ?auto_854026 ?auto_854039 ) ) ( not ( = ?auto_854027 ?auto_854028 ) ) ( not ( = ?auto_854027 ?auto_854029 ) ) ( not ( = ?auto_854027 ?auto_854030 ) ) ( not ( = ?auto_854027 ?auto_854031 ) ) ( not ( = ?auto_854027 ?auto_854032 ) ) ( not ( = ?auto_854027 ?auto_854033 ) ) ( not ( = ?auto_854027 ?auto_854034 ) ) ( not ( = ?auto_854027 ?auto_854035 ) ) ( not ( = ?auto_854027 ?auto_854036 ) ) ( not ( = ?auto_854027 ?auto_854037 ) ) ( not ( = ?auto_854027 ?auto_854038 ) ) ( not ( = ?auto_854027 ?auto_854039 ) ) ( not ( = ?auto_854028 ?auto_854029 ) ) ( not ( = ?auto_854028 ?auto_854030 ) ) ( not ( = ?auto_854028 ?auto_854031 ) ) ( not ( = ?auto_854028 ?auto_854032 ) ) ( not ( = ?auto_854028 ?auto_854033 ) ) ( not ( = ?auto_854028 ?auto_854034 ) ) ( not ( = ?auto_854028 ?auto_854035 ) ) ( not ( = ?auto_854028 ?auto_854036 ) ) ( not ( = ?auto_854028 ?auto_854037 ) ) ( not ( = ?auto_854028 ?auto_854038 ) ) ( not ( = ?auto_854028 ?auto_854039 ) ) ( not ( = ?auto_854029 ?auto_854030 ) ) ( not ( = ?auto_854029 ?auto_854031 ) ) ( not ( = ?auto_854029 ?auto_854032 ) ) ( not ( = ?auto_854029 ?auto_854033 ) ) ( not ( = ?auto_854029 ?auto_854034 ) ) ( not ( = ?auto_854029 ?auto_854035 ) ) ( not ( = ?auto_854029 ?auto_854036 ) ) ( not ( = ?auto_854029 ?auto_854037 ) ) ( not ( = ?auto_854029 ?auto_854038 ) ) ( not ( = ?auto_854029 ?auto_854039 ) ) ( not ( = ?auto_854030 ?auto_854031 ) ) ( not ( = ?auto_854030 ?auto_854032 ) ) ( not ( = ?auto_854030 ?auto_854033 ) ) ( not ( = ?auto_854030 ?auto_854034 ) ) ( not ( = ?auto_854030 ?auto_854035 ) ) ( not ( = ?auto_854030 ?auto_854036 ) ) ( not ( = ?auto_854030 ?auto_854037 ) ) ( not ( = ?auto_854030 ?auto_854038 ) ) ( not ( = ?auto_854030 ?auto_854039 ) ) ( not ( = ?auto_854031 ?auto_854032 ) ) ( not ( = ?auto_854031 ?auto_854033 ) ) ( not ( = ?auto_854031 ?auto_854034 ) ) ( not ( = ?auto_854031 ?auto_854035 ) ) ( not ( = ?auto_854031 ?auto_854036 ) ) ( not ( = ?auto_854031 ?auto_854037 ) ) ( not ( = ?auto_854031 ?auto_854038 ) ) ( not ( = ?auto_854031 ?auto_854039 ) ) ( not ( = ?auto_854032 ?auto_854033 ) ) ( not ( = ?auto_854032 ?auto_854034 ) ) ( not ( = ?auto_854032 ?auto_854035 ) ) ( not ( = ?auto_854032 ?auto_854036 ) ) ( not ( = ?auto_854032 ?auto_854037 ) ) ( not ( = ?auto_854032 ?auto_854038 ) ) ( not ( = ?auto_854032 ?auto_854039 ) ) ( not ( = ?auto_854033 ?auto_854034 ) ) ( not ( = ?auto_854033 ?auto_854035 ) ) ( not ( = ?auto_854033 ?auto_854036 ) ) ( not ( = ?auto_854033 ?auto_854037 ) ) ( not ( = ?auto_854033 ?auto_854038 ) ) ( not ( = ?auto_854033 ?auto_854039 ) ) ( not ( = ?auto_854034 ?auto_854035 ) ) ( not ( = ?auto_854034 ?auto_854036 ) ) ( not ( = ?auto_854034 ?auto_854037 ) ) ( not ( = ?auto_854034 ?auto_854038 ) ) ( not ( = ?auto_854034 ?auto_854039 ) ) ( not ( = ?auto_854035 ?auto_854036 ) ) ( not ( = ?auto_854035 ?auto_854037 ) ) ( not ( = ?auto_854035 ?auto_854038 ) ) ( not ( = ?auto_854035 ?auto_854039 ) ) ( not ( = ?auto_854036 ?auto_854037 ) ) ( not ( = ?auto_854036 ?auto_854038 ) ) ( not ( = ?auto_854036 ?auto_854039 ) ) ( not ( = ?auto_854037 ?auto_854038 ) ) ( not ( = ?auto_854037 ?auto_854039 ) ) ( not ( = ?auto_854038 ?auto_854039 ) ) ( ON ?auto_854022 ?auto_854040 ) ( not ( = ?auto_854039 ?auto_854040 ) ) ( not ( = ?auto_854038 ?auto_854040 ) ) ( not ( = ?auto_854037 ?auto_854040 ) ) ( not ( = ?auto_854036 ?auto_854040 ) ) ( not ( = ?auto_854035 ?auto_854040 ) ) ( not ( = ?auto_854034 ?auto_854040 ) ) ( not ( = ?auto_854033 ?auto_854040 ) ) ( not ( = ?auto_854032 ?auto_854040 ) ) ( not ( = ?auto_854031 ?auto_854040 ) ) ( not ( = ?auto_854030 ?auto_854040 ) ) ( not ( = ?auto_854029 ?auto_854040 ) ) ( not ( = ?auto_854028 ?auto_854040 ) ) ( not ( = ?auto_854027 ?auto_854040 ) ) ( not ( = ?auto_854026 ?auto_854040 ) ) ( not ( = ?auto_854025 ?auto_854040 ) ) ( not ( = ?auto_854024 ?auto_854040 ) ) ( not ( = ?auto_854023 ?auto_854040 ) ) ( not ( = ?auto_854022 ?auto_854040 ) ) ( ON ?auto_854023 ?auto_854022 ) ( ON ?auto_854024 ?auto_854023 ) ( ON ?auto_854025 ?auto_854024 ) ( ON ?auto_854026 ?auto_854025 ) ( ON ?auto_854027 ?auto_854026 ) ( ON ?auto_854028 ?auto_854027 ) ( ON ?auto_854029 ?auto_854028 ) ( ON ?auto_854030 ?auto_854029 ) ( ON ?auto_854031 ?auto_854030 ) ( ON ?auto_854032 ?auto_854031 ) ( ON ?auto_854033 ?auto_854032 ) ( ON ?auto_854034 ?auto_854033 ) ( ON ?auto_854035 ?auto_854034 ) ( ON ?auto_854036 ?auto_854035 ) ( ON ?auto_854037 ?auto_854036 ) ( ON ?auto_854038 ?auto_854037 ) ( ON ?auto_854039 ?auto_854038 ) ( CLEAR ?auto_854039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-18PILE ?auto_854039 ?auto_854038 ?auto_854037 ?auto_854036 ?auto_854035 ?auto_854034 ?auto_854033 ?auto_854032 ?auto_854031 ?auto_854030 ?auto_854029 ?auto_854028 ?auto_854027 ?auto_854026 ?auto_854025 ?auto_854024 ?auto_854023 ?auto_854022 )
      ( MAKE-18PILE ?auto_854022 ?auto_854023 ?auto_854024 ?auto_854025 ?auto_854026 ?auto_854027 ?auto_854028 ?auto_854029 ?auto_854030 ?auto_854031 ?auto_854032 ?auto_854033 ?auto_854034 ?auto_854035 ?auto_854036 ?auto_854037 ?auto_854038 ?auto_854039 ) )
  )

)

