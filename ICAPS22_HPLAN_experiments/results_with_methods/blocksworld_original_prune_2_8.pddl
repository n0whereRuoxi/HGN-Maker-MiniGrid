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

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_594 - BLOCK
      ?auto_595 - BLOCK
    )
    :vars
    (
      ?auto_596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_596 ?auto_595 ) ( CLEAR ?auto_596 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_594 ) ( ON ?auto_595 ?auto_594 ) ( not ( = ?auto_594 ?auto_595 ) ) ( not ( = ?auto_594 ?auto_596 ) ) ( not ( = ?auto_595 ?auto_596 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_596 ?auto_595 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_598 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_598 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_598 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_599 - BLOCK
    )
    :vars
    (
      ?auto_600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_599 ?auto_600 ) ( CLEAR ?auto_599 ) ( HAND-EMPTY ) ( not ( = ?auto_599 ?auto_600 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_599 ?auto_600 )
      ( MAKE-1PILE ?auto_599 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_602 - BLOCK
    )
    :vars
    (
      ?auto_603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_603 ?auto_602 ) ( CLEAR ?auto_603 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_602 ) ( not ( = ?auto_602 ?auto_603 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_603 ?auto_602 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_604 - BLOCK
    )
    :vars
    (
      ?auto_605 - BLOCK
      ?auto_606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_605 ?auto_604 ) ( CLEAR ?auto_605 ) ( ON-TABLE ?auto_604 ) ( not ( = ?auto_604 ?auto_605 ) ) ( HOLDING ?auto_606 ) ( not ( = ?auto_604 ?auto_606 ) ) ( not ( = ?auto_605 ?auto_606 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_606 )
      ( MAKE-1PILE ?auto_604 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_607 - BLOCK
    )
    :vars
    (
      ?auto_608 - BLOCK
      ?auto_609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_608 ?auto_607 ) ( ON-TABLE ?auto_607 ) ( not ( = ?auto_607 ?auto_608 ) ) ( not ( = ?auto_607 ?auto_609 ) ) ( not ( = ?auto_608 ?auto_609 ) ) ( ON ?auto_609 ?auto_608 ) ( CLEAR ?auto_609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_607 ?auto_608 )
      ( MAKE-1PILE ?auto_607 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_612 - BLOCK
      ?auto_613 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_613 ) ( CLEAR ?auto_612 ) ( ON-TABLE ?auto_612 ) ( not ( = ?auto_612 ?auto_613 ) ) )
    :subtasks
    ( ( !STACK ?auto_613 ?auto_612 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_614 - BLOCK
      ?auto_615 - BLOCK
    )
    :vars
    (
      ?auto_616 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_614 ) ( ON-TABLE ?auto_614 ) ( not ( = ?auto_614 ?auto_615 ) ) ( ON ?auto_615 ?auto_616 ) ( CLEAR ?auto_615 ) ( HAND-EMPTY ) ( not ( = ?auto_614 ?auto_616 ) ) ( not ( = ?auto_615 ?auto_616 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_615 ?auto_616 )
      ( MAKE-2PILE ?auto_614 ?auto_615 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_617 - BLOCK
      ?auto_618 - BLOCK
    )
    :vars
    (
      ?auto_619 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_617 ?auto_618 ) ) ( ON ?auto_618 ?auto_619 ) ( CLEAR ?auto_618 ) ( not ( = ?auto_617 ?auto_619 ) ) ( not ( = ?auto_618 ?auto_619 ) ) ( HOLDING ?auto_617 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_617 )
      ( MAKE-2PILE ?auto_617 ?auto_618 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_620 - BLOCK
      ?auto_621 - BLOCK
    )
    :vars
    (
      ?auto_622 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_620 ?auto_621 ) ) ( ON ?auto_621 ?auto_622 ) ( not ( = ?auto_620 ?auto_622 ) ) ( not ( = ?auto_621 ?auto_622 ) ) ( ON ?auto_620 ?auto_621 ) ( CLEAR ?auto_620 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_622 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_622 ?auto_621 )
      ( MAKE-2PILE ?auto_620 ?auto_621 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_639 - BLOCK
    )
    :vars
    (
      ?auto_640 - BLOCK
      ?auto_641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_639 ?auto_640 ) ( CLEAR ?auto_639 ) ( not ( = ?auto_639 ?auto_640 ) ) ( HOLDING ?auto_641 ) ( not ( = ?auto_639 ?auto_641 ) ) ( not ( = ?auto_640 ?auto_641 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_641 )
      ( MAKE-1PILE ?auto_639 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_642 - BLOCK
    )
    :vars
    (
      ?auto_643 - BLOCK
      ?auto_644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_642 ?auto_643 ) ( not ( = ?auto_642 ?auto_643 ) ) ( not ( = ?auto_642 ?auto_644 ) ) ( not ( = ?auto_643 ?auto_644 ) ) ( ON ?auto_644 ?auto_642 ) ( CLEAR ?auto_644 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_643 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_643 ?auto_642 )
      ( MAKE-1PILE ?auto_642 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_649 - BLOCK
      ?auto_650 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_649 ) ( ON-TABLE ?auto_649 ) ( not ( = ?auto_649 ?auto_650 ) ) ( ON-TABLE ?auto_650 ) ( CLEAR ?auto_650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_650 )
      ( MAKE-2PILE ?auto_649 ?auto_650 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_651 - BLOCK
      ?auto_652 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_651 ?auto_652 ) ) ( ON-TABLE ?auto_652 ) ( CLEAR ?auto_652 ) ( HOLDING ?auto_651 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_651 )
      ( MAKE-2PILE ?auto_651 ?auto_652 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_653 - BLOCK
      ?auto_654 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_653 ?auto_654 ) ) ( ON-TABLE ?auto_654 ) ( ON ?auto_653 ?auto_654 ) ( CLEAR ?auto_653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_654 )
      ( MAKE-2PILE ?auto_653 ?auto_654 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_657 - BLOCK
      ?auto_658 - BLOCK
    )
    :vars
    (
      ?auto_659 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_657 ?auto_658 ) ) ( ON-TABLE ?auto_658 ) ( CLEAR ?auto_658 ) ( ON ?auto_657 ?auto_659 ) ( CLEAR ?auto_657 ) ( HAND-EMPTY ) ( not ( = ?auto_657 ?auto_659 ) ) ( not ( = ?auto_658 ?auto_659 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_657 ?auto_659 )
      ( MAKE-2PILE ?auto_657 ?auto_658 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_660 - BLOCK
      ?auto_661 - BLOCK
    )
    :vars
    (
      ?auto_662 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_660 ?auto_661 ) ) ( ON ?auto_660 ?auto_662 ) ( CLEAR ?auto_660 ) ( not ( = ?auto_660 ?auto_662 ) ) ( not ( = ?auto_661 ?auto_662 ) ) ( HOLDING ?auto_661 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_661 )
      ( MAKE-2PILE ?auto_660 ?auto_661 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_663 - BLOCK
      ?auto_664 - BLOCK
    )
    :vars
    (
      ?auto_665 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_663 ?auto_664 ) ) ( ON ?auto_663 ?auto_665 ) ( not ( = ?auto_663 ?auto_665 ) ) ( not ( = ?auto_664 ?auto_665 ) ) ( ON ?auto_664 ?auto_663 ) ( CLEAR ?auto_664 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_665 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_665 ?auto_663 )
      ( MAKE-2PILE ?auto_663 ?auto_664 ) )
  )

)

