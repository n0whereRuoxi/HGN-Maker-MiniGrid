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

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27573 - BLOCK
      ?auto_27574 - BLOCK
      ?auto_27575 - BLOCK
      ?auto_27576 - BLOCK
      ?auto_27577 - BLOCK
    )
    :vars
    (
      ?auto_27578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27578 ?auto_27577 ) ( CLEAR ?auto_27578 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27573 ) ( ON ?auto_27574 ?auto_27573 ) ( ON ?auto_27575 ?auto_27574 ) ( ON ?auto_27576 ?auto_27575 ) ( ON ?auto_27577 ?auto_27576 ) ( not ( = ?auto_27573 ?auto_27574 ) ) ( not ( = ?auto_27573 ?auto_27575 ) ) ( not ( = ?auto_27573 ?auto_27576 ) ) ( not ( = ?auto_27573 ?auto_27577 ) ) ( not ( = ?auto_27573 ?auto_27578 ) ) ( not ( = ?auto_27574 ?auto_27575 ) ) ( not ( = ?auto_27574 ?auto_27576 ) ) ( not ( = ?auto_27574 ?auto_27577 ) ) ( not ( = ?auto_27574 ?auto_27578 ) ) ( not ( = ?auto_27575 ?auto_27576 ) ) ( not ( = ?auto_27575 ?auto_27577 ) ) ( not ( = ?auto_27575 ?auto_27578 ) ) ( not ( = ?auto_27576 ?auto_27577 ) ) ( not ( = ?auto_27576 ?auto_27578 ) ) ( not ( = ?auto_27577 ?auto_27578 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27578 ?auto_27577 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27580 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_27580 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_27580 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27581 - BLOCK
    )
    :vars
    (
      ?auto_27582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27581 ?auto_27582 ) ( CLEAR ?auto_27581 ) ( HAND-EMPTY ) ( not ( = ?auto_27581 ?auto_27582 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27581 ?auto_27582 )
      ( MAKE-1PILE ?auto_27581 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27587 - BLOCK
      ?auto_27588 - BLOCK
      ?auto_27589 - BLOCK
      ?auto_27590 - BLOCK
    )
    :vars
    (
      ?auto_27591 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27591 ?auto_27590 ) ( CLEAR ?auto_27591 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27587 ) ( ON ?auto_27588 ?auto_27587 ) ( ON ?auto_27589 ?auto_27588 ) ( ON ?auto_27590 ?auto_27589 ) ( not ( = ?auto_27587 ?auto_27588 ) ) ( not ( = ?auto_27587 ?auto_27589 ) ) ( not ( = ?auto_27587 ?auto_27590 ) ) ( not ( = ?auto_27587 ?auto_27591 ) ) ( not ( = ?auto_27588 ?auto_27589 ) ) ( not ( = ?auto_27588 ?auto_27590 ) ) ( not ( = ?auto_27588 ?auto_27591 ) ) ( not ( = ?auto_27589 ?auto_27590 ) ) ( not ( = ?auto_27589 ?auto_27591 ) ) ( not ( = ?auto_27590 ?auto_27591 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27591 ?auto_27590 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27592 - BLOCK
      ?auto_27593 - BLOCK
      ?auto_27594 - BLOCK
      ?auto_27595 - BLOCK
    )
    :vars
    (
      ?auto_27596 - BLOCK
      ?auto_27597 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27596 ?auto_27595 ) ( CLEAR ?auto_27596 ) ( ON-TABLE ?auto_27592 ) ( ON ?auto_27593 ?auto_27592 ) ( ON ?auto_27594 ?auto_27593 ) ( ON ?auto_27595 ?auto_27594 ) ( not ( = ?auto_27592 ?auto_27593 ) ) ( not ( = ?auto_27592 ?auto_27594 ) ) ( not ( = ?auto_27592 ?auto_27595 ) ) ( not ( = ?auto_27592 ?auto_27596 ) ) ( not ( = ?auto_27593 ?auto_27594 ) ) ( not ( = ?auto_27593 ?auto_27595 ) ) ( not ( = ?auto_27593 ?auto_27596 ) ) ( not ( = ?auto_27594 ?auto_27595 ) ) ( not ( = ?auto_27594 ?auto_27596 ) ) ( not ( = ?auto_27595 ?auto_27596 ) ) ( HOLDING ?auto_27597 ) ( not ( = ?auto_27592 ?auto_27597 ) ) ( not ( = ?auto_27593 ?auto_27597 ) ) ( not ( = ?auto_27594 ?auto_27597 ) ) ( not ( = ?auto_27595 ?auto_27597 ) ) ( not ( = ?auto_27596 ?auto_27597 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_27597 )
      ( MAKE-4PILE ?auto_27592 ?auto_27593 ?auto_27594 ?auto_27595 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27598 - BLOCK
      ?auto_27599 - BLOCK
      ?auto_27600 - BLOCK
      ?auto_27601 - BLOCK
    )
    :vars
    (
      ?auto_27602 - BLOCK
      ?auto_27603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27602 ?auto_27601 ) ( ON-TABLE ?auto_27598 ) ( ON ?auto_27599 ?auto_27598 ) ( ON ?auto_27600 ?auto_27599 ) ( ON ?auto_27601 ?auto_27600 ) ( not ( = ?auto_27598 ?auto_27599 ) ) ( not ( = ?auto_27598 ?auto_27600 ) ) ( not ( = ?auto_27598 ?auto_27601 ) ) ( not ( = ?auto_27598 ?auto_27602 ) ) ( not ( = ?auto_27599 ?auto_27600 ) ) ( not ( = ?auto_27599 ?auto_27601 ) ) ( not ( = ?auto_27599 ?auto_27602 ) ) ( not ( = ?auto_27600 ?auto_27601 ) ) ( not ( = ?auto_27600 ?auto_27602 ) ) ( not ( = ?auto_27601 ?auto_27602 ) ) ( not ( = ?auto_27598 ?auto_27603 ) ) ( not ( = ?auto_27599 ?auto_27603 ) ) ( not ( = ?auto_27600 ?auto_27603 ) ) ( not ( = ?auto_27601 ?auto_27603 ) ) ( not ( = ?auto_27602 ?auto_27603 ) ) ( ON ?auto_27603 ?auto_27602 ) ( CLEAR ?auto_27603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27598 ?auto_27599 ?auto_27600 ?auto_27601 ?auto_27602 )
      ( MAKE-4PILE ?auto_27598 ?auto_27599 ?auto_27600 ?auto_27601 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27606 - BLOCK
      ?auto_27607 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_27607 ) ( CLEAR ?auto_27606 ) ( ON-TABLE ?auto_27606 ) ( not ( = ?auto_27606 ?auto_27607 ) ) )
    :subtasks
    ( ( !STACK ?auto_27607 ?auto_27606 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27608 - BLOCK
      ?auto_27609 - BLOCK
    )
    :vars
    (
      ?auto_27610 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_27608 ) ( ON-TABLE ?auto_27608 ) ( not ( = ?auto_27608 ?auto_27609 ) ) ( ON ?auto_27609 ?auto_27610 ) ( CLEAR ?auto_27609 ) ( HAND-EMPTY ) ( not ( = ?auto_27608 ?auto_27610 ) ) ( not ( = ?auto_27609 ?auto_27610 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27609 ?auto_27610 )
      ( MAKE-2PILE ?auto_27608 ?auto_27609 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27611 - BLOCK
      ?auto_27612 - BLOCK
    )
    :vars
    (
      ?auto_27613 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27611 ?auto_27612 ) ) ( ON ?auto_27612 ?auto_27613 ) ( CLEAR ?auto_27612 ) ( not ( = ?auto_27611 ?auto_27613 ) ) ( not ( = ?auto_27612 ?auto_27613 ) ) ( HOLDING ?auto_27611 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27611 )
      ( MAKE-2PILE ?auto_27611 ?auto_27612 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27614 - BLOCK
      ?auto_27615 - BLOCK
    )
    :vars
    (
      ?auto_27616 - BLOCK
      ?auto_27619 - BLOCK
      ?auto_27618 - BLOCK
      ?auto_27617 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27614 ?auto_27615 ) ) ( ON ?auto_27615 ?auto_27616 ) ( not ( = ?auto_27614 ?auto_27616 ) ) ( not ( = ?auto_27615 ?auto_27616 ) ) ( ON ?auto_27614 ?auto_27615 ) ( CLEAR ?auto_27614 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27619 ) ( ON ?auto_27618 ?auto_27619 ) ( ON ?auto_27617 ?auto_27618 ) ( ON ?auto_27616 ?auto_27617 ) ( not ( = ?auto_27619 ?auto_27618 ) ) ( not ( = ?auto_27619 ?auto_27617 ) ) ( not ( = ?auto_27619 ?auto_27616 ) ) ( not ( = ?auto_27619 ?auto_27615 ) ) ( not ( = ?auto_27619 ?auto_27614 ) ) ( not ( = ?auto_27618 ?auto_27617 ) ) ( not ( = ?auto_27618 ?auto_27616 ) ) ( not ( = ?auto_27618 ?auto_27615 ) ) ( not ( = ?auto_27618 ?auto_27614 ) ) ( not ( = ?auto_27617 ?auto_27616 ) ) ( not ( = ?auto_27617 ?auto_27615 ) ) ( not ( = ?auto_27617 ?auto_27614 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27619 ?auto_27618 ?auto_27617 ?auto_27616 ?auto_27615 )
      ( MAKE-2PILE ?auto_27614 ?auto_27615 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27623 - BLOCK
      ?auto_27624 - BLOCK
      ?auto_27625 - BLOCK
    )
    :vars
    (
      ?auto_27626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27626 ?auto_27625 ) ( CLEAR ?auto_27626 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27623 ) ( ON ?auto_27624 ?auto_27623 ) ( ON ?auto_27625 ?auto_27624 ) ( not ( = ?auto_27623 ?auto_27624 ) ) ( not ( = ?auto_27623 ?auto_27625 ) ) ( not ( = ?auto_27623 ?auto_27626 ) ) ( not ( = ?auto_27624 ?auto_27625 ) ) ( not ( = ?auto_27624 ?auto_27626 ) ) ( not ( = ?auto_27625 ?auto_27626 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27626 ?auto_27625 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27627 - BLOCK
      ?auto_27628 - BLOCK
      ?auto_27629 - BLOCK
    )
    :vars
    (
      ?auto_27630 - BLOCK
      ?auto_27631 - BLOCK
      ?auto_27632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27630 ?auto_27629 ) ( CLEAR ?auto_27630 ) ( ON-TABLE ?auto_27627 ) ( ON ?auto_27628 ?auto_27627 ) ( ON ?auto_27629 ?auto_27628 ) ( not ( = ?auto_27627 ?auto_27628 ) ) ( not ( = ?auto_27627 ?auto_27629 ) ) ( not ( = ?auto_27627 ?auto_27630 ) ) ( not ( = ?auto_27628 ?auto_27629 ) ) ( not ( = ?auto_27628 ?auto_27630 ) ) ( not ( = ?auto_27629 ?auto_27630 ) ) ( HOLDING ?auto_27631 ) ( CLEAR ?auto_27632 ) ( not ( = ?auto_27627 ?auto_27631 ) ) ( not ( = ?auto_27627 ?auto_27632 ) ) ( not ( = ?auto_27628 ?auto_27631 ) ) ( not ( = ?auto_27628 ?auto_27632 ) ) ( not ( = ?auto_27629 ?auto_27631 ) ) ( not ( = ?auto_27629 ?auto_27632 ) ) ( not ( = ?auto_27630 ?auto_27631 ) ) ( not ( = ?auto_27630 ?auto_27632 ) ) ( not ( = ?auto_27631 ?auto_27632 ) ) )
    :subtasks
    ( ( !STACK ?auto_27631 ?auto_27632 )
      ( MAKE-3PILE ?auto_27627 ?auto_27628 ?auto_27629 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27633 - BLOCK
      ?auto_27634 - BLOCK
      ?auto_27635 - BLOCK
    )
    :vars
    (
      ?auto_27636 - BLOCK
      ?auto_27637 - BLOCK
      ?auto_27638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27636 ?auto_27635 ) ( ON-TABLE ?auto_27633 ) ( ON ?auto_27634 ?auto_27633 ) ( ON ?auto_27635 ?auto_27634 ) ( not ( = ?auto_27633 ?auto_27634 ) ) ( not ( = ?auto_27633 ?auto_27635 ) ) ( not ( = ?auto_27633 ?auto_27636 ) ) ( not ( = ?auto_27634 ?auto_27635 ) ) ( not ( = ?auto_27634 ?auto_27636 ) ) ( not ( = ?auto_27635 ?auto_27636 ) ) ( CLEAR ?auto_27637 ) ( not ( = ?auto_27633 ?auto_27638 ) ) ( not ( = ?auto_27633 ?auto_27637 ) ) ( not ( = ?auto_27634 ?auto_27638 ) ) ( not ( = ?auto_27634 ?auto_27637 ) ) ( not ( = ?auto_27635 ?auto_27638 ) ) ( not ( = ?auto_27635 ?auto_27637 ) ) ( not ( = ?auto_27636 ?auto_27638 ) ) ( not ( = ?auto_27636 ?auto_27637 ) ) ( not ( = ?auto_27638 ?auto_27637 ) ) ( ON ?auto_27638 ?auto_27636 ) ( CLEAR ?auto_27638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27633 ?auto_27634 ?auto_27635 ?auto_27636 )
      ( MAKE-3PILE ?auto_27633 ?auto_27634 ?auto_27635 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27639 - BLOCK
      ?auto_27640 - BLOCK
      ?auto_27641 - BLOCK
    )
    :vars
    (
      ?auto_27642 - BLOCK
      ?auto_27644 - BLOCK
      ?auto_27643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27642 ?auto_27641 ) ( ON-TABLE ?auto_27639 ) ( ON ?auto_27640 ?auto_27639 ) ( ON ?auto_27641 ?auto_27640 ) ( not ( = ?auto_27639 ?auto_27640 ) ) ( not ( = ?auto_27639 ?auto_27641 ) ) ( not ( = ?auto_27639 ?auto_27642 ) ) ( not ( = ?auto_27640 ?auto_27641 ) ) ( not ( = ?auto_27640 ?auto_27642 ) ) ( not ( = ?auto_27641 ?auto_27642 ) ) ( not ( = ?auto_27639 ?auto_27644 ) ) ( not ( = ?auto_27639 ?auto_27643 ) ) ( not ( = ?auto_27640 ?auto_27644 ) ) ( not ( = ?auto_27640 ?auto_27643 ) ) ( not ( = ?auto_27641 ?auto_27644 ) ) ( not ( = ?auto_27641 ?auto_27643 ) ) ( not ( = ?auto_27642 ?auto_27644 ) ) ( not ( = ?auto_27642 ?auto_27643 ) ) ( not ( = ?auto_27644 ?auto_27643 ) ) ( ON ?auto_27644 ?auto_27642 ) ( CLEAR ?auto_27644 ) ( HOLDING ?auto_27643 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27643 )
      ( MAKE-3PILE ?auto_27639 ?auto_27640 ?auto_27641 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27645 - BLOCK
      ?auto_27646 - BLOCK
      ?auto_27647 - BLOCK
    )
    :vars
    (
      ?auto_27650 - BLOCK
      ?auto_27649 - BLOCK
      ?auto_27648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27650 ?auto_27647 ) ( ON-TABLE ?auto_27645 ) ( ON ?auto_27646 ?auto_27645 ) ( ON ?auto_27647 ?auto_27646 ) ( not ( = ?auto_27645 ?auto_27646 ) ) ( not ( = ?auto_27645 ?auto_27647 ) ) ( not ( = ?auto_27645 ?auto_27650 ) ) ( not ( = ?auto_27646 ?auto_27647 ) ) ( not ( = ?auto_27646 ?auto_27650 ) ) ( not ( = ?auto_27647 ?auto_27650 ) ) ( not ( = ?auto_27645 ?auto_27649 ) ) ( not ( = ?auto_27645 ?auto_27648 ) ) ( not ( = ?auto_27646 ?auto_27649 ) ) ( not ( = ?auto_27646 ?auto_27648 ) ) ( not ( = ?auto_27647 ?auto_27649 ) ) ( not ( = ?auto_27647 ?auto_27648 ) ) ( not ( = ?auto_27650 ?auto_27649 ) ) ( not ( = ?auto_27650 ?auto_27648 ) ) ( not ( = ?auto_27649 ?auto_27648 ) ) ( ON ?auto_27649 ?auto_27650 ) ( ON ?auto_27648 ?auto_27649 ) ( CLEAR ?auto_27648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27645 ?auto_27646 ?auto_27647 ?auto_27650 ?auto_27649 )
      ( MAKE-3PILE ?auto_27645 ?auto_27646 ?auto_27647 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27654 - BLOCK
      ?auto_27655 - BLOCK
      ?auto_27656 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_27656 ) ( CLEAR ?auto_27655 ) ( ON-TABLE ?auto_27654 ) ( ON ?auto_27655 ?auto_27654 ) ( not ( = ?auto_27654 ?auto_27655 ) ) ( not ( = ?auto_27654 ?auto_27656 ) ) ( not ( = ?auto_27655 ?auto_27656 ) ) )
    :subtasks
    ( ( !STACK ?auto_27656 ?auto_27655 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27657 - BLOCK
      ?auto_27658 - BLOCK
      ?auto_27659 - BLOCK
    )
    :vars
    (
      ?auto_27660 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_27658 ) ( ON-TABLE ?auto_27657 ) ( ON ?auto_27658 ?auto_27657 ) ( not ( = ?auto_27657 ?auto_27658 ) ) ( not ( = ?auto_27657 ?auto_27659 ) ) ( not ( = ?auto_27658 ?auto_27659 ) ) ( ON ?auto_27659 ?auto_27660 ) ( CLEAR ?auto_27659 ) ( HAND-EMPTY ) ( not ( = ?auto_27657 ?auto_27660 ) ) ( not ( = ?auto_27658 ?auto_27660 ) ) ( not ( = ?auto_27659 ?auto_27660 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27659 ?auto_27660 )
      ( MAKE-3PILE ?auto_27657 ?auto_27658 ?auto_27659 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27661 - BLOCK
      ?auto_27662 - BLOCK
      ?auto_27663 - BLOCK
    )
    :vars
    (
      ?auto_27664 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27661 ) ( not ( = ?auto_27661 ?auto_27662 ) ) ( not ( = ?auto_27661 ?auto_27663 ) ) ( not ( = ?auto_27662 ?auto_27663 ) ) ( ON ?auto_27663 ?auto_27664 ) ( CLEAR ?auto_27663 ) ( not ( = ?auto_27661 ?auto_27664 ) ) ( not ( = ?auto_27662 ?auto_27664 ) ) ( not ( = ?auto_27663 ?auto_27664 ) ) ( HOLDING ?auto_27662 ) ( CLEAR ?auto_27661 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27661 ?auto_27662 )
      ( MAKE-3PILE ?auto_27661 ?auto_27662 ?auto_27663 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27665 - BLOCK
      ?auto_27666 - BLOCK
      ?auto_27667 - BLOCK
    )
    :vars
    (
      ?auto_27668 - BLOCK
      ?auto_27669 - BLOCK
      ?auto_27670 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27665 ) ( not ( = ?auto_27665 ?auto_27666 ) ) ( not ( = ?auto_27665 ?auto_27667 ) ) ( not ( = ?auto_27666 ?auto_27667 ) ) ( ON ?auto_27667 ?auto_27668 ) ( not ( = ?auto_27665 ?auto_27668 ) ) ( not ( = ?auto_27666 ?auto_27668 ) ) ( not ( = ?auto_27667 ?auto_27668 ) ) ( CLEAR ?auto_27665 ) ( ON ?auto_27666 ?auto_27667 ) ( CLEAR ?auto_27666 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27669 ) ( ON ?auto_27670 ?auto_27669 ) ( ON ?auto_27668 ?auto_27670 ) ( not ( = ?auto_27669 ?auto_27670 ) ) ( not ( = ?auto_27669 ?auto_27668 ) ) ( not ( = ?auto_27669 ?auto_27667 ) ) ( not ( = ?auto_27669 ?auto_27666 ) ) ( not ( = ?auto_27670 ?auto_27668 ) ) ( not ( = ?auto_27670 ?auto_27667 ) ) ( not ( = ?auto_27670 ?auto_27666 ) ) ( not ( = ?auto_27665 ?auto_27669 ) ) ( not ( = ?auto_27665 ?auto_27670 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27669 ?auto_27670 ?auto_27668 ?auto_27667 )
      ( MAKE-3PILE ?auto_27665 ?auto_27666 ?auto_27667 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27671 - BLOCK
      ?auto_27672 - BLOCK
      ?auto_27673 - BLOCK
    )
    :vars
    (
      ?auto_27675 - BLOCK
      ?auto_27676 - BLOCK
      ?auto_27674 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27671 ?auto_27672 ) ) ( not ( = ?auto_27671 ?auto_27673 ) ) ( not ( = ?auto_27672 ?auto_27673 ) ) ( ON ?auto_27673 ?auto_27675 ) ( not ( = ?auto_27671 ?auto_27675 ) ) ( not ( = ?auto_27672 ?auto_27675 ) ) ( not ( = ?auto_27673 ?auto_27675 ) ) ( ON ?auto_27672 ?auto_27673 ) ( CLEAR ?auto_27672 ) ( ON-TABLE ?auto_27676 ) ( ON ?auto_27674 ?auto_27676 ) ( ON ?auto_27675 ?auto_27674 ) ( not ( = ?auto_27676 ?auto_27674 ) ) ( not ( = ?auto_27676 ?auto_27675 ) ) ( not ( = ?auto_27676 ?auto_27673 ) ) ( not ( = ?auto_27676 ?auto_27672 ) ) ( not ( = ?auto_27674 ?auto_27675 ) ) ( not ( = ?auto_27674 ?auto_27673 ) ) ( not ( = ?auto_27674 ?auto_27672 ) ) ( not ( = ?auto_27671 ?auto_27676 ) ) ( not ( = ?auto_27671 ?auto_27674 ) ) ( HOLDING ?auto_27671 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27671 )
      ( MAKE-3PILE ?auto_27671 ?auto_27672 ?auto_27673 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27677 - BLOCK
      ?auto_27678 - BLOCK
      ?auto_27679 - BLOCK
    )
    :vars
    (
      ?auto_27680 - BLOCK
      ?auto_27681 - BLOCK
      ?auto_27682 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27677 ?auto_27678 ) ) ( not ( = ?auto_27677 ?auto_27679 ) ) ( not ( = ?auto_27678 ?auto_27679 ) ) ( ON ?auto_27679 ?auto_27680 ) ( not ( = ?auto_27677 ?auto_27680 ) ) ( not ( = ?auto_27678 ?auto_27680 ) ) ( not ( = ?auto_27679 ?auto_27680 ) ) ( ON ?auto_27678 ?auto_27679 ) ( ON-TABLE ?auto_27681 ) ( ON ?auto_27682 ?auto_27681 ) ( ON ?auto_27680 ?auto_27682 ) ( not ( = ?auto_27681 ?auto_27682 ) ) ( not ( = ?auto_27681 ?auto_27680 ) ) ( not ( = ?auto_27681 ?auto_27679 ) ) ( not ( = ?auto_27681 ?auto_27678 ) ) ( not ( = ?auto_27682 ?auto_27680 ) ) ( not ( = ?auto_27682 ?auto_27679 ) ) ( not ( = ?auto_27682 ?auto_27678 ) ) ( not ( = ?auto_27677 ?auto_27681 ) ) ( not ( = ?auto_27677 ?auto_27682 ) ) ( ON ?auto_27677 ?auto_27678 ) ( CLEAR ?auto_27677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27681 ?auto_27682 ?auto_27680 ?auto_27679 ?auto_27678 )
      ( MAKE-3PILE ?auto_27677 ?auto_27678 ?auto_27679 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27685 - BLOCK
      ?auto_27686 - BLOCK
    )
    :vars
    (
      ?auto_27687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27687 ?auto_27686 ) ( CLEAR ?auto_27687 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27685 ) ( ON ?auto_27686 ?auto_27685 ) ( not ( = ?auto_27685 ?auto_27686 ) ) ( not ( = ?auto_27685 ?auto_27687 ) ) ( not ( = ?auto_27686 ?auto_27687 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27687 ?auto_27686 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27688 - BLOCK
      ?auto_27689 - BLOCK
    )
    :vars
    (
      ?auto_27690 - BLOCK
      ?auto_27691 - BLOCK
      ?auto_27692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27690 ?auto_27689 ) ( CLEAR ?auto_27690 ) ( ON-TABLE ?auto_27688 ) ( ON ?auto_27689 ?auto_27688 ) ( not ( = ?auto_27688 ?auto_27689 ) ) ( not ( = ?auto_27688 ?auto_27690 ) ) ( not ( = ?auto_27689 ?auto_27690 ) ) ( HOLDING ?auto_27691 ) ( CLEAR ?auto_27692 ) ( not ( = ?auto_27688 ?auto_27691 ) ) ( not ( = ?auto_27688 ?auto_27692 ) ) ( not ( = ?auto_27689 ?auto_27691 ) ) ( not ( = ?auto_27689 ?auto_27692 ) ) ( not ( = ?auto_27690 ?auto_27691 ) ) ( not ( = ?auto_27690 ?auto_27692 ) ) ( not ( = ?auto_27691 ?auto_27692 ) ) )
    :subtasks
    ( ( !STACK ?auto_27691 ?auto_27692 )
      ( MAKE-2PILE ?auto_27688 ?auto_27689 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27693 - BLOCK
      ?auto_27694 - BLOCK
    )
    :vars
    (
      ?auto_27697 - BLOCK
      ?auto_27695 - BLOCK
      ?auto_27696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27697 ?auto_27694 ) ( ON-TABLE ?auto_27693 ) ( ON ?auto_27694 ?auto_27693 ) ( not ( = ?auto_27693 ?auto_27694 ) ) ( not ( = ?auto_27693 ?auto_27697 ) ) ( not ( = ?auto_27694 ?auto_27697 ) ) ( CLEAR ?auto_27695 ) ( not ( = ?auto_27693 ?auto_27696 ) ) ( not ( = ?auto_27693 ?auto_27695 ) ) ( not ( = ?auto_27694 ?auto_27696 ) ) ( not ( = ?auto_27694 ?auto_27695 ) ) ( not ( = ?auto_27697 ?auto_27696 ) ) ( not ( = ?auto_27697 ?auto_27695 ) ) ( not ( = ?auto_27696 ?auto_27695 ) ) ( ON ?auto_27696 ?auto_27697 ) ( CLEAR ?auto_27696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27693 ?auto_27694 ?auto_27697 )
      ( MAKE-2PILE ?auto_27693 ?auto_27694 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27698 - BLOCK
      ?auto_27699 - BLOCK
    )
    :vars
    (
      ?auto_27700 - BLOCK
      ?auto_27701 - BLOCK
      ?auto_27702 - BLOCK
      ?auto_27703 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27700 ?auto_27699 ) ( ON-TABLE ?auto_27698 ) ( ON ?auto_27699 ?auto_27698 ) ( not ( = ?auto_27698 ?auto_27699 ) ) ( not ( = ?auto_27698 ?auto_27700 ) ) ( not ( = ?auto_27699 ?auto_27700 ) ) ( not ( = ?auto_27698 ?auto_27701 ) ) ( not ( = ?auto_27698 ?auto_27702 ) ) ( not ( = ?auto_27699 ?auto_27701 ) ) ( not ( = ?auto_27699 ?auto_27702 ) ) ( not ( = ?auto_27700 ?auto_27701 ) ) ( not ( = ?auto_27700 ?auto_27702 ) ) ( not ( = ?auto_27701 ?auto_27702 ) ) ( ON ?auto_27701 ?auto_27700 ) ( CLEAR ?auto_27701 ) ( HOLDING ?auto_27702 ) ( CLEAR ?auto_27703 ) ( ON-TABLE ?auto_27703 ) ( not ( = ?auto_27703 ?auto_27702 ) ) ( not ( = ?auto_27698 ?auto_27703 ) ) ( not ( = ?auto_27699 ?auto_27703 ) ) ( not ( = ?auto_27700 ?auto_27703 ) ) ( not ( = ?auto_27701 ?auto_27703 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27703 ?auto_27702 )
      ( MAKE-2PILE ?auto_27698 ?auto_27699 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27704 - BLOCK
      ?auto_27705 - BLOCK
    )
    :vars
    (
      ?auto_27706 - BLOCK
      ?auto_27708 - BLOCK
      ?auto_27707 - BLOCK
      ?auto_27709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27706 ?auto_27705 ) ( ON-TABLE ?auto_27704 ) ( ON ?auto_27705 ?auto_27704 ) ( not ( = ?auto_27704 ?auto_27705 ) ) ( not ( = ?auto_27704 ?auto_27706 ) ) ( not ( = ?auto_27705 ?auto_27706 ) ) ( not ( = ?auto_27704 ?auto_27708 ) ) ( not ( = ?auto_27704 ?auto_27707 ) ) ( not ( = ?auto_27705 ?auto_27708 ) ) ( not ( = ?auto_27705 ?auto_27707 ) ) ( not ( = ?auto_27706 ?auto_27708 ) ) ( not ( = ?auto_27706 ?auto_27707 ) ) ( not ( = ?auto_27708 ?auto_27707 ) ) ( ON ?auto_27708 ?auto_27706 ) ( CLEAR ?auto_27709 ) ( ON-TABLE ?auto_27709 ) ( not ( = ?auto_27709 ?auto_27707 ) ) ( not ( = ?auto_27704 ?auto_27709 ) ) ( not ( = ?auto_27705 ?auto_27709 ) ) ( not ( = ?auto_27706 ?auto_27709 ) ) ( not ( = ?auto_27708 ?auto_27709 ) ) ( ON ?auto_27707 ?auto_27708 ) ( CLEAR ?auto_27707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27704 ?auto_27705 ?auto_27706 ?auto_27708 )
      ( MAKE-2PILE ?auto_27704 ?auto_27705 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27710 - BLOCK
      ?auto_27711 - BLOCK
    )
    :vars
    (
      ?auto_27715 - BLOCK
      ?auto_27713 - BLOCK
      ?auto_27712 - BLOCK
      ?auto_27714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27715 ?auto_27711 ) ( ON-TABLE ?auto_27710 ) ( ON ?auto_27711 ?auto_27710 ) ( not ( = ?auto_27710 ?auto_27711 ) ) ( not ( = ?auto_27710 ?auto_27715 ) ) ( not ( = ?auto_27711 ?auto_27715 ) ) ( not ( = ?auto_27710 ?auto_27713 ) ) ( not ( = ?auto_27710 ?auto_27712 ) ) ( not ( = ?auto_27711 ?auto_27713 ) ) ( not ( = ?auto_27711 ?auto_27712 ) ) ( not ( = ?auto_27715 ?auto_27713 ) ) ( not ( = ?auto_27715 ?auto_27712 ) ) ( not ( = ?auto_27713 ?auto_27712 ) ) ( ON ?auto_27713 ?auto_27715 ) ( not ( = ?auto_27714 ?auto_27712 ) ) ( not ( = ?auto_27710 ?auto_27714 ) ) ( not ( = ?auto_27711 ?auto_27714 ) ) ( not ( = ?auto_27715 ?auto_27714 ) ) ( not ( = ?auto_27713 ?auto_27714 ) ) ( ON ?auto_27712 ?auto_27713 ) ( CLEAR ?auto_27712 ) ( HOLDING ?auto_27714 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27714 )
      ( MAKE-2PILE ?auto_27710 ?auto_27711 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27716 - BLOCK
      ?auto_27717 - BLOCK
    )
    :vars
    (
      ?auto_27720 - BLOCK
      ?auto_27719 - BLOCK
      ?auto_27721 - BLOCK
      ?auto_27718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27720 ?auto_27717 ) ( ON-TABLE ?auto_27716 ) ( ON ?auto_27717 ?auto_27716 ) ( not ( = ?auto_27716 ?auto_27717 ) ) ( not ( = ?auto_27716 ?auto_27720 ) ) ( not ( = ?auto_27717 ?auto_27720 ) ) ( not ( = ?auto_27716 ?auto_27719 ) ) ( not ( = ?auto_27716 ?auto_27721 ) ) ( not ( = ?auto_27717 ?auto_27719 ) ) ( not ( = ?auto_27717 ?auto_27721 ) ) ( not ( = ?auto_27720 ?auto_27719 ) ) ( not ( = ?auto_27720 ?auto_27721 ) ) ( not ( = ?auto_27719 ?auto_27721 ) ) ( ON ?auto_27719 ?auto_27720 ) ( not ( = ?auto_27718 ?auto_27721 ) ) ( not ( = ?auto_27716 ?auto_27718 ) ) ( not ( = ?auto_27717 ?auto_27718 ) ) ( not ( = ?auto_27720 ?auto_27718 ) ) ( not ( = ?auto_27719 ?auto_27718 ) ) ( ON ?auto_27721 ?auto_27719 ) ( ON ?auto_27718 ?auto_27721 ) ( CLEAR ?auto_27718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27716 ?auto_27717 ?auto_27720 ?auto_27719 ?auto_27721 )
      ( MAKE-2PILE ?auto_27716 ?auto_27717 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27726 - BLOCK
      ?auto_27727 - BLOCK
      ?auto_27728 - BLOCK
      ?auto_27729 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_27729 ) ( CLEAR ?auto_27728 ) ( ON-TABLE ?auto_27726 ) ( ON ?auto_27727 ?auto_27726 ) ( ON ?auto_27728 ?auto_27727 ) ( not ( = ?auto_27726 ?auto_27727 ) ) ( not ( = ?auto_27726 ?auto_27728 ) ) ( not ( = ?auto_27726 ?auto_27729 ) ) ( not ( = ?auto_27727 ?auto_27728 ) ) ( not ( = ?auto_27727 ?auto_27729 ) ) ( not ( = ?auto_27728 ?auto_27729 ) ) )
    :subtasks
    ( ( !STACK ?auto_27729 ?auto_27728 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27730 - BLOCK
      ?auto_27731 - BLOCK
      ?auto_27732 - BLOCK
      ?auto_27733 - BLOCK
    )
    :vars
    (
      ?auto_27734 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_27732 ) ( ON-TABLE ?auto_27730 ) ( ON ?auto_27731 ?auto_27730 ) ( ON ?auto_27732 ?auto_27731 ) ( not ( = ?auto_27730 ?auto_27731 ) ) ( not ( = ?auto_27730 ?auto_27732 ) ) ( not ( = ?auto_27730 ?auto_27733 ) ) ( not ( = ?auto_27731 ?auto_27732 ) ) ( not ( = ?auto_27731 ?auto_27733 ) ) ( not ( = ?auto_27732 ?auto_27733 ) ) ( ON ?auto_27733 ?auto_27734 ) ( CLEAR ?auto_27733 ) ( HAND-EMPTY ) ( not ( = ?auto_27730 ?auto_27734 ) ) ( not ( = ?auto_27731 ?auto_27734 ) ) ( not ( = ?auto_27732 ?auto_27734 ) ) ( not ( = ?auto_27733 ?auto_27734 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27733 ?auto_27734 )
      ( MAKE-4PILE ?auto_27730 ?auto_27731 ?auto_27732 ?auto_27733 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27735 - BLOCK
      ?auto_27736 - BLOCK
      ?auto_27737 - BLOCK
      ?auto_27738 - BLOCK
    )
    :vars
    (
      ?auto_27739 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27735 ) ( ON ?auto_27736 ?auto_27735 ) ( not ( = ?auto_27735 ?auto_27736 ) ) ( not ( = ?auto_27735 ?auto_27737 ) ) ( not ( = ?auto_27735 ?auto_27738 ) ) ( not ( = ?auto_27736 ?auto_27737 ) ) ( not ( = ?auto_27736 ?auto_27738 ) ) ( not ( = ?auto_27737 ?auto_27738 ) ) ( ON ?auto_27738 ?auto_27739 ) ( CLEAR ?auto_27738 ) ( not ( = ?auto_27735 ?auto_27739 ) ) ( not ( = ?auto_27736 ?auto_27739 ) ) ( not ( = ?auto_27737 ?auto_27739 ) ) ( not ( = ?auto_27738 ?auto_27739 ) ) ( HOLDING ?auto_27737 ) ( CLEAR ?auto_27736 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27735 ?auto_27736 ?auto_27737 )
      ( MAKE-4PILE ?auto_27735 ?auto_27736 ?auto_27737 ?auto_27738 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27740 - BLOCK
      ?auto_27741 - BLOCK
      ?auto_27742 - BLOCK
      ?auto_27743 - BLOCK
    )
    :vars
    (
      ?auto_27744 - BLOCK
      ?auto_27745 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27740 ) ( ON ?auto_27741 ?auto_27740 ) ( not ( = ?auto_27740 ?auto_27741 ) ) ( not ( = ?auto_27740 ?auto_27742 ) ) ( not ( = ?auto_27740 ?auto_27743 ) ) ( not ( = ?auto_27741 ?auto_27742 ) ) ( not ( = ?auto_27741 ?auto_27743 ) ) ( not ( = ?auto_27742 ?auto_27743 ) ) ( ON ?auto_27743 ?auto_27744 ) ( not ( = ?auto_27740 ?auto_27744 ) ) ( not ( = ?auto_27741 ?auto_27744 ) ) ( not ( = ?auto_27742 ?auto_27744 ) ) ( not ( = ?auto_27743 ?auto_27744 ) ) ( CLEAR ?auto_27741 ) ( ON ?auto_27742 ?auto_27743 ) ( CLEAR ?auto_27742 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27745 ) ( ON ?auto_27744 ?auto_27745 ) ( not ( = ?auto_27745 ?auto_27744 ) ) ( not ( = ?auto_27745 ?auto_27743 ) ) ( not ( = ?auto_27745 ?auto_27742 ) ) ( not ( = ?auto_27740 ?auto_27745 ) ) ( not ( = ?auto_27741 ?auto_27745 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27745 ?auto_27744 ?auto_27743 )
      ( MAKE-4PILE ?auto_27740 ?auto_27741 ?auto_27742 ?auto_27743 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27746 - BLOCK
      ?auto_27747 - BLOCK
      ?auto_27748 - BLOCK
      ?auto_27749 - BLOCK
    )
    :vars
    (
      ?auto_27750 - BLOCK
      ?auto_27751 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27746 ) ( not ( = ?auto_27746 ?auto_27747 ) ) ( not ( = ?auto_27746 ?auto_27748 ) ) ( not ( = ?auto_27746 ?auto_27749 ) ) ( not ( = ?auto_27747 ?auto_27748 ) ) ( not ( = ?auto_27747 ?auto_27749 ) ) ( not ( = ?auto_27748 ?auto_27749 ) ) ( ON ?auto_27749 ?auto_27750 ) ( not ( = ?auto_27746 ?auto_27750 ) ) ( not ( = ?auto_27747 ?auto_27750 ) ) ( not ( = ?auto_27748 ?auto_27750 ) ) ( not ( = ?auto_27749 ?auto_27750 ) ) ( ON ?auto_27748 ?auto_27749 ) ( CLEAR ?auto_27748 ) ( ON-TABLE ?auto_27751 ) ( ON ?auto_27750 ?auto_27751 ) ( not ( = ?auto_27751 ?auto_27750 ) ) ( not ( = ?auto_27751 ?auto_27749 ) ) ( not ( = ?auto_27751 ?auto_27748 ) ) ( not ( = ?auto_27746 ?auto_27751 ) ) ( not ( = ?auto_27747 ?auto_27751 ) ) ( HOLDING ?auto_27747 ) ( CLEAR ?auto_27746 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27746 ?auto_27747 )
      ( MAKE-4PILE ?auto_27746 ?auto_27747 ?auto_27748 ?auto_27749 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27752 - BLOCK
      ?auto_27753 - BLOCK
      ?auto_27754 - BLOCK
      ?auto_27755 - BLOCK
    )
    :vars
    (
      ?auto_27757 - BLOCK
      ?auto_27756 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27752 ) ( not ( = ?auto_27752 ?auto_27753 ) ) ( not ( = ?auto_27752 ?auto_27754 ) ) ( not ( = ?auto_27752 ?auto_27755 ) ) ( not ( = ?auto_27753 ?auto_27754 ) ) ( not ( = ?auto_27753 ?auto_27755 ) ) ( not ( = ?auto_27754 ?auto_27755 ) ) ( ON ?auto_27755 ?auto_27757 ) ( not ( = ?auto_27752 ?auto_27757 ) ) ( not ( = ?auto_27753 ?auto_27757 ) ) ( not ( = ?auto_27754 ?auto_27757 ) ) ( not ( = ?auto_27755 ?auto_27757 ) ) ( ON ?auto_27754 ?auto_27755 ) ( ON-TABLE ?auto_27756 ) ( ON ?auto_27757 ?auto_27756 ) ( not ( = ?auto_27756 ?auto_27757 ) ) ( not ( = ?auto_27756 ?auto_27755 ) ) ( not ( = ?auto_27756 ?auto_27754 ) ) ( not ( = ?auto_27752 ?auto_27756 ) ) ( not ( = ?auto_27753 ?auto_27756 ) ) ( CLEAR ?auto_27752 ) ( ON ?auto_27753 ?auto_27754 ) ( CLEAR ?auto_27753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27756 ?auto_27757 ?auto_27755 ?auto_27754 )
      ( MAKE-4PILE ?auto_27752 ?auto_27753 ?auto_27754 ?auto_27755 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27758 - BLOCK
      ?auto_27759 - BLOCK
      ?auto_27760 - BLOCK
      ?auto_27761 - BLOCK
    )
    :vars
    (
      ?auto_27762 - BLOCK
      ?auto_27763 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27758 ?auto_27759 ) ) ( not ( = ?auto_27758 ?auto_27760 ) ) ( not ( = ?auto_27758 ?auto_27761 ) ) ( not ( = ?auto_27759 ?auto_27760 ) ) ( not ( = ?auto_27759 ?auto_27761 ) ) ( not ( = ?auto_27760 ?auto_27761 ) ) ( ON ?auto_27761 ?auto_27762 ) ( not ( = ?auto_27758 ?auto_27762 ) ) ( not ( = ?auto_27759 ?auto_27762 ) ) ( not ( = ?auto_27760 ?auto_27762 ) ) ( not ( = ?auto_27761 ?auto_27762 ) ) ( ON ?auto_27760 ?auto_27761 ) ( ON-TABLE ?auto_27763 ) ( ON ?auto_27762 ?auto_27763 ) ( not ( = ?auto_27763 ?auto_27762 ) ) ( not ( = ?auto_27763 ?auto_27761 ) ) ( not ( = ?auto_27763 ?auto_27760 ) ) ( not ( = ?auto_27758 ?auto_27763 ) ) ( not ( = ?auto_27759 ?auto_27763 ) ) ( ON ?auto_27759 ?auto_27760 ) ( CLEAR ?auto_27759 ) ( HOLDING ?auto_27758 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27758 )
      ( MAKE-4PILE ?auto_27758 ?auto_27759 ?auto_27760 ?auto_27761 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27764 - BLOCK
      ?auto_27765 - BLOCK
      ?auto_27766 - BLOCK
      ?auto_27767 - BLOCK
    )
    :vars
    (
      ?auto_27769 - BLOCK
      ?auto_27768 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27764 ?auto_27765 ) ) ( not ( = ?auto_27764 ?auto_27766 ) ) ( not ( = ?auto_27764 ?auto_27767 ) ) ( not ( = ?auto_27765 ?auto_27766 ) ) ( not ( = ?auto_27765 ?auto_27767 ) ) ( not ( = ?auto_27766 ?auto_27767 ) ) ( ON ?auto_27767 ?auto_27769 ) ( not ( = ?auto_27764 ?auto_27769 ) ) ( not ( = ?auto_27765 ?auto_27769 ) ) ( not ( = ?auto_27766 ?auto_27769 ) ) ( not ( = ?auto_27767 ?auto_27769 ) ) ( ON ?auto_27766 ?auto_27767 ) ( ON-TABLE ?auto_27768 ) ( ON ?auto_27769 ?auto_27768 ) ( not ( = ?auto_27768 ?auto_27769 ) ) ( not ( = ?auto_27768 ?auto_27767 ) ) ( not ( = ?auto_27768 ?auto_27766 ) ) ( not ( = ?auto_27764 ?auto_27768 ) ) ( not ( = ?auto_27765 ?auto_27768 ) ) ( ON ?auto_27765 ?auto_27766 ) ( ON ?auto_27764 ?auto_27765 ) ( CLEAR ?auto_27764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27768 ?auto_27769 ?auto_27767 ?auto_27766 ?auto_27765 )
      ( MAKE-4PILE ?auto_27764 ?auto_27765 ?auto_27766 ?auto_27767 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27771 - BLOCK
    )
    :vars
    (
      ?auto_27772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27772 ?auto_27771 ) ( CLEAR ?auto_27772 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27771 ) ( not ( = ?auto_27771 ?auto_27772 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27772 ?auto_27771 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27773 - BLOCK
    )
    :vars
    (
      ?auto_27774 - BLOCK
      ?auto_27775 - BLOCK
      ?auto_27776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27774 ?auto_27773 ) ( CLEAR ?auto_27774 ) ( ON-TABLE ?auto_27773 ) ( not ( = ?auto_27773 ?auto_27774 ) ) ( HOLDING ?auto_27775 ) ( CLEAR ?auto_27776 ) ( not ( = ?auto_27773 ?auto_27775 ) ) ( not ( = ?auto_27773 ?auto_27776 ) ) ( not ( = ?auto_27774 ?auto_27775 ) ) ( not ( = ?auto_27774 ?auto_27776 ) ) ( not ( = ?auto_27775 ?auto_27776 ) ) )
    :subtasks
    ( ( !STACK ?auto_27775 ?auto_27776 )
      ( MAKE-1PILE ?auto_27773 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27777 - BLOCK
    )
    :vars
    (
      ?auto_27778 - BLOCK
      ?auto_27780 - BLOCK
      ?auto_27779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27778 ?auto_27777 ) ( ON-TABLE ?auto_27777 ) ( not ( = ?auto_27777 ?auto_27778 ) ) ( CLEAR ?auto_27780 ) ( not ( = ?auto_27777 ?auto_27779 ) ) ( not ( = ?auto_27777 ?auto_27780 ) ) ( not ( = ?auto_27778 ?auto_27779 ) ) ( not ( = ?auto_27778 ?auto_27780 ) ) ( not ( = ?auto_27779 ?auto_27780 ) ) ( ON ?auto_27779 ?auto_27778 ) ( CLEAR ?auto_27779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27777 ?auto_27778 )
      ( MAKE-1PILE ?auto_27777 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27781 - BLOCK
    )
    :vars
    (
      ?auto_27784 - BLOCK
      ?auto_27783 - BLOCK
      ?auto_27782 - BLOCK
      ?auto_27785 - BLOCK
      ?auto_27786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27784 ?auto_27781 ) ( ON-TABLE ?auto_27781 ) ( not ( = ?auto_27781 ?auto_27784 ) ) ( not ( = ?auto_27781 ?auto_27783 ) ) ( not ( = ?auto_27781 ?auto_27782 ) ) ( not ( = ?auto_27784 ?auto_27783 ) ) ( not ( = ?auto_27784 ?auto_27782 ) ) ( not ( = ?auto_27783 ?auto_27782 ) ) ( ON ?auto_27783 ?auto_27784 ) ( CLEAR ?auto_27783 ) ( HOLDING ?auto_27782 ) ( CLEAR ?auto_27785 ) ( ON-TABLE ?auto_27786 ) ( ON ?auto_27785 ?auto_27786 ) ( not ( = ?auto_27786 ?auto_27785 ) ) ( not ( = ?auto_27786 ?auto_27782 ) ) ( not ( = ?auto_27785 ?auto_27782 ) ) ( not ( = ?auto_27781 ?auto_27785 ) ) ( not ( = ?auto_27781 ?auto_27786 ) ) ( not ( = ?auto_27784 ?auto_27785 ) ) ( not ( = ?auto_27784 ?auto_27786 ) ) ( not ( = ?auto_27783 ?auto_27785 ) ) ( not ( = ?auto_27783 ?auto_27786 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27786 ?auto_27785 ?auto_27782 )
      ( MAKE-1PILE ?auto_27781 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27787 - BLOCK
    )
    :vars
    (
      ?auto_27788 - BLOCK
      ?auto_27792 - BLOCK
      ?auto_27789 - BLOCK
      ?auto_27791 - BLOCK
      ?auto_27790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27788 ?auto_27787 ) ( ON-TABLE ?auto_27787 ) ( not ( = ?auto_27787 ?auto_27788 ) ) ( not ( = ?auto_27787 ?auto_27792 ) ) ( not ( = ?auto_27787 ?auto_27789 ) ) ( not ( = ?auto_27788 ?auto_27792 ) ) ( not ( = ?auto_27788 ?auto_27789 ) ) ( not ( = ?auto_27792 ?auto_27789 ) ) ( ON ?auto_27792 ?auto_27788 ) ( CLEAR ?auto_27791 ) ( ON-TABLE ?auto_27790 ) ( ON ?auto_27791 ?auto_27790 ) ( not ( = ?auto_27790 ?auto_27791 ) ) ( not ( = ?auto_27790 ?auto_27789 ) ) ( not ( = ?auto_27791 ?auto_27789 ) ) ( not ( = ?auto_27787 ?auto_27791 ) ) ( not ( = ?auto_27787 ?auto_27790 ) ) ( not ( = ?auto_27788 ?auto_27791 ) ) ( not ( = ?auto_27788 ?auto_27790 ) ) ( not ( = ?auto_27792 ?auto_27791 ) ) ( not ( = ?auto_27792 ?auto_27790 ) ) ( ON ?auto_27789 ?auto_27792 ) ( CLEAR ?auto_27789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27787 ?auto_27788 ?auto_27792 )
      ( MAKE-1PILE ?auto_27787 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27793 - BLOCK
    )
    :vars
    (
      ?auto_27798 - BLOCK
      ?auto_27797 - BLOCK
      ?auto_27795 - BLOCK
      ?auto_27794 - BLOCK
      ?auto_27796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27798 ?auto_27793 ) ( ON-TABLE ?auto_27793 ) ( not ( = ?auto_27793 ?auto_27798 ) ) ( not ( = ?auto_27793 ?auto_27797 ) ) ( not ( = ?auto_27793 ?auto_27795 ) ) ( not ( = ?auto_27798 ?auto_27797 ) ) ( not ( = ?auto_27798 ?auto_27795 ) ) ( not ( = ?auto_27797 ?auto_27795 ) ) ( ON ?auto_27797 ?auto_27798 ) ( ON-TABLE ?auto_27794 ) ( not ( = ?auto_27794 ?auto_27796 ) ) ( not ( = ?auto_27794 ?auto_27795 ) ) ( not ( = ?auto_27796 ?auto_27795 ) ) ( not ( = ?auto_27793 ?auto_27796 ) ) ( not ( = ?auto_27793 ?auto_27794 ) ) ( not ( = ?auto_27798 ?auto_27796 ) ) ( not ( = ?auto_27798 ?auto_27794 ) ) ( not ( = ?auto_27797 ?auto_27796 ) ) ( not ( = ?auto_27797 ?auto_27794 ) ) ( ON ?auto_27795 ?auto_27797 ) ( CLEAR ?auto_27795 ) ( HOLDING ?auto_27796 ) ( CLEAR ?auto_27794 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27794 ?auto_27796 )
      ( MAKE-1PILE ?auto_27793 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27799 - BLOCK
    )
    :vars
    (
      ?auto_27801 - BLOCK
      ?auto_27804 - BLOCK
      ?auto_27800 - BLOCK
      ?auto_27803 - BLOCK
      ?auto_27802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27801 ?auto_27799 ) ( ON-TABLE ?auto_27799 ) ( not ( = ?auto_27799 ?auto_27801 ) ) ( not ( = ?auto_27799 ?auto_27804 ) ) ( not ( = ?auto_27799 ?auto_27800 ) ) ( not ( = ?auto_27801 ?auto_27804 ) ) ( not ( = ?auto_27801 ?auto_27800 ) ) ( not ( = ?auto_27804 ?auto_27800 ) ) ( ON ?auto_27804 ?auto_27801 ) ( ON-TABLE ?auto_27803 ) ( not ( = ?auto_27803 ?auto_27802 ) ) ( not ( = ?auto_27803 ?auto_27800 ) ) ( not ( = ?auto_27802 ?auto_27800 ) ) ( not ( = ?auto_27799 ?auto_27802 ) ) ( not ( = ?auto_27799 ?auto_27803 ) ) ( not ( = ?auto_27801 ?auto_27802 ) ) ( not ( = ?auto_27801 ?auto_27803 ) ) ( not ( = ?auto_27804 ?auto_27802 ) ) ( not ( = ?auto_27804 ?auto_27803 ) ) ( ON ?auto_27800 ?auto_27804 ) ( CLEAR ?auto_27803 ) ( ON ?auto_27802 ?auto_27800 ) ( CLEAR ?auto_27802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27799 ?auto_27801 ?auto_27804 ?auto_27800 )
      ( MAKE-1PILE ?auto_27799 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27805 - BLOCK
    )
    :vars
    (
      ?auto_27807 - BLOCK
      ?auto_27809 - BLOCK
      ?auto_27806 - BLOCK
      ?auto_27810 - BLOCK
      ?auto_27808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27807 ?auto_27805 ) ( ON-TABLE ?auto_27805 ) ( not ( = ?auto_27805 ?auto_27807 ) ) ( not ( = ?auto_27805 ?auto_27809 ) ) ( not ( = ?auto_27805 ?auto_27806 ) ) ( not ( = ?auto_27807 ?auto_27809 ) ) ( not ( = ?auto_27807 ?auto_27806 ) ) ( not ( = ?auto_27809 ?auto_27806 ) ) ( ON ?auto_27809 ?auto_27807 ) ( not ( = ?auto_27810 ?auto_27808 ) ) ( not ( = ?auto_27810 ?auto_27806 ) ) ( not ( = ?auto_27808 ?auto_27806 ) ) ( not ( = ?auto_27805 ?auto_27808 ) ) ( not ( = ?auto_27805 ?auto_27810 ) ) ( not ( = ?auto_27807 ?auto_27808 ) ) ( not ( = ?auto_27807 ?auto_27810 ) ) ( not ( = ?auto_27809 ?auto_27808 ) ) ( not ( = ?auto_27809 ?auto_27810 ) ) ( ON ?auto_27806 ?auto_27809 ) ( ON ?auto_27808 ?auto_27806 ) ( CLEAR ?auto_27808 ) ( HOLDING ?auto_27810 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27810 )
      ( MAKE-1PILE ?auto_27805 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27811 - BLOCK
    )
    :vars
    (
      ?auto_27816 - BLOCK
      ?auto_27813 - BLOCK
      ?auto_27812 - BLOCK
      ?auto_27814 - BLOCK
      ?auto_27815 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27816 ?auto_27811 ) ( ON-TABLE ?auto_27811 ) ( not ( = ?auto_27811 ?auto_27816 ) ) ( not ( = ?auto_27811 ?auto_27813 ) ) ( not ( = ?auto_27811 ?auto_27812 ) ) ( not ( = ?auto_27816 ?auto_27813 ) ) ( not ( = ?auto_27816 ?auto_27812 ) ) ( not ( = ?auto_27813 ?auto_27812 ) ) ( ON ?auto_27813 ?auto_27816 ) ( not ( = ?auto_27814 ?auto_27815 ) ) ( not ( = ?auto_27814 ?auto_27812 ) ) ( not ( = ?auto_27815 ?auto_27812 ) ) ( not ( = ?auto_27811 ?auto_27815 ) ) ( not ( = ?auto_27811 ?auto_27814 ) ) ( not ( = ?auto_27816 ?auto_27815 ) ) ( not ( = ?auto_27816 ?auto_27814 ) ) ( not ( = ?auto_27813 ?auto_27815 ) ) ( not ( = ?auto_27813 ?auto_27814 ) ) ( ON ?auto_27812 ?auto_27813 ) ( ON ?auto_27815 ?auto_27812 ) ( ON ?auto_27814 ?auto_27815 ) ( CLEAR ?auto_27814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27811 ?auto_27816 ?auto_27813 ?auto_27812 ?auto_27815 )
      ( MAKE-1PILE ?auto_27811 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27822 - BLOCK
      ?auto_27823 - BLOCK
      ?auto_27824 - BLOCK
      ?auto_27825 - BLOCK
      ?auto_27826 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_27826 ) ( CLEAR ?auto_27825 ) ( ON-TABLE ?auto_27822 ) ( ON ?auto_27823 ?auto_27822 ) ( ON ?auto_27824 ?auto_27823 ) ( ON ?auto_27825 ?auto_27824 ) ( not ( = ?auto_27822 ?auto_27823 ) ) ( not ( = ?auto_27822 ?auto_27824 ) ) ( not ( = ?auto_27822 ?auto_27825 ) ) ( not ( = ?auto_27822 ?auto_27826 ) ) ( not ( = ?auto_27823 ?auto_27824 ) ) ( not ( = ?auto_27823 ?auto_27825 ) ) ( not ( = ?auto_27823 ?auto_27826 ) ) ( not ( = ?auto_27824 ?auto_27825 ) ) ( not ( = ?auto_27824 ?auto_27826 ) ) ( not ( = ?auto_27825 ?auto_27826 ) ) )
    :subtasks
    ( ( !STACK ?auto_27826 ?auto_27825 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27827 - BLOCK
      ?auto_27828 - BLOCK
      ?auto_27829 - BLOCK
      ?auto_27830 - BLOCK
      ?auto_27831 - BLOCK
    )
    :vars
    (
      ?auto_27832 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_27830 ) ( ON-TABLE ?auto_27827 ) ( ON ?auto_27828 ?auto_27827 ) ( ON ?auto_27829 ?auto_27828 ) ( ON ?auto_27830 ?auto_27829 ) ( not ( = ?auto_27827 ?auto_27828 ) ) ( not ( = ?auto_27827 ?auto_27829 ) ) ( not ( = ?auto_27827 ?auto_27830 ) ) ( not ( = ?auto_27827 ?auto_27831 ) ) ( not ( = ?auto_27828 ?auto_27829 ) ) ( not ( = ?auto_27828 ?auto_27830 ) ) ( not ( = ?auto_27828 ?auto_27831 ) ) ( not ( = ?auto_27829 ?auto_27830 ) ) ( not ( = ?auto_27829 ?auto_27831 ) ) ( not ( = ?auto_27830 ?auto_27831 ) ) ( ON ?auto_27831 ?auto_27832 ) ( CLEAR ?auto_27831 ) ( HAND-EMPTY ) ( not ( = ?auto_27827 ?auto_27832 ) ) ( not ( = ?auto_27828 ?auto_27832 ) ) ( not ( = ?auto_27829 ?auto_27832 ) ) ( not ( = ?auto_27830 ?auto_27832 ) ) ( not ( = ?auto_27831 ?auto_27832 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27831 ?auto_27832 )
      ( MAKE-5PILE ?auto_27827 ?auto_27828 ?auto_27829 ?auto_27830 ?auto_27831 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27833 - BLOCK
      ?auto_27834 - BLOCK
      ?auto_27835 - BLOCK
      ?auto_27836 - BLOCK
      ?auto_27837 - BLOCK
    )
    :vars
    (
      ?auto_27838 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27833 ) ( ON ?auto_27834 ?auto_27833 ) ( ON ?auto_27835 ?auto_27834 ) ( not ( = ?auto_27833 ?auto_27834 ) ) ( not ( = ?auto_27833 ?auto_27835 ) ) ( not ( = ?auto_27833 ?auto_27836 ) ) ( not ( = ?auto_27833 ?auto_27837 ) ) ( not ( = ?auto_27834 ?auto_27835 ) ) ( not ( = ?auto_27834 ?auto_27836 ) ) ( not ( = ?auto_27834 ?auto_27837 ) ) ( not ( = ?auto_27835 ?auto_27836 ) ) ( not ( = ?auto_27835 ?auto_27837 ) ) ( not ( = ?auto_27836 ?auto_27837 ) ) ( ON ?auto_27837 ?auto_27838 ) ( CLEAR ?auto_27837 ) ( not ( = ?auto_27833 ?auto_27838 ) ) ( not ( = ?auto_27834 ?auto_27838 ) ) ( not ( = ?auto_27835 ?auto_27838 ) ) ( not ( = ?auto_27836 ?auto_27838 ) ) ( not ( = ?auto_27837 ?auto_27838 ) ) ( HOLDING ?auto_27836 ) ( CLEAR ?auto_27835 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27833 ?auto_27834 ?auto_27835 ?auto_27836 )
      ( MAKE-5PILE ?auto_27833 ?auto_27834 ?auto_27835 ?auto_27836 ?auto_27837 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27839 - BLOCK
      ?auto_27840 - BLOCK
      ?auto_27841 - BLOCK
      ?auto_27842 - BLOCK
      ?auto_27843 - BLOCK
    )
    :vars
    (
      ?auto_27844 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27839 ) ( ON ?auto_27840 ?auto_27839 ) ( ON ?auto_27841 ?auto_27840 ) ( not ( = ?auto_27839 ?auto_27840 ) ) ( not ( = ?auto_27839 ?auto_27841 ) ) ( not ( = ?auto_27839 ?auto_27842 ) ) ( not ( = ?auto_27839 ?auto_27843 ) ) ( not ( = ?auto_27840 ?auto_27841 ) ) ( not ( = ?auto_27840 ?auto_27842 ) ) ( not ( = ?auto_27840 ?auto_27843 ) ) ( not ( = ?auto_27841 ?auto_27842 ) ) ( not ( = ?auto_27841 ?auto_27843 ) ) ( not ( = ?auto_27842 ?auto_27843 ) ) ( ON ?auto_27843 ?auto_27844 ) ( not ( = ?auto_27839 ?auto_27844 ) ) ( not ( = ?auto_27840 ?auto_27844 ) ) ( not ( = ?auto_27841 ?auto_27844 ) ) ( not ( = ?auto_27842 ?auto_27844 ) ) ( not ( = ?auto_27843 ?auto_27844 ) ) ( CLEAR ?auto_27841 ) ( ON ?auto_27842 ?auto_27843 ) ( CLEAR ?auto_27842 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27844 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27844 ?auto_27843 )
      ( MAKE-5PILE ?auto_27839 ?auto_27840 ?auto_27841 ?auto_27842 ?auto_27843 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27845 - BLOCK
      ?auto_27846 - BLOCK
      ?auto_27847 - BLOCK
      ?auto_27848 - BLOCK
      ?auto_27849 - BLOCK
    )
    :vars
    (
      ?auto_27850 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27845 ) ( ON ?auto_27846 ?auto_27845 ) ( not ( = ?auto_27845 ?auto_27846 ) ) ( not ( = ?auto_27845 ?auto_27847 ) ) ( not ( = ?auto_27845 ?auto_27848 ) ) ( not ( = ?auto_27845 ?auto_27849 ) ) ( not ( = ?auto_27846 ?auto_27847 ) ) ( not ( = ?auto_27846 ?auto_27848 ) ) ( not ( = ?auto_27846 ?auto_27849 ) ) ( not ( = ?auto_27847 ?auto_27848 ) ) ( not ( = ?auto_27847 ?auto_27849 ) ) ( not ( = ?auto_27848 ?auto_27849 ) ) ( ON ?auto_27849 ?auto_27850 ) ( not ( = ?auto_27845 ?auto_27850 ) ) ( not ( = ?auto_27846 ?auto_27850 ) ) ( not ( = ?auto_27847 ?auto_27850 ) ) ( not ( = ?auto_27848 ?auto_27850 ) ) ( not ( = ?auto_27849 ?auto_27850 ) ) ( ON ?auto_27848 ?auto_27849 ) ( CLEAR ?auto_27848 ) ( ON-TABLE ?auto_27850 ) ( HOLDING ?auto_27847 ) ( CLEAR ?auto_27846 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27845 ?auto_27846 ?auto_27847 )
      ( MAKE-5PILE ?auto_27845 ?auto_27846 ?auto_27847 ?auto_27848 ?auto_27849 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27851 - BLOCK
      ?auto_27852 - BLOCK
      ?auto_27853 - BLOCK
      ?auto_27854 - BLOCK
      ?auto_27855 - BLOCK
    )
    :vars
    (
      ?auto_27856 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27851 ) ( ON ?auto_27852 ?auto_27851 ) ( not ( = ?auto_27851 ?auto_27852 ) ) ( not ( = ?auto_27851 ?auto_27853 ) ) ( not ( = ?auto_27851 ?auto_27854 ) ) ( not ( = ?auto_27851 ?auto_27855 ) ) ( not ( = ?auto_27852 ?auto_27853 ) ) ( not ( = ?auto_27852 ?auto_27854 ) ) ( not ( = ?auto_27852 ?auto_27855 ) ) ( not ( = ?auto_27853 ?auto_27854 ) ) ( not ( = ?auto_27853 ?auto_27855 ) ) ( not ( = ?auto_27854 ?auto_27855 ) ) ( ON ?auto_27855 ?auto_27856 ) ( not ( = ?auto_27851 ?auto_27856 ) ) ( not ( = ?auto_27852 ?auto_27856 ) ) ( not ( = ?auto_27853 ?auto_27856 ) ) ( not ( = ?auto_27854 ?auto_27856 ) ) ( not ( = ?auto_27855 ?auto_27856 ) ) ( ON ?auto_27854 ?auto_27855 ) ( ON-TABLE ?auto_27856 ) ( CLEAR ?auto_27852 ) ( ON ?auto_27853 ?auto_27854 ) ( CLEAR ?auto_27853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27856 ?auto_27855 ?auto_27854 )
      ( MAKE-5PILE ?auto_27851 ?auto_27852 ?auto_27853 ?auto_27854 ?auto_27855 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27857 - BLOCK
      ?auto_27858 - BLOCK
      ?auto_27859 - BLOCK
      ?auto_27860 - BLOCK
      ?auto_27861 - BLOCK
    )
    :vars
    (
      ?auto_27862 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27857 ) ( not ( = ?auto_27857 ?auto_27858 ) ) ( not ( = ?auto_27857 ?auto_27859 ) ) ( not ( = ?auto_27857 ?auto_27860 ) ) ( not ( = ?auto_27857 ?auto_27861 ) ) ( not ( = ?auto_27858 ?auto_27859 ) ) ( not ( = ?auto_27858 ?auto_27860 ) ) ( not ( = ?auto_27858 ?auto_27861 ) ) ( not ( = ?auto_27859 ?auto_27860 ) ) ( not ( = ?auto_27859 ?auto_27861 ) ) ( not ( = ?auto_27860 ?auto_27861 ) ) ( ON ?auto_27861 ?auto_27862 ) ( not ( = ?auto_27857 ?auto_27862 ) ) ( not ( = ?auto_27858 ?auto_27862 ) ) ( not ( = ?auto_27859 ?auto_27862 ) ) ( not ( = ?auto_27860 ?auto_27862 ) ) ( not ( = ?auto_27861 ?auto_27862 ) ) ( ON ?auto_27860 ?auto_27861 ) ( ON-TABLE ?auto_27862 ) ( ON ?auto_27859 ?auto_27860 ) ( CLEAR ?auto_27859 ) ( HOLDING ?auto_27858 ) ( CLEAR ?auto_27857 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27857 ?auto_27858 )
      ( MAKE-5PILE ?auto_27857 ?auto_27858 ?auto_27859 ?auto_27860 ?auto_27861 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27863 - BLOCK
      ?auto_27864 - BLOCK
      ?auto_27865 - BLOCK
      ?auto_27866 - BLOCK
      ?auto_27867 - BLOCK
    )
    :vars
    (
      ?auto_27868 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27863 ) ( not ( = ?auto_27863 ?auto_27864 ) ) ( not ( = ?auto_27863 ?auto_27865 ) ) ( not ( = ?auto_27863 ?auto_27866 ) ) ( not ( = ?auto_27863 ?auto_27867 ) ) ( not ( = ?auto_27864 ?auto_27865 ) ) ( not ( = ?auto_27864 ?auto_27866 ) ) ( not ( = ?auto_27864 ?auto_27867 ) ) ( not ( = ?auto_27865 ?auto_27866 ) ) ( not ( = ?auto_27865 ?auto_27867 ) ) ( not ( = ?auto_27866 ?auto_27867 ) ) ( ON ?auto_27867 ?auto_27868 ) ( not ( = ?auto_27863 ?auto_27868 ) ) ( not ( = ?auto_27864 ?auto_27868 ) ) ( not ( = ?auto_27865 ?auto_27868 ) ) ( not ( = ?auto_27866 ?auto_27868 ) ) ( not ( = ?auto_27867 ?auto_27868 ) ) ( ON ?auto_27866 ?auto_27867 ) ( ON-TABLE ?auto_27868 ) ( ON ?auto_27865 ?auto_27866 ) ( CLEAR ?auto_27863 ) ( ON ?auto_27864 ?auto_27865 ) ( CLEAR ?auto_27864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27868 ?auto_27867 ?auto_27866 ?auto_27865 )
      ( MAKE-5PILE ?auto_27863 ?auto_27864 ?auto_27865 ?auto_27866 ?auto_27867 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27869 - BLOCK
      ?auto_27870 - BLOCK
      ?auto_27871 - BLOCK
      ?auto_27872 - BLOCK
      ?auto_27873 - BLOCK
    )
    :vars
    (
      ?auto_27874 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27869 ?auto_27870 ) ) ( not ( = ?auto_27869 ?auto_27871 ) ) ( not ( = ?auto_27869 ?auto_27872 ) ) ( not ( = ?auto_27869 ?auto_27873 ) ) ( not ( = ?auto_27870 ?auto_27871 ) ) ( not ( = ?auto_27870 ?auto_27872 ) ) ( not ( = ?auto_27870 ?auto_27873 ) ) ( not ( = ?auto_27871 ?auto_27872 ) ) ( not ( = ?auto_27871 ?auto_27873 ) ) ( not ( = ?auto_27872 ?auto_27873 ) ) ( ON ?auto_27873 ?auto_27874 ) ( not ( = ?auto_27869 ?auto_27874 ) ) ( not ( = ?auto_27870 ?auto_27874 ) ) ( not ( = ?auto_27871 ?auto_27874 ) ) ( not ( = ?auto_27872 ?auto_27874 ) ) ( not ( = ?auto_27873 ?auto_27874 ) ) ( ON ?auto_27872 ?auto_27873 ) ( ON-TABLE ?auto_27874 ) ( ON ?auto_27871 ?auto_27872 ) ( ON ?auto_27870 ?auto_27871 ) ( CLEAR ?auto_27870 ) ( HOLDING ?auto_27869 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27869 )
      ( MAKE-5PILE ?auto_27869 ?auto_27870 ?auto_27871 ?auto_27872 ?auto_27873 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27875 - BLOCK
      ?auto_27876 - BLOCK
      ?auto_27877 - BLOCK
      ?auto_27878 - BLOCK
      ?auto_27879 - BLOCK
    )
    :vars
    (
      ?auto_27880 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27875 ?auto_27876 ) ) ( not ( = ?auto_27875 ?auto_27877 ) ) ( not ( = ?auto_27875 ?auto_27878 ) ) ( not ( = ?auto_27875 ?auto_27879 ) ) ( not ( = ?auto_27876 ?auto_27877 ) ) ( not ( = ?auto_27876 ?auto_27878 ) ) ( not ( = ?auto_27876 ?auto_27879 ) ) ( not ( = ?auto_27877 ?auto_27878 ) ) ( not ( = ?auto_27877 ?auto_27879 ) ) ( not ( = ?auto_27878 ?auto_27879 ) ) ( ON ?auto_27879 ?auto_27880 ) ( not ( = ?auto_27875 ?auto_27880 ) ) ( not ( = ?auto_27876 ?auto_27880 ) ) ( not ( = ?auto_27877 ?auto_27880 ) ) ( not ( = ?auto_27878 ?auto_27880 ) ) ( not ( = ?auto_27879 ?auto_27880 ) ) ( ON ?auto_27878 ?auto_27879 ) ( ON-TABLE ?auto_27880 ) ( ON ?auto_27877 ?auto_27878 ) ( ON ?auto_27876 ?auto_27877 ) ( ON ?auto_27875 ?auto_27876 ) ( CLEAR ?auto_27875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27880 ?auto_27879 ?auto_27878 ?auto_27877 ?auto_27876 )
      ( MAKE-5PILE ?auto_27875 ?auto_27876 ?auto_27877 ?auto_27878 ?auto_27879 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27885 - BLOCK
      ?auto_27886 - BLOCK
      ?auto_27887 - BLOCK
      ?auto_27888 - BLOCK
    )
    :vars
    (
      ?auto_27889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27889 ?auto_27888 ) ( CLEAR ?auto_27889 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27885 ) ( ON ?auto_27886 ?auto_27885 ) ( ON ?auto_27887 ?auto_27886 ) ( ON ?auto_27888 ?auto_27887 ) ( not ( = ?auto_27885 ?auto_27886 ) ) ( not ( = ?auto_27885 ?auto_27887 ) ) ( not ( = ?auto_27885 ?auto_27888 ) ) ( not ( = ?auto_27885 ?auto_27889 ) ) ( not ( = ?auto_27886 ?auto_27887 ) ) ( not ( = ?auto_27886 ?auto_27888 ) ) ( not ( = ?auto_27886 ?auto_27889 ) ) ( not ( = ?auto_27887 ?auto_27888 ) ) ( not ( = ?auto_27887 ?auto_27889 ) ) ( not ( = ?auto_27888 ?auto_27889 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27889 ?auto_27888 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27901 - BLOCK
      ?auto_27902 - BLOCK
      ?auto_27903 - BLOCK
      ?auto_27904 - BLOCK
    )
    :vars
    (
      ?auto_27905 - BLOCK
      ?auto_27906 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27901 ) ( ON ?auto_27902 ?auto_27901 ) ( ON ?auto_27903 ?auto_27902 ) ( not ( = ?auto_27901 ?auto_27902 ) ) ( not ( = ?auto_27901 ?auto_27903 ) ) ( not ( = ?auto_27901 ?auto_27904 ) ) ( not ( = ?auto_27901 ?auto_27905 ) ) ( not ( = ?auto_27902 ?auto_27903 ) ) ( not ( = ?auto_27902 ?auto_27904 ) ) ( not ( = ?auto_27902 ?auto_27905 ) ) ( not ( = ?auto_27903 ?auto_27904 ) ) ( not ( = ?auto_27903 ?auto_27905 ) ) ( not ( = ?auto_27904 ?auto_27905 ) ) ( ON ?auto_27905 ?auto_27906 ) ( CLEAR ?auto_27905 ) ( not ( = ?auto_27901 ?auto_27906 ) ) ( not ( = ?auto_27902 ?auto_27906 ) ) ( not ( = ?auto_27903 ?auto_27906 ) ) ( not ( = ?auto_27904 ?auto_27906 ) ) ( not ( = ?auto_27905 ?auto_27906 ) ) ( HOLDING ?auto_27904 ) ( CLEAR ?auto_27903 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27901 ?auto_27902 ?auto_27903 ?auto_27904 ?auto_27905 )
      ( MAKE-4PILE ?auto_27901 ?auto_27902 ?auto_27903 ?auto_27904 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27907 - BLOCK
      ?auto_27908 - BLOCK
      ?auto_27909 - BLOCK
      ?auto_27910 - BLOCK
    )
    :vars
    (
      ?auto_27912 - BLOCK
      ?auto_27911 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27907 ) ( ON ?auto_27908 ?auto_27907 ) ( ON ?auto_27909 ?auto_27908 ) ( not ( = ?auto_27907 ?auto_27908 ) ) ( not ( = ?auto_27907 ?auto_27909 ) ) ( not ( = ?auto_27907 ?auto_27910 ) ) ( not ( = ?auto_27907 ?auto_27912 ) ) ( not ( = ?auto_27908 ?auto_27909 ) ) ( not ( = ?auto_27908 ?auto_27910 ) ) ( not ( = ?auto_27908 ?auto_27912 ) ) ( not ( = ?auto_27909 ?auto_27910 ) ) ( not ( = ?auto_27909 ?auto_27912 ) ) ( not ( = ?auto_27910 ?auto_27912 ) ) ( ON ?auto_27912 ?auto_27911 ) ( not ( = ?auto_27907 ?auto_27911 ) ) ( not ( = ?auto_27908 ?auto_27911 ) ) ( not ( = ?auto_27909 ?auto_27911 ) ) ( not ( = ?auto_27910 ?auto_27911 ) ) ( not ( = ?auto_27912 ?auto_27911 ) ) ( CLEAR ?auto_27909 ) ( ON ?auto_27910 ?auto_27912 ) ( CLEAR ?auto_27910 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27911 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27911 ?auto_27912 )
      ( MAKE-4PILE ?auto_27907 ?auto_27908 ?auto_27909 ?auto_27910 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27913 - BLOCK
      ?auto_27914 - BLOCK
      ?auto_27915 - BLOCK
      ?auto_27916 - BLOCK
    )
    :vars
    (
      ?auto_27918 - BLOCK
      ?auto_27917 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27913 ) ( ON ?auto_27914 ?auto_27913 ) ( not ( = ?auto_27913 ?auto_27914 ) ) ( not ( = ?auto_27913 ?auto_27915 ) ) ( not ( = ?auto_27913 ?auto_27916 ) ) ( not ( = ?auto_27913 ?auto_27918 ) ) ( not ( = ?auto_27914 ?auto_27915 ) ) ( not ( = ?auto_27914 ?auto_27916 ) ) ( not ( = ?auto_27914 ?auto_27918 ) ) ( not ( = ?auto_27915 ?auto_27916 ) ) ( not ( = ?auto_27915 ?auto_27918 ) ) ( not ( = ?auto_27916 ?auto_27918 ) ) ( ON ?auto_27918 ?auto_27917 ) ( not ( = ?auto_27913 ?auto_27917 ) ) ( not ( = ?auto_27914 ?auto_27917 ) ) ( not ( = ?auto_27915 ?auto_27917 ) ) ( not ( = ?auto_27916 ?auto_27917 ) ) ( not ( = ?auto_27918 ?auto_27917 ) ) ( ON ?auto_27916 ?auto_27918 ) ( CLEAR ?auto_27916 ) ( ON-TABLE ?auto_27917 ) ( HOLDING ?auto_27915 ) ( CLEAR ?auto_27914 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27913 ?auto_27914 ?auto_27915 )
      ( MAKE-4PILE ?auto_27913 ?auto_27914 ?auto_27915 ?auto_27916 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27919 - BLOCK
      ?auto_27920 - BLOCK
      ?auto_27921 - BLOCK
      ?auto_27922 - BLOCK
    )
    :vars
    (
      ?auto_27924 - BLOCK
      ?auto_27923 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27919 ) ( ON ?auto_27920 ?auto_27919 ) ( not ( = ?auto_27919 ?auto_27920 ) ) ( not ( = ?auto_27919 ?auto_27921 ) ) ( not ( = ?auto_27919 ?auto_27922 ) ) ( not ( = ?auto_27919 ?auto_27924 ) ) ( not ( = ?auto_27920 ?auto_27921 ) ) ( not ( = ?auto_27920 ?auto_27922 ) ) ( not ( = ?auto_27920 ?auto_27924 ) ) ( not ( = ?auto_27921 ?auto_27922 ) ) ( not ( = ?auto_27921 ?auto_27924 ) ) ( not ( = ?auto_27922 ?auto_27924 ) ) ( ON ?auto_27924 ?auto_27923 ) ( not ( = ?auto_27919 ?auto_27923 ) ) ( not ( = ?auto_27920 ?auto_27923 ) ) ( not ( = ?auto_27921 ?auto_27923 ) ) ( not ( = ?auto_27922 ?auto_27923 ) ) ( not ( = ?auto_27924 ?auto_27923 ) ) ( ON ?auto_27922 ?auto_27924 ) ( ON-TABLE ?auto_27923 ) ( CLEAR ?auto_27920 ) ( ON ?auto_27921 ?auto_27922 ) ( CLEAR ?auto_27921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27923 ?auto_27924 ?auto_27922 )
      ( MAKE-4PILE ?auto_27919 ?auto_27920 ?auto_27921 ?auto_27922 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27925 - BLOCK
      ?auto_27926 - BLOCK
      ?auto_27927 - BLOCK
      ?auto_27928 - BLOCK
    )
    :vars
    (
      ?auto_27930 - BLOCK
      ?auto_27929 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27925 ) ( not ( = ?auto_27925 ?auto_27926 ) ) ( not ( = ?auto_27925 ?auto_27927 ) ) ( not ( = ?auto_27925 ?auto_27928 ) ) ( not ( = ?auto_27925 ?auto_27930 ) ) ( not ( = ?auto_27926 ?auto_27927 ) ) ( not ( = ?auto_27926 ?auto_27928 ) ) ( not ( = ?auto_27926 ?auto_27930 ) ) ( not ( = ?auto_27927 ?auto_27928 ) ) ( not ( = ?auto_27927 ?auto_27930 ) ) ( not ( = ?auto_27928 ?auto_27930 ) ) ( ON ?auto_27930 ?auto_27929 ) ( not ( = ?auto_27925 ?auto_27929 ) ) ( not ( = ?auto_27926 ?auto_27929 ) ) ( not ( = ?auto_27927 ?auto_27929 ) ) ( not ( = ?auto_27928 ?auto_27929 ) ) ( not ( = ?auto_27930 ?auto_27929 ) ) ( ON ?auto_27928 ?auto_27930 ) ( ON-TABLE ?auto_27929 ) ( ON ?auto_27927 ?auto_27928 ) ( CLEAR ?auto_27927 ) ( HOLDING ?auto_27926 ) ( CLEAR ?auto_27925 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27925 ?auto_27926 )
      ( MAKE-4PILE ?auto_27925 ?auto_27926 ?auto_27927 ?auto_27928 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27931 - BLOCK
      ?auto_27932 - BLOCK
      ?auto_27933 - BLOCK
      ?auto_27934 - BLOCK
    )
    :vars
    (
      ?auto_27936 - BLOCK
      ?auto_27935 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27931 ) ( not ( = ?auto_27931 ?auto_27932 ) ) ( not ( = ?auto_27931 ?auto_27933 ) ) ( not ( = ?auto_27931 ?auto_27934 ) ) ( not ( = ?auto_27931 ?auto_27936 ) ) ( not ( = ?auto_27932 ?auto_27933 ) ) ( not ( = ?auto_27932 ?auto_27934 ) ) ( not ( = ?auto_27932 ?auto_27936 ) ) ( not ( = ?auto_27933 ?auto_27934 ) ) ( not ( = ?auto_27933 ?auto_27936 ) ) ( not ( = ?auto_27934 ?auto_27936 ) ) ( ON ?auto_27936 ?auto_27935 ) ( not ( = ?auto_27931 ?auto_27935 ) ) ( not ( = ?auto_27932 ?auto_27935 ) ) ( not ( = ?auto_27933 ?auto_27935 ) ) ( not ( = ?auto_27934 ?auto_27935 ) ) ( not ( = ?auto_27936 ?auto_27935 ) ) ( ON ?auto_27934 ?auto_27936 ) ( ON-TABLE ?auto_27935 ) ( ON ?auto_27933 ?auto_27934 ) ( CLEAR ?auto_27931 ) ( ON ?auto_27932 ?auto_27933 ) ( CLEAR ?auto_27932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27935 ?auto_27936 ?auto_27934 ?auto_27933 )
      ( MAKE-4PILE ?auto_27931 ?auto_27932 ?auto_27933 ?auto_27934 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27937 - BLOCK
      ?auto_27938 - BLOCK
      ?auto_27939 - BLOCK
      ?auto_27940 - BLOCK
    )
    :vars
    (
      ?auto_27942 - BLOCK
      ?auto_27941 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27937 ?auto_27938 ) ) ( not ( = ?auto_27937 ?auto_27939 ) ) ( not ( = ?auto_27937 ?auto_27940 ) ) ( not ( = ?auto_27937 ?auto_27942 ) ) ( not ( = ?auto_27938 ?auto_27939 ) ) ( not ( = ?auto_27938 ?auto_27940 ) ) ( not ( = ?auto_27938 ?auto_27942 ) ) ( not ( = ?auto_27939 ?auto_27940 ) ) ( not ( = ?auto_27939 ?auto_27942 ) ) ( not ( = ?auto_27940 ?auto_27942 ) ) ( ON ?auto_27942 ?auto_27941 ) ( not ( = ?auto_27937 ?auto_27941 ) ) ( not ( = ?auto_27938 ?auto_27941 ) ) ( not ( = ?auto_27939 ?auto_27941 ) ) ( not ( = ?auto_27940 ?auto_27941 ) ) ( not ( = ?auto_27942 ?auto_27941 ) ) ( ON ?auto_27940 ?auto_27942 ) ( ON-TABLE ?auto_27941 ) ( ON ?auto_27939 ?auto_27940 ) ( ON ?auto_27938 ?auto_27939 ) ( CLEAR ?auto_27938 ) ( HOLDING ?auto_27937 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27937 )
      ( MAKE-4PILE ?auto_27937 ?auto_27938 ?auto_27939 ?auto_27940 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27943 - BLOCK
      ?auto_27944 - BLOCK
      ?auto_27945 - BLOCK
      ?auto_27946 - BLOCK
    )
    :vars
    (
      ?auto_27947 - BLOCK
      ?auto_27948 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27943 ?auto_27944 ) ) ( not ( = ?auto_27943 ?auto_27945 ) ) ( not ( = ?auto_27943 ?auto_27946 ) ) ( not ( = ?auto_27943 ?auto_27947 ) ) ( not ( = ?auto_27944 ?auto_27945 ) ) ( not ( = ?auto_27944 ?auto_27946 ) ) ( not ( = ?auto_27944 ?auto_27947 ) ) ( not ( = ?auto_27945 ?auto_27946 ) ) ( not ( = ?auto_27945 ?auto_27947 ) ) ( not ( = ?auto_27946 ?auto_27947 ) ) ( ON ?auto_27947 ?auto_27948 ) ( not ( = ?auto_27943 ?auto_27948 ) ) ( not ( = ?auto_27944 ?auto_27948 ) ) ( not ( = ?auto_27945 ?auto_27948 ) ) ( not ( = ?auto_27946 ?auto_27948 ) ) ( not ( = ?auto_27947 ?auto_27948 ) ) ( ON ?auto_27946 ?auto_27947 ) ( ON-TABLE ?auto_27948 ) ( ON ?auto_27945 ?auto_27946 ) ( ON ?auto_27944 ?auto_27945 ) ( ON ?auto_27943 ?auto_27944 ) ( CLEAR ?auto_27943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27948 ?auto_27947 ?auto_27946 ?auto_27945 ?auto_27944 )
      ( MAKE-4PILE ?auto_27943 ?auto_27944 ?auto_27945 ?auto_27946 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27950 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_27950 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_27950 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27951 - BLOCK
    )
    :vars
    (
      ?auto_27952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27951 ?auto_27952 ) ( CLEAR ?auto_27951 ) ( HAND-EMPTY ) ( not ( = ?auto_27951 ?auto_27952 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27951 ?auto_27952 )
      ( MAKE-1PILE ?auto_27951 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27953 - BLOCK
    )
    :vars
    (
      ?auto_27954 - BLOCK
      ?auto_27956 - BLOCK
      ?auto_27957 - BLOCK
      ?auto_27955 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27953 ?auto_27954 ) ) ( HOLDING ?auto_27953 ) ( CLEAR ?auto_27954 ) ( ON-TABLE ?auto_27956 ) ( ON ?auto_27957 ?auto_27956 ) ( ON ?auto_27955 ?auto_27957 ) ( ON ?auto_27954 ?auto_27955 ) ( not ( = ?auto_27956 ?auto_27957 ) ) ( not ( = ?auto_27956 ?auto_27955 ) ) ( not ( = ?auto_27956 ?auto_27954 ) ) ( not ( = ?auto_27956 ?auto_27953 ) ) ( not ( = ?auto_27957 ?auto_27955 ) ) ( not ( = ?auto_27957 ?auto_27954 ) ) ( not ( = ?auto_27957 ?auto_27953 ) ) ( not ( = ?auto_27955 ?auto_27954 ) ) ( not ( = ?auto_27955 ?auto_27953 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27956 ?auto_27957 ?auto_27955 ?auto_27954 ?auto_27953 )
      ( MAKE-1PILE ?auto_27953 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27958 - BLOCK
    )
    :vars
    (
      ?auto_27960 - BLOCK
      ?auto_27961 - BLOCK
      ?auto_27962 - BLOCK
      ?auto_27959 - BLOCK
      ?auto_27963 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27958 ?auto_27960 ) ) ( CLEAR ?auto_27960 ) ( ON-TABLE ?auto_27961 ) ( ON ?auto_27962 ?auto_27961 ) ( ON ?auto_27959 ?auto_27962 ) ( ON ?auto_27960 ?auto_27959 ) ( not ( = ?auto_27961 ?auto_27962 ) ) ( not ( = ?auto_27961 ?auto_27959 ) ) ( not ( = ?auto_27961 ?auto_27960 ) ) ( not ( = ?auto_27961 ?auto_27958 ) ) ( not ( = ?auto_27962 ?auto_27959 ) ) ( not ( = ?auto_27962 ?auto_27960 ) ) ( not ( = ?auto_27962 ?auto_27958 ) ) ( not ( = ?auto_27959 ?auto_27960 ) ) ( not ( = ?auto_27959 ?auto_27958 ) ) ( ON ?auto_27958 ?auto_27963 ) ( CLEAR ?auto_27958 ) ( HAND-EMPTY ) ( not ( = ?auto_27958 ?auto_27963 ) ) ( not ( = ?auto_27960 ?auto_27963 ) ) ( not ( = ?auto_27961 ?auto_27963 ) ) ( not ( = ?auto_27962 ?auto_27963 ) ) ( not ( = ?auto_27959 ?auto_27963 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27958 ?auto_27963 )
      ( MAKE-1PILE ?auto_27958 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27964 - BLOCK
    )
    :vars
    (
      ?auto_27969 - BLOCK
      ?auto_27967 - BLOCK
      ?auto_27968 - BLOCK
      ?auto_27966 - BLOCK
      ?auto_27965 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27964 ?auto_27969 ) ) ( ON-TABLE ?auto_27967 ) ( ON ?auto_27968 ?auto_27967 ) ( ON ?auto_27966 ?auto_27968 ) ( not ( = ?auto_27967 ?auto_27968 ) ) ( not ( = ?auto_27967 ?auto_27966 ) ) ( not ( = ?auto_27967 ?auto_27969 ) ) ( not ( = ?auto_27967 ?auto_27964 ) ) ( not ( = ?auto_27968 ?auto_27966 ) ) ( not ( = ?auto_27968 ?auto_27969 ) ) ( not ( = ?auto_27968 ?auto_27964 ) ) ( not ( = ?auto_27966 ?auto_27969 ) ) ( not ( = ?auto_27966 ?auto_27964 ) ) ( ON ?auto_27964 ?auto_27965 ) ( CLEAR ?auto_27964 ) ( not ( = ?auto_27964 ?auto_27965 ) ) ( not ( = ?auto_27969 ?auto_27965 ) ) ( not ( = ?auto_27967 ?auto_27965 ) ) ( not ( = ?auto_27968 ?auto_27965 ) ) ( not ( = ?auto_27966 ?auto_27965 ) ) ( HOLDING ?auto_27969 ) ( CLEAR ?auto_27966 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27967 ?auto_27968 ?auto_27966 ?auto_27969 )
      ( MAKE-1PILE ?auto_27964 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27970 - BLOCK
    )
    :vars
    (
      ?auto_27974 - BLOCK
      ?auto_27973 - BLOCK
      ?auto_27971 - BLOCK
      ?auto_27975 - BLOCK
      ?auto_27972 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27970 ?auto_27974 ) ) ( ON-TABLE ?auto_27973 ) ( ON ?auto_27971 ?auto_27973 ) ( ON ?auto_27975 ?auto_27971 ) ( not ( = ?auto_27973 ?auto_27971 ) ) ( not ( = ?auto_27973 ?auto_27975 ) ) ( not ( = ?auto_27973 ?auto_27974 ) ) ( not ( = ?auto_27973 ?auto_27970 ) ) ( not ( = ?auto_27971 ?auto_27975 ) ) ( not ( = ?auto_27971 ?auto_27974 ) ) ( not ( = ?auto_27971 ?auto_27970 ) ) ( not ( = ?auto_27975 ?auto_27974 ) ) ( not ( = ?auto_27975 ?auto_27970 ) ) ( ON ?auto_27970 ?auto_27972 ) ( not ( = ?auto_27970 ?auto_27972 ) ) ( not ( = ?auto_27974 ?auto_27972 ) ) ( not ( = ?auto_27973 ?auto_27972 ) ) ( not ( = ?auto_27971 ?auto_27972 ) ) ( not ( = ?auto_27975 ?auto_27972 ) ) ( CLEAR ?auto_27975 ) ( ON ?auto_27974 ?auto_27970 ) ( CLEAR ?auto_27974 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27972 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27972 ?auto_27970 )
      ( MAKE-1PILE ?auto_27970 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27976 - BLOCK
    )
    :vars
    (
      ?auto_27978 - BLOCK
      ?auto_27977 - BLOCK
      ?auto_27981 - BLOCK
      ?auto_27979 - BLOCK
      ?auto_27980 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27976 ?auto_27978 ) ) ( ON-TABLE ?auto_27977 ) ( ON ?auto_27981 ?auto_27977 ) ( not ( = ?auto_27977 ?auto_27981 ) ) ( not ( = ?auto_27977 ?auto_27979 ) ) ( not ( = ?auto_27977 ?auto_27978 ) ) ( not ( = ?auto_27977 ?auto_27976 ) ) ( not ( = ?auto_27981 ?auto_27979 ) ) ( not ( = ?auto_27981 ?auto_27978 ) ) ( not ( = ?auto_27981 ?auto_27976 ) ) ( not ( = ?auto_27979 ?auto_27978 ) ) ( not ( = ?auto_27979 ?auto_27976 ) ) ( ON ?auto_27976 ?auto_27980 ) ( not ( = ?auto_27976 ?auto_27980 ) ) ( not ( = ?auto_27978 ?auto_27980 ) ) ( not ( = ?auto_27977 ?auto_27980 ) ) ( not ( = ?auto_27981 ?auto_27980 ) ) ( not ( = ?auto_27979 ?auto_27980 ) ) ( ON ?auto_27978 ?auto_27976 ) ( CLEAR ?auto_27978 ) ( ON-TABLE ?auto_27980 ) ( HOLDING ?auto_27979 ) ( CLEAR ?auto_27981 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27977 ?auto_27981 ?auto_27979 )
      ( MAKE-1PILE ?auto_27976 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27982 - BLOCK
    )
    :vars
    (
      ?auto_27984 - BLOCK
      ?auto_27986 - BLOCK
      ?auto_27985 - BLOCK
      ?auto_27987 - BLOCK
      ?auto_27983 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27982 ?auto_27984 ) ) ( ON-TABLE ?auto_27986 ) ( ON ?auto_27985 ?auto_27986 ) ( not ( = ?auto_27986 ?auto_27985 ) ) ( not ( = ?auto_27986 ?auto_27987 ) ) ( not ( = ?auto_27986 ?auto_27984 ) ) ( not ( = ?auto_27986 ?auto_27982 ) ) ( not ( = ?auto_27985 ?auto_27987 ) ) ( not ( = ?auto_27985 ?auto_27984 ) ) ( not ( = ?auto_27985 ?auto_27982 ) ) ( not ( = ?auto_27987 ?auto_27984 ) ) ( not ( = ?auto_27987 ?auto_27982 ) ) ( ON ?auto_27982 ?auto_27983 ) ( not ( = ?auto_27982 ?auto_27983 ) ) ( not ( = ?auto_27984 ?auto_27983 ) ) ( not ( = ?auto_27986 ?auto_27983 ) ) ( not ( = ?auto_27985 ?auto_27983 ) ) ( not ( = ?auto_27987 ?auto_27983 ) ) ( ON ?auto_27984 ?auto_27982 ) ( ON-TABLE ?auto_27983 ) ( CLEAR ?auto_27985 ) ( ON ?auto_27987 ?auto_27984 ) ( CLEAR ?auto_27987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27983 ?auto_27982 ?auto_27984 )
      ( MAKE-1PILE ?auto_27982 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27988 - BLOCK
    )
    :vars
    (
      ?auto_27991 - BLOCK
      ?auto_27989 - BLOCK
      ?auto_27990 - BLOCK
      ?auto_27993 - BLOCK
      ?auto_27992 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27988 ?auto_27991 ) ) ( ON-TABLE ?auto_27989 ) ( not ( = ?auto_27989 ?auto_27990 ) ) ( not ( = ?auto_27989 ?auto_27993 ) ) ( not ( = ?auto_27989 ?auto_27991 ) ) ( not ( = ?auto_27989 ?auto_27988 ) ) ( not ( = ?auto_27990 ?auto_27993 ) ) ( not ( = ?auto_27990 ?auto_27991 ) ) ( not ( = ?auto_27990 ?auto_27988 ) ) ( not ( = ?auto_27993 ?auto_27991 ) ) ( not ( = ?auto_27993 ?auto_27988 ) ) ( ON ?auto_27988 ?auto_27992 ) ( not ( = ?auto_27988 ?auto_27992 ) ) ( not ( = ?auto_27991 ?auto_27992 ) ) ( not ( = ?auto_27989 ?auto_27992 ) ) ( not ( = ?auto_27990 ?auto_27992 ) ) ( not ( = ?auto_27993 ?auto_27992 ) ) ( ON ?auto_27991 ?auto_27988 ) ( ON-TABLE ?auto_27992 ) ( ON ?auto_27993 ?auto_27991 ) ( CLEAR ?auto_27993 ) ( HOLDING ?auto_27990 ) ( CLEAR ?auto_27989 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27989 ?auto_27990 )
      ( MAKE-1PILE ?auto_27988 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27994 - BLOCK
    )
    :vars
    (
      ?auto_27996 - BLOCK
      ?auto_27997 - BLOCK
      ?auto_27999 - BLOCK
      ?auto_27998 - BLOCK
      ?auto_27995 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27994 ?auto_27996 ) ) ( ON-TABLE ?auto_27997 ) ( not ( = ?auto_27997 ?auto_27999 ) ) ( not ( = ?auto_27997 ?auto_27998 ) ) ( not ( = ?auto_27997 ?auto_27996 ) ) ( not ( = ?auto_27997 ?auto_27994 ) ) ( not ( = ?auto_27999 ?auto_27998 ) ) ( not ( = ?auto_27999 ?auto_27996 ) ) ( not ( = ?auto_27999 ?auto_27994 ) ) ( not ( = ?auto_27998 ?auto_27996 ) ) ( not ( = ?auto_27998 ?auto_27994 ) ) ( ON ?auto_27994 ?auto_27995 ) ( not ( = ?auto_27994 ?auto_27995 ) ) ( not ( = ?auto_27996 ?auto_27995 ) ) ( not ( = ?auto_27997 ?auto_27995 ) ) ( not ( = ?auto_27999 ?auto_27995 ) ) ( not ( = ?auto_27998 ?auto_27995 ) ) ( ON ?auto_27996 ?auto_27994 ) ( ON-TABLE ?auto_27995 ) ( ON ?auto_27998 ?auto_27996 ) ( CLEAR ?auto_27997 ) ( ON ?auto_27999 ?auto_27998 ) ( CLEAR ?auto_27999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27995 ?auto_27994 ?auto_27996 ?auto_27998 )
      ( MAKE-1PILE ?auto_27994 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28000 - BLOCK
    )
    :vars
    (
      ?auto_28002 - BLOCK
      ?auto_28001 - BLOCK
      ?auto_28005 - BLOCK
      ?auto_28003 - BLOCK
      ?auto_28004 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28000 ?auto_28002 ) ) ( not ( = ?auto_28001 ?auto_28005 ) ) ( not ( = ?auto_28001 ?auto_28003 ) ) ( not ( = ?auto_28001 ?auto_28002 ) ) ( not ( = ?auto_28001 ?auto_28000 ) ) ( not ( = ?auto_28005 ?auto_28003 ) ) ( not ( = ?auto_28005 ?auto_28002 ) ) ( not ( = ?auto_28005 ?auto_28000 ) ) ( not ( = ?auto_28003 ?auto_28002 ) ) ( not ( = ?auto_28003 ?auto_28000 ) ) ( ON ?auto_28000 ?auto_28004 ) ( not ( = ?auto_28000 ?auto_28004 ) ) ( not ( = ?auto_28002 ?auto_28004 ) ) ( not ( = ?auto_28001 ?auto_28004 ) ) ( not ( = ?auto_28005 ?auto_28004 ) ) ( not ( = ?auto_28003 ?auto_28004 ) ) ( ON ?auto_28002 ?auto_28000 ) ( ON-TABLE ?auto_28004 ) ( ON ?auto_28003 ?auto_28002 ) ( ON ?auto_28005 ?auto_28003 ) ( CLEAR ?auto_28005 ) ( HOLDING ?auto_28001 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28001 )
      ( MAKE-1PILE ?auto_28000 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28006 - BLOCK
    )
    :vars
    (
      ?auto_28008 - BLOCK
      ?auto_28011 - BLOCK
      ?auto_28010 - BLOCK
      ?auto_28007 - BLOCK
      ?auto_28009 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28006 ?auto_28008 ) ) ( not ( = ?auto_28011 ?auto_28010 ) ) ( not ( = ?auto_28011 ?auto_28007 ) ) ( not ( = ?auto_28011 ?auto_28008 ) ) ( not ( = ?auto_28011 ?auto_28006 ) ) ( not ( = ?auto_28010 ?auto_28007 ) ) ( not ( = ?auto_28010 ?auto_28008 ) ) ( not ( = ?auto_28010 ?auto_28006 ) ) ( not ( = ?auto_28007 ?auto_28008 ) ) ( not ( = ?auto_28007 ?auto_28006 ) ) ( ON ?auto_28006 ?auto_28009 ) ( not ( = ?auto_28006 ?auto_28009 ) ) ( not ( = ?auto_28008 ?auto_28009 ) ) ( not ( = ?auto_28011 ?auto_28009 ) ) ( not ( = ?auto_28010 ?auto_28009 ) ) ( not ( = ?auto_28007 ?auto_28009 ) ) ( ON ?auto_28008 ?auto_28006 ) ( ON-TABLE ?auto_28009 ) ( ON ?auto_28007 ?auto_28008 ) ( ON ?auto_28010 ?auto_28007 ) ( ON ?auto_28011 ?auto_28010 ) ( CLEAR ?auto_28011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28009 ?auto_28006 ?auto_28008 ?auto_28007 ?auto_28010 )
      ( MAKE-1PILE ?auto_28006 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28015 - BLOCK
      ?auto_28016 - BLOCK
      ?auto_28017 - BLOCK
    )
    :vars
    (
      ?auto_28018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28018 ?auto_28017 ) ( CLEAR ?auto_28018 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28015 ) ( ON ?auto_28016 ?auto_28015 ) ( ON ?auto_28017 ?auto_28016 ) ( not ( = ?auto_28015 ?auto_28016 ) ) ( not ( = ?auto_28015 ?auto_28017 ) ) ( not ( = ?auto_28015 ?auto_28018 ) ) ( not ( = ?auto_28016 ?auto_28017 ) ) ( not ( = ?auto_28016 ?auto_28018 ) ) ( not ( = ?auto_28017 ?auto_28018 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28018 ?auto_28017 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28019 - BLOCK
      ?auto_28020 - BLOCK
      ?auto_28021 - BLOCK
    )
    :vars
    (
      ?auto_28022 - BLOCK
      ?auto_28023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28022 ?auto_28021 ) ( CLEAR ?auto_28022 ) ( ON-TABLE ?auto_28019 ) ( ON ?auto_28020 ?auto_28019 ) ( ON ?auto_28021 ?auto_28020 ) ( not ( = ?auto_28019 ?auto_28020 ) ) ( not ( = ?auto_28019 ?auto_28021 ) ) ( not ( = ?auto_28019 ?auto_28022 ) ) ( not ( = ?auto_28020 ?auto_28021 ) ) ( not ( = ?auto_28020 ?auto_28022 ) ) ( not ( = ?auto_28021 ?auto_28022 ) ) ( HOLDING ?auto_28023 ) ( not ( = ?auto_28019 ?auto_28023 ) ) ( not ( = ?auto_28020 ?auto_28023 ) ) ( not ( = ?auto_28021 ?auto_28023 ) ) ( not ( = ?auto_28022 ?auto_28023 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_28023 )
      ( MAKE-3PILE ?auto_28019 ?auto_28020 ?auto_28021 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28024 - BLOCK
      ?auto_28025 - BLOCK
      ?auto_28026 - BLOCK
    )
    :vars
    (
      ?auto_28028 - BLOCK
      ?auto_28027 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28028 ?auto_28026 ) ( ON-TABLE ?auto_28024 ) ( ON ?auto_28025 ?auto_28024 ) ( ON ?auto_28026 ?auto_28025 ) ( not ( = ?auto_28024 ?auto_28025 ) ) ( not ( = ?auto_28024 ?auto_28026 ) ) ( not ( = ?auto_28024 ?auto_28028 ) ) ( not ( = ?auto_28025 ?auto_28026 ) ) ( not ( = ?auto_28025 ?auto_28028 ) ) ( not ( = ?auto_28026 ?auto_28028 ) ) ( not ( = ?auto_28024 ?auto_28027 ) ) ( not ( = ?auto_28025 ?auto_28027 ) ) ( not ( = ?auto_28026 ?auto_28027 ) ) ( not ( = ?auto_28028 ?auto_28027 ) ) ( ON ?auto_28027 ?auto_28028 ) ( CLEAR ?auto_28027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28024 ?auto_28025 ?auto_28026 ?auto_28028 )
      ( MAKE-3PILE ?auto_28024 ?auto_28025 ?auto_28026 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28029 - BLOCK
      ?auto_28030 - BLOCK
      ?auto_28031 - BLOCK
    )
    :vars
    (
      ?auto_28033 - BLOCK
      ?auto_28032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28033 ?auto_28031 ) ( ON-TABLE ?auto_28029 ) ( ON ?auto_28030 ?auto_28029 ) ( ON ?auto_28031 ?auto_28030 ) ( not ( = ?auto_28029 ?auto_28030 ) ) ( not ( = ?auto_28029 ?auto_28031 ) ) ( not ( = ?auto_28029 ?auto_28033 ) ) ( not ( = ?auto_28030 ?auto_28031 ) ) ( not ( = ?auto_28030 ?auto_28033 ) ) ( not ( = ?auto_28031 ?auto_28033 ) ) ( not ( = ?auto_28029 ?auto_28032 ) ) ( not ( = ?auto_28030 ?auto_28032 ) ) ( not ( = ?auto_28031 ?auto_28032 ) ) ( not ( = ?auto_28033 ?auto_28032 ) ) ( HOLDING ?auto_28032 ) ( CLEAR ?auto_28033 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28029 ?auto_28030 ?auto_28031 ?auto_28033 ?auto_28032 )
      ( MAKE-3PILE ?auto_28029 ?auto_28030 ?auto_28031 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28034 - BLOCK
      ?auto_28035 - BLOCK
      ?auto_28036 - BLOCK
    )
    :vars
    (
      ?auto_28037 - BLOCK
      ?auto_28038 - BLOCK
      ?auto_28039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28037 ?auto_28036 ) ( ON-TABLE ?auto_28034 ) ( ON ?auto_28035 ?auto_28034 ) ( ON ?auto_28036 ?auto_28035 ) ( not ( = ?auto_28034 ?auto_28035 ) ) ( not ( = ?auto_28034 ?auto_28036 ) ) ( not ( = ?auto_28034 ?auto_28037 ) ) ( not ( = ?auto_28035 ?auto_28036 ) ) ( not ( = ?auto_28035 ?auto_28037 ) ) ( not ( = ?auto_28036 ?auto_28037 ) ) ( not ( = ?auto_28034 ?auto_28038 ) ) ( not ( = ?auto_28035 ?auto_28038 ) ) ( not ( = ?auto_28036 ?auto_28038 ) ) ( not ( = ?auto_28037 ?auto_28038 ) ) ( CLEAR ?auto_28037 ) ( ON ?auto_28038 ?auto_28039 ) ( CLEAR ?auto_28038 ) ( HAND-EMPTY ) ( not ( = ?auto_28034 ?auto_28039 ) ) ( not ( = ?auto_28035 ?auto_28039 ) ) ( not ( = ?auto_28036 ?auto_28039 ) ) ( not ( = ?auto_28037 ?auto_28039 ) ) ( not ( = ?auto_28038 ?auto_28039 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28038 ?auto_28039 )
      ( MAKE-3PILE ?auto_28034 ?auto_28035 ?auto_28036 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28052 - BLOCK
      ?auto_28053 - BLOCK
      ?auto_28054 - BLOCK
    )
    :vars
    (
      ?auto_28055 - BLOCK
      ?auto_28056 - BLOCK
      ?auto_28057 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28052 ) ( ON ?auto_28053 ?auto_28052 ) ( not ( = ?auto_28052 ?auto_28053 ) ) ( not ( = ?auto_28052 ?auto_28054 ) ) ( not ( = ?auto_28052 ?auto_28055 ) ) ( not ( = ?auto_28053 ?auto_28054 ) ) ( not ( = ?auto_28053 ?auto_28055 ) ) ( not ( = ?auto_28054 ?auto_28055 ) ) ( not ( = ?auto_28052 ?auto_28056 ) ) ( not ( = ?auto_28053 ?auto_28056 ) ) ( not ( = ?auto_28054 ?auto_28056 ) ) ( not ( = ?auto_28055 ?auto_28056 ) ) ( ON ?auto_28056 ?auto_28057 ) ( not ( = ?auto_28052 ?auto_28057 ) ) ( not ( = ?auto_28053 ?auto_28057 ) ) ( not ( = ?auto_28054 ?auto_28057 ) ) ( not ( = ?auto_28055 ?auto_28057 ) ) ( not ( = ?auto_28056 ?auto_28057 ) ) ( ON ?auto_28055 ?auto_28056 ) ( CLEAR ?auto_28055 ) ( HOLDING ?auto_28054 ) ( CLEAR ?auto_28053 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28052 ?auto_28053 ?auto_28054 ?auto_28055 )
      ( MAKE-3PILE ?auto_28052 ?auto_28053 ?auto_28054 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28058 - BLOCK
      ?auto_28059 - BLOCK
      ?auto_28060 - BLOCK
    )
    :vars
    (
      ?auto_28062 - BLOCK
      ?auto_28063 - BLOCK
      ?auto_28061 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28058 ) ( ON ?auto_28059 ?auto_28058 ) ( not ( = ?auto_28058 ?auto_28059 ) ) ( not ( = ?auto_28058 ?auto_28060 ) ) ( not ( = ?auto_28058 ?auto_28062 ) ) ( not ( = ?auto_28059 ?auto_28060 ) ) ( not ( = ?auto_28059 ?auto_28062 ) ) ( not ( = ?auto_28060 ?auto_28062 ) ) ( not ( = ?auto_28058 ?auto_28063 ) ) ( not ( = ?auto_28059 ?auto_28063 ) ) ( not ( = ?auto_28060 ?auto_28063 ) ) ( not ( = ?auto_28062 ?auto_28063 ) ) ( ON ?auto_28063 ?auto_28061 ) ( not ( = ?auto_28058 ?auto_28061 ) ) ( not ( = ?auto_28059 ?auto_28061 ) ) ( not ( = ?auto_28060 ?auto_28061 ) ) ( not ( = ?auto_28062 ?auto_28061 ) ) ( not ( = ?auto_28063 ?auto_28061 ) ) ( ON ?auto_28062 ?auto_28063 ) ( CLEAR ?auto_28059 ) ( ON ?auto_28060 ?auto_28062 ) ( CLEAR ?auto_28060 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28061 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28061 ?auto_28063 ?auto_28062 )
      ( MAKE-3PILE ?auto_28058 ?auto_28059 ?auto_28060 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28064 - BLOCK
      ?auto_28065 - BLOCK
      ?auto_28066 - BLOCK
    )
    :vars
    (
      ?auto_28068 - BLOCK
      ?auto_28067 - BLOCK
      ?auto_28069 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28064 ) ( not ( = ?auto_28064 ?auto_28065 ) ) ( not ( = ?auto_28064 ?auto_28066 ) ) ( not ( = ?auto_28064 ?auto_28068 ) ) ( not ( = ?auto_28065 ?auto_28066 ) ) ( not ( = ?auto_28065 ?auto_28068 ) ) ( not ( = ?auto_28066 ?auto_28068 ) ) ( not ( = ?auto_28064 ?auto_28067 ) ) ( not ( = ?auto_28065 ?auto_28067 ) ) ( not ( = ?auto_28066 ?auto_28067 ) ) ( not ( = ?auto_28068 ?auto_28067 ) ) ( ON ?auto_28067 ?auto_28069 ) ( not ( = ?auto_28064 ?auto_28069 ) ) ( not ( = ?auto_28065 ?auto_28069 ) ) ( not ( = ?auto_28066 ?auto_28069 ) ) ( not ( = ?auto_28068 ?auto_28069 ) ) ( not ( = ?auto_28067 ?auto_28069 ) ) ( ON ?auto_28068 ?auto_28067 ) ( ON ?auto_28066 ?auto_28068 ) ( CLEAR ?auto_28066 ) ( ON-TABLE ?auto_28069 ) ( HOLDING ?auto_28065 ) ( CLEAR ?auto_28064 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28064 ?auto_28065 )
      ( MAKE-3PILE ?auto_28064 ?auto_28065 ?auto_28066 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28070 - BLOCK
      ?auto_28071 - BLOCK
      ?auto_28072 - BLOCK
    )
    :vars
    (
      ?auto_28073 - BLOCK
      ?auto_28074 - BLOCK
      ?auto_28075 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28070 ) ( not ( = ?auto_28070 ?auto_28071 ) ) ( not ( = ?auto_28070 ?auto_28072 ) ) ( not ( = ?auto_28070 ?auto_28073 ) ) ( not ( = ?auto_28071 ?auto_28072 ) ) ( not ( = ?auto_28071 ?auto_28073 ) ) ( not ( = ?auto_28072 ?auto_28073 ) ) ( not ( = ?auto_28070 ?auto_28074 ) ) ( not ( = ?auto_28071 ?auto_28074 ) ) ( not ( = ?auto_28072 ?auto_28074 ) ) ( not ( = ?auto_28073 ?auto_28074 ) ) ( ON ?auto_28074 ?auto_28075 ) ( not ( = ?auto_28070 ?auto_28075 ) ) ( not ( = ?auto_28071 ?auto_28075 ) ) ( not ( = ?auto_28072 ?auto_28075 ) ) ( not ( = ?auto_28073 ?auto_28075 ) ) ( not ( = ?auto_28074 ?auto_28075 ) ) ( ON ?auto_28073 ?auto_28074 ) ( ON ?auto_28072 ?auto_28073 ) ( ON-TABLE ?auto_28075 ) ( CLEAR ?auto_28070 ) ( ON ?auto_28071 ?auto_28072 ) ( CLEAR ?auto_28071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28075 ?auto_28074 ?auto_28073 ?auto_28072 )
      ( MAKE-3PILE ?auto_28070 ?auto_28071 ?auto_28072 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28076 - BLOCK
      ?auto_28077 - BLOCK
      ?auto_28078 - BLOCK
    )
    :vars
    (
      ?auto_28080 - BLOCK
      ?auto_28079 - BLOCK
      ?auto_28081 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28076 ?auto_28077 ) ) ( not ( = ?auto_28076 ?auto_28078 ) ) ( not ( = ?auto_28076 ?auto_28080 ) ) ( not ( = ?auto_28077 ?auto_28078 ) ) ( not ( = ?auto_28077 ?auto_28080 ) ) ( not ( = ?auto_28078 ?auto_28080 ) ) ( not ( = ?auto_28076 ?auto_28079 ) ) ( not ( = ?auto_28077 ?auto_28079 ) ) ( not ( = ?auto_28078 ?auto_28079 ) ) ( not ( = ?auto_28080 ?auto_28079 ) ) ( ON ?auto_28079 ?auto_28081 ) ( not ( = ?auto_28076 ?auto_28081 ) ) ( not ( = ?auto_28077 ?auto_28081 ) ) ( not ( = ?auto_28078 ?auto_28081 ) ) ( not ( = ?auto_28080 ?auto_28081 ) ) ( not ( = ?auto_28079 ?auto_28081 ) ) ( ON ?auto_28080 ?auto_28079 ) ( ON ?auto_28078 ?auto_28080 ) ( ON-TABLE ?auto_28081 ) ( ON ?auto_28077 ?auto_28078 ) ( CLEAR ?auto_28077 ) ( HOLDING ?auto_28076 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28076 )
      ( MAKE-3PILE ?auto_28076 ?auto_28077 ?auto_28078 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28082 - BLOCK
      ?auto_28083 - BLOCK
      ?auto_28084 - BLOCK
    )
    :vars
    (
      ?auto_28086 - BLOCK
      ?auto_28085 - BLOCK
      ?auto_28087 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28082 ?auto_28083 ) ) ( not ( = ?auto_28082 ?auto_28084 ) ) ( not ( = ?auto_28082 ?auto_28086 ) ) ( not ( = ?auto_28083 ?auto_28084 ) ) ( not ( = ?auto_28083 ?auto_28086 ) ) ( not ( = ?auto_28084 ?auto_28086 ) ) ( not ( = ?auto_28082 ?auto_28085 ) ) ( not ( = ?auto_28083 ?auto_28085 ) ) ( not ( = ?auto_28084 ?auto_28085 ) ) ( not ( = ?auto_28086 ?auto_28085 ) ) ( ON ?auto_28085 ?auto_28087 ) ( not ( = ?auto_28082 ?auto_28087 ) ) ( not ( = ?auto_28083 ?auto_28087 ) ) ( not ( = ?auto_28084 ?auto_28087 ) ) ( not ( = ?auto_28086 ?auto_28087 ) ) ( not ( = ?auto_28085 ?auto_28087 ) ) ( ON ?auto_28086 ?auto_28085 ) ( ON ?auto_28084 ?auto_28086 ) ( ON-TABLE ?auto_28087 ) ( ON ?auto_28083 ?auto_28084 ) ( ON ?auto_28082 ?auto_28083 ) ( CLEAR ?auto_28082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28087 ?auto_28085 ?auto_28086 ?auto_28084 ?auto_28083 )
      ( MAKE-3PILE ?auto_28082 ?auto_28083 ?auto_28084 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28090 - BLOCK
      ?auto_28091 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_28091 ) ( CLEAR ?auto_28090 ) ( ON-TABLE ?auto_28090 ) ( not ( = ?auto_28090 ?auto_28091 ) ) )
    :subtasks
    ( ( !STACK ?auto_28091 ?auto_28090 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28092 - BLOCK
      ?auto_28093 - BLOCK
    )
    :vars
    (
      ?auto_28094 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_28092 ) ( ON-TABLE ?auto_28092 ) ( not ( = ?auto_28092 ?auto_28093 ) ) ( ON ?auto_28093 ?auto_28094 ) ( CLEAR ?auto_28093 ) ( HAND-EMPTY ) ( not ( = ?auto_28092 ?auto_28094 ) ) ( not ( = ?auto_28093 ?auto_28094 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28093 ?auto_28094 )
      ( MAKE-2PILE ?auto_28092 ?auto_28093 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28095 - BLOCK
      ?auto_28096 - BLOCK
    )
    :vars
    (
      ?auto_28097 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28095 ?auto_28096 ) ) ( ON ?auto_28096 ?auto_28097 ) ( CLEAR ?auto_28096 ) ( not ( = ?auto_28095 ?auto_28097 ) ) ( not ( = ?auto_28096 ?auto_28097 ) ) ( HOLDING ?auto_28095 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28095 )
      ( MAKE-2PILE ?auto_28095 ?auto_28096 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28098 - BLOCK
      ?auto_28099 - BLOCK
    )
    :vars
    (
      ?auto_28100 - BLOCK
      ?auto_28102 - BLOCK
      ?auto_28101 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28098 ?auto_28099 ) ) ( ON ?auto_28099 ?auto_28100 ) ( not ( = ?auto_28098 ?auto_28100 ) ) ( not ( = ?auto_28099 ?auto_28100 ) ) ( ON ?auto_28098 ?auto_28099 ) ( CLEAR ?auto_28098 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28102 ) ( ON ?auto_28101 ?auto_28102 ) ( ON ?auto_28100 ?auto_28101 ) ( not ( = ?auto_28102 ?auto_28101 ) ) ( not ( = ?auto_28102 ?auto_28100 ) ) ( not ( = ?auto_28102 ?auto_28099 ) ) ( not ( = ?auto_28102 ?auto_28098 ) ) ( not ( = ?auto_28101 ?auto_28100 ) ) ( not ( = ?auto_28101 ?auto_28099 ) ) ( not ( = ?auto_28101 ?auto_28098 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28102 ?auto_28101 ?auto_28100 ?auto_28099 )
      ( MAKE-2PILE ?auto_28098 ?auto_28099 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28103 - BLOCK
      ?auto_28104 - BLOCK
    )
    :vars
    (
      ?auto_28105 - BLOCK
      ?auto_28107 - BLOCK
      ?auto_28106 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28103 ?auto_28104 ) ) ( ON ?auto_28104 ?auto_28105 ) ( not ( = ?auto_28103 ?auto_28105 ) ) ( not ( = ?auto_28104 ?auto_28105 ) ) ( ON-TABLE ?auto_28107 ) ( ON ?auto_28106 ?auto_28107 ) ( ON ?auto_28105 ?auto_28106 ) ( not ( = ?auto_28107 ?auto_28106 ) ) ( not ( = ?auto_28107 ?auto_28105 ) ) ( not ( = ?auto_28107 ?auto_28104 ) ) ( not ( = ?auto_28107 ?auto_28103 ) ) ( not ( = ?auto_28106 ?auto_28105 ) ) ( not ( = ?auto_28106 ?auto_28104 ) ) ( not ( = ?auto_28106 ?auto_28103 ) ) ( HOLDING ?auto_28103 ) ( CLEAR ?auto_28104 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28107 ?auto_28106 ?auto_28105 ?auto_28104 ?auto_28103 )
      ( MAKE-2PILE ?auto_28103 ?auto_28104 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28108 - BLOCK
      ?auto_28109 - BLOCK
    )
    :vars
    (
      ?auto_28110 - BLOCK
      ?auto_28112 - BLOCK
      ?auto_28111 - BLOCK
      ?auto_28113 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28108 ?auto_28109 ) ) ( ON ?auto_28109 ?auto_28110 ) ( not ( = ?auto_28108 ?auto_28110 ) ) ( not ( = ?auto_28109 ?auto_28110 ) ) ( ON-TABLE ?auto_28112 ) ( ON ?auto_28111 ?auto_28112 ) ( ON ?auto_28110 ?auto_28111 ) ( not ( = ?auto_28112 ?auto_28111 ) ) ( not ( = ?auto_28112 ?auto_28110 ) ) ( not ( = ?auto_28112 ?auto_28109 ) ) ( not ( = ?auto_28112 ?auto_28108 ) ) ( not ( = ?auto_28111 ?auto_28110 ) ) ( not ( = ?auto_28111 ?auto_28109 ) ) ( not ( = ?auto_28111 ?auto_28108 ) ) ( CLEAR ?auto_28109 ) ( ON ?auto_28108 ?auto_28113 ) ( CLEAR ?auto_28108 ) ( HAND-EMPTY ) ( not ( = ?auto_28108 ?auto_28113 ) ) ( not ( = ?auto_28109 ?auto_28113 ) ) ( not ( = ?auto_28110 ?auto_28113 ) ) ( not ( = ?auto_28112 ?auto_28113 ) ) ( not ( = ?auto_28111 ?auto_28113 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28108 ?auto_28113 )
      ( MAKE-2PILE ?auto_28108 ?auto_28109 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28114 - BLOCK
      ?auto_28115 - BLOCK
    )
    :vars
    (
      ?auto_28118 - BLOCK
      ?auto_28116 - BLOCK
      ?auto_28117 - BLOCK
      ?auto_28119 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28114 ?auto_28115 ) ) ( not ( = ?auto_28114 ?auto_28118 ) ) ( not ( = ?auto_28115 ?auto_28118 ) ) ( ON-TABLE ?auto_28116 ) ( ON ?auto_28117 ?auto_28116 ) ( ON ?auto_28118 ?auto_28117 ) ( not ( = ?auto_28116 ?auto_28117 ) ) ( not ( = ?auto_28116 ?auto_28118 ) ) ( not ( = ?auto_28116 ?auto_28115 ) ) ( not ( = ?auto_28116 ?auto_28114 ) ) ( not ( = ?auto_28117 ?auto_28118 ) ) ( not ( = ?auto_28117 ?auto_28115 ) ) ( not ( = ?auto_28117 ?auto_28114 ) ) ( ON ?auto_28114 ?auto_28119 ) ( CLEAR ?auto_28114 ) ( not ( = ?auto_28114 ?auto_28119 ) ) ( not ( = ?auto_28115 ?auto_28119 ) ) ( not ( = ?auto_28118 ?auto_28119 ) ) ( not ( = ?auto_28116 ?auto_28119 ) ) ( not ( = ?auto_28117 ?auto_28119 ) ) ( HOLDING ?auto_28115 ) ( CLEAR ?auto_28118 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28116 ?auto_28117 ?auto_28118 ?auto_28115 )
      ( MAKE-2PILE ?auto_28114 ?auto_28115 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28120 - BLOCK
      ?auto_28121 - BLOCK
    )
    :vars
    (
      ?auto_28125 - BLOCK
      ?auto_28124 - BLOCK
      ?auto_28123 - BLOCK
      ?auto_28122 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28120 ?auto_28121 ) ) ( not ( = ?auto_28120 ?auto_28125 ) ) ( not ( = ?auto_28121 ?auto_28125 ) ) ( ON-TABLE ?auto_28124 ) ( ON ?auto_28123 ?auto_28124 ) ( ON ?auto_28125 ?auto_28123 ) ( not ( = ?auto_28124 ?auto_28123 ) ) ( not ( = ?auto_28124 ?auto_28125 ) ) ( not ( = ?auto_28124 ?auto_28121 ) ) ( not ( = ?auto_28124 ?auto_28120 ) ) ( not ( = ?auto_28123 ?auto_28125 ) ) ( not ( = ?auto_28123 ?auto_28121 ) ) ( not ( = ?auto_28123 ?auto_28120 ) ) ( ON ?auto_28120 ?auto_28122 ) ( not ( = ?auto_28120 ?auto_28122 ) ) ( not ( = ?auto_28121 ?auto_28122 ) ) ( not ( = ?auto_28125 ?auto_28122 ) ) ( not ( = ?auto_28124 ?auto_28122 ) ) ( not ( = ?auto_28123 ?auto_28122 ) ) ( CLEAR ?auto_28125 ) ( ON ?auto_28121 ?auto_28120 ) ( CLEAR ?auto_28121 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28122 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28122 ?auto_28120 )
      ( MAKE-2PILE ?auto_28120 ?auto_28121 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28126 - BLOCK
      ?auto_28127 - BLOCK
    )
    :vars
    (
      ?auto_28131 - BLOCK
      ?auto_28129 - BLOCK
      ?auto_28128 - BLOCK
      ?auto_28130 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28126 ?auto_28127 ) ) ( not ( = ?auto_28126 ?auto_28131 ) ) ( not ( = ?auto_28127 ?auto_28131 ) ) ( ON-TABLE ?auto_28129 ) ( ON ?auto_28128 ?auto_28129 ) ( not ( = ?auto_28129 ?auto_28128 ) ) ( not ( = ?auto_28129 ?auto_28131 ) ) ( not ( = ?auto_28129 ?auto_28127 ) ) ( not ( = ?auto_28129 ?auto_28126 ) ) ( not ( = ?auto_28128 ?auto_28131 ) ) ( not ( = ?auto_28128 ?auto_28127 ) ) ( not ( = ?auto_28128 ?auto_28126 ) ) ( ON ?auto_28126 ?auto_28130 ) ( not ( = ?auto_28126 ?auto_28130 ) ) ( not ( = ?auto_28127 ?auto_28130 ) ) ( not ( = ?auto_28131 ?auto_28130 ) ) ( not ( = ?auto_28129 ?auto_28130 ) ) ( not ( = ?auto_28128 ?auto_28130 ) ) ( ON ?auto_28127 ?auto_28126 ) ( CLEAR ?auto_28127 ) ( ON-TABLE ?auto_28130 ) ( HOLDING ?auto_28131 ) ( CLEAR ?auto_28128 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28129 ?auto_28128 ?auto_28131 )
      ( MAKE-2PILE ?auto_28126 ?auto_28127 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28132 - BLOCK
      ?auto_28133 - BLOCK
    )
    :vars
    (
      ?auto_28135 - BLOCK
      ?auto_28136 - BLOCK
      ?auto_28134 - BLOCK
      ?auto_28137 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28132 ?auto_28133 ) ) ( not ( = ?auto_28132 ?auto_28135 ) ) ( not ( = ?auto_28133 ?auto_28135 ) ) ( ON-TABLE ?auto_28136 ) ( ON ?auto_28134 ?auto_28136 ) ( not ( = ?auto_28136 ?auto_28134 ) ) ( not ( = ?auto_28136 ?auto_28135 ) ) ( not ( = ?auto_28136 ?auto_28133 ) ) ( not ( = ?auto_28136 ?auto_28132 ) ) ( not ( = ?auto_28134 ?auto_28135 ) ) ( not ( = ?auto_28134 ?auto_28133 ) ) ( not ( = ?auto_28134 ?auto_28132 ) ) ( ON ?auto_28132 ?auto_28137 ) ( not ( = ?auto_28132 ?auto_28137 ) ) ( not ( = ?auto_28133 ?auto_28137 ) ) ( not ( = ?auto_28135 ?auto_28137 ) ) ( not ( = ?auto_28136 ?auto_28137 ) ) ( not ( = ?auto_28134 ?auto_28137 ) ) ( ON ?auto_28133 ?auto_28132 ) ( ON-TABLE ?auto_28137 ) ( CLEAR ?auto_28134 ) ( ON ?auto_28135 ?auto_28133 ) ( CLEAR ?auto_28135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28137 ?auto_28132 ?auto_28133 )
      ( MAKE-2PILE ?auto_28132 ?auto_28133 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28138 - BLOCK
      ?auto_28139 - BLOCK
    )
    :vars
    (
      ?auto_28141 - BLOCK
      ?auto_28143 - BLOCK
      ?auto_28140 - BLOCK
      ?auto_28142 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28138 ?auto_28139 ) ) ( not ( = ?auto_28138 ?auto_28141 ) ) ( not ( = ?auto_28139 ?auto_28141 ) ) ( ON-TABLE ?auto_28143 ) ( not ( = ?auto_28143 ?auto_28140 ) ) ( not ( = ?auto_28143 ?auto_28141 ) ) ( not ( = ?auto_28143 ?auto_28139 ) ) ( not ( = ?auto_28143 ?auto_28138 ) ) ( not ( = ?auto_28140 ?auto_28141 ) ) ( not ( = ?auto_28140 ?auto_28139 ) ) ( not ( = ?auto_28140 ?auto_28138 ) ) ( ON ?auto_28138 ?auto_28142 ) ( not ( = ?auto_28138 ?auto_28142 ) ) ( not ( = ?auto_28139 ?auto_28142 ) ) ( not ( = ?auto_28141 ?auto_28142 ) ) ( not ( = ?auto_28143 ?auto_28142 ) ) ( not ( = ?auto_28140 ?auto_28142 ) ) ( ON ?auto_28139 ?auto_28138 ) ( ON-TABLE ?auto_28142 ) ( ON ?auto_28141 ?auto_28139 ) ( CLEAR ?auto_28141 ) ( HOLDING ?auto_28140 ) ( CLEAR ?auto_28143 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28143 ?auto_28140 )
      ( MAKE-2PILE ?auto_28138 ?auto_28139 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28144 - BLOCK
      ?auto_28145 - BLOCK
    )
    :vars
    (
      ?auto_28146 - BLOCK
      ?auto_28149 - BLOCK
      ?auto_28148 - BLOCK
      ?auto_28147 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28144 ?auto_28145 ) ) ( not ( = ?auto_28144 ?auto_28146 ) ) ( not ( = ?auto_28145 ?auto_28146 ) ) ( ON-TABLE ?auto_28149 ) ( not ( = ?auto_28149 ?auto_28148 ) ) ( not ( = ?auto_28149 ?auto_28146 ) ) ( not ( = ?auto_28149 ?auto_28145 ) ) ( not ( = ?auto_28149 ?auto_28144 ) ) ( not ( = ?auto_28148 ?auto_28146 ) ) ( not ( = ?auto_28148 ?auto_28145 ) ) ( not ( = ?auto_28148 ?auto_28144 ) ) ( ON ?auto_28144 ?auto_28147 ) ( not ( = ?auto_28144 ?auto_28147 ) ) ( not ( = ?auto_28145 ?auto_28147 ) ) ( not ( = ?auto_28146 ?auto_28147 ) ) ( not ( = ?auto_28149 ?auto_28147 ) ) ( not ( = ?auto_28148 ?auto_28147 ) ) ( ON ?auto_28145 ?auto_28144 ) ( ON-TABLE ?auto_28147 ) ( ON ?auto_28146 ?auto_28145 ) ( CLEAR ?auto_28149 ) ( ON ?auto_28148 ?auto_28146 ) ( CLEAR ?auto_28148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28147 ?auto_28144 ?auto_28145 ?auto_28146 )
      ( MAKE-2PILE ?auto_28144 ?auto_28145 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28150 - BLOCK
      ?auto_28151 - BLOCK
    )
    :vars
    (
      ?auto_28154 - BLOCK
      ?auto_28152 - BLOCK
      ?auto_28153 - BLOCK
      ?auto_28155 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28150 ?auto_28151 ) ) ( not ( = ?auto_28150 ?auto_28154 ) ) ( not ( = ?auto_28151 ?auto_28154 ) ) ( not ( = ?auto_28152 ?auto_28153 ) ) ( not ( = ?auto_28152 ?auto_28154 ) ) ( not ( = ?auto_28152 ?auto_28151 ) ) ( not ( = ?auto_28152 ?auto_28150 ) ) ( not ( = ?auto_28153 ?auto_28154 ) ) ( not ( = ?auto_28153 ?auto_28151 ) ) ( not ( = ?auto_28153 ?auto_28150 ) ) ( ON ?auto_28150 ?auto_28155 ) ( not ( = ?auto_28150 ?auto_28155 ) ) ( not ( = ?auto_28151 ?auto_28155 ) ) ( not ( = ?auto_28154 ?auto_28155 ) ) ( not ( = ?auto_28152 ?auto_28155 ) ) ( not ( = ?auto_28153 ?auto_28155 ) ) ( ON ?auto_28151 ?auto_28150 ) ( ON-TABLE ?auto_28155 ) ( ON ?auto_28154 ?auto_28151 ) ( ON ?auto_28153 ?auto_28154 ) ( CLEAR ?auto_28153 ) ( HOLDING ?auto_28152 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28152 )
      ( MAKE-2PILE ?auto_28150 ?auto_28151 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28156 - BLOCK
      ?auto_28157 - BLOCK
    )
    :vars
    (
      ?auto_28158 - BLOCK
      ?auto_28159 - BLOCK
      ?auto_28160 - BLOCK
      ?auto_28161 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28156 ?auto_28157 ) ) ( not ( = ?auto_28156 ?auto_28158 ) ) ( not ( = ?auto_28157 ?auto_28158 ) ) ( not ( = ?auto_28159 ?auto_28160 ) ) ( not ( = ?auto_28159 ?auto_28158 ) ) ( not ( = ?auto_28159 ?auto_28157 ) ) ( not ( = ?auto_28159 ?auto_28156 ) ) ( not ( = ?auto_28160 ?auto_28158 ) ) ( not ( = ?auto_28160 ?auto_28157 ) ) ( not ( = ?auto_28160 ?auto_28156 ) ) ( ON ?auto_28156 ?auto_28161 ) ( not ( = ?auto_28156 ?auto_28161 ) ) ( not ( = ?auto_28157 ?auto_28161 ) ) ( not ( = ?auto_28158 ?auto_28161 ) ) ( not ( = ?auto_28159 ?auto_28161 ) ) ( not ( = ?auto_28160 ?auto_28161 ) ) ( ON ?auto_28157 ?auto_28156 ) ( ON-TABLE ?auto_28161 ) ( ON ?auto_28158 ?auto_28157 ) ( ON ?auto_28160 ?auto_28158 ) ( ON ?auto_28159 ?auto_28160 ) ( CLEAR ?auto_28159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28161 ?auto_28156 ?auto_28157 ?auto_28158 ?auto_28160 )
      ( MAKE-2PILE ?auto_28156 ?auto_28157 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28164 - BLOCK
      ?auto_28165 - BLOCK
    )
    :vars
    (
      ?auto_28166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28166 ?auto_28165 ) ( CLEAR ?auto_28166 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28164 ) ( ON ?auto_28165 ?auto_28164 ) ( not ( = ?auto_28164 ?auto_28165 ) ) ( not ( = ?auto_28164 ?auto_28166 ) ) ( not ( = ?auto_28165 ?auto_28166 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28166 ?auto_28165 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28167 - BLOCK
      ?auto_28168 - BLOCK
    )
    :vars
    (
      ?auto_28169 - BLOCK
      ?auto_28170 - BLOCK
      ?auto_28171 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28169 ?auto_28168 ) ( CLEAR ?auto_28169 ) ( ON-TABLE ?auto_28167 ) ( ON ?auto_28168 ?auto_28167 ) ( not ( = ?auto_28167 ?auto_28168 ) ) ( not ( = ?auto_28167 ?auto_28169 ) ) ( not ( = ?auto_28168 ?auto_28169 ) ) ( HOLDING ?auto_28170 ) ( CLEAR ?auto_28171 ) ( not ( = ?auto_28167 ?auto_28170 ) ) ( not ( = ?auto_28167 ?auto_28171 ) ) ( not ( = ?auto_28168 ?auto_28170 ) ) ( not ( = ?auto_28168 ?auto_28171 ) ) ( not ( = ?auto_28169 ?auto_28170 ) ) ( not ( = ?auto_28169 ?auto_28171 ) ) ( not ( = ?auto_28170 ?auto_28171 ) ) )
    :subtasks
    ( ( !STACK ?auto_28170 ?auto_28171 )
      ( MAKE-2PILE ?auto_28167 ?auto_28168 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28172 - BLOCK
      ?auto_28173 - BLOCK
    )
    :vars
    (
      ?auto_28174 - BLOCK
      ?auto_28176 - BLOCK
      ?auto_28175 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28174 ?auto_28173 ) ( ON-TABLE ?auto_28172 ) ( ON ?auto_28173 ?auto_28172 ) ( not ( = ?auto_28172 ?auto_28173 ) ) ( not ( = ?auto_28172 ?auto_28174 ) ) ( not ( = ?auto_28173 ?auto_28174 ) ) ( CLEAR ?auto_28176 ) ( not ( = ?auto_28172 ?auto_28175 ) ) ( not ( = ?auto_28172 ?auto_28176 ) ) ( not ( = ?auto_28173 ?auto_28175 ) ) ( not ( = ?auto_28173 ?auto_28176 ) ) ( not ( = ?auto_28174 ?auto_28175 ) ) ( not ( = ?auto_28174 ?auto_28176 ) ) ( not ( = ?auto_28175 ?auto_28176 ) ) ( ON ?auto_28175 ?auto_28174 ) ( CLEAR ?auto_28175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28172 ?auto_28173 ?auto_28174 )
      ( MAKE-2PILE ?auto_28172 ?auto_28173 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28177 - BLOCK
      ?auto_28178 - BLOCK
    )
    :vars
    (
      ?auto_28181 - BLOCK
      ?auto_28179 - BLOCK
      ?auto_28180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28181 ?auto_28178 ) ( ON-TABLE ?auto_28177 ) ( ON ?auto_28178 ?auto_28177 ) ( not ( = ?auto_28177 ?auto_28178 ) ) ( not ( = ?auto_28177 ?auto_28181 ) ) ( not ( = ?auto_28178 ?auto_28181 ) ) ( not ( = ?auto_28177 ?auto_28179 ) ) ( not ( = ?auto_28177 ?auto_28180 ) ) ( not ( = ?auto_28178 ?auto_28179 ) ) ( not ( = ?auto_28178 ?auto_28180 ) ) ( not ( = ?auto_28181 ?auto_28179 ) ) ( not ( = ?auto_28181 ?auto_28180 ) ) ( not ( = ?auto_28179 ?auto_28180 ) ) ( ON ?auto_28179 ?auto_28181 ) ( CLEAR ?auto_28179 ) ( HOLDING ?auto_28180 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28180 )
      ( MAKE-2PILE ?auto_28177 ?auto_28178 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28182 - BLOCK
      ?auto_28183 - BLOCK
    )
    :vars
    (
      ?auto_28185 - BLOCK
      ?auto_28186 - BLOCK
      ?auto_28184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28185 ?auto_28183 ) ( ON-TABLE ?auto_28182 ) ( ON ?auto_28183 ?auto_28182 ) ( not ( = ?auto_28182 ?auto_28183 ) ) ( not ( = ?auto_28182 ?auto_28185 ) ) ( not ( = ?auto_28183 ?auto_28185 ) ) ( not ( = ?auto_28182 ?auto_28186 ) ) ( not ( = ?auto_28182 ?auto_28184 ) ) ( not ( = ?auto_28183 ?auto_28186 ) ) ( not ( = ?auto_28183 ?auto_28184 ) ) ( not ( = ?auto_28185 ?auto_28186 ) ) ( not ( = ?auto_28185 ?auto_28184 ) ) ( not ( = ?auto_28186 ?auto_28184 ) ) ( ON ?auto_28186 ?auto_28185 ) ( ON ?auto_28184 ?auto_28186 ) ( CLEAR ?auto_28184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28182 ?auto_28183 ?auto_28185 ?auto_28186 )
      ( MAKE-2PILE ?auto_28182 ?auto_28183 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28187 - BLOCK
      ?auto_28188 - BLOCK
    )
    :vars
    (
      ?auto_28189 - BLOCK
      ?auto_28190 - BLOCK
      ?auto_28191 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28189 ?auto_28188 ) ( ON-TABLE ?auto_28187 ) ( ON ?auto_28188 ?auto_28187 ) ( not ( = ?auto_28187 ?auto_28188 ) ) ( not ( = ?auto_28187 ?auto_28189 ) ) ( not ( = ?auto_28188 ?auto_28189 ) ) ( not ( = ?auto_28187 ?auto_28190 ) ) ( not ( = ?auto_28187 ?auto_28191 ) ) ( not ( = ?auto_28188 ?auto_28190 ) ) ( not ( = ?auto_28188 ?auto_28191 ) ) ( not ( = ?auto_28189 ?auto_28190 ) ) ( not ( = ?auto_28189 ?auto_28191 ) ) ( not ( = ?auto_28190 ?auto_28191 ) ) ( ON ?auto_28190 ?auto_28189 ) ( HOLDING ?auto_28191 ) ( CLEAR ?auto_28190 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28187 ?auto_28188 ?auto_28189 ?auto_28190 ?auto_28191 )
      ( MAKE-2PILE ?auto_28187 ?auto_28188 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28192 - BLOCK
      ?auto_28193 - BLOCK
    )
    :vars
    (
      ?auto_28195 - BLOCK
      ?auto_28196 - BLOCK
      ?auto_28194 - BLOCK
      ?auto_28197 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28195 ?auto_28193 ) ( ON-TABLE ?auto_28192 ) ( ON ?auto_28193 ?auto_28192 ) ( not ( = ?auto_28192 ?auto_28193 ) ) ( not ( = ?auto_28192 ?auto_28195 ) ) ( not ( = ?auto_28193 ?auto_28195 ) ) ( not ( = ?auto_28192 ?auto_28196 ) ) ( not ( = ?auto_28192 ?auto_28194 ) ) ( not ( = ?auto_28193 ?auto_28196 ) ) ( not ( = ?auto_28193 ?auto_28194 ) ) ( not ( = ?auto_28195 ?auto_28196 ) ) ( not ( = ?auto_28195 ?auto_28194 ) ) ( not ( = ?auto_28196 ?auto_28194 ) ) ( ON ?auto_28196 ?auto_28195 ) ( CLEAR ?auto_28196 ) ( ON ?auto_28194 ?auto_28197 ) ( CLEAR ?auto_28194 ) ( HAND-EMPTY ) ( not ( = ?auto_28192 ?auto_28197 ) ) ( not ( = ?auto_28193 ?auto_28197 ) ) ( not ( = ?auto_28195 ?auto_28197 ) ) ( not ( = ?auto_28196 ?auto_28197 ) ) ( not ( = ?auto_28194 ?auto_28197 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28194 ?auto_28197 )
      ( MAKE-2PILE ?auto_28192 ?auto_28193 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28198 - BLOCK
      ?auto_28199 - BLOCK
    )
    :vars
    (
      ?auto_28203 - BLOCK
      ?auto_28200 - BLOCK
      ?auto_28201 - BLOCK
      ?auto_28202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28203 ?auto_28199 ) ( ON-TABLE ?auto_28198 ) ( ON ?auto_28199 ?auto_28198 ) ( not ( = ?auto_28198 ?auto_28199 ) ) ( not ( = ?auto_28198 ?auto_28203 ) ) ( not ( = ?auto_28199 ?auto_28203 ) ) ( not ( = ?auto_28198 ?auto_28200 ) ) ( not ( = ?auto_28198 ?auto_28201 ) ) ( not ( = ?auto_28199 ?auto_28200 ) ) ( not ( = ?auto_28199 ?auto_28201 ) ) ( not ( = ?auto_28203 ?auto_28200 ) ) ( not ( = ?auto_28203 ?auto_28201 ) ) ( not ( = ?auto_28200 ?auto_28201 ) ) ( ON ?auto_28201 ?auto_28202 ) ( CLEAR ?auto_28201 ) ( not ( = ?auto_28198 ?auto_28202 ) ) ( not ( = ?auto_28199 ?auto_28202 ) ) ( not ( = ?auto_28203 ?auto_28202 ) ) ( not ( = ?auto_28200 ?auto_28202 ) ) ( not ( = ?auto_28201 ?auto_28202 ) ) ( HOLDING ?auto_28200 ) ( CLEAR ?auto_28203 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28198 ?auto_28199 ?auto_28203 ?auto_28200 )
      ( MAKE-2PILE ?auto_28198 ?auto_28199 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28204 - BLOCK
      ?auto_28205 - BLOCK
    )
    :vars
    (
      ?auto_28206 - BLOCK
      ?auto_28207 - BLOCK
      ?auto_28208 - BLOCK
      ?auto_28209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28206 ?auto_28205 ) ( ON-TABLE ?auto_28204 ) ( ON ?auto_28205 ?auto_28204 ) ( not ( = ?auto_28204 ?auto_28205 ) ) ( not ( = ?auto_28204 ?auto_28206 ) ) ( not ( = ?auto_28205 ?auto_28206 ) ) ( not ( = ?auto_28204 ?auto_28207 ) ) ( not ( = ?auto_28204 ?auto_28208 ) ) ( not ( = ?auto_28205 ?auto_28207 ) ) ( not ( = ?auto_28205 ?auto_28208 ) ) ( not ( = ?auto_28206 ?auto_28207 ) ) ( not ( = ?auto_28206 ?auto_28208 ) ) ( not ( = ?auto_28207 ?auto_28208 ) ) ( ON ?auto_28208 ?auto_28209 ) ( not ( = ?auto_28204 ?auto_28209 ) ) ( not ( = ?auto_28205 ?auto_28209 ) ) ( not ( = ?auto_28206 ?auto_28209 ) ) ( not ( = ?auto_28207 ?auto_28209 ) ) ( not ( = ?auto_28208 ?auto_28209 ) ) ( CLEAR ?auto_28206 ) ( ON ?auto_28207 ?auto_28208 ) ( CLEAR ?auto_28207 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28209 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28209 ?auto_28208 )
      ( MAKE-2PILE ?auto_28204 ?auto_28205 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28222 - BLOCK
      ?auto_28223 - BLOCK
    )
    :vars
    (
      ?auto_28225 - BLOCK
      ?auto_28226 - BLOCK
      ?auto_28224 - BLOCK
      ?auto_28227 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28222 ) ( not ( = ?auto_28222 ?auto_28223 ) ) ( not ( = ?auto_28222 ?auto_28225 ) ) ( not ( = ?auto_28223 ?auto_28225 ) ) ( not ( = ?auto_28222 ?auto_28226 ) ) ( not ( = ?auto_28222 ?auto_28224 ) ) ( not ( = ?auto_28223 ?auto_28226 ) ) ( not ( = ?auto_28223 ?auto_28224 ) ) ( not ( = ?auto_28225 ?auto_28226 ) ) ( not ( = ?auto_28225 ?auto_28224 ) ) ( not ( = ?auto_28226 ?auto_28224 ) ) ( ON ?auto_28224 ?auto_28227 ) ( not ( = ?auto_28222 ?auto_28227 ) ) ( not ( = ?auto_28223 ?auto_28227 ) ) ( not ( = ?auto_28225 ?auto_28227 ) ) ( not ( = ?auto_28226 ?auto_28227 ) ) ( not ( = ?auto_28224 ?auto_28227 ) ) ( ON ?auto_28226 ?auto_28224 ) ( ON-TABLE ?auto_28227 ) ( ON ?auto_28225 ?auto_28226 ) ( CLEAR ?auto_28225 ) ( HOLDING ?auto_28223 ) ( CLEAR ?auto_28222 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28222 ?auto_28223 ?auto_28225 )
      ( MAKE-2PILE ?auto_28222 ?auto_28223 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28228 - BLOCK
      ?auto_28229 - BLOCK
    )
    :vars
    (
      ?auto_28233 - BLOCK
      ?auto_28231 - BLOCK
      ?auto_28230 - BLOCK
      ?auto_28232 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28228 ) ( not ( = ?auto_28228 ?auto_28229 ) ) ( not ( = ?auto_28228 ?auto_28233 ) ) ( not ( = ?auto_28229 ?auto_28233 ) ) ( not ( = ?auto_28228 ?auto_28231 ) ) ( not ( = ?auto_28228 ?auto_28230 ) ) ( not ( = ?auto_28229 ?auto_28231 ) ) ( not ( = ?auto_28229 ?auto_28230 ) ) ( not ( = ?auto_28233 ?auto_28231 ) ) ( not ( = ?auto_28233 ?auto_28230 ) ) ( not ( = ?auto_28231 ?auto_28230 ) ) ( ON ?auto_28230 ?auto_28232 ) ( not ( = ?auto_28228 ?auto_28232 ) ) ( not ( = ?auto_28229 ?auto_28232 ) ) ( not ( = ?auto_28233 ?auto_28232 ) ) ( not ( = ?auto_28231 ?auto_28232 ) ) ( not ( = ?auto_28230 ?auto_28232 ) ) ( ON ?auto_28231 ?auto_28230 ) ( ON-TABLE ?auto_28232 ) ( ON ?auto_28233 ?auto_28231 ) ( CLEAR ?auto_28228 ) ( ON ?auto_28229 ?auto_28233 ) ( CLEAR ?auto_28229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28232 ?auto_28230 ?auto_28231 ?auto_28233 )
      ( MAKE-2PILE ?auto_28228 ?auto_28229 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28234 - BLOCK
      ?auto_28235 - BLOCK
    )
    :vars
    (
      ?auto_28239 - BLOCK
      ?auto_28236 - BLOCK
      ?auto_28238 - BLOCK
      ?auto_28237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28234 ?auto_28235 ) ) ( not ( = ?auto_28234 ?auto_28239 ) ) ( not ( = ?auto_28235 ?auto_28239 ) ) ( not ( = ?auto_28234 ?auto_28236 ) ) ( not ( = ?auto_28234 ?auto_28238 ) ) ( not ( = ?auto_28235 ?auto_28236 ) ) ( not ( = ?auto_28235 ?auto_28238 ) ) ( not ( = ?auto_28239 ?auto_28236 ) ) ( not ( = ?auto_28239 ?auto_28238 ) ) ( not ( = ?auto_28236 ?auto_28238 ) ) ( ON ?auto_28238 ?auto_28237 ) ( not ( = ?auto_28234 ?auto_28237 ) ) ( not ( = ?auto_28235 ?auto_28237 ) ) ( not ( = ?auto_28239 ?auto_28237 ) ) ( not ( = ?auto_28236 ?auto_28237 ) ) ( not ( = ?auto_28238 ?auto_28237 ) ) ( ON ?auto_28236 ?auto_28238 ) ( ON-TABLE ?auto_28237 ) ( ON ?auto_28239 ?auto_28236 ) ( ON ?auto_28235 ?auto_28239 ) ( CLEAR ?auto_28235 ) ( HOLDING ?auto_28234 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28234 )
      ( MAKE-2PILE ?auto_28234 ?auto_28235 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28240 - BLOCK
      ?auto_28241 - BLOCK
    )
    :vars
    (
      ?auto_28242 - BLOCK
      ?auto_28245 - BLOCK
      ?auto_28243 - BLOCK
      ?auto_28244 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28240 ?auto_28241 ) ) ( not ( = ?auto_28240 ?auto_28242 ) ) ( not ( = ?auto_28241 ?auto_28242 ) ) ( not ( = ?auto_28240 ?auto_28245 ) ) ( not ( = ?auto_28240 ?auto_28243 ) ) ( not ( = ?auto_28241 ?auto_28245 ) ) ( not ( = ?auto_28241 ?auto_28243 ) ) ( not ( = ?auto_28242 ?auto_28245 ) ) ( not ( = ?auto_28242 ?auto_28243 ) ) ( not ( = ?auto_28245 ?auto_28243 ) ) ( ON ?auto_28243 ?auto_28244 ) ( not ( = ?auto_28240 ?auto_28244 ) ) ( not ( = ?auto_28241 ?auto_28244 ) ) ( not ( = ?auto_28242 ?auto_28244 ) ) ( not ( = ?auto_28245 ?auto_28244 ) ) ( not ( = ?auto_28243 ?auto_28244 ) ) ( ON ?auto_28245 ?auto_28243 ) ( ON-TABLE ?auto_28244 ) ( ON ?auto_28242 ?auto_28245 ) ( ON ?auto_28241 ?auto_28242 ) ( ON ?auto_28240 ?auto_28241 ) ( CLEAR ?auto_28240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28244 ?auto_28243 ?auto_28245 ?auto_28242 ?auto_28241 )
      ( MAKE-2PILE ?auto_28240 ?auto_28241 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28249 - BLOCK
      ?auto_28250 - BLOCK
      ?auto_28251 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_28251 ) ( CLEAR ?auto_28250 ) ( ON-TABLE ?auto_28249 ) ( ON ?auto_28250 ?auto_28249 ) ( not ( = ?auto_28249 ?auto_28250 ) ) ( not ( = ?auto_28249 ?auto_28251 ) ) ( not ( = ?auto_28250 ?auto_28251 ) ) )
    :subtasks
    ( ( !STACK ?auto_28251 ?auto_28250 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28252 - BLOCK
      ?auto_28253 - BLOCK
      ?auto_28254 - BLOCK
    )
    :vars
    (
      ?auto_28255 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_28253 ) ( ON-TABLE ?auto_28252 ) ( ON ?auto_28253 ?auto_28252 ) ( not ( = ?auto_28252 ?auto_28253 ) ) ( not ( = ?auto_28252 ?auto_28254 ) ) ( not ( = ?auto_28253 ?auto_28254 ) ) ( ON ?auto_28254 ?auto_28255 ) ( CLEAR ?auto_28254 ) ( HAND-EMPTY ) ( not ( = ?auto_28252 ?auto_28255 ) ) ( not ( = ?auto_28253 ?auto_28255 ) ) ( not ( = ?auto_28254 ?auto_28255 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28254 ?auto_28255 )
      ( MAKE-3PILE ?auto_28252 ?auto_28253 ?auto_28254 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28256 - BLOCK
      ?auto_28257 - BLOCK
      ?auto_28258 - BLOCK
    )
    :vars
    (
      ?auto_28259 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28256 ) ( not ( = ?auto_28256 ?auto_28257 ) ) ( not ( = ?auto_28256 ?auto_28258 ) ) ( not ( = ?auto_28257 ?auto_28258 ) ) ( ON ?auto_28258 ?auto_28259 ) ( CLEAR ?auto_28258 ) ( not ( = ?auto_28256 ?auto_28259 ) ) ( not ( = ?auto_28257 ?auto_28259 ) ) ( not ( = ?auto_28258 ?auto_28259 ) ) ( HOLDING ?auto_28257 ) ( CLEAR ?auto_28256 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28256 ?auto_28257 )
      ( MAKE-3PILE ?auto_28256 ?auto_28257 ?auto_28258 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28260 - BLOCK
      ?auto_28261 - BLOCK
      ?auto_28262 - BLOCK
    )
    :vars
    (
      ?auto_28263 - BLOCK
      ?auto_28264 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28260 ) ( not ( = ?auto_28260 ?auto_28261 ) ) ( not ( = ?auto_28260 ?auto_28262 ) ) ( not ( = ?auto_28261 ?auto_28262 ) ) ( ON ?auto_28262 ?auto_28263 ) ( not ( = ?auto_28260 ?auto_28263 ) ) ( not ( = ?auto_28261 ?auto_28263 ) ) ( not ( = ?auto_28262 ?auto_28263 ) ) ( CLEAR ?auto_28260 ) ( ON ?auto_28261 ?auto_28262 ) ( CLEAR ?auto_28261 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28264 ) ( ON ?auto_28263 ?auto_28264 ) ( not ( = ?auto_28264 ?auto_28263 ) ) ( not ( = ?auto_28264 ?auto_28262 ) ) ( not ( = ?auto_28264 ?auto_28261 ) ) ( not ( = ?auto_28260 ?auto_28264 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28264 ?auto_28263 ?auto_28262 )
      ( MAKE-3PILE ?auto_28260 ?auto_28261 ?auto_28262 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28265 - BLOCK
      ?auto_28266 - BLOCK
      ?auto_28267 - BLOCK
    )
    :vars
    (
      ?auto_28269 - BLOCK
      ?auto_28268 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28265 ?auto_28266 ) ) ( not ( = ?auto_28265 ?auto_28267 ) ) ( not ( = ?auto_28266 ?auto_28267 ) ) ( ON ?auto_28267 ?auto_28269 ) ( not ( = ?auto_28265 ?auto_28269 ) ) ( not ( = ?auto_28266 ?auto_28269 ) ) ( not ( = ?auto_28267 ?auto_28269 ) ) ( ON ?auto_28266 ?auto_28267 ) ( CLEAR ?auto_28266 ) ( ON-TABLE ?auto_28268 ) ( ON ?auto_28269 ?auto_28268 ) ( not ( = ?auto_28268 ?auto_28269 ) ) ( not ( = ?auto_28268 ?auto_28267 ) ) ( not ( = ?auto_28268 ?auto_28266 ) ) ( not ( = ?auto_28265 ?auto_28268 ) ) ( HOLDING ?auto_28265 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28265 )
      ( MAKE-3PILE ?auto_28265 ?auto_28266 ?auto_28267 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28270 - BLOCK
      ?auto_28271 - BLOCK
      ?auto_28272 - BLOCK
    )
    :vars
    (
      ?auto_28273 - BLOCK
      ?auto_28274 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28270 ?auto_28271 ) ) ( not ( = ?auto_28270 ?auto_28272 ) ) ( not ( = ?auto_28271 ?auto_28272 ) ) ( ON ?auto_28272 ?auto_28273 ) ( not ( = ?auto_28270 ?auto_28273 ) ) ( not ( = ?auto_28271 ?auto_28273 ) ) ( not ( = ?auto_28272 ?auto_28273 ) ) ( ON ?auto_28271 ?auto_28272 ) ( ON-TABLE ?auto_28274 ) ( ON ?auto_28273 ?auto_28274 ) ( not ( = ?auto_28274 ?auto_28273 ) ) ( not ( = ?auto_28274 ?auto_28272 ) ) ( not ( = ?auto_28274 ?auto_28271 ) ) ( not ( = ?auto_28270 ?auto_28274 ) ) ( ON ?auto_28270 ?auto_28271 ) ( CLEAR ?auto_28270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28274 ?auto_28273 ?auto_28272 ?auto_28271 )
      ( MAKE-3PILE ?auto_28270 ?auto_28271 ?auto_28272 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28275 - BLOCK
      ?auto_28276 - BLOCK
      ?auto_28277 - BLOCK
    )
    :vars
    (
      ?auto_28279 - BLOCK
      ?auto_28278 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28275 ?auto_28276 ) ) ( not ( = ?auto_28275 ?auto_28277 ) ) ( not ( = ?auto_28276 ?auto_28277 ) ) ( ON ?auto_28277 ?auto_28279 ) ( not ( = ?auto_28275 ?auto_28279 ) ) ( not ( = ?auto_28276 ?auto_28279 ) ) ( not ( = ?auto_28277 ?auto_28279 ) ) ( ON ?auto_28276 ?auto_28277 ) ( ON-TABLE ?auto_28278 ) ( ON ?auto_28279 ?auto_28278 ) ( not ( = ?auto_28278 ?auto_28279 ) ) ( not ( = ?auto_28278 ?auto_28277 ) ) ( not ( = ?auto_28278 ?auto_28276 ) ) ( not ( = ?auto_28275 ?auto_28278 ) ) ( HOLDING ?auto_28275 ) ( CLEAR ?auto_28276 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28278 ?auto_28279 ?auto_28277 ?auto_28276 ?auto_28275 )
      ( MAKE-3PILE ?auto_28275 ?auto_28276 ?auto_28277 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28280 - BLOCK
      ?auto_28281 - BLOCK
      ?auto_28282 - BLOCK
    )
    :vars
    (
      ?auto_28284 - BLOCK
      ?auto_28283 - BLOCK
      ?auto_28285 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28280 ?auto_28281 ) ) ( not ( = ?auto_28280 ?auto_28282 ) ) ( not ( = ?auto_28281 ?auto_28282 ) ) ( ON ?auto_28282 ?auto_28284 ) ( not ( = ?auto_28280 ?auto_28284 ) ) ( not ( = ?auto_28281 ?auto_28284 ) ) ( not ( = ?auto_28282 ?auto_28284 ) ) ( ON ?auto_28281 ?auto_28282 ) ( ON-TABLE ?auto_28283 ) ( ON ?auto_28284 ?auto_28283 ) ( not ( = ?auto_28283 ?auto_28284 ) ) ( not ( = ?auto_28283 ?auto_28282 ) ) ( not ( = ?auto_28283 ?auto_28281 ) ) ( not ( = ?auto_28280 ?auto_28283 ) ) ( CLEAR ?auto_28281 ) ( ON ?auto_28280 ?auto_28285 ) ( CLEAR ?auto_28280 ) ( HAND-EMPTY ) ( not ( = ?auto_28280 ?auto_28285 ) ) ( not ( = ?auto_28281 ?auto_28285 ) ) ( not ( = ?auto_28282 ?auto_28285 ) ) ( not ( = ?auto_28284 ?auto_28285 ) ) ( not ( = ?auto_28283 ?auto_28285 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28280 ?auto_28285 )
      ( MAKE-3PILE ?auto_28280 ?auto_28281 ?auto_28282 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28286 - BLOCK
      ?auto_28287 - BLOCK
      ?auto_28288 - BLOCK
    )
    :vars
    (
      ?auto_28290 - BLOCK
      ?auto_28291 - BLOCK
      ?auto_28289 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28286 ?auto_28287 ) ) ( not ( = ?auto_28286 ?auto_28288 ) ) ( not ( = ?auto_28287 ?auto_28288 ) ) ( ON ?auto_28288 ?auto_28290 ) ( not ( = ?auto_28286 ?auto_28290 ) ) ( not ( = ?auto_28287 ?auto_28290 ) ) ( not ( = ?auto_28288 ?auto_28290 ) ) ( ON-TABLE ?auto_28291 ) ( ON ?auto_28290 ?auto_28291 ) ( not ( = ?auto_28291 ?auto_28290 ) ) ( not ( = ?auto_28291 ?auto_28288 ) ) ( not ( = ?auto_28291 ?auto_28287 ) ) ( not ( = ?auto_28286 ?auto_28291 ) ) ( ON ?auto_28286 ?auto_28289 ) ( CLEAR ?auto_28286 ) ( not ( = ?auto_28286 ?auto_28289 ) ) ( not ( = ?auto_28287 ?auto_28289 ) ) ( not ( = ?auto_28288 ?auto_28289 ) ) ( not ( = ?auto_28290 ?auto_28289 ) ) ( not ( = ?auto_28291 ?auto_28289 ) ) ( HOLDING ?auto_28287 ) ( CLEAR ?auto_28288 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28291 ?auto_28290 ?auto_28288 ?auto_28287 )
      ( MAKE-3PILE ?auto_28286 ?auto_28287 ?auto_28288 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28292 - BLOCK
      ?auto_28293 - BLOCK
      ?auto_28294 - BLOCK
    )
    :vars
    (
      ?auto_28297 - BLOCK
      ?auto_28296 - BLOCK
      ?auto_28295 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28292 ?auto_28293 ) ) ( not ( = ?auto_28292 ?auto_28294 ) ) ( not ( = ?auto_28293 ?auto_28294 ) ) ( ON ?auto_28294 ?auto_28297 ) ( not ( = ?auto_28292 ?auto_28297 ) ) ( not ( = ?auto_28293 ?auto_28297 ) ) ( not ( = ?auto_28294 ?auto_28297 ) ) ( ON-TABLE ?auto_28296 ) ( ON ?auto_28297 ?auto_28296 ) ( not ( = ?auto_28296 ?auto_28297 ) ) ( not ( = ?auto_28296 ?auto_28294 ) ) ( not ( = ?auto_28296 ?auto_28293 ) ) ( not ( = ?auto_28292 ?auto_28296 ) ) ( ON ?auto_28292 ?auto_28295 ) ( not ( = ?auto_28292 ?auto_28295 ) ) ( not ( = ?auto_28293 ?auto_28295 ) ) ( not ( = ?auto_28294 ?auto_28295 ) ) ( not ( = ?auto_28297 ?auto_28295 ) ) ( not ( = ?auto_28296 ?auto_28295 ) ) ( CLEAR ?auto_28294 ) ( ON ?auto_28293 ?auto_28292 ) ( CLEAR ?auto_28293 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28295 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28295 ?auto_28292 )
      ( MAKE-3PILE ?auto_28292 ?auto_28293 ?auto_28294 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28298 - BLOCK
      ?auto_28299 - BLOCK
      ?auto_28300 - BLOCK
    )
    :vars
    (
      ?auto_28301 - BLOCK
      ?auto_28303 - BLOCK
      ?auto_28302 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28298 ?auto_28299 ) ) ( not ( = ?auto_28298 ?auto_28300 ) ) ( not ( = ?auto_28299 ?auto_28300 ) ) ( not ( = ?auto_28298 ?auto_28301 ) ) ( not ( = ?auto_28299 ?auto_28301 ) ) ( not ( = ?auto_28300 ?auto_28301 ) ) ( ON-TABLE ?auto_28303 ) ( ON ?auto_28301 ?auto_28303 ) ( not ( = ?auto_28303 ?auto_28301 ) ) ( not ( = ?auto_28303 ?auto_28300 ) ) ( not ( = ?auto_28303 ?auto_28299 ) ) ( not ( = ?auto_28298 ?auto_28303 ) ) ( ON ?auto_28298 ?auto_28302 ) ( not ( = ?auto_28298 ?auto_28302 ) ) ( not ( = ?auto_28299 ?auto_28302 ) ) ( not ( = ?auto_28300 ?auto_28302 ) ) ( not ( = ?auto_28301 ?auto_28302 ) ) ( not ( = ?auto_28303 ?auto_28302 ) ) ( ON ?auto_28299 ?auto_28298 ) ( CLEAR ?auto_28299 ) ( ON-TABLE ?auto_28302 ) ( HOLDING ?auto_28300 ) ( CLEAR ?auto_28301 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28303 ?auto_28301 ?auto_28300 )
      ( MAKE-3PILE ?auto_28298 ?auto_28299 ?auto_28300 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28304 - BLOCK
      ?auto_28305 - BLOCK
      ?auto_28306 - BLOCK
    )
    :vars
    (
      ?auto_28307 - BLOCK
      ?auto_28308 - BLOCK
      ?auto_28309 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28304 ?auto_28305 ) ) ( not ( = ?auto_28304 ?auto_28306 ) ) ( not ( = ?auto_28305 ?auto_28306 ) ) ( not ( = ?auto_28304 ?auto_28307 ) ) ( not ( = ?auto_28305 ?auto_28307 ) ) ( not ( = ?auto_28306 ?auto_28307 ) ) ( ON-TABLE ?auto_28308 ) ( ON ?auto_28307 ?auto_28308 ) ( not ( = ?auto_28308 ?auto_28307 ) ) ( not ( = ?auto_28308 ?auto_28306 ) ) ( not ( = ?auto_28308 ?auto_28305 ) ) ( not ( = ?auto_28304 ?auto_28308 ) ) ( ON ?auto_28304 ?auto_28309 ) ( not ( = ?auto_28304 ?auto_28309 ) ) ( not ( = ?auto_28305 ?auto_28309 ) ) ( not ( = ?auto_28306 ?auto_28309 ) ) ( not ( = ?auto_28307 ?auto_28309 ) ) ( not ( = ?auto_28308 ?auto_28309 ) ) ( ON ?auto_28305 ?auto_28304 ) ( ON-TABLE ?auto_28309 ) ( CLEAR ?auto_28307 ) ( ON ?auto_28306 ?auto_28305 ) ( CLEAR ?auto_28306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28309 ?auto_28304 ?auto_28305 )
      ( MAKE-3PILE ?auto_28304 ?auto_28305 ?auto_28306 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28310 - BLOCK
      ?auto_28311 - BLOCK
      ?auto_28312 - BLOCK
    )
    :vars
    (
      ?auto_28315 - BLOCK
      ?auto_28314 - BLOCK
      ?auto_28313 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28310 ?auto_28311 ) ) ( not ( = ?auto_28310 ?auto_28312 ) ) ( not ( = ?auto_28311 ?auto_28312 ) ) ( not ( = ?auto_28310 ?auto_28315 ) ) ( not ( = ?auto_28311 ?auto_28315 ) ) ( not ( = ?auto_28312 ?auto_28315 ) ) ( ON-TABLE ?auto_28314 ) ( not ( = ?auto_28314 ?auto_28315 ) ) ( not ( = ?auto_28314 ?auto_28312 ) ) ( not ( = ?auto_28314 ?auto_28311 ) ) ( not ( = ?auto_28310 ?auto_28314 ) ) ( ON ?auto_28310 ?auto_28313 ) ( not ( = ?auto_28310 ?auto_28313 ) ) ( not ( = ?auto_28311 ?auto_28313 ) ) ( not ( = ?auto_28312 ?auto_28313 ) ) ( not ( = ?auto_28315 ?auto_28313 ) ) ( not ( = ?auto_28314 ?auto_28313 ) ) ( ON ?auto_28311 ?auto_28310 ) ( ON-TABLE ?auto_28313 ) ( ON ?auto_28312 ?auto_28311 ) ( CLEAR ?auto_28312 ) ( HOLDING ?auto_28315 ) ( CLEAR ?auto_28314 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28314 ?auto_28315 )
      ( MAKE-3PILE ?auto_28310 ?auto_28311 ?auto_28312 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28316 - BLOCK
      ?auto_28317 - BLOCK
      ?auto_28318 - BLOCK
    )
    :vars
    (
      ?auto_28321 - BLOCK
      ?auto_28319 - BLOCK
      ?auto_28320 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28316 ?auto_28317 ) ) ( not ( = ?auto_28316 ?auto_28318 ) ) ( not ( = ?auto_28317 ?auto_28318 ) ) ( not ( = ?auto_28316 ?auto_28321 ) ) ( not ( = ?auto_28317 ?auto_28321 ) ) ( not ( = ?auto_28318 ?auto_28321 ) ) ( ON-TABLE ?auto_28319 ) ( not ( = ?auto_28319 ?auto_28321 ) ) ( not ( = ?auto_28319 ?auto_28318 ) ) ( not ( = ?auto_28319 ?auto_28317 ) ) ( not ( = ?auto_28316 ?auto_28319 ) ) ( ON ?auto_28316 ?auto_28320 ) ( not ( = ?auto_28316 ?auto_28320 ) ) ( not ( = ?auto_28317 ?auto_28320 ) ) ( not ( = ?auto_28318 ?auto_28320 ) ) ( not ( = ?auto_28321 ?auto_28320 ) ) ( not ( = ?auto_28319 ?auto_28320 ) ) ( ON ?auto_28317 ?auto_28316 ) ( ON-TABLE ?auto_28320 ) ( ON ?auto_28318 ?auto_28317 ) ( CLEAR ?auto_28319 ) ( ON ?auto_28321 ?auto_28318 ) ( CLEAR ?auto_28321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28320 ?auto_28316 ?auto_28317 ?auto_28318 )
      ( MAKE-3PILE ?auto_28316 ?auto_28317 ?auto_28318 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28322 - BLOCK
      ?auto_28323 - BLOCK
      ?auto_28324 - BLOCK
    )
    :vars
    (
      ?auto_28326 - BLOCK
      ?auto_28327 - BLOCK
      ?auto_28325 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28322 ?auto_28323 ) ) ( not ( = ?auto_28322 ?auto_28324 ) ) ( not ( = ?auto_28323 ?auto_28324 ) ) ( not ( = ?auto_28322 ?auto_28326 ) ) ( not ( = ?auto_28323 ?auto_28326 ) ) ( not ( = ?auto_28324 ?auto_28326 ) ) ( not ( = ?auto_28327 ?auto_28326 ) ) ( not ( = ?auto_28327 ?auto_28324 ) ) ( not ( = ?auto_28327 ?auto_28323 ) ) ( not ( = ?auto_28322 ?auto_28327 ) ) ( ON ?auto_28322 ?auto_28325 ) ( not ( = ?auto_28322 ?auto_28325 ) ) ( not ( = ?auto_28323 ?auto_28325 ) ) ( not ( = ?auto_28324 ?auto_28325 ) ) ( not ( = ?auto_28326 ?auto_28325 ) ) ( not ( = ?auto_28327 ?auto_28325 ) ) ( ON ?auto_28323 ?auto_28322 ) ( ON-TABLE ?auto_28325 ) ( ON ?auto_28324 ?auto_28323 ) ( ON ?auto_28326 ?auto_28324 ) ( CLEAR ?auto_28326 ) ( HOLDING ?auto_28327 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28327 )
      ( MAKE-3PILE ?auto_28322 ?auto_28323 ?auto_28324 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_28328 - BLOCK
      ?auto_28329 - BLOCK
      ?auto_28330 - BLOCK
    )
    :vars
    (
      ?auto_28333 - BLOCK
      ?auto_28332 - BLOCK
      ?auto_28331 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28328 ?auto_28329 ) ) ( not ( = ?auto_28328 ?auto_28330 ) ) ( not ( = ?auto_28329 ?auto_28330 ) ) ( not ( = ?auto_28328 ?auto_28333 ) ) ( not ( = ?auto_28329 ?auto_28333 ) ) ( not ( = ?auto_28330 ?auto_28333 ) ) ( not ( = ?auto_28332 ?auto_28333 ) ) ( not ( = ?auto_28332 ?auto_28330 ) ) ( not ( = ?auto_28332 ?auto_28329 ) ) ( not ( = ?auto_28328 ?auto_28332 ) ) ( ON ?auto_28328 ?auto_28331 ) ( not ( = ?auto_28328 ?auto_28331 ) ) ( not ( = ?auto_28329 ?auto_28331 ) ) ( not ( = ?auto_28330 ?auto_28331 ) ) ( not ( = ?auto_28333 ?auto_28331 ) ) ( not ( = ?auto_28332 ?auto_28331 ) ) ( ON ?auto_28329 ?auto_28328 ) ( ON-TABLE ?auto_28331 ) ( ON ?auto_28330 ?auto_28329 ) ( ON ?auto_28333 ?auto_28330 ) ( ON ?auto_28332 ?auto_28333 ) ( CLEAR ?auto_28332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28331 ?auto_28328 ?auto_28329 ?auto_28330 ?auto_28333 )
      ( MAKE-3PILE ?auto_28328 ?auto_28329 ?auto_28330 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28335 - BLOCK
    )
    :vars
    (
      ?auto_28336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28336 ?auto_28335 ) ( CLEAR ?auto_28336 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28335 ) ( not ( = ?auto_28335 ?auto_28336 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28336 ?auto_28335 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28337 - BLOCK
    )
    :vars
    (
      ?auto_28338 - BLOCK
      ?auto_28339 - BLOCK
      ?auto_28340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28338 ?auto_28337 ) ( CLEAR ?auto_28338 ) ( ON-TABLE ?auto_28337 ) ( not ( = ?auto_28337 ?auto_28338 ) ) ( HOLDING ?auto_28339 ) ( CLEAR ?auto_28340 ) ( not ( = ?auto_28337 ?auto_28339 ) ) ( not ( = ?auto_28337 ?auto_28340 ) ) ( not ( = ?auto_28338 ?auto_28339 ) ) ( not ( = ?auto_28338 ?auto_28340 ) ) ( not ( = ?auto_28339 ?auto_28340 ) ) )
    :subtasks
    ( ( !STACK ?auto_28339 ?auto_28340 )
      ( MAKE-1PILE ?auto_28337 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28341 - BLOCK
    )
    :vars
    (
      ?auto_28343 - BLOCK
      ?auto_28344 - BLOCK
      ?auto_28342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28343 ?auto_28341 ) ( ON-TABLE ?auto_28341 ) ( not ( = ?auto_28341 ?auto_28343 ) ) ( CLEAR ?auto_28344 ) ( not ( = ?auto_28341 ?auto_28342 ) ) ( not ( = ?auto_28341 ?auto_28344 ) ) ( not ( = ?auto_28343 ?auto_28342 ) ) ( not ( = ?auto_28343 ?auto_28344 ) ) ( not ( = ?auto_28342 ?auto_28344 ) ) ( ON ?auto_28342 ?auto_28343 ) ( CLEAR ?auto_28342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28341 ?auto_28343 )
      ( MAKE-1PILE ?auto_28341 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28345 - BLOCK
    )
    :vars
    (
      ?auto_28347 - BLOCK
      ?auto_28348 - BLOCK
      ?auto_28346 - BLOCK
      ?auto_28349 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28347 ?auto_28345 ) ( ON-TABLE ?auto_28345 ) ( not ( = ?auto_28345 ?auto_28347 ) ) ( not ( = ?auto_28345 ?auto_28348 ) ) ( not ( = ?auto_28345 ?auto_28346 ) ) ( not ( = ?auto_28347 ?auto_28348 ) ) ( not ( = ?auto_28347 ?auto_28346 ) ) ( not ( = ?auto_28348 ?auto_28346 ) ) ( ON ?auto_28348 ?auto_28347 ) ( CLEAR ?auto_28348 ) ( HOLDING ?auto_28346 ) ( CLEAR ?auto_28349 ) ( ON-TABLE ?auto_28349 ) ( not ( = ?auto_28349 ?auto_28346 ) ) ( not ( = ?auto_28345 ?auto_28349 ) ) ( not ( = ?auto_28347 ?auto_28349 ) ) ( not ( = ?auto_28348 ?auto_28349 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28349 ?auto_28346 )
      ( MAKE-1PILE ?auto_28345 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28350 - BLOCK
    )
    :vars
    (
      ?auto_28351 - BLOCK
      ?auto_28352 - BLOCK
      ?auto_28353 - BLOCK
      ?auto_28354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28351 ?auto_28350 ) ( ON-TABLE ?auto_28350 ) ( not ( = ?auto_28350 ?auto_28351 ) ) ( not ( = ?auto_28350 ?auto_28352 ) ) ( not ( = ?auto_28350 ?auto_28353 ) ) ( not ( = ?auto_28351 ?auto_28352 ) ) ( not ( = ?auto_28351 ?auto_28353 ) ) ( not ( = ?auto_28352 ?auto_28353 ) ) ( ON ?auto_28352 ?auto_28351 ) ( CLEAR ?auto_28354 ) ( ON-TABLE ?auto_28354 ) ( not ( = ?auto_28354 ?auto_28353 ) ) ( not ( = ?auto_28350 ?auto_28354 ) ) ( not ( = ?auto_28351 ?auto_28354 ) ) ( not ( = ?auto_28352 ?auto_28354 ) ) ( ON ?auto_28353 ?auto_28352 ) ( CLEAR ?auto_28353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28350 ?auto_28351 ?auto_28352 )
      ( MAKE-1PILE ?auto_28350 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28355 - BLOCK
    )
    :vars
    (
      ?auto_28357 - BLOCK
      ?auto_28358 - BLOCK
      ?auto_28356 - BLOCK
      ?auto_28359 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28357 ?auto_28355 ) ( ON-TABLE ?auto_28355 ) ( not ( = ?auto_28355 ?auto_28357 ) ) ( not ( = ?auto_28355 ?auto_28358 ) ) ( not ( = ?auto_28355 ?auto_28356 ) ) ( not ( = ?auto_28357 ?auto_28358 ) ) ( not ( = ?auto_28357 ?auto_28356 ) ) ( not ( = ?auto_28358 ?auto_28356 ) ) ( ON ?auto_28358 ?auto_28357 ) ( not ( = ?auto_28359 ?auto_28356 ) ) ( not ( = ?auto_28355 ?auto_28359 ) ) ( not ( = ?auto_28357 ?auto_28359 ) ) ( not ( = ?auto_28358 ?auto_28359 ) ) ( ON ?auto_28356 ?auto_28358 ) ( CLEAR ?auto_28356 ) ( HOLDING ?auto_28359 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28359 )
      ( MAKE-1PILE ?auto_28355 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28360 - BLOCK
    )
    :vars
    (
      ?auto_28362 - BLOCK
      ?auto_28363 - BLOCK
      ?auto_28361 - BLOCK
      ?auto_28364 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28362 ?auto_28360 ) ( ON-TABLE ?auto_28360 ) ( not ( = ?auto_28360 ?auto_28362 ) ) ( not ( = ?auto_28360 ?auto_28363 ) ) ( not ( = ?auto_28360 ?auto_28361 ) ) ( not ( = ?auto_28362 ?auto_28363 ) ) ( not ( = ?auto_28362 ?auto_28361 ) ) ( not ( = ?auto_28363 ?auto_28361 ) ) ( ON ?auto_28363 ?auto_28362 ) ( not ( = ?auto_28364 ?auto_28361 ) ) ( not ( = ?auto_28360 ?auto_28364 ) ) ( not ( = ?auto_28362 ?auto_28364 ) ) ( not ( = ?auto_28363 ?auto_28364 ) ) ( ON ?auto_28361 ?auto_28363 ) ( ON ?auto_28364 ?auto_28361 ) ( CLEAR ?auto_28364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28360 ?auto_28362 ?auto_28363 ?auto_28361 )
      ( MAKE-1PILE ?auto_28360 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28365 - BLOCK
    )
    :vars
    (
      ?auto_28367 - BLOCK
      ?auto_28368 - BLOCK
      ?auto_28369 - BLOCK
      ?auto_28366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28367 ?auto_28365 ) ( ON-TABLE ?auto_28365 ) ( not ( = ?auto_28365 ?auto_28367 ) ) ( not ( = ?auto_28365 ?auto_28368 ) ) ( not ( = ?auto_28365 ?auto_28369 ) ) ( not ( = ?auto_28367 ?auto_28368 ) ) ( not ( = ?auto_28367 ?auto_28369 ) ) ( not ( = ?auto_28368 ?auto_28369 ) ) ( ON ?auto_28368 ?auto_28367 ) ( not ( = ?auto_28366 ?auto_28369 ) ) ( not ( = ?auto_28365 ?auto_28366 ) ) ( not ( = ?auto_28367 ?auto_28366 ) ) ( not ( = ?auto_28368 ?auto_28366 ) ) ( ON ?auto_28369 ?auto_28368 ) ( HOLDING ?auto_28366 ) ( CLEAR ?auto_28369 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28365 ?auto_28367 ?auto_28368 ?auto_28369 ?auto_28366 )
      ( MAKE-1PILE ?auto_28365 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28370 - BLOCK
    )
    :vars
    (
      ?auto_28372 - BLOCK
      ?auto_28371 - BLOCK
      ?auto_28373 - BLOCK
      ?auto_28374 - BLOCK
      ?auto_28375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28372 ?auto_28370 ) ( ON-TABLE ?auto_28370 ) ( not ( = ?auto_28370 ?auto_28372 ) ) ( not ( = ?auto_28370 ?auto_28371 ) ) ( not ( = ?auto_28370 ?auto_28373 ) ) ( not ( = ?auto_28372 ?auto_28371 ) ) ( not ( = ?auto_28372 ?auto_28373 ) ) ( not ( = ?auto_28371 ?auto_28373 ) ) ( ON ?auto_28371 ?auto_28372 ) ( not ( = ?auto_28374 ?auto_28373 ) ) ( not ( = ?auto_28370 ?auto_28374 ) ) ( not ( = ?auto_28372 ?auto_28374 ) ) ( not ( = ?auto_28371 ?auto_28374 ) ) ( ON ?auto_28373 ?auto_28371 ) ( CLEAR ?auto_28373 ) ( ON ?auto_28374 ?auto_28375 ) ( CLEAR ?auto_28374 ) ( HAND-EMPTY ) ( not ( = ?auto_28370 ?auto_28375 ) ) ( not ( = ?auto_28372 ?auto_28375 ) ) ( not ( = ?auto_28371 ?auto_28375 ) ) ( not ( = ?auto_28373 ?auto_28375 ) ) ( not ( = ?auto_28374 ?auto_28375 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28374 ?auto_28375 )
      ( MAKE-1PILE ?auto_28370 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28376 - BLOCK
    )
    :vars
    (
      ?auto_28378 - BLOCK
      ?auto_28381 - BLOCK
      ?auto_28379 - BLOCK
      ?auto_28380 - BLOCK
      ?auto_28377 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28378 ?auto_28376 ) ( ON-TABLE ?auto_28376 ) ( not ( = ?auto_28376 ?auto_28378 ) ) ( not ( = ?auto_28376 ?auto_28381 ) ) ( not ( = ?auto_28376 ?auto_28379 ) ) ( not ( = ?auto_28378 ?auto_28381 ) ) ( not ( = ?auto_28378 ?auto_28379 ) ) ( not ( = ?auto_28381 ?auto_28379 ) ) ( ON ?auto_28381 ?auto_28378 ) ( not ( = ?auto_28380 ?auto_28379 ) ) ( not ( = ?auto_28376 ?auto_28380 ) ) ( not ( = ?auto_28378 ?auto_28380 ) ) ( not ( = ?auto_28381 ?auto_28380 ) ) ( ON ?auto_28380 ?auto_28377 ) ( CLEAR ?auto_28380 ) ( not ( = ?auto_28376 ?auto_28377 ) ) ( not ( = ?auto_28378 ?auto_28377 ) ) ( not ( = ?auto_28381 ?auto_28377 ) ) ( not ( = ?auto_28379 ?auto_28377 ) ) ( not ( = ?auto_28380 ?auto_28377 ) ) ( HOLDING ?auto_28379 ) ( CLEAR ?auto_28381 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28376 ?auto_28378 ?auto_28381 ?auto_28379 )
      ( MAKE-1PILE ?auto_28376 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28382 - BLOCK
    )
    :vars
    (
      ?auto_28384 - BLOCK
      ?auto_28386 - BLOCK
      ?auto_28383 - BLOCK
      ?auto_28385 - BLOCK
      ?auto_28387 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28384 ?auto_28382 ) ( ON-TABLE ?auto_28382 ) ( not ( = ?auto_28382 ?auto_28384 ) ) ( not ( = ?auto_28382 ?auto_28386 ) ) ( not ( = ?auto_28382 ?auto_28383 ) ) ( not ( = ?auto_28384 ?auto_28386 ) ) ( not ( = ?auto_28384 ?auto_28383 ) ) ( not ( = ?auto_28386 ?auto_28383 ) ) ( ON ?auto_28386 ?auto_28384 ) ( not ( = ?auto_28385 ?auto_28383 ) ) ( not ( = ?auto_28382 ?auto_28385 ) ) ( not ( = ?auto_28384 ?auto_28385 ) ) ( not ( = ?auto_28386 ?auto_28385 ) ) ( ON ?auto_28385 ?auto_28387 ) ( not ( = ?auto_28382 ?auto_28387 ) ) ( not ( = ?auto_28384 ?auto_28387 ) ) ( not ( = ?auto_28386 ?auto_28387 ) ) ( not ( = ?auto_28383 ?auto_28387 ) ) ( not ( = ?auto_28385 ?auto_28387 ) ) ( CLEAR ?auto_28386 ) ( ON ?auto_28383 ?auto_28385 ) ( CLEAR ?auto_28383 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28387 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28387 ?auto_28385 )
      ( MAKE-1PILE ?auto_28382 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28388 - BLOCK
    )
    :vars
    (
      ?auto_28393 - BLOCK
      ?auto_28392 - BLOCK
      ?auto_28390 - BLOCK
      ?auto_28389 - BLOCK
      ?auto_28391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28393 ?auto_28388 ) ( ON-TABLE ?auto_28388 ) ( not ( = ?auto_28388 ?auto_28393 ) ) ( not ( = ?auto_28388 ?auto_28392 ) ) ( not ( = ?auto_28388 ?auto_28390 ) ) ( not ( = ?auto_28393 ?auto_28392 ) ) ( not ( = ?auto_28393 ?auto_28390 ) ) ( not ( = ?auto_28392 ?auto_28390 ) ) ( not ( = ?auto_28389 ?auto_28390 ) ) ( not ( = ?auto_28388 ?auto_28389 ) ) ( not ( = ?auto_28393 ?auto_28389 ) ) ( not ( = ?auto_28392 ?auto_28389 ) ) ( ON ?auto_28389 ?auto_28391 ) ( not ( = ?auto_28388 ?auto_28391 ) ) ( not ( = ?auto_28393 ?auto_28391 ) ) ( not ( = ?auto_28392 ?auto_28391 ) ) ( not ( = ?auto_28390 ?auto_28391 ) ) ( not ( = ?auto_28389 ?auto_28391 ) ) ( ON ?auto_28390 ?auto_28389 ) ( CLEAR ?auto_28390 ) ( ON-TABLE ?auto_28391 ) ( HOLDING ?auto_28392 ) ( CLEAR ?auto_28393 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28388 ?auto_28393 ?auto_28392 )
      ( MAKE-1PILE ?auto_28388 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28394 - BLOCK
    )
    :vars
    (
      ?auto_28398 - BLOCK
      ?auto_28397 - BLOCK
      ?auto_28395 - BLOCK
      ?auto_28399 - BLOCK
      ?auto_28396 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28398 ?auto_28394 ) ( ON-TABLE ?auto_28394 ) ( not ( = ?auto_28394 ?auto_28398 ) ) ( not ( = ?auto_28394 ?auto_28397 ) ) ( not ( = ?auto_28394 ?auto_28395 ) ) ( not ( = ?auto_28398 ?auto_28397 ) ) ( not ( = ?auto_28398 ?auto_28395 ) ) ( not ( = ?auto_28397 ?auto_28395 ) ) ( not ( = ?auto_28399 ?auto_28395 ) ) ( not ( = ?auto_28394 ?auto_28399 ) ) ( not ( = ?auto_28398 ?auto_28399 ) ) ( not ( = ?auto_28397 ?auto_28399 ) ) ( ON ?auto_28399 ?auto_28396 ) ( not ( = ?auto_28394 ?auto_28396 ) ) ( not ( = ?auto_28398 ?auto_28396 ) ) ( not ( = ?auto_28397 ?auto_28396 ) ) ( not ( = ?auto_28395 ?auto_28396 ) ) ( not ( = ?auto_28399 ?auto_28396 ) ) ( ON ?auto_28395 ?auto_28399 ) ( ON-TABLE ?auto_28396 ) ( CLEAR ?auto_28398 ) ( ON ?auto_28397 ?auto_28395 ) ( CLEAR ?auto_28397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28396 ?auto_28399 ?auto_28395 )
      ( MAKE-1PILE ?auto_28394 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28412 - BLOCK
    )
    :vars
    (
      ?auto_28413 - BLOCK
      ?auto_28414 - BLOCK
      ?auto_28417 - BLOCK
      ?auto_28416 - BLOCK
      ?auto_28415 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28412 ?auto_28413 ) ) ( not ( = ?auto_28412 ?auto_28414 ) ) ( not ( = ?auto_28412 ?auto_28417 ) ) ( not ( = ?auto_28413 ?auto_28414 ) ) ( not ( = ?auto_28413 ?auto_28417 ) ) ( not ( = ?auto_28414 ?auto_28417 ) ) ( not ( = ?auto_28416 ?auto_28417 ) ) ( not ( = ?auto_28412 ?auto_28416 ) ) ( not ( = ?auto_28413 ?auto_28416 ) ) ( not ( = ?auto_28414 ?auto_28416 ) ) ( ON ?auto_28416 ?auto_28415 ) ( not ( = ?auto_28412 ?auto_28415 ) ) ( not ( = ?auto_28413 ?auto_28415 ) ) ( not ( = ?auto_28414 ?auto_28415 ) ) ( not ( = ?auto_28417 ?auto_28415 ) ) ( not ( = ?auto_28416 ?auto_28415 ) ) ( ON ?auto_28417 ?auto_28416 ) ( ON-TABLE ?auto_28415 ) ( ON ?auto_28414 ?auto_28417 ) ( ON ?auto_28413 ?auto_28414 ) ( CLEAR ?auto_28413 ) ( HOLDING ?auto_28412 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28412 ?auto_28413 )
      ( MAKE-1PILE ?auto_28412 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_28418 - BLOCK
    )
    :vars
    (
      ?auto_28423 - BLOCK
      ?auto_28422 - BLOCK
      ?auto_28420 - BLOCK
      ?auto_28421 - BLOCK
      ?auto_28419 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28418 ?auto_28423 ) ) ( not ( = ?auto_28418 ?auto_28422 ) ) ( not ( = ?auto_28418 ?auto_28420 ) ) ( not ( = ?auto_28423 ?auto_28422 ) ) ( not ( = ?auto_28423 ?auto_28420 ) ) ( not ( = ?auto_28422 ?auto_28420 ) ) ( not ( = ?auto_28421 ?auto_28420 ) ) ( not ( = ?auto_28418 ?auto_28421 ) ) ( not ( = ?auto_28423 ?auto_28421 ) ) ( not ( = ?auto_28422 ?auto_28421 ) ) ( ON ?auto_28421 ?auto_28419 ) ( not ( = ?auto_28418 ?auto_28419 ) ) ( not ( = ?auto_28423 ?auto_28419 ) ) ( not ( = ?auto_28422 ?auto_28419 ) ) ( not ( = ?auto_28420 ?auto_28419 ) ) ( not ( = ?auto_28421 ?auto_28419 ) ) ( ON ?auto_28420 ?auto_28421 ) ( ON-TABLE ?auto_28419 ) ( ON ?auto_28422 ?auto_28420 ) ( ON ?auto_28423 ?auto_28422 ) ( ON ?auto_28418 ?auto_28423 ) ( CLEAR ?auto_28418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28419 ?auto_28421 ?auto_28420 ?auto_28422 ?auto_28423 )
      ( MAKE-1PILE ?auto_28418 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28428 - BLOCK
      ?auto_28429 - BLOCK
      ?auto_28430 - BLOCK
      ?auto_28431 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_28431 ) ( CLEAR ?auto_28430 ) ( ON-TABLE ?auto_28428 ) ( ON ?auto_28429 ?auto_28428 ) ( ON ?auto_28430 ?auto_28429 ) ( not ( = ?auto_28428 ?auto_28429 ) ) ( not ( = ?auto_28428 ?auto_28430 ) ) ( not ( = ?auto_28428 ?auto_28431 ) ) ( not ( = ?auto_28429 ?auto_28430 ) ) ( not ( = ?auto_28429 ?auto_28431 ) ) ( not ( = ?auto_28430 ?auto_28431 ) ) )
    :subtasks
    ( ( !STACK ?auto_28431 ?auto_28430 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28432 - BLOCK
      ?auto_28433 - BLOCK
      ?auto_28434 - BLOCK
      ?auto_28435 - BLOCK
    )
    :vars
    (
      ?auto_28436 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_28434 ) ( ON-TABLE ?auto_28432 ) ( ON ?auto_28433 ?auto_28432 ) ( ON ?auto_28434 ?auto_28433 ) ( not ( = ?auto_28432 ?auto_28433 ) ) ( not ( = ?auto_28432 ?auto_28434 ) ) ( not ( = ?auto_28432 ?auto_28435 ) ) ( not ( = ?auto_28433 ?auto_28434 ) ) ( not ( = ?auto_28433 ?auto_28435 ) ) ( not ( = ?auto_28434 ?auto_28435 ) ) ( ON ?auto_28435 ?auto_28436 ) ( CLEAR ?auto_28435 ) ( HAND-EMPTY ) ( not ( = ?auto_28432 ?auto_28436 ) ) ( not ( = ?auto_28433 ?auto_28436 ) ) ( not ( = ?auto_28434 ?auto_28436 ) ) ( not ( = ?auto_28435 ?auto_28436 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28435 ?auto_28436 )
      ( MAKE-4PILE ?auto_28432 ?auto_28433 ?auto_28434 ?auto_28435 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28437 - BLOCK
      ?auto_28438 - BLOCK
      ?auto_28439 - BLOCK
      ?auto_28440 - BLOCK
    )
    :vars
    (
      ?auto_28441 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28437 ) ( ON ?auto_28438 ?auto_28437 ) ( not ( = ?auto_28437 ?auto_28438 ) ) ( not ( = ?auto_28437 ?auto_28439 ) ) ( not ( = ?auto_28437 ?auto_28440 ) ) ( not ( = ?auto_28438 ?auto_28439 ) ) ( not ( = ?auto_28438 ?auto_28440 ) ) ( not ( = ?auto_28439 ?auto_28440 ) ) ( ON ?auto_28440 ?auto_28441 ) ( CLEAR ?auto_28440 ) ( not ( = ?auto_28437 ?auto_28441 ) ) ( not ( = ?auto_28438 ?auto_28441 ) ) ( not ( = ?auto_28439 ?auto_28441 ) ) ( not ( = ?auto_28440 ?auto_28441 ) ) ( HOLDING ?auto_28439 ) ( CLEAR ?auto_28438 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28437 ?auto_28438 ?auto_28439 )
      ( MAKE-4PILE ?auto_28437 ?auto_28438 ?auto_28439 ?auto_28440 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28442 - BLOCK
      ?auto_28443 - BLOCK
      ?auto_28444 - BLOCK
      ?auto_28445 - BLOCK
    )
    :vars
    (
      ?auto_28446 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28442 ) ( ON ?auto_28443 ?auto_28442 ) ( not ( = ?auto_28442 ?auto_28443 ) ) ( not ( = ?auto_28442 ?auto_28444 ) ) ( not ( = ?auto_28442 ?auto_28445 ) ) ( not ( = ?auto_28443 ?auto_28444 ) ) ( not ( = ?auto_28443 ?auto_28445 ) ) ( not ( = ?auto_28444 ?auto_28445 ) ) ( ON ?auto_28445 ?auto_28446 ) ( not ( = ?auto_28442 ?auto_28446 ) ) ( not ( = ?auto_28443 ?auto_28446 ) ) ( not ( = ?auto_28444 ?auto_28446 ) ) ( not ( = ?auto_28445 ?auto_28446 ) ) ( CLEAR ?auto_28443 ) ( ON ?auto_28444 ?auto_28445 ) ( CLEAR ?auto_28444 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28446 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28446 ?auto_28445 )
      ( MAKE-4PILE ?auto_28442 ?auto_28443 ?auto_28444 ?auto_28445 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28447 - BLOCK
      ?auto_28448 - BLOCK
      ?auto_28449 - BLOCK
      ?auto_28450 - BLOCK
    )
    :vars
    (
      ?auto_28451 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28447 ) ( not ( = ?auto_28447 ?auto_28448 ) ) ( not ( = ?auto_28447 ?auto_28449 ) ) ( not ( = ?auto_28447 ?auto_28450 ) ) ( not ( = ?auto_28448 ?auto_28449 ) ) ( not ( = ?auto_28448 ?auto_28450 ) ) ( not ( = ?auto_28449 ?auto_28450 ) ) ( ON ?auto_28450 ?auto_28451 ) ( not ( = ?auto_28447 ?auto_28451 ) ) ( not ( = ?auto_28448 ?auto_28451 ) ) ( not ( = ?auto_28449 ?auto_28451 ) ) ( not ( = ?auto_28450 ?auto_28451 ) ) ( ON ?auto_28449 ?auto_28450 ) ( CLEAR ?auto_28449 ) ( ON-TABLE ?auto_28451 ) ( HOLDING ?auto_28448 ) ( CLEAR ?auto_28447 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28447 ?auto_28448 )
      ( MAKE-4PILE ?auto_28447 ?auto_28448 ?auto_28449 ?auto_28450 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28452 - BLOCK
      ?auto_28453 - BLOCK
      ?auto_28454 - BLOCK
      ?auto_28455 - BLOCK
    )
    :vars
    (
      ?auto_28456 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28452 ) ( not ( = ?auto_28452 ?auto_28453 ) ) ( not ( = ?auto_28452 ?auto_28454 ) ) ( not ( = ?auto_28452 ?auto_28455 ) ) ( not ( = ?auto_28453 ?auto_28454 ) ) ( not ( = ?auto_28453 ?auto_28455 ) ) ( not ( = ?auto_28454 ?auto_28455 ) ) ( ON ?auto_28455 ?auto_28456 ) ( not ( = ?auto_28452 ?auto_28456 ) ) ( not ( = ?auto_28453 ?auto_28456 ) ) ( not ( = ?auto_28454 ?auto_28456 ) ) ( not ( = ?auto_28455 ?auto_28456 ) ) ( ON ?auto_28454 ?auto_28455 ) ( ON-TABLE ?auto_28456 ) ( CLEAR ?auto_28452 ) ( ON ?auto_28453 ?auto_28454 ) ( CLEAR ?auto_28453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28456 ?auto_28455 ?auto_28454 )
      ( MAKE-4PILE ?auto_28452 ?auto_28453 ?auto_28454 ?auto_28455 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28457 - BLOCK
      ?auto_28458 - BLOCK
      ?auto_28459 - BLOCK
      ?auto_28460 - BLOCK
    )
    :vars
    (
      ?auto_28461 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28457 ?auto_28458 ) ) ( not ( = ?auto_28457 ?auto_28459 ) ) ( not ( = ?auto_28457 ?auto_28460 ) ) ( not ( = ?auto_28458 ?auto_28459 ) ) ( not ( = ?auto_28458 ?auto_28460 ) ) ( not ( = ?auto_28459 ?auto_28460 ) ) ( ON ?auto_28460 ?auto_28461 ) ( not ( = ?auto_28457 ?auto_28461 ) ) ( not ( = ?auto_28458 ?auto_28461 ) ) ( not ( = ?auto_28459 ?auto_28461 ) ) ( not ( = ?auto_28460 ?auto_28461 ) ) ( ON ?auto_28459 ?auto_28460 ) ( ON-TABLE ?auto_28461 ) ( ON ?auto_28458 ?auto_28459 ) ( CLEAR ?auto_28458 ) ( HOLDING ?auto_28457 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28457 )
      ( MAKE-4PILE ?auto_28457 ?auto_28458 ?auto_28459 ?auto_28460 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28462 - BLOCK
      ?auto_28463 - BLOCK
      ?auto_28464 - BLOCK
      ?auto_28465 - BLOCK
    )
    :vars
    (
      ?auto_28466 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28462 ?auto_28463 ) ) ( not ( = ?auto_28462 ?auto_28464 ) ) ( not ( = ?auto_28462 ?auto_28465 ) ) ( not ( = ?auto_28463 ?auto_28464 ) ) ( not ( = ?auto_28463 ?auto_28465 ) ) ( not ( = ?auto_28464 ?auto_28465 ) ) ( ON ?auto_28465 ?auto_28466 ) ( not ( = ?auto_28462 ?auto_28466 ) ) ( not ( = ?auto_28463 ?auto_28466 ) ) ( not ( = ?auto_28464 ?auto_28466 ) ) ( not ( = ?auto_28465 ?auto_28466 ) ) ( ON ?auto_28464 ?auto_28465 ) ( ON-TABLE ?auto_28466 ) ( ON ?auto_28463 ?auto_28464 ) ( ON ?auto_28462 ?auto_28463 ) ( CLEAR ?auto_28462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28466 ?auto_28465 ?auto_28464 ?auto_28463 )
      ( MAKE-4PILE ?auto_28462 ?auto_28463 ?auto_28464 ?auto_28465 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28467 - BLOCK
      ?auto_28468 - BLOCK
      ?auto_28469 - BLOCK
      ?auto_28470 - BLOCK
    )
    :vars
    (
      ?auto_28471 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28467 ?auto_28468 ) ) ( not ( = ?auto_28467 ?auto_28469 ) ) ( not ( = ?auto_28467 ?auto_28470 ) ) ( not ( = ?auto_28468 ?auto_28469 ) ) ( not ( = ?auto_28468 ?auto_28470 ) ) ( not ( = ?auto_28469 ?auto_28470 ) ) ( ON ?auto_28470 ?auto_28471 ) ( not ( = ?auto_28467 ?auto_28471 ) ) ( not ( = ?auto_28468 ?auto_28471 ) ) ( not ( = ?auto_28469 ?auto_28471 ) ) ( not ( = ?auto_28470 ?auto_28471 ) ) ( ON ?auto_28469 ?auto_28470 ) ( ON-TABLE ?auto_28471 ) ( ON ?auto_28468 ?auto_28469 ) ( HOLDING ?auto_28467 ) ( CLEAR ?auto_28468 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28471 ?auto_28470 ?auto_28469 ?auto_28468 ?auto_28467 )
      ( MAKE-4PILE ?auto_28467 ?auto_28468 ?auto_28469 ?auto_28470 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28472 - BLOCK
      ?auto_28473 - BLOCK
      ?auto_28474 - BLOCK
      ?auto_28475 - BLOCK
    )
    :vars
    (
      ?auto_28476 - BLOCK
      ?auto_28477 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28472 ?auto_28473 ) ) ( not ( = ?auto_28472 ?auto_28474 ) ) ( not ( = ?auto_28472 ?auto_28475 ) ) ( not ( = ?auto_28473 ?auto_28474 ) ) ( not ( = ?auto_28473 ?auto_28475 ) ) ( not ( = ?auto_28474 ?auto_28475 ) ) ( ON ?auto_28475 ?auto_28476 ) ( not ( = ?auto_28472 ?auto_28476 ) ) ( not ( = ?auto_28473 ?auto_28476 ) ) ( not ( = ?auto_28474 ?auto_28476 ) ) ( not ( = ?auto_28475 ?auto_28476 ) ) ( ON ?auto_28474 ?auto_28475 ) ( ON-TABLE ?auto_28476 ) ( ON ?auto_28473 ?auto_28474 ) ( CLEAR ?auto_28473 ) ( ON ?auto_28472 ?auto_28477 ) ( CLEAR ?auto_28472 ) ( HAND-EMPTY ) ( not ( = ?auto_28472 ?auto_28477 ) ) ( not ( = ?auto_28473 ?auto_28477 ) ) ( not ( = ?auto_28474 ?auto_28477 ) ) ( not ( = ?auto_28475 ?auto_28477 ) ) ( not ( = ?auto_28476 ?auto_28477 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28472 ?auto_28477 )
      ( MAKE-4PILE ?auto_28472 ?auto_28473 ?auto_28474 ?auto_28475 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28478 - BLOCK
      ?auto_28479 - BLOCK
      ?auto_28480 - BLOCK
      ?auto_28481 - BLOCK
    )
    :vars
    (
      ?auto_28483 - BLOCK
      ?auto_28482 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28478 ?auto_28479 ) ) ( not ( = ?auto_28478 ?auto_28480 ) ) ( not ( = ?auto_28478 ?auto_28481 ) ) ( not ( = ?auto_28479 ?auto_28480 ) ) ( not ( = ?auto_28479 ?auto_28481 ) ) ( not ( = ?auto_28480 ?auto_28481 ) ) ( ON ?auto_28481 ?auto_28483 ) ( not ( = ?auto_28478 ?auto_28483 ) ) ( not ( = ?auto_28479 ?auto_28483 ) ) ( not ( = ?auto_28480 ?auto_28483 ) ) ( not ( = ?auto_28481 ?auto_28483 ) ) ( ON ?auto_28480 ?auto_28481 ) ( ON-TABLE ?auto_28483 ) ( ON ?auto_28478 ?auto_28482 ) ( CLEAR ?auto_28478 ) ( not ( = ?auto_28478 ?auto_28482 ) ) ( not ( = ?auto_28479 ?auto_28482 ) ) ( not ( = ?auto_28480 ?auto_28482 ) ) ( not ( = ?auto_28481 ?auto_28482 ) ) ( not ( = ?auto_28483 ?auto_28482 ) ) ( HOLDING ?auto_28479 ) ( CLEAR ?auto_28480 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28483 ?auto_28481 ?auto_28480 ?auto_28479 )
      ( MAKE-4PILE ?auto_28478 ?auto_28479 ?auto_28480 ?auto_28481 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28484 - BLOCK
      ?auto_28485 - BLOCK
      ?auto_28486 - BLOCK
      ?auto_28487 - BLOCK
    )
    :vars
    (
      ?auto_28488 - BLOCK
      ?auto_28489 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28484 ?auto_28485 ) ) ( not ( = ?auto_28484 ?auto_28486 ) ) ( not ( = ?auto_28484 ?auto_28487 ) ) ( not ( = ?auto_28485 ?auto_28486 ) ) ( not ( = ?auto_28485 ?auto_28487 ) ) ( not ( = ?auto_28486 ?auto_28487 ) ) ( ON ?auto_28487 ?auto_28488 ) ( not ( = ?auto_28484 ?auto_28488 ) ) ( not ( = ?auto_28485 ?auto_28488 ) ) ( not ( = ?auto_28486 ?auto_28488 ) ) ( not ( = ?auto_28487 ?auto_28488 ) ) ( ON ?auto_28486 ?auto_28487 ) ( ON-TABLE ?auto_28488 ) ( ON ?auto_28484 ?auto_28489 ) ( not ( = ?auto_28484 ?auto_28489 ) ) ( not ( = ?auto_28485 ?auto_28489 ) ) ( not ( = ?auto_28486 ?auto_28489 ) ) ( not ( = ?auto_28487 ?auto_28489 ) ) ( not ( = ?auto_28488 ?auto_28489 ) ) ( CLEAR ?auto_28486 ) ( ON ?auto_28485 ?auto_28484 ) ( CLEAR ?auto_28485 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28489 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28489 ?auto_28484 )
      ( MAKE-4PILE ?auto_28484 ?auto_28485 ?auto_28486 ?auto_28487 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28490 - BLOCK
      ?auto_28491 - BLOCK
      ?auto_28492 - BLOCK
      ?auto_28493 - BLOCK
    )
    :vars
    (
      ?auto_28495 - BLOCK
      ?auto_28494 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28490 ?auto_28491 ) ) ( not ( = ?auto_28490 ?auto_28492 ) ) ( not ( = ?auto_28490 ?auto_28493 ) ) ( not ( = ?auto_28491 ?auto_28492 ) ) ( not ( = ?auto_28491 ?auto_28493 ) ) ( not ( = ?auto_28492 ?auto_28493 ) ) ( ON ?auto_28493 ?auto_28495 ) ( not ( = ?auto_28490 ?auto_28495 ) ) ( not ( = ?auto_28491 ?auto_28495 ) ) ( not ( = ?auto_28492 ?auto_28495 ) ) ( not ( = ?auto_28493 ?auto_28495 ) ) ( ON-TABLE ?auto_28495 ) ( ON ?auto_28490 ?auto_28494 ) ( not ( = ?auto_28490 ?auto_28494 ) ) ( not ( = ?auto_28491 ?auto_28494 ) ) ( not ( = ?auto_28492 ?auto_28494 ) ) ( not ( = ?auto_28493 ?auto_28494 ) ) ( not ( = ?auto_28495 ?auto_28494 ) ) ( ON ?auto_28491 ?auto_28490 ) ( CLEAR ?auto_28491 ) ( ON-TABLE ?auto_28494 ) ( HOLDING ?auto_28492 ) ( CLEAR ?auto_28493 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28495 ?auto_28493 ?auto_28492 )
      ( MAKE-4PILE ?auto_28490 ?auto_28491 ?auto_28492 ?auto_28493 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28496 - BLOCK
      ?auto_28497 - BLOCK
      ?auto_28498 - BLOCK
      ?auto_28499 - BLOCK
    )
    :vars
    (
      ?auto_28501 - BLOCK
      ?auto_28500 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28496 ?auto_28497 ) ) ( not ( = ?auto_28496 ?auto_28498 ) ) ( not ( = ?auto_28496 ?auto_28499 ) ) ( not ( = ?auto_28497 ?auto_28498 ) ) ( not ( = ?auto_28497 ?auto_28499 ) ) ( not ( = ?auto_28498 ?auto_28499 ) ) ( ON ?auto_28499 ?auto_28501 ) ( not ( = ?auto_28496 ?auto_28501 ) ) ( not ( = ?auto_28497 ?auto_28501 ) ) ( not ( = ?auto_28498 ?auto_28501 ) ) ( not ( = ?auto_28499 ?auto_28501 ) ) ( ON-TABLE ?auto_28501 ) ( ON ?auto_28496 ?auto_28500 ) ( not ( = ?auto_28496 ?auto_28500 ) ) ( not ( = ?auto_28497 ?auto_28500 ) ) ( not ( = ?auto_28498 ?auto_28500 ) ) ( not ( = ?auto_28499 ?auto_28500 ) ) ( not ( = ?auto_28501 ?auto_28500 ) ) ( ON ?auto_28497 ?auto_28496 ) ( ON-TABLE ?auto_28500 ) ( CLEAR ?auto_28499 ) ( ON ?auto_28498 ?auto_28497 ) ( CLEAR ?auto_28498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28500 ?auto_28496 ?auto_28497 )
      ( MAKE-4PILE ?auto_28496 ?auto_28497 ?auto_28498 ?auto_28499 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28502 - BLOCK
      ?auto_28503 - BLOCK
      ?auto_28504 - BLOCK
      ?auto_28505 - BLOCK
    )
    :vars
    (
      ?auto_28507 - BLOCK
      ?auto_28506 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28502 ?auto_28503 ) ) ( not ( = ?auto_28502 ?auto_28504 ) ) ( not ( = ?auto_28502 ?auto_28505 ) ) ( not ( = ?auto_28503 ?auto_28504 ) ) ( not ( = ?auto_28503 ?auto_28505 ) ) ( not ( = ?auto_28504 ?auto_28505 ) ) ( not ( = ?auto_28502 ?auto_28507 ) ) ( not ( = ?auto_28503 ?auto_28507 ) ) ( not ( = ?auto_28504 ?auto_28507 ) ) ( not ( = ?auto_28505 ?auto_28507 ) ) ( ON-TABLE ?auto_28507 ) ( ON ?auto_28502 ?auto_28506 ) ( not ( = ?auto_28502 ?auto_28506 ) ) ( not ( = ?auto_28503 ?auto_28506 ) ) ( not ( = ?auto_28504 ?auto_28506 ) ) ( not ( = ?auto_28505 ?auto_28506 ) ) ( not ( = ?auto_28507 ?auto_28506 ) ) ( ON ?auto_28503 ?auto_28502 ) ( ON-TABLE ?auto_28506 ) ( ON ?auto_28504 ?auto_28503 ) ( CLEAR ?auto_28504 ) ( HOLDING ?auto_28505 ) ( CLEAR ?auto_28507 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28507 ?auto_28505 )
      ( MAKE-4PILE ?auto_28502 ?auto_28503 ?auto_28504 ?auto_28505 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28508 - BLOCK
      ?auto_28509 - BLOCK
      ?auto_28510 - BLOCK
      ?auto_28511 - BLOCK
    )
    :vars
    (
      ?auto_28512 - BLOCK
      ?auto_28513 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28508 ?auto_28509 ) ) ( not ( = ?auto_28508 ?auto_28510 ) ) ( not ( = ?auto_28508 ?auto_28511 ) ) ( not ( = ?auto_28509 ?auto_28510 ) ) ( not ( = ?auto_28509 ?auto_28511 ) ) ( not ( = ?auto_28510 ?auto_28511 ) ) ( not ( = ?auto_28508 ?auto_28512 ) ) ( not ( = ?auto_28509 ?auto_28512 ) ) ( not ( = ?auto_28510 ?auto_28512 ) ) ( not ( = ?auto_28511 ?auto_28512 ) ) ( ON-TABLE ?auto_28512 ) ( ON ?auto_28508 ?auto_28513 ) ( not ( = ?auto_28508 ?auto_28513 ) ) ( not ( = ?auto_28509 ?auto_28513 ) ) ( not ( = ?auto_28510 ?auto_28513 ) ) ( not ( = ?auto_28511 ?auto_28513 ) ) ( not ( = ?auto_28512 ?auto_28513 ) ) ( ON ?auto_28509 ?auto_28508 ) ( ON-TABLE ?auto_28513 ) ( ON ?auto_28510 ?auto_28509 ) ( CLEAR ?auto_28512 ) ( ON ?auto_28511 ?auto_28510 ) ( CLEAR ?auto_28511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28513 ?auto_28508 ?auto_28509 ?auto_28510 )
      ( MAKE-4PILE ?auto_28508 ?auto_28509 ?auto_28510 ?auto_28511 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28514 - BLOCK
      ?auto_28515 - BLOCK
      ?auto_28516 - BLOCK
      ?auto_28517 - BLOCK
    )
    :vars
    (
      ?auto_28519 - BLOCK
      ?auto_28518 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28514 ?auto_28515 ) ) ( not ( = ?auto_28514 ?auto_28516 ) ) ( not ( = ?auto_28514 ?auto_28517 ) ) ( not ( = ?auto_28515 ?auto_28516 ) ) ( not ( = ?auto_28515 ?auto_28517 ) ) ( not ( = ?auto_28516 ?auto_28517 ) ) ( not ( = ?auto_28514 ?auto_28519 ) ) ( not ( = ?auto_28515 ?auto_28519 ) ) ( not ( = ?auto_28516 ?auto_28519 ) ) ( not ( = ?auto_28517 ?auto_28519 ) ) ( ON ?auto_28514 ?auto_28518 ) ( not ( = ?auto_28514 ?auto_28518 ) ) ( not ( = ?auto_28515 ?auto_28518 ) ) ( not ( = ?auto_28516 ?auto_28518 ) ) ( not ( = ?auto_28517 ?auto_28518 ) ) ( not ( = ?auto_28519 ?auto_28518 ) ) ( ON ?auto_28515 ?auto_28514 ) ( ON-TABLE ?auto_28518 ) ( ON ?auto_28516 ?auto_28515 ) ( ON ?auto_28517 ?auto_28516 ) ( CLEAR ?auto_28517 ) ( HOLDING ?auto_28519 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28519 )
      ( MAKE-4PILE ?auto_28514 ?auto_28515 ?auto_28516 ?auto_28517 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_28520 - BLOCK
      ?auto_28521 - BLOCK
      ?auto_28522 - BLOCK
      ?auto_28523 - BLOCK
    )
    :vars
    (
      ?auto_28525 - BLOCK
      ?auto_28524 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28520 ?auto_28521 ) ) ( not ( = ?auto_28520 ?auto_28522 ) ) ( not ( = ?auto_28520 ?auto_28523 ) ) ( not ( = ?auto_28521 ?auto_28522 ) ) ( not ( = ?auto_28521 ?auto_28523 ) ) ( not ( = ?auto_28522 ?auto_28523 ) ) ( not ( = ?auto_28520 ?auto_28525 ) ) ( not ( = ?auto_28521 ?auto_28525 ) ) ( not ( = ?auto_28522 ?auto_28525 ) ) ( not ( = ?auto_28523 ?auto_28525 ) ) ( ON ?auto_28520 ?auto_28524 ) ( not ( = ?auto_28520 ?auto_28524 ) ) ( not ( = ?auto_28521 ?auto_28524 ) ) ( not ( = ?auto_28522 ?auto_28524 ) ) ( not ( = ?auto_28523 ?auto_28524 ) ) ( not ( = ?auto_28525 ?auto_28524 ) ) ( ON ?auto_28521 ?auto_28520 ) ( ON-TABLE ?auto_28524 ) ( ON ?auto_28522 ?auto_28521 ) ( ON ?auto_28523 ?auto_28522 ) ( ON ?auto_28525 ?auto_28523 ) ( CLEAR ?auto_28525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28524 ?auto_28520 ?auto_28521 ?auto_28522 ?auto_28523 )
      ( MAKE-4PILE ?auto_28520 ?auto_28521 ?auto_28522 ?auto_28523 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28531 - BLOCK
      ?auto_28532 - BLOCK
      ?auto_28533 - BLOCK
      ?auto_28534 - BLOCK
      ?auto_28535 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_28535 ) ( CLEAR ?auto_28534 ) ( ON-TABLE ?auto_28531 ) ( ON ?auto_28532 ?auto_28531 ) ( ON ?auto_28533 ?auto_28532 ) ( ON ?auto_28534 ?auto_28533 ) ( not ( = ?auto_28531 ?auto_28532 ) ) ( not ( = ?auto_28531 ?auto_28533 ) ) ( not ( = ?auto_28531 ?auto_28534 ) ) ( not ( = ?auto_28531 ?auto_28535 ) ) ( not ( = ?auto_28532 ?auto_28533 ) ) ( not ( = ?auto_28532 ?auto_28534 ) ) ( not ( = ?auto_28532 ?auto_28535 ) ) ( not ( = ?auto_28533 ?auto_28534 ) ) ( not ( = ?auto_28533 ?auto_28535 ) ) ( not ( = ?auto_28534 ?auto_28535 ) ) )
    :subtasks
    ( ( !STACK ?auto_28535 ?auto_28534 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28536 - BLOCK
      ?auto_28537 - BLOCK
      ?auto_28538 - BLOCK
      ?auto_28539 - BLOCK
      ?auto_28540 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_28539 ) ( ON-TABLE ?auto_28536 ) ( ON ?auto_28537 ?auto_28536 ) ( ON ?auto_28538 ?auto_28537 ) ( ON ?auto_28539 ?auto_28538 ) ( not ( = ?auto_28536 ?auto_28537 ) ) ( not ( = ?auto_28536 ?auto_28538 ) ) ( not ( = ?auto_28536 ?auto_28539 ) ) ( not ( = ?auto_28536 ?auto_28540 ) ) ( not ( = ?auto_28537 ?auto_28538 ) ) ( not ( = ?auto_28537 ?auto_28539 ) ) ( not ( = ?auto_28537 ?auto_28540 ) ) ( not ( = ?auto_28538 ?auto_28539 ) ) ( not ( = ?auto_28538 ?auto_28540 ) ) ( not ( = ?auto_28539 ?auto_28540 ) ) ( ON-TABLE ?auto_28540 ) ( CLEAR ?auto_28540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_28540 )
      ( MAKE-5PILE ?auto_28536 ?auto_28537 ?auto_28538 ?auto_28539 ?auto_28540 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28541 - BLOCK
      ?auto_28542 - BLOCK
      ?auto_28543 - BLOCK
      ?auto_28544 - BLOCK
      ?auto_28545 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28541 ) ( ON ?auto_28542 ?auto_28541 ) ( ON ?auto_28543 ?auto_28542 ) ( not ( = ?auto_28541 ?auto_28542 ) ) ( not ( = ?auto_28541 ?auto_28543 ) ) ( not ( = ?auto_28541 ?auto_28544 ) ) ( not ( = ?auto_28541 ?auto_28545 ) ) ( not ( = ?auto_28542 ?auto_28543 ) ) ( not ( = ?auto_28542 ?auto_28544 ) ) ( not ( = ?auto_28542 ?auto_28545 ) ) ( not ( = ?auto_28543 ?auto_28544 ) ) ( not ( = ?auto_28543 ?auto_28545 ) ) ( not ( = ?auto_28544 ?auto_28545 ) ) ( ON-TABLE ?auto_28545 ) ( CLEAR ?auto_28545 ) ( HOLDING ?auto_28544 ) ( CLEAR ?auto_28543 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28541 ?auto_28542 ?auto_28543 ?auto_28544 )
      ( MAKE-5PILE ?auto_28541 ?auto_28542 ?auto_28543 ?auto_28544 ?auto_28545 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28546 - BLOCK
      ?auto_28547 - BLOCK
      ?auto_28548 - BLOCK
      ?auto_28549 - BLOCK
      ?auto_28550 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28546 ) ( ON ?auto_28547 ?auto_28546 ) ( ON ?auto_28548 ?auto_28547 ) ( not ( = ?auto_28546 ?auto_28547 ) ) ( not ( = ?auto_28546 ?auto_28548 ) ) ( not ( = ?auto_28546 ?auto_28549 ) ) ( not ( = ?auto_28546 ?auto_28550 ) ) ( not ( = ?auto_28547 ?auto_28548 ) ) ( not ( = ?auto_28547 ?auto_28549 ) ) ( not ( = ?auto_28547 ?auto_28550 ) ) ( not ( = ?auto_28548 ?auto_28549 ) ) ( not ( = ?auto_28548 ?auto_28550 ) ) ( not ( = ?auto_28549 ?auto_28550 ) ) ( ON-TABLE ?auto_28550 ) ( CLEAR ?auto_28548 ) ( ON ?auto_28549 ?auto_28550 ) ( CLEAR ?auto_28549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28550 )
      ( MAKE-5PILE ?auto_28546 ?auto_28547 ?auto_28548 ?auto_28549 ?auto_28550 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28551 - BLOCK
      ?auto_28552 - BLOCK
      ?auto_28553 - BLOCK
      ?auto_28554 - BLOCK
      ?auto_28555 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28551 ) ( ON ?auto_28552 ?auto_28551 ) ( not ( = ?auto_28551 ?auto_28552 ) ) ( not ( = ?auto_28551 ?auto_28553 ) ) ( not ( = ?auto_28551 ?auto_28554 ) ) ( not ( = ?auto_28551 ?auto_28555 ) ) ( not ( = ?auto_28552 ?auto_28553 ) ) ( not ( = ?auto_28552 ?auto_28554 ) ) ( not ( = ?auto_28552 ?auto_28555 ) ) ( not ( = ?auto_28553 ?auto_28554 ) ) ( not ( = ?auto_28553 ?auto_28555 ) ) ( not ( = ?auto_28554 ?auto_28555 ) ) ( ON-TABLE ?auto_28555 ) ( ON ?auto_28554 ?auto_28555 ) ( CLEAR ?auto_28554 ) ( HOLDING ?auto_28553 ) ( CLEAR ?auto_28552 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28551 ?auto_28552 ?auto_28553 )
      ( MAKE-5PILE ?auto_28551 ?auto_28552 ?auto_28553 ?auto_28554 ?auto_28555 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28556 - BLOCK
      ?auto_28557 - BLOCK
      ?auto_28558 - BLOCK
      ?auto_28559 - BLOCK
      ?auto_28560 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28556 ) ( ON ?auto_28557 ?auto_28556 ) ( not ( = ?auto_28556 ?auto_28557 ) ) ( not ( = ?auto_28556 ?auto_28558 ) ) ( not ( = ?auto_28556 ?auto_28559 ) ) ( not ( = ?auto_28556 ?auto_28560 ) ) ( not ( = ?auto_28557 ?auto_28558 ) ) ( not ( = ?auto_28557 ?auto_28559 ) ) ( not ( = ?auto_28557 ?auto_28560 ) ) ( not ( = ?auto_28558 ?auto_28559 ) ) ( not ( = ?auto_28558 ?auto_28560 ) ) ( not ( = ?auto_28559 ?auto_28560 ) ) ( ON-TABLE ?auto_28560 ) ( ON ?auto_28559 ?auto_28560 ) ( CLEAR ?auto_28557 ) ( ON ?auto_28558 ?auto_28559 ) ( CLEAR ?auto_28558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28560 ?auto_28559 )
      ( MAKE-5PILE ?auto_28556 ?auto_28557 ?auto_28558 ?auto_28559 ?auto_28560 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28561 - BLOCK
      ?auto_28562 - BLOCK
      ?auto_28563 - BLOCK
      ?auto_28564 - BLOCK
      ?auto_28565 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28561 ) ( not ( = ?auto_28561 ?auto_28562 ) ) ( not ( = ?auto_28561 ?auto_28563 ) ) ( not ( = ?auto_28561 ?auto_28564 ) ) ( not ( = ?auto_28561 ?auto_28565 ) ) ( not ( = ?auto_28562 ?auto_28563 ) ) ( not ( = ?auto_28562 ?auto_28564 ) ) ( not ( = ?auto_28562 ?auto_28565 ) ) ( not ( = ?auto_28563 ?auto_28564 ) ) ( not ( = ?auto_28563 ?auto_28565 ) ) ( not ( = ?auto_28564 ?auto_28565 ) ) ( ON-TABLE ?auto_28565 ) ( ON ?auto_28564 ?auto_28565 ) ( ON ?auto_28563 ?auto_28564 ) ( CLEAR ?auto_28563 ) ( HOLDING ?auto_28562 ) ( CLEAR ?auto_28561 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28561 ?auto_28562 )
      ( MAKE-5PILE ?auto_28561 ?auto_28562 ?auto_28563 ?auto_28564 ?auto_28565 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28566 - BLOCK
      ?auto_28567 - BLOCK
      ?auto_28568 - BLOCK
      ?auto_28569 - BLOCK
      ?auto_28570 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28566 ) ( not ( = ?auto_28566 ?auto_28567 ) ) ( not ( = ?auto_28566 ?auto_28568 ) ) ( not ( = ?auto_28566 ?auto_28569 ) ) ( not ( = ?auto_28566 ?auto_28570 ) ) ( not ( = ?auto_28567 ?auto_28568 ) ) ( not ( = ?auto_28567 ?auto_28569 ) ) ( not ( = ?auto_28567 ?auto_28570 ) ) ( not ( = ?auto_28568 ?auto_28569 ) ) ( not ( = ?auto_28568 ?auto_28570 ) ) ( not ( = ?auto_28569 ?auto_28570 ) ) ( ON-TABLE ?auto_28570 ) ( ON ?auto_28569 ?auto_28570 ) ( ON ?auto_28568 ?auto_28569 ) ( CLEAR ?auto_28566 ) ( ON ?auto_28567 ?auto_28568 ) ( CLEAR ?auto_28567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28570 ?auto_28569 ?auto_28568 )
      ( MAKE-5PILE ?auto_28566 ?auto_28567 ?auto_28568 ?auto_28569 ?auto_28570 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28571 - BLOCK
      ?auto_28572 - BLOCK
      ?auto_28573 - BLOCK
      ?auto_28574 - BLOCK
      ?auto_28575 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28571 ?auto_28572 ) ) ( not ( = ?auto_28571 ?auto_28573 ) ) ( not ( = ?auto_28571 ?auto_28574 ) ) ( not ( = ?auto_28571 ?auto_28575 ) ) ( not ( = ?auto_28572 ?auto_28573 ) ) ( not ( = ?auto_28572 ?auto_28574 ) ) ( not ( = ?auto_28572 ?auto_28575 ) ) ( not ( = ?auto_28573 ?auto_28574 ) ) ( not ( = ?auto_28573 ?auto_28575 ) ) ( not ( = ?auto_28574 ?auto_28575 ) ) ( ON-TABLE ?auto_28575 ) ( ON ?auto_28574 ?auto_28575 ) ( ON ?auto_28573 ?auto_28574 ) ( ON ?auto_28572 ?auto_28573 ) ( CLEAR ?auto_28572 ) ( HOLDING ?auto_28571 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28571 )
      ( MAKE-5PILE ?auto_28571 ?auto_28572 ?auto_28573 ?auto_28574 ?auto_28575 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28576 - BLOCK
      ?auto_28577 - BLOCK
      ?auto_28578 - BLOCK
      ?auto_28579 - BLOCK
      ?auto_28580 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28576 ?auto_28577 ) ) ( not ( = ?auto_28576 ?auto_28578 ) ) ( not ( = ?auto_28576 ?auto_28579 ) ) ( not ( = ?auto_28576 ?auto_28580 ) ) ( not ( = ?auto_28577 ?auto_28578 ) ) ( not ( = ?auto_28577 ?auto_28579 ) ) ( not ( = ?auto_28577 ?auto_28580 ) ) ( not ( = ?auto_28578 ?auto_28579 ) ) ( not ( = ?auto_28578 ?auto_28580 ) ) ( not ( = ?auto_28579 ?auto_28580 ) ) ( ON-TABLE ?auto_28580 ) ( ON ?auto_28579 ?auto_28580 ) ( ON ?auto_28578 ?auto_28579 ) ( ON ?auto_28577 ?auto_28578 ) ( ON ?auto_28576 ?auto_28577 ) ( CLEAR ?auto_28576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28580 ?auto_28579 ?auto_28578 ?auto_28577 )
      ( MAKE-5PILE ?auto_28576 ?auto_28577 ?auto_28578 ?auto_28579 ?auto_28580 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28581 - BLOCK
      ?auto_28582 - BLOCK
      ?auto_28583 - BLOCK
      ?auto_28584 - BLOCK
      ?auto_28585 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28581 ?auto_28582 ) ) ( not ( = ?auto_28581 ?auto_28583 ) ) ( not ( = ?auto_28581 ?auto_28584 ) ) ( not ( = ?auto_28581 ?auto_28585 ) ) ( not ( = ?auto_28582 ?auto_28583 ) ) ( not ( = ?auto_28582 ?auto_28584 ) ) ( not ( = ?auto_28582 ?auto_28585 ) ) ( not ( = ?auto_28583 ?auto_28584 ) ) ( not ( = ?auto_28583 ?auto_28585 ) ) ( not ( = ?auto_28584 ?auto_28585 ) ) ( ON-TABLE ?auto_28585 ) ( ON ?auto_28584 ?auto_28585 ) ( ON ?auto_28583 ?auto_28584 ) ( ON ?auto_28582 ?auto_28583 ) ( HOLDING ?auto_28581 ) ( CLEAR ?auto_28582 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28585 ?auto_28584 ?auto_28583 ?auto_28582 ?auto_28581 )
      ( MAKE-5PILE ?auto_28581 ?auto_28582 ?auto_28583 ?auto_28584 ?auto_28585 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28586 - BLOCK
      ?auto_28587 - BLOCK
      ?auto_28588 - BLOCK
      ?auto_28589 - BLOCK
      ?auto_28590 - BLOCK
    )
    :vars
    (
      ?auto_28591 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28586 ?auto_28587 ) ) ( not ( = ?auto_28586 ?auto_28588 ) ) ( not ( = ?auto_28586 ?auto_28589 ) ) ( not ( = ?auto_28586 ?auto_28590 ) ) ( not ( = ?auto_28587 ?auto_28588 ) ) ( not ( = ?auto_28587 ?auto_28589 ) ) ( not ( = ?auto_28587 ?auto_28590 ) ) ( not ( = ?auto_28588 ?auto_28589 ) ) ( not ( = ?auto_28588 ?auto_28590 ) ) ( not ( = ?auto_28589 ?auto_28590 ) ) ( ON-TABLE ?auto_28590 ) ( ON ?auto_28589 ?auto_28590 ) ( ON ?auto_28588 ?auto_28589 ) ( ON ?auto_28587 ?auto_28588 ) ( CLEAR ?auto_28587 ) ( ON ?auto_28586 ?auto_28591 ) ( CLEAR ?auto_28586 ) ( HAND-EMPTY ) ( not ( = ?auto_28586 ?auto_28591 ) ) ( not ( = ?auto_28587 ?auto_28591 ) ) ( not ( = ?auto_28588 ?auto_28591 ) ) ( not ( = ?auto_28589 ?auto_28591 ) ) ( not ( = ?auto_28590 ?auto_28591 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28586 ?auto_28591 )
      ( MAKE-5PILE ?auto_28586 ?auto_28587 ?auto_28588 ?auto_28589 ?auto_28590 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28592 - BLOCK
      ?auto_28593 - BLOCK
      ?auto_28594 - BLOCK
      ?auto_28595 - BLOCK
      ?auto_28596 - BLOCK
    )
    :vars
    (
      ?auto_28597 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28592 ?auto_28593 ) ) ( not ( = ?auto_28592 ?auto_28594 ) ) ( not ( = ?auto_28592 ?auto_28595 ) ) ( not ( = ?auto_28592 ?auto_28596 ) ) ( not ( = ?auto_28593 ?auto_28594 ) ) ( not ( = ?auto_28593 ?auto_28595 ) ) ( not ( = ?auto_28593 ?auto_28596 ) ) ( not ( = ?auto_28594 ?auto_28595 ) ) ( not ( = ?auto_28594 ?auto_28596 ) ) ( not ( = ?auto_28595 ?auto_28596 ) ) ( ON-TABLE ?auto_28596 ) ( ON ?auto_28595 ?auto_28596 ) ( ON ?auto_28594 ?auto_28595 ) ( ON ?auto_28592 ?auto_28597 ) ( CLEAR ?auto_28592 ) ( not ( = ?auto_28592 ?auto_28597 ) ) ( not ( = ?auto_28593 ?auto_28597 ) ) ( not ( = ?auto_28594 ?auto_28597 ) ) ( not ( = ?auto_28595 ?auto_28597 ) ) ( not ( = ?auto_28596 ?auto_28597 ) ) ( HOLDING ?auto_28593 ) ( CLEAR ?auto_28594 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28596 ?auto_28595 ?auto_28594 ?auto_28593 )
      ( MAKE-5PILE ?auto_28592 ?auto_28593 ?auto_28594 ?auto_28595 ?auto_28596 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28598 - BLOCK
      ?auto_28599 - BLOCK
      ?auto_28600 - BLOCK
      ?auto_28601 - BLOCK
      ?auto_28602 - BLOCK
    )
    :vars
    (
      ?auto_28603 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28598 ?auto_28599 ) ) ( not ( = ?auto_28598 ?auto_28600 ) ) ( not ( = ?auto_28598 ?auto_28601 ) ) ( not ( = ?auto_28598 ?auto_28602 ) ) ( not ( = ?auto_28599 ?auto_28600 ) ) ( not ( = ?auto_28599 ?auto_28601 ) ) ( not ( = ?auto_28599 ?auto_28602 ) ) ( not ( = ?auto_28600 ?auto_28601 ) ) ( not ( = ?auto_28600 ?auto_28602 ) ) ( not ( = ?auto_28601 ?auto_28602 ) ) ( ON-TABLE ?auto_28602 ) ( ON ?auto_28601 ?auto_28602 ) ( ON ?auto_28600 ?auto_28601 ) ( ON ?auto_28598 ?auto_28603 ) ( not ( = ?auto_28598 ?auto_28603 ) ) ( not ( = ?auto_28599 ?auto_28603 ) ) ( not ( = ?auto_28600 ?auto_28603 ) ) ( not ( = ?auto_28601 ?auto_28603 ) ) ( not ( = ?auto_28602 ?auto_28603 ) ) ( CLEAR ?auto_28600 ) ( ON ?auto_28599 ?auto_28598 ) ( CLEAR ?auto_28599 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28603 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28603 ?auto_28598 )
      ( MAKE-5PILE ?auto_28598 ?auto_28599 ?auto_28600 ?auto_28601 ?auto_28602 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28604 - BLOCK
      ?auto_28605 - BLOCK
      ?auto_28606 - BLOCK
      ?auto_28607 - BLOCK
      ?auto_28608 - BLOCK
    )
    :vars
    (
      ?auto_28609 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28604 ?auto_28605 ) ) ( not ( = ?auto_28604 ?auto_28606 ) ) ( not ( = ?auto_28604 ?auto_28607 ) ) ( not ( = ?auto_28604 ?auto_28608 ) ) ( not ( = ?auto_28605 ?auto_28606 ) ) ( not ( = ?auto_28605 ?auto_28607 ) ) ( not ( = ?auto_28605 ?auto_28608 ) ) ( not ( = ?auto_28606 ?auto_28607 ) ) ( not ( = ?auto_28606 ?auto_28608 ) ) ( not ( = ?auto_28607 ?auto_28608 ) ) ( ON-TABLE ?auto_28608 ) ( ON ?auto_28607 ?auto_28608 ) ( ON ?auto_28604 ?auto_28609 ) ( not ( = ?auto_28604 ?auto_28609 ) ) ( not ( = ?auto_28605 ?auto_28609 ) ) ( not ( = ?auto_28606 ?auto_28609 ) ) ( not ( = ?auto_28607 ?auto_28609 ) ) ( not ( = ?auto_28608 ?auto_28609 ) ) ( ON ?auto_28605 ?auto_28604 ) ( CLEAR ?auto_28605 ) ( ON-TABLE ?auto_28609 ) ( HOLDING ?auto_28606 ) ( CLEAR ?auto_28607 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28608 ?auto_28607 ?auto_28606 )
      ( MAKE-5PILE ?auto_28604 ?auto_28605 ?auto_28606 ?auto_28607 ?auto_28608 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28610 - BLOCK
      ?auto_28611 - BLOCK
      ?auto_28612 - BLOCK
      ?auto_28613 - BLOCK
      ?auto_28614 - BLOCK
    )
    :vars
    (
      ?auto_28615 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28610 ?auto_28611 ) ) ( not ( = ?auto_28610 ?auto_28612 ) ) ( not ( = ?auto_28610 ?auto_28613 ) ) ( not ( = ?auto_28610 ?auto_28614 ) ) ( not ( = ?auto_28611 ?auto_28612 ) ) ( not ( = ?auto_28611 ?auto_28613 ) ) ( not ( = ?auto_28611 ?auto_28614 ) ) ( not ( = ?auto_28612 ?auto_28613 ) ) ( not ( = ?auto_28612 ?auto_28614 ) ) ( not ( = ?auto_28613 ?auto_28614 ) ) ( ON-TABLE ?auto_28614 ) ( ON ?auto_28613 ?auto_28614 ) ( ON ?auto_28610 ?auto_28615 ) ( not ( = ?auto_28610 ?auto_28615 ) ) ( not ( = ?auto_28611 ?auto_28615 ) ) ( not ( = ?auto_28612 ?auto_28615 ) ) ( not ( = ?auto_28613 ?auto_28615 ) ) ( not ( = ?auto_28614 ?auto_28615 ) ) ( ON ?auto_28611 ?auto_28610 ) ( ON-TABLE ?auto_28615 ) ( CLEAR ?auto_28613 ) ( ON ?auto_28612 ?auto_28611 ) ( CLEAR ?auto_28612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28615 ?auto_28610 ?auto_28611 )
      ( MAKE-5PILE ?auto_28610 ?auto_28611 ?auto_28612 ?auto_28613 ?auto_28614 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28616 - BLOCK
      ?auto_28617 - BLOCK
      ?auto_28618 - BLOCK
      ?auto_28619 - BLOCK
      ?auto_28620 - BLOCK
    )
    :vars
    (
      ?auto_28621 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28616 ?auto_28617 ) ) ( not ( = ?auto_28616 ?auto_28618 ) ) ( not ( = ?auto_28616 ?auto_28619 ) ) ( not ( = ?auto_28616 ?auto_28620 ) ) ( not ( = ?auto_28617 ?auto_28618 ) ) ( not ( = ?auto_28617 ?auto_28619 ) ) ( not ( = ?auto_28617 ?auto_28620 ) ) ( not ( = ?auto_28618 ?auto_28619 ) ) ( not ( = ?auto_28618 ?auto_28620 ) ) ( not ( = ?auto_28619 ?auto_28620 ) ) ( ON-TABLE ?auto_28620 ) ( ON ?auto_28616 ?auto_28621 ) ( not ( = ?auto_28616 ?auto_28621 ) ) ( not ( = ?auto_28617 ?auto_28621 ) ) ( not ( = ?auto_28618 ?auto_28621 ) ) ( not ( = ?auto_28619 ?auto_28621 ) ) ( not ( = ?auto_28620 ?auto_28621 ) ) ( ON ?auto_28617 ?auto_28616 ) ( ON-TABLE ?auto_28621 ) ( ON ?auto_28618 ?auto_28617 ) ( CLEAR ?auto_28618 ) ( HOLDING ?auto_28619 ) ( CLEAR ?auto_28620 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28620 ?auto_28619 )
      ( MAKE-5PILE ?auto_28616 ?auto_28617 ?auto_28618 ?auto_28619 ?auto_28620 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28622 - BLOCK
      ?auto_28623 - BLOCK
      ?auto_28624 - BLOCK
      ?auto_28625 - BLOCK
      ?auto_28626 - BLOCK
    )
    :vars
    (
      ?auto_28627 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28622 ?auto_28623 ) ) ( not ( = ?auto_28622 ?auto_28624 ) ) ( not ( = ?auto_28622 ?auto_28625 ) ) ( not ( = ?auto_28622 ?auto_28626 ) ) ( not ( = ?auto_28623 ?auto_28624 ) ) ( not ( = ?auto_28623 ?auto_28625 ) ) ( not ( = ?auto_28623 ?auto_28626 ) ) ( not ( = ?auto_28624 ?auto_28625 ) ) ( not ( = ?auto_28624 ?auto_28626 ) ) ( not ( = ?auto_28625 ?auto_28626 ) ) ( ON-TABLE ?auto_28626 ) ( ON ?auto_28622 ?auto_28627 ) ( not ( = ?auto_28622 ?auto_28627 ) ) ( not ( = ?auto_28623 ?auto_28627 ) ) ( not ( = ?auto_28624 ?auto_28627 ) ) ( not ( = ?auto_28625 ?auto_28627 ) ) ( not ( = ?auto_28626 ?auto_28627 ) ) ( ON ?auto_28623 ?auto_28622 ) ( ON-TABLE ?auto_28627 ) ( ON ?auto_28624 ?auto_28623 ) ( CLEAR ?auto_28626 ) ( ON ?auto_28625 ?auto_28624 ) ( CLEAR ?auto_28625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28627 ?auto_28622 ?auto_28623 ?auto_28624 )
      ( MAKE-5PILE ?auto_28622 ?auto_28623 ?auto_28624 ?auto_28625 ?auto_28626 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28628 - BLOCK
      ?auto_28629 - BLOCK
      ?auto_28630 - BLOCK
      ?auto_28631 - BLOCK
      ?auto_28632 - BLOCK
    )
    :vars
    (
      ?auto_28633 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28628 ?auto_28629 ) ) ( not ( = ?auto_28628 ?auto_28630 ) ) ( not ( = ?auto_28628 ?auto_28631 ) ) ( not ( = ?auto_28628 ?auto_28632 ) ) ( not ( = ?auto_28629 ?auto_28630 ) ) ( not ( = ?auto_28629 ?auto_28631 ) ) ( not ( = ?auto_28629 ?auto_28632 ) ) ( not ( = ?auto_28630 ?auto_28631 ) ) ( not ( = ?auto_28630 ?auto_28632 ) ) ( not ( = ?auto_28631 ?auto_28632 ) ) ( ON ?auto_28628 ?auto_28633 ) ( not ( = ?auto_28628 ?auto_28633 ) ) ( not ( = ?auto_28629 ?auto_28633 ) ) ( not ( = ?auto_28630 ?auto_28633 ) ) ( not ( = ?auto_28631 ?auto_28633 ) ) ( not ( = ?auto_28632 ?auto_28633 ) ) ( ON ?auto_28629 ?auto_28628 ) ( ON-TABLE ?auto_28633 ) ( ON ?auto_28630 ?auto_28629 ) ( ON ?auto_28631 ?auto_28630 ) ( CLEAR ?auto_28631 ) ( HOLDING ?auto_28632 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28632 )
      ( MAKE-5PILE ?auto_28628 ?auto_28629 ?auto_28630 ?auto_28631 ?auto_28632 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_28634 - BLOCK
      ?auto_28635 - BLOCK
      ?auto_28636 - BLOCK
      ?auto_28637 - BLOCK
      ?auto_28638 - BLOCK
    )
    :vars
    (
      ?auto_28639 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28634 ?auto_28635 ) ) ( not ( = ?auto_28634 ?auto_28636 ) ) ( not ( = ?auto_28634 ?auto_28637 ) ) ( not ( = ?auto_28634 ?auto_28638 ) ) ( not ( = ?auto_28635 ?auto_28636 ) ) ( not ( = ?auto_28635 ?auto_28637 ) ) ( not ( = ?auto_28635 ?auto_28638 ) ) ( not ( = ?auto_28636 ?auto_28637 ) ) ( not ( = ?auto_28636 ?auto_28638 ) ) ( not ( = ?auto_28637 ?auto_28638 ) ) ( ON ?auto_28634 ?auto_28639 ) ( not ( = ?auto_28634 ?auto_28639 ) ) ( not ( = ?auto_28635 ?auto_28639 ) ) ( not ( = ?auto_28636 ?auto_28639 ) ) ( not ( = ?auto_28637 ?auto_28639 ) ) ( not ( = ?auto_28638 ?auto_28639 ) ) ( ON ?auto_28635 ?auto_28634 ) ( ON-TABLE ?auto_28639 ) ( ON ?auto_28636 ?auto_28635 ) ( ON ?auto_28637 ?auto_28636 ) ( ON ?auto_28638 ?auto_28637 ) ( CLEAR ?auto_28638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28639 ?auto_28634 ?auto_28635 ?auto_28636 ?auto_28637 )
      ( MAKE-5PILE ?auto_28634 ?auto_28635 ?auto_28636 ?auto_28637 ?auto_28638 ) )
  )

)

