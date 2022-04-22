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
      ?auto_88470 - BLOCK
    )
    :vars
    (
      ?auto_88471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88470 ?auto_88471 ) ( CLEAR ?auto_88470 ) ( HAND-EMPTY ) ( not ( = ?auto_88470 ?auto_88471 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_88470 ?auto_88471 )
      ( !PUTDOWN ?auto_88470 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_88477 - BLOCK
      ?auto_88478 - BLOCK
    )
    :vars
    (
      ?auto_88479 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_88477 ) ( ON ?auto_88478 ?auto_88479 ) ( CLEAR ?auto_88478 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_88477 ) ( not ( = ?auto_88477 ?auto_88478 ) ) ( not ( = ?auto_88477 ?auto_88479 ) ) ( not ( = ?auto_88478 ?auto_88479 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_88478 ?auto_88479 )
      ( !STACK ?auto_88478 ?auto_88477 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_88487 - BLOCK
      ?auto_88488 - BLOCK
    )
    :vars
    (
      ?auto_88489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88488 ?auto_88489 ) ( not ( = ?auto_88487 ?auto_88488 ) ) ( not ( = ?auto_88487 ?auto_88489 ) ) ( not ( = ?auto_88488 ?auto_88489 ) ) ( ON ?auto_88487 ?auto_88488 ) ( CLEAR ?auto_88487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_88487 )
      ( MAKE-2PILE ?auto_88487 ?auto_88488 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88498 - BLOCK
      ?auto_88499 - BLOCK
      ?auto_88500 - BLOCK
    )
    :vars
    (
      ?auto_88501 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_88499 ) ( ON ?auto_88500 ?auto_88501 ) ( CLEAR ?auto_88500 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_88498 ) ( ON ?auto_88499 ?auto_88498 ) ( not ( = ?auto_88498 ?auto_88499 ) ) ( not ( = ?auto_88498 ?auto_88500 ) ) ( not ( = ?auto_88498 ?auto_88501 ) ) ( not ( = ?auto_88499 ?auto_88500 ) ) ( not ( = ?auto_88499 ?auto_88501 ) ) ( not ( = ?auto_88500 ?auto_88501 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_88500 ?auto_88501 )
      ( !STACK ?auto_88500 ?auto_88499 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88512 - BLOCK
      ?auto_88513 - BLOCK
      ?auto_88514 - BLOCK
    )
    :vars
    (
      ?auto_88515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88514 ?auto_88515 ) ( ON-TABLE ?auto_88512 ) ( not ( = ?auto_88512 ?auto_88513 ) ) ( not ( = ?auto_88512 ?auto_88514 ) ) ( not ( = ?auto_88512 ?auto_88515 ) ) ( not ( = ?auto_88513 ?auto_88514 ) ) ( not ( = ?auto_88513 ?auto_88515 ) ) ( not ( = ?auto_88514 ?auto_88515 ) ) ( CLEAR ?auto_88512 ) ( ON ?auto_88513 ?auto_88514 ) ( CLEAR ?auto_88513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88512 ?auto_88513 )
      ( MAKE-3PILE ?auto_88512 ?auto_88513 ?auto_88514 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88526 - BLOCK
      ?auto_88527 - BLOCK
      ?auto_88528 - BLOCK
    )
    :vars
    (
      ?auto_88529 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88528 ?auto_88529 ) ( not ( = ?auto_88526 ?auto_88527 ) ) ( not ( = ?auto_88526 ?auto_88528 ) ) ( not ( = ?auto_88526 ?auto_88529 ) ) ( not ( = ?auto_88527 ?auto_88528 ) ) ( not ( = ?auto_88527 ?auto_88529 ) ) ( not ( = ?auto_88528 ?auto_88529 ) ) ( ON ?auto_88527 ?auto_88528 ) ( ON ?auto_88526 ?auto_88527 ) ( CLEAR ?auto_88526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_88526 )
      ( MAKE-3PILE ?auto_88526 ?auto_88527 ?auto_88528 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88541 - BLOCK
      ?auto_88542 - BLOCK
      ?auto_88543 - BLOCK
      ?auto_88544 - BLOCK
    )
    :vars
    (
      ?auto_88545 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_88543 ) ( ON ?auto_88544 ?auto_88545 ) ( CLEAR ?auto_88544 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_88541 ) ( ON ?auto_88542 ?auto_88541 ) ( ON ?auto_88543 ?auto_88542 ) ( not ( = ?auto_88541 ?auto_88542 ) ) ( not ( = ?auto_88541 ?auto_88543 ) ) ( not ( = ?auto_88541 ?auto_88544 ) ) ( not ( = ?auto_88541 ?auto_88545 ) ) ( not ( = ?auto_88542 ?auto_88543 ) ) ( not ( = ?auto_88542 ?auto_88544 ) ) ( not ( = ?auto_88542 ?auto_88545 ) ) ( not ( = ?auto_88543 ?auto_88544 ) ) ( not ( = ?auto_88543 ?auto_88545 ) ) ( not ( = ?auto_88544 ?auto_88545 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_88544 ?auto_88545 )
      ( !STACK ?auto_88544 ?auto_88543 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88559 - BLOCK
      ?auto_88560 - BLOCK
      ?auto_88561 - BLOCK
      ?auto_88562 - BLOCK
    )
    :vars
    (
      ?auto_88563 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88562 ?auto_88563 ) ( ON-TABLE ?auto_88559 ) ( ON ?auto_88560 ?auto_88559 ) ( not ( = ?auto_88559 ?auto_88560 ) ) ( not ( = ?auto_88559 ?auto_88561 ) ) ( not ( = ?auto_88559 ?auto_88562 ) ) ( not ( = ?auto_88559 ?auto_88563 ) ) ( not ( = ?auto_88560 ?auto_88561 ) ) ( not ( = ?auto_88560 ?auto_88562 ) ) ( not ( = ?auto_88560 ?auto_88563 ) ) ( not ( = ?auto_88561 ?auto_88562 ) ) ( not ( = ?auto_88561 ?auto_88563 ) ) ( not ( = ?auto_88562 ?auto_88563 ) ) ( CLEAR ?auto_88560 ) ( ON ?auto_88561 ?auto_88562 ) ( CLEAR ?auto_88561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_88559 ?auto_88560 ?auto_88561 )
      ( MAKE-4PILE ?auto_88559 ?auto_88560 ?auto_88561 ?auto_88562 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88577 - BLOCK
      ?auto_88578 - BLOCK
      ?auto_88579 - BLOCK
      ?auto_88580 - BLOCK
    )
    :vars
    (
      ?auto_88581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88580 ?auto_88581 ) ( ON-TABLE ?auto_88577 ) ( not ( = ?auto_88577 ?auto_88578 ) ) ( not ( = ?auto_88577 ?auto_88579 ) ) ( not ( = ?auto_88577 ?auto_88580 ) ) ( not ( = ?auto_88577 ?auto_88581 ) ) ( not ( = ?auto_88578 ?auto_88579 ) ) ( not ( = ?auto_88578 ?auto_88580 ) ) ( not ( = ?auto_88578 ?auto_88581 ) ) ( not ( = ?auto_88579 ?auto_88580 ) ) ( not ( = ?auto_88579 ?auto_88581 ) ) ( not ( = ?auto_88580 ?auto_88581 ) ) ( ON ?auto_88579 ?auto_88580 ) ( CLEAR ?auto_88577 ) ( ON ?auto_88578 ?auto_88579 ) ( CLEAR ?auto_88578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88577 ?auto_88578 )
      ( MAKE-4PILE ?auto_88577 ?auto_88578 ?auto_88579 ?auto_88580 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88595 - BLOCK
      ?auto_88596 - BLOCK
      ?auto_88597 - BLOCK
      ?auto_88598 - BLOCK
    )
    :vars
    (
      ?auto_88599 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88598 ?auto_88599 ) ( not ( = ?auto_88595 ?auto_88596 ) ) ( not ( = ?auto_88595 ?auto_88597 ) ) ( not ( = ?auto_88595 ?auto_88598 ) ) ( not ( = ?auto_88595 ?auto_88599 ) ) ( not ( = ?auto_88596 ?auto_88597 ) ) ( not ( = ?auto_88596 ?auto_88598 ) ) ( not ( = ?auto_88596 ?auto_88599 ) ) ( not ( = ?auto_88597 ?auto_88598 ) ) ( not ( = ?auto_88597 ?auto_88599 ) ) ( not ( = ?auto_88598 ?auto_88599 ) ) ( ON ?auto_88597 ?auto_88598 ) ( ON ?auto_88596 ?auto_88597 ) ( ON ?auto_88595 ?auto_88596 ) ( CLEAR ?auto_88595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_88595 )
      ( MAKE-4PILE ?auto_88595 ?auto_88596 ?auto_88597 ?auto_88598 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88614 - BLOCK
      ?auto_88615 - BLOCK
      ?auto_88616 - BLOCK
      ?auto_88617 - BLOCK
      ?auto_88618 - BLOCK
    )
    :vars
    (
      ?auto_88619 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_88617 ) ( ON ?auto_88618 ?auto_88619 ) ( CLEAR ?auto_88618 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_88614 ) ( ON ?auto_88615 ?auto_88614 ) ( ON ?auto_88616 ?auto_88615 ) ( ON ?auto_88617 ?auto_88616 ) ( not ( = ?auto_88614 ?auto_88615 ) ) ( not ( = ?auto_88614 ?auto_88616 ) ) ( not ( = ?auto_88614 ?auto_88617 ) ) ( not ( = ?auto_88614 ?auto_88618 ) ) ( not ( = ?auto_88614 ?auto_88619 ) ) ( not ( = ?auto_88615 ?auto_88616 ) ) ( not ( = ?auto_88615 ?auto_88617 ) ) ( not ( = ?auto_88615 ?auto_88618 ) ) ( not ( = ?auto_88615 ?auto_88619 ) ) ( not ( = ?auto_88616 ?auto_88617 ) ) ( not ( = ?auto_88616 ?auto_88618 ) ) ( not ( = ?auto_88616 ?auto_88619 ) ) ( not ( = ?auto_88617 ?auto_88618 ) ) ( not ( = ?auto_88617 ?auto_88619 ) ) ( not ( = ?auto_88618 ?auto_88619 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_88618 ?auto_88619 )
      ( !STACK ?auto_88618 ?auto_88617 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88636 - BLOCK
      ?auto_88637 - BLOCK
      ?auto_88638 - BLOCK
      ?auto_88639 - BLOCK
      ?auto_88640 - BLOCK
    )
    :vars
    (
      ?auto_88641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88640 ?auto_88641 ) ( ON-TABLE ?auto_88636 ) ( ON ?auto_88637 ?auto_88636 ) ( ON ?auto_88638 ?auto_88637 ) ( not ( = ?auto_88636 ?auto_88637 ) ) ( not ( = ?auto_88636 ?auto_88638 ) ) ( not ( = ?auto_88636 ?auto_88639 ) ) ( not ( = ?auto_88636 ?auto_88640 ) ) ( not ( = ?auto_88636 ?auto_88641 ) ) ( not ( = ?auto_88637 ?auto_88638 ) ) ( not ( = ?auto_88637 ?auto_88639 ) ) ( not ( = ?auto_88637 ?auto_88640 ) ) ( not ( = ?auto_88637 ?auto_88641 ) ) ( not ( = ?auto_88638 ?auto_88639 ) ) ( not ( = ?auto_88638 ?auto_88640 ) ) ( not ( = ?auto_88638 ?auto_88641 ) ) ( not ( = ?auto_88639 ?auto_88640 ) ) ( not ( = ?auto_88639 ?auto_88641 ) ) ( not ( = ?auto_88640 ?auto_88641 ) ) ( CLEAR ?auto_88638 ) ( ON ?auto_88639 ?auto_88640 ) ( CLEAR ?auto_88639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_88636 ?auto_88637 ?auto_88638 ?auto_88639 )
      ( MAKE-5PILE ?auto_88636 ?auto_88637 ?auto_88638 ?auto_88639 ?auto_88640 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88658 - BLOCK
      ?auto_88659 - BLOCK
      ?auto_88660 - BLOCK
      ?auto_88661 - BLOCK
      ?auto_88662 - BLOCK
    )
    :vars
    (
      ?auto_88663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88662 ?auto_88663 ) ( ON-TABLE ?auto_88658 ) ( ON ?auto_88659 ?auto_88658 ) ( not ( = ?auto_88658 ?auto_88659 ) ) ( not ( = ?auto_88658 ?auto_88660 ) ) ( not ( = ?auto_88658 ?auto_88661 ) ) ( not ( = ?auto_88658 ?auto_88662 ) ) ( not ( = ?auto_88658 ?auto_88663 ) ) ( not ( = ?auto_88659 ?auto_88660 ) ) ( not ( = ?auto_88659 ?auto_88661 ) ) ( not ( = ?auto_88659 ?auto_88662 ) ) ( not ( = ?auto_88659 ?auto_88663 ) ) ( not ( = ?auto_88660 ?auto_88661 ) ) ( not ( = ?auto_88660 ?auto_88662 ) ) ( not ( = ?auto_88660 ?auto_88663 ) ) ( not ( = ?auto_88661 ?auto_88662 ) ) ( not ( = ?auto_88661 ?auto_88663 ) ) ( not ( = ?auto_88662 ?auto_88663 ) ) ( ON ?auto_88661 ?auto_88662 ) ( CLEAR ?auto_88659 ) ( ON ?auto_88660 ?auto_88661 ) ( CLEAR ?auto_88660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_88658 ?auto_88659 ?auto_88660 )
      ( MAKE-5PILE ?auto_88658 ?auto_88659 ?auto_88660 ?auto_88661 ?auto_88662 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88680 - BLOCK
      ?auto_88681 - BLOCK
      ?auto_88682 - BLOCK
      ?auto_88683 - BLOCK
      ?auto_88684 - BLOCK
    )
    :vars
    (
      ?auto_88685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88684 ?auto_88685 ) ( ON-TABLE ?auto_88680 ) ( not ( = ?auto_88680 ?auto_88681 ) ) ( not ( = ?auto_88680 ?auto_88682 ) ) ( not ( = ?auto_88680 ?auto_88683 ) ) ( not ( = ?auto_88680 ?auto_88684 ) ) ( not ( = ?auto_88680 ?auto_88685 ) ) ( not ( = ?auto_88681 ?auto_88682 ) ) ( not ( = ?auto_88681 ?auto_88683 ) ) ( not ( = ?auto_88681 ?auto_88684 ) ) ( not ( = ?auto_88681 ?auto_88685 ) ) ( not ( = ?auto_88682 ?auto_88683 ) ) ( not ( = ?auto_88682 ?auto_88684 ) ) ( not ( = ?auto_88682 ?auto_88685 ) ) ( not ( = ?auto_88683 ?auto_88684 ) ) ( not ( = ?auto_88683 ?auto_88685 ) ) ( not ( = ?auto_88684 ?auto_88685 ) ) ( ON ?auto_88683 ?auto_88684 ) ( ON ?auto_88682 ?auto_88683 ) ( CLEAR ?auto_88680 ) ( ON ?auto_88681 ?auto_88682 ) ( CLEAR ?auto_88681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88680 ?auto_88681 )
      ( MAKE-5PILE ?auto_88680 ?auto_88681 ?auto_88682 ?auto_88683 ?auto_88684 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88702 - BLOCK
      ?auto_88703 - BLOCK
      ?auto_88704 - BLOCK
      ?auto_88705 - BLOCK
      ?auto_88706 - BLOCK
    )
    :vars
    (
      ?auto_88707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88706 ?auto_88707 ) ( not ( = ?auto_88702 ?auto_88703 ) ) ( not ( = ?auto_88702 ?auto_88704 ) ) ( not ( = ?auto_88702 ?auto_88705 ) ) ( not ( = ?auto_88702 ?auto_88706 ) ) ( not ( = ?auto_88702 ?auto_88707 ) ) ( not ( = ?auto_88703 ?auto_88704 ) ) ( not ( = ?auto_88703 ?auto_88705 ) ) ( not ( = ?auto_88703 ?auto_88706 ) ) ( not ( = ?auto_88703 ?auto_88707 ) ) ( not ( = ?auto_88704 ?auto_88705 ) ) ( not ( = ?auto_88704 ?auto_88706 ) ) ( not ( = ?auto_88704 ?auto_88707 ) ) ( not ( = ?auto_88705 ?auto_88706 ) ) ( not ( = ?auto_88705 ?auto_88707 ) ) ( not ( = ?auto_88706 ?auto_88707 ) ) ( ON ?auto_88705 ?auto_88706 ) ( ON ?auto_88704 ?auto_88705 ) ( ON ?auto_88703 ?auto_88704 ) ( ON ?auto_88702 ?auto_88703 ) ( CLEAR ?auto_88702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_88702 )
      ( MAKE-5PILE ?auto_88702 ?auto_88703 ?auto_88704 ?auto_88705 ?auto_88706 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_88725 - BLOCK
      ?auto_88726 - BLOCK
      ?auto_88727 - BLOCK
      ?auto_88728 - BLOCK
      ?auto_88729 - BLOCK
      ?auto_88730 - BLOCK
    )
    :vars
    (
      ?auto_88731 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_88729 ) ( ON ?auto_88730 ?auto_88731 ) ( CLEAR ?auto_88730 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_88725 ) ( ON ?auto_88726 ?auto_88725 ) ( ON ?auto_88727 ?auto_88726 ) ( ON ?auto_88728 ?auto_88727 ) ( ON ?auto_88729 ?auto_88728 ) ( not ( = ?auto_88725 ?auto_88726 ) ) ( not ( = ?auto_88725 ?auto_88727 ) ) ( not ( = ?auto_88725 ?auto_88728 ) ) ( not ( = ?auto_88725 ?auto_88729 ) ) ( not ( = ?auto_88725 ?auto_88730 ) ) ( not ( = ?auto_88725 ?auto_88731 ) ) ( not ( = ?auto_88726 ?auto_88727 ) ) ( not ( = ?auto_88726 ?auto_88728 ) ) ( not ( = ?auto_88726 ?auto_88729 ) ) ( not ( = ?auto_88726 ?auto_88730 ) ) ( not ( = ?auto_88726 ?auto_88731 ) ) ( not ( = ?auto_88727 ?auto_88728 ) ) ( not ( = ?auto_88727 ?auto_88729 ) ) ( not ( = ?auto_88727 ?auto_88730 ) ) ( not ( = ?auto_88727 ?auto_88731 ) ) ( not ( = ?auto_88728 ?auto_88729 ) ) ( not ( = ?auto_88728 ?auto_88730 ) ) ( not ( = ?auto_88728 ?auto_88731 ) ) ( not ( = ?auto_88729 ?auto_88730 ) ) ( not ( = ?auto_88729 ?auto_88731 ) ) ( not ( = ?auto_88730 ?auto_88731 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_88730 ?auto_88731 )
      ( !STACK ?auto_88730 ?auto_88729 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_88751 - BLOCK
      ?auto_88752 - BLOCK
      ?auto_88753 - BLOCK
      ?auto_88754 - BLOCK
      ?auto_88755 - BLOCK
      ?auto_88756 - BLOCK
    )
    :vars
    (
      ?auto_88757 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88756 ?auto_88757 ) ( ON-TABLE ?auto_88751 ) ( ON ?auto_88752 ?auto_88751 ) ( ON ?auto_88753 ?auto_88752 ) ( ON ?auto_88754 ?auto_88753 ) ( not ( = ?auto_88751 ?auto_88752 ) ) ( not ( = ?auto_88751 ?auto_88753 ) ) ( not ( = ?auto_88751 ?auto_88754 ) ) ( not ( = ?auto_88751 ?auto_88755 ) ) ( not ( = ?auto_88751 ?auto_88756 ) ) ( not ( = ?auto_88751 ?auto_88757 ) ) ( not ( = ?auto_88752 ?auto_88753 ) ) ( not ( = ?auto_88752 ?auto_88754 ) ) ( not ( = ?auto_88752 ?auto_88755 ) ) ( not ( = ?auto_88752 ?auto_88756 ) ) ( not ( = ?auto_88752 ?auto_88757 ) ) ( not ( = ?auto_88753 ?auto_88754 ) ) ( not ( = ?auto_88753 ?auto_88755 ) ) ( not ( = ?auto_88753 ?auto_88756 ) ) ( not ( = ?auto_88753 ?auto_88757 ) ) ( not ( = ?auto_88754 ?auto_88755 ) ) ( not ( = ?auto_88754 ?auto_88756 ) ) ( not ( = ?auto_88754 ?auto_88757 ) ) ( not ( = ?auto_88755 ?auto_88756 ) ) ( not ( = ?auto_88755 ?auto_88757 ) ) ( not ( = ?auto_88756 ?auto_88757 ) ) ( CLEAR ?auto_88754 ) ( ON ?auto_88755 ?auto_88756 ) ( CLEAR ?auto_88755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_88751 ?auto_88752 ?auto_88753 ?auto_88754 ?auto_88755 )
      ( MAKE-6PILE ?auto_88751 ?auto_88752 ?auto_88753 ?auto_88754 ?auto_88755 ?auto_88756 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_88777 - BLOCK
      ?auto_88778 - BLOCK
      ?auto_88779 - BLOCK
      ?auto_88780 - BLOCK
      ?auto_88781 - BLOCK
      ?auto_88782 - BLOCK
    )
    :vars
    (
      ?auto_88783 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88782 ?auto_88783 ) ( ON-TABLE ?auto_88777 ) ( ON ?auto_88778 ?auto_88777 ) ( ON ?auto_88779 ?auto_88778 ) ( not ( = ?auto_88777 ?auto_88778 ) ) ( not ( = ?auto_88777 ?auto_88779 ) ) ( not ( = ?auto_88777 ?auto_88780 ) ) ( not ( = ?auto_88777 ?auto_88781 ) ) ( not ( = ?auto_88777 ?auto_88782 ) ) ( not ( = ?auto_88777 ?auto_88783 ) ) ( not ( = ?auto_88778 ?auto_88779 ) ) ( not ( = ?auto_88778 ?auto_88780 ) ) ( not ( = ?auto_88778 ?auto_88781 ) ) ( not ( = ?auto_88778 ?auto_88782 ) ) ( not ( = ?auto_88778 ?auto_88783 ) ) ( not ( = ?auto_88779 ?auto_88780 ) ) ( not ( = ?auto_88779 ?auto_88781 ) ) ( not ( = ?auto_88779 ?auto_88782 ) ) ( not ( = ?auto_88779 ?auto_88783 ) ) ( not ( = ?auto_88780 ?auto_88781 ) ) ( not ( = ?auto_88780 ?auto_88782 ) ) ( not ( = ?auto_88780 ?auto_88783 ) ) ( not ( = ?auto_88781 ?auto_88782 ) ) ( not ( = ?auto_88781 ?auto_88783 ) ) ( not ( = ?auto_88782 ?auto_88783 ) ) ( ON ?auto_88781 ?auto_88782 ) ( CLEAR ?auto_88779 ) ( ON ?auto_88780 ?auto_88781 ) ( CLEAR ?auto_88780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_88777 ?auto_88778 ?auto_88779 ?auto_88780 )
      ( MAKE-6PILE ?auto_88777 ?auto_88778 ?auto_88779 ?auto_88780 ?auto_88781 ?auto_88782 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_88803 - BLOCK
      ?auto_88804 - BLOCK
      ?auto_88805 - BLOCK
      ?auto_88806 - BLOCK
      ?auto_88807 - BLOCK
      ?auto_88808 - BLOCK
    )
    :vars
    (
      ?auto_88809 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88808 ?auto_88809 ) ( ON-TABLE ?auto_88803 ) ( ON ?auto_88804 ?auto_88803 ) ( not ( = ?auto_88803 ?auto_88804 ) ) ( not ( = ?auto_88803 ?auto_88805 ) ) ( not ( = ?auto_88803 ?auto_88806 ) ) ( not ( = ?auto_88803 ?auto_88807 ) ) ( not ( = ?auto_88803 ?auto_88808 ) ) ( not ( = ?auto_88803 ?auto_88809 ) ) ( not ( = ?auto_88804 ?auto_88805 ) ) ( not ( = ?auto_88804 ?auto_88806 ) ) ( not ( = ?auto_88804 ?auto_88807 ) ) ( not ( = ?auto_88804 ?auto_88808 ) ) ( not ( = ?auto_88804 ?auto_88809 ) ) ( not ( = ?auto_88805 ?auto_88806 ) ) ( not ( = ?auto_88805 ?auto_88807 ) ) ( not ( = ?auto_88805 ?auto_88808 ) ) ( not ( = ?auto_88805 ?auto_88809 ) ) ( not ( = ?auto_88806 ?auto_88807 ) ) ( not ( = ?auto_88806 ?auto_88808 ) ) ( not ( = ?auto_88806 ?auto_88809 ) ) ( not ( = ?auto_88807 ?auto_88808 ) ) ( not ( = ?auto_88807 ?auto_88809 ) ) ( not ( = ?auto_88808 ?auto_88809 ) ) ( ON ?auto_88807 ?auto_88808 ) ( ON ?auto_88806 ?auto_88807 ) ( CLEAR ?auto_88804 ) ( ON ?auto_88805 ?auto_88806 ) ( CLEAR ?auto_88805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_88803 ?auto_88804 ?auto_88805 )
      ( MAKE-6PILE ?auto_88803 ?auto_88804 ?auto_88805 ?auto_88806 ?auto_88807 ?auto_88808 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_88829 - BLOCK
      ?auto_88830 - BLOCK
      ?auto_88831 - BLOCK
      ?auto_88832 - BLOCK
      ?auto_88833 - BLOCK
      ?auto_88834 - BLOCK
    )
    :vars
    (
      ?auto_88835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88834 ?auto_88835 ) ( ON-TABLE ?auto_88829 ) ( not ( = ?auto_88829 ?auto_88830 ) ) ( not ( = ?auto_88829 ?auto_88831 ) ) ( not ( = ?auto_88829 ?auto_88832 ) ) ( not ( = ?auto_88829 ?auto_88833 ) ) ( not ( = ?auto_88829 ?auto_88834 ) ) ( not ( = ?auto_88829 ?auto_88835 ) ) ( not ( = ?auto_88830 ?auto_88831 ) ) ( not ( = ?auto_88830 ?auto_88832 ) ) ( not ( = ?auto_88830 ?auto_88833 ) ) ( not ( = ?auto_88830 ?auto_88834 ) ) ( not ( = ?auto_88830 ?auto_88835 ) ) ( not ( = ?auto_88831 ?auto_88832 ) ) ( not ( = ?auto_88831 ?auto_88833 ) ) ( not ( = ?auto_88831 ?auto_88834 ) ) ( not ( = ?auto_88831 ?auto_88835 ) ) ( not ( = ?auto_88832 ?auto_88833 ) ) ( not ( = ?auto_88832 ?auto_88834 ) ) ( not ( = ?auto_88832 ?auto_88835 ) ) ( not ( = ?auto_88833 ?auto_88834 ) ) ( not ( = ?auto_88833 ?auto_88835 ) ) ( not ( = ?auto_88834 ?auto_88835 ) ) ( ON ?auto_88833 ?auto_88834 ) ( ON ?auto_88832 ?auto_88833 ) ( ON ?auto_88831 ?auto_88832 ) ( CLEAR ?auto_88829 ) ( ON ?auto_88830 ?auto_88831 ) ( CLEAR ?auto_88830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88829 ?auto_88830 )
      ( MAKE-6PILE ?auto_88829 ?auto_88830 ?auto_88831 ?auto_88832 ?auto_88833 ?auto_88834 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_88855 - BLOCK
      ?auto_88856 - BLOCK
      ?auto_88857 - BLOCK
      ?auto_88858 - BLOCK
      ?auto_88859 - BLOCK
      ?auto_88860 - BLOCK
    )
    :vars
    (
      ?auto_88861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88860 ?auto_88861 ) ( not ( = ?auto_88855 ?auto_88856 ) ) ( not ( = ?auto_88855 ?auto_88857 ) ) ( not ( = ?auto_88855 ?auto_88858 ) ) ( not ( = ?auto_88855 ?auto_88859 ) ) ( not ( = ?auto_88855 ?auto_88860 ) ) ( not ( = ?auto_88855 ?auto_88861 ) ) ( not ( = ?auto_88856 ?auto_88857 ) ) ( not ( = ?auto_88856 ?auto_88858 ) ) ( not ( = ?auto_88856 ?auto_88859 ) ) ( not ( = ?auto_88856 ?auto_88860 ) ) ( not ( = ?auto_88856 ?auto_88861 ) ) ( not ( = ?auto_88857 ?auto_88858 ) ) ( not ( = ?auto_88857 ?auto_88859 ) ) ( not ( = ?auto_88857 ?auto_88860 ) ) ( not ( = ?auto_88857 ?auto_88861 ) ) ( not ( = ?auto_88858 ?auto_88859 ) ) ( not ( = ?auto_88858 ?auto_88860 ) ) ( not ( = ?auto_88858 ?auto_88861 ) ) ( not ( = ?auto_88859 ?auto_88860 ) ) ( not ( = ?auto_88859 ?auto_88861 ) ) ( not ( = ?auto_88860 ?auto_88861 ) ) ( ON ?auto_88859 ?auto_88860 ) ( ON ?auto_88858 ?auto_88859 ) ( ON ?auto_88857 ?auto_88858 ) ( ON ?auto_88856 ?auto_88857 ) ( ON ?auto_88855 ?auto_88856 ) ( CLEAR ?auto_88855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_88855 )
      ( MAKE-6PILE ?auto_88855 ?auto_88856 ?auto_88857 ?auto_88858 ?auto_88859 ?auto_88860 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_88882 - BLOCK
      ?auto_88883 - BLOCK
      ?auto_88884 - BLOCK
      ?auto_88885 - BLOCK
      ?auto_88886 - BLOCK
      ?auto_88887 - BLOCK
      ?auto_88888 - BLOCK
    )
    :vars
    (
      ?auto_88889 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_88887 ) ( ON ?auto_88888 ?auto_88889 ) ( CLEAR ?auto_88888 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_88882 ) ( ON ?auto_88883 ?auto_88882 ) ( ON ?auto_88884 ?auto_88883 ) ( ON ?auto_88885 ?auto_88884 ) ( ON ?auto_88886 ?auto_88885 ) ( ON ?auto_88887 ?auto_88886 ) ( not ( = ?auto_88882 ?auto_88883 ) ) ( not ( = ?auto_88882 ?auto_88884 ) ) ( not ( = ?auto_88882 ?auto_88885 ) ) ( not ( = ?auto_88882 ?auto_88886 ) ) ( not ( = ?auto_88882 ?auto_88887 ) ) ( not ( = ?auto_88882 ?auto_88888 ) ) ( not ( = ?auto_88882 ?auto_88889 ) ) ( not ( = ?auto_88883 ?auto_88884 ) ) ( not ( = ?auto_88883 ?auto_88885 ) ) ( not ( = ?auto_88883 ?auto_88886 ) ) ( not ( = ?auto_88883 ?auto_88887 ) ) ( not ( = ?auto_88883 ?auto_88888 ) ) ( not ( = ?auto_88883 ?auto_88889 ) ) ( not ( = ?auto_88884 ?auto_88885 ) ) ( not ( = ?auto_88884 ?auto_88886 ) ) ( not ( = ?auto_88884 ?auto_88887 ) ) ( not ( = ?auto_88884 ?auto_88888 ) ) ( not ( = ?auto_88884 ?auto_88889 ) ) ( not ( = ?auto_88885 ?auto_88886 ) ) ( not ( = ?auto_88885 ?auto_88887 ) ) ( not ( = ?auto_88885 ?auto_88888 ) ) ( not ( = ?auto_88885 ?auto_88889 ) ) ( not ( = ?auto_88886 ?auto_88887 ) ) ( not ( = ?auto_88886 ?auto_88888 ) ) ( not ( = ?auto_88886 ?auto_88889 ) ) ( not ( = ?auto_88887 ?auto_88888 ) ) ( not ( = ?auto_88887 ?auto_88889 ) ) ( not ( = ?auto_88888 ?auto_88889 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_88888 ?auto_88889 )
      ( !STACK ?auto_88888 ?auto_88887 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_88912 - BLOCK
      ?auto_88913 - BLOCK
      ?auto_88914 - BLOCK
      ?auto_88915 - BLOCK
      ?auto_88916 - BLOCK
      ?auto_88917 - BLOCK
      ?auto_88918 - BLOCK
    )
    :vars
    (
      ?auto_88919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88918 ?auto_88919 ) ( ON-TABLE ?auto_88912 ) ( ON ?auto_88913 ?auto_88912 ) ( ON ?auto_88914 ?auto_88913 ) ( ON ?auto_88915 ?auto_88914 ) ( ON ?auto_88916 ?auto_88915 ) ( not ( = ?auto_88912 ?auto_88913 ) ) ( not ( = ?auto_88912 ?auto_88914 ) ) ( not ( = ?auto_88912 ?auto_88915 ) ) ( not ( = ?auto_88912 ?auto_88916 ) ) ( not ( = ?auto_88912 ?auto_88917 ) ) ( not ( = ?auto_88912 ?auto_88918 ) ) ( not ( = ?auto_88912 ?auto_88919 ) ) ( not ( = ?auto_88913 ?auto_88914 ) ) ( not ( = ?auto_88913 ?auto_88915 ) ) ( not ( = ?auto_88913 ?auto_88916 ) ) ( not ( = ?auto_88913 ?auto_88917 ) ) ( not ( = ?auto_88913 ?auto_88918 ) ) ( not ( = ?auto_88913 ?auto_88919 ) ) ( not ( = ?auto_88914 ?auto_88915 ) ) ( not ( = ?auto_88914 ?auto_88916 ) ) ( not ( = ?auto_88914 ?auto_88917 ) ) ( not ( = ?auto_88914 ?auto_88918 ) ) ( not ( = ?auto_88914 ?auto_88919 ) ) ( not ( = ?auto_88915 ?auto_88916 ) ) ( not ( = ?auto_88915 ?auto_88917 ) ) ( not ( = ?auto_88915 ?auto_88918 ) ) ( not ( = ?auto_88915 ?auto_88919 ) ) ( not ( = ?auto_88916 ?auto_88917 ) ) ( not ( = ?auto_88916 ?auto_88918 ) ) ( not ( = ?auto_88916 ?auto_88919 ) ) ( not ( = ?auto_88917 ?auto_88918 ) ) ( not ( = ?auto_88917 ?auto_88919 ) ) ( not ( = ?auto_88918 ?auto_88919 ) ) ( CLEAR ?auto_88916 ) ( ON ?auto_88917 ?auto_88918 ) ( CLEAR ?auto_88917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88912 ?auto_88913 ?auto_88914 ?auto_88915 ?auto_88916 ?auto_88917 )
      ( MAKE-7PILE ?auto_88912 ?auto_88913 ?auto_88914 ?auto_88915 ?auto_88916 ?auto_88917 ?auto_88918 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_88942 - BLOCK
      ?auto_88943 - BLOCK
      ?auto_88944 - BLOCK
      ?auto_88945 - BLOCK
      ?auto_88946 - BLOCK
      ?auto_88947 - BLOCK
      ?auto_88948 - BLOCK
    )
    :vars
    (
      ?auto_88949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88948 ?auto_88949 ) ( ON-TABLE ?auto_88942 ) ( ON ?auto_88943 ?auto_88942 ) ( ON ?auto_88944 ?auto_88943 ) ( ON ?auto_88945 ?auto_88944 ) ( not ( = ?auto_88942 ?auto_88943 ) ) ( not ( = ?auto_88942 ?auto_88944 ) ) ( not ( = ?auto_88942 ?auto_88945 ) ) ( not ( = ?auto_88942 ?auto_88946 ) ) ( not ( = ?auto_88942 ?auto_88947 ) ) ( not ( = ?auto_88942 ?auto_88948 ) ) ( not ( = ?auto_88942 ?auto_88949 ) ) ( not ( = ?auto_88943 ?auto_88944 ) ) ( not ( = ?auto_88943 ?auto_88945 ) ) ( not ( = ?auto_88943 ?auto_88946 ) ) ( not ( = ?auto_88943 ?auto_88947 ) ) ( not ( = ?auto_88943 ?auto_88948 ) ) ( not ( = ?auto_88943 ?auto_88949 ) ) ( not ( = ?auto_88944 ?auto_88945 ) ) ( not ( = ?auto_88944 ?auto_88946 ) ) ( not ( = ?auto_88944 ?auto_88947 ) ) ( not ( = ?auto_88944 ?auto_88948 ) ) ( not ( = ?auto_88944 ?auto_88949 ) ) ( not ( = ?auto_88945 ?auto_88946 ) ) ( not ( = ?auto_88945 ?auto_88947 ) ) ( not ( = ?auto_88945 ?auto_88948 ) ) ( not ( = ?auto_88945 ?auto_88949 ) ) ( not ( = ?auto_88946 ?auto_88947 ) ) ( not ( = ?auto_88946 ?auto_88948 ) ) ( not ( = ?auto_88946 ?auto_88949 ) ) ( not ( = ?auto_88947 ?auto_88948 ) ) ( not ( = ?auto_88947 ?auto_88949 ) ) ( not ( = ?auto_88948 ?auto_88949 ) ) ( ON ?auto_88947 ?auto_88948 ) ( CLEAR ?auto_88945 ) ( ON ?auto_88946 ?auto_88947 ) ( CLEAR ?auto_88946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_88942 ?auto_88943 ?auto_88944 ?auto_88945 ?auto_88946 )
      ( MAKE-7PILE ?auto_88942 ?auto_88943 ?auto_88944 ?auto_88945 ?auto_88946 ?auto_88947 ?auto_88948 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_88972 - BLOCK
      ?auto_88973 - BLOCK
      ?auto_88974 - BLOCK
      ?auto_88975 - BLOCK
      ?auto_88976 - BLOCK
      ?auto_88977 - BLOCK
      ?auto_88978 - BLOCK
    )
    :vars
    (
      ?auto_88979 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88978 ?auto_88979 ) ( ON-TABLE ?auto_88972 ) ( ON ?auto_88973 ?auto_88972 ) ( ON ?auto_88974 ?auto_88973 ) ( not ( = ?auto_88972 ?auto_88973 ) ) ( not ( = ?auto_88972 ?auto_88974 ) ) ( not ( = ?auto_88972 ?auto_88975 ) ) ( not ( = ?auto_88972 ?auto_88976 ) ) ( not ( = ?auto_88972 ?auto_88977 ) ) ( not ( = ?auto_88972 ?auto_88978 ) ) ( not ( = ?auto_88972 ?auto_88979 ) ) ( not ( = ?auto_88973 ?auto_88974 ) ) ( not ( = ?auto_88973 ?auto_88975 ) ) ( not ( = ?auto_88973 ?auto_88976 ) ) ( not ( = ?auto_88973 ?auto_88977 ) ) ( not ( = ?auto_88973 ?auto_88978 ) ) ( not ( = ?auto_88973 ?auto_88979 ) ) ( not ( = ?auto_88974 ?auto_88975 ) ) ( not ( = ?auto_88974 ?auto_88976 ) ) ( not ( = ?auto_88974 ?auto_88977 ) ) ( not ( = ?auto_88974 ?auto_88978 ) ) ( not ( = ?auto_88974 ?auto_88979 ) ) ( not ( = ?auto_88975 ?auto_88976 ) ) ( not ( = ?auto_88975 ?auto_88977 ) ) ( not ( = ?auto_88975 ?auto_88978 ) ) ( not ( = ?auto_88975 ?auto_88979 ) ) ( not ( = ?auto_88976 ?auto_88977 ) ) ( not ( = ?auto_88976 ?auto_88978 ) ) ( not ( = ?auto_88976 ?auto_88979 ) ) ( not ( = ?auto_88977 ?auto_88978 ) ) ( not ( = ?auto_88977 ?auto_88979 ) ) ( not ( = ?auto_88978 ?auto_88979 ) ) ( ON ?auto_88977 ?auto_88978 ) ( ON ?auto_88976 ?auto_88977 ) ( CLEAR ?auto_88974 ) ( ON ?auto_88975 ?auto_88976 ) ( CLEAR ?auto_88975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_88972 ?auto_88973 ?auto_88974 ?auto_88975 )
      ( MAKE-7PILE ?auto_88972 ?auto_88973 ?auto_88974 ?auto_88975 ?auto_88976 ?auto_88977 ?auto_88978 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89002 - BLOCK
      ?auto_89003 - BLOCK
      ?auto_89004 - BLOCK
      ?auto_89005 - BLOCK
      ?auto_89006 - BLOCK
      ?auto_89007 - BLOCK
      ?auto_89008 - BLOCK
    )
    :vars
    (
      ?auto_89009 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89008 ?auto_89009 ) ( ON-TABLE ?auto_89002 ) ( ON ?auto_89003 ?auto_89002 ) ( not ( = ?auto_89002 ?auto_89003 ) ) ( not ( = ?auto_89002 ?auto_89004 ) ) ( not ( = ?auto_89002 ?auto_89005 ) ) ( not ( = ?auto_89002 ?auto_89006 ) ) ( not ( = ?auto_89002 ?auto_89007 ) ) ( not ( = ?auto_89002 ?auto_89008 ) ) ( not ( = ?auto_89002 ?auto_89009 ) ) ( not ( = ?auto_89003 ?auto_89004 ) ) ( not ( = ?auto_89003 ?auto_89005 ) ) ( not ( = ?auto_89003 ?auto_89006 ) ) ( not ( = ?auto_89003 ?auto_89007 ) ) ( not ( = ?auto_89003 ?auto_89008 ) ) ( not ( = ?auto_89003 ?auto_89009 ) ) ( not ( = ?auto_89004 ?auto_89005 ) ) ( not ( = ?auto_89004 ?auto_89006 ) ) ( not ( = ?auto_89004 ?auto_89007 ) ) ( not ( = ?auto_89004 ?auto_89008 ) ) ( not ( = ?auto_89004 ?auto_89009 ) ) ( not ( = ?auto_89005 ?auto_89006 ) ) ( not ( = ?auto_89005 ?auto_89007 ) ) ( not ( = ?auto_89005 ?auto_89008 ) ) ( not ( = ?auto_89005 ?auto_89009 ) ) ( not ( = ?auto_89006 ?auto_89007 ) ) ( not ( = ?auto_89006 ?auto_89008 ) ) ( not ( = ?auto_89006 ?auto_89009 ) ) ( not ( = ?auto_89007 ?auto_89008 ) ) ( not ( = ?auto_89007 ?auto_89009 ) ) ( not ( = ?auto_89008 ?auto_89009 ) ) ( ON ?auto_89007 ?auto_89008 ) ( ON ?auto_89006 ?auto_89007 ) ( ON ?auto_89005 ?auto_89006 ) ( CLEAR ?auto_89003 ) ( ON ?auto_89004 ?auto_89005 ) ( CLEAR ?auto_89004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89002 ?auto_89003 ?auto_89004 )
      ( MAKE-7PILE ?auto_89002 ?auto_89003 ?auto_89004 ?auto_89005 ?auto_89006 ?auto_89007 ?auto_89008 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89032 - BLOCK
      ?auto_89033 - BLOCK
      ?auto_89034 - BLOCK
      ?auto_89035 - BLOCK
      ?auto_89036 - BLOCK
      ?auto_89037 - BLOCK
      ?auto_89038 - BLOCK
    )
    :vars
    (
      ?auto_89039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89038 ?auto_89039 ) ( ON-TABLE ?auto_89032 ) ( not ( = ?auto_89032 ?auto_89033 ) ) ( not ( = ?auto_89032 ?auto_89034 ) ) ( not ( = ?auto_89032 ?auto_89035 ) ) ( not ( = ?auto_89032 ?auto_89036 ) ) ( not ( = ?auto_89032 ?auto_89037 ) ) ( not ( = ?auto_89032 ?auto_89038 ) ) ( not ( = ?auto_89032 ?auto_89039 ) ) ( not ( = ?auto_89033 ?auto_89034 ) ) ( not ( = ?auto_89033 ?auto_89035 ) ) ( not ( = ?auto_89033 ?auto_89036 ) ) ( not ( = ?auto_89033 ?auto_89037 ) ) ( not ( = ?auto_89033 ?auto_89038 ) ) ( not ( = ?auto_89033 ?auto_89039 ) ) ( not ( = ?auto_89034 ?auto_89035 ) ) ( not ( = ?auto_89034 ?auto_89036 ) ) ( not ( = ?auto_89034 ?auto_89037 ) ) ( not ( = ?auto_89034 ?auto_89038 ) ) ( not ( = ?auto_89034 ?auto_89039 ) ) ( not ( = ?auto_89035 ?auto_89036 ) ) ( not ( = ?auto_89035 ?auto_89037 ) ) ( not ( = ?auto_89035 ?auto_89038 ) ) ( not ( = ?auto_89035 ?auto_89039 ) ) ( not ( = ?auto_89036 ?auto_89037 ) ) ( not ( = ?auto_89036 ?auto_89038 ) ) ( not ( = ?auto_89036 ?auto_89039 ) ) ( not ( = ?auto_89037 ?auto_89038 ) ) ( not ( = ?auto_89037 ?auto_89039 ) ) ( not ( = ?auto_89038 ?auto_89039 ) ) ( ON ?auto_89037 ?auto_89038 ) ( ON ?auto_89036 ?auto_89037 ) ( ON ?auto_89035 ?auto_89036 ) ( ON ?auto_89034 ?auto_89035 ) ( CLEAR ?auto_89032 ) ( ON ?auto_89033 ?auto_89034 ) ( CLEAR ?auto_89033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_89032 ?auto_89033 )
      ( MAKE-7PILE ?auto_89032 ?auto_89033 ?auto_89034 ?auto_89035 ?auto_89036 ?auto_89037 ?auto_89038 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89062 - BLOCK
      ?auto_89063 - BLOCK
      ?auto_89064 - BLOCK
      ?auto_89065 - BLOCK
      ?auto_89066 - BLOCK
      ?auto_89067 - BLOCK
      ?auto_89068 - BLOCK
    )
    :vars
    (
      ?auto_89069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89068 ?auto_89069 ) ( not ( = ?auto_89062 ?auto_89063 ) ) ( not ( = ?auto_89062 ?auto_89064 ) ) ( not ( = ?auto_89062 ?auto_89065 ) ) ( not ( = ?auto_89062 ?auto_89066 ) ) ( not ( = ?auto_89062 ?auto_89067 ) ) ( not ( = ?auto_89062 ?auto_89068 ) ) ( not ( = ?auto_89062 ?auto_89069 ) ) ( not ( = ?auto_89063 ?auto_89064 ) ) ( not ( = ?auto_89063 ?auto_89065 ) ) ( not ( = ?auto_89063 ?auto_89066 ) ) ( not ( = ?auto_89063 ?auto_89067 ) ) ( not ( = ?auto_89063 ?auto_89068 ) ) ( not ( = ?auto_89063 ?auto_89069 ) ) ( not ( = ?auto_89064 ?auto_89065 ) ) ( not ( = ?auto_89064 ?auto_89066 ) ) ( not ( = ?auto_89064 ?auto_89067 ) ) ( not ( = ?auto_89064 ?auto_89068 ) ) ( not ( = ?auto_89064 ?auto_89069 ) ) ( not ( = ?auto_89065 ?auto_89066 ) ) ( not ( = ?auto_89065 ?auto_89067 ) ) ( not ( = ?auto_89065 ?auto_89068 ) ) ( not ( = ?auto_89065 ?auto_89069 ) ) ( not ( = ?auto_89066 ?auto_89067 ) ) ( not ( = ?auto_89066 ?auto_89068 ) ) ( not ( = ?auto_89066 ?auto_89069 ) ) ( not ( = ?auto_89067 ?auto_89068 ) ) ( not ( = ?auto_89067 ?auto_89069 ) ) ( not ( = ?auto_89068 ?auto_89069 ) ) ( ON ?auto_89067 ?auto_89068 ) ( ON ?auto_89066 ?auto_89067 ) ( ON ?auto_89065 ?auto_89066 ) ( ON ?auto_89064 ?auto_89065 ) ( ON ?auto_89063 ?auto_89064 ) ( ON ?auto_89062 ?auto_89063 ) ( CLEAR ?auto_89062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_89062 )
      ( MAKE-7PILE ?auto_89062 ?auto_89063 ?auto_89064 ?auto_89065 ?auto_89066 ?auto_89067 ?auto_89068 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_89093 - BLOCK
      ?auto_89094 - BLOCK
      ?auto_89095 - BLOCK
      ?auto_89096 - BLOCK
      ?auto_89097 - BLOCK
      ?auto_89098 - BLOCK
      ?auto_89099 - BLOCK
      ?auto_89100 - BLOCK
    )
    :vars
    (
      ?auto_89101 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_89099 ) ( ON ?auto_89100 ?auto_89101 ) ( CLEAR ?auto_89100 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_89093 ) ( ON ?auto_89094 ?auto_89093 ) ( ON ?auto_89095 ?auto_89094 ) ( ON ?auto_89096 ?auto_89095 ) ( ON ?auto_89097 ?auto_89096 ) ( ON ?auto_89098 ?auto_89097 ) ( ON ?auto_89099 ?auto_89098 ) ( not ( = ?auto_89093 ?auto_89094 ) ) ( not ( = ?auto_89093 ?auto_89095 ) ) ( not ( = ?auto_89093 ?auto_89096 ) ) ( not ( = ?auto_89093 ?auto_89097 ) ) ( not ( = ?auto_89093 ?auto_89098 ) ) ( not ( = ?auto_89093 ?auto_89099 ) ) ( not ( = ?auto_89093 ?auto_89100 ) ) ( not ( = ?auto_89093 ?auto_89101 ) ) ( not ( = ?auto_89094 ?auto_89095 ) ) ( not ( = ?auto_89094 ?auto_89096 ) ) ( not ( = ?auto_89094 ?auto_89097 ) ) ( not ( = ?auto_89094 ?auto_89098 ) ) ( not ( = ?auto_89094 ?auto_89099 ) ) ( not ( = ?auto_89094 ?auto_89100 ) ) ( not ( = ?auto_89094 ?auto_89101 ) ) ( not ( = ?auto_89095 ?auto_89096 ) ) ( not ( = ?auto_89095 ?auto_89097 ) ) ( not ( = ?auto_89095 ?auto_89098 ) ) ( not ( = ?auto_89095 ?auto_89099 ) ) ( not ( = ?auto_89095 ?auto_89100 ) ) ( not ( = ?auto_89095 ?auto_89101 ) ) ( not ( = ?auto_89096 ?auto_89097 ) ) ( not ( = ?auto_89096 ?auto_89098 ) ) ( not ( = ?auto_89096 ?auto_89099 ) ) ( not ( = ?auto_89096 ?auto_89100 ) ) ( not ( = ?auto_89096 ?auto_89101 ) ) ( not ( = ?auto_89097 ?auto_89098 ) ) ( not ( = ?auto_89097 ?auto_89099 ) ) ( not ( = ?auto_89097 ?auto_89100 ) ) ( not ( = ?auto_89097 ?auto_89101 ) ) ( not ( = ?auto_89098 ?auto_89099 ) ) ( not ( = ?auto_89098 ?auto_89100 ) ) ( not ( = ?auto_89098 ?auto_89101 ) ) ( not ( = ?auto_89099 ?auto_89100 ) ) ( not ( = ?auto_89099 ?auto_89101 ) ) ( not ( = ?auto_89100 ?auto_89101 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_89100 ?auto_89101 )
      ( !STACK ?auto_89100 ?auto_89099 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_89127 - BLOCK
      ?auto_89128 - BLOCK
      ?auto_89129 - BLOCK
      ?auto_89130 - BLOCK
      ?auto_89131 - BLOCK
      ?auto_89132 - BLOCK
      ?auto_89133 - BLOCK
      ?auto_89134 - BLOCK
    )
    :vars
    (
      ?auto_89135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89134 ?auto_89135 ) ( ON-TABLE ?auto_89127 ) ( ON ?auto_89128 ?auto_89127 ) ( ON ?auto_89129 ?auto_89128 ) ( ON ?auto_89130 ?auto_89129 ) ( ON ?auto_89131 ?auto_89130 ) ( ON ?auto_89132 ?auto_89131 ) ( not ( = ?auto_89127 ?auto_89128 ) ) ( not ( = ?auto_89127 ?auto_89129 ) ) ( not ( = ?auto_89127 ?auto_89130 ) ) ( not ( = ?auto_89127 ?auto_89131 ) ) ( not ( = ?auto_89127 ?auto_89132 ) ) ( not ( = ?auto_89127 ?auto_89133 ) ) ( not ( = ?auto_89127 ?auto_89134 ) ) ( not ( = ?auto_89127 ?auto_89135 ) ) ( not ( = ?auto_89128 ?auto_89129 ) ) ( not ( = ?auto_89128 ?auto_89130 ) ) ( not ( = ?auto_89128 ?auto_89131 ) ) ( not ( = ?auto_89128 ?auto_89132 ) ) ( not ( = ?auto_89128 ?auto_89133 ) ) ( not ( = ?auto_89128 ?auto_89134 ) ) ( not ( = ?auto_89128 ?auto_89135 ) ) ( not ( = ?auto_89129 ?auto_89130 ) ) ( not ( = ?auto_89129 ?auto_89131 ) ) ( not ( = ?auto_89129 ?auto_89132 ) ) ( not ( = ?auto_89129 ?auto_89133 ) ) ( not ( = ?auto_89129 ?auto_89134 ) ) ( not ( = ?auto_89129 ?auto_89135 ) ) ( not ( = ?auto_89130 ?auto_89131 ) ) ( not ( = ?auto_89130 ?auto_89132 ) ) ( not ( = ?auto_89130 ?auto_89133 ) ) ( not ( = ?auto_89130 ?auto_89134 ) ) ( not ( = ?auto_89130 ?auto_89135 ) ) ( not ( = ?auto_89131 ?auto_89132 ) ) ( not ( = ?auto_89131 ?auto_89133 ) ) ( not ( = ?auto_89131 ?auto_89134 ) ) ( not ( = ?auto_89131 ?auto_89135 ) ) ( not ( = ?auto_89132 ?auto_89133 ) ) ( not ( = ?auto_89132 ?auto_89134 ) ) ( not ( = ?auto_89132 ?auto_89135 ) ) ( not ( = ?auto_89133 ?auto_89134 ) ) ( not ( = ?auto_89133 ?auto_89135 ) ) ( not ( = ?auto_89134 ?auto_89135 ) ) ( CLEAR ?auto_89132 ) ( ON ?auto_89133 ?auto_89134 ) ( CLEAR ?auto_89133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_89127 ?auto_89128 ?auto_89129 ?auto_89130 ?auto_89131 ?auto_89132 ?auto_89133 )
      ( MAKE-8PILE ?auto_89127 ?auto_89128 ?auto_89129 ?auto_89130 ?auto_89131 ?auto_89132 ?auto_89133 ?auto_89134 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_89161 - BLOCK
      ?auto_89162 - BLOCK
      ?auto_89163 - BLOCK
      ?auto_89164 - BLOCK
      ?auto_89165 - BLOCK
      ?auto_89166 - BLOCK
      ?auto_89167 - BLOCK
      ?auto_89168 - BLOCK
    )
    :vars
    (
      ?auto_89169 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89168 ?auto_89169 ) ( ON-TABLE ?auto_89161 ) ( ON ?auto_89162 ?auto_89161 ) ( ON ?auto_89163 ?auto_89162 ) ( ON ?auto_89164 ?auto_89163 ) ( ON ?auto_89165 ?auto_89164 ) ( not ( = ?auto_89161 ?auto_89162 ) ) ( not ( = ?auto_89161 ?auto_89163 ) ) ( not ( = ?auto_89161 ?auto_89164 ) ) ( not ( = ?auto_89161 ?auto_89165 ) ) ( not ( = ?auto_89161 ?auto_89166 ) ) ( not ( = ?auto_89161 ?auto_89167 ) ) ( not ( = ?auto_89161 ?auto_89168 ) ) ( not ( = ?auto_89161 ?auto_89169 ) ) ( not ( = ?auto_89162 ?auto_89163 ) ) ( not ( = ?auto_89162 ?auto_89164 ) ) ( not ( = ?auto_89162 ?auto_89165 ) ) ( not ( = ?auto_89162 ?auto_89166 ) ) ( not ( = ?auto_89162 ?auto_89167 ) ) ( not ( = ?auto_89162 ?auto_89168 ) ) ( not ( = ?auto_89162 ?auto_89169 ) ) ( not ( = ?auto_89163 ?auto_89164 ) ) ( not ( = ?auto_89163 ?auto_89165 ) ) ( not ( = ?auto_89163 ?auto_89166 ) ) ( not ( = ?auto_89163 ?auto_89167 ) ) ( not ( = ?auto_89163 ?auto_89168 ) ) ( not ( = ?auto_89163 ?auto_89169 ) ) ( not ( = ?auto_89164 ?auto_89165 ) ) ( not ( = ?auto_89164 ?auto_89166 ) ) ( not ( = ?auto_89164 ?auto_89167 ) ) ( not ( = ?auto_89164 ?auto_89168 ) ) ( not ( = ?auto_89164 ?auto_89169 ) ) ( not ( = ?auto_89165 ?auto_89166 ) ) ( not ( = ?auto_89165 ?auto_89167 ) ) ( not ( = ?auto_89165 ?auto_89168 ) ) ( not ( = ?auto_89165 ?auto_89169 ) ) ( not ( = ?auto_89166 ?auto_89167 ) ) ( not ( = ?auto_89166 ?auto_89168 ) ) ( not ( = ?auto_89166 ?auto_89169 ) ) ( not ( = ?auto_89167 ?auto_89168 ) ) ( not ( = ?auto_89167 ?auto_89169 ) ) ( not ( = ?auto_89168 ?auto_89169 ) ) ( ON ?auto_89167 ?auto_89168 ) ( CLEAR ?auto_89165 ) ( ON ?auto_89166 ?auto_89167 ) ( CLEAR ?auto_89166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_89161 ?auto_89162 ?auto_89163 ?auto_89164 ?auto_89165 ?auto_89166 )
      ( MAKE-8PILE ?auto_89161 ?auto_89162 ?auto_89163 ?auto_89164 ?auto_89165 ?auto_89166 ?auto_89167 ?auto_89168 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_89195 - BLOCK
      ?auto_89196 - BLOCK
      ?auto_89197 - BLOCK
      ?auto_89198 - BLOCK
      ?auto_89199 - BLOCK
      ?auto_89200 - BLOCK
      ?auto_89201 - BLOCK
      ?auto_89202 - BLOCK
    )
    :vars
    (
      ?auto_89203 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89202 ?auto_89203 ) ( ON-TABLE ?auto_89195 ) ( ON ?auto_89196 ?auto_89195 ) ( ON ?auto_89197 ?auto_89196 ) ( ON ?auto_89198 ?auto_89197 ) ( not ( = ?auto_89195 ?auto_89196 ) ) ( not ( = ?auto_89195 ?auto_89197 ) ) ( not ( = ?auto_89195 ?auto_89198 ) ) ( not ( = ?auto_89195 ?auto_89199 ) ) ( not ( = ?auto_89195 ?auto_89200 ) ) ( not ( = ?auto_89195 ?auto_89201 ) ) ( not ( = ?auto_89195 ?auto_89202 ) ) ( not ( = ?auto_89195 ?auto_89203 ) ) ( not ( = ?auto_89196 ?auto_89197 ) ) ( not ( = ?auto_89196 ?auto_89198 ) ) ( not ( = ?auto_89196 ?auto_89199 ) ) ( not ( = ?auto_89196 ?auto_89200 ) ) ( not ( = ?auto_89196 ?auto_89201 ) ) ( not ( = ?auto_89196 ?auto_89202 ) ) ( not ( = ?auto_89196 ?auto_89203 ) ) ( not ( = ?auto_89197 ?auto_89198 ) ) ( not ( = ?auto_89197 ?auto_89199 ) ) ( not ( = ?auto_89197 ?auto_89200 ) ) ( not ( = ?auto_89197 ?auto_89201 ) ) ( not ( = ?auto_89197 ?auto_89202 ) ) ( not ( = ?auto_89197 ?auto_89203 ) ) ( not ( = ?auto_89198 ?auto_89199 ) ) ( not ( = ?auto_89198 ?auto_89200 ) ) ( not ( = ?auto_89198 ?auto_89201 ) ) ( not ( = ?auto_89198 ?auto_89202 ) ) ( not ( = ?auto_89198 ?auto_89203 ) ) ( not ( = ?auto_89199 ?auto_89200 ) ) ( not ( = ?auto_89199 ?auto_89201 ) ) ( not ( = ?auto_89199 ?auto_89202 ) ) ( not ( = ?auto_89199 ?auto_89203 ) ) ( not ( = ?auto_89200 ?auto_89201 ) ) ( not ( = ?auto_89200 ?auto_89202 ) ) ( not ( = ?auto_89200 ?auto_89203 ) ) ( not ( = ?auto_89201 ?auto_89202 ) ) ( not ( = ?auto_89201 ?auto_89203 ) ) ( not ( = ?auto_89202 ?auto_89203 ) ) ( ON ?auto_89201 ?auto_89202 ) ( ON ?auto_89200 ?auto_89201 ) ( CLEAR ?auto_89198 ) ( ON ?auto_89199 ?auto_89200 ) ( CLEAR ?auto_89199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_89195 ?auto_89196 ?auto_89197 ?auto_89198 ?auto_89199 )
      ( MAKE-8PILE ?auto_89195 ?auto_89196 ?auto_89197 ?auto_89198 ?auto_89199 ?auto_89200 ?auto_89201 ?auto_89202 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_89229 - BLOCK
      ?auto_89230 - BLOCK
      ?auto_89231 - BLOCK
      ?auto_89232 - BLOCK
      ?auto_89233 - BLOCK
      ?auto_89234 - BLOCK
      ?auto_89235 - BLOCK
      ?auto_89236 - BLOCK
    )
    :vars
    (
      ?auto_89237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89236 ?auto_89237 ) ( ON-TABLE ?auto_89229 ) ( ON ?auto_89230 ?auto_89229 ) ( ON ?auto_89231 ?auto_89230 ) ( not ( = ?auto_89229 ?auto_89230 ) ) ( not ( = ?auto_89229 ?auto_89231 ) ) ( not ( = ?auto_89229 ?auto_89232 ) ) ( not ( = ?auto_89229 ?auto_89233 ) ) ( not ( = ?auto_89229 ?auto_89234 ) ) ( not ( = ?auto_89229 ?auto_89235 ) ) ( not ( = ?auto_89229 ?auto_89236 ) ) ( not ( = ?auto_89229 ?auto_89237 ) ) ( not ( = ?auto_89230 ?auto_89231 ) ) ( not ( = ?auto_89230 ?auto_89232 ) ) ( not ( = ?auto_89230 ?auto_89233 ) ) ( not ( = ?auto_89230 ?auto_89234 ) ) ( not ( = ?auto_89230 ?auto_89235 ) ) ( not ( = ?auto_89230 ?auto_89236 ) ) ( not ( = ?auto_89230 ?auto_89237 ) ) ( not ( = ?auto_89231 ?auto_89232 ) ) ( not ( = ?auto_89231 ?auto_89233 ) ) ( not ( = ?auto_89231 ?auto_89234 ) ) ( not ( = ?auto_89231 ?auto_89235 ) ) ( not ( = ?auto_89231 ?auto_89236 ) ) ( not ( = ?auto_89231 ?auto_89237 ) ) ( not ( = ?auto_89232 ?auto_89233 ) ) ( not ( = ?auto_89232 ?auto_89234 ) ) ( not ( = ?auto_89232 ?auto_89235 ) ) ( not ( = ?auto_89232 ?auto_89236 ) ) ( not ( = ?auto_89232 ?auto_89237 ) ) ( not ( = ?auto_89233 ?auto_89234 ) ) ( not ( = ?auto_89233 ?auto_89235 ) ) ( not ( = ?auto_89233 ?auto_89236 ) ) ( not ( = ?auto_89233 ?auto_89237 ) ) ( not ( = ?auto_89234 ?auto_89235 ) ) ( not ( = ?auto_89234 ?auto_89236 ) ) ( not ( = ?auto_89234 ?auto_89237 ) ) ( not ( = ?auto_89235 ?auto_89236 ) ) ( not ( = ?auto_89235 ?auto_89237 ) ) ( not ( = ?auto_89236 ?auto_89237 ) ) ( ON ?auto_89235 ?auto_89236 ) ( ON ?auto_89234 ?auto_89235 ) ( ON ?auto_89233 ?auto_89234 ) ( CLEAR ?auto_89231 ) ( ON ?auto_89232 ?auto_89233 ) ( CLEAR ?auto_89232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89229 ?auto_89230 ?auto_89231 ?auto_89232 )
      ( MAKE-8PILE ?auto_89229 ?auto_89230 ?auto_89231 ?auto_89232 ?auto_89233 ?auto_89234 ?auto_89235 ?auto_89236 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_89263 - BLOCK
      ?auto_89264 - BLOCK
      ?auto_89265 - BLOCK
      ?auto_89266 - BLOCK
      ?auto_89267 - BLOCK
      ?auto_89268 - BLOCK
      ?auto_89269 - BLOCK
      ?auto_89270 - BLOCK
    )
    :vars
    (
      ?auto_89271 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89270 ?auto_89271 ) ( ON-TABLE ?auto_89263 ) ( ON ?auto_89264 ?auto_89263 ) ( not ( = ?auto_89263 ?auto_89264 ) ) ( not ( = ?auto_89263 ?auto_89265 ) ) ( not ( = ?auto_89263 ?auto_89266 ) ) ( not ( = ?auto_89263 ?auto_89267 ) ) ( not ( = ?auto_89263 ?auto_89268 ) ) ( not ( = ?auto_89263 ?auto_89269 ) ) ( not ( = ?auto_89263 ?auto_89270 ) ) ( not ( = ?auto_89263 ?auto_89271 ) ) ( not ( = ?auto_89264 ?auto_89265 ) ) ( not ( = ?auto_89264 ?auto_89266 ) ) ( not ( = ?auto_89264 ?auto_89267 ) ) ( not ( = ?auto_89264 ?auto_89268 ) ) ( not ( = ?auto_89264 ?auto_89269 ) ) ( not ( = ?auto_89264 ?auto_89270 ) ) ( not ( = ?auto_89264 ?auto_89271 ) ) ( not ( = ?auto_89265 ?auto_89266 ) ) ( not ( = ?auto_89265 ?auto_89267 ) ) ( not ( = ?auto_89265 ?auto_89268 ) ) ( not ( = ?auto_89265 ?auto_89269 ) ) ( not ( = ?auto_89265 ?auto_89270 ) ) ( not ( = ?auto_89265 ?auto_89271 ) ) ( not ( = ?auto_89266 ?auto_89267 ) ) ( not ( = ?auto_89266 ?auto_89268 ) ) ( not ( = ?auto_89266 ?auto_89269 ) ) ( not ( = ?auto_89266 ?auto_89270 ) ) ( not ( = ?auto_89266 ?auto_89271 ) ) ( not ( = ?auto_89267 ?auto_89268 ) ) ( not ( = ?auto_89267 ?auto_89269 ) ) ( not ( = ?auto_89267 ?auto_89270 ) ) ( not ( = ?auto_89267 ?auto_89271 ) ) ( not ( = ?auto_89268 ?auto_89269 ) ) ( not ( = ?auto_89268 ?auto_89270 ) ) ( not ( = ?auto_89268 ?auto_89271 ) ) ( not ( = ?auto_89269 ?auto_89270 ) ) ( not ( = ?auto_89269 ?auto_89271 ) ) ( not ( = ?auto_89270 ?auto_89271 ) ) ( ON ?auto_89269 ?auto_89270 ) ( ON ?auto_89268 ?auto_89269 ) ( ON ?auto_89267 ?auto_89268 ) ( ON ?auto_89266 ?auto_89267 ) ( CLEAR ?auto_89264 ) ( ON ?auto_89265 ?auto_89266 ) ( CLEAR ?auto_89265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89263 ?auto_89264 ?auto_89265 )
      ( MAKE-8PILE ?auto_89263 ?auto_89264 ?auto_89265 ?auto_89266 ?auto_89267 ?auto_89268 ?auto_89269 ?auto_89270 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_89297 - BLOCK
      ?auto_89298 - BLOCK
      ?auto_89299 - BLOCK
      ?auto_89300 - BLOCK
      ?auto_89301 - BLOCK
      ?auto_89302 - BLOCK
      ?auto_89303 - BLOCK
      ?auto_89304 - BLOCK
    )
    :vars
    (
      ?auto_89305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89304 ?auto_89305 ) ( ON-TABLE ?auto_89297 ) ( not ( = ?auto_89297 ?auto_89298 ) ) ( not ( = ?auto_89297 ?auto_89299 ) ) ( not ( = ?auto_89297 ?auto_89300 ) ) ( not ( = ?auto_89297 ?auto_89301 ) ) ( not ( = ?auto_89297 ?auto_89302 ) ) ( not ( = ?auto_89297 ?auto_89303 ) ) ( not ( = ?auto_89297 ?auto_89304 ) ) ( not ( = ?auto_89297 ?auto_89305 ) ) ( not ( = ?auto_89298 ?auto_89299 ) ) ( not ( = ?auto_89298 ?auto_89300 ) ) ( not ( = ?auto_89298 ?auto_89301 ) ) ( not ( = ?auto_89298 ?auto_89302 ) ) ( not ( = ?auto_89298 ?auto_89303 ) ) ( not ( = ?auto_89298 ?auto_89304 ) ) ( not ( = ?auto_89298 ?auto_89305 ) ) ( not ( = ?auto_89299 ?auto_89300 ) ) ( not ( = ?auto_89299 ?auto_89301 ) ) ( not ( = ?auto_89299 ?auto_89302 ) ) ( not ( = ?auto_89299 ?auto_89303 ) ) ( not ( = ?auto_89299 ?auto_89304 ) ) ( not ( = ?auto_89299 ?auto_89305 ) ) ( not ( = ?auto_89300 ?auto_89301 ) ) ( not ( = ?auto_89300 ?auto_89302 ) ) ( not ( = ?auto_89300 ?auto_89303 ) ) ( not ( = ?auto_89300 ?auto_89304 ) ) ( not ( = ?auto_89300 ?auto_89305 ) ) ( not ( = ?auto_89301 ?auto_89302 ) ) ( not ( = ?auto_89301 ?auto_89303 ) ) ( not ( = ?auto_89301 ?auto_89304 ) ) ( not ( = ?auto_89301 ?auto_89305 ) ) ( not ( = ?auto_89302 ?auto_89303 ) ) ( not ( = ?auto_89302 ?auto_89304 ) ) ( not ( = ?auto_89302 ?auto_89305 ) ) ( not ( = ?auto_89303 ?auto_89304 ) ) ( not ( = ?auto_89303 ?auto_89305 ) ) ( not ( = ?auto_89304 ?auto_89305 ) ) ( ON ?auto_89303 ?auto_89304 ) ( ON ?auto_89302 ?auto_89303 ) ( ON ?auto_89301 ?auto_89302 ) ( ON ?auto_89300 ?auto_89301 ) ( ON ?auto_89299 ?auto_89300 ) ( CLEAR ?auto_89297 ) ( ON ?auto_89298 ?auto_89299 ) ( CLEAR ?auto_89298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_89297 ?auto_89298 )
      ( MAKE-8PILE ?auto_89297 ?auto_89298 ?auto_89299 ?auto_89300 ?auto_89301 ?auto_89302 ?auto_89303 ?auto_89304 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_89331 - BLOCK
      ?auto_89332 - BLOCK
      ?auto_89333 - BLOCK
      ?auto_89334 - BLOCK
      ?auto_89335 - BLOCK
      ?auto_89336 - BLOCK
      ?auto_89337 - BLOCK
      ?auto_89338 - BLOCK
    )
    :vars
    (
      ?auto_89339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89338 ?auto_89339 ) ( not ( = ?auto_89331 ?auto_89332 ) ) ( not ( = ?auto_89331 ?auto_89333 ) ) ( not ( = ?auto_89331 ?auto_89334 ) ) ( not ( = ?auto_89331 ?auto_89335 ) ) ( not ( = ?auto_89331 ?auto_89336 ) ) ( not ( = ?auto_89331 ?auto_89337 ) ) ( not ( = ?auto_89331 ?auto_89338 ) ) ( not ( = ?auto_89331 ?auto_89339 ) ) ( not ( = ?auto_89332 ?auto_89333 ) ) ( not ( = ?auto_89332 ?auto_89334 ) ) ( not ( = ?auto_89332 ?auto_89335 ) ) ( not ( = ?auto_89332 ?auto_89336 ) ) ( not ( = ?auto_89332 ?auto_89337 ) ) ( not ( = ?auto_89332 ?auto_89338 ) ) ( not ( = ?auto_89332 ?auto_89339 ) ) ( not ( = ?auto_89333 ?auto_89334 ) ) ( not ( = ?auto_89333 ?auto_89335 ) ) ( not ( = ?auto_89333 ?auto_89336 ) ) ( not ( = ?auto_89333 ?auto_89337 ) ) ( not ( = ?auto_89333 ?auto_89338 ) ) ( not ( = ?auto_89333 ?auto_89339 ) ) ( not ( = ?auto_89334 ?auto_89335 ) ) ( not ( = ?auto_89334 ?auto_89336 ) ) ( not ( = ?auto_89334 ?auto_89337 ) ) ( not ( = ?auto_89334 ?auto_89338 ) ) ( not ( = ?auto_89334 ?auto_89339 ) ) ( not ( = ?auto_89335 ?auto_89336 ) ) ( not ( = ?auto_89335 ?auto_89337 ) ) ( not ( = ?auto_89335 ?auto_89338 ) ) ( not ( = ?auto_89335 ?auto_89339 ) ) ( not ( = ?auto_89336 ?auto_89337 ) ) ( not ( = ?auto_89336 ?auto_89338 ) ) ( not ( = ?auto_89336 ?auto_89339 ) ) ( not ( = ?auto_89337 ?auto_89338 ) ) ( not ( = ?auto_89337 ?auto_89339 ) ) ( not ( = ?auto_89338 ?auto_89339 ) ) ( ON ?auto_89337 ?auto_89338 ) ( ON ?auto_89336 ?auto_89337 ) ( ON ?auto_89335 ?auto_89336 ) ( ON ?auto_89334 ?auto_89335 ) ( ON ?auto_89333 ?auto_89334 ) ( ON ?auto_89332 ?auto_89333 ) ( ON ?auto_89331 ?auto_89332 ) ( CLEAR ?auto_89331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_89331 )
      ( MAKE-8PILE ?auto_89331 ?auto_89332 ?auto_89333 ?auto_89334 ?auto_89335 ?auto_89336 ?auto_89337 ?auto_89338 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_89366 - BLOCK
      ?auto_89367 - BLOCK
      ?auto_89368 - BLOCK
      ?auto_89369 - BLOCK
      ?auto_89370 - BLOCK
      ?auto_89371 - BLOCK
      ?auto_89372 - BLOCK
      ?auto_89373 - BLOCK
      ?auto_89374 - BLOCK
    )
    :vars
    (
      ?auto_89375 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_89373 ) ( ON ?auto_89374 ?auto_89375 ) ( CLEAR ?auto_89374 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_89366 ) ( ON ?auto_89367 ?auto_89366 ) ( ON ?auto_89368 ?auto_89367 ) ( ON ?auto_89369 ?auto_89368 ) ( ON ?auto_89370 ?auto_89369 ) ( ON ?auto_89371 ?auto_89370 ) ( ON ?auto_89372 ?auto_89371 ) ( ON ?auto_89373 ?auto_89372 ) ( not ( = ?auto_89366 ?auto_89367 ) ) ( not ( = ?auto_89366 ?auto_89368 ) ) ( not ( = ?auto_89366 ?auto_89369 ) ) ( not ( = ?auto_89366 ?auto_89370 ) ) ( not ( = ?auto_89366 ?auto_89371 ) ) ( not ( = ?auto_89366 ?auto_89372 ) ) ( not ( = ?auto_89366 ?auto_89373 ) ) ( not ( = ?auto_89366 ?auto_89374 ) ) ( not ( = ?auto_89366 ?auto_89375 ) ) ( not ( = ?auto_89367 ?auto_89368 ) ) ( not ( = ?auto_89367 ?auto_89369 ) ) ( not ( = ?auto_89367 ?auto_89370 ) ) ( not ( = ?auto_89367 ?auto_89371 ) ) ( not ( = ?auto_89367 ?auto_89372 ) ) ( not ( = ?auto_89367 ?auto_89373 ) ) ( not ( = ?auto_89367 ?auto_89374 ) ) ( not ( = ?auto_89367 ?auto_89375 ) ) ( not ( = ?auto_89368 ?auto_89369 ) ) ( not ( = ?auto_89368 ?auto_89370 ) ) ( not ( = ?auto_89368 ?auto_89371 ) ) ( not ( = ?auto_89368 ?auto_89372 ) ) ( not ( = ?auto_89368 ?auto_89373 ) ) ( not ( = ?auto_89368 ?auto_89374 ) ) ( not ( = ?auto_89368 ?auto_89375 ) ) ( not ( = ?auto_89369 ?auto_89370 ) ) ( not ( = ?auto_89369 ?auto_89371 ) ) ( not ( = ?auto_89369 ?auto_89372 ) ) ( not ( = ?auto_89369 ?auto_89373 ) ) ( not ( = ?auto_89369 ?auto_89374 ) ) ( not ( = ?auto_89369 ?auto_89375 ) ) ( not ( = ?auto_89370 ?auto_89371 ) ) ( not ( = ?auto_89370 ?auto_89372 ) ) ( not ( = ?auto_89370 ?auto_89373 ) ) ( not ( = ?auto_89370 ?auto_89374 ) ) ( not ( = ?auto_89370 ?auto_89375 ) ) ( not ( = ?auto_89371 ?auto_89372 ) ) ( not ( = ?auto_89371 ?auto_89373 ) ) ( not ( = ?auto_89371 ?auto_89374 ) ) ( not ( = ?auto_89371 ?auto_89375 ) ) ( not ( = ?auto_89372 ?auto_89373 ) ) ( not ( = ?auto_89372 ?auto_89374 ) ) ( not ( = ?auto_89372 ?auto_89375 ) ) ( not ( = ?auto_89373 ?auto_89374 ) ) ( not ( = ?auto_89373 ?auto_89375 ) ) ( not ( = ?auto_89374 ?auto_89375 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_89374 ?auto_89375 )
      ( !STACK ?auto_89374 ?auto_89373 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_89404 - BLOCK
      ?auto_89405 - BLOCK
      ?auto_89406 - BLOCK
      ?auto_89407 - BLOCK
      ?auto_89408 - BLOCK
      ?auto_89409 - BLOCK
      ?auto_89410 - BLOCK
      ?auto_89411 - BLOCK
      ?auto_89412 - BLOCK
    )
    :vars
    (
      ?auto_89413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89412 ?auto_89413 ) ( ON-TABLE ?auto_89404 ) ( ON ?auto_89405 ?auto_89404 ) ( ON ?auto_89406 ?auto_89405 ) ( ON ?auto_89407 ?auto_89406 ) ( ON ?auto_89408 ?auto_89407 ) ( ON ?auto_89409 ?auto_89408 ) ( ON ?auto_89410 ?auto_89409 ) ( not ( = ?auto_89404 ?auto_89405 ) ) ( not ( = ?auto_89404 ?auto_89406 ) ) ( not ( = ?auto_89404 ?auto_89407 ) ) ( not ( = ?auto_89404 ?auto_89408 ) ) ( not ( = ?auto_89404 ?auto_89409 ) ) ( not ( = ?auto_89404 ?auto_89410 ) ) ( not ( = ?auto_89404 ?auto_89411 ) ) ( not ( = ?auto_89404 ?auto_89412 ) ) ( not ( = ?auto_89404 ?auto_89413 ) ) ( not ( = ?auto_89405 ?auto_89406 ) ) ( not ( = ?auto_89405 ?auto_89407 ) ) ( not ( = ?auto_89405 ?auto_89408 ) ) ( not ( = ?auto_89405 ?auto_89409 ) ) ( not ( = ?auto_89405 ?auto_89410 ) ) ( not ( = ?auto_89405 ?auto_89411 ) ) ( not ( = ?auto_89405 ?auto_89412 ) ) ( not ( = ?auto_89405 ?auto_89413 ) ) ( not ( = ?auto_89406 ?auto_89407 ) ) ( not ( = ?auto_89406 ?auto_89408 ) ) ( not ( = ?auto_89406 ?auto_89409 ) ) ( not ( = ?auto_89406 ?auto_89410 ) ) ( not ( = ?auto_89406 ?auto_89411 ) ) ( not ( = ?auto_89406 ?auto_89412 ) ) ( not ( = ?auto_89406 ?auto_89413 ) ) ( not ( = ?auto_89407 ?auto_89408 ) ) ( not ( = ?auto_89407 ?auto_89409 ) ) ( not ( = ?auto_89407 ?auto_89410 ) ) ( not ( = ?auto_89407 ?auto_89411 ) ) ( not ( = ?auto_89407 ?auto_89412 ) ) ( not ( = ?auto_89407 ?auto_89413 ) ) ( not ( = ?auto_89408 ?auto_89409 ) ) ( not ( = ?auto_89408 ?auto_89410 ) ) ( not ( = ?auto_89408 ?auto_89411 ) ) ( not ( = ?auto_89408 ?auto_89412 ) ) ( not ( = ?auto_89408 ?auto_89413 ) ) ( not ( = ?auto_89409 ?auto_89410 ) ) ( not ( = ?auto_89409 ?auto_89411 ) ) ( not ( = ?auto_89409 ?auto_89412 ) ) ( not ( = ?auto_89409 ?auto_89413 ) ) ( not ( = ?auto_89410 ?auto_89411 ) ) ( not ( = ?auto_89410 ?auto_89412 ) ) ( not ( = ?auto_89410 ?auto_89413 ) ) ( not ( = ?auto_89411 ?auto_89412 ) ) ( not ( = ?auto_89411 ?auto_89413 ) ) ( not ( = ?auto_89412 ?auto_89413 ) ) ( CLEAR ?auto_89410 ) ( ON ?auto_89411 ?auto_89412 ) ( CLEAR ?auto_89411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_89404 ?auto_89405 ?auto_89406 ?auto_89407 ?auto_89408 ?auto_89409 ?auto_89410 ?auto_89411 )
      ( MAKE-9PILE ?auto_89404 ?auto_89405 ?auto_89406 ?auto_89407 ?auto_89408 ?auto_89409 ?auto_89410 ?auto_89411 ?auto_89412 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_89442 - BLOCK
      ?auto_89443 - BLOCK
      ?auto_89444 - BLOCK
      ?auto_89445 - BLOCK
      ?auto_89446 - BLOCK
      ?auto_89447 - BLOCK
      ?auto_89448 - BLOCK
      ?auto_89449 - BLOCK
      ?auto_89450 - BLOCK
    )
    :vars
    (
      ?auto_89451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89450 ?auto_89451 ) ( ON-TABLE ?auto_89442 ) ( ON ?auto_89443 ?auto_89442 ) ( ON ?auto_89444 ?auto_89443 ) ( ON ?auto_89445 ?auto_89444 ) ( ON ?auto_89446 ?auto_89445 ) ( ON ?auto_89447 ?auto_89446 ) ( not ( = ?auto_89442 ?auto_89443 ) ) ( not ( = ?auto_89442 ?auto_89444 ) ) ( not ( = ?auto_89442 ?auto_89445 ) ) ( not ( = ?auto_89442 ?auto_89446 ) ) ( not ( = ?auto_89442 ?auto_89447 ) ) ( not ( = ?auto_89442 ?auto_89448 ) ) ( not ( = ?auto_89442 ?auto_89449 ) ) ( not ( = ?auto_89442 ?auto_89450 ) ) ( not ( = ?auto_89442 ?auto_89451 ) ) ( not ( = ?auto_89443 ?auto_89444 ) ) ( not ( = ?auto_89443 ?auto_89445 ) ) ( not ( = ?auto_89443 ?auto_89446 ) ) ( not ( = ?auto_89443 ?auto_89447 ) ) ( not ( = ?auto_89443 ?auto_89448 ) ) ( not ( = ?auto_89443 ?auto_89449 ) ) ( not ( = ?auto_89443 ?auto_89450 ) ) ( not ( = ?auto_89443 ?auto_89451 ) ) ( not ( = ?auto_89444 ?auto_89445 ) ) ( not ( = ?auto_89444 ?auto_89446 ) ) ( not ( = ?auto_89444 ?auto_89447 ) ) ( not ( = ?auto_89444 ?auto_89448 ) ) ( not ( = ?auto_89444 ?auto_89449 ) ) ( not ( = ?auto_89444 ?auto_89450 ) ) ( not ( = ?auto_89444 ?auto_89451 ) ) ( not ( = ?auto_89445 ?auto_89446 ) ) ( not ( = ?auto_89445 ?auto_89447 ) ) ( not ( = ?auto_89445 ?auto_89448 ) ) ( not ( = ?auto_89445 ?auto_89449 ) ) ( not ( = ?auto_89445 ?auto_89450 ) ) ( not ( = ?auto_89445 ?auto_89451 ) ) ( not ( = ?auto_89446 ?auto_89447 ) ) ( not ( = ?auto_89446 ?auto_89448 ) ) ( not ( = ?auto_89446 ?auto_89449 ) ) ( not ( = ?auto_89446 ?auto_89450 ) ) ( not ( = ?auto_89446 ?auto_89451 ) ) ( not ( = ?auto_89447 ?auto_89448 ) ) ( not ( = ?auto_89447 ?auto_89449 ) ) ( not ( = ?auto_89447 ?auto_89450 ) ) ( not ( = ?auto_89447 ?auto_89451 ) ) ( not ( = ?auto_89448 ?auto_89449 ) ) ( not ( = ?auto_89448 ?auto_89450 ) ) ( not ( = ?auto_89448 ?auto_89451 ) ) ( not ( = ?auto_89449 ?auto_89450 ) ) ( not ( = ?auto_89449 ?auto_89451 ) ) ( not ( = ?auto_89450 ?auto_89451 ) ) ( ON ?auto_89449 ?auto_89450 ) ( CLEAR ?auto_89447 ) ( ON ?auto_89448 ?auto_89449 ) ( CLEAR ?auto_89448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_89442 ?auto_89443 ?auto_89444 ?auto_89445 ?auto_89446 ?auto_89447 ?auto_89448 )
      ( MAKE-9PILE ?auto_89442 ?auto_89443 ?auto_89444 ?auto_89445 ?auto_89446 ?auto_89447 ?auto_89448 ?auto_89449 ?auto_89450 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_89480 - BLOCK
      ?auto_89481 - BLOCK
      ?auto_89482 - BLOCK
      ?auto_89483 - BLOCK
      ?auto_89484 - BLOCK
      ?auto_89485 - BLOCK
      ?auto_89486 - BLOCK
      ?auto_89487 - BLOCK
      ?auto_89488 - BLOCK
    )
    :vars
    (
      ?auto_89489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89488 ?auto_89489 ) ( ON-TABLE ?auto_89480 ) ( ON ?auto_89481 ?auto_89480 ) ( ON ?auto_89482 ?auto_89481 ) ( ON ?auto_89483 ?auto_89482 ) ( ON ?auto_89484 ?auto_89483 ) ( not ( = ?auto_89480 ?auto_89481 ) ) ( not ( = ?auto_89480 ?auto_89482 ) ) ( not ( = ?auto_89480 ?auto_89483 ) ) ( not ( = ?auto_89480 ?auto_89484 ) ) ( not ( = ?auto_89480 ?auto_89485 ) ) ( not ( = ?auto_89480 ?auto_89486 ) ) ( not ( = ?auto_89480 ?auto_89487 ) ) ( not ( = ?auto_89480 ?auto_89488 ) ) ( not ( = ?auto_89480 ?auto_89489 ) ) ( not ( = ?auto_89481 ?auto_89482 ) ) ( not ( = ?auto_89481 ?auto_89483 ) ) ( not ( = ?auto_89481 ?auto_89484 ) ) ( not ( = ?auto_89481 ?auto_89485 ) ) ( not ( = ?auto_89481 ?auto_89486 ) ) ( not ( = ?auto_89481 ?auto_89487 ) ) ( not ( = ?auto_89481 ?auto_89488 ) ) ( not ( = ?auto_89481 ?auto_89489 ) ) ( not ( = ?auto_89482 ?auto_89483 ) ) ( not ( = ?auto_89482 ?auto_89484 ) ) ( not ( = ?auto_89482 ?auto_89485 ) ) ( not ( = ?auto_89482 ?auto_89486 ) ) ( not ( = ?auto_89482 ?auto_89487 ) ) ( not ( = ?auto_89482 ?auto_89488 ) ) ( not ( = ?auto_89482 ?auto_89489 ) ) ( not ( = ?auto_89483 ?auto_89484 ) ) ( not ( = ?auto_89483 ?auto_89485 ) ) ( not ( = ?auto_89483 ?auto_89486 ) ) ( not ( = ?auto_89483 ?auto_89487 ) ) ( not ( = ?auto_89483 ?auto_89488 ) ) ( not ( = ?auto_89483 ?auto_89489 ) ) ( not ( = ?auto_89484 ?auto_89485 ) ) ( not ( = ?auto_89484 ?auto_89486 ) ) ( not ( = ?auto_89484 ?auto_89487 ) ) ( not ( = ?auto_89484 ?auto_89488 ) ) ( not ( = ?auto_89484 ?auto_89489 ) ) ( not ( = ?auto_89485 ?auto_89486 ) ) ( not ( = ?auto_89485 ?auto_89487 ) ) ( not ( = ?auto_89485 ?auto_89488 ) ) ( not ( = ?auto_89485 ?auto_89489 ) ) ( not ( = ?auto_89486 ?auto_89487 ) ) ( not ( = ?auto_89486 ?auto_89488 ) ) ( not ( = ?auto_89486 ?auto_89489 ) ) ( not ( = ?auto_89487 ?auto_89488 ) ) ( not ( = ?auto_89487 ?auto_89489 ) ) ( not ( = ?auto_89488 ?auto_89489 ) ) ( ON ?auto_89487 ?auto_89488 ) ( ON ?auto_89486 ?auto_89487 ) ( CLEAR ?auto_89484 ) ( ON ?auto_89485 ?auto_89486 ) ( CLEAR ?auto_89485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_89480 ?auto_89481 ?auto_89482 ?auto_89483 ?auto_89484 ?auto_89485 )
      ( MAKE-9PILE ?auto_89480 ?auto_89481 ?auto_89482 ?auto_89483 ?auto_89484 ?auto_89485 ?auto_89486 ?auto_89487 ?auto_89488 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_89518 - BLOCK
      ?auto_89519 - BLOCK
      ?auto_89520 - BLOCK
      ?auto_89521 - BLOCK
      ?auto_89522 - BLOCK
      ?auto_89523 - BLOCK
      ?auto_89524 - BLOCK
      ?auto_89525 - BLOCK
      ?auto_89526 - BLOCK
    )
    :vars
    (
      ?auto_89527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89526 ?auto_89527 ) ( ON-TABLE ?auto_89518 ) ( ON ?auto_89519 ?auto_89518 ) ( ON ?auto_89520 ?auto_89519 ) ( ON ?auto_89521 ?auto_89520 ) ( not ( = ?auto_89518 ?auto_89519 ) ) ( not ( = ?auto_89518 ?auto_89520 ) ) ( not ( = ?auto_89518 ?auto_89521 ) ) ( not ( = ?auto_89518 ?auto_89522 ) ) ( not ( = ?auto_89518 ?auto_89523 ) ) ( not ( = ?auto_89518 ?auto_89524 ) ) ( not ( = ?auto_89518 ?auto_89525 ) ) ( not ( = ?auto_89518 ?auto_89526 ) ) ( not ( = ?auto_89518 ?auto_89527 ) ) ( not ( = ?auto_89519 ?auto_89520 ) ) ( not ( = ?auto_89519 ?auto_89521 ) ) ( not ( = ?auto_89519 ?auto_89522 ) ) ( not ( = ?auto_89519 ?auto_89523 ) ) ( not ( = ?auto_89519 ?auto_89524 ) ) ( not ( = ?auto_89519 ?auto_89525 ) ) ( not ( = ?auto_89519 ?auto_89526 ) ) ( not ( = ?auto_89519 ?auto_89527 ) ) ( not ( = ?auto_89520 ?auto_89521 ) ) ( not ( = ?auto_89520 ?auto_89522 ) ) ( not ( = ?auto_89520 ?auto_89523 ) ) ( not ( = ?auto_89520 ?auto_89524 ) ) ( not ( = ?auto_89520 ?auto_89525 ) ) ( not ( = ?auto_89520 ?auto_89526 ) ) ( not ( = ?auto_89520 ?auto_89527 ) ) ( not ( = ?auto_89521 ?auto_89522 ) ) ( not ( = ?auto_89521 ?auto_89523 ) ) ( not ( = ?auto_89521 ?auto_89524 ) ) ( not ( = ?auto_89521 ?auto_89525 ) ) ( not ( = ?auto_89521 ?auto_89526 ) ) ( not ( = ?auto_89521 ?auto_89527 ) ) ( not ( = ?auto_89522 ?auto_89523 ) ) ( not ( = ?auto_89522 ?auto_89524 ) ) ( not ( = ?auto_89522 ?auto_89525 ) ) ( not ( = ?auto_89522 ?auto_89526 ) ) ( not ( = ?auto_89522 ?auto_89527 ) ) ( not ( = ?auto_89523 ?auto_89524 ) ) ( not ( = ?auto_89523 ?auto_89525 ) ) ( not ( = ?auto_89523 ?auto_89526 ) ) ( not ( = ?auto_89523 ?auto_89527 ) ) ( not ( = ?auto_89524 ?auto_89525 ) ) ( not ( = ?auto_89524 ?auto_89526 ) ) ( not ( = ?auto_89524 ?auto_89527 ) ) ( not ( = ?auto_89525 ?auto_89526 ) ) ( not ( = ?auto_89525 ?auto_89527 ) ) ( not ( = ?auto_89526 ?auto_89527 ) ) ( ON ?auto_89525 ?auto_89526 ) ( ON ?auto_89524 ?auto_89525 ) ( ON ?auto_89523 ?auto_89524 ) ( CLEAR ?auto_89521 ) ( ON ?auto_89522 ?auto_89523 ) ( CLEAR ?auto_89522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_89518 ?auto_89519 ?auto_89520 ?auto_89521 ?auto_89522 )
      ( MAKE-9PILE ?auto_89518 ?auto_89519 ?auto_89520 ?auto_89521 ?auto_89522 ?auto_89523 ?auto_89524 ?auto_89525 ?auto_89526 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_89556 - BLOCK
      ?auto_89557 - BLOCK
      ?auto_89558 - BLOCK
      ?auto_89559 - BLOCK
      ?auto_89560 - BLOCK
      ?auto_89561 - BLOCK
      ?auto_89562 - BLOCK
      ?auto_89563 - BLOCK
      ?auto_89564 - BLOCK
    )
    :vars
    (
      ?auto_89565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89564 ?auto_89565 ) ( ON-TABLE ?auto_89556 ) ( ON ?auto_89557 ?auto_89556 ) ( ON ?auto_89558 ?auto_89557 ) ( not ( = ?auto_89556 ?auto_89557 ) ) ( not ( = ?auto_89556 ?auto_89558 ) ) ( not ( = ?auto_89556 ?auto_89559 ) ) ( not ( = ?auto_89556 ?auto_89560 ) ) ( not ( = ?auto_89556 ?auto_89561 ) ) ( not ( = ?auto_89556 ?auto_89562 ) ) ( not ( = ?auto_89556 ?auto_89563 ) ) ( not ( = ?auto_89556 ?auto_89564 ) ) ( not ( = ?auto_89556 ?auto_89565 ) ) ( not ( = ?auto_89557 ?auto_89558 ) ) ( not ( = ?auto_89557 ?auto_89559 ) ) ( not ( = ?auto_89557 ?auto_89560 ) ) ( not ( = ?auto_89557 ?auto_89561 ) ) ( not ( = ?auto_89557 ?auto_89562 ) ) ( not ( = ?auto_89557 ?auto_89563 ) ) ( not ( = ?auto_89557 ?auto_89564 ) ) ( not ( = ?auto_89557 ?auto_89565 ) ) ( not ( = ?auto_89558 ?auto_89559 ) ) ( not ( = ?auto_89558 ?auto_89560 ) ) ( not ( = ?auto_89558 ?auto_89561 ) ) ( not ( = ?auto_89558 ?auto_89562 ) ) ( not ( = ?auto_89558 ?auto_89563 ) ) ( not ( = ?auto_89558 ?auto_89564 ) ) ( not ( = ?auto_89558 ?auto_89565 ) ) ( not ( = ?auto_89559 ?auto_89560 ) ) ( not ( = ?auto_89559 ?auto_89561 ) ) ( not ( = ?auto_89559 ?auto_89562 ) ) ( not ( = ?auto_89559 ?auto_89563 ) ) ( not ( = ?auto_89559 ?auto_89564 ) ) ( not ( = ?auto_89559 ?auto_89565 ) ) ( not ( = ?auto_89560 ?auto_89561 ) ) ( not ( = ?auto_89560 ?auto_89562 ) ) ( not ( = ?auto_89560 ?auto_89563 ) ) ( not ( = ?auto_89560 ?auto_89564 ) ) ( not ( = ?auto_89560 ?auto_89565 ) ) ( not ( = ?auto_89561 ?auto_89562 ) ) ( not ( = ?auto_89561 ?auto_89563 ) ) ( not ( = ?auto_89561 ?auto_89564 ) ) ( not ( = ?auto_89561 ?auto_89565 ) ) ( not ( = ?auto_89562 ?auto_89563 ) ) ( not ( = ?auto_89562 ?auto_89564 ) ) ( not ( = ?auto_89562 ?auto_89565 ) ) ( not ( = ?auto_89563 ?auto_89564 ) ) ( not ( = ?auto_89563 ?auto_89565 ) ) ( not ( = ?auto_89564 ?auto_89565 ) ) ( ON ?auto_89563 ?auto_89564 ) ( ON ?auto_89562 ?auto_89563 ) ( ON ?auto_89561 ?auto_89562 ) ( ON ?auto_89560 ?auto_89561 ) ( CLEAR ?auto_89558 ) ( ON ?auto_89559 ?auto_89560 ) ( CLEAR ?auto_89559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89556 ?auto_89557 ?auto_89558 ?auto_89559 )
      ( MAKE-9PILE ?auto_89556 ?auto_89557 ?auto_89558 ?auto_89559 ?auto_89560 ?auto_89561 ?auto_89562 ?auto_89563 ?auto_89564 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_89594 - BLOCK
      ?auto_89595 - BLOCK
      ?auto_89596 - BLOCK
      ?auto_89597 - BLOCK
      ?auto_89598 - BLOCK
      ?auto_89599 - BLOCK
      ?auto_89600 - BLOCK
      ?auto_89601 - BLOCK
      ?auto_89602 - BLOCK
    )
    :vars
    (
      ?auto_89603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89602 ?auto_89603 ) ( ON-TABLE ?auto_89594 ) ( ON ?auto_89595 ?auto_89594 ) ( not ( = ?auto_89594 ?auto_89595 ) ) ( not ( = ?auto_89594 ?auto_89596 ) ) ( not ( = ?auto_89594 ?auto_89597 ) ) ( not ( = ?auto_89594 ?auto_89598 ) ) ( not ( = ?auto_89594 ?auto_89599 ) ) ( not ( = ?auto_89594 ?auto_89600 ) ) ( not ( = ?auto_89594 ?auto_89601 ) ) ( not ( = ?auto_89594 ?auto_89602 ) ) ( not ( = ?auto_89594 ?auto_89603 ) ) ( not ( = ?auto_89595 ?auto_89596 ) ) ( not ( = ?auto_89595 ?auto_89597 ) ) ( not ( = ?auto_89595 ?auto_89598 ) ) ( not ( = ?auto_89595 ?auto_89599 ) ) ( not ( = ?auto_89595 ?auto_89600 ) ) ( not ( = ?auto_89595 ?auto_89601 ) ) ( not ( = ?auto_89595 ?auto_89602 ) ) ( not ( = ?auto_89595 ?auto_89603 ) ) ( not ( = ?auto_89596 ?auto_89597 ) ) ( not ( = ?auto_89596 ?auto_89598 ) ) ( not ( = ?auto_89596 ?auto_89599 ) ) ( not ( = ?auto_89596 ?auto_89600 ) ) ( not ( = ?auto_89596 ?auto_89601 ) ) ( not ( = ?auto_89596 ?auto_89602 ) ) ( not ( = ?auto_89596 ?auto_89603 ) ) ( not ( = ?auto_89597 ?auto_89598 ) ) ( not ( = ?auto_89597 ?auto_89599 ) ) ( not ( = ?auto_89597 ?auto_89600 ) ) ( not ( = ?auto_89597 ?auto_89601 ) ) ( not ( = ?auto_89597 ?auto_89602 ) ) ( not ( = ?auto_89597 ?auto_89603 ) ) ( not ( = ?auto_89598 ?auto_89599 ) ) ( not ( = ?auto_89598 ?auto_89600 ) ) ( not ( = ?auto_89598 ?auto_89601 ) ) ( not ( = ?auto_89598 ?auto_89602 ) ) ( not ( = ?auto_89598 ?auto_89603 ) ) ( not ( = ?auto_89599 ?auto_89600 ) ) ( not ( = ?auto_89599 ?auto_89601 ) ) ( not ( = ?auto_89599 ?auto_89602 ) ) ( not ( = ?auto_89599 ?auto_89603 ) ) ( not ( = ?auto_89600 ?auto_89601 ) ) ( not ( = ?auto_89600 ?auto_89602 ) ) ( not ( = ?auto_89600 ?auto_89603 ) ) ( not ( = ?auto_89601 ?auto_89602 ) ) ( not ( = ?auto_89601 ?auto_89603 ) ) ( not ( = ?auto_89602 ?auto_89603 ) ) ( ON ?auto_89601 ?auto_89602 ) ( ON ?auto_89600 ?auto_89601 ) ( ON ?auto_89599 ?auto_89600 ) ( ON ?auto_89598 ?auto_89599 ) ( ON ?auto_89597 ?auto_89598 ) ( CLEAR ?auto_89595 ) ( ON ?auto_89596 ?auto_89597 ) ( CLEAR ?auto_89596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89594 ?auto_89595 ?auto_89596 )
      ( MAKE-9PILE ?auto_89594 ?auto_89595 ?auto_89596 ?auto_89597 ?auto_89598 ?auto_89599 ?auto_89600 ?auto_89601 ?auto_89602 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_89632 - BLOCK
      ?auto_89633 - BLOCK
      ?auto_89634 - BLOCK
      ?auto_89635 - BLOCK
      ?auto_89636 - BLOCK
      ?auto_89637 - BLOCK
      ?auto_89638 - BLOCK
      ?auto_89639 - BLOCK
      ?auto_89640 - BLOCK
    )
    :vars
    (
      ?auto_89641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89640 ?auto_89641 ) ( ON-TABLE ?auto_89632 ) ( not ( = ?auto_89632 ?auto_89633 ) ) ( not ( = ?auto_89632 ?auto_89634 ) ) ( not ( = ?auto_89632 ?auto_89635 ) ) ( not ( = ?auto_89632 ?auto_89636 ) ) ( not ( = ?auto_89632 ?auto_89637 ) ) ( not ( = ?auto_89632 ?auto_89638 ) ) ( not ( = ?auto_89632 ?auto_89639 ) ) ( not ( = ?auto_89632 ?auto_89640 ) ) ( not ( = ?auto_89632 ?auto_89641 ) ) ( not ( = ?auto_89633 ?auto_89634 ) ) ( not ( = ?auto_89633 ?auto_89635 ) ) ( not ( = ?auto_89633 ?auto_89636 ) ) ( not ( = ?auto_89633 ?auto_89637 ) ) ( not ( = ?auto_89633 ?auto_89638 ) ) ( not ( = ?auto_89633 ?auto_89639 ) ) ( not ( = ?auto_89633 ?auto_89640 ) ) ( not ( = ?auto_89633 ?auto_89641 ) ) ( not ( = ?auto_89634 ?auto_89635 ) ) ( not ( = ?auto_89634 ?auto_89636 ) ) ( not ( = ?auto_89634 ?auto_89637 ) ) ( not ( = ?auto_89634 ?auto_89638 ) ) ( not ( = ?auto_89634 ?auto_89639 ) ) ( not ( = ?auto_89634 ?auto_89640 ) ) ( not ( = ?auto_89634 ?auto_89641 ) ) ( not ( = ?auto_89635 ?auto_89636 ) ) ( not ( = ?auto_89635 ?auto_89637 ) ) ( not ( = ?auto_89635 ?auto_89638 ) ) ( not ( = ?auto_89635 ?auto_89639 ) ) ( not ( = ?auto_89635 ?auto_89640 ) ) ( not ( = ?auto_89635 ?auto_89641 ) ) ( not ( = ?auto_89636 ?auto_89637 ) ) ( not ( = ?auto_89636 ?auto_89638 ) ) ( not ( = ?auto_89636 ?auto_89639 ) ) ( not ( = ?auto_89636 ?auto_89640 ) ) ( not ( = ?auto_89636 ?auto_89641 ) ) ( not ( = ?auto_89637 ?auto_89638 ) ) ( not ( = ?auto_89637 ?auto_89639 ) ) ( not ( = ?auto_89637 ?auto_89640 ) ) ( not ( = ?auto_89637 ?auto_89641 ) ) ( not ( = ?auto_89638 ?auto_89639 ) ) ( not ( = ?auto_89638 ?auto_89640 ) ) ( not ( = ?auto_89638 ?auto_89641 ) ) ( not ( = ?auto_89639 ?auto_89640 ) ) ( not ( = ?auto_89639 ?auto_89641 ) ) ( not ( = ?auto_89640 ?auto_89641 ) ) ( ON ?auto_89639 ?auto_89640 ) ( ON ?auto_89638 ?auto_89639 ) ( ON ?auto_89637 ?auto_89638 ) ( ON ?auto_89636 ?auto_89637 ) ( ON ?auto_89635 ?auto_89636 ) ( ON ?auto_89634 ?auto_89635 ) ( CLEAR ?auto_89632 ) ( ON ?auto_89633 ?auto_89634 ) ( CLEAR ?auto_89633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_89632 ?auto_89633 )
      ( MAKE-9PILE ?auto_89632 ?auto_89633 ?auto_89634 ?auto_89635 ?auto_89636 ?auto_89637 ?auto_89638 ?auto_89639 ?auto_89640 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_89670 - BLOCK
      ?auto_89671 - BLOCK
      ?auto_89672 - BLOCK
      ?auto_89673 - BLOCK
      ?auto_89674 - BLOCK
      ?auto_89675 - BLOCK
      ?auto_89676 - BLOCK
      ?auto_89677 - BLOCK
      ?auto_89678 - BLOCK
    )
    :vars
    (
      ?auto_89679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89678 ?auto_89679 ) ( not ( = ?auto_89670 ?auto_89671 ) ) ( not ( = ?auto_89670 ?auto_89672 ) ) ( not ( = ?auto_89670 ?auto_89673 ) ) ( not ( = ?auto_89670 ?auto_89674 ) ) ( not ( = ?auto_89670 ?auto_89675 ) ) ( not ( = ?auto_89670 ?auto_89676 ) ) ( not ( = ?auto_89670 ?auto_89677 ) ) ( not ( = ?auto_89670 ?auto_89678 ) ) ( not ( = ?auto_89670 ?auto_89679 ) ) ( not ( = ?auto_89671 ?auto_89672 ) ) ( not ( = ?auto_89671 ?auto_89673 ) ) ( not ( = ?auto_89671 ?auto_89674 ) ) ( not ( = ?auto_89671 ?auto_89675 ) ) ( not ( = ?auto_89671 ?auto_89676 ) ) ( not ( = ?auto_89671 ?auto_89677 ) ) ( not ( = ?auto_89671 ?auto_89678 ) ) ( not ( = ?auto_89671 ?auto_89679 ) ) ( not ( = ?auto_89672 ?auto_89673 ) ) ( not ( = ?auto_89672 ?auto_89674 ) ) ( not ( = ?auto_89672 ?auto_89675 ) ) ( not ( = ?auto_89672 ?auto_89676 ) ) ( not ( = ?auto_89672 ?auto_89677 ) ) ( not ( = ?auto_89672 ?auto_89678 ) ) ( not ( = ?auto_89672 ?auto_89679 ) ) ( not ( = ?auto_89673 ?auto_89674 ) ) ( not ( = ?auto_89673 ?auto_89675 ) ) ( not ( = ?auto_89673 ?auto_89676 ) ) ( not ( = ?auto_89673 ?auto_89677 ) ) ( not ( = ?auto_89673 ?auto_89678 ) ) ( not ( = ?auto_89673 ?auto_89679 ) ) ( not ( = ?auto_89674 ?auto_89675 ) ) ( not ( = ?auto_89674 ?auto_89676 ) ) ( not ( = ?auto_89674 ?auto_89677 ) ) ( not ( = ?auto_89674 ?auto_89678 ) ) ( not ( = ?auto_89674 ?auto_89679 ) ) ( not ( = ?auto_89675 ?auto_89676 ) ) ( not ( = ?auto_89675 ?auto_89677 ) ) ( not ( = ?auto_89675 ?auto_89678 ) ) ( not ( = ?auto_89675 ?auto_89679 ) ) ( not ( = ?auto_89676 ?auto_89677 ) ) ( not ( = ?auto_89676 ?auto_89678 ) ) ( not ( = ?auto_89676 ?auto_89679 ) ) ( not ( = ?auto_89677 ?auto_89678 ) ) ( not ( = ?auto_89677 ?auto_89679 ) ) ( not ( = ?auto_89678 ?auto_89679 ) ) ( ON ?auto_89677 ?auto_89678 ) ( ON ?auto_89676 ?auto_89677 ) ( ON ?auto_89675 ?auto_89676 ) ( ON ?auto_89674 ?auto_89675 ) ( ON ?auto_89673 ?auto_89674 ) ( ON ?auto_89672 ?auto_89673 ) ( ON ?auto_89671 ?auto_89672 ) ( ON ?auto_89670 ?auto_89671 ) ( CLEAR ?auto_89670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_89670 )
      ( MAKE-9PILE ?auto_89670 ?auto_89671 ?auto_89672 ?auto_89673 ?auto_89674 ?auto_89675 ?auto_89676 ?auto_89677 ?auto_89678 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_89709 - BLOCK
      ?auto_89710 - BLOCK
      ?auto_89711 - BLOCK
      ?auto_89712 - BLOCK
      ?auto_89713 - BLOCK
      ?auto_89714 - BLOCK
      ?auto_89715 - BLOCK
      ?auto_89716 - BLOCK
      ?auto_89717 - BLOCK
      ?auto_89718 - BLOCK
    )
    :vars
    (
      ?auto_89719 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_89717 ) ( ON ?auto_89718 ?auto_89719 ) ( CLEAR ?auto_89718 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_89709 ) ( ON ?auto_89710 ?auto_89709 ) ( ON ?auto_89711 ?auto_89710 ) ( ON ?auto_89712 ?auto_89711 ) ( ON ?auto_89713 ?auto_89712 ) ( ON ?auto_89714 ?auto_89713 ) ( ON ?auto_89715 ?auto_89714 ) ( ON ?auto_89716 ?auto_89715 ) ( ON ?auto_89717 ?auto_89716 ) ( not ( = ?auto_89709 ?auto_89710 ) ) ( not ( = ?auto_89709 ?auto_89711 ) ) ( not ( = ?auto_89709 ?auto_89712 ) ) ( not ( = ?auto_89709 ?auto_89713 ) ) ( not ( = ?auto_89709 ?auto_89714 ) ) ( not ( = ?auto_89709 ?auto_89715 ) ) ( not ( = ?auto_89709 ?auto_89716 ) ) ( not ( = ?auto_89709 ?auto_89717 ) ) ( not ( = ?auto_89709 ?auto_89718 ) ) ( not ( = ?auto_89709 ?auto_89719 ) ) ( not ( = ?auto_89710 ?auto_89711 ) ) ( not ( = ?auto_89710 ?auto_89712 ) ) ( not ( = ?auto_89710 ?auto_89713 ) ) ( not ( = ?auto_89710 ?auto_89714 ) ) ( not ( = ?auto_89710 ?auto_89715 ) ) ( not ( = ?auto_89710 ?auto_89716 ) ) ( not ( = ?auto_89710 ?auto_89717 ) ) ( not ( = ?auto_89710 ?auto_89718 ) ) ( not ( = ?auto_89710 ?auto_89719 ) ) ( not ( = ?auto_89711 ?auto_89712 ) ) ( not ( = ?auto_89711 ?auto_89713 ) ) ( not ( = ?auto_89711 ?auto_89714 ) ) ( not ( = ?auto_89711 ?auto_89715 ) ) ( not ( = ?auto_89711 ?auto_89716 ) ) ( not ( = ?auto_89711 ?auto_89717 ) ) ( not ( = ?auto_89711 ?auto_89718 ) ) ( not ( = ?auto_89711 ?auto_89719 ) ) ( not ( = ?auto_89712 ?auto_89713 ) ) ( not ( = ?auto_89712 ?auto_89714 ) ) ( not ( = ?auto_89712 ?auto_89715 ) ) ( not ( = ?auto_89712 ?auto_89716 ) ) ( not ( = ?auto_89712 ?auto_89717 ) ) ( not ( = ?auto_89712 ?auto_89718 ) ) ( not ( = ?auto_89712 ?auto_89719 ) ) ( not ( = ?auto_89713 ?auto_89714 ) ) ( not ( = ?auto_89713 ?auto_89715 ) ) ( not ( = ?auto_89713 ?auto_89716 ) ) ( not ( = ?auto_89713 ?auto_89717 ) ) ( not ( = ?auto_89713 ?auto_89718 ) ) ( not ( = ?auto_89713 ?auto_89719 ) ) ( not ( = ?auto_89714 ?auto_89715 ) ) ( not ( = ?auto_89714 ?auto_89716 ) ) ( not ( = ?auto_89714 ?auto_89717 ) ) ( not ( = ?auto_89714 ?auto_89718 ) ) ( not ( = ?auto_89714 ?auto_89719 ) ) ( not ( = ?auto_89715 ?auto_89716 ) ) ( not ( = ?auto_89715 ?auto_89717 ) ) ( not ( = ?auto_89715 ?auto_89718 ) ) ( not ( = ?auto_89715 ?auto_89719 ) ) ( not ( = ?auto_89716 ?auto_89717 ) ) ( not ( = ?auto_89716 ?auto_89718 ) ) ( not ( = ?auto_89716 ?auto_89719 ) ) ( not ( = ?auto_89717 ?auto_89718 ) ) ( not ( = ?auto_89717 ?auto_89719 ) ) ( not ( = ?auto_89718 ?auto_89719 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_89718 ?auto_89719 )
      ( !STACK ?auto_89718 ?auto_89717 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_89730 - BLOCK
      ?auto_89731 - BLOCK
      ?auto_89732 - BLOCK
      ?auto_89733 - BLOCK
      ?auto_89734 - BLOCK
      ?auto_89735 - BLOCK
      ?auto_89736 - BLOCK
      ?auto_89737 - BLOCK
      ?auto_89738 - BLOCK
      ?auto_89739 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_89738 ) ( ON-TABLE ?auto_89739 ) ( CLEAR ?auto_89739 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_89730 ) ( ON ?auto_89731 ?auto_89730 ) ( ON ?auto_89732 ?auto_89731 ) ( ON ?auto_89733 ?auto_89732 ) ( ON ?auto_89734 ?auto_89733 ) ( ON ?auto_89735 ?auto_89734 ) ( ON ?auto_89736 ?auto_89735 ) ( ON ?auto_89737 ?auto_89736 ) ( ON ?auto_89738 ?auto_89737 ) ( not ( = ?auto_89730 ?auto_89731 ) ) ( not ( = ?auto_89730 ?auto_89732 ) ) ( not ( = ?auto_89730 ?auto_89733 ) ) ( not ( = ?auto_89730 ?auto_89734 ) ) ( not ( = ?auto_89730 ?auto_89735 ) ) ( not ( = ?auto_89730 ?auto_89736 ) ) ( not ( = ?auto_89730 ?auto_89737 ) ) ( not ( = ?auto_89730 ?auto_89738 ) ) ( not ( = ?auto_89730 ?auto_89739 ) ) ( not ( = ?auto_89731 ?auto_89732 ) ) ( not ( = ?auto_89731 ?auto_89733 ) ) ( not ( = ?auto_89731 ?auto_89734 ) ) ( not ( = ?auto_89731 ?auto_89735 ) ) ( not ( = ?auto_89731 ?auto_89736 ) ) ( not ( = ?auto_89731 ?auto_89737 ) ) ( not ( = ?auto_89731 ?auto_89738 ) ) ( not ( = ?auto_89731 ?auto_89739 ) ) ( not ( = ?auto_89732 ?auto_89733 ) ) ( not ( = ?auto_89732 ?auto_89734 ) ) ( not ( = ?auto_89732 ?auto_89735 ) ) ( not ( = ?auto_89732 ?auto_89736 ) ) ( not ( = ?auto_89732 ?auto_89737 ) ) ( not ( = ?auto_89732 ?auto_89738 ) ) ( not ( = ?auto_89732 ?auto_89739 ) ) ( not ( = ?auto_89733 ?auto_89734 ) ) ( not ( = ?auto_89733 ?auto_89735 ) ) ( not ( = ?auto_89733 ?auto_89736 ) ) ( not ( = ?auto_89733 ?auto_89737 ) ) ( not ( = ?auto_89733 ?auto_89738 ) ) ( not ( = ?auto_89733 ?auto_89739 ) ) ( not ( = ?auto_89734 ?auto_89735 ) ) ( not ( = ?auto_89734 ?auto_89736 ) ) ( not ( = ?auto_89734 ?auto_89737 ) ) ( not ( = ?auto_89734 ?auto_89738 ) ) ( not ( = ?auto_89734 ?auto_89739 ) ) ( not ( = ?auto_89735 ?auto_89736 ) ) ( not ( = ?auto_89735 ?auto_89737 ) ) ( not ( = ?auto_89735 ?auto_89738 ) ) ( not ( = ?auto_89735 ?auto_89739 ) ) ( not ( = ?auto_89736 ?auto_89737 ) ) ( not ( = ?auto_89736 ?auto_89738 ) ) ( not ( = ?auto_89736 ?auto_89739 ) ) ( not ( = ?auto_89737 ?auto_89738 ) ) ( not ( = ?auto_89737 ?auto_89739 ) ) ( not ( = ?auto_89738 ?auto_89739 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_89739 )
      ( !STACK ?auto_89739 ?auto_89738 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_89750 - BLOCK
      ?auto_89751 - BLOCK
      ?auto_89752 - BLOCK
      ?auto_89753 - BLOCK
      ?auto_89754 - BLOCK
      ?auto_89755 - BLOCK
      ?auto_89756 - BLOCK
      ?auto_89757 - BLOCK
      ?auto_89758 - BLOCK
      ?auto_89759 - BLOCK
    )
    :vars
    (
      ?auto_89760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89759 ?auto_89760 ) ( ON-TABLE ?auto_89750 ) ( ON ?auto_89751 ?auto_89750 ) ( ON ?auto_89752 ?auto_89751 ) ( ON ?auto_89753 ?auto_89752 ) ( ON ?auto_89754 ?auto_89753 ) ( ON ?auto_89755 ?auto_89754 ) ( ON ?auto_89756 ?auto_89755 ) ( ON ?auto_89757 ?auto_89756 ) ( not ( = ?auto_89750 ?auto_89751 ) ) ( not ( = ?auto_89750 ?auto_89752 ) ) ( not ( = ?auto_89750 ?auto_89753 ) ) ( not ( = ?auto_89750 ?auto_89754 ) ) ( not ( = ?auto_89750 ?auto_89755 ) ) ( not ( = ?auto_89750 ?auto_89756 ) ) ( not ( = ?auto_89750 ?auto_89757 ) ) ( not ( = ?auto_89750 ?auto_89758 ) ) ( not ( = ?auto_89750 ?auto_89759 ) ) ( not ( = ?auto_89750 ?auto_89760 ) ) ( not ( = ?auto_89751 ?auto_89752 ) ) ( not ( = ?auto_89751 ?auto_89753 ) ) ( not ( = ?auto_89751 ?auto_89754 ) ) ( not ( = ?auto_89751 ?auto_89755 ) ) ( not ( = ?auto_89751 ?auto_89756 ) ) ( not ( = ?auto_89751 ?auto_89757 ) ) ( not ( = ?auto_89751 ?auto_89758 ) ) ( not ( = ?auto_89751 ?auto_89759 ) ) ( not ( = ?auto_89751 ?auto_89760 ) ) ( not ( = ?auto_89752 ?auto_89753 ) ) ( not ( = ?auto_89752 ?auto_89754 ) ) ( not ( = ?auto_89752 ?auto_89755 ) ) ( not ( = ?auto_89752 ?auto_89756 ) ) ( not ( = ?auto_89752 ?auto_89757 ) ) ( not ( = ?auto_89752 ?auto_89758 ) ) ( not ( = ?auto_89752 ?auto_89759 ) ) ( not ( = ?auto_89752 ?auto_89760 ) ) ( not ( = ?auto_89753 ?auto_89754 ) ) ( not ( = ?auto_89753 ?auto_89755 ) ) ( not ( = ?auto_89753 ?auto_89756 ) ) ( not ( = ?auto_89753 ?auto_89757 ) ) ( not ( = ?auto_89753 ?auto_89758 ) ) ( not ( = ?auto_89753 ?auto_89759 ) ) ( not ( = ?auto_89753 ?auto_89760 ) ) ( not ( = ?auto_89754 ?auto_89755 ) ) ( not ( = ?auto_89754 ?auto_89756 ) ) ( not ( = ?auto_89754 ?auto_89757 ) ) ( not ( = ?auto_89754 ?auto_89758 ) ) ( not ( = ?auto_89754 ?auto_89759 ) ) ( not ( = ?auto_89754 ?auto_89760 ) ) ( not ( = ?auto_89755 ?auto_89756 ) ) ( not ( = ?auto_89755 ?auto_89757 ) ) ( not ( = ?auto_89755 ?auto_89758 ) ) ( not ( = ?auto_89755 ?auto_89759 ) ) ( not ( = ?auto_89755 ?auto_89760 ) ) ( not ( = ?auto_89756 ?auto_89757 ) ) ( not ( = ?auto_89756 ?auto_89758 ) ) ( not ( = ?auto_89756 ?auto_89759 ) ) ( not ( = ?auto_89756 ?auto_89760 ) ) ( not ( = ?auto_89757 ?auto_89758 ) ) ( not ( = ?auto_89757 ?auto_89759 ) ) ( not ( = ?auto_89757 ?auto_89760 ) ) ( not ( = ?auto_89758 ?auto_89759 ) ) ( not ( = ?auto_89758 ?auto_89760 ) ) ( not ( = ?auto_89759 ?auto_89760 ) ) ( CLEAR ?auto_89757 ) ( ON ?auto_89758 ?auto_89759 ) ( CLEAR ?auto_89758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_89750 ?auto_89751 ?auto_89752 ?auto_89753 ?auto_89754 ?auto_89755 ?auto_89756 ?auto_89757 ?auto_89758 )
      ( MAKE-10PILE ?auto_89750 ?auto_89751 ?auto_89752 ?auto_89753 ?auto_89754 ?auto_89755 ?auto_89756 ?auto_89757 ?auto_89758 ?auto_89759 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_89771 - BLOCK
      ?auto_89772 - BLOCK
      ?auto_89773 - BLOCK
      ?auto_89774 - BLOCK
      ?auto_89775 - BLOCK
      ?auto_89776 - BLOCK
      ?auto_89777 - BLOCK
      ?auto_89778 - BLOCK
      ?auto_89779 - BLOCK
      ?auto_89780 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89780 ) ( ON-TABLE ?auto_89771 ) ( ON ?auto_89772 ?auto_89771 ) ( ON ?auto_89773 ?auto_89772 ) ( ON ?auto_89774 ?auto_89773 ) ( ON ?auto_89775 ?auto_89774 ) ( ON ?auto_89776 ?auto_89775 ) ( ON ?auto_89777 ?auto_89776 ) ( ON ?auto_89778 ?auto_89777 ) ( not ( = ?auto_89771 ?auto_89772 ) ) ( not ( = ?auto_89771 ?auto_89773 ) ) ( not ( = ?auto_89771 ?auto_89774 ) ) ( not ( = ?auto_89771 ?auto_89775 ) ) ( not ( = ?auto_89771 ?auto_89776 ) ) ( not ( = ?auto_89771 ?auto_89777 ) ) ( not ( = ?auto_89771 ?auto_89778 ) ) ( not ( = ?auto_89771 ?auto_89779 ) ) ( not ( = ?auto_89771 ?auto_89780 ) ) ( not ( = ?auto_89772 ?auto_89773 ) ) ( not ( = ?auto_89772 ?auto_89774 ) ) ( not ( = ?auto_89772 ?auto_89775 ) ) ( not ( = ?auto_89772 ?auto_89776 ) ) ( not ( = ?auto_89772 ?auto_89777 ) ) ( not ( = ?auto_89772 ?auto_89778 ) ) ( not ( = ?auto_89772 ?auto_89779 ) ) ( not ( = ?auto_89772 ?auto_89780 ) ) ( not ( = ?auto_89773 ?auto_89774 ) ) ( not ( = ?auto_89773 ?auto_89775 ) ) ( not ( = ?auto_89773 ?auto_89776 ) ) ( not ( = ?auto_89773 ?auto_89777 ) ) ( not ( = ?auto_89773 ?auto_89778 ) ) ( not ( = ?auto_89773 ?auto_89779 ) ) ( not ( = ?auto_89773 ?auto_89780 ) ) ( not ( = ?auto_89774 ?auto_89775 ) ) ( not ( = ?auto_89774 ?auto_89776 ) ) ( not ( = ?auto_89774 ?auto_89777 ) ) ( not ( = ?auto_89774 ?auto_89778 ) ) ( not ( = ?auto_89774 ?auto_89779 ) ) ( not ( = ?auto_89774 ?auto_89780 ) ) ( not ( = ?auto_89775 ?auto_89776 ) ) ( not ( = ?auto_89775 ?auto_89777 ) ) ( not ( = ?auto_89775 ?auto_89778 ) ) ( not ( = ?auto_89775 ?auto_89779 ) ) ( not ( = ?auto_89775 ?auto_89780 ) ) ( not ( = ?auto_89776 ?auto_89777 ) ) ( not ( = ?auto_89776 ?auto_89778 ) ) ( not ( = ?auto_89776 ?auto_89779 ) ) ( not ( = ?auto_89776 ?auto_89780 ) ) ( not ( = ?auto_89777 ?auto_89778 ) ) ( not ( = ?auto_89777 ?auto_89779 ) ) ( not ( = ?auto_89777 ?auto_89780 ) ) ( not ( = ?auto_89778 ?auto_89779 ) ) ( not ( = ?auto_89778 ?auto_89780 ) ) ( not ( = ?auto_89779 ?auto_89780 ) ) ( CLEAR ?auto_89778 ) ( ON ?auto_89779 ?auto_89780 ) ( CLEAR ?auto_89779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_89771 ?auto_89772 ?auto_89773 ?auto_89774 ?auto_89775 ?auto_89776 ?auto_89777 ?auto_89778 ?auto_89779 )
      ( MAKE-10PILE ?auto_89771 ?auto_89772 ?auto_89773 ?auto_89774 ?auto_89775 ?auto_89776 ?auto_89777 ?auto_89778 ?auto_89779 ?auto_89780 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_89791 - BLOCK
      ?auto_89792 - BLOCK
      ?auto_89793 - BLOCK
      ?auto_89794 - BLOCK
      ?auto_89795 - BLOCK
      ?auto_89796 - BLOCK
      ?auto_89797 - BLOCK
      ?auto_89798 - BLOCK
      ?auto_89799 - BLOCK
      ?auto_89800 - BLOCK
    )
    :vars
    (
      ?auto_89801 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89800 ?auto_89801 ) ( ON-TABLE ?auto_89791 ) ( ON ?auto_89792 ?auto_89791 ) ( ON ?auto_89793 ?auto_89792 ) ( ON ?auto_89794 ?auto_89793 ) ( ON ?auto_89795 ?auto_89794 ) ( ON ?auto_89796 ?auto_89795 ) ( ON ?auto_89797 ?auto_89796 ) ( not ( = ?auto_89791 ?auto_89792 ) ) ( not ( = ?auto_89791 ?auto_89793 ) ) ( not ( = ?auto_89791 ?auto_89794 ) ) ( not ( = ?auto_89791 ?auto_89795 ) ) ( not ( = ?auto_89791 ?auto_89796 ) ) ( not ( = ?auto_89791 ?auto_89797 ) ) ( not ( = ?auto_89791 ?auto_89798 ) ) ( not ( = ?auto_89791 ?auto_89799 ) ) ( not ( = ?auto_89791 ?auto_89800 ) ) ( not ( = ?auto_89791 ?auto_89801 ) ) ( not ( = ?auto_89792 ?auto_89793 ) ) ( not ( = ?auto_89792 ?auto_89794 ) ) ( not ( = ?auto_89792 ?auto_89795 ) ) ( not ( = ?auto_89792 ?auto_89796 ) ) ( not ( = ?auto_89792 ?auto_89797 ) ) ( not ( = ?auto_89792 ?auto_89798 ) ) ( not ( = ?auto_89792 ?auto_89799 ) ) ( not ( = ?auto_89792 ?auto_89800 ) ) ( not ( = ?auto_89792 ?auto_89801 ) ) ( not ( = ?auto_89793 ?auto_89794 ) ) ( not ( = ?auto_89793 ?auto_89795 ) ) ( not ( = ?auto_89793 ?auto_89796 ) ) ( not ( = ?auto_89793 ?auto_89797 ) ) ( not ( = ?auto_89793 ?auto_89798 ) ) ( not ( = ?auto_89793 ?auto_89799 ) ) ( not ( = ?auto_89793 ?auto_89800 ) ) ( not ( = ?auto_89793 ?auto_89801 ) ) ( not ( = ?auto_89794 ?auto_89795 ) ) ( not ( = ?auto_89794 ?auto_89796 ) ) ( not ( = ?auto_89794 ?auto_89797 ) ) ( not ( = ?auto_89794 ?auto_89798 ) ) ( not ( = ?auto_89794 ?auto_89799 ) ) ( not ( = ?auto_89794 ?auto_89800 ) ) ( not ( = ?auto_89794 ?auto_89801 ) ) ( not ( = ?auto_89795 ?auto_89796 ) ) ( not ( = ?auto_89795 ?auto_89797 ) ) ( not ( = ?auto_89795 ?auto_89798 ) ) ( not ( = ?auto_89795 ?auto_89799 ) ) ( not ( = ?auto_89795 ?auto_89800 ) ) ( not ( = ?auto_89795 ?auto_89801 ) ) ( not ( = ?auto_89796 ?auto_89797 ) ) ( not ( = ?auto_89796 ?auto_89798 ) ) ( not ( = ?auto_89796 ?auto_89799 ) ) ( not ( = ?auto_89796 ?auto_89800 ) ) ( not ( = ?auto_89796 ?auto_89801 ) ) ( not ( = ?auto_89797 ?auto_89798 ) ) ( not ( = ?auto_89797 ?auto_89799 ) ) ( not ( = ?auto_89797 ?auto_89800 ) ) ( not ( = ?auto_89797 ?auto_89801 ) ) ( not ( = ?auto_89798 ?auto_89799 ) ) ( not ( = ?auto_89798 ?auto_89800 ) ) ( not ( = ?auto_89798 ?auto_89801 ) ) ( not ( = ?auto_89799 ?auto_89800 ) ) ( not ( = ?auto_89799 ?auto_89801 ) ) ( not ( = ?auto_89800 ?auto_89801 ) ) ( ON ?auto_89799 ?auto_89800 ) ( CLEAR ?auto_89797 ) ( ON ?auto_89798 ?auto_89799 ) ( CLEAR ?auto_89798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_89791 ?auto_89792 ?auto_89793 ?auto_89794 ?auto_89795 ?auto_89796 ?auto_89797 ?auto_89798 )
      ( MAKE-10PILE ?auto_89791 ?auto_89792 ?auto_89793 ?auto_89794 ?auto_89795 ?auto_89796 ?auto_89797 ?auto_89798 ?auto_89799 ?auto_89800 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_89812 - BLOCK
      ?auto_89813 - BLOCK
      ?auto_89814 - BLOCK
      ?auto_89815 - BLOCK
      ?auto_89816 - BLOCK
      ?auto_89817 - BLOCK
      ?auto_89818 - BLOCK
      ?auto_89819 - BLOCK
      ?auto_89820 - BLOCK
      ?auto_89821 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89821 ) ( ON-TABLE ?auto_89812 ) ( ON ?auto_89813 ?auto_89812 ) ( ON ?auto_89814 ?auto_89813 ) ( ON ?auto_89815 ?auto_89814 ) ( ON ?auto_89816 ?auto_89815 ) ( ON ?auto_89817 ?auto_89816 ) ( ON ?auto_89818 ?auto_89817 ) ( not ( = ?auto_89812 ?auto_89813 ) ) ( not ( = ?auto_89812 ?auto_89814 ) ) ( not ( = ?auto_89812 ?auto_89815 ) ) ( not ( = ?auto_89812 ?auto_89816 ) ) ( not ( = ?auto_89812 ?auto_89817 ) ) ( not ( = ?auto_89812 ?auto_89818 ) ) ( not ( = ?auto_89812 ?auto_89819 ) ) ( not ( = ?auto_89812 ?auto_89820 ) ) ( not ( = ?auto_89812 ?auto_89821 ) ) ( not ( = ?auto_89813 ?auto_89814 ) ) ( not ( = ?auto_89813 ?auto_89815 ) ) ( not ( = ?auto_89813 ?auto_89816 ) ) ( not ( = ?auto_89813 ?auto_89817 ) ) ( not ( = ?auto_89813 ?auto_89818 ) ) ( not ( = ?auto_89813 ?auto_89819 ) ) ( not ( = ?auto_89813 ?auto_89820 ) ) ( not ( = ?auto_89813 ?auto_89821 ) ) ( not ( = ?auto_89814 ?auto_89815 ) ) ( not ( = ?auto_89814 ?auto_89816 ) ) ( not ( = ?auto_89814 ?auto_89817 ) ) ( not ( = ?auto_89814 ?auto_89818 ) ) ( not ( = ?auto_89814 ?auto_89819 ) ) ( not ( = ?auto_89814 ?auto_89820 ) ) ( not ( = ?auto_89814 ?auto_89821 ) ) ( not ( = ?auto_89815 ?auto_89816 ) ) ( not ( = ?auto_89815 ?auto_89817 ) ) ( not ( = ?auto_89815 ?auto_89818 ) ) ( not ( = ?auto_89815 ?auto_89819 ) ) ( not ( = ?auto_89815 ?auto_89820 ) ) ( not ( = ?auto_89815 ?auto_89821 ) ) ( not ( = ?auto_89816 ?auto_89817 ) ) ( not ( = ?auto_89816 ?auto_89818 ) ) ( not ( = ?auto_89816 ?auto_89819 ) ) ( not ( = ?auto_89816 ?auto_89820 ) ) ( not ( = ?auto_89816 ?auto_89821 ) ) ( not ( = ?auto_89817 ?auto_89818 ) ) ( not ( = ?auto_89817 ?auto_89819 ) ) ( not ( = ?auto_89817 ?auto_89820 ) ) ( not ( = ?auto_89817 ?auto_89821 ) ) ( not ( = ?auto_89818 ?auto_89819 ) ) ( not ( = ?auto_89818 ?auto_89820 ) ) ( not ( = ?auto_89818 ?auto_89821 ) ) ( not ( = ?auto_89819 ?auto_89820 ) ) ( not ( = ?auto_89819 ?auto_89821 ) ) ( not ( = ?auto_89820 ?auto_89821 ) ) ( ON ?auto_89820 ?auto_89821 ) ( CLEAR ?auto_89818 ) ( ON ?auto_89819 ?auto_89820 ) ( CLEAR ?auto_89819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_89812 ?auto_89813 ?auto_89814 ?auto_89815 ?auto_89816 ?auto_89817 ?auto_89818 ?auto_89819 )
      ( MAKE-10PILE ?auto_89812 ?auto_89813 ?auto_89814 ?auto_89815 ?auto_89816 ?auto_89817 ?auto_89818 ?auto_89819 ?auto_89820 ?auto_89821 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_89832 - BLOCK
      ?auto_89833 - BLOCK
      ?auto_89834 - BLOCK
      ?auto_89835 - BLOCK
      ?auto_89836 - BLOCK
      ?auto_89837 - BLOCK
      ?auto_89838 - BLOCK
      ?auto_89839 - BLOCK
      ?auto_89840 - BLOCK
      ?auto_89841 - BLOCK
    )
    :vars
    (
      ?auto_89842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89841 ?auto_89842 ) ( ON-TABLE ?auto_89832 ) ( ON ?auto_89833 ?auto_89832 ) ( ON ?auto_89834 ?auto_89833 ) ( ON ?auto_89835 ?auto_89834 ) ( ON ?auto_89836 ?auto_89835 ) ( ON ?auto_89837 ?auto_89836 ) ( not ( = ?auto_89832 ?auto_89833 ) ) ( not ( = ?auto_89832 ?auto_89834 ) ) ( not ( = ?auto_89832 ?auto_89835 ) ) ( not ( = ?auto_89832 ?auto_89836 ) ) ( not ( = ?auto_89832 ?auto_89837 ) ) ( not ( = ?auto_89832 ?auto_89838 ) ) ( not ( = ?auto_89832 ?auto_89839 ) ) ( not ( = ?auto_89832 ?auto_89840 ) ) ( not ( = ?auto_89832 ?auto_89841 ) ) ( not ( = ?auto_89832 ?auto_89842 ) ) ( not ( = ?auto_89833 ?auto_89834 ) ) ( not ( = ?auto_89833 ?auto_89835 ) ) ( not ( = ?auto_89833 ?auto_89836 ) ) ( not ( = ?auto_89833 ?auto_89837 ) ) ( not ( = ?auto_89833 ?auto_89838 ) ) ( not ( = ?auto_89833 ?auto_89839 ) ) ( not ( = ?auto_89833 ?auto_89840 ) ) ( not ( = ?auto_89833 ?auto_89841 ) ) ( not ( = ?auto_89833 ?auto_89842 ) ) ( not ( = ?auto_89834 ?auto_89835 ) ) ( not ( = ?auto_89834 ?auto_89836 ) ) ( not ( = ?auto_89834 ?auto_89837 ) ) ( not ( = ?auto_89834 ?auto_89838 ) ) ( not ( = ?auto_89834 ?auto_89839 ) ) ( not ( = ?auto_89834 ?auto_89840 ) ) ( not ( = ?auto_89834 ?auto_89841 ) ) ( not ( = ?auto_89834 ?auto_89842 ) ) ( not ( = ?auto_89835 ?auto_89836 ) ) ( not ( = ?auto_89835 ?auto_89837 ) ) ( not ( = ?auto_89835 ?auto_89838 ) ) ( not ( = ?auto_89835 ?auto_89839 ) ) ( not ( = ?auto_89835 ?auto_89840 ) ) ( not ( = ?auto_89835 ?auto_89841 ) ) ( not ( = ?auto_89835 ?auto_89842 ) ) ( not ( = ?auto_89836 ?auto_89837 ) ) ( not ( = ?auto_89836 ?auto_89838 ) ) ( not ( = ?auto_89836 ?auto_89839 ) ) ( not ( = ?auto_89836 ?auto_89840 ) ) ( not ( = ?auto_89836 ?auto_89841 ) ) ( not ( = ?auto_89836 ?auto_89842 ) ) ( not ( = ?auto_89837 ?auto_89838 ) ) ( not ( = ?auto_89837 ?auto_89839 ) ) ( not ( = ?auto_89837 ?auto_89840 ) ) ( not ( = ?auto_89837 ?auto_89841 ) ) ( not ( = ?auto_89837 ?auto_89842 ) ) ( not ( = ?auto_89838 ?auto_89839 ) ) ( not ( = ?auto_89838 ?auto_89840 ) ) ( not ( = ?auto_89838 ?auto_89841 ) ) ( not ( = ?auto_89838 ?auto_89842 ) ) ( not ( = ?auto_89839 ?auto_89840 ) ) ( not ( = ?auto_89839 ?auto_89841 ) ) ( not ( = ?auto_89839 ?auto_89842 ) ) ( not ( = ?auto_89840 ?auto_89841 ) ) ( not ( = ?auto_89840 ?auto_89842 ) ) ( not ( = ?auto_89841 ?auto_89842 ) ) ( ON ?auto_89840 ?auto_89841 ) ( ON ?auto_89839 ?auto_89840 ) ( CLEAR ?auto_89837 ) ( ON ?auto_89838 ?auto_89839 ) ( CLEAR ?auto_89838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_89832 ?auto_89833 ?auto_89834 ?auto_89835 ?auto_89836 ?auto_89837 ?auto_89838 )
      ( MAKE-10PILE ?auto_89832 ?auto_89833 ?auto_89834 ?auto_89835 ?auto_89836 ?auto_89837 ?auto_89838 ?auto_89839 ?auto_89840 ?auto_89841 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_89853 - BLOCK
      ?auto_89854 - BLOCK
      ?auto_89855 - BLOCK
      ?auto_89856 - BLOCK
      ?auto_89857 - BLOCK
      ?auto_89858 - BLOCK
      ?auto_89859 - BLOCK
      ?auto_89860 - BLOCK
      ?auto_89861 - BLOCK
      ?auto_89862 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89862 ) ( ON-TABLE ?auto_89853 ) ( ON ?auto_89854 ?auto_89853 ) ( ON ?auto_89855 ?auto_89854 ) ( ON ?auto_89856 ?auto_89855 ) ( ON ?auto_89857 ?auto_89856 ) ( ON ?auto_89858 ?auto_89857 ) ( not ( = ?auto_89853 ?auto_89854 ) ) ( not ( = ?auto_89853 ?auto_89855 ) ) ( not ( = ?auto_89853 ?auto_89856 ) ) ( not ( = ?auto_89853 ?auto_89857 ) ) ( not ( = ?auto_89853 ?auto_89858 ) ) ( not ( = ?auto_89853 ?auto_89859 ) ) ( not ( = ?auto_89853 ?auto_89860 ) ) ( not ( = ?auto_89853 ?auto_89861 ) ) ( not ( = ?auto_89853 ?auto_89862 ) ) ( not ( = ?auto_89854 ?auto_89855 ) ) ( not ( = ?auto_89854 ?auto_89856 ) ) ( not ( = ?auto_89854 ?auto_89857 ) ) ( not ( = ?auto_89854 ?auto_89858 ) ) ( not ( = ?auto_89854 ?auto_89859 ) ) ( not ( = ?auto_89854 ?auto_89860 ) ) ( not ( = ?auto_89854 ?auto_89861 ) ) ( not ( = ?auto_89854 ?auto_89862 ) ) ( not ( = ?auto_89855 ?auto_89856 ) ) ( not ( = ?auto_89855 ?auto_89857 ) ) ( not ( = ?auto_89855 ?auto_89858 ) ) ( not ( = ?auto_89855 ?auto_89859 ) ) ( not ( = ?auto_89855 ?auto_89860 ) ) ( not ( = ?auto_89855 ?auto_89861 ) ) ( not ( = ?auto_89855 ?auto_89862 ) ) ( not ( = ?auto_89856 ?auto_89857 ) ) ( not ( = ?auto_89856 ?auto_89858 ) ) ( not ( = ?auto_89856 ?auto_89859 ) ) ( not ( = ?auto_89856 ?auto_89860 ) ) ( not ( = ?auto_89856 ?auto_89861 ) ) ( not ( = ?auto_89856 ?auto_89862 ) ) ( not ( = ?auto_89857 ?auto_89858 ) ) ( not ( = ?auto_89857 ?auto_89859 ) ) ( not ( = ?auto_89857 ?auto_89860 ) ) ( not ( = ?auto_89857 ?auto_89861 ) ) ( not ( = ?auto_89857 ?auto_89862 ) ) ( not ( = ?auto_89858 ?auto_89859 ) ) ( not ( = ?auto_89858 ?auto_89860 ) ) ( not ( = ?auto_89858 ?auto_89861 ) ) ( not ( = ?auto_89858 ?auto_89862 ) ) ( not ( = ?auto_89859 ?auto_89860 ) ) ( not ( = ?auto_89859 ?auto_89861 ) ) ( not ( = ?auto_89859 ?auto_89862 ) ) ( not ( = ?auto_89860 ?auto_89861 ) ) ( not ( = ?auto_89860 ?auto_89862 ) ) ( not ( = ?auto_89861 ?auto_89862 ) ) ( ON ?auto_89861 ?auto_89862 ) ( ON ?auto_89860 ?auto_89861 ) ( CLEAR ?auto_89858 ) ( ON ?auto_89859 ?auto_89860 ) ( CLEAR ?auto_89859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_89853 ?auto_89854 ?auto_89855 ?auto_89856 ?auto_89857 ?auto_89858 ?auto_89859 )
      ( MAKE-10PILE ?auto_89853 ?auto_89854 ?auto_89855 ?auto_89856 ?auto_89857 ?auto_89858 ?auto_89859 ?auto_89860 ?auto_89861 ?auto_89862 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_89873 - BLOCK
      ?auto_89874 - BLOCK
      ?auto_89875 - BLOCK
      ?auto_89876 - BLOCK
      ?auto_89877 - BLOCK
      ?auto_89878 - BLOCK
      ?auto_89879 - BLOCK
      ?auto_89880 - BLOCK
      ?auto_89881 - BLOCK
      ?auto_89882 - BLOCK
    )
    :vars
    (
      ?auto_89883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89882 ?auto_89883 ) ( ON-TABLE ?auto_89873 ) ( ON ?auto_89874 ?auto_89873 ) ( ON ?auto_89875 ?auto_89874 ) ( ON ?auto_89876 ?auto_89875 ) ( ON ?auto_89877 ?auto_89876 ) ( not ( = ?auto_89873 ?auto_89874 ) ) ( not ( = ?auto_89873 ?auto_89875 ) ) ( not ( = ?auto_89873 ?auto_89876 ) ) ( not ( = ?auto_89873 ?auto_89877 ) ) ( not ( = ?auto_89873 ?auto_89878 ) ) ( not ( = ?auto_89873 ?auto_89879 ) ) ( not ( = ?auto_89873 ?auto_89880 ) ) ( not ( = ?auto_89873 ?auto_89881 ) ) ( not ( = ?auto_89873 ?auto_89882 ) ) ( not ( = ?auto_89873 ?auto_89883 ) ) ( not ( = ?auto_89874 ?auto_89875 ) ) ( not ( = ?auto_89874 ?auto_89876 ) ) ( not ( = ?auto_89874 ?auto_89877 ) ) ( not ( = ?auto_89874 ?auto_89878 ) ) ( not ( = ?auto_89874 ?auto_89879 ) ) ( not ( = ?auto_89874 ?auto_89880 ) ) ( not ( = ?auto_89874 ?auto_89881 ) ) ( not ( = ?auto_89874 ?auto_89882 ) ) ( not ( = ?auto_89874 ?auto_89883 ) ) ( not ( = ?auto_89875 ?auto_89876 ) ) ( not ( = ?auto_89875 ?auto_89877 ) ) ( not ( = ?auto_89875 ?auto_89878 ) ) ( not ( = ?auto_89875 ?auto_89879 ) ) ( not ( = ?auto_89875 ?auto_89880 ) ) ( not ( = ?auto_89875 ?auto_89881 ) ) ( not ( = ?auto_89875 ?auto_89882 ) ) ( not ( = ?auto_89875 ?auto_89883 ) ) ( not ( = ?auto_89876 ?auto_89877 ) ) ( not ( = ?auto_89876 ?auto_89878 ) ) ( not ( = ?auto_89876 ?auto_89879 ) ) ( not ( = ?auto_89876 ?auto_89880 ) ) ( not ( = ?auto_89876 ?auto_89881 ) ) ( not ( = ?auto_89876 ?auto_89882 ) ) ( not ( = ?auto_89876 ?auto_89883 ) ) ( not ( = ?auto_89877 ?auto_89878 ) ) ( not ( = ?auto_89877 ?auto_89879 ) ) ( not ( = ?auto_89877 ?auto_89880 ) ) ( not ( = ?auto_89877 ?auto_89881 ) ) ( not ( = ?auto_89877 ?auto_89882 ) ) ( not ( = ?auto_89877 ?auto_89883 ) ) ( not ( = ?auto_89878 ?auto_89879 ) ) ( not ( = ?auto_89878 ?auto_89880 ) ) ( not ( = ?auto_89878 ?auto_89881 ) ) ( not ( = ?auto_89878 ?auto_89882 ) ) ( not ( = ?auto_89878 ?auto_89883 ) ) ( not ( = ?auto_89879 ?auto_89880 ) ) ( not ( = ?auto_89879 ?auto_89881 ) ) ( not ( = ?auto_89879 ?auto_89882 ) ) ( not ( = ?auto_89879 ?auto_89883 ) ) ( not ( = ?auto_89880 ?auto_89881 ) ) ( not ( = ?auto_89880 ?auto_89882 ) ) ( not ( = ?auto_89880 ?auto_89883 ) ) ( not ( = ?auto_89881 ?auto_89882 ) ) ( not ( = ?auto_89881 ?auto_89883 ) ) ( not ( = ?auto_89882 ?auto_89883 ) ) ( ON ?auto_89881 ?auto_89882 ) ( ON ?auto_89880 ?auto_89881 ) ( ON ?auto_89879 ?auto_89880 ) ( CLEAR ?auto_89877 ) ( ON ?auto_89878 ?auto_89879 ) ( CLEAR ?auto_89878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_89873 ?auto_89874 ?auto_89875 ?auto_89876 ?auto_89877 ?auto_89878 )
      ( MAKE-10PILE ?auto_89873 ?auto_89874 ?auto_89875 ?auto_89876 ?auto_89877 ?auto_89878 ?auto_89879 ?auto_89880 ?auto_89881 ?auto_89882 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_89894 - BLOCK
      ?auto_89895 - BLOCK
      ?auto_89896 - BLOCK
      ?auto_89897 - BLOCK
      ?auto_89898 - BLOCK
      ?auto_89899 - BLOCK
      ?auto_89900 - BLOCK
      ?auto_89901 - BLOCK
      ?auto_89902 - BLOCK
      ?auto_89903 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89903 ) ( ON-TABLE ?auto_89894 ) ( ON ?auto_89895 ?auto_89894 ) ( ON ?auto_89896 ?auto_89895 ) ( ON ?auto_89897 ?auto_89896 ) ( ON ?auto_89898 ?auto_89897 ) ( not ( = ?auto_89894 ?auto_89895 ) ) ( not ( = ?auto_89894 ?auto_89896 ) ) ( not ( = ?auto_89894 ?auto_89897 ) ) ( not ( = ?auto_89894 ?auto_89898 ) ) ( not ( = ?auto_89894 ?auto_89899 ) ) ( not ( = ?auto_89894 ?auto_89900 ) ) ( not ( = ?auto_89894 ?auto_89901 ) ) ( not ( = ?auto_89894 ?auto_89902 ) ) ( not ( = ?auto_89894 ?auto_89903 ) ) ( not ( = ?auto_89895 ?auto_89896 ) ) ( not ( = ?auto_89895 ?auto_89897 ) ) ( not ( = ?auto_89895 ?auto_89898 ) ) ( not ( = ?auto_89895 ?auto_89899 ) ) ( not ( = ?auto_89895 ?auto_89900 ) ) ( not ( = ?auto_89895 ?auto_89901 ) ) ( not ( = ?auto_89895 ?auto_89902 ) ) ( not ( = ?auto_89895 ?auto_89903 ) ) ( not ( = ?auto_89896 ?auto_89897 ) ) ( not ( = ?auto_89896 ?auto_89898 ) ) ( not ( = ?auto_89896 ?auto_89899 ) ) ( not ( = ?auto_89896 ?auto_89900 ) ) ( not ( = ?auto_89896 ?auto_89901 ) ) ( not ( = ?auto_89896 ?auto_89902 ) ) ( not ( = ?auto_89896 ?auto_89903 ) ) ( not ( = ?auto_89897 ?auto_89898 ) ) ( not ( = ?auto_89897 ?auto_89899 ) ) ( not ( = ?auto_89897 ?auto_89900 ) ) ( not ( = ?auto_89897 ?auto_89901 ) ) ( not ( = ?auto_89897 ?auto_89902 ) ) ( not ( = ?auto_89897 ?auto_89903 ) ) ( not ( = ?auto_89898 ?auto_89899 ) ) ( not ( = ?auto_89898 ?auto_89900 ) ) ( not ( = ?auto_89898 ?auto_89901 ) ) ( not ( = ?auto_89898 ?auto_89902 ) ) ( not ( = ?auto_89898 ?auto_89903 ) ) ( not ( = ?auto_89899 ?auto_89900 ) ) ( not ( = ?auto_89899 ?auto_89901 ) ) ( not ( = ?auto_89899 ?auto_89902 ) ) ( not ( = ?auto_89899 ?auto_89903 ) ) ( not ( = ?auto_89900 ?auto_89901 ) ) ( not ( = ?auto_89900 ?auto_89902 ) ) ( not ( = ?auto_89900 ?auto_89903 ) ) ( not ( = ?auto_89901 ?auto_89902 ) ) ( not ( = ?auto_89901 ?auto_89903 ) ) ( not ( = ?auto_89902 ?auto_89903 ) ) ( ON ?auto_89902 ?auto_89903 ) ( ON ?auto_89901 ?auto_89902 ) ( ON ?auto_89900 ?auto_89901 ) ( CLEAR ?auto_89898 ) ( ON ?auto_89899 ?auto_89900 ) ( CLEAR ?auto_89899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_89894 ?auto_89895 ?auto_89896 ?auto_89897 ?auto_89898 ?auto_89899 )
      ( MAKE-10PILE ?auto_89894 ?auto_89895 ?auto_89896 ?auto_89897 ?auto_89898 ?auto_89899 ?auto_89900 ?auto_89901 ?auto_89902 ?auto_89903 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_89914 - BLOCK
      ?auto_89915 - BLOCK
      ?auto_89916 - BLOCK
      ?auto_89917 - BLOCK
      ?auto_89918 - BLOCK
      ?auto_89919 - BLOCK
      ?auto_89920 - BLOCK
      ?auto_89921 - BLOCK
      ?auto_89922 - BLOCK
      ?auto_89923 - BLOCK
    )
    :vars
    (
      ?auto_89924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89923 ?auto_89924 ) ( ON-TABLE ?auto_89914 ) ( ON ?auto_89915 ?auto_89914 ) ( ON ?auto_89916 ?auto_89915 ) ( ON ?auto_89917 ?auto_89916 ) ( not ( = ?auto_89914 ?auto_89915 ) ) ( not ( = ?auto_89914 ?auto_89916 ) ) ( not ( = ?auto_89914 ?auto_89917 ) ) ( not ( = ?auto_89914 ?auto_89918 ) ) ( not ( = ?auto_89914 ?auto_89919 ) ) ( not ( = ?auto_89914 ?auto_89920 ) ) ( not ( = ?auto_89914 ?auto_89921 ) ) ( not ( = ?auto_89914 ?auto_89922 ) ) ( not ( = ?auto_89914 ?auto_89923 ) ) ( not ( = ?auto_89914 ?auto_89924 ) ) ( not ( = ?auto_89915 ?auto_89916 ) ) ( not ( = ?auto_89915 ?auto_89917 ) ) ( not ( = ?auto_89915 ?auto_89918 ) ) ( not ( = ?auto_89915 ?auto_89919 ) ) ( not ( = ?auto_89915 ?auto_89920 ) ) ( not ( = ?auto_89915 ?auto_89921 ) ) ( not ( = ?auto_89915 ?auto_89922 ) ) ( not ( = ?auto_89915 ?auto_89923 ) ) ( not ( = ?auto_89915 ?auto_89924 ) ) ( not ( = ?auto_89916 ?auto_89917 ) ) ( not ( = ?auto_89916 ?auto_89918 ) ) ( not ( = ?auto_89916 ?auto_89919 ) ) ( not ( = ?auto_89916 ?auto_89920 ) ) ( not ( = ?auto_89916 ?auto_89921 ) ) ( not ( = ?auto_89916 ?auto_89922 ) ) ( not ( = ?auto_89916 ?auto_89923 ) ) ( not ( = ?auto_89916 ?auto_89924 ) ) ( not ( = ?auto_89917 ?auto_89918 ) ) ( not ( = ?auto_89917 ?auto_89919 ) ) ( not ( = ?auto_89917 ?auto_89920 ) ) ( not ( = ?auto_89917 ?auto_89921 ) ) ( not ( = ?auto_89917 ?auto_89922 ) ) ( not ( = ?auto_89917 ?auto_89923 ) ) ( not ( = ?auto_89917 ?auto_89924 ) ) ( not ( = ?auto_89918 ?auto_89919 ) ) ( not ( = ?auto_89918 ?auto_89920 ) ) ( not ( = ?auto_89918 ?auto_89921 ) ) ( not ( = ?auto_89918 ?auto_89922 ) ) ( not ( = ?auto_89918 ?auto_89923 ) ) ( not ( = ?auto_89918 ?auto_89924 ) ) ( not ( = ?auto_89919 ?auto_89920 ) ) ( not ( = ?auto_89919 ?auto_89921 ) ) ( not ( = ?auto_89919 ?auto_89922 ) ) ( not ( = ?auto_89919 ?auto_89923 ) ) ( not ( = ?auto_89919 ?auto_89924 ) ) ( not ( = ?auto_89920 ?auto_89921 ) ) ( not ( = ?auto_89920 ?auto_89922 ) ) ( not ( = ?auto_89920 ?auto_89923 ) ) ( not ( = ?auto_89920 ?auto_89924 ) ) ( not ( = ?auto_89921 ?auto_89922 ) ) ( not ( = ?auto_89921 ?auto_89923 ) ) ( not ( = ?auto_89921 ?auto_89924 ) ) ( not ( = ?auto_89922 ?auto_89923 ) ) ( not ( = ?auto_89922 ?auto_89924 ) ) ( not ( = ?auto_89923 ?auto_89924 ) ) ( ON ?auto_89922 ?auto_89923 ) ( ON ?auto_89921 ?auto_89922 ) ( ON ?auto_89920 ?auto_89921 ) ( ON ?auto_89919 ?auto_89920 ) ( CLEAR ?auto_89917 ) ( ON ?auto_89918 ?auto_89919 ) ( CLEAR ?auto_89918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_89914 ?auto_89915 ?auto_89916 ?auto_89917 ?auto_89918 )
      ( MAKE-10PILE ?auto_89914 ?auto_89915 ?auto_89916 ?auto_89917 ?auto_89918 ?auto_89919 ?auto_89920 ?auto_89921 ?auto_89922 ?auto_89923 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_89935 - BLOCK
      ?auto_89936 - BLOCK
      ?auto_89937 - BLOCK
      ?auto_89938 - BLOCK
      ?auto_89939 - BLOCK
      ?auto_89940 - BLOCK
      ?auto_89941 - BLOCK
      ?auto_89942 - BLOCK
      ?auto_89943 - BLOCK
      ?auto_89944 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89944 ) ( ON-TABLE ?auto_89935 ) ( ON ?auto_89936 ?auto_89935 ) ( ON ?auto_89937 ?auto_89936 ) ( ON ?auto_89938 ?auto_89937 ) ( not ( = ?auto_89935 ?auto_89936 ) ) ( not ( = ?auto_89935 ?auto_89937 ) ) ( not ( = ?auto_89935 ?auto_89938 ) ) ( not ( = ?auto_89935 ?auto_89939 ) ) ( not ( = ?auto_89935 ?auto_89940 ) ) ( not ( = ?auto_89935 ?auto_89941 ) ) ( not ( = ?auto_89935 ?auto_89942 ) ) ( not ( = ?auto_89935 ?auto_89943 ) ) ( not ( = ?auto_89935 ?auto_89944 ) ) ( not ( = ?auto_89936 ?auto_89937 ) ) ( not ( = ?auto_89936 ?auto_89938 ) ) ( not ( = ?auto_89936 ?auto_89939 ) ) ( not ( = ?auto_89936 ?auto_89940 ) ) ( not ( = ?auto_89936 ?auto_89941 ) ) ( not ( = ?auto_89936 ?auto_89942 ) ) ( not ( = ?auto_89936 ?auto_89943 ) ) ( not ( = ?auto_89936 ?auto_89944 ) ) ( not ( = ?auto_89937 ?auto_89938 ) ) ( not ( = ?auto_89937 ?auto_89939 ) ) ( not ( = ?auto_89937 ?auto_89940 ) ) ( not ( = ?auto_89937 ?auto_89941 ) ) ( not ( = ?auto_89937 ?auto_89942 ) ) ( not ( = ?auto_89937 ?auto_89943 ) ) ( not ( = ?auto_89937 ?auto_89944 ) ) ( not ( = ?auto_89938 ?auto_89939 ) ) ( not ( = ?auto_89938 ?auto_89940 ) ) ( not ( = ?auto_89938 ?auto_89941 ) ) ( not ( = ?auto_89938 ?auto_89942 ) ) ( not ( = ?auto_89938 ?auto_89943 ) ) ( not ( = ?auto_89938 ?auto_89944 ) ) ( not ( = ?auto_89939 ?auto_89940 ) ) ( not ( = ?auto_89939 ?auto_89941 ) ) ( not ( = ?auto_89939 ?auto_89942 ) ) ( not ( = ?auto_89939 ?auto_89943 ) ) ( not ( = ?auto_89939 ?auto_89944 ) ) ( not ( = ?auto_89940 ?auto_89941 ) ) ( not ( = ?auto_89940 ?auto_89942 ) ) ( not ( = ?auto_89940 ?auto_89943 ) ) ( not ( = ?auto_89940 ?auto_89944 ) ) ( not ( = ?auto_89941 ?auto_89942 ) ) ( not ( = ?auto_89941 ?auto_89943 ) ) ( not ( = ?auto_89941 ?auto_89944 ) ) ( not ( = ?auto_89942 ?auto_89943 ) ) ( not ( = ?auto_89942 ?auto_89944 ) ) ( not ( = ?auto_89943 ?auto_89944 ) ) ( ON ?auto_89943 ?auto_89944 ) ( ON ?auto_89942 ?auto_89943 ) ( ON ?auto_89941 ?auto_89942 ) ( ON ?auto_89940 ?auto_89941 ) ( CLEAR ?auto_89938 ) ( ON ?auto_89939 ?auto_89940 ) ( CLEAR ?auto_89939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_89935 ?auto_89936 ?auto_89937 ?auto_89938 ?auto_89939 )
      ( MAKE-10PILE ?auto_89935 ?auto_89936 ?auto_89937 ?auto_89938 ?auto_89939 ?auto_89940 ?auto_89941 ?auto_89942 ?auto_89943 ?auto_89944 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_89955 - BLOCK
      ?auto_89956 - BLOCK
      ?auto_89957 - BLOCK
      ?auto_89958 - BLOCK
      ?auto_89959 - BLOCK
      ?auto_89960 - BLOCK
      ?auto_89961 - BLOCK
      ?auto_89962 - BLOCK
      ?auto_89963 - BLOCK
      ?auto_89964 - BLOCK
    )
    :vars
    (
      ?auto_89965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89964 ?auto_89965 ) ( ON-TABLE ?auto_89955 ) ( ON ?auto_89956 ?auto_89955 ) ( ON ?auto_89957 ?auto_89956 ) ( not ( = ?auto_89955 ?auto_89956 ) ) ( not ( = ?auto_89955 ?auto_89957 ) ) ( not ( = ?auto_89955 ?auto_89958 ) ) ( not ( = ?auto_89955 ?auto_89959 ) ) ( not ( = ?auto_89955 ?auto_89960 ) ) ( not ( = ?auto_89955 ?auto_89961 ) ) ( not ( = ?auto_89955 ?auto_89962 ) ) ( not ( = ?auto_89955 ?auto_89963 ) ) ( not ( = ?auto_89955 ?auto_89964 ) ) ( not ( = ?auto_89955 ?auto_89965 ) ) ( not ( = ?auto_89956 ?auto_89957 ) ) ( not ( = ?auto_89956 ?auto_89958 ) ) ( not ( = ?auto_89956 ?auto_89959 ) ) ( not ( = ?auto_89956 ?auto_89960 ) ) ( not ( = ?auto_89956 ?auto_89961 ) ) ( not ( = ?auto_89956 ?auto_89962 ) ) ( not ( = ?auto_89956 ?auto_89963 ) ) ( not ( = ?auto_89956 ?auto_89964 ) ) ( not ( = ?auto_89956 ?auto_89965 ) ) ( not ( = ?auto_89957 ?auto_89958 ) ) ( not ( = ?auto_89957 ?auto_89959 ) ) ( not ( = ?auto_89957 ?auto_89960 ) ) ( not ( = ?auto_89957 ?auto_89961 ) ) ( not ( = ?auto_89957 ?auto_89962 ) ) ( not ( = ?auto_89957 ?auto_89963 ) ) ( not ( = ?auto_89957 ?auto_89964 ) ) ( not ( = ?auto_89957 ?auto_89965 ) ) ( not ( = ?auto_89958 ?auto_89959 ) ) ( not ( = ?auto_89958 ?auto_89960 ) ) ( not ( = ?auto_89958 ?auto_89961 ) ) ( not ( = ?auto_89958 ?auto_89962 ) ) ( not ( = ?auto_89958 ?auto_89963 ) ) ( not ( = ?auto_89958 ?auto_89964 ) ) ( not ( = ?auto_89958 ?auto_89965 ) ) ( not ( = ?auto_89959 ?auto_89960 ) ) ( not ( = ?auto_89959 ?auto_89961 ) ) ( not ( = ?auto_89959 ?auto_89962 ) ) ( not ( = ?auto_89959 ?auto_89963 ) ) ( not ( = ?auto_89959 ?auto_89964 ) ) ( not ( = ?auto_89959 ?auto_89965 ) ) ( not ( = ?auto_89960 ?auto_89961 ) ) ( not ( = ?auto_89960 ?auto_89962 ) ) ( not ( = ?auto_89960 ?auto_89963 ) ) ( not ( = ?auto_89960 ?auto_89964 ) ) ( not ( = ?auto_89960 ?auto_89965 ) ) ( not ( = ?auto_89961 ?auto_89962 ) ) ( not ( = ?auto_89961 ?auto_89963 ) ) ( not ( = ?auto_89961 ?auto_89964 ) ) ( not ( = ?auto_89961 ?auto_89965 ) ) ( not ( = ?auto_89962 ?auto_89963 ) ) ( not ( = ?auto_89962 ?auto_89964 ) ) ( not ( = ?auto_89962 ?auto_89965 ) ) ( not ( = ?auto_89963 ?auto_89964 ) ) ( not ( = ?auto_89963 ?auto_89965 ) ) ( not ( = ?auto_89964 ?auto_89965 ) ) ( ON ?auto_89963 ?auto_89964 ) ( ON ?auto_89962 ?auto_89963 ) ( ON ?auto_89961 ?auto_89962 ) ( ON ?auto_89960 ?auto_89961 ) ( ON ?auto_89959 ?auto_89960 ) ( CLEAR ?auto_89957 ) ( ON ?auto_89958 ?auto_89959 ) ( CLEAR ?auto_89958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89955 ?auto_89956 ?auto_89957 ?auto_89958 )
      ( MAKE-10PILE ?auto_89955 ?auto_89956 ?auto_89957 ?auto_89958 ?auto_89959 ?auto_89960 ?auto_89961 ?auto_89962 ?auto_89963 ?auto_89964 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_89976 - BLOCK
      ?auto_89977 - BLOCK
      ?auto_89978 - BLOCK
      ?auto_89979 - BLOCK
      ?auto_89980 - BLOCK
      ?auto_89981 - BLOCK
      ?auto_89982 - BLOCK
      ?auto_89983 - BLOCK
      ?auto_89984 - BLOCK
      ?auto_89985 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89985 ) ( ON-TABLE ?auto_89976 ) ( ON ?auto_89977 ?auto_89976 ) ( ON ?auto_89978 ?auto_89977 ) ( not ( = ?auto_89976 ?auto_89977 ) ) ( not ( = ?auto_89976 ?auto_89978 ) ) ( not ( = ?auto_89976 ?auto_89979 ) ) ( not ( = ?auto_89976 ?auto_89980 ) ) ( not ( = ?auto_89976 ?auto_89981 ) ) ( not ( = ?auto_89976 ?auto_89982 ) ) ( not ( = ?auto_89976 ?auto_89983 ) ) ( not ( = ?auto_89976 ?auto_89984 ) ) ( not ( = ?auto_89976 ?auto_89985 ) ) ( not ( = ?auto_89977 ?auto_89978 ) ) ( not ( = ?auto_89977 ?auto_89979 ) ) ( not ( = ?auto_89977 ?auto_89980 ) ) ( not ( = ?auto_89977 ?auto_89981 ) ) ( not ( = ?auto_89977 ?auto_89982 ) ) ( not ( = ?auto_89977 ?auto_89983 ) ) ( not ( = ?auto_89977 ?auto_89984 ) ) ( not ( = ?auto_89977 ?auto_89985 ) ) ( not ( = ?auto_89978 ?auto_89979 ) ) ( not ( = ?auto_89978 ?auto_89980 ) ) ( not ( = ?auto_89978 ?auto_89981 ) ) ( not ( = ?auto_89978 ?auto_89982 ) ) ( not ( = ?auto_89978 ?auto_89983 ) ) ( not ( = ?auto_89978 ?auto_89984 ) ) ( not ( = ?auto_89978 ?auto_89985 ) ) ( not ( = ?auto_89979 ?auto_89980 ) ) ( not ( = ?auto_89979 ?auto_89981 ) ) ( not ( = ?auto_89979 ?auto_89982 ) ) ( not ( = ?auto_89979 ?auto_89983 ) ) ( not ( = ?auto_89979 ?auto_89984 ) ) ( not ( = ?auto_89979 ?auto_89985 ) ) ( not ( = ?auto_89980 ?auto_89981 ) ) ( not ( = ?auto_89980 ?auto_89982 ) ) ( not ( = ?auto_89980 ?auto_89983 ) ) ( not ( = ?auto_89980 ?auto_89984 ) ) ( not ( = ?auto_89980 ?auto_89985 ) ) ( not ( = ?auto_89981 ?auto_89982 ) ) ( not ( = ?auto_89981 ?auto_89983 ) ) ( not ( = ?auto_89981 ?auto_89984 ) ) ( not ( = ?auto_89981 ?auto_89985 ) ) ( not ( = ?auto_89982 ?auto_89983 ) ) ( not ( = ?auto_89982 ?auto_89984 ) ) ( not ( = ?auto_89982 ?auto_89985 ) ) ( not ( = ?auto_89983 ?auto_89984 ) ) ( not ( = ?auto_89983 ?auto_89985 ) ) ( not ( = ?auto_89984 ?auto_89985 ) ) ( ON ?auto_89984 ?auto_89985 ) ( ON ?auto_89983 ?auto_89984 ) ( ON ?auto_89982 ?auto_89983 ) ( ON ?auto_89981 ?auto_89982 ) ( ON ?auto_89980 ?auto_89981 ) ( CLEAR ?auto_89978 ) ( ON ?auto_89979 ?auto_89980 ) ( CLEAR ?auto_89979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89976 ?auto_89977 ?auto_89978 ?auto_89979 )
      ( MAKE-10PILE ?auto_89976 ?auto_89977 ?auto_89978 ?auto_89979 ?auto_89980 ?auto_89981 ?auto_89982 ?auto_89983 ?auto_89984 ?auto_89985 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_89996 - BLOCK
      ?auto_89997 - BLOCK
      ?auto_89998 - BLOCK
      ?auto_89999 - BLOCK
      ?auto_90000 - BLOCK
      ?auto_90001 - BLOCK
      ?auto_90002 - BLOCK
      ?auto_90003 - BLOCK
      ?auto_90004 - BLOCK
      ?auto_90005 - BLOCK
    )
    :vars
    (
      ?auto_90006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90005 ?auto_90006 ) ( ON-TABLE ?auto_89996 ) ( ON ?auto_89997 ?auto_89996 ) ( not ( = ?auto_89996 ?auto_89997 ) ) ( not ( = ?auto_89996 ?auto_89998 ) ) ( not ( = ?auto_89996 ?auto_89999 ) ) ( not ( = ?auto_89996 ?auto_90000 ) ) ( not ( = ?auto_89996 ?auto_90001 ) ) ( not ( = ?auto_89996 ?auto_90002 ) ) ( not ( = ?auto_89996 ?auto_90003 ) ) ( not ( = ?auto_89996 ?auto_90004 ) ) ( not ( = ?auto_89996 ?auto_90005 ) ) ( not ( = ?auto_89996 ?auto_90006 ) ) ( not ( = ?auto_89997 ?auto_89998 ) ) ( not ( = ?auto_89997 ?auto_89999 ) ) ( not ( = ?auto_89997 ?auto_90000 ) ) ( not ( = ?auto_89997 ?auto_90001 ) ) ( not ( = ?auto_89997 ?auto_90002 ) ) ( not ( = ?auto_89997 ?auto_90003 ) ) ( not ( = ?auto_89997 ?auto_90004 ) ) ( not ( = ?auto_89997 ?auto_90005 ) ) ( not ( = ?auto_89997 ?auto_90006 ) ) ( not ( = ?auto_89998 ?auto_89999 ) ) ( not ( = ?auto_89998 ?auto_90000 ) ) ( not ( = ?auto_89998 ?auto_90001 ) ) ( not ( = ?auto_89998 ?auto_90002 ) ) ( not ( = ?auto_89998 ?auto_90003 ) ) ( not ( = ?auto_89998 ?auto_90004 ) ) ( not ( = ?auto_89998 ?auto_90005 ) ) ( not ( = ?auto_89998 ?auto_90006 ) ) ( not ( = ?auto_89999 ?auto_90000 ) ) ( not ( = ?auto_89999 ?auto_90001 ) ) ( not ( = ?auto_89999 ?auto_90002 ) ) ( not ( = ?auto_89999 ?auto_90003 ) ) ( not ( = ?auto_89999 ?auto_90004 ) ) ( not ( = ?auto_89999 ?auto_90005 ) ) ( not ( = ?auto_89999 ?auto_90006 ) ) ( not ( = ?auto_90000 ?auto_90001 ) ) ( not ( = ?auto_90000 ?auto_90002 ) ) ( not ( = ?auto_90000 ?auto_90003 ) ) ( not ( = ?auto_90000 ?auto_90004 ) ) ( not ( = ?auto_90000 ?auto_90005 ) ) ( not ( = ?auto_90000 ?auto_90006 ) ) ( not ( = ?auto_90001 ?auto_90002 ) ) ( not ( = ?auto_90001 ?auto_90003 ) ) ( not ( = ?auto_90001 ?auto_90004 ) ) ( not ( = ?auto_90001 ?auto_90005 ) ) ( not ( = ?auto_90001 ?auto_90006 ) ) ( not ( = ?auto_90002 ?auto_90003 ) ) ( not ( = ?auto_90002 ?auto_90004 ) ) ( not ( = ?auto_90002 ?auto_90005 ) ) ( not ( = ?auto_90002 ?auto_90006 ) ) ( not ( = ?auto_90003 ?auto_90004 ) ) ( not ( = ?auto_90003 ?auto_90005 ) ) ( not ( = ?auto_90003 ?auto_90006 ) ) ( not ( = ?auto_90004 ?auto_90005 ) ) ( not ( = ?auto_90004 ?auto_90006 ) ) ( not ( = ?auto_90005 ?auto_90006 ) ) ( ON ?auto_90004 ?auto_90005 ) ( ON ?auto_90003 ?auto_90004 ) ( ON ?auto_90002 ?auto_90003 ) ( ON ?auto_90001 ?auto_90002 ) ( ON ?auto_90000 ?auto_90001 ) ( ON ?auto_89999 ?auto_90000 ) ( CLEAR ?auto_89997 ) ( ON ?auto_89998 ?auto_89999 ) ( CLEAR ?auto_89998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89996 ?auto_89997 ?auto_89998 )
      ( MAKE-10PILE ?auto_89996 ?auto_89997 ?auto_89998 ?auto_89999 ?auto_90000 ?auto_90001 ?auto_90002 ?auto_90003 ?auto_90004 ?auto_90005 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_90017 - BLOCK
      ?auto_90018 - BLOCK
      ?auto_90019 - BLOCK
      ?auto_90020 - BLOCK
      ?auto_90021 - BLOCK
      ?auto_90022 - BLOCK
      ?auto_90023 - BLOCK
      ?auto_90024 - BLOCK
      ?auto_90025 - BLOCK
      ?auto_90026 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90026 ) ( ON-TABLE ?auto_90017 ) ( ON ?auto_90018 ?auto_90017 ) ( not ( = ?auto_90017 ?auto_90018 ) ) ( not ( = ?auto_90017 ?auto_90019 ) ) ( not ( = ?auto_90017 ?auto_90020 ) ) ( not ( = ?auto_90017 ?auto_90021 ) ) ( not ( = ?auto_90017 ?auto_90022 ) ) ( not ( = ?auto_90017 ?auto_90023 ) ) ( not ( = ?auto_90017 ?auto_90024 ) ) ( not ( = ?auto_90017 ?auto_90025 ) ) ( not ( = ?auto_90017 ?auto_90026 ) ) ( not ( = ?auto_90018 ?auto_90019 ) ) ( not ( = ?auto_90018 ?auto_90020 ) ) ( not ( = ?auto_90018 ?auto_90021 ) ) ( not ( = ?auto_90018 ?auto_90022 ) ) ( not ( = ?auto_90018 ?auto_90023 ) ) ( not ( = ?auto_90018 ?auto_90024 ) ) ( not ( = ?auto_90018 ?auto_90025 ) ) ( not ( = ?auto_90018 ?auto_90026 ) ) ( not ( = ?auto_90019 ?auto_90020 ) ) ( not ( = ?auto_90019 ?auto_90021 ) ) ( not ( = ?auto_90019 ?auto_90022 ) ) ( not ( = ?auto_90019 ?auto_90023 ) ) ( not ( = ?auto_90019 ?auto_90024 ) ) ( not ( = ?auto_90019 ?auto_90025 ) ) ( not ( = ?auto_90019 ?auto_90026 ) ) ( not ( = ?auto_90020 ?auto_90021 ) ) ( not ( = ?auto_90020 ?auto_90022 ) ) ( not ( = ?auto_90020 ?auto_90023 ) ) ( not ( = ?auto_90020 ?auto_90024 ) ) ( not ( = ?auto_90020 ?auto_90025 ) ) ( not ( = ?auto_90020 ?auto_90026 ) ) ( not ( = ?auto_90021 ?auto_90022 ) ) ( not ( = ?auto_90021 ?auto_90023 ) ) ( not ( = ?auto_90021 ?auto_90024 ) ) ( not ( = ?auto_90021 ?auto_90025 ) ) ( not ( = ?auto_90021 ?auto_90026 ) ) ( not ( = ?auto_90022 ?auto_90023 ) ) ( not ( = ?auto_90022 ?auto_90024 ) ) ( not ( = ?auto_90022 ?auto_90025 ) ) ( not ( = ?auto_90022 ?auto_90026 ) ) ( not ( = ?auto_90023 ?auto_90024 ) ) ( not ( = ?auto_90023 ?auto_90025 ) ) ( not ( = ?auto_90023 ?auto_90026 ) ) ( not ( = ?auto_90024 ?auto_90025 ) ) ( not ( = ?auto_90024 ?auto_90026 ) ) ( not ( = ?auto_90025 ?auto_90026 ) ) ( ON ?auto_90025 ?auto_90026 ) ( ON ?auto_90024 ?auto_90025 ) ( ON ?auto_90023 ?auto_90024 ) ( ON ?auto_90022 ?auto_90023 ) ( ON ?auto_90021 ?auto_90022 ) ( ON ?auto_90020 ?auto_90021 ) ( CLEAR ?auto_90018 ) ( ON ?auto_90019 ?auto_90020 ) ( CLEAR ?auto_90019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_90017 ?auto_90018 ?auto_90019 )
      ( MAKE-10PILE ?auto_90017 ?auto_90018 ?auto_90019 ?auto_90020 ?auto_90021 ?auto_90022 ?auto_90023 ?auto_90024 ?auto_90025 ?auto_90026 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_90037 - BLOCK
      ?auto_90038 - BLOCK
      ?auto_90039 - BLOCK
      ?auto_90040 - BLOCK
      ?auto_90041 - BLOCK
      ?auto_90042 - BLOCK
      ?auto_90043 - BLOCK
      ?auto_90044 - BLOCK
      ?auto_90045 - BLOCK
      ?auto_90046 - BLOCK
    )
    :vars
    (
      ?auto_90047 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90046 ?auto_90047 ) ( ON-TABLE ?auto_90037 ) ( not ( = ?auto_90037 ?auto_90038 ) ) ( not ( = ?auto_90037 ?auto_90039 ) ) ( not ( = ?auto_90037 ?auto_90040 ) ) ( not ( = ?auto_90037 ?auto_90041 ) ) ( not ( = ?auto_90037 ?auto_90042 ) ) ( not ( = ?auto_90037 ?auto_90043 ) ) ( not ( = ?auto_90037 ?auto_90044 ) ) ( not ( = ?auto_90037 ?auto_90045 ) ) ( not ( = ?auto_90037 ?auto_90046 ) ) ( not ( = ?auto_90037 ?auto_90047 ) ) ( not ( = ?auto_90038 ?auto_90039 ) ) ( not ( = ?auto_90038 ?auto_90040 ) ) ( not ( = ?auto_90038 ?auto_90041 ) ) ( not ( = ?auto_90038 ?auto_90042 ) ) ( not ( = ?auto_90038 ?auto_90043 ) ) ( not ( = ?auto_90038 ?auto_90044 ) ) ( not ( = ?auto_90038 ?auto_90045 ) ) ( not ( = ?auto_90038 ?auto_90046 ) ) ( not ( = ?auto_90038 ?auto_90047 ) ) ( not ( = ?auto_90039 ?auto_90040 ) ) ( not ( = ?auto_90039 ?auto_90041 ) ) ( not ( = ?auto_90039 ?auto_90042 ) ) ( not ( = ?auto_90039 ?auto_90043 ) ) ( not ( = ?auto_90039 ?auto_90044 ) ) ( not ( = ?auto_90039 ?auto_90045 ) ) ( not ( = ?auto_90039 ?auto_90046 ) ) ( not ( = ?auto_90039 ?auto_90047 ) ) ( not ( = ?auto_90040 ?auto_90041 ) ) ( not ( = ?auto_90040 ?auto_90042 ) ) ( not ( = ?auto_90040 ?auto_90043 ) ) ( not ( = ?auto_90040 ?auto_90044 ) ) ( not ( = ?auto_90040 ?auto_90045 ) ) ( not ( = ?auto_90040 ?auto_90046 ) ) ( not ( = ?auto_90040 ?auto_90047 ) ) ( not ( = ?auto_90041 ?auto_90042 ) ) ( not ( = ?auto_90041 ?auto_90043 ) ) ( not ( = ?auto_90041 ?auto_90044 ) ) ( not ( = ?auto_90041 ?auto_90045 ) ) ( not ( = ?auto_90041 ?auto_90046 ) ) ( not ( = ?auto_90041 ?auto_90047 ) ) ( not ( = ?auto_90042 ?auto_90043 ) ) ( not ( = ?auto_90042 ?auto_90044 ) ) ( not ( = ?auto_90042 ?auto_90045 ) ) ( not ( = ?auto_90042 ?auto_90046 ) ) ( not ( = ?auto_90042 ?auto_90047 ) ) ( not ( = ?auto_90043 ?auto_90044 ) ) ( not ( = ?auto_90043 ?auto_90045 ) ) ( not ( = ?auto_90043 ?auto_90046 ) ) ( not ( = ?auto_90043 ?auto_90047 ) ) ( not ( = ?auto_90044 ?auto_90045 ) ) ( not ( = ?auto_90044 ?auto_90046 ) ) ( not ( = ?auto_90044 ?auto_90047 ) ) ( not ( = ?auto_90045 ?auto_90046 ) ) ( not ( = ?auto_90045 ?auto_90047 ) ) ( not ( = ?auto_90046 ?auto_90047 ) ) ( ON ?auto_90045 ?auto_90046 ) ( ON ?auto_90044 ?auto_90045 ) ( ON ?auto_90043 ?auto_90044 ) ( ON ?auto_90042 ?auto_90043 ) ( ON ?auto_90041 ?auto_90042 ) ( ON ?auto_90040 ?auto_90041 ) ( ON ?auto_90039 ?auto_90040 ) ( CLEAR ?auto_90037 ) ( ON ?auto_90038 ?auto_90039 ) ( CLEAR ?auto_90038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_90037 ?auto_90038 )
      ( MAKE-10PILE ?auto_90037 ?auto_90038 ?auto_90039 ?auto_90040 ?auto_90041 ?auto_90042 ?auto_90043 ?auto_90044 ?auto_90045 ?auto_90046 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_90058 - BLOCK
      ?auto_90059 - BLOCK
      ?auto_90060 - BLOCK
      ?auto_90061 - BLOCK
      ?auto_90062 - BLOCK
      ?auto_90063 - BLOCK
      ?auto_90064 - BLOCK
      ?auto_90065 - BLOCK
      ?auto_90066 - BLOCK
      ?auto_90067 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90067 ) ( ON-TABLE ?auto_90058 ) ( not ( = ?auto_90058 ?auto_90059 ) ) ( not ( = ?auto_90058 ?auto_90060 ) ) ( not ( = ?auto_90058 ?auto_90061 ) ) ( not ( = ?auto_90058 ?auto_90062 ) ) ( not ( = ?auto_90058 ?auto_90063 ) ) ( not ( = ?auto_90058 ?auto_90064 ) ) ( not ( = ?auto_90058 ?auto_90065 ) ) ( not ( = ?auto_90058 ?auto_90066 ) ) ( not ( = ?auto_90058 ?auto_90067 ) ) ( not ( = ?auto_90059 ?auto_90060 ) ) ( not ( = ?auto_90059 ?auto_90061 ) ) ( not ( = ?auto_90059 ?auto_90062 ) ) ( not ( = ?auto_90059 ?auto_90063 ) ) ( not ( = ?auto_90059 ?auto_90064 ) ) ( not ( = ?auto_90059 ?auto_90065 ) ) ( not ( = ?auto_90059 ?auto_90066 ) ) ( not ( = ?auto_90059 ?auto_90067 ) ) ( not ( = ?auto_90060 ?auto_90061 ) ) ( not ( = ?auto_90060 ?auto_90062 ) ) ( not ( = ?auto_90060 ?auto_90063 ) ) ( not ( = ?auto_90060 ?auto_90064 ) ) ( not ( = ?auto_90060 ?auto_90065 ) ) ( not ( = ?auto_90060 ?auto_90066 ) ) ( not ( = ?auto_90060 ?auto_90067 ) ) ( not ( = ?auto_90061 ?auto_90062 ) ) ( not ( = ?auto_90061 ?auto_90063 ) ) ( not ( = ?auto_90061 ?auto_90064 ) ) ( not ( = ?auto_90061 ?auto_90065 ) ) ( not ( = ?auto_90061 ?auto_90066 ) ) ( not ( = ?auto_90061 ?auto_90067 ) ) ( not ( = ?auto_90062 ?auto_90063 ) ) ( not ( = ?auto_90062 ?auto_90064 ) ) ( not ( = ?auto_90062 ?auto_90065 ) ) ( not ( = ?auto_90062 ?auto_90066 ) ) ( not ( = ?auto_90062 ?auto_90067 ) ) ( not ( = ?auto_90063 ?auto_90064 ) ) ( not ( = ?auto_90063 ?auto_90065 ) ) ( not ( = ?auto_90063 ?auto_90066 ) ) ( not ( = ?auto_90063 ?auto_90067 ) ) ( not ( = ?auto_90064 ?auto_90065 ) ) ( not ( = ?auto_90064 ?auto_90066 ) ) ( not ( = ?auto_90064 ?auto_90067 ) ) ( not ( = ?auto_90065 ?auto_90066 ) ) ( not ( = ?auto_90065 ?auto_90067 ) ) ( not ( = ?auto_90066 ?auto_90067 ) ) ( ON ?auto_90066 ?auto_90067 ) ( ON ?auto_90065 ?auto_90066 ) ( ON ?auto_90064 ?auto_90065 ) ( ON ?auto_90063 ?auto_90064 ) ( ON ?auto_90062 ?auto_90063 ) ( ON ?auto_90061 ?auto_90062 ) ( ON ?auto_90060 ?auto_90061 ) ( CLEAR ?auto_90058 ) ( ON ?auto_90059 ?auto_90060 ) ( CLEAR ?auto_90059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_90058 ?auto_90059 )
      ( MAKE-10PILE ?auto_90058 ?auto_90059 ?auto_90060 ?auto_90061 ?auto_90062 ?auto_90063 ?auto_90064 ?auto_90065 ?auto_90066 ?auto_90067 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_90078 - BLOCK
      ?auto_90079 - BLOCK
      ?auto_90080 - BLOCK
      ?auto_90081 - BLOCK
      ?auto_90082 - BLOCK
      ?auto_90083 - BLOCK
      ?auto_90084 - BLOCK
      ?auto_90085 - BLOCK
      ?auto_90086 - BLOCK
      ?auto_90087 - BLOCK
    )
    :vars
    (
      ?auto_90088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90087 ?auto_90088 ) ( not ( = ?auto_90078 ?auto_90079 ) ) ( not ( = ?auto_90078 ?auto_90080 ) ) ( not ( = ?auto_90078 ?auto_90081 ) ) ( not ( = ?auto_90078 ?auto_90082 ) ) ( not ( = ?auto_90078 ?auto_90083 ) ) ( not ( = ?auto_90078 ?auto_90084 ) ) ( not ( = ?auto_90078 ?auto_90085 ) ) ( not ( = ?auto_90078 ?auto_90086 ) ) ( not ( = ?auto_90078 ?auto_90087 ) ) ( not ( = ?auto_90078 ?auto_90088 ) ) ( not ( = ?auto_90079 ?auto_90080 ) ) ( not ( = ?auto_90079 ?auto_90081 ) ) ( not ( = ?auto_90079 ?auto_90082 ) ) ( not ( = ?auto_90079 ?auto_90083 ) ) ( not ( = ?auto_90079 ?auto_90084 ) ) ( not ( = ?auto_90079 ?auto_90085 ) ) ( not ( = ?auto_90079 ?auto_90086 ) ) ( not ( = ?auto_90079 ?auto_90087 ) ) ( not ( = ?auto_90079 ?auto_90088 ) ) ( not ( = ?auto_90080 ?auto_90081 ) ) ( not ( = ?auto_90080 ?auto_90082 ) ) ( not ( = ?auto_90080 ?auto_90083 ) ) ( not ( = ?auto_90080 ?auto_90084 ) ) ( not ( = ?auto_90080 ?auto_90085 ) ) ( not ( = ?auto_90080 ?auto_90086 ) ) ( not ( = ?auto_90080 ?auto_90087 ) ) ( not ( = ?auto_90080 ?auto_90088 ) ) ( not ( = ?auto_90081 ?auto_90082 ) ) ( not ( = ?auto_90081 ?auto_90083 ) ) ( not ( = ?auto_90081 ?auto_90084 ) ) ( not ( = ?auto_90081 ?auto_90085 ) ) ( not ( = ?auto_90081 ?auto_90086 ) ) ( not ( = ?auto_90081 ?auto_90087 ) ) ( not ( = ?auto_90081 ?auto_90088 ) ) ( not ( = ?auto_90082 ?auto_90083 ) ) ( not ( = ?auto_90082 ?auto_90084 ) ) ( not ( = ?auto_90082 ?auto_90085 ) ) ( not ( = ?auto_90082 ?auto_90086 ) ) ( not ( = ?auto_90082 ?auto_90087 ) ) ( not ( = ?auto_90082 ?auto_90088 ) ) ( not ( = ?auto_90083 ?auto_90084 ) ) ( not ( = ?auto_90083 ?auto_90085 ) ) ( not ( = ?auto_90083 ?auto_90086 ) ) ( not ( = ?auto_90083 ?auto_90087 ) ) ( not ( = ?auto_90083 ?auto_90088 ) ) ( not ( = ?auto_90084 ?auto_90085 ) ) ( not ( = ?auto_90084 ?auto_90086 ) ) ( not ( = ?auto_90084 ?auto_90087 ) ) ( not ( = ?auto_90084 ?auto_90088 ) ) ( not ( = ?auto_90085 ?auto_90086 ) ) ( not ( = ?auto_90085 ?auto_90087 ) ) ( not ( = ?auto_90085 ?auto_90088 ) ) ( not ( = ?auto_90086 ?auto_90087 ) ) ( not ( = ?auto_90086 ?auto_90088 ) ) ( not ( = ?auto_90087 ?auto_90088 ) ) ( ON ?auto_90086 ?auto_90087 ) ( ON ?auto_90085 ?auto_90086 ) ( ON ?auto_90084 ?auto_90085 ) ( ON ?auto_90083 ?auto_90084 ) ( ON ?auto_90082 ?auto_90083 ) ( ON ?auto_90081 ?auto_90082 ) ( ON ?auto_90080 ?auto_90081 ) ( ON ?auto_90079 ?auto_90080 ) ( ON ?auto_90078 ?auto_90079 ) ( CLEAR ?auto_90078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_90078 )
      ( MAKE-10PILE ?auto_90078 ?auto_90079 ?auto_90080 ?auto_90081 ?auto_90082 ?auto_90083 ?auto_90084 ?auto_90085 ?auto_90086 ?auto_90087 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_90099 - BLOCK
      ?auto_90100 - BLOCK
      ?auto_90101 - BLOCK
      ?auto_90102 - BLOCK
      ?auto_90103 - BLOCK
      ?auto_90104 - BLOCK
      ?auto_90105 - BLOCK
      ?auto_90106 - BLOCK
      ?auto_90107 - BLOCK
      ?auto_90108 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90108 ) ( not ( = ?auto_90099 ?auto_90100 ) ) ( not ( = ?auto_90099 ?auto_90101 ) ) ( not ( = ?auto_90099 ?auto_90102 ) ) ( not ( = ?auto_90099 ?auto_90103 ) ) ( not ( = ?auto_90099 ?auto_90104 ) ) ( not ( = ?auto_90099 ?auto_90105 ) ) ( not ( = ?auto_90099 ?auto_90106 ) ) ( not ( = ?auto_90099 ?auto_90107 ) ) ( not ( = ?auto_90099 ?auto_90108 ) ) ( not ( = ?auto_90100 ?auto_90101 ) ) ( not ( = ?auto_90100 ?auto_90102 ) ) ( not ( = ?auto_90100 ?auto_90103 ) ) ( not ( = ?auto_90100 ?auto_90104 ) ) ( not ( = ?auto_90100 ?auto_90105 ) ) ( not ( = ?auto_90100 ?auto_90106 ) ) ( not ( = ?auto_90100 ?auto_90107 ) ) ( not ( = ?auto_90100 ?auto_90108 ) ) ( not ( = ?auto_90101 ?auto_90102 ) ) ( not ( = ?auto_90101 ?auto_90103 ) ) ( not ( = ?auto_90101 ?auto_90104 ) ) ( not ( = ?auto_90101 ?auto_90105 ) ) ( not ( = ?auto_90101 ?auto_90106 ) ) ( not ( = ?auto_90101 ?auto_90107 ) ) ( not ( = ?auto_90101 ?auto_90108 ) ) ( not ( = ?auto_90102 ?auto_90103 ) ) ( not ( = ?auto_90102 ?auto_90104 ) ) ( not ( = ?auto_90102 ?auto_90105 ) ) ( not ( = ?auto_90102 ?auto_90106 ) ) ( not ( = ?auto_90102 ?auto_90107 ) ) ( not ( = ?auto_90102 ?auto_90108 ) ) ( not ( = ?auto_90103 ?auto_90104 ) ) ( not ( = ?auto_90103 ?auto_90105 ) ) ( not ( = ?auto_90103 ?auto_90106 ) ) ( not ( = ?auto_90103 ?auto_90107 ) ) ( not ( = ?auto_90103 ?auto_90108 ) ) ( not ( = ?auto_90104 ?auto_90105 ) ) ( not ( = ?auto_90104 ?auto_90106 ) ) ( not ( = ?auto_90104 ?auto_90107 ) ) ( not ( = ?auto_90104 ?auto_90108 ) ) ( not ( = ?auto_90105 ?auto_90106 ) ) ( not ( = ?auto_90105 ?auto_90107 ) ) ( not ( = ?auto_90105 ?auto_90108 ) ) ( not ( = ?auto_90106 ?auto_90107 ) ) ( not ( = ?auto_90106 ?auto_90108 ) ) ( not ( = ?auto_90107 ?auto_90108 ) ) ( ON ?auto_90107 ?auto_90108 ) ( ON ?auto_90106 ?auto_90107 ) ( ON ?auto_90105 ?auto_90106 ) ( ON ?auto_90104 ?auto_90105 ) ( ON ?auto_90103 ?auto_90104 ) ( ON ?auto_90102 ?auto_90103 ) ( ON ?auto_90101 ?auto_90102 ) ( ON ?auto_90100 ?auto_90101 ) ( ON ?auto_90099 ?auto_90100 ) ( CLEAR ?auto_90099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_90099 )
      ( MAKE-10PILE ?auto_90099 ?auto_90100 ?auto_90101 ?auto_90102 ?auto_90103 ?auto_90104 ?auto_90105 ?auto_90106 ?auto_90107 ?auto_90108 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_90119 - BLOCK
      ?auto_90120 - BLOCK
      ?auto_90121 - BLOCK
      ?auto_90122 - BLOCK
      ?auto_90123 - BLOCK
      ?auto_90124 - BLOCK
      ?auto_90125 - BLOCK
      ?auto_90126 - BLOCK
      ?auto_90127 - BLOCK
      ?auto_90128 - BLOCK
    )
    :vars
    (
      ?auto_90129 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90119 ?auto_90120 ) ) ( not ( = ?auto_90119 ?auto_90121 ) ) ( not ( = ?auto_90119 ?auto_90122 ) ) ( not ( = ?auto_90119 ?auto_90123 ) ) ( not ( = ?auto_90119 ?auto_90124 ) ) ( not ( = ?auto_90119 ?auto_90125 ) ) ( not ( = ?auto_90119 ?auto_90126 ) ) ( not ( = ?auto_90119 ?auto_90127 ) ) ( not ( = ?auto_90119 ?auto_90128 ) ) ( not ( = ?auto_90120 ?auto_90121 ) ) ( not ( = ?auto_90120 ?auto_90122 ) ) ( not ( = ?auto_90120 ?auto_90123 ) ) ( not ( = ?auto_90120 ?auto_90124 ) ) ( not ( = ?auto_90120 ?auto_90125 ) ) ( not ( = ?auto_90120 ?auto_90126 ) ) ( not ( = ?auto_90120 ?auto_90127 ) ) ( not ( = ?auto_90120 ?auto_90128 ) ) ( not ( = ?auto_90121 ?auto_90122 ) ) ( not ( = ?auto_90121 ?auto_90123 ) ) ( not ( = ?auto_90121 ?auto_90124 ) ) ( not ( = ?auto_90121 ?auto_90125 ) ) ( not ( = ?auto_90121 ?auto_90126 ) ) ( not ( = ?auto_90121 ?auto_90127 ) ) ( not ( = ?auto_90121 ?auto_90128 ) ) ( not ( = ?auto_90122 ?auto_90123 ) ) ( not ( = ?auto_90122 ?auto_90124 ) ) ( not ( = ?auto_90122 ?auto_90125 ) ) ( not ( = ?auto_90122 ?auto_90126 ) ) ( not ( = ?auto_90122 ?auto_90127 ) ) ( not ( = ?auto_90122 ?auto_90128 ) ) ( not ( = ?auto_90123 ?auto_90124 ) ) ( not ( = ?auto_90123 ?auto_90125 ) ) ( not ( = ?auto_90123 ?auto_90126 ) ) ( not ( = ?auto_90123 ?auto_90127 ) ) ( not ( = ?auto_90123 ?auto_90128 ) ) ( not ( = ?auto_90124 ?auto_90125 ) ) ( not ( = ?auto_90124 ?auto_90126 ) ) ( not ( = ?auto_90124 ?auto_90127 ) ) ( not ( = ?auto_90124 ?auto_90128 ) ) ( not ( = ?auto_90125 ?auto_90126 ) ) ( not ( = ?auto_90125 ?auto_90127 ) ) ( not ( = ?auto_90125 ?auto_90128 ) ) ( not ( = ?auto_90126 ?auto_90127 ) ) ( not ( = ?auto_90126 ?auto_90128 ) ) ( not ( = ?auto_90127 ?auto_90128 ) ) ( ON ?auto_90119 ?auto_90129 ) ( not ( = ?auto_90128 ?auto_90129 ) ) ( not ( = ?auto_90127 ?auto_90129 ) ) ( not ( = ?auto_90126 ?auto_90129 ) ) ( not ( = ?auto_90125 ?auto_90129 ) ) ( not ( = ?auto_90124 ?auto_90129 ) ) ( not ( = ?auto_90123 ?auto_90129 ) ) ( not ( = ?auto_90122 ?auto_90129 ) ) ( not ( = ?auto_90121 ?auto_90129 ) ) ( not ( = ?auto_90120 ?auto_90129 ) ) ( not ( = ?auto_90119 ?auto_90129 ) ) ( ON ?auto_90120 ?auto_90119 ) ( ON ?auto_90121 ?auto_90120 ) ( ON ?auto_90122 ?auto_90121 ) ( ON ?auto_90123 ?auto_90122 ) ( ON ?auto_90124 ?auto_90123 ) ( ON ?auto_90125 ?auto_90124 ) ( ON ?auto_90126 ?auto_90125 ) ( ON ?auto_90127 ?auto_90126 ) ( ON ?auto_90128 ?auto_90127 ) ( CLEAR ?auto_90128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_90128 ?auto_90127 ?auto_90126 ?auto_90125 ?auto_90124 ?auto_90123 ?auto_90122 ?auto_90121 ?auto_90120 ?auto_90119 )
      ( MAKE-10PILE ?auto_90119 ?auto_90120 ?auto_90121 ?auto_90122 ?auto_90123 ?auto_90124 ?auto_90125 ?auto_90126 ?auto_90127 ?auto_90128 ) )
  )

)

