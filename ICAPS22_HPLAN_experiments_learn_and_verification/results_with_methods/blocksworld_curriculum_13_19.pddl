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
      ?auto_271449 - BLOCK
    )
    :vars
    (
      ?auto_271450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271449 ?auto_271450 ) ( CLEAR ?auto_271449 ) ( HAND-EMPTY ) ( not ( = ?auto_271449 ?auto_271450 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_271449 ?auto_271450 )
      ( !PUTDOWN ?auto_271449 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_271452 - BLOCK
    )
    :vars
    (
      ?auto_271453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271452 ?auto_271453 ) ( CLEAR ?auto_271452 ) ( HAND-EMPTY ) ( not ( = ?auto_271452 ?auto_271453 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_271452 ?auto_271453 )
      ( !PUTDOWN ?auto_271452 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_271456 - BLOCK
      ?auto_271457 - BLOCK
    )
    :vars
    (
      ?auto_271458 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_271456 ) ( ON ?auto_271457 ?auto_271458 ) ( CLEAR ?auto_271457 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_271456 ) ( not ( = ?auto_271456 ?auto_271457 ) ) ( not ( = ?auto_271456 ?auto_271458 ) ) ( not ( = ?auto_271457 ?auto_271458 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_271457 ?auto_271458 )
      ( !STACK ?auto_271457 ?auto_271456 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_271461 - BLOCK
      ?auto_271462 - BLOCK
    )
    :vars
    (
      ?auto_271463 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_271461 ) ( ON ?auto_271462 ?auto_271463 ) ( CLEAR ?auto_271462 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_271461 ) ( not ( = ?auto_271461 ?auto_271462 ) ) ( not ( = ?auto_271461 ?auto_271463 ) ) ( not ( = ?auto_271462 ?auto_271463 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_271462 ?auto_271463 )
      ( !STACK ?auto_271462 ?auto_271461 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_271466 - BLOCK
      ?auto_271467 - BLOCK
    )
    :vars
    (
      ?auto_271468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271467 ?auto_271468 ) ( not ( = ?auto_271466 ?auto_271467 ) ) ( not ( = ?auto_271466 ?auto_271468 ) ) ( not ( = ?auto_271467 ?auto_271468 ) ) ( ON ?auto_271466 ?auto_271467 ) ( CLEAR ?auto_271466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_271466 )
      ( MAKE-2PILE ?auto_271466 ?auto_271467 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_271471 - BLOCK
      ?auto_271472 - BLOCK
    )
    :vars
    (
      ?auto_271473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271472 ?auto_271473 ) ( not ( = ?auto_271471 ?auto_271472 ) ) ( not ( = ?auto_271471 ?auto_271473 ) ) ( not ( = ?auto_271472 ?auto_271473 ) ) ( ON ?auto_271471 ?auto_271472 ) ( CLEAR ?auto_271471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_271471 )
      ( MAKE-2PILE ?auto_271471 ?auto_271472 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_271477 - BLOCK
      ?auto_271478 - BLOCK
      ?auto_271479 - BLOCK
    )
    :vars
    (
      ?auto_271480 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_271478 ) ( ON ?auto_271479 ?auto_271480 ) ( CLEAR ?auto_271479 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_271477 ) ( ON ?auto_271478 ?auto_271477 ) ( not ( = ?auto_271477 ?auto_271478 ) ) ( not ( = ?auto_271477 ?auto_271479 ) ) ( not ( = ?auto_271477 ?auto_271480 ) ) ( not ( = ?auto_271478 ?auto_271479 ) ) ( not ( = ?auto_271478 ?auto_271480 ) ) ( not ( = ?auto_271479 ?auto_271480 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_271479 ?auto_271480 )
      ( !STACK ?auto_271479 ?auto_271478 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_271484 - BLOCK
      ?auto_271485 - BLOCK
      ?auto_271486 - BLOCK
    )
    :vars
    (
      ?auto_271487 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_271485 ) ( ON ?auto_271486 ?auto_271487 ) ( CLEAR ?auto_271486 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_271484 ) ( ON ?auto_271485 ?auto_271484 ) ( not ( = ?auto_271484 ?auto_271485 ) ) ( not ( = ?auto_271484 ?auto_271486 ) ) ( not ( = ?auto_271484 ?auto_271487 ) ) ( not ( = ?auto_271485 ?auto_271486 ) ) ( not ( = ?auto_271485 ?auto_271487 ) ) ( not ( = ?auto_271486 ?auto_271487 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_271486 ?auto_271487 )
      ( !STACK ?auto_271486 ?auto_271485 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_271491 - BLOCK
      ?auto_271492 - BLOCK
      ?auto_271493 - BLOCK
    )
    :vars
    (
      ?auto_271494 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271493 ?auto_271494 ) ( ON-TABLE ?auto_271491 ) ( not ( = ?auto_271491 ?auto_271492 ) ) ( not ( = ?auto_271491 ?auto_271493 ) ) ( not ( = ?auto_271491 ?auto_271494 ) ) ( not ( = ?auto_271492 ?auto_271493 ) ) ( not ( = ?auto_271492 ?auto_271494 ) ) ( not ( = ?auto_271493 ?auto_271494 ) ) ( CLEAR ?auto_271491 ) ( ON ?auto_271492 ?auto_271493 ) ( CLEAR ?auto_271492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_271491 ?auto_271492 )
      ( MAKE-3PILE ?auto_271491 ?auto_271492 ?auto_271493 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_271498 - BLOCK
      ?auto_271499 - BLOCK
      ?auto_271500 - BLOCK
    )
    :vars
    (
      ?auto_271501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271500 ?auto_271501 ) ( ON-TABLE ?auto_271498 ) ( not ( = ?auto_271498 ?auto_271499 ) ) ( not ( = ?auto_271498 ?auto_271500 ) ) ( not ( = ?auto_271498 ?auto_271501 ) ) ( not ( = ?auto_271499 ?auto_271500 ) ) ( not ( = ?auto_271499 ?auto_271501 ) ) ( not ( = ?auto_271500 ?auto_271501 ) ) ( CLEAR ?auto_271498 ) ( ON ?auto_271499 ?auto_271500 ) ( CLEAR ?auto_271499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_271498 ?auto_271499 )
      ( MAKE-3PILE ?auto_271498 ?auto_271499 ?auto_271500 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_271505 - BLOCK
      ?auto_271506 - BLOCK
      ?auto_271507 - BLOCK
    )
    :vars
    (
      ?auto_271508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271507 ?auto_271508 ) ( not ( = ?auto_271505 ?auto_271506 ) ) ( not ( = ?auto_271505 ?auto_271507 ) ) ( not ( = ?auto_271505 ?auto_271508 ) ) ( not ( = ?auto_271506 ?auto_271507 ) ) ( not ( = ?auto_271506 ?auto_271508 ) ) ( not ( = ?auto_271507 ?auto_271508 ) ) ( ON ?auto_271506 ?auto_271507 ) ( ON ?auto_271505 ?auto_271506 ) ( CLEAR ?auto_271505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_271505 )
      ( MAKE-3PILE ?auto_271505 ?auto_271506 ?auto_271507 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_271512 - BLOCK
      ?auto_271513 - BLOCK
      ?auto_271514 - BLOCK
    )
    :vars
    (
      ?auto_271515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271514 ?auto_271515 ) ( not ( = ?auto_271512 ?auto_271513 ) ) ( not ( = ?auto_271512 ?auto_271514 ) ) ( not ( = ?auto_271512 ?auto_271515 ) ) ( not ( = ?auto_271513 ?auto_271514 ) ) ( not ( = ?auto_271513 ?auto_271515 ) ) ( not ( = ?auto_271514 ?auto_271515 ) ) ( ON ?auto_271513 ?auto_271514 ) ( ON ?auto_271512 ?auto_271513 ) ( CLEAR ?auto_271512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_271512 )
      ( MAKE-3PILE ?auto_271512 ?auto_271513 ?auto_271514 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_271520 - BLOCK
      ?auto_271521 - BLOCK
      ?auto_271522 - BLOCK
      ?auto_271523 - BLOCK
    )
    :vars
    (
      ?auto_271524 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_271522 ) ( ON ?auto_271523 ?auto_271524 ) ( CLEAR ?auto_271523 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_271520 ) ( ON ?auto_271521 ?auto_271520 ) ( ON ?auto_271522 ?auto_271521 ) ( not ( = ?auto_271520 ?auto_271521 ) ) ( not ( = ?auto_271520 ?auto_271522 ) ) ( not ( = ?auto_271520 ?auto_271523 ) ) ( not ( = ?auto_271520 ?auto_271524 ) ) ( not ( = ?auto_271521 ?auto_271522 ) ) ( not ( = ?auto_271521 ?auto_271523 ) ) ( not ( = ?auto_271521 ?auto_271524 ) ) ( not ( = ?auto_271522 ?auto_271523 ) ) ( not ( = ?auto_271522 ?auto_271524 ) ) ( not ( = ?auto_271523 ?auto_271524 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_271523 ?auto_271524 )
      ( !STACK ?auto_271523 ?auto_271522 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_271529 - BLOCK
      ?auto_271530 - BLOCK
      ?auto_271531 - BLOCK
      ?auto_271532 - BLOCK
    )
    :vars
    (
      ?auto_271533 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_271531 ) ( ON ?auto_271532 ?auto_271533 ) ( CLEAR ?auto_271532 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_271529 ) ( ON ?auto_271530 ?auto_271529 ) ( ON ?auto_271531 ?auto_271530 ) ( not ( = ?auto_271529 ?auto_271530 ) ) ( not ( = ?auto_271529 ?auto_271531 ) ) ( not ( = ?auto_271529 ?auto_271532 ) ) ( not ( = ?auto_271529 ?auto_271533 ) ) ( not ( = ?auto_271530 ?auto_271531 ) ) ( not ( = ?auto_271530 ?auto_271532 ) ) ( not ( = ?auto_271530 ?auto_271533 ) ) ( not ( = ?auto_271531 ?auto_271532 ) ) ( not ( = ?auto_271531 ?auto_271533 ) ) ( not ( = ?auto_271532 ?auto_271533 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_271532 ?auto_271533 )
      ( !STACK ?auto_271532 ?auto_271531 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_271538 - BLOCK
      ?auto_271539 - BLOCK
      ?auto_271540 - BLOCK
      ?auto_271541 - BLOCK
    )
    :vars
    (
      ?auto_271542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271541 ?auto_271542 ) ( ON-TABLE ?auto_271538 ) ( ON ?auto_271539 ?auto_271538 ) ( not ( = ?auto_271538 ?auto_271539 ) ) ( not ( = ?auto_271538 ?auto_271540 ) ) ( not ( = ?auto_271538 ?auto_271541 ) ) ( not ( = ?auto_271538 ?auto_271542 ) ) ( not ( = ?auto_271539 ?auto_271540 ) ) ( not ( = ?auto_271539 ?auto_271541 ) ) ( not ( = ?auto_271539 ?auto_271542 ) ) ( not ( = ?auto_271540 ?auto_271541 ) ) ( not ( = ?auto_271540 ?auto_271542 ) ) ( not ( = ?auto_271541 ?auto_271542 ) ) ( CLEAR ?auto_271539 ) ( ON ?auto_271540 ?auto_271541 ) ( CLEAR ?auto_271540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_271538 ?auto_271539 ?auto_271540 )
      ( MAKE-4PILE ?auto_271538 ?auto_271539 ?auto_271540 ?auto_271541 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_271547 - BLOCK
      ?auto_271548 - BLOCK
      ?auto_271549 - BLOCK
      ?auto_271550 - BLOCK
    )
    :vars
    (
      ?auto_271551 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271550 ?auto_271551 ) ( ON-TABLE ?auto_271547 ) ( ON ?auto_271548 ?auto_271547 ) ( not ( = ?auto_271547 ?auto_271548 ) ) ( not ( = ?auto_271547 ?auto_271549 ) ) ( not ( = ?auto_271547 ?auto_271550 ) ) ( not ( = ?auto_271547 ?auto_271551 ) ) ( not ( = ?auto_271548 ?auto_271549 ) ) ( not ( = ?auto_271548 ?auto_271550 ) ) ( not ( = ?auto_271548 ?auto_271551 ) ) ( not ( = ?auto_271549 ?auto_271550 ) ) ( not ( = ?auto_271549 ?auto_271551 ) ) ( not ( = ?auto_271550 ?auto_271551 ) ) ( CLEAR ?auto_271548 ) ( ON ?auto_271549 ?auto_271550 ) ( CLEAR ?auto_271549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_271547 ?auto_271548 ?auto_271549 )
      ( MAKE-4PILE ?auto_271547 ?auto_271548 ?auto_271549 ?auto_271550 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_271556 - BLOCK
      ?auto_271557 - BLOCK
      ?auto_271558 - BLOCK
      ?auto_271559 - BLOCK
    )
    :vars
    (
      ?auto_271560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271559 ?auto_271560 ) ( ON-TABLE ?auto_271556 ) ( not ( = ?auto_271556 ?auto_271557 ) ) ( not ( = ?auto_271556 ?auto_271558 ) ) ( not ( = ?auto_271556 ?auto_271559 ) ) ( not ( = ?auto_271556 ?auto_271560 ) ) ( not ( = ?auto_271557 ?auto_271558 ) ) ( not ( = ?auto_271557 ?auto_271559 ) ) ( not ( = ?auto_271557 ?auto_271560 ) ) ( not ( = ?auto_271558 ?auto_271559 ) ) ( not ( = ?auto_271558 ?auto_271560 ) ) ( not ( = ?auto_271559 ?auto_271560 ) ) ( ON ?auto_271558 ?auto_271559 ) ( CLEAR ?auto_271556 ) ( ON ?auto_271557 ?auto_271558 ) ( CLEAR ?auto_271557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_271556 ?auto_271557 )
      ( MAKE-4PILE ?auto_271556 ?auto_271557 ?auto_271558 ?auto_271559 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_271565 - BLOCK
      ?auto_271566 - BLOCK
      ?auto_271567 - BLOCK
      ?auto_271568 - BLOCK
    )
    :vars
    (
      ?auto_271569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271568 ?auto_271569 ) ( ON-TABLE ?auto_271565 ) ( not ( = ?auto_271565 ?auto_271566 ) ) ( not ( = ?auto_271565 ?auto_271567 ) ) ( not ( = ?auto_271565 ?auto_271568 ) ) ( not ( = ?auto_271565 ?auto_271569 ) ) ( not ( = ?auto_271566 ?auto_271567 ) ) ( not ( = ?auto_271566 ?auto_271568 ) ) ( not ( = ?auto_271566 ?auto_271569 ) ) ( not ( = ?auto_271567 ?auto_271568 ) ) ( not ( = ?auto_271567 ?auto_271569 ) ) ( not ( = ?auto_271568 ?auto_271569 ) ) ( ON ?auto_271567 ?auto_271568 ) ( CLEAR ?auto_271565 ) ( ON ?auto_271566 ?auto_271567 ) ( CLEAR ?auto_271566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_271565 ?auto_271566 )
      ( MAKE-4PILE ?auto_271565 ?auto_271566 ?auto_271567 ?auto_271568 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_271574 - BLOCK
      ?auto_271575 - BLOCK
      ?auto_271576 - BLOCK
      ?auto_271577 - BLOCK
    )
    :vars
    (
      ?auto_271578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271577 ?auto_271578 ) ( not ( = ?auto_271574 ?auto_271575 ) ) ( not ( = ?auto_271574 ?auto_271576 ) ) ( not ( = ?auto_271574 ?auto_271577 ) ) ( not ( = ?auto_271574 ?auto_271578 ) ) ( not ( = ?auto_271575 ?auto_271576 ) ) ( not ( = ?auto_271575 ?auto_271577 ) ) ( not ( = ?auto_271575 ?auto_271578 ) ) ( not ( = ?auto_271576 ?auto_271577 ) ) ( not ( = ?auto_271576 ?auto_271578 ) ) ( not ( = ?auto_271577 ?auto_271578 ) ) ( ON ?auto_271576 ?auto_271577 ) ( ON ?auto_271575 ?auto_271576 ) ( ON ?auto_271574 ?auto_271575 ) ( CLEAR ?auto_271574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_271574 )
      ( MAKE-4PILE ?auto_271574 ?auto_271575 ?auto_271576 ?auto_271577 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_271583 - BLOCK
      ?auto_271584 - BLOCK
      ?auto_271585 - BLOCK
      ?auto_271586 - BLOCK
    )
    :vars
    (
      ?auto_271587 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271586 ?auto_271587 ) ( not ( = ?auto_271583 ?auto_271584 ) ) ( not ( = ?auto_271583 ?auto_271585 ) ) ( not ( = ?auto_271583 ?auto_271586 ) ) ( not ( = ?auto_271583 ?auto_271587 ) ) ( not ( = ?auto_271584 ?auto_271585 ) ) ( not ( = ?auto_271584 ?auto_271586 ) ) ( not ( = ?auto_271584 ?auto_271587 ) ) ( not ( = ?auto_271585 ?auto_271586 ) ) ( not ( = ?auto_271585 ?auto_271587 ) ) ( not ( = ?auto_271586 ?auto_271587 ) ) ( ON ?auto_271585 ?auto_271586 ) ( ON ?auto_271584 ?auto_271585 ) ( ON ?auto_271583 ?auto_271584 ) ( CLEAR ?auto_271583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_271583 )
      ( MAKE-4PILE ?auto_271583 ?auto_271584 ?auto_271585 ?auto_271586 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_271593 - BLOCK
      ?auto_271594 - BLOCK
      ?auto_271595 - BLOCK
      ?auto_271596 - BLOCK
      ?auto_271597 - BLOCK
    )
    :vars
    (
      ?auto_271598 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_271596 ) ( ON ?auto_271597 ?auto_271598 ) ( CLEAR ?auto_271597 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_271593 ) ( ON ?auto_271594 ?auto_271593 ) ( ON ?auto_271595 ?auto_271594 ) ( ON ?auto_271596 ?auto_271595 ) ( not ( = ?auto_271593 ?auto_271594 ) ) ( not ( = ?auto_271593 ?auto_271595 ) ) ( not ( = ?auto_271593 ?auto_271596 ) ) ( not ( = ?auto_271593 ?auto_271597 ) ) ( not ( = ?auto_271593 ?auto_271598 ) ) ( not ( = ?auto_271594 ?auto_271595 ) ) ( not ( = ?auto_271594 ?auto_271596 ) ) ( not ( = ?auto_271594 ?auto_271597 ) ) ( not ( = ?auto_271594 ?auto_271598 ) ) ( not ( = ?auto_271595 ?auto_271596 ) ) ( not ( = ?auto_271595 ?auto_271597 ) ) ( not ( = ?auto_271595 ?auto_271598 ) ) ( not ( = ?auto_271596 ?auto_271597 ) ) ( not ( = ?auto_271596 ?auto_271598 ) ) ( not ( = ?auto_271597 ?auto_271598 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_271597 ?auto_271598 )
      ( !STACK ?auto_271597 ?auto_271596 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_271604 - BLOCK
      ?auto_271605 - BLOCK
      ?auto_271606 - BLOCK
      ?auto_271607 - BLOCK
      ?auto_271608 - BLOCK
    )
    :vars
    (
      ?auto_271609 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_271607 ) ( ON ?auto_271608 ?auto_271609 ) ( CLEAR ?auto_271608 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_271604 ) ( ON ?auto_271605 ?auto_271604 ) ( ON ?auto_271606 ?auto_271605 ) ( ON ?auto_271607 ?auto_271606 ) ( not ( = ?auto_271604 ?auto_271605 ) ) ( not ( = ?auto_271604 ?auto_271606 ) ) ( not ( = ?auto_271604 ?auto_271607 ) ) ( not ( = ?auto_271604 ?auto_271608 ) ) ( not ( = ?auto_271604 ?auto_271609 ) ) ( not ( = ?auto_271605 ?auto_271606 ) ) ( not ( = ?auto_271605 ?auto_271607 ) ) ( not ( = ?auto_271605 ?auto_271608 ) ) ( not ( = ?auto_271605 ?auto_271609 ) ) ( not ( = ?auto_271606 ?auto_271607 ) ) ( not ( = ?auto_271606 ?auto_271608 ) ) ( not ( = ?auto_271606 ?auto_271609 ) ) ( not ( = ?auto_271607 ?auto_271608 ) ) ( not ( = ?auto_271607 ?auto_271609 ) ) ( not ( = ?auto_271608 ?auto_271609 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_271608 ?auto_271609 )
      ( !STACK ?auto_271608 ?auto_271607 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_271615 - BLOCK
      ?auto_271616 - BLOCK
      ?auto_271617 - BLOCK
      ?auto_271618 - BLOCK
      ?auto_271619 - BLOCK
    )
    :vars
    (
      ?auto_271620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271619 ?auto_271620 ) ( ON-TABLE ?auto_271615 ) ( ON ?auto_271616 ?auto_271615 ) ( ON ?auto_271617 ?auto_271616 ) ( not ( = ?auto_271615 ?auto_271616 ) ) ( not ( = ?auto_271615 ?auto_271617 ) ) ( not ( = ?auto_271615 ?auto_271618 ) ) ( not ( = ?auto_271615 ?auto_271619 ) ) ( not ( = ?auto_271615 ?auto_271620 ) ) ( not ( = ?auto_271616 ?auto_271617 ) ) ( not ( = ?auto_271616 ?auto_271618 ) ) ( not ( = ?auto_271616 ?auto_271619 ) ) ( not ( = ?auto_271616 ?auto_271620 ) ) ( not ( = ?auto_271617 ?auto_271618 ) ) ( not ( = ?auto_271617 ?auto_271619 ) ) ( not ( = ?auto_271617 ?auto_271620 ) ) ( not ( = ?auto_271618 ?auto_271619 ) ) ( not ( = ?auto_271618 ?auto_271620 ) ) ( not ( = ?auto_271619 ?auto_271620 ) ) ( CLEAR ?auto_271617 ) ( ON ?auto_271618 ?auto_271619 ) ( CLEAR ?auto_271618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_271615 ?auto_271616 ?auto_271617 ?auto_271618 )
      ( MAKE-5PILE ?auto_271615 ?auto_271616 ?auto_271617 ?auto_271618 ?auto_271619 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_271626 - BLOCK
      ?auto_271627 - BLOCK
      ?auto_271628 - BLOCK
      ?auto_271629 - BLOCK
      ?auto_271630 - BLOCK
    )
    :vars
    (
      ?auto_271631 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271630 ?auto_271631 ) ( ON-TABLE ?auto_271626 ) ( ON ?auto_271627 ?auto_271626 ) ( ON ?auto_271628 ?auto_271627 ) ( not ( = ?auto_271626 ?auto_271627 ) ) ( not ( = ?auto_271626 ?auto_271628 ) ) ( not ( = ?auto_271626 ?auto_271629 ) ) ( not ( = ?auto_271626 ?auto_271630 ) ) ( not ( = ?auto_271626 ?auto_271631 ) ) ( not ( = ?auto_271627 ?auto_271628 ) ) ( not ( = ?auto_271627 ?auto_271629 ) ) ( not ( = ?auto_271627 ?auto_271630 ) ) ( not ( = ?auto_271627 ?auto_271631 ) ) ( not ( = ?auto_271628 ?auto_271629 ) ) ( not ( = ?auto_271628 ?auto_271630 ) ) ( not ( = ?auto_271628 ?auto_271631 ) ) ( not ( = ?auto_271629 ?auto_271630 ) ) ( not ( = ?auto_271629 ?auto_271631 ) ) ( not ( = ?auto_271630 ?auto_271631 ) ) ( CLEAR ?auto_271628 ) ( ON ?auto_271629 ?auto_271630 ) ( CLEAR ?auto_271629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_271626 ?auto_271627 ?auto_271628 ?auto_271629 )
      ( MAKE-5PILE ?auto_271626 ?auto_271627 ?auto_271628 ?auto_271629 ?auto_271630 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_271637 - BLOCK
      ?auto_271638 - BLOCK
      ?auto_271639 - BLOCK
      ?auto_271640 - BLOCK
      ?auto_271641 - BLOCK
    )
    :vars
    (
      ?auto_271642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271641 ?auto_271642 ) ( ON-TABLE ?auto_271637 ) ( ON ?auto_271638 ?auto_271637 ) ( not ( = ?auto_271637 ?auto_271638 ) ) ( not ( = ?auto_271637 ?auto_271639 ) ) ( not ( = ?auto_271637 ?auto_271640 ) ) ( not ( = ?auto_271637 ?auto_271641 ) ) ( not ( = ?auto_271637 ?auto_271642 ) ) ( not ( = ?auto_271638 ?auto_271639 ) ) ( not ( = ?auto_271638 ?auto_271640 ) ) ( not ( = ?auto_271638 ?auto_271641 ) ) ( not ( = ?auto_271638 ?auto_271642 ) ) ( not ( = ?auto_271639 ?auto_271640 ) ) ( not ( = ?auto_271639 ?auto_271641 ) ) ( not ( = ?auto_271639 ?auto_271642 ) ) ( not ( = ?auto_271640 ?auto_271641 ) ) ( not ( = ?auto_271640 ?auto_271642 ) ) ( not ( = ?auto_271641 ?auto_271642 ) ) ( ON ?auto_271640 ?auto_271641 ) ( CLEAR ?auto_271638 ) ( ON ?auto_271639 ?auto_271640 ) ( CLEAR ?auto_271639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_271637 ?auto_271638 ?auto_271639 )
      ( MAKE-5PILE ?auto_271637 ?auto_271638 ?auto_271639 ?auto_271640 ?auto_271641 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_271648 - BLOCK
      ?auto_271649 - BLOCK
      ?auto_271650 - BLOCK
      ?auto_271651 - BLOCK
      ?auto_271652 - BLOCK
    )
    :vars
    (
      ?auto_271653 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271652 ?auto_271653 ) ( ON-TABLE ?auto_271648 ) ( ON ?auto_271649 ?auto_271648 ) ( not ( = ?auto_271648 ?auto_271649 ) ) ( not ( = ?auto_271648 ?auto_271650 ) ) ( not ( = ?auto_271648 ?auto_271651 ) ) ( not ( = ?auto_271648 ?auto_271652 ) ) ( not ( = ?auto_271648 ?auto_271653 ) ) ( not ( = ?auto_271649 ?auto_271650 ) ) ( not ( = ?auto_271649 ?auto_271651 ) ) ( not ( = ?auto_271649 ?auto_271652 ) ) ( not ( = ?auto_271649 ?auto_271653 ) ) ( not ( = ?auto_271650 ?auto_271651 ) ) ( not ( = ?auto_271650 ?auto_271652 ) ) ( not ( = ?auto_271650 ?auto_271653 ) ) ( not ( = ?auto_271651 ?auto_271652 ) ) ( not ( = ?auto_271651 ?auto_271653 ) ) ( not ( = ?auto_271652 ?auto_271653 ) ) ( ON ?auto_271651 ?auto_271652 ) ( CLEAR ?auto_271649 ) ( ON ?auto_271650 ?auto_271651 ) ( CLEAR ?auto_271650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_271648 ?auto_271649 ?auto_271650 )
      ( MAKE-5PILE ?auto_271648 ?auto_271649 ?auto_271650 ?auto_271651 ?auto_271652 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_271659 - BLOCK
      ?auto_271660 - BLOCK
      ?auto_271661 - BLOCK
      ?auto_271662 - BLOCK
      ?auto_271663 - BLOCK
    )
    :vars
    (
      ?auto_271664 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271663 ?auto_271664 ) ( ON-TABLE ?auto_271659 ) ( not ( = ?auto_271659 ?auto_271660 ) ) ( not ( = ?auto_271659 ?auto_271661 ) ) ( not ( = ?auto_271659 ?auto_271662 ) ) ( not ( = ?auto_271659 ?auto_271663 ) ) ( not ( = ?auto_271659 ?auto_271664 ) ) ( not ( = ?auto_271660 ?auto_271661 ) ) ( not ( = ?auto_271660 ?auto_271662 ) ) ( not ( = ?auto_271660 ?auto_271663 ) ) ( not ( = ?auto_271660 ?auto_271664 ) ) ( not ( = ?auto_271661 ?auto_271662 ) ) ( not ( = ?auto_271661 ?auto_271663 ) ) ( not ( = ?auto_271661 ?auto_271664 ) ) ( not ( = ?auto_271662 ?auto_271663 ) ) ( not ( = ?auto_271662 ?auto_271664 ) ) ( not ( = ?auto_271663 ?auto_271664 ) ) ( ON ?auto_271662 ?auto_271663 ) ( ON ?auto_271661 ?auto_271662 ) ( CLEAR ?auto_271659 ) ( ON ?auto_271660 ?auto_271661 ) ( CLEAR ?auto_271660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_271659 ?auto_271660 )
      ( MAKE-5PILE ?auto_271659 ?auto_271660 ?auto_271661 ?auto_271662 ?auto_271663 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_271670 - BLOCK
      ?auto_271671 - BLOCK
      ?auto_271672 - BLOCK
      ?auto_271673 - BLOCK
      ?auto_271674 - BLOCK
    )
    :vars
    (
      ?auto_271675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271674 ?auto_271675 ) ( ON-TABLE ?auto_271670 ) ( not ( = ?auto_271670 ?auto_271671 ) ) ( not ( = ?auto_271670 ?auto_271672 ) ) ( not ( = ?auto_271670 ?auto_271673 ) ) ( not ( = ?auto_271670 ?auto_271674 ) ) ( not ( = ?auto_271670 ?auto_271675 ) ) ( not ( = ?auto_271671 ?auto_271672 ) ) ( not ( = ?auto_271671 ?auto_271673 ) ) ( not ( = ?auto_271671 ?auto_271674 ) ) ( not ( = ?auto_271671 ?auto_271675 ) ) ( not ( = ?auto_271672 ?auto_271673 ) ) ( not ( = ?auto_271672 ?auto_271674 ) ) ( not ( = ?auto_271672 ?auto_271675 ) ) ( not ( = ?auto_271673 ?auto_271674 ) ) ( not ( = ?auto_271673 ?auto_271675 ) ) ( not ( = ?auto_271674 ?auto_271675 ) ) ( ON ?auto_271673 ?auto_271674 ) ( ON ?auto_271672 ?auto_271673 ) ( CLEAR ?auto_271670 ) ( ON ?auto_271671 ?auto_271672 ) ( CLEAR ?auto_271671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_271670 ?auto_271671 )
      ( MAKE-5PILE ?auto_271670 ?auto_271671 ?auto_271672 ?auto_271673 ?auto_271674 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_271681 - BLOCK
      ?auto_271682 - BLOCK
      ?auto_271683 - BLOCK
      ?auto_271684 - BLOCK
      ?auto_271685 - BLOCK
    )
    :vars
    (
      ?auto_271686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271685 ?auto_271686 ) ( not ( = ?auto_271681 ?auto_271682 ) ) ( not ( = ?auto_271681 ?auto_271683 ) ) ( not ( = ?auto_271681 ?auto_271684 ) ) ( not ( = ?auto_271681 ?auto_271685 ) ) ( not ( = ?auto_271681 ?auto_271686 ) ) ( not ( = ?auto_271682 ?auto_271683 ) ) ( not ( = ?auto_271682 ?auto_271684 ) ) ( not ( = ?auto_271682 ?auto_271685 ) ) ( not ( = ?auto_271682 ?auto_271686 ) ) ( not ( = ?auto_271683 ?auto_271684 ) ) ( not ( = ?auto_271683 ?auto_271685 ) ) ( not ( = ?auto_271683 ?auto_271686 ) ) ( not ( = ?auto_271684 ?auto_271685 ) ) ( not ( = ?auto_271684 ?auto_271686 ) ) ( not ( = ?auto_271685 ?auto_271686 ) ) ( ON ?auto_271684 ?auto_271685 ) ( ON ?auto_271683 ?auto_271684 ) ( ON ?auto_271682 ?auto_271683 ) ( ON ?auto_271681 ?auto_271682 ) ( CLEAR ?auto_271681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_271681 )
      ( MAKE-5PILE ?auto_271681 ?auto_271682 ?auto_271683 ?auto_271684 ?auto_271685 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_271692 - BLOCK
      ?auto_271693 - BLOCK
      ?auto_271694 - BLOCK
      ?auto_271695 - BLOCK
      ?auto_271696 - BLOCK
    )
    :vars
    (
      ?auto_271697 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271696 ?auto_271697 ) ( not ( = ?auto_271692 ?auto_271693 ) ) ( not ( = ?auto_271692 ?auto_271694 ) ) ( not ( = ?auto_271692 ?auto_271695 ) ) ( not ( = ?auto_271692 ?auto_271696 ) ) ( not ( = ?auto_271692 ?auto_271697 ) ) ( not ( = ?auto_271693 ?auto_271694 ) ) ( not ( = ?auto_271693 ?auto_271695 ) ) ( not ( = ?auto_271693 ?auto_271696 ) ) ( not ( = ?auto_271693 ?auto_271697 ) ) ( not ( = ?auto_271694 ?auto_271695 ) ) ( not ( = ?auto_271694 ?auto_271696 ) ) ( not ( = ?auto_271694 ?auto_271697 ) ) ( not ( = ?auto_271695 ?auto_271696 ) ) ( not ( = ?auto_271695 ?auto_271697 ) ) ( not ( = ?auto_271696 ?auto_271697 ) ) ( ON ?auto_271695 ?auto_271696 ) ( ON ?auto_271694 ?auto_271695 ) ( ON ?auto_271693 ?auto_271694 ) ( ON ?auto_271692 ?auto_271693 ) ( CLEAR ?auto_271692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_271692 )
      ( MAKE-5PILE ?auto_271692 ?auto_271693 ?auto_271694 ?auto_271695 ?auto_271696 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_271704 - BLOCK
      ?auto_271705 - BLOCK
      ?auto_271706 - BLOCK
      ?auto_271707 - BLOCK
      ?auto_271708 - BLOCK
      ?auto_271709 - BLOCK
    )
    :vars
    (
      ?auto_271710 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_271708 ) ( ON ?auto_271709 ?auto_271710 ) ( CLEAR ?auto_271709 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_271704 ) ( ON ?auto_271705 ?auto_271704 ) ( ON ?auto_271706 ?auto_271705 ) ( ON ?auto_271707 ?auto_271706 ) ( ON ?auto_271708 ?auto_271707 ) ( not ( = ?auto_271704 ?auto_271705 ) ) ( not ( = ?auto_271704 ?auto_271706 ) ) ( not ( = ?auto_271704 ?auto_271707 ) ) ( not ( = ?auto_271704 ?auto_271708 ) ) ( not ( = ?auto_271704 ?auto_271709 ) ) ( not ( = ?auto_271704 ?auto_271710 ) ) ( not ( = ?auto_271705 ?auto_271706 ) ) ( not ( = ?auto_271705 ?auto_271707 ) ) ( not ( = ?auto_271705 ?auto_271708 ) ) ( not ( = ?auto_271705 ?auto_271709 ) ) ( not ( = ?auto_271705 ?auto_271710 ) ) ( not ( = ?auto_271706 ?auto_271707 ) ) ( not ( = ?auto_271706 ?auto_271708 ) ) ( not ( = ?auto_271706 ?auto_271709 ) ) ( not ( = ?auto_271706 ?auto_271710 ) ) ( not ( = ?auto_271707 ?auto_271708 ) ) ( not ( = ?auto_271707 ?auto_271709 ) ) ( not ( = ?auto_271707 ?auto_271710 ) ) ( not ( = ?auto_271708 ?auto_271709 ) ) ( not ( = ?auto_271708 ?auto_271710 ) ) ( not ( = ?auto_271709 ?auto_271710 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_271709 ?auto_271710 )
      ( !STACK ?auto_271709 ?auto_271708 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_271717 - BLOCK
      ?auto_271718 - BLOCK
      ?auto_271719 - BLOCK
      ?auto_271720 - BLOCK
      ?auto_271721 - BLOCK
      ?auto_271722 - BLOCK
    )
    :vars
    (
      ?auto_271723 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_271721 ) ( ON ?auto_271722 ?auto_271723 ) ( CLEAR ?auto_271722 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_271717 ) ( ON ?auto_271718 ?auto_271717 ) ( ON ?auto_271719 ?auto_271718 ) ( ON ?auto_271720 ?auto_271719 ) ( ON ?auto_271721 ?auto_271720 ) ( not ( = ?auto_271717 ?auto_271718 ) ) ( not ( = ?auto_271717 ?auto_271719 ) ) ( not ( = ?auto_271717 ?auto_271720 ) ) ( not ( = ?auto_271717 ?auto_271721 ) ) ( not ( = ?auto_271717 ?auto_271722 ) ) ( not ( = ?auto_271717 ?auto_271723 ) ) ( not ( = ?auto_271718 ?auto_271719 ) ) ( not ( = ?auto_271718 ?auto_271720 ) ) ( not ( = ?auto_271718 ?auto_271721 ) ) ( not ( = ?auto_271718 ?auto_271722 ) ) ( not ( = ?auto_271718 ?auto_271723 ) ) ( not ( = ?auto_271719 ?auto_271720 ) ) ( not ( = ?auto_271719 ?auto_271721 ) ) ( not ( = ?auto_271719 ?auto_271722 ) ) ( not ( = ?auto_271719 ?auto_271723 ) ) ( not ( = ?auto_271720 ?auto_271721 ) ) ( not ( = ?auto_271720 ?auto_271722 ) ) ( not ( = ?auto_271720 ?auto_271723 ) ) ( not ( = ?auto_271721 ?auto_271722 ) ) ( not ( = ?auto_271721 ?auto_271723 ) ) ( not ( = ?auto_271722 ?auto_271723 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_271722 ?auto_271723 )
      ( !STACK ?auto_271722 ?auto_271721 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_271730 - BLOCK
      ?auto_271731 - BLOCK
      ?auto_271732 - BLOCK
      ?auto_271733 - BLOCK
      ?auto_271734 - BLOCK
      ?auto_271735 - BLOCK
    )
    :vars
    (
      ?auto_271736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271735 ?auto_271736 ) ( ON-TABLE ?auto_271730 ) ( ON ?auto_271731 ?auto_271730 ) ( ON ?auto_271732 ?auto_271731 ) ( ON ?auto_271733 ?auto_271732 ) ( not ( = ?auto_271730 ?auto_271731 ) ) ( not ( = ?auto_271730 ?auto_271732 ) ) ( not ( = ?auto_271730 ?auto_271733 ) ) ( not ( = ?auto_271730 ?auto_271734 ) ) ( not ( = ?auto_271730 ?auto_271735 ) ) ( not ( = ?auto_271730 ?auto_271736 ) ) ( not ( = ?auto_271731 ?auto_271732 ) ) ( not ( = ?auto_271731 ?auto_271733 ) ) ( not ( = ?auto_271731 ?auto_271734 ) ) ( not ( = ?auto_271731 ?auto_271735 ) ) ( not ( = ?auto_271731 ?auto_271736 ) ) ( not ( = ?auto_271732 ?auto_271733 ) ) ( not ( = ?auto_271732 ?auto_271734 ) ) ( not ( = ?auto_271732 ?auto_271735 ) ) ( not ( = ?auto_271732 ?auto_271736 ) ) ( not ( = ?auto_271733 ?auto_271734 ) ) ( not ( = ?auto_271733 ?auto_271735 ) ) ( not ( = ?auto_271733 ?auto_271736 ) ) ( not ( = ?auto_271734 ?auto_271735 ) ) ( not ( = ?auto_271734 ?auto_271736 ) ) ( not ( = ?auto_271735 ?auto_271736 ) ) ( CLEAR ?auto_271733 ) ( ON ?auto_271734 ?auto_271735 ) ( CLEAR ?auto_271734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_271730 ?auto_271731 ?auto_271732 ?auto_271733 ?auto_271734 )
      ( MAKE-6PILE ?auto_271730 ?auto_271731 ?auto_271732 ?auto_271733 ?auto_271734 ?auto_271735 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_271743 - BLOCK
      ?auto_271744 - BLOCK
      ?auto_271745 - BLOCK
      ?auto_271746 - BLOCK
      ?auto_271747 - BLOCK
      ?auto_271748 - BLOCK
    )
    :vars
    (
      ?auto_271749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271748 ?auto_271749 ) ( ON-TABLE ?auto_271743 ) ( ON ?auto_271744 ?auto_271743 ) ( ON ?auto_271745 ?auto_271744 ) ( ON ?auto_271746 ?auto_271745 ) ( not ( = ?auto_271743 ?auto_271744 ) ) ( not ( = ?auto_271743 ?auto_271745 ) ) ( not ( = ?auto_271743 ?auto_271746 ) ) ( not ( = ?auto_271743 ?auto_271747 ) ) ( not ( = ?auto_271743 ?auto_271748 ) ) ( not ( = ?auto_271743 ?auto_271749 ) ) ( not ( = ?auto_271744 ?auto_271745 ) ) ( not ( = ?auto_271744 ?auto_271746 ) ) ( not ( = ?auto_271744 ?auto_271747 ) ) ( not ( = ?auto_271744 ?auto_271748 ) ) ( not ( = ?auto_271744 ?auto_271749 ) ) ( not ( = ?auto_271745 ?auto_271746 ) ) ( not ( = ?auto_271745 ?auto_271747 ) ) ( not ( = ?auto_271745 ?auto_271748 ) ) ( not ( = ?auto_271745 ?auto_271749 ) ) ( not ( = ?auto_271746 ?auto_271747 ) ) ( not ( = ?auto_271746 ?auto_271748 ) ) ( not ( = ?auto_271746 ?auto_271749 ) ) ( not ( = ?auto_271747 ?auto_271748 ) ) ( not ( = ?auto_271747 ?auto_271749 ) ) ( not ( = ?auto_271748 ?auto_271749 ) ) ( CLEAR ?auto_271746 ) ( ON ?auto_271747 ?auto_271748 ) ( CLEAR ?auto_271747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_271743 ?auto_271744 ?auto_271745 ?auto_271746 ?auto_271747 )
      ( MAKE-6PILE ?auto_271743 ?auto_271744 ?auto_271745 ?auto_271746 ?auto_271747 ?auto_271748 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_271756 - BLOCK
      ?auto_271757 - BLOCK
      ?auto_271758 - BLOCK
      ?auto_271759 - BLOCK
      ?auto_271760 - BLOCK
      ?auto_271761 - BLOCK
    )
    :vars
    (
      ?auto_271762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271761 ?auto_271762 ) ( ON-TABLE ?auto_271756 ) ( ON ?auto_271757 ?auto_271756 ) ( ON ?auto_271758 ?auto_271757 ) ( not ( = ?auto_271756 ?auto_271757 ) ) ( not ( = ?auto_271756 ?auto_271758 ) ) ( not ( = ?auto_271756 ?auto_271759 ) ) ( not ( = ?auto_271756 ?auto_271760 ) ) ( not ( = ?auto_271756 ?auto_271761 ) ) ( not ( = ?auto_271756 ?auto_271762 ) ) ( not ( = ?auto_271757 ?auto_271758 ) ) ( not ( = ?auto_271757 ?auto_271759 ) ) ( not ( = ?auto_271757 ?auto_271760 ) ) ( not ( = ?auto_271757 ?auto_271761 ) ) ( not ( = ?auto_271757 ?auto_271762 ) ) ( not ( = ?auto_271758 ?auto_271759 ) ) ( not ( = ?auto_271758 ?auto_271760 ) ) ( not ( = ?auto_271758 ?auto_271761 ) ) ( not ( = ?auto_271758 ?auto_271762 ) ) ( not ( = ?auto_271759 ?auto_271760 ) ) ( not ( = ?auto_271759 ?auto_271761 ) ) ( not ( = ?auto_271759 ?auto_271762 ) ) ( not ( = ?auto_271760 ?auto_271761 ) ) ( not ( = ?auto_271760 ?auto_271762 ) ) ( not ( = ?auto_271761 ?auto_271762 ) ) ( ON ?auto_271760 ?auto_271761 ) ( CLEAR ?auto_271758 ) ( ON ?auto_271759 ?auto_271760 ) ( CLEAR ?auto_271759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_271756 ?auto_271757 ?auto_271758 ?auto_271759 )
      ( MAKE-6PILE ?auto_271756 ?auto_271757 ?auto_271758 ?auto_271759 ?auto_271760 ?auto_271761 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_271769 - BLOCK
      ?auto_271770 - BLOCK
      ?auto_271771 - BLOCK
      ?auto_271772 - BLOCK
      ?auto_271773 - BLOCK
      ?auto_271774 - BLOCK
    )
    :vars
    (
      ?auto_271775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271774 ?auto_271775 ) ( ON-TABLE ?auto_271769 ) ( ON ?auto_271770 ?auto_271769 ) ( ON ?auto_271771 ?auto_271770 ) ( not ( = ?auto_271769 ?auto_271770 ) ) ( not ( = ?auto_271769 ?auto_271771 ) ) ( not ( = ?auto_271769 ?auto_271772 ) ) ( not ( = ?auto_271769 ?auto_271773 ) ) ( not ( = ?auto_271769 ?auto_271774 ) ) ( not ( = ?auto_271769 ?auto_271775 ) ) ( not ( = ?auto_271770 ?auto_271771 ) ) ( not ( = ?auto_271770 ?auto_271772 ) ) ( not ( = ?auto_271770 ?auto_271773 ) ) ( not ( = ?auto_271770 ?auto_271774 ) ) ( not ( = ?auto_271770 ?auto_271775 ) ) ( not ( = ?auto_271771 ?auto_271772 ) ) ( not ( = ?auto_271771 ?auto_271773 ) ) ( not ( = ?auto_271771 ?auto_271774 ) ) ( not ( = ?auto_271771 ?auto_271775 ) ) ( not ( = ?auto_271772 ?auto_271773 ) ) ( not ( = ?auto_271772 ?auto_271774 ) ) ( not ( = ?auto_271772 ?auto_271775 ) ) ( not ( = ?auto_271773 ?auto_271774 ) ) ( not ( = ?auto_271773 ?auto_271775 ) ) ( not ( = ?auto_271774 ?auto_271775 ) ) ( ON ?auto_271773 ?auto_271774 ) ( CLEAR ?auto_271771 ) ( ON ?auto_271772 ?auto_271773 ) ( CLEAR ?auto_271772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_271769 ?auto_271770 ?auto_271771 ?auto_271772 )
      ( MAKE-6PILE ?auto_271769 ?auto_271770 ?auto_271771 ?auto_271772 ?auto_271773 ?auto_271774 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_271782 - BLOCK
      ?auto_271783 - BLOCK
      ?auto_271784 - BLOCK
      ?auto_271785 - BLOCK
      ?auto_271786 - BLOCK
      ?auto_271787 - BLOCK
    )
    :vars
    (
      ?auto_271788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271787 ?auto_271788 ) ( ON-TABLE ?auto_271782 ) ( ON ?auto_271783 ?auto_271782 ) ( not ( = ?auto_271782 ?auto_271783 ) ) ( not ( = ?auto_271782 ?auto_271784 ) ) ( not ( = ?auto_271782 ?auto_271785 ) ) ( not ( = ?auto_271782 ?auto_271786 ) ) ( not ( = ?auto_271782 ?auto_271787 ) ) ( not ( = ?auto_271782 ?auto_271788 ) ) ( not ( = ?auto_271783 ?auto_271784 ) ) ( not ( = ?auto_271783 ?auto_271785 ) ) ( not ( = ?auto_271783 ?auto_271786 ) ) ( not ( = ?auto_271783 ?auto_271787 ) ) ( not ( = ?auto_271783 ?auto_271788 ) ) ( not ( = ?auto_271784 ?auto_271785 ) ) ( not ( = ?auto_271784 ?auto_271786 ) ) ( not ( = ?auto_271784 ?auto_271787 ) ) ( not ( = ?auto_271784 ?auto_271788 ) ) ( not ( = ?auto_271785 ?auto_271786 ) ) ( not ( = ?auto_271785 ?auto_271787 ) ) ( not ( = ?auto_271785 ?auto_271788 ) ) ( not ( = ?auto_271786 ?auto_271787 ) ) ( not ( = ?auto_271786 ?auto_271788 ) ) ( not ( = ?auto_271787 ?auto_271788 ) ) ( ON ?auto_271786 ?auto_271787 ) ( ON ?auto_271785 ?auto_271786 ) ( CLEAR ?auto_271783 ) ( ON ?auto_271784 ?auto_271785 ) ( CLEAR ?auto_271784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_271782 ?auto_271783 ?auto_271784 )
      ( MAKE-6PILE ?auto_271782 ?auto_271783 ?auto_271784 ?auto_271785 ?auto_271786 ?auto_271787 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_271795 - BLOCK
      ?auto_271796 - BLOCK
      ?auto_271797 - BLOCK
      ?auto_271798 - BLOCK
      ?auto_271799 - BLOCK
      ?auto_271800 - BLOCK
    )
    :vars
    (
      ?auto_271801 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271800 ?auto_271801 ) ( ON-TABLE ?auto_271795 ) ( ON ?auto_271796 ?auto_271795 ) ( not ( = ?auto_271795 ?auto_271796 ) ) ( not ( = ?auto_271795 ?auto_271797 ) ) ( not ( = ?auto_271795 ?auto_271798 ) ) ( not ( = ?auto_271795 ?auto_271799 ) ) ( not ( = ?auto_271795 ?auto_271800 ) ) ( not ( = ?auto_271795 ?auto_271801 ) ) ( not ( = ?auto_271796 ?auto_271797 ) ) ( not ( = ?auto_271796 ?auto_271798 ) ) ( not ( = ?auto_271796 ?auto_271799 ) ) ( not ( = ?auto_271796 ?auto_271800 ) ) ( not ( = ?auto_271796 ?auto_271801 ) ) ( not ( = ?auto_271797 ?auto_271798 ) ) ( not ( = ?auto_271797 ?auto_271799 ) ) ( not ( = ?auto_271797 ?auto_271800 ) ) ( not ( = ?auto_271797 ?auto_271801 ) ) ( not ( = ?auto_271798 ?auto_271799 ) ) ( not ( = ?auto_271798 ?auto_271800 ) ) ( not ( = ?auto_271798 ?auto_271801 ) ) ( not ( = ?auto_271799 ?auto_271800 ) ) ( not ( = ?auto_271799 ?auto_271801 ) ) ( not ( = ?auto_271800 ?auto_271801 ) ) ( ON ?auto_271799 ?auto_271800 ) ( ON ?auto_271798 ?auto_271799 ) ( CLEAR ?auto_271796 ) ( ON ?auto_271797 ?auto_271798 ) ( CLEAR ?auto_271797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_271795 ?auto_271796 ?auto_271797 )
      ( MAKE-6PILE ?auto_271795 ?auto_271796 ?auto_271797 ?auto_271798 ?auto_271799 ?auto_271800 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_271808 - BLOCK
      ?auto_271809 - BLOCK
      ?auto_271810 - BLOCK
      ?auto_271811 - BLOCK
      ?auto_271812 - BLOCK
      ?auto_271813 - BLOCK
    )
    :vars
    (
      ?auto_271814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271813 ?auto_271814 ) ( ON-TABLE ?auto_271808 ) ( not ( = ?auto_271808 ?auto_271809 ) ) ( not ( = ?auto_271808 ?auto_271810 ) ) ( not ( = ?auto_271808 ?auto_271811 ) ) ( not ( = ?auto_271808 ?auto_271812 ) ) ( not ( = ?auto_271808 ?auto_271813 ) ) ( not ( = ?auto_271808 ?auto_271814 ) ) ( not ( = ?auto_271809 ?auto_271810 ) ) ( not ( = ?auto_271809 ?auto_271811 ) ) ( not ( = ?auto_271809 ?auto_271812 ) ) ( not ( = ?auto_271809 ?auto_271813 ) ) ( not ( = ?auto_271809 ?auto_271814 ) ) ( not ( = ?auto_271810 ?auto_271811 ) ) ( not ( = ?auto_271810 ?auto_271812 ) ) ( not ( = ?auto_271810 ?auto_271813 ) ) ( not ( = ?auto_271810 ?auto_271814 ) ) ( not ( = ?auto_271811 ?auto_271812 ) ) ( not ( = ?auto_271811 ?auto_271813 ) ) ( not ( = ?auto_271811 ?auto_271814 ) ) ( not ( = ?auto_271812 ?auto_271813 ) ) ( not ( = ?auto_271812 ?auto_271814 ) ) ( not ( = ?auto_271813 ?auto_271814 ) ) ( ON ?auto_271812 ?auto_271813 ) ( ON ?auto_271811 ?auto_271812 ) ( ON ?auto_271810 ?auto_271811 ) ( CLEAR ?auto_271808 ) ( ON ?auto_271809 ?auto_271810 ) ( CLEAR ?auto_271809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_271808 ?auto_271809 )
      ( MAKE-6PILE ?auto_271808 ?auto_271809 ?auto_271810 ?auto_271811 ?auto_271812 ?auto_271813 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_271821 - BLOCK
      ?auto_271822 - BLOCK
      ?auto_271823 - BLOCK
      ?auto_271824 - BLOCK
      ?auto_271825 - BLOCK
      ?auto_271826 - BLOCK
    )
    :vars
    (
      ?auto_271827 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271826 ?auto_271827 ) ( ON-TABLE ?auto_271821 ) ( not ( = ?auto_271821 ?auto_271822 ) ) ( not ( = ?auto_271821 ?auto_271823 ) ) ( not ( = ?auto_271821 ?auto_271824 ) ) ( not ( = ?auto_271821 ?auto_271825 ) ) ( not ( = ?auto_271821 ?auto_271826 ) ) ( not ( = ?auto_271821 ?auto_271827 ) ) ( not ( = ?auto_271822 ?auto_271823 ) ) ( not ( = ?auto_271822 ?auto_271824 ) ) ( not ( = ?auto_271822 ?auto_271825 ) ) ( not ( = ?auto_271822 ?auto_271826 ) ) ( not ( = ?auto_271822 ?auto_271827 ) ) ( not ( = ?auto_271823 ?auto_271824 ) ) ( not ( = ?auto_271823 ?auto_271825 ) ) ( not ( = ?auto_271823 ?auto_271826 ) ) ( not ( = ?auto_271823 ?auto_271827 ) ) ( not ( = ?auto_271824 ?auto_271825 ) ) ( not ( = ?auto_271824 ?auto_271826 ) ) ( not ( = ?auto_271824 ?auto_271827 ) ) ( not ( = ?auto_271825 ?auto_271826 ) ) ( not ( = ?auto_271825 ?auto_271827 ) ) ( not ( = ?auto_271826 ?auto_271827 ) ) ( ON ?auto_271825 ?auto_271826 ) ( ON ?auto_271824 ?auto_271825 ) ( ON ?auto_271823 ?auto_271824 ) ( CLEAR ?auto_271821 ) ( ON ?auto_271822 ?auto_271823 ) ( CLEAR ?auto_271822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_271821 ?auto_271822 )
      ( MAKE-6PILE ?auto_271821 ?auto_271822 ?auto_271823 ?auto_271824 ?auto_271825 ?auto_271826 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_271834 - BLOCK
      ?auto_271835 - BLOCK
      ?auto_271836 - BLOCK
      ?auto_271837 - BLOCK
      ?auto_271838 - BLOCK
      ?auto_271839 - BLOCK
    )
    :vars
    (
      ?auto_271840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271839 ?auto_271840 ) ( not ( = ?auto_271834 ?auto_271835 ) ) ( not ( = ?auto_271834 ?auto_271836 ) ) ( not ( = ?auto_271834 ?auto_271837 ) ) ( not ( = ?auto_271834 ?auto_271838 ) ) ( not ( = ?auto_271834 ?auto_271839 ) ) ( not ( = ?auto_271834 ?auto_271840 ) ) ( not ( = ?auto_271835 ?auto_271836 ) ) ( not ( = ?auto_271835 ?auto_271837 ) ) ( not ( = ?auto_271835 ?auto_271838 ) ) ( not ( = ?auto_271835 ?auto_271839 ) ) ( not ( = ?auto_271835 ?auto_271840 ) ) ( not ( = ?auto_271836 ?auto_271837 ) ) ( not ( = ?auto_271836 ?auto_271838 ) ) ( not ( = ?auto_271836 ?auto_271839 ) ) ( not ( = ?auto_271836 ?auto_271840 ) ) ( not ( = ?auto_271837 ?auto_271838 ) ) ( not ( = ?auto_271837 ?auto_271839 ) ) ( not ( = ?auto_271837 ?auto_271840 ) ) ( not ( = ?auto_271838 ?auto_271839 ) ) ( not ( = ?auto_271838 ?auto_271840 ) ) ( not ( = ?auto_271839 ?auto_271840 ) ) ( ON ?auto_271838 ?auto_271839 ) ( ON ?auto_271837 ?auto_271838 ) ( ON ?auto_271836 ?auto_271837 ) ( ON ?auto_271835 ?auto_271836 ) ( ON ?auto_271834 ?auto_271835 ) ( CLEAR ?auto_271834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_271834 )
      ( MAKE-6PILE ?auto_271834 ?auto_271835 ?auto_271836 ?auto_271837 ?auto_271838 ?auto_271839 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_271847 - BLOCK
      ?auto_271848 - BLOCK
      ?auto_271849 - BLOCK
      ?auto_271850 - BLOCK
      ?auto_271851 - BLOCK
      ?auto_271852 - BLOCK
    )
    :vars
    (
      ?auto_271853 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271852 ?auto_271853 ) ( not ( = ?auto_271847 ?auto_271848 ) ) ( not ( = ?auto_271847 ?auto_271849 ) ) ( not ( = ?auto_271847 ?auto_271850 ) ) ( not ( = ?auto_271847 ?auto_271851 ) ) ( not ( = ?auto_271847 ?auto_271852 ) ) ( not ( = ?auto_271847 ?auto_271853 ) ) ( not ( = ?auto_271848 ?auto_271849 ) ) ( not ( = ?auto_271848 ?auto_271850 ) ) ( not ( = ?auto_271848 ?auto_271851 ) ) ( not ( = ?auto_271848 ?auto_271852 ) ) ( not ( = ?auto_271848 ?auto_271853 ) ) ( not ( = ?auto_271849 ?auto_271850 ) ) ( not ( = ?auto_271849 ?auto_271851 ) ) ( not ( = ?auto_271849 ?auto_271852 ) ) ( not ( = ?auto_271849 ?auto_271853 ) ) ( not ( = ?auto_271850 ?auto_271851 ) ) ( not ( = ?auto_271850 ?auto_271852 ) ) ( not ( = ?auto_271850 ?auto_271853 ) ) ( not ( = ?auto_271851 ?auto_271852 ) ) ( not ( = ?auto_271851 ?auto_271853 ) ) ( not ( = ?auto_271852 ?auto_271853 ) ) ( ON ?auto_271851 ?auto_271852 ) ( ON ?auto_271850 ?auto_271851 ) ( ON ?auto_271849 ?auto_271850 ) ( ON ?auto_271848 ?auto_271849 ) ( ON ?auto_271847 ?auto_271848 ) ( CLEAR ?auto_271847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_271847 )
      ( MAKE-6PILE ?auto_271847 ?auto_271848 ?auto_271849 ?auto_271850 ?auto_271851 ?auto_271852 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_271861 - BLOCK
      ?auto_271862 - BLOCK
      ?auto_271863 - BLOCK
      ?auto_271864 - BLOCK
      ?auto_271865 - BLOCK
      ?auto_271866 - BLOCK
      ?auto_271867 - BLOCK
    )
    :vars
    (
      ?auto_271868 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_271866 ) ( ON ?auto_271867 ?auto_271868 ) ( CLEAR ?auto_271867 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_271861 ) ( ON ?auto_271862 ?auto_271861 ) ( ON ?auto_271863 ?auto_271862 ) ( ON ?auto_271864 ?auto_271863 ) ( ON ?auto_271865 ?auto_271864 ) ( ON ?auto_271866 ?auto_271865 ) ( not ( = ?auto_271861 ?auto_271862 ) ) ( not ( = ?auto_271861 ?auto_271863 ) ) ( not ( = ?auto_271861 ?auto_271864 ) ) ( not ( = ?auto_271861 ?auto_271865 ) ) ( not ( = ?auto_271861 ?auto_271866 ) ) ( not ( = ?auto_271861 ?auto_271867 ) ) ( not ( = ?auto_271861 ?auto_271868 ) ) ( not ( = ?auto_271862 ?auto_271863 ) ) ( not ( = ?auto_271862 ?auto_271864 ) ) ( not ( = ?auto_271862 ?auto_271865 ) ) ( not ( = ?auto_271862 ?auto_271866 ) ) ( not ( = ?auto_271862 ?auto_271867 ) ) ( not ( = ?auto_271862 ?auto_271868 ) ) ( not ( = ?auto_271863 ?auto_271864 ) ) ( not ( = ?auto_271863 ?auto_271865 ) ) ( not ( = ?auto_271863 ?auto_271866 ) ) ( not ( = ?auto_271863 ?auto_271867 ) ) ( not ( = ?auto_271863 ?auto_271868 ) ) ( not ( = ?auto_271864 ?auto_271865 ) ) ( not ( = ?auto_271864 ?auto_271866 ) ) ( not ( = ?auto_271864 ?auto_271867 ) ) ( not ( = ?auto_271864 ?auto_271868 ) ) ( not ( = ?auto_271865 ?auto_271866 ) ) ( not ( = ?auto_271865 ?auto_271867 ) ) ( not ( = ?auto_271865 ?auto_271868 ) ) ( not ( = ?auto_271866 ?auto_271867 ) ) ( not ( = ?auto_271866 ?auto_271868 ) ) ( not ( = ?auto_271867 ?auto_271868 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_271867 ?auto_271868 )
      ( !STACK ?auto_271867 ?auto_271866 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_271876 - BLOCK
      ?auto_271877 - BLOCK
      ?auto_271878 - BLOCK
      ?auto_271879 - BLOCK
      ?auto_271880 - BLOCK
      ?auto_271881 - BLOCK
      ?auto_271882 - BLOCK
    )
    :vars
    (
      ?auto_271883 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_271881 ) ( ON ?auto_271882 ?auto_271883 ) ( CLEAR ?auto_271882 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_271876 ) ( ON ?auto_271877 ?auto_271876 ) ( ON ?auto_271878 ?auto_271877 ) ( ON ?auto_271879 ?auto_271878 ) ( ON ?auto_271880 ?auto_271879 ) ( ON ?auto_271881 ?auto_271880 ) ( not ( = ?auto_271876 ?auto_271877 ) ) ( not ( = ?auto_271876 ?auto_271878 ) ) ( not ( = ?auto_271876 ?auto_271879 ) ) ( not ( = ?auto_271876 ?auto_271880 ) ) ( not ( = ?auto_271876 ?auto_271881 ) ) ( not ( = ?auto_271876 ?auto_271882 ) ) ( not ( = ?auto_271876 ?auto_271883 ) ) ( not ( = ?auto_271877 ?auto_271878 ) ) ( not ( = ?auto_271877 ?auto_271879 ) ) ( not ( = ?auto_271877 ?auto_271880 ) ) ( not ( = ?auto_271877 ?auto_271881 ) ) ( not ( = ?auto_271877 ?auto_271882 ) ) ( not ( = ?auto_271877 ?auto_271883 ) ) ( not ( = ?auto_271878 ?auto_271879 ) ) ( not ( = ?auto_271878 ?auto_271880 ) ) ( not ( = ?auto_271878 ?auto_271881 ) ) ( not ( = ?auto_271878 ?auto_271882 ) ) ( not ( = ?auto_271878 ?auto_271883 ) ) ( not ( = ?auto_271879 ?auto_271880 ) ) ( not ( = ?auto_271879 ?auto_271881 ) ) ( not ( = ?auto_271879 ?auto_271882 ) ) ( not ( = ?auto_271879 ?auto_271883 ) ) ( not ( = ?auto_271880 ?auto_271881 ) ) ( not ( = ?auto_271880 ?auto_271882 ) ) ( not ( = ?auto_271880 ?auto_271883 ) ) ( not ( = ?auto_271881 ?auto_271882 ) ) ( not ( = ?auto_271881 ?auto_271883 ) ) ( not ( = ?auto_271882 ?auto_271883 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_271882 ?auto_271883 )
      ( !STACK ?auto_271882 ?auto_271881 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_271891 - BLOCK
      ?auto_271892 - BLOCK
      ?auto_271893 - BLOCK
      ?auto_271894 - BLOCK
      ?auto_271895 - BLOCK
      ?auto_271896 - BLOCK
      ?auto_271897 - BLOCK
    )
    :vars
    (
      ?auto_271898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271897 ?auto_271898 ) ( ON-TABLE ?auto_271891 ) ( ON ?auto_271892 ?auto_271891 ) ( ON ?auto_271893 ?auto_271892 ) ( ON ?auto_271894 ?auto_271893 ) ( ON ?auto_271895 ?auto_271894 ) ( not ( = ?auto_271891 ?auto_271892 ) ) ( not ( = ?auto_271891 ?auto_271893 ) ) ( not ( = ?auto_271891 ?auto_271894 ) ) ( not ( = ?auto_271891 ?auto_271895 ) ) ( not ( = ?auto_271891 ?auto_271896 ) ) ( not ( = ?auto_271891 ?auto_271897 ) ) ( not ( = ?auto_271891 ?auto_271898 ) ) ( not ( = ?auto_271892 ?auto_271893 ) ) ( not ( = ?auto_271892 ?auto_271894 ) ) ( not ( = ?auto_271892 ?auto_271895 ) ) ( not ( = ?auto_271892 ?auto_271896 ) ) ( not ( = ?auto_271892 ?auto_271897 ) ) ( not ( = ?auto_271892 ?auto_271898 ) ) ( not ( = ?auto_271893 ?auto_271894 ) ) ( not ( = ?auto_271893 ?auto_271895 ) ) ( not ( = ?auto_271893 ?auto_271896 ) ) ( not ( = ?auto_271893 ?auto_271897 ) ) ( not ( = ?auto_271893 ?auto_271898 ) ) ( not ( = ?auto_271894 ?auto_271895 ) ) ( not ( = ?auto_271894 ?auto_271896 ) ) ( not ( = ?auto_271894 ?auto_271897 ) ) ( not ( = ?auto_271894 ?auto_271898 ) ) ( not ( = ?auto_271895 ?auto_271896 ) ) ( not ( = ?auto_271895 ?auto_271897 ) ) ( not ( = ?auto_271895 ?auto_271898 ) ) ( not ( = ?auto_271896 ?auto_271897 ) ) ( not ( = ?auto_271896 ?auto_271898 ) ) ( not ( = ?auto_271897 ?auto_271898 ) ) ( CLEAR ?auto_271895 ) ( ON ?auto_271896 ?auto_271897 ) ( CLEAR ?auto_271896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_271891 ?auto_271892 ?auto_271893 ?auto_271894 ?auto_271895 ?auto_271896 )
      ( MAKE-7PILE ?auto_271891 ?auto_271892 ?auto_271893 ?auto_271894 ?auto_271895 ?auto_271896 ?auto_271897 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_271906 - BLOCK
      ?auto_271907 - BLOCK
      ?auto_271908 - BLOCK
      ?auto_271909 - BLOCK
      ?auto_271910 - BLOCK
      ?auto_271911 - BLOCK
      ?auto_271912 - BLOCK
    )
    :vars
    (
      ?auto_271913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271912 ?auto_271913 ) ( ON-TABLE ?auto_271906 ) ( ON ?auto_271907 ?auto_271906 ) ( ON ?auto_271908 ?auto_271907 ) ( ON ?auto_271909 ?auto_271908 ) ( ON ?auto_271910 ?auto_271909 ) ( not ( = ?auto_271906 ?auto_271907 ) ) ( not ( = ?auto_271906 ?auto_271908 ) ) ( not ( = ?auto_271906 ?auto_271909 ) ) ( not ( = ?auto_271906 ?auto_271910 ) ) ( not ( = ?auto_271906 ?auto_271911 ) ) ( not ( = ?auto_271906 ?auto_271912 ) ) ( not ( = ?auto_271906 ?auto_271913 ) ) ( not ( = ?auto_271907 ?auto_271908 ) ) ( not ( = ?auto_271907 ?auto_271909 ) ) ( not ( = ?auto_271907 ?auto_271910 ) ) ( not ( = ?auto_271907 ?auto_271911 ) ) ( not ( = ?auto_271907 ?auto_271912 ) ) ( not ( = ?auto_271907 ?auto_271913 ) ) ( not ( = ?auto_271908 ?auto_271909 ) ) ( not ( = ?auto_271908 ?auto_271910 ) ) ( not ( = ?auto_271908 ?auto_271911 ) ) ( not ( = ?auto_271908 ?auto_271912 ) ) ( not ( = ?auto_271908 ?auto_271913 ) ) ( not ( = ?auto_271909 ?auto_271910 ) ) ( not ( = ?auto_271909 ?auto_271911 ) ) ( not ( = ?auto_271909 ?auto_271912 ) ) ( not ( = ?auto_271909 ?auto_271913 ) ) ( not ( = ?auto_271910 ?auto_271911 ) ) ( not ( = ?auto_271910 ?auto_271912 ) ) ( not ( = ?auto_271910 ?auto_271913 ) ) ( not ( = ?auto_271911 ?auto_271912 ) ) ( not ( = ?auto_271911 ?auto_271913 ) ) ( not ( = ?auto_271912 ?auto_271913 ) ) ( CLEAR ?auto_271910 ) ( ON ?auto_271911 ?auto_271912 ) ( CLEAR ?auto_271911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_271906 ?auto_271907 ?auto_271908 ?auto_271909 ?auto_271910 ?auto_271911 )
      ( MAKE-7PILE ?auto_271906 ?auto_271907 ?auto_271908 ?auto_271909 ?auto_271910 ?auto_271911 ?auto_271912 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_271921 - BLOCK
      ?auto_271922 - BLOCK
      ?auto_271923 - BLOCK
      ?auto_271924 - BLOCK
      ?auto_271925 - BLOCK
      ?auto_271926 - BLOCK
      ?auto_271927 - BLOCK
    )
    :vars
    (
      ?auto_271928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271927 ?auto_271928 ) ( ON-TABLE ?auto_271921 ) ( ON ?auto_271922 ?auto_271921 ) ( ON ?auto_271923 ?auto_271922 ) ( ON ?auto_271924 ?auto_271923 ) ( not ( = ?auto_271921 ?auto_271922 ) ) ( not ( = ?auto_271921 ?auto_271923 ) ) ( not ( = ?auto_271921 ?auto_271924 ) ) ( not ( = ?auto_271921 ?auto_271925 ) ) ( not ( = ?auto_271921 ?auto_271926 ) ) ( not ( = ?auto_271921 ?auto_271927 ) ) ( not ( = ?auto_271921 ?auto_271928 ) ) ( not ( = ?auto_271922 ?auto_271923 ) ) ( not ( = ?auto_271922 ?auto_271924 ) ) ( not ( = ?auto_271922 ?auto_271925 ) ) ( not ( = ?auto_271922 ?auto_271926 ) ) ( not ( = ?auto_271922 ?auto_271927 ) ) ( not ( = ?auto_271922 ?auto_271928 ) ) ( not ( = ?auto_271923 ?auto_271924 ) ) ( not ( = ?auto_271923 ?auto_271925 ) ) ( not ( = ?auto_271923 ?auto_271926 ) ) ( not ( = ?auto_271923 ?auto_271927 ) ) ( not ( = ?auto_271923 ?auto_271928 ) ) ( not ( = ?auto_271924 ?auto_271925 ) ) ( not ( = ?auto_271924 ?auto_271926 ) ) ( not ( = ?auto_271924 ?auto_271927 ) ) ( not ( = ?auto_271924 ?auto_271928 ) ) ( not ( = ?auto_271925 ?auto_271926 ) ) ( not ( = ?auto_271925 ?auto_271927 ) ) ( not ( = ?auto_271925 ?auto_271928 ) ) ( not ( = ?auto_271926 ?auto_271927 ) ) ( not ( = ?auto_271926 ?auto_271928 ) ) ( not ( = ?auto_271927 ?auto_271928 ) ) ( ON ?auto_271926 ?auto_271927 ) ( CLEAR ?auto_271924 ) ( ON ?auto_271925 ?auto_271926 ) ( CLEAR ?auto_271925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_271921 ?auto_271922 ?auto_271923 ?auto_271924 ?auto_271925 )
      ( MAKE-7PILE ?auto_271921 ?auto_271922 ?auto_271923 ?auto_271924 ?auto_271925 ?auto_271926 ?auto_271927 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_271936 - BLOCK
      ?auto_271937 - BLOCK
      ?auto_271938 - BLOCK
      ?auto_271939 - BLOCK
      ?auto_271940 - BLOCK
      ?auto_271941 - BLOCK
      ?auto_271942 - BLOCK
    )
    :vars
    (
      ?auto_271943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271942 ?auto_271943 ) ( ON-TABLE ?auto_271936 ) ( ON ?auto_271937 ?auto_271936 ) ( ON ?auto_271938 ?auto_271937 ) ( ON ?auto_271939 ?auto_271938 ) ( not ( = ?auto_271936 ?auto_271937 ) ) ( not ( = ?auto_271936 ?auto_271938 ) ) ( not ( = ?auto_271936 ?auto_271939 ) ) ( not ( = ?auto_271936 ?auto_271940 ) ) ( not ( = ?auto_271936 ?auto_271941 ) ) ( not ( = ?auto_271936 ?auto_271942 ) ) ( not ( = ?auto_271936 ?auto_271943 ) ) ( not ( = ?auto_271937 ?auto_271938 ) ) ( not ( = ?auto_271937 ?auto_271939 ) ) ( not ( = ?auto_271937 ?auto_271940 ) ) ( not ( = ?auto_271937 ?auto_271941 ) ) ( not ( = ?auto_271937 ?auto_271942 ) ) ( not ( = ?auto_271937 ?auto_271943 ) ) ( not ( = ?auto_271938 ?auto_271939 ) ) ( not ( = ?auto_271938 ?auto_271940 ) ) ( not ( = ?auto_271938 ?auto_271941 ) ) ( not ( = ?auto_271938 ?auto_271942 ) ) ( not ( = ?auto_271938 ?auto_271943 ) ) ( not ( = ?auto_271939 ?auto_271940 ) ) ( not ( = ?auto_271939 ?auto_271941 ) ) ( not ( = ?auto_271939 ?auto_271942 ) ) ( not ( = ?auto_271939 ?auto_271943 ) ) ( not ( = ?auto_271940 ?auto_271941 ) ) ( not ( = ?auto_271940 ?auto_271942 ) ) ( not ( = ?auto_271940 ?auto_271943 ) ) ( not ( = ?auto_271941 ?auto_271942 ) ) ( not ( = ?auto_271941 ?auto_271943 ) ) ( not ( = ?auto_271942 ?auto_271943 ) ) ( ON ?auto_271941 ?auto_271942 ) ( CLEAR ?auto_271939 ) ( ON ?auto_271940 ?auto_271941 ) ( CLEAR ?auto_271940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_271936 ?auto_271937 ?auto_271938 ?auto_271939 ?auto_271940 )
      ( MAKE-7PILE ?auto_271936 ?auto_271937 ?auto_271938 ?auto_271939 ?auto_271940 ?auto_271941 ?auto_271942 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_271951 - BLOCK
      ?auto_271952 - BLOCK
      ?auto_271953 - BLOCK
      ?auto_271954 - BLOCK
      ?auto_271955 - BLOCK
      ?auto_271956 - BLOCK
      ?auto_271957 - BLOCK
    )
    :vars
    (
      ?auto_271958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271957 ?auto_271958 ) ( ON-TABLE ?auto_271951 ) ( ON ?auto_271952 ?auto_271951 ) ( ON ?auto_271953 ?auto_271952 ) ( not ( = ?auto_271951 ?auto_271952 ) ) ( not ( = ?auto_271951 ?auto_271953 ) ) ( not ( = ?auto_271951 ?auto_271954 ) ) ( not ( = ?auto_271951 ?auto_271955 ) ) ( not ( = ?auto_271951 ?auto_271956 ) ) ( not ( = ?auto_271951 ?auto_271957 ) ) ( not ( = ?auto_271951 ?auto_271958 ) ) ( not ( = ?auto_271952 ?auto_271953 ) ) ( not ( = ?auto_271952 ?auto_271954 ) ) ( not ( = ?auto_271952 ?auto_271955 ) ) ( not ( = ?auto_271952 ?auto_271956 ) ) ( not ( = ?auto_271952 ?auto_271957 ) ) ( not ( = ?auto_271952 ?auto_271958 ) ) ( not ( = ?auto_271953 ?auto_271954 ) ) ( not ( = ?auto_271953 ?auto_271955 ) ) ( not ( = ?auto_271953 ?auto_271956 ) ) ( not ( = ?auto_271953 ?auto_271957 ) ) ( not ( = ?auto_271953 ?auto_271958 ) ) ( not ( = ?auto_271954 ?auto_271955 ) ) ( not ( = ?auto_271954 ?auto_271956 ) ) ( not ( = ?auto_271954 ?auto_271957 ) ) ( not ( = ?auto_271954 ?auto_271958 ) ) ( not ( = ?auto_271955 ?auto_271956 ) ) ( not ( = ?auto_271955 ?auto_271957 ) ) ( not ( = ?auto_271955 ?auto_271958 ) ) ( not ( = ?auto_271956 ?auto_271957 ) ) ( not ( = ?auto_271956 ?auto_271958 ) ) ( not ( = ?auto_271957 ?auto_271958 ) ) ( ON ?auto_271956 ?auto_271957 ) ( ON ?auto_271955 ?auto_271956 ) ( CLEAR ?auto_271953 ) ( ON ?auto_271954 ?auto_271955 ) ( CLEAR ?auto_271954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_271951 ?auto_271952 ?auto_271953 ?auto_271954 )
      ( MAKE-7PILE ?auto_271951 ?auto_271952 ?auto_271953 ?auto_271954 ?auto_271955 ?auto_271956 ?auto_271957 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_271966 - BLOCK
      ?auto_271967 - BLOCK
      ?auto_271968 - BLOCK
      ?auto_271969 - BLOCK
      ?auto_271970 - BLOCK
      ?auto_271971 - BLOCK
      ?auto_271972 - BLOCK
    )
    :vars
    (
      ?auto_271973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271972 ?auto_271973 ) ( ON-TABLE ?auto_271966 ) ( ON ?auto_271967 ?auto_271966 ) ( ON ?auto_271968 ?auto_271967 ) ( not ( = ?auto_271966 ?auto_271967 ) ) ( not ( = ?auto_271966 ?auto_271968 ) ) ( not ( = ?auto_271966 ?auto_271969 ) ) ( not ( = ?auto_271966 ?auto_271970 ) ) ( not ( = ?auto_271966 ?auto_271971 ) ) ( not ( = ?auto_271966 ?auto_271972 ) ) ( not ( = ?auto_271966 ?auto_271973 ) ) ( not ( = ?auto_271967 ?auto_271968 ) ) ( not ( = ?auto_271967 ?auto_271969 ) ) ( not ( = ?auto_271967 ?auto_271970 ) ) ( not ( = ?auto_271967 ?auto_271971 ) ) ( not ( = ?auto_271967 ?auto_271972 ) ) ( not ( = ?auto_271967 ?auto_271973 ) ) ( not ( = ?auto_271968 ?auto_271969 ) ) ( not ( = ?auto_271968 ?auto_271970 ) ) ( not ( = ?auto_271968 ?auto_271971 ) ) ( not ( = ?auto_271968 ?auto_271972 ) ) ( not ( = ?auto_271968 ?auto_271973 ) ) ( not ( = ?auto_271969 ?auto_271970 ) ) ( not ( = ?auto_271969 ?auto_271971 ) ) ( not ( = ?auto_271969 ?auto_271972 ) ) ( not ( = ?auto_271969 ?auto_271973 ) ) ( not ( = ?auto_271970 ?auto_271971 ) ) ( not ( = ?auto_271970 ?auto_271972 ) ) ( not ( = ?auto_271970 ?auto_271973 ) ) ( not ( = ?auto_271971 ?auto_271972 ) ) ( not ( = ?auto_271971 ?auto_271973 ) ) ( not ( = ?auto_271972 ?auto_271973 ) ) ( ON ?auto_271971 ?auto_271972 ) ( ON ?auto_271970 ?auto_271971 ) ( CLEAR ?auto_271968 ) ( ON ?auto_271969 ?auto_271970 ) ( CLEAR ?auto_271969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_271966 ?auto_271967 ?auto_271968 ?auto_271969 )
      ( MAKE-7PILE ?auto_271966 ?auto_271967 ?auto_271968 ?auto_271969 ?auto_271970 ?auto_271971 ?auto_271972 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_271981 - BLOCK
      ?auto_271982 - BLOCK
      ?auto_271983 - BLOCK
      ?auto_271984 - BLOCK
      ?auto_271985 - BLOCK
      ?auto_271986 - BLOCK
      ?auto_271987 - BLOCK
    )
    :vars
    (
      ?auto_271988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271987 ?auto_271988 ) ( ON-TABLE ?auto_271981 ) ( ON ?auto_271982 ?auto_271981 ) ( not ( = ?auto_271981 ?auto_271982 ) ) ( not ( = ?auto_271981 ?auto_271983 ) ) ( not ( = ?auto_271981 ?auto_271984 ) ) ( not ( = ?auto_271981 ?auto_271985 ) ) ( not ( = ?auto_271981 ?auto_271986 ) ) ( not ( = ?auto_271981 ?auto_271987 ) ) ( not ( = ?auto_271981 ?auto_271988 ) ) ( not ( = ?auto_271982 ?auto_271983 ) ) ( not ( = ?auto_271982 ?auto_271984 ) ) ( not ( = ?auto_271982 ?auto_271985 ) ) ( not ( = ?auto_271982 ?auto_271986 ) ) ( not ( = ?auto_271982 ?auto_271987 ) ) ( not ( = ?auto_271982 ?auto_271988 ) ) ( not ( = ?auto_271983 ?auto_271984 ) ) ( not ( = ?auto_271983 ?auto_271985 ) ) ( not ( = ?auto_271983 ?auto_271986 ) ) ( not ( = ?auto_271983 ?auto_271987 ) ) ( not ( = ?auto_271983 ?auto_271988 ) ) ( not ( = ?auto_271984 ?auto_271985 ) ) ( not ( = ?auto_271984 ?auto_271986 ) ) ( not ( = ?auto_271984 ?auto_271987 ) ) ( not ( = ?auto_271984 ?auto_271988 ) ) ( not ( = ?auto_271985 ?auto_271986 ) ) ( not ( = ?auto_271985 ?auto_271987 ) ) ( not ( = ?auto_271985 ?auto_271988 ) ) ( not ( = ?auto_271986 ?auto_271987 ) ) ( not ( = ?auto_271986 ?auto_271988 ) ) ( not ( = ?auto_271987 ?auto_271988 ) ) ( ON ?auto_271986 ?auto_271987 ) ( ON ?auto_271985 ?auto_271986 ) ( ON ?auto_271984 ?auto_271985 ) ( CLEAR ?auto_271982 ) ( ON ?auto_271983 ?auto_271984 ) ( CLEAR ?auto_271983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_271981 ?auto_271982 ?auto_271983 )
      ( MAKE-7PILE ?auto_271981 ?auto_271982 ?auto_271983 ?auto_271984 ?auto_271985 ?auto_271986 ?auto_271987 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_271996 - BLOCK
      ?auto_271997 - BLOCK
      ?auto_271998 - BLOCK
      ?auto_271999 - BLOCK
      ?auto_272000 - BLOCK
      ?auto_272001 - BLOCK
      ?auto_272002 - BLOCK
    )
    :vars
    (
      ?auto_272003 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272002 ?auto_272003 ) ( ON-TABLE ?auto_271996 ) ( ON ?auto_271997 ?auto_271996 ) ( not ( = ?auto_271996 ?auto_271997 ) ) ( not ( = ?auto_271996 ?auto_271998 ) ) ( not ( = ?auto_271996 ?auto_271999 ) ) ( not ( = ?auto_271996 ?auto_272000 ) ) ( not ( = ?auto_271996 ?auto_272001 ) ) ( not ( = ?auto_271996 ?auto_272002 ) ) ( not ( = ?auto_271996 ?auto_272003 ) ) ( not ( = ?auto_271997 ?auto_271998 ) ) ( not ( = ?auto_271997 ?auto_271999 ) ) ( not ( = ?auto_271997 ?auto_272000 ) ) ( not ( = ?auto_271997 ?auto_272001 ) ) ( not ( = ?auto_271997 ?auto_272002 ) ) ( not ( = ?auto_271997 ?auto_272003 ) ) ( not ( = ?auto_271998 ?auto_271999 ) ) ( not ( = ?auto_271998 ?auto_272000 ) ) ( not ( = ?auto_271998 ?auto_272001 ) ) ( not ( = ?auto_271998 ?auto_272002 ) ) ( not ( = ?auto_271998 ?auto_272003 ) ) ( not ( = ?auto_271999 ?auto_272000 ) ) ( not ( = ?auto_271999 ?auto_272001 ) ) ( not ( = ?auto_271999 ?auto_272002 ) ) ( not ( = ?auto_271999 ?auto_272003 ) ) ( not ( = ?auto_272000 ?auto_272001 ) ) ( not ( = ?auto_272000 ?auto_272002 ) ) ( not ( = ?auto_272000 ?auto_272003 ) ) ( not ( = ?auto_272001 ?auto_272002 ) ) ( not ( = ?auto_272001 ?auto_272003 ) ) ( not ( = ?auto_272002 ?auto_272003 ) ) ( ON ?auto_272001 ?auto_272002 ) ( ON ?auto_272000 ?auto_272001 ) ( ON ?auto_271999 ?auto_272000 ) ( CLEAR ?auto_271997 ) ( ON ?auto_271998 ?auto_271999 ) ( CLEAR ?auto_271998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_271996 ?auto_271997 ?auto_271998 )
      ( MAKE-7PILE ?auto_271996 ?auto_271997 ?auto_271998 ?auto_271999 ?auto_272000 ?auto_272001 ?auto_272002 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_272011 - BLOCK
      ?auto_272012 - BLOCK
      ?auto_272013 - BLOCK
      ?auto_272014 - BLOCK
      ?auto_272015 - BLOCK
      ?auto_272016 - BLOCK
      ?auto_272017 - BLOCK
    )
    :vars
    (
      ?auto_272018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272017 ?auto_272018 ) ( ON-TABLE ?auto_272011 ) ( not ( = ?auto_272011 ?auto_272012 ) ) ( not ( = ?auto_272011 ?auto_272013 ) ) ( not ( = ?auto_272011 ?auto_272014 ) ) ( not ( = ?auto_272011 ?auto_272015 ) ) ( not ( = ?auto_272011 ?auto_272016 ) ) ( not ( = ?auto_272011 ?auto_272017 ) ) ( not ( = ?auto_272011 ?auto_272018 ) ) ( not ( = ?auto_272012 ?auto_272013 ) ) ( not ( = ?auto_272012 ?auto_272014 ) ) ( not ( = ?auto_272012 ?auto_272015 ) ) ( not ( = ?auto_272012 ?auto_272016 ) ) ( not ( = ?auto_272012 ?auto_272017 ) ) ( not ( = ?auto_272012 ?auto_272018 ) ) ( not ( = ?auto_272013 ?auto_272014 ) ) ( not ( = ?auto_272013 ?auto_272015 ) ) ( not ( = ?auto_272013 ?auto_272016 ) ) ( not ( = ?auto_272013 ?auto_272017 ) ) ( not ( = ?auto_272013 ?auto_272018 ) ) ( not ( = ?auto_272014 ?auto_272015 ) ) ( not ( = ?auto_272014 ?auto_272016 ) ) ( not ( = ?auto_272014 ?auto_272017 ) ) ( not ( = ?auto_272014 ?auto_272018 ) ) ( not ( = ?auto_272015 ?auto_272016 ) ) ( not ( = ?auto_272015 ?auto_272017 ) ) ( not ( = ?auto_272015 ?auto_272018 ) ) ( not ( = ?auto_272016 ?auto_272017 ) ) ( not ( = ?auto_272016 ?auto_272018 ) ) ( not ( = ?auto_272017 ?auto_272018 ) ) ( ON ?auto_272016 ?auto_272017 ) ( ON ?auto_272015 ?auto_272016 ) ( ON ?auto_272014 ?auto_272015 ) ( ON ?auto_272013 ?auto_272014 ) ( CLEAR ?auto_272011 ) ( ON ?auto_272012 ?auto_272013 ) ( CLEAR ?auto_272012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_272011 ?auto_272012 )
      ( MAKE-7PILE ?auto_272011 ?auto_272012 ?auto_272013 ?auto_272014 ?auto_272015 ?auto_272016 ?auto_272017 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_272026 - BLOCK
      ?auto_272027 - BLOCK
      ?auto_272028 - BLOCK
      ?auto_272029 - BLOCK
      ?auto_272030 - BLOCK
      ?auto_272031 - BLOCK
      ?auto_272032 - BLOCK
    )
    :vars
    (
      ?auto_272033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272032 ?auto_272033 ) ( ON-TABLE ?auto_272026 ) ( not ( = ?auto_272026 ?auto_272027 ) ) ( not ( = ?auto_272026 ?auto_272028 ) ) ( not ( = ?auto_272026 ?auto_272029 ) ) ( not ( = ?auto_272026 ?auto_272030 ) ) ( not ( = ?auto_272026 ?auto_272031 ) ) ( not ( = ?auto_272026 ?auto_272032 ) ) ( not ( = ?auto_272026 ?auto_272033 ) ) ( not ( = ?auto_272027 ?auto_272028 ) ) ( not ( = ?auto_272027 ?auto_272029 ) ) ( not ( = ?auto_272027 ?auto_272030 ) ) ( not ( = ?auto_272027 ?auto_272031 ) ) ( not ( = ?auto_272027 ?auto_272032 ) ) ( not ( = ?auto_272027 ?auto_272033 ) ) ( not ( = ?auto_272028 ?auto_272029 ) ) ( not ( = ?auto_272028 ?auto_272030 ) ) ( not ( = ?auto_272028 ?auto_272031 ) ) ( not ( = ?auto_272028 ?auto_272032 ) ) ( not ( = ?auto_272028 ?auto_272033 ) ) ( not ( = ?auto_272029 ?auto_272030 ) ) ( not ( = ?auto_272029 ?auto_272031 ) ) ( not ( = ?auto_272029 ?auto_272032 ) ) ( not ( = ?auto_272029 ?auto_272033 ) ) ( not ( = ?auto_272030 ?auto_272031 ) ) ( not ( = ?auto_272030 ?auto_272032 ) ) ( not ( = ?auto_272030 ?auto_272033 ) ) ( not ( = ?auto_272031 ?auto_272032 ) ) ( not ( = ?auto_272031 ?auto_272033 ) ) ( not ( = ?auto_272032 ?auto_272033 ) ) ( ON ?auto_272031 ?auto_272032 ) ( ON ?auto_272030 ?auto_272031 ) ( ON ?auto_272029 ?auto_272030 ) ( ON ?auto_272028 ?auto_272029 ) ( CLEAR ?auto_272026 ) ( ON ?auto_272027 ?auto_272028 ) ( CLEAR ?auto_272027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_272026 ?auto_272027 )
      ( MAKE-7PILE ?auto_272026 ?auto_272027 ?auto_272028 ?auto_272029 ?auto_272030 ?auto_272031 ?auto_272032 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_272041 - BLOCK
      ?auto_272042 - BLOCK
      ?auto_272043 - BLOCK
      ?auto_272044 - BLOCK
      ?auto_272045 - BLOCK
      ?auto_272046 - BLOCK
      ?auto_272047 - BLOCK
    )
    :vars
    (
      ?auto_272048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272047 ?auto_272048 ) ( not ( = ?auto_272041 ?auto_272042 ) ) ( not ( = ?auto_272041 ?auto_272043 ) ) ( not ( = ?auto_272041 ?auto_272044 ) ) ( not ( = ?auto_272041 ?auto_272045 ) ) ( not ( = ?auto_272041 ?auto_272046 ) ) ( not ( = ?auto_272041 ?auto_272047 ) ) ( not ( = ?auto_272041 ?auto_272048 ) ) ( not ( = ?auto_272042 ?auto_272043 ) ) ( not ( = ?auto_272042 ?auto_272044 ) ) ( not ( = ?auto_272042 ?auto_272045 ) ) ( not ( = ?auto_272042 ?auto_272046 ) ) ( not ( = ?auto_272042 ?auto_272047 ) ) ( not ( = ?auto_272042 ?auto_272048 ) ) ( not ( = ?auto_272043 ?auto_272044 ) ) ( not ( = ?auto_272043 ?auto_272045 ) ) ( not ( = ?auto_272043 ?auto_272046 ) ) ( not ( = ?auto_272043 ?auto_272047 ) ) ( not ( = ?auto_272043 ?auto_272048 ) ) ( not ( = ?auto_272044 ?auto_272045 ) ) ( not ( = ?auto_272044 ?auto_272046 ) ) ( not ( = ?auto_272044 ?auto_272047 ) ) ( not ( = ?auto_272044 ?auto_272048 ) ) ( not ( = ?auto_272045 ?auto_272046 ) ) ( not ( = ?auto_272045 ?auto_272047 ) ) ( not ( = ?auto_272045 ?auto_272048 ) ) ( not ( = ?auto_272046 ?auto_272047 ) ) ( not ( = ?auto_272046 ?auto_272048 ) ) ( not ( = ?auto_272047 ?auto_272048 ) ) ( ON ?auto_272046 ?auto_272047 ) ( ON ?auto_272045 ?auto_272046 ) ( ON ?auto_272044 ?auto_272045 ) ( ON ?auto_272043 ?auto_272044 ) ( ON ?auto_272042 ?auto_272043 ) ( ON ?auto_272041 ?auto_272042 ) ( CLEAR ?auto_272041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_272041 )
      ( MAKE-7PILE ?auto_272041 ?auto_272042 ?auto_272043 ?auto_272044 ?auto_272045 ?auto_272046 ?auto_272047 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_272056 - BLOCK
      ?auto_272057 - BLOCK
      ?auto_272058 - BLOCK
      ?auto_272059 - BLOCK
      ?auto_272060 - BLOCK
      ?auto_272061 - BLOCK
      ?auto_272062 - BLOCK
    )
    :vars
    (
      ?auto_272063 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272062 ?auto_272063 ) ( not ( = ?auto_272056 ?auto_272057 ) ) ( not ( = ?auto_272056 ?auto_272058 ) ) ( not ( = ?auto_272056 ?auto_272059 ) ) ( not ( = ?auto_272056 ?auto_272060 ) ) ( not ( = ?auto_272056 ?auto_272061 ) ) ( not ( = ?auto_272056 ?auto_272062 ) ) ( not ( = ?auto_272056 ?auto_272063 ) ) ( not ( = ?auto_272057 ?auto_272058 ) ) ( not ( = ?auto_272057 ?auto_272059 ) ) ( not ( = ?auto_272057 ?auto_272060 ) ) ( not ( = ?auto_272057 ?auto_272061 ) ) ( not ( = ?auto_272057 ?auto_272062 ) ) ( not ( = ?auto_272057 ?auto_272063 ) ) ( not ( = ?auto_272058 ?auto_272059 ) ) ( not ( = ?auto_272058 ?auto_272060 ) ) ( not ( = ?auto_272058 ?auto_272061 ) ) ( not ( = ?auto_272058 ?auto_272062 ) ) ( not ( = ?auto_272058 ?auto_272063 ) ) ( not ( = ?auto_272059 ?auto_272060 ) ) ( not ( = ?auto_272059 ?auto_272061 ) ) ( not ( = ?auto_272059 ?auto_272062 ) ) ( not ( = ?auto_272059 ?auto_272063 ) ) ( not ( = ?auto_272060 ?auto_272061 ) ) ( not ( = ?auto_272060 ?auto_272062 ) ) ( not ( = ?auto_272060 ?auto_272063 ) ) ( not ( = ?auto_272061 ?auto_272062 ) ) ( not ( = ?auto_272061 ?auto_272063 ) ) ( not ( = ?auto_272062 ?auto_272063 ) ) ( ON ?auto_272061 ?auto_272062 ) ( ON ?auto_272060 ?auto_272061 ) ( ON ?auto_272059 ?auto_272060 ) ( ON ?auto_272058 ?auto_272059 ) ( ON ?auto_272057 ?auto_272058 ) ( ON ?auto_272056 ?auto_272057 ) ( CLEAR ?auto_272056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_272056 )
      ( MAKE-7PILE ?auto_272056 ?auto_272057 ?auto_272058 ?auto_272059 ?auto_272060 ?auto_272061 ?auto_272062 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_272072 - BLOCK
      ?auto_272073 - BLOCK
      ?auto_272074 - BLOCK
      ?auto_272075 - BLOCK
      ?auto_272076 - BLOCK
      ?auto_272077 - BLOCK
      ?auto_272078 - BLOCK
      ?auto_272079 - BLOCK
    )
    :vars
    (
      ?auto_272080 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_272078 ) ( ON ?auto_272079 ?auto_272080 ) ( CLEAR ?auto_272079 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_272072 ) ( ON ?auto_272073 ?auto_272072 ) ( ON ?auto_272074 ?auto_272073 ) ( ON ?auto_272075 ?auto_272074 ) ( ON ?auto_272076 ?auto_272075 ) ( ON ?auto_272077 ?auto_272076 ) ( ON ?auto_272078 ?auto_272077 ) ( not ( = ?auto_272072 ?auto_272073 ) ) ( not ( = ?auto_272072 ?auto_272074 ) ) ( not ( = ?auto_272072 ?auto_272075 ) ) ( not ( = ?auto_272072 ?auto_272076 ) ) ( not ( = ?auto_272072 ?auto_272077 ) ) ( not ( = ?auto_272072 ?auto_272078 ) ) ( not ( = ?auto_272072 ?auto_272079 ) ) ( not ( = ?auto_272072 ?auto_272080 ) ) ( not ( = ?auto_272073 ?auto_272074 ) ) ( not ( = ?auto_272073 ?auto_272075 ) ) ( not ( = ?auto_272073 ?auto_272076 ) ) ( not ( = ?auto_272073 ?auto_272077 ) ) ( not ( = ?auto_272073 ?auto_272078 ) ) ( not ( = ?auto_272073 ?auto_272079 ) ) ( not ( = ?auto_272073 ?auto_272080 ) ) ( not ( = ?auto_272074 ?auto_272075 ) ) ( not ( = ?auto_272074 ?auto_272076 ) ) ( not ( = ?auto_272074 ?auto_272077 ) ) ( not ( = ?auto_272074 ?auto_272078 ) ) ( not ( = ?auto_272074 ?auto_272079 ) ) ( not ( = ?auto_272074 ?auto_272080 ) ) ( not ( = ?auto_272075 ?auto_272076 ) ) ( not ( = ?auto_272075 ?auto_272077 ) ) ( not ( = ?auto_272075 ?auto_272078 ) ) ( not ( = ?auto_272075 ?auto_272079 ) ) ( not ( = ?auto_272075 ?auto_272080 ) ) ( not ( = ?auto_272076 ?auto_272077 ) ) ( not ( = ?auto_272076 ?auto_272078 ) ) ( not ( = ?auto_272076 ?auto_272079 ) ) ( not ( = ?auto_272076 ?auto_272080 ) ) ( not ( = ?auto_272077 ?auto_272078 ) ) ( not ( = ?auto_272077 ?auto_272079 ) ) ( not ( = ?auto_272077 ?auto_272080 ) ) ( not ( = ?auto_272078 ?auto_272079 ) ) ( not ( = ?auto_272078 ?auto_272080 ) ) ( not ( = ?auto_272079 ?auto_272080 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_272079 ?auto_272080 )
      ( !STACK ?auto_272079 ?auto_272078 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_272089 - BLOCK
      ?auto_272090 - BLOCK
      ?auto_272091 - BLOCK
      ?auto_272092 - BLOCK
      ?auto_272093 - BLOCK
      ?auto_272094 - BLOCK
      ?auto_272095 - BLOCK
      ?auto_272096 - BLOCK
    )
    :vars
    (
      ?auto_272097 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_272095 ) ( ON ?auto_272096 ?auto_272097 ) ( CLEAR ?auto_272096 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_272089 ) ( ON ?auto_272090 ?auto_272089 ) ( ON ?auto_272091 ?auto_272090 ) ( ON ?auto_272092 ?auto_272091 ) ( ON ?auto_272093 ?auto_272092 ) ( ON ?auto_272094 ?auto_272093 ) ( ON ?auto_272095 ?auto_272094 ) ( not ( = ?auto_272089 ?auto_272090 ) ) ( not ( = ?auto_272089 ?auto_272091 ) ) ( not ( = ?auto_272089 ?auto_272092 ) ) ( not ( = ?auto_272089 ?auto_272093 ) ) ( not ( = ?auto_272089 ?auto_272094 ) ) ( not ( = ?auto_272089 ?auto_272095 ) ) ( not ( = ?auto_272089 ?auto_272096 ) ) ( not ( = ?auto_272089 ?auto_272097 ) ) ( not ( = ?auto_272090 ?auto_272091 ) ) ( not ( = ?auto_272090 ?auto_272092 ) ) ( not ( = ?auto_272090 ?auto_272093 ) ) ( not ( = ?auto_272090 ?auto_272094 ) ) ( not ( = ?auto_272090 ?auto_272095 ) ) ( not ( = ?auto_272090 ?auto_272096 ) ) ( not ( = ?auto_272090 ?auto_272097 ) ) ( not ( = ?auto_272091 ?auto_272092 ) ) ( not ( = ?auto_272091 ?auto_272093 ) ) ( not ( = ?auto_272091 ?auto_272094 ) ) ( not ( = ?auto_272091 ?auto_272095 ) ) ( not ( = ?auto_272091 ?auto_272096 ) ) ( not ( = ?auto_272091 ?auto_272097 ) ) ( not ( = ?auto_272092 ?auto_272093 ) ) ( not ( = ?auto_272092 ?auto_272094 ) ) ( not ( = ?auto_272092 ?auto_272095 ) ) ( not ( = ?auto_272092 ?auto_272096 ) ) ( not ( = ?auto_272092 ?auto_272097 ) ) ( not ( = ?auto_272093 ?auto_272094 ) ) ( not ( = ?auto_272093 ?auto_272095 ) ) ( not ( = ?auto_272093 ?auto_272096 ) ) ( not ( = ?auto_272093 ?auto_272097 ) ) ( not ( = ?auto_272094 ?auto_272095 ) ) ( not ( = ?auto_272094 ?auto_272096 ) ) ( not ( = ?auto_272094 ?auto_272097 ) ) ( not ( = ?auto_272095 ?auto_272096 ) ) ( not ( = ?auto_272095 ?auto_272097 ) ) ( not ( = ?auto_272096 ?auto_272097 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_272096 ?auto_272097 )
      ( !STACK ?auto_272096 ?auto_272095 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_272106 - BLOCK
      ?auto_272107 - BLOCK
      ?auto_272108 - BLOCK
      ?auto_272109 - BLOCK
      ?auto_272110 - BLOCK
      ?auto_272111 - BLOCK
      ?auto_272112 - BLOCK
      ?auto_272113 - BLOCK
    )
    :vars
    (
      ?auto_272114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272113 ?auto_272114 ) ( ON-TABLE ?auto_272106 ) ( ON ?auto_272107 ?auto_272106 ) ( ON ?auto_272108 ?auto_272107 ) ( ON ?auto_272109 ?auto_272108 ) ( ON ?auto_272110 ?auto_272109 ) ( ON ?auto_272111 ?auto_272110 ) ( not ( = ?auto_272106 ?auto_272107 ) ) ( not ( = ?auto_272106 ?auto_272108 ) ) ( not ( = ?auto_272106 ?auto_272109 ) ) ( not ( = ?auto_272106 ?auto_272110 ) ) ( not ( = ?auto_272106 ?auto_272111 ) ) ( not ( = ?auto_272106 ?auto_272112 ) ) ( not ( = ?auto_272106 ?auto_272113 ) ) ( not ( = ?auto_272106 ?auto_272114 ) ) ( not ( = ?auto_272107 ?auto_272108 ) ) ( not ( = ?auto_272107 ?auto_272109 ) ) ( not ( = ?auto_272107 ?auto_272110 ) ) ( not ( = ?auto_272107 ?auto_272111 ) ) ( not ( = ?auto_272107 ?auto_272112 ) ) ( not ( = ?auto_272107 ?auto_272113 ) ) ( not ( = ?auto_272107 ?auto_272114 ) ) ( not ( = ?auto_272108 ?auto_272109 ) ) ( not ( = ?auto_272108 ?auto_272110 ) ) ( not ( = ?auto_272108 ?auto_272111 ) ) ( not ( = ?auto_272108 ?auto_272112 ) ) ( not ( = ?auto_272108 ?auto_272113 ) ) ( not ( = ?auto_272108 ?auto_272114 ) ) ( not ( = ?auto_272109 ?auto_272110 ) ) ( not ( = ?auto_272109 ?auto_272111 ) ) ( not ( = ?auto_272109 ?auto_272112 ) ) ( not ( = ?auto_272109 ?auto_272113 ) ) ( not ( = ?auto_272109 ?auto_272114 ) ) ( not ( = ?auto_272110 ?auto_272111 ) ) ( not ( = ?auto_272110 ?auto_272112 ) ) ( not ( = ?auto_272110 ?auto_272113 ) ) ( not ( = ?auto_272110 ?auto_272114 ) ) ( not ( = ?auto_272111 ?auto_272112 ) ) ( not ( = ?auto_272111 ?auto_272113 ) ) ( not ( = ?auto_272111 ?auto_272114 ) ) ( not ( = ?auto_272112 ?auto_272113 ) ) ( not ( = ?auto_272112 ?auto_272114 ) ) ( not ( = ?auto_272113 ?auto_272114 ) ) ( CLEAR ?auto_272111 ) ( ON ?auto_272112 ?auto_272113 ) ( CLEAR ?auto_272112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_272106 ?auto_272107 ?auto_272108 ?auto_272109 ?auto_272110 ?auto_272111 ?auto_272112 )
      ( MAKE-8PILE ?auto_272106 ?auto_272107 ?auto_272108 ?auto_272109 ?auto_272110 ?auto_272111 ?auto_272112 ?auto_272113 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_272123 - BLOCK
      ?auto_272124 - BLOCK
      ?auto_272125 - BLOCK
      ?auto_272126 - BLOCK
      ?auto_272127 - BLOCK
      ?auto_272128 - BLOCK
      ?auto_272129 - BLOCK
      ?auto_272130 - BLOCK
    )
    :vars
    (
      ?auto_272131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272130 ?auto_272131 ) ( ON-TABLE ?auto_272123 ) ( ON ?auto_272124 ?auto_272123 ) ( ON ?auto_272125 ?auto_272124 ) ( ON ?auto_272126 ?auto_272125 ) ( ON ?auto_272127 ?auto_272126 ) ( ON ?auto_272128 ?auto_272127 ) ( not ( = ?auto_272123 ?auto_272124 ) ) ( not ( = ?auto_272123 ?auto_272125 ) ) ( not ( = ?auto_272123 ?auto_272126 ) ) ( not ( = ?auto_272123 ?auto_272127 ) ) ( not ( = ?auto_272123 ?auto_272128 ) ) ( not ( = ?auto_272123 ?auto_272129 ) ) ( not ( = ?auto_272123 ?auto_272130 ) ) ( not ( = ?auto_272123 ?auto_272131 ) ) ( not ( = ?auto_272124 ?auto_272125 ) ) ( not ( = ?auto_272124 ?auto_272126 ) ) ( not ( = ?auto_272124 ?auto_272127 ) ) ( not ( = ?auto_272124 ?auto_272128 ) ) ( not ( = ?auto_272124 ?auto_272129 ) ) ( not ( = ?auto_272124 ?auto_272130 ) ) ( not ( = ?auto_272124 ?auto_272131 ) ) ( not ( = ?auto_272125 ?auto_272126 ) ) ( not ( = ?auto_272125 ?auto_272127 ) ) ( not ( = ?auto_272125 ?auto_272128 ) ) ( not ( = ?auto_272125 ?auto_272129 ) ) ( not ( = ?auto_272125 ?auto_272130 ) ) ( not ( = ?auto_272125 ?auto_272131 ) ) ( not ( = ?auto_272126 ?auto_272127 ) ) ( not ( = ?auto_272126 ?auto_272128 ) ) ( not ( = ?auto_272126 ?auto_272129 ) ) ( not ( = ?auto_272126 ?auto_272130 ) ) ( not ( = ?auto_272126 ?auto_272131 ) ) ( not ( = ?auto_272127 ?auto_272128 ) ) ( not ( = ?auto_272127 ?auto_272129 ) ) ( not ( = ?auto_272127 ?auto_272130 ) ) ( not ( = ?auto_272127 ?auto_272131 ) ) ( not ( = ?auto_272128 ?auto_272129 ) ) ( not ( = ?auto_272128 ?auto_272130 ) ) ( not ( = ?auto_272128 ?auto_272131 ) ) ( not ( = ?auto_272129 ?auto_272130 ) ) ( not ( = ?auto_272129 ?auto_272131 ) ) ( not ( = ?auto_272130 ?auto_272131 ) ) ( CLEAR ?auto_272128 ) ( ON ?auto_272129 ?auto_272130 ) ( CLEAR ?auto_272129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_272123 ?auto_272124 ?auto_272125 ?auto_272126 ?auto_272127 ?auto_272128 ?auto_272129 )
      ( MAKE-8PILE ?auto_272123 ?auto_272124 ?auto_272125 ?auto_272126 ?auto_272127 ?auto_272128 ?auto_272129 ?auto_272130 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_272140 - BLOCK
      ?auto_272141 - BLOCK
      ?auto_272142 - BLOCK
      ?auto_272143 - BLOCK
      ?auto_272144 - BLOCK
      ?auto_272145 - BLOCK
      ?auto_272146 - BLOCK
      ?auto_272147 - BLOCK
    )
    :vars
    (
      ?auto_272148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272147 ?auto_272148 ) ( ON-TABLE ?auto_272140 ) ( ON ?auto_272141 ?auto_272140 ) ( ON ?auto_272142 ?auto_272141 ) ( ON ?auto_272143 ?auto_272142 ) ( ON ?auto_272144 ?auto_272143 ) ( not ( = ?auto_272140 ?auto_272141 ) ) ( not ( = ?auto_272140 ?auto_272142 ) ) ( not ( = ?auto_272140 ?auto_272143 ) ) ( not ( = ?auto_272140 ?auto_272144 ) ) ( not ( = ?auto_272140 ?auto_272145 ) ) ( not ( = ?auto_272140 ?auto_272146 ) ) ( not ( = ?auto_272140 ?auto_272147 ) ) ( not ( = ?auto_272140 ?auto_272148 ) ) ( not ( = ?auto_272141 ?auto_272142 ) ) ( not ( = ?auto_272141 ?auto_272143 ) ) ( not ( = ?auto_272141 ?auto_272144 ) ) ( not ( = ?auto_272141 ?auto_272145 ) ) ( not ( = ?auto_272141 ?auto_272146 ) ) ( not ( = ?auto_272141 ?auto_272147 ) ) ( not ( = ?auto_272141 ?auto_272148 ) ) ( not ( = ?auto_272142 ?auto_272143 ) ) ( not ( = ?auto_272142 ?auto_272144 ) ) ( not ( = ?auto_272142 ?auto_272145 ) ) ( not ( = ?auto_272142 ?auto_272146 ) ) ( not ( = ?auto_272142 ?auto_272147 ) ) ( not ( = ?auto_272142 ?auto_272148 ) ) ( not ( = ?auto_272143 ?auto_272144 ) ) ( not ( = ?auto_272143 ?auto_272145 ) ) ( not ( = ?auto_272143 ?auto_272146 ) ) ( not ( = ?auto_272143 ?auto_272147 ) ) ( not ( = ?auto_272143 ?auto_272148 ) ) ( not ( = ?auto_272144 ?auto_272145 ) ) ( not ( = ?auto_272144 ?auto_272146 ) ) ( not ( = ?auto_272144 ?auto_272147 ) ) ( not ( = ?auto_272144 ?auto_272148 ) ) ( not ( = ?auto_272145 ?auto_272146 ) ) ( not ( = ?auto_272145 ?auto_272147 ) ) ( not ( = ?auto_272145 ?auto_272148 ) ) ( not ( = ?auto_272146 ?auto_272147 ) ) ( not ( = ?auto_272146 ?auto_272148 ) ) ( not ( = ?auto_272147 ?auto_272148 ) ) ( ON ?auto_272146 ?auto_272147 ) ( CLEAR ?auto_272144 ) ( ON ?auto_272145 ?auto_272146 ) ( CLEAR ?auto_272145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_272140 ?auto_272141 ?auto_272142 ?auto_272143 ?auto_272144 ?auto_272145 )
      ( MAKE-8PILE ?auto_272140 ?auto_272141 ?auto_272142 ?auto_272143 ?auto_272144 ?auto_272145 ?auto_272146 ?auto_272147 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_272157 - BLOCK
      ?auto_272158 - BLOCK
      ?auto_272159 - BLOCK
      ?auto_272160 - BLOCK
      ?auto_272161 - BLOCK
      ?auto_272162 - BLOCK
      ?auto_272163 - BLOCK
      ?auto_272164 - BLOCK
    )
    :vars
    (
      ?auto_272165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272164 ?auto_272165 ) ( ON-TABLE ?auto_272157 ) ( ON ?auto_272158 ?auto_272157 ) ( ON ?auto_272159 ?auto_272158 ) ( ON ?auto_272160 ?auto_272159 ) ( ON ?auto_272161 ?auto_272160 ) ( not ( = ?auto_272157 ?auto_272158 ) ) ( not ( = ?auto_272157 ?auto_272159 ) ) ( not ( = ?auto_272157 ?auto_272160 ) ) ( not ( = ?auto_272157 ?auto_272161 ) ) ( not ( = ?auto_272157 ?auto_272162 ) ) ( not ( = ?auto_272157 ?auto_272163 ) ) ( not ( = ?auto_272157 ?auto_272164 ) ) ( not ( = ?auto_272157 ?auto_272165 ) ) ( not ( = ?auto_272158 ?auto_272159 ) ) ( not ( = ?auto_272158 ?auto_272160 ) ) ( not ( = ?auto_272158 ?auto_272161 ) ) ( not ( = ?auto_272158 ?auto_272162 ) ) ( not ( = ?auto_272158 ?auto_272163 ) ) ( not ( = ?auto_272158 ?auto_272164 ) ) ( not ( = ?auto_272158 ?auto_272165 ) ) ( not ( = ?auto_272159 ?auto_272160 ) ) ( not ( = ?auto_272159 ?auto_272161 ) ) ( not ( = ?auto_272159 ?auto_272162 ) ) ( not ( = ?auto_272159 ?auto_272163 ) ) ( not ( = ?auto_272159 ?auto_272164 ) ) ( not ( = ?auto_272159 ?auto_272165 ) ) ( not ( = ?auto_272160 ?auto_272161 ) ) ( not ( = ?auto_272160 ?auto_272162 ) ) ( not ( = ?auto_272160 ?auto_272163 ) ) ( not ( = ?auto_272160 ?auto_272164 ) ) ( not ( = ?auto_272160 ?auto_272165 ) ) ( not ( = ?auto_272161 ?auto_272162 ) ) ( not ( = ?auto_272161 ?auto_272163 ) ) ( not ( = ?auto_272161 ?auto_272164 ) ) ( not ( = ?auto_272161 ?auto_272165 ) ) ( not ( = ?auto_272162 ?auto_272163 ) ) ( not ( = ?auto_272162 ?auto_272164 ) ) ( not ( = ?auto_272162 ?auto_272165 ) ) ( not ( = ?auto_272163 ?auto_272164 ) ) ( not ( = ?auto_272163 ?auto_272165 ) ) ( not ( = ?auto_272164 ?auto_272165 ) ) ( ON ?auto_272163 ?auto_272164 ) ( CLEAR ?auto_272161 ) ( ON ?auto_272162 ?auto_272163 ) ( CLEAR ?auto_272162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_272157 ?auto_272158 ?auto_272159 ?auto_272160 ?auto_272161 ?auto_272162 )
      ( MAKE-8PILE ?auto_272157 ?auto_272158 ?auto_272159 ?auto_272160 ?auto_272161 ?auto_272162 ?auto_272163 ?auto_272164 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_272174 - BLOCK
      ?auto_272175 - BLOCK
      ?auto_272176 - BLOCK
      ?auto_272177 - BLOCK
      ?auto_272178 - BLOCK
      ?auto_272179 - BLOCK
      ?auto_272180 - BLOCK
      ?auto_272181 - BLOCK
    )
    :vars
    (
      ?auto_272182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272181 ?auto_272182 ) ( ON-TABLE ?auto_272174 ) ( ON ?auto_272175 ?auto_272174 ) ( ON ?auto_272176 ?auto_272175 ) ( ON ?auto_272177 ?auto_272176 ) ( not ( = ?auto_272174 ?auto_272175 ) ) ( not ( = ?auto_272174 ?auto_272176 ) ) ( not ( = ?auto_272174 ?auto_272177 ) ) ( not ( = ?auto_272174 ?auto_272178 ) ) ( not ( = ?auto_272174 ?auto_272179 ) ) ( not ( = ?auto_272174 ?auto_272180 ) ) ( not ( = ?auto_272174 ?auto_272181 ) ) ( not ( = ?auto_272174 ?auto_272182 ) ) ( not ( = ?auto_272175 ?auto_272176 ) ) ( not ( = ?auto_272175 ?auto_272177 ) ) ( not ( = ?auto_272175 ?auto_272178 ) ) ( not ( = ?auto_272175 ?auto_272179 ) ) ( not ( = ?auto_272175 ?auto_272180 ) ) ( not ( = ?auto_272175 ?auto_272181 ) ) ( not ( = ?auto_272175 ?auto_272182 ) ) ( not ( = ?auto_272176 ?auto_272177 ) ) ( not ( = ?auto_272176 ?auto_272178 ) ) ( not ( = ?auto_272176 ?auto_272179 ) ) ( not ( = ?auto_272176 ?auto_272180 ) ) ( not ( = ?auto_272176 ?auto_272181 ) ) ( not ( = ?auto_272176 ?auto_272182 ) ) ( not ( = ?auto_272177 ?auto_272178 ) ) ( not ( = ?auto_272177 ?auto_272179 ) ) ( not ( = ?auto_272177 ?auto_272180 ) ) ( not ( = ?auto_272177 ?auto_272181 ) ) ( not ( = ?auto_272177 ?auto_272182 ) ) ( not ( = ?auto_272178 ?auto_272179 ) ) ( not ( = ?auto_272178 ?auto_272180 ) ) ( not ( = ?auto_272178 ?auto_272181 ) ) ( not ( = ?auto_272178 ?auto_272182 ) ) ( not ( = ?auto_272179 ?auto_272180 ) ) ( not ( = ?auto_272179 ?auto_272181 ) ) ( not ( = ?auto_272179 ?auto_272182 ) ) ( not ( = ?auto_272180 ?auto_272181 ) ) ( not ( = ?auto_272180 ?auto_272182 ) ) ( not ( = ?auto_272181 ?auto_272182 ) ) ( ON ?auto_272180 ?auto_272181 ) ( ON ?auto_272179 ?auto_272180 ) ( CLEAR ?auto_272177 ) ( ON ?auto_272178 ?auto_272179 ) ( CLEAR ?auto_272178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_272174 ?auto_272175 ?auto_272176 ?auto_272177 ?auto_272178 )
      ( MAKE-8PILE ?auto_272174 ?auto_272175 ?auto_272176 ?auto_272177 ?auto_272178 ?auto_272179 ?auto_272180 ?auto_272181 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_272191 - BLOCK
      ?auto_272192 - BLOCK
      ?auto_272193 - BLOCK
      ?auto_272194 - BLOCK
      ?auto_272195 - BLOCK
      ?auto_272196 - BLOCK
      ?auto_272197 - BLOCK
      ?auto_272198 - BLOCK
    )
    :vars
    (
      ?auto_272199 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272198 ?auto_272199 ) ( ON-TABLE ?auto_272191 ) ( ON ?auto_272192 ?auto_272191 ) ( ON ?auto_272193 ?auto_272192 ) ( ON ?auto_272194 ?auto_272193 ) ( not ( = ?auto_272191 ?auto_272192 ) ) ( not ( = ?auto_272191 ?auto_272193 ) ) ( not ( = ?auto_272191 ?auto_272194 ) ) ( not ( = ?auto_272191 ?auto_272195 ) ) ( not ( = ?auto_272191 ?auto_272196 ) ) ( not ( = ?auto_272191 ?auto_272197 ) ) ( not ( = ?auto_272191 ?auto_272198 ) ) ( not ( = ?auto_272191 ?auto_272199 ) ) ( not ( = ?auto_272192 ?auto_272193 ) ) ( not ( = ?auto_272192 ?auto_272194 ) ) ( not ( = ?auto_272192 ?auto_272195 ) ) ( not ( = ?auto_272192 ?auto_272196 ) ) ( not ( = ?auto_272192 ?auto_272197 ) ) ( not ( = ?auto_272192 ?auto_272198 ) ) ( not ( = ?auto_272192 ?auto_272199 ) ) ( not ( = ?auto_272193 ?auto_272194 ) ) ( not ( = ?auto_272193 ?auto_272195 ) ) ( not ( = ?auto_272193 ?auto_272196 ) ) ( not ( = ?auto_272193 ?auto_272197 ) ) ( not ( = ?auto_272193 ?auto_272198 ) ) ( not ( = ?auto_272193 ?auto_272199 ) ) ( not ( = ?auto_272194 ?auto_272195 ) ) ( not ( = ?auto_272194 ?auto_272196 ) ) ( not ( = ?auto_272194 ?auto_272197 ) ) ( not ( = ?auto_272194 ?auto_272198 ) ) ( not ( = ?auto_272194 ?auto_272199 ) ) ( not ( = ?auto_272195 ?auto_272196 ) ) ( not ( = ?auto_272195 ?auto_272197 ) ) ( not ( = ?auto_272195 ?auto_272198 ) ) ( not ( = ?auto_272195 ?auto_272199 ) ) ( not ( = ?auto_272196 ?auto_272197 ) ) ( not ( = ?auto_272196 ?auto_272198 ) ) ( not ( = ?auto_272196 ?auto_272199 ) ) ( not ( = ?auto_272197 ?auto_272198 ) ) ( not ( = ?auto_272197 ?auto_272199 ) ) ( not ( = ?auto_272198 ?auto_272199 ) ) ( ON ?auto_272197 ?auto_272198 ) ( ON ?auto_272196 ?auto_272197 ) ( CLEAR ?auto_272194 ) ( ON ?auto_272195 ?auto_272196 ) ( CLEAR ?auto_272195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_272191 ?auto_272192 ?auto_272193 ?auto_272194 ?auto_272195 )
      ( MAKE-8PILE ?auto_272191 ?auto_272192 ?auto_272193 ?auto_272194 ?auto_272195 ?auto_272196 ?auto_272197 ?auto_272198 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_272208 - BLOCK
      ?auto_272209 - BLOCK
      ?auto_272210 - BLOCK
      ?auto_272211 - BLOCK
      ?auto_272212 - BLOCK
      ?auto_272213 - BLOCK
      ?auto_272214 - BLOCK
      ?auto_272215 - BLOCK
    )
    :vars
    (
      ?auto_272216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272215 ?auto_272216 ) ( ON-TABLE ?auto_272208 ) ( ON ?auto_272209 ?auto_272208 ) ( ON ?auto_272210 ?auto_272209 ) ( not ( = ?auto_272208 ?auto_272209 ) ) ( not ( = ?auto_272208 ?auto_272210 ) ) ( not ( = ?auto_272208 ?auto_272211 ) ) ( not ( = ?auto_272208 ?auto_272212 ) ) ( not ( = ?auto_272208 ?auto_272213 ) ) ( not ( = ?auto_272208 ?auto_272214 ) ) ( not ( = ?auto_272208 ?auto_272215 ) ) ( not ( = ?auto_272208 ?auto_272216 ) ) ( not ( = ?auto_272209 ?auto_272210 ) ) ( not ( = ?auto_272209 ?auto_272211 ) ) ( not ( = ?auto_272209 ?auto_272212 ) ) ( not ( = ?auto_272209 ?auto_272213 ) ) ( not ( = ?auto_272209 ?auto_272214 ) ) ( not ( = ?auto_272209 ?auto_272215 ) ) ( not ( = ?auto_272209 ?auto_272216 ) ) ( not ( = ?auto_272210 ?auto_272211 ) ) ( not ( = ?auto_272210 ?auto_272212 ) ) ( not ( = ?auto_272210 ?auto_272213 ) ) ( not ( = ?auto_272210 ?auto_272214 ) ) ( not ( = ?auto_272210 ?auto_272215 ) ) ( not ( = ?auto_272210 ?auto_272216 ) ) ( not ( = ?auto_272211 ?auto_272212 ) ) ( not ( = ?auto_272211 ?auto_272213 ) ) ( not ( = ?auto_272211 ?auto_272214 ) ) ( not ( = ?auto_272211 ?auto_272215 ) ) ( not ( = ?auto_272211 ?auto_272216 ) ) ( not ( = ?auto_272212 ?auto_272213 ) ) ( not ( = ?auto_272212 ?auto_272214 ) ) ( not ( = ?auto_272212 ?auto_272215 ) ) ( not ( = ?auto_272212 ?auto_272216 ) ) ( not ( = ?auto_272213 ?auto_272214 ) ) ( not ( = ?auto_272213 ?auto_272215 ) ) ( not ( = ?auto_272213 ?auto_272216 ) ) ( not ( = ?auto_272214 ?auto_272215 ) ) ( not ( = ?auto_272214 ?auto_272216 ) ) ( not ( = ?auto_272215 ?auto_272216 ) ) ( ON ?auto_272214 ?auto_272215 ) ( ON ?auto_272213 ?auto_272214 ) ( ON ?auto_272212 ?auto_272213 ) ( CLEAR ?auto_272210 ) ( ON ?auto_272211 ?auto_272212 ) ( CLEAR ?auto_272211 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_272208 ?auto_272209 ?auto_272210 ?auto_272211 )
      ( MAKE-8PILE ?auto_272208 ?auto_272209 ?auto_272210 ?auto_272211 ?auto_272212 ?auto_272213 ?auto_272214 ?auto_272215 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_272225 - BLOCK
      ?auto_272226 - BLOCK
      ?auto_272227 - BLOCK
      ?auto_272228 - BLOCK
      ?auto_272229 - BLOCK
      ?auto_272230 - BLOCK
      ?auto_272231 - BLOCK
      ?auto_272232 - BLOCK
    )
    :vars
    (
      ?auto_272233 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272232 ?auto_272233 ) ( ON-TABLE ?auto_272225 ) ( ON ?auto_272226 ?auto_272225 ) ( ON ?auto_272227 ?auto_272226 ) ( not ( = ?auto_272225 ?auto_272226 ) ) ( not ( = ?auto_272225 ?auto_272227 ) ) ( not ( = ?auto_272225 ?auto_272228 ) ) ( not ( = ?auto_272225 ?auto_272229 ) ) ( not ( = ?auto_272225 ?auto_272230 ) ) ( not ( = ?auto_272225 ?auto_272231 ) ) ( not ( = ?auto_272225 ?auto_272232 ) ) ( not ( = ?auto_272225 ?auto_272233 ) ) ( not ( = ?auto_272226 ?auto_272227 ) ) ( not ( = ?auto_272226 ?auto_272228 ) ) ( not ( = ?auto_272226 ?auto_272229 ) ) ( not ( = ?auto_272226 ?auto_272230 ) ) ( not ( = ?auto_272226 ?auto_272231 ) ) ( not ( = ?auto_272226 ?auto_272232 ) ) ( not ( = ?auto_272226 ?auto_272233 ) ) ( not ( = ?auto_272227 ?auto_272228 ) ) ( not ( = ?auto_272227 ?auto_272229 ) ) ( not ( = ?auto_272227 ?auto_272230 ) ) ( not ( = ?auto_272227 ?auto_272231 ) ) ( not ( = ?auto_272227 ?auto_272232 ) ) ( not ( = ?auto_272227 ?auto_272233 ) ) ( not ( = ?auto_272228 ?auto_272229 ) ) ( not ( = ?auto_272228 ?auto_272230 ) ) ( not ( = ?auto_272228 ?auto_272231 ) ) ( not ( = ?auto_272228 ?auto_272232 ) ) ( not ( = ?auto_272228 ?auto_272233 ) ) ( not ( = ?auto_272229 ?auto_272230 ) ) ( not ( = ?auto_272229 ?auto_272231 ) ) ( not ( = ?auto_272229 ?auto_272232 ) ) ( not ( = ?auto_272229 ?auto_272233 ) ) ( not ( = ?auto_272230 ?auto_272231 ) ) ( not ( = ?auto_272230 ?auto_272232 ) ) ( not ( = ?auto_272230 ?auto_272233 ) ) ( not ( = ?auto_272231 ?auto_272232 ) ) ( not ( = ?auto_272231 ?auto_272233 ) ) ( not ( = ?auto_272232 ?auto_272233 ) ) ( ON ?auto_272231 ?auto_272232 ) ( ON ?auto_272230 ?auto_272231 ) ( ON ?auto_272229 ?auto_272230 ) ( CLEAR ?auto_272227 ) ( ON ?auto_272228 ?auto_272229 ) ( CLEAR ?auto_272228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_272225 ?auto_272226 ?auto_272227 ?auto_272228 )
      ( MAKE-8PILE ?auto_272225 ?auto_272226 ?auto_272227 ?auto_272228 ?auto_272229 ?auto_272230 ?auto_272231 ?auto_272232 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_272242 - BLOCK
      ?auto_272243 - BLOCK
      ?auto_272244 - BLOCK
      ?auto_272245 - BLOCK
      ?auto_272246 - BLOCK
      ?auto_272247 - BLOCK
      ?auto_272248 - BLOCK
      ?auto_272249 - BLOCK
    )
    :vars
    (
      ?auto_272250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272249 ?auto_272250 ) ( ON-TABLE ?auto_272242 ) ( ON ?auto_272243 ?auto_272242 ) ( not ( = ?auto_272242 ?auto_272243 ) ) ( not ( = ?auto_272242 ?auto_272244 ) ) ( not ( = ?auto_272242 ?auto_272245 ) ) ( not ( = ?auto_272242 ?auto_272246 ) ) ( not ( = ?auto_272242 ?auto_272247 ) ) ( not ( = ?auto_272242 ?auto_272248 ) ) ( not ( = ?auto_272242 ?auto_272249 ) ) ( not ( = ?auto_272242 ?auto_272250 ) ) ( not ( = ?auto_272243 ?auto_272244 ) ) ( not ( = ?auto_272243 ?auto_272245 ) ) ( not ( = ?auto_272243 ?auto_272246 ) ) ( not ( = ?auto_272243 ?auto_272247 ) ) ( not ( = ?auto_272243 ?auto_272248 ) ) ( not ( = ?auto_272243 ?auto_272249 ) ) ( not ( = ?auto_272243 ?auto_272250 ) ) ( not ( = ?auto_272244 ?auto_272245 ) ) ( not ( = ?auto_272244 ?auto_272246 ) ) ( not ( = ?auto_272244 ?auto_272247 ) ) ( not ( = ?auto_272244 ?auto_272248 ) ) ( not ( = ?auto_272244 ?auto_272249 ) ) ( not ( = ?auto_272244 ?auto_272250 ) ) ( not ( = ?auto_272245 ?auto_272246 ) ) ( not ( = ?auto_272245 ?auto_272247 ) ) ( not ( = ?auto_272245 ?auto_272248 ) ) ( not ( = ?auto_272245 ?auto_272249 ) ) ( not ( = ?auto_272245 ?auto_272250 ) ) ( not ( = ?auto_272246 ?auto_272247 ) ) ( not ( = ?auto_272246 ?auto_272248 ) ) ( not ( = ?auto_272246 ?auto_272249 ) ) ( not ( = ?auto_272246 ?auto_272250 ) ) ( not ( = ?auto_272247 ?auto_272248 ) ) ( not ( = ?auto_272247 ?auto_272249 ) ) ( not ( = ?auto_272247 ?auto_272250 ) ) ( not ( = ?auto_272248 ?auto_272249 ) ) ( not ( = ?auto_272248 ?auto_272250 ) ) ( not ( = ?auto_272249 ?auto_272250 ) ) ( ON ?auto_272248 ?auto_272249 ) ( ON ?auto_272247 ?auto_272248 ) ( ON ?auto_272246 ?auto_272247 ) ( ON ?auto_272245 ?auto_272246 ) ( CLEAR ?auto_272243 ) ( ON ?auto_272244 ?auto_272245 ) ( CLEAR ?auto_272244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_272242 ?auto_272243 ?auto_272244 )
      ( MAKE-8PILE ?auto_272242 ?auto_272243 ?auto_272244 ?auto_272245 ?auto_272246 ?auto_272247 ?auto_272248 ?auto_272249 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_272259 - BLOCK
      ?auto_272260 - BLOCK
      ?auto_272261 - BLOCK
      ?auto_272262 - BLOCK
      ?auto_272263 - BLOCK
      ?auto_272264 - BLOCK
      ?auto_272265 - BLOCK
      ?auto_272266 - BLOCK
    )
    :vars
    (
      ?auto_272267 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272266 ?auto_272267 ) ( ON-TABLE ?auto_272259 ) ( ON ?auto_272260 ?auto_272259 ) ( not ( = ?auto_272259 ?auto_272260 ) ) ( not ( = ?auto_272259 ?auto_272261 ) ) ( not ( = ?auto_272259 ?auto_272262 ) ) ( not ( = ?auto_272259 ?auto_272263 ) ) ( not ( = ?auto_272259 ?auto_272264 ) ) ( not ( = ?auto_272259 ?auto_272265 ) ) ( not ( = ?auto_272259 ?auto_272266 ) ) ( not ( = ?auto_272259 ?auto_272267 ) ) ( not ( = ?auto_272260 ?auto_272261 ) ) ( not ( = ?auto_272260 ?auto_272262 ) ) ( not ( = ?auto_272260 ?auto_272263 ) ) ( not ( = ?auto_272260 ?auto_272264 ) ) ( not ( = ?auto_272260 ?auto_272265 ) ) ( not ( = ?auto_272260 ?auto_272266 ) ) ( not ( = ?auto_272260 ?auto_272267 ) ) ( not ( = ?auto_272261 ?auto_272262 ) ) ( not ( = ?auto_272261 ?auto_272263 ) ) ( not ( = ?auto_272261 ?auto_272264 ) ) ( not ( = ?auto_272261 ?auto_272265 ) ) ( not ( = ?auto_272261 ?auto_272266 ) ) ( not ( = ?auto_272261 ?auto_272267 ) ) ( not ( = ?auto_272262 ?auto_272263 ) ) ( not ( = ?auto_272262 ?auto_272264 ) ) ( not ( = ?auto_272262 ?auto_272265 ) ) ( not ( = ?auto_272262 ?auto_272266 ) ) ( not ( = ?auto_272262 ?auto_272267 ) ) ( not ( = ?auto_272263 ?auto_272264 ) ) ( not ( = ?auto_272263 ?auto_272265 ) ) ( not ( = ?auto_272263 ?auto_272266 ) ) ( not ( = ?auto_272263 ?auto_272267 ) ) ( not ( = ?auto_272264 ?auto_272265 ) ) ( not ( = ?auto_272264 ?auto_272266 ) ) ( not ( = ?auto_272264 ?auto_272267 ) ) ( not ( = ?auto_272265 ?auto_272266 ) ) ( not ( = ?auto_272265 ?auto_272267 ) ) ( not ( = ?auto_272266 ?auto_272267 ) ) ( ON ?auto_272265 ?auto_272266 ) ( ON ?auto_272264 ?auto_272265 ) ( ON ?auto_272263 ?auto_272264 ) ( ON ?auto_272262 ?auto_272263 ) ( CLEAR ?auto_272260 ) ( ON ?auto_272261 ?auto_272262 ) ( CLEAR ?auto_272261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_272259 ?auto_272260 ?auto_272261 )
      ( MAKE-8PILE ?auto_272259 ?auto_272260 ?auto_272261 ?auto_272262 ?auto_272263 ?auto_272264 ?auto_272265 ?auto_272266 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_272276 - BLOCK
      ?auto_272277 - BLOCK
      ?auto_272278 - BLOCK
      ?auto_272279 - BLOCK
      ?auto_272280 - BLOCK
      ?auto_272281 - BLOCK
      ?auto_272282 - BLOCK
      ?auto_272283 - BLOCK
    )
    :vars
    (
      ?auto_272284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272283 ?auto_272284 ) ( ON-TABLE ?auto_272276 ) ( not ( = ?auto_272276 ?auto_272277 ) ) ( not ( = ?auto_272276 ?auto_272278 ) ) ( not ( = ?auto_272276 ?auto_272279 ) ) ( not ( = ?auto_272276 ?auto_272280 ) ) ( not ( = ?auto_272276 ?auto_272281 ) ) ( not ( = ?auto_272276 ?auto_272282 ) ) ( not ( = ?auto_272276 ?auto_272283 ) ) ( not ( = ?auto_272276 ?auto_272284 ) ) ( not ( = ?auto_272277 ?auto_272278 ) ) ( not ( = ?auto_272277 ?auto_272279 ) ) ( not ( = ?auto_272277 ?auto_272280 ) ) ( not ( = ?auto_272277 ?auto_272281 ) ) ( not ( = ?auto_272277 ?auto_272282 ) ) ( not ( = ?auto_272277 ?auto_272283 ) ) ( not ( = ?auto_272277 ?auto_272284 ) ) ( not ( = ?auto_272278 ?auto_272279 ) ) ( not ( = ?auto_272278 ?auto_272280 ) ) ( not ( = ?auto_272278 ?auto_272281 ) ) ( not ( = ?auto_272278 ?auto_272282 ) ) ( not ( = ?auto_272278 ?auto_272283 ) ) ( not ( = ?auto_272278 ?auto_272284 ) ) ( not ( = ?auto_272279 ?auto_272280 ) ) ( not ( = ?auto_272279 ?auto_272281 ) ) ( not ( = ?auto_272279 ?auto_272282 ) ) ( not ( = ?auto_272279 ?auto_272283 ) ) ( not ( = ?auto_272279 ?auto_272284 ) ) ( not ( = ?auto_272280 ?auto_272281 ) ) ( not ( = ?auto_272280 ?auto_272282 ) ) ( not ( = ?auto_272280 ?auto_272283 ) ) ( not ( = ?auto_272280 ?auto_272284 ) ) ( not ( = ?auto_272281 ?auto_272282 ) ) ( not ( = ?auto_272281 ?auto_272283 ) ) ( not ( = ?auto_272281 ?auto_272284 ) ) ( not ( = ?auto_272282 ?auto_272283 ) ) ( not ( = ?auto_272282 ?auto_272284 ) ) ( not ( = ?auto_272283 ?auto_272284 ) ) ( ON ?auto_272282 ?auto_272283 ) ( ON ?auto_272281 ?auto_272282 ) ( ON ?auto_272280 ?auto_272281 ) ( ON ?auto_272279 ?auto_272280 ) ( ON ?auto_272278 ?auto_272279 ) ( CLEAR ?auto_272276 ) ( ON ?auto_272277 ?auto_272278 ) ( CLEAR ?auto_272277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_272276 ?auto_272277 )
      ( MAKE-8PILE ?auto_272276 ?auto_272277 ?auto_272278 ?auto_272279 ?auto_272280 ?auto_272281 ?auto_272282 ?auto_272283 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_272293 - BLOCK
      ?auto_272294 - BLOCK
      ?auto_272295 - BLOCK
      ?auto_272296 - BLOCK
      ?auto_272297 - BLOCK
      ?auto_272298 - BLOCK
      ?auto_272299 - BLOCK
      ?auto_272300 - BLOCK
    )
    :vars
    (
      ?auto_272301 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272300 ?auto_272301 ) ( ON-TABLE ?auto_272293 ) ( not ( = ?auto_272293 ?auto_272294 ) ) ( not ( = ?auto_272293 ?auto_272295 ) ) ( not ( = ?auto_272293 ?auto_272296 ) ) ( not ( = ?auto_272293 ?auto_272297 ) ) ( not ( = ?auto_272293 ?auto_272298 ) ) ( not ( = ?auto_272293 ?auto_272299 ) ) ( not ( = ?auto_272293 ?auto_272300 ) ) ( not ( = ?auto_272293 ?auto_272301 ) ) ( not ( = ?auto_272294 ?auto_272295 ) ) ( not ( = ?auto_272294 ?auto_272296 ) ) ( not ( = ?auto_272294 ?auto_272297 ) ) ( not ( = ?auto_272294 ?auto_272298 ) ) ( not ( = ?auto_272294 ?auto_272299 ) ) ( not ( = ?auto_272294 ?auto_272300 ) ) ( not ( = ?auto_272294 ?auto_272301 ) ) ( not ( = ?auto_272295 ?auto_272296 ) ) ( not ( = ?auto_272295 ?auto_272297 ) ) ( not ( = ?auto_272295 ?auto_272298 ) ) ( not ( = ?auto_272295 ?auto_272299 ) ) ( not ( = ?auto_272295 ?auto_272300 ) ) ( not ( = ?auto_272295 ?auto_272301 ) ) ( not ( = ?auto_272296 ?auto_272297 ) ) ( not ( = ?auto_272296 ?auto_272298 ) ) ( not ( = ?auto_272296 ?auto_272299 ) ) ( not ( = ?auto_272296 ?auto_272300 ) ) ( not ( = ?auto_272296 ?auto_272301 ) ) ( not ( = ?auto_272297 ?auto_272298 ) ) ( not ( = ?auto_272297 ?auto_272299 ) ) ( not ( = ?auto_272297 ?auto_272300 ) ) ( not ( = ?auto_272297 ?auto_272301 ) ) ( not ( = ?auto_272298 ?auto_272299 ) ) ( not ( = ?auto_272298 ?auto_272300 ) ) ( not ( = ?auto_272298 ?auto_272301 ) ) ( not ( = ?auto_272299 ?auto_272300 ) ) ( not ( = ?auto_272299 ?auto_272301 ) ) ( not ( = ?auto_272300 ?auto_272301 ) ) ( ON ?auto_272299 ?auto_272300 ) ( ON ?auto_272298 ?auto_272299 ) ( ON ?auto_272297 ?auto_272298 ) ( ON ?auto_272296 ?auto_272297 ) ( ON ?auto_272295 ?auto_272296 ) ( CLEAR ?auto_272293 ) ( ON ?auto_272294 ?auto_272295 ) ( CLEAR ?auto_272294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_272293 ?auto_272294 )
      ( MAKE-8PILE ?auto_272293 ?auto_272294 ?auto_272295 ?auto_272296 ?auto_272297 ?auto_272298 ?auto_272299 ?auto_272300 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_272310 - BLOCK
      ?auto_272311 - BLOCK
      ?auto_272312 - BLOCK
      ?auto_272313 - BLOCK
      ?auto_272314 - BLOCK
      ?auto_272315 - BLOCK
      ?auto_272316 - BLOCK
      ?auto_272317 - BLOCK
    )
    :vars
    (
      ?auto_272318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272317 ?auto_272318 ) ( not ( = ?auto_272310 ?auto_272311 ) ) ( not ( = ?auto_272310 ?auto_272312 ) ) ( not ( = ?auto_272310 ?auto_272313 ) ) ( not ( = ?auto_272310 ?auto_272314 ) ) ( not ( = ?auto_272310 ?auto_272315 ) ) ( not ( = ?auto_272310 ?auto_272316 ) ) ( not ( = ?auto_272310 ?auto_272317 ) ) ( not ( = ?auto_272310 ?auto_272318 ) ) ( not ( = ?auto_272311 ?auto_272312 ) ) ( not ( = ?auto_272311 ?auto_272313 ) ) ( not ( = ?auto_272311 ?auto_272314 ) ) ( not ( = ?auto_272311 ?auto_272315 ) ) ( not ( = ?auto_272311 ?auto_272316 ) ) ( not ( = ?auto_272311 ?auto_272317 ) ) ( not ( = ?auto_272311 ?auto_272318 ) ) ( not ( = ?auto_272312 ?auto_272313 ) ) ( not ( = ?auto_272312 ?auto_272314 ) ) ( not ( = ?auto_272312 ?auto_272315 ) ) ( not ( = ?auto_272312 ?auto_272316 ) ) ( not ( = ?auto_272312 ?auto_272317 ) ) ( not ( = ?auto_272312 ?auto_272318 ) ) ( not ( = ?auto_272313 ?auto_272314 ) ) ( not ( = ?auto_272313 ?auto_272315 ) ) ( not ( = ?auto_272313 ?auto_272316 ) ) ( not ( = ?auto_272313 ?auto_272317 ) ) ( not ( = ?auto_272313 ?auto_272318 ) ) ( not ( = ?auto_272314 ?auto_272315 ) ) ( not ( = ?auto_272314 ?auto_272316 ) ) ( not ( = ?auto_272314 ?auto_272317 ) ) ( not ( = ?auto_272314 ?auto_272318 ) ) ( not ( = ?auto_272315 ?auto_272316 ) ) ( not ( = ?auto_272315 ?auto_272317 ) ) ( not ( = ?auto_272315 ?auto_272318 ) ) ( not ( = ?auto_272316 ?auto_272317 ) ) ( not ( = ?auto_272316 ?auto_272318 ) ) ( not ( = ?auto_272317 ?auto_272318 ) ) ( ON ?auto_272316 ?auto_272317 ) ( ON ?auto_272315 ?auto_272316 ) ( ON ?auto_272314 ?auto_272315 ) ( ON ?auto_272313 ?auto_272314 ) ( ON ?auto_272312 ?auto_272313 ) ( ON ?auto_272311 ?auto_272312 ) ( ON ?auto_272310 ?auto_272311 ) ( CLEAR ?auto_272310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_272310 )
      ( MAKE-8PILE ?auto_272310 ?auto_272311 ?auto_272312 ?auto_272313 ?auto_272314 ?auto_272315 ?auto_272316 ?auto_272317 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_272327 - BLOCK
      ?auto_272328 - BLOCK
      ?auto_272329 - BLOCK
      ?auto_272330 - BLOCK
      ?auto_272331 - BLOCK
      ?auto_272332 - BLOCK
      ?auto_272333 - BLOCK
      ?auto_272334 - BLOCK
    )
    :vars
    (
      ?auto_272335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272334 ?auto_272335 ) ( not ( = ?auto_272327 ?auto_272328 ) ) ( not ( = ?auto_272327 ?auto_272329 ) ) ( not ( = ?auto_272327 ?auto_272330 ) ) ( not ( = ?auto_272327 ?auto_272331 ) ) ( not ( = ?auto_272327 ?auto_272332 ) ) ( not ( = ?auto_272327 ?auto_272333 ) ) ( not ( = ?auto_272327 ?auto_272334 ) ) ( not ( = ?auto_272327 ?auto_272335 ) ) ( not ( = ?auto_272328 ?auto_272329 ) ) ( not ( = ?auto_272328 ?auto_272330 ) ) ( not ( = ?auto_272328 ?auto_272331 ) ) ( not ( = ?auto_272328 ?auto_272332 ) ) ( not ( = ?auto_272328 ?auto_272333 ) ) ( not ( = ?auto_272328 ?auto_272334 ) ) ( not ( = ?auto_272328 ?auto_272335 ) ) ( not ( = ?auto_272329 ?auto_272330 ) ) ( not ( = ?auto_272329 ?auto_272331 ) ) ( not ( = ?auto_272329 ?auto_272332 ) ) ( not ( = ?auto_272329 ?auto_272333 ) ) ( not ( = ?auto_272329 ?auto_272334 ) ) ( not ( = ?auto_272329 ?auto_272335 ) ) ( not ( = ?auto_272330 ?auto_272331 ) ) ( not ( = ?auto_272330 ?auto_272332 ) ) ( not ( = ?auto_272330 ?auto_272333 ) ) ( not ( = ?auto_272330 ?auto_272334 ) ) ( not ( = ?auto_272330 ?auto_272335 ) ) ( not ( = ?auto_272331 ?auto_272332 ) ) ( not ( = ?auto_272331 ?auto_272333 ) ) ( not ( = ?auto_272331 ?auto_272334 ) ) ( not ( = ?auto_272331 ?auto_272335 ) ) ( not ( = ?auto_272332 ?auto_272333 ) ) ( not ( = ?auto_272332 ?auto_272334 ) ) ( not ( = ?auto_272332 ?auto_272335 ) ) ( not ( = ?auto_272333 ?auto_272334 ) ) ( not ( = ?auto_272333 ?auto_272335 ) ) ( not ( = ?auto_272334 ?auto_272335 ) ) ( ON ?auto_272333 ?auto_272334 ) ( ON ?auto_272332 ?auto_272333 ) ( ON ?auto_272331 ?auto_272332 ) ( ON ?auto_272330 ?auto_272331 ) ( ON ?auto_272329 ?auto_272330 ) ( ON ?auto_272328 ?auto_272329 ) ( ON ?auto_272327 ?auto_272328 ) ( CLEAR ?auto_272327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_272327 )
      ( MAKE-8PILE ?auto_272327 ?auto_272328 ?auto_272329 ?auto_272330 ?auto_272331 ?auto_272332 ?auto_272333 ?auto_272334 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_272345 - BLOCK
      ?auto_272346 - BLOCK
      ?auto_272347 - BLOCK
      ?auto_272348 - BLOCK
      ?auto_272349 - BLOCK
      ?auto_272350 - BLOCK
      ?auto_272351 - BLOCK
      ?auto_272352 - BLOCK
      ?auto_272353 - BLOCK
    )
    :vars
    (
      ?auto_272354 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_272352 ) ( ON ?auto_272353 ?auto_272354 ) ( CLEAR ?auto_272353 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_272345 ) ( ON ?auto_272346 ?auto_272345 ) ( ON ?auto_272347 ?auto_272346 ) ( ON ?auto_272348 ?auto_272347 ) ( ON ?auto_272349 ?auto_272348 ) ( ON ?auto_272350 ?auto_272349 ) ( ON ?auto_272351 ?auto_272350 ) ( ON ?auto_272352 ?auto_272351 ) ( not ( = ?auto_272345 ?auto_272346 ) ) ( not ( = ?auto_272345 ?auto_272347 ) ) ( not ( = ?auto_272345 ?auto_272348 ) ) ( not ( = ?auto_272345 ?auto_272349 ) ) ( not ( = ?auto_272345 ?auto_272350 ) ) ( not ( = ?auto_272345 ?auto_272351 ) ) ( not ( = ?auto_272345 ?auto_272352 ) ) ( not ( = ?auto_272345 ?auto_272353 ) ) ( not ( = ?auto_272345 ?auto_272354 ) ) ( not ( = ?auto_272346 ?auto_272347 ) ) ( not ( = ?auto_272346 ?auto_272348 ) ) ( not ( = ?auto_272346 ?auto_272349 ) ) ( not ( = ?auto_272346 ?auto_272350 ) ) ( not ( = ?auto_272346 ?auto_272351 ) ) ( not ( = ?auto_272346 ?auto_272352 ) ) ( not ( = ?auto_272346 ?auto_272353 ) ) ( not ( = ?auto_272346 ?auto_272354 ) ) ( not ( = ?auto_272347 ?auto_272348 ) ) ( not ( = ?auto_272347 ?auto_272349 ) ) ( not ( = ?auto_272347 ?auto_272350 ) ) ( not ( = ?auto_272347 ?auto_272351 ) ) ( not ( = ?auto_272347 ?auto_272352 ) ) ( not ( = ?auto_272347 ?auto_272353 ) ) ( not ( = ?auto_272347 ?auto_272354 ) ) ( not ( = ?auto_272348 ?auto_272349 ) ) ( not ( = ?auto_272348 ?auto_272350 ) ) ( not ( = ?auto_272348 ?auto_272351 ) ) ( not ( = ?auto_272348 ?auto_272352 ) ) ( not ( = ?auto_272348 ?auto_272353 ) ) ( not ( = ?auto_272348 ?auto_272354 ) ) ( not ( = ?auto_272349 ?auto_272350 ) ) ( not ( = ?auto_272349 ?auto_272351 ) ) ( not ( = ?auto_272349 ?auto_272352 ) ) ( not ( = ?auto_272349 ?auto_272353 ) ) ( not ( = ?auto_272349 ?auto_272354 ) ) ( not ( = ?auto_272350 ?auto_272351 ) ) ( not ( = ?auto_272350 ?auto_272352 ) ) ( not ( = ?auto_272350 ?auto_272353 ) ) ( not ( = ?auto_272350 ?auto_272354 ) ) ( not ( = ?auto_272351 ?auto_272352 ) ) ( not ( = ?auto_272351 ?auto_272353 ) ) ( not ( = ?auto_272351 ?auto_272354 ) ) ( not ( = ?auto_272352 ?auto_272353 ) ) ( not ( = ?auto_272352 ?auto_272354 ) ) ( not ( = ?auto_272353 ?auto_272354 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_272353 ?auto_272354 )
      ( !STACK ?auto_272353 ?auto_272352 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_272364 - BLOCK
      ?auto_272365 - BLOCK
      ?auto_272366 - BLOCK
      ?auto_272367 - BLOCK
      ?auto_272368 - BLOCK
      ?auto_272369 - BLOCK
      ?auto_272370 - BLOCK
      ?auto_272371 - BLOCK
      ?auto_272372 - BLOCK
    )
    :vars
    (
      ?auto_272373 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_272371 ) ( ON ?auto_272372 ?auto_272373 ) ( CLEAR ?auto_272372 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_272364 ) ( ON ?auto_272365 ?auto_272364 ) ( ON ?auto_272366 ?auto_272365 ) ( ON ?auto_272367 ?auto_272366 ) ( ON ?auto_272368 ?auto_272367 ) ( ON ?auto_272369 ?auto_272368 ) ( ON ?auto_272370 ?auto_272369 ) ( ON ?auto_272371 ?auto_272370 ) ( not ( = ?auto_272364 ?auto_272365 ) ) ( not ( = ?auto_272364 ?auto_272366 ) ) ( not ( = ?auto_272364 ?auto_272367 ) ) ( not ( = ?auto_272364 ?auto_272368 ) ) ( not ( = ?auto_272364 ?auto_272369 ) ) ( not ( = ?auto_272364 ?auto_272370 ) ) ( not ( = ?auto_272364 ?auto_272371 ) ) ( not ( = ?auto_272364 ?auto_272372 ) ) ( not ( = ?auto_272364 ?auto_272373 ) ) ( not ( = ?auto_272365 ?auto_272366 ) ) ( not ( = ?auto_272365 ?auto_272367 ) ) ( not ( = ?auto_272365 ?auto_272368 ) ) ( not ( = ?auto_272365 ?auto_272369 ) ) ( not ( = ?auto_272365 ?auto_272370 ) ) ( not ( = ?auto_272365 ?auto_272371 ) ) ( not ( = ?auto_272365 ?auto_272372 ) ) ( not ( = ?auto_272365 ?auto_272373 ) ) ( not ( = ?auto_272366 ?auto_272367 ) ) ( not ( = ?auto_272366 ?auto_272368 ) ) ( not ( = ?auto_272366 ?auto_272369 ) ) ( not ( = ?auto_272366 ?auto_272370 ) ) ( not ( = ?auto_272366 ?auto_272371 ) ) ( not ( = ?auto_272366 ?auto_272372 ) ) ( not ( = ?auto_272366 ?auto_272373 ) ) ( not ( = ?auto_272367 ?auto_272368 ) ) ( not ( = ?auto_272367 ?auto_272369 ) ) ( not ( = ?auto_272367 ?auto_272370 ) ) ( not ( = ?auto_272367 ?auto_272371 ) ) ( not ( = ?auto_272367 ?auto_272372 ) ) ( not ( = ?auto_272367 ?auto_272373 ) ) ( not ( = ?auto_272368 ?auto_272369 ) ) ( not ( = ?auto_272368 ?auto_272370 ) ) ( not ( = ?auto_272368 ?auto_272371 ) ) ( not ( = ?auto_272368 ?auto_272372 ) ) ( not ( = ?auto_272368 ?auto_272373 ) ) ( not ( = ?auto_272369 ?auto_272370 ) ) ( not ( = ?auto_272369 ?auto_272371 ) ) ( not ( = ?auto_272369 ?auto_272372 ) ) ( not ( = ?auto_272369 ?auto_272373 ) ) ( not ( = ?auto_272370 ?auto_272371 ) ) ( not ( = ?auto_272370 ?auto_272372 ) ) ( not ( = ?auto_272370 ?auto_272373 ) ) ( not ( = ?auto_272371 ?auto_272372 ) ) ( not ( = ?auto_272371 ?auto_272373 ) ) ( not ( = ?auto_272372 ?auto_272373 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_272372 ?auto_272373 )
      ( !STACK ?auto_272372 ?auto_272371 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_272383 - BLOCK
      ?auto_272384 - BLOCK
      ?auto_272385 - BLOCK
      ?auto_272386 - BLOCK
      ?auto_272387 - BLOCK
      ?auto_272388 - BLOCK
      ?auto_272389 - BLOCK
      ?auto_272390 - BLOCK
      ?auto_272391 - BLOCK
    )
    :vars
    (
      ?auto_272392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272391 ?auto_272392 ) ( ON-TABLE ?auto_272383 ) ( ON ?auto_272384 ?auto_272383 ) ( ON ?auto_272385 ?auto_272384 ) ( ON ?auto_272386 ?auto_272385 ) ( ON ?auto_272387 ?auto_272386 ) ( ON ?auto_272388 ?auto_272387 ) ( ON ?auto_272389 ?auto_272388 ) ( not ( = ?auto_272383 ?auto_272384 ) ) ( not ( = ?auto_272383 ?auto_272385 ) ) ( not ( = ?auto_272383 ?auto_272386 ) ) ( not ( = ?auto_272383 ?auto_272387 ) ) ( not ( = ?auto_272383 ?auto_272388 ) ) ( not ( = ?auto_272383 ?auto_272389 ) ) ( not ( = ?auto_272383 ?auto_272390 ) ) ( not ( = ?auto_272383 ?auto_272391 ) ) ( not ( = ?auto_272383 ?auto_272392 ) ) ( not ( = ?auto_272384 ?auto_272385 ) ) ( not ( = ?auto_272384 ?auto_272386 ) ) ( not ( = ?auto_272384 ?auto_272387 ) ) ( not ( = ?auto_272384 ?auto_272388 ) ) ( not ( = ?auto_272384 ?auto_272389 ) ) ( not ( = ?auto_272384 ?auto_272390 ) ) ( not ( = ?auto_272384 ?auto_272391 ) ) ( not ( = ?auto_272384 ?auto_272392 ) ) ( not ( = ?auto_272385 ?auto_272386 ) ) ( not ( = ?auto_272385 ?auto_272387 ) ) ( not ( = ?auto_272385 ?auto_272388 ) ) ( not ( = ?auto_272385 ?auto_272389 ) ) ( not ( = ?auto_272385 ?auto_272390 ) ) ( not ( = ?auto_272385 ?auto_272391 ) ) ( not ( = ?auto_272385 ?auto_272392 ) ) ( not ( = ?auto_272386 ?auto_272387 ) ) ( not ( = ?auto_272386 ?auto_272388 ) ) ( not ( = ?auto_272386 ?auto_272389 ) ) ( not ( = ?auto_272386 ?auto_272390 ) ) ( not ( = ?auto_272386 ?auto_272391 ) ) ( not ( = ?auto_272386 ?auto_272392 ) ) ( not ( = ?auto_272387 ?auto_272388 ) ) ( not ( = ?auto_272387 ?auto_272389 ) ) ( not ( = ?auto_272387 ?auto_272390 ) ) ( not ( = ?auto_272387 ?auto_272391 ) ) ( not ( = ?auto_272387 ?auto_272392 ) ) ( not ( = ?auto_272388 ?auto_272389 ) ) ( not ( = ?auto_272388 ?auto_272390 ) ) ( not ( = ?auto_272388 ?auto_272391 ) ) ( not ( = ?auto_272388 ?auto_272392 ) ) ( not ( = ?auto_272389 ?auto_272390 ) ) ( not ( = ?auto_272389 ?auto_272391 ) ) ( not ( = ?auto_272389 ?auto_272392 ) ) ( not ( = ?auto_272390 ?auto_272391 ) ) ( not ( = ?auto_272390 ?auto_272392 ) ) ( not ( = ?auto_272391 ?auto_272392 ) ) ( CLEAR ?auto_272389 ) ( ON ?auto_272390 ?auto_272391 ) ( CLEAR ?auto_272390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_272383 ?auto_272384 ?auto_272385 ?auto_272386 ?auto_272387 ?auto_272388 ?auto_272389 ?auto_272390 )
      ( MAKE-9PILE ?auto_272383 ?auto_272384 ?auto_272385 ?auto_272386 ?auto_272387 ?auto_272388 ?auto_272389 ?auto_272390 ?auto_272391 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_272402 - BLOCK
      ?auto_272403 - BLOCK
      ?auto_272404 - BLOCK
      ?auto_272405 - BLOCK
      ?auto_272406 - BLOCK
      ?auto_272407 - BLOCK
      ?auto_272408 - BLOCK
      ?auto_272409 - BLOCK
      ?auto_272410 - BLOCK
    )
    :vars
    (
      ?auto_272411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272410 ?auto_272411 ) ( ON-TABLE ?auto_272402 ) ( ON ?auto_272403 ?auto_272402 ) ( ON ?auto_272404 ?auto_272403 ) ( ON ?auto_272405 ?auto_272404 ) ( ON ?auto_272406 ?auto_272405 ) ( ON ?auto_272407 ?auto_272406 ) ( ON ?auto_272408 ?auto_272407 ) ( not ( = ?auto_272402 ?auto_272403 ) ) ( not ( = ?auto_272402 ?auto_272404 ) ) ( not ( = ?auto_272402 ?auto_272405 ) ) ( not ( = ?auto_272402 ?auto_272406 ) ) ( not ( = ?auto_272402 ?auto_272407 ) ) ( not ( = ?auto_272402 ?auto_272408 ) ) ( not ( = ?auto_272402 ?auto_272409 ) ) ( not ( = ?auto_272402 ?auto_272410 ) ) ( not ( = ?auto_272402 ?auto_272411 ) ) ( not ( = ?auto_272403 ?auto_272404 ) ) ( not ( = ?auto_272403 ?auto_272405 ) ) ( not ( = ?auto_272403 ?auto_272406 ) ) ( not ( = ?auto_272403 ?auto_272407 ) ) ( not ( = ?auto_272403 ?auto_272408 ) ) ( not ( = ?auto_272403 ?auto_272409 ) ) ( not ( = ?auto_272403 ?auto_272410 ) ) ( not ( = ?auto_272403 ?auto_272411 ) ) ( not ( = ?auto_272404 ?auto_272405 ) ) ( not ( = ?auto_272404 ?auto_272406 ) ) ( not ( = ?auto_272404 ?auto_272407 ) ) ( not ( = ?auto_272404 ?auto_272408 ) ) ( not ( = ?auto_272404 ?auto_272409 ) ) ( not ( = ?auto_272404 ?auto_272410 ) ) ( not ( = ?auto_272404 ?auto_272411 ) ) ( not ( = ?auto_272405 ?auto_272406 ) ) ( not ( = ?auto_272405 ?auto_272407 ) ) ( not ( = ?auto_272405 ?auto_272408 ) ) ( not ( = ?auto_272405 ?auto_272409 ) ) ( not ( = ?auto_272405 ?auto_272410 ) ) ( not ( = ?auto_272405 ?auto_272411 ) ) ( not ( = ?auto_272406 ?auto_272407 ) ) ( not ( = ?auto_272406 ?auto_272408 ) ) ( not ( = ?auto_272406 ?auto_272409 ) ) ( not ( = ?auto_272406 ?auto_272410 ) ) ( not ( = ?auto_272406 ?auto_272411 ) ) ( not ( = ?auto_272407 ?auto_272408 ) ) ( not ( = ?auto_272407 ?auto_272409 ) ) ( not ( = ?auto_272407 ?auto_272410 ) ) ( not ( = ?auto_272407 ?auto_272411 ) ) ( not ( = ?auto_272408 ?auto_272409 ) ) ( not ( = ?auto_272408 ?auto_272410 ) ) ( not ( = ?auto_272408 ?auto_272411 ) ) ( not ( = ?auto_272409 ?auto_272410 ) ) ( not ( = ?auto_272409 ?auto_272411 ) ) ( not ( = ?auto_272410 ?auto_272411 ) ) ( CLEAR ?auto_272408 ) ( ON ?auto_272409 ?auto_272410 ) ( CLEAR ?auto_272409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_272402 ?auto_272403 ?auto_272404 ?auto_272405 ?auto_272406 ?auto_272407 ?auto_272408 ?auto_272409 )
      ( MAKE-9PILE ?auto_272402 ?auto_272403 ?auto_272404 ?auto_272405 ?auto_272406 ?auto_272407 ?auto_272408 ?auto_272409 ?auto_272410 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_272421 - BLOCK
      ?auto_272422 - BLOCK
      ?auto_272423 - BLOCK
      ?auto_272424 - BLOCK
      ?auto_272425 - BLOCK
      ?auto_272426 - BLOCK
      ?auto_272427 - BLOCK
      ?auto_272428 - BLOCK
      ?auto_272429 - BLOCK
    )
    :vars
    (
      ?auto_272430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272429 ?auto_272430 ) ( ON-TABLE ?auto_272421 ) ( ON ?auto_272422 ?auto_272421 ) ( ON ?auto_272423 ?auto_272422 ) ( ON ?auto_272424 ?auto_272423 ) ( ON ?auto_272425 ?auto_272424 ) ( ON ?auto_272426 ?auto_272425 ) ( not ( = ?auto_272421 ?auto_272422 ) ) ( not ( = ?auto_272421 ?auto_272423 ) ) ( not ( = ?auto_272421 ?auto_272424 ) ) ( not ( = ?auto_272421 ?auto_272425 ) ) ( not ( = ?auto_272421 ?auto_272426 ) ) ( not ( = ?auto_272421 ?auto_272427 ) ) ( not ( = ?auto_272421 ?auto_272428 ) ) ( not ( = ?auto_272421 ?auto_272429 ) ) ( not ( = ?auto_272421 ?auto_272430 ) ) ( not ( = ?auto_272422 ?auto_272423 ) ) ( not ( = ?auto_272422 ?auto_272424 ) ) ( not ( = ?auto_272422 ?auto_272425 ) ) ( not ( = ?auto_272422 ?auto_272426 ) ) ( not ( = ?auto_272422 ?auto_272427 ) ) ( not ( = ?auto_272422 ?auto_272428 ) ) ( not ( = ?auto_272422 ?auto_272429 ) ) ( not ( = ?auto_272422 ?auto_272430 ) ) ( not ( = ?auto_272423 ?auto_272424 ) ) ( not ( = ?auto_272423 ?auto_272425 ) ) ( not ( = ?auto_272423 ?auto_272426 ) ) ( not ( = ?auto_272423 ?auto_272427 ) ) ( not ( = ?auto_272423 ?auto_272428 ) ) ( not ( = ?auto_272423 ?auto_272429 ) ) ( not ( = ?auto_272423 ?auto_272430 ) ) ( not ( = ?auto_272424 ?auto_272425 ) ) ( not ( = ?auto_272424 ?auto_272426 ) ) ( not ( = ?auto_272424 ?auto_272427 ) ) ( not ( = ?auto_272424 ?auto_272428 ) ) ( not ( = ?auto_272424 ?auto_272429 ) ) ( not ( = ?auto_272424 ?auto_272430 ) ) ( not ( = ?auto_272425 ?auto_272426 ) ) ( not ( = ?auto_272425 ?auto_272427 ) ) ( not ( = ?auto_272425 ?auto_272428 ) ) ( not ( = ?auto_272425 ?auto_272429 ) ) ( not ( = ?auto_272425 ?auto_272430 ) ) ( not ( = ?auto_272426 ?auto_272427 ) ) ( not ( = ?auto_272426 ?auto_272428 ) ) ( not ( = ?auto_272426 ?auto_272429 ) ) ( not ( = ?auto_272426 ?auto_272430 ) ) ( not ( = ?auto_272427 ?auto_272428 ) ) ( not ( = ?auto_272427 ?auto_272429 ) ) ( not ( = ?auto_272427 ?auto_272430 ) ) ( not ( = ?auto_272428 ?auto_272429 ) ) ( not ( = ?auto_272428 ?auto_272430 ) ) ( not ( = ?auto_272429 ?auto_272430 ) ) ( ON ?auto_272428 ?auto_272429 ) ( CLEAR ?auto_272426 ) ( ON ?auto_272427 ?auto_272428 ) ( CLEAR ?auto_272427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_272421 ?auto_272422 ?auto_272423 ?auto_272424 ?auto_272425 ?auto_272426 ?auto_272427 )
      ( MAKE-9PILE ?auto_272421 ?auto_272422 ?auto_272423 ?auto_272424 ?auto_272425 ?auto_272426 ?auto_272427 ?auto_272428 ?auto_272429 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_272440 - BLOCK
      ?auto_272441 - BLOCK
      ?auto_272442 - BLOCK
      ?auto_272443 - BLOCK
      ?auto_272444 - BLOCK
      ?auto_272445 - BLOCK
      ?auto_272446 - BLOCK
      ?auto_272447 - BLOCK
      ?auto_272448 - BLOCK
    )
    :vars
    (
      ?auto_272449 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272448 ?auto_272449 ) ( ON-TABLE ?auto_272440 ) ( ON ?auto_272441 ?auto_272440 ) ( ON ?auto_272442 ?auto_272441 ) ( ON ?auto_272443 ?auto_272442 ) ( ON ?auto_272444 ?auto_272443 ) ( ON ?auto_272445 ?auto_272444 ) ( not ( = ?auto_272440 ?auto_272441 ) ) ( not ( = ?auto_272440 ?auto_272442 ) ) ( not ( = ?auto_272440 ?auto_272443 ) ) ( not ( = ?auto_272440 ?auto_272444 ) ) ( not ( = ?auto_272440 ?auto_272445 ) ) ( not ( = ?auto_272440 ?auto_272446 ) ) ( not ( = ?auto_272440 ?auto_272447 ) ) ( not ( = ?auto_272440 ?auto_272448 ) ) ( not ( = ?auto_272440 ?auto_272449 ) ) ( not ( = ?auto_272441 ?auto_272442 ) ) ( not ( = ?auto_272441 ?auto_272443 ) ) ( not ( = ?auto_272441 ?auto_272444 ) ) ( not ( = ?auto_272441 ?auto_272445 ) ) ( not ( = ?auto_272441 ?auto_272446 ) ) ( not ( = ?auto_272441 ?auto_272447 ) ) ( not ( = ?auto_272441 ?auto_272448 ) ) ( not ( = ?auto_272441 ?auto_272449 ) ) ( not ( = ?auto_272442 ?auto_272443 ) ) ( not ( = ?auto_272442 ?auto_272444 ) ) ( not ( = ?auto_272442 ?auto_272445 ) ) ( not ( = ?auto_272442 ?auto_272446 ) ) ( not ( = ?auto_272442 ?auto_272447 ) ) ( not ( = ?auto_272442 ?auto_272448 ) ) ( not ( = ?auto_272442 ?auto_272449 ) ) ( not ( = ?auto_272443 ?auto_272444 ) ) ( not ( = ?auto_272443 ?auto_272445 ) ) ( not ( = ?auto_272443 ?auto_272446 ) ) ( not ( = ?auto_272443 ?auto_272447 ) ) ( not ( = ?auto_272443 ?auto_272448 ) ) ( not ( = ?auto_272443 ?auto_272449 ) ) ( not ( = ?auto_272444 ?auto_272445 ) ) ( not ( = ?auto_272444 ?auto_272446 ) ) ( not ( = ?auto_272444 ?auto_272447 ) ) ( not ( = ?auto_272444 ?auto_272448 ) ) ( not ( = ?auto_272444 ?auto_272449 ) ) ( not ( = ?auto_272445 ?auto_272446 ) ) ( not ( = ?auto_272445 ?auto_272447 ) ) ( not ( = ?auto_272445 ?auto_272448 ) ) ( not ( = ?auto_272445 ?auto_272449 ) ) ( not ( = ?auto_272446 ?auto_272447 ) ) ( not ( = ?auto_272446 ?auto_272448 ) ) ( not ( = ?auto_272446 ?auto_272449 ) ) ( not ( = ?auto_272447 ?auto_272448 ) ) ( not ( = ?auto_272447 ?auto_272449 ) ) ( not ( = ?auto_272448 ?auto_272449 ) ) ( ON ?auto_272447 ?auto_272448 ) ( CLEAR ?auto_272445 ) ( ON ?auto_272446 ?auto_272447 ) ( CLEAR ?auto_272446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_272440 ?auto_272441 ?auto_272442 ?auto_272443 ?auto_272444 ?auto_272445 ?auto_272446 )
      ( MAKE-9PILE ?auto_272440 ?auto_272441 ?auto_272442 ?auto_272443 ?auto_272444 ?auto_272445 ?auto_272446 ?auto_272447 ?auto_272448 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_272459 - BLOCK
      ?auto_272460 - BLOCK
      ?auto_272461 - BLOCK
      ?auto_272462 - BLOCK
      ?auto_272463 - BLOCK
      ?auto_272464 - BLOCK
      ?auto_272465 - BLOCK
      ?auto_272466 - BLOCK
      ?auto_272467 - BLOCK
    )
    :vars
    (
      ?auto_272468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272467 ?auto_272468 ) ( ON-TABLE ?auto_272459 ) ( ON ?auto_272460 ?auto_272459 ) ( ON ?auto_272461 ?auto_272460 ) ( ON ?auto_272462 ?auto_272461 ) ( ON ?auto_272463 ?auto_272462 ) ( not ( = ?auto_272459 ?auto_272460 ) ) ( not ( = ?auto_272459 ?auto_272461 ) ) ( not ( = ?auto_272459 ?auto_272462 ) ) ( not ( = ?auto_272459 ?auto_272463 ) ) ( not ( = ?auto_272459 ?auto_272464 ) ) ( not ( = ?auto_272459 ?auto_272465 ) ) ( not ( = ?auto_272459 ?auto_272466 ) ) ( not ( = ?auto_272459 ?auto_272467 ) ) ( not ( = ?auto_272459 ?auto_272468 ) ) ( not ( = ?auto_272460 ?auto_272461 ) ) ( not ( = ?auto_272460 ?auto_272462 ) ) ( not ( = ?auto_272460 ?auto_272463 ) ) ( not ( = ?auto_272460 ?auto_272464 ) ) ( not ( = ?auto_272460 ?auto_272465 ) ) ( not ( = ?auto_272460 ?auto_272466 ) ) ( not ( = ?auto_272460 ?auto_272467 ) ) ( not ( = ?auto_272460 ?auto_272468 ) ) ( not ( = ?auto_272461 ?auto_272462 ) ) ( not ( = ?auto_272461 ?auto_272463 ) ) ( not ( = ?auto_272461 ?auto_272464 ) ) ( not ( = ?auto_272461 ?auto_272465 ) ) ( not ( = ?auto_272461 ?auto_272466 ) ) ( not ( = ?auto_272461 ?auto_272467 ) ) ( not ( = ?auto_272461 ?auto_272468 ) ) ( not ( = ?auto_272462 ?auto_272463 ) ) ( not ( = ?auto_272462 ?auto_272464 ) ) ( not ( = ?auto_272462 ?auto_272465 ) ) ( not ( = ?auto_272462 ?auto_272466 ) ) ( not ( = ?auto_272462 ?auto_272467 ) ) ( not ( = ?auto_272462 ?auto_272468 ) ) ( not ( = ?auto_272463 ?auto_272464 ) ) ( not ( = ?auto_272463 ?auto_272465 ) ) ( not ( = ?auto_272463 ?auto_272466 ) ) ( not ( = ?auto_272463 ?auto_272467 ) ) ( not ( = ?auto_272463 ?auto_272468 ) ) ( not ( = ?auto_272464 ?auto_272465 ) ) ( not ( = ?auto_272464 ?auto_272466 ) ) ( not ( = ?auto_272464 ?auto_272467 ) ) ( not ( = ?auto_272464 ?auto_272468 ) ) ( not ( = ?auto_272465 ?auto_272466 ) ) ( not ( = ?auto_272465 ?auto_272467 ) ) ( not ( = ?auto_272465 ?auto_272468 ) ) ( not ( = ?auto_272466 ?auto_272467 ) ) ( not ( = ?auto_272466 ?auto_272468 ) ) ( not ( = ?auto_272467 ?auto_272468 ) ) ( ON ?auto_272466 ?auto_272467 ) ( ON ?auto_272465 ?auto_272466 ) ( CLEAR ?auto_272463 ) ( ON ?auto_272464 ?auto_272465 ) ( CLEAR ?auto_272464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_272459 ?auto_272460 ?auto_272461 ?auto_272462 ?auto_272463 ?auto_272464 )
      ( MAKE-9PILE ?auto_272459 ?auto_272460 ?auto_272461 ?auto_272462 ?auto_272463 ?auto_272464 ?auto_272465 ?auto_272466 ?auto_272467 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_272478 - BLOCK
      ?auto_272479 - BLOCK
      ?auto_272480 - BLOCK
      ?auto_272481 - BLOCK
      ?auto_272482 - BLOCK
      ?auto_272483 - BLOCK
      ?auto_272484 - BLOCK
      ?auto_272485 - BLOCK
      ?auto_272486 - BLOCK
    )
    :vars
    (
      ?auto_272487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272486 ?auto_272487 ) ( ON-TABLE ?auto_272478 ) ( ON ?auto_272479 ?auto_272478 ) ( ON ?auto_272480 ?auto_272479 ) ( ON ?auto_272481 ?auto_272480 ) ( ON ?auto_272482 ?auto_272481 ) ( not ( = ?auto_272478 ?auto_272479 ) ) ( not ( = ?auto_272478 ?auto_272480 ) ) ( not ( = ?auto_272478 ?auto_272481 ) ) ( not ( = ?auto_272478 ?auto_272482 ) ) ( not ( = ?auto_272478 ?auto_272483 ) ) ( not ( = ?auto_272478 ?auto_272484 ) ) ( not ( = ?auto_272478 ?auto_272485 ) ) ( not ( = ?auto_272478 ?auto_272486 ) ) ( not ( = ?auto_272478 ?auto_272487 ) ) ( not ( = ?auto_272479 ?auto_272480 ) ) ( not ( = ?auto_272479 ?auto_272481 ) ) ( not ( = ?auto_272479 ?auto_272482 ) ) ( not ( = ?auto_272479 ?auto_272483 ) ) ( not ( = ?auto_272479 ?auto_272484 ) ) ( not ( = ?auto_272479 ?auto_272485 ) ) ( not ( = ?auto_272479 ?auto_272486 ) ) ( not ( = ?auto_272479 ?auto_272487 ) ) ( not ( = ?auto_272480 ?auto_272481 ) ) ( not ( = ?auto_272480 ?auto_272482 ) ) ( not ( = ?auto_272480 ?auto_272483 ) ) ( not ( = ?auto_272480 ?auto_272484 ) ) ( not ( = ?auto_272480 ?auto_272485 ) ) ( not ( = ?auto_272480 ?auto_272486 ) ) ( not ( = ?auto_272480 ?auto_272487 ) ) ( not ( = ?auto_272481 ?auto_272482 ) ) ( not ( = ?auto_272481 ?auto_272483 ) ) ( not ( = ?auto_272481 ?auto_272484 ) ) ( not ( = ?auto_272481 ?auto_272485 ) ) ( not ( = ?auto_272481 ?auto_272486 ) ) ( not ( = ?auto_272481 ?auto_272487 ) ) ( not ( = ?auto_272482 ?auto_272483 ) ) ( not ( = ?auto_272482 ?auto_272484 ) ) ( not ( = ?auto_272482 ?auto_272485 ) ) ( not ( = ?auto_272482 ?auto_272486 ) ) ( not ( = ?auto_272482 ?auto_272487 ) ) ( not ( = ?auto_272483 ?auto_272484 ) ) ( not ( = ?auto_272483 ?auto_272485 ) ) ( not ( = ?auto_272483 ?auto_272486 ) ) ( not ( = ?auto_272483 ?auto_272487 ) ) ( not ( = ?auto_272484 ?auto_272485 ) ) ( not ( = ?auto_272484 ?auto_272486 ) ) ( not ( = ?auto_272484 ?auto_272487 ) ) ( not ( = ?auto_272485 ?auto_272486 ) ) ( not ( = ?auto_272485 ?auto_272487 ) ) ( not ( = ?auto_272486 ?auto_272487 ) ) ( ON ?auto_272485 ?auto_272486 ) ( ON ?auto_272484 ?auto_272485 ) ( CLEAR ?auto_272482 ) ( ON ?auto_272483 ?auto_272484 ) ( CLEAR ?auto_272483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_272478 ?auto_272479 ?auto_272480 ?auto_272481 ?auto_272482 ?auto_272483 )
      ( MAKE-9PILE ?auto_272478 ?auto_272479 ?auto_272480 ?auto_272481 ?auto_272482 ?auto_272483 ?auto_272484 ?auto_272485 ?auto_272486 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_272497 - BLOCK
      ?auto_272498 - BLOCK
      ?auto_272499 - BLOCK
      ?auto_272500 - BLOCK
      ?auto_272501 - BLOCK
      ?auto_272502 - BLOCK
      ?auto_272503 - BLOCK
      ?auto_272504 - BLOCK
      ?auto_272505 - BLOCK
    )
    :vars
    (
      ?auto_272506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272505 ?auto_272506 ) ( ON-TABLE ?auto_272497 ) ( ON ?auto_272498 ?auto_272497 ) ( ON ?auto_272499 ?auto_272498 ) ( ON ?auto_272500 ?auto_272499 ) ( not ( = ?auto_272497 ?auto_272498 ) ) ( not ( = ?auto_272497 ?auto_272499 ) ) ( not ( = ?auto_272497 ?auto_272500 ) ) ( not ( = ?auto_272497 ?auto_272501 ) ) ( not ( = ?auto_272497 ?auto_272502 ) ) ( not ( = ?auto_272497 ?auto_272503 ) ) ( not ( = ?auto_272497 ?auto_272504 ) ) ( not ( = ?auto_272497 ?auto_272505 ) ) ( not ( = ?auto_272497 ?auto_272506 ) ) ( not ( = ?auto_272498 ?auto_272499 ) ) ( not ( = ?auto_272498 ?auto_272500 ) ) ( not ( = ?auto_272498 ?auto_272501 ) ) ( not ( = ?auto_272498 ?auto_272502 ) ) ( not ( = ?auto_272498 ?auto_272503 ) ) ( not ( = ?auto_272498 ?auto_272504 ) ) ( not ( = ?auto_272498 ?auto_272505 ) ) ( not ( = ?auto_272498 ?auto_272506 ) ) ( not ( = ?auto_272499 ?auto_272500 ) ) ( not ( = ?auto_272499 ?auto_272501 ) ) ( not ( = ?auto_272499 ?auto_272502 ) ) ( not ( = ?auto_272499 ?auto_272503 ) ) ( not ( = ?auto_272499 ?auto_272504 ) ) ( not ( = ?auto_272499 ?auto_272505 ) ) ( not ( = ?auto_272499 ?auto_272506 ) ) ( not ( = ?auto_272500 ?auto_272501 ) ) ( not ( = ?auto_272500 ?auto_272502 ) ) ( not ( = ?auto_272500 ?auto_272503 ) ) ( not ( = ?auto_272500 ?auto_272504 ) ) ( not ( = ?auto_272500 ?auto_272505 ) ) ( not ( = ?auto_272500 ?auto_272506 ) ) ( not ( = ?auto_272501 ?auto_272502 ) ) ( not ( = ?auto_272501 ?auto_272503 ) ) ( not ( = ?auto_272501 ?auto_272504 ) ) ( not ( = ?auto_272501 ?auto_272505 ) ) ( not ( = ?auto_272501 ?auto_272506 ) ) ( not ( = ?auto_272502 ?auto_272503 ) ) ( not ( = ?auto_272502 ?auto_272504 ) ) ( not ( = ?auto_272502 ?auto_272505 ) ) ( not ( = ?auto_272502 ?auto_272506 ) ) ( not ( = ?auto_272503 ?auto_272504 ) ) ( not ( = ?auto_272503 ?auto_272505 ) ) ( not ( = ?auto_272503 ?auto_272506 ) ) ( not ( = ?auto_272504 ?auto_272505 ) ) ( not ( = ?auto_272504 ?auto_272506 ) ) ( not ( = ?auto_272505 ?auto_272506 ) ) ( ON ?auto_272504 ?auto_272505 ) ( ON ?auto_272503 ?auto_272504 ) ( ON ?auto_272502 ?auto_272503 ) ( CLEAR ?auto_272500 ) ( ON ?auto_272501 ?auto_272502 ) ( CLEAR ?auto_272501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_272497 ?auto_272498 ?auto_272499 ?auto_272500 ?auto_272501 )
      ( MAKE-9PILE ?auto_272497 ?auto_272498 ?auto_272499 ?auto_272500 ?auto_272501 ?auto_272502 ?auto_272503 ?auto_272504 ?auto_272505 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_272516 - BLOCK
      ?auto_272517 - BLOCK
      ?auto_272518 - BLOCK
      ?auto_272519 - BLOCK
      ?auto_272520 - BLOCK
      ?auto_272521 - BLOCK
      ?auto_272522 - BLOCK
      ?auto_272523 - BLOCK
      ?auto_272524 - BLOCK
    )
    :vars
    (
      ?auto_272525 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272524 ?auto_272525 ) ( ON-TABLE ?auto_272516 ) ( ON ?auto_272517 ?auto_272516 ) ( ON ?auto_272518 ?auto_272517 ) ( ON ?auto_272519 ?auto_272518 ) ( not ( = ?auto_272516 ?auto_272517 ) ) ( not ( = ?auto_272516 ?auto_272518 ) ) ( not ( = ?auto_272516 ?auto_272519 ) ) ( not ( = ?auto_272516 ?auto_272520 ) ) ( not ( = ?auto_272516 ?auto_272521 ) ) ( not ( = ?auto_272516 ?auto_272522 ) ) ( not ( = ?auto_272516 ?auto_272523 ) ) ( not ( = ?auto_272516 ?auto_272524 ) ) ( not ( = ?auto_272516 ?auto_272525 ) ) ( not ( = ?auto_272517 ?auto_272518 ) ) ( not ( = ?auto_272517 ?auto_272519 ) ) ( not ( = ?auto_272517 ?auto_272520 ) ) ( not ( = ?auto_272517 ?auto_272521 ) ) ( not ( = ?auto_272517 ?auto_272522 ) ) ( not ( = ?auto_272517 ?auto_272523 ) ) ( not ( = ?auto_272517 ?auto_272524 ) ) ( not ( = ?auto_272517 ?auto_272525 ) ) ( not ( = ?auto_272518 ?auto_272519 ) ) ( not ( = ?auto_272518 ?auto_272520 ) ) ( not ( = ?auto_272518 ?auto_272521 ) ) ( not ( = ?auto_272518 ?auto_272522 ) ) ( not ( = ?auto_272518 ?auto_272523 ) ) ( not ( = ?auto_272518 ?auto_272524 ) ) ( not ( = ?auto_272518 ?auto_272525 ) ) ( not ( = ?auto_272519 ?auto_272520 ) ) ( not ( = ?auto_272519 ?auto_272521 ) ) ( not ( = ?auto_272519 ?auto_272522 ) ) ( not ( = ?auto_272519 ?auto_272523 ) ) ( not ( = ?auto_272519 ?auto_272524 ) ) ( not ( = ?auto_272519 ?auto_272525 ) ) ( not ( = ?auto_272520 ?auto_272521 ) ) ( not ( = ?auto_272520 ?auto_272522 ) ) ( not ( = ?auto_272520 ?auto_272523 ) ) ( not ( = ?auto_272520 ?auto_272524 ) ) ( not ( = ?auto_272520 ?auto_272525 ) ) ( not ( = ?auto_272521 ?auto_272522 ) ) ( not ( = ?auto_272521 ?auto_272523 ) ) ( not ( = ?auto_272521 ?auto_272524 ) ) ( not ( = ?auto_272521 ?auto_272525 ) ) ( not ( = ?auto_272522 ?auto_272523 ) ) ( not ( = ?auto_272522 ?auto_272524 ) ) ( not ( = ?auto_272522 ?auto_272525 ) ) ( not ( = ?auto_272523 ?auto_272524 ) ) ( not ( = ?auto_272523 ?auto_272525 ) ) ( not ( = ?auto_272524 ?auto_272525 ) ) ( ON ?auto_272523 ?auto_272524 ) ( ON ?auto_272522 ?auto_272523 ) ( ON ?auto_272521 ?auto_272522 ) ( CLEAR ?auto_272519 ) ( ON ?auto_272520 ?auto_272521 ) ( CLEAR ?auto_272520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_272516 ?auto_272517 ?auto_272518 ?auto_272519 ?auto_272520 )
      ( MAKE-9PILE ?auto_272516 ?auto_272517 ?auto_272518 ?auto_272519 ?auto_272520 ?auto_272521 ?auto_272522 ?auto_272523 ?auto_272524 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_272535 - BLOCK
      ?auto_272536 - BLOCK
      ?auto_272537 - BLOCK
      ?auto_272538 - BLOCK
      ?auto_272539 - BLOCK
      ?auto_272540 - BLOCK
      ?auto_272541 - BLOCK
      ?auto_272542 - BLOCK
      ?auto_272543 - BLOCK
    )
    :vars
    (
      ?auto_272544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272543 ?auto_272544 ) ( ON-TABLE ?auto_272535 ) ( ON ?auto_272536 ?auto_272535 ) ( ON ?auto_272537 ?auto_272536 ) ( not ( = ?auto_272535 ?auto_272536 ) ) ( not ( = ?auto_272535 ?auto_272537 ) ) ( not ( = ?auto_272535 ?auto_272538 ) ) ( not ( = ?auto_272535 ?auto_272539 ) ) ( not ( = ?auto_272535 ?auto_272540 ) ) ( not ( = ?auto_272535 ?auto_272541 ) ) ( not ( = ?auto_272535 ?auto_272542 ) ) ( not ( = ?auto_272535 ?auto_272543 ) ) ( not ( = ?auto_272535 ?auto_272544 ) ) ( not ( = ?auto_272536 ?auto_272537 ) ) ( not ( = ?auto_272536 ?auto_272538 ) ) ( not ( = ?auto_272536 ?auto_272539 ) ) ( not ( = ?auto_272536 ?auto_272540 ) ) ( not ( = ?auto_272536 ?auto_272541 ) ) ( not ( = ?auto_272536 ?auto_272542 ) ) ( not ( = ?auto_272536 ?auto_272543 ) ) ( not ( = ?auto_272536 ?auto_272544 ) ) ( not ( = ?auto_272537 ?auto_272538 ) ) ( not ( = ?auto_272537 ?auto_272539 ) ) ( not ( = ?auto_272537 ?auto_272540 ) ) ( not ( = ?auto_272537 ?auto_272541 ) ) ( not ( = ?auto_272537 ?auto_272542 ) ) ( not ( = ?auto_272537 ?auto_272543 ) ) ( not ( = ?auto_272537 ?auto_272544 ) ) ( not ( = ?auto_272538 ?auto_272539 ) ) ( not ( = ?auto_272538 ?auto_272540 ) ) ( not ( = ?auto_272538 ?auto_272541 ) ) ( not ( = ?auto_272538 ?auto_272542 ) ) ( not ( = ?auto_272538 ?auto_272543 ) ) ( not ( = ?auto_272538 ?auto_272544 ) ) ( not ( = ?auto_272539 ?auto_272540 ) ) ( not ( = ?auto_272539 ?auto_272541 ) ) ( not ( = ?auto_272539 ?auto_272542 ) ) ( not ( = ?auto_272539 ?auto_272543 ) ) ( not ( = ?auto_272539 ?auto_272544 ) ) ( not ( = ?auto_272540 ?auto_272541 ) ) ( not ( = ?auto_272540 ?auto_272542 ) ) ( not ( = ?auto_272540 ?auto_272543 ) ) ( not ( = ?auto_272540 ?auto_272544 ) ) ( not ( = ?auto_272541 ?auto_272542 ) ) ( not ( = ?auto_272541 ?auto_272543 ) ) ( not ( = ?auto_272541 ?auto_272544 ) ) ( not ( = ?auto_272542 ?auto_272543 ) ) ( not ( = ?auto_272542 ?auto_272544 ) ) ( not ( = ?auto_272543 ?auto_272544 ) ) ( ON ?auto_272542 ?auto_272543 ) ( ON ?auto_272541 ?auto_272542 ) ( ON ?auto_272540 ?auto_272541 ) ( ON ?auto_272539 ?auto_272540 ) ( CLEAR ?auto_272537 ) ( ON ?auto_272538 ?auto_272539 ) ( CLEAR ?auto_272538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_272535 ?auto_272536 ?auto_272537 ?auto_272538 )
      ( MAKE-9PILE ?auto_272535 ?auto_272536 ?auto_272537 ?auto_272538 ?auto_272539 ?auto_272540 ?auto_272541 ?auto_272542 ?auto_272543 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_272554 - BLOCK
      ?auto_272555 - BLOCK
      ?auto_272556 - BLOCK
      ?auto_272557 - BLOCK
      ?auto_272558 - BLOCK
      ?auto_272559 - BLOCK
      ?auto_272560 - BLOCK
      ?auto_272561 - BLOCK
      ?auto_272562 - BLOCK
    )
    :vars
    (
      ?auto_272563 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272562 ?auto_272563 ) ( ON-TABLE ?auto_272554 ) ( ON ?auto_272555 ?auto_272554 ) ( ON ?auto_272556 ?auto_272555 ) ( not ( = ?auto_272554 ?auto_272555 ) ) ( not ( = ?auto_272554 ?auto_272556 ) ) ( not ( = ?auto_272554 ?auto_272557 ) ) ( not ( = ?auto_272554 ?auto_272558 ) ) ( not ( = ?auto_272554 ?auto_272559 ) ) ( not ( = ?auto_272554 ?auto_272560 ) ) ( not ( = ?auto_272554 ?auto_272561 ) ) ( not ( = ?auto_272554 ?auto_272562 ) ) ( not ( = ?auto_272554 ?auto_272563 ) ) ( not ( = ?auto_272555 ?auto_272556 ) ) ( not ( = ?auto_272555 ?auto_272557 ) ) ( not ( = ?auto_272555 ?auto_272558 ) ) ( not ( = ?auto_272555 ?auto_272559 ) ) ( not ( = ?auto_272555 ?auto_272560 ) ) ( not ( = ?auto_272555 ?auto_272561 ) ) ( not ( = ?auto_272555 ?auto_272562 ) ) ( not ( = ?auto_272555 ?auto_272563 ) ) ( not ( = ?auto_272556 ?auto_272557 ) ) ( not ( = ?auto_272556 ?auto_272558 ) ) ( not ( = ?auto_272556 ?auto_272559 ) ) ( not ( = ?auto_272556 ?auto_272560 ) ) ( not ( = ?auto_272556 ?auto_272561 ) ) ( not ( = ?auto_272556 ?auto_272562 ) ) ( not ( = ?auto_272556 ?auto_272563 ) ) ( not ( = ?auto_272557 ?auto_272558 ) ) ( not ( = ?auto_272557 ?auto_272559 ) ) ( not ( = ?auto_272557 ?auto_272560 ) ) ( not ( = ?auto_272557 ?auto_272561 ) ) ( not ( = ?auto_272557 ?auto_272562 ) ) ( not ( = ?auto_272557 ?auto_272563 ) ) ( not ( = ?auto_272558 ?auto_272559 ) ) ( not ( = ?auto_272558 ?auto_272560 ) ) ( not ( = ?auto_272558 ?auto_272561 ) ) ( not ( = ?auto_272558 ?auto_272562 ) ) ( not ( = ?auto_272558 ?auto_272563 ) ) ( not ( = ?auto_272559 ?auto_272560 ) ) ( not ( = ?auto_272559 ?auto_272561 ) ) ( not ( = ?auto_272559 ?auto_272562 ) ) ( not ( = ?auto_272559 ?auto_272563 ) ) ( not ( = ?auto_272560 ?auto_272561 ) ) ( not ( = ?auto_272560 ?auto_272562 ) ) ( not ( = ?auto_272560 ?auto_272563 ) ) ( not ( = ?auto_272561 ?auto_272562 ) ) ( not ( = ?auto_272561 ?auto_272563 ) ) ( not ( = ?auto_272562 ?auto_272563 ) ) ( ON ?auto_272561 ?auto_272562 ) ( ON ?auto_272560 ?auto_272561 ) ( ON ?auto_272559 ?auto_272560 ) ( ON ?auto_272558 ?auto_272559 ) ( CLEAR ?auto_272556 ) ( ON ?auto_272557 ?auto_272558 ) ( CLEAR ?auto_272557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_272554 ?auto_272555 ?auto_272556 ?auto_272557 )
      ( MAKE-9PILE ?auto_272554 ?auto_272555 ?auto_272556 ?auto_272557 ?auto_272558 ?auto_272559 ?auto_272560 ?auto_272561 ?auto_272562 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_272573 - BLOCK
      ?auto_272574 - BLOCK
      ?auto_272575 - BLOCK
      ?auto_272576 - BLOCK
      ?auto_272577 - BLOCK
      ?auto_272578 - BLOCK
      ?auto_272579 - BLOCK
      ?auto_272580 - BLOCK
      ?auto_272581 - BLOCK
    )
    :vars
    (
      ?auto_272582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272581 ?auto_272582 ) ( ON-TABLE ?auto_272573 ) ( ON ?auto_272574 ?auto_272573 ) ( not ( = ?auto_272573 ?auto_272574 ) ) ( not ( = ?auto_272573 ?auto_272575 ) ) ( not ( = ?auto_272573 ?auto_272576 ) ) ( not ( = ?auto_272573 ?auto_272577 ) ) ( not ( = ?auto_272573 ?auto_272578 ) ) ( not ( = ?auto_272573 ?auto_272579 ) ) ( not ( = ?auto_272573 ?auto_272580 ) ) ( not ( = ?auto_272573 ?auto_272581 ) ) ( not ( = ?auto_272573 ?auto_272582 ) ) ( not ( = ?auto_272574 ?auto_272575 ) ) ( not ( = ?auto_272574 ?auto_272576 ) ) ( not ( = ?auto_272574 ?auto_272577 ) ) ( not ( = ?auto_272574 ?auto_272578 ) ) ( not ( = ?auto_272574 ?auto_272579 ) ) ( not ( = ?auto_272574 ?auto_272580 ) ) ( not ( = ?auto_272574 ?auto_272581 ) ) ( not ( = ?auto_272574 ?auto_272582 ) ) ( not ( = ?auto_272575 ?auto_272576 ) ) ( not ( = ?auto_272575 ?auto_272577 ) ) ( not ( = ?auto_272575 ?auto_272578 ) ) ( not ( = ?auto_272575 ?auto_272579 ) ) ( not ( = ?auto_272575 ?auto_272580 ) ) ( not ( = ?auto_272575 ?auto_272581 ) ) ( not ( = ?auto_272575 ?auto_272582 ) ) ( not ( = ?auto_272576 ?auto_272577 ) ) ( not ( = ?auto_272576 ?auto_272578 ) ) ( not ( = ?auto_272576 ?auto_272579 ) ) ( not ( = ?auto_272576 ?auto_272580 ) ) ( not ( = ?auto_272576 ?auto_272581 ) ) ( not ( = ?auto_272576 ?auto_272582 ) ) ( not ( = ?auto_272577 ?auto_272578 ) ) ( not ( = ?auto_272577 ?auto_272579 ) ) ( not ( = ?auto_272577 ?auto_272580 ) ) ( not ( = ?auto_272577 ?auto_272581 ) ) ( not ( = ?auto_272577 ?auto_272582 ) ) ( not ( = ?auto_272578 ?auto_272579 ) ) ( not ( = ?auto_272578 ?auto_272580 ) ) ( not ( = ?auto_272578 ?auto_272581 ) ) ( not ( = ?auto_272578 ?auto_272582 ) ) ( not ( = ?auto_272579 ?auto_272580 ) ) ( not ( = ?auto_272579 ?auto_272581 ) ) ( not ( = ?auto_272579 ?auto_272582 ) ) ( not ( = ?auto_272580 ?auto_272581 ) ) ( not ( = ?auto_272580 ?auto_272582 ) ) ( not ( = ?auto_272581 ?auto_272582 ) ) ( ON ?auto_272580 ?auto_272581 ) ( ON ?auto_272579 ?auto_272580 ) ( ON ?auto_272578 ?auto_272579 ) ( ON ?auto_272577 ?auto_272578 ) ( ON ?auto_272576 ?auto_272577 ) ( CLEAR ?auto_272574 ) ( ON ?auto_272575 ?auto_272576 ) ( CLEAR ?auto_272575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_272573 ?auto_272574 ?auto_272575 )
      ( MAKE-9PILE ?auto_272573 ?auto_272574 ?auto_272575 ?auto_272576 ?auto_272577 ?auto_272578 ?auto_272579 ?auto_272580 ?auto_272581 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_272592 - BLOCK
      ?auto_272593 - BLOCK
      ?auto_272594 - BLOCK
      ?auto_272595 - BLOCK
      ?auto_272596 - BLOCK
      ?auto_272597 - BLOCK
      ?auto_272598 - BLOCK
      ?auto_272599 - BLOCK
      ?auto_272600 - BLOCK
    )
    :vars
    (
      ?auto_272601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272600 ?auto_272601 ) ( ON-TABLE ?auto_272592 ) ( ON ?auto_272593 ?auto_272592 ) ( not ( = ?auto_272592 ?auto_272593 ) ) ( not ( = ?auto_272592 ?auto_272594 ) ) ( not ( = ?auto_272592 ?auto_272595 ) ) ( not ( = ?auto_272592 ?auto_272596 ) ) ( not ( = ?auto_272592 ?auto_272597 ) ) ( not ( = ?auto_272592 ?auto_272598 ) ) ( not ( = ?auto_272592 ?auto_272599 ) ) ( not ( = ?auto_272592 ?auto_272600 ) ) ( not ( = ?auto_272592 ?auto_272601 ) ) ( not ( = ?auto_272593 ?auto_272594 ) ) ( not ( = ?auto_272593 ?auto_272595 ) ) ( not ( = ?auto_272593 ?auto_272596 ) ) ( not ( = ?auto_272593 ?auto_272597 ) ) ( not ( = ?auto_272593 ?auto_272598 ) ) ( not ( = ?auto_272593 ?auto_272599 ) ) ( not ( = ?auto_272593 ?auto_272600 ) ) ( not ( = ?auto_272593 ?auto_272601 ) ) ( not ( = ?auto_272594 ?auto_272595 ) ) ( not ( = ?auto_272594 ?auto_272596 ) ) ( not ( = ?auto_272594 ?auto_272597 ) ) ( not ( = ?auto_272594 ?auto_272598 ) ) ( not ( = ?auto_272594 ?auto_272599 ) ) ( not ( = ?auto_272594 ?auto_272600 ) ) ( not ( = ?auto_272594 ?auto_272601 ) ) ( not ( = ?auto_272595 ?auto_272596 ) ) ( not ( = ?auto_272595 ?auto_272597 ) ) ( not ( = ?auto_272595 ?auto_272598 ) ) ( not ( = ?auto_272595 ?auto_272599 ) ) ( not ( = ?auto_272595 ?auto_272600 ) ) ( not ( = ?auto_272595 ?auto_272601 ) ) ( not ( = ?auto_272596 ?auto_272597 ) ) ( not ( = ?auto_272596 ?auto_272598 ) ) ( not ( = ?auto_272596 ?auto_272599 ) ) ( not ( = ?auto_272596 ?auto_272600 ) ) ( not ( = ?auto_272596 ?auto_272601 ) ) ( not ( = ?auto_272597 ?auto_272598 ) ) ( not ( = ?auto_272597 ?auto_272599 ) ) ( not ( = ?auto_272597 ?auto_272600 ) ) ( not ( = ?auto_272597 ?auto_272601 ) ) ( not ( = ?auto_272598 ?auto_272599 ) ) ( not ( = ?auto_272598 ?auto_272600 ) ) ( not ( = ?auto_272598 ?auto_272601 ) ) ( not ( = ?auto_272599 ?auto_272600 ) ) ( not ( = ?auto_272599 ?auto_272601 ) ) ( not ( = ?auto_272600 ?auto_272601 ) ) ( ON ?auto_272599 ?auto_272600 ) ( ON ?auto_272598 ?auto_272599 ) ( ON ?auto_272597 ?auto_272598 ) ( ON ?auto_272596 ?auto_272597 ) ( ON ?auto_272595 ?auto_272596 ) ( CLEAR ?auto_272593 ) ( ON ?auto_272594 ?auto_272595 ) ( CLEAR ?auto_272594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_272592 ?auto_272593 ?auto_272594 )
      ( MAKE-9PILE ?auto_272592 ?auto_272593 ?auto_272594 ?auto_272595 ?auto_272596 ?auto_272597 ?auto_272598 ?auto_272599 ?auto_272600 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_272611 - BLOCK
      ?auto_272612 - BLOCK
      ?auto_272613 - BLOCK
      ?auto_272614 - BLOCK
      ?auto_272615 - BLOCK
      ?auto_272616 - BLOCK
      ?auto_272617 - BLOCK
      ?auto_272618 - BLOCK
      ?auto_272619 - BLOCK
    )
    :vars
    (
      ?auto_272620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272619 ?auto_272620 ) ( ON-TABLE ?auto_272611 ) ( not ( = ?auto_272611 ?auto_272612 ) ) ( not ( = ?auto_272611 ?auto_272613 ) ) ( not ( = ?auto_272611 ?auto_272614 ) ) ( not ( = ?auto_272611 ?auto_272615 ) ) ( not ( = ?auto_272611 ?auto_272616 ) ) ( not ( = ?auto_272611 ?auto_272617 ) ) ( not ( = ?auto_272611 ?auto_272618 ) ) ( not ( = ?auto_272611 ?auto_272619 ) ) ( not ( = ?auto_272611 ?auto_272620 ) ) ( not ( = ?auto_272612 ?auto_272613 ) ) ( not ( = ?auto_272612 ?auto_272614 ) ) ( not ( = ?auto_272612 ?auto_272615 ) ) ( not ( = ?auto_272612 ?auto_272616 ) ) ( not ( = ?auto_272612 ?auto_272617 ) ) ( not ( = ?auto_272612 ?auto_272618 ) ) ( not ( = ?auto_272612 ?auto_272619 ) ) ( not ( = ?auto_272612 ?auto_272620 ) ) ( not ( = ?auto_272613 ?auto_272614 ) ) ( not ( = ?auto_272613 ?auto_272615 ) ) ( not ( = ?auto_272613 ?auto_272616 ) ) ( not ( = ?auto_272613 ?auto_272617 ) ) ( not ( = ?auto_272613 ?auto_272618 ) ) ( not ( = ?auto_272613 ?auto_272619 ) ) ( not ( = ?auto_272613 ?auto_272620 ) ) ( not ( = ?auto_272614 ?auto_272615 ) ) ( not ( = ?auto_272614 ?auto_272616 ) ) ( not ( = ?auto_272614 ?auto_272617 ) ) ( not ( = ?auto_272614 ?auto_272618 ) ) ( not ( = ?auto_272614 ?auto_272619 ) ) ( not ( = ?auto_272614 ?auto_272620 ) ) ( not ( = ?auto_272615 ?auto_272616 ) ) ( not ( = ?auto_272615 ?auto_272617 ) ) ( not ( = ?auto_272615 ?auto_272618 ) ) ( not ( = ?auto_272615 ?auto_272619 ) ) ( not ( = ?auto_272615 ?auto_272620 ) ) ( not ( = ?auto_272616 ?auto_272617 ) ) ( not ( = ?auto_272616 ?auto_272618 ) ) ( not ( = ?auto_272616 ?auto_272619 ) ) ( not ( = ?auto_272616 ?auto_272620 ) ) ( not ( = ?auto_272617 ?auto_272618 ) ) ( not ( = ?auto_272617 ?auto_272619 ) ) ( not ( = ?auto_272617 ?auto_272620 ) ) ( not ( = ?auto_272618 ?auto_272619 ) ) ( not ( = ?auto_272618 ?auto_272620 ) ) ( not ( = ?auto_272619 ?auto_272620 ) ) ( ON ?auto_272618 ?auto_272619 ) ( ON ?auto_272617 ?auto_272618 ) ( ON ?auto_272616 ?auto_272617 ) ( ON ?auto_272615 ?auto_272616 ) ( ON ?auto_272614 ?auto_272615 ) ( ON ?auto_272613 ?auto_272614 ) ( CLEAR ?auto_272611 ) ( ON ?auto_272612 ?auto_272613 ) ( CLEAR ?auto_272612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_272611 ?auto_272612 )
      ( MAKE-9PILE ?auto_272611 ?auto_272612 ?auto_272613 ?auto_272614 ?auto_272615 ?auto_272616 ?auto_272617 ?auto_272618 ?auto_272619 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_272630 - BLOCK
      ?auto_272631 - BLOCK
      ?auto_272632 - BLOCK
      ?auto_272633 - BLOCK
      ?auto_272634 - BLOCK
      ?auto_272635 - BLOCK
      ?auto_272636 - BLOCK
      ?auto_272637 - BLOCK
      ?auto_272638 - BLOCK
    )
    :vars
    (
      ?auto_272639 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272638 ?auto_272639 ) ( ON-TABLE ?auto_272630 ) ( not ( = ?auto_272630 ?auto_272631 ) ) ( not ( = ?auto_272630 ?auto_272632 ) ) ( not ( = ?auto_272630 ?auto_272633 ) ) ( not ( = ?auto_272630 ?auto_272634 ) ) ( not ( = ?auto_272630 ?auto_272635 ) ) ( not ( = ?auto_272630 ?auto_272636 ) ) ( not ( = ?auto_272630 ?auto_272637 ) ) ( not ( = ?auto_272630 ?auto_272638 ) ) ( not ( = ?auto_272630 ?auto_272639 ) ) ( not ( = ?auto_272631 ?auto_272632 ) ) ( not ( = ?auto_272631 ?auto_272633 ) ) ( not ( = ?auto_272631 ?auto_272634 ) ) ( not ( = ?auto_272631 ?auto_272635 ) ) ( not ( = ?auto_272631 ?auto_272636 ) ) ( not ( = ?auto_272631 ?auto_272637 ) ) ( not ( = ?auto_272631 ?auto_272638 ) ) ( not ( = ?auto_272631 ?auto_272639 ) ) ( not ( = ?auto_272632 ?auto_272633 ) ) ( not ( = ?auto_272632 ?auto_272634 ) ) ( not ( = ?auto_272632 ?auto_272635 ) ) ( not ( = ?auto_272632 ?auto_272636 ) ) ( not ( = ?auto_272632 ?auto_272637 ) ) ( not ( = ?auto_272632 ?auto_272638 ) ) ( not ( = ?auto_272632 ?auto_272639 ) ) ( not ( = ?auto_272633 ?auto_272634 ) ) ( not ( = ?auto_272633 ?auto_272635 ) ) ( not ( = ?auto_272633 ?auto_272636 ) ) ( not ( = ?auto_272633 ?auto_272637 ) ) ( not ( = ?auto_272633 ?auto_272638 ) ) ( not ( = ?auto_272633 ?auto_272639 ) ) ( not ( = ?auto_272634 ?auto_272635 ) ) ( not ( = ?auto_272634 ?auto_272636 ) ) ( not ( = ?auto_272634 ?auto_272637 ) ) ( not ( = ?auto_272634 ?auto_272638 ) ) ( not ( = ?auto_272634 ?auto_272639 ) ) ( not ( = ?auto_272635 ?auto_272636 ) ) ( not ( = ?auto_272635 ?auto_272637 ) ) ( not ( = ?auto_272635 ?auto_272638 ) ) ( not ( = ?auto_272635 ?auto_272639 ) ) ( not ( = ?auto_272636 ?auto_272637 ) ) ( not ( = ?auto_272636 ?auto_272638 ) ) ( not ( = ?auto_272636 ?auto_272639 ) ) ( not ( = ?auto_272637 ?auto_272638 ) ) ( not ( = ?auto_272637 ?auto_272639 ) ) ( not ( = ?auto_272638 ?auto_272639 ) ) ( ON ?auto_272637 ?auto_272638 ) ( ON ?auto_272636 ?auto_272637 ) ( ON ?auto_272635 ?auto_272636 ) ( ON ?auto_272634 ?auto_272635 ) ( ON ?auto_272633 ?auto_272634 ) ( ON ?auto_272632 ?auto_272633 ) ( CLEAR ?auto_272630 ) ( ON ?auto_272631 ?auto_272632 ) ( CLEAR ?auto_272631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_272630 ?auto_272631 )
      ( MAKE-9PILE ?auto_272630 ?auto_272631 ?auto_272632 ?auto_272633 ?auto_272634 ?auto_272635 ?auto_272636 ?auto_272637 ?auto_272638 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_272649 - BLOCK
      ?auto_272650 - BLOCK
      ?auto_272651 - BLOCK
      ?auto_272652 - BLOCK
      ?auto_272653 - BLOCK
      ?auto_272654 - BLOCK
      ?auto_272655 - BLOCK
      ?auto_272656 - BLOCK
      ?auto_272657 - BLOCK
    )
    :vars
    (
      ?auto_272658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272657 ?auto_272658 ) ( not ( = ?auto_272649 ?auto_272650 ) ) ( not ( = ?auto_272649 ?auto_272651 ) ) ( not ( = ?auto_272649 ?auto_272652 ) ) ( not ( = ?auto_272649 ?auto_272653 ) ) ( not ( = ?auto_272649 ?auto_272654 ) ) ( not ( = ?auto_272649 ?auto_272655 ) ) ( not ( = ?auto_272649 ?auto_272656 ) ) ( not ( = ?auto_272649 ?auto_272657 ) ) ( not ( = ?auto_272649 ?auto_272658 ) ) ( not ( = ?auto_272650 ?auto_272651 ) ) ( not ( = ?auto_272650 ?auto_272652 ) ) ( not ( = ?auto_272650 ?auto_272653 ) ) ( not ( = ?auto_272650 ?auto_272654 ) ) ( not ( = ?auto_272650 ?auto_272655 ) ) ( not ( = ?auto_272650 ?auto_272656 ) ) ( not ( = ?auto_272650 ?auto_272657 ) ) ( not ( = ?auto_272650 ?auto_272658 ) ) ( not ( = ?auto_272651 ?auto_272652 ) ) ( not ( = ?auto_272651 ?auto_272653 ) ) ( not ( = ?auto_272651 ?auto_272654 ) ) ( not ( = ?auto_272651 ?auto_272655 ) ) ( not ( = ?auto_272651 ?auto_272656 ) ) ( not ( = ?auto_272651 ?auto_272657 ) ) ( not ( = ?auto_272651 ?auto_272658 ) ) ( not ( = ?auto_272652 ?auto_272653 ) ) ( not ( = ?auto_272652 ?auto_272654 ) ) ( not ( = ?auto_272652 ?auto_272655 ) ) ( not ( = ?auto_272652 ?auto_272656 ) ) ( not ( = ?auto_272652 ?auto_272657 ) ) ( not ( = ?auto_272652 ?auto_272658 ) ) ( not ( = ?auto_272653 ?auto_272654 ) ) ( not ( = ?auto_272653 ?auto_272655 ) ) ( not ( = ?auto_272653 ?auto_272656 ) ) ( not ( = ?auto_272653 ?auto_272657 ) ) ( not ( = ?auto_272653 ?auto_272658 ) ) ( not ( = ?auto_272654 ?auto_272655 ) ) ( not ( = ?auto_272654 ?auto_272656 ) ) ( not ( = ?auto_272654 ?auto_272657 ) ) ( not ( = ?auto_272654 ?auto_272658 ) ) ( not ( = ?auto_272655 ?auto_272656 ) ) ( not ( = ?auto_272655 ?auto_272657 ) ) ( not ( = ?auto_272655 ?auto_272658 ) ) ( not ( = ?auto_272656 ?auto_272657 ) ) ( not ( = ?auto_272656 ?auto_272658 ) ) ( not ( = ?auto_272657 ?auto_272658 ) ) ( ON ?auto_272656 ?auto_272657 ) ( ON ?auto_272655 ?auto_272656 ) ( ON ?auto_272654 ?auto_272655 ) ( ON ?auto_272653 ?auto_272654 ) ( ON ?auto_272652 ?auto_272653 ) ( ON ?auto_272651 ?auto_272652 ) ( ON ?auto_272650 ?auto_272651 ) ( ON ?auto_272649 ?auto_272650 ) ( CLEAR ?auto_272649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_272649 )
      ( MAKE-9PILE ?auto_272649 ?auto_272650 ?auto_272651 ?auto_272652 ?auto_272653 ?auto_272654 ?auto_272655 ?auto_272656 ?auto_272657 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_272668 - BLOCK
      ?auto_272669 - BLOCK
      ?auto_272670 - BLOCK
      ?auto_272671 - BLOCK
      ?auto_272672 - BLOCK
      ?auto_272673 - BLOCK
      ?auto_272674 - BLOCK
      ?auto_272675 - BLOCK
      ?auto_272676 - BLOCK
    )
    :vars
    (
      ?auto_272677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272676 ?auto_272677 ) ( not ( = ?auto_272668 ?auto_272669 ) ) ( not ( = ?auto_272668 ?auto_272670 ) ) ( not ( = ?auto_272668 ?auto_272671 ) ) ( not ( = ?auto_272668 ?auto_272672 ) ) ( not ( = ?auto_272668 ?auto_272673 ) ) ( not ( = ?auto_272668 ?auto_272674 ) ) ( not ( = ?auto_272668 ?auto_272675 ) ) ( not ( = ?auto_272668 ?auto_272676 ) ) ( not ( = ?auto_272668 ?auto_272677 ) ) ( not ( = ?auto_272669 ?auto_272670 ) ) ( not ( = ?auto_272669 ?auto_272671 ) ) ( not ( = ?auto_272669 ?auto_272672 ) ) ( not ( = ?auto_272669 ?auto_272673 ) ) ( not ( = ?auto_272669 ?auto_272674 ) ) ( not ( = ?auto_272669 ?auto_272675 ) ) ( not ( = ?auto_272669 ?auto_272676 ) ) ( not ( = ?auto_272669 ?auto_272677 ) ) ( not ( = ?auto_272670 ?auto_272671 ) ) ( not ( = ?auto_272670 ?auto_272672 ) ) ( not ( = ?auto_272670 ?auto_272673 ) ) ( not ( = ?auto_272670 ?auto_272674 ) ) ( not ( = ?auto_272670 ?auto_272675 ) ) ( not ( = ?auto_272670 ?auto_272676 ) ) ( not ( = ?auto_272670 ?auto_272677 ) ) ( not ( = ?auto_272671 ?auto_272672 ) ) ( not ( = ?auto_272671 ?auto_272673 ) ) ( not ( = ?auto_272671 ?auto_272674 ) ) ( not ( = ?auto_272671 ?auto_272675 ) ) ( not ( = ?auto_272671 ?auto_272676 ) ) ( not ( = ?auto_272671 ?auto_272677 ) ) ( not ( = ?auto_272672 ?auto_272673 ) ) ( not ( = ?auto_272672 ?auto_272674 ) ) ( not ( = ?auto_272672 ?auto_272675 ) ) ( not ( = ?auto_272672 ?auto_272676 ) ) ( not ( = ?auto_272672 ?auto_272677 ) ) ( not ( = ?auto_272673 ?auto_272674 ) ) ( not ( = ?auto_272673 ?auto_272675 ) ) ( not ( = ?auto_272673 ?auto_272676 ) ) ( not ( = ?auto_272673 ?auto_272677 ) ) ( not ( = ?auto_272674 ?auto_272675 ) ) ( not ( = ?auto_272674 ?auto_272676 ) ) ( not ( = ?auto_272674 ?auto_272677 ) ) ( not ( = ?auto_272675 ?auto_272676 ) ) ( not ( = ?auto_272675 ?auto_272677 ) ) ( not ( = ?auto_272676 ?auto_272677 ) ) ( ON ?auto_272675 ?auto_272676 ) ( ON ?auto_272674 ?auto_272675 ) ( ON ?auto_272673 ?auto_272674 ) ( ON ?auto_272672 ?auto_272673 ) ( ON ?auto_272671 ?auto_272672 ) ( ON ?auto_272670 ?auto_272671 ) ( ON ?auto_272669 ?auto_272670 ) ( ON ?auto_272668 ?auto_272669 ) ( CLEAR ?auto_272668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_272668 )
      ( MAKE-9PILE ?auto_272668 ?auto_272669 ?auto_272670 ?auto_272671 ?auto_272672 ?auto_272673 ?auto_272674 ?auto_272675 ?auto_272676 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_272688 - BLOCK
      ?auto_272689 - BLOCK
      ?auto_272690 - BLOCK
      ?auto_272691 - BLOCK
      ?auto_272692 - BLOCK
      ?auto_272693 - BLOCK
      ?auto_272694 - BLOCK
      ?auto_272695 - BLOCK
      ?auto_272696 - BLOCK
      ?auto_272697 - BLOCK
    )
    :vars
    (
      ?auto_272698 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_272696 ) ( ON ?auto_272697 ?auto_272698 ) ( CLEAR ?auto_272697 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_272688 ) ( ON ?auto_272689 ?auto_272688 ) ( ON ?auto_272690 ?auto_272689 ) ( ON ?auto_272691 ?auto_272690 ) ( ON ?auto_272692 ?auto_272691 ) ( ON ?auto_272693 ?auto_272692 ) ( ON ?auto_272694 ?auto_272693 ) ( ON ?auto_272695 ?auto_272694 ) ( ON ?auto_272696 ?auto_272695 ) ( not ( = ?auto_272688 ?auto_272689 ) ) ( not ( = ?auto_272688 ?auto_272690 ) ) ( not ( = ?auto_272688 ?auto_272691 ) ) ( not ( = ?auto_272688 ?auto_272692 ) ) ( not ( = ?auto_272688 ?auto_272693 ) ) ( not ( = ?auto_272688 ?auto_272694 ) ) ( not ( = ?auto_272688 ?auto_272695 ) ) ( not ( = ?auto_272688 ?auto_272696 ) ) ( not ( = ?auto_272688 ?auto_272697 ) ) ( not ( = ?auto_272688 ?auto_272698 ) ) ( not ( = ?auto_272689 ?auto_272690 ) ) ( not ( = ?auto_272689 ?auto_272691 ) ) ( not ( = ?auto_272689 ?auto_272692 ) ) ( not ( = ?auto_272689 ?auto_272693 ) ) ( not ( = ?auto_272689 ?auto_272694 ) ) ( not ( = ?auto_272689 ?auto_272695 ) ) ( not ( = ?auto_272689 ?auto_272696 ) ) ( not ( = ?auto_272689 ?auto_272697 ) ) ( not ( = ?auto_272689 ?auto_272698 ) ) ( not ( = ?auto_272690 ?auto_272691 ) ) ( not ( = ?auto_272690 ?auto_272692 ) ) ( not ( = ?auto_272690 ?auto_272693 ) ) ( not ( = ?auto_272690 ?auto_272694 ) ) ( not ( = ?auto_272690 ?auto_272695 ) ) ( not ( = ?auto_272690 ?auto_272696 ) ) ( not ( = ?auto_272690 ?auto_272697 ) ) ( not ( = ?auto_272690 ?auto_272698 ) ) ( not ( = ?auto_272691 ?auto_272692 ) ) ( not ( = ?auto_272691 ?auto_272693 ) ) ( not ( = ?auto_272691 ?auto_272694 ) ) ( not ( = ?auto_272691 ?auto_272695 ) ) ( not ( = ?auto_272691 ?auto_272696 ) ) ( not ( = ?auto_272691 ?auto_272697 ) ) ( not ( = ?auto_272691 ?auto_272698 ) ) ( not ( = ?auto_272692 ?auto_272693 ) ) ( not ( = ?auto_272692 ?auto_272694 ) ) ( not ( = ?auto_272692 ?auto_272695 ) ) ( not ( = ?auto_272692 ?auto_272696 ) ) ( not ( = ?auto_272692 ?auto_272697 ) ) ( not ( = ?auto_272692 ?auto_272698 ) ) ( not ( = ?auto_272693 ?auto_272694 ) ) ( not ( = ?auto_272693 ?auto_272695 ) ) ( not ( = ?auto_272693 ?auto_272696 ) ) ( not ( = ?auto_272693 ?auto_272697 ) ) ( not ( = ?auto_272693 ?auto_272698 ) ) ( not ( = ?auto_272694 ?auto_272695 ) ) ( not ( = ?auto_272694 ?auto_272696 ) ) ( not ( = ?auto_272694 ?auto_272697 ) ) ( not ( = ?auto_272694 ?auto_272698 ) ) ( not ( = ?auto_272695 ?auto_272696 ) ) ( not ( = ?auto_272695 ?auto_272697 ) ) ( not ( = ?auto_272695 ?auto_272698 ) ) ( not ( = ?auto_272696 ?auto_272697 ) ) ( not ( = ?auto_272696 ?auto_272698 ) ) ( not ( = ?auto_272697 ?auto_272698 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_272697 ?auto_272698 )
      ( !STACK ?auto_272697 ?auto_272696 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_272709 - BLOCK
      ?auto_272710 - BLOCK
      ?auto_272711 - BLOCK
      ?auto_272712 - BLOCK
      ?auto_272713 - BLOCK
      ?auto_272714 - BLOCK
      ?auto_272715 - BLOCK
      ?auto_272716 - BLOCK
      ?auto_272717 - BLOCK
      ?auto_272718 - BLOCK
    )
    :vars
    (
      ?auto_272719 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_272717 ) ( ON ?auto_272718 ?auto_272719 ) ( CLEAR ?auto_272718 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_272709 ) ( ON ?auto_272710 ?auto_272709 ) ( ON ?auto_272711 ?auto_272710 ) ( ON ?auto_272712 ?auto_272711 ) ( ON ?auto_272713 ?auto_272712 ) ( ON ?auto_272714 ?auto_272713 ) ( ON ?auto_272715 ?auto_272714 ) ( ON ?auto_272716 ?auto_272715 ) ( ON ?auto_272717 ?auto_272716 ) ( not ( = ?auto_272709 ?auto_272710 ) ) ( not ( = ?auto_272709 ?auto_272711 ) ) ( not ( = ?auto_272709 ?auto_272712 ) ) ( not ( = ?auto_272709 ?auto_272713 ) ) ( not ( = ?auto_272709 ?auto_272714 ) ) ( not ( = ?auto_272709 ?auto_272715 ) ) ( not ( = ?auto_272709 ?auto_272716 ) ) ( not ( = ?auto_272709 ?auto_272717 ) ) ( not ( = ?auto_272709 ?auto_272718 ) ) ( not ( = ?auto_272709 ?auto_272719 ) ) ( not ( = ?auto_272710 ?auto_272711 ) ) ( not ( = ?auto_272710 ?auto_272712 ) ) ( not ( = ?auto_272710 ?auto_272713 ) ) ( not ( = ?auto_272710 ?auto_272714 ) ) ( not ( = ?auto_272710 ?auto_272715 ) ) ( not ( = ?auto_272710 ?auto_272716 ) ) ( not ( = ?auto_272710 ?auto_272717 ) ) ( not ( = ?auto_272710 ?auto_272718 ) ) ( not ( = ?auto_272710 ?auto_272719 ) ) ( not ( = ?auto_272711 ?auto_272712 ) ) ( not ( = ?auto_272711 ?auto_272713 ) ) ( not ( = ?auto_272711 ?auto_272714 ) ) ( not ( = ?auto_272711 ?auto_272715 ) ) ( not ( = ?auto_272711 ?auto_272716 ) ) ( not ( = ?auto_272711 ?auto_272717 ) ) ( not ( = ?auto_272711 ?auto_272718 ) ) ( not ( = ?auto_272711 ?auto_272719 ) ) ( not ( = ?auto_272712 ?auto_272713 ) ) ( not ( = ?auto_272712 ?auto_272714 ) ) ( not ( = ?auto_272712 ?auto_272715 ) ) ( not ( = ?auto_272712 ?auto_272716 ) ) ( not ( = ?auto_272712 ?auto_272717 ) ) ( not ( = ?auto_272712 ?auto_272718 ) ) ( not ( = ?auto_272712 ?auto_272719 ) ) ( not ( = ?auto_272713 ?auto_272714 ) ) ( not ( = ?auto_272713 ?auto_272715 ) ) ( not ( = ?auto_272713 ?auto_272716 ) ) ( not ( = ?auto_272713 ?auto_272717 ) ) ( not ( = ?auto_272713 ?auto_272718 ) ) ( not ( = ?auto_272713 ?auto_272719 ) ) ( not ( = ?auto_272714 ?auto_272715 ) ) ( not ( = ?auto_272714 ?auto_272716 ) ) ( not ( = ?auto_272714 ?auto_272717 ) ) ( not ( = ?auto_272714 ?auto_272718 ) ) ( not ( = ?auto_272714 ?auto_272719 ) ) ( not ( = ?auto_272715 ?auto_272716 ) ) ( not ( = ?auto_272715 ?auto_272717 ) ) ( not ( = ?auto_272715 ?auto_272718 ) ) ( not ( = ?auto_272715 ?auto_272719 ) ) ( not ( = ?auto_272716 ?auto_272717 ) ) ( not ( = ?auto_272716 ?auto_272718 ) ) ( not ( = ?auto_272716 ?auto_272719 ) ) ( not ( = ?auto_272717 ?auto_272718 ) ) ( not ( = ?auto_272717 ?auto_272719 ) ) ( not ( = ?auto_272718 ?auto_272719 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_272718 ?auto_272719 )
      ( !STACK ?auto_272718 ?auto_272717 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_272730 - BLOCK
      ?auto_272731 - BLOCK
      ?auto_272732 - BLOCK
      ?auto_272733 - BLOCK
      ?auto_272734 - BLOCK
      ?auto_272735 - BLOCK
      ?auto_272736 - BLOCK
      ?auto_272737 - BLOCK
      ?auto_272738 - BLOCK
      ?auto_272739 - BLOCK
    )
    :vars
    (
      ?auto_272740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272739 ?auto_272740 ) ( ON-TABLE ?auto_272730 ) ( ON ?auto_272731 ?auto_272730 ) ( ON ?auto_272732 ?auto_272731 ) ( ON ?auto_272733 ?auto_272732 ) ( ON ?auto_272734 ?auto_272733 ) ( ON ?auto_272735 ?auto_272734 ) ( ON ?auto_272736 ?auto_272735 ) ( ON ?auto_272737 ?auto_272736 ) ( not ( = ?auto_272730 ?auto_272731 ) ) ( not ( = ?auto_272730 ?auto_272732 ) ) ( not ( = ?auto_272730 ?auto_272733 ) ) ( not ( = ?auto_272730 ?auto_272734 ) ) ( not ( = ?auto_272730 ?auto_272735 ) ) ( not ( = ?auto_272730 ?auto_272736 ) ) ( not ( = ?auto_272730 ?auto_272737 ) ) ( not ( = ?auto_272730 ?auto_272738 ) ) ( not ( = ?auto_272730 ?auto_272739 ) ) ( not ( = ?auto_272730 ?auto_272740 ) ) ( not ( = ?auto_272731 ?auto_272732 ) ) ( not ( = ?auto_272731 ?auto_272733 ) ) ( not ( = ?auto_272731 ?auto_272734 ) ) ( not ( = ?auto_272731 ?auto_272735 ) ) ( not ( = ?auto_272731 ?auto_272736 ) ) ( not ( = ?auto_272731 ?auto_272737 ) ) ( not ( = ?auto_272731 ?auto_272738 ) ) ( not ( = ?auto_272731 ?auto_272739 ) ) ( not ( = ?auto_272731 ?auto_272740 ) ) ( not ( = ?auto_272732 ?auto_272733 ) ) ( not ( = ?auto_272732 ?auto_272734 ) ) ( not ( = ?auto_272732 ?auto_272735 ) ) ( not ( = ?auto_272732 ?auto_272736 ) ) ( not ( = ?auto_272732 ?auto_272737 ) ) ( not ( = ?auto_272732 ?auto_272738 ) ) ( not ( = ?auto_272732 ?auto_272739 ) ) ( not ( = ?auto_272732 ?auto_272740 ) ) ( not ( = ?auto_272733 ?auto_272734 ) ) ( not ( = ?auto_272733 ?auto_272735 ) ) ( not ( = ?auto_272733 ?auto_272736 ) ) ( not ( = ?auto_272733 ?auto_272737 ) ) ( not ( = ?auto_272733 ?auto_272738 ) ) ( not ( = ?auto_272733 ?auto_272739 ) ) ( not ( = ?auto_272733 ?auto_272740 ) ) ( not ( = ?auto_272734 ?auto_272735 ) ) ( not ( = ?auto_272734 ?auto_272736 ) ) ( not ( = ?auto_272734 ?auto_272737 ) ) ( not ( = ?auto_272734 ?auto_272738 ) ) ( not ( = ?auto_272734 ?auto_272739 ) ) ( not ( = ?auto_272734 ?auto_272740 ) ) ( not ( = ?auto_272735 ?auto_272736 ) ) ( not ( = ?auto_272735 ?auto_272737 ) ) ( not ( = ?auto_272735 ?auto_272738 ) ) ( not ( = ?auto_272735 ?auto_272739 ) ) ( not ( = ?auto_272735 ?auto_272740 ) ) ( not ( = ?auto_272736 ?auto_272737 ) ) ( not ( = ?auto_272736 ?auto_272738 ) ) ( not ( = ?auto_272736 ?auto_272739 ) ) ( not ( = ?auto_272736 ?auto_272740 ) ) ( not ( = ?auto_272737 ?auto_272738 ) ) ( not ( = ?auto_272737 ?auto_272739 ) ) ( not ( = ?auto_272737 ?auto_272740 ) ) ( not ( = ?auto_272738 ?auto_272739 ) ) ( not ( = ?auto_272738 ?auto_272740 ) ) ( not ( = ?auto_272739 ?auto_272740 ) ) ( CLEAR ?auto_272737 ) ( ON ?auto_272738 ?auto_272739 ) ( CLEAR ?auto_272738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_272730 ?auto_272731 ?auto_272732 ?auto_272733 ?auto_272734 ?auto_272735 ?auto_272736 ?auto_272737 ?auto_272738 )
      ( MAKE-10PILE ?auto_272730 ?auto_272731 ?auto_272732 ?auto_272733 ?auto_272734 ?auto_272735 ?auto_272736 ?auto_272737 ?auto_272738 ?auto_272739 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_272751 - BLOCK
      ?auto_272752 - BLOCK
      ?auto_272753 - BLOCK
      ?auto_272754 - BLOCK
      ?auto_272755 - BLOCK
      ?auto_272756 - BLOCK
      ?auto_272757 - BLOCK
      ?auto_272758 - BLOCK
      ?auto_272759 - BLOCK
      ?auto_272760 - BLOCK
    )
    :vars
    (
      ?auto_272761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272760 ?auto_272761 ) ( ON-TABLE ?auto_272751 ) ( ON ?auto_272752 ?auto_272751 ) ( ON ?auto_272753 ?auto_272752 ) ( ON ?auto_272754 ?auto_272753 ) ( ON ?auto_272755 ?auto_272754 ) ( ON ?auto_272756 ?auto_272755 ) ( ON ?auto_272757 ?auto_272756 ) ( ON ?auto_272758 ?auto_272757 ) ( not ( = ?auto_272751 ?auto_272752 ) ) ( not ( = ?auto_272751 ?auto_272753 ) ) ( not ( = ?auto_272751 ?auto_272754 ) ) ( not ( = ?auto_272751 ?auto_272755 ) ) ( not ( = ?auto_272751 ?auto_272756 ) ) ( not ( = ?auto_272751 ?auto_272757 ) ) ( not ( = ?auto_272751 ?auto_272758 ) ) ( not ( = ?auto_272751 ?auto_272759 ) ) ( not ( = ?auto_272751 ?auto_272760 ) ) ( not ( = ?auto_272751 ?auto_272761 ) ) ( not ( = ?auto_272752 ?auto_272753 ) ) ( not ( = ?auto_272752 ?auto_272754 ) ) ( not ( = ?auto_272752 ?auto_272755 ) ) ( not ( = ?auto_272752 ?auto_272756 ) ) ( not ( = ?auto_272752 ?auto_272757 ) ) ( not ( = ?auto_272752 ?auto_272758 ) ) ( not ( = ?auto_272752 ?auto_272759 ) ) ( not ( = ?auto_272752 ?auto_272760 ) ) ( not ( = ?auto_272752 ?auto_272761 ) ) ( not ( = ?auto_272753 ?auto_272754 ) ) ( not ( = ?auto_272753 ?auto_272755 ) ) ( not ( = ?auto_272753 ?auto_272756 ) ) ( not ( = ?auto_272753 ?auto_272757 ) ) ( not ( = ?auto_272753 ?auto_272758 ) ) ( not ( = ?auto_272753 ?auto_272759 ) ) ( not ( = ?auto_272753 ?auto_272760 ) ) ( not ( = ?auto_272753 ?auto_272761 ) ) ( not ( = ?auto_272754 ?auto_272755 ) ) ( not ( = ?auto_272754 ?auto_272756 ) ) ( not ( = ?auto_272754 ?auto_272757 ) ) ( not ( = ?auto_272754 ?auto_272758 ) ) ( not ( = ?auto_272754 ?auto_272759 ) ) ( not ( = ?auto_272754 ?auto_272760 ) ) ( not ( = ?auto_272754 ?auto_272761 ) ) ( not ( = ?auto_272755 ?auto_272756 ) ) ( not ( = ?auto_272755 ?auto_272757 ) ) ( not ( = ?auto_272755 ?auto_272758 ) ) ( not ( = ?auto_272755 ?auto_272759 ) ) ( not ( = ?auto_272755 ?auto_272760 ) ) ( not ( = ?auto_272755 ?auto_272761 ) ) ( not ( = ?auto_272756 ?auto_272757 ) ) ( not ( = ?auto_272756 ?auto_272758 ) ) ( not ( = ?auto_272756 ?auto_272759 ) ) ( not ( = ?auto_272756 ?auto_272760 ) ) ( not ( = ?auto_272756 ?auto_272761 ) ) ( not ( = ?auto_272757 ?auto_272758 ) ) ( not ( = ?auto_272757 ?auto_272759 ) ) ( not ( = ?auto_272757 ?auto_272760 ) ) ( not ( = ?auto_272757 ?auto_272761 ) ) ( not ( = ?auto_272758 ?auto_272759 ) ) ( not ( = ?auto_272758 ?auto_272760 ) ) ( not ( = ?auto_272758 ?auto_272761 ) ) ( not ( = ?auto_272759 ?auto_272760 ) ) ( not ( = ?auto_272759 ?auto_272761 ) ) ( not ( = ?auto_272760 ?auto_272761 ) ) ( CLEAR ?auto_272758 ) ( ON ?auto_272759 ?auto_272760 ) ( CLEAR ?auto_272759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_272751 ?auto_272752 ?auto_272753 ?auto_272754 ?auto_272755 ?auto_272756 ?auto_272757 ?auto_272758 ?auto_272759 )
      ( MAKE-10PILE ?auto_272751 ?auto_272752 ?auto_272753 ?auto_272754 ?auto_272755 ?auto_272756 ?auto_272757 ?auto_272758 ?auto_272759 ?auto_272760 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_272772 - BLOCK
      ?auto_272773 - BLOCK
      ?auto_272774 - BLOCK
      ?auto_272775 - BLOCK
      ?auto_272776 - BLOCK
      ?auto_272777 - BLOCK
      ?auto_272778 - BLOCK
      ?auto_272779 - BLOCK
      ?auto_272780 - BLOCK
      ?auto_272781 - BLOCK
    )
    :vars
    (
      ?auto_272782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272781 ?auto_272782 ) ( ON-TABLE ?auto_272772 ) ( ON ?auto_272773 ?auto_272772 ) ( ON ?auto_272774 ?auto_272773 ) ( ON ?auto_272775 ?auto_272774 ) ( ON ?auto_272776 ?auto_272775 ) ( ON ?auto_272777 ?auto_272776 ) ( ON ?auto_272778 ?auto_272777 ) ( not ( = ?auto_272772 ?auto_272773 ) ) ( not ( = ?auto_272772 ?auto_272774 ) ) ( not ( = ?auto_272772 ?auto_272775 ) ) ( not ( = ?auto_272772 ?auto_272776 ) ) ( not ( = ?auto_272772 ?auto_272777 ) ) ( not ( = ?auto_272772 ?auto_272778 ) ) ( not ( = ?auto_272772 ?auto_272779 ) ) ( not ( = ?auto_272772 ?auto_272780 ) ) ( not ( = ?auto_272772 ?auto_272781 ) ) ( not ( = ?auto_272772 ?auto_272782 ) ) ( not ( = ?auto_272773 ?auto_272774 ) ) ( not ( = ?auto_272773 ?auto_272775 ) ) ( not ( = ?auto_272773 ?auto_272776 ) ) ( not ( = ?auto_272773 ?auto_272777 ) ) ( not ( = ?auto_272773 ?auto_272778 ) ) ( not ( = ?auto_272773 ?auto_272779 ) ) ( not ( = ?auto_272773 ?auto_272780 ) ) ( not ( = ?auto_272773 ?auto_272781 ) ) ( not ( = ?auto_272773 ?auto_272782 ) ) ( not ( = ?auto_272774 ?auto_272775 ) ) ( not ( = ?auto_272774 ?auto_272776 ) ) ( not ( = ?auto_272774 ?auto_272777 ) ) ( not ( = ?auto_272774 ?auto_272778 ) ) ( not ( = ?auto_272774 ?auto_272779 ) ) ( not ( = ?auto_272774 ?auto_272780 ) ) ( not ( = ?auto_272774 ?auto_272781 ) ) ( not ( = ?auto_272774 ?auto_272782 ) ) ( not ( = ?auto_272775 ?auto_272776 ) ) ( not ( = ?auto_272775 ?auto_272777 ) ) ( not ( = ?auto_272775 ?auto_272778 ) ) ( not ( = ?auto_272775 ?auto_272779 ) ) ( not ( = ?auto_272775 ?auto_272780 ) ) ( not ( = ?auto_272775 ?auto_272781 ) ) ( not ( = ?auto_272775 ?auto_272782 ) ) ( not ( = ?auto_272776 ?auto_272777 ) ) ( not ( = ?auto_272776 ?auto_272778 ) ) ( not ( = ?auto_272776 ?auto_272779 ) ) ( not ( = ?auto_272776 ?auto_272780 ) ) ( not ( = ?auto_272776 ?auto_272781 ) ) ( not ( = ?auto_272776 ?auto_272782 ) ) ( not ( = ?auto_272777 ?auto_272778 ) ) ( not ( = ?auto_272777 ?auto_272779 ) ) ( not ( = ?auto_272777 ?auto_272780 ) ) ( not ( = ?auto_272777 ?auto_272781 ) ) ( not ( = ?auto_272777 ?auto_272782 ) ) ( not ( = ?auto_272778 ?auto_272779 ) ) ( not ( = ?auto_272778 ?auto_272780 ) ) ( not ( = ?auto_272778 ?auto_272781 ) ) ( not ( = ?auto_272778 ?auto_272782 ) ) ( not ( = ?auto_272779 ?auto_272780 ) ) ( not ( = ?auto_272779 ?auto_272781 ) ) ( not ( = ?auto_272779 ?auto_272782 ) ) ( not ( = ?auto_272780 ?auto_272781 ) ) ( not ( = ?auto_272780 ?auto_272782 ) ) ( not ( = ?auto_272781 ?auto_272782 ) ) ( ON ?auto_272780 ?auto_272781 ) ( CLEAR ?auto_272778 ) ( ON ?auto_272779 ?auto_272780 ) ( CLEAR ?auto_272779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_272772 ?auto_272773 ?auto_272774 ?auto_272775 ?auto_272776 ?auto_272777 ?auto_272778 ?auto_272779 )
      ( MAKE-10PILE ?auto_272772 ?auto_272773 ?auto_272774 ?auto_272775 ?auto_272776 ?auto_272777 ?auto_272778 ?auto_272779 ?auto_272780 ?auto_272781 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_272793 - BLOCK
      ?auto_272794 - BLOCK
      ?auto_272795 - BLOCK
      ?auto_272796 - BLOCK
      ?auto_272797 - BLOCK
      ?auto_272798 - BLOCK
      ?auto_272799 - BLOCK
      ?auto_272800 - BLOCK
      ?auto_272801 - BLOCK
      ?auto_272802 - BLOCK
    )
    :vars
    (
      ?auto_272803 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272802 ?auto_272803 ) ( ON-TABLE ?auto_272793 ) ( ON ?auto_272794 ?auto_272793 ) ( ON ?auto_272795 ?auto_272794 ) ( ON ?auto_272796 ?auto_272795 ) ( ON ?auto_272797 ?auto_272796 ) ( ON ?auto_272798 ?auto_272797 ) ( ON ?auto_272799 ?auto_272798 ) ( not ( = ?auto_272793 ?auto_272794 ) ) ( not ( = ?auto_272793 ?auto_272795 ) ) ( not ( = ?auto_272793 ?auto_272796 ) ) ( not ( = ?auto_272793 ?auto_272797 ) ) ( not ( = ?auto_272793 ?auto_272798 ) ) ( not ( = ?auto_272793 ?auto_272799 ) ) ( not ( = ?auto_272793 ?auto_272800 ) ) ( not ( = ?auto_272793 ?auto_272801 ) ) ( not ( = ?auto_272793 ?auto_272802 ) ) ( not ( = ?auto_272793 ?auto_272803 ) ) ( not ( = ?auto_272794 ?auto_272795 ) ) ( not ( = ?auto_272794 ?auto_272796 ) ) ( not ( = ?auto_272794 ?auto_272797 ) ) ( not ( = ?auto_272794 ?auto_272798 ) ) ( not ( = ?auto_272794 ?auto_272799 ) ) ( not ( = ?auto_272794 ?auto_272800 ) ) ( not ( = ?auto_272794 ?auto_272801 ) ) ( not ( = ?auto_272794 ?auto_272802 ) ) ( not ( = ?auto_272794 ?auto_272803 ) ) ( not ( = ?auto_272795 ?auto_272796 ) ) ( not ( = ?auto_272795 ?auto_272797 ) ) ( not ( = ?auto_272795 ?auto_272798 ) ) ( not ( = ?auto_272795 ?auto_272799 ) ) ( not ( = ?auto_272795 ?auto_272800 ) ) ( not ( = ?auto_272795 ?auto_272801 ) ) ( not ( = ?auto_272795 ?auto_272802 ) ) ( not ( = ?auto_272795 ?auto_272803 ) ) ( not ( = ?auto_272796 ?auto_272797 ) ) ( not ( = ?auto_272796 ?auto_272798 ) ) ( not ( = ?auto_272796 ?auto_272799 ) ) ( not ( = ?auto_272796 ?auto_272800 ) ) ( not ( = ?auto_272796 ?auto_272801 ) ) ( not ( = ?auto_272796 ?auto_272802 ) ) ( not ( = ?auto_272796 ?auto_272803 ) ) ( not ( = ?auto_272797 ?auto_272798 ) ) ( not ( = ?auto_272797 ?auto_272799 ) ) ( not ( = ?auto_272797 ?auto_272800 ) ) ( not ( = ?auto_272797 ?auto_272801 ) ) ( not ( = ?auto_272797 ?auto_272802 ) ) ( not ( = ?auto_272797 ?auto_272803 ) ) ( not ( = ?auto_272798 ?auto_272799 ) ) ( not ( = ?auto_272798 ?auto_272800 ) ) ( not ( = ?auto_272798 ?auto_272801 ) ) ( not ( = ?auto_272798 ?auto_272802 ) ) ( not ( = ?auto_272798 ?auto_272803 ) ) ( not ( = ?auto_272799 ?auto_272800 ) ) ( not ( = ?auto_272799 ?auto_272801 ) ) ( not ( = ?auto_272799 ?auto_272802 ) ) ( not ( = ?auto_272799 ?auto_272803 ) ) ( not ( = ?auto_272800 ?auto_272801 ) ) ( not ( = ?auto_272800 ?auto_272802 ) ) ( not ( = ?auto_272800 ?auto_272803 ) ) ( not ( = ?auto_272801 ?auto_272802 ) ) ( not ( = ?auto_272801 ?auto_272803 ) ) ( not ( = ?auto_272802 ?auto_272803 ) ) ( ON ?auto_272801 ?auto_272802 ) ( CLEAR ?auto_272799 ) ( ON ?auto_272800 ?auto_272801 ) ( CLEAR ?auto_272800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_272793 ?auto_272794 ?auto_272795 ?auto_272796 ?auto_272797 ?auto_272798 ?auto_272799 ?auto_272800 )
      ( MAKE-10PILE ?auto_272793 ?auto_272794 ?auto_272795 ?auto_272796 ?auto_272797 ?auto_272798 ?auto_272799 ?auto_272800 ?auto_272801 ?auto_272802 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_272814 - BLOCK
      ?auto_272815 - BLOCK
      ?auto_272816 - BLOCK
      ?auto_272817 - BLOCK
      ?auto_272818 - BLOCK
      ?auto_272819 - BLOCK
      ?auto_272820 - BLOCK
      ?auto_272821 - BLOCK
      ?auto_272822 - BLOCK
      ?auto_272823 - BLOCK
    )
    :vars
    (
      ?auto_272824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272823 ?auto_272824 ) ( ON-TABLE ?auto_272814 ) ( ON ?auto_272815 ?auto_272814 ) ( ON ?auto_272816 ?auto_272815 ) ( ON ?auto_272817 ?auto_272816 ) ( ON ?auto_272818 ?auto_272817 ) ( ON ?auto_272819 ?auto_272818 ) ( not ( = ?auto_272814 ?auto_272815 ) ) ( not ( = ?auto_272814 ?auto_272816 ) ) ( not ( = ?auto_272814 ?auto_272817 ) ) ( not ( = ?auto_272814 ?auto_272818 ) ) ( not ( = ?auto_272814 ?auto_272819 ) ) ( not ( = ?auto_272814 ?auto_272820 ) ) ( not ( = ?auto_272814 ?auto_272821 ) ) ( not ( = ?auto_272814 ?auto_272822 ) ) ( not ( = ?auto_272814 ?auto_272823 ) ) ( not ( = ?auto_272814 ?auto_272824 ) ) ( not ( = ?auto_272815 ?auto_272816 ) ) ( not ( = ?auto_272815 ?auto_272817 ) ) ( not ( = ?auto_272815 ?auto_272818 ) ) ( not ( = ?auto_272815 ?auto_272819 ) ) ( not ( = ?auto_272815 ?auto_272820 ) ) ( not ( = ?auto_272815 ?auto_272821 ) ) ( not ( = ?auto_272815 ?auto_272822 ) ) ( not ( = ?auto_272815 ?auto_272823 ) ) ( not ( = ?auto_272815 ?auto_272824 ) ) ( not ( = ?auto_272816 ?auto_272817 ) ) ( not ( = ?auto_272816 ?auto_272818 ) ) ( not ( = ?auto_272816 ?auto_272819 ) ) ( not ( = ?auto_272816 ?auto_272820 ) ) ( not ( = ?auto_272816 ?auto_272821 ) ) ( not ( = ?auto_272816 ?auto_272822 ) ) ( not ( = ?auto_272816 ?auto_272823 ) ) ( not ( = ?auto_272816 ?auto_272824 ) ) ( not ( = ?auto_272817 ?auto_272818 ) ) ( not ( = ?auto_272817 ?auto_272819 ) ) ( not ( = ?auto_272817 ?auto_272820 ) ) ( not ( = ?auto_272817 ?auto_272821 ) ) ( not ( = ?auto_272817 ?auto_272822 ) ) ( not ( = ?auto_272817 ?auto_272823 ) ) ( not ( = ?auto_272817 ?auto_272824 ) ) ( not ( = ?auto_272818 ?auto_272819 ) ) ( not ( = ?auto_272818 ?auto_272820 ) ) ( not ( = ?auto_272818 ?auto_272821 ) ) ( not ( = ?auto_272818 ?auto_272822 ) ) ( not ( = ?auto_272818 ?auto_272823 ) ) ( not ( = ?auto_272818 ?auto_272824 ) ) ( not ( = ?auto_272819 ?auto_272820 ) ) ( not ( = ?auto_272819 ?auto_272821 ) ) ( not ( = ?auto_272819 ?auto_272822 ) ) ( not ( = ?auto_272819 ?auto_272823 ) ) ( not ( = ?auto_272819 ?auto_272824 ) ) ( not ( = ?auto_272820 ?auto_272821 ) ) ( not ( = ?auto_272820 ?auto_272822 ) ) ( not ( = ?auto_272820 ?auto_272823 ) ) ( not ( = ?auto_272820 ?auto_272824 ) ) ( not ( = ?auto_272821 ?auto_272822 ) ) ( not ( = ?auto_272821 ?auto_272823 ) ) ( not ( = ?auto_272821 ?auto_272824 ) ) ( not ( = ?auto_272822 ?auto_272823 ) ) ( not ( = ?auto_272822 ?auto_272824 ) ) ( not ( = ?auto_272823 ?auto_272824 ) ) ( ON ?auto_272822 ?auto_272823 ) ( ON ?auto_272821 ?auto_272822 ) ( CLEAR ?auto_272819 ) ( ON ?auto_272820 ?auto_272821 ) ( CLEAR ?auto_272820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_272814 ?auto_272815 ?auto_272816 ?auto_272817 ?auto_272818 ?auto_272819 ?auto_272820 )
      ( MAKE-10PILE ?auto_272814 ?auto_272815 ?auto_272816 ?auto_272817 ?auto_272818 ?auto_272819 ?auto_272820 ?auto_272821 ?auto_272822 ?auto_272823 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_272835 - BLOCK
      ?auto_272836 - BLOCK
      ?auto_272837 - BLOCK
      ?auto_272838 - BLOCK
      ?auto_272839 - BLOCK
      ?auto_272840 - BLOCK
      ?auto_272841 - BLOCK
      ?auto_272842 - BLOCK
      ?auto_272843 - BLOCK
      ?auto_272844 - BLOCK
    )
    :vars
    (
      ?auto_272845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272844 ?auto_272845 ) ( ON-TABLE ?auto_272835 ) ( ON ?auto_272836 ?auto_272835 ) ( ON ?auto_272837 ?auto_272836 ) ( ON ?auto_272838 ?auto_272837 ) ( ON ?auto_272839 ?auto_272838 ) ( ON ?auto_272840 ?auto_272839 ) ( not ( = ?auto_272835 ?auto_272836 ) ) ( not ( = ?auto_272835 ?auto_272837 ) ) ( not ( = ?auto_272835 ?auto_272838 ) ) ( not ( = ?auto_272835 ?auto_272839 ) ) ( not ( = ?auto_272835 ?auto_272840 ) ) ( not ( = ?auto_272835 ?auto_272841 ) ) ( not ( = ?auto_272835 ?auto_272842 ) ) ( not ( = ?auto_272835 ?auto_272843 ) ) ( not ( = ?auto_272835 ?auto_272844 ) ) ( not ( = ?auto_272835 ?auto_272845 ) ) ( not ( = ?auto_272836 ?auto_272837 ) ) ( not ( = ?auto_272836 ?auto_272838 ) ) ( not ( = ?auto_272836 ?auto_272839 ) ) ( not ( = ?auto_272836 ?auto_272840 ) ) ( not ( = ?auto_272836 ?auto_272841 ) ) ( not ( = ?auto_272836 ?auto_272842 ) ) ( not ( = ?auto_272836 ?auto_272843 ) ) ( not ( = ?auto_272836 ?auto_272844 ) ) ( not ( = ?auto_272836 ?auto_272845 ) ) ( not ( = ?auto_272837 ?auto_272838 ) ) ( not ( = ?auto_272837 ?auto_272839 ) ) ( not ( = ?auto_272837 ?auto_272840 ) ) ( not ( = ?auto_272837 ?auto_272841 ) ) ( not ( = ?auto_272837 ?auto_272842 ) ) ( not ( = ?auto_272837 ?auto_272843 ) ) ( not ( = ?auto_272837 ?auto_272844 ) ) ( not ( = ?auto_272837 ?auto_272845 ) ) ( not ( = ?auto_272838 ?auto_272839 ) ) ( not ( = ?auto_272838 ?auto_272840 ) ) ( not ( = ?auto_272838 ?auto_272841 ) ) ( not ( = ?auto_272838 ?auto_272842 ) ) ( not ( = ?auto_272838 ?auto_272843 ) ) ( not ( = ?auto_272838 ?auto_272844 ) ) ( not ( = ?auto_272838 ?auto_272845 ) ) ( not ( = ?auto_272839 ?auto_272840 ) ) ( not ( = ?auto_272839 ?auto_272841 ) ) ( not ( = ?auto_272839 ?auto_272842 ) ) ( not ( = ?auto_272839 ?auto_272843 ) ) ( not ( = ?auto_272839 ?auto_272844 ) ) ( not ( = ?auto_272839 ?auto_272845 ) ) ( not ( = ?auto_272840 ?auto_272841 ) ) ( not ( = ?auto_272840 ?auto_272842 ) ) ( not ( = ?auto_272840 ?auto_272843 ) ) ( not ( = ?auto_272840 ?auto_272844 ) ) ( not ( = ?auto_272840 ?auto_272845 ) ) ( not ( = ?auto_272841 ?auto_272842 ) ) ( not ( = ?auto_272841 ?auto_272843 ) ) ( not ( = ?auto_272841 ?auto_272844 ) ) ( not ( = ?auto_272841 ?auto_272845 ) ) ( not ( = ?auto_272842 ?auto_272843 ) ) ( not ( = ?auto_272842 ?auto_272844 ) ) ( not ( = ?auto_272842 ?auto_272845 ) ) ( not ( = ?auto_272843 ?auto_272844 ) ) ( not ( = ?auto_272843 ?auto_272845 ) ) ( not ( = ?auto_272844 ?auto_272845 ) ) ( ON ?auto_272843 ?auto_272844 ) ( ON ?auto_272842 ?auto_272843 ) ( CLEAR ?auto_272840 ) ( ON ?auto_272841 ?auto_272842 ) ( CLEAR ?auto_272841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_272835 ?auto_272836 ?auto_272837 ?auto_272838 ?auto_272839 ?auto_272840 ?auto_272841 )
      ( MAKE-10PILE ?auto_272835 ?auto_272836 ?auto_272837 ?auto_272838 ?auto_272839 ?auto_272840 ?auto_272841 ?auto_272842 ?auto_272843 ?auto_272844 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_272856 - BLOCK
      ?auto_272857 - BLOCK
      ?auto_272858 - BLOCK
      ?auto_272859 - BLOCK
      ?auto_272860 - BLOCK
      ?auto_272861 - BLOCK
      ?auto_272862 - BLOCK
      ?auto_272863 - BLOCK
      ?auto_272864 - BLOCK
      ?auto_272865 - BLOCK
    )
    :vars
    (
      ?auto_272866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272865 ?auto_272866 ) ( ON-TABLE ?auto_272856 ) ( ON ?auto_272857 ?auto_272856 ) ( ON ?auto_272858 ?auto_272857 ) ( ON ?auto_272859 ?auto_272858 ) ( ON ?auto_272860 ?auto_272859 ) ( not ( = ?auto_272856 ?auto_272857 ) ) ( not ( = ?auto_272856 ?auto_272858 ) ) ( not ( = ?auto_272856 ?auto_272859 ) ) ( not ( = ?auto_272856 ?auto_272860 ) ) ( not ( = ?auto_272856 ?auto_272861 ) ) ( not ( = ?auto_272856 ?auto_272862 ) ) ( not ( = ?auto_272856 ?auto_272863 ) ) ( not ( = ?auto_272856 ?auto_272864 ) ) ( not ( = ?auto_272856 ?auto_272865 ) ) ( not ( = ?auto_272856 ?auto_272866 ) ) ( not ( = ?auto_272857 ?auto_272858 ) ) ( not ( = ?auto_272857 ?auto_272859 ) ) ( not ( = ?auto_272857 ?auto_272860 ) ) ( not ( = ?auto_272857 ?auto_272861 ) ) ( not ( = ?auto_272857 ?auto_272862 ) ) ( not ( = ?auto_272857 ?auto_272863 ) ) ( not ( = ?auto_272857 ?auto_272864 ) ) ( not ( = ?auto_272857 ?auto_272865 ) ) ( not ( = ?auto_272857 ?auto_272866 ) ) ( not ( = ?auto_272858 ?auto_272859 ) ) ( not ( = ?auto_272858 ?auto_272860 ) ) ( not ( = ?auto_272858 ?auto_272861 ) ) ( not ( = ?auto_272858 ?auto_272862 ) ) ( not ( = ?auto_272858 ?auto_272863 ) ) ( not ( = ?auto_272858 ?auto_272864 ) ) ( not ( = ?auto_272858 ?auto_272865 ) ) ( not ( = ?auto_272858 ?auto_272866 ) ) ( not ( = ?auto_272859 ?auto_272860 ) ) ( not ( = ?auto_272859 ?auto_272861 ) ) ( not ( = ?auto_272859 ?auto_272862 ) ) ( not ( = ?auto_272859 ?auto_272863 ) ) ( not ( = ?auto_272859 ?auto_272864 ) ) ( not ( = ?auto_272859 ?auto_272865 ) ) ( not ( = ?auto_272859 ?auto_272866 ) ) ( not ( = ?auto_272860 ?auto_272861 ) ) ( not ( = ?auto_272860 ?auto_272862 ) ) ( not ( = ?auto_272860 ?auto_272863 ) ) ( not ( = ?auto_272860 ?auto_272864 ) ) ( not ( = ?auto_272860 ?auto_272865 ) ) ( not ( = ?auto_272860 ?auto_272866 ) ) ( not ( = ?auto_272861 ?auto_272862 ) ) ( not ( = ?auto_272861 ?auto_272863 ) ) ( not ( = ?auto_272861 ?auto_272864 ) ) ( not ( = ?auto_272861 ?auto_272865 ) ) ( not ( = ?auto_272861 ?auto_272866 ) ) ( not ( = ?auto_272862 ?auto_272863 ) ) ( not ( = ?auto_272862 ?auto_272864 ) ) ( not ( = ?auto_272862 ?auto_272865 ) ) ( not ( = ?auto_272862 ?auto_272866 ) ) ( not ( = ?auto_272863 ?auto_272864 ) ) ( not ( = ?auto_272863 ?auto_272865 ) ) ( not ( = ?auto_272863 ?auto_272866 ) ) ( not ( = ?auto_272864 ?auto_272865 ) ) ( not ( = ?auto_272864 ?auto_272866 ) ) ( not ( = ?auto_272865 ?auto_272866 ) ) ( ON ?auto_272864 ?auto_272865 ) ( ON ?auto_272863 ?auto_272864 ) ( ON ?auto_272862 ?auto_272863 ) ( CLEAR ?auto_272860 ) ( ON ?auto_272861 ?auto_272862 ) ( CLEAR ?auto_272861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_272856 ?auto_272857 ?auto_272858 ?auto_272859 ?auto_272860 ?auto_272861 )
      ( MAKE-10PILE ?auto_272856 ?auto_272857 ?auto_272858 ?auto_272859 ?auto_272860 ?auto_272861 ?auto_272862 ?auto_272863 ?auto_272864 ?auto_272865 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_272877 - BLOCK
      ?auto_272878 - BLOCK
      ?auto_272879 - BLOCK
      ?auto_272880 - BLOCK
      ?auto_272881 - BLOCK
      ?auto_272882 - BLOCK
      ?auto_272883 - BLOCK
      ?auto_272884 - BLOCK
      ?auto_272885 - BLOCK
      ?auto_272886 - BLOCK
    )
    :vars
    (
      ?auto_272887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272886 ?auto_272887 ) ( ON-TABLE ?auto_272877 ) ( ON ?auto_272878 ?auto_272877 ) ( ON ?auto_272879 ?auto_272878 ) ( ON ?auto_272880 ?auto_272879 ) ( ON ?auto_272881 ?auto_272880 ) ( not ( = ?auto_272877 ?auto_272878 ) ) ( not ( = ?auto_272877 ?auto_272879 ) ) ( not ( = ?auto_272877 ?auto_272880 ) ) ( not ( = ?auto_272877 ?auto_272881 ) ) ( not ( = ?auto_272877 ?auto_272882 ) ) ( not ( = ?auto_272877 ?auto_272883 ) ) ( not ( = ?auto_272877 ?auto_272884 ) ) ( not ( = ?auto_272877 ?auto_272885 ) ) ( not ( = ?auto_272877 ?auto_272886 ) ) ( not ( = ?auto_272877 ?auto_272887 ) ) ( not ( = ?auto_272878 ?auto_272879 ) ) ( not ( = ?auto_272878 ?auto_272880 ) ) ( not ( = ?auto_272878 ?auto_272881 ) ) ( not ( = ?auto_272878 ?auto_272882 ) ) ( not ( = ?auto_272878 ?auto_272883 ) ) ( not ( = ?auto_272878 ?auto_272884 ) ) ( not ( = ?auto_272878 ?auto_272885 ) ) ( not ( = ?auto_272878 ?auto_272886 ) ) ( not ( = ?auto_272878 ?auto_272887 ) ) ( not ( = ?auto_272879 ?auto_272880 ) ) ( not ( = ?auto_272879 ?auto_272881 ) ) ( not ( = ?auto_272879 ?auto_272882 ) ) ( not ( = ?auto_272879 ?auto_272883 ) ) ( not ( = ?auto_272879 ?auto_272884 ) ) ( not ( = ?auto_272879 ?auto_272885 ) ) ( not ( = ?auto_272879 ?auto_272886 ) ) ( not ( = ?auto_272879 ?auto_272887 ) ) ( not ( = ?auto_272880 ?auto_272881 ) ) ( not ( = ?auto_272880 ?auto_272882 ) ) ( not ( = ?auto_272880 ?auto_272883 ) ) ( not ( = ?auto_272880 ?auto_272884 ) ) ( not ( = ?auto_272880 ?auto_272885 ) ) ( not ( = ?auto_272880 ?auto_272886 ) ) ( not ( = ?auto_272880 ?auto_272887 ) ) ( not ( = ?auto_272881 ?auto_272882 ) ) ( not ( = ?auto_272881 ?auto_272883 ) ) ( not ( = ?auto_272881 ?auto_272884 ) ) ( not ( = ?auto_272881 ?auto_272885 ) ) ( not ( = ?auto_272881 ?auto_272886 ) ) ( not ( = ?auto_272881 ?auto_272887 ) ) ( not ( = ?auto_272882 ?auto_272883 ) ) ( not ( = ?auto_272882 ?auto_272884 ) ) ( not ( = ?auto_272882 ?auto_272885 ) ) ( not ( = ?auto_272882 ?auto_272886 ) ) ( not ( = ?auto_272882 ?auto_272887 ) ) ( not ( = ?auto_272883 ?auto_272884 ) ) ( not ( = ?auto_272883 ?auto_272885 ) ) ( not ( = ?auto_272883 ?auto_272886 ) ) ( not ( = ?auto_272883 ?auto_272887 ) ) ( not ( = ?auto_272884 ?auto_272885 ) ) ( not ( = ?auto_272884 ?auto_272886 ) ) ( not ( = ?auto_272884 ?auto_272887 ) ) ( not ( = ?auto_272885 ?auto_272886 ) ) ( not ( = ?auto_272885 ?auto_272887 ) ) ( not ( = ?auto_272886 ?auto_272887 ) ) ( ON ?auto_272885 ?auto_272886 ) ( ON ?auto_272884 ?auto_272885 ) ( ON ?auto_272883 ?auto_272884 ) ( CLEAR ?auto_272881 ) ( ON ?auto_272882 ?auto_272883 ) ( CLEAR ?auto_272882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_272877 ?auto_272878 ?auto_272879 ?auto_272880 ?auto_272881 ?auto_272882 )
      ( MAKE-10PILE ?auto_272877 ?auto_272878 ?auto_272879 ?auto_272880 ?auto_272881 ?auto_272882 ?auto_272883 ?auto_272884 ?auto_272885 ?auto_272886 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_272898 - BLOCK
      ?auto_272899 - BLOCK
      ?auto_272900 - BLOCK
      ?auto_272901 - BLOCK
      ?auto_272902 - BLOCK
      ?auto_272903 - BLOCK
      ?auto_272904 - BLOCK
      ?auto_272905 - BLOCK
      ?auto_272906 - BLOCK
      ?auto_272907 - BLOCK
    )
    :vars
    (
      ?auto_272908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272907 ?auto_272908 ) ( ON-TABLE ?auto_272898 ) ( ON ?auto_272899 ?auto_272898 ) ( ON ?auto_272900 ?auto_272899 ) ( ON ?auto_272901 ?auto_272900 ) ( not ( = ?auto_272898 ?auto_272899 ) ) ( not ( = ?auto_272898 ?auto_272900 ) ) ( not ( = ?auto_272898 ?auto_272901 ) ) ( not ( = ?auto_272898 ?auto_272902 ) ) ( not ( = ?auto_272898 ?auto_272903 ) ) ( not ( = ?auto_272898 ?auto_272904 ) ) ( not ( = ?auto_272898 ?auto_272905 ) ) ( not ( = ?auto_272898 ?auto_272906 ) ) ( not ( = ?auto_272898 ?auto_272907 ) ) ( not ( = ?auto_272898 ?auto_272908 ) ) ( not ( = ?auto_272899 ?auto_272900 ) ) ( not ( = ?auto_272899 ?auto_272901 ) ) ( not ( = ?auto_272899 ?auto_272902 ) ) ( not ( = ?auto_272899 ?auto_272903 ) ) ( not ( = ?auto_272899 ?auto_272904 ) ) ( not ( = ?auto_272899 ?auto_272905 ) ) ( not ( = ?auto_272899 ?auto_272906 ) ) ( not ( = ?auto_272899 ?auto_272907 ) ) ( not ( = ?auto_272899 ?auto_272908 ) ) ( not ( = ?auto_272900 ?auto_272901 ) ) ( not ( = ?auto_272900 ?auto_272902 ) ) ( not ( = ?auto_272900 ?auto_272903 ) ) ( not ( = ?auto_272900 ?auto_272904 ) ) ( not ( = ?auto_272900 ?auto_272905 ) ) ( not ( = ?auto_272900 ?auto_272906 ) ) ( not ( = ?auto_272900 ?auto_272907 ) ) ( not ( = ?auto_272900 ?auto_272908 ) ) ( not ( = ?auto_272901 ?auto_272902 ) ) ( not ( = ?auto_272901 ?auto_272903 ) ) ( not ( = ?auto_272901 ?auto_272904 ) ) ( not ( = ?auto_272901 ?auto_272905 ) ) ( not ( = ?auto_272901 ?auto_272906 ) ) ( not ( = ?auto_272901 ?auto_272907 ) ) ( not ( = ?auto_272901 ?auto_272908 ) ) ( not ( = ?auto_272902 ?auto_272903 ) ) ( not ( = ?auto_272902 ?auto_272904 ) ) ( not ( = ?auto_272902 ?auto_272905 ) ) ( not ( = ?auto_272902 ?auto_272906 ) ) ( not ( = ?auto_272902 ?auto_272907 ) ) ( not ( = ?auto_272902 ?auto_272908 ) ) ( not ( = ?auto_272903 ?auto_272904 ) ) ( not ( = ?auto_272903 ?auto_272905 ) ) ( not ( = ?auto_272903 ?auto_272906 ) ) ( not ( = ?auto_272903 ?auto_272907 ) ) ( not ( = ?auto_272903 ?auto_272908 ) ) ( not ( = ?auto_272904 ?auto_272905 ) ) ( not ( = ?auto_272904 ?auto_272906 ) ) ( not ( = ?auto_272904 ?auto_272907 ) ) ( not ( = ?auto_272904 ?auto_272908 ) ) ( not ( = ?auto_272905 ?auto_272906 ) ) ( not ( = ?auto_272905 ?auto_272907 ) ) ( not ( = ?auto_272905 ?auto_272908 ) ) ( not ( = ?auto_272906 ?auto_272907 ) ) ( not ( = ?auto_272906 ?auto_272908 ) ) ( not ( = ?auto_272907 ?auto_272908 ) ) ( ON ?auto_272906 ?auto_272907 ) ( ON ?auto_272905 ?auto_272906 ) ( ON ?auto_272904 ?auto_272905 ) ( ON ?auto_272903 ?auto_272904 ) ( CLEAR ?auto_272901 ) ( ON ?auto_272902 ?auto_272903 ) ( CLEAR ?auto_272902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_272898 ?auto_272899 ?auto_272900 ?auto_272901 ?auto_272902 )
      ( MAKE-10PILE ?auto_272898 ?auto_272899 ?auto_272900 ?auto_272901 ?auto_272902 ?auto_272903 ?auto_272904 ?auto_272905 ?auto_272906 ?auto_272907 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_272919 - BLOCK
      ?auto_272920 - BLOCK
      ?auto_272921 - BLOCK
      ?auto_272922 - BLOCK
      ?auto_272923 - BLOCK
      ?auto_272924 - BLOCK
      ?auto_272925 - BLOCK
      ?auto_272926 - BLOCK
      ?auto_272927 - BLOCK
      ?auto_272928 - BLOCK
    )
    :vars
    (
      ?auto_272929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272928 ?auto_272929 ) ( ON-TABLE ?auto_272919 ) ( ON ?auto_272920 ?auto_272919 ) ( ON ?auto_272921 ?auto_272920 ) ( ON ?auto_272922 ?auto_272921 ) ( not ( = ?auto_272919 ?auto_272920 ) ) ( not ( = ?auto_272919 ?auto_272921 ) ) ( not ( = ?auto_272919 ?auto_272922 ) ) ( not ( = ?auto_272919 ?auto_272923 ) ) ( not ( = ?auto_272919 ?auto_272924 ) ) ( not ( = ?auto_272919 ?auto_272925 ) ) ( not ( = ?auto_272919 ?auto_272926 ) ) ( not ( = ?auto_272919 ?auto_272927 ) ) ( not ( = ?auto_272919 ?auto_272928 ) ) ( not ( = ?auto_272919 ?auto_272929 ) ) ( not ( = ?auto_272920 ?auto_272921 ) ) ( not ( = ?auto_272920 ?auto_272922 ) ) ( not ( = ?auto_272920 ?auto_272923 ) ) ( not ( = ?auto_272920 ?auto_272924 ) ) ( not ( = ?auto_272920 ?auto_272925 ) ) ( not ( = ?auto_272920 ?auto_272926 ) ) ( not ( = ?auto_272920 ?auto_272927 ) ) ( not ( = ?auto_272920 ?auto_272928 ) ) ( not ( = ?auto_272920 ?auto_272929 ) ) ( not ( = ?auto_272921 ?auto_272922 ) ) ( not ( = ?auto_272921 ?auto_272923 ) ) ( not ( = ?auto_272921 ?auto_272924 ) ) ( not ( = ?auto_272921 ?auto_272925 ) ) ( not ( = ?auto_272921 ?auto_272926 ) ) ( not ( = ?auto_272921 ?auto_272927 ) ) ( not ( = ?auto_272921 ?auto_272928 ) ) ( not ( = ?auto_272921 ?auto_272929 ) ) ( not ( = ?auto_272922 ?auto_272923 ) ) ( not ( = ?auto_272922 ?auto_272924 ) ) ( not ( = ?auto_272922 ?auto_272925 ) ) ( not ( = ?auto_272922 ?auto_272926 ) ) ( not ( = ?auto_272922 ?auto_272927 ) ) ( not ( = ?auto_272922 ?auto_272928 ) ) ( not ( = ?auto_272922 ?auto_272929 ) ) ( not ( = ?auto_272923 ?auto_272924 ) ) ( not ( = ?auto_272923 ?auto_272925 ) ) ( not ( = ?auto_272923 ?auto_272926 ) ) ( not ( = ?auto_272923 ?auto_272927 ) ) ( not ( = ?auto_272923 ?auto_272928 ) ) ( not ( = ?auto_272923 ?auto_272929 ) ) ( not ( = ?auto_272924 ?auto_272925 ) ) ( not ( = ?auto_272924 ?auto_272926 ) ) ( not ( = ?auto_272924 ?auto_272927 ) ) ( not ( = ?auto_272924 ?auto_272928 ) ) ( not ( = ?auto_272924 ?auto_272929 ) ) ( not ( = ?auto_272925 ?auto_272926 ) ) ( not ( = ?auto_272925 ?auto_272927 ) ) ( not ( = ?auto_272925 ?auto_272928 ) ) ( not ( = ?auto_272925 ?auto_272929 ) ) ( not ( = ?auto_272926 ?auto_272927 ) ) ( not ( = ?auto_272926 ?auto_272928 ) ) ( not ( = ?auto_272926 ?auto_272929 ) ) ( not ( = ?auto_272927 ?auto_272928 ) ) ( not ( = ?auto_272927 ?auto_272929 ) ) ( not ( = ?auto_272928 ?auto_272929 ) ) ( ON ?auto_272927 ?auto_272928 ) ( ON ?auto_272926 ?auto_272927 ) ( ON ?auto_272925 ?auto_272926 ) ( ON ?auto_272924 ?auto_272925 ) ( CLEAR ?auto_272922 ) ( ON ?auto_272923 ?auto_272924 ) ( CLEAR ?auto_272923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_272919 ?auto_272920 ?auto_272921 ?auto_272922 ?auto_272923 )
      ( MAKE-10PILE ?auto_272919 ?auto_272920 ?auto_272921 ?auto_272922 ?auto_272923 ?auto_272924 ?auto_272925 ?auto_272926 ?auto_272927 ?auto_272928 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_272940 - BLOCK
      ?auto_272941 - BLOCK
      ?auto_272942 - BLOCK
      ?auto_272943 - BLOCK
      ?auto_272944 - BLOCK
      ?auto_272945 - BLOCK
      ?auto_272946 - BLOCK
      ?auto_272947 - BLOCK
      ?auto_272948 - BLOCK
      ?auto_272949 - BLOCK
    )
    :vars
    (
      ?auto_272950 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272949 ?auto_272950 ) ( ON-TABLE ?auto_272940 ) ( ON ?auto_272941 ?auto_272940 ) ( ON ?auto_272942 ?auto_272941 ) ( not ( = ?auto_272940 ?auto_272941 ) ) ( not ( = ?auto_272940 ?auto_272942 ) ) ( not ( = ?auto_272940 ?auto_272943 ) ) ( not ( = ?auto_272940 ?auto_272944 ) ) ( not ( = ?auto_272940 ?auto_272945 ) ) ( not ( = ?auto_272940 ?auto_272946 ) ) ( not ( = ?auto_272940 ?auto_272947 ) ) ( not ( = ?auto_272940 ?auto_272948 ) ) ( not ( = ?auto_272940 ?auto_272949 ) ) ( not ( = ?auto_272940 ?auto_272950 ) ) ( not ( = ?auto_272941 ?auto_272942 ) ) ( not ( = ?auto_272941 ?auto_272943 ) ) ( not ( = ?auto_272941 ?auto_272944 ) ) ( not ( = ?auto_272941 ?auto_272945 ) ) ( not ( = ?auto_272941 ?auto_272946 ) ) ( not ( = ?auto_272941 ?auto_272947 ) ) ( not ( = ?auto_272941 ?auto_272948 ) ) ( not ( = ?auto_272941 ?auto_272949 ) ) ( not ( = ?auto_272941 ?auto_272950 ) ) ( not ( = ?auto_272942 ?auto_272943 ) ) ( not ( = ?auto_272942 ?auto_272944 ) ) ( not ( = ?auto_272942 ?auto_272945 ) ) ( not ( = ?auto_272942 ?auto_272946 ) ) ( not ( = ?auto_272942 ?auto_272947 ) ) ( not ( = ?auto_272942 ?auto_272948 ) ) ( not ( = ?auto_272942 ?auto_272949 ) ) ( not ( = ?auto_272942 ?auto_272950 ) ) ( not ( = ?auto_272943 ?auto_272944 ) ) ( not ( = ?auto_272943 ?auto_272945 ) ) ( not ( = ?auto_272943 ?auto_272946 ) ) ( not ( = ?auto_272943 ?auto_272947 ) ) ( not ( = ?auto_272943 ?auto_272948 ) ) ( not ( = ?auto_272943 ?auto_272949 ) ) ( not ( = ?auto_272943 ?auto_272950 ) ) ( not ( = ?auto_272944 ?auto_272945 ) ) ( not ( = ?auto_272944 ?auto_272946 ) ) ( not ( = ?auto_272944 ?auto_272947 ) ) ( not ( = ?auto_272944 ?auto_272948 ) ) ( not ( = ?auto_272944 ?auto_272949 ) ) ( not ( = ?auto_272944 ?auto_272950 ) ) ( not ( = ?auto_272945 ?auto_272946 ) ) ( not ( = ?auto_272945 ?auto_272947 ) ) ( not ( = ?auto_272945 ?auto_272948 ) ) ( not ( = ?auto_272945 ?auto_272949 ) ) ( not ( = ?auto_272945 ?auto_272950 ) ) ( not ( = ?auto_272946 ?auto_272947 ) ) ( not ( = ?auto_272946 ?auto_272948 ) ) ( not ( = ?auto_272946 ?auto_272949 ) ) ( not ( = ?auto_272946 ?auto_272950 ) ) ( not ( = ?auto_272947 ?auto_272948 ) ) ( not ( = ?auto_272947 ?auto_272949 ) ) ( not ( = ?auto_272947 ?auto_272950 ) ) ( not ( = ?auto_272948 ?auto_272949 ) ) ( not ( = ?auto_272948 ?auto_272950 ) ) ( not ( = ?auto_272949 ?auto_272950 ) ) ( ON ?auto_272948 ?auto_272949 ) ( ON ?auto_272947 ?auto_272948 ) ( ON ?auto_272946 ?auto_272947 ) ( ON ?auto_272945 ?auto_272946 ) ( ON ?auto_272944 ?auto_272945 ) ( CLEAR ?auto_272942 ) ( ON ?auto_272943 ?auto_272944 ) ( CLEAR ?auto_272943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_272940 ?auto_272941 ?auto_272942 ?auto_272943 )
      ( MAKE-10PILE ?auto_272940 ?auto_272941 ?auto_272942 ?auto_272943 ?auto_272944 ?auto_272945 ?auto_272946 ?auto_272947 ?auto_272948 ?auto_272949 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_272961 - BLOCK
      ?auto_272962 - BLOCK
      ?auto_272963 - BLOCK
      ?auto_272964 - BLOCK
      ?auto_272965 - BLOCK
      ?auto_272966 - BLOCK
      ?auto_272967 - BLOCK
      ?auto_272968 - BLOCK
      ?auto_272969 - BLOCK
      ?auto_272970 - BLOCK
    )
    :vars
    (
      ?auto_272971 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272970 ?auto_272971 ) ( ON-TABLE ?auto_272961 ) ( ON ?auto_272962 ?auto_272961 ) ( ON ?auto_272963 ?auto_272962 ) ( not ( = ?auto_272961 ?auto_272962 ) ) ( not ( = ?auto_272961 ?auto_272963 ) ) ( not ( = ?auto_272961 ?auto_272964 ) ) ( not ( = ?auto_272961 ?auto_272965 ) ) ( not ( = ?auto_272961 ?auto_272966 ) ) ( not ( = ?auto_272961 ?auto_272967 ) ) ( not ( = ?auto_272961 ?auto_272968 ) ) ( not ( = ?auto_272961 ?auto_272969 ) ) ( not ( = ?auto_272961 ?auto_272970 ) ) ( not ( = ?auto_272961 ?auto_272971 ) ) ( not ( = ?auto_272962 ?auto_272963 ) ) ( not ( = ?auto_272962 ?auto_272964 ) ) ( not ( = ?auto_272962 ?auto_272965 ) ) ( not ( = ?auto_272962 ?auto_272966 ) ) ( not ( = ?auto_272962 ?auto_272967 ) ) ( not ( = ?auto_272962 ?auto_272968 ) ) ( not ( = ?auto_272962 ?auto_272969 ) ) ( not ( = ?auto_272962 ?auto_272970 ) ) ( not ( = ?auto_272962 ?auto_272971 ) ) ( not ( = ?auto_272963 ?auto_272964 ) ) ( not ( = ?auto_272963 ?auto_272965 ) ) ( not ( = ?auto_272963 ?auto_272966 ) ) ( not ( = ?auto_272963 ?auto_272967 ) ) ( not ( = ?auto_272963 ?auto_272968 ) ) ( not ( = ?auto_272963 ?auto_272969 ) ) ( not ( = ?auto_272963 ?auto_272970 ) ) ( not ( = ?auto_272963 ?auto_272971 ) ) ( not ( = ?auto_272964 ?auto_272965 ) ) ( not ( = ?auto_272964 ?auto_272966 ) ) ( not ( = ?auto_272964 ?auto_272967 ) ) ( not ( = ?auto_272964 ?auto_272968 ) ) ( not ( = ?auto_272964 ?auto_272969 ) ) ( not ( = ?auto_272964 ?auto_272970 ) ) ( not ( = ?auto_272964 ?auto_272971 ) ) ( not ( = ?auto_272965 ?auto_272966 ) ) ( not ( = ?auto_272965 ?auto_272967 ) ) ( not ( = ?auto_272965 ?auto_272968 ) ) ( not ( = ?auto_272965 ?auto_272969 ) ) ( not ( = ?auto_272965 ?auto_272970 ) ) ( not ( = ?auto_272965 ?auto_272971 ) ) ( not ( = ?auto_272966 ?auto_272967 ) ) ( not ( = ?auto_272966 ?auto_272968 ) ) ( not ( = ?auto_272966 ?auto_272969 ) ) ( not ( = ?auto_272966 ?auto_272970 ) ) ( not ( = ?auto_272966 ?auto_272971 ) ) ( not ( = ?auto_272967 ?auto_272968 ) ) ( not ( = ?auto_272967 ?auto_272969 ) ) ( not ( = ?auto_272967 ?auto_272970 ) ) ( not ( = ?auto_272967 ?auto_272971 ) ) ( not ( = ?auto_272968 ?auto_272969 ) ) ( not ( = ?auto_272968 ?auto_272970 ) ) ( not ( = ?auto_272968 ?auto_272971 ) ) ( not ( = ?auto_272969 ?auto_272970 ) ) ( not ( = ?auto_272969 ?auto_272971 ) ) ( not ( = ?auto_272970 ?auto_272971 ) ) ( ON ?auto_272969 ?auto_272970 ) ( ON ?auto_272968 ?auto_272969 ) ( ON ?auto_272967 ?auto_272968 ) ( ON ?auto_272966 ?auto_272967 ) ( ON ?auto_272965 ?auto_272966 ) ( CLEAR ?auto_272963 ) ( ON ?auto_272964 ?auto_272965 ) ( CLEAR ?auto_272964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_272961 ?auto_272962 ?auto_272963 ?auto_272964 )
      ( MAKE-10PILE ?auto_272961 ?auto_272962 ?auto_272963 ?auto_272964 ?auto_272965 ?auto_272966 ?auto_272967 ?auto_272968 ?auto_272969 ?auto_272970 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_272982 - BLOCK
      ?auto_272983 - BLOCK
      ?auto_272984 - BLOCK
      ?auto_272985 - BLOCK
      ?auto_272986 - BLOCK
      ?auto_272987 - BLOCK
      ?auto_272988 - BLOCK
      ?auto_272989 - BLOCK
      ?auto_272990 - BLOCK
      ?auto_272991 - BLOCK
    )
    :vars
    (
      ?auto_272992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272991 ?auto_272992 ) ( ON-TABLE ?auto_272982 ) ( ON ?auto_272983 ?auto_272982 ) ( not ( = ?auto_272982 ?auto_272983 ) ) ( not ( = ?auto_272982 ?auto_272984 ) ) ( not ( = ?auto_272982 ?auto_272985 ) ) ( not ( = ?auto_272982 ?auto_272986 ) ) ( not ( = ?auto_272982 ?auto_272987 ) ) ( not ( = ?auto_272982 ?auto_272988 ) ) ( not ( = ?auto_272982 ?auto_272989 ) ) ( not ( = ?auto_272982 ?auto_272990 ) ) ( not ( = ?auto_272982 ?auto_272991 ) ) ( not ( = ?auto_272982 ?auto_272992 ) ) ( not ( = ?auto_272983 ?auto_272984 ) ) ( not ( = ?auto_272983 ?auto_272985 ) ) ( not ( = ?auto_272983 ?auto_272986 ) ) ( not ( = ?auto_272983 ?auto_272987 ) ) ( not ( = ?auto_272983 ?auto_272988 ) ) ( not ( = ?auto_272983 ?auto_272989 ) ) ( not ( = ?auto_272983 ?auto_272990 ) ) ( not ( = ?auto_272983 ?auto_272991 ) ) ( not ( = ?auto_272983 ?auto_272992 ) ) ( not ( = ?auto_272984 ?auto_272985 ) ) ( not ( = ?auto_272984 ?auto_272986 ) ) ( not ( = ?auto_272984 ?auto_272987 ) ) ( not ( = ?auto_272984 ?auto_272988 ) ) ( not ( = ?auto_272984 ?auto_272989 ) ) ( not ( = ?auto_272984 ?auto_272990 ) ) ( not ( = ?auto_272984 ?auto_272991 ) ) ( not ( = ?auto_272984 ?auto_272992 ) ) ( not ( = ?auto_272985 ?auto_272986 ) ) ( not ( = ?auto_272985 ?auto_272987 ) ) ( not ( = ?auto_272985 ?auto_272988 ) ) ( not ( = ?auto_272985 ?auto_272989 ) ) ( not ( = ?auto_272985 ?auto_272990 ) ) ( not ( = ?auto_272985 ?auto_272991 ) ) ( not ( = ?auto_272985 ?auto_272992 ) ) ( not ( = ?auto_272986 ?auto_272987 ) ) ( not ( = ?auto_272986 ?auto_272988 ) ) ( not ( = ?auto_272986 ?auto_272989 ) ) ( not ( = ?auto_272986 ?auto_272990 ) ) ( not ( = ?auto_272986 ?auto_272991 ) ) ( not ( = ?auto_272986 ?auto_272992 ) ) ( not ( = ?auto_272987 ?auto_272988 ) ) ( not ( = ?auto_272987 ?auto_272989 ) ) ( not ( = ?auto_272987 ?auto_272990 ) ) ( not ( = ?auto_272987 ?auto_272991 ) ) ( not ( = ?auto_272987 ?auto_272992 ) ) ( not ( = ?auto_272988 ?auto_272989 ) ) ( not ( = ?auto_272988 ?auto_272990 ) ) ( not ( = ?auto_272988 ?auto_272991 ) ) ( not ( = ?auto_272988 ?auto_272992 ) ) ( not ( = ?auto_272989 ?auto_272990 ) ) ( not ( = ?auto_272989 ?auto_272991 ) ) ( not ( = ?auto_272989 ?auto_272992 ) ) ( not ( = ?auto_272990 ?auto_272991 ) ) ( not ( = ?auto_272990 ?auto_272992 ) ) ( not ( = ?auto_272991 ?auto_272992 ) ) ( ON ?auto_272990 ?auto_272991 ) ( ON ?auto_272989 ?auto_272990 ) ( ON ?auto_272988 ?auto_272989 ) ( ON ?auto_272987 ?auto_272988 ) ( ON ?auto_272986 ?auto_272987 ) ( ON ?auto_272985 ?auto_272986 ) ( CLEAR ?auto_272983 ) ( ON ?auto_272984 ?auto_272985 ) ( CLEAR ?auto_272984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_272982 ?auto_272983 ?auto_272984 )
      ( MAKE-10PILE ?auto_272982 ?auto_272983 ?auto_272984 ?auto_272985 ?auto_272986 ?auto_272987 ?auto_272988 ?auto_272989 ?auto_272990 ?auto_272991 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_273003 - BLOCK
      ?auto_273004 - BLOCK
      ?auto_273005 - BLOCK
      ?auto_273006 - BLOCK
      ?auto_273007 - BLOCK
      ?auto_273008 - BLOCK
      ?auto_273009 - BLOCK
      ?auto_273010 - BLOCK
      ?auto_273011 - BLOCK
      ?auto_273012 - BLOCK
    )
    :vars
    (
      ?auto_273013 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273012 ?auto_273013 ) ( ON-TABLE ?auto_273003 ) ( ON ?auto_273004 ?auto_273003 ) ( not ( = ?auto_273003 ?auto_273004 ) ) ( not ( = ?auto_273003 ?auto_273005 ) ) ( not ( = ?auto_273003 ?auto_273006 ) ) ( not ( = ?auto_273003 ?auto_273007 ) ) ( not ( = ?auto_273003 ?auto_273008 ) ) ( not ( = ?auto_273003 ?auto_273009 ) ) ( not ( = ?auto_273003 ?auto_273010 ) ) ( not ( = ?auto_273003 ?auto_273011 ) ) ( not ( = ?auto_273003 ?auto_273012 ) ) ( not ( = ?auto_273003 ?auto_273013 ) ) ( not ( = ?auto_273004 ?auto_273005 ) ) ( not ( = ?auto_273004 ?auto_273006 ) ) ( not ( = ?auto_273004 ?auto_273007 ) ) ( not ( = ?auto_273004 ?auto_273008 ) ) ( not ( = ?auto_273004 ?auto_273009 ) ) ( not ( = ?auto_273004 ?auto_273010 ) ) ( not ( = ?auto_273004 ?auto_273011 ) ) ( not ( = ?auto_273004 ?auto_273012 ) ) ( not ( = ?auto_273004 ?auto_273013 ) ) ( not ( = ?auto_273005 ?auto_273006 ) ) ( not ( = ?auto_273005 ?auto_273007 ) ) ( not ( = ?auto_273005 ?auto_273008 ) ) ( not ( = ?auto_273005 ?auto_273009 ) ) ( not ( = ?auto_273005 ?auto_273010 ) ) ( not ( = ?auto_273005 ?auto_273011 ) ) ( not ( = ?auto_273005 ?auto_273012 ) ) ( not ( = ?auto_273005 ?auto_273013 ) ) ( not ( = ?auto_273006 ?auto_273007 ) ) ( not ( = ?auto_273006 ?auto_273008 ) ) ( not ( = ?auto_273006 ?auto_273009 ) ) ( not ( = ?auto_273006 ?auto_273010 ) ) ( not ( = ?auto_273006 ?auto_273011 ) ) ( not ( = ?auto_273006 ?auto_273012 ) ) ( not ( = ?auto_273006 ?auto_273013 ) ) ( not ( = ?auto_273007 ?auto_273008 ) ) ( not ( = ?auto_273007 ?auto_273009 ) ) ( not ( = ?auto_273007 ?auto_273010 ) ) ( not ( = ?auto_273007 ?auto_273011 ) ) ( not ( = ?auto_273007 ?auto_273012 ) ) ( not ( = ?auto_273007 ?auto_273013 ) ) ( not ( = ?auto_273008 ?auto_273009 ) ) ( not ( = ?auto_273008 ?auto_273010 ) ) ( not ( = ?auto_273008 ?auto_273011 ) ) ( not ( = ?auto_273008 ?auto_273012 ) ) ( not ( = ?auto_273008 ?auto_273013 ) ) ( not ( = ?auto_273009 ?auto_273010 ) ) ( not ( = ?auto_273009 ?auto_273011 ) ) ( not ( = ?auto_273009 ?auto_273012 ) ) ( not ( = ?auto_273009 ?auto_273013 ) ) ( not ( = ?auto_273010 ?auto_273011 ) ) ( not ( = ?auto_273010 ?auto_273012 ) ) ( not ( = ?auto_273010 ?auto_273013 ) ) ( not ( = ?auto_273011 ?auto_273012 ) ) ( not ( = ?auto_273011 ?auto_273013 ) ) ( not ( = ?auto_273012 ?auto_273013 ) ) ( ON ?auto_273011 ?auto_273012 ) ( ON ?auto_273010 ?auto_273011 ) ( ON ?auto_273009 ?auto_273010 ) ( ON ?auto_273008 ?auto_273009 ) ( ON ?auto_273007 ?auto_273008 ) ( ON ?auto_273006 ?auto_273007 ) ( CLEAR ?auto_273004 ) ( ON ?auto_273005 ?auto_273006 ) ( CLEAR ?auto_273005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_273003 ?auto_273004 ?auto_273005 )
      ( MAKE-10PILE ?auto_273003 ?auto_273004 ?auto_273005 ?auto_273006 ?auto_273007 ?auto_273008 ?auto_273009 ?auto_273010 ?auto_273011 ?auto_273012 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_273024 - BLOCK
      ?auto_273025 - BLOCK
      ?auto_273026 - BLOCK
      ?auto_273027 - BLOCK
      ?auto_273028 - BLOCK
      ?auto_273029 - BLOCK
      ?auto_273030 - BLOCK
      ?auto_273031 - BLOCK
      ?auto_273032 - BLOCK
      ?auto_273033 - BLOCK
    )
    :vars
    (
      ?auto_273034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273033 ?auto_273034 ) ( ON-TABLE ?auto_273024 ) ( not ( = ?auto_273024 ?auto_273025 ) ) ( not ( = ?auto_273024 ?auto_273026 ) ) ( not ( = ?auto_273024 ?auto_273027 ) ) ( not ( = ?auto_273024 ?auto_273028 ) ) ( not ( = ?auto_273024 ?auto_273029 ) ) ( not ( = ?auto_273024 ?auto_273030 ) ) ( not ( = ?auto_273024 ?auto_273031 ) ) ( not ( = ?auto_273024 ?auto_273032 ) ) ( not ( = ?auto_273024 ?auto_273033 ) ) ( not ( = ?auto_273024 ?auto_273034 ) ) ( not ( = ?auto_273025 ?auto_273026 ) ) ( not ( = ?auto_273025 ?auto_273027 ) ) ( not ( = ?auto_273025 ?auto_273028 ) ) ( not ( = ?auto_273025 ?auto_273029 ) ) ( not ( = ?auto_273025 ?auto_273030 ) ) ( not ( = ?auto_273025 ?auto_273031 ) ) ( not ( = ?auto_273025 ?auto_273032 ) ) ( not ( = ?auto_273025 ?auto_273033 ) ) ( not ( = ?auto_273025 ?auto_273034 ) ) ( not ( = ?auto_273026 ?auto_273027 ) ) ( not ( = ?auto_273026 ?auto_273028 ) ) ( not ( = ?auto_273026 ?auto_273029 ) ) ( not ( = ?auto_273026 ?auto_273030 ) ) ( not ( = ?auto_273026 ?auto_273031 ) ) ( not ( = ?auto_273026 ?auto_273032 ) ) ( not ( = ?auto_273026 ?auto_273033 ) ) ( not ( = ?auto_273026 ?auto_273034 ) ) ( not ( = ?auto_273027 ?auto_273028 ) ) ( not ( = ?auto_273027 ?auto_273029 ) ) ( not ( = ?auto_273027 ?auto_273030 ) ) ( not ( = ?auto_273027 ?auto_273031 ) ) ( not ( = ?auto_273027 ?auto_273032 ) ) ( not ( = ?auto_273027 ?auto_273033 ) ) ( not ( = ?auto_273027 ?auto_273034 ) ) ( not ( = ?auto_273028 ?auto_273029 ) ) ( not ( = ?auto_273028 ?auto_273030 ) ) ( not ( = ?auto_273028 ?auto_273031 ) ) ( not ( = ?auto_273028 ?auto_273032 ) ) ( not ( = ?auto_273028 ?auto_273033 ) ) ( not ( = ?auto_273028 ?auto_273034 ) ) ( not ( = ?auto_273029 ?auto_273030 ) ) ( not ( = ?auto_273029 ?auto_273031 ) ) ( not ( = ?auto_273029 ?auto_273032 ) ) ( not ( = ?auto_273029 ?auto_273033 ) ) ( not ( = ?auto_273029 ?auto_273034 ) ) ( not ( = ?auto_273030 ?auto_273031 ) ) ( not ( = ?auto_273030 ?auto_273032 ) ) ( not ( = ?auto_273030 ?auto_273033 ) ) ( not ( = ?auto_273030 ?auto_273034 ) ) ( not ( = ?auto_273031 ?auto_273032 ) ) ( not ( = ?auto_273031 ?auto_273033 ) ) ( not ( = ?auto_273031 ?auto_273034 ) ) ( not ( = ?auto_273032 ?auto_273033 ) ) ( not ( = ?auto_273032 ?auto_273034 ) ) ( not ( = ?auto_273033 ?auto_273034 ) ) ( ON ?auto_273032 ?auto_273033 ) ( ON ?auto_273031 ?auto_273032 ) ( ON ?auto_273030 ?auto_273031 ) ( ON ?auto_273029 ?auto_273030 ) ( ON ?auto_273028 ?auto_273029 ) ( ON ?auto_273027 ?auto_273028 ) ( ON ?auto_273026 ?auto_273027 ) ( CLEAR ?auto_273024 ) ( ON ?auto_273025 ?auto_273026 ) ( CLEAR ?auto_273025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_273024 ?auto_273025 )
      ( MAKE-10PILE ?auto_273024 ?auto_273025 ?auto_273026 ?auto_273027 ?auto_273028 ?auto_273029 ?auto_273030 ?auto_273031 ?auto_273032 ?auto_273033 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_273045 - BLOCK
      ?auto_273046 - BLOCK
      ?auto_273047 - BLOCK
      ?auto_273048 - BLOCK
      ?auto_273049 - BLOCK
      ?auto_273050 - BLOCK
      ?auto_273051 - BLOCK
      ?auto_273052 - BLOCK
      ?auto_273053 - BLOCK
      ?auto_273054 - BLOCK
    )
    :vars
    (
      ?auto_273055 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273054 ?auto_273055 ) ( ON-TABLE ?auto_273045 ) ( not ( = ?auto_273045 ?auto_273046 ) ) ( not ( = ?auto_273045 ?auto_273047 ) ) ( not ( = ?auto_273045 ?auto_273048 ) ) ( not ( = ?auto_273045 ?auto_273049 ) ) ( not ( = ?auto_273045 ?auto_273050 ) ) ( not ( = ?auto_273045 ?auto_273051 ) ) ( not ( = ?auto_273045 ?auto_273052 ) ) ( not ( = ?auto_273045 ?auto_273053 ) ) ( not ( = ?auto_273045 ?auto_273054 ) ) ( not ( = ?auto_273045 ?auto_273055 ) ) ( not ( = ?auto_273046 ?auto_273047 ) ) ( not ( = ?auto_273046 ?auto_273048 ) ) ( not ( = ?auto_273046 ?auto_273049 ) ) ( not ( = ?auto_273046 ?auto_273050 ) ) ( not ( = ?auto_273046 ?auto_273051 ) ) ( not ( = ?auto_273046 ?auto_273052 ) ) ( not ( = ?auto_273046 ?auto_273053 ) ) ( not ( = ?auto_273046 ?auto_273054 ) ) ( not ( = ?auto_273046 ?auto_273055 ) ) ( not ( = ?auto_273047 ?auto_273048 ) ) ( not ( = ?auto_273047 ?auto_273049 ) ) ( not ( = ?auto_273047 ?auto_273050 ) ) ( not ( = ?auto_273047 ?auto_273051 ) ) ( not ( = ?auto_273047 ?auto_273052 ) ) ( not ( = ?auto_273047 ?auto_273053 ) ) ( not ( = ?auto_273047 ?auto_273054 ) ) ( not ( = ?auto_273047 ?auto_273055 ) ) ( not ( = ?auto_273048 ?auto_273049 ) ) ( not ( = ?auto_273048 ?auto_273050 ) ) ( not ( = ?auto_273048 ?auto_273051 ) ) ( not ( = ?auto_273048 ?auto_273052 ) ) ( not ( = ?auto_273048 ?auto_273053 ) ) ( not ( = ?auto_273048 ?auto_273054 ) ) ( not ( = ?auto_273048 ?auto_273055 ) ) ( not ( = ?auto_273049 ?auto_273050 ) ) ( not ( = ?auto_273049 ?auto_273051 ) ) ( not ( = ?auto_273049 ?auto_273052 ) ) ( not ( = ?auto_273049 ?auto_273053 ) ) ( not ( = ?auto_273049 ?auto_273054 ) ) ( not ( = ?auto_273049 ?auto_273055 ) ) ( not ( = ?auto_273050 ?auto_273051 ) ) ( not ( = ?auto_273050 ?auto_273052 ) ) ( not ( = ?auto_273050 ?auto_273053 ) ) ( not ( = ?auto_273050 ?auto_273054 ) ) ( not ( = ?auto_273050 ?auto_273055 ) ) ( not ( = ?auto_273051 ?auto_273052 ) ) ( not ( = ?auto_273051 ?auto_273053 ) ) ( not ( = ?auto_273051 ?auto_273054 ) ) ( not ( = ?auto_273051 ?auto_273055 ) ) ( not ( = ?auto_273052 ?auto_273053 ) ) ( not ( = ?auto_273052 ?auto_273054 ) ) ( not ( = ?auto_273052 ?auto_273055 ) ) ( not ( = ?auto_273053 ?auto_273054 ) ) ( not ( = ?auto_273053 ?auto_273055 ) ) ( not ( = ?auto_273054 ?auto_273055 ) ) ( ON ?auto_273053 ?auto_273054 ) ( ON ?auto_273052 ?auto_273053 ) ( ON ?auto_273051 ?auto_273052 ) ( ON ?auto_273050 ?auto_273051 ) ( ON ?auto_273049 ?auto_273050 ) ( ON ?auto_273048 ?auto_273049 ) ( ON ?auto_273047 ?auto_273048 ) ( CLEAR ?auto_273045 ) ( ON ?auto_273046 ?auto_273047 ) ( CLEAR ?auto_273046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_273045 ?auto_273046 )
      ( MAKE-10PILE ?auto_273045 ?auto_273046 ?auto_273047 ?auto_273048 ?auto_273049 ?auto_273050 ?auto_273051 ?auto_273052 ?auto_273053 ?auto_273054 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_273066 - BLOCK
      ?auto_273067 - BLOCK
      ?auto_273068 - BLOCK
      ?auto_273069 - BLOCK
      ?auto_273070 - BLOCK
      ?auto_273071 - BLOCK
      ?auto_273072 - BLOCK
      ?auto_273073 - BLOCK
      ?auto_273074 - BLOCK
      ?auto_273075 - BLOCK
    )
    :vars
    (
      ?auto_273076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273075 ?auto_273076 ) ( not ( = ?auto_273066 ?auto_273067 ) ) ( not ( = ?auto_273066 ?auto_273068 ) ) ( not ( = ?auto_273066 ?auto_273069 ) ) ( not ( = ?auto_273066 ?auto_273070 ) ) ( not ( = ?auto_273066 ?auto_273071 ) ) ( not ( = ?auto_273066 ?auto_273072 ) ) ( not ( = ?auto_273066 ?auto_273073 ) ) ( not ( = ?auto_273066 ?auto_273074 ) ) ( not ( = ?auto_273066 ?auto_273075 ) ) ( not ( = ?auto_273066 ?auto_273076 ) ) ( not ( = ?auto_273067 ?auto_273068 ) ) ( not ( = ?auto_273067 ?auto_273069 ) ) ( not ( = ?auto_273067 ?auto_273070 ) ) ( not ( = ?auto_273067 ?auto_273071 ) ) ( not ( = ?auto_273067 ?auto_273072 ) ) ( not ( = ?auto_273067 ?auto_273073 ) ) ( not ( = ?auto_273067 ?auto_273074 ) ) ( not ( = ?auto_273067 ?auto_273075 ) ) ( not ( = ?auto_273067 ?auto_273076 ) ) ( not ( = ?auto_273068 ?auto_273069 ) ) ( not ( = ?auto_273068 ?auto_273070 ) ) ( not ( = ?auto_273068 ?auto_273071 ) ) ( not ( = ?auto_273068 ?auto_273072 ) ) ( not ( = ?auto_273068 ?auto_273073 ) ) ( not ( = ?auto_273068 ?auto_273074 ) ) ( not ( = ?auto_273068 ?auto_273075 ) ) ( not ( = ?auto_273068 ?auto_273076 ) ) ( not ( = ?auto_273069 ?auto_273070 ) ) ( not ( = ?auto_273069 ?auto_273071 ) ) ( not ( = ?auto_273069 ?auto_273072 ) ) ( not ( = ?auto_273069 ?auto_273073 ) ) ( not ( = ?auto_273069 ?auto_273074 ) ) ( not ( = ?auto_273069 ?auto_273075 ) ) ( not ( = ?auto_273069 ?auto_273076 ) ) ( not ( = ?auto_273070 ?auto_273071 ) ) ( not ( = ?auto_273070 ?auto_273072 ) ) ( not ( = ?auto_273070 ?auto_273073 ) ) ( not ( = ?auto_273070 ?auto_273074 ) ) ( not ( = ?auto_273070 ?auto_273075 ) ) ( not ( = ?auto_273070 ?auto_273076 ) ) ( not ( = ?auto_273071 ?auto_273072 ) ) ( not ( = ?auto_273071 ?auto_273073 ) ) ( not ( = ?auto_273071 ?auto_273074 ) ) ( not ( = ?auto_273071 ?auto_273075 ) ) ( not ( = ?auto_273071 ?auto_273076 ) ) ( not ( = ?auto_273072 ?auto_273073 ) ) ( not ( = ?auto_273072 ?auto_273074 ) ) ( not ( = ?auto_273072 ?auto_273075 ) ) ( not ( = ?auto_273072 ?auto_273076 ) ) ( not ( = ?auto_273073 ?auto_273074 ) ) ( not ( = ?auto_273073 ?auto_273075 ) ) ( not ( = ?auto_273073 ?auto_273076 ) ) ( not ( = ?auto_273074 ?auto_273075 ) ) ( not ( = ?auto_273074 ?auto_273076 ) ) ( not ( = ?auto_273075 ?auto_273076 ) ) ( ON ?auto_273074 ?auto_273075 ) ( ON ?auto_273073 ?auto_273074 ) ( ON ?auto_273072 ?auto_273073 ) ( ON ?auto_273071 ?auto_273072 ) ( ON ?auto_273070 ?auto_273071 ) ( ON ?auto_273069 ?auto_273070 ) ( ON ?auto_273068 ?auto_273069 ) ( ON ?auto_273067 ?auto_273068 ) ( ON ?auto_273066 ?auto_273067 ) ( CLEAR ?auto_273066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_273066 )
      ( MAKE-10PILE ?auto_273066 ?auto_273067 ?auto_273068 ?auto_273069 ?auto_273070 ?auto_273071 ?auto_273072 ?auto_273073 ?auto_273074 ?auto_273075 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_273087 - BLOCK
      ?auto_273088 - BLOCK
      ?auto_273089 - BLOCK
      ?auto_273090 - BLOCK
      ?auto_273091 - BLOCK
      ?auto_273092 - BLOCK
      ?auto_273093 - BLOCK
      ?auto_273094 - BLOCK
      ?auto_273095 - BLOCK
      ?auto_273096 - BLOCK
    )
    :vars
    (
      ?auto_273097 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273096 ?auto_273097 ) ( not ( = ?auto_273087 ?auto_273088 ) ) ( not ( = ?auto_273087 ?auto_273089 ) ) ( not ( = ?auto_273087 ?auto_273090 ) ) ( not ( = ?auto_273087 ?auto_273091 ) ) ( not ( = ?auto_273087 ?auto_273092 ) ) ( not ( = ?auto_273087 ?auto_273093 ) ) ( not ( = ?auto_273087 ?auto_273094 ) ) ( not ( = ?auto_273087 ?auto_273095 ) ) ( not ( = ?auto_273087 ?auto_273096 ) ) ( not ( = ?auto_273087 ?auto_273097 ) ) ( not ( = ?auto_273088 ?auto_273089 ) ) ( not ( = ?auto_273088 ?auto_273090 ) ) ( not ( = ?auto_273088 ?auto_273091 ) ) ( not ( = ?auto_273088 ?auto_273092 ) ) ( not ( = ?auto_273088 ?auto_273093 ) ) ( not ( = ?auto_273088 ?auto_273094 ) ) ( not ( = ?auto_273088 ?auto_273095 ) ) ( not ( = ?auto_273088 ?auto_273096 ) ) ( not ( = ?auto_273088 ?auto_273097 ) ) ( not ( = ?auto_273089 ?auto_273090 ) ) ( not ( = ?auto_273089 ?auto_273091 ) ) ( not ( = ?auto_273089 ?auto_273092 ) ) ( not ( = ?auto_273089 ?auto_273093 ) ) ( not ( = ?auto_273089 ?auto_273094 ) ) ( not ( = ?auto_273089 ?auto_273095 ) ) ( not ( = ?auto_273089 ?auto_273096 ) ) ( not ( = ?auto_273089 ?auto_273097 ) ) ( not ( = ?auto_273090 ?auto_273091 ) ) ( not ( = ?auto_273090 ?auto_273092 ) ) ( not ( = ?auto_273090 ?auto_273093 ) ) ( not ( = ?auto_273090 ?auto_273094 ) ) ( not ( = ?auto_273090 ?auto_273095 ) ) ( not ( = ?auto_273090 ?auto_273096 ) ) ( not ( = ?auto_273090 ?auto_273097 ) ) ( not ( = ?auto_273091 ?auto_273092 ) ) ( not ( = ?auto_273091 ?auto_273093 ) ) ( not ( = ?auto_273091 ?auto_273094 ) ) ( not ( = ?auto_273091 ?auto_273095 ) ) ( not ( = ?auto_273091 ?auto_273096 ) ) ( not ( = ?auto_273091 ?auto_273097 ) ) ( not ( = ?auto_273092 ?auto_273093 ) ) ( not ( = ?auto_273092 ?auto_273094 ) ) ( not ( = ?auto_273092 ?auto_273095 ) ) ( not ( = ?auto_273092 ?auto_273096 ) ) ( not ( = ?auto_273092 ?auto_273097 ) ) ( not ( = ?auto_273093 ?auto_273094 ) ) ( not ( = ?auto_273093 ?auto_273095 ) ) ( not ( = ?auto_273093 ?auto_273096 ) ) ( not ( = ?auto_273093 ?auto_273097 ) ) ( not ( = ?auto_273094 ?auto_273095 ) ) ( not ( = ?auto_273094 ?auto_273096 ) ) ( not ( = ?auto_273094 ?auto_273097 ) ) ( not ( = ?auto_273095 ?auto_273096 ) ) ( not ( = ?auto_273095 ?auto_273097 ) ) ( not ( = ?auto_273096 ?auto_273097 ) ) ( ON ?auto_273095 ?auto_273096 ) ( ON ?auto_273094 ?auto_273095 ) ( ON ?auto_273093 ?auto_273094 ) ( ON ?auto_273092 ?auto_273093 ) ( ON ?auto_273091 ?auto_273092 ) ( ON ?auto_273090 ?auto_273091 ) ( ON ?auto_273089 ?auto_273090 ) ( ON ?auto_273088 ?auto_273089 ) ( ON ?auto_273087 ?auto_273088 ) ( CLEAR ?auto_273087 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_273087 )
      ( MAKE-10PILE ?auto_273087 ?auto_273088 ?auto_273089 ?auto_273090 ?auto_273091 ?auto_273092 ?auto_273093 ?auto_273094 ?auto_273095 ?auto_273096 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_273109 - BLOCK
      ?auto_273110 - BLOCK
      ?auto_273111 - BLOCK
      ?auto_273112 - BLOCK
      ?auto_273113 - BLOCK
      ?auto_273114 - BLOCK
      ?auto_273115 - BLOCK
      ?auto_273116 - BLOCK
      ?auto_273117 - BLOCK
      ?auto_273118 - BLOCK
      ?auto_273119 - BLOCK
    )
    :vars
    (
      ?auto_273120 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_273118 ) ( ON ?auto_273119 ?auto_273120 ) ( CLEAR ?auto_273119 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_273109 ) ( ON ?auto_273110 ?auto_273109 ) ( ON ?auto_273111 ?auto_273110 ) ( ON ?auto_273112 ?auto_273111 ) ( ON ?auto_273113 ?auto_273112 ) ( ON ?auto_273114 ?auto_273113 ) ( ON ?auto_273115 ?auto_273114 ) ( ON ?auto_273116 ?auto_273115 ) ( ON ?auto_273117 ?auto_273116 ) ( ON ?auto_273118 ?auto_273117 ) ( not ( = ?auto_273109 ?auto_273110 ) ) ( not ( = ?auto_273109 ?auto_273111 ) ) ( not ( = ?auto_273109 ?auto_273112 ) ) ( not ( = ?auto_273109 ?auto_273113 ) ) ( not ( = ?auto_273109 ?auto_273114 ) ) ( not ( = ?auto_273109 ?auto_273115 ) ) ( not ( = ?auto_273109 ?auto_273116 ) ) ( not ( = ?auto_273109 ?auto_273117 ) ) ( not ( = ?auto_273109 ?auto_273118 ) ) ( not ( = ?auto_273109 ?auto_273119 ) ) ( not ( = ?auto_273109 ?auto_273120 ) ) ( not ( = ?auto_273110 ?auto_273111 ) ) ( not ( = ?auto_273110 ?auto_273112 ) ) ( not ( = ?auto_273110 ?auto_273113 ) ) ( not ( = ?auto_273110 ?auto_273114 ) ) ( not ( = ?auto_273110 ?auto_273115 ) ) ( not ( = ?auto_273110 ?auto_273116 ) ) ( not ( = ?auto_273110 ?auto_273117 ) ) ( not ( = ?auto_273110 ?auto_273118 ) ) ( not ( = ?auto_273110 ?auto_273119 ) ) ( not ( = ?auto_273110 ?auto_273120 ) ) ( not ( = ?auto_273111 ?auto_273112 ) ) ( not ( = ?auto_273111 ?auto_273113 ) ) ( not ( = ?auto_273111 ?auto_273114 ) ) ( not ( = ?auto_273111 ?auto_273115 ) ) ( not ( = ?auto_273111 ?auto_273116 ) ) ( not ( = ?auto_273111 ?auto_273117 ) ) ( not ( = ?auto_273111 ?auto_273118 ) ) ( not ( = ?auto_273111 ?auto_273119 ) ) ( not ( = ?auto_273111 ?auto_273120 ) ) ( not ( = ?auto_273112 ?auto_273113 ) ) ( not ( = ?auto_273112 ?auto_273114 ) ) ( not ( = ?auto_273112 ?auto_273115 ) ) ( not ( = ?auto_273112 ?auto_273116 ) ) ( not ( = ?auto_273112 ?auto_273117 ) ) ( not ( = ?auto_273112 ?auto_273118 ) ) ( not ( = ?auto_273112 ?auto_273119 ) ) ( not ( = ?auto_273112 ?auto_273120 ) ) ( not ( = ?auto_273113 ?auto_273114 ) ) ( not ( = ?auto_273113 ?auto_273115 ) ) ( not ( = ?auto_273113 ?auto_273116 ) ) ( not ( = ?auto_273113 ?auto_273117 ) ) ( not ( = ?auto_273113 ?auto_273118 ) ) ( not ( = ?auto_273113 ?auto_273119 ) ) ( not ( = ?auto_273113 ?auto_273120 ) ) ( not ( = ?auto_273114 ?auto_273115 ) ) ( not ( = ?auto_273114 ?auto_273116 ) ) ( not ( = ?auto_273114 ?auto_273117 ) ) ( not ( = ?auto_273114 ?auto_273118 ) ) ( not ( = ?auto_273114 ?auto_273119 ) ) ( not ( = ?auto_273114 ?auto_273120 ) ) ( not ( = ?auto_273115 ?auto_273116 ) ) ( not ( = ?auto_273115 ?auto_273117 ) ) ( not ( = ?auto_273115 ?auto_273118 ) ) ( not ( = ?auto_273115 ?auto_273119 ) ) ( not ( = ?auto_273115 ?auto_273120 ) ) ( not ( = ?auto_273116 ?auto_273117 ) ) ( not ( = ?auto_273116 ?auto_273118 ) ) ( not ( = ?auto_273116 ?auto_273119 ) ) ( not ( = ?auto_273116 ?auto_273120 ) ) ( not ( = ?auto_273117 ?auto_273118 ) ) ( not ( = ?auto_273117 ?auto_273119 ) ) ( not ( = ?auto_273117 ?auto_273120 ) ) ( not ( = ?auto_273118 ?auto_273119 ) ) ( not ( = ?auto_273118 ?auto_273120 ) ) ( not ( = ?auto_273119 ?auto_273120 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_273119 ?auto_273120 )
      ( !STACK ?auto_273119 ?auto_273118 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_273132 - BLOCK
      ?auto_273133 - BLOCK
      ?auto_273134 - BLOCK
      ?auto_273135 - BLOCK
      ?auto_273136 - BLOCK
      ?auto_273137 - BLOCK
      ?auto_273138 - BLOCK
      ?auto_273139 - BLOCK
      ?auto_273140 - BLOCK
      ?auto_273141 - BLOCK
      ?auto_273142 - BLOCK
    )
    :vars
    (
      ?auto_273143 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_273141 ) ( ON ?auto_273142 ?auto_273143 ) ( CLEAR ?auto_273142 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_273132 ) ( ON ?auto_273133 ?auto_273132 ) ( ON ?auto_273134 ?auto_273133 ) ( ON ?auto_273135 ?auto_273134 ) ( ON ?auto_273136 ?auto_273135 ) ( ON ?auto_273137 ?auto_273136 ) ( ON ?auto_273138 ?auto_273137 ) ( ON ?auto_273139 ?auto_273138 ) ( ON ?auto_273140 ?auto_273139 ) ( ON ?auto_273141 ?auto_273140 ) ( not ( = ?auto_273132 ?auto_273133 ) ) ( not ( = ?auto_273132 ?auto_273134 ) ) ( not ( = ?auto_273132 ?auto_273135 ) ) ( not ( = ?auto_273132 ?auto_273136 ) ) ( not ( = ?auto_273132 ?auto_273137 ) ) ( not ( = ?auto_273132 ?auto_273138 ) ) ( not ( = ?auto_273132 ?auto_273139 ) ) ( not ( = ?auto_273132 ?auto_273140 ) ) ( not ( = ?auto_273132 ?auto_273141 ) ) ( not ( = ?auto_273132 ?auto_273142 ) ) ( not ( = ?auto_273132 ?auto_273143 ) ) ( not ( = ?auto_273133 ?auto_273134 ) ) ( not ( = ?auto_273133 ?auto_273135 ) ) ( not ( = ?auto_273133 ?auto_273136 ) ) ( not ( = ?auto_273133 ?auto_273137 ) ) ( not ( = ?auto_273133 ?auto_273138 ) ) ( not ( = ?auto_273133 ?auto_273139 ) ) ( not ( = ?auto_273133 ?auto_273140 ) ) ( not ( = ?auto_273133 ?auto_273141 ) ) ( not ( = ?auto_273133 ?auto_273142 ) ) ( not ( = ?auto_273133 ?auto_273143 ) ) ( not ( = ?auto_273134 ?auto_273135 ) ) ( not ( = ?auto_273134 ?auto_273136 ) ) ( not ( = ?auto_273134 ?auto_273137 ) ) ( not ( = ?auto_273134 ?auto_273138 ) ) ( not ( = ?auto_273134 ?auto_273139 ) ) ( not ( = ?auto_273134 ?auto_273140 ) ) ( not ( = ?auto_273134 ?auto_273141 ) ) ( not ( = ?auto_273134 ?auto_273142 ) ) ( not ( = ?auto_273134 ?auto_273143 ) ) ( not ( = ?auto_273135 ?auto_273136 ) ) ( not ( = ?auto_273135 ?auto_273137 ) ) ( not ( = ?auto_273135 ?auto_273138 ) ) ( not ( = ?auto_273135 ?auto_273139 ) ) ( not ( = ?auto_273135 ?auto_273140 ) ) ( not ( = ?auto_273135 ?auto_273141 ) ) ( not ( = ?auto_273135 ?auto_273142 ) ) ( not ( = ?auto_273135 ?auto_273143 ) ) ( not ( = ?auto_273136 ?auto_273137 ) ) ( not ( = ?auto_273136 ?auto_273138 ) ) ( not ( = ?auto_273136 ?auto_273139 ) ) ( not ( = ?auto_273136 ?auto_273140 ) ) ( not ( = ?auto_273136 ?auto_273141 ) ) ( not ( = ?auto_273136 ?auto_273142 ) ) ( not ( = ?auto_273136 ?auto_273143 ) ) ( not ( = ?auto_273137 ?auto_273138 ) ) ( not ( = ?auto_273137 ?auto_273139 ) ) ( not ( = ?auto_273137 ?auto_273140 ) ) ( not ( = ?auto_273137 ?auto_273141 ) ) ( not ( = ?auto_273137 ?auto_273142 ) ) ( not ( = ?auto_273137 ?auto_273143 ) ) ( not ( = ?auto_273138 ?auto_273139 ) ) ( not ( = ?auto_273138 ?auto_273140 ) ) ( not ( = ?auto_273138 ?auto_273141 ) ) ( not ( = ?auto_273138 ?auto_273142 ) ) ( not ( = ?auto_273138 ?auto_273143 ) ) ( not ( = ?auto_273139 ?auto_273140 ) ) ( not ( = ?auto_273139 ?auto_273141 ) ) ( not ( = ?auto_273139 ?auto_273142 ) ) ( not ( = ?auto_273139 ?auto_273143 ) ) ( not ( = ?auto_273140 ?auto_273141 ) ) ( not ( = ?auto_273140 ?auto_273142 ) ) ( not ( = ?auto_273140 ?auto_273143 ) ) ( not ( = ?auto_273141 ?auto_273142 ) ) ( not ( = ?auto_273141 ?auto_273143 ) ) ( not ( = ?auto_273142 ?auto_273143 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_273142 ?auto_273143 )
      ( !STACK ?auto_273142 ?auto_273141 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_273155 - BLOCK
      ?auto_273156 - BLOCK
      ?auto_273157 - BLOCK
      ?auto_273158 - BLOCK
      ?auto_273159 - BLOCK
      ?auto_273160 - BLOCK
      ?auto_273161 - BLOCK
      ?auto_273162 - BLOCK
      ?auto_273163 - BLOCK
      ?auto_273164 - BLOCK
      ?auto_273165 - BLOCK
    )
    :vars
    (
      ?auto_273166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273165 ?auto_273166 ) ( ON-TABLE ?auto_273155 ) ( ON ?auto_273156 ?auto_273155 ) ( ON ?auto_273157 ?auto_273156 ) ( ON ?auto_273158 ?auto_273157 ) ( ON ?auto_273159 ?auto_273158 ) ( ON ?auto_273160 ?auto_273159 ) ( ON ?auto_273161 ?auto_273160 ) ( ON ?auto_273162 ?auto_273161 ) ( ON ?auto_273163 ?auto_273162 ) ( not ( = ?auto_273155 ?auto_273156 ) ) ( not ( = ?auto_273155 ?auto_273157 ) ) ( not ( = ?auto_273155 ?auto_273158 ) ) ( not ( = ?auto_273155 ?auto_273159 ) ) ( not ( = ?auto_273155 ?auto_273160 ) ) ( not ( = ?auto_273155 ?auto_273161 ) ) ( not ( = ?auto_273155 ?auto_273162 ) ) ( not ( = ?auto_273155 ?auto_273163 ) ) ( not ( = ?auto_273155 ?auto_273164 ) ) ( not ( = ?auto_273155 ?auto_273165 ) ) ( not ( = ?auto_273155 ?auto_273166 ) ) ( not ( = ?auto_273156 ?auto_273157 ) ) ( not ( = ?auto_273156 ?auto_273158 ) ) ( not ( = ?auto_273156 ?auto_273159 ) ) ( not ( = ?auto_273156 ?auto_273160 ) ) ( not ( = ?auto_273156 ?auto_273161 ) ) ( not ( = ?auto_273156 ?auto_273162 ) ) ( not ( = ?auto_273156 ?auto_273163 ) ) ( not ( = ?auto_273156 ?auto_273164 ) ) ( not ( = ?auto_273156 ?auto_273165 ) ) ( not ( = ?auto_273156 ?auto_273166 ) ) ( not ( = ?auto_273157 ?auto_273158 ) ) ( not ( = ?auto_273157 ?auto_273159 ) ) ( not ( = ?auto_273157 ?auto_273160 ) ) ( not ( = ?auto_273157 ?auto_273161 ) ) ( not ( = ?auto_273157 ?auto_273162 ) ) ( not ( = ?auto_273157 ?auto_273163 ) ) ( not ( = ?auto_273157 ?auto_273164 ) ) ( not ( = ?auto_273157 ?auto_273165 ) ) ( not ( = ?auto_273157 ?auto_273166 ) ) ( not ( = ?auto_273158 ?auto_273159 ) ) ( not ( = ?auto_273158 ?auto_273160 ) ) ( not ( = ?auto_273158 ?auto_273161 ) ) ( not ( = ?auto_273158 ?auto_273162 ) ) ( not ( = ?auto_273158 ?auto_273163 ) ) ( not ( = ?auto_273158 ?auto_273164 ) ) ( not ( = ?auto_273158 ?auto_273165 ) ) ( not ( = ?auto_273158 ?auto_273166 ) ) ( not ( = ?auto_273159 ?auto_273160 ) ) ( not ( = ?auto_273159 ?auto_273161 ) ) ( not ( = ?auto_273159 ?auto_273162 ) ) ( not ( = ?auto_273159 ?auto_273163 ) ) ( not ( = ?auto_273159 ?auto_273164 ) ) ( not ( = ?auto_273159 ?auto_273165 ) ) ( not ( = ?auto_273159 ?auto_273166 ) ) ( not ( = ?auto_273160 ?auto_273161 ) ) ( not ( = ?auto_273160 ?auto_273162 ) ) ( not ( = ?auto_273160 ?auto_273163 ) ) ( not ( = ?auto_273160 ?auto_273164 ) ) ( not ( = ?auto_273160 ?auto_273165 ) ) ( not ( = ?auto_273160 ?auto_273166 ) ) ( not ( = ?auto_273161 ?auto_273162 ) ) ( not ( = ?auto_273161 ?auto_273163 ) ) ( not ( = ?auto_273161 ?auto_273164 ) ) ( not ( = ?auto_273161 ?auto_273165 ) ) ( not ( = ?auto_273161 ?auto_273166 ) ) ( not ( = ?auto_273162 ?auto_273163 ) ) ( not ( = ?auto_273162 ?auto_273164 ) ) ( not ( = ?auto_273162 ?auto_273165 ) ) ( not ( = ?auto_273162 ?auto_273166 ) ) ( not ( = ?auto_273163 ?auto_273164 ) ) ( not ( = ?auto_273163 ?auto_273165 ) ) ( not ( = ?auto_273163 ?auto_273166 ) ) ( not ( = ?auto_273164 ?auto_273165 ) ) ( not ( = ?auto_273164 ?auto_273166 ) ) ( not ( = ?auto_273165 ?auto_273166 ) ) ( CLEAR ?auto_273163 ) ( ON ?auto_273164 ?auto_273165 ) ( CLEAR ?auto_273164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_273155 ?auto_273156 ?auto_273157 ?auto_273158 ?auto_273159 ?auto_273160 ?auto_273161 ?auto_273162 ?auto_273163 ?auto_273164 )
      ( MAKE-11PILE ?auto_273155 ?auto_273156 ?auto_273157 ?auto_273158 ?auto_273159 ?auto_273160 ?auto_273161 ?auto_273162 ?auto_273163 ?auto_273164 ?auto_273165 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_273178 - BLOCK
      ?auto_273179 - BLOCK
      ?auto_273180 - BLOCK
      ?auto_273181 - BLOCK
      ?auto_273182 - BLOCK
      ?auto_273183 - BLOCK
      ?auto_273184 - BLOCK
      ?auto_273185 - BLOCK
      ?auto_273186 - BLOCK
      ?auto_273187 - BLOCK
      ?auto_273188 - BLOCK
    )
    :vars
    (
      ?auto_273189 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273188 ?auto_273189 ) ( ON-TABLE ?auto_273178 ) ( ON ?auto_273179 ?auto_273178 ) ( ON ?auto_273180 ?auto_273179 ) ( ON ?auto_273181 ?auto_273180 ) ( ON ?auto_273182 ?auto_273181 ) ( ON ?auto_273183 ?auto_273182 ) ( ON ?auto_273184 ?auto_273183 ) ( ON ?auto_273185 ?auto_273184 ) ( ON ?auto_273186 ?auto_273185 ) ( not ( = ?auto_273178 ?auto_273179 ) ) ( not ( = ?auto_273178 ?auto_273180 ) ) ( not ( = ?auto_273178 ?auto_273181 ) ) ( not ( = ?auto_273178 ?auto_273182 ) ) ( not ( = ?auto_273178 ?auto_273183 ) ) ( not ( = ?auto_273178 ?auto_273184 ) ) ( not ( = ?auto_273178 ?auto_273185 ) ) ( not ( = ?auto_273178 ?auto_273186 ) ) ( not ( = ?auto_273178 ?auto_273187 ) ) ( not ( = ?auto_273178 ?auto_273188 ) ) ( not ( = ?auto_273178 ?auto_273189 ) ) ( not ( = ?auto_273179 ?auto_273180 ) ) ( not ( = ?auto_273179 ?auto_273181 ) ) ( not ( = ?auto_273179 ?auto_273182 ) ) ( not ( = ?auto_273179 ?auto_273183 ) ) ( not ( = ?auto_273179 ?auto_273184 ) ) ( not ( = ?auto_273179 ?auto_273185 ) ) ( not ( = ?auto_273179 ?auto_273186 ) ) ( not ( = ?auto_273179 ?auto_273187 ) ) ( not ( = ?auto_273179 ?auto_273188 ) ) ( not ( = ?auto_273179 ?auto_273189 ) ) ( not ( = ?auto_273180 ?auto_273181 ) ) ( not ( = ?auto_273180 ?auto_273182 ) ) ( not ( = ?auto_273180 ?auto_273183 ) ) ( not ( = ?auto_273180 ?auto_273184 ) ) ( not ( = ?auto_273180 ?auto_273185 ) ) ( not ( = ?auto_273180 ?auto_273186 ) ) ( not ( = ?auto_273180 ?auto_273187 ) ) ( not ( = ?auto_273180 ?auto_273188 ) ) ( not ( = ?auto_273180 ?auto_273189 ) ) ( not ( = ?auto_273181 ?auto_273182 ) ) ( not ( = ?auto_273181 ?auto_273183 ) ) ( not ( = ?auto_273181 ?auto_273184 ) ) ( not ( = ?auto_273181 ?auto_273185 ) ) ( not ( = ?auto_273181 ?auto_273186 ) ) ( not ( = ?auto_273181 ?auto_273187 ) ) ( not ( = ?auto_273181 ?auto_273188 ) ) ( not ( = ?auto_273181 ?auto_273189 ) ) ( not ( = ?auto_273182 ?auto_273183 ) ) ( not ( = ?auto_273182 ?auto_273184 ) ) ( not ( = ?auto_273182 ?auto_273185 ) ) ( not ( = ?auto_273182 ?auto_273186 ) ) ( not ( = ?auto_273182 ?auto_273187 ) ) ( not ( = ?auto_273182 ?auto_273188 ) ) ( not ( = ?auto_273182 ?auto_273189 ) ) ( not ( = ?auto_273183 ?auto_273184 ) ) ( not ( = ?auto_273183 ?auto_273185 ) ) ( not ( = ?auto_273183 ?auto_273186 ) ) ( not ( = ?auto_273183 ?auto_273187 ) ) ( not ( = ?auto_273183 ?auto_273188 ) ) ( not ( = ?auto_273183 ?auto_273189 ) ) ( not ( = ?auto_273184 ?auto_273185 ) ) ( not ( = ?auto_273184 ?auto_273186 ) ) ( not ( = ?auto_273184 ?auto_273187 ) ) ( not ( = ?auto_273184 ?auto_273188 ) ) ( not ( = ?auto_273184 ?auto_273189 ) ) ( not ( = ?auto_273185 ?auto_273186 ) ) ( not ( = ?auto_273185 ?auto_273187 ) ) ( not ( = ?auto_273185 ?auto_273188 ) ) ( not ( = ?auto_273185 ?auto_273189 ) ) ( not ( = ?auto_273186 ?auto_273187 ) ) ( not ( = ?auto_273186 ?auto_273188 ) ) ( not ( = ?auto_273186 ?auto_273189 ) ) ( not ( = ?auto_273187 ?auto_273188 ) ) ( not ( = ?auto_273187 ?auto_273189 ) ) ( not ( = ?auto_273188 ?auto_273189 ) ) ( CLEAR ?auto_273186 ) ( ON ?auto_273187 ?auto_273188 ) ( CLEAR ?auto_273187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_273178 ?auto_273179 ?auto_273180 ?auto_273181 ?auto_273182 ?auto_273183 ?auto_273184 ?auto_273185 ?auto_273186 ?auto_273187 )
      ( MAKE-11PILE ?auto_273178 ?auto_273179 ?auto_273180 ?auto_273181 ?auto_273182 ?auto_273183 ?auto_273184 ?auto_273185 ?auto_273186 ?auto_273187 ?auto_273188 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_273201 - BLOCK
      ?auto_273202 - BLOCK
      ?auto_273203 - BLOCK
      ?auto_273204 - BLOCK
      ?auto_273205 - BLOCK
      ?auto_273206 - BLOCK
      ?auto_273207 - BLOCK
      ?auto_273208 - BLOCK
      ?auto_273209 - BLOCK
      ?auto_273210 - BLOCK
      ?auto_273211 - BLOCK
    )
    :vars
    (
      ?auto_273212 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273211 ?auto_273212 ) ( ON-TABLE ?auto_273201 ) ( ON ?auto_273202 ?auto_273201 ) ( ON ?auto_273203 ?auto_273202 ) ( ON ?auto_273204 ?auto_273203 ) ( ON ?auto_273205 ?auto_273204 ) ( ON ?auto_273206 ?auto_273205 ) ( ON ?auto_273207 ?auto_273206 ) ( ON ?auto_273208 ?auto_273207 ) ( not ( = ?auto_273201 ?auto_273202 ) ) ( not ( = ?auto_273201 ?auto_273203 ) ) ( not ( = ?auto_273201 ?auto_273204 ) ) ( not ( = ?auto_273201 ?auto_273205 ) ) ( not ( = ?auto_273201 ?auto_273206 ) ) ( not ( = ?auto_273201 ?auto_273207 ) ) ( not ( = ?auto_273201 ?auto_273208 ) ) ( not ( = ?auto_273201 ?auto_273209 ) ) ( not ( = ?auto_273201 ?auto_273210 ) ) ( not ( = ?auto_273201 ?auto_273211 ) ) ( not ( = ?auto_273201 ?auto_273212 ) ) ( not ( = ?auto_273202 ?auto_273203 ) ) ( not ( = ?auto_273202 ?auto_273204 ) ) ( not ( = ?auto_273202 ?auto_273205 ) ) ( not ( = ?auto_273202 ?auto_273206 ) ) ( not ( = ?auto_273202 ?auto_273207 ) ) ( not ( = ?auto_273202 ?auto_273208 ) ) ( not ( = ?auto_273202 ?auto_273209 ) ) ( not ( = ?auto_273202 ?auto_273210 ) ) ( not ( = ?auto_273202 ?auto_273211 ) ) ( not ( = ?auto_273202 ?auto_273212 ) ) ( not ( = ?auto_273203 ?auto_273204 ) ) ( not ( = ?auto_273203 ?auto_273205 ) ) ( not ( = ?auto_273203 ?auto_273206 ) ) ( not ( = ?auto_273203 ?auto_273207 ) ) ( not ( = ?auto_273203 ?auto_273208 ) ) ( not ( = ?auto_273203 ?auto_273209 ) ) ( not ( = ?auto_273203 ?auto_273210 ) ) ( not ( = ?auto_273203 ?auto_273211 ) ) ( not ( = ?auto_273203 ?auto_273212 ) ) ( not ( = ?auto_273204 ?auto_273205 ) ) ( not ( = ?auto_273204 ?auto_273206 ) ) ( not ( = ?auto_273204 ?auto_273207 ) ) ( not ( = ?auto_273204 ?auto_273208 ) ) ( not ( = ?auto_273204 ?auto_273209 ) ) ( not ( = ?auto_273204 ?auto_273210 ) ) ( not ( = ?auto_273204 ?auto_273211 ) ) ( not ( = ?auto_273204 ?auto_273212 ) ) ( not ( = ?auto_273205 ?auto_273206 ) ) ( not ( = ?auto_273205 ?auto_273207 ) ) ( not ( = ?auto_273205 ?auto_273208 ) ) ( not ( = ?auto_273205 ?auto_273209 ) ) ( not ( = ?auto_273205 ?auto_273210 ) ) ( not ( = ?auto_273205 ?auto_273211 ) ) ( not ( = ?auto_273205 ?auto_273212 ) ) ( not ( = ?auto_273206 ?auto_273207 ) ) ( not ( = ?auto_273206 ?auto_273208 ) ) ( not ( = ?auto_273206 ?auto_273209 ) ) ( not ( = ?auto_273206 ?auto_273210 ) ) ( not ( = ?auto_273206 ?auto_273211 ) ) ( not ( = ?auto_273206 ?auto_273212 ) ) ( not ( = ?auto_273207 ?auto_273208 ) ) ( not ( = ?auto_273207 ?auto_273209 ) ) ( not ( = ?auto_273207 ?auto_273210 ) ) ( not ( = ?auto_273207 ?auto_273211 ) ) ( not ( = ?auto_273207 ?auto_273212 ) ) ( not ( = ?auto_273208 ?auto_273209 ) ) ( not ( = ?auto_273208 ?auto_273210 ) ) ( not ( = ?auto_273208 ?auto_273211 ) ) ( not ( = ?auto_273208 ?auto_273212 ) ) ( not ( = ?auto_273209 ?auto_273210 ) ) ( not ( = ?auto_273209 ?auto_273211 ) ) ( not ( = ?auto_273209 ?auto_273212 ) ) ( not ( = ?auto_273210 ?auto_273211 ) ) ( not ( = ?auto_273210 ?auto_273212 ) ) ( not ( = ?auto_273211 ?auto_273212 ) ) ( ON ?auto_273210 ?auto_273211 ) ( CLEAR ?auto_273208 ) ( ON ?auto_273209 ?auto_273210 ) ( CLEAR ?auto_273209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_273201 ?auto_273202 ?auto_273203 ?auto_273204 ?auto_273205 ?auto_273206 ?auto_273207 ?auto_273208 ?auto_273209 )
      ( MAKE-11PILE ?auto_273201 ?auto_273202 ?auto_273203 ?auto_273204 ?auto_273205 ?auto_273206 ?auto_273207 ?auto_273208 ?auto_273209 ?auto_273210 ?auto_273211 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_273224 - BLOCK
      ?auto_273225 - BLOCK
      ?auto_273226 - BLOCK
      ?auto_273227 - BLOCK
      ?auto_273228 - BLOCK
      ?auto_273229 - BLOCK
      ?auto_273230 - BLOCK
      ?auto_273231 - BLOCK
      ?auto_273232 - BLOCK
      ?auto_273233 - BLOCK
      ?auto_273234 - BLOCK
    )
    :vars
    (
      ?auto_273235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273234 ?auto_273235 ) ( ON-TABLE ?auto_273224 ) ( ON ?auto_273225 ?auto_273224 ) ( ON ?auto_273226 ?auto_273225 ) ( ON ?auto_273227 ?auto_273226 ) ( ON ?auto_273228 ?auto_273227 ) ( ON ?auto_273229 ?auto_273228 ) ( ON ?auto_273230 ?auto_273229 ) ( ON ?auto_273231 ?auto_273230 ) ( not ( = ?auto_273224 ?auto_273225 ) ) ( not ( = ?auto_273224 ?auto_273226 ) ) ( not ( = ?auto_273224 ?auto_273227 ) ) ( not ( = ?auto_273224 ?auto_273228 ) ) ( not ( = ?auto_273224 ?auto_273229 ) ) ( not ( = ?auto_273224 ?auto_273230 ) ) ( not ( = ?auto_273224 ?auto_273231 ) ) ( not ( = ?auto_273224 ?auto_273232 ) ) ( not ( = ?auto_273224 ?auto_273233 ) ) ( not ( = ?auto_273224 ?auto_273234 ) ) ( not ( = ?auto_273224 ?auto_273235 ) ) ( not ( = ?auto_273225 ?auto_273226 ) ) ( not ( = ?auto_273225 ?auto_273227 ) ) ( not ( = ?auto_273225 ?auto_273228 ) ) ( not ( = ?auto_273225 ?auto_273229 ) ) ( not ( = ?auto_273225 ?auto_273230 ) ) ( not ( = ?auto_273225 ?auto_273231 ) ) ( not ( = ?auto_273225 ?auto_273232 ) ) ( not ( = ?auto_273225 ?auto_273233 ) ) ( not ( = ?auto_273225 ?auto_273234 ) ) ( not ( = ?auto_273225 ?auto_273235 ) ) ( not ( = ?auto_273226 ?auto_273227 ) ) ( not ( = ?auto_273226 ?auto_273228 ) ) ( not ( = ?auto_273226 ?auto_273229 ) ) ( not ( = ?auto_273226 ?auto_273230 ) ) ( not ( = ?auto_273226 ?auto_273231 ) ) ( not ( = ?auto_273226 ?auto_273232 ) ) ( not ( = ?auto_273226 ?auto_273233 ) ) ( not ( = ?auto_273226 ?auto_273234 ) ) ( not ( = ?auto_273226 ?auto_273235 ) ) ( not ( = ?auto_273227 ?auto_273228 ) ) ( not ( = ?auto_273227 ?auto_273229 ) ) ( not ( = ?auto_273227 ?auto_273230 ) ) ( not ( = ?auto_273227 ?auto_273231 ) ) ( not ( = ?auto_273227 ?auto_273232 ) ) ( not ( = ?auto_273227 ?auto_273233 ) ) ( not ( = ?auto_273227 ?auto_273234 ) ) ( not ( = ?auto_273227 ?auto_273235 ) ) ( not ( = ?auto_273228 ?auto_273229 ) ) ( not ( = ?auto_273228 ?auto_273230 ) ) ( not ( = ?auto_273228 ?auto_273231 ) ) ( not ( = ?auto_273228 ?auto_273232 ) ) ( not ( = ?auto_273228 ?auto_273233 ) ) ( not ( = ?auto_273228 ?auto_273234 ) ) ( not ( = ?auto_273228 ?auto_273235 ) ) ( not ( = ?auto_273229 ?auto_273230 ) ) ( not ( = ?auto_273229 ?auto_273231 ) ) ( not ( = ?auto_273229 ?auto_273232 ) ) ( not ( = ?auto_273229 ?auto_273233 ) ) ( not ( = ?auto_273229 ?auto_273234 ) ) ( not ( = ?auto_273229 ?auto_273235 ) ) ( not ( = ?auto_273230 ?auto_273231 ) ) ( not ( = ?auto_273230 ?auto_273232 ) ) ( not ( = ?auto_273230 ?auto_273233 ) ) ( not ( = ?auto_273230 ?auto_273234 ) ) ( not ( = ?auto_273230 ?auto_273235 ) ) ( not ( = ?auto_273231 ?auto_273232 ) ) ( not ( = ?auto_273231 ?auto_273233 ) ) ( not ( = ?auto_273231 ?auto_273234 ) ) ( not ( = ?auto_273231 ?auto_273235 ) ) ( not ( = ?auto_273232 ?auto_273233 ) ) ( not ( = ?auto_273232 ?auto_273234 ) ) ( not ( = ?auto_273232 ?auto_273235 ) ) ( not ( = ?auto_273233 ?auto_273234 ) ) ( not ( = ?auto_273233 ?auto_273235 ) ) ( not ( = ?auto_273234 ?auto_273235 ) ) ( ON ?auto_273233 ?auto_273234 ) ( CLEAR ?auto_273231 ) ( ON ?auto_273232 ?auto_273233 ) ( CLEAR ?auto_273232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_273224 ?auto_273225 ?auto_273226 ?auto_273227 ?auto_273228 ?auto_273229 ?auto_273230 ?auto_273231 ?auto_273232 )
      ( MAKE-11PILE ?auto_273224 ?auto_273225 ?auto_273226 ?auto_273227 ?auto_273228 ?auto_273229 ?auto_273230 ?auto_273231 ?auto_273232 ?auto_273233 ?auto_273234 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_273247 - BLOCK
      ?auto_273248 - BLOCK
      ?auto_273249 - BLOCK
      ?auto_273250 - BLOCK
      ?auto_273251 - BLOCK
      ?auto_273252 - BLOCK
      ?auto_273253 - BLOCK
      ?auto_273254 - BLOCK
      ?auto_273255 - BLOCK
      ?auto_273256 - BLOCK
      ?auto_273257 - BLOCK
    )
    :vars
    (
      ?auto_273258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273257 ?auto_273258 ) ( ON-TABLE ?auto_273247 ) ( ON ?auto_273248 ?auto_273247 ) ( ON ?auto_273249 ?auto_273248 ) ( ON ?auto_273250 ?auto_273249 ) ( ON ?auto_273251 ?auto_273250 ) ( ON ?auto_273252 ?auto_273251 ) ( ON ?auto_273253 ?auto_273252 ) ( not ( = ?auto_273247 ?auto_273248 ) ) ( not ( = ?auto_273247 ?auto_273249 ) ) ( not ( = ?auto_273247 ?auto_273250 ) ) ( not ( = ?auto_273247 ?auto_273251 ) ) ( not ( = ?auto_273247 ?auto_273252 ) ) ( not ( = ?auto_273247 ?auto_273253 ) ) ( not ( = ?auto_273247 ?auto_273254 ) ) ( not ( = ?auto_273247 ?auto_273255 ) ) ( not ( = ?auto_273247 ?auto_273256 ) ) ( not ( = ?auto_273247 ?auto_273257 ) ) ( not ( = ?auto_273247 ?auto_273258 ) ) ( not ( = ?auto_273248 ?auto_273249 ) ) ( not ( = ?auto_273248 ?auto_273250 ) ) ( not ( = ?auto_273248 ?auto_273251 ) ) ( not ( = ?auto_273248 ?auto_273252 ) ) ( not ( = ?auto_273248 ?auto_273253 ) ) ( not ( = ?auto_273248 ?auto_273254 ) ) ( not ( = ?auto_273248 ?auto_273255 ) ) ( not ( = ?auto_273248 ?auto_273256 ) ) ( not ( = ?auto_273248 ?auto_273257 ) ) ( not ( = ?auto_273248 ?auto_273258 ) ) ( not ( = ?auto_273249 ?auto_273250 ) ) ( not ( = ?auto_273249 ?auto_273251 ) ) ( not ( = ?auto_273249 ?auto_273252 ) ) ( not ( = ?auto_273249 ?auto_273253 ) ) ( not ( = ?auto_273249 ?auto_273254 ) ) ( not ( = ?auto_273249 ?auto_273255 ) ) ( not ( = ?auto_273249 ?auto_273256 ) ) ( not ( = ?auto_273249 ?auto_273257 ) ) ( not ( = ?auto_273249 ?auto_273258 ) ) ( not ( = ?auto_273250 ?auto_273251 ) ) ( not ( = ?auto_273250 ?auto_273252 ) ) ( not ( = ?auto_273250 ?auto_273253 ) ) ( not ( = ?auto_273250 ?auto_273254 ) ) ( not ( = ?auto_273250 ?auto_273255 ) ) ( not ( = ?auto_273250 ?auto_273256 ) ) ( not ( = ?auto_273250 ?auto_273257 ) ) ( not ( = ?auto_273250 ?auto_273258 ) ) ( not ( = ?auto_273251 ?auto_273252 ) ) ( not ( = ?auto_273251 ?auto_273253 ) ) ( not ( = ?auto_273251 ?auto_273254 ) ) ( not ( = ?auto_273251 ?auto_273255 ) ) ( not ( = ?auto_273251 ?auto_273256 ) ) ( not ( = ?auto_273251 ?auto_273257 ) ) ( not ( = ?auto_273251 ?auto_273258 ) ) ( not ( = ?auto_273252 ?auto_273253 ) ) ( not ( = ?auto_273252 ?auto_273254 ) ) ( not ( = ?auto_273252 ?auto_273255 ) ) ( not ( = ?auto_273252 ?auto_273256 ) ) ( not ( = ?auto_273252 ?auto_273257 ) ) ( not ( = ?auto_273252 ?auto_273258 ) ) ( not ( = ?auto_273253 ?auto_273254 ) ) ( not ( = ?auto_273253 ?auto_273255 ) ) ( not ( = ?auto_273253 ?auto_273256 ) ) ( not ( = ?auto_273253 ?auto_273257 ) ) ( not ( = ?auto_273253 ?auto_273258 ) ) ( not ( = ?auto_273254 ?auto_273255 ) ) ( not ( = ?auto_273254 ?auto_273256 ) ) ( not ( = ?auto_273254 ?auto_273257 ) ) ( not ( = ?auto_273254 ?auto_273258 ) ) ( not ( = ?auto_273255 ?auto_273256 ) ) ( not ( = ?auto_273255 ?auto_273257 ) ) ( not ( = ?auto_273255 ?auto_273258 ) ) ( not ( = ?auto_273256 ?auto_273257 ) ) ( not ( = ?auto_273256 ?auto_273258 ) ) ( not ( = ?auto_273257 ?auto_273258 ) ) ( ON ?auto_273256 ?auto_273257 ) ( ON ?auto_273255 ?auto_273256 ) ( CLEAR ?auto_273253 ) ( ON ?auto_273254 ?auto_273255 ) ( CLEAR ?auto_273254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_273247 ?auto_273248 ?auto_273249 ?auto_273250 ?auto_273251 ?auto_273252 ?auto_273253 ?auto_273254 )
      ( MAKE-11PILE ?auto_273247 ?auto_273248 ?auto_273249 ?auto_273250 ?auto_273251 ?auto_273252 ?auto_273253 ?auto_273254 ?auto_273255 ?auto_273256 ?auto_273257 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_273270 - BLOCK
      ?auto_273271 - BLOCK
      ?auto_273272 - BLOCK
      ?auto_273273 - BLOCK
      ?auto_273274 - BLOCK
      ?auto_273275 - BLOCK
      ?auto_273276 - BLOCK
      ?auto_273277 - BLOCK
      ?auto_273278 - BLOCK
      ?auto_273279 - BLOCK
      ?auto_273280 - BLOCK
    )
    :vars
    (
      ?auto_273281 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273280 ?auto_273281 ) ( ON-TABLE ?auto_273270 ) ( ON ?auto_273271 ?auto_273270 ) ( ON ?auto_273272 ?auto_273271 ) ( ON ?auto_273273 ?auto_273272 ) ( ON ?auto_273274 ?auto_273273 ) ( ON ?auto_273275 ?auto_273274 ) ( ON ?auto_273276 ?auto_273275 ) ( not ( = ?auto_273270 ?auto_273271 ) ) ( not ( = ?auto_273270 ?auto_273272 ) ) ( not ( = ?auto_273270 ?auto_273273 ) ) ( not ( = ?auto_273270 ?auto_273274 ) ) ( not ( = ?auto_273270 ?auto_273275 ) ) ( not ( = ?auto_273270 ?auto_273276 ) ) ( not ( = ?auto_273270 ?auto_273277 ) ) ( not ( = ?auto_273270 ?auto_273278 ) ) ( not ( = ?auto_273270 ?auto_273279 ) ) ( not ( = ?auto_273270 ?auto_273280 ) ) ( not ( = ?auto_273270 ?auto_273281 ) ) ( not ( = ?auto_273271 ?auto_273272 ) ) ( not ( = ?auto_273271 ?auto_273273 ) ) ( not ( = ?auto_273271 ?auto_273274 ) ) ( not ( = ?auto_273271 ?auto_273275 ) ) ( not ( = ?auto_273271 ?auto_273276 ) ) ( not ( = ?auto_273271 ?auto_273277 ) ) ( not ( = ?auto_273271 ?auto_273278 ) ) ( not ( = ?auto_273271 ?auto_273279 ) ) ( not ( = ?auto_273271 ?auto_273280 ) ) ( not ( = ?auto_273271 ?auto_273281 ) ) ( not ( = ?auto_273272 ?auto_273273 ) ) ( not ( = ?auto_273272 ?auto_273274 ) ) ( not ( = ?auto_273272 ?auto_273275 ) ) ( not ( = ?auto_273272 ?auto_273276 ) ) ( not ( = ?auto_273272 ?auto_273277 ) ) ( not ( = ?auto_273272 ?auto_273278 ) ) ( not ( = ?auto_273272 ?auto_273279 ) ) ( not ( = ?auto_273272 ?auto_273280 ) ) ( not ( = ?auto_273272 ?auto_273281 ) ) ( not ( = ?auto_273273 ?auto_273274 ) ) ( not ( = ?auto_273273 ?auto_273275 ) ) ( not ( = ?auto_273273 ?auto_273276 ) ) ( not ( = ?auto_273273 ?auto_273277 ) ) ( not ( = ?auto_273273 ?auto_273278 ) ) ( not ( = ?auto_273273 ?auto_273279 ) ) ( not ( = ?auto_273273 ?auto_273280 ) ) ( not ( = ?auto_273273 ?auto_273281 ) ) ( not ( = ?auto_273274 ?auto_273275 ) ) ( not ( = ?auto_273274 ?auto_273276 ) ) ( not ( = ?auto_273274 ?auto_273277 ) ) ( not ( = ?auto_273274 ?auto_273278 ) ) ( not ( = ?auto_273274 ?auto_273279 ) ) ( not ( = ?auto_273274 ?auto_273280 ) ) ( not ( = ?auto_273274 ?auto_273281 ) ) ( not ( = ?auto_273275 ?auto_273276 ) ) ( not ( = ?auto_273275 ?auto_273277 ) ) ( not ( = ?auto_273275 ?auto_273278 ) ) ( not ( = ?auto_273275 ?auto_273279 ) ) ( not ( = ?auto_273275 ?auto_273280 ) ) ( not ( = ?auto_273275 ?auto_273281 ) ) ( not ( = ?auto_273276 ?auto_273277 ) ) ( not ( = ?auto_273276 ?auto_273278 ) ) ( not ( = ?auto_273276 ?auto_273279 ) ) ( not ( = ?auto_273276 ?auto_273280 ) ) ( not ( = ?auto_273276 ?auto_273281 ) ) ( not ( = ?auto_273277 ?auto_273278 ) ) ( not ( = ?auto_273277 ?auto_273279 ) ) ( not ( = ?auto_273277 ?auto_273280 ) ) ( not ( = ?auto_273277 ?auto_273281 ) ) ( not ( = ?auto_273278 ?auto_273279 ) ) ( not ( = ?auto_273278 ?auto_273280 ) ) ( not ( = ?auto_273278 ?auto_273281 ) ) ( not ( = ?auto_273279 ?auto_273280 ) ) ( not ( = ?auto_273279 ?auto_273281 ) ) ( not ( = ?auto_273280 ?auto_273281 ) ) ( ON ?auto_273279 ?auto_273280 ) ( ON ?auto_273278 ?auto_273279 ) ( CLEAR ?auto_273276 ) ( ON ?auto_273277 ?auto_273278 ) ( CLEAR ?auto_273277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_273270 ?auto_273271 ?auto_273272 ?auto_273273 ?auto_273274 ?auto_273275 ?auto_273276 ?auto_273277 )
      ( MAKE-11PILE ?auto_273270 ?auto_273271 ?auto_273272 ?auto_273273 ?auto_273274 ?auto_273275 ?auto_273276 ?auto_273277 ?auto_273278 ?auto_273279 ?auto_273280 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_273293 - BLOCK
      ?auto_273294 - BLOCK
      ?auto_273295 - BLOCK
      ?auto_273296 - BLOCK
      ?auto_273297 - BLOCK
      ?auto_273298 - BLOCK
      ?auto_273299 - BLOCK
      ?auto_273300 - BLOCK
      ?auto_273301 - BLOCK
      ?auto_273302 - BLOCK
      ?auto_273303 - BLOCK
    )
    :vars
    (
      ?auto_273304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273303 ?auto_273304 ) ( ON-TABLE ?auto_273293 ) ( ON ?auto_273294 ?auto_273293 ) ( ON ?auto_273295 ?auto_273294 ) ( ON ?auto_273296 ?auto_273295 ) ( ON ?auto_273297 ?auto_273296 ) ( ON ?auto_273298 ?auto_273297 ) ( not ( = ?auto_273293 ?auto_273294 ) ) ( not ( = ?auto_273293 ?auto_273295 ) ) ( not ( = ?auto_273293 ?auto_273296 ) ) ( not ( = ?auto_273293 ?auto_273297 ) ) ( not ( = ?auto_273293 ?auto_273298 ) ) ( not ( = ?auto_273293 ?auto_273299 ) ) ( not ( = ?auto_273293 ?auto_273300 ) ) ( not ( = ?auto_273293 ?auto_273301 ) ) ( not ( = ?auto_273293 ?auto_273302 ) ) ( not ( = ?auto_273293 ?auto_273303 ) ) ( not ( = ?auto_273293 ?auto_273304 ) ) ( not ( = ?auto_273294 ?auto_273295 ) ) ( not ( = ?auto_273294 ?auto_273296 ) ) ( not ( = ?auto_273294 ?auto_273297 ) ) ( not ( = ?auto_273294 ?auto_273298 ) ) ( not ( = ?auto_273294 ?auto_273299 ) ) ( not ( = ?auto_273294 ?auto_273300 ) ) ( not ( = ?auto_273294 ?auto_273301 ) ) ( not ( = ?auto_273294 ?auto_273302 ) ) ( not ( = ?auto_273294 ?auto_273303 ) ) ( not ( = ?auto_273294 ?auto_273304 ) ) ( not ( = ?auto_273295 ?auto_273296 ) ) ( not ( = ?auto_273295 ?auto_273297 ) ) ( not ( = ?auto_273295 ?auto_273298 ) ) ( not ( = ?auto_273295 ?auto_273299 ) ) ( not ( = ?auto_273295 ?auto_273300 ) ) ( not ( = ?auto_273295 ?auto_273301 ) ) ( not ( = ?auto_273295 ?auto_273302 ) ) ( not ( = ?auto_273295 ?auto_273303 ) ) ( not ( = ?auto_273295 ?auto_273304 ) ) ( not ( = ?auto_273296 ?auto_273297 ) ) ( not ( = ?auto_273296 ?auto_273298 ) ) ( not ( = ?auto_273296 ?auto_273299 ) ) ( not ( = ?auto_273296 ?auto_273300 ) ) ( not ( = ?auto_273296 ?auto_273301 ) ) ( not ( = ?auto_273296 ?auto_273302 ) ) ( not ( = ?auto_273296 ?auto_273303 ) ) ( not ( = ?auto_273296 ?auto_273304 ) ) ( not ( = ?auto_273297 ?auto_273298 ) ) ( not ( = ?auto_273297 ?auto_273299 ) ) ( not ( = ?auto_273297 ?auto_273300 ) ) ( not ( = ?auto_273297 ?auto_273301 ) ) ( not ( = ?auto_273297 ?auto_273302 ) ) ( not ( = ?auto_273297 ?auto_273303 ) ) ( not ( = ?auto_273297 ?auto_273304 ) ) ( not ( = ?auto_273298 ?auto_273299 ) ) ( not ( = ?auto_273298 ?auto_273300 ) ) ( not ( = ?auto_273298 ?auto_273301 ) ) ( not ( = ?auto_273298 ?auto_273302 ) ) ( not ( = ?auto_273298 ?auto_273303 ) ) ( not ( = ?auto_273298 ?auto_273304 ) ) ( not ( = ?auto_273299 ?auto_273300 ) ) ( not ( = ?auto_273299 ?auto_273301 ) ) ( not ( = ?auto_273299 ?auto_273302 ) ) ( not ( = ?auto_273299 ?auto_273303 ) ) ( not ( = ?auto_273299 ?auto_273304 ) ) ( not ( = ?auto_273300 ?auto_273301 ) ) ( not ( = ?auto_273300 ?auto_273302 ) ) ( not ( = ?auto_273300 ?auto_273303 ) ) ( not ( = ?auto_273300 ?auto_273304 ) ) ( not ( = ?auto_273301 ?auto_273302 ) ) ( not ( = ?auto_273301 ?auto_273303 ) ) ( not ( = ?auto_273301 ?auto_273304 ) ) ( not ( = ?auto_273302 ?auto_273303 ) ) ( not ( = ?auto_273302 ?auto_273304 ) ) ( not ( = ?auto_273303 ?auto_273304 ) ) ( ON ?auto_273302 ?auto_273303 ) ( ON ?auto_273301 ?auto_273302 ) ( ON ?auto_273300 ?auto_273301 ) ( CLEAR ?auto_273298 ) ( ON ?auto_273299 ?auto_273300 ) ( CLEAR ?auto_273299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_273293 ?auto_273294 ?auto_273295 ?auto_273296 ?auto_273297 ?auto_273298 ?auto_273299 )
      ( MAKE-11PILE ?auto_273293 ?auto_273294 ?auto_273295 ?auto_273296 ?auto_273297 ?auto_273298 ?auto_273299 ?auto_273300 ?auto_273301 ?auto_273302 ?auto_273303 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_273316 - BLOCK
      ?auto_273317 - BLOCK
      ?auto_273318 - BLOCK
      ?auto_273319 - BLOCK
      ?auto_273320 - BLOCK
      ?auto_273321 - BLOCK
      ?auto_273322 - BLOCK
      ?auto_273323 - BLOCK
      ?auto_273324 - BLOCK
      ?auto_273325 - BLOCK
      ?auto_273326 - BLOCK
    )
    :vars
    (
      ?auto_273327 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273326 ?auto_273327 ) ( ON-TABLE ?auto_273316 ) ( ON ?auto_273317 ?auto_273316 ) ( ON ?auto_273318 ?auto_273317 ) ( ON ?auto_273319 ?auto_273318 ) ( ON ?auto_273320 ?auto_273319 ) ( ON ?auto_273321 ?auto_273320 ) ( not ( = ?auto_273316 ?auto_273317 ) ) ( not ( = ?auto_273316 ?auto_273318 ) ) ( not ( = ?auto_273316 ?auto_273319 ) ) ( not ( = ?auto_273316 ?auto_273320 ) ) ( not ( = ?auto_273316 ?auto_273321 ) ) ( not ( = ?auto_273316 ?auto_273322 ) ) ( not ( = ?auto_273316 ?auto_273323 ) ) ( not ( = ?auto_273316 ?auto_273324 ) ) ( not ( = ?auto_273316 ?auto_273325 ) ) ( not ( = ?auto_273316 ?auto_273326 ) ) ( not ( = ?auto_273316 ?auto_273327 ) ) ( not ( = ?auto_273317 ?auto_273318 ) ) ( not ( = ?auto_273317 ?auto_273319 ) ) ( not ( = ?auto_273317 ?auto_273320 ) ) ( not ( = ?auto_273317 ?auto_273321 ) ) ( not ( = ?auto_273317 ?auto_273322 ) ) ( not ( = ?auto_273317 ?auto_273323 ) ) ( not ( = ?auto_273317 ?auto_273324 ) ) ( not ( = ?auto_273317 ?auto_273325 ) ) ( not ( = ?auto_273317 ?auto_273326 ) ) ( not ( = ?auto_273317 ?auto_273327 ) ) ( not ( = ?auto_273318 ?auto_273319 ) ) ( not ( = ?auto_273318 ?auto_273320 ) ) ( not ( = ?auto_273318 ?auto_273321 ) ) ( not ( = ?auto_273318 ?auto_273322 ) ) ( not ( = ?auto_273318 ?auto_273323 ) ) ( not ( = ?auto_273318 ?auto_273324 ) ) ( not ( = ?auto_273318 ?auto_273325 ) ) ( not ( = ?auto_273318 ?auto_273326 ) ) ( not ( = ?auto_273318 ?auto_273327 ) ) ( not ( = ?auto_273319 ?auto_273320 ) ) ( not ( = ?auto_273319 ?auto_273321 ) ) ( not ( = ?auto_273319 ?auto_273322 ) ) ( not ( = ?auto_273319 ?auto_273323 ) ) ( not ( = ?auto_273319 ?auto_273324 ) ) ( not ( = ?auto_273319 ?auto_273325 ) ) ( not ( = ?auto_273319 ?auto_273326 ) ) ( not ( = ?auto_273319 ?auto_273327 ) ) ( not ( = ?auto_273320 ?auto_273321 ) ) ( not ( = ?auto_273320 ?auto_273322 ) ) ( not ( = ?auto_273320 ?auto_273323 ) ) ( not ( = ?auto_273320 ?auto_273324 ) ) ( not ( = ?auto_273320 ?auto_273325 ) ) ( not ( = ?auto_273320 ?auto_273326 ) ) ( not ( = ?auto_273320 ?auto_273327 ) ) ( not ( = ?auto_273321 ?auto_273322 ) ) ( not ( = ?auto_273321 ?auto_273323 ) ) ( not ( = ?auto_273321 ?auto_273324 ) ) ( not ( = ?auto_273321 ?auto_273325 ) ) ( not ( = ?auto_273321 ?auto_273326 ) ) ( not ( = ?auto_273321 ?auto_273327 ) ) ( not ( = ?auto_273322 ?auto_273323 ) ) ( not ( = ?auto_273322 ?auto_273324 ) ) ( not ( = ?auto_273322 ?auto_273325 ) ) ( not ( = ?auto_273322 ?auto_273326 ) ) ( not ( = ?auto_273322 ?auto_273327 ) ) ( not ( = ?auto_273323 ?auto_273324 ) ) ( not ( = ?auto_273323 ?auto_273325 ) ) ( not ( = ?auto_273323 ?auto_273326 ) ) ( not ( = ?auto_273323 ?auto_273327 ) ) ( not ( = ?auto_273324 ?auto_273325 ) ) ( not ( = ?auto_273324 ?auto_273326 ) ) ( not ( = ?auto_273324 ?auto_273327 ) ) ( not ( = ?auto_273325 ?auto_273326 ) ) ( not ( = ?auto_273325 ?auto_273327 ) ) ( not ( = ?auto_273326 ?auto_273327 ) ) ( ON ?auto_273325 ?auto_273326 ) ( ON ?auto_273324 ?auto_273325 ) ( ON ?auto_273323 ?auto_273324 ) ( CLEAR ?auto_273321 ) ( ON ?auto_273322 ?auto_273323 ) ( CLEAR ?auto_273322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_273316 ?auto_273317 ?auto_273318 ?auto_273319 ?auto_273320 ?auto_273321 ?auto_273322 )
      ( MAKE-11PILE ?auto_273316 ?auto_273317 ?auto_273318 ?auto_273319 ?auto_273320 ?auto_273321 ?auto_273322 ?auto_273323 ?auto_273324 ?auto_273325 ?auto_273326 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_273339 - BLOCK
      ?auto_273340 - BLOCK
      ?auto_273341 - BLOCK
      ?auto_273342 - BLOCK
      ?auto_273343 - BLOCK
      ?auto_273344 - BLOCK
      ?auto_273345 - BLOCK
      ?auto_273346 - BLOCK
      ?auto_273347 - BLOCK
      ?auto_273348 - BLOCK
      ?auto_273349 - BLOCK
    )
    :vars
    (
      ?auto_273350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273349 ?auto_273350 ) ( ON-TABLE ?auto_273339 ) ( ON ?auto_273340 ?auto_273339 ) ( ON ?auto_273341 ?auto_273340 ) ( ON ?auto_273342 ?auto_273341 ) ( ON ?auto_273343 ?auto_273342 ) ( not ( = ?auto_273339 ?auto_273340 ) ) ( not ( = ?auto_273339 ?auto_273341 ) ) ( not ( = ?auto_273339 ?auto_273342 ) ) ( not ( = ?auto_273339 ?auto_273343 ) ) ( not ( = ?auto_273339 ?auto_273344 ) ) ( not ( = ?auto_273339 ?auto_273345 ) ) ( not ( = ?auto_273339 ?auto_273346 ) ) ( not ( = ?auto_273339 ?auto_273347 ) ) ( not ( = ?auto_273339 ?auto_273348 ) ) ( not ( = ?auto_273339 ?auto_273349 ) ) ( not ( = ?auto_273339 ?auto_273350 ) ) ( not ( = ?auto_273340 ?auto_273341 ) ) ( not ( = ?auto_273340 ?auto_273342 ) ) ( not ( = ?auto_273340 ?auto_273343 ) ) ( not ( = ?auto_273340 ?auto_273344 ) ) ( not ( = ?auto_273340 ?auto_273345 ) ) ( not ( = ?auto_273340 ?auto_273346 ) ) ( not ( = ?auto_273340 ?auto_273347 ) ) ( not ( = ?auto_273340 ?auto_273348 ) ) ( not ( = ?auto_273340 ?auto_273349 ) ) ( not ( = ?auto_273340 ?auto_273350 ) ) ( not ( = ?auto_273341 ?auto_273342 ) ) ( not ( = ?auto_273341 ?auto_273343 ) ) ( not ( = ?auto_273341 ?auto_273344 ) ) ( not ( = ?auto_273341 ?auto_273345 ) ) ( not ( = ?auto_273341 ?auto_273346 ) ) ( not ( = ?auto_273341 ?auto_273347 ) ) ( not ( = ?auto_273341 ?auto_273348 ) ) ( not ( = ?auto_273341 ?auto_273349 ) ) ( not ( = ?auto_273341 ?auto_273350 ) ) ( not ( = ?auto_273342 ?auto_273343 ) ) ( not ( = ?auto_273342 ?auto_273344 ) ) ( not ( = ?auto_273342 ?auto_273345 ) ) ( not ( = ?auto_273342 ?auto_273346 ) ) ( not ( = ?auto_273342 ?auto_273347 ) ) ( not ( = ?auto_273342 ?auto_273348 ) ) ( not ( = ?auto_273342 ?auto_273349 ) ) ( not ( = ?auto_273342 ?auto_273350 ) ) ( not ( = ?auto_273343 ?auto_273344 ) ) ( not ( = ?auto_273343 ?auto_273345 ) ) ( not ( = ?auto_273343 ?auto_273346 ) ) ( not ( = ?auto_273343 ?auto_273347 ) ) ( not ( = ?auto_273343 ?auto_273348 ) ) ( not ( = ?auto_273343 ?auto_273349 ) ) ( not ( = ?auto_273343 ?auto_273350 ) ) ( not ( = ?auto_273344 ?auto_273345 ) ) ( not ( = ?auto_273344 ?auto_273346 ) ) ( not ( = ?auto_273344 ?auto_273347 ) ) ( not ( = ?auto_273344 ?auto_273348 ) ) ( not ( = ?auto_273344 ?auto_273349 ) ) ( not ( = ?auto_273344 ?auto_273350 ) ) ( not ( = ?auto_273345 ?auto_273346 ) ) ( not ( = ?auto_273345 ?auto_273347 ) ) ( not ( = ?auto_273345 ?auto_273348 ) ) ( not ( = ?auto_273345 ?auto_273349 ) ) ( not ( = ?auto_273345 ?auto_273350 ) ) ( not ( = ?auto_273346 ?auto_273347 ) ) ( not ( = ?auto_273346 ?auto_273348 ) ) ( not ( = ?auto_273346 ?auto_273349 ) ) ( not ( = ?auto_273346 ?auto_273350 ) ) ( not ( = ?auto_273347 ?auto_273348 ) ) ( not ( = ?auto_273347 ?auto_273349 ) ) ( not ( = ?auto_273347 ?auto_273350 ) ) ( not ( = ?auto_273348 ?auto_273349 ) ) ( not ( = ?auto_273348 ?auto_273350 ) ) ( not ( = ?auto_273349 ?auto_273350 ) ) ( ON ?auto_273348 ?auto_273349 ) ( ON ?auto_273347 ?auto_273348 ) ( ON ?auto_273346 ?auto_273347 ) ( ON ?auto_273345 ?auto_273346 ) ( CLEAR ?auto_273343 ) ( ON ?auto_273344 ?auto_273345 ) ( CLEAR ?auto_273344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_273339 ?auto_273340 ?auto_273341 ?auto_273342 ?auto_273343 ?auto_273344 )
      ( MAKE-11PILE ?auto_273339 ?auto_273340 ?auto_273341 ?auto_273342 ?auto_273343 ?auto_273344 ?auto_273345 ?auto_273346 ?auto_273347 ?auto_273348 ?auto_273349 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_273362 - BLOCK
      ?auto_273363 - BLOCK
      ?auto_273364 - BLOCK
      ?auto_273365 - BLOCK
      ?auto_273366 - BLOCK
      ?auto_273367 - BLOCK
      ?auto_273368 - BLOCK
      ?auto_273369 - BLOCK
      ?auto_273370 - BLOCK
      ?auto_273371 - BLOCK
      ?auto_273372 - BLOCK
    )
    :vars
    (
      ?auto_273373 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273372 ?auto_273373 ) ( ON-TABLE ?auto_273362 ) ( ON ?auto_273363 ?auto_273362 ) ( ON ?auto_273364 ?auto_273363 ) ( ON ?auto_273365 ?auto_273364 ) ( ON ?auto_273366 ?auto_273365 ) ( not ( = ?auto_273362 ?auto_273363 ) ) ( not ( = ?auto_273362 ?auto_273364 ) ) ( not ( = ?auto_273362 ?auto_273365 ) ) ( not ( = ?auto_273362 ?auto_273366 ) ) ( not ( = ?auto_273362 ?auto_273367 ) ) ( not ( = ?auto_273362 ?auto_273368 ) ) ( not ( = ?auto_273362 ?auto_273369 ) ) ( not ( = ?auto_273362 ?auto_273370 ) ) ( not ( = ?auto_273362 ?auto_273371 ) ) ( not ( = ?auto_273362 ?auto_273372 ) ) ( not ( = ?auto_273362 ?auto_273373 ) ) ( not ( = ?auto_273363 ?auto_273364 ) ) ( not ( = ?auto_273363 ?auto_273365 ) ) ( not ( = ?auto_273363 ?auto_273366 ) ) ( not ( = ?auto_273363 ?auto_273367 ) ) ( not ( = ?auto_273363 ?auto_273368 ) ) ( not ( = ?auto_273363 ?auto_273369 ) ) ( not ( = ?auto_273363 ?auto_273370 ) ) ( not ( = ?auto_273363 ?auto_273371 ) ) ( not ( = ?auto_273363 ?auto_273372 ) ) ( not ( = ?auto_273363 ?auto_273373 ) ) ( not ( = ?auto_273364 ?auto_273365 ) ) ( not ( = ?auto_273364 ?auto_273366 ) ) ( not ( = ?auto_273364 ?auto_273367 ) ) ( not ( = ?auto_273364 ?auto_273368 ) ) ( not ( = ?auto_273364 ?auto_273369 ) ) ( not ( = ?auto_273364 ?auto_273370 ) ) ( not ( = ?auto_273364 ?auto_273371 ) ) ( not ( = ?auto_273364 ?auto_273372 ) ) ( not ( = ?auto_273364 ?auto_273373 ) ) ( not ( = ?auto_273365 ?auto_273366 ) ) ( not ( = ?auto_273365 ?auto_273367 ) ) ( not ( = ?auto_273365 ?auto_273368 ) ) ( not ( = ?auto_273365 ?auto_273369 ) ) ( not ( = ?auto_273365 ?auto_273370 ) ) ( not ( = ?auto_273365 ?auto_273371 ) ) ( not ( = ?auto_273365 ?auto_273372 ) ) ( not ( = ?auto_273365 ?auto_273373 ) ) ( not ( = ?auto_273366 ?auto_273367 ) ) ( not ( = ?auto_273366 ?auto_273368 ) ) ( not ( = ?auto_273366 ?auto_273369 ) ) ( not ( = ?auto_273366 ?auto_273370 ) ) ( not ( = ?auto_273366 ?auto_273371 ) ) ( not ( = ?auto_273366 ?auto_273372 ) ) ( not ( = ?auto_273366 ?auto_273373 ) ) ( not ( = ?auto_273367 ?auto_273368 ) ) ( not ( = ?auto_273367 ?auto_273369 ) ) ( not ( = ?auto_273367 ?auto_273370 ) ) ( not ( = ?auto_273367 ?auto_273371 ) ) ( not ( = ?auto_273367 ?auto_273372 ) ) ( not ( = ?auto_273367 ?auto_273373 ) ) ( not ( = ?auto_273368 ?auto_273369 ) ) ( not ( = ?auto_273368 ?auto_273370 ) ) ( not ( = ?auto_273368 ?auto_273371 ) ) ( not ( = ?auto_273368 ?auto_273372 ) ) ( not ( = ?auto_273368 ?auto_273373 ) ) ( not ( = ?auto_273369 ?auto_273370 ) ) ( not ( = ?auto_273369 ?auto_273371 ) ) ( not ( = ?auto_273369 ?auto_273372 ) ) ( not ( = ?auto_273369 ?auto_273373 ) ) ( not ( = ?auto_273370 ?auto_273371 ) ) ( not ( = ?auto_273370 ?auto_273372 ) ) ( not ( = ?auto_273370 ?auto_273373 ) ) ( not ( = ?auto_273371 ?auto_273372 ) ) ( not ( = ?auto_273371 ?auto_273373 ) ) ( not ( = ?auto_273372 ?auto_273373 ) ) ( ON ?auto_273371 ?auto_273372 ) ( ON ?auto_273370 ?auto_273371 ) ( ON ?auto_273369 ?auto_273370 ) ( ON ?auto_273368 ?auto_273369 ) ( CLEAR ?auto_273366 ) ( ON ?auto_273367 ?auto_273368 ) ( CLEAR ?auto_273367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_273362 ?auto_273363 ?auto_273364 ?auto_273365 ?auto_273366 ?auto_273367 )
      ( MAKE-11PILE ?auto_273362 ?auto_273363 ?auto_273364 ?auto_273365 ?auto_273366 ?auto_273367 ?auto_273368 ?auto_273369 ?auto_273370 ?auto_273371 ?auto_273372 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_273385 - BLOCK
      ?auto_273386 - BLOCK
      ?auto_273387 - BLOCK
      ?auto_273388 - BLOCK
      ?auto_273389 - BLOCK
      ?auto_273390 - BLOCK
      ?auto_273391 - BLOCK
      ?auto_273392 - BLOCK
      ?auto_273393 - BLOCK
      ?auto_273394 - BLOCK
      ?auto_273395 - BLOCK
    )
    :vars
    (
      ?auto_273396 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273395 ?auto_273396 ) ( ON-TABLE ?auto_273385 ) ( ON ?auto_273386 ?auto_273385 ) ( ON ?auto_273387 ?auto_273386 ) ( ON ?auto_273388 ?auto_273387 ) ( not ( = ?auto_273385 ?auto_273386 ) ) ( not ( = ?auto_273385 ?auto_273387 ) ) ( not ( = ?auto_273385 ?auto_273388 ) ) ( not ( = ?auto_273385 ?auto_273389 ) ) ( not ( = ?auto_273385 ?auto_273390 ) ) ( not ( = ?auto_273385 ?auto_273391 ) ) ( not ( = ?auto_273385 ?auto_273392 ) ) ( not ( = ?auto_273385 ?auto_273393 ) ) ( not ( = ?auto_273385 ?auto_273394 ) ) ( not ( = ?auto_273385 ?auto_273395 ) ) ( not ( = ?auto_273385 ?auto_273396 ) ) ( not ( = ?auto_273386 ?auto_273387 ) ) ( not ( = ?auto_273386 ?auto_273388 ) ) ( not ( = ?auto_273386 ?auto_273389 ) ) ( not ( = ?auto_273386 ?auto_273390 ) ) ( not ( = ?auto_273386 ?auto_273391 ) ) ( not ( = ?auto_273386 ?auto_273392 ) ) ( not ( = ?auto_273386 ?auto_273393 ) ) ( not ( = ?auto_273386 ?auto_273394 ) ) ( not ( = ?auto_273386 ?auto_273395 ) ) ( not ( = ?auto_273386 ?auto_273396 ) ) ( not ( = ?auto_273387 ?auto_273388 ) ) ( not ( = ?auto_273387 ?auto_273389 ) ) ( not ( = ?auto_273387 ?auto_273390 ) ) ( not ( = ?auto_273387 ?auto_273391 ) ) ( not ( = ?auto_273387 ?auto_273392 ) ) ( not ( = ?auto_273387 ?auto_273393 ) ) ( not ( = ?auto_273387 ?auto_273394 ) ) ( not ( = ?auto_273387 ?auto_273395 ) ) ( not ( = ?auto_273387 ?auto_273396 ) ) ( not ( = ?auto_273388 ?auto_273389 ) ) ( not ( = ?auto_273388 ?auto_273390 ) ) ( not ( = ?auto_273388 ?auto_273391 ) ) ( not ( = ?auto_273388 ?auto_273392 ) ) ( not ( = ?auto_273388 ?auto_273393 ) ) ( not ( = ?auto_273388 ?auto_273394 ) ) ( not ( = ?auto_273388 ?auto_273395 ) ) ( not ( = ?auto_273388 ?auto_273396 ) ) ( not ( = ?auto_273389 ?auto_273390 ) ) ( not ( = ?auto_273389 ?auto_273391 ) ) ( not ( = ?auto_273389 ?auto_273392 ) ) ( not ( = ?auto_273389 ?auto_273393 ) ) ( not ( = ?auto_273389 ?auto_273394 ) ) ( not ( = ?auto_273389 ?auto_273395 ) ) ( not ( = ?auto_273389 ?auto_273396 ) ) ( not ( = ?auto_273390 ?auto_273391 ) ) ( not ( = ?auto_273390 ?auto_273392 ) ) ( not ( = ?auto_273390 ?auto_273393 ) ) ( not ( = ?auto_273390 ?auto_273394 ) ) ( not ( = ?auto_273390 ?auto_273395 ) ) ( not ( = ?auto_273390 ?auto_273396 ) ) ( not ( = ?auto_273391 ?auto_273392 ) ) ( not ( = ?auto_273391 ?auto_273393 ) ) ( not ( = ?auto_273391 ?auto_273394 ) ) ( not ( = ?auto_273391 ?auto_273395 ) ) ( not ( = ?auto_273391 ?auto_273396 ) ) ( not ( = ?auto_273392 ?auto_273393 ) ) ( not ( = ?auto_273392 ?auto_273394 ) ) ( not ( = ?auto_273392 ?auto_273395 ) ) ( not ( = ?auto_273392 ?auto_273396 ) ) ( not ( = ?auto_273393 ?auto_273394 ) ) ( not ( = ?auto_273393 ?auto_273395 ) ) ( not ( = ?auto_273393 ?auto_273396 ) ) ( not ( = ?auto_273394 ?auto_273395 ) ) ( not ( = ?auto_273394 ?auto_273396 ) ) ( not ( = ?auto_273395 ?auto_273396 ) ) ( ON ?auto_273394 ?auto_273395 ) ( ON ?auto_273393 ?auto_273394 ) ( ON ?auto_273392 ?auto_273393 ) ( ON ?auto_273391 ?auto_273392 ) ( ON ?auto_273390 ?auto_273391 ) ( CLEAR ?auto_273388 ) ( ON ?auto_273389 ?auto_273390 ) ( CLEAR ?auto_273389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_273385 ?auto_273386 ?auto_273387 ?auto_273388 ?auto_273389 )
      ( MAKE-11PILE ?auto_273385 ?auto_273386 ?auto_273387 ?auto_273388 ?auto_273389 ?auto_273390 ?auto_273391 ?auto_273392 ?auto_273393 ?auto_273394 ?auto_273395 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_273408 - BLOCK
      ?auto_273409 - BLOCK
      ?auto_273410 - BLOCK
      ?auto_273411 - BLOCK
      ?auto_273412 - BLOCK
      ?auto_273413 - BLOCK
      ?auto_273414 - BLOCK
      ?auto_273415 - BLOCK
      ?auto_273416 - BLOCK
      ?auto_273417 - BLOCK
      ?auto_273418 - BLOCK
    )
    :vars
    (
      ?auto_273419 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273418 ?auto_273419 ) ( ON-TABLE ?auto_273408 ) ( ON ?auto_273409 ?auto_273408 ) ( ON ?auto_273410 ?auto_273409 ) ( ON ?auto_273411 ?auto_273410 ) ( not ( = ?auto_273408 ?auto_273409 ) ) ( not ( = ?auto_273408 ?auto_273410 ) ) ( not ( = ?auto_273408 ?auto_273411 ) ) ( not ( = ?auto_273408 ?auto_273412 ) ) ( not ( = ?auto_273408 ?auto_273413 ) ) ( not ( = ?auto_273408 ?auto_273414 ) ) ( not ( = ?auto_273408 ?auto_273415 ) ) ( not ( = ?auto_273408 ?auto_273416 ) ) ( not ( = ?auto_273408 ?auto_273417 ) ) ( not ( = ?auto_273408 ?auto_273418 ) ) ( not ( = ?auto_273408 ?auto_273419 ) ) ( not ( = ?auto_273409 ?auto_273410 ) ) ( not ( = ?auto_273409 ?auto_273411 ) ) ( not ( = ?auto_273409 ?auto_273412 ) ) ( not ( = ?auto_273409 ?auto_273413 ) ) ( not ( = ?auto_273409 ?auto_273414 ) ) ( not ( = ?auto_273409 ?auto_273415 ) ) ( not ( = ?auto_273409 ?auto_273416 ) ) ( not ( = ?auto_273409 ?auto_273417 ) ) ( not ( = ?auto_273409 ?auto_273418 ) ) ( not ( = ?auto_273409 ?auto_273419 ) ) ( not ( = ?auto_273410 ?auto_273411 ) ) ( not ( = ?auto_273410 ?auto_273412 ) ) ( not ( = ?auto_273410 ?auto_273413 ) ) ( not ( = ?auto_273410 ?auto_273414 ) ) ( not ( = ?auto_273410 ?auto_273415 ) ) ( not ( = ?auto_273410 ?auto_273416 ) ) ( not ( = ?auto_273410 ?auto_273417 ) ) ( not ( = ?auto_273410 ?auto_273418 ) ) ( not ( = ?auto_273410 ?auto_273419 ) ) ( not ( = ?auto_273411 ?auto_273412 ) ) ( not ( = ?auto_273411 ?auto_273413 ) ) ( not ( = ?auto_273411 ?auto_273414 ) ) ( not ( = ?auto_273411 ?auto_273415 ) ) ( not ( = ?auto_273411 ?auto_273416 ) ) ( not ( = ?auto_273411 ?auto_273417 ) ) ( not ( = ?auto_273411 ?auto_273418 ) ) ( not ( = ?auto_273411 ?auto_273419 ) ) ( not ( = ?auto_273412 ?auto_273413 ) ) ( not ( = ?auto_273412 ?auto_273414 ) ) ( not ( = ?auto_273412 ?auto_273415 ) ) ( not ( = ?auto_273412 ?auto_273416 ) ) ( not ( = ?auto_273412 ?auto_273417 ) ) ( not ( = ?auto_273412 ?auto_273418 ) ) ( not ( = ?auto_273412 ?auto_273419 ) ) ( not ( = ?auto_273413 ?auto_273414 ) ) ( not ( = ?auto_273413 ?auto_273415 ) ) ( not ( = ?auto_273413 ?auto_273416 ) ) ( not ( = ?auto_273413 ?auto_273417 ) ) ( not ( = ?auto_273413 ?auto_273418 ) ) ( not ( = ?auto_273413 ?auto_273419 ) ) ( not ( = ?auto_273414 ?auto_273415 ) ) ( not ( = ?auto_273414 ?auto_273416 ) ) ( not ( = ?auto_273414 ?auto_273417 ) ) ( not ( = ?auto_273414 ?auto_273418 ) ) ( not ( = ?auto_273414 ?auto_273419 ) ) ( not ( = ?auto_273415 ?auto_273416 ) ) ( not ( = ?auto_273415 ?auto_273417 ) ) ( not ( = ?auto_273415 ?auto_273418 ) ) ( not ( = ?auto_273415 ?auto_273419 ) ) ( not ( = ?auto_273416 ?auto_273417 ) ) ( not ( = ?auto_273416 ?auto_273418 ) ) ( not ( = ?auto_273416 ?auto_273419 ) ) ( not ( = ?auto_273417 ?auto_273418 ) ) ( not ( = ?auto_273417 ?auto_273419 ) ) ( not ( = ?auto_273418 ?auto_273419 ) ) ( ON ?auto_273417 ?auto_273418 ) ( ON ?auto_273416 ?auto_273417 ) ( ON ?auto_273415 ?auto_273416 ) ( ON ?auto_273414 ?auto_273415 ) ( ON ?auto_273413 ?auto_273414 ) ( CLEAR ?auto_273411 ) ( ON ?auto_273412 ?auto_273413 ) ( CLEAR ?auto_273412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_273408 ?auto_273409 ?auto_273410 ?auto_273411 ?auto_273412 )
      ( MAKE-11PILE ?auto_273408 ?auto_273409 ?auto_273410 ?auto_273411 ?auto_273412 ?auto_273413 ?auto_273414 ?auto_273415 ?auto_273416 ?auto_273417 ?auto_273418 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_273431 - BLOCK
      ?auto_273432 - BLOCK
      ?auto_273433 - BLOCK
      ?auto_273434 - BLOCK
      ?auto_273435 - BLOCK
      ?auto_273436 - BLOCK
      ?auto_273437 - BLOCK
      ?auto_273438 - BLOCK
      ?auto_273439 - BLOCK
      ?auto_273440 - BLOCK
      ?auto_273441 - BLOCK
    )
    :vars
    (
      ?auto_273442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273441 ?auto_273442 ) ( ON-TABLE ?auto_273431 ) ( ON ?auto_273432 ?auto_273431 ) ( ON ?auto_273433 ?auto_273432 ) ( not ( = ?auto_273431 ?auto_273432 ) ) ( not ( = ?auto_273431 ?auto_273433 ) ) ( not ( = ?auto_273431 ?auto_273434 ) ) ( not ( = ?auto_273431 ?auto_273435 ) ) ( not ( = ?auto_273431 ?auto_273436 ) ) ( not ( = ?auto_273431 ?auto_273437 ) ) ( not ( = ?auto_273431 ?auto_273438 ) ) ( not ( = ?auto_273431 ?auto_273439 ) ) ( not ( = ?auto_273431 ?auto_273440 ) ) ( not ( = ?auto_273431 ?auto_273441 ) ) ( not ( = ?auto_273431 ?auto_273442 ) ) ( not ( = ?auto_273432 ?auto_273433 ) ) ( not ( = ?auto_273432 ?auto_273434 ) ) ( not ( = ?auto_273432 ?auto_273435 ) ) ( not ( = ?auto_273432 ?auto_273436 ) ) ( not ( = ?auto_273432 ?auto_273437 ) ) ( not ( = ?auto_273432 ?auto_273438 ) ) ( not ( = ?auto_273432 ?auto_273439 ) ) ( not ( = ?auto_273432 ?auto_273440 ) ) ( not ( = ?auto_273432 ?auto_273441 ) ) ( not ( = ?auto_273432 ?auto_273442 ) ) ( not ( = ?auto_273433 ?auto_273434 ) ) ( not ( = ?auto_273433 ?auto_273435 ) ) ( not ( = ?auto_273433 ?auto_273436 ) ) ( not ( = ?auto_273433 ?auto_273437 ) ) ( not ( = ?auto_273433 ?auto_273438 ) ) ( not ( = ?auto_273433 ?auto_273439 ) ) ( not ( = ?auto_273433 ?auto_273440 ) ) ( not ( = ?auto_273433 ?auto_273441 ) ) ( not ( = ?auto_273433 ?auto_273442 ) ) ( not ( = ?auto_273434 ?auto_273435 ) ) ( not ( = ?auto_273434 ?auto_273436 ) ) ( not ( = ?auto_273434 ?auto_273437 ) ) ( not ( = ?auto_273434 ?auto_273438 ) ) ( not ( = ?auto_273434 ?auto_273439 ) ) ( not ( = ?auto_273434 ?auto_273440 ) ) ( not ( = ?auto_273434 ?auto_273441 ) ) ( not ( = ?auto_273434 ?auto_273442 ) ) ( not ( = ?auto_273435 ?auto_273436 ) ) ( not ( = ?auto_273435 ?auto_273437 ) ) ( not ( = ?auto_273435 ?auto_273438 ) ) ( not ( = ?auto_273435 ?auto_273439 ) ) ( not ( = ?auto_273435 ?auto_273440 ) ) ( not ( = ?auto_273435 ?auto_273441 ) ) ( not ( = ?auto_273435 ?auto_273442 ) ) ( not ( = ?auto_273436 ?auto_273437 ) ) ( not ( = ?auto_273436 ?auto_273438 ) ) ( not ( = ?auto_273436 ?auto_273439 ) ) ( not ( = ?auto_273436 ?auto_273440 ) ) ( not ( = ?auto_273436 ?auto_273441 ) ) ( not ( = ?auto_273436 ?auto_273442 ) ) ( not ( = ?auto_273437 ?auto_273438 ) ) ( not ( = ?auto_273437 ?auto_273439 ) ) ( not ( = ?auto_273437 ?auto_273440 ) ) ( not ( = ?auto_273437 ?auto_273441 ) ) ( not ( = ?auto_273437 ?auto_273442 ) ) ( not ( = ?auto_273438 ?auto_273439 ) ) ( not ( = ?auto_273438 ?auto_273440 ) ) ( not ( = ?auto_273438 ?auto_273441 ) ) ( not ( = ?auto_273438 ?auto_273442 ) ) ( not ( = ?auto_273439 ?auto_273440 ) ) ( not ( = ?auto_273439 ?auto_273441 ) ) ( not ( = ?auto_273439 ?auto_273442 ) ) ( not ( = ?auto_273440 ?auto_273441 ) ) ( not ( = ?auto_273440 ?auto_273442 ) ) ( not ( = ?auto_273441 ?auto_273442 ) ) ( ON ?auto_273440 ?auto_273441 ) ( ON ?auto_273439 ?auto_273440 ) ( ON ?auto_273438 ?auto_273439 ) ( ON ?auto_273437 ?auto_273438 ) ( ON ?auto_273436 ?auto_273437 ) ( ON ?auto_273435 ?auto_273436 ) ( CLEAR ?auto_273433 ) ( ON ?auto_273434 ?auto_273435 ) ( CLEAR ?auto_273434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_273431 ?auto_273432 ?auto_273433 ?auto_273434 )
      ( MAKE-11PILE ?auto_273431 ?auto_273432 ?auto_273433 ?auto_273434 ?auto_273435 ?auto_273436 ?auto_273437 ?auto_273438 ?auto_273439 ?auto_273440 ?auto_273441 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_273454 - BLOCK
      ?auto_273455 - BLOCK
      ?auto_273456 - BLOCK
      ?auto_273457 - BLOCK
      ?auto_273458 - BLOCK
      ?auto_273459 - BLOCK
      ?auto_273460 - BLOCK
      ?auto_273461 - BLOCK
      ?auto_273462 - BLOCK
      ?auto_273463 - BLOCK
      ?auto_273464 - BLOCK
    )
    :vars
    (
      ?auto_273465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273464 ?auto_273465 ) ( ON-TABLE ?auto_273454 ) ( ON ?auto_273455 ?auto_273454 ) ( ON ?auto_273456 ?auto_273455 ) ( not ( = ?auto_273454 ?auto_273455 ) ) ( not ( = ?auto_273454 ?auto_273456 ) ) ( not ( = ?auto_273454 ?auto_273457 ) ) ( not ( = ?auto_273454 ?auto_273458 ) ) ( not ( = ?auto_273454 ?auto_273459 ) ) ( not ( = ?auto_273454 ?auto_273460 ) ) ( not ( = ?auto_273454 ?auto_273461 ) ) ( not ( = ?auto_273454 ?auto_273462 ) ) ( not ( = ?auto_273454 ?auto_273463 ) ) ( not ( = ?auto_273454 ?auto_273464 ) ) ( not ( = ?auto_273454 ?auto_273465 ) ) ( not ( = ?auto_273455 ?auto_273456 ) ) ( not ( = ?auto_273455 ?auto_273457 ) ) ( not ( = ?auto_273455 ?auto_273458 ) ) ( not ( = ?auto_273455 ?auto_273459 ) ) ( not ( = ?auto_273455 ?auto_273460 ) ) ( not ( = ?auto_273455 ?auto_273461 ) ) ( not ( = ?auto_273455 ?auto_273462 ) ) ( not ( = ?auto_273455 ?auto_273463 ) ) ( not ( = ?auto_273455 ?auto_273464 ) ) ( not ( = ?auto_273455 ?auto_273465 ) ) ( not ( = ?auto_273456 ?auto_273457 ) ) ( not ( = ?auto_273456 ?auto_273458 ) ) ( not ( = ?auto_273456 ?auto_273459 ) ) ( not ( = ?auto_273456 ?auto_273460 ) ) ( not ( = ?auto_273456 ?auto_273461 ) ) ( not ( = ?auto_273456 ?auto_273462 ) ) ( not ( = ?auto_273456 ?auto_273463 ) ) ( not ( = ?auto_273456 ?auto_273464 ) ) ( not ( = ?auto_273456 ?auto_273465 ) ) ( not ( = ?auto_273457 ?auto_273458 ) ) ( not ( = ?auto_273457 ?auto_273459 ) ) ( not ( = ?auto_273457 ?auto_273460 ) ) ( not ( = ?auto_273457 ?auto_273461 ) ) ( not ( = ?auto_273457 ?auto_273462 ) ) ( not ( = ?auto_273457 ?auto_273463 ) ) ( not ( = ?auto_273457 ?auto_273464 ) ) ( not ( = ?auto_273457 ?auto_273465 ) ) ( not ( = ?auto_273458 ?auto_273459 ) ) ( not ( = ?auto_273458 ?auto_273460 ) ) ( not ( = ?auto_273458 ?auto_273461 ) ) ( not ( = ?auto_273458 ?auto_273462 ) ) ( not ( = ?auto_273458 ?auto_273463 ) ) ( not ( = ?auto_273458 ?auto_273464 ) ) ( not ( = ?auto_273458 ?auto_273465 ) ) ( not ( = ?auto_273459 ?auto_273460 ) ) ( not ( = ?auto_273459 ?auto_273461 ) ) ( not ( = ?auto_273459 ?auto_273462 ) ) ( not ( = ?auto_273459 ?auto_273463 ) ) ( not ( = ?auto_273459 ?auto_273464 ) ) ( not ( = ?auto_273459 ?auto_273465 ) ) ( not ( = ?auto_273460 ?auto_273461 ) ) ( not ( = ?auto_273460 ?auto_273462 ) ) ( not ( = ?auto_273460 ?auto_273463 ) ) ( not ( = ?auto_273460 ?auto_273464 ) ) ( not ( = ?auto_273460 ?auto_273465 ) ) ( not ( = ?auto_273461 ?auto_273462 ) ) ( not ( = ?auto_273461 ?auto_273463 ) ) ( not ( = ?auto_273461 ?auto_273464 ) ) ( not ( = ?auto_273461 ?auto_273465 ) ) ( not ( = ?auto_273462 ?auto_273463 ) ) ( not ( = ?auto_273462 ?auto_273464 ) ) ( not ( = ?auto_273462 ?auto_273465 ) ) ( not ( = ?auto_273463 ?auto_273464 ) ) ( not ( = ?auto_273463 ?auto_273465 ) ) ( not ( = ?auto_273464 ?auto_273465 ) ) ( ON ?auto_273463 ?auto_273464 ) ( ON ?auto_273462 ?auto_273463 ) ( ON ?auto_273461 ?auto_273462 ) ( ON ?auto_273460 ?auto_273461 ) ( ON ?auto_273459 ?auto_273460 ) ( ON ?auto_273458 ?auto_273459 ) ( CLEAR ?auto_273456 ) ( ON ?auto_273457 ?auto_273458 ) ( CLEAR ?auto_273457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_273454 ?auto_273455 ?auto_273456 ?auto_273457 )
      ( MAKE-11PILE ?auto_273454 ?auto_273455 ?auto_273456 ?auto_273457 ?auto_273458 ?auto_273459 ?auto_273460 ?auto_273461 ?auto_273462 ?auto_273463 ?auto_273464 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_273477 - BLOCK
      ?auto_273478 - BLOCK
      ?auto_273479 - BLOCK
      ?auto_273480 - BLOCK
      ?auto_273481 - BLOCK
      ?auto_273482 - BLOCK
      ?auto_273483 - BLOCK
      ?auto_273484 - BLOCK
      ?auto_273485 - BLOCK
      ?auto_273486 - BLOCK
      ?auto_273487 - BLOCK
    )
    :vars
    (
      ?auto_273488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273487 ?auto_273488 ) ( ON-TABLE ?auto_273477 ) ( ON ?auto_273478 ?auto_273477 ) ( not ( = ?auto_273477 ?auto_273478 ) ) ( not ( = ?auto_273477 ?auto_273479 ) ) ( not ( = ?auto_273477 ?auto_273480 ) ) ( not ( = ?auto_273477 ?auto_273481 ) ) ( not ( = ?auto_273477 ?auto_273482 ) ) ( not ( = ?auto_273477 ?auto_273483 ) ) ( not ( = ?auto_273477 ?auto_273484 ) ) ( not ( = ?auto_273477 ?auto_273485 ) ) ( not ( = ?auto_273477 ?auto_273486 ) ) ( not ( = ?auto_273477 ?auto_273487 ) ) ( not ( = ?auto_273477 ?auto_273488 ) ) ( not ( = ?auto_273478 ?auto_273479 ) ) ( not ( = ?auto_273478 ?auto_273480 ) ) ( not ( = ?auto_273478 ?auto_273481 ) ) ( not ( = ?auto_273478 ?auto_273482 ) ) ( not ( = ?auto_273478 ?auto_273483 ) ) ( not ( = ?auto_273478 ?auto_273484 ) ) ( not ( = ?auto_273478 ?auto_273485 ) ) ( not ( = ?auto_273478 ?auto_273486 ) ) ( not ( = ?auto_273478 ?auto_273487 ) ) ( not ( = ?auto_273478 ?auto_273488 ) ) ( not ( = ?auto_273479 ?auto_273480 ) ) ( not ( = ?auto_273479 ?auto_273481 ) ) ( not ( = ?auto_273479 ?auto_273482 ) ) ( not ( = ?auto_273479 ?auto_273483 ) ) ( not ( = ?auto_273479 ?auto_273484 ) ) ( not ( = ?auto_273479 ?auto_273485 ) ) ( not ( = ?auto_273479 ?auto_273486 ) ) ( not ( = ?auto_273479 ?auto_273487 ) ) ( not ( = ?auto_273479 ?auto_273488 ) ) ( not ( = ?auto_273480 ?auto_273481 ) ) ( not ( = ?auto_273480 ?auto_273482 ) ) ( not ( = ?auto_273480 ?auto_273483 ) ) ( not ( = ?auto_273480 ?auto_273484 ) ) ( not ( = ?auto_273480 ?auto_273485 ) ) ( not ( = ?auto_273480 ?auto_273486 ) ) ( not ( = ?auto_273480 ?auto_273487 ) ) ( not ( = ?auto_273480 ?auto_273488 ) ) ( not ( = ?auto_273481 ?auto_273482 ) ) ( not ( = ?auto_273481 ?auto_273483 ) ) ( not ( = ?auto_273481 ?auto_273484 ) ) ( not ( = ?auto_273481 ?auto_273485 ) ) ( not ( = ?auto_273481 ?auto_273486 ) ) ( not ( = ?auto_273481 ?auto_273487 ) ) ( not ( = ?auto_273481 ?auto_273488 ) ) ( not ( = ?auto_273482 ?auto_273483 ) ) ( not ( = ?auto_273482 ?auto_273484 ) ) ( not ( = ?auto_273482 ?auto_273485 ) ) ( not ( = ?auto_273482 ?auto_273486 ) ) ( not ( = ?auto_273482 ?auto_273487 ) ) ( not ( = ?auto_273482 ?auto_273488 ) ) ( not ( = ?auto_273483 ?auto_273484 ) ) ( not ( = ?auto_273483 ?auto_273485 ) ) ( not ( = ?auto_273483 ?auto_273486 ) ) ( not ( = ?auto_273483 ?auto_273487 ) ) ( not ( = ?auto_273483 ?auto_273488 ) ) ( not ( = ?auto_273484 ?auto_273485 ) ) ( not ( = ?auto_273484 ?auto_273486 ) ) ( not ( = ?auto_273484 ?auto_273487 ) ) ( not ( = ?auto_273484 ?auto_273488 ) ) ( not ( = ?auto_273485 ?auto_273486 ) ) ( not ( = ?auto_273485 ?auto_273487 ) ) ( not ( = ?auto_273485 ?auto_273488 ) ) ( not ( = ?auto_273486 ?auto_273487 ) ) ( not ( = ?auto_273486 ?auto_273488 ) ) ( not ( = ?auto_273487 ?auto_273488 ) ) ( ON ?auto_273486 ?auto_273487 ) ( ON ?auto_273485 ?auto_273486 ) ( ON ?auto_273484 ?auto_273485 ) ( ON ?auto_273483 ?auto_273484 ) ( ON ?auto_273482 ?auto_273483 ) ( ON ?auto_273481 ?auto_273482 ) ( ON ?auto_273480 ?auto_273481 ) ( CLEAR ?auto_273478 ) ( ON ?auto_273479 ?auto_273480 ) ( CLEAR ?auto_273479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_273477 ?auto_273478 ?auto_273479 )
      ( MAKE-11PILE ?auto_273477 ?auto_273478 ?auto_273479 ?auto_273480 ?auto_273481 ?auto_273482 ?auto_273483 ?auto_273484 ?auto_273485 ?auto_273486 ?auto_273487 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_273500 - BLOCK
      ?auto_273501 - BLOCK
      ?auto_273502 - BLOCK
      ?auto_273503 - BLOCK
      ?auto_273504 - BLOCK
      ?auto_273505 - BLOCK
      ?auto_273506 - BLOCK
      ?auto_273507 - BLOCK
      ?auto_273508 - BLOCK
      ?auto_273509 - BLOCK
      ?auto_273510 - BLOCK
    )
    :vars
    (
      ?auto_273511 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273510 ?auto_273511 ) ( ON-TABLE ?auto_273500 ) ( ON ?auto_273501 ?auto_273500 ) ( not ( = ?auto_273500 ?auto_273501 ) ) ( not ( = ?auto_273500 ?auto_273502 ) ) ( not ( = ?auto_273500 ?auto_273503 ) ) ( not ( = ?auto_273500 ?auto_273504 ) ) ( not ( = ?auto_273500 ?auto_273505 ) ) ( not ( = ?auto_273500 ?auto_273506 ) ) ( not ( = ?auto_273500 ?auto_273507 ) ) ( not ( = ?auto_273500 ?auto_273508 ) ) ( not ( = ?auto_273500 ?auto_273509 ) ) ( not ( = ?auto_273500 ?auto_273510 ) ) ( not ( = ?auto_273500 ?auto_273511 ) ) ( not ( = ?auto_273501 ?auto_273502 ) ) ( not ( = ?auto_273501 ?auto_273503 ) ) ( not ( = ?auto_273501 ?auto_273504 ) ) ( not ( = ?auto_273501 ?auto_273505 ) ) ( not ( = ?auto_273501 ?auto_273506 ) ) ( not ( = ?auto_273501 ?auto_273507 ) ) ( not ( = ?auto_273501 ?auto_273508 ) ) ( not ( = ?auto_273501 ?auto_273509 ) ) ( not ( = ?auto_273501 ?auto_273510 ) ) ( not ( = ?auto_273501 ?auto_273511 ) ) ( not ( = ?auto_273502 ?auto_273503 ) ) ( not ( = ?auto_273502 ?auto_273504 ) ) ( not ( = ?auto_273502 ?auto_273505 ) ) ( not ( = ?auto_273502 ?auto_273506 ) ) ( not ( = ?auto_273502 ?auto_273507 ) ) ( not ( = ?auto_273502 ?auto_273508 ) ) ( not ( = ?auto_273502 ?auto_273509 ) ) ( not ( = ?auto_273502 ?auto_273510 ) ) ( not ( = ?auto_273502 ?auto_273511 ) ) ( not ( = ?auto_273503 ?auto_273504 ) ) ( not ( = ?auto_273503 ?auto_273505 ) ) ( not ( = ?auto_273503 ?auto_273506 ) ) ( not ( = ?auto_273503 ?auto_273507 ) ) ( not ( = ?auto_273503 ?auto_273508 ) ) ( not ( = ?auto_273503 ?auto_273509 ) ) ( not ( = ?auto_273503 ?auto_273510 ) ) ( not ( = ?auto_273503 ?auto_273511 ) ) ( not ( = ?auto_273504 ?auto_273505 ) ) ( not ( = ?auto_273504 ?auto_273506 ) ) ( not ( = ?auto_273504 ?auto_273507 ) ) ( not ( = ?auto_273504 ?auto_273508 ) ) ( not ( = ?auto_273504 ?auto_273509 ) ) ( not ( = ?auto_273504 ?auto_273510 ) ) ( not ( = ?auto_273504 ?auto_273511 ) ) ( not ( = ?auto_273505 ?auto_273506 ) ) ( not ( = ?auto_273505 ?auto_273507 ) ) ( not ( = ?auto_273505 ?auto_273508 ) ) ( not ( = ?auto_273505 ?auto_273509 ) ) ( not ( = ?auto_273505 ?auto_273510 ) ) ( not ( = ?auto_273505 ?auto_273511 ) ) ( not ( = ?auto_273506 ?auto_273507 ) ) ( not ( = ?auto_273506 ?auto_273508 ) ) ( not ( = ?auto_273506 ?auto_273509 ) ) ( not ( = ?auto_273506 ?auto_273510 ) ) ( not ( = ?auto_273506 ?auto_273511 ) ) ( not ( = ?auto_273507 ?auto_273508 ) ) ( not ( = ?auto_273507 ?auto_273509 ) ) ( not ( = ?auto_273507 ?auto_273510 ) ) ( not ( = ?auto_273507 ?auto_273511 ) ) ( not ( = ?auto_273508 ?auto_273509 ) ) ( not ( = ?auto_273508 ?auto_273510 ) ) ( not ( = ?auto_273508 ?auto_273511 ) ) ( not ( = ?auto_273509 ?auto_273510 ) ) ( not ( = ?auto_273509 ?auto_273511 ) ) ( not ( = ?auto_273510 ?auto_273511 ) ) ( ON ?auto_273509 ?auto_273510 ) ( ON ?auto_273508 ?auto_273509 ) ( ON ?auto_273507 ?auto_273508 ) ( ON ?auto_273506 ?auto_273507 ) ( ON ?auto_273505 ?auto_273506 ) ( ON ?auto_273504 ?auto_273505 ) ( ON ?auto_273503 ?auto_273504 ) ( CLEAR ?auto_273501 ) ( ON ?auto_273502 ?auto_273503 ) ( CLEAR ?auto_273502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_273500 ?auto_273501 ?auto_273502 )
      ( MAKE-11PILE ?auto_273500 ?auto_273501 ?auto_273502 ?auto_273503 ?auto_273504 ?auto_273505 ?auto_273506 ?auto_273507 ?auto_273508 ?auto_273509 ?auto_273510 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_273523 - BLOCK
      ?auto_273524 - BLOCK
      ?auto_273525 - BLOCK
      ?auto_273526 - BLOCK
      ?auto_273527 - BLOCK
      ?auto_273528 - BLOCK
      ?auto_273529 - BLOCK
      ?auto_273530 - BLOCK
      ?auto_273531 - BLOCK
      ?auto_273532 - BLOCK
      ?auto_273533 - BLOCK
    )
    :vars
    (
      ?auto_273534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273533 ?auto_273534 ) ( ON-TABLE ?auto_273523 ) ( not ( = ?auto_273523 ?auto_273524 ) ) ( not ( = ?auto_273523 ?auto_273525 ) ) ( not ( = ?auto_273523 ?auto_273526 ) ) ( not ( = ?auto_273523 ?auto_273527 ) ) ( not ( = ?auto_273523 ?auto_273528 ) ) ( not ( = ?auto_273523 ?auto_273529 ) ) ( not ( = ?auto_273523 ?auto_273530 ) ) ( not ( = ?auto_273523 ?auto_273531 ) ) ( not ( = ?auto_273523 ?auto_273532 ) ) ( not ( = ?auto_273523 ?auto_273533 ) ) ( not ( = ?auto_273523 ?auto_273534 ) ) ( not ( = ?auto_273524 ?auto_273525 ) ) ( not ( = ?auto_273524 ?auto_273526 ) ) ( not ( = ?auto_273524 ?auto_273527 ) ) ( not ( = ?auto_273524 ?auto_273528 ) ) ( not ( = ?auto_273524 ?auto_273529 ) ) ( not ( = ?auto_273524 ?auto_273530 ) ) ( not ( = ?auto_273524 ?auto_273531 ) ) ( not ( = ?auto_273524 ?auto_273532 ) ) ( not ( = ?auto_273524 ?auto_273533 ) ) ( not ( = ?auto_273524 ?auto_273534 ) ) ( not ( = ?auto_273525 ?auto_273526 ) ) ( not ( = ?auto_273525 ?auto_273527 ) ) ( not ( = ?auto_273525 ?auto_273528 ) ) ( not ( = ?auto_273525 ?auto_273529 ) ) ( not ( = ?auto_273525 ?auto_273530 ) ) ( not ( = ?auto_273525 ?auto_273531 ) ) ( not ( = ?auto_273525 ?auto_273532 ) ) ( not ( = ?auto_273525 ?auto_273533 ) ) ( not ( = ?auto_273525 ?auto_273534 ) ) ( not ( = ?auto_273526 ?auto_273527 ) ) ( not ( = ?auto_273526 ?auto_273528 ) ) ( not ( = ?auto_273526 ?auto_273529 ) ) ( not ( = ?auto_273526 ?auto_273530 ) ) ( not ( = ?auto_273526 ?auto_273531 ) ) ( not ( = ?auto_273526 ?auto_273532 ) ) ( not ( = ?auto_273526 ?auto_273533 ) ) ( not ( = ?auto_273526 ?auto_273534 ) ) ( not ( = ?auto_273527 ?auto_273528 ) ) ( not ( = ?auto_273527 ?auto_273529 ) ) ( not ( = ?auto_273527 ?auto_273530 ) ) ( not ( = ?auto_273527 ?auto_273531 ) ) ( not ( = ?auto_273527 ?auto_273532 ) ) ( not ( = ?auto_273527 ?auto_273533 ) ) ( not ( = ?auto_273527 ?auto_273534 ) ) ( not ( = ?auto_273528 ?auto_273529 ) ) ( not ( = ?auto_273528 ?auto_273530 ) ) ( not ( = ?auto_273528 ?auto_273531 ) ) ( not ( = ?auto_273528 ?auto_273532 ) ) ( not ( = ?auto_273528 ?auto_273533 ) ) ( not ( = ?auto_273528 ?auto_273534 ) ) ( not ( = ?auto_273529 ?auto_273530 ) ) ( not ( = ?auto_273529 ?auto_273531 ) ) ( not ( = ?auto_273529 ?auto_273532 ) ) ( not ( = ?auto_273529 ?auto_273533 ) ) ( not ( = ?auto_273529 ?auto_273534 ) ) ( not ( = ?auto_273530 ?auto_273531 ) ) ( not ( = ?auto_273530 ?auto_273532 ) ) ( not ( = ?auto_273530 ?auto_273533 ) ) ( not ( = ?auto_273530 ?auto_273534 ) ) ( not ( = ?auto_273531 ?auto_273532 ) ) ( not ( = ?auto_273531 ?auto_273533 ) ) ( not ( = ?auto_273531 ?auto_273534 ) ) ( not ( = ?auto_273532 ?auto_273533 ) ) ( not ( = ?auto_273532 ?auto_273534 ) ) ( not ( = ?auto_273533 ?auto_273534 ) ) ( ON ?auto_273532 ?auto_273533 ) ( ON ?auto_273531 ?auto_273532 ) ( ON ?auto_273530 ?auto_273531 ) ( ON ?auto_273529 ?auto_273530 ) ( ON ?auto_273528 ?auto_273529 ) ( ON ?auto_273527 ?auto_273528 ) ( ON ?auto_273526 ?auto_273527 ) ( ON ?auto_273525 ?auto_273526 ) ( CLEAR ?auto_273523 ) ( ON ?auto_273524 ?auto_273525 ) ( CLEAR ?auto_273524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_273523 ?auto_273524 )
      ( MAKE-11PILE ?auto_273523 ?auto_273524 ?auto_273525 ?auto_273526 ?auto_273527 ?auto_273528 ?auto_273529 ?auto_273530 ?auto_273531 ?auto_273532 ?auto_273533 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_273546 - BLOCK
      ?auto_273547 - BLOCK
      ?auto_273548 - BLOCK
      ?auto_273549 - BLOCK
      ?auto_273550 - BLOCK
      ?auto_273551 - BLOCK
      ?auto_273552 - BLOCK
      ?auto_273553 - BLOCK
      ?auto_273554 - BLOCK
      ?auto_273555 - BLOCK
      ?auto_273556 - BLOCK
    )
    :vars
    (
      ?auto_273557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273556 ?auto_273557 ) ( ON-TABLE ?auto_273546 ) ( not ( = ?auto_273546 ?auto_273547 ) ) ( not ( = ?auto_273546 ?auto_273548 ) ) ( not ( = ?auto_273546 ?auto_273549 ) ) ( not ( = ?auto_273546 ?auto_273550 ) ) ( not ( = ?auto_273546 ?auto_273551 ) ) ( not ( = ?auto_273546 ?auto_273552 ) ) ( not ( = ?auto_273546 ?auto_273553 ) ) ( not ( = ?auto_273546 ?auto_273554 ) ) ( not ( = ?auto_273546 ?auto_273555 ) ) ( not ( = ?auto_273546 ?auto_273556 ) ) ( not ( = ?auto_273546 ?auto_273557 ) ) ( not ( = ?auto_273547 ?auto_273548 ) ) ( not ( = ?auto_273547 ?auto_273549 ) ) ( not ( = ?auto_273547 ?auto_273550 ) ) ( not ( = ?auto_273547 ?auto_273551 ) ) ( not ( = ?auto_273547 ?auto_273552 ) ) ( not ( = ?auto_273547 ?auto_273553 ) ) ( not ( = ?auto_273547 ?auto_273554 ) ) ( not ( = ?auto_273547 ?auto_273555 ) ) ( not ( = ?auto_273547 ?auto_273556 ) ) ( not ( = ?auto_273547 ?auto_273557 ) ) ( not ( = ?auto_273548 ?auto_273549 ) ) ( not ( = ?auto_273548 ?auto_273550 ) ) ( not ( = ?auto_273548 ?auto_273551 ) ) ( not ( = ?auto_273548 ?auto_273552 ) ) ( not ( = ?auto_273548 ?auto_273553 ) ) ( not ( = ?auto_273548 ?auto_273554 ) ) ( not ( = ?auto_273548 ?auto_273555 ) ) ( not ( = ?auto_273548 ?auto_273556 ) ) ( not ( = ?auto_273548 ?auto_273557 ) ) ( not ( = ?auto_273549 ?auto_273550 ) ) ( not ( = ?auto_273549 ?auto_273551 ) ) ( not ( = ?auto_273549 ?auto_273552 ) ) ( not ( = ?auto_273549 ?auto_273553 ) ) ( not ( = ?auto_273549 ?auto_273554 ) ) ( not ( = ?auto_273549 ?auto_273555 ) ) ( not ( = ?auto_273549 ?auto_273556 ) ) ( not ( = ?auto_273549 ?auto_273557 ) ) ( not ( = ?auto_273550 ?auto_273551 ) ) ( not ( = ?auto_273550 ?auto_273552 ) ) ( not ( = ?auto_273550 ?auto_273553 ) ) ( not ( = ?auto_273550 ?auto_273554 ) ) ( not ( = ?auto_273550 ?auto_273555 ) ) ( not ( = ?auto_273550 ?auto_273556 ) ) ( not ( = ?auto_273550 ?auto_273557 ) ) ( not ( = ?auto_273551 ?auto_273552 ) ) ( not ( = ?auto_273551 ?auto_273553 ) ) ( not ( = ?auto_273551 ?auto_273554 ) ) ( not ( = ?auto_273551 ?auto_273555 ) ) ( not ( = ?auto_273551 ?auto_273556 ) ) ( not ( = ?auto_273551 ?auto_273557 ) ) ( not ( = ?auto_273552 ?auto_273553 ) ) ( not ( = ?auto_273552 ?auto_273554 ) ) ( not ( = ?auto_273552 ?auto_273555 ) ) ( not ( = ?auto_273552 ?auto_273556 ) ) ( not ( = ?auto_273552 ?auto_273557 ) ) ( not ( = ?auto_273553 ?auto_273554 ) ) ( not ( = ?auto_273553 ?auto_273555 ) ) ( not ( = ?auto_273553 ?auto_273556 ) ) ( not ( = ?auto_273553 ?auto_273557 ) ) ( not ( = ?auto_273554 ?auto_273555 ) ) ( not ( = ?auto_273554 ?auto_273556 ) ) ( not ( = ?auto_273554 ?auto_273557 ) ) ( not ( = ?auto_273555 ?auto_273556 ) ) ( not ( = ?auto_273555 ?auto_273557 ) ) ( not ( = ?auto_273556 ?auto_273557 ) ) ( ON ?auto_273555 ?auto_273556 ) ( ON ?auto_273554 ?auto_273555 ) ( ON ?auto_273553 ?auto_273554 ) ( ON ?auto_273552 ?auto_273553 ) ( ON ?auto_273551 ?auto_273552 ) ( ON ?auto_273550 ?auto_273551 ) ( ON ?auto_273549 ?auto_273550 ) ( ON ?auto_273548 ?auto_273549 ) ( CLEAR ?auto_273546 ) ( ON ?auto_273547 ?auto_273548 ) ( CLEAR ?auto_273547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_273546 ?auto_273547 )
      ( MAKE-11PILE ?auto_273546 ?auto_273547 ?auto_273548 ?auto_273549 ?auto_273550 ?auto_273551 ?auto_273552 ?auto_273553 ?auto_273554 ?auto_273555 ?auto_273556 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_273569 - BLOCK
      ?auto_273570 - BLOCK
      ?auto_273571 - BLOCK
      ?auto_273572 - BLOCK
      ?auto_273573 - BLOCK
      ?auto_273574 - BLOCK
      ?auto_273575 - BLOCK
      ?auto_273576 - BLOCK
      ?auto_273577 - BLOCK
      ?auto_273578 - BLOCK
      ?auto_273579 - BLOCK
    )
    :vars
    (
      ?auto_273580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273579 ?auto_273580 ) ( not ( = ?auto_273569 ?auto_273570 ) ) ( not ( = ?auto_273569 ?auto_273571 ) ) ( not ( = ?auto_273569 ?auto_273572 ) ) ( not ( = ?auto_273569 ?auto_273573 ) ) ( not ( = ?auto_273569 ?auto_273574 ) ) ( not ( = ?auto_273569 ?auto_273575 ) ) ( not ( = ?auto_273569 ?auto_273576 ) ) ( not ( = ?auto_273569 ?auto_273577 ) ) ( not ( = ?auto_273569 ?auto_273578 ) ) ( not ( = ?auto_273569 ?auto_273579 ) ) ( not ( = ?auto_273569 ?auto_273580 ) ) ( not ( = ?auto_273570 ?auto_273571 ) ) ( not ( = ?auto_273570 ?auto_273572 ) ) ( not ( = ?auto_273570 ?auto_273573 ) ) ( not ( = ?auto_273570 ?auto_273574 ) ) ( not ( = ?auto_273570 ?auto_273575 ) ) ( not ( = ?auto_273570 ?auto_273576 ) ) ( not ( = ?auto_273570 ?auto_273577 ) ) ( not ( = ?auto_273570 ?auto_273578 ) ) ( not ( = ?auto_273570 ?auto_273579 ) ) ( not ( = ?auto_273570 ?auto_273580 ) ) ( not ( = ?auto_273571 ?auto_273572 ) ) ( not ( = ?auto_273571 ?auto_273573 ) ) ( not ( = ?auto_273571 ?auto_273574 ) ) ( not ( = ?auto_273571 ?auto_273575 ) ) ( not ( = ?auto_273571 ?auto_273576 ) ) ( not ( = ?auto_273571 ?auto_273577 ) ) ( not ( = ?auto_273571 ?auto_273578 ) ) ( not ( = ?auto_273571 ?auto_273579 ) ) ( not ( = ?auto_273571 ?auto_273580 ) ) ( not ( = ?auto_273572 ?auto_273573 ) ) ( not ( = ?auto_273572 ?auto_273574 ) ) ( not ( = ?auto_273572 ?auto_273575 ) ) ( not ( = ?auto_273572 ?auto_273576 ) ) ( not ( = ?auto_273572 ?auto_273577 ) ) ( not ( = ?auto_273572 ?auto_273578 ) ) ( not ( = ?auto_273572 ?auto_273579 ) ) ( not ( = ?auto_273572 ?auto_273580 ) ) ( not ( = ?auto_273573 ?auto_273574 ) ) ( not ( = ?auto_273573 ?auto_273575 ) ) ( not ( = ?auto_273573 ?auto_273576 ) ) ( not ( = ?auto_273573 ?auto_273577 ) ) ( not ( = ?auto_273573 ?auto_273578 ) ) ( not ( = ?auto_273573 ?auto_273579 ) ) ( not ( = ?auto_273573 ?auto_273580 ) ) ( not ( = ?auto_273574 ?auto_273575 ) ) ( not ( = ?auto_273574 ?auto_273576 ) ) ( not ( = ?auto_273574 ?auto_273577 ) ) ( not ( = ?auto_273574 ?auto_273578 ) ) ( not ( = ?auto_273574 ?auto_273579 ) ) ( not ( = ?auto_273574 ?auto_273580 ) ) ( not ( = ?auto_273575 ?auto_273576 ) ) ( not ( = ?auto_273575 ?auto_273577 ) ) ( not ( = ?auto_273575 ?auto_273578 ) ) ( not ( = ?auto_273575 ?auto_273579 ) ) ( not ( = ?auto_273575 ?auto_273580 ) ) ( not ( = ?auto_273576 ?auto_273577 ) ) ( not ( = ?auto_273576 ?auto_273578 ) ) ( not ( = ?auto_273576 ?auto_273579 ) ) ( not ( = ?auto_273576 ?auto_273580 ) ) ( not ( = ?auto_273577 ?auto_273578 ) ) ( not ( = ?auto_273577 ?auto_273579 ) ) ( not ( = ?auto_273577 ?auto_273580 ) ) ( not ( = ?auto_273578 ?auto_273579 ) ) ( not ( = ?auto_273578 ?auto_273580 ) ) ( not ( = ?auto_273579 ?auto_273580 ) ) ( ON ?auto_273578 ?auto_273579 ) ( ON ?auto_273577 ?auto_273578 ) ( ON ?auto_273576 ?auto_273577 ) ( ON ?auto_273575 ?auto_273576 ) ( ON ?auto_273574 ?auto_273575 ) ( ON ?auto_273573 ?auto_273574 ) ( ON ?auto_273572 ?auto_273573 ) ( ON ?auto_273571 ?auto_273572 ) ( ON ?auto_273570 ?auto_273571 ) ( ON ?auto_273569 ?auto_273570 ) ( CLEAR ?auto_273569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_273569 )
      ( MAKE-11PILE ?auto_273569 ?auto_273570 ?auto_273571 ?auto_273572 ?auto_273573 ?auto_273574 ?auto_273575 ?auto_273576 ?auto_273577 ?auto_273578 ?auto_273579 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_273592 - BLOCK
      ?auto_273593 - BLOCK
      ?auto_273594 - BLOCK
      ?auto_273595 - BLOCK
      ?auto_273596 - BLOCK
      ?auto_273597 - BLOCK
      ?auto_273598 - BLOCK
      ?auto_273599 - BLOCK
      ?auto_273600 - BLOCK
      ?auto_273601 - BLOCK
      ?auto_273602 - BLOCK
    )
    :vars
    (
      ?auto_273603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273602 ?auto_273603 ) ( not ( = ?auto_273592 ?auto_273593 ) ) ( not ( = ?auto_273592 ?auto_273594 ) ) ( not ( = ?auto_273592 ?auto_273595 ) ) ( not ( = ?auto_273592 ?auto_273596 ) ) ( not ( = ?auto_273592 ?auto_273597 ) ) ( not ( = ?auto_273592 ?auto_273598 ) ) ( not ( = ?auto_273592 ?auto_273599 ) ) ( not ( = ?auto_273592 ?auto_273600 ) ) ( not ( = ?auto_273592 ?auto_273601 ) ) ( not ( = ?auto_273592 ?auto_273602 ) ) ( not ( = ?auto_273592 ?auto_273603 ) ) ( not ( = ?auto_273593 ?auto_273594 ) ) ( not ( = ?auto_273593 ?auto_273595 ) ) ( not ( = ?auto_273593 ?auto_273596 ) ) ( not ( = ?auto_273593 ?auto_273597 ) ) ( not ( = ?auto_273593 ?auto_273598 ) ) ( not ( = ?auto_273593 ?auto_273599 ) ) ( not ( = ?auto_273593 ?auto_273600 ) ) ( not ( = ?auto_273593 ?auto_273601 ) ) ( not ( = ?auto_273593 ?auto_273602 ) ) ( not ( = ?auto_273593 ?auto_273603 ) ) ( not ( = ?auto_273594 ?auto_273595 ) ) ( not ( = ?auto_273594 ?auto_273596 ) ) ( not ( = ?auto_273594 ?auto_273597 ) ) ( not ( = ?auto_273594 ?auto_273598 ) ) ( not ( = ?auto_273594 ?auto_273599 ) ) ( not ( = ?auto_273594 ?auto_273600 ) ) ( not ( = ?auto_273594 ?auto_273601 ) ) ( not ( = ?auto_273594 ?auto_273602 ) ) ( not ( = ?auto_273594 ?auto_273603 ) ) ( not ( = ?auto_273595 ?auto_273596 ) ) ( not ( = ?auto_273595 ?auto_273597 ) ) ( not ( = ?auto_273595 ?auto_273598 ) ) ( not ( = ?auto_273595 ?auto_273599 ) ) ( not ( = ?auto_273595 ?auto_273600 ) ) ( not ( = ?auto_273595 ?auto_273601 ) ) ( not ( = ?auto_273595 ?auto_273602 ) ) ( not ( = ?auto_273595 ?auto_273603 ) ) ( not ( = ?auto_273596 ?auto_273597 ) ) ( not ( = ?auto_273596 ?auto_273598 ) ) ( not ( = ?auto_273596 ?auto_273599 ) ) ( not ( = ?auto_273596 ?auto_273600 ) ) ( not ( = ?auto_273596 ?auto_273601 ) ) ( not ( = ?auto_273596 ?auto_273602 ) ) ( not ( = ?auto_273596 ?auto_273603 ) ) ( not ( = ?auto_273597 ?auto_273598 ) ) ( not ( = ?auto_273597 ?auto_273599 ) ) ( not ( = ?auto_273597 ?auto_273600 ) ) ( not ( = ?auto_273597 ?auto_273601 ) ) ( not ( = ?auto_273597 ?auto_273602 ) ) ( not ( = ?auto_273597 ?auto_273603 ) ) ( not ( = ?auto_273598 ?auto_273599 ) ) ( not ( = ?auto_273598 ?auto_273600 ) ) ( not ( = ?auto_273598 ?auto_273601 ) ) ( not ( = ?auto_273598 ?auto_273602 ) ) ( not ( = ?auto_273598 ?auto_273603 ) ) ( not ( = ?auto_273599 ?auto_273600 ) ) ( not ( = ?auto_273599 ?auto_273601 ) ) ( not ( = ?auto_273599 ?auto_273602 ) ) ( not ( = ?auto_273599 ?auto_273603 ) ) ( not ( = ?auto_273600 ?auto_273601 ) ) ( not ( = ?auto_273600 ?auto_273602 ) ) ( not ( = ?auto_273600 ?auto_273603 ) ) ( not ( = ?auto_273601 ?auto_273602 ) ) ( not ( = ?auto_273601 ?auto_273603 ) ) ( not ( = ?auto_273602 ?auto_273603 ) ) ( ON ?auto_273601 ?auto_273602 ) ( ON ?auto_273600 ?auto_273601 ) ( ON ?auto_273599 ?auto_273600 ) ( ON ?auto_273598 ?auto_273599 ) ( ON ?auto_273597 ?auto_273598 ) ( ON ?auto_273596 ?auto_273597 ) ( ON ?auto_273595 ?auto_273596 ) ( ON ?auto_273594 ?auto_273595 ) ( ON ?auto_273593 ?auto_273594 ) ( ON ?auto_273592 ?auto_273593 ) ( CLEAR ?auto_273592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_273592 )
      ( MAKE-11PILE ?auto_273592 ?auto_273593 ?auto_273594 ?auto_273595 ?auto_273596 ?auto_273597 ?auto_273598 ?auto_273599 ?auto_273600 ?auto_273601 ?auto_273602 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_273616 - BLOCK
      ?auto_273617 - BLOCK
      ?auto_273618 - BLOCK
      ?auto_273619 - BLOCK
      ?auto_273620 - BLOCK
      ?auto_273621 - BLOCK
      ?auto_273622 - BLOCK
      ?auto_273623 - BLOCK
      ?auto_273624 - BLOCK
      ?auto_273625 - BLOCK
      ?auto_273626 - BLOCK
      ?auto_273627 - BLOCK
    )
    :vars
    (
      ?auto_273628 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_273626 ) ( ON ?auto_273627 ?auto_273628 ) ( CLEAR ?auto_273627 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_273616 ) ( ON ?auto_273617 ?auto_273616 ) ( ON ?auto_273618 ?auto_273617 ) ( ON ?auto_273619 ?auto_273618 ) ( ON ?auto_273620 ?auto_273619 ) ( ON ?auto_273621 ?auto_273620 ) ( ON ?auto_273622 ?auto_273621 ) ( ON ?auto_273623 ?auto_273622 ) ( ON ?auto_273624 ?auto_273623 ) ( ON ?auto_273625 ?auto_273624 ) ( ON ?auto_273626 ?auto_273625 ) ( not ( = ?auto_273616 ?auto_273617 ) ) ( not ( = ?auto_273616 ?auto_273618 ) ) ( not ( = ?auto_273616 ?auto_273619 ) ) ( not ( = ?auto_273616 ?auto_273620 ) ) ( not ( = ?auto_273616 ?auto_273621 ) ) ( not ( = ?auto_273616 ?auto_273622 ) ) ( not ( = ?auto_273616 ?auto_273623 ) ) ( not ( = ?auto_273616 ?auto_273624 ) ) ( not ( = ?auto_273616 ?auto_273625 ) ) ( not ( = ?auto_273616 ?auto_273626 ) ) ( not ( = ?auto_273616 ?auto_273627 ) ) ( not ( = ?auto_273616 ?auto_273628 ) ) ( not ( = ?auto_273617 ?auto_273618 ) ) ( not ( = ?auto_273617 ?auto_273619 ) ) ( not ( = ?auto_273617 ?auto_273620 ) ) ( not ( = ?auto_273617 ?auto_273621 ) ) ( not ( = ?auto_273617 ?auto_273622 ) ) ( not ( = ?auto_273617 ?auto_273623 ) ) ( not ( = ?auto_273617 ?auto_273624 ) ) ( not ( = ?auto_273617 ?auto_273625 ) ) ( not ( = ?auto_273617 ?auto_273626 ) ) ( not ( = ?auto_273617 ?auto_273627 ) ) ( not ( = ?auto_273617 ?auto_273628 ) ) ( not ( = ?auto_273618 ?auto_273619 ) ) ( not ( = ?auto_273618 ?auto_273620 ) ) ( not ( = ?auto_273618 ?auto_273621 ) ) ( not ( = ?auto_273618 ?auto_273622 ) ) ( not ( = ?auto_273618 ?auto_273623 ) ) ( not ( = ?auto_273618 ?auto_273624 ) ) ( not ( = ?auto_273618 ?auto_273625 ) ) ( not ( = ?auto_273618 ?auto_273626 ) ) ( not ( = ?auto_273618 ?auto_273627 ) ) ( not ( = ?auto_273618 ?auto_273628 ) ) ( not ( = ?auto_273619 ?auto_273620 ) ) ( not ( = ?auto_273619 ?auto_273621 ) ) ( not ( = ?auto_273619 ?auto_273622 ) ) ( not ( = ?auto_273619 ?auto_273623 ) ) ( not ( = ?auto_273619 ?auto_273624 ) ) ( not ( = ?auto_273619 ?auto_273625 ) ) ( not ( = ?auto_273619 ?auto_273626 ) ) ( not ( = ?auto_273619 ?auto_273627 ) ) ( not ( = ?auto_273619 ?auto_273628 ) ) ( not ( = ?auto_273620 ?auto_273621 ) ) ( not ( = ?auto_273620 ?auto_273622 ) ) ( not ( = ?auto_273620 ?auto_273623 ) ) ( not ( = ?auto_273620 ?auto_273624 ) ) ( not ( = ?auto_273620 ?auto_273625 ) ) ( not ( = ?auto_273620 ?auto_273626 ) ) ( not ( = ?auto_273620 ?auto_273627 ) ) ( not ( = ?auto_273620 ?auto_273628 ) ) ( not ( = ?auto_273621 ?auto_273622 ) ) ( not ( = ?auto_273621 ?auto_273623 ) ) ( not ( = ?auto_273621 ?auto_273624 ) ) ( not ( = ?auto_273621 ?auto_273625 ) ) ( not ( = ?auto_273621 ?auto_273626 ) ) ( not ( = ?auto_273621 ?auto_273627 ) ) ( not ( = ?auto_273621 ?auto_273628 ) ) ( not ( = ?auto_273622 ?auto_273623 ) ) ( not ( = ?auto_273622 ?auto_273624 ) ) ( not ( = ?auto_273622 ?auto_273625 ) ) ( not ( = ?auto_273622 ?auto_273626 ) ) ( not ( = ?auto_273622 ?auto_273627 ) ) ( not ( = ?auto_273622 ?auto_273628 ) ) ( not ( = ?auto_273623 ?auto_273624 ) ) ( not ( = ?auto_273623 ?auto_273625 ) ) ( not ( = ?auto_273623 ?auto_273626 ) ) ( not ( = ?auto_273623 ?auto_273627 ) ) ( not ( = ?auto_273623 ?auto_273628 ) ) ( not ( = ?auto_273624 ?auto_273625 ) ) ( not ( = ?auto_273624 ?auto_273626 ) ) ( not ( = ?auto_273624 ?auto_273627 ) ) ( not ( = ?auto_273624 ?auto_273628 ) ) ( not ( = ?auto_273625 ?auto_273626 ) ) ( not ( = ?auto_273625 ?auto_273627 ) ) ( not ( = ?auto_273625 ?auto_273628 ) ) ( not ( = ?auto_273626 ?auto_273627 ) ) ( not ( = ?auto_273626 ?auto_273628 ) ) ( not ( = ?auto_273627 ?auto_273628 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_273627 ?auto_273628 )
      ( !STACK ?auto_273627 ?auto_273626 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_273641 - BLOCK
      ?auto_273642 - BLOCK
      ?auto_273643 - BLOCK
      ?auto_273644 - BLOCK
      ?auto_273645 - BLOCK
      ?auto_273646 - BLOCK
      ?auto_273647 - BLOCK
      ?auto_273648 - BLOCK
      ?auto_273649 - BLOCK
      ?auto_273650 - BLOCK
      ?auto_273651 - BLOCK
      ?auto_273652 - BLOCK
    )
    :vars
    (
      ?auto_273653 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_273651 ) ( ON ?auto_273652 ?auto_273653 ) ( CLEAR ?auto_273652 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_273641 ) ( ON ?auto_273642 ?auto_273641 ) ( ON ?auto_273643 ?auto_273642 ) ( ON ?auto_273644 ?auto_273643 ) ( ON ?auto_273645 ?auto_273644 ) ( ON ?auto_273646 ?auto_273645 ) ( ON ?auto_273647 ?auto_273646 ) ( ON ?auto_273648 ?auto_273647 ) ( ON ?auto_273649 ?auto_273648 ) ( ON ?auto_273650 ?auto_273649 ) ( ON ?auto_273651 ?auto_273650 ) ( not ( = ?auto_273641 ?auto_273642 ) ) ( not ( = ?auto_273641 ?auto_273643 ) ) ( not ( = ?auto_273641 ?auto_273644 ) ) ( not ( = ?auto_273641 ?auto_273645 ) ) ( not ( = ?auto_273641 ?auto_273646 ) ) ( not ( = ?auto_273641 ?auto_273647 ) ) ( not ( = ?auto_273641 ?auto_273648 ) ) ( not ( = ?auto_273641 ?auto_273649 ) ) ( not ( = ?auto_273641 ?auto_273650 ) ) ( not ( = ?auto_273641 ?auto_273651 ) ) ( not ( = ?auto_273641 ?auto_273652 ) ) ( not ( = ?auto_273641 ?auto_273653 ) ) ( not ( = ?auto_273642 ?auto_273643 ) ) ( not ( = ?auto_273642 ?auto_273644 ) ) ( not ( = ?auto_273642 ?auto_273645 ) ) ( not ( = ?auto_273642 ?auto_273646 ) ) ( not ( = ?auto_273642 ?auto_273647 ) ) ( not ( = ?auto_273642 ?auto_273648 ) ) ( not ( = ?auto_273642 ?auto_273649 ) ) ( not ( = ?auto_273642 ?auto_273650 ) ) ( not ( = ?auto_273642 ?auto_273651 ) ) ( not ( = ?auto_273642 ?auto_273652 ) ) ( not ( = ?auto_273642 ?auto_273653 ) ) ( not ( = ?auto_273643 ?auto_273644 ) ) ( not ( = ?auto_273643 ?auto_273645 ) ) ( not ( = ?auto_273643 ?auto_273646 ) ) ( not ( = ?auto_273643 ?auto_273647 ) ) ( not ( = ?auto_273643 ?auto_273648 ) ) ( not ( = ?auto_273643 ?auto_273649 ) ) ( not ( = ?auto_273643 ?auto_273650 ) ) ( not ( = ?auto_273643 ?auto_273651 ) ) ( not ( = ?auto_273643 ?auto_273652 ) ) ( not ( = ?auto_273643 ?auto_273653 ) ) ( not ( = ?auto_273644 ?auto_273645 ) ) ( not ( = ?auto_273644 ?auto_273646 ) ) ( not ( = ?auto_273644 ?auto_273647 ) ) ( not ( = ?auto_273644 ?auto_273648 ) ) ( not ( = ?auto_273644 ?auto_273649 ) ) ( not ( = ?auto_273644 ?auto_273650 ) ) ( not ( = ?auto_273644 ?auto_273651 ) ) ( not ( = ?auto_273644 ?auto_273652 ) ) ( not ( = ?auto_273644 ?auto_273653 ) ) ( not ( = ?auto_273645 ?auto_273646 ) ) ( not ( = ?auto_273645 ?auto_273647 ) ) ( not ( = ?auto_273645 ?auto_273648 ) ) ( not ( = ?auto_273645 ?auto_273649 ) ) ( not ( = ?auto_273645 ?auto_273650 ) ) ( not ( = ?auto_273645 ?auto_273651 ) ) ( not ( = ?auto_273645 ?auto_273652 ) ) ( not ( = ?auto_273645 ?auto_273653 ) ) ( not ( = ?auto_273646 ?auto_273647 ) ) ( not ( = ?auto_273646 ?auto_273648 ) ) ( not ( = ?auto_273646 ?auto_273649 ) ) ( not ( = ?auto_273646 ?auto_273650 ) ) ( not ( = ?auto_273646 ?auto_273651 ) ) ( not ( = ?auto_273646 ?auto_273652 ) ) ( not ( = ?auto_273646 ?auto_273653 ) ) ( not ( = ?auto_273647 ?auto_273648 ) ) ( not ( = ?auto_273647 ?auto_273649 ) ) ( not ( = ?auto_273647 ?auto_273650 ) ) ( not ( = ?auto_273647 ?auto_273651 ) ) ( not ( = ?auto_273647 ?auto_273652 ) ) ( not ( = ?auto_273647 ?auto_273653 ) ) ( not ( = ?auto_273648 ?auto_273649 ) ) ( not ( = ?auto_273648 ?auto_273650 ) ) ( not ( = ?auto_273648 ?auto_273651 ) ) ( not ( = ?auto_273648 ?auto_273652 ) ) ( not ( = ?auto_273648 ?auto_273653 ) ) ( not ( = ?auto_273649 ?auto_273650 ) ) ( not ( = ?auto_273649 ?auto_273651 ) ) ( not ( = ?auto_273649 ?auto_273652 ) ) ( not ( = ?auto_273649 ?auto_273653 ) ) ( not ( = ?auto_273650 ?auto_273651 ) ) ( not ( = ?auto_273650 ?auto_273652 ) ) ( not ( = ?auto_273650 ?auto_273653 ) ) ( not ( = ?auto_273651 ?auto_273652 ) ) ( not ( = ?auto_273651 ?auto_273653 ) ) ( not ( = ?auto_273652 ?auto_273653 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_273652 ?auto_273653 )
      ( !STACK ?auto_273652 ?auto_273651 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_273666 - BLOCK
      ?auto_273667 - BLOCK
      ?auto_273668 - BLOCK
      ?auto_273669 - BLOCK
      ?auto_273670 - BLOCK
      ?auto_273671 - BLOCK
      ?auto_273672 - BLOCK
      ?auto_273673 - BLOCK
      ?auto_273674 - BLOCK
      ?auto_273675 - BLOCK
      ?auto_273676 - BLOCK
      ?auto_273677 - BLOCK
    )
    :vars
    (
      ?auto_273678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273677 ?auto_273678 ) ( ON-TABLE ?auto_273666 ) ( ON ?auto_273667 ?auto_273666 ) ( ON ?auto_273668 ?auto_273667 ) ( ON ?auto_273669 ?auto_273668 ) ( ON ?auto_273670 ?auto_273669 ) ( ON ?auto_273671 ?auto_273670 ) ( ON ?auto_273672 ?auto_273671 ) ( ON ?auto_273673 ?auto_273672 ) ( ON ?auto_273674 ?auto_273673 ) ( ON ?auto_273675 ?auto_273674 ) ( not ( = ?auto_273666 ?auto_273667 ) ) ( not ( = ?auto_273666 ?auto_273668 ) ) ( not ( = ?auto_273666 ?auto_273669 ) ) ( not ( = ?auto_273666 ?auto_273670 ) ) ( not ( = ?auto_273666 ?auto_273671 ) ) ( not ( = ?auto_273666 ?auto_273672 ) ) ( not ( = ?auto_273666 ?auto_273673 ) ) ( not ( = ?auto_273666 ?auto_273674 ) ) ( not ( = ?auto_273666 ?auto_273675 ) ) ( not ( = ?auto_273666 ?auto_273676 ) ) ( not ( = ?auto_273666 ?auto_273677 ) ) ( not ( = ?auto_273666 ?auto_273678 ) ) ( not ( = ?auto_273667 ?auto_273668 ) ) ( not ( = ?auto_273667 ?auto_273669 ) ) ( not ( = ?auto_273667 ?auto_273670 ) ) ( not ( = ?auto_273667 ?auto_273671 ) ) ( not ( = ?auto_273667 ?auto_273672 ) ) ( not ( = ?auto_273667 ?auto_273673 ) ) ( not ( = ?auto_273667 ?auto_273674 ) ) ( not ( = ?auto_273667 ?auto_273675 ) ) ( not ( = ?auto_273667 ?auto_273676 ) ) ( not ( = ?auto_273667 ?auto_273677 ) ) ( not ( = ?auto_273667 ?auto_273678 ) ) ( not ( = ?auto_273668 ?auto_273669 ) ) ( not ( = ?auto_273668 ?auto_273670 ) ) ( not ( = ?auto_273668 ?auto_273671 ) ) ( not ( = ?auto_273668 ?auto_273672 ) ) ( not ( = ?auto_273668 ?auto_273673 ) ) ( not ( = ?auto_273668 ?auto_273674 ) ) ( not ( = ?auto_273668 ?auto_273675 ) ) ( not ( = ?auto_273668 ?auto_273676 ) ) ( not ( = ?auto_273668 ?auto_273677 ) ) ( not ( = ?auto_273668 ?auto_273678 ) ) ( not ( = ?auto_273669 ?auto_273670 ) ) ( not ( = ?auto_273669 ?auto_273671 ) ) ( not ( = ?auto_273669 ?auto_273672 ) ) ( not ( = ?auto_273669 ?auto_273673 ) ) ( not ( = ?auto_273669 ?auto_273674 ) ) ( not ( = ?auto_273669 ?auto_273675 ) ) ( not ( = ?auto_273669 ?auto_273676 ) ) ( not ( = ?auto_273669 ?auto_273677 ) ) ( not ( = ?auto_273669 ?auto_273678 ) ) ( not ( = ?auto_273670 ?auto_273671 ) ) ( not ( = ?auto_273670 ?auto_273672 ) ) ( not ( = ?auto_273670 ?auto_273673 ) ) ( not ( = ?auto_273670 ?auto_273674 ) ) ( not ( = ?auto_273670 ?auto_273675 ) ) ( not ( = ?auto_273670 ?auto_273676 ) ) ( not ( = ?auto_273670 ?auto_273677 ) ) ( not ( = ?auto_273670 ?auto_273678 ) ) ( not ( = ?auto_273671 ?auto_273672 ) ) ( not ( = ?auto_273671 ?auto_273673 ) ) ( not ( = ?auto_273671 ?auto_273674 ) ) ( not ( = ?auto_273671 ?auto_273675 ) ) ( not ( = ?auto_273671 ?auto_273676 ) ) ( not ( = ?auto_273671 ?auto_273677 ) ) ( not ( = ?auto_273671 ?auto_273678 ) ) ( not ( = ?auto_273672 ?auto_273673 ) ) ( not ( = ?auto_273672 ?auto_273674 ) ) ( not ( = ?auto_273672 ?auto_273675 ) ) ( not ( = ?auto_273672 ?auto_273676 ) ) ( not ( = ?auto_273672 ?auto_273677 ) ) ( not ( = ?auto_273672 ?auto_273678 ) ) ( not ( = ?auto_273673 ?auto_273674 ) ) ( not ( = ?auto_273673 ?auto_273675 ) ) ( not ( = ?auto_273673 ?auto_273676 ) ) ( not ( = ?auto_273673 ?auto_273677 ) ) ( not ( = ?auto_273673 ?auto_273678 ) ) ( not ( = ?auto_273674 ?auto_273675 ) ) ( not ( = ?auto_273674 ?auto_273676 ) ) ( not ( = ?auto_273674 ?auto_273677 ) ) ( not ( = ?auto_273674 ?auto_273678 ) ) ( not ( = ?auto_273675 ?auto_273676 ) ) ( not ( = ?auto_273675 ?auto_273677 ) ) ( not ( = ?auto_273675 ?auto_273678 ) ) ( not ( = ?auto_273676 ?auto_273677 ) ) ( not ( = ?auto_273676 ?auto_273678 ) ) ( not ( = ?auto_273677 ?auto_273678 ) ) ( CLEAR ?auto_273675 ) ( ON ?auto_273676 ?auto_273677 ) ( CLEAR ?auto_273676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_273666 ?auto_273667 ?auto_273668 ?auto_273669 ?auto_273670 ?auto_273671 ?auto_273672 ?auto_273673 ?auto_273674 ?auto_273675 ?auto_273676 )
      ( MAKE-12PILE ?auto_273666 ?auto_273667 ?auto_273668 ?auto_273669 ?auto_273670 ?auto_273671 ?auto_273672 ?auto_273673 ?auto_273674 ?auto_273675 ?auto_273676 ?auto_273677 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_273691 - BLOCK
      ?auto_273692 - BLOCK
      ?auto_273693 - BLOCK
      ?auto_273694 - BLOCK
      ?auto_273695 - BLOCK
      ?auto_273696 - BLOCK
      ?auto_273697 - BLOCK
      ?auto_273698 - BLOCK
      ?auto_273699 - BLOCK
      ?auto_273700 - BLOCK
      ?auto_273701 - BLOCK
      ?auto_273702 - BLOCK
    )
    :vars
    (
      ?auto_273703 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273702 ?auto_273703 ) ( ON-TABLE ?auto_273691 ) ( ON ?auto_273692 ?auto_273691 ) ( ON ?auto_273693 ?auto_273692 ) ( ON ?auto_273694 ?auto_273693 ) ( ON ?auto_273695 ?auto_273694 ) ( ON ?auto_273696 ?auto_273695 ) ( ON ?auto_273697 ?auto_273696 ) ( ON ?auto_273698 ?auto_273697 ) ( ON ?auto_273699 ?auto_273698 ) ( ON ?auto_273700 ?auto_273699 ) ( not ( = ?auto_273691 ?auto_273692 ) ) ( not ( = ?auto_273691 ?auto_273693 ) ) ( not ( = ?auto_273691 ?auto_273694 ) ) ( not ( = ?auto_273691 ?auto_273695 ) ) ( not ( = ?auto_273691 ?auto_273696 ) ) ( not ( = ?auto_273691 ?auto_273697 ) ) ( not ( = ?auto_273691 ?auto_273698 ) ) ( not ( = ?auto_273691 ?auto_273699 ) ) ( not ( = ?auto_273691 ?auto_273700 ) ) ( not ( = ?auto_273691 ?auto_273701 ) ) ( not ( = ?auto_273691 ?auto_273702 ) ) ( not ( = ?auto_273691 ?auto_273703 ) ) ( not ( = ?auto_273692 ?auto_273693 ) ) ( not ( = ?auto_273692 ?auto_273694 ) ) ( not ( = ?auto_273692 ?auto_273695 ) ) ( not ( = ?auto_273692 ?auto_273696 ) ) ( not ( = ?auto_273692 ?auto_273697 ) ) ( not ( = ?auto_273692 ?auto_273698 ) ) ( not ( = ?auto_273692 ?auto_273699 ) ) ( not ( = ?auto_273692 ?auto_273700 ) ) ( not ( = ?auto_273692 ?auto_273701 ) ) ( not ( = ?auto_273692 ?auto_273702 ) ) ( not ( = ?auto_273692 ?auto_273703 ) ) ( not ( = ?auto_273693 ?auto_273694 ) ) ( not ( = ?auto_273693 ?auto_273695 ) ) ( not ( = ?auto_273693 ?auto_273696 ) ) ( not ( = ?auto_273693 ?auto_273697 ) ) ( not ( = ?auto_273693 ?auto_273698 ) ) ( not ( = ?auto_273693 ?auto_273699 ) ) ( not ( = ?auto_273693 ?auto_273700 ) ) ( not ( = ?auto_273693 ?auto_273701 ) ) ( not ( = ?auto_273693 ?auto_273702 ) ) ( not ( = ?auto_273693 ?auto_273703 ) ) ( not ( = ?auto_273694 ?auto_273695 ) ) ( not ( = ?auto_273694 ?auto_273696 ) ) ( not ( = ?auto_273694 ?auto_273697 ) ) ( not ( = ?auto_273694 ?auto_273698 ) ) ( not ( = ?auto_273694 ?auto_273699 ) ) ( not ( = ?auto_273694 ?auto_273700 ) ) ( not ( = ?auto_273694 ?auto_273701 ) ) ( not ( = ?auto_273694 ?auto_273702 ) ) ( not ( = ?auto_273694 ?auto_273703 ) ) ( not ( = ?auto_273695 ?auto_273696 ) ) ( not ( = ?auto_273695 ?auto_273697 ) ) ( not ( = ?auto_273695 ?auto_273698 ) ) ( not ( = ?auto_273695 ?auto_273699 ) ) ( not ( = ?auto_273695 ?auto_273700 ) ) ( not ( = ?auto_273695 ?auto_273701 ) ) ( not ( = ?auto_273695 ?auto_273702 ) ) ( not ( = ?auto_273695 ?auto_273703 ) ) ( not ( = ?auto_273696 ?auto_273697 ) ) ( not ( = ?auto_273696 ?auto_273698 ) ) ( not ( = ?auto_273696 ?auto_273699 ) ) ( not ( = ?auto_273696 ?auto_273700 ) ) ( not ( = ?auto_273696 ?auto_273701 ) ) ( not ( = ?auto_273696 ?auto_273702 ) ) ( not ( = ?auto_273696 ?auto_273703 ) ) ( not ( = ?auto_273697 ?auto_273698 ) ) ( not ( = ?auto_273697 ?auto_273699 ) ) ( not ( = ?auto_273697 ?auto_273700 ) ) ( not ( = ?auto_273697 ?auto_273701 ) ) ( not ( = ?auto_273697 ?auto_273702 ) ) ( not ( = ?auto_273697 ?auto_273703 ) ) ( not ( = ?auto_273698 ?auto_273699 ) ) ( not ( = ?auto_273698 ?auto_273700 ) ) ( not ( = ?auto_273698 ?auto_273701 ) ) ( not ( = ?auto_273698 ?auto_273702 ) ) ( not ( = ?auto_273698 ?auto_273703 ) ) ( not ( = ?auto_273699 ?auto_273700 ) ) ( not ( = ?auto_273699 ?auto_273701 ) ) ( not ( = ?auto_273699 ?auto_273702 ) ) ( not ( = ?auto_273699 ?auto_273703 ) ) ( not ( = ?auto_273700 ?auto_273701 ) ) ( not ( = ?auto_273700 ?auto_273702 ) ) ( not ( = ?auto_273700 ?auto_273703 ) ) ( not ( = ?auto_273701 ?auto_273702 ) ) ( not ( = ?auto_273701 ?auto_273703 ) ) ( not ( = ?auto_273702 ?auto_273703 ) ) ( CLEAR ?auto_273700 ) ( ON ?auto_273701 ?auto_273702 ) ( CLEAR ?auto_273701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_273691 ?auto_273692 ?auto_273693 ?auto_273694 ?auto_273695 ?auto_273696 ?auto_273697 ?auto_273698 ?auto_273699 ?auto_273700 ?auto_273701 )
      ( MAKE-12PILE ?auto_273691 ?auto_273692 ?auto_273693 ?auto_273694 ?auto_273695 ?auto_273696 ?auto_273697 ?auto_273698 ?auto_273699 ?auto_273700 ?auto_273701 ?auto_273702 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_273716 - BLOCK
      ?auto_273717 - BLOCK
      ?auto_273718 - BLOCK
      ?auto_273719 - BLOCK
      ?auto_273720 - BLOCK
      ?auto_273721 - BLOCK
      ?auto_273722 - BLOCK
      ?auto_273723 - BLOCK
      ?auto_273724 - BLOCK
      ?auto_273725 - BLOCK
      ?auto_273726 - BLOCK
      ?auto_273727 - BLOCK
    )
    :vars
    (
      ?auto_273728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273727 ?auto_273728 ) ( ON-TABLE ?auto_273716 ) ( ON ?auto_273717 ?auto_273716 ) ( ON ?auto_273718 ?auto_273717 ) ( ON ?auto_273719 ?auto_273718 ) ( ON ?auto_273720 ?auto_273719 ) ( ON ?auto_273721 ?auto_273720 ) ( ON ?auto_273722 ?auto_273721 ) ( ON ?auto_273723 ?auto_273722 ) ( ON ?auto_273724 ?auto_273723 ) ( not ( = ?auto_273716 ?auto_273717 ) ) ( not ( = ?auto_273716 ?auto_273718 ) ) ( not ( = ?auto_273716 ?auto_273719 ) ) ( not ( = ?auto_273716 ?auto_273720 ) ) ( not ( = ?auto_273716 ?auto_273721 ) ) ( not ( = ?auto_273716 ?auto_273722 ) ) ( not ( = ?auto_273716 ?auto_273723 ) ) ( not ( = ?auto_273716 ?auto_273724 ) ) ( not ( = ?auto_273716 ?auto_273725 ) ) ( not ( = ?auto_273716 ?auto_273726 ) ) ( not ( = ?auto_273716 ?auto_273727 ) ) ( not ( = ?auto_273716 ?auto_273728 ) ) ( not ( = ?auto_273717 ?auto_273718 ) ) ( not ( = ?auto_273717 ?auto_273719 ) ) ( not ( = ?auto_273717 ?auto_273720 ) ) ( not ( = ?auto_273717 ?auto_273721 ) ) ( not ( = ?auto_273717 ?auto_273722 ) ) ( not ( = ?auto_273717 ?auto_273723 ) ) ( not ( = ?auto_273717 ?auto_273724 ) ) ( not ( = ?auto_273717 ?auto_273725 ) ) ( not ( = ?auto_273717 ?auto_273726 ) ) ( not ( = ?auto_273717 ?auto_273727 ) ) ( not ( = ?auto_273717 ?auto_273728 ) ) ( not ( = ?auto_273718 ?auto_273719 ) ) ( not ( = ?auto_273718 ?auto_273720 ) ) ( not ( = ?auto_273718 ?auto_273721 ) ) ( not ( = ?auto_273718 ?auto_273722 ) ) ( not ( = ?auto_273718 ?auto_273723 ) ) ( not ( = ?auto_273718 ?auto_273724 ) ) ( not ( = ?auto_273718 ?auto_273725 ) ) ( not ( = ?auto_273718 ?auto_273726 ) ) ( not ( = ?auto_273718 ?auto_273727 ) ) ( not ( = ?auto_273718 ?auto_273728 ) ) ( not ( = ?auto_273719 ?auto_273720 ) ) ( not ( = ?auto_273719 ?auto_273721 ) ) ( not ( = ?auto_273719 ?auto_273722 ) ) ( not ( = ?auto_273719 ?auto_273723 ) ) ( not ( = ?auto_273719 ?auto_273724 ) ) ( not ( = ?auto_273719 ?auto_273725 ) ) ( not ( = ?auto_273719 ?auto_273726 ) ) ( not ( = ?auto_273719 ?auto_273727 ) ) ( not ( = ?auto_273719 ?auto_273728 ) ) ( not ( = ?auto_273720 ?auto_273721 ) ) ( not ( = ?auto_273720 ?auto_273722 ) ) ( not ( = ?auto_273720 ?auto_273723 ) ) ( not ( = ?auto_273720 ?auto_273724 ) ) ( not ( = ?auto_273720 ?auto_273725 ) ) ( not ( = ?auto_273720 ?auto_273726 ) ) ( not ( = ?auto_273720 ?auto_273727 ) ) ( not ( = ?auto_273720 ?auto_273728 ) ) ( not ( = ?auto_273721 ?auto_273722 ) ) ( not ( = ?auto_273721 ?auto_273723 ) ) ( not ( = ?auto_273721 ?auto_273724 ) ) ( not ( = ?auto_273721 ?auto_273725 ) ) ( not ( = ?auto_273721 ?auto_273726 ) ) ( not ( = ?auto_273721 ?auto_273727 ) ) ( not ( = ?auto_273721 ?auto_273728 ) ) ( not ( = ?auto_273722 ?auto_273723 ) ) ( not ( = ?auto_273722 ?auto_273724 ) ) ( not ( = ?auto_273722 ?auto_273725 ) ) ( not ( = ?auto_273722 ?auto_273726 ) ) ( not ( = ?auto_273722 ?auto_273727 ) ) ( not ( = ?auto_273722 ?auto_273728 ) ) ( not ( = ?auto_273723 ?auto_273724 ) ) ( not ( = ?auto_273723 ?auto_273725 ) ) ( not ( = ?auto_273723 ?auto_273726 ) ) ( not ( = ?auto_273723 ?auto_273727 ) ) ( not ( = ?auto_273723 ?auto_273728 ) ) ( not ( = ?auto_273724 ?auto_273725 ) ) ( not ( = ?auto_273724 ?auto_273726 ) ) ( not ( = ?auto_273724 ?auto_273727 ) ) ( not ( = ?auto_273724 ?auto_273728 ) ) ( not ( = ?auto_273725 ?auto_273726 ) ) ( not ( = ?auto_273725 ?auto_273727 ) ) ( not ( = ?auto_273725 ?auto_273728 ) ) ( not ( = ?auto_273726 ?auto_273727 ) ) ( not ( = ?auto_273726 ?auto_273728 ) ) ( not ( = ?auto_273727 ?auto_273728 ) ) ( ON ?auto_273726 ?auto_273727 ) ( CLEAR ?auto_273724 ) ( ON ?auto_273725 ?auto_273726 ) ( CLEAR ?auto_273725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_273716 ?auto_273717 ?auto_273718 ?auto_273719 ?auto_273720 ?auto_273721 ?auto_273722 ?auto_273723 ?auto_273724 ?auto_273725 )
      ( MAKE-12PILE ?auto_273716 ?auto_273717 ?auto_273718 ?auto_273719 ?auto_273720 ?auto_273721 ?auto_273722 ?auto_273723 ?auto_273724 ?auto_273725 ?auto_273726 ?auto_273727 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_273741 - BLOCK
      ?auto_273742 - BLOCK
      ?auto_273743 - BLOCK
      ?auto_273744 - BLOCK
      ?auto_273745 - BLOCK
      ?auto_273746 - BLOCK
      ?auto_273747 - BLOCK
      ?auto_273748 - BLOCK
      ?auto_273749 - BLOCK
      ?auto_273750 - BLOCK
      ?auto_273751 - BLOCK
      ?auto_273752 - BLOCK
    )
    :vars
    (
      ?auto_273753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273752 ?auto_273753 ) ( ON-TABLE ?auto_273741 ) ( ON ?auto_273742 ?auto_273741 ) ( ON ?auto_273743 ?auto_273742 ) ( ON ?auto_273744 ?auto_273743 ) ( ON ?auto_273745 ?auto_273744 ) ( ON ?auto_273746 ?auto_273745 ) ( ON ?auto_273747 ?auto_273746 ) ( ON ?auto_273748 ?auto_273747 ) ( ON ?auto_273749 ?auto_273748 ) ( not ( = ?auto_273741 ?auto_273742 ) ) ( not ( = ?auto_273741 ?auto_273743 ) ) ( not ( = ?auto_273741 ?auto_273744 ) ) ( not ( = ?auto_273741 ?auto_273745 ) ) ( not ( = ?auto_273741 ?auto_273746 ) ) ( not ( = ?auto_273741 ?auto_273747 ) ) ( not ( = ?auto_273741 ?auto_273748 ) ) ( not ( = ?auto_273741 ?auto_273749 ) ) ( not ( = ?auto_273741 ?auto_273750 ) ) ( not ( = ?auto_273741 ?auto_273751 ) ) ( not ( = ?auto_273741 ?auto_273752 ) ) ( not ( = ?auto_273741 ?auto_273753 ) ) ( not ( = ?auto_273742 ?auto_273743 ) ) ( not ( = ?auto_273742 ?auto_273744 ) ) ( not ( = ?auto_273742 ?auto_273745 ) ) ( not ( = ?auto_273742 ?auto_273746 ) ) ( not ( = ?auto_273742 ?auto_273747 ) ) ( not ( = ?auto_273742 ?auto_273748 ) ) ( not ( = ?auto_273742 ?auto_273749 ) ) ( not ( = ?auto_273742 ?auto_273750 ) ) ( not ( = ?auto_273742 ?auto_273751 ) ) ( not ( = ?auto_273742 ?auto_273752 ) ) ( not ( = ?auto_273742 ?auto_273753 ) ) ( not ( = ?auto_273743 ?auto_273744 ) ) ( not ( = ?auto_273743 ?auto_273745 ) ) ( not ( = ?auto_273743 ?auto_273746 ) ) ( not ( = ?auto_273743 ?auto_273747 ) ) ( not ( = ?auto_273743 ?auto_273748 ) ) ( not ( = ?auto_273743 ?auto_273749 ) ) ( not ( = ?auto_273743 ?auto_273750 ) ) ( not ( = ?auto_273743 ?auto_273751 ) ) ( not ( = ?auto_273743 ?auto_273752 ) ) ( not ( = ?auto_273743 ?auto_273753 ) ) ( not ( = ?auto_273744 ?auto_273745 ) ) ( not ( = ?auto_273744 ?auto_273746 ) ) ( not ( = ?auto_273744 ?auto_273747 ) ) ( not ( = ?auto_273744 ?auto_273748 ) ) ( not ( = ?auto_273744 ?auto_273749 ) ) ( not ( = ?auto_273744 ?auto_273750 ) ) ( not ( = ?auto_273744 ?auto_273751 ) ) ( not ( = ?auto_273744 ?auto_273752 ) ) ( not ( = ?auto_273744 ?auto_273753 ) ) ( not ( = ?auto_273745 ?auto_273746 ) ) ( not ( = ?auto_273745 ?auto_273747 ) ) ( not ( = ?auto_273745 ?auto_273748 ) ) ( not ( = ?auto_273745 ?auto_273749 ) ) ( not ( = ?auto_273745 ?auto_273750 ) ) ( not ( = ?auto_273745 ?auto_273751 ) ) ( not ( = ?auto_273745 ?auto_273752 ) ) ( not ( = ?auto_273745 ?auto_273753 ) ) ( not ( = ?auto_273746 ?auto_273747 ) ) ( not ( = ?auto_273746 ?auto_273748 ) ) ( not ( = ?auto_273746 ?auto_273749 ) ) ( not ( = ?auto_273746 ?auto_273750 ) ) ( not ( = ?auto_273746 ?auto_273751 ) ) ( not ( = ?auto_273746 ?auto_273752 ) ) ( not ( = ?auto_273746 ?auto_273753 ) ) ( not ( = ?auto_273747 ?auto_273748 ) ) ( not ( = ?auto_273747 ?auto_273749 ) ) ( not ( = ?auto_273747 ?auto_273750 ) ) ( not ( = ?auto_273747 ?auto_273751 ) ) ( not ( = ?auto_273747 ?auto_273752 ) ) ( not ( = ?auto_273747 ?auto_273753 ) ) ( not ( = ?auto_273748 ?auto_273749 ) ) ( not ( = ?auto_273748 ?auto_273750 ) ) ( not ( = ?auto_273748 ?auto_273751 ) ) ( not ( = ?auto_273748 ?auto_273752 ) ) ( not ( = ?auto_273748 ?auto_273753 ) ) ( not ( = ?auto_273749 ?auto_273750 ) ) ( not ( = ?auto_273749 ?auto_273751 ) ) ( not ( = ?auto_273749 ?auto_273752 ) ) ( not ( = ?auto_273749 ?auto_273753 ) ) ( not ( = ?auto_273750 ?auto_273751 ) ) ( not ( = ?auto_273750 ?auto_273752 ) ) ( not ( = ?auto_273750 ?auto_273753 ) ) ( not ( = ?auto_273751 ?auto_273752 ) ) ( not ( = ?auto_273751 ?auto_273753 ) ) ( not ( = ?auto_273752 ?auto_273753 ) ) ( ON ?auto_273751 ?auto_273752 ) ( CLEAR ?auto_273749 ) ( ON ?auto_273750 ?auto_273751 ) ( CLEAR ?auto_273750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_273741 ?auto_273742 ?auto_273743 ?auto_273744 ?auto_273745 ?auto_273746 ?auto_273747 ?auto_273748 ?auto_273749 ?auto_273750 )
      ( MAKE-12PILE ?auto_273741 ?auto_273742 ?auto_273743 ?auto_273744 ?auto_273745 ?auto_273746 ?auto_273747 ?auto_273748 ?auto_273749 ?auto_273750 ?auto_273751 ?auto_273752 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_273766 - BLOCK
      ?auto_273767 - BLOCK
      ?auto_273768 - BLOCK
      ?auto_273769 - BLOCK
      ?auto_273770 - BLOCK
      ?auto_273771 - BLOCK
      ?auto_273772 - BLOCK
      ?auto_273773 - BLOCK
      ?auto_273774 - BLOCK
      ?auto_273775 - BLOCK
      ?auto_273776 - BLOCK
      ?auto_273777 - BLOCK
    )
    :vars
    (
      ?auto_273778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273777 ?auto_273778 ) ( ON-TABLE ?auto_273766 ) ( ON ?auto_273767 ?auto_273766 ) ( ON ?auto_273768 ?auto_273767 ) ( ON ?auto_273769 ?auto_273768 ) ( ON ?auto_273770 ?auto_273769 ) ( ON ?auto_273771 ?auto_273770 ) ( ON ?auto_273772 ?auto_273771 ) ( ON ?auto_273773 ?auto_273772 ) ( not ( = ?auto_273766 ?auto_273767 ) ) ( not ( = ?auto_273766 ?auto_273768 ) ) ( not ( = ?auto_273766 ?auto_273769 ) ) ( not ( = ?auto_273766 ?auto_273770 ) ) ( not ( = ?auto_273766 ?auto_273771 ) ) ( not ( = ?auto_273766 ?auto_273772 ) ) ( not ( = ?auto_273766 ?auto_273773 ) ) ( not ( = ?auto_273766 ?auto_273774 ) ) ( not ( = ?auto_273766 ?auto_273775 ) ) ( not ( = ?auto_273766 ?auto_273776 ) ) ( not ( = ?auto_273766 ?auto_273777 ) ) ( not ( = ?auto_273766 ?auto_273778 ) ) ( not ( = ?auto_273767 ?auto_273768 ) ) ( not ( = ?auto_273767 ?auto_273769 ) ) ( not ( = ?auto_273767 ?auto_273770 ) ) ( not ( = ?auto_273767 ?auto_273771 ) ) ( not ( = ?auto_273767 ?auto_273772 ) ) ( not ( = ?auto_273767 ?auto_273773 ) ) ( not ( = ?auto_273767 ?auto_273774 ) ) ( not ( = ?auto_273767 ?auto_273775 ) ) ( not ( = ?auto_273767 ?auto_273776 ) ) ( not ( = ?auto_273767 ?auto_273777 ) ) ( not ( = ?auto_273767 ?auto_273778 ) ) ( not ( = ?auto_273768 ?auto_273769 ) ) ( not ( = ?auto_273768 ?auto_273770 ) ) ( not ( = ?auto_273768 ?auto_273771 ) ) ( not ( = ?auto_273768 ?auto_273772 ) ) ( not ( = ?auto_273768 ?auto_273773 ) ) ( not ( = ?auto_273768 ?auto_273774 ) ) ( not ( = ?auto_273768 ?auto_273775 ) ) ( not ( = ?auto_273768 ?auto_273776 ) ) ( not ( = ?auto_273768 ?auto_273777 ) ) ( not ( = ?auto_273768 ?auto_273778 ) ) ( not ( = ?auto_273769 ?auto_273770 ) ) ( not ( = ?auto_273769 ?auto_273771 ) ) ( not ( = ?auto_273769 ?auto_273772 ) ) ( not ( = ?auto_273769 ?auto_273773 ) ) ( not ( = ?auto_273769 ?auto_273774 ) ) ( not ( = ?auto_273769 ?auto_273775 ) ) ( not ( = ?auto_273769 ?auto_273776 ) ) ( not ( = ?auto_273769 ?auto_273777 ) ) ( not ( = ?auto_273769 ?auto_273778 ) ) ( not ( = ?auto_273770 ?auto_273771 ) ) ( not ( = ?auto_273770 ?auto_273772 ) ) ( not ( = ?auto_273770 ?auto_273773 ) ) ( not ( = ?auto_273770 ?auto_273774 ) ) ( not ( = ?auto_273770 ?auto_273775 ) ) ( not ( = ?auto_273770 ?auto_273776 ) ) ( not ( = ?auto_273770 ?auto_273777 ) ) ( not ( = ?auto_273770 ?auto_273778 ) ) ( not ( = ?auto_273771 ?auto_273772 ) ) ( not ( = ?auto_273771 ?auto_273773 ) ) ( not ( = ?auto_273771 ?auto_273774 ) ) ( not ( = ?auto_273771 ?auto_273775 ) ) ( not ( = ?auto_273771 ?auto_273776 ) ) ( not ( = ?auto_273771 ?auto_273777 ) ) ( not ( = ?auto_273771 ?auto_273778 ) ) ( not ( = ?auto_273772 ?auto_273773 ) ) ( not ( = ?auto_273772 ?auto_273774 ) ) ( not ( = ?auto_273772 ?auto_273775 ) ) ( not ( = ?auto_273772 ?auto_273776 ) ) ( not ( = ?auto_273772 ?auto_273777 ) ) ( not ( = ?auto_273772 ?auto_273778 ) ) ( not ( = ?auto_273773 ?auto_273774 ) ) ( not ( = ?auto_273773 ?auto_273775 ) ) ( not ( = ?auto_273773 ?auto_273776 ) ) ( not ( = ?auto_273773 ?auto_273777 ) ) ( not ( = ?auto_273773 ?auto_273778 ) ) ( not ( = ?auto_273774 ?auto_273775 ) ) ( not ( = ?auto_273774 ?auto_273776 ) ) ( not ( = ?auto_273774 ?auto_273777 ) ) ( not ( = ?auto_273774 ?auto_273778 ) ) ( not ( = ?auto_273775 ?auto_273776 ) ) ( not ( = ?auto_273775 ?auto_273777 ) ) ( not ( = ?auto_273775 ?auto_273778 ) ) ( not ( = ?auto_273776 ?auto_273777 ) ) ( not ( = ?auto_273776 ?auto_273778 ) ) ( not ( = ?auto_273777 ?auto_273778 ) ) ( ON ?auto_273776 ?auto_273777 ) ( ON ?auto_273775 ?auto_273776 ) ( CLEAR ?auto_273773 ) ( ON ?auto_273774 ?auto_273775 ) ( CLEAR ?auto_273774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_273766 ?auto_273767 ?auto_273768 ?auto_273769 ?auto_273770 ?auto_273771 ?auto_273772 ?auto_273773 ?auto_273774 )
      ( MAKE-12PILE ?auto_273766 ?auto_273767 ?auto_273768 ?auto_273769 ?auto_273770 ?auto_273771 ?auto_273772 ?auto_273773 ?auto_273774 ?auto_273775 ?auto_273776 ?auto_273777 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_273791 - BLOCK
      ?auto_273792 - BLOCK
      ?auto_273793 - BLOCK
      ?auto_273794 - BLOCK
      ?auto_273795 - BLOCK
      ?auto_273796 - BLOCK
      ?auto_273797 - BLOCK
      ?auto_273798 - BLOCK
      ?auto_273799 - BLOCK
      ?auto_273800 - BLOCK
      ?auto_273801 - BLOCK
      ?auto_273802 - BLOCK
    )
    :vars
    (
      ?auto_273803 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273802 ?auto_273803 ) ( ON-TABLE ?auto_273791 ) ( ON ?auto_273792 ?auto_273791 ) ( ON ?auto_273793 ?auto_273792 ) ( ON ?auto_273794 ?auto_273793 ) ( ON ?auto_273795 ?auto_273794 ) ( ON ?auto_273796 ?auto_273795 ) ( ON ?auto_273797 ?auto_273796 ) ( ON ?auto_273798 ?auto_273797 ) ( not ( = ?auto_273791 ?auto_273792 ) ) ( not ( = ?auto_273791 ?auto_273793 ) ) ( not ( = ?auto_273791 ?auto_273794 ) ) ( not ( = ?auto_273791 ?auto_273795 ) ) ( not ( = ?auto_273791 ?auto_273796 ) ) ( not ( = ?auto_273791 ?auto_273797 ) ) ( not ( = ?auto_273791 ?auto_273798 ) ) ( not ( = ?auto_273791 ?auto_273799 ) ) ( not ( = ?auto_273791 ?auto_273800 ) ) ( not ( = ?auto_273791 ?auto_273801 ) ) ( not ( = ?auto_273791 ?auto_273802 ) ) ( not ( = ?auto_273791 ?auto_273803 ) ) ( not ( = ?auto_273792 ?auto_273793 ) ) ( not ( = ?auto_273792 ?auto_273794 ) ) ( not ( = ?auto_273792 ?auto_273795 ) ) ( not ( = ?auto_273792 ?auto_273796 ) ) ( not ( = ?auto_273792 ?auto_273797 ) ) ( not ( = ?auto_273792 ?auto_273798 ) ) ( not ( = ?auto_273792 ?auto_273799 ) ) ( not ( = ?auto_273792 ?auto_273800 ) ) ( not ( = ?auto_273792 ?auto_273801 ) ) ( not ( = ?auto_273792 ?auto_273802 ) ) ( not ( = ?auto_273792 ?auto_273803 ) ) ( not ( = ?auto_273793 ?auto_273794 ) ) ( not ( = ?auto_273793 ?auto_273795 ) ) ( not ( = ?auto_273793 ?auto_273796 ) ) ( not ( = ?auto_273793 ?auto_273797 ) ) ( not ( = ?auto_273793 ?auto_273798 ) ) ( not ( = ?auto_273793 ?auto_273799 ) ) ( not ( = ?auto_273793 ?auto_273800 ) ) ( not ( = ?auto_273793 ?auto_273801 ) ) ( not ( = ?auto_273793 ?auto_273802 ) ) ( not ( = ?auto_273793 ?auto_273803 ) ) ( not ( = ?auto_273794 ?auto_273795 ) ) ( not ( = ?auto_273794 ?auto_273796 ) ) ( not ( = ?auto_273794 ?auto_273797 ) ) ( not ( = ?auto_273794 ?auto_273798 ) ) ( not ( = ?auto_273794 ?auto_273799 ) ) ( not ( = ?auto_273794 ?auto_273800 ) ) ( not ( = ?auto_273794 ?auto_273801 ) ) ( not ( = ?auto_273794 ?auto_273802 ) ) ( not ( = ?auto_273794 ?auto_273803 ) ) ( not ( = ?auto_273795 ?auto_273796 ) ) ( not ( = ?auto_273795 ?auto_273797 ) ) ( not ( = ?auto_273795 ?auto_273798 ) ) ( not ( = ?auto_273795 ?auto_273799 ) ) ( not ( = ?auto_273795 ?auto_273800 ) ) ( not ( = ?auto_273795 ?auto_273801 ) ) ( not ( = ?auto_273795 ?auto_273802 ) ) ( not ( = ?auto_273795 ?auto_273803 ) ) ( not ( = ?auto_273796 ?auto_273797 ) ) ( not ( = ?auto_273796 ?auto_273798 ) ) ( not ( = ?auto_273796 ?auto_273799 ) ) ( not ( = ?auto_273796 ?auto_273800 ) ) ( not ( = ?auto_273796 ?auto_273801 ) ) ( not ( = ?auto_273796 ?auto_273802 ) ) ( not ( = ?auto_273796 ?auto_273803 ) ) ( not ( = ?auto_273797 ?auto_273798 ) ) ( not ( = ?auto_273797 ?auto_273799 ) ) ( not ( = ?auto_273797 ?auto_273800 ) ) ( not ( = ?auto_273797 ?auto_273801 ) ) ( not ( = ?auto_273797 ?auto_273802 ) ) ( not ( = ?auto_273797 ?auto_273803 ) ) ( not ( = ?auto_273798 ?auto_273799 ) ) ( not ( = ?auto_273798 ?auto_273800 ) ) ( not ( = ?auto_273798 ?auto_273801 ) ) ( not ( = ?auto_273798 ?auto_273802 ) ) ( not ( = ?auto_273798 ?auto_273803 ) ) ( not ( = ?auto_273799 ?auto_273800 ) ) ( not ( = ?auto_273799 ?auto_273801 ) ) ( not ( = ?auto_273799 ?auto_273802 ) ) ( not ( = ?auto_273799 ?auto_273803 ) ) ( not ( = ?auto_273800 ?auto_273801 ) ) ( not ( = ?auto_273800 ?auto_273802 ) ) ( not ( = ?auto_273800 ?auto_273803 ) ) ( not ( = ?auto_273801 ?auto_273802 ) ) ( not ( = ?auto_273801 ?auto_273803 ) ) ( not ( = ?auto_273802 ?auto_273803 ) ) ( ON ?auto_273801 ?auto_273802 ) ( ON ?auto_273800 ?auto_273801 ) ( CLEAR ?auto_273798 ) ( ON ?auto_273799 ?auto_273800 ) ( CLEAR ?auto_273799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_273791 ?auto_273792 ?auto_273793 ?auto_273794 ?auto_273795 ?auto_273796 ?auto_273797 ?auto_273798 ?auto_273799 )
      ( MAKE-12PILE ?auto_273791 ?auto_273792 ?auto_273793 ?auto_273794 ?auto_273795 ?auto_273796 ?auto_273797 ?auto_273798 ?auto_273799 ?auto_273800 ?auto_273801 ?auto_273802 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_273816 - BLOCK
      ?auto_273817 - BLOCK
      ?auto_273818 - BLOCK
      ?auto_273819 - BLOCK
      ?auto_273820 - BLOCK
      ?auto_273821 - BLOCK
      ?auto_273822 - BLOCK
      ?auto_273823 - BLOCK
      ?auto_273824 - BLOCK
      ?auto_273825 - BLOCK
      ?auto_273826 - BLOCK
      ?auto_273827 - BLOCK
    )
    :vars
    (
      ?auto_273828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273827 ?auto_273828 ) ( ON-TABLE ?auto_273816 ) ( ON ?auto_273817 ?auto_273816 ) ( ON ?auto_273818 ?auto_273817 ) ( ON ?auto_273819 ?auto_273818 ) ( ON ?auto_273820 ?auto_273819 ) ( ON ?auto_273821 ?auto_273820 ) ( ON ?auto_273822 ?auto_273821 ) ( not ( = ?auto_273816 ?auto_273817 ) ) ( not ( = ?auto_273816 ?auto_273818 ) ) ( not ( = ?auto_273816 ?auto_273819 ) ) ( not ( = ?auto_273816 ?auto_273820 ) ) ( not ( = ?auto_273816 ?auto_273821 ) ) ( not ( = ?auto_273816 ?auto_273822 ) ) ( not ( = ?auto_273816 ?auto_273823 ) ) ( not ( = ?auto_273816 ?auto_273824 ) ) ( not ( = ?auto_273816 ?auto_273825 ) ) ( not ( = ?auto_273816 ?auto_273826 ) ) ( not ( = ?auto_273816 ?auto_273827 ) ) ( not ( = ?auto_273816 ?auto_273828 ) ) ( not ( = ?auto_273817 ?auto_273818 ) ) ( not ( = ?auto_273817 ?auto_273819 ) ) ( not ( = ?auto_273817 ?auto_273820 ) ) ( not ( = ?auto_273817 ?auto_273821 ) ) ( not ( = ?auto_273817 ?auto_273822 ) ) ( not ( = ?auto_273817 ?auto_273823 ) ) ( not ( = ?auto_273817 ?auto_273824 ) ) ( not ( = ?auto_273817 ?auto_273825 ) ) ( not ( = ?auto_273817 ?auto_273826 ) ) ( not ( = ?auto_273817 ?auto_273827 ) ) ( not ( = ?auto_273817 ?auto_273828 ) ) ( not ( = ?auto_273818 ?auto_273819 ) ) ( not ( = ?auto_273818 ?auto_273820 ) ) ( not ( = ?auto_273818 ?auto_273821 ) ) ( not ( = ?auto_273818 ?auto_273822 ) ) ( not ( = ?auto_273818 ?auto_273823 ) ) ( not ( = ?auto_273818 ?auto_273824 ) ) ( not ( = ?auto_273818 ?auto_273825 ) ) ( not ( = ?auto_273818 ?auto_273826 ) ) ( not ( = ?auto_273818 ?auto_273827 ) ) ( not ( = ?auto_273818 ?auto_273828 ) ) ( not ( = ?auto_273819 ?auto_273820 ) ) ( not ( = ?auto_273819 ?auto_273821 ) ) ( not ( = ?auto_273819 ?auto_273822 ) ) ( not ( = ?auto_273819 ?auto_273823 ) ) ( not ( = ?auto_273819 ?auto_273824 ) ) ( not ( = ?auto_273819 ?auto_273825 ) ) ( not ( = ?auto_273819 ?auto_273826 ) ) ( not ( = ?auto_273819 ?auto_273827 ) ) ( not ( = ?auto_273819 ?auto_273828 ) ) ( not ( = ?auto_273820 ?auto_273821 ) ) ( not ( = ?auto_273820 ?auto_273822 ) ) ( not ( = ?auto_273820 ?auto_273823 ) ) ( not ( = ?auto_273820 ?auto_273824 ) ) ( not ( = ?auto_273820 ?auto_273825 ) ) ( not ( = ?auto_273820 ?auto_273826 ) ) ( not ( = ?auto_273820 ?auto_273827 ) ) ( not ( = ?auto_273820 ?auto_273828 ) ) ( not ( = ?auto_273821 ?auto_273822 ) ) ( not ( = ?auto_273821 ?auto_273823 ) ) ( not ( = ?auto_273821 ?auto_273824 ) ) ( not ( = ?auto_273821 ?auto_273825 ) ) ( not ( = ?auto_273821 ?auto_273826 ) ) ( not ( = ?auto_273821 ?auto_273827 ) ) ( not ( = ?auto_273821 ?auto_273828 ) ) ( not ( = ?auto_273822 ?auto_273823 ) ) ( not ( = ?auto_273822 ?auto_273824 ) ) ( not ( = ?auto_273822 ?auto_273825 ) ) ( not ( = ?auto_273822 ?auto_273826 ) ) ( not ( = ?auto_273822 ?auto_273827 ) ) ( not ( = ?auto_273822 ?auto_273828 ) ) ( not ( = ?auto_273823 ?auto_273824 ) ) ( not ( = ?auto_273823 ?auto_273825 ) ) ( not ( = ?auto_273823 ?auto_273826 ) ) ( not ( = ?auto_273823 ?auto_273827 ) ) ( not ( = ?auto_273823 ?auto_273828 ) ) ( not ( = ?auto_273824 ?auto_273825 ) ) ( not ( = ?auto_273824 ?auto_273826 ) ) ( not ( = ?auto_273824 ?auto_273827 ) ) ( not ( = ?auto_273824 ?auto_273828 ) ) ( not ( = ?auto_273825 ?auto_273826 ) ) ( not ( = ?auto_273825 ?auto_273827 ) ) ( not ( = ?auto_273825 ?auto_273828 ) ) ( not ( = ?auto_273826 ?auto_273827 ) ) ( not ( = ?auto_273826 ?auto_273828 ) ) ( not ( = ?auto_273827 ?auto_273828 ) ) ( ON ?auto_273826 ?auto_273827 ) ( ON ?auto_273825 ?auto_273826 ) ( ON ?auto_273824 ?auto_273825 ) ( CLEAR ?auto_273822 ) ( ON ?auto_273823 ?auto_273824 ) ( CLEAR ?auto_273823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_273816 ?auto_273817 ?auto_273818 ?auto_273819 ?auto_273820 ?auto_273821 ?auto_273822 ?auto_273823 )
      ( MAKE-12PILE ?auto_273816 ?auto_273817 ?auto_273818 ?auto_273819 ?auto_273820 ?auto_273821 ?auto_273822 ?auto_273823 ?auto_273824 ?auto_273825 ?auto_273826 ?auto_273827 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_273841 - BLOCK
      ?auto_273842 - BLOCK
      ?auto_273843 - BLOCK
      ?auto_273844 - BLOCK
      ?auto_273845 - BLOCK
      ?auto_273846 - BLOCK
      ?auto_273847 - BLOCK
      ?auto_273848 - BLOCK
      ?auto_273849 - BLOCK
      ?auto_273850 - BLOCK
      ?auto_273851 - BLOCK
      ?auto_273852 - BLOCK
    )
    :vars
    (
      ?auto_273853 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273852 ?auto_273853 ) ( ON-TABLE ?auto_273841 ) ( ON ?auto_273842 ?auto_273841 ) ( ON ?auto_273843 ?auto_273842 ) ( ON ?auto_273844 ?auto_273843 ) ( ON ?auto_273845 ?auto_273844 ) ( ON ?auto_273846 ?auto_273845 ) ( ON ?auto_273847 ?auto_273846 ) ( not ( = ?auto_273841 ?auto_273842 ) ) ( not ( = ?auto_273841 ?auto_273843 ) ) ( not ( = ?auto_273841 ?auto_273844 ) ) ( not ( = ?auto_273841 ?auto_273845 ) ) ( not ( = ?auto_273841 ?auto_273846 ) ) ( not ( = ?auto_273841 ?auto_273847 ) ) ( not ( = ?auto_273841 ?auto_273848 ) ) ( not ( = ?auto_273841 ?auto_273849 ) ) ( not ( = ?auto_273841 ?auto_273850 ) ) ( not ( = ?auto_273841 ?auto_273851 ) ) ( not ( = ?auto_273841 ?auto_273852 ) ) ( not ( = ?auto_273841 ?auto_273853 ) ) ( not ( = ?auto_273842 ?auto_273843 ) ) ( not ( = ?auto_273842 ?auto_273844 ) ) ( not ( = ?auto_273842 ?auto_273845 ) ) ( not ( = ?auto_273842 ?auto_273846 ) ) ( not ( = ?auto_273842 ?auto_273847 ) ) ( not ( = ?auto_273842 ?auto_273848 ) ) ( not ( = ?auto_273842 ?auto_273849 ) ) ( not ( = ?auto_273842 ?auto_273850 ) ) ( not ( = ?auto_273842 ?auto_273851 ) ) ( not ( = ?auto_273842 ?auto_273852 ) ) ( not ( = ?auto_273842 ?auto_273853 ) ) ( not ( = ?auto_273843 ?auto_273844 ) ) ( not ( = ?auto_273843 ?auto_273845 ) ) ( not ( = ?auto_273843 ?auto_273846 ) ) ( not ( = ?auto_273843 ?auto_273847 ) ) ( not ( = ?auto_273843 ?auto_273848 ) ) ( not ( = ?auto_273843 ?auto_273849 ) ) ( not ( = ?auto_273843 ?auto_273850 ) ) ( not ( = ?auto_273843 ?auto_273851 ) ) ( not ( = ?auto_273843 ?auto_273852 ) ) ( not ( = ?auto_273843 ?auto_273853 ) ) ( not ( = ?auto_273844 ?auto_273845 ) ) ( not ( = ?auto_273844 ?auto_273846 ) ) ( not ( = ?auto_273844 ?auto_273847 ) ) ( not ( = ?auto_273844 ?auto_273848 ) ) ( not ( = ?auto_273844 ?auto_273849 ) ) ( not ( = ?auto_273844 ?auto_273850 ) ) ( not ( = ?auto_273844 ?auto_273851 ) ) ( not ( = ?auto_273844 ?auto_273852 ) ) ( not ( = ?auto_273844 ?auto_273853 ) ) ( not ( = ?auto_273845 ?auto_273846 ) ) ( not ( = ?auto_273845 ?auto_273847 ) ) ( not ( = ?auto_273845 ?auto_273848 ) ) ( not ( = ?auto_273845 ?auto_273849 ) ) ( not ( = ?auto_273845 ?auto_273850 ) ) ( not ( = ?auto_273845 ?auto_273851 ) ) ( not ( = ?auto_273845 ?auto_273852 ) ) ( not ( = ?auto_273845 ?auto_273853 ) ) ( not ( = ?auto_273846 ?auto_273847 ) ) ( not ( = ?auto_273846 ?auto_273848 ) ) ( not ( = ?auto_273846 ?auto_273849 ) ) ( not ( = ?auto_273846 ?auto_273850 ) ) ( not ( = ?auto_273846 ?auto_273851 ) ) ( not ( = ?auto_273846 ?auto_273852 ) ) ( not ( = ?auto_273846 ?auto_273853 ) ) ( not ( = ?auto_273847 ?auto_273848 ) ) ( not ( = ?auto_273847 ?auto_273849 ) ) ( not ( = ?auto_273847 ?auto_273850 ) ) ( not ( = ?auto_273847 ?auto_273851 ) ) ( not ( = ?auto_273847 ?auto_273852 ) ) ( not ( = ?auto_273847 ?auto_273853 ) ) ( not ( = ?auto_273848 ?auto_273849 ) ) ( not ( = ?auto_273848 ?auto_273850 ) ) ( not ( = ?auto_273848 ?auto_273851 ) ) ( not ( = ?auto_273848 ?auto_273852 ) ) ( not ( = ?auto_273848 ?auto_273853 ) ) ( not ( = ?auto_273849 ?auto_273850 ) ) ( not ( = ?auto_273849 ?auto_273851 ) ) ( not ( = ?auto_273849 ?auto_273852 ) ) ( not ( = ?auto_273849 ?auto_273853 ) ) ( not ( = ?auto_273850 ?auto_273851 ) ) ( not ( = ?auto_273850 ?auto_273852 ) ) ( not ( = ?auto_273850 ?auto_273853 ) ) ( not ( = ?auto_273851 ?auto_273852 ) ) ( not ( = ?auto_273851 ?auto_273853 ) ) ( not ( = ?auto_273852 ?auto_273853 ) ) ( ON ?auto_273851 ?auto_273852 ) ( ON ?auto_273850 ?auto_273851 ) ( ON ?auto_273849 ?auto_273850 ) ( CLEAR ?auto_273847 ) ( ON ?auto_273848 ?auto_273849 ) ( CLEAR ?auto_273848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_273841 ?auto_273842 ?auto_273843 ?auto_273844 ?auto_273845 ?auto_273846 ?auto_273847 ?auto_273848 )
      ( MAKE-12PILE ?auto_273841 ?auto_273842 ?auto_273843 ?auto_273844 ?auto_273845 ?auto_273846 ?auto_273847 ?auto_273848 ?auto_273849 ?auto_273850 ?auto_273851 ?auto_273852 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_273866 - BLOCK
      ?auto_273867 - BLOCK
      ?auto_273868 - BLOCK
      ?auto_273869 - BLOCK
      ?auto_273870 - BLOCK
      ?auto_273871 - BLOCK
      ?auto_273872 - BLOCK
      ?auto_273873 - BLOCK
      ?auto_273874 - BLOCK
      ?auto_273875 - BLOCK
      ?auto_273876 - BLOCK
      ?auto_273877 - BLOCK
    )
    :vars
    (
      ?auto_273878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273877 ?auto_273878 ) ( ON-TABLE ?auto_273866 ) ( ON ?auto_273867 ?auto_273866 ) ( ON ?auto_273868 ?auto_273867 ) ( ON ?auto_273869 ?auto_273868 ) ( ON ?auto_273870 ?auto_273869 ) ( ON ?auto_273871 ?auto_273870 ) ( not ( = ?auto_273866 ?auto_273867 ) ) ( not ( = ?auto_273866 ?auto_273868 ) ) ( not ( = ?auto_273866 ?auto_273869 ) ) ( not ( = ?auto_273866 ?auto_273870 ) ) ( not ( = ?auto_273866 ?auto_273871 ) ) ( not ( = ?auto_273866 ?auto_273872 ) ) ( not ( = ?auto_273866 ?auto_273873 ) ) ( not ( = ?auto_273866 ?auto_273874 ) ) ( not ( = ?auto_273866 ?auto_273875 ) ) ( not ( = ?auto_273866 ?auto_273876 ) ) ( not ( = ?auto_273866 ?auto_273877 ) ) ( not ( = ?auto_273866 ?auto_273878 ) ) ( not ( = ?auto_273867 ?auto_273868 ) ) ( not ( = ?auto_273867 ?auto_273869 ) ) ( not ( = ?auto_273867 ?auto_273870 ) ) ( not ( = ?auto_273867 ?auto_273871 ) ) ( not ( = ?auto_273867 ?auto_273872 ) ) ( not ( = ?auto_273867 ?auto_273873 ) ) ( not ( = ?auto_273867 ?auto_273874 ) ) ( not ( = ?auto_273867 ?auto_273875 ) ) ( not ( = ?auto_273867 ?auto_273876 ) ) ( not ( = ?auto_273867 ?auto_273877 ) ) ( not ( = ?auto_273867 ?auto_273878 ) ) ( not ( = ?auto_273868 ?auto_273869 ) ) ( not ( = ?auto_273868 ?auto_273870 ) ) ( not ( = ?auto_273868 ?auto_273871 ) ) ( not ( = ?auto_273868 ?auto_273872 ) ) ( not ( = ?auto_273868 ?auto_273873 ) ) ( not ( = ?auto_273868 ?auto_273874 ) ) ( not ( = ?auto_273868 ?auto_273875 ) ) ( not ( = ?auto_273868 ?auto_273876 ) ) ( not ( = ?auto_273868 ?auto_273877 ) ) ( not ( = ?auto_273868 ?auto_273878 ) ) ( not ( = ?auto_273869 ?auto_273870 ) ) ( not ( = ?auto_273869 ?auto_273871 ) ) ( not ( = ?auto_273869 ?auto_273872 ) ) ( not ( = ?auto_273869 ?auto_273873 ) ) ( not ( = ?auto_273869 ?auto_273874 ) ) ( not ( = ?auto_273869 ?auto_273875 ) ) ( not ( = ?auto_273869 ?auto_273876 ) ) ( not ( = ?auto_273869 ?auto_273877 ) ) ( not ( = ?auto_273869 ?auto_273878 ) ) ( not ( = ?auto_273870 ?auto_273871 ) ) ( not ( = ?auto_273870 ?auto_273872 ) ) ( not ( = ?auto_273870 ?auto_273873 ) ) ( not ( = ?auto_273870 ?auto_273874 ) ) ( not ( = ?auto_273870 ?auto_273875 ) ) ( not ( = ?auto_273870 ?auto_273876 ) ) ( not ( = ?auto_273870 ?auto_273877 ) ) ( not ( = ?auto_273870 ?auto_273878 ) ) ( not ( = ?auto_273871 ?auto_273872 ) ) ( not ( = ?auto_273871 ?auto_273873 ) ) ( not ( = ?auto_273871 ?auto_273874 ) ) ( not ( = ?auto_273871 ?auto_273875 ) ) ( not ( = ?auto_273871 ?auto_273876 ) ) ( not ( = ?auto_273871 ?auto_273877 ) ) ( not ( = ?auto_273871 ?auto_273878 ) ) ( not ( = ?auto_273872 ?auto_273873 ) ) ( not ( = ?auto_273872 ?auto_273874 ) ) ( not ( = ?auto_273872 ?auto_273875 ) ) ( not ( = ?auto_273872 ?auto_273876 ) ) ( not ( = ?auto_273872 ?auto_273877 ) ) ( not ( = ?auto_273872 ?auto_273878 ) ) ( not ( = ?auto_273873 ?auto_273874 ) ) ( not ( = ?auto_273873 ?auto_273875 ) ) ( not ( = ?auto_273873 ?auto_273876 ) ) ( not ( = ?auto_273873 ?auto_273877 ) ) ( not ( = ?auto_273873 ?auto_273878 ) ) ( not ( = ?auto_273874 ?auto_273875 ) ) ( not ( = ?auto_273874 ?auto_273876 ) ) ( not ( = ?auto_273874 ?auto_273877 ) ) ( not ( = ?auto_273874 ?auto_273878 ) ) ( not ( = ?auto_273875 ?auto_273876 ) ) ( not ( = ?auto_273875 ?auto_273877 ) ) ( not ( = ?auto_273875 ?auto_273878 ) ) ( not ( = ?auto_273876 ?auto_273877 ) ) ( not ( = ?auto_273876 ?auto_273878 ) ) ( not ( = ?auto_273877 ?auto_273878 ) ) ( ON ?auto_273876 ?auto_273877 ) ( ON ?auto_273875 ?auto_273876 ) ( ON ?auto_273874 ?auto_273875 ) ( ON ?auto_273873 ?auto_273874 ) ( CLEAR ?auto_273871 ) ( ON ?auto_273872 ?auto_273873 ) ( CLEAR ?auto_273872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_273866 ?auto_273867 ?auto_273868 ?auto_273869 ?auto_273870 ?auto_273871 ?auto_273872 )
      ( MAKE-12PILE ?auto_273866 ?auto_273867 ?auto_273868 ?auto_273869 ?auto_273870 ?auto_273871 ?auto_273872 ?auto_273873 ?auto_273874 ?auto_273875 ?auto_273876 ?auto_273877 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_273891 - BLOCK
      ?auto_273892 - BLOCK
      ?auto_273893 - BLOCK
      ?auto_273894 - BLOCK
      ?auto_273895 - BLOCK
      ?auto_273896 - BLOCK
      ?auto_273897 - BLOCK
      ?auto_273898 - BLOCK
      ?auto_273899 - BLOCK
      ?auto_273900 - BLOCK
      ?auto_273901 - BLOCK
      ?auto_273902 - BLOCK
    )
    :vars
    (
      ?auto_273903 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273902 ?auto_273903 ) ( ON-TABLE ?auto_273891 ) ( ON ?auto_273892 ?auto_273891 ) ( ON ?auto_273893 ?auto_273892 ) ( ON ?auto_273894 ?auto_273893 ) ( ON ?auto_273895 ?auto_273894 ) ( ON ?auto_273896 ?auto_273895 ) ( not ( = ?auto_273891 ?auto_273892 ) ) ( not ( = ?auto_273891 ?auto_273893 ) ) ( not ( = ?auto_273891 ?auto_273894 ) ) ( not ( = ?auto_273891 ?auto_273895 ) ) ( not ( = ?auto_273891 ?auto_273896 ) ) ( not ( = ?auto_273891 ?auto_273897 ) ) ( not ( = ?auto_273891 ?auto_273898 ) ) ( not ( = ?auto_273891 ?auto_273899 ) ) ( not ( = ?auto_273891 ?auto_273900 ) ) ( not ( = ?auto_273891 ?auto_273901 ) ) ( not ( = ?auto_273891 ?auto_273902 ) ) ( not ( = ?auto_273891 ?auto_273903 ) ) ( not ( = ?auto_273892 ?auto_273893 ) ) ( not ( = ?auto_273892 ?auto_273894 ) ) ( not ( = ?auto_273892 ?auto_273895 ) ) ( not ( = ?auto_273892 ?auto_273896 ) ) ( not ( = ?auto_273892 ?auto_273897 ) ) ( not ( = ?auto_273892 ?auto_273898 ) ) ( not ( = ?auto_273892 ?auto_273899 ) ) ( not ( = ?auto_273892 ?auto_273900 ) ) ( not ( = ?auto_273892 ?auto_273901 ) ) ( not ( = ?auto_273892 ?auto_273902 ) ) ( not ( = ?auto_273892 ?auto_273903 ) ) ( not ( = ?auto_273893 ?auto_273894 ) ) ( not ( = ?auto_273893 ?auto_273895 ) ) ( not ( = ?auto_273893 ?auto_273896 ) ) ( not ( = ?auto_273893 ?auto_273897 ) ) ( not ( = ?auto_273893 ?auto_273898 ) ) ( not ( = ?auto_273893 ?auto_273899 ) ) ( not ( = ?auto_273893 ?auto_273900 ) ) ( not ( = ?auto_273893 ?auto_273901 ) ) ( not ( = ?auto_273893 ?auto_273902 ) ) ( not ( = ?auto_273893 ?auto_273903 ) ) ( not ( = ?auto_273894 ?auto_273895 ) ) ( not ( = ?auto_273894 ?auto_273896 ) ) ( not ( = ?auto_273894 ?auto_273897 ) ) ( not ( = ?auto_273894 ?auto_273898 ) ) ( not ( = ?auto_273894 ?auto_273899 ) ) ( not ( = ?auto_273894 ?auto_273900 ) ) ( not ( = ?auto_273894 ?auto_273901 ) ) ( not ( = ?auto_273894 ?auto_273902 ) ) ( not ( = ?auto_273894 ?auto_273903 ) ) ( not ( = ?auto_273895 ?auto_273896 ) ) ( not ( = ?auto_273895 ?auto_273897 ) ) ( not ( = ?auto_273895 ?auto_273898 ) ) ( not ( = ?auto_273895 ?auto_273899 ) ) ( not ( = ?auto_273895 ?auto_273900 ) ) ( not ( = ?auto_273895 ?auto_273901 ) ) ( not ( = ?auto_273895 ?auto_273902 ) ) ( not ( = ?auto_273895 ?auto_273903 ) ) ( not ( = ?auto_273896 ?auto_273897 ) ) ( not ( = ?auto_273896 ?auto_273898 ) ) ( not ( = ?auto_273896 ?auto_273899 ) ) ( not ( = ?auto_273896 ?auto_273900 ) ) ( not ( = ?auto_273896 ?auto_273901 ) ) ( not ( = ?auto_273896 ?auto_273902 ) ) ( not ( = ?auto_273896 ?auto_273903 ) ) ( not ( = ?auto_273897 ?auto_273898 ) ) ( not ( = ?auto_273897 ?auto_273899 ) ) ( not ( = ?auto_273897 ?auto_273900 ) ) ( not ( = ?auto_273897 ?auto_273901 ) ) ( not ( = ?auto_273897 ?auto_273902 ) ) ( not ( = ?auto_273897 ?auto_273903 ) ) ( not ( = ?auto_273898 ?auto_273899 ) ) ( not ( = ?auto_273898 ?auto_273900 ) ) ( not ( = ?auto_273898 ?auto_273901 ) ) ( not ( = ?auto_273898 ?auto_273902 ) ) ( not ( = ?auto_273898 ?auto_273903 ) ) ( not ( = ?auto_273899 ?auto_273900 ) ) ( not ( = ?auto_273899 ?auto_273901 ) ) ( not ( = ?auto_273899 ?auto_273902 ) ) ( not ( = ?auto_273899 ?auto_273903 ) ) ( not ( = ?auto_273900 ?auto_273901 ) ) ( not ( = ?auto_273900 ?auto_273902 ) ) ( not ( = ?auto_273900 ?auto_273903 ) ) ( not ( = ?auto_273901 ?auto_273902 ) ) ( not ( = ?auto_273901 ?auto_273903 ) ) ( not ( = ?auto_273902 ?auto_273903 ) ) ( ON ?auto_273901 ?auto_273902 ) ( ON ?auto_273900 ?auto_273901 ) ( ON ?auto_273899 ?auto_273900 ) ( ON ?auto_273898 ?auto_273899 ) ( CLEAR ?auto_273896 ) ( ON ?auto_273897 ?auto_273898 ) ( CLEAR ?auto_273897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_273891 ?auto_273892 ?auto_273893 ?auto_273894 ?auto_273895 ?auto_273896 ?auto_273897 )
      ( MAKE-12PILE ?auto_273891 ?auto_273892 ?auto_273893 ?auto_273894 ?auto_273895 ?auto_273896 ?auto_273897 ?auto_273898 ?auto_273899 ?auto_273900 ?auto_273901 ?auto_273902 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_273916 - BLOCK
      ?auto_273917 - BLOCK
      ?auto_273918 - BLOCK
      ?auto_273919 - BLOCK
      ?auto_273920 - BLOCK
      ?auto_273921 - BLOCK
      ?auto_273922 - BLOCK
      ?auto_273923 - BLOCK
      ?auto_273924 - BLOCK
      ?auto_273925 - BLOCK
      ?auto_273926 - BLOCK
      ?auto_273927 - BLOCK
    )
    :vars
    (
      ?auto_273928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273927 ?auto_273928 ) ( ON-TABLE ?auto_273916 ) ( ON ?auto_273917 ?auto_273916 ) ( ON ?auto_273918 ?auto_273917 ) ( ON ?auto_273919 ?auto_273918 ) ( ON ?auto_273920 ?auto_273919 ) ( not ( = ?auto_273916 ?auto_273917 ) ) ( not ( = ?auto_273916 ?auto_273918 ) ) ( not ( = ?auto_273916 ?auto_273919 ) ) ( not ( = ?auto_273916 ?auto_273920 ) ) ( not ( = ?auto_273916 ?auto_273921 ) ) ( not ( = ?auto_273916 ?auto_273922 ) ) ( not ( = ?auto_273916 ?auto_273923 ) ) ( not ( = ?auto_273916 ?auto_273924 ) ) ( not ( = ?auto_273916 ?auto_273925 ) ) ( not ( = ?auto_273916 ?auto_273926 ) ) ( not ( = ?auto_273916 ?auto_273927 ) ) ( not ( = ?auto_273916 ?auto_273928 ) ) ( not ( = ?auto_273917 ?auto_273918 ) ) ( not ( = ?auto_273917 ?auto_273919 ) ) ( not ( = ?auto_273917 ?auto_273920 ) ) ( not ( = ?auto_273917 ?auto_273921 ) ) ( not ( = ?auto_273917 ?auto_273922 ) ) ( not ( = ?auto_273917 ?auto_273923 ) ) ( not ( = ?auto_273917 ?auto_273924 ) ) ( not ( = ?auto_273917 ?auto_273925 ) ) ( not ( = ?auto_273917 ?auto_273926 ) ) ( not ( = ?auto_273917 ?auto_273927 ) ) ( not ( = ?auto_273917 ?auto_273928 ) ) ( not ( = ?auto_273918 ?auto_273919 ) ) ( not ( = ?auto_273918 ?auto_273920 ) ) ( not ( = ?auto_273918 ?auto_273921 ) ) ( not ( = ?auto_273918 ?auto_273922 ) ) ( not ( = ?auto_273918 ?auto_273923 ) ) ( not ( = ?auto_273918 ?auto_273924 ) ) ( not ( = ?auto_273918 ?auto_273925 ) ) ( not ( = ?auto_273918 ?auto_273926 ) ) ( not ( = ?auto_273918 ?auto_273927 ) ) ( not ( = ?auto_273918 ?auto_273928 ) ) ( not ( = ?auto_273919 ?auto_273920 ) ) ( not ( = ?auto_273919 ?auto_273921 ) ) ( not ( = ?auto_273919 ?auto_273922 ) ) ( not ( = ?auto_273919 ?auto_273923 ) ) ( not ( = ?auto_273919 ?auto_273924 ) ) ( not ( = ?auto_273919 ?auto_273925 ) ) ( not ( = ?auto_273919 ?auto_273926 ) ) ( not ( = ?auto_273919 ?auto_273927 ) ) ( not ( = ?auto_273919 ?auto_273928 ) ) ( not ( = ?auto_273920 ?auto_273921 ) ) ( not ( = ?auto_273920 ?auto_273922 ) ) ( not ( = ?auto_273920 ?auto_273923 ) ) ( not ( = ?auto_273920 ?auto_273924 ) ) ( not ( = ?auto_273920 ?auto_273925 ) ) ( not ( = ?auto_273920 ?auto_273926 ) ) ( not ( = ?auto_273920 ?auto_273927 ) ) ( not ( = ?auto_273920 ?auto_273928 ) ) ( not ( = ?auto_273921 ?auto_273922 ) ) ( not ( = ?auto_273921 ?auto_273923 ) ) ( not ( = ?auto_273921 ?auto_273924 ) ) ( not ( = ?auto_273921 ?auto_273925 ) ) ( not ( = ?auto_273921 ?auto_273926 ) ) ( not ( = ?auto_273921 ?auto_273927 ) ) ( not ( = ?auto_273921 ?auto_273928 ) ) ( not ( = ?auto_273922 ?auto_273923 ) ) ( not ( = ?auto_273922 ?auto_273924 ) ) ( not ( = ?auto_273922 ?auto_273925 ) ) ( not ( = ?auto_273922 ?auto_273926 ) ) ( not ( = ?auto_273922 ?auto_273927 ) ) ( not ( = ?auto_273922 ?auto_273928 ) ) ( not ( = ?auto_273923 ?auto_273924 ) ) ( not ( = ?auto_273923 ?auto_273925 ) ) ( not ( = ?auto_273923 ?auto_273926 ) ) ( not ( = ?auto_273923 ?auto_273927 ) ) ( not ( = ?auto_273923 ?auto_273928 ) ) ( not ( = ?auto_273924 ?auto_273925 ) ) ( not ( = ?auto_273924 ?auto_273926 ) ) ( not ( = ?auto_273924 ?auto_273927 ) ) ( not ( = ?auto_273924 ?auto_273928 ) ) ( not ( = ?auto_273925 ?auto_273926 ) ) ( not ( = ?auto_273925 ?auto_273927 ) ) ( not ( = ?auto_273925 ?auto_273928 ) ) ( not ( = ?auto_273926 ?auto_273927 ) ) ( not ( = ?auto_273926 ?auto_273928 ) ) ( not ( = ?auto_273927 ?auto_273928 ) ) ( ON ?auto_273926 ?auto_273927 ) ( ON ?auto_273925 ?auto_273926 ) ( ON ?auto_273924 ?auto_273925 ) ( ON ?auto_273923 ?auto_273924 ) ( ON ?auto_273922 ?auto_273923 ) ( CLEAR ?auto_273920 ) ( ON ?auto_273921 ?auto_273922 ) ( CLEAR ?auto_273921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_273916 ?auto_273917 ?auto_273918 ?auto_273919 ?auto_273920 ?auto_273921 )
      ( MAKE-12PILE ?auto_273916 ?auto_273917 ?auto_273918 ?auto_273919 ?auto_273920 ?auto_273921 ?auto_273922 ?auto_273923 ?auto_273924 ?auto_273925 ?auto_273926 ?auto_273927 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_273941 - BLOCK
      ?auto_273942 - BLOCK
      ?auto_273943 - BLOCK
      ?auto_273944 - BLOCK
      ?auto_273945 - BLOCK
      ?auto_273946 - BLOCK
      ?auto_273947 - BLOCK
      ?auto_273948 - BLOCK
      ?auto_273949 - BLOCK
      ?auto_273950 - BLOCK
      ?auto_273951 - BLOCK
      ?auto_273952 - BLOCK
    )
    :vars
    (
      ?auto_273953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273952 ?auto_273953 ) ( ON-TABLE ?auto_273941 ) ( ON ?auto_273942 ?auto_273941 ) ( ON ?auto_273943 ?auto_273942 ) ( ON ?auto_273944 ?auto_273943 ) ( ON ?auto_273945 ?auto_273944 ) ( not ( = ?auto_273941 ?auto_273942 ) ) ( not ( = ?auto_273941 ?auto_273943 ) ) ( not ( = ?auto_273941 ?auto_273944 ) ) ( not ( = ?auto_273941 ?auto_273945 ) ) ( not ( = ?auto_273941 ?auto_273946 ) ) ( not ( = ?auto_273941 ?auto_273947 ) ) ( not ( = ?auto_273941 ?auto_273948 ) ) ( not ( = ?auto_273941 ?auto_273949 ) ) ( not ( = ?auto_273941 ?auto_273950 ) ) ( not ( = ?auto_273941 ?auto_273951 ) ) ( not ( = ?auto_273941 ?auto_273952 ) ) ( not ( = ?auto_273941 ?auto_273953 ) ) ( not ( = ?auto_273942 ?auto_273943 ) ) ( not ( = ?auto_273942 ?auto_273944 ) ) ( not ( = ?auto_273942 ?auto_273945 ) ) ( not ( = ?auto_273942 ?auto_273946 ) ) ( not ( = ?auto_273942 ?auto_273947 ) ) ( not ( = ?auto_273942 ?auto_273948 ) ) ( not ( = ?auto_273942 ?auto_273949 ) ) ( not ( = ?auto_273942 ?auto_273950 ) ) ( not ( = ?auto_273942 ?auto_273951 ) ) ( not ( = ?auto_273942 ?auto_273952 ) ) ( not ( = ?auto_273942 ?auto_273953 ) ) ( not ( = ?auto_273943 ?auto_273944 ) ) ( not ( = ?auto_273943 ?auto_273945 ) ) ( not ( = ?auto_273943 ?auto_273946 ) ) ( not ( = ?auto_273943 ?auto_273947 ) ) ( not ( = ?auto_273943 ?auto_273948 ) ) ( not ( = ?auto_273943 ?auto_273949 ) ) ( not ( = ?auto_273943 ?auto_273950 ) ) ( not ( = ?auto_273943 ?auto_273951 ) ) ( not ( = ?auto_273943 ?auto_273952 ) ) ( not ( = ?auto_273943 ?auto_273953 ) ) ( not ( = ?auto_273944 ?auto_273945 ) ) ( not ( = ?auto_273944 ?auto_273946 ) ) ( not ( = ?auto_273944 ?auto_273947 ) ) ( not ( = ?auto_273944 ?auto_273948 ) ) ( not ( = ?auto_273944 ?auto_273949 ) ) ( not ( = ?auto_273944 ?auto_273950 ) ) ( not ( = ?auto_273944 ?auto_273951 ) ) ( not ( = ?auto_273944 ?auto_273952 ) ) ( not ( = ?auto_273944 ?auto_273953 ) ) ( not ( = ?auto_273945 ?auto_273946 ) ) ( not ( = ?auto_273945 ?auto_273947 ) ) ( not ( = ?auto_273945 ?auto_273948 ) ) ( not ( = ?auto_273945 ?auto_273949 ) ) ( not ( = ?auto_273945 ?auto_273950 ) ) ( not ( = ?auto_273945 ?auto_273951 ) ) ( not ( = ?auto_273945 ?auto_273952 ) ) ( not ( = ?auto_273945 ?auto_273953 ) ) ( not ( = ?auto_273946 ?auto_273947 ) ) ( not ( = ?auto_273946 ?auto_273948 ) ) ( not ( = ?auto_273946 ?auto_273949 ) ) ( not ( = ?auto_273946 ?auto_273950 ) ) ( not ( = ?auto_273946 ?auto_273951 ) ) ( not ( = ?auto_273946 ?auto_273952 ) ) ( not ( = ?auto_273946 ?auto_273953 ) ) ( not ( = ?auto_273947 ?auto_273948 ) ) ( not ( = ?auto_273947 ?auto_273949 ) ) ( not ( = ?auto_273947 ?auto_273950 ) ) ( not ( = ?auto_273947 ?auto_273951 ) ) ( not ( = ?auto_273947 ?auto_273952 ) ) ( not ( = ?auto_273947 ?auto_273953 ) ) ( not ( = ?auto_273948 ?auto_273949 ) ) ( not ( = ?auto_273948 ?auto_273950 ) ) ( not ( = ?auto_273948 ?auto_273951 ) ) ( not ( = ?auto_273948 ?auto_273952 ) ) ( not ( = ?auto_273948 ?auto_273953 ) ) ( not ( = ?auto_273949 ?auto_273950 ) ) ( not ( = ?auto_273949 ?auto_273951 ) ) ( not ( = ?auto_273949 ?auto_273952 ) ) ( not ( = ?auto_273949 ?auto_273953 ) ) ( not ( = ?auto_273950 ?auto_273951 ) ) ( not ( = ?auto_273950 ?auto_273952 ) ) ( not ( = ?auto_273950 ?auto_273953 ) ) ( not ( = ?auto_273951 ?auto_273952 ) ) ( not ( = ?auto_273951 ?auto_273953 ) ) ( not ( = ?auto_273952 ?auto_273953 ) ) ( ON ?auto_273951 ?auto_273952 ) ( ON ?auto_273950 ?auto_273951 ) ( ON ?auto_273949 ?auto_273950 ) ( ON ?auto_273948 ?auto_273949 ) ( ON ?auto_273947 ?auto_273948 ) ( CLEAR ?auto_273945 ) ( ON ?auto_273946 ?auto_273947 ) ( CLEAR ?auto_273946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_273941 ?auto_273942 ?auto_273943 ?auto_273944 ?auto_273945 ?auto_273946 )
      ( MAKE-12PILE ?auto_273941 ?auto_273942 ?auto_273943 ?auto_273944 ?auto_273945 ?auto_273946 ?auto_273947 ?auto_273948 ?auto_273949 ?auto_273950 ?auto_273951 ?auto_273952 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_273966 - BLOCK
      ?auto_273967 - BLOCK
      ?auto_273968 - BLOCK
      ?auto_273969 - BLOCK
      ?auto_273970 - BLOCK
      ?auto_273971 - BLOCK
      ?auto_273972 - BLOCK
      ?auto_273973 - BLOCK
      ?auto_273974 - BLOCK
      ?auto_273975 - BLOCK
      ?auto_273976 - BLOCK
      ?auto_273977 - BLOCK
    )
    :vars
    (
      ?auto_273978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_273977 ?auto_273978 ) ( ON-TABLE ?auto_273966 ) ( ON ?auto_273967 ?auto_273966 ) ( ON ?auto_273968 ?auto_273967 ) ( ON ?auto_273969 ?auto_273968 ) ( not ( = ?auto_273966 ?auto_273967 ) ) ( not ( = ?auto_273966 ?auto_273968 ) ) ( not ( = ?auto_273966 ?auto_273969 ) ) ( not ( = ?auto_273966 ?auto_273970 ) ) ( not ( = ?auto_273966 ?auto_273971 ) ) ( not ( = ?auto_273966 ?auto_273972 ) ) ( not ( = ?auto_273966 ?auto_273973 ) ) ( not ( = ?auto_273966 ?auto_273974 ) ) ( not ( = ?auto_273966 ?auto_273975 ) ) ( not ( = ?auto_273966 ?auto_273976 ) ) ( not ( = ?auto_273966 ?auto_273977 ) ) ( not ( = ?auto_273966 ?auto_273978 ) ) ( not ( = ?auto_273967 ?auto_273968 ) ) ( not ( = ?auto_273967 ?auto_273969 ) ) ( not ( = ?auto_273967 ?auto_273970 ) ) ( not ( = ?auto_273967 ?auto_273971 ) ) ( not ( = ?auto_273967 ?auto_273972 ) ) ( not ( = ?auto_273967 ?auto_273973 ) ) ( not ( = ?auto_273967 ?auto_273974 ) ) ( not ( = ?auto_273967 ?auto_273975 ) ) ( not ( = ?auto_273967 ?auto_273976 ) ) ( not ( = ?auto_273967 ?auto_273977 ) ) ( not ( = ?auto_273967 ?auto_273978 ) ) ( not ( = ?auto_273968 ?auto_273969 ) ) ( not ( = ?auto_273968 ?auto_273970 ) ) ( not ( = ?auto_273968 ?auto_273971 ) ) ( not ( = ?auto_273968 ?auto_273972 ) ) ( not ( = ?auto_273968 ?auto_273973 ) ) ( not ( = ?auto_273968 ?auto_273974 ) ) ( not ( = ?auto_273968 ?auto_273975 ) ) ( not ( = ?auto_273968 ?auto_273976 ) ) ( not ( = ?auto_273968 ?auto_273977 ) ) ( not ( = ?auto_273968 ?auto_273978 ) ) ( not ( = ?auto_273969 ?auto_273970 ) ) ( not ( = ?auto_273969 ?auto_273971 ) ) ( not ( = ?auto_273969 ?auto_273972 ) ) ( not ( = ?auto_273969 ?auto_273973 ) ) ( not ( = ?auto_273969 ?auto_273974 ) ) ( not ( = ?auto_273969 ?auto_273975 ) ) ( not ( = ?auto_273969 ?auto_273976 ) ) ( not ( = ?auto_273969 ?auto_273977 ) ) ( not ( = ?auto_273969 ?auto_273978 ) ) ( not ( = ?auto_273970 ?auto_273971 ) ) ( not ( = ?auto_273970 ?auto_273972 ) ) ( not ( = ?auto_273970 ?auto_273973 ) ) ( not ( = ?auto_273970 ?auto_273974 ) ) ( not ( = ?auto_273970 ?auto_273975 ) ) ( not ( = ?auto_273970 ?auto_273976 ) ) ( not ( = ?auto_273970 ?auto_273977 ) ) ( not ( = ?auto_273970 ?auto_273978 ) ) ( not ( = ?auto_273971 ?auto_273972 ) ) ( not ( = ?auto_273971 ?auto_273973 ) ) ( not ( = ?auto_273971 ?auto_273974 ) ) ( not ( = ?auto_273971 ?auto_273975 ) ) ( not ( = ?auto_273971 ?auto_273976 ) ) ( not ( = ?auto_273971 ?auto_273977 ) ) ( not ( = ?auto_273971 ?auto_273978 ) ) ( not ( = ?auto_273972 ?auto_273973 ) ) ( not ( = ?auto_273972 ?auto_273974 ) ) ( not ( = ?auto_273972 ?auto_273975 ) ) ( not ( = ?auto_273972 ?auto_273976 ) ) ( not ( = ?auto_273972 ?auto_273977 ) ) ( not ( = ?auto_273972 ?auto_273978 ) ) ( not ( = ?auto_273973 ?auto_273974 ) ) ( not ( = ?auto_273973 ?auto_273975 ) ) ( not ( = ?auto_273973 ?auto_273976 ) ) ( not ( = ?auto_273973 ?auto_273977 ) ) ( not ( = ?auto_273973 ?auto_273978 ) ) ( not ( = ?auto_273974 ?auto_273975 ) ) ( not ( = ?auto_273974 ?auto_273976 ) ) ( not ( = ?auto_273974 ?auto_273977 ) ) ( not ( = ?auto_273974 ?auto_273978 ) ) ( not ( = ?auto_273975 ?auto_273976 ) ) ( not ( = ?auto_273975 ?auto_273977 ) ) ( not ( = ?auto_273975 ?auto_273978 ) ) ( not ( = ?auto_273976 ?auto_273977 ) ) ( not ( = ?auto_273976 ?auto_273978 ) ) ( not ( = ?auto_273977 ?auto_273978 ) ) ( ON ?auto_273976 ?auto_273977 ) ( ON ?auto_273975 ?auto_273976 ) ( ON ?auto_273974 ?auto_273975 ) ( ON ?auto_273973 ?auto_273974 ) ( ON ?auto_273972 ?auto_273973 ) ( ON ?auto_273971 ?auto_273972 ) ( CLEAR ?auto_273969 ) ( ON ?auto_273970 ?auto_273971 ) ( CLEAR ?auto_273970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_273966 ?auto_273967 ?auto_273968 ?auto_273969 ?auto_273970 )
      ( MAKE-12PILE ?auto_273966 ?auto_273967 ?auto_273968 ?auto_273969 ?auto_273970 ?auto_273971 ?auto_273972 ?auto_273973 ?auto_273974 ?auto_273975 ?auto_273976 ?auto_273977 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_273991 - BLOCK
      ?auto_273992 - BLOCK
      ?auto_273993 - BLOCK
      ?auto_273994 - BLOCK
      ?auto_273995 - BLOCK
      ?auto_273996 - BLOCK
      ?auto_273997 - BLOCK
      ?auto_273998 - BLOCK
      ?auto_273999 - BLOCK
      ?auto_274000 - BLOCK
      ?auto_274001 - BLOCK
      ?auto_274002 - BLOCK
    )
    :vars
    (
      ?auto_274003 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_274002 ?auto_274003 ) ( ON-TABLE ?auto_273991 ) ( ON ?auto_273992 ?auto_273991 ) ( ON ?auto_273993 ?auto_273992 ) ( ON ?auto_273994 ?auto_273993 ) ( not ( = ?auto_273991 ?auto_273992 ) ) ( not ( = ?auto_273991 ?auto_273993 ) ) ( not ( = ?auto_273991 ?auto_273994 ) ) ( not ( = ?auto_273991 ?auto_273995 ) ) ( not ( = ?auto_273991 ?auto_273996 ) ) ( not ( = ?auto_273991 ?auto_273997 ) ) ( not ( = ?auto_273991 ?auto_273998 ) ) ( not ( = ?auto_273991 ?auto_273999 ) ) ( not ( = ?auto_273991 ?auto_274000 ) ) ( not ( = ?auto_273991 ?auto_274001 ) ) ( not ( = ?auto_273991 ?auto_274002 ) ) ( not ( = ?auto_273991 ?auto_274003 ) ) ( not ( = ?auto_273992 ?auto_273993 ) ) ( not ( = ?auto_273992 ?auto_273994 ) ) ( not ( = ?auto_273992 ?auto_273995 ) ) ( not ( = ?auto_273992 ?auto_273996 ) ) ( not ( = ?auto_273992 ?auto_273997 ) ) ( not ( = ?auto_273992 ?auto_273998 ) ) ( not ( = ?auto_273992 ?auto_273999 ) ) ( not ( = ?auto_273992 ?auto_274000 ) ) ( not ( = ?auto_273992 ?auto_274001 ) ) ( not ( = ?auto_273992 ?auto_274002 ) ) ( not ( = ?auto_273992 ?auto_274003 ) ) ( not ( = ?auto_273993 ?auto_273994 ) ) ( not ( = ?auto_273993 ?auto_273995 ) ) ( not ( = ?auto_273993 ?auto_273996 ) ) ( not ( = ?auto_273993 ?auto_273997 ) ) ( not ( = ?auto_273993 ?auto_273998 ) ) ( not ( = ?auto_273993 ?auto_273999 ) ) ( not ( = ?auto_273993 ?auto_274000 ) ) ( not ( = ?auto_273993 ?auto_274001 ) ) ( not ( = ?auto_273993 ?auto_274002 ) ) ( not ( = ?auto_273993 ?auto_274003 ) ) ( not ( = ?auto_273994 ?auto_273995 ) ) ( not ( = ?auto_273994 ?auto_273996 ) ) ( not ( = ?auto_273994 ?auto_273997 ) ) ( not ( = ?auto_273994 ?auto_273998 ) ) ( not ( = ?auto_273994 ?auto_273999 ) ) ( not ( = ?auto_273994 ?auto_274000 ) ) ( not ( = ?auto_273994 ?auto_274001 ) ) ( not ( = ?auto_273994 ?auto_274002 ) ) ( not ( = ?auto_273994 ?auto_274003 ) ) ( not ( = ?auto_273995 ?auto_273996 ) ) ( not ( = ?auto_273995 ?auto_273997 ) ) ( not ( = ?auto_273995 ?auto_273998 ) ) ( not ( = ?auto_273995 ?auto_273999 ) ) ( not ( = ?auto_273995 ?auto_274000 ) ) ( not ( = ?auto_273995 ?auto_274001 ) ) ( not ( = ?auto_273995 ?auto_274002 ) ) ( not ( = ?auto_273995 ?auto_274003 ) ) ( not ( = ?auto_273996 ?auto_273997 ) ) ( not ( = ?auto_273996 ?auto_273998 ) ) ( not ( = ?auto_273996 ?auto_273999 ) ) ( not ( = ?auto_273996 ?auto_274000 ) ) ( not ( = ?auto_273996 ?auto_274001 ) ) ( not ( = ?auto_273996 ?auto_274002 ) ) ( not ( = ?auto_273996 ?auto_274003 ) ) ( not ( = ?auto_273997 ?auto_273998 ) ) ( not ( = ?auto_273997 ?auto_273999 ) ) ( not ( = ?auto_273997 ?auto_274000 ) ) ( not ( = ?auto_273997 ?auto_274001 ) ) ( not ( = ?auto_273997 ?auto_274002 ) ) ( not ( = ?auto_273997 ?auto_274003 ) ) ( not ( = ?auto_273998 ?auto_273999 ) ) ( not ( = ?auto_273998 ?auto_274000 ) ) ( not ( = ?auto_273998 ?auto_274001 ) ) ( not ( = ?auto_273998 ?auto_274002 ) ) ( not ( = ?auto_273998 ?auto_274003 ) ) ( not ( = ?auto_273999 ?auto_274000 ) ) ( not ( = ?auto_273999 ?auto_274001 ) ) ( not ( = ?auto_273999 ?auto_274002 ) ) ( not ( = ?auto_273999 ?auto_274003 ) ) ( not ( = ?auto_274000 ?auto_274001 ) ) ( not ( = ?auto_274000 ?auto_274002 ) ) ( not ( = ?auto_274000 ?auto_274003 ) ) ( not ( = ?auto_274001 ?auto_274002 ) ) ( not ( = ?auto_274001 ?auto_274003 ) ) ( not ( = ?auto_274002 ?auto_274003 ) ) ( ON ?auto_274001 ?auto_274002 ) ( ON ?auto_274000 ?auto_274001 ) ( ON ?auto_273999 ?auto_274000 ) ( ON ?auto_273998 ?auto_273999 ) ( ON ?auto_273997 ?auto_273998 ) ( ON ?auto_273996 ?auto_273997 ) ( CLEAR ?auto_273994 ) ( ON ?auto_273995 ?auto_273996 ) ( CLEAR ?auto_273995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_273991 ?auto_273992 ?auto_273993 ?auto_273994 ?auto_273995 )
      ( MAKE-12PILE ?auto_273991 ?auto_273992 ?auto_273993 ?auto_273994 ?auto_273995 ?auto_273996 ?auto_273997 ?auto_273998 ?auto_273999 ?auto_274000 ?auto_274001 ?auto_274002 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_274016 - BLOCK
      ?auto_274017 - BLOCK
      ?auto_274018 - BLOCK
      ?auto_274019 - BLOCK
      ?auto_274020 - BLOCK
      ?auto_274021 - BLOCK
      ?auto_274022 - BLOCK
      ?auto_274023 - BLOCK
      ?auto_274024 - BLOCK
      ?auto_274025 - BLOCK
      ?auto_274026 - BLOCK
      ?auto_274027 - BLOCK
    )
    :vars
    (
      ?auto_274028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_274027 ?auto_274028 ) ( ON-TABLE ?auto_274016 ) ( ON ?auto_274017 ?auto_274016 ) ( ON ?auto_274018 ?auto_274017 ) ( not ( = ?auto_274016 ?auto_274017 ) ) ( not ( = ?auto_274016 ?auto_274018 ) ) ( not ( = ?auto_274016 ?auto_274019 ) ) ( not ( = ?auto_274016 ?auto_274020 ) ) ( not ( = ?auto_274016 ?auto_274021 ) ) ( not ( = ?auto_274016 ?auto_274022 ) ) ( not ( = ?auto_274016 ?auto_274023 ) ) ( not ( = ?auto_274016 ?auto_274024 ) ) ( not ( = ?auto_274016 ?auto_274025 ) ) ( not ( = ?auto_274016 ?auto_274026 ) ) ( not ( = ?auto_274016 ?auto_274027 ) ) ( not ( = ?auto_274016 ?auto_274028 ) ) ( not ( = ?auto_274017 ?auto_274018 ) ) ( not ( = ?auto_274017 ?auto_274019 ) ) ( not ( = ?auto_274017 ?auto_274020 ) ) ( not ( = ?auto_274017 ?auto_274021 ) ) ( not ( = ?auto_274017 ?auto_274022 ) ) ( not ( = ?auto_274017 ?auto_274023 ) ) ( not ( = ?auto_274017 ?auto_274024 ) ) ( not ( = ?auto_274017 ?auto_274025 ) ) ( not ( = ?auto_274017 ?auto_274026 ) ) ( not ( = ?auto_274017 ?auto_274027 ) ) ( not ( = ?auto_274017 ?auto_274028 ) ) ( not ( = ?auto_274018 ?auto_274019 ) ) ( not ( = ?auto_274018 ?auto_274020 ) ) ( not ( = ?auto_274018 ?auto_274021 ) ) ( not ( = ?auto_274018 ?auto_274022 ) ) ( not ( = ?auto_274018 ?auto_274023 ) ) ( not ( = ?auto_274018 ?auto_274024 ) ) ( not ( = ?auto_274018 ?auto_274025 ) ) ( not ( = ?auto_274018 ?auto_274026 ) ) ( not ( = ?auto_274018 ?auto_274027 ) ) ( not ( = ?auto_274018 ?auto_274028 ) ) ( not ( = ?auto_274019 ?auto_274020 ) ) ( not ( = ?auto_274019 ?auto_274021 ) ) ( not ( = ?auto_274019 ?auto_274022 ) ) ( not ( = ?auto_274019 ?auto_274023 ) ) ( not ( = ?auto_274019 ?auto_274024 ) ) ( not ( = ?auto_274019 ?auto_274025 ) ) ( not ( = ?auto_274019 ?auto_274026 ) ) ( not ( = ?auto_274019 ?auto_274027 ) ) ( not ( = ?auto_274019 ?auto_274028 ) ) ( not ( = ?auto_274020 ?auto_274021 ) ) ( not ( = ?auto_274020 ?auto_274022 ) ) ( not ( = ?auto_274020 ?auto_274023 ) ) ( not ( = ?auto_274020 ?auto_274024 ) ) ( not ( = ?auto_274020 ?auto_274025 ) ) ( not ( = ?auto_274020 ?auto_274026 ) ) ( not ( = ?auto_274020 ?auto_274027 ) ) ( not ( = ?auto_274020 ?auto_274028 ) ) ( not ( = ?auto_274021 ?auto_274022 ) ) ( not ( = ?auto_274021 ?auto_274023 ) ) ( not ( = ?auto_274021 ?auto_274024 ) ) ( not ( = ?auto_274021 ?auto_274025 ) ) ( not ( = ?auto_274021 ?auto_274026 ) ) ( not ( = ?auto_274021 ?auto_274027 ) ) ( not ( = ?auto_274021 ?auto_274028 ) ) ( not ( = ?auto_274022 ?auto_274023 ) ) ( not ( = ?auto_274022 ?auto_274024 ) ) ( not ( = ?auto_274022 ?auto_274025 ) ) ( not ( = ?auto_274022 ?auto_274026 ) ) ( not ( = ?auto_274022 ?auto_274027 ) ) ( not ( = ?auto_274022 ?auto_274028 ) ) ( not ( = ?auto_274023 ?auto_274024 ) ) ( not ( = ?auto_274023 ?auto_274025 ) ) ( not ( = ?auto_274023 ?auto_274026 ) ) ( not ( = ?auto_274023 ?auto_274027 ) ) ( not ( = ?auto_274023 ?auto_274028 ) ) ( not ( = ?auto_274024 ?auto_274025 ) ) ( not ( = ?auto_274024 ?auto_274026 ) ) ( not ( = ?auto_274024 ?auto_274027 ) ) ( not ( = ?auto_274024 ?auto_274028 ) ) ( not ( = ?auto_274025 ?auto_274026 ) ) ( not ( = ?auto_274025 ?auto_274027 ) ) ( not ( = ?auto_274025 ?auto_274028 ) ) ( not ( = ?auto_274026 ?auto_274027 ) ) ( not ( = ?auto_274026 ?auto_274028 ) ) ( not ( = ?auto_274027 ?auto_274028 ) ) ( ON ?auto_274026 ?auto_274027 ) ( ON ?auto_274025 ?auto_274026 ) ( ON ?auto_274024 ?auto_274025 ) ( ON ?auto_274023 ?auto_274024 ) ( ON ?auto_274022 ?auto_274023 ) ( ON ?auto_274021 ?auto_274022 ) ( ON ?auto_274020 ?auto_274021 ) ( CLEAR ?auto_274018 ) ( ON ?auto_274019 ?auto_274020 ) ( CLEAR ?auto_274019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_274016 ?auto_274017 ?auto_274018 ?auto_274019 )
      ( MAKE-12PILE ?auto_274016 ?auto_274017 ?auto_274018 ?auto_274019 ?auto_274020 ?auto_274021 ?auto_274022 ?auto_274023 ?auto_274024 ?auto_274025 ?auto_274026 ?auto_274027 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_274041 - BLOCK
      ?auto_274042 - BLOCK
      ?auto_274043 - BLOCK
      ?auto_274044 - BLOCK
      ?auto_274045 - BLOCK
      ?auto_274046 - BLOCK
      ?auto_274047 - BLOCK
      ?auto_274048 - BLOCK
      ?auto_274049 - BLOCK
      ?auto_274050 - BLOCK
      ?auto_274051 - BLOCK
      ?auto_274052 - BLOCK
    )
    :vars
    (
      ?auto_274053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_274052 ?auto_274053 ) ( ON-TABLE ?auto_274041 ) ( ON ?auto_274042 ?auto_274041 ) ( ON ?auto_274043 ?auto_274042 ) ( not ( = ?auto_274041 ?auto_274042 ) ) ( not ( = ?auto_274041 ?auto_274043 ) ) ( not ( = ?auto_274041 ?auto_274044 ) ) ( not ( = ?auto_274041 ?auto_274045 ) ) ( not ( = ?auto_274041 ?auto_274046 ) ) ( not ( = ?auto_274041 ?auto_274047 ) ) ( not ( = ?auto_274041 ?auto_274048 ) ) ( not ( = ?auto_274041 ?auto_274049 ) ) ( not ( = ?auto_274041 ?auto_274050 ) ) ( not ( = ?auto_274041 ?auto_274051 ) ) ( not ( = ?auto_274041 ?auto_274052 ) ) ( not ( = ?auto_274041 ?auto_274053 ) ) ( not ( = ?auto_274042 ?auto_274043 ) ) ( not ( = ?auto_274042 ?auto_274044 ) ) ( not ( = ?auto_274042 ?auto_274045 ) ) ( not ( = ?auto_274042 ?auto_274046 ) ) ( not ( = ?auto_274042 ?auto_274047 ) ) ( not ( = ?auto_274042 ?auto_274048 ) ) ( not ( = ?auto_274042 ?auto_274049 ) ) ( not ( = ?auto_274042 ?auto_274050 ) ) ( not ( = ?auto_274042 ?auto_274051 ) ) ( not ( = ?auto_274042 ?auto_274052 ) ) ( not ( = ?auto_274042 ?auto_274053 ) ) ( not ( = ?auto_274043 ?auto_274044 ) ) ( not ( = ?auto_274043 ?auto_274045 ) ) ( not ( = ?auto_274043 ?auto_274046 ) ) ( not ( = ?auto_274043 ?auto_274047 ) ) ( not ( = ?auto_274043 ?auto_274048 ) ) ( not ( = ?auto_274043 ?auto_274049 ) ) ( not ( = ?auto_274043 ?auto_274050 ) ) ( not ( = ?auto_274043 ?auto_274051 ) ) ( not ( = ?auto_274043 ?auto_274052 ) ) ( not ( = ?auto_274043 ?auto_274053 ) ) ( not ( = ?auto_274044 ?auto_274045 ) ) ( not ( = ?auto_274044 ?auto_274046 ) ) ( not ( = ?auto_274044 ?auto_274047 ) ) ( not ( = ?auto_274044 ?auto_274048 ) ) ( not ( = ?auto_274044 ?auto_274049 ) ) ( not ( = ?auto_274044 ?auto_274050 ) ) ( not ( = ?auto_274044 ?auto_274051 ) ) ( not ( = ?auto_274044 ?auto_274052 ) ) ( not ( = ?auto_274044 ?auto_274053 ) ) ( not ( = ?auto_274045 ?auto_274046 ) ) ( not ( = ?auto_274045 ?auto_274047 ) ) ( not ( = ?auto_274045 ?auto_274048 ) ) ( not ( = ?auto_274045 ?auto_274049 ) ) ( not ( = ?auto_274045 ?auto_274050 ) ) ( not ( = ?auto_274045 ?auto_274051 ) ) ( not ( = ?auto_274045 ?auto_274052 ) ) ( not ( = ?auto_274045 ?auto_274053 ) ) ( not ( = ?auto_274046 ?auto_274047 ) ) ( not ( = ?auto_274046 ?auto_274048 ) ) ( not ( = ?auto_274046 ?auto_274049 ) ) ( not ( = ?auto_274046 ?auto_274050 ) ) ( not ( = ?auto_274046 ?auto_274051 ) ) ( not ( = ?auto_274046 ?auto_274052 ) ) ( not ( = ?auto_274046 ?auto_274053 ) ) ( not ( = ?auto_274047 ?auto_274048 ) ) ( not ( = ?auto_274047 ?auto_274049 ) ) ( not ( = ?auto_274047 ?auto_274050 ) ) ( not ( = ?auto_274047 ?auto_274051 ) ) ( not ( = ?auto_274047 ?auto_274052 ) ) ( not ( = ?auto_274047 ?auto_274053 ) ) ( not ( = ?auto_274048 ?auto_274049 ) ) ( not ( = ?auto_274048 ?auto_274050 ) ) ( not ( = ?auto_274048 ?auto_274051 ) ) ( not ( = ?auto_274048 ?auto_274052 ) ) ( not ( = ?auto_274048 ?auto_274053 ) ) ( not ( = ?auto_274049 ?auto_274050 ) ) ( not ( = ?auto_274049 ?auto_274051 ) ) ( not ( = ?auto_274049 ?auto_274052 ) ) ( not ( = ?auto_274049 ?auto_274053 ) ) ( not ( = ?auto_274050 ?auto_274051 ) ) ( not ( = ?auto_274050 ?auto_274052 ) ) ( not ( = ?auto_274050 ?auto_274053 ) ) ( not ( = ?auto_274051 ?auto_274052 ) ) ( not ( = ?auto_274051 ?auto_274053 ) ) ( not ( = ?auto_274052 ?auto_274053 ) ) ( ON ?auto_274051 ?auto_274052 ) ( ON ?auto_274050 ?auto_274051 ) ( ON ?auto_274049 ?auto_274050 ) ( ON ?auto_274048 ?auto_274049 ) ( ON ?auto_274047 ?auto_274048 ) ( ON ?auto_274046 ?auto_274047 ) ( ON ?auto_274045 ?auto_274046 ) ( CLEAR ?auto_274043 ) ( ON ?auto_274044 ?auto_274045 ) ( CLEAR ?auto_274044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_274041 ?auto_274042 ?auto_274043 ?auto_274044 )
      ( MAKE-12PILE ?auto_274041 ?auto_274042 ?auto_274043 ?auto_274044 ?auto_274045 ?auto_274046 ?auto_274047 ?auto_274048 ?auto_274049 ?auto_274050 ?auto_274051 ?auto_274052 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_274066 - BLOCK
      ?auto_274067 - BLOCK
      ?auto_274068 - BLOCK
      ?auto_274069 - BLOCK
      ?auto_274070 - BLOCK
      ?auto_274071 - BLOCK
      ?auto_274072 - BLOCK
      ?auto_274073 - BLOCK
      ?auto_274074 - BLOCK
      ?auto_274075 - BLOCK
      ?auto_274076 - BLOCK
      ?auto_274077 - BLOCK
    )
    :vars
    (
      ?auto_274078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_274077 ?auto_274078 ) ( ON-TABLE ?auto_274066 ) ( ON ?auto_274067 ?auto_274066 ) ( not ( = ?auto_274066 ?auto_274067 ) ) ( not ( = ?auto_274066 ?auto_274068 ) ) ( not ( = ?auto_274066 ?auto_274069 ) ) ( not ( = ?auto_274066 ?auto_274070 ) ) ( not ( = ?auto_274066 ?auto_274071 ) ) ( not ( = ?auto_274066 ?auto_274072 ) ) ( not ( = ?auto_274066 ?auto_274073 ) ) ( not ( = ?auto_274066 ?auto_274074 ) ) ( not ( = ?auto_274066 ?auto_274075 ) ) ( not ( = ?auto_274066 ?auto_274076 ) ) ( not ( = ?auto_274066 ?auto_274077 ) ) ( not ( = ?auto_274066 ?auto_274078 ) ) ( not ( = ?auto_274067 ?auto_274068 ) ) ( not ( = ?auto_274067 ?auto_274069 ) ) ( not ( = ?auto_274067 ?auto_274070 ) ) ( not ( = ?auto_274067 ?auto_274071 ) ) ( not ( = ?auto_274067 ?auto_274072 ) ) ( not ( = ?auto_274067 ?auto_274073 ) ) ( not ( = ?auto_274067 ?auto_274074 ) ) ( not ( = ?auto_274067 ?auto_274075 ) ) ( not ( = ?auto_274067 ?auto_274076 ) ) ( not ( = ?auto_274067 ?auto_274077 ) ) ( not ( = ?auto_274067 ?auto_274078 ) ) ( not ( = ?auto_274068 ?auto_274069 ) ) ( not ( = ?auto_274068 ?auto_274070 ) ) ( not ( = ?auto_274068 ?auto_274071 ) ) ( not ( = ?auto_274068 ?auto_274072 ) ) ( not ( = ?auto_274068 ?auto_274073 ) ) ( not ( = ?auto_274068 ?auto_274074 ) ) ( not ( = ?auto_274068 ?auto_274075 ) ) ( not ( = ?auto_274068 ?auto_274076 ) ) ( not ( = ?auto_274068 ?auto_274077 ) ) ( not ( = ?auto_274068 ?auto_274078 ) ) ( not ( = ?auto_274069 ?auto_274070 ) ) ( not ( = ?auto_274069 ?auto_274071 ) ) ( not ( = ?auto_274069 ?auto_274072 ) ) ( not ( = ?auto_274069 ?auto_274073 ) ) ( not ( = ?auto_274069 ?auto_274074 ) ) ( not ( = ?auto_274069 ?auto_274075 ) ) ( not ( = ?auto_274069 ?auto_274076 ) ) ( not ( = ?auto_274069 ?auto_274077 ) ) ( not ( = ?auto_274069 ?auto_274078 ) ) ( not ( = ?auto_274070 ?auto_274071 ) ) ( not ( = ?auto_274070 ?auto_274072 ) ) ( not ( = ?auto_274070 ?auto_274073 ) ) ( not ( = ?auto_274070 ?auto_274074 ) ) ( not ( = ?auto_274070 ?auto_274075 ) ) ( not ( = ?auto_274070 ?auto_274076 ) ) ( not ( = ?auto_274070 ?auto_274077 ) ) ( not ( = ?auto_274070 ?auto_274078 ) ) ( not ( = ?auto_274071 ?auto_274072 ) ) ( not ( = ?auto_274071 ?auto_274073 ) ) ( not ( = ?auto_274071 ?auto_274074 ) ) ( not ( = ?auto_274071 ?auto_274075 ) ) ( not ( = ?auto_274071 ?auto_274076 ) ) ( not ( = ?auto_274071 ?auto_274077 ) ) ( not ( = ?auto_274071 ?auto_274078 ) ) ( not ( = ?auto_274072 ?auto_274073 ) ) ( not ( = ?auto_274072 ?auto_274074 ) ) ( not ( = ?auto_274072 ?auto_274075 ) ) ( not ( = ?auto_274072 ?auto_274076 ) ) ( not ( = ?auto_274072 ?auto_274077 ) ) ( not ( = ?auto_274072 ?auto_274078 ) ) ( not ( = ?auto_274073 ?auto_274074 ) ) ( not ( = ?auto_274073 ?auto_274075 ) ) ( not ( = ?auto_274073 ?auto_274076 ) ) ( not ( = ?auto_274073 ?auto_274077 ) ) ( not ( = ?auto_274073 ?auto_274078 ) ) ( not ( = ?auto_274074 ?auto_274075 ) ) ( not ( = ?auto_274074 ?auto_274076 ) ) ( not ( = ?auto_274074 ?auto_274077 ) ) ( not ( = ?auto_274074 ?auto_274078 ) ) ( not ( = ?auto_274075 ?auto_274076 ) ) ( not ( = ?auto_274075 ?auto_274077 ) ) ( not ( = ?auto_274075 ?auto_274078 ) ) ( not ( = ?auto_274076 ?auto_274077 ) ) ( not ( = ?auto_274076 ?auto_274078 ) ) ( not ( = ?auto_274077 ?auto_274078 ) ) ( ON ?auto_274076 ?auto_274077 ) ( ON ?auto_274075 ?auto_274076 ) ( ON ?auto_274074 ?auto_274075 ) ( ON ?auto_274073 ?auto_274074 ) ( ON ?auto_274072 ?auto_274073 ) ( ON ?auto_274071 ?auto_274072 ) ( ON ?auto_274070 ?auto_274071 ) ( ON ?auto_274069 ?auto_274070 ) ( CLEAR ?auto_274067 ) ( ON ?auto_274068 ?auto_274069 ) ( CLEAR ?auto_274068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_274066 ?auto_274067 ?auto_274068 )
      ( MAKE-12PILE ?auto_274066 ?auto_274067 ?auto_274068 ?auto_274069 ?auto_274070 ?auto_274071 ?auto_274072 ?auto_274073 ?auto_274074 ?auto_274075 ?auto_274076 ?auto_274077 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_274091 - BLOCK
      ?auto_274092 - BLOCK
      ?auto_274093 - BLOCK
      ?auto_274094 - BLOCK
      ?auto_274095 - BLOCK
      ?auto_274096 - BLOCK
      ?auto_274097 - BLOCK
      ?auto_274098 - BLOCK
      ?auto_274099 - BLOCK
      ?auto_274100 - BLOCK
      ?auto_274101 - BLOCK
      ?auto_274102 - BLOCK
    )
    :vars
    (
      ?auto_274103 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_274102 ?auto_274103 ) ( ON-TABLE ?auto_274091 ) ( ON ?auto_274092 ?auto_274091 ) ( not ( = ?auto_274091 ?auto_274092 ) ) ( not ( = ?auto_274091 ?auto_274093 ) ) ( not ( = ?auto_274091 ?auto_274094 ) ) ( not ( = ?auto_274091 ?auto_274095 ) ) ( not ( = ?auto_274091 ?auto_274096 ) ) ( not ( = ?auto_274091 ?auto_274097 ) ) ( not ( = ?auto_274091 ?auto_274098 ) ) ( not ( = ?auto_274091 ?auto_274099 ) ) ( not ( = ?auto_274091 ?auto_274100 ) ) ( not ( = ?auto_274091 ?auto_274101 ) ) ( not ( = ?auto_274091 ?auto_274102 ) ) ( not ( = ?auto_274091 ?auto_274103 ) ) ( not ( = ?auto_274092 ?auto_274093 ) ) ( not ( = ?auto_274092 ?auto_274094 ) ) ( not ( = ?auto_274092 ?auto_274095 ) ) ( not ( = ?auto_274092 ?auto_274096 ) ) ( not ( = ?auto_274092 ?auto_274097 ) ) ( not ( = ?auto_274092 ?auto_274098 ) ) ( not ( = ?auto_274092 ?auto_274099 ) ) ( not ( = ?auto_274092 ?auto_274100 ) ) ( not ( = ?auto_274092 ?auto_274101 ) ) ( not ( = ?auto_274092 ?auto_274102 ) ) ( not ( = ?auto_274092 ?auto_274103 ) ) ( not ( = ?auto_274093 ?auto_274094 ) ) ( not ( = ?auto_274093 ?auto_274095 ) ) ( not ( = ?auto_274093 ?auto_274096 ) ) ( not ( = ?auto_274093 ?auto_274097 ) ) ( not ( = ?auto_274093 ?auto_274098 ) ) ( not ( = ?auto_274093 ?auto_274099 ) ) ( not ( = ?auto_274093 ?auto_274100 ) ) ( not ( = ?auto_274093 ?auto_274101 ) ) ( not ( = ?auto_274093 ?auto_274102 ) ) ( not ( = ?auto_274093 ?auto_274103 ) ) ( not ( = ?auto_274094 ?auto_274095 ) ) ( not ( = ?auto_274094 ?auto_274096 ) ) ( not ( = ?auto_274094 ?auto_274097 ) ) ( not ( = ?auto_274094 ?auto_274098 ) ) ( not ( = ?auto_274094 ?auto_274099 ) ) ( not ( = ?auto_274094 ?auto_274100 ) ) ( not ( = ?auto_274094 ?auto_274101 ) ) ( not ( = ?auto_274094 ?auto_274102 ) ) ( not ( = ?auto_274094 ?auto_274103 ) ) ( not ( = ?auto_274095 ?auto_274096 ) ) ( not ( = ?auto_274095 ?auto_274097 ) ) ( not ( = ?auto_274095 ?auto_274098 ) ) ( not ( = ?auto_274095 ?auto_274099 ) ) ( not ( = ?auto_274095 ?auto_274100 ) ) ( not ( = ?auto_274095 ?auto_274101 ) ) ( not ( = ?auto_274095 ?auto_274102 ) ) ( not ( = ?auto_274095 ?auto_274103 ) ) ( not ( = ?auto_274096 ?auto_274097 ) ) ( not ( = ?auto_274096 ?auto_274098 ) ) ( not ( = ?auto_274096 ?auto_274099 ) ) ( not ( = ?auto_274096 ?auto_274100 ) ) ( not ( = ?auto_274096 ?auto_274101 ) ) ( not ( = ?auto_274096 ?auto_274102 ) ) ( not ( = ?auto_274096 ?auto_274103 ) ) ( not ( = ?auto_274097 ?auto_274098 ) ) ( not ( = ?auto_274097 ?auto_274099 ) ) ( not ( = ?auto_274097 ?auto_274100 ) ) ( not ( = ?auto_274097 ?auto_274101 ) ) ( not ( = ?auto_274097 ?auto_274102 ) ) ( not ( = ?auto_274097 ?auto_274103 ) ) ( not ( = ?auto_274098 ?auto_274099 ) ) ( not ( = ?auto_274098 ?auto_274100 ) ) ( not ( = ?auto_274098 ?auto_274101 ) ) ( not ( = ?auto_274098 ?auto_274102 ) ) ( not ( = ?auto_274098 ?auto_274103 ) ) ( not ( = ?auto_274099 ?auto_274100 ) ) ( not ( = ?auto_274099 ?auto_274101 ) ) ( not ( = ?auto_274099 ?auto_274102 ) ) ( not ( = ?auto_274099 ?auto_274103 ) ) ( not ( = ?auto_274100 ?auto_274101 ) ) ( not ( = ?auto_274100 ?auto_274102 ) ) ( not ( = ?auto_274100 ?auto_274103 ) ) ( not ( = ?auto_274101 ?auto_274102 ) ) ( not ( = ?auto_274101 ?auto_274103 ) ) ( not ( = ?auto_274102 ?auto_274103 ) ) ( ON ?auto_274101 ?auto_274102 ) ( ON ?auto_274100 ?auto_274101 ) ( ON ?auto_274099 ?auto_274100 ) ( ON ?auto_274098 ?auto_274099 ) ( ON ?auto_274097 ?auto_274098 ) ( ON ?auto_274096 ?auto_274097 ) ( ON ?auto_274095 ?auto_274096 ) ( ON ?auto_274094 ?auto_274095 ) ( CLEAR ?auto_274092 ) ( ON ?auto_274093 ?auto_274094 ) ( CLEAR ?auto_274093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_274091 ?auto_274092 ?auto_274093 )
      ( MAKE-12PILE ?auto_274091 ?auto_274092 ?auto_274093 ?auto_274094 ?auto_274095 ?auto_274096 ?auto_274097 ?auto_274098 ?auto_274099 ?auto_274100 ?auto_274101 ?auto_274102 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_274116 - BLOCK
      ?auto_274117 - BLOCK
      ?auto_274118 - BLOCK
      ?auto_274119 - BLOCK
      ?auto_274120 - BLOCK
      ?auto_274121 - BLOCK
      ?auto_274122 - BLOCK
      ?auto_274123 - BLOCK
      ?auto_274124 - BLOCK
      ?auto_274125 - BLOCK
      ?auto_274126 - BLOCK
      ?auto_274127 - BLOCK
    )
    :vars
    (
      ?auto_274128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_274127 ?auto_274128 ) ( ON-TABLE ?auto_274116 ) ( not ( = ?auto_274116 ?auto_274117 ) ) ( not ( = ?auto_274116 ?auto_274118 ) ) ( not ( = ?auto_274116 ?auto_274119 ) ) ( not ( = ?auto_274116 ?auto_274120 ) ) ( not ( = ?auto_274116 ?auto_274121 ) ) ( not ( = ?auto_274116 ?auto_274122 ) ) ( not ( = ?auto_274116 ?auto_274123 ) ) ( not ( = ?auto_274116 ?auto_274124 ) ) ( not ( = ?auto_274116 ?auto_274125 ) ) ( not ( = ?auto_274116 ?auto_274126 ) ) ( not ( = ?auto_274116 ?auto_274127 ) ) ( not ( = ?auto_274116 ?auto_274128 ) ) ( not ( = ?auto_274117 ?auto_274118 ) ) ( not ( = ?auto_274117 ?auto_274119 ) ) ( not ( = ?auto_274117 ?auto_274120 ) ) ( not ( = ?auto_274117 ?auto_274121 ) ) ( not ( = ?auto_274117 ?auto_274122 ) ) ( not ( = ?auto_274117 ?auto_274123 ) ) ( not ( = ?auto_274117 ?auto_274124 ) ) ( not ( = ?auto_274117 ?auto_274125 ) ) ( not ( = ?auto_274117 ?auto_274126 ) ) ( not ( = ?auto_274117 ?auto_274127 ) ) ( not ( = ?auto_274117 ?auto_274128 ) ) ( not ( = ?auto_274118 ?auto_274119 ) ) ( not ( = ?auto_274118 ?auto_274120 ) ) ( not ( = ?auto_274118 ?auto_274121 ) ) ( not ( = ?auto_274118 ?auto_274122 ) ) ( not ( = ?auto_274118 ?auto_274123 ) ) ( not ( = ?auto_274118 ?auto_274124 ) ) ( not ( = ?auto_274118 ?auto_274125 ) ) ( not ( = ?auto_274118 ?auto_274126 ) ) ( not ( = ?auto_274118 ?auto_274127 ) ) ( not ( = ?auto_274118 ?auto_274128 ) ) ( not ( = ?auto_274119 ?auto_274120 ) ) ( not ( = ?auto_274119 ?auto_274121 ) ) ( not ( = ?auto_274119 ?auto_274122 ) ) ( not ( = ?auto_274119 ?auto_274123 ) ) ( not ( = ?auto_274119 ?auto_274124 ) ) ( not ( = ?auto_274119 ?auto_274125 ) ) ( not ( = ?auto_274119 ?auto_274126 ) ) ( not ( = ?auto_274119 ?auto_274127 ) ) ( not ( = ?auto_274119 ?auto_274128 ) ) ( not ( = ?auto_274120 ?auto_274121 ) ) ( not ( = ?auto_274120 ?auto_274122 ) ) ( not ( = ?auto_274120 ?auto_274123 ) ) ( not ( = ?auto_274120 ?auto_274124 ) ) ( not ( = ?auto_274120 ?auto_274125 ) ) ( not ( = ?auto_274120 ?auto_274126 ) ) ( not ( = ?auto_274120 ?auto_274127 ) ) ( not ( = ?auto_274120 ?auto_274128 ) ) ( not ( = ?auto_274121 ?auto_274122 ) ) ( not ( = ?auto_274121 ?auto_274123 ) ) ( not ( = ?auto_274121 ?auto_274124 ) ) ( not ( = ?auto_274121 ?auto_274125 ) ) ( not ( = ?auto_274121 ?auto_274126 ) ) ( not ( = ?auto_274121 ?auto_274127 ) ) ( not ( = ?auto_274121 ?auto_274128 ) ) ( not ( = ?auto_274122 ?auto_274123 ) ) ( not ( = ?auto_274122 ?auto_274124 ) ) ( not ( = ?auto_274122 ?auto_274125 ) ) ( not ( = ?auto_274122 ?auto_274126 ) ) ( not ( = ?auto_274122 ?auto_274127 ) ) ( not ( = ?auto_274122 ?auto_274128 ) ) ( not ( = ?auto_274123 ?auto_274124 ) ) ( not ( = ?auto_274123 ?auto_274125 ) ) ( not ( = ?auto_274123 ?auto_274126 ) ) ( not ( = ?auto_274123 ?auto_274127 ) ) ( not ( = ?auto_274123 ?auto_274128 ) ) ( not ( = ?auto_274124 ?auto_274125 ) ) ( not ( = ?auto_274124 ?auto_274126 ) ) ( not ( = ?auto_274124 ?auto_274127 ) ) ( not ( = ?auto_274124 ?auto_274128 ) ) ( not ( = ?auto_274125 ?auto_274126 ) ) ( not ( = ?auto_274125 ?auto_274127 ) ) ( not ( = ?auto_274125 ?auto_274128 ) ) ( not ( = ?auto_274126 ?auto_274127 ) ) ( not ( = ?auto_274126 ?auto_274128 ) ) ( not ( = ?auto_274127 ?auto_274128 ) ) ( ON ?auto_274126 ?auto_274127 ) ( ON ?auto_274125 ?auto_274126 ) ( ON ?auto_274124 ?auto_274125 ) ( ON ?auto_274123 ?auto_274124 ) ( ON ?auto_274122 ?auto_274123 ) ( ON ?auto_274121 ?auto_274122 ) ( ON ?auto_274120 ?auto_274121 ) ( ON ?auto_274119 ?auto_274120 ) ( ON ?auto_274118 ?auto_274119 ) ( CLEAR ?auto_274116 ) ( ON ?auto_274117 ?auto_274118 ) ( CLEAR ?auto_274117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_274116 ?auto_274117 )
      ( MAKE-12PILE ?auto_274116 ?auto_274117 ?auto_274118 ?auto_274119 ?auto_274120 ?auto_274121 ?auto_274122 ?auto_274123 ?auto_274124 ?auto_274125 ?auto_274126 ?auto_274127 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_274141 - BLOCK
      ?auto_274142 - BLOCK
      ?auto_274143 - BLOCK
      ?auto_274144 - BLOCK
      ?auto_274145 - BLOCK
      ?auto_274146 - BLOCK
      ?auto_274147 - BLOCK
      ?auto_274148 - BLOCK
      ?auto_274149 - BLOCK
      ?auto_274150 - BLOCK
      ?auto_274151 - BLOCK
      ?auto_274152 - BLOCK
    )
    :vars
    (
      ?auto_274153 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_274152 ?auto_274153 ) ( ON-TABLE ?auto_274141 ) ( not ( = ?auto_274141 ?auto_274142 ) ) ( not ( = ?auto_274141 ?auto_274143 ) ) ( not ( = ?auto_274141 ?auto_274144 ) ) ( not ( = ?auto_274141 ?auto_274145 ) ) ( not ( = ?auto_274141 ?auto_274146 ) ) ( not ( = ?auto_274141 ?auto_274147 ) ) ( not ( = ?auto_274141 ?auto_274148 ) ) ( not ( = ?auto_274141 ?auto_274149 ) ) ( not ( = ?auto_274141 ?auto_274150 ) ) ( not ( = ?auto_274141 ?auto_274151 ) ) ( not ( = ?auto_274141 ?auto_274152 ) ) ( not ( = ?auto_274141 ?auto_274153 ) ) ( not ( = ?auto_274142 ?auto_274143 ) ) ( not ( = ?auto_274142 ?auto_274144 ) ) ( not ( = ?auto_274142 ?auto_274145 ) ) ( not ( = ?auto_274142 ?auto_274146 ) ) ( not ( = ?auto_274142 ?auto_274147 ) ) ( not ( = ?auto_274142 ?auto_274148 ) ) ( not ( = ?auto_274142 ?auto_274149 ) ) ( not ( = ?auto_274142 ?auto_274150 ) ) ( not ( = ?auto_274142 ?auto_274151 ) ) ( not ( = ?auto_274142 ?auto_274152 ) ) ( not ( = ?auto_274142 ?auto_274153 ) ) ( not ( = ?auto_274143 ?auto_274144 ) ) ( not ( = ?auto_274143 ?auto_274145 ) ) ( not ( = ?auto_274143 ?auto_274146 ) ) ( not ( = ?auto_274143 ?auto_274147 ) ) ( not ( = ?auto_274143 ?auto_274148 ) ) ( not ( = ?auto_274143 ?auto_274149 ) ) ( not ( = ?auto_274143 ?auto_274150 ) ) ( not ( = ?auto_274143 ?auto_274151 ) ) ( not ( = ?auto_274143 ?auto_274152 ) ) ( not ( = ?auto_274143 ?auto_274153 ) ) ( not ( = ?auto_274144 ?auto_274145 ) ) ( not ( = ?auto_274144 ?auto_274146 ) ) ( not ( = ?auto_274144 ?auto_274147 ) ) ( not ( = ?auto_274144 ?auto_274148 ) ) ( not ( = ?auto_274144 ?auto_274149 ) ) ( not ( = ?auto_274144 ?auto_274150 ) ) ( not ( = ?auto_274144 ?auto_274151 ) ) ( not ( = ?auto_274144 ?auto_274152 ) ) ( not ( = ?auto_274144 ?auto_274153 ) ) ( not ( = ?auto_274145 ?auto_274146 ) ) ( not ( = ?auto_274145 ?auto_274147 ) ) ( not ( = ?auto_274145 ?auto_274148 ) ) ( not ( = ?auto_274145 ?auto_274149 ) ) ( not ( = ?auto_274145 ?auto_274150 ) ) ( not ( = ?auto_274145 ?auto_274151 ) ) ( not ( = ?auto_274145 ?auto_274152 ) ) ( not ( = ?auto_274145 ?auto_274153 ) ) ( not ( = ?auto_274146 ?auto_274147 ) ) ( not ( = ?auto_274146 ?auto_274148 ) ) ( not ( = ?auto_274146 ?auto_274149 ) ) ( not ( = ?auto_274146 ?auto_274150 ) ) ( not ( = ?auto_274146 ?auto_274151 ) ) ( not ( = ?auto_274146 ?auto_274152 ) ) ( not ( = ?auto_274146 ?auto_274153 ) ) ( not ( = ?auto_274147 ?auto_274148 ) ) ( not ( = ?auto_274147 ?auto_274149 ) ) ( not ( = ?auto_274147 ?auto_274150 ) ) ( not ( = ?auto_274147 ?auto_274151 ) ) ( not ( = ?auto_274147 ?auto_274152 ) ) ( not ( = ?auto_274147 ?auto_274153 ) ) ( not ( = ?auto_274148 ?auto_274149 ) ) ( not ( = ?auto_274148 ?auto_274150 ) ) ( not ( = ?auto_274148 ?auto_274151 ) ) ( not ( = ?auto_274148 ?auto_274152 ) ) ( not ( = ?auto_274148 ?auto_274153 ) ) ( not ( = ?auto_274149 ?auto_274150 ) ) ( not ( = ?auto_274149 ?auto_274151 ) ) ( not ( = ?auto_274149 ?auto_274152 ) ) ( not ( = ?auto_274149 ?auto_274153 ) ) ( not ( = ?auto_274150 ?auto_274151 ) ) ( not ( = ?auto_274150 ?auto_274152 ) ) ( not ( = ?auto_274150 ?auto_274153 ) ) ( not ( = ?auto_274151 ?auto_274152 ) ) ( not ( = ?auto_274151 ?auto_274153 ) ) ( not ( = ?auto_274152 ?auto_274153 ) ) ( ON ?auto_274151 ?auto_274152 ) ( ON ?auto_274150 ?auto_274151 ) ( ON ?auto_274149 ?auto_274150 ) ( ON ?auto_274148 ?auto_274149 ) ( ON ?auto_274147 ?auto_274148 ) ( ON ?auto_274146 ?auto_274147 ) ( ON ?auto_274145 ?auto_274146 ) ( ON ?auto_274144 ?auto_274145 ) ( ON ?auto_274143 ?auto_274144 ) ( CLEAR ?auto_274141 ) ( ON ?auto_274142 ?auto_274143 ) ( CLEAR ?auto_274142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_274141 ?auto_274142 )
      ( MAKE-12PILE ?auto_274141 ?auto_274142 ?auto_274143 ?auto_274144 ?auto_274145 ?auto_274146 ?auto_274147 ?auto_274148 ?auto_274149 ?auto_274150 ?auto_274151 ?auto_274152 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_274166 - BLOCK
      ?auto_274167 - BLOCK
      ?auto_274168 - BLOCK
      ?auto_274169 - BLOCK
      ?auto_274170 - BLOCK
      ?auto_274171 - BLOCK
      ?auto_274172 - BLOCK
      ?auto_274173 - BLOCK
      ?auto_274174 - BLOCK
      ?auto_274175 - BLOCK
      ?auto_274176 - BLOCK
      ?auto_274177 - BLOCK
    )
    :vars
    (
      ?auto_274178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_274177 ?auto_274178 ) ( not ( = ?auto_274166 ?auto_274167 ) ) ( not ( = ?auto_274166 ?auto_274168 ) ) ( not ( = ?auto_274166 ?auto_274169 ) ) ( not ( = ?auto_274166 ?auto_274170 ) ) ( not ( = ?auto_274166 ?auto_274171 ) ) ( not ( = ?auto_274166 ?auto_274172 ) ) ( not ( = ?auto_274166 ?auto_274173 ) ) ( not ( = ?auto_274166 ?auto_274174 ) ) ( not ( = ?auto_274166 ?auto_274175 ) ) ( not ( = ?auto_274166 ?auto_274176 ) ) ( not ( = ?auto_274166 ?auto_274177 ) ) ( not ( = ?auto_274166 ?auto_274178 ) ) ( not ( = ?auto_274167 ?auto_274168 ) ) ( not ( = ?auto_274167 ?auto_274169 ) ) ( not ( = ?auto_274167 ?auto_274170 ) ) ( not ( = ?auto_274167 ?auto_274171 ) ) ( not ( = ?auto_274167 ?auto_274172 ) ) ( not ( = ?auto_274167 ?auto_274173 ) ) ( not ( = ?auto_274167 ?auto_274174 ) ) ( not ( = ?auto_274167 ?auto_274175 ) ) ( not ( = ?auto_274167 ?auto_274176 ) ) ( not ( = ?auto_274167 ?auto_274177 ) ) ( not ( = ?auto_274167 ?auto_274178 ) ) ( not ( = ?auto_274168 ?auto_274169 ) ) ( not ( = ?auto_274168 ?auto_274170 ) ) ( not ( = ?auto_274168 ?auto_274171 ) ) ( not ( = ?auto_274168 ?auto_274172 ) ) ( not ( = ?auto_274168 ?auto_274173 ) ) ( not ( = ?auto_274168 ?auto_274174 ) ) ( not ( = ?auto_274168 ?auto_274175 ) ) ( not ( = ?auto_274168 ?auto_274176 ) ) ( not ( = ?auto_274168 ?auto_274177 ) ) ( not ( = ?auto_274168 ?auto_274178 ) ) ( not ( = ?auto_274169 ?auto_274170 ) ) ( not ( = ?auto_274169 ?auto_274171 ) ) ( not ( = ?auto_274169 ?auto_274172 ) ) ( not ( = ?auto_274169 ?auto_274173 ) ) ( not ( = ?auto_274169 ?auto_274174 ) ) ( not ( = ?auto_274169 ?auto_274175 ) ) ( not ( = ?auto_274169 ?auto_274176 ) ) ( not ( = ?auto_274169 ?auto_274177 ) ) ( not ( = ?auto_274169 ?auto_274178 ) ) ( not ( = ?auto_274170 ?auto_274171 ) ) ( not ( = ?auto_274170 ?auto_274172 ) ) ( not ( = ?auto_274170 ?auto_274173 ) ) ( not ( = ?auto_274170 ?auto_274174 ) ) ( not ( = ?auto_274170 ?auto_274175 ) ) ( not ( = ?auto_274170 ?auto_274176 ) ) ( not ( = ?auto_274170 ?auto_274177 ) ) ( not ( = ?auto_274170 ?auto_274178 ) ) ( not ( = ?auto_274171 ?auto_274172 ) ) ( not ( = ?auto_274171 ?auto_274173 ) ) ( not ( = ?auto_274171 ?auto_274174 ) ) ( not ( = ?auto_274171 ?auto_274175 ) ) ( not ( = ?auto_274171 ?auto_274176 ) ) ( not ( = ?auto_274171 ?auto_274177 ) ) ( not ( = ?auto_274171 ?auto_274178 ) ) ( not ( = ?auto_274172 ?auto_274173 ) ) ( not ( = ?auto_274172 ?auto_274174 ) ) ( not ( = ?auto_274172 ?auto_274175 ) ) ( not ( = ?auto_274172 ?auto_274176 ) ) ( not ( = ?auto_274172 ?auto_274177 ) ) ( not ( = ?auto_274172 ?auto_274178 ) ) ( not ( = ?auto_274173 ?auto_274174 ) ) ( not ( = ?auto_274173 ?auto_274175 ) ) ( not ( = ?auto_274173 ?auto_274176 ) ) ( not ( = ?auto_274173 ?auto_274177 ) ) ( not ( = ?auto_274173 ?auto_274178 ) ) ( not ( = ?auto_274174 ?auto_274175 ) ) ( not ( = ?auto_274174 ?auto_274176 ) ) ( not ( = ?auto_274174 ?auto_274177 ) ) ( not ( = ?auto_274174 ?auto_274178 ) ) ( not ( = ?auto_274175 ?auto_274176 ) ) ( not ( = ?auto_274175 ?auto_274177 ) ) ( not ( = ?auto_274175 ?auto_274178 ) ) ( not ( = ?auto_274176 ?auto_274177 ) ) ( not ( = ?auto_274176 ?auto_274178 ) ) ( not ( = ?auto_274177 ?auto_274178 ) ) ( ON ?auto_274176 ?auto_274177 ) ( ON ?auto_274175 ?auto_274176 ) ( ON ?auto_274174 ?auto_274175 ) ( ON ?auto_274173 ?auto_274174 ) ( ON ?auto_274172 ?auto_274173 ) ( ON ?auto_274171 ?auto_274172 ) ( ON ?auto_274170 ?auto_274171 ) ( ON ?auto_274169 ?auto_274170 ) ( ON ?auto_274168 ?auto_274169 ) ( ON ?auto_274167 ?auto_274168 ) ( ON ?auto_274166 ?auto_274167 ) ( CLEAR ?auto_274166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_274166 )
      ( MAKE-12PILE ?auto_274166 ?auto_274167 ?auto_274168 ?auto_274169 ?auto_274170 ?auto_274171 ?auto_274172 ?auto_274173 ?auto_274174 ?auto_274175 ?auto_274176 ?auto_274177 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_274191 - BLOCK
      ?auto_274192 - BLOCK
      ?auto_274193 - BLOCK
      ?auto_274194 - BLOCK
      ?auto_274195 - BLOCK
      ?auto_274196 - BLOCK
      ?auto_274197 - BLOCK
      ?auto_274198 - BLOCK
      ?auto_274199 - BLOCK
      ?auto_274200 - BLOCK
      ?auto_274201 - BLOCK
      ?auto_274202 - BLOCK
    )
    :vars
    (
      ?auto_274203 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_274202 ?auto_274203 ) ( not ( = ?auto_274191 ?auto_274192 ) ) ( not ( = ?auto_274191 ?auto_274193 ) ) ( not ( = ?auto_274191 ?auto_274194 ) ) ( not ( = ?auto_274191 ?auto_274195 ) ) ( not ( = ?auto_274191 ?auto_274196 ) ) ( not ( = ?auto_274191 ?auto_274197 ) ) ( not ( = ?auto_274191 ?auto_274198 ) ) ( not ( = ?auto_274191 ?auto_274199 ) ) ( not ( = ?auto_274191 ?auto_274200 ) ) ( not ( = ?auto_274191 ?auto_274201 ) ) ( not ( = ?auto_274191 ?auto_274202 ) ) ( not ( = ?auto_274191 ?auto_274203 ) ) ( not ( = ?auto_274192 ?auto_274193 ) ) ( not ( = ?auto_274192 ?auto_274194 ) ) ( not ( = ?auto_274192 ?auto_274195 ) ) ( not ( = ?auto_274192 ?auto_274196 ) ) ( not ( = ?auto_274192 ?auto_274197 ) ) ( not ( = ?auto_274192 ?auto_274198 ) ) ( not ( = ?auto_274192 ?auto_274199 ) ) ( not ( = ?auto_274192 ?auto_274200 ) ) ( not ( = ?auto_274192 ?auto_274201 ) ) ( not ( = ?auto_274192 ?auto_274202 ) ) ( not ( = ?auto_274192 ?auto_274203 ) ) ( not ( = ?auto_274193 ?auto_274194 ) ) ( not ( = ?auto_274193 ?auto_274195 ) ) ( not ( = ?auto_274193 ?auto_274196 ) ) ( not ( = ?auto_274193 ?auto_274197 ) ) ( not ( = ?auto_274193 ?auto_274198 ) ) ( not ( = ?auto_274193 ?auto_274199 ) ) ( not ( = ?auto_274193 ?auto_274200 ) ) ( not ( = ?auto_274193 ?auto_274201 ) ) ( not ( = ?auto_274193 ?auto_274202 ) ) ( not ( = ?auto_274193 ?auto_274203 ) ) ( not ( = ?auto_274194 ?auto_274195 ) ) ( not ( = ?auto_274194 ?auto_274196 ) ) ( not ( = ?auto_274194 ?auto_274197 ) ) ( not ( = ?auto_274194 ?auto_274198 ) ) ( not ( = ?auto_274194 ?auto_274199 ) ) ( not ( = ?auto_274194 ?auto_274200 ) ) ( not ( = ?auto_274194 ?auto_274201 ) ) ( not ( = ?auto_274194 ?auto_274202 ) ) ( not ( = ?auto_274194 ?auto_274203 ) ) ( not ( = ?auto_274195 ?auto_274196 ) ) ( not ( = ?auto_274195 ?auto_274197 ) ) ( not ( = ?auto_274195 ?auto_274198 ) ) ( not ( = ?auto_274195 ?auto_274199 ) ) ( not ( = ?auto_274195 ?auto_274200 ) ) ( not ( = ?auto_274195 ?auto_274201 ) ) ( not ( = ?auto_274195 ?auto_274202 ) ) ( not ( = ?auto_274195 ?auto_274203 ) ) ( not ( = ?auto_274196 ?auto_274197 ) ) ( not ( = ?auto_274196 ?auto_274198 ) ) ( not ( = ?auto_274196 ?auto_274199 ) ) ( not ( = ?auto_274196 ?auto_274200 ) ) ( not ( = ?auto_274196 ?auto_274201 ) ) ( not ( = ?auto_274196 ?auto_274202 ) ) ( not ( = ?auto_274196 ?auto_274203 ) ) ( not ( = ?auto_274197 ?auto_274198 ) ) ( not ( = ?auto_274197 ?auto_274199 ) ) ( not ( = ?auto_274197 ?auto_274200 ) ) ( not ( = ?auto_274197 ?auto_274201 ) ) ( not ( = ?auto_274197 ?auto_274202 ) ) ( not ( = ?auto_274197 ?auto_274203 ) ) ( not ( = ?auto_274198 ?auto_274199 ) ) ( not ( = ?auto_274198 ?auto_274200 ) ) ( not ( = ?auto_274198 ?auto_274201 ) ) ( not ( = ?auto_274198 ?auto_274202 ) ) ( not ( = ?auto_274198 ?auto_274203 ) ) ( not ( = ?auto_274199 ?auto_274200 ) ) ( not ( = ?auto_274199 ?auto_274201 ) ) ( not ( = ?auto_274199 ?auto_274202 ) ) ( not ( = ?auto_274199 ?auto_274203 ) ) ( not ( = ?auto_274200 ?auto_274201 ) ) ( not ( = ?auto_274200 ?auto_274202 ) ) ( not ( = ?auto_274200 ?auto_274203 ) ) ( not ( = ?auto_274201 ?auto_274202 ) ) ( not ( = ?auto_274201 ?auto_274203 ) ) ( not ( = ?auto_274202 ?auto_274203 ) ) ( ON ?auto_274201 ?auto_274202 ) ( ON ?auto_274200 ?auto_274201 ) ( ON ?auto_274199 ?auto_274200 ) ( ON ?auto_274198 ?auto_274199 ) ( ON ?auto_274197 ?auto_274198 ) ( ON ?auto_274196 ?auto_274197 ) ( ON ?auto_274195 ?auto_274196 ) ( ON ?auto_274194 ?auto_274195 ) ( ON ?auto_274193 ?auto_274194 ) ( ON ?auto_274192 ?auto_274193 ) ( ON ?auto_274191 ?auto_274192 ) ( CLEAR ?auto_274191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_274191 )
      ( MAKE-12PILE ?auto_274191 ?auto_274192 ?auto_274193 ?auto_274194 ?auto_274195 ?auto_274196 ?auto_274197 ?auto_274198 ?auto_274199 ?auto_274200 ?auto_274201 ?auto_274202 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_274217 - BLOCK
      ?auto_274218 - BLOCK
      ?auto_274219 - BLOCK
      ?auto_274220 - BLOCK
      ?auto_274221 - BLOCK
      ?auto_274222 - BLOCK
      ?auto_274223 - BLOCK
      ?auto_274224 - BLOCK
      ?auto_274225 - BLOCK
      ?auto_274226 - BLOCK
      ?auto_274227 - BLOCK
      ?auto_274228 - BLOCK
      ?auto_274229 - BLOCK
    )
    :vars
    (
      ?auto_274230 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_274228 ) ( ON ?auto_274229 ?auto_274230 ) ( CLEAR ?auto_274229 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_274217 ) ( ON ?auto_274218 ?auto_274217 ) ( ON ?auto_274219 ?auto_274218 ) ( ON ?auto_274220 ?auto_274219 ) ( ON ?auto_274221 ?auto_274220 ) ( ON ?auto_274222 ?auto_274221 ) ( ON ?auto_274223 ?auto_274222 ) ( ON ?auto_274224 ?auto_274223 ) ( ON ?auto_274225 ?auto_274224 ) ( ON ?auto_274226 ?auto_274225 ) ( ON ?auto_274227 ?auto_274226 ) ( ON ?auto_274228 ?auto_274227 ) ( not ( = ?auto_274217 ?auto_274218 ) ) ( not ( = ?auto_274217 ?auto_274219 ) ) ( not ( = ?auto_274217 ?auto_274220 ) ) ( not ( = ?auto_274217 ?auto_274221 ) ) ( not ( = ?auto_274217 ?auto_274222 ) ) ( not ( = ?auto_274217 ?auto_274223 ) ) ( not ( = ?auto_274217 ?auto_274224 ) ) ( not ( = ?auto_274217 ?auto_274225 ) ) ( not ( = ?auto_274217 ?auto_274226 ) ) ( not ( = ?auto_274217 ?auto_274227 ) ) ( not ( = ?auto_274217 ?auto_274228 ) ) ( not ( = ?auto_274217 ?auto_274229 ) ) ( not ( = ?auto_274217 ?auto_274230 ) ) ( not ( = ?auto_274218 ?auto_274219 ) ) ( not ( = ?auto_274218 ?auto_274220 ) ) ( not ( = ?auto_274218 ?auto_274221 ) ) ( not ( = ?auto_274218 ?auto_274222 ) ) ( not ( = ?auto_274218 ?auto_274223 ) ) ( not ( = ?auto_274218 ?auto_274224 ) ) ( not ( = ?auto_274218 ?auto_274225 ) ) ( not ( = ?auto_274218 ?auto_274226 ) ) ( not ( = ?auto_274218 ?auto_274227 ) ) ( not ( = ?auto_274218 ?auto_274228 ) ) ( not ( = ?auto_274218 ?auto_274229 ) ) ( not ( = ?auto_274218 ?auto_274230 ) ) ( not ( = ?auto_274219 ?auto_274220 ) ) ( not ( = ?auto_274219 ?auto_274221 ) ) ( not ( = ?auto_274219 ?auto_274222 ) ) ( not ( = ?auto_274219 ?auto_274223 ) ) ( not ( = ?auto_274219 ?auto_274224 ) ) ( not ( = ?auto_274219 ?auto_274225 ) ) ( not ( = ?auto_274219 ?auto_274226 ) ) ( not ( = ?auto_274219 ?auto_274227 ) ) ( not ( = ?auto_274219 ?auto_274228 ) ) ( not ( = ?auto_274219 ?auto_274229 ) ) ( not ( = ?auto_274219 ?auto_274230 ) ) ( not ( = ?auto_274220 ?auto_274221 ) ) ( not ( = ?auto_274220 ?auto_274222 ) ) ( not ( = ?auto_274220 ?auto_274223 ) ) ( not ( = ?auto_274220 ?auto_274224 ) ) ( not ( = ?auto_274220 ?auto_274225 ) ) ( not ( = ?auto_274220 ?auto_274226 ) ) ( not ( = ?auto_274220 ?auto_274227 ) ) ( not ( = ?auto_274220 ?auto_274228 ) ) ( not ( = ?auto_274220 ?auto_274229 ) ) ( not ( = ?auto_274220 ?auto_274230 ) ) ( not ( = ?auto_274221 ?auto_274222 ) ) ( not ( = ?auto_274221 ?auto_274223 ) ) ( not ( = ?auto_274221 ?auto_274224 ) ) ( not ( = ?auto_274221 ?auto_274225 ) ) ( not ( = ?auto_274221 ?auto_274226 ) ) ( not ( = ?auto_274221 ?auto_274227 ) ) ( not ( = ?auto_274221 ?auto_274228 ) ) ( not ( = ?auto_274221 ?auto_274229 ) ) ( not ( = ?auto_274221 ?auto_274230 ) ) ( not ( = ?auto_274222 ?auto_274223 ) ) ( not ( = ?auto_274222 ?auto_274224 ) ) ( not ( = ?auto_274222 ?auto_274225 ) ) ( not ( = ?auto_274222 ?auto_274226 ) ) ( not ( = ?auto_274222 ?auto_274227 ) ) ( not ( = ?auto_274222 ?auto_274228 ) ) ( not ( = ?auto_274222 ?auto_274229 ) ) ( not ( = ?auto_274222 ?auto_274230 ) ) ( not ( = ?auto_274223 ?auto_274224 ) ) ( not ( = ?auto_274223 ?auto_274225 ) ) ( not ( = ?auto_274223 ?auto_274226 ) ) ( not ( = ?auto_274223 ?auto_274227 ) ) ( not ( = ?auto_274223 ?auto_274228 ) ) ( not ( = ?auto_274223 ?auto_274229 ) ) ( not ( = ?auto_274223 ?auto_274230 ) ) ( not ( = ?auto_274224 ?auto_274225 ) ) ( not ( = ?auto_274224 ?auto_274226 ) ) ( not ( = ?auto_274224 ?auto_274227 ) ) ( not ( = ?auto_274224 ?auto_274228 ) ) ( not ( = ?auto_274224 ?auto_274229 ) ) ( not ( = ?auto_274224 ?auto_274230 ) ) ( not ( = ?auto_274225 ?auto_274226 ) ) ( not ( = ?auto_274225 ?auto_274227 ) ) ( not ( = ?auto_274225 ?auto_274228 ) ) ( not ( = ?auto_274225 ?auto_274229 ) ) ( not ( = ?auto_274225 ?auto_274230 ) ) ( not ( = ?auto_274226 ?auto_274227 ) ) ( not ( = ?auto_274226 ?auto_274228 ) ) ( not ( = ?auto_274226 ?auto_274229 ) ) ( not ( = ?auto_274226 ?auto_274230 ) ) ( not ( = ?auto_274227 ?auto_274228 ) ) ( not ( = ?auto_274227 ?auto_274229 ) ) ( not ( = ?auto_274227 ?auto_274230 ) ) ( not ( = ?auto_274228 ?auto_274229 ) ) ( not ( = ?auto_274228 ?auto_274230 ) ) ( not ( = ?auto_274229 ?auto_274230 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_274229 ?auto_274230 )
      ( !STACK ?auto_274229 ?auto_274228 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_274244 - BLOCK
      ?auto_274245 - BLOCK
      ?auto_274246 - BLOCK
      ?auto_274247 - BLOCK
      ?auto_274248 - BLOCK
      ?auto_274249 - BLOCK
      ?auto_274250 - BLOCK
      ?auto_274251 - BLOCK
      ?auto_274252 - BLOCK
      ?auto_274253 - BLOCK
      ?auto_274254 - BLOCK
      ?auto_274255 - BLOCK
      ?auto_274256 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_274255 ) ( ON-TABLE ?auto_274256 ) ( CLEAR ?auto_274256 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_274244 ) ( ON ?auto_274245 ?auto_274244 ) ( ON ?auto_274246 ?auto_274245 ) ( ON ?auto_274247 ?auto_274246 ) ( ON ?auto_274248 ?auto_274247 ) ( ON ?auto_274249 ?auto_274248 ) ( ON ?auto_274250 ?auto_274249 ) ( ON ?auto_274251 ?auto_274250 ) ( ON ?auto_274252 ?auto_274251 ) ( ON ?auto_274253 ?auto_274252 ) ( ON ?auto_274254 ?auto_274253 ) ( ON ?auto_274255 ?auto_274254 ) ( not ( = ?auto_274244 ?auto_274245 ) ) ( not ( = ?auto_274244 ?auto_274246 ) ) ( not ( = ?auto_274244 ?auto_274247 ) ) ( not ( = ?auto_274244 ?auto_274248 ) ) ( not ( = ?auto_274244 ?auto_274249 ) ) ( not ( = ?auto_274244 ?auto_274250 ) ) ( not ( = ?auto_274244 ?auto_274251 ) ) ( not ( = ?auto_274244 ?auto_274252 ) ) ( not ( = ?auto_274244 ?auto_274253 ) ) ( not ( = ?auto_274244 ?auto_274254 ) ) ( not ( = ?auto_274244 ?auto_274255 ) ) ( not ( = ?auto_274244 ?auto_274256 ) ) ( not ( = ?auto_274245 ?auto_274246 ) ) ( not ( = ?auto_274245 ?auto_274247 ) ) ( not ( = ?auto_274245 ?auto_274248 ) ) ( not ( = ?auto_274245 ?auto_274249 ) ) ( not ( = ?auto_274245 ?auto_274250 ) ) ( not ( = ?auto_274245 ?auto_274251 ) ) ( not ( = ?auto_274245 ?auto_274252 ) ) ( not ( = ?auto_274245 ?auto_274253 ) ) ( not ( = ?auto_274245 ?auto_274254 ) ) ( not ( = ?auto_274245 ?auto_274255 ) ) ( not ( = ?auto_274245 ?auto_274256 ) ) ( not ( = ?auto_274246 ?auto_274247 ) ) ( not ( = ?auto_274246 ?auto_274248 ) ) ( not ( = ?auto_274246 ?auto_274249 ) ) ( not ( = ?auto_274246 ?auto_274250 ) ) ( not ( = ?auto_274246 ?auto_274251 ) ) ( not ( = ?auto_274246 ?auto_274252 ) ) ( not ( = ?auto_274246 ?auto_274253 ) ) ( not ( = ?auto_274246 ?auto_274254 ) ) ( not ( = ?auto_274246 ?auto_274255 ) ) ( not ( = ?auto_274246 ?auto_274256 ) ) ( not ( = ?auto_274247 ?auto_274248 ) ) ( not ( = ?auto_274247 ?auto_274249 ) ) ( not ( = ?auto_274247 ?auto_274250 ) ) ( not ( = ?auto_274247 ?auto_274251 ) ) ( not ( = ?auto_274247 ?auto_274252 ) ) ( not ( = ?auto_274247 ?auto_274253 ) ) ( not ( = ?auto_274247 ?auto_274254 ) ) ( not ( = ?auto_274247 ?auto_274255 ) ) ( not ( = ?auto_274247 ?auto_274256 ) ) ( not ( = ?auto_274248 ?auto_274249 ) ) ( not ( = ?auto_274248 ?auto_274250 ) ) ( not ( = ?auto_274248 ?auto_274251 ) ) ( not ( = ?auto_274248 ?auto_274252 ) ) ( not ( = ?auto_274248 ?auto_274253 ) ) ( not ( = ?auto_274248 ?auto_274254 ) ) ( not ( = ?auto_274248 ?auto_274255 ) ) ( not ( = ?auto_274248 ?auto_274256 ) ) ( not ( = ?auto_274249 ?auto_274250 ) ) ( not ( = ?auto_274249 ?auto_274251 ) ) ( not ( = ?auto_274249 ?auto_274252 ) ) ( not ( = ?auto_274249 ?auto_274253 ) ) ( not ( = ?auto_274249 ?auto_274254 ) ) ( not ( = ?auto_274249 ?auto_274255 ) ) ( not ( = ?auto_274249 ?auto_274256 ) ) ( not ( = ?auto_274250 ?auto_274251 ) ) ( not ( = ?auto_274250 ?auto_274252 ) ) ( not ( = ?auto_274250 ?auto_274253 ) ) ( not ( = ?auto_274250 ?auto_274254 ) ) ( not ( = ?auto_274250 ?auto_274255 ) ) ( not ( = ?auto_274250 ?auto_274256 ) ) ( not ( = ?auto_274251 ?auto_274252 ) ) ( not ( = ?auto_274251 ?auto_274253 ) ) ( not ( = ?auto_274251 ?auto_274254 ) ) ( not ( = ?auto_274251 ?auto_274255 ) ) ( not ( = ?auto_274251 ?auto_274256 ) ) ( not ( = ?auto_274252 ?auto_274253 ) ) ( not ( = ?auto_274252 ?auto_274254 ) ) ( not ( = ?auto_274252 ?auto_274255 ) ) ( not ( = ?auto_274252 ?auto_274256 ) ) ( not ( = ?auto_274253 ?auto_274254 ) ) ( not ( = ?auto_274253 ?auto_274255 ) ) ( not ( = ?auto_274253 ?auto_274256 ) ) ( not ( = ?auto_274254 ?auto_274255 ) ) ( not ( = ?auto_274254 ?auto_274256 ) ) ( not ( = ?auto_274255 ?auto_274256 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_274256 )
      ( !STACK ?auto_274256 ?auto_274255 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_274270 - BLOCK
      ?auto_274271 - BLOCK
      ?auto_274272 - BLOCK
      ?auto_274273 - BLOCK
      ?auto_274274 - BLOCK
      ?auto_274275 - BLOCK
      ?auto_274276 - BLOCK
      ?auto_274277 - BLOCK
      ?auto_274278 - BLOCK
      ?auto_274279 - BLOCK
      ?auto_274280 - BLOCK
      ?auto_274281 - BLOCK
      ?auto_274282 - BLOCK
    )
    :vars
    (
      ?auto_274283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_274282 ?auto_274283 ) ( ON-TABLE ?auto_274270 ) ( ON ?auto_274271 ?auto_274270 ) ( ON ?auto_274272 ?auto_274271 ) ( ON ?auto_274273 ?auto_274272 ) ( ON ?auto_274274 ?auto_274273 ) ( ON ?auto_274275 ?auto_274274 ) ( ON ?auto_274276 ?auto_274275 ) ( ON ?auto_274277 ?auto_274276 ) ( ON ?auto_274278 ?auto_274277 ) ( ON ?auto_274279 ?auto_274278 ) ( ON ?auto_274280 ?auto_274279 ) ( not ( = ?auto_274270 ?auto_274271 ) ) ( not ( = ?auto_274270 ?auto_274272 ) ) ( not ( = ?auto_274270 ?auto_274273 ) ) ( not ( = ?auto_274270 ?auto_274274 ) ) ( not ( = ?auto_274270 ?auto_274275 ) ) ( not ( = ?auto_274270 ?auto_274276 ) ) ( not ( = ?auto_274270 ?auto_274277 ) ) ( not ( = ?auto_274270 ?auto_274278 ) ) ( not ( = ?auto_274270 ?auto_274279 ) ) ( not ( = ?auto_274270 ?auto_274280 ) ) ( not ( = ?auto_274270 ?auto_274281 ) ) ( not ( = ?auto_274270 ?auto_274282 ) ) ( not ( = ?auto_274270 ?auto_274283 ) ) ( not ( = ?auto_274271 ?auto_274272 ) ) ( not ( = ?auto_274271 ?auto_274273 ) ) ( not ( = ?auto_274271 ?auto_274274 ) ) ( not ( = ?auto_274271 ?auto_274275 ) ) ( not ( = ?auto_274271 ?auto_274276 ) ) ( not ( = ?auto_274271 ?auto_274277 ) ) ( not ( = ?auto_274271 ?auto_274278 ) ) ( not ( = ?auto_274271 ?auto_274279 ) ) ( not ( = ?auto_274271 ?auto_274280 ) ) ( not ( = ?auto_274271 ?auto_274281 ) ) ( not ( = ?auto_274271 ?auto_274282 ) ) ( not ( = ?auto_274271 ?auto_274283 ) ) ( not ( = ?auto_274272 ?auto_274273 ) ) ( not ( = ?auto_274272 ?auto_274274 ) ) ( not ( = ?auto_274272 ?auto_274275 ) ) ( not ( = ?auto_274272 ?auto_274276 ) ) ( not ( = ?auto_274272 ?auto_274277 ) ) ( not ( = ?auto_274272 ?auto_274278 ) ) ( not ( = ?auto_274272 ?auto_274279 ) ) ( not ( = ?auto_274272 ?auto_274280 ) ) ( not ( = ?auto_274272 ?auto_274281 ) ) ( not ( = ?auto_274272 ?auto_274282 ) ) ( not ( = ?auto_274272 ?auto_274283 ) ) ( not ( = ?auto_274273 ?auto_274274 ) ) ( not ( = ?auto_274273 ?auto_274275 ) ) ( not ( = ?auto_274273 ?auto_274276 ) ) ( not ( = ?auto_274273 ?auto_274277 ) ) ( not ( = ?auto_274273 ?auto_274278 ) ) ( not ( = ?auto_274273 ?auto_274279 ) ) ( not ( = ?auto_274273 ?auto_274280 ) ) ( not ( = ?auto_274273 ?auto_274281 ) ) ( not ( = ?auto_274273 ?auto_274282 ) ) ( not ( = ?auto_274273 ?auto_274283 ) ) ( not ( = ?auto_274274 ?auto_274275 ) ) ( not ( = ?auto_274274 ?auto_274276 ) ) ( not ( = ?auto_274274 ?auto_274277 ) ) ( not ( = ?auto_274274 ?auto_274278 ) ) ( not ( = ?auto_274274 ?auto_274279 ) ) ( not ( = ?auto_274274 ?auto_274280 ) ) ( not ( = ?auto_274274 ?auto_274281 ) ) ( not ( = ?auto_274274 ?auto_274282 ) ) ( not ( = ?auto_274274 ?auto_274283 ) ) ( not ( = ?auto_274275 ?auto_274276 ) ) ( not ( = ?auto_274275 ?auto_274277 ) ) ( not ( = ?auto_274275 ?auto_274278 ) ) ( not ( = ?auto_274275 ?auto_274279 ) ) ( not ( = ?auto_274275 ?auto_274280 ) ) ( not ( = ?auto_274275 ?auto_274281 ) ) ( not ( = ?auto_274275 ?auto_274282 ) ) ( not ( = ?auto_274275 ?auto_274283 ) ) ( not ( = ?auto_274276 ?auto_274277 ) ) ( not ( = ?auto_274276 ?auto_274278 ) ) ( not ( = ?auto_274276 ?auto_274279 ) ) ( not ( = ?auto_274276 ?auto_274280 ) ) ( not ( = ?auto_274276 ?auto_274281 ) ) ( not ( = ?auto_274276 ?auto_274282 ) ) ( not ( = ?auto_274276 ?auto_274283 ) ) ( not ( = ?auto_274277 ?auto_274278 ) ) ( not ( = ?auto_274277 ?auto_274279 ) ) ( not ( = ?auto_274277 ?auto_274280 ) ) ( not ( = ?auto_274277 ?auto_274281 ) ) ( not ( = ?auto_274277 ?auto_274282 ) ) ( not ( = ?auto_274277 ?auto_274283 ) ) ( not ( = ?auto_274278 ?auto_274279 ) ) ( not ( = ?auto_274278 ?auto_274280 ) ) ( not ( = ?auto_274278 ?auto_274281 ) ) ( not ( = ?auto_274278 ?auto_274282 ) ) ( not ( = ?auto_274278 ?auto_274283 ) ) ( not ( = ?auto_274279 ?auto_274280 ) ) ( not ( = ?auto_274279 ?auto_274281 ) ) ( not ( = ?auto_274279 ?auto_274282 ) ) ( not ( = ?auto_274279 ?auto_274283 ) ) ( not ( = ?auto_274280 ?auto_274281 ) ) ( not ( = ?auto_274280 ?auto_274282 ) ) ( not ( = ?auto_274280 ?auto_274283 ) ) ( not ( = ?auto_274281 ?auto_274282 ) ) ( not ( = ?auto_274281 ?auto_274283 ) ) ( not ( = ?auto_274282 ?auto_274283 ) ) ( CLEAR ?auto_274280 ) ( ON ?auto_274281 ?auto_274282 ) ( CLEAR ?auto_274281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_274270 ?auto_274271 ?auto_274272 ?auto_274273 ?auto_274274 ?auto_274275 ?auto_274276 ?auto_274277 ?auto_274278 ?auto_274279 ?auto_274280 ?auto_274281 )
      ( MAKE-13PILE ?auto_274270 ?auto_274271 ?auto_274272 ?auto_274273 ?auto_274274 ?auto_274275 ?auto_274276 ?auto_274277 ?auto_274278 ?auto_274279 ?auto_274280 ?auto_274281 ?auto_274282 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_274297 - BLOCK
      ?auto_274298 - BLOCK
      ?auto_274299 - BLOCK
      ?auto_274300 - BLOCK
      ?auto_274301 - BLOCK
      ?auto_274302 - BLOCK
      ?auto_274303 - BLOCK
      ?auto_274304 - BLOCK
      ?auto_274305 - BLOCK
      ?auto_274306 - BLOCK
      ?auto_274307 - BLOCK
      ?auto_274308 - BLOCK
      ?auto_274309 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_274309 ) ( ON-TABLE ?auto_274297 ) ( ON ?auto_274298 ?auto_274297 ) ( ON ?auto_274299 ?auto_274298 ) ( ON ?auto_274300 ?auto_274299 ) ( ON ?auto_274301 ?auto_274300 ) ( ON ?auto_274302 ?auto_274301 ) ( ON ?auto_274303 ?auto_274302 ) ( ON ?auto_274304 ?auto_274303 ) ( ON ?auto_274305 ?auto_274304 ) ( ON ?auto_274306 ?auto_274305 ) ( ON ?auto_274307 ?auto_274306 ) ( not ( = ?auto_274297 ?auto_274298 ) ) ( not ( = ?auto_274297 ?auto_274299 ) ) ( not ( = ?auto_274297 ?auto_274300 ) ) ( not ( = ?auto_274297 ?auto_274301 ) ) ( not ( = ?auto_274297 ?auto_274302 ) ) ( not ( = ?auto_274297 ?auto_274303 ) ) ( not ( = ?auto_274297 ?auto_274304 ) ) ( not ( = ?auto_274297 ?auto_274305 ) ) ( not ( = ?auto_274297 ?auto_274306 ) ) ( not ( = ?auto_274297 ?auto_274307 ) ) ( not ( = ?auto_274297 ?auto_274308 ) ) ( not ( = ?auto_274297 ?auto_274309 ) ) ( not ( = ?auto_274298 ?auto_274299 ) ) ( not ( = ?auto_274298 ?auto_274300 ) ) ( not ( = ?auto_274298 ?auto_274301 ) ) ( not ( = ?auto_274298 ?auto_274302 ) ) ( not ( = ?auto_274298 ?auto_274303 ) ) ( not ( = ?auto_274298 ?auto_274304 ) ) ( not ( = ?auto_274298 ?auto_274305 ) ) ( not ( = ?auto_274298 ?auto_274306 ) ) ( not ( = ?auto_274298 ?auto_274307 ) ) ( not ( = ?auto_274298 ?auto_274308 ) ) ( not ( = ?auto_274298 ?auto_274309 ) ) ( not ( = ?auto_274299 ?auto_274300 ) ) ( not ( = ?auto_274299 ?auto_274301 ) ) ( not ( = ?auto_274299 ?auto_274302 ) ) ( not ( = ?auto_274299 ?auto_274303 ) ) ( not ( = ?auto_274299 ?auto_274304 ) ) ( not ( = ?auto_274299 ?auto_274305 ) ) ( not ( = ?auto_274299 ?auto_274306 ) ) ( not ( = ?auto_274299 ?auto_274307 ) ) ( not ( = ?auto_274299 ?auto_274308 ) ) ( not ( = ?auto_274299 ?auto_274309 ) ) ( not ( = ?auto_274300 ?auto_274301 ) ) ( not ( = ?auto_274300 ?auto_274302 ) ) ( not ( = ?auto_274300 ?auto_274303 ) ) ( not ( = ?auto_274300 ?auto_274304 ) ) ( not ( = ?auto_274300 ?auto_274305 ) ) ( not ( = ?auto_274300 ?auto_274306 ) ) ( not ( = ?auto_274300 ?auto_274307 ) ) ( not ( = ?auto_274300 ?auto_274308 ) ) ( not ( = ?auto_274300 ?auto_274309 ) ) ( not ( = ?auto_274301 ?auto_274302 ) ) ( not ( = ?auto_274301 ?auto_274303 ) ) ( not ( = ?auto_274301 ?auto_274304 ) ) ( not ( = ?auto_274301 ?auto_274305 ) ) ( not ( = ?auto_274301 ?auto_274306 ) ) ( not ( = ?auto_274301 ?auto_274307 ) ) ( not ( = ?auto_274301 ?auto_274308 ) ) ( not ( = ?auto_274301 ?auto_274309 ) ) ( not ( = ?auto_274302 ?auto_274303 ) ) ( not ( = ?auto_274302 ?auto_274304 ) ) ( not ( = ?auto_274302 ?auto_274305 ) ) ( not ( = ?auto_274302 ?auto_274306 ) ) ( not ( = ?auto_274302 ?auto_274307 ) ) ( not ( = ?auto_274302 ?auto_274308 ) ) ( not ( = ?auto_274302 ?auto_274309 ) ) ( not ( = ?auto_274303 ?auto_274304 ) ) ( not ( = ?auto_274303 ?auto_274305 ) ) ( not ( = ?auto_274303 ?auto_274306 ) ) ( not ( = ?auto_274303 ?auto_274307 ) ) ( not ( = ?auto_274303 ?auto_274308 ) ) ( not ( = ?auto_274303 ?auto_274309 ) ) ( not ( = ?auto_274304 ?auto_274305 ) ) ( not ( = ?auto_274304 ?auto_274306 ) ) ( not ( = ?auto_274304 ?auto_274307 ) ) ( not ( = ?auto_274304 ?auto_274308 ) ) ( not ( = ?auto_274304 ?auto_274309 ) ) ( not ( = ?auto_274305 ?auto_274306 ) ) ( not ( = ?auto_274305 ?auto_274307 ) ) ( not ( = ?auto_274305 ?auto_274308 ) ) ( not ( = ?auto_274305 ?auto_274309 ) ) ( not ( = ?auto_274306 ?auto_274307 ) ) ( not ( = ?auto_274306 ?auto_274308 ) ) ( not ( = ?auto_274306 ?auto_274309 ) ) ( not ( = ?auto_274307 ?auto_274308 ) ) ( not ( = ?auto_274307 ?auto_274309 ) ) ( not ( = ?auto_274308 ?auto_274309 ) ) ( CLEAR ?auto_274307 ) ( ON ?auto_274308 ?auto_274309 ) ( CLEAR ?auto_274308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_274297 ?auto_274298 ?auto_274299 ?auto_274300 ?auto_274301 ?auto_274302 ?auto_274303 ?auto_274304 ?auto_274305 ?auto_274306 ?auto_274307 ?auto_274308 )
      ( MAKE-13PILE ?auto_274297 ?auto_274298 ?auto_274299 ?auto_274300 ?auto_274301 ?auto_274302 ?auto_274303 ?auto_274304 ?auto_274305 ?auto_274306 ?auto_274307 ?auto_274308 ?auto_274309 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_274323 - BLOCK
      ?auto_274324 - BLOCK
      ?auto_274325 - BLOCK
      ?auto_274326 - BLOCK
      ?auto_274327 - BLOCK
      ?auto_274328 - BLOCK
      ?auto_274329 - BLOCK
      ?auto_274330 - BLOCK
      ?auto_274331 - BLOCK
      ?auto_274332 - BLOCK
      ?auto_274333 - BLOCK
      ?auto_274334 - BLOCK
      ?auto_274335 - BLOCK
    )
    :vars
    (
      ?auto_274336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_274335 ?auto_274336 ) ( ON-TABLE ?auto_274323 ) ( ON ?auto_274324 ?auto_274323 ) ( ON ?auto_274325 ?auto_274324 ) ( ON ?auto_274326 ?auto_274325 ) ( ON ?auto_274327 ?auto_274326 ) ( ON ?auto_274328 ?auto_274327 ) ( ON ?auto_274329 ?auto_274328 ) ( ON ?auto_274330 ?auto_274329 ) ( ON ?auto_274331 ?auto_274330 ) ( ON ?auto_274332 ?auto_274331 ) ( not ( = ?auto_274323 ?auto_274324 ) ) ( not ( = ?auto_274323 ?auto_274325 ) ) ( not ( = ?auto_274323 ?auto_274326 ) ) ( not ( = ?auto_274323 ?auto_274327 ) ) ( not ( = ?auto_274323 ?auto_274328 ) ) ( not ( = ?auto_274323 ?auto_274329 ) ) ( not ( = ?auto_274323 ?auto_274330 ) ) ( not ( = ?auto_274323 ?auto_274331 ) ) ( not ( = ?auto_274323 ?auto_274332 ) ) ( not ( = ?auto_274323 ?auto_274333 ) ) ( not ( = ?auto_274323 ?auto_274334 ) ) ( not ( = ?auto_274323 ?auto_274335 ) ) ( not ( = ?auto_274323 ?auto_274336 ) ) ( not ( = ?auto_274324 ?auto_274325 ) ) ( not ( = ?auto_274324 ?auto_274326 ) ) ( not ( = ?auto_274324 ?auto_274327 ) ) ( not ( = ?auto_274324 ?auto_274328 ) ) ( not ( = ?auto_274324 ?auto_274329 ) ) ( not ( = ?auto_274324 ?auto_274330 ) ) ( not ( = ?auto_274324 ?auto_274331 ) ) ( not ( = ?auto_274324 ?auto_274332 ) ) ( not ( = ?auto_274324 ?auto_274333 ) ) ( not ( = ?auto_274324 ?auto_274334 ) ) ( not ( = ?auto_274324 ?auto_274335 ) ) ( not ( = ?auto_274324 ?auto_274336 ) ) ( not ( = ?auto_274325 ?auto_274326 ) ) ( not ( = ?auto_274325 ?auto_274327 ) ) ( not ( = ?auto_274325 ?auto_274328 ) ) ( not ( = ?auto_274325 ?auto_274329 ) ) ( not ( = ?auto_274325 ?auto_274330 ) ) ( not ( = ?auto_274325 ?auto_274331 ) ) ( not ( = ?auto_274325 ?auto_274332 ) ) ( not ( = ?auto_274325 ?auto_274333 ) ) ( not ( = ?auto_274325 ?auto_274334 ) ) ( not ( = ?auto_274325 ?auto_274335 ) ) ( not ( = ?auto_274325 ?auto_274336 ) ) ( not ( = ?auto_274326 ?auto_274327 ) ) ( not ( = ?auto_274326 ?auto_274328 ) ) ( not ( = ?auto_274326 ?auto_274329 ) ) ( not ( = ?auto_274326 ?auto_274330 ) ) ( not ( = ?auto_274326 ?auto_274331 ) ) ( not ( = ?auto_274326 ?auto_274332 ) ) ( not ( = ?auto_274326 ?auto_274333 ) ) ( not ( = ?auto_274326 ?auto_274334 ) ) ( not ( = ?auto_274326 ?auto_274335 ) ) ( not ( = ?auto_274326 ?auto_274336 ) ) ( not ( = ?auto_274327 ?auto_274328 ) ) ( not ( = ?auto_274327 ?auto_274329 ) ) ( not ( = ?auto_274327 ?auto_274330 ) ) ( not ( = ?auto_274327 ?auto_274331 ) ) ( not ( = ?auto_274327 ?auto_274332 ) ) ( not ( = ?auto_274327 ?auto_274333 ) ) ( not ( = ?auto_274327 ?auto_274334 ) ) ( not ( = ?auto_274327 ?auto_274335 ) ) ( not ( = ?auto_274327 ?auto_274336 ) ) ( not ( = ?auto_274328 ?auto_274329 ) ) ( not ( = ?auto_274328 ?auto_274330 ) ) ( not ( = ?auto_274328 ?auto_274331 ) ) ( not ( = ?auto_274328 ?auto_274332 ) ) ( not ( = ?auto_274328 ?auto_274333 ) ) ( not ( = ?auto_274328 ?auto_274334 ) ) ( not ( = ?auto_274328 ?auto_274335 ) ) ( not ( = ?auto_274328 ?auto_274336 ) ) ( not ( = ?auto_274329 ?auto_274330 ) ) ( not ( = ?auto_274329 ?auto_274331 ) ) ( not ( = ?auto_274329 ?auto_274332 ) ) ( not ( = ?auto_274329 ?auto_274333 ) ) ( not ( = ?auto_274329 ?auto_274334 ) ) ( not ( = ?auto_274329 ?auto_274335 ) ) ( not ( = ?auto_274329 ?auto_274336 ) ) ( not ( = ?auto_274330 ?auto_274331 ) ) ( not ( = ?auto_274330 ?auto_274332 ) ) ( not ( = ?auto_274330 ?auto_274333 ) ) ( not ( = ?auto_274330 ?auto_274334 ) ) ( not ( = ?auto_274330 ?auto_274335 ) ) ( not ( = ?auto_274330 ?auto_274336 ) ) ( not ( = ?auto_274331 ?auto_274332 ) ) ( not ( = ?auto_274331 ?auto_274333 ) ) ( not ( = ?auto_274331 ?auto_274334 ) ) ( not ( = ?auto_274331 ?auto_274335 ) ) ( not ( = ?auto_274331 ?auto_274336 ) ) ( not ( = ?auto_274332 ?auto_274333 ) ) ( not ( = ?auto_274332 ?auto_274334 ) ) ( not ( = ?auto_274332 ?auto_274335 ) ) ( not ( = ?auto_274332 ?auto_274336 ) ) ( not ( = ?auto_274333 ?auto_274334 ) ) ( not ( = ?auto_274333 ?auto_274335 ) ) ( not ( = ?auto_274333 ?auto_274336 ) ) ( not ( = ?auto_274334 ?auto_274335 ) ) ( not ( = ?auto_274334 ?auto_274336 ) ) ( not ( = ?auto_274335 ?auto_274336 ) ) ( ON ?auto_274334 ?auto_274335 ) ( CLEAR ?auto_274332 ) ( ON ?auto_274333 ?auto_274334 ) ( CLEAR ?auto_274333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_274323 ?auto_274324 ?auto_274325 ?auto_274326 ?auto_274327 ?auto_274328 ?auto_274329 ?auto_274330 ?auto_274331 ?auto_274332 ?auto_274333 )
      ( MAKE-13PILE ?auto_274323 ?auto_274324 ?auto_274325 ?auto_274326 ?auto_274327 ?auto_274328 ?auto_274329 ?auto_274330 ?auto_274331 ?auto_274332 ?auto_274333 ?auto_274334 ?auto_274335 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_274350 - BLOCK
      ?auto_274351 - BLOCK
      ?auto_274352 - BLOCK
      ?auto_274353 - BLOCK
      ?auto_274354 - BLOCK
      ?auto_274355 - BLOCK
      ?auto_274356 - BLOCK
      ?auto_274357 - BLOCK
      ?auto_274358 - BLOCK
      ?auto_274359 - BLOCK
      ?auto_274360 - BLOCK
      ?auto_274361 - BLOCK
      ?auto_274362 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_274362 ) ( ON-TABLE ?auto_274350 ) ( ON ?auto_274351 ?auto_274350 ) ( ON ?auto_274352 ?auto_274351 ) ( ON ?auto_274353 ?auto_274352 ) ( ON ?auto_274354 ?auto_274353 ) ( ON ?auto_274355 ?auto_274354 ) ( ON ?auto_274356 ?auto_274355 ) ( ON ?auto_274357 ?auto_274356 ) ( ON ?auto_274358 ?auto_274357 ) ( ON ?auto_274359 ?auto_274358 ) ( not ( = ?auto_274350 ?auto_274351 ) ) ( not ( = ?auto_274350 ?auto_274352 ) ) ( not ( = ?auto_274350 ?auto_274353 ) ) ( not ( = ?auto_274350 ?auto_274354 ) ) ( not ( = ?auto_274350 ?auto_274355 ) ) ( not ( = ?auto_274350 ?auto_274356 ) ) ( not ( = ?auto_274350 ?auto_274357 ) ) ( not ( = ?auto_274350 ?auto_274358 ) ) ( not ( = ?auto_274350 ?auto_274359 ) ) ( not ( = ?auto_274350 ?auto_274360 ) ) ( not ( = ?auto_274350 ?auto_274361 ) ) ( not ( = ?auto_274350 ?auto_274362 ) ) ( not ( = ?auto_274351 ?auto_274352 ) ) ( not ( = ?auto_274351 ?auto_274353 ) ) ( not ( = ?auto_274351 ?auto_274354 ) ) ( not ( = ?auto_274351 ?auto_274355 ) ) ( not ( = ?auto_274351 ?auto_274356 ) ) ( not ( = ?auto_274351 ?auto_274357 ) ) ( not ( = ?auto_274351 ?auto_274358 ) ) ( not ( = ?auto_274351 ?auto_274359 ) ) ( not ( = ?auto_274351 ?auto_274360 ) ) ( not ( = ?auto_274351 ?auto_274361 ) ) ( not ( = ?auto_274351 ?auto_274362 ) ) ( not ( = ?auto_274352 ?auto_274353 ) ) ( not ( = ?auto_274352 ?auto_274354 ) ) ( not ( = ?auto_274352 ?auto_274355 ) ) ( not ( = ?auto_274352 ?auto_274356 ) ) ( not ( = ?auto_274352 ?auto_274357 ) ) ( not ( = ?auto_274352 ?auto_274358 ) ) ( not ( = ?auto_274352 ?auto_274359 ) ) ( not ( = ?auto_274352 ?auto_274360 ) ) ( not ( = ?auto_274352 ?auto_274361 ) ) ( not ( = ?auto_274352 ?auto_274362 ) ) ( not ( = ?auto_274353 ?auto_274354 ) ) ( not ( = ?auto_274353 ?auto_274355 ) ) ( not ( = ?auto_274353 ?auto_274356 ) ) ( not ( = ?auto_274353 ?auto_274357 ) ) ( not ( = ?auto_274353 ?auto_274358 ) ) ( not ( = ?auto_274353 ?auto_274359 ) ) ( not ( = ?auto_274353 ?auto_274360 ) ) ( not ( = ?auto_274353 ?auto_274361 ) ) ( not ( = ?auto_274353 ?auto_274362 ) ) ( not ( = ?auto_274354 ?auto_274355 ) ) ( not ( = ?auto_274354 ?auto_274356 ) ) ( not ( = ?auto_274354 ?auto_274357 ) ) ( not ( = ?auto_274354 ?auto_274358 ) ) ( not ( = ?auto_274354 ?auto_274359 ) ) ( not ( = ?auto_274354 ?auto_274360 ) ) ( not ( = ?auto_274354 ?auto_274361 ) ) ( not ( = ?auto_274354 ?auto_274362 ) ) ( not ( = ?auto_274355 ?auto_274356 ) ) ( not ( = ?auto_274355 ?auto_274357 ) ) ( not ( = ?auto_274355 ?auto_274358 ) ) ( not ( = ?auto_274355 ?auto_274359 ) ) ( not ( = ?auto_274355 ?auto_274360 ) ) ( not ( = ?auto_274355 ?auto_274361 ) ) ( not ( = ?auto_274355 ?auto_274362 ) ) ( not ( = ?auto_274356 ?auto_274357 ) ) ( not ( = ?auto_274356 ?auto_274358 ) ) ( not ( = ?auto_274356 ?auto_274359 ) ) ( not ( = ?auto_274356 ?auto_274360 ) ) ( not ( = ?auto_274356 ?auto_274361 ) ) ( not ( = ?auto_274356 ?auto_274362 ) ) ( not ( = ?auto_274357 ?auto_274358 ) ) ( not ( = ?auto_274357 ?auto_274359 ) ) ( not ( = ?auto_274357 ?auto_274360 ) ) ( not ( = ?auto_274357 ?auto_274361 ) ) ( not ( = ?auto_274357 ?auto_274362 ) ) ( not ( = ?auto_274358 ?auto_274359 ) ) ( not ( = ?auto_274358 ?auto_274360 ) ) ( not ( = ?auto_274358 ?auto_274361 ) ) ( not ( = ?auto_274358 ?auto_274362 ) ) ( not ( = ?auto_274359 ?auto_274360 ) ) ( not ( = ?auto_274359 ?auto_274361 ) ) ( not ( = ?auto_274359 ?auto_274362 ) ) ( not ( = ?auto_274360 ?auto_274361 ) ) ( not ( = ?auto_274360 ?auto_274362 ) ) ( not ( = ?auto_274361 ?auto_274362 ) ) ( ON ?auto_274361 ?auto_274362 ) ( CLEAR ?auto_274359 ) ( ON ?auto_274360 ?auto_274361 ) ( CLEAR ?auto_274360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_274350 ?auto_274351 ?auto_274352 ?auto_274353 ?auto_274354 ?auto_274355 ?auto_274356 ?auto_274357 ?auto_274358 ?auto_274359 ?auto_274360 )
      ( MAKE-13PILE ?auto_274350 ?auto_274351 ?auto_274352 ?auto_274353 ?auto_274354 ?auto_274355 ?auto_274356 ?auto_274357 ?auto_274358 ?auto_274359 ?auto_274360 ?auto_274361 ?auto_274362 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_274376 - BLOCK
      ?auto_274377 - BLOCK
      ?auto_274378 - BLOCK
      ?auto_274379 - BLOCK
      ?auto_274380 - BLOCK
      ?auto_274381 - BLOCK
      ?auto_274382 - BLOCK
      ?auto_274383 - BLOCK
      ?auto_274384 - BLOCK
      ?auto_274385 - BLOCK
      ?auto_274386 - BLOCK
      ?auto_274387 - BLOCK
      ?auto_274388 - BLOCK
    )
    :vars
    (
      ?auto_274389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_274388 ?auto_274389 ) ( ON-TABLE ?auto_274376 ) ( ON ?auto_274377 ?auto_274376 ) ( ON ?auto_274378 ?auto_274377 ) ( ON ?auto_274379 ?auto_274378 ) ( ON ?auto_274380 ?auto_274379 ) ( ON ?auto_274381 ?auto_274380 ) ( ON ?auto_274382 ?auto_274381 ) ( ON ?auto_274383 ?auto_274382 ) ( ON ?auto_274384 ?auto_274383 ) ( not ( = ?auto_274376 ?auto_274377 ) ) ( not ( = ?auto_274376 ?auto_274378 ) ) ( not ( = ?auto_274376 ?auto_274379 ) ) ( not ( = ?auto_274376 ?auto_274380 ) ) ( not ( = ?auto_274376 ?auto_274381 ) ) ( not ( = ?auto_274376 ?auto_274382 ) ) ( not ( = ?auto_274376 ?auto_274383 ) ) ( not ( = ?auto_274376 ?auto_274384 ) ) ( not ( = ?auto_274376 ?auto_274385 ) ) ( not ( = ?auto_274376 ?auto_274386 ) ) ( not ( = ?auto_274376 ?auto_274387 ) ) ( not ( = ?auto_274376 ?auto_274388 ) ) ( not ( = ?auto_274376 ?auto_274389 ) ) ( not ( = ?auto_274377 ?auto_274378 ) ) ( not ( = ?auto_274377 ?auto_274379 ) ) ( not ( = ?auto_274377 ?auto_274380 ) ) ( not ( = ?auto_274377 ?auto_274381 ) ) ( not ( = ?auto_274377 ?auto_274382 ) ) ( not ( = ?auto_274377 ?auto_274383 ) ) ( not ( = ?auto_274377 ?auto_274384 ) ) ( not ( = ?auto_274377 ?auto_274385 ) ) ( not ( = ?auto_274377 ?auto_274386 ) ) ( not ( = ?auto_274377 ?auto_274387 ) ) ( not ( = ?auto_274377 ?auto_274388 ) ) ( not ( = ?auto_274377 ?auto_274389 ) ) ( not ( = ?auto_274378 ?auto_274379 ) ) ( not ( = ?auto_274378 ?auto_274380 ) ) ( not ( = ?auto_274378 ?auto_274381 ) ) ( not ( = ?auto_274378 ?auto_274382 ) ) ( not ( = ?auto_274378 ?auto_274383 ) ) ( not ( = ?auto_274378 ?auto_274384 ) ) ( not ( = ?auto_274378 ?auto_274385 ) ) ( not ( = ?auto_274378 ?auto_274386 ) ) ( not ( = ?auto_274378 ?auto_274387 ) ) ( not ( = ?auto_274378 ?auto_274388 ) ) ( not ( = ?auto_274378 ?auto_274389 ) ) ( not ( = ?auto_274379 ?auto_274380 ) ) ( not ( = ?auto_274379 ?auto_274381 ) ) ( not ( = ?auto_274379 ?auto_274382 ) ) ( not ( = ?auto_274379 ?auto_274383 ) ) ( not ( = ?auto_274379 ?auto_274384 ) ) ( not ( = ?auto_274379 ?auto_274385 ) ) ( not ( = ?auto_274379 ?auto_274386 ) ) ( not ( = ?auto_274379 ?auto_274387 ) ) ( not ( = ?auto_274379 ?auto_274388 ) ) ( not ( = ?auto_274379 ?auto_274389 ) ) ( not ( = ?auto_274380 ?auto_274381 ) ) ( not ( = ?auto_274380 ?auto_274382 ) ) ( not ( = ?auto_274380 ?auto_274383 ) ) ( not ( = ?auto_274380 ?auto_274384 ) ) ( not ( = ?auto_274380 ?auto_274385 ) ) ( not ( = ?auto_274380 ?auto_274386 ) ) ( not ( = ?auto_274380 ?auto_274387 ) ) ( not ( = ?auto_274380 ?auto_274388 ) ) ( not ( = ?auto_274380 ?auto_274389 ) ) ( not ( = ?auto_274381 ?auto_274382 ) ) ( not ( = ?auto_274381 ?auto_274383 ) ) ( not ( = ?auto_274381 ?auto_274384 ) ) ( not ( = ?auto_274381 ?auto_274385 ) ) ( not ( = ?auto_274381 ?auto_274386 ) ) ( not ( = ?auto_274381 ?auto_274387 ) ) ( not ( = ?auto_274381 ?auto_274388 ) ) ( not ( = ?auto_274381 ?auto_274389 ) ) ( not ( = ?auto_274382 ?auto_274383 ) ) ( not ( = ?auto_274382 ?auto_274384 ) ) ( not ( = ?auto_274382 ?auto_274385 ) ) ( not ( = ?auto_274382 ?auto_274386 ) ) ( not ( = ?auto_274382 ?auto_274387 ) ) ( not ( = ?auto_274382 ?auto_274388 ) ) ( not ( = ?auto_274382 ?auto_274389 ) ) ( not ( = ?auto_274383 ?auto_274384 ) ) ( not ( = ?auto_274383 ?auto_274385 ) ) ( not ( = ?auto_274383 ?auto_274386 ) ) ( not ( = ?auto_274383 ?auto_274387 ) ) ( not ( = ?auto_274383 ?auto_274388 ) ) ( not ( = ?auto_274383 ?auto_274389 ) ) ( not ( = ?auto_274384 ?auto_274385 ) ) ( not ( = ?auto_274384 ?auto_274386 ) ) ( not ( = ?auto_274384 ?auto_274387 ) ) ( not ( = ?auto_274384 ?auto_274388 ) ) ( not ( = ?auto_274384 ?auto_274389 ) ) ( not ( = ?auto_274385 ?auto_274386 ) ) ( not ( = ?auto_274385 ?auto_274387 ) ) ( not ( = ?auto_274385 ?auto_274388 ) ) ( not ( = ?auto_274385 ?auto_274389 ) ) ( not ( = ?auto_274386 ?auto_274387 ) ) ( not ( = ?auto_274386 ?auto_274388 ) ) ( not ( = ?auto_274386 ?auto_274389 ) ) ( not ( = ?auto_274387 ?auto_274388 ) ) ( not ( = ?auto_274387 ?auto_274389 ) ) ( not ( = ?auto_274388 ?auto_274389 ) ) ( ON ?auto_274387 ?auto_274388 ) ( ON ?auto_274386 ?auto_274387 ) ( CLEAR ?auto_274384 ) ( ON ?auto_274385 ?auto_274386 ) ( CLEAR ?auto_274385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_274376 ?auto_274377 ?auto_274378 ?auto_274379 ?auto_274380 ?auto_274381 ?auto_274382 ?auto_274383 ?auto_274384 ?auto_274385 )
      ( MAKE-13PILE ?auto_274376 ?auto_274377 ?auto_274378 ?auto_274379 ?auto_274380 ?auto_274381 ?auto_274382 ?auto_274383 ?auto_274384 ?auto_274385 ?auto_274386 ?auto_274387 ?auto_274388 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_274403 - BLOCK
      ?auto_274404 - BLOCK
      ?auto_274405 - BLOCK
      ?auto_274406 - BLOCK
      ?auto_274407 - BLOCK
      ?auto_274408 - BLOCK
      ?auto_274409 - BLOCK
      ?auto_274410 - BLOCK
      ?auto_274411 - BLOCK
      ?auto_274412 - BLOCK
      ?auto_274413 - BLOCK
      ?auto_274414 - BLOCK
      ?auto_274415 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_274415 ) ( ON-TABLE ?auto_274403 ) ( ON ?auto_274404 ?auto_274403 ) ( ON ?auto_274405 ?auto_274404 ) ( ON ?auto_274406 ?auto_274405 ) ( ON ?auto_274407 ?auto_274406 ) ( ON ?auto_274408 ?auto_274407 ) ( ON ?auto_274409 ?auto_274408 ) ( ON ?auto_274410 ?auto_274409 ) ( ON ?auto_274411 ?auto_274410 ) ( not ( = ?auto_274403 ?auto_274404 ) ) ( not ( = ?auto_274403 ?auto_274405 ) ) ( not ( = ?auto_274403 ?auto_274406 ) ) ( not ( = ?auto_274403 ?auto_274407 ) ) ( not ( = ?auto_274403 ?auto_274408 ) ) ( not ( = ?auto_274403 ?auto_274409 ) ) ( not ( = ?auto_274403 ?auto_274410 ) ) ( not ( = ?auto_274403 ?auto_274411 ) ) ( not ( = ?auto_274403 ?auto_274412 ) ) ( not ( = ?auto_274403 ?auto_274413 ) ) ( not ( = ?auto_274403 ?auto_274414 ) ) ( not ( = ?auto_274403 ?auto_274415 ) ) ( not ( = ?auto_274404 ?auto_274405 ) ) ( not ( = ?auto_274404 ?auto_274406 ) ) ( not ( = ?auto_274404 ?auto_274407 ) ) ( not ( = ?auto_274404 ?auto_274408 ) ) ( not ( = ?auto_274404 ?auto_274409 ) ) ( not ( = ?auto_274404 ?auto_274410 ) ) ( not ( = ?auto_274404 ?auto_274411 ) ) ( not ( = ?auto_274404 ?auto_274412 ) ) ( not ( = ?auto_274404 ?auto_274413 ) ) ( not ( = ?auto_274404 ?auto_274414 ) ) ( not ( = ?auto_274404 ?auto_274415 ) ) ( not ( = ?auto_274405 ?auto_274406 ) ) ( not ( = ?auto_274405 ?auto_274407 ) ) ( not ( = ?auto_274405 ?auto_274408 ) ) ( not ( = ?auto_274405 ?auto_274409 ) ) ( not ( = ?auto_274405 ?auto_274410 ) ) ( not ( = ?auto_274405 ?auto_274411 ) ) ( not ( = ?auto_274405 ?auto_274412 ) ) ( not ( = ?auto_274405 ?auto_274413 ) ) ( not ( = ?auto_274405 ?auto_274414 ) ) ( not ( = ?auto_274405 ?auto_274415 ) ) ( not ( = ?auto_274406 ?auto_274407 ) ) ( not ( = ?auto_274406 ?auto_274408 ) ) ( not ( = ?auto_274406 ?auto_274409 ) ) ( not ( = ?auto_274406 ?auto_274410 ) ) ( not ( = ?auto_274406 ?auto_274411 ) ) ( not ( = ?auto_274406 ?auto_274412 ) ) ( not ( = ?auto_274406 ?auto_274413 ) ) ( not ( = ?auto_274406 ?auto_274414 ) ) ( not ( = ?auto_274406 ?auto_274415 ) ) ( not ( = ?auto_274407 ?auto_274408 ) ) ( not ( = ?auto_274407 ?auto_274409 ) ) ( not ( = ?auto_274407 ?auto_274410 ) ) ( not ( = ?auto_274407 ?auto_274411 ) ) ( not ( = ?auto_274407 ?auto_274412 ) ) ( not ( = ?auto_274407 ?auto_274413 ) ) ( not ( = ?auto_274407 ?auto_274414 ) ) ( not ( = ?auto_274407 ?auto_274415 ) ) ( not ( = ?auto_274408 ?auto_274409 ) ) ( not ( = ?auto_274408 ?auto_274410 ) ) ( not ( = ?auto_274408 ?auto_274411 ) ) ( not ( = ?auto_274408 ?auto_274412 ) ) ( not ( = ?auto_274408 ?auto_274413 ) ) ( not ( = ?auto_274408 ?auto_274414 ) ) ( not ( = ?auto_274408 ?auto_274415 ) ) ( not ( = ?auto_274409 ?auto_274410 ) ) ( not ( = ?auto_274409 ?auto_274411 ) ) ( not ( = ?auto_274409 ?auto_274412 ) ) ( not ( = ?auto_274409 ?auto_274413 ) ) ( not ( = ?auto_274409 ?auto_274414 ) ) ( not ( = ?auto_274409 ?auto_274415 ) ) ( not ( = ?auto_274410 ?auto_274411 ) ) ( not ( = ?auto_274410 ?auto_274412 ) ) ( not ( = ?auto_274410 ?auto_274413 ) ) ( not ( = ?auto_274410 ?auto_274414 ) ) ( not ( = ?auto_274410 ?auto_274415 ) ) ( not ( = ?auto_274411 ?auto_274412 ) ) ( not ( = ?auto_274411 ?auto_274413 ) ) ( not ( = ?auto_274411 ?auto_274414 ) ) ( not ( = ?auto_274411 ?auto_274415 ) ) ( not ( = ?auto_274412 ?auto_274413 ) ) ( not ( = ?auto_274412 ?auto_274414 ) ) ( not ( = ?auto_274412 ?auto_274415 ) ) ( not ( = ?auto_274413 ?auto_274414 ) ) ( not ( = ?auto_274413 ?auto_274415 ) ) ( not ( = ?auto_274414 ?auto_274415 ) ) ( ON ?auto_274414 ?auto_274415 ) ( ON ?auto_274413 ?auto_274414 ) ( CLEAR ?auto_274411 ) ( ON ?auto_274412 ?auto_274413 ) ( CLEAR ?auto_274412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_274403 ?auto_274404 ?auto_274405 ?auto_274406 ?auto_274407 ?auto_274408 ?auto_274409 ?auto_274410 ?auto_274411 ?auto_274412 )
      ( MAKE-13PILE ?auto_274403 ?auto_274404 ?auto_274405 ?auto_274406 ?auto_274407 ?auto_274408 ?auto_274409 ?auto_274410 ?auto_274411 ?auto_274412 ?auto_274413 ?auto_274414 ?auto_274415 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_274429 - BLOCK
      ?auto_274430 - BLOCK
      ?auto_274431 - BLOCK
      ?auto_274432 - BLOCK
      ?auto_274433 - BLOCK
      ?auto_274434 - BLOCK
      ?auto_274435 - BLOCK
      ?auto_274436 - BLOCK
      ?auto_274437 - BLOCK
      ?auto_274438 - BLOCK
      ?auto_274439 - BLOCK
      ?auto_274440 - BLOCK
      ?auto_274441 - BLOCK
    )
    :vars
    (
      ?auto_274442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_274441 ?auto_274442 ) ( ON-TABLE ?auto_274429 ) ( ON ?auto_274430 ?auto_274429 ) ( ON ?auto_274431 ?auto_274430 ) ( ON ?auto_274432 ?auto_274431 ) ( ON ?auto_274433 ?auto_274432 ) ( ON ?auto_274434 ?auto_274433 ) ( ON ?auto_274435 ?auto_274434 ) ( ON ?auto_274436 ?auto_274435 ) ( not ( = ?auto_274429 ?auto_274430 ) ) ( not ( = ?auto_274429 ?auto_274431 ) ) ( not ( = ?auto_274429 ?auto_274432 ) ) ( not ( = ?auto_274429 ?auto_274433 ) ) ( not ( = ?auto_274429 ?auto_274434 ) ) ( not ( = ?auto_274429 ?auto_274435 ) ) ( not ( = ?auto_274429 ?auto_274436 ) ) ( not ( = ?auto_274429 ?auto_274437 ) ) ( not ( = ?auto_274429 ?auto_274438 ) ) ( not ( = ?auto_274429 ?auto_274439 ) ) ( not ( = ?auto_274429 ?auto_274440 ) ) ( not ( = ?auto_274429 ?auto_274441 ) ) ( not ( = ?auto_274429 ?auto_274442 ) ) ( not ( = ?auto_274430 ?auto_274431 ) ) ( not ( = ?auto_274430 ?auto_274432 ) ) ( not ( = ?auto_274430 ?auto_274433 ) ) ( not ( = ?auto_274430 ?auto_274434 ) ) ( not ( = ?auto_274430 ?auto_274435 ) ) ( not ( = ?auto_274430 ?auto_274436 ) ) ( not ( = ?auto_274430 ?auto_274437 ) ) ( not ( = ?auto_274430 ?auto_274438 ) ) ( not ( = ?auto_274430 ?auto_274439 ) ) ( not ( = ?auto_274430 ?auto_274440 ) ) ( not ( = ?auto_274430 ?auto_274441 ) ) ( not ( = ?auto_274430 ?auto_274442 ) ) ( not ( = ?auto_274431 ?auto_274432 ) ) ( not ( = ?auto_274431 ?auto_274433 ) ) ( not ( = ?auto_274431 ?auto_274434 ) ) ( not ( = ?auto_274431 ?auto_274435 ) ) ( not ( = ?auto_274431 ?auto_274436 ) ) ( not ( = ?auto_274431 ?auto_274437 ) ) ( not ( = ?auto_274431 ?auto_274438 ) ) ( not ( = ?auto_274431 ?auto_274439 ) ) ( not ( = ?auto_274431 ?auto_274440 ) ) ( not ( = ?auto_274431 ?auto_274441 ) ) ( not ( = ?auto_274431 ?auto_274442 ) ) ( not ( = ?auto_274432 ?auto_274433 ) ) ( not ( = ?auto_274432 ?auto_274434 ) ) ( not ( = ?auto_274432 ?auto_274435 ) ) ( not ( = ?auto_274432 ?auto_274436 ) ) ( not ( = ?auto_274432 ?auto_274437 ) ) ( not ( = ?auto_274432 ?auto_274438 ) ) ( not ( = ?auto_274432 ?auto_274439 ) ) ( not ( = ?auto_274432 ?auto_274440 ) ) ( not ( = ?auto_274432 ?auto_274441 ) ) ( not ( = ?auto_274432 ?auto_274442 ) ) ( not ( = ?auto_274433 ?auto_274434 ) ) ( not ( = ?auto_274433 ?auto_274435 ) ) ( not ( = ?auto_274433 ?auto_274436 ) ) ( not ( = ?auto_274433 ?auto_274437 ) ) ( not ( = ?auto_274433 ?auto_274438 ) ) ( not ( = ?auto_274433 ?auto_274439 ) ) ( not ( = ?auto_274433 ?auto_274440 ) ) ( not ( = ?auto_274433 ?auto_274441 ) ) ( not ( = ?auto_274433 ?auto_274442 ) ) ( not ( = ?auto_274434 ?auto_274435 ) ) ( not ( = ?auto_274434 ?auto_274436 ) ) ( not ( = ?auto_274434 ?auto_274437 ) ) ( not ( = ?auto_274434 ?auto_274438 ) ) ( not ( = ?auto_274434 ?auto_274439 ) ) ( not ( = ?auto_274434 ?auto_274440 ) ) ( not ( = ?auto_274434 ?auto_274441 ) ) ( not ( = ?auto_274434 ?auto_274442 ) ) ( not ( = ?auto_274435 ?auto_274436 ) ) ( not ( = ?auto_274435 ?auto_274437 ) ) ( not ( = ?auto_274435 ?auto_274438 ) ) ( not ( = ?auto_274435 ?auto_274439 ) ) ( not ( = ?auto_274435 ?auto_274440 ) ) ( not ( = ?auto_274435 ?auto_274441 ) ) ( not ( = ?auto_274435 ?auto_274442 ) ) ( not ( = ?auto_274436 ?auto_274437 ) ) ( not ( = ?auto_274436 ?auto_274438 ) ) ( not ( = ?auto_274436 ?auto_274439 ) ) ( not ( = ?auto_274436 ?auto_274440 ) ) ( not ( = ?auto_274436 ?auto_274441 ) ) ( not ( = ?auto_274436 ?auto_274442 ) ) ( not ( = ?auto_274437 ?auto_274438 ) ) ( not ( = ?auto_274437 ?auto_274439 ) ) ( not ( = ?auto_274437 ?auto_274440 ) ) ( not ( = ?auto_274437 ?auto_274441 ) ) ( not ( = ?auto_274437 ?auto_274442 ) ) ( not ( = ?auto_274438 ?auto_274439 ) ) ( not ( = ?auto_274438 ?auto_274440 ) ) ( not ( = ?auto_274438 ?auto_274441 ) ) ( not ( = ?auto_274438 ?auto_274442 ) ) ( not ( = ?auto_274439 ?auto_274440 ) ) ( not ( = ?auto_274439 ?auto_274441 ) ) ( not ( = ?auto_274439 ?auto_274442 ) ) ( not ( = ?auto_274440 ?auto_274441 ) ) ( not ( = ?auto_274440 ?auto_274442 ) ) ( not ( = ?auto_274441 ?auto_274442 ) ) ( ON ?auto_274440 ?auto_274441 ) ( ON ?auto_274439 ?auto_274440 ) ( ON ?auto_274438 ?auto_274439 ) ( CLEAR ?auto_274436 ) ( ON ?auto_274437 ?auto_274438 ) ( CLEAR ?auto_274437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_274429 ?auto_274430 ?auto_274431 ?auto_274432 ?auto_274433 ?auto_274434 ?auto_274435 ?auto_274436 ?auto_274437 )
      ( MAKE-13PILE ?auto_274429 ?auto_274430 ?auto_274431 ?auto_274432 ?auto_274433 ?auto_274434 ?auto_274435 ?auto_274436 ?auto_274437 ?auto_274438 ?auto_274439 ?auto_274440 ?auto_274441 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_274456 - BLOCK
      ?auto_274457 - BLOCK
      ?auto_274458 - BLOCK
      ?auto_274459 - BLOCK
      ?auto_274460 - BLOCK
      ?auto_274461 - BLOCK
      ?auto_274462 - BLOCK
      ?auto_274463 - BLOCK
      ?auto_274464 - BLOCK
      ?auto_274465 - BLOCK
      ?auto_274466 - BLOCK
      ?auto_274467 - BLOCK
      ?auto_274468 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_274468 ) ( ON-TABLE ?auto_274456 ) ( ON ?auto_274457 ?auto_274456 ) ( ON ?auto_274458 ?auto_274457 ) ( ON ?auto_274459 ?auto_274458 ) ( ON ?auto_274460 ?auto_274459 ) ( ON ?auto_274461 ?auto_274460 ) ( ON ?auto_274462 ?auto_274461 ) ( ON ?auto_274463 ?auto_274462 ) ( not ( = ?auto_274456 ?auto_274457 ) ) ( not ( = ?auto_274456 ?auto_274458 ) ) ( not ( = ?auto_274456 ?auto_274459 ) ) ( not ( = ?auto_274456 ?auto_274460 ) ) ( not ( = ?auto_274456 ?auto_274461 ) ) ( not ( = ?auto_274456 ?auto_274462 ) ) ( not ( = ?auto_274456 ?auto_274463 ) ) ( not ( = ?auto_274456 ?auto_274464 ) ) ( not ( = ?auto_274456 ?auto_274465 ) ) ( not ( = ?auto_274456 ?auto_274466 ) ) ( not ( = ?auto_274456 ?auto_274467 ) ) ( not ( = ?auto_274456 ?auto_274468 ) ) ( not ( = ?auto_274457 ?auto_274458 ) ) ( not ( = ?auto_274457 ?auto_274459 ) ) ( not ( = ?auto_274457 ?auto_274460 ) ) ( not ( = ?auto_274457 ?auto_274461 ) ) ( not ( = ?auto_274457 ?auto_274462 ) ) ( not ( = ?auto_274457 ?auto_274463 ) ) ( not ( = ?auto_274457 ?auto_274464 ) ) ( not ( = ?auto_274457 ?auto_274465 ) ) ( not ( = ?auto_274457 ?auto_274466 ) ) ( not ( = ?auto_274457 ?auto_274467 ) ) ( not ( = ?auto_274457 ?auto_274468 ) ) ( not ( = ?auto_274458 ?auto_274459 ) ) ( not ( = ?auto_274458 ?auto_274460 ) ) ( not ( = ?auto_274458 ?auto_274461 ) ) ( not ( = ?auto_274458 ?auto_274462 ) ) ( not ( = ?auto_274458 ?auto_274463 ) ) ( not ( = ?auto_274458 ?auto_274464 ) ) ( not ( = ?auto_274458 ?auto_274465 ) ) ( not ( = ?auto_274458 ?auto_274466 ) ) ( not ( = ?auto_274458 ?auto_274467 ) ) ( not ( = ?auto_274458 ?auto_274468 ) ) ( not ( = ?auto_274459 ?auto_274460 ) ) ( not ( = ?auto_274459 ?auto_274461 ) ) ( not ( = ?auto_274459 ?auto_274462 ) ) ( not ( = ?auto_274459 ?auto_274463 ) ) ( not ( = ?auto_274459 ?auto_274464 ) ) ( not ( = ?auto_274459 ?auto_274465 ) ) ( not ( = ?auto_274459 ?auto_274466 ) ) ( not ( = ?auto_274459 ?auto_274467 ) ) ( not ( = ?auto_274459 ?auto_274468 ) ) ( not ( = ?auto_274460 ?auto_274461 ) ) ( not ( = ?auto_274460 ?auto_274462 ) ) ( not ( = ?auto_274460 ?auto_274463 ) ) ( not ( = ?auto_274460 ?auto_274464 ) ) ( not ( = ?auto_274460 ?auto_274465 ) ) ( not ( = ?auto_274460 ?auto_274466 ) ) ( not ( = ?auto_274460 ?auto_274467 ) ) ( not ( = ?auto_274460 ?auto_274468 ) ) ( not ( = ?auto_274461 ?auto_274462 ) ) ( not ( = ?auto_274461 ?auto_274463 ) ) ( not ( = ?auto_274461 ?auto_274464 ) ) ( not ( = ?auto_274461 ?auto_274465 ) ) ( not ( = ?auto_274461 ?auto_274466 ) ) ( not ( = ?auto_274461 ?auto_274467 ) ) ( not ( = ?auto_274461 ?auto_274468 ) ) ( not ( = ?auto_274462 ?auto_274463 ) ) ( not ( = ?auto_274462 ?auto_274464 ) ) ( not ( = ?auto_274462 ?auto_274465 ) ) ( not ( = ?auto_274462 ?auto_274466 ) ) ( not ( = ?auto_274462 ?auto_274467 ) ) ( not ( = ?auto_274462 ?auto_274468 ) ) ( not ( = ?auto_274463 ?auto_274464 ) ) ( not ( = ?auto_274463 ?auto_274465 ) ) ( not ( = ?auto_274463 ?auto_274466 ) ) ( not ( = ?auto_274463 ?auto_274467 ) ) ( not ( = ?auto_274463 ?auto_274468 ) ) ( not ( = ?auto_274464 ?auto_274465 ) ) ( not ( = ?auto_274464 ?auto_274466 ) ) ( not ( = ?auto_274464 ?auto_274467 ) ) ( not ( = ?auto_274464 ?auto_274468 ) ) ( not ( = ?auto_274465 ?auto_274466 ) ) ( not ( = ?auto_274465 ?auto_274467 ) ) ( not ( = ?auto_274465 ?auto_274468 ) ) ( not ( = ?auto_274466 ?auto_274467 ) ) ( not ( = ?auto_274466 ?auto_274468 ) ) ( not ( = ?auto_274467 ?auto_274468 ) ) ( ON ?auto_274467 ?auto_274468 ) ( ON ?auto_274466 ?auto_274467 ) ( ON ?auto_274465 ?auto_274466 ) ( CLEAR ?auto_274463 ) ( ON ?auto_274464 ?auto_274465 ) ( CLEAR ?auto_274464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_274456 ?auto_274457 ?auto_274458 ?auto_274459 ?auto_274460 ?auto_274461 ?auto_274462 ?auto_274463 ?auto_274464 )
      ( MAKE-13PILE ?auto_274456 ?auto_274457 ?auto_274458 ?auto_274459 ?auto_274460 ?auto_274461 ?auto_274462 ?auto_274463 ?auto_274464 ?auto_274465 ?auto_274466 ?auto_274467 ?auto_274468 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_274482 - BLOCK
      ?auto_274483 - BLOCK
      ?auto_274484 - BLOCK
      ?auto_274485 - BLOCK
      ?auto_274486 - BLOCK
      ?auto_274487 - BLOCK
      ?auto_274488 - BLOCK
      ?auto_274489 - BLOCK
      ?auto_274490 - BLOCK
      ?auto_274491 - BLOCK
      ?auto_274492 - BLOCK
      ?auto_274493 - BLOCK
      ?auto_274494 - BLOCK
    )
    :vars
    (
      ?auto_274495 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_274494 ?auto_274495 ) ( ON-TABLE ?auto_274482 ) ( ON ?auto_274483 ?auto_274482 ) ( ON ?auto_274484 ?auto_274483 ) ( ON ?auto_274485 ?auto_274484 ) ( ON ?auto_274486 ?auto_274485 ) ( ON ?auto_274487 ?auto_274486 ) ( ON ?auto_274488 ?auto_274487 ) ( not ( = ?auto_274482 ?auto_274483 ) ) ( not ( = ?auto_274482 ?auto_274484 ) ) ( not ( = ?auto_274482 ?auto_274485 ) ) ( not ( = ?auto_274482 ?auto_274486 ) ) ( not ( = ?auto_274482 ?auto_274487 ) ) ( not ( = ?auto_274482 ?auto_274488 ) ) ( not ( = ?auto_274482 ?auto_274489 ) ) ( not ( = ?auto_274482 ?auto_274490 ) ) ( not ( = ?auto_274482 ?auto_274491 ) ) ( not ( = ?auto_274482 ?auto_274492 ) ) ( not ( = ?auto_274482 ?auto_274493 ) ) ( not ( = ?auto_274482 ?auto_274494 ) ) ( not ( = ?auto_274482 ?auto_274495 ) ) ( not ( = ?auto_274483 ?auto_274484 ) ) ( not ( = ?auto_274483 ?auto_274485 ) ) ( not ( = ?auto_274483 ?auto_274486 ) ) ( not ( = ?auto_274483 ?auto_274487 ) ) ( not ( = ?auto_274483 ?auto_274488 ) ) ( not ( = ?auto_274483 ?auto_274489 ) ) ( not ( = ?auto_274483 ?auto_274490 ) ) ( not ( = ?auto_274483 ?auto_274491 ) ) ( not ( = ?auto_274483 ?auto_274492 ) ) ( not ( = ?auto_274483 ?auto_274493 ) ) ( not ( = ?auto_274483 ?auto_274494 ) ) ( not ( = ?auto_274483 ?auto_274495 ) ) ( not ( = ?auto_274484 ?auto_274485 ) ) ( not ( = ?auto_274484 ?auto_274486 ) ) ( not ( = ?auto_274484 ?auto_274487 ) ) ( not ( = ?auto_274484 ?auto_274488 ) ) ( not ( = ?auto_274484 ?auto_274489 ) ) ( not ( = ?auto_274484 ?auto_274490 ) ) ( not ( = ?auto_274484 ?auto_274491 ) ) ( not ( = ?auto_274484 ?auto_274492 ) ) ( not ( = ?auto_274484 ?auto_274493 ) ) ( not ( = ?auto_274484 ?auto_274494 ) ) ( not ( = ?auto_274484 ?auto_274495 ) ) ( not ( = ?auto_274485 ?auto_274486 ) ) ( not ( = ?auto_274485 ?auto_274487 ) ) ( not ( = ?auto_274485 ?auto_274488 ) ) ( not ( = ?auto_274485 ?auto_274489 ) ) ( not ( = ?auto_274485 ?auto_274490 ) ) ( not ( = ?auto_274485 ?auto_274491 ) ) ( not ( = ?auto_274485 ?auto_274492 ) ) ( not ( = ?auto_274485 ?auto_274493 ) ) ( not ( = ?auto_274485 ?auto_274494 ) ) ( not ( = ?auto_274485 ?auto_274495 ) ) ( not ( = ?auto_274486 ?auto_274487 ) ) ( not ( = ?auto_274486 ?auto_274488 ) ) ( not ( = ?auto_274486 ?auto_274489 ) ) ( not ( = ?auto_274486 ?auto_274490 ) ) ( not ( = ?auto_274486 ?auto_274491 ) ) ( not ( = ?auto_274486 ?auto_274492 ) ) ( not ( = ?auto_274486 ?auto_274493 ) ) ( not ( = ?auto_274486 ?auto_274494 ) ) ( not ( = ?auto_274486 ?auto_274495 ) ) ( not ( = ?auto_274487 ?auto_274488 ) ) ( not ( = ?auto_274487 ?auto_274489 ) ) ( not ( = ?auto_274487 ?auto_274490 ) ) ( not ( = ?auto_274487 ?auto_274491 ) ) ( not ( = ?auto_274487 ?auto_274492 ) ) ( not ( = ?auto_274487 ?auto_274493 ) ) ( not ( = ?auto_274487 ?auto_274494 ) ) ( not ( = ?auto_274487 ?auto_274495 ) ) ( not ( = ?auto_274488 ?auto_274489 ) ) ( not ( = ?auto_274488 ?auto_274490 ) ) ( not ( = ?auto_274488 ?auto_274491 ) ) ( not ( = ?auto_274488 ?auto_274492 ) ) ( not ( = ?auto_274488 ?auto_274493 ) ) ( not ( = ?auto_274488 ?auto_274494 ) ) ( not ( = ?auto_274488 ?auto_274495 ) ) ( not ( = ?auto_274489 ?auto_274490 ) ) ( not ( = ?auto_274489 ?auto_274491 ) ) ( not ( = ?auto_274489 ?auto_274492 ) ) ( not ( = ?auto_274489 ?auto_274493 ) ) ( not ( = ?auto_274489 ?auto_274494 ) ) ( not ( = ?auto_274489 ?auto_274495 ) ) ( not ( = ?auto_274490 ?auto_274491 ) ) ( not ( = ?auto_274490 ?auto_274492 ) ) ( not ( = ?auto_274490 ?auto_274493 ) ) ( not ( = ?auto_274490 ?auto_274494 ) ) ( not ( = ?auto_274490 ?auto_274495 ) ) ( not ( = ?auto_274491 ?auto_274492 ) ) ( not ( = ?auto_274491 ?auto_274493 ) ) ( not ( = ?auto_274491 ?auto_274494 ) ) ( not ( = ?auto_274491 ?auto_274495 ) ) ( not ( = ?auto_274492 ?auto_274493 ) ) ( not ( = ?auto_274492 ?auto_274494 ) ) ( not ( = ?auto_274492 ?auto_274495 ) ) ( not ( = ?auto_274493 ?auto_274494 ) ) ( not ( = ?auto_274493 ?auto_274495 ) ) ( not ( = ?auto_274494 ?auto_274495 ) ) ( ON ?auto_274493 ?auto_274494 ) ( ON ?auto_274492 ?auto_274493 ) ( ON ?auto_274491 ?auto_274492 ) ( ON ?auto_274490 ?auto_274491 ) ( CLEAR ?auto_274488 ) ( ON ?auto_274489 ?auto_274490 ) ( CLEAR ?auto_274489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_274482 ?auto_274483 ?auto_274484 ?auto_274485 ?auto_274486 ?auto_274487 ?auto_274488 ?auto_274489 )
      ( MAKE-13PILE ?auto_274482 ?auto_274483 ?auto_274484 ?auto_274485 ?auto_274486 ?auto_274487 ?auto_274488 ?auto_274489 ?auto_274490 ?auto_274491 ?auto_274492 ?auto_274493 ?auto_274494 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_274509 - BLOCK
      ?auto_274510 - BLOCK
      ?auto_274511 - BLOCK
      ?auto_274512 - BLOCK
      ?auto_274513 - BLOCK
      ?auto_274514 - BLOCK
      ?auto_274515 - BLOCK
      ?auto_274516 - BLOCK
      ?auto_274517 - BLOCK
      ?auto_274518 - BLOCK
      ?auto_274519 - BLOCK
      ?auto_274520 - BLOCK
      ?auto_274521 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_274521 ) ( ON-TABLE ?auto_274509 ) ( ON ?auto_274510 ?auto_274509 ) ( ON ?auto_274511 ?auto_274510 ) ( ON ?auto_274512 ?auto_274511 ) ( ON ?auto_274513 ?auto_274512 ) ( ON ?auto_274514 ?auto_274513 ) ( ON ?auto_274515 ?auto_274514 ) ( not ( = ?auto_274509 ?auto_274510 ) ) ( not ( = ?auto_274509 ?auto_274511 ) ) ( not ( = ?auto_274509 ?auto_274512 ) ) ( not ( = ?auto_274509 ?auto_274513 ) ) ( not ( = ?auto_274509 ?auto_274514 ) ) ( not ( = ?auto_274509 ?auto_274515 ) ) ( not ( = ?auto_274509 ?auto_274516 ) ) ( not ( = ?auto_274509 ?auto_274517 ) ) ( not ( = ?auto_274509 ?auto_274518 ) ) ( not ( = ?auto_274509 ?auto_274519 ) ) ( not ( = ?auto_274509 ?auto_274520 ) ) ( not ( = ?auto_274509 ?auto_274521 ) ) ( not ( = ?auto_274510 ?auto_274511 ) ) ( not ( = ?auto_274510 ?auto_274512 ) ) ( not ( = ?auto_274510 ?auto_274513 ) ) ( not ( = ?auto_274510 ?auto_274514 ) ) ( not ( = ?auto_274510 ?auto_274515 ) ) ( not ( = ?auto_274510 ?auto_274516 ) ) ( not ( = ?auto_274510 ?auto_274517 ) ) ( not ( = ?auto_274510 ?auto_274518 ) ) ( not ( = ?auto_274510 ?auto_274519 ) ) ( not ( = ?auto_274510 ?auto_274520 ) ) ( not ( = ?auto_274510 ?auto_274521 ) ) ( not ( = ?auto_274511 ?auto_274512 ) ) ( not ( = ?auto_274511 ?auto_274513 ) ) ( not ( = ?auto_274511 ?auto_274514 ) ) ( not ( = ?auto_274511 ?auto_274515 ) ) ( not ( = ?auto_274511 ?auto_274516 ) ) ( not ( = ?auto_274511 ?auto_274517 ) ) ( not ( = ?auto_274511 ?auto_274518 ) ) ( not ( = ?auto_274511 ?auto_274519 ) ) ( not ( = ?auto_274511 ?auto_274520 ) ) ( not ( = ?auto_274511 ?auto_274521 ) ) ( not ( = ?auto_274512 ?auto_274513 ) ) ( not ( = ?auto_274512 ?auto_274514 ) ) ( not ( = ?auto_274512 ?auto_274515 ) ) ( not ( = ?auto_274512 ?auto_274516 ) ) ( not ( = ?auto_274512 ?auto_274517 ) ) ( not ( = ?auto_274512 ?auto_274518 ) ) ( not ( = ?auto_274512 ?auto_274519 ) ) ( not ( = ?auto_274512 ?auto_274520 ) ) ( not ( = ?auto_274512 ?auto_274521 ) ) ( not ( = ?auto_274513 ?auto_274514 ) ) ( not ( = ?auto_274513 ?auto_274515 ) ) ( not ( = ?auto_274513 ?auto_274516 ) ) ( not ( = ?auto_274513 ?auto_274517 ) ) ( not ( = ?auto_274513 ?auto_274518 ) ) ( not ( = ?auto_274513 ?auto_274519 ) ) ( not ( = ?auto_274513 ?auto_274520 ) ) ( not ( = ?auto_274513 ?auto_274521 ) ) ( not ( = ?auto_274514 ?auto_274515 ) ) ( not ( = ?auto_274514 ?auto_274516 ) ) ( not ( = ?auto_274514 ?auto_274517 ) ) ( not ( = ?auto_274514 ?auto_274518 ) ) ( not ( = ?auto_274514 ?auto_274519 ) ) ( not ( = ?auto_274514 ?auto_274520 ) ) ( not ( = ?auto_274514 ?auto_274521 ) ) ( not ( = ?auto_274515 ?auto_274516 ) ) ( not ( = ?auto_274515 ?auto_274517 ) ) ( not ( = ?auto_274515 ?auto_274518 ) ) ( not ( = ?auto_274515 ?auto_274519 ) ) ( not ( = ?auto_274515 ?auto_274520 ) ) ( not ( = ?auto_274515 ?auto_274521 ) ) ( not ( = ?auto_274516 ?auto_274517 ) ) ( not ( = ?auto_274516 ?auto_274518 ) ) ( not ( = ?auto_274516 ?auto_274519 ) ) ( not ( = ?auto_274516 ?auto_274520 ) ) ( not ( = ?auto_274516 ?auto_274521 ) ) ( not ( = ?auto_274517 ?auto_274518 ) ) ( not ( = ?auto_274517 ?auto_274519 ) ) ( not ( = ?auto_274517 ?auto_274520 ) ) ( not ( = ?auto_274517 ?auto_274521 ) ) ( not ( = ?auto_274518 ?auto_274519 ) ) ( not ( = ?auto_274518 ?auto_274520 ) ) ( not ( = ?auto_274518 ?auto_274521 ) ) ( not ( = ?auto_274519 ?auto_274520 ) ) ( not ( = ?auto_274519 ?auto_274521 ) ) ( not ( = ?auto_274520 ?auto_274521 ) ) ( ON ?auto_274520 ?auto_274521 ) ( ON ?auto_274519 ?auto_274520 ) ( ON ?auto_274518 ?auto_274519 ) ( ON ?auto_274517 ?auto_274518 ) ( CLEAR ?auto_274515 ) ( ON ?auto_274516 ?auto_274517 ) ( CLEAR ?auto_274516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_274509 ?auto_274510 ?auto_274511 ?auto_274512 ?auto_274513 ?auto_274514 ?auto_274515 ?auto_274516 )
      ( MAKE-13PILE ?auto_274509 ?auto_274510 ?auto_274511 ?auto_274512 ?auto_274513 ?auto_274514 ?auto_274515 ?auto_274516 ?auto_274517 ?auto_274518 ?auto_274519 ?auto_274520 ?auto_274521 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_274535 - BLOCK
      ?auto_274536 - BLOCK
      ?auto_274537 - BLOCK
      ?auto_274538 - BLOCK
      ?auto_274539 - BLOCK
      ?auto_274540 - BLOCK
      ?auto_274541 - BLOCK
      ?auto_274542 - BLOCK
      ?auto_274543 - BLOCK
      ?auto_274544 - BLOCK
      ?auto_274545 - BLOCK
      ?auto_274546 - BLOCK
      ?auto_274547 - BLOCK
    )
    :vars
    (
      ?auto_274548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_274547 ?auto_274548 ) ( ON-TABLE ?auto_274535 ) ( ON ?auto_274536 ?auto_274535 ) ( ON ?auto_274537 ?auto_274536 ) ( ON ?auto_274538 ?auto_274537 ) ( ON ?auto_274539 ?auto_274538 ) ( ON ?auto_274540 ?auto_274539 ) ( not ( = ?auto_274535 ?auto_274536 ) ) ( not ( = ?auto_274535 ?auto_274537 ) ) ( not ( = ?auto_274535 ?auto_274538 ) ) ( not ( = ?auto_274535 ?auto_274539 ) ) ( not ( = ?auto_274535 ?auto_274540 ) ) ( not ( = ?auto_274535 ?auto_274541 ) ) ( not ( = ?auto_274535 ?auto_274542 ) ) ( not ( = ?auto_274535 ?auto_274543 ) ) ( not ( = ?auto_274535 ?auto_274544 ) ) ( not ( = ?auto_274535 ?auto_274545 ) ) ( not ( = ?auto_274535 ?auto_274546 ) ) ( not ( = ?auto_274535 ?auto_274547 ) ) ( not ( = ?auto_274535 ?auto_274548 ) ) ( not ( = ?auto_274536 ?auto_274537 ) ) ( not ( = ?auto_274536 ?auto_274538 ) ) ( not ( = ?auto_274536 ?auto_274539 ) ) ( not ( = ?auto_274536 ?auto_274540 ) ) ( not ( = ?auto_274536 ?auto_274541 ) ) ( not ( = ?auto_274536 ?auto_274542 ) ) ( not ( = ?auto_274536 ?auto_274543 ) ) ( not ( = ?auto_274536 ?auto_274544 ) ) ( not ( = ?auto_274536 ?auto_274545 ) ) ( not ( = ?auto_274536 ?auto_274546 ) ) ( not ( = ?auto_274536 ?auto_274547 ) ) ( not ( = ?auto_274536 ?auto_274548 ) ) ( not ( = ?auto_274537 ?auto_274538 ) ) ( not ( = ?auto_274537 ?auto_274539 ) ) ( not ( = ?auto_274537 ?auto_274540 ) ) ( not ( = ?auto_274537 ?auto_274541 ) ) ( not ( = ?auto_274537 ?auto_274542 ) ) ( not ( = ?auto_274537 ?auto_274543 ) ) ( not ( = ?auto_274537 ?auto_274544 ) ) ( not ( = ?auto_274537 ?auto_274545 ) ) ( not ( = ?auto_274537 ?auto_274546 ) ) ( not ( = ?auto_274537 ?auto_274547 ) ) ( not ( = ?auto_274537 ?auto_274548 ) ) ( not ( = ?auto_274538 ?auto_274539 ) ) ( not ( = ?auto_274538 ?auto_274540 ) ) ( not ( = ?auto_274538 ?auto_274541 ) ) ( not ( = ?auto_274538 ?auto_274542 ) ) ( not ( = ?auto_274538 ?auto_274543 ) ) ( not ( = ?auto_274538 ?auto_274544 ) ) ( not ( = ?auto_274538 ?auto_274545 ) ) ( not ( = ?auto_274538 ?auto_274546 ) ) ( not ( = ?auto_274538 ?auto_274547 ) ) ( not ( = ?auto_274538 ?auto_274548 ) ) ( not ( = ?auto_274539 ?auto_274540 ) ) ( not ( = ?auto_274539 ?auto_274541 ) ) ( not ( = ?auto_274539 ?auto_274542 ) ) ( not ( = ?auto_274539 ?auto_274543 ) ) ( not ( = ?auto_274539 ?auto_274544 ) ) ( not ( = ?auto_274539 ?auto_274545 ) ) ( not ( = ?auto_274539 ?auto_274546 ) ) ( not ( = ?auto_274539 ?auto_274547 ) ) ( not ( = ?auto_274539 ?auto_274548 ) ) ( not ( = ?auto_274540 ?auto_274541 ) ) ( not ( = ?auto_274540 ?auto_274542 ) ) ( not ( = ?auto_274540 ?auto_274543 ) ) ( not ( = ?auto_274540 ?auto_274544 ) ) ( not ( = ?auto_274540 ?auto_274545 ) ) ( not ( = ?auto_274540 ?auto_274546 ) ) ( not ( = ?auto_274540 ?auto_274547 ) ) ( not ( = ?auto_274540 ?auto_274548 ) ) ( not ( = ?auto_274541 ?auto_274542 ) ) ( not ( = ?auto_274541 ?auto_274543 ) ) ( not ( = ?auto_274541 ?auto_274544 ) ) ( not ( = ?auto_274541 ?auto_274545 ) ) ( not ( = ?auto_274541 ?auto_274546 ) ) ( not ( = ?auto_274541 ?auto_274547 ) ) ( not ( = ?auto_274541 ?auto_274548 ) ) ( not ( = ?auto_274542 ?auto_274543 ) ) ( not ( = ?auto_274542 ?auto_274544 ) ) ( not ( = ?auto_274542 ?auto_274545 ) ) ( not ( = ?auto_274542 ?auto_274546 ) ) ( not ( = ?auto_274542 ?auto_274547 ) ) ( not ( = ?auto_274542 ?auto_274548 ) ) ( not ( = ?auto_274543 ?auto_274544 ) ) ( not ( = ?auto_274543 ?auto_274545 ) ) ( not ( = ?auto_274543 ?auto_274546 ) ) ( not ( = ?auto_274543 ?auto_274547 ) ) ( not ( = ?auto_274543 ?auto_274548 ) ) ( not ( = ?auto_274544 ?auto_274545 ) ) ( not ( = ?auto_274544 ?auto_274546 ) ) ( not ( = ?auto_274544 ?auto_274547 ) ) ( not ( = ?auto_274544 ?auto_274548 ) ) ( not ( = ?auto_274545 ?auto_274546 ) ) ( not ( = ?auto_274545 ?auto_274547 ) ) ( not ( = ?auto_274545 ?auto_274548 ) ) ( not ( = ?auto_274546 ?auto_274547 ) ) ( not ( = ?auto_274546 ?auto_274548 ) ) ( not ( = ?auto_274547 ?auto_274548 ) ) ( ON ?auto_274546 ?auto_274547 ) ( ON ?auto_274545 ?auto_274546 ) ( ON ?auto_274544 ?auto_274545 ) ( ON ?auto_274543 ?auto_274544 ) ( ON ?auto_274542 ?auto_274543 ) ( CLEAR ?auto_274540 ) ( ON ?auto_274541 ?auto_274542 ) ( CLEAR ?auto_274541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_274535 ?auto_274536 ?auto_274537 ?auto_274538 ?auto_274539 ?auto_274540 ?auto_274541 )
      ( MAKE-13PILE ?auto_274535 ?auto_274536 ?auto_274537 ?auto_274538 ?auto_274539 ?auto_274540 ?auto_274541 ?auto_274542 ?auto_274543 ?auto_274544 ?auto_274545 ?auto_274546 ?auto_274547 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_274562 - BLOCK
      ?auto_274563 - BLOCK
      ?auto_274564 - BLOCK
      ?auto_274565 - BLOCK
      ?auto_274566 - BLOCK
      ?auto_274567 - BLOCK
      ?auto_274568 - BLOCK
      ?auto_274569 - BLOCK
      ?auto_274570 - BLOCK
      ?auto_274571 - BLOCK
      ?auto_274572 - BLOCK
      ?auto_274573 - BLOCK
      ?auto_274574 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_274574 ) ( ON-TABLE ?auto_274562 ) ( ON ?auto_274563 ?auto_274562 ) ( ON ?auto_274564 ?auto_274563 ) ( ON ?auto_274565 ?auto_274564 ) ( ON ?auto_274566 ?auto_274565 ) ( ON ?auto_274567 ?auto_274566 ) ( not ( = ?auto_274562 ?auto_274563 ) ) ( not ( = ?auto_274562 ?auto_274564 ) ) ( not ( = ?auto_274562 ?auto_274565 ) ) ( not ( = ?auto_274562 ?auto_274566 ) ) ( not ( = ?auto_274562 ?auto_274567 ) ) ( not ( = ?auto_274562 ?auto_274568 ) ) ( not ( = ?auto_274562 ?auto_274569 ) ) ( not ( = ?auto_274562 ?auto_274570 ) ) ( not ( = ?auto_274562 ?auto_274571 ) ) ( not ( = ?auto_274562 ?auto_274572 ) ) ( not ( = ?auto_274562 ?auto_274573 ) ) ( not ( = ?auto_274562 ?auto_274574 ) ) ( not ( = ?auto_274563 ?auto_274564 ) ) ( not ( = ?auto_274563 ?auto_274565 ) ) ( not ( = ?auto_274563 ?auto_274566 ) ) ( not ( = ?auto_274563 ?auto_274567 ) ) ( not ( = ?auto_274563 ?auto_274568 ) ) ( not ( = ?auto_274563 ?auto_274569 ) ) ( not ( = ?auto_274563 ?auto_274570 ) ) ( not ( = ?auto_274563 ?auto_274571 ) ) ( not ( = ?auto_274563 ?auto_274572 ) ) ( not ( = ?auto_274563 ?auto_274573 ) ) ( not ( = ?auto_274563 ?auto_274574 ) ) ( not ( = ?auto_274564 ?auto_274565 ) ) ( not ( = ?auto_274564 ?auto_274566 ) ) ( not ( = ?auto_274564 ?auto_274567 ) ) ( not ( = ?auto_274564 ?auto_274568 ) ) ( not ( = ?auto_274564 ?auto_274569 ) ) ( not ( = ?auto_274564 ?auto_274570 ) ) ( not ( = ?auto_274564 ?auto_274571 ) ) ( not ( = ?auto_274564 ?auto_274572 ) ) ( not ( = ?auto_274564 ?auto_274573 ) ) ( not ( = ?auto_274564 ?auto_274574 ) ) ( not ( = ?auto_274565 ?auto_274566 ) ) ( not ( = ?auto_274565 ?auto_274567 ) ) ( not ( = ?auto_274565 ?auto_274568 ) ) ( not ( = ?auto_274565 ?auto_274569 ) ) ( not ( = ?auto_274565 ?auto_274570 ) ) ( not ( = ?auto_274565 ?auto_274571 ) ) ( not ( = ?auto_274565 ?auto_274572 ) ) ( not ( = ?auto_274565 ?auto_274573 ) ) ( not ( = ?auto_274565 ?auto_274574 ) ) ( not ( = ?auto_274566 ?auto_274567 ) ) ( not ( = ?auto_274566 ?auto_274568 ) ) ( not ( = ?auto_274566 ?auto_274569 ) ) ( not ( = ?auto_274566 ?auto_274570 ) ) ( not ( = ?auto_274566 ?auto_274571 ) ) ( not ( = ?auto_274566 ?auto_274572 ) ) ( not ( = ?auto_274566 ?auto_274573 ) ) ( not ( = ?auto_274566 ?auto_274574 ) ) ( not ( = ?auto_274567 ?auto_274568 ) ) ( not ( = ?auto_274567 ?auto_274569 ) ) ( not ( = ?auto_274567 ?auto_274570 ) ) ( not ( = ?auto_274567 ?auto_274571 ) ) ( not ( = ?auto_274567 ?auto_274572 ) ) ( not ( = ?auto_274567 ?auto_274573 ) ) ( not ( = ?auto_274567 ?auto_274574 ) ) ( not ( = ?auto_274568 ?auto_274569 ) ) ( not ( = ?auto_274568 ?auto_274570 ) ) ( not ( = ?auto_274568 ?auto_274571 ) ) ( not ( = ?auto_274568 ?auto_274572 ) ) ( not ( = ?auto_274568 ?auto_274573 ) ) ( not ( = ?auto_274568 ?auto_274574 ) ) ( not ( = ?auto_274569 ?auto_274570 ) ) ( not ( = ?auto_274569 ?auto_274571 ) ) ( not ( = ?auto_274569 ?auto_274572 ) ) ( not ( = ?auto_274569 ?auto_274573 ) ) ( not ( = ?auto_274569 ?auto_274574 ) ) ( not ( = ?auto_274570 ?auto_274571 ) ) ( not ( = ?auto_274570 ?auto_274572 ) ) ( not ( = ?auto_274570 ?auto_274573 ) ) ( not ( = ?auto_274570 ?auto_274574 ) ) ( not ( = ?auto_274571 ?auto_274572 ) ) ( not ( = ?auto_274571 ?auto_274573 ) ) ( not ( = ?auto_274571 ?auto_274574 ) ) ( not ( = ?auto_274572 ?auto_274573 ) ) ( not ( = ?auto_274572 ?auto_274574 ) ) ( not ( = ?auto_274573 ?auto_274574 ) ) ( ON ?auto_274573 ?auto_274574 ) ( ON ?auto_274572 ?auto_274573 ) ( ON ?auto_274571 ?auto_274572 ) ( ON ?auto_274570 ?auto_274571 ) ( ON ?auto_274569 ?auto_274570 ) ( CLEAR ?auto_274567 ) ( ON ?auto_274568 ?auto_274569 ) ( CLEAR ?auto_274568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_274562 ?auto_274563 ?auto_274564 ?auto_274565 ?auto_274566 ?auto_274567 ?auto_274568 )
      ( MAKE-13PILE ?auto_274562 ?auto_274563 ?auto_274564 ?auto_274565 ?auto_274566 ?auto_274567 ?auto_274568 ?auto_274569 ?auto_274570 ?auto_274571 ?auto_274572 ?auto_274573 ?auto_274574 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_274588 - BLOCK
      ?auto_274589 - BLOCK
      ?auto_274590 - BLOCK
      ?auto_274591 - BLOCK
      ?auto_274592 - BLOCK
      ?auto_274593 - BLOCK
      ?auto_274594 - BLOCK
      ?auto_274595 - BLOCK
      ?auto_274596 - BLOCK
      ?auto_274597 - BLOCK
      ?auto_274598 - BLOCK
      ?auto_274599 - BLOCK
      ?auto_274600 - BLOCK
    )
    :vars
    (
      ?auto_274601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_274600 ?auto_274601 ) ( ON-TABLE ?auto_274588 ) ( ON ?auto_274589 ?auto_274588 ) ( ON ?auto_274590 ?auto_274589 ) ( ON ?auto_274591 ?auto_274590 ) ( ON ?auto_274592 ?auto_274591 ) ( not ( = ?auto_274588 ?auto_274589 ) ) ( not ( = ?auto_274588 ?auto_274590 ) ) ( not ( = ?auto_274588 ?auto_274591 ) ) ( not ( = ?auto_274588 ?auto_274592 ) ) ( not ( = ?auto_274588 ?auto_274593 ) ) ( not ( = ?auto_274588 ?auto_274594 ) ) ( not ( = ?auto_274588 ?auto_274595 ) ) ( not ( = ?auto_274588 ?auto_274596 ) ) ( not ( = ?auto_274588 ?auto_274597 ) ) ( not ( = ?auto_274588 ?auto_274598 ) ) ( not ( = ?auto_274588 ?auto_274599 ) ) ( not ( = ?auto_274588 ?auto_274600 ) ) ( not ( = ?auto_274588 ?auto_274601 ) ) ( not ( = ?auto_274589 ?auto_274590 ) ) ( not ( = ?auto_274589 ?auto_274591 ) ) ( not ( = ?auto_274589 ?auto_274592 ) ) ( not ( = ?auto_274589 ?auto_274593 ) ) ( not ( = ?auto_274589 ?auto_274594 ) ) ( not ( = ?auto_274589 ?auto_274595 ) ) ( not ( = ?auto_274589 ?auto_274596 ) ) ( not ( = ?auto_274589 ?auto_274597 ) ) ( not ( = ?auto_274589 ?auto_274598 ) ) ( not ( = ?auto_274589 ?auto_274599 ) ) ( not ( = ?auto_274589 ?auto_274600 ) ) ( not ( = ?auto_274589 ?auto_274601 ) ) ( not ( = ?auto_274590 ?auto_274591 ) ) ( not ( = ?auto_274590 ?auto_274592 ) ) ( not ( = ?auto_274590 ?auto_274593 ) ) ( not ( = ?auto_274590 ?auto_274594 ) ) ( not ( = ?auto_274590 ?auto_274595 ) ) ( not ( = ?auto_274590 ?auto_274596 ) ) ( not ( = ?auto_274590 ?auto_274597 ) ) ( not ( = ?auto_274590 ?auto_274598 ) ) ( not ( = ?auto_274590 ?auto_274599 ) ) ( not ( = ?auto_274590 ?auto_274600 ) ) ( not ( = ?auto_274590 ?auto_274601 ) ) ( not ( = ?auto_274591 ?auto_274592 ) ) ( not ( = ?auto_274591 ?auto_274593 ) ) ( not ( = ?auto_274591 ?auto_274594 ) ) ( not ( = ?auto_274591 ?auto_274595 ) ) ( not ( = ?auto_274591 ?auto_274596 ) ) ( not ( = ?auto_274591 ?auto_274597 ) ) ( not ( = ?auto_274591 ?auto_274598 ) ) ( not ( = ?auto_274591 ?auto_274599 ) ) ( not ( = ?auto_274591 ?auto_274600 ) ) ( not ( = ?auto_274591 ?auto_274601 ) ) ( not ( = ?auto_274592 ?auto_274593 ) ) ( not ( = ?auto_274592 ?auto_274594 ) ) ( not ( = ?auto_274592 ?auto_274595 ) ) ( not ( = ?auto_274592 ?auto_274596 ) ) ( not ( = ?auto_274592 ?auto_274597 ) ) ( not ( = ?auto_274592 ?auto_274598 ) ) ( not ( = ?auto_274592 ?auto_274599 ) ) ( not ( = ?auto_274592 ?auto_274600 ) ) ( not ( = ?auto_274592 ?auto_274601 ) ) ( not ( = ?auto_274593 ?auto_274594 ) ) ( not ( = ?auto_274593 ?auto_274595 ) ) ( not ( = ?auto_274593 ?auto_274596 ) ) ( not ( = ?auto_274593 ?auto_274597 ) ) ( not ( = ?auto_274593 ?auto_274598 ) ) ( not ( = ?auto_274593 ?auto_274599 ) ) ( not ( = ?auto_274593 ?auto_274600 ) ) ( not ( = ?auto_274593 ?auto_274601 ) ) ( not ( = ?auto_274594 ?auto_274595 ) ) ( not ( = ?auto_274594 ?auto_274596 ) ) ( not ( = ?auto_274594 ?auto_274597 ) ) ( not ( = ?auto_274594 ?auto_274598 ) ) ( not ( = ?auto_274594 ?auto_274599 ) ) ( not ( = ?auto_274594 ?auto_274600 ) ) ( not ( = ?auto_274594 ?auto_274601 ) ) ( not ( = ?auto_274595 ?auto_274596 ) ) ( not ( = ?auto_274595 ?auto_274597 ) ) ( not ( = ?auto_274595 ?auto_274598 ) ) ( not ( = ?auto_274595 ?auto_274599 ) ) ( not ( = ?auto_274595 ?auto_274600 ) ) ( not ( = ?auto_274595 ?auto_274601 ) ) ( not ( = ?auto_274596 ?auto_274597 ) ) ( not ( = ?auto_274596 ?auto_274598 ) ) ( not ( = ?auto_274596 ?auto_274599 ) ) ( not ( = ?auto_274596 ?auto_274600 ) ) ( not ( = ?auto_274596 ?auto_274601 ) ) ( not ( = ?auto_274597 ?auto_274598 ) ) ( not ( = ?auto_274597 ?auto_274599 ) ) ( not ( = ?auto_274597 ?auto_274600 ) ) ( not ( = ?auto_274597 ?auto_274601 ) ) ( not ( = ?auto_274598 ?auto_274599 ) ) ( not ( = ?auto_274598 ?auto_274600 ) ) ( not ( = ?auto_274598 ?auto_274601 ) ) ( not ( = ?auto_274599 ?auto_274600 ) ) ( not ( = ?auto_274599 ?auto_274601 ) ) ( not ( = ?auto_274600 ?auto_274601 ) ) ( ON ?auto_274599 ?auto_274600 ) ( ON ?auto_274598 ?auto_274599 ) ( ON ?auto_274597 ?auto_274598 ) ( ON ?auto_274596 ?auto_274597 ) ( ON ?auto_274595 ?auto_274596 ) ( ON ?auto_274594 ?auto_274595 ) ( CLEAR ?auto_274592 ) ( ON ?auto_274593 ?auto_274594 ) ( CLEAR ?auto_274593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_274588 ?auto_274589 ?auto_274590 ?auto_274591 ?auto_274592 ?auto_274593 )
      ( MAKE-13PILE ?auto_274588 ?auto_274589 ?auto_274590 ?auto_274591 ?auto_274592 ?auto_274593 ?auto_274594 ?auto_274595 ?auto_274596 ?auto_274597 ?auto_274598 ?auto_274599 ?auto_274600 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_274615 - BLOCK
      ?auto_274616 - BLOCK
      ?auto_274617 - BLOCK
      ?auto_274618 - BLOCK
      ?auto_274619 - BLOCK
      ?auto_274620 - BLOCK
      ?auto_274621 - BLOCK
      ?auto_274622 - BLOCK
      ?auto_274623 - BLOCK
      ?auto_274624 - BLOCK
      ?auto_274625 - BLOCK
      ?auto_274626 - BLOCK
      ?auto_274627 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_274627 ) ( ON-TABLE ?auto_274615 ) ( ON ?auto_274616 ?auto_274615 ) ( ON ?auto_274617 ?auto_274616 ) ( ON ?auto_274618 ?auto_274617 ) ( ON ?auto_274619 ?auto_274618 ) ( not ( = ?auto_274615 ?auto_274616 ) ) ( not ( = ?auto_274615 ?auto_274617 ) ) ( not ( = ?auto_274615 ?auto_274618 ) ) ( not ( = ?auto_274615 ?auto_274619 ) ) ( not ( = ?auto_274615 ?auto_274620 ) ) ( not ( = ?auto_274615 ?auto_274621 ) ) ( not ( = ?auto_274615 ?auto_274622 ) ) ( not ( = ?auto_274615 ?auto_274623 ) ) ( not ( = ?auto_274615 ?auto_274624 ) ) ( not ( = ?auto_274615 ?auto_274625 ) ) ( not ( = ?auto_274615 ?auto_274626 ) ) ( not ( = ?auto_274615 ?auto_274627 ) ) ( not ( = ?auto_274616 ?auto_274617 ) ) ( not ( = ?auto_274616 ?auto_274618 ) ) ( not ( = ?auto_274616 ?auto_274619 ) ) ( not ( = ?auto_274616 ?auto_274620 ) ) ( not ( = ?auto_274616 ?auto_274621 ) ) ( not ( = ?auto_274616 ?auto_274622 ) ) ( not ( = ?auto_274616 ?auto_274623 ) ) ( not ( = ?auto_274616 ?auto_274624 ) ) ( not ( = ?auto_274616 ?auto_274625 ) ) ( not ( = ?auto_274616 ?auto_274626 ) ) ( not ( = ?auto_274616 ?auto_274627 ) ) ( not ( = ?auto_274617 ?auto_274618 ) ) ( not ( = ?auto_274617 ?auto_274619 ) ) ( not ( = ?auto_274617 ?auto_274620 ) ) ( not ( = ?auto_274617 ?auto_274621 ) ) ( not ( = ?auto_274617 ?auto_274622 ) ) ( not ( = ?auto_274617 ?auto_274623 ) ) ( not ( = ?auto_274617 ?auto_274624 ) ) ( not ( = ?auto_274617 ?auto_274625 ) ) ( not ( = ?auto_274617 ?auto_274626 ) ) ( not ( = ?auto_274617 ?auto_274627 ) ) ( not ( = ?auto_274618 ?auto_274619 ) ) ( not ( = ?auto_274618 ?auto_274620 ) ) ( not ( = ?auto_274618 ?auto_274621 ) ) ( not ( = ?auto_274618 ?auto_274622 ) ) ( not ( = ?auto_274618 ?auto_274623 ) ) ( not ( = ?auto_274618 ?auto_274624 ) ) ( not ( = ?auto_274618 ?auto_274625 ) ) ( not ( = ?auto_274618 ?auto_274626 ) ) ( not ( = ?auto_274618 ?auto_274627 ) ) ( not ( = ?auto_274619 ?auto_274620 ) ) ( not ( = ?auto_274619 ?auto_274621 ) ) ( not ( = ?auto_274619 ?auto_274622 ) ) ( not ( = ?auto_274619 ?auto_274623 ) ) ( not ( = ?auto_274619 ?auto_274624 ) ) ( not ( = ?auto_274619 ?auto_274625 ) ) ( not ( = ?auto_274619 ?auto_274626 ) ) ( not ( = ?auto_274619 ?auto_274627 ) ) ( not ( = ?auto_274620 ?auto_274621 ) ) ( not ( = ?auto_274620 ?auto_274622 ) ) ( not ( = ?auto_274620 ?auto_274623 ) ) ( not ( = ?auto_274620 ?auto_274624 ) ) ( not ( = ?auto_274620 ?auto_274625 ) ) ( not ( = ?auto_274620 ?auto_274626 ) ) ( not ( = ?auto_274620 ?auto_274627 ) ) ( not ( = ?auto_274621 ?auto_274622 ) ) ( not ( = ?auto_274621 ?auto_274623 ) ) ( not ( = ?auto_274621 ?auto_274624 ) ) ( not ( = ?auto_274621 ?auto_274625 ) ) ( not ( = ?auto_274621 ?auto_274626 ) ) ( not ( = ?auto_274621 ?auto_274627 ) ) ( not ( = ?auto_274622 ?auto_274623 ) ) ( not ( = ?auto_274622 ?auto_274624 ) ) ( not ( = ?auto_274622 ?auto_274625 ) ) ( not ( = ?auto_274622 ?auto_274626 ) ) ( not ( = ?auto_274622 ?auto_274627 ) ) ( not ( = ?auto_274623 ?auto_274624 ) ) ( not ( = ?auto_274623 ?auto_274625 ) ) ( not ( = ?auto_274623 ?auto_274626 ) ) ( not ( = ?auto_274623 ?auto_274627 ) ) ( not ( = ?auto_274624 ?auto_274625 ) ) ( not ( = ?auto_274624 ?auto_274626 ) ) ( not ( = ?auto_274624 ?auto_274627 ) ) ( not ( = ?auto_274625 ?auto_274626 ) ) ( not ( = ?auto_274625 ?auto_274627 ) ) ( not ( = ?auto_274626 ?auto_274627 ) ) ( ON ?auto_274626 ?auto_274627 ) ( ON ?auto_274625 ?auto_274626 ) ( ON ?auto_274624 ?auto_274625 ) ( ON ?auto_274623 ?auto_274624 ) ( ON ?auto_274622 ?auto_274623 ) ( ON ?auto_274621 ?auto_274622 ) ( CLEAR ?auto_274619 ) ( ON ?auto_274620 ?auto_274621 ) ( CLEAR ?auto_274620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_274615 ?auto_274616 ?auto_274617 ?auto_274618 ?auto_274619 ?auto_274620 )
      ( MAKE-13PILE ?auto_274615 ?auto_274616 ?auto_274617 ?auto_274618 ?auto_274619 ?auto_274620 ?auto_274621 ?auto_274622 ?auto_274623 ?auto_274624 ?auto_274625 ?auto_274626 ?auto_274627 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_274641 - BLOCK
      ?auto_274642 - BLOCK
      ?auto_274643 - BLOCK
      ?auto_274644 - BLOCK
      ?auto_274645 - BLOCK
      ?auto_274646 - BLOCK
      ?auto_274647 - BLOCK
      ?auto_274648 - BLOCK
      ?auto_274649 - BLOCK
      ?auto_274650 - BLOCK
      ?auto_274651 - BLOCK
      ?auto_274652 - BLOCK
      ?auto_274653 - BLOCK
    )
    :vars
    (
      ?auto_274654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_274653 ?auto_274654 ) ( ON-TABLE ?auto_274641 ) ( ON ?auto_274642 ?auto_274641 ) ( ON ?auto_274643 ?auto_274642 ) ( ON ?auto_274644 ?auto_274643 ) ( not ( = ?auto_274641 ?auto_274642 ) ) ( not ( = ?auto_274641 ?auto_274643 ) ) ( not ( = ?auto_274641 ?auto_274644 ) ) ( not ( = ?auto_274641 ?auto_274645 ) ) ( not ( = ?auto_274641 ?auto_274646 ) ) ( not ( = ?auto_274641 ?auto_274647 ) ) ( not ( = ?auto_274641 ?auto_274648 ) ) ( not ( = ?auto_274641 ?auto_274649 ) ) ( not ( = ?auto_274641 ?auto_274650 ) ) ( not ( = ?auto_274641 ?auto_274651 ) ) ( not ( = ?auto_274641 ?auto_274652 ) ) ( not ( = ?auto_274641 ?auto_274653 ) ) ( not ( = ?auto_274641 ?auto_274654 ) ) ( not ( = ?auto_274642 ?auto_274643 ) ) ( not ( = ?auto_274642 ?auto_274644 ) ) ( not ( = ?auto_274642 ?auto_274645 ) ) ( not ( = ?auto_274642 ?auto_274646 ) ) ( not ( = ?auto_274642 ?auto_274647 ) ) ( not ( = ?auto_274642 ?auto_274648 ) ) ( not ( = ?auto_274642 ?auto_274649 ) ) ( not ( = ?auto_274642 ?auto_274650 ) ) ( not ( = ?auto_274642 ?auto_274651 ) ) ( not ( = ?auto_274642 ?auto_274652 ) ) ( not ( = ?auto_274642 ?auto_274653 ) ) ( not ( = ?auto_274642 ?auto_274654 ) ) ( not ( = ?auto_274643 ?auto_274644 ) ) ( not ( = ?auto_274643 ?auto_274645 ) ) ( not ( = ?auto_274643 ?auto_274646 ) ) ( not ( = ?auto_274643 ?auto_274647 ) ) ( not ( = ?auto_274643 ?auto_274648 ) ) ( not ( = ?auto_274643 ?auto_274649 ) ) ( not ( = ?auto_274643 ?auto_274650 ) ) ( not ( = ?auto_274643 ?auto_274651 ) ) ( not ( = ?auto_274643 ?auto_274652 ) ) ( not ( = ?auto_274643 ?auto_274653 ) ) ( not ( = ?auto_274643 ?auto_274654 ) ) ( not ( = ?auto_274644 ?auto_274645 ) ) ( not ( = ?auto_274644 ?auto_274646 ) ) ( not ( = ?auto_274644 ?auto_274647 ) ) ( not ( = ?auto_274644 ?auto_274648 ) ) ( not ( = ?auto_274644 ?auto_274649 ) ) ( not ( = ?auto_274644 ?auto_274650 ) ) ( not ( = ?auto_274644 ?auto_274651 ) ) ( not ( = ?auto_274644 ?auto_274652 ) ) ( not ( = ?auto_274644 ?auto_274653 ) ) ( not ( = ?auto_274644 ?auto_274654 ) ) ( not ( = ?auto_274645 ?auto_274646 ) ) ( not ( = ?auto_274645 ?auto_274647 ) ) ( not ( = ?auto_274645 ?auto_274648 ) ) ( not ( = ?auto_274645 ?auto_274649 ) ) ( not ( = ?auto_274645 ?auto_274650 ) ) ( not ( = ?auto_274645 ?auto_274651 ) ) ( not ( = ?auto_274645 ?auto_274652 ) ) ( not ( = ?auto_274645 ?auto_274653 ) ) ( not ( = ?auto_274645 ?auto_274654 ) ) ( not ( = ?auto_274646 ?auto_274647 ) ) ( not ( = ?auto_274646 ?auto_274648 ) ) ( not ( = ?auto_274646 ?auto_274649 ) ) ( not ( = ?auto_274646 ?auto_274650 ) ) ( not ( = ?auto_274646 ?auto_274651 ) ) ( not ( = ?auto_274646 ?auto_274652 ) ) ( not ( = ?auto_274646 ?auto_274653 ) ) ( not ( = ?auto_274646 ?auto_274654 ) ) ( not ( = ?auto_274647 ?auto_274648 ) ) ( not ( = ?auto_274647 ?auto_274649 ) ) ( not ( = ?auto_274647 ?auto_274650 ) ) ( not ( = ?auto_274647 ?auto_274651 ) ) ( not ( = ?auto_274647 ?auto_274652 ) ) ( not ( = ?auto_274647 ?auto_274653 ) ) ( not ( = ?auto_274647 ?auto_274654 ) ) ( not ( = ?auto_274648 ?auto_274649 ) ) ( not ( = ?auto_274648 ?auto_274650 ) ) ( not ( = ?auto_274648 ?auto_274651 ) ) ( not ( = ?auto_274648 ?auto_274652 ) ) ( not ( = ?auto_274648 ?auto_274653 ) ) ( not ( = ?auto_274648 ?auto_274654 ) ) ( not ( = ?auto_274649 ?auto_274650 ) ) ( not ( = ?auto_274649 ?auto_274651 ) ) ( not ( = ?auto_274649 ?auto_274652 ) ) ( not ( = ?auto_274649 ?auto_274653 ) ) ( not ( = ?auto_274649 ?auto_274654 ) ) ( not ( = ?auto_274650 ?auto_274651 ) ) ( not ( = ?auto_274650 ?auto_274652 ) ) ( not ( = ?auto_274650 ?auto_274653 ) ) ( not ( = ?auto_274650 ?auto_274654 ) ) ( not ( = ?auto_274651 ?auto_274652 ) ) ( not ( = ?auto_274651 ?auto_274653 ) ) ( not ( = ?auto_274651 ?auto_274654 ) ) ( not ( = ?auto_274652 ?auto_274653 ) ) ( not ( = ?auto_274652 ?auto_274654 ) ) ( not ( = ?auto_274653 ?auto_274654 ) ) ( ON ?auto_274652 ?auto_274653 ) ( ON ?auto_274651 ?auto_274652 ) ( ON ?auto_274650 ?auto_274651 ) ( ON ?auto_274649 ?auto_274650 ) ( ON ?auto_274648 ?auto_274649 ) ( ON ?auto_274647 ?auto_274648 ) ( ON ?auto_274646 ?auto_274647 ) ( CLEAR ?auto_274644 ) ( ON ?auto_274645 ?auto_274646 ) ( CLEAR ?auto_274645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_274641 ?auto_274642 ?auto_274643 ?auto_274644 ?auto_274645 )
      ( MAKE-13PILE ?auto_274641 ?auto_274642 ?auto_274643 ?auto_274644 ?auto_274645 ?auto_274646 ?auto_274647 ?auto_274648 ?auto_274649 ?auto_274650 ?auto_274651 ?auto_274652 ?auto_274653 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_274668 - BLOCK
      ?auto_274669 - BLOCK
      ?auto_274670 - BLOCK
      ?auto_274671 - BLOCK
      ?auto_274672 - BLOCK
      ?auto_274673 - BLOCK
      ?auto_274674 - BLOCK
      ?auto_274675 - BLOCK
      ?auto_274676 - BLOCK
      ?auto_274677 - BLOCK
      ?auto_274678 - BLOCK
      ?auto_274679 - BLOCK
      ?auto_274680 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_274680 ) ( ON-TABLE ?auto_274668 ) ( ON ?auto_274669 ?auto_274668 ) ( ON ?auto_274670 ?auto_274669 ) ( ON ?auto_274671 ?auto_274670 ) ( not ( = ?auto_274668 ?auto_274669 ) ) ( not ( = ?auto_274668 ?auto_274670 ) ) ( not ( = ?auto_274668 ?auto_274671 ) ) ( not ( = ?auto_274668 ?auto_274672 ) ) ( not ( = ?auto_274668 ?auto_274673 ) ) ( not ( = ?auto_274668 ?auto_274674 ) ) ( not ( = ?auto_274668 ?auto_274675 ) ) ( not ( = ?auto_274668 ?auto_274676 ) ) ( not ( = ?auto_274668 ?auto_274677 ) ) ( not ( = ?auto_274668 ?auto_274678 ) ) ( not ( = ?auto_274668 ?auto_274679 ) ) ( not ( = ?auto_274668 ?auto_274680 ) ) ( not ( = ?auto_274669 ?auto_274670 ) ) ( not ( = ?auto_274669 ?auto_274671 ) ) ( not ( = ?auto_274669 ?auto_274672 ) ) ( not ( = ?auto_274669 ?auto_274673 ) ) ( not ( = ?auto_274669 ?auto_274674 ) ) ( not ( = ?auto_274669 ?auto_274675 ) ) ( not ( = ?auto_274669 ?auto_274676 ) ) ( not ( = ?auto_274669 ?auto_274677 ) ) ( not ( = ?auto_274669 ?auto_274678 ) ) ( not ( = ?auto_274669 ?auto_274679 ) ) ( not ( = ?auto_274669 ?auto_274680 ) ) ( not ( = ?auto_274670 ?auto_274671 ) ) ( not ( = ?auto_274670 ?auto_274672 ) ) ( not ( = ?auto_274670 ?auto_274673 ) ) ( not ( = ?auto_274670 ?auto_274674 ) ) ( not ( = ?auto_274670 ?auto_274675 ) ) ( not ( = ?auto_274670 ?auto_274676 ) ) ( not ( = ?auto_274670 ?auto_274677 ) ) ( not ( = ?auto_274670 ?auto_274678 ) ) ( not ( = ?auto_274670 ?auto_274679 ) ) ( not ( = ?auto_274670 ?auto_274680 ) ) ( not ( = ?auto_274671 ?auto_274672 ) ) ( not ( = ?auto_274671 ?auto_274673 ) ) ( not ( = ?auto_274671 ?auto_274674 ) ) ( not ( = ?auto_274671 ?auto_274675 ) ) ( not ( = ?auto_274671 ?auto_274676 ) ) ( not ( = ?auto_274671 ?auto_274677 ) ) ( not ( = ?auto_274671 ?auto_274678 ) ) ( not ( = ?auto_274671 ?auto_274679 ) ) ( not ( = ?auto_274671 ?auto_274680 ) ) ( not ( = ?auto_274672 ?auto_274673 ) ) ( not ( = ?auto_274672 ?auto_274674 ) ) ( not ( = ?auto_274672 ?auto_274675 ) ) ( not ( = ?auto_274672 ?auto_274676 ) ) ( not ( = ?auto_274672 ?auto_274677 ) ) ( not ( = ?auto_274672 ?auto_274678 ) ) ( not ( = ?auto_274672 ?auto_274679 ) ) ( not ( = ?auto_274672 ?auto_274680 ) ) ( not ( = ?auto_274673 ?auto_274674 ) ) ( not ( = ?auto_274673 ?auto_274675 ) ) ( not ( = ?auto_274673 ?auto_274676 ) ) ( not ( = ?auto_274673 ?auto_274677 ) ) ( not ( = ?auto_274673 ?auto_274678 ) ) ( not ( = ?auto_274673 ?auto_274679 ) ) ( not ( = ?auto_274673 ?auto_274680 ) ) ( not ( = ?auto_274674 ?auto_274675 ) ) ( not ( = ?auto_274674 ?auto_274676 ) ) ( not ( = ?auto_274674 ?auto_274677 ) ) ( not ( = ?auto_274674 ?auto_274678 ) ) ( not ( = ?auto_274674 ?auto_274679 ) ) ( not ( = ?auto_274674 ?auto_274680 ) ) ( not ( = ?auto_274675 ?auto_274676 ) ) ( not ( = ?auto_274675 ?auto_274677 ) ) ( not ( = ?auto_274675 ?auto_274678 ) ) ( not ( = ?auto_274675 ?auto_274679 ) ) ( not ( = ?auto_274675 ?auto_274680 ) ) ( not ( = ?auto_274676 ?auto_274677 ) ) ( not ( = ?auto_274676 ?auto_274678 ) ) ( not ( = ?auto_274676 ?auto_274679 ) ) ( not ( = ?auto_274676 ?auto_274680 ) ) ( not ( = ?auto_274677 ?auto_274678 ) ) ( not ( = ?auto_274677 ?auto_274679 ) ) ( not ( = ?auto_274677 ?auto_274680 ) ) ( not ( = ?auto_274678 ?auto_274679 ) ) ( not ( = ?auto_274678 ?auto_274680 ) ) ( not ( = ?auto_274679 ?auto_274680 ) ) ( ON ?auto_274679 ?auto_274680 ) ( ON ?auto_274678 ?auto_274679 ) ( ON ?auto_274677 ?auto_274678 ) ( ON ?auto_274676 ?auto_274677 ) ( ON ?auto_274675 ?auto_274676 ) ( ON ?auto_274674 ?auto_274675 ) ( ON ?auto_274673 ?auto_274674 ) ( CLEAR ?auto_274671 ) ( ON ?auto_274672 ?auto_274673 ) ( CLEAR ?auto_274672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_274668 ?auto_274669 ?auto_274670 ?auto_274671 ?auto_274672 )
      ( MAKE-13PILE ?auto_274668 ?auto_274669 ?auto_274670 ?auto_274671 ?auto_274672 ?auto_274673 ?auto_274674 ?auto_274675 ?auto_274676 ?auto_274677 ?auto_274678 ?auto_274679 ?auto_274680 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_274694 - BLOCK
      ?auto_274695 - BLOCK
      ?auto_274696 - BLOCK
      ?auto_274697 - BLOCK
      ?auto_274698 - BLOCK
      ?auto_274699 - BLOCK
      ?auto_274700 - BLOCK
      ?auto_274701 - BLOCK
      ?auto_274702 - BLOCK
      ?auto_274703 - BLOCK
      ?auto_274704 - BLOCK
      ?auto_274705 - BLOCK
      ?auto_274706 - BLOCK
    )
    :vars
    (
      ?auto_274707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_274706 ?auto_274707 ) ( ON-TABLE ?auto_274694 ) ( ON ?auto_274695 ?auto_274694 ) ( ON ?auto_274696 ?auto_274695 ) ( not ( = ?auto_274694 ?auto_274695 ) ) ( not ( = ?auto_274694 ?auto_274696 ) ) ( not ( = ?auto_274694 ?auto_274697 ) ) ( not ( = ?auto_274694 ?auto_274698 ) ) ( not ( = ?auto_274694 ?auto_274699 ) ) ( not ( = ?auto_274694 ?auto_274700 ) ) ( not ( = ?auto_274694 ?auto_274701 ) ) ( not ( = ?auto_274694 ?auto_274702 ) ) ( not ( = ?auto_274694 ?auto_274703 ) ) ( not ( = ?auto_274694 ?auto_274704 ) ) ( not ( = ?auto_274694 ?auto_274705 ) ) ( not ( = ?auto_274694 ?auto_274706 ) ) ( not ( = ?auto_274694 ?auto_274707 ) ) ( not ( = ?auto_274695 ?auto_274696 ) ) ( not ( = ?auto_274695 ?auto_274697 ) ) ( not ( = ?auto_274695 ?auto_274698 ) ) ( not ( = ?auto_274695 ?auto_274699 ) ) ( not ( = ?auto_274695 ?auto_274700 ) ) ( not ( = ?auto_274695 ?auto_274701 ) ) ( not ( = ?auto_274695 ?auto_274702 ) ) ( not ( = ?auto_274695 ?auto_274703 ) ) ( not ( = ?auto_274695 ?auto_274704 ) ) ( not ( = ?auto_274695 ?auto_274705 ) ) ( not ( = ?auto_274695 ?auto_274706 ) ) ( not ( = ?auto_274695 ?auto_274707 ) ) ( not ( = ?auto_274696 ?auto_274697 ) ) ( not ( = ?auto_274696 ?auto_274698 ) ) ( not ( = ?auto_274696 ?auto_274699 ) ) ( not ( = ?auto_274696 ?auto_274700 ) ) ( not ( = ?auto_274696 ?auto_274701 ) ) ( not ( = ?auto_274696 ?auto_274702 ) ) ( not ( = ?auto_274696 ?auto_274703 ) ) ( not ( = ?auto_274696 ?auto_274704 ) ) ( not ( = ?auto_274696 ?auto_274705 ) ) ( not ( = ?auto_274696 ?auto_274706 ) ) ( not ( = ?auto_274696 ?auto_274707 ) ) ( not ( = ?auto_274697 ?auto_274698 ) ) ( not ( = ?auto_274697 ?auto_274699 ) ) ( not ( = ?auto_274697 ?auto_274700 ) ) ( not ( = ?auto_274697 ?auto_274701 ) ) ( not ( = ?auto_274697 ?auto_274702 ) ) ( not ( = ?auto_274697 ?auto_274703 ) ) ( not ( = ?auto_274697 ?auto_274704 ) ) ( not ( = ?auto_274697 ?auto_274705 ) ) ( not ( = ?auto_274697 ?auto_274706 ) ) ( not ( = ?auto_274697 ?auto_274707 ) ) ( not ( = ?auto_274698 ?auto_274699 ) ) ( not ( = ?auto_274698 ?auto_274700 ) ) ( not ( = ?auto_274698 ?auto_274701 ) ) ( not ( = ?auto_274698 ?auto_274702 ) ) ( not ( = ?auto_274698 ?auto_274703 ) ) ( not ( = ?auto_274698 ?auto_274704 ) ) ( not ( = ?auto_274698 ?auto_274705 ) ) ( not ( = ?auto_274698 ?auto_274706 ) ) ( not ( = ?auto_274698 ?auto_274707 ) ) ( not ( = ?auto_274699 ?auto_274700 ) ) ( not ( = ?auto_274699 ?auto_274701 ) ) ( not ( = ?auto_274699 ?auto_274702 ) ) ( not ( = ?auto_274699 ?auto_274703 ) ) ( not ( = ?auto_274699 ?auto_274704 ) ) ( not ( = ?auto_274699 ?auto_274705 ) ) ( not ( = ?auto_274699 ?auto_274706 ) ) ( not ( = ?auto_274699 ?auto_274707 ) ) ( not ( = ?auto_274700 ?auto_274701 ) ) ( not ( = ?auto_274700 ?auto_274702 ) ) ( not ( = ?auto_274700 ?auto_274703 ) ) ( not ( = ?auto_274700 ?auto_274704 ) ) ( not ( = ?auto_274700 ?auto_274705 ) ) ( not ( = ?auto_274700 ?auto_274706 ) ) ( not ( = ?auto_274700 ?auto_274707 ) ) ( not ( = ?auto_274701 ?auto_274702 ) ) ( not ( = ?auto_274701 ?auto_274703 ) ) ( not ( = ?auto_274701 ?auto_274704 ) ) ( not ( = ?auto_274701 ?auto_274705 ) ) ( not ( = ?auto_274701 ?auto_274706 ) ) ( not ( = ?auto_274701 ?auto_274707 ) ) ( not ( = ?auto_274702 ?auto_274703 ) ) ( not ( = ?auto_274702 ?auto_274704 ) ) ( not ( = ?auto_274702 ?auto_274705 ) ) ( not ( = ?auto_274702 ?auto_274706 ) ) ( not ( = ?auto_274702 ?auto_274707 ) ) ( not ( = ?auto_274703 ?auto_274704 ) ) ( not ( = ?auto_274703 ?auto_274705 ) ) ( not ( = ?auto_274703 ?auto_274706 ) ) ( not ( = ?auto_274703 ?auto_274707 ) ) ( not ( = ?auto_274704 ?auto_274705 ) ) ( not ( = ?auto_274704 ?auto_274706 ) ) ( not ( = ?auto_274704 ?auto_274707 ) ) ( not ( = ?auto_274705 ?auto_274706 ) ) ( not ( = ?auto_274705 ?auto_274707 ) ) ( not ( = ?auto_274706 ?auto_274707 ) ) ( ON ?auto_274705 ?auto_274706 ) ( ON ?auto_274704 ?auto_274705 ) ( ON ?auto_274703 ?auto_274704 ) ( ON ?auto_274702 ?auto_274703 ) ( ON ?auto_274701 ?auto_274702 ) ( ON ?auto_274700 ?auto_274701 ) ( ON ?auto_274699 ?auto_274700 ) ( ON ?auto_274698 ?auto_274699 ) ( CLEAR ?auto_274696 ) ( ON ?auto_274697 ?auto_274698 ) ( CLEAR ?auto_274697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_274694 ?auto_274695 ?auto_274696 ?auto_274697 )
      ( MAKE-13PILE ?auto_274694 ?auto_274695 ?auto_274696 ?auto_274697 ?auto_274698 ?auto_274699 ?auto_274700 ?auto_274701 ?auto_274702 ?auto_274703 ?auto_274704 ?auto_274705 ?auto_274706 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_274721 - BLOCK
      ?auto_274722 - BLOCK
      ?auto_274723 - BLOCK
      ?auto_274724 - BLOCK
      ?auto_274725 - BLOCK
      ?auto_274726 - BLOCK
      ?auto_274727 - BLOCK
      ?auto_274728 - BLOCK
      ?auto_274729 - BLOCK
      ?auto_274730 - BLOCK
      ?auto_274731 - BLOCK
      ?auto_274732 - BLOCK
      ?auto_274733 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_274733 ) ( ON-TABLE ?auto_274721 ) ( ON ?auto_274722 ?auto_274721 ) ( ON ?auto_274723 ?auto_274722 ) ( not ( = ?auto_274721 ?auto_274722 ) ) ( not ( = ?auto_274721 ?auto_274723 ) ) ( not ( = ?auto_274721 ?auto_274724 ) ) ( not ( = ?auto_274721 ?auto_274725 ) ) ( not ( = ?auto_274721 ?auto_274726 ) ) ( not ( = ?auto_274721 ?auto_274727 ) ) ( not ( = ?auto_274721 ?auto_274728 ) ) ( not ( = ?auto_274721 ?auto_274729 ) ) ( not ( = ?auto_274721 ?auto_274730 ) ) ( not ( = ?auto_274721 ?auto_274731 ) ) ( not ( = ?auto_274721 ?auto_274732 ) ) ( not ( = ?auto_274721 ?auto_274733 ) ) ( not ( = ?auto_274722 ?auto_274723 ) ) ( not ( = ?auto_274722 ?auto_274724 ) ) ( not ( = ?auto_274722 ?auto_274725 ) ) ( not ( = ?auto_274722 ?auto_274726 ) ) ( not ( = ?auto_274722 ?auto_274727 ) ) ( not ( = ?auto_274722 ?auto_274728 ) ) ( not ( = ?auto_274722 ?auto_274729 ) ) ( not ( = ?auto_274722 ?auto_274730 ) ) ( not ( = ?auto_274722 ?auto_274731 ) ) ( not ( = ?auto_274722 ?auto_274732 ) ) ( not ( = ?auto_274722 ?auto_274733 ) ) ( not ( = ?auto_274723 ?auto_274724 ) ) ( not ( = ?auto_274723 ?auto_274725 ) ) ( not ( = ?auto_274723 ?auto_274726 ) ) ( not ( = ?auto_274723 ?auto_274727 ) ) ( not ( = ?auto_274723 ?auto_274728 ) ) ( not ( = ?auto_274723 ?auto_274729 ) ) ( not ( = ?auto_274723 ?auto_274730 ) ) ( not ( = ?auto_274723 ?auto_274731 ) ) ( not ( = ?auto_274723 ?auto_274732 ) ) ( not ( = ?auto_274723 ?auto_274733 ) ) ( not ( = ?auto_274724 ?auto_274725 ) ) ( not ( = ?auto_274724 ?auto_274726 ) ) ( not ( = ?auto_274724 ?auto_274727 ) ) ( not ( = ?auto_274724 ?auto_274728 ) ) ( not ( = ?auto_274724 ?auto_274729 ) ) ( not ( = ?auto_274724 ?auto_274730 ) ) ( not ( = ?auto_274724 ?auto_274731 ) ) ( not ( = ?auto_274724 ?auto_274732 ) ) ( not ( = ?auto_274724 ?auto_274733 ) ) ( not ( = ?auto_274725 ?auto_274726 ) ) ( not ( = ?auto_274725 ?auto_274727 ) ) ( not ( = ?auto_274725 ?auto_274728 ) ) ( not ( = ?auto_274725 ?auto_274729 ) ) ( not ( = ?auto_274725 ?auto_274730 ) ) ( not ( = ?auto_274725 ?auto_274731 ) ) ( not ( = ?auto_274725 ?auto_274732 ) ) ( not ( = ?auto_274725 ?auto_274733 ) ) ( not ( = ?auto_274726 ?auto_274727 ) ) ( not ( = ?auto_274726 ?auto_274728 ) ) ( not ( = ?auto_274726 ?auto_274729 ) ) ( not ( = ?auto_274726 ?auto_274730 ) ) ( not ( = ?auto_274726 ?auto_274731 ) ) ( not ( = ?auto_274726 ?auto_274732 ) ) ( not ( = ?auto_274726 ?auto_274733 ) ) ( not ( = ?auto_274727 ?auto_274728 ) ) ( not ( = ?auto_274727 ?auto_274729 ) ) ( not ( = ?auto_274727 ?auto_274730 ) ) ( not ( = ?auto_274727 ?auto_274731 ) ) ( not ( = ?auto_274727 ?auto_274732 ) ) ( not ( = ?auto_274727 ?auto_274733 ) ) ( not ( = ?auto_274728 ?auto_274729 ) ) ( not ( = ?auto_274728 ?auto_274730 ) ) ( not ( = ?auto_274728 ?auto_274731 ) ) ( not ( = ?auto_274728 ?auto_274732 ) ) ( not ( = ?auto_274728 ?auto_274733 ) ) ( not ( = ?auto_274729 ?auto_274730 ) ) ( not ( = ?auto_274729 ?auto_274731 ) ) ( not ( = ?auto_274729 ?auto_274732 ) ) ( not ( = ?auto_274729 ?auto_274733 ) ) ( not ( = ?auto_274730 ?auto_274731 ) ) ( not ( = ?auto_274730 ?auto_274732 ) ) ( not ( = ?auto_274730 ?auto_274733 ) ) ( not ( = ?auto_274731 ?auto_274732 ) ) ( not ( = ?auto_274731 ?auto_274733 ) ) ( not ( = ?auto_274732 ?auto_274733 ) ) ( ON ?auto_274732 ?auto_274733 ) ( ON ?auto_274731 ?auto_274732 ) ( ON ?auto_274730 ?auto_274731 ) ( ON ?auto_274729 ?auto_274730 ) ( ON ?auto_274728 ?auto_274729 ) ( ON ?auto_274727 ?auto_274728 ) ( ON ?auto_274726 ?auto_274727 ) ( ON ?auto_274725 ?auto_274726 ) ( CLEAR ?auto_274723 ) ( ON ?auto_274724 ?auto_274725 ) ( CLEAR ?auto_274724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_274721 ?auto_274722 ?auto_274723 ?auto_274724 )
      ( MAKE-13PILE ?auto_274721 ?auto_274722 ?auto_274723 ?auto_274724 ?auto_274725 ?auto_274726 ?auto_274727 ?auto_274728 ?auto_274729 ?auto_274730 ?auto_274731 ?auto_274732 ?auto_274733 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_274747 - BLOCK
      ?auto_274748 - BLOCK
      ?auto_274749 - BLOCK
      ?auto_274750 - BLOCK
      ?auto_274751 - BLOCK
      ?auto_274752 - BLOCK
      ?auto_274753 - BLOCK
      ?auto_274754 - BLOCK
      ?auto_274755 - BLOCK
      ?auto_274756 - BLOCK
      ?auto_274757 - BLOCK
      ?auto_274758 - BLOCK
      ?auto_274759 - BLOCK
    )
    :vars
    (
      ?auto_274760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_274759 ?auto_274760 ) ( ON-TABLE ?auto_274747 ) ( ON ?auto_274748 ?auto_274747 ) ( not ( = ?auto_274747 ?auto_274748 ) ) ( not ( = ?auto_274747 ?auto_274749 ) ) ( not ( = ?auto_274747 ?auto_274750 ) ) ( not ( = ?auto_274747 ?auto_274751 ) ) ( not ( = ?auto_274747 ?auto_274752 ) ) ( not ( = ?auto_274747 ?auto_274753 ) ) ( not ( = ?auto_274747 ?auto_274754 ) ) ( not ( = ?auto_274747 ?auto_274755 ) ) ( not ( = ?auto_274747 ?auto_274756 ) ) ( not ( = ?auto_274747 ?auto_274757 ) ) ( not ( = ?auto_274747 ?auto_274758 ) ) ( not ( = ?auto_274747 ?auto_274759 ) ) ( not ( = ?auto_274747 ?auto_274760 ) ) ( not ( = ?auto_274748 ?auto_274749 ) ) ( not ( = ?auto_274748 ?auto_274750 ) ) ( not ( = ?auto_274748 ?auto_274751 ) ) ( not ( = ?auto_274748 ?auto_274752 ) ) ( not ( = ?auto_274748 ?auto_274753 ) ) ( not ( = ?auto_274748 ?auto_274754 ) ) ( not ( = ?auto_274748 ?auto_274755 ) ) ( not ( = ?auto_274748 ?auto_274756 ) ) ( not ( = ?auto_274748 ?auto_274757 ) ) ( not ( = ?auto_274748 ?auto_274758 ) ) ( not ( = ?auto_274748 ?auto_274759 ) ) ( not ( = ?auto_274748 ?auto_274760 ) ) ( not ( = ?auto_274749 ?auto_274750 ) ) ( not ( = ?auto_274749 ?auto_274751 ) ) ( not ( = ?auto_274749 ?auto_274752 ) ) ( not ( = ?auto_274749 ?auto_274753 ) ) ( not ( = ?auto_274749 ?auto_274754 ) ) ( not ( = ?auto_274749 ?auto_274755 ) ) ( not ( = ?auto_274749 ?auto_274756 ) ) ( not ( = ?auto_274749 ?auto_274757 ) ) ( not ( = ?auto_274749 ?auto_274758 ) ) ( not ( = ?auto_274749 ?auto_274759 ) ) ( not ( = ?auto_274749 ?auto_274760 ) ) ( not ( = ?auto_274750 ?auto_274751 ) ) ( not ( = ?auto_274750 ?auto_274752 ) ) ( not ( = ?auto_274750 ?auto_274753 ) ) ( not ( = ?auto_274750 ?auto_274754 ) ) ( not ( = ?auto_274750 ?auto_274755 ) ) ( not ( = ?auto_274750 ?auto_274756 ) ) ( not ( = ?auto_274750 ?auto_274757 ) ) ( not ( = ?auto_274750 ?auto_274758 ) ) ( not ( = ?auto_274750 ?auto_274759 ) ) ( not ( = ?auto_274750 ?auto_274760 ) ) ( not ( = ?auto_274751 ?auto_274752 ) ) ( not ( = ?auto_274751 ?auto_274753 ) ) ( not ( = ?auto_274751 ?auto_274754 ) ) ( not ( = ?auto_274751 ?auto_274755 ) ) ( not ( = ?auto_274751 ?auto_274756 ) ) ( not ( = ?auto_274751 ?auto_274757 ) ) ( not ( = ?auto_274751 ?auto_274758 ) ) ( not ( = ?auto_274751 ?auto_274759 ) ) ( not ( = ?auto_274751 ?auto_274760 ) ) ( not ( = ?auto_274752 ?auto_274753 ) ) ( not ( = ?auto_274752 ?auto_274754 ) ) ( not ( = ?auto_274752 ?auto_274755 ) ) ( not ( = ?auto_274752 ?auto_274756 ) ) ( not ( = ?auto_274752 ?auto_274757 ) ) ( not ( = ?auto_274752 ?auto_274758 ) ) ( not ( = ?auto_274752 ?auto_274759 ) ) ( not ( = ?auto_274752 ?auto_274760 ) ) ( not ( = ?auto_274753 ?auto_274754 ) ) ( not ( = ?auto_274753 ?auto_274755 ) ) ( not ( = ?auto_274753 ?auto_274756 ) ) ( not ( = ?auto_274753 ?auto_274757 ) ) ( not ( = ?auto_274753 ?auto_274758 ) ) ( not ( = ?auto_274753 ?auto_274759 ) ) ( not ( = ?auto_274753 ?auto_274760 ) ) ( not ( = ?auto_274754 ?auto_274755 ) ) ( not ( = ?auto_274754 ?auto_274756 ) ) ( not ( = ?auto_274754 ?auto_274757 ) ) ( not ( = ?auto_274754 ?auto_274758 ) ) ( not ( = ?auto_274754 ?auto_274759 ) ) ( not ( = ?auto_274754 ?auto_274760 ) ) ( not ( = ?auto_274755 ?auto_274756 ) ) ( not ( = ?auto_274755 ?auto_274757 ) ) ( not ( = ?auto_274755 ?auto_274758 ) ) ( not ( = ?auto_274755 ?auto_274759 ) ) ( not ( = ?auto_274755 ?auto_274760 ) ) ( not ( = ?auto_274756 ?auto_274757 ) ) ( not ( = ?auto_274756 ?auto_274758 ) ) ( not ( = ?auto_274756 ?auto_274759 ) ) ( not ( = ?auto_274756 ?auto_274760 ) ) ( not ( = ?auto_274757 ?auto_274758 ) ) ( not ( = ?auto_274757 ?auto_274759 ) ) ( not ( = ?auto_274757 ?auto_274760 ) ) ( not ( = ?auto_274758 ?auto_274759 ) ) ( not ( = ?auto_274758 ?auto_274760 ) ) ( not ( = ?auto_274759 ?auto_274760 ) ) ( ON ?auto_274758 ?auto_274759 ) ( ON ?auto_274757 ?auto_274758 ) ( ON ?auto_274756 ?auto_274757 ) ( ON ?auto_274755 ?auto_274756 ) ( ON ?auto_274754 ?auto_274755 ) ( ON ?auto_274753 ?auto_274754 ) ( ON ?auto_274752 ?auto_274753 ) ( ON ?auto_274751 ?auto_274752 ) ( ON ?auto_274750 ?auto_274751 ) ( CLEAR ?auto_274748 ) ( ON ?auto_274749 ?auto_274750 ) ( CLEAR ?auto_274749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_274747 ?auto_274748 ?auto_274749 )
      ( MAKE-13PILE ?auto_274747 ?auto_274748 ?auto_274749 ?auto_274750 ?auto_274751 ?auto_274752 ?auto_274753 ?auto_274754 ?auto_274755 ?auto_274756 ?auto_274757 ?auto_274758 ?auto_274759 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_274774 - BLOCK
      ?auto_274775 - BLOCK
      ?auto_274776 - BLOCK
      ?auto_274777 - BLOCK
      ?auto_274778 - BLOCK
      ?auto_274779 - BLOCK
      ?auto_274780 - BLOCK
      ?auto_274781 - BLOCK
      ?auto_274782 - BLOCK
      ?auto_274783 - BLOCK
      ?auto_274784 - BLOCK
      ?auto_274785 - BLOCK
      ?auto_274786 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_274786 ) ( ON-TABLE ?auto_274774 ) ( ON ?auto_274775 ?auto_274774 ) ( not ( = ?auto_274774 ?auto_274775 ) ) ( not ( = ?auto_274774 ?auto_274776 ) ) ( not ( = ?auto_274774 ?auto_274777 ) ) ( not ( = ?auto_274774 ?auto_274778 ) ) ( not ( = ?auto_274774 ?auto_274779 ) ) ( not ( = ?auto_274774 ?auto_274780 ) ) ( not ( = ?auto_274774 ?auto_274781 ) ) ( not ( = ?auto_274774 ?auto_274782 ) ) ( not ( = ?auto_274774 ?auto_274783 ) ) ( not ( = ?auto_274774 ?auto_274784 ) ) ( not ( = ?auto_274774 ?auto_274785 ) ) ( not ( = ?auto_274774 ?auto_274786 ) ) ( not ( = ?auto_274775 ?auto_274776 ) ) ( not ( = ?auto_274775 ?auto_274777 ) ) ( not ( = ?auto_274775 ?auto_274778 ) ) ( not ( = ?auto_274775 ?auto_274779 ) ) ( not ( = ?auto_274775 ?auto_274780 ) ) ( not ( = ?auto_274775 ?auto_274781 ) ) ( not ( = ?auto_274775 ?auto_274782 ) ) ( not ( = ?auto_274775 ?auto_274783 ) ) ( not ( = ?auto_274775 ?auto_274784 ) ) ( not ( = ?auto_274775 ?auto_274785 ) ) ( not ( = ?auto_274775 ?auto_274786 ) ) ( not ( = ?auto_274776 ?auto_274777 ) ) ( not ( = ?auto_274776 ?auto_274778 ) ) ( not ( = ?auto_274776 ?auto_274779 ) ) ( not ( = ?auto_274776 ?auto_274780 ) ) ( not ( = ?auto_274776 ?auto_274781 ) ) ( not ( = ?auto_274776 ?auto_274782 ) ) ( not ( = ?auto_274776 ?auto_274783 ) ) ( not ( = ?auto_274776 ?auto_274784 ) ) ( not ( = ?auto_274776 ?auto_274785 ) ) ( not ( = ?auto_274776 ?auto_274786 ) ) ( not ( = ?auto_274777 ?auto_274778 ) ) ( not ( = ?auto_274777 ?auto_274779 ) ) ( not ( = ?auto_274777 ?auto_274780 ) ) ( not ( = ?auto_274777 ?auto_274781 ) ) ( not ( = ?auto_274777 ?auto_274782 ) ) ( not ( = ?auto_274777 ?auto_274783 ) ) ( not ( = ?auto_274777 ?auto_274784 ) ) ( not ( = ?auto_274777 ?auto_274785 ) ) ( not ( = ?auto_274777 ?auto_274786 ) ) ( not ( = ?auto_274778 ?auto_274779 ) ) ( not ( = ?auto_274778 ?auto_274780 ) ) ( not ( = ?auto_274778 ?auto_274781 ) ) ( not ( = ?auto_274778 ?auto_274782 ) ) ( not ( = ?auto_274778 ?auto_274783 ) ) ( not ( = ?auto_274778 ?auto_274784 ) ) ( not ( = ?auto_274778 ?auto_274785 ) ) ( not ( = ?auto_274778 ?auto_274786 ) ) ( not ( = ?auto_274779 ?auto_274780 ) ) ( not ( = ?auto_274779 ?auto_274781 ) ) ( not ( = ?auto_274779 ?auto_274782 ) ) ( not ( = ?auto_274779 ?auto_274783 ) ) ( not ( = ?auto_274779 ?auto_274784 ) ) ( not ( = ?auto_274779 ?auto_274785 ) ) ( not ( = ?auto_274779 ?auto_274786 ) ) ( not ( = ?auto_274780 ?auto_274781 ) ) ( not ( = ?auto_274780 ?auto_274782 ) ) ( not ( = ?auto_274780 ?auto_274783 ) ) ( not ( = ?auto_274780 ?auto_274784 ) ) ( not ( = ?auto_274780 ?auto_274785 ) ) ( not ( = ?auto_274780 ?auto_274786 ) ) ( not ( = ?auto_274781 ?auto_274782 ) ) ( not ( = ?auto_274781 ?auto_274783 ) ) ( not ( = ?auto_274781 ?auto_274784 ) ) ( not ( = ?auto_274781 ?auto_274785 ) ) ( not ( = ?auto_274781 ?auto_274786 ) ) ( not ( = ?auto_274782 ?auto_274783 ) ) ( not ( = ?auto_274782 ?auto_274784 ) ) ( not ( = ?auto_274782 ?auto_274785 ) ) ( not ( = ?auto_274782 ?auto_274786 ) ) ( not ( = ?auto_274783 ?auto_274784 ) ) ( not ( = ?auto_274783 ?auto_274785 ) ) ( not ( = ?auto_274783 ?auto_274786 ) ) ( not ( = ?auto_274784 ?auto_274785 ) ) ( not ( = ?auto_274784 ?auto_274786 ) ) ( not ( = ?auto_274785 ?auto_274786 ) ) ( ON ?auto_274785 ?auto_274786 ) ( ON ?auto_274784 ?auto_274785 ) ( ON ?auto_274783 ?auto_274784 ) ( ON ?auto_274782 ?auto_274783 ) ( ON ?auto_274781 ?auto_274782 ) ( ON ?auto_274780 ?auto_274781 ) ( ON ?auto_274779 ?auto_274780 ) ( ON ?auto_274778 ?auto_274779 ) ( ON ?auto_274777 ?auto_274778 ) ( CLEAR ?auto_274775 ) ( ON ?auto_274776 ?auto_274777 ) ( CLEAR ?auto_274776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_274774 ?auto_274775 ?auto_274776 )
      ( MAKE-13PILE ?auto_274774 ?auto_274775 ?auto_274776 ?auto_274777 ?auto_274778 ?auto_274779 ?auto_274780 ?auto_274781 ?auto_274782 ?auto_274783 ?auto_274784 ?auto_274785 ?auto_274786 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_274800 - BLOCK
      ?auto_274801 - BLOCK
      ?auto_274802 - BLOCK
      ?auto_274803 - BLOCK
      ?auto_274804 - BLOCK
      ?auto_274805 - BLOCK
      ?auto_274806 - BLOCK
      ?auto_274807 - BLOCK
      ?auto_274808 - BLOCK
      ?auto_274809 - BLOCK
      ?auto_274810 - BLOCK
      ?auto_274811 - BLOCK
      ?auto_274812 - BLOCK
    )
    :vars
    (
      ?auto_274813 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_274812 ?auto_274813 ) ( ON-TABLE ?auto_274800 ) ( not ( = ?auto_274800 ?auto_274801 ) ) ( not ( = ?auto_274800 ?auto_274802 ) ) ( not ( = ?auto_274800 ?auto_274803 ) ) ( not ( = ?auto_274800 ?auto_274804 ) ) ( not ( = ?auto_274800 ?auto_274805 ) ) ( not ( = ?auto_274800 ?auto_274806 ) ) ( not ( = ?auto_274800 ?auto_274807 ) ) ( not ( = ?auto_274800 ?auto_274808 ) ) ( not ( = ?auto_274800 ?auto_274809 ) ) ( not ( = ?auto_274800 ?auto_274810 ) ) ( not ( = ?auto_274800 ?auto_274811 ) ) ( not ( = ?auto_274800 ?auto_274812 ) ) ( not ( = ?auto_274800 ?auto_274813 ) ) ( not ( = ?auto_274801 ?auto_274802 ) ) ( not ( = ?auto_274801 ?auto_274803 ) ) ( not ( = ?auto_274801 ?auto_274804 ) ) ( not ( = ?auto_274801 ?auto_274805 ) ) ( not ( = ?auto_274801 ?auto_274806 ) ) ( not ( = ?auto_274801 ?auto_274807 ) ) ( not ( = ?auto_274801 ?auto_274808 ) ) ( not ( = ?auto_274801 ?auto_274809 ) ) ( not ( = ?auto_274801 ?auto_274810 ) ) ( not ( = ?auto_274801 ?auto_274811 ) ) ( not ( = ?auto_274801 ?auto_274812 ) ) ( not ( = ?auto_274801 ?auto_274813 ) ) ( not ( = ?auto_274802 ?auto_274803 ) ) ( not ( = ?auto_274802 ?auto_274804 ) ) ( not ( = ?auto_274802 ?auto_274805 ) ) ( not ( = ?auto_274802 ?auto_274806 ) ) ( not ( = ?auto_274802 ?auto_274807 ) ) ( not ( = ?auto_274802 ?auto_274808 ) ) ( not ( = ?auto_274802 ?auto_274809 ) ) ( not ( = ?auto_274802 ?auto_274810 ) ) ( not ( = ?auto_274802 ?auto_274811 ) ) ( not ( = ?auto_274802 ?auto_274812 ) ) ( not ( = ?auto_274802 ?auto_274813 ) ) ( not ( = ?auto_274803 ?auto_274804 ) ) ( not ( = ?auto_274803 ?auto_274805 ) ) ( not ( = ?auto_274803 ?auto_274806 ) ) ( not ( = ?auto_274803 ?auto_274807 ) ) ( not ( = ?auto_274803 ?auto_274808 ) ) ( not ( = ?auto_274803 ?auto_274809 ) ) ( not ( = ?auto_274803 ?auto_274810 ) ) ( not ( = ?auto_274803 ?auto_274811 ) ) ( not ( = ?auto_274803 ?auto_274812 ) ) ( not ( = ?auto_274803 ?auto_274813 ) ) ( not ( = ?auto_274804 ?auto_274805 ) ) ( not ( = ?auto_274804 ?auto_274806 ) ) ( not ( = ?auto_274804 ?auto_274807 ) ) ( not ( = ?auto_274804 ?auto_274808 ) ) ( not ( = ?auto_274804 ?auto_274809 ) ) ( not ( = ?auto_274804 ?auto_274810 ) ) ( not ( = ?auto_274804 ?auto_274811 ) ) ( not ( = ?auto_274804 ?auto_274812 ) ) ( not ( = ?auto_274804 ?auto_274813 ) ) ( not ( = ?auto_274805 ?auto_274806 ) ) ( not ( = ?auto_274805 ?auto_274807 ) ) ( not ( = ?auto_274805 ?auto_274808 ) ) ( not ( = ?auto_274805 ?auto_274809 ) ) ( not ( = ?auto_274805 ?auto_274810 ) ) ( not ( = ?auto_274805 ?auto_274811 ) ) ( not ( = ?auto_274805 ?auto_274812 ) ) ( not ( = ?auto_274805 ?auto_274813 ) ) ( not ( = ?auto_274806 ?auto_274807 ) ) ( not ( = ?auto_274806 ?auto_274808 ) ) ( not ( = ?auto_274806 ?auto_274809 ) ) ( not ( = ?auto_274806 ?auto_274810 ) ) ( not ( = ?auto_274806 ?auto_274811 ) ) ( not ( = ?auto_274806 ?auto_274812 ) ) ( not ( = ?auto_274806 ?auto_274813 ) ) ( not ( = ?auto_274807 ?auto_274808 ) ) ( not ( = ?auto_274807 ?auto_274809 ) ) ( not ( = ?auto_274807 ?auto_274810 ) ) ( not ( = ?auto_274807 ?auto_274811 ) ) ( not ( = ?auto_274807 ?auto_274812 ) ) ( not ( = ?auto_274807 ?auto_274813 ) ) ( not ( = ?auto_274808 ?auto_274809 ) ) ( not ( = ?auto_274808 ?auto_274810 ) ) ( not ( = ?auto_274808 ?auto_274811 ) ) ( not ( = ?auto_274808 ?auto_274812 ) ) ( not ( = ?auto_274808 ?auto_274813 ) ) ( not ( = ?auto_274809 ?auto_274810 ) ) ( not ( = ?auto_274809 ?auto_274811 ) ) ( not ( = ?auto_274809 ?auto_274812 ) ) ( not ( = ?auto_274809 ?auto_274813 ) ) ( not ( = ?auto_274810 ?auto_274811 ) ) ( not ( = ?auto_274810 ?auto_274812 ) ) ( not ( = ?auto_274810 ?auto_274813 ) ) ( not ( = ?auto_274811 ?auto_274812 ) ) ( not ( = ?auto_274811 ?auto_274813 ) ) ( not ( = ?auto_274812 ?auto_274813 ) ) ( ON ?auto_274811 ?auto_274812 ) ( ON ?auto_274810 ?auto_274811 ) ( ON ?auto_274809 ?auto_274810 ) ( ON ?auto_274808 ?auto_274809 ) ( ON ?auto_274807 ?auto_274808 ) ( ON ?auto_274806 ?auto_274807 ) ( ON ?auto_274805 ?auto_274806 ) ( ON ?auto_274804 ?auto_274805 ) ( ON ?auto_274803 ?auto_274804 ) ( ON ?auto_274802 ?auto_274803 ) ( CLEAR ?auto_274800 ) ( ON ?auto_274801 ?auto_274802 ) ( CLEAR ?auto_274801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_274800 ?auto_274801 )
      ( MAKE-13PILE ?auto_274800 ?auto_274801 ?auto_274802 ?auto_274803 ?auto_274804 ?auto_274805 ?auto_274806 ?auto_274807 ?auto_274808 ?auto_274809 ?auto_274810 ?auto_274811 ?auto_274812 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_274827 - BLOCK
      ?auto_274828 - BLOCK
      ?auto_274829 - BLOCK
      ?auto_274830 - BLOCK
      ?auto_274831 - BLOCK
      ?auto_274832 - BLOCK
      ?auto_274833 - BLOCK
      ?auto_274834 - BLOCK
      ?auto_274835 - BLOCK
      ?auto_274836 - BLOCK
      ?auto_274837 - BLOCK
      ?auto_274838 - BLOCK
      ?auto_274839 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_274839 ) ( ON-TABLE ?auto_274827 ) ( not ( = ?auto_274827 ?auto_274828 ) ) ( not ( = ?auto_274827 ?auto_274829 ) ) ( not ( = ?auto_274827 ?auto_274830 ) ) ( not ( = ?auto_274827 ?auto_274831 ) ) ( not ( = ?auto_274827 ?auto_274832 ) ) ( not ( = ?auto_274827 ?auto_274833 ) ) ( not ( = ?auto_274827 ?auto_274834 ) ) ( not ( = ?auto_274827 ?auto_274835 ) ) ( not ( = ?auto_274827 ?auto_274836 ) ) ( not ( = ?auto_274827 ?auto_274837 ) ) ( not ( = ?auto_274827 ?auto_274838 ) ) ( not ( = ?auto_274827 ?auto_274839 ) ) ( not ( = ?auto_274828 ?auto_274829 ) ) ( not ( = ?auto_274828 ?auto_274830 ) ) ( not ( = ?auto_274828 ?auto_274831 ) ) ( not ( = ?auto_274828 ?auto_274832 ) ) ( not ( = ?auto_274828 ?auto_274833 ) ) ( not ( = ?auto_274828 ?auto_274834 ) ) ( not ( = ?auto_274828 ?auto_274835 ) ) ( not ( = ?auto_274828 ?auto_274836 ) ) ( not ( = ?auto_274828 ?auto_274837 ) ) ( not ( = ?auto_274828 ?auto_274838 ) ) ( not ( = ?auto_274828 ?auto_274839 ) ) ( not ( = ?auto_274829 ?auto_274830 ) ) ( not ( = ?auto_274829 ?auto_274831 ) ) ( not ( = ?auto_274829 ?auto_274832 ) ) ( not ( = ?auto_274829 ?auto_274833 ) ) ( not ( = ?auto_274829 ?auto_274834 ) ) ( not ( = ?auto_274829 ?auto_274835 ) ) ( not ( = ?auto_274829 ?auto_274836 ) ) ( not ( = ?auto_274829 ?auto_274837 ) ) ( not ( = ?auto_274829 ?auto_274838 ) ) ( not ( = ?auto_274829 ?auto_274839 ) ) ( not ( = ?auto_274830 ?auto_274831 ) ) ( not ( = ?auto_274830 ?auto_274832 ) ) ( not ( = ?auto_274830 ?auto_274833 ) ) ( not ( = ?auto_274830 ?auto_274834 ) ) ( not ( = ?auto_274830 ?auto_274835 ) ) ( not ( = ?auto_274830 ?auto_274836 ) ) ( not ( = ?auto_274830 ?auto_274837 ) ) ( not ( = ?auto_274830 ?auto_274838 ) ) ( not ( = ?auto_274830 ?auto_274839 ) ) ( not ( = ?auto_274831 ?auto_274832 ) ) ( not ( = ?auto_274831 ?auto_274833 ) ) ( not ( = ?auto_274831 ?auto_274834 ) ) ( not ( = ?auto_274831 ?auto_274835 ) ) ( not ( = ?auto_274831 ?auto_274836 ) ) ( not ( = ?auto_274831 ?auto_274837 ) ) ( not ( = ?auto_274831 ?auto_274838 ) ) ( not ( = ?auto_274831 ?auto_274839 ) ) ( not ( = ?auto_274832 ?auto_274833 ) ) ( not ( = ?auto_274832 ?auto_274834 ) ) ( not ( = ?auto_274832 ?auto_274835 ) ) ( not ( = ?auto_274832 ?auto_274836 ) ) ( not ( = ?auto_274832 ?auto_274837 ) ) ( not ( = ?auto_274832 ?auto_274838 ) ) ( not ( = ?auto_274832 ?auto_274839 ) ) ( not ( = ?auto_274833 ?auto_274834 ) ) ( not ( = ?auto_274833 ?auto_274835 ) ) ( not ( = ?auto_274833 ?auto_274836 ) ) ( not ( = ?auto_274833 ?auto_274837 ) ) ( not ( = ?auto_274833 ?auto_274838 ) ) ( not ( = ?auto_274833 ?auto_274839 ) ) ( not ( = ?auto_274834 ?auto_274835 ) ) ( not ( = ?auto_274834 ?auto_274836 ) ) ( not ( = ?auto_274834 ?auto_274837 ) ) ( not ( = ?auto_274834 ?auto_274838 ) ) ( not ( = ?auto_274834 ?auto_274839 ) ) ( not ( = ?auto_274835 ?auto_274836 ) ) ( not ( = ?auto_274835 ?auto_274837 ) ) ( not ( = ?auto_274835 ?auto_274838 ) ) ( not ( = ?auto_274835 ?auto_274839 ) ) ( not ( = ?auto_274836 ?auto_274837 ) ) ( not ( = ?auto_274836 ?auto_274838 ) ) ( not ( = ?auto_274836 ?auto_274839 ) ) ( not ( = ?auto_274837 ?auto_274838 ) ) ( not ( = ?auto_274837 ?auto_274839 ) ) ( not ( = ?auto_274838 ?auto_274839 ) ) ( ON ?auto_274838 ?auto_274839 ) ( ON ?auto_274837 ?auto_274838 ) ( ON ?auto_274836 ?auto_274837 ) ( ON ?auto_274835 ?auto_274836 ) ( ON ?auto_274834 ?auto_274835 ) ( ON ?auto_274833 ?auto_274834 ) ( ON ?auto_274832 ?auto_274833 ) ( ON ?auto_274831 ?auto_274832 ) ( ON ?auto_274830 ?auto_274831 ) ( ON ?auto_274829 ?auto_274830 ) ( CLEAR ?auto_274827 ) ( ON ?auto_274828 ?auto_274829 ) ( CLEAR ?auto_274828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_274827 ?auto_274828 )
      ( MAKE-13PILE ?auto_274827 ?auto_274828 ?auto_274829 ?auto_274830 ?auto_274831 ?auto_274832 ?auto_274833 ?auto_274834 ?auto_274835 ?auto_274836 ?auto_274837 ?auto_274838 ?auto_274839 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_274853 - BLOCK
      ?auto_274854 - BLOCK
      ?auto_274855 - BLOCK
      ?auto_274856 - BLOCK
      ?auto_274857 - BLOCK
      ?auto_274858 - BLOCK
      ?auto_274859 - BLOCK
      ?auto_274860 - BLOCK
      ?auto_274861 - BLOCK
      ?auto_274862 - BLOCK
      ?auto_274863 - BLOCK
      ?auto_274864 - BLOCK
      ?auto_274865 - BLOCK
    )
    :vars
    (
      ?auto_274866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_274865 ?auto_274866 ) ( not ( = ?auto_274853 ?auto_274854 ) ) ( not ( = ?auto_274853 ?auto_274855 ) ) ( not ( = ?auto_274853 ?auto_274856 ) ) ( not ( = ?auto_274853 ?auto_274857 ) ) ( not ( = ?auto_274853 ?auto_274858 ) ) ( not ( = ?auto_274853 ?auto_274859 ) ) ( not ( = ?auto_274853 ?auto_274860 ) ) ( not ( = ?auto_274853 ?auto_274861 ) ) ( not ( = ?auto_274853 ?auto_274862 ) ) ( not ( = ?auto_274853 ?auto_274863 ) ) ( not ( = ?auto_274853 ?auto_274864 ) ) ( not ( = ?auto_274853 ?auto_274865 ) ) ( not ( = ?auto_274853 ?auto_274866 ) ) ( not ( = ?auto_274854 ?auto_274855 ) ) ( not ( = ?auto_274854 ?auto_274856 ) ) ( not ( = ?auto_274854 ?auto_274857 ) ) ( not ( = ?auto_274854 ?auto_274858 ) ) ( not ( = ?auto_274854 ?auto_274859 ) ) ( not ( = ?auto_274854 ?auto_274860 ) ) ( not ( = ?auto_274854 ?auto_274861 ) ) ( not ( = ?auto_274854 ?auto_274862 ) ) ( not ( = ?auto_274854 ?auto_274863 ) ) ( not ( = ?auto_274854 ?auto_274864 ) ) ( not ( = ?auto_274854 ?auto_274865 ) ) ( not ( = ?auto_274854 ?auto_274866 ) ) ( not ( = ?auto_274855 ?auto_274856 ) ) ( not ( = ?auto_274855 ?auto_274857 ) ) ( not ( = ?auto_274855 ?auto_274858 ) ) ( not ( = ?auto_274855 ?auto_274859 ) ) ( not ( = ?auto_274855 ?auto_274860 ) ) ( not ( = ?auto_274855 ?auto_274861 ) ) ( not ( = ?auto_274855 ?auto_274862 ) ) ( not ( = ?auto_274855 ?auto_274863 ) ) ( not ( = ?auto_274855 ?auto_274864 ) ) ( not ( = ?auto_274855 ?auto_274865 ) ) ( not ( = ?auto_274855 ?auto_274866 ) ) ( not ( = ?auto_274856 ?auto_274857 ) ) ( not ( = ?auto_274856 ?auto_274858 ) ) ( not ( = ?auto_274856 ?auto_274859 ) ) ( not ( = ?auto_274856 ?auto_274860 ) ) ( not ( = ?auto_274856 ?auto_274861 ) ) ( not ( = ?auto_274856 ?auto_274862 ) ) ( not ( = ?auto_274856 ?auto_274863 ) ) ( not ( = ?auto_274856 ?auto_274864 ) ) ( not ( = ?auto_274856 ?auto_274865 ) ) ( not ( = ?auto_274856 ?auto_274866 ) ) ( not ( = ?auto_274857 ?auto_274858 ) ) ( not ( = ?auto_274857 ?auto_274859 ) ) ( not ( = ?auto_274857 ?auto_274860 ) ) ( not ( = ?auto_274857 ?auto_274861 ) ) ( not ( = ?auto_274857 ?auto_274862 ) ) ( not ( = ?auto_274857 ?auto_274863 ) ) ( not ( = ?auto_274857 ?auto_274864 ) ) ( not ( = ?auto_274857 ?auto_274865 ) ) ( not ( = ?auto_274857 ?auto_274866 ) ) ( not ( = ?auto_274858 ?auto_274859 ) ) ( not ( = ?auto_274858 ?auto_274860 ) ) ( not ( = ?auto_274858 ?auto_274861 ) ) ( not ( = ?auto_274858 ?auto_274862 ) ) ( not ( = ?auto_274858 ?auto_274863 ) ) ( not ( = ?auto_274858 ?auto_274864 ) ) ( not ( = ?auto_274858 ?auto_274865 ) ) ( not ( = ?auto_274858 ?auto_274866 ) ) ( not ( = ?auto_274859 ?auto_274860 ) ) ( not ( = ?auto_274859 ?auto_274861 ) ) ( not ( = ?auto_274859 ?auto_274862 ) ) ( not ( = ?auto_274859 ?auto_274863 ) ) ( not ( = ?auto_274859 ?auto_274864 ) ) ( not ( = ?auto_274859 ?auto_274865 ) ) ( not ( = ?auto_274859 ?auto_274866 ) ) ( not ( = ?auto_274860 ?auto_274861 ) ) ( not ( = ?auto_274860 ?auto_274862 ) ) ( not ( = ?auto_274860 ?auto_274863 ) ) ( not ( = ?auto_274860 ?auto_274864 ) ) ( not ( = ?auto_274860 ?auto_274865 ) ) ( not ( = ?auto_274860 ?auto_274866 ) ) ( not ( = ?auto_274861 ?auto_274862 ) ) ( not ( = ?auto_274861 ?auto_274863 ) ) ( not ( = ?auto_274861 ?auto_274864 ) ) ( not ( = ?auto_274861 ?auto_274865 ) ) ( not ( = ?auto_274861 ?auto_274866 ) ) ( not ( = ?auto_274862 ?auto_274863 ) ) ( not ( = ?auto_274862 ?auto_274864 ) ) ( not ( = ?auto_274862 ?auto_274865 ) ) ( not ( = ?auto_274862 ?auto_274866 ) ) ( not ( = ?auto_274863 ?auto_274864 ) ) ( not ( = ?auto_274863 ?auto_274865 ) ) ( not ( = ?auto_274863 ?auto_274866 ) ) ( not ( = ?auto_274864 ?auto_274865 ) ) ( not ( = ?auto_274864 ?auto_274866 ) ) ( not ( = ?auto_274865 ?auto_274866 ) ) ( ON ?auto_274864 ?auto_274865 ) ( ON ?auto_274863 ?auto_274864 ) ( ON ?auto_274862 ?auto_274863 ) ( ON ?auto_274861 ?auto_274862 ) ( ON ?auto_274860 ?auto_274861 ) ( ON ?auto_274859 ?auto_274860 ) ( ON ?auto_274858 ?auto_274859 ) ( ON ?auto_274857 ?auto_274858 ) ( ON ?auto_274856 ?auto_274857 ) ( ON ?auto_274855 ?auto_274856 ) ( ON ?auto_274854 ?auto_274855 ) ( ON ?auto_274853 ?auto_274854 ) ( CLEAR ?auto_274853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_274853 )
      ( MAKE-13PILE ?auto_274853 ?auto_274854 ?auto_274855 ?auto_274856 ?auto_274857 ?auto_274858 ?auto_274859 ?auto_274860 ?auto_274861 ?auto_274862 ?auto_274863 ?auto_274864 ?auto_274865 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_274880 - BLOCK
      ?auto_274881 - BLOCK
      ?auto_274882 - BLOCK
      ?auto_274883 - BLOCK
      ?auto_274884 - BLOCK
      ?auto_274885 - BLOCK
      ?auto_274886 - BLOCK
      ?auto_274887 - BLOCK
      ?auto_274888 - BLOCK
      ?auto_274889 - BLOCK
      ?auto_274890 - BLOCK
      ?auto_274891 - BLOCK
      ?auto_274892 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_274892 ) ( not ( = ?auto_274880 ?auto_274881 ) ) ( not ( = ?auto_274880 ?auto_274882 ) ) ( not ( = ?auto_274880 ?auto_274883 ) ) ( not ( = ?auto_274880 ?auto_274884 ) ) ( not ( = ?auto_274880 ?auto_274885 ) ) ( not ( = ?auto_274880 ?auto_274886 ) ) ( not ( = ?auto_274880 ?auto_274887 ) ) ( not ( = ?auto_274880 ?auto_274888 ) ) ( not ( = ?auto_274880 ?auto_274889 ) ) ( not ( = ?auto_274880 ?auto_274890 ) ) ( not ( = ?auto_274880 ?auto_274891 ) ) ( not ( = ?auto_274880 ?auto_274892 ) ) ( not ( = ?auto_274881 ?auto_274882 ) ) ( not ( = ?auto_274881 ?auto_274883 ) ) ( not ( = ?auto_274881 ?auto_274884 ) ) ( not ( = ?auto_274881 ?auto_274885 ) ) ( not ( = ?auto_274881 ?auto_274886 ) ) ( not ( = ?auto_274881 ?auto_274887 ) ) ( not ( = ?auto_274881 ?auto_274888 ) ) ( not ( = ?auto_274881 ?auto_274889 ) ) ( not ( = ?auto_274881 ?auto_274890 ) ) ( not ( = ?auto_274881 ?auto_274891 ) ) ( not ( = ?auto_274881 ?auto_274892 ) ) ( not ( = ?auto_274882 ?auto_274883 ) ) ( not ( = ?auto_274882 ?auto_274884 ) ) ( not ( = ?auto_274882 ?auto_274885 ) ) ( not ( = ?auto_274882 ?auto_274886 ) ) ( not ( = ?auto_274882 ?auto_274887 ) ) ( not ( = ?auto_274882 ?auto_274888 ) ) ( not ( = ?auto_274882 ?auto_274889 ) ) ( not ( = ?auto_274882 ?auto_274890 ) ) ( not ( = ?auto_274882 ?auto_274891 ) ) ( not ( = ?auto_274882 ?auto_274892 ) ) ( not ( = ?auto_274883 ?auto_274884 ) ) ( not ( = ?auto_274883 ?auto_274885 ) ) ( not ( = ?auto_274883 ?auto_274886 ) ) ( not ( = ?auto_274883 ?auto_274887 ) ) ( not ( = ?auto_274883 ?auto_274888 ) ) ( not ( = ?auto_274883 ?auto_274889 ) ) ( not ( = ?auto_274883 ?auto_274890 ) ) ( not ( = ?auto_274883 ?auto_274891 ) ) ( not ( = ?auto_274883 ?auto_274892 ) ) ( not ( = ?auto_274884 ?auto_274885 ) ) ( not ( = ?auto_274884 ?auto_274886 ) ) ( not ( = ?auto_274884 ?auto_274887 ) ) ( not ( = ?auto_274884 ?auto_274888 ) ) ( not ( = ?auto_274884 ?auto_274889 ) ) ( not ( = ?auto_274884 ?auto_274890 ) ) ( not ( = ?auto_274884 ?auto_274891 ) ) ( not ( = ?auto_274884 ?auto_274892 ) ) ( not ( = ?auto_274885 ?auto_274886 ) ) ( not ( = ?auto_274885 ?auto_274887 ) ) ( not ( = ?auto_274885 ?auto_274888 ) ) ( not ( = ?auto_274885 ?auto_274889 ) ) ( not ( = ?auto_274885 ?auto_274890 ) ) ( not ( = ?auto_274885 ?auto_274891 ) ) ( not ( = ?auto_274885 ?auto_274892 ) ) ( not ( = ?auto_274886 ?auto_274887 ) ) ( not ( = ?auto_274886 ?auto_274888 ) ) ( not ( = ?auto_274886 ?auto_274889 ) ) ( not ( = ?auto_274886 ?auto_274890 ) ) ( not ( = ?auto_274886 ?auto_274891 ) ) ( not ( = ?auto_274886 ?auto_274892 ) ) ( not ( = ?auto_274887 ?auto_274888 ) ) ( not ( = ?auto_274887 ?auto_274889 ) ) ( not ( = ?auto_274887 ?auto_274890 ) ) ( not ( = ?auto_274887 ?auto_274891 ) ) ( not ( = ?auto_274887 ?auto_274892 ) ) ( not ( = ?auto_274888 ?auto_274889 ) ) ( not ( = ?auto_274888 ?auto_274890 ) ) ( not ( = ?auto_274888 ?auto_274891 ) ) ( not ( = ?auto_274888 ?auto_274892 ) ) ( not ( = ?auto_274889 ?auto_274890 ) ) ( not ( = ?auto_274889 ?auto_274891 ) ) ( not ( = ?auto_274889 ?auto_274892 ) ) ( not ( = ?auto_274890 ?auto_274891 ) ) ( not ( = ?auto_274890 ?auto_274892 ) ) ( not ( = ?auto_274891 ?auto_274892 ) ) ( ON ?auto_274891 ?auto_274892 ) ( ON ?auto_274890 ?auto_274891 ) ( ON ?auto_274889 ?auto_274890 ) ( ON ?auto_274888 ?auto_274889 ) ( ON ?auto_274887 ?auto_274888 ) ( ON ?auto_274886 ?auto_274887 ) ( ON ?auto_274885 ?auto_274886 ) ( ON ?auto_274884 ?auto_274885 ) ( ON ?auto_274883 ?auto_274884 ) ( ON ?auto_274882 ?auto_274883 ) ( ON ?auto_274881 ?auto_274882 ) ( ON ?auto_274880 ?auto_274881 ) ( CLEAR ?auto_274880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_274880 )
      ( MAKE-13PILE ?auto_274880 ?auto_274881 ?auto_274882 ?auto_274883 ?auto_274884 ?auto_274885 ?auto_274886 ?auto_274887 ?auto_274888 ?auto_274889 ?auto_274890 ?auto_274891 ?auto_274892 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_274906 - BLOCK
      ?auto_274907 - BLOCK
      ?auto_274908 - BLOCK
      ?auto_274909 - BLOCK
      ?auto_274910 - BLOCK
      ?auto_274911 - BLOCK
      ?auto_274912 - BLOCK
      ?auto_274913 - BLOCK
      ?auto_274914 - BLOCK
      ?auto_274915 - BLOCK
      ?auto_274916 - BLOCK
      ?auto_274917 - BLOCK
      ?auto_274918 - BLOCK
    )
    :vars
    (
      ?auto_274919 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_274906 ?auto_274907 ) ) ( not ( = ?auto_274906 ?auto_274908 ) ) ( not ( = ?auto_274906 ?auto_274909 ) ) ( not ( = ?auto_274906 ?auto_274910 ) ) ( not ( = ?auto_274906 ?auto_274911 ) ) ( not ( = ?auto_274906 ?auto_274912 ) ) ( not ( = ?auto_274906 ?auto_274913 ) ) ( not ( = ?auto_274906 ?auto_274914 ) ) ( not ( = ?auto_274906 ?auto_274915 ) ) ( not ( = ?auto_274906 ?auto_274916 ) ) ( not ( = ?auto_274906 ?auto_274917 ) ) ( not ( = ?auto_274906 ?auto_274918 ) ) ( not ( = ?auto_274907 ?auto_274908 ) ) ( not ( = ?auto_274907 ?auto_274909 ) ) ( not ( = ?auto_274907 ?auto_274910 ) ) ( not ( = ?auto_274907 ?auto_274911 ) ) ( not ( = ?auto_274907 ?auto_274912 ) ) ( not ( = ?auto_274907 ?auto_274913 ) ) ( not ( = ?auto_274907 ?auto_274914 ) ) ( not ( = ?auto_274907 ?auto_274915 ) ) ( not ( = ?auto_274907 ?auto_274916 ) ) ( not ( = ?auto_274907 ?auto_274917 ) ) ( not ( = ?auto_274907 ?auto_274918 ) ) ( not ( = ?auto_274908 ?auto_274909 ) ) ( not ( = ?auto_274908 ?auto_274910 ) ) ( not ( = ?auto_274908 ?auto_274911 ) ) ( not ( = ?auto_274908 ?auto_274912 ) ) ( not ( = ?auto_274908 ?auto_274913 ) ) ( not ( = ?auto_274908 ?auto_274914 ) ) ( not ( = ?auto_274908 ?auto_274915 ) ) ( not ( = ?auto_274908 ?auto_274916 ) ) ( not ( = ?auto_274908 ?auto_274917 ) ) ( not ( = ?auto_274908 ?auto_274918 ) ) ( not ( = ?auto_274909 ?auto_274910 ) ) ( not ( = ?auto_274909 ?auto_274911 ) ) ( not ( = ?auto_274909 ?auto_274912 ) ) ( not ( = ?auto_274909 ?auto_274913 ) ) ( not ( = ?auto_274909 ?auto_274914 ) ) ( not ( = ?auto_274909 ?auto_274915 ) ) ( not ( = ?auto_274909 ?auto_274916 ) ) ( not ( = ?auto_274909 ?auto_274917 ) ) ( not ( = ?auto_274909 ?auto_274918 ) ) ( not ( = ?auto_274910 ?auto_274911 ) ) ( not ( = ?auto_274910 ?auto_274912 ) ) ( not ( = ?auto_274910 ?auto_274913 ) ) ( not ( = ?auto_274910 ?auto_274914 ) ) ( not ( = ?auto_274910 ?auto_274915 ) ) ( not ( = ?auto_274910 ?auto_274916 ) ) ( not ( = ?auto_274910 ?auto_274917 ) ) ( not ( = ?auto_274910 ?auto_274918 ) ) ( not ( = ?auto_274911 ?auto_274912 ) ) ( not ( = ?auto_274911 ?auto_274913 ) ) ( not ( = ?auto_274911 ?auto_274914 ) ) ( not ( = ?auto_274911 ?auto_274915 ) ) ( not ( = ?auto_274911 ?auto_274916 ) ) ( not ( = ?auto_274911 ?auto_274917 ) ) ( not ( = ?auto_274911 ?auto_274918 ) ) ( not ( = ?auto_274912 ?auto_274913 ) ) ( not ( = ?auto_274912 ?auto_274914 ) ) ( not ( = ?auto_274912 ?auto_274915 ) ) ( not ( = ?auto_274912 ?auto_274916 ) ) ( not ( = ?auto_274912 ?auto_274917 ) ) ( not ( = ?auto_274912 ?auto_274918 ) ) ( not ( = ?auto_274913 ?auto_274914 ) ) ( not ( = ?auto_274913 ?auto_274915 ) ) ( not ( = ?auto_274913 ?auto_274916 ) ) ( not ( = ?auto_274913 ?auto_274917 ) ) ( not ( = ?auto_274913 ?auto_274918 ) ) ( not ( = ?auto_274914 ?auto_274915 ) ) ( not ( = ?auto_274914 ?auto_274916 ) ) ( not ( = ?auto_274914 ?auto_274917 ) ) ( not ( = ?auto_274914 ?auto_274918 ) ) ( not ( = ?auto_274915 ?auto_274916 ) ) ( not ( = ?auto_274915 ?auto_274917 ) ) ( not ( = ?auto_274915 ?auto_274918 ) ) ( not ( = ?auto_274916 ?auto_274917 ) ) ( not ( = ?auto_274916 ?auto_274918 ) ) ( not ( = ?auto_274917 ?auto_274918 ) ) ( ON ?auto_274906 ?auto_274919 ) ( not ( = ?auto_274918 ?auto_274919 ) ) ( not ( = ?auto_274917 ?auto_274919 ) ) ( not ( = ?auto_274916 ?auto_274919 ) ) ( not ( = ?auto_274915 ?auto_274919 ) ) ( not ( = ?auto_274914 ?auto_274919 ) ) ( not ( = ?auto_274913 ?auto_274919 ) ) ( not ( = ?auto_274912 ?auto_274919 ) ) ( not ( = ?auto_274911 ?auto_274919 ) ) ( not ( = ?auto_274910 ?auto_274919 ) ) ( not ( = ?auto_274909 ?auto_274919 ) ) ( not ( = ?auto_274908 ?auto_274919 ) ) ( not ( = ?auto_274907 ?auto_274919 ) ) ( not ( = ?auto_274906 ?auto_274919 ) ) ( ON ?auto_274907 ?auto_274906 ) ( ON ?auto_274908 ?auto_274907 ) ( ON ?auto_274909 ?auto_274908 ) ( ON ?auto_274910 ?auto_274909 ) ( ON ?auto_274911 ?auto_274910 ) ( ON ?auto_274912 ?auto_274911 ) ( ON ?auto_274913 ?auto_274912 ) ( ON ?auto_274914 ?auto_274913 ) ( ON ?auto_274915 ?auto_274914 ) ( ON ?auto_274916 ?auto_274915 ) ( ON ?auto_274917 ?auto_274916 ) ( ON ?auto_274918 ?auto_274917 ) ( CLEAR ?auto_274918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_274918 ?auto_274917 ?auto_274916 ?auto_274915 ?auto_274914 ?auto_274913 ?auto_274912 ?auto_274911 ?auto_274910 ?auto_274909 ?auto_274908 ?auto_274907 ?auto_274906 )
      ( MAKE-13PILE ?auto_274906 ?auto_274907 ?auto_274908 ?auto_274909 ?auto_274910 ?auto_274911 ?auto_274912 ?auto_274913 ?auto_274914 ?auto_274915 ?auto_274916 ?auto_274917 ?auto_274918 ) )
  )

)

