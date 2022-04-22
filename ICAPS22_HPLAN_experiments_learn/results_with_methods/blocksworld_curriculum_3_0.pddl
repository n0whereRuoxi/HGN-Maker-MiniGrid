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
      ?auto_581 - BLOCK
    )
    :vars
    (
      ?auto_582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_581 ?auto_582 ) ( CLEAR ?auto_581 ) ( HAND-EMPTY ) ( not ( = ?auto_581 ?auto_582 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_581 ?auto_582 )
      ( !PUTDOWN ?auto_581 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_584 - BLOCK
    )
    :vars
    (
      ?auto_585 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_584 ?auto_585 ) ( CLEAR ?auto_584 ) ( HAND-EMPTY ) ( not ( = ?auto_584 ?auto_585 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_584 ?auto_585 )
      ( !PUTDOWN ?auto_584 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_588 - BLOCK
      ?auto_589 - BLOCK
    )
    :vars
    (
      ?auto_590 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_588 ) ( ON ?auto_589 ?auto_590 ) ( CLEAR ?auto_589 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_588 ) ( not ( = ?auto_588 ?auto_589 ) ) ( not ( = ?auto_588 ?auto_590 ) ) ( not ( = ?auto_589 ?auto_590 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_589 ?auto_590 )
      ( !STACK ?auto_589 ?auto_588 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_593 - BLOCK
      ?auto_594 - BLOCK
    )
    :vars
    (
      ?auto_595 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_593 ) ( ON ?auto_594 ?auto_595 ) ( CLEAR ?auto_594 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_593 ) ( not ( = ?auto_593 ?auto_594 ) ) ( not ( = ?auto_593 ?auto_595 ) ) ( not ( = ?auto_594 ?auto_595 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_594 ?auto_595 )
      ( !STACK ?auto_594 ?auto_593 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_598 - BLOCK
      ?auto_599 - BLOCK
    )
    :vars
    (
      ?auto_600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_599 ?auto_600 ) ( not ( = ?auto_598 ?auto_599 ) ) ( not ( = ?auto_598 ?auto_600 ) ) ( not ( = ?auto_599 ?auto_600 ) ) ( ON ?auto_598 ?auto_599 ) ( CLEAR ?auto_598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_598 )
      ( MAKE-2PILE ?auto_598 ?auto_599 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_603 - BLOCK
      ?auto_604 - BLOCK
    )
    :vars
    (
      ?auto_605 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_604 ?auto_605 ) ( not ( = ?auto_603 ?auto_604 ) ) ( not ( = ?auto_603 ?auto_605 ) ) ( not ( = ?auto_604 ?auto_605 ) ) ( ON ?auto_603 ?auto_604 ) ( CLEAR ?auto_603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_603 )
      ( MAKE-2PILE ?auto_603 ?auto_604 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_609 - BLOCK
      ?auto_610 - BLOCK
      ?auto_611 - BLOCK
    )
    :vars
    (
      ?auto_612 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_610 ) ( ON ?auto_611 ?auto_612 ) ( CLEAR ?auto_611 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_609 ) ( ON ?auto_610 ?auto_609 ) ( not ( = ?auto_609 ?auto_610 ) ) ( not ( = ?auto_609 ?auto_611 ) ) ( not ( = ?auto_609 ?auto_612 ) ) ( not ( = ?auto_610 ?auto_611 ) ) ( not ( = ?auto_610 ?auto_612 ) ) ( not ( = ?auto_611 ?auto_612 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_611 ?auto_612 )
      ( !STACK ?auto_611 ?auto_610 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_616 - BLOCK
      ?auto_617 - BLOCK
      ?auto_618 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_617 ) ( ON-TABLE ?auto_618 ) ( CLEAR ?auto_618 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_616 ) ( ON ?auto_617 ?auto_616 ) ( not ( = ?auto_616 ?auto_617 ) ) ( not ( = ?auto_616 ?auto_618 ) ) ( not ( = ?auto_617 ?auto_618 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_618 )
      ( !STACK ?auto_618 ?auto_617 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_622 - BLOCK
      ?auto_623 - BLOCK
      ?auto_624 - BLOCK
    )
    :vars
    (
      ?auto_625 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_624 ?auto_625 ) ( ON-TABLE ?auto_622 ) ( not ( = ?auto_622 ?auto_623 ) ) ( not ( = ?auto_622 ?auto_624 ) ) ( not ( = ?auto_622 ?auto_625 ) ) ( not ( = ?auto_623 ?auto_624 ) ) ( not ( = ?auto_623 ?auto_625 ) ) ( not ( = ?auto_624 ?auto_625 ) ) ( CLEAR ?auto_622 ) ( ON ?auto_623 ?auto_624 ) ( CLEAR ?auto_623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_622 ?auto_623 )
      ( MAKE-3PILE ?auto_622 ?auto_623 ?auto_624 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_629 - BLOCK
      ?auto_630 - BLOCK
      ?auto_631 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_631 ) ( ON-TABLE ?auto_629 ) ( not ( = ?auto_629 ?auto_630 ) ) ( not ( = ?auto_629 ?auto_631 ) ) ( not ( = ?auto_630 ?auto_631 ) ) ( CLEAR ?auto_629 ) ( ON ?auto_630 ?auto_631 ) ( CLEAR ?auto_630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_629 ?auto_630 )
      ( MAKE-3PILE ?auto_629 ?auto_630 ?auto_631 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_635 - BLOCK
      ?auto_636 - BLOCK
      ?auto_637 - BLOCK
    )
    :vars
    (
      ?auto_638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_637 ?auto_638 ) ( not ( = ?auto_635 ?auto_636 ) ) ( not ( = ?auto_635 ?auto_637 ) ) ( not ( = ?auto_635 ?auto_638 ) ) ( not ( = ?auto_636 ?auto_637 ) ) ( not ( = ?auto_636 ?auto_638 ) ) ( not ( = ?auto_637 ?auto_638 ) ) ( ON ?auto_636 ?auto_637 ) ( ON ?auto_635 ?auto_636 ) ( CLEAR ?auto_635 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_635 )
      ( MAKE-3PILE ?auto_635 ?auto_636 ?auto_637 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_642 - BLOCK
      ?auto_643 - BLOCK
      ?auto_644 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_644 ) ( not ( = ?auto_642 ?auto_643 ) ) ( not ( = ?auto_642 ?auto_644 ) ) ( not ( = ?auto_643 ?auto_644 ) ) ( ON ?auto_643 ?auto_644 ) ( ON ?auto_642 ?auto_643 ) ( CLEAR ?auto_642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_642 )
      ( MAKE-3PILE ?auto_642 ?auto_643 ?auto_644 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_648 - BLOCK
      ?auto_649 - BLOCK
      ?auto_650 - BLOCK
    )
    :vars
    (
      ?auto_651 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_648 ?auto_649 ) ) ( not ( = ?auto_648 ?auto_650 ) ) ( not ( = ?auto_649 ?auto_650 ) ) ( ON ?auto_648 ?auto_651 ) ( not ( = ?auto_650 ?auto_651 ) ) ( not ( = ?auto_649 ?auto_651 ) ) ( not ( = ?auto_648 ?auto_651 ) ) ( ON ?auto_649 ?auto_648 ) ( ON ?auto_650 ?auto_649 ) ( CLEAR ?auto_650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_650 ?auto_649 ?auto_648 )
      ( MAKE-3PILE ?auto_648 ?auto_649 ?auto_650 ) )
  )

)

