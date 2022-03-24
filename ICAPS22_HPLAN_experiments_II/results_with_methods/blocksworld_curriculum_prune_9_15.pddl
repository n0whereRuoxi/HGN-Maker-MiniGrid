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
      ?auto_67321 - BLOCK
    )
    :vars
    (
      ?auto_67322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67321 ?auto_67322 ) ( CLEAR ?auto_67321 ) ( HAND-EMPTY ) ( not ( = ?auto_67321 ?auto_67322 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_67321 ?auto_67322 )
      ( !PUTDOWN ?auto_67321 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67328 - BLOCK
      ?auto_67329 - BLOCK
    )
    :vars
    (
      ?auto_67330 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_67328 ) ( ON ?auto_67329 ?auto_67330 ) ( CLEAR ?auto_67329 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_67328 ) ( not ( = ?auto_67328 ?auto_67329 ) ) ( not ( = ?auto_67328 ?auto_67330 ) ) ( not ( = ?auto_67329 ?auto_67330 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_67329 ?auto_67330 )
      ( !STACK ?auto_67329 ?auto_67328 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67338 - BLOCK
      ?auto_67339 - BLOCK
    )
    :vars
    (
      ?auto_67340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67339 ?auto_67340 ) ( not ( = ?auto_67338 ?auto_67339 ) ) ( not ( = ?auto_67338 ?auto_67340 ) ) ( not ( = ?auto_67339 ?auto_67340 ) ) ( ON ?auto_67338 ?auto_67339 ) ( CLEAR ?auto_67338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_67338 )
      ( MAKE-2PILE ?auto_67338 ?auto_67339 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67349 - BLOCK
      ?auto_67350 - BLOCK
      ?auto_67351 - BLOCK
    )
    :vars
    (
      ?auto_67352 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_67350 ) ( ON ?auto_67351 ?auto_67352 ) ( CLEAR ?auto_67351 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_67349 ) ( ON ?auto_67350 ?auto_67349 ) ( not ( = ?auto_67349 ?auto_67350 ) ) ( not ( = ?auto_67349 ?auto_67351 ) ) ( not ( = ?auto_67349 ?auto_67352 ) ) ( not ( = ?auto_67350 ?auto_67351 ) ) ( not ( = ?auto_67350 ?auto_67352 ) ) ( not ( = ?auto_67351 ?auto_67352 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_67351 ?auto_67352 )
      ( !STACK ?auto_67351 ?auto_67350 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67363 - BLOCK
      ?auto_67364 - BLOCK
      ?auto_67365 - BLOCK
    )
    :vars
    (
      ?auto_67366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67365 ?auto_67366 ) ( ON-TABLE ?auto_67363 ) ( not ( = ?auto_67363 ?auto_67364 ) ) ( not ( = ?auto_67363 ?auto_67365 ) ) ( not ( = ?auto_67363 ?auto_67366 ) ) ( not ( = ?auto_67364 ?auto_67365 ) ) ( not ( = ?auto_67364 ?auto_67366 ) ) ( not ( = ?auto_67365 ?auto_67366 ) ) ( CLEAR ?auto_67363 ) ( ON ?auto_67364 ?auto_67365 ) ( CLEAR ?auto_67364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67363 ?auto_67364 )
      ( MAKE-3PILE ?auto_67363 ?auto_67364 ?auto_67365 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67377 - BLOCK
      ?auto_67378 - BLOCK
      ?auto_67379 - BLOCK
    )
    :vars
    (
      ?auto_67380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67379 ?auto_67380 ) ( not ( = ?auto_67377 ?auto_67378 ) ) ( not ( = ?auto_67377 ?auto_67379 ) ) ( not ( = ?auto_67377 ?auto_67380 ) ) ( not ( = ?auto_67378 ?auto_67379 ) ) ( not ( = ?auto_67378 ?auto_67380 ) ) ( not ( = ?auto_67379 ?auto_67380 ) ) ( ON ?auto_67378 ?auto_67379 ) ( ON ?auto_67377 ?auto_67378 ) ( CLEAR ?auto_67377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_67377 )
      ( MAKE-3PILE ?auto_67377 ?auto_67378 ?auto_67379 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_67392 - BLOCK
      ?auto_67393 - BLOCK
      ?auto_67394 - BLOCK
      ?auto_67395 - BLOCK
    )
    :vars
    (
      ?auto_67396 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_67394 ) ( ON ?auto_67395 ?auto_67396 ) ( CLEAR ?auto_67395 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_67392 ) ( ON ?auto_67393 ?auto_67392 ) ( ON ?auto_67394 ?auto_67393 ) ( not ( = ?auto_67392 ?auto_67393 ) ) ( not ( = ?auto_67392 ?auto_67394 ) ) ( not ( = ?auto_67392 ?auto_67395 ) ) ( not ( = ?auto_67392 ?auto_67396 ) ) ( not ( = ?auto_67393 ?auto_67394 ) ) ( not ( = ?auto_67393 ?auto_67395 ) ) ( not ( = ?auto_67393 ?auto_67396 ) ) ( not ( = ?auto_67394 ?auto_67395 ) ) ( not ( = ?auto_67394 ?auto_67396 ) ) ( not ( = ?auto_67395 ?auto_67396 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_67395 ?auto_67396 )
      ( !STACK ?auto_67395 ?auto_67394 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_67410 - BLOCK
      ?auto_67411 - BLOCK
      ?auto_67412 - BLOCK
      ?auto_67413 - BLOCK
    )
    :vars
    (
      ?auto_67414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67413 ?auto_67414 ) ( ON-TABLE ?auto_67410 ) ( ON ?auto_67411 ?auto_67410 ) ( not ( = ?auto_67410 ?auto_67411 ) ) ( not ( = ?auto_67410 ?auto_67412 ) ) ( not ( = ?auto_67410 ?auto_67413 ) ) ( not ( = ?auto_67410 ?auto_67414 ) ) ( not ( = ?auto_67411 ?auto_67412 ) ) ( not ( = ?auto_67411 ?auto_67413 ) ) ( not ( = ?auto_67411 ?auto_67414 ) ) ( not ( = ?auto_67412 ?auto_67413 ) ) ( not ( = ?auto_67412 ?auto_67414 ) ) ( not ( = ?auto_67413 ?auto_67414 ) ) ( CLEAR ?auto_67411 ) ( ON ?auto_67412 ?auto_67413 ) ( CLEAR ?auto_67412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_67410 ?auto_67411 ?auto_67412 )
      ( MAKE-4PILE ?auto_67410 ?auto_67411 ?auto_67412 ?auto_67413 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_67428 - BLOCK
      ?auto_67429 - BLOCK
      ?auto_67430 - BLOCK
      ?auto_67431 - BLOCK
    )
    :vars
    (
      ?auto_67432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67431 ?auto_67432 ) ( ON-TABLE ?auto_67428 ) ( not ( = ?auto_67428 ?auto_67429 ) ) ( not ( = ?auto_67428 ?auto_67430 ) ) ( not ( = ?auto_67428 ?auto_67431 ) ) ( not ( = ?auto_67428 ?auto_67432 ) ) ( not ( = ?auto_67429 ?auto_67430 ) ) ( not ( = ?auto_67429 ?auto_67431 ) ) ( not ( = ?auto_67429 ?auto_67432 ) ) ( not ( = ?auto_67430 ?auto_67431 ) ) ( not ( = ?auto_67430 ?auto_67432 ) ) ( not ( = ?auto_67431 ?auto_67432 ) ) ( ON ?auto_67430 ?auto_67431 ) ( CLEAR ?auto_67428 ) ( ON ?auto_67429 ?auto_67430 ) ( CLEAR ?auto_67429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67428 ?auto_67429 )
      ( MAKE-4PILE ?auto_67428 ?auto_67429 ?auto_67430 ?auto_67431 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_67446 - BLOCK
      ?auto_67447 - BLOCK
      ?auto_67448 - BLOCK
      ?auto_67449 - BLOCK
    )
    :vars
    (
      ?auto_67450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67449 ?auto_67450 ) ( not ( = ?auto_67446 ?auto_67447 ) ) ( not ( = ?auto_67446 ?auto_67448 ) ) ( not ( = ?auto_67446 ?auto_67449 ) ) ( not ( = ?auto_67446 ?auto_67450 ) ) ( not ( = ?auto_67447 ?auto_67448 ) ) ( not ( = ?auto_67447 ?auto_67449 ) ) ( not ( = ?auto_67447 ?auto_67450 ) ) ( not ( = ?auto_67448 ?auto_67449 ) ) ( not ( = ?auto_67448 ?auto_67450 ) ) ( not ( = ?auto_67449 ?auto_67450 ) ) ( ON ?auto_67448 ?auto_67449 ) ( ON ?auto_67447 ?auto_67448 ) ( ON ?auto_67446 ?auto_67447 ) ( CLEAR ?auto_67446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_67446 )
      ( MAKE-4PILE ?auto_67446 ?auto_67447 ?auto_67448 ?auto_67449 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_67465 - BLOCK
      ?auto_67466 - BLOCK
      ?auto_67467 - BLOCK
      ?auto_67468 - BLOCK
      ?auto_67469 - BLOCK
    )
    :vars
    (
      ?auto_67470 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_67468 ) ( ON ?auto_67469 ?auto_67470 ) ( CLEAR ?auto_67469 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_67465 ) ( ON ?auto_67466 ?auto_67465 ) ( ON ?auto_67467 ?auto_67466 ) ( ON ?auto_67468 ?auto_67467 ) ( not ( = ?auto_67465 ?auto_67466 ) ) ( not ( = ?auto_67465 ?auto_67467 ) ) ( not ( = ?auto_67465 ?auto_67468 ) ) ( not ( = ?auto_67465 ?auto_67469 ) ) ( not ( = ?auto_67465 ?auto_67470 ) ) ( not ( = ?auto_67466 ?auto_67467 ) ) ( not ( = ?auto_67466 ?auto_67468 ) ) ( not ( = ?auto_67466 ?auto_67469 ) ) ( not ( = ?auto_67466 ?auto_67470 ) ) ( not ( = ?auto_67467 ?auto_67468 ) ) ( not ( = ?auto_67467 ?auto_67469 ) ) ( not ( = ?auto_67467 ?auto_67470 ) ) ( not ( = ?auto_67468 ?auto_67469 ) ) ( not ( = ?auto_67468 ?auto_67470 ) ) ( not ( = ?auto_67469 ?auto_67470 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_67469 ?auto_67470 )
      ( !STACK ?auto_67469 ?auto_67468 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_67487 - BLOCK
      ?auto_67488 - BLOCK
      ?auto_67489 - BLOCK
      ?auto_67490 - BLOCK
      ?auto_67491 - BLOCK
    )
    :vars
    (
      ?auto_67492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67491 ?auto_67492 ) ( ON-TABLE ?auto_67487 ) ( ON ?auto_67488 ?auto_67487 ) ( ON ?auto_67489 ?auto_67488 ) ( not ( = ?auto_67487 ?auto_67488 ) ) ( not ( = ?auto_67487 ?auto_67489 ) ) ( not ( = ?auto_67487 ?auto_67490 ) ) ( not ( = ?auto_67487 ?auto_67491 ) ) ( not ( = ?auto_67487 ?auto_67492 ) ) ( not ( = ?auto_67488 ?auto_67489 ) ) ( not ( = ?auto_67488 ?auto_67490 ) ) ( not ( = ?auto_67488 ?auto_67491 ) ) ( not ( = ?auto_67488 ?auto_67492 ) ) ( not ( = ?auto_67489 ?auto_67490 ) ) ( not ( = ?auto_67489 ?auto_67491 ) ) ( not ( = ?auto_67489 ?auto_67492 ) ) ( not ( = ?auto_67490 ?auto_67491 ) ) ( not ( = ?auto_67490 ?auto_67492 ) ) ( not ( = ?auto_67491 ?auto_67492 ) ) ( CLEAR ?auto_67489 ) ( ON ?auto_67490 ?auto_67491 ) ( CLEAR ?auto_67490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_67487 ?auto_67488 ?auto_67489 ?auto_67490 )
      ( MAKE-5PILE ?auto_67487 ?auto_67488 ?auto_67489 ?auto_67490 ?auto_67491 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_67509 - BLOCK
      ?auto_67510 - BLOCK
      ?auto_67511 - BLOCK
      ?auto_67512 - BLOCK
      ?auto_67513 - BLOCK
    )
    :vars
    (
      ?auto_67514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67513 ?auto_67514 ) ( ON-TABLE ?auto_67509 ) ( ON ?auto_67510 ?auto_67509 ) ( not ( = ?auto_67509 ?auto_67510 ) ) ( not ( = ?auto_67509 ?auto_67511 ) ) ( not ( = ?auto_67509 ?auto_67512 ) ) ( not ( = ?auto_67509 ?auto_67513 ) ) ( not ( = ?auto_67509 ?auto_67514 ) ) ( not ( = ?auto_67510 ?auto_67511 ) ) ( not ( = ?auto_67510 ?auto_67512 ) ) ( not ( = ?auto_67510 ?auto_67513 ) ) ( not ( = ?auto_67510 ?auto_67514 ) ) ( not ( = ?auto_67511 ?auto_67512 ) ) ( not ( = ?auto_67511 ?auto_67513 ) ) ( not ( = ?auto_67511 ?auto_67514 ) ) ( not ( = ?auto_67512 ?auto_67513 ) ) ( not ( = ?auto_67512 ?auto_67514 ) ) ( not ( = ?auto_67513 ?auto_67514 ) ) ( ON ?auto_67512 ?auto_67513 ) ( CLEAR ?auto_67510 ) ( ON ?auto_67511 ?auto_67512 ) ( CLEAR ?auto_67511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_67509 ?auto_67510 ?auto_67511 )
      ( MAKE-5PILE ?auto_67509 ?auto_67510 ?auto_67511 ?auto_67512 ?auto_67513 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_67531 - BLOCK
      ?auto_67532 - BLOCK
      ?auto_67533 - BLOCK
      ?auto_67534 - BLOCK
      ?auto_67535 - BLOCK
    )
    :vars
    (
      ?auto_67536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67535 ?auto_67536 ) ( ON-TABLE ?auto_67531 ) ( not ( = ?auto_67531 ?auto_67532 ) ) ( not ( = ?auto_67531 ?auto_67533 ) ) ( not ( = ?auto_67531 ?auto_67534 ) ) ( not ( = ?auto_67531 ?auto_67535 ) ) ( not ( = ?auto_67531 ?auto_67536 ) ) ( not ( = ?auto_67532 ?auto_67533 ) ) ( not ( = ?auto_67532 ?auto_67534 ) ) ( not ( = ?auto_67532 ?auto_67535 ) ) ( not ( = ?auto_67532 ?auto_67536 ) ) ( not ( = ?auto_67533 ?auto_67534 ) ) ( not ( = ?auto_67533 ?auto_67535 ) ) ( not ( = ?auto_67533 ?auto_67536 ) ) ( not ( = ?auto_67534 ?auto_67535 ) ) ( not ( = ?auto_67534 ?auto_67536 ) ) ( not ( = ?auto_67535 ?auto_67536 ) ) ( ON ?auto_67534 ?auto_67535 ) ( ON ?auto_67533 ?auto_67534 ) ( CLEAR ?auto_67531 ) ( ON ?auto_67532 ?auto_67533 ) ( CLEAR ?auto_67532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67531 ?auto_67532 )
      ( MAKE-5PILE ?auto_67531 ?auto_67532 ?auto_67533 ?auto_67534 ?auto_67535 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_67553 - BLOCK
      ?auto_67554 - BLOCK
      ?auto_67555 - BLOCK
      ?auto_67556 - BLOCK
      ?auto_67557 - BLOCK
    )
    :vars
    (
      ?auto_67558 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67557 ?auto_67558 ) ( not ( = ?auto_67553 ?auto_67554 ) ) ( not ( = ?auto_67553 ?auto_67555 ) ) ( not ( = ?auto_67553 ?auto_67556 ) ) ( not ( = ?auto_67553 ?auto_67557 ) ) ( not ( = ?auto_67553 ?auto_67558 ) ) ( not ( = ?auto_67554 ?auto_67555 ) ) ( not ( = ?auto_67554 ?auto_67556 ) ) ( not ( = ?auto_67554 ?auto_67557 ) ) ( not ( = ?auto_67554 ?auto_67558 ) ) ( not ( = ?auto_67555 ?auto_67556 ) ) ( not ( = ?auto_67555 ?auto_67557 ) ) ( not ( = ?auto_67555 ?auto_67558 ) ) ( not ( = ?auto_67556 ?auto_67557 ) ) ( not ( = ?auto_67556 ?auto_67558 ) ) ( not ( = ?auto_67557 ?auto_67558 ) ) ( ON ?auto_67556 ?auto_67557 ) ( ON ?auto_67555 ?auto_67556 ) ( ON ?auto_67554 ?auto_67555 ) ( ON ?auto_67553 ?auto_67554 ) ( CLEAR ?auto_67553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_67553 )
      ( MAKE-5PILE ?auto_67553 ?auto_67554 ?auto_67555 ?auto_67556 ?auto_67557 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_67576 - BLOCK
      ?auto_67577 - BLOCK
      ?auto_67578 - BLOCK
      ?auto_67579 - BLOCK
      ?auto_67580 - BLOCK
      ?auto_67581 - BLOCK
    )
    :vars
    (
      ?auto_67582 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_67580 ) ( ON ?auto_67581 ?auto_67582 ) ( CLEAR ?auto_67581 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_67576 ) ( ON ?auto_67577 ?auto_67576 ) ( ON ?auto_67578 ?auto_67577 ) ( ON ?auto_67579 ?auto_67578 ) ( ON ?auto_67580 ?auto_67579 ) ( not ( = ?auto_67576 ?auto_67577 ) ) ( not ( = ?auto_67576 ?auto_67578 ) ) ( not ( = ?auto_67576 ?auto_67579 ) ) ( not ( = ?auto_67576 ?auto_67580 ) ) ( not ( = ?auto_67576 ?auto_67581 ) ) ( not ( = ?auto_67576 ?auto_67582 ) ) ( not ( = ?auto_67577 ?auto_67578 ) ) ( not ( = ?auto_67577 ?auto_67579 ) ) ( not ( = ?auto_67577 ?auto_67580 ) ) ( not ( = ?auto_67577 ?auto_67581 ) ) ( not ( = ?auto_67577 ?auto_67582 ) ) ( not ( = ?auto_67578 ?auto_67579 ) ) ( not ( = ?auto_67578 ?auto_67580 ) ) ( not ( = ?auto_67578 ?auto_67581 ) ) ( not ( = ?auto_67578 ?auto_67582 ) ) ( not ( = ?auto_67579 ?auto_67580 ) ) ( not ( = ?auto_67579 ?auto_67581 ) ) ( not ( = ?auto_67579 ?auto_67582 ) ) ( not ( = ?auto_67580 ?auto_67581 ) ) ( not ( = ?auto_67580 ?auto_67582 ) ) ( not ( = ?auto_67581 ?auto_67582 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_67581 ?auto_67582 )
      ( !STACK ?auto_67581 ?auto_67580 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_67602 - BLOCK
      ?auto_67603 - BLOCK
      ?auto_67604 - BLOCK
      ?auto_67605 - BLOCK
      ?auto_67606 - BLOCK
      ?auto_67607 - BLOCK
    )
    :vars
    (
      ?auto_67608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67607 ?auto_67608 ) ( ON-TABLE ?auto_67602 ) ( ON ?auto_67603 ?auto_67602 ) ( ON ?auto_67604 ?auto_67603 ) ( ON ?auto_67605 ?auto_67604 ) ( not ( = ?auto_67602 ?auto_67603 ) ) ( not ( = ?auto_67602 ?auto_67604 ) ) ( not ( = ?auto_67602 ?auto_67605 ) ) ( not ( = ?auto_67602 ?auto_67606 ) ) ( not ( = ?auto_67602 ?auto_67607 ) ) ( not ( = ?auto_67602 ?auto_67608 ) ) ( not ( = ?auto_67603 ?auto_67604 ) ) ( not ( = ?auto_67603 ?auto_67605 ) ) ( not ( = ?auto_67603 ?auto_67606 ) ) ( not ( = ?auto_67603 ?auto_67607 ) ) ( not ( = ?auto_67603 ?auto_67608 ) ) ( not ( = ?auto_67604 ?auto_67605 ) ) ( not ( = ?auto_67604 ?auto_67606 ) ) ( not ( = ?auto_67604 ?auto_67607 ) ) ( not ( = ?auto_67604 ?auto_67608 ) ) ( not ( = ?auto_67605 ?auto_67606 ) ) ( not ( = ?auto_67605 ?auto_67607 ) ) ( not ( = ?auto_67605 ?auto_67608 ) ) ( not ( = ?auto_67606 ?auto_67607 ) ) ( not ( = ?auto_67606 ?auto_67608 ) ) ( not ( = ?auto_67607 ?auto_67608 ) ) ( CLEAR ?auto_67605 ) ( ON ?auto_67606 ?auto_67607 ) ( CLEAR ?auto_67606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67602 ?auto_67603 ?auto_67604 ?auto_67605 ?auto_67606 )
      ( MAKE-6PILE ?auto_67602 ?auto_67603 ?auto_67604 ?auto_67605 ?auto_67606 ?auto_67607 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_67628 - BLOCK
      ?auto_67629 - BLOCK
      ?auto_67630 - BLOCK
      ?auto_67631 - BLOCK
      ?auto_67632 - BLOCK
      ?auto_67633 - BLOCK
    )
    :vars
    (
      ?auto_67634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67633 ?auto_67634 ) ( ON-TABLE ?auto_67628 ) ( ON ?auto_67629 ?auto_67628 ) ( ON ?auto_67630 ?auto_67629 ) ( not ( = ?auto_67628 ?auto_67629 ) ) ( not ( = ?auto_67628 ?auto_67630 ) ) ( not ( = ?auto_67628 ?auto_67631 ) ) ( not ( = ?auto_67628 ?auto_67632 ) ) ( not ( = ?auto_67628 ?auto_67633 ) ) ( not ( = ?auto_67628 ?auto_67634 ) ) ( not ( = ?auto_67629 ?auto_67630 ) ) ( not ( = ?auto_67629 ?auto_67631 ) ) ( not ( = ?auto_67629 ?auto_67632 ) ) ( not ( = ?auto_67629 ?auto_67633 ) ) ( not ( = ?auto_67629 ?auto_67634 ) ) ( not ( = ?auto_67630 ?auto_67631 ) ) ( not ( = ?auto_67630 ?auto_67632 ) ) ( not ( = ?auto_67630 ?auto_67633 ) ) ( not ( = ?auto_67630 ?auto_67634 ) ) ( not ( = ?auto_67631 ?auto_67632 ) ) ( not ( = ?auto_67631 ?auto_67633 ) ) ( not ( = ?auto_67631 ?auto_67634 ) ) ( not ( = ?auto_67632 ?auto_67633 ) ) ( not ( = ?auto_67632 ?auto_67634 ) ) ( not ( = ?auto_67633 ?auto_67634 ) ) ( ON ?auto_67632 ?auto_67633 ) ( CLEAR ?auto_67630 ) ( ON ?auto_67631 ?auto_67632 ) ( CLEAR ?auto_67631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_67628 ?auto_67629 ?auto_67630 ?auto_67631 )
      ( MAKE-6PILE ?auto_67628 ?auto_67629 ?auto_67630 ?auto_67631 ?auto_67632 ?auto_67633 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_67654 - BLOCK
      ?auto_67655 - BLOCK
      ?auto_67656 - BLOCK
      ?auto_67657 - BLOCK
      ?auto_67658 - BLOCK
      ?auto_67659 - BLOCK
    )
    :vars
    (
      ?auto_67660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67659 ?auto_67660 ) ( ON-TABLE ?auto_67654 ) ( ON ?auto_67655 ?auto_67654 ) ( not ( = ?auto_67654 ?auto_67655 ) ) ( not ( = ?auto_67654 ?auto_67656 ) ) ( not ( = ?auto_67654 ?auto_67657 ) ) ( not ( = ?auto_67654 ?auto_67658 ) ) ( not ( = ?auto_67654 ?auto_67659 ) ) ( not ( = ?auto_67654 ?auto_67660 ) ) ( not ( = ?auto_67655 ?auto_67656 ) ) ( not ( = ?auto_67655 ?auto_67657 ) ) ( not ( = ?auto_67655 ?auto_67658 ) ) ( not ( = ?auto_67655 ?auto_67659 ) ) ( not ( = ?auto_67655 ?auto_67660 ) ) ( not ( = ?auto_67656 ?auto_67657 ) ) ( not ( = ?auto_67656 ?auto_67658 ) ) ( not ( = ?auto_67656 ?auto_67659 ) ) ( not ( = ?auto_67656 ?auto_67660 ) ) ( not ( = ?auto_67657 ?auto_67658 ) ) ( not ( = ?auto_67657 ?auto_67659 ) ) ( not ( = ?auto_67657 ?auto_67660 ) ) ( not ( = ?auto_67658 ?auto_67659 ) ) ( not ( = ?auto_67658 ?auto_67660 ) ) ( not ( = ?auto_67659 ?auto_67660 ) ) ( ON ?auto_67658 ?auto_67659 ) ( ON ?auto_67657 ?auto_67658 ) ( CLEAR ?auto_67655 ) ( ON ?auto_67656 ?auto_67657 ) ( CLEAR ?auto_67656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_67654 ?auto_67655 ?auto_67656 )
      ( MAKE-6PILE ?auto_67654 ?auto_67655 ?auto_67656 ?auto_67657 ?auto_67658 ?auto_67659 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_67680 - BLOCK
      ?auto_67681 - BLOCK
      ?auto_67682 - BLOCK
      ?auto_67683 - BLOCK
      ?auto_67684 - BLOCK
      ?auto_67685 - BLOCK
    )
    :vars
    (
      ?auto_67686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67685 ?auto_67686 ) ( ON-TABLE ?auto_67680 ) ( not ( = ?auto_67680 ?auto_67681 ) ) ( not ( = ?auto_67680 ?auto_67682 ) ) ( not ( = ?auto_67680 ?auto_67683 ) ) ( not ( = ?auto_67680 ?auto_67684 ) ) ( not ( = ?auto_67680 ?auto_67685 ) ) ( not ( = ?auto_67680 ?auto_67686 ) ) ( not ( = ?auto_67681 ?auto_67682 ) ) ( not ( = ?auto_67681 ?auto_67683 ) ) ( not ( = ?auto_67681 ?auto_67684 ) ) ( not ( = ?auto_67681 ?auto_67685 ) ) ( not ( = ?auto_67681 ?auto_67686 ) ) ( not ( = ?auto_67682 ?auto_67683 ) ) ( not ( = ?auto_67682 ?auto_67684 ) ) ( not ( = ?auto_67682 ?auto_67685 ) ) ( not ( = ?auto_67682 ?auto_67686 ) ) ( not ( = ?auto_67683 ?auto_67684 ) ) ( not ( = ?auto_67683 ?auto_67685 ) ) ( not ( = ?auto_67683 ?auto_67686 ) ) ( not ( = ?auto_67684 ?auto_67685 ) ) ( not ( = ?auto_67684 ?auto_67686 ) ) ( not ( = ?auto_67685 ?auto_67686 ) ) ( ON ?auto_67684 ?auto_67685 ) ( ON ?auto_67683 ?auto_67684 ) ( ON ?auto_67682 ?auto_67683 ) ( CLEAR ?auto_67680 ) ( ON ?auto_67681 ?auto_67682 ) ( CLEAR ?auto_67681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67680 ?auto_67681 )
      ( MAKE-6PILE ?auto_67680 ?auto_67681 ?auto_67682 ?auto_67683 ?auto_67684 ?auto_67685 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_67706 - BLOCK
      ?auto_67707 - BLOCK
      ?auto_67708 - BLOCK
      ?auto_67709 - BLOCK
      ?auto_67710 - BLOCK
      ?auto_67711 - BLOCK
    )
    :vars
    (
      ?auto_67712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67711 ?auto_67712 ) ( not ( = ?auto_67706 ?auto_67707 ) ) ( not ( = ?auto_67706 ?auto_67708 ) ) ( not ( = ?auto_67706 ?auto_67709 ) ) ( not ( = ?auto_67706 ?auto_67710 ) ) ( not ( = ?auto_67706 ?auto_67711 ) ) ( not ( = ?auto_67706 ?auto_67712 ) ) ( not ( = ?auto_67707 ?auto_67708 ) ) ( not ( = ?auto_67707 ?auto_67709 ) ) ( not ( = ?auto_67707 ?auto_67710 ) ) ( not ( = ?auto_67707 ?auto_67711 ) ) ( not ( = ?auto_67707 ?auto_67712 ) ) ( not ( = ?auto_67708 ?auto_67709 ) ) ( not ( = ?auto_67708 ?auto_67710 ) ) ( not ( = ?auto_67708 ?auto_67711 ) ) ( not ( = ?auto_67708 ?auto_67712 ) ) ( not ( = ?auto_67709 ?auto_67710 ) ) ( not ( = ?auto_67709 ?auto_67711 ) ) ( not ( = ?auto_67709 ?auto_67712 ) ) ( not ( = ?auto_67710 ?auto_67711 ) ) ( not ( = ?auto_67710 ?auto_67712 ) ) ( not ( = ?auto_67711 ?auto_67712 ) ) ( ON ?auto_67710 ?auto_67711 ) ( ON ?auto_67709 ?auto_67710 ) ( ON ?auto_67708 ?auto_67709 ) ( ON ?auto_67707 ?auto_67708 ) ( ON ?auto_67706 ?auto_67707 ) ( CLEAR ?auto_67706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_67706 )
      ( MAKE-6PILE ?auto_67706 ?auto_67707 ?auto_67708 ?auto_67709 ?auto_67710 ?auto_67711 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_67733 - BLOCK
      ?auto_67734 - BLOCK
      ?auto_67735 - BLOCK
      ?auto_67736 - BLOCK
      ?auto_67737 - BLOCK
      ?auto_67738 - BLOCK
      ?auto_67739 - BLOCK
    )
    :vars
    (
      ?auto_67740 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_67738 ) ( ON ?auto_67739 ?auto_67740 ) ( CLEAR ?auto_67739 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_67733 ) ( ON ?auto_67734 ?auto_67733 ) ( ON ?auto_67735 ?auto_67734 ) ( ON ?auto_67736 ?auto_67735 ) ( ON ?auto_67737 ?auto_67736 ) ( ON ?auto_67738 ?auto_67737 ) ( not ( = ?auto_67733 ?auto_67734 ) ) ( not ( = ?auto_67733 ?auto_67735 ) ) ( not ( = ?auto_67733 ?auto_67736 ) ) ( not ( = ?auto_67733 ?auto_67737 ) ) ( not ( = ?auto_67733 ?auto_67738 ) ) ( not ( = ?auto_67733 ?auto_67739 ) ) ( not ( = ?auto_67733 ?auto_67740 ) ) ( not ( = ?auto_67734 ?auto_67735 ) ) ( not ( = ?auto_67734 ?auto_67736 ) ) ( not ( = ?auto_67734 ?auto_67737 ) ) ( not ( = ?auto_67734 ?auto_67738 ) ) ( not ( = ?auto_67734 ?auto_67739 ) ) ( not ( = ?auto_67734 ?auto_67740 ) ) ( not ( = ?auto_67735 ?auto_67736 ) ) ( not ( = ?auto_67735 ?auto_67737 ) ) ( not ( = ?auto_67735 ?auto_67738 ) ) ( not ( = ?auto_67735 ?auto_67739 ) ) ( not ( = ?auto_67735 ?auto_67740 ) ) ( not ( = ?auto_67736 ?auto_67737 ) ) ( not ( = ?auto_67736 ?auto_67738 ) ) ( not ( = ?auto_67736 ?auto_67739 ) ) ( not ( = ?auto_67736 ?auto_67740 ) ) ( not ( = ?auto_67737 ?auto_67738 ) ) ( not ( = ?auto_67737 ?auto_67739 ) ) ( not ( = ?auto_67737 ?auto_67740 ) ) ( not ( = ?auto_67738 ?auto_67739 ) ) ( not ( = ?auto_67738 ?auto_67740 ) ) ( not ( = ?auto_67739 ?auto_67740 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_67739 ?auto_67740 )
      ( !STACK ?auto_67739 ?auto_67738 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_67763 - BLOCK
      ?auto_67764 - BLOCK
      ?auto_67765 - BLOCK
      ?auto_67766 - BLOCK
      ?auto_67767 - BLOCK
      ?auto_67768 - BLOCK
      ?auto_67769 - BLOCK
    )
    :vars
    (
      ?auto_67770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67769 ?auto_67770 ) ( ON-TABLE ?auto_67763 ) ( ON ?auto_67764 ?auto_67763 ) ( ON ?auto_67765 ?auto_67764 ) ( ON ?auto_67766 ?auto_67765 ) ( ON ?auto_67767 ?auto_67766 ) ( not ( = ?auto_67763 ?auto_67764 ) ) ( not ( = ?auto_67763 ?auto_67765 ) ) ( not ( = ?auto_67763 ?auto_67766 ) ) ( not ( = ?auto_67763 ?auto_67767 ) ) ( not ( = ?auto_67763 ?auto_67768 ) ) ( not ( = ?auto_67763 ?auto_67769 ) ) ( not ( = ?auto_67763 ?auto_67770 ) ) ( not ( = ?auto_67764 ?auto_67765 ) ) ( not ( = ?auto_67764 ?auto_67766 ) ) ( not ( = ?auto_67764 ?auto_67767 ) ) ( not ( = ?auto_67764 ?auto_67768 ) ) ( not ( = ?auto_67764 ?auto_67769 ) ) ( not ( = ?auto_67764 ?auto_67770 ) ) ( not ( = ?auto_67765 ?auto_67766 ) ) ( not ( = ?auto_67765 ?auto_67767 ) ) ( not ( = ?auto_67765 ?auto_67768 ) ) ( not ( = ?auto_67765 ?auto_67769 ) ) ( not ( = ?auto_67765 ?auto_67770 ) ) ( not ( = ?auto_67766 ?auto_67767 ) ) ( not ( = ?auto_67766 ?auto_67768 ) ) ( not ( = ?auto_67766 ?auto_67769 ) ) ( not ( = ?auto_67766 ?auto_67770 ) ) ( not ( = ?auto_67767 ?auto_67768 ) ) ( not ( = ?auto_67767 ?auto_67769 ) ) ( not ( = ?auto_67767 ?auto_67770 ) ) ( not ( = ?auto_67768 ?auto_67769 ) ) ( not ( = ?auto_67768 ?auto_67770 ) ) ( not ( = ?auto_67769 ?auto_67770 ) ) ( CLEAR ?auto_67767 ) ( ON ?auto_67768 ?auto_67769 ) ( CLEAR ?auto_67768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_67763 ?auto_67764 ?auto_67765 ?auto_67766 ?auto_67767 ?auto_67768 )
      ( MAKE-7PILE ?auto_67763 ?auto_67764 ?auto_67765 ?auto_67766 ?auto_67767 ?auto_67768 ?auto_67769 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_67793 - BLOCK
      ?auto_67794 - BLOCK
      ?auto_67795 - BLOCK
      ?auto_67796 - BLOCK
      ?auto_67797 - BLOCK
      ?auto_67798 - BLOCK
      ?auto_67799 - BLOCK
    )
    :vars
    (
      ?auto_67800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67799 ?auto_67800 ) ( ON-TABLE ?auto_67793 ) ( ON ?auto_67794 ?auto_67793 ) ( ON ?auto_67795 ?auto_67794 ) ( ON ?auto_67796 ?auto_67795 ) ( not ( = ?auto_67793 ?auto_67794 ) ) ( not ( = ?auto_67793 ?auto_67795 ) ) ( not ( = ?auto_67793 ?auto_67796 ) ) ( not ( = ?auto_67793 ?auto_67797 ) ) ( not ( = ?auto_67793 ?auto_67798 ) ) ( not ( = ?auto_67793 ?auto_67799 ) ) ( not ( = ?auto_67793 ?auto_67800 ) ) ( not ( = ?auto_67794 ?auto_67795 ) ) ( not ( = ?auto_67794 ?auto_67796 ) ) ( not ( = ?auto_67794 ?auto_67797 ) ) ( not ( = ?auto_67794 ?auto_67798 ) ) ( not ( = ?auto_67794 ?auto_67799 ) ) ( not ( = ?auto_67794 ?auto_67800 ) ) ( not ( = ?auto_67795 ?auto_67796 ) ) ( not ( = ?auto_67795 ?auto_67797 ) ) ( not ( = ?auto_67795 ?auto_67798 ) ) ( not ( = ?auto_67795 ?auto_67799 ) ) ( not ( = ?auto_67795 ?auto_67800 ) ) ( not ( = ?auto_67796 ?auto_67797 ) ) ( not ( = ?auto_67796 ?auto_67798 ) ) ( not ( = ?auto_67796 ?auto_67799 ) ) ( not ( = ?auto_67796 ?auto_67800 ) ) ( not ( = ?auto_67797 ?auto_67798 ) ) ( not ( = ?auto_67797 ?auto_67799 ) ) ( not ( = ?auto_67797 ?auto_67800 ) ) ( not ( = ?auto_67798 ?auto_67799 ) ) ( not ( = ?auto_67798 ?auto_67800 ) ) ( not ( = ?auto_67799 ?auto_67800 ) ) ( ON ?auto_67798 ?auto_67799 ) ( CLEAR ?auto_67796 ) ( ON ?auto_67797 ?auto_67798 ) ( CLEAR ?auto_67797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67793 ?auto_67794 ?auto_67795 ?auto_67796 ?auto_67797 )
      ( MAKE-7PILE ?auto_67793 ?auto_67794 ?auto_67795 ?auto_67796 ?auto_67797 ?auto_67798 ?auto_67799 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_67823 - BLOCK
      ?auto_67824 - BLOCK
      ?auto_67825 - BLOCK
      ?auto_67826 - BLOCK
      ?auto_67827 - BLOCK
      ?auto_67828 - BLOCK
      ?auto_67829 - BLOCK
    )
    :vars
    (
      ?auto_67830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67829 ?auto_67830 ) ( ON-TABLE ?auto_67823 ) ( ON ?auto_67824 ?auto_67823 ) ( ON ?auto_67825 ?auto_67824 ) ( not ( = ?auto_67823 ?auto_67824 ) ) ( not ( = ?auto_67823 ?auto_67825 ) ) ( not ( = ?auto_67823 ?auto_67826 ) ) ( not ( = ?auto_67823 ?auto_67827 ) ) ( not ( = ?auto_67823 ?auto_67828 ) ) ( not ( = ?auto_67823 ?auto_67829 ) ) ( not ( = ?auto_67823 ?auto_67830 ) ) ( not ( = ?auto_67824 ?auto_67825 ) ) ( not ( = ?auto_67824 ?auto_67826 ) ) ( not ( = ?auto_67824 ?auto_67827 ) ) ( not ( = ?auto_67824 ?auto_67828 ) ) ( not ( = ?auto_67824 ?auto_67829 ) ) ( not ( = ?auto_67824 ?auto_67830 ) ) ( not ( = ?auto_67825 ?auto_67826 ) ) ( not ( = ?auto_67825 ?auto_67827 ) ) ( not ( = ?auto_67825 ?auto_67828 ) ) ( not ( = ?auto_67825 ?auto_67829 ) ) ( not ( = ?auto_67825 ?auto_67830 ) ) ( not ( = ?auto_67826 ?auto_67827 ) ) ( not ( = ?auto_67826 ?auto_67828 ) ) ( not ( = ?auto_67826 ?auto_67829 ) ) ( not ( = ?auto_67826 ?auto_67830 ) ) ( not ( = ?auto_67827 ?auto_67828 ) ) ( not ( = ?auto_67827 ?auto_67829 ) ) ( not ( = ?auto_67827 ?auto_67830 ) ) ( not ( = ?auto_67828 ?auto_67829 ) ) ( not ( = ?auto_67828 ?auto_67830 ) ) ( not ( = ?auto_67829 ?auto_67830 ) ) ( ON ?auto_67828 ?auto_67829 ) ( ON ?auto_67827 ?auto_67828 ) ( CLEAR ?auto_67825 ) ( ON ?auto_67826 ?auto_67827 ) ( CLEAR ?auto_67826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_67823 ?auto_67824 ?auto_67825 ?auto_67826 )
      ( MAKE-7PILE ?auto_67823 ?auto_67824 ?auto_67825 ?auto_67826 ?auto_67827 ?auto_67828 ?auto_67829 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_67853 - BLOCK
      ?auto_67854 - BLOCK
      ?auto_67855 - BLOCK
      ?auto_67856 - BLOCK
      ?auto_67857 - BLOCK
      ?auto_67858 - BLOCK
      ?auto_67859 - BLOCK
    )
    :vars
    (
      ?auto_67860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67859 ?auto_67860 ) ( ON-TABLE ?auto_67853 ) ( ON ?auto_67854 ?auto_67853 ) ( not ( = ?auto_67853 ?auto_67854 ) ) ( not ( = ?auto_67853 ?auto_67855 ) ) ( not ( = ?auto_67853 ?auto_67856 ) ) ( not ( = ?auto_67853 ?auto_67857 ) ) ( not ( = ?auto_67853 ?auto_67858 ) ) ( not ( = ?auto_67853 ?auto_67859 ) ) ( not ( = ?auto_67853 ?auto_67860 ) ) ( not ( = ?auto_67854 ?auto_67855 ) ) ( not ( = ?auto_67854 ?auto_67856 ) ) ( not ( = ?auto_67854 ?auto_67857 ) ) ( not ( = ?auto_67854 ?auto_67858 ) ) ( not ( = ?auto_67854 ?auto_67859 ) ) ( not ( = ?auto_67854 ?auto_67860 ) ) ( not ( = ?auto_67855 ?auto_67856 ) ) ( not ( = ?auto_67855 ?auto_67857 ) ) ( not ( = ?auto_67855 ?auto_67858 ) ) ( not ( = ?auto_67855 ?auto_67859 ) ) ( not ( = ?auto_67855 ?auto_67860 ) ) ( not ( = ?auto_67856 ?auto_67857 ) ) ( not ( = ?auto_67856 ?auto_67858 ) ) ( not ( = ?auto_67856 ?auto_67859 ) ) ( not ( = ?auto_67856 ?auto_67860 ) ) ( not ( = ?auto_67857 ?auto_67858 ) ) ( not ( = ?auto_67857 ?auto_67859 ) ) ( not ( = ?auto_67857 ?auto_67860 ) ) ( not ( = ?auto_67858 ?auto_67859 ) ) ( not ( = ?auto_67858 ?auto_67860 ) ) ( not ( = ?auto_67859 ?auto_67860 ) ) ( ON ?auto_67858 ?auto_67859 ) ( ON ?auto_67857 ?auto_67858 ) ( ON ?auto_67856 ?auto_67857 ) ( CLEAR ?auto_67854 ) ( ON ?auto_67855 ?auto_67856 ) ( CLEAR ?auto_67855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_67853 ?auto_67854 ?auto_67855 )
      ( MAKE-7PILE ?auto_67853 ?auto_67854 ?auto_67855 ?auto_67856 ?auto_67857 ?auto_67858 ?auto_67859 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_67883 - BLOCK
      ?auto_67884 - BLOCK
      ?auto_67885 - BLOCK
      ?auto_67886 - BLOCK
      ?auto_67887 - BLOCK
      ?auto_67888 - BLOCK
      ?auto_67889 - BLOCK
    )
    :vars
    (
      ?auto_67890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67889 ?auto_67890 ) ( ON-TABLE ?auto_67883 ) ( not ( = ?auto_67883 ?auto_67884 ) ) ( not ( = ?auto_67883 ?auto_67885 ) ) ( not ( = ?auto_67883 ?auto_67886 ) ) ( not ( = ?auto_67883 ?auto_67887 ) ) ( not ( = ?auto_67883 ?auto_67888 ) ) ( not ( = ?auto_67883 ?auto_67889 ) ) ( not ( = ?auto_67883 ?auto_67890 ) ) ( not ( = ?auto_67884 ?auto_67885 ) ) ( not ( = ?auto_67884 ?auto_67886 ) ) ( not ( = ?auto_67884 ?auto_67887 ) ) ( not ( = ?auto_67884 ?auto_67888 ) ) ( not ( = ?auto_67884 ?auto_67889 ) ) ( not ( = ?auto_67884 ?auto_67890 ) ) ( not ( = ?auto_67885 ?auto_67886 ) ) ( not ( = ?auto_67885 ?auto_67887 ) ) ( not ( = ?auto_67885 ?auto_67888 ) ) ( not ( = ?auto_67885 ?auto_67889 ) ) ( not ( = ?auto_67885 ?auto_67890 ) ) ( not ( = ?auto_67886 ?auto_67887 ) ) ( not ( = ?auto_67886 ?auto_67888 ) ) ( not ( = ?auto_67886 ?auto_67889 ) ) ( not ( = ?auto_67886 ?auto_67890 ) ) ( not ( = ?auto_67887 ?auto_67888 ) ) ( not ( = ?auto_67887 ?auto_67889 ) ) ( not ( = ?auto_67887 ?auto_67890 ) ) ( not ( = ?auto_67888 ?auto_67889 ) ) ( not ( = ?auto_67888 ?auto_67890 ) ) ( not ( = ?auto_67889 ?auto_67890 ) ) ( ON ?auto_67888 ?auto_67889 ) ( ON ?auto_67887 ?auto_67888 ) ( ON ?auto_67886 ?auto_67887 ) ( ON ?auto_67885 ?auto_67886 ) ( CLEAR ?auto_67883 ) ( ON ?auto_67884 ?auto_67885 ) ( CLEAR ?auto_67884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67883 ?auto_67884 )
      ( MAKE-7PILE ?auto_67883 ?auto_67884 ?auto_67885 ?auto_67886 ?auto_67887 ?auto_67888 ?auto_67889 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_67913 - BLOCK
      ?auto_67914 - BLOCK
      ?auto_67915 - BLOCK
      ?auto_67916 - BLOCK
      ?auto_67917 - BLOCK
      ?auto_67918 - BLOCK
      ?auto_67919 - BLOCK
    )
    :vars
    (
      ?auto_67920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67919 ?auto_67920 ) ( not ( = ?auto_67913 ?auto_67914 ) ) ( not ( = ?auto_67913 ?auto_67915 ) ) ( not ( = ?auto_67913 ?auto_67916 ) ) ( not ( = ?auto_67913 ?auto_67917 ) ) ( not ( = ?auto_67913 ?auto_67918 ) ) ( not ( = ?auto_67913 ?auto_67919 ) ) ( not ( = ?auto_67913 ?auto_67920 ) ) ( not ( = ?auto_67914 ?auto_67915 ) ) ( not ( = ?auto_67914 ?auto_67916 ) ) ( not ( = ?auto_67914 ?auto_67917 ) ) ( not ( = ?auto_67914 ?auto_67918 ) ) ( not ( = ?auto_67914 ?auto_67919 ) ) ( not ( = ?auto_67914 ?auto_67920 ) ) ( not ( = ?auto_67915 ?auto_67916 ) ) ( not ( = ?auto_67915 ?auto_67917 ) ) ( not ( = ?auto_67915 ?auto_67918 ) ) ( not ( = ?auto_67915 ?auto_67919 ) ) ( not ( = ?auto_67915 ?auto_67920 ) ) ( not ( = ?auto_67916 ?auto_67917 ) ) ( not ( = ?auto_67916 ?auto_67918 ) ) ( not ( = ?auto_67916 ?auto_67919 ) ) ( not ( = ?auto_67916 ?auto_67920 ) ) ( not ( = ?auto_67917 ?auto_67918 ) ) ( not ( = ?auto_67917 ?auto_67919 ) ) ( not ( = ?auto_67917 ?auto_67920 ) ) ( not ( = ?auto_67918 ?auto_67919 ) ) ( not ( = ?auto_67918 ?auto_67920 ) ) ( not ( = ?auto_67919 ?auto_67920 ) ) ( ON ?auto_67918 ?auto_67919 ) ( ON ?auto_67917 ?auto_67918 ) ( ON ?auto_67916 ?auto_67917 ) ( ON ?auto_67915 ?auto_67916 ) ( ON ?auto_67914 ?auto_67915 ) ( ON ?auto_67913 ?auto_67914 ) ( CLEAR ?auto_67913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_67913 )
      ( MAKE-7PILE ?auto_67913 ?auto_67914 ?auto_67915 ?auto_67916 ?auto_67917 ?auto_67918 ?auto_67919 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_67944 - BLOCK
      ?auto_67945 - BLOCK
      ?auto_67946 - BLOCK
      ?auto_67947 - BLOCK
      ?auto_67948 - BLOCK
      ?auto_67949 - BLOCK
      ?auto_67950 - BLOCK
      ?auto_67951 - BLOCK
    )
    :vars
    (
      ?auto_67952 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_67950 ) ( ON ?auto_67951 ?auto_67952 ) ( CLEAR ?auto_67951 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_67944 ) ( ON ?auto_67945 ?auto_67944 ) ( ON ?auto_67946 ?auto_67945 ) ( ON ?auto_67947 ?auto_67946 ) ( ON ?auto_67948 ?auto_67947 ) ( ON ?auto_67949 ?auto_67948 ) ( ON ?auto_67950 ?auto_67949 ) ( not ( = ?auto_67944 ?auto_67945 ) ) ( not ( = ?auto_67944 ?auto_67946 ) ) ( not ( = ?auto_67944 ?auto_67947 ) ) ( not ( = ?auto_67944 ?auto_67948 ) ) ( not ( = ?auto_67944 ?auto_67949 ) ) ( not ( = ?auto_67944 ?auto_67950 ) ) ( not ( = ?auto_67944 ?auto_67951 ) ) ( not ( = ?auto_67944 ?auto_67952 ) ) ( not ( = ?auto_67945 ?auto_67946 ) ) ( not ( = ?auto_67945 ?auto_67947 ) ) ( not ( = ?auto_67945 ?auto_67948 ) ) ( not ( = ?auto_67945 ?auto_67949 ) ) ( not ( = ?auto_67945 ?auto_67950 ) ) ( not ( = ?auto_67945 ?auto_67951 ) ) ( not ( = ?auto_67945 ?auto_67952 ) ) ( not ( = ?auto_67946 ?auto_67947 ) ) ( not ( = ?auto_67946 ?auto_67948 ) ) ( not ( = ?auto_67946 ?auto_67949 ) ) ( not ( = ?auto_67946 ?auto_67950 ) ) ( not ( = ?auto_67946 ?auto_67951 ) ) ( not ( = ?auto_67946 ?auto_67952 ) ) ( not ( = ?auto_67947 ?auto_67948 ) ) ( not ( = ?auto_67947 ?auto_67949 ) ) ( not ( = ?auto_67947 ?auto_67950 ) ) ( not ( = ?auto_67947 ?auto_67951 ) ) ( not ( = ?auto_67947 ?auto_67952 ) ) ( not ( = ?auto_67948 ?auto_67949 ) ) ( not ( = ?auto_67948 ?auto_67950 ) ) ( not ( = ?auto_67948 ?auto_67951 ) ) ( not ( = ?auto_67948 ?auto_67952 ) ) ( not ( = ?auto_67949 ?auto_67950 ) ) ( not ( = ?auto_67949 ?auto_67951 ) ) ( not ( = ?auto_67949 ?auto_67952 ) ) ( not ( = ?auto_67950 ?auto_67951 ) ) ( not ( = ?auto_67950 ?auto_67952 ) ) ( not ( = ?auto_67951 ?auto_67952 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_67951 ?auto_67952 )
      ( !STACK ?auto_67951 ?auto_67950 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_67978 - BLOCK
      ?auto_67979 - BLOCK
      ?auto_67980 - BLOCK
      ?auto_67981 - BLOCK
      ?auto_67982 - BLOCK
      ?auto_67983 - BLOCK
      ?auto_67984 - BLOCK
      ?auto_67985 - BLOCK
    )
    :vars
    (
      ?auto_67986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67985 ?auto_67986 ) ( ON-TABLE ?auto_67978 ) ( ON ?auto_67979 ?auto_67978 ) ( ON ?auto_67980 ?auto_67979 ) ( ON ?auto_67981 ?auto_67980 ) ( ON ?auto_67982 ?auto_67981 ) ( ON ?auto_67983 ?auto_67982 ) ( not ( = ?auto_67978 ?auto_67979 ) ) ( not ( = ?auto_67978 ?auto_67980 ) ) ( not ( = ?auto_67978 ?auto_67981 ) ) ( not ( = ?auto_67978 ?auto_67982 ) ) ( not ( = ?auto_67978 ?auto_67983 ) ) ( not ( = ?auto_67978 ?auto_67984 ) ) ( not ( = ?auto_67978 ?auto_67985 ) ) ( not ( = ?auto_67978 ?auto_67986 ) ) ( not ( = ?auto_67979 ?auto_67980 ) ) ( not ( = ?auto_67979 ?auto_67981 ) ) ( not ( = ?auto_67979 ?auto_67982 ) ) ( not ( = ?auto_67979 ?auto_67983 ) ) ( not ( = ?auto_67979 ?auto_67984 ) ) ( not ( = ?auto_67979 ?auto_67985 ) ) ( not ( = ?auto_67979 ?auto_67986 ) ) ( not ( = ?auto_67980 ?auto_67981 ) ) ( not ( = ?auto_67980 ?auto_67982 ) ) ( not ( = ?auto_67980 ?auto_67983 ) ) ( not ( = ?auto_67980 ?auto_67984 ) ) ( not ( = ?auto_67980 ?auto_67985 ) ) ( not ( = ?auto_67980 ?auto_67986 ) ) ( not ( = ?auto_67981 ?auto_67982 ) ) ( not ( = ?auto_67981 ?auto_67983 ) ) ( not ( = ?auto_67981 ?auto_67984 ) ) ( not ( = ?auto_67981 ?auto_67985 ) ) ( not ( = ?auto_67981 ?auto_67986 ) ) ( not ( = ?auto_67982 ?auto_67983 ) ) ( not ( = ?auto_67982 ?auto_67984 ) ) ( not ( = ?auto_67982 ?auto_67985 ) ) ( not ( = ?auto_67982 ?auto_67986 ) ) ( not ( = ?auto_67983 ?auto_67984 ) ) ( not ( = ?auto_67983 ?auto_67985 ) ) ( not ( = ?auto_67983 ?auto_67986 ) ) ( not ( = ?auto_67984 ?auto_67985 ) ) ( not ( = ?auto_67984 ?auto_67986 ) ) ( not ( = ?auto_67985 ?auto_67986 ) ) ( CLEAR ?auto_67983 ) ( ON ?auto_67984 ?auto_67985 ) ( CLEAR ?auto_67984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_67978 ?auto_67979 ?auto_67980 ?auto_67981 ?auto_67982 ?auto_67983 ?auto_67984 )
      ( MAKE-8PILE ?auto_67978 ?auto_67979 ?auto_67980 ?auto_67981 ?auto_67982 ?auto_67983 ?auto_67984 ?auto_67985 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_68012 - BLOCK
      ?auto_68013 - BLOCK
      ?auto_68014 - BLOCK
      ?auto_68015 - BLOCK
      ?auto_68016 - BLOCK
      ?auto_68017 - BLOCK
      ?auto_68018 - BLOCK
      ?auto_68019 - BLOCK
    )
    :vars
    (
      ?auto_68020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68019 ?auto_68020 ) ( ON-TABLE ?auto_68012 ) ( ON ?auto_68013 ?auto_68012 ) ( ON ?auto_68014 ?auto_68013 ) ( ON ?auto_68015 ?auto_68014 ) ( ON ?auto_68016 ?auto_68015 ) ( not ( = ?auto_68012 ?auto_68013 ) ) ( not ( = ?auto_68012 ?auto_68014 ) ) ( not ( = ?auto_68012 ?auto_68015 ) ) ( not ( = ?auto_68012 ?auto_68016 ) ) ( not ( = ?auto_68012 ?auto_68017 ) ) ( not ( = ?auto_68012 ?auto_68018 ) ) ( not ( = ?auto_68012 ?auto_68019 ) ) ( not ( = ?auto_68012 ?auto_68020 ) ) ( not ( = ?auto_68013 ?auto_68014 ) ) ( not ( = ?auto_68013 ?auto_68015 ) ) ( not ( = ?auto_68013 ?auto_68016 ) ) ( not ( = ?auto_68013 ?auto_68017 ) ) ( not ( = ?auto_68013 ?auto_68018 ) ) ( not ( = ?auto_68013 ?auto_68019 ) ) ( not ( = ?auto_68013 ?auto_68020 ) ) ( not ( = ?auto_68014 ?auto_68015 ) ) ( not ( = ?auto_68014 ?auto_68016 ) ) ( not ( = ?auto_68014 ?auto_68017 ) ) ( not ( = ?auto_68014 ?auto_68018 ) ) ( not ( = ?auto_68014 ?auto_68019 ) ) ( not ( = ?auto_68014 ?auto_68020 ) ) ( not ( = ?auto_68015 ?auto_68016 ) ) ( not ( = ?auto_68015 ?auto_68017 ) ) ( not ( = ?auto_68015 ?auto_68018 ) ) ( not ( = ?auto_68015 ?auto_68019 ) ) ( not ( = ?auto_68015 ?auto_68020 ) ) ( not ( = ?auto_68016 ?auto_68017 ) ) ( not ( = ?auto_68016 ?auto_68018 ) ) ( not ( = ?auto_68016 ?auto_68019 ) ) ( not ( = ?auto_68016 ?auto_68020 ) ) ( not ( = ?auto_68017 ?auto_68018 ) ) ( not ( = ?auto_68017 ?auto_68019 ) ) ( not ( = ?auto_68017 ?auto_68020 ) ) ( not ( = ?auto_68018 ?auto_68019 ) ) ( not ( = ?auto_68018 ?auto_68020 ) ) ( not ( = ?auto_68019 ?auto_68020 ) ) ( ON ?auto_68018 ?auto_68019 ) ( CLEAR ?auto_68016 ) ( ON ?auto_68017 ?auto_68018 ) ( CLEAR ?auto_68017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_68012 ?auto_68013 ?auto_68014 ?auto_68015 ?auto_68016 ?auto_68017 )
      ( MAKE-8PILE ?auto_68012 ?auto_68013 ?auto_68014 ?auto_68015 ?auto_68016 ?auto_68017 ?auto_68018 ?auto_68019 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_68046 - BLOCK
      ?auto_68047 - BLOCK
      ?auto_68048 - BLOCK
      ?auto_68049 - BLOCK
      ?auto_68050 - BLOCK
      ?auto_68051 - BLOCK
      ?auto_68052 - BLOCK
      ?auto_68053 - BLOCK
    )
    :vars
    (
      ?auto_68054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68053 ?auto_68054 ) ( ON-TABLE ?auto_68046 ) ( ON ?auto_68047 ?auto_68046 ) ( ON ?auto_68048 ?auto_68047 ) ( ON ?auto_68049 ?auto_68048 ) ( not ( = ?auto_68046 ?auto_68047 ) ) ( not ( = ?auto_68046 ?auto_68048 ) ) ( not ( = ?auto_68046 ?auto_68049 ) ) ( not ( = ?auto_68046 ?auto_68050 ) ) ( not ( = ?auto_68046 ?auto_68051 ) ) ( not ( = ?auto_68046 ?auto_68052 ) ) ( not ( = ?auto_68046 ?auto_68053 ) ) ( not ( = ?auto_68046 ?auto_68054 ) ) ( not ( = ?auto_68047 ?auto_68048 ) ) ( not ( = ?auto_68047 ?auto_68049 ) ) ( not ( = ?auto_68047 ?auto_68050 ) ) ( not ( = ?auto_68047 ?auto_68051 ) ) ( not ( = ?auto_68047 ?auto_68052 ) ) ( not ( = ?auto_68047 ?auto_68053 ) ) ( not ( = ?auto_68047 ?auto_68054 ) ) ( not ( = ?auto_68048 ?auto_68049 ) ) ( not ( = ?auto_68048 ?auto_68050 ) ) ( not ( = ?auto_68048 ?auto_68051 ) ) ( not ( = ?auto_68048 ?auto_68052 ) ) ( not ( = ?auto_68048 ?auto_68053 ) ) ( not ( = ?auto_68048 ?auto_68054 ) ) ( not ( = ?auto_68049 ?auto_68050 ) ) ( not ( = ?auto_68049 ?auto_68051 ) ) ( not ( = ?auto_68049 ?auto_68052 ) ) ( not ( = ?auto_68049 ?auto_68053 ) ) ( not ( = ?auto_68049 ?auto_68054 ) ) ( not ( = ?auto_68050 ?auto_68051 ) ) ( not ( = ?auto_68050 ?auto_68052 ) ) ( not ( = ?auto_68050 ?auto_68053 ) ) ( not ( = ?auto_68050 ?auto_68054 ) ) ( not ( = ?auto_68051 ?auto_68052 ) ) ( not ( = ?auto_68051 ?auto_68053 ) ) ( not ( = ?auto_68051 ?auto_68054 ) ) ( not ( = ?auto_68052 ?auto_68053 ) ) ( not ( = ?auto_68052 ?auto_68054 ) ) ( not ( = ?auto_68053 ?auto_68054 ) ) ( ON ?auto_68052 ?auto_68053 ) ( ON ?auto_68051 ?auto_68052 ) ( CLEAR ?auto_68049 ) ( ON ?auto_68050 ?auto_68051 ) ( CLEAR ?auto_68050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68046 ?auto_68047 ?auto_68048 ?auto_68049 ?auto_68050 )
      ( MAKE-8PILE ?auto_68046 ?auto_68047 ?auto_68048 ?auto_68049 ?auto_68050 ?auto_68051 ?auto_68052 ?auto_68053 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_68080 - BLOCK
      ?auto_68081 - BLOCK
      ?auto_68082 - BLOCK
      ?auto_68083 - BLOCK
      ?auto_68084 - BLOCK
      ?auto_68085 - BLOCK
      ?auto_68086 - BLOCK
      ?auto_68087 - BLOCK
    )
    :vars
    (
      ?auto_68088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68087 ?auto_68088 ) ( ON-TABLE ?auto_68080 ) ( ON ?auto_68081 ?auto_68080 ) ( ON ?auto_68082 ?auto_68081 ) ( not ( = ?auto_68080 ?auto_68081 ) ) ( not ( = ?auto_68080 ?auto_68082 ) ) ( not ( = ?auto_68080 ?auto_68083 ) ) ( not ( = ?auto_68080 ?auto_68084 ) ) ( not ( = ?auto_68080 ?auto_68085 ) ) ( not ( = ?auto_68080 ?auto_68086 ) ) ( not ( = ?auto_68080 ?auto_68087 ) ) ( not ( = ?auto_68080 ?auto_68088 ) ) ( not ( = ?auto_68081 ?auto_68082 ) ) ( not ( = ?auto_68081 ?auto_68083 ) ) ( not ( = ?auto_68081 ?auto_68084 ) ) ( not ( = ?auto_68081 ?auto_68085 ) ) ( not ( = ?auto_68081 ?auto_68086 ) ) ( not ( = ?auto_68081 ?auto_68087 ) ) ( not ( = ?auto_68081 ?auto_68088 ) ) ( not ( = ?auto_68082 ?auto_68083 ) ) ( not ( = ?auto_68082 ?auto_68084 ) ) ( not ( = ?auto_68082 ?auto_68085 ) ) ( not ( = ?auto_68082 ?auto_68086 ) ) ( not ( = ?auto_68082 ?auto_68087 ) ) ( not ( = ?auto_68082 ?auto_68088 ) ) ( not ( = ?auto_68083 ?auto_68084 ) ) ( not ( = ?auto_68083 ?auto_68085 ) ) ( not ( = ?auto_68083 ?auto_68086 ) ) ( not ( = ?auto_68083 ?auto_68087 ) ) ( not ( = ?auto_68083 ?auto_68088 ) ) ( not ( = ?auto_68084 ?auto_68085 ) ) ( not ( = ?auto_68084 ?auto_68086 ) ) ( not ( = ?auto_68084 ?auto_68087 ) ) ( not ( = ?auto_68084 ?auto_68088 ) ) ( not ( = ?auto_68085 ?auto_68086 ) ) ( not ( = ?auto_68085 ?auto_68087 ) ) ( not ( = ?auto_68085 ?auto_68088 ) ) ( not ( = ?auto_68086 ?auto_68087 ) ) ( not ( = ?auto_68086 ?auto_68088 ) ) ( not ( = ?auto_68087 ?auto_68088 ) ) ( ON ?auto_68086 ?auto_68087 ) ( ON ?auto_68085 ?auto_68086 ) ( ON ?auto_68084 ?auto_68085 ) ( CLEAR ?auto_68082 ) ( ON ?auto_68083 ?auto_68084 ) ( CLEAR ?auto_68083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68080 ?auto_68081 ?auto_68082 ?auto_68083 )
      ( MAKE-8PILE ?auto_68080 ?auto_68081 ?auto_68082 ?auto_68083 ?auto_68084 ?auto_68085 ?auto_68086 ?auto_68087 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_68114 - BLOCK
      ?auto_68115 - BLOCK
      ?auto_68116 - BLOCK
      ?auto_68117 - BLOCK
      ?auto_68118 - BLOCK
      ?auto_68119 - BLOCK
      ?auto_68120 - BLOCK
      ?auto_68121 - BLOCK
    )
    :vars
    (
      ?auto_68122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68121 ?auto_68122 ) ( ON-TABLE ?auto_68114 ) ( ON ?auto_68115 ?auto_68114 ) ( not ( = ?auto_68114 ?auto_68115 ) ) ( not ( = ?auto_68114 ?auto_68116 ) ) ( not ( = ?auto_68114 ?auto_68117 ) ) ( not ( = ?auto_68114 ?auto_68118 ) ) ( not ( = ?auto_68114 ?auto_68119 ) ) ( not ( = ?auto_68114 ?auto_68120 ) ) ( not ( = ?auto_68114 ?auto_68121 ) ) ( not ( = ?auto_68114 ?auto_68122 ) ) ( not ( = ?auto_68115 ?auto_68116 ) ) ( not ( = ?auto_68115 ?auto_68117 ) ) ( not ( = ?auto_68115 ?auto_68118 ) ) ( not ( = ?auto_68115 ?auto_68119 ) ) ( not ( = ?auto_68115 ?auto_68120 ) ) ( not ( = ?auto_68115 ?auto_68121 ) ) ( not ( = ?auto_68115 ?auto_68122 ) ) ( not ( = ?auto_68116 ?auto_68117 ) ) ( not ( = ?auto_68116 ?auto_68118 ) ) ( not ( = ?auto_68116 ?auto_68119 ) ) ( not ( = ?auto_68116 ?auto_68120 ) ) ( not ( = ?auto_68116 ?auto_68121 ) ) ( not ( = ?auto_68116 ?auto_68122 ) ) ( not ( = ?auto_68117 ?auto_68118 ) ) ( not ( = ?auto_68117 ?auto_68119 ) ) ( not ( = ?auto_68117 ?auto_68120 ) ) ( not ( = ?auto_68117 ?auto_68121 ) ) ( not ( = ?auto_68117 ?auto_68122 ) ) ( not ( = ?auto_68118 ?auto_68119 ) ) ( not ( = ?auto_68118 ?auto_68120 ) ) ( not ( = ?auto_68118 ?auto_68121 ) ) ( not ( = ?auto_68118 ?auto_68122 ) ) ( not ( = ?auto_68119 ?auto_68120 ) ) ( not ( = ?auto_68119 ?auto_68121 ) ) ( not ( = ?auto_68119 ?auto_68122 ) ) ( not ( = ?auto_68120 ?auto_68121 ) ) ( not ( = ?auto_68120 ?auto_68122 ) ) ( not ( = ?auto_68121 ?auto_68122 ) ) ( ON ?auto_68120 ?auto_68121 ) ( ON ?auto_68119 ?auto_68120 ) ( ON ?auto_68118 ?auto_68119 ) ( ON ?auto_68117 ?auto_68118 ) ( CLEAR ?auto_68115 ) ( ON ?auto_68116 ?auto_68117 ) ( CLEAR ?auto_68116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68114 ?auto_68115 ?auto_68116 )
      ( MAKE-8PILE ?auto_68114 ?auto_68115 ?auto_68116 ?auto_68117 ?auto_68118 ?auto_68119 ?auto_68120 ?auto_68121 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_68148 - BLOCK
      ?auto_68149 - BLOCK
      ?auto_68150 - BLOCK
      ?auto_68151 - BLOCK
      ?auto_68152 - BLOCK
      ?auto_68153 - BLOCK
      ?auto_68154 - BLOCK
      ?auto_68155 - BLOCK
    )
    :vars
    (
      ?auto_68156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68155 ?auto_68156 ) ( ON-TABLE ?auto_68148 ) ( not ( = ?auto_68148 ?auto_68149 ) ) ( not ( = ?auto_68148 ?auto_68150 ) ) ( not ( = ?auto_68148 ?auto_68151 ) ) ( not ( = ?auto_68148 ?auto_68152 ) ) ( not ( = ?auto_68148 ?auto_68153 ) ) ( not ( = ?auto_68148 ?auto_68154 ) ) ( not ( = ?auto_68148 ?auto_68155 ) ) ( not ( = ?auto_68148 ?auto_68156 ) ) ( not ( = ?auto_68149 ?auto_68150 ) ) ( not ( = ?auto_68149 ?auto_68151 ) ) ( not ( = ?auto_68149 ?auto_68152 ) ) ( not ( = ?auto_68149 ?auto_68153 ) ) ( not ( = ?auto_68149 ?auto_68154 ) ) ( not ( = ?auto_68149 ?auto_68155 ) ) ( not ( = ?auto_68149 ?auto_68156 ) ) ( not ( = ?auto_68150 ?auto_68151 ) ) ( not ( = ?auto_68150 ?auto_68152 ) ) ( not ( = ?auto_68150 ?auto_68153 ) ) ( not ( = ?auto_68150 ?auto_68154 ) ) ( not ( = ?auto_68150 ?auto_68155 ) ) ( not ( = ?auto_68150 ?auto_68156 ) ) ( not ( = ?auto_68151 ?auto_68152 ) ) ( not ( = ?auto_68151 ?auto_68153 ) ) ( not ( = ?auto_68151 ?auto_68154 ) ) ( not ( = ?auto_68151 ?auto_68155 ) ) ( not ( = ?auto_68151 ?auto_68156 ) ) ( not ( = ?auto_68152 ?auto_68153 ) ) ( not ( = ?auto_68152 ?auto_68154 ) ) ( not ( = ?auto_68152 ?auto_68155 ) ) ( not ( = ?auto_68152 ?auto_68156 ) ) ( not ( = ?auto_68153 ?auto_68154 ) ) ( not ( = ?auto_68153 ?auto_68155 ) ) ( not ( = ?auto_68153 ?auto_68156 ) ) ( not ( = ?auto_68154 ?auto_68155 ) ) ( not ( = ?auto_68154 ?auto_68156 ) ) ( not ( = ?auto_68155 ?auto_68156 ) ) ( ON ?auto_68154 ?auto_68155 ) ( ON ?auto_68153 ?auto_68154 ) ( ON ?auto_68152 ?auto_68153 ) ( ON ?auto_68151 ?auto_68152 ) ( ON ?auto_68150 ?auto_68151 ) ( CLEAR ?auto_68148 ) ( ON ?auto_68149 ?auto_68150 ) ( CLEAR ?auto_68149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68148 ?auto_68149 )
      ( MAKE-8PILE ?auto_68148 ?auto_68149 ?auto_68150 ?auto_68151 ?auto_68152 ?auto_68153 ?auto_68154 ?auto_68155 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_68182 - BLOCK
      ?auto_68183 - BLOCK
      ?auto_68184 - BLOCK
      ?auto_68185 - BLOCK
      ?auto_68186 - BLOCK
      ?auto_68187 - BLOCK
      ?auto_68188 - BLOCK
      ?auto_68189 - BLOCK
    )
    :vars
    (
      ?auto_68190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68189 ?auto_68190 ) ( not ( = ?auto_68182 ?auto_68183 ) ) ( not ( = ?auto_68182 ?auto_68184 ) ) ( not ( = ?auto_68182 ?auto_68185 ) ) ( not ( = ?auto_68182 ?auto_68186 ) ) ( not ( = ?auto_68182 ?auto_68187 ) ) ( not ( = ?auto_68182 ?auto_68188 ) ) ( not ( = ?auto_68182 ?auto_68189 ) ) ( not ( = ?auto_68182 ?auto_68190 ) ) ( not ( = ?auto_68183 ?auto_68184 ) ) ( not ( = ?auto_68183 ?auto_68185 ) ) ( not ( = ?auto_68183 ?auto_68186 ) ) ( not ( = ?auto_68183 ?auto_68187 ) ) ( not ( = ?auto_68183 ?auto_68188 ) ) ( not ( = ?auto_68183 ?auto_68189 ) ) ( not ( = ?auto_68183 ?auto_68190 ) ) ( not ( = ?auto_68184 ?auto_68185 ) ) ( not ( = ?auto_68184 ?auto_68186 ) ) ( not ( = ?auto_68184 ?auto_68187 ) ) ( not ( = ?auto_68184 ?auto_68188 ) ) ( not ( = ?auto_68184 ?auto_68189 ) ) ( not ( = ?auto_68184 ?auto_68190 ) ) ( not ( = ?auto_68185 ?auto_68186 ) ) ( not ( = ?auto_68185 ?auto_68187 ) ) ( not ( = ?auto_68185 ?auto_68188 ) ) ( not ( = ?auto_68185 ?auto_68189 ) ) ( not ( = ?auto_68185 ?auto_68190 ) ) ( not ( = ?auto_68186 ?auto_68187 ) ) ( not ( = ?auto_68186 ?auto_68188 ) ) ( not ( = ?auto_68186 ?auto_68189 ) ) ( not ( = ?auto_68186 ?auto_68190 ) ) ( not ( = ?auto_68187 ?auto_68188 ) ) ( not ( = ?auto_68187 ?auto_68189 ) ) ( not ( = ?auto_68187 ?auto_68190 ) ) ( not ( = ?auto_68188 ?auto_68189 ) ) ( not ( = ?auto_68188 ?auto_68190 ) ) ( not ( = ?auto_68189 ?auto_68190 ) ) ( ON ?auto_68188 ?auto_68189 ) ( ON ?auto_68187 ?auto_68188 ) ( ON ?auto_68186 ?auto_68187 ) ( ON ?auto_68185 ?auto_68186 ) ( ON ?auto_68184 ?auto_68185 ) ( ON ?auto_68183 ?auto_68184 ) ( ON ?auto_68182 ?auto_68183 ) ( CLEAR ?auto_68182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68182 )
      ( MAKE-8PILE ?auto_68182 ?auto_68183 ?auto_68184 ?auto_68185 ?auto_68186 ?auto_68187 ?auto_68188 ?auto_68189 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_68217 - BLOCK
      ?auto_68218 - BLOCK
      ?auto_68219 - BLOCK
      ?auto_68220 - BLOCK
      ?auto_68221 - BLOCK
      ?auto_68222 - BLOCK
      ?auto_68223 - BLOCK
      ?auto_68224 - BLOCK
      ?auto_68225 - BLOCK
    )
    :vars
    (
      ?auto_68226 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_68224 ) ( ON ?auto_68225 ?auto_68226 ) ( CLEAR ?auto_68225 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68217 ) ( ON ?auto_68218 ?auto_68217 ) ( ON ?auto_68219 ?auto_68218 ) ( ON ?auto_68220 ?auto_68219 ) ( ON ?auto_68221 ?auto_68220 ) ( ON ?auto_68222 ?auto_68221 ) ( ON ?auto_68223 ?auto_68222 ) ( ON ?auto_68224 ?auto_68223 ) ( not ( = ?auto_68217 ?auto_68218 ) ) ( not ( = ?auto_68217 ?auto_68219 ) ) ( not ( = ?auto_68217 ?auto_68220 ) ) ( not ( = ?auto_68217 ?auto_68221 ) ) ( not ( = ?auto_68217 ?auto_68222 ) ) ( not ( = ?auto_68217 ?auto_68223 ) ) ( not ( = ?auto_68217 ?auto_68224 ) ) ( not ( = ?auto_68217 ?auto_68225 ) ) ( not ( = ?auto_68217 ?auto_68226 ) ) ( not ( = ?auto_68218 ?auto_68219 ) ) ( not ( = ?auto_68218 ?auto_68220 ) ) ( not ( = ?auto_68218 ?auto_68221 ) ) ( not ( = ?auto_68218 ?auto_68222 ) ) ( not ( = ?auto_68218 ?auto_68223 ) ) ( not ( = ?auto_68218 ?auto_68224 ) ) ( not ( = ?auto_68218 ?auto_68225 ) ) ( not ( = ?auto_68218 ?auto_68226 ) ) ( not ( = ?auto_68219 ?auto_68220 ) ) ( not ( = ?auto_68219 ?auto_68221 ) ) ( not ( = ?auto_68219 ?auto_68222 ) ) ( not ( = ?auto_68219 ?auto_68223 ) ) ( not ( = ?auto_68219 ?auto_68224 ) ) ( not ( = ?auto_68219 ?auto_68225 ) ) ( not ( = ?auto_68219 ?auto_68226 ) ) ( not ( = ?auto_68220 ?auto_68221 ) ) ( not ( = ?auto_68220 ?auto_68222 ) ) ( not ( = ?auto_68220 ?auto_68223 ) ) ( not ( = ?auto_68220 ?auto_68224 ) ) ( not ( = ?auto_68220 ?auto_68225 ) ) ( not ( = ?auto_68220 ?auto_68226 ) ) ( not ( = ?auto_68221 ?auto_68222 ) ) ( not ( = ?auto_68221 ?auto_68223 ) ) ( not ( = ?auto_68221 ?auto_68224 ) ) ( not ( = ?auto_68221 ?auto_68225 ) ) ( not ( = ?auto_68221 ?auto_68226 ) ) ( not ( = ?auto_68222 ?auto_68223 ) ) ( not ( = ?auto_68222 ?auto_68224 ) ) ( not ( = ?auto_68222 ?auto_68225 ) ) ( not ( = ?auto_68222 ?auto_68226 ) ) ( not ( = ?auto_68223 ?auto_68224 ) ) ( not ( = ?auto_68223 ?auto_68225 ) ) ( not ( = ?auto_68223 ?auto_68226 ) ) ( not ( = ?auto_68224 ?auto_68225 ) ) ( not ( = ?auto_68224 ?auto_68226 ) ) ( not ( = ?auto_68225 ?auto_68226 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68225 ?auto_68226 )
      ( !STACK ?auto_68225 ?auto_68224 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_68236 - BLOCK
      ?auto_68237 - BLOCK
      ?auto_68238 - BLOCK
      ?auto_68239 - BLOCK
      ?auto_68240 - BLOCK
      ?auto_68241 - BLOCK
      ?auto_68242 - BLOCK
      ?auto_68243 - BLOCK
      ?auto_68244 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_68243 ) ( ON-TABLE ?auto_68244 ) ( CLEAR ?auto_68244 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68236 ) ( ON ?auto_68237 ?auto_68236 ) ( ON ?auto_68238 ?auto_68237 ) ( ON ?auto_68239 ?auto_68238 ) ( ON ?auto_68240 ?auto_68239 ) ( ON ?auto_68241 ?auto_68240 ) ( ON ?auto_68242 ?auto_68241 ) ( ON ?auto_68243 ?auto_68242 ) ( not ( = ?auto_68236 ?auto_68237 ) ) ( not ( = ?auto_68236 ?auto_68238 ) ) ( not ( = ?auto_68236 ?auto_68239 ) ) ( not ( = ?auto_68236 ?auto_68240 ) ) ( not ( = ?auto_68236 ?auto_68241 ) ) ( not ( = ?auto_68236 ?auto_68242 ) ) ( not ( = ?auto_68236 ?auto_68243 ) ) ( not ( = ?auto_68236 ?auto_68244 ) ) ( not ( = ?auto_68237 ?auto_68238 ) ) ( not ( = ?auto_68237 ?auto_68239 ) ) ( not ( = ?auto_68237 ?auto_68240 ) ) ( not ( = ?auto_68237 ?auto_68241 ) ) ( not ( = ?auto_68237 ?auto_68242 ) ) ( not ( = ?auto_68237 ?auto_68243 ) ) ( not ( = ?auto_68237 ?auto_68244 ) ) ( not ( = ?auto_68238 ?auto_68239 ) ) ( not ( = ?auto_68238 ?auto_68240 ) ) ( not ( = ?auto_68238 ?auto_68241 ) ) ( not ( = ?auto_68238 ?auto_68242 ) ) ( not ( = ?auto_68238 ?auto_68243 ) ) ( not ( = ?auto_68238 ?auto_68244 ) ) ( not ( = ?auto_68239 ?auto_68240 ) ) ( not ( = ?auto_68239 ?auto_68241 ) ) ( not ( = ?auto_68239 ?auto_68242 ) ) ( not ( = ?auto_68239 ?auto_68243 ) ) ( not ( = ?auto_68239 ?auto_68244 ) ) ( not ( = ?auto_68240 ?auto_68241 ) ) ( not ( = ?auto_68240 ?auto_68242 ) ) ( not ( = ?auto_68240 ?auto_68243 ) ) ( not ( = ?auto_68240 ?auto_68244 ) ) ( not ( = ?auto_68241 ?auto_68242 ) ) ( not ( = ?auto_68241 ?auto_68243 ) ) ( not ( = ?auto_68241 ?auto_68244 ) ) ( not ( = ?auto_68242 ?auto_68243 ) ) ( not ( = ?auto_68242 ?auto_68244 ) ) ( not ( = ?auto_68243 ?auto_68244 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_68244 )
      ( !STACK ?auto_68244 ?auto_68243 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_68254 - BLOCK
      ?auto_68255 - BLOCK
      ?auto_68256 - BLOCK
      ?auto_68257 - BLOCK
      ?auto_68258 - BLOCK
      ?auto_68259 - BLOCK
      ?auto_68260 - BLOCK
      ?auto_68261 - BLOCK
      ?auto_68262 - BLOCK
    )
    :vars
    (
      ?auto_68263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68262 ?auto_68263 ) ( ON-TABLE ?auto_68254 ) ( ON ?auto_68255 ?auto_68254 ) ( ON ?auto_68256 ?auto_68255 ) ( ON ?auto_68257 ?auto_68256 ) ( ON ?auto_68258 ?auto_68257 ) ( ON ?auto_68259 ?auto_68258 ) ( ON ?auto_68260 ?auto_68259 ) ( not ( = ?auto_68254 ?auto_68255 ) ) ( not ( = ?auto_68254 ?auto_68256 ) ) ( not ( = ?auto_68254 ?auto_68257 ) ) ( not ( = ?auto_68254 ?auto_68258 ) ) ( not ( = ?auto_68254 ?auto_68259 ) ) ( not ( = ?auto_68254 ?auto_68260 ) ) ( not ( = ?auto_68254 ?auto_68261 ) ) ( not ( = ?auto_68254 ?auto_68262 ) ) ( not ( = ?auto_68254 ?auto_68263 ) ) ( not ( = ?auto_68255 ?auto_68256 ) ) ( not ( = ?auto_68255 ?auto_68257 ) ) ( not ( = ?auto_68255 ?auto_68258 ) ) ( not ( = ?auto_68255 ?auto_68259 ) ) ( not ( = ?auto_68255 ?auto_68260 ) ) ( not ( = ?auto_68255 ?auto_68261 ) ) ( not ( = ?auto_68255 ?auto_68262 ) ) ( not ( = ?auto_68255 ?auto_68263 ) ) ( not ( = ?auto_68256 ?auto_68257 ) ) ( not ( = ?auto_68256 ?auto_68258 ) ) ( not ( = ?auto_68256 ?auto_68259 ) ) ( not ( = ?auto_68256 ?auto_68260 ) ) ( not ( = ?auto_68256 ?auto_68261 ) ) ( not ( = ?auto_68256 ?auto_68262 ) ) ( not ( = ?auto_68256 ?auto_68263 ) ) ( not ( = ?auto_68257 ?auto_68258 ) ) ( not ( = ?auto_68257 ?auto_68259 ) ) ( not ( = ?auto_68257 ?auto_68260 ) ) ( not ( = ?auto_68257 ?auto_68261 ) ) ( not ( = ?auto_68257 ?auto_68262 ) ) ( not ( = ?auto_68257 ?auto_68263 ) ) ( not ( = ?auto_68258 ?auto_68259 ) ) ( not ( = ?auto_68258 ?auto_68260 ) ) ( not ( = ?auto_68258 ?auto_68261 ) ) ( not ( = ?auto_68258 ?auto_68262 ) ) ( not ( = ?auto_68258 ?auto_68263 ) ) ( not ( = ?auto_68259 ?auto_68260 ) ) ( not ( = ?auto_68259 ?auto_68261 ) ) ( not ( = ?auto_68259 ?auto_68262 ) ) ( not ( = ?auto_68259 ?auto_68263 ) ) ( not ( = ?auto_68260 ?auto_68261 ) ) ( not ( = ?auto_68260 ?auto_68262 ) ) ( not ( = ?auto_68260 ?auto_68263 ) ) ( not ( = ?auto_68261 ?auto_68262 ) ) ( not ( = ?auto_68261 ?auto_68263 ) ) ( not ( = ?auto_68262 ?auto_68263 ) ) ( CLEAR ?auto_68260 ) ( ON ?auto_68261 ?auto_68262 ) ( CLEAR ?auto_68261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_68254 ?auto_68255 ?auto_68256 ?auto_68257 ?auto_68258 ?auto_68259 ?auto_68260 ?auto_68261 )
      ( MAKE-9PILE ?auto_68254 ?auto_68255 ?auto_68256 ?auto_68257 ?auto_68258 ?auto_68259 ?auto_68260 ?auto_68261 ?auto_68262 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_68273 - BLOCK
      ?auto_68274 - BLOCK
      ?auto_68275 - BLOCK
      ?auto_68276 - BLOCK
      ?auto_68277 - BLOCK
      ?auto_68278 - BLOCK
      ?auto_68279 - BLOCK
      ?auto_68280 - BLOCK
      ?auto_68281 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68281 ) ( ON-TABLE ?auto_68273 ) ( ON ?auto_68274 ?auto_68273 ) ( ON ?auto_68275 ?auto_68274 ) ( ON ?auto_68276 ?auto_68275 ) ( ON ?auto_68277 ?auto_68276 ) ( ON ?auto_68278 ?auto_68277 ) ( ON ?auto_68279 ?auto_68278 ) ( not ( = ?auto_68273 ?auto_68274 ) ) ( not ( = ?auto_68273 ?auto_68275 ) ) ( not ( = ?auto_68273 ?auto_68276 ) ) ( not ( = ?auto_68273 ?auto_68277 ) ) ( not ( = ?auto_68273 ?auto_68278 ) ) ( not ( = ?auto_68273 ?auto_68279 ) ) ( not ( = ?auto_68273 ?auto_68280 ) ) ( not ( = ?auto_68273 ?auto_68281 ) ) ( not ( = ?auto_68274 ?auto_68275 ) ) ( not ( = ?auto_68274 ?auto_68276 ) ) ( not ( = ?auto_68274 ?auto_68277 ) ) ( not ( = ?auto_68274 ?auto_68278 ) ) ( not ( = ?auto_68274 ?auto_68279 ) ) ( not ( = ?auto_68274 ?auto_68280 ) ) ( not ( = ?auto_68274 ?auto_68281 ) ) ( not ( = ?auto_68275 ?auto_68276 ) ) ( not ( = ?auto_68275 ?auto_68277 ) ) ( not ( = ?auto_68275 ?auto_68278 ) ) ( not ( = ?auto_68275 ?auto_68279 ) ) ( not ( = ?auto_68275 ?auto_68280 ) ) ( not ( = ?auto_68275 ?auto_68281 ) ) ( not ( = ?auto_68276 ?auto_68277 ) ) ( not ( = ?auto_68276 ?auto_68278 ) ) ( not ( = ?auto_68276 ?auto_68279 ) ) ( not ( = ?auto_68276 ?auto_68280 ) ) ( not ( = ?auto_68276 ?auto_68281 ) ) ( not ( = ?auto_68277 ?auto_68278 ) ) ( not ( = ?auto_68277 ?auto_68279 ) ) ( not ( = ?auto_68277 ?auto_68280 ) ) ( not ( = ?auto_68277 ?auto_68281 ) ) ( not ( = ?auto_68278 ?auto_68279 ) ) ( not ( = ?auto_68278 ?auto_68280 ) ) ( not ( = ?auto_68278 ?auto_68281 ) ) ( not ( = ?auto_68279 ?auto_68280 ) ) ( not ( = ?auto_68279 ?auto_68281 ) ) ( not ( = ?auto_68280 ?auto_68281 ) ) ( CLEAR ?auto_68279 ) ( ON ?auto_68280 ?auto_68281 ) ( CLEAR ?auto_68280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_68273 ?auto_68274 ?auto_68275 ?auto_68276 ?auto_68277 ?auto_68278 ?auto_68279 ?auto_68280 )
      ( MAKE-9PILE ?auto_68273 ?auto_68274 ?auto_68275 ?auto_68276 ?auto_68277 ?auto_68278 ?auto_68279 ?auto_68280 ?auto_68281 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_68291 - BLOCK
      ?auto_68292 - BLOCK
      ?auto_68293 - BLOCK
      ?auto_68294 - BLOCK
      ?auto_68295 - BLOCK
      ?auto_68296 - BLOCK
      ?auto_68297 - BLOCK
      ?auto_68298 - BLOCK
      ?auto_68299 - BLOCK
    )
    :vars
    (
      ?auto_68300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68299 ?auto_68300 ) ( ON-TABLE ?auto_68291 ) ( ON ?auto_68292 ?auto_68291 ) ( ON ?auto_68293 ?auto_68292 ) ( ON ?auto_68294 ?auto_68293 ) ( ON ?auto_68295 ?auto_68294 ) ( ON ?auto_68296 ?auto_68295 ) ( not ( = ?auto_68291 ?auto_68292 ) ) ( not ( = ?auto_68291 ?auto_68293 ) ) ( not ( = ?auto_68291 ?auto_68294 ) ) ( not ( = ?auto_68291 ?auto_68295 ) ) ( not ( = ?auto_68291 ?auto_68296 ) ) ( not ( = ?auto_68291 ?auto_68297 ) ) ( not ( = ?auto_68291 ?auto_68298 ) ) ( not ( = ?auto_68291 ?auto_68299 ) ) ( not ( = ?auto_68291 ?auto_68300 ) ) ( not ( = ?auto_68292 ?auto_68293 ) ) ( not ( = ?auto_68292 ?auto_68294 ) ) ( not ( = ?auto_68292 ?auto_68295 ) ) ( not ( = ?auto_68292 ?auto_68296 ) ) ( not ( = ?auto_68292 ?auto_68297 ) ) ( not ( = ?auto_68292 ?auto_68298 ) ) ( not ( = ?auto_68292 ?auto_68299 ) ) ( not ( = ?auto_68292 ?auto_68300 ) ) ( not ( = ?auto_68293 ?auto_68294 ) ) ( not ( = ?auto_68293 ?auto_68295 ) ) ( not ( = ?auto_68293 ?auto_68296 ) ) ( not ( = ?auto_68293 ?auto_68297 ) ) ( not ( = ?auto_68293 ?auto_68298 ) ) ( not ( = ?auto_68293 ?auto_68299 ) ) ( not ( = ?auto_68293 ?auto_68300 ) ) ( not ( = ?auto_68294 ?auto_68295 ) ) ( not ( = ?auto_68294 ?auto_68296 ) ) ( not ( = ?auto_68294 ?auto_68297 ) ) ( not ( = ?auto_68294 ?auto_68298 ) ) ( not ( = ?auto_68294 ?auto_68299 ) ) ( not ( = ?auto_68294 ?auto_68300 ) ) ( not ( = ?auto_68295 ?auto_68296 ) ) ( not ( = ?auto_68295 ?auto_68297 ) ) ( not ( = ?auto_68295 ?auto_68298 ) ) ( not ( = ?auto_68295 ?auto_68299 ) ) ( not ( = ?auto_68295 ?auto_68300 ) ) ( not ( = ?auto_68296 ?auto_68297 ) ) ( not ( = ?auto_68296 ?auto_68298 ) ) ( not ( = ?auto_68296 ?auto_68299 ) ) ( not ( = ?auto_68296 ?auto_68300 ) ) ( not ( = ?auto_68297 ?auto_68298 ) ) ( not ( = ?auto_68297 ?auto_68299 ) ) ( not ( = ?auto_68297 ?auto_68300 ) ) ( not ( = ?auto_68298 ?auto_68299 ) ) ( not ( = ?auto_68298 ?auto_68300 ) ) ( not ( = ?auto_68299 ?auto_68300 ) ) ( ON ?auto_68298 ?auto_68299 ) ( CLEAR ?auto_68296 ) ( ON ?auto_68297 ?auto_68298 ) ( CLEAR ?auto_68297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_68291 ?auto_68292 ?auto_68293 ?auto_68294 ?auto_68295 ?auto_68296 ?auto_68297 )
      ( MAKE-9PILE ?auto_68291 ?auto_68292 ?auto_68293 ?auto_68294 ?auto_68295 ?auto_68296 ?auto_68297 ?auto_68298 ?auto_68299 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_68310 - BLOCK
      ?auto_68311 - BLOCK
      ?auto_68312 - BLOCK
      ?auto_68313 - BLOCK
      ?auto_68314 - BLOCK
      ?auto_68315 - BLOCK
      ?auto_68316 - BLOCK
      ?auto_68317 - BLOCK
      ?auto_68318 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68318 ) ( ON-TABLE ?auto_68310 ) ( ON ?auto_68311 ?auto_68310 ) ( ON ?auto_68312 ?auto_68311 ) ( ON ?auto_68313 ?auto_68312 ) ( ON ?auto_68314 ?auto_68313 ) ( ON ?auto_68315 ?auto_68314 ) ( not ( = ?auto_68310 ?auto_68311 ) ) ( not ( = ?auto_68310 ?auto_68312 ) ) ( not ( = ?auto_68310 ?auto_68313 ) ) ( not ( = ?auto_68310 ?auto_68314 ) ) ( not ( = ?auto_68310 ?auto_68315 ) ) ( not ( = ?auto_68310 ?auto_68316 ) ) ( not ( = ?auto_68310 ?auto_68317 ) ) ( not ( = ?auto_68310 ?auto_68318 ) ) ( not ( = ?auto_68311 ?auto_68312 ) ) ( not ( = ?auto_68311 ?auto_68313 ) ) ( not ( = ?auto_68311 ?auto_68314 ) ) ( not ( = ?auto_68311 ?auto_68315 ) ) ( not ( = ?auto_68311 ?auto_68316 ) ) ( not ( = ?auto_68311 ?auto_68317 ) ) ( not ( = ?auto_68311 ?auto_68318 ) ) ( not ( = ?auto_68312 ?auto_68313 ) ) ( not ( = ?auto_68312 ?auto_68314 ) ) ( not ( = ?auto_68312 ?auto_68315 ) ) ( not ( = ?auto_68312 ?auto_68316 ) ) ( not ( = ?auto_68312 ?auto_68317 ) ) ( not ( = ?auto_68312 ?auto_68318 ) ) ( not ( = ?auto_68313 ?auto_68314 ) ) ( not ( = ?auto_68313 ?auto_68315 ) ) ( not ( = ?auto_68313 ?auto_68316 ) ) ( not ( = ?auto_68313 ?auto_68317 ) ) ( not ( = ?auto_68313 ?auto_68318 ) ) ( not ( = ?auto_68314 ?auto_68315 ) ) ( not ( = ?auto_68314 ?auto_68316 ) ) ( not ( = ?auto_68314 ?auto_68317 ) ) ( not ( = ?auto_68314 ?auto_68318 ) ) ( not ( = ?auto_68315 ?auto_68316 ) ) ( not ( = ?auto_68315 ?auto_68317 ) ) ( not ( = ?auto_68315 ?auto_68318 ) ) ( not ( = ?auto_68316 ?auto_68317 ) ) ( not ( = ?auto_68316 ?auto_68318 ) ) ( not ( = ?auto_68317 ?auto_68318 ) ) ( ON ?auto_68317 ?auto_68318 ) ( CLEAR ?auto_68315 ) ( ON ?auto_68316 ?auto_68317 ) ( CLEAR ?auto_68316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_68310 ?auto_68311 ?auto_68312 ?auto_68313 ?auto_68314 ?auto_68315 ?auto_68316 )
      ( MAKE-9PILE ?auto_68310 ?auto_68311 ?auto_68312 ?auto_68313 ?auto_68314 ?auto_68315 ?auto_68316 ?auto_68317 ?auto_68318 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_68328 - BLOCK
      ?auto_68329 - BLOCK
      ?auto_68330 - BLOCK
      ?auto_68331 - BLOCK
      ?auto_68332 - BLOCK
      ?auto_68333 - BLOCK
      ?auto_68334 - BLOCK
      ?auto_68335 - BLOCK
      ?auto_68336 - BLOCK
    )
    :vars
    (
      ?auto_68337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68336 ?auto_68337 ) ( ON-TABLE ?auto_68328 ) ( ON ?auto_68329 ?auto_68328 ) ( ON ?auto_68330 ?auto_68329 ) ( ON ?auto_68331 ?auto_68330 ) ( ON ?auto_68332 ?auto_68331 ) ( not ( = ?auto_68328 ?auto_68329 ) ) ( not ( = ?auto_68328 ?auto_68330 ) ) ( not ( = ?auto_68328 ?auto_68331 ) ) ( not ( = ?auto_68328 ?auto_68332 ) ) ( not ( = ?auto_68328 ?auto_68333 ) ) ( not ( = ?auto_68328 ?auto_68334 ) ) ( not ( = ?auto_68328 ?auto_68335 ) ) ( not ( = ?auto_68328 ?auto_68336 ) ) ( not ( = ?auto_68328 ?auto_68337 ) ) ( not ( = ?auto_68329 ?auto_68330 ) ) ( not ( = ?auto_68329 ?auto_68331 ) ) ( not ( = ?auto_68329 ?auto_68332 ) ) ( not ( = ?auto_68329 ?auto_68333 ) ) ( not ( = ?auto_68329 ?auto_68334 ) ) ( not ( = ?auto_68329 ?auto_68335 ) ) ( not ( = ?auto_68329 ?auto_68336 ) ) ( not ( = ?auto_68329 ?auto_68337 ) ) ( not ( = ?auto_68330 ?auto_68331 ) ) ( not ( = ?auto_68330 ?auto_68332 ) ) ( not ( = ?auto_68330 ?auto_68333 ) ) ( not ( = ?auto_68330 ?auto_68334 ) ) ( not ( = ?auto_68330 ?auto_68335 ) ) ( not ( = ?auto_68330 ?auto_68336 ) ) ( not ( = ?auto_68330 ?auto_68337 ) ) ( not ( = ?auto_68331 ?auto_68332 ) ) ( not ( = ?auto_68331 ?auto_68333 ) ) ( not ( = ?auto_68331 ?auto_68334 ) ) ( not ( = ?auto_68331 ?auto_68335 ) ) ( not ( = ?auto_68331 ?auto_68336 ) ) ( not ( = ?auto_68331 ?auto_68337 ) ) ( not ( = ?auto_68332 ?auto_68333 ) ) ( not ( = ?auto_68332 ?auto_68334 ) ) ( not ( = ?auto_68332 ?auto_68335 ) ) ( not ( = ?auto_68332 ?auto_68336 ) ) ( not ( = ?auto_68332 ?auto_68337 ) ) ( not ( = ?auto_68333 ?auto_68334 ) ) ( not ( = ?auto_68333 ?auto_68335 ) ) ( not ( = ?auto_68333 ?auto_68336 ) ) ( not ( = ?auto_68333 ?auto_68337 ) ) ( not ( = ?auto_68334 ?auto_68335 ) ) ( not ( = ?auto_68334 ?auto_68336 ) ) ( not ( = ?auto_68334 ?auto_68337 ) ) ( not ( = ?auto_68335 ?auto_68336 ) ) ( not ( = ?auto_68335 ?auto_68337 ) ) ( not ( = ?auto_68336 ?auto_68337 ) ) ( ON ?auto_68335 ?auto_68336 ) ( ON ?auto_68334 ?auto_68335 ) ( CLEAR ?auto_68332 ) ( ON ?auto_68333 ?auto_68334 ) ( CLEAR ?auto_68333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_68328 ?auto_68329 ?auto_68330 ?auto_68331 ?auto_68332 ?auto_68333 )
      ( MAKE-9PILE ?auto_68328 ?auto_68329 ?auto_68330 ?auto_68331 ?auto_68332 ?auto_68333 ?auto_68334 ?auto_68335 ?auto_68336 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_68347 - BLOCK
      ?auto_68348 - BLOCK
      ?auto_68349 - BLOCK
      ?auto_68350 - BLOCK
      ?auto_68351 - BLOCK
      ?auto_68352 - BLOCK
      ?auto_68353 - BLOCK
      ?auto_68354 - BLOCK
      ?auto_68355 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68355 ) ( ON-TABLE ?auto_68347 ) ( ON ?auto_68348 ?auto_68347 ) ( ON ?auto_68349 ?auto_68348 ) ( ON ?auto_68350 ?auto_68349 ) ( ON ?auto_68351 ?auto_68350 ) ( not ( = ?auto_68347 ?auto_68348 ) ) ( not ( = ?auto_68347 ?auto_68349 ) ) ( not ( = ?auto_68347 ?auto_68350 ) ) ( not ( = ?auto_68347 ?auto_68351 ) ) ( not ( = ?auto_68347 ?auto_68352 ) ) ( not ( = ?auto_68347 ?auto_68353 ) ) ( not ( = ?auto_68347 ?auto_68354 ) ) ( not ( = ?auto_68347 ?auto_68355 ) ) ( not ( = ?auto_68348 ?auto_68349 ) ) ( not ( = ?auto_68348 ?auto_68350 ) ) ( not ( = ?auto_68348 ?auto_68351 ) ) ( not ( = ?auto_68348 ?auto_68352 ) ) ( not ( = ?auto_68348 ?auto_68353 ) ) ( not ( = ?auto_68348 ?auto_68354 ) ) ( not ( = ?auto_68348 ?auto_68355 ) ) ( not ( = ?auto_68349 ?auto_68350 ) ) ( not ( = ?auto_68349 ?auto_68351 ) ) ( not ( = ?auto_68349 ?auto_68352 ) ) ( not ( = ?auto_68349 ?auto_68353 ) ) ( not ( = ?auto_68349 ?auto_68354 ) ) ( not ( = ?auto_68349 ?auto_68355 ) ) ( not ( = ?auto_68350 ?auto_68351 ) ) ( not ( = ?auto_68350 ?auto_68352 ) ) ( not ( = ?auto_68350 ?auto_68353 ) ) ( not ( = ?auto_68350 ?auto_68354 ) ) ( not ( = ?auto_68350 ?auto_68355 ) ) ( not ( = ?auto_68351 ?auto_68352 ) ) ( not ( = ?auto_68351 ?auto_68353 ) ) ( not ( = ?auto_68351 ?auto_68354 ) ) ( not ( = ?auto_68351 ?auto_68355 ) ) ( not ( = ?auto_68352 ?auto_68353 ) ) ( not ( = ?auto_68352 ?auto_68354 ) ) ( not ( = ?auto_68352 ?auto_68355 ) ) ( not ( = ?auto_68353 ?auto_68354 ) ) ( not ( = ?auto_68353 ?auto_68355 ) ) ( not ( = ?auto_68354 ?auto_68355 ) ) ( ON ?auto_68354 ?auto_68355 ) ( ON ?auto_68353 ?auto_68354 ) ( CLEAR ?auto_68351 ) ( ON ?auto_68352 ?auto_68353 ) ( CLEAR ?auto_68352 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_68347 ?auto_68348 ?auto_68349 ?auto_68350 ?auto_68351 ?auto_68352 )
      ( MAKE-9PILE ?auto_68347 ?auto_68348 ?auto_68349 ?auto_68350 ?auto_68351 ?auto_68352 ?auto_68353 ?auto_68354 ?auto_68355 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_68365 - BLOCK
      ?auto_68366 - BLOCK
      ?auto_68367 - BLOCK
      ?auto_68368 - BLOCK
      ?auto_68369 - BLOCK
      ?auto_68370 - BLOCK
      ?auto_68371 - BLOCK
      ?auto_68372 - BLOCK
      ?auto_68373 - BLOCK
    )
    :vars
    (
      ?auto_68374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68373 ?auto_68374 ) ( ON-TABLE ?auto_68365 ) ( ON ?auto_68366 ?auto_68365 ) ( ON ?auto_68367 ?auto_68366 ) ( ON ?auto_68368 ?auto_68367 ) ( not ( = ?auto_68365 ?auto_68366 ) ) ( not ( = ?auto_68365 ?auto_68367 ) ) ( not ( = ?auto_68365 ?auto_68368 ) ) ( not ( = ?auto_68365 ?auto_68369 ) ) ( not ( = ?auto_68365 ?auto_68370 ) ) ( not ( = ?auto_68365 ?auto_68371 ) ) ( not ( = ?auto_68365 ?auto_68372 ) ) ( not ( = ?auto_68365 ?auto_68373 ) ) ( not ( = ?auto_68365 ?auto_68374 ) ) ( not ( = ?auto_68366 ?auto_68367 ) ) ( not ( = ?auto_68366 ?auto_68368 ) ) ( not ( = ?auto_68366 ?auto_68369 ) ) ( not ( = ?auto_68366 ?auto_68370 ) ) ( not ( = ?auto_68366 ?auto_68371 ) ) ( not ( = ?auto_68366 ?auto_68372 ) ) ( not ( = ?auto_68366 ?auto_68373 ) ) ( not ( = ?auto_68366 ?auto_68374 ) ) ( not ( = ?auto_68367 ?auto_68368 ) ) ( not ( = ?auto_68367 ?auto_68369 ) ) ( not ( = ?auto_68367 ?auto_68370 ) ) ( not ( = ?auto_68367 ?auto_68371 ) ) ( not ( = ?auto_68367 ?auto_68372 ) ) ( not ( = ?auto_68367 ?auto_68373 ) ) ( not ( = ?auto_68367 ?auto_68374 ) ) ( not ( = ?auto_68368 ?auto_68369 ) ) ( not ( = ?auto_68368 ?auto_68370 ) ) ( not ( = ?auto_68368 ?auto_68371 ) ) ( not ( = ?auto_68368 ?auto_68372 ) ) ( not ( = ?auto_68368 ?auto_68373 ) ) ( not ( = ?auto_68368 ?auto_68374 ) ) ( not ( = ?auto_68369 ?auto_68370 ) ) ( not ( = ?auto_68369 ?auto_68371 ) ) ( not ( = ?auto_68369 ?auto_68372 ) ) ( not ( = ?auto_68369 ?auto_68373 ) ) ( not ( = ?auto_68369 ?auto_68374 ) ) ( not ( = ?auto_68370 ?auto_68371 ) ) ( not ( = ?auto_68370 ?auto_68372 ) ) ( not ( = ?auto_68370 ?auto_68373 ) ) ( not ( = ?auto_68370 ?auto_68374 ) ) ( not ( = ?auto_68371 ?auto_68372 ) ) ( not ( = ?auto_68371 ?auto_68373 ) ) ( not ( = ?auto_68371 ?auto_68374 ) ) ( not ( = ?auto_68372 ?auto_68373 ) ) ( not ( = ?auto_68372 ?auto_68374 ) ) ( not ( = ?auto_68373 ?auto_68374 ) ) ( ON ?auto_68372 ?auto_68373 ) ( ON ?auto_68371 ?auto_68372 ) ( ON ?auto_68370 ?auto_68371 ) ( CLEAR ?auto_68368 ) ( ON ?auto_68369 ?auto_68370 ) ( CLEAR ?auto_68369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68365 ?auto_68366 ?auto_68367 ?auto_68368 ?auto_68369 )
      ( MAKE-9PILE ?auto_68365 ?auto_68366 ?auto_68367 ?auto_68368 ?auto_68369 ?auto_68370 ?auto_68371 ?auto_68372 ?auto_68373 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_68384 - BLOCK
      ?auto_68385 - BLOCK
      ?auto_68386 - BLOCK
      ?auto_68387 - BLOCK
      ?auto_68388 - BLOCK
      ?auto_68389 - BLOCK
      ?auto_68390 - BLOCK
      ?auto_68391 - BLOCK
      ?auto_68392 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68392 ) ( ON-TABLE ?auto_68384 ) ( ON ?auto_68385 ?auto_68384 ) ( ON ?auto_68386 ?auto_68385 ) ( ON ?auto_68387 ?auto_68386 ) ( not ( = ?auto_68384 ?auto_68385 ) ) ( not ( = ?auto_68384 ?auto_68386 ) ) ( not ( = ?auto_68384 ?auto_68387 ) ) ( not ( = ?auto_68384 ?auto_68388 ) ) ( not ( = ?auto_68384 ?auto_68389 ) ) ( not ( = ?auto_68384 ?auto_68390 ) ) ( not ( = ?auto_68384 ?auto_68391 ) ) ( not ( = ?auto_68384 ?auto_68392 ) ) ( not ( = ?auto_68385 ?auto_68386 ) ) ( not ( = ?auto_68385 ?auto_68387 ) ) ( not ( = ?auto_68385 ?auto_68388 ) ) ( not ( = ?auto_68385 ?auto_68389 ) ) ( not ( = ?auto_68385 ?auto_68390 ) ) ( not ( = ?auto_68385 ?auto_68391 ) ) ( not ( = ?auto_68385 ?auto_68392 ) ) ( not ( = ?auto_68386 ?auto_68387 ) ) ( not ( = ?auto_68386 ?auto_68388 ) ) ( not ( = ?auto_68386 ?auto_68389 ) ) ( not ( = ?auto_68386 ?auto_68390 ) ) ( not ( = ?auto_68386 ?auto_68391 ) ) ( not ( = ?auto_68386 ?auto_68392 ) ) ( not ( = ?auto_68387 ?auto_68388 ) ) ( not ( = ?auto_68387 ?auto_68389 ) ) ( not ( = ?auto_68387 ?auto_68390 ) ) ( not ( = ?auto_68387 ?auto_68391 ) ) ( not ( = ?auto_68387 ?auto_68392 ) ) ( not ( = ?auto_68388 ?auto_68389 ) ) ( not ( = ?auto_68388 ?auto_68390 ) ) ( not ( = ?auto_68388 ?auto_68391 ) ) ( not ( = ?auto_68388 ?auto_68392 ) ) ( not ( = ?auto_68389 ?auto_68390 ) ) ( not ( = ?auto_68389 ?auto_68391 ) ) ( not ( = ?auto_68389 ?auto_68392 ) ) ( not ( = ?auto_68390 ?auto_68391 ) ) ( not ( = ?auto_68390 ?auto_68392 ) ) ( not ( = ?auto_68391 ?auto_68392 ) ) ( ON ?auto_68391 ?auto_68392 ) ( ON ?auto_68390 ?auto_68391 ) ( ON ?auto_68389 ?auto_68390 ) ( CLEAR ?auto_68387 ) ( ON ?auto_68388 ?auto_68389 ) ( CLEAR ?auto_68388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68384 ?auto_68385 ?auto_68386 ?auto_68387 ?auto_68388 )
      ( MAKE-9PILE ?auto_68384 ?auto_68385 ?auto_68386 ?auto_68387 ?auto_68388 ?auto_68389 ?auto_68390 ?auto_68391 ?auto_68392 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_68402 - BLOCK
      ?auto_68403 - BLOCK
      ?auto_68404 - BLOCK
      ?auto_68405 - BLOCK
      ?auto_68406 - BLOCK
      ?auto_68407 - BLOCK
      ?auto_68408 - BLOCK
      ?auto_68409 - BLOCK
      ?auto_68410 - BLOCK
    )
    :vars
    (
      ?auto_68411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68410 ?auto_68411 ) ( ON-TABLE ?auto_68402 ) ( ON ?auto_68403 ?auto_68402 ) ( ON ?auto_68404 ?auto_68403 ) ( not ( = ?auto_68402 ?auto_68403 ) ) ( not ( = ?auto_68402 ?auto_68404 ) ) ( not ( = ?auto_68402 ?auto_68405 ) ) ( not ( = ?auto_68402 ?auto_68406 ) ) ( not ( = ?auto_68402 ?auto_68407 ) ) ( not ( = ?auto_68402 ?auto_68408 ) ) ( not ( = ?auto_68402 ?auto_68409 ) ) ( not ( = ?auto_68402 ?auto_68410 ) ) ( not ( = ?auto_68402 ?auto_68411 ) ) ( not ( = ?auto_68403 ?auto_68404 ) ) ( not ( = ?auto_68403 ?auto_68405 ) ) ( not ( = ?auto_68403 ?auto_68406 ) ) ( not ( = ?auto_68403 ?auto_68407 ) ) ( not ( = ?auto_68403 ?auto_68408 ) ) ( not ( = ?auto_68403 ?auto_68409 ) ) ( not ( = ?auto_68403 ?auto_68410 ) ) ( not ( = ?auto_68403 ?auto_68411 ) ) ( not ( = ?auto_68404 ?auto_68405 ) ) ( not ( = ?auto_68404 ?auto_68406 ) ) ( not ( = ?auto_68404 ?auto_68407 ) ) ( not ( = ?auto_68404 ?auto_68408 ) ) ( not ( = ?auto_68404 ?auto_68409 ) ) ( not ( = ?auto_68404 ?auto_68410 ) ) ( not ( = ?auto_68404 ?auto_68411 ) ) ( not ( = ?auto_68405 ?auto_68406 ) ) ( not ( = ?auto_68405 ?auto_68407 ) ) ( not ( = ?auto_68405 ?auto_68408 ) ) ( not ( = ?auto_68405 ?auto_68409 ) ) ( not ( = ?auto_68405 ?auto_68410 ) ) ( not ( = ?auto_68405 ?auto_68411 ) ) ( not ( = ?auto_68406 ?auto_68407 ) ) ( not ( = ?auto_68406 ?auto_68408 ) ) ( not ( = ?auto_68406 ?auto_68409 ) ) ( not ( = ?auto_68406 ?auto_68410 ) ) ( not ( = ?auto_68406 ?auto_68411 ) ) ( not ( = ?auto_68407 ?auto_68408 ) ) ( not ( = ?auto_68407 ?auto_68409 ) ) ( not ( = ?auto_68407 ?auto_68410 ) ) ( not ( = ?auto_68407 ?auto_68411 ) ) ( not ( = ?auto_68408 ?auto_68409 ) ) ( not ( = ?auto_68408 ?auto_68410 ) ) ( not ( = ?auto_68408 ?auto_68411 ) ) ( not ( = ?auto_68409 ?auto_68410 ) ) ( not ( = ?auto_68409 ?auto_68411 ) ) ( not ( = ?auto_68410 ?auto_68411 ) ) ( ON ?auto_68409 ?auto_68410 ) ( ON ?auto_68408 ?auto_68409 ) ( ON ?auto_68407 ?auto_68408 ) ( ON ?auto_68406 ?auto_68407 ) ( CLEAR ?auto_68404 ) ( ON ?auto_68405 ?auto_68406 ) ( CLEAR ?auto_68405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68402 ?auto_68403 ?auto_68404 ?auto_68405 )
      ( MAKE-9PILE ?auto_68402 ?auto_68403 ?auto_68404 ?auto_68405 ?auto_68406 ?auto_68407 ?auto_68408 ?auto_68409 ?auto_68410 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_68421 - BLOCK
      ?auto_68422 - BLOCK
      ?auto_68423 - BLOCK
      ?auto_68424 - BLOCK
      ?auto_68425 - BLOCK
      ?auto_68426 - BLOCK
      ?auto_68427 - BLOCK
      ?auto_68428 - BLOCK
      ?auto_68429 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68429 ) ( ON-TABLE ?auto_68421 ) ( ON ?auto_68422 ?auto_68421 ) ( ON ?auto_68423 ?auto_68422 ) ( not ( = ?auto_68421 ?auto_68422 ) ) ( not ( = ?auto_68421 ?auto_68423 ) ) ( not ( = ?auto_68421 ?auto_68424 ) ) ( not ( = ?auto_68421 ?auto_68425 ) ) ( not ( = ?auto_68421 ?auto_68426 ) ) ( not ( = ?auto_68421 ?auto_68427 ) ) ( not ( = ?auto_68421 ?auto_68428 ) ) ( not ( = ?auto_68421 ?auto_68429 ) ) ( not ( = ?auto_68422 ?auto_68423 ) ) ( not ( = ?auto_68422 ?auto_68424 ) ) ( not ( = ?auto_68422 ?auto_68425 ) ) ( not ( = ?auto_68422 ?auto_68426 ) ) ( not ( = ?auto_68422 ?auto_68427 ) ) ( not ( = ?auto_68422 ?auto_68428 ) ) ( not ( = ?auto_68422 ?auto_68429 ) ) ( not ( = ?auto_68423 ?auto_68424 ) ) ( not ( = ?auto_68423 ?auto_68425 ) ) ( not ( = ?auto_68423 ?auto_68426 ) ) ( not ( = ?auto_68423 ?auto_68427 ) ) ( not ( = ?auto_68423 ?auto_68428 ) ) ( not ( = ?auto_68423 ?auto_68429 ) ) ( not ( = ?auto_68424 ?auto_68425 ) ) ( not ( = ?auto_68424 ?auto_68426 ) ) ( not ( = ?auto_68424 ?auto_68427 ) ) ( not ( = ?auto_68424 ?auto_68428 ) ) ( not ( = ?auto_68424 ?auto_68429 ) ) ( not ( = ?auto_68425 ?auto_68426 ) ) ( not ( = ?auto_68425 ?auto_68427 ) ) ( not ( = ?auto_68425 ?auto_68428 ) ) ( not ( = ?auto_68425 ?auto_68429 ) ) ( not ( = ?auto_68426 ?auto_68427 ) ) ( not ( = ?auto_68426 ?auto_68428 ) ) ( not ( = ?auto_68426 ?auto_68429 ) ) ( not ( = ?auto_68427 ?auto_68428 ) ) ( not ( = ?auto_68427 ?auto_68429 ) ) ( not ( = ?auto_68428 ?auto_68429 ) ) ( ON ?auto_68428 ?auto_68429 ) ( ON ?auto_68427 ?auto_68428 ) ( ON ?auto_68426 ?auto_68427 ) ( ON ?auto_68425 ?auto_68426 ) ( CLEAR ?auto_68423 ) ( ON ?auto_68424 ?auto_68425 ) ( CLEAR ?auto_68424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68421 ?auto_68422 ?auto_68423 ?auto_68424 )
      ( MAKE-9PILE ?auto_68421 ?auto_68422 ?auto_68423 ?auto_68424 ?auto_68425 ?auto_68426 ?auto_68427 ?auto_68428 ?auto_68429 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_68439 - BLOCK
      ?auto_68440 - BLOCK
      ?auto_68441 - BLOCK
      ?auto_68442 - BLOCK
      ?auto_68443 - BLOCK
      ?auto_68444 - BLOCK
      ?auto_68445 - BLOCK
      ?auto_68446 - BLOCK
      ?auto_68447 - BLOCK
    )
    :vars
    (
      ?auto_68448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68447 ?auto_68448 ) ( ON-TABLE ?auto_68439 ) ( ON ?auto_68440 ?auto_68439 ) ( not ( = ?auto_68439 ?auto_68440 ) ) ( not ( = ?auto_68439 ?auto_68441 ) ) ( not ( = ?auto_68439 ?auto_68442 ) ) ( not ( = ?auto_68439 ?auto_68443 ) ) ( not ( = ?auto_68439 ?auto_68444 ) ) ( not ( = ?auto_68439 ?auto_68445 ) ) ( not ( = ?auto_68439 ?auto_68446 ) ) ( not ( = ?auto_68439 ?auto_68447 ) ) ( not ( = ?auto_68439 ?auto_68448 ) ) ( not ( = ?auto_68440 ?auto_68441 ) ) ( not ( = ?auto_68440 ?auto_68442 ) ) ( not ( = ?auto_68440 ?auto_68443 ) ) ( not ( = ?auto_68440 ?auto_68444 ) ) ( not ( = ?auto_68440 ?auto_68445 ) ) ( not ( = ?auto_68440 ?auto_68446 ) ) ( not ( = ?auto_68440 ?auto_68447 ) ) ( not ( = ?auto_68440 ?auto_68448 ) ) ( not ( = ?auto_68441 ?auto_68442 ) ) ( not ( = ?auto_68441 ?auto_68443 ) ) ( not ( = ?auto_68441 ?auto_68444 ) ) ( not ( = ?auto_68441 ?auto_68445 ) ) ( not ( = ?auto_68441 ?auto_68446 ) ) ( not ( = ?auto_68441 ?auto_68447 ) ) ( not ( = ?auto_68441 ?auto_68448 ) ) ( not ( = ?auto_68442 ?auto_68443 ) ) ( not ( = ?auto_68442 ?auto_68444 ) ) ( not ( = ?auto_68442 ?auto_68445 ) ) ( not ( = ?auto_68442 ?auto_68446 ) ) ( not ( = ?auto_68442 ?auto_68447 ) ) ( not ( = ?auto_68442 ?auto_68448 ) ) ( not ( = ?auto_68443 ?auto_68444 ) ) ( not ( = ?auto_68443 ?auto_68445 ) ) ( not ( = ?auto_68443 ?auto_68446 ) ) ( not ( = ?auto_68443 ?auto_68447 ) ) ( not ( = ?auto_68443 ?auto_68448 ) ) ( not ( = ?auto_68444 ?auto_68445 ) ) ( not ( = ?auto_68444 ?auto_68446 ) ) ( not ( = ?auto_68444 ?auto_68447 ) ) ( not ( = ?auto_68444 ?auto_68448 ) ) ( not ( = ?auto_68445 ?auto_68446 ) ) ( not ( = ?auto_68445 ?auto_68447 ) ) ( not ( = ?auto_68445 ?auto_68448 ) ) ( not ( = ?auto_68446 ?auto_68447 ) ) ( not ( = ?auto_68446 ?auto_68448 ) ) ( not ( = ?auto_68447 ?auto_68448 ) ) ( ON ?auto_68446 ?auto_68447 ) ( ON ?auto_68445 ?auto_68446 ) ( ON ?auto_68444 ?auto_68445 ) ( ON ?auto_68443 ?auto_68444 ) ( ON ?auto_68442 ?auto_68443 ) ( CLEAR ?auto_68440 ) ( ON ?auto_68441 ?auto_68442 ) ( CLEAR ?auto_68441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68439 ?auto_68440 ?auto_68441 )
      ( MAKE-9PILE ?auto_68439 ?auto_68440 ?auto_68441 ?auto_68442 ?auto_68443 ?auto_68444 ?auto_68445 ?auto_68446 ?auto_68447 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_68458 - BLOCK
      ?auto_68459 - BLOCK
      ?auto_68460 - BLOCK
      ?auto_68461 - BLOCK
      ?auto_68462 - BLOCK
      ?auto_68463 - BLOCK
      ?auto_68464 - BLOCK
      ?auto_68465 - BLOCK
      ?auto_68466 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68466 ) ( ON-TABLE ?auto_68458 ) ( ON ?auto_68459 ?auto_68458 ) ( not ( = ?auto_68458 ?auto_68459 ) ) ( not ( = ?auto_68458 ?auto_68460 ) ) ( not ( = ?auto_68458 ?auto_68461 ) ) ( not ( = ?auto_68458 ?auto_68462 ) ) ( not ( = ?auto_68458 ?auto_68463 ) ) ( not ( = ?auto_68458 ?auto_68464 ) ) ( not ( = ?auto_68458 ?auto_68465 ) ) ( not ( = ?auto_68458 ?auto_68466 ) ) ( not ( = ?auto_68459 ?auto_68460 ) ) ( not ( = ?auto_68459 ?auto_68461 ) ) ( not ( = ?auto_68459 ?auto_68462 ) ) ( not ( = ?auto_68459 ?auto_68463 ) ) ( not ( = ?auto_68459 ?auto_68464 ) ) ( not ( = ?auto_68459 ?auto_68465 ) ) ( not ( = ?auto_68459 ?auto_68466 ) ) ( not ( = ?auto_68460 ?auto_68461 ) ) ( not ( = ?auto_68460 ?auto_68462 ) ) ( not ( = ?auto_68460 ?auto_68463 ) ) ( not ( = ?auto_68460 ?auto_68464 ) ) ( not ( = ?auto_68460 ?auto_68465 ) ) ( not ( = ?auto_68460 ?auto_68466 ) ) ( not ( = ?auto_68461 ?auto_68462 ) ) ( not ( = ?auto_68461 ?auto_68463 ) ) ( not ( = ?auto_68461 ?auto_68464 ) ) ( not ( = ?auto_68461 ?auto_68465 ) ) ( not ( = ?auto_68461 ?auto_68466 ) ) ( not ( = ?auto_68462 ?auto_68463 ) ) ( not ( = ?auto_68462 ?auto_68464 ) ) ( not ( = ?auto_68462 ?auto_68465 ) ) ( not ( = ?auto_68462 ?auto_68466 ) ) ( not ( = ?auto_68463 ?auto_68464 ) ) ( not ( = ?auto_68463 ?auto_68465 ) ) ( not ( = ?auto_68463 ?auto_68466 ) ) ( not ( = ?auto_68464 ?auto_68465 ) ) ( not ( = ?auto_68464 ?auto_68466 ) ) ( not ( = ?auto_68465 ?auto_68466 ) ) ( ON ?auto_68465 ?auto_68466 ) ( ON ?auto_68464 ?auto_68465 ) ( ON ?auto_68463 ?auto_68464 ) ( ON ?auto_68462 ?auto_68463 ) ( ON ?auto_68461 ?auto_68462 ) ( CLEAR ?auto_68459 ) ( ON ?auto_68460 ?auto_68461 ) ( CLEAR ?auto_68460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68458 ?auto_68459 ?auto_68460 )
      ( MAKE-9PILE ?auto_68458 ?auto_68459 ?auto_68460 ?auto_68461 ?auto_68462 ?auto_68463 ?auto_68464 ?auto_68465 ?auto_68466 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_68476 - BLOCK
      ?auto_68477 - BLOCK
      ?auto_68478 - BLOCK
      ?auto_68479 - BLOCK
      ?auto_68480 - BLOCK
      ?auto_68481 - BLOCK
      ?auto_68482 - BLOCK
      ?auto_68483 - BLOCK
      ?auto_68484 - BLOCK
    )
    :vars
    (
      ?auto_68485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68484 ?auto_68485 ) ( ON-TABLE ?auto_68476 ) ( not ( = ?auto_68476 ?auto_68477 ) ) ( not ( = ?auto_68476 ?auto_68478 ) ) ( not ( = ?auto_68476 ?auto_68479 ) ) ( not ( = ?auto_68476 ?auto_68480 ) ) ( not ( = ?auto_68476 ?auto_68481 ) ) ( not ( = ?auto_68476 ?auto_68482 ) ) ( not ( = ?auto_68476 ?auto_68483 ) ) ( not ( = ?auto_68476 ?auto_68484 ) ) ( not ( = ?auto_68476 ?auto_68485 ) ) ( not ( = ?auto_68477 ?auto_68478 ) ) ( not ( = ?auto_68477 ?auto_68479 ) ) ( not ( = ?auto_68477 ?auto_68480 ) ) ( not ( = ?auto_68477 ?auto_68481 ) ) ( not ( = ?auto_68477 ?auto_68482 ) ) ( not ( = ?auto_68477 ?auto_68483 ) ) ( not ( = ?auto_68477 ?auto_68484 ) ) ( not ( = ?auto_68477 ?auto_68485 ) ) ( not ( = ?auto_68478 ?auto_68479 ) ) ( not ( = ?auto_68478 ?auto_68480 ) ) ( not ( = ?auto_68478 ?auto_68481 ) ) ( not ( = ?auto_68478 ?auto_68482 ) ) ( not ( = ?auto_68478 ?auto_68483 ) ) ( not ( = ?auto_68478 ?auto_68484 ) ) ( not ( = ?auto_68478 ?auto_68485 ) ) ( not ( = ?auto_68479 ?auto_68480 ) ) ( not ( = ?auto_68479 ?auto_68481 ) ) ( not ( = ?auto_68479 ?auto_68482 ) ) ( not ( = ?auto_68479 ?auto_68483 ) ) ( not ( = ?auto_68479 ?auto_68484 ) ) ( not ( = ?auto_68479 ?auto_68485 ) ) ( not ( = ?auto_68480 ?auto_68481 ) ) ( not ( = ?auto_68480 ?auto_68482 ) ) ( not ( = ?auto_68480 ?auto_68483 ) ) ( not ( = ?auto_68480 ?auto_68484 ) ) ( not ( = ?auto_68480 ?auto_68485 ) ) ( not ( = ?auto_68481 ?auto_68482 ) ) ( not ( = ?auto_68481 ?auto_68483 ) ) ( not ( = ?auto_68481 ?auto_68484 ) ) ( not ( = ?auto_68481 ?auto_68485 ) ) ( not ( = ?auto_68482 ?auto_68483 ) ) ( not ( = ?auto_68482 ?auto_68484 ) ) ( not ( = ?auto_68482 ?auto_68485 ) ) ( not ( = ?auto_68483 ?auto_68484 ) ) ( not ( = ?auto_68483 ?auto_68485 ) ) ( not ( = ?auto_68484 ?auto_68485 ) ) ( ON ?auto_68483 ?auto_68484 ) ( ON ?auto_68482 ?auto_68483 ) ( ON ?auto_68481 ?auto_68482 ) ( ON ?auto_68480 ?auto_68481 ) ( ON ?auto_68479 ?auto_68480 ) ( ON ?auto_68478 ?auto_68479 ) ( CLEAR ?auto_68476 ) ( ON ?auto_68477 ?auto_68478 ) ( CLEAR ?auto_68477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68476 ?auto_68477 )
      ( MAKE-9PILE ?auto_68476 ?auto_68477 ?auto_68478 ?auto_68479 ?auto_68480 ?auto_68481 ?auto_68482 ?auto_68483 ?auto_68484 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_68495 - BLOCK
      ?auto_68496 - BLOCK
      ?auto_68497 - BLOCK
      ?auto_68498 - BLOCK
      ?auto_68499 - BLOCK
      ?auto_68500 - BLOCK
      ?auto_68501 - BLOCK
      ?auto_68502 - BLOCK
      ?auto_68503 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68503 ) ( ON-TABLE ?auto_68495 ) ( not ( = ?auto_68495 ?auto_68496 ) ) ( not ( = ?auto_68495 ?auto_68497 ) ) ( not ( = ?auto_68495 ?auto_68498 ) ) ( not ( = ?auto_68495 ?auto_68499 ) ) ( not ( = ?auto_68495 ?auto_68500 ) ) ( not ( = ?auto_68495 ?auto_68501 ) ) ( not ( = ?auto_68495 ?auto_68502 ) ) ( not ( = ?auto_68495 ?auto_68503 ) ) ( not ( = ?auto_68496 ?auto_68497 ) ) ( not ( = ?auto_68496 ?auto_68498 ) ) ( not ( = ?auto_68496 ?auto_68499 ) ) ( not ( = ?auto_68496 ?auto_68500 ) ) ( not ( = ?auto_68496 ?auto_68501 ) ) ( not ( = ?auto_68496 ?auto_68502 ) ) ( not ( = ?auto_68496 ?auto_68503 ) ) ( not ( = ?auto_68497 ?auto_68498 ) ) ( not ( = ?auto_68497 ?auto_68499 ) ) ( not ( = ?auto_68497 ?auto_68500 ) ) ( not ( = ?auto_68497 ?auto_68501 ) ) ( not ( = ?auto_68497 ?auto_68502 ) ) ( not ( = ?auto_68497 ?auto_68503 ) ) ( not ( = ?auto_68498 ?auto_68499 ) ) ( not ( = ?auto_68498 ?auto_68500 ) ) ( not ( = ?auto_68498 ?auto_68501 ) ) ( not ( = ?auto_68498 ?auto_68502 ) ) ( not ( = ?auto_68498 ?auto_68503 ) ) ( not ( = ?auto_68499 ?auto_68500 ) ) ( not ( = ?auto_68499 ?auto_68501 ) ) ( not ( = ?auto_68499 ?auto_68502 ) ) ( not ( = ?auto_68499 ?auto_68503 ) ) ( not ( = ?auto_68500 ?auto_68501 ) ) ( not ( = ?auto_68500 ?auto_68502 ) ) ( not ( = ?auto_68500 ?auto_68503 ) ) ( not ( = ?auto_68501 ?auto_68502 ) ) ( not ( = ?auto_68501 ?auto_68503 ) ) ( not ( = ?auto_68502 ?auto_68503 ) ) ( ON ?auto_68502 ?auto_68503 ) ( ON ?auto_68501 ?auto_68502 ) ( ON ?auto_68500 ?auto_68501 ) ( ON ?auto_68499 ?auto_68500 ) ( ON ?auto_68498 ?auto_68499 ) ( ON ?auto_68497 ?auto_68498 ) ( CLEAR ?auto_68495 ) ( ON ?auto_68496 ?auto_68497 ) ( CLEAR ?auto_68496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68495 ?auto_68496 )
      ( MAKE-9PILE ?auto_68495 ?auto_68496 ?auto_68497 ?auto_68498 ?auto_68499 ?auto_68500 ?auto_68501 ?auto_68502 ?auto_68503 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_68513 - BLOCK
      ?auto_68514 - BLOCK
      ?auto_68515 - BLOCK
      ?auto_68516 - BLOCK
      ?auto_68517 - BLOCK
      ?auto_68518 - BLOCK
      ?auto_68519 - BLOCK
      ?auto_68520 - BLOCK
      ?auto_68521 - BLOCK
    )
    :vars
    (
      ?auto_68522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68521 ?auto_68522 ) ( not ( = ?auto_68513 ?auto_68514 ) ) ( not ( = ?auto_68513 ?auto_68515 ) ) ( not ( = ?auto_68513 ?auto_68516 ) ) ( not ( = ?auto_68513 ?auto_68517 ) ) ( not ( = ?auto_68513 ?auto_68518 ) ) ( not ( = ?auto_68513 ?auto_68519 ) ) ( not ( = ?auto_68513 ?auto_68520 ) ) ( not ( = ?auto_68513 ?auto_68521 ) ) ( not ( = ?auto_68513 ?auto_68522 ) ) ( not ( = ?auto_68514 ?auto_68515 ) ) ( not ( = ?auto_68514 ?auto_68516 ) ) ( not ( = ?auto_68514 ?auto_68517 ) ) ( not ( = ?auto_68514 ?auto_68518 ) ) ( not ( = ?auto_68514 ?auto_68519 ) ) ( not ( = ?auto_68514 ?auto_68520 ) ) ( not ( = ?auto_68514 ?auto_68521 ) ) ( not ( = ?auto_68514 ?auto_68522 ) ) ( not ( = ?auto_68515 ?auto_68516 ) ) ( not ( = ?auto_68515 ?auto_68517 ) ) ( not ( = ?auto_68515 ?auto_68518 ) ) ( not ( = ?auto_68515 ?auto_68519 ) ) ( not ( = ?auto_68515 ?auto_68520 ) ) ( not ( = ?auto_68515 ?auto_68521 ) ) ( not ( = ?auto_68515 ?auto_68522 ) ) ( not ( = ?auto_68516 ?auto_68517 ) ) ( not ( = ?auto_68516 ?auto_68518 ) ) ( not ( = ?auto_68516 ?auto_68519 ) ) ( not ( = ?auto_68516 ?auto_68520 ) ) ( not ( = ?auto_68516 ?auto_68521 ) ) ( not ( = ?auto_68516 ?auto_68522 ) ) ( not ( = ?auto_68517 ?auto_68518 ) ) ( not ( = ?auto_68517 ?auto_68519 ) ) ( not ( = ?auto_68517 ?auto_68520 ) ) ( not ( = ?auto_68517 ?auto_68521 ) ) ( not ( = ?auto_68517 ?auto_68522 ) ) ( not ( = ?auto_68518 ?auto_68519 ) ) ( not ( = ?auto_68518 ?auto_68520 ) ) ( not ( = ?auto_68518 ?auto_68521 ) ) ( not ( = ?auto_68518 ?auto_68522 ) ) ( not ( = ?auto_68519 ?auto_68520 ) ) ( not ( = ?auto_68519 ?auto_68521 ) ) ( not ( = ?auto_68519 ?auto_68522 ) ) ( not ( = ?auto_68520 ?auto_68521 ) ) ( not ( = ?auto_68520 ?auto_68522 ) ) ( not ( = ?auto_68521 ?auto_68522 ) ) ( ON ?auto_68520 ?auto_68521 ) ( ON ?auto_68519 ?auto_68520 ) ( ON ?auto_68518 ?auto_68519 ) ( ON ?auto_68517 ?auto_68518 ) ( ON ?auto_68516 ?auto_68517 ) ( ON ?auto_68515 ?auto_68516 ) ( ON ?auto_68514 ?auto_68515 ) ( ON ?auto_68513 ?auto_68514 ) ( CLEAR ?auto_68513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68513 )
      ( MAKE-9PILE ?auto_68513 ?auto_68514 ?auto_68515 ?auto_68516 ?auto_68517 ?auto_68518 ?auto_68519 ?auto_68520 ?auto_68521 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_68532 - BLOCK
      ?auto_68533 - BLOCK
      ?auto_68534 - BLOCK
      ?auto_68535 - BLOCK
      ?auto_68536 - BLOCK
      ?auto_68537 - BLOCK
      ?auto_68538 - BLOCK
      ?auto_68539 - BLOCK
      ?auto_68540 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68540 ) ( not ( = ?auto_68532 ?auto_68533 ) ) ( not ( = ?auto_68532 ?auto_68534 ) ) ( not ( = ?auto_68532 ?auto_68535 ) ) ( not ( = ?auto_68532 ?auto_68536 ) ) ( not ( = ?auto_68532 ?auto_68537 ) ) ( not ( = ?auto_68532 ?auto_68538 ) ) ( not ( = ?auto_68532 ?auto_68539 ) ) ( not ( = ?auto_68532 ?auto_68540 ) ) ( not ( = ?auto_68533 ?auto_68534 ) ) ( not ( = ?auto_68533 ?auto_68535 ) ) ( not ( = ?auto_68533 ?auto_68536 ) ) ( not ( = ?auto_68533 ?auto_68537 ) ) ( not ( = ?auto_68533 ?auto_68538 ) ) ( not ( = ?auto_68533 ?auto_68539 ) ) ( not ( = ?auto_68533 ?auto_68540 ) ) ( not ( = ?auto_68534 ?auto_68535 ) ) ( not ( = ?auto_68534 ?auto_68536 ) ) ( not ( = ?auto_68534 ?auto_68537 ) ) ( not ( = ?auto_68534 ?auto_68538 ) ) ( not ( = ?auto_68534 ?auto_68539 ) ) ( not ( = ?auto_68534 ?auto_68540 ) ) ( not ( = ?auto_68535 ?auto_68536 ) ) ( not ( = ?auto_68535 ?auto_68537 ) ) ( not ( = ?auto_68535 ?auto_68538 ) ) ( not ( = ?auto_68535 ?auto_68539 ) ) ( not ( = ?auto_68535 ?auto_68540 ) ) ( not ( = ?auto_68536 ?auto_68537 ) ) ( not ( = ?auto_68536 ?auto_68538 ) ) ( not ( = ?auto_68536 ?auto_68539 ) ) ( not ( = ?auto_68536 ?auto_68540 ) ) ( not ( = ?auto_68537 ?auto_68538 ) ) ( not ( = ?auto_68537 ?auto_68539 ) ) ( not ( = ?auto_68537 ?auto_68540 ) ) ( not ( = ?auto_68538 ?auto_68539 ) ) ( not ( = ?auto_68538 ?auto_68540 ) ) ( not ( = ?auto_68539 ?auto_68540 ) ) ( ON ?auto_68539 ?auto_68540 ) ( ON ?auto_68538 ?auto_68539 ) ( ON ?auto_68537 ?auto_68538 ) ( ON ?auto_68536 ?auto_68537 ) ( ON ?auto_68535 ?auto_68536 ) ( ON ?auto_68534 ?auto_68535 ) ( ON ?auto_68533 ?auto_68534 ) ( ON ?auto_68532 ?auto_68533 ) ( CLEAR ?auto_68532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68532 )
      ( MAKE-9PILE ?auto_68532 ?auto_68533 ?auto_68534 ?auto_68535 ?auto_68536 ?auto_68537 ?auto_68538 ?auto_68539 ?auto_68540 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_68550 - BLOCK
      ?auto_68551 - BLOCK
      ?auto_68552 - BLOCK
      ?auto_68553 - BLOCK
      ?auto_68554 - BLOCK
      ?auto_68555 - BLOCK
      ?auto_68556 - BLOCK
      ?auto_68557 - BLOCK
      ?auto_68558 - BLOCK
    )
    :vars
    (
      ?auto_68559 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68550 ?auto_68551 ) ) ( not ( = ?auto_68550 ?auto_68552 ) ) ( not ( = ?auto_68550 ?auto_68553 ) ) ( not ( = ?auto_68550 ?auto_68554 ) ) ( not ( = ?auto_68550 ?auto_68555 ) ) ( not ( = ?auto_68550 ?auto_68556 ) ) ( not ( = ?auto_68550 ?auto_68557 ) ) ( not ( = ?auto_68550 ?auto_68558 ) ) ( not ( = ?auto_68551 ?auto_68552 ) ) ( not ( = ?auto_68551 ?auto_68553 ) ) ( not ( = ?auto_68551 ?auto_68554 ) ) ( not ( = ?auto_68551 ?auto_68555 ) ) ( not ( = ?auto_68551 ?auto_68556 ) ) ( not ( = ?auto_68551 ?auto_68557 ) ) ( not ( = ?auto_68551 ?auto_68558 ) ) ( not ( = ?auto_68552 ?auto_68553 ) ) ( not ( = ?auto_68552 ?auto_68554 ) ) ( not ( = ?auto_68552 ?auto_68555 ) ) ( not ( = ?auto_68552 ?auto_68556 ) ) ( not ( = ?auto_68552 ?auto_68557 ) ) ( not ( = ?auto_68552 ?auto_68558 ) ) ( not ( = ?auto_68553 ?auto_68554 ) ) ( not ( = ?auto_68553 ?auto_68555 ) ) ( not ( = ?auto_68553 ?auto_68556 ) ) ( not ( = ?auto_68553 ?auto_68557 ) ) ( not ( = ?auto_68553 ?auto_68558 ) ) ( not ( = ?auto_68554 ?auto_68555 ) ) ( not ( = ?auto_68554 ?auto_68556 ) ) ( not ( = ?auto_68554 ?auto_68557 ) ) ( not ( = ?auto_68554 ?auto_68558 ) ) ( not ( = ?auto_68555 ?auto_68556 ) ) ( not ( = ?auto_68555 ?auto_68557 ) ) ( not ( = ?auto_68555 ?auto_68558 ) ) ( not ( = ?auto_68556 ?auto_68557 ) ) ( not ( = ?auto_68556 ?auto_68558 ) ) ( not ( = ?auto_68557 ?auto_68558 ) ) ( ON ?auto_68550 ?auto_68559 ) ( not ( = ?auto_68558 ?auto_68559 ) ) ( not ( = ?auto_68557 ?auto_68559 ) ) ( not ( = ?auto_68556 ?auto_68559 ) ) ( not ( = ?auto_68555 ?auto_68559 ) ) ( not ( = ?auto_68554 ?auto_68559 ) ) ( not ( = ?auto_68553 ?auto_68559 ) ) ( not ( = ?auto_68552 ?auto_68559 ) ) ( not ( = ?auto_68551 ?auto_68559 ) ) ( not ( = ?auto_68550 ?auto_68559 ) ) ( ON ?auto_68551 ?auto_68550 ) ( ON ?auto_68552 ?auto_68551 ) ( ON ?auto_68553 ?auto_68552 ) ( ON ?auto_68554 ?auto_68553 ) ( ON ?auto_68555 ?auto_68554 ) ( ON ?auto_68556 ?auto_68555 ) ( ON ?auto_68557 ?auto_68556 ) ( ON ?auto_68558 ?auto_68557 ) ( CLEAR ?auto_68558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_68558 ?auto_68557 ?auto_68556 ?auto_68555 ?auto_68554 ?auto_68553 ?auto_68552 ?auto_68551 ?auto_68550 )
      ( MAKE-9PILE ?auto_68550 ?auto_68551 ?auto_68552 ?auto_68553 ?auto_68554 ?auto_68555 ?auto_68556 ?auto_68557 ?auto_68558 ) )
  )

)

