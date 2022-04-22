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
      ?auto_569 - BLOCK
      ?auto_570 - BLOCK
    )
    :vars
    (
      ?auto_571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_571 ?auto_570 ) ( CLEAR ?auto_571 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_569 ) ( ON ?auto_570 ?auto_569 ) ( not ( = ?auto_569 ?auto_570 ) ) ( not ( = ?auto_569 ?auto_571 ) ) ( not ( = ?auto_570 ?auto_571 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_571 ?auto_570 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_573 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_573 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_573 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_574 - BLOCK
    )
    :vars
    (
      ?auto_575 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_574 ?auto_575 ) ( CLEAR ?auto_574 ) ( HAND-EMPTY ) ( not ( = ?auto_574 ?auto_575 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_574 ?auto_575 )
      ( MAKE-1PILE ?auto_574 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_577 - BLOCK
    )
    :vars
    (
      ?auto_578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_578 ?auto_577 ) ( CLEAR ?auto_578 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_577 ) ( not ( = ?auto_577 ?auto_578 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_578 ?auto_577 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_579 - BLOCK
    )
    :vars
    (
      ?auto_580 - BLOCK
      ?auto_581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_580 ?auto_579 ) ( CLEAR ?auto_580 ) ( ON-TABLE ?auto_579 ) ( not ( = ?auto_579 ?auto_580 ) ) ( HOLDING ?auto_581 ) ( not ( = ?auto_579 ?auto_581 ) ) ( not ( = ?auto_580 ?auto_581 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_581 )
      ( MAKE-1PILE ?auto_579 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_582 - BLOCK
    )
    :vars
    (
      ?auto_583 - BLOCK
      ?auto_584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_583 ?auto_582 ) ( ON-TABLE ?auto_582 ) ( not ( = ?auto_582 ?auto_583 ) ) ( not ( = ?auto_582 ?auto_584 ) ) ( not ( = ?auto_583 ?auto_584 ) ) ( ON ?auto_584 ?auto_583 ) ( CLEAR ?auto_584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_582 ?auto_583 )
      ( MAKE-1PILE ?auto_582 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_587 - BLOCK
      ?auto_588 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_588 ) ( CLEAR ?auto_587 ) ( ON-TABLE ?auto_587 ) ( not ( = ?auto_587 ?auto_588 ) ) )
    :subtasks
    ( ( !STACK ?auto_588 ?auto_587 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_589 - BLOCK
      ?auto_590 - BLOCK
    )
    :vars
    (
      ?auto_591 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_589 ) ( ON-TABLE ?auto_589 ) ( not ( = ?auto_589 ?auto_590 ) ) ( ON ?auto_590 ?auto_591 ) ( CLEAR ?auto_590 ) ( HAND-EMPTY ) ( not ( = ?auto_589 ?auto_591 ) ) ( not ( = ?auto_590 ?auto_591 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_590 ?auto_591 )
      ( MAKE-2PILE ?auto_589 ?auto_590 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_592 - BLOCK
      ?auto_593 - BLOCK
    )
    :vars
    (
      ?auto_594 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_592 ?auto_593 ) ) ( ON ?auto_593 ?auto_594 ) ( CLEAR ?auto_593 ) ( not ( = ?auto_592 ?auto_594 ) ) ( not ( = ?auto_593 ?auto_594 ) ) ( HOLDING ?auto_592 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_592 )
      ( MAKE-2PILE ?auto_592 ?auto_593 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_595 - BLOCK
      ?auto_596 - BLOCK
    )
    :vars
    (
      ?auto_597 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_595 ?auto_596 ) ) ( ON ?auto_596 ?auto_597 ) ( not ( = ?auto_595 ?auto_597 ) ) ( not ( = ?auto_596 ?auto_597 ) ) ( ON ?auto_595 ?auto_596 ) ( CLEAR ?auto_595 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_597 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_597 ?auto_596 )
      ( MAKE-2PILE ?auto_595 ?auto_596 ) )
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
    ( and ( ON ?auto_600 ?auto_599 ) ( CLEAR ?auto_600 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_599 ) ( not ( = ?auto_599 ?auto_600 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_600 ?auto_599 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_606 - BLOCK
    )
    :vars
    (
      ?auto_607 - BLOCK
      ?auto_608 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_606 ?auto_607 ) ) ( ON ?auto_607 ?auto_608 ) ( CLEAR ?auto_607 ) ( not ( = ?auto_606 ?auto_608 ) ) ( not ( = ?auto_607 ?auto_608 ) ) ( HOLDING ?auto_606 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_606 ?auto_607 )
      ( MAKE-1PILE ?auto_606 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_609 - BLOCK
    )
    :vars
    (
      ?auto_611 - BLOCK
      ?auto_610 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_609 ?auto_611 ) ) ( ON ?auto_611 ?auto_610 ) ( not ( = ?auto_609 ?auto_610 ) ) ( not ( = ?auto_611 ?auto_610 ) ) ( ON ?auto_609 ?auto_611 ) ( CLEAR ?auto_609 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_610 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_610 ?auto_611 )
      ( MAKE-1PILE ?auto_609 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_613 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_613 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_613 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_614 - BLOCK
    )
    :vars
    (
      ?auto_615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_614 ?auto_615 ) ( CLEAR ?auto_614 ) ( HAND-EMPTY ) ( not ( = ?auto_614 ?auto_615 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_614 ?auto_615 )
      ( MAKE-1PILE ?auto_614 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_616 - BLOCK
    )
    :vars
    (
      ?auto_617 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_616 ?auto_617 ) ) ( HOLDING ?auto_616 ) ( CLEAR ?auto_617 ) ( ON-TABLE ?auto_617 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_617 ?auto_616 )
      ( MAKE-1PILE ?auto_616 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_618 - BLOCK
    )
    :vars
    (
      ?auto_619 - BLOCK
      ?auto_620 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_618 ?auto_619 ) ) ( CLEAR ?auto_619 ) ( ON-TABLE ?auto_619 ) ( ON ?auto_618 ?auto_620 ) ( CLEAR ?auto_618 ) ( HAND-EMPTY ) ( not ( = ?auto_618 ?auto_620 ) ) ( not ( = ?auto_619 ?auto_620 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_618 ?auto_620 )
      ( MAKE-1PILE ?auto_618 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_621 - BLOCK
    )
    :vars
    (
      ?auto_622 - BLOCK
      ?auto_623 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_621 ?auto_622 ) ) ( ON ?auto_621 ?auto_623 ) ( CLEAR ?auto_621 ) ( not ( = ?auto_621 ?auto_623 ) ) ( not ( = ?auto_622 ?auto_623 ) ) ( HOLDING ?auto_622 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_622 )
      ( MAKE-1PILE ?auto_621 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_624 - BLOCK
    )
    :vars
    (
      ?auto_625 - BLOCK
      ?auto_626 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_624 ?auto_625 ) ) ( ON ?auto_624 ?auto_626 ) ( not ( = ?auto_624 ?auto_626 ) ) ( not ( = ?auto_625 ?auto_626 ) ) ( ON ?auto_625 ?auto_624 ) ( CLEAR ?auto_625 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_626 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_626 ?auto_624 )
      ( MAKE-1PILE ?auto_624 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_629 - BLOCK
      ?auto_630 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_630 ) ( CLEAR ?auto_629 ) ( ON-TABLE ?auto_629 ) ( not ( = ?auto_629 ?auto_630 ) ) )
    :subtasks
    ( ( !STACK ?auto_630 ?auto_629 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_631 - BLOCK
      ?auto_632 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_631 ) ( ON-TABLE ?auto_631 ) ( not ( = ?auto_631 ?auto_632 ) ) ( ON-TABLE ?auto_632 ) ( CLEAR ?auto_632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_632 )
      ( MAKE-2PILE ?auto_631 ?auto_632 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_633 - BLOCK
      ?auto_634 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_633 ?auto_634 ) ) ( ON-TABLE ?auto_634 ) ( CLEAR ?auto_634 ) ( HOLDING ?auto_633 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_633 )
      ( MAKE-2PILE ?auto_633 ?auto_634 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_635 - BLOCK
      ?auto_636 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_635 ?auto_636 ) ) ( ON-TABLE ?auto_636 ) ( ON ?auto_635 ?auto_636 ) ( CLEAR ?auto_635 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_636 )
      ( MAKE-2PILE ?auto_635 ?auto_636 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_637 - BLOCK
      ?auto_638 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_637 ?auto_638 ) ) ( ON-TABLE ?auto_638 ) ( HOLDING ?auto_637 ) ( CLEAR ?auto_638 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_638 ?auto_637 )
      ( MAKE-2PILE ?auto_637 ?auto_638 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_639 - BLOCK
      ?auto_640 - BLOCK
    )
    :vars
    (
      ?auto_641 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_639 ?auto_640 ) ) ( ON-TABLE ?auto_640 ) ( CLEAR ?auto_640 ) ( ON ?auto_639 ?auto_641 ) ( CLEAR ?auto_639 ) ( HAND-EMPTY ) ( not ( = ?auto_639 ?auto_641 ) ) ( not ( = ?auto_640 ?auto_641 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_639 ?auto_641 )
      ( MAKE-2PILE ?auto_639 ?auto_640 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_642 - BLOCK
      ?auto_643 - BLOCK
    )
    :vars
    (
      ?auto_644 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_642 ?auto_643 ) ) ( ON ?auto_642 ?auto_644 ) ( CLEAR ?auto_642 ) ( not ( = ?auto_642 ?auto_644 ) ) ( not ( = ?auto_643 ?auto_644 ) ) ( HOLDING ?auto_643 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_643 )
      ( MAKE-2PILE ?auto_642 ?auto_643 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_645 - BLOCK
      ?auto_646 - BLOCK
    )
    :vars
    (
      ?auto_647 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_645 ?auto_646 ) ) ( ON ?auto_645 ?auto_647 ) ( not ( = ?auto_645 ?auto_647 ) ) ( not ( = ?auto_646 ?auto_647 ) ) ( ON ?auto_646 ?auto_645 ) ( CLEAR ?auto_646 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_647 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_647 ?auto_645 )
      ( MAKE-2PILE ?auto_645 ?auto_646 ) )
  )

)

