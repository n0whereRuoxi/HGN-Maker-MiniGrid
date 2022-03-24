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
      ?auto_219369 - BLOCK
    )
    :vars
    (
      ?auto_219370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219369 ?auto_219370 ) ( CLEAR ?auto_219369 ) ( HAND-EMPTY ) ( not ( = ?auto_219369 ?auto_219370 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_219369 ?auto_219370 )
      ( !PUTDOWN ?auto_219369 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_219372 - BLOCK
    )
    :vars
    (
      ?auto_219373 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219372 ?auto_219373 ) ( CLEAR ?auto_219372 ) ( HAND-EMPTY ) ( not ( = ?auto_219372 ?auto_219373 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_219372 ?auto_219373 )
      ( !PUTDOWN ?auto_219372 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_219376 - BLOCK
      ?auto_219377 - BLOCK
    )
    :vars
    (
      ?auto_219378 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_219376 ) ( ON ?auto_219377 ?auto_219378 ) ( CLEAR ?auto_219377 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_219376 ) ( not ( = ?auto_219376 ?auto_219377 ) ) ( not ( = ?auto_219376 ?auto_219378 ) ) ( not ( = ?auto_219377 ?auto_219378 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_219377 ?auto_219378 )
      ( !STACK ?auto_219377 ?auto_219376 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_219381 - BLOCK
      ?auto_219382 - BLOCK
    )
    :vars
    (
      ?auto_219383 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_219381 ) ( ON ?auto_219382 ?auto_219383 ) ( CLEAR ?auto_219382 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_219381 ) ( not ( = ?auto_219381 ?auto_219382 ) ) ( not ( = ?auto_219381 ?auto_219383 ) ) ( not ( = ?auto_219382 ?auto_219383 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_219382 ?auto_219383 )
      ( !STACK ?auto_219382 ?auto_219381 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_219386 - BLOCK
      ?auto_219387 - BLOCK
    )
    :vars
    (
      ?auto_219388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219387 ?auto_219388 ) ( not ( = ?auto_219386 ?auto_219387 ) ) ( not ( = ?auto_219386 ?auto_219388 ) ) ( not ( = ?auto_219387 ?auto_219388 ) ) ( ON ?auto_219386 ?auto_219387 ) ( CLEAR ?auto_219386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_219386 )
      ( MAKE-2PILE ?auto_219386 ?auto_219387 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_219391 - BLOCK
      ?auto_219392 - BLOCK
    )
    :vars
    (
      ?auto_219393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219392 ?auto_219393 ) ( not ( = ?auto_219391 ?auto_219392 ) ) ( not ( = ?auto_219391 ?auto_219393 ) ) ( not ( = ?auto_219392 ?auto_219393 ) ) ( ON ?auto_219391 ?auto_219392 ) ( CLEAR ?auto_219391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_219391 )
      ( MAKE-2PILE ?auto_219391 ?auto_219392 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_219397 - BLOCK
      ?auto_219398 - BLOCK
      ?auto_219399 - BLOCK
    )
    :vars
    (
      ?auto_219400 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_219398 ) ( ON ?auto_219399 ?auto_219400 ) ( CLEAR ?auto_219399 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_219397 ) ( ON ?auto_219398 ?auto_219397 ) ( not ( = ?auto_219397 ?auto_219398 ) ) ( not ( = ?auto_219397 ?auto_219399 ) ) ( not ( = ?auto_219397 ?auto_219400 ) ) ( not ( = ?auto_219398 ?auto_219399 ) ) ( not ( = ?auto_219398 ?auto_219400 ) ) ( not ( = ?auto_219399 ?auto_219400 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_219399 ?auto_219400 )
      ( !STACK ?auto_219399 ?auto_219398 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_219404 - BLOCK
      ?auto_219405 - BLOCK
      ?auto_219406 - BLOCK
    )
    :vars
    (
      ?auto_219407 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_219405 ) ( ON ?auto_219406 ?auto_219407 ) ( CLEAR ?auto_219406 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_219404 ) ( ON ?auto_219405 ?auto_219404 ) ( not ( = ?auto_219404 ?auto_219405 ) ) ( not ( = ?auto_219404 ?auto_219406 ) ) ( not ( = ?auto_219404 ?auto_219407 ) ) ( not ( = ?auto_219405 ?auto_219406 ) ) ( not ( = ?auto_219405 ?auto_219407 ) ) ( not ( = ?auto_219406 ?auto_219407 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_219406 ?auto_219407 )
      ( !STACK ?auto_219406 ?auto_219405 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_219411 - BLOCK
      ?auto_219412 - BLOCK
      ?auto_219413 - BLOCK
    )
    :vars
    (
      ?auto_219414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219413 ?auto_219414 ) ( ON-TABLE ?auto_219411 ) ( not ( = ?auto_219411 ?auto_219412 ) ) ( not ( = ?auto_219411 ?auto_219413 ) ) ( not ( = ?auto_219411 ?auto_219414 ) ) ( not ( = ?auto_219412 ?auto_219413 ) ) ( not ( = ?auto_219412 ?auto_219414 ) ) ( not ( = ?auto_219413 ?auto_219414 ) ) ( CLEAR ?auto_219411 ) ( ON ?auto_219412 ?auto_219413 ) ( CLEAR ?auto_219412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_219411 ?auto_219412 )
      ( MAKE-3PILE ?auto_219411 ?auto_219412 ?auto_219413 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_219418 - BLOCK
      ?auto_219419 - BLOCK
      ?auto_219420 - BLOCK
    )
    :vars
    (
      ?auto_219421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219420 ?auto_219421 ) ( ON-TABLE ?auto_219418 ) ( not ( = ?auto_219418 ?auto_219419 ) ) ( not ( = ?auto_219418 ?auto_219420 ) ) ( not ( = ?auto_219418 ?auto_219421 ) ) ( not ( = ?auto_219419 ?auto_219420 ) ) ( not ( = ?auto_219419 ?auto_219421 ) ) ( not ( = ?auto_219420 ?auto_219421 ) ) ( CLEAR ?auto_219418 ) ( ON ?auto_219419 ?auto_219420 ) ( CLEAR ?auto_219419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_219418 ?auto_219419 )
      ( MAKE-3PILE ?auto_219418 ?auto_219419 ?auto_219420 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_219425 - BLOCK
      ?auto_219426 - BLOCK
      ?auto_219427 - BLOCK
    )
    :vars
    (
      ?auto_219428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219427 ?auto_219428 ) ( not ( = ?auto_219425 ?auto_219426 ) ) ( not ( = ?auto_219425 ?auto_219427 ) ) ( not ( = ?auto_219425 ?auto_219428 ) ) ( not ( = ?auto_219426 ?auto_219427 ) ) ( not ( = ?auto_219426 ?auto_219428 ) ) ( not ( = ?auto_219427 ?auto_219428 ) ) ( ON ?auto_219426 ?auto_219427 ) ( ON ?auto_219425 ?auto_219426 ) ( CLEAR ?auto_219425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_219425 )
      ( MAKE-3PILE ?auto_219425 ?auto_219426 ?auto_219427 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_219432 - BLOCK
      ?auto_219433 - BLOCK
      ?auto_219434 - BLOCK
    )
    :vars
    (
      ?auto_219435 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219434 ?auto_219435 ) ( not ( = ?auto_219432 ?auto_219433 ) ) ( not ( = ?auto_219432 ?auto_219434 ) ) ( not ( = ?auto_219432 ?auto_219435 ) ) ( not ( = ?auto_219433 ?auto_219434 ) ) ( not ( = ?auto_219433 ?auto_219435 ) ) ( not ( = ?auto_219434 ?auto_219435 ) ) ( ON ?auto_219433 ?auto_219434 ) ( ON ?auto_219432 ?auto_219433 ) ( CLEAR ?auto_219432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_219432 )
      ( MAKE-3PILE ?auto_219432 ?auto_219433 ?auto_219434 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_219440 - BLOCK
      ?auto_219441 - BLOCK
      ?auto_219442 - BLOCK
      ?auto_219443 - BLOCK
    )
    :vars
    (
      ?auto_219444 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_219442 ) ( ON ?auto_219443 ?auto_219444 ) ( CLEAR ?auto_219443 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_219440 ) ( ON ?auto_219441 ?auto_219440 ) ( ON ?auto_219442 ?auto_219441 ) ( not ( = ?auto_219440 ?auto_219441 ) ) ( not ( = ?auto_219440 ?auto_219442 ) ) ( not ( = ?auto_219440 ?auto_219443 ) ) ( not ( = ?auto_219440 ?auto_219444 ) ) ( not ( = ?auto_219441 ?auto_219442 ) ) ( not ( = ?auto_219441 ?auto_219443 ) ) ( not ( = ?auto_219441 ?auto_219444 ) ) ( not ( = ?auto_219442 ?auto_219443 ) ) ( not ( = ?auto_219442 ?auto_219444 ) ) ( not ( = ?auto_219443 ?auto_219444 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_219443 ?auto_219444 )
      ( !STACK ?auto_219443 ?auto_219442 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_219449 - BLOCK
      ?auto_219450 - BLOCK
      ?auto_219451 - BLOCK
      ?auto_219452 - BLOCK
    )
    :vars
    (
      ?auto_219453 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_219451 ) ( ON ?auto_219452 ?auto_219453 ) ( CLEAR ?auto_219452 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_219449 ) ( ON ?auto_219450 ?auto_219449 ) ( ON ?auto_219451 ?auto_219450 ) ( not ( = ?auto_219449 ?auto_219450 ) ) ( not ( = ?auto_219449 ?auto_219451 ) ) ( not ( = ?auto_219449 ?auto_219452 ) ) ( not ( = ?auto_219449 ?auto_219453 ) ) ( not ( = ?auto_219450 ?auto_219451 ) ) ( not ( = ?auto_219450 ?auto_219452 ) ) ( not ( = ?auto_219450 ?auto_219453 ) ) ( not ( = ?auto_219451 ?auto_219452 ) ) ( not ( = ?auto_219451 ?auto_219453 ) ) ( not ( = ?auto_219452 ?auto_219453 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_219452 ?auto_219453 )
      ( !STACK ?auto_219452 ?auto_219451 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_219458 - BLOCK
      ?auto_219459 - BLOCK
      ?auto_219460 - BLOCK
      ?auto_219461 - BLOCK
    )
    :vars
    (
      ?auto_219462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219461 ?auto_219462 ) ( ON-TABLE ?auto_219458 ) ( ON ?auto_219459 ?auto_219458 ) ( not ( = ?auto_219458 ?auto_219459 ) ) ( not ( = ?auto_219458 ?auto_219460 ) ) ( not ( = ?auto_219458 ?auto_219461 ) ) ( not ( = ?auto_219458 ?auto_219462 ) ) ( not ( = ?auto_219459 ?auto_219460 ) ) ( not ( = ?auto_219459 ?auto_219461 ) ) ( not ( = ?auto_219459 ?auto_219462 ) ) ( not ( = ?auto_219460 ?auto_219461 ) ) ( not ( = ?auto_219460 ?auto_219462 ) ) ( not ( = ?auto_219461 ?auto_219462 ) ) ( CLEAR ?auto_219459 ) ( ON ?auto_219460 ?auto_219461 ) ( CLEAR ?auto_219460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_219458 ?auto_219459 ?auto_219460 )
      ( MAKE-4PILE ?auto_219458 ?auto_219459 ?auto_219460 ?auto_219461 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_219467 - BLOCK
      ?auto_219468 - BLOCK
      ?auto_219469 - BLOCK
      ?auto_219470 - BLOCK
    )
    :vars
    (
      ?auto_219471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219470 ?auto_219471 ) ( ON-TABLE ?auto_219467 ) ( ON ?auto_219468 ?auto_219467 ) ( not ( = ?auto_219467 ?auto_219468 ) ) ( not ( = ?auto_219467 ?auto_219469 ) ) ( not ( = ?auto_219467 ?auto_219470 ) ) ( not ( = ?auto_219467 ?auto_219471 ) ) ( not ( = ?auto_219468 ?auto_219469 ) ) ( not ( = ?auto_219468 ?auto_219470 ) ) ( not ( = ?auto_219468 ?auto_219471 ) ) ( not ( = ?auto_219469 ?auto_219470 ) ) ( not ( = ?auto_219469 ?auto_219471 ) ) ( not ( = ?auto_219470 ?auto_219471 ) ) ( CLEAR ?auto_219468 ) ( ON ?auto_219469 ?auto_219470 ) ( CLEAR ?auto_219469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_219467 ?auto_219468 ?auto_219469 )
      ( MAKE-4PILE ?auto_219467 ?auto_219468 ?auto_219469 ?auto_219470 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_219476 - BLOCK
      ?auto_219477 - BLOCK
      ?auto_219478 - BLOCK
      ?auto_219479 - BLOCK
    )
    :vars
    (
      ?auto_219480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219479 ?auto_219480 ) ( ON-TABLE ?auto_219476 ) ( not ( = ?auto_219476 ?auto_219477 ) ) ( not ( = ?auto_219476 ?auto_219478 ) ) ( not ( = ?auto_219476 ?auto_219479 ) ) ( not ( = ?auto_219476 ?auto_219480 ) ) ( not ( = ?auto_219477 ?auto_219478 ) ) ( not ( = ?auto_219477 ?auto_219479 ) ) ( not ( = ?auto_219477 ?auto_219480 ) ) ( not ( = ?auto_219478 ?auto_219479 ) ) ( not ( = ?auto_219478 ?auto_219480 ) ) ( not ( = ?auto_219479 ?auto_219480 ) ) ( ON ?auto_219478 ?auto_219479 ) ( CLEAR ?auto_219476 ) ( ON ?auto_219477 ?auto_219478 ) ( CLEAR ?auto_219477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_219476 ?auto_219477 )
      ( MAKE-4PILE ?auto_219476 ?auto_219477 ?auto_219478 ?auto_219479 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_219485 - BLOCK
      ?auto_219486 - BLOCK
      ?auto_219487 - BLOCK
      ?auto_219488 - BLOCK
    )
    :vars
    (
      ?auto_219489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219488 ?auto_219489 ) ( ON-TABLE ?auto_219485 ) ( not ( = ?auto_219485 ?auto_219486 ) ) ( not ( = ?auto_219485 ?auto_219487 ) ) ( not ( = ?auto_219485 ?auto_219488 ) ) ( not ( = ?auto_219485 ?auto_219489 ) ) ( not ( = ?auto_219486 ?auto_219487 ) ) ( not ( = ?auto_219486 ?auto_219488 ) ) ( not ( = ?auto_219486 ?auto_219489 ) ) ( not ( = ?auto_219487 ?auto_219488 ) ) ( not ( = ?auto_219487 ?auto_219489 ) ) ( not ( = ?auto_219488 ?auto_219489 ) ) ( ON ?auto_219487 ?auto_219488 ) ( CLEAR ?auto_219485 ) ( ON ?auto_219486 ?auto_219487 ) ( CLEAR ?auto_219486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_219485 ?auto_219486 )
      ( MAKE-4PILE ?auto_219485 ?auto_219486 ?auto_219487 ?auto_219488 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_219494 - BLOCK
      ?auto_219495 - BLOCK
      ?auto_219496 - BLOCK
      ?auto_219497 - BLOCK
    )
    :vars
    (
      ?auto_219498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219497 ?auto_219498 ) ( not ( = ?auto_219494 ?auto_219495 ) ) ( not ( = ?auto_219494 ?auto_219496 ) ) ( not ( = ?auto_219494 ?auto_219497 ) ) ( not ( = ?auto_219494 ?auto_219498 ) ) ( not ( = ?auto_219495 ?auto_219496 ) ) ( not ( = ?auto_219495 ?auto_219497 ) ) ( not ( = ?auto_219495 ?auto_219498 ) ) ( not ( = ?auto_219496 ?auto_219497 ) ) ( not ( = ?auto_219496 ?auto_219498 ) ) ( not ( = ?auto_219497 ?auto_219498 ) ) ( ON ?auto_219496 ?auto_219497 ) ( ON ?auto_219495 ?auto_219496 ) ( ON ?auto_219494 ?auto_219495 ) ( CLEAR ?auto_219494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_219494 )
      ( MAKE-4PILE ?auto_219494 ?auto_219495 ?auto_219496 ?auto_219497 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_219503 - BLOCK
      ?auto_219504 - BLOCK
      ?auto_219505 - BLOCK
      ?auto_219506 - BLOCK
    )
    :vars
    (
      ?auto_219507 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219506 ?auto_219507 ) ( not ( = ?auto_219503 ?auto_219504 ) ) ( not ( = ?auto_219503 ?auto_219505 ) ) ( not ( = ?auto_219503 ?auto_219506 ) ) ( not ( = ?auto_219503 ?auto_219507 ) ) ( not ( = ?auto_219504 ?auto_219505 ) ) ( not ( = ?auto_219504 ?auto_219506 ) ) ( not ( = ?auto_219504 ?auto_219507 ) ) ( not ( = ?auto_219505 ?auto_219506 ) ) ( not ( = ?auto_219505 ?auto_219507 ) ) ( not ( = ?auto_219506 ?auto_219507 ) ) ( ON ?auto_219505 ?auto_219506 ) ( ON ?auto_219504 ?auto_219505 ) ( ON ?auto_219503 ?auto_219504 ) ( CLEAR ?auto_219503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_219503 )
      ( MAKE-4PILE ?auto_219503 ?auto_219504 ?auto_219505 ?auto_219506 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_219513 - BLOCK
      ?auto_219514 - BLOCK
      ?auto_219515 - BLOCK
      ?auto_219516 - BLOCK
      ?auto_219517 - BLOCK
    )
    :vars
    (
      ?auto_219518 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_219516 ) ( ON ?auto_219517 ?auto_219518 ) ( CLEAR ?auto_219517 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_219513 ) ( ON ?auto_219514 ?auto_219513 ) ( ON ?auto_219515 ?auto_219514 ) ( ON ?auto_219516 ?auto_219515 ) ( not ( = ?auto_219513 ?auto_219514 ) ) ( not ( = ?auto_219513 ?auto_219515 ) ) ( not ( = ?auto_219513 ?auto_219516 ) ) ( not ( = ?auto_219513 ?auto_219517 ) ) ( not ( = ?auto_219513 ?auto_219518 ) ) ( not ( = ?auto_219514 ?auto_219515 ) ) ( not ( = ?auto_219514 ?auto_219516 ) ) ( not ( = ?auto_219514 ?auto_219517 ) ) ( not ( = ?auto_219514 ?auto_219518 ) ) ( not ( = ?auto_219515 ?auto_219516 ) ) ( not ( = ?auto_219515 ?auto_219517 ) ) ( not ( = ?auto_219515 ?auto_219518 ) ) ( not ( = ?auto_219516 ?auto_219517 ) ) ( not ( = ?auto_219516 ?auto_219518 ) ) ( not ( = ?auto_219517 ?auto_219518 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_219517 ?auto_219518 )
      ( !STACK ?auto_219517 ?auto_219516 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_219524 - BLOCK
      ?auto_219525 - BLOCK
      ?auto_219526 - BLOCK
      ?auto_219527 - BLOCK
      ?auto_219528 - BLOCK
    )
    :vars
    (
      ?auto_219529 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_219527 ) ( ON ?auto_219528 ?auto_219529 ) ( CLEAR ?auto_219528 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_219524 ) ( ON ?auto_219525 ?auto_219524 ) ( ON ?auto_219526 ?auto_219525 ) ( ON ?auto_219527 ?auto_219526 ) ( not ( = ?auto_219524 ?auto_219525 ) ) ( not ( = ?auto_219524 ?auto_219526 ) ) ( not ( = ?auto_219524 ?auto_219527 ) ) ( not ( = ?auto_219524 ?auto_219528 ) ) ( not ( = ?auto_219524 ?auto_219529 ) ) ( not ( = ?auto_219525 ?auto_219526 ) ) ( not ( = ?auto_219525 ?auto_219527 ) ) ( not ( = ?auto_219525 ?auto_219528 ) ) ( not ( = ?auto_219525 ?auto_219529 ) ) ( not ( = ?auto_219526 ?auto_219527 ) ) ( not ( = ?auto_219526 ?auto_219528 ) ) ( not ( = ?auto_219526 ?auto_219529 ) ) ( not ( = ?auto_219527 ?auto_219528 ) ) ( not ( = ?auto_219527 ?auto_219529 ) ) ( not ( = ?auto_219528 ?auto_219529 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_219528 ?auto_219529 )
      ( !STACK ?auto_219528 ?auto_219527 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_219535 - BLOCK
      ?auto_219536 - BLOCK
      ?auto_219537 - BLOCK
      ?auto_219538 - BLOCK
      ?auto_219539 - BLOCK
    )
    :vars
    (
      ?auto_219540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219539 ?auto_219540 ) ( ON-TABLE ?auto_219535 ) ( ON ?auto_219536 ?auto_219535 ) ( ON ?auto_219537 ?auto_219536 ) ( not ( = ?auto_219535 ?auto_219536 ) ) ( not ( = ?auto_219535 ?auto_219537 ) ) ( not ( = ?auto_219535 ?auto_219538 ) ) ( not ( = ?auto_219535 ?auto_219539 ) ) ( not ( = ?auto_219535 ?auto_219540 ) ) ( not ( = ?auto_219536 ?auto_219537 ) ) ( not ( = ?auto_219536 ?auto_219538 ) ) ( not ( = ?auto_219536 ?auto_219539 ) ) ( not ( = ?auto_219536 ?auto_219540 ) ) ( not ( = ?auto_219537 ?auto_219538 ) ) ( not ( = ?auto_219537 ?auto_219539 ) ) ( not ( = ?auto_219537 ?auto_219540 ) ) ( not ( = ?auto_219538 ?auto_219539 ) ) ( not ( = ?auto_219538 ?auto_219540 ) ) ( not ( = ?auto_219539 ?auto_219540 ) ) ( CLEAR ?auto_219537 ) ( ON ?auto_219538 ?auto_219539 ) ( CLEAR ?auto_219538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_219535 ?auto_219536 ?auto_219537 ?auto_219538 )
      ( MAKE-5PILE ?auto_219535 ?auto_219536 ?auto_219537 ?auto_219538 ?auto_219539 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_219546 - BLOCK
      ?auto_219547 - BLOCK
      ?auto_219548 - BLOCK
      ?auto_219549 - BLOCK
      ?auto_219550 - BLOCK
    )
    :vars
    (
      ?auto_219551 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219550 ?auto_219551 ) ( ON-TABLE ?auto_219546 ) ( ON ?auto_219547 ?auto_219546 ) ( ON ?auto_219548 ?auto_219547 ) ( not ( = ?auto_219546 ?auto_219547 ) ) ( not ( = ?auto_219546 ?auto_219548 ) ) ( not ( = ?auto_219546 ?auto_219549 ) ) ( not ( = ?auto_219546 ?auto_219550 ) ) ( not ( = ?auto_219546 ?auto_219551 ) ) ( not ( = ?auto_219547 ?auto_219548 ) ) ( not ( = ?auto_219547 ?auto_219549 ) ) ( not ( = ?auto_219547 ?auto_219550 ) ) ( not ( = ?auto_219547 ?auto_219551 ) ) ( not ( = ?auto_219548 ?auto_219549 ) ) ( not ( = ?auto_219548 ?auto_219550 ) ) ( not ( = ?auto_219548 ?auto_219551 ) ) ( not ( = ?auto_219549 ?auto_219550 ) ) ( not ( = ?auto_219549 ?auto_219551 ) ) ( not ( = ?auto_219550 ?auto_219551 ) ) ( CLEAR ?auto_219548 ) ( ON ?auto_219549 ?auto_219550 ) ( CLEAR ?auto_219549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_219546 ?auto_219547 ?auto_219548 ?auto_219549 )
      ( MAKE-5PILE ?auto_219546 ?auto_219547 ?auto_219548 ?auto_219549 ?auto_219550 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_219557 - BLOCK
      ?auto_219558 - BLOCK
      ?auto_219559 - BLOCK
      ?auto_219560 - BLOCK
      ?auto_219561 - BLOCK
    )
    :vars
    (
      ?auto_219562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219561 ?auto_219562 ) ( ON-TABLE ?auto_219557 ) ( ON ?auto_219558 ?auto_219557 ) ( not ( = ?auto_219557 ?auto_219558 ) ) ( not ( = ?auto_219557 ?auto_219559 ) ) ( not ( = ?auto_219557 ?auto_219560 ) ) ( not ( = ?auto_219557 ?auto_219561 ) ) ( not ( = ?auto_219557 ?auto_219562 ) ) ( not ( = ?auto_219558 ?auto_219559 ) ) ( not ( = ?auto_219558 ?auto_219560 ) ) ( not ( = ?auto_219558 ?auto_219561 ) ) ( not ( = ?auto_219558 ?auto_219562 ) ) ( not ( = ?auto_219559 ?auto_219560 ) ) ( not ( = ?auto_219559 ?auto_219561 ) ) ( not ( = ?auto_219559 ?auto_219562 ) ) ( not ( = ?auto_219560 ?auto_219561 ) ) ( not ( = ?auto_219560 ?auto_219562 ) ) ( not ( = ?auto_219561 ?auto_219562 ) ) ( ON ?auto_219560 ?auto_219561 ) ( CLEAR ?auto_219558 ) ( ON ?auto_219559 ?auto_219560 ) ( CLEAR ?auto_219559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_219557 ?auto_219558 ?auto_219559 )
      ( MAKE-5PILE ?auto_219557 ?auto_219558 ?auto_219559 ?auto_219560 ?auto_219561 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_219568 - BLOCK
      ?auto_219569 - BLOCK
      ?auto_219570 - BLOCK
      ?auto_219571 - BLOCK
      ?auto_219572 - BLOCK
    )
    :vars
    (
      ?auto_219573 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219572 ?auto_219573 ) ( ON-TABLE ?auto_219568 ) ( ON ?auto_219569 ?auto_219568 ) ( not ( = ?auto_219568 ?auto_219569 ) ) ( not ( = ?auto_219568 ?auto_219570 ) ) ( not ( = ?auto_219568 ?auto_219571 ) ) ( not ( = ?auto_219568 ?auto_219572 ) ) ( not ( = ?auto_219568 ?auto_219573 ) ) ( not ( = ?auto_219569 ?auto_219570 ) ) ( not ( = ?auto_219569 ?auto_219571 ) ) ( not ( = ?auto_219569 ?auto_219572 ) ) ( not ( = ?auto_219569 ?auto_219573 ) ) ( not ( = ?auto_219570 ?auto_219571 ) ) ( not ( = ?auto_219570 ?auto_219572 ) ) ( not ( = ?auto_219570 ?auto_219573 ) ) ( not ( = ?auto_219571 ?auto_219572 ) ) ( not ( = ?auto_219571 ?auto_219573 ) ) ( not ( = ?auto_219572 ?auto_219573 ) ) ( ON ?auto_219571 ?auto_219572 ) ( CLEAR ?auto_219569 ) ( ON ?auto_219570 ?auto_219571 ) ( CLEAR ?auto_219570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_219568 ?auto_219569 ?auto_219570 )
      ( MAKE-5PILE ?auto_219568 ?auto_219569 ?auto_219570 ?auto_219571 ?auto_219572 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_219579 - BLOCK
      ?auto_219580 - BLOCK
      ?auto_219581 - BLOCK
      ?auto_219582 - BLOCK
      ?auto_219583 - BLOCK
    )
    :vars
    (
      ?auto_219584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219583 ?auto_219584 ) ( ON-TABLE ?auto_219579 ) ( not ( = ?auto_219579 ?auto_219580 ) ) ( not ( = ?auto_219579 ?auto_219581 ) ) ( not ( = ?auto_219579 ?auto_219582 ) ) ( not ( = ?auto_219579 ?auto_219583 ) ) ( not ( = ?auto_219579 ?auto_219584 ) ) ( not ( = ?auto_219580 ?auto_219581 ) ) ( not ( = ?auto_219580 ?auto_219582 ) ) ( not ( = ?auto_219580 ?auto_219583 ) ) ( not ( = ?auto_219580 ?auto_219584 ) ) ( not ( = ?auto_219581 ?auto_219582 ) ) ( not ( = ?auto_219581 ?auto_219583 ) ) ( not ( = ?auto_219581 ?auto_219584 ) ) ( not ( = ?auto_219582 ?auto_219583 ) ) ( not ( = ?auto_219582 ?auto_219584 ) ) ( not ( = ?auto_219583 ?auto_219584 ) ) ( ON ?auto_219582 ?auto_219583 ) ( ON ?auto_219581 ?auto_219582 ) ( CLEAR ?auto_219579 ) ( ON ?auto_219580 ?auto_219581 ) ( CLEAR ?auto_219580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_219579 ?auto_219580 )
      ( MAKE-5PILE ?auto_219579 ?auto_219580 ?auto_219581 ?auto_219582 ?auto_219583 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_219590 - BLOCK
      ?auto_219591 - BLOCK
      ?auto_219592 - BLOCK
      ?auto_219593 - BLOCK
      ?auto_219594 - BLOCK
    )
    :vars
    (
      ?auto_219595 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219594 ?auto_219595 ) ( ON-TABLE ?auto_219590 ) ( not ( = ?auto_219590 ?auto_219591 ) ) ( not ( = ?auto_219590 ?auto_219592 ) ) ( not ( = ?auto_219590 ?auto_219593 ) ) ( not ( = ?auto_219590 ?auto_219594 ) ) ( not ( = ?auto_219590 ?auto_219595 ) ) ( not ( = ?auto_219591 ?auto_219592 ) ) ( not ( = ?auto_219591 ?auto_219593 ) ) ( not ( = ?auto_219591 ?auto_219594 ) ) ( not ( = ?auto_219591 ?auto_219595 ) ) ( not ( = ?auto_219592 ?auto_219593 ) ) ( not ( = ?auto_219592 ?auto_219594 ) ) ( not ( = ?auto_219592 ?auto_219595 ) ) ( not ( = ?auto_219593 ?auto_219594 ) ) ( not ( = ?auto_219593 ?auto_219595 ) ) ( not ( = ?auto_219594 ?auto_219595 ) ) ( ON ?auto_219593 ?auto_219594 ) ( ON ?auto_219592 ?auto_219593 ) ( CLEAR ?auto_219590 ) ( ON ?auto_219591 ?auto_219592 ) ( CLEAR ?auto_219591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_219590 ?auto_219591 )
      ( MAKE-5PILE ?auto_219590 ?auto_219591 ?auto_219592 ?auto_219593 ?auto_219594 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_219601 - BLOCK
      ?auto_219602 - BLOCK
      ?auto_219603 - BLOCK
      ?auto_219604 - BLOCK
      ?auto_219605 - BLOCK
    )
    :vars
    (
      ?auto_219606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219605 ?auto_219606 ) ( not ( = ?auto_219601 ?auto_219602 ) ) ( not ( = ?auto_219601 ?auto_219603 ) ) ( not ( = ?auto_219601 ?auto_219604 ) ) ( not ( = ?auto_219601 ?auto_219605 ) ) ( not ( = ?auto_219601 ?auto_219606 ) ) ( not ( = ?auto_219602 ?auto_219603 ) ) ( not ( = ?auto_219602 ?auto_219604 ) ) ( not ( = ?auto_219602 ?auto_219605 ) ) ( not ( = ?auto_219602 ?auto_219606 ) ) ( not ( = ?auto_219603 ?auto_219604 ) ) ( not ( = ?auto_219603 ?auto_219605 ) ) ( not ( = ?auto_219603 ?auto_219606 ) ) ( not ( = ?auto_219604 ?auto_219605 ) ) ( not ( = ?auto_219604 ?auto_219606 ) ) ( not ( = ?auto_219605 ?auto_219606 ) ) ( ON ?auto_219604 ?auto_219605 ) ( ON ?auto_219603 ?auto_219604 ) ( ON ?auto_219602 ?auto_219603 ) ( ON ?auto_219601 ?auto_219602 ) ( CLEAR ?auto_219601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_219601 )
      ( MAKE-5PILE ?auto_219601 ?auto_219602 ?auto_219603 ?auto_219604 ?auto_219605 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_219612 - BLOCK
      ?auto_219613 - BLOCK
      ?auto_219614 - BLOCK
      ?auto_219615 - BLOCK
      ?auto_219616 - BLOCK
    )
    :vars
    (
      ?auto_219617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219616 ?auto_219617 ) ( not ( = ?auto_219612 ?auto_219613 ) ) ( not ( = ?auto_219612 ?auto_219614 ) ) ( not ( = ?auto_219612 ?auto_219615 ) ) ( not ( = ?auto_219612 ?auto_219616 ) ) ( not ( = ?auto_219612 ?auto_219617 ) ) ( not ( = ?auto_219613 ?auto_219614 ) ) ( not ( = ?auto_219613 ?auto_219615 ) ) ( not ( = ?auto_219613 ?auto_219616 ) ) ( not ( = ?auto_219613 ?auto_219617 ) ) ( not ( = ?auto_219614 ?auto_219615 ) ) ( not ( = ?auto_219614 ?auto_219616 ) ) ( not ( = ?auto_219614 ?auto_219617 ) ) ( not ( = ?auto_219615 ?auto_219616 ) ) ( not ( = ?auto_219615 ?auto_219617 ) ) ( not ( = ?auto_219616 ?auto_219617 ) ) ( ON ?auto_219615 ?auto_219616 ) ( ON ?auto_219614 ?auto_219615 ) ( ON ?auto_219613 ?auto_219614 ) ( ON ?auto_219612 ?auto_219613 ) ( CLEAR ?auto_219612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_219612 )
      ( MAKE-5PILE ?auto_219612 ?auto_219613 ?auto_219614 ?auto_219615 ?auto_219616 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_219624 - BLOCK
      ?auto_219625 - BLOCK
      ?auto_219626 - BLOCK
      ?auto_219627 - BLOCK
      ?auto_219628 - BLOCK
      ?auto_219629 - BLOCK
    )
    :vars
    (
      ?auto_219630 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_219628 ) ( ON ?auto_219629 ?auto_219630 ) ( CLEAR ?auto_219629 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_219624 ) ( ON ?auto_219625 ?auto_219624 ) ( ON ?auto_219626 ?auto_219625 ) ( ON ?auto_219627 ?auto_219626 ) ( ON ?auto_219628 ?auto_219627 ) ( not ( = ?auto_219624 ?auto_219625 ) ) ( not ( = ?auto_219624 ?auto_219626 ) ) ( not ( = ?auto_219624 ?auto_219627 ) ) ( not ( = ?auto_219624 ?auto_219628 ) ) ( not ( = ?auto_219624 ?auto_219629 ) ) ( not ( = ?auto_219624 ?auto_219630 ) ) ( not ( = ?auto_219625 ?auto_219626 ) ) ( not ( = ?auto_219625 ?auto_219627 ) ) ( not ( = ?auto_219625 ?auto_219628 ) ) ( not ( = ?auto_219625 ?auto_219629 ) ) ( not ( = ?auto_219625 ?auto_219630 ) ) ( not ( = ?auto_219626 ?auto_219627 ) ) ( not ( = ?auto_219626 ?auto_219628 ) ) ( not ( = ?auto_219626 ?auto_219629 ) ) ( not ( = ?auto_219626 ?auto_219630 ) ) ( not ( = ?auto_219627 ?auto_219628 ) ) ( not ( = ?auto_219627 ?auto_219629 ) ) ( not ( = ?auto_219627 ?auto_219630 ) ) ( not ( = ?auto_219628 ?auto_219629 ) ) ( not ( = ?auto_219628 ?auto_219630 ) ) ( not ( = ?auto_219629 ?auto_219630 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_219629 ?auto_219630 )
      ( !STACK ?auto_219629 ?auto_219628 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_219637 - BLOCK
      ?auto_219638 - BLOCK
      ?auto_219639 - BLOCK
      ?auto_219640 - BLOCK
      ?auto_219641 - BLOCK
      ?auto_219642 - BLOCK
    )
    :vars
    (
      ?auto_219643 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_219641 ) ( ON ?auto_219642 ?auto_219643 ) ( CLEAR ?auto_219642 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_219637 ) ( ON ?auto_219638 ?auto_219637 ) ( ON ?auto_219639 ?auto_219638 ) ( ON ?auto_219640 ?auto_219639 ) ( ON ?auto_219641 ?auto_219640 ) ( not ( = ?auto_219637 ?auto_219638 ) ) ( not ( = ?auto_219637 ?auto_219639 ) ) ( not ( = ?auto_219637 ?auto_219640 ) ) ( not ( = ?auto_219637 ?auto_219641 ) ) ( not ( = ?auto_219637 ?auto_219642 ) ) ( not ( = ?auto_219637 ?auto_219643 ) ) ( not ( = ?auto_219638 ?auto_219639 ) ) ( not ( = ?auto_219638 ?auto_219640 ) ) ( not ( = ?auto_219638 ?auto_219641 ) ) ( not ( = ?auto_219638 ?auto_219642 ) ) ( not ( = ?auto_219638 ?auto_219643 ) ) ( not ( = ?auto_219639 ?auto_219640 ) ) ( not ( = ?auto_219639 ?auto_219641 ) ) ( not ( = ?auto_219639 ?auto_219642 ) ) ( not ( = ?auto_219639 ?auto_219643 ) ) ( not ( = ?auto_219640 ?auto_219641 ) ) ( not ( = ?auto_219640 ?auto_219642 ) ) ( not ( = ?auto_219640 ?auto_219643 ) ) ( not ( = ?auto_219641 ?auto_219642 ) ) ( not ( = ?auto_219641 ?auto_219643 ) ) ( not ( = ?auto_219642 ?auto_219643 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_219642 ?auto_219643 )
      ( !STACK ?auto_219642 ?auto_219641 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_219650 - BLOCK
      ?auto_219651 - BLOCK
      ?auto_219652 - BLOCK
      ?auto_219653 - BLOCK
      ?auto_219654 - BLOCK
      ?auto_219655 - BLOCK
    )
    :vars
    (
      ?auto_219656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219655 ?auto_219656 ) ( ON-TABLE ?auto_219650 ) ( ON ?auto_219651 ?auto_219650 ) ( ON ?auto_219652 ?auto_219651 ) ( ON ?auto_219653 ?auto_219652 ) ( not ( = ?auto_219650 ?auto_219651 ) ) ( not ( = ?auto_219650 ?auto_219652 ) ) ( not ( = ?auto_219650 ?auto_219653 ) ) ( not ( = ?auto_219650 ?auto_219654 ) ) ( not ( = ?auto_219650 ?auto_219655 ) ) ( not ( = ?auto_219650 ?auto_219656 ) ) ( not ( = ?auto_219651 ?auto_219652 ) ) ( not ( = ?auto_219651 ?auto_219653 ) ) ( not ( = ?auto_219651 ?auto_219654 ) ) ( not ( = ?auto_219651 ?auto_219655 ) ) ( not ( = ?auto_219651 ?auto_219656 ) ) ( not ( = ?auto_219652 ?auto_219653 ) ) ( not ( = ?auto_219652 ?auto_219654 ) ) ( not ( = ?auto_219652 ?auto_219655 ) ) ( not ( = ?auto_219652 ?auto_219656 ) ) ( not ( = ?auto_219653 ?auto_219654 ) ) ( not ( = ?auto_219653 ?auto_219655 ) ) ( not ( = ?auto_219653 ?auto_219656 ) ) ( not ( = ?auto_219654 ?auto_219655 ) ) ( not ( = ?auto_219654 ?auto_219656 ) ) ( not ( = ?auto_219655 ?auto_219656 ) ) ( CLEAR ?auto_219653 ) ( ON ?auto_219654 ?auto_219655 ) ( CLEAR ?auto_219654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_219650 ?auto_219651 ?auto_219652 ?auto_219653 ?auto_219654 )
      ( MAKE-6PILE ?auto_219650 ?auto_219651 ?auto_219652 ?auto_219653 ?auto_219654 ?auto_219655 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_219663 - BLOCK
      ?auto_219664 - BLOCK
      ?auto_219665 - BLOCK
      ?auto_219666 - BLOCK
      ?auto_219667 - BLOCK
      ?auto_219668 - BLOCK
    )
    :vars
    (
      ?auto_219669 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219668 ?auto_219669 ) ( ON-TABLE ?auto_219663 ) ( ON ?auto_219664 ?auto_219663 ) ( ON ?auto_219665 ?auto_219664 ) ( ON ?auto_219666 ?auto_219665 ) ( not ( = ?auto_219663 ?auto_219664 ) ) ( not ( = ?auto_219663 ?auto_219665 ) ) ( not ( = ?auto_219663 ?auto_219666 ) ) ( not ( = ?auto_219663 ?auto_219667 ) ) ( not ( = ?auto_219663 ?auto_219668 ) ) ( not ( = ?auto_219663 ?auto_219669 ) ) ( not ( = ?auto_219664 ?auto_219665 ) ) ( not ( = ?auto_219664 ?auto_219666 ) ) ( not ( = ?auto_219664 ?auto_219667 ) ) ( not ( = ?auto_219664 ?auto_219668 ) ) ( not ( = ?auto_219664 ?auto_219669 ) ) ( not ( = ?auto_219665 ?auto_219666 ) ) ( not ( = ?auto_219665 ?auto_219667 ) ) ( not ( = ?auto_219665 ?auto_219668 ) ) ( not ( = ?auto_219665 ?auto_219669 ) ) ( not ( = ?auto_219666 ?auto_219667 ) ) ( not ( = ?auto_219666 ?auto_219668 ) ) ( not ( = ?auto_219666 ?auto_219669 ) ) ( not ( = ?auto_219667 ?auto_219668 ) ) ( not ( = ?auto_219667 ?auto_219669 ) ) ( not ( = ?auto_219668 ?auto_219669 ) ) ( CLEAR ?auto_219666 ) ( ON ?auto_219667 ?auto_219668 ) ( CLEAR ?auto_219667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_219663 ?auto_219664 ?auto_219665 ?auto_219666 ?auto_219667 )
      ( MAKE-6PILE ?auto_219663 ?auto_219664 ?auto_219665 ?auto_219666 ?auto_219667 ?auto_219668 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_219676 - BLOCK
      ?auto_219677 - BLOCK
      ?auto_219678 - BLOCK
      ?auto_219679 - BLOCK
      ?auto_219680 - BLOCK
      ?auto_219681 - BLOCK
    )
    :vars
    (
      ?auto_219682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219681 ?auto_219682 ) ( ON-TABLE ?auto_219676 ) ( ON ?auto_219677 ?auto_219676 ) ( ON ?auto_219678 ?auto_219677 ) ( not ( = ?auto_219676 ?auto_219677 ) ) ( not ( = ?auto_219676 ?auto_219678 ) ) ( not ( = ?auto_219676 ?auto_219679 ) ) ( not ( = ?auto_219676 ?auto_219680 ) ) ( not ( = ?auto_219676 ?auto_219681 ) ) ( not ( = ?auto_219676 ?auto_219682 ) ) ( not ( = ?auto_219677 ?auto_219678 ) ) ( not ( = ?auto_219677 ?auto_219679 ) ) ( not ( = ?auto_219677 ?auto_219680 ) ) ( not ( = ?auto_219677 ?auto_219681 ) ) ( not ( = ?auto_219677 ?auto_219682 ) ) ( not ( = ?auto_219678 ?auto_219679 ) ) ( not ( = ?auto_219678 ?auto_219680 ) ) ( not ( = ?auto_219678 ?auto_219681 ) ) ( not ( = ?auto_219678 ?auto_219682 ) ) ( not ( = ?auto_219679 ?auto_219680 ) ) ( not ( = ?auto_219679 ?auto_219681 ) ) ( not ( = ?auto_219679 ?auto_219682 ) ) ( not ( = ?auto_219680 ?auto_219681 ) ) ( not ( = ?auto_219680 ?auto_219682 ) ) ( not ( = ?auto_219681 ?auto_219682 ) ) ( ON ?auto_219680 ?auto_219681 ) ( CLEAR ?auto_219678 ) ( ON ?auto_219679 ?auto_219680 ) ( CLEAR ?auto_219679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_219676 ?auto_219677 ?auto_219678 ?auto_219679 )
      ( MAKE-6PILE ?auto_219676 ?auto_219677 ?auto_219678 ?auto_219679 ?auto_219680 ?auto_219681 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_219689 - BLOCK
      ?auto_219690 - BLOCK
      ?auto_219691 - BLOCK
      ?auto_219692 - BLOCK
      ?auto_219693 - BLOCK
      ?auto_219694 - BLOCK
    )
    :vars
    (
      ?auto_219695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219694 ?auto_219695 ) ( ON-TABLE ?auto_219689 ) ( ON ?auto_219690 ?auto_219689 ) ( ON ?auto_219691 ?auto_219690 ) ( not ( = ?auto_219689 ?auto_219690 ) ) ( not ( = ?auto_219689 ?auto_219691 ) ) ( not ( = ?auto_219689 ?auto_219692 ) ) ( not ( = ?auto_219689 ?auto_219693 ) ) ( not ( = ?auto_219689 ?auto_219694 ) ) ( not ( = ?auto_219689 ?auto_219695 ) ) ( not ( = ?auto_219690 ?auto_219691 ) ) ( not ( = ?auto_219690 ?auto_219692 ) ) ( not ( = ?auto_219690 ?auto_219693 ) ) ( not ( = ?auto_219690 ?auto_219694 ) ) ( not ( = ?auto_219690 ?auto_219695 ) ) ( not ( = ?auto_219691 ?auto_219692 ) ) ( not ( = ?auto_219691 ?auto_219693 ) ) ( not ( = ?auto_219691 ?auto_219694 ) ) ( not ( = ?auto_219691 ?auto_219695 ) ) ( not ( = ?auto_219692 ?auto_219693 ) ) ( not ( = ?auto_219692 ?auto_219694 ) ) ( not ( = ?auto_219692 ?auto_219695 ) ) ( not ( = ?auto_219693 ?auto_219694 ) ) ( not ( = ?auto_219693 ?auto_219695 ) ) ( not ( = ?auto_219694 ?auto_219695 ) ) ( ON ?auto_219693 ?auto_219694 ) ( CLEAR ?auto_219691 ) ( ON ?auto_219692 ?auto_219693 ) ( CLEAR ?auto_219692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_219689 ?auto_219690 ?auto_219691 ?auto_219692 )
      ( MAKE-6PILE ?auto_219689 ?auto_219690 ?auto_219691 ?auto_219692 ?auto_219693 ?auto_219694 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_219702 - BLOCK
      ?auto_219703 - BLOCK
      ?auto_219704 - BLOCK
      ?auto_219705 - BLOCK
      ?auto_219706 - BLOCK
      ?auto_219707 - BLOCK
    )
    :vars
    (
      ?auto_219708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219707 ?auto_219708 ) ( ON-TABLE ?auto_219702 ) ( ON ?auto_219703 ?auto_219702 ) ( not ( = ?auto_219702 ?auto_219703 ) ) ( not ( = ?auto_219702 ?auto_219704 ) ) ( not ( = ?auto_219702 ?auto_219705 ) ) ( not ( = ?auto_219702 ?auto_219706 ) ) ( not ( = ?auto_219702 ?auto_219707 ) ) ( not ( = ?auto_219702 ?auto_219708 ) ) ( not ( = ?auto_219703 ?auto_219704 ) ) ( not ( = ?auto_219703 ?auto_219705 ) ) ( not ( = ?auto_219703 ?auto_219706 ) ) ( not ( = ?auto_219703 ?auto_219707 ) ) ( not ( = ?auto_219703 ?auto_219708 ) ) ( not ( = ?auto_219704 ?auto_219705 ) ) ( not ( = ?auto_219704 ?auto_219706 ) ) ( not ( = ?auto_219704 ?auto_219707 ) ) ( not ( = ?auto_219704 ?auto_219708 ) ) ( not ( = ?auto_219705 ?auto_219706 ) ) ( not ( = ?auto_219705 ?auto_219707 ) ) ( not ( = ?auto_219705 ?auto_219708 ) ) ( not ( = ?auto_219706 ?auto_219707 ) ) ( not ( = ?auto_219706 ?auto_219708 ) ) ( not ( = ?auto_219707 ?auto_219708 ) ) ( ON ?auto_219706 ?auto_219707 ) ( ON ?auto_219705 ?auto_219706 ) ( CLEAR ?auto_219703 ) ( ON ?auto_219704 ?auto_219705 ) ( CLEAR ?auto_219704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_219702 ?auto_219703 ?auto_219704 )
      ( MAKE-6PILE ?auto_219702 ?auto_219703 ?auto_219704 ?auto_219705 ?auto_219706 ?auto_219707 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_219715 - BLOCK
      ?auto_219716 - BLOCK
      ?auto_219717 - BLOCK
      ?auto_219718 - BLOCK
      ?auto_219719 - BLOCK
      ?auto_219720 - BLOCK
    )
    :vars
    (
      ?auto_219721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219720 ?auto_219721 ) ( ON-TABLE ?auto_219715 ) ( ON ?auto_219716 ?auto_219715 ) ( not ( = ?auto_219715 ?auto_219716 ) ) ( not ( = ?auto_219715 ?auto_219717 ) ) ( not ( = ?auto_219715 ?auto_219718 ) ) ( not ( = ?auto_219715 ?auto_219719 ) ) ( not ( = ?auto_219715 ?auto_219720 ) ) ( not ( = ?auto_219715 ?auto_219721 ) ) ( not ( = ?auto_219716 ?auto_219717 ) ) ( not ( = ?auto_219716 ?auto_219718 ) ) ( not ( = ?auto_219716 ?auto_219719 ) ) ( not ( = ?auto_219716 ?auto_219720 ) ) ( not ( = ?auto_219716 ?auto_219721 ) ) ( not ( = ?auto_219717 ?auto_219718 ) ) ( not ( = ?auto_219717 ?auto_219719 ) ) ( not ( = ?auto_219717 ?auto_219720 ) ) ( not ( = ?auto_219717 ?auto_219721 ) ) ( not ( = ?auto_219718 ?auto_219719 ) ) ( not ( = ?auto_219718 ?auto_219720 ) ) ( not ( = ?auto_219718 ?auto_219721 ) ) ( not ( = ?auto_219719 ?auto_219720 ) ) ( not ( = ?auto_219719 ?auto_219721 ) ) ( not ( = ?auto_219720 ?auto_219721 ) ) ( ON ?auto_219719 ?auto_219720 ) ( ON ?auto_219718 ?auto_219719 ) ( CLEAR ?auto_219716 ) ( ON ?auto_219717 ?auto_219718 ) ( CLEAR ?auto_219717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_219715 ?auto_219716 ?auto_219717 )
      ( MAKE-6PILE ?auto_219715 ?auto_219716 ?auto_219717 ?auto_219718 ?auto_219719 ?auto_219720 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_219728 - BLOCK
      ?auto_219729 - BLOCK
      ?auto_219730 - BLOCK
      ?auto_219731 - BLOCK
      ?auto_219732 - BLOCK
      ?auto_219733 - BLOCK
    )
    :vars
    (
      ?auto_219734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219733 ?auto_219734 ) ( ON-TABLE ?auto_219728 ) ( not ( = ?auto_219728 ?auto_219729 ) ) ( not ( = ?auto_219728 ?auto_219730 ) ) ( not ( = ?auto_219728 ?auto_219731 ) ) ( not ( = ?auto_219728 ?auto_219732 ) ) ( not ( = ?auto_219728 ?auto_219733 ) ) ( not ( = ?auto_219728 ?auto_219734 ) ) ( not ( = ?auto_219729 ?auto_219730 ) ) ( not ( = ?auto_219729 ?auto_219731 ) ) ( not ( = ?auto_219729 ?auto_219732 ) ) ( not ( = ?auto_219729 ?auto_219733 ) ) ( not ( = ?auto_219729 ?auto_219734 ) ) ( not ( = ?auto_219730 ?auto_219731 ) ) ( not ( = ?auto_219730 ?auto_219732 ) ) ( not ( = ?auto_219730 ?auto_219733 ) ) ( not ( = ?auto_219730 ?auto_219734 ) ) ( not ( = ?auto_219731 ?auto_219732 ) ) ( not ( = ?auto_219731 ?auto_219733 ) ) ( not ( = ?auto_219731 ?auto_219734 ) ) ( not ( = ?auto_219732 ?auto_219733 ) ) ( not ( = ?auto_219732 ?auto_219734 ) ) ( not ( = ?auto_219733 ?auto_219734 ) ) ( ON ?auto_219732 ?auto_219733 ) ( ON ?auto_219731 ?auto_219732 ) ( ON ?auto_219730 ?auto_219731 ) ( CLEAR ?auto_219728 ) ( ON ?auto_219729 ?auto_219730 ) ( CLEAR ?auto_219729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_219728 ?auto_219729 )
      ( MAKE-6PILE ?auto_219728 ?auto_219729 ?auto_219730 ?auto_219731 ?auto_219732 ?auto_219733 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_219741 - BLOCK
      ?auto_219742 - BLOCK
      ?auto_219743 - BLOCK
      ?auto_219744 - BLOCK
      ?auto_219745 - BLOCK
      ?auto_219746 - BLOCK
    )
    :vars
    (
      ?auto_219747 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219746 ?auto_219747 ) ( ON-TABLE ?auto_219741 ) ( not ( = ?auto_219741 ?auto_219742 ) ) ( not ( = ?auto_219741 ?auto_219743 ) ) ( not ( = ?auto_219741 ?auto_219744 ) ) ( not ( = ?auto_219741 ?auto_219745 ) ) ( not ( = ?auto_219741 ?auto_219746 ) ) ( not ( = ?auto_219741 ?auto_219747 ) ) ( not ( = ?auto_219742 ?auto_219743 ) ) ( not ( = ?auto_219742 ?auto_219744 ) ) ( not ( = ?auto_219742 ?auto_219745 ) ) ( not ( = ?auto_219742 ?auto_219746 ) ) ( not ( = ?auto_219742 ?auto_219747 ) ) ( not ( = ?auto_219743 ?auto_219744 ) ) ( not ( = ?auto_219743 ?auto_219745 ) ) ( not ( = ?auto_219743 ?auto_219746 ) ) ( not ( = ?auto_219743 ?auto_219747 ) ) ( not ( = ?auto_219744 ?auto_219745 ) ) ( not ( = ?auto_219744 ?auto_219746 ) ) ( not ( = ?auto_219744 ?auto_219747 ) ) ( not ( = ?auto_219745 ?auto_219746 ) ) ( not ( = ?auto_219745 ?auto_219747 ) ) ( not ( = ?auto_219746 ?auto_219747 ) ) ( ON ?auto_219745 ?auto_219746 ) ( ON ?auto_219744 ?auto_219745 ) ( ON ?auto_219743 ?auto_219744 ) ( CLEAR ?auto_219741 ) ( ON ?auto_219742 ?auto_219743 ) ( CLEAR ?auto_219742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_219741 ?auto_219742 )
      ( MAKE-6PILE ?auto_219741 ?auto_219742 ?auto_219743 ?auto_219744 ?auto_219745 ?auto_219746 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_219754 - BLOCK
      ?auto_219755 - BLOCK
      ?auto_219756 - BLOCK
      ?auto_219757 - BLOCK
      ?auto_219758 - BLOCK
      ?auto_219759 - BLOCK
    )
    :vars
    (
      ?auto_219760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219759 ?auto_219760 ) ( not ( = ?auto_219754 ?auto_219755 ) ) ( not ( = ?auto_219754 ?auto_219756 ) ) ( not ( = ?auto_219754 ?auto_219757 ) ) ( not ( = ?auto_219754 ?auto_219758 ) ) ( not ( = ?auto_219754 ?auto_219759 ) ) ( not ( = ?auto_219754 ?auto_219760 ) ) ( not ( = ?auto_219755 ?auto_219756 ) ) ( not ( = ?auto_219755 ?auto_219757 ) ) ( not ( = ?auto_219755 ?auto_219758 ) ) ( not ( = ?auto_219755 ?auto_219759 ) ) ( not ( = ?auto_219755 ?auto_219760 ) ) ( not ( = ?auto_219756 ?auto_219757 ) ) ( not ( = ?auto_219756 ?auto_219758 ) ) ( not ( = ?auto_219756 ?auto_219759 ) ) ( not ( = ?auto_219756 ?auto_219760 ) ) ( not ( = ?auto_219757 ?auto_219758 ) ) ( not ( = ?auto_219757 ?auto_219759 ) ) ( not ( = ?auto_219757 ?auto_219760 ) ) ( not ( = ?auto_219758 ?auto_219759 ) ) ( not ( = ?auto_219758 ?auto_219760 ) ) ( not ( = ?auto_219759 ?auto_219760 ) ) ( ON ?auto_219758 ?auto_219759 ) ( ON ?auto_219757 ?auto_219758 ) ( ON ?auto_219756 ?auto_219757 ) ( ON ?auto_219755 ?auto_219756 ) ( ON ?auto_219754 ?auto_219755 ) ( CLEAR ?auto_219754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_219754 )
      ( MAKE-6PILE ?auto_219754 ?auto_219755 ?auto_219756 ?auto_219757 ?auto_219758 ?auto_219759 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_219767 - BLOCK
      ?auto_219768 - BLOCK
      ?auto_219769 - BLOCK
      ?auto_219770 - BLOCK
      ?auto_219771 - BLOCK
      ?auto_219772 - BLOCK
    )
    :vars
    (
      ?auto_219773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219772 ?auto_219773 ) ( not ( = ?auto_219767 ?auto_219768 ) ) ( not ( = ?auto_219767 ?auto_219769 ) ) ( not ( = ?auto_219767 ?auto_219770 ) ) ( not ( = ?auto_219767 ?auto_219771 ) ) ( not ( = ?auto_219767 ?auto_219772 ) ) ( not ( = ?auto_219767 ?auto_219773 ) ) ( not ( = ?auto_219768 ?auto_219769 ) ) ( not ( = ?auto_219768 ?auto_219770 ) ) ( not ( = ?auto_219768 ?auto_219771 ) ) ( not ( = ?auto_219768 ?auto_219772 ) ) ( not ( = ?auto_219768 ?auto_219773 ) ) ( not ( = ?auto_219769 ?auto_219770 ) ) ( not ( = ?auto_219769 ?auto_219771 ) ) ( not ( = ?auto_219769 ?auto_219772 ) ) ( not ( = ?auto_219769 ?auto_219773 ) ) ( not ( = ?auto_219770 ?auto_219771 ) ) ( not ( = ?auto_219770 ?auto_219772 ) ) ( not ( = ?auto_219770 ?auto_219773 ) ) ( not ( = ?auto_219771 ?auto_219772 ) ) ( not ( = ?auto_219771 ?auto_219773 ) ) ( not ( = ?auto_219772 ?auto_219773 ) ) ( ON ?auto_219771 ?auto_219772 ) ( ON ?auto_219770 ?auto_219771 ) ( ON ?auto_219769 ?auto_219770 ) ( ON ?auto_219768 ?auto_219769 ) ( ON ?auto_219767 ?auto_219768 ) ( CLEAR ?auto_219767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_219767 )
      ( MAKE-6PILE ?auto_219767 ?auto_219768 ?auto_219769 ?auto_219770 ?auto_219771 ?auto_219772 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_219781 - BLOCK
      ?auto_219782 - BLOCK
      ?auto_219783 - BLOCK
      ?auto_219784 - BLOCK
      ?auto_219785 - BLOCK
      ?auto_219786 - BLOCK
      ?auto_219787 - BLOCK
    )
    :vars
    (
      ?auto_219788 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_219786 ) ( ON ?auto_219787 ?auto_219788 ) ( CLEAR ?auto_219787 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_219781 ) ( ON ?auto_219782 ?auto_219781 ) ( ON ?auto_219783 ?auto_219782 ) ( ON ?auto_219784 ?auto_219783 ) ( ON ?auto_219785 ?auto_219784 ) ( ON ?auto_219786 ?auto_219785 ) ( not ( = ?auto_219781 ?auto_219782 ) ) ( not ( = ?auto_219781 ?auto_219783 ) ) ( not ( = ?auto_219781 ?auto_219784 ) ) ( not ( = ?auto_219781 ?auto_219785 ) ) ( not ( = ?auto_219781 ?auto_219786 ) ) ( not ( = ?auto_219781 ?auto_219787 ) ) ( not ( = ?auto_219781 ?auto_219788 ) ) ( not ( = ?auto_219782 ?auto_219783 ) ) ( not ( = ?auto_219782 ?auto_219784 ) ) ( not ( = ?auto_219782 ?auto_219785 ) ) ( not ( = ?auto_219782 ?auto_219786 ) ) ( not ( = ?auto_219782 ?auto_219787 ) ) ( not ( = ?auto_219782 ?auto_219788 ) ) ( not ( = ?auto_219783 ?auto_219784 ) ) ( not ( = ?auto_219783 ?auto_219785 ) ) ( not ( = ?auto_219783 ?auto_219786 ) ) ( not ( = ?auto_219783 ?auto_219787 ) ) ( not ( = ?auto_219783 ?auto_219788 ) ) ( not ( = ?auto_219784 ?auto_219785 ) ) ( not ( = ?auto_219784 ?auto_219786 ) ) ( not ( = ?auto_219784 ?auto_219787 ) ) ( not ( = ?auto_219784 ?auto_219788 ) ) ( not ( = ?auto_219785 ?auto_219786 ) ) ( not ( = ?auto_219785 ?auto_219787 ) ) ( not ( = ?auto_219785 ?auto_219788 ) ) ( not ( = ?auto_219786 ?auto_219787 ) ) ( not ( = ?auto_219786 ?auto_219788 ) ) ( not ( = ?auto_219787 ?auto_219788 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_219787 ?auto_219788 )
      ( !STACK ?auto_219787 ?auto_219786 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_219796 - BLOCK
      ?auto_219797 - BLOCK
      ?auto_219798 - BLOCK
      ?auto_219799 - BLOCK
      ?auto_219800 - BLOCK
      ?auto_219801 - BLOCK
      ?auto_219802 - BLOCK
    )
    :vars
    (
      ?auto_219803 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_219801 ) ( ON ?auto_219802 ?auto_219803 ) ( CLEAR ?auto_219802 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_219796 ) ( ON ?auto_219797 ?auto_219796 ) ( ON ?auto_219798 ?auto_219797 ) ( ON ?auto_219799 ?auto_219798 ) ( ON ?auto_219800 ?auto_219799 ) ( ON ?auto_219801 ?auto_219800 ) ( not ( = ?auto_219796 ?auto_219797 ) ) ( not ( = ?auto_219796 ?auto_219798 ) ) ( not ( = ?auto_219796 ?auto_219799 ) ) ( not ( = ?auto_219796 ?auto_219800 ) ) ( not ( = ?auto_219796 ?auto_219801 ) ) ( not ( = ?auto_219796 ?auto_219802 ) ) ( not ( = ?auto_219796 ?auto_219803 ) ) ( not ( = ?auto_219797 ?auto_219798 ) ) ( not ( = ?auto_219797 ?auto_219799 ) ) ( not ( = ?auto_219797 ?auto_219800 ) ) ( not ( = ?auto_219797 ?auto_219801 ) ) ( not ( = ?auto_219797 ?auto_219802 ) ) ( not ( = ?auto_219797 ?auto_219803 ) ) ( not ( = ?auto_219798 ?auto_219799 ) ) ( not ( = ?auto_219798 ?auto_219800 ) ) ( not ( = ?auto_219798 ?auto_219801 ) ) ( not ( = ?auto_219798 ?auto_219802 ) ) ( not ( = ?auto_219798 ?auto_219803 ) ) ( not ( = ?auto_219799 ?auto_219800 ) ) ( not ( = ?auto_219799 ?auto_219801 ) ) ( not ( = ?auto_219799 ?auto_219802 ) ) ( not ( = ?auto_219799 ?auto_219803 ) ) ( not ( = ?auto_219800 ?auto_219801 ) ) ( not ( = ?auto_219800 ?auto_219802 ) ) ( not ( = ?auto_219800 ?auto_219803 ) ) ( not ( = ?auto_219801 ?auto_219802 ) ) ( not ( = ?auto_219801 ?auto_219803 ) ) ( not ( = ?auto_219802 ?auto_219803 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_219802 ?auto_219803 )
      ( !STACK ?auto_219802 ?auto_219801 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_219811 - BLOCK
      ?auto_219812 - BLOCK
      ?auto_219813 - BLOCK
      ?auto_219814 - BLOCK
      ?auto_219815 - BLOCK
      ?auto_219816 - BLOCK
      ?auto_219817 - BLOCK
    )
    :vars
    (
      ?auto_219818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219817 ?auto_219818 ) ( ON-TABLE ?auto_219811 ) ( ON ?auto_219812 ?auto_219811 ) ( ON ?auto_219813 ?auto_219812 ) ( ON ?auto_219814 ?auto_219813 ) ( ON ?auto_219815 ?auto_219814 ) ( not ( = ?auto_219811 ?auto_219812 ) ) ( not ( = ?auto_219811 ?auto_219813 ) ) ( not ( = ?auto_219811 ?auto_219814 ) ) ( not ( = ?auto_219811 ?auto_219815 ) ) ( not ( = ?auto_219811 ?auto_219816 ) ) ( not ( = ?auto_219811 ?auto_219817 ) ) ( not ( = ?auto_219811 ?auto_219818 ) ) ( not ( = ?auto_219812 ?auto_219813 ) ) ( not ( = ?auto_219812 ?auto_219814 ) ) ( not ( = ?auto_219812 ?auto_219815 ) ) ( not ( = ?auto_219812 ?auto_219816 ) ) ( not ( = ?auto_219812 ?auto_219817 ) ) ( not ( = ?auto_219812 ?auto_219818 ) ) ( not ( = ?auto_219813 ?auto_219814 ) ) ( not ( = ?auto_219813 ?auto_219815 ) ) ( not ( = ?auto_219813 ?auto_219816 ) ) ( not ( = ?auto_219813 ?auto_219817 ) ) ( not ( = ?auto_219813 ?auto_219818 ) ) ( not ( = ?auto_219814 ?auto_219815 ) ) ( not ( = ?auto_219814 ?auto_219816 ) ) ( not ( = ?auto_219814 ?auto_219817 ) ) ( not ( = ?auto_219814 ?auto_219818 ) ) ( not ( = ?auto_219815 ?auto_219816 ) ) ( not ( = ?auto_219815 ?auto_219817 ) ) ( not ( = ?auto_219815 ?auto_219818 ) ) ( not ( = ?auto_219816 ?auto_219817 ) ) ( not ( = ?auto_219816 ?auto_219818 ) ) ( not ( = ?auto_219817 ?auto_219818 ) ) ( CLEAR ?auto_219815 ) ( ON ?auto_219816 ?auto_219817 ) ( CLEAR ?auto_219816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_219811 ?auto_219812 ?auto_219813 ?auto_219814 ?auto_219815 ?auto_219816 )
      ( MAKE-7PILE ?auto_219811 ?auto_219812 ?auto_219813 ?auto_219814 ?auto_219815 ?auto_219816 ?auto_219817 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_219826 - BLOCK
      ?auto_219827 - BLOCK
      ?auto_219828 - BLOCK
      ?auto_219829 - BLOCK
      ?auto_219830 - BLOCK
      ?auto_219831 - BLOCK
      ?auto_219832 - BLOCK
    )
    :vars
    (
      ?auto_219833 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219832 ?auto_219833 ) ( ON-TABLE ?auto_219826 ) ( ON ?auto_219827 ?auto_219826 ) ( ON ?auto_219828 ?auto_219827 ) ( ON ?auto_219829 ?auto_219828 ) ( ON ?auto_219830 ?auto_219829 ) ( not ( = ?auto_219826 ?auto_219827 ) ) ( not ( = ?auto_219826 ?auto_219828 ) ) ( not ( = ?auto_219826 ?auto_219829 ) ) ( not ( = ?auto_219826 ?auto_219830 ) ) ( not ( = ?auto_219826 ?auto_219831 ) ) ( not ( = ?auto_219826 ?auto_219832 ) ) ( not ( = ?auto_219826 ?auto_219833 ) ) ( not ( = ?auto_219827 ?auto_219828 ) ) ( not ( = ?auto_219827 ?auto_219829 ) ) ( not ( = ?auto_219827 ?auto_219830 ) ) ( not ( = ?auto_219827 ?auto_219831 ) ) ( not ( = ?auto_219827 ?auto_219832 ) ) ( not ( = ?auto_219827 ?auto_219833 ) ) ( not ( = ?auto_219828 ?auto_219829 ) ) ( not ( = ?auto_219828 ?auto_219830 ) ) ( not ( = ?auto_219828 ?auto_219831 ) ) ( not ( = ?auto_219828 ?auto_219832 ) ) ( not ( = ?auto_219828 ?auto_219833 ) ) ( not ( = ?auto_219829 ?auto_219830 ) ) ( not ( = ?auto_219829 ?auto_219831 ) ) ( not ( = ?auto_219829 ?auto_219832 ) ) ( not ( = ?auto_219829 ?auto_219833 ) ) ( not ( = ?auto_219830 ?auto_219831 ) ) ( not ( = ?auto_219830 ?auto_219832 ) ) ( not ( = ?auto_219830 ?auto_219833 ) ) ( not ( = ?auto_219831 ?auto_219832 ) ) ( not ( = ?auto_219831 ?auto_219833 ) ) ( not ( = ?auto_219832 ?auto_219833 ) ) ( CLEAR ?auto_219830 ) ( ON ?auto_219831 ?auto_219832 ) ( CLEAR ?auto_219831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_219826 ?auto_219827 ?auto_219828 ?auto_219829 ?auto_219830 ?auto_219831 )
      ( MAKE-7PILE ?auto_219826 ?auto_219827 ?auto_219828 ?auto_219829 ?auto_219830 ?auto_219831 ?auto_219832 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_219841 - BLOCK
      ?auto_219842 - BLOCK
      ?auto_219843 - BLOCK
      ?auto_219844 - BLOCK
      ?auto_219845 - BLOCK
      ?auto_219846 - BLOCK
      ?auto_219847 - BLOCK
    )
    :vars
    (
      ?auto_219848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219847 ?auto_219848 ) ( ON-TABLE ?auto_219841 ) ( ON ?auto_219842 ?auto_219841 ) ( ON ?auto_219843 ?auto_219842 ) ( ON ?auto_219844 ?auto_219843 ) ( not ( = ?auto_219841 ?auto_219842 ) ) ( not ( = ?auto_219841 ?auto_219843 ) ) ( not ( = ?auto_219841 ?auto_219844 ) ) ( not ( = ?auto_219841 ?auto_219845 ) ) ( not ( = ?auto_219841 ?auto_219846 ) ) ( not ( = ?auto_219841 ?auto_219847 ) ) ( not ( = ?auto_219841 ?auto_219848 ) ) ( not ( = ?auto_219842 ?auto_219843 ) ) ( not ( = ?auto_219842 ?auto_219844 ) ) ( not ( = ?auto_219842 ?auto_219845 ) ) ( not ( = ?auto_219842 ?auto_219846 ) ) ( not ( = ?auto_219842 ?auto_219847 ) ) ( not ( = ?auto_219842 ?auto_219848 ) ) ( not ( = ?auto_219843 ?auto_219844 ) ) ( not ( = ?auto_219843 ?auto_219845 ) ) ( not ( = ?auto_219843 ?auto_219846 ) ) ( not ( = ?auto_219843 ?auto_219847 ) ) ( not ( = ?auto_219843 ?auto_219848 ) ) ( not ( = ?auto_219844 ?auto_219845 ) ) ( not ( = ?auto_219844 ?auto_219846 ) ) ( not ( = ?auto_219844 ?auto_219847 ) ) ( not ( = ?auto_219844 ?auto_219848 ) ) ( not ( = ?auto_219845 ?auto_219846 ) ) ( not ( = ?auto_219845 ?auto_219847 ) ) ( not ( = ?auto_219845 ?auto_219848 ) ) ( not ( = ?auto_219846 ?auto_219847 ) ) ( not ( = ?auto_219846 ?auto_219848 ) ) ( not ( = ?auto_219847 ?auto_219848 ) ) ( ON ?auto_219846 ?auto_219847 ) ( CLEAR ?auto_219844 ) ( ON ?auto_219845 ?auto_219846 ) ( CLEAR ?auto_219845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_219841 ?auto_219842 ?auto_219843 ?auto_219844 ?auto_219845 )
      ( MAKE-7PILE ?auto_219841 ?auto_219842 ?auto_219843 ?auto_219844 ?auto_219845 ?auto_219846 ?auto_219847 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_219856 - BLOCK
      ?auto_219857 - BLOCK
      ?auto_219858 - BLOCK
      ?auto_219859 - BLOCK
      ?auto_219860 - BLOCK
      ?auto_219861 - BLOCK
      ?auto_219862 - BLOCK
    )
    :vars
    (
      ?auto_219863 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219862 ?auto_219863 ) ( ON-TABLE ?auto_219856 ) ( ON ?auto_219857 ?auto_219856 ) ( ON ?auto_219858 ?auto_219857 ) ( ON ?auto_219859 ?auto_219858 ) ( not ( = ?auto_219856 ?auto_219857 ) ) ( not ( = ?auto_219856 ?auto_219858 ) ) ( not ( = ?auto_219856 ?auto_219859 ) ) ( not ( = ?auto_219856 ?auto_219860 ) ) ( not ( = ?auto_219856 ?auto_219861 ) ) ( not ( = ?auto_219856 ?auto_219862 ) ) ( not ( = ?auto_219856 ?auto_219863 ) ) ( not ( = ?auto_219857 ?auto_219858 ) ) ( not ( = ?auto_219857 ?auto_219859 ) ) ( not ( = ?auto_219857 ?auto_219860 ) ) ( not ( = ?auto_219857 ?auto_219861 ) ) ( not ( = ?auto_219857 ?auto_219862 ) ) ( not ( = ?auto_219857 ?auto_219863 ) ) ( not ( = ?auto_219858 ?auto_219859 ) ) ( not ( = ?auto_219858 ?auto_219860 ) ) ( not ( = ?auto_219858 ?auto_219861 ) ) ( not ( = ?auto_219858 ?auto_219862 ) ) ( not ( = ?auto_219858 ?auto_219863 ) ) ( not ( = ?auto_219859 ?auto_219860 ) ) ( not ( = ?auto_219859 ?auto_219861 ) ) ( not ( = ?auto_219859 ?auto_219862 ) ) ( not ( = ?auto_219859 ?auto_219863 ) ) ( not ( = ?auto_219860 ?auto_219861 ) ) ( not ( = ?auto_219860 ?auto_219862 ) ) ( not ( = ?auto_219860 ?auto_219863 ) ) ( not ( = ?auto_219861 ?auto_219862 ) ) ( not ( = ?auto_219861 ?auto_219863 ) ) ( not ( = ?auto_219862 ?auto_219863 ) ) ( ON ?auto_219861 ?auto_219862 ) ( CLEAR ?auto_219859 ) ( ON ?auto_219860 ?auto_219861 ) ( CLEAR ?auto_219860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_219856 ?auto_219857 ?auto_219858 ?auto_219859 ?auto_219860 )
      ( MAKE-7PILE ?auto_219856 ?auto_219857 ?auto_219858 ?auto_219859 ?auto_219860 ?auto_219861 ?auto_219862 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_219871 - BLOCK
      ?auto_219872 - BLOCK
      ?auto_219873 - BLOCK
      ?auto_219874 - BLOCK
      ?auto_219875 - BLOCK
      ?auto_219876 - BLOCK
      ?auto_219877 - BLOCK
    )
    :vars
    (
      ?auto_219878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219877 ?auto_219878 ) ( ON-TABLE ?auto_219871 ) ( ON ?auto_219872 ?auto_219871 ) ( ON ?auto_219873 ?auto_219872 ) ( not ( = ?auto_219871 ?auto_219872 ) ) ( not ( = ?auto_219871 ?auto_219873 ) ) ( not ( = ?auto_219871 ?auto_219874 ) ) ( not ( = ?auto_219871 ?auto_219875 ) ) ( not ( = ?auto_219871 ?auto_219876 ) ) ( not ( = ?auto_219871 ?auto_219877 ) ) ( not ( = ?auto_219871 ?auto_219878 ) ) ( not ( = ?auto_219872 ?auto_219873 ) ) ( not ( = ?auto_219872 ?auto_219874 ) ) ( not ( = ?auto_219872 ?auto_219875 ) ) ( not ( = ?auto_219872 ?auto_219876 ) ) ( not ( = ?auto_219872 ?auto_219877 ) ) ( not ( = ?auto_219872 ?auto_219878 ) ) ( not ( = ?auto_219873 ?auto_219874 ) ) ( not ( = ?auto_219873 ?auto_219875 ) ) ( not ( = ?auto_219873 ?auto_219876 ) ) ( not ( = ?auto_219873 ?auto_219877 ) ) ( not ( = ?auto_219873 ?auto_219878 ) ) ( not ( = ?auto_219874 ?auto_219875 ) ) ( not ( = ?auto_219874 ?auto_219876 ) ) ( not ( = ?auto_219874 ?auto_219877 ) ) ( not ( = ?auto_219874 ?auto_219878 ) ) ( not ( = ?auto_219875 ?auto_219876 ) ) ( not ( = ?auto_219875 ?auto_219877 ) ) ( not ( = ?auto_219875 ?auto_219878 ) ) ( not ( = ?auto_219876 ?auto_219877 ) ) ( not ( = ?auto_219876 ?auto_219878 ) ) ( not ( = ?auto_219877 ?auto_219878 ) ) ( ON ?auto_219876 ?auto_219877 ) ( ON ?auto_219875 ?auto_219876 ) ( CLEAR ?auto_219873 ) ( ON ?auto_219874 ?auto_219875 ) ( CLEAR ?auto_219874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_219871 ?auto_219872 ?auto_219873 ?auto_219874 )
      ( MAKE-7PILE ?auto_219871 ?auto_219872 ?auto_219873 ?auto_219874 ?auto_219875 ?auto_219876 ?auto_219877 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_219886 - BLOCK
      ?auto_219887 - BLOCK
      ?auto_219888 - BLOCK
      ?auto_219889 - BLOCK
      ?auto_219890 - BLOCK
      ?auto_219891 - BLOCK
      ?auto_219892 - BLOCK
    )
    :vars
    (
      ?auto_219893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219892 ?auto_219893 ) ( ON-TABLE ?auto_219886 ) ( ON ?auto_219887 ?auto_219886 ) ( ON ?auto_219888 ?auto_219887 ) ( not ( = ?auto_219886 ?auto_219887 ) ) ( not ( = ?auto_219886 ?auto_219888 ) ) ( not ( = ?auto_219886 ?auto_219889 ) ) ( not ( = ?auto_219886 ?auto_219890 ) ) ( not ( = ?auto_219886 ?auto_219891 ) ) ( not ( = ?auto_219886 ?auto_219892 ) ) ( not ( = ?auto_219886 ?auto_219893 ) ) ( not ( = ?auto_219887 ?auto_219888 ) ) ( not ( = ?auto_219887 ?auto_219889 ) ) ( not ( = ?auto_219887 ?auto_219890 ) ) ( not ( = ?auto_219887 ?auto_219891 ) ) ( not ( = ?auto_219887 ?auto_219892 ) ) ( not ( = ?auto_219887 ?auto_219893 ) ) ( not ( = ?auto_219888 ?auto_219889 ) ) ( not ( = ?auto_219888 ?auto_219890 ) ) ( not ( = ?auto_219888 ?auto_219891 ) ) ( not ( = ?auto_219888 ?auto_219892 ) ) ( not ( = ?auto_219888 ?auto_219893 ) ) ( not ( = ?auto_219889 ?auto_219890 ) ) ( not ( = ?auto_219889 ?auto_219891 ) ) ( not ( = ?auto_219889 ?auto_219892 ) ) ( not ( = ?auto_219889 ?auto_219893 ) ) ( not ( = ?auto_219890 ?auto_219891 ) ) ( not ( = ?auto_219890 ?auto_219892 ) ) ( not ( = ?auto_219890 ?auto_219893 ) ) ( not ( = ?auto_219891 ?auto_219892 ) ) ( not ( = ?auto_219891 ?auto_219893 ) ) ( not ( = ?auto_219892 ?auto_219893 ) ) ( ON ?auto_219891 ?auto_219892 ) ( ON ?auto_219890 ?auto_219891 ) ( CLEAR ?auto_219888 ) ( ON ?auto_219889 ?auto_219890 ) ( CLEAR ?auto_219889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_219886 ?auto_219887 ?auto_219888 ?auto_219889 )
      ( MAKE-7PILE ?auto_219886 ?auto_219887 ?auto_219888 ?auto_219889 ?auto_219890 ?auto_219891 ?auto_219892 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_219901 - BLOCK
      ?auto_219902 - BLOCK
      ?auto_219903 - BLOCK
      ?auto_219904 - BLOCK
      ?auto_219905 - BLOCK
      ?auto_219906 - BLOCK
      ?auto_219907 - BLOCK
    )
    :vars
    (
      ?auto_219908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219907 ?auto_219908 ) ( ON-TABLE ?auto_219901 ) ( ON ?auto_219902 ?auto_219901 ) ( not ( = ?auto_219901 ?auto_219902 ) ) ( not ( = ?auto_219901 ?auto_219903 ) ) ( not ( = ?auto_219901 ?auto_219904 ) ) ( not ( = ?auto_219901 ?auto_219905 ) ) ( not ( = ?auto_219901 ?auto_219906 ) ) ( not ( = ?auto_219901 ?auto_219907 ) ) ( not ( = ?auto_219901 ?auto_219908 ) ) ( not ( = ?auto_219902 ?auto_219903 ) ) ( not ( = ?auto_219902 ?auto_219904 ) ) ( not ( = ?auto_219902 ?auto_219905 ) ) ( not ( = ?auto_219902 ?auto_219906 ) ) ( not ( = ?auto_219902 ?auto_219907 ) ) ( not ( = ?auto_219902 ?auto_219908 ) ) ( not ( = ?auto_219903 ?auto_219904 ) ) ( not ( = ?auto_219903 ?auto_219905 ) ) ( not ( = ?auto_219903 ?auto_219906 ) ) ( not ( = ?auto_219903 ?auto_219907 ) ) ( not ( = ?auto_219903 ?auto_219908 ) ) ( not ( = ?auto_219904 ?auto_219905 ) ) ( not ( = ?auto_219904 ?auto_219906 ) ) ( not ( = ?auto_219904 ?auto_219907 ) ) ( not ( = ?auto_219904 ?auto_219908 ) ) ( not ( = ?auto_219905 ?auto_219906 ) ) ( not ( = ?auto_219905 ?auto_219907 ) ) ( not ( = ?auto_219905 ?auto_219908 ) ) ( not ( = ?auto_219906 ?auto_219907 ) ) ( not ( = ?auto_219906 ?auto_219908 ) ) ( not ( = ?auto_219907 ?auto_219908 ) ) ( ON ?auto_219906 ?auto_219907 ) ( ON ?auto_219905 ?auto_219906 ) ( ON ?auto_219904 ?auto_219905 ) ( CLEAR ?auto_219902 ) ( ON ?auto_219903 ?auto_219904 ) ( CLEAR ?auto_219903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_219901 ?auto_219902 ?auto_219903 )
      ( MAKE-7PILE ?auto_219901 ?auto_219902 ?auto_219903 ?auto_219904 ?auto_219905 ?auto_219906 ?auto_219907 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_219916 - BLOCK
      ?auto_219917 - BLOCK
      ?auto_219918 - BLOCK
      ?auto_219919 - BLOCK
      ?auto_219920 - BLOCK
      ?auto_219921 - BLOCK
      ?auto_219922 - BLOCK
    )
    :vars
    (
      ?auto_219923 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219922 ?auto_219923 ) ( ON-TABLE ?auto_219916 ) ( ON ?auto_219917 ?auto_219916 ) ( not ( = ?auto_219916 ?auto_219917 ) ) ( not ( = ?auto_219916 ?auto_219918 ) ) ( not ( = ?auto_219916 ?auto_219919 ) ) ( not ( = ?auto_219916 ?auto_219920 ) ) ( not ( = ?auto_219916 ?auto_219921 ) ) ( not ( = ?auto_219916 ?auto_219922 ) ) ( not ( = ?auto_219916 ?auto_219923 ) ) ( not ( = ?auto_219917 ?auto_219918 ) ) ( not ( = ?auto_219917 ?auto_219919 ) ) ( not ( = ?auto_219917 ?auto_219920 ) ) ( not ( = ?auto_219917 ?auto_219921 ) ) ( not ( = ?auto_219917 ?auto_219922 ) ) ( not ( = ?auto_219917 ?auto_219923 ) ) ( not ( = ?auto_219918 ?auto_219919 ) ) ( not ( = ?auto_219918 ?auto_219920 ) ) ( not ( = ?auto_219918 ?auto_219921 ) ) ( not ( = ?auto_219918 ?auto_219922 ) ) ( not ( = ?auto_219918 ?auto_219923 ) ) ( not ( = ?auto_219919 ?auto_219920 ) ) ( not ( = ?auto_219919 ?auto_219921 ) ) ( not ( = ?auto_219919 ?auto_219922 ) ) ( not ( = ?auto_219919 ?auto_219923 ) ) ( not ( = ?auto_219920 ?auto_219921 ) ) ( not ( = ?auto_219920 ?auto_219922 ) ) ( not ( = ?auto_219920 ?auto_219923 ) ) ( not ( = ?auto_219921 ?auto_219922 ) ) ( not ( = ?auto_219921 ?auto_219923 ) ) ( not ( = ?auto_219922 ?auto_219923 ) ) ( ON ?auto_219921 ?auto_219922 ) ( ON ?auto_219920 ?auto_219921 ) ( ON ?auto_219919 ?auto_219920 ) ( CLEAR ?auto_219917 ) ( ON ?auto_219918 ?auto_219919 ) ( CLEAR ?auto_219918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_219916 ?auto_219917 ?auto_219918 )
      ( MAKE-7PILE ?auto_219916 ?auto_219917 ?auto_219918 ?auto_219919 ?auto_219920 ?auto_219921 ?auto_219922 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_219931 - BLOCK
      ?auto_219932 - BLOCK
      ?auto_219933 - BLOCK
      ?auto_219934 - BLOCK
      ?auto_219935 - BLOCK
      ?auto_219936 - BLOCK
      ?auto_219937 - BLOCK
    )
    :vars
    (
      ?auto_219938 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219937 ?auto_219938 ) ( ON-TABLE ?auto_219931 ) ( not ( = ?auto_219931 ?auto_219932 ) ) ( not ( = ?auto_219931 ?auto_219933 ) ) ( not ( = ?auto_219931 ?auto_219934 ) ) ( not ( = ?auto_219931 ?auto_219935 ) ) ( not ( = ?auto_219931 ?auto_219936 ) ) ( not ( = ?auto_219931 ?auto_219937 ) ) ( not ( = ?auto_219931 ?auto_219938 ) ) ( not ( = ?auto_219932 ?auto_219933 ) ) ( not ( = ?auto_219932 ?auto_219934 ) ) ( not ( = ?auto_219932 ?auto_219935 ) ) ( not ( = ?auto_219932 ?auto_219936 ) ) ( not ( = ?auto_219932 ?auto_219937 ) ) ( not ( = ?auto_219932 ?auto_219938 ) ) ( not ( = ?auto_219933 ?auto_219934 ) ) ( not ( = ?auto_219933 ?auto_219935 ) ) ( not ( = ?auto_219933 ?auto_219936 ) ) ( not ( = ?auto_219933 ?auto_219937 ) ) ( not ( = ?auto_219933 ?auto_219938 ) ) ( not ( = ?auto_219934 ?auto_219935 ) ) ( not ( = ?auto_219934 ?auto_219936 ) ) ( not ( = ?auto_219934 ?auto_219937 ) ) ( not ( = ?auto_219934 ?auto_219938 ) ) ( not ( = ?auto_219935 ?auto_219936 ) ) ( not ( = ?auto_219935 ?auto_219937 ) ) ( not ( = ?auto_219935 ?auto_219938 ) ) ( not ( = ?auto_219936 ?auto_219937 ) ) ( not ( = ?auto_219936 ?auto_219938 ) ) ( not ( = ?auto_219937 ?auto_219938 ) ) ( ON ?auto_219936 ?auto_219937 ) ( ON ?auto_219935 ?auto_219936 ) ( ON ?auto_219934 ?auto_219935 ) ( ON ?auto_219933 ?auto_219934 ) ( CLEAR ?auto_219931 ) ( ON ?auto_219932 ?auto_219933 ) ( CLEAR ?auto_219932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_219931 ?auto_219932 )
      ( MAKE-7PILE ?auto_219931 ?auto_219932 ?auto_219933 ?auto_219934 ?auto_219935 ?auto_219936 ?auto_219937 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_219946 - BLOCK
      ?auto_219947 - BLOCK
      ?auto_219948 - BLOCK
      ?auto_219949 - BLOCK
      ?auto_219950 - BLOCK
      ?auto_219951 - BLOCK
      ?auto_219952 - BLOCK
    )
    :vars
    (
      ?auto_219953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219952 ?auto_219953 ) ( ON-TABLE ?auto_219946 ) ( not ( = ?auto_219946 ?auto_219947 ) ) ( not ( = ?auto_219946 ?auto_219948 ) ) ( not ( = ?auto_219946 ?auto_219949 ) ) ( not ( = ?auto_219946 ?auto_219950 ) ) ( not ( = ?auto_219946 ?auto_219951 ) ) ( not ( = ?auto_219946 ?auto_219952 ) ) ( not ( = ?auto_219946 ?auto_219953 ) ) ( not ( = ?auto_219947 ?auto_219948 ) ) ( not ( = ?auto_219947 ?auto_219949 ) ) ( not ( = ?auto_219947 ?auto_219950 ) ) ( not ( = ?auto_219947 ?auto_219951 ) ) ( not ( = ?auto_219947 ?auto_219952 ) ) ( not ( = ?auto_219947 ?auto_219953 ) ) ( not ( = ?auto_219948 ?auto_219949 ) ) ( not ( = ?auto_219948 ?auto_219950 ) ) ( not ( = ?auto_219948 ?auto_219951 ) ) ( not ( = ?auto_219948 ?auto_219952 ) ) ( not ( = ?auto_219948 ?auto_219953 ) ) ( not ( = ?auto_219949 ?auto_219950 ) ) ( not ( = ?auto_219949 ?auto_219951 ) ) ( not ( = ?auto_219949 ?auto_219952 ) ) ( not ( = ?auto_219949 ?auto_219953 ) ) ( not ( = ?auto_219950 ?auto_219951 ) ) ( not ( = ?auto_219950 ?auto_219952 ) ) ( not ( = ?auto_219950 ?auto_219953 ) ) ( not ( = ?auto_219951 ?auto_219952 ) ) ( not ( = ?auto_219951 ?auto_219953 ) ) ( not ( = ?auto_219952 ?auto_219953 ) ) ( ON ?auto_219951 ?auto_219952 ) ( ON ?auto_219950 ?auto_219951 ) ( ON ?auto_219949 ?auto_219950 ) ( ON ?auto_219948 ?auto_219949 ) ( CLEAR ?auto_219946 ) ( ON ?auto_219947 ?auto_219948 ) ( CLEAR ?auto_219947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_219946 ?auto_219947 )
      ( MAKE-7PILE ?auto_219946 ?auto_219947 ?auto_219948 ?auto_219949 ?auto_219950 ?auto_219951 ?auto_219952 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_219961 - BLOCK
      ?auto_219962 - BLOCK
      ?auto_219963 - BLOCK
      ?auto_219964 - BLOCK
      ?auto_219965 - BLOCK
      ?auto_219966 - BLOCK
      ?auto_219967 - BLOCK
    )
    :vars
    (
      ?auto_219968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219967 ?auto_219968 ) ( not ( = ?auto_219961 ?auto_219962 ) ) ( not ( = ?auto_219961 ?auto_219963 ) ) ( not ( = ?auto_219961 ?auto_219964 ) ) ( not ( = ?auto_219961 ?auto_219965 ) ) ( not ( = ?auto_219961 ?auto_219966 ) ) ( not ( = ?auto_219961 ?auto_219967 ) ) ( not ( = ?auto_219961 ?auto_219968 ) ) ( not ( = ?auto_219962 ?auto_219963 ) ) ( not ( = ?auto_219962 ?auto_219964 ) ) ( not ( = ?auto_219962 ?auto_219965 ) ) ( not ( = ?auto_219962 ?auto_219966 ) ) ( not ( = ?auto_219962 ?auto_219967 ) ) ( not ( = ?auto_219962 ?auto_219968 ) ) ( not ( = ?auto_219963 ?auto_219964 ) ) ( not ( = ?auto_219963 ?auto_219965 ) ) ( not ( = ?auto_219963 ?auto_219966 ) ) ( not ( = ?auto_219963 ?auto_219967 ) ) ( not ( = ?auto_219963 ?auto_219968 ) ) ( not ( = ?auto_219964 ?auto_219965 ) ) ( not ( = ?auto_219964 ?auto_219966 ) ) ( not ( = ?auto_219964 ?auto_219967 ) ) ( not ( = ?auto_219964 ?auto_219968 ) ) ( not ( = ?auto_219965 ?auto_219966 ) ) ( not ( = ?auto_219965 ?auto_219967 ) ) ( not ( = ?auto_219965 ?auto_219968 ) ) ( not ( = ?auto_219966 ?auto_219967 ) ) ( not ( = ?auto_219966 ?auto_219968 ) ) ( not ( = ?auto_219967 ?auto_219968 ) ) ( ON ?auto_219966 ?auto_219967 ) ( ON ?auto_219965 ?auto_219966 ) ( ON ?auto_219964 ?auto_219965 ) ( ON ?auto_219963 ?auto_219964 ) ( ON ?auto_219962 ?auto_219963 ) ( ON ?auto_219961 ?auto_219962 ) ( CLEAR ?auto_219961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_219961 )
      ( MAKE-7PILE ?auto_219961 ?auto_219962 ?auto_219963 ?auto_219964 ?auto_219965 ?auto_219966 ?auto_219967 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_219976 - BLOCK
      ?auto_219977 - BLOCK
      ?auto_219978 - BLOCK
      ?auto_219979 - BLOCK
      ?auto_219980 - BLOCK
      ?auto_219981 - BLOCK
      ?auto_219982 - BLOCK
    )
    :vars
    (
      ?auto_219983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219982 ?auto_219983 ) ( not ( = ?auto_219976 ?auto_219977 ) ) ( not ( = ?auto_219976 ?auto_219978 ) ) ( not ( = ?auto_219976 ?auto_219979 ) ) ( not ( = ?auto_219976 ?auto_219980 ) ) ( not ( = ?auto_219976 ?auto_219981 ) ) ( not ( = ?auto_219976 ?auto_219982 ) ) ( not ( = ?auto_219976 ?auto_219983 ) ) ( not ( = ?auto_219977 ?auto_219978 ) ) ( not ( = ?auto_219977 ?auto_219979 ) ) ( not ( = ?auto_219977 ?auto_219980 ) ) ( not ( = ?auto_219977 ?auto_219981 ) ) ( not ( = ?auto_219977 ?auto_219982 ) ) ( not ( = ?auto_219977 ?auto_219983 ) ) ( not ( = ?auto_219978 ?auto_219979 ) ) ( not ( = ?auto_219978 ?auto_219980 ) ) ( not ( = ?auto_219978 ?auto_219981 ) ) ( not ( = ?auto_219978 ?auto_219982 ) ) ( not ( = ?auto_219978 ?auto_219983 ) ) ( not ( = ?auto_219979 ?auto_219980 ) ) ( not ( = ?auto_219979 ?auto_219981 ) ) ( not ( = ?auto_219979 ?auto_219982 ) ) ( not ( = ?auto_219979 ?auto_219983 ) ) ( not ( = ?auto_219980 ?auto_219981 ) ) ( not ( = ?auto_219980 ?auto_219982 ) ) ( not ( = ?auto_219980 ?auto_219983 ) ) ( not ( = ?auto_219981 ?auto_219982 ) ) ( not ( = ?auto_219981 ?auto_219983 ) ) ( not ( = ?auto_219982 ?auto_219983 ) ) ( ON ?auto_219981 ?auto_219982 ) ( ON ?auto_219980 ?auto_219981 ) ( ON ?auto_219979 ?auto_219980 ) ( ON ?auto_219978 ?auto_219979 ) ( ON ?auto_219977 ?auto_219978 ) ( ON ?auto_219976 ?auto_219977 ) ( CLEAR ?auto_219976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_219976 )
      ( MAKE-7PILE ?auto_219976 ?auto_219977 ?auto_219978 ?auto_219979 ?auto_219980 ?auto_219981 ?auto_219982 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_219992 - BLOCK
      ?auto_219993 - BLOCK
      ?auto_219994 - BLOCK
      ?auto_219995 - BLOCK
      ?auto_219996 - BLOCK
      ?auto_219997 - BLOCK
      ?auto_219998 - BLOCK
      ?auto_219999 - BLOCK
    )
    :vars
    (
      ?auto_220000 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_219998 ) ( ON ?auto_219999 ?auto_220000 ) ( CLEAR ?auto_219999 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_219992 ) ( ON ?auto_219993 ?auto_219992 ) ( ON ?auto_219994 ?auto_219993 ) ( ON ?auto_219995 ?auto_219994 ) ( ON ?auto_219996 ?auto_219995 ) ( ON ?auto_219997 ?auto_219996 ) ( ON ?auto_219998 ?auto_219997 ) ( not ( = ?auto_219992 ?auto_219993 ) ) ( not ( = ?auto_219992 ?auto_219994 ) ) ( not ( = ?auto_219992 ?auto_219995 ) ) ( not ( = ?auto_219992 ?auto_219996 ) ) ( not ( = ?auto_219992 ?auto_219997 ) ) ( not ( = ?auto_219992 ?auto_219998 ) ) ( not ( = ?auto_219992 ?auto_219999 ) ) ( not ( = ?auto_219992 ?auto_220000 ) ) ( not ( = ?auto_219993 ?auto_219994 ) ) ( not ( = ?auto_219993 ?auto_219995 ) ) ( not ( = ?auto_219993 ?auto_219996 ) ) ( not ( = ?auto_219993 ?auto_219997 ) ) ( not ( = ?auto_219993 ?auto_219998 ) ) ( not ( = ?auto_219993 ?auto_219999 ) ) ( not ( = ?auto_219993 ?auto_220000 ) ) ( not ( = ?auto_219994 ?auto_219995 ) ) ( not ( = ?auto_219994 ?auto_219996 ) ) ( not ( = ?auto_219994 ?auto_219997 ) ) ( not ( = ?auto_219994 ?auto_219998 ) ) ( not ( = ?auto_219994 ?auto_219999 ) ) ( not ( = ?auto_219994 ?auto_220000 ) ) ( not ( = ?auto_219995 ?auto_219996 ) ) ( not ( = ?auto_219995 ?auto_219997 ) ) ( not ( = ?auto_219995 ?auto_219998 ) ) ( not ( = ?auto_219995 ?auto_219999 ) ) ( not ( = ?auto_219995 ?auto_220000 ) ) ( not ( = ?auto_219996 ?auto_219997 ) ) ( not ( = ?auto_219996 ?auto_219998 ) ) ( not ( = ?auto_219996 ?auto_219999 ) ) ( not ( = ?auto_219996 ?auto_220000 ) ) ( not ( = ?auto_219997 ?auto_219998 ) ) ( not ( = ?auto_219997 ?auto_219999 ) ) ( not ( = ?auto_219997 ?auto_220000 ) ) ( not ( = ?auto_219998 ?auto_219999 ) ) ( not ( = ?auto_219998 ?auto_220000 ) ) ( not ( = ?auto_219999 ?auto_220000 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_219999 ?auto_220000 )
      ( !STACK ?auto_219999 ?auto_219998 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_220009 - BLOCK
      ?auto_220010 - BLOCK
      ?auto_220011 - BLOCK
      ?auto_220012 - BLOCK
      ?auto_220013 - BLOCK
      ?auto_220014 - BLOCK
      ?auto_220015 - BLOCK
      ?auto_220016 - BLOCK
    )
    :vars
    (
      ?auto_220017 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_220015 ) ( ON ?auto_220016 ?auto_220017 ) ( CLEAR ?auto_220016 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_220009 ) ( ON ?auto_220010 ?auto_220009 ) ( ON ?auto_220011 ?auto_220010 ) ( ON ?auto_220012 ?auto_220011 ) ( ON ?auto_220013 ?auto_220012 ) ( ON ?auto_220014 ?auto_220013 ) ( ON ?auto_220015 ?auto_220014 ) ( not ( = ?auto_220009 ?auto_220010 ) ) ( not ( = ?auto_220009 ?auto_220011 ) ) ( not ( = ?auto_220009 ?auto_220012 ) ) ( not ( = ?auto_220009 ?auto_220013 ) ) ( not ( = ?auto_220009 ?auto_220014 ) ) ( not ( = ?auto_220009 ?auto_220015 ) ) ( not ( = ?auto_220009 ?auto_220016 ) ) ( not ( = ?auto_220009 ?auto_220017 ) ) ( not ( = ?auto_220010 ?auto_220011 ) ) ( not ( = ?auto_220010 ?auto_220012 ) ) ( not ( = ?auto_220010 ?auto_220013 ) ) ( not ( = ?auto_220010 ?auto_220014 ) ) ( not ( = ?auto_220010 ?auto_220015 ) ) ( not ( = ?auto_220010 ?auto_220016 ) ) ( not ( = ?auto_220010 ?auto_220017 ) ) ( not ( = ?auto_220011 ?auto_220012 ) ) ( not ( = ?auto_220011 ?auto_220013 ) ) ( not ( = ?auto_220011 ?auto_220014 ) ) ( not ( = ?auto_220011 ?auto_220015 ) ) ( not ( = ?auto_220011 ?auto_220016 ) ) ( not ( = ?auto_220011 ?auto_220017 ) ) ( not ( = ?auto_220012 ?auto_220013 ) ) ( not ( = ?auto_220012 ?auto_220014 ) ) ( not ( = ?auto_220012 ?auto_220015 ) ) ( not ( = ?auto_220012 ?auto_220016 ) ) ( not ( = ?auto_220012 ?auto_220017 ) ) ( not ( = ?auto_220013 ?auto_220014 ) ) ( not ( = ?auto_220013 ?auto_220015 ) ) ( not ( = ?auto_220013 ?auto_220016 ) ) ( not ( = ?auto_220013 ?auto_220017 ) ) ( not ( = ?auto_220014 ?auto_220015 ) ) ( not ( = ?auto_220014 ?auto_220016 ) ) ( not ( = ?auto_220014 ?auto_220017 ) ) ( not ( = ?auto_220015 ?auto_220016 ) ) ( not ( = ?auto_220015 ?auto_220017 ) ) ( not ( = ?auto_220016 ?auto_220017 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_220016 ?auto_220017 )
      ( !STACK ?auto_220016 ?auto_220015 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_220026 - BLOCK
      ?auto_220027 - BLOCK
      ?auto_220028 - BLOCK
      ?auto_220029 - BLOCK
      ?auto_220030 - BLOCK
      ?auto_220031 - BLOCK
      ?auto_220032 - BLOCK
      ?auto_220033 - BLOCK
    )
    :vars
    (
      ?auto_220034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220033 ?auto_220034 ) ( ON-TABLE ?auto_220026 ) ( ON ?auto_220027 ?auto_220026 ) ( ON ?auto_220028 ?auto_220027 ) ( ON ?auto_220029 ?auto_220028 ) ( ON ?auto_220030 ?auto_220029 ) ( ON ?auto_220031 ?auto_220030 ) ( not ( = ?auto_220026 ?auto_220027 ) ) ( not ( = ?auto_220026 ?auto_220028 ) ) ( not ( = ?auto_220026 ?auto_220029 ) ) ( not ( = ?auto_220026 ?auto_220030 ) ) ( not ( = ?auto_220026 ?auto_220031 ) ) ( not ( = ?auto_220026 ?auto_220032 ) ) ( not ( = ?auto_220026 ?auto_220033 ) ) ( not ( = ?auto_220026 ?auto_220034 ) ) ( not ( = ?auto_220027 ?auto_220028 ) ) ( not ( = ?auto_220027 ?auto_220029 ) ) ( not ( = ?auto_220027 ?auto_220030 ) ) ( not ( = ?auto_220027 ?auto_220031 ) ) ( not ( = ?auto_220027 ?auto_220032 ) ) ( not ( = ?auto_220027 ?auto_220033 ) ) ( not ( = ?auto_220027 ?auto_220034 ) ) ( not ( = ?auto_220028 ?auto_220029 ) ) ( not ( = ?auto_220028 ?auto_220030 ) ) ( not ( = ?auto_220028 ?auto_220031 ) ) ( not ( = ?auto_220028 ?auto_220032 ) ) ( not ( = ?auto_220028 ?auto_220033 ) ) ( not ( = ?auto_220028 ?auto_220034 ) ) ( not ( = ?auto_220029 ?auto_220030 ) ) ( not ( = ?auto_220029 ?auto_220031 ) ) ( not ( = ?auto_220029 ?auto_220032 ) ) ( not ( = ?auto_220029 ?auto_220033 ) ) ( not ( = ?auto_220029 ?auto_220034 ) ) ( not ( = ?auto_220030 ?auto_220031 ) ) ( not ( = ?auto_220030 ?auto_220032 ) ) ( not ( = ?auto_220030 ?auto_220033 ) ) ( not ( = ?auto_220030 ?auto_220034 ) ) ( not ( = ?auto_220031 ?auto_220032 ) ) ( not ( = ?auto_220031 ?auto_220033 ) ) ( not ( = ?auto_220031 ?auto_220034 ) ) ( not ( = ?auto_220032 ?auto_220033 ) ) ( not ( = ?auto_220032 ?auto_220034 ) ) ( not ( = ?auto_220033 ?auto_220034 ) ) ( CLEAR ?auto_220031 ) ( ON ?auto_220032 ?auto_220033 ) ( CLEAR ?auto_220032 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_220026 ?auto_220027 ?auto_220028 ?auto_220029 ?auto_220030 ?auto_220031 ?auto_220032 )
      ( MAKE-8PILE ?auto_220026 ?auto_220027 ?auto_220028 ?auto_220029 ?auto_220030 ?auto_220031 ?auto_220032 ?auto_220033 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_220043 - BLOCK
      ?auto_220044 - BLOCK
      ?auto_220045 - BLOCK
      ?auto_220046 - BLOCK
      ?auto_220047 - BLOCK
      ?auto_220048 - BLOCK
      ?auto_220049 - BLOCK
      ?auto_220050 - BLOCK
    )
    :vars
    (
      ?auto_220051 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220050 ?auto_220051 ) ( ON-TABLE ?auto_220043 ) ( ON ?auto_220044 ?auto_220043 ) ( ON ?auto_220045 ?auto_220044 ) ( ON ?auto_220046 ?auto_220045 ) ( ON ?auto_220047 ?auto_220046 ) ( ON ?auto_220048 ?auto_220047 ) ( not ( = ?auto_220043 ?auto_220044 ) ) ( not ( = ?auto_220043 ?auto_220045 ) ) ( not ( = ?auto_220043 ?auto_220046 ) ) ( not ( = ?auto_220043 ?auto_220047 ) ) ( not ( = ?auto_220043 ?auto_220048 ) ) ( not ( = ?auto_220043 ?auto_220049 ) ) ( not ( = ?auto_220043 ?auto_220050 ) ) ( not ( = ?auto_220043 ?auto_220051 ) ) ( not ( = ?auto_220044 ?auto_220045 ) ) ( not ( = ?auto_220044 ?auto_220046 ) ) ( not ( = ?auto_220044 ?auto_220047 ) ) ( not ( = ?auto_220044 ?auto_220048 ) ) ( not ( = ?auto_220044 ?auto_220049 ) ) ( not ( = ?auto_220044 ?auto_220050 ) ) ( not ( = ?auto_220044 ?auto_220051 ) ) ( not ( = ?auto_220045 ?auto_220046 ) ) ( not ( = ?auto_220045 ?auto_220047 ) ) ( not ( = ?auto_220045 ?auto_220048 ) ) ( not ( = ?auto_220045 ?auto_220049 ) ) ( not ( = ?auto_220045 ?auto_220050 ) ) ( not ( = ?auto_220045 ?auto_220051 ) ) ( not ( = ?auto_220046 ?auto_220047 ) ) ( not ( = ?auto_220046 ?auto_220048 ) ) ( not ( = ?auto_220046 ?auto_220049 ) ) ( not ( = ?auto_220046 ?auto_220050 ) ) ( not ( = ?auto_220046 ?auto_220051 ) ) ( not ( = ?auto_220047 ?auto_220048 ) ) ( not ( = ?auto_220047 ?auto_220049 ) ) ( not ( = ?auto_220047 ?auto_220050 ) ) ( not ( = ?auto_220047 ?auto_220051 ) ) ( not ( = ?auto_220048 ?auto_220049 ) ) ( not ( = ?auto_220048 ?auto_220050 ) ) ( not ( = ?auto_220048 ?auto_220051 ) ) ( not ( = ?auto_220049 ?auto_220050 ) ) ( not ( = ?auto_220049 ?auto_220051 ) ) ( not ( = ?auto_220050 ?auto_220051 ) ) ( CLEAR ?auto_220048 ) ( ON ?auto_220049 ?auto_220050 ) ( CLEAR ?auto_220049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_220043 ?auto_220044 ?auto_220045 ?auto_220046 ?auto_220047 ?auto_220048 ?auto_220049 )
      ( MAKE-8PILE ?auto_220043 ?auto_220044 ?auto_220045 ?auto_220046 ?auto_220047 ?auto_220048 ?auto_220049 ?auto_220050 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_220060 - BLOCK
      ?auto_220061 - BLOCK
      ?auto_220062 - BLOCK
      ?auto_220063 - BLOCK
      ?auto_220064 - BLOCK
      ?auto_220065 - BLOCK
      ?auto_220066 - BLOCK
      ?auto_220067 - BLOCK
    )
    :vars
    (
      ?auto_220068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220067 ?auto_220068 ) ( ON-TABLE ?auto_220060 ) ( ON ?auto_220061 ?auto_220060 ) ( ON ?auto_220062 ?auto_220061 ) ( ON ?auto_220063 ?auto_220062 ) ( ON ?auto_220064 ?auto_220063 ) ( not ( = ?auto_220060 ?auto_220061 ) ) ( not ( = ?auto_220060 ?auto_220062 ) ) ( not ( = ?auto_220060 ?auto_220063 ) ) ( not ( = ?auto_220060 ?auto_220064 ) ) ( not ( = ?auto_220060 ?auto_220065 ) ) ( not ( = ?auto_220060 ?auto_220066 ) ) ( not ( = ?auto_220060 ?auto_220067 ) ) ( not ( = ?auto_220060 ?auto_220068 ) ) ( not ( = ?auto_220061 ?auto_220062 ) ) ( not ( = ?auto_220061 ?auto_220063 ) ) ( not ( = ?auto_220061 ?auto_220064 ) ) ( not ( = ?auto_220061 ?auto_220065 ) ) ( not ( = ?auto_220061 ?auto_220066 ) ) ( not ( = ?auto_220061 ?auto_220067 ) ) ( not ( = ?auto_220061 ?auto_220068 ) ) ( not ( = ?auto_220062 ?auto_220063 ) ) ( not ( = ?auto_220062 ?auto_220064 ) ) ( not ( = ?auto_220062 ?auto_220065 ) ) ( not ( = ?auto_220062 ?auto_220066 ) ) ( not ( = ?auto_220062 ?auto_220067 ) ) ( not ( = ?auto_220062 ?auto_220068 ) ) ( not ( = ?auto_220063 ?auto_220064 ) ) ( not ( = ?auto_220063 ?auto_220065 ) ) ( not ( = ?auto_220063 ?auto_220066 ) ) ( not ( = ?auto_220063 ?auto_220067 ) ) ( not ( = ?auto_220063 ?auto_220068 ) ) ( not ( = ?auto_220064 ?auto_220065 ) ) ( not ( = ?auto_220064 ?auto_220066 ) ) ( not ( = ?auto_220064 ?auto_220067 ) ) ( not ( = ?auto_220064 ?auto_220068 ) ) ( not ( = ?auto_220065 ?auto_220066 ) ) ( not ( = ?auto_220065 ?auto_220067 ) ) ( not ( = ?auto_220065 ?auto_220068 ) ) ( not ( = ?auto_220066 ?auto_220067 ) ) ( not ( = ?auto_220066 ?auto_220068 ) ) ( not ( = ?auto_220067 ?auto_220068 ) ) ( ON ?auto_220066 ?auto_220067 ) ( CLEAR ?auto_220064 ) ( ON ?auto_220065 ?auto_220066 ) ( CLEAR ?auto_220065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_220060 ?auto_220061 ?auto_220062 ?auto_220063 ?auto_220064 ?auto_220065 )
      ( MAKE-8PILE ?auto_220060 ?auto_220061 ?auto_220062 ?auto_220063 ?auto_220064 ?auto_220065 ?auto_220066 ?auto_220067 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_220077 - BLOCK
      ?auto_220078 - BLOCK
      ?auto_220079 - BLOCK
      ?auto_220080 - BLOCK
      ?auto_220081 - BLOCK
      ?auto_220082 - BLOCK
      ?auto_220083 - BLOCK
      ?auto_220084 - BLOCK
    )
    :vars
    (
      ?auto_220085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220084 ?auto_220085 ) ( ON-TABLE ?auto_220077 ) ( ON ?auto_220078 ?auto_220077 ) ( ON ?auto_220079 ?auto_220078 ) ( ON ?auto_220080 ?auto_220079 ) ( ON ?auto_220081 ?auto_220080 ) ( not ( = ?auto_220077 ?auto_220078 ) ) ( not ( = ?auto_220077 ?auto_220079 ) ) ( not ( = ?auto_220077 ?auto_220080 ) ) ( not ( = ?auto_220077 ?auto_220081 ) ) ( not ( = ?auto_220077 ?auto_220082 ) ) ( not ( = ?auto_220077 ?auto_220083 ) ) ( not ( = ?auto_220077 ?auto_220084 ) ) ( not ( = ?auto_220077 ?auto_220085 ) ) ( not ( = ?auto_220078 ?auto_220079 ) ) ( not ( = ?auto_220078 ?auto_220080 ) ) ( not ( = ?auto_220078 ?auto_220081 ) ) ( not ( = ?auto_220078 ?auto_220082 ) ) ( not ( = ?auto_220078 ?auto_220083 ) ) ( not ( = ?auto_220078 ?auto_220084 ) ) ( not ( = ?auto_220078 ?auto_220085 ) ) ( not ( = ?auto_220079 ?auto_220080 ) ) ( not ( = ?auto_220079 ?auto_220081 ) ) ( not ( = ?auto_220079 ?auto_220082 ) ) ( not ( = ?auto_220079 ?auto_220083 ) ) ( not ( = ?auto_220079 ?auto_220084 ) ) ( not ( = ?auto_220079 ?auto_220085 ) ) ( not ( = ?auto_220080 ?auto_220081 ) ) ( not ( = ?auto_220080 ?auto_220082 ) ) ( not ( = ?auto_220080 ?auto_220083 ) ) ( not ( = ?auto_220080 ?auto_220084 ) ) ( not ( = ?auto_220080 ?auto_220085 ) ) ( not ( = ?auto_220081 ?auto_220082 ) ) ( not ( = ?auto_220081 ?auto_220083 ) ) ( not ( = ?auto_220081 ?auto_220084 ) ) ( not ( = ?auto_220081 ?auto_220085 ) ) ( not ( = ?auto_220082 ?auto_220083 ) ) ( not ( = ?auto_220082 ?auto_220084 ) ) ( not ( = ?auto_220082 ?auto_220085 ) ) ( not ( = ?auto_220083 ?auto_220084 ) ) ( not ( = ?auto_220083 ?auto_220085 ) ) ( not ( = ?auto_220084 ?auto_220085 ) ) ( ON ?auto_220083 ?auto_220084 ) ( CLEAR ?auto_220081 ) ( ON ?auto_220082 ?auto_220083 ) ( CLEAR ?auto_220082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_220077 ?auto_220078 ?auto_220079 ?auto_220080 ?auto_220081 ?auto_220082 )
      ( MAKE-8PILE ?auto_220077 ?auto_220078 ?auto_220079 ?auto_220080 ?auto_220081 ?auto_220082 ?auto_220083 ?auto_220084 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_220094 - BLOCK
      ?auto_220095 - BLOCK
      ?auto_220096 - BLOCK
      ?auto_220097 - BLOCK
      ?auto_220098 - BLOCK
      ?auto_220099 - BLOCK
      ?auto_220100 - BLOCK
      ?auto_220101 - BLOCK
    )
    :vars
    (
      ?auto_220102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220101 ?auto_220102 ) ( ON-TABLE ?auto_220094 ) ( ON ?auto_220095 ?auto_220094 ) ( ON ?auto_220096 ?auto_220095 ) ( ON ?auto_220097 ?auto_220096 ) ( not ( = ?auto_220094 ?auto_220095 ) ) ( not ( = ?auto_220094 ?auto_220096 ) ) ( not ( = ?auto_220094 ?auto_220097 ) ) ( not ( = ?auto_220094 ?auto_220098 ) ) ( not ( = ?auto_220094 ?auto_220099 ) ) ( not ( = ?auto_220094 ?auto_220100 ) ) ( not ( = ?auto_220094 ?auto_220101 ) ) ( not ( = ?auto_220094 ?auto_220102 ) ) ( not ( = ?auto_220095 ?auto_220096 ) ) ( not ( = ?auto_220095 ?auto_220097 ) ) ( not ( = ?auto_220095 ?auto_220098 ) ) ( not ( = ?auto_220095 ?auto_220099 ) ) ( not ( = ?auto_220095 ?auto_220100 ) ) ( not ( = ?auto_220095 ?auto_220101 ) ) ( not ( = ?auto_220095 ?auto_220102 ) ) ( not ( = ?auto_220096 ?auto_220097 ) ) ( not ( = ?auto_220096 ?auto_220098 ) ) ( not ( = ?auto_220096 ?auto_220099 ) ) ( not ( = ?auto_220096 ?auto_220100 ) ) ( not ( = ?auto_220096 ?auto_220101 ) ) ( not ( = ?auto_220096 ?auto_220102 ) ) ( not ( = ?auto_220097 ?auto_220098 ) ) ( not ( = ?auto_220097 ?auto_220099 ) ) ( not ( = ?auto_220097 ?auto_220100 ) ) ( not ( = ?auto_220097 ?auto_220101 ) ) ( not ( = ?auto_220097 ?auto_220102 ) ) ( not ( = ?auto_220098 ?auto_220099 ) ) ( not ( = ?auto_220098 ?auto_220100 ) ) ( not ( = ?auto_220098 ?auto_220101 ) ) ( not ( = ?auto_220098 ?auto_220102 ) ) ( not ( = ?auto_220099 ?auto_220100 ) ) ( not ( = ?auto_220099 ?auto_220101 ) ) ( not ( = ?auto_220099 ?auto_220102 ) ) ( not ( = ?auto_220100 ?auto_220101 ) ) ( not ( = ?auto_220100 ?auto_220102 ) ) ( not ( = ?auto_220101 ?auto_220102 ) ) ( ON ?auto_220100 ?auto_220101 ) ( ON ?auto_220099 ?auto_220100 ) ( CLEAR ?auto_220097 ) ( ON ?auto_220098 ?auto_220099 ) ( CLEAR ?auto_220098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_220094 ?auto_220095 ?auto_220096 ?auto_220097 ?auto_220098 )
      ( MAKE-8PILE ?auto_220094 ?auto_220095 ?auto_220096 ?auto_220097 ?auto_220098 ?auto_220099 ?auto_220100 ?auto_220101 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_220111 - BLOCK
      ?auto_220112 - BLOCK
      ?auto_220113 - BLOCK
      ?auto_220114 - BLOCK
      ?auto_220115 - BLOCK
      ?auto_220116 - BLOCK
      ?auto_220117 - BLOCK
      ?auto_220118 - BLOCK
    )
    :vars
    (
      ?auto_220119 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220118 ?auto_220119 ) ( ON-TABLE ?auto_220111 ) ( ON ?auto_220112 ?auto_220111 ) ( ON ?auto_220113 ?auto_220112 ) ( ON ?auto_220114 ?auto_220113 ) ( not ( = ?auto_220111 ?auto_220112 ) ) ( not ( = ?auto_220111 ?auto_220113 ) ) ( not ( = ?auto_220111 ?auto_220114 ) ) ( not ( = ?auto_220111 ?auto_220115 ) ) ( not ( = ?auto_220111 ?auto_220116 ) ) ( not ( = ?auto_220111 ?auto_220117 ) ) ( not ( = ?auto_220111 ?auto_220118 ) ) ( not ( = ?auto_220111 ?auto_220119 ) ) ( not ( = ?auto_220112 ?auto_220113 ) ) ( not ( = ?auto_220112 ?auto_220114 ) ) ( not ( = ?auto_220112 ?auto_220115 ) ) ( not ( = ?auto_220112 ?auto_220116 ) ) ( not ( = ?auto_220112 ?auto_220117 ) ) ( not ( = ?auto_220112 ?auto_220118 ) ) ( not ( = ?auto_220112 ?auto_220119 ) ) ( not ( = ?auto_220113 ?auto_220114 ) ) ( not ( = ?auto_220113 ?auto_220115 ) ) ( not ( = ?auto_220113 ?auto_220116 ) ) ( not ( = ?auto_220113 ?auto_220117 ) ) ( not ( = ?auto_220113 ?auto_220118 ) ) ( not ( = ?auto_220113 ?auto_220119 ) ) ( not ( = ?auto_220114 ?auto_220115 ) ) ( not ( = ?auto_220114 ?auto_220116 ) ) ( not ( = ?auto_220114 ?auto_220117 ) ) ( not ( = ?auto_220114 ?auto_220118 ) ) ( not ( = ?auto_220114 ?auto_220119 ) ) ( not ( = ?auto_220115 ?auto_220116 ) ) ( not ( = ?auto_220115 ?auto_220117 ) ) ( not ( = ?auto_220115 ?auto_220118 ) ) ( not ( = ?auto_220115 ?auto_220119 ) ) ( not ( = ?auto_220116 ?auto_220117 ) ) ( not ( = ?auto_220116 ?auto_220118 ) ) ( not ( = ?auto_220116 ?auto_220119 ) ) ( not ( = ?auto_220117 ?auto_220118 ) ) ( not ( = ?auto_220117 ?auto_220119 ) ) ( not ( = ?auto_220118 ?auto_220119 ) ) ( ON ?auto_220117 ?auto_220118 ) ( ON ?auto_220116 ?auto_220117 ) ( CLEAR ?auto_220114 ) ( ON ?auto_220115 ?auto_220116 ) ( CLEAR ?auto_220115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_220111 ?auto_220112 ?auto_220113 ?auto_220114 ?auto_220115 )
      ( MAKE-8PILE ?auto_220111 ?auto_220112 ?auto_220113 ?auto_220114 ?auto_220115 ?auto_220116 ?auto_220117 ?auto_220118 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_220128 - BLOCK
      ?auto_220129 - BLOCK
      ?auto_220130 - BLOCK
      ?auto_220131 - BLOCK
      ?auto_220132 - BLOCK
      ?auto_220133 - BLOCK
      ?auto_220134 - BLOCK
      ?auto_220135 - BLOCK
    )
    :vars
    (
      ?auto_220136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220135 ?auto_220136 ) ( ON-TABLE ?auto_220128 ) ( ON ?auto_220129 ?auto_220128 ) ( ON ?auto_220130 ?auto_220129 ) ( not ( = ?auto_220128 ?auto_220129 ) ) ( not ( = ?auto_220128 ?auto_220130 ) ) ( not ( = ?auto_220128 ?auto_220131 ) ) ( not ( = ?auto_220128 ?auto_220132 ) ) ( not ( = ?auto_220128 ?auto_220133 ) ) ( not ( = ?auto_220128 ?auto_220134 ) ) ( not ( = ?auto_220128 ?auto_220135 ) ) ( not ( = ?auto_220128 ?auto_220136 ) ) ( not ( = ?auto_220129 ?auto_220130 ) ) ( not ( = ?auto_220129 ?auto_220131 ) ) ( not ( = ?auto_220129 ?auto_220132 ) ) ( not ( = ?auto_220129 ?auto_220133 ) ) ( not ( = ?auto_220129 ?auto_220134 ) ) ( not ( = ?auto_220129 ?auto_220135 ) ) ( not ( = ?auto_220129 ?auto_220136 ) ) ( not ( = ?auto_220130 ?auto_220131 ) ) ( not ( = ?auto_220130 ?auto_220132 ) ) ( not ( = ?auto_220130 ?auto_220133 ) ) ( not ( = ?auto_220130 ?auto_220134 ) ) ( not ( = ?auto_220130 ?auto_220135 ) ) ( not ( = ?auto_220130 ?auto_220136 ) ) ( not ( = ?auto_220131 ?auto_220132 ) ) ( not ( = ?auto_220131 ?auto_220133 ) ) ( not ( = ?auto_220131 ?auto_220134 ) ) ( not ( = ?auto_220131 ?auto_220135 ) ) ( not ( = ?auto_220131 ?auto_220136 ) ) ( not ( = ?auto_220132 ?auto_220133 ) ) ( not ( = ?auto_220132 ?auto_220134 ) ) ( not ( = ?auto_220132 ?auto_220135 ) ) ( not ( = ?auto_220132 ?auto_220136 ) ) ( not ( = ?auto_220133 ?auto_220134 ) ) ( not ( = ?auto_220133 ?auto_220135 ) ) ( not ( = ?auto_220133 ?auto_220136 ) ) ( not ( = ?auto_220134 ?auto_220135 ) ) ( not ( = ?auto_220134 ?auto_220136 ) ) ( not ( = ?auto_220135 ?auto_220136 ) ) ( ON ?auto_220134 ?auto_220135 ) ( ON ?auto_220133 ?auto_220134 ) ( ON ?auto_220132 ?auto_220133 ) ( CLEAR ?auto_220130 ) ( ON ?auto_220131 ?auto_220132 ) ( CLEAR ?auto_220131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_220128 ?auto_220129 ?auto_220130 ?auto_220131 )
      ( MAKE-8PILE ?auto_220128 ?auto_220129 ?auto_220130 ?auto_220131 ?auto_220132 ?auto_220133 ?auto_220134 ?auto_220135 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_220145 - BLOCK
      ?auto_220146 - BLOCK
      ?auto_220147 - BLOCK
      ?auto_220148 - BLOCK
      ?auto_220149 - BLOCK
      ?auto_220150 - BLOCK
      ?auto_220151 - BLOCK
      ?auto_220152 - BLOCK
    )
    :vars
    (
      ?auto_220153 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220152 ?auto_220153 ) ( ON-TABLE ?auto_220145 ) ( ON ?auto_220146 ?auto_220145 ) ( ON ?auto_220147 ?auto_220146 ) ( not ( = ?auto_220145 ?auto_220146 ) ) ( not ( = ?auto_220145 ?auto_220147 ) ) ( not ( = ?auto_220145 ?auto_220148 ) ) ( not ( = ?auto_220145 ?auto_220149 ) ) ( not ( = ?auto_220145 ?auto_220150 ) ) ( not ( = ?auto_220145 ?auto_220151 ) ) ( not ( = ?auto_220145 ?auto_220152 ) ) ( not ( = ?auto_220145 ?auto_220153 ) ) ( not ( = ?auto_220146 ?auto_220147 ) ) ( not ( = ?auto_220146 ?auto_220148 ) ) ( not ( = ?auto_220146 ?auto_220149 ) ) ( not ( = ?auto_220146 ?auto_220150 ) ) ( not ( = ?auto_220146 ?auto_220151 ) ) ( not ( = ?auto_220146 ?auto_220152 ) ) ( not ( = ?auto_220146 ?auto_220153 ) ) ( not ( = ?auto_220147 ?auto_220148 ) ) ( not ( = ?auto_220147 ?auto_220149 ) ) ( not ( = ?auto_220147 ?auto_220150 ) ) ( not ( = ?auto_220147 ?auto_220151 ) ) ( not ( = ?auto_220147 ?auto_220152 ) ) ( not ( = ?auto_220147 ?auto_220153 ) ) ( not ( = ?auto_220148 ?auto_220149 ) ) ( not ( = ?auto_220148 ?auto_220150 ) ) ( not ( = ?auto_220148 ?auto_220151 ) ) ( not ( = ?auto_220148 ?auto_220152 ) ) ( not ( = ?auto_220148 ?auto_220153 ) ) ( not ( = ?auto_220149 ?auto_220150 ) ) ( not ( = ?auto_220149 ?auto_220151 ) ) ( not ( = ?auto_220149 ?auto_220152 ) ) ( not ( = ?auto_220149 ?auto_220153 ) ) ( not ( = ?auto_220150 ?auto_220151 ) ) ( not ( = ?auto_220150 ?auto_220152 ) ) ( not ( = ?auto_220150 ?auto_220153 ) ) ( not ( = ?auto_220151 ?auto_220152 ) ) ( not ( = ?auto_220151 ?auto_220153 ) ) ( not ( = ?auto_220152 ?auto_220153 ) ) ( ON ?auto_220151 ?auto_220152 ) ( ON ?auto_220150 ?auto_220151 ) ( ON ?auto_220149 ?auto_220150 ) ( CLEAR ?auto_220147 ) ( ON ?auto_220148 ?auto_220149 ) ( CLEAR ?auto_220148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_220145 ?auto_220146 ?auto_220147 ?auto_220148 )
      ( MAKE-8PILE ?auto_220145 ?auto_220146 ?auto_220147 ?auto_220148 ?auto_220149 ?auto_220150 ?auto_220151 ?auto_220152 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_220162 - BLOCK
      ?auto_220163 - BLOCK
      ?auto_220164 - BLOCK
      ?auto_220165 - BLOCK
      ?auto_220166 - BLOCK
      ?auto_220167 - BLOCK
      ?auto_220168 - BLOCK
      ?auto_220169 - BLOCK
    )
    :vars
    (
      ?auto_220170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220169 ?auto_220170 ) ( ON-TABLE ?auto_220162 ) ( ON ?auto_220163 ?auto_220162 ) ( not ( = ?auto_220162 ?auto_220163 ) ) ( not ( = ?auto_220162 ?auto_220164 ) ) ( not ( = ?auto_220162 ?auto_220165 ) ) ( not ( = ?auto_220162 ?auto_220166 ) ) ( not ( = ?auto_220162 ?auto_220167 ) ) ( not ( = ?auto_220162 ?auto_220168 ) ) ( not ( = ?auto_220162 ?auto_220169 ) ) ( not ( = ?auto_220162 ?auto_220170 ) ) ( not ( = ?auto_220163 ?auto_220164 ) ) ( not ( = ?auto_220163 ?auto_220165 ) ) ( not ( = ?auto_220163 ?auto_220166 ) ) ( not ( = ?auto_220163 ?auto_220167 ) ) ( not ( = ?auto_220163 ?auto_220168 ) ) ( not ( = ?auto_220163 ?auto_220169 ) ) ( not ( = ?auto_220163 ?auto_220170 ) ) ( not ( = ?auto_220164 ?auto_220165 ) ) ( not ( = ?auto_220164 ?auto_220166 ) ) ( not ( = ?auto_220164 ?auto_220167 ) ) ( not ( = ?auto_220164 ?auto_220168 ) ) ( not ( = ?auto_220164 ?auto_220169 ) ) ( not ( = ?auto_220164 ?auto_220170 ) ) ( not ( = ?auto_220165 ?auto_220166 ) ) ( not ( = ?auto_220165 ?auto_220167 ) ) ( not ( = ?auto_220165 ?auto_220168 ) ) ( not ( = ?auto_220165 ?auto_220169 ) ) ( not ( = ?auto_220165 ?auto_220170 ) ) ( not ( = ?auto_220166 ?auto_220167 ) ) ( not ( = ?auto_220166 ?auto_220168 ) ) ( not ( = ?auto_220166 ?auto_220169 ) ) ( not ( = ?auto_220166 ?auto_220170 ) ) ( not ( = ?auto_220167 ?auto_220168 ) ) ( not ( = ?auto_220167 ?auto_220169 ) ) ( not ( = ?auto_220167 ?auto_220170 ) ) ( not ( = ?auto_220168 ?auto_220169 ) ) ( not ( = ?auto_220168 ?auto_220170 ) ) ( not ( = ?auto_220169 ?auto_220170 ) ) ( ON ?auto_220168 ?auto_220169 ) ( ON ?auto_220167 ?auto_220168 ) ( ON ?auto_220166 ?auto_220167 ) ( ON ?auto_220165 ?auto_220166 ) ( CLEAR ?auto_220163 ) ( ON ?auto_220164 ?auto_220165 ) ( CLEAR ?auto_220164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_220162 ?auto_220163 ?auto_220164 )
      ( MAKE-8PILE ?auto_220162 ?auto_220163 ?auto_220164 ?auto_220165 ?auto_220166 ?auto_220167 ?auto_220168 ?auto_220169 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_220179 - BLOCK
      ?auto_220180 - BLOCK
      ?auto_220181 - BLOCK
      ?auto_220182 - BLOCK
      ?auto_220183 - BLOCK
      ?auto_220184 - BLOCK
      ?auto_220185 - BLOCK
      ?auto_220186 - BLOCK
    )
    :vars
    (
      ?auto_220187 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220186 ?auto_220187 ) ( ON-TABLE ?auto_220179 ) ( ON ?auto_220180 ?auto_220179 ) ( not ( = ?auto_220179 ?auto_220180 ) ) ( not ( = ?auto_220179 ?auto_220181 ) ) ( not ( = ?auto_220179 ?auto_220182 ) ) ( not ( = ?auto_220179 ?auto_220183 ) ) ( not ( = ?auto_220179 ?auto_220184 ) ) ( not ( = ?auto_220179 ?auto_220185 ) ) ( not ( = ?auto_220179 ?auto_220186 ) ) ( not ( = ?auto_220179 ?auto_220187 ) ) ( not ( = ?auto_220180 ?auto_220181 ) ) ( not ( = ?auto_220180 ?auto_220182 ) ) ( not ( = ?auto_220180 ?auto_220183 ) ) ( not ( = ?auto_220180 ?auto_220184 ) ) ( not ( = ?auto_220180 ?auto_220185 ) ) ( not ( = ?auto_220180 ?auto_220186 ) ) ( not ( = ?auto_220180 ?auto_220187 ) ) ( not ( = ?auto_220181 ?auto_220182 ) ) ( not ( = ?auto_220181 ?auto_220183 ) ) ( not ( = ?auto_220181 ?auto_220184 ) ) ( not ( = ?auto_220181 ?auto_220185 ) ) ( not ( = ?auto_220181 ?auto_220186 ) ) ( not ( = ?auto_220181 ?auto_220187 ) ) ( not ( = ?auto_220182 ?auto_220183 ) ) ( not ( = ?auto_220182 ?auto_220184 ) ) ( not ( = ?auto_220182 ?auto_220185 ) ) ( not ( = ?auto_220182 ?auto_220186 ) ) ( not ( = ?auto_220182 ?auto_220187 ) ) ( not ( = ?auto_220183 ?auto_220184 ) ) ( not ( = ?auto_220183 ?auto_220185 ) ) ( not ( = ?auto_220183 ?auto_220186 ) ) ( not ( = ?auto_220183 ?auto_220187 ) ) ( not ( = ?auto_220184 ?auto_220185 ) ) ( not ( = ?auto_220184 ?auto_220186 ) ) ( not ( = ?auto_220184 ?auto_220187 ) ) ( not ( = ?auto_220185 ?auto_220186 ) ) ( not ( = ?auto_220185 ?auto_220187 ) ) ( not ( = ?auto_220186 ?auto_220187 ) ) ( ON ?auto_220185 ?auto_220186 ) ( ON ?auto_220184 ?auto_220185 ) ( ON ?auto_220183 ?auto_220184 ) ( ON ?auto_220182 ?auto_220183 ) ( CLEAR ?auto_220180 ) ( ON ?auto_220181 ?auto_220182 ) ( CLEAR ?auto_220181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_220179 ?auto_220180 ?auto_220181 )
      ( MAKE-8PILE ?auto_220179 ?auto_220180 ?auto_220181 ?auto_220182 ?auto_220183 ?auto_220184 ?auto_220185 ?auto_220186 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_220196 - BLOCK
      ?auto_220197 - BLOCK
      ?auto_220198 - BLOCK
      ?auto_220199 - BLOCK
      ?auto_220200 - BLOCK
      ?auto_220201 - BLOCK
      ?auto_220202 - BLOCK
      ?auto_220203 - BLOCK
    )
    :vars
    (
      ?auto_220204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220203 ?auto_220204 ) ( ON-TABLE ?auto_220196 ) ( not ( = ?auto_220196 ?auto_220197 ) ) ( not ( = ?auto_220196 ?auto_220198 ) ) ( not ( = ?auto_220196 ?auto_220199 ) ) ( not ( = ?auto_220196 ?auto_220200 ) ) ( not ( = ?auto_220196 ?auto_220201 ) ) ( not ( = ?auto_220196 ?auto_220202 ) ) ( not ( = ?auto_220196 ?auto_220203 ) ) ( not ( = ?auto_220196 ?auto_220204 ) ) ( not ( = ?auto_220197 ?auto_220198 ) ) ( not ( = ?auto_220197 ?auto_220199 ) ) ( not ( = ?auto_220197 ?auto_220200 ) ) ( not ( = ?auto_220197 ?auto_220201 ) ) ( not ( = ?auto_220197 ?auto_220202 ) ) ( not ( = ?auto_220197 ?auto_220203 ) ) ( not ( = ?auto_220197 ?auto_220204 ) ) ( not ( = ?auto_220198 ?auto_220199 ) ) ( not ( = ?auto_220198 ?auto_220200 ) ) ( not ( = ?auto_220198 ?auto_220201 ) ) ( not ( = ?auto_220198 ?auto_220202 ) ) ( not ( = ?auto_220198 ?auto_220203 ) ) ( not ( = ?auto_220198 ?auto_220204 ) ) ( not ( = ?auto_220199 ?auto_220200 ) ) ( not ( = ?auto_220199 ?auto_220201 ) ) ( not ( = ?auto_220199 ?auto_220202 ) ) ( not ( = ?auto_220199 ?auto_220203 ) ) ( not ( = ?auto_220199 ?auto_220204 ) ) ( not ( = ?auto_220200 ?auto_220201 ) ) ( not ( = ?auto_220200 ?auto_220202 ) ) ( not ( = ?auto_220200 ?auto_220203 ) ) ( not ( = ?auto_220200 ?auto_220204 ) ) ( not ( = ?auto_220201 ?auto_220202 ) ) ( not ( = ?auto_220201 ?auto_220203 ) ) ( not ( = ?auto_220201 ?auto_220204 ) ) ( not ( = ?auto_220202 ?auto_220203 ) ) ( not ( = ?auto_220202 ?auto_220204 ) ) ( not ( = ?auto_220203 ?auto_220204 ) ) ( ON ?auto_220202 ?auto_220203 ) ( ON ?auto_220201 ?auto_220202 ) ( ON ?auto_220200 ?auto_220201 ) ( ON ?auto_220199 ?auto_220200 ) ( ON ?auto_220198 ?auto_220199 ) ( CLEAR ?auto_220196 ) ( ON ?auto_220197 ?auto_220198 ) ( CLEAR ?auto_220197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_220196 ?auto_220197 )
      ( MAKE-8PILE ?auto_220196 ?auto_220197 ?auto_220198 ?auto_220199 ?auto_220200 ?auto_220201 ?auto_220202 ?auto_220203 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_220213 - BLOCK
      ?auto_220214 - BLOCK
      ?auto_220215 - BLOCK
      ?auto_220216 - BLOCK
      ?auto_220217 - BLOCK
      ?auto_220218 - BLOCK
      ?auto_220219 - BLOCK
      ?auto_220220 - BLOCK
    )
    :vars
    (
      ?auto_220221 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220220 ?auto_220221 ) ( ON-TABLE ?auto_220213 ) ( not ( = ?auto_220213 ?auto_220214 ) ) ( not ( = ?auto_220213 ?auto_220215 ) ) ( not ( = ?auto_220213 ?auto_220216 ) ) ( not ( = ?auto_220213 ?auto_220217 ) ) ( not ( = ?auto_220213 ?auto_220218 ) ) ( not ( = ?auto_220213 ?auto_220219 ) ) ( not ( = ?auto_220213 ?auto_220220 ) ) ( not ( = ?auto_220213 ?auto_220221 ) ) ( not ( = ?auto_220214 ?auto_220215 ) ) ( not ( = ?auto_220214 ?auto_220216 ) ) ( not ( = ?auto_220214 ?auto_220217 ) ) ( not ( = ?auto_220214 ?auto_220218 ) ) ( not ( = ?auto_220214 ?auto_220219 ) ) ( not ( = ?auto_220214 ?auto_220220 ) ) ( not ( = ?auto_220214 ?auto_220221 ) ) ( not ( = ?auto_220215 ?auto_220216 ) ) ( not ( = ?auto_220215 ?auto_220217 ) ) ( not ( = ?auto_220215 ?auto_220218 ) ) ( not ( = ?auto_220215 ?auto_220219 ) ) ( not ( = ?auto_220215 ?auto_220220 ) ) ( not ( = ?auto_220215 ?auto_220221 ) ) ( not ( = ?auto_220216 ?auto_220217 ) ) ( not ( = ?auto_220216 ?auto_220218 ) ) ( not ( = ?auto_220216 ?auto_220219 ) ) ( not ( = ?auto_220216 ?auto_220220 ) ) ( not ( = ?auto_220216 ?auto_220221 ) ) ( not ( = ?auto_220217 ?auto_220218 ) ) ( not ( = ?auto_220217 ?auto_220219 ) ) ( not ( = ?auto_220217 ?auto_220220 ) ) ( not ( = ?auto_220217 ?auto_220221 ) ) ( not ( = ?auto_220218 ?auto_220219 ) ) ( not ( = ?auto_220218 ?auto_220220 ) ) ( not ( = ?auto_220218 ?auto_220221 ) ) ( not ( = ?auto_220219 ?auto_220220 ) ) ( not ( = ?auto_220219 ?auto_220221 ) ) ( not ( = ?auto_220220 ?auto_220221 ) ) ( ON ?auto_220219 ?auto_220220 ) ( ON ?auto_220218 ?auto_220219 ) ( ON ?auto_220217 ?auto_220218 ) ( ON ?auto_220216 ?auto_220217 ) ( ON ?auto_220215 ?auto_220216 ) ( CLEAR ?auto_220213 ) ( ON ?auto_220214 ?auto_220215 ) ( CLEAR ?auto_220214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_220213 ?auto_220214 )
      ( MAKE-8PILE ?auto_220213 ?auto_220214 ?auto_220215 ?auto_220216 ?auto_220217 ?auto_220218 ?auto_220219 ?auto_220220 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_220230 - BLOCK
      ?auto_220231 - BLOCK
      ?auto_220232 - BLOCK
      ?auto_220233 - BLOCK
      ?auto_220234 - BLOCK
      ?auto_220235 - BLOCK
      ?auto_220236 - BLOCK
      ?auto_220237 - BLOCK
    )
    :vars
    (
      ?auto_220238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220237 ?auto_220238 ) ( not ( = ?auto_220230 ?auto_220231 ) ) ( not ( = ?auto_220230 ?auto_220232 ) ) ( not ( = ?auto_220230 ?auto_220233 ) ) ( not ( = ?auto_220230 ?auto_220234 ) ) ( not ( = ?auto_220230 ?auto_220235 ) ) ( not ( = ?auto_220230 ?auto_220236 ) ) ( not ( = ?auto_220230 ?auto_220237 ) ) ( not ( = ?auto_220230 ?auto_220238 ) ) ( not ( = ?auto_220231 ?auto_220232 ) ) ( not ( = ?auto_220231 ?auto_220233 ) ) ( not ( = ?auto_220231 ?auto_220234 ) ) ( not ( = ?auto_220231 ?auto_220235 ) ) ( not ( = ?auto_220231 ?auto_220236 ) ) ( not ( = ?auto_220231 ?auto_220237 ) ) ( not ( = ?auto_220231 ?auto_220238 ) ) ( not ( = ?auto_220232 ?auto_220233 ) ) ( not ( = ?auto_220232 ?auto_220234 ) ) ( not ( = ?auto_220232 ?auto_220235 ) ) ( not ( = ?auto_220232 ?auto_220236 ) ) ( not ( = ?auto_220232 ?auto_220237 ) ) ( not ( = ?auto_220232 ?auto_220238 ) ) ( not ( = ?auto_220233 ?auto_220234 ) ) ( not ( = ?auto_220233 ?auto_220235 ) ) ( not ( = ?auto_220233 ?auto_220236 ) ) ( not ( = ?auto_220233 ?auto_220237 ) ) ( not ( = ?auto_220233 ?auto_220238 ) ) ( not ( = ?auto_220234 ?auto_220235 ) ) ( not ( = ?auto_220234 ?auto_220236 ) ) ( not ( = ?auto_220234 ?auto_220237 ) ) ( not ( = ?auto_220234 ?auto_220238 ) ) ( not ( = ?auto_220235 ?auto_220236 ) ) ( not ( = ?auto_220235 ?auto_220237 ) ) ( not ( = ?auto_220235 ?auto_220238 ) ) ( not ( = ?auto_220236 ?auto_220237 ) ) ( not ( = ?auto_220236 ?auto_220238 ) ) ( not ( = ?auto_220237 ?auto_220238 ) ) ( ON ?auto_220236 ?auto_220237 ) ( ON ?auto_220235 ?auto_220236 ) ( ON ?auto_220234 ?auto_220235 ) ( ON ?auto_220233 ?auto_220234 ) ( ON ?auto_220232 ?auto_220233 ) ( ON ?auto_220231 ?auto_220232 ) ( ON ?auto_220230 ?auto_220231 ) ( CLEAR ?auto_220230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_220230 )
      ( MAKE-8PILE ?auto_220230 ?auto_220231 ?auto_220232 ?auto_220233 ?auto_220234 ?auto_220235 ?auto_220236 ?auto_220237 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_220247 - BLOCK
      ?auto_220248 - BLOCK
      ?auto_220249 - BLOCK
      ?auto_220250 - BLOCK
      ?auto_220251 - BLOCK
      ?auto_220252 - BLOCK
      ?auto_220253 - BLOCK
      ?auto_220254 - BLOCK
    )
    :vars
    (
      ?auto_220255 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220254 ?auto_220255 ) ( not ( = ?auto_220247 ?auto_220248 ) ) ( not ( = ?auto_220247 ?auto_220249 ) ) ( not ( = ?auto_220247 ?auto_220250 ) ) ( not ( = ?auto_220247 ?auto_220251 ) ) ( not ( = ?auto_220247 ?auto_220252 ) ) ( not ( = ?auto_220247 ?auto_220253 ) ) ( not ( = ?auto_220247 ?auto_220254 ) ) ( not ( = ?auto_220247 ?auto_220255 ) ) ( not ( = ?auto_220248 ?auto_220249 ) ) ( not ( = ?auto_220248 ?auto_220250 ) ) ( not ( = ?auto_220248 ?auto_220251 ) ) ( not ( = ?auto_220248 ?auto_220252 ) ) ( not ( = ?auto_220248 ?auto_220253 ) ) ( not ( = ?auto_220248 ?auto_220254 ) ) ( not ( = ?auto_220248 ?auto_220255 ) ) ( not ( = ?auto_220249 ?auto_220250 ) ) ( not ( = ?auto_220249 ?auto_220251 ) ) ( not ( = ?auto_220249 ?auto_220252 ) ) ( not ( = ?auto_220249 ?auto_220253 ) ) ( not ( = ?auto_220249 ?auto_220254 ) ) ( not ( = ?auto_220249 ?auto_220255 ) ) ( not ( = ?auto_220250 ?auto_220251 ) ) ( not ( = ?auto_220250 ?auto_220252 ) ) ( not ( = ?auto_220250 ?auto_220253 ) ) ( not ( = ?auto_220250 ?auto_220254 ) ) ( not ( = ?auto_220250 ?auto_220255 ) ) ( not ( = ?auto_220251 ?auto_220252 ) ) ( not ( = ?auto_220251 ?auto_220253 ) ) ( not ( = ?auto_220251 ?auto_220254 ) ) ( not ( = ?auto_220251 ?auto_220255 ) ) ( not ( = ?auto_220252 ?auto_220253 ) ) ( not ( = ?auto_220252 ?auto_220254 ) ) ( not ( = ?auto_220252 ?auto_220255 ) ) ( not ( = ?auto_220253 ?auto_220254 ) ) ( not ( = ?auto_220253 ?auto_220255 ) ) ( not ( = ?auto_220254 ?auto_220255 ) ) ( ON ?auto_220253 ?auto_220254 ) ( ON ?auto_220252 ?auto_220253 ) ( ON ?auto_220251 ?auto_220252 ) ( ON ?auto_220250 ?auto_220251 ) ( ON ?auto_220249 ?auto_220250 ) ( ON ?auto_220248 ?auto_220249 ) ( ON ?auto_220247 ?auto_220248 ) ( CLEAR ?auto_220247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_220247 )
      ( MAKE-8PILE ?auto_220247 ?auto_220248 ?auto_220249 ?auto_220250 ?auto_220251 ?auto_220252 ?auto_220253 ?auto_220254 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_220265 - BLOCK
      ?auto_220266 - BLOCK
      ?auto_220267 - BLOCK
      ?auto_220268 - BLOCK
      ?auto_220269 - BLOCK
      ?auto_220270 - BLOCK
      ?auto_220271 - BLOCK
      ?auto_220272 - BLOCK
      ?auto_220273 - BLOCK
    )
    :vars
    (
      ?auto_220274 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_220272 ) ( ON ?auto_220273 ?auto_220274 ) ( CLEAR ?auto_220273 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_220265 ) ( ON ?auto_220266 ?auto_220265 ) ( ON ?auto_220267 ?auto_220266 ) ( ON ?auto_220268 ?auto_220267 ) ( ON ?auto_220269 ?auto_220268 ) ( ON ?auto_220270 ?auto_220269 ) ( ON ?auto_220271 ?auto_220270 ) ( ON ?auto_220272 ?auto_220271 ) ( not ( = ?auto_220265 ?auto_220266 ) ) ( not ( = ?auto_220265 ?auto_220267 ) ) ( not ( = ?auto_220265 ?auto_220268 ) ) ( not ( = ?auto_220265 ?auto_220269 ) ) ( not ( = ?auto_220265 ?auto_220270 ) ) ( not ( = ?auto_220265 ?auto_220271 ) ) ( not ( = ?auto_220265 ?auto_220272 ) ) ( not ( = ?auto_220265 ?auto_220273 ) ) ( not ( = ?auto_220265 ?auto_220274 ) ) ( not ( = ?auto_220266 ?auto_220267 ) ) ( not ( = ?auto_220266 ?auto_220268 ) ) ( not ( = ?auto_220266 ?auto_220269 ) ) ( not ( = ?auto_220266 ?auto_220270 ) ) ( not ( = ?auto_220266 ?auto_220271 ) ) ( not ( = ?auto_220266 ?auto_220272 ) ) ( not ( = ?auto_220266 ?auto_220273 ) ) ( not ( = ?auto_220266 ?auto_220274 ) ) ( not ( = ?auto_220267 ?auto_220268 ) ) ( not ( = ?auto_220267 ?auto_220269 ) ) ( not ( = ?auto_220267 ?auto_220270 ) ) ( not ( = ?auto_220267 ?auto_220271 ) ) ( not ( = ?auto_220267 ?auto_220272 ) ) ( not ( = ?auto_220267 ?auto_220273 ) ) ( not ( = ?auto_220267 ?auto_220274 ) ) ( not ( = ?auto_220268 ?auto_220269 ) ) ( not ( = ?auto_220268 ?auto_220270 ) ) ( not ( = ?auto_220268 ?auto_220271 ) ) ( not ( = ?auto_220268 ?auto_220272 ) ) ( not ( = ?auto_220268 ?auto_220273 ) ) ( not ( = ?auto_220268 ?auto_220274 ) ) ( not ( = ?auto_220269 ?auto_220270 ) ) ( not ( = ?auto_220269 ?auto_220271 ) ) ( not ( = ?auto_220269 ?auto_220272 ) ) ( not ( = ?auto_220269 ?auto_220273 ) ) ( not ( = ?auto_220269 ?auto_220274 ) ) ( not ( = ?auto_220270 ?auto_220271 ) ) ( not ( = ?auto_220270 ?auto_220272 ) ) ( not ( = ?auto_220270 ?auto_220273 ) ) ( not ( = ?auto_220270 ?auto_220274 ) ) ( not ( = ?auto_220271 ?auto_220272 ) ) ( not ( = ?auto_220271 ?auto_220273 ) ) ( not ( = ?auto_220271 ?auto_220274 ) ) ( not ( = ?auto_220272 ?auto_220273 ) ) ( not ( = ?auto_220272 ?auto_220274 ) ) ( not ( = ?auto_220273 ?auto_220274 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_220273 ?auto_220274 )
      ( !STACK ?auto_220273 ?auto_220272 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_220284 - BLOCK
      ?auto_220285 - BLOCK
      ?auto_220286 - BLOCK
      ?auto_220287 - BLOCK
      ?auto_220288 - BLOCK
      ?auto_220289 - BLOCK
      ?auto_220290 - BLOCK
      ?auto_220291 - BLOCK
      ?auto_220292 - BLOCK
    )
    :vars
    (
      ?auto_220293 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_220291 ) ( ON ?auto_220292 ?auto_220293 ) ( CLEAR ?auto_220292 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_220284 ) ( ON ?auto_220285 ?auto_220284 ) ( ON ?auto_220286 ?auto_220285 ) ( ON ?auto_220287 ?auto_220286 ) ( ON ?auto_220288 ?auto_220287 ) ( ON ?auto_220289 ?auto_220288 ) ( ON ?auto_220290 ?auto_220289 ) ( ON ?auto_220291 ?auto_220290 ) ( not ( = ?auto_220284 ?auto_220285 ) ) ( not ( = ?auto_220284 ?auto_220286 ) ) ( not ( = ?auto_220284 ?auto_220287 ) ) ( not ( = ?auto_220284 ?auto_220288 ) ) ( not ( = ?auto_220284 ?auto_220289 ) ) ( not ( = ?auto_220284 ?auto_220290 ) ) ( not ( = ?auto_220284 ?auto_220291 ) ) ( not ( = ?auto_220284 ?auto_220292 ) ) ( not ( = ?auto_220284 ?auto_220293 ) ) ( not ( = ?auto_220285 ?auto_220286 ) ) ( not ( = ?auto_220285 ?auto_220287 ) ) ( not ( = ?auto_220285 ?auto_220288 ) ) ( not ( = ?auto_220285 ?auto_220289 ) ) ( not ( = ?auto_220285 ?auto_220290 ) ) ( not ( = ?auto_220285 ?auto_220291 ) ) ( not ( = ?auto_220285 ?auto_220292 ) ) ( not ( = ?auto_220285 ?auto_220293 ) ) ( not ( = ?auto_220286 ?auto_220287 ) ) ( not ( = ?auto_220286 ?auto_220288 ) ) ( not ( = ?auto_220286 ?auto_220289 ) ) ( not ( = ?auto_220286 ?auto_220290 ) ) ( not ( = ?auto_220286 ?auto_220291 ) ) ( not ( = ?auto_220286 ?auto_220292 ) ) ( not ( = ?auto_220286 ?auto_220293 ) ) ( not ( = ?auto_220287 ?auto_220288 ) ) ( not ( = ?auto_220287 ?auto_220289 ) ) ( not ( = ?auto_220287 ?auto_220290 ) ) ( not ( = ?auto_220287 ?auto_220291 ) ) ( not ( = ?auto_220287 ?auto_220292 ) ) ( not ( = ?auto_220287 ?auto_220293 ) ) ( not ( = ?auto_220288 ?auto_220289 ) ) ( not ( = ?auto_220288 ?auto_220290 ) ) ( not ( = ?auto_220288 ?auto_220291 ) ) ( not ( = ?auto_220288 ?auto_220292 ) ) ( not ( = ?auto_220288 ?auto_220293 ) ) ( not ( = ?auto_220289 ?auto_220290 ) ) ( not ( = ?auto_220289 ?auto_220291 ) ) ( not ( = ?auto_220289 ?auto_220292 ) ) ( not ( = ?auto_220289 ?auto_220293 ) ) ( not ( = ?auto_220290 ?auto_220291 ) ) ( not ( = ?auto_220290 ?auto_220292 ) ) ( not ( = ?auto_220290 ?auto_220293 ) ) ( not ( = ?auto_220291 ?auto_220292 ) ) ( not ( = ?auto_220291 ?auto_220293 ) ) ( not ( = ?auto_220292 ?auto_220293 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_220292 ?auto_220293 )
      ( !STACK ?auto_220292 ?auto_220291 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_220303 - BLOCK
      ?auto_220304 - BLOCK
      ?auto_220305 - BLOCK
      ?auto_220306 - BLOCK
      ?auto_220307 - BLOCK
      ?auto_220308 - BLOCK
      ?auto_220309 - BLOCK
      ?auto_220310 - BLOCK
      ?auto_220311 - BLOCK
    )
    :vars
    (
      ?auto_220312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220311 ?auto_220312 ) ( ON-TABLE ?auto_220303 ) ( ON ?auto_220304 ?auto_220303 ) ( ON ?auto_220305 ?auto_220304 ) ( ON ?auto_220306 ?auto_220305 ) ( ON ?auto_220307 ?auto_220306 ) ( ON ?auto_220308 ?auto_220307 ) ( ON ?auto_220309 ?auto_220308 ) ( not ( = ?auto_220303 ?auto_220304 ) ) ( not ( = ?auto_220303 ?auto_220305 ) ) ( not ( = ?auto_220303 ?auto_220306 ) ) ( not ( = ?auto_220303 ?auto_220307 ) ) ( not ( = ?auto_220303 ?auto_220308 ) ) ( not ( = ?auto_220303 ?auto_220309 ) ) ( not ( = ?auto_220303 ?auto_220310 ) ) ( not ( = ?auto_220303 ?auto_220311 ) ) ( not ( = ?auto_220303 ?auto_220312 ) ) ( not ( = ?auto_220304 ?auto_220305 ) ) ( not ( = ?auto_220304 ?auto_220306 ) ) ( not ( = ?auto_220304 ?auto_220307 ) ) ( not ( = ?auto_220304 ?auto_220308 ) ) ( not ( = ?auto_220304 ?auto_220309 ) ) ( not ( = ?auto_220304 ?auto_220310 ) ) ( not ( = ?auto_220304 ?auto_220311 ) ) ( not ( = ?auto_220304 ?auto_220312 ) ) ( not ( = ?auto_220305 ?auto_220306 ) ) ( not ( = ?auto_220305 ?auto_220307 ) ) ( not ( = ?auto_220305 ?auto_220308 ) ) ( not ( = ?auto_220305 ?auto_220309 ) ) ( not ( = ?auto_220305 ?auto_220310 ) ) ( not ( = ?auto_220305 ?auto_220311 ) ) ( not ( = ?auto_220305 ?auto_220312 ) ) ( not ( = ?auto_220306 ?auto_220307 ) ) ( not ( = ?auto_220306 ?auto_220308 ) ) ( not ( = ?auto_220306 ?auto_220309 ) ) ( not ( = ?auto_220306 ?auto_220310 ) ) ( not ( = ?auto_220306 ?auto_220311 ) ) ( not ( = ?auto_220306 ?auto_220312 ) ) ( not ( = ?auto_220307 ?auto_220308 ) ) ( not ( = ?auto_220307 ?auto_220309 ) ) ( not ( = ?auto_220307 ?auto_220310 ) ) ( not ( = ?auto_220307 ?auto_220311 ) ) ( not ( = ?auto_220307 ?auto_220312 ) ) ( not ( = ?auto_220308 ?auto_220309 ) ) ( not ( = ?auto_220308 ?auto_220310 ) ) ( not ( = ?auto_220308 ?auto_220311 ) ) ( not ( = ?auto_220308 ?auto_220312 ) ) ( not ( = ?auto_220309 ?auto_220310 ) ) ( not ( = ?auto_220309 ?auto_220311 ) ) ( not ( = ?auto_220309 ?auto_220312 ) ) ( not ( = ?auto_220310 ?auto_220311 ) ) ( not ( = ?auto_220310 ?auto_220312 ) ) ( not ( = ?auto_220311 ?auto_220312 ) ) ( CLEAR ?auto_220309 ) ( ON ?auto_220310 ?auto_220311 ) ( CLEAR ?auto_220310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_220303 ?auto_220304 ?auto_220305 ?auto_220306 ?auto_220307 ?auto_220308 ?auto_220309 ?auto_220310 )
      ( MAKE-9PILE ?auto_220303 ?auto_220304 ?auto_220305 ?auto_220306 ?auto_220307 ?auto_220308 ?auto_220309 ?auto_220310 ?auto_220311 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_220322 - BLOCK
      ?auto_220323 - BLOCK
      ?auto_220324 - BLOCK
      ?auto_220325 - BLOCK
      ?auto_220326 - BLOCK
      ?auto_220327 - BLOCK
      ?auto_220328 - BLOCK
      ?auto_220329 - BLOCK
      ?auto_220330 - BLOCK
    )
    :vars
    (
      ?auto_220331 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220330 ?auto_220331 ) ( ON-TABLE ?auto_220322 ) ( ON ?auto_220323 ?auto_220322 ) ( ON ?auto_220324 ?auto_220323 ) ( ON ?auto_220325 ?auto_220324 ) ( ON ?auto_220326 ?auto_220325 ) ( ON ?auto_220327 ?auto_220326 ) ( ON ?auto_220328 ?auto_220327 ) ( not ( = ?auto_220322 ?auto_220323 ) ) ( not ( = ?auto_220322 ?auto_220324 ) ) ( not ( = ?auto_220322 ?auto_220325 ) ) ( not ( = ?auto_220322 ?auto_220326 ) ) ( not ( = ?auto_220322 ?auto_220327 ) ) ( not ( = ?auto_220322 ?auto_220328 ) ) ( not ( = ?auto_220322 ?auto_220329 ) ) ( not ( = ?auto_220322 ?auto_220330 ) ) ( not ( = ?auto_220322 ?auto_220331 ) ) ( not ( = ?auto_220323 ?auto_220324 ) ) ( not ( = ?auto_220323 ?auto_220325 ) ) ( not ( = ?auto_220323 ?auto_220326 ) ) ( not ( = ?auto_220323 ?auto_220327 ) ) ( not ( = ?auto_220323 ?auto_220328 ) ) ( not ( = ?auto_220323 ?auto_220329 ) ) ( not ( = ?auto_220323 ?auto_220330 ) ) ( not ( = ?auto_220323 ?auto_220331 ) ) ( not ( = ?auto_220324 ?auto_220325 ) ) ( not ( = ?auto_220324 ?auto_220326 ) ) ( not ( = ?auto_220324 ?auto_220327 ) ) ( not ( = ?auto_220324 ?auto_220328 ) ) ( not ( = ?auto_220324 ?auto_220329 ) ) ( not ( = ?auto_220324 ?auto_220330 ) ) ( not ( = ?auto_220324 ?auto_220331 ) ) ( not ( = ?auto_220325 ?auto_220326 ) ) ( not ( = ?auto_220325 ?auto_220327 ) ) ( not ( = ?auto_220325 ?auto_220328 ) ) ( not ( = ?auto_220325 ?auto_220329 ) ) ( not ( = ?auto_220325 ?auto_220330 ) ) ( not ( = ?auto_220325 ?auto_220331 ) ) ( not ( = ?auto_220326 ?auto_220327 ) ) ( not ( = ?auto_220326 ?auto_220328 ) ) ( not ( = ?auto_220326 ?auto_220329 ) ) ( not ( = ?auto_220326 ?auto_220330 ) ) ( not ( = ?auto_220326 ?auto_220331 ) ) ( not ( = ?auto_220327 ?auto_220328 ) ) ( not ( = ?auto_220327 ?auto_220329 ) ) ( not ( = ?auto_220327 ?auto_220330 ) ) ( not ( = ?auto_220327 ?auto_220331 ) ) ( not ( = ?auto_220328 ?auto_220329 ) ) ( not ( = ?auto_220328 ?auto_220330 ) ) ( not ( = ?auto_220328 ?auto_220331 ) ) ( not ( = ?auto_220329 ?auto_220330 ) ) ( not ( = ?auto_220329 ?auto_220331 ) ) ( not ( = ?auto_220330 ?auto_220331 ) ) ( CLEAR ?auto_220328 ) ( ON ?auto_220329 ?auto_220330 ) ( CLEAR ?auto_220329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_220322 ?auto_220323 ?auto_220324 ?auto_220325 ?auto_220326 ?auto_220327 ?auto_220328 ?auto_220329 )
      ( MAKE-9PILE ?auto_220322 ?auto_220323 ?auto_220324 ?auto_220325 ?auto_220326 ?auto_220327 ?auto_220328 ?auto_220329 ?auto_220330 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_220341 - BLOCK
      ?auto_220342 - BLOCK
      ?auto_220343 - BLOCK
      ?auto_220344 - BLOCK
      ?auto_220345 - BLOCK
      ?auto_220346 - BLOCK
      ?auto_220347 - BLOCK
      ?auto_220348 - BLOCK
      ?auto_220349 - BLOCK
    )
    :vars
    (
      ?auto_220350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220349 ?auto_220350 ) ( ON-TABLE ?auto_220341 ) ( ON ?auto_220342 ?auto_220341 ) ( ON ?auto_220343 ?auto_220342 ) ( ON ?auto_220344 ?auto_220343 ) ( ON ?auto_220345 ?auto_220344 ) ( ON ?auto_220346 ?auto_220345 ) ( not ( = ?auto_220341 ?auto_220342 ) ) ( not ( = ?auto_220341 ?auto_220343 ) ) ( not ( = ?auto_220341 ?auto_220344 ) ) ( not ( = ?auto_220341 ?auto_220345 ) ) ( not ( = ?auto_220341 ?auto_220346 ) ) ( not ( = ?auto_220341 ?auto_220347 ) ) ( not ( = ?auto_220341 ?auto_220348 ) ) ( not ( = ?auto_220341 ?auto_220349 ) ) ( not ( = ?auto_220341 ?auto_220350 ) ) ( not ( = ?auto_220342 ?auto_220343 ) ) ( not ( = ?auto_220342 ?auto_220344 ) ) ( not ( = ?auto_220342 ?auto_220345 ) ) ( not ( = ?auto_220342 ?auto_220346 ) ) ( not ( = ?auto_220342 ?auto_220347 ) ) ( not ( = ?auto_220342 ?auto_220348 ) ) ( not ( = ?auto_220342 ?auto_220349 ) ) ( not ( = ?auto_220342 ?auto_220350 ) ) ( not ( = ?auto_220343 ?auto_220344 ) ) ( not ( = ?auto_220343 ?auto_220345 ) ) ( not ( = ?auto_220343 ?auto_220346 ) ) ( not ( = ?auto_220343 ?auto_220347 ) ) ( not ( = ?auto_220343 ?auto_220348 ) ) ( not ( = ?auto_220343 ?auto_220349 ) ) ( not ( = ?auto_220343 ?auto_220350 ) ) ( not ( = ?auto_220344 ?auto_220345 ) ) ( not ( = ?auto_220344 ?auto_220346 ) ) ( not ( = ?auto_220344 ?auto_220347 ) ) ( not ( = ?auto_220344 ?auto_220348 ) ) ( not ( = ?auto_220344 ?auto_220349 ) ) ( not ( = ?auto_220344 ?auto_220350 ) ) ( not ( = ?auto_220345 ?auto_220346 ) ) ( not ( = ?auto_220345 ?auto_220347 ) ) ( not ( = ?auto_220345 ?auto_220348 ) ) ( not ( = ?auto_220345 ?auto_220349 ) ) ( not ( = ?auto_220345 ?auto_220350 ) ) ( not ( = ?auto_220346 ?auto_220347 ) ) ( not ( = ?auto_220346 ?auto_220348 ) ) ( not ( = ?auto_220346 ?auto_220349 ) ) ( not ( = ?auto_220346 ?auto_220350 ) ) ( not ( = ?auto_220347 ?auto_220348 ) ) ( not ( = ?auto_220347 ?auto_220349 ) ) ( not ( = ?auto_220347 ?auto_220350 ) ) ( not ( = ?auto_220348 ?auto_220349 ) ) ( not ( = ?auto_220348 ?auto_220350 ) ) ( not ( = ?auto_220349 ?auto_220350 ) ) ( ON ?auto_220348 ?auto_220349 ) ( CLEAR ?auto_220346 ) ( ON ?auto_220347 ?auto_220348 ) ( CLEAR ?auto_220347 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_220341 ?auto_220342 ?auto_220343 ?auto_220344 ?auto_220345 ?auto_220346 ?auto_220347 )
      ( MAKE-9PILE ?auto_220341 ?auto_220342 ?auto_220343 ?auto_220344 ?auto_220345 ?auto_220346 ?auto_220347 ?auto_220348 ?auto_220349 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_220360 - BLOCK
      ?auto_220361 - BLOCK
      ?auto_220362 - BLOCK
      ?auto_220363 - BLOCK
      ?auto_220364 - BLOCK
      ?auto_220365 - BLOCK
      ?auto_220366 - BLOCK
      ?auto_220367 - BLOCK
      ?auto_220368 - BLOCK
    )
    :vars
    (
      ?auto_220369 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220368 ?auto_220369 ) ( ON-TABLE ?auto_220360 ) ( ON ?auto_220361 ?auto_220360 ) ( ON ?auto_220362 ?auto_220361 ) ( ON ?auto_220363 ?auto_220362 ) ( ON ?auto_220364 ?auto_220363 ) ( ON ?auto_220365 ?auto_220364 ) ( not ( = ?auto_220360 ?auto_220361 ) ) ( not ( = ?auto_220360 ?auto_220362 ) ) ( not ( = ?auto_220360 ?auto_220363 ) ) ( not ( = ?auto_220360 ?auto_220364 ) ) ( not ( = ?auto_220360 ?auto_220365 ) ) ( not ( = ?auto_220360 ?auto_220366 ) ) ( not ( = ?auto_220360 ?auto_220367 ) ) ( not ( = ?auto_220360 ?auto_220368 ) ) ( not ( = ?auto_220360 ?auto_220369 ) ) ( not ( = ?auto_220361 ?auto_220362 ) ) ( not ( = ?auto_220361 ?auto_220363 ) ) ( not ( = ?auto_220361 ?auto_220364 ) ) ( not ( = ?auto_220361 ?auto_220365 ) ) ( not ( = ?auto_220361 ?auto_220366 ) ) ( not ( = ?auto_220361 ?auto_220367 ) ) ( not ( = ?auto_220361 ?auto_220368 ) ) ( not ( = ?auto_220361 ?auto_220369 ) ) ( not ( = ?auto_220362 ?auto_220363 ) ) ( not ( = ?auto_220362 ?auto_220364 ) ) ( not ( = ?auto_220362 ?auto_220365 ) ) ( not ( = ?auto_220362 ?auto_220366 ) ) ( not ( = ?auto_220362 ?auto_220367 ) ) ( not ( = ?auto_220362 ?auto_220368 ) ) ( not ( = ?auto_220362 ?auto_220369 ) ) ( not ( = ?auto_220363 ?auto_220364 ) ) ( not ( = ?auto_220363 ?auto_220365 ) ) ( not ( = ?auto_220363 ?auto_220366 ) ) ( not ( = ?auto_220363 ?auto_220367 ) ) ( not ( = ?auto_220363 ?auto_220368 ) ) ( not ( = ?auto_220363 ?auto_220369 ) ) ( not ( = ?auto_220364 ?auto_220365 ) ) ( not ( = ?auto_220364 ?auto_220366 ) ) ( not ( = ?auto_220364 ?auto_220367 ) ) ( not ( = ?auto_220364 ?auto_220368 ) ) ( not ( = ?auto_220364 ?auto_220369 ) ) ( not ( = ?auto_220365 ?auto_220366 ) ) ( not ( = ?auto_220365 ?auto_220367 ) ) ( not ( = ?auto_220365 ?auto_220368 ) ) ( not ( = ?auto_220365 ?auto_220369 ) ) ( not ( = ?auto_220366 ?auto_220367 ) ) ( not ( = ?auto_220366 ?auto_220368 ) ) ( not ( = ?auto_220366 ?auto_220369 ) ) ( not ( = ?auto_220367 ?auto_220368 ) ) ( not ( = ?auto_220367 ?auto_220369 ) ) ( not ( = ?auto_220368 ?auto_220369 ) ) ( ON ?auto_220367 ?auto_220368 ) ( CLEAR ?auto_220365 ) ( ON ?auto_220366 ?auto_220367 ) ( CLEAR ?auto_220366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_220360 ?auto_220361 ?auto_220362 ?auto_220363 ?auto_220364 ?auto_220365 ?auto_220366 )
      ( MAKE-9PILE ?auto_220360 ?auto_220361 ?auto_220362 ?auto_220363 ?auto_220364 ?auto_220365 ?auto_220366 ?auto_220367 ?auto_220368 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_220379 - BLOCK
      ?auto_220380 - BLOCK
      ?auto_220381 - BLOCK
      ?auto_220382 - BLOCK
      ?auto_220383 - BLOCK
      ?auto_220384 - BLOCK
      ?auto_220385 - BLOCK
      ?auto_220386 - BLOCK
      ?auto_220387 - BLOCK
    )
    :vars
    (
      ?auto_220388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220387 ?auto_220388 ) ( ON-TABLE ?auto_220379 ) ( ON ?auto_220380 ?auto_220379 ) ( ON ?auto_220381 ?auto_220380 ) ( ON ?auto_220382 ?auto_220381 ) ( ON ?auto_220383 ?auto_220382 ) ( not ( = ?auto_220379 ?auto_220380 ) ) ( not ( = ?auto_220379 ?auto_220381 ) ) ( not ( = ?auto_220379 ?auto_220382 ) ) ( not ( = ?auto_220379 ?auto_220383 ) ) ( not ( = ?auto_220379 ?auto_220384 ) ) ( not ( = ?auto_220379 ?auto_220385 ) ) ( not ( = ?auto_220379 ?auto_220386 ) ) ( not ( = ?auto_220379 ?auto_220387 ) ) ( not ( = ?auto_220379 ?auto_220388 ) ) ( not ( = ?auto_220380 ?auto_220381 ) ) ( not ( = ?auto_220380 ?auto_220382 ) ) ( not ( = ?auto_220380 ?auto_220383 ) ) ( not ( = ?auto_220380 ?auto_220384 ) ) ( not ( = ?auto_220380 ?auto_220385 ) ) ( not ( = ?auto_220380 ?auto_220386 ) ) ( not ( = ?auto_220380 ?auto_220387 ) ) ( not ( = ?auto_220380 ?auto_220388 ) ) ( not ( = ?auto_220381 ?auto_220382 ) ) ( not ( = ?auto_220381 ?auto_220383 ) ) ( not ( = ?auto_220381 ?auto_220384 ) ) ( not ( = ?auto_220381 ?auto_220385 ) ) ( not ( = ?auto_220381 ?auto_220386 ) ) ( not ( = ?auto_220381 ?auto_220387 ) ) ( not ( = ?auto_220381 ?auto_220388 ) ) ( not ( = ?auto_220382 ?auto_220383 ) ) ( not ( = ?auto_220382 ?auto_220384 ) ) ( not ( = ?auto_220382 ?auto_220385 ) ) ( not ( = ?auto_220382 ?auto_220386 ) ) ( not ( = ?auto_220382 ?auto_220387 ) ) ( not ( = ?auto_220382 ?auto_220388 ) ) ( not ( = ?auto_220383 ?auto_220384 ) ) ( not ( = ?auto_220383 ?auto_220385 ) ) ( not ( = ?auto_220383 ?auto_220386 ) ) ( not ( = ?auto_220383 ?auto_220387 ) ) ( not ( = ?auto_220383 ?auto_220388 ) ) ( not ( = ?auto_220384 ?auto_220385 ) ) ( not ( = ?auto_220384 ?auto_220386 ) ) ( not ( = ?auto_220384 ?auto_220387 ) ) ( not ( = ?auto_220384 ?auto_220388 ) ) ( not ( = ?auto_220385 ?auto_220386 ) ) ( not ( = ?auto_220385 ?auto_220387 ) ) ( not ( = ?auto_220385 ?auto_220388 ) ) ( not ( = ?auto_220386 ?auto_220387 ) ) ( not ( = ?auto_220386 ?auto_220388 ) ) ( not ( = ?auto_220387 ?auto_220388 ) ) ( ON ?auto_220386 ?auto_220387 ) ( ON ?auto_220385 ?auto_220386 ) ( CLEAR ?auto_220383 ) ( ON ?auto_220384 ?auto_220385 ) ( CLEAR ?auto_220384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_220379 ?auto_220380 ?auto_220381 ?auto_220382 ?auto_220383 ?auto_220384 )
      ( MAKE-9PILE ?auto_220379 ?auto_220380 ?auto_220381 ?auto_220382 ?auto_220383 ?auto_220384 ?auto_220385 ?auto_220386 ?auto_220387 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_220398 - BLOCK
      ?auto_220399 - BLOCK
      ?auto_220400 - BLOCK
      ?auto_220401 - BLOCK
      ?auto_220402 - BLOCK
      ?auto_220403 - BLOCK
      ?auto_220404 - BLOCK
      ?auto_220405 - BLOCK
      ?auto_220406 - BLOCK
    )
    :vars
    (
      ?auto_220407 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220406 ?auto_220407 ) ( ON-TABLE ?auto_220398 ) ( ON ?auto_220399 ?auto_220398 ) ( ON ?auto_220400 ?auto_220399 ) ( ON ?auto_220401 ?auto_220400 ) ( ON ?auto_220402 ?auto_220401 ) ( not ( = ?auto_220398 ?auto_220399 ) ) ( not ( = ?auto_220398 ?auto_220400 ) ) ( not ( = ?auto_220398 ?auto_220401 ) ) ( not ( = ?auto_220398 ?auto_220402 ) ) ( not ( = ?auto_220398 ?auto_220403 ) ) ( not ( = ?auto_220398 ?auto_220404 ) ) ( not ( = ?auto_220398 ?auto_220405 ) ) ( not ( = ?auto_220398 ?auto_220406 ) ) ( not ( = ?auto_220398 ?auto_220407 ) ) ( not ( = ?auto_220399 ?auto_220400 ) ) ( not ( = ?auto_220399 ?auto_220401 ) ) ( not ( = ?auto_220399 ?auto_220402 ) ) ( not ( = ?auto_220399 ?auto_220403 ) ) ( not ( = ?auto_220399 ?auto_220404 ) ) ( not ( = ?auto_220399 ?auto_220405 ) ) ( not ( = ?auto_220399 ?auto_220406 ) ) ( not ( = ?auto_220399 ?auto_220407 ) ) ( not ( = ?auto_220400 ?auto_220401 ) ) ( not ( = ?auto_220400 ?auto_220402 ) ) ( not ( = ?auto_220400 ?auto_220403 ) ) ( not ( = ?auto_220400 ?auto_220404 ) ) ( not ( = ?auto_220400 ?auto_220405 ) ) ( not ( = ?auto_220400 ?auto_220406 ) ) ( not ( = ?auto_220400 ?auto_220407 ) ) ( not ( = ?auto_220401 ?auto_220402 ) ) ( not ( = ?auto_220401 ?auto_220403 ) ) ( not ( = ?auto_220401 ?auto_220404 ) ) ( not ( = ?auto_220401 ?auto_220405 ) ) ( not ( = ?auto_220401 ?auto_220406 ) ) ( not ( = ?auto_220401 ?auto_220407 ) ) ( not ( = ?auto_220402 ?auto_220403 ) ) ( not ( = ?auto_220402 ?auto_220404 ) ) ( not ( = ?auto_220402 ?auto_220405 ) ) ( not ( = ?auto_220402 ?auto_220406 ) ) ( not ( = ?auto_220402 ?auto_220407 ) ) ( not ( = ?auto_220403 ?auto_220404 ) ) ( not ( = ?auto_220403 ?auto_220405 ) ) ( not ( = ?auto_220403 ?auto_220406 ) ) ( not ( = ?auto_220403 ?auto_220407 ) ) ( not ( = ?auto_220404 ?auto_220405 ) ) ( not ( = ?auto_220404 ?auto_220406 ) ) ( not ( = ?auto_220404 ?auto_220407 ) ) ( not ( = ?auto_220405 ?auto_220406 ) ) ( not ( = ?auto_220405 ?auto_220407 ) ) ( not ( = ?auto_220406 ?auto_220407 ) ) ( ON ?auto_220405 ?auto_220406 ) ( ON ?auto_220404 ?auto_220405 ) ( CLEAR ?auto_220402 ) ( ON ?auto_220403 ?auto_220404 ) ( CLEAR ?auto_220403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_220398 ?auto_220399 ?auto_220400 ?auto_220401 ?auto_220402 ?auto_220403 )
      ( MAKE-9PILE ?auto_220398 ?auto_220399 ?auto_220400 ?auto_220401 ?auto_220402 ?auto_220403 ?auto_220404 ?auto_220405 ?auto_220406 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_220417 - BLOCK
      ?auto_220418 - BLOCK
      ?auto_220419 - BLOCK
      ?auto_220420 - BLOCK
      ?auto_220421 - BLOCK
      ?auto_220422 - BLOCK
      ?auto_220423 - BLOCK
      ?auto_220424 - BLOCK
      ?auto_220425 - BLOCK
    )
    :vars
    (
      ?auto_220426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220425 ?auto_220426 ) ( ON-TABLE ?auto_220417 ) ( ON ?auto_220418 ?auto_220417 ) ( ON ?auto_220419 ?auto_220418 ) ( ON ?auto_220420 ?auto_220419 ) ( not ( = ?auto_220417 ?auto_220418 ) ) ( not ( = ?auto_220417 ?auto_220419 ) ) ( not ( = ?auto_220417 ?auto_220420 ) ) ( not ( = ?auto_220417 ?auto_220421 ) ) ( not ( = ?auto_220417 ?auto_220422 ) ) ( not ( = ?auto_220417 ?auto_220423 ) ) ( not ( = ?auto_220417 ?auto_220424 ) ) ( not ( = ?auto_220417 ?auto_220425 ) ) ( not ( = ?auto_220417 ?auto_220426 ) ) ( not ( = ?auto_220418 ?auto_220419 ) ) ( not ( = ?auto_220418 ?auto_220420 ) ) ( not ( = ?auto_220418 ?auto_220421 ) ) ( not ( = ?auto_220418 ?auto_220422 ) ) ( not ( = ?auto_220418 ?auto_220423 ) ) ( not ( = ?auto_220418 ?auto_220424 ) ) ( not ( = ?auto_220418 ?auto_220425 ) ) ( not ( = ?auto_220418 ?auto_220426 ) ) ( not ( = ?auto_220419 ?auto_220420 ) ) ( not ( = ?auto_220419 ?auto_220421 ) ) ( not ( = ?auto_220419 ?auto_220422 ) ) ( not ( = ?auto_220419 ?auto_220423 ) ) ( not ( = ?auto_220419 ?auto_220424 ) ) ( not ( = ?auto_220419 ?auto_220425 ) ) ( not ( = ?auto_220419 ?auto_220426 ) ) ( not ( = ?auto_220420 ?auto_220421 ) ) ( not ( = ?auto_220420 ?auto_220422 ) ) ( not ( = ?auto_220420 ?auto_220423 ) ) ( not ( = ?auto_220420 ?auto_220424 ) ) ( not ( = ?auto_220420 ?auto_220425 ) ) ( not ( = ?auto_220420 ?auto_220426 ) ) ( not ( = ?auto_220421 ?auto_220422 ) ) ( not ( = ?auto_220421 ?auto_220423 ) ) ( not ( = ?auto_220421 ?auto_220424 ) ) ( not ( = ?auto_220421 ?auto_220425 ) ) ( not ( = ?auto_220421 ?auto_220426 ) ) ( not ( = ?auto_220422 ?auto_220423 ) ) ( not ( = ?auto_220422 ?auto_220424 ) ) ( not ( = ?auto_220422 ?auto_220425 ) ) ( not ( = ?auto_220422 ?auto_220426 ) ) ( not ( = ?auto_220423 ?auto_220424 ) ) ( not ( = ?auto_220423 ?auto_220425 ) ) ( not ( = ?auto_220423 ?auto_220426 ) ) ( not ( = ?auto_220424 ?auto_220425 ) ) ( not ( = ?auto_220424 ?auto_220426 ) ) ( not ( = ?auto_220425 ?auto_220426 ) ) ( ON ?auto_220424 ?auto_220425 ) ( ON ?auto_220423 ?auto_220424 ) ( ON ?auto_220422 ?auto_220423 ) ( CLEAR ?auto_220420 ) ( ON ?auto_220421 ?auto_220422 ) ( CLEAR ?auto_220421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_220417 ?auto_220418 ?auto_220419 ?auto_220420 ?auto_220421 )
      ( MAKE-9PILE ?auto_220417 ?auto_220418 ?auto_220419 ?auto_220420 ?auto_220421 ?auto_220422 ?auto_220423 ?auto_220424 ?auto_220425 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_220436 - BLOCK
      ?auto_220437 - BLOCK
      ?auto_220438 - BLOCK
      ?auto_220439 - BLOCK
      ?auto_220440 - BLOCK
      ?auto_220441 - BLOCK
      ?auto_220442 - BLOCK
      ?auto_220443 - BLOCK
      ?auto_220444 - BLOCK
    )
    :vars
    (
      ?auto_220445 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220444 ?auto_220445 ) ( ON-TABLE ?auto_220436 ) ( ON ?auto_220437 ?auto_220436 ) ( ON ?auto_220438 ?auto_220437 ) ( ON ?auto_220439 ?auto_220438 ) ( not ( = ?auto_220436 ?auto_220437 ) ) ( not ( = ?auto_220436 ?auto_220438 ) ) ( not ( = ?auto_220436 ?auto_220439 ) ) ( not ( = ?auto_220436 ?auto_220440 ) ) ( not ( = ?auto_220436 ?auto_220441 ) ) ( not ( = ?auto_220436 ?auto_220442 ) ) ( not ( = ?auto_220436 ?auto_220443 ) ) ( not ( = ?auto_220436 ?auto_220444 ) ) ( not ( = ?auto_220436 ?auto_220445 ) ) ( not ( = ?auto_220437 ?auto_220438 ) ) ( not ( = ?auto_220437 ?auto_220439 ) ) ( not ( = ?auto_220437 ?auto_220440 ) ) ( not ( = ?auto_220437 ?auto_220441 ) ) ( not ( = ?auto_220437 ?auto_220442 ) ) ( not ( = ?auto_220437 ?auto_220443 ) ) ( not ( = ?auto_220437 ?auto_220444 ) ) ( not ( = ?auto_220437 ?auto_220445 ) ) ( not ( = ?auto_220438 ?auto_220439 ) ) ( not ( = ?auto_220438 ?auto_220440 ) ) ( not ( = ?auto_220438 ?auto_220441 ) ) ( not ( = ?auto_220438 ?auto_220442 ) ) ( not ( = ?auto_220438 ?auto_220443 ) ) ( not ( = ?auto_220438 ?auto_220444 ) ) ( not ( = ?auto_220438 ?auto_220445 ) ) ( not ( = ?auto_220439 ?auto_220440 ) ) ( not ( = ?auto_220439 ?auto_220441 ) ) ( not ( = ?auto_220439 ?auto_220442 ) ) ( not ( = ?auto_220439 ?auto_220443 ) ) ( not ( = ?auto_220439 ?auto_220444 ) ) ( not ( = ?auto_220439 ?auto_220445 ) ) ( not ( = ?auto_220440 ?auto_220441 ) ) ( not ( = ?auto_220440 ?auto_220442 ) ) ( not ( = ?auto_220440 ?auto_220443 ) ) ( not ( = ?auto_220440 ?auto_220444 ) ) ( not ( = ?auto_220440 ?auto_220445 ) ) ( not ( = ?auto_220441 ?auto_220442 ) ) ( not ( = ?auto_220441 ?auto_220443 ) ) ( not ( = ?auto_220441 ?auto_220444 ) ) ( not ( = ?auto_220441 ?auto_220445 ) ) ( not ( = ?auto_220442 ?auto_220443 ) ) ( not ( = ?auto_220442 ?auto_220444 ) ) ( not ( = ?auto_220442 ?auto_220445 ) ) ( not ( = ?auto_220443 ?auto_220444 ) ) ( not ( = ?auto_220443 ?auto_220445 ) ) ( not ( = ?auto_220444 ?auto_220445 ) ) ( ON ?auto_220443 ?auto_220444 ) ( ON ?auto_220442 ?auto_220443 ) ( ON ?auto_220441 ?auto_220442 ) ( CLEAR ?auto_220439 ) ( ON ?auto_220440 ?auto_220441 ) ( CLEAR ?auto_220440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_220436 ?auto_220437 ?auto_220438 ?auto_220439 ?auto_220440 )
      ( MAKE-9PILE ?auto_220436 ?auto_220437 ?auto_220438 ?auto_220439 ?auto_220440 ?auto_220441 ?auto_220442 ?auto_220443 ?auto_220444 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_220455 - BLOCK
      ?auto_220456 - BLOCK
      ?auto_220457 - BLOCK
      ?auto_220458 - BLOCK
      ?auto_220459 - BLOCK
      ?auto_220460 - BLOCK
      ?auto_220461 - BLOCK
      ?auto_220462 - BLOCK
      ?auto_220463 - BLOCK
    )
    :vars
    (
      ?auto_220464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220463 ?auto_220464 ) ( ON-TABLE ?auto_220455 ) ( ON ?auto_220456 ?auto_220455 ) ( ON ?auto_220457 ?auto_220456 ) ( not ( = ?auto_220455 ?auto_220456 ) ) ( not ( = ?auto_220455 ?auto_220457 ) ) ( not ( = ?auto_220455 ?auto_220458 ) ) ( not ( = ?auto_220455 ?auto_220459 ) ) ( not ( = ?auto_220455 ?auto_220460 ) ) ( not ( = ?auto_220455 ?auto_220461 ) ) ( not ( = ?auto_220455 ?auto_220462 ) ) ( not ( = ?auto_220455 ?auto_220463 ) ) ( not ( = ?auto_220455 ?auto_220464 ) ) ( not ( = ?auto_220456 ?auto_220457 ) ) ( not ( = ?auto_220456 ?auto_220458 ) ) ( not ( = ?auto_220456 ?auto_220459 ) ) ( not ( = ?auto_220456 ?auto_220460 ) ) ( not ( = ?auto_220456 ?auto_220461 ) ) ( not ( = ?auto_220456 ?auto_220462 ) ) ( not ( = ?auto_220456 ?auto_220463 ) ) ( not ( = ?auto_220456 ?auto_220464 ) ) ( not ( = ?auto_220457 ?auto_220458 ) ) ( not ( = ?auto_220457 ?auto_220459 ) ) ( not ( = ?auto_220457 ?auto_220460 ) ) ( not ( = ?auto_220457 ?auto_220461 ) ) ( not ( = ?auto_220457 ?auto_220462 ) ) ( not ( = ?auto_220457 ?auto_220463 ) ) ( not ( = ?auto_220457 ?auto_220464 ) ) ( not ( = ?auto_220458 ?auto_220459 ) ) ( not ( = ?auto_220458 ?auto_220460 ) ) ( not ( = ?auto_220458 ?auto_220461 ) ) ( not ( = ?auto_220458 ?auto_220462 ) ) ( not ( = ?auto_220458 ?auto_220463 ) ) ( not ( = ?auto_220458 ?auto_220464 ) ) ( not ( = ?auto_220459 ?auto_220460 ) ) ( not ( = ?auto_220459 ?auto_220461 ) ) ( not ( = ?auto_220459 ?auto_220462 ) ) ( not ( = ?auto_220459 ?auto_220463 ) ) ( not ( = ?auto_220459 ?auto_220464 ) ) ( not ( = ?auto_220460 ?auto_220461 ) ) ( not ( = ?auto_220460 ?auto_220462 ) ) ( not ( = ?auto_220460 ?auto_220463 ) ) ( not ( = ?auto_220460 ?auto_220464 ) ) ( not ( = ?auto_220461 ?auto_220462 ) ) ( not ( = ?auto_220461 ?auto_220463 ) ) ( not ( = ?auto_220461 ?auto_220464 ) ) ( not ( = ?auto_220462 ?auto_220463 ) ) ( not ( = ?auto_220462 ?auto_220464 ) ) ( not ( = ?auto_220463 ?auto_220464 ) ) ( ON ?auto_220462 ?auto_220463 ) ( ON ?auto_220461 ?auto_220462 ) ( ON ?auto_220460 ?auto_220461 ) ( ON ?auto_220459 ?auto_220460 ) ( CLEAR ?auto_220457 ) ( ON ?auto_220458 ?auto_220459 ) ( CLEAR ?auto_220458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_220455 ?auto_220456 ?auto_220457 ?auto_220458 )
      ( MAKE-9PILE ?auto_220455 ?auto_220456 ?auto_220457 ?auto_220458 ?auto_220459 ?auto_220460 ?auto_220461 ?auto_220462 ?auto_220463 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_220474 - BLOCK
      ?auto_220475 - BLOCK
      ?auto_220476 - BLOCK
      ?auto_220477 - BLOCK
      ?auto_220478 - BLOCK
      ?auto_220479 - BLOCK
      ?auto_220480 - BLOCK
      ?auto_220481 - BLOCK
      ?auto_220482 - BLOCK
    )
    :vars
    (
      ?auto_220483 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220482 ?auto_220483 ) ( ON-TABLE ?auto_220474 ) ( ON ?auto_220475 ?auto_220474 ) ( ON ?auto_220476 ?auto_220475 ) ( not ( = ?auto_220474 ?auto_220475 ) ) ( not ( = ?auto_220474 ?auto_220476 ) ) ( not ( = ?auto_220474 ?auto_220477 ) ) ( not ( = ?auto_220474 ?auto_220478 ) ) ( not ( = ?auto_220474 ?auto_220479 ) ) ( not ( = ?auto_220474 ?auto_220480 ) ) ( not ( = ?auto_220474 ?auto_220481 ) ) ( not ( = ?auto_220474 ?auto_220482 ) ) ( not ( = ?auto_220474 ?auto_220483 ) ) ( not ( = ?auto_220475 ?auto_220476 ) ) ( not ( = ?auto_220475 ?auto_220477 ) ) ( not ( = ?auto_220475 ?auto_220478 ) ) ( not ( = ?auto_220475 ?auto_220479 ) ) ( not ( = ?auto_220475 ?auto_220480 ) ) ( not ( = ?auto_220475 ?auto_220481 ) ) ( not ( = ?auto_220475 ?auto_220482 ) ) ( not ( = ?auto_220475 ?auto_220483 ) ) ( not ( = ?auto_220476 ?auto_220477 ) ) ( not ( = ?auto_220476 ?auto_220478 ) ) ( not ( = ?auto_220476 ?auto_220479 ) ) ( not ( = ?auto_220476 ?auto_220480 ) ) ( not ( = ?auto_220476 ?auto_220481 ) ) ( not ( = ?auto_220476 ?auto_220482 ) ) ( not ( = ?auto_220476 ?auto_220483 ) ) ( not ( = ?auto_220477 ?auto_220478 ) ) ( not ( = ?auto_220477 ?auto_220479 ) ) ( not ( = ?auto_220477 ?auto_220480 ) ) ( not ( = ?auto_220477 ?auto_220481 ) ) ( not ( = ?auto_220477 ?auto_220482 ) ) ( not ( = ?auto_220477 ?auto_220483 ) ) ( not ( = ?auto_220478 ?auto_220479 ) ) ( not ( = ?auto_220478 ?auto_220480 ) ) ( not ( = ?auto_220478 ?auto_220481 ) ) ( not ( = ?auto_220478 ?auto_220482 ) ) ( not ( = ?auto_220478 ?auto_220483 ) ) ( not ( = ?auto_220479 ?auto_220480 ) ) ( not ( = ?auto_220479 ?auto_220481 ) ) ( not ( = ?auto_220479 ?auto_220482 ) ) ( not ( = ?auto_220479 ?auto_220483 ) ) ( not ( = ?auto_220480 ?auto_220481 ) ) ( not ( = ?auto_220480 ?auto_220482 ) ) ( not ( = ?auto_220480 ?auto_220483 ) ) ( not ( = ?auto_220481 ?auto_220482 ) ) ( not ( = ?auto_220481 ?auto_220483 ) ) ( not ( = ?auto_220482 ?auto_220483 ) ) ( ON ?auto_220481 ?auto_220482 ) ( ON ?auto_220480 ?auto_220481 ) ( ON ?auto_220479 ?auto_220480 ) ( ON ?auto_220478 ?auto_220479 ) ( CLEAR ?auto_220476 ) ( ON ?auto_220477 ?auto_220478 ) ( CLEAR ?auto_220477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_220474 ?auto_220475 ?auto_220476 ?auto_220477 )
      ( MAKE-9PILE ?auto_220474 ?auto_220475 ?auto_220476 ?auto_220477 ?auto_220478 ?auto_220479 ?auto_220480 ?auto_220481 ?auto_220482 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_220493 - BLOCK
      ?auto_220494 - BLOCK
      ?auto_220495 - BLOCK
      ?auto_220496 - BLOCK
      ?auto_220497 - BLOCK
      ?auto_220498 - BLOCK
      ?auto_220499 - BLOCK
      ?auto_220500 - BLOCK
      ?auto_220501 - BLOCK
    )
    :vars
    (
      ?auto_220502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220501 ?auto_220502 ) ( ON-TABLE ?auto_220493 ) ( ON ?auto_220494 ?auto_220493 ) ( not ( = ?auto_220493 ?auto_220494 ) ) ( not ( = ?auto_220493 ?auto_220495 ) ) ( not ( = ?auto_220493 ?auto_220496 ) ) ( not ( = ?auto_220493 ?auto_220497 ) ) ( not ( = ?auto_220493 ?auto_220498 ) ) ( not ( = ?auto_220493 ?auto_220499 ) ) ( not ( = ?auto_220493 ?auto_220500 ) ) ( not ( = ?auto_220493 ?auto_220501 ) ) ( not ( = ?auto_220493 ?auto_220502 ) ) ( not ( = ?auto_220494 ?auto_220495 ) ) ( not ( = ?auto_220494 ?auto_220496 ) ) ( not ( = ?auto_220494 ?auto_220497 ) ) ( not ( = ?auto_220494 ?auto_220498 ) ) ( not ( = ?auto_220494 ?auto_220499 ) ) ( not ( = ?auto_220494 ?auto_220500 ) ) ( not ( = ?auto_220494 ?auto_220501 ) ) ( not ( = ?auto_220494 ?auto_220502 ) ) ( not ( = ?auto_220495 ?auto_220496 ) ) ( not ( = ?auto_220495 ?auto_220497 ) ) ( not ( = ?auto_220495 ?auto_220498 ) ) ( not ( = ?auto_220495 ?auto_220499 ) ) ( not ( = ?auto_220495 ?auto_220500 ) ) ( not ( = ?auto_220495 ?auto_220501 ) ) ( not ( = ?auto_220495 ?auto_220502 ) ) ( not ( = ?auto_220496 ?auto_220497 ) ) ( not ( = ?auto_220496 ?auto_220498 ) ) ( not ( = ?auto_220496 ?auto_220499 ) ) ( not ( = ?auto_220496 ?auto_220500 ) ) ( not ( = ?auto_220496 ?auto_220501 ) ) ( not ( = ?auto_220496 ?auto_220502 ) ) ( not ( = ?auto_220497 ?auto_220498 ) ) ( not ( = ?auto_220497 ?auto_220499 ) ) ( not ( = ?auto_220497 ?auto_220500 ) ) ( not ( = ?auto_220497 ?auto_220501 ) ) ( not ( = ?auto_220497 ?auto_220502 ) ) ( not ( = ?auto_220498 ?auto_220499 ) ) ( not ( = ?auto_220498 ?auto_220500 ) ) ( not ( = ?auto_220498 ?auto_220501 ) ) ( not ( = ?auto_220498 ?auto_220502 ) ) ( not ( = ?auto_220499 ?auto_220500 ) ) ( not ( = ?auto_220499 ?auto_220501 ) ) ( not ( = ?auto_220499 ?auto_220502 ) ) ( not ( = ?auto_220500 ?auto_220501 ) ) ( not ( = ?auto_220500 ?auto_220502 ) ) ( not ( = ?auto_220501 ?auto_220502 ) ) ( ON ?auto_220500 ?auto_220501 ) ( ON ?auto_220499 ?auto_220500 ) ( ON ?auto_220498 ?auto_220499 ) ( ON ?auto_220497 ?auto_220498 ) ( ON ?auto_220496 ?auto_220497 ) ( CLEAR ?auto_220494 ) ( ON ?auto_220495 ?auto_220496 ) ( CLEAR ?auto_220495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_220493 ?auto_220494 ?auto_220495 )
      ( MAKE-9PILE ?auto_220493 ?auto_220494 ?auto_220495 ?auto_220496 ?auto_220497 ?auto_220498 ?auto_220499 ?auto_220500 ?auto_220501 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_220512 - BLOCK
      ?auto_220513 - BLOCK
      ?auto_220514 - BLOCK
      ?auto_220515 - BLOCK
      ?auto_220516 - BLOCK
      ?auto_220517 - BLOCK
      ?auto_220518 - BLOCK
      ?auto_220519 - BLOCK
      ?auto_220520 - BLOCK
    )
    :vars
    (
      ?auto_220521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220520 ?auto_220521 ) ( ON-TABLE ?auto_220512 ) ( ON ?auto_220513 ?auto_220512 ) ( not ( = ?auto_220512 ?auto_220513 ) ) ( not ( = ?auto_220512 ?auto_220514 ) ) ( not ( = ?auto_220512 ?auto_220515 ) ) ( not ( = ?auto_220512 ?auto_220516 ) ) ( not ( = ?auto_220512 ?auto_220517 ) ) ( not ( = ?auto_220512 ?auto_220518 ) ) ( not ( = ?auto_220512 ?auto_220519 ) ) ( not ( = ?auto_220512 ?auto_220520 ) ) ( not ( = ?auto_220512 ?auto_220521 ) ) ( not ( = ?auto_220513 ?auto_220514 ) ) ( not ( = ?auto_220513 ?auto_220515 ) ) ( not ( = ?auto_220513 ?auto_220516 ) ) ( not ( = ?auto_220513 ?auto_220517 ) ) ( not ( = ?auto_220513 ?auto_220518 ) ) ( not ( = ?auto_220513 ?auto_220519 ) ) ( not ( = ?auto_220513 ?auto_220520 ) ) ( not ( = ?auto_220513 ?auto_220521 ) ) ( not ( = ?auto_220514 ?auto_220515 ) ) ( not ( = ?auto_220514 ?auto_220516 ) ) ( not ( = ?auto_220514 ?auto_220517 ) ) ( not ( = ?auto_220514 ?auto_220518 ) ) ( not ( = ?auto_220514 ?auto_220519 ) ) ( not ( = ?auto_220514 ?auto_220520 ) ) ( not ( = ?auto_220514 ?auto_220521 ) ) ( not ( = ?auto_220515 ?auto_220516 ) ) ( not ( = ?auto_220515 ?auto_220517 ) ) ( not ( = ?auto_220515 ?auto_220518 ) ) ( not ( = ?auto_220515 ?auto_220519 ) ) ( not ( = ?auto_220515 ?auto_220520 ) ) ( not ( = ?auto_220515 ?auto_220521 ) ) ( not ( = ?auto_220516 ?auto_220517 ) ) ( not ( = ?auto_220516 ?auto_220518 ) ) ( not ( = ?auto_220516 ?auto_220519 ) ) ( not ( = ?auto_220516 ?auto_220520 ) ) ( not ( = ?auto_220516 ?auto_220521 ) ) ( not ( = ?auto_220517 ?auto_220518 ) ) ( not ( = ?auto_220517 ?auto_220519 ) ) ( not ( = ?auto_220517 ?auto_220520 ) ) ( not ( = ?auto_220517 ?auto_220521 ) ) ( not ( = ?auto_220518 ?auto_220519 ) ) ( not ( = ?auto_220518 ?auto_220520 ) ) ( not ( = ?auto_220518 ?auto_220521 ) ) ( not ( = ?auto_220519 ?auto_220520 ) ) ( not ( = ?auto_220519 ?auto_220521 ) ) ( not ( = ?auto_220520 ?auto_220521 ) ) ( ON ?auto_220519 ?auto_220520 ) ( ON ?auto_220518 ?auto_220519 ) ( ON ?auto_220517 ?auto_220518 ) ( ON ?auto_220516 ?auto_220517 ) ( ON ?auto_220515 ?auto_220516 ) ( CLEAR ?auto_220513 ) ( ON ?auto_220514 ?auto_220515 ) ( CLEAR ?auto_220514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_220512 ?auto_220513 ?auto_220514 )
      ( MAKE-9PILE ?auto_220512 ?auto_220513 ?auto_220514 ?auto_220515 ?auto_220516 ?auto_220517 ?auto_220518 ?auto_220519 ?auto_220520 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_220531 - BLOCK
      ?auto_220532 - BLOCK
      ?auto_220533 - BLOCK
      ?auto_220534 - BLOCK
      ?auto_220535 - BLOCK
      ?auto_220536 - BLOCK
      ?auto_220537 - BLOCK
      ?auto_220538 - BLOCK
      ?auto_220539 - BLOCK
    )
    :vars
    (
      ?auto_220540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220539 ?auto_220540 ) ( ON-TABLE ?auto_220531 ) ( not ( = ?auto_220531 ?auto_220532 ) ) ( not ( = ?auto_220531 ?auto_220533 ) ) ( not ( = ?auto_220531 ?auto_220534 ) ) ( not ( = ?auto_220531 ?auto_220535 ) ) ( not ( = ?auto_220531 ?auto_220536 ) ) ( not ( = ?auto_220531 ?auto_220537 ) ) ( not ( = ?auto_220531 ?auto_220538 ) ) ( not ( = ?auto_220531 ?auto_220539 ) ) ( not ( = ?auto_220531 ?auto_220540 ) ) ( not ( = ?auto_220532 ?auto_220533 ) ) ( not ( = ?auto_220532 ?auto_220534 ) ) ( not ( = ?auto_220532 ?auto_220535 ) ) ( not ( = ?auto_220532 ?auto_220536 ) ) ( not ( = ?auto_220532 ?auto_220537 ) ) ( not ( = ?auto_220532 ?auto_220538 ) ) ( not ( = ?auto_220532 ?auto_220539 ) ) ( not ( = ?auto_220532 ?auto_220540 ) ) ( not ( = ?auto_220533 ?auto_220534 ) ) ( not ( = ?auto_220533 ?auto_220535 ) ) ( not ( = ?auto_220533 ?auto_220536 ) ) ( not ( = ?auto_220533 ?auto_220537 ) ) ( not ( = ?auto_220533 ?auto_220538 ) ) ( not ( = ?auto_220533 ?auto_220539 ) ) ( not ( = ?auto_220533 ?auto_220540 ) ) ( not ( = ?auto_220534 ?auto_220535 ) ) ( not ( = ?auto_220534 ?auto_220536 ) ) ( not ( = ?auto_220534 ?auto_220537 ) ) ( not ( = ?auto_220534 ?auto_220538 ) ) ( not ( = ?auto_220534 ?auto_220539 ) ) ( not ( = ?auto_220534 ?auto_220540 ) ) ( not ( = ?auto_220535 ?auto_220536 ) ) ( not ( = ?auto_220535 ?auto_220537 ) ) ( not ( = ?auto_220535 ?auto_220538 ) ) ( not ( = ?auto_220535 ?auto_220539 ) ) ( not ( = ?auto_220535 ?auto_220540 ) ) ( not ( = ?auto_220536 ?auto_220537 ) ) ( not ( = ?auto_220536 ?auto_220538 ) ) ( not ( = ?auto_220536 ?auto_220539 ) ) ( not ( = ?auto_220536 ?auto_220540 ) ) ( not ( = ?auto_220537 ?auto_220538 ) ) ( not ( = ?auto_220537 ?auto_220539 ) ) ( not ( = ?auto_220537 ?auto_220540 ) ) ( not ( = ?auto_220538 ?auto_220539 ) ) ( not ( = ?auto_220538 ?auto_220540 ) ) ( not ( = ?auto_220539 ?auto_220540 ) ) ( ON ?auto_220538 ?auto_220539 ) ( ON ?auto_220537 ?auto_220538 ) ( ON ?auto_220536 ?auto_220537 ) ( ON ?auto_220535 ?auto_220536 ) ( ON ?auto_220534 ?auto_220535 ) ( ON ?auto_220533 ?auto_220534 ) ( CLEAR ?auto_220531 ) ( ON ?auto_220532 ?auto_220533 ) ( CLEAR ?auto_220532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_220531 ?auto_220532 )
      ( MAKE-9PILE ?auto_220531 ?auto_220532 ?auto_220533 ?auto_220534 ?auto_220535 ?auto_220536 ?auto_220537 ?auto_220538 ?auto_220539 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_220550 - BLOCK
      ?auto_220551 - BLOCK
      ?auto_220552 - BLOCK
      ?auto_220553 - BLOCK
      ?auto_220554 - BLOCK
      ?auto_220555 - BLOCK
      ?auto_220556 - BLOCK
      ?auto_220557 - BLOCK
      ?auto_220558 - BLOCK
    )
    :vars
    (
      ?auto_220559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220558 ?auto_220559 ) ( ON-TABLE ?auto_220550 ) ( not ( = ?auto_220550 ?auto_220551 ) ) ( not ( = ?auto_220550 ?auto_220552 ) ) ( not ( = ?auto_220550 ?auto_220553 ) ) ( not ( = ?auto_220550 ?auto_220554 ) ) ( not ( = ?auto_220550 ?auto_220555 ) ) ( not ( = ?auto_220550 ?auto_220556 ) ) ( not ( = ?auto_220550 ?auto_220557 ) ) ( not ( = ?auto_220550 ?auto_220558 ) ) ( not ( = ?auto_220550 ?auto_220559 ) ) ( not ( = ?auto_220551 ?auto_220552 ) ) ( not ( = ?auto_220551 ?auto_220553 ) ) ( not ( = ?auto_220551 ?auto_220554 ) ) ( not ( = ?auto_220551 ?auto_220555 ) ) ( not ( = ?auto_220551 ?auto_220556 ) ) ( not ( = ?auto_220551 ?auto_220557 ) ) ( not ( = ?auto_220551 ?auto_220558 ) ) ( not ( = ?auto_220551 ?auto_220559 ) ) ( not ( = ?auto_220552 ?auto_220553 ) ) ( not ( = ?auto_220552 ?auto_220554 ) ) ( not ( = ?auto_220552 ?auto_220555 ) ) ( not ( = ?auto_220552 ?auto_220556 ) ) ( not ( = ?auto_220552 ?auto_220557 ) ) ( not ( = ?auto_220552 ?auto_220558 ) ) ( not ( = ?auto_220552 ?auto_220559 ) ) ( not ( = ?auto_220553 ?auto_220554 ) ) ( not ( = ?auto_220553 ?auto_220555 ) ) ( not ( = ?auto_220553 ?auto_220556 ) ) ( not ( = ?auto_220553 ?auto_220557 ) ) ( not ( = ?auto_220553 ?auto_220558 ) ) ( not ( = ?auto_220553 ?auto_220559 ) ) ( not ( = ?auto_220554 ?auto_220555 ) ) ( not ( = ?auto_220554 ?auto_220556 ) ) ( not ( = ?auto_220554 ?auto_220557 ) ) ( not ( = ?auto_220554 ?auto_220558 ) ) ( not ( = ?auto_220554 ?auto_220559 ) ) ( not ( = ?auto_220555 ?auto_220556 ) ) ( not ( = ?auto_220555 ?auto_220557 ) ) ( not ( = ?auto_220555 ?auto_220558 ) ) ( not ( = ?auto_220555 ?auto_220559 ) ) ( not ( = ?auto_220556 ?auto_220557 ) ) ( not ( = ?auto_220556 ?auto_220558 ) ) ( not ( = ?auto_220556 ?auto_220559 ) ) ( not ( = ?auto_220557 ?auto_220558 ) ) ( not ( = ?auto_220557 ?auto_220559 ) ) ( not ( = ?auto_220558 ?auto_220559 ) ) ( ON ?auto_220557 ?auto_220558 ) ( ON ?auto_220556 ?auto_220557 ) ( ON ?auto_220555 ?auto_220556 ) ( ON ?auto_220554 ?auto_220555 ) ( ON ?auto_220553 ?auto_220554 ) ( ON ?auto_220552 ?auto_220553 ) ( CLEAR ?auto_220550 ) ( ON ?auto_220551 ?auto_220552 ) ( CLEAR ?auto_220551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_220550 ?auto_220551 )
      ( MAKE-9PILE ?auto_220550 ?auto_220551 ?auto_220552 ?auto_220553 ?auto_220554 ?auto_220555 ?auto_220556 ?auto_220557 ?auto_220558 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_220569 - BLOCK
      ?auto_220570 - BLOCK
      ?auto_220571 - BLOCK
      ?auto_220572 - BLOCK
      ?auto_220573 - BLOCK
      ?auto_220574 - BLOCK
      ?auto_220575 - BLOCK
      ?auto_220576 - BLOCK
      ?auto_220577 - BLOCK
    )
    :vars
    (
      ?auto_220578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220577 ?auto_220578 ) ( not ( = ?auto_220569 ?auto_220570 ) ) ( not ( = ?auto_220569 ?auto_220571 ) ) ( not ( = ?auto_220569 ?auto_220572 ) ) ( not ( = ?auto_220569 ?auto_220573 ) ) ( not ( = ?auto_220569 ?auto_220574 ) ) ( not ( = ?auto_220569 ?auto_220575 ) ) ( not ( = ?auto_220569 ?auto_220576 ) ) ( not ( = ?auto_220569 ?auto_220577 ) ) ( not ( = ?auto_220569 ?auto_220578 ) ) ( not ( = ?auto_220570 ?auto_220571 ) ) ( not ( = ?auto_220570 ?auto_220572 ) ) ( not ( = ?auto_220570 ?auto_220573 ) ) ( not ( = ?auto_220570 ?auto_220574 ) ) ( not ( = ?auto_220570 ?auto_220575 ) ) ( not ( = ?auto_220570 ?auto_220576 ) ) ( not ( = ?auto_220570 ?auto_220577 ) ) ( not ( = ?auto_220570 ?auto_220578 ) ) ( not ( = ?auto_220571 ?auto_220572 ) ) ( not ( = ?auto_220571 ?auto_220573 ) ) ( not ( = ?auto_220571 ?auto_220574 ) ) ( not ( = ?auto_220571 ?auto_220575 ) ) ( not ( = ?auto_220571 ?auto_220576 ) ) ( not ( = ?auto_220571 ?auto_220577 ) ) ( not ( = ?auto_220571 ?auto_220578 ) ) ( not ( = ?auto_220572 ?auto_220573 ) ) ( not ( = ?auto_220572 ?auto_220574 ) ) ( not ( = ?auto_220572 ?auto_220575 ) ) ( not ( = ?auto_220572 ?auto_220576 ) ) ( not ( = ?auto_220572 ?auto_220577 ) ) ( not ( = ?auto_220572 ?auto_220578 ) ) ( not ( = ?auto_220573 ?auto_220574 ) ) ( not ( = ?auto_220573 ?auto_220575 ) ) ( not ( = ?auto_220573 ?auto_220576 ) ) ( not ( = ?auto_220573 ?auto_220577 ) ) ( not ( = ?auto_220573 ?auto_220578 ) ) ( not ( = ?auto_220574 ?auto_220575 ) ) ( not ( = ?auto_220574 ?auto_220576 ) ) ( not ( = ?auto_220574 ?auto_220577 ) ) ( not ( = ?auto_220574 ?auto_220578 ) ) ( not ( = ?auto_220575 ?auto_220576 ) ) ( not ( = ?auto_220575 ?auto_220577 ) ) ( not ( = ?auto_220575 ?auto_220578 ) ) ( not ( = ?auto_220576 ?auto_220577 ) ) ( not ( = ?auto_220576 ?auto_220578 ) ) ( not ( = ?auto_220577 ?auto_220578 ) ) ( ON ?auto_220576 ?auto_220577 ) ( ON ?auto_220575 ?auto_220576 ) ( ON ?auto_220574 ?auto_220575 ) ( ON ?auto_220573 ?auto_220574 ) ( ON ?auto_220572 ?auto_220573 ) ( ON ?auto_220571 ?auto_220572 ) ( ON ?auto_220570 ?auto_220571 ) ( ON ?auto_220569 ?auto_220570 ) ( CLEAR ?auto_220569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_220569 )
      ( MAKE-9PILE ?auto_220569 ?auto_220570 ?auto_220571 ?auto_220572 ?auto_220573 ?auto_220574 ?auto_220575 ?auto_220576 ?auto_220577 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_220588 - BLOCK
      ?auto_220589 - BLOCK
      ?auto_220590 - BLOCK
      ?auto_220591 - BLOCK
      ?auto_220592 - BLOCK
      ?auto_220593 - BLOCK
      ?auto_220594 - BLOCK
      ?auto_220595 - BLOCK
      ?auto_220596 - BLOCK
    )
    :vars
    (
      ?auto_220597 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220596 ?auto_220597 ) ( not ( = ?auto_220588 ?auto_220589 ) ) ( not ( = ?auto_220588 ?auto_220590 ) ) ( not ( = ?auto_220588 ?auto_220591 ) ) ( not ( = ?auto_220588 ?auto_220592 ) ) ( not ( = ?auto_220588 ?auto_220593 ) ) ( not ( = ?auto_220588 ?auto_220594 ) ) ( not ( = ?auto_220588 ?auto_220595 ) ) ( not ( = ?auto_220588 ?auto_220596 ) ) ( not ( = ?auto_220588 ?auto_220597 ) ) ( not ( = ?auto_220589 ?auto_220590 ) ) ( not ( = ?auto_220589 ?auto_220591 ) ) ( not ( = ?auto_220589 ?auto_220592 ) ) ( not ( = ?auto_220589 ?auto_220593 ) ) ( not ( = ?auto_220589 ?auto_220594 ) ) ( not ( = ?auto_220589 ?auto_220595 ) ) ( not ( = ?auto_220589 ?auto_220596 ) ) ( not ( = ?auto_220589 ?auto_220597 ) ) ( not ( = ?auto_220590 ?auto_220591 ) ) ( not ( = ?auto_220590 ?auto_220592 ) ) ( not ( = ?auto_220590 ?auto_220593 ) ) ( not ( = ?auto_220590 ?auto_220594 ) ) ( not ( = ?auto_220590 ?auto_220595 ) ) ( not ( = ?auto_220590 ?auto_220596 ) ) ( not ( = ?auto_220590 ?auto_220597 ) ) ( not ( = ?auto_220591 ?auto_220592 ) ) ( not ( = ?auto_220591 ?auto_220593 ) ) ( not ( = ?auto_220591 ?auto_220594 ) ) ( not ( = ?auto_220591 ?auto_220595 ) ) ( not ( = ?auto_220591 ?auto_220596 ) ) ( not ( = ?auto_220591 ?auto_220597 ) ) ( not ( = ?auto_220592 ?auto_220593 ) ) ( not ( = ?auto_220592 ?auto_220594 ) ) ( not ( = ?auto_220592 ?auto_220595 ) ) ( not ( = ?auto_220592 ?auto_220596 ) ) ( not ( = ?auto_220592 ?auto_220597 ) ) ( not ( = ?auto_220593 ?auto_220594 ) ) ( not ( = ?auto_220593 ?auto_220595 ) ) ( not ( = ?auto_220593 ?auto_220596 ) ) ( not ( = ?auto_220593 ?auto_220597 ) ) ( not ( = ?auto_220594 ?auto_220595 ) ) ( not ( = ?auto_220594 ?auto_220596 ) ) ( not ( = ?auto_220594 ?auto_220597 ) ) ( not ( = ?auto_220595 ?auto_220596 ) ) ( not ( = ?auto_220595 ?auto_220597 ) ) ( not ( = ?auto_220596 ?auto_220597 ) ) ( ON ?auto_220595 ?auto_220596 ) ( ON ?auto_220594 ?auto_220595 ) ( ON ?auto_220593 ?auto_220594 ) ( ON ?auto_220592 ?auto_220593 ) ( ON ?auto_220591 ?auto_220592 ) ( ON ?auto_220590 ?auto_220591 ) ( ON ?auto_220589 ?auto_220590 ) ( ON ?auto_220588 ?auto_220589 ) ( CLEAR ?auto_220588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_220588 )
      ( MAKE-9PILE ?auto_220588 ?auto_220589 ?auto_220590 ?auto_220591 ?auto_220592 ?auto_220593 ?auto_220594 ?auto_220595 ?auto_220596 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_220608 - BLOCK
      ?auto_220609 - BLOCK
      ?auto_220610 - BLOCK
      ?auto_220611 - BLOCK
      ?auto_220612 - BLOCK
      ?auto_220613 - BLOCK
      ?auto_220614 - BLOCK
      ?auto_220615 - BLOCK
      ?auto_220616 - BLOCK
      ?auto_220617 - BLOCK
    )
    :vars
    (
      ?auto_220618 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_220616 ) ( ON ?auto_220617 ?auto_220618 ) ( CLEAR ?auto_220617 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_220608 ) ( ON ?auto_220609 ?auto_220608 ) ( ON ?auto_220610 ?auto_220609 ) ( ON ?auto_220611 ?auto_220610 ) ( ON ?auto_220612 ?auto_220611 ) ( ON ?auto_220613 ?auto_220612 ) ( ON ?auto_220614 ?auto_220613 ) ( ON ?auto_220615 ?auto_220614 ) ( ON ?auto_220616 ?auto_220615 ) ( not ( = ?auto_220608 ?auto_220609 ) ) ( not ( = ?auto_220608 ?auto_220610 ) ) ( not ( = ?auto_220608 ?auto_220611 ) ) ( not ( = ?auto_220608 ?auto_220612 ) ) ( not ( = ?auto_220608 ?auto_220613 ) ) ( not ( = ?auto_220608 ?auto_220614 ) ) ( not ( = ?auto_220608 ?auto_220615 ) ) ( not ( = ?auto_220608 ?auto_220616 ) ) ( not ( = ?auto_220608 ?auto_220617 ) ) ( not ( = ?auto_220608 ?auto_220618 ) ) ( not ( = ?auto_220609 ?auto_220610 ) ) ( not ( = ?auto_220609 ?auto_220611 ) ) ( not ( = ?auto_220609 ?auto_220612 ) ) ( not ( = ?auto_220609 ?auto_220613 ) ) ( not ( = ?auto_220609 ?auto_220614 ) ) ( not ( = ?auto_220609 ?auto_220615 ) ) ( not ( = ?auto_220609 ?auto_220616 ) ) ( not ( = ?auto_220609 ?auto_220617 ) ) ( not ( = ?auto_220609 ?auto_220618 ) ) ( not ( = ?auto_220610 ?auto_220611 ) ) ( not ( = ?auto_220610 ?auto_220612 ) ) ( not ( = ?auto_220610 ?auto_220613 ) ) ( not ( = ?auto_220610 ?auto_220614 ) ) ( not ( = ?auto_220610 ?auto_220615 ) ) ( not ( = ?auto_220610 ?auto_220616 ) ) ( not ( = ?auto_220610 ?auto_220617 ) ) ( not ( = ?auto_220610 ?auto_220618 ) ) ( not ( = ?auto_220611 ?auto_220612 ) ) ( not ( = ?auto_220611 ?auto_220613 ) ) ( not ( = ?auto_220611 ?auto_220614 ) ) ( not ( = ?auto_220611 ?auto_220615 ) ) ( not ( = ?auto_220611 ?auto_220616 ) ) ( not ( = ?auto_220611 ?auto_220617 ) ) ( not ( = ?auto_220611 ?auto_220618 ) ) ( not ( = ?auto_220612 ?auto_220613 ) ) ( not ( = ?auto_220612 ?auto_220614 ) ) ( not ( = ?auto_220612 ?auto_220615 ) ) ( not ( = ?auto_220612 ?auto_220616 ) ) ( not ( = ?auto_220612 ?auto_220617 ) ) ( not ( = ?auto_220612 ?auto_220618 ) ) ( not ( = ?auto_220613 ?auto_220614 ) ) ( not ( = ?auto_220613 ?auto_220615 ) ) ( not ( = ?auto_220613 ?auto_220616 ) ) ( not ( = ?auto_220613 ?auto_220617 ) ) ( not ( = ?auto_220613 ?auto_220618 ) ) ( not ( = ?auto_220614 ?auto_220615 ) ) ( not ( = ?auto_220614 ?auto_220616 ) ) ( not ( = ?auto_220614 ?auto_220617 ) ) ( not ( = ?auto_220614 ?auto_220618 ) ) ( not ( = ?auto_220615 ?auto_220616 ) ) ( not ( = ?auto_220615 ?auto_220617 ) ) ( not ( = ?auto_220615 ?auto_220618 ) ) ( not ( = ?auto_220616 ?auto_220617 ) ) ( not ( = ?auto_220616 ?auto_220618 ) ) ( not ( = ?auto_220617 ?auto_220618 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_220617 ?auto_220618 )
      ( !STACK ?auto_220617 ?auto_220616 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_220629 - BLOCK
      ?auto_220630 - BLOCK
      ?auto_220631 - BLOCK
      ?auto_220632 - BLOCK
      ?auto_220633 - BLOCK
      ?auto_220634 - BLOCK
      ?auto_220635 - BLOCK
      ?auto_220636 - BLOCK
      ?auto_220637 - BLOCK
      ?auto_220638 - BLOCK
    )
    :vars
    (
      ?auto_220639 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_220637 ) ( ON ?auto_220638 ?auto_220639 ) ( CLEAR ?auto_220638 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_220629 ) ( ON ?auto_220630 ?auto_220629 ) ( ON ?auto_220631 ?auto_220630 ) ( ON ?auto_220632 ?auto_220631 ) ( ON ?auto_220633 ?auto_220632 ) ( ON ?auto_220634 ?auto_220633 ) ( ON ?auto_220635 ?auto_220634 ) ( ON ?auto_220636 ?auto_220635 ) ( ON ?auto_220637 ?auto_220636 ) ( not ( = ?auto_220629 ?auto_220630 ) ) ( not ( = ?auto_220629 ?auto_220631 ) ) ( not ( = ?auto_220629 ?auto_220632 ) ) ( not ( = ?auto_220629 ?auto_220633 ) ) ( not ( = ?auto_220629 ?auto_220634 ) ) ( not ( = ?auto_220629 ?auto_220635 ) ) ( not ( = ?auto_220629 ?auto_220636 ) ) ( not ( = ?auto_220629 ?auto_220637 ) ) ( not ( = ?auto_220629 ?auto_220638 ) ) ( not ( = ?auto_220629 ?auto_220639 ) ) ( not ( = ?auto_220630 ?auto_220631 ) ) ( not ( = ?auto_220630 ?auto_220632 ) ) ( not ( = ?auto_220630 ?auto_220633 ) ) ( not ( = ?auto_220630 ?auto_220634 ) ) ( not ( = ?auto_220630 ?auto_220635 ) ) ( not ( = ?auto_220630 ?auto_220636 ) ) ( not ( = ?auto_220630 ?auto_220637 ) ) ( not ( = ?auto_220630 ?auto_220638 ) ) ( not ( = ?auto_220630 ?auto_220639 ) ) ( not ( = ?auto_220631 ?auto_220632 ) ) ( not ( = ?auto_220631 ?auto_220633 ) ) ( not ( = ?auto_220631 ?auto_220634 ) ) ( not ( = ?auto_220631 ?auto_220635 ) ) ( not ( = ?auto_220631 ?auto_220636 ) ) ( not ( = ?auto_220631 ?auto_220637 ) ) ( not ( = ?auto_220631 ?auto_220638 ) ) ( not ( = ?auto_220631 ?auto_220639 ) ) ( not ( = ?auto_220632 ?auto_220633 ) ) ( not ( = ?auto_220632 ?auto_220634 ) ) ( not ( = ?auto_220632 ?auto_220635 ) ) ( not ( = ?auto_220632 ?auto_220636 ) ) ( not ( = ?auto_220632 ?auto_220637 ) ) ( not ( = ?auto_220632 ?auto_220638 ) ) ( not ( = ?auto_220632 ?auto_220639 ) ) ( not ( = ?auto_220633 ?auto_220634 ) ) ( not ( = ?auto_220633 ?auto_220635 ) ) ( not ( = ?auto_220633 ?auto_220636 ) ) ( not ( = ?auto_220633 ?auto_220637 ) ) ( not ( = ?auto_220633 ?auto_220638 ) ) ( not ( = ?auto_220633 ?auto_220639 ) ) ( not ( = ?auto_220634 ?auto_220635 ) ) ( not ( = ?auto_220634 ?auto_220636 ) ) ( not ( = ?auto_220634 ?auto_220637 ) ) ( not ( = ?auto_220634 ?auto_220638 ) ) ( not ( = ?auto_220634 ?auto_220639 ) ) ( not ( = ?auto_220635 ?auto_220636 ) ) ( not ( = ?auto_220635 ?auto_220637 ) ) ( not ( = ?auto_220635 ?auto_220638 ) ) ( not ( = ?auto_220635 ?auto_220639 ) ) ( not ( = ?auto_220636 ?auto_220637 ) ) ( not ( = ?auto_220636 ?auto_220638 ) ) ( not ( = ?auto_220636 ?auto_220639 ) ) ( not ( = ?auto_220637 ?auto_220638 ) ) ( not ( = ?auto_220637 ?auto_220639 ) ) ( not ( = ?auto_220638 ?auto_220639 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_220638 ?auto_220639 )
      ( !STACK ?auto_220638 ?auto_220637 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_220650 - BLOCK
      ?auto_220651 - BLOCK
      ?auto_220652 - BLOCK
      ?auto_220653 - BLOCK
      ?auto_220654 - BLOCK
      ?auto_220655 - BLOCK
      ?auto_220656 - BLOCK
      ?auto_220657 - BLOCK
      ?auto_220658 - BLOCK
      ?auto_220659 - BLOCK
    )
    :vars
    (
      ?auto_220660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220659 ?auto_220660 ) ( ON-TABLE ?auto_220650 ) ( ON ?auto_220651 ?auto_220650 ) ( ON ?auto_220652 ?auto_220651 ) ( ON ?auto_220653 ?auto_220652 ) ( ON ?auto_220654 ?auto_220653 ) ( ON ?auto_220655 ?auto_220654 ) ( ON ?auto_220656 ?auto_220655 ) ( ON ?auto_220657 ?auto_220656 ) ( not ( = ?auto_220650 ?auto_220651 ) ) ( not ( = ?auto_220650 ?auto_220652 ) ) ( not ( = ?auto_220650 ?auto_220653 ) ) ( not ( = ?auto_220650 ?auto_220654 ) ) ( not ( = ?auto_220650 ?auto_220655 ) ) ( not ( = ?auto_220650 ?auto_220656 ) ) ( not ( = ?auto_220650 ?auto_220657 ) ) ( not ( = ?auto_220650 ?auto_220658 ) ) ( not ( = ?auto_220650 ?auto_220659 ) ) ( not ( = ?auto_220650 ?auto_220660 ) ) ( not ( = ?auto_220651 ?auto_220652 ) ) ( not ( = ?auto_220651 ?auto_220653 ) ) ( not ( = ?auto_220651 ?auto_220654 ) ) ( not ( = ?auto_220651 ?auto_220655 ) ) ( not ( = ?auto_220651 ?auto_220656 ) ) ( not ( = ?auto_220651 ?auto_220657 ) ) ( not ( = ?auto_220651 ?auto_220658 ) ) ( not ( = ?auto_220651 ?auto_220659 ) ) ( not ( = ?auto_220651 ?auto_220660 ) ) ( not ( = ?auto_220652 ?auto_220653 ) ) ( not ( = ?auto_220652 ?auto_220654 ) ) ( not ( = ?auto_220652 ?auto_220655 ) ) ( not ( = ?auto_220652 ?auto_220656 ) ) ( not ( = ?auto_220652 ?auto_220657 ) ) ( not ( = ?auto_220652 ?auto_220658 ) ) ( not ( = ?auto_220652 ?auto_220659 ) ) ( not ( = ?auto_220652 ?auto_220660 ) ) ( not ( = ?auto_220653 ?auto_220654 ) ) ( not ( = ?auto_220653 ?auto_220655 ) ) ( not ( = ?auto_220653 ?auto_220656 ) ) ( not ( = ?auto_220653 ?auto_220657 ) ) ( not ( = ?auto_220653 ?auto_220658 ) ) ( not ( = ?auto_220653 ?auto_220659 ) ) ( not ( = ?auto_220653 ?auto_220660 ) ) ( not ( = ?auto_220654 ?auto_220655 ) ) ( not ( = ?auto_220654 ?auto_220656 ) ) ( not ( = ?auto_220654 ?auto_220657 ) ) ( not ( = ?auto_220654 ?auto_220658 ) ) ( not ( = ?auto_220654 ?auto_220659 ) ) ( not ( = ?auto_220654 ?auto_220660 ) ) ( not ( = ?auto_220655 ?auto_220656 ) ) ( not ( = ?auto_220655 ?auto_220657 ) ) ( not ( = ?auto_220655 ?auto_220658 ) ) ( not ( = ?auto_220655 ?auto_220659 ) ) ( not ( = ?auto_220655 ?auto_220660 ) ) ( not ( = ?auto_220656 ?auto_220657 ) ) ( not ( = ?auto_220656 ?auto_220658 ) ) ( not ( = ?auto_220656 ?auto_220659 ) ) ( not ( = ?auto_220656 ?auto_220660 ) ) ( not ( = ?auto_220657 ?auto_220658 ) ) ( not ( = ?auto_220657 ?auto_220659 ) ) ( not ( = ?auto_220657 ?auto_220660 ) ) ( not ( = ?auto_220658 ?auto_220659 ) ) ( not ( = ?auto_220658 ?auto_220660 ) ) ( not ( = ?auto_220659 ?auto_220660 ) ) ( CLEAR ?auto_220657 ) ( ON ?auto_220658 ?auto_220659 ) ( CLEAR ?auto_220658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_220650 ?auto_220651 ?auto_220652 ?auto_220653 ?auto_220654 ?auto_220655 ?auto_220656 ?auto_220657 ?auto_220658 )
      ( MAKE-10PILE ?auto_220650 ?auto_220651 ?auto_220652 ?auto_220653 ?auto_220654 ?auto_220655 ?auto_220656 ?auto_220657 ?auto_220658 ?auto_220659 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_220671 - BLOCK
      ?auto_220672 - BLOCK
      ?auto_220673 - BLOCK
      ?auto_220674 - BLOCK
      ?auto_220675 - BLOCK
      ?auto_220676 - BLOCK
      ?auto_220677 - BLOCK
      ?auto_220678 - BLOCK
      ?auto_220679 - BLOCK
      ?auto_220680 - BLOCK
    )
    :vars
    (
      ?auto_220681 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220680 ?auto_220681 ) ( ON-TABLE ?auto_220671 ) ( ON ?auto_220672 ?auto_220671 ) ( ON ?auto_220673 ?auto_220672 ) ( ON ?auto_220674 ?auto_220673 ) ( ON ?auto_220675 ?auto_220674 ) ( ON ?auto_220676 ?auto_220675 ) ( ON ?auto_220677 ?auto_220676 ) ( ON ?auto_220678 ?auto_220677 ) ( not ( = ?auto_220671 ?auto_220672 ) ) ( not ( = ?auto_220671 ?auto_220673 ) ) ( not ( = ?auto_220671 ?auto_220674 ) ) ( not ( = ?auto_220671 ?auto_220675 ) ) ( not ( = ?auto_220671 ?auto_220676 ) ) ( not ( = ?auto_220671 ?auto_220677 ) ) ( not ( = ?auto_220671 ?auto_220678 ) ) ( not ( = ?auto_220671 ?auto_220679 ) ) ( not ( = ?auto_220671 ?auto_220680 ) ) ( not ( = ?auto_220671 ?auto_220681 ) ) ( not ( = ?auto_220672 ?auto_220673 ) ) ( not ( = ?auto_220672 ?auto_220674 ) ) ( not ( = ?auto_220672 ?auto_220675 ) ) ( not ( = ?auto_220672 ?auto_220676 ) ) ( not ( = ?auto_220672 ?auto_220677 ) ) ( not ( = ?auto_220672 ?auto_220678 ) ) ( not ( = ?auto_220672 ?auto_220679 ) ) ( not ( = ?auto_220672 ?auto_220680 ) ) ( not ( = ?auto_220672 ?auto_220681 ) ) ( not ( = ?auto_220673 ?auto_220674 ) ) ( not ( = ?auto_220673 ?auto_220675 ) ) ( not ( = ?auto_220673 ?auto_220676 ) ) ( not ( = ?auto_220673 ?auto_220677 ) ) ( not ( = ?auto_220673 ?auto_220678 ) ) ( not ( = ?auto_220673 ?auto_220679 ) ) ( not ( = ?auto_220673 ?auto_220680 ) ) ( not ( = ?auto_220673 ?auto_220681 ) ) ( not ( = ?auto_220674 ?auto_220675 ) ) ( not ( = ?auto_220674 ?auto_220676 ) ) ( not ( = ?auto_220674 ?auto_220677 ) ) ( not ( = ?auto_220674 ?auto_220678 ) ) ( not ( = ?auto_220674 ?auto_220679 ) ) ( not ( = ?auto_220674 ?auto_220680 ) ) ( not ( = ?auto_220674 ?auto_220681 ) ) ( not ( = ?auto_220675 ?auto_220676 ) ) ( not ( = ?auto_220675 ?auto_220677 ) ) ( not ( = ?auto_220675 ?auto_220678 ) ) ( not ( = ?auto_220675 ?auto_220679 ) ) ( not ( = ?auto_220675 ?auto_220680 ) ) ( not ( = ?auto_220675 ?auto_220681 ) ) ( not ( = ?auto_220676 ?auto_220677 ) ) ( not ( = ?auto_220676 ?auto_220678 ) ) ( not ( = ?auto_220676 ?auto_220679 ) ) ( not ( = ?auto_220676 ?auto_220680 ) ) ( not ( = ?auto_220676 ?auto_220681 ) ) ( not ( = ?auto_220677 ?auto_220678 ) ) ( not ( = ?auto_220677 ?auto_220679 ) ) ( not ( = ?auto_220677 ?auto_220680 ) ) ( not ( = ?auto_220677 ?auto_220681 ) ) ( not ( = ?auto_220678 ?auto_220679 ) ) ( not ( = ?auto_220678 ?auto_220680 ) ) ( not ( = ?auto_220678 ?auto_220681 ) ) ( not ( = ?auto_220679 ?auto_220680 ) ) ( not ( = ?auto_220679 ?auto_220681 ) ) ( not ( = ?auto_220680 ?auto_220681 ) ) ( CLEAR ?auto_220678 ) ( ON ?auto_220679 ?auto_220680 ) ( CLEAR ?auto_220679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_220671 ?auto_220672 ?auto_220673 ?auto_220674 ?auto_220675 ?auto_220676 ?auto_220677 ?auto_220678 ?auto_220679 )
      ( MAKE-10PILE ?auto_220671 ?auto_220672 ?auto_220673 ?auto_220674 ?auto_220675 ?auto_220676 ?auto_220677 ?auto_220678 ?auto_220679 ?auto_220680 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_220692 - BLOCK
      ?auto_220693 - BLOCK
      ?auto_220694 - BLOCK
      ?auto_220695 - BLOCK
      ?auto_220696 - BLOCK
      ?auto_220697 - BLOCK
      ?auto_220698 - BLOCK
      ?auto_220699 - BLOCK
      ?auto_220700 - BLOCK
      ?auto_220701 - BLOCK
    )
    :vars
    (
      ?auto_220702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220701 ?auto_220702 ) ( ON-TABLE ?auto_220692 ) ( ON ?auto_220693 ?auto_220692 ) ( ON ?auto_220694 ?auto_220693 ) ( ON ?auto_220695 ?auto_220694 ) ( ON ?auto_220696 ?auto_220695 ) ( ON ?auto_220697 ?auto_220696 ) ( ON ?auto_220698 ?auto_220697 ) ( not ( = ?auto_220692 ?auto_220693 ) ) ( not ( = ?auto_220692 ?auto_220694 ) ) ( not ( = ?auto_220692 ?auto_220695 ) ) ( not ( = ?auto_220692 ?auto_220696 ) ) ( not ( = ?auto_220692 ?auto_220697 ) ) ( not ( = ?auto_220692 ?auto_220698 ) ) ( not ( = ?auto_220692 ?auto_220699 ) ) ( not ( = ?auto_220692 ?auto_220700 ) ) ( not ( = ?auto_220692 ?auto_220701 ) ) ( not ( = ?auto_220692 ?auto_220702 ) ) ( not ( = ?auto_220693 ?auto_220694 ) ) ( not ( = ?auto_220693 ?auto_220695 ) ) ( not ( = ?auto_220693 ?auto_220696 ) ) ( not ( = ?auto_220693 ?auto_220697 ) ) ( not ( = ?auto_220693 ?auto_220698 ) ) ( not ( = ?auto_220693 ?auto_220699 ) ) ( not ( = ?auto_220693 ?auto_220700 ) ) ( not ( = ?auto_220693 ?auto_220701 ) ) ( not ( = ?auto_220693 ?auto_220702 ) ) ( not ( = ?auto_220694 ?auto_220695 ) ) ( not ( = ?auto_220694 ?auto_220696 ) ) ( not ( = ?auto_220694 ?auto_220697 ) ) ( not ( = ?auto_220694 ?auto_220698 ) ) ( not ( = ?auto_220694 ?auto_220699 ) ) ( not ( = ?auto_220694 ?auto_220700 ) ) ( not ( = ?auto_220694 ?auto_220701 ) ) ( not ( = ?auto_220694 ?auto_220702 ) ) ( not ( = ?auto_220695 ?auto_220696 ) ) ( not ( = ?auto_220695 ?auto_220697 ) ) ( not ( = ?auto_220695 ?auto_220698 ) ) ( not ( = ?auto_220695 ?auto_220699 ) ) ( not ( = ?auto_220695 ?auto_220700 ) ) ( not ( = ?auto_220695 ?auto_220701 ) ) ( not ( = ?auto_220695 ?auto_220702 ) ) ( not ( = ?auto_220696 ?auto_220697 ) ) ( not ( = ?auto_220696 ?auto_220698 ) ) ( not ( = ?auto_220696 ?auto_220699 ) ) ( not ( = ?auto_220696 ?auto_220700 ) ) ( not ( = ?auto_220696 ?auto_220701 ) ) ( not ( = ?auto_220696 ?auto_220702 ) ) ( not ( = ?auto_220697 ?auto_220698 ) ) ( not ( = ?auto_220697 ?auto_220699 ) ) ( not ( = ?auto_220697 ?auto_220700 ) ) ( not ( = ?auto_220697 ?auto_220701 ) ) ( not ( = ?auto_220697 ?auto_220702 ) ) ( not ( = ?auto_220698 ?auto_220699 ) ) ( not ( = ?auto_220698 ?auto_220700 ) ) ( not ( = ?auto_220698 ?auto_220701 ) ) ( not ( = ?auto_220698 ?auto_220702 ) ) ( not ( = ?auto_220699 ?auto_220700 ) ) ( not ( = ?auto_220699 ?auto_220701 ) ) ( not ( = ?auto_220699 ?auto_220702 ) ) ( not ( = ?auto_220700 ?auto_220701 ) ) ( not ( = ?auto_220700 ?auto_220702 ) ) ( not ( = ?auto_220701 ?auto_220702 ) ) ( ON ?auto_220700 ?auto_220701 ) ( CLEAR ?auto_220698 ) ( ON ?auto_220699 ?auto_220700 ) ( CLEAR ?auto_220699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_220692 ?auto_220693 ?auto_220694 ?auto_220695 ?auto_220696 ?auto_220697 ?auto_220698 ?auto_220699 )
      ( MAKE-10PILE ?auto_220692 ?auto_220693 ?auto_220694 ?auto_220695 ?auto_220696 ?auto_220697 ?auto_220698 ?auto_220699 ?auto_220700 ?auto_220701 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_220713 - BLOCK
      ?auto_220714 - BLOCK
      ?auto_220715 - BLOCK
      ?auto_220716 - BLOCK
      ?auto_220717 - BLOCK
      ?auto_220718 - BLOCK
      ?auto_220719 - BLOCK
      ?auto_220720 - BLOCK
      ?auto_220721 - BLOCK
      ?auto_220722 - BLOCK
    )
    :vars
    (
      ?auto_220723 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220722 ?auto_220723 ) ( ON-TABLE ?auto_220713 ) ( ON ?auto_220714 ?auto_220713 ) ( ON ?auto_220715 ?auto_220714 ) ( ON ?auto_220716 ?auto_220715 ) ( ON ?auto_220717 ?auto_220716 ) ( ON ?auto_220718 ?auto_220717 ) ( ON ?auto_220719 ?auto_220718 ) ( not ( = ?auto_220713 ?auto_220714 ) ) ( not ( = ?auto_220713 ?auto_220715 ) ) ( not ( = ?auto_220713 ?auto_220716 ) ) ( not ( = ?auto_220713 ?auto_220717 ) ) ( not ( = ?auto_220713 ?auto_220718 ) ) ( not ( = ?auto_220713 ?auto_220719 ) ) ( not ( = ?auto_220713 ?auto_220720 ) ) ( not ( = ?auto_220713 ?auto_220721 ) ) ( not ( = ?auto_220713 ?auto_220722 ) ) ( not ( = ?auto_220713 ?auto_220723 ) ) ( not ( = ?auto_220714 ?auto_220715 ) ) ( not ( = ?auto_220714 ?auto_220716 ) ) ( not ( = ?auto_220714 ?auto_220717 ) ) ( not ( = ?auto_220714 ?auto_220718 ) ) ( not ( = ?auto_220714 ?auto_220719 ) ) ( not ( = ?auto_220714 ?auto_220720 ) ) ( not ( = ?auto_220714 ?auto_220721 ) ) ( not ( = ?auto_220714 ?auto_220722 ) ) ( not ( = ?auto_220714 ?auto_220723 ) ) ( not ( = ?auto_220715 ?auto_220716 ) ) ( not ( = ?auto_220715 ?auto_220717 ) ) ( not ( = ?auto_220715 ?auto_220718 ) ) ( not ( = ?auto_220715 ?auto_220719 ) ) ( not ( = ?auto_220715 ?auto_220720 ) ) ( not ( = ?auto_220715 ?auto_220721 ) ) ( not ( = ?auto_220715 ?auto_220722 ) ) ( not ( = ?auto_220715 ?auto_220723 ) ) ( not ( = ?auto_220716 ?auto_220717 ) ) ( not ( = ?auto_220716 ?auto_220718 ) ) ( not ( = ?auto_220716 ?auto_220719 ) ) ( not ( = ?auto_220716 ?auto_220720 ) ) ( not ( = ?auto_220716 ?auto_220721 ) ) ( not ( = ?auto_220716 ?auto_220722 ) ) ( not ( = ?auto_220716 ?auto_220723 ) ) ( not ( = ?auto_220717 ?auto_220718 ) ) ( not ( = ?auto_220717 ?auto_220719 ) ) ( not ( = ?auto_220717 ?auto_220720 ) ) ( not ( = ?auto_220717 ?auto_220721 ) ) ( not ( = ?auto_220717 ?auto_220722 ) ) ( not ( = ?auto_220717 ?auto_220723 ) ) ( not ( = ?auto_220718 ?auto_220719 ) ) ( not ( = ?auto_220718 ?auto_220720 ) ) ( not ( = ?auto_220718 ?auto_220721 ) ) ( not ( = ?auto_220718 ?auto_220722 ) ) ( not ( = ?auto_220718 ?auto_220723 ) ) ( not ( = ?auto_220719 ?auto_220720 ) ) ( not ( = ?auto_220719 ?auto_220721 ) ) ( not ( = ?auto_220719 ?auto_220722 ) ) ( not ( = ?auto_220719 ?auto_220723 ) ) ( not ( = ?auto_220720 ?auto_220721 ) ) ( not ( = ?auto_220720 ?auto_220722 ) ) ( not ( = ?auto_220720 ?auto_220723 ) ) ( not ( = ?auto_220721 ?auto_220722 ) ) ( not ( = ?auto_220721 ?auto_220723 ) ) ( not ( = ?auto_220722 ?auto_220723 ) ) ( ON ?auto_220721 ?auto_220722 ) ( CLEAR ?auto_220719 ) ( ON ?auto_220720 ?auto_220721 ) ( CLEAR ?auto_220720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_220713 ?auto_220714 ?auto_220715 ?auto_220716 ?auto_220717 ?auto_220718 ?auto_220719 ?auto_220720 )
      ( MAKE-10PILE ?auto_220713 ?auto_220714 ?auto_220715 ?auto_220716 ?auto_220717 ?auto_220718 ?auto_220719 ?auto_220720 ?auto_220721 ?auto_220722 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_220734 - BLOCK
      ?auto_220735 - BLOCK
      ?auto_220736 - BLOCK
      ?auto_220737 - BLOCK
      ?auto_220738 - BLOCK
      ?auto_220739 - BLOCK
      ?auto_220740 - BLOCK
      ?auto_220741 - BLOCK
      ?auto_220742 - BLOCK
      ?auto_220743 - BLOCK
    )
    :vars
    (
      ?auto_220744 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220743 ?auto_220744 ) ( ON-TABLE ?auto_220734 ) ( ON ?auto_220735 ?auto_220734 ) ( ON ?auto_220736 ?auto_220735 ) ( ON ?auto_220737 ?auto_220736 ) ( ON ?auto_220738 ?auto_220737 ) ( ON ?auto_220739 ?auto_220738 ) ( not ( = ?auto_220734 ?auto_220735 ) ) ( not ( = ?auto_220734 ?auto_220736 ) ) ( not ( = ?auto_220734 ?auto_220737 ) ) ( not ( = ?auto_220734 ?auto_220738 ) ) ( not ( = ?auto_220734 ?auto_220739 ) ) ( not ( = ?auto_220734 ?auto_220740 ) ) ( not ( = ?auto_220734 ?auto_220741 ) ) ( not ( = ?auto_220734 ?auto_220742 ) ) ( not ( = ?auto_220734 ?auto_220743 ) ) ( not ( = ?auto_220734 ?auto_220744 ) ) ( not ( = ?auto_220735 ?auto_220736 ) ) ( not ( = ?auto_220735 ?auto_220737 ) ) ( not ( = ?auto_220735 ?auto_220738 ) ) ( not ( = ?auto_220735 ?auto_220739 ) ) ( not ( = ?auto_220735 ?auto_220740 ) ) ( not ( = ?auto_220735 ?auto_220741 ) ) ( not ( = ?auto_220735 ?auto_220742 ) ) ( not ( = ?auto_220735 ?auto_220743 ) ) ( not ( = ?auto_220735 ?auto_220744 ) ) ( not ( = ?auto_220736 ?auto_220737 ) ) ( not ( = ?auto_220736 ?auto_220738 ) ) ( not ( = ?auto_220736 ?auto_220739 ) ) ( not ( = ?auto_220736 ?auto_220740 ) ) ( not ( = ?auto_220736 ?auto_220741 ) ) ( not ( = ?auto_220736 ?auto_220742 ) ) ( not ( = ?auto_220736 ?auto_220743 ) ) ( not ( = ?auto_220736 ?auto_220744 ) ) ( not ( = ?auto_220737 ?auto_220738 ) ) ( not ( = ?auto_220737 ?auto_220739 ) ) ( not ( = ?auto_220737 ?auto_220740 ) ) ( not ( = ?auto_220737 ?auto_220741 ) ) ( not ( = ?auto_220737 ?auto_220742 ) ) ( not ( = ?auto_220737 ?auto_220743 ) ) ( not ( = ?auto_220737 ?auto_220744 ) ) ( not ( = ?auto_220738 ?auto_220739 ) ) ( not ( = ?auto_220738 ?auto_220740 ) ) ( not ( = ?auto_220738 ?auto_220741 ) ) ( not ( = ?auto_220738 ?auto_220742 ) ) ( not ( = ?auto_220738 ?auto_220743 ) ) ( not ( = ?auto_220738 ?auto_220744 ) ) ( not ( = ?auto_220739 ?auto_220740 ) ) ( not ( = ?auto_220739 ?auto_220741 ) ) ( not ( = ?auto_220739 ?auto_220742 ) ) ( not ( = ?auto_220739 ?auto_220743 ) ) ( not ( = ?auto_220739 ?auto_220744 ) ) ( not ( = ?auto_220740 ?auto_220741 ) ) ( not ( = ?auto_220740 ?auto_220742 ) ) ( not ( = ?auto_220740 ?auto_220743 ) ) ( not ( = ?auto_220740 ?auto_220744 ) ) ( not ( = ?auto_220741 ?auto_220742 ) ) ( not ( = ?auto_220741 ?auto_220743 ) ) ( not ( = ?auto_220741 ?auto_220744 ) ) ( not ( = ?auto_220742 ?auto_220743 ) ) ( not ( = ?auto_220742 ?auto_220744 ) ) ( not ( = ?auto_220743 ?auto_220744 ) ) ( ON ?auto_220742 ?auto_220743 ) ( ON ?auto_220741 ?auto_220742 ) ( CLEAR ?auto_220739 ) ( ON ?auto_220740 ?auto_220741 ) ( CLEAR ?auto_220740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_220734 ?auto_220735 ?auto_220736 ?auto_220737 ?auto_220738 ?auto_220739 ?auto_220740 )
      ( MAKE-10PILE ?auto_220734 ?auto_220735 ?auto_220736 ?auto_220737 ?auto_220738 ?auto_220739 ?auto_220740 ?auto_220741 ?auto_220742 ?auto_220743 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_220755 - BLOCK
      ?auto_220756 - BLOCK
      ?auto_220757 - BLOCK
      ?auto_220758 - BLOCK
      ?auto_220759 - BLOCK
      ?auto_220760 - BLOCK
      ?auto_220761 - BLOCK
      ?auto_220762 - BLOCK
      ?auto_220763 - BLOCK
      ?auto_220764 - BLOCK
    )
    :vars
    (
      ?auto_220765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220764 ?auto_220765 ) ( ON-TABLE ?auto_220755 ) ( ON ?auto_220756 ?auto_220755 ) ( ON ?auto_220757 ?auto_220756 ) ( ON ?auto_220758 ?auto_220757 ) ( ON ?auto_220759 ?auto_220758 ) ( ON ?auto_220760 ?auto_220759 ) ( not ( = ?auto_220755 ?auto_220756 ) ) ( not ( = ?auto_220755 ?auto_220757 ) ) ( not ( = ?auto_220755 ?auto_220758 ) ) ( not ( = ?auto_220755 ?auto_220759 ) ) ( not ( = ?auto_220755 ?auto_220760 ) ) ( not ( = ?auto_220755 ?auto_220761 ) ) ( not ( = ?auto_220755 ?auto_220762 ) ) ( not ( = ?auto_220755 ?auto_220763 ) ) ( not ( = ?auto_220755 ?auto_220764 ) ) ( not ( = ?auto_220755 ?auto_220765 ) ) ( not ( = ?auto_220756 ?auto_220757 ) ) ( not ( = ?auto_220756 ?auto_220758 ) ) ( not ( = ?auto_220756 ?auto_220759 ) ) ( not ( = ?auto_220756 ?auto_220760 ) ) ( not ( = ?auto_220756 ?auto_220761 ) ) ( not ( = ?auto_220756 ?auto_220762 ) ) ( not ( = ?auto_220756 ?auto_220763 ) ) ( not ( = ?auto_220756 ?auto_220764 ) ) ( not ( = ?auto_220756 ?auto_220765 ) ) ( not ( = ?auto_220757 ?auto_220758 ) ) ( not ( = ?auto_220757 ?auto_220759 ) ) ( not ( = ?auto_220757 ?auto_220760 ) ) ( not ( = ?auto_220757 ?auto_220761 ) ) ( not ( = ?auto_220757 ?auto_220762 ) ) ( not ( = ?auto_220757 ?auto_220763 ) ) ( not ( = ?auto_220757 ?auto_220764 ) ) ( not ( = ?auto_220757 ?auto_220765 ) ) ( not ( = ?auto_220758 ?auto_220759 ) ) ( not ( = ?auto_220758 ?auto_220760 ) ) ( not ( = ?auto_220758 ?auto_220761 ) ) ( not ( = ?auto_220758 ?auto_220762 ) ) ( not ( = ?auto_220758 ?auto_220763 ) ) ( not ( = ?auto_220758 ?auto_220764 ) ) ( not ( = ?auto_220758 ?auto_220765 ) ) ( not ( = ?auto_220759 ?auto_220760 ) ) ( not ( = ?auto_220759 ?auto_220761 ) ) ( not ( = ?auto_220759 ?auto_220762 ) ) ( not ( = ?auto_220759 ?auto_220763 ) ) ( not ( = ?auto_220759 ?auto_220764 ) ) ( not ( = ?auto_220759 ?auto_220765 ) ) ( not ( = ?auto_220760 ?auto_220761 ) ) ( not ( = ?auto_220760 ?auto_220762 ) ) ( not ( = ?auto_220760 ?auto_220763 ) ) ( not ( = ?auto_220760 ?auto_220764 ) ) ( not ( = ?auto_220760 ?auto_220765 ) ) ( not ( = ?auto_220761 ?auto_220762 ) ) ( not ( = ?auto_220761 ?auto_220763 ) ) ( not ( = ?auto_220761 ?auto_220764 ) ) ( not ( = ?auto_220761 ?auto_220765 ) ) ( not ( = ?auto_220762 ?auto_220763 ) ) ( not ( = ?auto_220762 ?auto_220764 ) ) ( not ( = ?auto_220762 ?auto_220765 ) ) ( not ( = ?auto_220763 ?auto_220764 ) ) ( not ( = ?auto_220763 ?auto_220765 ) ) ( not ( = ?auto_220764 ?auto_220765 ) ) ( ON ?auto_220763 ?auto_220764 ) ( ON ?auto_220762 ?auto_220763 ) ( CLEAR ?auto_220760 ) ( ON ?auto_220761 ?auto_220762 ) ( CLEAR ?auto_220761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_220755 ?auto_220756 ?auto_220757 ?auto_220758 ?auto_220759 ?auto_220760 ?auto_220761 )
      ( MAKE-10PILE ?auto_220755 ?auto_220756 ?auto_220757 ?auto_220758 ?auto_220759 ?auto_220760 ?auto_220761 ?auto_220762 ?auto_220763 ?auto_220764 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_220776 - BLOCK
      ?auto_220777 - BLOCK
      ?auto_220778 - BLOCK
      ?auto_220779 - BLOCK
      ?auto_220780 - BLOCK
      ?auto_220781 - BLOCK
      ?auto_220782 - BLOCK
      ?auto_220783 - BLOCK
      ?auto_220784 - BLOCK
      ?auto_220785 - BLOCK
    )
    :vars
    (
      ?auto_220786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220785 ?auto_220786 ) ( ON-TABLE ?auto_220776 ) ( ON ?auto_220777 ?auto_220776 ) ( ON ?auto_220778 ?auto_220777 ) ( ON ?auto_220779 ?auto_220778 ) ( ON ?auto_220780 ?auto_220779 ) ( not ( = ?auto_220776 ?auto_220777 ) ) ( not ( = ?auto_220776 ?auto_220778 ) ) ( not ( = ?auto_220776 ?auto_220779 ) ) ( not ( = ?auto_220776 ?auto_220780 ) ) ( not ( = ?auto_220776 ?auto_220781 ) ) ( not ( = ?auto_220776 ?auto_220782 ) ) ( not ( = ?auto_220776 ?auto_220783 ) ) ( not ( = ?auto_220776 ?auto_220784 ) ) ( not ( = ?auto_220776 ?auto_220785 ) ) ( not ( = ?auto_220776 ?auto_220786 ) ) ( not ( = ?auto_220777 ?auto_220778 ) ) ( not ( = ?auto_220777 ?auto_220779 ) ) ( not ( = ?auto_220777 ?auto_220780 ) ) ( not ( = ?auto_220777 ?auto_220781 ) ) ( not ( = ?auto_220777 ?auto_220782 ) ) ( not ( = ?auto_220777 ?auto_220783 ) ) ( not ( = ?auto_220777 ?auto_220784 ) ) ( not ( = ?auto_220777 ?auto_220785 ) ) ( not ( = ?auto_220777 ?auto_220786 ) ) ( not ( = ?auto_220778 ?auto_220779 ) ) ( not ( = ?auto_220778 ?auto_220780 ) ) ( not ( = ?auto_220778 ?auto_220781 ) ) ( not ( = ?auto_220778 ?auto_220782 ) ) ( not ( = ?auto_220778 ?auto_220783 ) ) ( not ( = ?auto_220778 ?auto_220784 ) ) ( not ( = ?auto_220778 ?auto_220785 ) ) ( not ( = ?auto_220778 ?auto_220786 ) ) ( not ( = ?auto_220779 ?auto_220780 ) ) ( not ( = ?auto_220779 ?auto_220781 ) ) ( not ( = ?auto_220779 ?auto_220782 ) ) ( not ( = ?auto_220779 ?auto_220783 ) ) ( not ( = ?auto_220779 ?auto_220784 ) ) ( not ( = ?auto_220779 ?auto_220785 ) ) ( not ( = ?auto_220779 ?auto_220786 ) ) ( not ( = ?auto_220780 ?auto_220781 ) ) ( not ( = ?auto_220780 ?auto_220782 ) ) ( not ( = ?auto_220780 ?auto_220783 ) ) ( not ( = ?auto_220780 ?auto_220784 ) ) ( not ( = ?auto_220780 ?auto_220785 ) ) ( not ( = ?auto_220780 ?auto_220786 ) ) ( not ( = ?auto_220781 ?auto_220782 ) ) ( not ( = ?auto_220781 ?auto_220783 ) ) ( not ( = ?auto_220781 ?auto_220784 ) ) ( not ( = ?auto_220781 ?auto_220785 ) ) ( not ( = ?auto_220781 ?auto_220786 ) ) ( not ( = ?auto_220782 ?auto_220783 ) ) ( not ( = ?auto_220782 ?auto_220784 ) ) ( not ( = ?auto_220782 ?auto_220785 ) ) ( not ( = ?auto_220782 ?auto_220786 ) ) ( not ( = ?auto_220783 ?auto_220784 ) ) ( not ( = ?auto_220783 ?auto_220785 ) ) ( not ( = ?auto_220783 ?auto_220786 ) ) ( not ( = ?auto_220784 ?auto_220785 ) ) ( not ( = ?auto_220784 ?auto_220786 ) ) ( not ( = ?auto_220785 ?auto_220786 ) ) ( ON ?auto_220784 ?auto_220785 ) ( ON ?auto_220783 ?auto_220784 ) ( ON ?auto_220782 ?auto_220783 ) ( CLEAR ?auto_220780 ) ( ON ?auto_220781 ?auto_220782 ) ( CLEAR ?auto_220781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_220776 ?auto_220777 ?auto_220778 ?auto_220779 ?auto_220780 ?auto_220781 )
      ( MAKE-10PILE ?auto_220776 ?auto_220777 ?auto_220778 ?auto_220779 ?auto_220780 ?auto_220781 ?auto_220782 ?auto_220783 ?auto_220784 ?auto_220785 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_220797 - BLOCK
      ?auto_220798 - BLOCK
      ?auto_220799 - BLOCK
      ?auto_220800 - BLOCK
      ?auto_220801 - BLOCK
      ?auto_220802 - BLOCK
      ?auto_220803 - BLOCK
      ?auto_220804 - BLOCK
      ?auto_220805 - BLOCK
      ?auto_220806 - BLOCK
    )
    :vars
    (
      ?auto_220807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220806 ?auto_220807 ) ( ON-TABLE ?auto_220797 ) ( ON ?auto_220798 ?auto_220797 ) ( ON ?auto_220799 ?auto_220798 ) ( ON ?auto_220800 ?auto_220799 ) ( ON ?auto_220801 ?auto_220800 ) ( not ( = ?auto_220797 ?auto_220798 ) ) ( not ( = ?auto_220797 ?auto_220799 ) ) ( not ( = ?auto_220797 ?auto_220800 ) ) ( not ( = ?auto_220797 ?auto_220801 ) ) ( not ( = ?auto_220797 ?auto_220802 ) ) ( not ( = ?auto_220797 ?auto_220803 ) ) ( not ( = ?auto_220797 ?auto_220804 ) ) ( not ( = ?auto_220797 ?auto_220805 ) ) ( not ( = ?auto_220797 ?auto_220806 ) ) ( not ( = ?auto_220797 ?auto_220807 ) ) ( not ( = ?auto_220798 ?auto_220799 ) ) ( not ( = ?auto_220798 ?auto_220800 ) ) ( not ( = ?auto_220798 ?auto_220801 ) ) ( not ( = ?auto_220798 ?auto_220802 ) ) ( not ( = ?auto_220798 ?auto_220803 ) ) ( not ( = ?auto_220798 ?auto_220804 ) ) ( not ( = ?auto_220798 ?auto_220805 ) ) ( not ( = ?auto_220798 ?auto_220806 ) ) ( not ( = ?auto_220798 ?auto_220807 ) ) ( not ( = ?auto_220799 ?auto_220800 ) ) ( not ( = ?auto_220799 ?auto_220801 ) ) ( not ( = ?auto_220799 ?auto_220802 ) ) ( not ( = ?auto_220799 ?auto_220803 ) ) ( not ( = ?auto_220799 ?auto_220804 ) ) ( not ( = ?auto_220799 ?auto_220805 ) ) ( not ( = ?auto_220799 ?auto_220806 ) ) ( not ( = ?auto_220799 ?auto_220807 ) ) ( not ( = ?auto_220800 ?auto_220801 ) ) ( not ( = ?auto_220800 ?auto_220802 ) ) ( not ( = ?auto_220800 ?auto_220803 ) ) ( not ( = ?auto_220800 ?auto_220804 ) ) ( not ( = ?auto_220800 ?auto_220805 ) ) ( not ( = ?auto_220800 ?auto_220806 ) ) ( not ( = ?auto_220800 ?auto_220807 ) ) ( not ( = ?auto_220801 ?auto_220802 ) ) ( not ( = ?auto_220801 ?auto_220803 ) ) ( not ( = ?auto_220801 ?auto_220804 ) ) ( not ( = ?auto_220801 ?auto_220805 ) ) ( not ( = ?auto_220801 ?auto_220806 ) ) ( not ( = ?auto_220801 ?auto_220807 ) ) ( not ( = ?auto_220802 ?auto_220803 ) ) ( not ( = ?auto_220802 ?auto_220804 ) ) ( not ( = ?auto_220802 ?auto_220805 ) ) ( not ( = ?auto_220802 ?auto_220806 ) ) ( not ( = ?auto_220802 ?auto_220807 ) ) ( not ( = ?auto_220803 ?auto_220804 ) ) ( not ( = ?auto_220803 ?auto_220805 ) ) ( not ( = ?auto_220803 ?auto_220806 ) ) ( not ( = ?auto_220803 ?auto_220807 ) ) ( not ( = ?auto_220804 ?auto_220805 ) ) ( not ( = ?auto_220804 ?auto_220806 ) ) ( not ( = ?auto_220804 ?auto_220807 ) ) ( not ( = ?auto_220805 ?auto_220806 ) ) ( not ( = ?auto_220805 ?auto_220807 ) ) ( not ( = ?auto_220806 ?auto_220807 ) ) ( ON ?auto_220805 ?auto_220806 ) ( ON ?auto_220804 ?auto_220805 ) ( ON ?auto_220803 ?auto_220804 ) ( CLEAR ?auto_220801 ) ( ON ?auto_220802 ?auto_220803 ) ( CLEAR ?auto_220802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_220797 ?auto_220798 ?auto_220799 ?auto_220800 ?auto_220801 ?auto_220802 )
      ( MAKE-10PILE ?auto_220797 ?auto_220798 ?auto_220799 ?auto_220800 ?auto_220801 ?auto_220802 ?auto_220803 ?auto_220804 ?auto_220805 ?auto_220806 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_220818 - BLOCK
      ?auto_220819 - BLOCK
      ?auto_220820 - BLOCK
      ?auto_220821 - BLOCK
      ?auto_220822 - BLOCK
      ?auto_220823 - BLOCK
      ?auto_220824 - BLOCK
      ?auto_220825 - BLOCK
      ?auto_220826 - BLOCK
      ?auto_220827 - BLOCK
    )
    :vars
    (
      ?auto_220828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220827 ?auto_220828 ) ( ON-TABLE ?auto_220818 ) ( ON ?auto_220819 ?auto_220818 ) ( ON ?auto_220820 ?auto_220819 ) ( ON ?auto_220821 ?auto_220820 ) ( not ( = ?auto_220818 ?auto_220819 ) ) ( not ( = ?auto_220818 ?auto_220820 ) ) ( not ( = ?auto_220818 ?auto_220821 ) ) ( not ( = ?auto_220818 ?auto_220822 ) ) ( not ( = ?auto_220818 ?auto_220823 ) ) ( not ( = ?auto_220818 ?auto_220824 ) ) ( not ( = ?auto_220818 ?auto_220825 ) ) ( not ( = ?auto_220818 ?auto_220826 ) ) ( not ( = ?auto_220818 ?auto_220827 ) ) ( not ( = ?auto_220818 ?auto_220828 ) ) ( not ( = ?auto_220819 ?auto_220820 ) ) ( not ( = ?auto_220819 ?auto_220821 ) ) ( not ( = ?auto_220819 ?auto_220822 ) ) ( not ( = ?auto_220819 ?auto_220823 ) ) ( not ( = ?auto_220819 ?auto_220824 ) ) ( not ( = ?auto_220819 ?auto_220825 ) ) ( not ( = ?auto_220819 ?auto_220826 ) ) ( not ( = ?auto_220819 ?auto_220827 ) ) ( not ( = ?auto_220819 ?auto_220828 ) ) ( not ( = ?auto_220820 ?auto_220821 ) ) ( not ( = ?auto_220820 ?auto_220822 ) ) ( not ( = ?auto_220820 ?auto_220823 ) ) ( not ( = ?auto_220820 ?auto_220824 ) ) ( not ( = ?auto_220820 ?auto_220825 ) ) ( not ( = ?auto_220820 ?auto_220826 ) ) ( not ( = ?auto_220820 ?auto_220827 ) ) ( not ( = ?auto_220820 ?auto_220828 ) ) ( not ( = ?auto_220821 ?auto_220822 ) ) ( not ( = ?auto_220821 ?auto_220823 ) ) ( not ( = ?auto_220821 ?auto_220824 ) ) ( not ( = ?auto_220821 ?auto_220825 ) ) ( not ( = ?auto_220821 ?auto_220826 ) ) ( not ( = ?auto_220821 ?auto_220827 ) ) ( not ( = ?auto_220821 ?auto_220828 ) ) ( not ( = ?auto_220822 ?auto_220823 ) ) ( not ( = ?auto_220822 ?auto_220824 ) ) ( not ( = ?auto_220822 ?auto_220825 ) ) ( not ( = ?auto_220822 ?auto_220826 ) ) ( not ( = ?auto_220822 ?auto_220827 ) ) ( not ( = ?auto_220822 ?auto_220828 ) ) ( not ( = ?auto_220823 ?auto_220824 ) ) ( not ( = ?auto_220823 ?auto_220825 ) ) ( not ( = ?auto_220823 ?auto_220826 ) ) ( not ( = ?auto_220823 ?auto_220827 ) ) ( not ( = ?auto_220823 ?auto_220828 ) ) ( not ( = ?auto_220824 ?auto_220825 ) ) ( not ( = ?auto_220824 ?auto_220826 ) ) ( not ( = ?auto_220824 ?auto_220827 ) ) ( not ( = ?auto_220824 ?auto_220828 ) ) ( not ( = ?auto_220825 ?auto_220826 ) ) ( not ( = ?auto_220825 ?auto_220827 ) ) ( not ( = ?auto_220825 ?auto_220828 ) ) ( not ( = ?auto_220826 ?auto_220827 ) ) ( not ( = ?auto_220826 ?auto_220828 ) ) ( not ( = ?auto_220827 ?auto_220828 ) ) ( ON ?auto_220826 ?auto_220827 ) ( ON ?auto_220825 ?auto_220826 ) ( ON ?auto_220824 ?auto_220825 ) ( ON ?auto_220823 ?auto_220824 ) ( CLEAR ?auto_220821 ) ( ON ?auto_220822 ?auto_220823 ) ( CLEAR ?auto_220822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_220818 ?auto_220819 ?auto_220820 ?auto_220821 ?auto_220822 )
      ( MAKE-10PILE ?auto_220818 ?auto_220819 ?auto_220820 ?auto_220821 ?auto_220822 ?auto_220823 ?auto_220824 ?auto_220825 ?auto_220826 ?auto_220827 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_220839 - BLOCK
      ?auto_220840 - BLOCK
      ?auto_220841 - BLOCK
      ?auto_220842 - BLOCK
      ?auto_220843 - BLOCK
      ?auto_220844 - BLOCK
      ?auto_220845 - BLOCK
      ?auto_220846 - BLOCK
      ?auto_220847 - BLOCK
      ?auto_220848 - BLOCK
    )
    :vars
    (
      ?auto_220849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220848 ?auto_220849 ) ( ON-TABLE ?auto_220839 ) ( ON ?auto_220840 ?auto_220839 ) ( ON ?auto_220841 ?auto_220840 ) ( ON ?auto_220842 ?auto_220841 ) ( not ( = ?auto_220839 ?auto_220840 ) ) ( not ( = ?auto_220839 ?auto_220841 ) ) ( not ( = ?auto_220839 ?auto_220842 ) ) ( not ( = ?auto_220839 ?auto_220843 ) ) ( not ( = ?auto_220839 ?auto_220844 ) ) ( not ( = ?auto_220839 ?auto_220845 ) ) ( not ( = ?auto_220839 ?auto_220846 ) ) ( not ( = ?auto_220839 ?auto_220847 ) ) ( not ( = ?auto_220839 ?auto_220848 ) ) ( not ( = ?auto_220839 ?auto_220849 ) ) ( not ( = ?auto_220840 ?auto_220841 ) ) ( not ( = ?auto_220840 ?auto_220842 ) ) ( not ( = ?auto_220840 ?auto_220843 ) ) ( not ( = ?auto_220840 ?auto_220844 ) ) ( not ( = ?auto_220840 ?auto_220845 ) ) ( not ( = ?auto_220840 ?auto_220846 ) ) ( not ( = ?auto_220840 ?auto_220847 ) ) ( not ( = ?auto_220840 ?auto_220848 ) ) ( not ( = ?auto_220840 ?auto_220849 ) ) ( not ( = ?auto_220841 ?auto_220842 ) ) ( not ( = ?auto_220841 ?auto_220843 ) ) ( not ( = ?auto_220841 ?auto_220844 ) ) ( not ( = ?auto_220841 ?auto_220845 ) ) ( not ( = ?auto_220841 ?auto_220846 ) ) ( not ( = ?auto_220841 ?auto_220847 ) ) ( not ( = ?auto_220841 ?auto_220848 ) ) ( not ( = ?auto_220841 ?auto_220849 ) ) ( not ( = ?auto_220842 ?auto_220843 ) ) ( not ( = ?auto_220842 ?auto_220844 ) ) ( not ( = ?auto_220842 ?auto_220845 ) ) ( not ( = ?auto_220842 ?auto_220846 ) ) ( not ( = ?auto_220842 ?auto_220847 ) ) ( not ( = ?auto_220842 ?auto_220848 ) ) ( not ( = ?auto_220842 ?auto_220849 ) ) ( not ( = ?auto_220843 ?auto_220844 ) ) ( not ( = ?auto_220843 ?auto_220845 ) ) ( not ( = ?auto_220843 ?auto_220846 ) ) ( not ( = ?auto_220843 ?auto_220847 ) ) ( not ( = ?auto_220843 ?auto_220848 ) ) ( not ( = ?auto_220843 ?auto_220849 ) ) ( not ( = ?auto_220844 ?auto_220845 ) ) ( not ( = ?auto_220844 ?auto_220846 ) ) ( not ( = ?auto_220844 ?auto_220847 ) ) ( not ( = ?auto_220844 ?auto_220848 ) ) ( not ( = ?auto_220844 ?auto_220849 ) ) ( not ( = ?auto_220845 ?auto_220846 ) ) ( not ( = ?auto_220845 ?auto_220847 ) ) ( not ( = ?auto_220845 ?auto_220848 ) ) ( not ( = ?auto_220845 ?auto_220849 ) ) ( not ( = ?auto_220846 ?auto_220847 ) ) ( not ( = ?auto_220846 ?auto_220848 ) ) ( not ( = ?auto_220846 ?auto_220849 ) ) ( not ( = ?auto_220847 ?auto_220848 ) ) ( not ( = ?auto_220847 ?auto_220849 ) ) ( not ( = ?auto_220848 ?auto_220849 ) ) ( ON ?auto_220847 ?auto_220848 ) ( ON ?auto_220846 ?auto_220847 ) ( ON ?auto_220845 ?auto_220846 ) ( ON ?auto_220844 ?auto_220845 ) ( CLEAR ?auto_220842 ) ( ON ?auto_220843 ?auto_220844 ) ( CLEAR ?auto_220843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_220839 ?auto_220840 ?auto_220841 ?auto_220842 ?auto_220843 )
      ( MAKE-10PILE ?auto_220839 ?auto_220840 ?auto_220841 ?auto_220842 ?auto_220843 ?auto_220844 ?auto_220845 ?auto_220846 ?auto_220847 ?auto_220848 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_220860 - BLOCK
      ?auto_220861 - BLOCK
      ?auto_220862 - BLOCK
      ?auto_220863 - BLOCK
      ?auto_220864 - BLOCK
      ?auto_220865 - BLOCK
      ?auto_220866 - BLOCK
      ?auto_220867 - BLOCK
      ?auto_220868 - BLOCK
      ?auto_220869 - BLOCK
    )
    :vars
    (
      ?auto_220870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220869 ?auto_220870 ) ( ON-TABLE ?auto_220860 ) ( ON ?auto_220861 ?auto_220860 ) ( ON ?auto_220862 ?auto_220861 ) ( not ( = ?auto_220860 ?auto_220861 ) ) ( not ( = ?auto_220860 ?auto_220862 ) ) ( not ( = ?auto_220860 ?auto_220863 ) ) ( not ( = ?auto_220860 ?auto_220864 ) ) ( not ( = ?auto_220860 ?auto_220865 ) ) ( not ( = ?auto_220860 ?auto_220866 ) ) ( not ( = ?auto_220860 ?auto_220867 ) ) ( not ( = ?auto_220860 ?auto_220868 ) ) ( not ( = ?auto_220860 ?auto_220869 ) ) ( not ( = ?auto_220860 ?auto_220870 ) ) ( not ( = ?auto_220861 ?auto_220862 ) ) ( not ( = ?auto_220861 ?auto_220863 ) ) ( not ( = ?auto_220861 ?auto_220864 ) ) ( not ( = ?auto_220861 ?auto_220865 ) ) ( not ( = ?auto_220861 ?auto_220866 ) ) ( not ( = ?auto_220861 ?auto_220867 ) ) ( not ( = ?auto_220861 ?auto_220868 ) ) ( not ( = ?auto_220861 ?auto_220869 ) ) ( not ( = ?auto_220861 ?auto_220870 ) ) ( not ( = ?auto_220862 ?auto_220863 ) ) ( not ( = ?auto_220862 ?auto_220864 ) ) ( not ( = ?auto_220862 ?auto_220865 ) ) ( not ( = ?auto_220862 ?auto_220866 ) ) ( not ( = ?auto_220862 ?auto_220867 ) ) ( not ( = ?auto_220862 ?auto_220868 ) ) ( not ( = ?auto_220862 ?auto_220869 ) ) ( not ( = ?auto_220862 ?auto_220870 ) ) ( not ( = ?auto_220863 ?auto_220864 ) ) ( not ( = ?auto_220863 ?auto_220865 ) ) ( not ( = ?auto_220863 ?auto_220866 ) ) ( not ( = ?auto_220863 ?auto_220867 ) ) ( not ( = ?auto_220863 ?auto_220868 ) ) ( not ( = ?auto_220863 ?auto_220869 ) ) ( not ( = ?auto_220863 ?auto_220870 ) ) ( not ( = ?auto_220864 ?auto_220865 ) ) ( not ( = ?auto_220864 ?auto_220866 ) ) ( not ( = ?auto_220864 ?auto_220867 ) ) ( not ( = ?auto_220864 ?auto_220868 ) ) ( not ( = ?auto_220864 ?auto_220869 ) ) ( not ( = ?auto_220864 ?auto_220870 ) ) ( not ( = ?auto_220865 ?auto_220866 ) ) ( not ( = ?auto_220865 ?auto_220867 ) ) ( not ( = ?auto_220865 ?auto_220868 ) ) ( not ( = ?auto_220865 ?auto_220869 ) ) ( not ( = ?auto_220865 ?auto_220870 ) ) ( not ( = ?auto_220866 ?auto_220867 ) ) ( not ( = ?auto_220866 ?auto_220868 ) ) ( not ( = ?auto_220866 ?auto_220869 ) ) ( not ( = ?auto_220866 ?auto_220870 ) ) ( not ( = ?auto_220867 ?auto_220868 ) ) ( not ( = ?auto_220867 ?auto_220869 ) ) ( not ( = ?auto_220867 ?auto_220870 ) ) ( not ( = ?auto_220868 ?auto_220869 ) ) ( not ( = ?auto_220868 ?auto_220870 ) ) ( not ( = ?auto_220869 ?auto_220870 ) ) ( ON ?auto_220868 ?auto_220869 ) ( ON ?auto_220867 ?auto_220868 ) ( ON ?auto_220866 ?auto_220867 ) ( ON ?auto_220865 ?auto_220866 ) ( ON ?auto_220864 ?auto_220865 ) ( CLEAR ?auto_220862 ) ( ON ?auto_220863 ?auto_220864 ) ( CLEAR ?auto_220863 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_220860 ?auto_220861 ?auto_220862 ?auto_220863 )
      ( MAKE-10PILE ?auto_220860 ?auto_220861 ?auto_220862 ?auto_220863 ?auto_220864 ?auto_220865 ?auto_220866 ?auto_220867 ?auto_220868 ?auto_220869 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_220881 - BLOCK
      ?auto_220882 - BLOCK
      ?auto_220883 - BLOCK
      ?auto_220884 - BLOCK
      ?auto_220885 - BLOCK
      ?auto_220886 - BLOCK
      ?auto_220887 - BLOCK
      ?auto_220888 - BLOCK
      ?auto_220889 - BLOCK
      ?auto_220890 - BLOCK
    )
    :vars
    (
      ?auto_220891 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220890 ?auto_220891 ) ( ON-TABLE ?auto_220881 ) ( ON ?auto_220882 ?auto_220881 ) ( ON ?auto_220883 ?auto_220882 ) ( not ( = ?auto_220881 ?auto_220882 ) ) ( not ( = ?auto_220881 ?auto_220883 ) ) ( not ( = ?auto_220881 ?auto_220884 ) ) ( not ( = ?auto_220881 ?auto_220885 ) ) ( not ( = ?auto_220881 ?auto_220886 ) ) ( not ( = ?auto_220881 ?auto_220887 ) ) ( not ( = ?auto_220881 ?auto_220888 ) ) ( not ( = ?auto_220881 ?auto_220889 ) ) ( not ( = ?auto_220881 ?auto_220890 ) ) ( not ( = ?auto_220881 ?auto_220891 ) ) ( not ( = ?auto_220882 ?auto_220883 ) ) ( not ( = ?auto_220882 ?auto_220884 ) ) ( not ( = ?auto_220882 ?auto_220885 ) ) ( not ( = ?auto_220882 ?auto_220886 ) ) ( not ( = ?auto_220882 ?auto_220887 ) ) ( not ( = ?auto_220882 ?auto_220888 ) ) ( not ( = ?auto_220882 ?auto_220889 ) ) ( not ( = ?auto_220882 ?auto_220890 ) ) ( not ( = ?auto_220882 ?auto_220891 ) ) ( not ( = ?auto_220883 ?auto_220884 ) ) ( not ( = ?auto_220883 ?auto_220885 ) ) ( not ( = ?auto_220883 ?auto_220886 ) ) ( not ( = ?auto_220883 ?auto_220887 ) ) ( not ( = ?auto_220883 ?auto_220888 ) ) ( not ( = ?auto_220883 ?auto_220889 ) ) ( not ( = ?auto_220883 ?auto_220890 ) ) ( not ( = ?auto_220883 ?auto_220891 ) ) ( not ( = ?auto_220884 ?auto_220885 ) ) ( not ( = ?auto_220884 ?auto_220886 ) ) ( not ( = ?auto_220884 ?auto_220887 ) ) ( not ( = ?auto_220884 ?auto_220888 ) ) ( not ( = ?auto_220884 ?auto_220889 ) ) ( not ( = ?auto_220884 ?auto_220890 ) ) ( not ( = ?auto_220884 ?auto_220891 ) ) ( not ( = ?auto_220885 ?auto_220886 ) ) ( not ( = ?auto_220885 ?auto_220887 ) ) ( not ( = ?auto_220885 ?auto_220888 ) ) ( not ( = ?auto_220885 ?auto_220889 ) ) ( not ( = ?auto_220885 ?auto_220890 ) ) ( not ( = ?auto_220885 ?auto_220891 ) ) ( not ( = ?auto_220886 ?auto_220887 ) ) ( not ( = ?auto_220886 ?auto_220888 ) ) ( not ( = ?auto_220886 ?auto_220889 ) ) ( not ( = ?auto_220886 ?auto_220890 ) ) ( not ( = ?auto_220886 ?auto_220891 ) ) ( not ( = ?auto_220887 ?auto_220888 ) ) ( not ( = ?auto_220887 ?auto_220889 ) ) ( not ( = ?auto_220887 ?auto_220890 ) ) ( not ( = ?auto_220887 ?auto_220891 ) ) ( not ( = ?auto_220888 ?auto_220889 ) ) ( not ( = ?auto_220888 ?auto_220890 ) ) ( not ( = ?auto_220888 ?auto_220891 ) ) ( not ( = ?auto_220889 ?auto_220890 ) ) ( not ( = ?auto_220889 ?auto_220891 ) ) ( not ( = ?auto_220890 ?auto_220891 ) ) ( ON ?auto_220889 ?auto_220890 ) ( ON ?auto_220888 ?auto_220889 ) ( ON ?auto_220887 ?auto_220888 ) ( ON ?auto_220886 ?auto_220887 ) ( ON ?auto_220885 ?auto_220886 ) ( CLEAR ?auto_220883 ) ( ON ?auto_220884 ?auto_220885 ) ( CLEAR ?auto_220884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_220881 ?auto_220882 ?auto_220883 ?auto_220884 )
      ( MAKE-10PILE ?auto_220881 ?auto_220882 ?auto_220883 ?auto_220884 ?auto_220885 ?auto_220886 ?auto_220887 ?auto_220888 ?auto_220889 ?auto_220890 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_220902 - BLOCK
      ?auto_220903 - BLOCK
      ?auto_220904 - BLOCK
      ?auto_220905 - BLOCK
      ?auto_220906 - BLOCK
      ?auto_220907 - BLOCK
      ?auto_220908 - BLOCK
      ?auto_220909 - BLOCK
      ?auto_220910 - BLOCK
      ?auto_220911 - BLOCK
    )
    :vars
    (
      ?auto_220912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220911 ?auto_220912 ) ( ON-TABLE ?auto_220902 ) ( ON ?auto_220903 ?auto_220902 ) ( not ( = ?auto_220902 ?auto_220903 ) ) ( not ( = ?auto_220902 ?auto_220904 ) ) ( not ( = ?auto_220902 ?auto_220905 ) ) ( not ( = ?auto_220902 ?auto_220906 ) ) ( not ( = ?auto_220902 ?auto_220907 ) ) ( not ( = ?auto_220902 ?auto_220908 ) ) ( not ( = ?auto_220902 ?auto_220909 ) ) ( not ( = ?auto_220902 ?auto_220910 ) ) ( not ( = ?auto_220902 ?auto_220911 ) ) ( not ( = ?auto_220902 ?auto_220912 ) ) ( not ( = ?auto_220903 ?auto_220904 ) ) ( not ( = ?auto_220903 ?auto_220905 ) ) ( not ( = ?auto_220903 ?auto_220906 ) ) ( not ( = ?auto_220903 ?auto_220907 ) ) ( not ( = ?auto_220903 ?auto_220908 ) ) ( not ( = ?auto_220903 ?auto_220909 ) ) ( not ( = ?auto_220903 ?auto_220910 ) ) ( not ( = ?auto_220903 ?auto_220911 ) ) ( not ( = ?auto_220903 ?auto_220912 ) ) ( not ( = ?auto_220904 ?auto_220905 ) ) ( not ( = ?auto_220904 ?auto_220906 ) ) ( not ( = ?auto_220904 ?auto_220907 ) ) ( not ( = ?auto_220904 ?auto_220908 ) ) ( not ( = ?auto_220904 ?auto_220909 ) ) ( not ( = ?auto_220904 ?auto_220910 ) ) ( not ( = ?auto_220904 ?auto_220911 ) ) ( not ( = ?auto_220904 ?auto_220912 ) ) ( not ( = ?auto_220905 ?auto_220906 ) ) ( not ( = ?auto_220905 ?auto_220907 ) ) ( not ( = ?auto_220905 ?auto_220908 ) ) ( not ( = ?auto_220905 ?auto_220909 ) ) ( not ( = ?auto_220905 ?auto_220910 ) ) ( not ( = ?auto_220905 ?auto_220911 ) ) ( not ( = ?auto_220905 ?auto_220912 ) ) ( not ( = ?auto_220906 ?auto_220907 ) ) ( not ( = ?auto_220906 ?auto_220908 ) ) ( not ( = ?auto_220906 ?auto_220909 ) ) ( not ( = ?auto_220906 ?auto_220910 ) ) ( not ( = ?auto_220906 ?auto_220911 ) ) ( not ( = ?auto_220906 ?auto_220912 ) ) ( not ( = ?auto_220907 ?auto_220908 ) ) ( not ( = ?auto_220907 ?auto_220909 ) ) ( not ( = ?auto_220907 ?auto_220910 ) ) ( not ( = ?auto_220907 ?auto_220911 ) ) ( not ( = ?auto_220907 ?auto_220912 ) ) ( not ( = ?auto_220908 ?auto_220909 ) ) ( not ( = ?auto_220908 ?auto_220910 ) ) ( not ( = ?auto_220908 ?auto_220911 ) ) ( not ( = ?auto_220908 ?auto_220912 ) ) ( not ( = ?auto_220909 ?auto_220910 ) ) ( not ( = ?auto_220909 ?auto_220911 ) ) ( not ( = ?auto_220909 ?auto_220912 ) ) ( not ( = ?auto_220910 ?auto_220911 ) ) ( not ( = ?auto_220910 ?auto_220912 ) ) ( not ( = ?auto_220911 ?auto_220912 ) ) ( ON ?auto_220910 ?auto_220911 ) ( ON ?auto_220909 ?auto_220910 ) ( ON ?auto_220908 ?auto_220909 ) ( ON ?auto_220907 ?auto_220908 ) ( ON ?auto_220906 ?auto_220907 ) ( ON ?auto_220905 ?auto_220906 ) ( CLEAR ?auto_220903 ) ( ON ?auto_220904 ?auto_220905 ) ( CLEAR ?auto_220904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_220902 ?auto_220903 ?auto_220904 )
      ( MAKE-10PILE ?auto_220902 ?auto_220903 ?auto_220904 ?auto_220905 ?auto_220906 ?auto_220907 ?auto_220908 ?auto_220909 ?auto_220910 ?auto_220911 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_220923 - BLOCK
      ?auto_220924 - BLOCK
      ?auto_220925 - BLOCK
      ?auto_220926 - BLOCK
      ?auto_220927 - BLOCK
      ?auto_220928 - BLOCK
      ?auto_220929 - BLOCK
      ?auto_220930 - BLOCK
      ?auto_220931 - BLOCK
      ?auto_220932 - BLOCK
    )
    :vars
    (
      ?auto_220933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220932 ?auto_220933 ) ( ON-TABLE ?auto_220923 ) ( ON ?auto_220924 ?auto_220923 ) ( not ( = ?auto_220923 ?auto_220924 ) ) ( not ( = ?auto_220923 ?auto_220925 ) ) ( not ( = ?auto_220923 ?auto_220926 ) ) ( not ( = ?auto_220923 ?auto_220927 ) ) ( not ( = ?auto_220923 ?auto_220928 ) ) ( not ( = ?auto_220923 ?auto_220929 ) ) ( not ( = ?auto_220923 ?auto_220930 ) ) ( not ( = ?auto_220923 ?auto_220931 ) ) ( not ( = ?auto_220923 ?auto_220932 ) ) ( not ( = ?auto_220923 ?auto_220933 ) ) ( not ( = ?auto_220924 ?auto_220925 ) ) ( not ( = ?auto_220924 ?auto_220926 ) ) ( not ( = ?auto_220924 ?auto_220927 ) ) ( not ( = ?auto_220924 ?auto_220928 ) ) ( not ( = ?auto_220924 ?auto_220929 ) ) ( not ( = ?auto_220924 ?auto_220930 ) ) ( not ( = ?auto_220924 ?auto_220931 ) ) ( not ( = ?auto_220924 ?auto_220932 ) ) ( not ( = ?auto_220924 ?auto_220933 ) ) ( not ( = ?auto_220925 ?auto_220926 ) ) ( not ( = ?auto_220925 ?auto_220927 ) ) ( not ( = ?auto_220925 ?auto_220928 ) ) ( not ( = ?auto_220925 ?auto_220929 ) ) ( not ( = ?auto_220925 ?auto_220930 ) ) ( not ( = ?auto_220925 ?auto_220931 ) ) ( not ( = ?auto_220925 ?auto_220932 ) ) ( not ( = ?auto_220925 ?auto_220933 ) ) ( not ( = ?auto_220926 ?auto_220927 ) ) ( not ( = ?auto_220926 ?auto_220928 ) ) ( not ( = ?auto_220926 ?auto_220929 ) ) ( not ( = ?auto_220926 ?auto_220930 ) ) ( not ( = ?auto_220926 ?auto_220931 ) ) ( not ( = ?auto_220926 ?auto_220932 ) ) ( not ( = ?auto_220926 ?auto_220933 ) ) ( not ( = ?auto_220927 ?auto_220928 ) ) ( not ( = ?auto_220927 ?auto_220929 ) ) ( not ( = ?auto_220927 ?auto_220930 ) ) ( not ( = ?auto_220927 ?auto_220931 ) ) ( not ( = ?auto_220927 ?auto_220932 ) ) ( not ( = ?auto_220927 ?auto_220933 ) ) ( not ( = ?auto_220928 ?auto_220929 ) ) ( not ( = ?auto_220928 ?auto_220930 ) ) ( not ( = ?auto_220928 ?auto_220931 ) ) ( not ( = ?auto_220928 ?auto_220932 ) ) ( not ( = ?auto_220928 ?auto_220933 ) ) ( not ( = ?auto_220929 ?auto_220930 ) ) ( not ( = ?auto_220929 ?auto_220931 ) ) ( not ( = ?auto_220929 ?auto_220932 ) ) ( not ( = ?auto_220929 ?auto_220933 ) ) ( not ( = ?auto_220930 ?auto_220931 ) ) ( not ( = ?auto_220930 ?auto_220932 ) ) ( not ( = ?auto_220930 ?auto_220933 ) ) ( not ( = ?auto_220931 ?auto_220932 ) ) ( not ( = ?auto_220931 ?auto_220933 ) ) ( not ( = ?auto_220932 ?auto_220933 ) ) ( ON ?auto_220931 ?auto_220932 ) ( ON ?auto_220930 ?auto_220931 ) ( ON ?auto_220929 ?auto_220930 ) ( ON ?auto_220928 ?auto_220929 ) ( ON ?auto_220927 ?auto_220928 ) ( ON ?auto_220926 ?auto_220927 ) ( CLEAR ?auto_220924 ) ( ON ?auto_220925 ?auto_220926 ) ( CLEAR ?auto_220925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_220923 ?auto_220924 ?auto_220925 )
      ( MAKE-10PILE ?auto_220923 ?auto_220924 ?auto_220925 ?auto_220926 ?auto_220927 ?auto_220928 ?auto_220929 ?auto_220930 ?auto_220931 ?auto_220932 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_220944 - BLOCK
      ?auto_220945 - BLOCK
      ?auto_220946 - BLOCK
      ?auto_220947 - BLOCK
      ?auto_220948 - BLOCK
      ?auto_220949 - BLOCK
      ?auto_220950 - BLOCK
      ?auto_220951 - BLOCK
      ?auto_220952 - BLOCK
      ?auto_220953 - BLOCK
    )
    :vars
    (
      ?auto_220954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220953 ?auto_220954 ) ( ON-TABLE ?auto_220944 ) ( not ( = ?auto_220944 ?auto_220945 ) ) ( not ( = ?auto_220944 ?auto_220946 ) ) ( not ( = ?auto_220944 ?auto_220947 ) ) ( not ( = ?auto_220944 ?auto_220948 ) ) ( not ( = ?auto_220944 ?auto_220949 ) ) ( not ( = ?auto_220944 ?auto_220950 ) ) ( not ( = ?auto_220944 ?auto_220951 ) ) ( not ( = ?auto_220944 ?auto_220952 ) ) ( not ( = ?auto_220944 ?auto_220953 ) ) ( not ( = ?auto_220944 ?auto_220954 ) ) ( not ( = ?auto_220945 ?auto_220946 ) ) ( not ( = ?auto_220945 ?auto_220947 ) ) ( not ( = ?auto_220945 ?auto_220948 ) ) ( not ( = ?auto_220945 ?auto_220949 ) ) ( not ( = ?auto_220945 ?auto_220950 ) ) ( not ( = ?auto_220945 ?auto_220951 ) ) ( not ( = ?auto_220945 ?auto_220952 ) ) ( not ( = ?auto_220945 ?auto_220953 ) ) ( not ( = ?auto_220945 ?auto_220954 ) ) ( not ( = ?auto_220946 ?auto_220947 ) ) ( not ( = ?auto_220946 ?auto_220948 ) ) ( not ( = ?auto_220946 ?auto_220949 ) ) ( not ( = ?auto_220946 ?auto_220950 ) ) ( not ( = ?auto_220946 ?auto_220951 ) ) ( not ( = ?auto_220946 ?auto_220952 ) ) ( not ( = ?auto_220946 ?auto_220953 ) ) ( not ( = ?auto_220946 ?auto_220954 ) ) ( not ( = ?auto_220947 ?auto_220948 ) ) ( not ( = ?auto_220947 ?auto_220949 ) ) ( not ( = ?auto_220947 ?auto_220950 ) ) ( not ( = ?auto_220947 ?auto_220951 ) ) ( not ( = ?auto_220947 ?auto_220952 ) ) ( not ( = ?auto_220947 ?auto_220953 ) ) ( not ( = ?auto_220947 ?auto_220954 ) ) ( not ( = ?auto_220948 ?auto_220949 ) ) ( not ( = ?auto_220948 ?auto_220950 ) ) ( not ( = ?auto_220948 ?auto_220951 ) ) ( not ( = ?auto_220948 ?auto_220952 ) ) ( not ( = ?auto_220948 ?auto_220953 ) ) ( not ( = ?auto_220948 ?auto_220954 ) ) ( not ( = ?auto_220949 ?auto_220950 ) ) ( not ( = ?auto_220949 ?auto_220951 ) ) ( not ( = ?auto_220949 ?auto_220952 ) ) ( not ( = ?auto_220949 ?auto_220953 ) ) ( not ( = ?auto_220949 ?auto_220954 ) ) ( not ( = ?auto_220950 ?auto_220951 ) ) ( not ( = ?auto_220950 ?auto_220952 ) ) ( not ( = ?auto_220950 ?auto_220953 ) ) ( not ( = ?auto_220950 ?auto_220954 ) ) ( not ( = ?auto_220951 ?auto_220952 ) ) ( not ( = ?auto_220951 ?auto_220953 ) ) ( not ( = ?auto_220951 ?auto_220954 ) ) ( not ( = ?auto_220952 ?auto_220953 ) ) ( not ( = ?auto_220952 ?auto_220954 ) ) ( not ( = ?auto_220953 ?auto_220954 ) ) ( ON ?auto_220952 ?auto_220953 ) ( ON ?auto_220951 ?auto_220952 ) ( ON ?auto_220950 ?auto_220951 ) ( ON ?auto_220949 ?auto_220950 ) ( ON ?auto_220948 ?auto_220949 ) ( ON ?auto_220947 ?auto_220948 ) ( ON ?auto_220946 ?auto_220947 ) ( CLEAR ?auto_220944 ) ( ON ?auto_220945 ?auto_220946 ) ( CLEAR ?auto_220945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_220944 ?auto_220945 )
      ( MAKE-10PILE ?auto_220944 ?auto_220945 ?auto_220946 ?auto_220947 ?auto_220948 ?auto_220949 ?auto_220950 ?auto_220951 ?auto_220952 ?auto_220953 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_220965 - BLOCK
      ?auto_220966 - BLOCK
      ?auto_220967 - BLOCK
      ?auto_220968 - BLOCK
      ?auto_220969 - BLOCK
      ?auto_220970 - BLOCK
      ?auto_220971 - BLOCK
      ?auto_220972 - BLOCK
      ?auto_220973 - BLOCK
      ?auto_220974 - BLOCK
    )
    :vars
    (
      ?auto_220975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220974 ?auto_220975 ) ( ON-TABLE ?auto_220965 ) ( not ( = ?auto_220965 ?auto_220966 ) ) ( not ( = ?auto_220965 ?auto_220967 ) ) ( not ( = ?auto_220965 ?auto_220968 ) ) ( not ( = ?auto_220965 ?auto_220969 ) ) ( not ( = ?auto_220965 ?auto_220970 ) ) ( not ( = ?auto_220965 ?auto_220971 ) ) ( not ( = ?auto_220965 ?auto_220972 ) ) ( not ( = ?auto_220965 ?auto_220973 ) ) ( not ( = ?auto_220965 ?auto_220974 ) ) ( not ( = ?auto_220965 ?auto_220975 ) ) ( not ( = ?auto_220966 ?auto_220967 ) ) ( not ( = ?auto_220966 ?auto_220968 ) ) ( not ( = ?auto_220966 ?auto_220969 ) ) ( not ( = ?auto_220966 ?auto_220970 ) ) ( not ( = ?auto_220966 ?auto_220971 ) ) ( not ( = ?auto_220966 ?auto_220972 ) ) ( not ( = ?auto_220966 ?auto_220973 ) ) ( not ( = ?auto_220966 ?auto_220974 ) ) ( not ( = ?auto_220966 ?auto_220975 ) ) ( not ( = ?auto_220967 ?auto_220968 ) ) ( not ( = ?auto_220967 ?auto_220969 ) ) ( not ( = ?auto_220967 ?auto_220970 ) ) ( not ( = ?auto_220967 ?auto_220971 ) ) ( not ( = ?auto_220967 ?auto_220972 ) ) ( not ( = ?auto_220967 ?auto_220973 ) ) ( not ( = ?auto_220967 ?auto_220974 ) ) ( not ( = ?auto_220967 ?auto_220975 ) ) ( not ( = ?auto_220968 ?auto_220969 ) ) ( not ( = ?auto_220968 ?auto_220970 ) ) ( not ( = ?auto_220968 ?auto_220971 ) ) ( not ( = ?auto_220968 ?auto_220972 ) ) ( not ( = ?auto_220968 ?auto_220973 ) ) ( not ( = ?auto_220968 ?auto_220974 ) ) ( not ( = ?auto_220968 ?auto_220975 ) ) ( not ( = ?auto_220969 ?auto_220970 ) ) ( not ( = ?auto_220969 ?auto_220971 ) ) ( not ( = ?auto_220969 ?auto_220972 ) ) ( not ( = ?auto_220969 ?auto_220973 ) ) ( not ( = ?auto_220969 ?auto_220974 ) ) ( not ( = ?auto_220969 ?auto_220975 ) ) ( not ( = ?auto_220970 ?auto_220971 ) ) ( not ( = ?auto_220970 ?auto_220972 ) ) ( not ( = ?auto_220970 ?auto_220973 ) ) ( not ( = ?auto_220970 ?auto_220974 ) ) ( not ( = ?auto_220970 ?auto_220975 ) ) ( not ( = ?auto_220971 ?auto_220972 ) ) ( not ( = ?auto_220971 ?auto_220973 ) ) ( not ( = ?auto_220971 ?auto_220974 ) ) ( not ( = ?auto_220971 ?auto_220975 ) ) ( not ( = ?auto_220972 ?auto_220973 ) ) ( not ( = ?auto_220972 ?auto_220974 ) ) ( not ( = ?auto_220972 ?auto_220975 ) ) ( not ( = ?auto_220973 ?auto_220974 ) ) ( not ( = ?auto_220973 ?auto_220975 ) ) ( not ( = ?auto_220974 ?auto_220975 ) ) ( ON ?auto_220973 ?auto_220974 ) ( ON ?auto_220972 ?auto_220973 ) ( ON ?auto_220971 ?auto_220972 ) ( ON ?auto_220970 ?auto_220971 ) ( ON ?auto_220969 ?auto_220970 ) ( ON ?auto_220968 ?auto_220969 ) ( ON ?auto_220967 ?auto_220968 ) ( CLEAR ?auto_220965 ) ( ON ?auto_220966 ?auto_220967 ) ( CLEAR ?auto_220966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_220965 ?auto_220966 )
      ( MAKE-10PILE ?auto_220965 ?auto_220966 ?auto_220967 ?auto_220968 ?auto_220969 ?auto_220970 ?auto_220971 ?auto_220972 ?auto_220973 ?auto_220974 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_220986 - BLOCK
      ?auto_220987 - BLOCK
      ?auto_220988 - BLOCK
      ?auto_220989 - BLOCK
      ?auto_220990 - BLOCK
      ?auto_220991 - BLOCK
      ?auto_220992 - BLOCK
      ?auto_220993 - BLOCK
      ?auto_220994 - BLOCK
      ?auto_220995 - BLOCK
    )
    :vars
    (
      ?auto_220996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_220995 ?auto_220996 ) ( not ( = ?auto_220986 ?auto_220987 ) ) ( not ( = ?auto_220986 ?auto_220988 ) ) ( not ( = ?auto_220986 ?auto_220989 ) ) ( not ( = ?auto_220986 ?auto_220990 ) ) ( not ( = ?auto_220986 ?auto_220991 ) ) ( not ( = ?auto_220986 ?auto_220992 ) ) ( not ( = ?auto_220986 ?auto_220993 ) ) ( not ( = ?auto_220986 ?auto_220994 ) ) ( not ( = ?auto_220986 ?auto_220995 ) ) ( not ( = ?auto_220986 ?auto_220996 ) ) ( not ( = ?auto_220987 ?auto_220988 ) ) ( not ( = ?auto_220987 ?auto_220989 ) ) ( not ( = ?auto_220987 ?auto_220990 ) ) ( not ( = ?auto_220987 ?auto_220991 ) ) ( not ( = ?auto_220987 ?auto_220992 ) ) ( not ( = ?auto_220987 ?auto_220993 ) ) ( not ( = ?auto_220987 ?auto_220994 ) ) ( not ( = ?auto_220987 ?auto_220995 ) ) ( not ( = ?auto_220987 ?auto_220996 ) ) ( not ( = ?auto_220988 ?auto_220989 ) ) ( not ( = ?auto_220988 ?auto_220990 ) ) ( not ( = ?auto_220988 ?auto_220991 ) ) ( not ( = ?auto_220988 ?auto_220992 ) ) ( not ( = ?auto_220988 ?auto_220993 ) ) ( not ( = ?auto_220988 ?auto_220994 ) ) ( not ( = ?auto_220988 ?auto_220995 ) ) ( not ( = ?auto_220988 ?auto_220996 ) ) ( not ( = ?auto_220989 ?auto_220990 ) ) ( not ( = ?auto_220989 ?auto_220991 ) ) ( not ( = ?auto_220989 ?auto_220992 ) ) ( not ( = ?auto_220989 ?auto_220993 ) ) ( not ( = ?auto_220989 ?auto_220994 ) ) ( not ( = ?auto_220989 ?auto_220995 ) ) ( not ( = ?auto_220989 ?auto_220996 ) ) ( not ( = ?auto_220990 ?auto_220991 ) ) ( not ( = ?auto_220990 ?auto_220992 ) ) ( not ( = ?auto_220990 ?auto_220993 ) ) ( not ( = ?auto_220990 ?auto_220994 ) ) ( not ( = ?auto_220990 ?auto_220995 ) ) ( not ( = ?auto_220990 ?auto_220996 ) ) ( not ( = ?auto_220991 ?auto_220992 ) ) ( not ( = ?auto_220991 ?auto_220993 ) ) ( not ( = ?auto_220991 ?auto_220994 ) ) ( not ( = ?auto_220991 ?auto_220995 ) ) ( not ( = ?auto_220991 ?auto_220996 ) ) ( not ( = ?auto_220992 ?auto_220993 ) ) ( not ( = ?auto_220992 ?auto_220994 ) ) ( not ( = ?auto_220992 ?auto_220995 ) ) ( not ( = ?auto_220992 ?auto_220996 ) ) ( not ( = ?auto_220993 ?auto_220994 ) ) ( not ( = ?auto_220993 ?auto_220995 ) ) ( not ( = ?auto_220993 ?auto_220996 ) ) ( not ( = ?auto_220994 ?auto_220995 ) ) ( not ( = ?auto_220994 ?auto_220996 ) ) ( not ( = ?auto_220995 ?auto_220996 ) ) ( ON ?auto_220994 ?auto_220995 ) ( ON ?auto_220993 ?auto_220994 ) ( ON ?auto_220992 ?auto_220993 ) ( ON ?auto_220991 ?auto_220992 ) ( ON ?auto_220990 ?auto_220991 ) ( ON ?auto_220989 ?auto_220990 ) ( ON ?auto_220988 ?auto_220989 ) ( ON ?auto_220987 ?auto_220988 ) ( ON ?auto_220986 ?auto_220987 ) ( CLEAR ?auto_220986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_220986 )
      ( MAKE-10PILE ?auto_220986 ?auto_220987 ?auto_220988 ?auto_220989 ?auto_220990 ?auto_220991 ?auto_220992 ?auto_220993 ?auto_220994 ?auto_220995 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_221007 - BLOCK
      ?auto_221008 - BLOCK
      ?auto_221009 - BLOCK
      ?auto_221010 - BLOCK
      ?auto_221011 - BLOCK
      ?auto_221012 - BLOCK
      ?auto_221013 - BLOCK
      ?auto_221014 - BLOCK
      ?auto_221015 - BLOCK
      ?auto_221016 - BLOCK
    )
    :vars
    (
      ?auto_221017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221016 ?auto_221017 ) ( not ( = ?auto_221007 ?auto_221008 ) ) ( not ( = ?auto_221007 ?auto_221009 ) ) ( not ( = ?auto_221007 ?auto_221010 ) ) ( not ( = ?auto_221007 ?auto_221011 ) ) ( not ( = ?auto_221007 ?auto_221012 ) ) ( not ( = ?auto_221007 ?auto_221013 ) ) ( not ( = ?auto_221007 ?auto_221014 ) ) ( not ( = ?auto_221007 ?auto_221015 ) ) ( not ( = ?auto_221007 ?auto_221016 ) ) ( not ( = ?auto_221007 ?auto_221017 ) ) ( not ( = ?auto_221008 ?auto_221009 ) ) ( not ( = ?auto_221008 ?auto_221010 ) ) ( not ( = ?auto_221008 ?auto_221011 ) ) ( not ( = ?auto_221008 ?auto_221012 ) ) ( not ( = ?auto_221008 ?auto_221013 ) ) ( not ( = ?auto_221008 ?auto_221014 ) ) ( not ( = ?auto_221008 ?auto_221015 ) ) ( not ( = ?auto_221008 ?auto_221016 ) ) ( not ( = ?auto_221008 ?auto_221017 ) ) ( not ( = ?auto_221009 ?auto_221010 ) ) ( not ( = ?auto_221009 ?auto_221011 ) ) ( not ( = ?auto_221009 ?auto_221012 ) ) ( not ( = ?auto_221009 ?auto_221013 ) ) ( not ( = ?auto_221009 ?auto_221014 ) ) ( not ( = ?auto_221009 ?auto_221015 ) ) ( not ( = ?auto_221009 ?auto_221016 ) ) ( not ( = ?auto_221009 ?auto_221017 ) ) ( not ( = ?auto_221010 ?auto_221011 ) ) ( not ( = ?auto_221010 ?auto_221012 ) ) ( not ( = ?auto_221010 ?auto_221013 ) ) ( not ( = ?auto_221010 ?auto_221014 ) ) ( not ( = ?auto_221010 ?auto_221015 ) ) ( not ( = ?auto_221010 ?auto_221016 ) ) ( not ( = ?auto_221010 ?auto_221017 ) ) ( not ( = ?auto_221011 ?auto_221012 ) ) ( not ( = ?auto_221011 ?auto_221013 ) ) ( not ( = ?auto_221011 ?auto_221014 ) ) ( not ( = ?auto_221011 ?auto_221015 ) ) ( not ( = ?auto_221011 ?auto_221016 ) ) ( not ( = ?auto_221011 ?auto_221017 ) ) ( not ( = ?auto_221012 ?auto_221013 ) ) ( not ( = ?auto_221012 ?auto_221014 ) ) ( not ( = ?auto_221012 ?auto_221015 ) ) ( not ( = ?auto_221012 ?auto_221016 ) ) ( not ( = ?auto_221012 ?auto_221017 ) ) ( not ( = ?auto_221013 ?auto_221014 ) ) ( not ( = ?auto_221013 ?auto_221015 ) ) ( not ( = ?auto_221013 ?auto_221016 ) ) ( not ( = ?auto_221013 ?auto_221017 ) ) ( not ( = ?auto_221014 ?auto_221015 ) ) ( not ( = ?auto_221014 ?auto_221016 ) ) ( not ( = ?auto_221014 ?auto_221017 ) ) ( not ( = ?auto_221015 ?auto_221016 ) ) ( not ( = ?auto_221015 ?auto_221017 ) ) ( not ( = ?auto_221016 ?auto_221017 ) ) ( ON ?auto_221015 ?auto_221016 ) ( ON ?auto_221014 ?auto_221015 ) ( ON ?auto_221013 ?auto_221014 ) ( ON ?auto_221012 ?auto_221013 ) ( ON ?auto_221011 ?auto_221012 ) ( ON ?auto_221010 ?auto_221011 ) ( ON ?auto_221009 ?auto_221010 ) ( ON ?auto_221008 ?auto_221009 ) ( ON ?auto_221007 ?auto_221008 ) ( CLEAR ?auto_221007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_221007 )
      ( MAKE-10PILE ?auto_221007 ?auto_221008 ?auto_221009 ?auto_221010 ?auto_221011 ?auto_221012 ?auto_221013 ?auto_221014 ?auto_221015 ?auto_221016 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_221029 - BLOCK
      ?auto_221030 - BLOCK
      ?auto_221031 - BLOCK
      ?auto_221032 - BLOCK
      ?auto_221033 - BLOCK
      ?auto_221034 - BLOCK
      ?auto_221035 - BLOCK
      ?auto_221036 - BLOCK
      ?auto_221037 - BLOCK
      ?auto_221038 - BLOCK
      ?auto_221039 - BLOCK
    )
    :vars
    (
      ?auto_221040 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_221038 ) ( ON ?auto_221039 ?auto_221040 ) ( CLEAR ?auto_221039 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_221029 ) ( ON ?auto_221030 ?auto_221029 ) ( ON ?auto_221031 ?auto_221030 ) ( ON ?auto_221032 ?auto_221031 ) ( ON ?auto_221033 ?auto_221032 ) ( ON ?auto_221034 ?auto_221033 ) ( ON ?auto_221035 ?auto_221034 ) ( ON ?auto_221036 ?auto_221035 ) ( ON ?auto_221037 ?auto_221036 ) ( ON ?auto_221038 ?auto_221037 ) ( not ( = ?auto_221029 ?auto_221030 ) ) ( not ( = ?auto_221029 ?auto_221031 ) ) ( not ( = ?auto_221029 ?auto_221032 ) ) ( not ( = ?auto_221029 ?auto_221033 ) ) ( not ( = ?auto_221029 ?auto_221034 ) ) ( not ( = ?auto_221029 ?auto_221035 ) ) ( not ( = ?auto_221029 ?auto_221036 ) ) ( not ( = ?auto_221029 ?auto_221037 ) ) ( not ( = ?auto_221029 ?auto_221038 ) ) ( not ( = ?auto_221029 ?auto_221039 ) ) ( not ( = ?auto_221029 ?auto_221040 ) ) ( not ( = ?auto_221030 ?auto_221031 ) ) ( not ( = ?auto_221030 ?auto_221032 ) ) ( not ( = ?auto_221030 ?auto_221033 ) ) ( not ( = ?auto_221030 ?auto_221034 ) ) ( not ( = ?auto_221030 ?auto_221035 ) ) ( not ( = ?auto_221030 ?auto_221036 ) ) ( not ( = ?auto_221030 ?auto_221037 ) ) ( not ( = ?auto_221030 ?auto_221038 ) ) ( not ( = ?auto_221030 ?auto_221039 ) ) ( not ( = ?auto_221030 ?auto_221040 ) ) ( not ( = ?auto_221031 ?auto_221032 ) ) ( not ( = ?auto_221031 ?auto_221033 ) ) ( not ( = ?auto_221031 ?auto_221034 ) ) ( not ( = ?auto_221031 ?auto_221035 ) ) ( not ( = ?auto_221031 ?auto_221036 ) ) ( not ( = ?auto_221031 ?auto_221037 ) ) ( not ( = ?auto_221031 ?auto_221038 ) ) ( not ( = ?auto_221031 ?auto_221039 ) ) ( not ( = ?auto_221031 ?auto_221040 ) ) ( not ( = ?auto_221032 ?auto_221033 ) ) ( not ( = ?auto_221032 ?auto_221034 ) ) ( not ( = ?auto_221032 ?auto_221035 ) ) ( not ( = ?auto_221032 ?auto_221036 ) ) ( not ( = ?auto_221032 ?auto_221037 ) ) ( not ( = ?auto_221032 ?auto_221038 ) ) ( not ( = ?auto_221032 ?auto_221039 ) ) ( not ( = ?auto_221032 ?auto_221040 ) ) ( not ( = ?auto_221033 ?auto_221034 ) ) ( not ( = ?auto_221033 ?auto_221035 ) ) ( not ( = ?auto_221033 ?auto_221036 ) ) ( not ( = ?auto_221033 ?auto_221037 ) ) ( not ( = ?auto_221033 ?auto_221038 ) ) ( not ( = ?auto_221033 ?auto_221039 ) ) ( not ( = ?auto_221033 ?auto_221040 ) ) ( not ( = ?auto_221034 ?auto_221035 ) ) ( not ( = ?auto_221034 ?auto_221036 ) ) ( not ( = ?auto_221034 ?auto_221037 ) ) ( not ( = ?auto_221034 ?auto_221038 ) ) ( not ( = ?auto_221034 ?auto_221039 ) ) ( not ( = ?auto_221034 ?auto_221040 ) ) ( not ( = ?auto_221035 ?auto_221036 ) ) ( not ( = ?auto_221035 ?auto_221037 ) ) ( not ( = ?auto_221035 ?auto_221038 ) ) ( not ( = ?auto_221035 ?auto_221039 ) ) ( not ( = ?auto_221035 ?auto_221040 ) ) ( not ( = ?auto_221036 ?auto_221037 ) ) ( not ( = ?auto_221036 ?auto_221038 ) ) ( not ( = ?auto_221036 ?auto_221039 ) ) ( not ( = ?auto_221036 ?auto_221040 ) ) ( not ( = ?auto_221037 ?auto_221038 ) ) ( not ( = ?auto_221037 ?auto_221039 ) ) ( not ( = ?auto_221037 ?auto_221040 ) ) ( not ( = ?auto_221038 ?auto_221039 ) ) ( not ( = ?auto_221038 ?auto_221040 ) ) ( not ( = ?auto_221039 ?auto_221040 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_221039 ?auto_221040 )
      ( !STACK ?auto_221039 ?auto_221038 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_221052 - BLOCK
      ?auto_221053 - BLOCK
      ?auto_221054 - BLOCK
      ?auto_221055 - BLOCK
      ?auto_221056 - BLOCK
      ?auto_221057 - BLOCK
      ?auto_221058 - BLOCK
      ?auto_221059 - BLOCK
      ?auto_221060 - BLOCK
      ?auto_221061 - BLOCK
      ?auto_221062 - BLOCK
    )
    :vars
    (
      ?auto_221063 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_221061 ) ( ON ?auto_221062 ?auto_221063 ) ( CLEAR ?auto_221062 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_221052 ) ( ON ?auto_221053 ?auto_221052 ) ( ON ?auto_221054 ?auto_221053 ) ( ON ?auto_221055 ?auto_221054 ) ( ON ?auto_221056 ?auto_221055 ) ( ON ?auto_221057 ?auto_221056 ) ( ON ?auto_221058 ?auto_221057 ) ( ON ?auto_221059 ?auto_221058 ) ( ON ?auto_221060 ?auto_221059 ) ( ON ?auto_221061 ?auto_221060 ) ( not ( = ?auto_221052 ?auto_221053 ) ) ( not ( = ?auto_221052 ?auto_221054 ) ) ( not ( = ?auto_221052 ?auto_221055 ) ) ( not ( = ?auto_221052 ?auto_221056 ) ) ( not ( = ?auto_221052 ?auto_221057 ) ) ( not ( = ?auto_221052 ?auto_221058 ) ) ( not ( = ?auto_221052 ?auto_221059 ) ) ( not ( = ?auto_221052 ?auto_221060 ) ) ( not ( = ?auto_221052 ?auto_221061 ) ) ( not ( = ?auto_221052 ?auto_221062 ) ) ( not ( = ?auto_221052 ?auto_221063 ) ) ( not ( = ?auto_221053 ?auto_221054 ) ) ( not ( = ?auto_221053 ?auto_221055 ) ) ( not ( = ?auto_221053 ?auto_221056 ) ) ( not ( = ?auto_221053 ?auto_221057 ) ) ( not ( = ?auto_221053 ?auto_221058 ) ) ( not ( = ?auto_221053 ?auto_221059 ) ) ( not ( = ?auto_221053 ?auto_221060 ) ) ( not ( = ?auto_221053 ?auto_221061 ) ) ( not ( = ?auto_221053 ?auto_221062 ) ) ( not ( = ?auto_221053 ?auto_221063 ) ) ( not ( = ?auto_221054 ?auto_221055 ) ) ( not ( = ?auto_221054 ?auto_221056 ) ) ( not ( = ?auto_221054 ?auto_221057 ) ) ( not ( = ?auto_221054 ?auto_221058 ) ) ( not ( = ?auto_221054 ?auto_221059 ) ) ( not ( = ?auto_221054 ?auto_221060 ) ) ( not ( = ?auto_221054 ?auto_221061 ) ) ( not ( = ?auto_221054 ?auto_221062 ) ) ( not ( = ?auto_221054 ?auto_221063 ) ) ( not ( = ?auto_221055 ?auto_221056 ) ) ( not ( = ?auto_221055 ?auto_221057 ) ) ( not ( = ?auto_221055 ?auto_221058 ) ) ( not ( = ?auto_221055 ?auto_221059 ) ) ( not ( = ?auto_221055 ?auto_221060 ) ) ( not ( = ?auto_221055 ?auto_221061 ) ) ( not ( = ?auto_221055 ?auto_221062 ) ) ( not ( = ?auto_221055 ?auto_221063 ) ) ( not ( = ?auto_221056 ?auto_221057 ) ) ( not ( = ?auto_221056 ?auto_221058 ) ) ( not ( = ?auto_221056 ?auto_221059 ) ) ( not ( = ?auto_221056 ?auto_221060 ) ) ( not ( = ?auto_221056 ?auto_221061 ) ) ( not ( = ?auto_221056 ?auto_221062 ) ) ( not ( = ?auto_221056 ?auto_221063 ) ) ( not ( = ?auto_221057 ?auto_221058 ) ) ( not ( = ?auto_221057 ?auto_221059 ) ) ( not ( = ?auto_221057 ?auto_221060 ) ) ( not ( = ?auto_221057 ?auto_221061 ) ) ( not ( = ?auto_221057 ?auto_221062 ) ) ( not ( = ?auto_221057 ?auto_221063 ) ) ( not ( = ?auto_221058 ?auto_221059 ) ) ( not ( = ?auto_221058 ?auto_221060 ) ) ( not ( = ?auto_221058 ?auto_221061 ) ) ( not ( = ?auto_221058 ?auto_221062 ) ) ( not ( = ?auto_221058 ?auto_221063 ) ) ( not ( = ?auto_221059 ?auto_221060 ) ) ( not ( = ?auto_221059 ?auto_221061 ) ) ( not ( = ?auto_221059 ?auto_221062 ) ) ( not ( = ?auto_221059 ?auto_221063 ) ) ( not ( = ?auto_221060 ?auto_221061 ) ) ( not ( = ?auto_221060 ?auto_221062 ) ) ( not ( = ?auto_221060 ?auto_221063 ) ) ( not ( = ?auto_221061 ?auto_221062 ) ) ( not ( = ?auto_221061 ?auto_221063 ) ) ( not ( = ?auto_221062 ?auto_221063 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_221062 ?auto_221063 )
      ( !STACK ?auto_221062 ?auto_221061 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_221075 - BLOCK
      ?auto_221076 - BLOCK
      ?auto_221077 - BLOCK
      ?auto_221078 - BLOCK
      ?auto_221079 - BLOCK
      ?auto_221080 - BLOCK
      ?auto_221081 - BLOCK
      ?auto_221082 - BLOCK
      ?auto_221083 - BLOCK
      ?auto_221084 - BLOCK
      ?auto_221085 - BLOCK
    )
    :vars
    (
      ?auto_221086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221085 ?auto_221086 ) ( ON-TABLE ?auto_221075 ) ( ON ?auto_221076 ?auto_221075 ) ( ON ?auto_221077 ?auto_221076 ) ( ON ?auto_221078 ?auto_221077 ) ( ON ?auto_221079 ?auto_221078 ) ( ON ?auto_221080 ?auto_221079 ) ( ON ?auto_221081 ?auto_221080 ) ( ON ?auto_221082 ?auto_221081 ) ( ON ?auto_221083 ?auto_221082 ) ( not ( = ?auto_221075 ?auto_221076 ) ) ( not ( = ?auto_221075 ?auto_221077 ) ) ( not ( = ?auto_221075 ?auto_221078 ) ) ( not ( = ?auto_221075 ?auto_221079 ) ) ( not ( = ?auto_221075 ?auto_221080 ) ) ( not ( = ?auto_221075 ?auto_221081 ) ) ( not ( = ?auto_221075 ?auto_221082 ) ) ( not ( = ?auto_221075 ?auto_221083 ) ) ( not ( = ?auto_221075 ?auto_221084 ) ) ( not ( = ?auto_221075 ?auto_221085 ) ) ( not ( = ?auto_221075 ?auto_221086 ) ) ( not ( = ?auto_221076 ?auto_221077 ) ) ( not ( = ?auto_221076 ?auto_221078 ) ) ( not ( = ?auto_221076 ?auto_221079 ) ) ( not ( = ?auto_221076 ?auto_221080 ) ) ( not ( = ?auto_221076 ?auto_221081 ) ) ( not ( = ?auto_221076 ?auto_221082 ) ) ( not ( = ?auto_221076 ?auto_221083 ) ) ( not ( = ?auto_221076 ?auto_221084 ) ) ( not ( = ?auto_221076 ?auto_221085 ) ) ( not ( = ?auto_221076 ?auto_221086 ) ) ( not ( = ?auto_221077 ?auto_221078 ) ) ( not ( = ?auto_221077 ?auto_221079 ) ) ( not ( = ?auto_221077 ?auto_221080 ) ) ( not ( = ?auto_221077 ?auto_221081 ) ) ( not ( = ?auto_221077 ?auto_221082 ) ) ( not ( = ?auto_221077 ?auto_221083 ) ) ( not ( = ?auto_221077 ?auto_221084 ) ) ( not ( = ?auto_221077 ?auto_221085 ) ) ( not ( = ?auto_221077 ?auto_221086 ) ) ( not ( = ?auto_221078 ?auto_221079 ) ) ( not ( = ?auto_221078 ?auto_221080 ) ) ( not ( = ?auto_221078 ?auto_221081 ) ) ( not ( = ?auto_221078 ?auto_221082 ) ) ( not ( = ?auto_221078 ?auto_221083 ) ) ( not ( = ?auto_221078 ?auto_221084 ) ) ( not ( = ?auto_221078 ?auto_221085 ) ) ( not ( = ?auto_221078 ?auto_221086 ) ) ( not ( = ?auto_221079 ?auto_221080 ) ) ( not ( = ?auto_221079 ?auto_221081 ) ) ( not ( = ?auto_221079 ?auto_221082 ) ) ( not ( = ?auto_221079 ?auto_221083 ) ) ( not ( = ?auto_221079 ?auto_221084 ) ) ( not ( = ?auto_221079 ?auto_221085 ) ) ( not ( = ?auto_221079 ?auto_221086 ) ) ( not ( = ?auto_221080 ?auto_221081 ) ) ( not ( = ?auto_221080 ?auto_221082 ) ) ( not ( = ?auto_221080 ?auto_221083 ) ) ( not ( = ?auto_221080 ?auto_221084 ) ) ( not ( = ?auto_221080 ?auto_221085 ) ) ( not ( = ?auto_221080 ?auto_221086 ) ) ( not ( = ?auto_221081 ?auto_221082 ) ) ( not ( = ?auto_221081 ?auto_221083 ) ) ( not ( = ?auto_221081 ?auto_221084 ) ) ( not ( = ?auto_221081 ?auto_221085 ) ) ( not ( = ?auto_221081 ?auto_221086 ) ) ( not ( = ?auto_221082 ?auto_221083 ) ) ( not ( = ?auto_221082 ?auto_221084 ) ) ( not ( = ?auto_221082 ?auto_221085 ) ) ( not ( = ?auto_221082 ?auto_221086 ) ) ( not ( = ?auto_221083 ?auto_221084 ) ) ( not ( = ?auto_221083 ?auto_221085 ) ) ( not ( = ?auto_221083 ?auto_221086 ) ) ( not ( = ?auto_221084 ?auto_221085 ) ) ( not ( = ?auto_221084 ?auto_221086 ) ) ( not ( = ?auto_221085 ?auto_221086 ) ) ( CLEAR ?auto_221083 ) ( ON ?auto_221084 ?auto_221085 ) ( CLEAR ?auto_221084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_221075 ?auto_221076 ?auto_221077 ?auto_221078 ?auto_221079 ?auto_221080 ?auto_221081 ?auto_221082 ?auto_221083 ?auto_221084 )
      ( MAKE-11PILE ?auto_221075 ?auto_221076 ?auto_221077 ?auto_221078 ?auto_221079 ?auto_221080 ?auto_221081 ?auto_221082 ?auto_221083 ?auto_221084 ?auto_221085 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_221098 - BLOCK
      ?auto_221099 - BLOCK
      ?auto_221100 - BLOCK
      ?auto_221101 - BLOCK
      ?auto_221102 - BLOCK
      ?auto_221103 - BLOCK
      ?auto_221104 - BLOCK
      ?auto_221105 - BLOCK
      ?auto_221106 - BLOCK
      ?auto_221107 - BLOCK
      ?auto_221108 - BLOCK
    )
    :vars
    (
      ?auto_221109 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221108 ?auto_221109 ) ( ON-TABLE ?auto_221098 ) ( ON ?auto_221099 ?auto_221098 ) ( ON ?auto_221100 ?auto_221099 ) ( ON ?auto_221101 ?auto_221100 ) ( ON ?auto_221102 ?auto_221101 ) ( ON ?auto_221103 ?auto_221102 ) ( ON ?auto_221104 ?auto_221103 ) ( ON ?auto_221105 ?auto_221104 ) ( ON ?auto_221106 ?auto_221105 ) ( not ( = ?auto_221098 ?auto_221099 ) ) ( not ( = ?auto_221098 ?auto_221100 ) ) ( not ( = ?auto_221098 ?auto_221101 ) ) ( not ( = ?auto_221098 ?auto_221102 ) ) ( not ( = ?auto_221098 ?auto_221103 ) ) ( not ( = ?auto_221098 ?auto_221104 ) ) ( not ( = ?auto_221098 ?auto_221105 ) ) ( not ( = ?auto_221098 ?auto_221106 ) ) ( not ( = ?auto_221098 ?auto_221107 ) ) ( not ( = ?auto_221098 ?auto_221108 ) ) ( not ( = ?auto_221098 ?auto_221109 ) ) ( not ( = ?auto_221099 ?auto_221100 ) ) ( not ( = ?auto_221099 ?auto_221101 ) ) ( not ( = ?auto_221099 ?auto_221102 ) ) ( not ( = ?auto_221099 ?auto_221103 ) ) ( not ( = ?auto_221099 ?auto_221104 ) ) ( not ( = ?auto_221099 ?auto_221105 ) ) ( not ( = ?auto_221099 ?auto_221106 ) ) ( not ( = ?auto_221099 ?auto_221107 ) ) ( not ( = ?auto_221099 ?auto_221108 ) ) ( not ( = ?auto_221099 ?auto_221109 ) ) ( not ( = ?auto_221100 ?auto_221101 ) ) ( not ( = ?auto_221100 ?auto_221102 ) ) ( not ( = ?auto_221100 ?auto_221103 ) ) ( not ( = ?auto_221100 ?auto_221104 ) ) ( not ( = ?auto_221100 ?auto_221105 ) ) ( not ( = ?auto_221100 ?auto_221106 ) ) ( not ( = ?auto_221100 ?auto_221107 ) ) ( not ( = ?auto_221100 ?auto_221108 ) ) ( not ( = ?auto_221100 ?auto_221109 ) ) ( not ( = ?auto_221101 ?auto_221102 ) ) ( not ( = ?auto_221101 ?auto_221103 ) ) ( not ( = ?auto_221101 ?auto_221104 ) ) ( not ( = ?auto_221101 ?auto_221105 ) ) ( not ( = ?auto_221101 ?auto_221106 ) ) ( not ( = ?auto_221101 ?auto_221107 ) ) ( not ( = ?auto_221101 ?auto_221108 ) ) ( not ( = ?auto_221101 ?auto_221109 ) ) ( not ( = ?auto_221102 ?auto_221103 ) ) ( not ( = ?auto_221102 ?auto_221104 ) ) ( not ( = ?auto_221102 ?auto_221105 ) ) ( not ( = ?auto_221102 ?auto_221106 ) ) ( not ( = ?auto_221102 ?auto_221107 ) ) ( not ( = ?auto_221102 ?auto_221108 ) ) ( not ( = ?auto_221102 ?auto_221109 ) ) ( not ( = ?auto_221103 ?auto_221104 ) ) ( not ( = ?auto_221103 ?auto_221105 ) ) ( not ( = ?auto_221103 ?auto_221106 ) ) ( not ( = ?auto_221103 ?auto_221107 ) ) ( not ( = ?auto_221103 ?auto_221108 ) ) ( not ( = ?auto_221103 ?auto_221109 ) ) ( not ( = ?auto_221104 ?auto_221105 ) ) ( not ( = ?auto_221104 ?auto_221106 ) ) ( not ( = ?auto_221104 ?auto_221107 ) ) ( not ( = ?auto_221104 ?auto_221108 ) ) ( not ( = ?auto_221104 ?auto_221109 ) ) ( not ( = ?auto_221105 ?auto_221106 ) ) ( not ( = ?auto_221105 ?auto_221107 ) ) ( not ( = ?auto_221105 ?auto_221108 ) ) ( not ( = ?auto_221105 ?auto_221109 ) ) ( not ( = ?auto_221106 ?auto_221107 ) ) ( not ( = ?auto_221106 ?auto_221108 ) ) ( not ( = ?auto_221106 ?auto_221109 ) ) ( not ( = ?auto_221107 ?auto_221108 ) ) ( not ( = ?auto_221107 ?auto_221109 ) ) ( not ( = ?auto_221108 ?auto_221109 ) ) ( CLEAR ?auto_221106 ) ( ON ?auto_221107 ?auto_221108 ) ( CLEAR ?auto_221107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_221098 ?auto_221099 ?auto_221100 ?auto_221101 ?auto_221102 ?auto_221103 ?auto_221104 ?auto_221105 ?auto_221106 ?auto_221107 )
      ( MAKE-11PILE ?auto_221098 ?auto_221099 ?auto_221100 ?auto_221101 ?auto_221102 ?auto_221103 ?auto_221104 ?auto_221105 ?auto_221106 ?auto_221107 ?auto_221108 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_221121 - BLOCK
      ?auto_221122 - BLOCK
      ?auto_221123 - BLOCK
      ?auto_221124 - BLOCK
      ?auto_221125 - BLOCK
      ?auto_221126 - BLOCK
      ?auto_221127 - BLOCK
      ?auto_221128 - BLOCK
      ?auto_221129 - BLOCK
      ?auto_221130 - BLOCK
      ?auto_221131 - BLOCK
    )
    :vars
    (
      ?auto_221132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221131 ?auto_221132 ) ( ON-TABLE ?auto_221121 ) ( ON ?auto_221122 ?auto_221121 ) ( ON ?auto_221123 ?auto_221122 ) ( ON ?auto_221124 ?auto_221123 ) ( ON ?auto_221125 ?auto_221124 ) ( ON ?auto_221126 ?auto_221125 ) ( ON ?auto_221127 ?auto_221126 ) ( ON ?auto_221128 ?auto_221127 ) ( not ( = ?auto_221121 ?auto_221122 ) ) ( not ( = ?auto_221121 ?auto_221123 ) ) ( not ( = ?auto_221121 ?auto_221124 ) ) ( not ( = ?auto_221121 ?auto_221125 ) ) ( not ( = ?auto_221121 ?auto_221126 ) ) ( not ( = ?auto_221121 ?auto_221127 ) ) ( not ( = ?auto_221121 ?auto_221128 ) ) ( not ( = ?auto_221121 ?auto_221129 ) ) ( not ( = ?auto_221121 ?auto_221130 ) ) ( not ( = ?auto_221121 ?auto_221131 ) ) ( not ( = ?auto_221121 ?auto_221132 ) ) ( not ( = ?auto_221122 ?auto_221123 ) ) ( not ( = ?auto_221122 ?auto_221124 ) ) ( not ( = ?auto_221122 ?auto_221125 ) ) ( not ( = ?auto_221122 ?auto_221126 ) ) ( not ( = ?auto_221122 ?auto_221127 ) ) ( not ( = ?auto_221122 ?auto_221128 ) ) ( not ( = ?auto_221122 ?auto_221129 ) ) ( not ( = ?auto_221122 ?auto_221130 ) ) ( not ( = ?auto_221122 ?auto_221131 ) ) ( not ( = ?auto_221122 ?auto_221132 ) ) ( not ( = ?auto_221123 ?auto_221124 ) ) ( not ( = ?auto_221123 ?auto_221125 ) ) ( not ( = ?auto_221123 ?auto_221126 ) ) ( not ( = ?auto_221123 ?auto_221127 ) ) ( not ( = ?auto_221123 ?auto_221128 ) ) ( not ( = ?auto_221123 ?auto_221129 ) ) ( not ( = ?auto_221123 ?auto_221130 ) ) ( not ( = ?auto_221123 ?auto_221131 ) ) ( not ( = ?auto_221123 ?auto_221132 ) ) ( not ( = ?auto_221124 ?auto_221125 ) ) ( not ( = ?auto_221124 ?auto_221126 ) ) ( not ( = ?auto_221124 ?auto_221127 ) ) ( not ( = ?auto_221124 ?auto_221128 ) ) ( not ( = ?auto_221124 ?auto_221129 ) ) ( not ( = ?auto_221124 ?auto_221130 ) ) ( not ( = ?auto_221124 ?auto_221131 ) ) ( not ( = ?auto_221124 ?auto_221132 ) ) ( not ( = ?auto_221125 ?auto_221126 ) ) ( not ( = ?auto_221125 ?auto_221127 ) ) ( not ( = ?auto_221125 ?auto_221128 ) ) ( not ( = ?auto_221125 ?auto_221129 ) ) ( not ( = ?auto_221125 ?auto_221130 ) ) ( not ( = ?auto_221125 ?auto_221131 ) ) ( not ( = ?auto_221125 ?auto_221132 ) ) ( not ( = ?auto_221126 ?auto_221127 ) ) ( not ( = ?auto_221126 ?auto_221128 ) ) ( not ( = ?auto_221126 ?auto_221129 ) ) ( not ( = ?auto_221126 ?auto_221130 ) ) ( not ( = ?auto_221126 ?auto_221131 ) ) ( not ( = ?auto_221126 ?auto_221132 ) ) ( not ( = ?auto_221127 ?auto_221128 ) ) ( not ( = ?auto_221127 ?auto_221129 ) ) ( not ( = ?auto_221127 ?auto_221130 ) ) ( not ( = ?auto_221127 ?auto_221131 ) ) ( not ( = ?auto_221127 ?auto_221132 ) ) ( not ( = ?auto_221128 ?auto_221129 ) ) ( not ( = ?auto_221128 ?auto_221130 ) ) ( not ( = ?auto_221128 ?auto_221131 ) ) ( not ( = ?auto_221128 ?auto_221132 ) ) ( not ( = ?auto_221129 ?auto_221130 ) ) ( not ( = ?auto_221129 ?auto_221131 ) ) ( not ( = ?auto_221129 ?auto_221132 ) ) ( not ( = ?auto_221130 ?auto_221131 ) ) ( not ( = ?auto_221130 ?auto_221132 ) ) ( not ( = ?auto_221131 ?auto_221132 ) ) ( ON ?auto_221130 ?auto_221131 ) ( CLEAR ?auto_221128 ) ( ON ?auto_221129 ?auto_221130 ) ( CLEAR ?auto_221129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_221121 ?auto_221122 ?auto_221123 ?auto_221124 ?auto_221125 ?auto_221126 ?auto_221127 ?auto_221128 ?auto_221129 )
      ( MAKE-11PILE ?auto_221121 ?auto_221122 ?auto_221123 ?auto_221124 ?auto_221125 ?auto_221126 ?auto_221127 ?auto_221128 ?auto_221129 ?auto_221130 ?auto_221131 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_221144 - BLOCK
      ?auto_221145 - BLOCK
      ?auto_221146 - BLOCK
      ?auto_221147 - BLOCK
      ?auto_221148 - BLOCK
      ?auto_221149 - BLOCK
      ?auto_221150 - BLOCK
      ?auto_221151 - BLOCK
      ?auto_221152 - BLOCK
      ?auto_221153 - BLOCK
      ?auto_221154 - BLOCK
    )
    :vars
    (
      ?auto_221155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221154 ?auto_221155 ) ( ON-TABLE ?auto_221144 ) ( ON ?auto_221145 ?auto_221144 ) ( ON ?auto_221146 ?auto_221145 ) ( ON ?auto_221147 ?auto_221146 ) ( ON ?auto_221148 ?auto_221147 ) ( ON ?auto_221149 ?auto_221148 ) ( ON ?auto_221150 ?auto_221149 ) ( ON ?auto_221151 ?auto_221150 ) ( not ( = ?auto_221144 ?auto_221145 ) ) ( not ( = ?auto_221144 ?auto_221146 ) ) ( not ( = ?auto_221144 ?auto_221147 ) ) ( not ( = ?auto_221144 ?auto_221148 ) ) ( not ( = ?auto_221144 ?auto_221149 ) ) ( not ( = ?auto_221144 ?auto_221150 ) ) ( not ( = ?auto_221144 ?auto_221151 ) ) ( not ( = ?auto_221144 ?auto_221152 ) ) ( not ( = ?auto_221144 ?auto_221153 ) ) ( not ( = ?auto_221144 ?auto_221154 ) ) ( not ( = ?auto_221144 ?auto_221155 ) ) ( not ( = ?auto_221145 ?auto_221146 ) ) ( not ( = ?auto_221145 ?auto_221147 ) ) ( not ( = ?auto_221145 ?auto_221148 ) ) ( not ( = ?auto_221145 ?auto_221149 ) ) ( not ( = ?auto_221145 ?auto_221150 ) ) ( not ( = ?auto_221145 ?auto_221151 ) ) ( not ( = ?auto_221145 ?auto_221152 ) ) ( not ( = ?auto_221145 ?auto_221153 ) ) ( not ( = ?auto_221145 ?auto_221154 ) ) ( not ( = ?auto_221145 ?auto_221155 ) ) ( not ( = ?auto_221146 ?auto_221147 ) ) ( not ( = ?auto_221146 ?auto_221148 ) ) ( not ( = ?auto_221146 ?auto_221149 ) ) ( not ( = ?auto_221146 ?auto_221150 ) ) ( not ( = ?auto_221146 ?auto_221151 ) ) ( not ( = ?auto_221146 ?auto_221152 ) ) ( not ( = ?auto_221146 ?auto_221153 ) ) ( not ( = ?auto_221146 ?auto_221154 ) ) ( not ( = ?auto_221146 ?auto_221155 ) ) ( not ( = ?auto_221147 ?auto_221148 ) ) ( not ( = ?auto_221147 ?auto_221149 ) ) ( not ( = ?auto_221147 ?auto_221150 ) ) ( not ( = ?auto_221147 ?auto_221151 ) ) ( not ( = ?auto_221147 ?auto_221152 ) ) ( not ( = ?auto_221147 ?auto_221153 ) ) ( not ( = ?auto_221147 ?auto_221154 ) ) ( not ( = ?auto_221147 ?auto_221155 ) ) ( not ( = ?auto_221148 ?auto_221149 ) ) ( not ( = ?auto_221148 ?auto_221150 ) ) ( not ( = ?auto_221148 ?auto_221151 ) ) ( not ( = ?auto_221148 ?auto_221152 ) ) ( not ( = ?auto_221148 ?auto_221153 ) ) ( not ( = ?auto_221148 ?auto_221154 ) ) ( not ( = ?auto_221148 ?auto_221155 ) ) ( not ( = ?auto_221149 ?auto_221150 ) ) ( not ( = ?auto_221149 ?auto_221151 ) ) ( not ( = ?auto_221149 ?auto_221152 ) ) ( not ( = ?auto_221149 ?auto_221153 ) ) ( not ( = ?auto_221149 ?auto_221154 ) ) ( not ( = ?auto_221149 ?auto_221155 ) ) ( not ( = ?auto_221150 ?auto_221151 ) ) ( not ( = ?auto_221150 ?auto_221152 ) ) ( not ( = ?auto_221150 ?auto_221153 ) ) ( not ( = ?auto_221150 ?auto_221154 ) ) ( not ( = ?auto_221150 ?auto_221155 ) ) ( not ( = ?auto_221151 ?auto_221152 ) ) ( not ( = ?auto_221151 ?auto_221153 ) ) ( not ( = ?auto_221151 ?auto_221154 ) ) ( not ( = ?auto_221151 ?auto_221155 ) ) ( not ( = ?auto_221152 ?auto_221153 ) ) ( not ( = ?auto_221152 ?auto_221154 ) ) ( not ( = ?auto_221152 ?auto_221155 ) ) ( not ( = ?auto_221153 ?auto_221154 ) ) ( not ( = ?auto_221153 ?auto_221155 ) ) ( not ( = ?auto_221154 ?auto_221155 ) ) ( ON ?auto_221153 ?auto_221154 ) ( CLEAR ?auto_221151 ) ( ON ?auto_221152 ?auto_221153 ) ( CLEAR ?auto_221152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_221144 ?auto_221145 ?auto_221146 ?auto_221147 ?auto_221148 ?auto_221149 ?auto_221150 ?auto_221151 ?auto_221152 )
      ( MAKE-11PILE ?auto_221144 ?auto_221145 ?auto_221146 ?auto_221147 ?auto_221148 ?auto_221149 ?auto_221150 ?auto_221151 ?auto_221152 ?auto_221153 ?auto_221154 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_221167 - BLOCK
      ?auto_221168 - BLOCK
      ?auto_221169 - BLOCK
      ?auto_221170 - BLOCK
      ?auto_221171 - BLOCK
      ?auto_221172 - BLOCK
      ?auto_221173 - BLOCK
      ?auto_221174 - BLOCK
      ?auto_221175 - BLOCK
      ?auto_221176 - BLOCK
      ?auto_221177 - BLOCK
    )
    :vars
    (
      ?auto_221178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221177 ?auto_221178 ) ( ON-TABLE ?auto_221167 ) ( ON ?auto_221168 ?auto_221167 ) ( ON ?auto_221169 ?auto_221168 ) ( ON ?auto_221170 ?auto_221169 ) ( ON ?auto_221171 ?auto_221170 ) ( ON ?auto_221172 ?auto_221171 ) ( ON ?auto_221173 ?auto_221172 ) ( not ( = ?auto_221167 ?auto_221168 ) ) ( not ( = ?auto_221167 ?auto_221169 ) ) ( not ( = ?auto_221167 ?auto_221170 ) ) ( not ( = ?auto_221167 ?auto_221171 ) ) ( not ( = ?auto_221167 ?auto_221172 ) ) ( not ( = ?auto_221167 ?auto_221173 ) ) ( not ( = ?auto_221167 ?auto_221174 ) ) ( not ( = ?auto_221167 ?auto_221175 ) ) ( not ( = ?auto_221167 ?auto_221176 ) ) ( not ( = ?auto_221167 ?auto_221177 ) ) ( not ( = ?auto_221167 ?auto_221178 ) ) ( not ( = ?auto_221168 ?auto_221169 ) ) ( not ( = ?auto_221168 ?auto_221170 ) ) ( not ( = ?auto_221168 ?auto_221171 ) ) ( not ( = ?auto_221168 ?auto_221172 ) ) ( not ( = ?auto_221168 ?auto_221173 ) ) ( not ( = ?auto_221168 ?auto_221174 ) ) ( not ( = ?auto_221168 ?auto_221175 ) ) ( not ( = ?auto_221168 ?auto_221176 ) ) ( not ( = ?auto_221168 ?auto_221177 ) ) ( not ( = ?auto_221168 ?auto_221178 ) ) ( not ( = ?auto_221169 ?auto_221170 ) ) ( not ( = ?auto_221169 ?auto_221171 ) ) ( not ( = ?auto_221169 ?auto_221172 ) ) ( not ( = ?auto_221169 ?auto_221173 ) ) ( not ( = ?auto_221169 ?auto_221174 ) ) ( not ( = ?auto_221169 ?auto_221175 ) ) ( not ( = ?auto_221169 ?auto_221176 ) ) ( not ( = ?auto_221169 ?auto_221177 ) ) ( not ( = ?auto_221169 ?auto_221178 ) ) ( not ( = ?auto_221170 ?auto_221171 ) ) ( not ( = ?auto_221170 ?auto_221172 ) ) ( not ( = ?auto_221170 ?auto_221173 ) ) ( not ( = ?auto_221170 ?auto_221174 ) ) ( not ( = ?auto_221170 ?auto_221175 ) ) ( not ( = ?auto_221170 ?auto_221176 ) ) ( not ( = ?auto_221170 ?auto_221177 ) ) ( not ( = ?auto_221170 ?auto_221178 ) ) ( not ( = ?auto_221171 ?auto_221172 ) ) ( not ( = ?auto_221171 ?auto_221173 ) ) ( not ( = ?auto_221171 ?auto_221174 ) ) ( not ( = ?auto_221171 ?auto_221175 ) ) ( not ( = ?auto_221171 ?auto_221176 ) ) ( not ( = ?auto_221171 ?auto_221177 ) ) ( not ( = ?auto_221171 ?auto_221178 ) ) ( not ( = ?auto_221172 ?auto_221173 ) ) ( not ( = ?auto_221172 ?auto_221174 ) ) ( not ( = ?auto_221172 ?auto_221175 ) ) ( not ( = ?auto_221172 ?auto_221176 ) ) ( not ( = ?auto_221172 ?auto_221177 ) ) ( not ( = ?auto_221172 ?auto_221178 ) ) ( not ( = ?auto_221173 ?auto_221174 ) ) ( not ( = ?auto_221173 ?auto_221175 ) ) ( not ( = ?auto_221173 ?auto_221176 ) ) ( not ( = ?auto_221173 ?auto_221177 ) ) ( not ( = ?auto_221173 ?auto_221178 ) ) ( not ( = ?auto_221174 ?auto_221175 ) ) ( not ( = ?auto_221174 ?auto_221176 ) ) ( not ( = ?auto_221174 ?auto_221177 ) ) ( not ( = ?auto_221174 ?auto_221178 ) ) ( not ( = ?auto_221175 ?auto_221176 ) ) ( not ( = ?auto_221175 ?auto_221177 ) ) ( not ( = ?auto_221175 ?auto_221178 ) ) ( not ( = ?auto_221176 ?auto_221177 ) ) ( not ( = ?auto_221176 ?auto_221178 ) ) ( not ( = ?auto_221177 ?auto_221178 ) ) ( ON ?auto_221176 ?auto_221177 ) ( ON ?auto_221175 ?auto_221176 ) ( CLEAR ?auto_221173 ) ( ON ?auto_221174 ?auto_221175 ) ( CLEAR ?auto_221174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_221167 ?auto_221168 ?auto_221169 ?auto_221170 ?auto_221171 ?auto_221172 ?auto_221173 ?auto_221174 )
      ( MAKE-11PILE ?auto_221167 ?auto_221168 ?auto_221169 ?auto_221170 ?auto_221171 ?auto_221172 ?auto_221173 ?auto_221174 ?auto_221175 ?auto_221176 ?auto_221177 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_221190 - BLOCK
      ?auto_221191 - BLOCK
      ?auto_221192 - BLOCK
      ?auto_221193 - BLOCK
      ?auto_221194 - BLOCK
      ?auto_221195 - BLOCK
      ?auto_221196 - BLOCK
      ?auto_221197 - BLOCK
      ?auto_221198 - BLOCK
      ?auto_221199 - BLOCK
      ?auto_221200 - BLOCK
    )
    :vars
    (
      ?auto_221201 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221200 ?auto_221201 ) ( ON-TABLE ?auto_221190 ) ( ON ?auto_221191 ?auto_221190 ) ( ON ?auto_221192 ?auto_221191 ) ( ON ?auto_221193 ?auto_221192 ) ( ON ?auto_221194 ?auto_221193 ) ( ON ?auto_221195 ?auto_221194 ) ( ON ?auto_221196 ?auto_221195 ) ( not ( = ?auto_221190 ?auto_221191 ) ) ( not ( = ?auto_221190 ?auto_221192 ) ) ( not ( = ?auto_221190 ?auto_221193 ) ) ( not ( = ?auto_221190 ?auto_221194 ) ) ( not ( = ?auto_221190 ?auto_221195 ) ) ( not ( = ?auto_221190 ?auto_221196 ) ) ( not ( = ?auto_221190 ?auto_221197 ) ) ( not ( = ?auto_221190 ?auto_221198 ) ) ( not ( = ?auto_221190 ?auto_221199 ) ) ( not ( = ?auto_221190 ?auto_221200 ) ) ( not ( = ?auto_221190 ?auto_221201 ) ) ( not ( = ?auto_221191 ?auto_221192 ) ) ( not ( = ?auto_221191 ?auto_221193 ) ) ( not ( = ?auto_221191 ?auto_221194 ) ) ( not ( = ?auto_221191 ?auto_221195 ) ) ( not ( = ?auto_221191 ?auto_221196 ) ) ( not ( = ?auto_221191 ?auto_221197 ) ) ( not ( = ?auto_221191 ?auto_221198 ) ) ( not ( = ?auto_221191 ?auto_221199 ) ) ( not ( = ?auto_221191 ?auto_221200 ) ) ( not ( = ?auto_221191 ?auto_221201 ) ) ( not ( = ?auto_221192 ?auto_221193 ) ) ( not ( = ?auto_221192 ?auto_221194 ) ) ( not ( = ?auto_221192 ?auto_221195 ) ) ( not ( = ?auto_221192 ?auto_221196 ) ) ( not ( = ?auto_221192 ?auto_221197 ) ) ( not ( = ?auto_221192 ?auto_221198 ) ) ( not ( = ?auto_221192 ?auto_221199 ) ) ( not ( = ?auto_221192 ?auto_221200 ) ) ( not ( = ?auto_221192 ?auto_221201 ) ) ( not ( = ?auto_221193 ?auto_221194 ) ) ( not ( = ?auto_221193 ?auto_221195 ) ) ( not ( = ?auto_221193 ?auto_221196 ) ) ( not ( = ?auto_221193 ?auto_221197 ) ) ( not ( = ?auto_221193 ?auto_221198 ) ) ( not ( = ?auto_221193 ?auto_221199 ) ) ( not ( = ?auto_221193 ?auto_221200 ) ) ( not ( = ?auto_221193 ?auto_221201 ) ) ( not ( = ?auto_221194 ?auto_221195 ) ) ( not ( = ?auto_221194 ?auto_221196 ) ) ( not ( = ?auto_221194 ?auto_221197 ) ) ( not ( = ?auto_221194 ?auto_221198 ) ) ( not ( = ?auto_221194 ?auto_221199 ) ) ( not ( = ?auto_221194 ?auto_221200 ) ) ( not ( = ?auto_221194 ?auto_221201 ) ) ( not ( = ?auto_221195 ?auto_221196 ) ) ( not ( = ?auto_221195 ?auto_221197 ) ) ( not ( = ?auto_221195 ?auto_221198 ) ) ( not ( = ?auto_221195 ?auto_221199 ) ) ( not ( = ?auto_221195 ?auto_221200 ) ) ( not ( = ?auto_221195 ?auto_221201 ) ) ( not ( = ?auto_221196 ?auto_221197 ) ) ( not ( = ?auto_221196 ?auto_221198 ) ) ( not ( = ?auto_221196 ?auto_221199 ) ) ( not ( = ?auto_221196 ?auto_221200 ) ) ( not ( = ?auto_221196 ?auto_221201 ) ) ( not ( = ?auto_221197 ?auto_221198 ) ) ( not ( = ?auto_221197 ?auto_221199 ) ) ( not ( = ?auto_221197 ?auto_221200 ) ) ( not ( = ?auto_221197 ?auto_221201 ) ) ( not ( = ?auto_221198 ?auto_221199 ) ) ( not ( = ?auto_221198 ?auto_221200 ) ) ( not ( = ?auto_221198 ?auto_221201 ) ) ( not ( = ?auto_221199 ?auto_221200 ) ) ( not ( = ?auto_221199 ?auto_221201 ) ) ( not ( = ?auto_221200 ?auto_221201 ) ) ( ON ?auto_221199 ?auto_221200 ) ( ON ?auto_221198 ?auto_221199 ) ( CLEAR ?auto_221196 ) ( ON ?auto_221197 ?auto_221198 ) ( CLEAR ?auto_221197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_221190 ?auto_221191 ?auto_221192 ?auto_221193 ?auto_221194 ?auto_221195 ?auto_221196 ?auto_221197 )
      ( MAKE-11PILE ?auto_221190 ?auto_221191 ?auto_221192 ?auto_221193 ?auto_221194 ?auto_221195 ?auto_221196 ?auto_221197 ?auto_221198 ?auto_221199 ?auto_221200 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_221213 - BLOCK
      ?auto_221214 - BLOCK
      ?auto_221215 - BLOCK
      ?auto_221216 - BLOCK
      ?auto_221217 - BLOCK
      ?auto_221218 - BLOCK
      ?auto_221219 - BLOCK
      ?auto_221220 - BLOCK
      ?auto_221221 - BLOCK
      ?auto_221222 - BLOCK
      ?auto_221223 - BLOCK
    )
    :vars
    (
      ?auto_221224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221223 ?auto_221224 ) ( ON-TABLE ?auto_221213 ) ( ON ?auto_221214 ?auto_221213 ) ( ON ?auto_221215 ?auto_221214 ) ( ON ?auto_221216 ?auto_221215 ) ( ON ?auto_221217 ?auto_221216 ) ( ON ?auto_221218 ?auto_221217 ) ( not ( = ?auto_221213 ?auto_221214 ) ) ( not ( = ?auto_221213 ?auto_221215 ) ) ( not ( = ?auto_221213 ?auto_221216 ) ) ( not ( = ?auto_221213 ?auto_221217 ) ) ( not ( = ?auto_221213 ?auto_221218 ) ) ( not ( = ?auto_221213 ?auto_221219 ) ) ( not ( = ?auto_221213 ?auto_221220 ) ) ( not ( = ?auto_221213 ?auto_221221 ) ) ( not ( = ?auto_221213 ?auto_221222 ) ) ( not ( = ?auto_221213 ?auto_221223 ) ) ( not ( = ?auto_221213 ?auto_221224 ) ) ( not ( = ?auto_221214 ?auto_221215 ) ) ( not ( = ?auto_221214 ?auto_221216 ) ) ( not ( = ?auto_221214 ?auto_221217 ) ) ( not ( = ?auto_221214 ?auto_221218 ) ) ( not ( = ?auto_221214 ?auto_221219 ) ) ( not ( = ?auto_221214 ?auto_221220 ) ) ( not ( = ?auto_221214 ?auto_221221 ) ) ( not ( = ?auto_221214 ?auto_221222 ) ) ( not ( = ?auto_221214 ?auto_221223 ) ) ( not ( = ?auto_221214 ?auto_221224 ) ) ( not ( = ?auto_221215 ?auto_221216 ) ) ( not ( = ?auto_221215 ?auto_221217 ) ) ( not ( = ?auto_221215 ?auto_221218 ) ) ( not ( = ?auto_221215 ?auto_221219 ) ) ( not ( = ?auto_221215 ?auto_221220 ) ) ( not ( = ?auto_221215 ?auto_221221 ) ) ( not ( = ?auto_221215 ?auto_221222 ) ) ( not ( = ?auto_221215 ?auto_221223 ) ) ( not ( = ?auto_221215 ?auto_221224 ) ) ( not ( = ?auto_221216 ?auto_221217 ) ) ( not ( = ?auto_221216 ?auto_221218 ) ) ( not ( = ?auto_221216 ?auto_221219 ) ) ( not ( = ?auto_221216 ?auto_221220 ) ) ( not ( = ?auto_221216 ?auto_221221 ) ) ( not ( = ?auto_221216 ?auto_221222 ) ) ( not ( = ?auto_221216 ?auto_221223 ) ) ( not ( = ?auto_221216 ?auto_221224 ) ) ( not ( = ?auto_221217 ?auto_221218 ) ) ( not ( = ?auto_221217 ?auto_221219 ) ) ( not ( = ?auto_221217 ?auto_221220 ) ) ( not ( = ?auto_221217 ?auto_221221 ) ) ( not ( = ?auto_221217 ?auto_221222 ) ) ( not ( = ?auto_221217 ?auto_221223 ) ) ( not ( = ?auto_221217 ?auto_221224 ) ) ( not ( = ?auto_221218 ?auto_221219 ) ) ( not ( = ?auto_221218 ?auto_221220 ) ) ( not ( = ?auto_221218 ?auto_221221 ) ) ( not ( = ?auto_221218 ?auto_221222 ) ) ( not ( = ?auto_221218 ?auto_221223 ) ) ( not ( = ?auto_221218 ?auto_221224 ) ) ( not ( = ?auto_221219 ?auto_221220 ) ) ( not ( = ?auto_221219 ?auto_221221 ) ) ( not ( = ?auto_221219 ?auto_221222 ) ) ( not ( = ?auto_221219 ?auto_221223 ) ) ( not ( = ?auto_221219 ?auto_221224 ) ) ( not ( = ?auto_221220 ?auto_221221 ) ) ( not ( = ?auto_221220 ?auto_221222 ) ) ( not ( = ?auto_221220 ?auto_221223 ) ) ( not ( = ?auto_221220 ?auto_221224 ) ) ( not ( = ?auto_221221 ?auto_221222 ) ) ( not ( = ?auto_221221 ?auto_221223 ) ) ( not ( = ?auto_221221 ?auto_221224 ) ) ( not ( = ?auto_221222 ?auto_221223 ) ) ( not ( = ?auto_221222 ?auto_221224 ) ) ( not ( = ?auto_221223 ?auto_221224 ) ) ( ON ?auto_221222 ?auto_221223 ) ( ON ?auto_221221 ?auto_221222 ) ( ON ?auto_221220 ?auto_221221 ) ( CLEAR ?auto_221218 ) ( ON ?auto_221219 ?auto_221220 ) ( CLEAR ?auto_221219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_221213 ?auto_221214 ?auto_221215 ?auto_221216 ?auto_221217 ?auto_221218 ?auto_221219 )
      ( MAKE-11PILE ?auto_221213 ?auto_221214 ?auto_221215 ?auto_221216 ?auto_221217 ?auto_221218 ?auto_221219 ?auto_221220 ?auto_221221 ?auto_221222 ?auto_221223 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_221236 - BLOCK
      ?auto_221237 - BLOCK
      ?auto_221238 - BLOCK
      ?auto_221239 - BLOCK
      ?auto_221240 - BLOCK
      ?auto_221241 - BLOCK
      ?auto_221242 - BLOCK
      ?auto_221243 - BLOCK
      ?auto_221244 - BLOCK
      ?auto_221245 - BLOCK
      ?auto_221246 - BLOCK
    )
    :vars
    (
      ?auto_221247 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221246 ?auto_221247 ) ( ON-TABLE ?auto_221236 ) ( ON ?auto_221237 ?auto_221236 ) ( ON ?auto_221238 ?auto_221237 ) ( ON ?auto_221239 ?auto_221238 ) ( ON ?auto_221240 ?auto_221239 ) ( ON ?auto_221241 ?auto_221240 ) ( not ( = ?auto_221236 ?auto_221237 ) ) ( not ( = ?auto_221236 ?auto_221238 ) ) ( not ( = ?auto_221236 ?auto_221239 ) ) ( not ( = ?auto_221236 ?auto_221240 ) ) ( not ( = ?auto_221236 ?auto_221241 ) ) ( not ( = ?auto_221236 ?auto_221242 ) ) ( not ( = ?auto_221236 ?auto_221243 ) ) ( not ( = ?auto_221236 ?auto_221244 ) ) ( not ( = ?auto_221236 ?auto_221245 ) ) ( not ( = ?auto_221236 ?auto_221246 ) ) ( not ( = ?auto_221236 ?auto_221247 ) ) ( not ( = ?auto_221237 ?auto_221238 ) ) ( not ( = ?auto_221237 ?auto_221239 ) ) ( not ( = ?auto_221237 ?auto_221240 ) ) ( not ( = ?auto_221237 ?auto_221241 ) ) ( not ( = ?auto_221237 ?auto_221242 ) ) ( not ( = ?auto_221237 ?auto_221243 ) ) ( not ( = ?auto_221237 ?auto_221244 ) ) ( not ( = ?auto_221237 ?auto_221245 ) ) ( not ( = ?auto_221237 ?auto_221246 ) ) ( not ( = ?auto_221237 ?auto_221247 ) ) ( not ( = ?auto_221238 ?auto_221239 ) ) ( not ( = ?auto_221238 ?auto_221240 ) ) ( not ( = ?auto_221238 ?auto_221241 ) ) ( not ( = ?auto_221238 ?auto_221242 ) ) ( not ( = ?auto_221238 ?auto_221243 ) ) ( not ( = ?auto_221238 ?auto_221244 ) ) ( not ( = ?auto_221238 ?auto_221245 ) ) ( not ( = ?auto_221238 ?auto_221246 ) ) ( not ( = ?auto_221238 ?auto_221247 ) ) ( not ( = ?auto_221239 ?auto_221240 ) ) ( not ( = ?auto_221239 ?auto_221241 ) ) ( not ( = ?auto_221239 ?auto_221242 ) ) ( not ( = ?auto_221239 ?auto_221243 ) ) ( not ( = ?auto_221239 ?auto_221244 ) ) ( not ( = ?auto_221239 ?auto_221245 ) ) ( not ( = ?auto_221239 ?auto_221246 ) ) ( not ( = ?auto_221239 ?auto_221247 ) ) ( not ( = ?auto_221240 ?auto_221241 ) ) ( not ( = ?auto_221240 ?auto_221242 ) ) ( not ( = ?auto_221240 ?auto_221243 ) ) ( not ( = ?auto_221240 ?auto_221244 ) ) ( not ( = ?auto_221240 ?auto_221245 ) ) ( not ( = ?auto_221240 ?auto_221246 ) ) ( not ( = ?auto_221240 ?auto_221247 ) ) ( not ( = ?auto_221241 ?auto_221242 ) ) ( not ( = ?auto_221241 ?auto_221243 ) ) ( not ( = ?auto_221241 ?auto_221244 ) ) ( not ( = ?auto_221241 ?auto_221245 ) ) ( not ( = ?auto_221241 ?auto_221246 ) ) ( not ( = ?auto_221241 ?auto_221247 ) ) ( not ( = ?auto_221242 ?auto_221243 ) ) ( not ( = ?auto_221242 ?auto_221244 ) ) ( not ( = ?auto_221242 ?auto_221245 ) ) ( not ( = ?auto_221242 ?auto_221246 ) ) ( not ( = ?auto_221242 ?auto_221247 ) ) ( not ( = ?auto_221243 ?auto_221244 ) ) ( not ( = ?auto_221243 ?auto_221245 ) ) ( not ( = ?auto_221243 ?auto_221246 ) ) ( not ( = ?auto_221243 ?auto_221247 ) ) ( not ( = ?auto_221244 ?auto_221245 ) ) ( not ( = ?auto_221244 ?auto_221246 ) ) ( not ( = ?auto_221244 ?auto_221247 ) ) ( not ( = ?auto_221245 ?auto_221246 ) ) ( not ( = ?auto_221245 ?auto_221247 ) ) ( not ( = ?auto_221246 ?auto_221247 ) ) ( ON ?auto_221245 ?auto_221246 ) ( ON ?auto_221244 ?auto_221245 ) ( ON ?auto_221243 ?auto_221244 ) ( CLEAR ?auto_221241 ) ( ON ?auto_221242 ?auto_221243 ) ( CLEAR ?auto_221242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_221236 ?auto_221237 ?auto_221238 ?auto_221239 ?auto_221240 ?auto_221241 ?auto_221242 )
      ( MAKE-11PILE ?auto_221236 ?auto_221237 ?auto_221238 ?auto_221239 ?auto_221240 ?auto_221241 ?auto_221242 ?auto_221243 ?auto_221244 ?auto_221245 ?auto_221246 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_221259 - BLOCK
      ?auto_221260 - BLOCK
      ?auto_221261 - BLOCK
      ?auto_221262 - BLOCK
      ?auto_221263 - BLOCK
      ?auto_221264 - BLOCK
      ?auto_221265 - BLOCK
      ?auto_221266 - BLOCK
      ?auto_221267 - BLOCK
      ?auto_221268 - BLOCK
      ?auto_221269 - BLOCK
    )
    :vars
    (
      ?auto_221270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221269 ?auto_221270 ) ( ON-TABLE ?auto_221259 ) ( ON ?auto_221260 ?auto_221259 ) ( ON ?auto_221261 ?auto_221260 ) ( ON ?auto_221262 ?auto_221261 ) ( ON ?auto_221263 ?auto_221262 ) ( not ( = ?auto_221259 ?auto_221260 ) ) ( not ( = ?auto_221259 ?auto_221261 ) ) ( not ( = ?auto_221259 ?auto_221262 ) ) ( not ( = ?auto_221259 ?auto_221263 ) ) ( not ( = ?auto_221259 ?auto_221264 ) ) ( not ( = ?auto_221259 ?auto_221265 ) ) ( not ( = ?auto_221259 ?auto_221266 ) ) ( not ( = ?auto_221259 ?auto_221267 ) ) ( not ( = ?auto_221259 ?auto_221268 ) ) ( not ( = ?auto_221259 ?auto_221269 ) ) ( not ( = ?auto_221259 ?auto_221270 ) ) ( not ( = ?auto_221260 ?auto_221261 ) ) ( not ( = ?auto_221260 ?auto_221262 ) ) ( not ( = ?auto_221260 ?auto_221263 ) ) ( not ( = ?auto_221260 ?auto_221264 ) ) ( not ( = ?auto_221260 ?auto_221265 ) ) ( not ( = ?auto_221260 ?auto_221266 ) ) ( not ( = ?auto_221260 ?auto_221267 ) ) ( not ( = ?auto_221260 ?auto_221268 ) ) ( not ( = ?auto_221260 ?auto_221269 ) ) ( not ( = ?auto_221260 ?auto_221270 ) ) ( not ( = ?auto_221261 ?auto_221262 ) ) ( not ( = ?auto_221261 ?auto_221263 ) ) ( not ( = ?auto_221261 ?auto_221264 ) ) ( not ( = ?auto_221261 ?auto_221265 ) ) ( not ( = ?auto_221261 ?auto_221266 ) ) ( not ( = ?auto_221261 ?auto_221267 ) ) ( not ( = ?auto_221261 ?auto_221268 ) ) ( not ( = ?auto_221261 ?auto_221269 ) ) ( not ( = ?auto_221261 ?auto_221270 ) ) ( not ( = ?auto_221262 ?auto_221263 ) ) ( not ( = ?auto_221262 ?auto_221264 ) ) ( not ( = ?auto_221262 ?auto_221265 ) ) ( not ( = ?auto_221262 ?auto_221266 ) ) ( not ( = ?auto_221262 ?auto_221267 ) ) ( not ( = ?auto_221262 ?auto_221268 ) ) ( not ( = ?auto_221262 ?auto_221269 ) ) ( not ( = ?auto_221262 ?auto_221270 ) ) ( not ( = ?auto_221263 ?auto_221264 ) ) ( not ( = ?auto_221263 ?auto_221265 ) ) ( not ( = ?auto_221263 ?auto_221266 ) ) ( not ( = ?auto_221263 ?auto_221267 ) ) ( not ( = ?auto_221263 ?auto_221268 ) ) ( not ( = ?auto_221263 ?auto_221269 ) ) ( not ( = ?auto_221263 ?auto_221270 ) ) ( not ( = ?auto_221264 ?auto_221265 ) ) ( not ( = ?auto_221264 ?auto_221266 ) ) ( not ( = ?auto_221264 ?auto_221267 ) ) ( not ( = ?auto_221264 ?auto_221268 ) ) ( not ( = ?auto_221264 ?auto_221269 ) ) ( not ( = ?auto_221264 ?auto_221270 ) ) ( not ( = ?auto_221265 ?auto_221266 ) ) ( not ( = ?auto_221265 ?auto_221267 ) ) ( not ( = ?auto_221265 ?auto_221268 ) ) ( not ( = ?auto_221265 ?auto_221269 ) ) ( not ( = ?auto_221265 ?auto_221270 ) ) ( not ( = ?auto_221266 ?auto_221267 ) ) ( not ( = ?auto_221266 ?auto_221268 ) ) ( not ( = ?auto_221266 ?auto_221269 ) ) ( not ( = ?auto_221266 ?auto_221270 ) ) ( not ( = ?auto_221267 ?auto_221268 ) ) ( not ( = ?auto_221267 ?auto_221269 ) ) ( not ( = ?auto_221267 ?auto_221270 ) ) ( not ( = ?auto_221268 ?auto_221269 ) ) ( not ( = ?auto_221268 ?auto_221270 ) ) ( not ( = ?auto_221269 ?auto_221270 ) ) ( ON ?auto_221268 ?auto_221269 ) ( ON ?auto_221267 ?auto_221268 ) ( ON ?auto_221266 ?auto_221267 ) ( ON ?auto_221265 ?auto_221266 ) ( CLEAR ?auto_221263 ) ( ON ?auto_221264 ?auto_221265 ) ( CLEAR ?auto_221264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_221259 ?auto_221260 ?auto_221261 ?auto_221262 ?auto_221263 ?auto_221264 )
      ( MAKE-11PILE ?auto_221259 ?auto_221260 ?auto_221261 ?auto_221262 ?auto_221263 ?auto_221264 ?auto_221265 ?auto_221266 ?auto_221267 ?auto_221268 ?auto_221269 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_221282 - BLOCK
      ?auto_221283 - BLOCK
      ?auto_221284 - BLOCK
      ?auto_221285 - BLOCK
      ?auto_221286 - BLOCK
      ?auto_221287 - BLOCK
      ?auto_221288 - BLOCK
      ?auto_221289 - BLOCK
      ?auto_221290 - BLOCK
      ?auto_221291 - BLOCK
      ?auto_221292 - BLOCK
    )
    :vars
    (
      ?auto_221293 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221292 ?auto_221293 ) ( ON-TABLE ?auto_221282 ) ( ON ?auto_221283 ?auto_221282 ) ( ON ?auto_221284 ?auto_221283 ) ( ON ?auto_221285 ?auto_221284 ) ( ON ?auto_221286 ?auto_221285 ) ( not ( = ?auto_221282 ?auto_221283 ) ) ( not ( = ?auto_221282 ?auto_221284 ) ) ( not ( = ?auto_221282 ?auto_221285 ) ) ( not ( = ?auto_221282 ?auto_221286 ) ) ( not ( = ?auto_221282 ?auto_221287 ) ) ( not ( = ?auto_221282 ?auto_221288 ) ) ( not ( = ?auto_221282 ?auto_221289 ) ) ( not ( = ?auto_221282 ?auto_221290 ) ) ( not ( = ?auto_221282 ?auto_221291 ) ) ( not ( = ?auto_221282 ?auto_221292 ) ) ( not ( = ?auto_221282 ?auto_221293 ) ) ( not ( = ?auto_221283 ?auto_221284 ) ) ( not ( = ?auto_221283 ?auto_221285 ) ) ( not ( = ?auto_221283 ?auto_221286 ) ) ( not ( = ?auto_221283 ?auto_221287 ) ) ( not ( = ?auto_221283 ?auto_221288 ) ) ( not ( = ?auto_221283 ?auto_221289 ) ) ( not ( = ?auto_221283 ?auto_221290 ) ) ( not ( = ?auto_221283 ?auto_221291 ) ) ( not ( = ?auto_221283 ?auto_221292 ) ) ( not ( = ?auto_221283 ?auto_221293 ) ) ( not ( = ?auto_221284 ?auto_221285 ) ) ( not ( = ?auto_221284 ?auto_221286 ) ) ( not ( = ?auto_221284 ?auto_221287 ) ) ( not ( = ?auto_221284 ?auto_221288 ) ) ( not ( = ?auto_221284 ?auto_221289 ) ) ( not ( = ?auto_221284 ?auto_221290 ) ) ( not ( = ?auto_221284 ?auto_221291 ) ) ( not ( = ?auto_221284 ?auto_221292 ) ) ( not ( = ?auto_221284 ?auto_221293 ) ) ( not ( = ?auto_221285 ?auto_221286 ) ) ( not ( = ?auto_221285 ?auto_221287 ) ) ( not ( = ?auto_221285 ?auto_221288 ) ) ( not ( = ?auto_221285 ?auto_221289 ) ) ( not ( = ?auto_221285 ?auto_221290 ) ) ( not ( = ?auto_221285 ?auto_221291 ) ) ( not ( = ?auto_221285 ?auto_221292 ) ) ( not ( = ?auto_221285 ?auto_221293 ) ) ( not ( = ?auto_221286 ?auto_221287 ) ) ( not ( = ?auto_221286 ?auto_221288 ) ) ( not ( = ?auto_221286 ?auto_221289 ) ) ( not ( = ?auto_221286 ?auto_221290 ) ) ( not ( = ?auto_221286 ?auto_221291 ) ) ( not ( = ?auto_221286 ?auto_221292 ) ) ( not ( = ?auto_221286 ?auto_221293 ) ) ( not ( = ?auto_221287 ?auto_221288 ) ) ( not ( = ?auto_221287 ?auto_221289 ) ) ( not ( = ?auto_221287 ?auto_221290 ) ) ( not ( = ?auto_221287 ?auto_221291 ) ) ( not ( = ?auto_221287 ?auto_221292 ) ) ( not ( = ?auto_221287 ?auto_221293 ) ) ( not ( = ?auto_221288 ?auto_221289 ) ) ( not ( = ?auto_221288 ?auto_221290 ) ) ( not ( = ?auto_221288 ?auto_221291 ) ) ( not ( = ?auto_221288 ?auto_221292 ) ) ( not ( = ?auto_221288 ?auto_221293 ) ) ( not ( = ?auto_221289 ?auto_221290 ) ) ( not ( = ?auto_221289 ?auto_221291 ) ) ( not ( = ?auto_221289 ?auto_221292 ) ) ( not ( = ?auto_221289 ?auto_221293 ) ) ( not ( = ?auto_221290 ?auto_221291 ) ) ( not ( = ?auto_221290 ?auto_221292 ) ) ( not ( = ?auto_221290 ?auto_221293 ) ) ( not ( = ?auto_221291 ?auto_221292 ) ) ( not ( = ?auto_221291 ?auto_221293 ) ) ( not ( = ?auto_221292 ?auto_221293 ) ) ( ON ?auto_221291 ?auto_221292 ) ( ON ?auto_221290 ?auto_221291 ) ( ON ?auto_221289 ?auto_221290 ) ( ON ?auto_221288 ?auto_221289 ) ( CLEAR ?auto_221286 ) ( ON ?auto_221287 ?auto_221288 ) ( CLEAR ?auto_221287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_221282 ?auto_221283 ?auto_221284 ?auto_221285 ?auto_221286 ?auto_221287 )
      ( MAKE-11PILE ?auto_221282 ?auto_221283 ?auto_221284 ?auto_221285 ?auto_221286 ?auto_221287 ?auto_221288 ?auto_221289 ?auto_221290 ?auto_221291 ?auto_221292 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_221305 - BLOCK
      ?auto_221306 - BLOCK
      ?auto_221307 - BLOCK
      ?auto_221308 - BLOCK
      ?auto_221309 - BLOCK
      ?auto_221310 - BLOCK
      ?auto_221311 - BLOCK
      ?auto_221312 - BLOCK
      ?auto_221313 - BLOCK
      ?auto_221314 - BLOCK
      ?auto_221315 - BLOCK
    )
    :vars
    (
      ?auto_221316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221315 ?auto_221316 ) ( ON-TABLE ?auto_221305 ) ( ON ?auto_221306 ?auto_221305 ) ( ON ?auto_221307 ?auto_221306 ) ( ON ?auto_221308 ?auto_221307 ) ( not ( = ?auto_221305 ?auto_221306 ) ) ( not ( = ?auto_221305 ?auto_221307 ) ) ( not ( = ?auto_221305 ?auto_221308 ) ) ( not ( = ?auto_221305 ?auto_221309 ) ) ( not ( = ?auto_221305 ?auto_221310 ) ) ( not ( = ?auto_221305 ?auto_221311 ) ) ( not ( = ?auto_221305 ?auto_221312 ) ) ( not ( = ?auto_221305 ?auto_221313 ) ) ( not ( = ?auto_221305 ?auto_221314 ) ) ( not ( = ?auto_221305 ?auto_221315 ) ) ( not ( = ?auto_221305 ?auto_221316 ) ) ( not ( = ?auto_221306 ?auto_221307 ) ) ( not ( = ?auto_221306 ?auto_221308 ) ) ( not ( = ?auto_221306 ?auto_221309 ) ) ( not ( = ?auto_221306 ?auto_221310 ) ) ( not ( = ?auto_221306 ?auto_221311 ) ) ( not ( = ?auto_221306 ?auto_221312 ) ) ( not ( = ?auto_221306 ?auto_221313 ) ) ( not ( = ?auto_221306 ?auto_221314 ) ) ( not ( = ?auto_221306 ?auto_221315 ) ) ( not ( = ?auto_221306 ?auto_221316 ) ) ( not ( = ?auto_221307 ?auto_221308 ) ) ( not ( = ?auto_221307 ?auto_221309 ) ) ( not ( = ?auto_221307 ?auto_221310 ) ) ( not ( = ?auto_221307 ?auto_221311 ) ) ( not ( = ?auto_221307 ?auto_221312 ) ) ( not ( = ?auto_221307 ?auto_221313 ) ) ( not ( = ?auto_221307 ?auto_221314 ) ) ( not ( = ?auto_221307 ?auto_221315 ) ) ( not ( = ?auto_221307 ?auto_221316 ) ) ( not ( = ?auto_221308 ?auto_221309 ) ) ( not ( = ?auto_221308 ?auto_221310 ) ) ( not ( = ?auto_221308 ?auto_221311 ) ) ( not ( = ?auto_221308 ?auto_221312 ) ) ( not ( = ?auto_221308 ?auto_221313 ) ) ( not ( = ?auto_221308 ?auto_221314 ) ) ( not ( = ?auto_221308 ?auto_221315 ) ) ( not ( = ?auto_221308 ?auto_221316 ) ) ( not ( = ?auto_221309 ?auto_221310 ) ) ( not ( = ?auto_221309 ?auto_221311 ) ) ( not ( = ?auto_221309 ?auto_221312 ) ) ( not ( = ?auto_221309 ?auto_221313 ) ) ( not ( = ?auto_221309 ?auto_221314 ) ) ( not ( = ?auto_221309 ?auto_221315 ) ) ( not ( = ?auto_221309 ?auto_221316 ) ) ( not ( = ?auto_221310 ?auto_221311 ) ) ( not ( = ?auto_221310 ?auto_221312 ) ) ( not ( = ?auto_221310 ?auto_221313 ) ) ( not ( = ?auto_221310 ?auto_221314 ) ) ( not ( = ?auto_221310 ?auto_221315 ) ) ( not ( = ?auto_221310 ?auto_221316 ) ) ( not ( = ?auto_221311 ?auto_221312 ) ) ( not ( = ?auto_221311 ?auto_221313 ) ) ( not ( = ?auto_221311 ?auto_221314 ) ) ( not ( = ?auto_221311 ?auto_221315 ) ) ( not ( = ?auto_221311 ?auto_221316 ) ) ( not ( = ?auto_221312 ?auto_221313 ) ) ( not ( = ?auto_221312 ?auto_221314 ) ) ( not ( = ?auto_221312 ?auto_221315 ) ) ( not ( = ?auto_221312 ?auto_221316 ) ) ( not ( = ?auto_221313 ?auto_221314 ) ) ( not ( = ?auto_221313 ?auto_221315 ) ) ( not ( = ?auto_221313 ?auto_221316 ) ) ( not ( = ?auto_221314 ?auto_221315 ) ) ( not ( = ?auto_221314 ?auto_221316 ) ) ( not ( = ?auto_221315 ?auto_221316 ) ) ( ON ?auto_221314 ?auto_221315 ) ( ON ?auto_221313 ?auto_221314 ) ( ON ?auto_221312 ?auto_221313 ) ( ON ?auto_221311 ?auto_221312 ) ( ON ?auto_221310 ?auto_221311 ) ( CLEAR ?auto_221308 ) ( ON ?auto_221309 ?auto_221310 ) ( CLEAR ?auto_221309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_221305 ?auto_221306 ?auto_221307 ?auto_221308 ?auto_221309 )
      ( MAKE-11PILE ?auto_221305 ?auto_221306 ?auto_221307 ?auto_221308 ?auto_221309 ?auto_221310 ?auto_221311 ?auto_221312 ?auto_221313 ?auto_221314 ?auto_221315 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_221328 - BLOCK
      ?auto_221329 - BLOCK
      ?auto_221330 - BLOCK
      ?auto_221331 - BLOCK
      ?auto_221332 - BLOCK
      ?auto_221333 - BLOCK
      ?auto_221334 - BLOCK
      ?auto_221335 - BLOCK
      ?auto_221336 - BLOCK
      ?auto_221337 - BLOCK
      ?auto_221338 - BLOCK
    )
    :vars
    (
      ?auto_221339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221338 ?auto_221339 ) ( ON-TABLE ?auto_221328 ) ( ON ?auto_221329 ?auto_221328 ) ( ON ?auto_221330 ?auto_221329 ) ( ON ?auto_221331 ?auto_221330 ) ( not ( = ?auto_221328 ?auto_221329 ) ) ( not ( = ?auto_221328 ?auto_221330 ) ) ( not ( = ?auto_221328 ?auto_221331 ) ) ( not ( = ?auto_221328 ?auto_221332 ) ) ( not ( = ?auto_221328 ?auto_221333 ) ) ( not ( = ?auto_221328 ?auto_221334 ) ) ( not ( = ?auto_221328 ?auto_221335 ) ) ( not ( = ?auto_221328 ?auto_221336 ) ) ( not ( = ?auto_221328 ?auto_221337 ) ) ( not ( = ?auto_221328 ?auto_221338 ) ) ( not ( = ?auto_221328 ?auto_221339 ) ) ( not ( = ?auto_221329 ?auto_221330 ) ) ( not ( = ?auto_221329 ?auto_221331 ) ) ( not ( = ?auto_221329 ?auto_221332 ) ) ( not ( = ?auto_221329 ?auto_221333 ) ) ( not ( = ?auto_221329 ?auto_221334 ) ) ( not ( = ?auto_221329 ?auto_221335 ) ) ( not ( = ?auto_221329 ?auto_221336 ) ) ( not ( = ?auto_221329 ?auto_221337 ) ) ( not ( = ?auto_221329 ?auto_221338 ) ) ( not ( = ?auto_221329 ?auto_221339 ) ) ( not ( = ?auto_221330 ?auto_221331 ) ) ( not ( = ?auto_221330 ?auto_221332 ) ) ( not ( = ?auto_221330 ?auto_221333 ) ) ( not ( = ?auto_221330 ?auto_221334 ) ) ( not ( = ?auto_221330 ?auto_221335 ) ) ( not ( = ?auto_221330 ?auto_221336 ) ) ( not ( = ?auto_221330 ?auto_221337 ) ) ( not ( = ?auto_221330 ?auto_221338 ) ) ( not ( = ?auto_221330 ?auto_221339 ) ) ( not ( = ?auto_221331 ?auto_221332 ) ) ( not ( = ?auto_221331 ?auto_221333 ) ) ( not ( = ?auto_221331 ?auto_221334 ) ) ( not ( = ?auto_221331 ?auto_221335 ) ) ( not ( = ?auto_221331 ?auto_221336 ) ) ( not ( = ?auto_221331 ?auto_221337 ) ) ( not ( = ?auto_221331 ?auto_221338 ) ) ( not ( = ?auto_221331 ?auto_221339 ) ) ( not ( = ?auto_221332 ?auto_221333 ) ) ( not ( = ?auto_221332 ?auto_221334 ) ) ( not ( = ?auto_221332 ?auto_221335 ) ) ( not ( = ?auto_221332 ?auto_221336 ) ) ( not ( = ?auto_221332 ?auto_221337 ) ) ( not ( = ?auto_221332 ?auto_221338 ) ) ( not ( = ?auto_221332 ?auto_221339 ) ) ( not ( = ?auto_221333 ?auto_221334 ) ) ( not ( = ?auto_221333 ?auto_221335 ) ) ( not ( = ?auto_221333 ?auto_221336 ) ) ( not ( = ?auto_221333 ?auto_221337 ) ) ( not ( = ?auto_221333 ?auto_221338 ) ) ( not ( = ?auto_221333 ?auto_221339 ) ) ( not ( = ?auto_221334 ?auto_221335 ) ) ( not ( = ?auto_221334 ?auto_221336 ) ) ( not ( = ?auto_221334 ?auto_221337 ) ) ( not ( = ?auto_221334 ?auto_221338 ) ) ( not ( = ?auto_221334 ?auto_221339 ) ) ( not ( = ?auto_221335 ?auto_221336 ) ) ( not ( = ?auto_221335 ?auto_221337 ) ) ( not ( = ?auto_221335 ?auto_221338 ) ) ( not ( = ?auto_221335 ?auto_221339 ) ) ( not ( = ?auto_221336 ?auto_221337 ) ) ( not ( = ?auto_221336 ?auto_221338 ) ) ( not ( = ?auto_221336 ?auto_221339 ) ) ( not ( = ?auto_221337 ?auto_221338 ) ) ( not ( = ?auto_221337 ?auto_221339 ) ) ( not ( = ?auto_221338 ?auto_221339 ) ) ( ON ?auto_221337 ?auto_221338 ) ( ON ?auto_221336 ?auto_221337 ) ( ON ?auto_221335 ?auto_221336 ) ( ON ?auto_221334 ?auto_221335 ) ( ON ?auto_221333 ?auto_221334 ) ( CLEAR ?auto_221331 ) ( ON ?auto_221332 ?auto_221333 ) ( CLEAR ?auto_221332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_221328 ?auto_221329 ?auto_221330 ?auto_221331 ?auto_221332 )
      ( MAKE-11PILE ?auto_221328 ?auto_221329 ?auto_221330 ?auto_221331 ?auto_221332 ?auto_221333 ?auto_221334 ?auto_221335 ?auto_221336 ?auto_221337 ?auto_221338 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_221351 - BLOCK
      ?auto_221352 - BLOCK
      ?auto_221353 - BLOCK
      ?auto_221354 - BLOCK
      ?auto_221355 - BLOCK
      ?auto_221356 - BLOCK
      ?auto_221357 - BLOCK
      ?auto_221358 - BLOCK
      ?auto_221359 - BLOCK
      ?auto_221360 - BLOCK
      ?auto_221361 - BLOCK
    )
    :vars
    (
      ?auto_221362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221361 ?auto_221362 ) ( ON-TABLE ?auto_221351 ) ( ON ?auto_221352 ?auto_221351 ) ( ON ?auto_221353 ?auto_221352 ) ( not ( = ?auto_221351 ?auto_221352 ) ) ( not ( = ?auto_221351 ?auto_221353 ) ) ( not ( = ?auto_221351 ?auto_221354 ) ) ( not ( = ?auto_221351 ?auto_221355 ) ) ( not ( = ?auto_221351 ?auto_221356 ) ) ( not ( = ?auto_221351 ?auto_221357 ) ) ( not ( = ?auto_221351 ?auto_221358 ) ) ( not ( = ?auto_221351 ?auto_221359 ) ) ( not ( = ?auto_221351 ?auto_221360 ) ) ( not ( = ?auto_221351 ?auto_221361 ) ) ( not ( = ?auto_221351 ?auto_221362 ) ) ( not ( = ?auto_221352 ?auto_221353 ) ) ( not ( = ?auto_221352 ?auto_221354 ) ) ( not ( = ?auto_221352 ?auto_221355 ) ) ( not ( = ?auto_221352 ?auto_221356 ) ) ( not ( = ?auto_221352 ?auto_221357 ) ) ( not ( = ?auto_221352 ?auto_221358 ) ) ( not ( = ?auto_221352 ?auto_221359 ) ) ( not ( = ?auto_221352 ?auto_221360 ) ) ( not ( = ?auto_221352 ?auto_221361 ) ) ( not ( = ?auto_221352 ?auto_221362 ) ) ( not ( = ?auto_221353 ?auto_221354 ) ) ( not ( = ?auto_221353 ?auto_221355 ) ) ( not ( = ?auto_221353 ?auto_221356 ) ) ( not ( = ?auto_221353 ?auto_221357 ) ) ( not ( = ?auto_221353 ?auto_221358 ) ) ( not ( = ?auto_221353 ?auto_221359 ) ) ( not ( = ?auto_221353 ?auto_221360 ) ) ( not ( = ?auto_221353 ?auto_221361 ) ) ( not ( = ?auto_221353 ?auto_221362 ) ) ( not ( = ?auto_221354 ?auto_221355 ) ) ( not ( = ?auto_221354 ?auto_221356 ) ) ( not ( = ?auto_221354 ?auto_221357 ) ) ( not ( = ?auto_221354 ?auto_221358 ) ) ( not ( = ?auto_221354 ?auto_221359 ) ) ( not ( = ?auto_221354 ?auto_221360 ) ) ( not ( = ?auto_221354 ?auto_221361 ) ) ( not ( = ?auto_221354 ?auto_221362 ) ) ( not ( = ?auto_221355 ?auto_221356 ) ) ( not ( = ?auto_221355 ?auto_221357 ) ) ( not ( = ?auto_221355 ?auto_221358 ) ) ( not ( = ?auto_221355 ?auto_221359 ) ) ( not ( = ?auto_221355 ?auto_221360 ) ) ( not ( = ?auto_221355 ?auto_221361 ) ) ( not ( = ?auto_221355 ?auto_221362 ) ) ( not ( = ?auto_221356 ?auto_221357 ) ) ( not ( = ?auto_221356 ?auto_221358 ) ) ( not ( = ?auto_221356 ?auto_221359 ) ) ( not ( = ?auto_221356 ?auto_221360 ) ) ( not ( = ?auto_221356 ?auto_221361 ) ) ( not ( = ?auto_221356 ?auto_221362 ) ) ( not ( = ?auto_221357 ?auto_221358 ) ) ( not ( = ?auto_221357 ?auto_221359 ) ) ( not ( = ?auto_221357 ?auto_221360 ) ) ( not ( = ?auto_221357 ?auto_221361 ) ) ( not ( = ?auto_221357 ?auto_221362 ) ) ( not ( = ?auto_221358 ?auto_221359 ) ) ( not ( = ?auto_221358 ?auto_221360 ) ) ( not ( = ?auto_221358 ?auto_221361 ) ) ( not ( = ?auto_221358 ?auto_221362 ) ) ( not ( = ?auto_221359 ?auto_221360 ) ) ( not ( = ?auto_221359 ?auto_221361 ) ) ( not ( = ?auto_221359 ?auto_221362 ) ) ( not ( = ?auto_221360 ?auto_221361 ) ) ( not ( = ?auto_221360 ?auto_221362 ) ) ( not ( = ?auto_221361 ?auto_221362 ) ) ( ON ?auto_221360 ?auto_221361 ) ( ON ?auto_221359 ?auto_221360 ) ( ON ?auto_221358 ?auto_221359 ) ( ON ?auto_221357 ?auto_221358 ) ( ON ?auto_221356 ?auto_221357 ) ( ON ?auto_221355 ?auto_221356 ) ( CLEAR ?auto_221353 ) ( ON ?auto_221354 ?auto_221355 ) ( CLEAR ?auto_221354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_221351 ?auto_221352 ?auto_221353 ?auto_221354 )
      ( MAKE-11PILE ?auto_221351 ?auto_221352 ?auto_221353 ?auto_221354 ?auto_221355 ?auto_221356 ?auto_221357 ?auto_221358 ?auto_221359 ?auto_221360 ?auto_221361 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_221374 - BLOCK
      ?auto_221375 - BLOCK
      ?auto_221376 - BLOCK
      ?auto_221377 - BLOCK
      ?auto_221378 - BLOCK
      ?auto_221379 - BLOCK
      ?auto_221380 - BLOCK
      ?auto_221381 - BLOCK
      ?auto_221382 - BLOCK
      ?auto_221383 - BLOCK
      ?auto_221384 - BLOCK
    )
    :vars
    (
      ?auto_221385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221384 ?auto_221385 ) ( ON-TABLE ?auto_221374 ) ( ON ?auto_221375 ?auto_221374 ) ( ON ?auto_221376 ?auto_221375 ) ( not ( = ?auto_221374 ?auto_221375 ) ) ( not ( = ?auto_221374 ?auto_221376 ) ) ( not ( = ?auto_221374 ?auto_221377 ) ) ( not ( = ?auto_221374 ?auto_221378 ) ) ( not ( = ?auto_221374 ?auto_221379 ) ) ( not ( = ?auto_221374 ?auto_221380 ) ) ( not ( = ?auto_221374 ?auto_221381 ) ) ( not ( = ?auto_221374 ?auto_221382 ) ) ( not ( = ?auto_221374 ?auto_221383 ) ) ( not ( = ?auto_221374 ?auto_221384 ) ) ( not ( = ?auto_221374 ?auto_221385 ) ) ( not ( = ?auto_221375 ?auto_221376 ) ) ( not ( = ?auto_221375 ?auto_221377 ) ) ( not ( = ?auto_221375 ?auto_221378 ) ) ( not ( = ?auto_221375 ?auto_221379 ) ) ( not ( = ?auto_221375 ?auto_221380 ) ) ( not ( = ?auto_221375 ?auto_221381 ) ) ( not ( = ?auto_221375 ?auto_221382 ) ) ( not ( = ?auto_221375 ?auto_221383 ) ) ( not ( = ?auto_221375 ?auto_221384 ) ) ( not ( = ?auto_221375 ?auto_221385 ) ) ( not ( = ?auto_221376 ?auto_221377 ) ) ( not ( = ?auto_221376 ?auto_221378 ) ) ( not ( = ?auto_221376 ?auto_221379 ) ) ( not ( = ?auto_221376 ?auto_221380 ) ) ( not ( = ?auto_221376 ?auto_221381 ) ) ( not ( = ?auto_221376 ?auto_221382 ) ) ( not ( = ?auto_221376 ?auto_221383 ) ) ( not ( = ?auto_221376 ?auto_221384 ) ) ( not ( = ?auto_221376 ?auto_221385 ) ) ( not ( = ?auto_221377 ?auto_221378 ) ) ( not ( = ?auto_221377 ?auto_221379 ) ) ( not ( = ?auto_221377 ?auto_221380 ) ) ( not ( = ?auto_221377 ?auto_221381 ) ) ( not ( = ?auto_221377 ?auto_221382 ) ) ( not ( = ?auto_221377 ?auto_221383 ) ) ( not ( = ?auto_221377 ?auto_221384 ) ) ( not ( = ?auto_221377 ?auto_221385 ) ) ( not ( = ?auto_221378 ?auto_221379 ) ) ( not ( = ?auto_221378 ?auto_221380 ) ) ( not ( = ?auto_221378 ?auto_221381 ) ) ( not ( = ?auto_221378 ?auto_221382 ) ) ( not ( = ?auto_221378 ?auto_221383 ) ) ( not ( = ?auto_221378 ?auto_221384 ) ) ( not ( = ?auto_221378 ?auto_221385 ) ) ( not ( = ?auto_221379 ?auto_221380 ) ) ( not ( = ?auto_221379 ?auto_221381 ) ) ( not ( = ?auto_221379 ?auto_221382 ) ) ( not ( = ?auto_221379 ?auto_221383 ) ) ( not ( = ?auto_221379 ?auto_221384 ) ) ( not ( = ?auto_221379 ?auto_221385 ) ) ( not ( = ?auto_221380 ?auto_221381 ) ) ( not ( = ?auto_221380 ?auto_221382 ) ) ( not ( = ?auto_221380 ?auto_221383 ) ) ( not ( = ?auto_221380 ?auto_221384 ) ) ( not ( = ?auto_221380 ?auto_221385 ) ) ( not ( = ?auto_221381 ?auto_221382 ) ) ( not ( = ?auto_221381 ?auto_221383 ) ) ( not ( = ?auto_221381 ?auto_221384 ) ) ( not ( = ?auto_221381 ?auto_221385 ) ) ( not ( = ?auto_221382 ?auto_221383 ) ) ( not ( = ?auto_221382 ?auto_221384 ) ) ( not ( = ?auto_221382 ?auto_221385 ) ) ( not ( = ?auto_221383 ?auto_221384 ) ) ( not ( = ?auto_221383 ?auto_221385 ) ) ( not ( = ?auto_221384 ?auto_221385 ) ) ( ON ?auto_221383 ?auto_221384 ) ( ON ?auto_221382 ?auto_221383 ) ( ON ?auto_221381 ?auto_221382 ) ( ON ?auto_221380 ?auto_221381 ) ( ON ?auto_221379 ?auto_221380 ) ( ON ?auto_221378 ?auto_221379 ) ( CLEAR ?auto_221376 ) ( ON ?auto_221377 ?auto_221378 ) ( CLEAR ?auto_221377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_221374 ?auto_221375 ?auto_221376 ?auto_221377 )
      ( MAKE-11PILE ?auto_221374 ?auto_221375 ?auto_221376 ?auto_221377 ?auto_221378 ?auto_221379 ?auto_221380 ?auto_221381 ?auto_221382 ?auto_221383 ?auto_221384 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_221397 - BLOCK
      ?auto_221398 - BLOCK
      ?auto_221399 - BLOCK
      ?auto_221400 - BLOCK
      ?auto_221401 - BLOCK
      ?auto_221402 - BLOCK
      ?auto_221403 - BLOCK
      ?auto_221404 - BLOCK
      ?auto_221405 - BLOCK
      ?auto_221406 - BLOCK
      ?auto_221407 - BLOCK
    )
    :vars
    (
      ?auto_221408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221407 ?auto_221408 ) ( ON-TABLE ?auto_221397 ) ( ON ?auto_221398 ?auto_221397 ) ( not ( = ?auto_221397 ?auto_221398 ) ) ( not ( = ?auto_221397 ?auto_221399 ) ) ( not ( = ?auto_221397 ?auto_221400 ) ) ( not ( = ?auto_221397 ?auto_221401 ) ) ( not ( = ?auto_221397 ?auto_221402 ) ) ( not ( = ?auto_221397 ?auto_221403 ) ) ( not ( = ?auto_221397 ?auto_221404 ) ) ( not ( = ?auto_221397 ?auto_221405 ) ) ( not ( = ?auto_221397 ?auto_221406 ) ) ( not ( = ?auto_221397 ?auto_221407 ) ) ( not ( = ?auto_221397 ?auto_221408 ) ) ( not ( = ?auto_221398 ?auto_221399 ) ) ( not ( = ?auto_221398 ?auto_221400 ) ) ( not ( = ?auto_221398 ?auto_221401 ) ) ( not ( = ?auto_221398 ?auto_221402 ) ) ( not ( = ?auto_221398 ?auto_221403 ) ) ( not ( = ?auto_221398 ?auto_221404 ) ) ( not ( = ?auto_221398 ?auto_221405 ) ) ( not ( = ?auto_221398 ?auto_221406 ) ) ( not ( = ?auto_221398 ?auto_221407 ) ) ( not ( = ?auto_221398 ?auto_221408 ) ) ( not ( = ?auto_221399 ?auto_221400 ) ) ( not ( = ?auto_221399 ?auto_221401 ) ) ( not ( = ?auto_221399 ?auto_221402 ) ) ( not ( = ?auto_221399 ?auto_221403 ) ) ( not ( = ?auto_221399 ?auto_221404 ) ) ( not ( = ?auto_221399 ?auto_221405 ) ) ( not ( = ?auto_221399 ?auto_221406 ) ) ( not ( = ?auto_221399 ?auto_221407 ) ) ( not ( = ?auto_221399 ?auto_221408 ) ) ( not ( = ?auto_221400 ?auto_221401 ) ) ( not ( = ?auto_221400 ?auto_221402 ) ) ( not ( = ?auto_221400 ?auto_221403 ) ) ( not ( = ?auto_221400 ?auto_221404 ) ) ( not ( = ?auto_221400 ?auto_221405 ) ) ( not ( = ?auto_221400 ?auto_221406 ) ) ( not ( = ?auto_221400 ?auto_221407 ) ) ( not ( = ?auto_221400 ?auto_221408 ) ) ( not ( = ?auto_221401 ?auto_221402 ) ) ( not ( = ?auto_221401 ?auto_221403 ) ) ( not ( = ?auto_221401 ?auto_221404 ) ) ( not ( = ?auto_221401 ?auto_221405 ) ) ( not ( = ?auto_221401 ?auto_221406 ) ) ( not ( = ?auto_221401 ?auto_221407 ) ) ( not ( = ?auto_221401 ?auto_221408 ) ) ( not ( = ?auto_221402 ?auto_221403 ) ) ( not ( = ?auto_221402 ?auto_221404 ) ) ( not ( = ?auto_221402 ?auto_221405 ) ) ( not ( = ?auto_221402 ?auto_221406 ) ) ( not ( = ?auto_221402 ?auto_221407 ) ) ( not ( = ?auto_221402 ?auto_221408 ) ) ( not ( = ?auto_221403 ?auto_221404 ) ) ( not ( = ?auto_221403 ?auto_221405 ) ) ( not ( = ?auto_221403 ?auto_221406 ) ) ( not ( = ?auto_221403 ?auto_221407 ) ) ( not ( = ?auto_221403 ?auto_221408 ) ) ( not ( = ?auto_221404 ?auto_221405 ) ) ( not ( = ?auto_221404 ?auto_221406 ) ) ( not ( = ?auto_221404 ?auto_221407 ) ) ( not ( = ?auto_221404 ?auto_221408 ) ) ( not ( = ?auto_221405 ?auto_221406 ) ) ( not ( = ?auto_221405 ?auto_221407 ) ) ( not ( = ?auto_221405 ?auto_221408 ) ) ( not ( = ?auto_221406 ?auto_221407 ) ) ( not ( = ?auto_221406 ?auto_221408 ) ) ( not ( = ?auto_221407 ?auto_221408 ) ) ( ON ?auto_221406 ?auto_221407 ) ( ON ?auto_221405 ?auto_221406 ) ( ON ?auto_221404 ?auto_221405 ) ( ON ?auto_221403 ?auto_221404 ) ( ON ?auto_221402 ?auto_221403 ) ( ON ?auto_221401 ?auto_221402 ) ( ON ?auto_221400 ?auto_221401 ) ( CLEAR ?auto_221398 ) ( ON ?auto_221399 ?auto_221400 ) ( CLEAR ?auto_221399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_221397 ?auto_221398 ?auto_221399 )
      ( MAKE-11PILE ?auto_221397 ?auto_221398 ?auto_221399 ?auto_221400 ?auto_221401 ?auto_221402 ?auto_221403 ?auto_221404 ?auto_221405 ?auto_221406 ?auto_221407 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_221420 - BLOCK
      ?auto_221421 - BLOCK
      ?auto_221422 - BLOCK
      ?auto_221423 - BLOCK
      ?auto_221424 - BLOCK
      ?auto_221425 - BLOCK
      ?auto_221426 - BLOCK
      ?auto_221427 - BLOCK
      ?auto_221428 - BLOCK
      ?auto_221429 - BLOCK
      ?auto_221430 - BLOCK
    )
    :vars
    (
      ?auto_221431 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221430 ?auto_221431 ) ( ON-TABLE ?auto_221420 ) ( ON ?auto_221421 ?auto_221420 ) ( not ( = ?auto_221420 ?auto_221421 ) ) ( not ( = ?auto_221420 ?auto_221422 ) ) ( not ( = ?auto_221420 ?auto_221423 ) ) ( not ( = ?auto_221420 ?auto_221424 ) ) ( not ( = ?auto_221420 ?auto_221425 ) ) ( not ( = ?auto_221420 ?auto_221426 ) ) ( not ( = ?auto_221420 ?auto_221427 ) ) ( not ( = ?auto_221420 ?auto_221428 ) ) ( not ( = ?auto_221420 ?auto_221429 ) ) ( not ( = ?auto_221420 ?auto_221430 ) ) ( not ( = ?auto_221420 ?auto_221431 ) ) ( not ( = ?auto_221421 ?auto_221422 ) ) ( not ( = ?auto_221421 ?auto_221423 ) ) ( not ( = ?auto_221421 ?auto_221424 ) ) ( not ( = ?auto_221421 ?auto_221425 ) ) ( not ( = ?auto_221421 ?auto_221426 ) ) ( not ( = ?auto_221421 ?auto_221427 ) ) ( not ( = ?auto_221421 ?auto_221428 ) ) ( not ( = ?auto_221421 ?auto_221429 ) ) ( not ( = ?auto_221421 ?auto_221430 ) ) ( not ( = ?auto_221421 ?auto_221431 ) ) ( not ( = ?auto_221422 ?auto_221423 ) ) ( not ( = ?auto_221422 ?auto_221424 ) ) ( not ( = ?auto_221422 ?auto_221425 ) ) ( not ( = ?auto_221422 ?auto_221426 ) ) ( not ( = ?auto_221422 ?auto_221427 ) ) ( not ( = ?auto_221422 ?auto_221428 ) ) ( not ( = ?auto_221422 ?auto_221429 ) ) ( not ( = ?auto_221422 ?auto_221430 ) ) ( not ( = ?auto_221422 ?auto_221431 ) ) ( not ( = ?auto_221423 ?auto_221424 ) ) ( not ( = ?auto_221423 ?auto_221425 ) ) ( not ( = ?auto_221423 ?auto_221426 ) ) ( not ( = ?auto_221423 ?auto_221427 ) ) ( not ( = ?auto_221423 ?auto_221428 ) ) ( not ( = ?auto_221423 ?auto_221429 ) ) ( not ( = ?auto_221423 ?auto_221430 ) ) ( not ( = ?auto_221423 ?auto_221431 ) ) ( not ( = ?auto_221424 ?auto_221425 ) ) ( not ( = ?auto_221424 ?auto_221426 ) ) ( not ( = ?auto_221424 ?auto_221427 ) ) ( not ( = ?auto_221424 ?auto_221428 ) ) ( not ( = ?auto_221424 ?auto_221429 ) ) ( not ( = ?auto_221424 ?auto_221430 ) ) ( not ( = ?auto_221424 ?auto_221431 ) ) ( not ( = ?auto_221425 ?auto_221426 ) ) ( not ( = ?auto_221425 ?auto_221427 ) ) ( not ( = ?auto_221425 ?auto_221428 ) ) ( not ( = ?auto_221425 ?auto_221429 ) ) ( not ( = ?auto_221425 ?auto_221430 ) ) ( not ( = ?auto_221425 ?auto_221431 ) ) ( not ( = ?auto_221426 ?auto_221427 ) ) ( not ( = ?auto_221426 ?auto_221428 ) ) ( not ( = ?auto_221426 ?auto_221429 ) ) ( not ( = ?auto_221426 ?auto_221430 ) ) ( not ( = ?auto_221426 ?auto_221431 ) ) ( not ( = ?auto_221427 ?auto_221428 ) ) ( not ( = ?auto_221427 ?auto_221429 ) ) ( not ( = ?auto_221427 ?auto_221430 ) ) ( not ( = ?auto_221427 ?auto_221431 ) ) ( not ( = ?auto_221428 ?auto_221429 ) ) ( not ( = ?auto_221428 ?auto_221430 ) ) ( not ( = ?auto_221428 ?auto_221431 ) ) ( not ( = ?auto_221429 ?auto_221430 ) ) ( not ( = ?auto_221429 ?auto_221431 ) ) ( not ( = ?auto_221430 ?auto_221431 ) ) ( ON ?auto_221429 ?auto_221430 ) ( ON ?auto_221428 ?auto_221429 ) ( ON ?auto_221427 ?auto_221428 ) ( ON ?auto_221426 ?auto_221427 ) ( ON ?auto_221425 ?auto_221426 ) ( ON ?auto_221424 ?auto_221425 ) ( ON ?auto_221423 ?auto_221424 ) ( CLEAR ?auto_221421 ) ( ON ?auto_221422 ?auto_221423 ) ( CLEAR ?auto_221422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_221420 ?auto_221421 ?auto_221422 )
      ( MAKE-11PILE ?auto_221420 ?auto_221421 ?auto_221422 ?auto_221423 ?auto_221424 ?auto_221425 ?auto_221426 ?auto_221427 ?auto_221428 ?auto_221429 ?auto_221430 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_221443 - BLOCK
      ?auto_221444 - BLOCK
      ?auto_221445 - BLOCK
      ?auto_221446 - BLOCK
      ?auto_221447 - BLOCK
      ?auto_221448 - BLOCK
      ?auto_221449 - BLOCK
      ?auto_221450 - BLOCK
      ?auto_221451 - BLOCK
      ?auto_221452 - BLOCK
      ?auto_221453 - BLOCK
    )
    :vars
    (
      ?auto_221454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221453 ?auto_221454 ) ( ON-TABLE ?auto_221443 ) ( not ( = ?auto_221443 ?auto_221444 ) ) ( not ( = ?auto_221443 ?auto_221445 ) ) ( not ( = ?auto_221443 ?auto_221446 ) ) ( not ( = ?auto_221443 ?auto_221447 ) ) ( not ( = ?auto_221443 ?auto_221448 ) ) ( not ( = ?auto_221443 ?auto_221449 ) ) ( not ( = ?auto_221443 ?auto_221450 ) ) ( not ( = ?auto_221443 ?auto_221451 ) ) ( not ( = ?auto_221443 ?auto_221452 ) ) ( not ( = ?auto_221443 ?auto_221453 ) ) ( not ( = ?auto_221443 ?auto_221454 ) ) ( not ( = ?auto_221444 ?auto_221445 ) ) ( not ( = ?auto_221444 ?auto_221446 ) ) ( not ( = ?auto_221444 ?auto_221447 ) ) ( not ( = ?auto_221444 ?auto_221448 ) ) ( not ( = ?auto_221444 ?auto_221449 ) ) ( not ( = ?auto_221444 ?auto_221450 ) ) ( not ( = ?auto_221444 ?auto_221451 ) ) ( not ( = ?auto_221444 ?auto_221452 ) ) ( not ( = ?auto_221444 ?auto_221453 ) ) ( not ( = ?auto_221444 ?auto_221454 ) ) ( not ( = ?auto_221445 ?auto_221446 ) ) ( not ( = ?auto_221445 ?auto_221447 ) ) ( not ( = ?auto_221445 ?auto_221448 ) ) ( not ( = ?auto_221445 ?auto_221449 ) ) ( not ( = ?auto_221445 ?auto_221450 ) ) ( not ( = ?auto_221445 ?auto_221451 ) ) ( not ( = ?auto_221445 ?auto_221452 ) ) ( not ( = ?auto_221445 ?auto_221453 ) ) ( not ( = ?auto_221445 ?auto_221454 ) ) ( not ( = ?auto_221446 ?auto_221447 ) ) ( not ( = ?auto_221446 ?auto_221448 ) ) ( not ( = ?auto_221446 ?auto_221449 ) ) ( not ( = ?auto_221446 ?auto_221450 ) ) ( not ( = ?auto_221446 ?auto_221451 ) ) ( not ( = ?auto_221446 ?auto_221452 ) ) ( not ( = ?auto_221446 ?auto_221453 ) ) ( not ( = ?auto_221446 ?auto_221454 ) ) ( not ( = ?auto_221447 ?auto_221448 ) ) ( not ( = ?auto_221447 ?auto_221449 ) ) ( not ( = ?auto_221447 ?auto_221450 ) ) ( not ( = ?auto_221447 ?auto_221451 ) ) ( not ( = ?auto_221447 ?auto_221452 ) ) ( not ( = ?auto_221447 ?auto_221453 ) ) ( not ( = ?auto_221447 ?auto_221454 ) ) ( not ( = ?auto_221448 ?auto_221449 ) ) ( not ( = ?auto_221448 ?auto_221450 ) ) ( not ( = ?auto_221448 ?auto_221451 ) ) ( not ( = ?auto_221448 ?auto_221452 ) ) ( not ( = ?auto_221448 ?auto_221453 ) ) ( not ( = ?auto_221448 ?auto_221454 ) ) ( not ( = ?auto_221449 ?auto_221450 ) ) ( not ( = ?auto_221449 ?auto_221451 ) ) ( not ( = ?auto_221449 ?auto_221452 ) ) ( not ( = ?auto_221449 ?auto_221453 ) ) ( not ( = ?auto_221449 ?auto_221454 ) ) ( not ( = ?auto_221450 ?auto_221451 ) ) ( not ( = ?auto_221450 ?auto_221452 ) ) ( not ( = ?auto_221450 ?auto_221453 ) ) ( not ( = ?auto_221450 ?auto_221454 ) ) ( not ( = ?auto_221451 ?auto_221452 ) ) ( not ( = ?auto_221451 ?auto_221453 ) ) ( not ( = ?auto_221451 ?auto_221454 ) ) ( not ( = ?auto_221452 ?auto_221453 ) ) ( not ( = ?auto_221452 ?auto_221454 ) ) ( not ( = ?auto_221453 ?auto_221454 ) ) ( ON ?auto_221452 ?auto_221453 ) ( ON ?auto_221451 ?auto_221452 ) ( ON ?auto_221450 ?auto_221451 ) ( ON ?auto_221449 ?auto_221450 ) ( ON ?auto_221448 ?auto_221449 ) ( ON ?auto_221447 ?auto_221448 ) ( ON ?auto_221446 ?auto_221447 ) ( ON ?auto_221445 ?auto_221446 ) ( CLEAR ?auto_221443 ) ( ON ?auto_221444 ?auto_221445 ) ( CLEAR ?auto_221444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_221443 ?auto_221444 )
      ( MAKE-11PILE ?auto_221443 ?auto_221444 ?auto_221445 ?auto_221446 ?auto_221447 ?auto_221448 ?auto_221449 ?auto_221450 ?auto_221451 ?auto_221452 ?auto_221453 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_221466 - BLOCK
      ?auto_221467 - BLOCK
      ?auto_221468 - BLOCK
      ?auto_221469 - BLOCK
      ?auto_221470 - BLOCK
      ?auto_221471 - BLOCK
      ?auto_221472 - BLOCK
      ?auto_221473 - BLOCK
      ?auto_221474 - BLOCK
      ?auto_221475 - BLOCK
      ?auto_221476 - BLOCK
    )
    :vars
    (
      ?auto_221477 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221476 ?auto_221477 ) ( ON-TABLE ?auto_221466 ) ( not ( = ?auto_221466 ?auto_221467 ) ) ( not ( = ?auto_221466 ?auto_221468 ) ) ( not ( = ?auto_221466 ?auto_221469 ) ) ( not ( = ?auto_221466 ?auto_221470 ) ) ( not ( = ?auto_221466 ?auto_221471 ) ) ( not ( = ?auto_221466 ?auto_221472 ) ) ( not ( = ?auto_221466 ?auto_221473 ) ) ( not ( = ?auto_221466 ?auto_221474 ) ) ( not ( = ?auto_221466 ?auto_221475 ) ) ( not ( = ?auto_221466 ?auto_221476 ) ) ( not ( = ?auto_221466 ?auto_221477 ) ) ( not ( = ?auto_221467 ?auto_221468 ) ) ( not ( = ?auto_221467 ?auto_221469 ) ) ( not ( = ?auto_221467 ?auto_221470 ) ) ( not ( = ?auto_221467 ?auto_221471 ) ) ( not ( = ?auto_221467 ?auto_221472 ) ) ( not ( = ?auto_221467 ?auto_221473 ) ) ( not ( = ?auto_221467 ?auto_221474 ) ) ( not ( = ?auto_221467 ?auto_221475 ) ) ( not ( = ?auto_221467 ?auto_221476 ) ) ( not ( = ?auto_221467 ?auto_221477 ) ) ( not ( = ?auto_221468 ?auto_221469 ) ) ( not ( = ?auto_221468 ?auto_221470 ) ) ( not ( = ?auto_221468 ?auto_221471 ) ) ( not ( = ?auto_221468 ?auto_221472 ) ) ( not ( = ?auto_221468 ?auto_221473 ) ) ( not ( = ?auto_221468 ?auto_221474 ) ) ( not ( = ?auto_221468 ?auto_221475 ) ) ( not ( = ?auto_221468 ?auto_221476 ) ) ( not ( = ?auto_221468 ?auto_221477 ) ) ( not ( = ?auto_221469 ?auto_221470 ) ) ( not ( = ?auto_221469 ?auto_221471 ) ) ( not ( = ?auto_221469 ?auto_221472 ) ) ( not ( = ?auto_221469 ?auto_221473 ) ) ( not ( = ?auto_221469 ?auto_221474 ) ) ( not ( = ?auto_221469 ?auto_221475 ) ) ( not ( = ?auto_221469 ?auto_221476 ) ) ( not ( = ?auto_221469 ?auto_221477 ) ) ( not ( = ?auto_221470 ?auto_221471 ) ) ( not ( = ?auto_221470 ?auto_221472 ) ) ( not ( = ?auto_221470 ?auto_221473 ) ) ( not ( = ?auto_221470 ?auto_221474 ) ) ( not ( = ?auto_221470 ?auto_221475 ) ) ( not ( = ?auto_221470 ?auto_221476 ) ) ( not ( = ?auto_221470 ?auto_221477 ) ) ( not ( = ?auto_221471 ?auto_221472 ) ) ( not ( = ?auto_221471 ?auto_221473 ) ) ( not ( = ?auto_221471 ?auto_221474 ) ) ( not ( = ?auto_221471 ?auto_221475 ) ) ( not ( = ?auto_221471 ?auto_221476 ) ) ( not ( = ?auto_221471 ?auto_221477 ) ) ( not ( = ?auto_221472 ?auto_221473 ) ) ( not ( = ?auto_221472 ?auto_221474 ) ) ( not ( = ?auto_221472 ?auto_221475 ) ) ( not ( = ?auto_221472 ?auto_221476 ) ) ( not ( = ?auto_221472 ?auto_221477 ) ) ( not ( = ?auto_221473 ?auto_221474 ) ) ( not ( = ?auto_221473 ?auto_221475 ) ) ( not ( = ?auto_221473 ?auto_221476 ) ) ( not ( = ?auto_221473 ?auto_221477 ) ) ( not ( = ?auto_221474 ?auto_221475 ) ) ( not ( = ?auto_221474 ?auto_221476 ) ) ( not ( = ?auto_221474 ?auto_221477 ) ) ( not ( = ?auto_221475 ?auto_221476 ) ) ( not ( = ?auto_221475 ?auto_221477 ) ) ( not ( = ?auto_221476 ?auto_221477 ) ) ( ON ?auto_221475 ?auto_221476 ) ( ON ?auto_221474 ?auto_221475 ) ( ON ?auto_221473 ?auto_221474 ) ( ON ?auto_221472 ?auto_221473 ) ( ON ?auto_221471 ?auto_221472 ) ( ON ?auto_221470 ?auto_221471 ) ( ON ?auto_221469 ?auto_221470 ) ( ON ?auto_221468 ?auto_221469 ) ( CLEAR ?auto_221466 ) ( ON ?auto_221467 ?auto_221468 ) ( CLEAR ?auto_221467 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_221466 ?auto_221467 )
      ( MAKE-11PILE ?auto_221466 ?auto_221467 ?auto_221468 ?auto_221469 ?auto_221470 ?auto_221471 ?auto_221472 ?auto_221473 ?auto_221474 ?auto_221475 ?auto_221476 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_221489 - BLOCK
      ?auto_221490 - BLOCK
      ?auto_221491 - BLOCK
      ?auto_221492 - BLOCK
      ?auto_221493 - BLOCK
      ?auto_221494 - BLOCK
      ?auto_221495 - BLOCK
      ?auto_221496 - BLOCK
      ?auto_221497 - BLOCK
      ?auto_221498 - BLOCK
      ?auto_221499 - BLOCK
    )
    :vars
    (
      ?auto_221500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221499 ?auto_221500 ) ( not ( = ?auto_221489 ?auto_221490 ) ) ( not ( = ?auto_221489 ?auto_221491 ) ) ( not ( = ?auto_221489 ?auto_221492 ) ) ( not ( = ?auto_221489 ?auto_221493 ) ) ( not ( = ?auto_221489 ?auto_221494 ) ) ( not ( = ?auto_221489 ?auto_221495 ) ) ( not ( = ?auto_221489 ?auto_221496 ) ) ( not ( = ?auto_221489 ?auto_221497 ) ) ( not ( = ?auto_221489 ?auto_221498 ) ) ( not ( = ?auto_221489 ?auto_221499 ) ) ( not ( = ?auto_221489 ?auto_221500 ) ) ( not ( = ?auto_221490 ?auto_221491 ) ) ( not ( = ?auto_221490 ?auto_221492 ) ) ( not ( = ?auto_221490 ?auto_221493 ) ) ( not ( = ?auto_221490 ?auto_221494 ) ) ( not ( = ?auto_221490 ?auto_221495 ) ) ( not ( = ?auto_221490 ?auto_221496 ) ) ( not ( = ?auto_221490 ?auto_221497 ) ) ( not ( = ?auto_221490 ?auto_221498 ) ) ( not ( = ?auto_221490 ?auto_221499 ) ) ( not ( = ?auto_221490 ?auto_221500 ) ) ( not ( = ?auto_221491 ?auto_221492 ) ) ( not ( = ?auto_221491 ?auto_221493 ) ) ( not ( = ?auto_221491 ?auto_221494 ) ) ( not ( = ?auto_221491 ?auto_221495 ) ) ( not ( = ?auto_221491 ?auto_221496 ) ) ( not ( = ?auto_221491 ?auto_221497 ) ) ( not ( = ?auto_221491 ?auto_221498 ) ) ( not ( = ?auto_221491 ?auto_221499 ) ) ( not ( = ?auto_221491 ?auto_221500 ) ) ( not ( = ?auto_221492 ?auto_221493 ) ) ( not ( = ?auto_221492 ?auto_221494 ) ) ( not ( = ?auto_221492 ?auto_221495 ) ) ( not ( = ?auto_221492 ?auto_221496 ) ) ( not ( = ?auto_221492 ?auto_221497 ) ) ( not ( = ?auto_221492 ?auto_221498 ) ) ( not ( = ?auto_221492 ?auto_221499 ) ) ( not ( = ?auto_221492 ?auto_221500 ) ) ( not ( = ?auto_221493 ?auto_221494 ) ) ( not ( = ?auto_221493 ?auto_221495 ) ) ( not ( = ?auto_221493 ?auto_221496 ) ) ( not ( = ?auto_221493 ?auto_221497 ) ) ( not ( = ?auto_221493 ?auto_221498 ) ) ( not ( = ?auto_221493 ?auto_221499 ) ) ( not ( = ?auto_221493 ?auto_221500 ) ) ( not ( = ?auto_221494 ?auto_221495 ) ) ( not ( = ?auto_221494 ?auto_221496 ) ) ( not ( = ?auto_221494 ?auto_221497 ) ) ( not ( = ?auto_221494 ?auto_221498 ) ) ( not ( = ?auto_221494 ?auto_221499 ) ) ( not ( = ?auto_221494 ?auto_221500 ) ) ( not ( = ?auto_221495 ?auto_221496 ) ) ( not ( = ?auto_221495 ?auto_221497 ) ) ( not ( = ?auto_221495 ?auto_221498 ) ) ( not ( = ?auto_221495 ?auto_221499 ) ) ( not ( = ?auto_221495 ?auto_221500 ) ) ( not ( = ?auto_221496 ?auto_221497 ) ) ( not ( = ?auto_221496 ?auto_221498 ) ) ( not ( = ?auto_221496 ?auto_221499 ) ) ( not ( = ?auto_221496 ?auto_221500 ) ) ( not ( = ?auto_221497 ?auto_221498 ) ) ( not ( = ?auto_221497 ?auto_221499 ) ) ( not ( = ?auto_221497 ?auto_221500 ) ) ( not ( = ?auto_221498 ?auto_221499 ) ) ( not ( = ?auto_221498 ?auto_221500 ) ) ( not ( = ?auto_221499 ?auto_221500 ) ) ( ON ?auto_221498 ?auto_221499 ) ( ON ?auto_221497 ?auto_221498 ) ( ON ?auto_221496 ?auto_221497 ) ( ON ?auto_221495 ?auto_221496 ) ( ON ?auto_221494 ?auto_221495 ) ( ON ?auto_221493 ?auto_221494 ) ( ON ?auto_221492 ?auto_221493 ) ( ON ?auto_221491 ?auto_221492 ) ( ON ?auto_221490 ?auto_221491 ) ( ON ?auto_221489 ?auto_221490 ) ( CLEAR ?auto_221489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_221489 )
      ( MAKE-11PILE ?auto_221489 ?auto_221490 ?auto_221491 ?auto_221492 ?auto_221493 ?auto_221494 ?auto_221495 ?auto_221496 ?auto_221497 ?auto_221498 ?auto_221499 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_221512 - BLOCK
      ?auto_221513 - BLOCK
      ?auto_221514 - BLOCK
      ?auto_221515 - BLOCK
      ?auto_221516 - BLOCK
      ?auto_221517 - BLOCK
      ?auto_221518 - BLOCK
      ?auto_221519 - BLOCK
      ?auto_221520 - BLOCK
      ?auto_221521 - BLOCK
      ?auto_221522 - BLOCK
    )
    :vars
    (
      ?auto_221523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221522 ?auto_221523 ) ( not ( = ?auto_221512 ?auto_221513 ) ) ( not ( = ?auto_221512 ?auto_221514 ) ) ( not ( = ?auto_221512 ?auto_221515 ) ) ( not ( = ?auto_221512 ?auto_221516 ) ) ( not ( = ?auto_221512 ?auto_221517 ) ) ( not ( = ?auto_221512 ?auto_221518 ) ) ( not ( = ?auto_221512 ?auto_221519 ) ) ( not ( = ?auto_221512 ?auto_221520 ) ) ( not ( = ?auto_221512 ?auto_221521 ) ) ( not ( = ?auto_221512 ?auto_221522 ) ) ( not ( = ?auto_221512 ?auto_221523 ) ) ( not ( = ?auto_221513 ?auto_221514 ) ) ( not ( = ?auto_221513 ?auto_221515 ) ) ( not ( = ?auto_221513 ?auto_221516 ) ) ( not ( = ?auto_221513 ?auto_221517 ) ) ( not ( = ?auto_221513 ?auto_221518 ) ) ( not ( = ?auto_221513 ?auto_221519 ) ) ( not ( = ?auto_221513 ?auto_221520 ) ) ( not ( = ?auto_221513 ?auto_221521 ) ) ( not ( = ?auto_221513 ?auto_221522 ) ) ( not ( = ?auto_221513 ?auto_221523 ) ) ( not ( = ?auto_221514 ?auto_221515 ) ) ( not ( = ?auto_221514 ?auto_221516 ) ) ( not ( = ?auto_221514 ?auto_221517 ) ) ( not ( = ?auto_221514 ?auto_221518 ) ) ( not ( = ?auto_221514 ?auto_221519 ) ) ( not ( = ?auto_221514 ?auto_221520 ) ) ( not ( = ?auto_221514 ?auto_221521 ) ) ( not ( = ?auto_221514 ?auto_221522 ) ) ( not ( = ?auto_221514 ?auto_221523 ) ) ( not ( = ?auto_221515 ?auto_221516 ) ) ( not ( = ?auto_221515 ?auto_221517 ) ) ( not ( = ?auto_221515 ?auto_221518 ) ) ( not ( = ?auto_221515 ?auto_221519 ) ) ( not ( = ?auto_221515 ?auto_221520 ) ) ( not ( = ?auto_221515 ?auto_221521 ) ) ( not ( = ?auto_221515 ?auto_221522 ) ) ( not ( = ?auto_221515 ?auto_221523 ) ) ( not ( = ?auto_221516 ?auto_221517 ) ) ( not ( = ?auto_221516 ?auto_221518 ) ) ( not ( = ?auto_221516 ?auto_221519 ) ) ( not ( = ?auto_221516 ?auto_221520 ) ) ( not ( = ?auto_221516 ?auto_221521 ) ) ( not ( = ?auto_221516 ?auto_221522 ) ) ( not ( = ?auto_221516 ?auto_221523 ) ) ( not ( = ?auto_221517 ?auto_221518 ) ) ( not ( = ?auto_221517 ?auto_221519 ) ) ( not ( = ?auto_221517 ?auto_221520 ) ) ( not ( = ?auto_221517 ?auto_221521 ) ) ( not ( = ?auto_221517 ?auto_221522 ) ) ( not ( = ?auto_221517 ?auto_221523 ) ) ( not ( = ?auto_221518 ?auto_221519 ) ) ( not ( = ?auto_221518 ?auto_221520 ) ) ( not ( = ?auto_221518 ?auto_221521 ) ) ( not ( = ?auto_221518 ?auto_221522 ) ) ( not ( = ?auto_221518 ?auto_221523 ) ) ( not ( = ?auto_221519 ?auto_221520 ) ) ( not ( = ?auto_221519 ?auto_221521 ) ) ( not ( = ?auto_221519 ?auto_221522 ) ) ( not ( = ?auto_221519 ?auto_221523 ) ) ( not ( = ?auto_221520 ?auto_221521 ) ) ( not ( = ?auto_221520 ?auto_221522 ) ) ( not ( = ?auto_221520 ?auto_221523 ) ) ( not ( = ?auto_221521 ?auto_221522 ) ) ( not ( = ?auto_221521 ?auto_221523 ) ) ( not ( = ?auto_221522 ?auto_221523 ) ) ( ON ?auto_221521 ?auto_221522 ) ( ON ?auto_221520 ?auto_221521 ) ( ON ?auto_221519 ?auto_221520 ) ( ON ?auto_221518 ?auto_221519 ) ( ON ?auto_221517 ?auto_221518 ) ( ON ?auto_221516 ?auto_221517 ) ( ON ?auto_221515 ?auto_221516 ) ( ON ?auto_221514 ?auto_221515 ) ( ON ?auto_221513 ?auto_221514 ) ( ON ?auto_221512 ?auto_221513 ) ( CLEAR ?auto_221512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_221512 )
      ( MAKE-11PILE ?auto_221512 ?auto_221513 ?auto_221514 ?auto_221515 ?auto_221516 ?auto_221517 ?auto_221518 ?auto_221519 ?auto_221520 ?auto_221521 ?auto_221522 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_221536 - BLOCK
      ?auto_221537 - BLOCK
      ?auto_221538 - BLOCK
      ?auto_221539 - BLOCK
      ?auto_221540 - BLOCK
      ?auto_221541 - BLOCK
      ?auto_221542 - BLOCK
      ?auto_221543 - BLOCK
      ?auto_221544 - BLOCK
      ?auto_221545 - BLOCK
      ?auto_221546 - BLOCK
      ?auto_221547 - BLOCK
    )
    :vars
    (
      ?auto_221548 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_221546 ) ( ON ?auto_221547 ?auto_221548 ) ( CLEAR ?auto_221547 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_221536 ) ( ON ?auto_221537 ?auto_221536 ) ( ON ?auto_221538 ?auto_221537 ) ( ON ?auto_221539 ?auto_221538 ) ( ON ?auto_221540 ?auto_221539 ) ( ON ?auto_221541 ?auto_221540 ) ( ON ?auto_221542 ?auto_221541 ) ( ON ?auto_221543 ?auto_221542 ) ( ON ?auto_221544 ?auto_221543 ) ( ON ?auto_221545 ?auto_221544 ) ( ON ?auto_221546 ?auto_221545 ) ( not ( = ?auto_221536 ?auto_221537 ) ) ( not ( = ?auto_221536 ?auto_221538 ) ) ( not ( = ?auto_221536 ?auto_221539 ) ) ( not ( = ?auto_221536 ?auto_221540 ) ) ( not ( = ?auto_221536 ?auto_221541 ) ) ( not ( = ?auto_221536 ?auto_221542 ) ) ( not ( = ?auto_221536 ?auto_221543 ) ) ( not ( = ?auto_221536 ?auto_221544 ) ) ( not ( = ?auto_221536 ?auto_221545 ) ) ( not ( = ?auto_221536 ?auto_221546 ) ) ( not ( = ?auto_221536 ?auto_221547 ) ) ( not ( = ?auto_221536 ?auto_221548 ) ) ( not ( = ?auto_221537 ?auto_221538 ) ) ( not ( = ?auto_221537 ?auto_221539 ) ) ( not ( = ?auto_221537 ?auto_221540 ) ) ( not ( = ?auto_221537 ?auto_221541 ) ) ( not ( = ?auto_221537 ?auto_221542 ) ) ( not ( = ?auto_221537 ?auto_221543 ) ) ( not ( = ?auto_221537 ?auto_221544 ) ) ( not ( = ?auto_221537 ?auto_221545 ) ) ( not ( = ?auto_221537 ?auto_221546 ) ) ( not ( = ?auto_221537 ?auto_221547 ) ) ( not ( = ?auto_221537 ?auto_221548 ) ) ( not ( = ?auto_221538 ?auto_221539 ) ) ( not ( = ?auto_221538 ?auto_221540 ) ) ( not ( = ?auto_221538 ?auto_221541 ) ) ( not ( = ?auto_221538 ?auto_221542 ) ) ( not ( = ?auto_221538 ?auto_221543 ) ) ( not ( = ?auto_221538 ?auto_221544 ) ) ( not ( = ?auto_221538 ?auto_221545 ) ) ( not ( = ?auto_221538 ?auto_221546 ) ) ( not ( = ?auto_221538 ?auto_221547 ) ) ( not ( = ?auto_221538 ?auto_221548 ) ) ( not ( = ?auto_221539 ?auto_221540 ) ) ( not ( = ?auto_221539 ?auto_221541 ) ) ( not ( = ?auto_221539 ?auto_221542 ) ) ( not ( = ?auto_221539 ?auto_221543 ) ) ( not ( = ?auto_221539 ?auto_221544 ) ) ( not ( = ?auto_221539 ?auto_221545 ) ) ( not ( = ?auto_221539 ?auto_221546 ) ) ( not ( = ?auto_221539 ?auto_221547 ) ) ( not ( = ?auto_221539 ?auto_221548 ) ) ( not ( = ?auto_221540 ?auto_221541 ) ) ( not ( = ?auto_221540 ?auto_221542 ) ) ( not ( = ?auto_221540 ?auto_221543 ) ) ( not ( = ?auto_221540 ?auto_221544 ) ) ( not ( = ?auto_221540 ?auto_221545 ) ) ( not ( = ?auto_221540 ?auto_221546 ) ) ( not ( = ?auto_221540 ?auto_221547 ) ) ( not ( = ?auto_221540 ?auto_221548 ) ) ( not ( = ?auto_221541 ?auto_221542 ) ) ( not ( = ?auto_221541 ?auto_221543 ) ) ( not ( = ?auto_221541 ?auto_221544 ) ) ( not ( = ?auto_221541 ?auto_221545 ) ) ( not ( = ?auto_221541 ?auto_221546 ) ) ( not ( = ?auto_221541 ?auto_221547 ) ) ( not ( = ?auto_221541 ?auto_221548 ) ) ( not ( = ?auto_221542 ?auto_221543 ) ) ( not ( = ?auto_221542 ?auto_221544 ) ) ( not ( = ?auto_221542 ?auto_221545 ) ) ( not ( = ?auto_221542 ?auto_221546 ) ) ( not ( = ?auto_221542 ?auto_221547 ) ) ( not ( = ?auto_221542 ?auto_221548 ) ) ( not ( = ?auto_221543 ?auto_221544 ) ) ( not ( = ?auto_221543 ?auto_221545 ) ) ( not ( = ?auto_221543 ?auto_221546 ) ) ( not ( = ?auto_221543 ?auto_221547 ) ) ( not ( = ?auto_221543 ?auto_221548 ) ) ( not ( = ?auto_221544 ?auto_221545 ) ) ( not ( = ?auto_221544 ?auto_221546 ) ) ( not ( = ?auto_221544 ?auto_221547 ) ) ( not ( = ?auto_221544 ?auto_221548 ) ) ( not ( = ?auto_221545 ?auto_221546 ) ) ( not ( = ?auto_221545 ?auto_221547 ) ) ( not ( = ?auto_221545 ?auto_221548 ) ) ( not ( = ?auto_221546 ?auto_221547 ) ) ( not ( = ?auto_221546 ?auto_221548 ) ) ( not ( = ?auto_221547 ?auto_221548 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_221547 ?auto_221548 )
      ( !STACK ?auto_221547 ?auto_221546 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_221561 - BLOCK
      ?auto_221562 - BLOCK
      ?auto_221563 - BLOCK
      ?auto_221564 - BLOCK
      ?auto_221565 - BLOCK
      ?auto_221566 - BLOCK
      ?auto_221567 - BLOCK
      ?auto_221568 - BLOCK
      ?auto_221569 - BLOCK
      ?auto_221570 - BLOCK
      ?auto_221571 - BLOCK
      ?auto_221572 - BLOCK
    )
    :vars
    (
      ?auto_221573 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_221571 ) ( ON ?auto_221572 ?auto_221573 ) ( CLEAR ?auto_221572 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_221561 ) ( ON ?auto_221562 ?auto_221561 ) ( ON ?auto_221563 ?auto_221562 ) ( ON ?auto_221564 ?auto_221563 ) ( ON ?auto_221565 ?auto_221564 ) ( ON ?auto_221566 ?auto_221565 ) ( ON ?auto_221567 ?auto_221566 ) ( ON ?auto_221568 ?auto_221567 ) ( ON ?auto_221569 ?auto_221568 ) ( ON ?auto_221570 ?auto_221569 ) ( ON ?auto_221571 ?auto_221570 ) ( not ( = ?auto_221561 ?auto_221562 ) ) ( not ( = ?auto_221561 ?auto_221563 ) ) ( not ( = ?auto_221561 ?auto_221564 ) ) ( not ( = ?auto_221561 ?auto_221565 ) ) ( not ( = ?auto_221561 ?auto_221566 ) ) ( not ( = ?auto_221561 ?auto_221567 ) ) ( not ( = ?auto_221561 ?auto_221568 ) ) ( not ( = ?auto_221561 ?auto_221569 ) ) ( not ( = ?auto_221561 ?auto_221570 ) ) ( not ( = ?auto_221561 ?auto_221571 ) ) ( not ( = ?auto_221561 ?auto_221572 ) ) ( not ( = ?auto_221561 ?auto_221573 ) ) ( not ( = ?auto_221562 ?auto_221563 ) ) ( not ( = ?auto_221562 ?auto_221564 ) ) ( not ( = ?auto_221562 ?auto_221565 ) ) ( not ( = ?auto_221562 ?auto_221566 ) ) ( not ( = ?auto_221562 ?auto_221567 ) ) ( not ( = ?auto_221562 ?auto_221568 ) ) ( not ( = ?auto_221562 ?auto_221569 ) ) ( not ( = ?auto_221562 ?auto_221570 ) ) ( not ( = ?auto_221562 ?auto_221571 ) ) ( not ( = ?auto_221562 ?auto_221572 ) ) ( not ( = ?auto_221562 ?auto_221573 ) ) ( not ( = ?auto_221563 ?auto_221564 ) ) ( not ( = ?auto_221563 ?auto_221565 ) ) ( not ( = ?auto_221563 ?auto_221566 ) ) ( not ( = ?auto_221563 ?auto_221567 ) ) ( not ( = ?auto_221563 ?auto_221568 ) ) ( not ( = ?auto_221563 ?auto_221569 ) ) ( not ( = ?auto_221563 ?auto_221570 ) ) ( not ( = ?auto_221563 ?auto_221571 ) ) ( not ( = ?auto_221563 ?auto_221572 ) ) ( not ( = ?auto_221563 ?auto_221573 ) ) ( not ( = ?auto_221564 ?auto_221565 ) ) ( not ( = ?auto_221564 ?auto_221566 ) ) ( not ( = ?auto_221564 ?auto_221567 ) ) ( not ( = ?auto_221564 ?auto_221568 ) ) ( not ( = ?auto_221564 ?auto_221569 ) ) ( not ( = ?auto_221564 ?auto_221570 ) ) ( not ( = ?auto_221564 ?auto_221571 ) ) ( not ( = ?auto_221564 ?auto_221572 ) ) ( not ( = ?auto_221564 ?auto_221573 ) ) ( not ( = ?auto_221565 ?auto_221566 ) ) ( not ( = ?auto_221565 ?auto_221567 ) ) ( not ( = ?auto_221565 ?auto_221568 ) ) ( not ( = ?auto_221565 ?auto_221569 ) ) ( not ( = ?auto_221565 ?auto_221570 ) ) ( not ( = ?auto_221565 ?auto_221571 ) ) ( not ( = ?auto_221565 ?auto_221572 ) ) ( not ( = ?auto_221565 ?auto_221573 ) ) ( not ( = ?auto_221566 ?auto_221567 ) ) ( not ( = ?auto_221566 ?auto_221568 ) ) ( not ( = ?auto_221566 ?auto_221569 ) ) ( not ( = ?auto_221566 ?auto_221570 ) ) ( not ( = ?auto_221566 ?auto_221571 ) ) ( not ( = ?auto_221566 ?auto_221572 ) ) ( not ( = ?auto_221566 ?auto_221573 ) ) ( not ( = ?auto_221567 ?auto_221568 ) ) ( not ( = ?auto_221567 ?auto_221569 ) ) ( not ( = ?auto_221567 ?auto_221570 ) ) ( not ( = ?auto_221567 ?auto_221571 ) ) ( not ( = ?auto_221567 ?auto_221572 ) ) ( not ( = ?auto_221567 ?auto_221573 ) ) ( not ( = ?auto_221568 ?auto_221569 ) ) ( not ( = ?auto_221568 ?auto_221570 ) ) ( not ( = ?auto_221568 ?auto_221571 ) ) ( not ( = ?auto_221568 ?auto_221572 ) ) ( not ( = ?auto_221568 ?auto_221573 ) ) ( not ( = ?auto_221569 ?auto_221570 ) ) ( not ( = ?auto_221569 ?auto_221571 ) ) ( not ( = ?auto_221569 ?auto_221572 ) ) ( not ( = ?auto_221569 ?auto_221573 ) ) ( not ( = ?auto_221570 ?auto_221571 ) ) ( not ( = ?auto_221570 ?auto_221572 ) ) ( not ( = ?auto_221570 ?auto_221573 ) ) ( not ( = ?auto_221571 ?auto_221572 ) ) ( not ( = ?auto_221571 ?auto_221573 ) ) ( not ( = ?auto_221572 ?auto_221573 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_221572 ?auto_221573 )
      ( !STACK ?auto_221572 ?auto_221571 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_221586 - BLOCK
      ?auto_221587 - BLOCK
      ?auto_221588 - BLOCK
      ?auto_221589 - BLOCK
      ?auto_221590 - BLOCK
      ?auto_221591 - BLOCK
      ?auto_221592 - BLOCK
      ?auto_221593 - BLOCK
      ?auto_221594 - BLOCK
      ?auto_221595 - BLOCK
      ?auto_221596 - BLOCK
      ?auto_221597 - BLOCK
    )
    :vars
    (
      ?auto_221598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221597 ?auto_221598 ) ( ON-TABLE ?auto_221586 ) ( ON ?auto_221587 ?auto_221586 ) ( ON ?auto_221588 ?auto_221587 ) ( ON ?auto_221589 ?auto_221588 ) ( ON ?auto_221590 ?auto_221589 ) ( ON ?auto_221591 ?auto_221590 ) ( ON ?auto_221592 ?auto_221591 ) ( ON ?auto_221593 ?auto_221592 ) ( ON ?auto_221594 ?auto_221593 ) ( ON ?auto_221595 ?auto_221594 ) ( not ( = ?auto_221586 ?auto_221587 ) ) ( not ( = ?auto_221586 ?auto_221588 ) ) ( not ( = ?auto_221586 ?auto_221589 ) ) ( not ( = ?auto_221586 ?auto_221590 ) ) ( not ( = ?auto_221586 ?auto_221591 ) ) ( not ( = ?auto_221586 ?auto_221592 ) ) ( not ( = ?auto_221586 ?auto_221593 ) ) ( not ( = ?auto_221586 ?auto_221594 ) ) ( not ( = ?auto_221586 ?auto_221595 ) ) ( not ( = ?auto_221586 ?auto_221596 ) ) ( not ( = ?auto_221586 ?auto_221597 ) ) ( not ( = ?auto_221586 ?auto_221598 ) ) ( not ( = ?auto_221587 ?auto_221588 ) ) ( not ( = ?auto_221587 ?auto_221589 ) ) ( not ( = ?auto_221587 ?auto_221590 ) ) ( not ( = ?auto_221587 ?auto_221591 ) ) ( not ( = ?auto_221587 ?auto_221592 ) ) ( not ( = ?auto_221587 ?auto_221593 ) ) ( not ( = ?auto_221587 ?auto_221594 ) ) ( not ( = ?auto_221587 ?auto_221595 ) ) ( not ( = ?auto_221587 ?auto_221596 ) ) ( not ( = ?auto_221587 ?auto_221597 ) ) ( not ( = ?auto_221587 ?auto_221598 ) ) ( not ( = ?auto_221588 ?auto_221589 ) ) ( not ( = ?auto_221588 ?auto_221590 ) ) ( not ( = ?auto_221588 ?auto_221591 ) ) ( not ( = ?auto_221588 ?auto_221592 ) ) ( not ( = ?auto_221588 ?auto_221593 ) ) ( not ( = ?auto_221588 ?auto_221594 ) ) ( not ( = ?auto_221588 ?auto_221595 ) ) ( not ( = ?auto_221588 ?auto_221596 ) ) ( not ( = ?auto_221588 ?auto_221597 ) ) ( not ( = ?auto_221588 ?auto_221598 ) ) ( not ( = ?auto_221589 ?auto_221590 ) ) ( not ( = ?auto_221589 ?auto_221591 ) ) ( not ( = ?auto_221589 ?auto_221592 ) ) ( not ( = ?auto_221589 ?auto_221593 ) ) ( not ( = ?auto_221589 ?auto_221594 ) ) ( not ( = ?auto_221589 ?auto_221595 ) ) ( not ( = ?auto_221589 ?auto_221596 ) ) ( not ( = ?auto_221589 ?auto_221597 ) ) ( not ( = ?auto_221589 ?auto_221598 ) ) ( not ( = ?auto_221590 ?auto_221591 ) ) ( not ( = ?auto_221590 ?auto_221592 ) ) ( not ( = ?auto_221590 ?auto_221593 ) ) ( not ( = ?auto_221590 ?auto_221594 ) ) ( not ( = ?auto_221590 ?auto_221595 ) ) ( not ( = ?auto_221590 ?auto_221596 ) ) ( not ( = ?auto_221590 ?auto_221597 ) ) ( not ( = ?auto_221590 ?auto_221598 ) ) ( not ( = ?auto_221591 ?auto_221592 ) ) ( not ( = ?auto_221591 ?auto_221593 ) ) ( not ( = ?auto_221591 ?auto_221594 ) ) ( not ( = ?auto_221591 ?auto_221595 ) ) ( not ( = ?auto_221591 ?auto_221596 ) ) ( not ( = ?auto_221591 ?auto_221597 ) ) ( not ( = ?auto_221591 ?auto_221598 ) ) ( not ( = ?auto_221592 ?auto_221593 ) ) ( not ( = ?auto_221592 ?auto_221594 ) ) ( not ( = ?auto_221592 ?auto_221595 ) ) ( not ( = ?auto_221592 ?auto_221596 ) ) ( not ( = ?auto_221592 ?auto_221597 ) ) ( not ( = ?auto_221592 ?auto_221598 ) ) ( not ( = ?auto_221593 ?auto_221594 ) ) ( not ( = ?auto_221593 ?auto_221595 ) ) ( not ( = ?auto_221593 ?auto_221596 ) ) ( not ( = ?auto_221593 ?auto_221597 ) ) ( not ( = ?auto_221593 ?auto_221598 ) ) ( not ( = ?auto_221594 ?auto_221595 ) ) ( not ( = ?auto_221594 ?auto_221596 ) ) ( not ( = ?auto_221594 ?auto_221597 ) ) ( not ( = ?auto_221594 ?auto_221598 ) ) ( not ( = ?auto_221595 ?auto_221596 ) ) ( not ( = ?auto_221595 ?auto_221597 ) ) ( not ( = ?auto_221595 ?auto_221598 ) ) ( not ( = ?auto_221596 ?auto_221597 ) ) ( not ( = ?auto_221596 ?auto_221598 ) ) ( not ( = ?auto_221597 ?auto_221598 ) ) ( CLEAR ?auto_221595 ) ( ON ?auto_221596 ?auto_221597 ) ( CLEAR ?auto_221596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_221586 ?auto_221587 ?auto_221588 ?auto_221589 ?auto_221590 ?auto_221591 ?auto_221592 ?auto_221593 ?auto_221594 ?auto_221595 ?auto_221596 )
      ( MAKE-12PILE ?auto_221586 ?auto_221587 ?auto_221588 ?auto_221589 ?auto_221590 ?auto_221591 ?auto_221592 ?auto_221593 ?auto_221594 ?auto_221595 ?auto_221596 ?auto_221597 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_221611 - BLOCK
      ?auto_221612 - BLOCK
      ?auto_221613 - BLOCK
      ?auto_221614 - BLOCK
      ?auto_221615 - BLOCK
      ?auto_221616 - BLOCK
      ?auto_221617 - BLOCK
      ?auto_221618 - BLOCK
      ?auto_221619 - BLOCK
      ?auto_221620 - BLOCK
      ?auto_221621 - BLOCK
      ?auto_221622 - BLOCK
    )
    :vars
    (
      ?auto_221623 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221622 ?auto_221623 ) ( ON-TABLE ?auto_221611 ) ( ON ?auto_221612 ?auto_221611 ) ( ON ?auto_221613 ?auto_221612 ) ( ON ?auto_221614 ?auto_221613 ) ( ON ?auto_221615 ?auto_221614 ) ( ON ?auto_221616 ?auto_221615 ) ( ON ?auto_221617 ?auto_221616 ) ( ON ?auto_221618 ?auto_221617 ) ( ON ?auto_221619 ?auto_221618 ) ( ON ?auto_221620 ?auto_221619 ) ( not ( = ?auto_221611 ?auto_221612 ) ) ( not ( = ?auto_221611 ?auto_221613 ) ) ( not ( = ?auto_221611 ?auto_221614 ) ) ( not ( = ?auto_221611 ?auto_221615 ) ) ( not ( = ?auto_221611 ?auto_221616 ) ) ( not ( = ?auto_221611 ?auto_221617 ) ) ( not ( = ?auto_221611 ?auto_221618 ) ) ( not ( = ?auto_221611 ?auto_221619 ) ) ( not ( = ?auto_221611 ?auto_221620 ) ) ( not ( = ?auto_221611 ?auto_221621 ) ) ( not ( = ?auto_221611 ?auto_221622 ) ) ( not ( = ?auto_221611 ?auto_221623 ) ) ( not ( = ?auto_221612 ?auto_221613 ) ) ( not ( = ?auto_221612 ?auto_221614 ) ) ( not ( = ?auto_221612 ?auto_221615 ) ) ( not ( = ?auto_221612 ?auto_221616 ) ) ( not ( = ?auto_221612 ?auto_221617 ) ) ( not ( = ?auto_221612 ?auto_221618 ) ) ( not ( = ?auto_221612 ?auto_221619 ) ) ( not ( = ?auto_221612 ?auto_221620 ) ) ( not ( = ?auto_221612 ?auto_221621 ) ) ( not ( = ?auto_221612 ?auto_221622 ) ) ( not ( = ?auto_221612 ?auto_221623 ) ) ( not ( = ?auto_221613 ?auto_221614 ) ) ( not ( = ?auto_221613 ?auto_221615 ) ) ( not ( = ?auto_221613 ?auto_221616 ) ) ( not ( = ?auto_221613 ?auto_221617 ) ) ( not ( = ?auto_221613 ?auto_221618 ) ) ( not ( = ?auto_221613 ?auto_221619 ) ) ( not ( = ?auto_221613 ?auto_221620 ) ) ( not ( = ?auto_221613 ?auto_221621 ) ) ( not ( = ?auto_221613 ?auto_221622 ) ) ( not ( = ?auto_221613 ?auto_221623 ) ) ( not ( = ?auto_221614 ?auto_221615 ) ) ( not ( = ?auto_221614 ?auto_221616 ) ) ( not ( = ?auto_221614 ?auto_221617 ) ) ( not ( = ?auto_221614 ?auto_221618 ) ) ( not ( = ?auto_221614 ?auto_221619 ) ) ( not ( = ?auto_221614 ?auto_221620 ) ) ( not ( = ?auto_221614 ?auto_221621 ) ) ( not ( = ?auto_221614 ?auto_221622 ) ) ( not ( = ?auto_221614 ?auto_221623 ) ) ( not ( = ?auto_221615 ?auto_221616 ) ) ( not ( = ?auto_221615 ?auto_221617 ) ) ( not ( = ?auto_221615 ?auto_221618 ) ) ( not ( = ?auto_221615 ?auto_221619 ) ) ( not ( = ?auto_221615 ?auto_221620 ) ) ( not ( = ?auto_221615 ?auto_221621 ) ) ( not ( = ?auto_221615 ?auto_221622 ) ) ( not ( = ?auto_221615 ?auto_221623 ) ) ( not ( = ?auto_221616 ?auto_221617 ) ) ( not ( = ?auto_221616 ?auto_221618 ) ) ( not ( = ?auto_221616 ?auto_221619 ) ) ( not ( = ?auto_221616 ?auto_221620 ) ) ( not ( = ?auto_221616 ?auto_221621 ) ) ( not ( = ?auto_221616 ?auto_221622 ) ) ( not ( = ?auto_221616 ?auto_221623 ) ) ( not ( = ?auto_221617 ?auto_221618 ) ) ( not ( = ?auto_221617 ?auto_221619 ) ) ( not ( = ?auto_221617 ?auto_221620 ) ) ( not ( = ?auto_221617 ?auto_221621 ) ) ( not ( = ?auto_221617 ?auto_221622 ) ) ( not ( = ?auto_221617 ?auto_221623 ) ) ( not ( = ?auto_221618 ?auto_221619 ) ) ( not ( = ?auto_221618 ?auto_221620 ) ) ( not ( = ?auto_221618 ?auto_221621 ) ) ( not ( = ?auto_221618 ?auto_221622 ) ) ( not ( = ?auto_221618 ?auto_221623 ) ) ( not ( = ?auto_221619 ?auto_221620 ) ) ( not ( = ?auto_221619 ?auto_221621 ) ) ( not ( = ?auto_221619 ?auto_221622 ) ) ( not ( = ?auto_221619 ?auto_221623 ) ) ( not ( = ?auto_221620 ?auto_221621 ) ) ( not ( = ?auto_221620 ?auto_221622 ) ) ( not ( = ?auto_221620 ?auto_221623 ) ) ( not ( = ?auto_221621 ?auto_221622 ) ) ( not ( = ?auto_221621 ?auto_221623 ) ) ( not ( = ?auto_221622 ?auto_221623 ) ) ( CLEAR ?auto_221620 ) ( ON ?auto_221621 ?auto_221622 ) ( CLEAR ?auto_221621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_221611 ?auto_221612 ?auto_221613 ?auto_221614 ?auto_221615 ?auto_221616 ?auto_221617 ?auto_221618 ?auto_221619 ?auto_221620 ?auto_221621 )
      ( MAKE-12PILE ?auto_221611 ?auto_221612 ?auto_221613 ?auto_221614 ?auto_221615 ?auto_221616 ?auto_221617 ?auto_221618 ?auto_221619 ?auto_221620 ?auto_221621 ?auto_221622 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_221636 - BLOCK
      ?auto_221637 - BLOCK
      ?auto_221638 - BLOCK
      ?auto_221639 - BLOCK
      ?auto_221640 - BLOCK
      ?auto_221641 - BLOCK
      ?auto_221642 - BLOCK
      ?auto_221643 - BLOCK
      ?auto_221644 - BLOCK
      ?auto_221645 - BLOCK
      ?auto_221646 - BLOCK
      ?auto_221647 - BLOCK
    )
    :vars
    (
      ?auto_221648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221647 ?auto_221648 ) ( ON-TABLE ?auto_221636 ) ( ON ?auto_221637 ?auto_221636 ) ( ON ?auto_221638 ?auto_221637 ) ( ON ?auto_221639 ?auto_221638 ) ( ON ?auto_221640 ?auto_221639 ) ( ON ?auto_221641 ?auto_221640 ) ( ON ?auto_221642 ?auto_221641 ) ( ON ?auto_221643 ?auto_221642 ) ( ON ?auto_221644 ?auto_221643 ) ( not ( = ?auto_221636 ?auto_221637 ) ) ( not ( = ?auto_221636 ?auto_221638 ) ) ( not ( = ?auto_221636 ?auto_221639 ) ) ( not ( = ?auto_221636 ?auto_221640 ) ) ( not ( = ?auto_221636 ?auto_221641 ) ) ( not ( = ?auto_221636 ?auto_221642 ) ) ( not ( = ?auto_221636 ?auto_221643 ) ) ( not ( = ?auto_221636 ?auto_221644 ) ) ( not ( = ?auto_221636 ?auto_221645 ) ) ( not ( = ?auto_221636 ?auto_221646 ) ) ( not ( = ?auto_221636 ?auto_221647 ) ) ( not ( = ?auto_221636 ?auto_221648 ) ) ( not ( = ?auto_221637 ?auto_221638 ) ) ( not ( = ?auto_221637 ?auto_221639 ) ) ( not ( = ?auto_221637 ?auto_221640 ) ) ( not ( = ?auto_221637 ?auto_221641 ) ) ( not ( = ?auto_221637 ?auto_221642 ) ) ( not ( = ?auto_221637 ?auto_221643 ) ) ( not ( = ?auto_221637 ?auto_221644 ) ) ( not ( = ?auto_221637 ?auto_221645 ) ) ( not ( = ?auto_221637 ?auto_221646 ) ) ( not ( = ?auto_221637 ?auto_221647 ) ) ( not ( = ?auto_221637 ?auto_221648 ) ) ( not ( = ?auto_221638 ?auto_221639 ) ) ( not ( = ?auto_221638 ?auto_221640 ) ) ( not ( = ?auto_221638 ?auto_221641 ) ) ( not ( = ?auto_221638 ?auto_221642 ) ) ( not ( = ?auto_221638 ?auto_221643 ) ) ( not ( = ?auto_221638 ?auto_221644 ) ) ( not ( = ?auto_221638 ?auto_221645 ) ) ( not ( = ?auto_221638 ?auto_221646 ) ) ( not ( = ?auto_221638 ?auto_221647 ) ) ( not ( = ?auto_221638 ?auto_221648 ) ) ( not ( = ?auto_221639 ?auto_221640 ) ) ( not ( = ?auto_221639 ?auto_221641 ) ) ( not ( = ?auto_221639 ?auto_221642 ) ) ( not ( = ?auto_221639 ?auto_221643 ) ) ( not ( = ?auto_221639 ?auto_221644 ) ) ( not ( = ?auto_221639 ?auto_221645 ) ) ( not ( = ?auto_221639 ?auto_221646 ) ) ( not ( = ?auto_221639 ?auto_221647 ) ) ( not ( = ?auto_221639 ?auto_221648 ) ) ( not ( = ?auto_221640 ?auto_221641 ) ) ( not ( = ?auto_221640 ?auto_221642 ) ) ( not ( = ?auto_221640 ?auto_221643 ) ) ( not ( = ?auto_221640 ?auto_221644 ) ) ( not ( = ?auto_221640 ?auto_221645 ) ) ( not ( = ?auto_221640 ?auto_221646 ) ) ( not ( = ?auto_221640 ?auto_221647 ) ) ( not ( = ?auto_221640 ?auto_221648 ) ) ( not ( = ?auto_221641 ?auto_221642 ) ) ( not ( = ?auto_221641 ?auto_221643 ) ) ( not ( = ?auto_221641 ?auto_221644 ) ) ( not ( = ?auto_221641 ?auto_221645 ) ) ( not ( = ?auto_221641 ?auto_221646 ) ) ( not ( = ?auto_221641 ?auto_221647 ) ) ( not ( = ?auto_221641 ?auto_221648 ) ) ( not ( = ?auto_221642 ?auto_221643 ) ) ( not ( = ?auto_221642 ?auto_221644 ) ) ( not ( = ?auto_221642 ?auto_221645 ) ) ( not ( = ?auto_221642 ?auto_221646 ) ) ( not ( = ?auto_221642 ?auto_221647 ) ) ( not ( = ?auto_221642 ?auto_221648 ) ) ( not ( = ?auto_221643 ?auto_221644 ) ) ( not ( = ?auto_221643 ?auto_221645 ) ) ( not ( = ?auto_221643 ?auto_221646 ) ) ( not ( = ?auto_221643 ?auto_221647 ) ) ( not ( = ?auto_221643 ?auto_221648 ) ) ( not ( = ?auto_221644 ?auto_221645 ) ) ( not ( = ?auto_221644 ?auto_221646 ) ) ( not ( = ?auto_221644 ?auto_221647 ) ) ( not ( = ?auto_221644 ?auto_221648 ) ) ( not ( = ?auto_221645 ?auto_221646 ) ) ( not ( = ?auto_221645 ?auto_221647 ) ) ( not ( = ?auto_221645 ?auto_221648 ) ) ( not ( = ?auto_221646 ?auto_221647 ) ) ( not ( = ?auto_221646 ?auto_221648 ) ) ( not ( = ?auto_221647 ?auto_221648 ) ) ( ON ?auto_221646 ?auto_221647 ) ( CLEAR ?auto_221644 ) ( ON ?auto_221645 ?auto_221646 ) ( CLEAR ?auto_221645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_221636 ?auto_221637 ?auto_221638 ?auto_221639 ?auto_221640 ?auto_221641 ?auto_221642 ?auto_221643 ?auto_221644 ?auto_221645 )
      ( MAKE-12PILE ?auto_221636 ?auto_221637 ?auto_221638 ?auto_221639 ?auto_221640 ?auto_221641 ?auto_221642 ?auto_221643 ?auto_221644 ?auto_221645 ?auto_221646 ?auto_221647 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_221661 - BLOCK
      ?auto_221662 - BLOCK
      ?auto_221663 - BLOCK
      ?auto_221664 - BLOCK
      ?auto_221665 - BLOCK
      ?auto_221666 - BLOCK
      ?auto_221667 - BLOCK
      ?auto_221668 - BLOCK
      ?auto_221669 - BLOCK
      ?auto_221670 - BLOCK
      ?auto_221671 - BLOCK
      ?auto_221672 - BLOCK
    )
    :vars
    (
      ?auto_221673 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221672 ?auto_221673 ) ( ON-TABLE ?auto_221661 ) ( ON ?auto_221662 ?auto_221661 ) ( ON ?auto_221663 ?auto_221662 ) ( ON ?auto_221664 ?auto_221663 ) ( ON ?auto_221665 ?auto_221664 ) ( ON ?auto_221666 ?auto_221665 ) ( ON ?auto_221667 ?auto_221666 ) ( ON ?auto_221668 ?auto_221667 ) ( ON ?auto_221669 ?auto_221668 ) ( not ( = ?auto_221661 ?auto_221662 ) ) ( not ( = ?auto_221661 ?auto_221663 ) ) ( not ( = ?auto_221661 ?auto_221664 ) ) ( not ( = ?auto_221661 ?auto_221665 ) ) ( not ( = ?auto_221661 ?auto_221666 ) ) ( not ( = ?auto_221661 ?auto_221667 ) ) ( not ( = ?auto_221661 ?auto_221668 ) ) ( not ( = ?auto_221661 ?auto_221669 ) ) ( not ( = ?auto_221661 ?auto_221670 ) ) ( not ( = ?auto_221661 ?auto_221671 ) ) ( not ( = ?auto_221661 ?auto_221672 ) ) ( not ( = ?auto_221661 ?auto_221673 ) ) ( not ( = ?auto_221662 ?auto_221663 ) ) ( not ( = ?auto_221662 ?auto_221664 ) ) ( not ( = ?auto_221662 ?auto_221665 ) ) ( not ( = ?auto_221662 ?auto_221666 ) ) ( not ( = ?auto_221662 ?auto_221667 ) ) ( not ( = ?auto_221662 ?auto_221668 ) ) ( not ( = ?auto_221662 ?auto_221669 ) ) ( not ( = ?auto_221662 ?auto_221670 ) ) ( not ( = ?auto_221662 ?auto_221671 ) ) ( not ( = ?auto_221662 ?auto_221672 ) ) ( not ( = ?auto_221662 ?auto_221673 ) ) ( not ( = ?auto_221663 ?auto_221664 ) ) ( not ( = ?auto_221663 ?auto_221665 ) ) ( not ( = ?auto_221663 ?auto_221666 ) ) ( not ( = ?auto_221663 ?auto_221667 ) ) ( not ( = ?auto_221663 ?auto_221668 ) ) ( not ( = ?auto_221663 ?auto_221669 ) ) ( not ( = ?auto_221663 ?auto_221670 ) ) ( not ( = ?auto_221663 ?auto_221671 ) ) ( not ( = ?auto_221663 ?auto_221672 ) ) ( not ( = ?auto_221663 ?auto_221673 ) ) ( not ( = ?auto_221664 ?auto_221665 ) ) ( not ( = ?auto_221664 ?auto_221666 ) ) ( not ( = ?auto_221664 ?auto_221667 ) ) ( not ( = ?auto_221664 ?auto_221668 ) ) ( not ( = ?auto_221664 ?auto_221669 ) ) ( not ( = ?auto_221664 ?auto_221670 ) ) ( not ( = ?auto_221664 ?auto_221671 ) ) ( not ( = ?auto_221664 ?auto_221672 ) ) ( not ( = ?auto_221664 ?auto_221673 ) ) ( not ( = ?auto_221665 ?auto_221666 ) ) ( not ( = ?auto_221665 ?auto_221667 ) ) ( not ( = ?auto_221665 ?auto_221668 ) ) ( not ( = ?auto_221665 ?auto_221669 ) ) ( not ( = ?auto_221665 ?auto_221670 ) ) ( not ( = ?auto_221665 ?auto_221671 ) ) ( not ( = ?auto_221665 ?auto_221672 ) ) ( not ( = ?auto_221665 ?auto_221673 ) ) ( not ( = ?auto_221666 ?auto_221667 ) ) ( not ( = ?auto_221666 ?auto_221668 ) ) ( not ( = ?auto_221666 ?auto_221669 ) ) ( not ( = ?auto_221666 ?auto_221670 ) ) ( not ( = ?auto_221666 ?auto_221671 ) ) ( not ( = ?auto_221666 ?auto_221672 ) ) ( not ( = ?auto_221666 ?auto_221673 ) ) ( not ( = ?auto_221667 ?auto_221668 ) ) ( not ( = ?auto_221667 ?auto_221669 ) ) ( not ( = ?auto_221667 ?auto_221670 ) ) ( not ( = ?auto_221667 ?auto_221671 ) ) ( not ( = ?auto_221667 ?auto_221672 ) ) ( not ( = ?auto_221667 ?auto_221673 ) ) ( not ( = ?auto_221668 ?auto_221669 ) ) ( not ( = ?auto_221668 ?auto_221670 ) ) ( not ( = ?auto_221668 ?auto_221671 ) ) ( not ( = ?auto_221668 ?auto_221672 ) ) ( not ( = ?auto_221668 ?auto_221673 ) ) ( not ( = ?auto_221669 ?auto_221670 ) ) ( not ( = ?auto_221669 ?auto_221671 ) ) ( not ( = ?auto_221669 ?auto_221672 ) ) ( not ( = ?auto_221669 ?auto_221673 ) ) ( not ( = ?auto_221670 ?auto_221671 ) ) ( not ( = ?auto_221670 ?auto_221672 ) ) ( not ( = ?auto_221670 ?auto_221673 ) ) ( not ( = ?auto_221671 ?auto_221672 ) ) ( not ( = ?auto_221671 ?auto_221673 ) ) ( not ( = ?auto_221672 ?auto_221673 ) ) ( ON ?auto_221671 ?auto_221672 ) ( CLEAR ?auto_221669 ) ( ON ?auto_221670 ?auto_221671 ) ( CLEAR ?auto_221670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_221661 ?auto_221662 ?auto_221663 ?auto_221664 ?auto_221665 ?auto_221666 ?auto_221667 ?auto_221668 ?auto_221669 ?auto_221670 )
      ( MAKE-12PILE ?auto_221661 ?auto_221662 ?auto_221663 ?auto_221664 ?auto_221665 ?auto_221666 ?auto_221667 ?auto_221668 ?auto_221669 ?auto_221670 ?auto_221671 ?auto_221672 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_221686 - BLOCK
      ?auto_221687 - BLOCK
      ?auto_221688 - BLOCK
      ?auto_221689 - BLOCK
      ?auto_221690 - BLOCK
      ?auto_221691 - BLOCK
      ?auto_221692 - BLOCK
      ?auto_221693 - BLOCK
      ?auto_221694 - BLOCK
      ?auto_221695 - BLOCK
      ?auto_221696 - BLOCK
      ?auto_221697 - BLOCK
    )
    :vars
    (
      ?auto_221698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221697 ?auto_221698 ) ( ON-TABLE ?auto_221686 ) ( ON ?auto_221687 ?auto_221686 ) ( ON ?auto_221688 ?auto_221687 ) ( ON ?auto_221689 ?auto_221688 ) ( ON ?auto_221690 ?auto_221689 ) ( ON ?auto_221691 ?auto_221690 ) ( ON ?auto_221692 ?auto_221691 ) ( ON ?auto_221693 ?auto_221692 ) ( not ( = ?auto_221686 ?auto_221687 ) ) ( not ( = ?auto_221686 ?auto_221688 ) ) ( not ( = ?auto_221686 ?auto_221689 ) ) ( not ( = ?auto_221686 ?auto_221690 ) ) ( not ( = ?auto_221686 ?auto_221691 ) ) ( not ( = ?auto_221686 ?auto_221692 ) ) ( not ( = ?auto_221686 ?auto_221693 ) ) ( not ( = ?auto_221686 ?auto_221694 ) ) ( not ( = ?auto_221686 ?auto_221695 ) ) ( not ( = ?auto_221686 ?auto_221696 ) ) ( not ( = ?auto_221686 ?auto_221697 ) ) ( not ( = ?auto_221686 ?auto_221698 ) ) ( not ( = ?auto_221687 ?auto_221688 ) ) ( not ( = ?auto_221687 ?auto_221689 ) ) ( not ( = ?auto_221687 ?auto_221690 ) ) ( not ( = ?auto_221687 ?auto_221691 ) ) ( not ( = ?auto_221687 ?auto_221692 ) ) ( not ( = ?auto_221687 ?auto_221693 ) ) ( not ( = ?auto_221687 ?auto_221694 ) ) ( not ( = ?auto_221687 ?auto_221695 ) ) ( not ( = ?auto_221687 ?auto_221696 ) ) ( not ( = ?auto_221687 ?auto_221697 ) ) ( not ( = ?auto_221687 ?auto_221698 ) ) ( not ( = ?auto_221688 ?auto_221689 ) ) ( not ( = ?auto_221688 ?auto_221690 ) ) ( not ( = ?auto_221688 ?auto_221691 ) ) ( not ( = ?auto_221688 ?auto_221692 ) ) ( not ( = ?auto_221688 ?auto_221693 ) ) ( not ( = ?auto_221688 ?auto_221694 ) ) ( not ( = ?auto_221688 ?auto_221695 ) ) ( not ( = ?auto_221688 ?auto_221696 ) ) ( not ( = ?auto_221688 ?auto_221697 ) ) ( not ( = ?auto_221688 ?auto_221698 ) ) ( not ( = ?auto_221689 ?auto_221690 ) ) ( not ( = ?auto_221689 ?auto_221691 ) ) ( not ( = ?auto_221689 ?auto_221692 ) ) ( not ( = ?auto_221689 ?auto_221693 ) ) ( not ( = ?auto_221689 ?auto_221694 ) ) ( not ( = ?auto_221689 ?auto_221695 ) ) ( not ( = ?auto_221689 ?auto_221696 ) ) ( not ( = ?auto_221689 ?auto_221697 ) ) ( not ( = ?auto_221689 ?auto_221698 ) ) ( not ( = ?auto_221690 ?auto_221691 ) ) ( not ( = ?auto_221690 ?auto_221692 ) ) ( not ( = ?auto_221690 ?auto_221693 ) ) ( not ( = ?auto_221690 ?auto_221694 ) ) ( not ( = ?auto_221690 ?auto_221695 ) ) ( not ( = ?auto_221690 ?auto_221696 ) ) ( not ( = ?auto_221690 ?auto_221697 ) ) ( not ( = ?auto_221690 ?auto_221698 ) ) ( not ( = ?auto_221691 ?auto_221692 ) ) ( not ( = ?auto_221691 ?auto_221693 ) ) ( not ( = ?auto_221691 ?auto_221694 ) ) ( not ( = ?auto_221691 ?auto_221695 ) ) ( not ( = ?auto_221691 ?auto_221696 ) ) ( not ( = ?auto_221691 ?auto_221697 ) ) ( not ( = ?auto_221691 ?auto_221698 ) ) ( not ( = ?auto_221692 ?auto_221693 ) ) ( not ( = ?auto_221692 ?auto_221694 ) ) ( not ( = ?auto_221692 ?auto_221695 ) ) ( not ( = ?auto_221692 ?auto_221696 ) ) ( not ( = ?auto_221692 ?auto_221697 ) ) ( not ( = ?auto_221692 ?auto_221698 ) ) ( not ( = ?auto_221693 ?auto_221694 ) ) ( not ( = ?auto_221693 ?auto_221695 ) ) ( not ( = ?auto_221693 ?auto_221696 ) ) ( not ( = ?auto_221693 ?auto_221697 ) ) ( not ( = ?auto_221693 ?auto_221698 ) ) ( not ( = ?auto_221694 ?auto_221695 ) ) ( not ( = ?auto_221694 ?auto_221696 ) ) ( not ( = ?auto_221694 ?auto_221697 ) ) ( not ( = ?auto_221694 ?auto_221698 ) ) ( not ( = ?auto_221695 ?auto_221696 ) ) ( not ( = ?auto_221695 ?auto_221697 ) ) ( not ( = ?auto_221695 ?auto_221698 ) ) ( not ( = ?auto_221696 ?auto_221697 ) ) ( not ( = ?auto_221696 ?auto_221698 ) ) ( not ( = ?auto_221697 ?auto_221698 ) ) ( ON ?auto_221696 ?auto_221697 ) ( ON ?auto_221695 ?auto_221696 ) ( CLEAR ?auto_221693 ) ( ON ?auto_221694 ?auto_221695 ) ( CLEAR ?auto_221694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_221686 ?auto_221687 ?auto_221688 ?auto_221689 ?auto_221690 ?auto_221691 ?auto_221692 ?auto_221693 ?auto_221694 )
      ( MAKE-12PILE ?auto_221686 ?auto_221687 ?auto_221688 ?auto_221689 ?auto_221690 ?auto_221691 ?auto_221692 ?auto_221693 ?auto_221694 ?auto_221695 ?auto_221696 ?auto_221697 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_221711 - BLOCK
      ?auto_221712 - BLOCK
      ?auto_221713 - BLOCK
      ?auto_221714 - BLOCK
      ?auto_221715 - BLOCK
      ?auto_221716 - BLOCK
      ?auto_221717 - BLOCK
      ?auto_221718 - BLOCK
      ?auto_221719 - BLOCK
      ?auto_221720 - BLOCK
      ?auto_221721 - BLOCK
      ?auto_221722 - BLOCK
    )
    :vars
    (
      ?auto_221723 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221722 ?auto_221723 ) ( ON-TABLE ?auto_221711 ) ( ON ?auto_221712 ?auto_221711 ) ( ON ?auto_221713 ?auto_221712 ) ( ON ?auto_221714 ?auto_221713 ) ( ON ?auto_221715 ?auto_221714 ) ( ON ?auto_221716 ?auto_221715 ) ( ON ?auto_221717 ?auto_221716 ) ( ON ?auto_221718 ?auto_221717 ) ( not ( = ?auto_221711 ?auto_221712 ) ) ( not ( = ?auto_221711 ?auto_221713 ) ) ( not ( = ?auto_221711 ?auto_221714 ) ) ( not ( = ?auto_221711 ?auto_221715 ) ) ( not ( = ?auto_221711 ?auto_221716 ) ) ( not ( = ?auto_221711 ?auto_221717 ) ) ( not ( = ?auto_221711 ?auto_221718 ) ) ( not ( = ?auto_221711 ?auto_221719 ) ) ( not ( = ?auto_221711 ?auto_221720 ) ) ( not ( = ?auto_221711 ?auto_221721 ) ) ( not ( = ?auto_221711 ?auto_221722 ) ) ( not ( = ?auto_221711 ?auto_221723 ) ) ( not ( = ?auto_221712 ?auto_221713 ) ) ( not ( = ?auto_221712 ?auto_221714 ) ) ( not ( = ?auto_221712 ?auto_221715 ) ) ( not ( = ?auto_221712 ?auto_221716 ) ) ( not ( = ?auto_221712 ?auto_221717 ) ) ( not ( = ?auto_221712 ?auto_221718 ) ) ( not ( = ?auto_221712 ?auto_221719 ) ) ( not ( = ?auto_221712 ?auto_221720 ) ) ( not ( = ?auto_221712 ?auto_221721 ) ) ( not ( = ?auto_221712 ?auto_221722 ) ) ( not ( = ?auto_221712 ?auto_221723 ) ) ( not ( = ?auto_221713 ?auto_221714 ) ) ( not ( = ?auto_221713 ?auto_221715 ) ) ( not ( = ?auto_221713 ?auto_221716 ) ) ( not ( = ?auto_221713 ?auto_221717 ) ) ( not ( = ?auto_221713 ?auto_221718 ) ) ( not ( = ?auto_221713 ?auto_221719 ) ) ( not ( = ?auto_221713 ?auto_221720 ) ) ( not ( = ?auto_221713 ?auto_221721 ) ) ( not ( = ?auto_221713 ?auto_221722 ) ) ( not ( = ?auto_221713 ?auto_221723 ) ) ( not ( = ?auto_221714 ?auto_221715 ) ) ( not ( = ?auto_221714 ?auto_221716 ) ) ( not ( = ?auto_221714 ?auto_221717 ) ) ( not ( = ?auto_221714 ?auto_221718 ) ) ( not ( = ?auto_221714 ?auto_221719 ) ) ( not ( = ?auto_221714 ?auto_221720 ) ) ( not ( = ?auto_221714 ?auto_221721 ) ) ( not ( = ?auto_221714 ?auto_221722 ) ) ( not ( = ?auto_221714 ?auto_221723 ) ) ( not ( = ?auto_221715 ?auto_221716 ) ) ( not ( = ?auto_221715 ?auto_221717 ) ) ( not ( = ?auto_221715 ?auto_221718 ) ) ( not ( = ?auto_221715 ?auto_221719 ) ) ( not ( = ?auto_221715 ?auto_221720 ) ) ( not ( = ?auto_221715 ?auto_221721 ) ) ( not ( = ?auto_221715 ?auto_221722 ) ) ( not ( = ?auto_221715 ?auto_221723 ) ) ( not ( = ?auto_221716 ?auto_221717 ) ) ( not ( = ?auto_221716 ?auto_221718 ) ) ( not ( = ?auto_221716 ?auto_221719 ) ) ( not ( = ?auto_221716 ?auto_221720 ) ) ( not ( = ?auto_221716 ?auto_221721 ) ) ( not ( = ?auto_221716 ?auto_221722 ) ) ( not ( = ?auto_221716 ?auto_221723 ) ) ( not ( = ?auto_221717 ?auto_221718 ) ) ( not ( = ?auto_221717 ?auto_221719 ) ) ( not ( = ?auto_221717 ?auto_221720 ) ) ( not ( = ?auto_221717 ?auto_221721 ) ) ( not ( = ?auto_221717 ?auto_221722 ) ) ( not ( = ?auto_221717 ?auto_221723 ) ) ( not ( = ?auto_221718 ?auto_221719 ) ) ( not ( = ?auto_221718 ?auto_221720 ) ) ( not ( = ?auto_221718 ?auto_221721 ) ) ( not ( = ?auto_221718 ?auto_221722 ) ) ( not ( = ?auto_221718 ?auto_221723 ) ) ( not ( = ?auto_221719 ?auto_221720 ) ) ( not ( = ?auto_221719 ?auto_221721 ) ) ( not ( = ?auto_221719 ?auto_221722 ) ) ( not ( = ?auto_221719 ?auto_221723 ) ) ( not ( = ?auto_221720 ?auto_221721 ) ) ( not ( = ?auto_221720 ?auto_221722 ) ) ( not ( = ?auto_221720 ?auto_221723 ) ) ( not ( = ?auto_221721 ?auto_221722 ) ) ( not ( = ?auto_221721 ?auto_221723 ) ) ( not ( = ?auto_221722 ?auto_221723 ) ) ( ON ?auto_221721 ?auto_221722 ) ( ON ?auto_221720 ?auto_221721 ) ( CLEAR ?auto_221718 ) ( ON ?auto_221719 ?auto_221720 ) ( CLEAR ?auto_221719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_221711 ?auto_221712 ?auto_221713 ?auto_221714 ?auto_221715 ?auto_221716 ?auto_221717 ?auto_221718 ?auto_221719 )
      ( MAKE-12PILE ?auto_221711 ?auto_221712 ?auto_221713 ?auto_221714 ?auto_221715 ?auto_221716 ?auto_221717 ?auto_221718 ?auto_221719 ?auto_221720 ?auto_221721 ?auto_221722 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_221736 - BLOCK
      ?auto_221737 - BLOCK
      ?auto_221738 - BLOCK
      ?auto_221739 - BLOCK
      ?auto_221740 - BLOCK
      ?auto_221741 - BLOCK
      ?auto_221742 - BLOCK
      ?auto_221743 - BLOCK
      ?auto_221744 - BLOCK
      ?auto_221745 - BLOCK
      ?auto_221746 - BLOCK
      ?auto_221747 - BLOCK
    )
    :vars
    (
      ?auto_221748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221747 ?auto_221748 ) ( ON-TABLE ?auto_221736 ) ( ON ?auto_221737 ?auto_221736 ) ( ON ?auto_221738 ?auto_221737 ) ( ON ?auto_221739 ?auto_221738 ) ( ON ?auto_221740 ?auto_221739 ) ( ON ?auto_221741 ?auto_221740 ) ( ON ?auto_221742 ?auto_221741 ) ( not ( = ?auto_221736 ?auto_221737 ) ) ( not ( = ?auto_221736 ?auto_221738 ) ) ( not ( = ?auto_221736 ?auto_221739 ) ) ( not ( = ?auto_221736 ?auto_221740 ) ) ( not ( = ?auto_221736 ?auto_221741 ) ) ( not ( = ?auto_221736 ?auto_221742 ) ) ( not ( = ?auto_221736 ?auto_221743 ) ) ( not ( = ?auto_221736 ?auto_221744 ) ) ( not ( = ?auto_221736 ?auto_221745 ) ) ( not ( = ?auto_221736 ?auto_221746 ) ) ( not ( = ?auto_221736 ?auto_221747 ) ) ( not ( = ?auto_221736 ?auto_221748 ) ) ( not ( = ?auto_221737 ?auto_221738 ) ) ( not ( = ?auto_221737 ?auto_221739 ) ) ( not ( = ?auto_221737 ?auto_221740 ) ) ( not ( = ?auto_221737 ?auto_221741 ) ) ( not ( = ?auto_221737 ?auto_221742 ) ) ( not ( = ?auto_221737 ?auto_221743 ) ) ( not ( = ?auto_221737 ?auto_221744 ) ) ( not ( = ?auto_221737 ?auto_221745 ) ) ( not ( = ?auto_221737 ?auto_221746 ) ) ( not ( = ?auto_221737 ?auto_221747 ) ) ( not ( = ?auto_221737 ?auto_221748 ) ) ( not ( = ?auto_221738 ?auto_221739 ) ) ( not ( = ?auto_221738 ?auto_221740 ) ) ( not ( = ?auto_221738 ?auto_221741 ) ) ( not ( = ?auto_221738 ?auto_221742 ) ) ( not ( = ?auto_221738 ?auto_221743 ) ) ( not ( = ?auto_221738 ?auto_221744 ) ) ( not ( = ?auto_221738 ?auto_221745 ) ) ( not ( = ?auto_221738 ?auto_221746 ) ) ( not ( = ?auto_221738 ?auto_221747 ) ) ( not ( = ?auto_221738 ?auto_221748 ) ) ( not ( = ?auto_221739 ?auto_221740 ) ) ( not ( = ?auto_221739 ?auto_221741 ) ) ( not ( = ?auto_221739 ?auto_221742 ) ) ( not ( = ?auto_221739 ?auto_221743 ) ) ( not ( = ?auto_221739 ?auto_221744 ) ) ( not ( = ?auto_221739 ?auto_221745 ) ) ( not ( = ?auto_221739 ?auto_221746 ) ) ( not ( = ?auto_221739 ?auto_221747 ) ) ( not ( = ?auto_221739 ?auto_221748 ) ) ( not ( = ?auto_221740 ?auto_221741 ) ) ( not ( = ?auto_221740 ?auto_221742 ) ) ( not ( = ?auto_221740 ?auto_221743 ) ) ( not ( = ?auto_221740 ?auto_221744 ) ) ( not ( = ?auto_221740 ?auto_221745 ) ) ( not ( = ?auto_221740 ?auto_221746 ) ) ( not ( = ?auto_221740 ?auto_221747 ) ) ( not ( = ?auto_221740 ?auto_221748 ) ) ( not ( = ?auto_221741 ?auto_221742 ) ) ( not ( = ?auto_221741 ?auto_221743 ) ) ( not ( = ?auto_221741 ?auto_221744 ) ) ( not ( = ?auto_221741 ?auto_221745 ) ) ( not ( = ?auto_221741 ?auto_221746 ) ) ( not ( = ?auto_221741 ?auto_221747 ) ) ( not ( = ?auto_221741 ?auto_221748 ) ) ( not ( = ?auto_221742 ?auto_221743 ) ) ( not ( = ?auto_221742 ?auto_221744 ) ) ( not ( = ?auto_221742 ?auto_221745 ) ) ( not ( = ?auto_221742 ?auto_221746 ) ) ( not ( = ?auto_221742 ?auto_221747 ) ) ( not ( = ?auto_221742 ?auto_221748 ) ) ( not ( = ?auto_221743 ?auto_221744 ) ) ( not ( = ?auto_221743 ?auto_221745 ) ) ( not ( = ?auto_221743 ?auto_221746 ) ) ( not ( = ?auto_221743 ?auto_221747 ) ) ( not ( = ?auto_221743 ?auto_221748 ) ) ( not ( = ?auto_221744 ?auto_221745 ) ) ( not ( = ?auto_221744 ?auto_221746 ) ) ( not ( = ?auto_221744 ?auto_221747 ) ) ( not ( = ?auto_221744 ?auto_221748 ) ) ( not ( = ?auto_221745 ?auto_221746 ) ) ( not ( = ?auto_221745 ?auto_221747 ) ) ( not ( = ?auto_221745 ?auto_221748 ) ) ( not ( = ?auto_221746 ?auto_221747 ) ) ( not ( = ?auto_221746 ?auto_221748 ) ) ( not ( = ?auto_221747 ?auto_221748 ) ) ( ON ?auto_221746 ?auto_221747 ) ( ON ?auto_221745 ?auto_221746 ) ( ON ?auto_221744 ?auto_221745 ) ( CLEAR ?auto_221742 ) ( ON ?auto_221743 ?auto_221744 ) ( CLEAR ?auto_221743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_221736 ?auto_221737 ?auto_221738 ?auto_221739 ?auto_221740 ?auto_221741 ?auto_221742 ?auto_221743 )
      ( MAKE-12PILE ?auto_221736 ?auto_221737 ?auto_221738 ?auto_221739 ?auto_221740 ?auto_221741 ?auto_221742 ?auto_221743 ?auto_221744 ?auto_221745 ?auto_221746 ?auto_221747 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_221761 - BLOCK
      ?auto_221762 - BLOCK
      ?auto_221763 - BLOCK
      ?auto_221764 - BLOCK
      ?auto_221765 - BLOCK
      ?auto_221766 - BLOCK
      ?auto_221767 - BLOCK
      ?auto_221768 - BLOCK
      ?auto_221769 - BLOCK
      ?auto_221770 - BLOCK
      ?auto_221771 - BLOCK
      ?auto_221772 - BLOCK
    )
    :vars
    (
      ?auto_221773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221772 ?auto_221773 ) ( ON-TABLE ?auto_221761 ) ( ON ?auto_221762 ?auto_221761 ) ( ON ?auto_221763 ?auto_221762 ) ( ON ?auto_221764 ?auto_221763 ) ( ON ?auto_221765 ?auto_221764 ) ( ON ?auto_221766 ?auto_221765 ) ( ON ?auto_221767 ?auto_221766 ) ( not ( = ?auto_221761 ?auto_221762 ) ) ( not ( = ?auto_221761 ?auto_221763 ) ) ( not ( = ?auto_221761 ?auto_221764 ) ) ( not ( = ?auto_221761 ?auto_221765 ) ) ( not ( = ?auto_221761 ?auto_221766 ) ) ( not ( = ?auto_221761 ?auto_221767 ) ) ( not ( = ?auto_221761 ?auto_221768 ) ) ( not ( = ?auto_221761 ?auto_221769 ) ) ( not ( = ?auto_221761 ?auto_221770 ) ) ( not ( = ?auto_221761 ?auto_221771 ) ) ( not ( = ?auto_221761 ?auto_221772 ) ) ( not ( = ?auto_221761 ?auto_221773 ) ) ( not ( = ?auto_221762 ?auto_221763 ) ) ( not ( = ?auto_221762 ?auto_221764 ) ) ( not ( = ?auto_221762 ?auto_221765 ) ) ( not ( = ?auto_221762 ?auto_221766 ) ) ( not ( = ?auto_221762 ?auto_221767 ) ) ( not ( = ?auto_221762 ?auto_221768 ) ) ( not ( = ?auto_221762 ?auto_221769 ) ) ( not ( = ?auto_221762 ?auto_221770 ) ) ( not ( = ?auto_221762 ?auto_221771 ) ) ( not ( = ?auto_221762 ?auto_221772 ) ) ( not ( = ?auto_221762 ?auto_221773 ) ) ( not ( = ?auto_221763 ?auto_221764 ) ) ( not ( = ?auto_221763 ?auto_221765 ) ) ( not ( = ?auto_221763 ?auto_221766 ) ) ( not ( = ?auto_221763 ?auto_221767 ) ) ( not ( = ?auto_221763 ?auto_221768 ) ) ( not ( = ?auto_221763 ?auto_221769 ) ) ( not ( = ?auto_221763 ?auto_221770 ) ) ( not ( = ?auto_221763 ?auto_221771 ) ) ( not ( = ?auto_221763 ?auto_221772 ) ) ( not ( = ?auto_221763 ?auto_221773 ) ) ( not ( = ?auto_221764 ?auto_221765 ) ) ( not ( = ?auto_221764 ?auto_221766 ) ) ( not ( = ?auto_221764 ?auto_221767 ) ) ( not ( = ?auto_221764 ?auto_221768 ) ) ( not ( = ?auto_221764 ?auto_221769 ) ) ( not ( = ?auto_221764 ?auto_221770 ) ) ( not ( = ?auto_221764 ?auto_221771 ) ) ( not ( = ?auto_221764 ?auto_221772 ) ) ( not ( = ?auto_221764 ?auto_221773 ) ) ( not ( = ?auto_221765 ?auto_221766 ) ) ( not ( = ?auto_221765 ?auto_221767 ) ) ( not ( = ?auto_221765 ?auto_221768 ) ) ( not ( = ?auto_221765 ?auto_221769 ) ) ( not ( = ?auto_221765 ?auto_221770 ) ) ( not ( = ?auto_221765 ?auto_221771 ) ) ( not ( = ?auto_221765 ?auto_221772 ) ) ( not ( = ?auto_221765 ?auto_221773 ) ) ( not ( = ?auto_221766 ?auto_221767 ) ) ( not ( = ?auto_221766 ?auto_221768 ) ) ( not ( = ?auto_221766 ?auto_221769 ) ) ( not ( = ?auto_221766 ?auto_221770 ) ) ( not ( = ?auto_221766 ?auto_221771 ) ) ( not ( = ?auto_221766 ?auto_221772 ) ) ( not ( = ?auto_221766 ?auto_221773 ) ) ( not ( = ?auto_221767 ?auto_221768 ) ) ( not ( = ?auto_221767 ?auto_221769 ) ) ( not ( = ?auto_221767 ?auto_221770 ) ) ( not ( = ?auto_221767 ?auto_221771 ) ) ( not ( = ?auto_221767 ?auto_221772 ) ) ( not ( = ?auto_221767 ?auto_221773 ) ) ( not ( = ?auto_221768 ?auto_221769 ) ) ( not ( = ?auto_221768 ?auto_221770 ) ) ( not ( = ?auto_221768 ?auto_221771 ) ) ( not ( = ?auto_221768 ?auto_221772 ) ) ( not ( = ?auto_221768 ?auto_221773 ) ) ( not ( = ?auto_221769 ?auto_221770 ) ) ( not ( = ?auto_221769 ?auto_221771 ) ) ( not ( = ?auto_221769 ?auto_221772 ) ) ( not ( = ?auto_221769 ?auto_221773 ) ) ( not ( = ?auto_221770 ?auto_221771 ) ) ( not ( = ?auto_221770 ?auto_221772 ) ) ( not ( = ?auto_221770 ?auto_221773 ) ) ( not ( = ?auto_221771 ?auto_221772 ) ) ( not ( = ?auto_221771 ?auto_221773 ) ) ( not ( = ?auto_221772 ?auto_221773 ) ) ( ON ?auto_221771 ?auto_221772 ) ( ON ?auto_221770 ?auto_221771 ) ( ON ?auto_221769 ?auto_221770 ) ( CLEAR ?auto_221767 ) ( ON ?auto_221768 ?auto_221769 ) ( CLEAR ?auto_221768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_221761 ?auto_221762 ?auto_221763 ?auto_221764 ?auto_221765 ?auto_221766 ?auto_221767 ?auto_221768 )
      ( MAKE-12PILE ?auto_221761 ?auto_221762 ?auto_221763 ?auto_221764 ?auto_221765 ?auto_221766 ?auto_221767 ?auto_221768 ?auto_221769 ?auto_221770 ?auto_221771 ?auto_221772 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_221786 - BLOCK
      ?auto_221787 - BLOCK
      ?auto_221788 - BLOCK
      ?auto_221789 - BLOCK
      ?auto_221790 - BLOCK
      ?auto_221791 - BLOCK
      ?auto_221792 - BLOCK
      ?auto_221793 - BLOCK
      ?auto_221794 - BLOCK
      ?auto_221795 - BLOCK
      ?auto_221796 - BLOCK
      ?auto_221797 - BLOCK
    )
    :vars
    (
      ?auto_221798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221797 ?auto_221798 ) ( ON-TABLE ?auto_221786 ) ( ON ?auto_221787 ?auto_221786 ) ( ON ?auto_221788 ?auto_221787 ) ( ON ?auto_221789 ?auto_221788 ) ( ON ?auto_221790 ?auto_221789 ) ( ON ?auto_221791 ?auto_221790 ) ( not ( = ?auto_221786 ?auto_221787 ) ) ( not ( = ?auto_221786 ?auto_221788 ) ) ( not ( = ?auto_221786 ?auto_221789 ) ) ( not ( = ?auto_221786 ?auto_221790 ) ) ( not ( = ?auto_221786 ?auto_221791 ) ) ( not ( = ?auto_221786 ?auto_221792 ) ) ( not ( = ?auto_221786 ?auto_221793 ) ) ( not ( = ?auto_221786 ?auto_221794 ) ) ( not ( = ?auto_221786 ?auto_221795 ) ) ( not ( = ?auto_221786 ?auto_221796 ) ) ( not ( = ?auto_221786 ?auto_221797 ) ) ( not ( = ?auto_221786 ?auto_221798 ) ) ( not ( = ?auto_221787 ?auto_221788 ) ) ( not ( = ?auto_221787 ?auto_221789 ) ) ( not ( = ?auto_221787 ?auto_221790 ) ) ( not ( = ?auto_221787 ?auto_221791 ) ) ( not ( = ?auto_221787 ?auto_221792 ) ) ( not ( = ?auto_221787 ?auto_221793 ) ) ( not ( = ?auto_221787 ?auto_221794 ) ) ( not ( = ?auto_221787 ?auto_221795 ) ) ( not ( = ?auto_221787 ?auto_221796 ) ) ( not ( = ?auto_221787 ?auto_221797 ) ) ( not ( = ?auto_221787 ?auto_221798 ) ) ( not ( = ?auto_221788 ?auto_221789 ) ) ( not ( = ?auto_221788 ?auto_221790 ) ) ( not ( = ?auto_221788 ?auto_221791 ) ) ( not ( = ?auto_221788 ?auto_221792 ) ) ( not ( = ?auto_221788 ?auto_221793 ) ) ( not ( = ?auto_221788 ?auto_221794 ) ) ( not ( = ?auto_221788 ?auto_221795 ) ) ( not ( = ?auto_221788 ?auto_221796 ) ) ( not ( = ?auto_221788 ?auto_221797 ) ) ( not ( = ?auto_221788 ?auto_221798 ) ) ( not ( = ?auto_221789 ?auto_221790 ) ) ( not ( = ?auto_221789 ?auto_221791 ) ) ( not ( = ?auto_221789 ?auto_221792 ) ) ( not ( = ?auto_221789 ?auto_221793 ) ) ( not ( = ?auto_221789 ?auto_221794 ) ) ( not ( = ?auto_221789 ?auto_221795 ) ) ( not ( = ?auto_221789 ?auto_221796 ) ) ( not ( = ?auto_221789 ?auto_221797 ) ) ( not ( = ?auto_221789 ?auto_221798 ) ) ( not ( = ?auto_221790 ?auto_221791 ) ) ( not ( = ?auto_221790 ?auto_221792 ) ) ( not ( = ?auto_221790 ?auto_221793 ) ) ( not ( = ?auto_221790 ?auto_221794 ) ) ( not ( = ?auto_221790 ?auto_221795 ) ) ( not ( = ?auto_221790 ?auto_221796 ) ) ( not ( = ?auto_221790 ?auto_221797 ) ) ( not ( = ?auto_221790 ?auto_221798 ) ) ( not ( = ?auto_221791 ?auto_221792 ) ) ( not ( = ?auto_221791 ?auto_221793 ) ) ( not ( = ?auto_221791 ?auto_221794 ) ) ( not ( = ?auto_221791 ?auto_221795 ) ) ( not ( = ?auto_221791 ?auto_221796 ) ) ( not ( = ?auto_221791 ?auto_221797 ) ) ( not ( = ?auto_221791 ?auto_221798 ) ) ( not ( = ?auto_221792 ?auto_221793 ) ) ( not ( = ?auto_221792 ?auto_221794 ) ) ( not ( = ?auto_221792 ?auto_221795 ) ) ( not ( = ?auto_221792 ?auto_221796 ) ) ( not ( = ?auto_221792 ?auto_221797 ) ) ( not ( = ?auto_221792 ?auto_221798 ) ) ( not ( = ?auto_221793 ?auto_221794 ) ) ( not ( = ?auto_221793 ?auto_221795 ) ) ( not ( = ?auto_221793 ?auto_221796 ) ) ( not ( = ?auto_221793 ?auto_221797 ) ) ( not ( = ?auto_221793 ?auto_221798 ) ) ( not ( = ?auto_221794 ?auto_221795 ) ) ( not ( = ?auto_221794 ?auto_221796 ) ) ( not ( = ?auto_221794 ?auto_221797 ) ) ( not ( = ?auto_221794 ?auto_221798 ) ) ( not ( = ?auto_221795 ?auto_221796 ) ) ( not ( = ?auto_221795 ?auto_221797 ) ) ( not ( = ?auto_221795 ?auto_221798 ) ) ( not ( = ?auto_221796 ?auto_221797 ) ) ( not ( = ?auto_221796 ?auto_221798 ) ) ( not ( = ?auto_221797 ?auto_221798 ) ) ( ON ?auto_221796 ?auto_221797 ) ( ON ?auto_221795 ?auto_221796 ) ( ON ?auto_221794 ?auto_221795 ) ( ON ?auto_221793 ?auto_221794 ) ( CLEAR ?auto_221791 ) ( ON ?auto_221792 ?auto_221793 ) ( CLEAR ?auto_221792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_221786 ?auto_221787 ?auto_221788 ?auto_221789 ?auto_221790 ?auto_221791 ?auto_221792 )
      ( MAKE-12PILE ?auto_221786 ?auto_221787 ?auto_221788 ?auto_221789 ?auto_221790 ?auto_221791 ?auto_221792 ?auto_221793 ?auto_221794 ?auto_221795 ?auto_221796 ?auto_221797 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_221811 - BLOCK
      ?auto_221812 - BLOCK
      ?auto_221813 - BLOCK
      ?auto_221814 - BLOCK
      ?auto_221815 - BLOCK
      ?auto_221816 - BLOCK
      ?auto_221817 - BLOCK
      ?auto_221818 - BLOCK
      ?auto_221819 - BLOCK
      ?auto_221820 - BLOCK
      ?auto_221821 - BLOCK
      ?auto_221822 - BLOCK
    )
    :vars
    (
      ?auto_221823 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221822 ?auto_221823 ) ( ON-TABLE ?auto_221811 ) ( ON ?auto_221812 ?auto_221811 ) ( ON ?auto_221813 ?auto_221812 ) ( ON ?auto_221814 ?auto_221813 ) ( ON ?auto_221815 ?auto_221814 ) ( ON ?auto_221816 ?auto_221815 ) ( not ( = ?auto_221811 ?auto_221812 ) ) ( not ( = ?auto_221811 ?auto_221813 ) ) ( not ( = ?auto_221811 ?auto_221814 ) ) ( not ( = ?auto_221811 ?auto_221815 ) ) ( not ( = ?auto_221811 ?auto_221816 ) ) ( not ( = ?auto_221811 ?auto_221817 ) ) ( not ( = ?auto_221811 ?auto_221818 ) ) ( not ( = ?auto_221811 ?auto_221819 ) ) ( not ( = ?auto_221811 ?auto_221820 ) ) ( not ( = ?auto_221811 ?auto_221821 ) ) ( not ( = ?auto_221811 ?auto_221822 ) ) ( not ( = ?auto_221811 ?auto_221823 ) ) ( not ( = ?auto_221812 ?auto_221813 ) ) ( not ( = ?auto_221812 ?auto_221814 ) ) ( not ( = ?auto_221812 ?auto_221815 ) ) ( not ( = ?auto_221812 ?auto_221816 ) ) ( not ( = ?auto_221812 ?auto_221817 ) ) ( not ( = ?auto_221812 ?auto_221818 ) ) ( not ( = ?auto_221812 ?auto_221819 ) ) ( not ( = ?auto_221812 ?auto_221820 ) ) ( not ( = ?auto_221812 ?auto_221821 ) ) ( not ( = ?auto_221812 ?auto_221822 ) ) ( not ( = ?auto_221812 ?auto_221823 ) ) ( not ( = ?auto_221813 ?auto_221814 ) ) ( not ( = ?auto_221813 ?auto_221815 ) ) ( not ( = ?auto_221813 ?auto_221816 ) ) ( not ( = ?auto_221813 ?auto_221817 ) ) ( not ( = ?auto_221813 ?auto_221818 ) ) ( not ( = ?auto_221813 ?auto_221819 ) ) ( not ( = ?auto_221813 ?auto_221820 ) ) ( not ( = ?auto_221813 ?auto_221821 ) ) ( not ( = ?auto_221813 ?auto_221822 ) ) ( not ( = ?auto_221813 ?auto_221823 ) ) ( not ( = ?auto_221814 ?auto_221815 ) ) ( not ( = ?auto_221814 ?auto_221816 ) ) ( not ( = ?auto_221814 ?auto_221817 ) ) ( not ( = ?auto_221814 ?auto_221818 ) ) ( not ( = ?auto_221814 ?auto_221819 ) ) ( not ( = ?auto_221814 ?auto_221820 ) ) ( not ( = ?auto_221814 ?auto_221821 ) ) ( not ( = ?auto_221814 ?auto_221822 ) ) ( not ( = ?auto_221814 ?auto_221823 ) ) ( not ( = ?auto_221815 ?auto_221816 ) ) ( not ( = ?auto_221815 ?auto_221817 ) ) ( not ( = ?auto_221815 ?auto_221818 ) ) ( not ( = ?auto_221815 ?auto_221819 ) ) ( not ( = ?auto_221815 ?auto_221820 ) ) ( not ( = ?auto_221815 ?auto_221821 ) ) ( not ( = ?auto_221815 ?auto_221822 ) ) ( not ( = ?auto_221815 ?auto_221823 ) ) ( not ( = ?auto_221816 ?auto_221817 ) ) ( not ( = ?auto_221816 ?auto_221818 ) ) ( not ( = ?auto_221816 ?auto_221819 ) ) ( not ( = ?auto_221816 ?auto_221820 ) ) ( not ( = ?auto_221816 ?auto_221821 ) ) ( not ( = ?auto_221816 ?auto_221822 ) ) ( not ( = ?auto_221816 ?auto_221823 ) ) ( not ( = ?auto_221817 ?auto_221818 ) ) ( not ( = ?auto_221817 ?auto_221819 ) ) ( not ( = ?auto_221817 ?auto_221820 ) ) ( not ( = ?auto_221817 ?auto_221821 ) ) ( not ( = ?auto_221817 ?auto_221822 ) ) ( not ( = ?auto_221817 ?auto_221823 ) ) ( not ( = ?auto_221818 ?auto_221819 ) ) ( not ( = ?auto_221818 ?auto_221820 ) ) ( not ( = ?auto_221818 ?auto_221821 ) ) ( not ( = ?auto_221818 ?auto_221822 ) ) ( not ( = ?auto_221818 ?auto_221823 ) ) ( not ( = ?auto_221819 ?auto_221820 ) ) ( not ( = ?auto_221819 ?auto_221821 ) ) ( not ( = ?auto_221819 ?auto_221822 ) ) ( not ( = ?auto_221819 ?auto_221823 ) ) ( not ( = ?auto_221820 ?auto_221821 ) ) ( not ( = ?auto_221820 ?auto_221822 ) ) ( not ( = ?auto_221820 ?auto_221823 ) ) ( not ( = ?auto_221821 ?auto_221822 ) ) ( not ( = ?auto_221821 ?auto_221823 ) ) ( not ( = ?auto_221822 ?auto_221823 ) ) ( ON ?auto_221821 ?auto_221822 ) ( ON ?auto_221820 ?auto_221821 ) ( ON ?auto_221819 ?auto_221820 ) ( ON ?auto_221818 ?auto_221819 ) ( CLEAR ?auto_221816 ) ( ON ?auto_221817 ?auto_221818 ) ( CLEAR ?auto_221817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_221811 ?auto_221812 ?auto_221813 ?auto_221814 ?auto_221815 ?auto_221816 ?auto_221817 )
      ( MAKE-12PILE ?auto_221811 ?auto_221812 ?auto_221813 ?auto_221814 ?auto_221815 ?auto_221816 ?auto_221817 ?auto_221818 ?auto_221819 ?auto_221820 ?auto_221821 ?auto_221822 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_221836 - BLOCK
      ?auto_221837 - BLOCK
      ?auto_221838 - BLOCK
      ?auto_221839 - BLOCK
      ?auto_221840 - BLOCK
      ?auto_221841 - BLOCK
      ?auto_221842 - BLOCK
      ?auto_221843 - BLOCK
      ?auto_221844 - BLOCK
      ?auto_221845 - BLOCK
      ?auto_221846 - BLOCK
      ?auto_221847 - BLOCK
    )
    :vars
    (
      ?auto_221848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221847 ?auto_221848 ) ( ON-TABLE ?auto_221836 ) ( ON ?auto_221837 ?auto_221836 ) ( ON ?auto_221838 ?auto_221837 ) ( ON ?auto_221839 ?auto_221838 ) ( ON ?auto_221840 ?auto_221839 ) ( not ( = ?auto_221836 ?auto_221837 ) ) ( not ( = ?auto_221836 ?auto_221838 ) ) ( not ( = ?auto_221836 ?auto_221839 ) ) ( not ( = ?auto_221836 ?auto_221840 ) ) ( not ( = ?auto_221836 ?auto_221841 ) ) ( not ( = ?auto_221836 ?auto_221842 ) ) ( not ( = ?auto_221836 ?auto_221843 ) ) ( not ( = ?auto_221836 ?auto_221844 ) ) ( not ( = ?auto_221836 ?auto_221845 ) ) ( not ( = ?auto_221836 ?auto_221846 ) ) ( not ( = ?auto_221836 ?auto_221847 ) ) ( not ( = ?auto_221836 ?auto_221848 ) ) ( not ( = ?auto_221837 ?auto_221838 ) ) ( not ( = ?auto_221837 ?auto_221839 ) ) ( not ( = ?auto_221837 ?auto_221840 ) ) ( not ( = ?auto_221837 ?auto_221841 ) ) ( not ( = ?auto_221837 ?auto_221842 ) ) ( not ( = ?auto_221837 ?auto_221843 ) ) ( not ( = ?auto_221837 ?auto_221844 ) ) ( not ( = ?auto_221837 ?auto_221845 ) ) ( not ( = ?auto_221837 ?auto_221846 ) ) ( not ( = ?auto_221837 ?auto_221847 ) ) ( not ( = ?auto_221837 ?auto_221848 ) ) ( not ( = ?auto_221838 ?auto_221839 ) ) ( not ( = ?auto_221838 ?auto_221840 ) ) ( not ( = ?auto_221838 ?auto_221841 ) ) ( not ( = ?auto_221838 ?auto_221842 ) ) ( not ( = ?auto_221838 ?auto_221843 ) ) ( not ( = ?auto_221838 ?auto_221844 ) ) ( not ( = ?auto_221838 ?auto_221845 ) ) ( not ( = ?auto_221838 ?auto_221846 ) ) ( not ( = ?auto_221838 ?auto_221847 ) ) ( not ( = ?auto_221838 ?auto_221848 ) ) ( not ( = ?auto_221839 ?auto_221840 ) ) ( not ( = ?auto_221839 ?auto_221841 ) ) ( not ( = ?auto_221839 ?auto_221842 ) ) ( not ( = ?auto_221839 ?auto_221843 ) ) ( not ( = ?auto_221839 ?auto_221844 ) ) ( not ( = ?auto_221839 ?auto_221845 ) ) ( not ( = ?auto_221839 ?auto_221846 ) ) ( not ( = ?auto_221839 ?auto_221847 ) ) ( not ( = ?auto_221839 ?auto_221848 ) ) ( not ( = ?auto_221840 ?auto_221841 ) ) ( not ( = ?auto_221840 ?auto_221842 ) ) ( not ( = ?auto_221840 ?auto_221843 ) ) ( not ( = ?auto_221840 ?auto_221844 ) ) ( not ( = ?auto_221840 ?auto_221845 ) ) ( not ( = ?auto_221840 ?auto_221846 ) ) ( not ( = ?auto_221840 ?auto_221847 ) ) ( not ( = ?auto_221840 ?auto_221848 ) ) ( not ( = ?auto_221841 ?auto_221842 ) ) ( not ( = ?auto_221841 ?auto_221843 ) ) ( not ( = ?auto_221841 ?auto_221844 ) ) ( not ( = ?auto_221841 ?auto_221845 ) ) ( not ( = ?auto_221841 ?auto_221846 ) ) ( not ( = ?auto_221841 ?auto_221847 ) ) ( not ( = ?auto_221841 ?auto_221848 ) ) ( not ( = ?auto_221842 ?auto_221843 ) ) ( not ( = ?auto_221842 ?auto_221844 ) ) ( not ( = ?auto_221842 ?auto_221845 ) ) ( not ( = ?auto_221842 ?auto_221846 ) ) ( not ( = ?auto_221842 ?auto_221847 ) ) ( not ( = ?auto_221842 ?auto_221848 ) ) ( not ( = ?auto_221843 ?auto_221844 ) ) ( not ( = ?auto_221843 ?auto_221845 ) ) ( not ( = ?auto_221843 ?auto_221846 ) ) ( not ( = ?auto_221843 ?auto_221847 ) ) ( not ( = ?auto_221843 ?auto_221848 ) ) ( not ( = ?auto_221844 ?auto_221845 ) ) ( not ( = ?auto_221844 ?auto_221846 ) ) ( not ( = ?auto_221844 ?auto_221847 ) ) ( not ( = ?auto_221844 ?auto_221848 ) ) ( not ( = ?auto_221845 ?auto_221846 ) ) ( not ( = ?auto_221845 ?auto_221847 ) ) ( not ( = ?auto_221845 ?auto_221848 ) ) ( not ( = ?auto_221846 ?auto_221847 ) ) ( not ( = ?auto_221846 ?auto_221848 ) ) ( not ( = ?auto_221847 ?auto_221848 ) ) ( ON ?auto_221846 ?auto_221847 ) ( ON ?auto_221845 ?auto_221846 ) ( ON ?auto_221844 ?auto_221845 ) ( ON ?auto_221843 ?auto_221844 ) ( ON ?auto_221842 ?auto_221843 ) ( CLEAR ?auto_221840 ) ( ON ?auto_221841 ?auto_221842 ) ( CLEAR ?auto_221841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_221836 ?auto_221837 ?auto_221838 ?auto_221839 ?auto_221840 ?auto_221841 )
      ( MAKE-12PILE ?auto_221836 ?auto_221837 ?auto_221838 ?auto_221839 ?auto_221840 ?auto_221841 ?auto_221842 ?auto_221843 ?auto_221844 ?auto_221845 ?auto_221846 ?auto_221847 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_221861 - BLOCK
      ?auto_221862 - BLOCK
      ?auto_221863 - BLOCK
      ?auto_221864 - BLOCK
      ?auto_221865 - BLOCK
      ?auto_221866 - BLOCK
      ?auto_221867 - BLOCK
      ?auto_221868 - BLOCK
      ?auto_221869 - BLOCK
      ?auto_221870 - BLOCK
      ?auto_221871 - BLOCK
      ?auto_221872 - BLOCK
    )
    :vars
    (
      ?auto_221873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221872 ?auto_221873 ) ( ON-TABLE ?auto_221861 ) ( ON ?auto_221862 ?auto_221861 ) ( ON ?auto_221863 ?auto_221862 ) ( ON ?auto_221864 ?auto_221863 ) ( ON ?auto_221865 ?auto_221864 ) ( not ( = ?auto_221861 ?auto_221862 ) ) ( not ( = ?auto_221861 ?auto_221863 ) ) ( not ( = ?auto_221861 ?auto_221864 ) ) ( not ( = ?auto_221861 ?auto_221865 ) ) ( not ( = ?auto_221861 ?auto_221866 ) ) ( not ( = ?auto_221861 ?auto_221867 ) ) ( not ( = ?auto_221861 ?auto_221868 ) ) ( not ( = ?auto_221861 ?auto_221869 ) ) ( not ( = ?auto_221861 ?auto_221870 ) ) ( not ( = ?auto_221861 ?auto_221871 ) ) ( not ( = ?auto_221861 ?auto_221872 ) ) ( not ( = ?auto_221861 ?auto_221873 ) ) ( not ( = ?auto_221862 ?auto_221863 ) ) ( not ( = ?auto_221862 ?auto_221864 ) ) ( not ( = ?auto_221862 ?auto_221865 ) ) ( not ( = ?auto_221862 ?auto_221866 ) ) ( not ( = ?auto_221862 ?auto_221867 ) ) ( not ( = ?auto_221862 ?auto_221868 ) ) ( not ( = ?auto_221862 ?auto_221869 ) ) ( not ( = ?auto_221862 ?auto_221870 ) ) ( not ( = ?auto_221862 ?auto_221871 ) ) ( not ( = ?auto_221862 ?auto_221872 ) ) ( not ( = ?auto_221862 ?auto_221873 ) ) ( not ( = ?auto_221863 ?auto_221864 ) ) ( not ( = ?auto_221863 ?auto_221865 ) ) ( not ( = ?auto_221863 ?auto_221866 ) ) ( not ( = ?auto_221863 ?auto_221867 ) ) ( not ( = ?auto_221863 ?auto_221868 ) ) ( not ( = ?auto_221863 ?auto_221869 ) ) ( not ( = ?auto_221863 ?auto_221870 ) ) ( not ( = ?auto_221863 ?auto_221871 ) ) ( not ( = ?auto_221863 ?auto_221872 ) ) ( not ( = ?auto_221863 ?auto_221873 ) ) ( not ( = ?auto_221864 ?auto_221865 ) ) ( not ( = ?auto_221864 ?auto_221866 ) ) ( not ( = ?auto_221864 ?auto_221867 ) ) ( not ( = ?auto_221864 ?auto_221868 ) ) ( not ( = ?auto_221864 ?auto_221869 ) ) ( not ( = ?auto_221864 ?auto_221870 ) ) ( not ( = ?auto_221864 ?auto_221871 ) ) ( not ( = ?auto_221864 ?auto_221872 ) ) ( not ( = ?auto_221864 ?auto_221873 ) ) ( not ( = ?auto_221865 ?auto_221866 ) ) ( not ( = ?auto_221865 ?auto_221867 ) ) ( not ( = ?auto_221865 ?auto_221868 ) ) ( not ( = ?auto_221865 ?auto_221869 ) ) ( not ( = ?auto_221865 ?auto_221870 ) ) ( not ( = ?auto_221865 ?auto_221871 ) ) ( not ( = ?auto_221865 ?auto_221872 ) ) ( not ( = ?auto_221865 ?auto_221873 ) ) ( not ( = ?auto_221866 ?auto_221867 ) ) ( not ( = ?auto_221866 ?auto_221868 ) ) ( not ( = ?auto_221866 ?auto_221869 ) ) ( not ( = ?auto_221866 ?auto_221870 ) ) ( not ( = ?auto_221866 ?auto_221871 ) ) ( not ( = ?auto_221866 ?auto_221872 ) ) ( not ( = ?auto_221866 ?auto_221873 ) ) ( not ( = ?auto_221867 ?auto_221868 ) ) ( not ( = ?auto_221867 ?auto_221869 ) ) ( not ( = ?auto_221867 ?auto_221870 ) ) ( not ( = ?auto_221867 ?auto_221871 ) ) ( not ( = ?auto_221867 ?auto_221872 ) ) ( not ( = ?auto_221867 ?auto_221873 ) ) ( not ( = ?auto_221868 ?auto_221869 ) ) ( not ( = ?auto_221868 ?auto_221870 ) ) ( not ( = ?auto_221868 ?auto_221871 ) ) ( not ( = ?auto_221868 ?auto_221872 ) ) ( not ( = ?auto_221868 ?auto_221873 ) ) ( not ( = ?auto_221869 ?auto_221870 ) ) ( not ( = ?auto_221869 ?auto_221871 ) ) ( not ( = ?auto_221869 ?auto_221872 ) ) ( not ( = ?auto_221869 ?auto_221873 ) ) ( not ( = ?auto_221870 ?auto_221871 ) ) ( not ( = ?auto_221870 ?auto_221872 ) ) ( not ( = ?auto_221870 ?auto_221873 ) ) ( not ( = ?auto_221871 ?auto_221872 ) ) ( not ( = ?auto_221871 ?auto_221873 ) ) ( not ( = ?auto_221872 ?auto_221873 ) ) ( ON ?auto_221871 ?auto_221872 ) ( ON ?auto_221870 ?auto_221871 ) ( ON ?auto_221869 ?auto_221870 ) ( ON ?auto_221868 ?auto_221869 ) ( ON ?auto_221867 ?auto_221868 ) ( CLEAR ?auto_221865 ) ( ON ?auto_221866 ?auto_221867 ) ( CLEAR ?auto_221866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_221861 ?auto_221862 ?auto_221863 ?auto_221864 ?auto_221865 ?auto_221866 )
      ( MAKE-12PILE ?auto_221861 ?auto_221862 ?auto_221863 ?auto_221864 ?auto_221865 ?auto_221866 ?auto_221867 ?auto_221868 ?auto_221869 ?auto_221870 ?auto_221871 ?auto_221872 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_221886 - BLOCK
      ?auto_221887 - BLOCK
      ?auto_221888 - BLOCK
      ?auto_221889 - BLOCK
      ?auto_221890 - BLOCK
      ?auto_221891 - BLOCK
      ?auto_221892 - BLOCK
      ?auto_221893 - BLOCK
      ?auto_221894 - BLOCK
      ?auto_221895 - BLOCK
      ?auto_221896 - BLOCK
      ?auto_221897 - BLOCK
    )
    :vars
    (
      ?auto_221898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221897 ?auto_221898 ) ( ON-TABLE ?auto_221886 ) ( ON ?auto_221887 ?auto_221886 ) ( ON ?auto_221888 ?auto_221887 ) ( ON ?auto_221889 ?auto_221888 ) ( not ( = ?auto_221886 ?auto_221887 ) ) ( not ( = ?auto_221886 ?auto_221888 ) ) ( not ( = ?auto_221886 ?auto_221889 ) ) ( not ( = ?auto_221886 ?auto_221890 ) ) ( not ( = ?auto_221886 ?auto_221891 ) ) ( not ( = ?auto_221886 ?auto_221892 ) ) ( not ( = ?auto_221886 ?auto_221893 ) ) ( not ( = ?auto_221886 ?auto_221894 ) ) ( not ( = ?auto_221886 ?auto_221895 ) ) ( not ( = ?auto_221886 ?auto_221896 ) ) ( not ( = ?auto_221886 ?auto_221897 ) ) ( not ( = ?auto_221886 ?auto_221898 ) ) ( not ( = ?auto_221887 ?auto_221888 ) ) ( not ( = ?auto_221887 ?auto_221889 ) ) ( not ( = ?auto_221887 ?auto_221890 ) ) ( not ( = ?auto_221887 ?auto_221891 ) ) ( not ( = ?auto_221887 ?auto_221892 ) ) ( not ( = ?auto_221887 ?auto_221893 ) ) ( not ( = ?auto_221887 ?auto_221894 ) ) ( not ( = ?auto_221887 ?auto_221895 ) ) ( not ( = ?auto_221887 ?auto_221896 ) ) ( not ( = ?auto_221887 ?auto_221897 ) ) ( not ( = ?auto_221887 ?auto_221898 ) ) ( not ( = ?auto_221888 ?auto_221889 ) ) ( not ( = ?auto_221888 ?auto_221890 ) ) ( not ( = ?auto_221888 ?auto_221891 ) ) ( not ( = ?auto_221888 ?auto_221892 ) ) ( not ( = ?auto_221888 ?auto_221893 ) ) ( not ( = ?auto_221888 ?auto_221894 ) ) ( not ( = ?auto_221888 ?auto_221895 ) ) ( not ( = ?auto_221888 ?auto_221896 ) ) ( not ( = ?auto_221888 ?auto_221897 ) ) ( not ( = ?auto_221888 ?auto_221898 ) ) ( not ( = ?auto_221889 ?auto_221890 ) ) ( not ( = ?auto_221889 ?auto_221891 ) ) ( not ( = ?auto_221889 ?auto_221892 ) ) ( not ( = ?auto_221889 ?auto_221893 ) ) ( not ( = ?auto_221889 ?auto_221894 ) ) ( not ( = ?auto_221889 ?auto_221895 ) ) ( not ( = ?auto_221889 ?auto_221896 ) ) ( not ( = ?auto_221889 ?auto_221897 ) ) ( not ( = ?auto_221889 ?auto_221898 ) ) ( not ( = ?auto_221890 ?auto_221891 ) ) ( not ( = ?auto_221890 ?auto_221892 ) ) ( not ( = ?auto_221890 ?auto_221893 ) ) ( not ( = ?auto_221890 ?auto_221894 ) ) ( not ( = ?auto_221890 ?auto_221895 ) ) ( not ( = ?auto_221890 ?auto_221896 ) ) ( not ( = ?auto_221890 ?auto_221897 ) ) ( not ( = ?auto_221890 ?auto_221898 ) ) ( not ( = ?auto_221891 ?auto_221892 ) ) ( not ( = ?auto_221891 ?auto_221893 ) ) ( not ( = ?auto_221891 ?auto_221894 ) ) ( not ( = ?auto_221891 ?auto_221895 ) ) ( not ( = ?auto_221891 ?auto_221896 ) ) ( not ( = ?auto_221891 ?auto_221897 ) ) ( not ( = ?auto_221891 ?auto_221898 ) ) ( not ( = ?auto_221892 ?auto_221893 ) ) ( not ( = ?auto_221892 ?auto_221894 ) ) ( not ( = ?auto_221892 ?auto_221895 ) ) ( not ( = ?auto_221892 ?auto_221896 ) ) ( not ( = ?auto_221892 ?auto_221897 ) ) ( not ( = ?auto_221892 ?auto_221898 ) ) ( not ( = ?auto_221893 ?auto_221894 ) ) ( not ( = ?auto_221893 ?auto_221895 ) ) ( not ( = ?auto_221893 ?auto_221896 ) ) ( not ( = ?auto_221893 ?auto_221897 ) ) ( not ( = ?auto_221893 ?auto_221898 ) ) ( not ( = ?auto_221894 ?auto_221895 ) ) ( not ( = ?auto_221894 ?auto_221896 ) ) ( not ( = ?auto_221894 ?auto_221897 ) ) ( not ( = ?auto_221894 ?auto_221898 ) ) ( not ( = ?auto_221895 ?auto_221896 ) ) ( not ( = ?auto_221895 ?auto_221897 ) ) ( not ( = ?auto_221895 ?auto_221898 ) ) ( not ( = ?auto_221896 ?auto_221897 ) ) ( not ( = ?auto_221896 ?auto_221898 ) ) ( not ( = ?auto_221897 ?auto_221898 ) ) ( ON ?auto_221896 ?auto_221897 ) ( ON ?auto_221895 ?auto_221896 ) ( ON ?auto_221894 ?auto_221895 ) ( ON ?auto_221893 ?auto_221894 ) ( ON ?auto_221892 ?auto_221893 ) ( ON ?auto_221891 ?auto_221892 ) ( CLEAR ?auto_221889 ) ( ON ?auto_221890 ?auto_221891 ) ( CLEAR ?auto_221890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_221886 ?auto_221887 ?auto_221888 ?auto_221889 ?auto_221890 )
      ( MAKE-12PILE ?auto_221886 ?auto_221887 ?auto_221888 ?auto_221889 ?auto_221890 ?auto_221891 ?auto_221892 ?auto_221893 ?auto_221894 ?auto_221895 ?auto_221896 ?auto_221897 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_221911 - BLOCK
      ?auto_221912 - BLOCK
      ?auto_221913 - BLOCK
      ?auto_221914 - BLOCK
      ?auto_221915 - BLOCK
      ?auto_221916 - BLOCK
      ?auto_221917 - BLOCK
      ?auto_221918 - BLOCK
      ?auto_221919 - BLOCK
      ?auto_221920 - BLOCK
      ?auto_221921 - BLOCK
      ?auto_221922 - BLOCK
    )
    :vars
    (
      ?auto_221923 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221922 ?auto_221923 ) ( ON-TABLE ?auto_221911 ) ( ON ?auto_221912 ?auto_221911 ) ( ON ?auto_221913 ?auto_221912 ) ( ON ?auto_221914 ?auto_221913 ) ( not ( = ?auto_221911 ?auto_221912 ) ) ( not ( = ?auto_221911 ?auto_221913 ) ) ( not ( = ?auto_221911 ?auto_221914 ) ) ( not ( = ?auto_221911 ?auto_221915 ) ) ( not ( = ?auto_221911 ?auto_221916 ) ) ( not ( = ?auto_221911 ?auto_221917 ) ) ( not ( = ?auto_221911 ?auto_221918 ) ) ( not ( = ?auto_221911 ?auto_221919 ) ) ( not ( = ?auto_221911 ?auto_221920 ) ) ( not ( = ?auto_221911 ?auto_221921 ) ) ( not ( = ?auto_221911 ?auto_221922 ) ) ( not ( = ?auto_221911 ?auto_221923 ) ) ( not ( = ?auto_221912 ?auto_221913 ) ) ( not ( = ?auto_221912 ?auto_221914 ) ) ( not ( = ?auto_221912 ?auto_221915 ) ) ( not ( = ?auto_221912 ?auto_221916 ) ) ( not ( = ?auto_221912 ?auto_221917 ) ) ( not ( = ?auto_221912 ?auto_221918 ) ) ( not ( = ?auto_221912 ?auto_221919 ) ) ( not ( = ?auto_221912 ?auto_221920 ) ) ( not ( = ?auto_221912 ?auto_221921 ) ) ( not ( = ?auto_221912 ?auto_221922 ) ) ( not ( = ?auto_221912 ?auto_221923 ) ) ( not ( = ?auto_221913 ?auto_221914 ) ) ( not ( = ?auto_221913 ?auto_221915 ) ) ( not ( = ?auto_221913 ?auto_221916 ) ) ( not ( = ?auto_221913 ?auto_221917 ) ) ( not ( = ?auto_221913 ?auto_221918 ) ) ( not ( = ?auto_221913 ?auto_221919 ) ) ( not ( = ?auto_221913 ?auto_221920 ) ) ( not ( = ?auto_221913 ?auto_221921 ) ) ( not ( = ?auto_221913 ?auto_221922 ) ) ( not ( = ?auto_221913 ?auto_221923 ) ) ( not ( = ?auto_221914 ?auto_221915 ) ) ( not ( = ?auto_221914 ?auto_221916 ) ) ( not ( = ?auto_221914 ?auto_221917 ) ) ( not ( = ?auto_221914 ?auto_221918 ) ) ( not ( = ?auto_221914 ?auto_221919 ) ) ( not ( = ?auto_221914 ?auto_221920 ) ) ( not ( = ?auto_221914 ?auto_221921 ) ) ( not ( = ?auto_221914 ?auto_221922 ) ) ( not ( = ?auto_221914 ?auto_221923 ) ) ( not ( = ?auto_221915 ?auto_221916 ) ) ( not ( = ?auto_221915 ?auto_221917 ) ) ( not ( = ?auto_221915 ?auto_221918 ) ) ( not ( = ?auto_221915 ?auto_221919 ) ) ( not ( = ?auto_221915 ?auto_221920 ) ) ( not ( = ?auto_221915 ?auto_221921 ) ) ( not ( = ?auto_221915 ?auto_221922 ) ) ( not ( = ?auto_221915 ?auto_221923 ) ) ( not ( = ?auto_221916 ?auto_221917 ) ) ( not ( = ?auto_221916 ?auto_221918 ) ) ( not ( = ?auto_221916 ?auto_221919 ) ) ( not ( = ?auto_221916 ?auto_221920 ) ) ( not ( = ?auto_221916 ?auto_221921 ) ) ( not ( = ?auto_221916 ?auto_221922 ) ) ( not ( = ?auto_221916 ?auto_221923 ) ) ( not ( = ?auto_221917 ?auto_221918 ) ) ( not ( = ?auto_221917 ?auto_221919 ) ) ( not ( = ?auto_221917 ?auto_221920 ) ) ( not ( = ?auto_221917 ?auto_221921 ) ) ( not ( = ?auto_221917 ?auto_221922 ) ) ( not ( = ?auto_221917 ?auto_221923 ) ) ( not ( = ?auto_221918 ?auto_221919 ) ) ( not ( = ?auto_221918 ?auto_221920 ) ) ( not ( = ?auto_221918 ?auto_221921 ) ) ( not ( = ?auto_221918 ?auto_221922 ) ) ( not ( = ?auto_221918 ?auto_221923 ) ) ( not ( = ?auto_221919 ?auto_221920 ) ) ( not ( = ?auto_221919 ?auto_221921 ) ) ( not ( = ?auto_221919 ?auto_221922 ) ) ( not ( = ?auto_221919 ?auto_221923 ) ) ( not ( = ?auto_221920 ?auto_221921 ) ) ( not ( = ?auto_221920 ?auto_221922 ) ) ( not ( = ?auto_221920 ?auto_221923 ) ) ( not ( = ?auto_221921 ?auto_221922 ) ) ( not ( = ?auto_221921 ?auto_221923 ) ) ( not ( = ?auto_221922 ?auto_221923 ) ) ( ON ?auto_221921 ?auto_221922 ) ( ON ?auto_221920 ?auto_221921 ) ( ON ?auto_221919 ?auto_221920 ) ( ON ?auto_221918 ?auto_221919 ) ( ON ?auto_221917 ?auto_221918 ) ( ON ?auto_221916 ?auto_221917 ) ( CLEAR ?auto_221914 ) ( ON ?auto_221915 ?auto_221916 ) ( CLEAR ?auto_221915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_221911 ?auto_221912 ?auto_221913 ?auto_221914 ?auto_221915 )
      ( MAKE-12PILE ?auto_221911 ?auto_221912 ?auto_221913 ?auto_221914 ?auto_221915 ?auto_221916 ?auto_221917 ?auto_221918 ?auto_221919 ?auto_221920 ?auto_221921 ?auto_221922 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_221936 - BLOCK
      ?auto_221937 - BLOCK
      ?auto_221938 - BLOCK
      ?auto_221939 - BLOCK
      ?auto_221940 - BLOCK
      ?auto_221941 - BLOCK
      ?auto_221942 - BLOCK
      ?auto_221943 - BLOCK
      ?auto_221944 - BLOCK
      ?auto_221945 - BLOCK
      ?auto_221946 - BLOCK
      ?auto_221947 - BLOCK
    )
    :vars
    (
      ?auto_221948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221947 ?auto_221948 ) ( ON-TABLE ?auto_221936 ) ( ON ?auto_221937 ?auto_221936 ) ( ON ?auto_221938 ?auto_221937 ) ( not ( = ?auto_221936 ?auto_221937 ) ) ( not ( = ?auto_221936 ?auto_221938 ) ) ( not ( = ?auto_221936 ?auto_221939 ) ) ( not ( = ?auto_221936 ?auto_221940 ) ) ( not ( = ?auto_221936 ?auto_221941 ) ) ( not ( = ?auto_221936 ?auto_221942 ) ) ( not ( = ?auto_221936 ?auto_221943 ) ) ( not ( = ?auto_221936 ?auto_221944 ) ) ( not ( = ?auto_221936 ?auto_221945 ) ) ( not ( = ?auto_221936 ?auto_221946 ) ) ( not ( = ?auto_221936 ?auto_221947 ) ) ( not ( = ?auto_221936 ?auto_221948 ) ) ( not ( = ?auto_221937 ?auto_221938 ) ) ( not ( = ?auto_221937 ?auto_221939 ) ) ( not ( = ?auto_221937 ?auto_221940 ) ) ( not ( = ?auto_221937 ?auto_221941 ) ) ( not ( = ?auto_221937 ?auto_221942 ) ) ( not ( = ?auto_221937 ?auto_221943 ) ) ( not ( = ?auto_221937 ?auto_221944 ) ) ( not ( = ?auto_221937 ?auto_221945 ) ) ( not ( = ?auto_221937 ?auto_221946 ) ) ( not ( = ?auto_221937 ?auto_221947 ) ) ( not ( = ?auto_221937 ?auto_221948 ) ) ( not ( = ?auto_221938 ?auto_221939 ) ) ( not ( = ?auto_221938 ?auto_221940 ) ) ( not ( = ?auto_221938 ?auto_221941 ) ) ( not ( = ?auto_221938 ?auto_221942 ) ) ( not ( = ?auto_221938 ?auto_221943 ) ) ( not ( = ?auto_221938 ?auto_221944 ) ) ( not ( = ?auto_221938 ?auto_221945 ) ) ( not ( = ?auto_221938 ?auto_221946 ) ) ( not ( = ?auto_221938 ?auto_221947 ) ) ( not ( = ?auto_221938 ?auto_221948 ) ) ( not ( = ?auto_221939 ?auto_221940 ) ) ( not ( = ?auto_221939 ?auto_221941 ) ) ( not ( = ?auto_221939 ?auto_221942 ) ) ( not ( = ?auto_221939 ?auto_221943 ) ) ( not ( = ?auto_221939 ?auto_221944 ) ) ( not ( = ?auto_221939 ?auto_221945 ) ) ( not ( = ?auto_221939 ?auto_221946 ) ) ( not ( = ?auto_221939 ?auto_221947 ) ) ( not ( = ?auto_221939 ?auto_221948 ) ) ( not ( = ?auto_221940 ?auto_221941 ) ) ( not ( = ?auto_221940 ?auto_221942 ) ) ( not ( = ?auto_221940 ?auto_221943 ) ) ( not ( = ?auto_221940 ?auto_221944 ) ) ( not ( = ?auto_221940 ?auto_221945 ) ) ( not ( = ?auto_221940 ?auto_221946 ) ) ( not ( = ?auto_221940 ?auto_221947 ) ) ( not ( = ?auto_221940 ?auto_221948 ) ) ( not ( = ?auto_221941 ?auto_221942 ) ) ( not ( = ?auto_221941 ?auto_221943 ) ) ( not ( = ?auto_221941 ?auto_221944 ) ) ( not ( = ?auto_221941 ?auto_221945 ) ) ( not ( = ?auto_221941 ?auto_221946 ) ) ( not ( = ?auto_221941 ?auto_221947 ) ) ( not ( = ?auto_221941 ?auto_221948 ) ) ( not ( = ?auto_221942 ?auto_221943 ) ) ( not ( = ?auto_221942 ?auto_221944 ) ) ( not ( = ?auto_221942 ?auto_221945 ) ) ( not ( = ?auto_221942 ?auto_221946 ) ) ( not ( = ?auto_221942 ?auto_221947 ) ) ( not ( = ?auto_221942 ?auto_221948 ) ) ( not ( = ?auto_221943 ?auto_221944 ) ) ( not ( = ?auto_221943 ?auto_221945 ) ) ( not ( = ?auto_221943 ?auto_221946 ) ) ( not ( = ?auto_221943 ?auto_221947 ) ) ( not ( = ?auto_221943 ?auto_221948 ) ) ( not ( = ?auto_221944 ?auto_221945 ) ) ( not ( = ?auto_221944 ?auto_221946 ) ) ( not ( = ?auto_221944 ?auto_221947 ) ) ( not ( = ?auto_221944 ?auto_221948 ) ) ( not ( = ?auto_221945 ?auto_221946 ) ) ( not ( = ?auto_221945 ?auto_221947 ) ) ( not ( = ?auto_221945 ?auto_221948 ) ) ( not ( = ?auto_221946 ?auto_221947 ) ) ( not ( = ?auto_221946 ?auto_221948 ) ) ( not ( = ?auto_221947 ?auto_221948 ) ) ( ON ?auto_221946 ?auto_221947 ) ( ON ?auto_221945 ?auto_221946 ) ( ON ?auto_221944 ?auto_221945 ) ( ON ?auto_221943 ?auto_221944 ) ( ON ?auto_221942 ?auto_221943 ) ( ON ?auto_221941 ?auto_221942 ) ( ON ?auto_221940 ?auto_221941 ) ( CLEAR ?auto_221938 ) ( ON ?auto_221939 ?auto_221940 ) ( CLEAR ?auto_221939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_221936 ?auto_221937 ?auto_221938 ?auto_221939 )
      ( MAKE-12PILE ?auto_221936 ?auto_221937 ?auto_221938 ?auto_221939 ?auto_221940 ?auto_221941 ?auto_221942 ?auto_221943 ?auto_221944 ?auto_221945 ?auto_221946 ?auto_221947 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_221961 - BLOCK
      ?auto_221962 - BLOCK
      ?auto_221963 - BLOCK
      ?auto_221964 - BLOCK
      ?auto_221965 - BLOCK
      ?auto_221966 - BLOCK
      ?auto_221967 - BLOCK
      ?auto_221968 - BLOCK
      ?auto_221969 - BLOCK
      ?auto_221970 - BLOCK
      ?auto_221971 - BLOCK
      ?auto_221972 - BLOCK
    )
    :vars
    (
      ?auto_221973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221972 ?auto_221973 ) ( ON-TABLE ?auto_221961 ) ( ON ?auto_221962 ?auto_221961 ) ( ON ?auto_221963 ?auto_221962 ) ( not ( = ?auto_221961 ?auto_221962 ) ) ( not ( = ?auto_221961 ?auto_221963 ) ) ( not ( = ?auto_221961 ?auto_221964 ) ) ( not ( = ?auto_221961 ?auto_221965 ) ) ( not ( = ?auto_221961 ?auto_221966 ) ) ( not ( = ?auto_221961 ?auto_221967 ) ) ( not ( = ?auto_221961 ?auto_221968 ) ) ( not ( = ?auto_221961 ?auto_221969 ) ) ( not ( = ?auto_221961 ?auto_221970 ) ) ( not ( = ?auto_221961 ?auto_221971 ) ) ( not ( = ?auto_221961 ?auto_221972 ) ) ( not ( = ?auto_221961 ?auto_221973 ) ) ( not ( = ?auto_221962 ?auto_221963 ) ) ( not ( = ?auto_221962 ?auto_221964 ) ) ( not ( = ?auto_221962 ?auto_221965 ) ) ( not ( = ?auto_221962 ?auto_221966 ) ) ( not ( = ?auto_221962 ?auto_221967 ) ) ( not ( = ?auto_221962 ?auto_221968 ) ) ( not ( = ?auto_221962 ?auto_221969 ) ) ( not ( = ?auto_221962 ?auto_221970 ) ) ( not ( = ?auto_221962 ?auto_221971 ) ) ( not ( = ?auto_221962 ?auto_221972 ) ) ( not ( = ?auto_221962 ?auto_221973 ) ) ( not ( = ?auto_221963 ?auto_221964 ) ) ( not ( = ?auto_221963 ?auto_221965 ) ) ( not ( = ?auto_221963 ?auto_221966 ) ) ( not ( = ?auto_221963 ?auto_221967 ) ) ( not ( = ?auto_221963 ?auto_221968 ) ) ( not ( = ?auto_221963 ?auto_221969 ) ) ( not ( = ?auto_221963 ?auto_221970 ) ) ( not ( = ?auto_221963 ?auto_221971 ) ) ( not ( = ?auto_221963 ?auto_221972 ) ) ( not ( = ?auto_221963 ?auto_221973 ) ) ( not ( = ?auto_221964 ?auto_221965 ) ) ( not ( = ?auto_221964 ?auto_221966 ) ) ( not ( = ?auto_221964 ?auto_221967 ) ) ( not ( = ?auto_221964 ?auto_221968 ) ) ( not ( = ?auto_221964 ?auto_221969 ) ) ( not ( = ?auto_221964 ?auto_221970 ) ) ( not ( = ?auto_221964 ?auto_221971 ) ) ( not ( = ?auto_221964 ?auto_221972 ) ) ( not ( = ?auto_221964 ?auto_221973 ) ) ( not ( = ?auto_221965 ?auto_221966 ) ) ( not ( = ?auto_221965 ?auto_221967 ) ) ( not ( = ?auto_221965 ?auto_221968 ) ) ( not ( = ?auto_221965 ?auto_221969 ) ) ( not ( = ?auto_221965 ?auto_221970 ) ) ( not ( = ?auto_221965 ?auto_221971 ) ) ( not ( = ?auto_221965 ?auto_221972 ) ) ( not ( = ?auto_221965 ?auto_221973 ) ) ( not ( = ?auto_221966 ?auto_221967 ) ) ( not ( = ?auto_221966 ?auto_221968 ) ) ( not ( = ?auto_221966 ?auto_221969 ) ) ( not ( = ?auto_221966 ?auto_221970 ) ) ( not ( = ?auto_221966 ?auto_221971 ) ) ( not ( = ?auto_221966 ?auto_221972 ) ) ( not ( = ?auto_221966 ?auto_221973 ) ) ( not ( = ?auto_221967 ?auto_221968 ) ) ( not ( = ?auto_221967 ?auto_221969 ) ) ( not ( = ?auto_221967 ?auto_221970 ) ) ( not ( = ?auto_221967 ?auto_221971 ) ) ( not ( = ?auto_221967 ?auto_221972 ) ) ( not ( = ?auto_221967 ?auto_221973 ) ) ( not ( = ?auto_221968 ?auto_221969 ) ) ( not ( = ?auto_221968 ?auto_221970 ) ) ( not ( = ?auto_221968 ?auto_221971 ) ) ( not ( = ?auto_221968 ?auto_221972 ) ) ( not ( = ?auto_221968 ?auto_221973 ) ) ( not ( = ?auto_221969 ?auto_221970 ) ) ( not ( = ?auto_221969 ?auto_221971 ) ) ( not ( = ?auto_221969 ?auto_221972 ) ) ( not ( = ?auto_221969 ?auto_221973 ) ) ( not ( = ?auto_221970 ?auto_221971 ) ) ( not ( = ?auto_221970 ?auto_221972 ) ) ( not ( = ?auto_221970 ?auto_221973 ) ) ( not ( = ?auto_221971 ?auto_221972 ) ) ( not ( = ?auto_221971 ?auto_221973 ) ) ( not ( = ?auto_221972 ?auto_221973 ) ) ( ON ?auto_221971 ?auto_221972 ) ( ON ?auto_221970 ?auto_221971 ) ( ON ?auto_221969 ?auto_221970 ) ( ON ?auto_221968 ?auto_221969 ) ( ON ?auto_221967 ?auto_221968 ) ( ON ?auto_221966 ?auto_221967 ) ( ON ?auto_221965 ?auto_221966 ) ( CLEAR ?auto_221963 ) ( ON ?auto_221964 ?auto_221965 ) ( CLEAR ?auto_221964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_221961 ?auto_221962 ?auto_221963 ?auto_221964 )
      ( MAKE-12PILE ?auto_221961 ?auto_221962 ?auto_221963 ?auto_221964 ?auto_221965 ?auto_221966 ?auto_221967 ?auto_221968 ?auto_221969 ?auto_221970 ?auto_221971 ?auto_221972 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_221986 - BLOCK
      ?auto_221987 - BLOCK
      ?auto_221988 - BLOCK
      ?auto_221989 - BLOCK
      ?auto_221990 - BLOCK
      ?auto_221991 - BLOCK
      ?auto_221992 - BLOCK
      ?auto_221993 - BLOCK
      ?auto_221994 - BLOCK
      ?auto_221995 - BLOCK
      ?auto_221996 - BLOCK
      ?auto_221997 - BLOCK
    )
    :vars
    (
      ?auto_221998 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_221997 ?auto_221998 ) ( ON-TABLE ?auto_221986 ) ( ON ?auto_221987 ?auto_221986 ) ( not ( = ?auto_221986 ?auto_221987 ) ) ( not ( = ?auto_221986 ?auto_221988 ) ) ( not ( = ?auto_221986 ?auto_221989 ) ) ( not ( = ?auto_221986 ?auto_221990 ) ) ( not ( = ?auto_221986 ?auto_221991 ) ) ( not ( = ?auto_221986 ?auto_221992 ) ) ( not ( = ?auto_221986 ?auto_221993 ) ) ( not ( = ?auto_221986 ?auto_221994 ) ) ( not ( = ?auto_221986 ?auto_221995 ) ) ( not ( = ?auto_221986 ?auto_221996 ) ) ( not ( = ?auto_221986 ?auto_221997 ) ) ( not ( = ?auto_221986 ?auto_221998 ) ) ( not ( = ?auto_221987 ?auto_221988 ) ) ( not ( = ?auto_221987 ?auto_221989 ) ) ( not ( = ?auto_221987 ?auto_221990 ) ) ( not ( = ?auto_221987 ?auto_221991 ) ) ( not ( = ?auto_221987 ?auto_221992 ) ) ( not ( = ?auto_221987 ?auto_221993 ) ) ( not ( = ?auto_221987 ?auto_221994 ) ) ( not ( = ?auto_221987 ?auto_221995 ) ) ( not ( = ?auto_221987 ?auto_221996 ) ) ( not ( = ?auto_221987 ?auto_221997 ) ) ( not ( = ?auto_221987 ?auto_221998 ) ) ( not ( = ?auto_221988 ?auto_221989 ) ) ( not ( = ?auto_221988 ?auto_221990 ) ) ( not ( = ?auto_221988 ?auto_221991 ) ) ( not ( = ?auto_221988 ?auto_221992 ) ) ( not ( = ?auto_221988 ?auto_221993 ) ) ( not ( = ?auto_221988 ?auto_221994 ) ) ( not ( = ?auto_221988 ?auto_221995 ) ) ( not ( = ?auto_221988 ?auto_221996 ) ) ( not ( = ?auto_221988 ?auto_221997 ) ) ( not ( = ?auto_221988 ?auto_221998 ) ) ( not ( = ?auto_221989 ?auto_221990 ) ) ( not ( = ?auto_221989 ?auto_221991 ) ) ( not ( = ?auto_221989 ?auto_221992 ) ) ( not ( = ?auto_221989 ?auto_221993 ) ) ( not ( = ?auto_221989 ?auto_221994 ) ) ( not ( = ?auto_221989 ?auto_221995 ) ) ( not ( = ?auto_221989 ?auto_221996 ) ) ( not ( = ?auto_221989 ?auto_221997 ) ) ( not ( = ?auto_221989 ?auto_221998 ) ) ( not ( = ?auto_221990 ?auto_221991 ) ) ( not ( = ?auto_221990 ?auto_221992 ) ) ( not ( = ?auto_221990 ?auto_221993 ) ) ( not ( = ?auto_221990 ?auto_221994 ) ) ( not ( = ?auto_221990 ?auto_221995 ) ) ( not ( = ?auto_221990 ?auto_221996 ) ) ( not ( = ?auto_221990 ?auto_221997 ) ) ( not ( = ?auto_221990 ?auto_221998 ) ) ( not ( = ?auto_221991 ?auto_221992 ) ) ( not ( = ?auto_221991 ?auto_221993 ) ) ( not ( = ?auto_221991 ?auto_221994 ) ) ( not ( = ?auto_221991 ?auto_221995 ) ) ( not ( = ?auto_221991 ?auto_221996 ) ) ( not ( = ?auto_221991 ?auto_221997 ) ) ( not ( = ?auto_221991 ?auto_221998 ) ) ( not ( = ?auto_221992 ?auto_221993 ) ) ( not ( = ?auto_221992 ?auto_221994 ) ) ( not ( = ?auto_221992 ?auto_221995 ) ) ( not ( = ?auto_221992 ?auto_221996 ) ) ( not ( = ?auto_221992 ?auto_221997 ) ) ( not ( = ?auto_221992 ?auto_221998 ) ) ( not ( = ?auto_221993 ?auto_221994 ) ) ( not ( = ?auto_221993 ?auto_221995 ) ) ( not ( = ?auto_221993 ?auto_221996 ) ) ( not ( = ?auto_221993 ?auto_221997 ) ) ( not ( = ?auto_221993 ?auto_221998 ) ) ( not ( = ?auto_221994 ?auto_221995 ) ) ( not ( = ?auto_221994 ?auto_221996 ) ) ( not ( = ?auto_221994 ?auto_221997 ) ) ( not ( = ?auto_221994 ?auto_221998 ) ) ( not ( = ?auto_221995 ?auto_221996 ) ) ( not ( = ?auto_221995 ?auto_221997 ) ) ( not ( = ?auto_221995 ?auto_221998 ) ) ( not ( = ?auto_221996 ?auto_221997 ) ) ( not ( = ?auto_221996 ?auto_221998 ) ) ( not ( = ?auto_221997 ?auto_221998 ) ) ( ON ?auto_221996 ?auto_221997 ) ( ON ?auto_221995 ?auto_221996 ) ( ON ?auto_221994 ?auto_221995 ) ( ON ?auto_221993 ?auto_221994 ) ( ON ?auto_221992 ?auto_221993 ) ( ON ?auto_221991 ?auto_221992 ) ( ON ?auto_221990 ?auto_221991 ) ( ON ?auto_221989 ?auto_221990 ) ( CLEAR ?auto_221987 ) ( ON ?auto_221988 ?auto_221989 ) ( CLEAR ?auto_221988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_221986 ?auto_221987 ?auto_221988 )
      ( MAKE-12PILE ?auto_221986 ?auto_221987 ?auto_221988 ?auto_221989 ?auto_221990 ?auto_221991 ?auto_221992 ?auto_221993 ?auto_221994 ?auto_221995 ?auto_221996 ?auto_221997 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_222011 - BLOCK
      ?auto_222012 - BLOCK
      ?auto_222013 - BLOCK
      ?auto_222014 - BLOCK
      ?auto_222015 - BLOCK
      ?auto_222016 - BLOCK
      ?auto_222017 - BLOCK
      ?auto_222018 - BLOCK
      ?auto_222019 - BLOCK
      ?auto_222020 - BLOCK
      ?auto_222021 - BLOCK
      ?auto_222022 - BLOCK
    )
    :vars
    (
      ?auto_222023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_222022 ?auto_222023 ) ( ON-TABLE ?auto_222011 ) ( ON ?auto_222012 ?auto_222011 ) ( not ( = ?auto_222011 ?auto_222012 ) ) ( not ( = ?auto_222011 ?auto_222013 ) ) ( not ( = ?auto_222011 ?auto_222014 ) ) ( not ( = ?auto_222011 ?auto_222015 ) ) ( not ( = ?auto_222011 ?auto_222016 ) ) ( not ( = ?auto_222011 ?auto_222017 ) ) ( not ( = ?auto_222011 ?auto_222018 ) ) ( not ( = ?auto_222011 ?auto_222019 ) ) ( not ( = ?auto_222011 ?auto_222020 ) ) ( not ( = ?auto_222011 ?auto_222021 ) ) ( not ( = ?auto_222011 ?auto_222022 ) ) ( not ( = ?auto_222011 ?auto_222023 ) ) ( not ( = ?auto_222012 ?auto_222013 ) ) ( not ( = ?auto_222012 ?auto_222014 ) ) ( not ( = ?auto_222012 ?auto_222015 ) ) ( not ( = ?auto_222012 ?auto_222016 ) ) ( not ( = ?auto_222012 ?auto_222017 ) ) ( not ( = ?auto_222012 ?auto_222018 ) ) ( not ( = ?auto_222012 ?auto_222019 ) ) ( not ( = ?auto_222012 ?auto_222020 ) ) ( not ( = ?auto_222012 ?auto_222021 ) ) ( not ( = ?auto_222012 ?auto_222022 ) ) ( not ( = ?auto_222012 ?auto_222023 ) ) ( not ( = ?auto_222013 ?auto_222014 ) ) ( not ( = ?auto_222013 ?auto_222015 ) ) ( not ( = ?auto_222013 ?auto_222016 ) ) ( not ( = ?auto_222013 ?auto_222017 ) ) ( not ( = ?auto_222013 ?auto_222018 ) ) ( not ( = ?auto_222013 ?auto_222019 ) ) ( not ( = ?auto_222013 ?auto_222020 ) ) ( not ( = ?auto_222013 ?auto_222021 ) ) ( not ( = ?auto_222013 ?auto_222022 ) ) ( not ( = ?auto_222013 ?auto_222023 ) ) ( not ( = ?auto_222014 ?auto_222015 ) ) ( not ( = ?auto_222014 ?auto_222016 ) ) ( not ( = ?auto_222014 ?auto_222017 ) ) ( not ( = ?auto_222014 ?auto_222018 ) ) ( not ( = ?auto_222014 ?auto_222019 ) ) ( not ( = ?auto_222014 ?auto_222020 ) ) ( not ( = ?auto_222014 ?auto_222021 ) ) ( not ( = ?auto_222014 ?auto_222022 ) ) ( not ( = ?auto_222014 ?auto_222023 ) ) ( not ( = ?auto_222015 ?auto_222016 ) ) ( not ( = ?auto_222015 ?auto_222017 ) ) ( not ( = ?auto_222015 ?auto_222018 ) ) ( not ( = ?auto_222015 ?auto_222019 ) ) ( not ( = ?auto_222015 ?auto_222020 ) ) ( not ( = ?auto_222015 ?auto_222021 ) ) ( not ( = ?auto_222015 ?auto_222022 ) ) ( not ( = ?auto_222015 ?auto_222023 ) ) ( not ( = ?auto_222016 ?auto_222017 ) ) ( not ( = ?auto_222016 ?auto_222018 ) ) ( not ( = ?auto_222016 ?auto_222019 ) ) ( not ( = ?auto_222016 ?auto_222020 ) ) ( not ( = ?auto_222016 ?auto_222021 ) ) ( not ( = ?auto_222016 ?auto_222022 ) ) ( not ( = ?auto_222016 ?auto_222023 ) ) ( not ( = ?auto_222017 ?auto_222018 ) ) ( not ( = ?auto_222017 ?auto_222019 ) ) ( not ( = ?auto_222017 ?auto_222020 ) ) ( not ( = ?auto_222017 ?auto_222021 ) ) ( not ( = ?auto_222017 ?auto_222022 ) ) ( not ( = ?auto_222017 ?auto_222023 ) ) ( not ( = ?auto_222018 ?auto_222019 ) ) ( not ( = ?auto_222018 ?auto_222020 ) ) ( not ( = ?auto_222018 ?auto_222021 ) ) ( not ( = ?auto_222018 ?auto_222022 ) ) ( not ( = ?auto_222018 ?auto_222023 ) ) ( not ( = ?auto_222019 ?auto_222020 ) ) ( not ( = ?auto_222019 ?auto_222021 ) ) ( not ( = ?auto_222019 ?auto_222022 ) ) ( not ( = ?auto_222019 ?auto_222023 ) ) ( not ( = ?auto_222020 ?auto_222021 ) ) ( not ( = ?auto_222020 ?auto_222022 ) ) ( not ( = ?auto_222020 ?auto_222023 ) ) ( not ( = ?auto_222021 ?auto_222022 ) ) ( not ( = ?auto_222021 ?auto_222023 ) ) ( not ( = ?auto_222022 ?auto_222023 ) ) ( ON ?auto_222021 ?auto_222022 ) ( ON ?auto_222020 ?auto_222021 ) ( ON ?auto_222019 ?auto_222020 ) ( ON ?auto_222018 ?auto_222019 ) ( ON ?auto_222017 ?auto_222018 ) ( ON ?auto_222016 ?auto_222017 ) ( ON ?auto_222015 ?auto_222016 ) ( ON ?auto_222014 ?auto_222015 ) ( CLEAR ?auto_222012 ) ( ON ?auto_222013 ?auto_222014 ) ( CLEAR ?auto_222013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_222011 ?auto_222012 ?auto_222013 )
      ( MAKE-12PILE ?auto_222011 ?auto_222012 ?auto_222013 ?auto_222014 ?auto_222015 ?auto_222016 ?auto_222017 ?auto_222018 ?auto_222019 ?auto_222020 ?auto_222021 ?auto_222022 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_222036 - BLOCK
      ?auto_222037 - BLOCK
      ?auto_222038 - BLOCK
      ?auto_222039 - BLOCK
      ?auto_222040 - BLOCK
      ?auto_222041 - BLOCK
      ?auto_222042 - BLOCK
      ?auto_222043 - BLOCK
      ?auto_222044 - BLOCK
      ?auto_222045 - BLOCK
      ?auto_222046 - BLOCK
      ?auto_222047 - BLOCK
    )
    :vars
    (
      ?auto_222048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_222047 ?auto_222048 ) ( ON-TABLE ?auto_222036 ) ( not ( = ?auto_222036 ?auto_222037 ) ) ( not ( = ?auto_222036 ?auto_222038 ) ) ( not ( = ?auto_222036 ?auto_222039 ) ) ( not ( = ?auto_222036 ?auto_222040 ) ) ( not ( = ?auto_222036 ?auto_222041 ) ) ( not ( = ?auto_222036 ?auto_222042 ) ) ( not ( = ?auto_222036 ?auto_222043 ) ) ( not ( = ?auto_222036 ?auto_222044 ) ) ( not ( = ?auto_222036 ?auto_222045 ) ) ( not ( = ?auto_222036 ?auto_222046 ) ) ( not ( = ?auto_222036 ?auto_222047 ) ) ( not ( = ?auto_222036 ?auto_222048 ) ) ( not ( = ?auto_222037 ?auto_222038 ) ) ( not ( = ?auto_222037 ?auto_222039 ) ) ( not ( = ?auto_222037 ?auto_222040 ) ) ( not ( = ?auto_222037 ?auto_222041 ) ) ( not ( = ?auto_222037 ?auto_222042 ) ) ( not ( = ?auto_222037 ?auto_222043 ) ) ( not ( = ?auto_222037 ?auto_222044 ) ) ( not ( = ?auto_222037 ?auto_222045 ) ) ( not ( = ?auto_222037 ?auto_222046 ) ) ( not ( = ?auto_222037 ?auto_222047 ) ) ( not ( = ?auto_222037 ?auto_222048 ) ) ( not ( = ?auto_222038 ?auto_222039 ) ) ( not ( = ?auto_222038 ?auto_222040 ) ) ( not ( = ?auto_222038 ?auto_222041 ) ) ( not ( = ?auto_222038 ?auto_222042 ) ) ( not ( = ?auto_222038 ?auto_222043 ) ) ( not ( = ?auto_222038 ?auto_222044 ) ) ( not ( = ?auto_222038 ?auto_222045 ) ) ( not ( = ?auto_222038 ?auto_222046 ) ) ( not ( = ?auto_222038 ?auto_222047 ) ) ( not ( = ?auto_222038 ?auto_222048 ) ) ( not ( = ?auto_222039 ?auto_222040 ) ) ( not ( = ?auto_222039 ?auto_222041 ) ) ( not ( = ?auto_222039 ?auto_222042 ) ) ( not ( = ?auto_222039 ?auto_222043 ) ) ( not ( = ?auto_222039 ?auto_222044 ) ) ( not ( = ?auto_222039 ?auto_222045 ) ) ( not ( = ?auto_222039 ?auto_222046 ) ) ( not ( = ?auto_222039 ?auto_222047 ) ) ( not ( = ?auto_222039 ?auto_222048 ) ) ( not ( = ?auto_222040 ?auto_222041 ) ) ( not ( = ?auto_222040 ?auto_222042 ) ) ( not ( = ?auto_222040 ?auto_222043 ) ) ( not ( = ?auto_222040 ?auto_222044 ) ) ( not ( = ?auto_222040 ?auto_222045 ) ) ( not ( = ?auto_222040 ?auto_222046 ) ) ( not ( = ?auto_222040 ?auto_222047 ) ) ( not ( = ?auto_222040 ?auto_222048 ) ) ( not ( = ?auto_222041 ?auto_222042 ) ) ( not ( = ?auto_222041 ?auto_222043 ) ) ( not ( = ?auto_222041 ?auto_222044 ) ) ( not ( = ?auto_222041 ?auto_222045 ) ) ( not ( = ?auto_222041 ?auto_222046 ) ) ( not ( = ?auto_222041 ?auto_222047 ) ) ( not ( = ?auto_222041 ?auto_222048 ) ) ( not ( = ?auto_222042 ?auto_222043 ) ) ( not ( = ?auto_222042 ?auto_222044 ) ) ( not ( = ?auto_222042 ?auto_222045 ) ) ( not ( = ?auto_222042 ?auto_222046 ) ) ( not ( = ?auto_222042 ?auto_222047 ) ) ( not ( = ?auto_222042 ?auto_222048 ) ) ( not ( = ?auto_222043 ?auto_222044 ) ) ( not ( = ?auto_222043 ?auto_222045 ) ) ( not ( = ?auto_222043 ?auto_222046 ) ) ( not ( = ?auto_222043 ?auto_222047 ) ) ( not ( = ?auto_222043 ?auto_222048 ) ) ( not ( = ?auto_222044 ?auto_222045 ) ) ( not ( = ?auto_222044 ?auto_222046 ) ) ( not ( = ?auto_222044 ?auto_222047 ) ) ( not ( = ?auto_222044 ?auto_222048 ) ) ( not ( = ?auto_222045 ?auto_222046 ) ) ( not ( = ?auto_222045 ?auto_222047 ) ) ( not ( = ?auto_222045 ?auto_222048 ) ) ( not ( = ?auto_222046 ?auto_222047 ) ) ( not ( = ?auto_222046 ?auto_222048 ) ) ( not ( = ?auto_222047 ?auto_222048 ) ) ( ON ?auto_222046 ?auto_222047 ) ( ON ?auto_222045 ?auto_222046 ) ( ON ?auto_222044 ?auto_222045 ) ( ON ?auto_222043 ?auto_222044 ) ( ON ?auto_222042 ?auto_222043 ) ( ON ?auto_222041 ?auto_222042 ) ( ON ?auto_222040 ?auto_222041 ) ( ON ?auto_222039 ?auto_222040 ) ( ON ?auto_222038 ?auto_222039 ) ( CLEAR ?auto_222036 ) ( ON ?auto_222037 ?auto_222038 ) ( CLEAR ?auto_222037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_222036 ?auto_222037 )
      ( MAKE-12PILE ?auto_222036 ?auto_222037 ?auto_222038 ?auto_222039 ?auto_222040 ?auto_222041 ?auto_222042 ?auto_222043 ?auto_222044 ?auto_222045 ?auto_222046 ?auto_222047 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_222061 - BLOCK
      ?auto_222062 - BLOCK
      ?auto_222063 - BLOCK
      ?auto_222064 - BLOCK
      ?auto_222065 - BLOCK
      ?auto_222066 - BLOCK
      ?auto_222067 - BLOCK
      ?auto_222068 - BLOCK
      ?auto_222069 - BLOCK
      ?auto_222070 - BLOCK
      ?auto_222071 - BLOCK
      ?auto_222072 - BLOCK
    )
    :vars
    (
      ?auto_222073 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_222072 ?auto_222073 ) ( ON-TABLE ?auto_222061 ) ( not ( = ?auto_222061 ?auto_222062 ) ) ( not ( = ?auto_222061 ?auto_222063 ) ) ( not ( = ?auto_222061 ?auto_222064 ) ) ( not ( = ?auto_222061 ?auto_222065 ) ) ( not ( = ?auto_222061 ?auto_222066 ) ) ( not ( = ?auto_222061 ?auto_222067 ) ) ( not ( = ?auto_222061 ?auto_222068 ) ) ( not ( = ?auto_222061 ?auto_222069 ) ) ( not ( = ?auto_222061 ?auto_222070 ) ) ( not ( = ?auto_222061 ?auto_222071 ) ) ( not ( = ?auto_222061 ?auto_222072 ) ) ( not ( = ?auto_222061 ?auto_222073 ) ) ( not ( = ?auto_222062 ?auto_222063 ) ) ( not ( = ?auto_222062 ?auto_222064 ) ) ( not ( = ?auto_222062 ?auto_222065 ) ) ( not ( = ?auto_222062 ?auto_222066 ) ) ( not ( = ?auto_222062 ?auto_222067 ) ) ( not ( = ?auto_222062 ?auto_222068 ) ) ( not ( = ?auto_222062 ?auto_222069 ) ) ( not ( = ?auto_222062 ?auto_222070 ) ) ( not ( = ?auto_222062 ?auto_222071 ) ) ( not ( = ?auto_222062 ?auto_222072 ) ) ( not ( = ?auto_222062 ?auto_222073 ) ) ( not ( = ?auto_222063 ?auto_222064 ) ) ( not ( = ?auto_222063 ?auto_222065 ) ) ( not ( = ?auto_222063 ?auto_222066 ) ) ( not ( = ?auto_222063 ?auto_222067 ) ) ( not ( = ?auto_222063 ?auto_222068 ) ) ( not ( = ?auto_222063 ?auto_222069 ) ) ( not ( = ?auto_222063 ?auto_222070 ) ) ( not ( = ?auto_222063 ?auto_222071 ) ) ( not ( = ?auto_222063 ?auto_222072 ) ) ( not ( = ?auto_222063 ?auto_222073 ) ) ( not ( = ?auto_222064 ?auto_222065 ) ) ( not ( = ?auto_222064 ?auto_222066 ) ) ( not ( = ?auto_222064 ?auto_222067 ) ) ( not ( = ?auto_222064 ?auto_222068 ) ) ( not ( = ?auto_222064 ?auto_222069 ) ) ( not ( = ?auto_222064 ?auto_222070 ) ) ( not ( = ?auto_222064 ?auto_222071 ) ) ( not ( = ?auto_222064 ?auto_222072 ) ) ( not ( = ?auto_222064 ?auto_222073 ) ) ( not ( = ?auto_222065 ?auto_222066 ) ) ( not ( = ?auto_222065 ?auto_222067 ) ) ( not ( = ?auto_222065 ?auto_222068 ) ) ( not ( = ?auto_222065 ?auto_222069 ) ) ( not ( = ?auto_222065 ?auto_222070 ) ) ( not ( = ?auto_222065 ?auto_222071 ) ) ( not ( = ?auto_222065 ?auto_222072 ) ) ( not ( = ?auto_222065 ?auto_222073 ) ) ( not ( = ?auto_222066 ?auto_222067 ) ) ( not ( = ?auto_222066 ?auto_222068 ) ) ( not ( = ?auto_222066 ?auto_222069 ) ) ( not ( = ?auto_222066 ?auto_222070 ) ) ( not ( = ?auto_222066 ?auto_222071 ) ) ( not ( = ?auto_222066 ?auto_222072 ) ) ( not ( = ?auto_222066 ?auto_222073 ) ) ( not ( = ?auto_222067 ?auto_222068 ) ) ( not ( = ?auto_222067 ?auto_222069 ) ) ( not ( = ?auto_222067 ?auto_222070 ) ) ( not ( = ?auto_222067 ?auto_222071 ) ) ( not ( = ?auto_222067 ?auto_222072 ) ) ( not ( = ?auto_222067 ?auto_222073 ) ) ( not ( = ?auto_222068 ?auto_222069 ) ) ( not ( = ?auto_222068 ?auto_222070 ) ) ( not ( = ?auto_222068 ?auto_222071 ) ) ( not ( = ?auto_222068 ?auto_222072 ) ) ( not ( = ?auto_222068 ?auto_222073 ) ) ( not ( = ?auto_222069 ?auto_222070 ) ) ( not ( = ?auto_222069 ?auto_222071 ) ) ( not ( = ?auto_222069 ?auto_222072 ) ) ( not ( = ?auto_222069 ?auto_222073 ) ) ( not ( = ?auto_222070 ?auto_222071 ) ) ( not ( = ?auto_222070 ?auto_222072 ) ) ( not ( = ?auto_222070 ?auto_222073 ) ) ( not ( = ?auto_222071 ?auto_222072 ) ) ( not ( = ?auto_222071 ?auto_222073 ) ) ( not ( = ?auto_222072 ?auto_222073 ) ) ( ON ?auto_222071 ?auto_222072 ) ( ON ?auto_222070 ?auto_222071 ) ( ON ?auto_222069 ?auto_222070 ) ( ON ?auto_222068 ?auto_222069 ) ( ON ?auto_222067 ?auto_222068 ) ( ON ?auto_222066 ?auto_222067 ) ( ON ?auto_222065 ?auto_222066 ) ( ON ?auto_222064 ?auto_222065 ) ( ON ?auto_222063 ?auto_222064 ) ( CLEAR ?auto_222061 ) ( ON ?auto_222062 ?auto_222063 ) ( CLEAR ?auto_222062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_222061 ?auto_222062 )
      ( MAKE-12PILE ?auto_222061 ?auto_222062 ?auto_222063 ?auto_222064 ?auto_222065 ?auto_222066 ?auto_222067 ?auto_222068 ?auto_222069 ?auto_222070 ?auto_222071 ?auto_222072 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_222086 - BLOCK
      ?auto_222087 - BLOCK
      ?auto_222088 - BLOCK
      ?auto_222089 - BLOCK
      ?auto_222090 - BLOCK
      ?auto_222091 - BLOCK
      ?auto_222092 - BLOCK
      ?auto_222093 - BLOCK
      ?auto_222094 - BLOCK
      ?auto_222095 - BLOCK
      ?auto_222096 - BLOCK
      ?auto_222097 - BLOCK
    )
    :vars
    (
      ?auto_222098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_222097 ?auto_222098 ) ( not ( = ?auto_222086 ?auto_222087 ) ) ( not ( = ?auto_222086 ?auto_222088 ) ) ( not ( = ?auto_222086 ?auto_222089 ) ) ( not ( = ?auto_222086 ?auto_222090 ) ) ( not ( = ?auto_222086 ?auto_222091 ) ) ( not ( = ?auto_222086 ?auto_222092 ) ) ( not ( = ?auto_222086 ?auto_222093 ) ) ( not ( = ?auto_222086 ?auto_222094 ) ) ( not ( = ?auto_222086 ?auto_222095 ) ) ( not ( = ?auto_222086 ?auto_222096 ) ) ( not ( = ?auto_222086 ?auto_222097 ) ) ( not ( = ?auto_222086 ?auto_222098 ) ) ( not ( = ?auto_222087 ?auto_222088 ) ) ( not ( = ?auto_222087 ?auto_222089 ) ) ( not ( = ?auto_222087 ?auto_222090 ) ) ( not ( = ?auto_222087 ?auto_222091 ) ) ( not ( = ?auto_222087 ?auto_222092 ) ) ( not ( = ?auto_222087 ?auto_222093 ) ) ( not ( = ?auto_222087 ?auto_222094 ) ) ( not ( = ?auto_222087 ?auto_222095 ) ) ( not ( = ?auto_222087 ?auto_222096 ) ) ( not ( = ?auto_222087 ?auto_222097 ) ) ( not ( = ?auto_222087 ?auto_222098 ) ) ( not ( = ?auto_222088 ?auto_222089 ) ) ( not ( = ?auto_222088 ?auto_222090 ) ) ( not ( = ?auto_222088 ?auto_222091 ) ) ( not ( = ?auto_222088 ?auto_222092 ) ) ( not ( = ?auto_222088 ?auto_222093 ) ) ( not ( = ?auto_222088 ?auto_222094 ) ) ( not ( = ?auto_222088 ?auto_222095 ) ) ( not ( = ?auto_222088 ?auto_222096 ) ) ( not ( = ?auto_222088 ?auto_222097 ) ) ( not ( = ?auto_222088 ?auto_222098 ) ) ( not ( = ?auto_222089 ?auto_222090 ) ) ( not ( = ?auto_222089 ?auto_222091 ) ) ( not ( = ?auto_222089 ?auto_222092 ) ) ( not ( = ?auto_222089 ?auto_222093 ) ) ( not ( = ?auto_222089 ?auto_222094 ) ) ( not ( = ?auto_222089 ?auto_222095 ) ) ( not ( = ?auto_222089 ?auto_222096 ) ) ( not ( = ?auto_222089 ?auto_222097 ) ) ( not ( = ?auto_222089 ?auto_222098 ) ) ( not ( = ?auto_222090 ?auto_222091 ) ) ( not ( = ?auto_222090 ?auto_222092 ) ) ( not ( = ?auto_222090 ?auto_222093 ) ) ( not ( = ?auto_222090 ?auto_222094 ) ) ( not ( = ?auto_222090 ?auto_222095 ) ) ( not ( = ?auto_222090 ?auto_222096 ) ) ( not ( = ?auto_222090 ?auto_222097 ) ) ( not ( = ?auto_222090 ?auto_222098 ) ) ( not ( = ?auto_222091 ?auto_222092 ) ) ( not ( = ?auto_222091 ?auto_222093 ) ) ( not ( = ?auto_222091 ?auto_222094 ) ) ( not ( = ?auto_222091 ?auto_222095 ) ) ( not ( = ?auto_222091 ?auto_222096 ) ) ( not ( = ?auto_222091 ?auto_222097 ) ) ( not ( = ?auto_222091 ?auto_222098 ) ) ( not ( = ?auto_222092 ?auto_222093 ) ) ( not ( = ?auto_222092 ?auto_222094 ) ) ( not ( = ?auto_222092 ?auto_222095 ) ) ( not ( = ?auto_222092 ?auto_222096 ) ) ( not ( = ?auto_222092 ?auto_222097 ) ) ( not ( = ?auto_222092 ?auto_222098 ) ) ( not ( = ?auto_222093 ?auto_222094 ) ) ( not ( = ?auto_222093 ?auto_222095 ) ) ( not ( = ?auto_222093 ?auto_222096 ) ) ( not ( = ?auto_222093 ?auto_222097 ) ) ( not ( = ?auto_222093 ?auto_222098 ) ) ( not ( = ?auto_222094 ?auto_222095 ) ) ( not ( = ?auto_222094 ?auto_222096 ) ) ( not ( = ?auto_222094 ?auto_222097 ) ) ( not ( = ?auto_222094 ?auto_222098 ) ) ( not ( = ?auto_222095 ?auto_222096 ) ) ( not ( = ?auto_222095 ?auto_222097 ) ) ( not ( = ?auto_222095 ?auto_222098 ) ) ( not ( = ?auto_222096 ?auto_222097 ) ) ( not ( = ?auto_222096 ?auto_222098 ) ) ( not ( = ?auto_222097 ?auto_222098 ) ) ( ON ?auto_222096 ?auto_222097 ) ( ON ?auto_222095 ?auto_222096 ) ( ON ?auto_222094 ?auto_222095 ) ( ON ?auto_222093 ?auto_222094 ) ( ON ?auto_222092 ?auto_222093 ) ( ON ?auto_222091 ?auto_222092 ) ( ON ?auto_222090 ?auto_222091 ) ( ON ?auto_222089 ?auto_222090 ) ( ON ?auto_222088 ?auto_222089 ) ( ON ?auto_222087 ?auto_222088 ) ( ON ?auto_222086 ?auto_222087 ) ( CLEAR ?auto_222086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_222086 )
      ( MAKE-12PILE ?auto_222086 ?auto_222087 ?auto_222088 ?auto_222089 ?auto_222090 ?auto_222091 ?auto_222092 ?auto_222093 ?auto_222094 ?auto_222095 ?auto_222096 ?auto_222097 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_222111 - BLOCK
      ?auto_222112 - BLOCK
      ?auto_222113 - BLOCK
      ?auto_222114 - BLOCK
      ?auto_222115 - BLOCK
      ?auto_222116 - BLOCK
      ?auto_222117 - BLOCK
      ?auto_222118 - BLOCK
      ?auto_222119 - BLOCK
      ?auto_222120 - BLOCK
      ?auto_222121 - BLOCK
      ?auto_222122 - BLOCK
    )
    :vars
    (
      ?auto_222123 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_222122 ?auto_222123 ) ( not ( = ?auto_222111 ?auto_222112 ) ) ( not ( = ?auto_222111 ?auto_222113 ) ) ( not ( = ?auto_222111 ?auto_222114 ) ) ( not ( = ?auto_222111 ?auto_222115 ) ) ( not ( = ?auto_222111 ?auto_222116 ) ) ( not ( = ?auto_222111 ?auto_222117 ) ) ( not ( = ?auto_222111 ?auto_222118 ) ) ( not ( = ?auto_222111 ?auto_222119 ) ) ( not ( = ?auto_222111 ?auto_222120 ) ) ( not ( = ?auto_222111 ?auto_222121 ) ) ( not ( = ?auto_222111 ?auto_222122 ) ) ( not ( = ?auto_222111 ?auto_222123 ) ) ( not ( = ?auto_222112 ?auto_222113 ) ) ( not ( = ?auto_222112 ?auto_222114 ) ) ( not ( = ?auto_222112 ?auto_222115 ) ) ( not ( = ?auto_222112 ?auto_222116 ) ) ( not ( = ?auto_222112 ?auto_222117 ) ) ( not ( = ?auto_222112 ?auto_222118 ) ) ( not ( = ?auto_222112 ?auto_222119 ) ) ( not ( = ?auto_222112 ?auto_222120 ) ) ( not ( = ?auto_222112 ?auto_222121 ) ) ( not ( = ?auto_222112 ?auto_222122 ) ) ( not ( = ?auto_222112 ?auto_222123 ) ) ( not ( = ?auto_222113 ?auto_222114 ) ) ( not ( = ?auto_222113 ?auto_222115 ) ) ( not ( = ?auto_222113 ?auto_222116 ) ) ( not ( = ?auto_222113 ?auto_222117 ) ) ( not ( = ?auto_222113 ?auto_222118 ) ) ( not ( = ?auto_222113 ?auto_222119 ) ) ( not ( = ?auto_222113 ?auto_222120 ) ) ( not ( = ?auto_222113 ?auto_222121 ) ) ( not ( = ?auto_222113 ?auto_222122 ) ) ( not ( = ?auto_222113 ?auto_222123 ) ) ( not ( = ?auto_222114 ?auto_222115 ) ) ( not ( = ?auto_222114 ?auto_222116 ) ) ( not ( = ?auto_222114 ?auto_222117 ) ) ( not ( = ?auto_222114 ?auto_222118 ) ) ( not ( = ?auto_222114 ?auto_222119 ) ) ( not ( = ?auto_222114 ?auto_222120 ) ) ( not ( = ?auto_222114 ?auto_222121 ) ) ( not ( = ?auto_222114 ?auto_222122 ) ) ( not ( = ?auto_222114 ?auto_222123 ) ) ( not ( = ?auto_222115 ?auto_222116 ) ) ( not ( = ?auto_222115 ?auto_222117 ) ) ( not ( = ?auto_222115 ?auto_222118 ) ) ( not ( = ?auto_222115 ?auto_222119 ) ) ( not ( = ?auto_222115 ?auto_222120 ) ) ( not ( = ?auto_222115 ?auto_222121 ) ) ( not ( = ?auto_222115 ?auto_222122 ) ) ( not ( = ?auto_222115 ?auto_222123 ) ) ( not ( = ?auto_222116 ?auto_222117 ) ) ( not ( = ?auto_222116 ?auto_222118 ) ) ( not ( = ?auto_222116 ?auto_222119 ) ) ( not ( = ?auto_222116 ?auto_222120 ) ) ( not ( = ?auto_222116 ?auto_222121 ) ) ( not ( = ?auto_222116 ?auto_222122 ) ) ( not ( = ?auto_222116 ?auto_222123 ) ) ( not ( = ?auto_222117 ?auto_222118 ) ) ( not ( = ?auto_222117 ?auto_222119 ) ) ( not ( = ?auto_222117 ?auto_222120 ) ) ( not ( = ?auto_222117 ?auto_222121 ) ) ( not ( = ?auto_222117 ?auto_222122 ) ) ( not ( = ?auto_222117 ?auto_222123 ) ) ( not ( = ?auto_222118 ?auto_222119 ) ) ( not ( = ?auto_222118 ?auto_222120 ) ) ( not ( = ?auto_222118 ?auto_222121 ) ) ( not ( = ?auto_222118 ?auto_222122 ) ) ( not ( = ?auto_222118 ?auto_222123 ) ) ( not ( = ?auto_222119 ?auto_222120 ) ) ( not ( = ?auto_222119 ?auto_222121 ) ) ( not ( = ?auto_222119 ?auto_222122 ) ) ( not ( = ?auto_222119 ?auto_222123 ) ) ( not ( = ?auto_222120 ?auto_222121 ) ) ( not ( = ?auto_222120 ?auto_222122 ) ) ( not ( = ?auto_222120 ?auto_222123 ) ) ( not ( = ?auto_222121 ?auto_222122 ) ) ( not ( = ?auto_222121 ?auto_222123 ) ) ( not ( = ?auto_222122 ?auto_222123 ) ) ( ON ?auto_222121 ?auto_222122 ) ( ON ?auto_222120 ?auto_222121 ) ( ON ?auto_222119 ?auto_222120 ) ( ON ?auto_222118 ?auto_222119 ) ( ON ?auto_222117 ?auto_222118 ) ( ON ?auto_222116 ?auto_222117 ) ( ON ?auto_222115 ?auto_222116 ) ( ON ?auto_222114 ?auto_222115 ) ( ON ?auto_222113 ?auto_222114 ) ( ON ?auto_222112 ?auto_222113 ) ( ON ?auto_222111 ?auto_222112 ) ( CLEAR ?auto_222111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_222111 )
      ( MAKE-12PILE ?auto_222111 ?auto_222112 ?auto_222113 ?auto_222114 ?auto_222115 ?auto_222116 ?auto_222117 ?auto_222118 ?auto_222119 ?auto_222120 ?auto_222121 ?auto_222122 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_222137 - BLOCK
      ?auto_222138 - BLOCK
      ?auto_222139 - BLOCK
      ?auto_222140 - BLOCK
      ?auto_222141 - BLOCK
      ?auto_222142 - BLOCK
      ?auto_222143 - BLOCK
      ?auto_222144 - BLOCK
      ?auto_222145 - BLOCK
      ?auto_222146 - BLOCK
      ?auto_222147 - BLOCK
      ?auto_222148 - BLOCK
      ?auto_222149 - BLOCK
    )
    :vars
    (
      ?auto_222150 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_222148 ) ( ON ?auto_222149 ?auto_222150 ) ( CLEAR ?auto_222149 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_222137 ) ( ON ?auto_222138 ?auto_222137 ) ( ON ?auto_222139 ?auto_222138 ) ( ON ?auto_222140 ?auto_222139 ) ( ON ?auto_222141 ?auto_222140 ) ( ON ?auto_222142 ?auto_222141 ) ( ON ?auto_222143 ?auto_222142 ) ( ON ?auto_222144 ?auto_222143 ) ( ON ?auto_222145 ?auto_222144 ) ( ON ?auto_222146 ?auto_222145 ) ( ON ?auto_222147 ?auto_222146 ) ( ON ?auto_222148 ?auto_222147 ) ( not ( = ?auto_222137 ?auto_222138 ) ) ( not ( = ?auto_222137 ?auto_222139 ) ) ( not ( = ?auto_222137 ?auto_222140 ) ) ( not ( = ?auto_222137 ?auto_222141 ) ) ( not ( = ?auto_222137 ?auto_222142 ) ) ( not ( = ?auto_222137 ?auto_222143 ) ) ( not ( = ?auto_222137 ?auto_222144 ) ) ( not ( = ?auto_222137 ?auto_222145 ) ) ( not ( = ?auto_222137 ?auto_222146 ) ) ( not ( = ?auto_222137 ?auto_222147 ) ) ( not ( = ?auto_222137 ?auto_222148 ) ) ( not ( = ?auto_222137 ?auto_222149 ) ) ( not ( = ?auto_222137 ?auto_222150 ) ) ( not ( = ?auto_222138 ?auto_222139 ) ) ( not ( = ?auto_222138 ?auto_222140 ) ) ( not ( = ?auto_222138 ?auto_222141 ) ) ( not ( = ?auto_222138 ?auto_222142 ) ) ( not ( = ?auto_222138 ?auto_222143 ) ) ( not ( = ?auto_222138 ?auto_222144 ) ) ( not ( = ?auto_222138 ?auto_222145 ) ) ( not ( = ?auto_222138 ?auto_222146 ) ) ( not ( = ?auto_222138 ?auto_222147 ) ) ( not ( = ?auto_222138 ?auto_222148 ) ) ( not ( = ?auto_222138 ?auto_222149 ) ) ( not ( = ?auto_222138 ?auto_222150 ) ) ( not ( = ?auto_222139 ?auto_222140 ) ) ( not ( = ?auto_222139 ?auto_222141 ) ) ( not ( = ?auto_222139 ?auto_222142 ) ) ( not ( = ?auto_222139 ?auto_222143 ) ) ( not ( = ?auto_222139 ?auto_222144 ) ) ( not ( = ?auto_222139 ?auto_222145 ) ) ( not ( = ?auto_222139 ?auto_222146 ) ) ( not ( = ?auto_222139 ?auto_222147 ) ) ( not ( = ?auto_222139 ?auto_222148 ) ) ( not ( = ?auto_222139 ?auto_222149 ) ) ( not ( = ?auto_222139 ?auto_222150 ) ) ( not ( = ?auto_222140 ?auto_222141 ) ) ( not ( = ?auto_222140 ?auto_222142 ) ) ( not ( = ?auto_222140 ?auto_222143 ) ) ( not ( = ?auto_222140 ?auto_222144 ) ) ( not ( = ?auto_222140 ?auto_222145 ) ) ( not ( = ?auto_222140 ?auto_222146 ) ) ( not ( = ?auto_222140 ?auto_222147 ) ) ( not ( = ?auto_222140 ?auto_222148 ) ) ( not ( = ?auto_222140 ?auto_222149 ) ) ( not ( = ?auto_222140 ?auto_222150 ) ) ( not ( = ?auto_222141 ?auto_222142 ) ) ( not ( = ?auto_222141 ?auto_222143 ) ) ( not ( = ?auto_222141 ?auto_222144 ) ) ( not ( = ?auto_222141 ?auto_222145 ) ) ( not ( = ?auto_222141 ?auto_222146 ) ) ( not ( = ?auto_222141 ?auto_222147 ) ) ( not ( = ?auto_222141 ?auto_222148 ) ) ( not ( = ?auto_222141 ?auto_222149 ) ) ( not ( = ?auto_222141 ?auto_222150 ) ) ( not ( = ?auto_222142 ?auto_222143 ) ) ( not ( = ?auto_222142 ?auto_222144 ) ) ( not ( = ?auto_222142 ?auto_222145 ) ) ( not ( = ?auto_222142 ?auto_222146 ) ) ( not ( = ?auto_222142 ?auto_222147 ) ) ( not ( = ?auto_222142 ?auto_222148 ) ) ( not ( = ?auto_222142 ?auto_222149 ) ) ( not ( = ?auto_222142 ?auto_222150 ) ) ( not ( = ?auto_222143 ?auto_222144 ) ) ( not ( = ?auto_222143 ?auto_222145 ) ) ( not ( = ?auto_222143 ?auto_222146 ) ) ( not ( = ?auto_222143 ?auto_222147 ) ) ( not ( = ?auto_222143 ?auto_222148 ) ) ( not ( = ?auto_222143 ?auto_222149 ) ) ( not ( = ?auto_222143 ?auto_222150 ) ) ( not ( = ?auto_222144 ?auto_222145 ) ) ( not ( = ?auto_222144 ?auto_222146 ) ) ( not ( = ?auto_222144 ?auto_222147 ) ) ( not ( = ?auto_222144 ?auto_222148 ) ) ( not ( = ?auto_222144 ?auto_222149 ) ) ( not ( = ?auto_222144 ?auto_222150 ) ) ( not ( = ?auto_222145 ?auto_222146 ) ) ( not ( = ?auto_222145 ?auto_222147 ) ) ( not ( = ?auto_222145 ?auto_222148 ) ) ( not ( = ?auto_222145 ?auto_222149 ) ) ( not ( = ?auto_222145 ?auto_222150 ) ) ( not ( = ?auto_222146 ?auto_222147 ) ) ( not ( = ?auto_222146 ?auto_222148 ) ) ( not ( = ?auto_222146 ?auto_222149 ) ) ( not ( = ?auto_222146 ?auto_222150 ) ) ( not ( = ?auto_222147 ?auto_222148 ) ) ( not ( = ?auto_222147 ?auto_222149 ) ) ( not ( = ?auto_222147 ?auto_222150 ) ) ( not ( = ?auto_222148 ?auto_222149 ) ) ( not ( = ?auto_222148 ?auto_222150 ) ) ( not ( = ?auto_222149 ?auto_222150 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_222149 ?auto_222150 )
      ( !STACK ?auto_222149 ?auto_222148 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_222164 - BLOCK
      ?auto_222165 - BLOCK
      ?auto_222166 - BLOCK
      ?auto_222167 - BLOCK
      ?auto_222168 - BLOCK
      ?auto_222169 - BLOCK
      ?auto_222170 - BLOCK
      ?auto_222171 - BLOCK
      ?auto_222172 - BLOCK
      ?auto_222173 - BLOCK
      ?auto_222174 - BLOCK
      ?auto_222175 - BLOCK
      ?auto_222176 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_222175 ) ( ON-TABLE ?auto_222176 ) ( CLEAR ?auto_222176 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_222164 ) ( ON ?auto_222165 ?auto_222164 ) ( ON ?auto_222166 ?auto_222165 ) ( ON ?auto_222167 ?auto_222166 ) ( ON ?auto_222168 ?auto_222167 ) ( ON ?auto_222169 ?auto_222168 ) ( ON ?auto_222170 ?auto_222169 ) ( ON ?auto_222171 ?auto_222170 ) ( ON ?auto_222172 ?auto_222171 ) ( ON ?auto_222173 ?auto_222172 ) ( ON ?auto_222174 ?auto_222173 ) ( ON ?auto_222175 ?auto_222174 ) ( not ( = ?auto_222164 ?auto_222165 ) ) ( not ( = ?auto_222164 ?auto_222166 ) ) ( not ( = ?auto_222164 ?auto_222167 ) ) ( not ( = ?auto_222164 ?auto_222168 ) ) ( not ( = ?auto_222164 ?auto_222169 ) ) ( not ( = ?auto_222164 ?auto_222170 ) ) ( not ( = ?auto_222164 ?auto_222171 ) ) ( not ( = ?auto_222164 ?auto_222172 ) ) ( not ( = ?auto_222164 ?auto_222173 ) ) ( not ( = ?auto_222164 ?auto_222174 ) ) ( not ( = ?auto_222164 ?auto_222175 ) ) ( not ( = ?auto_222164 ?auto_222176 ) ) ( not ( = ?auto_222165 ?auto_222166 ) ) ( not ( = ?auto_222165 ?auto_222167 ) ) ( not ( = ?auto_222165 ?auto_222168 ) ) ( not ( = ?auto_222165 ?auto_222169 ) ) ( not ( = ?auto_222165 ?auto_222170 ) ) ( not ( = ?auto_222165 ?auto_222171 ) ) ( not ( = ?auto_222165 ?auto_222172 ) ) ( not ( = ?auto_222165 ?auto_222173 ) ) ( not ( = ?auto_222165 ?auto_222174 ) ) ( not ( = ?auto_222165 ?auto_222175 ) ) ( not ( = ?auto_222165 ?auto_222176 ) ) ( not ( = ?auto_222166 ?auto_222167 ) ) ( not ( = ?auto_222166 ?auto_222168 ) ) ( not ( = ?auto_222166 ?auto_222169 ) ) ( not ( = ?auto_222166 ?auto_222170 ) ) ( not ( = ?auto_222166 ?auto_222171 ) ) ( not ( = ?auto_222166 ?auto_222172 ) ) ( not ( = ?auto_222166 ?auto_222173 ) ) ( not ( = ?auto_222166 ?auto_222174 ) ) ( not ( = ?auto_222166 ?auto_222175 ) ) ( not ( = ?auto_222166 ?auto_222176 ) ) ( not ( = ?auto_222167 ?auto_222168 ) ) ( not ( = ?auto_222167 ?auto_222169 ) ) ( not ( = ?auto_222167 ?auto_222170 ) ) ( not ( = ?auto_222167 ?auto_222171 ) ) ( not ( = ?auto_222167 ?auto_222172 ) ) ( not ( = ?auto_222167 ?auto_222173 ) ) ( not ( = ?auto_222167 ?auto_222174 ) ) ( not ( = ?auto_222167 ?auto_222175 ) ) ( not ( = ?auto_222167 ?auto_222176 ) ) ( not ( = ?auto_222168 ?auto_222169 ) ) ( not ( = ?auto_222168 ?auto_222170 ) ) ( not ( = ?auto_222168 ?auto_222171 ) ) ( not ( = ?auto_222168 ?auto_222172 ) ) ( not ( = ?auto_222168 ?auto_222173 ) ) ( not ( = ?auto_222168 ?auto_222174 ) ) ( not ( = ?auto_222168 ?auto_222175 ) ) ( not ( = ?auto_222168 ?auto_222176 ) ) ( not ( = ?auto_222169 ?auto_222170 ) ) ( not ( = ?auto_222169 ?auto_222171 ) ) ( not ( = ?auto_222169 ?auto_222172 ) ) ( not ( = ?auto_222169 ?auto_222173 ) ) ( not ( = ?auto_222169 ?auto_222174 ) ) ( not ( = ?auto_222169 ?auto_222175 ) ) ( not ( = ?auto_222169 ?auto_222176 ) ) ( not ( = ?auto_222170 ?auto_222171 ) ) ( not ( = ?auto_222170 ?auto_222172 ) ) ( not ( = ?auto_222170 ?auto_222173 ) ) ( not ( = ?auto_222170 ?auto_222174 ) ) ( not ( = ?auto_222170 ?auto_222175 ) ) ( not ( = ?auto_222170 ?auto_222176 ) ) ( not ( = ?auto_222171 ?auto_222172 ) ) ( not ( = ?auto_222171 ?auto_222173 ) ) ( not ( = ?auto_222171 ?auto_222174 ) ) ( not ( = ?auto_222171 ?auto_222175 ) ) ( not ( = ?auto_222171 ?auto_222176 ) ) ( not ( = ?auto_222172 ?auto_222173 ) ) ( not ( = ?auto_222172 ?auto_222174 ) ) ( not ( = ?auto_222172 ?auto_222175 ) ) ( not ( = ?auto_222172 ?auto_222176 ) ) ( not ( = ?auto_222173 ?auto_222174 ) ) ( not ( = ?auto_222173 ?auto_222175 ) ) ( not ( = ?auto_222173 ?auto_222176 ) ) ( not ( = ?auto_222174 ?auto_222175 ) ) ( not ( = ?auto_222174 ?auto_222176 ) ) ( not ( = ?auto_222175 ?auto_222176 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_222176 )
      ( !STACK ?auto_222176 ?auto_222175 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_222190 - BLOCK
      ?auto_222191 - BLOCK
      ?auto_222192 - BLOCK
      ?auto_222193 - BLOCK
      ?auto_222194 - BLOCK
      ?auto_222195 - BLOCK
      ?auto_222196 - BLOCK
      ?auto_222197 - BLOCK
      ?auto_222198 - BLOCK
      ?auto_222199 - BLOCK
      ?auto_222200 - BLOCK
      ?auto_222201 - BLOCK
      ?auto_222202 - BLOCK
    )
    :vars
    (
      ?auto_222203 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_222202 ?auto_222203 ) ( ON-TABLE ?auto_222190 ) ( ON ?auto_222191 ?auto_222190 ) ( ON ?auto_222192 ?auto_222191 ) ( ON ?auto_222193 ?auto_222192 ) ( ON ?auto_222194 ?auto_222193 ) ( ON ?auto_222195 ?auto_222194 ) ( ON ?auto_222196 ?auto_222195 ) ( ON ?auto_222197 ?auto_222196 ) ( ON ?auto_222198 ?auto_222197 ) ( ON ?auto_222199 ?auto_222198 ) ( ON ?auto_222200 ?auto_222199 ) ( not ( = ?auto_222190 ?auto_222191 ) ) ( not ( = ?auto_222190 ?auto_222192 ) ) ( not ( = ?auto_222190 ?auto_222193 ) ) ( not ( = ?auto_222190 ?auto_222194 ) ) ( not ( = ?auto_222190 ?auto_222195 ) ) ( not ( = ?auto_222190 ?auto_222196 ) ) ( not ( = ?auto_222190 ?auto_222197 ) ) ( not ( = ?auto_222190 ?auto_222198 ) ) ( not ( = ?auto_222190 ?auto_222199 ) ) ( not ( = ?auto_222190 ?auto_222200 ) ) ( not ( = ?auto_222190 ?auto_222201 ) ) ( not ( = ?auto_222190 ?auto_222202 ) ) ( not ( = ?auto_222190 ?auto_222203 ) ) ( not ( = ?auto_222191 ?auto_222192 ) ) ( not ( = ?auto_222191 ?auto_222193 ) ) ( not ( = ?auto_222191 ?auto_222194 ) ) ( not ( = ?auto_222191 ?auto_222195 ) ) ( not ( = ?auto_222191 ?auto_222196 ) ) ( not ( = ?auto_222191 ?auto_222197 ) ) ( not ( = ?auto_222191 ?auto_222198 ) ) ( not ( = ?auto_222191 ?auto_222199 ) ) ( not ( = ?auto_222191 ?auto_222200 ) ) ( not ( = ?auto_222191 ?auto_222201 ) ) ( not ( = ?auto_222191 ?auto_222202 ) ) ( not ( = ?auto_222191 ?auto_222203 ) ) ( not ( = ?auto_222192 ?auto_222193 ) ) ( not ( = ?auto_222192 ?auto_222194 ) ) ( not ( = ?auto_222192 ?auto_222195 ) ) ( not ( = ?auto_222192 ?auto_222196 ) ) ( not ( = ?auto_222192 ?auto_222197 ) ) ( not ( = ?auto_222192 ?auto_222198 ) ) ( not ( = ?auto_222192 ?auto_222199 ) ) ( not ( = ?auto_222192 ?auto_222200 ) ) ( not ( = ?auto_222192 ?auto_222201 ) ) ( not ( = ?auto_222192 ?auto_222202 ) ) ( not ( = ?auto_222192 ?auto_222203 ) ) ( not ( = ?auto_222193 ?auto_222194 ) ) ( not ( = ?auto_222193 ?auto_222195 ) ) ( not ( = ?auto_222193 ?auto_222196 ) ) ( not ( = ?auto_222193 ?auto_222197 ) ) ( not ( = ?auto_222193 ?auto_222198 ) ) ( not ( = ?auto_222193 ?auto_222199 ) ) ( not ( = ?auto_222193 ?auto_222200 ) ) ( not ( = ?auto_222193 ?auto_222201 ) ) ( not ( = ?auto_222193 ?auto_222202 ) ) ( not ( = ?auto_222193 ?auto_222203 ) ) ( not ( = ?auto_222194 ?auto_222195 ) ) ( not ( = ?auto_222194 ?auto_222196 ) ) ( not ( = ?auto_222194 ?auto_222197 ) ) ( not ( = ?auto_222194 ?auto_222198 ) ) ( not ( = ?auto_222194 ?auto_222199 ) ) ( not ( = ?auto_222194 ?auto_222200 ) ) ( not ( = ?auto_222194 ?auto_222201 ) ) ( not ( = ?auto_222194 ?auto_222202 ) ) ( not ( = ?auto_222194 ?auto_222203 ) ) ( not ( = ?auto_222195 ?auto_222196 ) ) ( not ( = ?auto_222195 ?auto_222197 ) ) ( not ( = ?auto_222195 ?auto_222198 ) ) ( not ( = ?auto_222195 ?auto_222199 ) ) ( not ( = ?auto_222195 ?auto_222200 ) ) ( not ( = ?auto_222195 ?auto_222201 ) ) ( not ( = ?auto_222195 ?auto_222202 ) ) ( not ( = ?auto_222195 ?auto_222203 ) ) ( not ( = ?auto_222196 ?auto_222197 ) ) ( not ( = ?auto_222196 ?auto_222198 ) ) ( not ( = ?auto_222196 ?auto_222199 ) ) ( not ( = ?auto_222196 ?auto_222200 ) ) ( not ( = ?auto_222196 ?auto_222201 ) ) ( not ( = ?auto_222196 ?auto_222202 ) ) ( not ( = ?auto_222196 ?auto_222203 ) ) ( not ( = ?auto_222197 ?auto_222198 ) ) ( not ( = ?auto_222197 ?auto_222199 ) ) ( not ( = ?auto_222197 ?auto_222200 ) ) ( not ( = ?auto_222197 ?auto_222201 ) ) ( not ( = ?auto_222197 ?auto_222202 ) ) ( not ( = ?auto_222197 ?auto_222203 ) ) ( not ( = ?auto_222198 ?auto_222199 ) ) ( not ( = ?auto_222198 ?auto_222200 ) ) ( not ( = ?auto_222198 ?auto_222201 ) ) ( not ( = ?auto_222198 ?auto_222202 ) ) ( not ( = ?auto_222198 ?auto_222203 ) ) ( not ( = ?auto_222199 ?auto_222200 ) ) ( not ( = ?auto_222199 ?auto_222201 ) ) ( not ( = ?auto_222199 ?auto_222202 ) ) ( not ( = ?auto_222199 ?auto_222203 ) ) ( not ( = ?auto_222200 ?auto_222201 ) ) ( not ( = ?auto_222200 ?auto_222202 ) ) ( not ( = ?auto_222200 ?auto_222203 ) ) ( not ( = ?auto_222201 ?auto_222202 ) ) ( not ( = ?auto_222201 ?auto_222203 ) ) ( not ( = ?auto_222202 ?auto_222203 ) ) ( CLEAR ?auto_222200 ) ( ON ?auto_222201 ?auto_222202 ) ( CLEAR ?auto_222201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_222190 ?auto_222191 ?auto_222192 ?auto_222193 ?auto_222194 ?auto_222195 ?auto_222196 ?auto_222197 ?auto_222198 ?auto_222199 ?auto_222200 ?auto_222201 )
      ( MAKE-13PILE ?auto_222190 ?auto_222191 ?auto_222192 ?auto_222193 ?auto_222194 ?auto_222195 ?auto_222196 ?auto_222197 ?auto_222198 ?auto_222199 ?auto_222200 ?auto_222201 ?auto_222202 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_222217 - BLOCK
      ?auto_222218 - BLOCK
      ?auto_222219 - BLOCK
      ?auto_222220 - BLOCK
      ?auto_222221 - BLOCK
      ?auto_222222 - BLOCK
      ?auto_222223 - BLOCK
      ?auto_222224 - BLOCK
      ?auto_222225 - BLOCK
      ?auto_222226 - BLOCK
      ?auto_222227 - BLOCK
      ?auto_222228 - BLOCK
      ?auto_222229 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_222229 ) ( ON-TABLE ?auto_222217 ) ( ON ?auto_222218 ?auto_222217 ) ( ON ?auto_222219 ?auto_222218 ) ( ON ?auto_222220 ?auto_222219 ) ( ON ?auto_222221 ?auto_222220 ) ( ON ?auto_222222 ?auto_222221 ) ( ON ?auto_222223 ?auto_222222 ) ( ON ?auto_222224 ?auto_222223 ) ( ON ?auto_222225 ?auto_222224 ) ( ON ?auto_222226 ?auto_222225 ) ( ON ?auto_222227 ?auto_222226 ) ( not ( = ?auto_222217 ?auto_222218 ) ) ( not ( = ?auto_222217 ?auto_222219 ) ) ( not ( = ?auto_222217 ?auto_222220 ) ) ( not ( = ?auto_222217 ?auto_222221 ) ) ( not ( = ?auto_222217 ?auto_222222 ) ) ( not ( = ?auto_222217 ?auto_222223 ) ) ( not ( = ?auto_222217 ?auto_222224 ) ) ( not ( = ?auto_222217 ?auto_222225 ) ) ( not ( = ?auto_222217 ?auto_222226 ) ) ( not ( = ?auto_222217 ?auto_222227 ) ) ( not ( = ?auto_222217 ?auto_222228 ) ) ( not ( = ?auto_222217 ?auto_222229 ) ) ( not ( = ?auto_222218 ?auto_222219 ) ) ( not ( = ?auto_222218 ?auto_222220 ) ) ( not ( = ?auto_222218 ?auto_222221 ) ) ( not ( = ?auto_222218 ?auto_222222 ) ) ( not ( = ?auto_222218 ?auto_222223 ) ) ( not ( = ?auto_222218 ?auto_222224 ) ) ( not ( = ?auto_222218 ?auto_222225 ) ) ( not ( = ?auto_222218 ?auto_222226 ) ) ( not ( = ?auto_222218 ?auto_222227 ) ) ( not ( = ?auto_222218 ?auto_222228 ) ) ( not ( = ?auto_222218 ?auto_222229 ) ) ( not ( = ?auto_222219 ?auto_222220 ) ) ( not ( = ?auto_222219 ?auto_222221 ) ) ( not ( = ?auto_222219 ?auto_222222 ) ) ( not ( = ?auto_222219 ?auto_222223 ) ) ( not ( = ?auto_222219 ?auto_222224 ) ) ( not ( = ?auto_222219 ?auto_222225 ) ) ( not ( = ?auto_222219 ?auto_222226 ) ) ( not ( = ?auto_222219 ?auto_222227 ) ) ( not ( = ?auto_222219 ?auto_222228 ) ) ( not ( = ?auto_222219 ?auto_222229 ) ) ( not ( = ?auto_222220 ?auto_222221 ) ) ( not ( = ?auto_222220 ?auto_222222 ) ) ( not ( = ?auto_222220 ?auto_222223 ) ) ( not ( = ?auto_222220 ?auto_222224 ) ) ( not ( = ?auto_222220 ?auto_222225 ) ) ( not ( = ?auto_222220 ?auto_222226 ) ) ( not ( = ?auto_222220 ?auto_222227 ) ) ( not ( = ?auto_222220 ?auto_222228 ) ) ( not ( = ?auto_222220 ?auto_222229 ) ) ( not ( = ?auto_222221 ?auto_222222 ) ) ( not ( = ?auto_222221 ?auto_222223 ) ) ( not ( = ?auto_222221 ?auto_222224 ) ) ( not ( = ?auto_222221 ?auto_222225 ) ) ( not ( = ?auto_222221 ?auto_222226 ) ) ( not ( = ?auto_222221 ?auto_222227 ) ) ( not ( = ?auto_222221 ?auto_222228 ) ) ( not ( = ?auto_222221 ?auto_222229 ) ) ( not ( = ?auto_222222 ?auto_222223 ) ) ( not ( = ?auto_222222 ?auto_222224 ) ) ( not ( = ?auto_222222 ?auto_222225 ) ) ( not ( = ?auto_222222 ?auto_222226 ) ) ( not ( = ?auto_222222 ?auto_222227 ) ) ( not ( = ?auto_222222 ?auto_222228 ) ) ( not ( = ?auto_222222 ?auto_222229 ) ) ( not ( = ?auto_222223 ?auto_222224 ) ) ( not ( = ?auto_222223 ?auto_222225 ) ) ( not ( = ?auto_222223 ?auto_222226 ) ) ( not ( = ?auto_222223 ?auto_222227 ) ) ( not ( = ?auto_222223 ?auto_222228 ) ) ( not ( = ?auto_222223 ?auto_222229 ) ) ( not ( = ?auto_222224 ?auto_222225 ) ) ( not ( = ?auto_222224 ?auto_222226 ) ) ( not ( = ?auto_222224 ?auto_222227 ) ) ( not ( = ?auto_222224 ?auto_222228 ) ) ( not ( = ?auto_222224 ?auto_222229 ) ) ( not ( = ?auto_222225 ?auto_222226 ) ) ( not ( = ?auto_222225 ?auto_222227 ) ) ( not ( = ?auto_222225 ?auto_222228 ) ) ( not ( = ?auto_222225 ?auto_222229 ) ) ( not ( = ?auto_222226 ?auto_222227 ) ) ( not ( = ?auto_222226 ?auto_222228 ) ) ( not ( = ?auto_222226 ?auto_222229 ) ) ( not ( = ?auto_222227 ?auto_222228 ) ) ( not ( = ?auto_222227 ?auto_222229 ) ) ( not ( = ?auto_222228 ?auto_222229 ) ) ( CLEAR ?auto_222227 ) ( ON ?auto_222228 ?auto_222229 ) ( CLEAR ?auto_222228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_222217 ?auto_222218 ?auto_222219 ?auto_222220 ?auto_222221 ?auto_222222 ?auto_222223 ?auto_222224 ?auto_222225 ?auto_222226 ?auto_222227 ?auto_222228 )
      ( MAKE-13PILE ?auto_222217 ?auto_222218 ?auto_222219 ?auto_222220 ?auto_222221 ?auto_222222 ?auto_222223 ?auto_222224 ?auto_222225 ?auto_222226 ?auto_222227 ?auto_222228 ?auto_222229 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_222243 - BLOCK
      ?auto_222244 - BLOCK
      ?auto_222245 - BLOCK
      ?auto_222246 - BLOCK
      ?auto_222247 - BLOCK
      ?auto_222248 - BLOCK
      ?auto_222249 - BLOCK
      ?auto_222250 - BLOCK
      ?auto_222251 - BLOCK
      ?auto_222252 - BLOCK
      ?auto_222253 - BLOCK
      ?auto_222254 - BLOCK
      ?auto_222255 - BLOCK
    )
    :vars
    (
      ?auto_222256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_222255 ?auto_222256 ) ( ON-TABLE ?auto_222243 ) ( ON ?auto_222244 ?auto_222243 ) ( ON ?auto_222245 ?auto_222244 ) ( ON ?auto_222246 ?auto_222245 ) ( ON ?auto_222247 ?auto_222246 ) ( ON ?auto_222248 ?auto_222247 ) ( ON ?auto_222249 ?auto_222248 ) ( ON ?auto_222250 ?auto_222249 ) ( ON ?auto_222251 ?auto_222250 ) ( ON ?auto_222252 ?auto_222251 ) ( not ( = ?auto_222243 ?auto_222244 ) ) ( not ( = ?auto_222243 ?auto_222245 ) ) ( not ( = ?auto_222243 ?auto_222246 ) ) ( not ( = ?auto_222243 ?auto_222247 ) ) ( not ( = ?auto_222243 ?auto_222248 ) ) ( not ( = ?auto_222243 ?auto_222249 ) ) ( not ( = ?auto_222243 ?auto_222250 ) ) ( not ( = ?auto_222243 ?auto_222251 ) ) ( not ( = ?auto_222243 ?auto_222252 ) ) ( not ( = ?auto_222243 ?auto_222253 ) ) ( not ( = ?auto_222243 ?auto_222254 ) ) ( not ( = ?auto_222243 ?auto_222255 ) ) ( not ( = ?auto_222243 ?auto_222256 ) ) ( not ( = ?auto_222244 ?auto_222245 ) ) ( not ( = ?auto_222244 ?auto_222246 ) ) ( not ( = ?auto_222244 ?auto_222247 ) ) ( not ( = ?auto_222244 ?auto_222248 ) ) ( not ( = ?auto_222244 ?auto_222249 ) ) ( not ( = ?auto_222244 ?auto_222250 ) ) ( not ( = ?auto_222244 ?auto_222251 ) ) ( not ( = ?auto_222244 ?auto_222252 ) ) ( not ( = ?auto_222244 ?auto_222253 ) ) ( not ( = ?auto_222244 ?auto_222254 ) ) ( not ( = ?auto_222244 ?auto_222255 ) ) ( not ( = ?auto_222244 ?auto_222256 ) ) ( not ( = ?auto_222245 ?auto_222246 ) ) ( not ( = ?auto_222245 ?auto_222247 ) ) ( not ( = ?auto_222245 ?auto_222248 ) ) ( not ( = ?auto_222245 ?auto_222249 ) ) ( not ( = ?auto_222245 ?auto_222250 ) ) ( not ( = ?auto_222245 ?auto_222251 ) ) ( not ( = ?auto_222245 ?auto_222252 ) ) ( not ( = ?auto_222245 ?auto_222253 ) ) ( not ( = ?auto_222245 ?auto_222254 ) ) ( not ( = ?auto_222245 ?auto_222255 ) ) ( not ( = ?auto_222245 ?auto_222256 ) ) ( not ( = ?auto_222246 ?auto_222247 ) ) ( not ( = ?auto_222246 ?auto_222248 ) ) ( not ( = ?auto_222246 ?auto_222249 ) ) ( not ( = ?auto_222246 ?auto_222250 ) ) ( not ( = ?auto_222246 ?auto_222251 ) ) ( not ( = ?auto_222246 ?auto_222252 ) ) ( not ( = ?auto_222246 ?auto_222253 ) ) ( not ( = ?auto_222246 ?auto_222254 ) ) ( not ( = ?auto_222246 ?auto_222255 ) ) ( not ( = ?auto_222246 ?auto_222256 ) ) ( not ( = ?auto_222247 ?auto_222248 ) ) ( not ( = ?auto_222247 ?auto_222249 ) ) ( not ( = ?auto_222247 ?auto_222250 ) ) ( not ( = ?auto_222247 ?auto_222251 ) ) ( not ( = ?auto_222247 ?auto_222252 ) ) ( not ( = ?auto_222247 ?auto_222253 ) ) ( not ( = ?auto_222247 ?auto_222254 ) ) ( not ( = ?auto_222247 ?auto_222255 ) ) ( not ( = ?auto_222247 ?auto_222256 ) ) ( not ( = ?auto_222248 ?auto_222249 ) ) ( not ( = ?auto_222248 ?auto_222250 ) ) ( not ( = ?auto_222248 ?auto_222251 ) ) ( not ( = ?auto_222248 ?auto_222252 ) ) ( not ( = ?auto_222248 ?auto_222253 ) ) ( not ( = ?auto_222248 ?auto_222254 ) ) ( not ( = ?auto_222248 ?auto_222255 ) ) ( not ( = ?auto_222248 ?auto_222256 ) ) ( not ( = ?auto_222249 ?auto_222250 ) ) ( not ( = ?auto_222249 ?auto_222251 ) ) ( not ( = ?auto_222249 ?auto_222252 ) ) ( not ( = ?auto_222249 ?auto_222253 ) ) ( not ( = ?auto_222249 ?auto_222254 ) ) ( not ( = ?auto_222249 ?auto_222255 ) ) ( not ( = ?auto_222249 ?auto_222256 ) ) ( not ( = ?auto_222250 ?auto_222251 ) ) ( not ( = ?auto_222250 ?auto_222252 ) ) ( not ( = ?auto_222250 ?auto_222253 ) ) ( not ( = ?auto_222250 ?auto_222254 ) ) ( not ( = ?auto_222250 ?auto_222255 ) ) ( not ( = ?auto_222250 ?auto_222256 ) ) ( not ( = ?auto_222251 ?auto_222252 ) ) ( not ( = ?auto_222251 ?auto_222253 ) ) ( not ( = ?auto_222251 ?auto_222254 ) ) ( not ( = ?auto_222251 ?auto_222255 ) ) ( not ( = ?auto_222251 ?auto_222256 ) ) ( not ( = ?auto_222252 ?auto_222253 ) ) ( not ( = ?auto_222252 ?auto_222254 ) ) ( not ( = ?auto_222252 ?auto_222255 ) ) ( not ( = ?auto_222252 ?auto_222256 ) ) ( not ( = ?auto_222253 ?auto_222254 ) ) ( not ( = ?auto_222253 ?auto_222255 ) ) ( not ( = ?auto_222253 ?auto_222256 ) ) ( not ( = ?auto_222254 ?auto_222255 ) ) ( not ( = ?auto_222254 ?auto_222256 ) ) ( not ( = ?auto_222255 ?auto_222256 ) ) ( ON ?auto_222254 ?auto_222255 ) ( CLEAR ?auto_222252 ) ( ON ?auto_222253 ?auto_222254 ) ( CLEAR ?auto_222253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_222243 ?auto_222244 ?auto_222245 ?auto_222246 ?auto_222247 ?auto_222248 ?auto_222249 ?auto_222250 ?auto_222251 ?auto_222252 ?auto_222253 )
      ( MAKE-13PILE ?auto_222243 ?auto_222244 ?auto_222245 ?auto_222246 ?auto_222247 ?auto_222248 ?auto_222249 ?auto_222250 ?auto_222251 ?auto_222252 ?auto_222253 ?auto_222254 ?auto_222255 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_222270 - BLOCK
      ?auto_222271 - BLOCK
      ?auto_222272 - BLOCK
      ?auto_222273 - BLOCK
      ?auto_222274 - BLOCK
      ?auto_222275 - BLOCK
      ?auto_222276 - BLOCK
      ?auto_222277 - BLOCK
      ?auto_222278 - BLOCK
      ?auto_222279 - BLOCK
      ?auto_222280 - BLOCK
      ?auto_222281 - BLOCK
      ?auto_222282 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_222282 ) ( ON-TABLE ?auto_222270 ) ( ON ?auto_222271 ?auto_222270 ) ( ON ?auto_222272 ?auto_222271 ) ( ON ?auto_222273 ?auto_222272 ) ( ON ?auto_222274 ?auto_222273 ) ( ON ?auto_222275 ?auto_222274 ) ( ON ?auto_222276 ?auto_222275 ) ( ON ?auto_222277 ?auto_222276 ) ( ON ?auto_222278 ?auto_222277 ) ( ON ?auto_222279 ?auto_222278 ) ( not ( = ?auto_222270 ?auto_222271 ) ) ( not ( = ?auto_222270 ?auto_222272 ) ) ( not ( = ?auto_222270 ?auto_222273 ) ) ( not ( = ?auto_222270 ?auto_222274 ) ) ( not ( = ?auto_222270 ?auto_222275 ) ) ( not ( = ?auto_222270 ?auto_222276 ) ) ( not ( = ?auto_222270 ?auto_222277 ) ) ( not ( = ?auto_222270 ?auto_222278 ) ) ( not ( = ?auto_222270 ?auto_222279 ) ) ( not ( = ?auto_222270 ?auto_222280 ) ) ( not ( = ?auto_222270 ?auto_222281 ) ) ( not ( = ?auto_222270 ?auto_222282 ) ) ( not ( = ?auto_222271 ?auto_222272 ) ) ( not ( = ?auto_222271 ?auto_222273 ) ) ( not ( = ?auto_222271 ?auto_222274 ) ) ( not ( = ?auto_222271 ?auto_222275 ) ) ( not ( = ?auto_222271 ?auto_222276 ) ) ( not ( = ?auto_222271 ?auto_222277 ) ) ( not ( = ?auto_222271 ?auto_222278 ) ) ( not ( = ?auto_222271 ?auto_222279 ) ) ( not ( = ?auto_222271 ?auto_222280 ) ) ( not ( = ?auto_222271 ?auto_222281 ) ) ( not ( = ?auto_222271 ?auto_222282 ) ) ( not ( = ?auto_222272 ?auto_222273 ) ) ( not ( = ?auto_222272 ?auto_222274 ) ) ( not ( = ?auto_222272 ?auto_222275 ) ) ( not ( = ?auto_222272 ?auto_222276 ) ) ( not ( = ?auto_222272 ?auto_222277 ) ) ( not ( = ?auto_222272 ?auto_222278 ) ) ( not ( = ?auto_222272 ?auto_222279 ) ) ( not ( = ?auto_222272 ?auto_222280 ) ) ( not ( = ?auto_222272 ?auto_222281 ) ) ( not ( = ?auto_222272 ?auto_222282 ) ) ( not ( = ?auto_222273 ?auto_222274 ) ) ( not ( = ?auto_222273 ?auto_222275 ) ) ( not ( = ?auto_222273 ?auto_222276 ) ) ( not ( = ?auto_222273 ?auto_222277 ) ) ( not ( = ?auto_222273 ?auto_222278 ) ) ( not ( = ?auto_222273 ?auto_222279 ) ) ( not ( = ?auto_222273 ?auto_222280 ) ) ( not ( = ?auto_222273 ?auto_222281 ) ) ( not ( = ?auto_222273 ?auto_222282 ) ) ( not ( = ?auto_222274 ?auto_222275 ) ) ( not ( = ?auto_222274 ?auto_222276 ) ) ( not ( = ?auto_222274 ?auto_222277 ) ) ( not ( = ?auto_222274 ?auto_222278 ) ) ( not ( = ?auto_222274 ?auto_222279 ) ) ( not ( = ?auto_222274 ?auto_222280 ) ) ( not ( = ?auto_222274 ?auto_222281 ) ) ( not ( = ?auto_222274 ?auto_222282 ) ) ( not ( = ?auto_222275 ?auto_222276 ) ) ( not ( = ?auto_222275 ?auto_222277 ) ) ( not ( = ?auto_222275 ?auto_222278 ) ) ( not ( = ?auto_222275 ?auto_222279 ) ) ( not ( = ?auto_222275 ?auto_222280 ) ) ( not ( = ?auto_222275 ?auto_222281 ) ) ( not ( = ?auto_222275 ?auto_222282 ) ) ( not ( = ?auto_222276 ?auto_222277 ) ) ( not ( = ?auto_222276 ?auto_222278 ) ) ( not ( = ?auto_222276 ?auto_222279 ) ) ( not ( = ?auto_222276 ?auto_222280 ) ) ( not ( = ?auto_222276 ?auto_222281 ) ) ( not ( = ?auto_222276 ?auto_222282 ) ) ( not ( = ?auto_222277 ?auto_222278 ) ) ( not ( = ?auto_222277 ?auto_222279 ) ) ( not ( = ?auto_222277 ?auto_222280 ) ) ( not ( = ?auto_222277 ?auto_222281 ) ) ( not ( = ?auto_222277 ?auto_222282 ) ) ( not ( = ?auto_222278 ?auto_222279 ) ) ( not ( = ?auto_222278 ?auto_222280 ) ) ( not ( = ?auto_222278 ?auto_222281 ) ) ( not ( = ?auto_222278 ?auto_222282 ) ) ( not ( = ?auto_222279 ?auto_222280 ) ) ( not ( = ?auto_222279 ?auto_222281 ) ) ( not ( = ?auto_222279 ?auto_222282 ) ) ( not ( = ?auto_222280 ?auto_222281 ) ) ( not ( = ?auto_222280 ?auto_222282 ) ) ( not ( = ?auto_222281 ?auto_222282 ) ) ( ON ?auto_222281 ?auto_222282 ) ( CLEAR ?auto_222279 ) ( ON ?auto_222280 ?auto_222281 ) ( CLEAR ?auto_222280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_222270 ?auto_222271 ?auto_222272 ?auto_222273 ?auto_222274 ?auto_222275 ?auto_222276 ?auto_222277 ?auto_222278 ?auto_222279 ?auto_222280 )
      ( MAKE-13PILE ?auto_222270 ?auto_222271 ?auto_222272 ?auto_222273 ?auto_222274 ?auto_222275 ?auto_222276 ?auto_222277 ?auto_222278 ?auto_222279 ?auto_222280 ?auto_222281 ?auto_222282 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_222296 - BLOCK
      ?auto_222297 - BLOCK
      ?auto_222298 - BLOCK
      ?auto_222299 - BLOCK
      ?auto_222300 - BLOCK
      ?auto_222301 - BLOCK
      ?auto_222302 - BLOCK
      ?auto_222303 - BLOCK
      ?auto_222304 - BLOCK
      ?auto_222305 - BLOCK
      ?auto_222306 - BLOCK
      ?auto_222307 - BLOCK
      ?auto_222308 - BLOCK
    )
    :vars
    (
      ?auto_222309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_222308 ?auto_222309 ) ( ON-TABLE ?auto_222296 ) ( ON ?auto_222297 ?auto_222296 ) ( ON ?auto_222298 ?auto_222297 ) ( ON ?auto_222299 ?auto_222298 ) ( ON ?auto_222300 ?auto_222299 ) ( ON ?auto_222301 ?auto_222300 ) ( ON ?auto_222302 ?auto_222301 ) ( ON ?auto_222303 ?auto_222302 ) ( ON ?auto_222304 ?auto_222303 ) ( not ( = ?auto_222296 ?auto_222297 ) ) ( not ( = ?auto_222296 ?auto_222298 ) ) ( not ( = ?auto_222296 ?auto_222299 ) ) ( not ( = ?auto_222296 ?auto_222300 ) ) ( not ( = ?auto_222296 ?auto_222301 ) ) ( not ( = ?auto_222296 ?auto_222302 ) ) ( not ( = ?auto_222296 ?auto_222303 ) ) ( not ( = ?auto_222296 ?auto_222304 ) ) ( not ( = ?auto_222296 ?auto_222305 ) ) ( not ( = ?auto_222296 ?auto_222306 ) ) ( not ( = ?auto_222296 ?auto_222307 ) ) ( not ( = ?auto_222296 ?auto_222308 ) ) ( not ( = ?auto_222296 ?auto_222309 ) ) ( not ( = ?auto_222297 ?auto_222298 ) ) ( not ( = ?auto_222297 ?auto_222299 ) ) ( not ( = ?auto_222297 ?auto_222300 ) ) ( not ( = ?auto_222297 ?auto_222301 ) ) ( not ( = ?auto_222297 ?auto_222302 ) ) ( not ( = ?auto_222297 ?auto_222303 ) ) ( not ( = ?auto_222297 ?auto_222304 ) ) ( not ( = ?auto_222297 ?auto_222305 ) ) ( not ( = ?auto_222297 ?auto_222306 ) ) ( not ( = ?auto_222297 ?auto_222307 ) ) ( not ( = ?auto_222297 ?auto_222308 ) ) ( not ( = ?auto_222297 ?auto_222309 ) ) ( not ( = ?auto_222298 ?auto_222299 ) ) ( not ( = ?auto_222298 ?auto_222300 ) ) ( not ( = ?auto_222298 ?auto_222301 ) ) ( not ( = ?auto_222298 ?auto_222302 ) ) ( not ( = ?auto_222298 ?auto_222303 ) ) ( not ( = ?auto_222298 ?auto_222304 ) ) ( not ( = ?auto_222298 ?auto_222305 ) ) ( not ( = ?auto_222298 ?auto_222306 ) ) ( not ( = ?auto_222298 ?auto_222307 ) ) ( not ( = ?auto_222298 ?auto_222308 ) ) ( not ( = ?auto_222298 ?auto_222309 ) ) ( not ( = ?auto_222299 ?auto_222300 ) ) ( not ( = ?auto_222299 ?auto_222301 ) ) ( not ( = ?auto_222299 ?auto_222302 ) ) ( not ( = ?auto_222299 ?auto_222303 ) ) ( not ( = ?auto_222299 ?auto_222304 ) ) ( not ( = ?auto_222299 ?auto_222305 ) ) ( not ( = ?auto_222299 ?auto_222306 ) ) ( not ( = ?auto_222299 ?auto_222307 ) ) ( not ( = ?auto_222299 ?auto_222308 ) ) ( not ( = ?auto_222299 ?auto_222309 ) ) ( not ( = ?auto_222300 ?auto_222301 ) ) ( not ( = ?auto_222300 ?auto_222302 ) ) ( not ( = ?auto_222300 ?auto_222303 ) ) ( not ( = ?auto_222300 ?auto_222304 ) ) ( not ( = ?auto_222300 ?auto_222305 ) ) ( not ( = ?auto_222300 ?auto_222306 ) ) ( not ( = ?auto_222300 ?auto_222307 ) ) ( not ( = ?auto_222300 ?auto_222308 ) ) ( not ( = ?auto_222300 ?auto_222309 ) ) ( not ( = ?auto_222301 ?auto_222302 ) ) ( not ( = ?auto_222301 ?auto_222303 ) ) ( not ( = ?auto_222301 ?auto_222304 ) ) ( not ( = ?auto_222301 ?auto_222305 ) ) ( not ( = ?auto_222301 ?auto_222306 ) ) ( not ( = ?auto_222301 ?auto_222307 ) ) ( not ( = ?auto_222301 ?auto_222308 ) ) ( not ( = ?auto_222301 ?auto_222309 ) ) ( not ( = ?auto_222302 ?auto_222303 ) ) ( not ( = ?auto_222302 ?auto_222304 ) ) ( not ( = ?auto_222302 ?auto_222305 ) ) ( not ( = ?auto_222302 ?auto_222306 ) ) ( not ( = ?auto_222302 ?auto_222307 ) ) ( not ( = ?auto_222302 ?auto_222308 ) ) ( not ( = ?auto_222302 ?auto_222309 ) ) ( not ( = ?auto_222303 ?auto_222304 ) ) ( not ( = ?auto_222303 ?auto_222305 ) ) ( not ( = ?auto_222303 ?auto_222306 ) ) ( not ( = ?auto_222303 ?auto_222307 ) ) ( not ( = ?auto_222303 ?auto_222308 ) ) ( not ( = ?auto_222303 ?auto_222309 ) ) ( not ( = ?auto_222304 ?auto_222305 ) ) ( not ( = ?auto_222304 ?auto_222306 ) ) ( not ( = ?auto_222304 ?auto_222307 ) ) ( not ( = ?auto_222304 ?auto_222308 ) ) ( not ( = ?auto_222304 ?auto_222309 ) ) ( not ( = ?auto_222305 ?auto_222306 ) ) ( not ( = ?auto_222305 ?auto_222307 ) ) ( not ( = ?auto_222305 ?auto_222308 ) ) ( not ( = ?auto_222305 ?auto_222309 ) ) ( not ( = ?auto_222306 ?auto_222307 ) ) ( not ( = ?auto_222306 ?auto_222308 ) ) ( not ( = ?auto_222306 ?auto_222309 ) ) ( not ( = ?auto_222307 ?auto_222308 ) ) ( not ( = ?auto_222307 ?auto_222309 ) ) ( not ( = ?auto_222308 ?auto_222309 ) ) ( ON ?auto_222307 ?auto_222308 ) ( ON ?auto_222306 ?auto_222307 ) ( CLEAR ?auto_222304 ) ( ON ?auto_222305 ?auto_222306 ) ( CLEAR ?auto_222305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_222296 ?auto_222297 ?auto_222298 ?auto_222299 ?auto_222300 ?auto_222301 ?auto_222302 ?auto_222303 ?auto_222304 ?auto_222305 )
      ( MAKE-13PILE ?auto_222296 ?auto_222297 ?auto_222298 ?auto_222299 ?auto_222300 ?auto_222301 ?auto_222302 ?auto_222303 ?auto_222304 ?auto_222305 ?auto_222306 ?auto_222307 ?auto_222308 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_222323 - BLOCK
      ?auto_222324 - BLOCK
      ?auto_222325 - BLOCK
      ?auto_222326 - BLOCK
      ?auto_222327 - BLOCK
      ?auto_222328 - BLOCK
      ?auto_222329 - BLOCK
      ?auto_222330 - BLOCK
      ?auto_222331 - BLOCK
      ?auto_222332 - BLOCK
      ?auto_222333 - BLOCK
      ?auto_222334 - BLOCK
      ?auto_222335 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_222335 ) ( ON-TABLE ?auto_222323 ) ( ON ?auto_222324 ?auto_222323 ) ( ON ?auto_222325 ?auto_222324 ) ( ON ?auto_222326 ?auto_222325 ) ( ON ?auto_222327 ?auto_222326 ) ( ON ?auto_222328 ?auto_222327 ) ( ON ?auto_222329 ?auto_222328 ) ( ON ?auto_222330 ?auto_222329 ) ( ON ?auto_222331 ?auto_222330 ) ( not ( = ?auto_222323 ?auto_222324 ) ) ( not ( = ?auto_222323 ?auto_222325 ) ) ( not ( = ?auto_222323 ?auto_222326 ) ) ( not ( = ?auto_222323 ?auto_222327 ) ) ( not ( = ?auto_222323 ?auto_222328 ) ) ( not ( = ?auto_222323 ?auto_222329 ) ) ( not ( = ?auto_222323 ?auto_222330 ) ) ( not ( = ?auto_222323 ?auto_222331 ) ) ( not ( = ?auto_222323 ?auto_222332 ) ) ( not ( = ?auto_222323 ?auto_222333 ) ) ( not ( = ?auto_222323 ?auto_222334 ) ) ( not ( = ?auto_222323 ?auto_222335 ) ) ( not ( = ?auto_222324 ?auto_222325 ) ) ( not ( = ?auto_222324 ?auto_222326 ) ) ( not ( = ?auto_222324 ?auto_222327 ) ) ( not ( = ?auto_222324 ?auto_222328 ) ) ( not ( = ?auto_222324 ?auto_222329 ) ) ( not ( = ?auto_222324 ?auto_222330 ) ) ( not ( = ?auto_222324 ?auto_222331 ) ) ( not ( = ?auto_222324 ?auto_222332 ) ) ( not ( = ?auto_222324 ?auto_222333 ) ) ( not ( = ?auto_222324 ?auto_222334 ) ) ( not ( = ?auto_222324 ?auto_222335 ) ) ( not ( = ?auto_222325 ?auto_222326 ) ) ( not ( = ?auto_222325 ?auto_222327 ) ) ( not ( = ?auto_222325 ?auto_222328 ) ) ( not ( = ?auto_222325 ?auto_222329 ) ) ( not ( = ?auto_222325 ?auto_222330 ) ) ( not ( = ?auto_222325 ?auto_222331 ) ) ( not ( = ?auto_222325 ?auto_222332 ) ) ( not ( = ?auto_222325 ?auto_222333 ) ) ( not ( = ?auto_222325 ?auto_222334 ) ) ( not ( = ?auto_222325 ?auto_222335 ) ) ( not ( = ?auto_222326 ?auto_222327 ) ) ( not ( = ?auto_222326 ?auto_222328 ) ) ( not ( = ?auto_222326 ?auto_222329 ) ) ( not ( = ?auto_222326 ?auto_222330 ) ) ( not ( = ?auto_222326 ?auto_222331 ) ) ( not ( = ?auto_222326 ?auto_222332 ) ) ( not ( = ?auto_222326 ?auto_222333 ) ) ( not ( = ?auto_222326 ?auto_222334 ) ) ( not ( = ?auto_222326 ?auto_222335 ) ) ( not ( = ?auto_222327 ?auto_222328 ) ) ( not ( = ?auto_222327 ?auto_222329 ) ) ( not ( = ?auto_222327 ?auto_222330 ) ) ( not ( = ?auto_222327 ?auto_222331 ) ) ( not ( = ?auto_222327 ?auto_222332 ) ) ( not ( = ?auto_222327 ?auto_222333 ) ) ( not ( = ?auto_222327 ?auto_222334 ) ) ( not ( = ?auto_222327 ?auto_222335 ) ) ( not ( = ?auto_222328 ?auto_222329 ) ) ( not ( = ?auto_222328 ?auto_222330 ) ) ( not ( = ?auto_222328 ?auto_222331 ) ) ( not ( = ?auto_222328 ?auto_222332 ) ) ( not ( = ?auto_222328 ?auto_222333 ) ) ( not ( = ?auto_222328 ?auto_222334 ) ) ( not ( = ?auto_222328 ?auto_222335 ) ) ( not ( = ?auto_222329 ?auto_222330 ) ) ( not ( = ?auto_222329 ?auto_222331 ) ) ( not ( = ?auto_222329 ?auto_222332 ) ) ( not ( = ?auto_222329 ?auto_222333 ) ) ( not ( = ?auto_222329 ?auto_222334 ) ) ( not ( = ?auto_222329 ?auto_222335 ) ) ( not ( = ?auto_222330 ?auto_222331 ) ) ( not ( = ?auto_222330 ?auto_222332 ) ) ( not ( = ?auto_222330 ?auto_222333 ) ) ( not ( = ?auto_222330 ?auto_222334 ) ) ( not ( = ?auto_222330 ?auto_222335 ) ) ( not ( = ?auto_222331 ?auto_222332 ) ) ( not ( = ?auto_222331 ?auto_222333 ) ) ( not ( = ?auto_222331 ?auto_222334 ) ) ( not ( = ?auto_222331 ?auto_222335 ) ) ( not ( = ?auto_222332 ?auto_222333 ) ) ( not ( = ?auto_222332 ?auto_222334 ) ) ( not ( = ?auto_222332 ?auto_222335 ) ) ( not ( = ?auto_222333 ?auto_222334 ) ) ( not ( = ?auto_222333 ?auto_222335 ) ) ( not ( = ?auto_222334 ?auto_222335 ) ) ( ON ?auto_222334 ?auto_222335 ) ( ON ?auto_222333 ?auto_222334 ) ( CLEAR ?auto_222331 ) ( ON ?auto_222332 ?auto_222333 ) ( CLEAR ?auto_222332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_222323 ?auto_222324 ?auto_222325 ?auto_222326 ?auto_222327 ?auto_222328 ?auto_222329 ?auto_222330 ?auto_222331 ?auto_222332 )
      ( MAKE-13PILE ?auto_222323 ?auto_222324 ?auto_222325 ?auto_222326 ?auto_222327 ?auto_222328 ?auto_222329 ?auto_222330 ?auto_222331 ?auto_222332 ?auto_222333 ?auto_222334 ?auto_222335 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_222349 - BLOCK
      ?auto_222350 - BLOCK
      ?auto_222351 - BLOCK
      ?auto_222352 - BLOCK
      ?auto_222353 - BLOCK
      ?auto_222354 - BLOCK
      ?auto_222355 - BLOCK
      ?auto_222356 - BLOCK
      ?auto_222357 - BLOCK
      ?auto_222358 - BLOCK
      ?auto_222359 - BLOCK
      ?auto_222360 - BLOCK
      ?auto_222361 - BLOCK
    )
    :vars
    (
      ?auto_222362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_222361 ?auto_222362 ) ( ON-TABLE ?auto_222349 ) ( ON ?auto_222350 ?auto_222349 ) ( ON ?auto_222351 ?auto_222350 ) ( ON ?auto_222352 ?auto_222351 ) ( ON ?auto_222353 ?auto_222352 ) ( ON ?auto_222354 ?auto_222353 ) ( ON ?auto_222355 ?auto_222354 ) ( ON ?auto_222356 ?auto_222355 ) ( not ( = ?auto_222349 ?auto_222350 ) ) ( not ( = ?auto_222349 ?auto_222351 ) ) ( not ( = ?auto_222349 ?auto_222352 ) ) ( not ( = ?auto_222349 ?auto_222353 ) ) ( not ( = ?auto_222349 ?auto_222354 ) ) ( not ( = ?auto_222349 ?auto_222355 ) ) ( not ( = ?auto_222349 ?auto_222356 ) ) ( not ( = ?auto_222349 ?auto_222357 ) ) ( not ( = ?auto_222349 ?auto_222358 ) ) ( not ( = ?auto_222349 ?auto_222359 ) ) ( not ( = ?auto_222349 ?auto_222360 ) ) ( not ( = ?auto_222349 ?auto_222361 ) ) ( not ( = ?auto_222349 ?auto_222362 ) ) ( not ( = ?auto_222350 ?auto_222351 ) ) ( not ( = ?auto_222350 ?auto_222352 ) ) ( not ( = ?auto_222350 ?auto_222353 ) ) ( not ( = ?auto_222350 ?auto_222354 ) ) ( not ( = ?auto_222350 ?auto_222355 ) ) ( not ( = ?auto_222350 ?auto_222356 ) ) ( not ( = ?auto_222350 ?auto_222357 ) ) ( not ( = ?auto_222350 ?auto_222358 ) ) ( not ( = ?auto_222350 ?auto_222359 ) ) ( not ( = ?auto_222350 ?auto_222360 ) ) ( not ( = ?auto_222350 ?auto_222361 ) ) ( not ( = ?auto_222350 ?auto_222362 ) ) ( not ( = ?auto_222351 ?auto_222352 ) ) ( not ( = ?auto_222351 ?auto_222353 ) ) ( not ( = ?auto_222351 ?auto_222354 ) ) ( not ( = ?auto_222351 ?auto_222355 ) ) ( not ( = ?auto_222351 ?auto_222356 ) ) ( not ( = ?auto_222351 ?auto_222357 ) ) ( not ( = ?auto_222351 ?auto_222358 ) ) ( not ( = ?auto_222351 ?auto_222359 ) ) ( not ( = ?auto_222351 ?auto_222360 ) ) ( not ( = ?auto_222351 ?auto_222361 ) ) ( not ( = ?auto_222351 ?auto_222362 ) ) ( not ( = ?auto_222352 ?auto_222353 ) ) ( not ( = ?auto_222352 ?auto_222354 ) ) ( not ( = ?auto_222352 ?auto_222355 ) ) ( not ( = ?auto_222352 ?auto_222356 ) ) ( not ( = ?auto_222352 ?auto_222357 ) ) ( not ( = ?auto_222352 ?auto_222358 ) ) ( not ( = ?auto_222352 ?auto_222359 ) ) ( not ( = ?auto_222352 ?auto_222360 ) ) ( not ( = ?auto_222352 ?auto_222361 ) ) ( not ( = ?auto_222352 ?auto_222362 ) ) ( not ( = ?auto_222353 ?auto_222354 ) ) ( not ( = ?auto_222353 ?auto_222355 ) ) ( not ( = ?auto_222353 ?auto_222356 ) ) ( not ( = ?auto_222353 ?auto_222357 ) ) ( not ( = ?auto_222353 ?auto_222358 ) ) ( not ( = ?auto_222353 ?auto_222359 ) ) ( not ( = ?auto_222353 ?auto_222360 ) ) ( not ( = ?auto_222353 ?auto_222361 ) ) ( not ( = ?auto_222353 ?auto_222362 ) ) ( not ( = ?auto_222354 ?auto_222355 ) ) ( not ( = ?auto_222354 ?auto_222356 ) ) ( not ( = ?auto_222354 ?auto_222357 ) ) ( not ( = ?auto_222354 ?auto_222358 ) ) ( not ( = ?auto_222354 ?auto_222359 ) ) ( not ( = ?auto_222354 ?auto_222360 ) ) ( not ( = ?auto_222354 ?auto_222361 ) ) ( not ( = ?auto_222354 ?auto_222362 ) ) ( not ( = ?auto_222355 ?auto_222356 ) ) ( not ( = ?auto_222355 ?auto_222357 ) ) ( not ( = ?auto_222355 ?auto_222358 ) ) ( not ( = ?auto_222355 ?auto_222359 ) ) ( not ( = ?auto_222355 ?auto_222360 ) ) ( not ( = ?auto_222355 ?auto_222361 ) ) ( not ( = ?auto_222355 ?auto_222362 ) ) ( not ( = ?auto_222356 ?auto_222357 ) ) ( not ( = ?auto_222356 ?auto_222358 ) ) ( not ( = ?auto_222356 ?auto_222359 ) ) ( not ( = ?auto_222356 ?auto_222360 ) ) ( not ( = ?auto_222356 ?auto_222361 ) ) ( not ( = ?auto_222356 ?auto_222362 ) ) ( not ( = ?auto_222357 ?auto_222358 ) ) ( not ( = ?auto_222357 ?auto_222359 ) ) ( not ( = ?auto_222357 ?auto_222360 ) ) ( not ( = ?auto_222357 ?auto_222361 ) ) ( not ( = ?auto_222357 ?auto_222362 ) ) ( not ( = ?auto_222358 ?auto_222359 ) ) ( not ( = ?auto_222358 ?auto_222360 ) ) ( not ( = ?auto_222358 ?auto_222361 ) ) ( not ( = ?auto_222358 ?auto_222362 ) ) ( not ( = ?auto_222359 ?auto_222360 ) ) ( not ( = ?auto_222359 ?auto_222361 ) ) ( not ( = ?auto_222359 ?auto_222362 ) ) ( not ( = ?auto_222360 ?auto_222361 ) ) ( not ( = ?auto_222360 ?auto_222362 ) ) ( not ( = ?auto_222361 ?auto_222362 ) ) ( ON ?auto_222360 ?auto_222361 ) ( ON ?auto_222359 ?auto_222360 ) ( ON ?auto_222358 ?auto_222359 ) ( CLEAR ?auto_222356 ) ( ON ?auto_222357 ?auto_222358 ) ( CLEAR ?auto_222357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_222349 ?auto_222350 ?auto_222351 ?auto_222352 ?auto_222353 ?auto_222354 ?auto_222355 ?auto_222356 ?auto_222357 )
      ( MAKE-13PILE ?auto_222349 ?auto_222350 ?auto_222351 ?auto_222352 ?auto_222353 ?auto_222354 ?auto_222355 ?auto_222356 ?auto_222357 ?auto_222358 ?auto_222359 ?auto_222360 ?auto_222361 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_222376 - BLOCK
      ?auto_222377 - BLOCK
      ?auto_222378 - BLOCK
      ?auto_222379 - BLOCK
      ?auto_222380 - BLOCK
      ?auto_222381 - BLOCK
      ?auto_222382 - BLOCK
      ?auto_222383 - BLOCK
      ?auto_222384 - BLOCK
      ?auto_222385 - BLOCK
      ?auto_222386 - BLOCK
      ?auto_222387 - BLOCK
      ?auto_222388 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_222388 ) ( ON-TABLE ?auto_222376 ) ( ON ?auto_222377 ?auto_222376 ) ( ON ?auto_222378 ?auto_222377 ) ( ON ?auto_222379 ?auto_222378 ) ( ON ?auto_222380 ?auto_222379 ) ( ON ?auto_222381 ?auto_222380 ) ( ON ?auto_222382 ?auto_222381 ) ( ON ?auto_222383 ?auto_222382 ) ( not ( = ?auto_222376 ?auto_222377 ) ) ( not ( = ?auto_222376 ?auto_222378 ) ) ( not ( = ?auto_222376 ?auto_222379 ) ) ( not ( = ?auto_222376 ?auto_222380 ) ) ( not ( = ?auto_222376 ?auto_222381 ) ) ( not ( = ?auto_222376 ?auto_222382 ) ) ( not ( = ?auto_222376 ?auto_222383 ) ) ( not ( = ?auto_222376 ?auto_222384 ) ) ( not ( = ?auto_222376 ?auto_222385 ) ) ( not ( = ?auto_222376 ?auto_222386 ) ) ( not ( = ?auto_222376 ?auto_222387 ) ) ( not ( = ?auto_222376 ?auto_222388 ) ) ( not ( = ?auto_222377 ?auto_222378 ) ) ( not ( = ?auto_222377 ?auto_222379 ) ) ( not ( = ?auto_222377 ?auto_222380 ) ) ( not ( = ?auto_222377 ?auto_222381 ) ) ( not ( = ?auto_222377 ?auto_222382 ) ) ( not ( = ?auto_222377 ?auto_222383 ) ) ( not ( = ?auto_222377 ?auto_222384 ) ) ( not ( = ?auto_222377 ?auto_222385 ) ) ( not ( = ?auto_222377 ?auto_222386 ) ) ( not ( = ?auto_222377 ?auto_222387 ) ) ( not ( = ?auto_222377 ?auto_222388 ) ) ( not ( = ?auto_222378 ?auto_222379 ) ) ( not ( = ?auto_222378 ?auto_222380 ) ) ( not ( = ?auto_222378 ?auto_222381 ) ) ( not ( = ?auto_222378 ?auto_222382 ) ) ( not ( = ?auto_222378 ?auto_222383 ) ) ( not ( = ?auto_222378 ?auto_222384 ) ) ( not ( = ?auto_222378 ?auto_222385 ) ) ( not ( = ?auto_222378 ?auto_222386 ) ) ( not ( = ?auto_222378 ?auto_222387 ) ) ( not ( = ?auto_222378 ?auto_222388 ) ) ( not ( = ?auto_222379 ?auto_222380 ) ) ( not ( = ?auto_222379 ?auto_222381 ) ) ( not ( = ?auto_222379 ?auto_222382 ) ) ( not ( = ?auto_222379 ?auto_222383 ) ) ( not ( = ?auto_222379 ?auto_222384 ) ) ( not ( = ?auto_222379 ?auto_222385 ) ) ( not ( = ?auto_222379 ?auto_222386 ) ) ( not ( = ?auto_222379 ?auto_222387 ) ) ( not ( = ?auto_222379 ?auto_222388 ) ) ( not ( = ?auto_222380 ?auto_222381 ) ) ( not ( = ?auto_222380 ?auto_222382 ) ) ( not ( = ?auto_222380 ?auto_222383 ) ) ( not ( = ?auto_222380 ?auto_222384 ) ) ( not ( = ?auto_222380 ?auto_222385 ) ) ( not ( = ?auto_222380 ?auto_222386 ) ) ( not ( = ?auto_222380 ?auto_222387 ) ) ( not ( = ?auto_222380 ?auto_222388 ) ) ( not ( = ?auto_222381 ?auto_222382 ) ) ( not ( = ?auto_222381 ?auto_222383 ) ) ( not ( = ?auto_222381 ?auto_222384 ) ) ( not ( = ?auto_222381 ?auto_222385 ) ) ( not ( = ?auto_222381 ?auto_222386 ) ) ( not ( = ?auto_222381 ?auto_222387 ) ) ( not ( = ?auto_222381 ?auto_222388 ) ) ( not ( = ?auto_222382 ?auto_222383 ) ) ( not ( = ?auto_222382 ?auto_222384 ) ) ( not ( = ?auto_222382 ?auto_222385 ) ) ( not ( = ?auto_222382 ?auto_222386 ) ) ( not ( = ?auto_222382 ?auto_222387 ) ) ( not ( = ?auto_222382 ?auto_222388 ) ) ( not ( = ?auto_222383 ?auto_222384 ) ) ( not ( = ?auto_222383 ?auto_222385 ) ) ( not ( = ?auto_222383 ?auto_222386 ) ) ( not ( = ?auto_222383 ?auto_222387 ) ) ( not ( = ?auto_222383 ?auto_222388 ) ) ( not ( = ?auto_222384 ?auto_222385 ) ) ( not ( = ?auto_222384 ?auto_222386 ) ) ( not ( = ?auto_222384 ?auto_222387 ) ) ( not ( = ?auto_222384 ?auto_222388 ) ) ( not ( = ?auto_222385 ?auto_222386 ) ) ( not ( = ?auto_222385 ?auto_222387 ) ) ( not ( = ?auto_222385 ?auto_222388 ) ) ( not ( = ?auto_222386 ?auto_222387 ) ) ( not ( = ?auto_222386 ?auto_222388 ) ) ( not ( = ?auto_222387 ?auto_222388 ) ) ( ON ?auto_222387 ?auto_222388 ) ( ON ?auto_222386 ?auto_222387 ) ( ON ?auto_222385 ?auto_222386 ) ( CLEAR ?auto_222383 ) ( ON ?auto_222384 ?auto_222385 ) ( CLEAR ?auto_222384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_222376 ?auto_222377 ?auto_222378 ?auto_222379 ?auto_222380 ?auto_222381 ?auto_222382 ?auto_222383 ?auto_222384 )
      ( MAKE-13PILE ?auto_222376 ?auto_222377 ?auto_222378 ?auto_222379 ?auto_222380 ?auto_222381 ?auto_222382 ?auto_222383 ?auto_222384 ?auto_222385 ?auto_222386 ?auto_222387 ?auto_222388 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_222402 - BLOCK
      ?auto_222403 - BLOCK
      ?auto_222404 - BLOCK
      ?auto_222405 - BLOCK
      ?auto_222406 - BLOCK
      ?auto_222407 - BLOCK
      ?auto_222408 - BLOCK
      ?auto_222409 - BLOCK
      ?auto_222410 - BLOCK
      ?auto_222411 - BLOCK
      ?auto_222412 - BLOCK
      ?auto_222413 - BLOCK
      ?auto_222414 - BLOCK
    )
    :vars
    (
      ?auto_222415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_222414 ?auto_222415 ) ( ON-TABLE ?auto_222402 ) ( ON ?auto_222403 ?auto_222402 ) ( ON ?auto_222404 ?auto_222403 ) ( ON ?auto_222405 ?auto_222404 ) ( ON ?auto_222406 ?auto_222405 ) ( ON ?auto_222407 ?auto_222406 ) ( ON ?auto_222408 ?auto_222407 ) ( not ( = ?auto_222402 ?auto_222403 ) ) ( not ( = ?auto_222402 ?auto_222404 ) ) ( not ( = ?auto_222402 ?auto_222405 ) ) ( not ( = ?auto_222402 ?auto_222406 ) ) ( not ( = ?auto_222402 ?auto_222407 ) ) ( not ( = ?auto_222402 ?auto_222408 ) ) ( not ( = ?auto_222402 ?auto_222409 ) ) ( not ( = ?auto_222402 ?auto_222410 ) ) ( not ( = ?auto_222402 ?auto_222411 ) ) ( not ( = ?auto_222402 ?auto_222412 ) ) ( not ( = ?auto_222402 ?auto_222413 ) ) ( not ( = ?auto_222402 ?auto_222414 ) ) ( not ( = ?auto_222402 ?auto_222415 ) ) ( not ( = ?auto_222403 ?auto_222404 ) ) ( not ( = ?auto_222403 ?auto_222405 ) ) ( not ( = ?auto_222403 ?auto_222406 ) ) ( not ( = ?auto_222403 ?auto_222407 ) ) ( not ( = ?auto_222403 ?auto_222408 ) ) ( not ( = ?auto_222403 ?auto_222409 ) ) ( not ( = ?auto_222403 ?auto_222410 ) ) ( not ( = ?auto_222403 ?auto_222411 ) ) ( not ( = ?auto_222403 ?auto_222412 ) ) ( not ( = ?auto_222403 ?auto_222413 ) ) ( not ( = ?auto_222403 ?auto_222414 ) ) ( not ( = ?auto_222403 ?auto_222415 ) ) ( not ( = ?auto_222404 ?auto_222405 ) ) ( not ( = ?auto_222404 ?auto_222406 ) ) ( not ( = ?auto_222404 ?auto_222407 ) ) ( not ( = ?auto_222404 ?auto_222408 ) ) ( not ( = ?auto_222404 ?auto_222409 ) ) ( not ( = ?auto_222404 ?auto_222410 ) ) ( not ( = ?auto_222404 ?auto_222411 ) ) ( not ( = ?auto_222404 ?auto_222412 ) ) ( not ( = ?auto_222404 ?auto_222413 ) ) ( not ( = ?auto_222404 ?auto_222414 ) ) ( not ( = ?auto_222404 ?auto_222415 ) ) ( not ( = ?auto_222405 ?auto_222406 ) ) ( not ( = ?auto_222405 ?auto_222407 ) ) ( not ( = ?auto_222405 ?auto_222408 ) ) ( not ( = ?auto_222405 ?auto_222409 ) ) ( not ( = ?auto_222405 ?auto_222410 ) ) ( not ( = ?auto_222405 ?auto_222411 ) ) ( not ( = ?auto_222405 ?auto_222412 ) ) ( not ( = ?auto_222405 ?auto_222413 ) ) ( not ( = ?auto_222405 ?auto_222414 ) ) ( not ( = ?auto_222405 ?auto_222415 ) ) ( not ( = ?auto_222406 ?auto_222407 ) ) ( not ( = ?auto_222406 ?auto_222408 ) ) ( not ( = ?auto_222406 ?auto_222409 ) ) ( not ( = ?auto_222406 ?auto_222410 ) ) ( not ( = ?auto_222406 ?auto_222411 ) ) ( not ( = ?auto_222406 ?auto_222412 ) ) ( not ( = ?auto_222406 ?auto_222413 ) ) ( not ( = ?auto_222406 ?auto_222414 ) ) ( not ( = ?auto_222406 ?auto_222415 ) ) ( not ( = ?auto_222407 ?auto_222408 ) ) ( not ( = ?auto_222407 ?auto_222409 ) ) ( not ( = ?auto_222407 ?auto_222410 ) ) ( not ( = ?auto_222407 ?auto_222411 ) ) ( not ( = ?auto_222407 ?auto_222412 ) ) ( not ( = ?auto_222407 ?auto_222413 ) ) ( not ( = ?auto_222407 ?auto_222414 ) ) ( not ( = ?auto_222407 ?auto_222415 ) ) ( not ( = ?auto_222408 ?auto_222409 ) ) ( not ( = ?auto_222408 ?auto_222410 ) ) ( not ( = ?auto_222408 ?auto_222411 ) ) ( not ( = ?auto_222408 ?auto_222412 ) ) ( not ( = ?auto_222408 ?auto_222413 ) ) ( not ( = ?auto_222408 ?auto_222414 ) ) ( not ( = ?auto_222408 ?auto_222415 ) ) ( not ( = ?auto_222409 ?auto_222410 ) ) ( not ( = ?auto_222409 ?auto_222411 ) ) ( not ( = ?auto_222409 ?auto_222412 ) ) ( not ( = ?auto_222409 ?auto_222413 ) ) ( not ( = ?auto_222409 ?auto_222414 ) ) ( not ( = ?auto_222409 ?auto_222415 ) ) ( not ( = ?auto_222410 ?auto_222411 ) ) ( not ( = ?auto_222410 ?auto_222412 ) ) ( not ( = ?auto_222410 ?auto_222413 ) ) ( not ( = ?auto_222410 ?auto_222414 ) ) ( not ( = ?auto_222410 ?auto_222415 ) ) ( not ( = ?auto_222411 ?auto_222412 ) ) ( not ( = ?auto_222411 ?auto_222413 ) ) ( not ( = ?auto_222411 ?auto_222414 ) ) ( not ( = ?auto_222411 ?auto_222415 ) ) ( not ( = ?auto_222412 ?auto_222413 ) ) ( not ( = ?auto_222412 ?auto_222414 ) ) ( not ( = ?auto_222412 ?auto_222415 ) ) ( not ( = ?auto_222413 ?auto_222414 ) ) ( not ( = ?auto_222413 ?auto_222415 ) ) ( not ( = ?auto_222414 ?auto_222415 ) ) ( ON ?auto_222413 ?auto_222414 ) ( ON ?auto_222412 ?auto_222413 ) ( ON ?auto_222411 ?auto_222412 ) ( ON ?auto_222410 ?auto_222411 ) ( CLEAR ?auto_222408 ) ( ON ?auto_222409 ?auto_222410 ) ( CLEAR ?auto_222409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_222402 ?auto_222403 ?auto_222404 ?auto_222405 ?auto_222406 ?auto_222407 ?auto_222408 ?auto_222409 )
      ( MAKE-13PILE ?auto_222402 ?auto_222403 ?auto_222404 ?auto_222405 ?auto_222406 ?auto_222407 ?auto_222408 ?auto_222409 ?auto_222410 ?auto_222411 ?auto_222412 ?auto_222413 ?auto_222414 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_222429 - BLOCK
      ?auto_222430 - BLOCK
      ?auto_222431 - BLOCK
      ?auto_222432 - BLOCK
      ?auto_222433 - BLOCK
      ?auto_222434 - BLOCK
      ?auto_222435 - BLOCK
      ?auto_222436 - BLOCK
      ?auto_222437 - BLOCK
      ?auto_222438 - BLOCK
      ?auto_222439 - BLOCK
      ?auto_222440 - BLOCK
      ?auto_222441 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_222441 ) ( ON-TABLE ?auto_222429 ) ( ON ?auto_222430 ?auto_222429 ) ( ON ?auto_222431 ?auto_222430 ) ( ON ?auto_222432 ?auto_222431 ) ( ON ?auto_222433 ?auto_222432 ) ( ON ?auto_222434 ?auto_222433 ) ( ON ?auto_222435 ?auto_222434 ) ( not ( = ?auto_222429 ?auto_222430 ) ) ( not ( = ?auto_222429 ?auto_222431 ) ) ( not ( = ?auto_222429 ?auto_222432 ) ) ( not ( = ?auto_222429 ?auto_222433 ) ) ( not ( = ?auto_222429 ?auto_222434 ) ) ( not ( = ?auto_222429 ?auto_222435 ) ) ( not ( = ?auto_222429 ?auto_222436 ) ) ( not ( = ?auto_222429 ?auto_222437 ) ) ( not ( = ?auto_222429 ?auto_222438 ) ) ( not ( = ?auto_222429 ?auto_222439 ) ) ( not ( = ?auto_222429 ?auto_222440 ) ) ( not ( = ?auto_222429 ?auto_222441 ) ) ( not ( = ?auto_222430 ?auto_222431 ) ) ( not ( = ?auto_222430 ?auto_222432 ) ) ( not ( = ?auto_222430 ?auto_222433 ) ) ( not ( = ?auto_222430 ?auto_222434 ) ) ( not ( = ?auto_222430 ?auto_222435 ) ) ( not ( = ?auto_222430 ?auto_222436 ) ) ( not ( = ?auto_222430 ?auto_222437 ) ) ( not ( = ?auto_222430 ?auto_222438 ) ) ( not ( = ?auto_222430 ?auto_222439 ) ) ( not ( = ?auto_222430 ?auto_222440 ) ) ( not ( = ?auto_222430 ?auto_222441 ) ) ( not ( = ?auto_222431 ?auto_222432 ) ) ( not ( = ?auto_222431 ?auto_222433 ) ) ( not ( = ?auto_222431 ?auto_222434 ) ) ( not ( = ?auto_222431 ?auto_222435 ) ) ( not ( = ?auto_222431 ?auto_222436 ) ) ( not ( = ?auto_222431 ?auto_222437 ) ) ( not ( = ?auto_222431 ?auto_222438 ) ) ( not ( = ?auto_222431 ?auto_222439 ) ) ( not ( = ?auto_222431 ?auto_222440 ) ) ( not ( = ?auto_222431 ?auto_222441 ) ) ( not ( = ?auto_222432 ?auto_222433 ) ) ( not ( = ?auto_222432 ?auto_222434 ) ) ( not ( = ?auto_222432 ?auto_222435 ) ) ( not ( = ?auto_222432 ?auto_222436 ) ) ( not ( = ?auto_222432 ?auto_222437 ) ) ( not ( = ?auto_222432 ?auto_222438 ) ) ( not ( = ?auto_222432 ?auto_222439 ) ) ( not ( = ?auto_222432 ?auto_222440 ) ) ( not ( = ?auto_222432 ?auto_222441 ) ) ( not ( = ?auto_222433 ?auto_222434 ) ) ( not ( = ?auto_222433 ?auto_222435 ) ) ( not ( = ?auto_222433 ?auto_222436 ) ) ( not ( = ?auto_222433 ?auto_222437 ) ) ( not ( = ?auto_222433 ?auto_222438 ) ) ( not ( = ?auto_222433 ?auto_222439 ) ) ( not ( = ?auto_222433 ?auto_222440 ) ) ( not ( = ?auto_222433 ?auto_222441 ) ) ( not ( = ?auto_222434 ?auto_222435 ) ) ( not ( = ?auto_222434 ?auto_222436 ) ) ( not ( = ?auto_222434 ?auto_222437 ) ) ( not ( = ?auto_222434 ?auto_222438 ) ) ( not ( = ?auto_222434 ?auto_222439 ) ) ( not ( = ?auto_222434 ?auto_222440 ) ) ( not ( = ?auto_222434 ?auto_222441 ) ) ( not ( = ?auto_222435 ?auto_222436 ) ) ( not ( = ?auto_222435 ?auto_222437 ) ) ( not ( = ?auto_222435 ?auto_222438 ) ) ( not ( = ?auto_222435 ?auto_222439 ) ) ( not ( = ?auto_222435 ?auto_222440 ) ) ( not ( = ?auto_222435 ?auto_222441 ) ) ( not ( = ?auto_222436 ?auto_222437 ) ) ( not ( = ?auto_222436 ?auto_222438 ) ) ( not ( = ?auto_222436 ?auto_222439 ) ) ( not ( = ?auto_222436 ?auto_222440 ) ) ( not ( = ?auto_222436 ?auto_222441 ) ) ( not ( = ?auto_222437 ?auto_222438 ) ) ( not ( = ?auto_222437 ?auto_222439 ) ) ( not ( = ?auto_222437 ?auto_222440 ) ) ( not ( = ?auto_222437 ?auto_222441 ) ) ( not ( = ?auto_222438 ?auto_222439 ) ) ( not ( = ?auto_222438 ?auto_222440 ) ) ( not ( = ?auto_222438 ?auto_222441 ) ) ( not ( = ?auto_222439 ?auto_222440 ) ) ( not ( = ?auto_222439 ?auto_222441 ) ) ( not ( = ?auto_222440 ?auto_222441 ) ) ( ON ?auto_222440 ?auto_222441 ) ( ON ?auto_222439 ?auto_222440 ) ( ON ?auto_222438 ?auto_222439 ) ( ON ?auto_222437 ?auto_222438 ) ( CLEAR ?auto_222435 ) ( ON ?auto_222436 ?auto_222437 ) ( CLEAR ?auto_222436 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_222429 ?auto_222430 ?auto_222431 ?auto_222432 ?auto_222433 ?auto_222434 ?auto_222435 ?auto_222436 )
      ( MAKE-13PILE ?auto_222429 ?auto_222430 ?auto_222431 ?auto_222432 ?auto_222433 ?auto_222434 ?auto_222435 ?auto_222436 ?auto_222437 ?auto_222438 ?auto_222439 ?auto_222440 ?auto_222441 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_222455 - BLOCK
      ?auto_222456 - BLOCK
      ?auto_222457 - BLOCK
      ?auto_222458 - BLOCK
      ?auto_222459 - BLOCK
      ?auto_222460 - BLOCK
      ?auto_222461 - BLOCK
      ?auto_222462 - BLOCK
      ?auto_222463 - BLOCK
      ?auto_222464 - BLOCK
      ?auto_222465 - BLOCK
      ?auto_222466 - BLOCK
      ?auto_222467 - BLOCK
    )
    :vars
    (
      ?auto_222468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_222467 ?auto_222468 ) ( ON-TABLE ?auto_222455 ) ( ON ?auto_222456 ?auto_222455 ) ( ON ?auto_222457 ?auto_222456 ) ( ON ?auto_222458 ?auto_222457 ) ( ON ?auto_222459 ?auto_222458 ) ( ON ?auto_222460 ?auto_222459 ) ( not ( = ?auto_222455 ?auto_222456 ) ) ( not ( = ?auto_222455 ?auto_222457 ) ) ( not ( = ?auto_222455 ?auto_222458 ) ) ( not ( = ?auto_222455 ?auto_222459 ) ) ( not ( = ?auto_222455 ?auto_222460 ) ) ( not ( = ?auto_222455 ?auto_222461 ) ) ( not ( = ?auto_222455 ?auto_222462 ) ) ( not ( = ?auto_222455 ?auto_222463 ) ) ( not ( = ?auto_222455 ?auto_222464 ) ) ( not ( = ?auto_222455 ?auto_222465 ) ) ( not ( = ?auto_222455 ?auto_222466 ) ) ( not ( = ?auto_222455 ?auto_222467 ) ) ( not ( = ?auto_222455 ?auto_222468 ) ) ( not ( = ?auto_222456 ?auto_222457 ) ) ( not ( = ?auto_222456 ?auto_222458 ) ) ( not ( = ?auto_222456 ?auto_222459 ) ) ( not ( = ?auto_222456 ?auto_222460 ) ) ( not ( = ?auto_222456 ?auto_222461 ) ) ( not ( = ?auto_222456 ?auto_222462 ) ) ( not ( = ?auto_222456 ?auto_222463 ) ) ( not ( = ?auto_222456 ?auto_222464 ) ) ( not ( = ?auto_222456 ?auto_222465 ) ) ( not ( = ?auto_222456 ?auto_222466 ) ) ( not ( = ?auto_222456 ?auto_222467 ) ) ( not ( = ?auto_222456 ?auto_222468 ) ) ( not ( = ?auto_222457 ?auto_222458 ) ) ( not ( = ?auto_222457 ?auto_222459 ) ) ( not ( = ?auto_222457 ?auto_222460 ) ) ( not ( = ?auto_222457 ?auto_222461 ) ) ( not ( = ?auto_222457 ?auto_222462 ) ) ( not ( = ?auto_222457 ?auto_222463 ) ) ( not ( = ?auto_222457 ?auto_222464 ) ) ( not ( = ?auto_222457 ?auto_222465 ) ) ( not ( = ?auto_222457 ?auto_222466 ) ) ( not ( = ?auto_222457 ?auto_222467 ) ) ( not ( = ?auto_222457 ?auto_222468 ) ) ( not ( = ?auto_222458 ?auto_222459 ) ) ( not ( = ?auto_222458 ?auto_222460 ) ) ( not ( = ?auto_222458 ?auto_222461 ) ) ( not ( = ?auto_222458 ?auto_222462 ) ) ( not ( = ?auto_222458 ?auto_222463 ) ) ( not ( = ?auto_222458 ?auto_222464 ) ) ( not ( = ?auto_222458 ?auto_222465 ) ) ( not ( = ?auto_222458 ?auto_222466 ) ) ( not ( = ?auto_222458 ?auto_222467 ) ) ( not ( = ?auto_222458 ?auto_222468 ) ) ( not ( = ?auto_222459 ?auto_222460 ) ) ( not ( = ?auto_222459 ?auto_222461 ) ) ( not ( = ?auto_222459 ?auto_222462 ) ) ( not ( = ?auto_222459 ?auto_222463 ) ) ( not ( = ?auto_222459 ?auto_222464 ) ) ( not ( = ?auto_222459 ?auto_222465 ) ) ( not ( = ?auto_222459 ?auto_222466 ) ) ( not ( = ?auto_222459 ?auto_222467 ) ) ( not ( = ?auto_222459 ?auto_222468 ) ) ( not ( = ?auto_222460 ?auto_222461 ) ) ( not ( = ?auto_222460 ?auto_222462 ) ) ( not ( = ?auto_222460 ?auto_222463 ) ) ( not ( = ?auto_222460 ?auto_222464 ) ) ( not ( = ?auto_222460 ?auto_222465 ) ) ( not ( = ?auto_222460 ?auto_222466 ) ) ( not ( = ?auto_222460 ?auto_222467 ) ) ( not ( = ?auto_222460 ?auto_222468 ) ) ( not ( = ?auto_222461 ?auto_222462 ) ) ( not ( = ?auto_222461 ?auto_222463 ) ) ( not ( = ?auto_222461 ?auto_222464 ) ) ( not ( = ?auto_222461 ?auto_222465 ) ) ( not ( = ?auto_222461 ?auto_222466 ) ) ( not ( = ?auto_222461 ?auto_222467 ) ) ( not ( = ?auto_222461 ?auto_222468 ) ) ( not ( = ?auto_222462 ?auto_222463 ) ) ( not ( = ?auto_222462 ?auto_222464 ) ) ( not ( = ?auto_222462 ?auto_222465 ) ) ( not ( = ?auto_222462 ?auto_222466 ) ) ( not ( = ?auto_222462 ?auto_222467 ) ) ( not ( = ?auto_222462 ?auto_222468 ) ) ( not ( = ?auto_222463 ?auto_222464 ) ) ( not ( = ?auto_222463 ?auto_222465 ) ) ( not ( = ?auto_222463 ?auto_222466 ) ) ( not ( = ?auto_222463 ?auto_222467 ) ) ( not ( = ?auto_222463 ?auto_222468 ) ) ( not ( = ?auto_222464 ?auto_222465 ) ) ( not ( = ?auto_222464 ?auto_222466 ) ) ( not ( = ?auto_222464 ?auto_222467 ) ) ( not ( = ?auto_222464 ?auto_222468 ) ) ( not ( = ?auto_222465 ?auto_222466 ) ) ( not ( = ?auto_222465 ?auto_222467 ) ) ( not ( = ?auto_222465 ?auto_222468 ) ) ( not ( = ?auto_222466 ?auto_222467 ) ) ( not ( = ?auto_222466 ?auto_222468 ) ) ( not ( = ?auto_222467 ?auto_222468 ) ) ( ON ?auto_222466 ?auto_222467 ) ( ON ?auto_222465 ?auto_222466 ) ( ON ?auto_222464 ?auto_222465 ) ( ON ?auto_222463 ?auto_222464 ) ( ON ?auto_222462 ?auto_222463 ) ( CLEAR ?auto_222460 ) ( ON ?auto_222461 ?auto_222462 ) ( CLEAR ?auto_222461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_222455 ?auto_222456 ?auto_222457 ?auto_222458 ?auto_222459 ?auto_222460 ?auto_222461 )
      ( MAKE-13PILE ?auto_222455 ?auto_222456 ?auto_222457 ?auto_222458 ?auto_222459 ?auto_222460 ?auto_222461 ?auto_222462 ?auto_222463 ?auto_222464 ?auto_222465 ?auto_222466 ?auto_222467 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_222482 - BLOCK
      ?auto_222483 - BLOCK
      ?auto_222484 - BLOCK
      ?auto_222485 - BLOCK
      ?auto_222486 - BLOCK
      ?auto_222487 - BLOCK
      ?auto_222488 - BLOCK
      ?auto_222489 - BLOCK
      ?auto_222490 - BLOCK
      ?auto_222491 - BLOCK
      ?auto_222492 - BLOCK
      ?auto_222493 - BLOCK
      ?auto_222494 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_222494 ) ( ON-TABLE ?auto_222482 ) ( ON ?auto_222483 ?auto_222482 ) ( ON ?auto_222484 ?auto_222483 ) ( ON ?auto_222485 ?auto_222484 ) ( ON ?auto_222486 ?auto_222485 ) ( ON ?auto_222487 ?auto_222486 ) ( not ( = ?auto_222482 ?auto_222483 ) ) ( not ( = ?auto_222482 ?auto_222484 ) ) ( not ( = ?auto_222482 ?auto_222485 ) ) ( not ( = ?auto_222482 ?auto_222486 ) ) ( not ( = ?auto_222482 ?auto_222487 ) ) ( not ( = ?auto_222482 ?auto_222488 ) ) ( not ( = ?auto_222482 ?auto_222489 ) ) ( not ( = ?auto_222482 ?auto_222490 ) ) ( not ( = ?auto_222482 ?auto_222491 ) ) ( not ( = ?auto_222482 ?auto_222492 ) ) ( not ( = ?auto_222482 ?auto_222493 ) ) ( not ( = ?auto_222482 ?auto_222494 ) ) ( not ( = ?auto_222483 ?auto_222484 ) ) ( not ( = ?auto_222483 ?auto_222485 ) ) ( not ( = ?auto_222483 ?auto_222486 ) ) ( not ( = ?auto_222483 ?auto_222487 ) ) ( not ( = ?auto_222483 ?auto_222488 ) ) ( not ( = ?auto_222483 ?auto_222489 ) ) ( not ( = ?auto_222483 ?auto_222490 ) ) ( not ( = ?auto_222483 ?auto_222491 ) ) ( not ( = ?auto_222483 ?auto_222492 ) ) ( not ( = ?auto_222483 ?auto_222493 ) ) ( not ( = ?auto_222483 ?auto_222494 ) ) ( not ( = ?auto_222484 ?auto_222485 ) ) ( not ( = ?auto_222484 ?auto_222486 ) ) ( not ( = ?auto_222484 ?auto_222487 ) ) ( not ( = ?auto_222484 ?auto_222488 ) ) ( not ( = ?auto_222484 ?auto_222489 ) ) ( not ( = ?auto_222484 ?auto_222490 ) ) ( not ( = ?auto_222484 ?auto_222491 ) ) ( not ( = ?auto_222484 ?auto_222492 ) ) ( not ( = ?auto_222484 ?auto_222493 ) ) ( not ( = ?auto_222484 ?auto_222494 ) ) ( not ( = ?auto_222485 ?auto_222486 ) ) ( not ( = ?auto_222485 ?auto_222487 ) ) ( not ( = ?auto_222485 ?auto_222488 ) ) ( not ( = ?auto_222485 ?auto_222489 ) ) ( not ( = ?auto_222485 ?auto_222490 ) ) ( not ( = ?auto_222485 ?auto_222491 ) ) ( not ( = ?auto_222485 ?auto_222492 ) ) ( not ( = ?auto_222485 ?auto_222493 ) ) ( not ( = ?auto_222485 ?auto_222494 ) ) ( not ( = ?auto_222486 ?auto_222487 ) ) ( not ( = ?auto_222486 ?auto_222488 ) ) ( not ( = ?auto_222486 ?auto_222489 ) ) ( not ( = ?auto_222486 ?auto_222490 ) ) ( not ( = ?auto_222486 ?auto_222491 ) ) ( not ( = ?auto_222486 ?auto_222492 ) ) ( not ( = ?auto_222486 ?auto_222493 ) ) ( not ( = ?auto_222486 ?auto_222494 ) ) ( not ( = ?auto_222487 ?auto_222488 ) ) ( not ( = ?auto_222487 ?auto_222489 ) ) ( not ( = ?auto_222487 ?auto_222490 ) ) ( not ( = ?auto_222487 ?auto_222491 ) ) ( not ( = ?auto_222487 ?auto_222492 ) ) ( not ( = ?auto_222487 ?auto_222493 ) ) ( not ( = ?auto_222487 ?auto_222494 ) ) ( not ( = ?auto_222488 ?auto_222489 ) ) ( not ( = ?auto_222488 ?auto_222490 ) ) ( not ( = ?auto_222488 ?auto_222491 ) ) ( not ( = ?auto_222488 ?auto_222492 ) ) ( not ( = ?auto_222488 ?auto_222493 ) ) ( not ( = ?auto_222488 ?auto_222494 ) ) ( not ( = ?auto_222489 ?auto_222490 ) ) ( not ( = ?auto_222489 ?auto_222491 ) ) ( not ( = ?auto_222489 ?auto_222492 ) ) ( not ( = ?auto_222489 ?auto_222493 ) ) ( not ( = ?auto_222489 ?auto_222494 ) ) ( not ( = ?auto_222490 ?auto_222491 ) ) ( not ( = ?auto_222490 ?auto_222492 ) ) ( not ( = ?auto_222490 ?auto_222493 ) ) ( not ( = ?auto_222490 ?auto_222494 ) ) ( not ( = ?auto_222491 ?auto_222492 ) ) ( not ( = ?auto_222491 ?auto_222493 ) ) ( not ( = ?auto_222491 ?auto_222494 ) ) ( not ( = ?auto_222492 ?auto_222493 ) ) ( not ( = ?auto_222492 ?auto_222494 ) ) ( not ( = ?auto_222493 ?auto_222494 ) ) ( ON ?auto_222493 ?auto_222494 ) ( ON ?auto_222492 ?auto_222493 ) ( ON ?auto_222491 ?auto_222492 ) ( ON ?auto_222490 ?auto_222491 ) ( ON ?auto_222489 ?auto_222490 ) ( CLEAR ?auto_222487 ) ( ON ?auto_222488 ?auto_222489 ) ( CLEAR ?auto_222488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_222482 ?auto_222483 ?auto_222484 ?auto_222485 ?auto_222486 ?auto_222487 ?auto_222488 )
      ( MAKE-13PILE ?auto_222482 ?auto_222483 ?auto_222484 ?auto_222485 ?auto_222486 ?auto_222487 ?auto_222488 ?auto_222489 ?auto_222490 ?auto_222491 ?auto_222492 ?auto_222493 ?auto_222494 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_222508 - BLOCK
      ?auto_222509 - BLOCK
      ?auto_222510 - BLOCK
      ?auto_222511 - BLOCK
      ?auto_222512 - BLOCK
      ?auto_222513 - BLOCK
      ?auto_222514 - BLOCK
      ?auto_222515 - BLOCK
      ?auto_222516 - BLOCK
      ?auto_222517 - BLOCK
      ?auto_222518 - BLOCK
      ?auto_222519 - BLOCK
      ?auto_222520 - BLOCK
    )
    :vars
    (
      ?auto_222521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_222520 ?auto_222521 ) ( ON-TABLE ?auto_222508 ) ( ON ?auto_222509 ?auto_222508 ) ( ON ?auto_222510 ?auto_222509 ) ( ON ?auto_222511 ?auto_222510 ) ( ON ?auto_222512 ?auto_222511 ) ( not ( = ?auto_222508 ?auto_222509 ) ) ( not ( = ?auto_222508 ?auto_222510 ) ) ( not ( = ?auto_222508 ?auto_222511 ) ) ( not ( = ?auto_222508 ?auto_222512 ) ) ( not ( = ?auto_222508 ?auto_222513 ) ) ( not ( = ?auto_222508 ?auto_222514 ) ) ( not ( = ?auto_222508 ?auto_222515 ) ) ( not ( = ?auto_222508 ?auto_222516 ) ) ( not ( = ?auto_222508 ?auto_222517 ) ) ( not ( = ?auto_222508 ?auto_222518 ) ) ( not ( = ?auto_222508 ?auto_222519 ) ) ( not ( = ?auto_222508 ?auto_222520 ) ) ( not ( = ?auto_222508 ?auto_222521 ) ) ( not ( = ?auto_222509 ?auto_222510 ) ) ( not ( = ?auto_222509 ?auto_222511 ) ) ( not ( = ?auto_222509 ?auto_222512 ) ) ( not ( = ?auto_222509 ?auto_222513 ) ) ( not ( = ?auto_222509 ?auto_222514 ) ) ( not ( = ?auto_222509 ?auto_222515 ) ) ( not ( = ?auto_222509 ?auto_222516 ) ) ( not ( = ?auto_222509 ?auto_222517 ) ) ( not ( = ?auto_222509 ?auto_222518 ) ) ( not ( = ?auto_222509 ?auto_222519 ) ) ( not ( = ?auto_222509 ?auto_222520 ) ) ( not ( = ?auto_222509 ?auto_222521 ) ) ( not ( = ?auto_222510 ?auto_222511 ) ) ( not ( = ?auto_222510 ?auto_222512 ) ) ( not ( = ?auto_222510 ?auto_222513 ) ) ( not ( = ?auto_222510 ?auto_222514 ) ) ( not ( = ?auto_222510 ?auto_222515 ) ) ( not ( = ?auto_222510 ?auto_222516 ) ) ( not ( = ?auto_222510 ?auto_222517 ) ) ( not ( = ?auto_222510 ?auto_222518 ) ) ( not ( = ?auto_222510 ?auto_222519 ) ) ( not ( = ?auto_222510 ?auto_222520 ) ) ( not ( = ?auto_222510 ?auto_222521 ) ) ( not ( = ?auto_222511 ?auto_222512 ) ) ( not ( = ?auto_222511 ?auto_222513 ) ) ( not ( = ?auto_222511 ?auto_222514 ) ) ( not ( = ?auto_222511 ?auto_222515 ) ) ( not ( = ?auto_222511 ?auto_222516 ) ) ( not ( = ?auto_222511 ?auto_222517 ) ) ( not ( = ?auto_222511 ?auto_222518 ) ) ( not ( = ?auto_222511 ?auto_222519 ) ) ( not ( = ?auto_222511 ?auto_222520 ) ) ( not ( = ?auto_222511 ?auto_222521 ) ) ( not ( = ?auto_222512 ?auto_222513 ) ) ( not ( = ?auto_222512 ?auto_222514 ) ) ( not ( = ?auto_222512 ?auto_222515 ) ) ( not ( = ?auto_222512 ?auto_222516 ) ) ( not ( = ?auto_222512 ?auto_222517 ) ) ( not ( = ?auto_222512 ?auto_222518 ) ) ( not ( = ?auto_222512 ?auto_222519 ) ) ( not ( = ?auto_222512 ?auto_222520 ) ) ( not ( = ?auto_222512 ?auto_222521 ) ) ( not ( = ?auto_222513 ?auto_222514 ) ) ( not ( = ?auto_222513 ?auto_222515 ) ) ( not ( = ?auto_222513 ?auto_222516 ) ) ( not ( = ?auto_222513 ?auto_222517 ) ) ( not ( = ?auto_222513 ?auto_222518 ) ) ( not ( = ?auto_222513 ?auto_222519 ) ) ( not ( = ?auto_222513 ?auto_222520 ) ) ( not ( = ?auto_222513 ?auto_222521 ) ) ( not ( = ?auto_222514 ?auto_222515 ) ) ( not ( = ?auto_222514 ?auto_222516 ) ) ( not ( = ?auto_222514 ?auto_222517 ) ) ( not ( = ?auto_222514 ?auto_222518 ) ) ( not ( = ?auto_222514 ?auto_222519 ) ) ( not ( = ?auto_222514 ?auto_222520 ) ) ( not ( = ?auto_222514 ?auto_222521 ) ) ( not ( = ?auto_222515 ?auto_222516 ) ) ( not ( = ?auto_222515 ?auto_222517 ) ) ( not ( = ?auto_222515 ?auto_222518 ) ) ( not ( = ?auto_222515 ?auto_222519 ) ) ( not ( = ?auto_222515 ?auto_222520 ) ) ( not ( = ?auto_222515 ?auto_222521 ) ) ( not ( = ?auto_222516 ?auto_222517 ) ) ( not ( = ?auto_222516 ?auto_222518 ) ) ( not ( = ?auto_222516 ?auto_222519 ) ) ( not ( = ?auto_222516 ?auto_222520 ) ) ( not ( = ?auto_222516 ?auto_222521 ) ) ( not ( = ?auto_222517 ?auto_222518 ) ) ( not ( = ?auto_222517 ?auto_222519 ) ) ( not ( = ?auto_222517 ?auto_222520 ) ) ( not ( = ?auto_222517 ?auto_222521 ) ) ( not ( = ?auto_222518 ?auto_222519 ) ) ( not ( = ?auto_222518 ?auto_222520 ) ) ( not ( = ?auto_222518 ?auto_222521 ) ) ( not ( = ?auto_222519 ?auto_222520 ) ) ( not ( = ?auto_222519 ?auto_222521 ) ) ( not ( = ?auto_222520 ?auto_222521 ) ) ( ON ?auto_222519 ?auto_222520 ) ( ON ?auto_222518 ?auto_222519 ) ( ON ?auto_222517 ?auto_222518 ) ( ON ?auto_222516 ?auto_222517 ) ( ON ?auto_222515 ?auto_222516 ) ( ON ?auto_222514 ?auto_222515 ) ( CLEAR ?auto_222512 ) ( ON ?auto_222513 ?auto_222514 ) ( CLEAR ?auto_222513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_222508 ?auto_222509 ?auto_222510 ?auto_222511 ?auto_222512 ?auto_222513 )
      ( MAKE-13PILE ?auto_222508 ?auto_222509 ?auto_222510 ?auto_222511 ?auto_222512 ?auto_222513 ?auto_222514 ?auto_222515 ?auto_222516 ?auto_222517 ?auto_222518 ?auto_222519 ?auto_222520 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_222535 - BLOCK
      ?auto_222536 - BLOCK
      ?auto_222537 - BLOCK
      ?auto_222538 - BLOCK
      ?auto_222539 - BLOCK
      ?auto_222540 - BLOCK
      ?auto_222541 - BLOCK
      ?auto_222542 - BLOCK
      ?auto_222543 - BLOCK
      ?auto_222544 - BLOCK
      ?auto_222545 - BLOCK
      ?auto_222546 - BLOCK
      ?auto_222547 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_222547 ) ( ON-TABLE ?auto_222535 ) ( ON ?auto_222536 ?auto_222535 ) ( ON ?auto_222537 ?auto_222536 ) ( ON ?auto_222538 ?auto_222537 ) ( ON ?auto_222539 ?auto_222538 ) ( not ( = ?auto_222535 ?auto_222536 ) ) ( not ( = ?auto_222535 ?auto_222537 ) ) ( not ( = ?auto_222535 ?auto_222538 ) ) ( not ( = ?auto_222535 ?auto_222539 ) ) ( not ( = ?auto_222535 ?auto_222540 ) ) ( not ( = ?auto_222535 ?auto_222541 ) ) ( not ( = ?auto_222535 ?auto_222542 ) ) ( not ( = ?auto_222535 ?auto_222543 ) ) ( not ( = ?auto_222535 ?auto_222544 ) ) ( not ( = ?auto_222535 ?auto_222545 ) ) ( not ( = ?auto_222535 ?auto_222546 ) ) ( not ( = ?auto_222535 ?auto_222547 ) ) ( not ( = ?auto_222536 ?auto_222537 ) ) ( not ( = ?auto_222536 ?auto_222538 ) ) ( not ( = ?auto_222536 ?auto_222539 ) ) ( not ( = ?auto_222536 ?auto_222540 ) ) ( not ( = ?auto_222536 ?auto_222541 ) ) ( not ( = ?auto_222536 ?auto_222542 ) ) ( not ( = ?auto_222536 ?auto_222543 ) ) ( not ( = ?auto_222536 ?auto_222544 ) ) ( not ( = ?auto_222536 ?auto_222545 ) ) ( not ( = ?auto_222536 ?auto_222546 ) ) ( not ( = ?auto_222536 ?auto_222547 ) ) ( not ( = ?auto_222537 ?auto_222538 ) ) ( not ( = ?auto_222537 ?auto_222539 ) ) ( not ( = ?auto_222537 ?auto_222540 ) ) ( not ( = ?auto_222537 ?auto_222541 ) ) ( not ( = ?auto_222537 ?auto_222542 ) ) ( not ( = ?auto_222537 ?auto_222543 ) ) ( not ( = ?auto_222537 ?auto_222544 ) ) ( not ( = ?auto_222537 ?auto_222545 ) ) ( not ( = ?auto_222537 ?auto_222546 ) ) ( not ( = ?auto_222537 ?auto_222547 ) ) ( not ( = ?auto_222538 ?auto_222539 ) ) ( not ( = ?auto_222538 ?auto_222540 ) ) ( not ( = ?auto_222538 ?auto_222541 ) ) ( not ( = ?auto_222538 ?auto_222542 ) ) ( not ( = ?auto_222538 ?auto_222543 ) ) ( not ( = ?auto_222538 ?auto_222544 ) ) ( not ( = ?auto_222538 ?auto_222545 ) ) ( not ( = ?auto_222538 ?auto_222546 ) ) ( not ( = ?auto_222538 ?auto_222547 ) ) ( not ( = ?auto_222539 ?auto_222540 ) ) ( not ( = ?auto_222539 ?auto_222541 ) ) ( not ( = ?auto_222539 ?auto_222542 ) ) ( not ( = ?auto_222539 ?auto_222543 ) ) ( not ( = ?auto_222539 ?auto_222544 ) ) ( not ( = ?auto_222539 ?auto_222545 ) ) ( not ( = ?auto_222539 ?auto_222546 ) ) ( not ( = ?auto_222539 ?auto_222547 ) ) ( not ( = ?auto_222540 ?auto_222541 ) ) ( not ( = ?auto_222540 ?auto_222542 ) ) ( not ( = ?auto_222540 ?auto_222543 ) ) ( not ( = ?auto_222540 ?auto_222544 ) ) ( not ( = ?auto_222540 ?auto_222545 ) ) ( not ( = ?auto_222540 ?auto_222546 ) ) ( not ( = ?auto_222540 ?auto_222547 ) ) ( not ( = ?auto_222541 ?auto_222542 ) ) ( not ( = ?auto_222541 ?auto_222543 ) ) ( not ( = ?auto_222541 ?auto_222544 ) ) ( not ( = ?auto_222541 ?auto_222545 ) ) ( not ( = ?auto_222541 ?auto_222546 ) ) ( not ( = ?auto_222541 ?auto_222547 ) ) ( not ( = ?auto_222542 ?auto_222543 ) ) ( not ( = ?auto_222542 ?auto_222544 ) ) ( not ( = ?auto_222542 ?auto_222545 ) ) ( not ( = ?auto_222542 ?auto_222546 ) ) ( not ( = ?auto_222542 ?auto_222547 ) ) ( not ( = ?auto_222543 ?auto_222544 ) ) ( not ( = ?auto_222543 ?auto_222545 ) ) ( not ( = ?auto_222543 ?auto_222546 ) ) ( not ( = ?auto_222543 ?auto_222547 ) ) ( not ( = ?auto_222544 ?auto_222545 ) ) ( not ( = ?auto_222544 ?auto_222546 ) ) ( not ( = ?auto_222544 ?auto_222547 ) ) ( not ( = ?auto_222545 ?auto_222546 ) ) ( not ( = ?auto_222545 ?auto_222547 ) ) ( not ( = ?auto_222546 ?auto_222547 ) ) ( ON ?auto_222546 ?auto_222547 ) ( ON ?auto_222545 ?auto_222546 ) ( ON ?auto_222544 ?auto_222545 ) ( ON ?auto_222543 ?auto_222544 ) ( ON ?auto_222542 ?auto_222543 ) ( ON ?auto_222541 ?auto_222542 ) ( CLEAR ?auto_222539 ) ( ON ?auto_222540 ?auto_222541 ) ( CLEAR ?auto_222540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_222535 ?auto_222536 ?auto_222537 ?auto_222538 ?auto_222539 ?auto_222540 )
      ( MAKE-13PILE ?auto_222535 ?auto_222536 ?auto_222537 ?auto_222538 ?auto_222539 ?auto_222540 ?auto_222541 ?auto_222542 ?auto_222543 ?auto_222544 ?auto_222545 ?auto_222546 ?auto_222547 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_222561 - BLOCK
      ?auto_222562 - BLOCK
      ?auto_222563 - BLOCK
      ?auto_222564 - BLOCK
      ?auto_222565 - BLOCK
      ?auto_222566 - BLOCK
      ?auto_222567 - BLOCK
      ?auto_222568 - BLOCK
      ?auto_222569 - BLOCK
      ?auto_222570 - BLOCK
      ?auto_222571 - BLOCK
      ?auto_222572 - BLOCK
      ?auto_222573 - BLOCK
    )
    :vars
    (
      ?auto_222574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_222573 ?auto_222574 ) ( ON-TABLE ?auto_222561 ) ( ON ?auto_222562 ?auto_222561 ) ( ON ?auto_222563 ?auto_222562 ) ( ON ?auto_222564 ?auto_222563 ) ( not ( = ?auto_222561 ?auto_222562 ) ) ( not ( = ?auto_222561 ?auto_222563 ) ) ( not ( = ?auto_222561 ?auto_222564 ) ) ( not ( = ?auto_222561 ?auto_222565 ) ) ( not ( = ?auto_222561 ?auto_222566 ) ) ( not ( = ?auto_222561 ?auto_222567 ) ) ( not ( = ?auto_222561 ?auto_222568 ) ) ( not ( = ?auto_222561 ?auto_222569 ) ) ( not ( = ?auto_222561 ?auto_222570 ) ) ( not ( = ?auto_222561 ?auto_222571 ) ) ( not ( = ?auto_222561 ?auto_222572 ) ) ( not ( = ?auto_222561 ?auto_222573 ) ) ( not ( = ?auto_222561 ?auto_222574 ) ) ( not ( = ?auto_222562 ?auto_222563 ) ) ( not ( = ?auto_222562 ?auto_222564 ) ) ( not ( = ?auto_222562 ?auto_222565 ) ) ( not ( = ?auto_222562 ?auto_222566 ) ) ( not ( = ?auto_222562 ?auto_222567 ) ) ( not ( = ?auto_222562 ?auto_222568 ) ) ( not ( = ?auto_222562 ?auto_222569 ) ) ( not ( = ?auto_222562 ?auto_222570 ) ) ( not ( = ?auto_222562 ?auto_222571 ) ) ( not ( = ?auto_222562 ?auto_222572 ) ) ( not ( = ?auto_222562 ?auto_222573 ) ) ( not ( = ?auto_222562 ?auto_222574 ) ) ( not ( = ?auto_222563 ?auto_222564 ) ) ( not ( = ?auto_222563 ?auto_222565 ) ) ( not ( = ?auto_222563 ?auto_222566 ) ) ( not ( = ?auto_222563 ?auto_222567 ) ) ( not ( = ?auto_222563 ?auto_222568 ) ) ( not ( = ?auto_222563 ?auto_222569 ) ) ( not ( = ?auto_222563 ?auto_222570 ) ) ( not ( = ?auto_222563 ?auto_222571 ) ) ( not ( = ?auto_222563 ?auto_222572 ) ) ( not ( = ?auto_222563 ?auto_222573 ) ) ( not ( = ?auto_222563 ?auto_222574 ) ) ( not ( = ?auto_222564 ?auto_222565 ) ) ( not ( = ?auto_222564 ?auto_222566 ) ) ( not ( = ?auto_222564 ?auto_222567 ) ) ( not ( = ?auto_222564 ?auto_222568 ) ) ( not ( = ?auto_222564 ?auto_222569 ) ) ( not ( = ?auto_222564 ?auto_222570 ) ) ( not ( = ?auto_222564 ?auto_222571 ) ) ( not ( = ?auto_222564 ?auto_222572 ) ) ( not ( = ?auto_222564 ?auto_222573 ) ) ( not ( = ?auto_222564 ?auto_222574 ) ) ( not ( = ?auto_222565 ?auto_222566 ) ) ( not ( = ?auto_222565 ?auto_222567 ) ) ( not ( = ?auto_222565 ?auto_222568 ) ) ( not ( = ?auto_222565 ?auto_222569 ) ) ( not ( = ?auto_222565 ?auto_222570 ) ) ( not ( = ?auto_222565 ?auto_222571 ) ) ( not ( = ?auto_222565 ?auto_222572 ) ) ( not ( = ?auto_222565 ?auto_222573 ) ) ( not ( = ?auto_222565 ?auto_222574 ) ) ( not ( = ?auto_222566 ?auto_222567 ) ) ( not ( = ?auto_222566 ?auto_222568 ) ) ( not ( = ?auto_222566 ?auto_222569 ) ) ( not ( = ?auto_222566 ?auto_222570 ) ) ( not ( = ?auto_222566 ?auto_222571 ) ) ( not ( = ?auto_222566 ?auto_222572 ) ) ( not ( = ?auto_222566 ?auto_222573 ) ) ( not ( = ?auto_222566 ?auto_222574 ) ) ( not ( = ?auto_222567 ?auto_222568 ) ) ( not ( = ?auto_222567 ?auto_222569 ) ) ( not ( = ?auto_222567 ?auto_222570 ) ) ( not ( = ?auto_222567 ?auto_222571 ) ) ( not ( = ?auto_222567 ?auto_222572 ) ) ( not ( = ?auto_222567 ?auto_222573 ) ) ( not ( = ?auto_222567 ?auto_222574 ) ) ( not ( = ?auto_222568 ?auto_222569 ) ) ( not ( = ?auto_222568 ?auto_222570 ) ) ( not ( = ?auto_222568 ?auto_222571 ) ) ( not ( = ?auto_222568 ?auto_222572 ) ) ( not ( = ?auto_222568 ?auto_222573 ) ) ( not ( = ?auto_222568 ?auto_222574 ) ) ( not ( = ?auto_222569 ?auto_222570 ) ) ( not ( = ?auto_222569 ?auto_222571 ) ) ( not ( = ?auto_222569 ?auto_222572 ) ) ( not ( = ?auto_222569 ?auto_222573 ) ) ( not ( = ?auto_222569 ?auto_222574 ) ) ( not ( = ?auto_222570 ?auto_222571 ) ) ( not ( = ?auto_222570 ?auto_222572 ) ) ( not ( = ?auto_222570 ?auto_222573 ) ) ( not ( = ?auto_222570 ?auto_222574 ) ) ( not ( = ?auto_222571 ?auto_222572 ) ) ( not ( = ?auto_222571 ?auto_222573 ) ) ( not ( = ?auto_222571 ?auto_222574 ) ) ( not ( = ?auto_222572 ?auto_222573 ) ) ( not ( = ?auto_222572 ?auto_222574 ) ) ( not ( = ?auto_222573 ?auto_222574 ) ) ( ON ?auto_222572 ?auto_222573 ) ( ON ?auto_222571 ?auto_222572 ) ( ON ?auto_222570 ?auto_222571 ) ( ON ?auto_222569 ?auto_222570 ) ( ON ?auto_222568 ?auto_222569 ) ( ON ?auto_222567 ?auto_222568 ) ( ON ?auto_222566 ?auto_222567 ) ( CLEAR ?auto_222564 ) ( ON ?auto_222565 ?auto_222566 ) ( CLEAR ?auto_222565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_222561 ?auto_222562 ?auto_222563 ?auto_222564 ?auto_222565 )
      ( MAKE-13PILE ?auto_222561 ?auto_222562 ?auto_222563 ?auto_222564 ?auto_222565 ?auto_222566 ?auto_222567 ?auto_222568 ?auto_222569 ?auto_222570 ?auto_222571 ?auto_222572 ?auto_222573 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_222588 - BLOCK
      ?auto_222589 - BLOCK
      ?auto_222590 - BLOCK
      ?auto_222591 - BLOCK
      ?auto_222592 - BLOCK
      ?auto_222593 - BLOCK
      ?auto_222594 - BLOCK
      ?auto_222595 - BLOCK
      ?auto_222596 - BLOCK
      ?auto_222597 - BLOCK
      ?auto_222598 - BLOCK
      ?auto_222599 - BLOCK
      ?auto_222600 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_222600 ) ( ON-TABLE ?auto_222588 ) ( ON ?auto_222589 ?auto_222588 ) ( ON ?auto_222590 ?auto_222589 ) ( ON ?auto_222591 ?auto_222590 ) ( not ( = ?auto_222588 ?auto_222589 ) ) ( not ( = ?auto_222588 ?auto_222590 ) ) ( not ( = ?auto_222588 ?auto_222591 ) ) ( not ( = ?auto_222588 ?auto_222592 ) ) ( not ( = ?auto_222588 ?auto_222593 ) ) ( not ( = ?auto_222588 ?auto_222594 ) ) ( not ( = ?auto_222588 ?auto_222595 ) ) ( not ( = ?auto_222588 ?auto_222596 ) ) ( not ( = ?auto_222588 ?auto_222597 ) ) ( not ( = ?auto_222588 ?auto_222598 ) ) ( not ( = ?auto_222588 ?auto_222599 ) ) ( not ( = ?auto_222588 ?auto_222600 ) ) ( not ( = ?auto_222589 ?auto_222590 ) ) ( not ( = ?auto_222589 ?auto_222591 ) ) ( not ( = ?auto_222589 ?auto_222592 ) ) ( not ( = ?auto_222589 ?auto_222593 ) ) ( not ( = ?auto_222589 ?auto_222594 ) ) ( not ( = ?auto_222589 ?auto_222595 ) ) ( not ( = ?auto_222589 ?auto_222596 ) ) ( not ( = ?auto_222589 ?auto_222597 ) ) ( not ( = ?auto_222589 ?auto_222598 ) ) ( not ( = ?auto_222589 ?auto_222599 ) ) ( not ( = ?auto_222589 ?auto_222600 ) ) ( not ( = ?auto_222590 ?auto_222591 ) ) ( not ( = ?auto_222590 ?auto_222592 ) ) ( not ( = ?auto_222590 ?auto_222593 ) ) ( not ( = ?auto_222590 ?auto_222594 ) ) ( not ( = ?auto_222590 ?auto_222595 ) ) ( not ( = ?auto_222590 ?auto_222596 ) ) ( not ( = ?auto_222590 ?auto_222597 ) ) ( not ( = ?auto_222590 ?auto_222598 ) ) ( not ( = ?auto_222590 ?auto_222599 ) ) ( not ( = ?auto_222590 ?auto_222600 ) ) ( not ( = ?auto_222591 ?auto_222592 ) ) ( not ( = ?auto_222591 ?auto_222593 ) ) ( not ( = ?auto_222591 ?auto_222594 ) ) ( not ( = ?auto_222591 ?auto_222595 ) ) ( not ( = ?auto_222591 ?auto_222596 ) ) ( not ( = ?auto_222591 ?auto_222597 ) ) ( not ( = ?auto_222591 ?auto_222598 ) ) ( not ( = ?auto_222591 ?auto_222599 ) ) ( not ( = ?auto_222591 ?auto_222600 ) ) ( not ( = ?auto_222592 ?auto_222593 ) ) ( not ( = ?auto_222592 ?auto_222594 ) ) ( not ( = ?auto_222592 ?auto_222595 ) ) ( not ( = ?auto_222592 ?auto_222596 ) ) ( not ( = ?auto_222592 ?auto_222597 ) ) ( not ( = ?auto_222592 ?auto_222598 ) ) ( not ( = ?auto_222592 ?auto_222599 ) ) ( not ( = ?auto_222592 ?auto_222600 ) ) ( not ( = ?auto_222593 ?auto_222594 ) ) ( not ( = ?auto_222593 ?auto_222595 ) ) ( not ( = ?auto_222593 ?auto_222596 ) ) ( not ( = ?auto_222593 ?auto_222597 ) ) ( not ( = ?auto_222593 ?auto_222598 ) ) ( not ( = ?auto_222593 ?auto_222599 ) ) ( not ( = ?auto_222593 ?auto_222600 ) ) ( not ( = ?auto_222594 ?auto_222595 ) ) ( not ( = ?auto_222594 ?auto_222596 ) ) ( not ( = ?auto_222594 ?auto_222597 ) ) ( not ( = ?auto_222594 ?auto_222598 ) ) ( not ( = ?auto_222594 ?auto_222599 ) ) ( not ( = ?auto_222594 ?auto_222600 ) ) ( not ( = ?auto_222595 ?auto_222596 ) ) ( not ( = ?auto_222595 ?auto_222597 ) ) ( not ( = ?auto_222595 ?auto_222598 ) ) ( not ( = ?auto_222595 ?auto_222599 ) ) ( not ( = ?auto_222595 ?auto_222600 ) ) ( not ( = ?auto_222596 ?auto_222597 ) ) ( not ( = ?auto_222596 ?auto_222598 ) ) ( not ( = ?auto_222596 ?auto_222599 ) ) ( not ( = ?auto_222596 ?auto_222600 ) ) ( not ( = ?auto_222597 ?auto_222598 ) ) ( not ( = ?auto_222597 ?auto_222599 ) ) ( not ( = ?auto_222597 ?auto_222600 ) ) ( not ( = ?auto_222598 ?auto_222599 ) ) ( not ( = ?auto_222598 ?auto_222600 ) ) ( not ( = ?auto_222599 ?auto_222600 ) ) ( ON ?auto_222599 ?auto_222600 ) ( ON ?auto_222598 ?auto_222599 ) ( ON ?auto_222597 ?auto_222598 ) ( ON ?auto_222596 ?auto_222597 ) ( ON ?auto_222595 ?auto_222596 ) ( ON ?auto_222594 ?auto_222595 ) ( ON ?auto_222593 ?auto_222594 ) ( CLEAR ?auto_222591 ) ( ON ?auto_222592 ?auto_222593 ) ( CLEAR ?auto_222592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_222588 ?auto_222589 ?auto_222590 ?auto_222591 ?auto_222592 )
      ( MAKE-13PILE ?auto_222588 ?auto_222589 ?auto_222590 ?auto_222591 ?auto_222592 ?auto_222593 ?auto_222594 ?auto_222595 ?auto_222596 ?auto_222597 ?auto_222598 ?auto_222599 ?auto_222600 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_222614 - BLOCK
      ?auto_222615 - BLOCK
      ?auto_222616 - BLOCK
      ?auto_222617 - BLOCK
      ?auto_222618 - BLOCK
      ?auto_222619 - BLOCK
      ?auto_222620 - BLOCK
      ?auto_222621 - BLOCK
      ?auto_222622 - BLOCK
      ?auto_222623 - BLOCK
      ?auto_222624 - BLOCK
      ?auto_222625 - BLOCK
      ?auto_222626 - BLOCK
    )
    :vars
    (
      ?auto_222627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_222626 ?auto_222627 ) ( ON-TABLE ?auto_222614 ) ( ON ?auto_222615 ?auto_222614 ) ( ON ?auto_222616 ?auto_222615 ) ( not ( = ?auto_222614 ?auto_222615 ) ) ( not ( = ?auto_222614 ?auto_222616 ) ) ( not ( = ?auto_222614 ?auto_222617 ) ) ( not ( = ?auto_222614 ?auto_222618 ) ) ( not ( = ?auto_222614 ?auto_222619 ) ) ( not ( = ?auto_222614 ?auto_222620 ) ) ( not ( = ?auto_222614 ?auto_222621 ) ) ( not ( = ?auto_222614 ?auto_222622 ) ) ( not ( = ?auto_222614 ?auto_222623 ) ) ( not ( = ?auto_222614 ?auto_222624 ) ) ( not ( = ?auto_222614 ?auto_222625 ) ) ( not ( = ?auto_222614 ?auto_222626 ) ) ( not ( = ?auto_222614 ?auto_222627 ) ) ( not ( = ?auto_222615 ?auto_222616 ) ) ( not ( = ?auto_222615 ?auto_222617 ) ) ( not ( = ?auto_222615 ?auto_222618 ) ) ( not ( = ?auto_222615 ?auto_222619 ) ) ( not ( = ?auto_222615 ?auto_222620 ) ) ( not ( = ?auto_222615 ?auto_222621 ) ) ( not ( = ?auto_222615 ?auto_222622 ) ) ( not ( = ?auto_222615 ?auto_222623 ) ) ( not ( = ?auto_222615 ?auto_222624 ) ) ( not ( = ?auto_222615 ?auto_222625 ) ) ( not ( = ?auto_222615 ?auto_222626 ) ) ( not ( = ?auto_222615 ?auto_222627 ) ) ( not ( = ?auto_222616 ?auto_222617 ) ) ( not ( = ?auto_222616 ?auto_222618 ) ) ( not ( = ?auto_222616 ?auto_222619 ) ) ( not ( = ?auto_222616 ?auto_222620 ) ) ( not ( = ?auto_222616 ?auto_222621 ) ) ( not ( = ?auto_222616 ?auto_222622 ) ) ( not ( = ?auto_222616 ?auto_222623 ) ) ( not ( = ?auto_222616 ?auto_222624 ) ) ( not ( = ?auto_222616 ?auto_222625 ) ) ( not ( = ?auto_222616 ?auto_222626 ) ) ( not ( = ?auto_222616 ?auto_222627 ) ) ( not ( = ?auto_222617 ?auto_222618 ) ) ( not ( = ?auto_222617 ?auto_222619 ) ) ( not ( = ?auto_222617 ?auto_222620 ) ) ( not ( = ?auto_222617 ?auto_222621 ) ) ( not ( = ?auto_222617 ?auto_222622 ) ) ( not ( = ?auto_222617 ?auto_222623 ) ) ( not ( = ?auto_222617 ?auto_222624 ) ) ( not ( = ?auto_222617 ?auto_222625 ) ) ( not ( = ?auto_222617 ?auto_222626 ) ) ( not ( = ?auto_222617 ?auto_222627 ) ) ( not ( = ?auto_222618 ?auto_222619 ) ) ( not ( = ?auto_222618 ?auto_222620 ) ) ( not ( = ?auto_222618 ?auto_222621 ) ) ( not ( = ?auto_222618 ?auto_222622 ) ) ( not ( = ?auto_222618 ?auto_222623 ) ) ( not ( = ?auto_222618 ?auto_222624 ) ) ( not ( = ?auto_222618 ?auto_222625 ) ) ( not ( = ?auto_222618 ?auto_222626 ) ) ( not ( = ?auto_222618 ?auto_222627 ) ) ( not ( = ?auto_222619 ?auto_222620 ) ) ( not ( = ?auto_222619 ?auto_222621 ) ) ( not ( = ?auto_222619 ?auto_222622 ) ) ( not ( = ?auto_222619 ?auto_222623 ) ) ( not ( = ?auto_222619 ?auto_222624 ) ) ( not ( = ?auto_222619 ?auto_222625 ) ) ( not ( = ?auto_222619 ?auto_222626 ) ) ( not ( = ?auto_222619 ?auto_222627 ) ) ( not ( = ?auto_222620 ?auto_222621 ) ) ( not ( = ?auto_222620 ?auto_222622 ) ) ( not ( = ?auto_222620 ?auto_222623 ) ) ( not ( = ?auto_222620 ?auto_222624 ) ) ( not ( = ?auto_222620 ?auto_222625 ) ) ( not ( = ?auto_222620 ?auto_222626 ) ) ( not ( = ?auto_222620 ?auto_222627 ) ) ( not ( = ?auto_222621 ?auto_222622 ) ) ( not ( = ?auto_222621 ?auto_222623 ) ) ( not ( = ?auto_222621 ?auto_222624 ) ) ( not ( = ?auto_222621 ?auto_222625 ) ) ( not ( = ?auto_222621 ?auto_222626 ) ) ( not ( = ?auto_222621 ?auto_222627 ) ) ( not ( = ?auto_222622 ?auto_222623 ) ) ( not ( = ?auto_222622 ?auto_222624 ) ) ( not ( = ?auto_222622 ?auto_222625 ) ) ( not ( = ?auto_222622 ?auto_222626 ) ) ( not ( = ?auto_222622 ?auto_222627 ) ) ( not ( = ?auto_222623 ?auto_222624 ) ) ( not ( = ?auto_222623 ?auto_222625 ) ) ( not ( = ?auto_222623 ?auto_222626 ) ) ( not ( = ?auto_222623 ?auto_222627 ) ) ( not ( = ?auto_222624 ?auto_222625 ) ) ( not ( = ?auto_222624 ?auto_222626 ) ) ( not ( = ?auto_222624 ?auto_222627 ) ) ( not ( = ?auto_222625 ?auto_222626 ) ) ( not ( = ?auto_222625 ?auto_222627 ) ) ( not ( = ?auto_222626 ?auto_222627 ) ) ( ON ?auto_222625 ?auto_222626 ) ( ON ?auto_222624 ?auto_222625 ) ( ON ?auto_222623 ?auto_222624 ) ( ON ?auto_222622 ?auto_222623 ) ( ON ?auto_222621 ?auto_222622 ) ( ON ?auto_222620 ?auto_222621 ) ( ON ?auto_222619 ?auto_222620 ) ( ON ?auto_222618 ?auto_222619 ) ( CLEAR ?auto_222616 ) ( ON ?auto_222617 ?auto_222618 ) ( CLEAR ?auto_222617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_222614 ?auto_222615 ?auto_222616 ?auto_222617 )
      ( MAKE-13PILE ?auto_222614 ?auto_222615 ?auto_222616 ?auto_222617 ?auto_222618 ?auto_222619 ?auto_222620 ?auto_222621 ?auto_222622 ?auto_222623 ?auto_222624 ?auto_222625 ?auto_222626 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_222641 - BLOCK
      ?auto_222642 - BLOCK
      ?auto_222643 - BLOCK
      ?auto_222644 - BLOCK
      ?auto_222645 - BLOCK
      ?auto_222646 - BLOCK
      ?auto_222647 - BLOCK
      ?auto_222648 - BLOCK
      ?auto_222649 - BLOCK
      ?auto_222650 - BLOCK
      ?auto_222651 - BLOCK
      ?auto_222652 - BLOCK
      ?auto_222653 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_222653 ) ( ON-TABLE ?auto_222641 ) ( ON ?auto_222642 ?auto_222641 ) ( ON ?auto_222643 ?auto_222642 ) ( not ( = ?auto_222641 ?auto_222642 ) ) ( not ( = ?auto_222641 ?auto_222643 ) ) ( not ( = ?auto_222641 ?auto_222644 ) ) ( not ( = ?auto_222641 ?auto_222645 ) ) ( not ( = ?auto_222641 ?auto_222646 ) ) ( not ( = ?auto_222641 ?auto_222647 ) ) ( not ( = ?auto_222641 ?auto_222648 ) ) ( not ( = ?auto_222641 ?auto_222649 ) ) ( not ( = ?auto_222641 ?auto_222650 ) ) ( not ( = ?auto_222641 ?auto_222651 ) ) ( not ( = ?auto_222641 ?auto_222652 ) ) ( not ( = ?auto_222641 ?auto_222653 ) ) ( not ( = ?auto_222642 ?auto_222643 ) ) ( not ( = ?auto_222642 ?auto_222644 ) ) ( not ( = ?auto_222642 ?auto_222645 ) ) ( not ( = ?auto_222642 ?auto_222646 ) ) ( not ( = ?auto_222642 ?auto_222647 ) ) ( not ( = ?auto_222642 ?auto_222648 ) ) ( not ( = ?auto_222642 ?auto_222649 ) ) ( not ( = ?auto_222642 ?auto_222650 ) ) ( not ( = ?auto_222642 ?auto_222651 ) ) ( not ( = ?auto_222642 ?auto_222652 ) ) ( not ( = ?auto_222642 ?auto_222653 ) ) ( not ( = ?auto_222643 ?auto_222644 ) ) ( not ( = ?auto_222643 ?auto_222645 ) ) ( not ( = ?auto_222643 ?auto_222646 ) ) ( not ( = ?auto_222643 ?auto_222647 ) ) ( not ( = ?auto_222643 ?auto_222648 ) ) ( not ( = ?auto_222643 ?auto_222649 ) ) ( not ( = ?auto_222643 ?auto_222650 ) ) ( not ( = ?auto_222643 ?auto_222651 ) ) ( not ( = ?auto_222643 ?auto_222652 ) ) ( not ( = ?auto_222643 ?auto_222653 ) ) ( not ( = ?auto_222644 ?auto_222645 ) ) ( not ( = ?auto_222644 ?auto_222646 ) ) ( not ( = ?auto_222644 ?auto_222647 ) ) ( not ( = ?auto_222644 ?auto_222648 ) ) ( not ( = ?auto_222644 ?auto_222649 ) ) ( not ( = ?auto_222644 ?auto_222650 ) ) ( not ( = ?auto_222644 ?auto_222651 ) ) ( not ( = ?auto_222644 ?auto_222652 ) ) ( not ( = ?auto_222644 ?auto_222653 ) ) ( not ( = ?auto_222645 ?auto_222646 ) ) ( not ( = ?auto_222645 ?auto_222647 ) ) ( not ( = ?auto_222645 ?auto_222648 ) ) ( not ( = ?auto_222645 ?auto_222649 ) ) ( not ( = ?auto_222645 ?auto_222650 ) ) ( not ( = ?auto_222645 ?auto_222651 ) ) ( not ( = ?auto_222645 ?auto_222652 ) ) ( not ( = ?auto_222645 ?auto_222653 ) ) ( not ( = ?auto_222646 ?auto_222647 ) ) ( not ( = ?auto_222646 ?auto_222648 ) ) ( not ( = ?auto_222646 ?auto_222649 ) ) ( not ( = ?auto_222646 ?auto_222650 ) ) ( not ( = ?auto_222646 ?auto_222651 ) ) ( not ( = ?auto_222646 ?auto_222652 ) ) ( not ( = ?auto_222646 ?auto_222653 ) ) ( not ( = ?auto_222647 ?auto_222648 ) ) ( not ( = ?auto_222647 ?auto_222649 ) ) ( not ( = ?auto_222647 ?auto_222650 ) ) ( not ( = ?auto_222647 ?auto_222651 ) ) ( not ( = ?auto_222647 ?auto_222652 ) ) ( not ( = ?auto_222647 ?auto_222653 ) ) ( not ( = ?auto_222648 ?auto_222649 ) ) ( not ( = ?auto_222648 ?auto_222650 ) ) ( not ( = ?auto_222648 ?auto_222651 ) ) ( not ( = ?auto_222648 ?auto_222652 ) ) ( not ( = ?auto_222648 ?auto_222653 ) ) ( not ( = ?auto_222649 ?auto_222650 ) ) ( not ( = ?auto_222649 ?auto_222651 ) ) ( not ( = ?auto_222649 ?auto_222652 ) ) ( not ( = ?auto_222649 ?auto_222653 ) ) ( not ( = ?auto_222650 ?auto_222651 ) ) ( not ( = ?auto_222650 ?auto_222652 ) ) ( not ( = ?auto_222650 ?auto_222653 ) ) ( not ( = ?auto_222651 ?auto_222652 ) ) ( not ( = ?auto_222651 ?auto_222653 ) ) ( not ( = ?auto_222652 ?auto_222653 ) ) ( ON ?auto_222652 ?auto_222653 ) ( ON ?auto_222651 ?auto_222652 ) ( ON ?auto_222650 ?auto_222651 ) ( ON ?auto_222649 ?auto_222650 ) ( ON ?auto_222648 ?auto_222649 ) ( ON ?auto_222647 ?auto_222648 ) ( ON ?auto_222646 ?auto_222647 ) ( ON ?auto_222645 ?auto_222646 ) ( CLEAR ?auto_222643 ) ( ON ?auto_222644 ?auto_222645 ) ( CLEAR ?auto_222644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_222641 ?auto_222642 ?auto_222643 ?auto_222644 )
      ( MAKE-13PILE ?auto_222641 ?auto_222642 ?auto_222643 ?auto_222644 ?auto_222645 ?auto_222646 ?auto_222647 ?auto_222648 ?auto_222649 ?auto_222650 ?auto_222651 ?auto_222652 ?auto_222653 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_222667 - BLOCK
      ?auto_222668 - BLOCK
      ?auto_222669 - BLOCK
      ?auto_222670 - BLOCK
      ?auto_222671 - BLOCK
      ?auto_222672 - BLOCK
      ?auto_222673 - BLOCK
      ?auto_222674 - BLOCK
      ?auto_222675 - BLOCK
      ?auto_222676 - BLOCK
      ?auto_222677 - BLOCK
      ?auto_222678 - BLOCK
      ?auto_222679 - BLOCK
    )
    :vars
    (
      ?auto_222680 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_222679 ?auto_222680 ) ( ON-TABLE ?auto_222667 ) ( ON ?auto_222668 ?auto_222667 ) ( not ( = ?auto_222667 ?auto_222668 ) ) ( not ( = ?auto_222667 ?auto_222669 ) ) ( not ( = ?auto_222667 ?auto_222670 ) ) ( not ( = ?auto_222667 ?auto_222671 ) ) ( not ( = ?auto_222667 ?auto_222672 ) ) ( not ( = ?auto_222667 ?auto_222673 ) ) ( not ( = ?auto_222667 ?auto_222674 ) ) ( not ( = ?auto_222667 ?auto_222675 ) ) ( not ( = ?auto_222667 ?auto_222676 ) ) ( not ( = ?auto_222667 ?auto_222677 ) ) ( not ( = ?auto_222667 ?auto_222678 ) ) ( not ( = ?auto_222667 ?auto_222679 ) ) ( not ( = ?auto_222667 ?auto_222680 ) ) ( not ( = ?auto_222668 ?auto_222669 ) ) ( not ( = ?auto_222668 ?auto_222670 ) ) ( not ( = ?auto_222668 ?auto_222671 ) ) ( not ( = ?auto_222668 ?auto_222672 ) ) ( not ( = ?auto_222668 ?auto_222673 ) ) ( not ( = ?auto_222668 ?auto_222674 ) ) ( not ( = ?auto_222668 ?auto_222675 ) ) ( not ( = ?auto_222668 ?auto_222676 ) ) ( not ( = ?auto_222668 ?auto_222677 ) ) ( not ( = ?auto_222668 ?auto_222678 ) ) ( not ( = ?auto_222668 ?auto_222679 ) ) ( not ( = ?auto_222668 ?auto_222680 ) ) ( not ( = ?auto_222669 ?auto_222670 ) ) ( not ( = ?auto_222669 ?auto_222671 ) ) ( not ( = ?auto_222669 ?auto_222672 ) ) ( not ( = ?auto_222669 ?auto_222673 ) ) ( not ( = ?auto_222669 ?auto_222674 ) ) ( not ( = ?auto_222669 ?auto_222675 ) ) ( not ( = ?auto_222669 ?auto_222676 ) ) ( not ( = ?auto_222669 ?auto_222677 ) ) ( not ( = ?auto_222669 ?auto_222678 ) ) ( not ( = ?auto_222669 ?auto_222679 ) ) ( not ( = ?auto_222669 ?auto_222680 ) ) ( not ( = ?auto_222670 ?auto_222671 ) ) ( not ( = ?auto_222670 ?auto_222672 ) ) ( not ( = ?auto_222670 ?auto_222673 ) ) ( not ( = ?auto_222670 ?auto_222674 ) ) ( not ( = ?auto_222670 ?auto_222675 ) ) ( not ( = ?auto_222670 ?auto_222676 ) ) ( not ( = ?auto_222670 ?auto_222677 ) ) ( not ( = ?auto_222670 ?auto_222678 ) ) ( not ( = ?auto_222670 ?auto_222679 ) ) ( not ( = ?auto_222670 ?auto_222680 ) ) ( not ( = ?auto_222671 ?auto_222672 ) ) ( not ( = ?auto_222671 ?auto_222673 ) ) ( not ( = ?auto_222671 ?auto_222674 ) ) ( not ( = ?auto_222671 ?auto_222675 ) ) ( not ( = ?auto_222671 ?auto_222676 ) ) ( not ( = ?auto_222671 ?auto_222677 ) ) ( not ( = ?auto_222671 ?auto_222678 ) ) ( not ( = ?auto_222671 ?auto_222679 ) ) ( not ( = ?auto_222671 ?auto_222680 ) ) ( not ( = ?auto_222672 ?auto_222673 ) ) ( not ( = ?auto_222672 ?auto_222674 ) ) ( not ( = ?auto_222672 ?auto_222675 ) ) ( not ( = ?auto_222672 ?auto_222676 ) ) ( not ( = ?auto_222672 ?auto_222677 ) ) ( not ( = ?auto_222672 ?auto_222678 ) ) ( not ( = ?auto_222672 ?auto_222679 ) ) ( not ( = ?auto_222672 ?auto_222680 ) ) ( not ( = ?auto_222673 ?auto_222674 ) ) ( not ( = ?auto_222673 ?auto_222675 ) ) ( not ( = ?auto_222673 ?auto_222676 ) ) ( not ( = ?auto_222673 ?auto_222677 ) ) ( not ( = ?auto_222673 ?auto_222678 ) ) ( not ( = ?auto_222673 ?auto_222679 ) ) ( not ( = ?auto_222673 ?auto_222680 ) ) ( not ( = ?auto_222674 ?auto_222675 ) ) ( not ( = ?auto_222674 ?auto_222676 ) ) ( not ( = ?auto_222674 ?auto_222677 ) ) ( not ( = ?auto_222674 ?auto_222678 ) ) ( not ( = ?auto_222674 ?auto_222679 ) ) ( not ( = ?auto_222674 ?auto_222680 ) ) ( not ( = ?auto_222675 ?auto_222676 ) ) ( not ( = ?auto_222675 ?auto_222677 ) ) ( not ( = ?auto_222675 ?auto_222678 ) ) ( not ( = ?auto_222675 ?auto_222679 ) ) ( not ( = ?auto_222675 ?auto_222680 ) ) ( not ( = ?auto_222676 ?auto_222677 ) ) ( not ( = ?auto_222676 ?auto_222678 ) ) ( not ( = ?auto_222676 ?auto_222679 ) ) ( not ( = ?auto_222676 ?auto_222680 ) ) ( not ( = ?auto_222677 ?auto_222678 ) ) ( not ( = ?auto_222677 ?auto_222679 ) ) ( not ( = ?auto_222677 ?auto_222680 ) ) ( not ( = ?auto_222678 ?auto_222679 ) ) ( not ( = ?auto_222678 ?auto_222680 ) ) ( not ( = ?auto_222679 ?auto_222680 ) ) ( ON ?auto_222678 ?auto_222679 ) ( ON ?auto_222677 ?auto_222678 ) ( ON ?auto_222676 ?auto_222677 ) ( ON ?auto_222675 ?auto_222676 ) ( ON ?auto_222674 ?auto_222675 ) ( ON ?auto_222673 ?auto_222674 ) ( ON ?auto_222672 ?auto_222673 ) ( ON ?auto_222671 ?auto_222672 ) ( ON ?auto_222670 ?auto_222671 ) ( CLEAR ?auto_222668 ) ( ON ?auto_222669 ?auto_222670 ) ( CLEAR ?auto_222669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_222667 ?auto_222668 ?auto_222669 )
      ( MAKE-13PILE ?auto_222667 ?auto_222668 ?auto_222669 ?auto_222670 ?auto_222671 ?auto_222672 ?auto_222673 ?auto_222674 ?auto_222675 ?auto_222676 ?auto_222677 ?auto_222678 ?auto_222679 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_222694 - BLOCK
      ?auto_222695 - BLOCK
      ?auto_222696 - BLOCK
      ?auto_222697 - BLOCK
      ?auto_222698 - BLOCK
      ?auto_222699 - BLOCK
      ?auto_222700 - BLOCK
      ?auto_222701 - BLOCK
      ?auto_222702 - BLOCK
      ?auto_222703 - BLOCK
      ?auto_222704 - BLOCK
      ?auto_222705 - BLOCK
      ?auto_222706 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_222706 ) ( ON-TABLE ?auto_222694 ) ( ON ?auto_222695 ?auto_222694 ) ( not ( = ?auto_222694 ?auto_222695 ) ) ( not ( = ?auto_222694 ?auto_222696 ) ) ( not ( = ?auto_222694 ?auto_222697 ) ) ( not ( = ?auto_222694 ?auto_222698 ) ) ( not ( = ?auto_222694 ?auto_222699 ) ) ( not ( = ?auto_222694 ?auto_222700 ) ) ( not ( = ?auto_222694 ?auto_222701 ) ) ( not ( = ?auto_222694 ?auto_222702 ) ) ( not ( = ?auto_222694 ?auto_222703 ) ) ( not ( = ?auto_222694 ?auto_222704 ) ) ( not ( = ?auto_222694 ?auto_222705 ) ) ( not ( = ?auto_222694 ?auto_222706 ) ) ( not ( = ?auto_222695 ?auto_222696 ) ) ( not ( = ?auto_222695 ?auto_222697 ) ) ( not ( = ?auto_222695 ?auto_222698 ) ) ( not ( = ?auto_222695 ?auto_222699 ) ) ( not ( = ?auto_222695 ?auto_222700 ) ) ( not ( = ?auto_222695 ?auto_222701 ) ) ( not ( = ?auto_222695 ?auto_222702 ) ) ( not ( = ?auto_222695 ?auto_222703 ) ) ( not ( = ?auto_222695 ?auto_222704 ) ) ( not ( = ?auto_222695 ?auto_222705 ) ) ( not ( = ?auto_222695 ?auto_222706 ) ) ( not ( = ?auto_222696 ?auto_222697 ) ) ( not ( = ?auto_222696 ?auto_222698 ) ) ( not ( = ?auto_222696 ?auto_222699 ) ) ( not ( = ?auto_222696 ?auto_222700 ) ) ( not ( = ?auto_222696 ?auto_222701 ) ) ( not ( = ?auto_222696 ?auto_222702 ) ) ( not ( = ?auto_222696 ?auto_222703 ) ) ( not ( = ?auto_222696 ?auto_222704 ) ) ( not ( = ?auto_222696 ?auto_222705 ) ) ( not ( = ?auto_222696 ?auto_222706 ) ) ( not ( = ?auto_222697 ?auto_222698 ) ) ( not ( = ?auto_222697 ?auto_222699 ) ) ( not ( = ?auto_222697 ?auto_222700 ) ) ( not ( = ?auto_222697 ?auto_222701 ) ) ( not ( = ?auto_222697 ?auto_222702 ) ) ( not ( = ?auto_222697 ?auto_222703 ) ) ( not ( = ?auto_222697 ?auto_222704 ) ) ( not ( = ?auto_222697 ?auto_222705 ) ) ( not ( = ?auto_222697 ?auto_222706 ) ) ( not ( = ?auto_222698 ?auto_222699 ) ) ( not ( = ?auto_222698 ?auto_222700 ) ) ( not ( = ?auto_222698 ?auto_222701 ) ) ( not ( = ?auto_222698 ?auto_222702 ) ) ( not ( = ?auto_222698 ?auto_222703 ) ) ( not ( = ?auto_222698 ?auto_222704 ) ) ( not ( = ?auto_222698 ?auto_222705 ) ) ( not ( = ?auto_222698 ?auto_222706 ) ) ( not ( = ?auto_222699 ?auto_222700 ) ) ( not ( = ?auto_222699 ?auto_222701 ) ) ( not ( = ?auto_222699 ?auto_222702 ) ) ( not ( = ?auto_222699 ?auto_222703 ) ) ( not ( = ?auto_222699 ?auto_222704 ) ) ( not ( = ?auto_222699 ?auto_222705 ) ) ( not ( = ?auto_222699 ?auto_222706 ) ) ( not ( = ?auto_222700 ?auto_222701 ) ) ( not ( = ?auto_222700 ?auto_222702 ) ) ( not ( = ?auto_222700 ?auto_222703 ) ) ( not ( = ?auto_222700 ?auto_222704 ) ) ( not ( = ?auto_222700 ?auto_222705 ) ) ( not ( = ?auto_222700 ?auto_222706 ) ) ( not ( = ?auto_222701 ?auto_222702 ) ) ( not ( = ?auto_222701 ?auto_222703 ) ) ( not ( = ?auto_222701 ?auto_222704 ) ) ( not ( = ?auto_222701 ?auto_222705 ) ) ( not ( = ?auto_222701 ?auto_222706 ) ) ( not ( = ?auto_222702 ?auto_222703 ) ) ( not ( = ?auto_222702 ?auto_222704 ) ) ( not ( = ?auto_222702 ?auto_222705 ) ) ( not ( = ?auto_222702 ?auto_222706 ) ) ( not ( = ?auto_222703 ?auto_222704 ) ) ( not ( = ?auto_222703 ?auto_222705 ) ) ( not ( = ?auto_222703 ?auto_222706 ) ) ( not ( = ?auto_222704 ?auto_222705 ) ) ( not ( = ?auto_222704 ?auto_222706 ) ) ( not ( = ?auto_222705 ?auto_222706 ) ) ( ON ?auto_222705 ?auto_222706 ) ( ON ?auto_222704 ?auto_222705 ) ( ON ?auto_222703 ?auto_222704 ) ( ON ?auto_222702 ?auto_222703 ) ( ON ?auto_222701 ?auto_222702 ) ( ON ?auto_222700 ?auto_222701 ) ( ON ?auto_222699 ?auto_222700 ) ( ON ?auto_222698 ?auto_222699 ) ( ON ?auto_222697 ?auto_222698 ) ( CLEAR ?auto_222695 ) ( ON ?auto_222696 ?auto_222697 ) ( CLEAR ?auto_222696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_222694 ?auto_222695 ?auto_222696 )
      ( MAKE-13PILE ?auto_222694 ?auto_222695 ?auto_222696 ?auto_222697 ?auto_222698 ?auto_222699 ?auto_222700 ?auto_222701 ?auto_222702 ?auto_222703 ?auto_222704 ?auto_222705 ?auto_222706 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_222720 - BLOCK
      ?auto_222721 - BLOCK
      ?auto_222722 - BLOCK
      ?auto_222723 - BLOCK
      ?auto_222724 - BLOCK
      ?auto_222725 - BLOCK
      ?auto_222726 - BLOCK
      ?auto_222727 - BLOCK
      ?auto_222728 - BLOCK
      ?auto_222729 - BLOCK
      ?auto_222730 - BLOCK
      ?auto_222731 - BLOCK
      ?auto_222732 - BLOCK
    )
    :vars
    (
      ?auto_222733 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_222732 ?auto_222733 ) ( ON-TABLE ?auto_222720 ) ( not ( = ?auto_222720 ?auto_222721 ) ) ( not ( = ?auto_222720 ?auto_222722 ) ) ( not ( = ?auto_222720 ?auto_222723 ) ) ( not ( = ?auto_222720 ?auto_222724 ) ) ( not ( = ?auto_222720 ?auto_222725 ) ) ( not ( = ?auto_222720 ?auto_222726 ) ) ( not ( = ?auto_222720 ?auto_222727 ) ) ( not ( = ?auto_222720 ?auto_222728 ) ) ( not ( = ?auto_222720 ?auto_222729 ) ) ( not ( = ?auto_222720 ?auto_222730 ) ) ( not ( = ?auto_222720 ?auto_222731 ) ) ( not ( = ?auto_222720 ?auto_222732 ) ) ( not ( = ?auto_222720 ?auto_222733 ) ) ( not ( = ?auto_222721 ?auto_222722 ) ) ( not ( = ?auto_222721 ?auto_222723 ) ) ( not ( = ?auto_222721 ?auto_222724 ) ) ( not ( = ?auto_222721 ?auto_222725 ) ) ( not ( = ?auto_222721 ?auto_222726 ) ) ( not ( = ?auto_222721 ?auto_222727 ) ) ( not ( = ?auto_222721 ?auto_222728 ) ) ( not ( = ?auto_222721 ?auto_222729 ) ) ( not ( = ?auto_222721 ?auto_222730 ) ) ( not ( = ?auto_222721 ?auto_222731 ) ) ( not ( = ?auto_222721 ?auto_222732 ) ) ( not ( = ?auto_222721 ?auto_222733 ) ) ( not ( = ?auto_222722 ?auto_222723 ) ) ( not ( = ?auto_222722 ?auto_222724 ) ) ( not ( = ?auto_222722 ?auto_222725 ) ) ( not ( = ?auto_222722 ?auto_222726 ) ) ( not ( = ?auto_222722 ?auto_222727 ) ) ( not ( = ?auto_222722 ?auto_222728 ) ) ( not ( = ?auto_222722 ?auto_222729 ) ) ( not ( = ?auto_222722 ?auto_222730 ) ) ( not ( = ?auto_222722 ?auto_222731 ) ) ( not ( = ?auto_222722 ?auto_222732 ) ) ( not ( = ?auto_222722 ?auto_222733 ) ) ( not ( = ?auto_222723 ?auto_222724 ) ) ( not ( = ?auto_222723 ?auto_222725 ) ) ( not ( = ?auto_222723 ?auto_222726 ) ) ( not ( = ?auto_222723 ?auto_222727 ) ) ( not ( = ?auto_222723 ?auto_222728 ) ) ( not ( = ?auto_222723 ?auto_222729 ) ) ( not ( = ?auto_222723 ?auto_222730 ) ) ( not ( = ?auto_222723 ?auto_222731 ) ) ( not ( = ?auto_222723 ?auto_222732 ) ) ( not ( = ?auto_222723 ?auto_222733 ) ) ( not ( = ?auto_222724 ?auto_222725 ) ) ( not ( = ?auto_222724 ?auto_222726 ) ) ( not ( = ?auto_222724 ?auto_222727 ) ) ( not ( = ?auto_222724 ?auto_222728 ) ) ( not ( = ?auto_222724 ?auto_222729 ) ) ( not ( = ?auto_222724 ?auto_222730 ) ) ( not ( = ?auto_222724 ?auto_222731 ) ) ( not ( = ?auto_222724 ?auto_222732 ) ) ( not ( = ?auto_222724 ?auto_222733 ) ) ( not ( = ?auto_222725 ?auto_222726 ) ) ( not ( = ?auto_222725 ?auto_222727 ) ) ( not ( = ?auto_222725 ?auto_222728 ) ) ( not ( = ?auto_222725 ?auto_222729 ) ) ( not ( = ?auto_222725 ?auto_222730 ) ) ( not ( = ?auto_222725 ?auto_222731 ) ) ( not ( = ?auto_222725 ?auto_222732 ) ) ( not ( = ?auto_222725 ?auto_222733 ) ) ( not ( = ?auto_222726 ?auto_222727 ) ) ( not ( = ?auto_222726 ?auto_222728 ) ) ( not ( = ?auto_222726 ?auto_222729 ) ) ( not ( = ?auto_222726 ?auto_222730 ) ) ( not ( = ?auto_222726 ?auto_222731 ) ) ( not ( = ?auto_222726 ?auto_222732 ) ) ( not ( = ?auto_222726 ?auto_222733 ) ) ( not ( = ?auto_222727 ?auto_222728 ) ) ( not ( = ?auto_222727 ?auto_222729 ) ) ( not ( = ?auto_222727 ?auto_222730 ) ) ( not ( = ?auto_222727 ?auto_222731 ) ) ( not ( = ?auto_222727 ?auto_222732 ) ) ( not ( = ?auto_222727 ?auto_222733 ) ) ( not ( = ?auto_222728 ?auto_222729 ) ) ( not ( = ?auto_222728 ?auto_222730 ) ) ( not ( = ?auto_222728 ?auto_222731 ) ) ( not ( = ?auto_222728 ?auto_222732 ) ) ( not ( = ?auto_222728 ?auto_222733 ) ) ( not ( = ?auto_222729 ?auto_222730 ) ) ( not ( = ?auto_222729 ?auto_222731 ) ) ( not ( = ?auto_222729 ?auto_222732 ) ) ( not ( = ?auto_222729 ?auto_222733 ) ) ( not ( = ?auto_222730 ?auto_222731 ) ) ( not ( = ?auto_222730 ?auto_222732 ) ) ( not ( = ?auto_222730 ?auto_222733 ) ) ( not ( = ?auto_222731 ?auto_222732 ) ) ( not ( = ?auto_222731 ?auto_222733 ) ) ( not ( = ?auto_222732 ?auto_222733 ) ) ( ON ?auto_222731 ?auto_222732 ) ( ON ?auto_222730 ?auto_222731 ) ( ON ?auto_222729 ?auto_222730 ) ( ON ?auto_222728 ?auto_222729 ) ( ON ?auto_222727 ?auto_222728 ) ( ON ?auto_222726 ?auto_222727 ) ( ON ?auto_222725 ?auto_222726 ) ( ON ?auto_222724 ?auto_222725 ) ( ON ?auto_222723 ?auto_222724 ) ( ON ?auto_222722 ?auto_222723 ) ( CLEAR ?auto_222720 ) ( ON ?auto_222721 ?auto_222722 ) ( CLEAR ?auto_222721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_222720 ?auto_222721 )
      ( MAKE-13PILE ?auto_222720 ?auto_222721 ?auto_222722 ?auto_222723 ?auto_222724 ?auto_222725 ?auto_222726 ?auto_222727 ?auto_222728 ?auto_222729 ?auto_222730 ?auto_222731 ?auto_222732 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_222747 - BLOCK
      ?auto_222748 - BLOCK
      ?auto_222749 - BLOCK
      ?auto_222750 - BLOCK
      ?auto_222751 - BLOCK
      ?auto_222752 - BLOCK
      ?auto_222753 - BLOCK
      ?auto_222754 - BLOCK
      ?auto_222755 - BLOCK
      ?auto_222756 - BLOCK
      ?auto_222757 - BLOCK
      ?auto_222758 - BLOCK
      ?auto_222759 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_222759 ) ( ON-TABLE ?auto_222747 ) ( not ( = ?auto_222747 ?auto_222748 ) ) ( not ( = ?auto_222747 ?auto_222749 ) ) ( not ( = ?auto_222747 ?auto_222750 ) ) ( not ( = ?auto_222747 ?auto_222751 ) ) ( not ( = ?auto_222747 ?auto_222752 ) ) ( not ( = ?auto_222747 ?auto_222753 ) ) ( not ( = ?auto_222747 ?auto_222754 ) ) ( not ( = ?auto_222747 ?auto_222755 ) ) ( not ( = ?auto_222747 ?auto_222756 ) ) ( not ( = ?auto_222747 ?auto_222757 ) ) ( not ( = ?auto_222747 ?auto_222758 ) ) ( not ( = ?auto_222747 ?auto_222759 ) ) ( not ( = ?auto_222748 ?auto_222749 ) ) ( not ( = ?auto_222748 ?auto_222750 ) ) ( not ( = ?auto_222748 ?auto_222751 ) ) ( not ( = ?auto_222748 ?auto_222752 ) ) ( not ( = ?auto_222748 ?auto_222753 ) ) ( not ( = ?auto_222748 ?auto_222754 ) ) ( not ( = ?auto_222748 ?auto_222755 ) ) ( not ( = ?auto_222748 ?auto_222756 ) ) ( not ( = ?auto_222748 ?auto_222757 ) ) ( not ( = ?auto_222748 ?auto_222758 ) ) ( not ( = ?auto_222748 ?auto_222759 ) ) ( not ( = ?auto_222749 ?auto_222750 ) ) ( not ( = ?auto_222749 ?auto_222751 ) ) ( not ( = ?auto_222749 ?auto_222752 ) ) ( not ( = ?auto_222749 ?auto_222753 ) ) ( not ( = ?auto_222749 ?auto_222754 ) ) ( not ( = ?auto_222749 ?auto_222755 ) ) ( not ( = ?auto_222749 ?auto_222756 ) ) ( not ( = ?auto_222749 ?auto_222757 ) ) ( not ( = ?auto_222749 ?auto_222758 ) ) ( not ( = ?auto_222749 ?auto_222759 ) ) ( not ( = ?auto_222750 ?auto_222751 ) ) ( not ( = ?auto_222750 ?auto_222752 ) ) ( not ( = ?auto_222750 ?auto_222753 ) ) ( not ( = ?auto_222750 ?auto_222754 ) ) ( not ( = ?auto_222750 ?auto_222755 ) ) ( not ( = ?auto_222750 ?auto_222756 ) ) ( not ( = ?auto_222750 ?auto_222757 ) ) ( not ( = ?auto_222750 ?auto_222758 ) ) ( not ( = ?auto_222750 ?auto_222759 ) ) ( not ( = ?auto_222751 ?auto_222752 ) ) ( not ( = ?auto_222751 ?auto_222753 ) ) ( not ( = ?auto_222751 ?auto_222754 ) ) ( not ( = ?auto_222751 ?auto_222755 ) ) ( not ( = ?auto_222751 ?auto_222756 ) ) ( not ( = ?auto_222751 ?auto_222757 ) ) ( not ( = ?auto_222751 ?auto_222758 ) ) ( not ( = ?auto_222751 ?auto_222759 ) ) ( not ( = ?auto_222752 ?auto_222753 ) ) ( not ( = ?auto_222752 ?auto_222754 ) ) ( not ( = ?auto_222752 ?auto_222755 ) ) ( not ( = ?auto_222752 ?auto_222756 ) ) ( not ( = ?auto_222752 ?auto_222757 ) ) ( not ( = ?auto_222752 ?auto_222758 ) ) ( not ( = ?auto_222752 ?auto_222759 ) ) ( not ( = ?auto_222753 ?auto_222754 ) ) ( not ( = ?auto_222753 ?auto_222755 ) ) ( not ( = ?auto_222753 ?auto_222756 ) ) ( not ( = ?auto_222753 ?auto_222757 ) ) ( not ( = ?auto_222753 ?auto_222758 ) ) ( not ( = ?auto_222753 ?auto_222759 ) ) ( not ( = ?auto_222754 ?auto_222755 ) ) ( not ( = ?auto_222754 ?auto_222756 ) ) ( not ( = ?auto_222754 ?auto_222757 ) ) ( not ( = ?auto_222754 ?auto_222758 ) ) ( not ( = ?auto_222754 ?auto_222759 ) ) ( not ( = ?auto_222755 ?auto_222756 ) ) ( not ( = ?auto_222755 ?auto_222757 ) ) ( not ( = ?auto_222755 ?auto_222758 ) ) ( not ( = ?auto_222755 ?auto_222759 ) ) ( not ( = ?auto_222756 ?auto_222757 ) ) ( not ( = ?auto_222756 ?auto_222758 ) ) ( not ( = ?auto_222756 ?auto_222759 ) ) ( not ( = ?auto_222757 ?auto_222758 ) ) ( not ( = ?auto_222757 ?auto_222759 ) ) ( not ( = ?auto_222758 ?auto_222759 ) ) ( ON ?auto_222758 ?auto_222759 ) ( ON ?auto_222757 ?auto_222758 ) ( ON ?auto_222756 ?auto_222757 ) ( ON ?auto_222755 ?auto_222756 ) ( ON ?auto_222754 ?auto_222755 ) ( ON ?auto_222753 ?auto_222754 ) ( ON ?auto_222752 ?auto_222753 ) ( ON ?auto_222751 ?auto_222752 ) ( ON ?auto_222750 ?auto_222751 ) ( ON ?auto_222749 ?auto_222750 ) ( CLEAR ?auto_222747 ) ( ON ?auto_222748 ?auto_222749 ) ( CLEAR ?auto_222748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_222747 ?auto_222748 )
      ( MAKE-13PILE ?auto_222747 ?auto_222748 ?auto_222749 ?auto_222750 ?auto_222751 ?auto_222752 ?auto_222753 ?auto_222754 ?auto_222755 ?auto_222756 ?auto_222757 ?auto_222758 ?auto_222759 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_222773 - BLOCK
      ?auto_222774 - BLOCK
      ?auto_222775 - BLOCK
      ?auto_222776 - BLOCK
      ?auto_222777 - BLOCK
      ?auto_222778 - BLOCK
      ?auto_222779 - BLOCK
      ?auto_222780 - BLOCK
      ?auto_222781 - BLOCK
      ?auto_222782 - BLOCK
      ?auto_222783 - BLOCK
      ?auto_222784 - BLOCK
      ?auto_222785 - BLOCK
    )
    :vars
    (
      ?auto_222786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_222785 ?auto_222786 ) ( not ( = ?auto_222773 ?auto_222774 ) ) ( not ( = ?auto_222773 ?auto_222775 ) ) ( not ( = ?auto_222773 ?auto_222776 ) ) ( not ( = ?auto_222773 ?auto_222777 ) ) ( not ( = ?auto_222773 ?auto_222778 ) ) ( not ( = ?auto_222773 ?auto_222779 ) ) ( not ( = ?auto_222773 ?auto_222780 ) ) ( not ( = ?auto_222773 ?auto_222781 ) ) ( not ( = ?auto_222773 ?auto_222782 ) ) ( not ( = ?auto_222773 ?auto_222783 ) ) ( not ( = ?auto_222773 ?auto_222784 ) ) ( not ( = ?auto_222773 ?auto_222785 ) ) ( not ( = ?auto_222773 ?auto_222786 ) ) ( not ( = ?auto_222774 ?auto_222775 ) ) ( not ( = ?auto_222774 ?auto_222776 ) ) ( not ( = ?auto_222774 ?auto_222777 ) ) ( not ( = ?auto_222774 ?auto_222778 ) ) ( not ( = ?auto_222774 ?auto_222779 ) ) ( not ( = ?auto_222774 ?auto_222780 ) ) ( not ( = ?auto_222774 ?auto_222781 ) ) ( not ( = ?auto_222774 ?auto_222782 ) ) ( not ( = ?auto_222774 ?auto_222783 ) ) ( not ( = ?auto_222774 ?auto_222784 ) ) ( not ( = ?auto_222774 ?auto_222785 ) ) ( not ( = ?auto_222774 ?auto_222786 ) ) ( not ( = ?auto_222775 ?auto_222776 ) ) ( not ( = ?auto_222775 ?auto_222777 ) ) ( not ( = ?auto_222775 ?auto_222778 ) ) ( not ( = ?auto_222775 ?auto_222779 ) ) ( not ( = ?auto_222775 ?auto_222780 ) ) ( not ( = ?auto_222775 ?auto_222781 ) ) ( not ( = ?auto_222775 ?auto_222782 ) ) ( not ( = ?auto_222775 ?auto_222783 ) ) ( not ( = ?auto_222775 ?auto_222784 ) ) ( not ( = ?auto_222775 ?auto_222785 ) ) ( not ( = ?auto_222775 ?auto_222786 ) ) ( not ( = ?auto_222776 ?auto_222777 ) ) ( not ( = ?auto_222776 ?auto_222778 ) ) ( not ( = ?auto_222776 ?auto_222779 ) ) ( not ( = ?auto_222776 ?auto_222780 ) ) ( not ( = ?auto_222776 ?auto_222781 ) ) ( not ( = ?auto_222776 ?auto_222782 ) ) ( not ( = ?auto_222776 ?auto_222783 ) ) ( not ( = ?auto_222776 ?auto_222784 ) ) ( not ( = ?auto_222776 ?auto_222785 ) ) ( not ( = ?auto_222776 ?auto_222786 ) ) ( not ( = ?auto_222777 ?auto_222778 ) ) ( not ( = ?auto_222777 ?auto_222779 ) ) ( not ( = ?auto_222777 ?auto_222780 ) ) ( not ( = ?auto_222777 ?auto_222781 ) ) ( not ( = ?auto_222777 ?auto_222782 ) ) ( not ( = ?auto_222777 ?auto_222783 ) ) ( not ( = ?auto_222777 ?auto_222784 ) ) ( not ( = ?auto_222777 ?auto_222785 ) ) ( not ( = ?auto_222777 ?auto_222786 ) ) ( not ( = ?auto_222778 ?auto_222779 ) ) ( not ( = ?auto_222778 ?auto_222780 ) ) ( not ( = ?auto_222778 ?auto_222781 ) ) ( not ( = ?auto_222778 ?auto_222782 ) ) ( not ( = ?auto_222778 ?auto_222783 ) ) ( not ( = ?auto_222778 ?auto_222784 ) ) ( not ( = ?auto_222778 ?auto_222785 ) ) ( not ( = ?auto_222778 ?auto_222786 ) ) ( not ( = ?auto_222779 ?auto_222780 ) ) ( not ( = ?auto_222779 ?auto_222781 ) ) ( not ( = ?auto_222779 ?auto_222782 ) ) ( not ( = ?auto_222779 ?auto_222783 ) ) ( not ( = ?auto_222779 ?auto_222784 ) ) ( not ( = ?auto_222779 ?auto_222785 ) ) ( not ( = ?auto_222779 ?auto_222786 ) ) ( not ( = ?auto_222780 ?auto_222781 ) ) ( not ( = ?auto_222780 ?auto_222782 ) ) ( not ( = ?auto_222780 ?auto_222783 ) ) ( not ( = ?auto_222780 ?auto_222784 ) ) ( not ( = ?auto_222780 ?auto_222785 ) ) ( not ( = ?auto_222780 ?auto_222786 ) ) ( not ( = ?auto_222781 ?auto_222782 ) ) ( not ( = ?auto_222781 ?auto_222783 ) ) ( not ( = ?auto_222781 ?auto_222784 ) ) ( not ( = ?auto_222781 ?auto_222785 ) ) ( not ( = ?auto_222781 ?auto_222786 ) ) ( not ( = ?auto_222782 ?auto_222783 ) ) ( not ( = ?auto_222782 ?auto_222784 ) ) ( not ( = ?auto_222782 ?auto_222785 ) ) ( not ( = ?auto_222782 ?auto_222786 ) ) ( not ( = ?auto_222783 ?auto_222784 ) ) ( not ( = ?auto_222783 ?auto_222785 ) ) ( not ( = ?auto_222783 ?auto_222786 ) ) ( not ( = ?auto_222784 ?auto_222785 ) ) ( not ( = ?auto_222784 ?auto_222786 ) ) ( not ( = ?auto_222785 ?auto_222786 ) ) ( ON ?auto_222784 ?auto_222785 ) ( ON ?auto_222783 ?auto_222784 ) ( ON ?auto_222782 ?auto_222783 ) ( ON ?auto_222781 ?auto_222782 ) ( ON ?auto_222780 ?auto_222781 ) ( ON ?auto_222779 ?auto_222780 ) ( ON ?auto_222778 ?auto_222779 ) ( ON ?auto_222777 ?auto_222778 ) ( ON ?auto_222776 ?auto_222777 ) ( ON ?auto_222775 ?auto_222776 ) ( ON ?auto_222774 ?auto_222775 ) ( ON ?auto_222773 ?auto_222774 ) ( CLEAR ?auto_222773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_222773 )
      ( MAKE-13PILE ?auto_222773 ?auto_222774 ?auto_222775 ?auto_222776 ?auto_222777 ?auto_222778 ?auto_222779 ?auto_222780 ?auto_222781 ?auto_222782 ?auto_222783 ?auto_222784 ?auto_222785 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_222800 - BLOCK
      ?auto_222801 - BLOCK
      ?auto_222802 - BLOCK
      ?auto_222803 - BLOCK
      ?auto_222804 - BLOCK
      ?auto_222805 - BLOCK
      ?auto_222806 - BLOCK
      ?auto_222807 - BLOCK
      ?auto_222808 - BLOCK
      ?auto_222809 - BLOCK
      ?auto_222810 - BLOCK
      ?auto_222811 - BLOCK
      ?auto_222812 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_222812 ) ( not ( = ?auto_222800 ?auto_222801 ) ) ( not ( = ?auto_222800 ?auto_222802 ) ) ( not ( = ?auto_222800 ?auto_222803 ) ) ( not ( = ?auto_222800 ?auto_222804 ) ) ( not ( = ?auto_222800 ?auto_222805 ) ) ( not ( = ?auto_222800 ?auto_222806 ) ) ( not ( = ?auto_222800 ?auto_222807 ) ) ( not ( = ?auto_222800 ?auto_222808 ) ) ( not ( = ?auto_222800 ?auto_222809 ) ) ( not ( = ?auto_222800 ?auto_222810 ) ) ( not ( = ?auto_222800 ?auto_222811 ) ) ( not ( = ?auto_222800 ?auto_222812 ) ) ( not ( = ?auto_222801 ?auto_222802 ) ) ( not ( = ?auto_222801 ?auto_222803 ) ) ( not ( = ?auto_222801 ?auto_222804 ) ) ( not ( = ?auto_222801 ?auto_222805 ) ) ( not ( = ?auto_222801 ?auto_222806 ) ) ( not ( = ?auto_222801 ?auto_222807 ) ) ( not ( = ?auto_222801 ?auto_222808 ) ) ( not ( = ?auto_222801 ?auto_222809 ) ) ( not ( = ?auto_222801 ?auto_222810 ) ) ( not ( = ?auto_222801 ?auto_222811 ) ) ( not ( = ?auto_222801 ?auto_222812 ) ) ( not ( = ?auto_222802 ?auto_222803 ) ) ( not ( = ?auto_222802 ?auto_222804 ) ) ( not ( = ?auto_222802 ?auto_222805 ) ) ( not ( = ?auto_222802 ?auto_222806 ) ) ( not ( = ?auto_222802 ?auto_222807 ) ) ( not ( = ?auto_222802 ?auto_222808 ) ) ( not ( = ?auto_222802 ?auto_222809 ) ) ( not ( = ?auto_222802 ?auto_222810 ) ) ( not ( = ?auto_222802 ?auto_222811 ) ) ( not ( = ?auto_222802 ?auto_222812 ) ) ( not ( = ?auto_222803 ?auto_222804 ) ) ( not ( = ?auto_222803 ?auto_222805 ) ) ( not ( = ?auto_222803 ?auto_222806 ) ) ( not ( = ?auto_222803 ?auto_222807 ) ) ( not ( = ?auto_222803 ?auto_222808 ) ) ( not ( = ?auto_222803 ?auto_222809 ) ) ( not ( = ?auto_222803 ?auto_222810 ) ) ( not ( = ?auto_222803 ?auto_222811 ) ) ( not ( = ?auto_222803 ?auto_222812 ) ) ( not ( = ?auto_222804 ?auto_222805 ) ) ( not ( = ?auto_222804 ?auto_222806 ) ) ( not ( = ?auto_222804 ?auto_222807 ) ) ( not ( = ?auto_222804 ?auto_222808 ) ) ( not ( = ?auto_222804 ?auto_222809 ) ) ( not ( = ?auto_222804 ?auto_222810 ) ) ( not ( = ?auto_222804 ?auto_222811 ) ) ( not ( = ?auto_222804 ?auto_222812 ) ) ( not ( = ?auto_222805 ?auto_222806 ) ) ( not ( = ?auto_222805 ?auto_222807 ) ) ( not ( = ?auto_222805 ?auto_222808 ) ) ( not ( = ?auto_222805 ?auto_222809 ) ) ( not ( = ?auto_222805 ?auto_222810 ) ) ( not ( = ?auto_222805 ?auto_222811 ) ) ( not ( = ?auto_222805 ?auto_222812 ) ) ( not ( = ?auto_222806 ?auto_222807 ) ) ( not ( = ?auto_222806 ?auto_222808 ) ) ( not ( = ?auto_222806 ?auto_222809 ) ) ( not ( = ?auto_222806 ?auto_222810 ) ) ( not ( = ?auto_222806 ?auto_222811 ) ) ( not ( = ?auto_222806 ?auto_222812 ) ) ( not ( = ?auto_222807 ?auto_222808 ) ) ( not ( = ?auto_222807 ?auto_222809 ) ) ( not ( = ?auto_222807 ?auto_222810 ) ) ( not ( = ?auto_222807 ?auto_222811 ) ) ( not ( = ?auto_222807 ?auto_222812 ) ) ( not ( = ?auto_222808 ?auto_222809 ) ) ( not ( = ?auto_222808 ?auto_222810 ) ) ( not ( = ?auto_222808 ?auto_222811 ) ) ( not ( = ?auto_222808 ?auto_222812 ) ) ( not ( = ?auto_222809 ?auto_222810 ) ) ( not ( = ?auto_222809 ?auto_222811 ) ) ( not ( = ?auto_222809 ?auto_222812 ) ) ( not ( = ?auto_222810 ?auto_222811 ) ) ( not ( = ?auto_222810 ?auto_222812 ) ) ( not ( = ?auto_222811 ?auto_222812 ) ) ( ON ?auto_222811 ?auto_222812 ) ( ON ?auto_222810 ?auto_222811 ) ( ON ?auto_222809 ?auto_222810 ) ( ON ?auto_222808 ?auto_222809 ) ( ON ?auto_222807 ?auto_222808 ) ( ON ?auto_222806 ?auto_222807 ) ( ON ?auto_222805 ?auto_222806 ) ( ON ?auto_222804 ?auto_222805 ) ( ON ?auto_222803 ?auto_222804 ) ( ON ?auto_222802 ?auto_222803 ) ( ON ?auto_222801 ?auto_222802 ) ( ON ?auto_222800 ?auto_222801 ) ( CLEAR ?auto_222800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_222800 )
      ( MAKE-13PILE ?auto_222800 ?auto_222801 ?auto_222802 ?auto_222803 ?auto_222804 ?auto_222805 ?auto_222806 ?auto_222807 ?auto_222808 ?auto_222809 ?auto_222810 ?auto_222811 ?auto_222812 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_222826 - BLOCK
      ?auto_222827 - BLOCK
      ?auto_222828 - BLOCK
      ?auto_222829 - BLOCK
      ?auto_222830 - BLOCK
      ?auto_222831 - BLOCK
      ?auto_222832 - BLOCK
      ?auto_222833 - BLOCK
      ?auto_222834 - BLOCK
      ?auto_222835 - BLOCK
      ?auto_222836 - BLOCK
      ?auto_222837 - BLOCK
      ?auto_222838 - BLOCK
    )
    :vars
    (
      ?auto_222839 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_222826 ?auto_222827 ) ) ( not ( = ?auto_222826 ?auto_222828 ) ) ( not ( = ?auto_222826 ?auto_222829 ) ) ( not ( = ?auto_222826 ?auto_222830 ) ) ( not ( = ?auto_222826 ?auto_222831 ) ) ( not ( = ?auto_222826 ?auto_222832 ) ) ( not ( = ?auto_222826 ?auto_222833 ) ) ( not ( = ?auto_222826 ?auto_222834 ) ) ( not ( = ?auto_222826 ?auto_222835 ) ) ( not ( = ?auto_222826 ?auto_222836 ) ) ( not ( = ?auto_222826 ?auto_222837 ) ) ( not ( = ?auto_222826 ?auto_222838 ) ) ( not ( = ?auto_222827 ?auto_222828 ) ) ( not ( = ?auto_222827 ?auto_222829 ) ) ( not ( = ?auto_222827 ?auto_222830 ) ) ( not ( = ?auto_222827 ?auto_222831 ) ) ( not ( = ?auto_222827 ?auto_222832 ) ) ( not ( = ?auto_222827 ?auto_222833 ) ) ( not ( = ?auto_222827 ?auto_222834 ) ) ( not ( = ?auto_222827 ?auto_222835 ) ) ( not ( = ?auto_222827 ?auto_222836 ) ) ( not ( = ?auto_222827 ?auto_222837 ) ) ( not ( = ?auto_222827 ?auto_222838 ) ) ( not ( = ?auto_222828 ?auto_222829 ) ) ( not ( = ?auto_222828 ?auto_222830 ) ) ( not ( = ?auto_222828 ?auto_222831 ) ) ( not ( = ?auto_222828 ?auto_222832 ) ) ( not ( = ?auto_222828 ?auto_222833 ) ) ( not ( = ?auto_222828 ?auto_222834 ) ) ( not ( = ?auto_222828 ?auto_222835 ) ) ( not ( = ?auto_222828 ?auto_222836 ) ) ( not ( = ?auto_222828 ?auto_222837 ) ) ( not ( = ?auto_222828 ?auto_222838 ) ) ( not ( = ?auto_222829 ?auto_222830 ) ) ( not ( = ?auto_222829 ?auto_222831 ) ) ( not ( = ?auto_222829 ?auto_222832 ) ) ( not ( = ?auto_222829 ?auto_222833 ) ) ( not ( = ?auto_222829 ?auto_222834 ) ) ( not ( = ?auto_222829 ?auto_222835 ) ) ( not ( = ?auto_222829 ?auto_222836 ) ) ( not ( = ?auto_222829 ?auto_222837 ) ) ( not ( = ?auto_222829 ?auto_222838 ) ) ( not ( = ?auto_222830 ?auto_222831 ) ) ( not ( = ?auto_222830 ?auto_222832 ) ) ( not ( = ?auto_222830 ?auto_222833 ) ) ( not ( = ?auto_222830 ?auto_222834 ) ) ( not ( = ?auto_222830 ?auto_222835 ) ) ( not ( = ?auto_222830 ?auto_222836 ) ) ( not ( = ?auto_222830 ?auto_222837 ) ) ( not ( = ?auto_222830 ?auto_222838 ) ) ( not ( = ?auto_222831 ?auto_222832 ) ) ( not ( = ?auto_222831 ?auto_222833 ) ) ( not ( = ?auto_222831 ?auto_222834 ) ) ( not ( = ?auto_222831 ?auto_222835 ) ) ( not ( = ?auto_222831 ?auto_222836 ) ) ( not ( = ?auto_222831 ?auto_222837 ) ) ( not ( = ?auto_222831 ?auto_222838 ) ) ( not ( = ?auto_222832 ?auto_222833 ) ) ( not ( = ?auto_222832 ?auto_222834 ) ) ( not ( = ?auto_222832 ?auto_222835 ) ) ( not ( = ?auto_222832 ?auto_222836 ) ) ( not ( = ?auto_222832 ?auto_222837 ) ) ( not ( = ?auto_222832 ?auto_222838 ) ) ( not ( = ?auto_222833 ?auto_222834 ) ) ( not ( = ?auto_222833 ?auto_222835 ) ) ( not ( = ?auto_222833 ?auto_222836 ) ) ( not ( = ?auto_222833 ?auto_222837 ) ) ( not ( = ?auto_222833 ?auto_222838 ) ) ( not ( = ?auto_222834 ?auto_222835 ) ) ( not ( = ?auto_222834 ?auto_222836 ) ) ( not ( = ?auto_222834 ?auto_222837 ) ) ( not ( = ?auto_222834 ?auto_222838 ) ) ( not ( = ?auto_222835 ?auto_222836 ) ) ( not ( = ?auto_222835 ?auto_222837 ) ) ( not ( = ?auto_222835 ?auto_222838 ) ) ( not ( = ?auto_222836 ?auto_222837 ) ) ( not ( = ?auto_222836 ?auto_222838 ) ) ( not ( = ?auto_222837 ?auto_222838 ) ) ( ON ?auto_222826 ?auto_222839 ) ( not ( = ?auto_222838 ?auto_222839 ) ) ( not ( = ?auto_222837 ?auto_222839 ) ) ( not ( = ?auto_222836 ?auto_222839 ) ) ( not ( = ?auto_222835 ?auto_222839 ) ) ( not ( = ?auto_222834 ?auto_222839 ) ) ( not ( = ?auto_222833 ?auto_222839 ) ) ( not ( = ?auto_222832 ?auto_222839 ) ) ( not ( = ?auto_222831 ?auto_222839 ) ) ( not ( = ?auto_222830 ?auto_222839 ) ) ( not ( = ?auto_222829 ?auto_222839 ) ) ( not ( = ?auto_222828 ?auto_222839 ) ) ( not ( = ?auto_222827 ?auto_222839 ) ) ( not ( = ?auto_222826 ?auto_222839 ) ) ( ON ?auto_222827 ?auto_222826 ) ( ON ?auto_222828 ?auto_222827 ) ( ON ?auto_222829 ?auto_222828 ) ( ON ?auto_222830 ?auto_222829 ) ( ON ?auto_222831 ?auto_222830 ) ( ON ?auto_222832 ?auto_222831 ) ( ON ?auto_222833 ?auto_222832 ) ( ON ?auto_222834 ?auto_222833 ) ( ON ?auto_222835 ?auto_222834 ) ( ON ?auto_222836 ?auto_222835 ) ( ON ?auto_222837 ?auto_222836 ) ( ON ?auto_222838 ?auto_222837 ) ( CLEAR ?auto_222838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_222838 ?auto_222837 ?auto_222836 ?auto_222835 ?auto_222834 ?auto_222833 ?auto_222832 ?auto_222831 ?auto_222830 ?auto_222829 ?auto_222828 ?auto_222827 ?auto_222826 )
      ( MAKE-13PILE ?auto_222826 ?auto_222827 ?auto_222828 ?auto_222829 ?auto_222830 ?auto_222831 ?auto_222832 ?auto_222833 ?auto_222834 ?auto_222835 ?auto_222836 ?auto_222837 ?auto_222838 ) )
  )

)

