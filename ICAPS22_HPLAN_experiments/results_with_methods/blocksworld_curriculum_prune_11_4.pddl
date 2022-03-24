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
      ?auto_115413 - BLOCK
    )
    :vars
    (
      ?auto_115414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115413 ?auto_115414 ) ( CLEAR ?auto_115413 ) ( HAND-EMPTY ) ( not ( = ?auto_115413 ?auto_115414 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_115413 ?auto_115414 )
      ( !PUTDOWN ?auto_115413 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_115420 - BLOCK
      ?auto_115421 - BLOCK
    )
    :vars
    (
      ?auto_115422 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_115420 ) ( ON ?auto_115421 ?auto_115422 ) ( CLEAR ?auto_115421 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_115420 ) ( not ( = ?auto_115420 ?auto_115421 ) ) ( not ( = ?auto_115420 ?auto_115422 ) ) ( not ( = ?auto_115421 ?auto_115422 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_115421 ?auto_115422 )
      ( !STACK ?auto_115421 ?auto_115420 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_115430 - BLOCK
      ?auto_115431 - BLOCK
    )
    :vars
    (
      ?auto_115432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115431 ?auto_115432 ) ( not ( = ?auto_115430 ?auto_115431 ) ) ( not ( = ?auto_115430 ?auto_115432 ) ) ( not ( = ?auto_115431 ?auto_115432 ) ) ( ON ?auto_115430 ?auto_115431 ) ( CLEAR ?auto_115430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_115430 )
      ( MAKE-2PILE ?auto_115430 ?auto_115431 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115441 - BLOCK
      ?auto_115442 - BLOCK
      ?auto_115443 - BLOCK
    )
    :vars
    (
      ?auto_115444 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_115442 ) ( ON ?auto_115443 ?auto_115444 ) ( CLEAR ?auto_115443 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_115441 ) ( ON ?auto_115442 ?auto_115441 ) ( not ( = ?auto_115441 ?auto_115442 ) ) ( not ( = ?auto_115441 ?auto_115443 ) ) ( not ( = ?auto_115441 ?auto_115444 ) ) ( not ( = ?auto_115442 ?auto_115443 ) ) ( not ( = ?auto_115442 ?auto_115444 ) ) ( not ( = ?auto_115443 ?auto_115444 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_115443 ?auto_115444 )
      ( !STACK ?auto_115443 ?auto_115442 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115455 - BLOCK
      ?auto_115456 - BLOCK
      ?auto_115457 - BLOCK
    )
    :vars
    (
      ?auto_115458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115457 ?auto_115458 ) ( ON-TABLE ?auto_115455 ) ( not ( = ?auto_115455 ?auto_115456 ) ) ( not ( = ?auto_115455 ?auto_115457 ) ) ( not ( = ?auto_115455 ?auto_115458 ) ) ( not ( = ?auto_115456 ?auto_115457 ) ) ( not ( = ?auto_115456 ?auto_115458 ) ) ( not ( = ?auto_115457 ?auto_115458 ) ) ( CLEAR ?auto_115455 ) ( ON ?auto_115456 ?auto_115457 ) ( CLEAR ?auto_115456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_115455 ?auto_115456 )
      ( MAKE-3PILE ?auto_115455 ?auto_115456 ?auto_115457 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115469 - BLOCK
      ?auto_115470 - BLOCK
      ?auto_115471 - BLOCK
    )
    :vars
    (
      ?auto_115472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115471 ?auto_115472 ) ( not ( = ?auto_115469 ?auto_115470 ) ) ( not ( = ?auto_115469 ?auto_115471 ) ) ( not ( = ?auto_115469 ?auto_115472 ) ) ( not ( = ?auto_115470 ?auto_115471 ) ) ( not ( = ?auto_115470 ?auto_115472 ) ) ( not ( = ?auto_115471 ?auto_115472 ) ) ( ON ?auto_115470 ?auto_115471 ) ( ON ?auto_115469 ?auto_115470 ) ( CLEAR ?auto_115469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_115469 )
      ( MAKE-3PILE ?auto_115469 ?auto_115470 ?auto_115471 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_115484 - BLOCK
      ?auto_115485 - BLOCK
      ?auto_115486 - BLOCK
      ?auto_115487 - BLOCK
    )
    :vars
    (
      ?auto_115488 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_115486 ) ( ON ?auto_115487 ?auto_115488 ) ( CLEAR ?auto_115487 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_115484 ) ( ON ?auto_115485 ?auto_115484 ) ( ON ?auto_115486 ?auto_115485 ) ( not ( = ?auto_115484 ?auto_115485 ) ) ( not ( = ?auto_115484 ?auto_115486 ) ) ( not ( = ?auto_115484 ?auto_115487 ) ) ( not ( = ?auto_115484 ?auto_115488 ) ) ( not ( = ?auto_115485 ?auto_115486 ) ) ( not ( = ?auto_115485 ?auto_115487 ) ) ( not ( = ?auto_115485 ?auto_115488 ) ) ( not ( = ?auto_115486 ?auto_115487 ) ) ( not ( = ?auto_115486 ?auto_115488 ) ) ( not ( = ?auto_115487 ?auto_115488 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_115487 ?auto_115488 )
      ( !STACK ?auto_115487 ?auto_115486 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_115502 - BLOCK
      ?auto_115503 - BLOCK
      ?auto_115504 - BLOCK
      ?auto_115505 - BLOCK
    )
    :vars
    (
      ?auto_115506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115505 ?auto_115506 ) ( ON-TABLE ?auto_115502 ) ( ON ?auto_115503 ?auto_115502 ) ( not ( = ?auto_115502 ?auto_115503 ) ) ( not ( = ?auto_115502 ?auto_115504 ) ) ( not ( = ?auto_115502 ?auto_115505 ) ) ( not ( = ?auto_115502 ?auto_115506 ) ) ( not ( = ?auto_115503 ?auto_115504 ) ) ( not ( = ?auto_115503 ?auto_115505 ) ) ( not ( = ?auto_115503 ?auto_115506 ) ) ( not ( = ?auto_115504 ?auto_115505 ) ) ( not ( = ?auto_115504 ?auto_115506 ) ) ( not ( = ?auto_115505 ?auto_115506 ) ) ( CLEAR ?auto_115503 ) ( ON ?auto_115504 ?auto_115505 ) ( CLEAR ?auto_115504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_115502 ?auto_115503 ?auto_115504 )
      ( MAKE-4PILE ?auto_115502 ?auto_115503 ?auto_115504 ?auto_115505 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_115520 - BLOCK
      ?auto_115521 - BLOCK
      ?auto_115522 - BLOCK
      ?auto_115523 - BLOCK
    )
    :vars
    (
      ?auto_115524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115523 ?auto_115524 ) ( ON-TABLE ?auto_115520 ) ( not ( = ?auto_115520 ?auto_115521 ) ) ( not ( = ?auto_115520 ?auto_115522 ) ) ( not ( = ?auto_115520 ?auto_115523 ) ) ( not ( = ?auto_115520 ?auto_115524 ) ) ( not ( = ?auto_115521 ?auto_115522 ) ) ( not ( = ?auto_115521 ?auto_115523 ) ) ( not ( = ?auto_115521 ?auto_115524 ) ) ( not ( = ?auto_115522 ?auto_115523 ) ) ( not ( = ?auto_115522 ?auto_115524 ) ) ( not ( = ?auto_115523 ?auto_115524 ) ) ( ON ?auto_115522 ?auto_115523 ) ( CLEAR ?auto_115520 ) ( ON ?auto_115521 ?auto_115522 ) ( CLEAR ?auto_115521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_115520 ?auto_115521 )
      ( MAKE-4PILE ?auto_115520 ?auto_115521 ?auto_115522 ?auto_115523 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_115538 - BLOCK
      ?auto_115539 - BLOCK
      ?auto_115540 - BLOCK
      ?auto_115541 - BLOCK
    )
    :vars
    (
      ?auto_115542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115541 ?auto_115542 ) ( not ( = ?auto_115538 ?auto_115539 ) ) ( not ( = ?auto_115538 ?auto_115540 ) ) ( not ( = ?auto_115538 ?auto_115541 ) ) ( not ( = ?auto_115538 ?auto_115542 ) ) ( not ( = ?auto_115539 ?auto_115540 ) ) ( not ( = ?auto_115539 ?auto_115541 ) ) ( not ( = ?auto_115539 ?auto_115542 ) ) ( not ( = ?auto_115540 ?auto_115541 ) ) ( not ( = ?auto_115540 ?auto_115542 ) ) ( not ( = ?auto_115541 ?auto_115542 ) ) ( ON ?auto_115540 ?auto_115541 ) ( ON ?auto_115539 ?auto_115540 ) ( ON ?auto_115538 ?auto_115539 ) ( CLEAR ?auto_115538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_115538 )
      ( MAKE-4PILE ?auto_115538 ?auto_115539 ?auto_115540 ?auto_115541 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_115557 - BLOCK
      ?auto_115558 - BLOCK
      ?auto_115559 - BLOCK
      ?auto_115560 - BLOCK
      ?auto_115561 - BLOCK
    )
    :vars
    (
      ?auto_115562 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_115560 ) ( ON ?auto_115561 ?auto_115562 ) ( CLEAR ?auto_115561 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_115557 ) ( ON ?auto_115558 ?auto_115557 ) ( ON ?auto_115559 ?auto_115558 ) ( ON ?auto_115560 ?auto_115559 ) ( not ( = ?auto_115557 ?auto_115558 ) ) ( not ( = ?auto_115557 ?auto_115559 ) ) ( not ( = ?auto_115557 ?auto_115560 ) ) ( not ( = ?auto_115557 ?auto_115561 ) ) ( not ( = ?auto_115557 ?auto_115562 ) ) ( not ( = ?auto_115558 ?auto_115559 ) ) ( not ( = ?auto_115558 ?auto_115560 ) ) ( not ( = ?auto_115558 ?auto_115561 ) ) ( not ( = ?auto_115558 ?auto_115562 ) ) ( not ( = ?auto_115559 ?auto_115560 ) ) ( not ( = ?auto_115559 ?auto_115561 ) ) ( not ( = ?auto_115559 ?auto_115562 ) ) ( not ( = ?auto_115560 ?auto_115561 ) ) ( not ( = ?auto_115560 ?auto_115562 ) ) ( not ( = ?auto_115561 ?auto_115562 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_115561 ?auto_115562 )
      ( !STACK ?auto_115561 ?auto_115560 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_115579 - BLOCK
      ?auto_115580 - BLOCK
      ?auto_115581 - BLOCK
      ?auto_115582 - BLOCK
      ?auto_115583 - BLOCK
    )
    :vars
    (
      ?auto_115584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115583 ?auto_115584 ) ( ON-TABLE ?auto_115579 ) ( ON ?auto_115580 ?auto_115579 ) ( ON ?auto_115581 ?auto_115580 ) ( not ( = ?auto_115579 ?auto_115580 ) ) ( not ( = ?auto_115579 ?auto_115581 ) ) ( not ( = ?auto_115579 ?auto_115582 ) ) ( not ( = ?auto_115579 ?auto_115583 ) ) ( not ( = ?auto_115579 ?auto_115584 ) ) ( not ( = ?auto_115580 ?auto_115581 ) ) ( not ( = ?auto_115580 ?auto_115582 ) ) ( not ( = ?auto_115580 ?auto_115583 ) ) ( not ( = ?auto_115580 ?auto_115584 ) ) ( not ( = ?auto_115581 ?auto_115582 ) ) ( not ( = ?auto_115581 ?auto_115583 ) ) ( not ( = ?auto_115581 ?auto_115584 ) ) ( not ( = ?auto_115582 ?auto_115583 ) ) ( not ( = ?auto_115582 ?auto_115584 ) ) ( not ( = ?auto_115583 ?auto_115584 ) ) ( CLEAR ?auto_115581 ) ( ON ?auto_115582 ?auto_115583 ) ( CLEAR ?auto_115582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_115579 ?auto_115580 ?auto_115581 ?auto_115582 )
      ( MAKE-5PILE ?auto_115579 ?auto_115580 ?auto_115581 ?auto_115582 ?auto_115583 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_115601 - BLOCK
      ?auto_115602 - BLOCK
      ?auto_115603 - BLOCK
      ?auto_115604 - BLOCK
      ?auto_115605 - BLOCK
    )
    :vars
    (
      ?auto_115606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115605 ?auto_115606 ) ( ON-TABLE ?auto_115601 ) ( ON ?auto_115602 ?auto_115601 ) ( not ( = ?auto_115601 ?auto_115602 ) ) ( not ( = ?auto_115601 ?auto_115603 ) ) ( not ( = ?auto_115601 ?auto_115604 ) ) ( not ( = ?auto_115601 ?auto_115605 ) ) ( not ( = ?auto_115601 ?auto_115606 ) ) ( not ( = ?auto_115602 ?auto_115603 ) ) ( not ( = ?auto_115602 ?auto_115604 ) ) ( not ( = ?auto_115602 ?auto_115605 ) ) ( not ( = ?auto_115602 ?auto_115606 ) ) ( not ( = ?auto_115603 ?auto_115604 ) ) ( not ( = ?auto_115603 ?auto_115605 ) ) ( not ( = ?auto_115603 ?auto_115606 ) ) ( not ( = ?auto_115604 ?auto_115605 ) ) ( not ( = ?auto_115604 ?auto_115606 ) ) ( not ( = ?auto_115605 ?auto_115606 ) ) ( ON ?auto_115604 ?auto_115605 ) ( CLEAR ?auto_115602 ) ( ON ?auto_115603 ?auto_115604 ) ( CLEAR ?auto_115603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_115601 ?auto_115602 ?auto_115603 )
      ( MAKE-5PILE ?auto_115601 ?auto_115602 ?auto_115603 ?auto_115604 ?auto_115605 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_115623 - BLOCK
      ?auto_115624 - BLOCK
      ?auto_115625 - BLOCK
      ?auto_115626 - BLOCK
      ?auto_115627 - BLOCK
    )
    :vars
    (
      ?auto_115628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115627 ?auto_115628 ) ( ON-TABLE ?auto_115623 ) ( not ( = ?auto_115623 ?auto_115624 ) ) ( not ( = ?auto_115623 ?auto_115625 ) ) ( not ( = ?auto_115623 ?auto_115626 ) ) ( not ( = ?auto_115623 ?auto_115627 ) ) ( not ( = ?auto_115623 ?auto_115628 ) ) ( not ( = ?auto_115624 ?auto_115625 ) ) ( not ( = ?auto_115624 ?auto_115626 ) ) ( not ( = ?auto_115624 ?auto_115627 ) ) ( not ( = ?auto_115624 ?auto_115628 ) ) ( not ( = ?auto_115625 ?auto_115626 ) ) ( not ( = ?auto_115625 ?auto_115627 ) ) ( not ( = ?auto_115625 ?auto_115628 ) ) ( not ( = ?auto_115626 ?auto_115627 ) ) ( not ( = ?auto_115626 ?auto_115628 ) ) ( not ( = ?auto_115627 ?auto_115628 ) ) ( ON ?auto_115626 ?auto_115627 ) ( ON ?auto_115625 ?auto_115626 ) ( CLEAR ?auto_115623 ) ( ON ?auto_115624 ?auto_115625 ) ( CLEAR ?auto_115624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_115623 ?auto_115624 )
      ( MAKE-5PILE ?auto_115623 ?auto_115624 ?auto_115625 ?auto_115626 ?auto_115627 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_115645 - BLOCK
      ?auto_115646 - BLOCK
      ?auto_115647 - BLOCK
      ?auto_115648 - BLOCK
      ?auto_115649 - BLOCK
    )
    :vars
    (
      ?auto_115650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115649 ?auto_115650 ) ( not ( = ?auto_115645 ?auto_115646 ) ) ( not ( = ?auto_115645 ?auto_115647 ) ) ( not ( = ?auto_115645 ?auto_115648 ) ) ( not ( = ?auto_115645 ?auto_115649 ) ) ( not ( = ?auto_115645 ?auto_115650 ) ) ( not ( = ?auto_115646 ?auto_115647 ) ) ( not ( = ?auto_115646 ?auto_115648 ) ) ( not ( = ?auto_115646 ?auto_115649 ) ) ( not ( = ?auto_115646 ?auto_115650 ) ) ( not ( = ?auto_115647 ?auto_115648 ) ) ( not ( = ?auto_115647 ?auto_115649 ) ) ( not ( = ?auto_115647 ?auto_115650 ) ) ( not ( = ?auto_115648 ?auto_115649 ) ) ( not ( = ?auto_115648 ?auto_115650 ) ) ( not ( = ?auto_115649 ?auto_115650 ) ) ( ON ?auto_115648 ?auto_115649 ) ( ON ?auto_115647 ?auto_115648 ) ( ON ?auto_115646 ?auto_115647 ) ( ON ?auto_115645 ?auto_115646 ) ( CLEAR ?auto_115645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_115645 )
      ( MAKE-5PILE ?auto_115645 ?auto_115646 ?auto_115647 ?auto_115648 ?auto_115649 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_115668 - BLOCK
      ?auto_115669 - BLOCK
      ?auto_115670 - BLOCK
      ?auto_115671 - BLOCK
      ?auto_115672 - BLOCK
      ?auto_115673 - BLOCK
    )
    :vars
    (
      ?auto_115674 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_115672 ) ( ON ?auto_115673 ?auto_115674 ) ( CLEAR ?auto_115673 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_115668 ) ( ON ?auto_115669 ?auto_115668 ) ( ON ?auto_115670 ?auto_115669 ) ( ON ?auto_115671 ?auto_115670 ) ( ON ?auto_115672 ?auto_115671 ) ( not ( = ?auto_115668 ?auto_115669 ) ) ( not ( = ?auto_115668 ?auto_115670 ) ) ( not ( = ?auto_115668 ?auto_115671 ) ) ( not ( = ?auto_115668 ?auto_115672 ) ) ( not ( = ?auto_115668 ?auto_115673 ) ) ( not ( = ?auto_115668 ?auto_115674 ) ) ( not ( = ?auto_115669 ?auto_115670 ) ) ( not ( = ?auto_115669 ?auto_115671 ) ) ( not ( = ?auto_115669 ?auto_115672 ) ) ( not ( = ?auto_115669 ?auto_115673 ) ) ( not ( = ?auto_115669 ?auto_115674 ) ) ( not ( = ?auto_115670 ?auto_115671 ) ) ( not ( = ?auto_115670 ?auto_115672 ) ) ( not ( = ?auto_115670 ?auto_115673 ) ) ( not ( = ?auto_115670 ?auto_115674 ) ) ( not ( = ?auto_115671 ?auto_115672 ) ) ( not ( = ?auto_115671 ?auto_115673 ) ) ( not ( = ?auto_115671 ?auto_115674 ) ) ( not ( = ?auto_115672 ?auto_115673 ) ) ( not ( = ?auto_115672 ?auto_115674 ) ) ( not ( = ?auto_115673 ?auto_115674 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_115673 ?auto_115674 )
      ( !STACK ?auto_115673 ?auto_115672 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_115694 - BLOCK
      ?auto_115695 - BLOCK
      ?auto_115696 - BLOCK
      ?auto_115697 - BLOCK
      ?auto_115698 - BLOCK
      ?auto_115699 - BLOCK
    )
    :vars
    (
      ?auto_115700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115699 ?auto_115700 ) ( ON-TABLE ?auto_115694 ) ( ON ?auto_115695 ?auto_115694 ) ( ON ?auto_115696 ?auto_115695 ) ( ON ?auto_115697 ?auto_115696 ) ( not ( = ?auto_115694 ?auto_115695 ) ) ( not ( = ?auto_115694 ?auto_115696 ) ) ( not ( = ?auto_115694 ?auto_115697 ) ) ( not ( = ?auto_115694 ?auto_115698 ) ) ( not ( = ?auto_115694 ?auto_115699 ) ) ( not ( = ?auto_115694 ?auto_115700 ) ) ( not ( = ?auto_115695 ?auto_115696 ) ) ( not ( = ?auto_115695 ?auto_115697 ) ) ( not ( = ?auto_115695 ?auto_115698 ) ) ( not ( = ?auto_115695 ?auto_115699 ) ) ( not ( = ?auto_115695 ?auto_115700 ) ) ( not ( = ?auto_115696 ?auto_115697 ) ) ( not ( = ?auto_115696 ?auto_115698 ) ) ( not ( = ?auto_115696 ?auto_115699 ) ) ( not ( = ?auto_115696 ?auto_115700 ) ) ( not ( = ?auto_115697 ?auto_115698 ) ) ( not ( = ?auto_115697 ?auto_115699 ) ) ( not ( = ?auto_115697 ?auto_115700 ) ) ( not ( = ?auto_115698 ?auto_115699 ) ) ( not ( = ?auto_115698 ?auto_115700 ) ) ( not ( = ?auto_115699 ?auto_115700 ) ) ( CLEAR ?auto_115697 ) ( ON ?auto_115698 ?auto_115699 ) ( CLEAR ?auto_115698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_115694 ?auto_115695 ?auto_115696 ?auto_115697 ?auto_115698 )
      ( MAKE-6PILE ?auto_115694 ?auto_115695 ?auto_115696 ?auto_115697 ?auto_115698 ?auto_115699 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_115720 - BLOCK
      ?auto_115721 - BLOCK
      ?auto_115722 - BLOCK
      ?auto_115723 - BLOCK
      ?auto_115724 - BLOCK
      ?auto_115725 - BLOCK
    )
    :vars
    (
      ?auto_115726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115725 ?auto_115726 ) ( ON-TABLE ?auto_115720 ) ( ON ?auto_115721 ?auto_115720 ) ( ON ?auto_115722 ?auto_115721 ) ( not ( = ?auto_115720 ?auto_115721 ) ) ( not ( = ?auto_115720 ?auto_115722 ) ) ( not ( = ?auto_115720 ?auto_115723 ) ) ( not ( = ?auto_115720 ?auto_115724 ) ) ( not ( = ?auto_115720 ?auto_115725 ) ) ( not ( = ?auto_115720 ?auto_115726 ) ) ( not ( = ?auto_115721 ?auto_115722 ) ) ( not ( = ?auto_115721 ?auto_115723 ) ) ( not ( = ?auto_115721 ?auto_115724 ) ) ( not ( = ?auto_115721 ?auto_115725 ) ) ( not ( = ?auto_115721 ?auto_115726 ) ) ( not ( = ?auto_115722 ?auto_115723 ) ) ( not ( = ?auto_115722 ?auto_115724 ) ) ( not ( = ?auto_115722 ?auto_115725 ) ) ( not ( = ?auto_115722 ?auto_115726 ) ) ( not ( = ?auto_115723 ?auto_115724 ) ) ( not ( = ?auto_115723 ?auto_115725 ) ) ( not ( = ?auto_115723 ?auto_115726 ) ) ( not ( = ?auto_115724 ?auto_115725 ) ) ( not ( = ?auto_115724 ?auto_115726 ) ) ( not ( = ?auto_115725 ?auto_115726 ) ) ( ON ?auto_115724 ?auto_115725 ) ( CLEAR ?auto_115722 ) ( ON ?auto_115723 ?auto_115724 ) ( CLEAR ?auto_115723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_115720 ?auto_115721 ?auto_115722 ?auto_115723 )
      ( MAKE-6PILE ?auto_115720 ?auto_115721 ?auto_115722 ?auto_115723 ?auto_115724 ?auto_115725 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_115746 - BLOCK
      ?auto_115747 - BLOCK
      ?auto_115748 - BLOCK
      ?auto_115749 - BLOCK
      ?auto_115750 - BLOCK
      ?auto_115751 - BLOCK
    )
    :vars
    (
      ?auto_115752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115751 ?auto_115752 ) ( ON-TABLE ?auto_115746 ) ( ON ?auto_115747 ?auto_115746 ) ( not ( = ?auto_115746 ?auto_115747 ) ) ( not ( = ?auto_115746 ?auto_115748 ) ) ( not ( = ?auto_115746 ?auto_115749 ) ) ( not ( = ?auto_115746 ?auto_115750 ) ) ( not ( = ?auto_115746 ?auto_115751 ) ) ( not ( = ?auto_115746 ?auto_115752 ) ) ( not ( = ?auto_115747 ?auto_115748 ) ) ( not ( = ?auto_115747 ?auto_115749 ) ) ( not ( = ?auto_115747 ?auto_115750 ) ) ( not ( = ?auto_115747 ?auto_115751 ) ) ( not ( = ?auto_115747 ?auto_115752 ) ) ( not ( = ?auto_115748 ?auto_115749 ) ) ( not ( = ?auto_115748 ?auto_115750 ) ) ( not ( = ?auto_115748 ?auto_115751 ) ) ( not ( = ?auto_115748 ?auto_115752 ) ) ( not ( = ?auto_115749 ?auto_115750 ) ) ( not ( = ?auto_115749 ?auto_115751 ) ) ( not ( = ?auto_115749 ?auto_115752 ) ) ( not ( = ?auto_115750 ?auto_115751 ) ) ( not ( = ?auto_115750 ?auto_115752 ) ) ( not ( = ?auto_115751 ?auto_115752 ) ) ( ON ?auto_115750 ?auto_115751 ) ( ON ?auto_115749 ?auto_115750 ) ( CLEAR ?auto_115747 ) ( ON ?auto_115748 ?auto_115749 ) ( CLEAR ?auto_115748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_115746 ?auto_115747 ?auto_115748 )
      ( MAKE-6PILE ?auto_115746 ?auto_115747 ?auto_115748 ?auto_115749 ?auto_115750 ?auto_115751 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_115772 - BLOCK
      ?auto_115773 - BLOCK
      ?auto_115774 - BLOCK
      ?auto_115775 - BLOCK
      ?auto_115776 - BLOCK
      ?auto_115777 - BLOCK
    )
    :vars
    (
      ?auto_115778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115777 ?auto_115778 ) ( ON-TABLE ?auto_115772 ) ( not ( = ?auto_115772 ?auto_115773 ) ) ( not ( = ?auto_115772 ?auto_115774 ) ) ( not ( = ?auto_115772 ?auto_115775 ) ) ( not ( = ?auto_115772 ?auto_115776 ) ) ( not ( = ?auto_115772 ?auto_115777 ) ) ( not ( = ?auto_115772 ?auto_115778 ) ) ( not ( = ?auto_115773 ?auto_115774 ) ) ( not ( = ?auto_115773 ?auto_115775 ) ) ( not ( = ?auto_115773 ?auto_115776 ) ) ( not ( = ?auto_115773 ?auto_115777 ) ) ( not ( = ?auto_115773 ?auto_115778 ) ) ( not ( = ?auto_115774 ?auto_115775 ) ) ( not ( = ?auto_115774 ?auto_115776 ) ) ( not ( = ?auto_115774 ?auto_115777 ) ) ( not ( = ?auto_115774 ?auto_115778 ) ) ( not ( = ?auto_115775 ?auto_115776 ) ) ( not ( = ?auto_115775 ?auto_115777 ) ) ( not ( = ?auto_115775 ?auto_115778 ) ) ( not ( = ?auto_115776 ?auto_115777 ) ) ( not ( = ?auto_115776 ?auto_115778 ) ) ( not ( = ?auto_115777 ?auto_115778 ) ) ( ON ?auto_115776 ?auto_115777 ) ( ON ?auto_115775 ?auto_115776 ) ( ON ?auto_115774 ?auto_115775 ) ( CLEAR ?auto_115772 ) ( ON ?auto_115773 ?auto_115774 ) ( CLEAR ?auto_115773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_115772 ?auto_115773 )
      ( MAKE-6PILE ?auto_115772 ?auto_115773 ?auto_115774 ?auto_115775 ?auto_115776 ?auto_115777 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_115798 - BLOCK
      ?auto_115799 - BLOCK
      ?auto_115800 - BLOCK
      ?auto_115801 - BLOCK
      ?auto_115802 - BLOCK
      ?auto_115803 - BLOCK
    )
    :vars
    (
      ?auto_115804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115803 ?auto_115804 ) ( not ( = ?auto_115798 ?auto_115799 ) ) ( not ( = ?auto_115798 ?auto_115800 ) ) ( not ( = ?auto_115798 ?auto_115801 ) ) ( not ( = ?auto_115798 ?auto_115802 ) ) ( not ( = ?auto_115798 ?auto_115803 ) ) ( not ( = ?auto_115798 ?auto_115804 ) ) ( not ( = ?auto_115799 ?auto_115800 ) ) ( not ( = ?auto_115799 ?auto_115801 ) ) ( not ( = ?auto_115799 ?auto_115802 ) ) ( not ( = ?auto_115799 ?auto_115803 ) ) ( not ( = ?auto_115799 ?auto_115804 ) ) ( not ( = ?auto_115800 ?auto_115801 ) ) ( not ( = ?auto_115800 ?auto_115802 ) ) ( not ( = ?auto_115800 ?auto_115803 ) ) ( not ( = ?auto_115800 ?auto_115804 ) ) ( not ( = ?auto_115801 ?auto_115802 ) ) ( not ( = ?auto_115801 ?auto_115803 ) ) ( not ( = ?auto_115801 ?auto_115804 ) ) ( not ( = ?auto_115802 ?auto_115803 ) ) ( not ( = ?auto_115802 ?auto_115804 ) ) ( not ( = ?auto_115803 ?auto_115804 ) ) ( ON ?auto_115802 ?auto_115803 ) ( ON ?auto_115801 ?auto_115802 ) ( ON ?auto_115800 ?auto_115801 ) ( ON ?auto_115799 ?auto_115800 ) ( ON ?auto_115798 ?auto_115799 ) ( CLEAR ?auto_115798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_115798 )
      ( MAKE-6PILE ?auto_115798 ?auto_115799 ?auto_115800 ?auto_115801 ?auto_115802 ?auto_115803 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115825 - BLOCK
      ?auto_115826 - BLOCK
      ?auto_115827 - BLOCK
      ?auto_115828 - BLOCK
      ?auto_115829 - BLOCK
      ?auto_115830 - BLOCK
      ?auto_115831 - BLOCK
    )
    :vars
    (
      ?auto_115832 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_115830 ) ( ON ?auto_115831 ?auto_115832 ) ( CLEAR ?auto_115831 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_115825 ) ( ON ?auto_115826 ?auto_115825 ) ( ON ?auto_115827 ?auto_115826 ) ( ON ?auto_115828 ?auto_115827 ) ( ON ?auto_115829 ?auto_115828 ) ( ON ?auto_115830 ?auto_115829 ) ( not ( = ?auto_115825 ?auto_115826 ) ) ( not ( = ?auto_115825 ?auto_115827 ) ) ( not ( = ?auto_115825 ?auto_115828 ) ) ( not ( = ?auto_115825 ?auto_115829 ) ) ( not ( = ?auto_115825 ?auto_115830 ) ) ( not ( = ?auto_115825 ?auto_115831 ) ) ( not ( = ?auto_115825 ?auto_115832 ) ) ( not ( = ?auto_115826 ?auto_115827 ) ) ( not ( = ?auto_115826 ?auto_115828 ) ) ( not ( = ?auto_115826 ?auto_115829 ) ) ( not ( = ?auto_115826 ?auto_115830 ) ) ( not ( = ?auto_115826 ?auto_115831 ) ) ( not ( = ?auto_115826 ?auto_115832 ) ) ( not ( = ?auto_115827 ?auto_115828 ) ) ( not ( = ?auto_115827 ?auto_115829 ) ) ( not ( = ?auto_115827 ?auto_115830 ) ) ( not ( = ?auto_115827 ?auto_115831 ) ) ( not ( = ?auto_115827 ?auto_115832 ) ) ( not ( = ?auto_115828 ?auto_115829 ) ) ( not ( = ?auto_115828 ?auto_115830 ) ) ( not ( = ?auto_115828 ?auto_115831 ) ) ( not ( = ?auto_115828 ?auto_115832 ) ) ( not ( = ?auto_115829 ?auto_115830 ) ) ( not ( = ?auto_115829 ?auto_115831 ) ) ( not ( = ?auto_115829 ?auto_115832 ) ) ( not ( = ?auto_115830 ?auto_115831 ) ) ( not ( = ?auto_115830 ?auto_115832 ) ) ( not ( = ?auto_115831 ?auto_115832 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_115831 ?auto_115832 )
      ( !STACK ?auto_115831 ?auto_115830 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115855 - BLOCK
      ?auto_115856 - BLOCK
      ?auto_115857 - BLOCK
      ?auto_115858 - BLOCK
      ?auto_115859 - BLOCK
      ?auto_115860 - BLOCK
      ?auto_115861 - BLOCK
    )
    :vars
    (
      ?auto_115862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115861 ?auto_115862 ) ( ON-TABLE ?auto_115855 ) ( ON ?auto_115856 ?auto_115855 ) ( ON ?auto_115857 ?auto_115856 ) ( ON ?auto_115858 ?auto_115857 ) ( ON ?auto_115859 ?auto_115858 ) ( not ( = ?auto_115855 ?auto_115856 ) ) ( not ( = ?auto_115855 ?auto_115857 ) ) ( not ( = ?auto_115855 ?auto_115858 ) ) ( not ( = ?auto_115855 ?auto_115859 ) ) ( not ( = ?auto_115855 ?auto_115860 ) ) ( not ( = ?auto_115855 ?auto_115861 ) ) ( not ( = ?auto_115855 ?auto_115862 ) ) ( not ( = ?auto_115856 ?auto_115857 ) ) ( not ( = ?auto_115856 ?auto_115858 ) ) ( not ( = ?auto_115856 ?auto_115859 ) ) ( not ( = ?auto_115856 ?auto_115860 ) ) ( not ( = ?auto_115856 ?auto_115861 ) ) ( not ( = ?auto_115856 ?auto_115862 ) ) ( not ( = ?auto_115857 ?auto_115858 ) ) ( not ( = ?auto_115857 ?auto_115859 ) ) ( not ( = ?auto_115857 ?auto_115860 ) ) ( not ( = ?auto_115857 ?auto_115861 ) ) ( not ( = ?auto_115857 ?auto_115862 ) ) ( not ( = ?auto_115858 ?auto_115859 ) ) ( not ( = ?auto_115858 ?auto_115860 ) ) ( not ( = ?auto_115858 ?auto_115861 ) ) ( not ( = ?auto_115858 ?auto_115862 ) ) ( not ( = ?auto_115859 ?auto_115860 ) ) ( not ( = ?auto_115859 ?auto_115861 ) ) ( not ( = ?auto_115859 ?auto_115862 ) ) ( not ( = ?auto_115860 ?auto_115861 ) ) ( not ( = ?auto_115860 ?auto_115862 ) ) ( not ( = ?auto_115861 ?auto_115862 ) ) ( CLEAR ?auto_115859 ) ( ON ?auto_115860 ?auto_115861 ) ( CLEAR ?auto_115860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_115855 ?auto_115856 ?auto_115857 ?auto_115858 ?auto_115859 ?auto_115860 )
      ( MAKE-7PILE ?auto_115855 ?auto_115856 ?auto_115857 ?auto_115858 ?auto_115859 ?auto_115860 ?auto_115861 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115885 - BLOCK
      ?auto_115886 - BLOCK
      ?auto_115887 - BLOCK
      ?auto_115888 - BLOCK
      ?auto_115889 - BLOCK
      ?auto_115890 - BLOCK
      ?auto_115891 - BLOCK
    )
    :vars
    (
      ?auto_115892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115891 ?auto_115892 ) ( ON-TABLE ?auto_115885 ) ( ON ?auto_115886 ?auto_115885 ) ( ON ?auto_115887 ?auto_115886 ) ( ON ?auto_115888 ?auto_115887 ) ( not ( = ?auto_115885 ?auto_115886 ) ) ( not ( = ?auto_115885 ?auto_115887 ) ) ( not ( = ?auto_115885 ?auto_115888 ) ) ( not ( = ?auto_115885 ?auto_115889 ) ) ( not ( = ?auto_115885 ?auto_115890 ) ) ( not ( = ?auto_115885 ?auto_115891 ) ) ( not ( = ?auto_115885 ?auto_115892 ) ) ( not ( = ?auto_115886 ?auto_115887 ) ) ( not ( = ?auto_115886 ?auto_115888 ) ) ( not ( = ?auto_115886 ?auto_115889 ) ) ( not ( = ?auto_115886 ?auto_115890 ) ) ( not ( = ?auto_115886 ?auto_115891 ) ) ( not ( = ?auto_115886 ?auto_115892 ) ) ( not ( = ?auto_115887 ?auto_115888 ) ) ( not ( = ?auto_115887 ?auto_115889 ) ) ( not ( = ?auto_115887 ?auto_115890 ) ) ( not ( = ?auto_115887 ?auto_115891 ) ) ( not ( = ?auto_115887 ?auto_115892 ) ) ( not ( = ?auto_115888 ?auto_115889 ) ) ( not ( = ?auto_115888 ?auto_115890 ) ) ( not ( = ?auto_115888 ?auto_115891 ) ) ( not ( = ?auto_115888 ?auto_115892 ) ) ( not ( = ?auto_115889 ?auto_115890 ) ) ( not ( = ?auto_115889 ?auto_115891 ) ) ( not ( = ?auto_115889 ?auto_115892 ) ) ( not ( = ?auto_115890 ?auto_115891 ) ) ( not ( = ?auto_115890 ?auto_115892 ) ) ( not ( = ?auto_115891 ?auto_115892 ) ) ( ON ?auto_115890 ?auto_115891 ) ( CLEAR ?auto_115888 ) ( ON ?auto_115889 ?auto_115890 ) ( CLEAR ?auto_115889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_115885 ?auto_115886 ?auto_115887 ?auto_115888 ?auto_115889 )
      ( MAKE-7PILE ?auto_115885 ?auto_115886 ?auto_115887 ?auto_115888 ?auto_115889 ?auto_115890 ?auto_115891 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115915 - BLOCK
      ?auto_115916 - BLOCK
      ?auto_115917 - BLOCK
      ?auto_115918 - BLOCK
      ?auto_115919 - BLOCK
      ?auto_115920 - BLOCK
      ?auto_115921 - BLOCK
    )
    :vars
    (
      ?auto_115922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115921 ?auto_115922 ) ( ON-TABLE ?auto_115915 ) ( ON ?auto_115916 ?auto_115915 ) ( ON ?auto_115917 ?auto_115916 ) ( not ( = ?auto_115915 ?auto_115916 ) ) ( not ( = ?auto_115915 ?auto_115917 ) ) ( not ( = ?auto_115915 ?auto_115918 ) ) ( not ( = ?auto_115915 ?auto_115919 ) ) ( not ( = ?auto_115915 ?auto_115920 ) ) ( not ( = ?auto_115915 ?auto_115921 ) ) ( not ( = ?auto_115915 ?auto_115922 ) ) ( not ( = ?auto_115916 ?auto_115917 ) ) ( not ( = ?auto_115916 ?auto_115918 ) ) ( not ( = ?auto_115916 ?auto_115919 ) ) ( not ( = ?auto_115916 ?auto_115920 ) ) ( not ( = ?auto_115916 ?auto_115921 ) ) ( not ( = ?auto_115916 ?auto_115922 ) ) ( not ( = ?auto_115917 ?auto_115918 ) ) ( not ( = ?auto_115917 ?auto_115919 ) ) ( not ( = ?auto_115917 ?auto_115920 ) ) ( not ( = ?auto_115917 ?auto_115921 ) ) ( not ( = ?auto_115917 ?auto_115922 ) ) ( not ( = ?auto_115918 ?auto_115919 ) ) ( not ( = ?auto_115918 ?auto_115920 ) ) ( not ( = ?auto_115918 ?auto_115921 ) ) ( not ( = ?auto_115918 ?auto_115922 ) ) ( not ( = ?auto_115919 ?auto_115920 ) ) ( not ( = ?auto_115919 ?auto_115921 ) ) ( not ( = ?auto_115919 ?auto_115922 ) ) ( not ( = ?auto_115920 ?auto_115921 ) ) ( not ( = ?auto_115920 ?auto_115922 ) ) ( not ( = ?auto_115921 ?auto_115922 ) ) ( ON ?auto_115920 ?auto_115921 ) ( ON ?auto_115919 ?auto_115920 ) ( CLEAR ?auto_115917 ) ( ON ?auto_115918 ?auto_115919 ) ( CLEAR ?auto_115918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_115915 ?auto_115916 ?auto_115917 ?auto_115918 )
      ( MAKE-7PILE ?auto_115915 ?auto_115916 ?auto_115917 ?auto_115918 ?auto_115919 ?auto_115920 ?auto_115921 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115945 - BLOCK
      ?auto_115946 - BLOCK
      ?auto_115947 - BLOCK
      ?auto_115948 - BLOCK
      ?auto_115949 - BLOCK
      ?auto_115950 - BLOCK
      ?auto_115951 - BLOCK
    )
    :vars
    (
      ?auto_115952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115951 ?auto_115952 ) ( ON-TABLE ?auto_115945 ) ( ON ?auto_115946 ?auto_115945 ) ( not ( = ?auto_115945 ?auto_115946 ) ) ( not ( = ?auto_115945 ?auto_115947 ) ) ( not ( = ?auto_115945 ?auto_115948 ) ) ( not ( = ?auto_115945 ?auto_115949 ) ) ( not ( = ?auto_115945 ?auto_115950 ) ) ( not ( = ?auto_115945 ?auto_115951 ) ) ( not ( = ?auto_115945 ?auto_115952 ) ) ( not ( = ?auto_115946 ?auto_115947 ) ) ( not ( = ?auto_115946 ?auto_115948 ) ) ( not ( = ?auto_115946 ?auto_115949 ) ) ( not ( = ?auto_115946 ?auto_115950 ) ) ( not ( = ?auto_115946 ?auto_115951 ) ) ( not ( = ?auto_115946 ?auto_115952 ) ) ( not ( = ?auto_115947 ?auto_115948 ) ) ( not ( = ?auto_115947 ?auto_115949 ) ) ( not ( = ?auto_115947 ?auto_115950 ) ) ( not ( = ?auto_115947 ?auto_115951 ) ) ( not ( = ?auto_115947 ?auto_115952 ) ) ( not ( = ?auto_115948 ?auto_115949 ) ) ( not ( = ?auto_115948 ?auto_115950 ) ) ( not ( = ?auto_115948 ?auto_115951 ) ) ( not ( = ?auto_115948 ?auto_115952 ) ) ( not ( = ?auto_115949 ?auto_115950 ) ) ( not ( = ?auto_115949 ?auto_115951 ) ) ( not ( = ?auto_115949 ?auto_115952 ) ) ( not ( = ?auto_115950 ?auto_115951 ) ) ( not ( = ?auto_115950 ?auto_115952 ) ) ( not ( = ?auto_115951 ?auto_115952 ) ) ( ON ?auto_115950 ?auto_115951 ) ( ON ?auto_115949 ?auto_115950 ) ( ON ?auto_115948 ?auto_115949 ) ( CLEAR ?auto_115946 ) ( ON ?auto_115947 ?auto_115948 ) ( CLEAR ?auto_115947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_115945 ?auto_115946 ?auto_115947 )
      ( MAKE-7PILE ?auto_115945 ?auto_115946 ?auto_115947 ?auto_115948 ?auto_115949 ?auto_115950 ?auto_115951 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115975 - BLOCK
      ?auto_115976 - BLOCK
      ?auto_115977 - BLOCK
      ?auto_115978 - BLOCK
      ?auto_115979 - BLOCK
      ?auto_115980 - BLOCK
      ?auto_115981 - BLOCK
    )
    :vars
    (
      ?auto_115982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115981 ?auto_115982 ) ( ON-TABLE ?auto_115975 ) ( not ( = ?auto_115975 ?auto_115976 ) ) ( not ( = ?auto_115975 ?auto_115977 ) ) ( not ( = ?auto_115975 ?auto_115978 ) ) ( not ( = ?auto_115975 ?auto_115979 ) ) ( not ( = ?auto_115975 ?auto_115980 ) ) ( not ( = ?auto_115975 ?auto_115981 ) ) ( not ( = ?auto_115975 ?auto_115982 ) ) ( not ( = ?auto_115976 ?auto_115977 ) ) ( not ( = ?auto_115976 ?auto_115978 ) ) ( not ( = ?auto_115976 ?auto_115979 ) ) ( not ( = ?auto_115976 ?auto_115980 ) ) ( not ( = ?auto_115976 ?auto_115981 ) ) ( not ( = ?auto_115976 ?auto_115982 ) ) ( not ( = ?auto_115977 ?auto_115978 ) ) ( not ( = ?auto_115977 ?auto_115979 ) ) ( not ( = ?auto_115977 ?auto_115980 ) ) ( not ( = ?auto_115977 ?auto_115981 ) ) ( not ( = ?auto_115977 ?auto_115982 ) ) ( not ( = ?auto_115978 ?auto_115979 ) ) ( not ( = ?auto_115978 ?auto_115980 ) ) ( not ( = ?auto_115978 ?auto_115981 ) ) ( not ( = ?auto_115978 ?auto_115982 ) ) ( not ( = ?auto_115979 ?auto_115980 ) ) ( not ( = ?auto_115979 ?auto_115981 ) ) ( not ( = ?auto_115979 ?auto_115982 ) ) ( not ( = ?auto_115980 ?auto_115981 ) ) ( not ( = ?auto_115980 ?auto_115982 ) ) ( not ( = ?auto_115981 ?auto_115982 ) ) ( ON ?auto_115980 ?auto_115981 ) ( ON ?auto_115979 ?auto_115980 ) ( ON ?auto_115978 ?auto_115979 ) ( ON ?auto_115977 ?auto_115978 ) ( CLEAR ?auto_115975 ) ( ON ?auto_115976 ?auto_115977 ) ( CLEAR ?auto_115976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_115975 ?auto_115976 )
      ( MAKE-7PILE ?auto_115975 ?auto_115976 ?auto_115977 ?auto_115978 ?auto_115979 ?auto_115980 ?auto_115981 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116005 - BLOCK
      ?auto_116006 - BLOCK
      ?auto_116007 - BLOCK
      ?auto_116008 - BLOCK
      ?auto_116009 - BLOCK
      ?auto_116010 - BLOCK
      ?auto_116011 - BLOCK
    )
    :vars
    (
      ?auto_116012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116011 ?auto_116012 ) ( not ( = ?auto_116005 ?auto_116006 ) ) ( not ( = ?auto_116005 ?auto_116007 ) ) ( not ( = ?auto_116005 ?auto_116008 ) ) ( not ( = ?auto_116005 ?auto_116009 ) ) ( not ( = ?auto_116005 ?auto_116010 ) ) ( not ( = ?auto_116005 ?auto_116011 ) ) ( not ( = ?auto_116005 ?auto_116012 ) ) ( not ( = ?auto_116006 ?auto_116007 ) ) ( not ( = ?auto_116006 ?auto_116008 ) ) ( not ( = ?auto_116006 ?auto_116009 ) ) ( not ( = ?auto_116006 ?auto_116010 ) ) ( not ( = ?auto_116006 ?auto_116011 ) ) ( not ( = ?auto_116006 ?auto_116012 ) ) ( not ( = ?auto_116007 ?auto_116008 ) ) ( not ( = ?auto_116007 ?auto_116009 ) ) ( not ( = ?auto_116007 ?auto_116010 ) ) ( not ( = ?auto_116007 ?auto_116011 ) ) ( not ( = ?auto_116007 ?auto_116012 ) ) ( not ( = ?auto_116008 ?auto_116009 ) ) ( not ( = ?auto_116008 ?auto_116010 ) ) ( not ( = ?auto_116008 ?auto_116011 ) ) ( not ( = ?auto_116008 ?auto_116012 ) ) ( not ( = ?auto_116009 ?auto_116010 ) ) ( not ( = ?auto_116009 ?auto_116011 ) ) ( not ( = ?auto_116009 ?auto_116012 ) ) ( not ( = ?auto_116010 ?auto_116011 ) ) ( not ( = ?auto_116010 ?auto_116012 ) ) ( not ( = ?auto_116011 ?auto_116012 ) ) ( ON ?auto_116010 ?auto_116011 ) ( ON ?auto_116009 ?auto_116010 ) ( ON ?auto_116008 ?auto_116009 ) ( ON ?auto_116007 ?auto_116008 ) ( ON ?auto_116006 ?auto_116007 ) ( ON ?auto_116005 ?auto_116006 ) ( CLEAR ?auto_116005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_116005 )
      ( MAKE-7PILE ?auto_116005 ?auto_116006 ?auto_116007 ?auto_116008 ?auto_116009 ?auto_116010 ?auto_116011 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_116036 - BLOCK
      ?auto_116037 - BLOCK
      ?auto_116038 - BLOCK
      ?auto_116039 - BLOCK
      ?auto_116040 - BLOCK
      ?auto_116041 - BLOCK
      ?auto_116042 - BLOCK
      ?auto_116043 - BLOCK
    )
    :vars
    (
      ?auto_116044 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_116042 ) ( ON ?auto_116043 ?auto_116044 ) ( CLEAR ?auto_116043 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_116036 ) ( ON ?auto_116037 ?auto_116036 ) ( ON ?auto_116038 ?auto_116037 ) ( ON ?auto_116039 ?auto_116038 ) ( ON ?auto_116040 ?auto_116039 ) ( ON ?auto_116041 ?auto_116040 ) ( ON ?auto_116042 ?auto_116041 ) ( not ( = ?auto_116036 ?auto_116037 ) ) ( not ( = ?auto_116036 ?auto_116038 ) ) ( not ( = ?auto_116036 ?auto_116039 ) ) ( not ( = ?auto_116036 ?auto_116040 ) ) ( not ( = ?auto_116036 ?auto_116041 ) ) ( not ( = ?auto_116036 ?auto_116042 ) ) ( not ( = ?auto_116036 ?auto_116043 ) ) ( not ( = ?auto_116036 ?auto_116044 ) ) ( not ( = ?auto_116037 ?auto_116038 ) ) ( not ( = ?auto_116037 ?auto_116039 ) ) ( not ( = ?auto_116037 ?auto_116040 ) ) ( not ( = ?auto_116037 ?auto_116041 ) ) ( not ( = ?auto_116037 ?auto_116042 ) ) ( not ( = ?auto_116037 ?auto_116043 ) ) ( not ( = ?auto_116037 ?auto_116044 ) ) ( not ( = ?auto_116038 ?auto_116039 ) ) ( not ( = ?auto_116038 ?auto_116040 ) ) ( not ( = ?auto_116038 ?auto_116041 ) ) ( not ( = ?auto_116038 ?auto_116042 ) ) ( not ( = ?auto_116038 ?auto_116043 ) ) ( not ( = ?auto_116038 ?auto_116044 ) ) ( not ( = ?auto_116039 ?auto_116040 ) ) ( not ( = ?auto_116039 ?auto_116041 ) ) ( not ( = ?auto_116039 ?auto_116042 ) ) ( not ( = ?auto_116039 ?auto_116043 ) ) ( not ( = ?auto_116039 ?auto_116044 ) ) ( not ( = ?auto_116040 ?auto_116041 ) ) ( not ( = ?auto_116040 ?auto_116042 ) ) ( not ( = ?auto_116040 ?auto_116043 ) ) ( not ( = ?auto_116040 ?auto_116044 ) ) ( not ( = ?auto_116041 ?auto_116042 ) ) ( not ( = ?auto_116041 ?auto_116043 ) ) ( not ( = ?auto_116041 ?auto_116044 ) ) ( not ( = ?auto_116042 ?auto_116043 ) ) ( not ( = ?auto_116042 ?auto_116044 ) ) ( not ( = ?auto_116043 ?auto_116044 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_116043 ?auto_116044 )
      ( !STACK ?auto_116043 ?auto_116042 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_116070 - BLOCK
      ?auto_116071 - BLOCK
      ?auto_116072 - BLOCK
      ?auto_116073 - BLOCK
      ?auto_116074 - BLOCK
      ?auto_116075 - BLOCK
      ?auto_116076 - BLOCK
      ?auto_116077 - BLOCK
    )
    :vars
    (
      ?auto_116078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116077 ?auto_116078 ) ( ON-TABLE ?auto_116070 ) ( ON ?auto_116071 ?auto_116070 ) ( ON ?auto_116072 ?auto_116071 ) ( ON ?auto_116073 ?auto_116072 ) ( ON ?auto_116074 ?auto_116073 ) ( ON ?auto_116075 ?auto_116074 ) ( not ( = ?auto_116070 ?auto_116071 ) ) ( not ( = ?auto_116070 ?auto_116072 ) ) ( not ( = ?auto_116070 ?auto_116073 ) ) ( not ( = ?auto_116070 ?auto_116074 ) ) ( not ( = ?auto_116070 ?auto_116075 ) ) ( not ( = ?auto_116070 ?auto_116076 ) ) ( not ( = ?auto_116070 ?auto_116077 ) ) ( not ( = ?auto_116070 ?auto_116078 ) ) ( not ( = ?auto_116071 ?auto_116072 ) ) ( not ( = ?auto_116071 ?auto_116073 ) ) ( not ( = ?auto_116071 ?auto_116074 ) ) ( not ( = ?auto_116071 ?auto_116075 ) ) ( not ( = ?auto_116071 ?auto_116076 ) ) ( not ( = ?auto_116071 ?auto_116077 ) ) ( not ( = ?auto_116071 ?auto_116078 ) ) ( not ( = ?auto_116072 ?auto_116073 ) ) ( not ( = ?auto_116072 ?auto_116074 ) ) ( not ( = ?auto_116072 ?auto_116075 ) ) ( not ( = ?auto_116072 ?auto_116076 ) ) ( not ( = ?auto_116072 ?auto_116077 ) ) ( not ( = ?auto_116072 ?auto_116078 ) ) ( not ( = ?auto_116073 ?auto_116074 ) ) ( not ( = ?auto_116073 ?auto_116075 ) ) ( not ( = ?auto_116073 ?auto_116076 ) ) ( not ( = ?auto_116073 ?auto_116077 ) ) ( not ( = ?auto_116073 ?auto_116078 ) ) ( not ( = ?auto_116074 ?auto_116075 ) ) ( not ( = ?auto_116074 ?auto_116076 ) ) ( not ( = ?auto_116074 ?auto_116077 ) ) ( not ( = ?auto_116074 ?auto_116078 ) ) ( not ( = ?auto_116075 ?auto_116076 ) ) ( not ( = ?auto_116075 ?auto_116077 ) ) ( not ( = ?auto_116075 ?auto_116078 ) ) ( not ( = ?auto_116076 ?auto_116077 ) ) ( not ( = ?auto_116076 ?auto_116078 ) ) ( not ( = ?auto_116077 ?auto_116078 ) ) ( CLEAR ?auto_116075 ) ( ON ?auto_116076 ?auto_116077 ) ( CLEAR ?auto_116076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_116070 ?auto_116071 ?auto_116072 ?auto_116073 ?auto_116074 ?auto_116075 ?auto_116076 )
      ( MAKE-8PILE ?auto_116070 ?auto_116071 ?auto_116072 ?auto_116073 ?auto_116074 ?auto_116075 ?auto_116076 ?auto_116077 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_116104 - BLOCK
      ?auto_116105 - BLOCK
      ?auto_116106 - BLOCK
      ?auto_116107 - BLOCK
      ?auto_116108 - BLOCK
      ?auto_116109 - BLOCK
      ?auto_116110 - BLOCK
      ?auto_116111 - BLOCK
    )
    :vars
    (
      ?auto_116112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116111 ?auto_116112 ) ( ON-TABLE ?auto_116104 ) ( ON ?auto_116105 ?auto_116104 ) ( ON ?auto_116106 ?auto_116105 ) ( ON ?auto_116107 ?auto_116106 ) ( ON ?auto_116108 ?auto_116107 ) ( not ( = ?auto_116104 ?auto_116105 ) ) ( not ( = ?auto_116104 ?auto_116106 ) ) ( not ( = ?auto_116104 ?auto_116107 ) ) ( not ( = ?auto_116104 ?auto_116108 ) ) ( not ( = ?auto_116104 ?auto_116109 ) ) ( not ( = ?auto_116104 ?auto_116110 ) ) ( not ( = ?auto_116104 ?auto_116111 ) ) ( not ( = ?auto_116104 ?auto_116112 ) ) ( not ( = ?auto_116105 ?auto_116106 ) ) ( not ( = ?auto_116105 ?auto_116107 ) ) ( not ( = ?auto_116105 ?auto_116108 ) ) ( not ( = ?auto_116105 ?auto_116109 ) ) ( not ( = ?auto_116105 ?auto_116110 ) ) ( not ( = ?auto_116105 ?auto_116111 ) ) ( not ( = ?auto_116105 ?auto_116112 ) ) ( not ( = ?auto_116106 ?auto_116107 ) ) ( not ( = ?auto_116106 ?auto_116108 ) ) ( not ( = ?auto_116106 ?auto_116109 ) ) ( not ( = ?auto_116106 ?auto_116110 ) ) ( not ( = ?auto_116106 ?auto_116111 ) ) ( not ( = ?auto_116106 ?auto_116112 ) ) ( not ( = ?auto_116107 ?auto_116108 ) ) ( not ( = ?auto_116107 ?auto_116109 ) ) ( not ( = ?auto_116107 ?auto_116110 ) ) ( not ( = ?auto_116107 ?auto_116111 ) ) ( not ( = ?auto_116107 ?auto_116112 ) ) ( not ( = ?auto_116108 ?auto_116109 ) ) ( not ( = ?auto_116108 ?auto_116110 ) ) ( not ( = ?auto_116108 ?auto_116111 ) ) ( not ( = ?auto_116108 ?auto_116112 ) ) ( not ( = ?auto_116109 ?auto_116110 ) ) ( not ( = ?auto_116109 ?auto_116111 ) ) ( not ( = ?auto_116109 ?auto_116112 ) ) ( not ( = ?auto_116110 ?auto_116111 ) ) ( not ( = ?auto_116110 ?auto_116112 ) ) ( not ( = ?auto_116111 ?auto_116112 ) ) ( ON ?auto_116110 ?auto_116111 ) ( CLEAR ?auto_116108 ) ( ON ?auto_116109 ?auto_116110 ) ( CLEAR ?auto_116109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_116104 ?auto_116105 ?auto_116106 ?auto_116107 ?auto_116108 ?auto_116109 )
      ( MAKE-8PILE ?auto_116104 ?auto_116105 ?auto_116106 ?auto_116107 ?auto_116108 ?auto_116109 ?auto_116110 ?auto_116111 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_116138 - BLOCK
      ?auto_116139 - BLOCK
      ?auto_116140 - BLOCK
      ?auto_116141 - BLOCK
      ?auto_116142 - BLOCK
      ?auto_116143 - BLOCK
      ?auto_116144 - BLOCK
      ?auto_116145 - BLOCK
    )
    :vars
    (
      ?auto_116146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116145 ?auto_116146 ) ( ON-TABLE ?auto_116138 ) ( ON ?auto_116139 ?auto_116138 ) ( ON ?auto_116140 ?auto_116139 ) ( ON ?auto_116141 ?auto_116140 ) ( not ( = ?auto_116138 ?auto_116139 ) ) ( not ( = ?auto_116138 ?auto_116140 ) ) ( not ( = ?auto_116138 ?auto_116141 ) ) ( not ( = ?auto_116138 ?auto_116142 ) ) ( not ( = ?auto_116138 ?auto_116143 ) ) ( not ( = ?auto_116138 ?auto_116144 ) ) ( not ( = ?auto_116138 ?auto_116145 ) ) ( not ( = ?auto_116138 ?auto_116146 ) ) ( not ( = ?auto_116139 ?auto_116140 ) ) ( not ( = ?auto_116139 ?auto_116141 ) ) ( not ( = ?auto_116139 ?auto_116142 ) ) ( not ( = ?auto_116139 ?auto_116143 ) ) ( not ( = ?auto_116139 ?auto_116144 ) ) ( not ( = ?auto_116139 ?auto_116145 ) ) ( not ( = ?auto_116139 ?auto_116146 ) ) ( not ( = ?auto_116140 ?auto_116141 ) ) ( not ( = ?auto_116140 ?auto_116142 ) ) ( not ( = ?auto_116140 ?auto_116143 ) ) ( not ( = ?auto_116140 ?auto_116144 ) ) ( not ( = ?auto_116140 ?auto_116145 ) ) ( not ( = ?auto_116140 ?auto_116146 ) ) ( not ( = ?auto_116141 ?auto_116142 ) ) ( not ( = ?auto_116141 ?auto_116143 ) ) ( not ( = ?auto_116141 ?auto_116144 ) ) ( not ( = ?auto_116141 ?auto_116145 ) ) ( not ( = ?auto_116141 ?auto_116146 ) ) ( not ( = ?auto_116142 ?auto_116143 ) ) ( not ( = ?auto_116142 ?auto_116144 ) ) ( not ( = ?auto_116142 ?auto_116145 ) ) ( not ( = ?auto_116142 ?auto_116146 ) ) ( not ( = ?auto_116143 ?auto_116144 ) ) ( not ( = ?auto_116143 ?auto_116145 ) ) ( not ( = ?auto_116143 ?auto_116146 ) ) ( not ( = ?auto_116144 ?auto_116145 ) ) ( not ( = ?auto_116144 ?auto_116146 ) ) ( not ( = ?auto_116145 ?auto_116146 ) ) ( ON ?auto_116144 ?auto_116145 ) ( ON ?auto_116143 ?auto_116144 ) ( CLEAR ?auto_116141 ) ( ON ?auto_116142 ?auto_116143 ) ( CLEAR ?auto_116142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_116138 ?auto_116139 ?auto_116140 ?auto_116141 ?auto_116142 )
      ( MAKE-8PILE ?auto_116138 ?auto_116139 ?auto_116140 ?auto_116141 ?auto_116142 ?auto_116143 ?auto_116144 ?auto_116145 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_116172 - BLOCK
      ?auto_116173 - BLOCK
      ?auto_116174 - BLOCK
      ?auto_116175 - BLOCK
      ?auto_116176 - BLOCK
      ?auto_116177 - BLOCK
      ?auto_116178 - BLOCK
      ?auto_116179 - BLOCK
    )
    :vars
    (
      ?auto_116180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116179 ?auto_116180 ) ( ON-TABLE ?auto_116172 ) ( ON ?auto_116173 ?auto_116172 ) ( ON ?auto_116174 ?auto_116173 ) ( not ( = ?auto_116172 ?auto_116173 ) ) ( not ( = ?auto_116172 ?auto_116174 ) ) ( not ( = ?auto_116172 ?auto_116175 ) ) ( not ( = ?auto_116172 ?auto_116176 ) ) ( not ( = ?auto_116172 ?auto_116177 ) ) ( not ( = ?auto_116172 ?auto_116178 ) ) ( not ( = ?auto_116172 ?auto_116179 ) ) ( not ( = ?auto_116172 ?auto_116180 ) ) ( not ( = ?auto_116173 ?auto_116174 ) ) ( not ( = ?auto_116173 ?auto_116175 ) ) ( not ( = ?auto_116173 ?auto_116176 ) ) ( not ( = ?auto_116173 ?auto_116177 ) ) ( not ( = ?auto_116173 ?auto_116178 ) ) ( not ( = ?auto_116173 ?auto_116179 ) ) ( not ( = ?auto_116173 ?auto_116180 ) ) ( not ( = ?auto_116174 ?auto_116175 ) ) ( not ( = ?auto_116174 ?auto_116176 ) ) ( not ( = ?auto_116174 ?auto_116177 ) ) ( not ( = ?auto_116174 ?auto_116178 ) ) ( not ( = ?auto_116174 ?auto_116179 ) ) ( not ( = ?auto_116174 ?auto_116180 ) ) ( not ( = ?auto_116175 ?auto_116176 ) ) ( not ( = ?auto_116175 ?auto_116177 ) ) ( not ( = ?auto_116175 ?auto_116178 ) ) ( not ( = ?auto_116175 ?auto_116179 ) ) ( not ( = ?auto_116175 ?auto_116180 ) ) ( not ( = ?auto_116176 ?auto_116177 ) ) ( not ( = ?auto_116176 ?auto_116178 ) ) ( not ( = ?auto_116176 ?auto_116179 ) ) ( not ( = ?auto_116176 ?auto_116180 ) ) ( not ( = ?auto_116177 ?auto_116178 ) ) ( not ( = ?auto_116177 ?auto_116179 ) ) ( not ( = ?auto_116177 ?auto_116180 ) ) ( not ( = ?auto_116178 ?auto_116179 ) ) ( not ( = ?auto_116178 ?auto_116180 ) ) ( not ( = ?auto_116179 ?auto_116180 ) ) ( ON ?auto_116178 ?auto_116179 ) ( ON ?auto_116177 ?auto_116178 ) ( ON ?auto_116176 ?auto_116177 ) ( CLEAR ?auto_116174 ) ( ON ?auto_116175 ?auto_116176 ) ( CLEAR ?auto_116175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_116172 ?auto_116173 ?auto_116174 ?auto_116175 )
      ( MAKE-8PILE ?auto_116172 ?auto_116173 ?auto_116174 ?auto_116175 ?auto_116176 ?auto_116177 ?auto_116178 ?auto_116179 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_116206 - BLOCK
      ?auto_116207 - BLOCK
      ?auto_116208 - BLOCK
      ?auto_116209 - BLOCK
      ?auto_116210 - BLOCK
      ?auto_116211 - BLOCK
      ?auto_116212 - BLOCK
      ?auto_116213 - BLOCK
    )
    :vars
    (
      ?auto_116214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116213 ?auto_116214 ) ( ON-TABLE ?auto_116206 ) ( ON ?auto_116207 ?auto_116206 ) ( not ( = ?auto_116206 ?auto_116207 ) ) ( not ( = ?auto_116206 ?auto_116208 ) ) ( not ( = ?auto_116206 ?auto_116209 ) ) ( not ( = ?auto_116206 ?auto_116210 ) ) ( not ( = ?auto_116206 ?auto_116211 ) ) ( not ( = ?auto_116206 ?auto_116212 ) ) ( not ( = ?auto_116206 ?auto_116213 ) ) ( not ( = ?auto_116206 ?auto_116214 ) ) ( not ( = ?auto_116207 ?auto_116208 ) ) ( not ( = ?auto_116207 ?auto_116209 ) ) ( not ( = ?auto_116207 ?auto_116210 ) ) ( not ( = ?auto_116207 ?auto_116211 ) ) ( not ( = ?auto_116207 ?auto_116212 ) ) ( not ( = ?auto_116207 ?auto_116213 ) ) ( not ( = ?auto_116207 ?auto_116214 ) ) ( not ( = ?auto_116208 ?auto_116209 ) ) ( not ( = ?auto_116208 ?auto_116210 ) ) ( not ( = ?auto_116208 ?auto_116211 ) ) ( not ( = ?auto_116208 ?auto_116212 ) ) ( not ( = ?auto_116208 ?auto_116213 ) ) ( not ( = ?auto_116208 ?auto_116214 ) ) ( not ( = ?auto_116209 ?auto_116210 ) ) ( not ( = ?auto_116209 ?auto_116211 ) ) ( not ( = ?auto_116209 ?auto_116212 ) ) ( not ( = ?auto_116209 ?auto_116213 ) ) ( not ( = ?auto_116209 ?auto_116214 ) ) ( not ( = ?auto_116210 ?auto_116211 ) ) ( not ( = ?auto_116210 ?auto_116212 ) ) ( not ( = ?auto_116210 ?auto_116213 ) ) ( not ( = ?auto_116210 ?auto_116214 ) ) ( not ( = ?auto_116211 ?auto_116212 ) ) ( not ( = ?auto_116211 ?auto_116213 ) ) ( not ( = ?auto_116211 ?auto_116214 ) ) ( not ( = ?auto_116212 ?auto_116213 ) ) ( not ( = ?auto_116212 ?auto_116214 ) ) ( not ( = ?auto_116213 ?auto_116214 ) ) ( ON ?auto_116212 ?auto_116213 ) ( ON ?auto_116211 ?auto_116212 ) ( ON ?auto_116210 ?auto_116211 ) ( ON ?auto_116209 ?auto_116210 ) ( CLEAR ?auto_116207 ) ( ON ?auto_116208 ?auto_116209 ) ( CLEAR ?auto_116208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_116206 ?auto_116207 ?auto_116208 )
      ( MAKE-8PILE ?auto_116206 ?auto_116207 ?auto_116208 ?auto_116209 ?auto_116210 ?auto_116211 ?auto_116212 ?auto_116213 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_116240 - BLOCK
      ?auto_116241 - BLOCK
      ?auto_116242 - BLOCK
      ?auto_116243 - BLOCK
      ?auto_116244 - BLOCK
      ?auto_116245 - BLOCK
      ?auto_116246 - BLOCK
      ?auto_116247 - BLOCK
    )
    :vars
    (
      ?auto_116248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116247 ?auto_116248 ) ( ON-TABLE ?auto_116240 ) ( not ( = ?auto_116240 ?auto_116241 ) ) ( not ( = ?auto_116240 ?auto_116242 ) ) ( not ( = ?auto_116240 ?auto_116243 ) ) ( not ( = ?auto_116240 ?auto_116244 ) ) ( not ( = ?auto_116240 ?auto_116245 ) ) ( not ( = ?auto_116240 ?auto_116246 ) ) ( not ( = ?auto_116240 ?auto_116247 ) ) ( not ( = ?auto_116240 ?auto_116248 ) ) ( not ( = ?auto_116241 ?auto_116242 ) ) ( not ( = ?auto_116241 ?auto_116243 ) ) ( not ( = ?auto_116241 ?auto_116244 ) ) ( not ( = ?auto_116241 ?auto_116245 ) ) ( not ( = ?auto_116241 ?auto_116246 ) ) ( not ( = ?auto_116241 ?auto_116247 ) ) ( not ( = ?auto_116241 ?auto_116248 ) ) ( not ( = ?auto_116242 ?auto_116243 ) ) ( not ( = ?auto_116242 ?auto_116244 ) ) ( not ( = ?auto_116242 ?auto_116245 ) ) ( not ( = ?auto_116242 ?auto_116246 ) ) ( not ( = ?auto_116242 ?auto_116247 ) ) ( not ( = ?auto_116242 ?auto_116248 ) ) ( not ( = ?auto_116243 ?auto_116244 ) ) ( not ( = ?auto_116243 ?auto_116245 ) ) ( not ( = ?auto_116243 ?auto_116246 ) ) ( not ( = ?auto_116243 ?auto_116247 ) ) ( not ( = ?auto_116243 ?auto_116248 ) ) ( not ( = ?auto_116244 ?auto_116245 ) ) ( not ( = ?auto_116244 ?auto_116246 ) ) ( not ( = ?auto_116244 ?auto_116247 ) ) ( not ( = ?auto_116244 ?auto_116248 ) ) ( not ( = ?auto_116245 ?auto_116246 ) ) ( not ( = ?auto_116245 ?auto_116247 ) ) ( not ( = ?auto_116245 ?auto_116248 ) ) ( not ( = ?auto_116246 ?auto_116247 ) ) ( not ( = ?auto_116246 ?auto_116248 ) ) ( not ( = ?auto_116247 ?auto_116248 ) ) ( ON ?auto_116246 ?auto_116247 ) ( ON ?auto_116245 ?auto_116246 ) ( ON ?auto_116244 ?auto_116245 ) ( ON ?auto_116243 ?auto_116244 ) ( ON ?auto_116242 ?auto_116243 ) ( CLEAR ?auto_116240 ) ( ON ?auto_116241 ?auto_116242 ) ( CLEAR ?auto_116241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_116240 ?auto_116241 )
      ( MAKE-8PILE ?auto_116240 ?auto_116241 ?auto_116242 ?auto_116243 ?auto_116244 ?auto_116245 ?auto_116246 ?auto_116247 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_116274 - BLOCK
      ?auto_116275 - BLOCK
      ?auto_116276 - BLOCK
      ?auto_116277 - BLOCK
      ?auto_116278 - BLOCK
      ?auto_116279 - BLOCK
      ?auto_116280 - BLOCK
      ?auto_116281 - BLOCK
    )
    :vars
    (
      ?auto_116282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116281 ?auto_116282 ) ( not ( = ?auto_116274 ?auto_116275 ) ) ( not ( = ?auto_116274 ?auto_116276 ) ) ( not ( = ?auto_116274 ?auto_116277 ) ) ( not ( = ?auto_116274 ?auto_116278 ) ) ( not ( = ?auto_116274 ?auto_116279 ) ) ( not ( = ?auto_116274 ?auto_116280 ) ) ( not ( = ?auto_116274 ?auto_116281 ) ) ( not ( = ?auto_116274 ?auto_116282 ) ) ( not ( = ?auto_116275 ?auto_116276 ) ) ( not ( = ?auto_116275 ?auto_116277 ) ) ( not ( = ?auto_116275 ?auto_116278 ) ) ( not ( = ?auto_116275 ?auto_116279 ) ) ( not ( = ?auto_116275 ?auto_116280 ) ) ( not ( = ?auto_116275 ?auto_116281 ) ) ( not ( = ?auto_116275 ?auto_116282 ) ) ( not ( = ?auto_116276 ?auto_116277 ) ) ( not ( = ?auto_116276 ?auto_116278 ) ) ( not ( = ?auto_116276 ?auto_116279 ) ) ( not ( = ?auto_116276 ?auto_116280 ) ) ( not ( = ?auto_116276 ?auto_116281 ) ) ( not ( = ?auto_116276 ?auto_116282 ) ) ( not ( = ?auto_116277 ?auto_116278 ) ) ( not ( = ?auto_116277 ?auto_116279 ) ) ( not ( = ?auto_116277 ?auto_116280 ) ) ( not ( = ?auto_116277 ?auto_116281 ) ) ( not ( = ?auto_116277 ?auto_116282 ) ) ( not ( = ?auto_116278 ?auto_116279 ) ) ( not ( = ?auto_116278 ?auto_116280 ) ) ( not ( = ?auto_116278 ?auto_116281 ) ) ( not ( = ?auto_116278 ?auto_116282 ) ) ( not ( = ?auto_116279 ?auto_116280 ) ) ( not ( = ?auto_116279 ?auto_116281 ) ) ( not ( = ?auto_116279 ?auto_116282 ) ) ( not ( = ?auto_116280 ?auto_116281 ) ) ( not ( = ?auto_116280 ?auto_116282 ) ) ( not ( = ?auto_116281 ?auto_116282 ) ) ( ON ?auto_116280 ?auto_116281 ) ( ON ?auto_116279 ?auto_116280 ) ( ON ?auto_116278 ?auto_116279 ) ( ON ?auto_116277 ?auto_116278 ) ( ON ?auto_116276 ?auto_116277 ) ( ON ?auto_116275 ?auto_116276 ) ( ON ?auto_116274 ?auto_116275 ) ( CLEAR ?auto_116274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_116274 )
      ( MAKE-8PILE ?auto_116274 ?auto_116275 ?auto_116276 ?auto_116277 ?auto_116278 ?auto_116279 ?auto_116280 ?auto_116281 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_116309 - BLOCK
      ?auto_116310 - BLOCK
      ?auto_116311 - BLOCK
      ?auto_116312 - BLOCK
      ?auto_116313 - BLOCK
      ?auto_116314 - BLOCK
      ?auto_116315 - BLOCK
      ?auto_116316 - BLOCK
      ?auto_116317 - BLOCK
    )
    :vars
    (
      ?auto_116318 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_116316 ) ( ON ?auto_116317 ?auto_116318 ) ( CLEAR ?auto_116317 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_116309 ) ( ON ?auto_116310 ?auto_116309 ) ( ON ?auto_116311 ?auto_116310 ) ( ON ?auto_116312 ?auto_116311 ) ( ON ?auto_116313 ?auto_116312 ) ( ON ?auto_116314 ?auto_116313 ) ( ON ?auto_116315 ?auto_116314 ) ( ON ?auto_116316 ?auto_116315 ) ( not ( = ?auto_116309 ?auto_116310 ) ) ( not ( = ?auto_116309 ?auto_116311 ) ) ( not ( = ?auto_116309 ?auto_116312 ) ) ( not ( = ?auto_116309 ?auto_116313 ) ) ( not ( = ?auto_116309 ?auto_116314 ) ) ( not ( = ?auto_116309 ?auto_116315 ) ) ( not ( = ?auto_116309 ?auto_116316 ) ) ( not ( = ?auto_116309 ?auto_116317 ) ) ( not ( = ?auto_116309 ?auto_116318 ) ) ( not ( = ?auto_116310 ?auto_116311 ) ) ( not ( = ?auto_116310 ?auto_116312 ) ) ( not ( = ?auto_116310 ?auto_116313 ) ) ( not ( = ?auto_116310 ?auto_116314 ) ) ( not ( = ?auto_116310 ?auto_116315 ) ) ( not ( = ?auto_116310 ?auto_116316 ) ) ( not ( = ?auto_116310 ?auto_116317 ) ) ( not ( = ?auto_116310 ?auto_116318 ) ) ( not ( = ?auto_116311 ?auto_116312 ) ) ( not ( = ?auto_116311 ?auto_116313 ) ) ( not ( = ?auto_116311 ?auto_116314 ) ) ( not ( = ?auto_116311 ?auto_116315 ) ) ( not ( = ?auto_116311 ?auto_116316 ) ) ( not ( = ?auto_116311 ?auto_116317 ) ) ( not ( = ?auto_116311 ?auto_116318 ) ) ( not ( = ?auto_116312 ?auto_116313 ) ) ( not ( = ?auto_116312 ?auto_116314 ) ) ( not ( = ?auto_116312 ?auto_116315 ) ) ( not ( = ?auto_116312 ?auto_116316 ) ) ( not ( = ?auto_116312 ?auto_116317 ) ) ( not ( = ?auto_116312 ?auto_116318 ) ) ( not ( = ?auto_116313 ?auto_116314 ) ) ( not ( = ?auto_116313 ?auto_116315 ) ) ( not ( = ?auto_116313 ?auto_116316 ) ) ( not ( = ?auto_116313 ?auto_116317 ) ) ( not ( = ?auto_116313 ?auto_116318 ) ) ( not ( = ?auto_116314 ?auto_116315 ) ) ( not ( = ?auto_116314 ?auto_116316 ) ) ( not ( = ?auto_116314 ?auto_116317 ) ) ( not ( = ?auto_116314 ?auto_116318 ) ) ( not ( = ?auto_116315 ?auto_116316 ) ) ( not ( = ?auto_116315 ?auto_116317 ) ) ( not ( = ?auto_116315 ?auto_116318 ) ) ( not ( = ?auto_116316 ?auto_116317 ) ) ( not ( = ?auto_116316 ?auto_116318 ) ) ( not ( = ?auto_116317 ?auto_116318 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_116317 ?auto_116318 )
      ( !STACK ?auto_116317 ?auto_116316 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_116347 - BLOCK
      ?auto_116348 - BLOCK
      ?auto_116349 - BLOCK
      ?auto_116350 - BLOCK
      ?auto_116351 - BLOCK
      ?auto_116352 - BLOCK
      ?auto_116353 - BLOCK
      ?auto_116354 - BLOCK
      ?auto_116355 - BLOCK
    )
    :vars
    (
      ?auto_116356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116355 ?auto_116356 ) ( ON-TABLE ?auto_116347 ) ( ON ?auto_116348 ?auto_116347 ) ( ON ?auto_116349 ?auto_116348 ) ( ON ?auto_116350 ?auto_116349 ) ( ON ?auto_116351 ?auto_116350 ) ( ON ?auto_116352 ?auto_116351 ) ( ON ?auto_116353 ?auto_116352 ) ( not ( = ?auto_116347 ?auto_116348 ) ) ( not ( = ?auto_116347 ?auto_116349 ) ) ( not ( = ?auto_116347 ?auto_116350 ) ) ( not ( = ?auto_116347 ?auto_116351 ) ) ( not ( = ?auto_116347 ?auto_116352 ) ) ( not ( = ?auto_116347 ?auto_116353 ) ) ( not ( = ?auto_116347 ?auto_116354 ) ) ( not ( = ?auto_116347 ?auto_116355 ) ) ( not ( = ?auto_116347 ?auto_116356 ) ) ( not ( = ?auto_116348 ?auto_116349 ) ) ( not ( = ?auto_116348 ?auto_116350 ) ) ( not ( = ?auto_116348 ?auto_116351 ) ) ( not ( = ?auto_116348 ?auto_116352 ) ) ( not ( = ?auto_116348 ?auto_116353 ) ) ( not ( = ?auto_116348 ?auto_116354 ) ) ( not ( = ?auto_116348 ?auto_116355 ) ) ( not ( = ?auto_116348 ?auto_116356 ) ) ( not ( = ?auto_116349 ?auto_116350 ) ) ( not ( = ?auto_116349 ?auto_116351 ) ) ( not ( = ?auto_116349 ?auto_116352 ) ) ( not ( = ?auto_116349 ?auto_116353 ) ) ( not ( = ?auto_116349 ?auto_116354 ) ) ( not ( = ?auto_116349 ?auto_116355 ) ) ( not ( = ?auto_116349 ?auto_116356 ) ) ( not ( = ?auto_116350 ?auto_116351 ) ) ( not ( = ?auto_116350 ?auto_116352 ) ) ( not ( = ?auto_116350 ?auto_116353 ) ) ( not ( = ?auto_116350 ?auto_116354 ) ) ( not ( = ?auto_116350 ?auto_116355 ) ) ( not ( = ?auto_116350 ?auto_116356 ) ) ( not ( = ?auto_116351 ?auto_116352 ) ) ( not ( = ?auto_116351 ?auto_116353 ) ) ( not ( = ?auto_116351 ?auto_116354 ) ) ( not ( = ?auto_116351 ?auto_116355 ) ) ( not ( = ?auto_116351 ?auto_116356 ) ) ( not ( = ?auto_116352 ?auto_116353 ) ) ( not ( = ?auto_116352 ?auto_116354 ) ) ( not ( = ?auto_116352 ?auto_116355 ) ) ( not ( = ?auto_116352 ?auto_116356 ) ) ( not ( = ?auto_116353 ?auto_116354 ) ) ( not ( = ?auto_116353 ?auto_116355 ) ) ( not ( = ?auto_116353 ?auto_116356 ) ) ( not ( = ?auto_116354 ?auto_116355 ) ) ( not ( = ?auto_116354 ?auto_116356 ) ) ( not ( = ?auto_116355 ?auto_116356 ) ) ( CLEAR ?auto_116353 ) ( ON ?auto_116354 ?auto_116355 ) ( CLEAR ?auto_116354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_116347 ?auto_116348 ?auto_116349 ?auto_116350 ?auto_116351 ?auto_116352 ?auto_116353 ?auto_116354 )
      ( MAKE-9PILE ?auto_116347 ?auto_116348 ?auto_116349 ?auto_116350 ?auto_116351 ?auto_116352 ?auto_116353 ?auto_116354 ?auto_116355 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_116385 - BLOCK
      ?auto_116386 - BLOCK
      ?auto_116387 - BLOCK
      ?auto_116388 - BLOCK
      ?auto_116389 - BLOCK
      ?auto_116390 - BLOCK
      ?auto_116391 - BLOCK
      ?auto_116392 - BLOCK
      ?auto_116393 - BLOCK
    )
    :vars
    (
      ?auto_116394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116393 ?auto_116394 ) ( ON-TABLE ?auto_116385 ) ( ON ?auto_116386 ?auto_116385 ) ( ON ?auto_116387 ?auto_116386 ) ( ON ?auto_116388 ?auto_116387 ) ( ON ?auto_116389 ?auto_116388 ) ( ON ?auto_116390 ?auto_116389 ) ( not ( = ?auto_116385 ?auto_116386 ) ) ( not ( = ?auto_116385 ?auto_116387 ) ) ( not ( = ?auto_116385 ?auto_116388 ) ) ( not ( = ?auto_116385 ?auto_116389 ) ) ( not ( = ?auto_116385 ?auto_116390 ) ) ( not ( = ?auto_116385 ?auto_116391 ) ) ( not ( = ?auto_116385 ?auto_116392 ) ) ( not ( = ?auto_116385 ?auto_116393 ) ) ( not ( = ?auto_116385 ?auto_116394 ) ) ( not ( = ?auto_116386 ?auto_116387 ) ) ( not ( = ?auto_116386 ?auto_116388 ) ) ( not ( = ?auto_116386 ?auto_116389 ) ) ( not ( = ?auto_116386 ?auto_116390 ) ) ( not ( = ?auto_116386 ?auto_116391 ) ) ( not ( = ?auto_116386 ?auto_116392 ) ) ( not ( = ?auto_116386 ?auto_116393 ) ) ( not ( = ?auto_116386 ?auto_116394 ) ) ( not ( = ?auto_116387 ?auto_116388 ) ) ( not ( = ?auto_116387 ?auto_116389 ) ) ( not ( = ?auto_116387 ?auto_116390 ) ) ( not ( = ?auto_116387 ?auto_116391 ) ) ( not ( = ?auto_116387 ?auto_116392 ) ) ( not ( = ?auto_116387 ?auto_116393 ) ) ( not ( = ?auto_116387 ?auto_116394 ) ) ( not ( = ?auto_116388 ?auto_116389 ) ) ( not ( = ?auto_116388 ?auto_116390 ) ) ( not ( = ?auto_116388 ?auto_116391 ) ) ( not ( = ?auto_116388 ?auto_116392 ) ) ( not ( = ?auto_116388 ?auto_116393 ) ) ( not ( = ?auto_116388 ?auto_116394 ) ) ( not ( = ?auto_116389 ?auto_116390 ) ) ( not ( = ?auto_116389 ?auto_116391 ) ) ( not ( = ?auto_116389 ?auto_116392 ) ) ( not ( = ?auto_116389 ?auto_116393 ) ) ( not ( = ?auto_116389 ?auto_116394 ) ) ( not ( = ?auto_116390 ?auto_116391 ) ) ( not ( = ?auto_116390 ?auto_116392 ) ) ( not ( = ?auto_116390 ?auto_116393 ) ) ( not ( = ?auto_116390 ?auto_116394 ) ) ( not ( = ?auto_116391 ?auto_116392 ) ) ( not ( = ?auto_116391 ?auto_116393 ) ) ( not ( = ?auto_116391 ?auto_116394 ) ) ( not ( = ?auto_116392 ?auto_116393 ) ) ( not ( = ?auto_116392 ?auto_116394 ) ) ( not ( = ?auto_116393 ?auto_116394 ) ) ( ON ?auto_116392 ?auto_116393 ) ( CLEAR ?auto_116390 ) ( ON ?auto_116391 ?auto_116392 ) ( CLEAR ?auto_116391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_116385 ?auto_116386 ?auto_116387 ?auto_116388 ?auto_116389 ?auto_116390 ?auto_116391 )
      ( MAKE-9PILE ?auto_116385 ?auto_116386 ?auto_116387 ?auto_116388 ?auto_116389 ?auto_116390 ?auto_116391 ?auto_116392 ?auto_116393 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_116423 - BLOCK
      ?auto_116424 - BLOCK
      ?auto_116425 - BLOCK
      ?auto_116426 - BLOCK
      ?auto_116427 - BLOCK
      ?auto_116428 - BLOCK
      ?auto_116429 - BLOCK
      ?auto_116430 - BLOCK
      ?auto_116431 - BLOCK
    )
    :vars
    (
      ?auto_116432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116431 ?auto_116432 ) ( ON-TABLE ?auto_116423 ) ( ON ?auto_116424 ?auto_116423 ) ( ON ?auto_116425 ?auto_116424 ) ( ON ?auto_116426 ?auto_116425 ) ( ON ?auto_116427 ?auto_116426 ) ( not ( = ?auto_116423 ?auto_116424 ) ) ( not ( = ?auto_116423 ?auto_116425 ) ) ( not ( = ?auto_116423 ?auto_116426 ) ) ( not ( = ?auto_116423 ?auto_116427 ) ) ( not ( = ?auto_116423 ?auto_116428 ) ) ( not ( = ?auto_116423 ?auto_116429 ) ) ( not ( = ?auto_116423 ?auto_116430 ) ) ( not ( = ?auto_116423 ?auto_116431 ) ) ( not ( = ?auto_116423 ?auto_116432 ) ) ( not ( = ?auto_116424 ?auto_116425 ) ) ( not ( = ?auto_116424 ?auto_116426 ) ) ( not ( = ?auto_116424 ?auto_116427 ) ) ( not ( = ?auto_116424 ?auto_116428 ) ) ( not ( = ?auto_116424 ?auto_116429 ) ) ( not ( = ?auto_116424 ?auto_116430 ) ) ( not ( = ?auto_116424 ?auto_116431 ) ) ( not ( = ?auto_116424 ?auto_116432 ) ) ( not ( = ?auto_116425 ?auto_116426 ) ) ( not ( = ?auto_116425 ?auto_116427 ) ) ( not ( = ?auto_116425 ?auto_116428 ) ) ( not ( = ?auto_116425 ?auto_116429 ) ) ( not ( = ?auto_116425 ?auto_116430 ) ) ( not ( = ?auto_116425 ?auto_116431 ) ) ( not ( = ?auto_116425 ?auto_116432 ) ) ( not ( = ?auto_116426 ?auto_116427 ) ) ( not ( = ?auto_116426 ?auto_116428 ) ) ( not ( = ?auto_116426 ?auto_116429 ) ) ( not ( = ?auto_116426 ?auto_116430 ) ) ( not ( = ?auto_116426 ?auto_116431 ) ) ( not ( = ?auto_116426 ?auto_116432 ) ) ( not ( = ?auto_116427 ?auto_116428 ) ) ( not ( = ?auto_116427 ?auto_116429 ) ) ( not ( = ?auto_116427 ?auto_116430 ) ) ( not ( = ?auto_116427 ?auto_116431 ) ) ( not ( = ?auto_116427 ?auto_116432 ) ) ( not ( = ?auto_116428 ?auto_116429 ) ) ( not ( = ?auto_116428 ?auto_116430 ) ) ( not ( = ?auto_116428 ?auto_116431 ) ) ( not ( = ?auto_116428 ?auto_116432 ) ) ( not ( = ?auto_116429 ?auto_116430 ) ) ( not ( = ?auto_116429 ?auto_116431 ) ) ( not ( = ?auto_116429 ?auto_116432 ) ) ( not ( = ?auto_116430 ?auto_116431 ) ) ( not ( = ?auto_116430 ?auto_116432 ) ) ( not ( = ?auto_116431 ?auto_116432 ) ) ( ON ?auto_116430 ?auto_116431 ) ( ON ?auto_116429 ?auto_116430 ) ( CLEAR ?auto_116427 ) ( ON ?auto_116428 ?auto_116429 ) ( CLEAR ?auto_116428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_116423 ?auto_116424 ?auto_116425 ?auto_116426 ?auto_116427 ?auto_116428 )
      ( MAKE-9PILE ?auto_116423 ?auto_116424 ?auto_116425 ?auto_116426 ?auto_116427 ?auto_116428 ?auto_116429 ?auto_116430 ?auto_116431 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_116461 - BLOCK
      ?auto_116462 - BLOCK
      ?auto_116463 - BLOCK
      ?auto_116464 - BLOCK
      ?auto_116465 - BLOCK
      ?auto_116466 - BLOCK
      ?auto_116467 - BLOCK
      ?auto_116468 - BLOCK
      ?auto_116469 - BLOCK
    )
    :vars
    (
      ?auto_116470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116469 ?auto_116470 ) ( ON-TABLE ?auto_116461 ) ( ON ?auto_116462 ?auto_116461 ) ( ON ?auto_116463 ?auto_116462 ) ( ON ?auto_116464 ?auto_116463 ) ( not ( = ?auto_116461 ?auto_116462 ) ) ( not ( = ?auto_116461 ?auto_116463 ) ) ( not ( = ?auto_116461 ?auto_116464 ) ) ( not ( = ?auto_116461 ?auto_116465 ) ) ( not ( = ?auto_116461 ?auto_116466 ) ) ( not ( = ?auto_116461 ?auto_116467 ) ) ( not ( = ?auto_116461 ?auto_116468 ) ) ( not ( = ?auto_116461 ?auto_116469 ) ) ( not ( = ?auto_116461 ?auto_116470 ) ) ( not ( = ?auto_116462 ?auto_116463 ) ) ( not ( = ?auto_116462 ?auto_116464 ) ) ( not ( = ?auto_116462 ?auto_116465 ) ) ( not ( = ?auto_116462 ?auto_116466 ) ) ( not ( = ?auto_116462 ?auto_116467 ) ) ( not ( = ?auto_116462 ?auto_116468 ) ) ( not ( = ?auto_116462 ?auto_116469 ) ) ( not ( = ?auto_116462 ?auto_116470 ) ) ( not ( = ?auto_116463 ?auto_116464 ) ) ( not ( = ?auto_116463 ?auto_116465 ) ) ( not ( = ?auto_116463 ?auto_116466 ) ) ( not ( = ?auto_116463 ?auto_116467 ) ) ( not ( = ?auto_116463 ?auto_116468 ) ) ( not ( = ?auto_116463 ?auto_116469 ) ) ( not ( = ?auto_116463 ?auto_116470 ) ) ( not ( = ?auto_116464 ?auto_116465 ) ) ( not ( = ?auto_116464 ?auto_116466 ) ) ( not ( = ?auto_116464 ?auto_116467 ) ) ( not ( = ?auto_116464 ?auto_116468 ) ) ( not ( = ?auto_116464 ?auto_116469 ) ) ( not ( = ?auto_116464 ?auto_116470 ) ) ( not ( = ?auto_116465 ?auto_116466 ) ) ( not ( = ?auto_116465 ?auto_116467 ) ) ( not ( = ?auto_116465 ?auto_116468 ) ) ( not ( = ?auto_116465 ?auto_116469 ) ) ( not ( = ?auto_116465 ?auto_116470 ) ) ( not ( = ?auto_116466 ?auto_116467 ) ) ( not ( = ?auto_116466 ?auto_116468 ) ) ( not ( = ?auto_116466 ?auto_116469 ) ) ( not ( = ?auto_116466 ?auto_116470 ) ) ( not ( = ?auto_116467 ?auto_116468 ) ) ( not ( = ?auto_116467 ?auto_116469 ) ) ( not ( = ?auto_116467 ?auto_116470 ) ) ( not ( = ?auto_116468 ?auto_116469 ) ) ( not ( = ?auto_116468 ?auto_116470 ) ) ( not ( = ?auto_116469 ?auto_116470 ) ) ( ON ?auto_116468 ?auto_116469 ) ( ON ?auto_116467 ?auto_116468 ) ( ON ?auto_116466 ?auto_116467 ) ( CLEAR ?auto_116464 ) ( ON ?auto_116465 ?auto_116466 ) ( CLEAR ?auto_116465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_116461 ?auto_116462 ?auto_116463 ?auto_116464 ?auto_116465 )
      ( MAKE-9PILE ?auto_116461 ?auto_116462 ?auto_116463 ?auto_116464 ?auto_116465 ?auto_116466 ?auto_116467 ?auto_116468 ?auto_116469 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_116499 - BLOCK
      ?auto_116500 - BLOCK
      ?auto_116501 - BLOCK
      ?auto_116502 - BLOCK
      ?auto_116503 - BLOCK
      ?auto_116504 - BLOCK
      ?auto_116505 - BLOCK
      ?auto_116506 - BLOCK
      ?auto_116507 - BLOCK
    )
    :vars
    (
      ?auto_116508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116507 ?auto_116508 ) ( ON-TABLE ?auto_116499 ) ( ON ?auto_116500 ?auto_116499 ) ( ON ?auto_116501 ?auto_116500 ) ( not ( = ?auto_116499 ?auto_116500 ) ) ( not ( = ?auto_116499 ?auto_116501 ) ) ( not ( = ?auto_116499 ?auto_116502 ) ) ( not ( = ?auto_116499 ?auto_116503 ) ) ( not ( = ?auto_116499 ?auto_116504 ) ) ( not ( = ?auto_116499 ?auto_116505 ) ) ( not ( = ?auto_116499 ?auto_116506 ) ) ( not ( = ?auto_116499 ?auto_116507 ) ) ( not ( = ?auto_116499 ?auto_116508 ) ) ( not ( = ?auto_116500 ?auto_116501 ) ) ( not ( = ?auto_116500 ?auto_116502 ) ) ( not ( = ?auto_116500 ?auto_116503 ) ) ( not ( = ?auto_116500 ?auto_116504 ) ) ( not ( = ?auto_116500 ?auto_116505 ) ) ( not ( = ?auto_116500 ?auto_116506 ) ) ( not ( = ?auto_116500 ?auto_116507 ) ) ( not ( = ?auto_116500 ?auto_116508 ) ) ( not ( = ?auto_116501 ?auto_116502 ) ) ( not ( = ?auto_116501 ?auto_116503 ) ) ( not ( = ?auto_116501 ?auto_116504 ) ) ( not ( = ?auto_116501 ?auto_116505 ) ) ( not ( = ?auto_116501 ?auto_116506 ) ) ( not ( = ?auto_116501 ?auto_116507 ) ) ( not ( = ?auto_116501 ?auto_116508 ) ) ( not ( = ?auto_116502 ?auto_116503 ) ) ( not ( = ?auto_116502 ?auto_116504 ) ) ( not ( = ?auto_116502 ?auto_116505 ) ) ( not ( = ?auto_116502 ?auto_116506 ) ) ( not ( = ?auto_116502 ?auto_116507 ) ) ( not ( = ?auto_116502 ?auto_116508 ) ) ( not ( = ?auto_116503 ?auto_116504 ) ) ( not ( = ?auto_116503 ?auto_116505 ) ) ( not ( = ?auto_116503 ?auto_116506 ) ) ( not ( = ?auto_116503 ?auto_116507 ) ) ( not ( = ?auto_116503 ?auto_116508 ) ) ( not ( = ?auto_116504 ?auto_116505 ) ) ( not ( = ?auto_116504 ?auto_116506 ) ) ( not ( = ?auto_116504 ?auto_116507 ) ) ( not ( = ?auto_116504 ?auto_116508 ) ) ( not ( = ?auto_116505 ?auto_116506 ) ) ( not ( = ?auto_116505 ?auto_116507 ) ) ( not ( = ?auto_116505 ?auto_116508 ) ) ( not ( = ?auto_116506 ?auto_116507 ) ) ( not ( = ?auto_116506 ?auto_116508 ) ) ( not ( = ?auto_116507 ?auto_116508 ) ) ( ON ?auto_116506 ?auto_116507 ) ( ON ?auto_116505 ?auto_116506 ) ( ON ?auto_116504 ?auto_116505 ) ( ON ?auto_116503 ?auto_116504 ) ( CLEAR ?auto_116501 ) ( ON ?auto_116502 ?auto_116503 ) ( CLEAR ?auto_116502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_116499 ?auto_116500 ?auto_116501 ?auto_116502 )
      ( MAKE-9PILE ?auto_116499 ?auto_116500 ?auto_116501 ?auto_116502 ?auto_116503 ?auto_116504 ?auto_116505 ?auto_116506 ?auto_116507 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_116537 - BLOCK
      ?auto_116538 - BLOCK
      ?auto_116539 - BLOCK
      ?auto_116540 - BLOCK
      ?auto_116541 - BLOCK
      ?auto_116542 - BLOCK
      ?auto_116543 - BLOCK
      ?auto_116544 - BLOCK
      ?auto_116545 - BLOCK
    )
    :vars
    (
      ?auto_116546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116545 ?auto_116546 ) ( ON-TABLE ?auto_116537 ) ( ON ?auto_116538 ?auto_116537 ) ( not ( = ?auto_116537 ?auto_116538 ) ) ( not ( = ?auto_116537 ?auto_116539 ) ) ( not ( = ?auto_116537 ?auto_116540 ) ) ( not ( = ?auto_116537 ?auto_116541 ) ) ( not ( = ?auto_116537 ?auto_116542 ) ) ( not ( = ?auto_116537 ?auto_116543 ) ) ( not ( = ?auto_116537 ?auto_116544 ) ) ( not ( = ?auto_116537 ?auto_116545 ) ) ( not ( = ?auto_116537 ?auto_116546 ) ) ( not ( = ?auto_116538 ?auto_116539 ) ) ( not ( = ?auto_116538 ?auto_116540 ) ) ( not ( = ?auto_116538 ?auto_116541 ) ) ( not ( = ?auto_116538 ?auto_116542 ) ) ( not ( = ?auto_116538 ?auto_116543 ) ) ( not ( = ?auto_116538 ?auto_116544 ) ) ( not ( = ?auto_116538 ?auto_116545 ) ) ( not ( = ?auto_116538 ?auto_116546 ) ) ( not ( = ?auto_116539 ?auto_116540 ) ) ( not ( = ?auto_116539 ?auto_116541 ) ) ( not ( = ?auto_116539 ?auto_116542 ) ) ( not ( = ?auto_116539 ?auto_116543 ) ) ( not ( = ?auto_116539 ?auto_116544 ) ) ( not ( = ?auto_116539 ?auto_116545 ) ) ( not ( = ?auto_116539 ?auto_116546 ) ) ( not ( = ?auto_116540 ?auto_116541 ) ) ( not ( = ?auto_116540 ?auto_116542 ) ) ( not ( = ?auto_116540 ?auto_116543 ) ) ( not ( = ?auto_116540 ?auto_116544 ) ) ( not ( = ?auto_116540 ?auto_116545 ) ) ( not ( = ?auto_116540 ?auto_116546 ) ) ( not ( = ?auto_116541 ?auto_116542 ) ) ( not ( = ?auto_116541 ?auto_116543 ) ) ( not ( = ?auto_116541 ?auto_116544 ) ) ( not ( = ?auto_116541 ?auto_116545 ) ) ( not ( = ?auto_116541 ?auto_116546 ) ) ( not ( = ?auto_116542 ?auto_116543 ) ) ( not ( = ?auto_116542 ?auto_116544 ) ) ( not ( = ?auto_116542 ?auto_116545 ) ) ( not ( = ?auto_116542 ?auto_116546 ) ) ( not ( = ?auto_116543 ?auto_116544 ) ) ( not ( = ?auto_116543 ?auto_116545 ) ) ( not ( = ?auto_116543 ?auto_116546 ) ) ( not ( = ?auto_116544 ?auto_116545 ) ) ( not ( = ?auto_116544 ?auto_116546 ) ) ( not ( = ?auto_116545 ?auto_116546 ) ) ( ON ?auto_116544 ?auto_116545 ) ( ON ?auto_116543 ?auto_116544 ) ( ON ?auto_116542 ?auto_116543 ) ( ON ?auto_116541 ?auto_116542 ) ( ON ?auto_116540 ?auto_116541 ) ( CLEAR ?auto_116538 ) ( ON ?auto_116539 ?auto_116540 ) ( CLEAR ?auto_116539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_116537 ?auto_116538 ?auto_116539 )
      ( MAKE-9PILE ?auto_116537 ?auto_116538 ?auto_116539 ?auto_116540 ?auto_116541 ?auto_116542 ?auto_116543 ?auto_116544 ?auto_116545 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_116575 - BLOCK
      ?auto_116576 - BLOCK
      ?auto_116577 - BLOCK
      ?auto_116578 - BLOCK
      ?auto_116579 - BLOCK
      ?auto_116580 - BLOCK
      ?auto_116581 - BLOCK
      ?auto_116582 - BLOCK
      ?auto_116583 - BLOCK
    )
    :vars
    (
      ?auto_116584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116583 ?auto_116584 ) ( ON-TABLE ?auto_116575 ) ( not ( = ?auto_116575 ?auto_116576 ) ) ( not ( = ?auto_116575 ?auto_116577 ) ) ( not ( = ?auto_116575 ?auto_116578 ) ) ( not ( = ?auto_116575 ?auto_116579 ) ) ( not ( = ?auto_116575 ?auto_116580 ) ) ( not ( = ?auto_116575 ?auto_116581 ) ) ( not ( = ?auto_116575 ?auto_116582 ) ) ( not ( = ?auto_116575 ?auto_116583 ) ) ( not ( = ?auto_116575 ?auto_116584 ) ) ( not ( = ?auto_116576 ?auto_116577 ) ) ( not ( = ?auto_116576 ?auto_116578 ) ) ( not ( = ?auto_116576 ?auto_116579 ) ) ( not ( = ?auto_116576 ?auto_116580 ) ) ( not ( = ?auto_116576 ?auto_116581 ) ) ( not ( = ?auto_116576 ?auto_116582 ) ) ( not ( = ?auto_116576 ?auto_116583 ) ) ( not ( = ?auto_116576 ?auto_116584 ) ) ( not ( = ?auto_116577 ?auto_116578 ) ) ( not ( = ?auto_116577 ?auto_116579 ) ) ( not ( = ?auto_116577 ?auto_116580 ) ) ( not ( = ?auto_116577 ?auto_116581 ) ) ( not ( = ?auto_116577 ?auto_116582 ) ) ( not ( = ?auto_116577 ?auto_116583 ) ) ( not ( = ?auto_116577 ?auto_116584 ) ) ( not ( = ?auto_116578 ?auto_116579 ) ) ( not ( = ?auto_116578 ?auto_116580 ) ) ( not ( = ?auto_116578 ?auto_116581 ) ) ( not ( = ?auto_116578 ?auto_116582 ) ) ( not ( = ?auto_116578 ?auto_116583 ) ) ( not ( = ?auto_116578 ?auto_116584 ) ) ( not ( = ?auto_116579 ?auto_116580 ) ) ( not ( = ?auto_116579 ?auto_116581 ) ) ( not ( = ?auto_116579 ?auto_116582 ) ) ( not ( = ?auto_116579 ?auto_116583 ) ) ( not ( = ?auto_116579 ?auto_116584 ) ) ( not ( = ?auto_116580 ?auto_116581 ) ) ( not ( = ?auto_116580 ?auto_116582 ) ) ( not ( = ?auto_116580 ?auto_116583 ) ) ( not ( = ?auto_116580 ?auto_116584 ) ) ( not ( = ?auto_116581 ?auto_116582 ) ) ( not ( = ?auto_116581 ?auto_116583 ) ) ( not ( = ?auto_116581 ?auto_116584 ) ) ( not ( = ?auto_116582 ?auto_116583 ) ) ( not ( = ?auto_116582 ?auto_116584 ) ) ( not ( = ?auto_116583 ?auto_116584 ) ) ( ON ?auto_116582 ?auto_116583 ) ( ON ?auto_116581 ?auto_116582 ) ( ON ?auto_116580 ?auto_116581 ) ( ON ?auto_116579 ?auto_116580 ) ( ON ?auto_116578 ?auto_116579 ) ( ON ?auto_116577 ?auto_116578 ) ( CLEAR ?auto_116575 ) ( ON ?auto_116576 ?auto_116577 ) ( CLEAR ?auto_116576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_116575 ?auto_116576 )
      ( MAKE-9PILE ?auto_116575 ?auto_116576 ?auto_116577 ?auto_116578 ?auto_116579 ?auto_116580 ?auto_116581 ?auto_116582 ?auto_116583 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_116613 - BLOCK
      ?auto_116614 - BLOCK
      ?auto_116615 - BLOCK
      ?auto_116616 - BLOCK
      ?auto_116617 - BLOCK
      ?auto_116618 - BLOCK
      ?auto_116619 - BLOCK
      ?auto_116620 - BLOCK
      ?auto_116621 - BLOCK
    )
    :vars
    (
      ?auto_116622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116621 ?auto_116622 ) ( not ( = ?auto_116613 ?auto_116614 ) ) ( not ( = ?auto_116613 ?auto_116615 ) ) ( not ( = ?auto_116613 ?auto_116616 ) ) ( not ( = ?auto_116613 ?auto_116617 ) ) ( not ( = ?auto_116613 ?auto_116618 ) ) ( not ( = ?auto_116613 ?auto_116619 ) ) ( not ( = ?auto_116613 ?auto_116620 ) ) ( not ( = ?auto_116613 ?auto_116621 ) ) ( not ( = ?auto_116613 ?auto_116622 ) ) ( not ( = ?auto_116614 ?auto_116615 ) ) ( not ( = ?auto_116614 ?auto_116616 ) ) ( not ( = ?auto_116614 ?auto_116617 ) ) ( not ( = ?auto_116614 ?auto_116618 ) ) ( not ( = ?auto_116614 ?auto_116619 ) ) ( not ( = ?auto_116614 ?auto_116620 ) ) ( not ( = ?auto_116614 ?auto_116621 ) ) ( not ( = ?auto_116614 ?auto_116622 ) ) ( not ( = ?auto_116615 ?auto_116616 ) ) ( not ( = ?auto_116615 ?auto_116617 ) ) ( not ( = ?auto_116615 ?auto_116618 ) ) ( not ( = ?auto_116615 ?auto_116619 ) ) ( not ( = ?auto_116615 ?auto_116620 ) ) ( not ( = ?auto_116615 ?auto_116621 ) ) ( not ( = ?auto_116615 ?auto_116622 ) ) ( not ( = ?auto_116616 ?auto_116617 ) ) ( not ( = ?auto_116616 ?auto_116618 ) ) ( not ( = ?auto_116616 ?auto_116619 ) ) ( not ( = ?auto_116616 ?auto_116620 ) ) ( not ( = ?auto_116616 ?auto_116621 ) ) ( not ( = ?auto_116616 ?auto_116622 ) ) ( not ( = ?auto_116617 ?auto_116618 ) ) ( not ( = ?auto_116617 ?auto_116619 ) ) ( not ( = ?auto_116617 ?auto_116620 ) ) ( not ( = ?auto_116617 ?auto_116621 ) ) ( not ( = ?auto_116617 ?auto_116622 ) ) ( not ( = ?auto_116618 ?auto_116619 ) ) ( not ( = ?auto_116618 ?auto_116620 ) ) ( not ( = ?auto_116618 ?auto_116621 ) ) ( not ( = ?auto_116618 ?auto_116622 ) ) ( not ( = ?auto_116619 ?auto_116620 ) ) ( not ( = ?auto_116619 ?auto_116621 ) ) ( not ( = ?auto_116619 ?auto_116622 ) ) ( not ( = ?auto_116620 ?auto_116621 ) ) ( not ( = ?auto_116620 ?auto_116622 ) ) ( not ( = ?auto_116621 ?auto_116622 ) ) ( ON ?auto_116620 ?auto_116621 ) ( ON ?auto_116619 ?auto_116620 ) ( ON ?auto_116618 ?auto_116619 ) ( ON ?auto_116617 ?auto_116618 ) ( ON ?auto_116616 ?auto_116617 ) ( ON ?auto_116615 ?auto_116616 ) ( ON ?auto_116614 ?auto_116615 ) ( ON ?auto_116613 ?auto_116614 ) ( CLEAR ?auto_116613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_116613 )
      ( MAKE-9PILE ?auto_116613 ?auto_116614 ?auto_116615 ?auto_116616 ?auto_116617 ?auto_116618 ?auto_116619 ?auto_116620 ?auto_116621 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_116652 - BLOCK
      ?auto_116653 - BLOCK
      ?auto_116654 - BLOCK
      ?auto_116655 - BLOCK
      ?auto_116656 - BLOCK
      ?auto_116657 - BLOCK
      ?auto_116658 - BLOCK
      ?auto_116659 - BLOCK
      ?auto_116660 - BLOCK
      ?auto_116661 - BLOCK
    )
    :vars
    (
      ?auto_116662 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_116660 ) ( ON ?auto_116661 ?auto_116662 ) ( CLEAR ?auto_116661 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_116652 ) ( ON ?auto_116653 ?auto_116652 ) ( ON ?auto_116654 ?auto_116653 ) ( ON ?auto_116655 ?auto_116654 ) ( ON ?auto_116656 ?auto_116655 ) ( ON ?auto_116657 ?auto_116656 ) ( ON ?auto_116658 ?auto_116657 ) ( ON ?auto_116659 ?auto_116658 ) ( ON ?auto_116660 ?auto_116659 ) ( not ( = ?auto_116652 ?auto_116653 ) ) ( not ( = ?auto_116652 ?auto_116654 ) ) ( not ( = ?auto_116652 ?auto_116655 ) ) ( not ( = ?auto_116652 ?auto_116656 ) ) ( not ( = ?auto_116652 ?auto_116657 ) ) ( not ( = ?auto_116652 ?auto_116658 ) ) ( not ( = ?auto_116652 ?auto_116659 ) ) ( not ( = ?auto_116652 ?auto_116660 ) ) ( not ( = ?auto_116652 ?auto_116661 ) ) ( not ( = ?auto_116652 ?auto_116662 ) ) ( not ( = ?auto_116653 ?auto_116654 ) ) ( not ( = ?auto_116653 ?auto_116655 ) ) ( not ( = ?auto_116653 ?auto_116656 ) ) ( not ( = ?auto_116653 ?auto_116657 ) ) ( not ( = ?auto_116653 ?auto_116658 ) ) ( not ( = ?auto_116653 ?auto_116659 ) ) ( not ( = ?auto_116653 ?auto_116660 ) ) ( not ( = ?auto_116653 ?auto_116661 ) ) ( not ( = ?auto_116653 ?auto_116662 ) ) ( not ( = ?auto_116654 ?auto_116655 ) ) ( not ( = ?auto_116654 ?auto_116656 ) ) ( not ( = ?auto_116654 ?auto_116657 ) ) ( not ( = ?auto_116654 ?auto_116658 ) ) ( not ( = ?auto_116654 ?auto_116659 ) ) ( not ( = ?auto_116654 ?auto_116660 ) ) ( not ( = ?auto_116654 ?auto_116661 ) ) ( not ( = ?auto_116654 ?auto_116662 ) ) ( not ( = ?auto_116655 ?auto_116656 ) ) ( not ( = ?auto_116655 ?auto_116657 ) ) ( not ( = ?auto_116655 ?auto_116658 ) ) ( not ( = ?auto_116655 ?auto_116659 ) ) ( not ( = ?auto_116655 ?auto_116660 ) ) ( not ( = ?auto_116655 ?auto_116661 ) ) ( not ( = ?auto_116655 ?auto_116662 ) ) ( not ( = ?auto_116656 ?auto_116657 ) ) ( not ( = ?auto_116656 ?auto_116658 ) ) ( not ( = ?auto_116656 ?auto_116659 ) ) ( not ( = ?auto_116656 ?auto_116660 ) ) ( not ( = ?auto_116656 ?auto_116661 ) ) ( not ( = ?auto_116656 ?auto_116662 ) ) ( not ( = ?auto_116657 ?auto_116658 ) ) ( not ( = ?auto_116657 ?auto_116659 ) ) ( not ( = ?auto_116657 ?auto_116660 ) ) ( not ( = ?auto_116657 ?auto_116661 ) ) ( not ( = ?auto_116657 ?auto_116662 ) ) ( not ( = ?auto_116658 ?auto_116659 ) ) ( not ( = ?auto_116658 ?auto_116660 ) ) ( not ( = ?auto_116658 ?auto_116661 ) ) ( not ( = ?auto_116658 ?auto_116662 ) ) ( not ( = ?auto_116659 ?auto_116660 ) ) ( not ( = ?auto_116659 ?auto_116661 ) ) ( not ( = ?auto_116659 ?auto_116662 ) ) ( not ( = ?auto_116660 ?auto_116661 ) ) ( not ( = ?auto_116660 ?auto_116662 ) ) ( not ( = ?auto_116661 ?auto_116662 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_116661 ?auto_116662 )
      ( !STACK ?auto_116661 ?auto_116660 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_116694 - BLOCK
      ?auto_116695 - BLOCK
      ?auto_116696 - BLOCK
      ?auto_116697 - BLOCK
      ?auto_116698 - BLOCK
      ?auto_116699 - BLOCK
      ?auto_116700 - BLOCK
      ?auto_116701 - BLOCK
      ?auto_116702 - BLOCK
      ?auto_116703 - BLOCK
    )
    :vars
    (
      ?auto_116704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116703 ?auto_116704 ) ( ON-TABLE ?auto_116694 ) ( ON ?auto_116695 ?auto_116694 ) ( ON ?auto_116696 ?auto_116695 ) ( ON ?auto_116697 ?auto_116696 ) ( ON ?auto_116698 ?auto_116697 ) ( ON ?auto_116699 ?auto_116698 ) ( ON ?auto_116700 ?auto_116699 ) ( ON ?auto_116701 ?auto_116700 ) ( not ( = ?auto_116694 ?auto_116695 ) ) ( not ( = ?auto_116694 ?auto_116696 ) ) ( not ( = ?auto_116694 ?auto_116697 ) ) ( not ( = ?auto_116694 ?auto_116698 ) ) ( not ( = ?auto_116694 ?auto_116699 ) ) ( not ( = ?auto_116694 ?auto_116700 ) ) ( not ( = ?auto_116694 ?auto_116701 ) ) ( not ( = ?auto_116694 ?auto_116702 ) ) ( not ( = ?auto_116694 ?auto_116703 ) ) ( not ( = ?auto_116694 ?auto_116704 ) ) ( not ( = ?auto_116695 ?auto_116696 ) ) ( not ( = ?auto_116695 ?auto_116697 ) ) ( not ( = ?auto_116695 ?auto_116698 ) ) ( not ( = ?auto_116695 ?auto_116699 ) ) ( not ( = ?auto_116695 ?auto_116700 ) ) ( not ( = ?auto_116695 ?auto_116701 ) ) ( not ( = ?auto_116695 ?auto_116702 ) ) ( not ( = ?auto_116695 ?auto_116703 ) ) ( not ( = ?auto_116695 ?auto_116704 ) ) ( not ( = ?auto_116696 ?auto_116697 ) ) ( not ( = ?auto_116696 ?auto_116698 ) ) ( not ( = ?auto_116696 ?auto_116699 ) ) ( not ( = ?auto_116696 ?auto_116700 ) ) ( not ( = ?auto_116696 ?auto_116701 ) ) ( not ( = ?auto_116696 ?auto_116702 ) ) ( not ( = ?auto_116696 ?auto_116703 ) ) ( not ( = ?auto_116696 ?auto_116704 ) ) ( not ( = ?auto_116697 ?auto_116698 ) ) ( not ( = ?auto_116697 ?auto_116699 ) ) ( not ( = ?auto_116697 ?auto_116700 ) ) ( not ( = ?auto_116697 ?auto_116701 ) ) ( not ( = ?auto_116697 ?auto_116702 ) ) ( not ( = ?auto_116697 ?auto_116703 ) ) ( not ( = ?auto_116697 ?auto_116704 ) ) ( not ( = ?auto_116698 ?auto_116699 ) ) ( not ( = ?auto_116698 ?auto_116700 ) ) ( not ( = ?auto_116698 ?auto_116701 ) ) ( not ( = ?auto_116698 ?auto_116702 ) ) ( not ( = ?auto_116698 ?auto_116703 ) ) ( not ( = ?auto_116698 ?auto_116704 ) ) ( not ( = ?auto_116699 ?auto_116700 ) ) ( not ( = ?auto_116699 ?auto_116701 ) ) ( not ( = ?auto_116699 ?auto_116702 ) ) ( not ( = ?auto_116699 ?auto_116703 ) ) ( not ( = ?auto_116699 ?auto_116704 ) ) ( not ( = ?auto_116700 ?auto_116701 ) ) ( not ( = ?auto_116700 ?auto_116702 ) ) ( not ( = ?auto_116700 ?auto_116703 ) ) ( not ( = ?auto_116700 ?auto_116704 ) ) ( not ( = ?auto_116701 ?auto_116702 ) ) ( not ( = ?auto_116701 ?auto_116703 ) ) ( not ( = ?auto_116701 ?auto_116704 ) ) ( not ( = ?auto_116702 ?auto_116703 ) ) ( not ( = ?auto_116702 ?auto_116704 ) ) ( not ( = ?auto_116703 ?auto_116704 ) ) ( CLEAR ?auto_116701 ) ( ON ?auto_116702 ?auto_116703 ) ( CLEAR ?auto_116702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_116694 ?auto_116695 ?auto_116696 ?auto_116697 ?auto_116698 ?auto_116699 ?auto_116700 ?auto_116701 ?auto_116702 )
      ( MAKE-10PILE ?auto_116694 ?auto_116695 ?auto_116696 ?auto_116697 ?auto_116698 ?auto_116699 ?auto_116700 ?auto_116701 ?auto_116702 ?auto_116703 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_116736 - BLOCK
      ?auto_116737 - BLOCK
      ?auto_116738 - BLOCK
      ?auto_116739 - BLOCK
      ?auto_116740 - BLOCK
      ?auto_116741 - BLOCK
      ?auto_116742 - BLOCK
      ?auto_116743 - BLOCK
      ?auto_116744 - BLOCK
      ?auto_116745 - BLOCK
    )
    :vars
    (
      ?auto_116746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116745 ?auto_116746 ) ( ON-TABLE ?auto_116736 ) ( ON ?auto_116737 ?auto_116736 ) ( ON ?auto_116738 ?auto_116737 ) ( ON ?auto_116739 ?auto_116738 ) ( ON ?auto_116740 ?auto_116739 ) ( ON ?auto_116741 ?auto_116740 ) ( ON ?auto_116742 ?auto_116741 ) ( not ( = ?auto_116736 ?auto_116737 ) ) ( not ( = ?auto_116736 ?auto_116738 ) ) ( not ( = ?auto_116736 ?auto_116739 ) ) ( not ( = ?auto_116736 ?auto_116740 ) ) ( not ( = ?auto_116736 ?auto_116741 ) ) ( not ( = ?auto_116736 ?auto_116742 ) ) ( not ( = ?auto_116736 ?auto_116743 ) ) ( not ( = ?auto_116736 ?auto_116744 ) ) ( not ( = ?auto_116736 ?auto_116745 ) ) ( not ( = ?auto_116736 ?auto_116746 ) ) ( not ( = ?auto_116737 ?auto_116738 ) ) ( not ( = ?auto_116737 ?auto_116739 ) ) ( not ( = ?auto_116737 ?auto_116740 ) ) ( not ( = ?auto_116737 ?auto_116741 ) ) ( not ( = ?auto_116737 ?auto_116742 ) ) ( not ( = ?auto_116737 ?auto_116743 ) ) ( not ( = ?auto_116737 ?auto_116744 ) ) ( not ( = ?auto_116737 ?auto_116745 ) ) ( not ( = ?auto_116737 ?auto_116746 ) ) ( not ( = ?auto_116738 ?auto_116739 ) ) ( not ( = ?auto_116738 ?auto_116740 ) ) ( not ( = ?auto_116738 ?auto_116741 ) ) ( not ( = ?auto_116738 ?auto_116742 ) ) ( not ( = ?auto_116738 ?auto_116743 ) ) ( not ( = ?auto_116738 ?auto_116744 ) ) ( not ( = ?auto_116738 ?auto_116745 ) ) ( not ( = ?auto_116738 ?auto_116746 ) ) ( not ( = ?auto_116739 ?auto_116740 ) ) ( not ( = ?auto_116739 ?auto_116741 ) ) ( not ( = ?auto_116739 ?auto_116742 ) ) ( not ( = ?auto_116739 ?auto_116743 ) ) ( not ( = ?auto_116739 ?auto_116744 ) ) ( not ( = ?auto_116739 ?auto_116745 ) ) ( not ( = ?auto_116739 ?auto_116746 ) ) ( not ( = ?auto_116740 ?auto_116741 ) ) ( not ( = ?auto_116740 ?auto_116742 ) ) ( not ( = ?auto_116740 ?auto_116743 ) ) ( not ( = ?auto_116740 ?auto_116744 ) ) ( not ( = ?auto_116740 ?auto_116745 ) ) ( not ( = ?auto_116740 ?auto_116746 ) ) ( not ( = ?auto_116741 ?auto_116742 ) ) ( not ( = ?auto_116741 ?auto_116743 ) ) ( not ( = ?auto_116741 ?auto_116744 ) ) ( not ( = ?auto_116741 ?auto_116745 ) ) ( not ( = ?auto_116741 ?auto_116746 ) ) ( not ( = ?auto_116742 ?auto_116743 ) ) ( not ( = ?auto_116742 ?auto_116744 ) ) ( not ( = ?auto_116742 ?auto_116745 ) ) ( not ( = ?auto_116742 ?auto_116746 ) ) ( not ( = ?auto_116743 ?auto_116744 ) ) ( not ( = ?auto_116743 ?auto_116745 ) ) ( not ( = ?auto_116743 ?auto_116746 ) ) ( not ( = ?auto_116744 ?auto_116745 ) ) ( not ( = ?auto_116744 ?auto_116746 ) ) ( not ( = ?auto_116745 ?auto_116746 ) ) ( ON ?auto_116744 ?auto_116745 ) ( CLEAR ?auto_116742 ) ( ON ?auto_116743 ?auto_116744 ) ( CLEAR ?auto_116743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_116736 ?auto_116737 ?auto_116738 ?auto_116739 ?auto_116740 ?auto_116741 ?auto_116742 ?auto_116743 )
      ( MAKE-10PILE ?auto_116736 ?auto_116737 ?auto_116738 ?auto_116739 ?auto_116740 ?auto_116741 ?auto_116742 ?auto_116743 ?auto_116744 ?auto_116745 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_116778 - BLOCK
      ?auto_116779 - BLOCK
      ?auto_116780 - BLOCK
      ?auto_116781 - BLOCK
      ?auto_116782 - BLOCK
      ?auto_116783 - BLOCK
      ?auto_116784 - BLOCK
      ?auto_116785 - BLOCK
      ?auto_116786 - BLOCK
      ?auto_116787 - BLOCK
    )
    :vars
    (
      ?auto_116788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116787 ?auto_116788 ) ( ON-TABLE ?auto_116778 ) ( ON ?auto_116779 ?auto_116778 ) ( ON ?auto_116780 ?auto_116779 ) ( ON ?auto_116781 ?auto_116780 ) ( ON ?auto_116782 ?auto_116781 ) ( ON ?auto_116783 ?auto_116782 ) ( not ( = ?auto_116778 ?auto_116779 ) ) ( not ( = ?auto_116778 ?auto_116780 ) ) ( not ( = ?auto_116778 ?auto_116781 ) ) ( not ( = ?auto_116778 ?auto_116782 ) ) ( not ( = ?auto_116778 ?auto_116783 ) ) ( not ( = ?auto_116778 ?auto_116784 ) ) ( not ( = ?auto_116778 ?auto_116785 ) ) ( not ( = ?auto_116778 ?auto_116786 ) ) ( not ( = ?auto_116778 ?auto_116787 ) ) ( not ( = ?auto_116778 ?auto_116788 ) ) ( not ( = ?auto_116779 ?auto_116780 ) ) ( not ( = ?auto_116779 ?auto_116781 ) ) ( not ( = ?auto_116779 ?auto_116782 ) ) ( not ( = ?auto_116779 ?auto_116783 ) ) ( not ( = ?auto_116779 ?auto_116784 ) ) ( not ( = ?auto_116779 ?auto_116785 ) ) ( not ( = ?auto_116779 ?auto_116786 ) ) ( not ( = ?auto_116779 ?auto_116787 ) ) ( not ( = ?auto_116779 ?auto_116788 ) ) ( not ( = ?auto_116780 ?auto_116781 ) ) ( not ( = ?auto_116780 ?auto_116782 ) ) ( not ( = ?auto_116780 ?auto_116783 ) ) ( not ( = ?auto_116780 ?auto_116784 ) ) ( not ( = ?auto_116780 ?auto_116785 ) ) ( not ( = ?auto_116780 ?auto_116786 ) ) ( not ( = ?auto_116780 ?auto_116787 ) ) ( not ( = ?auto_116780 ?auto_116788 ) ) ( not ( = ?auto_116781 ?auto_116782 ) ) ( not ( = ?auto_116781 ?auto_116783 ) ) ( not ( = ?auto_116781 ?auto_116784 ) ) ( not ( = ?auto_116781 ?auto_116785 ) ) ( not ( = ?auto_116781 ?auto_116786 ) ) ( not ( = ?auto_116781 ?auto_116787 ) ) ( not ( = ?auto_116781 ?auto_116788 ) ) ( not ( = ?auto_116782 ?auto_116783 ) ) ( not ( = ?auto_116782 ?auto_116784 ) ) ( not ( = ?auto_116782 ?auto_116785 ) ) ( not ( = ?auto_116782 ?auto_116786 ) ) ( not ( = ?auto_116782 ?auto_116787 ) ) ( not ( = ?auto_116782 ?auto_116788 ) ) ( not ( = ?auto_116783 ?auto_116784 ) ) ( not ( = ?auto_116783 ?auto_116785 ) ) ( not ( = ?auto_116783 ?auto_116786 ) ) ( not ( = ?auto_116783 ?auto_116787 ) ) ( not ( = ?auto_116783 ?auto_116788 ) ) ( not ( = ?auto_116784 ?auto_116785 ) ) ( not ( = ?auto_116784 ?auto_116786 ) ) ( not ( = ?auto_116784 ?auto_116787 ) ) ( not ( = ?auto_116784 ?auto_116788 ) ) ( not ( = ?auto_116785 ?auto_116786 ) ) ( not ( = ?auto_116785 ?auto_116787 ) ) ( not ( = ?auto_116785 ?auto_116788 ) ) ( not ( = ?auto_116786 ?auto_116787 ) ) ( not ( = ?auto_116786 ?auto_116788 ) ) ( not ( = ?auto_116787 ?auto_116788 ) ) ( ON ?auto_116786 ?auto_116787 ) ( ON ?auto_116785 ?auto_116786 ) ( CLEAR ?auto_116783 ) ( ON ?auto_116784 ?auto_116785 ) ( CLEAR ?auto_116784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_116778 ?auto_116779 ?auto_116780 ?auto_116781 ?auto_116782 ?auto_116783 ?auto_116784 )
      ( MAKE-10PILE ?auto_116778 ?auto_116779 ?auto_116780 ?auto_116781 ?auto_116782 ?auto_116783 ?auto_116784 ?auto_116785 ?auto_116786 ?auto_116787 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_116820 - BLOCK
      ?auto_116821 - BLOCK
      ?auto_116822 - BLOCK
      ?auto_116823 - BLOCK
      ?auto_116824 - BLOCK
      ?auto_116825 - BLOCK
      ?auto_116826 - BLOCK
      ?auto_116827 - BLOCK
      ?auto_116828 - BLOCK
      ?auto_116829 - BLOCK
    )
    :vars
    (
      ?auto_116830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116829 ?auto_116830 ) ( ON-TABLE ?auto_116820 ) ( ON ?auto_116821 ?auto_116820 ) ( ON ?auto_116822 ?auto_116821 ) ( ON ?auto_116823 ?auto_116822 ) ( ON ?auto_116824 ?auto_116823 ) ( not ( = ?auto_116820 ?auto_116821 ) ) ( not ( = ?auto_116820 ?auto_116822 ) ) ( not ( = ?auto_116820 ?auto_116823 ) ) ( not ( = ?auto_116820 ?auto_116824 ) ) ( not ( = ?auto_116820 ?auto_116825 ) ) ( not ( = ?auto_116820 ?auto_116826 ) ) ( not ( = ?auto_116820 ?auto_116827 ) ) ( not ( = ?auto_116820 ?auto_116828 ) ) ( not ( = ?auto_116820 ?auto_116829 ) ) ( not ( = ?auto_116820 ?auto_116830 ) ) ( not ( = ?auto_116821 ?auto_116822 ) ) ( not ( = ?auto_116821 ?auto_116823 ) ) ( not ( = ?auto_116821 ?auto_116824 ) ) ( not ( = ?auto_116821 ?auto_116825 ) ) ( not ( = ?auto_116821 ?auto_116826 ) ) ( not ( = ?auto_116821 ?auto_116827 ) ) ( not ( = ?auto_116821 ?auto_116828 ) ) ( not ( = ?auto_116821 ?auto_116829 ) ) ( not ( = ?auto_116821 ?auto_116830 ) ) ( not ( = ?auto_116822 ?auto_116823 ) ) ( not ( = ?auto_116822 ?auto_116824 ) ) ( not ( = ?auto_116822 ?auto_116825 ) ) ( not ( = ?auto_116822 ?auto_116826 ) ) ( not ( = ?auto_116822 ?auto_116827 ) ) ( not ( = ?auto_116822 ?auto_116828 ) ) ( not ( = ?auto_116822 ?auto_116829 ) ) ( not ( = ?auto_116822 ?auto_116830 ) ) ( not ( = ?auto_116823 ?auto_116824 ) ) ( not ( = ?auto_116823 ?auto_116825 ) ) ( not ( = ?auto_116823 ?auto_116826 ) ) ( not ( = ?auto_116823 ?auto_116827 ) ) ( not ( = ?auto_116823 ?auto_116828 ) ) ( not ( = ?auto_116823 ?auto_116829 ) ) ( not ( = ?auto_116823 ?auto_116830 ) ) ( not ( = ?auto_116824 ?auto_116825 ) ) ( not ( = ?auto_116824 ?auto_116826 ) ) ( not ( = ?auto_116824 ?auto_116827 ) ) ( not ( = ?auto_116824 ?auto_116828 ) ) ( not ( = ?auto_116824 ?auto_116829 ) ) ( not ( = ?auto_116824 ?auto_116830 ) ) ( not ( = ?auto_116825 ?auto_116826 ) ) ( not ( = ?auto_116825 ?auto_116827 ) ) ( not ( = ?auto_116825 ?auto_116828 ) ) ( not ( = ?auto_116825 ?auto_116829 ) ) ( not ( = ?auto_116825 ?auto_116830 ) ) ( not ( = ?auto_116826 ?auto_116827 ) ) ( not ( = ?auto_116826 ?auto_116828 ) ) ( not ( = ?auto_116826 ?auto_116829 ) ) ( not ( = ?auto_116826 ?auto_116830 ) ) ( not ( = ?auto_116827 ?auto_116828 ) ) ( not ( = ?auto_116827 ?auto_116829 ) ) ( not ( = ?auto_116827 ?auto_116830 ) ) ( not ( = ?auto_116828 ?auto_116829 ) ) ( not ( = ?auto_116828 ?auto_116830 ) ) ( not ( = ?auto_116829 ?auto_116830 ) ) ( ON ?auto_116828 ?auto_116829 ) ( ON ?auto_116827 ?auto_116828 ) ( ON ?auto_116826 ?auto_116827 ) ( CLEAR ?auto_116824 ) ( ON ?auto_116825 ?auto_116826 ) ( CLEAR ?auto_116825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_116820 ?auto_116821 ?auto_116822 ?auto_116823 ?auto_116824 ?auto_116825 )
      ( MAKE-10PILE ?auto_116820 ?auto_116821 ?auto_116822 ?auto_116823 ?auto_116824 ?auto_116825 ?auto_116826 ?auto_116827 ?auto_116828 ?auto_116829 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_116862 - BLOCK
      ?auto_116863 - BLOCK
      ?auto_116864 - BLOCK
      ?auto_116865 - BLOCK
      ?auto_116866 - BLOCK
      ?auto_116867 - BLOCK
      ?auto_116868 - BLOCK
      ?auto_116869 - BLOCK
      ?auto_116870 - BLOCK
      ?auto_116871 - BLOCK
    )
    :vars
    (
      ?auto_116872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116871 ?auto_116872 ) ( ON-TABLE ?auto_116862 ) ( ON ?auto_116863 ?auto_116862 ) ( ON ?auto_116864 ?auto_116863 ) ( ON ?auto_116865 ?auto_116864 ) ( not ( = ?auto_116862 ?auto_116863 ) ) ( not ( = ?auto_116862 ?auto_116864 ) ) ( not ( = ?auto_116862 ?auto_116865 ) ) ( not ( = ?auto_116862 ?auto_116866 ) ) ( not ( = ?auto_116862 ?auto_116867 ) ) ( not ( = ?auto_116862 ?auto_116868 ) ) ( not ( = ?auto_116862 ?auto_116869 ) ) ( not ( = ?auto_116862 ?auto_116870 ) ) ( not ( = ?auto_116862 ?auto_116871 ) ) ( not ( = ?auto_116862 ?auto_116872 ) ) ( not ( = ?auto_116863 ?auto_116864 ) ) ( not ( = ?auto_116863 ?auto_116865 ) ) ( not ( = ?auto_116863 ?auto_116866 ) ) ( not ( = ?auto_116863 ?auto_116867 ) ) ( not ( = ?auto_116863 ?auto_116868 ) ) ( not ( = ?auto_116863 ?auto_116869 ) ) ( not ( = ?auto_116863 ?auto_116870 ) ) ( not ( = ?auto_116863 ?auto_116871 ) ) ( not ( = ?auto_116863 ?auto_116872 ) ) ( not ( = ?auto_116864 ?auto_116865 ) ) ( not ( = ?auto_116864 ?auto_116866 ) ) ( not ( = ?auto_116864 ?auto_116867 ) ) ( not ( = ?auto_116864 ?auto_116868 ) ) ( not ( = ?auto_116864 ?auto_116869 ) ) ( not ( = ?auto_116864 ?auto_116870 ) ) ( not ( = ?auto_116864 ?auto_116871 ) ) ( not ( = ?auto_116864 ?auto_116872 ) ) ( not ( = ?auto_116865 ?auto_116866 ) ) ( not ( = ?auto_116865 ?auto_116867 ) ) ( not ( = ?auto_116865 ?auto_116868 ) ) ( not ( = ?auto_116865 ?auto_116869 ) ) ( not ( = ?auto_116865 ?auto_116870 ) ) ( not ( = ?auto_116865 ?auto_116871 ) ) ( not ( = ?auto_116865 ?auto_116872 ) ) ( not ( = ?auto_116866 ?auto_116867 ) ) ( not ( = ?auto_116866 ?auto_116868 ) ) ( not ( = ?auto_116866 ?auto_116869 ) ) ( not ( = ?auto_116866 ?auto_116870 ) ) ( not ( = ?auto_116866 ?auto_116871 ) ) ( not ( = ?auto_116866 ?auto_116872 ) ) ( not ( = ?auto_116867 ?auto_116868 ) ) ( not ( = ?auto_116867 ?auto_116869 ) ) ( not ( = ?auto_116867 ?auto_116870 ) ) ( not ( = ?auto_116867 ?auto_116871 ) ) ( not ( = ?auto_116867 ?auto_116872 ) ) ( not ( = ?auto_116868 ?auto_116869 ) ) ( not ( = ?auto_116868 ?auto_116870 ) ) ( not ( = ?auto_116868 ?auto_116871 ) ) ( not ( = ?auto_116868 ?auto_116872 ) ) ( not ( = ?auto_116869 ?auto_116870 ) ) ( not ( = ?auto_116869 ?auto_116871 ) ) ( not ( = ?auto_116869 ?auto_116872 ) ) ( not ( = ?auto_116870 ?auto_116871 ) ) ( not ( = ?auto_116870 ?auto_116872 ) ) ( not ( = ?auto_116871 ?auto_116872 ) ) ( ON ?auto_116870 ?auto_116871 ) ( ON ?auto_116869 ?auto_116870 ) ( ON ?auto_116868 ?auto_116869 ) ( ON ?auto_116867 ?auto_116868 ) ( CLEAR ?auto_116865 ) ( ON ?auto_116866 ?auto_116867 ) ( CLEAR ?auto_116866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_116862 ?auto_116863 ?auto_116864 ?auto_116865 ?auto_116866 )
      ( MAKE-10PILE ?auto_116862 ?auto_116863 ?auto_116864 ?auto_116865 ?auto_116866 ?auto_116867 ?auto_116868 ?auto_116869 ?auto_116870 ?auto_116871 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_116904 - BLOCK
      ?auto_116905 - BLOCK
      ?auto_116906 - BLOCK
      ?auto_116907 - BLOCK
      ?auto_116908 - BLOCK
      ?auto_116909 - BLOCK
      ?auto_116910 - BLOCK
      ?auto_116911 - BLOCK
      ?auto_116912 - BLOCK
      ?auto_116913 - BLOCK
    )
    :vars
    (
      ?auto_116914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116913 ?auto_116914 ) ( ON-TABLE ?auto_116904 ) ( ON ?auto_116905 ?auto_116904 ) ( ON ?auto_116906 ?auto_116905 ) ( not ( = ?auto_116904 ?auto_116905 ) ) ( not ( = ?auto_116904 ?auto_116906 ) ) ( not ( = ?auto_116904 ?auto_116907 ) ) ( not ( = ?auto_116904 ?auto_116908 ) ) ( not ( = ?auto_116904 ?auto_116909 ) ) ( not ( = ?auto_116904 ?auto_116910 ) ) ( not ( = ?auto_116904 ?auto_116911 ) ) ( not ( = ?auto_116904 ?auto_116912 ) ) ( not ( = ?auto_116904 ?auto_116913 ) ) ( not ( = ?auto_116904 ?auto_116914 ) ) ( not ( = ?auto_116905 ?auto_116906 ) ) ( not ( = ?auto_116905 ?auto_116907 ) ) ( not ( = ?auto_116905 ?auto_116908 ) ) ( not ( = ?auto_116905 ?auto_116909 ) ) ( not ( = ?auto_116905 ?auto_116910 ) ) ( not ( = ?auto_116905 ?auto_116911 ) ) ( not ( = ?auto_116905 ?auto_116912 ) ) ( not ( = ?auto_116905 ?auto_116913 ) ) ( not ( = ?auto_116905 ?auto_116914 ) ) ( not ( = ?auto_116906 ?auto_116907 ) ) ( not ( = ?auto_116906 ?auto_116908 ) ) ( not ( = ?auto_116906 ?auto_116909 ) ) ( not ( = ?auto_116906 ?auto_116910 ) ) ( not ( = ?auto_116906 ?auto_116911 ) ) ( not ( = ?auto_116906 ?auto_116912 ) ) ( not ( = ?auto_116906 ?auto_116913 ) ) ( not ( = ?auto_116906 ?auto_116914 ) ) ( not ( = ?auto_116907 ?auto_116908 ) ) ( not ( = ?auto_116907 ?auto_116909 ) ) ( not ( = ?auto_116907 ?auto_116910 ) ) ( not ( = ?auto_116907 ?auto_116911 ) ) ( not ( = ?auto_116907 ?auto_116912 ) ) ( not ( = ?auto_116907 ?auto_116913 ) ) ( not ( = ?auto_116907 ?auto_116914 ) ) ( not ( = ?auto_116908 ?auto_116909 ) ) ( not ( = ?auto_116908 ?auto_116910 ) ) ( not ( = ?auto_116908 ?auto_116911 ) ) ( not ( = ?auto_116908 ?auto_116912 ) ) ( not ( = ?auto_116908 ?auto_116913 ) ) ( not ( = ?auto_116908 ?auto_116914 ) ) ( not ( = ?auto_116909 ?auto_116910 ) ) ( not ( = ?auto_116909 ?auto_116911 ) ) ( not ( = ?auto_116909 ?auto_116912 ) ) ( not ( = ?auto_116909 ?auto_116913 ) ) ( not ( = ?auto_116909 ?auto_116914 ) ) ( not ( = ?auto_116910 ?auto_116911 ) ) ( not ( = ?auto_116910 ?auto_116912 ) ) ( not ( = ?auto_116910 ?auto_116913 ) ) ( not ( = ?auto_116910 ?auto_116914 ) ) ( not ( = ?auto_116911 ?auto_116912 ) ) ( not ( = ?auto_116911 ?auto_116913 ) ) ( not ( = ?auto_116911 ?auto_116914 ) ) ( not ( = ?auto_116912 ?auto_116913 ) ) ( not ( = ?auto_116912 ?auto_116914 ) ) ( not ( = ?auto_116913 ?auto_116914 ) ) ( ON ?auto_116912 ?auto_116913 ) ( ON ?auto_116911 ?auto_116912 ) ( ON ?auto_116910 ?auto_116911 ) ( ON ?auto_116909 ?auto_116910 ) ( ON ?auto_116908 ?auto_116909 ) ( CLEAR ?auto_116906 ) ( ON ?auto_116907 ?auto_116908 ) ( CLEAR ?auto_116907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_116904 ?auto_116905 ?auto_116906 ?auto_116907 )
      ( MAKE-10PILE ?auto_116904 ?auto_116905 ?auto_116906 ?auto_116907 ?auto_116908 ?auto_116909 ?auto_116910 ?auto_116911 ?auto_116912 ?auto_116913 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_116946 - BLOCK
      ?auto_116947 - BLOCK
      ?auto_116948 - BLOCK
      ?auto_116949 - BLOCK
      ?auto_116950 - BLOCK
      ?auto_116951 - BLOCK
      ?auto_116952 - BLOCK
      ?auto_116953 - BLOCK
      ?auto_116954 - BLOCK
      ?auto_116955 - BLOCK
    )
    :vars
    (
      ?auto_116956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116955 ?auto_116956 ) ( ON-TABLE ?auto_116946 ) ( ON ?auto_116947 ?auto_116946 ) ( not ( = ?auto_116946 ?auto_116947 ) ) ( not ( = ?auto_116946 ?auto_116948 ) ) ( not ( = ?auto_116946 ?auto_116949 ) ) ( not ( = ?auto_116946 ?auto_116950 ) ) ( not ( = ?auto_116946 ?auto_116951 ) ) ( not ( = ?auto_116946 ?auto_116952 ) ) ( not ( = ?auto_116946 ?auto_116953 ) ) ( not ( = ?auto_116946 ?auto_116954 ) ) ( not ( = ?auto_116946 ?auto_116955 ) ) ( not ( = ?auto_116946 ?auto_116956 ) ) ( not ( = ?auto_116947 ?auto_116948 ) ) ( not ( = ?auto_116947 ?auto_116949 ) ) ( not ( = ?auto_116947 ?auto_116950 ) ) ( not ( = ?auto_116947 ?auto_116951 ) ) ( not ( = ?auto_116947 ?auto_116952 ) ) ( not ( = ?auto_116947 ?auto_116953 ) ) ( not ( = ?auto_116947 ?auto_116954 ) ) ( not ( = ?auto_116947 ?auto_116955 ) ) ( not ( = ?auto_116947 ?auto_116956 ) ) ( not ( = ?auto_116948 ?auto_116949 ) ) ( not ( = ?auto_116948 ?auto_116950 ) ) ( not ( = ?auto_116948 ?auto_116951 ) ) ( not ( = ?auto_116948 ?auto_116952 ) ) ( not ( = ?auto_116948 ?auto_116953 ) ) ( not ( = ?auto_116948 ?auto_116954 ) ) ( not ( = ?auto_116948 ?auto_116955 ) ) ( not ( = ?auto_116948 ?auto_116956 ) ) ( not ( = ?auto_116949 ?auto_116950 ) ) ( not ( = ?auto_116949 ?auto_116951 ) ) ( not ( = ?auto_116949 ?auto_116952 ) ) ( not ( = ?auto_116949 ?auto_116953 ) ) ( not ( = ?auto_116949 ?auto_116954 ) ) ( not ( = ?auto_116949 ?auto_116955 ) ) ( not ( = ?auto_116949 ?auto_116956 ) ) ( not ( = ?auto_116950 ?auto_116951 ) ) ( not ( = ?auto_116950 ?auto_116952 ) ) ( not ( = ?auto_116950 ?auto_116953 ) ) ( not ( = ?auto_116950 ?auto_116954 ) ) ( not ( = ?auto_116950 ?auto_116955 ) ) ( not ( = ?auto_116950 ?auto_116956 ) ) ( not ( = ?auto_116951 ?auto_116952 ) ) ( not ( = ?auto_116951 ?auto_116953 ) ) ( not ( = ?auto_116951 ?auto_116954 ) ) ( not ( = ?auto_116951 ?auto_116955 ) ) ( not ( = ?auto_116951 ?auto_116956 ) ) ( not ( = ?auto_116952 ?auto_116953 ) ) ( not ( = ?auto_116952 ?auto_116954 ) ) ( not ( = ?auto_116952 ?auto_116955 ) ) ( not ( = ?auto_116952 ?auto_116956 ) ) ( not ( = ?auto_116953 ?auto_116954 ) ) ( not ( = ?auto_116953 ?auto_116955 ) ) ( not ( = ?auto_116953 ?auto_116956 ) ) ( not ( = ?auto_116954 ?auto_116955 ) ) ( not ( = ?auto_116954 ?auto_116956 ) ) ( not ( = ?auto_116955 ?auto_116956 ) ) ( ON ?auto_116954 ?auto_116955 ) ( ON ?auto_116953 ?auto_116954 ) ( ON ?auto_116952 ?auto_116953 ) ( ON ?auto_116951 ?auto_116952 ) ( ON ?auto_116950 ?auto_116951 ) ( ON ?auto_116949 ?auto_116950 ) ( CLEAR ?auto_116947 ) ( ON ?auto_116948 ?auto_116949 ) ( CLEAR ?auto_116948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_116946 ?auto_116947 ?auto_116948 )
      ( MAKE-10PILE ?auto_116946 ?auto_116947 ?auto_116948 ?auto_116949 ?auto_116950 ?auto_116951 ?auto_116952 ?auto_116953 ?auto_116954 ?auto_116955 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_116988 - BLOCK
      ?auto_116989 - BLOCK
      ?auto_116990 - BLOCK
      ?auto_116991 - BLOCK
      ?auto_116992 - BLOCK
      ?auto_116993 - BLOCK
      ?auto_116994 - BLOCK
      ?auto_116995 - BLOCK
      ?auto_116996 - BLOCK
      ?auto_116997 - BLOCK
    )
    :vars
    (
      ?auto_116998 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116997 ?auto_116998 ) ( ON-TABLE ?auto_116988 ) ( not ( = ?auto_116988 ?auto_116989 ) ) ( not ( = ?auto_116988 ?auto_116990 ) ) ( not ( = ?auto_116988 ?auto_116991 ) ) ( not ( = ?auto_116988 ?auto_116992 ) ) ( not ( = ?auto_116988 ?auto_116993 ) ) ( not ( = ?auto_116988 ?auto_116994 ) ) ( not ( = ?auto_116988 ?auto_116995 ) ) ( not ( = ?auto_116988 ?auto_116996 ) ) ( not ( = ?auto_116988 ?auto_116997 ) ) ( not ( = ?auto_116988 ?auto_116998 ) ) ( not ( = ?auto_116989 ?auto_116990 ) ) ( not ( = ?auto_116989 ?auto_116991 ) ) ( not ( = ?auto_116989 ?auto_116992 ) ) ( not ( = ?auto_116989 ?auto_116993 ) ) ( not ( = ?auto_116989 ?auto_116994 ) ) ( not ( = ?auto_116989 ?auto_116995 ) ) ( not ( = ?auto_116989 ?auto_116996 ) ) ( not ( = ?auto_116989 ?auto_116997 ) ) ( not ( = ?auto_116989 ?auto_116998 ) ) ( not ( = ?auto_116990 ?auto_116991 ) ) ( not ( = ?auto_116990 ?auto_116992 ) ) ( not ( = ?auto_116990 ?auto_116993 ) ) ( not ( = ?auto_116990 ?auto_116994 ) ) ( not ( = ?auto_116990 ?auto_116995 ) ) ( not ( = ?auto_116990 ?auto_116996 ) ) ( not ( = ?auto_116990 ?auto_116997 ) ) ( not ( = ?auto_116990 ?auto_116998 ) ) ( not ( = ?auto_116991 ?auto_116992 ) ) ( not ( = ?auto_116991 ?auto_116993 ) ) ( not ( = ?auto_116991 ?auto_116994 ) ) ( not ( = ?auto_116991 ?auto_116995 ) ) ( not ( = ?auto_116991 ?auto_116996 ) ) ( not ( = ?auto_116991 ?auto_116997 ) ) ( not ( = ?auto_116991 ?auto_116998 ) ) ( not ( = ?auto_116992 ?auto_116993 ) ) ( not ( = ?auto_116992 ?auto_116994 ) ) ( not ( = ?auto_116992 ?auto_116995 ) ) ( not ( = ?auto_116992 ?auto_116996 ) ) ( not ( = ?auto_116992 ?auto_116997 ) ) ( not ( = ?auto_116992 ?auto_116998 ) ) ( not ( = ?auto_116993 ?auto_116994 ) ) ( not ( = ?auto_116993 ?auto_116995 ) ) ( not ( = ?auto_116993 ?auto_116996 ) ) ( not ( = ?auto_116993 ?auto_116997 ) ) ( not ( = ?auto_116993 ?auto_116998 ) ) ( not ( = ?auto_116994 ?auto_116995 ) ) ( not ( = ?auto_116994 ?auto_116996 ) ) ( not ( = ?auto_116994 ?auto_116997 ) ) ( not ( = ?auto_116994 ?auto_116998 ) ) ( not ( = ?auto_116995 ?auto_116996 ) ) ( not ( = ?auto_116995 ?auto_116997 ) ) ( not ( = ?auto_116995 ?auto_116998 ) ) ( not ( = ?auto_116996 ?auto_116997 ) ) ( not ( = ?auto_116996 ?auto_116998 ) ) ( not ( = ?auto_116997 ?auto_116998 ) ) ( ON ?auto_116996 ?auto_116997 ) ( ON ?auto_116995 ?auto_116996 ) ( ON ?auto_116994 ?auto_116995 ) ( ON ?auto_116993 ?auto_116994 ) ( ON ?auto_116992 ?auto_116993 ) ( ON ?auto_116991 ?auto_116992 ) ( ON ?auto_116990 ?auto_116991 ) ( CLEAR ?auto_116988 ) ( ON ?auto_116989 ?auto_116990 ) ( CLEAR ?auto_116989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_116988 ?auto_116989 )
      ( MAKE-10PILE ?auto_116988 ?auto_116989 ?auto_116990 ?auto_116991 ?auto_116992 ?auto_116993 ?auto_116994 ?auto_116995 ?auto_116996 ?auto_116997 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_117030 - BLOCK
      ?auto_117031 - BLOCK
      ?auto_117032 - BLOCK
      ?auto_117033 - BLOCK
      ?auto_117034 - BLOCK
      ?auto_117035 - BLOCK
      ?auto_117036 - BLOCK
      ?auto_117037 - BLOCK
      ?auto_117038 - BLOCK
      ?auto_117039 - BLOCK
    )
    :vars
    (
      ?auto_117040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117039 ?auto_117040 ) ( not ( = ?auto_117030 ?auto_117031 ) ) ( not ( = ?auto_117030 ?auto_117032 ) ) ( not ( = ?auto_117030 ?auto_117033 ) ) ( not ( = ?auto_117030 ?auto_117034 ) ) ( not ( = ?auto_117030 ?auto_117035 ) ) ( not ( = ?auto_117030 ?auto_117036 ) ) ( not ( = ?auto_117030 ?auto_117037 ) ) ( not ( = ?auto_117030 ?auto_117038 ) ) ( not ( = ?auto_117030 ?auto_117039 ) ) ( not ( = ?auto_117030 ?auto_117040 ) ) ( not ( = ?auto_117031 ?auto_117032 ) ) ( not ( = ?auto_117031 ?auto_117033 ) ) ( not ( = ?auto_117031 ?auto_117034 ) ) ( not ( = ?auto_117031 ?auto_117035 ) ) ( not ( = ?auto_117031 ?auto_117036 ) ) ( not ( = ?auto_117031 ?auto_117037 ) ) ( not ( = ?auto_117031 ?auto_117038 ) ) ( not ( = ?auto_117031 ?auto_117039 ) ) ( not ( = ?auto_117031 ?auto_117040 ) ) ( not ( = ?auto_117032 ?auto_117033 ) ) ( not ( = ?auto_117032 ?auto_117034 ) ) ( not ( = ?auto_117032 ?auto_117035 ) ) ( not ( = ?auto_117032 ?auto_117036 ) ) ( not ( = ?auto_117032 ?auto_117037 ) ) ( not ( = ?auto_117032 ?auto_117038 ) ) ( not ( = ?auto_117032 ?auto_117039 ) ) ( not ( = ?auto_117032 ?auto_117040 ) ) ( not ( = ?auto_117033 ?auto_117034 ) ) ( not ( = ?auto_117033 ?auto_117035 ) ) ( not ( = ?auto_117033 ?auto_117036 ) ) ( not ( = ?auto_117033 ?auto_117037 ) ) ( not ( = ?auto_117033 ?auto_117038 ) ) ( not ( = ?auto_117033 ?auto_117039 ) ) ( not ( = ?auto_117033 ?auto_117040 ) ) ( not ( = ?auto_117034 ?auto_117035 ) ) ( not ( = ?auto_117034 ?auto_117036 ) ) ( not ( = ?auto_117034 ?auto_117037 ) ) ( not ( = ?auto_117034 ?auto_117038 ) ) ( not ( = ?auto_117034 ?auto_117039 ) ) ( not ( = ?auto_117034 ?auto_117040 ) ) ( not ( = ?auto_117035 ?auto_117036 ) ) ( not ( = ?auto_117035 ?auto_117037 ) ) ( not ( = ?auto_117035 ?auto_117038 ) ) ( not ( = ?auto_117035 ?auto_117039 ) ) ( not ( = ?auto_117035 ?auto_117040 ) ) ( not ( = ?auto_117036 ?auto_117037 ) ) ( not ( = ?auto_117036 ?auto_117038 ) ) ( not ( = ?auto_117036 ?auto_117039 ) ) ( not ( = ?auto_117036 ?auto_117040 ) ) ( not ( = ?auto_117037 ?auto_117038 ) ) ( not ( = ?auto_117037 ?auto_117039 ) ) ( not ( = ?auto_117037 ?auto_117040 ) ) ( not ( = ?auto_117038 ?auto_117039 ) ) ( not ( = ?auto_117038 ?auto_117040 ) ) ( not ( = ?auto_117039 ?auto_117040 ) ) ( ON ?auto_117038 ?auto_117039 ) ( ON ?auto_117037 ?auto_117038 ) ( ON ?auto_117036 ?auto_117037 ) ( ON ?auto_117035 ?auto_117036 ) ( ON ?auto_117034 ?auto_117035 ) ( ON ?auto_117033 ?auto_117034 ) ( ON ?auto_117032 ?auto_117033 ) ( ON ?auto_117031 ?auto_117032 ) ( ON ?auto_117030 ?auto_117031 ) ( CLEAR ?auto_117030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_117030 )
      ( MAKE-10PILE ?auto_117030 ?auto_117031 ?auto_117032 ?auto_117033 ?auto_117034 ?auto_117035 ?auto_117036 ?auto_117037 ?auto_117038 ?auto_117039 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_117073 - BLOCK
      ?auto_117074 - BLOCK
      ?auto_117075 - BLOCK
      ?auto_117076 - BLOCK
      ?auto_117077 - BLOCK
      ?auto_117078 - BLOCK
      ?auto_117079 - BLOCK
      ?auto_117080 - BLOCK
      ?auto_117081 - BLOCK
      ?auto_117082 - BLOCK
      ?auto_117083 - BLOCK
    )
    :vars
    (
      ?auto_117084 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_117082 ) ( ON ?auto_117083 ?auto_117084 ) ( CLEAR ?auto_117083 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_117073 ) ( ON ?auto_117074 ?auto_117073 ) ( ON ?auto_117075 ?auto_117074 ) ( ON ?auto_117076 ?auto_117075 ) ( ON ?auto_117077 ?auto_117076 ) ( ON ?auto_117078 ?auto_117077 ) ( ON ?auto_117079 ?auto_117078 ) ( ON ?auto_117080 ?auto_117079 ) ( ON ?auto_117081 ?auto_117080 ) ( ON ?auto_117082 ?auto_117081 ) ( not ( = ?auto_117073 ?auto_117074 ) ) ( not ( = ?auto_117073 ?auto_117075 ) ) ( not ( = ?auto_117073 ?auto_117076 ) ) ( not ( = ?auto_117073 ?auto_117077 ) ) ( not ( = ?auto_117073 ?auto_117078 ) ) ( not ( = ?auto_117073 ?auto_117079 ) ) ( not ( = ?auto_117073 ?auto_117080 ) ) ( not ( = ?auto_117073 ?auto_117081 ) ) ( not ( = ?auto_117073 ?auto_117082 ) ) ( not ( = ?auto_117073 ?auto_117083 ) ) ( not ( = ?auto_117073 ?auto_117084 ) ) ( not ( = ?auto_117074 ?auto_117075 ) ) ( not ( = ?auto_117074 ?auto_117076 ) ) ( not ( = ?auto_117074 ?auto_117077 ) ) ( not ( = ?auto_117074 ?auto_117078 ) ) ( not ( = ?auto_117074 ?auto_117079 ) ) ( not ( = ?auto_117074 ?auto_117080 ) ) ( not ( = ?auto_117074 ?auto_117081 ) ) ( not ( = ?auto_117074 ?auto_117082 ) ) ( not ( = ?auto_117074 ?auto_117083 ) ) ( not ( = ?auto_117074 ?auto_117084 ) ) ( not ( = ?auto_117075 ?auto_117076 ) ) ( not ( = ?auto_117075 ?auto_117077 ) ) ( not ( = ?auto_117075 ?auto_117078 ) ) ( not ( = ?auto_117075 ?auto_117079 ) ) ( not ( = ?auto_117075 ?auto_117080 ) ) ( not ( = ?auto_117075 ?auto_117081 ) ) ( not ( = ?auto_117075 ?auto_117082 ) ) ( not ( = ?auto_117075 ?auto_117083 ) ) ( not ( = ?auto_117075 ?auto_117084 ) ) ( not ( = ?auto_117076 ?auto_117077 ) ) ( not ( = ?auto_117076 ?auto_117078 ) ) ( not ( = ?auto_117076 ?auto_117079 ) ) ( not ( = ?auto_117076 ?auto_117080 ) ) ( not ( = ?auto_117076 ?auto_117081 ) ) ( not ( = ?auto_117076 ?auto_117082 ) ) ( not ( = ?auto_117076 ?auto_117083 ) ) ( not ( = ?auto_117076 ?auto_117084 ) ) ( not ( = ?auto_117077 ?auto_117078 ) ) ( not ( = ?auto_117077 ?auto_117079 ) ) ( not ( = ?auto_117077 ?auto_117080 ) ) ( not ( = ?auto_117077 ?auto_117081 ) ) ( not ( = ?auto_117077 ?auto_117082 ) ) ( not ( = ?auto_117077 ?auto_117083 ) ) ( not ( = ?auto_117077 ?auto_117084 ) ) ( not ( = ?auto_117078 ?auto_117079 ) ) ( not ( = ?auto_117078 ?auto_117080 ) ) ( not ( = ?auto_117078 ?auto_117081 ) ) ( not ( = ?auto_117078 ?auto_117082 ) ) ( not ( = ?auto_117078 ?auto_117083 ) ) ( not ( = ?auto_117078 ?auto_117084 ) ) ( not ( = ?auto_117079 ?auto_117080 ) ) ( not ( = ?auto_117079 ?auto_117081 ) ) ( not ( = ?auto_117079 ?auto_117082 ) ) ( not ( = ?auto_117079 ?auto_117083 ) ) ( not ( = ?auto_117079 ?auto_117084 ) ) ( not ( = ?auto_117080 ?auto_117081 ) ) ( not ( = ?auto_117080 ?auto_117082 ) ) ( not ( = ?auto_117080 ?auto_117083 ) ) ( not ( = ?auto_117080 ?auto_117084 ) ) ( not ( = ?auto_117081 ?auto_117082 ) ) ( not ( = ?auto_117081 ?auto_117083 ) ) ( not ( = ?auto_117081 ?auto_117084 ) ) ( not ( = ?auto_117082 ?auto_117083 ) ) ( not ( = ?auto_117082 ?auto_117084 ) ) ( not ( = ?auto_117083 ?auto_117084 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117083 ?auto_117084 )
      ( !STACK ?auto_117083 ?auto_117082 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_117096 - BLOCK
      ?auto_117097 - BLOCK
      ?auto_117098 - BLOCK
      ?auto_117099 - BLOCK
      ?auto_117100 - BLOCK
      ?auto_117101 - BLOCK
      ?auto_117102 - BLOCK
      ?auto_117103 - BLOCK
      ?auto_117104 - BLOCK
      ?auto_117105 - BLOCK
      ?auto_117106 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_117105 ) ( ON-TABLE ?auto_117106 ) ( CLEAR ?auto_117106 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_117096 ) ( ON ?auto_117097 ?auto_117096 ) ( ON ?auto_117098 ?auto_117097 ) ( ON ?auto_117099 ?auto_117098 ) ( ON ?auto_117100 ?auto_117099 ) ( ON ?auto_117101 ?auto_117100 ) ( ON ?auto_117102 ?auto_117101 ) ( ON ?auto_117103 ?auto_117102 ) ( ON ?auto_117104 ?auto_117103 ) ( ON ?auto_117105 ?auto_117104 ) ( not ( = ?auto_117096 ?auto_117097 ) ) ( not ( = ?auto_117096 ?auto_117098 ) ) ( not ( = ?auto_117096 ?auto_117099 ) ) ( not ( = ?auto_117096 ?auto_117100 ) ) ( not ( = ?auto_117096 ?auto_117101 ) ) ( not ( = ?auto_117096 ?auto_117102 ) ) ( not ( = ?auto_117096 ?auto_117103 ) ) ( not ( = ?auto_117096 ?auto_117104 ) ) ( not ( = ?auto_117096 ?auto_117105 ) ) ( not ( = ?auto_117096 ?auto_117106 ) ) ( not ( = ?auto_117097 ?auto_117098 ) ) ( not ( = ?auto_117097 ?auto_117099 ) ) ( not ( = ?auto_117097 ?auto_117100 ) ) ( not ( = ?auto_117097 ?auto_117101 ) ) ( not ( = ?auto_117097 ?auto_117102 ) ) ( not ( = ?auto_117097 ?auto_117103 ) ) ( not ( = ?auto_117097 ?auto_117104 ) ) ( not ( = ?auto_117097 ?auto_117105 ) ) ( not ( = ?auto_117097 ?auto_117106 ) ) ( not ( = ?auto_117098 ?auto_117099 ) ) ( not ( = ?auto_117098 ?auto_117100 ) ) ( not ( = ?auto_117098 ?auto_117101 ) ) ( not ( = ?auto_117098 ?auto_117102 ) ) ( not ( = ?auto_117098 ?auto_117103 ) ) ( not ( = ?auto_117098 ?auto_117104 ) ) ( not ( = ?auto_117098 ?auto_117105 ) ) ( not ( = ?auto_117098 ?auto_117106 ) ) ( not ( = ?auto_117099 ?auto_117100 ) ) ( not ( = ?auto_117099 ?auto_117101 ) ) ( not ( = ?auto_117099 ?auto_117102 ) ) ( not ( = ?auto_117099 ?auto_117103 ) ) ( not ( = ?auto_117099 ?auto_117104 ) ) ( not ( = ?auto_117099 ?auto_117105 ) ) ( not ( = ?auto_117099 ?auto_117106 ) ) ( not ( = ?auto_117100 ?auto_117101 ) ) ( not ( = ?auto_117100 ?auto_117102 ) ) ( not ( = ?auto_117100 ?auto_117103 ) ) ( not ( = ?auto_117100 ?auto_117104 ) ) ( not ( = ?auto_117100 ?auto_117105 ) ) ( not ( = ?auto_117100 ?auto_117106 ) ) ( not ( = ?auto_117101 ?auto_117102 ) ) ( not ( = ?auto_117101 ?auto_117103 ) ) ( not ( = ?auto_117101 ?auto_117104 ) ) ( not ( = ?auto_117101 ?auto_117105 ) ) ( not ( = ?auto_117101 ?auto_117106 ) ) ( not ( = ?auto_117102 ?auto_117103 ) ) ( not ( = ?auto_117102 ?auto_117104 ) ) ( not ( = ?auto_117102 ?auto_117105 ) ) ( not ( = ?auto_117102 ?auto_117106 ) ) ( not ( = ?auto_117103 ?auto_117104 ) ) ( not ( = ?auto_117103 ?auto_117105 ) ) ( not ( = ?auto_117103 ?auto_117106 ) ) ( not ( = ?auto_117104 ?auto_117105 ) ) ( not ( = ?auto_117104 ?auto_117106 ) ) ( not ( = ?auto_117105 ?auto_117106 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_117106 )
      ( !STACK ?auto_117106 ?auto_117105 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_117118 - BLOCK
      ?auto_117119 - BLOCK
      ?auto_117120 - BLOCK
      ?auto_117121 - BLOCK
      ?auto_117122 - BLOCK
      ?auto_117123 - BLOCK
      ?auto_117124 - BLOCK
      ?auto_117125 - BLOCK
      ?auto_117126 - BLOCK
      ?auto_117127 - BLOCK
      ?auto_117128 - BLOCK
    )
    :vars
    (
      ?auto_117129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117128 ?auto_117129 ) ( ON-TABLE ?auto_117118 ) ( ON ?auto_117119 ?auto_117118 ) ( ON ?auto_117120 ?auto_117119 ) ( ON ?auto_117121 ?auto_117120 ) ( ON ?auto_117122 ?auto_117121 ) ( ON ?auto_117123 ?auto_117122 ) ( ON ?auto_117124 ?auto_117123 ) ( ON ?auto_117125 ?auto_117124 ) ( ON ?auto_117126 ?auto_117125 ) ( not ( = ?auto_117118 ?auto_117119 ) ) ( not ( = ?auto_117118 ?auto_117120 ) ) ( not ( = ?auto_117118 ?auto_117121 ) ) ( not ( = ?auto_117118 ?auto_117122 ) ) ( not ( = ?auto_117118 ?auto_117123 ) ) ( not ( = ?auto_117118 ?auto_117124 ) ) ( not ( = ?auto_117118 ?auto_117125 ) ) ( not ( = ?auto_117118 ?auto_117126 ) ) ( not ( = ?auto_117118 ?auto_117127 ) ) ( not ( = ?auto_117118 ?auto_117128 ) ) ( not ( = ?auto_117118 ?auto_117129 ) ) ( not ( = ?auto_117119 ?auto_117120 ) ) ( not ( = ?auto_117119 ?auto_117121 ) ) ( not ( = ?auto_117119 ?auto_117122 ) ) ( not ( = ?auto_117119 ?auto_117123 ) ) ( not ( = ?auto_117119 ?auto_117124 ) ) ( not ( = ?auto_117119 ?auto_117125 ) ) ( not ( = ?auto_117119 ?auto_117126 ) ) ( not ( = ?auto_117119 ?auto_117127 ) ) ( not ( = ?auto_117119 ?auto_117128 ) ) ( not ( = ?auto_117119 ?auto_117129 ) ) ( not ( = ?auto_117120 ?auto_117121 ) ) ( not ( = ?auto_117120 ?auto_117122 ) ) ( not ( = ?auto_117120 ?auto_117123 ) ) ( not ( = ?auto_117120 ?auto_117124 ) ) ( not ( = ?auto_117120 ?auto_117125 ) ) ( not ( = ?auto_117120 ?auto_117126 ) ) ( not ( = ?auto_117120 ?auto_117127 ) ) ( not ( = ?auto_117120 ?auto_117128 ) ) ( not ( = ?auto_117120 ?auto_117129 ) ) ( not ( = ?auto_117121 ?auto_117122 ) ) ( not ( = ?auto_117121 ?auto_117123 ) ) ( not ( = ?auto_117121 ?auto_117124 ) ) ( not ( = ?auto_117121 ?auto_117125 ) ) ( not ( = ?auto_117121 ?auto_117126 ) ) ( not ( = ?auto_117121 ?auto_117127 ) ) ( not ( = ?auto_117121 ?auto_117128 ) ) ( not ( = ?auto_117121 ?auto_117129 ) ) ( not ( = ?auto_117122 ?auto_117123 ) ) ( not ( = ?auto_117122 ?auto_117124 ) ) ( not ( = ?auto_117122 ?auto_117125 ) ) ( not ( = ?auto_117122 ?auto_117126 ) ) ( not ( = ?auto_117122 ?auto_117127 ) ) ( not ( = ?auto_117122 ?auto_117128 ) ) ( not ( = ?auto_117122 ?auto_117129 ) ) ( not ( = ?auto_117123 ?auto_117124 ) ) ( not ( = ?auto_117123 ?auto_117125 ) ) ( not ( = ?auto_117123 ?auto_117126 ) ) ( not ( = ?auto_117123 ?auto_117127 ) ) ( not ( = ?auto_117123 ?auto_117128 ) ) ( not ( = ?auto_117123 ?auto_117129 ) ) ( not ( = ?auto_117124 ?auto_117125 ) ) ( not ( = ?auto_117124 ?auto_117126 ) ) ( not ( = ?auto_117124 ?auto_117127 ) ) ( not ( = ?auto_117124 ?auto_117128 ) ) ( not ( = ?auto_117124 ?auto_117129 ) ) ( not ( = ?auto_117125 ?auto_117126 ) ) ( not ( = ?auto_117125 ?auto_117127 ) ) ( not ( = ?auto_117125 ?auto_117128 ) ) ( not ( = ?auto_117125 ?auto_117129 ) ) ( not ( = ?auto_117126 ?auto_117127 ) ) ( not ( = ?auto_117126 ?auto_117128 ) ) ( not ( = ?auto_117126 ?auto_117129 ) ) ( not ( = ?auto_117127 ?auto_117128 ) ) ( not ( = ?auto_117127 ?auto_117129 ) ) ( not ( = ?auto_117128 ?auto_117129 ) ) ( CLEAR ?auto_117126 ) ( ON ?auto_117127 ?auto_117128 ) ( CLEAR ?auto_117127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_117118 ?auto_117119 ?auto_117120 ?auto_117121 ?auto_117122 ?auto_117123 ?auto_117124 ?auto_117125 ?auto_117126 ?auto_117127 )
      ( MAKE-11PILE ?auto_117118 ?auto_117119 ?auto_117120 ?auto_117121 ?auto_117122 ?auto_117123 ?auto_117124 ?auto_117125 ?auto_117126 ?auto_117127 ?auto_117128 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_117141 - BLOCK
      ?auto_117142 - BLOCK
      ?auto_117143 - BLOCK
      ?auto_117144 - BLOCK
      ?auto_117145 - BLOCK
      ?auto_117146 - BLOCK
      ?auto_117147 - BLOCK
      ?auto_117148 - BLOCK
      ?auto_117149 - BLOCK
      ?auto_117150 - BLOCK
      ?auto_117151 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117151 ) ( ON-TABLE ?auto_117141 ) ( ON ?auto_117142 ?auto_117141 ) ( ON ?auto_117143 ?auto_117142 ) ( ON ?auto_117144 ?auto_117143 ) ( ON ?auto_117145 ?auto_117144 ) ( ON ?auto_117146 ?auto_117145 ) ( ON ?auto_117147 ?auto_117146 ) ( ON ?auto_117148 ?auto_117147 ) ( ON ?auto_117149 ?auto_117148 ) ( not ( = ?auto_117141 ?auto_117142 ) ) ( not ( = ?auto_117141 ?auto_117143 ) ) ( not ( = ?auto_117141 ?auto_117144 ) ) ( not ( = ?auto_117141 ?auto_117145 ) ) ( not ( = ?auto_117141 ?auto_117146 ) ) ( not ( = ?auto_117141 ?auto_117147 ) ) ( not ( = ?auto_117141 ?auto_117148 ) ) ( not ( = ?auto_117141 ?auto_117149 ) ) ( not ( = ?auto_117141 ?auto_117150 ) ) ( not ( = ?auto_117141 ?auto_117151 ) ) ( not ( = ?auto_117142 ?auto_117143 ) ) ( not ( = ?auto_117142 ?auto_117144 ) ) ( not ( = ?auto_117142 ?auto_117145 ) ) ( not ( = ?auto_117142 ?auto_117146 ) ) ( not ( = ?auto_117142 ?auto_117147 ) ) ( not ( = ?auto_117142 ?auto_117148 ) ) ( not ( = ?auto_117142 ?auto_117149 ) ) ( not ( = ?auto_117142 ?auto_117150 ) ) ( not ( = ?auto_117142 ?auto_117151 ) ) ( not ( = ?auto_117143 ?auto_117144 ) ) ( not ( = ?auto_117143 ?auto_117145 ) ) ( not ( = ?auto_117143 ?auto_117146 ) ) ( not ( = ?auto_117143 ?auto_117147 ) ) ( not ( = ?auto_117143 ?auto_117148 ) ) ( not ( = ?auto_117143 ?auto_117149 ) ) ( not ( = ?auto_117143 ?auto_117150 ) ) ( not ( = ?auto_117143 ?auto_117151 ) ) ( not ( = ?auto_117144 ?auto_117145 ) ) ( not ( = ?auto_117144 ?auto_117146 ) ) ( not ( = ?auto_117144 ?auto_117147 ) ) ( not ( = ?auto_117144 ?auto_117148 ) ) ( not ( = ?auto_117144 ?auto_117149 ) ) ( not ( = ?auto_117144 ?auto_117150 ) ) ( not ( = ?auto_117144 ?auto_117151 ) ) ( not ( = ?auto_117145 ?auto_117146 ) ) ( not ( = ?auto_117145 ?auto_117147 ) ) ( not ( = ?auto_117145 ?auto_117148 ) ) ( not ( = ?auto_117145 ?auto_117149 ) ) ( not ( = ?auto_117145 ?auto_117150 ) ) ( not ( = ?auto_117145 ?auto_117151 ) ) ( not ( = ?auto_117146 ?auto_117147 ) ) ( not ( = ?auto_117146 ?auto_117148 ) ) ( not ( = ?auto_117146 ?auto_117149 ) ) ( not ( = ?auto_117146 ?auto_117150 ) ) ( not ( = ?auto_117146 ?auto_117151 ) ) ( not ( = ?auto_117147 ?auto_117148 ) ) ( not ( = ?auto_117147 ?auto_117149 ) ) ( not ( = ?auto_117147 ?auto_117150 ) ) ( not ( = ?auto_117147 ?auto_117151 ) ) ( not ( = ?auto_117148 ?auto_117149 ) ) ( not ( = ?auto_117148 ?auto_117150 ) ) ( not ( = ?auto_117148 ?auto_117151 ) ) ( not ( = ?auto_117149 ?auto_117150 ) ) ( not ( = ?auto_117149 ?auto_117151 ) ) ( not ( = ?auto_117150 ?auto_117151 ) ) ( CLEAR ?auto_117149 ) ( ON ?auto_117150 ?auto_117151 ) ( CLEAR ?auto_117150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_117141 ?auto_117142 ?auto_117143 ?auto_117144 ?auto_117145 ?auto_117146 ?auto_117147 ?auto_117148 ?auto_117149 ?auto_117150 )
      ( MAKE-11PILE ?auto_117141 ?auto_117142 ?auto_117143 ?auto_117144 ?auto_117145 ?auto_117146 ?auto_117147 ?auto_117148 ?auto_117149 ?auto_117150 ?auto_117151 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_117163 - BLOCK
      ?auto_117164 - BLOCK
      ?auto_117165 - BLOCK
      ?auto_117166 - BLOCK
      ?auto_117167 - BLOCK
      ?auto_117168 - BLOCK
      ?auto_117169 - BLOCK
      ?auto_117170 - BLOCK
      ?auto_117171 - BLOCK
      ?auto_117172 - BLOCK
      ?auto_117173 - BLOCK
    )
    :vars
    (
      ?auto_117174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117173 ?auto_117174 ) ( ON-TABLE ?auto_117163 ) ( ON ?auto_117164 ?auto_117163 ) ( ON ?auto_117165 ?auto_117164 ) ( ON ?auto_117166 ?auto_117165 ) ( ON ?auto_117167 ?auto_117166 ) ( ON ?auto_117168 ?auto_117167 ) ( ON ?auto_117169 ?auto_117168 ) ( ON ?auto_117170 ?auto_117169 ) ( not ( = ?auto_117163 ?auto_117164 ) ) ( not ( = ?auto_117163 ?auto_117165 ) ) ( not ( = ?auto_117163 ?auto_117166 ) ) ( not ( = ?auto_117163 ?auto_117167 ) ) ( not ( = ?auto_117163 ?auto_117168 ) ) ( not ( = ?auto_117163 ?auto_117169 ) ) ( not ( = ?auto_117163 ?auto_117170 ) ) ( not ( = ?auto_117163 ?auto_117171 ) ) ( not ( = ?auto_117163 ?auto_117172 ) ) ( not ( = ?auto_117163 ?auto_117173 ) ) ( not ( = ?auto_117163 ?auto_117174 ) ) ( not ( = ?auto_117164 ?auto_117165 ) ) ( not ( = ?auto_117164 ?auto_117166 ) ) ( not ( = ?auto_117164 ?auto_117167 ) ) ( not ( = ?auto_117164 ?auto_117168 ) ) ( not ( = ?auto_117164 ?auto_117169 ) ) ( not ( = ?auto_117164 ?auto_117170 ) ) ( not ( = ?auto_117164 ?auto_117171 ) ) ( not ( = ?auto_117164 ?auto_117172 ) ) ( not ( = ?auto_117164 ?auto_117173 ) ) ( not ( = ?auto_117164 ?auto_117174 ) ) ( not ( = ?auto_117165 ?auto_117166 ) ) ( not ( = ?auto_117165 ?auto_117167 ) ) ( not ( = ?auto_117165 ?auto_117168 ) ) ( not ( = ?auto_117165 ?auto_117169 ) ) ( not ( = ?auto_117165 ?auto_117170 ) ) ( not ( = ?auto_117165 ?auto_117171 ) ) ( not ( = ?auto_117165 ?auto_117172 ) ) ( not ( = ?auto_117165 ?auto_117173 ) ) ( not ( = ?auto_117165 ?auto_117174 ) ) ( not ( = ?auto_117166 ?auto_117167 ) ) ( not ( = ?auto_117166 ?auto_117168 ) ) ( not ( = ?auto_117166 ?auto_117169 ) ) ( not ( = ?auto_117166 ?auto_117170 ) ) ( not ( = ?auto_117166 ?auto_117171 ) ) ( not ( = ?auto_117166 ?auto_117172 ) ) ( not ( = ?auto_117166 ?auto_117173 ) ) ( not ( = ?auto_117166 ?auto_117174 ) ) ( not ( = ?auto_117167 ?auto_117168 ) ) ( not ( = ?auto_117167 ?auto_117169 ) ) ( not ( = ?auto_117167 ?auto_117170 ) ) ( not ( = ?auto_117167 ?auto_117171 ) ) ( not ( = ?auto_117167 ?auto_117172 ) ) ( not ( = ?auto_117167 ?auto_117173 ) ) ( not ( = ?auto_117167 ?auto_117174 ) ) ( not ( = ?auto_117168 ?auto_117169 ) ) ( not ( = ?auto_117168 ?auto_117170 ) ) ( not ( = ?auto_117168 ?auto_117171 ) ) ( not ( = ?auto_117168 ?auto_117172 ) ) ( not ( = ?auto_117168 ?auto_117173 ) ) ( not ( = ?auto_117168 ?auto_117174 ) ) ( not ( = ?auto_117169 ?auto_117170 ) ) ( not ( = ?auto_117169 ?auto_117171 ) ) ( not ( = ?auto_117169 ?auto_117172 ) ) ( not ( = ?auto_117169 ?auto_117173 ) ) ( not ( = ?auto_117169 ?auto_117174 ) ) ( not ( = ?auto_117170 ?auto_117171 ) ) ( not ( = ?auto_117170 ?auto_117172 ) ) ( not ( = ?auto_117170 ?auto_117173 ) ) ( not ( = ?auto_117170 ?auto_117174 ) ) ( not ( = ?auto_117171 ?auto_117172 ) ) ( not ( = ?auto_117171 ?auto_117173 ) ) ( not ( = ?auto_117171 ?auto_117174 ) ) ( not ( = ?auto_117172 ?auto_117173 ) ) ( not ( = ?auto_117172 ?auto_117174 ) ) ( not ( = ?auto_117173 ?auto_117174 ) ) ( ON ?auto_117172 ?auto_117173 ) ( CLEAR ?auto_117170 ) ( ON ?auto_117171 ?auto_117172 ) ( CLEAR ?auto_117171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_117163 ?auto_117164 ?auto_117165 ?auto_117166 ?auto_117167 ?auto_117168 ?auto_117169 ?auto_117170 ?auto_117171 )
      ( MAKE-11PILE ?auto_117163 ?auto_117164 ?auto_117165 ?auto_117166 ?auto_117167 ?auto_117168 ?auto_117169 ?auto_117170 ?auto_117171 ?auto_117172 ?auto_117173 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_117186 - BLOCK
      ?auto_117187 - BLOCK
      ?auto_117188 - BLOCK
      ?auto_117189 - BLOCK
      ?auto_117190 - BLOCK
      ?auto_117191 - BLOCK
      ?auto_117192 - BLOCK
      ?auto_117193 - BLOCK
      ?auto_117194 - BLOCK
      ?auto_117195 - BLOCK
      ?auto_117196 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117196 ) ( ON-TABLE ?auto_117186 ) ( ON ?auto_117187 ?auto_117186 ) ( ON ?auto_117188 ?auto_117187 ) ( ON ?auto_117189 ?auto_117188 ) ( ON ?auto_117190 ?auto_117189 ) ( ON ?auto_117191 ?auto_117190 ) ( ON ?auto_117192 ?auto_117191 ) ( ON ?auto_117193 ?auto_117192 ) ( not ( = ?auto_117186 ?auto_117187 ) ) ( not ( = ?auto_117186 ?auto_117188 ) ) ( not ( = ?auto_117186 ?auto_117189 ) ) ( not ( = ?auto_117186 ?auto_117190 ) ) ( not ( = ?auto_117186 ?auto_117191 ) ) ( not ( = ?auto_117186 ?auto_117192 ) ) ( not ( = ?auto_117186 ?auto_117193 ) ) ( not ( = ?auto_117186 ?auto_117194 ) ) ( not ( = ?auto_117186 ?auto_117195 ) ) ( not ( = ?auto_117186 ?auto_117196 ) ) ( not ( = ?auto_117187 ?auto_117188 ) ) ( not ( = ?auto_117187 ?auto_117189 ) ) ( not ( = ?auto_117187 ?auto_117190 ) ) ( not ( = ?auto_117187 ?auto_117191 ) ) ( not ( = ?auto_117187 ?auto_117192 ) ) ( not ( = ?auto_117187 ?auto_117193 ) ) ( not ( = ?auto_117187 ?auto_117194 ) ) ( not ( = ?auto_117187 ?auto_117195 ) ) ( not ( = ?auto_117187 ?auto_117196 ) ) ( not ( = ?auto_117188 ?auto_117189 ) ) ( not ( = ?auto_117188 ?auto_117190 ) ) ( not ( = ?auto_117188 ?auto_117191 ) ) ( not ( = ?auto_117188 ?auto_117192 ) ) ( not ( = ?auto_117188 ?auto_117193 ) ) ( not ( = ?auto_117188 ?auto_117194 ) ) ( not ( = ?auto_117188 ?auto_117195 ) ) ( not ( = ?auto_117188 ?auto_117196 ) ) ( not ( = ?auto_117189 ?auto_117190 ) ) ( not ( = ?auto_117189 ?auto_117191 ) ) ( not ( = ?auto_117189 ?auto_117192 ) ) ( not ( = ?auto_117189 ?auto_117193 ) ) ( not ( = ?auto_117189 ?auto_117194 ) ) ( not ( = ?auto_117189 ?auto_117195 ) ) ( not ( = ?auto_117189 ?auto_117196 ) ) ( not ( = ?auto_117190 ?auto_117191 ) ) ( not ( = ?auto_117190 ?auto_117192 ) ) ( not ( = ?auto_117190 ?auto_117193 ) ) ( not ( = ?auto_117190 ?auto_117194 ) ) ( not ( = ?auto_117190 ?auto_117195 ) ) ( not ( = ?auto_117190 ?auto_117196 ) ) ( not ( = ?auto_117191 ?auto_117192 ) ) ( not ( = ?auto_117191 ?auto_117193 ) ) ( not ( = ?auto_117191 ?auto_117194 ) ) ( not ( = ?auto_117191 ?auto_117195 ) ) ( not ( = ?auto_117191 ?auto_117196 ) ) ( not ( = ?auto_117192 ?auto_117193 ) ) ( not ( = ?auto_117192 ?auto_117194 ) ) ( not ( = ?auto_117192 ?auto_117195 ) ) ( not ( = ?auto_117192 ?auto_117196 ) ) ( not ( = ?auto_117193 ?auto_117194 ) ) ( not ( = ?auto_117193 ?auto_117195 ) ) ( not ( = ?auto_117193 ?auto_117196 ) ) ( not ( = ?auto_117194 ?auto_117195 ) ) ( not ( = ?auto_117194 ?auto_117196 ) ) ( not ( = ?auto_117195 ?auto_117196 ) ) ( ON ?auto_117195 ?auto_117196 ) ( CLEAR ?auto_117193 ) ( ON ?auto_117194 ?auto_117195 ) ( CLEAR ?auto_117194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_117186 ?auto_117187 ?auto_117188 ?auto_117189 ?auto_117190 ?auto_117191 ?auto_117192 ?auto_117193 ?auto_117194 )
      ( MAKE-11PILE ?auto_117186 ?auto_117187 ?auto_117188 ?auto_117189 ?auto_117190 ?auto_117191 ?auto_117192 ?auto_117193 ?auto_117194 ?auto_117195 ?auto_117196 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_117208 - BLOCK
      ?auto_117209 - BLOCK
      ?auto_117210 - BLOCK
      ?auto_117211 - BLOCK
      ?auto_117212 - BLOCK
      ?auto_117213 - BLOCK
      ?auto_117214 - BLOCK
      ?auto_117215 - BLOCK
      ?auto_117216 - BLOCK
      ?auto_117217 - BLOCK
      ?auto_117218 - BLOCK
    )
    :vars
    (
      ?auto_117219 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117218 ?auto_117219 ) ( ON-TABLE ?auto_117208 ) ( ON ?auto_117209 ?auto_117208 ) ( ON ?auto_117210 ?auto_117209 ) ( ON ?auto_117211 ?auto_117210 ) ( ON ?auto_117212 ?auto_117211 ) ( ON ?auto_117213 ?auto_117212 ) ( ON ?auto_117214 ?auto_117213 ) ( not ( = ?auto_117208 ?auto_117209 ) ) ( not ( = ?auto_117208 ?auto_117210 ) ) ( not ( = ?auto_117208 ?auto_117211 ) ) ( not ( = ?auto_117208 ?auto_117212 ) ) ( not ( = ?auto_117208 ?auto_117213 ) ) ( not ( = ?auto_117208 ?auto_117214 ) ) ( not ( = ?auto_117208 ?auto_117215 ) ) ( not ( = ?auto_117208 ?auto_117216 ) ) ( not ( = ?auto_117208 ?auto_117217 ) ) ( not ( = ?auto_117208 ?auto_117218 ) ) ( not ( = ?auto_117208 ?auto_117219 ) ) ( not ( = ?auto_117209 ?auto_117210 ) ) ( not ( = ?auto_117209 ?auto_117211 ) ) ( not ( = ?auto_117209 ?auto_117212 ) ) ( not ( = ?auto_117209 ?auto_117213 ) ) ( not ( = ?auto_117209 ?auto_117214 ) ) ( not ( = ?auto_117209 ?auto_117215 ) ) ( not ( = ?auto_117209 ?auto_117216 ) ) ( not ( = ?auto_117209 ?auto_117217 ) ) ( not ( = ?auto_117209 ?auto_117218 ) ) ( not ( = ?auto_117209 ?auto_117219 ) ) ( not ( = ?auto_117210 ?auto_117211 ) ) ( not ( = ?auto_117210 ?auto_117212 ) ) ( not ( = ?auto_117210 ?auto_117213 ) ) ( not ( = ?auto_117210 ?auto_117214 ) ) ( not ( = ?auto_117210 ?auto_117215 ) ) ( not ( = ?auto_117210 ?auto_117216 ) ) ( not ( = ?auto_117210 ?auto_117217 ) ) ( not ( = ?auto_117210 ?auto_117218 ) ) ( not ( = ?auto_117210 ?auto_117219 ) ) ( not ( = ?auto_117211 ?auto_117212 ) ) ( not ( = ?auto_117211 ?auto_117213 ) ) ( not ( = ?auto_117211 ?auto_117214 ) ) ( not ( = ?auto_117211 ?auto_117215 ) ) ( not ( = ?auto_117211 ?auto_117216 ) ) ( not ( = ?auto_117211 ?auto_117217 ) ) ( not ( = ?auto_117211 ?auto_117218 ) ) ( not ( = ?auto_117211 ?auto_117219 ) ) ( not ( = ?auto_117212 ?auto_117213 ) ) ( not ( = ?auto_117212 ?auto_117214 ) ) ( not ( = ?auto_117212 ?auto_117215 ) ) ( not ( = ?auto_117212 ?auto_117216 ) ) ( not ( = ?auto_117212 ?auto_117217 ) ) ( not ( = ?auto_117212 ?auto_117218 ) ) ( not ( = ?auto_117212 ?auto_117219 ) ) ( not ( = ?auto_117213 ?auto_117214 ) ) ( not ( = ?auto_117213 ?auto_117215 ) ) ( not ( = ?auto_117213 ?auto_117216 ) ) ( not ( = ?auto_117213 ?auto_117217 ) ) ( not ( = ?auto_117213 ?auto_117218 ) ) ( not ( = ?auto_117213 ?auto_117219 ) ) ( not ( = ?auto_117214 ?auto_117215 ) ) ( not ( = ?auto_117214 ?auto_117216 ) ) ( not ( = ?auto_117214 ?auto_117217 ) ) ( not ( = ?auto_117214 ?auto_117218 ) ) ( not ( = ?auto_117214 ?auto_117219 ) ) ( not ( = ?auto_117215 ?auto_117216 ) ) ( not ( = ?auto_117215 ?auto_117217 ) ) ( not ( = ?auto_117215 ?auto_117218 ) ) ( not ( = ?auto_117215 ?auto_117219 ) ) ( not ( = ?auto_117216 ?auto_117217 ) ) ( not ( = ?auto_117216 ?auto_117218 ) ) ( not ( = ?auto_117216 ?auto_117219 ) ) ( not ( = ?auto_117217 ?auto_117218 ) ) ( not ( = ?auto_117217 ?auto_117219 ) ) ( not ( = ?auto_117218 ?auto_117219 ) ) ( ON ?auto_117217 ?auto_117218 ) ( ON ?auto_117216 ?auto_117217 ) ( CLEAR ?auto_117214 ) ( ON ?auto_117215 ?auto_117216 ) ( CLEAR ?auto_117215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_117208 ?auto_117209 ?auto_117210 ?auto_117211 ?auto_117212 ?auto_117213 ?auto_117214 ?auto_117215 )
      ( MAKE-11PILE ?auto_117208 ?auto_117209 ?auto_117210 ?auto_117211 ?auto_117212 ?auto_117213 ?auto_117214 ?auto_117215 ?auto_117216 ?auto_117217 ?auto_117218 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_117231 - BLOCK
      ?auto_117232 - BLOCK
      ?auto_117233 - BLOCK
      ?auto_117234 - BLOCK
      ?auto_117235 - BLOCK
      ?auto_117236 - BLOCK
      ?auto_117237 - BLOCK
      ?auto_117238 - BLOCK
      ?auto_117239 - BLOCK
      ?auto_117240 - BLOCK
      ?auto_117241 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117241 ) ( ON-TABLE ?auto_117231 ) ( ON ?auto_117232 ?auto_117231 ) ( ON ?auto_117233 ?auto_117232 ) ( ON ?auto_117234 ?auto_117233 ) ( ON ?auto_117235 ?auto_117234 ) ( ON ?auto_117236 ?auto_117235 ) ( ON ?auto_117237 ?auto_117236 ) ( not ( = ?auto_117231 ?auto_117232 ) ) ( not ( = ?auto_117231 ?auto_117233 ) ) ( not ( = ?auto_117231 ?auto_117234 ) ) ( not ( = ?auto_117231 ?auto_117235 ) ) ( not ( = ?auto_117231 ?auto_117236 ) ) ( not ( = ?auto_117231 ?auto_117237 ) ) ( not ( = ?auto_117231 ?auto_117238 ) ) ( not ( = ?auto_117231 ?auto_117239 ) ) ( not ( = ?auto_117231 ?auto_117240 ) ) ( not ( = ?auto_117231 ?auto_117241 ) ) ( not ( = ?auto_117232 ?auto_117233 ) ) ( not ( = ?auto_117232 ?auto_117234 ) ) ( not ( = ?auto_117232 ?auto_117235 ) ) ( not ( = ?auto_117232 ?auto_117236 ) ) ( not ( = ?auto_117232 ?auto_117237 ) ) ( not ( = ?auto_117232 ?auto_117238 ) ) ( not ( = ?auto_117232 ?auto_117239 ) ) ( not ( = ?auto_117232 ?auto_117240 ) ) ( not ( = ?auto_117232 ?auto_117241 ) ) ( not ( = ?auto_117233 ?auto_117234 ) ) ( not ( = ?auto_117233 ?auto_117235 ) ) ( not ( = ?auto_117233 ?auto_117236 ) ) ( not ( = ?auto_117233 ?auto_117237 ) ) ( not ( = ?auto_117233 ?auto_117238 ) ) ( not ( = ?auto_117233 ?auto_117239 ) ) ( not ( = ?auto_117233 ?auto_117240 ) ) ( not ( = ?auto_117233 ?auto_117241 ) ) ( not ( = ?auto_117234 ?auto_117235 ) ) ( not ( = ?auto_117234 ?auto_117236 ) ) ( not ( = ?auto_117234 ?auto_117237 ) ) ( not ( = ?auto_117234 ?auto_117238 ) ) ( not ( = ?auto_117234 ?auto_117239 ) ) ( not ( = ?auto_117234 ?auto_117240 ) ) ( not ( = ?auto_117234 ?auto_117241 ) ) ( not ( = ?auto_117235 ?auto_117236 ) ) ( not ( = ?auto_117235 ?auto_117237 ) ) ( not ( = ?auto_117235 ?auto_117238 ) ) ( not ( = ?auto_117235 ?auto_117239 ) ) ( not ( = ?auto_117235 ?auto_117240 ) ) ( not ( = ?auto_117235 ?auto_117241 ) ) ( not ( = ?auto_117236 ?auto_117237 ) ) ( not ( = ?auto_117236 ?auto_117238 ) ) ( not ( = ?auto_117236 ?auto_117239 ) ) ( not ( = ?auto_117236 ?auto_117240 ) ) ( not ( = ?auto_117236 ?auto_117241 ) ) ( not ( = ?auto_117237 ?auto_117238 ) ) ( not ( = ?auto_117237 ?auto_117239 ) ) ( not ( = ?auto_117237 ?auto_117240 ) ) ( not ( = ?auto_117237 ?auto_117241 ) ) ( not ( = ?auto_117238 ?auto_117239 ) ) ( not ( = ?auto_117238 ?auto_117240 ) ) ( not ( = ?auto_117238 ?auto_117241 ) ) ( not ( = ?auto_117239 ?auto_117240 ) ) ( not ( = ?auto_117239 ?auto_117241 ) ) ( not ( = ?auto_117240 ?auto_117241 ) ) ( ON ?auto_117240 ?auto_117241 ) ( ON ?auto_117239 ?auto_117240 ) ( CLEAR ?auto_117237 ) ( ON ?auto_117238 ?auto_117239 ) ( CLEAR ?auto_117238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_117231 ?auto_117232 ?auto_117233 ?auto_117234 ?auto_117235 ?auto_117236 ?auto_117237 ?auto_117238 )
      ( MAKE-11PILE ?auto_117231 ?auto_117232 ?auto_117233 ?auto_117234 ?auto_117235 ?auto_117236 ?auto_117237 ?auto_117238 ?auto_117239 ?auto_117240 ?auto_117241 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_117253 - BLOCK
      ?auto_117254 - BLOCK
      ?auto_117255 - BLOCK
      ?auto_117256 - BLOCK
      ?auto_117257 - BLOCK
      ?auto_117258 - BLOCK
      ?auto_117259 - BLOCK
      ?auto_117260 - BLOCK
      ?auto_117261 - BLOCK
      ?auto_117262 - BLOCK
      ?auto_117263 - BLOCK
    )
    :vars
    (
      ?auto_117264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117263 ?auto_117264 ) ( ON-TABLE ?auto_117253 ) ( ON ?auto_117254 ?auto_117253 ) ( ON ?auto_117255 ?auto_117254 ) ( ON ?auto_117256 ?auto_117255 ) ( ON ?auto_117257 ?auto_117256 ) ( ON ?auto_117258 ?auto_117257 ) ( not ( = ?auto_117253 ?auto_117254 ) ) ( not ( = ?auto_117253 ?auto_117255 ) ) ( not ( = ?auto_117253 ?auto_117256 ) ) ( not ( = ?auto_117253 ?auto_117257 ) ) ( not ( = ?auto_117253 ?auto_117258 ) ) ( not ( = ?auto_117253 ?auto_117259 ) ) ( not ( = ?auto_117253 ?auto_117260 ) ) ( not ( = ?auto_117253 ?auto_117261 ) ) ( not ( = ?auto_117253 ?auto_117262 ) ) ( not ( = ?auto_117253 ?auto_117263 ) ) ( not ( = ?auto_117253 ?auto_117264 ) ) ( not ( = ?auto_117254 ?auto_117255 ) ) ( not ( = ?auto_117254 ?auto_117256 ) ) ( not ( = ?auto_117254 ?auto_117257 ) ) ( not ( = ?auto_117254 ?auto_117258 ) ) ( not ( = ?auto_117254 ?auto_117259 ) ) ( not ( = ?auto_117254 ?auto_117260 ) ) ( not ( = ?auto_117254 ?auto_117261 ) ) ( not ( = ?auto_117254 ?auto_117262 ) ) ( not ( = ?auto_117254 ?auto_117263 ) ) ( not ( = ?auto_117254 ?auto_117264 ) ) ( not ( = ?auto_117255 ?auto_117256 ) ) ( not ( = ?auto_117255 ?auto_117257 ) ) ( not ( = ?auto_117255 ?auto_117258 ) ) ( not ( = ?auto_117255 ?auto_117259 ) ) ( not ( = ?auto_117255 ?auto_117260 ) ) ( not ( = ?auto_117255 ?auto_117261 ) ) ( not ( = ?auto_117255 ?auto_117262 ) ) ( not ( = ?auto_117255 ?auto_117263 ) ) ( not ( = ?auto_117255 ?auto_117264 ) ) ( not ( = ?auto_117256 ?auto_117257 ) ) ( not ( = ?auto_117256 ?auto_117258 ) ) ( not ( = ?auto_117256 ?auto_117259 ) ) ( not ( = ?auto_117256 ?auto_117260 ) ) ( not ( = ?auto_117256 ?auto_117261 ) ) ( not ( = ?auto_117256 ?auto_117262 ) ) ( not ( = ?auto_117256 ?auto_117263 ) ) ( not ( = ?auto_117256 ?auto_117264 ) ) ( not ( = ?auto_117257 ?auto_117258 ) ) ( not ( = ?auto_117257 ?auto_117259 ) ) ( not ( = ?auto_117257 ?auto_117260 ) ) ( not ( = ?auto_117257 ?auto_117261 ) ) ( not ( = ?auto_117257 ?auto_117262 ) ) ( not ( = ?auto_117257 ?auto_117263 ) ) ( not ( = ?auto_117257 ?auto_117264 ) ) ( not ( = ?auto_117258 ?auto_117259 ) ) ( not ( = ?auto_117258 ?auto_117260 ) ) ( not ( = ?auto_117258 ?auto_117261 ) ) ( not ( = ?auto_117258 ?auto_117262 ) ) ( not ( = ?auto_117258 ?auto_117263 ) ) ( not ( = ?auto_117258 ?auto_117264 ) ) ( not ( = ?auto_117259 ?auto_117260 ) ) ( not ( = ?auto_117259 ?auto_117261 ) ) ( not ( = ?auto_117259 ?auto_117262 ) ) ( not ( = ?auto_117259 ?auto_117263 ) ) ( not ( = ?auto_117259 ?auto_117264 ) ) ( not ( = ?auto_117260 ?auto_117261 ) ) ( not ( = ?auto_117260 ?auto_117262 ) ) ( not ( = ?auto_117260 ?auto_117263 ) ) ( not ( = ?auto_117260 ?auto_117264 ) ) ( not ( = ?auto_117261 ?auto_117262 ) ) ( not ( = ?auto_117261 ?auto_117263 ) ) ( not ( = ?auto_117261 ?auto_117264 ) ) ( not ( = ?auto_117262 ?auto_117263 ) ) ( not ( = ?auto_117262 ?auto_117264 ) ) ( not ( = ?auto_117263 ?auto_117264 ) ) ( ON ?auto_117262 ?auto_117263 ) ( ON ?auto_117261 ?auto_117262 ) ( ON ?auto_117260 ?auto_117261 ) ( CLEAR ?auto_117258 ) ( ON ?auto_117259 ?auto_117260 ) ( CLEAR ?auto_117259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_117253 ?auto_117254 ?auto_117255 ?auto_117256 ?auto_117257 ?auto_117258 ?auto_117259 )
      ( MAKE-11PILE ?auto_117253 ?auto_117254 ?auto_117255 ?auto_117256 ?auto_117257 ?auto_117258 ?auto_117259 ?auto_117260 ?auto_117261 ?auto_117262 ?auto_117263 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_117276 - BLOCK
      ?auto_117277 - BLOCK
      ?auto_117278 - BLOCK
      ?auto_117279 - BLOCK
      ?auto_117280 - BLOCK
      ?auto_117281 - BLOCK
      ?auto_117282 - BLOCK
      ?auto_117283 - BLOCK
      ?auto_117284 - BLOCK
      ?auto_117285 - BLOCK
      ?auto_117286 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117286 ) ( ON-TABLE ?auto_117276 ) ( ON ?auto_117277 ?auto_117276 ) ( ON ?auto_117278 ?auto_117277 ) ( ON ?auto_117279 ?auto_117278 ) ( ON ?auto_117280 ?auto_117279 ) ( ON ?auto_117281 ?auto_117280 ) ( not ( = ?auto_117276 ?auto_117277 ) ) ( not ( = ?auto_117276 ?auto_117278 ) ) ( not ( = ?auto_117276 ?auto_117279 ) ) ( not ( = ?auto_117276 ?auto_117280 ) ) ( not ( = ?auto_117276 ?auto_117281 ) ) ( not ( = ?auto_117276 ?auto_117282 ) ) ( not ( = ?auto_117276 ?auto_117283 ) ) ( not ( = ?auto_117276 ?auto_117284 ) ) ( not ( = ?auto_117276 ?auto_117285 ) ) ( not ( = ?auto_117276 ?auto_117286 ) ) ( not ( = ?auto_117277 ?auto_117278 ) ) ( not ( = ?auto_117277 ?auto_117279 ) ) ( not ( = ?auto_117277 ?auto_117280 ) ) ( not ( = ?auto_117277 ?auto_117281 ) ) ( not ( = ?auto_117277 ?auto_117282 ) ) ( not ( = ?auto_117277 ?auto_117283 ) ) ( not ( = ?auto_117277 ?auto_117284 ) ) ( not ( = ?auto_117277 ?auto_117285 ) ) ( not ( = ?auto_117277 ?auto_117286 ) ) ( not ( = ?auto_117278 ?auto_117279 ) ) ( not ( = ?auto_117278 ?auto_117280 ) ) ( not ( = ?auto_117278 ?auto_117281 ) ) ( not ( = ?auto_117278 ?auto_117282 ) ) ( not ( = ?auto_117278 ?auto_117283 ) ) ( not ( = ?auto_117278 ?auto_117284 ) ) ( not ( = ?auto_117278 ?auto_117285 ) ) ( not ( = ?auto_117278 ?auto_117286 ) ) ( not ( = ?auto_117279 ?auto_117280 ) ) ( not ( = ?auto_117279 ?auto_117281 ) ) ( not ( = ?auto_117279 ?auto_117282 ) ) ( not ( = ?auto_117279 ?auto_117283 ) ) ( not ( = ?auto_117279 ?auto_117284 ) ) ( not ( = ?auto_117279 ?auto_117285 ) ) ( not ( = ?auto_117279 ?auto_117286 ) ) ( not ( = ?auto_117280 ?auto_117281 ) ) ( not ( = ?auto_117280 ?auto_117282 ) ) ( not ( = ?auto_117280 ?auto_117283 ) ) ( not ( = ?auto_117280 ?auto_117284 ) ) ( not ( = ?auto_117280 ?auto_117285 ) ) ( not ( = ?auto_117280 ?auto_117286 ) ) ( not ( = ?auto_117281 ?auto_117282 ) ) ( not ( = ?auto_117281 ?auto_117283 ) ) ( not ( = ?auto_117281 ?auto_117284 ) ) ( not ( = ?auto_117281 ?auto_117285 ) ) ( not ( = ?auto_117281 ?auto_117286 ) ) ( not ( = ?auto_117282 ?auto_117283 ) ) ( not ( = ?auto_117282 ?auto_117284 ) ) ( not ( = ?auto_117282 ?auto_117285 ) ) ( not ( = ?auto_117282 ?auto_117286 ) ) ( not ( = ?auto_117283 ?auto_117284 ) ) ( not ( = ?auto_117283 ?auto_117285 ) ) ( not ( = ?auto_117283 ?auto_117286 ) ) ( not ( = ?auto_117284 ?auto_117285 ) ) ( not ( = ?auto_117284 ?auto_117286 ) ) ( not ( = ?auto_117285 ?auto_117286 ) ) ( ON ?auto_117285 ?auto_117286 ) ( ON ?auto_117284 ?auto_117285 ) ( ON ?auto_117283 ?auto_117284 ) ( CLEAR ?auto_117281 ) ( ON ?auto_117282 ?auto_117283 ) ( CLEAR ?auto_117282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_117276 ?auto_117277 ?auto_117278 ?auto_117279 ?auto_117280 ?auto_117281 ?auto_117282 )
      ( MAKE-11PILE ?auto_117276 ?auto_117277 ?auto_117278 ?auto_117279 ?auto_117280 ?auto_117281 ?auto_117282 ?auto_117283 ?auto_117284 ?auto_117285 ?auto_117286 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_117298 - BLOCK
      ?auto_117299 - BLOCK
      ?auto_117300 - BLOCK
      ?auto_117301 - BLOCK
      ?auto_117302 - BLOCK
      ?auto_117303 - BLOCK
      ?auto_117304 - BLOCK
      ?auto_117305 - BLOCK
      ?auto_117306 - BLOCK
      ?auto_117307 - BLOCK
      ?auto_117308 - BLOCK
    )
    :vars
    (
      ?auto_117309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117308 ?auto_117309 ) ( ON-TABLE ?auto_117298 ) ( ON ?auto_117299 ?auto_117298 ) ( ON ?auto_117300 ?auto_117299 ) ( ON ?auto_117301 ?auto_117300 ) ( ON ?auto_117302 ?auto_117301 ) ( not ( = ?auto_117298 ?auto_117299 ) ) ( not ( = ?auto_117298 ?auto_117300 ) ) ( not ( = ?auto_117298 ?auto_117301 ) ) ( not ( = ?auto_117298 ?auto_117302 ) ) ( not ( = ?auto_117298 ?auto_117303 ) ) ( not ( = ?auto_117298 ?auto_117304 ) ) ( not ( = ?auto_117298 ?auto_117305 ) ) ( not ( = ?auto_117298 ?auto_117306 ) ) ( not ( = ?auto_117298 ?auto_117307 ) ) ( not ( = ?auto_117298 ?auto_117308 ) ) ( not ( = ?auto_117298 ?auto_117309 ) ) ( not ( = ?auto_117299 ?auto_117300 ) ) ( not ( = ?auto_117299 ?auto_117301 ) ) ( not ( = ?auto_117299 ?auto_117302 ) ) ( not ( = ?auto_117299 ?auto_117303 ) ) ( not ( = ?auto_117299 ?auto_117304 ) ) ( not ( = ?auto_117299 ?auto_117305 ) ) ( not ( = ?auto_117299 ?auto_117306 ) ) ( not ( = ?auto_117299 ?auto_117307 ) ) ( not ( = ?auto_117299 ?auto_117308 ) ) ( not ( = ?auto_117299 ?auto_117309 ) ) ( not ( = ?auto_117300 ?auto_117301 ) ) ( not ( = ?auto_117300 ?auto_117302 ) ) ( not ( = ?auto_117300 ?auto_117303 ) ) ( not ( = ?auto_117300 ?auto_117304 ) ) ( not ( = ?auto_117300 ?auto_117305 ) ) ( not ( = ?auto_117300 ?auto_117306 ) ) ( not ( = ?auto_117300 ?auto_117307 ) ) ( not ( = ?auto_117300 ?auto_117308 ) ) ( not ( = ?auto_117300 ?auto_117309 ) ) ( not ( = ?auto_117301 ?auto_117302 ) ) ( not ( = ?auto_117301 ?auto_117303 ) ) ( not ( = ?auto_117301 ?auto_117304 ) ) ( not ( = ?auto_117301 ?auto_117305 ) ) ( not ( = ?auto_117301 ?auto_117306 ) ) ( not ( = ?auto_117301 ?auto_117307 ) ) ( not ( = ?auto_117301 ?auto_117308 ) ) ( not ( = ?auto_117301 ?auto_117309 ) ) ( not ( = ?auto_117302 ?auto_117303 ) ) ( not ( = ?auto_117302 ?auto_117304 ) ) ( not ( = ?auto_117302 ?auto_117305 ) ) ( not ( = ?auto_117302 ?auto_117306 ) ) ( not ( = ?auto_117302 ?auto_117307 ) ) ( not ( = ?auto_117302 ?auto_117308 ) ) ( not ( = ?auto_117302 ?auto_117309 ) ) ( not ( = ?auto_117303 ?auto_117304 ) ) ( not ( = ?auto_117303 ?auto_117305 ) ) ( not ( = ?auto_117303 ?auto_117306 ) ) ( not ( = ?auto_117303 ?auto_117307 ) ) ( not ( = ?auto_117303 ?auto_117308 ) ) ( not ( = ?auto_117303 ?auto_117309 ) ) ( not ( = ?auto_117304 ?auto_117305 ) ) ( not ( = ?auto_117304 ?auto_117306 ) ) ( not ( = ?auto_117304 ?auto_117307 ) ) ( not ( = ?auto_117304 ?auto_117308 ) ) ( not ( = ?auto_117304 ?auto_117309 ) ) ( not ( = ?auto_117305 ?auto_117306 ) ) ( not ( = ?auto_117305 ?auto_117307 ) ) ( not ( = ?auto_117305 ?auto_117308 ) ) ( not ( = ?auto_117305 ?auto_117309 ) ) ( not ( = ?auto_117306 ?auto_117307 ) ) ( not ( = ?auto_117306 ?auto_117308 ) ) ( not ( = ?auto_117306 ?auto_117309 ) ) ( not ( = ?auto_117307 ?auto_117308 ) ) ( not ( = ?auto_117307 ?auto_117309 ) ) ( not ( = ?auto_117308 ?auto_117309 ) ) ( ON ?auto_117307 ?auto_117308 ) ( ON ?auto_117306 ?auto_117307 ) ( ON ?auto_117305 ?auto_117306 ) ( ON ?auto_117304 ?auto_117305 ) ( CLEAR ?auto_117302 ) ( ON ?auto_117303 ?auto_117304 ) ( CLEAR ?auto_117303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_117298 ?auto_117299 ?auto_117300 ?auto_117301 ?auto_117302 ?auto_117303 )
      ( MAKE-11PILE ?auto_117298 ?auto_117299 ?auto_117300 ?auto_117301 ?auto_117302 ?auto_117303 ?auto_117304 ?auto_117305 ?auto_117306 ?auto_117307 ?auto_117308 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_117321 - BLOCK
      ?auto_117322 - BLOCK
      ?auto_117323 - BLOCK
      ?auto_117324 - BLOCK
      ?auto_117325 - BLOCK
      ?auto_117326 - BLOCK
      ?auto_117327 - BLOCK
      ?auto_117328 - BLOCK
      ?auto_117329 - BLOCK
      ?auto_117330 - BLOCK
      ?auto_117331 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117331 ) ( ON-TABLE ?auto_117321 ) ( ON ?auto_117322 ?auto_117321 ) ( ON ?auto_117323 ?auto_117322 ) ( ON ?auto_117324 ?auto_117323 ) ( ON ?auto_117325 ?auto_117324 ) ( not ( = ?auto_117321 ?auto_117322 ) ) ( not ( = ?auto_117321 ?auto_117323 ) ) ( not ( = ?auto_117321 ?auto_117324 ) ) ( not ( = ?auto_117321 ?auto_117325 ) ) ( not ( = ?auto_117321 ?auto_117326 ) ) ( not ( = ?auto_117321 ?auto_117327 ) ) ( not ( = ?auto_117321 ?auto_117328 ) ) ( not ( = ?auto_117321 ?auto_117329 ) ) ( not ( = ?auto_117321 ?auto_117330 ) ) ( not ( = ?auto_117321 ?auto_117331 ) ) ( not ( = ?auto_117322 ?auto_117323 ) ) ( not ( = ?auto_117322 ?auto_117324 ) ) ( not ( = ?auto_117322 ?auto_117325 ) ) ( not ( = ?auto_117322 ?auto_117326 ) ) ( not ( = ?auto_117322 ?auto_117327 ) ) ( not ( = ?auto_117322 ?auto_117328 ) ) ( not ( = ?auto_117322 ?auto_117329 ) ) ( not ( = ?auto_117322 ?auto_117330 ) ) ( not ( = ?auto_117322 ?auto_117331 ) ) ( not ( = ?auto_117323 ?auto_117324 ) ) ( not ( = ?auto_117323 ?auto_117325 ) ) ( not ( = ?auto_117323 ?auto_117326 ) ) ( not ( = ?auto_117323 ?auto_117327 ) ) ( not ( = ?auto_117323 ?auto_117328 ) ) ( not ( = ?auto_117323 ?auto_117329 ) ) ( not ( = ?auto_117323 ?auto_117330 ) ) ( not ( = ?auto_117323 ?auto_117331 ) ) ( not ( = ?auto_117324 ?auto_117325 ) ) ( not ( = ?auto_117324 ?auto_117326 ) ) ( not ( = ?auto_117324 ?auto_117327 ) ) ( not ( = ?auto_117324 ?auto_117328 ) ) ( not ( = ?auto_117324 ?auto_117329 ) ) ( not ( = ?auto_117324 ?auto_117330 ) ) ( not ( = ?auto_117324 ?auto_117331 ) ) ( not ( = ?auto_117325 ?auto_117326 ) ) ( not ( = ?auto_117325 ?auto_117327 ) ) ( not ( = ?auto_117325 ?auto_117328 ) ) ( not ( = ?auto_117325 ?auto_117329 ) ) ( not ( = ?auto_117325 ?auto_117330 ) ) ( not ( = ?auto_117325 ?auto_117331 ) ) ( not ( = ?auto_117326 ?auto_117327 ) ) ( not ( = ?auto_117326 ?auto_117328 ) ) ( not ( = ?auto_117326 ?auto_117329 ) ) ( not ( = ?auto_117326 ?auto_117330 ) ) ( not ( = ?auto_117326 ?auto_117331 ) ) ( not ( = ?auto_117327 ?auto_117328 ) ) ( not ( = ?auto_117327 ?auto_117329 ) ) ( not ( = ?auto_117327 ?auto_117330 ) ) ( not ( = ?auto_117327 ?auto_117331 ) ) ( not ( = ?auto_117328 ?auto_117329 ) ) ( not ( = ?auto_117328 ?auto_117330 ) ) ( not ( = ?auto_117328 ?auto_117331 ) ) ( not ( = ?auto_117329 ?auto_117330 ) ) ( not ( = ?auto_117329 ?auto_117331 ) ) ( not ( = ?auto_117330 ?auto_117331 ) ) ( ON ?auto_117330 ?auto_117331 ) ( ON ?auto_117329 ?auto_117330 ) ( ON ?auto_117328 ?auto_117329 ) ( ON ?auto_117327 ?auto_117328 ) ( CLEAR ?auto_117325 ) ( ON ?auto_117326 ?auto_117327 ) ( CLEAR ?auto_117326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_117321 ?auto_117322 ?auto_117323 ?auto_117324 ?auto_117325 ?auto_117326 )
      ( MAKE-11PILE ?auto_117321 ?auto_117322 ?auto_117323 ?auto_117324 ?auto_117325 ?auto_117326 ?auto_117327 ?auto_117328 ?auto_117329 ?auto_117330 ?auto_117331 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_117343 - BLOCK
      ?auto_117344 - BLOCK
      ?auto_117345 - BLOCK
      ?auto_117346 - BLOCK
      ?auto_117347 - BLOCK
      ?auto_117348 - BLOCK
      ?auto_117349 - BLOCK
      ?auto_117350 - BLOCK
      ?auto_117351 - BLOCK
      ?auto_117352 - BLOCK
      ?auto_117353 - BLOCK
    )
    :vars
    (
      ?auto_117354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117353 ?auto_117354 ) ( ON-TABLE ?auto_117343 ) ( ON ?auto_117344 ?auto_117343 ) ( ON ?auto_117345 ?auto_117344 ) ( ON ?auto_117346 ?auto_117345 ) ( not ( = ?auto_117343 ?auto_117344 ) ) ( not ( = ?auto_117343 ?auto_117345 ) ) ( not ( = ?auto_117343 ?auto_117346 ) ) ( not ( = ?auto_117343 ?auto_117347 ) ) ( not ( = ?auto_117343 ?auto_117348 ) ) ( not ( = ?auto_117343 ?auto_117349 ) ) ( not ( = ?auto_117343 ?auto_117350 ) ) ( not ( = ?auto_117343 ?auto_117351 ) ) ( not ( = ?auto_117343 ?auto_117352 ) ) ( not ( = ?auto_117343 ?auto_117353 ) ) ( not ( = ?auto_117343 ?auto_117354 ) ) ( not ( = ?auto_117344 ?auto_117345 ) ) ( not ( = ?auto_117344 ?auto_117346 ) ) ( not ( = ?auto_117344 ?auto_117347 ) ) ( not ( = ?auto_117344 ?auto_117348 ) ) ( not ( = ?auto_117344 ?auto_117349 ) ) ( not ( = ?auto_117344 ?auto_117350 ) ) ( not ( = ?auto_117344 ?auto_117351 ) ) ( not ( = ?auto_117344 ?auto_117352 ) ) ( not ( = ?auto_117344 ?auto_117353 ) ) ( not ( = ?auto_117344 ?auto_117354 ) ) ( not ( = ?auto_117345 ?auto_117346 ) ) ( not ( = ?auto_117345 ?auto_117347 ) ) ( not ( = ?auto_117345 ?auto_117348 ) ) ( not ( = ?auto_117345 ?auto_117349 ) ) ( not ( = ?auto_117345 ?auto_117350 ) ) ( not ( = ?auto_117345 ?auto_117351 ) ) ( not ( = ?auto_117345 ?auto_117352 ) ) ( not ( = ?auto_117345 ?auto_117353 ) ) ( not ( = ?auto_117345 ?auto_117354 ) ) ( not ( = ?auto_117346 ?auto_117347 ) ) ( not ( = ?auto_117346 ?auto_117348 ) ) ( not ( = ?auto_117346 ?auto_117349 ) ) ( not ( = ?auto_117346 ?auto_117350 ) ) ( not ( = ?auto_117346 ?auto_117351 ) ) ( not ( = ?auto_117346 ?auto_117352 ) ) ( not ( = ?auto_117346 ?auto_117353 ) ) ( not ( = ?auto_117346 ?auto_117354 ) ) ( not ( = ?auto_117347 ?auto_117348 ) ) ( not ( = ?auto_117347 ?auto_117349 ) ) ( not ( = ?auto_117347 ?auto_117350 ) ) ( not ( = ?auto_117347 ?auto_117351 ) ) ( not ( = ?auto_117347 ?auto_117352 ) ) ( not ( = ?auto_117347 ?auto_117353 ) ) ( not ( = ?auto_117347 ?auto_117354 ) ) ( not ( = ?auto_117348 ?auto_117349 ) ) ( not ( = ?auto_117348 ?auto_117350 ) ) ( not ( = ?auto_117348 ?auto_117351 ) ) ( not ( = ?auto_117348 ?auto_117352 ) ) ( not ( = ?auto_117348 ?auto_117353 ) ) ( not ( = ?auto_117348 ?auto_117354 ) ) ( not ( = ?auto_117349 ?auto_117350 ) ) ( not ( = ?auto_117349 ?auto_117351 ) ) ( not ( = ?auto_117349 ?auto_117352 ) ) ( not ( = ?auto_117349 ?auto_117353 ) ) ( not ( = ?auto_117349 ?auto_117354 ) ) ( not ( = ?auto_117350 ?auto_117351 ) ) ( not ( = ?auto_117350 ?auto_117352 ) ) ( not ( = ?auto_117350 ?auto_117353 ) ) ( not ( = ?auto_117350 ?auto_117354 ) ) ( not ( = ?auto_117351 ?auto_117352 ) ) ( not ( = ?auto_117351 ?auto_117353 ) ) ( not ( = ?auto_117351 ?auto_117354 ) ) ( not ( = ?auto_117352 ?auto_117353 ) ) ( not ( = ?auto_117352 ?auto_117354 ) ) ( not ( = ?auto_117353 ?auto_117354 ) ) ( ON ?auto_117352 ?auto_117353 ) ( ON ?auto_117351 ?auto_117352 ) ( ON ?auto_117350 ?auto_117351 ) ( ON ?auto_117349 ?auto_117350 ) ( ON ?auto_117348 ?auto_117349 ) ( CLEAR ?auto_117346 ) ( ON ?auto_117347 ?auto_117348 ) ( CLEAR ?auto_117347 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_117343 ?auto_117344 ?auto_117345 ?auto_117346 ?auto_117347 )
      ( MAKE-11PILE ?auto_117343 ?auto_117344 ?auto_117345 ?auto_117346 ?auto_117347 ?auto_117348 ?auto_117349 ?auto_117350 ?auto_117351 ?auto_117352 ?auto_117353 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_117366 - BLOCK
      ?auto_117367 - BLOCK
      ?auto_117368 - BLOCK
      ?auto_117369 - BLOCK
      ?auto_117370 - BLOCK
      ?auto_117371 - BLOCK
      ?auto_117372 - BLOCK
      ?auto_117373 - BLOCK
      ?auto_117374 - BLOCK
      ?auto_117375 - BLOCK
      ?auto_117376 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117376 ) ( ON-TABLE ?auto_117366 ) ( ON ?auto_117367 ?auto_117366 ) ( ON ?auto_117368 ?auto_117367 ) ( ON ?auto_117369 ?auto_117368 ) ( not ( = ?auto_117366 ?auto_117367 ) ) ( not ( = ?auto_117366 ?auto_117368 ) ) ( not ( = ?auto_117366 ?auto_117369 ) ) ( not ( = ?auto_117366 ?auto_117370 ) ) ( not ( = ?auto_117366 ?auto_117371 ) ) ( not ( = ?auto_117366 ?auto_117372 ) ) ( not ( = ?auto_117366 ?auto_117373 ) ) ( not ( = ?auto_117366 ?auto_117374 ) ) ( not ( = ?auto_117366 ?auto_117375 ) ) ( not ( = ?auto_117366 ?auto_117376 ) ) ( not ( = ?auto_117367 ?auto_117368 ) ) ( not ( = ?auto_117367 ?auto_117369 ) ) ( not ( = ?auto_117367 ?auto_117370 ) ) ( not ( = ?auto_117367 ?auto_117371 ) ) ( not ( = ?auto_117367 ?auto_117372 ) ) ( not ( = ?auto_117367 ?auto_117373 ) ) ( not ( = ?auto_117367 ?auto_117374 ) ) ( not ( = ?auto_117367 ?auto_117375 ) ) ( not ( = ?auto_117367 ?auto_117376 ) ) ( not ( = ?auto_117368 ?auto_117369 ) ) ( not ( = ?auto_117368 ?auto_117370 ) ) ( not ( = ?auto_117368 ?auto_117371 ) ) ( not ( = ?auto_117368 ?auto_117372 ) ) ( not ( = ?auto_117368 ?auto_117373 ) ) ( not ( = ?auto_117368 ?auto_117374 ) ) ( not ( = ?auto_117368 ?auto_117375 ) ) ( not ( = ?auto_117368 ?auto_117376 ) ) ( not ( = ?auto_117369 ?auto_117370 ) ) ( not ( = ?auto_117369 ?auto_117371 ) ) ( not ( = ?auto_117369 ?auto_117372 ) ) ( not ( = ?auto_117369 ?auto_117373 ) ) ( not ( = ?auto_117369 ?auto_117374 ) ) ( not ( = ?auto_117369 ?auto_117375 ) ) ( not ( = ?auto_117369 ?auto_117376 ) ) ( not ( = ?auto_117370 ?auto_117371 ) ) ( not ( = ?auto_117370 ?auto_117372 ) ) ( not ( = ?auto_117370 ?auto_117373 ) ) ( not ( = ?auto_117370 ?auto_117374 ) ) ( not ( = ?auto_117370 ?auto_117375 ) ) ( not ( = ?auto_117370 ?auto_117376 ) ) ( not ( = ?auto_117371 ?auto_117372 ) ) ( not ( = ?auto_117371 ?auto_117373 ) ) ( not ( = ?auto_117371 ?auto_117374 ) ) ( not ( = ?auto_117371 ?auto_117375 ) ) ( not ( = ?auto_117371 ?auto_117376 ) ) ( not ( = ?auto_117372 ?auto_117373 ) ) ( not ( = ?auto_117372 ?auto_117374 ) ) ( not ( = ?auto_117372 ?auto_117375 ) ) ( not ( = ?auto_117372 ?auto_117376 ) ) ( not ( = ?auto_117373 ?auto_117374 ) ) ( not ( = ?auto_117373 ?auto_117375 ) ) ( not ( = ?auto_117373 ?auto_117376 ) ) ( not ( = ?auto_117374 ?auto_117375 ) ) ( not ( = ?auto_117374 ?auto_117376 ) ) ( not ( = ?auto_117375 ?auto_117376 ) ) ( ON ?auto_117375 ?auto_117376 ) ( ON ?auto_117374 ?auto_117375 ) ( ON ?auto_117373 ?auto_117374 ) ( ON ?auto_117372 ?auto_117373 ) ( ON ?auto_117371 ?auto_117372 ) ( CLEAR ?auto_117369 ) ( ON ?auto_117370 ?auto_117371 ) ( CLEAR ?auto_117370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_117366 ?auto_117367 ?auto_117368 ?auto_117369 ?auto_117370 )
      ( MAKE-11PILE ?auto_117366 ?auto_117367 ?auto_117368 ?auto_117369 ?auto_117370 ?auto_117371 ?auto_117372 ?auto_117373 ?auto_117374 ?auto_117375 ?auto_117376 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_117388 - BLOCK
      ?auto_117389 - BLOCK
      ?auto_117390 - BLOCK
      ?auto_117391 - BLOCK
      ?auto_117392 - BLOCK
      ?auto_117393 - BLOCK
      ?auto_117394 - BLOCK
      ?auto_117395 - BLOCK
      ?auto_117396 - BLOCK
      ?auto_117397 - BLOCK
      ?auto_117398 - BLOCK
    )
    :vars
    (
      ?auto_117399 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117398 ?auto_117399 ) ( ON-TABLE ?auto_117388 ) ( ON ?auto_117389 ?auto_117388 ) ( ON ?auto_117390 ?auto_117389 ) ( not ( = ?auto_117388 ?auto_117389 ) ) ( not ( = ?auto_117388 ?auto_117390 ) ) ( not ( = ?auto_117388 ?auto_117391 ) ) ( not ( = ?auto_117388 ?auto_117392 ) ) ( not ( = ?auto_117388 ?auto_117393 ) ) ( not ( = ?auto_117388 ?auto_117394 ) ) ( not ( = ?auto_117388 ?auto_117395 ) ) ( not ( = ?auto_117388 ?auto_117396 ) ) ( not ( = ?auto_117388 ?auto_117397 ) ) ( not ( = ?auto_117388 ?auto_117398 ) ) ( not ( = ?auto_117388 ?auto_117399 ) ) ( not ( = ?auto_117389 ?auto_117390 ) ) ( not ( = ?auto_117389 ?auto_117391 ) ) ( not ( = ?auto_117389 ?auto_117392 ) ) ( not ( = ?auto_117389 ?auto_117393 ) ) ( not ( = ?auto_117389 ?auto_117394 ) ) ( not ( = ?auto_117389 ?auto_117395 ) ) ( not ( = ?auto_117389 ?auto_117396 ) ) ( not ( = ?auto_117389 ?auto_117397 ) ) ( not ( = ?auto_117389 ?auto_117398 ) ) ( not ( = ?auto_117389 ?auto_117399 ) ) ( not ( = ?auto_117390 ?auto_117391 ) ) ( not ( = ?auto_117390 ?auto_117392 ) ) ( not ( = ?auto_117390 ?auto_117393 ) ) ( not ( = ?auto_117390 ?auto_117394 ) ) ( not ( = ?auto_117390 ?auto_117395 ) ) ( not ( = ?auto_117390 ?auto_117396 ) ) ( not ( = ?auto_117390 ?auto_117397 ) ) ( not ( = ?auto_117390 ?auto_117398 ) ) ( not ( = ?auto_117390 ?auto_117399 ) ) ( not ( = ?auto_117391 ?auto_117392 ) ) ( not ( = ?auto_117391 ?auto_117393 ) ) ( not ( = ?auto_117391 ?auto_117394 ) ) ( not ( = ?auto_117391 ?auto_117395 ) ) ( not ( = ?auto_117391 ?auto_117396 ) ) ( not ( = ?auto_117391 ?auto_117397 ) ) ( not ( = ?auto_117391 ?auto_117398 ) ) ( not ( = ?auto_117391 ?auto_117399 ) ) ( not ( = ?auto_117392 ?auto_117393 ) ) ( not ( = ?auto_117392 ?auto_117394 ) ) ( not ( = ?auto_117392 ?auto_117395 ) ) ( not ( = ?auto_117392 ?auto_117396 ) ) ( not ( = ?auto_117392 ?auto_117397 ) ) ( not ( = ?auto_117392 ?auto_117398 ) ) ( not ( = ?auto_117392 ?auto_117399 ) ) ( not ( = ?auto_117393 ?auto_117394 ) ) ( not ( = ?auto_117393 ?auto_117395 ) ) ( not ( = ?auto_117393 ?auto_117396 ) ) ( not ( = ?auto_117393 ?auto_117397 ) ) ( not ( = ?auto_117393 ?auto_117398 ) ) ( not ( = ?auto_117393 ?auto_117399 ) ) ( not ( = ?auto_117394 ?auto_117395 ) ) ( not ( = ?auto_117394 ?auto_117396 ) ) ( not ( = ?auto_117394 ?auto_117397 ) ) ( not ( = ?auto_117394 ?auto_117398 ) ) ( not ( = ?auto_117394 ?auto_117399 ) ) ( not ( = ?auto_117395 ?auto_117396 ) ) ( not ( = ?auto_117395 ?auto_117397 ) ) ( not ( = ?auto_117395 ?auto_117398 ) ) ( not ( = ?auto_117395 ?auto_117399 ) ) ( not ( = ?auto_117396 ?auto_117397 ) ) ( not ( = ?auto_117396 ?auto_117398 ) ) ( not ( = ?auto_117396 ?auto_117399 ) ) ( not ( = ?auto_117397 ?auto_117398 ) ) ( not ( = ?auto_117397 ?auto_117399 ) ) ( not ( = ?auto_117398 ?auto_117399 ) ) ( ON ?auto_117397 ?auto_117398 ) ( ON ?auto_117396 ?auto_117397 ) ( ON ?auto_117395 ?auto_117396 ) ( ON ?auto_117394 ?auto_117395 ) ( ON ?auto_117393 ?auto_117394 ) ( ON ?auto_117392 ?auto_117393 ) ( CLEAR ?auto_117390 ) ( ON ?auto_117391 ?auto_117392 ) ( CLEAR ?auto_117391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_117388 ?auto_117389 ?auto_117390 ?auto_117391 )
      ( MAKE-11PILE ?auto_117388 ?auto_117389 ?auto_117390 ?auto_117391 ?auto_117392 ?auto_117393 ?auto_117394 ?auto_117395 ?auto_117396 ?auto_117397 ?auto_117398 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_117411 - BLOCK
      ?auto_117412 - BLOCK
      ?auto_117413 - BLOCK
      ?auto_117414 - BLOCK
      ?auto_117415 - BLOCK
      ?auto_117416 - BLOCK
      ?auto_117417 - BLOCK
      ?auto_117418 - BLOCK
      ?auto_117419 - BLOCK
      ?auto_117420 - BLOCK
      ?auto_117421 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117421 ) ( ON-TABLE ?auto_117411 ) ( ON ?auto_117412 ?auto_117411 ) ( ON ?auto_117413 ?auto_117412 ) ( not ( = ?auto_117411 ?auto_117412 ) ) ( not ( = ?auto_117411 ?auto_117413 ) ) ( not ( = ?auto_117411 ?auto_117414 ) ) ( not ( = ?auto_117411 ?auto_117415 ) ) ( not ( = ?auto_117411 ?auto_117416 ) ) ( not ( = ?auto_117411 ?auto_117417 ) ) ( not ( = ?auto_117411 ?auto_117418 ) ) ( not ( = ?auto_117411 ?auto_117419 ) ) ( not ( = ?auto_117411 ?auto_117420 ) ) ( not ( = ?auto_117411 ?auto_117421 ) ) ( not ( = ?auto_117412 ?auto_117413 ) ) ( not ( = ?auto_117412 ?auto_117414 ) ) ( not ( = ?auto_117412 ?auto_117415 ) ) ( not ( = ?auto_117412 ?auto_117416 ) ) ( not ( = ?auto_117412 ?auto_117417 ) ) ( not ( = ?auto_117412 ?auto_117418 ) ) ( not ( = ?auto_117412 ?auto_117419 ) ) ( not ( = ?auto_117412 ?auto_117420 ) ) ( not ( = ?auto_117412 ?auto_117421 ) ) ( not ( = ?auto_117413 ?auto_117414 ) ) ( not ( = ?auto_117413 ?auto_117415 ) ) ( not ( = ?auto_117413 ?auto_117416 ) ) ( not ( = ?auto_117413 ?auto_117417 ) ) ( not ( = ?auto_117413 ?auto_117418 ) ) ( not ( = ?auto_117413 ?auto_117419 ) ) ( not ( = ?auto_117413 ?auto_117420 ) ) ( not ( = ?auto_117413 ?auto_117421 ) ) ( not ( = ?auto_117414 ?auto_117415 ) ) ( not ( = ?auto_117414 ?auto_117416 ) ) ( not ( = ?auto_117414 ?auto_117417 ) ) ( not ( = ?auto_117414 ?auto_117418 ) ) ( not ( = ?auto_117414 ?auto_117419 ) ) ( not ( = ?auto_117414 ?auto_117420 ) ) ( not ( = ?auto_117414 ?auto_117421 ) ) ( not ( = ?auto_117415 ?auto_117416 ) ) ( not ( = ?auto_117415 ?auto_117417 ) ) ( not ( = ?auto_117415 ?auto_117418 ) ) ( not ( = ?auto_117415 ?auto_117419 ) ) ( not ( = ?auto_117415 ?auto_117420 ) ) ( not ( = ?auto_117415 ?auto_117421 ) ) ( not ( = ?auto_117416 ?auto_117417 ) ) ( not ( = ?auto_117416 ?auto_117418 ) ) ( not ( = ?auto_117416 ?auto_117419 ) ) ( not ( = ?auto_117416 ?auto_117420 ) ) ( not ( = ?auto_117416 ?auto_117421 ) ) ( not ( = ?auto_117417 ?auto_117418 ) ) ( not ( = ?auto_117417 ?auto_117419 ) ) ( not ( = ?auto_117417 ?auto_117420 ) ) ( not ( = ?auto_117417 ?auto_117421 ) ) ( not ( = ?auto_117418 ?auto_117419 ) ) ( not ( = ?auto_117418 ?auto_117420 ) ) ( not ( = ?auto_117418 ?auto_117421 ) ) ( not ( = ?auto_117419 ?auto_117420 ) ) ( not ( = ?auto_117419 ?auto_117421 ) ) ( not ( = ?auto_117420 ?auto_117421 ) ) ( ON ?auto_117420 ?auto_117421 ) ( ON ?auto_117419 ?auto_117420 ) ( ON ?auto_117418 ?auto_117419 ) ( ON ?auto_117417 ?auto_117418 ) ( ON ?auto_117416 ?auto_117417 ) ( ON ?auto_117415 ?auto_117416 ) ( CLEAR ?auto_117413 ) ( ON ?auto_117414 ?auto_117415 ) ( CLEAR ?auto_117414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_117411 ?auto_117412 ?auto_117413 ?auto_117414 )
      ( MAKE-11PILE ?auto_117411 ?auto_117412 ?auto_117413 ?auto_117414 ?auto_117415 ?auto_117416 ?auto_117417 ?auto_117418 ?auto_117419 ?auto_117420 ?auto_117421 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_117433 - BLOCK
      ?auto_117434 - BLOCK
      ?auto_117435 - BLOCK
      ?auto_117436 - BLOCK
      ?auto_117437 - BLOCK
      ?auto_117438 - BLOCK
      ?auto_117439 - BLOCK
      ?auto_117440 - BLOCK
      ?auto_117441 - BLOCK
      ?auto_117442 - BLOCK
      ?auto_117443 - BLOCK
    )
    :vars
    (
      ?auto_117444 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117443 ?auto_117444 ) ( ON-TABLE ?auto_117433 ) ( ON ?auto_117434 ?auto_117433 ) ( not ( = ?auto_117433 ?auto_117434 ) ) ( not ( = ?auto_117433 ?auto_117435 ) ) ( not ( = ?auto_117433 ?auto_117436 ) ) ( not ( = ?auto_117433 ?auto_117437 ) ) ( not ( = ?auto_117433 ?auto_117438 ) ) ( not ( = ?auto_117433 ?auto_117439 ) ) ( not ( = ?auto_117433 ?auto_117440 ) ) ( not ( = ?auto_117433 ?auto_117441 ) ) ( not ( = ?auto_117433 ?auto_117442 ) ) ( not ( = ?auto_117433 ?auto_117443 ) ) ( not ( = ?auto_117433 ?auto_117444 ) ) ( not ( = ?auto_117434 ?auto_117435 ) ) ( not ( = ?auto_117434 ?auto_117436 ) ) ( not ( = ?auto_117434 ?auto_117437 ) ) ( not ( = ?auto_117434 ?auto_117438 ) ) ( not ( = ?auto_117434 ?auto_117439 ) ) ( not ( = ?auto_117434 ?auto_117440 ) ) ( not ( = ?auto_117434 ?auto_117441 ) ) ( not ( = ?auto_117434 ?auto_117442 ) ) ( not ( = ?auto_117434 ?auto_117443 ) ) ( not ( = ?auto_117434 ?auto_117444 ) ) ( not ( = ?auto_117435 ?auto_117436 ) ) ( not ( = ?auto_117435 ?auto_117437 ) ) ( not ( = ?auto_117435 ?auto_117438 ) ) ( not ( = ?auto_117435 ?auto_117439 ) ) ( not ( = ?auto_117435 ?auto_117440 ) ) ( not ( = ?auto_117435 ?auto_117441 ) ) ( not ( = ?auto_117435 ?auto_117442 ) ) ( not ( = ?auto_117435 ?auto_117443 ) ) ( not ( = ?auto_117435 ?auto_117444 ) ) ( not ( = ?auto_117436 ?auto_117437 ) ) ( not ( = ?auto_117436 ?auto_117438 ) ) ( not ( = ?auto_117436 ?auto_117439 ) ) ( not ( = ?auto_117436 ?auto_117440 ) ) ( not ( = ?auto_117436 ?auto_117441 ) ) ( not ( = ?auto_117436 ?auto_117442 ) ) ( not ( = ?auto_117436 ?auto_117443 ) ) ( not ( = ?auto_117436 ?auto_117444 ) ) ( not ( = ?auto_117437 ?auto_117438 ) ) ( not ( = ?auto_117437 ?auto_117439 ) ) ( not ( = ?auto_117437 ?auto_117440 ) ) ( not ( = ?auto_117437 ?auto_117441 ) ) ( not ( = ?auto_117437 ?auto_117442 ) ) ( not ( = ?auto_117437 ?auto_117443 ) ) ( not ( = ?auto_117437 ?auto_117444 ) ) ( not ( = ?auto_117438 ?auto_117439 ) ) ( not ( = ?auto_117438 ?auto_117440 ) ) ( not ( = ?auto_117438 ?auto_117441 ) ) ( not ( = ?auto_117438 ?auto_117442 ) ) ( not ( = ?auto_117438 ?auto_117443 ) ) ( not ( = ?auto_117438 ?auto_117444 ) ) ( not ( = ?auto_117439 ?auto_117440 ) ) ( not ( = ?auto_117439 ?auto_117441 ) ) ( not ( = ?auto_117439 ?auto_117442 ) ) ( not ( = ?auto_117439 ?auto_117443 ) ) ( not ( = ?auto_117439 ?auto_117444 ) ) ( not ( = ?auto_117440 ?auto_117441 ) ) ( not ( = ?auto_117440 ?auto_117442 ) ) ( not ( = ?auto_117440 ?auto_117443 ) ) ( not ( = ?auto_117440 ?auto_117444 ) ) ( not ( = ?auto_117441 ?auto_117442 ) ) ( not ( = ?auto_117441 ?auto_117443 ) ) ( not ( = ?auto_117441 ?auto_117444 ) ) ( not ( = ?auto_117442 ?auto_117443 ) ) ( not ( = ?auto_117442 ?auto_117444 ) ) ( not ( = ?auto_117443 ?auto_117444 ) ) ( ON ?auto_117442 ?auto_117443 ) ( ON ?auto_117441 ?auto_117442 ) ( ON ?auto_117440 ?auto_117441 ) ( ON ?auto_117439 ?auto_117440 ) ( ON ?auto_117438 ?auto_117439 ) ( ON ?auto_117437 ?auto_117438 ) ( ON ?auto_117436 ?auto_117437 ) ( CLEAR ?auto_117434 ) ( ON ?auto_117435 ?auto_117436 ) ( CLEAR ?auto_117435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117433 ?auto_117434 ?auto_117435 )
      ( MAKE-11PILE ?auto_117433 ?auto_117434 ?auto_117435 ?auto_117436 ?auto_117437 ?auto_117438 ?auto_117439 ?auto_117440 ?auto_117441 ?auto_117442 ?auto_117443 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_117456 - BLOCK
      ?auto_117457 - BLOCK
      ?auto_117458 - BLOCK
      ?auto_117459 - BLOCK
      ?auto_117460 - BLOCK
      ?auto_117461 - BLOCK
      ?auto_117462 - BLOCK
      ?auto_117463 - BLOCK
      ?auto_117464 - BLOCK
      ?auto_117465 - BLOCK
      ?auto_117466 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117466 ) ( ON-TABLE ?auto_117456 ) ( ON ?auto_117457 ?auto_117456 ) ( not ( = ?auto_117456 ?auto_117457 ) ) ( not ( = ?auto_117456 ?auto_117458 ) ) ( not ( = ?auto_117456 ?auto_117459 ) ) ( not ( = ?auto_117456 ?auto_117460 ) ) ( not ( = ?auto_117456 ?auto_117461 ) ) ( not ( = ?auto_117456 ?auto_117462 ) ) ( not ( = ?auto_117456 ?auto_117463 ) ) ( not ( = ?auto_117456 ?auto_117464 ) ) ( not ( = ?auto_117456 ?auto_117465 ) ) ( not ( = ?auto_117456 ?auto_117466 ) ) ( not ( = ?auto_117457 ?auto_117458 ) ) ( not ( = ?auto_117457 ?auto_117459 ) ) ( not ( = ?auto_117457 ?auto_117460 ) ) ( not ( = ?auto_117457 ?auto_117461 ) ) ( not ( = ?auto_117457 ?auto_117462 ) ) ( not ( = ?auto_117457 ?auto_117463 ) ) ( not ( = ?auto_117457 ?auto_117464 ) ) ( not ( = ?auto_117457 ?auto_117465 ) ) ( not ( = ?auto_117457 ?auto_117466 ) ) ( not ( = ?auto_117458 ?auto_117459 ) ) ( not ( = ?auto_117458 ?auto_117460 ) ) ( not ( = ?auto_117458 ?auto_117461 ) ) ( not ( = ?auto_117458 ?auto_117462 ) ) ( not ( = ?auto_117458 ?auto_117463 ) ) ( not ( = ?auto_117458 ?auto_117464 ) ) ( not ( = ?auto_117458 ?auto_117465 ) ) ( not ( = ?auto_117458 ?auto_117466 ) ) ( not ( = ?auto_117459 ?auto_117460 ) ) ( not ( = ?auto_117459 ?auto_117461 ) ) ( not ( = ?auto_117459 ?auto_117462 ) ) ( not ( = ?auto_117459 ?auto_117463 ) ) ( not ( = ?auto_117459 ?auto_117464 ) ) ( not ( = ?auto_117459 ?auto_117465 ) ) ( not ( = ?auto_117459 ?auto_117466 ) ) ( not ( = ?auto_117460 ?auto_117461 ) ) ( not ( = ?auto_117460 ?auto_117462 ) ) ( not ( = ?auto_117460 ?auto_117463 ) ) ( not ( = ?auto_117460 ?auto_117464 ) ) ( not ( = ?auto_117460 ?auto_117465 ) ) ( not ( = ?auto_117460 ?auto_117466 ) ) ( not ( = ?auto_117461 ?auto_117462 ) ) ( not ( = ?auto_117461 ?auto_117463 ) ) ( not ( = ?auto_117461 ?auto_117464 ) ) ( not ( = ?auto_117461 ?auto_117465 ) ) ( not ( = ?auto_117461 ?auto_117466 ) ) ( not ( = ?auto_117462 ?auto_117463 ) ) ( not ( = ?auto_117462 ?auto_117464 ) ) ( not ( = ?auto_117462 ?auto_117465 ) ) ( not ( = ?auto_117462 ?auto_117466 ) ) ( not ( = ?auto_117463 ?auto_117464 ) ) ( not ( = ?auto_117463 ?auto_117465 ) ) ( not ( = ?auto_117463 ?auto_117466 ) ) ( not ( = ?auto_117464 ?auto_117465 ) ) ( not ( = ?auto_117464 ?auto_117466 ) ) ( not ( = ?auto_117465 ?auto_117466 ) ) ( ON ?auto_117465 ?auto_117466 ) ( ON ?auto_117464 ?auto_117465 ) ( ON ?auto_117463 ?auto_117464 ) ( ON ?auto_117462 ?auto_117463 ) ( ON ?auto_117461 ?auto_117462 ) ( ON ?auto_117460 ?auto_117461 ) ( ON ?auto_117459 ?auto_117460 ) ( CLEAR ?auto_117457 ) ( ON ?auto_117458 ?auto_117459 ) ( CLEAR ?auto_117458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117456 ?auto_117457 ?auto_117458 )
      ( MAKE-11PILE ?auto_117456 ?auto_117457 ?auto_117458 ?auto_117459 ?auto_117460 ?auto_117461 ?auto_117462 ?auto_117463 ?auto_117464 ?auto_117465 ?auto_117466 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_117478 - BLOCK
      ?auto_117479 - BLOCK
      ?auto_117480 - BLOCK
      ?auto_117481 - BLOCK
      ?auto_117482 - BLOCK
      ?auto_117483 - BLOCK
      ?auto_117484 - BLOCK
      ?auto_117485 - BLOCK
      ?auto_117486 - BLOCK
      ?auto_117487 - BLOCK
      ?auto_117488 - BLOCK
    )
    :vars
    (
      ?auto_117489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117488 ?auto_117489 ) ( ON-TABLE ?auto_117478 ) ( not ( = ?auto_117478 ?auto_117479 ) ) ( not ( = ?auto_117478 ?auto_117480 ) ) ( not ( = ?auto_117478 ?auto_117481 ) ) ( not ( = ?auto_117478 ?auto_117482 ) ) ( not ( = ?auto_117478 ?auto_117483 ) ) ( not ( = ?auto_117478 ?auto_117484 ) ) ( not ( = ?auto_117478 ?auto_117485 ) ) ( not ( = ?auto_117478 ?auto_117486 ) ) ( not ( = ?auto_117478 ?auto_117487 ) ) ( not ( = ?auto_117478 ?auto_117488 ) ) ( not ( = ?auto_117478 ?auto_117489 ) ) ( not ( = ?auto_117479 ?auto_117480 ) ) ( not ( = ?auto_117479 ?auto_117481 ) ) ( not ( = ?auto_117479 ?auto_117482 ) ) ( not ( = ?auto_117479 ?auto_117483 ) ) ( not ( = ?auto_117479 ?auto_117484 ) ) ( not ( = ?auto_117479 ?auto_117485 ) ) ( not ( = ?auto_117479 ?auto_117486 ) ) ( not ( = ?auto_117479 ?auto_117487 ) ) ( not ( = ?auto_117479 ?auto_117488 ) ) ( not ( = ?auto_117479 ?auto_117489 ) ) ( not ( = ?auto_117480 ?auto_117481 ) ) ( not ( = ?auto_117480 ?auto_117482 ) ) ( not ( = ?auto_117480 ?auto_117483 ) ) ( not ( = ?auto_117480 ?auto_117484 ) ) ( not ( = ?auto_117480 ?auto_117485 ) ) ( not ( = ?auto_117480 ?auto_117486 ) ) ( not ( = ?auto_117480 ?auto_117487 ) ) ( not ( = ?auto_117480 ?auto_117488 ) ) ( not ( = ?auto_117480 ?auto_117489 ) ) ( not ( = ?auto_117481 ?auto_117482 ) ) ( not ( = ?auto_117481 ?auto_117483 ) ) ( not ( = ?auto_117481 ?auto_117484 ) ) ( not ( = ?auto_117481 ?auto_117485 ) ) ( not ( = ?auto_117481 ?auto_117486 ) ) ( not ( = ?auto_117481 ?auto_117487 ) ) ( not ( = ?auto_117481 ?auto_117488 ) ) ( not ( = ?auto_117481 ?auto_117489 ) ) ( not ( = ?auto_117482 ?auto_117483 ) ) ( not ( = ?auto_117482 ?auto_117484 ) ) ( not ( = ?auto_117482 ?auto_117485 ) ) ( not ( = ?auto_117482 ?auto_117486 ) ) ( not ( = ?auto_117482 ?auto_117487 ) ) ( not ( = ?auto_117482 ?auto_117488 ) ) ( not ( = ?auto_117482 ?auto_117489 ) ) ( not ( = ?auto_117483 ?auto_117484 ) ) ( not ( = ?auto_117483 ?auto_117485 ) ) ( not ( = ?auto_117483 ?auto_117486 ) ) ( not ( = ?auto_117483 ?auto_117487 ) ) ( not ( = ?auto_117483 ?auto_117488 ) ) ( not ( = ?auto_117483 ?auto_117489 ) ) ( not ( = ?auto_117484 ?auto_117485 ) ) ( not ( = ?auto_117484 ?auto_117486 ) ) ( not ( = ?auto_117484 ?auto_117487 ) ) ( not ( = ?auto_117484 ?auto_117488 ) ) ( not ( = ?auto_117484 ?auto_117489 ) ) ( not ( = ?auto_117485 ?auto_117486 ) ) ( not ( = ?auto_117485 ?auto_117487 ) ) ( not ( = ?auto_117485 ?auto_117488 ) ) ( not ( = ?auto_117485 ?auto_117489 ) ) ( not ( = ?auto_117486 ?auto_117487 ) ) ( not ( = ?auto_117486 ?auto_117488 ) ) ( not ( = ?auto_117486 ?auto_117489 ) ) ( not ( = ?auto_117487 ?auto_117488 ) ) ( not ( = ?auto_117487 ?auto_117489 ) ) ( not ( = ?auto_117488 ?auto_117489 ) ) ( ON ?auto_117487 ?auto_117488 ) ( ON ?auto_117486 ?auto_117487 ) ( ON ?auto_117485 ?auto_117486 ) ( ON ?auto_117484 ?auto_117485 ) ( ON ?auto_117483 ?auto_117484 ) ( ON ?auto_117482 ?auto_117483 ) ( ON ?auto_117481 ?auto_117482 ) ( ON ?auto_117480 ?auto_117481 ) ( CLEAR ?auto_117478 ) ( ON ?auto_117479 ?auto_117480 ) ( CLEAR ?auto_117479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117478 ?auto_117479 )
      ( MAKE-11PILE ?auto_117478 ?auto_117479 ?auto_117480 ?auto_117481 ?auto_117482 ?auto_117483 ?auto_117484 ?auto_117485 ?auto_117486 ?auto_117487 ?auto_117488 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_117501 - BLOCK
      ?auto_117502 - BLOCK
      ?auto_117503 - BLOCK
      ?auto_117504 - BLOCK
      ?auto_117505 - BLOCK
      ?auto_117506 - BLOCK
      ?auto_117507 - BLOCK
      ?auto_117508 - BLOCK
      ?auto_117509 - BLOCK
      ?auto_117510 - BLOCK
      ?auto_117511 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117511 ) ( ON-TABLE ?auto_117501 ) ( not ( = ?auto_117501 ?auto_117502 ) ) ( not ( = ?auto_117501 ?auto_117503 ) ) ( not ( = ?auto_117501 ?auto_117504 ) ) ( not ( = ?auto_117501 ?auto_117505 ) ) ( not ( = ?auto_117501 ?auto_117506 ) ) ( not ( = ?auto_117501 ?auto_117507 ) ) ( not ( = ?auto_117501 ?auto_117508 ) ) ( not ( = ?auto_117501 ?auto_117509 ) ) ( not ( = ?auto_117501 ?auto_117510 ) ) ( not ( = ?auto_117501 ?auto_117511 ) ) ( not ( = ?auto_117502 ?auto_117503 ) ) ( not ( = ?auto_117502 ?auto_117504 ) ) ( not ( = ?auto_117502 ?auto_117505 ) ) ( not ( = ?auto_117502 ?auto_117506 ) ) ( not ( = ?auto_117502 ?auto_117507 ) ) ( not ( = ?auto_117502 ?auto_117508 ) ) ( not ( = ?auto_117502 ?auto_117509 ) ) ( not ( = ?auto_117502 ?auto_117510 ) ) ( not ( = ?auto_117502 ?auto_117511 ) ) ( not ( = ?auto_117503 ?auto_117504 ) ) ( not ( = ?auto_117503 ?auto_117505 ) ) ( not ( = ?auto_117503 ?auto_117506 ) ) ( not ( = ?auto_117503 ?auto_117507 ) ) ( not ( = ?auto_117503 ?auto_117508 ) ) ( not ( = ?auto_117503 ?auto_117509 ) ) ( not ( = ?auto_117503 ?auto_117510 ) ) ( not ( = ?auto_117503 ?auto_117511 ) ) ( not ( = ?auto_117504 ?auto_117505 ) ) ( not ( = ?auto_117504 ?auto_117506 ) ) ( not ( = ?auto_117504 ?auto_117507 ) ) ( not ( = ?auto_117504 ?auto_117508 ) ) ( not ( = ?auto_117504 ?auto_117509 ) ) ( not ( = ?auto_117504 ?auto_117510 ) ) ( not ( = ?auto_117504 ?auto_117511 ) ) ( not ( = ?auto_117505 ?auto_117506 ) ) ( not ( = ?auto_117505 ?auto_117507 ) ) ( not ( = ?auto_117505 ?auto_117508 ) ) ( not ( = ?auto_117505 ?auto_117509 ) ) ( not ( = ?auto_117505 ?auto_117510 ) ) ( not ( = ?auto_117505 ?auto_117511 ) ) ( not ( = ?auto_117506 ?auto_117507 ) ) ( not ( = ?auto_117506 ?auto_117508 ) ) ( not ( = ?auto_117506 ?auto_117509 ) ) ( not ( = ?auto_117506 ?auto_117510 ) ) ( not ( = ?auto_117506 ?auto_117511 ) ) ( not ( = ?auto_117507 ?auto_117508 ) ) ( not ( = ?auto_117507 ?auto_117509 ) ) ( not ( = ?auto_117507 ?auto_117510 ) ) ( not ( = ?auto_117507 ?auto_117511 ) ) ( not ( = ?auto_117508 ?auto_117509 ) ) ( not ( = ?auto_117508 ?auto_117510 ) ) ( not ( = ?auto_117508 ?auto_117511 ) ) ( not ( = ?auto_117509 ?auto_117510 ) ) ( not ( = ?auto_117509 ?auto_117511 ) ) ( not ( = ?auto_117510 ?auto_117511 ) ) ( ON ?auto_117510 ?auto_117511 ) ( ON ?auto_117509 ?auto_117510 ) ( ON ?auto_117508 ?auto_117509 ) ( ON ?auto_117507 ?auto_117508 ) ( ON ?auto_117506 ?auto_117507 ) ( ON ?auto_117505 ?auto_117506 ) ( ON ?auto_117504 ?auto_117505 ) ( ON ?auto_117503 ?auto_117504 ) ( CLEAR ?auto_117501 ) ( ON ?auto_117502 ?auto_117503 ) ( CLEAR ?auto_117502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117501 ?auto_117502 )
      ( MAKE-11PILE ?auto_117501 ?auto_117502 ?auto_117503 ?auto_117504 ?auto_117505 ?auto_117506 ?auto_117507 ?auto_117508 ?auto_117509 ?auto_117510 ?auto_117511 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_117523 - BLOCK
      ?auto_117524 - BLOCK
      ?auto_117525 - BLOCK
      ?auto_117526 - BLOCK
      ?auto_117527 - BLOCK
      ?auto_117528 - BLOCK
      ?auto_117529 - BLOCK
      ?auto_117530 - BLOCK
      ?auto_117531 - BLOCK
      ?auto_117532 - BLOCK
      ?auto_117533 - BLOCK
    )
    :vars
    (
      ?auto_117534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117533 ?auto_117534 ) ( not ( = ?auto_117523 ?auto_117524 ) ) ( not ( = ?auto_117523 ?auto_117525 ) ) ( not ( = ?auto_117523 ?auto_117526 ) ) ( not ( = ?auto_117523 ?auto_117527 ) ) ( not ( = ?auto_117523 ?auto_117528 ) ) ( not ( = ?auto_117523 ?auto_117529 ) ) ( not ( = ?auto_117523 ?auto_117530 ) ) ( not ( = ?auto_117523 ?auto_117531 ) ) ( not ( = ?auto_117523 ?auto_117532 ) ) ( not ( = ?auto_117523 ?auto_117533 ) ) ( not ( = ?auto_117523 ?auto_117534 ) ) ( not ( = ?auto_117524 ?auto_117525 ) ) ( not ( = ?auto_117524 ?auto_117526 ) ) ( not ( = ?auto_117524 ?auto_117527 ) ) ( not ( = ?auto_117524 ?auto_117528 ) ) ( not ( = ?auto_117524 ?auto_117529 ) ) ( not ( = ?auto_117524 ?auto_117530 ) ) ( not ( = ?auto_117524 ?auto_117531 ) ) ( not ( = ?auto_117524 ?auto_117532 ) ) ( not ( = ?auto_117524 ?auto_117533 ) ) ( not ( = ?auto_117524 ?auto_117534 ) ) ( not ( = ?auto_117525 ?auto_117526 ) ) ( not ( = ?auto_117525 ?auto_117527 ) ) ( not ( = ?auto_117525 ?auto_117528 ) ) ( not ( = ?auto_117525 ?auto_117529 ) ) ( not ( = ?auto_117525 ?auto_117530 ) ) ( not ( = ?auto_117525 ?auto_117531 ) ) ( not ( = ?auto_117525 ?auto_117532 ) ) ( not ( = ?auto_117525 ?auto_117533 ) ) ( not ( = ?auto_117525 ?auto_117534 ) ) ( not ( = ?auto_117526 ?auto_117527 ) ) ( not ( = ?auto_117526 ?auto_117528 ) ) ( not ( = ?auto_117526 ?auto_117529 ) ) ( not ( = ?auto_117526 ?auto_117530 ) ) ( not ( = ?auto_117526 ?auto_117531 ) ) ( not ( = ?auto_117526 ?auto_117532 ) ) ( not ( = ?auto_117526 ?auto_117533 ) ) ( not ( = ?auto_117526 ?auto_117534 ) ) ( not ( = ?auto_117527 ?auto_117528 ) ) ( not ( = ?auto_117527 ?auto_117529 ) ) ( not ( = ?auto_117527 ?auto_117530 ) ) ( not ( = ?auto_117527 ?auto_117531 ) ) ( not ( = ?auto_117527 ?auto_117532 ) ) ( not ( = ?auto_117527 ?auto_117533 ) ) ( not ( = ?auto_117527 ?auto_117534 ) ) ( not ( = ?auto_117528 ?auto_117529 ) ) ( not ( = ?auto_117528 ?auto_117530 ) ) ( not ( = ?auto_117528 ?auto_117531 ) ) ( not ( = ?auto_117528 ?auto_117532 ) ) ( not ( = ?auto_117528 ?auto_117533 ) ) ( not ( = ?auto_117528 ?auto_117534 ) ) ( not ( = ?auto_117529 ?auto_117530 ) ) ( not ( = ?auto_117529 ?auto_117531 ) ) ( not ( = ?auto_117529 ?auto_117532 ) ) ( not ( = ?auto_117529 ?auto_117533 ) ) ( not ( = ?auto_117529 ?auto_117534 ) ) ( not ( = ?auto_117530 ?auto_117531 ) ) ( not ( = ?auto_117530 ?auto_117532 ) ) ( not ( = ?auto_117530 ?auto_117533 ) ) ( not ( = ?auto_117530 ?auto_117534 ) ) ( not ( = ?auto_117531 ?auto_117532 ) ) ( not ( = ?auto_117531 ?auto_117533 ) ) ( not ( = ?auto_117531 ?auto_117534 ) ) ( not ( = ?auto_117532 ?auto_117533 ) ) ( not ( = ?auto_117532 ?auto_117534 ) ) ( not ( = ?auto_117533 ?auto_117534 ) ) ( ON ?auto_117532 ?auto_117533 ) ( ON ?auto_117531 ?auto_117532 ) ( ON ?auto_117530 ?auto_117531 ) ( ON ?auto_117529 ?auto_117530 ) ( ON ?auto_117528 ?auto_117529 ) ( ON ?auto_117527 ?auto_117528 ) ( ON ?auto_117526 ?auto_117527 ) ( ON ?auto_117525 ?auto_117526 ) ( ON ?auto_117524 ?auto_117525 ) ( ON ?auto_117523 ?auto_117524 ) ( CLEAR ?auto_117523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_117523 )
      ( MAKE-11PILE ?auto_117523 ?auto_117524 ?auto_117525 ?auto_117526 ?auto_117527 ?auto_117528 ?auto_117529 ?auto_117530 ?auto_117531 ?auto_117532 ?auto_117533 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_117546 - BLOCK
      ?auto_117547 - BLOCK
      ?auto_117548 - BLOCK
      ?auto_117549 - BLOCK
      ?auto_117550 - BLOCK
      ?auto_117551 - BLOCK
      ?auto_117552 - BLOCK
      ?auto_117553 - BLOCK
      ?auto_117554 - BLOCK
      ?auto_117555 - BLOCK
      ?auto_117556 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117556 ) ( not ( = ?auto_117546 ?auto_117547 ) ) ( not ( = ?auto_117546 ?auto_117548 ) ) ( not ( = ?auto_117546 ?auto_117549 ) ) ( not ( = ?auto_117546 ?auto_117550 ) ) ( not ( = ?auto_117546 ?auto_117551 ) ) ( not ( = ?auto_117546 ?auto_117552 ) ) ( not ( = ?auto_117546 ?auto_117553 ) ) ( not ( = ?auto_117546 ?auto_117554 ) ) ( not ( = ?auto_117546 ?auto_117555 ) ) ( not ( = ?auto_117546 ?auto_117556 ) ) ( not ( = ?auto_117547 ?auto_117548 ) ) ( not ( = ?auto_117547 ?auto_117549 ) ) ( not ( = ?auto_117547 ?auto_117550 ) ) ( not ( = ?auto_117547 ?auto_117551 ) ) ( not ( = ?auto_117547 ?auto_117552 ) ) ( not ( = ?auto_117547 ?auto_117553 ) ) ( not ( = ?auto_117547 ?auto_117554 ) ) ( not ( = ?auto_117547 ?auto_117555 ) ) ( not ( = ?auto_117547 ?auto_117556 ) ) ( not ( = ?auto_117548 ?auto_117549 ) ) ( not ( = ?auto_117548 ?auto_117550 ) ) ( not ( = ?auto_117548 ?auto_117551 ) ) ( not ( = ?auto_117548 ?auto_117552 ) ) ( not ( = ?auto_117548 ?auto_117553 ) ) ( not ( = ?auto_117548 ?auto_117554 ) ) ( not ( = ?auto_117548 ?auto_117555 ) ) ( not ( = ?auto_117548 ?auto_117556 ) ) ( not ( = ?auto_117549 ?auto_117550 ) ) ( not ( = ?auto_117549 ?auto_117551 ) ) ( not ( = ?auto_117549 ?auto_117552 ) ) ( not ( = ?auto_117549 ?auto_117553 ) ) ( not ( = ?auto_117549 ?auto_117554 ) ) ( not ( = ?auto_117549 ?auto_117555 ) ) ( not ( = ?auto_117549 ?auto_117556 ) ) ( not ( = ?auto_117550 ?auto_117551 ) ) ( not ( = ?auto_117550 ?auto_117552 ) ) ( not ( = ?auto_117550 ?auto_117553 ) ) ( not ( = ?auto_117550 ?auto_117554 ) ) ( not ( = ?auto_117550 ?auto_117555 ) ) ( not ( = ?auto_117550 ?auto_117556 ) ) ( not ( = ?auto_117551 ?auto_117552 ) ) ( not ( = ?auto_117551 ?auto_117553 ) ) ( not ( = ?auto_117551 ?auto_117554 ) ) ( not ( = ?auto_117551 ?auto_117555 ) ) ( not ( = ?auto_117551 ?auto_117556 ) ) ( not ( = ?auto_117552 ?auto_117553 ) ) ( not ( = ?auto_117552 ?auto_117554 ) ) ( not ( = ?auto_117552 ?auto_117555 ) ) ( not ( = ?auto_117552 ?auto_117556 ) ) ( not ( = ?auto_117553 ?auto_117554 ) ) ( not ( = ?auto_117553 ?auto_117555 ) ) ( not ( = ?auto_117553 ?auto_117556 ) ) ( not ( = ?auto_117554 ?auto_117555 ) ) ( not ( = ?auto_117554 ?auto_117556 ) ) ( not ( = ?auto_117555 ?auto_117556 ) ) ( ON ?auto_117555 ?auto_117556 ) ( ON ?auto_117554 ?auto_117555 ) ( ON ?auto_117553 ?auto_117554 ) ( ON ?auto_117552 ?auto_117553 ) ( ON ?auto_117551 ?auto_117552 ) ( ON ?auto_117550 ?auto_117551 ) ( ON ?auto_117549 ?auto_117550 ) ( ON ?auto_117548 ?auto_117549 ) ( ON ?auto_117547 ?auto_117548 ) ( ON ?auto_117546 ?auto_117547 ) ( CLEAR ?auto_117546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_117546 )
      ( MAKE-11PILE ?auto_117546 ?auto_117547 ?auto_117548 ?auto_117549 ?auto_117550 ?auto_117551 ?auto_117552 ?auto_117553 ?auto_117554 ?auto_117555 ?auto_117556 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_117568 - BLOCK
      ?auto_117569 - BLOCK
      ?auto_117570 - BLOCK
      ?auto_117571 - BLOCK
      ?auto_117572 - BLOCK
      ?auto_117573 - BLOCK
      ?auto_117574 - BLOCK
      ?auto_117575 - BLOCK
      ?auto_117576 - BLOCK
      ?auto_117577 - BLOCK
      ?auto_117578 - BLOCK
    )
    :vars
    (
      ?auto_117579 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117568 ?auto_117569 ) ) ( not ( = ?auto_117568 ?auto_117570 ) ) ( not ( = ?auto_117568 ?auto_117571 ) ) ( not ( = ?auto_117568 ?auto_117572 ) ) ( not ( = ?auto_117568 ?auto_117573 ) ) ( not ( = ?auto_117568 ?auto_117574 ) ) ( not ( = ?auto_117568 ?auto_117575 ) ) ( not ( = ?auto_117568 ?auto_117576 ) ) ( not ( = ?auto_117568 ?auto_117577 ) ) ( not ( = ?auto_117568 ?auto_117578 ) ) ( not ( = ?auto_117569 ?auto_117570 ) ) ( not ( = ?auto_117569 ?auto_117571 ) ) ( not ( = ?auto_117569 ?auto_117572 ) ) ( not ( = ?auto_117569 ?auto_117573 ) ) ( not ( = ?auto_117569 ?auto_117574 ) ) ( not ( = ?auto_117569 ?auto_117575 ) ) ( not ( = ?auto_117569 ?auto_117576 ) ) ( not ( = ?auto_117569 ?auto_117577 ) ) ( not ( = ?auto_117569 ?auto_117578 ) ) ( not ( = ?auto_117570 ?auto_117571 ) ) ( not ( = ?auto_117570 ?auto_117572 ) ) ( not ( = ?auto_117570 ?auto_117573 ) ) ( not ( = ?auto_117570 ?auto_117574 ) ) ( not ( = ?auto_117570 ?auto_117575 ) ) ( not ( = ?auto_117570 ?auto_117576 ) ) ( not ( = ?auto_117570 ?auto_117577 ) ) ( not ( = ?auto_117570 ?auto_117578 ) ) ( not ( = ?auto_117571 ?auto_117572 ) ) ( not ( = ?auto_117571 ?auto_117573 ) ) ( not ( = ?auto_117571 ?auto_117574 ) ) ( not ( = ?auto_117571 ?auto_117575 ) ) ( not ( = ?auto_117571 ?auto_117576 ) ) ( not ( = ?auto_117571 ?auto_117577 ) ) ( not ( = ?auto_117571 ?auto_117578 ) ) ( not ( = ?auto_117572 ?auto_117573 ) ) ( not ( = ?auto_117572 ?auto_117574 ) ) ( not ( = ?auto_117572 ?auto_117575 ) ) ( not ( = ?auto_117572 ?auto_117576 ) ) ( not ( = ?auto_117572 ?auto_117577 ) ) ( not ( = ?auto_117572 ?auto_117578 ) ) ( not ( = ?auto_117573 ?auto_117574 ) ) ( not ( = ?auto_117573 ?auto_117575 ) ) ( not ( = ?auto_117573 ?auto_117576 ) ) ( not ( = ?auto_117573 ?auto_117577 ) ) ( not ( = ?auto_117573 ?auto_117578 ) ) ( not ( = ?auto_117574 ?auto_117575 ) ) ( not ( = ?auto_117574 ?auto_117576 ) ) ( not ( = ?auto_117574 ?auto_117577 ) ) ( not ( = ?auto_117574 ?auto_117578 ) ) ( not ( = ?auto_117575 ?auto_117576 ) ) ( not ( = ?auto_117575 ?auto_117577 ) ) ( not ( = ?auto_117575 ?auto_117578 ) ) ( not ( = ?auto_117576 ?auto_117577 ) ) ( not ( = ?auto_117576 ?auto_117578 ) ) ( not ( = ?auto_117577 ?auto_117578 ) ) ( ON ?auto_117568 ?auto_117579 ) ( not ( = ?auto_117578 ?auto_117579 ) ) ( not ( = ?auto_117577 ?auto_117579 ) ) ( not ( = ?auto_117576 ?auto_117579 ) ) ( not ( = ?auto_117575 ?auto_117579 ) ) ( not ( = ?auto_117574 ?auto_117579 ) ) ( not ( = ?auto_117573 ?auto_117579 ) ) ( not ( = ?auto_117572 ?auto_117579 ) ) ( not ( = ?auto_117571 ?auto_117579 ) ) ( not ( = ?auto_117570 ?auto_117579 ) ) ( not ( = ?auto_117569 ?auto_117579 ) ) ( not ( = ?auto_117568 ?auto_117579 ) ) ( ON ?auto_117569 ?auto_117568 ) ( ON ?auto_117570 ?auto_117569 ) ( ON ?auto_117571 ?auto_117570 ) ( ON ?auto_117572 ?auto_117571 ) ( ON ?auto_117573 ?auto_117572 ) ( ON ?auto_117574 ?auto_117573 ) ( ON ?auto_117575 ?auto_117574 ) ( ON ?auto_117576 ?auto_117575 ) ( ON ?auto_117577 ?auto_117576 ) ( ON ?auto_117578 ?auto_117577 ) ( CLEAR ?auto_117578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_117578 ?auto_117577 ?auto_117576 ?auto_117575 ?auto_117574 ?auto_117573 ?auto_117572 ?auto_117571 ?auto_117570 ?auto_117569 ?auto_117568 )
      ( MAKE-11PILE ?auto_117568 ?auto_117569 ?auto_117570 ?auto_117571 ?auto_117572 ?auto_117573 ?auto_117574 ?auto_117575 ?auto_117576 ?auto_117577 ?auto_117578 ) )
  )

)

