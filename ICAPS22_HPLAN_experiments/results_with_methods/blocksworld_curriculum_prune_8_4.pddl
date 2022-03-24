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
      ?auto_34369 - BLOCK
    )
    :vars
    (
      ?auto_34370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34369 ?auto_34370 ) ( CLEAR ?auto_34369 ) ( HAND-EMPTY ) ( not ( = ?auto_34369 ?auto_34370 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34369 ?auto_34370 )
      ( !PUTDOWN ?auto_34369 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34376 - BLOCK
      ?auto_34377 - BLOCK
    )
    :vars
    (
      ?auto_34378 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_34376 ) ( ON ?auto_34377 ?auto_34378 ) ( CLEAR ?auto_34377 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34376 ) ( not ( = ?auto_34376 ?auto_34377 ) ) ( not ( = ?auto_34376 ?auto_34378 ) ) ( not ( = ?auto_34377 ?auto_34378 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34377 ?auto_34378 )
      ( !STACK ?auto_34377 ?auto_34376 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34386 - BLOCK
      ?auto_34387 - BLOCK
    )
    :vars
    (
      ?auto_34388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34387 ?auto_34388 ) ( not ( = ?auto_34386 ?auto_34387 ) ) ( not ( = ?auto_34386 ?auto_34388 ) ) ( not ( = ?auto_34387 ?auto_34388 ) ) ( ON ?auto_34386 ?auto_34387 ) ( CLEAR ?auto_34386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34386 )
      ( MAKE-2PILE ?auto_34386 ?auto_34387 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34397 - BLOCK
      ?auto_34398 - BLOCK
      ?auto_34399 - BLOCK
    )
    :vars
    (
      ?auto_34400 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_34398 ) ( ON ?auto_34399 ?auto_34400 ) ( CLEAR ?auto_34399 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34397 ) ( ON ?auto_34398 ?auto_34397 ) ( not ( = ?auto_34397 ?auto_34398 ) ) ( not ( = ?auto_34397 ?auto_34399 ) ) ( not ( = ?auto_34397 ?auto_34400 ) ) ( not ( = ?auto_34398 ?auto_34399 ) ) ( not ( = ?auto_34398 ?auto_34400 ) ) ( not ( = ?auto_34399 ?auto_34400 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34399 ?auto_34400 )
      ( !STACK ?auto_34399 ?auto_34398 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34411 - BLOCK
      ?auto_34412 - BLOCK
      ?auto_34413 - BLOCK
    )
    :vars
    (
      ?auto_34414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34413 ?auto_34414 ) ( ON-TABLE ?auto_34411 ) ( not ( = ?auto_34411 ?auto_34412 ) ) ( not ( = ?auto_34411 ?auto_34413 ) ) ( not ( = ?auto_34411 ?auto_34414 ) ) ( not ( = ?auto_34412 ?auto_34413 ) ) ( not ( = ?auto_34412 ?auto_34414 ) ) ( not ( = ?auto_34413 ?auto_34414 ) ) ( CLEAR ?auto_34411 ) ( ON ?auto_34412 ?auto_34413 ) ( CLEAR ?auto_34412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34411 ?auto_34412 )
      ( MAKE-3PILE ?auto_34411 ?auto_34412 ?auto_34413 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34425 - BLOCK
      ?auto_34426 - BLOCK
      ?auto_34427 - BLOCK
    )
    :vars
    (
      ?auto_34428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34427 ?auto_34428 ) ( not ( = ?auto_34425 ?auto_34426 ) ) ( not ( = ?auto_34425 ?auto_34427 ) ) ( not ( = ?auto_34425 ?auto_34428 ) ) ( not ( = ?auto_34426 ?auto_34427 ) ) ( not ( = ?auto_34426 ?auto_34428 ) ) ( not ( = ?auto_34427 ?auto_34428 ) ) ( ON ?auto_34426 ?auto_34427 ) ( ON ?auto_34425 ?auto_34426 ) ( CLEAR ?auto_34425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34425 )
      ( MAKE-3PILE ?auto_34425 ?auto_34426 ?auto_34427 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34440 - BLOCK
      ?auto_34441 - BLOCK
      ?auto_34442 - BLOCK
      ?auto_34443 - BLOCK
    )
    :vars
    (
      ?auto_34444 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_34442 ) ( ON ?auto_34443 ?auto_34444 ) ( CLEAR ?auto_34443 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34440 ) ( ON ?auto_34441 ?auto_34440 ) ( ON ?auto_34442 ?auto_34441 ) ( not ( = ?auto_34440 ?auto_34441 ) ) ( not ( = ?auto_34440 ?auto_34442 ) ) ( not ( = ?auto_34440 ?auto_34443 ) ) ( not ( = ?auto_34440 ?auto_34444 ) ) ( not ( = ?auto_34441 ?auto_34442 ) ) ( not ( = ?auto_34441 ?auto_34443 ) ) ( not ( = ?auto_34441 ?auto_34444 ) ) ( not ( = ?auto_34442 ?auto_34443 ) ) ( not ( = ?auto_34442 ?auto_34444 ) ) ( not ( = ?auto_34443 ?auto_34444 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34443 ?auto_34444 )
      ( !STACK ?auto_34443 ?auto_34442 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34458 - BLOCK
      ?auto_34459 - BLOCK
      ?auto_34460 - BLOCK
      ?auto_34461 - BLOCK
    )
    :vars
    (
      ?auto_34462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34461 ?auto_34462 ) ( ON-TABLE ?auto_34458 ) ( ON ?auto_34459 ?auto_34458 ) ( not ( = ?auto_34458 ?auto_34459 ) ) ( not ( = ?auto_34458 ?auto_34460 ) ) ( not ( = ?auto_34458 ?auto_34461 ) ) ( not ( = ?auto_34458 ?auto_34462 ) ) ( not ( = ?auto_34459 ?auto_34460 ) ) ( not ( = ?auto_34459 ?auto_34461 ) ) ( not ( = ?auto_34459 ?auto_34462 ) ) ( not ( = ?auto_34460 ?auto_34461 ) ) ( not ( = ?auto_34460 ?auto_34462 ) ) ( not ( = ?auto_34461 ?auto_34462 ) ) ( CLEAR ?auto_34459 ) ( ON ?auto_34460 ?auto_34461 ) ( CLEAR ?auto_34460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34458 ?auto_34459 ?auto_34460 )
      ( MAKE-4PILE ?auto_34458 ?auto_34459 ?auto_34460 ?auto_34461 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34476 - BLOCK
      ?auto_34477 - BLOCK
      ?auto_34478 - BLOCK
      ?auto_34479 - BLOCK
    )
    :vars
    (
      ?auto_34480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34479 ?auto_34480 ) ( ON-TABLE ?auto_34476 ) ( not ( = ?auto_34476 ?auto_34477 ) ) ( not ( = ?auto_34476 ?auto_34478 ) ) ( not ( = ?auto_34476 ?auto_34479 ) ) ( not ( = ?auto_34476 ?auto_34480 ) ) ( not ( = ?auto_34477 ?auto_34478 ) ) ( not ( = ?auto_34477 ?auto_34479 ) ) ( not ( = ?auto_34477 ?auto_34480 ) ) ( not ( = ?auto_34478 ?auto_34479 ) ) ( not ( = ?auto_34478 ?auto_34480 ) ) ( not ( = ?auto_34479 ?auto_34480 ) ) ( ON ?auto_34478 ?auto_34479 ) ( CLEAR ?auto_34476 ) ( ON ?auto_34477 ?auto_34478 ) ( CLEAR ?auto_34477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34476 ?auto_34477 )
      ( MAKE-4PILE ?auto_34476 ?auto_34477 ?auto_34478 ?auto_34479 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34494 - BLOCK
      ?auto_34495 - BLOCK
      ?auto_34496 - BLOCK
      ?auto_34497 - BLOCK
    )
    :vars
    (
      ?auto_34498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34497 ?auto_34498 ) ( not ( = ?auto_34494 ?auto_34495 ) ) ( not ( = ?auto_34494 ?auto_34496 ) ) ( not ( = ?auto_34494 ?auto_34497 ) ) ( not ( = ?auto_34494 ?auto_34498 ) ) ( not ( = ?auto_34495 ?auto_34496 ) ) ( not ( = ?auto_34495 ?auto_34497 ) ) ( not ( = ?auto_34495 ?auto_34498 ) ) ( not ( = ?auto_34496 ?auto_34497 ) ) ( not ( = ?auto_34496 ?auto_34498 ) ) ( not ( = ?auto_34497 ?auto_34498 ) ) ( ON ?auto_34496 ?auto_34497 ) ( ON ?auto_34495 ?auto_34496 ) ( ON ?auto_34494 ?auto_34495 ) ( CLEAR ?auto_34494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34494 )
      ( MAKE-4PILE ?auto_34494 ?auto_34495 ?auto_34496 ?auto_34497 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34513 - BLOCK
      ?auto_34514 - BLOCK
      ?auto_34515 - BLOCK
      ?auto_34516 - BLOCK
      ?auto_34517 - BLOCK
    )
    :vars
    (
      ?auto_34518 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_34516 ) ( ON ?auto_34517 ?auto_34518 ) ( CLEAR ?auto_34517 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34513 ) ( ON ?auto_34514 ?auto_34513 ) ( ON ?auto_34515 ?auto_34514 ) ( ON ?auto_34516 ?auto_34515 ) ( not ( = ?auto_34513 ?auto_34514 ) ) ( not ( = ?auto_34513 ?auto_34515 ) ) ( not ( = ?auto_34513 ?auto_34516 ) ) ( not ( = ?auto_34513 ?auto_34517 ) ) ( not ( = ?auto_34513 ?auto_34518 ) ) ( not ( = ?auto_34514 ?auto_34515 ) ) ( not ( = ?auto_34514 ?auto_34516 ) ) ( not ( = ?auto_34514 ?auto_34517 ) ) ( not ( = ?auto_34514 ?auto_34518 ) ) ( not ( = ?auto_34515 ?auto_34516 ) ) ( not ( = ?auto_34515 ?auto_34517 ) ) ( not ( = ?auto_34515 ?auto_34518 ) ) ( not ( = ?auto_34516 ?auto_34517 ) ) ( not ( = ?auto_34516 ?auto_34518 ) ) ( not ( = ?auto_34517 ?auto_34518 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34517 ?auto_34518 )
      ( !STACK ?auto_34517 ?auto_34516 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34535 - BLOCK
      ?auto_34536 - BLOCK
      ?auto_34537 - BLOCK
      ?auto_34538 - BLOCK
      ?auto_34539 - BLOCK
    )
    :vars
    (
      ?auto_34540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34539 ?auto_34540 ) ( ON-TABLE ?auto_34535 ) ( ON ?auto_34536 ?auto_34535 ) ( ON ?auto_34537 ?auto_34536 ) ( not ( = ?auto_34535 ?auto_34536 ) ) ( not ( = ?auto_34535 ?auto_34537 ) ) ( not ( = ?auto_34535 ?auto_34538 ) ) ( not ( = ?auto_34535 ?auto_34539 ) ) ( not ( = ?auto_34535 ?auto_34540 ) ) ( not ( = ?auto_34536 ?auto_34537 ) ) ( not ( = ?auto_34536 ?auto_34538 ) ) ( not ( = ?auto_34536 ?auto_34539 ) ) ( not ( = ?auto_34536 ?auto_34540 ) ) ( not ( = ?auto_34537 ?auto_34538 ) ) ( not ( = ?auto_34537 ?auto_34539 ) ) ( not ( = ?auto_34537 ?auto_34540 ) ) ( not ( = ?auto_34538 ?auto_34539 ) ) ( not ( = ?auto_34538 ?auto_34540 ) ) ( not ( = ?auto_34539 ?auto_34540 ) ) ( CLEAR ?auto_34537 ) ( ON ?auto_34538 ?auto_34539 ) ( CLEAR ?auto_34538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34535 ?auto_34536 ?auto_34537 ?auto_34538 )
      ( MAKE-5PILE ?auto_34535 ?auto_34536 ?auto_34537 ?auto_34538 ?auto_34539 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34557 - BLOCK
      ?auto_34558 - BLOCK
      ?auto_34559 - BLOCK
      ?auto_34560 - BLOCK
      ?auto_34561 - BLOCK
    )
    :vars
    (
      ?auto_34562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34561 ?auto_34562 ) ( ON-TABLE ?auto_34557 ) ( ON ?auto_34558 ?auto_34557 ) ( not ( = ?auto_34557 ?auto_34558 ) ) ( not ( = ?auto_34557 ?auto_34559 ) ) ( not ( = ?auto_34557 ?auto_34560 ) ) ( not ( = ?auto_34557 ?auto_34561 ) ) ( not ( = ?auto_34557 ?auto_34562 ) ) ( not ( = ?auto_34558 ?auto_34559 ) ) ( not ( = ?auto_34558 ?auto_34560 ) ) ( not ( = ?auto_34558 ?auto_34561 ) ) ( not ( = ?auto_34558 ?auto_34562 ) ) ( not ( = ?auto_34559 ?auto_34560 ) ) ( not ( = ?auto_34559 ?auto_34561 ) ) ( not ( = ?auto_34559 ?auto_34562 ) ) ( not ( = ?auto_34560 ?auto_34561 ) ) ( not ( = ?auto_34560 ?auto_34562 ) ) ( not ( = ?auto_34561 ?auto_34562 ) ) ( ON ?auto_34560 ?auto_34561 ) ( CLEAR ?auto_34558 ) ( ON ?auto_34559 ?auto_34560 ) ( CLEAR ?auto_34559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34557 ?auto_34558 ?auto_34559 )
      ( MAKE-5PILE ?auto_34557 ?auto_34558 ?auto_34559 ?auto_34560 ?auto_34561 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34579 - BLOCK
      ?auto_34580 - BLOCK
      ?auto_34581 - BLOCK
      ?auto_34582 - BLOCK
      ?auto_34583 - BLOCK
    )
    :vars
    (
      ?auto_34584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34583 ?auto_34584 ) ( ON-TABLE ?auto_34579 ) ( not ( = ?auto_34579 ?auto_34580 ) ) ( not ( = ?auto_34579 ?auto_34581 ) ) ( not ( = ?auto_34579 ?auto_34582 ) ) ( not ( = ?auto_34579 ?auto_34583 ) ) ( not ( = ?auto_34579 ?auto_34584 ) ) ( not ( = ?auto_34580 ?auto_34581 ) ) ( not ( = ?auto_34580 ?auto_34582 ) ) ( not ( = ?auto_34580 ?auto_34583 ) ) ( not ( = ?auto_34580 ?auto_34584 ) ) ( not ( = ?auto_34581 ?auto_34582 ) ) ( not ( = ?auto_34581 ?auto_34583 ) ) ( not ( = ?auto_34581 ?auto_34584 ) ) ( not ( = ?auto_34582 ?auto_34583 ) ) ( not ( = ?auto_34582 ?auto_34584 ) ) ( not ( = ?auto_34583 ?auto_34584 ) ) ( ON ?auto_34582 ?auto_34583 ) ( ON ?auto_34581 ?auto_34582 ) ( CLEAR ?auto_34579 ) ( ON ?auto_34580 ?auto_34581 ) ( CLEAR ?auto_34580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34579 ?auto_34580 )
      ( MAKE-5PILE ?auto_34579 ?auto_34580 ?auto_34581 ?auto_34582 ?auto_34583 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34601 - BLOCK
      ?auto_34602 - BLOCK
      ?auto_34603 - BLOCK
      ?auto_34604 - BLOCK
      ?auto_34605 - BLOCK
    )
    :vars
    (
      ?auto_34606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34605 ?auto_34606 ) ( not ( = ?auto_34601 ?auto_34602 ) ) ( not ( = ?auto_34601 ?auto_34603 ) ) ( not ( = ?auto_34601 ?auto_34604 ) ) ( not ( = ?auto_34601 ?auto_34605 ) ) ( not ( = ?auto_34601 ?auto_34606 ) ) ( not ( = ?auto_34602 ?auto_34603 ) ) ( not ( = ?auto_34602 ?auto_34604 ) ) ( not ( = ?auto_34602 ?auto_34605 ) ) ( not ( = ?auto_34602 ?auto_34606 ) ) ( not ( = ?auto_34603 ?auto_34604 ) ) ( not ( = ?auto_34603 ?auto_34605 ) ) ( not ( = ?auto_34603 ?auto_34606 ) ) ( not ( = ?auto_34604 ?auto_34605 ) ) ( not ( = ?auto_34604 ?auto_34606 ) ) ( not ( = ?auto_34605 ?auto_34606 ) ) ( ON ?auto_34604 ?auto_34605 ) ( ON ?auto_34603 ?auto_34604 ) ( ON ?auto_34602 ?auto_34603 ) ( ON ?auto_34601 ?auto_34602 ) ( CLEAR ?auto_34601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34601 )
      ( MAKE-5PILE ?auto_34601 ?auto_34602 ?auto_34603 ?auto_34604 ?auto_34605 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_34624 - BLOCK
      ?auto_34625 - BLOCK
      ?auto_34626 - BLOCK
      ?auto_34627 - BLOCK
      ?auto_34628 - BLOCK
      ?auto_34629 - BLOCK
    )
    :vars
    (
      ?auto_34630 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_34628 ) ( ON ?auto_34629 ?auto_34630 ) ( CLEAR ?auto_34629 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34624 ) ( ON ?auto_34625 ?auto_34624 ) ( ON ?auto_34626 ?auto_34625 ) ( ON ?auto_34627 ?auto_34626 ) ( ON ?auto_34628 ?auto_34627 ) ( not ( = ?auto_34624 ?auto_34625 ) ) ( not ( = ?auto_34624 ?auto_34626 ) ) ( not ( = ?auto_34624 ?auto_34627 ) ) ( not ( = ?auto_34624 ?auto_34628 ) ) ( not ( = ?auto_34624 ?auto_34629 ) ) ( not ( = ?auto_34624 ?auto_34630 ) ) ( not ( = ?auto_34625 ?auto_34626 ) ) ( not ( = ?auto_34625 ?auto_34627 ) ) ( not ( = ?auto_34625 ?auto_34628 ) ) ( not ( = ?auto_34625 ?auto_34629 ) ) ( not ( = ?auto_34625 ?auto_34630 ) ) ( not ( = ?auto_34626 ?auto_34627 ) ) ( not ( = ?auto_34626 ?auto_34628 ) ) ( not ( = ?auto_34626 ?auto_34629 ) ) ( not ( = ?auto_34626 ?auto_34630 ) ) ( not ( = ?auto_34627 ?auto_34628 ) ) ( not ( = ?auto_34627 ?auto_34629 ) ) ( not ( = ?auto_34627 ?auto_34630 ) ) ( not ( = ?auto_34628 ?auto_34629 ) ) ( not ( = ?auto_34628 ?auto_34630 ) ) ( not ( = ?auto_34629 ?auto_34630 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34629 ?auto_34630 )
      ( !STACK ?auto_34629 ?auto_34628 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_34650 - BLOCK
      ?auto_34651 - BLOCK
      ?auto_34652 - BLOCK
      ?auto_34653 - BLOCK
      ?auto_34654 - BLOCK
      ?auto_34655 - BLOCK
    )
    :vars
    (
      ?auto_34656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34655 ?auto_34656 ) ( ON-TABLE ?auto_34650 ) ( ON ?auto_34651 ?auto_34650 ) ( ON ?auto_34652 ?auto_34651 ) ( ON ?auto_34653 ?auto_34652 ) ( not ( = ?auto_34650 ?auto_34651 ) ) ( not ( = ?auto_34650 ?auto_34652 ) ) ( not ( = ?auto_34650 ?auto_34653 ) ) ( not ( = ?auto_34650 ?auto_34654 ) ) ( not ( = ?auto_34650 ?auto_34655 ) ) ( not ( = ?auto_34650 ?auto_34656 ) ) ( not ( = ?auto_34651 ?auto_34652 ) ) ( not ( = ?auto_34651 ?auto_34653 ) ) ( not ( = ?auto_34651 ?auto_34654 ) ) ( not ( = ?auto_34651 ?auto_34655 ) ) ( not ( = ?auto_34651 ?auto_34656 ) ) ( not ( = ?auto_34652 ?auto_34653 ) ) ( not ( = ?auto_34652 ?auto_34654 ) ) ( not ( = ?auto_34652 ?auto_34655 ) ) ( not ( = ?auto_34652 ?auto_34656 ) ) ( not ( = ?auto_34653 ?auto_34654 ) ) ( not ( = ?auto_34653 ?auto_34655 ) ) ( not ( = ?auto_34653 ?auto_34656 ) ) ( not ( = ?auto_34654 ?auto_34655 ) ) ( not ( = ?auto_34654 ?auto_34656 ) ) ( not ( = ?auto_34655 ?auto_34656 ) ) ( CLEAR ?auto_34653 ) ( ON ?auto_34654 ?auto_34655 ) ( CLEAR ?auto_34654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_34650 ?auto_34651 ?auto_34652 ?auto_34653 ?auto_34654 )
      ( MAKE-6PILE ?auto_34650 ?auto_34651 ?auto_34652 ?auto_34653 ?auto_34654 ?auto_34655 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_34676 - BLOCK
      ?auto_34677 - BLOCK
      ?auto_34678 - BLOCK
      ?auto_34679 - BLOCK
      ?auto_34680 - BLOCK
      ?auto_34681 - BLOCK
    )
    :vars
    (
      ?auto_34682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34681 ?auto_34682 ) ( ON-TABLE ?auto_34676 ) ( ON ?auto_34677 ?auto_34676 ) ( ON ?auto_34678 ?auto_34677 ) ( not ( = ?auto_34676 ?auto_34677 ) ) ( not ( = ?auto_34676 ?auto_34678 ) ) ( not ( = ?auto_34676 ?auto_34679 ) ) ( not ( = ?auto_34676 ?auto_34680 ) ) ( not ( = ?auto_34676 ?auto_34681 ) ) ( not ( = ?auto_34676 ?auto_34682 ) ) ( not ( = ?auto_34677 ?auto_34678 ) ) ( not ( = ?auto_34677 ?auto_34679 ) ) ( not ( = ?auto_34677 ?auto_34680 ) ) ( not ( = ?auto_34677 ?auto_34681 ) ) ( not ( = ?auto_34677 ?auto_34682 ) ) ( not ( = ?auto_34678 ?auto_34679 ) ) ( not ( = ?auto_34678 ?auto_34680 ) ) ( not ( = ?auto_34678 ?auto_34681 ) ) ( not ( = ?auto_34678 ?auto_34682 ) ) ( not ( = ?auto_34679 ?auto_34680 ) ) ( not ( = ?auto_34679 ?auto_34681 ) ) ( not ( = ?auto_34679 ?auto_34682 ) ) ( not ( = ?auto_34680 ?auto_34681 ) ) ( not ( = ?auto_34680 ?auto_34682 ) ) ( not ( = ?auto_34681 ?auto_34682 ) ) ( ON ?auto_34680 ?auto_34681 ) ( CLEAR ?auto_34678 ) ( ON ?auto_34679 ?auto_34680 ) ( CLEAR ?auto_34679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34676 ?auto_34677 ?auto_34678 ?auto_34679 )
      ( MAKE-6PILE ?auto_34676 ?auto_34677 ?auto_34678 ?auto_34679 ?auto_34680 ?auto_34681 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_34702 - BLOCK
      ?auto_34703 - BLOCK
      ?auto_34704 - BLOCK
      ?auto_34705 - BLOCK
      ?auto_34706 - BLOCK
      ?auto_34707 - BLOCK
    )
    :vars
    (
      ?auto_34708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34707 ?auto_34708 ) ( ON-TABLE ?auto_34702 ) ( ON ?auto_34703 ?auto_34702 ) ( not ( = ?auto_34702 ?auto_34703 ) ) ( not ( = ?auto_34702 ?auto_34704 ) ) ( not ( = ?auto_34702 ?auto_34705 ) ) ( not ( = ?auto_34702 ?auto_34706 ) ) ( not ( = ?auto_34702 ?auto_34707 ) ) ( not ( = ?auto_34702 ?auto_34708 ) ) ( not ( = ?auto_34703 ?auto_34704 ) ) ( not ( = ?auto_34703 ?auto_34705 ) ) ( not ( = ?auto_34703 ?auto_34706 ) ) ( not ( = ?auto_34703 ?auto_34707 ) ) ( not ( = ?auto_34703 ?auto_34708 ) ) ( not ( = ?auto_34704 ?auto_34705 ) ) ( not ( = ?auto_34704 ?auto_34706 ) ) ( not ( = ?auto_34704 ?auto_34707 ) ) ( not ( = ?auto_34704 ?auto_34708 ) ) ( not ( = ?auto_34705 ?auto_34706 ) ) ( not ( = ?auto_34705 ?auto_34707 ) ) ( not ( = ?auto_34705 ?auto_34708 ) ) ( not ( = ?auto_34706 ?auto_34707 ) ) ( not ( = ?auto_34706 ?auto_34708 ) ) ( not ( = ?auto_34707 ?auto_34708 ) ) ( ON ?auto_34706 ?auto_34707 ) ( ON ?auto_34705 ?auto_34706 ) ( CLEAR ?auto_34703 ) ( ON ?auto_34704 ?auto_34705 ) ( CLEAR ?auto_34704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34702 ?auto_34703 ?auto_34704 )
      ( MAKE-6PILE ?auto_34702 ?auto_34703 ?auto_34704 ?auto_34705 ?auto_34706 ?auto_34707 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_34728 - BLOCK
      ?auto_34729 - BLOCK
      ?auto_34730 - BLOCK
      ?auto_34731 - BLOCK
      ?auto_34732 - BLOCK
      ?auto_34733 - BLOCK
    )
    :vars
    (
      ?auto_34734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34733 ?auto_34734 ) ( ON-TABLE ?auto_34728 ) ( not ( = ?auto_34728 ?auto_34729 ) ) ( not ( = ?auto_34728 ?auto_34730 ) ) ( not ( = ?auto_34728 ?auto_34731 ) ) ( not ( = ?auto_34728 ?auto_34732 ) ) ( not ( = ?auto_34728 ?auto_34733 ) ) ( not ( = ?auto_34728 ?auto_34734 ) ) ( not ( = ?auto_34729 ?auto_34730 ) ) ( not ( = ?auto_34729 ?auto_34731 ) ) ( not ( = ?auto_34729 ?auto_34732 ) ) ( not ( = ?auto_34729 ?auto_34733 ) ) ( not ( = ?auto_34729 ?auto_34734 ) ) ( not ( = ?auto_34730 ?auto_34731 ) ) ( not ( = ?auto_34730 ?auto_34732 ) ) ( not ( = ?auto_34730 ?auto_34733 ) ) ( not ( = ?auto_34730 ?auto_34734 ) ) ( not ( = ?auto_34731 ?auto_34732 ) ) ( not ( = ?auto_34731 ?auto_34733 ) ) ( not ( = ?auto_34731 ?auto_34734 ) ) ( not ( = ?auto_34732 ?auto_34733 ) ) ( not ( = ?auto_34732 ?auto_34734 ) ) ( not ( = ?auto_34733 ?auto_34734 ) ) ( ON ?auto_34732 ?auto_34733 ) ( ON ?auto_34731 ?auto_34732 ) ( ON ?auto_34730 ?auto_34731 ) ( CLEAR ?auto_34728 ) ( ON ?auto_34729 ?auto_34730 ) ( CLEAR ?auto_34729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34728 ?auto_34729 )
      ( MAKE-6PILE ?auto_34728 ?auto_34729 ?auto_34730 ?auto_34731 ?auto_34732 ?auto_34733 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_34754 - BLOCK
      ?auto_34755 - BLOCK
      ?auto_34756 - BLOCK
      ?auto_34757 - BLOCK
      ?auto_34758 - BLOCK
      ?auto_34759 - BLOCK
    )
    :vars
    (
      ?auto_34760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34759 ?auto_34760 ) ( not ( = ?auto_34754 ?auto_34755 ) ) ( not ( = ?auto_34754 ?auto_34756 ) ) ( not ( = ?auto_34754 ?auto_34757 ) ) ( not ( = ?auto_34754 ?auto_34758 ) ) ( not ( = ?auto_34754 ?auto_34759 ) ) ( not ( = ?auto_34754 ?auto_34760 ) ) ( not ( = ?auto_34755 ?auto_34756 ) ) ( not ( = ?auto_34755 ?auto_34757 ) ) ( not ( = ?auto_34755 ?auto_34758 ) ) ( not ( = ?auto_34755 ?auto_34759 ) ) ( not ( = ?auto_34755 ?auto_34760 ) ) ( not ( = ?auto_34756 ?auto_34757 ) ) ( not ( = ?auto_34756 ?auto_34758 ) ) ( not ( = ?auto_34756 ?auto_34759 ) ) ( not ( = ?auto_34756 ?auto_34760 ) ) ( not ( = ?auto_34757 ?auto_34758 ) ) ( not ( = ?auto_34757 ?auto_34759 ) ) ( not ( = ?auto_34757 ?auto_34760 ) ) ( not ( = ?auto_34758 ?auto_34759 ) ) ( not ( = ?auto_34758 ?auto_34760 ) ) ( not ( = ?auto_34759 ?auto_34760 ) ) ( ON ?auto_34758 ?auto_34759 ) ( ON ?auto_34757 ?auto_34758 ) ( ON ?auto_34756 ?auto_34757 ) ( ON ?auto_34755 ?auto_34756 ) ( ON ?auto_34754 ?auto_34755 ) ( CLEAR ?auto_34754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34754 )
      ( MAKE-6PILE ?auto_34754 ?auto_34755 ?auto_34756 ?auto_34757 ?auto_34758 ?auto_34759 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_34781 - BLOCK
      ?auto_34782 - BLOCK
      ?auto_34783 - BLOCK
      ?auto_34784 - BLOCK
      ?auto_34785 - BLOCK
      ?auto_34786 - BLOCK
      ?auto_34787 - BLOCK
    )
    :vars
    (
      ?auto_34788 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_34786 ) ( ON ?auto_34787 ?auto_34788 ) ( CLEAR ?auto_34787 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34781 ) ( ON ?auto_34782 ?auto_34781 ) ( ON ?auto_34783 ?auto_34782 ) ( ON ?auto_34784 ?auto_34783 ) ( ON ?auto_34785 ?auto_34784 ) ( ON ?auto_34786 ?auto_34785 ) ( not ( = ?auto_34781 ?auto_34782 ) ) ( not ( = ?auto_34781 ?auto_34783 ) ) ( not ( = ?auto_34781 ?auto_34784 ) ) ( not ( = ?auto_34781 ?auto_34785 ) ) ( not ( = ?auto_34781 ?auto_34786 ) ) ( not ( = ?auto_34781 ?auto_34787 ) ) ( not ( = ?auto_34781 ?auto_34788 ) ) ( not ( = ?auto_34782 ?auto_34783 ) ) ( not ( = ?auto_34782 ?auto_34784 ) ) ( not ( = ?auto_34782 ?auto_34785 ) ) ( not ( = ?auto_34782 ?auto_34786 ) ) ( not ( = ?auto_34782 ?auto_34787 ) ) ( not ( = ?auto_34782 ?auto_34788 ) ) ( not ( = ?auto_34783 ?auto_34784 ) ) ( not ( = ?auto_34783 ?auto_34785 ) ) ( not ( = ?auto_34783 ?auto_34786 ) ) ( not ( = ?auto_34783 ?auto_34787 ) ) ( not ( = ?auto_34783 ?auto_34788 ) ) ( not ( = ?auto_34784 ?auto_34785 ) ) ( not ( = ?auto_34784 ?auto_34786 ) ) ( not ( = ?auto_34784 ?auto_34787 ) ) ( not ( = ?auto_34784 ?auto_34788 ) ) ( not ( = ?auto_34785 ?auto_34786 ) ) ( not ( = ?auto_34785 ?auto_34787 ) ) ( not ( = ?auto_34785 ?auto_34788 ) ) ( not ( = ?auto_34786 ?auto_34787 ) ) ( not ( = ?auto_34786 ?auto_34788 ) ) ( not ( = ?auto_34787 ?auto_34788 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34787 ?auto_34788 )
      ( !STACK ?auto_34787 ?auto_34786 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_34811 - BLOCK
      ?auto_34812 - BLOCK
      ?auto_34813 - BLOCK
      ?auto_34814 - BLOCK
      ?auto_34815 - BLOCK
      ?auto_34816 - BLOCK
      ?auto_34817 - BLOCK
    )
    :vars
    (
      ?auto_34818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34817 ?auto_34818 ) ( ON-TABLE ?auto_34811 ) ( ON ?auto_34812 ?auto_34811 ) ( ON ?auto_34813 ?auto_34812 ) ( ON ?auto_34814 ?auto_34813 ) ( ON ?auto_34815 ?auto_34814 ) ( not ( = ?auto_34811 ?auto_34812 ) ) ( not ( = ?auto_34811 ?auto_34813 ) ) ( not ( = ?auto_34811 ?auto_34814 ) ) ( not ( = ?auto_34811 ?auto_34815 ) ) ( not ( = ?auto_34811 ?auto_34816 ) ) ( not ( = ?auto_34811 ?auto_34817 ) ) ( not ( = ?auto_34811 ?auto_34818 ) ) ( not ( = ?auto_34812 ?auto_34813 ) ) ( not ( = ?auto_34812 ?auto_34814 ) ) ( not ( = ?auto_34812 ?auto_34815 ) ) ( not ( = ?auto_34812 ?auto_34816 ) ) ( not ( = ?auto_34812 ?auto_34817 ) ) ( not ( = ?auto_34812 ?auto_34818 ) ) ( not ( = ?auto_34813 ?auto_34814 ) ) ( not ( = ?auto_34813 ?auto_34815 ) ) ( not ( = ?auto_34813 ?auto_34816 ) ) ( not ( = ?auto_34813 ?auto_34817 ) ) ( not ( = ?auto_34813 ?auto_34818 ) ) ( not ( = ?auto_34814 ?auto_34815 ) ) ( not ( = ?auto_34814 ?auto_34816 ) ) ( not ( = ?auto_34814 ?auto_34817 ) ) ( not ( = ?auto_34814 ?auto_34818 ) ) ( not ( = ?auto_34815 ?auto_34816 ) ) ( not ( = ?auto_34815 ?auto_34817 ) ) ( not ( = ?auto_34815 ?auto_34818 ) ) ( not ( = ?auto_34816 ?auto_34817 ) ) ( not ( = ?auto_34816 ?auto_34818 ) ) ( not ( = ?auto_34817 ?auto_34818 ) ) ( CLEAR ?auto_34815 ) ( ON ?auto_34816 ?auto_34817 ) ( CLEAR ?auto_34816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_34811 ?auto_34812 ?auto_34813 ?auto_34814 ?auto_34815 ?auto_34816 )
      ( MAKE-7PILE ?auto_34811 ?auto_34812 ?auto_34813 ?auto_34814 ?auto_34815 ?auto_34816 ?auto_34817 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_34841 - BLOCK
      ?auto_34842 - BLOCK
      ?auto_34843 - BLOCK
      ?auto_34844 - BLOCK
      ?auto_34845 - BLOCK
      ?auto_34846 - BLOCK
      ?auto_34847 - BLOCK
    )
    :vars
    (
      ?auto_34848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34847 ?auto_34848 ) ( ON-TABLE ?auto_34841 ) ( ON ?auto_34842 ?auto_34841 ) ( ON ?auto_34843 ?auto_34842 ) ( ON ?auto_34844 ?auto_34843 ) ( not ( = ?auto_34841 ?auto_34842 ) ) ( not ( = ?auto_34841 ?auto_34843 ) ) ( not ( = ?auto_34841 ?auto_34844 ) ) ( not ( = ?auto_34841 ?auto_34845 ) ) ( not ( = ?auto_34841 ?auto_34846 ) ) ( not ( = ?auto_34841 ?auto_34847 ) ) ( not ( = ?auto_34841 ?auto_34848 ) ) ( not ( = ?auto_34842 ?auto_34843 ) ) ( not ( = ?auto_34842 ?auto_34844 ) ) ( not ( = ?auto_34842 ?auto_34845 ) ) ( not ( = ?auto_34842 ?auto_34846 ) ) ( not ( = ?auto_34842 ?auto_34847 ) ) ( not ( = ?auto_34842 ?auto_34848 ) ) ( not ( = ?auto_34843 ?auto_34844 ) ) ( not ( = ?auto_34843 ?auto_34845 ) ) ( not ( = ?auto_34843 ?auto_34846 ) ) ( not ( = ?auto_34843 ?auto_34847 ) ) ( not ( = ?auto_34843 ?auto_34848 ) ) ( not ( = ?auto_34844 ?auto_34845 ) ) ( not ( = ?auto_34844 ?auto_34846 ) ) ( not ( = ?auto_34844 ?auto_34847 ) ) ( not ( = ?auto_34844 ?auto_34848 ) ) ( not ( = ?auto_34845 ?auto_34846 ) ) ( not ( = ?auto_34845 ?auto_34847 ) ) ( not ( = ?auto_34845 ?auto_34848 ) ) ( not ( = ?auto_34846 ?auto_34847 ) ) ( not ( = ?auto_34846 ?auto_34848 ) ) ( not ( = ?auto_34847 ?auto_34848 ) ) ( ON ?auto_34846 ?auto_34847 ) ( CLEAR ?auto_34844 ) ( ON ?auto_34845 ?auto_34846 ) ( CLEAR ?auto_34845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_34841 ?auto_34842 ?auto_34843 ?auto_34844 ?auto_34845 )
      ( MAKE-7PILE ?auto_34841 ?auto_34842 ?auto_34843 ?auto_34844 ?auto_34845 ?auto_34846 ?auto_34847 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_34871 - BLOCK
      ?auto_34872 - BLOCK
      ?auto_34873 - BLOCK
      ?auto_34874 - BLOCK
      ?auto_34875 - BLOCK
      ?auto_34876 - BLOCK
      ?auto_34877 - BLOCK
    )
    :vars
    (
      ?auto_34878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34877 ?auto_34878 ) ( ON-TABLE ?auto_34871 ) ( ON ?auto_34872 ?auto_34871 ) ( ON ?auto_34873 ?auto_34872 ) ( not ( = ?auto_34871 ?auto_34872 ) ) ( not ( = ?auto_34871 ?auto_34873 ) ) ( not ( = ?auto_34871 ?auto_34874 ) ) ( not ( = ?auto_34871 ?auto_34875 ) ) ( not ( = ?auto_34871 ?auto_34876 ) ) ( not ( = ?auto_34871 ?auto_34877 ) ) ( not ( = ?auto_34871 ?auto_34878 ) ) ( not ( = ?auto_34872 ?auto_34873 ) ) ( not ( = ?auto_34872 ?auto_34874 ) ) ( not ( = ?auto_34872 ?auto_34875 ) ) ( not ( = ?auto_34872 ?auto_34876 ) ) ( not ( = ?auto_34872 ?auto_34877 ) ) ( not ( = ?auto_34872 ?auto_34878 ) ) ( not ( = ?auto_34873 ?auto_34874 ) ) ( not ( = ?auto_34873 ?auto_34875 ) ) ( not ( = ?auto_34873 ?auto_34876 ) ) ( not ( = ?auto_34873 ?auto_34877 ) ) ( not ( = ?auto_34873 ?auto_34878 ) ) ( not ( = ?auto_34874 ?auto_34875 ) ) ( not ( = ?auto_34874 ?auto_34876 ) ) ( not ( = ?auto_34874 ?auto_34877 ) ) ( not ( = ?auto_34874 ?auto_34878 ) ) ( not ( = ?auto_34875 ?auto_34876 ) ) ( not ( = ?auto_34875 ?auto_34877 ) ) ( not ( = ?auto_34875 ?auto_34878 ) ) ( not ( = ?auto_34876 ?auto_34877 ) ) ( not ( = ?auto_34876 ?auto_34878 ) ) ( not ( = ?auto_34877 ?auto_34878 ) ) ( ON ?auto_34876 ?auto_34877 ) ( ON ?auto_34875 ?auto_34876 ) ( CLEAR ?auto_34873 ) ( ON ?auto_34874 ?auto_34875 ) ( CLEAR ?auto_34874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34871 ?auto_34872 ?auto_34873 ?auto_34874 )
      ( MAKE-7PILE ?auto_34871 ?auto_34872 ?auto_34873 ?auto_34874 ?auto_34875 ?auto_34876 ?auto_34877 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_34901 - BLOCK
      ?auto_34902 - BLOCK
      ?auto_34903 - BLOCK
      ?auto_34904 - BLOCK
      ?auto_34905 - BLOCK
      ?auto_34906 - BLOCK
      ?auto_34907 - BLOCK
    )
    :vars
    (
      ?auto_34908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34907 ?auto_34908 ) ( ON-TABLE ?auto_34901 ) ( ON ?auto_34902 ?auto_34901 ) ( not ( = ?auto_34901 ?auto_34902 ) ) ( not ( = ?auto_34901 ?auto_34903 ) ) ( not ( = ?auto_34901 ?auto_34904 ) ) ( not ( = ?auto_34901 ?auto_34905 ) ) ( not ( = ?auto_34901 ?auto_34906 ) ) ( not ( = ?auto_34901 ?auto_34907 ) ) ( not ( = ?auto_34901 ?auto_34908 ) ) ( not ( = ?auto_34902 ?auto_34903 ) ) ( not ( = ?auto_34902 ?auto_34904 ) ) ( not ( = ?auto_34902 ?auto_34905 ) ) ( not ( = ?auto_34902 ?auto_34906 ) ) ( not ( = ?auto_34902 ?auto_34907 ) ) ( not ( = ?auto_34902 ?auto_34908 ) ) ( not ( = ?auto_34903 ?auto_34904 ) ) ( not ( = ?auto_34903 ?auto_34905 ) ) ( not ( = ?auto_34903 ?auto_34906 ) ) ( not ( = ?auto_34903 ?auto_34907 ) ) ( not ( = ?auto_34903 ?auto_34908 ) ) ( not ( = ?auto_34904 ?auto_34905 ) ) ( not ( = ?auto_34904 ?auto_34906 ) ) ( not ( = ?auto_34904 ?auto_34907 ) ) ( not ( = ?auto_34904 ?auto_34908 ) ) ( not ( = ?auto_34905 ?auto_34906 ) ) ( not ( = ?auto_34905 ?auto_34907 ) ) ( not ( = ?auto_34905 ?auto_34908 ) ) ( not ( = ?auto_34906 ?auto_34907 ) ) ( not ( = ?auto_34906 ?auto_34908 ) ) ( not ( = ?auto_34907 ?auto_34908 ) ) ( ON ?auto_34906 ?auto_34907 ) ( ON ?auto_34905 ?auto_34906 ) ( ON ?auto_34904 ?auto_34905 ) ( CLEAR ?auto_34902 ) ( ON ?auto_34903 ?auto_34904 ) ( CLEAR ?auto_34903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34901 ?auto_34902 ?auto_34903 )
      ( MAKE-7PILE ?auto_34901 ?auto_34902 ?auto_34903 ?auto_34904 ?auto_34905 ?auto_34906 ?auto_34907 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_34931 - BLOCK
      ?auto_34932 - BLOCK
      ?auto_34933 - BLOCK
      ?auto_34934 - BLOCK
      ?auto_34935 - BLOCK
      ?auto_34936 - BLOCK
      ?auto_34937 - BLOCK
    )
    :vars
    (
      ?auto_34938 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34937 ?auto_34938 ) ( ON-TABLE ?auto_34931 ) ( not ( = ?auto_34931 ?auto_34932 ) ) ( not ( = ?auto_34931 ?auto_34933 ) ) ( not ( = ?auto_34931 ?auto_34934 ) ) ( not ( = ?auto_34931 ?auto_34935 ) ) ( not ( = ?auto_34931 ?auto_34936 ) ) ( not ( = ?auto_34931 ?auto_34937 ) ) ( not ( = ?auto_34931 ?auto_34938 ) ) ( not ( = ?auto_34932 ?auto_34933 ) ) ( not ( = ?auto_34932 ?auto_34934 ) ) ( not ( = ?auto_34932 ?auto_34935 ) ) ( not ( = ?auto_34932 ?auto_34936 ) ) ( not ( = ?auto_34932 ?auto_34937 ) ) ( not ( = ?auto_34932 ?auto_34938 ) ) ( not ( = ?auto_34933 ?auto_34934 ) ) ( not ( = ?auto_34933 ?auto_34935 ) ) ( not ( = ?auto_34933 ?auto_34936 ) ) ( not ( = ?auto_34933 ?auto_34937 ) ) ( not ( = ?auto_34933 ?auto_34938 ) ) ( not ( = ?auto_34934 ?auto_34935 ) ) ( not ( = ?auto_34934 ?auto_34936 ) ) ( not ( = ?auto_34934 ?auto_34937 ) ) ( not ( = ?auto_34934 ?auto_34938 ) ) ( not ( = ?auto_34935 ?auto_34936 ) ) ( not ( = ?auto_34935 ?auto_34937 ) ) ( not ( = ?auto_34935 ?auto_34938 ) ) ( not ( = ?auto_34936 ?auto_34937 ) ) ( not ( = ?auto_34936 ?auto_34938 ) ) ( not ( = ?auto_34937 ?auto_34938 ) ) ( ON ?auto_34936 ?auto_34937 ) ( ON ?auto_34935 ?auto_34936 ) ( ON ?auto_34934 ?auto_34935 ) ( ON ?auto_34933 ?auto_34934 ) ( CLEAR ?auto_34931 ) ( ON ?auto_34932 ?auto_34933 ) ( CLEAR ?auto_34932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34931 ?auto_34932 )
      ( MAKE-7PILE ?auto_34931 ?auto_34932 ?auto_34933 ?auto_34934 ?auto_34935 ?auto_34936 ?auto_34937 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_34961 - BLOCK
      ?auto_34962 - BLOCK
      ?auto_34963 - BLOCK
      ?auto_34964 - BLOCK
      ?auto_34965 - BLOCK
      ?auto_34966 - BLOCK
      ?auto_34967 - BLOCK
    )
    :vars
    (
      ?auto_34968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34967 ?auto_34968 ) ( not ( = ?auto_34961 ?auto_34962 ) ) ( not ( = ?auto_34961 ?auto_34963 ) ) ( not ( = ?auto_34961 ?auto_34964 ) ) ( not ( = ?auto_34961 ?auto_34965 ) ) ( not ( = ?auto_34961 ?auto_34966 ) ) ( not ( = ?auto_34961 ?auto_34967 ) ) ( not ( = ?auto_34961 ?auto_34968 ) ) ( not ( = ?auto_34962 ?auto_34963 ) ) ( not ( = ?auto_34962 ?auto_34964 ) ) ( not ( = ?auto_34962 ?auto_34965 ) ) ( not ( = ?auto_34962 ?auto_34966 ) ) ( not ( = ?auto_34962 ?auto_34967 ) ) ( not ( = ?auto_34962 ?auto_34968 ) ) ( not ( = ?auto_34963 ?auto_34964 ) ) ( not ( = ?auto_34963 ?auto_34965 ) ) ( not ( = ?auto_34963 ?auto_34966 ) ) ( not ( = ?auto_34963 ?auto_34967 ) ) ( not ( = ?auto_34963 ?auto_34968 ) ) ( not ( = ?auto_34964 ?auto_34965 ) ) ( not ( = ?auto_34964 ?auto_34966 ) ) ( not ( = ?auto_34964 ?auto_34967 ) ) ( not ( = ?auto_34964 ?auto_34968 ) ) ( not ( = ?auto_34965 ?auto_34966 ) ) ( not ( = ?auto_34965 ?auto_34967 ) ) ( not ( = ?auto_34965 ?auto_34968 ) ) ( not ( = ?auto_34966 ?auto_34967 ) ) ( not ( = ?auto_34966 ?auto_34968 ) ) ( not ( = ?auto_34967 ?auto_34968 ) ) ( ON ?auto_34966 ?auto_34967 ) ( ON ?auto_34965 ?auto_34966 ) ( ON ?auto_34964 ?auto_34965 ) ( ON ?auto_34963 ?auto_34964 ) ( ON ?auto_34962 ?auto_34963 ) ( ON ?auto_34961 ?auto_34962 ) ( CLEAR ?auto_34961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34961 )
      ( MAKE-7PILE ?auto_34961 ?auto_34962 ?auto_34963 ?auto_34964 ?auto_34965 ?auto_34966 ?auto_34967 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_34992 - BLOCK
      ?auto_34993 - BLOCK
      ?auto_34994 - BLOCK
      ?auto_34995 - BLOCK
      ?auto_34996 - BLOCK
      ?auto_34997 - BLOCK
      ?auto_34998 - BLOCK
      ?auto_34999 - BLOCK
    )
    :vars
    (
      ?auto_35000 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_34998 ) ( ON ?auto_34999 ?auto_35000 ) ( CLEAR ?auto_34999 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34992 ) ( ON ?auto_34993 ?auto_34992 ) ( ON ?auto_34994 ?auto_34993 ) ( ON ?auto_34995 ?auto_34994 ) ( ON ?auto_34996 ?auto_34995 ) ( ON ?auto_34997 ?auto_34996 ) ( ON ?auto_34998 ?auto_34997 ) ( not ( = ?auto_34992 ?auto_34993 ) ) ( not ( = ?auto_34992 ?auto_34994 ) ) ( not ( = ?auto_34992 ?auto_34995 ) ) ( not ( = ?auto_34992 ?auto_34996 ) ) ( not ( = ?auto_34992 ?auto_34997 ) ) ( not ( = ?auto_34992 ?auto_34998 ) ) ( not ( = ?auto_34992 ?auto_34999 ) ) ( not ( = ?auto_34992 ?auto_35000 ) ) ( not ( = ?auto_34993 ?auto_34994 ) ) ( not ( = ?auto_34993 ?auto_34995 ) ) ( not ( = ?auto_34993 ?auto_34996 ) ) ( not ( = ?auto_34993 ?auto_34997 ) ) ( not ( = ?auto_34993 ?auto_34998 ) ) ( not ( = ?auto_34993 ?auto_34999 ) ) ( not ( = ?auto_34993 ?auto_35000 ) ) ( not ( = ?auto_34994 ?auto_34995 ) ) ( not ( = ?auto_34994 ?auto_34996 ) ) ( not ( = ?auto_34994 ?auto_34997 ) ) ( not ( = ?auto_34994 ?auto_34998 ) ) ( not ( = ?auto_34994 ?auto_34999 ) ) ( not ( = ?auto_34994 ?auto_35000 ) ) ( not ( = ?auto_34995 ?auto_34996 ) ) ( not ( = ?auto_34995 ?auto_34997 ) ) ( not ( = ?auto_34995 ?auto_34998 ) ) ( not ( = ?auto_34995 ?auto_34999 ) ) ( not ( = ?auto_34995 ?auto_35000 ) ) ( not ( = ?auto_34996 ?auto_34997 ) ) ( not ( = ?auto_34996 ?auto_34998 ) ) ( not ( = ?auto_34996 ?auto_34999 ) ) ( not ( = ?auto_34996 ?auto_35000 ) ) ( not ( = ?auto_34997 ?auto_34998 ) ) ( not ( = ?auto_34997 ?auto_34999 ) ) ( not ( = ?auto_34997 ?auto_35000 ) ) ( not ( = ?auto_34998 ?auto_34999 ) ) ( not ( = ?auto_34998 ?auto_35000 ) ) ( not ( = ?auto_34999 ?auto_35000 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34999 ?auto_35000 )
      ( !STACK ?auto_34999 ?auto_34998 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_35009 - BLOCK
      ?auto_35010 - BLOCK
      ?auto_35011 - BLOCK
      ?auto_35012 - BLOCK
      ?auto_35013 - BLOCK
      ?auto_35014 - BLOCK
      ?auto_35015 - BLOCK
      ?auto_35016 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_35015 ) ( ON-TABLE ?auto_35016 ) ( CLEAR ?auto_35016 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35009 ) ( ON ?auto_35010 ?auto_35009 ) ( ON ?auto_35011 ?auto_35010 ) ( ON ?auto_35012 ?auto_35011 ) ( ON ?auto_35013 ?auto_35012 ) ( ON ?auto_35014 ?auto_35013 ) ( ON ?auto_35015 ?auto_35014 ) ( not ( = ?auto_35009 ?auto_35010 ) ) ( not ( = ?auto_35009 ?auto_35011 ) ) ( not ( = ?auto_35009 ?auto_35012 ) ) ( not ( = ?auto_35009 ?auto_35013 ) ) ( not ( = ?auto_35009 ?auto_35014 ) ) ( not ( = ?auto_35009 ?auto_35015 ) ) ( not ( = ?auto_35009 ?auto_35016 ) ) ( not ( = ?auto_35010 ?auto_35011 ) ) ( not ( = ?auto_35010 ?auto_35012 ) ) ( not ( = ?auto_35010 ?auto_35013 ) ) ( not ( = ?auto_35010 ?auto_35014 ) ) ( not ( = ?auto_35010 ?auto_35015 ) ) ( not ( = ?auto_35010 ?auto_35016 ) ) ( not ( = ?auto_35011 ?auto_35012 ) ) ( not ( = ?auto_35011 ?auto_35013 ) ) ( not ( = ?auto_35011 ?auto_35014 ) ) ( not ( = ?auto_35011 ?auto_35015 ) ) ( not ( = ?auto_35011 ?auto_35016 ) ) ( not ( = ?auto_35012 ?auto_35013 ) ) ( not ( = ?auto_35012 ?auto_35014 ) ) ( not ( = ?auto_35012 ?auto_35015 ) ) ( not ( = ?auto_35012 ?auto_35016 ) ) ( not ( = ?auto_35013 ?auto_35014 ) ) ( not ( = ?auto_35013 ?auto_35015 ) ) ( not ( = ?auto_35013 ?auto_35016 ) ) ( not ( = ?auto_35014 ?auto_35015 ) ) ( not ( = ?auto_35014 ?auto_35016 ) ) ( not ( = ?auto_35015 ?auto_35016 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_35016 )
      ( !STACK ?auto_35016 ?auto_35015 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_35025 - BLOCK
      ?auto_35026 - BLOCK
      ?auto_35027 - BLOCK
      ?auto_35028 - BLOCK
      ?auto_35029 - BLOCK
      ?auto_35030 - BLOCK
      ?auto_35031 - BLOCK
      ?auto_35032 - BLOCK
    )
    :vars
    (
      ?auto_35033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35032 ?auto_35033 ) ( ON-TABLE ?auto_35025 ) ( ON ?auto_35026 ?auto_35025 ) ( ON ?auto_35027 ?auto_35026 ) ( ON ?auto_35028 ?auto_35027 ) ( ON ?auto_35029 ?auto_35028 ) ( ON ?auto_35030 ?auto_35029 ) ( not ( = ?auto_35025 ?auto_35026 ) ) ( not ( = ?auto_35025 ?auto_35027 ) ) ( not ( = ?auto_35025 ?auto_35028 ) ) ( not ( = ?auto_35025 ?auto_35029 ) ) ( not ( = ?auto_35025 ?auto_35030 ) ) ( not ( = ?auto_35025 ?auto_35031 ) ) ( not ( = ?auto_35025 ?auto_35032 ) ) ( not ( = ?auto_35025 ?auto_35033 ) ) ( not ( = ?auto_35026 ?auto_35027 ) ) ( not ( = ?auto_35026 ?auto_35028 ) ) ( not ( = ?auto_35026 ?auto_35029 ) ) ( not ( = ?auto_35026 ?auto_35030 ) ) ( not ( = ?auto_35026 ?auto_35031 ) ) ( not ( = ?auto_35026 ?auto_35032 ) ) ( not ( = ?auto_35026 ?auto_35033 ) ) ( not ( = ?auto_35027 ?auto_35028 ) ) ( not ( = ?auto_35027 ?auto_35029 ) ) ( not ( = ?auto_35027 ?auto_35030 ) ) ( not ( = ?auto_35027 ?auto_35031 ) ) ( not ( = ?auto_35027 ?auto_35032 ) ) ( not ( = ?auto_35027 ?auto_35033 ) ) ( not ( = ?auto_35028 ?auto_35029 ) ) ( not ( = ?auto_35028 ?auto_35030 ) ) ( not ( = ?auto_35028 ?auto_35031 ) ) ( not ( = ?auto_35028 ?auto_35032 ) ) ( not ( = ?auto_35028 ?auto_35033 ) ) ( not ( = ?auto_35029 ?auto_35030 ) ) ( not ( = ?auto_35029 ?auto_35031 ) ) ( not ( = ?auto_35029 ?auto_35032 ) ) ( not ( = ?auto_35029 ?auto_35033 ) ) ( not ( = ?auto_35030 ?auto_35031 ) ) ( not ( = ?auto_35030 ?auto_35032 ) ) ( not ( = ?auto_35030 ?auto_35033 ) ) ( not ( = ?auto_35031 ?auto_35032 ) ) ( not ( = ?auto_35031 ?auto_35033 ) ) ( not ( = ?auto_35032 ?auto_35033 ) ) ( CLEAR ?auto_35030 ) ( ON ?auto_35031 ?auto_35032 ) ( CLEAR ?auto_35031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_35025 ?auto_35026 ?auto_35027 ?auto_35028 ?auto_35029 ?auto_35030 ?auto_35031 )
      ( MAKE-8PILE ?auto_35025 ?auto_35026 ?auto_35027 ?auto_35028 ?auto_35029 ?auto_35030 ?auto_35031 ?auto_35032 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_35042 - BLOCK
      ?auto_35043 - BLOCK
      ?auto_35044 - BLOCK
      ?auto_35045 - BLOCK
      ?auto_35046 - BLOCK
      ?auto_35047 - BLOCK
      ?auto_35048 - BLOCK
      ?auto_35049 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35049 ) ( ON-TABLE ?auto_35042 ) ( ON ?auto_35043 ?auto_35042 ) ( ON ?auto_35044 ?auto_35043 ) ( ON ?auto_35045 ?auto_35044 ) ( ON ?auto_35046 ?auto_35045 ) ( ON ?auto_35047 ?auto_35046 ) ( not ( = ?auto_35042 ?auto_35043 ) ) ( not ( = ?auto_35042 ?auto_35044 ) ) ( not ( = ?auto_35042 ?auto_35045 ) ) ( not ( = ?auto_35042 ?auto_35046 ) ) ( not ( = ?auto_35042 ?auto_35047 ) ) ( not ( = ?auto_35042 ?auto_35048 ) ) ( not ( = ?auto_35042 ?auto_35049 ) ) ( not ( = ?auto_35043 ?auto_35044 ) ) ( not ( = ?auto_35043 ?auto_35045 ) ) ( not ( = ?auto_35043 ?auto_35046 ) ) ( not ( = ?auto_35043 ?auto_35047 ) ) ( not ( = ?auto_35043 ?auto_35048 ) ) ( not ( = ?auto_35043 ?auto_35049 ) ) ( not ( = ?auto_35044 ?auto_35045 ) ) ( not ( = ?auto_35044 ?auto_35046 ) ) ( not ( = ?auto_35044 ?auto_35047 ) ) ( not ( = ?auto_35044 ?auto_35048 ) ) ( not ( = ?auto_35044 ?auto_35049 ) ) ( not ( = ?auto_35045 ?auto_35046 ) ) ( not ( = ?auto_35045 ?auto_35047 ) ) ( not ( = ?auto_35045 ?auto_35048 ) ) ( not ( = ?auto_35045 ?auto_35049 ) ) ( not ( = ?auto_35046 ?auto_35047 ) ) ( not ( = ?auto_35046 ?auto_35048 ) ) ( not ( = ?auto_35046 ?auto_35049 ) ) ( not ( = ?auto_35047 ?auto_35048 ) ) ( not ( = ?auto_35047 ?auto_35049 ) ) ( not ( = ?auto_35048 ?auto_35049 ) ) ( CLEAR ?auto_35047 ) ( ON ?auto_35048 ?auto_35049 ) ( CLEAR ?auto_35048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_35042 ?auto_35043 ?auto_35044 ?auto_35045 ?auto_35046 ?auto_35047 ?auto_35048 )
      ( MAKE-8PILE ?auto_35042 ?auto_35043 ?auto_35044 ?auto_35045 ?auto_35046 ?auto_35047 ?auto_35048 ?auto_35049 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_35058 - BLOCK
      ?auto_35059 - BLOCK
      ?auto_35060 - BLOCK
      ?auto_35061 - BLOCK
      ?auto_35062 - BLOCK
      ?auto_35063 - BLOCK
      ?auto_35064 - BLOCK
      ?auto_35065 - BLOCK
    )
    :vars
    (
      ?auto_35066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35065 ?auto_35066 ) ( ON-TABLE ?auto_35058 ) ( ON ?auto_35059 ?auto_35058 ) ( ON ?auto_35060 ?auto_35059 ) ( ON ?auto_35061 ?auto_35060 ) ( ON ?auto_35062 ?auto_35061 ) ( not ( = ?auto_35058 ?auto_35059 ) ) ( not ( = ?auto_35058 ?auto_35060 ) ) ( not ( = ?auto_35058 ?auto_35061 ) ) ( not ( = ?auto_35058 ?auto_35062 ) ) ( not ( = ?auto_35058 ?auto_35063 ) ) ( not ( = ?auto_35058 ?auto_35064 ) ) ( not ( = ?auto_35058 ?auto_35065 ) ) ( not ( = ?auto_35058 ?auto_35066 ) ) ( not ( = ?auto_35059 ?auto_35060 ) ) ( not ( = ?auto_35059 ?auto_35061 ) ) ( not ( = ?auto_35059 ?auto_35062 ) ) ( not ( = ?auto_35059 ?auto_35063 ) ) ( not ( = ?auto_35059 ?auto_35064 ) ) ( not ( = ?auto_35059 ?auto_35065 ) ) ( not ( = ?auto_35059 ?auto_35066 ) ) ( not ( = ?auto_35060 ?auto_35061 ) ) ( not ( = ?auto_35060 ?auto_35062 ) ) ( not ( = ?auto_35060 ?auto_35063 ) ) ( not ( = ?auto_35060 ?auto_35064 ) ) ( not ( = ?auto_35060 ?auto_35065 ) ) ( not ( = ?auto_35060 ?auto_35066 ) ) ( not ( = ?auto_35061 ?auto_35062 ) ) ( not ( = ?auto_35061 ?auto_35063 ) ) ( not ( = ?auto_35061 ?auto_35064 ) ) ( not ( = ?auto_35061 ?auto_35065 ) ) ( not ( = ?auto_35061 ?auto_35066 ) ) ( not ( = ?auto_35062 ?auto_35063 ) ) ( not ( = ?auto_35062 ?auto_35064 ) ) ( not ( = ?auto_35062 ?auto_35065 ) ) ( not ( = ?auto_35062 ?auto_35066 ) ) ( not ( = ?auto_35063 ?auto_35064 ) ) ( not ( = ?auto_35063 ?auto_35065 ) ) ( not ( = ?auto_35063 ?auto_35066 ) ) ( not ( = ?auto_35064 ?auto_35065 ) ) ( not ( = ?auto_35064 ?auto_35066 ) ) ( not ( = ?auto_35065 ?auto_35066 ) ) ( ON ?auto_35064 ?auto_35065 ) ( CLEAR ?auto_35062 ) ( ON ?auto_35063 ?auto_35064 ) ( CLEAR ?auto_35063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_35058 ?auto_35059 ?auto_35060 ?auto_35061 ?auto_35062 ?auto_35063 )
      ( MAKE-8PILE ?auto_35058 ?auto_35059 ?auto_35060 ?auto_35061 ?auto_35062 ?auto_35063 ?auto_35064 ?auto_35065 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_35075 - BLOCK
      ?auto_35076 - BLOCK
      ?auto_35077 - BLOCK
      ?auto_35078 - BLOCK
      ?auto_35079 - BLOCK
      ?auto_35080 - BLOCK
      ?auto_35081 - BLOCK
      ?auto_35082 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35082 ) ( ON-TABLE ?auto_35075 ) ( ON ?auto_35076 ?auto_35075 ) ( ON ?auto_35077 ?auto_35076 ) ( ON ?auto_35078 ?auto_35077 ) ( ON ?auto_35079 ?auto_35078 ) ( not ( = ?auto_35075 ?auto_35076 ) ) ( not ( = ?auto_35075 ?auto_35077 ) ) ( not ( = ?auto_35075 ?auto_35078 ) ) ( not ( = ?auto_35075 ?auto_35079 ) ) ( not ( = ?auto_35075 ?auto_35080 ) ) ( not ( = ?auto_35075 ?auto_35081 ) ) ( not ( = ?auto_35075 ?auto_35082 ) ) ( not ( = ?auto_35076 ?auto_35077 ) ) ( not ( = ?auto_35076 ?auto_35078 ) ) ( not ( = ?auto_35076 ?auto_35079 ) ) ( not ( = ?auto_35076 ?auto_35080 ) ) ( not ( = ?auto_35076 ?auto_35081 ) ) ( not ( = ?auto_35076 ?auto_35082 ) ) ( not ( = ?auto_35077 ?auto_35078 ) ) ( not ( = ?auto_35077 ?auto_35079 ) ) ( not ( = ?auto_35077 ?auto_35080 ) ) ( not ( = ?auto_35077 ?auto_35081 ) ) ( not ( = ?auto_35077 ?auto_35082 ) ) ( not ( = ?auto_35078 ?auto_35079 ) ) ( not ( = ?auto_35078 ?auto_35080 ) ) ( not ( = ?auto_35078 ?auto_35081 ) ) ( not ( = ?auto_35078 ?auto_35082 ) ) ( not ( = ?auto_35079 ?auto_35080 ) ) ( not ( = ?auto_35079 ?auto_35081 ) ) ( not ( = ?auto_35079 ?auto_35082 ) ) ( not ( = ?auto_35080 ?auto_35081 ) ) ( not ( = ?auto_35080 ?auto_35082 ) ) ( not ( = ?auto_35081 ?auto_35082 ) ) ( ON ?auto_35081 ?auto_35082 ) ( CLEAR ?auto_35079 ) ( ON ?auto_35080 ?auto_35081 ) ( CLEAR ?auto_35080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_35075 ?auto_35076 ?auto_35077 ?auto_35078 ?auto_35079 ?auto_35080 )
      ( MAKE-8PILE ?auto_35075 ?auto_35076 ?auto_35077 ?auto_35078 ?auto_35079 ?auto_35080 ?auto_35081 ?auto_35082 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_35091 - BLOCK
      ?auto_35092 - BLOCK
      ?auto_35093 - BLOCK
      ?auto_35094 - BLOCK
      ?auto_35095 - BLOCK
      ?auto_35096 - BLOCK
      ?auto_35097 - BLOCK
      ?auto_35098 - BLOCK
    )
    :vars
    (
      ?auto_35099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35098 ?auto_35099 ) ( ON-TABLE ?auto_35091 ) ( ON ?auto_35092 ?auto_35091 ) ( ON ?auto_35093 ?auto_35092 ) ( ON ?auto_35094 ?auto_35093 ) ( not ( = ?auto_35091 ?auto_35092 ) ) ( not ( = ?auto_35091 ?auto_35093 ) ) ( not ( = ?auto_35091 ?auto_35094 ) ) ( not ( = ?auto_35091 ?auto_35095 ) ) ( not ( = ?auto_35091 ?auto_35096 ) ) ( not ( = ?auto_35091 ?auto_35097 ) ) ( not ( = ?auto_35091 ?auto_35098 ) ) ( not ( = ?auto_35091 ?auto_35099 ) ) ( not ( = ?auto_35092 ?auto_35093 ) ) ( not ( = ?auto_35092 ?auto_35094 ) ) ( not ( = ?auto_35092 ?auto_35095 ) ) ( not ( = ?auto_35092 ?auto_35096 ) ) ( not ( = ?auto_35092 ?auto_35097 ) ) ( not ( = ?auto_35092 ?auto_35098 ) ) ( not ( = ?auto_35092 ?auto_35099 ) ) ( not ( = ?auto_35093 ?auto_35094 ) ) ( not ( = ?auto_35093 ?auto_35095 ) ) ( not ( = ?auto_35093 ?auto_35096 ) ) ( not ( = ?auto_35093 ?auto_35097 ) ) ( not ( = ?auto_35093 ?auto_35098 ) ) ( not ( = ?auto_35093 ?auto_35099 ) ) ( not ( = ?auto_35094 ?auto_35095 ) ) ( not ( = ?auto_35094 ?auto_35096 ) ) ( not ( = ?auto_35094 ?auto_35097 ) ) ( not ( = ?auto_35094 ?auto_35098 ) ) ( not ( = ?auto_35094 ?auto_35099 ) ) ( not ( = ?auto_35095 ?auto_35096 ) ) ( not ( = ?auto_35095 ?auto_35097 ) ) ( not ( = ?auto_35095 ?auto_35098 ) ) ( not ( = ?auto_35095 ?auto_35099 ) ) ( not ( = ?auto_35096 ?auto_35097 ) ) ( not ( = ?auto_35096 ?auto_35098 ) ) ( not ( = ?auto_35096 ?auto_35099 ) ) ( not ( = ?auto_35097 ?auto_35098 ) ) ( not ( = ?auto_35097 ?auto_35099 ) ) ( not ( = ?auto_35098 ?auto_35099 ) ) ( ON ?auto_35097 ?auto_35098 ) ( ON ?auto_35096 ?auto_35097 ) ( CLEAR ?auto_35094 ) ( ON ?auto_35095 ?auto_35096 ) ( CLEAR ?auto_35095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35091 ?auto_35092 ?auto_35093 ?auto_35094 ?auto_35095 )
      ( MAKE-8PILE ?auto_35091 ?auto_35092 ?auto_35093 ?auto_35094 ?auto_35095 ?auto_35096 ?auto_35097 ?auto_35098 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_35108 - BLOCK
      ?auto_35109 - BLOCK
      ?auto_35110 - BLOCK
      ?auto_35111 - BLOCK
      ?auto_35112 - BLOCK
      ?auto_35113 - BLOCK
      ?auto_35114 - BLOCK
      ?auto_35115 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35115 ) ( ON-TABLE ?auto_35108 ) ( ON ?auto_35109 ?auto_35108 ) ( ON ?auto_35110 ?auto_35109 ) ( ON ?auto_35111 ?auto_35110 ) ( not ( = ?auto_35108 ?auto_35109 ) ) ( not ( = ?auto_35108 ?auto_35110 ) ) ( not ( = ?auto_35108 ?auto_35111 ) ) ( not ( = ?auto_35108 ?auto_35112 ) ) ( not ( = ?auto_35108 ?auto_35113 ) ) ( not ( = ?auto_35108 ?auto_35114 ) ) ( not ( = ?auto_35108 ?auto_35115 ) ) ( not ( = ?auto_35109 ?auto_35110 ) ) ( not ( = ?auto_35109 ?auto_35111 ) ) ( not ( = ?auto_35109 ?auto_35112 ) ) ( not ( = ?auto_35109 ?auto_35113 ) ) ( not ( = ?auto_35109 ?auto_35114 ) ) ( not ( = ?auto_35109 ?auto_35115 ) ) ( not ( = ?auto_35110 ?auto_35111 ) ) ( not ( = ?auto_35110 ?auto_35112 ) ) ( not ( = ?auto_35110 ?auto_35113 ) ) ( not ( = ?auto_35110 ?auto_35114 ) ) ( not ( = ?auto_35110 ?auto_35115 ) ) ( not ( = ?auto_35111 ?auto_35112 ) ) ( not ( = ?auto_35111 ?auto_35113 ) ) ( not ( = ?auto_35111 ?auto_35114 ) ) ( not ( = ?auto_35111 ?auto_35115 ) ) ( not ( = ?auto_35112 ?auto_35113 ) ) ( not ( = ?auto_35112 ?auto_35114 ) ) ( not ( = ?auto_35112 ?auto_35115 ) ) ( not ( = ?auto_35113 ?auto_35114 ) ) ( not ( = ?auto_35113 ?auto_35115 ) ) ( not ( = ?auto_35114 ?auto_35115 ) ) ( ON ?auto_35114 ?auto_35115 ) ( ON ?auto_35113 ?auto_35114 ) ( CLEAR ?auto_35111 ) ( ON ?auto_35112 ?auto_35113 ) ( CLEAR ?auto_35112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35108 ?auto_35109 ?auto_35110 ?auto_35111 ?auto_35112 )
      ( MAKE-8PILE ?auto_35108 ?auto_35109 ?auto_35110 ?auto_35111 ?auto_35112 ?auto_35113 ?auto_35114 ?auto_35115 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_35124 - BLOCK
      ?auto_35125 - BLOCK
      ?auto_35126 - BLOCK
      ?auto_35127 - BLOCK
      ?auto_35128 - BLOCK
      ?auto_35129 - BLOCK
      ?auto_35130 - BLOCK
      ?auto_35131 - BLOCK
    )
    :vars
    (
      ?auto_35132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35131 ?auto_35132 ) ( ON-TABLE ?auto_35124 ) ( ON ?auto_35125 ?auto_35124 ) ( ON ?auto_35126 ?auto_35125 ) ( not ( = ?auto_35124 ?auto_35125 ) ) ( not ( = ?auto_35124 ?auto_35126 ) ) ( not ( = ?auto_35124 ?auto_35127 ) ) ( not ( = ?auto_35124 ?auto_35128 ) ) ( not ( = ?auto_35124 ?auto_35129 ) ) ( not ( = ?auto_35124 ?auto_35130 ) ) ( not ( = ?auto_35124 ?auto_35131 ) ) ( not ( = ?auto_35124 ?auto_35132 ) ) ( not ( = ?auto_35125 ?auto_35126 ) ) ( not ( = ?auto_35125 ?auto_35127 ) ) ( not ( = ?auto_35125 ?auto_35128 ) ) ( not ( = ?auto_35125 ?auto_35129 ) ) ( not ( = ?auto_35125 ?auto_35130 ) ) ( not ( = ?auto_35125 ?auto_35131 ) ) ( not ( = ?auto_35125 ?auto_35132 ) ) ( not ( = ?auto_35126 ?auto_35127 ) ) ( not ( = ?auto_35126 ?auto_35128 ) ) ( not ( = ?auto_35126 ?auto_35129 ) ) ( not ( = ?auto_35126 ?auto_35130 ) ) ( not ( = ?auto_35126 ?auto_35131 ) ) ( not ( = ?auto_35126 ?auto_35132 ) ) ( not ( = ?auto_35127 ?auto_35128 ) ) ( not ( = ?auto_35127 ?auto_35129 ) ) ( not ( = ?auto_35127 ?auto_35130 ) ) ( not ( = ?auto_35127 ?auto_35131 ) ) ( not ( = ?auto_35127 ?auto_35132 ) ) ( not ( = ?auto_35128 ?auto_35129 ) ) ( not ( = ?auto_35128 ?auto_35130 ) ) ( not ( = ?auto_35128 ?auto_35131 ) ) ( not ( = ?auto_35128 ?auto_35132 ) ) ( not ( = ?auto_35129 ?auto_35130 ) ) ( not ( = ?auto_35129 ?auto_35131 ) ) ( not ( = ?auto_35129 ?auto_35132 ) ) ( not ( = ?auto_35130 ?auto_35131 ) ) ( not ( = ?auto_35130 ?auto_35132 ) ) ( not ( = ?auto_35131 ?auto_35132 ) ) ( ON ?auto_35130 ?auto_35131 ) ( ON ?auto_35129 ?auto_35130 ) ( ON ?auto_35128 ?auto_35129 ) ( CLEAR ?auto_35126 ) ( ON ?auto_35127 ?auto_35128 ) ( CLEAR ?auto_35127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35124 ?auto_35125 ?auto_35126 ?auto_35127 )
      ( MAKE-8PILE ?auto_35124 ?auto_35125 ?auto_35126 ?auto_35127 ?auto_35128 ?auto_35129 ?auto_35130 ?auto_35131 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_35141 - BLOCK
      ?auto_35142 - BLOCK
      ?auto_35143 - BLOCK
      ?auto_35144 - BLOCK
      ?auto_35145 - BLOCK
      ?auto_35146 - BLOCK
      ?auto_35147 - BLOCK
      ?auto_35148 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35148 ) ( ON-TABLE ?auto_35141 ) ( ON ?auto_35142 ?auto_35141 ) ( ON ?auto_35143 ?auto_35142 ) ( not ( = ?auto_35141 ?auto_35142 ) ) ( not ( = ?auto_35141 ?auto_35143 ) ) ( not ( = ?auto_35141 ?auto_35144 ) ) ( not ( = ?auto_35141 ?auto_35145 ) ) ( not ( = ?auto_35141 ?auto_35146 ) ) ( not ( = ?auto_35141 ?auto_35147 ) ) ( not ( = ?auto_35141 ?auto_35148 ) ) ( not ( = ?auto_35142 ?auto_35143 ) ) ( not ( = ?auto_35142 ?auto_35144 ) ) ( not ( = ?auto_35142 ?auto_35145 ) ) ( not ( = ?auto_35142 ?auto_35146 ) ) ( not ( = ?auto_35142 ?auto_35147 ) ) ( not ( = ?auto_35142 ?auto_35148 ) ) ( not ( = ?auto_35143 ?auto_35144 ) ) ( not ( = ?auto_35143 ?auto_35145 ) ) ( not ( = ?auto_35143 ?auto_35146 ) ) ( not ( = ?auto_35143 ?auto_35147 ) ) ( not ( = ?auto_35143 ?auto_35148 ) ) ( not ( = ?auto_35144 ?auto_35145 ) ) ( not ( = ?auto_35144 ?auto_35146 ) ) ( not ( = ?auto_35144 ?auto_35147 ) ) ( not ( = ?auto_35144 ?auto_35148 ) ) ( not ( = ?auto_35145 ?auto_35146 ) ) ( not ( = ?auto_35145 ?auto_35147 ) ) ( not ( = ?auto_35145 ?auto_35148 ) ) ( not ( = ?auto_35146 ?auto_35147 ) ) ( not ( = ?auto_35146 ?auto_35148 ) ) ( not ( = ?auto_35147 ?auto_35148 ) ) ( ON ?auto_35147 ?auto_35148 ) ( ON ?auto_35146 ?auto_35147 ) ( ON ?auto_35145 ?auto_35146 ) ( CLEAR ?auto_35143 ) ( ON ?auto_35144 ?auto_35145 ) ( CLEAR ?auto_35144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35141 ?auto_35142 ?auto_35143 ?auto_35144 )
      ( MAKE-8PILE ?auto_35141 ?auto_35142 ?auto_35143 ?auto_35144 ?auto_35145 ?auto_35146 ?auto_35147 ?auto_35148 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_35157 - BLOCK
      ?auto_35158 - BLOCK
      ?auto_35159 - BLOCK
      ?auto_35160 - BLOCK
      ?auto_35161 - BLOCK
      ?auto_35162 - BLOCK
      ?auto_35163 - BLOCK
      ?auto_35164 - BLOCK
    )
    :vars
    (
      ?auto_35165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35164 ?auto_35165 ) ( ON-TABLE ?auto_35157 ) ( ON ?auto_35158 ?auto_35157 ) ( not ( = ?auto_35157 ?auto_35158 ) ) ( not ( = ?auto_35157 ?auto_35159 ) ) ( not ( = ?auto_35157 ?auto_35160 ) ) ( not ( = ?auto_35157 ?auto_35161 ) ) ( not ( = ?auto_35157 ?auto_35162 ) ) ( not ( = ?auto_35157 ?auto_35163 ) ) ( not ( = ?auto_35157 ?auto_35164 ) ) ( not ( = ?auto_35157 ?auto_35165 ) ) ( not ( = ?auto_35158 ?auto_35159 ) ) ( not ( = ?auto_35158 ?auto_35160 ) ) ( not ( = ?auto_35158 ?auto_35161 ) ) ( not ( = ?auto_35158 ?auto_35162 ) ) ( not ( = ?auto_35158 ?auto_35163 ) ) ( not ( = ?auto_35158 ?auto_35164 ) ) ( not ( = ?auto_35158 ?auto_35165 ) ) ( not ( = ?auto_35159 ?auto_35160 ) ) ( not ( = ?auto_35159 ?auto_35161 ) ) ( not ( = ?auto_35159 ?auto_35162 ) ) ( not ( = ?auto_35159 ?auto_35163 ) ) ( not ( = ?auto_35159 ?auto_35164 ) ) ( not ( = ?auto_35159 ?auto_35165 ) ) ( not ( = ?auto_35160 ?auto_35161 ) ) ( not ( = ?auto_35160 ?auto_35162 ) ) ( not ( = ?auto_35160 ?auto_35163 ) ) ( not ( = ?auto_35160 ?auto_35164 ) ) ( not ( = ?auto_35160 ?auto_35165 ) ) ( not ( = ?auto_35161 ?auto_35162 ) ) ( not ( = ?auto_35161 ?auto_35163 ) ) ( not ( = ?auto_35161 ?auto_35164 ) ) ( not ( = ?auto_35161 ?auto_35165 ) ) ( not ( = ?auto_35162 ?auto_35163 ) ) ( not ( = ?auto_35162 ?auto_35164 ) ) ( not ( = ?auto_35162 ?auto_35165 ) ) ( not ( = ?auto_35163 ?auto_35164 ) ) ( not ( = ?auto_35163 ?auto_35165 ) ) ( not ( = ?auto_35164 ?auto_35165 ) ) ( ON ?auto_35163 ?auto_35164 ) ( ON ?auto_35162 ?auto_35163 ) ( ON ?auto_35161 ?auto_35162 ) ( ON ?auto_35160 ?auto_35161 ) ( CLEAR ?auto_35158 ) ( ON ?auto_35159 ?auto_35160 ) ( CLEAR ?auto_35159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35157 ?auto_35158 ?auto_35159 )
      ( MAKE-8PILE ?auto_35157 ?auto_35158 ?auto_35159 ?auto_35160 ?auto_35161 ?auto_35162 ?auto_35163 ?auto_35164 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_35174 - BLOCK
      ?auto_35175 - BLOCK
      ?auto_35176 - BLOCK
      ?auto_35177 - BLOCK
      ?auto_35178 - BLOCK
      ?auto_35179 - BLOCK
      ?auto_35180 - BLOCK
      ?auto_35181 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35181 ) ( ON-TABLE ?auto_35174 ) ( ON ?auto_35175 ?auto_35174 ) ( not ( = ?auto_35174 ?auto_35175 ) ) ( not ( = ?auto_35174 ?auto_35176 ) ) ( not ( = ?auto_35174 ?auto_35177 ) ) ( not ( = ?auto_35174 ?auto_35178 ) ) ( not ( = ?auto_35174 ?auto_35179 ) ) ( not ( = ?auto_35174 ?auto_35180 ) ) ( not ( = ?auto_35174 ?auto_35181 ) ) ( not ( = ?auto_35175 ?auto_35176 ) ) ( not ( = ?auto_35175 ?auto_35177 ) ) ( not ( = ?auto_35175 ?auto_35178 ) ) ( not ( = ?auto_35175 ?auto_35179 ) ) ( not ( = ?auto_35175 ?auto_35180 ) ) ( not ( = ?auto_35175 ?auto_35181 ) ) ( not ( = ?auto_35176 ?auto_35177 ) ) ( not ( = ?auto_35176 ?auto_35178 ) ) ( not ( = ?auto_35176 ?auto_35179 ) ) ( not ( = ?auto_35176 ?auto_35180 ) ) ( not ( = ?auto_35176 ?auto_35181 ) ) ( not ( = ?auto_35177 ?auto_35178 ) ) ( not ( = ?auto_35177 ?auto_35179 ) ) ( not ( = ?auto_35177 ?auto_35180 ) ) ( not ( = ?auto_35177 ?auto_35181 ) ) ( not ( = ?auto_35178 ?auto_35179 ) ) ( not ( = ?auto_35178 ?auto_35180 ) ) ( not ( = ?auto_35178 ?auto_35181 ) ) ( not ( = ?auto_35179 ?auto_35180 ) ) ( not ( = ?auto_35179 ?auto_35181 ) ) ( not ( = ?auto_35180 ?auto_35181 ) ) ( ON ?auto_35180 ?auto_35181 ) ( ON ?auto_35179 ?auto_35180 ) ( ON ?auto_35178 ?auto_35179 ) ( ON ?auto_35177 ?auto_35178 ) ( CLEAR ?auto_35175 ) ( ON ?auto_35176 ?auto_35177 ) ( CLEAR ?auto_35176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35174 ?auto_35175 ?auto_35176 )
      ( MAKE-8PILE ?auto_35174 ?auto_35175 ?auto_35176 ?auto_35177 ?auto_35178 ?auto_35179 ?auto_35180 ?auto_35181 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_35190 - BLOCK
      ?auto_35191 - BLOCK
      ?auto_35192 - BLOCK
      ?auto_35193 - BLOCK
      ?auto_35194 - BLOCK
      ?auto_35195 - BLOCK
      ?auto_35196 - BLOCK
      ?auto_35197 - BLOCK
    )
    :vars
    (
      ?auto_35198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35197 ?auto_35198 ) ( ON-TABLE ?auto_35190 ) ( not ( = ?auto_35190 ?auto_35191 ) ) ( not ( = ?auto_35190 ?auto_35192 ) ) ( not ( = ?auto_35190 ?auto_35193 ) ) ( not ( = ?auto_35190 ?auto_35194 ) ) ( not ( = ?auto_35190 ?auto_35195 ) ) ( not ( = ?auto_35190 ?auto_35196 ) ) ( not ( = ?auto_35190 ?auto_35197 ) ) ( not ( = ?auto_35190 ?auto_35198 ) ) ( not ( = ?auto_35191 ?auto_35192 ) ) ( not ( = ?auto_35191 ?auto_35193 ) ) ( not ( = ?auto_35191 ?auto_35194 ) ) ( not ( = ?auto_35191 ?auto_35195 ) ) ( not ( = ?auto_35191 ?auto_35196 ) ) ( not ( = ?auto_35191 ?auto_35197 ) ) ( not ( = ?auto_35191 ?auto_35198 ) ) ( not ( = ?auto_35192 ?auto_35193 ) ) ( not ( = ?auto_35192 ?auto_35194 ) ) ( not ( = ?auto_35192 ?auto_35195 ) ) ( not ( = ?auto_35192 ?auto_35196 ) ) ( not ( = ?auto_35192 ?auto_35197 ) ) ( not ( = ?auto_35192 ?auto_35198 ) ) ( not ( = ?auto_35193 ?auto_35194 ) ) ( not ( = ?auto_35193 ?auto_35195 ) ) ( not ( = ?auto_35193 ?auto_35196 ) ) ( not ( = ?auto_35193 ?auto_35197 ) ) ( not ( = ?auto_35193 ?auto_35198 ) ) ( not ( = ?auto_35194 ?auto_35195 ) ) ( not ( = ?auto_35194 ?auto_35196 ) ) ( not ( = ?auto_35194 ?auto_35197 ) ) ( not ( = ?auto_35194 ?auto_35198 ) ) ( not ( = ?auto_35195 ?auto_35196 ) ) ( not ( = ?auto_35195 ?auto_35197 ) ) ( not ( = ?auto_35195 ?auto_35198 ) ) ( not ( = ?auto_35196 ?auto_35197 ) ) ( not ( = ?auto_35196 ?auto_35198 ) ) ( not ( = ?auto_35197 ?auto_35198 ) ) ( ON ?auto_35196 ?auto_35197 ) ( ON ?auto_35195 ?auto_35196 ) ( ON ?auto_35194 ?auto_35195 ) ( ON ?auto_35193 ?auto_35194 ) ( ON ?auto_35192 ?auto_35193 ) ( CLEAR ?auto_35190 ) ( ON ?auto_35191 ?auto_35192 ) ( CLEAR ?auto_35191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35190 ?auto_35191 )
      ( MAKE-8PILE ?auto_35190 ?auto_35191 ?auto_35192 ?auto_35193 ?auto_35194 ?auto_35195 ?auto_35196 ?auto_35197 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_35207 - BLOCK
      ?auto_35208 - BLOCK
      ?auto_35209 - BLOCK
      ?auto_35210 - BLOCK
      ?auto_35211 - BLOCK
      ?auto_35212 - BLOCK
      ?auto_35213 - BLOCK
      ?auto_35214 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35214 ) ( ON-TABLE ?auto_35207 ) ( not ( = ?auto_35207 ?auto_35208 ) ) ( not ( = ?auto_35207 ?auto_35209 ) ) ( not ( = ?auto_35207 ?auto_35210 ) ) ( not ( = ?auto_35207 ?auto_35211 ) ) ( not ( = ?auto_35207 ?auto_35212 ) ) ( not ( = ?auto_35207 ?auto_35213 ) ) ( not ( = ?auto_35207 ?auto_35214 ) ) ( not ( = ?auto_35208 ?auto_35209 ) ) ( not ( = ?auto_35208 ?auto_35210 ) ) ( not ( = ?auto_35208 ?auto_35211 ) ) ( not ( = ?auto_35208 ?auto_35212 ) ) ( not ( = ?auto_35208 ?auto_35213 ) ) ( not ( = ?auto_35208 ?auto_35214 ) ) ( not ( = ?auto_35209 ?auto_35210 ) ) ( not ( = ?auto_35209 ?auto_35211 ) ) ( not ( = ?auto_35209 ?auto_35212 ) ) ( not ( = ?auto_35209 ?auto_35213 ) ) ( not ( = ?auto_35209 ?auto_35214 ) ) ( not ( = ?auto_35210 ?auto_35211 ) ) ( not ( = ?auto_35210 ?auto_35212 ) ) ( not ( = ?auto_35210 ?auto_35213 ) ) ( not ( = ?auto_35210 ?auto_35214 ) ) ( not ( = ?auto_35211 ?auto_35212 ) ) ( not ( = ?auto_35211 ?auto_35213 ) ) ( not ( = ?auto_35211 ?auto_35214 ) ) ( not ( = ?auto_35212 ?auto_35213 ) ) ( not ( = ?auto_35212 ?auto_35214 ) ) ( not ( = ?auto_35213 ?auto_35214 ) ) ( ON ?auto_35213 ?auto_35214 ) ( ON ?auto_35212 ?auto_35213 ) ( ON ?auto_35211 ?auto_35212 ) ( ON ?auto_35210 ?auto_35211 ) ( ON ?auto_35209 ?auto_35210 ) ( CLEAR ?auto_35207 ) ( ON ?auto_35208 ?auto_35209 ) ( CLEAR ?auto_35208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35207 ?auto_35208 )
      ( MAKE-8PILE ?auto_35207 ?auto_35208 ?auto_35209 ?auto_35210 ?auto_35211 ?auto_35212 ?auto_35213 ?auto_35214 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_35223 - BLOCK
      ?auto_35224 - BLOCK
      ?auto_35225 - BLOCK
      ?auto_35226 - BLOCK
      ?auto_35227 - BLOCK
      ?auto_35228 - BLOCK
      ?auto_35229 - BLOCK
      ?auto_35230 - BLOCK
    )
    :vars
    (
      ?auto_35231 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35230 ?auto_35231 ) ( not ( = ?auto_35223 ?auto_35224 ) ) ( not ( = ?auto_35223 ?auto_35225 ) ) ( not ( = ?auto_35223 ?auto_35226 ) ) ( not ( = ?auto_35223 ?auto_35227 ) ) ( not ( = ?auto_35223 ?auto_35228 ) ) ( not ( = ?auto_35223 ?auto_35229 ) ) ( not ( = ?auto_35223 ?auto_35230 ) ) ( not ( = ?auto_35223 ?auto_35231 ) ) ( not ( = ?auto_35224 ?auto_35225 ) ) ( not ( = ?auto_35224 ?auto_35226 ) ) ( not ( = ?auto_35224 ?auto_35227 ) ) ( not ( = ?auto_35224 ?auto_35228 ) ) ( not ( = ?auto_35224 ?auto_35229 ) ) ( not ( = ?auto_35224 ?auto_35230 ) ) ( not ( = ?auto_35224 ?auto_35231 ) ) ( not ( = ?auto_35225 ?auto_35226 ) ) ( not ( = ?auto_35225 ?auto_35227 ) ) ( not ( = ?auto_35225 ?auto_35228 ) ) ( not ( = ?auto_35225 ?auto_35229 ) ) ( not ( = ?auto_35225 ?auto_35230 ) ) ( not ( = ?auto_35225 ?auto_35231 ) ) ( not ( = ?auto_35226 ?auto_35227 ) ) ( not ( = ?auto_35226 ?auto_35228 ) ) ( not ( = ?auto_35226 ?auto_35229 ) ) ( not ( = ?auto_35226 ?auto_35230 ) ) ( not ( = ?auto_35226 ?auto_35231 ) ) ( not ( = ?auto_35227 ?auto_35228 ) ) ( not ( = ?auto_35227 ?auto_35229 ) ) ( not ( = ?auto_35227 ?auto_35230 ) ) ( not ( = ?auto_35227 ?auto_35231 ) ) ( not ( = ?auto_35228 ?auto_35229 ) ) ( not ( = ?auto_35228 ?auto_35230 ) ) ( not ( = ?auto_35228 ?auto_35231 ) ) ( not ( = ?auto_35229 ?auto_35230 ) ) ( not ( = ?auto_35229 ?auto_35231 ) ) ( not ( = ?auto_35230 ?auto_35231 ) ) ( ON ?auto_35229 ?auto_35230 ) ( ON ?auto_35228 ?auto_35229 ) ( ON ?auto_35227 ?auto_35228 ) ( ON ?auto_35226 ?auto_35227 ) ( ON ?auto_35225 ?auto_35226 ) ( ON ?auto_35224 ?auto_35225 ) ( ON ?auto_35223 ?auto_35224 ) ( CLEAR ?auto_35223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35223 )
      ( MAKE-8PILE ?auto_35223 ?auto_35224 ?auto_35225 ?auto_35226 ?auto_35227 ?auto_35228 ?auto_35229 ?auto_35230 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_35240 - BLOCK
      ?auto_35241 - BLOCK
      ?auto_35242 - BLOCK
      ?auto_35243 - BLOCK
      ?auto_35244 - BLOCK
      ?auto_35245 - BLOCK
      ?auto_35246 - BLOCK
      ?auto_35247 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35247 ) ( not ( = ?auto_35240 ?auto_35241 ) ) ( not ( = ?auto_35240 ?auto_35242 ) ) ( not ( = ?auto_35240 ?auto_35243 ) ) ( not ( = ?auto_35240 ?auto_35244 ) ) ( not ( = ?auto_35240 ?auto_35245 ) ) ( not ( = ?auto_35240 ?auto_35246 ) ) ( not ( = ?auto_35240 ?auto_35247 ) ) ( not ( = ?auto_35241 ?auto_35242 ) ) ( not ( = ?auto_35241 ?auto_35243 ) ) ( not ( = ?auto_35241 ?auto_35244 ) ) ( not ( = ?auto_35241 ?auto_35245 ) ) ( not ( = ?auto_35241 ?auto_35246 ) ) ( not ( = ?auto_35241 ?auto_35247 ) ) ( not ( = ?auto_35242 ?auto_35243 ) ) ( not ( = ?auto_35242 ?auto_35244 ) ) ( not ( = ?auto_35242 ?auto_35245 ) ) ( not ( = ?auto_35242 ?auto_35246 ) ) ( not ( = ?auto_35242 ?auto_35247 ) ) ( not ( = ?auto_35243 ?auto_35244 ) ) ( not ( = ?auto_35243 ?auto_35245 ) ) ( not ( = ?auto_35243 ?auto_35246 ) ) ( not ( = ?auto_35243 ?auto_35247 ) ) ( not ( = ?auto_35244 ?auto_35245 ) ) ( not ( = ?auto_35244 ?auto_35246 ) ) ( not ( = ?auto_35244 ?auto_35247 ) ) ( not ( = ?auto_35245 ?auto_35246 ) ) ( not ( = ?auto_35245 ?auto_35247 ) ) ( not ( = ?auto_35246 ?auto_35247 ) ) ( ON ?auto_35246 ?auto_35247 ) ( ON ?auto_35245 ?auto_35246 ) ( ON ?auto_35244 ?auto_35245 ) ( ON ?auto_35243 ?auto_35244 ) ( ON ?auto_35242 ?auto_35243 ) ( ON ?auto_35241 ?auto_35242 ) ( ON ?auto_35240 ?auto_35241 ) ( CLEAR ?auto_35240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35240 )
      ( MAKE-8PILE ?auto_35240 ?auto_35241 ?auto_35242 ?auto_35243 ?auto_35244 ?auto_35245 ?auto_35246 ?auto_35247 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_35256 - BLOCK
      ?auto_35257 - BLOCK
      ?auto_35258 - BLOCK
      ?auto_35259 - BLOCK
      ?auto_35260 - BLOCK
      ?auto_35261 - BLOCK
      ?auto_35262 - BLOCK
      ?auto_35263 - BLOCK
    )
    :vars
    (
      ?auto_35264 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35256 ?auto_35257 ) ) ( not ( = ?auto_35256 ?auto_35258 ) ) ( not ( = ?auto_35256 ?auto_35259 ) ) ( not ( = ?auto_35256 ?auto_35260 ) ) ( not ( = ?auto_35256 ?auto_35261 ) ) ( not ( = ?auto_35256 ?auto_35262 ) ) ( not ( = ?auto_35256 ?auto_35263 ) ) ( not ( = ?auto_35257 ?auto_35258 ) ) ( not ( = ?auto_35257 ?auto_35259 ) ) ( not ( = ?auto_35257 ?auto_35260 ) ) ( not ( = ?auto_35257 ?auto_35261 ) ) ( not ( = ?auto_35257 ?auto_35262 ) ) ( not ( = ?auto_35257 ?auto_35263 ) ) ( not ( = ?auto_35258 ?auto_35259 ) ) ( not ( = ?auto_35258 ?auto_35260 ) ) ( not ( = ?auto_35258 ?auto_35261 ) ) ( not ( = ?auto_35258 ?auto_35262 ) ) ( not ( = ?auto_35258 ?auto_35263 ) ) ( not ( = ?auto_35259 ?auto_35260 ) ) ( not ( = ?auto_35259 ?auto_35261 ) ) ( not ( = ?auto_35259 ?auto_35262 ) ) ( not ( = ?auto_35259 ?auto_35263 ) ) ( not ( = ?auto_35260 ?auto_35261 ) ) ( not ( = ?auto_35260 ?auto_35262 ) ) ( not ( = ?auto_35260 ?auto_35263 ) ) ( not ( = ?auto_35261 ?auto_35262 ) ) ( not ( = ?auto_35261 ?auto_35263 ) ) ( not ( = ?auto_35262 ?auto_35263 ) ) ( ON ?auto_35256 ?auto_35264 ) ( not ( = ?auto_35263 ?auto_35264 ) ) ( not ( = ?auto_35262 ?auto_35264 ) ) ( not ( = ?auto_35261 ?auto_35264 ) ) ( not ( = ?auto_35260 ?auto_35264 ) ) ( not ( = ?auto_35259 ?auto_35264 ) ) ( not ( = ?auto_35258 ?auto_35264 ) ) ( not ( = ?auto_35257 ?auto_35264 ) ) ( not ( = ?auto_35256 ?auto_35264 ) ) ( ON ?auto_35257 ?auto_35256 ) ( ON ?auto_35258 ?auto_35257 ) ( ON ?auto_35259 ?auto_35258 ) ( ON ?auto_35260 ?auto_35259 ) ( ON ?auto_35261 ?auto_35260 ) ( ON ?auto_35262 ?auto_35261 ) ( ON ?auto_35263 ?auto_35262 ) ( CLEAR ?auto_35263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_35263 ?auto_35262 ?auto_35261 ?auto_35260 ?auto_35259 ?auto_35258 ?auto_35257 ?auto_35256 )
      ( MAKE-8PILE ?auto_35256 ?auto_35257 ?auto_35258 ?auto_35259 ?auto_35260 ?auto_35261 ?auto_35262 ?auto_35263 ) )
  )

)

