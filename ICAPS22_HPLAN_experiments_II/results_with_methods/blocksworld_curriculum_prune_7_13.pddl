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
      ?auto_26413 - BLOCK
    )
    :vars
    (
      ?auto_26414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26413 ?auto_26414 ) ( CLEAR ?auto_26413 ) ( HAND-EMPTY ) ( not ( = ?auto_26413 ?auto_26414 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26413 ?auto_26414 )
      ( !PUTDOWN ?auto_26413 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26420 - BLOCK
      ?auto_26421 - BLOCK
    )
    :vars
    (
      ?auto_26422 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_26420 ) ( ON ?auto_26421 ?auto_26422 ) ( CLEAR ?auto_26421 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26420 ) ( not ( = ?auto_26420 ?auto_26421 ) ) ( not ( = ?auto_26420 ?auto_26422 ) ) ( not ( = ?auto_26421 ?auto_26422 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26421 ?auto_26422 )
      ( !STACK ?auto_26421 ?auto_26420 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26430 - BLOCK
      ?auto_26431 - BLOCK
    )
    :vars
    (
      ?auto_26432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26431 ?auto_26432 ) ( not ( = ?auto_26430 ?auto_26431 ) ) ( not ( = ?auto_26430 ?auto_26432 ) ) ( not ( = ?auto_26431 ?auto_26432 ) ) ( ON ?auto_26430 ?auto_26431 ) ( CLEAR ?auto_26430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26430 )
      ( MAKE-2PILE ?auto_26430 ?auto_26431 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26441 - BLOCK
      ?auto_26442 - BLOCK
      ?auto_26443 - BLOCK
    )
    :vars
    (
      ?auto_26444 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_26442 ) ( ON ?auto_26443 ?auto_26444 ) ( CLEAR ?auto_26443 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26441 ) ( ON ?auto_26442 ?auto_26441 ) ( not ( = ?auto_26441 ?auto_26442 ) ) ( not ( = ?auto_26441 ?auto_26443 ) ) ( not ( = ?auto_26441 ?auto_26444 ) ) ( not ( = ?auto_26442 ?auto_26443 ) ) ( not ( = ?auto_26442 ?auto_26444 ) ) ( not ( = ?auto_26443 ?auto_26444 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26443 ?auto_26444 )
      ( !STACK ?auto_26443 ?auto_26442 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26455 - BLOCK
      ?auto_26456 - BLOCK
      ?auto_26457 - BLOCK
    )
    :vars
    (
      ?auto_26458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26457 ?auto_26458 ) ( ON-TABLE ?auto_26455 ) ( not ( = ?auto_26455 ?auto_26456 ) ) ( not ( = ?auto_26455 ?auto_26457 ) ) ( not ( = ?auto_26455 ?auto_26458 ) ) ( not ( = ?auto_26456 ?auto_26457 ) ) ( not ( = ?auto_26456 ?auto_26458 ) ) ( not ( = ?auto_26457 ?auto_26458 ) ) ( CLEAR ?auto_26455 ) ( ON ?auto_26456 ?auto_26457 ) ( CLEAR ?auto_26456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26455 ?auto_26456 )
      ( MAKE-3PILE ?auto_26455 ?auto_26456 ?auto_26457 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26469 - BLOCK
      ?auto_26470 - BLOCK
      ?auto_26471 - BLOCK
    )
    :vars
    (
      ?auto_26472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26471 ?auto_26472 ) ( not ( = ?auto_26469 ?auto_26470 ) ) ( not ( = ?auto_26469 ?auto_26471 ) ) ( not ( = ?auto_26469 ?auto_26472 ) ) ( not ( = ?auto_26470 ?auto_26471 ) ) ( not ( = ?auto_26470 ?auto_26472 ) ) ( not ( = ?auto_26471 ?auto_26472 ) ) ( ON ?auto_26470 ?auto_26471 ) ( ON ?auto_26469 ?auto_26470 ) ( CLEAR ?auto_26469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26469 )
      ( MAKE-3PILE ?auto_26469 ?auto_26470 ?auto_26471 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26484 - BLOCK
      ?auto_26485 - BLOCK
      ?auto_26486 - BLOCK
      ?auto_26487 - BLOCK
    )
    :vars
    (
      ?auto_26488 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_26486 ) ( ON ?auto_26487 ?auto_26488 ) ( CLEAR ?auto_26487 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26484 ) ( ON ?auto_26485 ?auto_26484 ) ( ON ?auto_26486 ?auto_26485 ) ( not ( = ?auto_26484 ?auto_26485 ) ) ( not ( = ?auto_26484 ?auto_26486 ) ) ( not ( = ?auto_26484 ?auto_26487 ) ) ( not ( = ?auto_26484 ?auto_26488 ) ) ( not ( = ?auto_26485 ?auto_26486 ) ) ( not ( = ?auto_26485 ?auto_26487 ) ) ( not ( = ?auto_26485 ?auto_26488 ) ) ( not ( = ?auto_26486 ?auto_26487 ) ) ( not ( = ?auto_26486 ?auto_26488 ) ) ( not ( = ?auto_26487 ?auto_26488 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26487 ?auto_26488 )
      ( !STACK ?auto_26487 ?auto_26486 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26502 - BLOCK
      ?auto_26503 - BLOCK
      ?auto_26504 - BLOCK
      ?auto_26505 - BLOCK
    )
    :vars
    (
      ?auto_26506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26505 ?auto_26506 ) ( ON-TABLE ?auto_26502 ) ( ON ?auto_26503 ?auto_26502 ) ( not ( = ?auto_26502 ?auto_26503 ) ) ( not ( = ?auto_26502 ?auto_26504 ) ) ( not ( = ?auto_26502 ?auto_26505 ) ) ( not ( = ?auto_26502 ?auto_26506 ) ) ( not ( = ?auto_26503 ?auto_26504 ) ) ( not ( = ?auto_26503 ?auto_26505 ) ) ( not ( = ?auto_26503 ?auto_26506 ) ) ( not ( = ?auto_26504 ?auto_26505 ) ) ( not ( = ?auto_26504 ?auto_26506 ) ) ( not ( = ?auto_26505 ?auto_26506 ) ) ( CLEAR ?auto_26503 ) ( ON ?auto_26504 ?auto_26505 ) ( CLEAR ?auto_26504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26502 ?auto_26503 ?auto_26504 )
      ( MAKE-4PILE ?auto_26502 ?auto_26503 ?auto_26504 ?auto_26505 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26520 - BLOCK
      ?auto_26521 - BLOCK
      ?auto_26522 - BLOCK
      ?auto_26523 - BLOCK
    )
    :vars
    (
      ?auto_26524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26523 ?auto_26524 ) ( ON-TABLE ?auto_26520 ) ( not ( = ?auto_26520 ?auto_26521 ) ) ( not ( = ?auto_26520 ?auto_26522 ) ) ( not ( = ?auto_26520 ?auto_26523 ) ) ( not ( = ?auto_26520 ?auto_26524 ) ) ( not ( = ?auto_26521 ?auto_26522 ) ) ( not ( = ?auto_26521 ?auto_26523 ) ) ( not ( = ?auto_26521 ?auto_26524 ) ) ( not ( = ?auto_26522 ?auto_26523 ) ) ( not ( = ?auto_26522 ?auto_26524 ) ) ( not ( = ?auto_26523 ?auto_26524 ) ) ( ON ?auto_26522 ?auto_26523 ) ( CLEAR ?auto_26520 ) ( ON ?auto_26521 ?auto_26522 ) ( CLEAR ?auto_26521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26520 ?auto_26521 )
      ( MAKE-4PILE ?auto_26520 ?auto_26521 ?auto_26522 ?auto_26523 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26538 - BLOCK
      ?auto_26539 - BLOCK
      ?auto_26540 - BLOCK
      ?auto_26541 - BLOCK
    )
    :vars
    (
      ?auto_26542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26541 ?auto_26542 ) ( not ( = ?auto_26538 ?auto_26539 ) ) ( not ( = ?auto_26538 ?auto_26540 ) ) ( not ( = ?auto_26538 ?auto_26541 ) ) ( not ( = ?auto_26538 ?auto_26542 ) ) ( not ( = ?auto_26539 ?auto_26540 ) ) ( not ( = ?auto_26539 ?auto_26541 ) ) ( not ( = ?auto_26539 ?auto_26542 ) ) ( not ( = ?auto_26540 ?auto_26541 ) ) ( not ( = ?auto_26540 ?auto_26542 ) ) ( not ( = ?auto_26541 ?auto_26542 ) ) ( ON ?auto_26540 ?auto_26541 ) ( ON ?auto_26539 ?auto_26540 ) ( ON ?auto_26538 ?auto_26539 ) ( CLEAR ?auto_26538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26538 )
      ( MAKE-4PILE ?auto_26538 ?auto_26539 ?auto_26540 ?auto_26541 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26557 - BLOCK
      ?auto_26558 - BLOCK
      ?auto_26559 - BLOCK
      ?auto_26560 - BLOCK
      ?auto_26561 - BLOCK
    )
    :vars
    (
      ?auto_26562 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_26560 ) ( ON ?auto_26561 ?auto_26562 ) ( CLEAR ?auto_26561 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26557 ) ( ON ?auto_26558 ?auto_26557 ) ( ON ?auto_26559 ?auto_26558 ) ( ON ?auto_26560 ?auto_26559 ) ( not ( = ?auto_26557 ?auto_26558 ) ) ( not ( = ?auto_26557 ?auto_26559 ) ) ( not ( = ?auto_26557 ?auto_26560 ) ) ( not ( = ?auto_26557 ?auto_26561 ) ) ( not ( = ?auto_26557 ?auto_26562 ) ) ( not ( = ?auto_26558 ?auto_26559 ) ) ( not ( = ?auto_26558 ?auto_26560 ) ) ( not ( = ?auto_26558 ?auto_26561 ) ) ( not ( = ?auto_26558 ?auto_26562 ) ) ( not ( = ?auto_26559 ?auto_26560 ) ) ( not ( = ?auto_26559 ?auto_26561 ) ) ( not ( = ?auto_26559 ?auto_26562 ) ) ( not ( = ?auto_26560 ?auto_26561 ) ) ( not ( = ?auto_26560 ?auto_26562 ) ) ( not ( = ?auto_26561 ?auto_26562 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26561 ?auto_26562 )
      ( !STACK ?auto_26561 ?auto_26560 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26579 - BLOCK
      ?auto_26580 - BLOCK
      ?auto_26581 - BLOCK
      ?auto_26582 - BLOCK
      ?auto_26583 - BLOCK
    )
    :vars
    (
      ?auto_26584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26583 ?auto_26584 ) ( ON-TABLE ?auto_26579 ) ( ON ?auto_26580 ?auto_26579 ) ( ON ?auto_26581 ?auto_26580 ) ( not ( = ?auto_26579 ?auto_26580 ) ) ( not ( = ?auto_26579 ?auto_26581 ) ) ( not ( = ?auto_26579 ?auto_26582 ) ) ( not ( = ?auto_26579 ?auto_26583 ) ) ( not ( = ?auto_26579 ?auto_26584 ) ) ( not ( = ?auto_26580 ?auto_26581 ) ) ( not ( = ?auto_26580 ?auto_26582 ) ) ( not ( = ?auto_26580 ?auto_26583 ) ) ( not ( = ?auto_26580 ?auto_26584 ) ) ( not ( = ?auto_26581 ?auto_26582 ) ) ( not ( = ?auto_26581 ?auto_26583 ) ) ( not ( = ?auto_26581 ?auto_26584 ) ) ( not ( = ?auto_26582 ?auto_26583 ) ) ( not ( = ?auto_26582 ?auto_26584 ) ) ( not ( = ?auto_26583 ?auto_26584 ) ) ( CLEAR ?auto_26581 ) ( ON ?auto_26582 ?auto_26583 ) ( CLEAR ?auto_26582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26579 ?auto_26580 ?auto_26581 ?auto_26582 )
      ( MAKE-5PILE ?auto_26579 ?auto_26580 ?auto_26581 ?auto_26582 ?auto_26583 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26601 - BLOCK
      ?auto_26602 - BLOCK
      ?auto_26603 - BLOCK
      ?auto_26604 - BLOCK
      ?auto_26605 - BLOCK
    )
    :vars
    (
      ?auto_26606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26605 ?auto_26606 ) ( ON-TABLE ?auto_26601 ) ( ON ?auto_26602 ?auto_26601 ) ( not ( = ?auto_26601 ?auto_26602 ) ) ( not ( = ?auto_26601 ?auto_26603 ) ) ( not ( = ?auto_26601 ?auto_26604 ) ) ( not ( = ?auto_26601 ?auto_26605 ) ) ( not ( = ?auto_26601 ?auto_26606 ) ) ( not ( = ?auto_26602 ?auto_26603 ) ) ( not ( = ?auto_26602 ?auto_26604 ) ) ( not ( = ?auto_26602 ?auto_26605 ) ) ( not ( = ?auto_26602 ?auto_26606 ) ) ( not ( = ?auto_26603 ?auto_26604 ) ) ( not ( = ?auto_26603 ?auto_26605 ) ) ( not ( = ?auto_26603 ?auto_26606 ) ) ( not ( = ?auto_26604 ?auto_26605 ) ) ( not ( = ?auto_26604 ?auto_26606 ) ) ( not ( = ?auto_26605 ?auto_26606 ) ) ( ON ?auto_26604 ?auto_26605 ) ( CLEAR ?auto_26602 ) ( ON ?auto_26603 ?auto_26604 ) ( CLEAR ?auto_26603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26601 ?auto_26602 ?auto_26603 )
      ( MAKE-5PILE ?auto_26601 ?auto_26602 ?auto_26603 ?auto_26604 ?auto_26605 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26623 - BLOCK
      ?auto_26624 - BLOCK
      ?auto_26625 - BLOCK
      ?auto_26626 - BLOCK
      ?auto_26627 - BLOCK
    )
    :vars
    (
      ?auto_26628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26627 ?auto_26628 ) ( ON-TABLE ?auto_26623 ) ( not ( = ?auto_26623 ?auto_26624 ) ) ( not ( = ?auto_26623 ?auto_26625 ) ) ( not ( = ?auto_26623 ?auto_26626 ) ) ( not ( = ?auto_26623 ?auto_26627 ) ) ( not ( = ?auto_26623 ?auto_26628 ) ) ( not ( = ?auto_26624 ?auto_26625 ) ) ( not ( = ?auto_26624 ?auto_26626 ) ) ( not ( = ?auto_26624 ?auto_26627 ) ) ( not ( = ?auto_26624 ?auto_26628 ) ) ( not ( = ?auto_26625 ?auto_26626 ) ) ( not ( = ?auto_26625 ?auto_26627 ) ) ( not ( = ?auto_26625 ?auto_26628 ) ) ( not ( = ?auto_26626 ?auto_26627 ) ) ( not ( = ?auto_26626 ?auto_26628 ) ) ( not ( = ?auto_26627 ?auto_26628 ) ) ( ON ?auto_26626 ?auto_26627 ) ( ON ?auto_26625 ?auto_26626 ) ( CLEAR ?auto_26623 ) ( ON ?auto_26624 ?auto_26625 ) ( CLEAR ?auto_26624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26623 ?auto_26624 )
      ( MAKE-5PILE ?auto_26623 ?auto_26624 ?auto_26625 ?auto_26626 ?auto_26627 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26645 - BLOCK
      ?auto_26646 - BLOCK
      ?auto_26647 - BLOCK
      ?auto_26648 - BLOCK
      ?auto_26649 - BLOCK
    )
    :vars
    (
      ?auto_26650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26649 ?auto_26650 ) ( not ( = ?auto_26645 ?auto_26646 ) ) ( not ( = ?auto_26645 ?auto_26647 ) ) ( not ( = ?auto_26645 ?auto_26648 ) ) ( not ( = ?auto_26645 ?auto_26649 ) ) ( not ( = ?auto_26645 ?auto_26650 ) ) ( not ( = ?auto_26646 ?auto_26647 ) ) ( not ( = ?auto_26646 ?auto_26648 ) ) ( not ( = ?auto_26646 ?auto_26649 ) ) ( not ( = ?auto_26646 ?auto_26650 ) ) ( not ( = ?auto_26647 ?auto_26648 ) ) ( not ( = ?auto_26647 ?auto_26649 ) ) ( not ( = ?auto_26647 ?auto_26650 ) ) ( not ( = ?auto_26648 ?auto_26649 ) ) ( not ( = ?auto_26648 ?auto_26650 ) ) ( not ( = ?auto_26649 ?auto_26650 ) ) ( ON ?auto_26648 ?auto_26649 ) ( ON ?auto_26647 ?auto_26648 ) ( ON ?auto_26646 ?auto_26647 ) ( ON ?auto_26645 ?auto_26646 ) ( CLEAR ?auto_26645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26645 )
      ( MAKE-5PILE ?auto_26645 ?auto_26646 ?auto_26647 ?auto_26648 ?auto_26649 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_26668 - BLOCK
      ?auto_26669 - BLOCK
      ?auto_26670 - BLOCK
      ?auto_26671 - BLOCK
      ?auto_26672 - BLOCK
      ?auto_26673 - BLOCK
    )
    :vars
    (
      ?auto_26674 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_26672 ) ( ON ?auto_26673 ?auto_26674 ) ( CLEAR ?auto_26673 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26668 ) ( ON ?auto_26669 ?auto_26668 ) ( ON ?auto_26670 ?auto_26669 ) ( ON ?auto_26671 ?auto_26670 ) ( ON ?auto_26672 ?auto_26671 ) ( not ( = ?auto_26668 ?auto_26669 ) ) ( not ( = ?auto_26668 ?auto_26670 ) ) ( not ( = ?auto_26668 ?auto_26671 ) ) ( not ( = ?auto_26668 ?auto_26672 ) ) ( not ( = ?auto_26668 ?auto_26673 ) ) ( not ( = ?auto_26668 ?auto_26674 ) ) ( not ( = ?auto_26669 ?auto_26670 ) ) ( not ( = ?auto_26669 ?auto_26671 ) ) ( not ( = ?auto_26669 ?auto_26672 ) ) ( not ( = ?auto_26669 ?auto_26673 ) ) ( not ( = ?auto_26669 ?auto_26674 ) ) ( not ( = ?auto_26670 ?auto_26671 ) ) ( not ( = ?auto_26670 ?auto_26672 ) ) ( not ( = ?auto_26670 ?auto_26673 ) ) ( not ( = ?auto_26670 ?auto_26674 ) ) ( not ( = ?auto_26671 ?auto_26672 ) ) ( not ( = ?auto_26671 ?auto_26673 ) ) ( not ( = ?auto_26671 ?auto_26674 ) ) ( not ( = ?auto_26672 ?auto_26673 ) ) ( not ( = ?auto_26672 ?auto_26674 ) ) ( not ( = ?auto_26673 ?auto_26674 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26673 ?auto_26674 )
      ( !STACK ?auto_26673 ?auto_26672 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_26694 - BLOCK
      ?auto_26695 - BLOCK
      ?auto_26696 - BLOCK
      ?auto_26697 - BLOCK
      ?auto_26698 - BLOCK
      ?auto_26699 - BLOCK
    )
    :vars
    (
      ?auto_26700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26699 ?auto_26700 ) ( ON-TABLE ?auto_26694 ) ( ON ?auto_26695 ?auto_26694 ) ( ON ?auto_26696 ?auto_26695 ) ( ON ?auto_26697 ?auto_26696 ) ( not ( = ?auto_26694 ?auto_26695 ) ) ( not ( = ?auto_26694 ?auto_26696 ) ) ( not ( = ?auto_26694 ?auto_26697 ) ) ( not ( = ?auto_26694 ?auto_26698 ) ) ( not ( = ?auto_26694 ?auto_26699 ) ) ( not ( = ?auto_26694 ?auto_26700 ) ) ( not ( = ?auto_26695 ?auto_26696 ) ) ( not ( = ?auto_26695 ?auto_26697 ) ) ( not ( = ?auto_26695 ?auto_26698 ) ) ( not ( = ?auto_26695 ?auto_26699 ) ) ( not ( = ?auto_26695 ?auto_26700 ) ) ( not ( = ?auto_26696 ?auto_26697 ) ) ( not ( = ?auto_26696 ?auto_26698 ) ) ( not ( = ?auto_26696 ?auto_26699 ) ) ( not ( = ?auto_26696 ?auto_26700 ) ) ( not ( = ?auto_26697 ?auto_26698 ) ) ( not ( = ?auto_26697 ?auto_26699 ) ) ( not ( = ?auto_26697 ?auto_26700 ) ) ( not ( = ?auto_26698 ?auto_26699 ) ) ( not ( = ?auto_26698 ?auto_26700 ) ) ( not ( = ?auto_26699 ?auto_26700 ) ) ( CLEAR ?auto_26697 ) ( ON ?auto_26698 ?auto_26699 ) ( CLEAR ?auto_26698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26694 ?auto_26695 ?auto_26696 ?auto_26697 ?auto_26698 )
      ( MAKE-6PILE ?auto_26694 ?auto_26695 ?auto_26696 ?auto_26697 ?auto_26698 ?auto_26699 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_26720 - BLOCK
      ?auto_26721 - BLOCK
      ?auto_26722 - BLOCK
      ?auto_26723 - BLOCK
      ?auto_26724 - BLOCK
      ?auto_26725 - BLOCK
    )
    :vars
    (
      ?auto_26726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26725 ?auto_26726 ) ( ON-TABLE ?auto_26720 ) ( ON ?auto_26721 ?auto_26720 ) ( ON ?auto_26722 ?auto_26721 ) ( not ( = ?auto_26720 ?auto_26721 ) ) ( not ( = ?auto_26720 ?auto_26722 ) ) ( not ( = ?auto_26720 ?auto_26723 ) ) ( not ( = ?auto_26720 ?auto_26724 ) ) ( not ( = ?auto_26720 ?auto_26725 ) ) ( not ( = ?auto_26720 ?auto_26726 ) ) ( not ( = ?auto_26721 ?auto_26722 ) ) ( not ( = ?auto_26721 ?auto_26723 ) ) ( not ( = ?auto_26721 ?auto_26724 ) ) ( not ( = ?auto_26721 ?auto_26725 ) ) ( not ( = ?auto_26721 ?auto_26726 ) ) ( not ( = ?auto_26722 ?auto_26723 ) ) ( not ( = ?auto_26722 ?auto_26724 ) ) ( not ( = ?auto_26722 ?auto_26725 ) ) ( not ( = ?auto_26722 ?auto_26726 ) ) ( not ( = ?auto_26723 ?auto_26724 ) ) ( not ( = ?auto_26723 ?auto_26725 ) ) ( not ( = ?auto_26723 ?auto_26726 ) ) ( not ( = ?auto_26724 ?auto_26725 ) ) ( not ( = ?auto_26724 ?auto_26726 ) ) ( not ( = ?auto_26725 ?auto_26726 ) ) ( ON ?auto_26724 ?auto_26725 ) ( CLEAR ?auto_26722 ) ( ON ?auto_26723 ?auto_26724 ) ( CLEAR ?auto_26723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26720 ?auto_26721 ?auto_26722 ?auto_26723 )
      ( MAKE-6PILE ?auto_26720 ?auto_26721 ?auto_26722 ?auto_26723 ?auto_26724 ?auto_26725 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_26746 - BLOCK
      ?auto_26747 - BLOCK
      ?auto_26748 - BLOCK
      ?auto_26749 - BLOCK
      ?auto_26750 - BLOCK
      ?auto_26751 - BLOCK
    )
    :vars
    (
      ?auto_26752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26751 ?auto_26752 ) ( ON-TABLE ?auto_26746 ) ( ON ?auto_26747 ?auto_26746 ) ( not ( = ?auto_26746 ?auto_26747 ) ) ( not ( = ?auto_26746 ?auto_26748 ) ) ( not ( = ?auto_26746 ?auto_26749 ) ) ( not ( = ?auto_26746 ?auto_26750 ) ) ( not ( = ?auto_26746 ?auto_26751 ) ) ( not ( = ?auto_26746 ?auto_26752 ) ) ( not ( = ?auto_26747 ?auto_26748 ) ) ( not ( = ?auto_26747 ?auto_26749 ) ) ( not ( = ?auto_26747 ?auto_26750 ) ) ( not ( = ?auto_26747 ?auto_26751 ) ) ( not ( = ?auto_26747 ?auto_26752 ) ) ( not ( = ?auto_26748 ?auto_26749 ) ) ( not ( = ?auto_26748 ?auto_26750 ) ) ( not ( = ?auto_26748 ?auto_26751 ) ) ( not ( = ?auto_26748 ?auto_26752 ) ) ( not ( = ?auto_26749 ?auto_26750 ) ) ( not ( = ?auto_26749 ?auto_26751 ) ) ( not ( = ?auto_26749 ?auto_26752 ) ) ( not ( = ?auto_26750 ?auto_26751 ) ) ( not ( = ?auto_26750 ?auto_26752 ) ) ( not ( = ?auto_26751 ?auto_26752 ) ) ( ON ?auto_26750 ?auto_26751 ) ( ON ?auto_26749 ?auto_26750 ) ( CLEAR ?auto_26747 ) ( ON ?auto_26748 ?auto_26749 ) ( CLEAR ?auto_26748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26746 ?auto_26747 ?auto_26748 )
      ( MAKE-6PILE ?auto_26746 ?auto_26747 ?auto_26748 ?auto_26749 ?auto_26750 ?auto_26751 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_26772 - BLOCK
      ?auto_26773 - BLOCK
      ?auto_26774 - BLOCK
      ?auto_26775 - BLOCK
      ?auto_26776 - BLOCK
      ?auto_26777 - BLOCK
    )
    :vars
    (
      ?auto_26778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26777 ?auto_26778 ) ( ON-TABLE ?auto_26772 ) ( not ( = ?auto_26772 ?auto_26773 ) ) ( not ( = ?auto_26772 ?auto_26774 ) ) ( not ( = ?auto_26772 ?auto_26775 ) ) ( not ( = ?auto_26772 ?auto_26776 ) ) ( not ( = ?auto_26772 ?auto_26777 ) ) ( not ( = ?auto_26772 ?auto_26778 ) ) ( not ( = ?auto_26773 ?auto_26774 ) ) ( not ( = ?auto_26773 ?auto_26775 ) ) ( not ( = ?auto_26773 ?auto_26776 ) ) ( not ( = ?auto_26773 ?auto_26777 ) ) ( not ( = ?auto_26773 ?auto_26778 ) ) ( not ( = ?auto_26774 ?auto_26775 ) ) ( not ( = ?auto_26774 ?auto_26776 ) ) ( not ( = ?auto_26774 ?auto_26777 ) ) ( not ( = ?auto_26774 ?auto_26778 ) ) ( not ( = ?auto_26775 ?auto_26776 ) ) ( not ( = ?auto_26775 ?auto_26777 ) ) ( not ( = ?auto_26775 ?auto_26778 ) ) ( not ( = ?auto_26776 ?auto_26777 ) ) ( not ( = ?auto_26776 ?auto_26778 ) ) ( not ( = ?auto_26777 ?auto_26778 ) ) ( ON ?auto_26776 ?auto_26777 ) ( ON ?auto_26775 ?auto_26776 ) ( ON ?auto_26774 ?auto_26775 ) ( CLEAR ?auto_26772 ) ( ON ?auto_26773 ?auto_26774 ) ( CLEAR ?auto_26773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26772 ?auto_26773 )
      ( MAKE-6PILE ?auto_26772 ?auto_26773 ?auto_26774 ?auto_26775 ?auto_26776 ?auto_26777 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_26798 - BLOCK
      ?auto_26799 - BLOCK
      ?auto_26800 - BLOCK
      ?auto_26801 - BLOCK
      ?auto_26802 - BLOCK
      ?auto_26803 - BLOCK
    )
    :vars
    (
      ?auto_26804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26803 ?auto_26804 ) ( not ( = ?auto_26798 ?auto_26799 ) ) ( not ( = ?auto_26798 ?auto_26800 ) ) ( not ( = ?auto_26798 ?auto_26801 ) ) ( not ( = ?auto_26798 ?auto_26802 ) ) ( not ( = ?auto_26798 ?auto_26803 ) ) ( not ( = ?auto_26798 ?auto_26804 ) ) ( not ( = ?auto_26799 ?auto_26800 ) ) ( not ( = ?auto_26799 ?auto_26801 ) ) ( not ( = ?auto_26799 ?auto_26802 ) ) ( not ( = ?auto_26799 ?auto_26803 ) ) ( not ( = ?auto_26799 ?auto_26804 ) ) ( not ( = ?auto_26800 ?auto_26801 ) ) ( not ( = ?auto_26800 ?auto_26802 ) ) ( not ( = ?auto_26800 ?auto_26803 ) ) ( not ( = ?auto_26800 ?auto_26804 ) ) ( not ( = ?auto_26801 ?auto_26802 ) ) ( not ( = ?auto_26801 ?auto_26803 ) ) ( not ( = ?auto_26801 ?auto_26804 ) ) ( not ( = ?auto_26802 ?auto_26803 ) ) ( not ( = ?auto_26802 ?auto_26804 ) ) ( not ( = ?auto_26803 ?auto_26804 ) ) ( ON ?auto_26802 ?auto_26803 ) ( ON ?auto_26801 ?auto_26802 ) ( ON ?auto_26800 ?auto_26801 ) ( ON ?auto_26799 ?auto_26800 ) ( ON ?auto_26798 ?auto_26799 ) ( CLEAR ?auto_26798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26798 )
      ( MAKE-6PILE ?auto_26798 ?auto_26799 ?auto_26800 ?auto_26801 ?auto_26802 ?auto_26803 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_26825 - BLOCK
      ?auto_26826 - BLOCK
      ?auto_26827 - BLOCK
      ?auto_26828 - BLOCK
      ?auto_26829 - BLOCK
      ?auto_26830 - BLOCK
      ?auto_26831 - BLOCK
    )
    :vars
    (
      ?auto_26832 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_26830 ) ( ON ?auto_26831 ?auto_26832 ) ( CLEAR ?auto_26831 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26825 ) ( ON ?auto_26826 ?auto_26825 ) ( ON ?auto_26827 ?auto_26826 ) ( ON ?auto_26828 ?auto_26827 ) ( ON ?auto_26829 ?auto_26828 ) ( ON ?auto_26830 ?auto_26829 ) ( not ( = ?auto_26825 ?auto_26826 ) ) ( not ( = ?auto_26825 ?auto_26827 ) ) ( not ( = ?auto_26825 ?auto_26828 ) ) ( not ( = ?auto_26825 ?auto_26829 ) ) ( not ( = ?auto_26825 ?auto_26830 ) ) ( not ( = ?auto_26825 ?auto_26831 ) ) ( not ( = ?auto_26825 ?auto_26832 ) ) ( not ( = ?auto_26826 ?auto_26827 ) ) ( not ( = ?auto_26826 ?auto_26828 ) ) ( not ( = ?auto_26826 ?auto_26829 ) ) ( not ( = ?auto_26826 ?auto_26830 ) ) ( not ( = ?auto_26826 ?auto_26831 ) ) ( not ( = ?auto_26826 ?auto_26832 ) ) ( not ( = ?auto_26827 ?auto_26828 ) ) ( not ( = ?auto_26827 ?auto_26829 ) ) ( not ( = ?auto_26827 ?auto_26830 ) ) ( not ( = ?auto_26827 ?auto_26831 ) ) ( not ( = ?auto_26827 ?auto_26832 ) ) ( not ( = ?auto_26828 ?auto_26829 ) ) ( not ( = ?auto_26828 ?auto_26830 ) ) ( not ( = ?auto_26828 ?auto_26831 ) ) ( not ( = ?auto_26828 ?auto_26832 ) ) ( not ( = ?auto_26829 ?auto_26830 ) ) ( not ( = ?auto_26829 ?auto_26831 ) ) ( not ( = ?auto_26829 ?auto_26832 ) ) ( not ( = ?auto_26830 ?auto_26831 ) ) ( not ( = ?auto_26830 ?auto_26832 ) ) ( not ( = ?auto_26831 ?auto_26832 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26831 ?auto_26832 )
      ( !STACK ?auto_26831 ?auto_26830 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_26840 - BLOCK
      ?auto_26841 - BLOCK
      ?auto_26842 - BLOCK
      ?auto_26843 - BLOCK
      ?auto_26844 - BLOCK
      ?auto_26845 - BLOCK
      ?auto_26846 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_26845 ) ( ON-TABLE ?auto_26846 ) ( CLEAR ?auto_26846 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26840 ) ( ON ?auto_26841 ?auto_26840 ) ( ON ?auto_26842 ?auto_26841 ) ( ON ?auto_26843 ?auto_26842 ) ( ON ?auto_26844 ?auto_26843 ) ( ON ?auto_26845 ?auto_26844 ) ( not ( = ?auto_26840 ?auto_26841 ) ) ( not ( = ?auto_26840 ?auto_26842 ) ) ( not ( = ?auto_26840 ?auto_26843 ) ) ( not ( = ?auto_26840 ?auto_26844 ) ) ( not ( = ?auto_26840 ?auto_26845 ) ) ( not ( = ?auto_26840 ?auto_26846 ) ) ( not ( = ?auto_26841 ?auto_26842 ) ) ( not ( = ?auto_26841 ?auto_26843 ) ) ( not ( = ?auto_26841 ?auto_26844 ) ) ( not ( = ?auto_26841 ?auto_26845 ) ) ( not ( = ?auto_26841 ?auto_26846 ) ) ( not ( = ?auto_26842 ?auto_26843 ) ) ( not ( = ?auto_26842 ?auto_26844 ) ) ( not ( = ?auto_26842 ?auto_26845 ) ) ( not ( = ?auto_26842 ?auto_26846 ) ) ( not ( = ?auto_26843 ?auto_26844 ) ) ( not ( = ?auto_26843 ?auto_26845 ) ) ( not ( = ?auto_26843 ?auto_26846 ) ) ( not ( = ?auto_26844 ?auto_26845 ) ) ( not ( = ?auto_26844 ?auto_26846 ) ) ( not ( = ?auto_26845 ?auto_26846 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_26846 )
      ( !STACK ?auto_26846 ?auto_26845 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_26854 - BLOCK
      ?auto_26855 - BLOCK
      ?auto_26856 - BLOCK
      ?auto_26857 - BLOCK
      ?auto_26858 - BLOCK
      ?auto_26859 - BLOCK
      ?auto_26860 - BLOCK
    )
    :vars
    (
      ?auto_26861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26860 ?auto_26861 ) ( ON-TABLE ?auto_26854 ) ( ON ?auto_26855 ?auto_26854 ) ( ON ?auto_26856 ?auto_26855 ) ( ON ?auto_26857 ?auto_26856 ) ( ON ?auto_26858 ?auto_26857 ) ( not ( = ?auto_26854 ?auto_26855 ) ) ( not ( = ?auto_26854 ?auto_26856 ) ) ( not ( = ?auto_26854 ?auto_26857 ) ) ( not ( = ?auto_26854 ?auto_26858 ) ) ( not ( = ?auto_26854 ?auto_26859 ) ) ( not ( = ?auto_26854 ?auto_26860 ) ) ( not ( = ?auto_26854 ?auto_26861 ) ) ( not ( = ?auto_26855 ?auto_26856 ) ) ( not ( = ?auto_26855 ?auto_26857 ) ) ( not ( = ?auto_26855 ?auto_26858 ) ) ( not ( = ?auto_26855 ?auto_26859 ) ) ( not ( = ?auto_26855 ?auto_26860 ) ) ( not ( = ?auto_26855 ?auto_26861 ) ) ( not ( = ?auto_26856 ?auto_26857 ) ) ( not ( = ?auto_26856 ?auto_26858 ) ) ( not ( = ?auto_26856 ?auto_26859 ) ) ( not ( = ?auto_26856 ?auto_26860 ) ) ( not ( = ?auto_26856 ?auto_26861 ) ) ( not ( = ?auto_26857 ?auto_26858 ) ) ( not ( = ?auto_26857 ?auto_26859 ) ) ( not ( = ?auto_26857 ?auto_26860 ) ) ( not ( = ?auto_26857 ?auto_26861 ) ) ( not ( = ?auto_26858 ?auto_26859 ) ) ( not ( = ?auto_26858 ?auto_26860 ) ) ( not ( = ?auto_26858 ?auto_26861 ) ) ( not ( = ?auto_26859 ?auto_26860 ) ) ( not ( = ?auto_26859 ?auto_26861 ) ) ( not ( = ?auto_26860 ?auto_26861 ) ) ( CLEAR ?auto_26858 ) ( ON ?auto_26859 ?auto_26860 ) ( CLEAR ?auto_26859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_26854 ?auto_26855 ?auto_26856 ?auto_26857 ?auto_26858 ?auto_26859 )
      ( MAKE-7PILE ?auto_26854 ?auto_26855 ?auto_26856 ?auto_26857 ?auto_26858 ?auto_26859 ?auto_26860 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_26869 - BLOCK
      ?auto_26870 - BLOCK
      ?auto_26871 - BLOCK
      ?auto_26872 - BLOCK
      ?auto_26873 - BLOCK
      ?auto_26874 - BLOCK
      ?auto_26875 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26875 ) ( ON-TABLE ?auto_26869 ) ( ON ?auto_26870 ?auto_26869 ) ( ON ?auto_26871 ?auto_26870 ) ( ON ?auto_26872 ?auto_26871 ) ( ON ?auto_26873 ?auto_26872 ) ( not ( = ?auto_26869 ?auto_26870 ) ) ( not ( = ?auto_26869 ?auto_26871 ) ) ( not ( = ?auto_26869 ?auto_26872 ) ) ( not ( = ?auto_26869 ?auto_26873 ) ) ( not ( = ?auto_26869 ?auto_26874 ) ) ( not ( = ?auto_26869 ?auto_26875 ) ) ( not ( = ?auto_26870 ?auto_26871 ) ) ( not ( = ?auto_26870 ?auto_26872 ) ) ( not ( = ?auto_26870 ?auto_26873 ) ) ( not ( = ?auto_26870 ?auto_26874 ) ) ( not ( = ?auto_26870 ?auto_26875 ) ) ( not ( = ?auto_26871 ?auto_26872 ) ) ( not ( = ?auto_26871 ?auto_26873 ) ) ( not ( = ?auto_26871 ?auto_26874 ) ) ( not ( = ?auto_26871 ?auto_26875 ) ) ( not ( = ?auto_26872 ?auto_26873 ) ) ( not ( = ?auto_26872 ?auto_26874 ) ) ( not ( = ?auto_26872 ?auto_26875 ) ) ( not ( = ?auto_26873 ?auto_26874 ) ) ( not ( = ?auto_26873 ?auto_26875 ) ) ( not ( = ?auto_26874 ?auto_26875 ) ) ( CLEAR ?auto_26873 ) ( ON ?auto_26874 ?auto_26875 ) ( CLEAR ?auto_26874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_26869 ?auto_26870 ?auto_26871 ?auto_26872 ?auto_26873 ?auto_26874 )
      ( MAKE-7PILE ?auto_26869 ?auto_26870 ?auto_26871 ?auto_26872 ?auto_26873 ?auto_26874 ?auto_26875 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_26883 - BLOCK
      ?auto_26884 - BLOCK
      ?auto_26885 - BLOCK
      ?auto_26886 - BLOCK
      ?auto_26887 - BLOCK
      ?auto_26888 - BLOCK
      ?auto_26889 - BLOCK
    )
    :vars
    (
      ?auto_26890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26889 ?auto_26890 ) ( ON-TABLE ?auto_26883 ) ( ON ?auto_26884 ?auto_26883 ) ( ON ?auto_26885 ?auto_26884 ) ( ON ?auto_26886 ?auto_26885 ) ( not ( = ?auto_26883 ?auto_26884 ) ) ( not ( = ?auto_26883 ?auto_26885 ) ) ( not ( = ?auto_26883 ?auto_26886 ) ) ( not ( = ?auto_26883 ?auto_26887 ) ) ( not ( = ?auto_26883 ?auto_26888 ) ) ( not ( = ?auto_26883 ?auto_26889 ) ) ( not ( = ?auto_26883 ?auto_26890 ) ) ( not ( = ?auto_26884 ?auto_26885 ) ) ( not ( = ?auto_26884 ?auto_26886 ) ) ( not ( = ?auto_26884 ?auto_26887 ) ) ( not ( = ?auto_26884 ?auto_26888 ) ) ( not ( = ?auto_26884 ?auto_26889 ) ) ( not ( = ?auto_26884 ?auto_26890 ) ) ( not ( = ?auto_26885 ?auto_26886 ) ) ( not ( = ?auto_26885 ?auto_26887 ) ) ( not ( = ?auto_26885 ?auto_26888 ) ) ( not ( = ?auto_26885 ?auto_26889 ) ) ( not ( = ?auto_26885 ?auto_26890 ) ) ( not ( = ?auto_26886 ?auto_26887 ) ) ( not ( = ?auto_26886 ?auto_26888 ) ) ( not ( = ?auto_26886 ?auto_26889 ) ) ( not ( = ?auto_26886 ?auto_26890 ) ) ( not ( = ?auto_26887 ?auto_26888 ) ) ( not ( = ?auto_26887 ?auto_26889 ) ) ( not ( = ?auto_26887 ?auto_26890 ) ) ( not ( = ?auto_26888 ?auto_26889 ) ) ( not ( = ?auto_26888 ?auto_26890 ) ) ( not ( = ?auto_26889 ?auto_26890 ) ) ( ON ?auto_26888 ?auto_26889 ) ( CLEAR ?auto_26886 ) ( ON ?auto_26887 ?auto_26888 ) ( CLEAR ?auto_26887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26883 ?auto_26884 ?auto_26885 ?auto_26886 ?auto_26887 )
      ( MAKE-7PILE ?auto_26883 ?auto_26884 ?auto_26885 ?auto_26886 ?auto_26887 ?auto_26888 ?auto_26889 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_26898 - BLOCK
      ?auto_26899 - BLOCK
      ?auto_26900 - BLOCK
      ?auto_26901 - BLOCK
      ?auto_26902 - BLOCK
      ?auto_26903 - BLOCK
      ?auto_26904 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26904 ) ( ON-TABLE ?auto_26898 ) ( ON ?auto_26899 ?auto_26898 ) ( ON ?auto_26900 ?auto_26899 ) ( ON ?auto_26901 ?auto_26900 ) ( not ( = ?auto_26898 ?auto_26899 ) ) ( not ( = ?auto_26898 ?auto_26900 ) ) ( not ( = ?auto_26898 ?auto_26901 ) ) ( not ( = ?auto_26898 ?auto_26902 ) ) ( not ( = ?auto_26898 ?auto_26903 ) ) ( not ( = ?auto_26898 ?auto_26904 ) ) ( not ( = ?auto_26899 ?auto_26900 ) ) ( not ( = ?auto_26899 ?auto_26901 ) ) ( not ( = ?auto_26899 ?auto_26902 ) ) ( not ( = ?auto_26899 ?auto_26903 ) ) ( not ( = ?auto_26899 ?auto_26904 ) ) ( not ( = ?auto_26900 ?auto_26901 ) ) ( not ( = ?auto_26900 ?auto_26902 ) ) ( not ( = ?auto_26900 ?auto_26903 ) ) ( not ( = ?auto_26900 ?auto_26904 ) ) ( not ( = ?auto_26901 ?auto_26902 ) ) ( not ( = ?auto_26901 ?auto_26903 ) ) ( not ( = ?auto_26901 ?auto_26904 ) ) ( not ( = ?auto_26902 ?auto_26903 ) ) ( not ( = ?auto_26902 ?auto_26904 ) ) ( not ( = ?auto_26903 ?auto_26904 ) ) ( ON ?auto_26903 ?auto_26904 ) ( CLEAR ?auto_26901 ) ( ON ?auto_26902 ?auto_26903 ) ( CLEAR ?auto_26902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26898 ?auto_26899 ?auto_26900 ?auto_26901 ?auto_26902 )
      ( MAKE-7PILE ?auto_26898 ?auto_26899 ?auto_26900 ?auto_26901 ?auto_26902 ?auto_26903 ?auto_26904 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_26912 - BLOCK
      ?auto_26913 - BLOCK
      ?auto_26914 - BLOCK
      ?auto_26915 - BLOCK
      ?auto_26916 - BLOCK
      ?auto_26917 - BLOCK
      ?auto_26918 - BLOCK
    )
    :vars
    (
      ?auto_26919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26918 ?auto_26919 ) ( ON-TABLE ?auto_26912 ) ( ON ?auto_26913 ?auto_26912 ) ( ON ?auto_26914 ?auto_26913 ) ( not ( = ?auto_26912 ?auto_26913 ) ) ( not ( = ?auto_26912 ?auto_26914 ) ) ( not ( = ?auto_26912 ?auto_26915 ) ) ( not ( = ?auto_26912 ?auto_26916 ) ) ( not ( = ?auto_26912 ?auto_26917 ) ) ( not ( = ?auto_26912 ?auto_26918 ) ) ( not ( = ?auto_26912 ?auto_26919 ) ) ( not ( = ?auto_26913 ?auto_26914 ) ) ( not ( = ?auto_26913 ?auto_26915 ) ) ( not ( = ?auto_26913 ?auto_26916 ) ) ( not ( = ?auto_26913 ?auto_26917 ) ) ( not ( = ?auto_26913 ?auto_26918 ) ) ( not ( = ?auto_26913 ?auto_26919 ) ) ( not ( = ?auto_26914 ?auto_26915 ) ) ( not ( = ?auto_26914 ?auto_26916 ) ) ( not ( = ?auto_26914 ?auto_26917 ) ) ( not ( = ?auto_26914 ?auto_26918 ) ) ( not ( = ?auto_26914 ?auto_26919 ) ) ( not ( = ?auto_26915 ?auto_26916 ) ) ( not ( = ?auto_26915 ?auto_26917 ) ) ( not ( = ?auto_26915 ?auto_26918 ) ) ( not ( = ?auto_26915 ?auto_26919 ) ) ( not ( = ?auto_26916 ?auto_26917 ) ) ( not ( = ?auto_26916 ?auto_26918 ) ) ( not ( = ?auto_26916 ?auto_26919 ) ) ( not ( = ?auto_26917 ?auto_26918 ) ) ( not ( = ?auto_26917 ?auto_26919 ) ) ( not ( = ?auto_26918 ?auto_26919 ) ) ( ON ?auto_26917 ?auto_26918 ) ( ON ?auto_26916 ?auto_26917 ) ( CLEAR ?auto_26914 ) ( ON ?auto_26915 ?auto_26916 ) ( CLEAR ?auto_26915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26912 ?auto_26913 ?auto_26914 ?auto_26915 )
      ( MAKE-7PILE ?auto_26912 ?auto_26913 ?auto_26914 ?auto_26915 ?auto_26916 ?auto_26917 ?auto_26918 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_26927 - BLOCK
      ?auto_26928 - BLOCK
      ?auto_26929 - BLOCK
      ?auto_26930 - BLOCK
      ?auto_26931 - BLOCK
      ?auto_26932 - BLOCK
      ?auto_26933 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26933 ) ( ON-TABLE ?auto_26927 ) ( ON ?auto_26928 ?auto_26927 ) ( ON ?auto_26929 ?auto_26928 ) ( not ( = ?auto_26927 ?auto_26928 ) ) ( not ( = ?auto_26927 ?auto_26929 ) ) ( not ( = ?auto_26927 ?auto_26930 ) ) ( not ( = ?auto_26927 ?auto_26931 ) ) ( not ( = ?auto_26927 ?auto_26932 ) ) ( not ( = ?auto_26927 ?auto_26933 ) ) ( not ( = ?auto_26928 ?auto_26929 ) ) ( not ( = ?auto_26928 ?auto_26930 ) ) ( not ( = ?auto_26928 ?auto_26931 ) ) ( not ( = ?auto_26928 ?auto_26932 ) ) ( not ( = ?auto_26928 ?auto_26933 ) ) ( not ( = ?auto_26929 ?auto_26930 ) ) ( not ( = ?auto_26929 ?auto_26931 ) ) ( not ( = ?auto_26929 ?auto_26932 ) ) ( not ( = ?auto_26929 ?auto_26933 ) ) ( not ( = ?auto_26930 ?auto_26931 ) ) ( not ( = ?auto_26930 ?auto_26932 ) ) ( not ( = ?auto_26930 ?auto_26933 ) ) ( not ( = ?auto_26931 ?auto_26932 ) ) ( not ( = ?auto_26931 ?auto_26933 ) ) ( not ( = ?auto_26932 ?auto_26933 ) ) ( ON ?auto_26932 ?auto_26933 ) ( ON ?auto_26931 ?auto_26932 ) ( CLEAR ?auto_26929 ) ( ON ?auto_26930 ?auto_26931 ) ( CLEAR ?auto_26930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26927 ?auto_26928 ?auto_26929 ?auto_26930 )
      ( MAKE-7PILE ?auto_26927 ?auto_26928 ?auto_26929 ?auto_26930 ?auto_26931 ?auto_26932 ?auto_26933 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_26941 - BLOCK
      ?auto_26942 - BLOCK
      ?auto_26943 - BLOCK
      ?auto_26944 - BLOCK
      ?auto_26945 - BLOCK
      ?auto_26946 - BLOCK
      ?auto_26947 - BLOCK
    )
    :vars
    (
      ?auto_26948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26947 ?auto_26948 ) ( ON-TABLE ?auto_26941 ) ( ON ?auto_26942 ?auto_26941 ) ( not ( = ?auto_26941 ?auto_26942 ) ) ( not ( = ?auto_26941 ?auto_26943 ) ) ( not ( = ?auto_26941 ?auto_26944 ) ) ( not ( = ?auto_26941 ?auto_26945 ) ) ( not ( = ?auto_26941 ?auto_26946 ) ) ( not ( = ?auto_26941 ?auto_26947 ) ) ( not ( = ?auto_26941 ?auto_26948 ) ) ( not ( = ?auto_26942 ?auto_26943 ) ) ( not ( = ?auto_26942 ?auto_26944 ) ) ( not ( = ?auto_26942 ?auto_26945 ) ) ( not ( = ?auto_26942 ?auto_26946 ) ) ( not ( = ?auto_26942 ?auto_26947 ) ) ( not ( = ?auto_26942 ?auto_26948 ) ) ( not ( = ?auto_26943 ?auto_26944 ) ) ( not ( = ?auto_26943 ?auto_26945 ) ) ( not ( = ?auto_26943 ?auto_26946 ) ) ( not ( = ?auto_26943 ?auto_26947 ) ) ( not ( = ?auto_26943 ?auto_26948 ) ) ( not ( = ?auto_26944 ?auto_26945 ) ) ( not ( = ?auto_26944 ?auto_26946 ) ) ( not ( = ?auto_26944 ?auto_26947 ) ) ( not ( = ?auto_26944 ?auto_26948 ) ) ( not ( = ?auto_26945 ?auto_26946 ) ) ( not ( = ?auto_26945 ?auto_26947 ) ) ( not ( = ?auto_26945 ?auto_26948 ) ) ( not ( = ?auto_26946 ?auto_26947 ) ) ( not ( = ?auto_26946 ?auto_26948 ) ) ( not ( = ?auto_26947 ?auto_26948 ) ) ( ON ?auto_26946 ?auto_26947 ) ( ON ?auto_26945 ?auto_26946 ) ( ON ?auto_26944 ?auto_26945 ) ( CLEAR ?auto_26942 ) ( ON ?auto_26943 ?auto_26944 ) ( CLEAR ?auto_26943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26941 ?auto_26942 ?auto_26943 )
      ( MAKE-7PILE ?auto_26941 ?auto_26942 ?auto_26943 ?auto_26944 ?auto_26945 ?auto_26946 ?auto_26947 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_26956 - BLOCK
      ?auto_26957 - BLOCK
      ?auto_26958 - BLOCK
      ?auto_26959 - BLOCK
      ?auto_26960 - BLOCK
      ?auto_26961 - BLOCK
      ?auto_26962 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26962 ) ( ON-TABLE ?auto_26956 ) ( ON ?auto_26957 ?auto_26956 ) ( not ( = ?auto_26956 ?auto_26957 ) ) ( not ( = ?auto_26956 ?auto_26958 ) ) ( not ( = ?auto_26956 ?auto_26959 ) ) ( not ( = ?auto_26956 ?auto_26960 ) ) ( not ( = ?auto_26956 ?auto_26961 ) ) ( not ( = ?auto_26956 ?auto_26962 ) ) ( not ( = ?auto_26957 ?auto_26958 ) ) ( not ( = ?auto_26957 ?auto_26959 ) ) ( not ( = ?auto_26957 ?auto_26960 ) ) ( not ( = ?auto_26957 ?auto_26961 ) ) ( not ( = ?auto_26957 ?auto_26962 ) ) ( not ( = ?auto_26958 ?auto_26959 ) ) ( not ( = ?auto_26958 ?auto_26960 ) ) ( not ( = ?auto_26958 ?auto_26961 ) ) ( not ( = ?auto_26958 ?auto_26962 ) ) ( not ( = ?auto_26959 ?auto_26960 ) ) ( not ( = ?auto_26959 ?auto_26961 ) ) ( not ( = ?auto_26959 ?auto_26962 ) ) ( not ( = ?auto_26960 ?auto_26961 ) ) ( not ( = ?auto_26960 ?auto_26962 ) ) ( not ( = ?auto_26961 ?auto_26962 ) ) ( ON ?auto_26961 ?auto_26962 ) ( ON ?auto_26960 ?auto_26961 ) ( ON ?auto_26959 ?auto_26960 ) ( CLEAR ?auto_26957 ) ( ON ?auto_26958 ?auto_26959 ) ( CLEAR ?auto_26958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26956 ?auto_26957 ?auto_26958 )
      ( MAKE-7PILE ?auto_26956 ?auto_26957 ?auto_26958 ?auto_26959 ?auto_26960 ?auto_26961 ?auto_26962 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_26970 - BLOCK
      ?auto_26971 - BLOCK
      ?auto_26972 - BLOCK
      ?auto_26973 - BLOCK
      ?auto_26974 - BLOCK
      ?auto_26975 - BLOCK
      ?auto_26976 - BLOCK
    )
    :vars
    (
      ?auto_26977 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26976 ?auto_26977 ) ( ON-TABLE ?auto_26970 ) ( not ( = ?auto_26970 ?auto_26971 ) ) ( not ( = ?auto_26970 ?auto_26972 ) ) ( not ( = ?auto_26970 ?auto_26973 ) ) ( not ( = ?auto_26970 ?auto_26974 ) ) ( not ( = ?auto_26970 ?auto_26975 ) ) ( not ( = ?auto_26970 ?auto_26976 ) ) ( not ( = ?auto_26970 ?auto_26977 ) ) ( not ( = ?auto_26971 ?auto_26972 ) ) ( not ( = ?auto_26971 ?auto_26973 ) ) ( not ( = ?auto_26971 ?auto_26974 ) ) ( not ( = ?auto_26971 ?auto_26975 ) ) ( not ( = ?auto_26971 ?auto_26976 ) ) ( not ( = ?auto_26971 ?auto_26977 ) ) ( not ( = ?auto_26972 ?auto_26973 ) ) ( not ( = ?auto_26972 ?auto_26974 ) ) ( not ( = ?auto_26972 ?auto_26975 ) ) ( not ( = ?auto_26972 ?auto_26976 ) ) ( not ( = ?auto_26972 ?auto_26977 ) ) ( not ( = ?auto_26973 ?auto_26974 ) ) ( not ( = ?auto_26973 ?auto_26975 ) ) ( not ( = ?auto_26973 ?auto_26976 ) ) ( not ( = ?auto_26973 ?auto_26977 ) ) ( not ( = ?auto_26974 ?auto_26975 ) ) ( not ( = ?auto_26974 ?auto_26976 ) ) ( not ( = ?auto_26974 ?auto_26977 ) ) ( not ( = ?auto_26975 ?auto_26976 ) ) ( not ( = ?auto_26975 ?auto_26977 ) ) ( not ( = ?auto_26976 ?auto_26977 ) ) ( ON ?auto_26975 ?auto_26976 ) ( ON ?auto_26974 ?auto_26975 ) ( ON ?auto_26973 ?auto_26974 ) ( ON ?auto_26972 ?auto_26973 ) ( CLEAR ?auto_26970 ) ( ON ?auto_26971 ?auto_26972 ) ( CLEAR ?auto_26971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26970 ?auto_26971 )
      ( MAKE-7PILE ?auto_26970 ?auto_26971 ?auto_26972 ?auto_26973 ?auto_26974 ?auto_26975 ?auto_26976 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_26985 - BLOCK
      ?auto_26986 - BLOCK
      ?auto_26987 - BLOCK
      ?auto_26988 - BLOCK
      ?auto_26989 - BLOCK
      ?auto_26990 - BLOCK
      ?auto_26991 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26991 ) ( ON-TABLE ?auto_26985 ) ( not ( = ?auto_26985 ?auto_26986 ) ) ( not ( = ?auto_26985 ?auto_26987 ) ) ( not ( = ?auto_26985 ?auto_26988 ) ) ( not ( = ?auto_26985 ?auto_26989 ) ) ( not ( = ?auto_26985 ?auto_26990 ) ) ( not ( = ?auto_26985 ?auto_26991 ) ) ( not ( = ?auto_26986 ?auto_26987 ) ) ( not ( = ?auto_26986 ?auto_26988 ) ) ( not ( = ?auto_26986 ?auto_26989 ) ) ( not ( = ?auto_26986 ?auto_26990 ) ) ( not ( = ?auto_26986 ?auto_26991 ) ) ( not ( = ?auto_26987 ?auto_26988 ) ) ( not ( = ?auto_26987 ?auto_26989 ) ) ( not ( = ?auto_26987 ?auto_26990 ) ) ( not ( = ?auto_26987 ?auto_26991 ) ) ( not ( = ?auto_26988 ?auto_26989 ) ) ( not ( = ?auto_26988 ?auto_26990 ) ) ( not ( = ?auto_26988 ?auto_26991 ) ) ( not ( = ?auto_26989 ?auto_26990 ) ) ( not ( = ?auto_26989 ?auto_26991 ) ) ( not ( = ?auto_26990 ?auto_26991 ) ) ( ON ?auto_26990 ?auto_26991 ) ( ON ?auto_26989 ?auto_26990 ) ( ON ?auto_26988 ?auto_26989 ) ( ON ?auto_26987 ?auto_26988 ) ( CLEAR ?auto_26985 ) ( ON ?auto_26986 ?auto_26987 ) ( CLEAR ?auto_26986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26985 ?auto_26986 )
      ( MAKE-7PILE ?auto_26985 ?auto_26986 ?auto_26987 ?auto_26988 ?auto_26989 ?auto_26990 ?auto_26991 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_26999 - BLOCK
      ?auto_27000 - BLOCK
      ?auto_27001 - BLOCK
      ?auto_27002 - BLOCK
      ?auto_27003 - BLOCK
      ?auto_27004 - BLOCK
      ?auto_27005 - BLOCK
    )
    :vars
    (
      ?auto_27006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27005 ?auto_27006 ) ( not ( = ?auto_26999 ?auto_27000 ) ) ( not ( = ?auto_26999 ?auto_27001 ) ) ( not ( = ?auto_26999 ?auto_27002 ) ) ( not ( = ?auto_26999 ?auto_27003 ) ) ( not ( = ?auto_26999 ?auto_27004 ) ) ( not ( = ?auto_26999 ?auto_27005 ) ) ( not ( = ?auto_26999 ?auto_27006 ) ) ( not ( = ?auto_27000 ?auto_27001 ) ) ( not ( = ?auto_27000 ?auto_27002 ) ) ( not ( = ?auto_27000 ?auto_27003 ) ) ( not ( = ?auto_27000 ?auto_27004 ) ) ( not ( = ?auto_27000 ?auto_27005 ) ) ( not ( = ?auto_27000 ?auto_27006 ) ) ( not ( = ?auto_27001 ?auto_27002 ) ) ( not ( = ?auto_27001 ?auto_27003 ) ) ( not ( = ?auto_27001 ?auto_27004 ) ) ( not ( = ?auto_27001 ?auto_27005 ) ) ( not ( = ?auto_27001 ?auto_27006 ) ) ( not ( = ?auto_27002 ?auto_27003 ) ) ( not ( = ?auto_27002 ?auto_27004 ) ) ( not ( = ?auto_27002 ?auto_27005 ) ) ( not ( = ?auto_27002 ?auto_27006 ) ) ( not ( = ?auto_27003 ?auto_27004 ) ) ( not ( = ?auto_27003 ?auto_27005 ) ) ( not ( = ?auto_27003 ?auto_27006 ) ) ( not ( = ?auto_27004 ?auto_27005 ) ) ( not ( = ?auto_27004 ?auto_27006 ) ) ( not ( = ?auto_27005 ?auto_27006 ) ) ( ON ?auto_27004 ?auto_27005 ) ( ON ?auto_27003 ?auto_27004 ) ( ON ?auto_27002 ?auto_27003 ) ( ON ?auto_27001 ?auto_27002 ) ( ON ?auto_27000 ?auto_27001 ) ( ON ?auto_26999 ?auto_27000 ) ( CLEAR ?auto_26999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26999 )
      ( MAKE-7PILE ?auto_26999 ?auto_27000 ?auto_27001 ?auto_27002 ?auto_27003 ?auto_27004 ?auto_27005 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_27014 - BLOCK
      ?auto_27015 - BLOCK
      ?auto_27016 - BLOCK
      ?auto_27017 - BLOCK
      ?auto_27018 - BLOCK
      ?auto_27019 - BLOCK
      ?auto_27020 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27020 ) ( not ( = ?auto_27014 ?auto_27015 ) ) ( not ( = ?auto_27014 ?auto_27016 ) ) ( not ( = ?auto_27014 ?auto_27017 ) ) ( not ( = ?auto_27014 ?auto_27018 ) ) ( not ( = ?auto_27014 ?auto_27019 ) ) ( not ( = ?auto_27014 ?auto_27020 ) ) ( not ( = ?auto_27015 ?auto_27016 ) ) ( not ( = ?auto_27015 ?auto_27017 ) ) ( not ( = ?auto_27015 ?auto_27018 ) ) ( not ( = ?auto_27015 ?auto_27019 ) ) ( not ( = ?auto_27015 ?auto_27020 ) ) ( not ( = ?auto_27016 ?auto_27017 ) ) ( not ( = ?auto_27016 ?auto_27018 ) ) ( not ( = ?auto_27016 ?auto_27019 ) ) ( not ( = ?auto_27016 ?auto_27020 ) ) ( not ( = ?auto_27017 ?auto_27018 ) ) ( not ( = ?auto_27017 ?auto_27019 ) ) ( not ( = ?auto_27017 ?auto_27020 ) ) ( not ( = ?auto_27018 ?auto_27019 ) ) ( not ( = ?auto_27018 ?auto_27020 ) ) ( not ( = ?auto_27019 ?auto_27020 ) ) ( ON ?auto_27019 ?auto_27020 ) ( ON ?auto_27018 ?auto_27019 ) ( ON ?auto_27017 ?auto_27018 ) ( ON ?auto_27016 ?auto_27017 ) ( ON ?auto_27015 ?auto_27016 ) ( ON ?auto_27014 ?auto_27015 ) ( CLEAR ?auto_27014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27014 )
      ( MAKE-7PILE ?auto_27014 ?auto_27015 ?auto_27016 ?auto_27017 ?auto_27018 ?auto_27019 ?auto_27020 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_27028 - BLOCK
      ?auto_27029 - BLOCK
      ?auto_27030 - BLOCK
      ?auto_27031 - BLOCK
      ?auto_27032 - BLOCK
      ?auto_27033 - BLOCK
      ?auto_27034 - BLOCK
    )
    :vars
    (
      ?auto_27035 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27028 ?auto_27029 ) ) ( not ( = ?auto_27028 ?auto_27030 ) ) ( not ( = ?auto_27028 ?auto_27031 ) ) ( not ( = ?auto_27028 ?auto_27032 ) ) ( not ( = ?auto_27028 ?auto_27033 ) ) ( not ( = ?auto_27028 ?auto_27034 ) ) ( not ( = ?auto_27029 ?auto_27030 ) ) ( not ( = ?auto_27029 ?auto_27031 ) ) ( not ( = ?auto_27029 ?auto_27032 ) ) ( not ( = ?auto_27029 ?auto_27033 ) ) ( not ( = ?auto_27029 ?auto_27034 ) ) ( not ( = ?auto_27030 ?auto_27031 ) ) ( not ( = ?auto_27030 ?auto_27032 ) ) ( not ( = ?auto_27030 ?auto_27033 ) ) ( not ( = ?auto_27030 ?auto_27034 ) ) ( not ( = ?auto_27031 ?auto_27032 ) ) ( not ( = ?auto_27031 ?auto_27033 ) ) ( not ( = ?auto_27031 ?auto_27034 ) ) ( not ( = ?auto_27032 ?auto_27033 ) ) ( not ( = ?auto_27032 ?auto_27034 ) ) ( not ( = ?auto_27033 ?auto_27034 ) ) ( ON ?auto_27028 ?auto_27035 ) ( not ( = ?auto_27034 ?auto_27035 ) ) ( not ( = ?auto_27033 ?auto_27035 ) ) ( not ( = ?auto_27032 ?auto_27035 ) ) ( not ( = ?auto_27031 ?auto_27035 ) ) ( not ( = ?auto_27030 ?auto_27035 ) ) ( not ( = ?auto_27029 ?auto_27035 ) ) ( not ( = ?auto_27028 ?auto_27035 ) ) ( ON ?auto_27029 ?auto_27028 ) ( ON ?auto_27030 ?auto_27029 ) ( ON ?auto_27031 ?auto_27030 ) ( ON ?auto_27032 ?auto_27031 ) ( ON ?auto_27033 ?auto_27032 ) ( ON ?auto_27034 ?auto_27033 ) ( CLEAR ?auto_27034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_27034 ?auto_27033 ?auto_27032 ?auto_27031 ?auto_27030 ?auto_27029 ?auto_27028 )
      ( MAKE-7PILE ?auto_27028 ?auto_27029 ?auto_27030 ?auto_27031 ?auto_27032 ?auto_27033 ?auto_27034 ) )
  )

)

