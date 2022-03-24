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

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58461 - BLOCK
      ?auto_58462 - BLOCK
      ?auto_58463 - BLOCK
      ?auto_58464 - BLOCK
      ?auto_58465 - BLOCK
      ?auto_58466 - BLOCK
    )
    :vars
    (
      ?auto_58467 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58467 ?auto_58466 ) ( CLEAR ?auto_58467 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58461 ) ( ON ?auto_58462 ?auto_58461 ) ( ON ?auto_58463 ?auto_58462 ) ( ON ?auto_58464 ?auto_58463 ) ( ON ?auto_58465 ?auto_58464 ) ( ON ?auto_58466 ?auto_58465 ) ( not ( = ?auto_58461 ?auto_58462 ) ) ( not ( = ?auto_58461 ?auto_58463 ) ) ( not ( = ?auto_58461 ?auto_58464 ) ) ( not ( = ?auto_58461 ?auto_58465 ) ) ( not ( = ?auto_58461 ?auto_58466 ) ) ( not ( = ?auto_58461 ?auto_58467 ) ) ( not ( = ?auto_58462 ?auto_58463 ) ) ( not ( = ?auto_58462 ?auto_58464 ) ) ( not ( = ?auto_58462 ?auto_58465 ) ) ( not ( = ?auto_58462 ?auto_58466 ) ) ( not ( = ?auto_58462 ?auto_58467 ) ) ( not ( = ?auto_58463 ?auto_58464 ) ) ( not ( = ?auto_58463 ?auto_58465 ) ) ( not ( = ?auto_58463 ?auto_58466 ) ) ( not ( = ?auto_58463 ?auto_58467 ) ) ( not ( = ?auto_58464 ?auto_58465 ) ) ( not ( = ?auto_58464 ?auto_58466 ) ) ( not ( = ?auto_58464 ?auto_58467 ) ) ( not ( = ?auto_58465 ?auto_58466 ) ) ( not ( = ?auto_58465 ?auto_58467 ) ) ( not ( = ?auto_58466 ?auto_58467 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58467 ?auto_58466 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58469 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_58469 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_58469 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58470 - BLOCK
    )
    :vars
    (
      ?auto_58471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58470 ?auto_58471 ) ( CLEAR ?auto_58470 ) ( HAND-EMPTY ) ( not ( = ?auto_58470 ?auto_58471 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58470 ?auto_58471 )
      ( MAKE-1PILE ?auto_58470 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58477 - BLOCK
      ?auto_58478 - BLOCK
      ?auto_58479 - BLOCK
      ?auto_58480 - BLOCK
      ?auto_58481 - BLOCK
    )
    :vars
    (
      ?auto_58482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58482 ?auto_58481 ) ( CLEAR ?auto_58482 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58477 ) ( ON ?auto_58478 ?auto_58477 ) ( ON ?auto_58479 ?auto_58478 ) ( ON ?auto_58480 ?auto_58479 ) ( ON ?auto_58481 ?auto_58480 ) ( not ( = ?auto_58477 ?auto_58478 ) ) ( not ( = ?auto_58477 ?auto_58479 ) ) ( not ( = ?auto_58477 ?auto_58480 ) ) ( not ( = ?auto_58477 ?auto_58481 ) ) ( not ( = ?auto_58477 ?auto_58482 ) ) ( not ( = ?auto_58478 ?auto_58479 ) ) ( not ( = ?auto_58478 ?auto_58480 ) ) ( not ( = ?auto_58478 ?auto_58481 ) ) ( not ( = ?auto_58478 ?auto_58482 ) ) ( not ( = ?auto_58479 ?auto_58480 ) ) ( not ( = ?auto_58479 ?auto_58481 ) ) ( not ( = ?auto_58479 ?auto_58482 ) ) ( not ( = ?auto_58480 ?auto_58481 ) ) ( not ( = ?auto_58480 ?auto_58482 ) ) ( not ( = ?auto_58481 ?auto_58482 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58482 ?auto_58481 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58483 - BLOCK
      ?auto_58484 - BLOCK
      ?auto_58485 - BLOCK
      ?auto_58486 - BLOCK
      ?auto_58487 - BLOCK
    )
    :vars
    (
      ?auto_58488 - BLOCK
      ?auto_58489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58488 ?auto_58487 ) ( CLEAR ?auto_58488 ) ( ON-TABLE ?auto_58483 ) ( ON ?auto_58484 ?auto_58483 ) ( ON ?auto_58485 ?auto_58484 ) ( ON ?auto_58486 ?auto_58485 ) ( ON ?auto_58487 ?auto_58486 ) ( not ( = ?auto_58483 ?auto_58484 ) ) ( not ( = ?auto_58483 ?auto_58485 ) ) ( not ( = ?auto_58483 ?auto_58486 ) ) ( not ( = ?auto_58483 ?auto_58487 ) ) ( not ( = ?auto_58483 ?auto_58488 ) ) ( not ( = ?auto_58484 ?auto_58485 ) ) ( not ( = ?auto_58484 ?auto_58486 ) ) ( not ( = ?auto_58484 ?auto_58487 ) ) ( not ( = ?auto_58484 ?auto_58488 ) ) ( not ( = ?auto_58485 ?auto_58486 ) ) ( not ( = ?auto_58485 ?auto_58487 ) ) ( not ( = ?auto_58485 ?auto_58488 ) ) ( not ( = ?auto_58486 ?auto_58487 ) ) ( not ( = ?auto_58486 ?auto_58488 ) ) ( not ( = ?auto_58487 ?auto_58488 ) ) ( HOLDING ?auto_58489 ) ( not ( = ?auto_58483 ?auto_58489 ) ) ( not ( = ?auto_58484 ?auto_58489 ) ) ( not ( = ?auto_58485 ?auto_58489 ) ) ( not ( = ?auto_58486 ?auto_58489 ) ) ( not ( = ?auto_58487 ?auto_58489 ) ) ( not ( = ?auto_58488 ?auto_58489 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_58489 )
      ( MAKE-5PILE ?auto_58483 ?auto_58484 ?auto_58485 ?auto_58486 ?auto_58487 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58490 - BLOCK
      ?auto_58491 - BLOCK
      ?auto_58492 - BLOCK
      ?auto_58493 - BLOCK
      ?auto_58494 - BLOCK
    )
    :vars
    (
      ?auto_58496 - BLOCK
      ?auto_58495 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58496 ?auto_58494 ) ( ON-TABLE ?auto_58490 ) ( ON ?auto_58491 ?auto_58490 ) ( ON ?auto_58492 ?auto_58491 ) ( ON ?auto_58493 ?auto_58492 ) ( ON ?auto_58494 ?auto_58493 ) ( not ( = ?auto_58490 ?auto_58491 ) ) ( not ( = ?auto_58490 ?auto_58492 ) ) ( not ( = ?auto_58490 ?auto_58493 ) ) ( not ( = ?auto_58490 ?auto_58494 ) ) ( not ( = ?auto_58490 ?auto_58496 ) ) ( not ( = ?auto_58491 ?auto_58492 ) ) ( not ( = ?auto_58491 ?auto_58493 ) ) ( not ( = ?auto_58491 ?auto_58494 ) ) ( not ( = ?auto_58491 ?auto_58496 ) ) ( not ( = ?auto_58492 ?auto_58493 ) ) ( not ( = ?auto_58492 ?auto_58494 ) ) ( not ( = ?auto_58492 ?auto_58496 ) ) ( not ( = ?auto_58493 ?auto_58494 ) ) ( not ( = ?auto_58493 ?auto_58496 ) ) ( not ( = ?auto_58494 ?auto_58496 ) ) ( not ( = ?auto_58490 ?auto_58495 ) ) ( not ( = ?auto_58491 ?auto_58495 ) ) ( not ( = ?auto_58492 ?auto_58495 ) ) ( not ( = ?auto_58493 ?auto_58495 ) ) ( not ( = ?auto_58494 ?auto_58495 ) ) ( not ( = ?auto_58496 ?auto_58495 ) ) ( ON ?auto_58495 ?auto_58496 ) ( CLEAR ?auto_58495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_58490 ?auto_58491 ?auto_58492 ?auto_58493 ?auto_58494 ?auto_58496 )
      ( MAKE-5PILE ?auto_58490 ?auto_58491 ?auto_58492 ?auto_58493 ?auto_58494 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58499 - BLOCK
      ?auto_58500 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_58500 ) ( CLEAR ?auto_58499 ) ( ON-TABLE ?auto_58499 ) ( not ( = ?auto_58499 ?auto_58500 ) ) )
    :subtasks
    ( ( !STACK ?auto_58500 ?auto_58499 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58501 - BLOCK
      ?auto_58502 - BLOCK
    )
    :vars
    (
      ?auto_58503 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_58501 ) ( ON-TABLE ?auto_58501 ) ( not ( = ?auto_58501 ?auto_58502 ) ) ( ON ?auto_58502 ?auto_58503 ) ( CLEAR ?auto_58502 ) ( HAND-EMPTY ) ( not ( = ?auto_58501 ?auto_58503 ) ) ( not ( = ?auto_58502 ?auto_58503 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58502 ?auto_58503 )
      ( MAKE-2PILE ?auto_58501 ?auto_58502 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58504 - BLOCK
      ?auto_58505 - BLOCK
    )
    :vars
    (
      ?auto_58506 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58504 ?auto_58505 ) ) ( ON ?auto_58505 ?auto_58506 ) ( CLEAR ?auto_58505 ) ( not ( = ?auto_58504 ?auto_58506 ) ) ( not ( = ?auto_58505 ?auto_58506 ) ) ( HOLDING ?auto_58504 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58504 )
      ( MAKE-2PILE ?auto_58504 ?auto_58505 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58507 - BLOCK
      ?auto_58508 - BLOCK
    )
    :vars
    (
      ?auto_58509 - BLOCK
      ?auto_58511 - BLOCK
      ?auto_58513 - BLOCK
      ?auto_58510 - BLOCK
      ?auto_58512 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58507 ?auto_58508 ) ) ( ON ?auto_58508 ?auto_58509 ) ( not ( = ?auto_58507 ?auto_58509 ) ) ( not ( = ?auto_58508 ?auto_58509 ) ) ( ON ?auto_58507 ?auto_58508 ) ( CLEAR ?auto_58507 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58511 ) ( ON ?auto_58513 ?auto_58511 ) ( ON ?auto_58510 ?auto_58513 ) ( ON ?auto_58512 ?auto_58510 ) ( ON ?auto_58509 ?auto_58512 ) ( not ( = ?auto_58511 ?auto_58513 ) ) ( not ( = ?auto_58511 ?auto_58510 ) ) ( not ( = ?auto_58511 ?auto_58512 ) ) ( not ( = ?auto_58511 ?auto_58509 ) ) ( not ( = ?auto_58511 ?auto_58508 ) ) ( not ( = ?auto_58511 ?auto_58507 ) ) ( not ( = ?auto_58513 ?auto_58510 ) ) ( not ( = ?auto_58513 ?auto_58512 ) ) ( not ( = ?auto_58513 ?auto_58509 ) ) ( not ( = ?auto_58513 ?auto_58508 ) ) ( not ( = ?auto_58513 ?auto_58507 ) ) ( not ( = ?auto_58510 ?auto_58512 ) ) ( not ( = ?auto_58510 ?auto_58509 ) ) ( not ( = ?auto_58510 ?auto_58508 ) ) ( not ( = ?auto_58510 ?auto_58507 ) ) ( not ( = ?auto_58512 ?auto_58509 ) ) ( not ( = ?auto_58512 ?auto_58508 ) ) ( not ( = ?auto_58512 ?auto_58507 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_58511 ?auto_58513 ?auto_58510 ?auto_58512 ?auto_58509 ?auto_58508 )
      ( MAKE-2PILE ?auto_58507 ?auto_58508 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58518 - BLOCK
      ?auto_58519 - BLOCK
      ?auto_58520 - BLOCK
      ?auto_58521 - BLOCK
    )
    :vars
    (
      ?auto_58522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58522 ?auto_58521 ) ( CLEAR ?auto_58522 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58518 ) ( ON ?auto_58519 ?auto_58518 ) ( ON ?auto_58520 ?auto_58519 ) ( ON ?auto_58521 ?auto_58520 ) ( not ( = ?auto_58518 ?auto_58519 ) ) ( not ( = ?auto_58518 ?auto_58520 ) ) ( not ( = ?auto_58518 ?auto_58521 ) ) ( not ( = ?auto_58518 ?auto_58522 ) ) ( not ( = ?auto_58519 ?auto_58520 ) ) ( not ( = ?auto_58519 ?auto_58521 ) ) ( not ( = ?auto_58519 ?auto_58522 ) ) ( not ( = ?auto_58520 ?auto_58521 ) ) ( not ( = ?auto_58520 ?auto_58522 ) ) ( not ( = ?auto_58521 ?auto_58522 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58522 ?auto_58521 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58523 - BLOCK
      ?auto_58524 - BLOCK
      ?auto_58525 - BLOCK
      ?auto_58526 - BLOCK
    )
    :vars
    (
      ?auto_58527 - BLOCK
      ?auto_58528 - BLOCK
      ?auto_58529 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58527 ?auto_58526 ) ( CLEAR ?auto_58527 ) ( ON-TABLE ?auto_58523 ) ( ON ?auto_58524 ?auto_58523 ) ( ON ?auto_58525 ?auto_58524 ) ( ON ?auto_58526 ?auto_58525 ) ( not ( = ?auto_58523 ?auto_58524 ) ) ( not ( = ?auto_58523 ?auto_58525 ) ) ( not ( = ?auto_58523 ?auto_58526 ) ) ( not ( = ?auto_58523 ?auto_58527 ) ) ( not ( = ?auto_58524 ?auto_58525 ) ) ( not ( = ?auto_58524 ?auto_58526 ) ) ( not ( = ?auto_58524 ?auto_58527 ) ) ( not ( = ?auto_58525 ?auto_58526 ) ) ( not ( = ?auto_58525 ?auto_58527 ) ) ( not ( = ?auto_58526 ?auto_58527 ) ) ( HOLDING ?auto_58528 ) ( CLEAR ?auto_58529 ) ( not ( = ?auto_58523 ?auto_58528 ) ) ( not ( = ?auto_58523 ?auto_58529 ) ) ( not ( = ?auto_58524 ?auto_58528 ) ) ( not ( = ?auto_58524 ?auto_58529 ) ) ( not ( = ?auto_58525 ?auto_58528 ) ) ( not ( = ?auto_58525 ?auto_58529 ) ) ( not ( = ?auto_58526 ?auto_58528 ) ) ( not ( = ?auto_58526 ?auto_58529 ) ) ( not ( = ?auto_58527 ?auto_58528 ) ) ( not ( = ?auto_58527 ?auto_58529 ) ) ( not ( = ?auto_58528 ?auto_58529 ) ) )
    :subtasks
    ( ( !STACK ?auto_58528 ?auto_58529 )
      ( MAKE-4PILE ?auto_58523 ?auto_58524 ?auto_58525 ?auto_58526 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_59129 - BLOCK
      ?auto_59130 - BLOCK
      ?auto_59131 - BLOCK
      ?auto_59132 - BLOCK
    )
    :vars
    (
      ?auto_59134 - BLOCK
      ?auto_59133 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59134 ?auto_59132 ) ( ON-TABLE ?auto_59129 ) ( ON ?auto_59130 ?auto_59129 ) ( ON ?auto_59131 ?auto_59130 ) ( ON ?auto_59132 ?auto_59131 ) ( not ( = ?auto_59129 ?auto_59130 ) ) ( not ( = ?auto_59129 ?auto_59131 ) ) ( not ( = ?auto_59129 ?auto_59132 ) ) ( not ( = ?auto_59129 ?auto_59134 ) ) ( not ( = ?auto_59130 ?auto_59131 ) ) ( not ( = ?auto_59130 ?auto_59132 ) ) ( not ( = ?auto_59130 ?auto_59134 ) ) ( not ( = ?auto_59131 ?auto_59132 ) ) ( not ( = ?auto_59131 ?auto_59134 ) ) ( not ( = ?auto_59132 ?auto_59134 ) ) ( not ( = ?auto_59129 ?auto_59133 ) ) ( not ( = ?auto_59130 ?auto_59133 ) ) ( not ( = ?auto_59131 ?auto_59133 ) ) ( not ( = ?auto_59132 ?auto_59133 ) ) ( not ( = ?auto_59134 ?auto_59133 ) ) ( ON ?auto_59133 ?auto_59134 ) ( CLEAR ?auto_59133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59129 ?auto_59130 ?auto_59131 ?auto_59132 ?auto_59134 )
      ( MAKE-4PILE ?auto_59129 ?auto_59130 ?auto_59131 ?auto_59132 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58537 - BLOCK
      ?auto_58538 - BLOCK
      ?auto_58539 - BLOCK
      ?auto_58540 - BLOCK
    )
    :vars
    (
      ?auto_58541 - BLOCK
      ?auto_58543 - BLOCK
      ?auto_58542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58541 ?auto_58540 ) ( ON-TABLE ?auto_58537 ) ( ON ?auto_58538 ?auto_58537 ) ( ON ?auto_58539 ?auto_58538 ) ( ON ?auto_58540 ?auto_58539 ) ( not ( = ?auto_58537 ?auto_58538 ) ) ( not ( = ?auto_58537 ?auto_58539 ) ) ( not ( = ?auto_58537 ?auto_58540 ) ) ( not ( = ?auto_58537 ?auto_58541 ) ) ( not ( = ?auto_58538 ?auto_58539 ) ) ( not ( = ?auto_58538 ?auto_58540 ) ) ( not ( = ?auto_58538 ?auto_58541 ) ) ( not ( = ?auto_58539 ?auto_58540 ) ) ( not ( = ?auto_58539 ?auto_58541 ) ) ( not ( = ?auto_58540 ?auto_58541 ) ) ( not ( = ?auto_58537 ?auto_58543 ) ) ( not ( = ?auto_58537 ?auto_58542 ) ) ( not ( = ?auto_58538 ?auto_58543 ) ) ( not ( = ?auto_58538 ?auto_58542 ) ) ( not ( = ?auto_58539 ?auto_58543 ) ) ( not ( = ?auto_58539 ?auto_58542 ) ) ( not ( = ?auto_58540 ?auto_58543 ) ) ( not ( = ?auto_58540 ?auto_58542 ) ) ( not ( = ?auto_58541 ?auto_58543 ) ) ( not ( = ?auto_58541 ?auto_58542 ) ) ( not ( = ?auto_58543 ?auto_58542 ) ) ( ON ?auto_58543 ?auto_58541 ) ( CLEAR ?auto_58543 ) ( HOLDING ?auto_58542 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58542 )
      ( MAKE-4PILE ?auto_58537 ?auto_58538 ?auto_58539 ?auto_58540 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58544 - BLOCK
      ?auto_58545 - BLOCK
      ?auto_58546 - BLOCK
      ?auto_58547 - BLOCK
    )
    :vars
    (
      ?auto_58550 - BLOCK
      ?auto_58549 - BLOCK
      ?auto_58548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58550 ?auto_58547 ) ( ON-TABLE ?auto_58544 ) ( ON ?auto_58545 ?auto_58544 ) ( ON ?auto_58546 ?auto_58545 ) ( ON ?auto_58547 ?auto_58546 ) ( not ( = ?auto_58544 ?auto_58545 ) ) ( not ( = ?auto_58544 ?auto_58546 ) ) ( not ( = ?auto_58544 ?auto_58547 ) ) ( not ( = ?auto_58544 ?auto_58550 ) ) ( not ( = ?auto_58545 ?auto_58546 ) ) ( not ( = ?auto_58545 ?auto_58547 ) ) ( not ( = ?auto_58545 ?auto_58550 ) ) ( not ( = ?auto_58546 ?auto_58547 ) ) ( not ( = ?auto_58546 ?auto_58550 ) ) ( not ( = ?auto_58547 ?auto_58550 ) ) ( not ( = ?auto_58544 ?auto_58549 ) ) ( not ( = ?auto_58544 ?auto_58548 ) ) ( not ( = ?auto_58545 ?auto_58549 ) ) ( not ( = ?auto_58545 ?auto_58548 ) ) ( not ( = ?auto_58546 ?auto_58549 ) ) ( not ( = ?auto_58546 ?auto_58548 ) ) ( not ( = ?auto_58547 ?auto_58549 ) ) ( not ( = ?auto_58547 ?auto_58548 ) ) ( not ( = ?auto_58550 ?auto_58549 ) ) ( not ( = ?auto_58550 ?auto_58548 ) ) ( not ( = ?auto_58549 ?auto_58548 ) ) ( ON ?auto_58549 ?auto_58550 ) ( ON ?auto_58548 ?auto_58549 ) ( CLEAR ?auto_58548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_58544 ?auto_58545 ?auto_58546 ?auto_58547 ?auto_58550 ?auto_58549 )
      ( MAKE-4PILE ?auto_58544 ?auto_58545 ?auto_58546 ?auto_58547 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58554 - BLOCK
      ?auto_58555 - BLOCK
      ?auto_58556 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_58556 ) ( CLEAR ?auto_58555 ) ( ON-TABLE ?auto_58554 ) ( ON ?auto_58555 ?auto_58554 ) ( not ( = ?auto_58554 ?auto_58555 ) ) ( not ( = ?auto_58554 ?auto_58556 ) ) ( not ( = ?auto_58555 ?auto_58556 ) ) )
    :subtasks
    ( ( !STACK ?auto_58556 ?auto_58555 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58557 - BLOCK
      ?auto_58558 - BLOCK
      ?auto_58559 - BLOCK
    )
    :vars
    (
      ?auto_58560 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_58558 ) ( ON-TABLE ?auto_58557 ) ( ON ?auto_58558 ?auto_58557 ) ( not ( = ?auto_58557 ?auto_58558 ) ) ( not ( = ?auto_58557 ?auto_58559 ) ) ( not ( = ?auto_58558 ?auto_58559 ) ) ( ON ?auto_58559 ?auto_58560 ) ( CLEAR ?auto_58559 ) ( HAND-EMPTY ) ( not ( = ?auto_58557 ?auto_58560 ) ) ( not ( = ?auto_58558 ?auto_58560 ) ) ( not ( = ?auto_58559 ?auto_58560 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58559 ?auto_58560 )
      ( MAKE-3PILE ?auto_58557 ?auto_58558 ?auto_58559 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58561 - BLOCK
      ?auto_58562 - BLOCK
      ?auto_58563 - BLOCK
    )
    :vars
    (
      ?auto_58564 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58561 ) ( not ( = ?auto_58561 ?auto_58562 ) ) ( not ( = ?auto_58561 ?auto_58563 ) ) ( not ( = ?auto_58562 ?auto_58563 ) ) ( ON ?auto_58563 ?auto_58564 ) ( CLEAR ?auto_58563 ) ( not ( = ?auto_58561 ?auto_58564 ) ) ( not ( = ?auto_58562 ?auto_58564 ) ) ( not ( = ?auto_58563 ?auto_58564 ) ) ( HOLDING ?auto_58562 ) ( CLEAR ?auto_58561 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58561 ?auto_58562 )
      ( MAKE-3PILE ?auto_58561 ?auto_58562 ?auto_58563 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58565 - BLOCK
      ?auto_58566 - BLOCK
      ?auto_58567 - BLOCK
    )
    :vars
    (
      ?auto_58568 - BLOCK
      ?auto_58569 - BLOCK
      ?auto_58570 - BLOCK
      ?auto_58571 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58565 ) ( not ( = ?auto_58565 ?auto_58566 ) ) ( not ( = ?auto_58565 ?auto_58567 ) ) ( not ( = ?auto_58566 ?auto_58567 ) ) ( ON ?auto_58567 ?auto_58568 ) ( not ( = ?auto_58565 ?auto_58568 ) ) ( not ( = ?auto_58566 ?auto_58568 ) ) ( not ( = ?auto_58567 ?auto_58568 ) ) ( CLEAR ?auto_58565 ) ( ON ?auto_58566 ?auto_58567 ) ( CLEAR ?auto_58566 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58569 ) ( ON ?auto_58570 ?auto_58569 ) ( ON ?auto_58571 ?auto_58570 ) ( ON ?auto_58568 ?auto_58571 ) ( not ( = ?auto_58569 ?auto_58570 ) ) ( not ( = ?auto_58569 ?auto_58571 ) ) ( not ( = ?auto_58569 ?auto_58568 ) ) ( not ( = ?auto_58569 ?auto_58567 ) ) ( not ( = ?auto_58569 ?auto_58566 ) ) ( not ( = ?auto_58570 ?auto_58571 ) ) ( not ( = ?auto_58570 ?auto_58568 ) ) ( not ( = ?auto_58570 ?auto_58567 ) ) ( not ( = ?auto_58570 ?auto_58566 ) ) ( not ( = ?auto_58571 ?auto_58568 ) ) ( not ( = ?auto_58571 ?auto_58567 ) ) ( not ( = ?auto_58571 ?auto_58566 ) ) ( not ( = ?auto_58565 ?auto_58569 ) ) ( not ( = ?auto_58565 ?auto_58570 ) ) ( not ( = ?auto_58565 ?auto_58571 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58569 ?auto_58570 ?auto_58571 ?auto_58568 ?auto_58567 )
      ( MAKE-3PILE ?auto_58565 ?auto_58566 ?auto_58567 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58572 - BLOCK
      ?auto_58573 - BLOCK
      ?auto_58574 - BLOCK
    )
    :vars
    (
      ?auto_58578 - BLOCK
      ?auto_58576 - BLOCK
      ?auto_58577 - BLOCK
      ?auto_58575 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58572 ?auto_58573 ) ) ( not ( = ?auto_58572 ?auto_58574 ) ) ( not ( = ?auto_58573 ?auto_58574 ) ) ( ON ?auto_58574 ?auto_58578 ) ( not ( = ?auto_58572 ?auto_58578 ) ) ( not ( = ?auto_58573 ?auto_58578 ) ) ( not ( = ?auto_58574 ?auto_58578 ) ) ( ON ?auto_58573 ?auto_58574 ) ( CLEAR ?auto_58573 ) ( ON-TABLE ?auto_58576 ) ( ON ?auto_58577 ?auto_58576 ) ( ON ?auto_58575 ?auto_58577 ) ( ON ?auto_58578 ?auto_58575 ) ( not ( = ?auto_58576 ?auto_58577 ) ) ( not ( = ?auto_58576 ?auto_58575 ) ) ( not ( = ?auto_58576 ?auto_58578 ) ) ( not ( = ?auto_58576 ?auto_58574 ) ) ( not ( = ?auto_58576 ?auto_58573 ) ) ( not ( = ?auto_58577 ?auto_58575 ) ) ( not ( = ?auto_58577 ?auto_58578 ) ) ( not ( = ?auto_58577 ?auto_58574 ) ) ( not ( = ?auto_58577 ?auto_58573 ) ) ( not ( = ?auto_58575 ?auto_58578 ) ) ( not ( = ?auto_58575 ?auto_58574 ) ) ( not ( = ?auto_58575 ?auto_58573 ) ) ( not ( = ?auto_58572 ?auto_58576 ) ) ( not ( = ?auto_58572 ?auto_58577 ) ) ( not ( = ?auto_58572 ?auto_58575 ) ) ( HOLDING ?auto_58572 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58572 )
      ( MAKE-3PILE ?auto_58572 ?auto_58573 ?auto_58574 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58579 - BLOCK
      ?auto_58580 - BLOCK
      ?auto_58581 - BLOCK
    )
    :vars
    (
      ?auto_58583 - BLOCK
      ?auto_58582 - BLOCK
      ?auto_58584 - BLOCK
      ?auto_58585 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58579 ?auto_58580 ) ) ( not ( = ?auto_58579 ?auto_58581 ) ) ( not ( = ?auto_58580 ?auto_58581 ) ) ( ON ?auto_58581 ?auto_58583 ) ( not ( = ?auto_58579 ?auto_58583 ) ) ( not ( = ?auto_58580 ?auto_58583 ) ) ( not ( = ?auto_58581 ?auto_58583 ) ) ( ON ?auto_58580 ?auto_58581 ) ( ON-TABLE ?auto_58582 ) ( ON ?auto_58584 ?auto_58582 ) ( ON ?auto_58585 ?auto_58584 ) ( ON ?auto_58583 ?auto_58585 ) ( not ( = ?auto_58582 ?auto_58584 ) ) ( not ( = ?auto_58582 ?auto_58585 ) ) ( not ( = ?auto_58582 ?auto_58583 ) ) ( not ( = ?auto_58582 ?auto_58581 ) ) ( not ( = ?auto_58582 ?auto_58580 ) ) ( not ( = ?auto_58584 ?auto_58585 ) ) ( not ( = ?auto_58584 ?auto_58583 ) ) ( not ( = ?auto_58584 ?auto_58581 ) ) ( not ( = ?auto_58584 ?auto_58580 ) ) ( not ( = ?auto_58585 ?auto_58583 ) ) ( not ( = ?auto_58585 ?auto_58581 ) ) ( not ( = ?auto_58585 ?auto_58580 ) ) ( not ( = ?auto_58579 ?auto_58582 ) ) ( not ( = ?auto_58579 ?auto_58584 ) ) ( not ( = ?auto_58579 ?auto_58585 ) ) ( ON ?auto_58579 ?auto_58580 ) ( CLEAR ?auto_58579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_58582 ?auto_58584 ?auto_58585 ?auto_58583 ?auto_58581 ?auto_58580 )
      ( MAKE-3PILE ?auto_58579 ?auto_58580 ?auto_58581 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58589 - BLOCK
      ?auto_58590 - BLOCK
      ?auto_58591 - BLOCK
    )
    :vars
    (
      ?auto_58592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58592 ?auto_58591 ) ( CLEAR ?auto_58592 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58589 ) ( ON ?auto_58590 ?auto_58589 ) ( ON ?auto_58591 ?auto_58590 ) ( not ( = ?auto_58589 ?auto_58590 ) ) ( not ( = ?auto_58589 ?auto_58591 ) ) ( not ( = ?auto_58589 ?auto_58592 ) ) ( not ( = ?auto_58590 ?auto_58591 ) ) ( not ( = ?auto_58590 ?auto_58592 ) ) ( not ( = ?auto_58591 ?auto_58592 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58592 ?auto_58591 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58593 - BLOCK
      ?auto_58594 - BLOCK
      ?auto_58595 - BLOCK
    )
    :vars
    (
      ?auto_58596 - BLOCK
      ?auto_58597 - BLOCK
      ?auto_58598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58596 ?auto_58595 ) ( CLEAR ?auto_58596 ) ( ON-TABLE ?auto_58593 ) ( ON ?auto_58594 ?auto_58593 ) ( ON ?auto_58595 ?auto_58594 ) ( not ( = ?auto_58593 ?auto_58594 ) ) ( not ( = ?auto_58593 ?auto_58595 ) ) ( not ( = ?auto_58593 ?auto_58596 ) ) ( not ( = ?auto_58594 ?auto_58595 ) ) ( not ( = ?auto_58594 ?auto_58596 ) ) ( not ( = ?auto_58595 ?auto_58596 ) ) ( HOLDING ?auto_58597 ) ( CLEAR ?auto_58598 ) ( not ( = ?auto_58593 ?auto_58597 ) ) ( not ( = ?auto_58593 ?auto_58598 ) ) ( not ( = ?auto_58594 ?auto_58597 ) ) ( not ( = ?auto_58594 ?auto_58598 ) ) ( not ( = ?auto_58595 ?auto_58597 ) ) ( not ( = ?auto_58595 ?auto_58598 ) ) ( not ( = ?auto_58596 ?auto_58597 ) ) ( not ( = ?auto_58596 ?auto_58598 ) ) ( not ( = ?auto_58597 ?auto_58598 ) ) )
    :subtasks
    ( ( !STACK ?auto_58597 ?auto_58598 )
      ( MAKE-3PILE ?auto_58593 ?auto_58594 ?auto_58595 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58599 - BLOCK
      ?auto_58600 - BLOCK
      ?auto_58601 - BLOCK
    )
    :vars
    (
      ?auto_58604 - BLOCK
      ?auto_58602 - BLOCK
      ?auto_58603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58604 ?auto_58601 ) ( ON-TABLE ?auto_58599 ) ( ON ?auto_58600 ?auto_58599 ) ( ON ?auto_58601 ?auto_58600 ) ( not ( = ?auto_58599 ?auto_58600 ) ) ( not ( = ?auto_58599 ?auto_58601 ) ) ( not ( = ?auto_58599 ?auto_58604 ) ) ( not ( = ?auto_58600 ?auto_58601 ) ) ( not ( = ?auto_58600 ?auto_58604 ) ) ( not ( = ?auto_58601 ?auto_58604 ) ) ( CLEAR ?auto_58602 ) ( not ( = ?auto_58599 ?auto_58603 ) ) ( not ( = ?auto_58599 ?auto_58602 ) ) ( not ( = ?auto_58600 ?auto_58603 ) ) ( not ( = ?auto_58600 ?auto_58602 ) ) ( not ( = ?auto_58601 ?auto_58603 ) ) ( not ( = ?auto_58601 ?auto_58602 ) ) ( not ( = ?auto_58604 ?auto_58603 ) ) ( not ( = ?auto_58604 ?auto_58602 ) ) ( not ( = ?auto_58603 ?auto_58602 ) ) ( ON ?auto_58603 ?auto_58604 ) ( CLEAR ?auto_58603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58599 ?auto_58600 ?auto_58601 ?auto_58604 )
      ( MAKE-3PILE ?auto_58599 ?auto_58600 ?auto_58601 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58605 - BLOCK
      ?auto_58606 - BLOCK
      ?auto_58607 - BLOCK
    )
    :vars
    (
      ?auto_58610 - BLOCK
      ?auto_58609 - BLOCK
      ?auto_58608 - BLOCK
      ?auto_58611 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58610 ?auto_58607 ) ( ON-TABLE ?auto_58605 ) ( ON ?auto_58606 ?auto_58605 ) ( ON ?auto_58607 ?auto_58606 ) ( not ( = ?auto_58605 ?auto_58606 ) ) ( not ( = ?auto_58605 ?auto_58607 ) ) ( not ( = ?auto_58605 ?auto_58610 ) ) ( not ( = ?auto_58606 ?auto_58607 ) ) ( not ( = ?auto_58606 ?auto_58610 ) ) ( not ( = ?auto_58607 ?auto_58610 ) ) ( not ( = ?auto_58605 ?auto_58609 ) ) ( not ( = ?auto_58605 ?auto_58608 ) ) ( not ( = ?auto_58606 ?auto_58609 ) ) ( not ( = ?auto_58606 ?auto_58608 ) ) ( not ( = ?auto_58607 ?auto_58609 ) ) ( not ( = ?auto_58607 ?auto_58608 ) ) ( not ( = ?auto_58610 ?auto_58609 ) ) ( not ( = ?auto_58610 ?auto_58608 ) ) ( not ( = ?auto_58609 ?auto_58608 ) ) ( ON ?auto_58609 ?auto_58610 ) ( CLEAR ?auto_58609 ) ( HOLDING ?auto_58608 ) ( CLEAR ?auto_58611 ) ( ON-TABLE ?auto_58611 ) ( not ( = ?auto_58611 ?auto_58608 ) ) ( not ( = ?auto_58605 ?auto_58611 ) ) ( not ( = ?auto_58606 ?auto_58611 ) ) ( not ( = ?auto_58607 ?auto_58611 ) ) ( not ( = ?auto_58610 ?auto_58611 ) ) ( not ( = ?auto_58609 ?auto_58611 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58611 ?auto_58608 )
      ( MAKE-3PILE ?auto_58605 ?auto_58606 ?auto_58607 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_59303 - BLOCK
      ?auto_59304 - BLOCK
      ?auto_59305 - BLOCK
    )
    :vars
    (
      ?auto_59308 - BLOCK
      ?auto_59306 - BLOCK
      ?auto_59307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59308 ?auto_59305 ) ( ON-TABLE ?auto_59303 ) ( ON ?auto_59304 ?auto_59303 ) ( ON ?auto_59305 ?auto_59304 ) ( not ( = ?auto_59303 ?auto_59304 ) ) ( not ( = ?auto_59303 ?auto_59305 ) ) ( not ( = ?auto_59303 ?auto_59308 ) ) ( not ( = ?auto_59304 ?auto_59305 ) ) ( not ( = ?auto_59304 ?auto_59308 ) ) ( not ( = ?auto_59305 ?auto_59308 ) ) ( not ( = ?auto_59303 ?auto_59306 ) ) ( not ( = ?auto_59303 ?auto_59307 ) ) ( not ( = ?auto_59304 ?auto_59306 ) ) ( not ( = ?auto_59304 ?auto_59307 ) ) ( not ( = ?auto_59305 ?auto_59306 ) ) ( not ( = ?auto_59305 ?auto_59307 ) ) ( not ( = ?auto_59308 ?auto_59306 ) ) ( not ( = ?auto_59308 ?auto_59307 ) ) ( not ( = ?auto_59306 ?auto_59307 ) ) ( ON ?auto_59306 ?auto_59308 ) ( ON ?auto_59307 ?auto_59306 ) ( CLEAR ?auto_59307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59303 ?auto_59304 ?auto_59305 ?auto_59308 ?auto_59306 )
      ( MAKE-3PILE ?auto_59303 ?auto_59304 ?auto_59305 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58619 - BLOCK
      ?auto_58620 - BLOCK
      ?auto_58621 - BLOCK
    )
    :vars
    (
      ?auto_58625 - BLOCK
      ?auto_58622 - BLOCK
      ?auto_58623 - BLOCK
      ?auto_58624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58625 ?auto_58621 ) ( ON-TABLE ?auto_58619 ) ( ON ?auto_58620 ?auto_58619 ) ( ON ?auto_58621 ?auto_58620 ) ( not ( = ?auto_58619 ?auto_58620 ) ) ( not ( = ?auto_58619 ?auto_58621 ) ) ( not ( = ?auto_58619 ?auto_58625 ) ) ( not ( = ?auto_58620 ?auto_58621 ) ) ( not ( = ?auto_58620 ?auto_58625 ) ) ( not ( = ?auto_58621 ?auto_58625 ) ) ( not ( = ?auto_58619 ?auto_58622 ) ) ( not ( = ?auto_58619 ?auto_58623 ) ) ( not ( = ?auto_58620 ?auto_58622 ) ) ( not ( = ?auto_58620 ?auto_58623 ) ) ( not ( = ?auto_58621 ?auto_58622 ) ) ( not ( = ?auto_58621 ?auto_58623 ) ) ( not ( = ?auto_58625 ?auto_58622 ) ) ( not ( = ?auto_58625 ?auto_58623 ) ) ( not ( = ?auto_58622 ?auto_58623 ) ) ( ON ?auto_58622 ?auto_58625 ) ( not ( = ?auto_58624 ?auto_58623 ) ) ( not ( = ?auto_58619 ?auto_58624 ) ) ( not ( = ?auto_58620 ?auto_58624 ) ) ( not ( = ?auto_58621 ?auto_58624 ) ) ( not ( = ?auto_58625 ?auto_58624 ) ) ( not ( = ?auto_58622 ?auto_58624 ) ) ( ON ?auto_58623 ?auto_58622 ) ( CLEAR ?auto_58623 ) ( HOLDING ?auto_58624 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58624 )
      ( MAKE-3PILE ?auto_58619 ?auto_58620 ?auto_58621 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58626 - BLOCK
      ?auto_58627 - BLOCK
      ?auto_58628 - BLOCK
    )
    :vars
    (
      ?auto_58630 - BLOCK
      ?auto_58629 - BLOCK
      ?auto_58631 - BLOCK
      ?auto_58632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58630 ?auto_58628 ) ( ON-TABLE ?auto_58626 ) ( ON ?auto_58627 ?auto_58626 ) ( ON ?auto_58628 ?auto_58627 ) ( not ( = ?auto_58626 ?auto_58627 ) ) ( not ( = ?auto_58626 ?auto_58628 ) ) ( not ( = ?auto_58626 ?auto_58630 ) ) ( not ( = ?auto_58627 ?auto_58628 ) ) ( not ( = ?auto_58627 ?auto_58630 ) ) ( not ( = ?auto_58628 ?auto_58630 ) ) ( not ( = ?auto_58626 ?auto_58629 ) ) ( not ( = ?auto_58626 ?auto_58631 ) ) ( not ( = ?auto_58627 ?auto_58629 ) ) ( not ( = ?auto_58627 ?auto_58631 ) ) ( not ( = ?auto_58628 ?auto_58629 ) ) ( not ( = ?auto_58628 ?auto_58631 ) ) ( not ( = ?auto_58630 ?auto_58629 ) ) ( not ( = ?auto_58630 ?auto_58631 ) ) ( not ( = ?auto_58629 ?auto_58631 ) ) ( ON ?auto_58629 ?auto_58630 ) ( not ( = ?auto_58632 ?auto_58631 ) ) ( not ( = ?auto_58626 ?auto_58632 ) ) ( not ( = ?auto_58627 ?auto_58632 ) ) ( not ( = ?auto_58628 ?auto_58632 ) ) ( not ( = ?auto_58630 ?auto_58632 ) ) ( not ( = ?auto_58629 ?auto_58632 ) ) ( ON ?auto_58631 ?auto_58629 ) ( ON ?auto_58632 ?auto_58631 ) ( CLEAR ?auto_58632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_58626 ?auto_58627 ?auto_58628 ?auto_58630 ?auto_58629 ?auto_58631 )
      ( MAKE-3PILE ?auto_58626 ?auto_58627 ?auto_58628 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58637 - BLOCK
      ?auto_58638 - BLOCK
      ?auto_58639 - BLOCK
      ?auto_58640 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_58640 ) ( CLEAR ?auto_58639 ) ( ON-TABLE ?auto_58637 ) ( ON ?auto_58638 ?auto_58637 ) ( ON ?auto_58639 ?auto_58638 ) ( not ( = ?auto_58637 ?auto_58638 ) ) ( not ( = ?auto_58637 ?auto_58639 ) ) ( not ( = ?auto_58637 ?auto_58640 ) ) ( not ( = ?auto_58638 ?auto_58639 ) ) ( not ( = ?auto_58638 ?auto_58640 ) ) ( not ( = ?auto_58639 ?auto_58640 ) ) )
    :subtasks
    ( ( !STACK ?auto_58640 ?auto_58639 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58641 - BLOCK
      ?auto_58642 - BLOCK
      ?auto_58643 - BLOCK
      ?auto_58644 - BLOCK
    )
    :vars
    (
      ?auto_58645 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_58643 ) ( ON-TABLE ?auto_58641 ) ( ON ?auto_58642 ?auto_58641 ) ( ON ?auto_58643 ?auto_58642 ) ( not ( = ?auto_58641 ?auto_58642 ) ) ( not ( = ?auto_58641 ?auto_58643 ) ) ( not ( = ?auto_58641 ?auto_58644 ) ) ( not ( = ?auto_58642 ?auto_58643 ) ) ( not ( = ?auto_58642 ?auto_58644 ) ) ( not ( = ?auto_58643 ?auto_58644 ) ) ( ON ?auto_58644 ?auto_58645 ) ( CLEAR ?auto_58644 ) ( HAND-EMPTY ) ( not ( = ?auto_58641 ?auto_58645 ) ) ( not ( = ?auto_58642 ?auto_58645 ) ) ( not ( = ?auto_58643 ?auto_58645 ) ) ( not ( = ?auto_58644 ?auto_58645 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58644 ?auto_58645 )
      ( MAKE-4PILE ?auto_58641 ?auto_58642 ?auto_58643 ?auto_58644 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58646 - BLOCK
      ?auto_58647 - BLOCK
      ?auto_58648 - BLOCK
      ?auto_58649 - BLOCK
    )
    :vars
    (
      ?auto_58650 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58646 ) ( ON ?auto_58647 ?auto_58646 ) ( not ( = ?auto_58646 ?auto_58647 ) ) ( not ( = ?auto_58646 ?auto_58648 ) ) ( not ( = ?auto_58646 ?auto_58649 ) ) ( not ( = ?auto_58647 ?auto_58648 ) ) ( not ( = ?auto_58647 ?auto_58649 ) ) ( not ( = ?auto_58648 ?auto_58649 ) ) ( ON ?auto_58649 ?auto_58650 ) ( CLEAR ?auto_58649 ) ( not ( = ?auto_58646 ?auto_58650 ) ) ( not ( = ?auto_58647 ?auto_58650 ) ) ( not ( = ?auto_58648 ?auto_58650 ) ) ( not ( = ?auto_58649 ?auto_58650 ) ) ( HOLDING ?auto_58648 ) ( CLEAR ?auto_58647 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58646 ?auto_58647 ?auto_58648 )
      ( MAKE-4PILE ?auto_58646 ?auto_58647 ?auto_58648 ?auto_58649 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58651 - BLOCK
      ?auto_58652 - BLOCK
      ?auto_58653 - BLOCK
      ?auto_58654 - BLOCK
    )
    :vars
    (
      ?auto_58655 - BLOCK
      ?auto_58656 - BLOCK
      ?auto_58657 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58651 ) ( ON ?auto_58652 ?auto_58651 ) ( not ( = ?auto_58651 ?auto_58652 ) ) ( not ( = ?auto_58651 ?auto_58653 ) ) ( not ( = ?auto_58651 ?auto_58654 ) ) ( not ( = ?auto_58652 ?auto_58653 ) ) ( not ( = ?auto_58652 ?auto_58654 ) ) ( not ( = ?auto_58653 ?auto_58654 ) ) ( ON ?auto_58654 ?auto_58655 ) ( not ( = ?auto_58651 ?auto_58655 ) ) ( not ( = ?auto_58652 ?auto_58655 ) ) ( not ( = ?auto_58653 ?auto_58655 ) ) ( not ( = ?auto_58654 ?auto_58655 ) ) ( CLEAR ?auto_58652 ) ( ON ?auto_58653 ?auto_58654 ) ( CLEAR ?auto_58653 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58656 ) ( ON ?auto_58657 ?auto_58656 ) ( ON ?auto_58655 ?auto_58657 ) ( not ( = ?auto_58656 ?auto_58657 ) ) ( not ( = ?auto_58656 ?auto_58655 ) ) ( not ( = ?auto_58656 ?auto_58654 ) ) ( not ( = ?auto_58656 ?auto_58653 ) ) ( not ( = ?auto_58657 ?auto_58655 ) ) ( not ( = ?auto_58657 ?auto_58654 ) ) ( not ( = ?auto_58657 ?auto_58653 ) ) ( not ( = ?auto_58651 ?auto_58656 ) ) ( not ( = ?auto_58651 ?auto_58657 ) ) ( not ( = ?auto_58652 ?auto_58656 ) ) ( not ( = ?auto_58652 ?auto_58657 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58656 ?auto_58657 ?auto_58655 ?auto_58654 )
      ( MAKE-4PILE ?auto_58651 ?auto_58652 ?auto_58653 ?auto_58654 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58658 - BLOCK
      ?auto_58659 - BLOCK
      ?auto_58660 - BLOCK
      ?auto_58661 - BLOCK
    )
    :vars
    (
      ?auto_58664 - BLOCK
      ?auto_58662 - BLOCK
      ?auto_58663 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58658 ) ( not ( = ?auto_58658 ?auto_58659 ) ) ( not ( = ?auto_58658 ?auto_58660 ) ) ( not ( = ?auto_58658 ?auto_58661 ) ) ( not ( = ?auto_58659 ?auto_58660 ) ) ( not ( = ?auto_58659 ?auto_58661 ) ) ( not ( = ?auto_58660 ?auto_58661 ) ) ( ON ?auto_58661 ?auto_58664 ) ( not ( = ?auto_58658 ?auto_58664 ) ) ( not ( = ?auto_58659 ?auto_58664 ) ) ( not ( = ?auto_58660 ?auto_58664 ) ) ( not ( = ?auto_58661 ?auto_58664 ) ) ( ON ?auto_58660 ?auto_58661 ) ( CLEAR ?auto_58660 ) ( ON-TABLE ?auto_58662 ) ( ON ?auto_58663 ?auto_58662 ) ( ON ?auto_58664 ?auto_58663 ) ( not ( = ?auto_58662 ?auto_58663 ) ) ( not ( = ?auto_58662 ?auto_58664 ) ) ( not ( = ?auto_58662 ?auto_58661 ) ) ( not ( = ?auto_58662 ?auto_58660 ) ) ( not ( = ?auto_58663 ?auto_58664 ) ) ( not ( = ?auto_58663 ?auto_58661 ) ) ( not ( = ?auto_58663 ?auto_58660 ) ) ( not ( = ?auto_58658 ?auto_58662 ) ) ( not ( = ?auto_58658 ?auto_58663 ) ) ( not ( = ?auto_58659 ?auto_58662 ) ) ( not ( = ?auto_58659 ?auto_58663 ) ) ( HOLDING ?auto_58659 ) ( CLEAR ?auto_58658 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58658 ?auto_58659 )
      ( MAKE-4PILE ?auto_58658 ?auto_58659 ?auto_58660 ?auto_58661 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58665 - BLOCK
      ?auto_58666 - BLOCK
      ?auto_58667 - BLOCK
      ?auto_58668 - BLOCK
    )
    :vars
    (
      ?auto_58670 - BLOCK
      ?auto_58671 - BLOCK
      ?auto_58669 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58665 ) ( not ( = ?auto_58665 ?auto_58666 ) ) ( not ( = ?auto_58665 ?auto_58667 ) ) ( not ( = ?auto_58665 ?auto_58668 ) ) ( not ( = ?auto_58666 ?auto_58667 ) ) ( not ( = ?auto_58666 ?auto_58668 ) ) ( not ( = ?auto_58667 ?auto_58668 ) ) ( ON ?auto_58668 ?auto_58670 ) ( not ( = ?auto_58665 ?auto_58670 ) ) ( not ( = ?auto_58666 ?auto_58670 ) ) ( not ( = ?auto_58667 ?auto_58670 ) ) ( not ( = ?auto_58668 ?auto_58670 ) ) ( ON ?auto_58667 ?auto_58668 ) ( ON-TABLE ?auto_58671 ) ( ON ?auto_58669 ?auto_58671 ) ( ON ?auto_58670 ?auto_58669 ) ( not ( = ?auto_58671 ?auto_58669 ) ) ( not ( = ?auto_58671 ?auto_58670 ) ) ( not ( = ?auto_58671 ?auto_58668 ) ) ( not ( = ?auto_58671 ?auto_58667 ) ) ( not ( = ?auto_58669 ?auto_58670 ) ) ( not ( = ?auto_58669 ?auto_58668 ) ) ( not ( = ?auto_58669 ?auto_58667 ) ) ( not ( = ?auto_58665 ?auto_58671 ) ) ( not ( = ?auto_58665 ?auto_58669 ) ) ( not ( = ?auto_58666 ?auto_58671 ) ) ( not ( = ?auto_58666 ?auto_58669 ) ) ( CLEAR ?auto_58665 ) ( ON ?auto_58666 ?auto_58667 ) ( CLEAR ?auto_58666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58671 ?auto_58669 ?auto_58670 ?auto_58668 ?auto_58667 )
      ( MAKE-4PILE ?auto_58665 ?auto_58666 ?auto_58667 ?auto_58668 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58672 - BLOCK
      ?auto_58673 - BLOCK
      ?auto_58674 - BLOCK
      ?auto_58675 - BLOCK
    )
    :vars
    (
      ?auto_58677 - BLOCK
      ?auto_58676 - BLOCK
      ?auto_58678 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58672 ?auto_58673 ) ) ( not ( = ?auto_58672 ?auto_58674 ) ) ( not ( = ?auto_58672 ?auto_58675 ) ) ( not ( = ?auto_58673 ?auto_58674 ) ) ( not ( = ?auto_58673 ?auto_58675 ) ) ( not ( = ?auto_58674 ?auto_58675 ) ) ( ON ?auto_58675 ?auto_58677 ) ( not ( = ?auto_58672 ?auto_58677 ) ) ( not ( = ?auto_58673 ?auto_58677 ) ) ( not ( = ?auto_58674 ?auto_58677 ) ) ( not ( = ?auto_58675 ?auto_58677 ) ) ( ON ?auto_58674 ?auto_58675 ) ( ON-TABLE ?auto_58676 ) ( ON ?auto_58678 ?auto_58676 ) ( ON ?auto_58677 ?auto_58678 ) ( not ( = ?auto_58676 ?auto_58678 ) ) ( not ( = ?auto_58676 ?auto_58677 ) ) ( not ( = ?auto_58676 ?auto_58675 ) ) ( not ( = ?auto_58676 ?auto_58674 ) ) ( not ( = ?auto_58678 ?auto_58677 ) ) ( not ( = ?auto_58678 ?auto_58675 ) ) ( not ( = ?auto_58678 ?auto_58674 ) ) ( not ( = ?auto_58672 ?auto_58676 ) ) ( not ( = ?auto_58672 ?auto_58678 ) ) ( not ( = ?auto_58673 ?auto_58676 ) ) ( not ( = ?auto_58673 ?auto_58678 ) ) ( ON ?auto_58673 ?auto_58674 ) ( CLEAR ?auto_58673 ) ( HOLDING ?auto_58672 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58672 )
      ( MAKE-4PILE ?auto_58672 ?auto_58673 ?auto_58674 ?auto_58675 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58679 - BLOCK
      ?auto_58680 - BLOCK
      ?auto_58681 - BLOCK
      ?auto_58682 - BLOCK
    )
    :vars
    (
      ?auto_58683 - BLOCK
      ?auto_58684 - BLOCK
      ?auto_58685 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58679 ?auto_58680 ) ) ( not ( = ?auto_58679 ?auto_58681 ) ) ( not ( = ?auto_58679 ?auto_58682 ) ) ( not ( = ?auto_58680 ?auto_58681 ) ) ( not ( = ?auto_58680 ?auto_58682 ) ) ( not ( = ?auto_58681 ?auto_58682 ) ) ( ON ?auto_58682 ?auto_58683 ) ( not ( = ?auto_58679 ?auto_58683 ) ) ( not ( = ?auto_58680 ?auto_58683 ) ) ( not ( = ?auto_58681 ?auto_58683 ) ) ( not ( = ?auto_58682 ?auto_58683 ) ) ( ON ?auto_58681 ?auto_58682 ) ( ON-TABLE ?auto_58684 ) ( ON ?auto_58685 ?auto_58684 ) ( ON ?auto_58683 ?auto_58685 ) ( not ( = ?auto_58684 ?auto_58685 ) ) ( not ( = ?auto_58684 ?auto_58683 ) ) ( not ( = ?auto_58684 ?auto_58682 ) ) ( not ( = ?auto_58684 ?auto_58681 ) ) ( not ( = ?auto_58685 ?auto_58683 ) ) ( not ( = ?auto_58685 ?auto_58682 ) ) ( not ( = ?auto_58685 ?auto_58681 ) ) ( not ( = ?auto_58679 ?auto_58684 ) ) ( not ( = ?auto_58679 ?auto_58685 ) ) ( not ( = ?auto_58680 ?auto_58684 ) ) ( not ( = ?auto_58680 ?auto_58685 ) ) ( ON ?auto_58680 ?auto_58681 ) ( ON ?auto_58679 ?auto_58680 ) ( CLEAR ?auto_58679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_58684 ?auto_58685 ?auto_58683 ?auto_58682 ?auto_58681 ?auto_58680 )
      ( MAKE-4PILE ?auto_58679 ?auto_58680 ?auto_58681 ?auto_58682 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58688 - BLOCK
      ?auto_58689 - BLOCK
    )
    :vars
    (
      ?auto_58690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58690 ?auto_58689 ) ( CLEAR ?auto_58690 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58688 ) ( ON ?auto_58689 ?auto_58688 ) ( not ( = ?auto_58688 ?auto_58689 ) ) ( not ( = ?auto_58688 ?auto_58690 ) ) ( not ( = ?auto_58689 ?auto_58690 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58690 ?auto_58689 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58691 - BLOCK
      ?auto_58692 - BLOCK
    )
    :vars
    (
      ?auto_58693 - BLOCK
      ?auto_58694 - BLOCK
      ?auto_58695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58693 ?auto_58692 ) ( CLEAR ?auto_58693 ) ( ON-TABLE ?auto_58691 ) ( ON ?auto_58692 ?auto_58691 ) ( not ( = ?auto_58691 ?auto_58692 ) ) ( not ( = ?auto_58691 ?auto_58693 ) ) ( not ( = ?auto_58692 ?auto_58693 ) ) ( HOLDING ?auto_58694 ) ( CLEAR ?auto_58695 ) ( not ( = ?auto_58691 ?auto_58694 ) ) ( not ( = ?auto_58691 ?auto_58695 ) ) ( not ( = ?auto_58692 ?auto_58694 ) ) ( not ( = ?auto_58692 ?auto_58695 ) ) ( not ( = ?auto_58693 ?auto_58694 ) ) ( not ( = ?auto_58693 ?auto_58695 ) ) ( not ( = ?auto_58694 ?auto_58695 ) ) )
    :subtasks
    ( ( !STACK ?auto_58694 ?auto_58695 )
      ( MAKE-2PILE ?auto_58691 ?auto_58692 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58696 - BLOCK
      ?auto_58697 - BLOCK
    )
    :vars
    (
      ?auto_58699 - BLOCK
      ?auto_58700 - BLOCK
      ?auto_58698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58699 ?auto_58697 ) ( ON-TABLE ?auto_58696 ) ( ON ?auto_58697 ?auto_58696 ) ( not ( = ?auto_58696 ?auto_58697 ) ) ( not ( = ?auto_58696 ?auto_58699 ) ) ( not ( = ?auto_58697 ?auto_58699 ) ) ( CLEAR ?auto_58700 ) ( not ( = ?auto_58696 ?auto_58698 ) ) ( not ( = ?auto_58696 ?auto_58700 ) ) ( not ( = ?auto_58697 ?auto_58698 ) ) ( not ( = ?auto_58697 ?auto_58700 ) ) ( not ( = ?auto_58699 ?auto_58698 ) ) ( not ( = ?auto_58699 ?auto_58700 ) ) ( not ( = ?auto_58698 ?auto_58700 ) ) ( ON ?auto_58698 ?auto_58699 ) ( CLEAR ?auto_58698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58696 ?auto_58697 ?auto_58699 )
      ( MAKE-2PILE ?auto_58696 ?auto_58697 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58701 - BLOCK
      ?auto_58702 - BLOCK
    )
    :vars
    (
      ?auto_58705 - BLOCK
      ?auto_58704 - BLOCK
      ?auto_58703 - BLOCK
      ?auto_58706 - BLOCK
      ?auto_58707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58705 ?auto_58702 ) ( ON-TABLE ?auto_58701 ) ( ON ?auto_58702 ?auto_58701 ) ( not ( = ?auto_58701 ?auto_58702 ) ) ( not ( = ?auto_58701 ?auto_58705 ) ) ( not ( = ?auto_58702 ?auto_58705 ) ) ( not ( = ?auto_58701 ?auto_58704 ) ) ( not ( = ?auto_58701 ?auto_58703 ) ) ( not ( = ?auto_58702 ?auto_58704 ) ) ( not ( = ?auto_58702 ?auto_58703 ) ) ( not ( = ?auto_58705 ?auto_58704 ) ) ( not ( = ?auto_58705 ?auto_58703 ) ) ( not ( = ?auto_58704 ?auto_58703 ) ) ( ON ?auto_58704 ?auto_58705 ) ( CLEAR ?auto_58704 ) ( HOLDING ?auto_58703 ) ( CLEAR ?auto_58706 ) ( ON-TABLE ?auto_58707 ) ( ON ?auto_58706 ?auto_58707 ) ( not ( = ?auto_58707 ?auto_58706 ) ) ( not ( = ?auto_58707 ?auto_58703 ) ) ( not ( = ?auto_58706 ?auto_58703 ) ) ( not ( = ?auto_58701 ?auto_58706 ) ) ( not ( = ?auto_58701 ?auto_58707 ) ) ( not ( = ?auto_58702 ?auto_58706 ) ) ( not ( = ?auto_58702 ?auto_58707 ) ) ( not ( = ?auto_58705 ?auto_58706 ) ) ( not ( = ?auto_58705 ?auto_58707 ) ) ( not ( = ?auto_58704 ?auto_58706 ) ) ( not ( = ?auto_58704 ?auto_58707 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58707 ?auto_58706 ?auto_58703 )
      ( MAKE-2PILE ?auto_58701 ?auto_58702 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58708 - BLOCK
      ?auto_58709 - BLOCK
    )
    :vars
    (
      ?auto_58710 - BLOCK
      ?auto_58713 - BLOCK
      ?auto_58712 - BLOCK
      ?auto_58714 - BLOCK
      ?auto_58711 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58710 ?auto_58709 ) ( ON-TABLE ?auto_58708 ) ( ON ?auto_58709 ?auto_58708 ) ( not ( = ?auto_58708 ?auto_58709 ) ) ( not ( = ?auto_58708 ?auto_58710 ) ) ( not ( = ?auto_58709 ?auto_58710 ) ) ( not ( = ?auto_58708 ?auto_58713 ) ) ( not ( = ?auto_58708 ?auto_58712 ) ) ( not ( = ?auto_58709 ?auto_58713 ) ) ( not ( = ?auto_58709 ?auto_58712 ) ) ( not ( = ?auto_58710 ?auto_58713 ) ) ( not ( = ?auto_58710 ?auto_58712 ) ) ( not ( = ?auto_58713 ?auto_58712 ) ) ( ON ?auto_58713 ?auto_58710 ) ( CLEAR ?auto_58714 ) ( ON-TABLE ?auto_58711 ) ( ON ?auto_58714 ?auto_58711 ) ( not ( = ?auto_58711 ?auto_58714 ) ) ( not ( = ?auto_58711 ?auto_58712 ) ) ( not ( = ?auto_58714 ?auto_58712 ) ) ( not ( = ?auto_58708 ?auto_58714 ) ) ( not ( = ?auto_58708 ?auto_58711 ) ) ( not ( = ?auto_58709 ?auto_58714 ) ) ( not ( = ?auto_58709 ?auto_58711 ) ) ( not ( = ?auto_58710 ?auto_58714 ) ) ( not ( = ?auto_58710 ?auto_58711 ) ) ( not ( = ?auto_58713 ?auto_58714 ) ) ( not ( = ?auto_58713 ?auto_58711 ) ) ( ON ?auto_58712 ?auto_58713 ) ( CLEAR ?auto_58712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58708 ?auto_58709 ?auto_58710 ?auto_58713 )
      ( MAKE-2PILE ?auto_58708 ?auto_58709 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58715 - BLOCK
      ?auto_58716 - BLOCK
    )
    :vars
    (
      ?auto_58721 - BLOCK
      ?auto_58719 - BLOCK
      ?auto_58720 - BLOCK
      ?auto_58717 - BLOCK
      ?auto_58718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58721 ?auto_58716 ) ( ON-TABLE ?auto_58715 ) ( ON ?auto_58716 ?auto_58715 ) ( not ( = ?auto_58715 ?auto_58716 ) ) ( not ( = ?auto_58715 ?auto_58721 ) ) ( not ( = ?auto_58716 ?auto_58721 ) ) ( not ( = ?auto_58715 ?auto_58719 ) ) ( not ( = ?auto_58715 ?auto_58720 ) ) ( not ( = ?auto_58716 ?auto_58719 ) ) ( not ( = ?auto_58716 ?auto_58720 ) ) ( not ( = ?auto_58721 ?auto_58719 ) ) ( not ( = ?auto_58721 ?auto_58720 ) ) ( not ( = ?auto_58719 ?auto_58720 ) ) ( ON ?auto_58719 ?auto_58721 ) ( ON-TABLE ?auto_58717 ) ( not ( = ?auto_58717 ?auto_58718 ) ) ( not ( = ?auto_58717 ?auto_58720 ) ) ( not ( = ?auto_58718 ?auto_58720 ) ) ( not ( = ?auto_58715 ?auto_58718 ) ) ( not ( = ?auto_58715 ?auto_58717 ) ) ( not ( = ?auto_58716 ?auto_58718 ) ) ( not ( = ?auto_58716 ?auto_58717 ) ) ( not ( = ?auto_58721 ?auto_58718 ) ) ( not ( = ?auto_58721 ?auto_58717 ) ) ( not ( = ?auto_58719 ?auto_58718 ) ) ( not ( = ?auto_58719 ?auto_58717 ) ) ( ON ?auto_58720 ?auto_58719 ) ( CLEAR ?auto_58720 ) ( HOLDING ?auto_58718 ) ( CLEAR ?auto_58717 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58717 ?auto_58718 )
      ( MAKE-2PILE ?auto_58715 ?auto_58716 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_59493 - BLOCK
      ?auto_59494 - BLOCK
    )
    :vars
    (
      ?auto_59496 - BLOCK
      ?auto_59495 - BLOCK
      ?auto_59498 - BLOCK
      ?auto_59497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59496 ?auto_59494 ) ( ON-TABLE ?auto_59493 ) ( ON ?auto_59494 ?auto_59493 ) ( not ( = ?auto_59493 ?auto_59494 ) ) ( not ( = ?auto_59493 ?auto_59496 ) ) ( not ( = ?auto_59494 ?auto_59496 ) ) ( not ( = ?auto_59493 ?auto_59495 ) ) ( not ( = ?auto_59493 ?auto_59498 ) ) ( not ( = ?auto_59494 ?auto_59495 ) ) ( not ( = ?auto_59494 ?auto_59498 ) ) ( not ( = ?auto_59496 ?auto_59495 ) ) ( not ( = ?auto_59496 ?auto_59498 ) ) ( not ( = ?auto_59495 ?auto_59498 ) ) ( ON ?auto_59495 ?auto_59496 ) ( not ( = ?auto_59497 ?auto_59498 ) ) ( not ( = ?auto_59493 ?auto_59497 ) ) ( not ( = ?auto_59494 ?auto_59497 ) ) ( not ( = ?auto_59496 ?auto_59497 ) ) ( not ( = ?auto_59495 ?auto_59497 ) ) ( ON ?auto_59498 ?auto_59495 ) ( ON ?auto_59497 ?auto_59498 ) ( CLEAR ?auto_59497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59493 ?auto_59494 ?auto_59496 ?auto_59495 ?auto_59498 )
      ( MAKE-2PILE ?auto_59493 ?auto_59494 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58729 - BLOCK
      ?auto_58730 - BLOCK
    )
    :vars
    (
      ?auto_58734 - BLOCK
      ?auto_58731 - BLOCK
      ?auto_58732 - BLOCK
      ?auto_58735 - BLOCK
      ?auto_58733 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58734 ?auto_58730 ) ( ON-TABLE ?auto_58729 ) ( ON ?auto_58730 ?auto_58729 ) ( not ( = ?auto_58729 ?auto_58730 ) ) ( not ( = ?auto_58729 ?auto_58734 ) ) ( not ( = ?auto_58730 ?auto_58734 ) ) ( not ( = ?auto_58729 ?auto_58731 ) ) ( not ( = ?auto_58729 ?auto_58732 ) ) ( not ( = ?auto_58730 ?auto_58731 ) ) ( not ( = ?auto_58730 ?auto_58732 ) ) ( not ( = ?auto_58734 ?auto_58731 ) ) ( not ( = ?auto_58734 ?auto_58732 ) ) ( not ( = ?auto_58731 ?auto_58732 ) ) ( ON ?auto_58731 ?auto_58734 ) ( not ( = ?auto_58735 ?auto_58733 ) ) ( not ( = ?auto_58735 ?auto_58732 ) ) ( not ( = ?auto_58733 ?auto_58732 ) ) ( not ( = ?auto_58729 ?auto_58733 ) ) ( not ( = ?auto_58729 ?auto_58735 ) ) ( not ( = ?auto_58730 ?auto_58733 ) ) ( not ( = ?auto_58730 ?auto_58735 ) ) ( not ( = ?auto_58734 ?auto_58733 ) ) ( not ( = ?auto_58734 ?auto_58735 ) ) ( not ( = ?auto_58731 ?auto_58733 ) ) ( not ( = ?auto_58731 ?auto_58735 ) ) ( ON ?auto_58732 ?auto_58731 ) ( ON ?auto_58733 ?auto_58732 ) ( CLEAR ?auto_58733 ) ( HOLDING ?auto_58735 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58735 )
      ( MAKE-2PILE ?auto_58729 ?auto_58730 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58736 - BLOCK
      ?auto_58737 - BLOCK
    )
    :vars
    (
      ?auto_58740 - BLOCK
      ?auto_58739 - BLOCK
      ?auto_58742 - BLOCK
      ?auto_58741 - BLOCK
      ?auto_58738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58740 ?auto_58737 ) ( ON-TABLE ?auto_58736 ) ( ON ?auto_58737 ?auto_58736 ) ( not ( = ?auto_58736 ?auto_58737 ) ) ( not ( = ?auto_58736 ?auto_58740 ) ) ( not ( = ?auto_58737 ?auto_58740 ) ) ( not ( = ?auto_58736 ?auto_58739 ) ) ( not ( = ?auto_58736 ?auto_58742 ) ) ( not ( = ?auto_58737 ?auto_58739 ) ) ( not ( = ?auto_58737 ?auto_58742 ) ) ( not ( = ?auto_58740 ?auto_58739 ) ) ( not ( = ?auto_58740 ?auto_58742 ) ) ( not ( = ?auto_58739 ?auto_58742 ) ) ( ON ?auto_58739 ?auto_58740 ) ( not ( = ?auto_58741 ?auto_58738 ) ) ( not ( = ?auto_58741 ?auto_58742 ) ) ( not ( = ?auto_58738 ?auto_58742 ) ) ( not ( = ?auto_58736 ?auto_58738 ) ) ( not ( = ?auto_58736 ?auto_58741 ) ) ( not ( = ?auto_58737 ?auto_58738 ) ) ( not ( = ?auto_58737 ?auto_58741 ) ) ( not ( = ?auto_58740 ?auto_58738 ) ) ( not ( = ?auto_58740 ?auto_58741 ) ) ( not ( = ?auto_58739 ?auto_58738 ) ) ( not ( = ?auto_58739 ?auto_58741 ) ) ( ON ?auto_58742 ?auto_58739 ) ( ON ?auto_58738 ?auto_58742 ) ( ON ?auto_58741 ?auto_58738 ) ( CLEAR ?auto_58741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_58736 ?auto_58737 ?auto_58740 ?auto_58739 ?auto_58742 ?auto_58738 )
      ( MAKE-2PILE ?auto_58736 ?auto_58737 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58748 - BLOCK
      ?auto_58749 - BLOCK
      ?auto_58750 - BLOCK
      ?auto_58751 - BLOCK
      ?auto_58752 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_58752 ) ( CLEAR ?auto_58751 ) ( ON-TABLE ?auto_58748 ) ( ON ?auto_58749 ?auto_58748 ) ( ON ?auto_58750 ?auto_58749 ) ( ON ?auto_58751 ?auto_58750 ) ( not ( = ?auto_58748 ?auto_58749 ) ) ( not ( = ?auto_58748 ?auto_58750 ) ) ( not ( = ?auto_58748 ?auto_58751 ) ) ( not ( = ?auto_58748 ?auto_58752 ) ) ( not ( = ?auto_58749 ?auto_58750 ) ) ( not ( = ?auto_58749 ?auto_58751 ) ) ( not ( = ?auto_58749 ?auto_58752 ) ) ( not ( = ?auto_58750 ?auto_58751 ) ) ( not ( = ?auto_58750 ?auto_58752 ) ) ( not ( = ?auto_58751 ?auto_58752 ) ) )
    :subtasks
    ( ( !STACK ?auto_58752 ?auto_58751 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58753 - BLOCK
      ?auto_58754 - BLOCK
      ?auto_58755 - BLOCK
      ?auto_58756 - BLOCK
      ?auto_58757 - BLOCK
    )
    :vars
    (
      ?auto_58758 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_58756 ) ( ON-TABLE ?auto_58753 ) ( ON ?auto_58754 ?auto_58753 ) ( ON ?auto_58755 ?auto_58754 ) ( ON ?auto_58756 ?auto_58755 ) ( not ( = ?auto_58753 ?auto_58754 ) ) ( not ( = ?auto_58753 ?auto_58755 ) ) ( not ( = ?auto_58753 ?auto_58756 ) ) ( not ( = ?auto_58753 ?auto_58757 ) ) ( not ( = ?auto_58754 ?auto_58755 ) ) ( not ( = ?auto_58754 ?auto_58756 ) ) ( not ( = ?auto_58754 ?auto_58757 ) ) ( not ( = ?auto_58755 ?auto_58756 ) ) ( not ( = ?auto_58755 ?auto_58757 ) ) ( not ( = ?auto_58756 ?auto_58757 ) ) ( ON ?auto_58757 ?auto_58758 ) ( CLEAR ?auto_58757 ) ( HAND-EMPTY ) ( not ( = ?auto_58753 ?auto_58758 ) ) ( not ( = ?auto_58754 ?auto_58758 ) ) ( not ( = ?auto_58755 ?auto_58758 ) ) ( not ( = ?auto_58756 ?auto_58758 ) ) ( not ( = ?auto_58757 ?auto_58758 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58757 ?auto_58758 )
      ( MAKE-5PILE ?auto_58753 ?auto_58754 ?auto_58755 ?auto_58756 ?auto_58757 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58759 - BLOCK
      ?auto_58760 - BLOCK
      ?auto_58761 - BLOCK
      ?auto_58762 - BLOCK
      ?auto_58763 - BLOCK
    )
    :vars
    (
      ?auto_58764 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58759 ) ( ON ?auto_58760 ?auto_58759 ) ( ON ?auto_58761 ?auto_58760 ) ( not ( = ?auto_58759 ?auto_58760 ) ) ( not ( = ?auto_58759 ?auto_58761 ) ) ( not ( = ?auto_58759 ?auto_58762 ) ) ( not ( = ?auto_58759 ?auto_58763 ) ) ( not ( = ?auto_58760 ?auto_58761 ) ) ( not ( = ?auto_58760 ?auto_58762 ) ) ( not ( = ?auto_58760 ?auto_58763 ) ) ( not ( = ?auto_58761 ?auto_58762 ) ) ( not ( = ?auto_58761 ?auto_58763 ) ) ( not ( = ?auto_58762 ?auto_58763 ) ) ( ON ?auto_58763 ?auto_58764 ) ( CLEAR ?auto_58763 ) ( not ( = ?auto_58759 ?auto_58764 ) ) ( not ( = ?auto_58760 ?auto_58764 ) ) ( not ( = ?auto_58761 ?auto_58764 ) ) ( not ( = ?auto_58762 ?auto_58764 ) ) ( not ( = ?auto_58763 ?auto_58764 ) ) ( HOLDING ?auto_58762 ) ( CLEAR ?auto_58761 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58759 ?auto_58760 ?auto_58761 ?auto_58762 )
      ( MAKE-5PILE ?auto_58759 ?auto_58760 ?auto_58761 ?auto_58762 ?auto_58763 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58765 - BLOCK
      ?auto_58766 - BLOCK
      ?auto_58767 - BLOCK
      ?auto_58768 - BLOCK
      ?auto_58769 - BLOCK
    )
    :vars
    (
      ?auto_58770 - BLOCK
      ?auto_58771 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58765 ) ( ON ?auto_58766 ?auto_58765 ) ( ON ?auto_58767 ?auto_58766 ) ( not ( = ?auto_58765 ?auto_58766 ) ) ( not ( = ?auto_58765 ?auto_58767 ) ) ( not ( = ?auto_58765 ?auto_58768 ) ) ( not ( = ?auto_58765 ?auto_58769 ) ) ( not ( = ?auto_58766 ?auto_58767 ) ) ( not ( = ?auto_58766 ?auto_58768 ) ) ( not ( = ?auto_58766 ?auto_58769 ) ) ( not ( = ?auto_58767 ?auto_58768 ) ) ( not ( = ?auto_58767 ?auto_58769 ) ) ( not ( = ?auto_58768 ?auto_58769 ) ) ( ON ?auto_58769 ?auto_58770 ) ( not ( = ?auto_58765 ?auto_58770 ) ) ( not ( = ?auto_58766 ?auto_58770 ) ) ( not ( = ?auto_58767 ?auto_58770 ) ) ( not ( = ?auto_58768 ?auto_58770 ) ) ( not ( = ?auto_58769 ?auto_58770 ) ) ( CLEAR ?auto_58767 ) ( ON ?auto_58768 ?auto_58769 ) ( CLEAR ?auto_58768 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58771 ) ( ON ?auto_58770 ?auto_58771 ) ( not ( = ?auto_58771 ?auto_58770 ) ) ( not ( = ?auto_58771 ?auto_58769 ) ) ( not ( = ?auto_58771 ?auto_58768 ) ) ( not ( = ?auto_58765 ?auto_58771 ) ) ( not ( = ?auto_58766 ?auto_58771 ) ) ( not ( = ?auto_58767 ?auto_58771 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58771 ?auto_58770 ?auto_58769 )
      ( MAKE-5PILE ?auto_58765 ?auto_58766 ?auto_58767 ?auto_58768 ?auto_58769 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58772 - BLOCK
      ?auto_58773 - BLOCK
      ?auto_58774 - BLOCK
      ?auto_58775 - BLOCK
      ?auto_58776 - BLOCK
    )
    :vars
    (
      ?auto_58778 - BLOCK
      ?auto_58777 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58772 ) ( ON ?auto_58773 ?auto_58772 ) ( not ( = ?auto_58772 ?auto_58773 ) ) ( not ( = ?auto_58772 ?auto_58774 ) ) ( not ( = ?auto_58772 ?auto_58775 ) ) ( not ( = ?auto_58772 ?auto_58776 ) ) ( not ( = ?auto_58773 ?auto_58774 ) ) ( not ( = ?auto_58773 ?auto_58775 ) ) ( not ( = ?auto_58773 ?auto_58776 ) ) ( not ( = ?auto_58774 ?auto_58775 ) ) ( not ( = ?auto_58774 ?auto_58776 ) ) ( not ( = ?auto_58775 ?auto_58776 ) ) ( ON ?auto_58776 ?auto_58778 ) ( not ( = ?auto_58772 ?auto_58778 ) ) ( not ( = ?auto_58773 ?auto_58778 ) ) ( not ( = ?auto_58774 ?auto_58778 ) ) ( not ( = ?auto_58775 ?auto_58778 ) ) ( not ( = ?auto_58776 ?auto_58778 ) ) ( ON ?auto_58775 ?auto_58776 ) ( CLEAR ?auto_58775 ) ( ON-TABLE ?auto_58777 ) ( ON ?auto_58778 ?auto_58777 ) ( not ( = ?auto_58777 ?auto_58778 ) ) ( not ( = ?auto_58777 ?auto_58776 ) ) ( not ( = ?auto_58777 ?auto_58775 ) ) ( not ( = ?auto_58772 ?auto_58777 ) ) ( not ( = ?auto_58773 ?auto_58777 ) ) ( not ( = ?auto_58774 ?auto_58777 ) ) ( HOLDING ?auto_58774 ) ( CLEAR ?auto_58773 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58772 ?auto_58773 ?auto_58774 )
      ( MAKE-5PILE ?auto_58772 ?auto_58773 ?auto_58774 ?auto_58775 ?auto_58776 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58779 - BLOCK
      ?auto_58780 - BLOCK
      ?auto_58781 - BLOCK
      ?auto_58782 - BLOCK
      ?auto_58783 - BLOCK
    )
    :vars
    (
      ?auto_58784 - BLOCK
      ?auto_58785 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58779 ) ( ON ?auto_58780 ?auto_58779 ) ( not ( = ?auto_58779 ?auto_58780 ) ) ( not ( = ?auto_58779 ?auto_58781 ) ) ( not ( = ?auto_58779 ?auto_58782 ) ) ( not ( = ?auto_58779 ?auto_58783 ) ) ( not ( = ?auto_58780 ?auto_58781 ) ) ( not ( = ?auto_58780 ?auto_58782 ) ) ( not ( = ?auto_58780 ?auto_58783 ) ) ( not ( = ?auto_58781 ?auto_58782 ) ) ( not ( = ?auto_58781 ?auto_58783 ) ) ( not ( = ?auto_58782 ?auto_58783 ) ) ( ON ?auto_58783 ?auto_58784 ) ( not ( = ?auto_58779 ?auto_58784 ) ) ( not ( = ?auto_58780 ?auto_58784 ) ) ( not ( = ?auto_58781 ?auto_58784 ) ) ( not ( = ?auto_58782 ?auto_58784 ) ) ( not ( = ?auto_58783 ?auto_58784 ) ) ( ON ?auto_58782 ?auto_58783 ) ( ON-TABLE ?auto_58785 ) ( ON ?auto_58784 ?auto_58785 ) ( not ( = ?auto_58785 ?auto_58784 ) ) ( not ( = ?auto_58785 ?auto_58783 ) ) ( not ( = ?auto_58785 ?auto_58782 ) ) ( not ( = ?auto_58779 ?auto_58785 ) ) ( not ( = ?auto_58780 ?auto_58785 ) ) ( not ( = ?auto_58781 ?auto_58785 ) ) ( CLEAR ?auto_58780 ) ( ON ?auto_58781 ?auto_58782 ) ( CLEAR ?auto_58781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58785 ?auto_58784 ?auto_58783 ?auto_58782 )
      ( MAKE-5PILE ?auto_58779 ?auto_58780 ?auto_58781 ?auto_58782 ?auto_58783 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58786 - BLOCK
      ?auto_58787 - BLOCK
      ?auto_58788 - BLOCK
      ?auto_58789 - BLOCK
      ?auto_58790 - BLOCK
    )
    :vars
    (
      ?auto_58792 - BLOCK
      ?auto_58791 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58786 ) ( not ( = ?auto_58786 ?auto_58787 ) ) ( not ( = ?auto_58786 ?auto_58788 ) ) ( not ( = ?auto_58786 ?auto_58789 ) ) ( not ( = ?auto_58786 ?auto_58790 ) ) ( not ( = ?auto_58787 ?auto_58788 ) ) ( not ( = ?auto_58787 ?auto_58789 ) ) ( not ( = ?auto_58787 ?auto_58790 ) ) ( not ( = ?auto_58788 ?auto_58789 ) ) ( not ( = ?auto_58788 ?auto_58790 ) ) ( not ( = ?auto_58789 ?auto_58790 ) ) ( ON ?auto_58790 ?auto_58792 ) ( not ( = ?auto_58786 ?auto_58792 ) ) ( not ( = ?auto_58787 ?auto_58792 ) ) ( not ( = ?auto_58788 ?auto_58792 ) ) ( not ( = ?auto_58789 ?auto_58792 ) ) ( not ( = ?auto_58790 ?auto_58792 ) ) ( ON ?auto_58789 ?auto_58790 ) ( ON-TABLE ?auto_58791 ) ( ON ?auto_58792 ?auto_58791 ) ( not ( = ?auto_58791 ?auto_58792 ) ) ( not ( = ?auto_58791 ?auto_58790 ) ) ( not ( = ?auto_58791 ?auto_58789 ) ) ( not ( = ?auto_58786 ?auto_58791 ) ) ( not ( = ?auto_58787 ?auto_58791 ) ) ( not ( = ?auto_58788 ?auto_58791 ) ) ( ON ?auto_58788 ?auto_58789 ) ( CLEAR ?auto_58788 ) ( HOLDING ?auto_58787 ) ( CLEAR ?auto_58786 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58786 ?auto_58787 )
      ( MAKE-5PILE ?auto_58786 ?auto_58787 ?auto_58788 ?auto_58789 ?auto_58790 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58793 - BLOCK
      ?auto_58794 - BLOCK
      ?auto_58795 - BLOCK
      ?auto_58796 - BLOCK
      ?auto_58797 - BLOCK
    )
    :vars
    (
      ?auto_58799 - BLOCK
      ?auto_58798 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58793 ) ( not ( = ?auto_58793 ?auto_58794 ) ) ( not ( = ?auto_58793 ?auto_58795 ) ) ( not ( = ?auto_58793 ?auto_58796 ) ) ( not ( = ?auto_58793 ?auto_58797 ) ) ( not ( = ?auto_58794 ?auto_58795 ) ) ( not ( = ?auto_58794 ?auto_58796 ) ) ( not ( = ?auto_58794 ?auto_58797 ) ) ( not ( = ?auto_58795 ?auto_58796 ) ) ( not ( = ?auto_58795 ?auto_58797 ) ) ( not ( = ?auto_58796 ?auto_58797 ) ) ( ON ?auto_58797 ?auto_58799 ) ( not ( = ?auto_58793 ?auto_58799 ) ) ( not ( = ?auto_58794 ?auto_58799 ) ) ( not ( = ?auto_58795 ?auto_58799 ) ) ( not ( = ?auto_58796 ?auto_58799 ) ) ( not ( = ?auto_58797 ?auto_58799 ) ) ( ON ?auto_58796 ?auto_58797 ) ( ON-TABLE ?auto_58798 ) ( ON ?auto_58799 ?auto_58798 ) ( not ( = ?auto_58798 ?auto_58799 ) ) ( not ( = ?auto_58798 ?auto_58797 ) ) ( not ( = ?auto_58798 ?auto_58796 ) ) ( not ( = ?auto_58793 ?auto_58798 ) ) ( not ( = ?auto_58794 ?auto_58798 ) ) ( not ( = ?auto_58795 ?auto_58798 ) ) ( ON ?auto_58795 ?auto_58796 ) ( CLEAR ?auto_58793 ) ( ON ?auto_58794 ?auto_58795 ) ( CLEAR ?auto_58794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58798 ?auto_58799 ?auto_58797 ?auto_58796 ?auto_58795 )
      ( MAKE-5PILE ?auto_58793 ?auto_58794 ?auto_58795 ?auto_58796 ?auto_58797 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58800 - BLOCK
      ?auto_58801 - BLOCK
      ?auto_58802 - BLOCK
      ?auto_58803 - BLOCK
      ?auto_58804 - BLOCK
    )
    :vars
    (
      ?auto_58805 - BLOCK
      ?auto_58806 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58800 ?auto_58801 ) ) ( not ( = ?auto_58800 ?auto_58802 ) ) ( not ( = ?auto_58800 ?auto_58803 ) ) ( not ( = ?auto_58800 ?auto_58804 ) ) ( not ( = ?auto_58801 ?auto_58802 ) ) ( not ( = ?auto_58801 ?auto_58803 ) ) ( not ( = ?auto_58801 ?auto_58804 ) ) ( not ( = ?auto_58802 ?auto_58803 ) ) ( not ( = ?auto_58802 ?auto_58804 ) ) ( not ( = ?auto_58803 ?auto_58804 ) ) ( ON ?auto_58804 ?auto_58805 ) ( not ( = ?auto_58800 ?auto_58805 ) ) ( not ( = ?auto_58801 ?auto_58805 ) ) ( not ( = ?auto_58802 ?auto_58805 ) ) ( not ( = ?auto_58803 ?auto_58805 ) ) ( not ( = ?auto_58804 ?auto_58805 ) ) ( ON ?auto_58803 ?auto_58804 ) ( ON-TABLE ?auto_58806 ) ( ON ?auto_58805 ?auto_58806 ) ( not ( = ?auto_58806 ?auto_58805 ) ) ( not ( = ?auto_58806 ?auto_58804 ) ) ( not ( = ?auto_58806 ?auto_58803 ) ) ( not ( = ?auto_58800 ?auto_58806 ) ) ( not ( = ?auto_58801 ?auto_58806 ) ) ( not ( = ?auto_58802 ?auto_58806 ) ) ( ON ?auto_58802 ?auto_58803 ) ( ON ?auto_58801 ?auto_58802 ) ( CLEAR ?auto_58801 ) ( HOLDING ?auto_58800 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58800 )
      ( MAKE-5PILE ?auto_58800 ?auto_58801 ?auto_58802 ?auto_58803 ?auto_58804 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58807 - BLOCK
      ?auto_58808 - BLOCK
      ?auto_58809 - BLOCK
      ?auto_58810 - BLOCK
      ?auto_58811 - BLOCK
    )
    :vars
    (
      ?auto_58813 - BLOCK
      ?auto_58812 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58807 ?auto_58808 ) ) ( not ( = ?auto_58807 ?auto_58809 ) ) ( not ( = ?auto_58807 ?auto_58810 ) ) ( not ( = ?auto_58807 ?auto_58811 ) ) ( not ( = ?auto_58808 ?auto_58809 ) ) ( not ( = ?auto_58808 ?auto_58810 ) ) ( not ( = ?auto_58808 ?auto_58811 ) ) ( not ( = ?auto_58809 ?auto_58810 ) ) ( not ( = ?auto_58809 ?auto_58811 ) ) ( not ( = ?auto_58810 ?auto_58811 ) ) ( ON ?auto_58811 ?auto_58813 ) ( not ( = ?auto_58807 ?auto_58813 ) ) ( not ( = ?auto_58808 ?auto_58813 ) ) ( not ( = ?auto_58809 ?auto_58813 ) ) ( not ( = ?auto_58810 ?auto_58813 ) ) ( not ( = ?auto_58811 ?auto_58813 ) ) ( ON ?auto_58810 ?auto_58811 ) ( ON-TABLE ?auto_58812 ) ( ON ?auto_58813 ?auto_58812 ) ( not ( = ?auto_58812 ?auto_58813 ) ) ( not ( = ?auto_58812 ?auto_58811 ) ) ( not ( = ?auto_58812 ?auto_58810 ) ) ( not ( = ?auto_58807 ?auto_58812 ) ) ( not ( = ?auto_58808 ?auto_58812 ) ) ( not ( = ?auto_58809 ?auto_58812 ) ) ( ON ?auto_58809 ?auto_58810 ) ( ON ?auto_58808 ?auto_58809 ) ( ON ?auto_58807 ?auto_58808 ) ( CLEAR ?auto_58807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_58812 ?auto_58813 ?auto_58811 ?auto_58810 ?auto_58809 ?auto_58808 )
      ( MAKE-5PILE ?auto_58807 ?auto_58808 ?auto_58809 ?auto_58810 ?auto_58811 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58815 - BLOCK
    )
    :vars
    (
      ?auto_58816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58816 ?auto_58815 ) ( CLEAR ?auto_58816 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58815 ) ( not ( = ?auto_58815 ?auto_58816 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58816 ?auto_58815 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58817 - BLOCK
    )
    :vars
    (
      ?auto_58818 - BLOCK
      ?auto_58819 - BLOCK
      ?auto_58820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58818 ?auto_58817 ) ( CLEAR ?auto_58818 ) ( ON-TABLE ?auto_58817 ) ( not ( = ?auto_58817 ?auto_58818 ) ) ( HOLDING ?auto_58819 ) ( CLEAR ?auto_58820 ) ( not ( = ?auto_58817 ?auto_58819 ) ) ( not ( = ?auto_58817 ?auto_58820 ) ) ( not ( = ?auto_58818 ?auto_58819 ) ) ( not ( = ?auto_58818 ?auto_58820 ) ) ( not ( = ?auto_58819 ?auto_58820 ) ) )
    :subtasks
    ( ( !STACK ?auto_58819 ?auto_58820 )
      ( MAKE-1PILE ?auto_58817 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58821 - BLOCK
    )
    :vars
    (
      ?auto_58822 - BLOCK
      ?auto_58823 - BLOCK
      ?auto_58824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58822 ?auto_58821 ) ( ON-TABLE ?auto_58821 ) ( not ( = ?auto_58821 ?auto_58822 ) ) ( CLEAR ?auto_58823 ) ( not ( = ?auto_58821 ?auto_58824 ) ) ( not ( = ?auto_58821 ?auto_58823 ) ) ( not ( = ?auto_58822 ?auto_58824 ) ) ( not ( = ?auto_58822 ?auto_58823 ) ) ( not ( = ?auto_58824 ?auto_58823 ) ) ( ON ?auto_58824 ?auto_58822 ) ( CLEAR ?auto_58824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58821 ?auto_58822 )
      ( MAKE-1PILE ?auto_58821 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58825 - BLOCK
    )
    :vars
    (
      ?auto_58828 - BLOCK
      ?auto_58826 - BLOCK
      ?auto_58827 - BLOCK
      ?auto_58830 - BLOCK
      ?auto_58831 - BLOCK
      ?auto_58829 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58828 ?auto_58825 ) ( ON-TABLE ?auto_58825 ) ( not ( = ?auto_58825 ?auto_58828 ) ) ( not ( = ?auto_58825 ?auto_58826 ) ) ( not ( = ?auto_58825 ?auto_58827 ) ) ( not ( = ?auto_58828 ?auto_58826 ) ) ( not ( = ?auto_58828 ?auto_58827 ) ) ( not ( = ?auto_58826 ?auto_58827 ) ) ( ON ?auto_58826 ?auto_58828 ) ( CLEAR ?auto_58826 ) ( HOLDING ?auto_58827 ) ( CLEAR ?auto_58830 ) ( ON-TABLE ?auto_58831 ) ( ON ?auto_58829 ?auto_58831 ) ( ON ?auto_58830 ?auto_58829 ) ( not ( = ?auto_58831 ?auto_58829 ) ) ( not ( = ?auto_58831 ?auto_58830 ) ) ( not ( = ?auto_58831 ?auto_58827 ) ) ( not ( = ?auto_58829 ?auto_58830 ) ) ( not ( = ?auto_58829 ?auto_58827 ) ) ( not ( = ?auto_58830 ?auto_58827 ) ) ( not ( = ?auto_58825 ?auto_58830 ) ) ( not ( = ?auto_58825 ?auto_58831 ) ) ( not ( = ?auto_58825 ?auto_58829 ) ) ( not ( = ?auto_58828 ?auto_58830 ) ) ( not ( = ?auto_58828 ?auto_58831 ) ) ( not ( = ?auto_58828 ?auto_58829 ) ) ( not ( = ?auto_58826 ?auto_58830 ) ) ( not ( = ?auto_58826 ?auto_58831 ) ) ( not ( = ?auto_58826 ?auto_58829 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58831 ?auto_58829 ?auto_58830 ?auto_58827 )
      ( MAKE-1PILE ?auto_58825 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58832 - BLOCK
    )
    :vars
    (
      ?auto_58833 - BLOCK
      ?auto_58835 - BLOCK
      ?auto_58834 - BLOCK
      ?auto_58836 - BLOCK
      ?auto_58837 - BLOCK
      ?auto_58838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58833 ?auto_58832 ) ( ON-TABLE ?auto_58832 ) ( not ( = ?auto_58832 ?auto_58833 ) ) ( not ( = ?auto_58832 ?auto_58835 ) ) ( not ( = ?auto_58832 ?auto_58834 ) ) ( not ( = ?auto_58833 ?auto_58835 ) ) ( not ( = ?auto_58833 ?auto_58834 ) ) ( not ( = ?auto_58835 ?auto_58834 ) ) ( ON ?auto_58835 ?auto_58833 ) ( CLEAR ?auto_58836 ) ( ON-TABLE ?auto_58837 ) ( ON ?auto_58838 ?auto_58837 ) ( ON ?auto_58836 ?auto_58838 ) ( not ( = ?auto_58837 ?auto_58838 ) ) ( not ( = ?auto_58837 ?auto_58836 ) ) ( not ( = ?auto_58837 ?auto_58834 ) ) ( not ( = ?auto_58838 ?auto_58836 ) ) ( not ( = ?auto_58838 ?auto_58834 ) ) ( not ( = ?auto_58836 ?auto_58834 ) ) ( not ( = ?auto_58832 ?auto_58836 ) ) ( not ( = ?auto_58832 ?auto_58837 ) ) ( not ( = ?auto_58832 ?auto_58838 ) ) ( not ( = ?auto_58833 ?auto_58836 ) ) ( not ( = ?auto_58833 ?auto_58837 ) ) ( not ( = ?auto_58833 ?auto_58838 ) ) ( not ( = ?auto_58835 ?auto_58836 ) ) ( not ( = ?auto_58835 ?auto_58837 ) ) ( not ( = ?auto_58835 ?auto_58838 ) ) ( ON ?auto_58834 ?auto_58835 ) ( CLEAR ?auto_58834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58832 ?auto_58833 ?auto_58835 )
      ( MAKE-1PILE ?auto_58832 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58839 - BLOCK
    )
    :vars
    (
      ?auto_58840 - BLOCK
      ?auto_58845 - BLOCK
      ?auto_58841 - BLOCK
      ?auto_58843 - BLOCK
      ?auto_58842 - BLOCK
      ?auto_58844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58840 ?auto_58839 ) ( ON-TABLE ?auto_58839 ) ( not ( = ?auto_58839 ?auto_58840 ) ) ( not ( = ?auto_58839 ?auto_58845 ) ) ( not ( = ?auto_58839 ?auto_58841 ) ) ( not ( = ?auto_58840 ?auto_58845 ) ) ( not ( = ?auto_58840 ?auto_58841 ) ) ( not ( = ?auto_58845 ?auto_58841 ) ) ( ON ?auto_58845 ?auto_58840 ) ( ON-TABLE ?auto_58843 ) ( ON ?auto_58842 ?auto_58843 ) ( not ( = ?auto_58843 ?auto_58842 ) ) ( not ( = ?auto_58843 ?auto_58844 ) ) ( not ( = ?auto_58843 ?auto_58841 ) ) ( not ( = ?auto_58842 ?auto_58844 ) ) ( not ( = ?auto_58842 ?auto_58841 ) ) ( not ( = ?auto_58844 ?auto_58841 ) ) ( not ( = ?auto_58839 ?auto_58844 ) ) ( not ( = ?auto_58839 ?auto_58843 ) ) ( not ( = ?auto_58839 ?auto_58842 ) ) ( not ( = ?auto_58840 ?auto_58844 ) ) ( not ( = ?auto_58840 ?auto_58843 ) ) ( not ( = ?auto_58840 ?auto_58842 ) ) ( not ( = ?auto_58845 ?auto_58844 ) ) ( not ( = ?auto_58845 ?auto_58843 ) ) ( not ( = ?auto_58845 ?auto_58842 ) ) ( ON ?auto_58841 ?auto_58845 ) ( CLEAR ?auto_58841 ) ( HOLDING ?auto_58844 ) ( CLEAR ?auto_58842 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58843 ?auto_58842 ?auto_58844 )
      ( MAKE-1PILE ?auto_58839 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58846 - BLOCK
    )
    :vars
    (
      ?auto_58850 - BLOCK
      ?auto_58851 - BLOCK
      ?auto_58849 - BLOCK
      ?auto_58852 - BLOCK
      ?auto_58848 - BLOCK
      ?auto_58847 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58850 ?auto_58846 ) ( ON-TABLE ?auto_58846 ) ( not ( = ?auto_58846 ?auto_58850 ) ) ( not ( = ?auto_58846 ?auto_58851 ) ) ( not ( = ?auto_58846 ?auto_58849 ) ) ( not ( = ?auto_58850 ?auto_58851 ) ) ( not ( = ?auto_58850 ?auto_58849 ) ) ( not ( = ?auto_58851 ?auto_58849 ) ) ( ON ?auto_58851 ?auto_58850 ) ( ON-TABLE ?auto_58852 ) ( ON ?auto_58848 ?auto_58852 ) ( not ( = ?auto_58852 ?auto_58848 ) ) ( not ( = ?auto_58852 ?auto_58847 ) ) ( not ( = ?auto_58852 ?auto_58849 ) ) ( not ( = ?auto_58848 ?auto_58847 ) ) ( not ( = ?auto_58848 ?auto_58849 ) ) ( not ( = ?auto_58847 ?auto_58849 ) ) ( not ( = ?auto_58846 ?auto_58847 ) ) ( not ( = ?auto_58846 ?auto_58852 ) ) ( not ( = ?auto_58846 ?auto_58848 ) ) ( not ( = ?auto_58850 ?auto_58847 ) ) ( not ( = ?auto_58850 ?auto_58852 ) ) ( not ( = ?auto_58850 ?auto_58848 ) ) ( not ( = ?auto_58851 ?auto_58847 ) ) ( not ( = ?auto_58851 ?auto_58852 ) ) ( not ( = ?auto_58851 ?auto_58848 ) ) ( ON ?auto_58849 ?auto_58851 ) ( CLEAR ?auto_58848 ) ( ON ?auto_58847 ?auto_58849 ) ( CLEAR ?auto_58847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58846 ?auto_58850 ?auto_58851 ?auto_58849 )
      ( MAKE-1PILE ?auto_58846 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58853 - BLOCK
    )
    :vars
    (
      ?auto_58856 - BLOCK
      ?auto_58854 - BLOCK
      ?auto_58855 - BLOCK
      ?auto_58857 - BLOCK
      ?auto_58858 - BLOCK
      ?auto_58859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58856 ?auto_58853 ) ( ON-TABLE ?auto_58853 ) ( not ( = ?auto_58853 ?auto_58856 ) ) ( not ( = ?auto_58853 ?auto_58854 ) ) ( not ( = ?auto_58853 ?auto_58855 ) ) ( not ( = ?auto_58856 ?auto_58854 ) ) ( not ( = ?auto_58856 ?auto_58855 ) ) ( not ( = ?auto_58854 ?auto_58855 ) ) ( ON ?auto_58854 ?auto_58856 ) ( ON-TABLE ?auto_58857 ) ( not ( = ?auto_58857 ?auto_58858 ) ) ( not ( = ?auto_58857 ?auto_58859 ) ) ( not ( = ?auto_58857 ?auto_58855 ) ) ( not ( = ?auto_58858 ?auto_58859 ) ) ( not ( = ?auto_58858 ?auto_58855 ) ) ( not ( = ?auto_58859 ?auto_58855 ) ) ( not ( = ?auto_58853 ?auto_58859 ) ) ( not ( = ?auto_58853 ?auto_58857 ) ) ( not ( = ?auto_58853 ?auto_58858 ) ) ( not ( = ?auto_58856 ?auto_58859 ) ) ( not ( = ?auto_58856 ?auto_58857 ) ) ( not ( = ?auto_58856 ?auto_58858 ) ) ( not ( = ?auto_58854 ?auto_58859 ) ) ( not ( = ?auto_58854 ?auto_58857 ) ) ( not ( = ?auto_58854 ?auto_58858 ) ) ( ON ?auto_58855 ?auto_58854 ) ( ON ?auto_58859 ?auto_58855 ) ( CLEAR ?auto_58859 ) ( HOLDING ?auto_58858 ) ( CLEAR ?auto_58857 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58857 ?auto_58858 )
      ( MAKE-1PILE ?auto_58853 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59706 - BLOCK
    )
    :vars
    (
      ?auto_59711 - BLOCK
      ?auto_59709 - BLOCK
      ?auto_59707 - BLOCK
      ?auto_59708 - BLOCK
      ?auto_59710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59711 ?auto_59706 ) ( ON-TABLE ?auto_59706 ) ( not ( = ?auto_59706 ?auto_59711 ) ) ( not ( = ?auto_59706 ?auto_59709 ) ) ( not ( = ?auto_59706 ?auto_59707 ) ) ( not ( = ?auto_59711 ?auto_59709 ) ) ( not ( = ?auto_59711 ?auto_59707 ) ) ( not ( = ?auto_59709 ?auto_59707 ) ) ( ON ?auto_59709 ?auto_59711 ) ( not ( = ?auto_59708 ?auto_59710 ) ) ( not ( = ?auto_59708 ?auto_59707 ) ) ( not ( = ?auto_59710 ?auto_59707 ) ) ( not ( = ?auto_59706 ?auto_59710 ) ) ( not ( = ?auto_59706 ?auto_59708 ) ) ( not ( = ?auto_59711 ?auto_59710 ) ) ( not ( = ?auto_59711 ?auto_59708 ) ) ( not ( = ?auto_59709 ?auto_59710 ) ) ( not ( = ?auto_59709 ?auto_59708 ) ) ( ON ?auto_59707 ?auto_59709 ) ( ON ?auto_59710 ?auto_59707 ) ( ON ?auto_59708 ?auto_59710 ) ( CLEAR ?auto_59708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59706 ?auto_59711 ?auto_59709 ?auto_59707 ?auto_59710 )
      ( MAKE-1PILE ?auto_59706 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58867 - BLOCK
    )
    :vars
    (
      ?auto_58871 - BLOCK
      ?auto_58868 - BLOCK
      ?auto_58869 - BLOCK
      ?auto_58872 - BLOCK
      ?auto_58870 - BLOCK
      ?auto_58873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58871 ?auto_58867 ) ( ON-TABLE ?auto_58867 ) ( not ( = ?auto_58867 ?auto_58871 ) ) ( not ( = ?auto_58867 ?auto_58868 ) ) ( not ( = ?auto_58867 ?auto_58869 ) ) ( not ( = ?auto_58871 ?auto_58868 ) ) ( not ( = ?auto_58871 ?auto_58869 ) ) ( not ( = ?auto_58868 ?auto_58869 ) ) ( ON ?auto_58868 ?auto_58871 ) ( not ( = ?auto_58872 ?auto_58870 ) ) ( not ( = ?auto_58872 ?auto_58873 ) ) ( not ( = ?auto_58872 ?auto_58869 ) ) ( not ( = ?auto_58870 ?auto_58873 ) ) ( not ( = ?auto_58870 ?auto_58869 ) ) ( not ( = ?auto_58873 ?auto_58869 ) ) ( not ( = ?auto_58867 ?auto_58873 ) ) ( not ( = ?auto_58867 ?auto_58872 ) ) ( not ( = ?auto_58867 ?auto_58870 ) ) ( not ( = ?auto_58871 ?auto_58873 ) ) ( not ( = ?auto_58871 ?auto_58872 ) ) ( not ( = ?auto_58871 ?auto_58870 ) ) ( not ( = ?auto_58868 ?auto_58873 ) ) ( not ( = ?auto_58868 ?auto_58872 ) ) ( not ( = ?auto_58868 ?auto_58870 ) ) ( ON ?auto_58869 ?auto_58868 ) ( ON ?auto_58873 ?auto_58869 ) ( ON ?auto_58870 ?auto_58873 ) ( CLEAR ?auto_58870 ) ( HOLDING ?auto_58872 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58872 )
      ( MAKE-1PILE ?auto_58867 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58874 - BLOCK
    )
    :vars
    (
      ?auto_58878 - BLOCK
      ?auto_58876 - BLOCK
      ?auto_58877 - BLOCK
      ?auto_58880 - BLOCK
      ?auto_58879 - BLOCK
      ?auto_58875 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58878 ?auto_58874 ) ( ON-TABLE ?auto_58874 ) ( not ( = ?auto_58874 ?auto_58878 ) ) ( not ( = ?auto_58874 ?auto_58876 ) ) ( not ( = ?auto_58874 ?auto_58877 ) ) ( not ( = ?auto_58878 ?auto_58876 ) ) ( not ( = ?auto_58878 ?auto_58877 ) ) ( not ( = ?auto_58876 ?auto_58877 ) ) ( ON ?auto_58876 ?auto_58878 ) ( not ( = ?auto_58880 ?auto_58879 ) ) ( not ( = ?auto_58880 ?auto_58875 ) ) ( not ( = ?auto_58880 ?auto_58877 ) ) ( not ( = ?auto_58879 ?auto_58875 ) ) ( not ( = ?auto_58879 ?auto_58877 ) ) ( not ( = ?auto_58875 ?auto_58877 ) ) ( not ( = ?auto_58874 ?auto_58875 ) ) ( not ( = ?auto_58874 ?auto_58880 ) ) ( not ( = ?auto_58874 ?auto_58879 ) ) ( not ( = ?auto_58878 ?auto_58875 ) ) ( not ( = ?auto_58878 ?auto_58880 ) ) ( not ( = ?auto_58878 ?auto_58879 ) ) ( not ( = ?auto_58876 ?auto_58875 ) ) ( not ( = ?auto_58876 ?auto_58880 ) ) ( not ( = ?auto_58876 ?auto_58879 ) ) ( ON ?auto_58877 ?auto_58876 ) ( ON ?auto_58875 ?auto_58877 ) ( ON ?auto_58879 ?auto_58875 ) ( ON ?auto_58880 ?auto_58879 ) ( CLEAR ?auto_58880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_58874 ?auto_58878 ?auto_58876 ?auto_58877 ?auto_58875 ?auto_58879 )
      ( MAKE-1PILE ?auto_58874 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58887 - BLOCK
      ?auto_58888 - BLOCK
      ?auto_58889 - BLOCK
      ?auto_58890 - BLOCK
      ?auto_58891 - BLOCK
      ?auto_58892 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_58892 ) ( CLEAR ?auto_58891 ) ( ON-TABLE ?auto_58887 ) ( ON ?auto_58888 ?auto_58887 ) ( ON ?auto_58889 ?auto_58888 ) ( ON ?auto_58890 ?auto_58889 ) ( ON ?auto_58891 ?auto_58890 ) ( not ( = ?auto_58887 ?auto_58888 ) ) ( not ( = ?auto_58887 ?auto_58889 ) ) ( not ( = ?auto_58887 ?auto_58890 ) ) ( not ( = ?auto_58887 ?auto_58891 ) ) ( not ( = ?auto_58887 ?auto_58892 ) ) ( not ( = ?auto_58888 ?auto_58889 ) ) ( not ( = ?auto_58888 ?auto_58890 ) ) ( not ( = ?auto_58888 ?auto_58891 ) ) ( not ( = ?auto_58888 ?auto_58892 ) ) ( not ( = ?auto_58889 ?auto_58890 ) ) ( not ( = ?auto_58889 ?auto_58891 ) ) ( not ( = ?auto_58889 ?auto_58892 ) ) ( not ( = ?auto_58890 ?auto_58891 ) ) ( not ( = ?auto_58890 ?auto_58892 ) ) ( not ( = ?auto_58891 ?auto_58892 ) ) )
    :subtasks
    ( ( !STACK ?auto_58892 ?auto_58891 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58893 - BLOCK
      ?auto_58894 - BLOCK
      ?auto_58895 - BLOCK
      ?auto_58896 - BLOCK
      ?auto_58897 - BLOCK
      ?auto_58898 - BLOCK
    )
    :vars
    (
      ?auto_58899 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_58897 ) ( ON-TABLE ?auto_58893 ) ( ON ?auto_58894 ?auto_58893 ) ( ON ?auto_58895 ?auto_58894 ) ( ON ?auto_58896 ?auto_58895 ) ( ON ?auto_58897 ?auto_58896 ) ( not ( = ?auto_58893 ?auto_58894 ) ) ( not ( = ?auto_58893 ?auto_58895 ) ) ( not ( = ?auto_58893 ?auto_58896 ) ) ( not ( = ?auto_58893 ?auto_58897 ) ) ( not ( = ?auto_58893 ?auto_58898 ) ) ( not ( = ?auto_58894 ?auto_58895 ) ) ( not ( = ?auto_58894 ?auto_58896 ) ) ( not ( = ?auto_58894 ?auto_58897 ) ) ( not ( = ?auto_58894 ?auto_58898 ) ) ( not ( = ?auto_58895 ?auto_58896 ) ) ( not ( = ?auto_58895 ?auto_58897 ) ) ( not ( = ?auto_58895 ?auto_58898 ) ) ( not ( = ?auto_58896 ?auto_58897 ) ) ( not ( = ?auto_58896 ?auto_58898 ) ) ( not ( = ?auto_58897 ?auto_58898 ) ) ( ON ?auto_58898 ?auto_58899 ) ( CLEAR ?auto_58898 ) ( HAND-EMPTY ) ( not ( = ?auto_58893 ?auto_58899 ) ) ( not ( = ?auto_58894 ?auto_58899 ) ) ( not ( = ?auto_58895 ?auto_58899 ) ) ( not ( = ?auto_58896 ?auto_58899 ) ) ( not ( = ?auto_58897 ?auto_58899 ) ) ( not ( = ?auto_58898 ?auto_58899 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58898 ?auto_58899 )
      ( MAKE-6PILE ?auto_58893 ?auto_58894 ?auto_58895 ?auto_58896 ?auto_58897 ?auto_58898 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58900 - BLOCK
      ?auto_58901 - BLOCK
      ?auto_58902 - BLOCK
      ?auto_58903 - BLOCK
      ?auto_58904 - BLOCK
      ?auto_58905 - BLOCK
    )
    :vars
    (
      ?auto_58906 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58900 ) ( ON ?auto_58901 ?auto_58900 ) ( ON ?auto_58902 ?auto_58901 ) ( ON ?auto_58903 ?auto_58902 ) ( not ( = ?auto_58900 ?auto_58901 ) ) ( not ( = ?auto_58900 ?auto_58902 ) ) ( not ( = ?auto_58900 ?auto_58903 ) ) ( not ( = ?auto_58900 ?auto_58904 ) ) ( not ( = ?auto_58900 ?auto_58905 ) ) ( not ( = ?auto_58901 ?auto_58902 ) ) ( not ( = ?auto_58901 ?auto_58903 ) ) ( not ( = ?auto_58901 ?auto_58904 ) ) ( not ( = ?auto_58901 ?auto_58905 ) ) ( not ( = ?auto_58902 ?auto_58903 ) ) ( not ( = ?auto_58902 ?auto_58904 ) ) ( not ( = ?auto_58902 ?auto_58905 ) ) ( not ( = ?auto_58903 ?auto_58904 ) ) ( not ( = ?auto_58903 ?auto_58905 ) ) ( not ( = ?auto_58904 ?auto_58905 ) ) ( ON ?auto_58905 ?auto_58906 ) ( CLEAR ?auto_58905 ) ( not ( = ?auto_58900 ?auto_58906 ) ) ( not ( = ?auto_58901 ?auto_58906 ) ) ( not ( = ?auto_58902 ?auto_58906 ) ) ( not ( = ?auto_58903 ?auto_58906 ) ) ( not ( = ?auto_58904 ?auto_58906 ) ) ( not ( = ?auto_58905 ?auto_58906 ) ) ( HOLDING ?auto_58904 ) ( CLEAR ?auto_58903 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58900 ?auto_58901 ?auto_58902 ?auto_58903 ?auto_58904 )
      ( MAKE-6PILE ?auto_58900 ?auto_58901 ?auto_58902 ?auto_58903 ?auto_58904 ?auto_58905 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58907 - BLOCK
      ?auto_58908 - BLOCK
      ?auto_58909 - BLOCK
      ?auto_58910 - BLOCK
      ?auto_58911 - BLOCK
      ?auto_58912 - BLOCK
    )
    :vars
    (
      ?auto_58913 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58907 ) ( ON ?auto_58908 ?auto_58907 ) ( ON ?auto_58909 ?auto_58908 ) ( ON ?auto_58910 ?auto_58909 ) ( not ( = ?auto_58907 ?auto_58908 ) ) ( not ( = ?auto_58907 ?auto_58909 ) ) ( not ( = ?auto_58907 ?auto_58910 ) ) ( not ( = ?auto_58907 ?auto_58911 ) ) ( not ( = ?auto_58907 ?auto_58912 ) ) ( not ( = ?auto_58908 ?auto_58909 ) ) ( not ( = ?auto_58908 ?auto_58910 ) ) ( not ( = ?auto_58908 ?auto_58911 ) ) ( not ( = ?auto_58908 ?auto_58912 ) ) ( not ( = ?auto_58909 ?auto_58910 ) ) ( not ( = ?auto_58909 ?auto_58911 ) ) ( not ( = ?auto_58909 ?auto_58912 ) ) ( not ( = ?auto_58910 ?auto_58911 ) ) ( not ( = ?auto_58910 ?auto_58912 ) ) ( not ( = ?auto_58911 ?auto_58912 ) ) ( ON ?auto_58912 ?auto_58913 ) ( not ( = ?auto_58907 ?auto_58913 ) ) ( not ( = ?auto_58908 ?auto_58913 ) ) ( not ( = ?auto_58909 ?auto_58913 ) ) ( not ( = ?auto_58910 ?auto_58913 ) ) ( not ( = ?auto_58911 ?auto_58913 ) ) ( not ( = ?auto_58912 ?auto_58913 ) ) ( CLEAR ?auto_58910 ) ( ON ?auto_58911 ?auto_58912 ) ( CLEAR ?auto_58911 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58913 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58913 ?auto_58912 )
      ( MAKE-6PILE ?auto_58907 ?auto_58908 ?auto_58909 ?auto_58910 ?auto_58911 ?auto_58912 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58914 - BLOCK
      ?auto_58915 - BLOCK
      ?auto_58916 - BLOCK
      ?auto_58917 - BLOCK
      ?auto_58918 - BLOCK
      ?auto_58919 - BLOCK
    )
    :vars
    (
      ?auto_58920 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58914 ) ( ON ?auto_58915 ?auto_58914 ) ( ON ?auto_58916 ?auto_58915 ) ( not ( = ?auto_58914 ?auto_58915 ) ) ( not ( = ?auto_58914 ?auto_58916 ) ) ( not ( = ?auto_58914 ?auto_58917 ) ) ( not ( = ?auto_58914 ?auto_58918 ) ) ( not ( = ?auto_58914 ?auto_58919 ) ) ( not ( = ?auto_58915 ?auto_58916 ) ) ( not ( = ?auto_58915 ?auto_58917 ) ) ( not ( = ?auto_58915 ?auto_58918 ) ) ( not ( = ?auto_58915 ?auto_58919 ) ) ( not ( = ?auto_58916 ?auto_58917 ) ) ( not ( = ?auto_58916 ?auto_58918 ) ) ( not ( = ?auto_58916 ?auto_58919 ) ) ( not ( = ?auto_58917 ?auto_58918 ) ) ( not ( = ?auto_58917 ?auto_58919 ) ) ( not ( = ?auto_58918 ?auto_58919 ) ) ( ON ?auto_58919 ?auto_58920 ) ( not ( = ?auto_58914 ?auto_58920 ) ) ( not ( = ?auto_58915 ?auto_58920 ) ) ( not ( = ?auto_58916 ?auto_58920 ) ) ( not ( = ?auto_58917 ?auto_58920 ) ) ( not ( = ?auto_58918 ?auto_58920 ) ) ( not ( = ?auto_58919 ?auto_58920 ) ) ( ON ?auto_58918 ?auto_58919 ) ( CLEAR ?auto_58918 ) ( ON-TABLE ?auto_58920 ) ( HOLDING ?auto_58917 ) ( CLEAR ?auto_58916 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58914 ?auto_58915 ?auto_58916 ?auto_58917 )
      ( MAKE-6PILE ?auto_58914 ?auto_58915 ?auto_58916 ?auto_58917 ?auto_58918 ?auto_58919 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58921 - BLOCK
      ?auto_58922 - BLOCK
      ?auto_58923 - BLOCK
      ?auto_58924 - BLOCK
      ?auto_58925 - BLOCK
      ?auto_58926 - BLOCK
    )
    :vars
    (
      ?auto_58927 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58921 ) ( ON ?auto_58922 ?auto_58921 ) ( ON ?auto_58923 ?auto_58922 ) ( not ( = ?auto_58921 ?auto_58922 ) ) ( not ( = ?auto_58921 ?auto_58923 ) ) ( not ( = ?auto_58921 ?auto_58924 ) ) ( not ( = ?auto_58921 ?auto_58925 ) ) ( not ( = ?auto_58921 ?auto_58926 ) ) ( not ( = ?auto_58922 ?auto_58923 ) ) ( not ( = ?auto_58922 ?auto_58924 ) ) ( not ( = ?auto_58922 ?auto_58925 ) ) ( not ( = ?auto_58922 ?auto_58926 ) ) ( not ( = ?auto_58923 ?auto_58924 ) ) ( not ( = ?auto_58923 ?auto_58925 ) ) ( not ( = ?auto_58923 ?auto_58926 ) ) ( not ( = ?auto_58924 ?auto_58925 ) ) ( not ( = ?auto_58924 ?auto_58926 ) ) ( not ( = ?auto_58925 ?auto_58926 ) ) ( ON ?auto_58926 ?auto_58927 ) ( not ( = ?auto_58921 ?auto_58927 ) ) ( not ( = ?auto_58922 ?auto_58927 ) ) ( not ( = ?auto_58923 ?auto_58927 ) ) ( not ( = ?auto_58924 ?auto_58927 ) ) ( not ( = ?auto_58925 ?auto_58927 ) ) ( not ( = ?auto_58926 ?auto_58927 ) ) ( ON ?auto_58925 ?auto_58926 ) ( ON-TABLE ?auto_58927 ) ( CLEAR ?auto_58923 ) ( ON ?auto_58924 ?auto_58925 ) ( CLEAR ?auto_58924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58927 ?auto_58926 ?auto_58925 )
      ( MAKE-6PILE ?auto_58921 ?auto_58922 ?auto_58923 ?auto_58924 ?auto_58925 ?auto_58926 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58928 - BLOCK
      ?auto_58929 - BLOCK
      ?auto_58930 - BLOCK
      ?auto_58931 - BLOCK
      ?auto_58932 - BLOCK
      ?auto_58933 - BLOCK
    )
    :vars
    (
      ?auto_58934 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58928 ) ( ON ?auto_58929 ?auto_58928 ) ( not ( = ?auto_58928 ?auto_58929 ) ) ( not ( = ?auto_58928 ?auto_58930 ) ) ( not ( = ?auto_58928 ?auto_58931 ) ) ( not ( = ?auto_58928 ?auto_58932 ) ) ( not ( = ?auto_58928 ?auto_58933 ) ) ( not ( = ?auto_58929 ?auto_58930 ) ) ( not ( = ?auto_58929 ?auto_58931 ) ) ( not ( = ?auto_58929 ?auto_58932 ) ) ( not ( = ?auto_58929 ?auto_58933 ) ) ( not ( = ?auto_58930 ?auto_58931 ) ) ( not ( = ?auto_58930 ?auto_58932 ) ) ( not ( = ?auto_58930 ?auto_58933 ) ) ( not ( = ?auto_58931 ?auto_58932 ) ) ( not ( = ?auto_58931 ?auto_58933 ) ) ( not ( = ?auto_58932 ?auto_58933 ) ) ( ON ?auto_58933 ?auto_58934 ) ( not ( = ?auto_58928 ?auto_58934 ) ) ( not ( = ?auto_58929 ?auto_58934 ) ) ( not ( = ?auto_58930 ?auto_58934 ) ) ( not ( = ?auto_58931 ?auto_58934 ) ) ( not ( = ?auto_58932 ?auto_58934 ) ) ( not ( = ?auto_58933 ?auto_58934 ) ) ( ON ?auto_58932 ?auto_58933 ) ( ON-TABLE ?auto_58934 ) ( ON ?auto_58931 ?auto_58932 ) ( CLEAR ?auto_58931 ) ( HOLDING ?auto_58930 ) ( CLEAR ?auto_58929 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58928 ?auto_58929 ?auto_58930 )
      ( MAKE-6PILE ?auto_58928 ?auto_58929 ?auto_58930 ?auto_58931 ?auto_58932 ?auto_58933 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58935 - BLOCK
      ?auto_58936 - BLOCK
      ?auto_58937 - BLOCK
      ?auto_58938 - BLOCK
      ?auto_58939 - BLOCK
      ?auto_58940 - BLOCK
    )
    :vars
    (
      ?auto_58941 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58935 ) ( ON ?auto_58936 ?auto_58935 ) ( not ( = ?auto_58935 ?auto_58936 ) ) ( not ( = ?auto_58935 ?auto_58937 ) ) ( not ( = ?auto_58935 ?auto_58938 ) ) ( not ( = ?auto_58935 ?auto_58939 ) ) ( not ( = ?auto_58935 ?auto_58940 ) ) ( not ( = ?auto_58936 ?auto_58937 ) ) ( not ( = ?auto_58936 ?auto_58938 ) ) ( not ( = ?auto_58936 ?auto_58939 ) ) ( not ( = ?auto_58936 ?auto_58940 ) ) ( not ( = ?auto_58937 ?auto_58938 ) ) ( not ( = ?auto_58937 ?auto_58939 ) ) ( not ( = ?auto_58937 ?auto_58940 ) ) ( not ( = ?auto_58938 ?auto_58939 ) ) ( not ( = ?auto_58938 ?auto_58940 ) ) ( not ( = ?auto_58939 ?auto_58940 ) ) ( ON ?auto_58940 ?auto_58941 ) ( not ( = ?auto_58935 ?auto_58941 ) ) ( not ( = ?auto_58936 ?auto_58941 ) ) ( not ( = ?auto_58937 ?auto_58941 ) ) ( not ( = ?auto_58938 ?auto_58941 ) ) ( not ( = ?auto_58939 ?auto_58941 ) ) ( not ( = ?auto_58940 ?auto_58941 ) ) ( ON ?auto_58939 ?auto_58940 ) ( ON-TABLE ?auto_58941 ) ( ON ?auto_58938 ?auto_58939 ) ( CLEAR ?auto_58936 ) ( ON ?auto_58937 ?auto_58938 ) ( CLEAR ?auto_58937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58941 ?auto_58940 ?auto_58939 ?auto_58938 )
      ( MAKE-6PILE ?auto_58935 ?auto_58936 ?auto_58937 ?auto_58938 ?auto_58939 ?auto_58940 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58942 - BLOCK
      ?auto_58943 - BLOCK
      ?auto_58944 - BLOCK
      ?auto_58945 - BLOCK
      ?auto_58946 - BLOCK
      ?auto_58947 - BLOCK
    )
    :vars
    (
      ?auto_58948 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58942 ) ( not ( = ?auto_58942 ?auto_58943 ) ) ( not ( = ?auto_58942 ?auto_58944 ) ) ( not ( = ?auto_58942 ?auto_58945 ) ) ( not ( = ?auto_58942 ?auto_58946 ) ) ( not ( = ?auto_58942 ?auto_58947 ) ) ( not ( = ?auto_58943 ?auto_58944 ) ) ( not ( = ?auto_58943 ?auto_58945 ) ) ( not ( = ?auto_58943 ?auto_58946 ) ) ( not ( = ?auto_58943 ?auto_58947 ) ) ( not ( = ?auto_58944 ?auto_58945 ) ) ( not ( = ?auto_58944 ?auto_58946 ) ) ( not ( = ?auto_58944 ?auto_58947 ) ) ( not ( = ?auto_58945 ?auto_58946 ) ) ( not ( = ?auto_58945 ?auto_58947 ) ) ( not ( = ?auto_58946 ?auto_58947 ) ) ( ON ?auto_58947 ?auto_58948 ) ( not ( = ?auto_58942 ?auto_58948 ) ) ( not ( = ?auto_58943 ?auto_58948 ) ) ( not ( = ?auto_58944 ?auto_58948 ) ) ( not ( = ?auto_58945 ?auto_58948 ) ) ( not ( = ?auto_58946 ?auto_58948 ) ) ( not ( = ?auto_58947 ?auto_58948 ) ) ( ON ?auto_58946 ?auto_58947 ) ( ON-TABLE ?auto_58948 ) ( ON ?auto_58945 ?auto_58946 ) ( ON ?auto_58944 ?auto_58945 ) ( CLEAR ?auto_58944 ) ( HOLDING ?auto_58943 ) ( CLEAR ?auto_58942 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58942 ?auto_58943 )
      ( MAKE-6PILE ?auto_58942 ?auto_58943 ?auto_58944 ?auto_58945 ?auto_58946 ?auto_58947 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58949 - BLOCK
      ?auto_58950 - BLOCK
      ?auto_58951 - BLOCK
      ?auto_58952 - BLOCK
      ?auto_58953 - BLOCK
      ?auto_58954 - BLOCK
    )
    :vars
    (
      ?auto_58955 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58949 ) ( not ( = ?auto_58949 ?auto_58950 ) ) ( not ( = ?auto_58949 ?auto_58951 ) ) ( not ( = ?auto_58949 ?auto_58952 ) ) ( not ( = ?auto_58949 ?auto_58953 ) ) ( not ( = ?auto_58949 ?auto_58954 ) ) ( not ( = ?auto_58950 ?auto_58951 ) ) ( not ( = ?auto_58950 ?auto_58952 ) ) ( not ( = ?auto_58950 ?auto_58953 ) ) ( not ( = ?auto_58950 ?auto_58954 ) ) ( not ( = ?auto_58951 ?auto_58952 ) ) ( not ( = ?auto_58951 ?auto_58953 ) ) ( not ( = ?auto_58951 ?auto_58954 ) ) ( not ( = ?auto_58952 ?auto_58953 ) ) ( not ( = ?auto_58952 ?auto_58954 ) ) ( not ( = ?auto_58953 ?auto_58954 ) ) ( ON ?auto_58954 ?auto_58955 ) ( not ( = ?auto_58949 ?auto_58955 ) ) ( not ( = ?auto_58950 ?auto_58955 ) ) ( not ( = ?auto_58951 ?auto_58955 ) ) ( not ( = ?auto_58952 ?auto_58955 ) ) ( not ( = ?auto_58953 ?auto_58955 ) ) ( not ( = ?auto_58954 ?auto_58955 ) ) ( ON ?auto_58953 ?auto_58954 ) ( ON-TABLE ?auto_58955 ) ( ON ?auto_58952 ?auto_58953 ) ( ON ?auto_58951 ?auto_58952 ) ( CLEAR ?auto_58949 ) ( ON ?auto_58950 ?auto_58951 ) ( CLEAR ?auto_58950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58955 ?auto_58954 ?auto_58953 ?auto_58952 ?auto_58951 )
      ( MAKE-6PILE ?auto_58949 ?auto_58950 ?auto_58951 ?auto_58952 ?auto_58953 ?auto_58954 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58956 - BLOCK
      ?auto_58957 - BLOCK
      ?auto_58958 - BLOCK
      ?auto_58959 - BLOCK
      ?auto_58960 - BLOCK
      ?auto_58961 - BLOCK
    )
    :vars
    (
      ?auto_58962 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58956 ?auto_58957 ) ) ( not ( = ?auto_58956 ?auto_58958 ) ) ( not ( = ?auto_58956 ?auto_58959 ) ) ( not ( = ?auto_58956 ?auto_58960 ) ) ( not ( = ?auto_58956 ?auto_58961 ) ) ( not ( = ?auto_58957 ?auto_58958 ) ) ( not ( = ?auto_58957 ?auto_58959 ) ) ( not ( = ?auto_58957 ?auto_58960 ) ) ( not ( = ?auto_58957 ?auto_58961 ) ) ( not ( = ?auto_58958 ?auto_58959 ) ) ( not ( = ?auto_58958 ?auto_58960 ) ) ( not ( = ?auto_58958 ?auto_58961 ) ) ( not ( = ?auto_58959 ?auto_58960 ) ) ( not ( = ?auto_58959 ?auto_58961 ) ) ( not ( = ?auto_58960 ?auto_58961 ) ) ( ON ?auto_58961 ?auto_58962 ) ( not ( = ?auto_58956 ?auto_58962 ) ) ( not ( = ?auto_58957 ?auto_58962 ) ) ( not ( = ?auto_58958 ?auto_58962 ) ) ( not ( = ?auto_58959 ?auto_58962 ) ) ( not ( = ?auto_58960 ?auto_58962 ) ) ( not ( = ?auto_58961 ?auto_58962 ) ) ( ON ?auto_58960 ?auto_58961 ) ( ON-TABLE ?auto_58962 ) ( ON ?auto_58959 ?auto_58960 ) ( ON ?auto_58958 ?auto_58959 ) ( ON ?auto_58957 ?auto_58958 ) ( CLEAR ?auto_58957 ) ( HOLDING ?auto_58956 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58956 )
      ( MAKE-6PILE ?auto_58956 ?auto_58957 ?auto_58958 ?auto_58959 ?auto_58960 ?auto_58961 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58963 - BLOCK
      ?auto_58964 - BLOCK
      ?auto_58965 - BLOCK
      ?auto_58966 - BLOCK
      ?auto_58967 - BLOCK
      ?auto_58968 - BLOCK
    )
    :vars
    (
      ?auto_58969 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58963 ?auto_58964 ) ) ( not ( = ?auto_58963 ?auto_58965 ) ) ( not ( = ?auto_58963 ?auto_58966 ) ) ( not ( = ?auto_58963 ?auto_58967 ) ) ( not ( = ?auto_58963 ?auto_58968 ) ) ( not ( = ?auto_58964 ?auto_58965 ) ) ( not ( = ?auto_58964 ?auto_58966 ) ) ( not ( = ?auto_58964 ?auto_58967 ) ) ( not ( = ?auto_58964 ?auto_58968 ) ) ( not ( = ?auto_58965 ?auto_58966 ) ) ( not ( = ?auto_58965 ?auto_58967 ) ) ( not ( = ?auto_58965 ?auto_58968 ) ) ( not ( = ?auto_58966 ?auto_58967 ) ) ( not ( = ?auto_58966 ?auto_58968 ) ) ( not ( = ?auto_58967 ?auto_58968 ) ) ( ON ?auto_58968 ?auto_58969 ) ( not ( = ?auto_58963 ?auto_58969 ) ) ( not ( = ?auto_58964 ?auto_58969 ) ) ( not ( = ?auto_58965 ?auto_58969 ) ) ( not ( = ?auto_58966 ?auto_58969 ) ) ( not ( = ?auto_58967 ?auto_58969 ) ) ( not ( = ?auto_58968 ?auto_58969 ) ) ( ON ?auto_58967 ?auto_58968 ) ( ON-TABLE ?auto_58969 ) ( ON ?auto_58966 ?auto_58967 ) ( ON ?auto_58965 ?auto_58966 ) ( ON ?auto_58964 ?auto_58965 ) ( ON ?auto_58963 ?auto_58964 ) ( CLEAR ?auto_58963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_58969 ?auto_58968 ?auto_58967 ?auto_58966 ?auto_58965 ?auto_58964 )
      ( MAKE-6PILE ?auto_58963 ?auto_58964 ?auto_58965 ?auto_58966 ?auto_58967 ?auto_58968 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59050 - BLOCK
    )
    :vars
    (
      ?auto_59051 - BLOCK
      ?auto_59052 - BLOCK
      ?auto_59053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59050 ?auto_59051 ) ( CLEAR ?auto_59050 ) ( not ( = ?auto_59050 ?auto_59051 ) ) ( HOLDING ?auto_59052 ) ( CLEAR ?auto_59053 ) ( not ( = ?auto_59050 ?auto_59052 ) ) ( not ( = ?auto_59050 ?auto_59053 ) ) ( not ( = ?auto_59051 ?auto_59052 ) ) ( not ( = ?auto_59051 ?auto_59053 ) ) ( not ( = ?auto_59052 ?auto_59053 ) ) )
    :subtasks
    ( ( !STACK ?auto_59052 ?auto_59053 )
      ( MAKE-1PILE ?auto_59050 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59054 - BLOCK
    )
    :vars
    (
      ?auto_59056 - BLOCK
      ?auto_59055 - BLOCK
      ?auto_59057 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59054 ?auto_59056 ) ( not ( = ?auto_59054 ?auto_59056 ) ) ( CLEAR ?auto_59055 ) ( not ( = ?auto_59054 ?auto_59057 ) ) ( not ( = ?auto_59054 ?auto_59055 ) ) ( not ( = ?auto_59056 ?auto_59057 ) ) ( not ( = ?auto_59056 ?auto_59055 ) ) ( not ( = ?auto_59057 ?auto_59055 ) ) ( ON ?auto_59057 ?auto_59054 ) ( CLEAR ?auto_59057 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_59056 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59056 ?auto_59054 )
      ( MAKE-1PILE ?auto_59054 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59058 - BLOCK
    )
    :vars
    (
      ?auto_59061 - BLOCK
      ?auto_59060 - BLOCK
      ?auto_59059 - BLOCK
      ?auto_59063 - BLOCK
      ?auto_59064 - BLOCK
      ?auto_59062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59058 ?auto_59061 ) ( not ( = ?auto_59058 ?auto_59061 ) ) ( not ( = ?auto_59058 ?auto_59060 ) ) ( not ( = ?auto_59058 ?auto_59059 ) ) ( not ( = ?auto_59061 ?auto_59060 ) ) ( not ( = ?auto_59061 ?auto_59059 ) ) ( not ( = ?auto_59060 ?auto_59059 ) ) ( ON ?auto_59060 ?auto_59058 ) ( CLEAR ?auto_59060 ) ( ON-TABLE ?auto_59061 ) ( HOLDING ?auto_59059 ) ( CLEAR ?auto_59063 ) ( ON-TABLE ?auto_59064 ) ( ON ?auto_59062 ?auto_59064 ) ( ON ?auto_59063 ?auto_59062 ) ( not ( = ?auto_59064 ?auto_59062 ) ) ( not ( = ?auto_59064 ?auto_59063 ) ) ( not ( = ?auto_59064 ?auto_59059 ) ) ( not ( = ?auto_59062 ?auto_59063 ) ) ( not ( = ?auto_59062 ?auto_59059 ) ) ( not ( = ?auto_59063 ?auto_59059 ) ) ( not ( = ?auto_59058 ?auto_59063 ) ) ( not ( = ?auto_59058 ?auto_59064 ) ) ( not ( = ?auto_59058 ?auto_59062 ) ) ( not ( = ?auto_59061 ?auto_59063 ) ) ( not ( = ?auto_59061 ?auto_59064 ) ) ( not ( = ?auto_59061 ?auto_59062 ) ) ( not ( = ?auto_59060 ?auto_59063 ) ) ( not ( = ?auto_59060 ?auto_59064 ) ) ( not ( = ?auto_59060 ?auto_59062 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59064 ?auto_59062 ?auto_59063 ?auto_59059 )
      ( MAKE-1PILE ?auto_59058 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59065 - BLOCK
    )
    :vars
    (
      ?auto_59066 - BLOCK
      ?auto_59067 - BLOCK
      ?auto_59068 - BLOCK
      ?auto_59071 - BLOCK
      ?auto_59069 - BLOCK
      ?auto_59070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59065 ?auto_59066 ) ( not ( = ?auto_59065 ?auto_59066 ) ) ( not ( = ?auto_59065 ?auto_59067 ) ) ( not ( = ?auto_59065 ?auto_59068 ) ) ( not ( = ?auto_59066 ?auto_59067 ) ) ( not ( = ?auto_59066 ?auto_59068 ) ) ( not ( = ?auto_59067 ?auto_59068 ) ) ( ON ?auto_59067 ?auto_59065 ) ( ON-TABLE ?auto_59066 ) ( CLEAR ?auto_59071 ) ( ON-TABLE ?auto_59069 ) ( ON ?auto_59070 ?auto_59069 ) ( ON ?auto_59071 ?auto_59070 ) ( not ( = ?auto_59069 ?auto_59070 ) ) ( not ( = ?auto_59069 ?auto_59071 ) ) ( not ( = ?auto_59069 ?auto_59068 ) ) ( not ( = ?auto_59070 ?auto_59071 ) ) ( not ( = ?auto_59070 ?auto_59068 ) ) ( not ( = ?auto_59071 ?auto_59068 ) ) ( not ( = ?auto_59065 ?auto_59071 ) ) ( not ( = ?auto_59065 ?auto_59069 ) ) ( not ( = ?auto_59065 ?auto_59070 ) ) ( not ( = ?auto_59066 ?auto_59071 ) ) ( not ( = ?auto_59066 ?auto_59069 ) ) ( not ( = ?auto_59066 ?auto_59070 ) ) ( not ( = ?auto_59067 ?auto_59071 ) ) ( not ( = ?auto_59067 ?auto_59069 ) ) ( not ( = ?auto_59067 ?auto_59070 ) ) ( ON ?auto_59068 ?auto_59067 ) ( CLEAR ?auto_59068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59066 ?auto_59065 ?auto_59067 )
      ( MAKE-1PILE ?auto_59065 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59072 - BLOCK
    )
    :vars
    (
      ?auto_59075 - BLOCK
      ?auto_59076 - BLOCK
      ?auto_59078 - BLOCK
      ?auto_59077 - BLOCK
      ?auto_59073 - BLOCK
      ?auto_59074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59072 ?auto_59075 ) ( not ( = ?auto_59072 ?auto_59075 ) ) ( not ( = ?auto_59072 ?auto_59076 ) ) ( not ( = ?auto_59072 ?auto_59078 ) ) ( not ( = ?auto_59075 ?auto_59076 ) ) ( not ( = ?auto_59075 ?auto_59078 ) ) ( not ( = ?auto_59076 ?auto_59078 ) ) ( ON ?auto_59076 ?auto_59072 ) ( ON-TABLE ?auto_59075 ) ( ON-TABLE ?auto_59077 ) ( ON ?auto_59073 ?auto_59077 ) ( not ( = ?auto_59077 ?auto_59073 ) ) ( not ( = ?auto_59077 ?auto_59074 ) ) ( not ( = ?auto_59077 ?auto_59078 ) ) ( not ( = ?auto_59073 ?auto_59074 ) ) ( not ( = ?auto_59073 ?auto_59078 ) ) ( not ( = ?auto_59074 ?auto_59078 ) ) ( not ( = ?auto_59072 ?auto_59074 ) ) ( not ( = ?auto_59072 ?auto_59077 ) ) ( not ( = ?auto_59072 ?auto_59073 ) ) ( not ( = ?auto_59075 ?auto_59074 ) ) ( not ( = ?auto_59075 ?auto_59077 ) ) ( not ( = ?auto_59075 ?auto_59073 ) ) ( not ( = ?auto_59076 ?auto_59074 ) ) ( not ( = ?auto_59076 ?auto_59077 ) ) ( not ( = ?auto_59076 ?auto_59073 ) ) ( ON ?auto_59078 ?auto_59076 ) ( CLEAR ?auto_59078 ) ( HOLDING ?auto_59074 ) ( CLEAR ?auto_59073 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59077 ?auto_59073 ?auto_59074 )
      ( MAKE-1PILE ?auto_59072 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59079 - BLOCK
    )
    :vars
    (
      ?auto_59082 - BLOCK
      ?auto_59085 - BLOCK
      ?auto_59084 - BLOCK
      ?auto_59083 - BLOCK
      ?auto_59080 - BLOCK
      ?auto_59081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59079 ?auto_59082 ) ( not ( = ?auto_59079 ?auto_59082 ) ) ( not ( = ?auto_59079 ?auto_59085 ) ) ( not ( = ?auto_59079 ?auto_59084 ) ) ( not ( = ?auto_59082 ?auto_59085 ) ) ( not ( = ?auto_59082 ?auto_59084 ) ) ( not ( = ?auto_59085 ?auto_59084 ) ) ( ON ?auto_59085 ?auto_59079 ) ( ON-TABLE ?auto_59082 ) ( ON-TABLE ?auto_59083 ) ( ON ?auto_59080 ?auto_59083 ) ( not ( = ?auto_59083 ?auto_59080 ) ) ( not ( = ?auto_59083 ?auto_59081 ) ) ( not ( = ?auto_59083 ?auto_59084 ) ) ( not ( = ?auto_59080 ?auto_59081 ) ) ( not ( = ?auto_59080 ?auto_59084 ) ) ( not ( = ?auto_59081 ?auto_59084 ) ) ( not ( = ?auto_59079 ?auto_59081 ) ) ( not ( = ?auto_59079 ?auto_59083 ) ) ( not ( = ?auto_59079 ?auto_59080 ) ) ( not ( = ?auto_59082 ?auto_59081 ) ) ( not ( = ?auto_59082 ?auto_59083 ) ) ( not ( = ?auto_59082 ?auto_59080 ) ) ( not ( = ?auto_59085 ?auto_59081 ) ) ( not ( = ?auto_59085 ?auto_59083 ) ) ( not ( = ?auto_59085 ?auto_59080 ) ) ( ON ?auto_59084 ?auto_59085 ) ( CLEAR ?auto_59080 ) ( ON ?auto_59081 ?auto_59084 ) ( CLEAR ?auto_59081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59082 ?auto_59079 ?auto_59085 ?auto_59084 )
      ( MAKE-1PILE ?auto_59079 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59086 - BLOCK
    )
    :vars
    (
      ?auto_59088 - BLOCK
      ?auto_59092 - BLOCK
      ?auto_59087 - BLOCK
      ?auto_59091 - BLOCK
      ?auto_59089 - BLOCK
      ?auto_59090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59086 ?auto_59088 ) ( not ( = ?auto_59086 ?auto_59088 ) ) ( not ( = ?auto_59086 ?auto_59092 ) ) ( not ( = ?auto_59086 ?auto_59087 ) ) ( not ( = ?auto_59088 ?auto_59092 ) ) ( not ( = ?auto_59088 ?auto_59087 ) ) ( not ( = ?auto_59092 ?auto_59087 ) ) ( ON ?auto_59092 ?auto_59086 ) ( ON-TABLE ?auto_59088 ) ( ON-TABLE ?auto_59091 ) ( not ( = ?auto_59091 ?auto_59089 ) ) ( not ( = ?auto_59091 ?auto_59090 ) ) ( not ( = ?auto_59091 ?auto_59087 ) ) ( not ( = ?auto_59089 ?auto_59090 ) ) ( not ( = ?auto_59089 ?auto_59087 ) ) ( not ( = ?auto_59090 ?auto_59087 ) ) ( not ( = ?auto_59086 ?auto_59090 ) ) ( not ( = ?auto_59086 ?auto_59091 ) ) ( not ( = ?auto_59086 ?auto_59089 ) ) ( not ( = ?auto_59088 ?auto_59090 ) ) ( not ( = ?auto_59088 ?auto_59091 ) ) ( not ( = ?auto_59088 ?auto_59089 ) ) ( not ( = ?auto_59092 ?auto_59090 ) ) ( not ( = ?auto_59092 ?auto_59091 ) ) ( not ( = ?auto_59092 ?auto_59089 ) ) ( ON ?auto_59087 ?auto_59092 ) ( ON ?auto_59090 ?auto_59087 ) ( CLEAR ?auto_59090 ) ( HOLDING ?auto_59089 ) ( CLEAR ?auto_59091 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59091 ?auto_59089 )
      ( MAKE-1PILE ?auto_59086 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59093 - BLOCK
    )
    :vars
    (
      ?auto_59096 - BLOCK
      ?auto_59094 - BLOCK
      ?auto_59098 - BLOCK
      ?auto_59097 - BLOCK
      ?auto_59095 - BLOCK
      ?auto_59099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59093 ?auto_59096 ) ( not ( = ?auto_59093 ?auto_59096 ) ) ( not ( = ?auto_59093 ?auto_59094 ) ) ( not ( = ?auto_59093 ?auto_59098 ) ) ( not ( = ?auto_59096 ?auto_59094 ) ) ( not ( = ?auto_59096 ?auto_59098 ) ) ( not ( = ?auto_59094 ?auto_59098 ) ) ( ON ?auto_59094 ?auto_59093 ) ( ON-TABLE ?auto_59096 ) ( ON-TABLE ?auto_59097 ) ( not ( = ?auto_59097 ?auto_59095 ) ) ( not ( = ?auto_59097 ?auto_59099 ) ) ( not ( = ?auto_59097 ?auto_59098 ) ) ( not ( = ?auto_59095 ?auto_59099 ) ) ( not ( = ?auto_59095 ?auto_59098 ) ) ( not ( = ?auto_59099 ?auto_59098 ) ) ( not ( = ?auto_59093 ?auto_59099 ) ) ( not ( = ?auto_59093 ?auto_59097 ) ) ( not ( = ?auto_59093 ?auto_59095 ) ) ( not ( = ?auto_59096 ?auto_59099 ) ) ( not ( = ?auto_59096 ?auto_59097 ) ) ( not ( = ?auto_59096 ?auto_59095 ) ) ( not ( = ?auto_59094 ?auto_59099 ) ) ( not ( = ?auto_59094 ?auto_59097 ) ) ( not ( = ?auto_59094 ?auto_59095 ) ) ( ON ?auto_59098 ?auto_59094 ) ( ON ?auto_59099 ?auto_59098 ) ( CLEAR ?auto_59097 ) ( ON ?auto_59095 ?auto_59099 ) ( CLEAR ?auto_59095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59096 ?auto_59093 ?auto_59094 ?auto_59098 ?auto_59099 )
      ( MAKE-1PILE ?auto_59093 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59100 - BLOCK
    )
    :vars
    (
      ?auto_59105 - BLOCK
      ?auto_59102 - BLOCK
      ?auto_59104 - BLOCK
      ?auto_59106 - BLOCK
      ?auto_59101 - BLOCK
      ?auto_59103 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59100 ?auto_59105 ) ( not ( = ?auto_59100 ?auto_59105 ) ) ( not ( = ?auto_59100 ?auto_59102 ) ) ( not ( = ?auto_59100 ?auto_59104 ) ) ( not ( = ?auto_59105 ?auto_59102 ) ) ( not ( = ?auto_59105 ?auto_59104 ) ) ( not ( = ?auto_59102 ?auto_59104 ) ) ( ON ?auto_59102 ?auto_59100 ) ( ON-TABLE ?auto_59105 ) ( not ( = ?auto_59106 ?auto_59101 ) ) ( not ( = ?auto_59106 ?auto_59103 ) ) ( not ( = ?auto_59106 ?auto_59104 ) ) ( not ( = ?auto_59101 ?auto_59103 ) ) ( not ( = ?auto_59101 ?auto_59104 ) ) ( not ( = ?auto_59103 ?auto_59104 ) ) ( not ( = ?auto_59100 ?auto_59103 ) ) ( not ( = ?auto_59100 ?auto_59106 ) ) ( not ( = ?auto_59100 ?auto_59101 ) ) ( not ( = ?auto_59105 ?auto_59103 ) ) ( not ( = ?auto_59105 ?auto_59106 ) ) ( not ( = ?auto_59105 ?auto_59101 ) ) ( not ( = ?auto_59102 ?auto_59103 ) ) ( not ( = ?auto_59102 ?auto_59106 ) ) ( not ( = ?auto_59102 ?auto_59101 ) ) ( ON ?auto_59104 ?auto_59102 ) ( ON ?auto_59103 ?auto_59104 ) ( ON ?auto_59101 ?auto_59103 ) ( CLEAR ?auto_59101 ) ( HOLDING ?auto_59106 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_59106 )
      ( MAKE-1PILE ?auto_59100 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59107 - BLOCK
    )
    :vars
    (
      ?auto_59111 - BLOCK
      ?auto_59110 - BLOCK
      ?auto_59113 - BLOCK
      ?auto_59112 - BLOCK
      ?auto_59109 - BLOCK
      ?auto_59108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59107 ?auto_59111 ) ( not ( = ?auto_59107 ?auto_59111 ) ) ( not ( = ?auto_59107 ?auto_59110 ) ) ( not ( = ?auto_59107 ?auto_59113 ) ) ( not ( = ?auto_59111 ?auto_59110 ) ) ( not ( = ?auto_59111 ?auto_59113 ) ) ( not ( = ?auto_59110 ?auto_59113 ) ) ( ON ?auto_59110 ?auto_59107 ) ( ON-TABLE ?auto_59111 ) ( not ( = ?auto_59112 ?auto_59109 ) ) ( not ( = ?auto_59112 ?auto_59108 ) ) ( not ( = ?auto_59112 ?auto_59113 ) ) ( not ( = ?auto_59109 ?auto_59108 ) ) ( not ( = ?auto_59109 ?auto_59113 ) ) ( not ( = ?auto_59108 ?auto_59113 ) ) ( not ( = ?auto_59107 ?auto_59108 ) ) ( not ( = ?auto_59107 ?auto_59112 ) ) ( not ( = ?auto_59107 ?auto_59109 ) ) ( not ( = ?auto_59111 ?auto_59108 ) ) ( not ( = ?auto_59111 ?auto_59112 ) ) ( not ( = ?auto_59111 ?auto_59109 ) ) ( not ( = ?auto_59110 ?auto_59108 ) ) ( not ( = ?auto_59110 ?auto_59112 ) ) ( not ( = ?auto_59110 ?auto_59109 ) ) ( ON ?auto_59113 ?auto_59110 ) ( ON ?auto_59108 ?auto_59113 ) ( ON ?auto_59109 ?auto_59108 ) ( ON ?auto_59112 ?auto_59109 ) ( CLEAR ?auto_59112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_59111 ?auto_59107 ?auto_59110 ?auto_59113 ?auto_59108 ?auto_59109 )
      ( MAKE-1PILE ?auto_59107 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_59123 - BLOCK
      ?auto_59124 - BLOCK
      ?auto_59125 - BLOCK
      ?auto_59126 - BLOCK
    )
    :vars
    (
      ?auto_59127 - BLOCK
      ?auto_59128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59127 ?auto_59126 ) ( CLEAR ?auto_59127 ) ( ON-TABLE ?auto_59123 ) ( ON ?auto_59124 ?auto_59123 ) ( ON ?auto_59125 ?auto_59124 ) ( ON ?auto_59126 ?auto_59125 ) ( not ( = ?auto_59123 ?auto_59124 ) ) ( not ( = ?auto_59123 ?auto_59125 ) ) ( not ( = ?auto_59123 ?auto_59126 ) ) ( not ( = ?auto_59123 ?auto_59127 ) ) ( not ( = ?auto_59124 ?auto_59125 ) ) ( not ( = ?auto_59124 ?auto_59126 ) ) ( not ( = ?auto_59124 ?auto_59127 ) ) ( not ( = ?auto_59125 ?auto_59126 ) ) ( not ( = ?auto_59125 ?auto_59127 ) ) ( not ( = ?auto_59126 ?auto_59127 ) ) ( HOLDING ?auto_59128 ) ( not ( = ?auto_59123 ?auto_59128 ) ) ( not ( = ?auto_59124 ?auto_59128 ) ) ( not ( = ?auto_59125 ?auto_59128 ) ) ( not ( = ?auto_59126 ?auto_59128 ) ) ( not ( = ?auto_59127 ?auto_59128 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_59128 )
      ( MAKE-4PILE ?auto_59123 ?auto_59124 ?auto_59125 ?auto_59126 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_59196 - BLOCK
      ?auto_59197 - BLOCK
    )
    :vars
    (
      ?auto_59198 - BLOCK
      ?auto_59200 - BLOCK
      ?auto_59199 - BLOCK
      ?auto_59201 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59196 ?auto_59197 ) ) ( ON ?auto_59197 ?auto_59198 ) ( not ( = ?auto_59196 ?auto_59198 ) ) ( not ( = ?auto_59197 ?auto_59198 ) ) ( ON ?auto_59196 ?auto_59197 ) ( CLEAR ?auto_59196 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_59200 ) ( ON ?auto_59199 ?auto_59200 ) ( ON ?auto_59201 ?auto_59199 ) ( ON ?auto_59198 ?auto_59201 ) ( not ( = ?auto_59200 ?auto_59199 ) ) ( not ( = ?auto_59200 ?auto_59201 ) ) ( not ( = ?auto_59200 ?auto_59198 ) ) ( not ( = ?auto_59200 ?auto_59197 ) ) ( not ( = ?auto_59200 ?auto_59196 ) ) ( not ( = ?auto_59199 ?auto_59201 ) ) ( not ( = ?auto_59199 ?auto_59198 ) ) ( not ( = ?auto_59199 ?auto_59197 ) ) ( not ( = ?auto_59199 ?auto_59196 ) ) ( not ( = ?auto_59201 ?auto_59198 ) ) ( not ( = ?auto_59201 ?auto_59197 ) ) ( not ( = ?auto_59201 ?auto_59196 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59200 ?auto_59199 ?auto_59201 ?auto_59198 ?auto_59197 )
      ( MAKE-2PILE ?auto_59196 ?auto_59197 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_59204 - BLOCK
      ?auto_59205 - BLOCK
    )
    :vars
    (
      ?auto_59206 - BLOCK
      ?auto_59207 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59204 ?auto_59205 ) ) ( ON ?auto_59205 ?auto_59206 ) ( CLEAR ?auto_59205 ) ( not ( = ?auto_59204 ?auto_59206 ) ) ( not ( = ?auto_59205 ?auto_59206 ) ) ( ON ?auto_59204 ?auto_59207 ) ( CLEAR ?auto_59204 ) ( HAND-EMPTY ) ( not ( = ?auto_59204 ?auto_59207 ) ) ( not ( = ?auto_59205 ?auto_59207 ) ) ( not ( = ?auto_59206 ?auto_59207 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_59204 ?auto_59207 )
      ( MAKE-2PILE ?auto_59204 ?auto_59205 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_59208 - BLOCK
      ?auto_59209 - BLOCK
    )
    :vars
    (
      ?auto_59210 - BLOCK
      ?auto_59211 - BLOCK
      ?auto_59214 - BLOCK
      ?auto_59213 - BLOCK
      ?auto_59212 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59208 ?auto_59209 ) ) ( not ( = ?auto_59208 ?auto_59210 ) ) ( not ( = ?auto_59209 ?auto_59210 ) ) ( ON ?auto_59208 ?auto_59211 ) ( CLEAR ?auto_59208 ) ( not ( = ?auto_59208 ?auto_59211 ) ) ( not ( = ?auto_59209 ?auto_59211 ) ) ( not ( = ?auto_59210 ?auto_59211 ) ) ( HOLDING ?auto_59209 ) ( CLEAR ?auto_59210 ) ( ON-TABLE ?auto_59214 ) ( ON ?auto_59213 ?auto_59214 ) ( ON ?auto_59212 ?auto_59213 ) ( ON ?auto_59210 ?auto_59212 ) ( not ( = ?auto_59214 ?auto_59213 ) ) ( not ( = ?auto_59214 ?auto_59212 ) ) ( not ( = ?auto_59214 ?auto_59210 ) ) ( not ( = ?auto_59214 ?auto_59209 ) ) ( not ( = ?auto_59213 ?auto_59212 ) ) ( not ( = ?auto_59213 ?auto_59210 ) ) ( not ( = ?auto_59213 ?auto_59209 ) ) ( not ( = ?auto_59212 ?auto_59210 ) ) ( not ( = ?auto_59212 ?auto_59209 ) ) ( not ( = ?auto_59208 ?auto_59214 ) ) ( not ( = ?auto_59208 ?auto_59213 ) ) ( not ( = ?auto_59208 ?auto_59212 ) ) ( not ( = ?auto_59211 ?auto_59214 ) ) ( not ( = ?auto_59211 ?auto_59213 ) ) ( not ( = ?auto_59211 ?auto_59212 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59214 ?auto_59213 ?auto_59212 ?auto_59210 ?auto_59209 )
      ( MAKE-2PILE ?auto_59208 ?auto_59209 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_59215 - BLOCK
      ?auto_59216 - BLOCK
    )
    :vars
    (
      ?auto_59221 - BLOCK
      ?auto_59220 - BLOCK
      ?auto_59217 - BLOCK
      ?auto_59218 - BLOCK
      ?auto_59219 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59215 ?auto_59216 ) ) ( not ( = ?auto_59215 ?auto_59221 ) ) ( not ( = ?auto_59216 ?auto_59221 ) ) ( ON ?auto_59215 ?auto_59220 ) ( not ( = ?auto_59215 ?auto_59220 ) ) ( not ( = ?auto_59216 ?auto_59220 ) ) ( not ( = ?auto_59221 ?auto_59220 ) ) ( CLEAR ?auto_59221 ) ( ON-TABLE ?auto_59217 ) ( ON ?auto_59218 ?auto_59217 ) ( ON ?auto_59219 ?auto_59218 ) ( ON ?auto_59221 ?auto_59219 ) ( not ( = ?auto_59217 ?auto_59218 ) ) ( not ( = ?auto_59217 ?auto_59219 ) ) ( not ( = ?auto_59217 ?auto_59221 ) ) ( not ( = ?auto_59217 ?auto_59216 ) ) ( not ( = ?auto_59218 ?auto_59219 ) ) ( not ( = ?auto_59218 ?auto_59221 ) ) ( not ( = ?auto_59218 ?auto_59216 ) ) ( not ( = ?auto_59219 ?auto_59221 ) ) ( not ( = ?auto_59219 ?auto_59216 ) ) ( not ( = ?auto_59215 ?auto_59217 ) ) ( not ( = ?auto_59215 ?auto_59218 ) ) ( not ( = ?auto_59215 ?auto_59219 ) ) ( not ( = ?auto_59220 ?auto_59217 ) ) ( not ( = ?auto_59220 ?auto_59218 ) ) ( not ( = ?auto_59220 ?auto_59219 ) ) ( ON ?auto_59216 ?auto_59215 ) ( CLEAR ?auto_59216 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_59220 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59220 ?auto_59215 )
      ( MAKE-2PILE ?auto_59215 ?auto_59216 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_59222 - BLOCK
      ?auto_59223 - BLOCK
    )
    :vars
    (
      ?auto_59228 - BLOCK
      ?auto_59225 - BLOCK
      ?auto_59226 - BLOCK
      ?auto_59224 - BLOCK
      ?auto_59227 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59222 ?auto_59223 ) ) ( not ( = ?auto_59222 ?auto_59228 ) ) ( not ( = ?auto_59223 ?auto_59228 ) ) ( ON ?auto_59222 ?auto_59225 ) ( not ( = ?auto_59222 ?auto_59225 ) ) ( not ( = ?auto_59223 ?auto_59225 ) ) ( not ( = ?auto_59228 ?auto_59225 ) ) ( ON-TABLE ?auto_59226 ) ( ON ?auto_59224 ?auto_59226 ) ( ON ?auto_59227 ?auto_59224 ) ( not ( = ?auto_59226 ?auto_59224 ) ) ( not ( = ?auto_59226 ?auto_59227 ) ) ( not ( = ?auto_59226 ?auto_59228 ) ) ( not ( = ?auto_59226 ?auto_59223 ) ) ( not ( = ?auto_59224 ?auto_59227 ) ) ( not ( = ?auto_59224 ?auto_59228 ) ) ( not ( = ?auto_59224 ?auto_59223 ) ) ( not ( = ?auto_59227 ?auto_59228 ) ) ( not ( = ?auto_59227 ?auto_59223 ) ) ( not ( = ?auto_59222 ?auto_59226 ) ) ( not ( = ?auto_59222 ?auto_59224 ) ) ( not ( = ?auto_59222 ?auto_59227 ) ) ( not ( = ?auto_59225 ?auto_59226 ) ) ( not ( = ?auto_59225 ?auto_59224 ) ) ( not ( = ?auto_59225 ?auto_59227 ) ) ( ON ?auto_59223 ?auto_59222 ) ( CLEAR ?auto_59223 ) ( ON-TABLE ?auto_59225 ) ( HOLDING ?auto_59228 ) ( CLEAR ?auto_59227 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59226 ?auto_59224 ?auto_59227 ?auto_59228 )
      ( MAKE-2PILE ?auto_59222 ?auto_59223 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_59229 - BLOCK
      ?auto_59230 - BLOCK
    )
    :vars
    (
      ?auto_59234 - BLOCK
      ?auto_59233 - BLOCK
      ?auto_59232 - BLOCK
      ?auto_59235 - BLOCK
      ?auto_59231 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59229 ?auto_59230 ) ) ( not ( = ?auto_59229 ?auto_59234 ) ) ( not ( = ?auto_59230 ?auto_59234 ) ) ( ON ?auto_59229 ?auto_59233 ) ( not ( = ?auto_59229 ?auto_59233 ) ) ( not ( = ?auto_59230 ?auto_59233 ) ) ( not ( = ?auto_59234 ?auto_59233 ) ) ( ON-TABLE ?auto_59232 ) ( ON ?auto_59235 ?auto_59232 ) ( ON ?auto_59231 ?auto_59235 ) ( not ( = ?auto_59232 ?auto_59235 ) ) ( not ( = ?auto_59232 ?auto_59231 ) ) ( not ( = ?auto_59232 ?auto_59234 ) ) ( not ( = ?auto_59232 ?auto_59230 ) ) ( not ( = ?auto_59235 ?auto_59231 ) ) ( not ( = ?auto_59235 ?auto_59234 ) ) ( not ( = ?auto_59235 ?auto_59230 ) ) ( not ( = ?auto_59231 ?auto_59234 ) ) ( not ( = ?auto_59231 ?auto_59230 ) ) ( not ( = ?auto_59229 ?auto_59232 ) ) ( not ( = ?auto_59229 ?auto_59235 ) ) ( not ( = ?auto_59229 ?auto_59231 ) ) ( not ( = ?auto_59233 ?auto_59232 ) ) ( not ( = ?auto_59233 ?auto_59235 ) ) ( not ( = ?auto_59233 ?auto_59231 ) ) ( ON ?auto_59230 ?auto_59229 ) ( ON-TABLE ?auto_59233 ) ( CLEAR ?auto_59231 ) ( ON ?auto_59234 ?auto_59230 ) ( CLEAR ?auto_59234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59233 ?auto_59229 ?auto_59230 )
      ( MAKE-2PILE ?auto_59229 ?auto_59230 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_59236 - BLOCK
      ?auto_59237 - BLOCK
    )
    :vars
    (
      ?auto_59239 - BLOCK
      ?auto_59240 - BLOCK
      ?auto_59242 - BLOCK
      ?auto_59238 - BLOCK
      ?auto_59241 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59236 ?auto_59237 ) ) ( not ( = ?auto_59236 ?auto_59239 ) ) ( not ( = ?auto_59237 ?auto_59239 ) ) ( ON ?auto_59236 ?auto_59240 ) ( not ( = ?auto_59236 ?auto_59240 ) ) ( not ( = ?auto_59237 ?auto_59240 ) ) ( not ( = ?auto_59239 ?auto_59240 ) ) ( ON-TABLE ?auto_59242 ) ( ON ?auto_59238 ?auto_59242 ) ( not ( = ?auto_59242 ?auto_59238 ) ) ( not ( = ?auto_59242 ?auto_59241 ) ) ( not ( = ?auto_59242 ?auto_59239 ) ) ( not ( = ?auto_59242 ?auto_59237 ) ) ( not ( = ?auto_59238 ?auto_59241 ) ) ( not ( = ?auto_59238 ?auto_59239 ) ) ( not ( = ?auto_59238 ?auto_59237 ) ) ( not ( = ?auto_59241 ?auto_59239 ) ) ( not ( = ?auto_59241 ?auto_59237 ) ) ( not ( = ?auto_59236 ?auto_59242 ) ) ( not ( = ?auto_59236 ?auto_59238 ) ) ( not ( = ?auto_59236 ?auto_59241 ) ) ( not ( = ?auto_59240 ?auto_59242 ) ) ( not ( = ?auto_59240 ?auto_59238 ) ) ( not ( = ?auto_59240 ?auto_59241 ) ) ( ON ?auto_59237 ?auto_59236 ) ( ON-TABLE ?auto_59240 ) ( ON ?auto_59239 ?auto_59237 ) ( CLEAR ?auto_59239 ) ( HOLDING ?auto_59241 ) ( CLEAR ?auto_59238 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59242 ?auto_59238 ?auto_59241 )
      ( MAKE-2PILE ?auto_59236 ?auto_59237 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_59243 - BLOCK
      ?auto_59244 - BLOCK
    )
    :vars
    (
      ?auto_59247 - BLOCK
      ?auto_59249 - BLOCK
      ?auto_59245 - BLOCK
      ?auto_59248 - BLOCK
      ?auto_59246 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59243 ?auto_59244 ) ) ( not ( = ?auto_59243 ?auto_59247 ) ) ( not ( = ?auto_59244 ?auto_59247 ) ) ( ON ?auto_59243 ?auto_59249 ) ( not ( = ?auto_59243 ?auto_59249 ) ) ( not ( = ?auto_59244 ?auto_59249 ) ) ( not ( = ?auto_59247 ?auto_59249 ) ) ( ON-TABLE ?auto_59245 ) ( ON ?auto_59248 ?auto_59245 ) ( not ( = ?auto_59245 ?auto_59248 ) ) ( not ( = ?auto_59245 ?auto_59246 ) ) ( not ( = ?auto_59245 ?auto_59247 ) ) ( not ( = ?auto_59245 ?auto_59244 ) ) ( not ( = ?auto_59248 ?auto_59246 ) ) ( not ( = ?auto_59248 ?auto_59247 ) ) ( not ( = ?auto_59248 ?auto_59244 ) ) ( not ( = ?auto_59246 ?auto_59247 ) ) ( not ( = ?auto_59246 ?auto_59244 ) ) ( not ( = ?auto_59243 ?auto_59245 ) ) ( not ( = ?auto_59243 ?auto_59248 ) ) ( not ( = ?auto_59243 ?auto_59246 ) ) ( not ( = ?auto_59249 ?auto_59245 ) ) ( not ( = ?auto_59249 ?auto_59248 ) ) ( not ( = ?auto_59249 ?auto_59246 ) ) ( ON ?auto_59244 ?auto_59243 ) ( ON-TABLE ?auto_59249 ) ( ON ?auto_59247 ?auto_59244 ) ( CLEAR ?auto_59248 ) ( ON ?auto_59246 ?auto_59247 ) ( CLEAR ?auto_59246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59249 ?auto_59243 ?auto_59244 ?auto_59247 )
      ( MAKE-2PILE ?auto_59243 ?auto_59244 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_59250 - BLOCK
      ?auto_59251 - BLOCK
    )
    :vars
    (
      ?auto_59255 - BLOCK
      ?auto_59256 - BLOCK
      ?auto_59253 - BLOCK
      ?auto_59254 - BLOCK
      ?auto_59252 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59250 ?auto_59251 ) ) ( not ( = ?auto_59250 ?auto_59255 ) ) ( not ( = ?auto_59251 ?auto_59255 ) ) ( ON ?auto_59250 ?auto_59256 ) ( not ( = ?auto_59250 ?auto_59256 ) ) ( not ( = ?auto_59251 ?auto_59256 ) ) ( not ( = ?auto_59255 ?auto_59256 ) ) ( ON-TABLE ?auto_59253 ) ( not ( = ?auto_59253 ?auto_59254 ) ) ( not ( = ?auto_59253 ?auto_59252 ) ) ( not ( = ?auto_59253 ?auto_59255 ) ) ( not ( = ?auto_59253 ?auto_59251 ) ) ( not ( = ?auto_59254 ?auto_59252 ) ) ( not ( = ?auto_59254 ?auto_59255 ) ) ( not ( = ?auto_59254 ?auto_59251 ) ) ( not ( = ?auto_59252 ?auto_59255 ) ) ( not ( = ?auto_59252 ?auto_59251 ) ) ( not ( = ?auto_59250 ?auto_59253 ) ) ( not ( = ?auto_59250 ?auto_59254 ) ) ( not ( = ?auto_59250 ?auto_59252 ) ) ( not ( = ?auto_59256 ?auto_59253 ) ) ( not ( = ?auto_59256 ?auto_59254 ) ) ( not ( = ?auto_59256 ?auto_59252 ) ) ( ON ?auto_59251 ?auto_59250 ) ( ON-TABLE ?auto_59256 ) ( ON ?auto_59255 ?auto_59251 ) ( ON ?auto_59252 ?auto_59255 ) ( CLEAR ?auto_59252 ) ( HOLDING ?auto_59254 ) ( CLEAR ?auto_59253 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59253 ?auto_59254 )
      ( MAKE-2PILE ?auto_59250 ?auto_59251 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_59257 - BLOCK
      ?auto_59258 - BLOCK
    )
    :vars
    (
      ?auto_59262 - BLOCK
      ?auto_59261 - BLOCK
      ?auto_59259 - BLOCK
      ?auto_59260 - BLOCK
      ?auto_59263 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59257 ?auto_59258 ) ) ( not ( = ?auto_59257 ?auto_59262 ) ) ( not ( = ?auto_59258 ?auto_59262 ) ) ( ON ?auto_59257 ?auto_59261 ) ( not ( = ?auto_59257 ?auto_59261 ) ) ( not ( = ?auto_59258 ?auto_59261 ) ) ( not ( = ?auto_59262 ?auto_59261 ) ) ( ON-TABLE ?auto_59259 ) ( not ( = ?auto_59259 ?auto_59260 ) ) ( not ( = ?auto_59259 ?auto_59263 ) ) ( not ( = ?auto_59259 ?auto_59262 ) ) ( not ( = ?auto_59259 ?auto_59258 ) ) ( not ( = ?auto_59260 ?auto_59263 ) ) ( not ( = ?auto_59260 ?auto_59262 ) ) ( not ( = ?auto_59260 ?auto_59258 ) ) ( not ( = ?auto_59263 ?auto_59262 ) ) ( not ( = ?auto_59263 ?auto_59258 ) ) ( not ( = ?auto_59257 ?auto_59259 ) ) ( not ( = ?auto_59257 ?auto_59260 ) ) ( not ( = ?auto_59257 ?auto_59263 ) ) ( not ( = ?auto_59261 ?auto_59259 ) ) ( not ( = ?auto_59261 ?auto_59260 ) ) ( not ( = ?auto_59261 ?auto_59263 ) ) ( ON ?auto_59258 ?auto_59257 ) ( ON-TABLE ?auto_59261 ) ( ON ?auto_59262 ?auto_59258 ) ( ON ?auto_59263 ?auto_59262 ) ( CLEAR ?auto_59259 ) ( ON ?auto_59260 ?auto_59263 ) ( CLEAR ?auto_59260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59261 ?auto_59257 ?auto_59258 ?auto_59262 ?auto_59263 )
      ( MAKE-2PILE ?auto_59257 ?auto_59258 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_59264 - BLOCK
      ?auto_59265 - BLOCK
    )
    :vars
    (
      ?auto_59268 - BLOCK
      ?auto_59266 - BLOCK
      ?auto_59270 - BLOCK
      ?auto_59269 - BLOCK
      ?auto_59267 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59264 ?auto_59265 ) ) ( not ( = ?auto_59264 ?auto_59268 ) ) ( not ( = ?auto_59265 ?auto_59268 ) ) ( ON ?auto_59264 ?auto_59266 ) ( not ( = ?auto_59264 ?auto_59266 ) ) ( not ( = ?auto_59265 ?auto_59266 ) ) ( not ( = ?auto_59268 ?auto_59266 ) ) ( not ( = ?auto_59270 ?auto_59269 ) ) ( not ( = ?auto_59270 ?auto_59267 ) ) ( not ( = ?auto_59270 ?auto_59268 ) ) ( not ( = ?auto_59270 ?auto_59265 ) ) ( not ( = ?auto_59269 ?auto_59267 ) ) ( not ( = ?auto_59269 ?auto_59268 ) ) ( not ( = ?auto_59269 ?auto_59265 ) ) ( not ( = ?auto_59267 ?auto_59268 ) ) ( not ( = ?auto_59267 ?auto_59265 ) ) ( not ( = ?auto_59264 ?auto_59270 ) ) ( not ( = ?auto_59264 ?auto_59269 ) ) ( not ( = ?auto_59264 ?auto_59267 ) ) ( not ( = ?auto_59266 ?auto_59270 ) ) ( not ( = ?auto_59266 ?auto_59269 ) ) ( not ( = ?auto_59266 ?auto_59267 ) ) ( ON ?auto_59265 ?auto_59264 ) ( ON-TABLE ?auto_59266 ) ( ON ?auto_59268 ?auto_59265 ) ( ON ?auto_59267 ?auto_59268 ) ( ON ?auto_59269 ?auto_59267 ) ( CLEAR ?auto_59269 ) ( HOLDING ?auto_59270 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_59270 )
      ( MAKE-2PILE ?auto_59264 ?auto_59265 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_59271 - BLOCK
      ?auto_59272 - BLOCK
    )
    :vars
    (
      ?auto_59276 - BLOCK
      ?auto_59277 - BLOCK
      ?auto_59273 - BLOCK
      ?auto_59275 - BLOCK
      ?auto_59274 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59271 ?auto_59272 ) ) ( not ( = ?auto_59271 ?auto_59276 ) ) ( not ( = ?auto_59272 ?auto_59276 ) ) ( ON ?auto_59271 ?auto_59277 ) ( not ( = ?auto_59271 ?auto_59277 ) ) ( not ( = ?auto_59272 ?auto_59277 ) ) ( not ( = ?auto_59276 ?auto_59277 ) ) ( not ( = ?auto_59273 ?auto_59275 ) ) ( not ( = ?auto_59273 ?auto_59274 ) ) ( not ( = ?auto_59273 ?auto_59276 ) ) ( not ( = ?auto_59273 ?auto_59272 ) ) ( not ( = ?auto_59275 ?auto_59274 ) ) ( not ( = ?auto_59275 ?auto_59276 ) ) ( not ( = ?auto_59275 ?auto_59272 ) ) ( not ( = ?auto_59274 ?auto_59276 ) ) ( not ( = ?auto_59274 ?auto_59272 ) ) ( not ( = ?auto_59271 ?auto_59273 ) ) ( not ( = ?auto_59271 ?auto_59275 ) ) ( not ( = ?auto_59271 ?auto_59274 ) ) ( not ( = ?auto_59277 ?auto_59273 ) ) ( not ( = ?auto_59277 ?auto_59275 ) ) ( not ( = ?auto_59277 ?auto_59274 ) ) ( ON ?auto_59272 ?auto_59271 ) ( ON-TABLE ?auto_59277 ) ( ON ?auto_59276 ?auto_59272 ) ( ON ?auto_59274 ?auto_59276 ) ( ON ?auto_59275 ?auto_59274 ) ( ON ?auto_59273 ?auto_59275 ) ( CLEAR ?auto_59273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_59277 ?auto_59271 ?auto_59272 ?auto_59276 ?auto_59274 ?auto_59275 )
      ( MAKE-2PILE ?auto_59271 ?auto_59272 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_59297 - BLOCK
      ?auto_59298 - BLOCK
      ?auto_59299 - BLOCK
    )
    :vars
    (
      ?auto_59300 - BLOCK
      ?auto_59302 - BLOCK
      ?auto_59301 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59300 ?auto_59299 ) ( ON-TABLE ?auto_59297 ) ( ON ?auto_59298 ?auto_59297 ) ( ON ?auto_59299 ?auto_59298 ) ( not ( = ?auto_59297 ?auto_59298 ) ) ( not ( = ?auto_59297 ?auto_59299 ) ) ( not ( = ?auto_59297 ?auto_59300 ) ) ( not ( = ?auto_59298 ?auto_59299 ) ) ( not ( = ?auto_59298 ?auto_59300 ) ) ( not ( = ?auto_59299 ?auto_59300 ) ) ( not ( = ?auto_59297 ?auto_59302 ) ) ( not ( = ?auto_59297 ?auto_59301 ) ) ( not ( = ?auto_59298 ?auto_59302 ) ) ( not ( = ?auto_59298 ?auto_59301 ) ) ( not ( = ?auto_59299 ?auto_59302 ) ) ( not ( = ?auto_59299 ?auto_59301 ) ) ( not ( = ?auto_59300 ?auto_59302 ) ) ( not ( = ?auto_59300 ?auto_59301 ) ) ( not ( = ?auto_59302 ?auto_59301 ) ) ( ON ?auto_59302 ?auto_59300 ) ( CLEAR ?auto_59302 ) ( HOLDING ?auto_59301 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_59301 )
      ( MAKE-3PILE ?auto_59297 ?auto_59298 ?auto_59299 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_59362 - BLOCK
      ?auto_59363 - BLOCK
      ?auto_59364 - BLOCK
    )
    :vars
    (
      ?auto_59365 - BLOCK
      ?auto_59366 - BLOCK
      ?auto_59367 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59362 ) ( not ( = ?auto_59362 ?auto_59363 ) ) ( not ( = ?auto_59362 ?auto_59364 ) ) ( not ( = ?auto_59363 ?auto_59364 ) ) ( ON ?auto_59364 ?auto_59365 ) ( not ( = ?auto_59362 ?auto_59365 ) ) ( not ( = ?auto_59363 ?auto_59365 ) ) ( not ( = ?auto_59364 ?auto_59365 ) ) ( CLEAR ?auto_59362 ) ( ON ?auto_59363 ?auto_59364 ) ( CLEAR ?auto_59363 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_59366 ) ( ON ?auto_59367 ?auto_59366 ) ( ON ?auto_59365 ?auto_59367 ) ( not ( = ?auto_59366 ?auto_59367 ) ) ( not ( = ?auto_59366 ?auto_59365 ) ) ( not ( = ?auto_59366 ?auto_59364 ) ) ( not ( = ?auto_59366 ?auto_59363 ) ) ( not ( = ?auto_59367 ?auto_59365 ) ) ( not ( = ?auto_59367 ?auto_59364 ) ) ( not ( = ?auto_59367 ?auto_59363 ) ) ( not ( = ?auto_59362 ?auto_59366 ) ) ( not ( = ?auto_59362 ?auto_59367 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59366 ?auto_59367 ?auto_59365 ?auto_59364 )
      ( MAKE-3PILE ?auto_59362 ?auto_59363 ?auto_59364 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_59368 - BLOCK
      ?auto_59369 - BLOCK
      ?auto_59370 - BLOCK
    )
    :vars
    (
      ?auto_59371 - BLOCK
      ?auto_59372 - BLOCK
      ?auto_59373 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59368 ?auto_59369 ) ) ( not ( = ?auto_59368 ?auto_59370 ) ) ( not ( = ?auto_59369 ?auto_59370 ) ) ( ON ?auto_59370 ?auto_59371 ) ( not ( = ?auto_59368 ?auto_59371 ) ) ( not ( = ?auto_59369 ?auto_59371 ) ) ( not ( = ?auto_59370 ?auto_59371 ) ) ( ON ?auto_59369 ?auto_59370 ) ( CLEAR ?auto_59369 ) ( ON-TABLE ?auto_59372 ) ( ON ?auto_59373 ?auto_59372 ) ( ON ?auto_59371 ?auto_59373 ) ( not ( = ?auto_59372 ?auto_59373 ) ) ( not ( = ?auto_59372 ?auto_59371 ) ) ( not ( = ?auto_59372 ?auto_59370 ) ) ( not ( = ?auto_59372 ?auto_59369 ) ) ( not ( = ?auto_59373 ?auto_59371 ) ) ( not ( = ?auto_59373 ?auto_59370 ) ) ( not ( = ?auto_59373 ?auto_59369 ) ) ( not ( = ?auto_59368 ?auto_59372 ) ) ( not ( = ?auto_59368 ?auto_59373 ) ) ( HOLDING ?auto_59368 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_59368 )
      ( MAKE-3PILE ?auto_59368 ?auto_59369 ?auto_59370 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_59374 - BLOCK
      ?auto_59375 - BLOCK
      ?auto_59376 - BLOCK
    )
    :vars
    (
      ?auto_59379 - BLOCK
      ?auto_59378 - BLOCK
      ?auto_59377 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59374 ?auto_59375 ) ) ( not ( = ?auto_59374 ?auto_59376 ) ) ( not ( = ?auto_59375 ?auto_59376 ) ) ( ON ?auto_59376 ?auto_59379 ) ( not ( = ?auto_59374 ?auto_59379 ) ) ( not ( = ?auto_59375 ?auto_59379 ) ) ( not ( = ?auto_59376 ?auto_59379 ) ) ( ON ?auto_59375 ?auto_59376 ) ( ON-TABLE ?auto_59378 ) ( ON ?auto_59377 ?auto_59378 ) ( ON ?auto_59379 ?auto_59377 ) ( not ( = ?auto_59378 ?auto_59377 ) ) ( not ( = ?auto_59378 ?auto_59379 ) ) ( not ( = ?auto_59378 ?auto_59376 ) ) ( not ( = ?auto_59378 ?auto_59375 ) ) ( not ( = ?auto_59377 ?auto_59379 ) ) ( not ( = ?auto_59377 ?auto_59376 ) ) ( not ( = ?auto_59377 ?auto_59375 ) ) ( not ( = ?auto_59374 ?auto_59378 ) ) ( not ( = ?auto_59374 ?auto_59377 ) ) ( ON ?auto_59374 ?auto_59375 ) ( CLEAR ?auto_59374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59378 ?auto_59377 ?auto_59379 ?auto_59376 ?auto_59375 )
      ( MAKE-3PILE ?auto_59374 ?auto_59375 ?auto_59376 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_59383 - BLOCK
      ?auto_59384 - BLOCK
      ?auto_59385 - BLOCK
    )
    :vars
    (
      ?auto_59387 - BLOCK
      ?auto_59386 - BLOCK
      ?auto_59388 - BLOCK
      ?auto_59389 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59383 ?auto_59384 ) ) ( not ( = ?auto_59383 ?auto_59385 ) ) ( not ( = ?auto_59384 ?auto_59385 ) ) ( ON ?auto_59385 ?auto_59387 ) ( not ( = ?auto_59383 ?auto_59387 ) ) ( not ( = ?auto_59384 ?auto_59387 ) ) ( not ( = ?auto_59385 ?auto_59387 ) ) ( ON ?auto_59384 ?auto_59385 ) ( CLEAR ?auto_59384 ) ( ON-TABLE ?auto_59386 ) ( ON ?auto_59388 ?auto_59386 ) ( ON ?auto_59387 ?auto_59388 ) ( not ( = ?auto_59386 ?auto_59388 ) ) ( not ( = ?auto_59386 ?auto_59387 ) ) ( not ( = ?auto_59386 ?auto_59385 ) ) ( not ( = ?auto_59386 ?auto_59384 ) ) ( not ( = ?auto_59388 ?auto_59387 ) ) ( not ( = ?auto_59388 ?auto_59385 ) ) ( not ( = ?auto_59388 ?auto_59384 ) ) ( not ( = ?auto_59383 ?auto_59386 ) ) ( not ( = ?auto_59383 ?auto_59388 ) ) ( ON ?auto_59383 ?auto_59389 ) ( CLEAR ?auto_59383 ) ( HAND-EMPTY ) ( not ( = ?auto_59383 ?auto_59389 ) ) ( not ( = ?auto_59384 ?auto_59389 ) ) ( not ( = ?auto_59385 ?auto_59389 ) ) ( not ( = ?auto_59387 ?auto_59389 ) ) ( not ( = ?auto_59386 ?auto_59389 ) ) ( not ( = ?auto_59388 ?auto_59389 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_59383 ?auto_59389 )
      ( MAKE-3PILE ?auto_59383 ?auto_59384 ?auto_59385 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_59390 - BLOCK
      ?auto_59391 - BLOCK
      ?auto_59392 - BLOCK
    )
    :vars
    (
      ?auto_59395 - BLOCK
      ?auto_59393 - BLOCK
      ?auto_59396 - BLOCK
      ?auto_59394 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59390 ?auto_59391 ) ) ( not ( = ?auto_59390 ?auto_59392 ) ) ( not ( = ?auto_59391 ?auto_59392 ) ) ( ON ?auto_59392 ?auto_59395 ) ( not ( = ?auto_59390 ?auto_59395 ) ) ( not ( = ?auto_59391 ?auto_59395 ) ) ( not ( = ?auto_59392 ?auto_59395 ) ) ( ON-TABLE ?auto_59393 ) ( ON ?auto_59396 ?auto_59393 ) ( ON ?auto_59395 ?auto_59396 ) ( not ( = ?auto_59393 ?auto_59396 ) ) ( not ( = ?auto_59393 ?auto_59395 ) ) ( not ( = ?auto_59393 ?auto_59392 ) ) ( not ( = ?auto_59393 ?auto_59391 ) ) ( not ( = ?auto_59396 ?auto_59395 ) ) ( not ( = ?auto_59396 ?auto_59392 ) ) ( not ( = ?auto_59396 ?auto_59391 ) ) ( not ( = ?auto_59390 ?auto_59393 ) ) ( not ( = ?auto_59390 ?auto_59396 ) ) ( ON ?auto_59390 ?auto_59394 ) ( CLEAR ?auto_59390 ) ( not ( = ?auto_59390 ?auto_59394 ) ) ( not ( = ?auto_59391 ?auto_59394 ) ) ( not ( = ?auto_59392 ?auto_59394 ) ) ( not ( = ?auto_59395 ?auto_59394 ) ) ( not ( = ?auto_59393 ?auto_59394 ) ) ( not ( = ?auto_59396 ?auto_59394 ) ) ( HOLDING ?auto_59391 ) ( CLEAR ?auto_59392 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59393 ?auto_59396 ?auto_59395 ?auto_59392 ?auto_59391 )
      ( MAKE-3PILE ?auto_59390 ?auto_59391 ?auto_59392 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_59397 - BLOCK
      ?auto_59398 - BLOCK
      ?auto_59399 - BLOCK
    )
    :vars
    (
      ?auto_59403 - BLOCK
      ?auto_59401 - BLOCK
      ?auto_59402 - BLOCK
      ?auto_59400 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59397 ?auto_59398 ) ) ( not ( = ?auto_59397 ?auto_59399 ) ) ( not ( = ?auto_59398 ?auto_59399 ) ) ( ON ?auto_59399 ?auto_59403 ) ( not ( = ?auto_59397 ?auto_59403 ) ) ( not ( = ?auto_59398 ?auto_59403 ) ) ( not ( = ?auto_59399 ?auto_59403 ) ) ( ON-TABLE ?auto_59401 ) ( ON ?auto_59402 ?auto_59401 ) ( ON ?auto_59403 ?auto_59402 ) ( not ( = ?auto_59401 ?auto_59402 ) ) ( not ( = ?auto_59401 ?auto_59403 ) ) ( not ( = ?auto_59401 ?auto_59399 ) ) ( not ( = ?auto_59401 ?auto_59398 ) ) ( not ( = ?auto_59402 ?auto_59403 ) ) ( not ( = ?auto_59402 ?auto_59399 ) ) ( not ( = ?auto_59402 ?auto_59398 ) ) ( not ( = ?auto_59397 ?auto_59401 ) ) ( not ( = ?auto_59397 ?auto_59402 ) ) ( ON ?auto_59397 ?auto_59400 ) ( not ( = ?auto_59397 ?auto_59400 ) ) ( not ( = ?auto_59398 ?auto_59400 ) ) ( not ( = ?auto_59399 ?auto_59400 ) ) ( not ( = ?auto_59403 ?auto_59400 ) ) ( not ( = ?auto_59401 ?auto_59400 ) ) ( not ( = ?auto_59402 ?auto_59400 ) ) ( CLEAR ?auto_59399 ) ( ON ?auto_59398 ?auto_59397 ) ( CLEAR ?auto_59398 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_59400 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59400 ?auto_59397 )
      ( MAKE-3PILE ?auto_59397 ?auto_59398 ?auto_59399 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_59404 - BLOCK
      ?auto_59405 - BLOCK
      ?auto_59406 - BLOCK
    )
    :vars
    (
      ?auto_59409 - BLOCK
      ?auto_59408 - BLOCK
      ?auto_59410 - BLOCK
      ?auto_59407 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59404 ?auto_59405 ) ) ( not ( = ?auto_59404 ?auto_59406 ) ) ( not ( = ?auto_59405 ?auto_59406 ) ) ( not ( = ?auto_59404 ?auto_59409 ) ) ( not ( = ?auto_59405 ?auto_59409 ) ) ( not ( = ?auto_59406 ?auto_59409 ) ) ( ON-TABLE ?auto_59408 ) ( ON ?auto_59410 ?auto_59408 ) ( ON ?auto_59409 ?auto_59410 ) ( not ( = ?auto_59408 ?auto_59410 ) ) ( not ( = ?auto_59408 ?auto_59409 ) ) ( not ( = ?auto_59408 ?auto_59406 ) ) ( not ( = ?auto_59408 ?auto_59405 ) ) ( not ( = ?auto_59410 ?auto_59409 ) ) ( not ( = ?auto_59410 ?auto_59406 ) ) ( not ( = ?auto_59410 ?auto_59405 ) ) ( not ( = ?auto_59404 ?auto_59408 ) ) ( not ( = ?auto_59404 ?auto_59410 ) ) ( ON ?auto_59404 ?auto_59407 ) ( not ( = ?auto_59404 ?auto_59407 ) ) ( not ( = ?auto_59405 ?auto_59407 ) ) ( not ( = ?auto_59406 ?auto_59407 ) ) ( not ( = ?auto_59409 ?auto_59407 ) ) ( not ( = ?auto_59408 ?auto_59407 ) ) ( not ( = ?auto_59410 ?auto_59407 ) ) ( ON ?auto_59405 ?auto_59404 ) ( CLEAR ?auto_59405 ) ( ON-TABLE ?auto_59407 ) ( HOLDING ?auto_59406 ) ( CLEAR ?auto_59409 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59408 ?auto_59410 ?auto_59409 ?auto_59406 )
      ( MAKE-3PILE ?auto_59404 ?auto_59405 ?auto_59406 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_59411 - BLOCK
      ?auto_59412 - BLOCK
      ?auto_59413 - BLOCK
    )
    :vars
    (
      ?auto_59415 - BLOCK
      ?auto_59417 - BLOCK
      ?auto_59414 - BLOCK
      ?auto_59416 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59411 ?auto_59412 ) ) ( not ( = ?auto_59411 ?auto_59413 ) ) ( not ( = ?auto_59412 ?auto_59413 ) ) ( not ( = ?auto_59411 ?auto_59415 ) ) ( not ( = ?auto_59412 ?auto_59415 ) ) ( not ( = ?auto_59413 ?auto_59415 ) ) ( ON-TABLE ?auto_59417 ) ( ON ?auto_59414 ?auto_59417 ) ( ON ?auto_59415 ?auto_59414 ) ( not ( = ?auto_59417 ?auto_59414 ) ) ( not ( = ?auto_59417 ?auto_59415 ) ) ( not ( = ?auto_59417 ?auto_59413 ) ) ( not ( = ?auto_59417 ?auto_59412 ) ) ( not ( = ?auto_59414 ?auto_59415 ) ) ( not ( = ?auto_59414 ?auto_59413 ) ) ( not ( = ?auto_59414 ?auto_59412 ) ) ( not ( = ?auto_59411 ?auto_59417 ) ) ( not ( = ?auto_59411 ?auto_59414 ) ) ( ON ?auto_59411 ?auto_59416 ) ( not ( = ?auto_59411 ?auto_59416 ) ) ( not ( = ?auto_59412 ?auto_59416 ) ) ( not ( = ?auto_59413 ?auto_59416 ) ) ( not ( = ?auto_59415 ?auto_59416 ) ) ( not ( = ?auto_59417 ?auto_59416 ) ) ( not ( = ?auto_59414 ?auto_59416 ) ) ( ON ?auto_59412 ?auto_59411 ) ( ON-TABLE ?auto_59416 ) ( CLEAR ?auto_59415 ) ( ON ?auto_59413 ?auto_59412 ) ( CLEAR ?auto_59413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59416 ?auto_59411 ?auto_59412 )
      ( MAKE-3PILE ?auto_59411 ?auto_59412 ?auto_59413 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_59418 - BLOCK
      ?auto_59419 - BLOCK
      ?auto_59420 - BLOCK
    )
    :vars
    (
      ?auto_59422 - BLOCK
      ?auto_59423 - BLOCK
      ?auto_59424 - BLOCK
      ?auto_59421 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59418 ?auto_59419 ) ) ( not ( = ?auto_59418 ?auto_59420 ) ) ( not ( = ?auto_59419 ?auto_59420 ) ) ( not ( = ?auto_59418 ?auto_59422 ) ) ( not ( = ?auto_59419 ?auto_59422 ) ) ( not ( = ?auto_59420 ?auto_59422 ) ) ( ON-TABLE ?auto_59423 ) ( ON ?auto_59424 ?auto_59423 ) ( not ( = ?auto_59423 ?auto_59424 ) ) ( not ( = ?auto_59423 ?auto_59422 ) ) ( not ( = ?auto_59423 ?auto_59420 ) ) ( not ( = ?auto_59423 ?auto_59419 ) ) ( not ( = ?auto_59424 ?auto_59422 ) ) ( not ( = ?auto_59424 ?auto_59420 ) ) ( not ( = ?auto_59424 ?auto_59419 ) ) ( not ( = ?auto_59418 ?auto_59423 ) ) ( not ( = ?auto_59418 ?auto_59424 ) ) ( ON ?auto_59418 ?auto_59421 ) ( not ( = ?auto_59418 ?auto_59421 ) ) ( not ( = ?auto_59419 ?auto_59421 ) ) ( not ( = ?auto_59420 ?auto_59421 ) ) ( not ( = ?auto_59422 ?auto_59421 ) ) ( not ( = ?auto_59423 ?auto_59421 ) ) ( not ( = ?auto_59424 ?auto_59421 ) ) ( ON ?auto_59419 ?auto_59418 ) ( ON-TABLE ?auto_59421 ) ( ON ?auto_59420 ?auto_59419 ) ( CLEAR ?auto_59420 ) ( HOLDING ?auto_59422 ) ( CLEAR ?auto_59424 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59423 ?auto_59424 ?auto_59422 )
      ( MAKE-3PILE ?auto_59418 ?auto_59419 ?auto_59420 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_59425 - BLOCK
      ?auto_59426 - BLOCK
      ?auto_59427 - BLOCK
    )
    :vars
    (
      ?auto_59429 - BLOCK
      ?auto_59431 - BLOCK
      ?auto_59428 - BLOCK
      ?auto_59430 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59425 ?auto_59426 ) ) ( not ( = ?auto_59425 ?auto_59427 ) ) ( not ( = ?auto_59426 ?auto_59427 ) ) ( not ( = ?auto_59425 ?auto_59429 ) ) ( not ( = ?auto_59426 ?auto_59429 ) ) ( not ( = ?auto_59427 ?auto_59429 ) ) ( ON-TABLE ?auto_59431 ) ( ON ?auto_59428 ?auto_59431 ) ( not ( = ?auto_59431 ?auto_59428 ) ) ( not ( = ?auto_59431 ?auto_59429 ) ) ( not ( = ?auto_59431 ?auto_59427 ) ) ( not ( = ?auto_59431 ?auto_59426 ) ) ( not ( = ?auto_59428 ?auto_59429 ) ) ( not ( = ?auto_59428 ?auto_59427 ) ) ( not ( = ?auto_59428 ?auto_59426 ) ) ( not ( = ?auto_59425 ?auto_59431 ) ) ( not ( = ?auto_59425 ?auto_59428 ) ) ( ON ?auto_59425 ?auto_59430 ) ( not ( = ?auto_59425 ?auto_59430 ) ) ( not ( = ?auto_59426 ?auto_59430 ) ) ( not ( = ?auto_59427 ?auto_59430 ) ) ( not ( = ?auto_59429 ?auto_59430 ) ) ( not ( = ?auto_59431 ?auto_59430 ) ) ( not ( = ?auto_59428 ?auto_59430 ) ) ( ON ?auto_59426 ?auto_59425 ) ( ON-TABLE ?auto_59430 ) ( ON ?auto_59427 ?auto_59426 ) ( CLEAR ?auto_59428 ) ( ON ?auto_59429 ?auto_59427 ) ( CLEAR ?auto_59429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59430 ?auto_59425 ?auto_59426 ?auto_59427 )
      ( MAKE-3PILE ?auto_59425 ?auto_59426 ?auto_59427 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_59432 - BLOCK
      ?auto_59433 - BLOCK
      ?auto_59434 - BLOCK
    )
    :vars
    (
      ?auto_59438 - BLOCK
      ?auto_59435 - BLOCK
      ?auto_59436 - BLOCK
      ?auto_59437 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59432 ?auto_59433 ) ) ( not ( = ?auto_59432 ?auto_59434 ) ) ( not ( = ?auto_59433 ?auto_59434 ) ) ( not ( = ?auto_59432 ?auto_59438 ) ) ( not ( = ?auto_59433 ?auto_59438 ) ) ( not ( = ?auto_59434 ?auto_59438 ) ) ( ON-TABLE ?auto_59435 ) ( not ( = ?auto_59435 ?auto_59436 ) ) ( not ( = ?auto_59435 ?auto_59438 ) ) ( not ( = ?auto_59435 ?auto_59434 ) ) ( not ( = ?auto_59435 ?auto_59433 ) ) ( not ( = ?auto_59436 ?auto_59438 ) ) ( not ( = ?auto_59436 ?auto_59434 ) ) ( not ( = ?auto_59436 ?auto_59433 ) ) ( not ( = ?auto_59432 ?auto_59435 ) ) ( not ( = ?auto_59432 ?auto_59436 ) ) ( ON ?auto_59432 ?auto_59437 ) ( not ( = ?auto_59432 ?auto_59437 ) ) ( not ( = ?auto_59433 ?auto_59437 ) ) ( not ( = ?auto_59434 ?auto_59437 ) ) ( not ( = ?auto_59438 ?auto_59437 ) ) ( not ( = ?auto_59435 ?auto_59437 ) ) ( not ( = ?auto_59436 ?auto_59437 ) ) ( ON ?auto_59433 ?auto_59432 ) ( ON-TABLE ?auto_59437 ) ( ON ?auto_59434 ?auto_59433 ) ( ON ?auto_59438 ?auto_59434 ) ( CLEAR ?auto_59438 ) ( HOLDING ?auto_59436 ) ( CLEAR ?auto_59435 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59435 ?auto_59436 )
      ( MAKE-3PILE ?auto_59432 ?auto_59433 ?auto_59434 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_59439 - BLOCK
      ?auto_59440 - BLOCK
      ?auto_59441 - BLOCK
    )
    :vars
    (
      ?auto_59445 - BLOCK
      ?auto_59442 - BLOCK
      ?auto_59443 - BLOCK
      ?auto_59444 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59439 ?auto_59440 ) ) ( not ( = ?auto_59439 ?auto_59441 ) ) ( not ( = ?auto_59440 ?auto_59441 ) ) ( not ( = ?auto_59439 ?auto_59445 ) ) ( not ( = ?auto_59440 ?auto_59445 ) ) ( not ( = ?auto_59441 ?auto_59445 ) ) ( ON-TABLE ?auto_59442 ) ( not ( = ?auto_59442 ?auto_59443 ) ) ( not ( = ?auto_59442 ?auto_59445 ) ) ( not ( = ?auto_59442 ?auto_59441 ) ) ( not ( = ?auto_59442 ?auto_59440 ) ) ( not ( = ?auto_59443 ?auto_59445 ) ) ( not ( = ?auto_59443 ?auto_59441 ) ) ( not ( = ?auto_59443 ?auto_59440 ) ) ( not ( = ?auto_59439 ?auto_59442 ) ) ( not ( = ?auto_59439 ?auto_59443 ) ) ( ON ?auto_59439 ?auto_59444 ) ( not ( = ?auto_59439 ?auto_59444 ) ) ( not ( = ?auto_59440 ?auto_59444 ) ) ( not ( = ?auto_59441 ?auto_59444 ) ) ( not ( = ?auto_59445 ?auto_59444 ) ) ( not ( = ?auto_59442 ?auto_59444 ) ) ( not ( = ?auto_59443 ?auto_59444 ) ) ( ON ?auto_59440 ?auto_59439 ) ( ON-TABLE ?auto_59444 ) ( ON ?auto_59441 ?auto_59440 ) ( ON ?auto_59445 ?auto_59441 ) ( CLEAR ?auto_59442 ) ( ON ?auto_59443 ?auto_59445 ) ( CLEAR ?auto_59443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59444 ?auto_59439 ?auto_59440 ?auto_59441 ?auto_59445 )
      ( MAKE-3PILE ?auto_59439 ?auto_59440 ?auto_59441 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_59446 - BLOCK
      ?auto_59447 - BLOCK
      ?auto_59448 - BLOCK
    )
    :vars
    (
      ?auto_59452 - BLOCK
      ?auto_59449 - BLOCK
      ?auto_59451 - BLOCK
      ?auto_59450 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59446 ?auto_59447 ) ) ( not ( = ?auto_59446 ?auto_59448 ) ) ( not ( = ?auto_59447 ?auto_59448 ) ) ( not ( = ?auto_59446 ?auto_59452 ) ) ( not ( = ?auto_59447 ?auto_59452 ) ) ( not ( = ?auto_59448 ?auto_59452 ) ) ( not ( = ?auto_59449 ?auto_59451 ) ) ( not ( = ?auto_59449 ?auto_59452 ) ) ( not ( = ?auto_59449 ?auto_59448 ) ) ( not ( = ?auto_59449 ?auto_59447 ) ) ( not ( = ?auto_59451 ?auto_59452 ) ) ( not ( = ?auto_59451 ?auto_59448 ) ) ( not ( = ?auto_59451 ?auto_59447 ) ) ( not ( = ?auto_59446 ?auto_59449 ) ) ( not ( = ?auto_59446 ?auto_59451 ) ) ( ON ?auto_59446 ?auto_59450 ) ( not ( = ?auto_59446 ?auto_59450 ) ) ( not ( = ?auto_59447 ?auto_59450 ) ) ( not ( = ?auto_59448 ?auto_59450 ) ) ( not ( = ?auto_59452 ?auto_59450 ) ) ( not ( = ?auto_59449 ?auto_59450 ) ) ( not ( = ?auto_59451 ?auto_59450 ) ) ( ON ?auto_59447 ?auto_59446 ) ( ON-TABLE ?auto_59450 ) ( ON ?auto_59448 ?auto_59447 ) ( ON ?auto_59452 ?auto_59448 ) ( ON ?auto_59451 ?auto_59452 ) ( CLEAR ?auto_59451 ) ( HOLDING ?auto_59449 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_59449 )
      ( MAKE-3PILE ?auto_59446 ?auto_59447 ?auto_59448 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_59453 - BLOCK
      ?auto_59454 - BLOCK
      ?auto_59455 - BLOCK
    )
    :vars
    (
      ?auto_59459 - BLOCK
      ?auto_59456 - BLOCK
      ?auto_59457 - BLOCK
      ?auto_59458 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59453 ?auto_59454 ) ) ( not ( = ?auto_59453 ?auto_59455 ) ) ( not ( = ?auto_59454 ?auto_59455 ) ) ( not ( = ?auto_59453 ?auto_59459 ) ) ( not ( = ?auto_59454 ?auto_59459 ) ) ( not ( = ?auto_59455 ?auto_59459 ) ) ( not ( = ?auto_59456 ?auto_59457 ) ) ( not ( = ?auto_59456 ?auto_59459 ) ) ( not ( = ?auto_59456 ?auto_59455 ) ) ( not ( = ?auto_59456 ?auto_59454 ) ) ( not ( = ?auto_59457 ?auto_59459 ) ) ( not ( = ?auto_59457 ?auto_59455 ) ) ( not ( = ?auto_59457 ?auto_59454 ) ) ( not ( = ?auto_59453 ?auto_59456 ) ) ( not ( = ?auto_59453 ?auto_59457 ) ) ( ON ?auto_59453 ?auto_59458 ) ( not ( = ?auto_59453 ?auto_59458 ) ) ( not ( = ?auto_59454 ?auto_59458 ) ) ( not ( = ?auto_59455 ?auto_59458 ) ) ( not ( = ?auto_59459 ?auto_59458 ) ) ( not ( = ?auto_59456 ?auto_59458 ) ) ( not ( = ?auto_59457 ?auto_59458 ) ) ( ON ?auto_59454 ?auto_59453 ) ( ON-TABLE ?auto_59458 ) ( ON ?auto_59455 ?auto_59454 ) ( ON ?auto_59459 ?auto_59455 ) ( ON ?auto_59457 ?auto_59459 ) ( ON ?auto_59456 ?auto_59457 ) ( CLEAR ?auto_59456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_59458 ?auto_59453 ?auto_59454 ?auto_59455 ?auto_59459 ?auto_59457 )
      ( MAKE-3PILE ?auto_59453 ?auto_59454 ?auto_59455 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_59475 - BLOCK
      ?auto_59476 - BLOCK
    )
    :vars
    (
      ?auto_59478 - BLOCK
      ?auto_59477 - BLOCK
      ?auto_59479 - BLOCK
      ?auto_59480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59478 ?auto_59476 ) ( ON-TABLE ?auto_59475 ) ( ON ?auto_59476 ?auto_59475 ) ( not ( = ?auto_59475 ?auto_59476 ) ) ( not ( = ?auto_59475 ?auto_59478 ) ) ( not ( = ?auto_59476 ?auto_59478 ) ) ( not ( = ?auto_59475 ?auto_59477 ) ) ( not ( = ?auto_59475 ?auto_59479 ) ) ( not ( = ?auto_59476 ?auto_59477 ) ) ( not ( = ?auto_59476 ?auto_59479 ) ) ( not ( = ?auto_59478 ?auto_59477 ) ) ( not ( = ?auto_59478 ?auto_59479 ) ) ( not ( = ?auto_59477 ?auto_59479 ) ) ( ON ?auto_59477 ?auto_59478 ) ( CLEAR ?auto_59477 ) ( HOLDING ?auto_59479 ) ( CLEAR ?auto_59480 ) ( ON-TABLE ?auto_59480 ) ( not ( = ?auto_59480 ?auto_59479 ) ) ( not ( = ?auto_59475 ?auto_59480 ) ) ( not ( = ?auto_59476 ?auto_59480 ) ) ( not ( = ?auto_59478 ?auto_59480 ) ) ( not ( = ?auto_59477 ?auto_59480 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59480 ?auto_59479 )
      ( MAKE-2PILE ?auto_59475 ?auto_59476 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_59481 - BLOCK
      ?auto_59482 - BLOCK
    )
    :vars
    (
      ?auto_59485 - BLOCK
      ?auto_59486 - BLOCK
      ?auto_59484 - BLOCK
      ?auto_59483 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59485 ?auto_59482 ) ( ON-TABLE ?auto_59481 ) ( ON ?auto_59482 ?auto_59481 ) ( not ( = ?auto_59481 ?auto_59482 ) ) ( not ( = ?auto_59481 ?auto_59485 ) ) ( not ( = ?auto_59482 ?auto_59485 ) ) ( not ( = ?auto_59481 ?auto_59486 ) ) ( not ( = ?auto_59481 ?auto_59484 ) ) ( not ( = ?auto_59482 ?auto_59486 ) ) ( not ( = ?auto_59482 ?auto_59484 ) ) ( not ( = ?auto_59485 ?auto_59486 ) ) ( not ( = ?auto_59485 ?auto_59484 ) ) ( not ( = ?auto_59486 ?auto_59484 ) ) ( ON ?auto_59486 ?auto_59485 ) ( CLEAR ?auto_59483 ) ( ON-TABLE ?auto_59483 ) ( not ( = ?auto_59483 ?auto_59484 ) ) ( not ( = ?auto_59481 ?auto_59483 ) ) ( not ( = ?auto_59482 ?auto_59483 ) ) ( not ( = ?auto_59485 ?auto_59483 ) ) ( not ( = ?auto_59486 ?auto_59483 ) ) ( ON ?auto_59484 ?auto_59486 ) ( CLEAR ?auto_59484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59481 ?auto_59482 ?auto_59485 ?auto_59486 )
      ( MAKE-2PILE ?auto_59481 ?auto_59482 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_59487 - BLOCK
      ?auto_59488 - BLOCK
    )
    :vars
    (
      ?auto_59491 - BLOCK
      ?auto_59489 - BLOCK
      ?auto_59492 - BLOCK
      ?auto_59490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59491 ?auto_59488 ) ( ON-TABLE ?auto_59487 ) ( ON ?auto_59488 ?auto_59487 ) ( not ( = ?auto_59487 ?auto_59488 ) ) ( not ( = ?auto_59487 ?auto_59491 ) ) ( not ( = ?auto_59488 ?auto_59491 ) ) ( not ( = ?auto_59487 ?auto_59489 ) ) ( not ( = ?auto_59487 ?auto_59492 ) ) ( not ( = ?auto_59488 ?auto_59489 ) ) ( not ( = ?auto_59488 ?auto_59492 ) ) ( not ( = ?auto_59491 ?auto_59489 ) ) ( not ( = ?auto_59491 ?auto_59492 ) ) ( not ( = ?auto_59489 ?auto_59492 ) ) ( ON ?auto_59489 ?auto_59491 ) ( not ( = ?auto_59490 ?auto_59492 ) ) ( not ( = ?auto_59487 ?auto_59490 ) ) ( not ( = ?auto_59488 ?auto_59490 ) ) ( not ( = ?auto_59491 ?auto_59490 ) ) ( not ( = ?auto_59489 ?auto_59490 ) ) ( ON ?auto_59492 ?auto_59489 ) ( CLEAR ?auto_59492 ) ( HOLDING ?auto_59490 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_59490 )
      ( MAKE-2PILE ?auto_59487 ?auto_59488 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_59501 - BLOCK
      ?auto_59502 - BLOCK
    )
    :vars
    (
      ?auto_59504 - BLOCK
      ?auto_59505 - BLOCK
      ?auto_59503 - BLOCK
      ?auto_59506 - BLOCK
      ?auto_59507 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59504 ?auto_59502 ) ( ON-TABLE ?auto_59501 ) ( ON ?auto_59502 ?auto_59501 ) ( not ( = ?auto_59501 ?auto_59502 ) ) ( not ( = ?auto_59501 ?auto_59504 ) ) ( not ( = ?auto_59502 ?auto_59504 ) ) ( not ( = ?auto_59501 ?auto_59505 ) ) ( not ( = ?auto_59501 ?auto_59503 ) ) ( not ( = ?auto_59502 ?auto_59505 ) ) ( not ( = ?auto_59502 ?auto_59503 ) ) ( not ( = ?auto_59504 ?auto_59505 ) ) ( not ( = ?auto_59504 ?auto_59503 ) ) ( not ( = ?auto_59505 ?auto_59503 ) ) ( ON ?auto_59505 ?auto_59504 ) ( not ( = ?auto_59506 ?auto_59503 ) ) ( not ( = ?auto_59501 ?auto_59506 ) ) ( not ( = ?auto_59502 ?auto_59506 ) ) ( not ( = ?auto_59504 ?auto_59506 ) ) ( not ( = ?auto_59505 ?auto_59506 ) ) ( ON ?auto_59503 ?auto_59505 ) ( CLEAR ?auto_59503 ) ( ON ?auto_59506 ?auto_59507 ) ( CLEAR ?auto_59506 ) ( HAND-EMPTY ) ( not ( = ?auto_59501 ?auto_59507 ) ) ( not ( = ?auto_59502 ?auto_59507 ) ) ( not ( = ?auto_59504 ?auto_59507 ) ) ( not ( = ?auto_59505 ?auto_59507 ) ) ( not ( = ?auto_59503 ?auto_59507 ) ) ( not ( = ?auto_59506 ?auto_59507 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_59506 ?auto_59507 )
      ( MAKE-2PILE ?auto_59501 ?auto_59502 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_59508 - BLOCK
      ?auto_59509 - BLOCK
    )
    :vars
    (
      ?auto_59511 - BLOCK
      ?auto_59514 - BLOCK
      ?auto_59513 - BLOCK
      ?auto_59512 - BLOCK
      ?auto_59510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59511 ?auto_59509 ) ( ON-TABLE ?auto_59508 ) ( ON ?auto_59509 ?auto_59508 ) ( not ( = ?auto_59508 ?auto_59509 ) ) ( not ( = ?auto_59508 ?auto_59511 ) ) ( not ( = ?auto_59509 ?auto_59511 ) ) ( not ( = ?auto_59508 ?auto_59514 ) ) ( not ( = ?auto_59508 ?auto_59513 ) ) ( not ( = ?auto_59509 ?auto_59514 ) ) ( not ( = ?auto_59509 ?auto_59513 ) ) ( not ( = ?auto_59511 ?auto_59514 ) ) ( not ( = ?auto_59511 ?auto_59513 ) ) ( not ( = ?auto_59514 ?auto_59513 ) ) ( ON ?auto_59514 ?auto_59511 ) ( not ( = ?auto_59512 ?auto_59513 ) ) ( not ( = ?auto_59508 ?auto_59512 ) ) ( not ( = ?auto_59509 ?auto_59512 ) ) ( not ( = ?auto_59511 ?auto_59512 ) ) ( not ( = ?auto_59514 ?auto_59512 ) ) ( ON ?auto_59512 ?auto_59510 ) ( CLEAR ?auto_59512 ) ( not ( = ?auto_59508 ?auto_59510 ) ) ( not ( = ?auto_59509 ?auto_59510 ) ) ( not ( = ?auto_59511 ?auto_59510 ) ) ( not ( = ?auto_59514 ?auto_59510 ) ) ( not ( = ?auto_59513 ?auto_59510 ) ) ( not ( = ?auto_59512 ?auto_59510 ) ) ( HOLDING ?auto_59513 ) ( CLEAR ?auto_59514 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59508 ?auto_59509 ?auto_59511 ?auto_59514 ?auto_59513 )
      ( MAKE-2PILE ?auto_59508 ?auto_59509 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_59554 - BLOCK
      ?auto_59555 - BLOCK
      ?auto_59556 - BLOCK
      ?auto_59557 - BLOCK
    )
    :vars
    (
      ?auto_59558 - BLOCK
      ?auto_59559 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59554 ) ( ON ?auto_59555 ?auto_59554 ) ( not ( = ?auto_59554 ?auto_59555 ) ) ( not ( = ?auto_59554 ?auto_59556 ) ) ( not ( = ?auto_59554 ?auto_59557 ) ) ( not ( = ?auto_59555 ?auto_59556 ) ) ( not ( = ?auto_59555 ?auto_59557 ) ) ( not ( = ?auto_59556 ?auto_59557 ) ) ( ON ?auto_59557 ?auto_59558 ) ( not ( = ?auto_59554 ?auto_59558 ) ) ( not ( = ?auto_59555 ?auto_59558 ) ) ( not ( = ?auto_59556 ?auto_59558 ) ) ( not ( = ?auto_59557 ?auto_59558 ) ) ( CLEAR ?auto_59555 ) ( ON ?auto_59556 ?auto_59557 ) ( CLEAR ?auto_59556 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_59559 ) ( ON ?auto_59558 ?auto_59559 ) ( not ( = ?auto_59559 ?auto_59558 ) ) ( not ( = ?auto_59559 ?auto_59557 ) ) ( not ( = ?auto_59559 ?auto_59556 ) ) ( not ( = ?auto_59554 ?auto_59559 ) ) ( not ( = ?auto_59555 ?auto_59559 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59559 ?auto_59558 ?auto_59557 )
      ( MAKE-4PILE ?auto_59554 ?auto_59555 ?auto_59556 ?auto_59557 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_59560 - BLOCK
      ?auto_59561 - BLOCK
      ?auto_59562 - BLOCK
      ?auto_59563 - BLOCK
    )
    :vars
    (
      ?auto_59565 - BLOCK
      ?auto_59564 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59560 ) ( not ( = ?auto_59560 ?auto_59561 ) ) ( not ( = ?auto_59560 ?auto_59562 ) ) ( not ( = ?auto_59560 ?auto_59563 ) ) ( not ( = ?auto_59561 ?auto_59562 ) ) ( not ( = ?auto_59561 ?auto_59563 ) ) ( not ( = ?auto_59562 ?auto_59563 ) ) ( ON ?auto_59563 ?auto_59565 ) ( not ( = ?auto_59560 ?auto_59565 ) ) ( not ( = ?auto_59561 ?auto_59565 ) ) ( not ( = ?auto_59562 ?auto_59565 ) ) ( not ( = ?auto_59563 ?auto_59565 ) ) ( ON ?auto_59562 ?auto_59563 ) ( CLEAR ?auto_59562 ) ( ON-TABLE ?auto_59564 ) ( ON ?auto_59565 ?auto_59564 ) ( not ( = ?auto_59564 ?auto_59565 ) ) ( not ( = ?auto_59564 ?auto_59563 ) ) ( not ( = ?auto_59564 ?auto_59562 ) ) ( not ( = ?auto_59560 ?auto_59564 ) ) ( not ( = ?auto_59561 ?auto_59564 ) ) ( HOLDING ?auto_59561 ) ( CLEAR ?auto_59560 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59560 ?auto_59561 )
      ( MAKE-4PILE ?auto_59560 ?auto_59561 ?auto_59562 ?auto_59563 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_59566 - BLOCK
      ?auto_59567 - BLOCK
      ?auto_59568 - BLOCK
      ?auto_59569 - BLOCK
    )
    :vars
    (
      ?auto_59570 - BLOCK
      ?auto_59571 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59566 ) ( not ( = ?auto_59566 ?auto_59567 ) ) ( not ( = ?auto_59566 ?auto_59568 ) ) ( not ( = ?auto_59566 ?auto_59569 ) ) ( not ( = ?auto_59567 ?auto_59568 ) ) ( not ( = ?auto_59567 ?auto_59569 ) ) ( not ( = ?auto_59568 ?auto_59569 ) ) ( ON ?auto_59569 ?auto_59570 ) ( not ( = ?auto_59566 ?auto_59570 ) ) ( not ( = ?auto_59567 ?auto_59570 ) ) ( not ( = ?auto_59568 ?auto_59570 ) ) ( not ( = ?auto_59569 ?auto_59570 ) ) ( ON ?auto_59568 ?auto_59569 ) ( ON-TABLE ?auto_59571 ) ( ON ?auto_59570 ?auto_59571 ) ( not ( = ?auto_59571 ?auto_59570 ) ) ( not ( = ?auto_59571 ?auto_59569 ) ) ( not ( = ?auto_59571 ?auto_59568 ) ) ( not ( = ?auto_59566 ?auto_59571 ) ) ( not ( = ?auto_59567 ?auto_59571 ) ) ( CLEAR ?auto_59566 ) ( ON ?auto_59567 ?auto_59568 ) ( CLEAR ?auto_59567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59571 ?auto_59570 ?auto_59569 ?auto_59568 )
      ( MAKE-4PILE ?auto_59566 ?auto_59567 ?auto_59568 ?auto_59569 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_59572 - BLOCK
      ?auto_59573 - BLOCK
      ?auto_59574 - BLOCK
      ?auto_59575 - BLOCK
    )
    :vars
    (
      ?auto_59576 - BLOCK
      ?auto_59577 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59572 ?auto_59573 ) ) ( not ( = ?auto_59572 ?auto_59574 ) ) ( not ( = ?auto_59572 ?auto_59575 ) ) ( not ( = ?auto_59573 ?auto_59574 ) ) ( not ( = ?auto_59573 ?auto_59575 ) ) ( not ( = ?auto_59574 ?auto_59575 ) ) ( ON ?auto_59575 ?auto_59576 ) ( not ( = ?auto_59572 ?auto_59576 ) ) ( not ( = ?auto_59573 ?auto_59576 ) ) ( not ( = ?auto_59574 ?auto_59576 ) ) ( not ( = ?auto_59575 ?auto_59576 ) ) ( ON ?auto_59574 ?auto_59575 ) ( ON-TABLE ?auto_59577 ) ( ON ?auto_59576 ?auto_59577 ) ( not ( = ?auto_59577 ?auto_59576 ) ) ( not ( = ?auto_59577 ?auto_59575 ) ) ( not ( = ?auto_59577 ?auto_59574 ) ) ( not ( = ?auto_59572 ?auto_59577 ) ) ( not ( = ?auto_59573 ?auto_59577 ) ) ( ON ?auto_59573 ?auto_59574 ) ( CLEAR ?auto_59573 ) ( HOLDING ?auto_59572 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_59572 )
      ( MAKE-4PILE ?auto_59572 ?auto_59573 ?auto_59574 ?auto_59575 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_59578 - BLOCK
      ?auto_59579 - BLOCK
      ?auto_59580 - BLOCK
      ?auto_59581 - BLOCK
    )
    :vars
    (
      ?auto_59583 - BLOCK
      ?auto_59582 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59578 ?auto_59579 ) ) ( not ( = ?auto_59578 ?auto_59580 ) ) ( not ( = ?auto_59578 ?auto_59581 ) ) ( not ( = ?auto_59579 ?auto_59580 ) ) ( not ( = ?auto_59579 ?auto_59581 ) ) ( not ( = ?auto_59580 ?auto_59581 ) ) ( ON ?auto_59581 ?auto_59583 ) ( not ( = ?auto_59578 ?auto_59583 ) ) ( not ( = ?auto_59579 ?auto_59583 ) ) ( not ( = ?auto_59580 ?auto_59583 ) ) ( not ( = ?auto_59581 ?auto_59583 ) ) ( ON ?auto_59580 ?auto_59581 ) ( ON-TABLE ?auto_59582 ) ( ON ?auto_59583 ?auto_59582 ) ( not ( = ?auto_59582 ?auto_59583 ) ) ( not ( = ?auto_59582 ?auto_59581 ) ) ( not ( = ?auto_59582 ?auto_59580 ) ) ( not ( = ?auto_59578 ?auto_59582 ) ) ( not ( = ?auto_59579 ?auto_59582 ) ) ( ON ?auto_59579 ?auto_59580 ) ( ON ?auto_59578 ?auto_59579 ) ( CLEAR ?auto_59578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59582 ?auto_59583 ?auto_59581 ?auto_59580 ?auto_59579 )
      ( MAKE-4PILE ?auto_59578 ?auto_59579 ?auto_59580 ?auto_59581 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_59588 - BLOCK
      ?auto_59589 - BLOCK
      ?auto_59590 - BLOCK
      ?auto_59591 - BLOCK
    )
    :vars
    (
      ?auto_59593 - BLOCK
      ?auto_59592 - BLOCK
      ?auto_59594 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59588 ?auto_59589 ) ) ( not ( = ?auto_59588 ?auto_59590 ) ) ( not ( = ?auto_59588 ?auto_59591 ) ) ( not ( = ?auto_59589 ?auto_59590 ) ) ( not ( = ?auto_59589 ?auto_59591 ) ) ( not ( = ?auto_59590 ?auto_59591 ) ) ( ON ?auto_59591 ?auto_59593 ) ( not ( = ?auto_59588 ?auto_59593 ) ) ( not ( = ?auto_59589 ?auto_59593 ) ) ( not ( = ?auto_59590 ?auto_59593 ) ) ( not ( = ?auto_59591 ?auto_59593 ) ) ( ON ?auto_59590 ?auto_59591 ) ( ON-TABLE ?auto_59592 ) ( ON ?auto_59593 ?auto_59592 ) ( not ( = ?auto_59592 ?auto_59593 ) ) ( not ( = ?auto_59592 ?auto_59591 ) ) ( not ( = ?auto_59592 ?auto_59590 ) ) ( not ( = ?auto_59588 ?auto_59592 ) ) ( not ( = ?auto_59589 ?auto_59592 ) ) ( ON ?auto_59589 ?auto_59590 ) ( CLEAR ?auto_59589 ) ( ON ?auto_59588 ?auto_59594 ) ( CLEAR ?auto_59588 ) ( HAND-EMPTY ) ( not ( = ?auto_59588 ?auto_59594 ) ) ( not ( = ?auto_59589 ?auto_59594 ) ) ( not ( = ?auto_59590 ?auto_59594 ) ) ( not ( = ?auto_59591 ?auto_59594 ) ) ( not ( = ?auto_59593 ?auto_59594 ) ) ( not ( = ?auto_59592 ?auto_59594 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_59588 ?auto_59594 )
      ( MAKE-4PILE ?auto_59588 ?auto_59589 ?auto_59590 ?auto_59591 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_59595 - BLOCK
      ?auto_59596 - BLOCK
      ?auto_59597 - BLOCK
      ?auto_59598 - BLOCK
    )
    :vars
    (
      ?auto_59599 - BLOCK
      ?auto_59601 - BLOCK
      ?auto_59600 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59595 ?auto_59596 ) ) ( not ( = ?auto_59595 ?auto_59597 ) ) ( not ( = ?auto_59595 ?auto_59598 ) ) ( not ( = ?auto_59596 ?auto_59597 ) ) ( not ( = ?auto_59596 ?auto_59598 ) ) ( not ( = ?auto_59597 ?auto_59598 ) ) ( ON ?auto_59598 ?auto_59599 ) ( not ( = ?auto_59595 ?auto_59599 ) ) ( not ( = ?auto_59596 ?auto_59599 ) ) ( not ( = ?auto_59597 ?auto_59599 ) ) ( not ( = ?auto_59598 ?auto_59599 ) ) ( ON ?auto_59597 ?auto_59598 ) ( ON-TABLE ?auto_59601 ) ( ON ?auto_59599 ?auto_59601 ) ( not ( = ?auto_59601 ?auto_59599 ) ) ( not ( = ?auto_59601 ?auto_59598 ) ) ( not ( = ?auto_59601 ?auto_59597 ) ) ( not ( = ?auto_59595 ?auto_59601 ) ) ( not ( = ?auto_59596 ?auto_59601 ) ) ( ON ?auto_59595 ?auto_59600 ) ( CLEAR ?auto_59595 ) ( not ( = ?auto_59595 ?auto_59600 ) ) ( not ( = ?auto_59596 ?auto_59600 ) ) ( not ( = ?auto_59597 ?auto_59600 ) ) ( not ( = ?auto_59598 ?auto_59600 ) ) ( not ( = ?auto_59599 ?auto_59600 ) ) ( not ( = ?auto_59601 ?auto_59600 ) ) ( HOLDING ?auto_59596 ) ( CLEAR ?auto_59597 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59601 ?auto_59599 ?auto_59598 ?auto_59597 ?auto_59596 )
      ( MAKE-4PILE ?auto_59595 ?auto_59596 ?auto_59597 ?auto_59598 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_59602 - BLOCK
      ?auto_59603 - BLOCK
      ?auto_59604 - BLOCK
      ?auto_59605 - BLOCK
    )
    :vars
    (
      ?auto_59606 - BLOCK
      ?auto_59607 - BLOCK
      ?auto_59608 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59602 ?auto_59603 ) ) ( not ( = ?auto_59602 ?auto_59604 ) ) ( not ( = ?auto_59602 ?auto_59605 ) ) ( not ( = ?auto_59603 ?auto_59604 ) ) ( not ( = ?auto_59603 ?auto_59605 ) ) ( not ( = ?auto_59604 ?auto_59605 ) ) ( ON ?auto_59605 ?auto_59606 ) ( not ( = ?auto_59602 ?auto_59606 ) ) ( not ( = ?auto_59603 ?auto_59606 ) ) ( not ( = ?auto_59604 ?auto_59606 ) ) ( not ( = ?auto_59605 ?auto_59606 ) ) ( ON ?auto_59604 ?auto_59605 ) ( ON-TABLE ?auto_59607 ) ( ON ?auto_59606 ?auto_59607 ) ( not ( = ?auto_59607 ?auto_59606 ) ) ( not ( = ?auto_59607 ?auto_59605 ) ) ( not ( = ?auto_59607 ?auto_59604 ) ) ( not ( = ?auto_59602 ?auto_59607 ) ) ( not ( = ?auto_59603 ?auto_59607 ) ) ( ON ?auto_59602 ?auto_59608 ) ( not ( = ?auto_59602 ?auto_59608 ) ) ( not ( = ?auto_59603 ?auto_59608 ) ) ( not ( = ?auto_59604 ?auto_59608 ) ) ( not ( = ?auto_59605 ?auto_59608 ) ) ( not ( = ?auto_59606 ?auto_59608 ) ) ( not ( = ?auto_59607 ?auto_59608 ) ) ( CLEAR ?auto_59604 ) ( ON ?auto_59603 ?auto_59602 ) ( CLEAR ?auto_59603 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_59608 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59608 ?auto_59602 )
      ( MAKE-4PILE ?auto_59602 ?auto_59603 ?auto_59604 ?auto_59605 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_59609 - BLOCK
      ?auto_59610 - BLOCK
      ?auto_59611 - BLOCK
      ?auto_59612 - BLOCK
    )
    :vars
    (
      ?auto_59614 - BLOCK
      ?auto_59615 - BLOCK
      ?auto_59613 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59609 ?auto_59610 ) ) ( not ( = ?auto_59609 ?auto_59611 ) ) ( not ( = ?auto_59609 ?auto_59612 ) ) ( not ( = ?auto_59610 ?auto_59611 ) ) ( not ( = ?auto_59610 ?auto_59612 ) ) ( not ( = ?auto_59611 ?auto_59612 ) ) ( ON ?auto_59612 ?auto_59614 ) ( not ( = ?auto_59609 ?auto_59614 ) ) ( not ( = ?auto_59610 ?auto_59614 ) ) ( not ( = ?auto_59611 ?auto_59614 ) ) ( not ( = ?auto_59612 ?auto_59614 ) ) ( ON-TABLE ?auto_59615 ) ( ON ?auto_59614 ?auto_59615 ) ( not ( = ?auto_59615 ?auto_59614 ) ) ( not ( = ?auto_59615 ?auto_59612 ) ) ( not ( = ?auto_59615 ?auto_59611 ) ) ( not ( = ?auto_59609 ?auto_59615 ) ) ( not ( = ?auto_59610 ?auto_59615 ) ) ( ON ?auto_59609 ?auto_59613 ) ( not ( = ?auto_59609 ?auto_59613 ) ) ( not ( = ?auto_59610 ?auto_59613 ) ) ( not ( = ?auto_59611 ?auto_59613 ) ) ( not ( = ?auto_59612 ?auto_59613 ) ) ( not ( = ?auto_59614 ?auto_59613 ) ) ( not ( = ?auto_59615 ?auto_59613 ) ) ( ON ?auto_59610 ?auto_59609 ) ( CLEAR ?auto_59610 ) ( ON-TABLE ?auto_59613 ) ( HOLDING ?auto_59611 ) ( CLEAR ?auto_59612 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59615 ?auto_59614 ?auto_59612 ?auto_59611 )
      ( MAKE-4PILE ?auto_59609 ?auto_59610 ?auto_59611 ?auto_59612 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_59616 - BLOCK
      ?auto_59617 - BLOCK
      ?auto_59618 - BLOCK
      ?auto_59619 - BLOCK
    )
    :vars
    (
      ?auto_59620 - BLOCK
      ?auto_59622 - BLOCK
      ?auto_59621 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59616 ?auto_59617 ) ) ( not ( = ?auto_59616 ?auto_59618 ) ) ( not ( = ?auto_59616 ?auto_59619 ) ) ( not ( = ?auto_59617 ?auto_59618 ) ) ( not ( = ?auto_59617 ?auto_59619 ) ) ( not ( = ?auto_59618 ?auto_59619 ) ) ( ON ?auto_59619 ?auto_59620 ) ( not ( = ?auto_59616 ?auto_59620 ) ) ( not ( = ?auto_59617 ?auto_59620 ) ) ( not ( = ?auto_59618 ?auto_59620 ) ) ( not ( = ?auto_59619 ?auto_59620 ) ) ( ON-TABLE ?auto_59622 ) ( ON ?auto_59620 ?auto_59622 ) ( not ( = ?auto_59622 ?auto_59620 ) ) ( not ( = ?auto_59622 ?auto_59619 ) ) ( not ( = ?auto_59622 ?auto_59618 ) ) ( not ( = ?auto_59616 ?auto_59622 ) ) ( not ( = ?auto_59617 ?auto_59622 ) ) ( ON ?auto_59616 ?auto_59621 ) ( not ( = ?auto_59616 ?auto_59621 ) ) ( not ( = ?auto_59617 ?auto_59621 ) ) ( not ( = ?auto_59618 ?auto_59621 ) ) ( not ( = ?auto_59619 ?auto_59621 ) ) ( not ( = ?auto_59620 ?auto_59621 ) ) ( not ( = ?auto_59622 ?auto_59621 ) ) ( ON ?auto_59617 ?auto_59616 ) ( ON-TABLE ?auto_59621 ) ( CLEAR ?auto_59619 ) ( ON ?auto_59618 ?auto_59617 ) ( CLEAR ?auto_59618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59621 ?auto_59616 ?auto_59617 )
      ( MAKE-4PILE ?auto_59616 ?auto_59617 ?auto_59618 ?auto_59619 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_59623 - BLOCK
      ?auto_59624 - BLOCK
      ?auto_59625 - BLOCK
      ?auto_59626 - BLOCK
    )
    :vars
    (
      ?auto_59627 - BLOCK
      ?auto_59629 - BLOCK
      ?auto_59628 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59623 ?auto_59624 ) ) ( not ( = ?auto_59623 ?auto_59625 ) ) ( not ( = ?auto_59623 ?auto_59626 ) ) ( not ( = ?auto_59624 ?auto_59625 ) ) ( not ( = ?auto_59624 ?auto_59626 ) ) ( not ( = ?auto_59625 ?auto_59626 ) ) ( not ( = ?auto_59623 ?auto_59627 ) ) ( not ( = ?auto_59624 ?auto_59627 ) ) ( not ( = ?auto_59625 ?auto_59627 ) ) ( not ( = ?auto_59626 ?auto_59627 ) ) ( ON-TABLE ?auto_59629 ) ( ON ?auto_59627 ?auto_59629 ) ( not ( = ?auto_59629 ?auto_59627 ) ) ( not ( = ?auto_59629 ?auto_59626 ) ) ( not ( = ?auto_59629 ?auto_59625 ) ) ( not ( = ?auto_59623 ?auto_59629 ) ) ( not ( = ?auto_59624 ?auto_59629 ) ) ( ON ?auto_59623 ?auto_59628 ) ( not ( = ?auto_59623 ?auto_59628 ) ) ( not ( = ?auto_59624 ?auto_59628 ) ) ( not ( = ?auto_59625 ?auto_59628 ) ) ( not ( = ?auto_59626 ?auto_59628 ) ) ( not ( = ?auto_59627 ?auto_59628 ) ) ( not ( = ?auto_59629 ?auto_59628 ) ) ( ON ?auto_59624 ?auto_59623 ) ( ON-TABLE ?auto_59628 ) ( ON ?auto_59625 ?auto_59624 ) ( CLEAR ?auto_59625 ) ( HOLDING ?auto_59626 ) ( CLEAR ?auto_59627 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59629 ?auto_59627 ?auto_59626 )
      ( MAKE-4PILE ?auto_59623 ?auto_59624 ?auto_59625 ?auto_59626 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_59630 - BLOCK
      ?auto_59631 - BLOCK
      ?auto_59632 - BLOCK
      ?auto_59633 - BLOCK
    )
    :vars
    (
      ?auto_59634 - BLOCK
      ?auto_59635 - BLOCK
      ?auto_59636 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59630 ?auto_59631 ) ) ( not ( = ?auto_59630 ?auto_59632 ) ) ( not ( = ?auto_59630 ?auto_59633 ) ) ( not ( = ?auto_59631 ?auto_59632 ) ) ( not ( = ?auto_59631 ?auto_59633 ) ) ( not ( = ?auto_59632 ?auto_59633 ) ) ( not ( = ?auto_59630 ?auto_59634 ) ) ( not ( = ?auto_59631 ?auto_59634 ) ) ( not ( = ?auto_59632 ?auto_59634 ) ) ( not ( = ?auto_59633 ?auto_59634 ) ) ( ON-TABLE ?auto_59635 ) ( ON ?auto_59634 ?auto_59635 ) ( not ( = ?auto_59635 ?auto_59634 ) ) ( not ( = ?auto_59635 ?auto_59633 ) ) ( not ( = ?auto_59635 ?auto_59632 ) ) ( not ( = ?auto_59630 ?auto_59635 ) ) ( not ( = ?auto_59631 ?auto_59635 ) ) ( ON ?auto_59630 ?auto_59636 ) ( not ( = ?auto_59630 ?auto_59636 ) ) ( not ( = ?auto_59631 ?auto_59636 ) ) ( not ( = ?auto_59632 ?auto_59636 ) ) ( not ( = ?auto_59633 ?auto_59636 ) ) ( not ( = ?auto_59634 ?auto_59636 ) ) ( not ( = ?auto_59635 ?auto_59636 ) ) ( ON ?auto_59631 ?auto_59630 ) ( ON-TABLE ?auto_59636 ) ( ON ?auto_59632 ?auto_59631 ) ( CLEAR ?auto_59634 ) ( ON ?auto_59633 ?auto_59632 ) ( CLEAR ?auto_59633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59636 ?auto_59630 ?auto_59631 ?auto_59632 )
      ( MAKE-4PILE ?auto_59630 ?auto_59631 ?auto_59632 ?auto_59633 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_59637 - BLOCK
      ?auto_59638 - BLOCK
      ?auto_59639 - BLOCK
      ?auto_59640 - BLOCK
    )
    :vars
    (
      ?auto_59641 - BLOCK
      ?auto_59643 - BLOCK
      ?auto_59642 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59637 ?auto_59638 ) ) ( not ( = ?auto_59637 ?auto_59639 ) ) ( not ( = ?auto_59637 ?auto_59640 ) ) ( not ( = ?auto_59638 ?auto_59639 ) ) ( not ( = ?auto_59638 ?auto_59640 ) ) ( not ( = ?auto_59639 ?auto_59640 ) ) ( not ( = ?auto_59637 ?auto_59641 ) ) ( not ( = ?auto_59638 ?auto_59641 ) ) ( not ( = ?auto_59639 ?auto_59641 ) ) ( not ( = ?auto_59640 ?auto_59641 ) ) ( ON-TABLE ?auto_59643 ) ( not ( = ?auto_59643 ?auto_59641 ) ) ( not ( = ?auto_59643 ?auto_59640 ) ) ( not ( = ?auto_59643 ?auto_59639 ) ) ( not ( = ?auto_59637 ?auto_59643 ) ) ( not ( = ?auto_59638 ?auto_59643 ) ) ( ON ?auto_59637 ?auto_59642 ) ( not ( = ?auto_59637 ?auto_59642 ) ) ( not ( = ?auto_59638 ?auto_59642 ) ) ( not ( = ?auto_59639 ?auto_59642 ) ) ( not ( = ?auto_59640 ?auto_59642 ) ) ( not ( = ?auto_59641 ?auto_59642 ) ) ( not ( = ?auto_59643 ?auto_59642 ) ) ( ON ?auto_59638 ?auto_59637 ) ( ON-TABLE ?auto_59642 ) ( ON ?auto_59639 ?auto_59638 ) ( ON ?auto_59640 ?auto_59639 ) ( CLEAR ?auto_59640 ) ( HOLDING ?auto_59641 ) ( CLEAR ?auto_59643 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59643 ?auto_59641 )
      ( MAKE-4PILE ?auto_59637 ?auto_59638 ?auto_59639 ?auto_59640 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_59644 - BLOCK
      ?auto_59645 - BLOCK
      ?auto_59646 - BLOCK
      ?auto_59647 - BLOCK
    )
    :vars
    (
      ?auto_59648 - BLOCK
      ?auto_59649 - BLOCK
      ?auto_59650 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59644 ?auto_59645 ) ) ( not ( = ?auto_59644 ?auto_59646 ) ) ( not ( = ?auto_59644 ?auto_59647 ) ) ( not ( = ?auto_59645 ?auto_59646 ) ) ( not ( = ?auto_59645 ?auto_59647 ) ) ( not ( = ?auto_59646 ?auto_59647 ) ) ( not ( = ?auto_59644 ?auto_59648 ) ) ( not ( = ?auto_59645 ?auto_59648 ) ) ( not ( = ?auto_59646 ?auto_59648 ) ) ( not ( = ?auto_59647 ?auto_59648 ) ) ( ON-TABLE ?auto_59649 ) ( not ( = ?auto_59649 ?auto_59648 ) ) ( not ( = ?auto_59649 ?auto_59647 ) ) ( not ( = ?auto_59649 ?auto_59646 ) ) ( not ( = ?auto_59644 ?auto_59649 ) ) ( not ( = ?auto_59645 ?auto_59649 ) ) ( ON ?auto_59644 ?auto_59650 ) ( not ( = ?auto_59644 ?auto_59650 ) ) ( not ( = ?auto_59645 ?auto_59650 ) ) ( not ( = ?auto_59646 ?auto_59650 ) ) ( not ( = ?auto_59647 ?auto_59650 ) ) ( not ( = ?auto_59648 ?auto_59650 ) ) ( not ( = ?auto_59649 ?auto_59650 ) ) ( ON ?auto_59645 ?auto_59644 ) ( ON-TABLE ?auto_59650 ) ( ON ?auto_59646 ?auto_59645 ) ( ON ?auto_59647 ?auto_59646 ) ( CLEAR ?auto_59649 ) ( ON ?auto_59648 ?auto_59647 ) ( CLEAR ?auto_59648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59650 ?auto_59644 ?auto_59645 ?auto_59646 ?auto_59647 )
      ( MAKE-4PILE ?auto_59644 ?auto_59645 ?auto_59646 ?auto_59647 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_59651 - BLOCK
      ?auto_59652 - BLOCK
      ?auto_59653 - BLOCK
      ?auto_59654 - BLOCK
    )
    :vars
    (
      ?auto_59656 - BLOCK
      ?auto_59655 - BLOCK
      ?auto_59657 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59651 ?auto_59652 ) ) ( not ( = ?auto_59651 ?auto_59653 ) ) ( not ( = ?auto_59651 ?auto_59654 ) ) ( not ( = ?auto_59652 ?auto_59653 ) ) ( not ( = ?auto_59652 ?auto_59654 ) ) ( not ( = ?auto_59653 ?auto_59654 ) ) ( not ( = ?auto_59651 ?auto_59656 ) ) ( not ( = ?auto_59652 ?auto_59656 ) ) ( not ( = ?auto_59653 ?auto_59656 ) ) ( not ( = ?auto_59654 ?auto_59656 ) ) ( not ( = ?auto_59655 ?auto_59656 ) ) ( not ( = ?auto_59655 ?auto_59654 ) ) ( not ( = ?auto_59655 ?auto_59653 ) ) ( not ( = ?auto_59651 ?auto_59655 ) ) ( not ( = ?auto_59652 ?auto_59655 ) ) ( ON ?auto_59651 ?auto_59657 ) ( not ( = ?auto_59651 ?auto_59657 ) ) ( not ( = ?auto_59652 ?auto_59657 ) ) ( not ( = ?auto_59653 ?auto_59657 ) ) ( not ( = ?auto_59654 ?auto_59657 ) ) ( not ( = ?auto_59656 ?auto_59657 ) ) ( not ( = ?auto_59655 ?auto_59657 ) ) ( ON ?auto_59652 ?auto_59651 ) ( ON-TABLE ?auto_59657 ) ( ON ?auto_59653 ?auto_59652 ) ( ON ?auto_59654 ?auto_59653 ) ( ON ?auto_59656 ?auto_59654 ) ( CLEAR ?auto_59656 ) ( HOLDING ?auto_59655 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_59655 )
      ( MAKE-4PILE ?auto_59651 ?auto_59652 ?auto_59653 ?auto_59654 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_59658 - BLOCK
      ?auto_59659 - BLOCK
      ?auto_59660 - BLOCK
      ?auto_59661 - BLOCK
    )
    :vars
    (
      ?auto_59662 - BLOCK
      ?auto_59663 - BLOCK
      ?auto_59664 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59658 ?auto_59659 ) ) ( not ( = ?auto_59658 ?auto_59660 ) ) ( not ( = ?auto_59658 ?auto_59661 ) ) ( not ( = ?auto_59659 ?auto_59660 ) ) ( not ( = ?auto_59659 ?auto_59661 ) ) ( not ( = ?auto_59660 ?auto_59661 ) ) ( not ( = ?auto_59658 ?auto_59662 ) ) ( not ( = ?auto_59659 ?auto_59662 ) ) ( not ( = ?auto_59660 ?auto_59662 ) ) ( not ( = ?auto_59661 ?auto_59662 ) ) ( not ( = ?auto_59663 ?auto_59662 ) ) ( not ( = ?auto_59663 ?auto_59661 ) ) ( not ( = ?auto_59663 ?auto_59660 ) ) ( not ( = ?auto_59658 ?auto_59663 ) ) ( not ( = ?auto_59659 ?auto_59663 ) ) ( ON ?auto_59658 ?auto_59664 ) ( not ( = ?auto_59658 ?auto_59664 ) ) ( not ( = ?auto_59659 ?auto_59664 ) ) ( not ( = ?auto_59660 ?auto_59664 ) ) ( not ( = ?auto_59661 ?auto_59664 ) ) ( not ( = ?auto_59662 ?auto_59664 ) ) ( not ( = ?auto_59663 ?auto_59664 ) ) ( ON ?auto_59659 ?auto_59658 ) ( ON-TABLE ?auto_59664 ) ( ON ?auto_59660 ?auto_59659 ) ( ON ?auto_59661 ?auto_59660 ) ( ON ?auto_59662 ?auto_59661 ) ( ON ?auto_59663 ?auto_59662 ) ( CLEAR ?auto_59663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_59664 ?auto_59658 ?auto_59659 ?auto_59660 ?auto_59661 ?auto_59662 )
      ( MAKE-4PILE ?auto_59658 ?auto_59659 ?auto_59660 ?auto_59661 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59676 - BLOCK
    )
    :vars
    (
      ?auto_59677 - BLOCK
      ?auto_59679 - BLOCK
      ?auto_59678 - BLOCK
      ?auto_59680 - BLOCK
      ?auto_59681 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59677 ?auto_59676 ) ( ON-TABLE ?auto_59676 ) ( not ( = ?auto_59676 ?auto_59677 ) ) ( not ( = ?auto_59676 ?auto_59679 ) ) ( not ( = ?auto_59676 ?auto_59678 ) ) ( not ( = ?auto_59677 ?auto_59679 ) ) ( not ( = ?auto_59677 ?auto_59678 ) ) ( not ( = ?auto_59679 ?auto_59678 ) ) ( ON ?auto_59679 ?auto_59677 ) ( CLEAR ?auto_59679 ) ( HOLDING ?auto_59678 ) ( CLEAR ?auto_59680 ) ( ON-TABLE ?auto_59681 ) ( ON ?auto_59680 ?auto_59681 ) ( not ( = ?auto_59681 ?auto_59680 ) ) ( not ( = ?auto_59681 ?auto_59678 ) ) ( not ( = ?auto_59680 ?auto_59678 ) ) ( not ( = ?auto_59676 ?auto_59680 ) ) ( not ( = ?auto_59676 ?auto_59681 ) ) ( not ( = ?auto_59677 ?auto_59680 ) ) ( not ( = ?auto_59677 ?auto_59681 ) ) ( not ( = ?auto_59679 ?auto_59680 ) ) ( not ( = ?auto_59679 ?auto_59681 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59681 ?auto_59680 ?auto_59678 )
      ( MAKE-1PILE ?auto_59676 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59682 - BLOCK
    )
    :vars
    (
      ?auto_59683 - BLOCK
      ?auto_59684 - BLOCK
      ?auto_59687 - BLOCK
      ?auto_59686 - BLOCK
      ?auto_59685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59683 ?auto_59682 ) ( ON-TABLE ?auto_59682 ) ( not ( = ?auto_59682 ?auto_59683 ) ) ( not ( = ?auto_59682 ?auto_59684 ) ) ( not ( = ?auto_59682 ?auto_59687 ) ) ( not ( = ?auto_59683 ?auto_59684 ) ) ( not ( = ?auto_59683 ?auto_59687 ) ) ( not ( = ?auto_59684 ?auto_59687 ) ) ( ON ?auto_59684 ?auto_59683 ) ( CLEAR ?auto_59686 ) ( ON-TABLE ?auto_59685 ) ( ON ?auto_59686 ?auto_59685 ) ( not ( = ?auto_59685 ?auto_59686 ) ) ( not ( = ?auto_59685 ?auto_59687 ) ) ( not ( = ?auto_59686 ?auto_59687 ) ) ( not ( = ?auto_59682 ?auto_59686 ) ) ( not ( = ?auto_59682 ?auto_59685 ) ) ( not ( = ?auto_59683 ?auto_59686 ) ) ( not ( = ?auto_59683 ?auto_59685 ) ) ( not ( = ?auto_59684 ?auto_59686 ) ) ( not ( = ?auto_59684 ?auto_59685 ) ) ( ON ?auto_59687 ?auto_59684 ) ( CLEAR ?auto_59687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59682 ?auto_59683 ?auto_59684 )
      ( MAKE-1PILE ?auto_59682 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59688 - BLOCK
    )
    :vars
    (
      ?auto_59693 - BLOCK
      ?auto_59691 - BLOCK
      ?auto_59692 - BLOCK
      ?auto_59689 - BLOCK
      ?auto_59690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59693 ?auto_59688 ) ( ON-TABLE ?auto_59688 ) ( not ( = ?auto_59688 ?auto_59693 ) ) ( not ( = ?auto_59688 ?auto_59691 ) ) ( not ( = ?auto_59688 ?auto_59692 ) ) ( not ( = ?auto_59693 ?auto_59691 ) ) ( not ( = ?auto_59693 ?auto_59692 ) ) ( not ( = ?auto_59691 ?auto_59692 ) ) ( ON ?auto_59691 ?auto_59693 ) ( ON-TABLE ?auto_59689 ) ( not ( = ?auto_59689 ?auto_59690 ) ) ( not ( = ?auto_59689 ?auto_59692 ) ) ( not ( = ?auto_59690 ?auto_59692 ) ) ( not ( = ?auto_59688 ?auto_59690 ) ) ( not ( = ?auto_59688 ?auto_59689 ) ) ( not ( = ?auto_59693 ?auto_59690 ) ) ( not ( = ?auto_59693 ?auto_59689 ) ) ( not ( = ?auto_59691 ?auto_59690 ) ) ( not ( = ?auto_59691 ?auto_59689 ) ) ( ON ?auto_59692 ?auto_59691 ) ( CLEAR ?auto_59692 ) ( HOLDING ?auto_59690 ) ( CLEAR ?auto_59689 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59689 ?auto_59690 )
      ( MAKE-1PILE ?auto_59688 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59694 - BLOCK
    )
    :vars
    (
      ?auto_59697 - BLOCK
      ?auto_59699 - BLOCK
      ?auto_59695 - BLOCK
      ?auto_59698 - BLOCK
      ?auto_59696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59697 ?auto_59694 ) ( ON-TABLE ?auto_59694 ) ( not ( = ?auto_59694 ?auto_59697 ) ) ( not ( = ?auto_59694 ?auto_59699 ) ) ( not ( = ?auto_59694 ?auto_59695 ) ) ( not ( = ?auto_59697 ?auto_59699 ) ) ( not ( = ?auto_59697 ?auto_59695 ) ) ( not ( = ?auto_59699 ?auto_59695 ) ) ( ON ?auto_59699 ?auto_59697 ) ( ON-TABLE ?auto_59698 ) ( not ( = ?auto_59698 ?auto_59696 ) ) ( not ( = ?auto_59698 ?auto_59695 ) ) ( not ( = ?auto_59696 ?auto_59695 ) ) ( not ( = ?auto_59694 ?auto_59696 ) ) ( not ( = ?auto_59694 ?auto_59698 ) ) ( not ( = ?auto_59697 ?auto_59696 ) ) ( not ( = ?auto_59697 ?auto_59698 ) ) ( not ( = ?auto_59699 ?auto_59696 ) ) ( not ( = ?auto_59699 ?auto_59698 ) ) ( ON ?auto_59695 ?auto_59699 ) ( CLEAR ?auto_59698 ) ( ON ?auto_59696 ?auto_59695 ) ( CLEAR ?auto_59696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59694 ?auto_59697 ?auto_59699 ?auto_59695 )
      ( MAKE-1PILE ?auto_59694 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59700 - BLOCK
    )
    :vars
    (
      ?auto_59704 - BLOCK
      ?auto_59702 - BLOCK
      ?auto_59703 - BLOCK
      ?auto_59705 - BLOCK
      ?auto_59701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59704 ?auto_59700 ) ( ON-TABLE ?auto_59700 ) ( not ( = ?auto_59700 ?auto_59704 ) ) ( not ( = ?auto_59700 ?auto_59702 ) ) ( not ( = ?auto_59700 ?auto_59703 ) ) ( not ( = ?auto_59704 ?auto_59702 ) ) ( not ( = ?auto_59704 ?auto_59703 ) ) ( not ( = ?auto_59702 ?auto_59703 ) ) ( ON ?auto_59702 ?auto_59704 ) ( not ( = ?auto_59705 ?auto_59701 ) ) ( not ( = ?auto_59705 ?auto_59703 ) ) ( not ( = ?auto_59701 ?auto_59703 ) ) ( not ( = ?auto_59700 ?auto_59701 ) ) ( not ( = ?auto_59700 ?auto_59705 ) ) ( not ( = ?auto_59704 ?auto_59701 ) ) ( not ( = ?auto_59704 ?auto_59705 ) ) ( not ( = ?auto_59702 ?auto_59701 ) ) ( not ( = ?auto_59702 ?auto_59705 ) ) ( ON ?auto_59703 ?auto_59702 ) ( ON ?auto_59701 ?auto_59703 ) ( CLEAR ?auto_59701 ) ( HOLDING ?auto_59705 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_59705 )
      ( MAKE-1PILE ?auto_59700 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59713 - BLOCK
    )
    :vars
    (
      ?auto_59718 - BLOCK
      ?auto_59717 - BLOCK
      ?auto_59714 - BLOCK
      ?auto_59716 - BLOCK
      ?auto_59715 - BLOCK
      ?auto_59719 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59718 ?auto_59713 ) ( ON-TABLE ?auto_59713 ) ( not ( = ?auto_59713 ?auto_59718 ) ) ( not ( = ?auto_59713 ?auto_59717 ) ) ( not ( = ?auto_59713 ?auto_59714 ) ) ( not ( = ?auto_59718 ?auto_59717 ) ) ( not ( = ?auto_59718 ?auto_59714 ) ) ( not ( = ?auto_59717 ?auto_59714 ) ) ( ON ?auto_59717 ?auto_59718 ) ( not ( = ?auto_59716 ?auto_59715 ) ) ( not ( = ?auto_59716 ?auto_59714 ) ) ( not ( = ?auto_59715 ?auto_59714 ) ) ( not ( = ?auto_59713 ?auto_59715 ) ) ( not ( = ?auto_59713 ?auto_59716 ) ) ( not ( = ?auto_59718 ?auto_59715 ) ) ( not ( = ?auto_59718 ?auto_59716 ) ) ( not ( = ?auto_59717 ?auto_59715 ) ) ( not ( = ?auto_59717 ?auto_59716 ) ) ( ON ?auto_59714 ?auto_59717 ) ( ON ?auto_59715 ?auto_59714 ) ( CLEAR ?auto_59715 ) ( ON ?auto_59716 ?auto_59719 ) ( CLEAR ?auto_59716 ) ( HAND-EMPTY ) ( not ( = ?auto_59713 ?auto_59719 ) ) ( not ( = ?auto_59718 ?auto_59719 ) ) ( not ( = ?auto_59717 ?auto_59719 ) ) ( not ( = ?auto_59714 ?auto_59719 ) ) ( not ( = ?auto_59716 ?auto_59719 ) ) ( not ( = ?auto_59715 ?auto_59719 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_59716 ?auto_59719 )
      ( MAKE-1PILE ?auto_59713 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59720 - BLOCK
    )
    :vars
    (
      ?auto_59724 - BLOCK
      ?auto_59725 - BLOCK
      ?auto_59723 - BLOCK
      ?auto_59722 - BLOCK
      ?auto_59726 - BLOCK
      ?auto_59721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59724 ?auto_59720 ) ( ON-TABLE ?auto_59720 ) ( not ( = ?auto_59720 ?auto_59724 ) ) ( not ( = ?auto_59720 ?auto_59725 ) ) ( not ( = ?auto_59720 ?auto_59723 ) ) ( not ( = ?auto_59724 ?auto_59725 ) ) ( not ( = ?auto_59724 ?auto_59723 ) ) ( not ( = ?auto_59725 ?auto_59723 ) ) ( ON ?auto_59725 ?auto_59724 ) ( not ( = ?auto_59722 ?auto_59726 ) ) ( not ( = ?auto_59722 ?auto_59723 ) ) ( not ( = ?auto_59726 ?auto_59723 ) ) ( not ( = ?auto_59720 ?auto_59726 ) ) ( not ( = ?auto_59720 ?auto_59722 ) ) ( not ( = ?auto_59724 ?auto_59726 ) ) ( not ( = ?auto_59724 ?auto_59722 ) ) ( not ( = ?auto_59725 ?auto_59726 ) ) ( not ( = ?auto_59725 ?auto_59722 ) ) ( ON ?auto_59723 ?auto_59725 ) ( ON ?auto_59722 ?auto_59721 ) ( CLEAR ?auto_59722 ) ( not ( = ?auto_59720 ?auto_59721 ) ) ( not ( = ?auto_59724 ?auto_59721 ) ) ( not ( = ?auto_59725 ?auto_59721 ) ) ( not ( = ?auto_59723 ?auto_59721 ) ) ( not ( = ?auto_59722 ?auto_59721 ) ) ( not ( = ?auto_59726 ?auto_59721 ) ) ( HOLDING ?auto_59726 ) ( CLEAR ?auto_59723 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59720 ?auto_59724 ?auto_59725 ?auto_59723 ?auto_59726 )
      ( MAKE-1PILE ?auto_59720 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59727 - BLOCK
    )
    :vars
    (
      ?auto_59729 - BLOCK
      ?auto_59733 - BLOCK
      ?auto_59728 - BLOCK
      ?auto_59730 - BLOCK
      ?auto_59731 - BLOCK
      ?auto_59732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59729 ?auto_59727 ) ( ON-TABLE ?auto_59727 ) ( not ( = ?auto_59727 ?auto_59729 ) ) ( not ( = ?auto_59727 ?auto_59733 ) ) ( not ( = ?auto_59727 ?auto_59728 ) ) ( not ( = ?auto_59729 ?auto_59733 ) ) ( not ( = ?auto_59729 ?auto_59728 ) ) ( not ( = ?auto_59733 ?auto_59728 ) ) ( ON ?auto_59733 ?auto_59729 ) ( not ( = ?auto_59730 ?auto_59731 ) ) ( not ( = ?auto_59730 ?auto_59728 ) ) ( not ( = ?auto_59731 ?auto_59728 ) ) ( not ( = ?auto_59727 ?auto_59731 ) ) ( not ( = ?auto_59727 ?auto_59730 ) ) ( not ( = ?auto_59729 ?auto_59731 ) ) ( not ( = ?auto_59729 ?auto_59730 ) ) ( not ( = ?auto_59733 ?auto_59731 ) ) ( not ( = ?auto_59733 ?auto_59730 ) ) ( ON ?auto_59728 ?auto_59733 ) ( ON ?auto_59730 ?auto_59732 ) ( not ( = ?auto_59727 ?auto_59732 ) ) ( not ( = ?auto_59729 ?auto_59732 ) ) ( not ( = ?auto_59733 ?auto_59732 ) ) ( not ( = ?auto_59728 ?auto_59732 ) ) ( not ( = ?auto_59730 ?auto_59732 ) ) ( not ( = ?auto_59731 ?auto_59732 ) ) ( CLEAR ?auto_59728 ) ( ON ?auto_59731 ?auto_59730 ) ( CLEAR ?auto_59731 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_59732 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59732 ?auto_59730 )
      ( MAKE-1PILE ?auto_59727 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59767 - BLOCK
      ?auto_59768 - BLOCK
      ?auto_59769 - BLOCK
      ?auto_59770 - BLOCK
      ?auto_59771 - BLOCK
    )
    :vars
    (
      ?auto_59772 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59767 ) ( ON ?auto_59768 ?auto_59767 ) ( ON ?auto_59769 ?auto_59768 ) ( not ( = ?auto_59767 ?auto_59768 ) ) ( not ( = ?auto_59767 ?auto_59769 ) ) ( not ( = ?auto_59767 ?auto_59770 ) ) ( not ( = ?auto_59767 ?auto_59771 ) ) ( not ( = ?auto_59768 ?auto_59769 ) ) ( not ( = ?auto_59768 ?auto_59770 ) ) ( not ( = ?auto_59768 ?auto_59771 ) ) ( not ( = ?auto_59769 ?auto_59770 ) ) ( not ( = ?auto_59769 ?auto_59771 ) ) ( not ( = ?auto_59770 ?auto_59771 ) ) ( ON ?auto_59771 ?auto_59772 ) ( not ( = ?auto_59767 ?auto_59772 ) ) ( not ( = ?auto_59768 ?auto_59772 ) ) ( not ( = ?auto_59769 ?auto_59772 ) ) ( not ( = ?auto_59770 ?auto_59772 ) ) ( not ( = ?auto_59771 ?auto_59772 ) ) ( CLEAR ?auto_59769 ) ( ON ?auto_59770 ?auto_59771 ) ( CLEAR ?auto_59770 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_59772 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59772 ?auto_59771 )
      ( MAKE-5PILE ?auto_59767 ?auto_59768 ?auto_59769 ?auto_59770 ?auto_59771 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59773 - BLOCK
      ?auto_59774 - BLOCK
      ?auto_59775 - BLOCK
      ?auto_59776 - BLOCK
      ?auto_59777 - BLOCK
    )
    :vars
    (
      ?auto_59778 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59773 ) ( ON ?auto_59774 ?auto_59773 ) ( not ( = ?auto_59773 ?auto_59774 ) ) ( not ( = ?auto_59773 ?auto_59775 ) ) ( not ( = ?auto_59773 ?auto_59776 ) ) ( not ( = ?auto_59773 ?auto_59777 ) ) ( not ( = ?auto_59774 ?auto_59775 ) ) ( not ( = ?auto_59774 ?auto_59776 ) ) ( not ( = ?auto_59774 ?auto_59777 ) ) ( not ( = ?auto_59775 ?auto_59776 ) ) ( not ( = ?auto_59775 ?auto_59777 ) ) ( not ( = ?auto_59776 ?auto_59777 ) ) ( ON ?auto_59777 ?auto_59778 ) ( not ( = ?auto_59773 ?auto_59778 ) ) ( not ( = ?auto_59774 ?auto_59778 ) ) ( not ( = ?auto_59775 ?auto_59778 ) ) ( not ( = ?auto_59776 ?auto_59778 ) ) ( not ( = ?auto_59777 ?auto_59778 ) ) ( ON ?auto_59776 ?auto_59777 ) ( CLEAR ?auto_59776 ) ( ON-TABLE ?auto_59778 ) ( HOLDING ?auto_59775 ) ( CLEAR ?auto_59774 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59773 ?auto_59774 ?auto_59775 )
      ( MAKE-5PILE ?auto_59773 ?auto_59774 ?auto_59775 ?auto_59776 ?auto_59777 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59779 - BLOCK
      ?auto_59780 - BLOCK
      ?auto_59781 - BLOCK
      ?auto_59782 - BLOCK
      ?auto_59783 - BLOCK
    )
    :vars
    (
      ?auto_59784 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59779 ) ( ON ?auto_59780 ?auto_59779 ) ( not ( = ?auto_59779 ?auto_59780 ) ) ( not ( = ?auto_59779 ?auto_59781 ) ) ( not ( = ?auto_59779 ?auto_59782 ) ) ( not ( = ?auto_59779 ?auto_59783 ) ) ( not ( = ?auto_59780 ?auto_59781 ) ) ( not ( = ?auto_59780 ?auto_59782 ) ) ( not ( = ?auto_59780 ?auto_59783 ) ) ( not ( = ?auto_59781 ?auto_59782 ) ) ( not ( = ?auto_59781 ?auto_59783 ) ) ( not ( = ?auto_59782 ?auto_59783 ) ) ( ON ?auto_59783 ?auto_59784 ) ( not ( = ?auto_59779 ?auto_59784 ) ) ( not ( = ?auto_59780 ?auto_59784 ) ) ( not ( = ?auto_59781 ?auto_59784 ) ) ( not ( = ?auto_59782 ?auto_59784 ) ) ( not ( = ?auto_59783 ?auto_59784 ) ) ( ON ?auto_59782 ?auto_59783 ) ( ON-TABLE ?auto_59784 ) ( CLEAR ?auto_59780 ) ( ON ?auto_59781 ?auto_59782 ) ( CLEAR ?auto_59781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59784 ?auto_59783 ?auto_59782 )
      ( MAKE-5PILE ?auto_59779 ?auto_59780 ?auto_59781 ?auto_59782 ?auto_59783 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59785 - BLOCK
      ?auto_59786 - BLOCK
      ?auto_59787 - BLOCK
      ?auto_59788 - BLOCK
      ?auto_59789 - BLOCK
    )
    :vars
    (
      ?auto_59790 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59785 ) ( not ( = ?auto_59785 ?auto_59786 ) ) ( not ( = ?auto_59785 ?auto_59787 ) ) ( not ( = ?auto_59785 ?auto_59788 ) ) ( not ( = ?auto_59785 ?auto_59789 ) ) ( not ( = ?auto_59786 ?auto_59787 ) ) ( not ( = ?auto_59786 ?auto_59788 ) ) ( not ( = ?auto_59786 ?auto_59789 ) ) ( not ( = ?auto_59787 ?auto_59788 ) ) ( not ( = ?auto_59787 ?auto_59789 ) ) ( not ( = ?auto_59788 ?auto_59789 ) ) ( ON ?auto_59789 ?auto_59790 ) ( not ( = ?auto_59785 ?auto_59790 ) ) ( not ( = ?auto_59786 ?auto_59790 ) ) ( not ( = ?auto_59787 ?auto_59790 ) ) ( not ( = ?auto_59788 ?auto_59790 ) ) ( not ( = ?auto_59789 ?auto_59790 ) ) ( ON ?auto_59788 ?auto_59789 ) ( ON-TABLE ?auto_59790 ) ( ON ?auto_59787 ?auto_59788 ) ( CLEAR ?auto_59787 ) ( HOLDING ?auto_59786 ) ( CLEAR ?auto_59785 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59785 ?auto_59786 )
      ( MAKE-5PILE ?auto_59785 ?auto_59786 ?auto_59787 ?auto_59788 ?auto_59789 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59791 - BLOCK
      ?auto_59792 - BLOCK
      ?auto_59793 - BLOCK
      ?auto_59794 - BLOCK
      ?auto_59795 - BLOCK
    )
    :vars
    (
      ?auto_59796 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59791 ) ( not ( = ?auto_59791 ?auto_59792 ) ) ( not ( = ?auto_59791 ?auto_59793 ) ) ( not ( = ?auto_59791 ?auto_59794 ) ) ( not ( = ?auto_59791 ?auto_59795 ) ) ( not ( = ?auto_59792 ?auto_59793 ) ) ( not ( = ?auto_59792 ?auto_59794 ) ) ( not ( = ?auto_59792 ?auto_59795 ) ) ( not ( = ?auto_59793 ?auto_59794 ) ) ( not ( = ?auto_59793 ?auto_59795 ) ) ( not ( = ?auto_59794 ?auto_59795 ) ) ( ON ?auto_59795 ?auto_59796 ) ( not ( = ?auto_59791 ?auto_59796 ) ) ( not ( = ?auto_59792 ?auto_59796 ) ) ( not ( = ?auto_59793 ?auto_59796 ) ) ( not ( = ?auto_59794 ?auto_59796 ) ) ( not ( = ?auto_59795 ?auto_59796 ) ) ( ON ?auto_59794 ?auto_59795 ) ( ON-TABLE ?auto_59796 ) ( ON ?auto_59793 ?auto_59794 ) ( CLEAR ?auto_59791 ) ( ON ?auto_59792 ?auto_59793 ) ( CLEAR ?auto_59792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59796 ?auto_59795 ?auto_59794 ?auto_59793 )
      ( MAKE-5PILE ?auto_59791 ?auto_59792 ?auto_59793 ?auto_59794 ?auto_59795 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59797 - BLOCK
      ?auto_59798 - BLOCK
      ?auto_59799 - BLOCK
      ?auto_59800 - BLOCK
      ?auto_59801 - BLOCK
    )
    :vars
    (
      ?auto_59802 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59797 ?auto_59798 ) ) ( not ( = ?auto_59797 ?auto_59799 ) ) ( not ( = ?auto_59797 ?auto_59800 ) ) ( not ( = ?auto_59797 ?auto_59801 ) ) ( not ( = ?auto_59798 ?auto_59799 ) ) ( not ( = ?auto_59798 ?auto_59800 ) ) ( not ( = ?auto_59798 ?auto_59801 ) ) ( not ( = ?auto_59799 ?auto_59800 ) ) ( not ( = ?auto_59799 ?auto_59801 ) ) ( not ( = ?auto_59800 ?auto_59801 ) ) ( ON ?auto_59801 ?auto_59802 ) ( not ( = ?auto_59797 ?auto_59802 ) ) ( not ( = ?auto_59798 ?auto_59802 ) ) ( not ( = ?auto_59799 ?auto_59802 ) ) ( not ( = ?auto_59800 ?auto_59802 ) ) ( not ( = ?auto_59801 ?auto_59802 ) ) ( ON ?auto_59800 ?auto_59801 ) ( ON-TABLE ?auto_59802 ) ( ON ?auto_59799 ?auto_59800 ) ( ON ?auto_59798 ?auto_59799 ) ( CLEAR ?auto_59798 ) ( HOLDING ?auto_59797 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_59797 )
      ( MAKE-5PILE ?auto_59797 ?auto_59798 ?auto_59799 ?auto_59800 ?auto_59801 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59803 - BLOCK
      ?auto_59804 - BLOCK
      ?auto_59805 - BLOCK
      ?auto_59806 - BLOCK
      ?auto_59807 - BLOCK
    )
    :vars
    (
      ?auto_59808 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59803 ?auto_59804 ) ) ( not ( = ?auto_59803 ?auto_59805 ) ) ( not ( = ?auto_59803 ?auto_59806 ) ) ( not ( = ?auto_59803 ?auto_59807 ) ) ( not ( = ?auto_59804 ?auto_59805 ) ) ( not ( = ?auto_59804 ?auto_59806 ) ) ( not ( = ?auto_59804 ?auto_59807 ) ) ( not ( = ?auto_59805 ?auto_59806 ) ) ( not ( = ?auto_59805 ?auto_59807 ) ) ( not ( = ?auto_59806 ?auto_59807 ) ) ( ON ?auto_59807 ?auto_59808 ) ( not ( = ?auto_59803 ?auto_59808 ) ) ( not ( = ?auto_59804 ?auto_59808 ) ) ( not ( = ?auto_59805 ?auto_59808 ) ) ( not ( = ?auto_59806 ?auto_59808 ) ) ( not ( = ?auto_59807 ?auto_59808 ) ) ( ON ?auto_59806 ?auto_59807 ) ( ON-TABLE ?auto_59808 ) ( ON ?auto_59805 ?auto_59806 ) ( ON ?auto_59804 ?auto_59805 ) ( ON ?auto_59803 ?auto_59804 ) ( CLEAR ?auto_59803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59808 ?auto_59807 ?auto_59806 ?auto_59805 ?auto_59804 )
      ( MAKE-5PILE ?auto_59803 ?auto_59804 ?auto_59805 ?auto_59806 ?auto_59807 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59814 - BLOCK
      ?auto_59815 - BLOCK
      ?auto_59816 - BLOCK
      ?auto_59817 - BLOCK
      ?auto_59818 - BLOCK
    )
    :vars
    (
      ?auto_59819 - BLOCK
      ?auto_59820 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59814 ?auto_59815 ) ) ( not ( = ?auto_59814 ?auto_59816 ) ) ( not ( = ?auto_59814 ?auto_59817 ) ) ( not ( = ?auto_59814 ?auto_59818 ) ) ( not ( = ?auto_59815 ?auto_59816 ) ) ( not ( = ?auto_59815 ?auto_59817 ) ) ( not ( = ?auto_59815 ?auto_59818 ) ) ( not ( = ?auto_59816 ?auto_59817 ) ) ( not ( = ?auto_59816 ?auto_59818 ) ) ( not ( = ?auto_59817 ?auto_59818 ) ) ( ON ?auto_59818 ?auto_59819 ) ( not ( = ?auto_59814 ?auto_59819 ) ) ( not ( = ?auto_59815 ?auto_59819 ) ) ( not ( = ?auto_59816 ?auto_59819 ) ) ( not ( = ?auto_59817 ?auto_59819 ) ) ( not ( = ?auto_59818 ?auto_59819 ) ) ( ON ?auto_59817 ?auto_59818 ) ( ON-TABLE ?auto_59819 ) ( ON ?auto_59816 ?auto_59817 ) ( ON ?auto_59815 ?auto_59816 ) ( CLEAR ?auto_59815 ) ( ON ?auto_59814 ?auto_59820 ) ( CLEAR ?auto_59814 ) ( HAND-EMPTY ) ( not ( = ?auto_59814 ?auto_59820 ) ) ( not ( = ?auto_59815 ?auto_59820 ) ) ( not ( = ?auto_59816 ?auto_59820 ) ) ( not ( = ?auto_59817 ?auto_59820 ) ) ( not ( = ?auto_59818 ?auto_59820 ) ) ( not ( = ?auto_59819 ?auto_59820 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_59814 ?auto_59820 )
      ( MAKE-5PILE ?auto_59814 ?auto_59815 ?auto_59816 ?auto_59817 ?auto_59818 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59821 - BLOCK
      ?auto_59822 - BLOCK
      ?auto_59823 - BLOCK
      ?auto_59824 - BLOCK
      ?auto_59825 - BLOCK
    )
    :vars
    (
      ?auto_59827 - BLOCK
      ?auto_59826 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59821 ?auto_59822 ) ) ( not ( = ?auto_59821 ?auto_59823 ) ) ( not ( = ?auto_59821 ?auto_59824 ) ) ( not ( = ?auto_59821 ?auto_59825 ) ) ( not ( = ?auto_59822 ?auto_59823 ) ) ( not ( = ?auto_59822 ?auto_59824 ) ) ( not ( = ?auto_59822 ?auto_59825 ) ) ( not ( = ?auto_59823 ?auto_59824 ) ) ( not ( = ?auto_59823 ?auto_59825 ) ) ( not ( = ?auto_59824 ?auto_59825 ) ) ( ON ?auto_59825 ?auto_59827 ) ( not ( = ?auto_59821 ?auto_59827 ) ) ( not ( = ?auto_59822 ?auto_59827 ) ) ( not ( = ?auto_59823 ?auto_59827 ) ) ( not ( = ?auto_59824 ?auto_59827 ) ) ( not ( = ?auto_59825 ?auto_59827 ) ) ( ON ?auto_59824 ?auto_59825 ) ( ON-TABLE ?auto_59827 ) ( ON ?auto_59823 ?auto_59824 ) ( ON ?auto_59821 ?auto_59826 ) ( CLEAR ?auto_59821 ) ( not ( = ?auto_59821 ?auto_59826 ) ) ( not ( = ?auto_59822 ?auto_59826 ) ) ( not ( = ?auto_59823 ?auto_59826 ) ) ( not ( = ?auto_59824 ?auto_59826 ) ) ( not ( = ?auto_59825 ?auto_59826 ) ) ( not ( = ?auto_59827 ?auto_59826 ) ) ( HOLDING ?auto_59822 ) ( CLEAR ?auto_59823 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59827 ?auto_59825 ?auto_59824 ?auto_59823 ?auto_59822 )
      ( MAKE-5PILE ?auto_59821 ?auto_59822 ?auto_59823 ?auto_59824 ?auto_59825 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59828 - BLOCK
      ?auto_59829 - BLOCK
      ?auto_59830 - BLOCK
      ?auto_59831 - BLOCK
      ?auto_59832 - BLOCK
    )
    :vars
    (
      ?auto_59833 - BLOCK
      ?auto_59834 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59828 ?auto_59829 ) ) ( not ( = ?auto_59828 ?auto_59830 ) ) ( not ( = ?auto_59828 ?auto_59831 ) ) ( not ( = ?auto_59828 ?auto_59832 ) ) ( not ( = ?auto_59829 ?auto_59830 ) ) ( not ( = ?auto_59829 ?auto_59831 ) ) ( not ( = ?auto_59829 ?auto_59832 ) ) ( not ( = ?auto_59830 ?auto_59831 ) ) ( not ( = ?auto_59830 ?auto_59832 ) ) ( not ( = ?auto_59831 ?auto_59832 ) ) ( ON ?auto_59832 ?auto_59833 ) ( not ( = ?auto_59828 ?auto_59833 ) ) ( not ( = ?auto_59829 ?auto_59833 ) ) ( not ( = ?auto_59830 ?auto_59833 ) ) ( not ( = ?auto_59831 ?auto_59833 ) ) ( not ( = ?auto_59832 ?auto_59833 ) ) ( ON ?auto_59831 ?auto_59832 ) ( ON-TABLE ?auto_59833 ) ( ON ?auto_59830 ?auto_59831 ) ( ON ?auto_59828 ?auto_59834 ) ( not ( = ?auto_59828 ?auto_59834 ) ) ( not ( = ?auto_59829 ?auto_59834 ) ) ( not ( = ?auto_59830 ?auto_59834 ) ) ( not ( = ?auto_59831 ?auto_59834 ) ) ( not ( = ?auto_59832 ?auto_59834 ) ) ( not ( = ?auto_59833 ?auto_59834 ) ) ( CLEAR ?auto_59830 ) ( ON ?auto_59829 ?auto_59828 ) ( CLEAR ?auto_59829 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_59834 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59834 ?auto_59828 )
      ( MAKE-5PILE ?auto_59828 ?auto_59829 ?auto_59830 ?auto_59831 ?auto_59832 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59835 - BLOCK
      ?auto_59836 - BLOCK
      ?auto_59837 - BLOCK
      ?auto_59838 - BLOCK
      ?auto_59839 - BLOCK
    )
    :vars
    (
      ?auto_59841 - BLOCK
      ?auto_59840 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59835 ?auto_59836 ) ) ( not ( = ?auto_59835 ?auto_59837 ) ) ( not ( = ?auto_59835 ?auto_59838 ) ) ( not ( = ?auto_59835 ?auto_59839 ) ) ( not ( = ?auto_59836 ?auto_59837 ) ) ( not ( = ?auto_59836 ?auto_59838 ) ) ( not ( = ?auto_59836 ?auto_59839 ) ) ( not ( = ?auto_59837 ?auto_59838 ) ) ( not ( = ?auto_59837 ?auto_59839 ) ) ( not ( = ?auto_59838 ?auto_59839 ) ) ( ON ?auto_59839 ?auto_59841 ) ( not ( = ?auto_59835 ?auto_59841 ) ) ( not ( = ?auto_59836 ?auto_59841 ) ) ( not ( = ?auto_59837 ?auto_59841 ) ) ( not ( = ?auto_59838 ?auto_59841 ) ) ( not ( = ?auto_59839 ?auto_59841 ) ) ( ON ?auto_59838 ?auto_59839 ) ( ON-TABLE ?auto_59841 ) ( ON ?auto_59835 ?auto_59840 ) ( not ( = ?auto_59835 ?auto_59840 ) ) ( not ( = ?auto_59836 ?auto_59840 ) ) ( not ( = ?auto_59837 ?auto_59840 ) ) ( not ( = ?auto_59838 ?auto_59840 ) ) ( not ( = ?auto_59839 ?auto_59840 ) ) ( not ( = ?auto_59841 ?auto_59840 ) ) ( ON ?auto_59836 ?auto_59835 ) ( CLEAR ?auto_59836 ) ( ON-TABLE ?auto_59840 ) ( HOLDING ?auto_59837 ) ( CLEAR ?auto_59838 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59841 ?auto_59839 ?auto_59838 ?auto_59837 )
      ( MAKE-5PILE ?auto_59835 ?auto_59836 ?auto_59837 ?auto_59838 ?auto_59839 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59842 - BLOCK
      ?auto_59843 - BLOCK
      ?auto_59844 - BLOCK
      ?auto_59845 - BLOCK
      ?auto_59846 - BLOCK
    )
    :vars
    (
      ?auto_59847 - BLOCK
      ?auto_59848 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59842 ?auto_59843 ) ) ( not ( = ?auto_59842 ?auto_59844 ) ) ( not ( = ?auto_59842 ?auto_59845 ) ) ( not ( = ?auto_59842 ?auto_59846 ) ) ( not ( = ?auto_59843 ?auto_59844 ) ) ( not ( = ?auto_59843 ?auto_59845 ) ) ( not ( = ?auto_59843 ?auto_59846 ) ) ( not ( = ?auto_59844 ?auto_59845 ) ) ( not ( = ?auto_59844 ?auto_59846 ) ) ( not ( = ?auto_59845 ?auto_59846 ) ) ( ON ?auto_59846 ?auto_59847 ) ( not ( = ?auto_59842 ?auto_59847 ) ) ( not ( = ?auto_59843 ?auto_59847 ) ) ( not ( = ?auto_59844 ?auto_59847 ) ) ( not ( = ?auto_59845 ?auto_59847 ) ) ( not ( = ?auto_59846 ?auto_59847 ) ) ( ON ?auto_59845 ?auto_59846 ) ( ON-TABLE ?auto_59847 ) ( ON ?auto_59842 ?auto_59848 ) ( not ( = ?auto_59842 ?auto_59848 ) ) ( not ( = ?auto_59843 ?auto_59848 ) ) ( not ( = ?auto_59844 ?auto_59848 ) ) ( not ( = ?auto_59845 ?auto_59848 ) ) ( not ( = ?auto_59846 ?auto_59848 ) ) ( not ( = ?auto_59847 ?auto_59848 ) ) ( ON ?auto_59843 ?auto_59842 ) ( ON-TABLE ?auto_59848 ) ( CLEAR ?auto_59845 ) ( ON ?auto_59844 ?auto_59843 ) ( CLEAR ?auto_59844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59848 ?auto_59842 ?auto_59843 )
      ( MAKE-5PILE ?auto_59842 ?auto_59843 ?auto_59844 ?auto_59845 ?auto_59846 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59849 - BLOCK
      ?auto_59850 - BLOCK
      ?auto_59851 - BLOCK
      ?auto_59852 - BLOCK
      ?auto_59853 - BLOCK
    )
    :vars
    (
      ?auto_59855 - BLOCK
      ?auto_59854 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59849 ?auto_59850 ) ) ( not ( = ?auto_59849 ?auto_59851 ) ) ( not ( = ?auto_59849 ?auto_59852 ) ) ( not ( = ?auto_59849 ?auto_59853 ) ) ( not ( = ?auto_59850 ?auto_59851 ) ) ( not ( = ?auto_59850 ?auto_59852 ) ) ( not ( = ?auto_59850 ?auto_59853 ) ) ( not ( = ?auto_59851 ?auto_59852 ) ) ( not ( = ?auto_59851 ?auto_59853 ) ) ( not ( = ?auto_59852 ?auto_59853 ) ) ( ON ?auto_59853 ?auto_59855 ) ( not ( = ?auto_59849 ?auto_59855 ) ) ( not ( = ?auto_59850 ?auto_59855 ) ) ( not ( = ?auto_59851 ?auto_59855 ) ) ( not ( = ?auto_59852 ?auto_59855 ) ) ( not ( = ?auto_59853 ?auto_59855 ) ) ( ON-TABLE ?auto_59855 ) ( ON ?auto_59849 ?auto_59854 ) ( not ( = ?auto_59849 ?auto_59854 ) ) ( not ( = ?auto_59850 ?auto_59854 ) ) ( not ( = ?auto_59851 ?auto_59854 ) ) ( not ( = ?auto_59852 ?auto_59854 ) ) ( not ( = ?auto_59853 ?auto_59854 ) ) ( not ( = ?auto_59855 ?auto_59854 ) ) ( ON ?auto_59850 ?auto_59849 ) ( ON-TABLE ?auto_59854 ) ( ON ?auto_59851 ?auto_59850 ) ( CLEAR ?auto_59851 ) ( HOLDING ?auto_59852 ) ( CLEAR ?auto_59853 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59855 ?auto_59853 ?auto_59852 )
      ( MAKE-5PILE ?auto_59849 ?auto_59850 ?auto_59851 ?auto_59852 ?auto_59853 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59856 - BLOCK
      ?auto_59857 - BLOCK
      ?auto_59858 - BLOCK
      ?auto_59859 - BLOCK
      ?auto_59860 - BLOCK
    )
    :vars
    (
      ?auto_59862 - BLOCK
      ?auto_59861 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59856 ?auto_59857 ) ) ( not ( = ?auto_59856 ?auto_59858 ) ) ( not ( = ?auto_59856 ?auto_59859 ) ) ( not ( = ?auto_59856 ?auto_59860 ) ) ( not ( = ?auto_59857 ?auto_59858 ) ) ( not ( = ?auto_59857 ?auto_59859 ) ) ( not ( = ?auto_59857 ?auto_59860 ) ) ( not ( = ?auto_59858 ?auto_59859 ) ) ( not ( = ?auto_59858 ?auto_59860 ) ) ( not ( = ?auto_59859 ?auto_59860 ) ) ( ON ?auto_59860 ?auto_59862 ) ( not ( = ?auto_59856 ?auto_59862 ) ) ( not ( = ?auto_59857 ?auto_59862 ) ) ( not ( = ?auto_59858 ?auto_59862 ) ) ( not ( = ?auto_59859 ?auto_59862 ) ) ( not ( = ?auto_59860 ?auto_59862 ) ) ( ON-TABLE ?auto_59862 ) ( ON ?auto_59856 ?auto_59861 ) ( not ( = ?auto_59856 ?auto_59861 ) ) ( not ( = ?auto_59857 ?auto_59861 ) ) ( not ( = ?auto_59858 ?auto_59861 ) ) ( not ( = ?auto_59859 ?auto_59861 ) ) ( not ( = ?auto_59860 ?auto_59861 ) ) ( not ( = ?auto_59862 ?auto_59861 ) ) ( ON ?auto_59857 ?auto_59856 ) ( ON-TABLE ?auto_59861 ) ( ON ?auto_59858 ?auto_59857 ) ( CLEAR ?auto_59860 ) ( ON ?auto_59859 ?auto_59858 ) ( CLEAR ?auto_59859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59861 ?auto_59856 ?auto_59857 ?auto_59858 )
      ( MAKE-5PILE ?auto_59856 ?auto_59857 ?auto_59858 ?auto_59859 ?auto_59860 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59863 - BLOCK
      ?auto_59864 - BLOCK
      ?auto_59865 - BLOCK
      ?auto_59866 - BLOCK
      ?auto_59867 - BLOCK
    )
    :vars
    (
      ?auto_59869 - BLOCK
      ?auto_59868 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59863 ?auto_59864 ) ) ( not ( = ?auto_59863 ?auto_59865 ) ) ( not ( = ?auto_59863 ?auto_59866 ) ) ( not ( = ?auto_59863 ?auto_59867 ) ) ( not ( = ?auto_59864 ?auto_59865 ) ) ( not ( = ?auto_59864 ?auto_59866 ) ) ( not ( = ?auto_59864 ?auto_59867 ) ) ( not ( = ?auto_59865 ?auto_59866 ) ) ( not ( = ?auto_59865 ?auto_59867 ) ) ( not ( = ?auto_59866 ?auto_59867 ) ) ( not ( = ?auto_59863 ?auto_59869 ) ) ( not ( = ?auto_59864 ?auto_59869 ) ) ( not ( = ?auto_59865 ?auto_59869 ) ) ( not ( = ?auto_59866 ?auto_59869 ) ) ( not ( = ?auto_59867 ?auto_59869 ) ) ( ON-TABLE ?auto_59869 ) ( ON ?auto_59863 ?auto_59868 ) ( not ( = ?auto_59863 ?auto_59868 ) ) ( not ( = ?auto_59864 ?auto_59868 ) ) ( not ( = ?auto_59865 ?auto_59868 ) ) ( not ( = ?auto_59866 ?auto_59868 ) ) ( not ( = ?auto_59867 ?auto_59868 ) ) ( not ( = ?auto_59869 ?auto_59868 ) ) ( ON ?auto_59864 ?auto_59863 ) ( ON-TABLE ?auto_59868 ) ( ON ?auto_59865 ?auto_59864 ) ( ON ?auto_59866 ?auto_59865 ) ( CLEAR ?auto_59866 ) ( HOLDING ?auto_59867 ) ( CLEAR ?auto_59869 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59869 ?auto_59867 )
      ( MAKE-5PILE ?auto_59863 ?auto_59864 ?auto_59865 ?auto_59866 ?auto_59867 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59870 - BLOCK
      ?auto_59871 - BLOCK
      ?auto_59872 - BLOCK
      ?auto_59873 - BLOCK
      ?auto_59874 - BLOCK
    )
    :vars
    (
      ?auto_59875 - BLOCK
      ?auto_59876 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59870 ?auto_59871 ) ) ( not ( = ?auto_59870 ?auto_59872 ) ) ( not ( = ?auto_59870 ?auto_59873 ) ) ( not ( = ?auto_59870 ?auto_59874 ) ) ( not ( = ?auto_59871 ?auto_59872 ) ) ( not ( = ?auto_59871 ?auto_59873 ) ) ( not ( = ?auto_59871 ?auto_59874 ) ) ( not ( = ?auto_59872 ?auto_59873 ) ) ( not ( = ?auto_59872 ?auto_59874 ) ) ( not ( = ?auto_59873 ?auto_59874 ) ) ( not ( = ?auto_59870 ?auto_59875 ) ) ( not ( = ?auto_59871 ?auto_59875 ) ) ( not ( = ?auto_59872 ?auto_59875 ) ) ( not ( = ?auto_59873 ?auto_59875 ) ) ( not ( = ?auto_59874 ?auto_59875 ) ) ( ON-TABLE ?auto_59875 ) ( ON ?auto_59870 ?auto_59876 ) ( not ( = ?auto_59870 ?auto_59876 ) ) ( not ( = ?auto_59871 ?auto_59876 ) ) ( not ( = ?auto_59872 ?auto_59876 ) ) ( not ( = ?auto_59873 ?auto_59876 ) ) ( not ( = ?auto_59874 ?auto_59876 ) ) ( not ( = ?auto_59875 ?auto_59876 ) ) ( ON ?auto_59871 ?auto_59870 ) ( ON-TABLE ?auto_59876 ) ( ON ?auto_59872 ?auto_59871 ) ( ON ?auto_59873 ?auto_59872 ) ( CLEAR ?auto_59875 ) ( ON ?auto_59874 ?auto_59873 ) ( CLEAR ?auto_59874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59876 ?auto_59870 ?auto_59871 ?auto_59872 ?auto_59873 )
      ( MAKE-5PILE ?auto_59870 ?auto_59871 ?auto_59872 ?auto_59873 ?auto_59874 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59877 - BLOCK
      ?auto_59878 - BLOCK
      ?auto_59879 - BLOCK
      ?auto_59880 - BLOCK
      ?auto_59881 - BLOCK
    )
    :vars
    (
      ?auto_59882 - BLOCK
      ?auto_59883 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59877 ?auto_59878 ) ) ( not ( = ?auto_59877 ?auto_59879 ) ) ( not ( = ?auto_59877 ?auto_59880 ) ) ( not ( = ?auto_59877 ?auto_59881 ) ) ( not ( = ?auto_59878 ?auto_59879 ) ) ( not ( = ?auto_59878 ?auto_59880 ) ) ( not ( = ?auto_59878 ?auto_59881 ) ) ( not ( = ?auto_59879 ?auto_59880 ) ) ( not ( = ?auto_59879 ?auto_59881 ) ) ( not ( = ?auto_59880 ?auto_59881 ) ) ( not ( = ?auto_59877 ?auto_59882 ) ) ( not ( = ?auto_59878 ?auto_59882 ) ) ( not ( = ?auto_59879 ?auto_59882 ) ) ( not ( = ?auto_59880 ?auto_59882 ) ) ( not ( = ?auto_59881 ?auto_59882 ) ) ( ON ?auto_59877 ?auto_59883 ) ( not ( = ?auto_59877 ?auto_59883 ) ) ( not ( = ?auto_59878 ?auto_59883 ) ) ( not ( = ?auto_59879 ?auto_59883 ) ) ( not ( = ?auto_59880 ?auto_59883 ) ) ( not ( = ?auto_59881 ?auto_59883 ) ) ( not ( = ?auto_59882 ?auto_59883 ) ) ( ON ?auto_59878 ?auto_59877 ) ( ON-TABLE ?auto_59883 ) ( ON ?auto_59879 ?auto_59878 ) ( ON ?auto_59880 ?auto_59879 ) ( ON ?auto_59881 ?auto_59880 ) ( CLEAR ?auto_59881 ) ( HOLDING ?auto_59882 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_59882 )
      ( MAKE-5PILE ?auto_59877 ?auto_59878 ?auto_59879 ?auto_59880 ?auto_59881 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59884 - BLOCK
      ?auto_59885 - BLOCK
      ?auto_59886 - BLOCK
      ?auto_59887 - BLOCK
      ?auto_59888 - BLOCK
    )
    :vars
    (
      ?auto_59889 - BLOCK
      ?auto_59890 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59884 ?auto_59885 ) ) ( not ( = ?auto_59884 ?auto_59886 ) ) ( not ( = ?auto_59884 ?auto_59887 ) ) ( not ( = ?auto_59884 ?auto_59888 ) ) ( not ( = ?auto_59885 ?auto_59886 ) ) ( not ( = ?auto_59885 ?auto_59887 ) ) ( not ( = ?auto_59885 ?auto_59888 ) ) ( not ( = ?auto_59886 ?auto_59887 ) ) ( not ( = ?auto_59886 ?auto_59888 ) ) ( not ( = ?auto_59887 ?auto_59888 ) ) ( not ( = ?auto_59884 ?auto_59889 ) ) ( not ( = ?auto_59885 ?auto_59889 ) ) ( not ( = ?auto_59886 ?auto_59889 ) ) ( not ( = ?auto_59887 ?auto_59889 ) ) ( not ( = ?auto_59888 ?auto_59889 ) ) ( ON ?auto_59884 ?auto_59890 ) ( not ( = ?auto_59884 ?auto_59890 ) ) ( not ( = ?auto_59885 ?auto_59890 ) ) ( not ( = ?auto_59886 ?auto_59890 ) ) ( not ( = ?auto_59887 ?auto_59890 ) ) ( not ( = ?auto_59888 ?auto_59890 ) ) ( not ( = ?auto_59889 ?auto_59890 ) ) ( ON ?auto_59885 ?auto_59884 ) ( ON-TABLE ?auto_59890 ) ( ON ?auto_59886 ?auto_59885 ) ( ON ?auto_59887 ?auto_59886 ) ( ON ?auto_59888 ?auto_59887 ) ( ON ?auto_59889 ?auto_59888 ) ( CLEAR ?auto_59889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_59890 ?auto_59884 ?auto_59885 ?auto_59886 ?auto_59887 ?auto_59888 )
      ( MAKE-5PILE ?auto_59884 ?auto_59885 ?auto_59886 ?auto_59887 ?auto_59888 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59903 - BLOCK
      ?auto_59904 - BLOCK
      ?auto_59905 - BLOCK
      ?auto_59906 - BLOCK
      ?auto_59907 - BLOCK
      ?auto_59908 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_59907 ) ( ON-TABLE ?auto_59903 ) ( ON ?auto_59904 ?auto_59903 ) ( ON ?auto_59905 ?auto_59904 ) ( ON ?auto_59906 ?auto_59905 ) ( ON ?auto_59907 ?auto_59906 ) ( not ( = ?auto_59903 ?auto_59904 ) ) ( not ( = ?auto_59903 ?auto_59905 ) ) ( not ( = ?auto_59903 ?auto_59906 ) ) ( not ( = ?auto_59903 ?auto_59907 ) ) ( not ( = ?auto_59903 ?auto_59908 ) ) ( not ( = ?auto_59904 ?auto_59905 ) ) ( not ( = ?auto_59904 ?auto_59906 ) ) ( not ( = ?auto_59904 ?auto_59907 ) ) ( not ( = ?auto_59904 ?auto_59908 ) ) ( not ( = ?auto_59905 ?auto_59906 ) ) ( not ( = ?auto_59905 ?auto_59907 ) ) ( not ( = ?auto_59905 ?auto_59908 ) ) ( not ( = ?auto_59906 ?auto_59907 ) ) ( not ( = ?auto_59906 ?auto_59908 ) ) ( not ( = ?auto_59907 ?auto_59908 ) ) ( ON-TABLE ?auto_59908 ) ( CLEAR ?auto_59908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_59908 )
      ( MAKE-6PILE ?auto_59903 ?auto_59904 ?auto_59905 ?auto_59906 ?auto_59907 ?auto_59908 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59909 - BLOCK
      ?auto_59910 - BLOCK
      ?auto_59911 - BLOCK
      ?auto_59912 - BLOCK
      ?auto_59913 - BLOCK
      ?auto_59914 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59909 ) ( ON ?auto_59910 ?auto_59909 ) ( ON ?auto_59911 ?auto_59910 ) ( ON ?auto_59912 ?auto_59911 ) ( not ( = ?auto_59909 ?auto_59910 ) ) ( not ( = ?auto_59909 ?auto_59911 ) ) ( not ( = ?auto_59909 ?auto_59912 ) ) ( not ( = ?auto_59909 ?auto_59913 ) ) ( not ( = ?auto_59909 ?auto_59914 ) ) ( not ( = ?auto_59910 ?auto_59911 ) ) ( not ( = ?auto_59910 ?auto_59912 ) ) ( not ( = ?auto_59910 ?auto_59913 ) ) ( not ( = ?auto_59910 ?auto_59914 ) ) ( not ( = ?auto_59911 ?auto_59912 ) ) ( not ( = ?auto_59911 ?auto_59913 ) ) ( not ( = ?auto_59911 ?auto_59914 ) ) ( not ( = ?auto_59912 ?auto_59913 ) ) ( not ( = ?auto_59912 ?auto_59914 ) ) ( not ( = ?auto_59913 ?auto_59914 ) ) ( ON-TABLE ?auto_59914 ) ( CLEAR ?auto_59914 ) ( HOLDING ?auto_59913 ) ( CLEAR ?auto_59912 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59909 ?auto_59910 ?auto_59911 ?auto_59912 ?auto_59913 )
      ( MAKE-6PILE ?auto_59909 ?auto_59910 ?auto_59911 ?auto_59912 ?auto_59913 ?auto_59914 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59915 - BLOCK
      ?auto_59916 - BLOCK
      ?auto_59917 - BLOCK
      ?auto_59918 - BLOCK
      ?auto_59919 - BLOCK
      ?auto_59920 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59915 ) ( ON ?auto_59916 ?auto_59915 ) ( ON ?auto_59917 ?auto_59916 ) ( ON ?auto_59918 ?auto_59917 ) ( not ( = ?auto_59915 ?auto_59916 ) ) ( not ( = ?auto_59915 ?auto_59917 ) ) ( not ( = ?auto_59915 ?auto_59918 ) ) ( not ( = ?auto_59915 ?auto_59919 ) ) ( not ( = ?auto_59915 ?auto_59920 ) ) ( not ( = ?auto_59916 ?auto_59917 ) ) ( not ( = ?auto_59916 ?auto_59918 ) ) ( not ( = ?auto_59916 ?auto_59919 ) ) ( not ( = ?auto_59916 ?auto_59920 ) ) ( not ( = ?auto_59917 ?auto_59918 ) ) ( not ( = ?auto_59917 ?auto_59919 ) ) ( not ( = ?auto_59917 ?auto_59920 ) ) ( not ( = ?auto_59918 ?auto_59919 ) ) ( not ( = ?auto_59918 ?auto_59920 ) ) ( not ( = ?auto_59919 ?auto_59920 ) ) ( ON-TABLE ?auto_59920 ) ( CLEAR ?auto_59918 ) ( ON ?auto_59919 ?auto_59920 ) ( CLEAR ?auto_59919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_59920 )
      ( MAKE-6PILE ?auto_59915 ?auto_59916 ?auto_59917 ?auto_59918 ?auto_59919 ?auto_59920 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59921 - BLOCK
      ?auto_59922 - BLOCK
      ?auto_59923 - BLOCK
      ?auto_59924 - BLOCK
      ?auto_59925 - BLOCK
      ?auto_59926 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59921 ) ( ON ?auto_59922 ?auto_59921 ) ( ON ?auto_59923 ?auto_59922 ) ( not ( = ?auto_59921 ?auto_59922 ) ) ( not ( = ?auto_59921 ?auto_59923 ) ) ( not ( = ?auto_59921 ?auto_59924 ) ) ( not ( = ?auto_59921 ?auto_59925 ) ) ( not ( = ?auto_59921 ?auto_59926 ) ) ( not ( = ?auto_59922 ?auto_59923 ) ) ( not ( = ?auto_59922 ?auto_59924 ) ) ( not ( = ?auto_59922 ?auto_59925 ) ) ( not ( = ?auto_59922 ?auto_59926 ) ) ( not ( = ?auto_59923 ?auto_59924 ) ) ( not ( = ?auto_59923 ?auto_59925 ) ) ( not ( = ?auto_59923 ?auto_59926 ) ) ( not ( = ?auto_59924 ?auto_59925 ) ) ( not ( = ?auto_59924 ?auto_59926 ) ) ( not ( = ?auto_59925 ?auto_59926 ) ) ( ON-TABLE ?auto_59926 ) ( ON ?auto_59925 ?auto_59926 ) ( CLEAR ?auto_59925 ) ( HOLDING ?auto_59924 ) ( CLEAR ?auto_59923 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59921 ?auto_59922 ?auto_59923 ?auto_59924 )
      ( MAKE-6PILE ?auto_59921 ?auto_59922 ?auto_59923 ?auto_59924 ?auto_59925 ?auto_59926 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59927 - BLOCK
      ?auto_59928 - BLOCK
      ?auto_59929 - BLOCK
      ?auto_59930 - BLOCK
      ?auto_59931 - BLOCK
      ?auto_59932 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59927 ) ( ON ?auto_59928 ?auto_59927 ) ( ON ?auto_59929 ?auto_59928 ) ( not ( = ?auto_59927 ?auto_59928 ) ) ( not ( = ?auto_59927 ?auto_59929 ) ) ( not ( = ?auto_59927 ?auto_59930 ) ) ( not ( = ?auto_59927 ?auto_59931 ) ) ( not ( = ?auto_59927 ?auto_59932 ) ) ( not ( = ?auto_59928 ?auto_59929 ) ) ( not ( = ?auto_59928 ?auto_59930 ) ) ( not ( = ?auto_59928 ?auto_59931 ) ) ( not ( = ?auto_59928 ?auto_59932 ) ) ( not ( = ?auto_59929 ?auto_59930 ) ) ( not ( = ?auto_59929 ?auto_59931 ) ) ( not ( = ?auto_59929 ?auto_59932 ) ) ( not ( = ?auto_59930 ?auto_59931 ) ) ( not ( = ?auto_59930 ?auto_59932 ) ) ( not ( = ?auto_59931 ?auto_59932 ) ) ( ON-TABLE ?auto_59932 ) ( ON ?auto_59931 ?auto_59932 ) ( CLEAR ?auto_59929 ) ( ON ?auto_59930 ?auto_59931 ) ( CLEAR ?auto_59930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59932 ?auto_59931 )
      ( MAKE-6PILE ?auto_59927 ?auto_59928 ?auto_59929 ?auto_59930 ?auto_59931 ?auto_59932 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59933 - BLOCK
      ?auto_59934 - BLOCK
      ?auto_59935 - BLOCK
      ?auto_59936 - BLOCK
      ?auto_59937 - BLOCK
      ?auto_59938 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59933 ) ( ON ?auto_59934 ?auto_59933 ) ( not ( = ?auto_59933 ?auto_59934 ) ) ( not ( = ?auto_59933 ?auto_59935 ) ) ( not ( = ?auto_59933 ?auto_59936 ) ) ( not ( = ?auto_59933 ?auto_59937 ) ) ( not ( = ?auto_59933 ?auto_59938 ) ) ( not ( = ?auto_59934 ?auto_59935 ) ) ( not ( = ?auto_59934 ?auto_59936 ) ) ( not ( = ?auto_59934 ?auto_59937 ) ) ( not ( = ?auto_59934 ?auto_59938 ) ) ( not ( = ?auto_59935 ?auto_59936 ) ) ( not ( = ?auto_59935 ?auto_59937 ) ) ( not ( = ?auto_59935 ?auto_59938 ) ) ( not ( = ?auto_59936 ?auto_59937 ) ) ( not ( = ?auto_59936 ?auto_59938 ) ) ( not ( = ?auto_59937 ?auto_59938 ) ) ( ON-TABLE ?auto_59938 ) ( ON ?auto_59937 ?auto_59938 ) ( ON ?auto_59936 ?auto_59937 ) ( CLEAR ?auto_59936 ) ( HOLDING ?auto_59935 ) ( CLEAR ?auto_59934 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59933 ?auto_59934 ?auto_59935 )
      ( MAKE-6PILE ?auto_59933 ?auto_59934 ?auto_59935 ?auto_59936 ?auto_59937 ?auto_59938 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59939 - BLOCK
      ?auto_59940 - BLOCK
      ?auto_59941 - BLOCK
      ?auto_59942 - BLOCK
      ?auto_59943 - BLOCK
      ?auto_59944 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59939 ) ( ON ?auto_59940 ?auto_59939 ) ( not ( = ?auto_59939 ?auto_59940 ) ) ( not ( = ?auto_59939 ?auto_59941 ) ) ( not ( = ?auto_59939 ?auto_59942 ) ) ( not ( = ?auto_59939 ?auto_59943 ) ) ( not ( = ?auto_59939 ?auto_59944 ) ) ( not ( = ?auto_59940 ?auto_59941 ) ) ( not ( = ?auto_59940 ?auto_59942 ) ) ( not ( = ?auto_59940 ?auto_59943 ) ) ( not ( = ?auto_59940 ?auto_59944 ) ) ( not ( = ?auto_59941 ?auto_59942 ) ) ( not ( = ?auto_59941 ?auto_59943 ) ) ( not ( = ?auto_59941 ?auto_59944 ) ) ( not ( = ?auto_59942 ?auto_59943 ) ) ( not ( = ?auto_59942 ?auto_59944 ) ) ( not ( = ?auto_59943 ?auto_59944 ) ) ( ON-TABLE ?auto_59944 ) ( ON ?auto_59943 ?auto_59944 ) ( ON ?auto_59942 ?auto_59943 ) ( CLEAR ?auto_59940 ) ( ON ?auto_59941 ?auto_59942 ) ( CLEAR ?auto_59941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59944 ?auto_59943 ?auto_59942 )
      ( MAKE-6PILE ?auto_59939 ?auto_59940 ?auto_59941 ?auto_59942 ?auto_59943 ?auto_59944 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59945 - BLOCK
      ?auto_59946 - BLOCK
      ?auto_59947 - BLOCK
      ?auto_59948 - BLOCK
      ?auto_59949 - BLOCK
      ?auto_59950 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59945 ) ( not ( = ?auto_59945 ?auto_59946 ) ) ( not ( = ?auto_59945 ?auto_59947 ) ) ( not ( = ?auto_59945 ?auto_59948 ) ) ( not ( = ?auto_59945 ?auto_59949 ) ) ( not ( = ?auto_59945 ?auto_59950 ) ) ( not ( = ?auto_59946 ?auto_59947 ) ) ( not ( = ?auto_59946 ?auto_59948 ) ) ( not ( = ?auto_59946 ?auto_59949 ) ) ( not ( = ?auto_59946 ?auto_59950 ) ) ( not ( = ?auto_59947 ?auto_59948 ) ) ( not ( = ?auto_59947 ?auto_59949 ) ) ( not ( = ?auto_59947 ?auto_59950 ) ) ( not ( = ?auto_59948 ?auto_59949 ) ) ( not ( = ?auto_59948 ?auto_59950 ) ) ( not ( = ?auto_59949 ?auto_59950 ) ) ( ON-TABLE ?auto_59950 ) ( ON ?auto_59949 ?auto_59950 ) ( ON ?auto_59948 ?auto_59949 ) ( ON ?auto_59947 ?auto_59948 ) ( CLEAR ?auto_59947 ) ( HOLDING ?auto_59946 ) ( CLEAR ?auto_59945 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59945 ?auto_59946 )
      ( MAKE-6PILE ?auto_59945 ?auto_59946 ?auto_59947 ?auto_59948 ?auto_59949 ?auto_59950 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59951 - BLOCK
      ?auto_59952 - BLOCK
      ?auto_59953 - BLOCK
      ?auto_59954 - BLOCK
      ?auto_59955 - BLOCK
      ?auto_59956 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59951 ) ( not ( = ?auto_59951 ?auto_59952 ) ) ( not ( = ?auto_59951 ?auto_59953 ) ) ( not ( = ?auto_59951 ?auto_59954 ) ) ( not ( = ?auto_59951 ?auto_59955 ) ) ( not ( = ?auto_59951 ?auto_59956 ) ) ( not ( = ?auto_59952 ?auto_59953 ) ) ( not ( = ?auto_59952 ?auto_59954 ) ) ( not ( = ?auto_59952 ?auto_59955 ) ) ( not ( = ?auto_59952 ?auto_59956 ) ) ( not ( = ?auto_59953 ?auto_59954 ) ) ( not ( = ?auto_59953 ?auto_59955 ) ) ( not ( = ?auto_59953 ?auto_59956 ) ) ( not ( = ?auto_59954 ?auto_59955 ) ) ( not ( = ?auto_59954 ?auto_59956 ) ) ( not ( = ?auto_59955 ?auto_59956 ) ) ( ON-TABLE ?auto_59956 ) ( ON ?auto_59955 ?auto_59956 ) ( ON ?auto_59954 ?auto_59955 ) ( ON ?auto_59953 ?auto_59954 ) ( CLEAR ?auto_59951 ) ( ON ?auto_59952 ?auto_59953 ) ( CLEAR ?auto_59952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59956 ?auto_59955 ?auto_59954 ?auto_59953 )
      ( MAKE-6PILE ?auto_59951 ?auto_59952 ?auto_59953 ?auto_59954 ?auto_59955 ?auto_59956 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59957 - BLOCK
      ?auto_59958 - BLOCK
      ?auto_59959 - BLOCK
      ?auto_59960 - BLOCK
      ?auto_59961 - BLOCK
      ?auto_59962 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59957 ?auto_59958 ) ) ( not ( = ?auto_59957 ?auto_59959 ) ) ( not ( = ?auto_59957 ?auto_59960 ) ) ( not ( = ?auto_59957 ?auto_59961 ) ) ( not ( = ?auto_59957 ?auto_59962 ) ) ( not ( = ?auto_59958 ?auto_59959 ) ) ( not ( = ?auto_59958 ?auto_59960 ) ) ( not ( = ?auto_59958 ?auto_59961 ) ) ( not ( = ?auto_59958 ?auto_59962 ) ) ( not ( = ?auto_59959 ?auto_59960 ) ) ( not ( = ?auto_59959 ?auto_59961 ) ) ( not ( = ?auto_59959 ?auto_59962 ) ) ( not ( = ?auto_59960 ?auto_59961 ) ) ( not ( = ?auto_59960 ?auto_59962 ) ) ( not ( = ?auto_59961 ?auto_59962 ) ) ( ON-TABLE ?auto_59962 ) ( ON ?auto_59961 ?auto_59962 ) ( ON ?auto_59960 ?auto_59961 ) ( ON ?auto_59959 ?auto_59960 ) ( ON ?auto_59958 ?auto_59959 ) ( CLEAR ?auto_59958 ) ( HOLDING ?auto_59957 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_59957 )
      ( MAKE-6PILE ?auto_59957 ?auto_59958 ?auto_59959 ?auto_59960 ?auto_59961 ?auto_59962 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59963 - BLOCK
      ?auto_59964 - BLOCK
      ?auto_59965 - BLOCK
      ?auto_59966 - BLOCK
      ?auto_59967 - BLOCK
      ?auto_59968 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59963 ?auto_59964 ) ) ( not ( = ?auto_59963 ?auto_59965 ) ) ( not ( = ?auto_59963 ?auto_59966 ) ) ( not ( = ?auto_59963 ?auto_59967 ) ) ( not ( = ?auto_59963 ?auto_59968 ) ) ( not ( = ?auto_59964 ?auto_59965 ) ) ( not ( = ?auto_59964 ?auto_59966 ) ) ( not ( = ?auto_59964 ?auto_59967 ) ) ( not ( = ?auto_59964 ?auto_59968 ) ) ( not ( = ?auto_59965 ?auto_59966 ) ) ( not ( = ?auto_59965 ?auto_59967 ) ) ( not ( = ?auto_59965 ?auto_59968 ) ) ( not ( = ?auto_59966 ?auto_59967 ) ) ( not ( = ?auto_59966 ?auto_59968 ) ) ( not ( = ?auto_59967 ?auto_59968 ) ) ( ON-TABLE ?auto_59968 ) ( ON ?auto_59967 ?auto_59968 ) ( ON ?auto_59966 ?auto_59967 ) ( ON ?auto_59965 ?auto_59966 ) ( ON ?auto_59964 ?auto_59965 ) ( ON ?auto_59963 ?auto_59964 ) ( CLEAR ?auto_59963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59968 ?auto_59967 ?auto_59966 ?auto_59965 ?auto_59964 )
      ( MAKE-6PILE ?auto_59963 ?auto_59964 ?auto_59965 ?auto_59966 ?auto_59967 ?auto_59968 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59975 - BLOCK
      ?auto_59976 - BLOCK
      ?auto_59977 - BLOCK
      ?auto_59978 - BLOCK
      ?auto_59979 - BLOCK
      ?auto_59980 - BLOCK
    )
    :vars
    (
      ?auto_59981 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59975 ?auto_59976 ) ) ( not ( = ?auto_59975 ?auto_59977 ) ) ( not ( = ?auto_59975 ?auto_59978 ) ) ( not ( = ?auto_59975 ?auto_59979 ) ) ( not ( = ?auto_59975 ?auto_59980 ) ) ( not ( = ?auto_59976 ?auto_59977 ) ) ( not ( = ?auto_59976 ?auto_59978 ) ) ( not ( = ?auto_59976 ?auto_59979 ) ) ( not ( = ?auto_59976 ?auto_59980 ) ) ( not ( = ?auto_59977 ?auto_59978 ) ) ( not ( = ?auto_59977 ?auto_59979 ) ) ( not ( = ?auto_59977 ?auto_59980 ) ) ( not ( = ?auto_59978 ?auto_59979 ) ) ( not ( = ?auto_59978 ?auto_59980 ) ) ( not ( = ?auto_59979 ?auto_59980 ) ) ( ON-TABLE ?auto_59980 ) ( ON ?auto_59979 ?auto_59980 ) ( ON ?auto_59978 ?auto_59979 ) ( ON ?auto_59977 ?auto_59978 ) ( ON ?auto_59976 ?auto_59977 ) ( CLEAR ?auto_59976 ) ( ON ?auto_59975 ?auto_59981 ) ( CLEAR ?auto_59975 ) ( HAND-EMPTY ) ( not ( = ?auto_59975 ?auto_59981 ) ) ( not ( = ?auto_59976 ?auto_59981 ) ) ( not ( = ?auto_59977 ?auto_59981 ) ) ( not ( = ?auto_59978 ?auto_59981 ) ) ( not ( = ?auto_59979 ?auto_59981 ) ) ( not ( = ?auto_59980 ?auto_59981 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_59975 ?auto_59981 )
      ( MAKE-6PILE ?auto_59975 ?auto_59976 ?auto_59977 ?auto_59978 ?auto_59979 ?auto_59980 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59982 - BLOCK
      ?auto_59983 - BLOCK
      ?auto_59984 - BLOCK
      ?auto_59985 - BLOCK
      ?auto_59986 - BLOCK
      ?auto_59987 - BLOCK
    )
    :vars
    (
      ?auto_59988 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59982 ?auto_59983 ) ) ( not ( = ?auto_59982 ?auto_59984 ) ) ( not ( = ?auto_59982 ?auto_59985 ) ) ( not ( = ?auto_59982 ?auto_59986 ) ) ( not ( = ?auto_59982 ?auto_59987 ) ) ( not ( = ?auto_59983 ?auto_59984 ) ) ( not ( = ?auto_59983 ?auto_59985 ) ) ( not ( = ?auto_59983 ?auto_59986 ) ) ( not ( = ?auto_59983 ?auto_59987 ) ) ( not ( = ?auto_59984 ?auto_59985 ) ) ( not ( = ?auto_59984 ?auto_59986 ) ) ( not ( = ?auto_59984 ?auto_59987 ) ) ( not ( = ?auto_59985 ?auto_59986 ) ) ( not ( = ?auto_59985 ?auto_59987 ) ) ( not ( = ?auto_59986 ?auto_59987 ) ) ( ON-TABLE ?auto_59987 ) ( ON ?auto_59986 ?auto_59987 ) ( ON ?auto_59985 ?auto_59986 ) ( ON ?auto_59984 ?auto_59985 ) ( ON ?auto_59982 ?auto_59988 ) ( CLEAR ?auto_59982 ) ( not ( = ?auto_59982 ?auto_59988 ) ) ( not ( = ?auto_59983 ?auto_59988 ) ) ( not ( = ?auto_59984 ?auto_59988 ) ) ( not ( = ?auto_59985 ?auto_59988 ) ) ( not ( = ?auto_59986 ?auto_59988 ) ) ( not ( = ?auto_59987 ?auto_59988 ) ) ( HOLDING ?auto_59983 ) ( CLEAR ?auto_59984 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59987 ?auto_59986 ?auto_59985 ?auto_59984 ?auto_59983 )
      ( MAKE-6PILE ?auto_59982 ?auto_59983 ?auto_59984 ?auto_59985 ?auto_59986 ?auto_59987 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59989 - BLOCK
      ?auto_59990 - BLOCK
      ?auto_59991 - BLOCK
      ?auto_59992 - BLOCK
      ?auto_59993 - BLOCK
      ?auto_59994 - BLOCK
    )
    :vars
    (
      ?auto_59995 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59989 ?auto_59990 ) ) ( not ( = ?auto_59989 ?auto_59991 ) ) ( not ( = ?auto_59989 ?auto_59992 ) ) ( not ( = ?auto_59989 ?auto_59993 ) ) ( not ( = ?auto_59989 ?auto_59994 ) ) ( not ( = ?auto_59990 ?auto_59991 ) ) ( not ( = ?auto_59990 ?auto_59992 ) ) ( not ( = ?auto_59990 ?auto_59993 ) ) ( not ( = ?auto_59990 ?auto_59994 ) ) ( not ( = ?auto_59991 ?auto_59992 ) ) ( not ( = ?auto_59991 ?auto_59993 ) ) ( not ( = ?auto_59991 ?auto_59994 ) ) ( not ( = ?auto_59992 ?auto_59993 ) ) ( not ( = ?auto_59992 ?auto_59994 ) ) ( not ( = ?auto_59993 ?auto_59994 ) ) ( ON-TABLE ?auto_59994 ) ( ON ?auto_59993 ?auto_59994 ) ( ON ?auto_59992 ?auto_59993 ) ( ON ?auto_59991 ?auto_59992 ) ( ON ?auto_59989 ?auto_59995 ) ( not ( = ?auto_59989 ?auto_59995 ) ) ( not ( = ?auto_59990 ?auto_59995 ) ) ( not ( = ?auto_59991 ?auto_59995 ) ) ( not ( = ?auto_59992 ?auto_59995 ) ) ( not ( = ?auto_59993 ?auto_59995 ) ) ( not ( = ?auto_59994 ?auto_59995 ) ) ( CLEAR ?auto_59991 ) ( ON ?auto_59990 ?auto_59989 ) ( CLEAR ?auto_59990 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_59995 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59995 ?auto_59989 )
      ( MAKE-6PILE ?auto_59989 ?auto_59990 ?auto_59991 ?auto_59992 ?auto_59993 ?auto_59994 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59996 - BLOCK
      ?auto_59997 - BLOCK
      ?auto_59998 - BLOCK
      ?auto_59999 - BLOCK
      ?auto_60000 - BLOCK
      ?auto_60001 - BLOCK
    )
    :vars
    (
      ?auto_60002 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59996 ?auto_59997 ) ) ( not ( = ?auto_59996 ?auto_59998 ) ) ( not ( = ?auto_59996 ?auto_59999 ) ) ( not ( = ?auto_59996 ?auto_60000 ) ) ( not ( = ?auto_59996 ?auto_60001 ) ) ( not ( = ?auto_59997 ?auto_59998 ) ) ( not ( = ?auto_59997 ?auto_59999 ) ) ( not ( = ?auto_59997 ?auto_60000 ) ) ( not ( = ?auto_59997 ?auto_60001 ) ) ( not ( = ?auto_59998 ?auto_59999 ) ) ( not ( = ?auto_59998 ?auto_60000 ) ) ( not ( = ?auto_59998 ?auto_60001 ) ) ( not ( = ?auto_59999 ?auto_60000 ) ) ( not ( = ?auto_59999 ?auto_60001 ) ) ( not ( = ?auto_60000 ?auto_60001 ) ) ( ON-TABLE ?auto_60001 ) ( ON ?auto_60000 ?auto_60001 ) ( ON ?auto_59999 ?auto_60000 ) ( ON ?auto_59996 ?auto_60002 ) ( not ( = ?auto_59996 ?auto_60002 ) ) ( not ( = ?auto_59997 ?auto_60002 ) ) ( not ( = ?auto_59998 ?auto_60002 ) ) ( not ( = ?auto_59999 ?auto_60002 ) ) ( not ( = ?auto_60000 ?auto_60002 ) ) ( not ( = ?auto_60001 ?auto_60002 ) ) ( ON ?auto_59997 ?auto_59996 ) ( CLEAR ?auto_59997 ) ( ON-TABLE ?auto_60002 ) ( HOLDING ?auto_59998 ) ( CLEAR ?auto_59999 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60001 ?auto_60000 ?auto_59999 ?auto_59998 )
      ( MAKE-6PILE ?auto_59996 ?auto_59997 ?auto_59998 ?auto_59999 ?auto_60000 ?auto_60001 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_60003 - BLOCK
      ?auto_60004 - BLOCK
      ?auto_60005 - BLOCK
      ?auto_60006 - BLOCK
      ?auto_60007 - BLOCK
      ?auto_60008 - BLOCK
    )
    :vars
    (
      ?auto_60009 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60003 ?auto_60004 ) ) ( not ( = ?auto_60003 ?auto_60005 ) ) ( not ( = ?auto_60003 ?auto_60006 ) ) ( not ( = ?auto_60003 ?auto_60007 ) ) ( not ( = ?auto_60003 ?auto_60008 ) ) ( not ( = ?auto_60004 ?auto_60005 ) ) ( not ( = ?auto_60004 ?auto_60006 ) ) ( not ( = ?auto_60004 ?auto_60007 ) ) ( not ( = ?auto_60004 ?auto_60008 ) ) ( not ( = ?auto_60005 ?auto_60006 ) ) ( not ( = ?auto_60005 ?auto_60007 ) ) ( not ( = ?auto_60005 ?auto_60008 ) ) ( not ( = ?auto_60006 ?auto_60007 ) ) ( not ( = ?auto_60006 ?auto_60008 ) ) ( not ( = ?auto_60007 ?auto_60008 ) ) ( ON-TABLE ?auto_60008 ) ( ON ?auto_60007 ?auto_60008 ) ( ON ?auto_60006 ?auto_60007 ) ( ON ?auto_60003 ?auto_60009 ) ( not ( = ?auto_60003 ?auto_60009 ) ) ( not ( = ?auto_60004 ?auto_60009 ) ) ( not ( = ?auto_60005 ?auto_60009 ) ) ( not ( = ?auto_60006 ?auto_60009 ) ) ( not ( = ?auto_60007 ?auto_60009 ) ) ( not ( = ?auto_60008 ?auto_60009 ) ) ( ON ?auto_60004 ?auto_60003 ) ( ON-TABLE ?auto_60009 ) ( CLEAR ?auto_60006 ) ( ON ?auto_60005 ?auto_60004 ) ( CLEAR ?auto_60005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60009 ?auto_60003 ?auto_60004 )
      ( MAKE-6PILE ?auto_60003 ?auto_60004 ?auto_60005 ?auto_60006 ?auto_60007 ?auto_60008 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_60010 - BLOCK
      ?auto_60011 - BLOCK
      ?auto_60012 - BLOCK
      ?auto_60013 - BLOCK
      ?auto_60014 - BLOCK
      ?auto_60015 - BLOCK
    )
    :vars
    (
      ?auto_60016 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60010 ?auto_60011 ) ) ( not ( = ?auto_60010 ?auto_60012 ) ) ( not ( = ?auto_60010 ?auto_60013 ) ) ( not ( = ?auto_60010 ?auto_60014 ) ) ( not ( = ?auto_60010 ?auto_60015 ) ) ( not ( = ?auto_60011 ?auto_60012 ) ) ( not ( = ?auto_60011 ?auto_60013 ) ) ( not ( = ?auto_60011 ?auto_60014 ) ) ( not ( = ?auto_60011 ?auto_60015 ) ) ( not ( = ?auto_60012 ?auto_60013 ) ) ( not ( = ?auto_60012 ?auto_60014 ) ) ( not ( = ?auto_60012 ?auto_60015 ) ) ( not ( = ?auto_60013 ?auto_60014 ) ) ( not ( = ?auto_60013 ?auto_60015 ) ) ( not ( = ?auto_60014 ?auto_60015 ) ) ( ON-TABLE ?auto_60015 ) ( ON ?auto_60014 ?auto_60015 ) ( ON ?auto_60010 ?auto_60016 ) ( not ( = ?auto_60010 ?auto_60016 ) ) ( not ( = ?auto_60011 ?auto_60016 ) ) ( not ( = ?auto_60012 ?auto_60016 ) ) ( not ( = ?auto_60013 ?auto_60016 ) ) ( not ( = ?auto_60014 ?auto_60016 ) ) ( not ( = ?auto_60015 ?auto_60016 ) ) ( ON ?auto_60011 ?auto_60010 ) ( ON-TABLE ?auto_60016 ) ( ON ?auto_60012 ?auto_60011 ) ( CLEAR ?auto_60012 ) ( HOLDING ?auto_60013 ) ( CLEAR ?auto_60014 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60015 ?auto_60014 ?auto_60013 )
      ( MAKE-6PILE ?auto_60010 ?auto_60011 ?auto_60012 ?auto_60013 ?auto_60014 ?auto_60015 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_60017 - BLOCK
      ?auto_60018 - BLOCK
      ?auto_60019 - BLOCK
      ?auto_60020 - BLOCK
      ?auto_60021 - BLOCK
      ?auto_60022 - BLOCK
    )
    :vars
    (
      ?auto_60023 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60017 ?auto_60018 ) ) ( not ( = ?auto_60017 ?auto_60019 ) ) ( not ( = ?auto_60017 ?auto_60020 ) ) ( not ( = ?auto_60017 ?auto_60021 ) ) ( not ( = ?auto_60017 ?auto_60022 ) ) ( not ( = ?auto_60018 ?auto_60019 ) ) ( not ( = ?auto_60018 ?auto_60020 ) ) ( not ( = ?auto_60018 ?auto_60021 ) ) ( not ( = ?auto_60018 ?auto_60022 ) ) ( not ( = ?auto_60019 ?auto_60020 ) ) ( not ( = ?auto_60019 ?auto_60021 ) ) ( not ( = ?auto_60019 ?auto_60022 ) ) ( not ( = ?auto_60020 ?auto_60021 ) ) ( not ( = ?auto_60020 ?auto_60022 ) ) ( not ( = ?auto_60021 ?auto_60022 ) ) ( ON-TABLE ?auto_60022 ) ( ON ?auto_60021 ?auto_60022 ) ( ON ?auto_60017 ?auto_60023 ) ( not ( = ?auto_60017 ?auto_60023 ) ) ( not ( = ?auto_60018 ?auto_60023 ) ) ( not ( = ?auto_60019 ?auto_60023 ) ) ( not ( = ?auto_60020 ?auto_60023 ) ) ( not ( = ?auto_60021 ?auto_60023 ) ) ( not ( = ?auto_60022 ?auto_60023 ) ) ( ON ?auto_60018 ?auto_60017 ) ( ON-TABLE ?auto_60023 ) ( ON ?auto_60019 ?auto_60018 ) ( CLEAR ?auto_60021 ) ( ON ?auto_60020 ?auto_60019 ) ( CLEAR ?auto_60020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60023 ?auto_60017 ?auto_60018 ?auto_60019 )
      ( MAKE-6PILE ?auto_60017 ?auto_60018 ?auto_60019 ?auto_60020 ?auto_60021 ?auto_60022 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_60024 - BLOCK
      ?auto_60025 - BLOCK
      ?auto_60026 - BLOCK
      ?auto_60027 - BLOCK
      ?auto_60028 - BLOCK
      ?auto_60029 - BLOCK
    )
    :vars
    (
      ?auto_60030 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60024 ?auto_60025 ) ) ( not ( = ?auto_60024 ?auto_60026 ) ) ( not ( = ?auto_60024 ?auto_60027 ) ) ( not ( = ?auto_60024 ?auto_60028 ) ) ( not ( = ?auto_60024 ?auto_60029 ) ) ( not ( = ?auto_60025 ?auto_60026 ) ) ( not ( = ?auto_60025 ?auto_60027 ) ) ( not ( = ?auto_60025 ?auto_60028 ) ) ( not ( = ?auto_60025 ?auto_60029 ) ) ( not ( = ?auto_60026 ?auto_60027 ) ) ( not ( = ?auto_60026 ?auto_60028 ) ) ( not ( = ?auto_60026 ?auto_60029 ) ) ( not ( = ?auto_60027 ?auto_60028 ) ) ( not ( = ?auto_60027 ?auto_60029 ) ) ( not ( = ?auto_60028 ?auto_60029 ) ) ( ON-TABLE ?auto_60029 ) ( ON ?auto_60024 ?auto_60030 ) ( not ( = ?auto_60024 ?auto_60030 ) ) ( not ( = ?auto_60025 ?auto_60030 ) ) ( not ( = ?auto_60026 ?auto_60030 ) ) ( not ( = ?auto_60027 ?auto_60030 ) ) ( not ( = ?auto_60028 ?auto_60030 ) ) ( not ( = ?auto_60029 ?auto_60030 ) ) ( ON ?auto_60025 ?auto_60024 ) ( ON-TABLE ?auto_60030 ) ( ON ?auto_60026 ?auto_60025 ) ( ON ?auto_60027 ?auto_60026 ) ( CLEAR ?auto_60027 ) ( HOLDING ?auto_60028 ) ( CLEAR ?auto_60029 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60029 ?auto_60028 )
      ( MAKE-6PILE ?auto_60024 ?auto_60025 ?auto_60026 ?auto_60027 ?auto_60028 ?auto_60029 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_60031 - BLOCK
      ?auto_60032 - BLOCK
      ?auto_60033 - BLOCK
      ?auto_60034 - BLOCK
      ?auto_60035 - BLOCK
      ?auto_60036 - BLOCK
    )
    :vars
    (
      ?auto_60037 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60031 ?auto_60032 ) ) ( not ( = ?auto_60031 ?auto_60033 ) ) ( not ( = ?auto_60031 ?auto_60034 ) ) ( not ( = ?auto_60031 ?auto_60035 ) ) ( not ( = ?auto_60031 ?auto_60036 ) ) ( not ( = ?auto_60032 ?auto_60033 ) ) ( not ( = ?auto_60032 ?auto_60034 ) ) ( not ( = ?auto_60032 ?auto_60035 ) ) ( not ( = ?auto_60032 ?auto_60036 ) ) ( not ( = ?auto_60033 ?auto_60034 ) ) ( not ( = ?auto_60033 ?auto_60035 ) ) ( not ( = ?auto_60033 ?auto_60036 ) ) ( not ( = ?auto_60034 ?auto_60035 ) ) ( not ( = ?auto_60034 ?auto_60036 ) ) ( not ( = ?auto_60035 ?auto_60036 ) ) ( ON-TABLE ?auto_60036 ) ( ON ?auto_60031 ?auto_60037 ) ( not ( = ?auto_60031 ?auto_60037 ) ) ( not ( = ?auto_60032 ?auto_60037 ) ) ( not ( = ?auto_60033 ?auto_60037 ) ) ( not ( = ?auto_60034 ?auto_60037 ) ) ( not ( = ?auto_60035 ?auto_60037 ) ) ( not ( = ?auto_60036 ?auto_60037 ) ) ( ON ?auto_60032 ?auto_60031 ) ( ON-TABLE ?auto_60037 ) ( ON ?auto_60033 ?auto_60032 ) ( ON ?auto_60034 ?auto_60033 ) ( CLEAR ?auto_60036 ) ( ON ?auto_60035 ?auto_60034 ) ( CLEAR ?auto_60035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60037 ?auto_60031 ?auto_60032 ?auto_60033 ?auto_60034 )
      ( MAKE-6PILE ?auto_60031 ?auto_60032 ?auto_60033 ?auto_60034 ?auto_60035 ?auto_60036 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_60038 - BLOCK
      ?auto_60039 - BLOCK
      ?auto_60040 - BLOCK
      ?auto_60041 - BLOCK
      ?auto_60042 - BLOCK
      ?auto_60043 - BLOCK
    )
    :vars
    (
      ?auto_60044 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60038 ?auto_60039 ) ) ( not ( = ?auto_60038 ?auto_60040 ) ) ( not ( = ?auto_60038 ?auto_60041 ) ) ( not ( = ?auto_60038 ?auto_60042 ) ) ( not ( = ?auto_60038 ?auto_60043 ) ) ( not ( = ?auto_60039 ?auto_60040 ) ) ( not ( = ?auto_60039 ?auto_60041 ) ) ( not ( = ?auto_60039 ?auto_60042 ) ) ( not ( = ?auto_60039 ?auto_60043 ) ) ( not ( = ?auto_60040 ?auto_60041 ) ) ( not ( = ?auto_60040 ?auto_60042 ) ) ( not ( = ?auto_60040 ?auto_60043 ) ) ( not ( = ?auto_60041 ?auto_60042 ) ) ( not ( = ?auto_60041 ?auto_60043 ) ) ( not ( = ?auto_60042 ?auto_60043 ) ) ( ON ?auto_60038 ?auto_60044 ) ( not ( = ?auto_60038 ?auto_60044 ) ) ( not ( = ?auto_60039 ?auto_60044 ) ) ( not ( = ?auto_60040 ?auto_60044 ) ) ( not ( = ?auto_60041 ?auto_60044 ) ) ( not ( = ?auto_60042 ?auto_60044 ) ) ( not ( = ?auto_60043 ?auto_60044 ) ) ( ON ?auto_60039 ?auto_60038 ) ( ON-TABLE ?auto_60044 ) ( ON ?auto_60040 ?auto_60039 ) ( ON ?auto_60041 ?auto_60040 ) ( ON ?auto_60042 ?auto_60041 ) ( CLEAR ?auto_60042 ) ( HOLDING ?auto_60043 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_60043 )
      ( MAKE-6PILE ?auto_60038 ?auto_60039 ?auto_60040 ?auto_60041 ?auto_60042 ?auto_60043 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_60045 - BLOCK
      ?auto_60046 - BLOCK
      ?auto_60047 - BLOCK
      ?auto_60048 - BLOCK
      ?auto_60049 - BLOCK
      ?auto_60050 - BLOCK
    )
    :vars
    (
      ?auto_60051 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60045 ?auto_60046 ) ) ( not ( = ?auto_60045 ?auto_60047 ) ) ( not ( = ?auto_60045 ?auto_60048 ) ) ( not ( = ?auto_60045 ?auto_60049 ) ) ( not ( = ?auto_60045 ?auto_60050 ) ) ( not ( = ?auto_60046 ?auto_60047 ) ) ( not ( = ?auto_60046 ?auto_60048 ) ) ( not ( = ?auto_60046 ?auto_60049 ) ) ( not ( = ?auto_60046 ?auto_60050 ) ) ( not ( = ?auto_60047 ?auto_60048 ) ) ( not ( = ?auto_60047 ?auto_60049 ) ) ( not ( = ?auto_60047 ?auto_60050 ) ) ( not ( = ?auto_60048 ?auto_60049 ) ) ( not ( = ?auto_60048 ?auto_60050 ) ) ( not ( = ?auto_60049 ?auto_60050 ) ) ( ON ?auto_60045 ?auto_60051 ) ( not ( = ?auto_60045 ?auto_60051 ) ) ( not ( = ?auto_60046 ?auto_60051 ) ) ( not ( = ?auto_60047 ?auto_60051 ) ) ( not ( = ?auto_60048 ?auto_60051 ) ) ( not ( = ?auto_60049 ?auto_60051 ) ) ( not ( = ?auto_60050 ?auto_60051 ) ) ( ON ?auto_60046 ?auto_60045 ) ( ON-TABLE ?auto_60051 ) ( ON ?auto_60047 ?auto_60046 ) ( ON ?auto_60048 ?auto_60047 ) ( ON ?auto_60049 ?auto_60048 ) ( ON ?auto_60050 ?auto_60049 ) ( CLEAR ?auto_60050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_60051 ?auto_60045 ?auto_60046 ?auto_60047 ?auto_60048 ?auto_60049 )
      ( MAKE-6PILE ?auto_60045 ?auto_60046 ?auto_60047 ?auto_60048 ?auto_60049 ?auto_60050 ) )
  )

)

