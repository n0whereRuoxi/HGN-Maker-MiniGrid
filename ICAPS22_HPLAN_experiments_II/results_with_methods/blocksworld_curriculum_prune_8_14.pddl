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
      ?auto_43339 - BLOCK
    )
    :vars
    (
      ?auto_43340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43339 ?auto_43340 ) ( CLEAR ?auto_43339 ) ( HAND-EMPTY ) ( not ( = ?auto_43339 ?auto_43340 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_43339 ?auto_43340 )
      ( !PUTDOWN ?auto_43339 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43346 - BLOCK
      ?auto_43347 - BLOCK
    )
    :vars
    (
      ?auto_43348 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_43346 ) ( ON ?auto_43347 ?auto_43348 ) ( CLEAR ?auto_43347 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43346 ) ( not ( = ?auto_43346 ?auto_43347 ) ) ( not ( = ?auto_43346 ?auto_43348 ) ) ( not ( = ?auto_43347 ?auto_43348 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_43347 ?auto_43348 )
      ( !STACK ?auto_43347 ?auto_43346 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43356 - BLOCK
      ?auto_43357 - BLOCK
    )
    :vars
    (
      ?auto_43358 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43357 ?auto_43358 ) ( not ( = ?auto_43356 ?auto_43357 ) ) ( not ( = ?auto_43356 ?auto_43358 ) ) ( not ( = ?auto_43357 ?auto_43358 ) ) ( ON ?auto_43356 ?auto_43357 ) ( CLEAR ?auto_43356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43356 )
      ( MAKE-2PILE ?auto_43356 ?auto_43357 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43367 - BLOCK
      ?auto_43368 - BLOCK
      ?auto_43369 - BLOCK
    )
    :vars
    (
      ?auto_43370 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_43368 ) ( ON ?auto_43369 ?auto_43370 ) ( CLEAR ?auto_43369 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43367 ) ( ON ?auto_43368 ?auto_43367 ) ( not ( = ?auto_43367 ?auto_43368 ) ) ( not ( = ?auto_43367 ?auto_43369 ) ) ( not ( = ?auto_43367 ?auto_43370 ) ) ( not ( = ?auto_43368 ?auto_43369 ) ) ( not ( = ?auto_43368 ?auto_43370 ) ) ( not ( = ?auto_43369 ?auto_43370 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_43369 ?auto_43370 )
      ( !STACK ?auto_43369 ?auto_43368 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43381 - BLOCK
      ?auto_43382 - BLOCK
      ?auto_43383 - BLOCK
    )
    :vars
    (
      ?auto_43384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43383 ?auto_43384 ) ( ON-TABLE ?auto_43381 ) ( not ( = ?auto_43381 ?auto_43382 ) ) ( not ( = ?auto_43381 ?auto_43383 ) ) ( not ( = ?auto_43381 ?auto_43384 ) ) ( not ( = ?auto_43382 ?auto_43383 ) ) ( not ( = ?auto_43382 ?auto_43384 ) ) ( not ( = ?auto_43383 ?auto_43384 ) ) ( CLEAR ?auto_43381 ) ( ON ?auto_43382 ?auto_43383 ) ( CLEAR ?auto_43382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43381 ?auto_43382 )
      ( MAKE-3PILE ?auto_43381 ?auto_43382 ?auto_43383 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43395 - BLOCK
      ?auto_43396 - BLOCK
      ?auto_43397 - BLOCK
    )
    :vars
    (
      ?auto_43398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43397 ?auto_43398 ) ( not ( = ?auto_43395 ?auto_43396 ) ) ( not ( = ?auto_43395 ?auto_43397 ) ) ( not ( = ?auto_43395 ?auto_43398 ) ) ( not ( = ?auto_43396 ?auto_43397 ) ) ( not ( = ?auto_43396 ?auto_43398 ) ) ( not ( = ?auto_43397 ?auto_43398 ) ) ( ON ?auto_43396 ?auto_43397 ) ( ON ?auto_43395 ?auto_43396 ) ( CLEAR ?auto_43395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43395 )
      ( MAKE-3PILE ?auto_43395 ?auto_43396 ?auto_43397 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43410 - BLOCK
      ?auto_43411 - BLOCK
      ?auto_43412 - BLOCK
      ?auto_43413 - BLOCK
    )
    :vars
    (
      ?auto_43414 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_43412 ) ( ON ?auto_43413 ?auto_43414 ) ( CLEAR ?auto_43413 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43410 ) ( ON ?auto_43411 ?auto_43410 ) ( ON ?auto_43412 ?auto_43411 ) ( not ( = ?auto_43410 ?auto_43411 ) ) ( not ( = ?auto_43410 ?auto_43412 ) ) ( not ( = ?auto_43410 ?auto_43413 ) ) ( not ( = ?auto_43410 ?auto_43414 ) ) ( not ( = ?auto_43411 ?auto_43412 ) ) ( not ( = ?auto_43411 ?auto_43413 ) ) ( not ( = ?auto_43411 ?auto_43414 ) ) ( not ( = ?auto_43412 ?auto_43413 ) ) ( not ( = ?auto_43412 ?auto_43414 ) ) ( not ( = ?auto_43413 ?auto_43414 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_43413 ?auto_43414 )
      ( !STACK ?auto_43413 ?auto_43412 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43428 - BLOCK
      ?auto_43429 - BLOCK
      ?auto_43430 - BLOCK
      ?auto_43431 - BLOCK
    )
    :vars
    (
      ?auto_43432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43431 ?auto_43432 ) ( ON-TABLE ?auto_43428 ) ( ON ?auto_43429 ?auto_43428 ) ( not ( = ?auto_43428 ?auto_43429 ) ) ( not ( = ?auto_43428 ?auto_43430 ) ) ( not ( = ?auto_43428 ?auto_43431 ) ) ( not ( = ?auto_43428 ?auto_43432 ) ) ( not ( = ?auto_43429 ?auto_43430 ) ) ( not ( = ?auto_43429 ?auto_43431 ) ) ( not ( = ?auto_43429 ?auto_43432 ) ) ( not ( = ?auto_43430 ?auto_43431 ) ) ( not ( = ?auto_43430 ?auto_43432 ) ) ( not ( = ?auto_43431 ?auto_43432 ) ) ( CLEAR ?auto_43429 ) ( ON ?auto_43430 ?auto_43431 ) ( CLEAR ?auto_43430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43428 ?auto_43429 ?auto_43430 )
      ( MAKE-4PILE ?auto_43428 ?auto_43429 ?auto_43430 ?auto_43431 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43446 - BLOCK
      ?auto_43447 - BLOCK
      ?auto_43448 - BLOCK
      ?auto_43449 - BLOCK
    )
    :vars
    (
      ?auto_43450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43449 ?auto_43450 ) ( ON-TABLE ?auto_43446 ) ( not ( = ?auto_43446 ?auto_43447 ) ) ( not ( = ?auto_43446 ?auto_43448 ) ) ( not ( = ?auto_43446 ?auto_43449 ) ) ( not ( = ?auto_43446 ?auto_43450 ) ) ( not ( = ?auto_43447 ?auto_43448 ) ) ( not ( = ?auto_43447 ?auto_43449 ) ) ( not ( = ?auto_43447 ?auto_43450 ) ) ( not ( = ?auto_43448 ?auto_43449 ) ) ( not ( = ?auto_43448 ?auto_43450 ) ) ( not ( = ?auto_43449 ?auto_43450 ) ) ( ON ?auto_43448 ?auto_43449 ) ( CLEAR ?auto_43446 ) ( ON ?auto_43447 ?auto_43448 ) ( CLEAR ?auto_43447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43446 ?auto_43447 )
      ( MAKE-4PILE ?auto_43446 ?auto_43447 ?auto_43448 ?auto_43449 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43464 - BLOCK
      ?auto_43465 - BLOCK
      ?auto_43466 - BLOCK
      ?auto_43467 - BLOCK
    )
    :vars
    (
      ?auto_43468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43467 ?auto_43468 ) ( not ( = ?auto_43464 ?auto_43465 ) ) ( not ( = ?auto_43464 ?auto_43466 ) ) ( not ( = ?auto_43464 ?auto_43467 ) ) ( not ( = ?auto_43464 ?auto_43468 ) ) ( not ( = ?auto_43465 ?auto_43466 ) ) ( not ( = ?auto_43465 ?auto_43467 ) ) ( not ( = ?auto_43465 ?auto_43468 ) ) ( not ( = ?auto_43466 ?auto_43467 ) ) ( not ( = ?auto_43466 ?auto_43468 ) ) ( not ( = ?auto_43467 ?auto_43468 ) ) ( ON ?auto_43466 ?auto_43467 ) ( ON ?auto_43465 ?auto_43466 ) ( ON ?auto_43464 ?auto_43465 ) ( CLEAR ?auto_43464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43464 )
      ( MAKE-4PILE ?auto_43464 ?auto_43465 ?auto_43466 ?auto_43467 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43483 - BLOCK
      ?auto_43484 - BLOCK
      ?auto_43485 - BLOCK
      ?auto_43486 - BLOCK
      ?auto_43487 - BLOCK
    )
    :vars
    (
      ?auto_43488 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_43486 ) ( ON ?auto_43487 ?auto_43488 ) ( CLEAR ?auto_43487 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43483 ) ( ON ?auto_43484 ?auto_43483 ) ( ON ?auto_43485 ?auto_43484 ) ( ON ?auto_43486 ?auto_43485 ) ( not ( = ?auto_43483 ?auto_43484 ) ) ( not ( = ?auto_43483 ?auto_43485 ) ) ( not ( = ?auto_43483 ?auto_43486 ) ) ( not ( = ?auto_43483 ?auto_43487 ) ) ( not ( = ?auto_43483 ?auto_43488 ) ) ( not ( = ?auto_43484 ?auto_43485 ) ) ( not ( = ?auto_43484 ?auto_43486 ) ) ( not ( = ?auto_43484 ?auto_43487 ) ) ( not ( = ?auto_43484 ?auto_43488 ) ) ( not ( = ?auto_43485 ?auto_43486 ) ) ( not ( = ?auto_43485 ?auto_43487 ) ) ( not ( = ?auto_43485 ?auto_43488 ) ) ( not ( = ?auto_43486 ?auto_43487 ) ) ( not ( = ?auto_43486 ?auto_43488 ) ) ( not ( = ?auto_43487 ?auto_43488 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_43487 ?auto_43488 )
      ( !STACK ?auto_43487 ?auto_43486 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43505 - BLOCK
      ?auto_43506 - BLOCK
      ?auto_43507 - BLOCK
      ?auto_43508 - BLOCK
      ?auto_43509 - BLOCK
    )
    :vars
    (
      ?auto_43510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43509 ?auto_43510 ) ( ON-TABLE ?auto_43505 ) ( ON ?auto_43506 ?auto_43505 ) ( ON ?auto_43507 ?auto_43506 ) ( not ( = ?auto_43505 ?auto_43506 ) ) ( not ( = ?auto_43505 ?auto_43507 ) ) ( not ( = ?auto_43505 ?auto_43508 ) ) ( not ( = ?auto_43505 ?auto_43509 ) ) ( not ( = ?auto_43505 ?auto_43510 ) ) ( not ( = ?auto_43506 ?auto_43507 ) ) ( not ( = ?auto_43506 ?auto_43508 ) ) ( not ( = ?auto_43506 ?auto_43509 ) ) ( not ( = ?auto_43506 ?auto_43510 ) ) ( not ( = ?auto_43507 ?auto_43508 ) ) ( not ( = ?auto_43507 ?auto_43509 ) ) ( not ( = ?auto_43507 ?auto_43510 ) ) ( not ( = ?auto_43508 ?auto_43509 ) ) ( not ( = ?auto_43508 ?auto_43510 ) ) ( not ( = ?auto_43509 ?auto_43510 ) ) ( CLEAR ?auto_43507 ) ( ON ?auto_43508 ?auto_43509 ) ( CLEAR ?auto_43508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43505 ?auto_43506 ?auto_43507 ?auto_43508 )
      ( MAKE-5PILE ?auto_43505 ?auto_43506 ?auto_43507 ?auto_43508 ?auto_43509 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43527 - BLOCK
      ?auto_43528 - BLOCK
      ?auto_43529 - BLOCK
      ?auto_43530 - BLOCK
      ?auto_43531 - BLOCK
    )
    :vars
    (
      ?auto_43532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43531 ?auto_43532 ) ( ON-TABLE ?auto_43527 ) ( ON ?auto_43528 ?auto_43527 ) ( not ( = ?auto_43527 ?auto_43528 ) ) ( not ( = ?auto_43527 ?auto_43529 ) ) ( not ( = ?auto_43527 ?auto_43530 ) ) ( not ( = ?auto_43527 ?auto_43531 ) ) ( not ( = ?auto_43527 ?auto_43532 ) ) ( not ( = ?auto_43528 ?auto_43529 ) ) ( not ( = ?auto_43528 ?auto_43530 ) ) ( not ( = ?auto_43528 ?auto_43531 ) ) ( not ( = ?auto_43528 ?auto_43532 ) ) ( not ( = ?auto_43529 ?auto_43530 ) ) ( not ( = ?auto_43529 ?auto_43531 ) ) ( not ( = ?auto_43529 ?auto_43532 ) ) ( not ( = ?auto_43530 ?auto_43531 ) ) ( not ( = ?auto_43530 ?auto_43532 ) ) ( not ( = ?auto_43531 ?auto_43532 ) ) ( ON ?auto_43530 ?auto_43531 ) ( CLEAR ?auto_43528 ) ( ON ?auto_43529 ?auto_43530 ) ( CLEAR ?auto_43529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43527 ?auto_43528 ?auto_43529 )
      ( MAKE-5PILE ?auto_43527 ?auto_43528 ?auto_43529 ?auto_43530 ?auto_43531 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43549 - BLOCK
      ?auto_43550 - BLOCK
      ?auto_43551 - BLOCK
      ?auto_43552 - BLOCK
      ?auto_43553 - BLOCK
    )
    :vars
    (
      ?auto_43554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43553 ?auto_43554 ) ( ON-TABLE ?auto_43549 ) ( not ( = ?auto_43549 ?auto_43550 ) ) ( not ( = ?auto_43549 ?auto_43551 ) ) ( not ( = ?auto_43549 ?auto_43552 ) ) ( not ( = ?auto_43549 ?auto_43553 ) ) ( not ( = ?auto_43549 ?auto_43554 ) ) ( not ( = ?auto_43550 ?auto_43551 ) ) ( not ( = ?auto_43550 ?auto_43552 ) ) ( not ( = ?auto_43550 ?auto_43553 ) ) ( not ( = ?auto_43550 ?auto_43554 ) ) ( not ( = ?auto_43551 ?auto_43552 ) ) ( not ( = ?auto_43551 ?auto_43553 ) ) ( not ( = ?auto_43551 ?auto_43554 ) ) ( not ( = ?auto_43552 ?auto_43553 ) ) ( not ( = ?auto_43552 ?auto_43554 ) ) ( not ( = ?auto_43553 ?auto_43554 ) ) ( ON ?auto_43552 ?auto_43553 ) ( ON ?auto_43551 ?auto_43552 ) ( CLEAR ?auto_43549 ) ( ON ?auto_43550 ?auto_43551 ) ( CLEAR ?auto_43550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43549 ?auto_43550 )
      ( MAKE-5PILE ?auto_43549 ?auto_43550 ?auto_43551 ?auto_43552 ?auto_43553 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43571 - BLOCK
      ?auto_43572 - BLOCK
      ?auto_43573 - BLOCK
      ?auto_43574 - BLOCK
      ?auto_43575 - BLOCK
    )
    :vars
    (
      ?auto_43576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43575 ?auto_43576 ) ( not ( = ?auto_43571 ?auto_43572 ) ) ( not ( = ?auto_43571 ?auto_43573 ) ) ( not ( = ?auto_43571 ?auto_43574 ) ) ( not ( = ?auto_43571 ?auto_43575 ) ) ( not ( = ?auto_43571 ?auto_43576 ) ) ( not ( = ?auto_43572 ?auto_43573 ) ) ( not ( = ?auto_43572 ?auto_43574 ) ) ( not ( = ?auto_43572 ?auto_43575 ) ) ( not ( = ?auto_43572 ?auto_43576 ) ) ( not ( = ?auto_43573 ?auto_43574 ) ) ( not ( = ?auto_43573 ?auto_43575 ) ) ( not ( = ?auto_43573 ?auto_43576 ) ) ( not ( = ?auto_43574 ?auto_43575 ) ) ( not ( = ?auto_43574 ?auto_43576 ) ) ( not ( = ?auto_43575 ?auto_43576 ) ) ( ON ?auto_43574 ?auto_43575 ) ( ON ?auto_43573 ?auto_43574 ) ( ON ?auto_43572 ?auto_43573 ) ( ON ?auto_43571 ?auto_43572 ) ( CLEAR ?auto_43571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43571 )
      ( MAKE-5PILE ?auto_43571 ?auto_43572 ?auto_43573 ?auto_43574 ?auto_43575 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_43594 - BLOCK
      ?auto_43595 - BLOCK
      ?auto_43596 - BLOCK
      ?auto_43597 - BLOCK
      ?auto_43598 - BLOCK
      ?auto_43599 - BLOCK
    )
    :vars
    (
      ?auto_43600 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_43598 ) ( ON ?auto_43599 ?auto_43600 ) ( CLEAR ?auto_43599 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43594 ) ( ON ?auto_43595 ?auto_43594 ) ( ON ?auto_43596 ?auto_43595 ) ( ON ?auto_43597 ?auto_43596 ) ( ON ?auto_43598 ?auto_43597 ) ( not ( = ?auto_43594 ?auto_43595 ) ) ( not ( = ?auto_43594 ?auto_43596 ) ) ( not ( = ?auto_43594 ?auto_43597 ) ) ( not ( = ?auto_43594 ?auto_43598 ) ) ( not ( = ?auto_43594 ?auto_43599 ) ) ( not ( = ?auto_43594 ?auto_43600 ) ) ( not ( = ?auto_43595 ?auto_43596 ) ) ( not ( = ?auto_43595 ?auto_43597 ) ) ( not ( = ?auto_43595 ?auto_43598 ) ) ( not ( = ?auto_43595 ?auto_43599 ) ) ( not ( = ?auto_43595 ?auto_43600 ) ) ( not ( = ?auto_43596 ?auto_43597 ) ) ( not ( = ?auto_43596 ?auto_43598 ) ) ( not ( = ?auto_43596 ?auto_43599 ) ) ( not ( = ?auto_43596 ?auto_43600 ) ) ( not ( = ?auto_43597 ?auto_43598 ) ) ( not ( = ?auto_43597 ?auto_43599 ) ) ( not ( = ?auto_43597 ?auto_43600 ) ) ( not ( = ?auto_43598 ?auto_43599 ) ) ( not ( = ?auto_43598 ?auto_43600 ) ) ( not ( = ?auto_43599 ?auto_43600 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_43599 ?auto_43600 )
      ( !STACK ?auto_43599 ?auto_43598 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_43620 - BLOCK
      ?auto_43621 - BLOCK
      ?auto_43622 - BLOCK
      ?auto_43623 - BLOCK
      ?auto_43624 - BLOCK
      ?auto_43625 - BLOCK
    )
    :vars
    (
      ?auto_43626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43625 ?auto_43626 ) ( ON-TABLE ?auto_43620 ) ( ON ?auto_43621 ?auto_43620 ) ( ON ?auto_43622 ?auto_43621 ) ( ON ?auto_43623 ?auto_43622 ) ( not ( = ?auto_43620 ?auto_43621 ) ) ( not ( = ?auto_43620 ?auto_43622 ) ) ( not ( = ?auto_43620 ?auto_43623 ) ) ( not ( = ?auto_43620 ?auto_43624 ) ) ( not ( = ?auto_43620 ?auto_43625 ) ) ( not ( = ?auto_43620 ?auto_43626 ) ) ( not ( = ?auto_43621 ?auto_43622 ) ) ( not ( = ?auto_43621 ?auto_43623 ) ) ( not ( = ?auto_43621 ?auto_43624 ) ) ( not ( = ?auto_43621 ?auto_43625 ) ) ( not ( = ?auto_43621 ?auto_43626 ) ) ( not ( = ?auto_43622 ?auto_43623 ) ) ( not ( = ?auto_43622 ?auto_43624 ) ) ( not ( = ?auto_43622 ?auto_43625 ) ) ( not ( = ?auto_43622 ?auto_43626 ) ) ( not ( = ?auto_43623 ?auto_43624 ) ) ( not ( = ?auto_43623 ?auto_43625 ) ) ( not ( = ?auto_43623 ?auto_43626 ) ) ( not ( = ?auto_43624 ?auto_43625 ) ) ( not ( = ?auto_43624 ?auto_43626 ) ) ( not ( = ?auto_43625 ?auto_43626 ) ) ( CLEAR ?auto_43623 ) ( ON ?auto_43624 ?auto_43625 ) ( CLEAR ?auto_43624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43620 ?auto_43621 ?auto_43622 ?auto_43623 ?auto_43624 )
      ( MAKE-6PILE ?auto_43620 ?auto_43621 ?auto_43622 ?auto_43623 ?auto_43624 ?auto_43625 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_43646 - BLOCK
      ?auto_43647 - BLOCK
      ?auto_43648 - BLOCK
      ?auto_43649 - BLOCK
      ?auto_43650 - BLOCK
      ?auto_43651 - BLOCK
    )
    :vars
    (
      ?auto_43652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43651 ?auto_43652 ) ( ON-TABLE ?auto_43646 ) ( ON ?auto_43647 ?auto_43646 ) ( ON ?auto_43648 ?auto_43647 ) ( not ( = ?auto_43646 ?auto_43647 ) ) ( not ( = ?auto_43646 ?auto_43648 ) ) ( not ( = ?auto_43646 ?auto_43649 ) ) ( not ( = ?auto_43646 ?auto_43650 ) ) ( not ( = ?auto_43646 ?auto_43651 ) ) ( not ( = ?auto_43646 ?auto_43652 ) ) ( not ( = ?auto_43647 ?auto_43648 ) ) ( not ( = ?auto_43647 ?auto_43649 ) ) ( not ( = ?auto_43647 ?auto_43650 ) ) ( not ( = ?auto_43647 ?auto_43651 ) ) ( not ( = ?auto_43647 ?auto_43652 ) ) ( not ( = ?auto_43648 ?auto_43649 ) ) ( not ( = ?auto_43648 ?auto_43650 ) ) ( not ( = ?auto_43648 ?auto_43651 ) ) ( not ( = ?auto_43648 ?auto_43652 ) ) ( not ( = ?auto_43649 ?auto_43650 ) ) ( not ( = ?auto_43649 ?auto_43651 ) ) ( not ( = ?auto_43649 ?auto_43652 ) ) ( not ( = ?auto_43650 ?auto_43651 ) ) ( not ( = ?auto_43650 ?auto_43652 ) ) ( not ( = ?auto_43651 ?auto_43652 ) ) ( ON ?auto_43650 ?auto_43651 ) ( CLEAR ?auto_43648 ) ( ON ?auto_43649 ?auto_43650 ) ( CLEAR ?auto_43649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43646 ?auto_43647 ?auto_43648 ?auto_43649 )
      ( MAKE-6PILE ?auto_43646 ?auto_43647 ?auto_43648 ?auto_43649 ?auto_43650 ?auto_43651 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_43672 - BLOCK
      ?auto_43673 - BLOCK
      ?auto_43674 - BLOCK
      ?auto_43675 - BLOCK
      ?auto_43676 - BLOCK
      ?auto_43677 - BLOCK
    )
    :vars
    (
      ?auto_43678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43677 ?auto_43678 ) ( ON-TABLE ?auto_43672 ) ( ON ?auto_43673 ?auto_43672 ) ( not ( = ?auto_43672 ?auto_43673 ) ) ( not ( = ?auto_43672 ?auto_43674 ) ) ( not ( = ?auto_43672 ?auto_43675 ) ) ( not ( = ?auto_43672 ?auto_43676 ) ) ( not ( = ?auto_43672 ?auto_43677 ) ) ( not ( = ?auto_43672 ?auto_43678 ) ) ( not ( = ?auto_43673 ?auto_43674 ) ) ( not ( = ?auto_43673 ?auto_43675 ) ) ( not ( = ?auto_43673 ?auto_43676 ) ) ( not ( = ?auto_43673 ?auto_43677 ) ) ( not ( = ?auto_43673 ?auto_43678 ) ) ( not ( = ?auto_43674 ?auto_43675 ) ) ( not ( = ?auto_43674 ?auto_43676 ) ) ( not ( = ?auto_43674 ?auto_43677 ) ) ( not ( = ?auto_43674 ?auto_43678 ) ) ( not ( = ?auto_43675 ?auto_43676 ) ) ( not ( = ?auto_43675 ?auto_43677 ) ) ( not ( = ?auto_43675 ?auto_43678 ) ) ( not ( = ?auto_43676 ?auto_43677 ) ) ( not ( = ?auto_43676 ?auto_43678 ) ) ( not ( = ?auto_43677 ?auto_43678 ) ) ( ON ?auto_43676 ?auto_43677 ) ( ON ?auto_43675 ?auto_43676 ) ( CLEAR ?auto_43673 ) ( ON ?auto_43674 ?auto_43675 ) ( CLEAR ?auto_43674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43672 ?auto_43673 ?auto_43674 )
      ( MAKE-6PILE ?auto_43672 ?auto_43673 ?auto_43674 ?auto_43675 ?auto_43676 ?auto_43677 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_43698 - BLOCK
      ?auto_43699 - BLOCK
      ?auto_43700 - BLOCK
      ?auto_43701 - BLOCK
      ?auto_43702 - BLOCK
      ?auto_43703 - BLOCK
    )
    :vars
    (
      ?auto_43704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43703 ?auto_43704 ) ( ON-TABLE ?auto_43698 ) ( not ( = ?auto_43698 ?auto_43699 ) ) ( not ( = ?auto_43698 ?auto_43700 ) ) ( not ( = ?auto_43698 ?auto_43701 ) ) ( not ( = ?auto_43698 ?auto_43702 ) ) ( not ( = ?auto_43698 ?auto_43703 ) ) ( not ( = ?auto_43698 ?auto_43704 ) ) ( not ( = ?auto_43699 ?auto_43700 ) ) ( not ( = ?auto_43699 ?auto_43701 ) ) ( not ( = ?auto_43699 ?auto_43702 ) ) ( not ( = ?auto_43699 ?auto_43703 ) ) ( not ( = ?auto_43699 ?auto_43704 ) ) ( not ( = ?auto_43700 ?auto_43701 ) ) ( not ( = ?auto_43700 ?auto_43702 ) ) ( not ( = ?auto_43700 ?auto_43703 ) ) ( not ( = ?auto_43700 ?auto_43704 ) ) ( not ( = ?auto_43701 ?auto_43702 ) ) ( not ( = ?auto_43701 ?auto_43703 ) ) ( not ( = ?auto_43701 ?auto_43704 ) ) ( not ( = ?auto_43702 ?auto_43703 ) ) ( not ( = ?auto_43702 ?auto_43704 ) ) ( not ( = ?auto_43703 ?auto_43704 ) ) ( ON ?auto_43702 ?auto_43703 ) ( ON ?auto_43701 ?auto_43702 ) ( ON ?auto_43700 ?auto_43701 ) ( CLEAR ?auto_43698 ) ( ON ?auto_43699 ?auto_43700 ) ( CLEAR ?auto_43699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43698 ?auto_43699 )
      ( MAKE-6PILE ?auto_43698 ?auto_43699 ?auto_43700 ?auto_43701 ?auto_43702 ?auto_43703 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_43724 - BLOCK
      ?auto_43725 - BLOCK
      ?auto_43726 - BLOCK
      ?auto_43727 - BLOCK
      ?auto_43728 - BLOCK
      ?auto_43729 - BLOCK
    )
    :vars
    (
      ?auto_43730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43729 ?auto_43730 ) ( not ( = ?auto_43724 ?auto_43725 ) ) ( not ( = ?auto_43724 ?auto_43726 ) ) ( not ( = ?auto_43724 ?auto_43727 ) ) ( not ( = ?auto_43724 ?auto_43728 ) ) ( not ( = ?auto_43724 ?auto_43729 ) ) ( not ( = ?auto_43724 ?auto_43730 ) ) ( not ( = ?auto_43725 ?auto_43726 ) ) ( not ( = ?auto_43725 ?auto_43727 ) ) ( not ( = ?auto_43725 ?auto_43728 ) ) ( not ( = ?auto_43725 ?auto_43729 ) ) ( not ( = ?auto_43725 ?auto_43730 ) ) ( not ( = ?auto_43726 ?auto_43727 ) ) ( not ( = ?auto_43726 ?auto_43728 ) ) ( not ( = ?auto_43726 ?auto_43729 ) ) ( not ( = ?auto_43726 ?auto_43730 ) ) ( not ( = ?auto_43727 ?auto_43728 ) ) ( not ( = ?auto_43727 ?auto_43729 ) ) ( not ( = ?auto_43727 ?auto_43730 ) ) ( not ( = ?auto_43728 ?auto_43729 ) ) ( not ( = ?auto_43728 ?auto_43730 ) ) ( not ( = ?auto_43729 ?auto_43730 ) ) ( ON ?auto_43728 ?auto_43729 ) ( ON ?auto_43727 ?auto_43728 ) ( ON ?auto_43726 ?auto_43727 ) ( ON ?auto_43725 ?auto_43726 ) ( ON ?auto_43724 ?auto_43725 ) ( CLEAR ?auto_43724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43724 )
      ( MAKE-6PILE ?auto_43724 ?auto_43725 ?auto_43726 ?auto_43727 ?auto_43728 ?auto_43729 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_43751 - BLOCK
      ?auto_43752 - BLOCK
      ?auto_43753 - BLOCK
      ?auto_43754 - BLOCK
      ?auto_43755 - BLOCK
      ?auto_43756 - BLOCK
      ?auto_43757 - BLOCK
    )
    :vars
    (
      ?auto_43758 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_43756 ) ( ON ?auto_43757 ?auto_43758 ) ( CLEAR ?auto_43757 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43751 ) ( ON ?auto_43752 ?auto_43751 ) ( ON ?auto_43753 ?auto_43752 ) ( ON ?auto_43754 ?auto_43753 ) ( ON ?auto_43755 ?auto_43754 ) ( ON ?auto_43756 ?auto_43755 ) ( not ( = ?auto_43751 ?auto_43752 ) ) ( not ( = ?auto_43751 ?auto_43753 ) ) ( not ( = ?auto_43751 ?auto_43754 ) ) ( not ( = ?auto_43751 ?auto_43755 ) ) ( not ( = ?auto_43751 ?auto_43756 ) ) ( not ( = ?auto_43751 ?auto_43757 ) ) ( not ( = ?auto_43751 ?auto_43758 ) ) ( not ( = ?auto_43752 ?auto_43753 ) ) ( not ( = ?auto_43752 ?auto_43754 ) ) ( not ( = ?auto_43752 ?auto_43755 ) ) ( not ( = ?auto_43752 ?auto_43756 ) ) ( not ( = ?auto_43752 ?auto_43757 ) ) ( not ( = ?auto_43752 ?auto_43758 ) ) ( not ( = ?auto_43753 ?auto_43754 ) ) ( not ( = ?auto_43753 ?auto_43755 ) ) ( not ( = ?auto_43753 ?auto_43756 ) ) ( not ( = ?auto_43753 ?auto_43757 ) ) ( not ( = ?auto_43753 ?auto_43758 ) ) ( not ( = ?auto_43754 ?auto_43755 ) ) ( not ( = ?auto_43754 ?auto_43756 ) ) ( not ( = ?auto_43754 ?auto_43757 ) ) ( not ( = ?auto_43754 ?auto_43758 ) ) ( not ( = ?auto_43755 ?auto_43756 ) ) ( not ( = ?auto_43755 ?auto_43757 ) ) ( not ( = ?auto_43755 ?auto_43758 ) ) ( not ( = ?auto_43756 ?auto_43757 ) ) ( not ( = ?auto_43756 ?auto_43758 ) ) ( not ( = ?auto_43757 ?auto_43758 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_43757 ?auto_43758 )
      ( !STACK ?auto_43757 ?auto_43756 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_43781 - BLOCK
      ?auto_43782 - BLOCK
      ?auto_43783 - BLOCK
      ?auto_43784 - BLOCK
      ?auto_43785 - BLOCK
      ?auto_43786 - BLOCK
      ?auto_43787 - BLOCK
    )
    :vars
    (
      ?auto_43788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43787 ?auto_43788 ) ( ON-TABLE ?auto_43781 ) ( ON ?auto_43782 ?auto_43781 ) ( ON ?auto_43783 ?auto_43782 ) ( ON ?auto_43784 ?auto_43783 ) ( ON ?auto_43785 ?auto_43784 ) ( not ( = ?auto_43781 ?auto_43782 ) ) ( not ( = ?auto_43781 ?auto_43783 ) ) ( not ( = ?auto_43781 ?auto_43784 ) ) ( not ( = ?auto_43781 ?auto_43785 ) ) ( not ( = ?auto_43781 ?auto_43786 ) ) ( not ( = ?auto_43781 ?auto_43787 ) ) ( not ( = ?auto_43781 ?auto_43788 ) ) ( not ( = ?auto_43782 ?auto_43783 ) ) ( not ( = ?auto_43782 ?auto_43784 ) ) ( not ( = ?auto_43782 ?auto_43785 ) ) ( not ( = ?auto_43782 ?auto_43786 ) ) ( not ( = ?auto_43782 ?auto_43787 ) ) ( not ( = ?auto_43782 ?auto_43788 ) ) ( not ( = ?auto_43783 ?auto_43784 ) ) ( not ( = ?auto_43783 ?auto_43785 ) ) ( not ( = ?auto_43783 ?auto_43786 ) ) ( not ( = ?auto_43783 ?auto_43787 ) ) ( not ( = ?auto_43783 ?auto_43788 ) ) ( not ( = ?auto_43784 ?auto_43785 ) ) ( not ( = ?auto_43784 ?auto_43786 ) ) ( not ( = ?auto_43784 ?auto_43787 ) ) ( not ( = ?auto_43784 ?auto_43788 ) ) ( not ( = ?auto_43785 ?auto_43786 ) ) ( not ( = ?auto_43785 ?auto_43787 ) ) ( not ( = ?auto_43785 ?auto_43788 ) ) ( not ( = ?auto_43786 ?auto_43787 ) ) ( not ( = ?auto_43786 ?auto_43788 ) ) ( not ( = ?auto_43787 ?auto_43788 ) ) ( CLEAR ?auto_43785 ) ( ON ?auto_43786 ?auto_43787 ) ( CLEAR ?auto_43786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_43781 ?auto_43782 ?auto_43783 ?auto_43784 ?auto_43785 ?auto_43786 )
      ( MAKE-7PILE ?auto_43781 ?auto_43782 ?auto_43783 ?auto_43784 ?auto_43785 ?auto_43786 ?auto_43787 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_43811 - BLOCK
      ?auto_43812 - BLOCK
      ?auto_43813 - BLOCK
      ?auto_43814 - BLOCK
      ?auto_43815 - BLOCK
      ?auto_43816 - BLOCK
      ?auto_43817 - BLOCK
    )
    :vars
    (
      ?auto_43818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43817 ?auto_43818 ) ( ON-TABLE ?auto_43811 ) ( ON ?auto_43812 ?auto_43811 ) ( ON ?auto_43813 ?auto_43812 ) ( ON ?auto_43814 ?auto_43813 ) ( not ( = ?auto_43811 ?auto_43812 ) ) ( not ( = ?auto_43811 ?auto_43813 ) ) ( not ( = ?auto_43811 ?auto_43814 ) ) ( not ( = ?auto_43811 ?auto_43815 ) ) ( not ( = ?auto_43811 ?auto_43816 ) ) ( not ( = ?auto_43811 ?auto_43817 ) ) ( not ( = ?auto_43811 ?auto_43818 ) ) ( not ( = ?auto_43812 ?auto_43813 ) ) ( not ( = ?auto_43812 ?auto_43814 ) ) ( not ( = ?auto_43812 ?auto_43815 ) ) ( not ( = ?auto_43812 ?auto_43816 ) ) ( not ( = ?auto_43812 ?auto_43817 ) ) ( not ( = ?auto_43812 ?auto_43818 ) ) ( not ( = ?auto_43813 ?auto_43814 ) ) ( not ( = ?auto_43813 ?auto_43815 ) ) ( not ( = ?auto_43813 ?auto_43816 ) ) ( not ( = ?auto_43813 ?auto_43817 ) ) ( not ( = ?auto_43813 ?auto_43818 ) ) ( not ( = ?auto_43814 ?auto_43815 ) ) ( not ( = ?auto_43814 ?auto_43816 ) ) ( not ( = ?auto_43814 ?auto_43817 ) ) ( not ( = ?auto_43814 ?auto_43818 ) ) ( not ( = ?auto_43815 ?auto_43816 ) ) ( not ( = ?auto_43815 ?auto_43817 ) ) ( not ( = ?auto_43815 ?auto_43818 ) ) ( not ( = ?auto_43816 ?auto_43817 ) ) ( not ( = ?auto_43816 ?auto_43818 ) ) ( not ( = ?auto_43817 ?auto_43818 ) ) ( ON ?auto_43816 ?auto_43817 ) ( CLEAR ?auto_43814 ) ( ON ?auto_43815 ?auto_43816 ) ( CLEAR ?auto_43815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43811 ?auto_43812 ?auto_43813 ?auto_43814 ?auto_43815 )
      ( MAKE-7PILE ?auto_43811 ?auto_43812 ?auto_43813 ?auto_43814 ?auto_43815 ?auto_43816 ?auto_43817 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_43841 - BLOCK
      ?auto_43842 - BLOCK
      ?auto_43843 - BLOCK
      ?auto_43844 - BLOCK
      ?auto_43845 - BLOCK
      ?auto_43846 - BLOCK
      ?auto_43847 - BLOCK
    )
    :vars
    (
      ?auto_43848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43847 ?auto_43848 ) ( ON-TABLE ?auto_43841 ) ( ON ?auto_43842 ?auto_43841 ) ( ON ?auto_43843 ?auto_43842 ) ( not ( = ?auto_43841 ?auto_43842 ) ) ( not ( = ?auto_43841 ?auto_43843 ) ) ( not ( = ?auto_43841 ?auto_43844 ) ) ( not ( = ?auto_43841 ?auto_43845 ) ) ( not ( = ?auto_43841 ?auto_43846 ) ) ( not ( = ?auto_43841 ?auto_43847 ) ) ( not ( = ?auto_43841 ?auto_43848 ) ) ( not ( = ?auto_43842 ?auto_43843 ) ) ( not ( = ?auto_43842 ?auto_43844 ) ) ( not ( = ?auto_43842 ?auto_43845 ) ) ( not ( = ?auto_43842 ?auto_43846 ) ) ( not ( = ?auto_43842 ?auto_43847 ) ) ( not ( = ?auto_43842 ?auto_43848 ) ) ( not ( = ?auto_43843 ?auto_43844 ) ) ( not ( = ?auto_43843 ?auto_43845 ) ) ( not ( = ?auto_43843 ?auto_43846 ) ) ( not ( = ?auto_43843 ?auto_43847 ) ) ( not ( = ?auto_43843 ?auto_43848 ) ) ( not ( = ?auto_43844 ?auto_43845 ) ) ( not ( = ?auto_43844 ?auto_43846 ) ) ( not ( = ?auto_43844 ?auto_43847 ) ) ( not ( = ?auto_43844 ?auto_43848 ) ) ( not ( = ?auto_43845 ?auto_43846 ) ) ( not ( = ?auto_43845 ?auto_43847 ) ) ( not ( = ?auto_43845 ?auto_43848 ) ) ( not ( = ?auto_43846 ?auto_43847 ) ) ( not ( = ?auto_43846 ?auto_43848 ) ) ( not ( = ?auto_43847 ?auto_43848 ) ) ( ON ?auto_43846 ?auto_43847 ) ( ON ?auto_43845 ?auto_43846 ) ( CLEAR ?auto_43843 ) ( ON ?auto_43844 ?auto_43845 ) ( CLEAR ?auto_43844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43841 ?auto_43842 ?auto_43843 ?auto_43844 )
      ( MAKE-7PILE ?auto_43841 ?auto_43842 ?auto_43843 ?auto_43844 ?auto_43845 ?auto_43846 ?auto_43847 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_43871 - BLOCK
      ?auto_43872 - BLOCK
      ?auto_43873 - BLOCK
      ?auto_43874 - BLOCK
      ?auto_43875 - BLOCK
      ?auto_43876 - BLOCK
      ?auto_43877 - BLOCK
    )
    :vars
    (
      ?auto_43878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43877 ?auto_43878 ) ( ON-TABLE ?auto_43871 ) ( ON ?auto_43872 ?auto_43871 ) ( not ( = ?auto_43871 ?auto_43872 ) ) ( not ( = ?auto_43871 ?auto_43873 ) ) ( not ( = ?auto_43871 ?auto_43874 ) ) ( not ( = ?auto_43871 ?auto_43875 ) ) ( not ( = ?auto_43871 ?auto_43876 ) ) ( not ( = ?auto_43871 ?auto_43877 ) ) ( not ( = ?auto_43871 ?auto_43878 ) ) ( not ( = ?auto_43872 ?auto_43873 ) ) ( not ( = ?auto_43872 ?auto_43874 ) ) ( not ( = ?auto_43872 ?auto_43875 ) ) ( not ( = ?auto_43872 ?auto_43876 ) ) ( not ( = ?auto_43872 ?auto_43877 ) ) ( not ( = ?auto_43872 ?auto_43878 ) ) ( not ( = ?auto_43873 ?auto_43874 ) ) ( not ( = ?auto_43873 ?auto_43875 ) ) ( not ( = ?auto_43873 ?auto_43876 ) ) ( not ( = ?auto_43873 ?auto_43877 ) ) ( not ( = ?auto_43873 ?auto_43878 ) ) ( not ( = ?auto_43874 ?auto_43875 ) ) ( not ( = ?auto_43874 ?auto_43876 ) ) ( not ( = ?auto_43874 ?auto_43877 ) ) ( not ( = ?auto_43874 ?auto_43878 ) ) ( not ( = ?auto_43875 ?auto_43876 ) ) ( not ( = ?auto_43875 ?auto_43877 ) ) ( not ( = ?auto_43875 ?auto_43878 ) ) ( not ( = ?auto_43876 ?auto_43877 ) ) ( not ( = ?auto_43876 ?auto_43878 ) ) ( not ( = ?auto_43877 ?auto_43878 ) ) ( ON ?auto_43876 ?auto_43877 ) ( ON ?auto_43875 ?auto_43876 ) ( ON ?auto_43874 ?auto_43875 ) ( CLEAR ?auto_43872 ) ( ON ?auto_43873 ?auto_43874 ) ( CLEAR ?auto_43873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43871 ?auto_43872 ?auto_43873 )
      ( MAKE-7PILE ?auto_43871 ?auto_43872 ?auto_43873 ?auto_43874 ?auto_43875 ?auto_43876 ?auto_43877 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_43901 - BLOCK
      ?auto_43902 - BLOCK
      ?auto_43903 - BLOCK
      ?auto_43904 - BLOCK
      ?auto_43905 - BLOCK
      ?auto_43906 - BLOCK
      ?auto_43907 - BLOCK
    )
    :vars
    (
      ?auto_43908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43907 ?auto_43908 ) ( ON-TABLE ?auto_43901 ) ( not ( = ?auto_43901 ?auto_43902 ) ) ( not ( = ?auto_43901 ?auto_43903 ) ) ( not ( = ?auto_43901 ?auto_43904 ) ) ( not ( = ?auto_43901 ?auto_43905 ) ) ( not ( = ?auto_43901 ?auto_43906 ) ) ( not ( = ?auto_43901 ?auto_43907 ) ) ( not ( = ?auto_43901 ?auto_43908 ) ) ( not ( = ?auto_43902 ?auto_43903 ) ) ( not ( = ?auto_43902 ?auto_43904 ) ) ( not ( = ?auto_43902 ?auto_43905 ) ) ( not ( = ?auto_43902 ?auto_43906 ) ) ( not ( = ?auto_43902 ?auto_43907 ) ) ( not ( = ?auto_43902 ?auto_43908 ) ) ( not ( = ?auto_43903 ?auto_43904 ) ) ( not ( = ?auto_43903 ?auto_43905 ) ) ( not ( = ?auto_43903 ?auto_43906 ) ) ( not ( = ?auto_43903 ?auto_43907 ) ) ( not ( = ?auto_43903 ?auto_43908 ) ) ( not ( = ?auto_43904 ?auto_43905 ) ) ( not ( = ?auto_43904 ?auto_43906 ) ) ( not ( = ?auto_43904 ?auto_43907 ) ) ( not ( = ?auto_43904 ?auto_43908 ) ) ( not ( = ?auto_43905 ?auto_43906 ) ) ( not ( = ?auto_43905 ?auto_43907 ) ) ( not ( = ?auto_43905 ?auto_43908 ) ) ( not ( = ?auto_43906 ?auto_43907 ) ) ( not ( = ?auto_43906 ?auto_43908 ) ) ( not ( = ?auto_43907 ?auto_43908 ) ) ( ON ?auto_43906 ?auto_43907 ) ( ON ?auto_43905 ?auto_43906 ) ( ON ?auto_43904 ?auto_43905 ) ( ON ?auto_43903 ?auto_43904 ) ( CLEAR ?auto_43901 ) ( ON ?auto_43902 ?auto_43903 ) ( CLEAR ?auto_43902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43901 ?auto_43902 )
      ( MAKE-7PILE ?auto_43901 ?auto_43902 ?auto_43903 ?auto_43904 ?auto_43905 ?auto_43906 ?auto_43907 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_43931 - BLOCK
      ?auto_43932 - BLOCK
      ?auto_43933 - BLOCK
      ?auto_43934 - BLOCK
      ?auto_43935 - BLOCK
      ?auto_43936 - BLOCK
      ?auto_43937 - BLOCK
    )
    :vars
    (
      ?auto_43938 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43937 ?auto_43938 ) ( not ( = ?auto_43931 ?auto_43932 ) ) ( not ( = ?auto_43931 ?auto_43933 ) ) ( not ( = ?auto_43931 ?auto_43934 ) ) ( not ( = ?auto_43931 ?auto_43935 ) ) ( not ( = ?auto_43931 ?auto_43936 ) ) ( not ( = ?auto_43931 ?auto_43937 ) ) ( not ( = ?auto_43931 ?auto_43938 ) ) ( not ( = ?auto_43932 ?auto_43933 ) ) ( not ( = ?auto_43932 ?auto_43934 ) ) ( not ( = ?auto_43932 ?auto_43935 ) ) ( not ( = ?auto_43932 ?auto_43936 ) ) ( not ( = ?auto_43932 ?auto_43937 ) ) ( not ( = ?auto_43932 ?auto_43938 ) ) ( not ( = ?auto_43933 ?auto_43934 ) ) ( not ( = ?auto_43933 ?auto_43935 ) ) ( not ( = ?auto_43933 ?auto_43936 ) ) ( not ( = ?auto_43933 ?auto_43937 ) ) ( not ( = ?auto_43933 ?auto_43938 ) ) ( not ( = ?auto_43934 ?auto_43935 ) ) ( not ( = ?auto_43934 ?auto_43936 ) ) ( not ( = ?auto_43934 ?auto_43937 ) ) ( not ( = ?auto_43934 ?auto_43938 ) ) ( not ( = ?auto_43935 ?auto_43936 ) ) ( not ( = ?auto_43935 ?auto_43937 ) ) ( not ( = ?auto_43935 ?auto_43938 ) ) ( not ( = ?auto_43936 ?auto_43937 ) ) ( not ( = ?auto_43936 ?auto_43938 ) ) ( not ( = ?auto_43937 ?auto_43938 ) ) ( ON ?auto_43936 ?auto_43937 ) ( ON ?auto_43935 ?auto_43936 ) ( ON ?auto_43934 ?auto_43935 ) ( ON ?auto_43933 ?auto_43934 ) ( ON ?auto_43932 ?auto_43933 ) ( ON ?auto_43931 ?auto_43932 ) ( CLEAR ?auto_43931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43931 )
      ( MAKE-7PILE ?auto_43931 ?auto_43932 ?auto_43933 ?auto_43934 ?auto_43935 ?auto_43936 ?auto_43937 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_43962 - BLOCK
      ?auto_43963 - BLOCK
      ?auto_43964 - BLOCK
      ?auto_43965 - BLOCK
      ?auto_43966 - BLOCK
      ?auto_43967 - BLOCK
      ?auto_43968 - BLOCK
      ?auto_43969 - BLOCK
    )
    :vars
    (
      ?auto_43970 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_43968 ) ( ON ?auto_43969 ?auto_43970 ) ( CLEAR ?auto_43969 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43962 ) ( ON ?auto_43963 ?auto_43962 ) ( ON ?auto_43964 ?auto_43963 ) ( ON ?auto_43965 ?auto_43964 ) ( ON ?auto_43966 ?auto_43965 ) ( ON ?auto_43967 ?auto_43966 ) ( ON ?auto_43968 ?auto_43967 ) ( not ( = ?auto_43962 ?auto_43963 ) ) ( not ( = ?auto_43962 ?auto_43964 ) ) ( not ( = ?auto_43962 ?auto_43965 ) ) ( not ( = ?auto_43962 ?auto_43966 ) ) ( not ( = ?auto_43962 ?auto_43967 ) ) ( not ( = ?auto_43962 ?auto_43968 ) ) ( not ( = ?auto_43962 ?auto_43969 ) ) ( not ( = ?auto_43962 ?auto_43970 ) ) ( not ( = ?auto_43963 ?auto_43964 ) ) ( not ( = ?auto_43963 ?auto_43965 ) ) ( not ( = ?auto_43963 ?auto_43966 ) ) ( not ( = ?auto_43963 ?auto_43967 ) ) ( not ( = ?auto_43963 ?auto_43968 ) ) ( not ( = ?auto_43963 ?auto_43969 ) ) ( not ( = ?auto_43963 ?auto_43970 ) ) ( not ( = ?auto_43964 ?auto_43965 ) ) ( not ( = ?auto_43964 ?auto_43966 ) ) ( not ( = ?auto_43964 ?auto_43967 ) ) ( not ( = ?auto_43964 ?auto_43968 ) ) ( not ( = ?auto_43964 ?auto_43969 ) ) ( not ( = ?auto_43964 ?auto_43970 ) ) ( not ( = ?auto_43965 ?auto_43966 ) ) ( not ( = ?auto_43965 ?auto_43967 ) ) ( not ( = ?auto_43965 ?auto_43968 ) ) ( not ( = ?auto_43965 ?auto_43969 ) ) ( not ( = ?auto_43965 ?auto_43970 ) ) ( not ( = ?auto_43966 ?auto_43967 ) ) ( not ( = ?auto_43966 ?auto_43968 ) ) ( not ( = ?auto_43966 ?auto_43969 ) ) ( not ( = ?auto_43966 ?auto_43970 ) ) ( not ( = ?auto_43967 ?auto_43968 ) ) ( not ( = ?auto_43967 ?auto_43969 ) ) ( not ( = ?auto_43967 ?auto_43970 ) ) ( not ( = ?auto_43968 ?auto_43969 ) ) ( not ( = ?auto_43968 ?auto_43970 ) ) ( not ( = ?auto_43969 ?auto_43970 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_43969 ?auto_43970 )
      ( !STACK ?auto_43969 ?auto_43968 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_43979 - BLOCK
      ?auto_43980 - BLOCK
      ?auto_43981 - BLOCK
      ?auto_43982 - BLOCK
      ?auto_43983 - BLOCK
      ?auto_43984 - BLOCK
      ?auto_43985 - BLOCK
      ?auto_43986 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_43985 ) ( ON-TABLE ?auto_43986 ) ( CLEAR ?auto_43986 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43979 ) ( ON ?auto_43980 ?auto_43979 ) ( ON ?auto_43981 ?auto_43980 ) ( ON ?auto_43982 ?auto_43981 ) ( ON ?auto_43983 ?auto_43982 ) ( ON ?auto_43984 ?auto_43983 ) ( ON ?auto_43985 ?auto_43984 ) ( not ( = ?auto_43979 ?auto_43980 ) ) ( not ( = ?auto_43979 ?auto_43981 ) ) ( not ( = ?auto_43979 ?auto_43982 ) ) ( not ( = ?auto_43979 ?auto_43983 ) ) ( not ( = ?auto_43979 ?auto_43984 ) ) ( not ( = ?auto_43979 ?auto_43985 ) ) ( not ( = ?auto_43979 ?auto_43986 ) ) ( not ( = ?auto_43980 ?auto_43981 ) ) ( not ( = ?auto_43980 ?auto_43982 ) ) ( not ( = ?auto_43980 ?auto_43983 ) ) ( not ( = ?auto_43980 ?auto_43984 ) ) ( not ( = ?auto_43980 ?auto_43985 ) ) ( not ( = ?auto_43980 ?auto_43986 ) ) ( not ( = ?auto_43981 ?auto_43982 ) ) ( not ( = ?auto_43981 ?auto_43983 ) ) ( not ( = ?auto_43981 ?auto_43984 ) ) ( not ( = ?auto_43981 ?auto_43985 ) ) ( not ( = ?auto_43981 ?auto_43986 ) ) ( not ( = ?auto_43982 ?auto_43983 ) ) ( not ( = ?auto_43982 ?auto_43984 ) ) ( not ( = ?auto_43982 ?auto_43985 ) ) ( not ( = ?auto_43982 ?auto_43986 ) ) ( not ( = ?auto_43983 ?auto_43984 ) ) ( not ( = ?auto_43983 ?auto_43985 ) ) ( not ( = ?auto_43983 ?auto_43986 ) ) ( not ( = ?auto_43984 ?auto_43985 ) ) ( not ( = ?auto_43984 ?auto_43986 ) ) ( not ( = ?auto_43985 ?auto_43986 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_43986 )
      ( !STACK ?auto_43986 ?auto_43985 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_43995 - BLOCK
      ?auto_43996 - BLOCK
      ?auto_43997 - BLOCK
      ?auto_43998 - BLOCK
      ?auto_43999 - BLOCK
      ?auto_44000 - BLOCK
      ?auto_44001 - BLOCK
      ?auto_44002 - BLOCK
    )
    :vars
    (
      ?auto_44003 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44002 ?auto_44003 ) ( ON-TABLE ?auto_43995 ) ( ON ?auto_43996 ?auto_43995 ) ( ON ?auto_43997 ?auto_43996 ) ( ON ?auto_43998 ?auto_43997 ) ( ON ?auto_43999 ?auto_43998 ) ( ON ?auto_44000 ?auto_43999 ) ( not ( = ?auto_43995 ?auto_43996 ) ) ( not ( = ?auto_43995 ?auto_43997 ) ) ( not ( = ?auto_43995 ?auto_43998 ) ) ( not ( = ?auto_43995 ?auto_43999 ) ) ( not ( = ?auto_43995 ?auto_44000 ) ) ( not ( = ?auto_43995 ?auto_44001 ) ) ( not ( = ?auto_43995 ?auto_44002 ) ) ( not ( = ?auto_43995 ?auto_44003 ) ) ( not ( = ?auto_43996 ?auto_43997 ) ) ( not ( = ?auto_43996 ?auto_43998 ) ) ( not ( = ?auto_43996 ?auto_43999 ) ) ( not ( = ?auto_43996 ?auto_44000 ) ) ( not ( = ?auto_43996 ?auto_44001 ) ) ( not ( = ?auto_43996 ?auto_44002 ) ) ( not ( = ?auto_43996 ?auto_44003 ) ) ( not ( = ?auto_43997 ?auto_43998 ) ) ( not ( = ?auto_43997 ?auto_43999 ) ) ( not ( = ?auto_43997 ?auto_44000 ) ) ( not ( = ?auto_43997 ?auto_44001 ) ) ( not ( = ?auto_43997 ?auto_44002 ) ) ( not ( = ?auto_43997 ?auto_44003 ) ) ( not ( = ?auto_43998 ?auto_43999 ) ) ( not ( = ?auto_43998 ?auto_44000 ) ) ( not ( = ?auto_43998 ?auto_44001 ) ) ( not ( = ?auto_43998 ?auto_44002 ) ) ( not ( = ?auto_43998 ?auto_44003 ) ) ( not ( = ?auto_43999 ?auto_44000 ) ) ( not ( = ?auto_43999 ?auto_44001 ) ) ( not ( = ?auto_43999 ?auto_44002 ) ) ( not ( = ?auto_43999 ?auto_44003 ) ) ( not ( = ?auto_44000 ?auto_44001 ) ) ( not ( = ?auto_44000 ?auto_44002 ) ) ( not ( = ?auto_44000 ?auto_44003 ) ) ( not ( = ?auto_44001 ?auto_44002 ) ) ( not ( = ?auto_44001 ?auto_44003 ) ) ( not ( = ?auto_44002 ?auto_44003 ) ) ( CLEAR ?auto_44000 ) ( ON ?auto_44001 ?auto_44002 ) ( CLEAR ?auto_44001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_43995 ?auto_43996 ?auto_43997 ?auto_43998 ?auto_43999 ?auto_44000 ?auto_44001 )
      ( MAKE-8PILE ?auto_43995 ?auto_43996 ?auto_43997 ?auto_43998 ?auto_43999 ?auto_44000 ?auto_44001 ?auto_44002 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_44012 - BLOCK
      ?auto_44013 - BLOCK
      ?auto_44014 - BLOCK
      ?auto_44015 - BLOCK
      ?auto_44016 - BLOCK
      ?auto_44017 - BLOCK
      ?auto_44018 - BLOCK
      ?auto_44019 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44019 ) ( ON-TABLE ?auto_44012 ) ( ON ?auto_44013 ?auto_44012 ) ( ON ?auto_44014 ?auto_44013 ) ( ON ?auto_44015 ?auto_44014 ) ( ON ?auto_44016 ?auto_44015 ) ( ON ?auto_44017 ?auto_44016 ) ( not ( = ?auto_44012 ?auto_44013 ) ) ( not ( = ?auto_44012 ?auto_44014 ) ) ( not ( = ?auto_44012 ?auto_44015 ) ) ( not ( = ?auto_44012 ?auto_44016 ) ) ( not ( = ?auto_44012 ?auto_44017 ) ) ( not ( = ?auto_44012 ?auto_44018 ) ) ( not ( = ?auto_44012 ?auto_44019 ) ) ( not ( = ?auto_44013 ?auto_44014 ) ) ( not ( = ?auto_44013 ?auto_44015 ) ) ( not ( = ?auto_44013 ?auto_44016 ) ) ( not ( = ?auto_44013 ?auto_44017 ) ) ( not ( = ?auto_44013 ?auto_44018 ) ) ( not ( = ?auto_44013 ?auto_44019 ) ) ( not ( = ?auto_44014 ?auto_44015 ) ) ( not ( = ?auto_44014 ?auto_44016 ) ) ( not ( = ?auto_44014 ?auto_44017 ) ) ( not ( = ?auto_44014 ?auto_44018 ) ) ( not ( = ?auto_44014 ?auto_44019 ) ) ( not ( = ?auto_44015 ?auto_44016 ) ) ( not ( = ?auto_44015 ?auto_44017 ) ) ( not ( = ?auto_44015 ?auto_44018 ) ) ( not ( = ?auto_44015 ?auto_44019 ) ) ( not ( = ?auto_44016 ?auto_44017 ) ) ( not ( = ?auto_44016 ?auto_44018 ) ) ( not ( = ?auto_44016 ?auto_44019 ) ) ( not ( = ?auto_44017 ?auto_44018 ) ) ( not ( = ?auto_44017 ?auto_44019 ) ) ( not ( = ?auto_44018 ?auto_44019 ) ) ( CLEAR ?auto_44017 ) ( ON ?auto_44018 ?auto_44019 ) ( CLEAR ?auto_44018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_44012 ?auto_44013 ?auto_44014 ?auto_44015 ?auto_44016 ?auto_44017 ?auto_44018 )
      ( MAKE-8PILE ?auto_44012 ?auto_44013 ?auto_44014 ?auto_44015 ?auto_44016 ?auto_44017 ?auto_44018 ?auto_44019 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_44028 - BLOCK
      ?auto_44029 - BLOCK
      ?auto_44030 - BLOCK
      ?auto_44031 - BLOCK
      ?auto_44032 - BLOCK
      ?auto_44033 - BLOCK
      ?auto_44034 - BLOCK
      ?auto_44035 - BLOCK
    )
    :vars
    (
      ?auto_44036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44035 ?auto_44036 ) ( ON-TABLE ?auto_44028 ) ( ON ?auto_44029 ?auto_44028 ) ( ON ?auto_44030 ?auto_44029 ) ( ON ?auto_44031 ?auto_44030 ) ( ON ?auto_44032 ?auto_44031 ) ( not ( = ?auto_44028 ?auto_44029 ) ) ( not ( = ?auto_44028 ?auto_44030 ) ) ( not ( = ?auto_44028 ?auto_44031 ) ) ( not ( = ?auto_44028 ?auto_44032 ) ) ( not ( = ?auto_44028 ?auto_44033 ) ) ( not ( = ?auto_44028 ?auto_44034 ) ) ( not ( = ?auto_44028 ?auto_44035 ) ) ( not ( = ?auto_44028 ?auto_44036 ) ) ( not ( = ?auto_44029 ?auto_44030 ) ) ( not ( = ?auto_44029 ?auto_44031 ) ) ( not ( = ?auto_44029 ?auto_44032 ) ) ( not ( = ?auto_44029 ?auto_44033 ) ) ( not ( = ?auto_44029 ?auto_44034 ) ) ( not ( = ?auto_44029 ?auto_44035 ) ) ( not ( = ?auto_44029 ?auto_44036 ) ) ( not ( = ?auto_44030 ?auto_44031 ) ) ( not ( = ?auto_44030 ?auto_44032 ) ) ( not ( = ?auto_44030 ?auto_44033 ) ) ( not ( = ?auto_44030 ?auto_44034 ) ) ( not ( = ?auto_44030 ?auto_44035 ) ) ( not ( = ?auto_44030 ?auto_44036 ) ) ( not ( = ?auto_44031 ?auto_44032 ) ) ( not ( = ?auto_44031 ?auto_44033 ) ) ( not ( = ?auto_44031 ?auto_44034 ) ) ( not ( = ?auto_44031 ?auto_44035 ) ) ( not ( = ?auto_44031 ?auto_44036 ) ) ( not ( = ?auto_44032 ?auto_44033 ) ) ( not ( = ?auto_44032 ?auto_44034 ) ) ( not ( = ?auto_44032 ?auto_44035 ) ) ( not ( = ?auto_44032 ?auto_44036 ) ) ( not ( = ?auto_44033 ?auto_44034 ) ) ( not ( = ?auto_44033 ?auto_44035 ) ) ( not ( = ?auto_44033 ?auto_44036 ) ) ( not ( = ?auto_44034 ?auto_44035 ) ) ( not ( = ?auto_44034 ?auto_44036 ) ) ( not ( = ?auto_44035 ?auto_44036 ) ) ( ON ?auto_44034 ?auto_44035 ) ( CLEAR ?auto_44032 ) ( ON ?auto_44033 ?auto_44034 ) ( CLEAR ?auto_44033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_44028 ?auto_44029 ?auto_44030 ?auto_44031 ?auto_44032 ?auto_44033 )
      ( MAKE-8PILE ?auto_44028 ?auto_44029 ?auto_44030 ?auto_44031 ?auto_44032 ?auto_44033 ?auto_44034 ?auto_44035 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_44045 - BLOCK
      ?auto_44046 - BLOCK
      ?auto_44047 - BLOCK
      ?auto_44048 - BLOCK
      ?auto_44049 - BLOCK
      ?auto_44050 - BLOCK
      ?auto_44051 - BLOCK
      ?auto_44052 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44052 ) ( ON-TABLE ?auto_44045 ) ( ON ?auto_44046 ?auto_44045 ) ( ON ?auto_44047 ?auto_44046 ) ( ON ?auto_44048 ?auto_44047 ) ( ON ?auto_44049 ?auto_44048 ) ( not ( = ?auto_44045 ?auto_44046 ) ) ( not ( = ?auto_44045 ?auto_44047 ) ) ( not ( = ?auto_44045 ?auto_44048 ) ) ( not ( = ?auto_44045 ?auto_44049 ) ) ( not ( = ?auto_44045 ?auto_44050 ) ) ( not ( = ?auto_44045 ?auto_44051 ) ) ( not ( = ?auto_44045 ?auto_44052 ) ) ( not ( = ?auto_44046 ?auto_44047 ) ) ( not ( = ?auto_44046 ?auto_44048 ) ) ( not ( = ?auto_44046 ?auto_44049 ) ) ( not ( = ?auto_44046 ?auto_44050 ) ) ( not ( = ?auto_44046 ?auto_44051 ) ) ( not ( = ?auto_44046 ?auto_44052 ) ) ( not ( = ?auto_44047 ?auto_44048 ) ) ( not ( = ?auto_44047 ?auto_44049 ) ) ( not ( = ?auto_44047 ?auto_44050 ) ) ( not ( = ?auto_44047 ?auto_44051 ) ) ( not ( = ?auto_44047 ?auto_44052 ) ) ( not ( = ?auto_44048 ?auto_44049 ) ) ( not ( = ?auto_44048 ?auto_44050 ) ) ( not ( = ?auto_44048 ?auto_44051 ) ) ( not ( = ?auto_44048 ?auto_44052 ) ) ( not ( = ?auto_44049 ?auto_44050 ) ) ( not ( = ?auto_44049 ?auto_44051 ) ) ( not ( = ?auto_44049 ?auto_44052 ) ) ( not ( = ?auto_44050 ?auto_44051 ) ) ( not ( = ?auto_44050 ?auto_44052 ) ) ( not ( = ?auto_44051 ?auto_44052 ) ) ( ON ?auto_44051 ?auto_44052 ) ( CLEAR ?auto_44049 ) ( ON ?auto_44050 ?auto_44051 ) ( CLEAR ?auto_44050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_44045 ?auto_44046 ?auto_44047 ?auto_44048 ?auto_44049 ?auto_44050 )
      ( MAKE-8PILE ?auto_44045 ?auto_44046 ?auto_44047 ?auto_44048 ?auto_44049 ?auto_44050 ?auto_44051 ?auto_44052 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_44061 - BLOCK
      ?auto_44062 - BLOCK
      ?auto_44063 - BLOCK
      ?auto_44064 - BLOCK
      ?auto_44065 - BLOCK
      ?auto_44066 - BLOCK
      ?auto_44067 - BLOCK
      ?auto_44068 - BLOCK
    )
    :vars
    (
      ?auto_44069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44068 ?auto_44069 ) ( ON-TABLE ?auto_44061 ) ( ON ?auto_44062 ?auto_44061 ) ( ON ?auto_44063 ?auto_44062 ) ( ON ?auto_44064 ?auto_44063 ) ( not ( = ?auto_44061 ?auto_44062 ) ) ( not ( = ?auto_44061 ?auto_44063 ) ) ( not ( = ?auto_44061 ?auto_44064 ) ) ( not ( = ?auto_44061 ?auto_44065 ) ) ( not ( = ?auto_44061 ?auto_44066 ) ) ( not ( = ?auto_44061 ?auto_44067 ) ) ( not ( = ?auto_44061 ?auto_44068 ) ) ( not ( = ?auto_44061 ?auto_44069 ) ) ( not ( = ?auto_44062 ?auto_44063 ) ) ( not ( = ?auto_44062 ?auto_44064 ) ) ( not ( = ?auto_44062 ?auto_44065 ) ) ( not ( = ?auto_44062 ?auto_44066 ) ) ( not ( = ?auto_44062 ?auto_44067 ) ) ( not ( = ?auto_44062 ?auto_44068 ) ) ( not ( = ?auto_44062 ?auto_44069 ) ) ( not ( = ?auto_44063 ?auto_44064 ) ) ( not ( = ?auto_44063 ?auto_44065 ) ) ( not ( = ?auto_44063 ?auto_44066 ) ) ( not ( = ?auto_44063 ?auto_44067 ) ) ( not ( = ?auto_44063 ?auto_44068 ) ) ( not ( = ?auto_44063 ?auto_44069 ) ) ( not ( = ?auto_44064 ?auto_44065 ) ) ( not ( = ?auto_44064 ?auto_44066 ) ) ( not ( = ?auto_44064 ?auto_44067 ) ) ( not ( = ?auto_44064 ?auto_44068 ) ) ( not ( = ?auto_44064 ?auto_44069 ) ) ( not ( = ?auto_44065 ?auto_44066 ) ) ( not ( = ?auto_44065 ?auto_44067 ) ) ( not ( = ?auto_44065 ?auto_44068 ) ) ( not ( = ?auto_44065 ?auto_44069 ) ) ( not ( = ?auto_44066 ?auto_44067 ) ) ( not ( = ?auto_44066 ?auto_44068 ) ) ( not ( = ?auto_44066 ?auto_44069 ) ) ( not ( = ?auto_44067 ?auto_44068 ) ) ( not ( = ?auto_44067 ?auto_44069 ) ) ( not ( = ?auto_44068 ?auto_44069 ) ) ( ON ?auto_44067 ?auto_44068 ) ( ON ?auto_44066 ?auto_44067 ) ( CLEAR ?auto_44064 ) ( ON ?auto_44065 ?auto_44066 ) ( CLEAR ?auto_44065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44061 ?auto_44062 ?auto_44063 ?auto_44064 ?auto_44065 )
      ( MAKE-8PILE ?auto_44061 ?auto_44062 ?auto_44063 ?auto_44064 ?auto_44065 ?auto_44066 ?auto_44067 ?auto_44068 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_44078 - BLOCK
      ?auto_44079 - BLOCK
      ?auto_44080 - BLOCK
      ?auto_44081 - BLOCK
      ?auto_44082 - BLOCK
      ?auto_44083 - BLOCK
      ?auto_44084 - BLOCK
      ?auto_44085 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44085 ) ( ON-TABLE ?auto_44078 ) ( ON ?auto_44079 ?auto_44078 ) ( ON ?auto_44080 ?auto_44079 ) ( ON ?auto_44081 ?auto_44080 ) ( not ( = ?auto_44078 ?auto_44079 ) ) ( not ( = ?auto_44078 ?auto_44080 ) ) ( not ( = ?auto_44078 ?auto_44081 ) ) ( not ( = ?auto_44078 ?auto_44082 ) ) ( not ( = ?auto_44078 ?auto_44083 ) ) ( not ( = ?auto_44078 ?auto_44084 ) ) ( not ( = ?auto_44078 ?auto_44085 ) ) ( not ( = ?auto_44079 ?auto_44080 ) ) ( not ( = ?auto_44079 ?auto_44081 ) ) ( not ( = ?auto_44079 ?auto_44082 ) ) ( not ( = ?auto_44079 ?auto_44083 ) ) ( not ( = ?auto_44079 ?auto_44084 ) ) ( not ( = ?auto_44079 ?auto_44085 ) ) ( not ( = ?auto_44080 ?auto_44081 ) ) ( not ( = ?auto_44080 ?auto_44082 ) ) ( not ( = ?auto_44080 ?auto_44083 ) ) ( not ( = ?auto_44080 ?auto_44084 ) ) ( not ( = ?auto_44080 ?auto_44085 ) ) ( not ( = ?auto_44081 ?auto_44082 ) ) ( not ( = ?auto_44081 ?auto_44083 ) ) ( not ( = ?auto_44081 ?auto_44084 ) ) ( not ( = ?auto_44081 ?auto_44085 ) ) ( not ( = ?auto_44082 ?auto_44083 ) ) ( not ( = ?auto_44082 ?auto_44084 ) ) ( not ( = ?auto_44082 ?auto_44085 ) ) ( not ( = ?auto_44083 ?auto_44084 ) ) ( not ( = ?auto_44083 ?auto_44085 ) ) ( not ( = ?auto_44084 ?auto_44085 ) ) ( ON ?auto_44084 ?auto_44085 ) ( ON ?auto_44083 ?auto_44084 ) ( CLEAR ?auto_44081 ) ( ON ?auto_44082 ?auto_44083 ) ( CLEAR ?auto_44082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44078 ?auto_44079 ?auto_44080 ?auto_44081 ?auto_44082 )
      ( MAKE-8PILE ?auto_44078 ?auto_44079 ?auto_44080 ?auto_44081 ?auto_44082 ?auto_44083 ?auto_44084 ?auto_44085 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_44094 - BLOCK
      ?auto_44095 - BLOCK
      ?auto_44096 - BLOCK
      ?auto_44097 - BLOCK
      ?auto_44098 - BLOCK
      ?auto_44099 - BLOCK
      ?auto_44100 - BLOCK
      ?auto_44101 - BLOCK
    )
    :vars
    (
      ?auto_44102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44101 ?auto_44102 ) ( ON-TABLE ?auto_44094 ) ( ON ?auto_44095 ?auto_44094 ) ( ON ?auto_44096 ?auto_44095 ) ( not ( = ?auto_44094 ?auto_44095 ) ) ( not ( = ?auto_44094 ?auto_44096 ) ) ( not ( = ?auto_44094 ?auto_44097 ) ) ( not ( = ?auto_44094 ?auto_44098 ) ) ( not ( = ?auto_44094 ?auto_44099 ) ) ( not ( = ?auto_44094 ?auto_44100 ) ) ( not ( = ?auto_44094 ?auto_44101 ) ) ( not ( = ?auto_44094 ?auto_44102 ) ) ( not ( = ?auto_44095 ?auto_44096 ) ) ( not ( = ?auto_44095 ?auto_44097 ) ) ( not ( = ?auto_44095 ?auto_44098 ) ) ( not ( = ?auto_44095 ?auto_44099 ) ) ( not ( = ?auto_44095 ?auto_44100 ) ) ( not ( = ?auto_44095 ?auto_44101 ) ) ( not ( = ?auto_44095 ?auto_44102 ) ) ( not ( = ?auto_44096 ?auto_44097 ) ) ( not ( = ?auto_44096 ?auto_44098 ) ) ( not ( = ?auto_44096 ?auto_44099 ) ) ( not ( = ?auto_44096 ?auto_44100 ) ) ( not ( = ?auto_44096 ?auto_44101 ) ) ( not ( = ?auto_44096 ?auto_44102 ) ) ( not ( = ?auto_44097 ?auto_44098 ) ) ( not ( = ?auto_44097 ?auto_44099 ) ) ( not ( = ?auto_44097 ?auto_44100 ) ) ( not ( = ?auto_44097 ?auto_44101 ) ) ( not ( = ?auto_44097 ?auto_44102 ) ) ( not ( = ?auto_44098 ?auto_44099 ) ) ( not ( = ?auto_44098 ?auto_44100 ) ) ( not ( = ?auto_44098 ?auto_44101 ) ) ( not ( = ?auto_44098 ?auto_44102 ) ) ( not ( = ?auto_44099 ?auto_44100 ) ) ( not ( = ?auto_44099 ?auto_44101 ) ) ( not ( = ?auto_44099 ?auto_44102 ) ) ( not ( = ?auto_44100 ?auto_44101 ) ) ( not ( = ?auto_44100 ?auto_44102 ) ) ( not ( = ?auto_44101 ?auto_44102 ) ) ( ON ?auto_44100 ?auto_44101 ) ( ON ?auto_44099 ?auto_44100 ) ( ON ?auto_44098 ?auto_44099 ) ( CLEAR ?auto_44096 ) ( ON ?auto_44097 ?auto_44098 ) ( CLEAR ?auto_44097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44094 ?auto_44095 ?auto_44096 ?auto_44097 )
      ( MAKE-8PILE ?auto_44094 ?auto_44095 ?auto_44096 ?auto_44097 ?auto_44098 ?auto_44099 ?auto_44100 ?auto_44101 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_44111 - BLOCK
      ?auto_44112 - BLOCK
      ?auto_44113 - BLOCK
      ?auto_44114 - BLOCK
      ?auto_44115 - BLOCK
      ?auto_44116 - BLOCK
      ?auto_44117 - BLOCK
      ?auto_44118 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44118 ) ( ON-TABLE ?auto_44111 ) ( ON ?auto_44112 ?auto_44111 ) ( ON ?auto_44113 ?auto_44112 ) ( not ( = ?auto_44111 ?auto_44112 ) ) ( not ( = ?auto_44111 ?auto_44113 ) ) ( not ( = ?auto_44111 ?auto_44114 ) ) ( not ( = ?auto_44111 ?auto_44115 ) ) ( not ( = ?auto_44111 ?auto_44116 ) ) ( not ( = ?auto_44111 ?auto_44117 ) ) ( not ( = ?auto_44111 ?auto_44118 ) ) ( not ( = ?auto_44112 ?auto_44113 ) ) ( not ( = ?auto_44112 ?auto_44114 ) ) ( not ( = ?auto_44112 ?auto_44115 ) ) ( not ( = ?auto_44112 ?auto_44116 ) ) ( not ( = ?auto_44112 ?auto_44117 ) ) ( not ( = ?auto_44112 ?auto_44118 ) ) ( not ( = ?auto_44113 ?auto_44114 ) ) ( not ( = ?auto_44113 ?auto_44115 ) ) ( not ( = ?auto_44113 ?auto_44116 ) ) ( not ( = ?auto_44113 ?auto_44117 ) ) ( not ( = ?auto_44113 ?auto_44118 ) ) ( not ( = ?auto_44114 ?auto_44115 ) ) ( not ( = ?auto_44114 ?auto_44116 ) ) ( not ( = ?auto_44114 ?auto_44117 ) ) ( not ( = ?auto_44114 ?auto_44118 ) ) ( not ( = ?auto_44115 ?auto_44116 ) ) ( not ( = ?auto_44115 ?auto_44117 ) ) ( not ( = ?auto_44115 ?auto_44118 ) ) ( not ( = ?auto_44116 ?auto_44117 ) ) ( not ( = ?auto_44116 ?auto_44118 ) ) ( not ( = ?auto_44117 ?auto_44118 ) ) ( ON ?auto_44117 ?auto_44118 ) ( ON ?auto_44116 ?auto_44117 ) ( ON ?auto_44115 ?auto_44116 ) ( CLEAR ?auto_44113 ) ( ON ?auto_44114 ?auto_44115 ) ( CLEAR ?auto_44114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44111 ?auto_44112 ?auto_44113 ?auto_44114 )
      ( MAKE-8PILE ?auto_44111 ?auto_44112 ?auto_44113 ?auto_44114 ?auto_44115 ?auto_44116 ?auto_44117 ?auto_44118 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_44127 - BLOCK
      ?auto_44128 - BLOCK
      ?auto_44129 - BLOCK
      ?auto_44130 - BLOCK
      ?auto_44131 - BLOCK
      ?auto_44132 - BLOCK
      ?auto_44133 - BLOCK
      ?auto_44134 - BLOCK
    )
    :vars
    (
      ?auto_44135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44134 ?auto_44135 ) ( ON-TABLE ?auto_44127 ) ( ON ?auto_44128 ?auto_44127 ) ( not ( = ?auto_44127 ?auto_44128 ) ) ( not ( = ?auto_44127 ?auto_44129 ) ) ( not ( = ?auto_44127 ?auto_44130 ) ) ( not ( = ?auto_44127 ?auto_44131 ) ) ( not ( = ?auto_44127 ?auto_44132 ) ) ( not ( = ?auto_44127 ?auto_44133 ) ) ( not ( = ?auto_44127 ?auto_44134 ) ) ( not ( = ?auto_44127 ?auto_44135 ) ) ( not ( = ?auto_44128 ?auto_44129 ) ) ( not ( = ?auto_44128 ?auto_44130 ) ) ( not ( = ?auto_44128 ?auto_44131 ) ) ( not ( = ?auto_44128 ?auto_44132 ) ) ( not ( = ?auto_44128 ?auto_44133 ) ) ( not ( = ?auto_44128 ?auto_44134 ) ) ( not ( = ?auto_44128 ?auto_44135 ) ) ( not ( = ?auto_44129 ?auto_44130 ) ) ( not ( = ?auto_44129 ?auto_44131 ) ) ( not ( = ?auto_44129 ?auto_44132 ) ) ( not ( = ?auto_44129 ?auto_44133 ) ) ( not ( = ?auto_44129 ?auto_44134 ) ) ( not ( = ?auto_44129 ?auto_44135 ) ) ( not ( = ?auto_44130 ?auto_44131 ) ) ( not ( = ?auto_44130 ?auto_44132 ) ) ( not ( = ?auto_44130 ?auto_44133 ) ) ( not ( = ?auto_44130 ?auto_44134 ) ) ( not ( = ?auto_44130 ?auto_44135 ) ) ( not ( = ?auto_44131 ?auto_44132 ) ) ( not ( = ?auto_44131 ?auto_44133 ) ) ( not ( = ?auto_44131 ?auto_44134 ) ) ( not ( = ?auto_44131 ?auto_44135 ) ) ( not ( = ?auto_44132 ?auto_44133 ) ) ( not ( = ?auto_44132 ?auto_44134 ) ) ( not ( = ?auto_44132 ?auto_44135 ) ) ( not ( = ?auto_44133 ?auto_44134 ) ) ( not ( = ?auto_44133 ?auto_44135 ) ) ( not ( = ?auto_44134 ?auto_44135 ) ) ( ON ?auto_44133 ?auto_44134 ) ( ON ?auto_44132 ?auto_44133 ) ( ON ?auto_44131 ?auto_44132 ) ( ON ?auto_44130 ?auto_44131 ) ( CLEAR ?auto_44128 ) ( ON ?auto_44129 ?auto_44130 ) ( CLEAR ?auto_44129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44127 ?auto_44128 ?auto_44129 )
      ( MAKE-8PILE ?auto_44127 ?auto_44128 ?auto_44129 ?auto_44130 ?auto_44131 ?auto_44132 ?auto_44133 ?auto_44134 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_44144 - BLOCK
      ?auto_44145 - BLOCK
      ?auto_44146 - BLOCK
      ?auto_44147 - BLOCK
      ?auto_44148 - BLOCK
      ?auto_44149 - BLOCK
      ?auto_44150 - BLOCK
      ?auto_44151 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44151 ) ( ON-TABLE ?auto_44144 ) ( ON ?auto_44145 ?auto_44144 ) ( not ( = ?auto_44144 ?auto_44145 ) ) ( not ( = ?auto_44144 ?auto_44146 ) ) ( not ( = ?auto_44144 ?auto_44147 ) ) ( not ( = ?auto_44144 ?auto_44148 ) ) ( not ( = ?auto_44144 ?auto_44149 ) ) ( not ( = ?auto_44144 ?auto_44150 ) ) ( not ( = ?auto_44144 ?auto_44151 ) ) ( not ( = ?auto_44145 ?auto_44146 ) ) ( not ( = ?auto_44145 ?auto_44147 ) ) ( not ( = ?auto_44145 ?auto_44148 ) ) ( not ( = ?auto_44145 ?auto_44149 ) ) ( not ( = ?auto_44145 ?auto_44150 ) ) ( not ( = ?auto_44145 ?auto_44151 ) ) ( not ( = ?auto_44146 ?auto_44147 ) ) ( not ( = ?auto_44146 ?auto_44148 ) ) ( not ( = ?auto_44146 ?auto_44149 ) ) ( not ( = ?auto_44146 ?auto_44150 ) ) ( not ( = ?auto_44146 ?auto_44151 ) ) ( not ( = ?auto_44147 ?auto_44148 ) ) ( not ( = ?auto_44147 ?auto_44149 ) ) ( not ( = ?auto_44147 ?auto_44150 ) ) ( not ( = ?auto_44147 ?auto_44151 ) ) ( not ( = ?auto_44148 ?auto_44149 ) ) ( not ( = ?auto_44148 ?auto_44150 ) ) ( not ( = ?auto_44148 ?auto_44151 ) ) ( not ( = ?auto_44149 ?auto_44150 ) ) ( not ( = ?auto_44149 ?auto_44151 ) ) ( not ( = ?auto_44150 ?auto_44151 ) ) ( ON ?auto_44150 ?auto_44151 ) ( ON ?auto_44149 ?auto_44150 ) ( ON ?auto_44148 ?auto_44149 ) ( ON ?auto_44147 ?auto_44148 ) ( CLEAR ?auto_44145 ) ( ON ?auto_44146 ?auto_44147 ) ( CLEAR ?auto_44146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44144 ?auto_44145 ?auto_44146 )
      ( MAKE-8PILE ?auto_44144 ?auto_44145 ?auto_44146 ?auto_44147 ?auto_44148 ?auto_44149 ?auto_44150 ?auto_44151 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_44160 - BLOCK
      ?auto_44161 - BLOCK
      ?auto_44162 - BLOCK
      ?auto_44163 - BLOCK
      ?auto_44164 - BLOCK
      ?auto_44165 - BLOCK
      ?auto_44166 - BLOCK
      ?auto_44167 - BLOCK
    )
    :vars
    (
      ?auto_44168 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44167 ?auto_44168 ) ( ON-TABLE ?auto_44160 ) ( not ( = ?auto_44160 ?auto_44161 ) ) ( not ( = ?auto_44160 ?auto_44162 ) ) ( not ( = ?auto_44160 ?auto_44163 ) ) ( not ( = ?auto_44160 ?auto_44164 ) ) ( not ( = ?auto_44160 ?auto_44165 ) ) ( not ( = ?auto_44160 ?auto_44166 ) ) ( not ( = ?auto_44160 ?auto_44167 ) ) ( not ( = ?auto_44160 ?auto_44168 ) ) ( not ( = ?auto_44161 ?auto_44162 ) ) ( not ( = ?auto_44161 ?auto_44163 ) ) ( not ( = ?auto_44161 ?auto_44164 ) ) ( not ( = ?auto_44161 ?auto_44165 ) ) ( not ( = ?auto_44161 ?auto_44166 ) ) ( not ( = ?auto_44161 ?auto_44167 ) ) ( not ( = ?auto_44161 ?auto_44168 ) ) ( not ( = ?auto_44162 ?auto_44163 ) ) ( not ( = ?auto_44162 ?auto_44164 ) ) ( not ( = ?auto_44162 ?auto_44165 ) ) ( not ( = ?auto_44162 ?auto_44166 ) ) ( not ( = ?auto_44162 ?auto_44167 ) ) ( not ( = ?auto_44162 ?auto_44168 ) ) ( not ( = ?auto_44163 ?auto_44164 ) ) ( not ( = ?auto_44163 ?auto_44165 ) ) ( not ( = ?auto_44163 ?auto_44166 ) ) ( not ( = ?auto_44163 ?auto_44167 ) ) ( not ( = ?auto_44163 ?auto_44168 ) ) ( not ( = ?auto_44164 ?auto_44165 ) ) ( not ( = ?auto_44164 ?auto_44166 ) ) ( not ( = ?auto_44164 ?auto_44167 ) ) ( not ( = ?auto_44164 ?auto_44168 ) ) ( not ( = ?auto_44165 ?auto_44166 ) ) ( not ( = ?auto_44165 ?auto_44167 ) ) ( not ( = ?auto_44165 ?auto_44168 ) ) ( not ( = ?auto_44166 ?auto_44167 ) ) ( not ( = ?auto_44166 ?auto_44168 ) ) ( not ( = ?auto_44167 ?auto_44168 ) ) ( ON ?auto_44166 ?auto_44167 ) ( ON ?auto_44165 ?auto_44166 ) ( ON ?auto_44164 ?auto_44165 ) ( ON ?auto_44163 ?auto_44164 ) ( ON ?auto_44162 ?auto_44163 ) ( CLEAR ?auto_44160 ) ( ON ?auto_44161 ?auto_44162 ) ( CLEAR ?auto_44161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44160 ?auto_44161 )
      ( MAKE-8PILE ?auto_44160 ?auto_44161 ?auto_44162 ?auto_44163 ?auto_44164 ?auto_44165 ?auto_44166 ?auto_44167 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_44177 - BLOCK
      ?auto_44178 - BLOCK
      ?auto_44179 - BLOCK
      ?auto_44180 - BLOCK
      ?auto_44181 - BLOCK
      ?auto_44182 - BLOCK
      ?auto_44183 - BLOCK
      ?auto_44184 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44184 ) ( ON-TABLE ?auto_44177 ) ( not ( = ?auto_44177 ?auto_44178 ) ) ( not ( = ?auto_44177 ?auto_44179 ) ) ( not ( = ?auto_44177 ?auto_44180 ) ) ( not ( = ?auto_44177 ?auto_44181 ) ) ( not ( = ?auto_44177 ?auto_44182 ) ) ( not ( = ?auto_44177 ?auto_44183 ) ) ( not ( = ?auto_44177 ?auto_44184 ) ) ( not ( = ?auto_44178 ?auto_44179 ) ) ( not ( = ?auto_44178 ?auto_44180 ) ) ( not ( = ?auto_44178 ?auto_44181 ) ) ( not ( = ?auto_44178 ?auto_44182 ) ) ( not ( = ?auto_44178 ?auto_44183 ) ) ( not ( = ?auto_44178 ?auto_44184 ) ) ( not ( = ?auto_44179 ?auto_44180 ) ) ( not ( = ?auto_44179 ?auto_44181 ) ) ( not ( = ?auto_44179 ?auto_44182 ) ) ( not ( = ?auto_44179 ?auto_44183 ) ) ( not ( = ?auto_44179 ?auto_44184 ) ) ( not ( = ?auto_44180 ?auto_44181 ) ) ( not ( = ?auto_44180 ?auto_44182 ) ) ( not ( = ?auto_44180 ?auto_44183 ) ) ( not ( = ?auto_44180 ?auto_44184 ) ) ( not ( = ?auto_44181 ?auto_44182 ) ) ( not ( = ?auto_44181 ?auto_44183 ) ) ( not ( = ?auto_44181 ?auto_44184 ) ) ( not ( = ?auto_44182 ?auto_44183 ) ) ( not ( = ?auto_44182 ?auto_44184 ) ) ( not ( = ?auto_44183 ?auto_44184 ) ) ( ON ?auto_44183 ?auto_44184 ) ( ON ?auto_44182 ?auto_44183 ) ( ON ?auto_44181 ?auto_44182 ) ( ON ?auto_44180 ?auto_44181 ) ( ON ?auto_44179 ?auto_44180 ) ( CLEAR ?auto_44177 ) ( ON ?auto_44178 ?auto_44179 ) ( CLEAR ?auto_44178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44177 ?auto_44178 )
      ( MAKE-8PILE ?auto_44177 ?auto_44178 ?auto_44179 ?auto_44180 ?auto_44181 ?auto_44182 ?auto_44183 ?auto_44184 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_44193 - BLOCK
      ?auto_44194 - BLOCK
      ?auto_44195 - BLOCK
      ?auto_44196 - BLOCK
      ?auto_44197 - BLOCK
      ?auto_44198 - BLOCK
      ?auto_44199 - BLOCK
      ?auto_44200 - BLOCK
    )
    :vars
    (
      ?auto_44201 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44200 ?auto_44201 ) ( not ( = ?auto_44193 ?auto_44194 ) ) ( not ( = ?auto_44193 ?auto_44195 ) ) ( not ( = ?auto_44193 ?auto_44196 ) ) ( not ( = ?auto_44193 ?auto_44197 ) ) ( not ( = ?auto_44193 ?auto_44198 ) ) ( not ( = ?auto_44193 ?auto_44199 ) ) ( not ( = ?auto_44193 ?auto_44200 ) ) ( not ( = ?auto_44193 ?auto_44201 ) ) ( not ( = ?auto_44194 ?auto_44195 ) ) ( not ( = ?auto_44194 ?auto_44196 ) ) ( not ( = ?auto_44194 ?auto_44197 ) ) ( not ( = ?auto_44194 ?auto_44198 ) ) ( not ( = ?auto_44194 ?auto_44199 ) ) ( not ( = ?auto_44194 ?auto_44200 ) ) ( not ( = ?auto_44194 ?auto_44201 ) ) ( not ( = ?auto_44195 ?auto_44196 ) ) ( not ( = ?auto_44195 ?auto_44197 ) ) ( not ( = ?auto_44195 ?auto_44198 ) ) ( not ( = ?auto_44195 ?auto_44199 ) ) ( not ( = ?auto_44195 ?auto_44200 ) ) ( not ( = ?auto_44195 ?auto_44201 ) ) ( not ( = ?auto_44196 ?auto_44197 ) ) ( not ( = ?auto_44196 ?auto_44198 ) ) ( not ( = ?auto_44196 ?auto_44199 ) ) ( not ( = ?auto_44196 ?auto_44200 ) ) ( not ( = ?auto_44196 ?auto_44201 ) ) ( not ( = ?auto_44197 ?auto_44198 ) ) ( not ( = ?auto_44197 ?auto_44199 ) ) ( not ( = ?auto_44197 ?auto_44200 ) ) ( not ( = ?auto_44197 ?auto_44201 ) ) ( not ( = ?auto_44198 ?auto_44199 ) ) ( not ( = ?auto_44198 ?auto_44200 ) ) ( not ( = ?auto_44198 ?auto_44201 ) ) ( not ( = ?auto_44199 ?auto_44200 ) ) ( not ( = ?auto_44199 ?auto_44201 ) ) ( not ( = ?auto_44200 ?auto_44201 ) ) ( ON ?auto_44199 ?auto_44200 ) ( ON ?auto_44198 ?auto_44199 ) ( ON ?auto_44197 ?auto_44198 ) ( ON ?auto_44196 ?auto_44197 ) ( ON ?auto_44195 ?auto_44196 ) ( ON ?auto_44194 ?auto_44195 ) ( ON ?auto_44193 ?auto_44194 ) ( CLEAR ?auto_44193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44193 )
      ( MAKE-8PILE ?auto_44193 ?auto_44194 ?auto_44195 ?auto_44196 ?auto_44197 ?auto_44198 ?auto_44199 ?auto_44200 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_44210 - BLOCK
      ?auto_44211 - BLOCK
      ?auto_44212 - BLOCK
      ?auto_44213 - BLOCK
      ?auto_44214 - BLOCK
      ?auto_44215 - BLOCK
      ?auto_44216 - BLOCK
      ?auto_44217 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44217 ) ( not ( = ?auto_44210 ?auto_44211 ) ) ( not ( = ?auto_44210 ?auto_44212 ) ) ( not ( = ?auto_44210 ?auto_44213 ) ) ( not ( = ?auto_44210 ?auto_44214 ) ) ( not ( = ?auto_44210 ?auto_44215 ) ) ( not ( = ?auto_44210 ?auto_44216 ) ) ( not ( = ?auto_44210 ?auto_44217 ) ) ( not ( = ?auto_44211 ?auto_44212 ) ) ( not ( = ?auto_44211 ?auto_44213 ) ) ( not ( = ?auto_44211 ?auto_44214 ) ) ( not ( = ?auto_44211 ?auto_44215 ) ) ( not ( = ?auto_44211 ?auto_44216 ) ) ( not ( = ?auto_44211 ?auto_44217 ) ) ( not ( = ?auto_44212 ?auto_44213 ) ) ( not ( = ?auto_44212 ?auto_44214 ) ) ( not ( = ?auto_44212 ?auto_44215 ) ) ( not ( = ?auto_44212 ?auto_44216 ) ) ( not ( = ?auto_44212 ?auto_44217 ) ) ( not ( = ?auto_44213 ?auto_44214 ) ) ( not ( = ?auto_44213 ?auto_44215 ) ) ( not ( = ?auto_44213 ?auto_44216 ) ) ( not ( = ?auto_44213 ?auto_44217 ) ) ( not ( = ?auto_44214 ?auto_44215 ) ) ( not ( = ?auto_44214 ?auto_44216 ) ) ( not ( = ?auto_44214 ?auto_44217 ) ) ( not ( = ?auto_44215 ?auto_44216 ) ) ( not ( = ?auto_44215 ?auto_44217 ) ) ( not ( = ?auto_44216 ?auto_44217 ) ) ( ON ?auto_44216 ?auto_44217 ) ( ON ?auto_44215 ?auto_44216 ) ( ON ?auto_44214 ?auto_44215 ) ( ON ?auto_44213 ?auto_44214 ) ( ON ?auto_44212 ?auto_44213 ) ( ON ?auto_44211 ?auto_44212 ) ( ON ?auto_44210 ?auto_44211 ) ( CLEAR ?auto_44210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44210 )
      ( MAKE-8PILE ?auto_44210 ?auto_44211 ?auto_44212 ?auto_44213 ?auto_44214 ?auto_44215 ?auto_44216 ?auto_44217 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_44226 - BLOCK
      ?auto_44227 - BLOCK
      ?auto_44228 - BLOCK
      ?auto_44229 - BLOCK
      ?auto_44230 - BLOCK
      ?auto_44231 - BLOCK
      ?auto_44232 - BLOCK
      ?auto_44233 - BLOCK
    )
    :vars
    (
      ?auto_44234 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44226 ?auto_44227 ) ) ( not ( = ?auto_44226 ?auto_44228 ) ) ( not ( = ?auto_44226 ?auto_44229 ) ) ( not ( = ?auto_44226 ?auto_44230 ) ) ( not ( = ?auto_44226 ?auto_44231 ) ) ( not ( = ?auto_44226 ?auto_44232 ) ) ( not ( = ?auto_44226 ?auto_44233 ) ) ( not ( = ?auto_44227 ?auto_44228 ) ) ( not ( = ?auto_44227 ?auto_44229 ) ) ( not ( = ?auto_44227 ?auto_44230 ) ) ( not ( = ?auto_44227 ?auto_44231 ) ) ( not ( = ?auto_44227 ?auto_44232 ) ) ( not ( = ?auto_44227 ?auto_44233 ) ) ( not ( = ?auto_44228 ?auto_44229 ) ) ( not ( = ?auto_44228 ?auto_44230 ) ) ( not ( = ?auto_44228 ?auto_44231 ) ) ( not ( = ?auto_44228 ?auto_44232 ) ) ( not ( = ?auto_44228 ?auto_44233 ) ) ( not ( = ?auto_44229 ?auto_44230 ) ) ( not ( = ?auto_44229 ?auto_44231 ) ) ( not ( = ?auto_44229 ?auto_44232 ) ) ( not ( = ?auto_44229 ?auto_44233 ) ) ( not ( = ?auto_44230 ?auto_44231 ) ) ( not ( = ?auto_44230 ?auto_44232 ) ) ( not ( = ?auto_44230 ?auto_44233 ) ) ( not ( = ?auto_44231 ?auto_44232 ) ) ( not ( = ?auto_44231 ?auto_44233 ) ) ( not ( = ?auto_44232 ?auto_44233 ) ) ( ON ?auto_44226 ?auto_44234 ) ( not ( = ?auto_44233 ?auto_44234 ) ) ( not ( = ?auto_44232 ?auto_44234 ) ) ( not ( = ?auto_44231 ?auto_44234 ) ) ( not ( = ?auto_44230 ?auto_44234 ) ) ( not ( = ?auto_44229 ?auto_44234 ) ) ( not ( = ?auto_44228 ?auto_44234 ) ) ( not ( = ?auto_44227 ?auto_44234 ) ) ( not ( = ?auto_44226 ?auto_44234 ) ) ( ON ?auto_44227 ?auto_44226 ) ( ON ?auto_44228 ?auto_44227 ) ( ON ?auto_44229 ?auto_44228 ) ( ON ?auto_44230 ?auto_44229 ) ( ON ?auto_44231 ?auto_44230 ) ( ON ?auto_44232 ?auto_44231 ) ( ON ?auto_44233 ?auto_44232 ) ( CLEAR ?auto_44233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_44233 ?auto_44232 ?auto_44231 ?auto_44230 ?auto_44229 ?auto_44228 ?auto_44227 ?auto_44226 )
      ( MAKE-8PILE ?auto_44226 ?auto_44227 ?auto_44228 ?auto_44229 ?auto_44230 ?auto_44231 ?auto_44232 ?auto_44233 ) )
  )

)

