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

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98579 - BLOCK
      ?auto_98580 - BLOCK
      ?auto_98581 - BLOCK
      ?auto_98582 - BLOCK
      ?auto_98583 - BLOCK
      ?auto_98584 - BLOCK
      ?auto_98585 - BLOCK
    )
    :vars
    (
      ?auto_98586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98586 ?auto_98585 ) ( CLEAR ?auto_98586 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98579 ) ( ON ?auto_98580 ?auto_98579 ) ( ON ?auto_98581 ?auto_98580 ) ( ON ?auto_98582 ?auto_98581 ) ( ON ?auto_98583 ?auto_98582 ) ( ON ?auto_98584 ?auto_98583 ) ( ON ?auto_98585 ?auto_98584 ) ( not ( = ?auto_98579 ?auto_98580 ) ) ( not ( = ?auto_98579 ?auto_98581 ) ) ( not ( = ?auto_98579 ?auto_98582 ) ) ( not ( = ?auto_98579 ?auto_98583 ) ) ( not ( = ?auto_98579 ?auto_98584 ) ) ( not ( = ?auto_98579 ?auto_98585 ) ) ( not ( = ?auto_98579 ?auto_98586 ) ) ( not ( = ?auto_98580 ?auto_98581 ) ) ( not ( = ?auto_98580 ?auto_98582 ) ) ( not ( = ?auto_98580 ?auto_98583 ) ) ( not ( = ?auto_98580 ?auto_98584 ) ) ( not ( = ?auto_98580 ?auto_98585 ) ) ( not ( = ?auto_98580 ?auto_98586 ) ) ( not ( = ?auto_98581 ?auto_98582 ) ) ( not ( = ?auto_98581 ?auto_98583 ) ) ( not ( = ?auto_98581 ?auto_98584 ) ) ( not ( = ?auto_98581 ?auto_98585 ) ) ( not ( = ?auto_98581 ?auto_98586 ) ) ( not ( = ?auto_98582 ?auto_98583 ) ) ( not ( = ?auto_98582 ?auto_98584 ) ) ( not ( = ?auto_98582 ?auto_98585 ) ) ( not ( = ?auto_98582 ?auto_98586 ) ) ( not ( = ?auto_98583 ?auto_98584 ) ) ( not ( = ?auto_98583 ?auto_98585 ) ) ( not ( = ?auto_98583 ?auto_98586 ) ) ( not ( = ?auto_98584 ?auto_98585 ) ) ( not ( = ?auto_98584 ?auto_98586 ) ) ( not ( = ?auto_98585 ?auto_98586 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_98586 ?auto_98585 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_98588 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_98588 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_98588 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_98589 - BLOCK
    )
    :vars
    (
      ?auto_98590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98589 ?auto_98590 ) ( CLEAR ?auto_98589 ) ( HAND-EMPTY ) ( not ( = ?auto_98589 ?auto_98590 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_98589 ?auto_98590 )
      ( MAKE-1PILE ?auto_98589 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98597 - BLOCK
      ?auto_98598 - BLOCK
      ?auto_98599 - BLOCK
      ?auto_98600 - BLOCK
      ?auto_98601 - BLOCK
      ?auto_98602 - BLOCK
    )
    :vars
    (
      ?auto_98603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98603 ?auto_98602 ) ( CLEAR ?auto_98603 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98597 ) ( ON ?auto_98598 ?auto_98597 ) ( ON ?auto_98599 ?auto_98598 ) ( ON ?auto_98600 ?auto_98599 ) ( ON ?auto_98601 ?auto_98600 ) ( ON ?auto_98602 ?auto_98601 ) ( not ( = ?auto_98597 ?auto_98598 ) ) ( not ( = ?auto_98597 ?auto_98599 ) ) ( not ( = ?auto_98597 ?auto_98600 ) ) ( not ( = ?auto_98597 ?auto_98601 ) ) ( not ( = ?auto_98597 ?auto_98602 ) ) ( not ( = ?auto_98597 ?auto_98603 ) ) ( not ( = ?auto_98598 ?auto_98599 ) ) ( not ( = ?auto_98598 ?auto_98600 ) ) ( not ( = ?auto_98598 ?auto_98601 ) ) ( not ( = ?auto_98598 ?auto_98602 ) ) ( not ( = ?auto_98598 ?auto_98603 ) ) ( not ( = ?auto_98599 ?auto_98600 ) ) ( not ( = ?auto_98599 ?auto_98601 ) ) ( not ( = ?auto_98599 ?auto_98602 ) ) ( not ( = ?auto_98599 ?auto_98603 ) ) ( not ( = ?auto_98600 ?auto_98601 ) ) ( not ( = ?auto_98600 ?auto_98602 ) ) ( not ( = ?auto_98600 ?auto_98603 ) ) ( not ( = ?auto_98601 ?auto_98602 ) ) ( not ( = ?auto_98601 ?auto_98603 ) ) ( not ( = ?auto_98602 ?auto_98603 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_98603 ?auto_98602 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98604 - BLOCK
      ?auto_98605 - BLOCK
      ?auto_98606 - BLOCK
      ?auto_98607 - BLOCK
      ?auto_98608 - BLOCK
      ?auto_98609 - BLOCK
    )
    :vars
    (
      ?auto_98610 - BLOCK
      ?auto_98611 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98610 ?auto_98609 ) ( CLEAR ?auto_98610 ) ( ON-TABLE ?auto_98604 ) ( ON ?auto_98605 ?auto_98604 ) ( ON ?auto_98606 ?auto_98605 ) ( ON ?auto_98607 ?auto_98606 ) ( ON ?auto_98608 ?auto_98607 ) ( ON ?auto_98609 ?auto_98608 ) ( not ( = ?auto_98604 ?auto_98605 ) ) ( not ( = ?auto_98604 ?auto_98606 ) ) ( not ( = ?auto_98604 ?auto_98607 ) ) ( not ( = ?auto_98604 ?auto_98608 ) ) ( not ( = ?auto_98604 ?auto_98609 ) ) ( not ( = ?auto_98604 ?auto_98610 ) ) ( not ( = ?auto_98605 ?auto_98606 ) ) ( not ( = ?auto_98605 ?auto_98607 ) ) ( not ( = ?auto_98605 ?auto_98608 ) ) ( not ( = ?auto_98605 ?auto_98609 ) ) ( not ( = ?auto_98605 ?auto_98610 ) ) ( not ( = ?auto_98606 ?auto_98607 ) ) ( not ( = ?auto_98606 ?auto_98608 ) ) ( not ( = ?auto_98606 ?auto_98609 ) ) ( not ( = ?auto_98606 ?auto_98610 ) ) ( not ( = ?auto_98607 ?auto_98608 ) ) ( not ( = ?auto_98607 ?auto_98609 ) ) ( not ( = ?auto_98607 ?auto_98610 ) ) ( not ( = ?auto_98608 ?auto_98609 ) ) ( not ( = ?auto_98608 ?auto_98610 ) ) ( not ( = ?auto_98609 ?auto_98610 ) ) ( HOLDING ?auto_98611 ) ( not ( = ?auto_98604 ?auto_98611 ) ) ( not ( = ?auto_98605 ?auto_98611 ) ) ( not ( = ?auto_98606 ?auto_98611 ) ) ( not ( = ?auto_98607 ?auto_98611 ) ) ( not ( = ?auto_98608 ?auto_98611 ) ) ( not ( = ?auto_98609 ?auto_98611 ) ) ( not ( = ?auto_98610 ?auto_98611 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_98611 )
      ( MAKE-6PILE ?auto_98604 ?auto_98605 ?auto_98606 ?auto_98607 ?auto_98608 ?auto_98609 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98612 - BLOCK
      ?auto_98613 - BLOCK
      ?auto_98614 - BLOCK
      ?auto_98615 - BLOCK
      ?auto_98616 - BLOCK
      ?auto_98617 - BLOCK
    )
    :vars
    (
      ?auto_98618 - BLOCK
      ?auto_98619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98618 ?auto_98617 ) ( ON-TABLE ?auto_98612 ) ( ON ?auto_98613 ?auto_98612 ) ( ON ?auto_98614 ?auto_98613 ) ( ON ?auto_98615 ?auto_98614 ) ( ON ?auto_98616 ?auto_98615 ) ( ON ?auto_98617 ?auto_98616 ) ( not ( = ?auto_98612 ?auto_98613 ) ) ( not ( = ?auto_98612 ?auto_98614 ) ) ( not ( = ?auto_98612 ?auto_98615 ) ) ( not ( = ?auto_98612 ?auto_98616 ) ) ( not ( = ?auto_98612 ?auto_98617 ) ) ( not ( = ?auto_98612 ?auto_98618 ) ) ( not ( = ?auto_98613 ?auto_98614 ) ) ( not ( = ?auto_98613 ?auto_98615 ) ) ( not ( = ?auto_98613 ?auto_98616 ) ) ( not ( = ?auto_98613 ?auto_98617 ) ) ( not ( = ?auto_98613 ?auto_98618 ) ) ( not ( = ?auto_98614 ?auto_98615 ) ) ( not ( = ?auto_98614 ?auto_98616 ) ) ( not ( = ?auto_98614 ?auto_98617 ) ) ( not ( = ?auto_98614 ?auto_98618 ) ) ( not ( = ?auto_98615 ?auto_98616 ) ) ( not ( = ?auto_98615 ?auto_98617 ) ) ( not ( = ?auto_98615 ?auto_98618 ) ) ( not ( = ?auto_98616 ?auto_98617 ) ) ( not ( = ?auto_98616 ?auto_98618 ) ) ( not ( = ?auto_98617 ?auto_98618 ) ) ( not ( = ?auto_98612 ?auto_98619 ) ) ( not ( = ?auto_98613 ?auto_98619 ) ) ( not ( = ?auto_98614 ?auto_98619 ) ) ( not ( = ?auto_98615 ?auto_98619 ) ) ( not ( = ?auto_98616 ?auto_98619 ) ) ( not ( = ?auto_98617 ?auto_98619 ) ) ( not ( = ?auto_98618 ?auto_98619 ) ) ( ON ?auto_98619 ?auto_98618 ) ( CLEAR ?auto_98619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_98612 ?auto_98613 ?auto_98614 ?auto_98615 ?auto_98616 ?auto_98617 ?auto_98618 )
      ( MAKE-6PILE ?auto_98612 ?auto_98613 ?auto_98614 ?auto_98615 ?auto_98616 ?auto_98617 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_98622 - BLOCK
      ?auto_98623 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_98623 ) ( CLEAR ?auto_98622 ) ( ON-TABLE ?auto_98622 ) ( not ( = ?auto_98622 ?auto_98623 ) ) )
    :subtasks
    ( ( !STACK ?auto_98623 ?auto_98622 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_98624 - BLOCK
      ?auto_98625 - BLOCK
    )
    :vars
    (
      ?auto_98626 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_98624 ) ( ON-TABLE ?auto_98624 ) ( not ( = ?auto_98624 ?auto_98625 ) ) ( ON ?auto_98625 ?auto_98626 ) ( CLEAR ?auto_98625 ) ( HAND-EMPTY ) ( not ( = ?auto_98624 ?auto_98626 ) ) ( not ( = ?auto_98625 ?auto_98626 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_98625 ?auto_98626 )
      ( MAKE-2PILE ?auto_98624 ?auto_98625 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_98627 - BLOCK
      ?auto_98628 - BLOCK
    )
    :vars
    (
      ?auto_98629 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98627 ?auto_98628 ) ) ( ON ?auto_98628 ?auto_98629 ) ( CLEAR ?auto_98628 ) ( not ( = ?auto_98627 ?auto_98629 ) ) ( not ( = ?auto_98628 ?auto_98629 ) ) ( HOLDING ?auto_98627 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_98627 )
      ( MAKE-2PILE ?auto_98627 ?auto_98628 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_98630 - BLOCK
      ?auto_98631 - BLOCK
    )
    :vars
    (
      ?auto_98632 - BLOCK
      ?auto_98636 - BLOCK
      ?auto_98633 - BLOCK
      ?auto_98637 - BLOCK
      ?auto_98634 - BLOCK
      ?auto_98635 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98630 ?auto_98631 ) ) ( ON ?auto_98631 ?auto_98632 ) ( not ( = ?auto_98630 ?auto_98632 ) ) ( not ( = ?auto_98631 ?auto_98632 ) ) ( ON ?auto_98630 ?auto_98631 ) ( CLEAR ?auto_98630 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98636 ) ( ON ?auto_98633 ?auto_98636 ) ( ON ?auto_98637 ?auto_98633 ) ( ON ?auto_98634 ?auto_98637 ) ( ON ?auto_98635 ?auto_98634 ) ( ON ?auto_98632 ?auto_98635 ) ( not ( = ?auto_98636 ?auto_98633 ) ) ( not ( = ?auto_98636 ?auto_98637 ) ) ( not ( = ?auto_98636 ?auto_98634 ) ) ( not ( = ?auto_98636 ?auto_98635 ) ) ( not ( = ?auto_98636 ?auto_98632 ) ) ( not ( = ?auto_98636 ?auto_98631 ) ) ( not ( = ?auto_98636 ?auto_98630 ) ) ( not ( = ?auto_98633 ?auto_98637 ) ) ( not ( = ?auto_98633 ?auto_98634 ) ) ( not ( = ?auto_98633 ?auto_98635 ) ) ( not ( = ?auto_98633 ?auto_98632 ) ) ( not ( = ?auto_98633 ?auto_98631 ) ) ( not ( = ?auto_98633 ?auto_98630 ) ) ( not ( = ?auto_98637 ?auto_98634 ) ) ( not ( = ?auto_98637 ?auto_98635 ) ) ( not ( = ?auto_98637 ?auto_98632 ) ) ( not ( = ?auto_98637 ?auto_98631 ) ) ( not ( = ?auto_98637 ?auto_98630 ) ) ( not ( = ?auto_98634 ?auto_98635 ) ) ( not ( = ?auto_98634 ?auto_98632 ) ) ( not ( = ?auto_98634 ?auto_98631 ) ) ( not ( = ?auto_98634 ?auto_98630 ) ) ( not ( = ?auto_98635 ?auto_98632 ) ) ( not ( = ?auto_98635 ?auto_98631 ) ) ( not ( = ?auto_98635 ?auto_98630 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_98636 ?auto_98633 ?auto_98637 ?auto_98634 ?auto_98635 ?auto_98632 ?auto_98631 )
      ( MAKE-2PILE ?auto_98630 ?auto_98631 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98643 - BLOCK
      ?auto_98644 - BLOCK
      ?auto_98645 - BLOCK
      ?auto_98646 - BLOCK
      ?auto_98647 - BLOCK
    )
    :vars
    (
      ?auto_98648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98648 ?auto_98647 ) ( CLEAR ?auto_98648 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98643 ) ( ON ?auto_98644 ?auto_98643 ) ( ON ?auto_98645 ?auto_98644 ) ( ON ?auto_98646 ?auto_98645 ) ( ON ?auto_98647 ?auto_98646 ) ( not ( = ?auto_98643 ?auto_98644 ) ) ( not ( = ?auto_98643 ?auto_98645 ) ) ( not ( = ?auto_98643 ?auto_98646 ) ) ( not ( = ?auto_98643 ?auto_98647 ) ) ( not ( = ?auto_98643 ?auto_98648 ) ) ( not ( = ?auto_98644 ?auto_98645 ) ) ( not ( = ?auto_98644 ?auto_98646 ) ) ( not ( = ?auto_98644 ?auto_98647 ) ) ( not ( = ?auto_98644 ?auto_98648 ) ) ( not ( = ?auto_98645 ?auto_98646 ) ) ( not ( = ?auto_98645 ?auto_98647 ) ) ( not ( = ?auto_98645 ?auto_98648 ) ) ( not ( = ?auto_98646 ?auto_98647 ) ) ( not ( = ?auto_98646 ?auto_98648 ) ) ( not ( = ?auto_98647 ?auto_98648 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_98648 ?auto_98647 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98649 - BLOCK
      ?auto_98650 - BLOCK
      ?auto_98651 - BLOCK
      ?auto_98652 - BLOCK
      ?auto_98653 - BLOCK
    )
    :vars
    (
      ?auto_98654 - BLOCK
      ?auto_98655 - BLOCK
      ?auto_98656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98654 ?auto_98653 ) ( CLEAR ?auto_98654 ) ( ON-TABLE ?auto_98649 ) ( ON ?auto_98650 ?auto_98649 ) ( ON ?auto_98651 ?auto_98650 ) ( ON ?auto_98652 ?auto_98651 ) ( ON ?auto_98653 ?auto_98652 ) ( not ( = ?auto_98649 ?auto_98650 ) ) ( not ( = ?auto_98649 ?auto_98651 ) ) ( not ( = ?auto_98649 ?auto_98652 ) ) ( not ( = ?auto_98649 ?auto_98653 ) ) ( not ( = ?auto_98649 ?auto_98654 ) ) ( not ( = ?auto_98650 ?auto_98651 ) ) ( not ( = ?auto_98650 ?auto_98652 ) ) ( not ( = ?auto_98650 ?auto_98653 ) ) ( not ( = ?auto_98650 ?auto_98654 ) ) ( not ( = ?auto_98651 ?auto_98652 ) ) ( not ( = ?auto_98651 ?auto_98653 ) ) ( not ( = ?auto_98651 ?auto_98654 ) ) ( not ( = ?auto_98652 ?auto_98653 ) ) ( not ( = ?auto_98652 ?auto_98654 ) ) ( not ( = ?auto_98653 ?auto_98654 ) ) ( HOLDING ?auto_98655 ) ( CLEAR ?auto_98656 ) ( not ( = ?auto_98649 ?auto_98655 ) ) ( not ( = ?auto_98649 ?auto_98656 ) ) ( not ( = ?auto_98650 ?auto_98655 ) ) ( not ( = ?auto_98650 ?auto_98656 ) ) ( not ( = ?auto_98651 ?auto_98655 ) ) ( not ( = ?auto_98651 ?auto_98656 ) ) ( not ( = ?auto_98652 ?auto_98655 ) ) ( not ( = ?auto_98652 ?auto_98656 ) ) ( not ( = ?auto_98653 ?auto_98655 ) ) ( not ( = ?auto_98653 ?auto_98656 ) ) ( not ( = ?auto_98654 ?auto_98655 ) ) ( not ( = ?auto_98654 ?auto_98656 ) ) ( not ( = ?auto_98655 ?auto_98656 ) ) )
    :subtasks
    ( ( !STACK ?auto_98655 ?auto_98656 )
      ( MAKE-5PILE ?auto_98649 ?auto_98650 ?auto_98651 ?auto_98652 ?auto_98653 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98657 - BLOCK
      ?auto_98658 - BLOCK
      ?auto_98659 - BLOCK
      ?auto_98660 - BLOCK
      ?auto_98661 - BLOCK
    )
    :vars
    (
      ?auto_98662 - BLOCK
      ?auto_98663 - BLOCK
      ?auto_98664 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98662 ?auto_98661 ) ( ON-TABLE ?auto_98657 ) ( ON ?auto_98658 ?auto_98657 ) ( ON ?auto_98659 ?auto_98658 ) ( ON ?auto_98660 ?auto_98659 ) ( ON ?auto_98661 ?auto_98660 ) ( not ( = ?auto_98657 ?auto_98658 ) ) ( not ( = ?auto_98657 ?auto_98659 ) ) ( not ( = ?auto_98657 ?auto_98660 ) ) ( not ( = ?auto_98657 ?auto_98661 ) ) ( not ( = ?auto_98657 ?auto_98662 ) ) ( not ( = ?auto_98658 ?auto_98659 ) ) ( not ( = ?auto_98658 ?auto_98660 ) ) ( not ( = ?auto_98658 ?auto_98661 ) ) ( not ( = ?auto_98658 ?auto_98662 ) ) ( not ( = ?auto_98659 ?auto_98660 ) ) ( not ( = ?auto_98659 ?auto_98661 ) ) ( not ( = ?auto_98659 ?auto_98662 ) ) ( not ( = ?auto_98660 ?auto_98661 ) ) ( not ( = ?auto_98660 ?auto_98662 ) ) ( not ( = ?auto_98661 ?auto_98662 ) ) ( CLEAR ?auto_98663 ) ( not ( = ?auto_98657 ?auto_98664 ) ) ( not ( = ?auto_98657 ?auto_98663 ) ) ( not ( = ?auto_98658 ?auto_98664 ) ) ( not ( = ?auto_98658 ?auto_98663 ) ) ( not ( = ?auto_98659 ?auto_98664 ) ) ( not ( = ?auto_98659 ?auto_98663 ) ) ( not ( = ?auto_98660 ?auto_98664 ) ) ( not ( = ?auto_98660 ?auto_98663 ) ) ( not ( = ?auto_98661 ?auto_98664 ) ) ( not ( = ?auto_98661 ?auto_98663 ) ) ( not ( = ?auto_98662 ?auto_98664 ) ) ( not ( = ?auto_98662 ?auto_98663 ) ) ( not ( = ?auto_98664 ?auto_98663 ) ) ( ON ?auto_98664 ?auto_98662 ) ( CLEAR ?auto_98664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_98657 ?auto_98658 ?auto_98659 ?auto_98660 ?auto_98661 ?auto_98662 )
      ( MAKE-5PILE ?auto_98657 ?auto_98658 ?auto_98659 ?auto_98660 ?auto_98661 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98665 - BLOCK
      ?auto_98666 - BLOCK
      ?auto_98667 - BLOCK
      ?auto_98668 - BLOCK
      ?auto_98669 - BLOCK
    )
    :vars
    (
      ?auto_98671 - BLOCK
      ?auto_98670 - BLOCK
      ?auto_98672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98671 ?auto_98669 ) ( ON-TABLE ?auto_98665 ) ( ON ?auto_98666 ?auto_98665 ) ( ON ?auto_98667 ?auto_98666 ) ( ON ?auto_98668 ?auto_98667 ) ( ON ?auto_98669 ?auto_98668 ) ( not ( = ?auto_98665 ?auto_98666 ) ) ( not ( = ?auto_98665 ?auto_98667 ) ) ( not ( = ?auto_98665 ?auto_98668 ) ) ( not ( = ?auto_98665 ?auto_98669 ) ) ( not ( = ?auto_98665 ?auto_98671 ) ) ( not ( = ?auto_98666 ?auto_98667 ) ) ( not ( = ?auto_98666 ?auto_98668 ) ) ( not ( = ?auto_98666 ?auto_98669 ) ) ( not ( = ?auto_98666 ?auto_98671 ) ) ( not ( = ?auto_98667 ?auto_98668 ) ) ( not ( = ?auto_98667 ?auto_98669 ) ) ( not ( = ?auto_98667 ?auto_98671 ) ) ( not ( = ?auto_98668 ?auto_98669 ) ) ( not ( = ?auto_98668 ?auto_98671 ) ) ( not ( = ?auto_98669 ?auto_98671 ) ) ( not ( = ?auto_98665 ?auto_98670 ) ) ( not ( = ?auto_98665 ?auto_98672 ) ) ( not ( = ?auto_98666 ?auto_98670 ) ) ( not ( = ?auto_98666 ?auto_98672 ) ) ( not ( = ?auto_98667 ?auto_98670 ) ) ( not ( = ?auto_98667 ?auto_98672 ) ) ( not ( = ?auto_98668 ?auto_98670 ) ) ( not ( = ?auto_98668 ?auto_98672 ) ) ( not ( = ?auto_98669 ?auto_98670 ) ) ( not ( = ?auto_98669 ?auto_98672 ) ) ( not ( = ?auto_98671 ?auto_98670 ) ) ( not ( = ?auto_98671 ?auto_98672 ) ) ( not ( = ?auto_98670 ?auto_98672 ) ) ( ON ?auto_98670 ?auto_98671 ) ( CLEAR ?auto_98670 ) ( HOLDING ?auto_98672 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_98672 )
      ( MAKE-5PILE ?auto_98665 ?auto_98666 ?auto_98667 ?auto_98668 ?auto_98669 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98673 - BLOCK
      ?auto_98674 - BLOCK
      ?auto_98675 - BLOCK
      ?auto_98676 - BLOCK
      ?auto_98677 - BLOCK
    )
    :vars
    (
      ?auto_98678 - BLOCK
      ?auto_98680 - BLOCK
      ?auto_98679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98678 ?auto_98677 ) ( ON-TABLE ?auto_98673 ) ( ON ?auto_98674 ?auto_98673 ) ( ON ?auto_98675 ?auto_98674 ) ( ON ?auto_98676 ?auto_98675 ) ( ON ?auto_98677 ?auto_98676 ) ( not ( = ?auto_98673 ?auto_98674 ) ) ( not ( = ?auto_98673 ?auto_98675 ) ) ( not ( = ?auto_98673 ?auto_98676 ) ) ( not ( = ?auto_98673 ?auto_98677 ) ) ( not ( = ?auto_98673 ?auto_98678 ) ) ( not ( = ?auto_98674 ?auto_98675 ) ) ( not ( = ?auto_98674 ?auto_98676 ) ) ( not ( = ?auto_98674 ?auto_98677 ) ) ( not ( = ?auto_98674 ?auto_98678 ) ) ( not ( = ?auto_98675 ?auto_98676 ) ) ( not ( = ?auto_98675 ?auto_98677 ) ) ( not ( = ?auto_98675 ?auto_98678 ) ) ( not ( = ?auto_98676 ?auto_98677 ) ) ( not ( = ?auto_98676 ?auto_98678 ) ) ( not ( = ?auto_98677 ?auto_98678 ) ) ( not ( = ?auto_98673 ?auto_98680 ) ) ( not ( = ?auto_98673 ?auto_98679 ) ) ( not ( = ?auto_98674 ?auto_98680 ) ) ( not ( = ?auto_98674 ?auto_98679 ) ) ( not ( = ?auto_98675 ?auto_98680 ) ) ( not ( = ?auto_98675 ?auto_98679 ) ) ( not ( = ?auto_98676 ?auto_98680 ) ) ( not ( = ?auto_98676 ?auto_98679 ) ) ( not ( = ?auto_98677 ?auto_98680 ) ) ( not ( = ?auto_98677 ?auto_98679 ) ) ( not ( = ?auto_98678 ?auto_98680 ) ) ( not ( = ?auto_98678 ?auto_98679 ) ) ( not ( = ?auto_98680 ?auto_98679 ) ) ( ON ?auto_98680 ?auto_98678 ) ( ON ?auto_98679 ?auto_98680 ) ( CLEAR ?auto_98679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_98673 ?auto_98674 ?auto_98675 ?auto_98676 ?auto_98677 ?auto_98678 ?auto_98680 )
      ( MAKE-5PILE ?auto_98673 ?auto_98674 ?auto_98675 ?auto_98676 ?auto_98677 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98684 - BLOCK
      ?auto_98685 - BLOCK
      ?auto_98686 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_98686 ) ( CLEAR ?auto_98685 ) ( ON-TABLE ?auto_98684 ) ( ON ?auto_98685 ?auto_98684 ) ( not ( = ?auto_98684 ?auto_98685 ) ) ( not ( = ?auto_98684 ?auto_98686 ) ) ( not ( = ?auto_98685 ?auto_98686 ) ) )
    :subtasks
    ( ( !STACK ?auto_98686 ?auto_98685 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98687 - BLOCK
      ?auto_98688 - BLOCK
      ?auto_98689 - BLOCK
    )
    :vars
    (
      ?auto_98690 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_98688 ) ( ON-TABLE ?auto_98687 ) ( ON ?auto_98688 ?auto_98687 ) ( not ( = ?auto_98687 ?auto_98688 ) ) ( not ( = ?auto_98687 ?auto_98689 ) ) ( not ( = ?auto_98688 ?auto_98689 ) ) ( ON ?auto_98689 ?auto_98690 ) ( CLEAR ?auto_98689 ) ( HAND-EMPTY ) ( not ( = ?auto_98687 ?auto_98690 ) ) ( not ( = ?auto_98688 ?auto_98690 ) ) ( not ( = ?auto_98689 ?auto_98690 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_98689 ?auto_98690 )
      ( MAKE-3PILE ?auto_98687 ?auto_98688 ?auto_98689 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98691 - BLOCK
      ?auto_98692 - BLOCK
      ?auto_98693 - BLOCK
    )
    :vars
    (
      ?auto_98694 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98691 ) ( not ( = ?auto_98691 ?auto_98692 ) ) ( not ( = ?auto_98691 ?auto_98693 ) ) ( not ( = ?auto_98692 ?auto_98693 ) ) ( ON ?auto_98693 ?auto_98694 ) ( CLEAR ?auto_98693 ) ( not ( = ?auto_98691 ?auto_98694 ) ) ( not ( = ?auto_98692 ?auto_98694 ) ) ( not ( = ?auto_98693 ?auto_98694 ) ) ( HOLDING ?auto_98692 ) ( CLEAR ?auto_98691 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98691 ?auto_98692 )
      ( MAKE-3PILE ?auto_98691 ?auto_98692 ?auto_98693 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98695 - BLOCK
      ?auto_98696 - BLOCK
      ?auto_98697 - BLOCK
    )
    :vars
    (
      ?auto_98698 - BLOCK
      ?auto_98699 - BLOCK
      ?auto_98702 - BLOCK
      ?auto_98701 - BLOCK
      ?auto_98700 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98695 ) ( not ( = ?auto_98695 ?auto_98696 ) ) ( not ( = ?auto_98695 ?auto_98697 ) ) ( not ( = ?auto_98696 ?auto_98697 ) ) ( ON ?auto_98697 ?auto_98698 ) ( not ( = ?auto_98695 ?auto_98698 ) ) ( not ( = ?auto_98696 ?auto_98698 ) ) ( not ( = ?auto_98697 ?auto_98698 ) ) ( CLEAR ?auto_98695 ) ( ON ?auto_98696 ?auto_98697 ) ( CLEAR ?auto_98696 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98699 ) ( ON ?auto_98702 ?auto_98699 ) ( ON ?auto_98701 ?auto_98702 ) ( ON ?auto_98700 ?auto_98701 ) ( ON ?auto_98698 ?auto_98700 ) ( not ( = ?auto_98699 ?auto_98702 ) ) ( not ( = ?auto_98699 ?auto_98701 ) ) ( not ( = ?auto_98699 ?auto_98700 ) ) ( not ( = ?auto_98699 ?auto_98698 ) ) ( not ( = ?auto_98699 ?auto_98697 ) ) ( not ( = ?auto_98699 ?auto_98696 ) ) ( not ( = ?auto_98702 ?auto_98701 ) ) ( not ( = ?auto_98702 ?auto_98700 ) ) ( not ( = ?auto_98702 ?auto_98698 ) ) ( not ( = ?auto_98702 ?auto_98697 ) ) ( not ( = ?auto_98702 ?auto_98696 ) ) ( not ( = ?auto_98701 ?auto_98700 ) ) ( not ( = ?auto_98701 ?auto_98698 ) ) ( not ( = ?auto_98701 ?auto_98697 ) ) ( not ( = ?auto_98701 ?auto_98696 ) ) ( not ( = ?auto_98700 ?auto_98698 ) ) ( not ( = ?auto_98700 ?auto_98697 ) ) ( not ( = ?auto_98700 ?auto_98696 ) ) ( not ( = ?auto_98695 ?auto_98699 ) ) ( not ( = ?auto_98695 ?auto_98702 ) ) ( not ( = ?auto_98695 ?auto_98701 ) ) ( not ( = ?auto_98695 ?auto_98700 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_98699 ?auto_98702 ?auto_98701 ?auto_98700 ?auto_98698 ?auto_98697 )
      ( MAKE-3PILE ?auto_98695 ?auto_98696 ?auto_98697 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98703 - BLOCK
      ?auto_98704 - BLOCK
      ?auto_98705 - BLOCK
    )
    :vars
    (
      ?auto_98706 - BLOCK
      ?auto_98707 - BLOCK
      ?auto_98709 - BLOCK
      ?auto_98708 - BLOCK
      ?auto_98710 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98703 ?auto_98704 ) ) ( not ( = ?auto_98703 ?auto_98705 ) ) ( not ( = ?auto_98704 ?auto_98705 ) ) ( ON ?auto_98705 ?auto_98706 ) ( not ( = ?auto_98703 ?auto_98706 ) ) ( not ( = ?auto_98704 ?auto_98706 ) ) ( not ( = ?auto_98705 ?auto_98706 ) ) ( ON ?auto_98704 ?auto_98705 ) ( CLEAR ?auto_98704 ) ( ON-TABLE ?auto_98707 ) ( ON ?auto_98709 ?auto_98707 ) ( ON ?auto_98708 ?auto_98709 ) ( ON ?auto_98710 ?auto_98708 ) ( ON ?auto_98706 ?auto_98710 ) ( not ( = ?auto_98707 ?auto_98709 ) ) ( not ( = ?auto_98707 ?auto_98708 ) ) ( not ( = ?auto_98707 ?auto_98710 ) ) ( not ( = ?auto_98707 ?auto_98706 ) ) ( not ( = ?auto_98707 ?auto_98705 ) ) ( not ( = ?auto_98707 ?auto_98704 ) ) ( not ( = ?auto_98709 ?auto_98708 ) ) ( not ( = ?auto_98709 ?auto_98710 ) ) ( not ( = ?auto_98709 ?auto_98706 ) ) ( not ( = ?auto_98709 ?auto_98705 ) ) ( not ( = ?auto_98709 ?auto_98704 ) ) ( not ( = ?auto_98708 ?auto_98710 ) ) ( not ( = ?auto_98708 ?auto_98706 ) ) ( not ( = ?auto_98708 ?auto_98705 ) ) ( not ( = ?auto_98708 ?auto_98704 ) ) ( not ( = ?auto_98710 ?auto_98706 ) ) ( not ( = ?auto_98710 ?auto_98705 ) ) ( not ( = ?auto_98710 ?auto_98704 ) ) ( not ( = ?auto_98703 ?auto_98707 ) ) ( not ( = ?auto_98703 ?auto_98709 ) ) ( not ( = ?auto_98703 ?auto_98708 ) ) ( not ( = ?auto_98703 ?auto_98710 ) ) ( HOLDING ?auto_98703 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_98703 )
      ( MAKE-3PILE ?auto_98703 ?auto_98704 ?auto_98705 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98711 - BLOCK
      ?auto_98712 - BLOCK
      ?auto_98713 - BLOCK
    )
    :vars
    (
      ?auto_98715 - BLOCK
      ?auto_98717 - BLOCK
      ?auto_98716 - BLOCK
      ?auto_98718 - BLOCK
      ?auto_98714 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98711 ?auto_98712 ) ) ( not ( = ?auto_98711 ?auto_98713 ) ) ( not ( = ?auto_98712 ?auto_98713 ) ) ( ON ?auto_98713 ?auto_98715 ) ( not ( = ?auto_98711 ?auto_98715 ) ) ( not ( = ?auto_98712 ?auto_98715 ) ) ( not ( = ?auto_98713 ?auto_98715 ) ) ( ON ?auto_98712 ?auto_98713 ) ( ON-TABLE ?auto_98717 ) ( ON ?auto_98716 ?auto_98717 ) ( ON ?auto_98718 ?auto_98716 ) ( ON ?auto_98714 ?auto_98718 ) ( ON ?auto_98715 ?auto_98714 ) ( not ( = ?auto_98717 ?auto_98716 ) ) ( not ( = ?auto_98717 ?auto_98718 ) ) ( not ( = ?auto_98717 ?auto_98714 ) ) ( not ( = ?auto_98717 ?auto_98715 ) ) ( not ( = ?auto_98717 ?auto_98713 ) ) ( not ( = ?auto_98717 ?auto_98712 ) ) ( not ( = ?auto_98716 ?auto_98718 ) ) ( not ( = ?auto_98716 ?auto_98714 ) ) ( not ( = ?auto_98716 ?auto_98715 ) ) ( not ( = ?auto_98716 ?auto_98713 ) ) ( not ( = ?auto_98716 ?auto_98712 ) ) ( not ( = ?auto_98718 ?auto_98714 ) ) ( not ( = ?auto_98718 ?auto_98715 ) ) ( not ( = ?auto_98718 ?auto_98713 ) ) ( not ( = ?auto_98718 ?auto_98712 ) ) ( not ( = ?auto_98714 ?auto_98715 ) ) ( not ( = ?auto_98714 ?auto_98713 ) ) ( not ( = ?auto_98714 ?auto_98712 ) ) ( not ( = ?auto_98711 ?auto_98717 ) ) ( not ( = ?auto_98711 ?auto_98716 ) ) ( not ( = ?auto_98711 ?auto_98718 ) ) ( not ( = ?auto_98711 ?auto_98714 ) ) ( ON ?auto_98711 ?auto_98712 ) ( CLEAR ?auto_98711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_98717 ?auto_98716 ?auto_98718 ?auto_98714 ?auto_98715 ?auto_98713 ?auto_98712 )
      ( MAKE-3PILE ?auto_98711 ?auto_98712 ?auto_98713 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98723 - BLOCK
      ?auto_98724 - BLOCK
      ?auto_98725 - BLOCK
      ?auto_98726 - BLOCK
    )
    :vars
    (
      ?auto_98727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98727 ?auto_98726 ) ( CLEAR ?auto_98727 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98723 ) ( ON ?auto_98724 ?auto_98723 ) ( ON ?auto_98725 ?auto_98724 ) ( ON ?auto_98726 ?auto_98725 ) ( not ( = ?auto_98723 ?auto_98724 ) ) ( not ( = ?auto_98723 ?auto_98725 ) ) ( not ( = ?auto_98723 ?auto_98726 ) ) ( not ( = ?auto_98723 ?auto_98727 ) ) ( not ( = ?auto_98724 ?auto_98725 ) ) ( not ( = ?auto_98724 ?auto_98726 ) ) ( not ( = ?auto_98724 ?auto_98727 ) ) ( not ( = ?auto_98725 ?auto_98726 ) ) ( not ( = ?auto_98725 ?auto_98727 ) ) ( not ( = ?auto_98726 ?auto_98727 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_98727 ?auto_98726 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98728 - BLOCK
      ?auto_98729 - BLOCK
      ?auto_98730 - BLOCK
      ?auto_98731 - BLOCK
    )
    :vars
    (
      ?auto_98732 - BLOCK
      ?auto_98733 - BLOCK
      ?auto_98734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98732 ?auto_98731 ) ( CLEAR ?auto_98732 ) ( ON-TABLE ?auto_98728 ) ( ON ?auto_98729 ?auto_98728 ) ( ON ?auto_98730 ?auto_98729 ) ( ON ?auto_98731 ?auto_98730 ) ( not ( = ?auto_98728 ?auto_98729 ) ) ( not ( = ?auto_98728 ?auto_98730 ) ) ( not ( = ?auto_98728 ?auto_98731 ) ) ( not ( = ?auto_98728 ?auto_98732 ) ) ( not ( = ?auto_98729 ?auto_98730 ) ) ( not ( = ?auto_98729 ?auto_98731 ) ) ( not ( = ?auto_98729 ?auto_98732 ) ) ( not ( = ?auto_98730 ?auto_98731 ) ) ( not ( = ?auto_98730 ?auto_98732 ) ) ( not ( = ?auto_98731 ?auto_98732 ) ) ( HOLDING ?auto_98733 ) ( CLEAR ?auto_98734 ) ( not ( = ?auto_98728 ?auto_98733 ) ) ( not ( = ?auto_98728 ?auto_98734 ) ) ( not ( = ?auto_98729 ?auto_98733 ) ) ( not ( = ?auto_98729 ?auto_98734 ) ) ( not ( = ?auto_98730 ?auto_98733 ) ) ( not ( = ?auto_98730 ?auto_98734 ) ) ( not ( = ?auto_98731 ?auto_98733 ) ) ( not ( = ?auto_98731 ?auto_98734 ) ) ( not ( = ?auto_98732 ?auto_98733 ) ) ( not ( = ?auto_98732 ?auto_98734 ) ) ( not ( = ?auto_98733 ?auto_98734 ) ) )
    :subtasks
    ( ( !STACK ?auto_98733 ?auto_98734 )
      ( MAKE-4PILE ?auto_98728 ?auto_98729 ?auto_98730 ?auto_98731 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98735 - BLOCK
      ?auto_98736 - BLOCK
      ?auto_98737 - BLOCK
      ?auto_98738 - BLOCK
    )
    :vars
    (
      ?auto_98741 - BLOCK
      ?auto_98739 - BLOCK
      ?auto_98740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98741 ?auto_98738 ) ( ON-TABLE ?auto_98735 ) ( ON ?auto_98736 ?auto_98735 ) ( ON ?auto_98737 ?auto_98736 ) ( ON ?auto_98738 ?auto_98737 ) ( not ( = ?auto_98735 ?auto_98736 ) ) ( not ( = ?auto_98735 ?auto_98737 ) ) ( not ( = ?auto_98735 ?auto_98738 ) ) ( not ( = ?auto_98735 ?auto_98741 ) ) ( not ( = ?auto_98736 ?auto_98737 ) ) ( not ( = ?auto_98736 ?auto_98738 ) ) ( not ( = ?auto_98736 ?auto_98741 ) ) ( not ( = ?auto_98737 ?auto_98738 ) ) ( not ( = ?auto_98737 ?auto_98741 ) ) ( not ( = ?auto_98738 ?auto_98741 ) ) ( CLEAR ?auto_98739 ) ( not ( = ?auto_98735 ?auto_98740 ) ) ( not ( = ?auto_98735 ?auto_98739 ) ) ( not ( = ?auto_98736 ?auto_98740 ) ) ( not ( = ?auto_98736 ?auto_98739 ) ) ( not ( = ?auto_98737 ?auto_98740 ) ) ( not ( = ?auto_98737 ?auto_98739 ) ) ( not ( = ?auto_98738 ?auto_98740 ) ) ( not ( = ?auto_98738 ?auto_98739 ) ) ( not ( = ?auto_98741 ?auto_98740 ) ) ( not ( = ?auto_98741 ?auto_98739 ) ) ( not ( = ?auto_98740 ?auto_98739 ) ) ( ON ?auto_98740 ?auto_98741 ) ( CLEAR ?auto_98740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98735 ?auto_98736 ?auto_98737 ?auto_98738 ?auto_98741 )
      ( MAKE-4PILE ?auto_98735 ?auto_98736 ?auto_98737 ?auto_98738 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98742 - BLOCK
      ?auto_98743 - BLOCK
      ?auto_98744 - BLOCK
      ?auto_98745 - BLOCK
    )
    :vars
    (
      ?auto_98747 - BLOCK
      ?auto_98748 - BLOCK
      ?auto_98746 - BLOCK
      ?auto_98749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98747 ?auto_98745 ) ( ON-TABLE ?auto_98742 ) ( ON ?auto_98743 ?auto_98742 ) ( ON ?auto_98744 ?auto_98743 ) ( ON ?auto_98745 ?auto_98744 ) ( not ( = ?auto_98742 ?auto_98743 ) ) ( not ( = ?auto_98742 ?auto_98744 ) ) ( not ( = ?auto_98742 ?auto_98745 ) ) ( not ( = ?auto_98742 ?auto_98747 ) ) ( not ( = ?auto_98743 ?auto_98744 ) ) ( not ( = ?auto_98743 ?auto_98745 ) ) ( not ( = ?auto_98743 ?auto_98747 ) ) ( not ( = ?auto_98744 ?auto_98745 ) ) ( not ( = ?auto_98744 ?auto_98747 ) ) ( not ( = ?auto_98745 ?auto_98747 ) ) ( not ( = ?auto_98742 ?auto_98748 ) ) ( not ( = ?auto_98742 ?auto_98746 ) ) ( not ( = ?auto_98743 ?auto_98748 ) ) ( not ( = ?auto_98743 ?auto_98746 ) ) ( not ( = ?auto_98744 ?auto_98748 ) ) ( not ( = ?auto_98744 ?auto_98746 ) ) ( not ( = ?auto_98745 ?auto_98748 ) ) ( not ( = ?auto_98745 ?auto_98746 ) ) ( not ( = ?auto_98747 ?auto_98748 ) ) ( not ( = ?auto_98747 ?auto_98746 ) ) ( not ( = ?auto_98748 ?auto_98746 ) ) ( ON ?auto_98748 ?auto_98747 ) ( CLEAR ?auto_98748 ) ( HOLDING ?auto_98746 ) ( CLEAR ?auto_98749 ) ( ON-TABLE ?auto_98749 ) ( not ( = ?auto_98749 ?auto_98746 ) ) ( not ( = ?auto_98742 ?auto_98749 ) ) ( not ( = ?auto_98743 ?auto_98749 ) ) ( not ( = ?auto_98744 ?auto_98749 ) ) ( not ( = ?auto_98745 ?auto_98749 ) ) ( not ( = ?auto_98747 ?auto_98749 ) ) ( not ( = ?auto_98748 ?auto_98749 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98749 ?auto_98746 )
      ( MAKE-4PILE ?auto_98742 ?auto_98743 ?auto_98744 ?auto_98745 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98750 - BLOCK
      ?auto_98751 - BLOCK
      ?auto_98752 - BLOCK
      ?auto_98753 - BLOCK
    )
    :vars
    (
      ?auto_98755 - BLOCK
      ?auto_98756 - BLOCK
      ?auto_98757 - BLOCK
      ?auto_98754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98755 ?auto_98753 ) ( ON-TABLE ?auto_98750 ) ( ON ?auto_98751 ?auto_98750 ) ( ON ?auto_98752 ?auto_98751 ) ( ON ?auto_98753 ?auto_98752 ) ( not ( = ?auto_98750 ?auto_98751 ) ) ( not ( = ?auto_98750 ?auto_98752 ) ) ( not ( = ?auto_98750 ?auto_98753 ) ) ( not ( = ?auto_98750 ?auto_98755 ) ) ( not ( = ?auto_98751 ?auto_98752 ) ) ( not ( = ?auto_98751 ?auto_98753 ) ) ( not ( = ?auto_98751 ?auto_98755 ) ) ( not ( = ?auto_98752 ?auto_98753 ) ) ( not ( = ?auto_98752 ?auto_98755 ) ) ( not ( = ?auto_98753 ?auto_98755 ) ) ( not ( = ?auto_98750 ?auto_98756 ) ) ( not ( = ?auto_98750 ?auto_98757 ) ) ( not ( = ?auto_98751 ?auto_98756 ) ) ( not ( = ?auto_98751 ?auto_98757 ) ) ( not ( = ?auto_98752 ?auto_98756 ) ) ( not ( = ?auto_98752 ?auto_98757 ) ) ( not ( = ?auto_98753 ?auto_98756 ) ) ( not ( = ?auto_98753 ?auto_98757 ) ) ( not ( = ?auto_98755 ?auto_98756 ) ) ( not ( = ?auto_98755 ?auto_98757 ) ) ( not ( = ?auto_98756 ?auto_98757 ) ) ( ON ?auto_98756 ?auto_98755 ) ( CLEAR ?auto_98754 ) ( ON-TABLE ?auto_98754 ) ( not ( = ?auto_98754 ?auto_98757 ) ) ( not ( = ?auto_98750 ?auto_98754 ) ) ( not ( = ?auto_98751 ?auto_98754 ) ) ( not ( = ?auto_98752 ?auto_98754 ) ) ( not ( = ?auto_98753 ?auto_98754 ) ) ( not ( = ?auto_98755 ?auto_98754 ) ) ( not ( = ?auto_98756 ?auto_98754 ) ) ( ON ?auto_98757 ?auto_98756 ) ( CLEAR ?auto_98757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_98750 ?auto_98751 ?auto_98752 ?auto_98753 ?auto_98755 ?auto_98756 )
      ( MAKE-4PILE ?auto_98750 ?auto_98751 ?auto_98752 ?auto_98753 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98758 - BLOCK
      ?auto_98759 - BLOCK
      ?auto_98760 - BLOCK
      ?auto_98761 - BLOCK
    )
    :vars
    (
      ?auto_98763 - BLOCK
      ?auto_98765 - BLOCK
      ?auto_98764 - BLOCK
      ?auto_98762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98763 ?auto_98761 ) ( ON-TABLE ?auto_98758 ) ( ON ?auto_98759 ?auto_98758 ) ( ON ?auto_98760 ?auto_98759 ) ( ON ?auto_98761 ?auto_98760 ) ( not ( = ?auto_98758 ?auto_98759 ) ) ( not ( = ?auto_98758 ?auto_98760 ) ) ( not ( = ?auto_98758 ?auto_98761 ) ) ( not ( = ?auto_98758 ?auto_98763 ) ) ( not ( = ?auto_98759 ?auto_98760 ) ) ( not ( = ?auto_98759 ?auto_98761 ) ) ( not ( = ?auto_98759 ?auto_98763 ) ) ( not ( = ?auto_98760 ?auto_98761 ) ) ( not ( = ?auto_98760 ?auto_98763 ) ) ( not ( = ?auto_98761 ?auto_98763 ) ) ( not ( = ?auto_98758 ?auto_98765 ) ) ( not ( = ?auto_98758 ?auto_98764 ) ) ( not ( = ?auto_98759 ?auto_98765 ) ) ( not ( = ?auto_98759 ?auto_98764 ) ) ( not ( = ?auto_98760 ?auto_98765 ) ) ( not ( = ?auto_98760 ?auto_98764 ) ) ( not ( = ?auto_98761 ?auto_98765 ) ) ( not ( = ?auto_98761 ?auto_98764 ) ) ( not ( = ?auto_98763 ?auto_98765 ) ) ( not ( = ?auto_98763 ?auto_98764 ) ) ( not ( = ?auto_98765 ?auto_98764 ) ) ( ON ?auto_98765 ?auto_98763 ) ( not ( = ?auto_98762 ?auto_98764 ) ) ( not ( = ?auto_98758 ?auto_98762 ) ) ( not ( = ?auto_98759 ?auto_98762 ) ) ( not ( = ?auto_98760 ?auto_98762 ) ) ( not ( = ?auto_98761 ?auto_98762 ) ) ( not ( = ?auto_98763 ?auto_98762 ) ) ( not ( = ?auto_98765 ?auto_98762 ) ) ( ON ?auto_98764 ?auto_98765 ) ( CLEAR ?auto_98764 ) ( HOLDING ?auto_98762 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_98762 )
      ( MAKE-4PILE ?auto_98758 ?auto_98759 ?auto_98760 ?auto_98761 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98766 - BLOCK
      ?auto_98767 - BLOCK
      ?auto_98768 - BLOCK
      ?auto_98769 - BLOCK
    )
    :vars
    (
      ?auto_98772 - BLOCK
      ?auto_98771 - BLOCK
      ?auto_98770 - BLOCK
      ?auto_98773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98772 ?auto_98769 ) ( ON-TABLE ?auto_98766 ) ( ON ?auto_98767 ?auto_98766 ) ( ON ?auto_98768 ?auto_98767 ) ( ON ?auto_98769 ?auto_98768 ) ( not ( = ?auto_98766 ?auto_98767 ) ) ( not ( = ?auto_98766 ?auto_98768 ) ) ( not ( = ?auto_98766 ?auto_98769 ) ) ( not ( = ?auto_98766 ?auto_98772 ) ) ( not ( = ?auto_98767 ?auto_98768 ) ) ( not ( = ?auto_98767 ?auto_98769 ) ) ( not ( = ?auto_98767 ?auto_98772 ) ) ( not ( = ?auto_98768 ?auto_98769 ) ) ( not ( = ?auto_98768 ?auto_98772 ) ) ( not ( = ?auto_98769 ?auto_98772 ) ) ( not ( = ?auto_98766 ?auto_98771 ) ) ( not ( = ?auto_98766 ?auto_98770 ) ) ( not ( = ?auto_98767 ?auto_98771 ) ) ( not ( = ?auto_98767 ?auto_98770 ) ) ( not ( = ?auto_98768 ?auto_98771 ) ) ( not ( = ?auto_98768 ?auto_98770 ) ) ( not ( = ?auto_98769 ?auto_98771 ) ) ( not ( = ?auto_98769 ?auto_98770 ) ) ( not ( = ?auto_98772 ?auto_98771 ) ) ( not ( = ?auto_98772 ?auto_98770 ) ) ( not ( = ?auto_98771 ?auto_98770 ) ) ( ON ?auto_98771 ?auto_98772 ) ( not ( = ?auto_98773 ?auto_98770 ) ) ( not ( = ?auto_98766 ?auto_98773 ) ) ( not ( = ?auto_98767 ?auto_98773 ) ) ( not ( = ?auto_98768 ?auto_98773 ) ) ( not ( = ?auto_98769 ?auto_98773 ) ) ( not ( = ?auto_98772 ?auto_98773 ) ) ( not ( = ?auto_98771 ?auto_98773 ) ) ( ON ?auto_98770 ?auto_98771 ) ( ON ?auto_98773 ?auto_98770 ) ( CLEAR ?auto_98773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_98766 ?auto_98767 ?auto_98768 ?auto_98769 ?auto_98772 ?auto_98771 ?auto_98770 )
      ( MAKE-4PILE ?auto_98766 ?auto_98767 ?auto_98768 ?auto_98769 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98778 - BLOCK
      ?auto_98779 - BLOCK
      ?auto_98780 - BLOCK
      ?auto_98781 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_98781 ) ( CLEAR ?auto_98780 ) ( ON-TABLE ?auto_98778 ) ( ON ?auto_98779 ?auto_98778 ) ( ON ?auto_98780 ?auto_98779 ) ( not ( = ?auto_98778 ?auto_98779 ) ) ( not ( = ?auto_98778 ?auto_98780 ) ) ( not ( = ?auto_98778 ?auto_98781 ) ) ( not ( = ?auto_98779 ?auto_98780 ) ) ( not ( = ?auto_98779 ?auto_98781 ) ) ( not ( = ?auto_98780 ?auto_98781 ) ) )
    :subtasks
    ( ( !STACK ?auto_98781 ?auto_98780 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98782 - BLOCK
      ?auto_98783 - BLOCK
      ?auto_98784 - BLOCK
      ?auto_98785 - BLOCK
    )
    :vars
    (
      ?auto_98786 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_98784 ) ( ON-TABLE ?auto_98782 ) ( ON ?auto_98783 ?auto_98782 ) ( ON ?auto_98784 ?auto_98783 ) ( not ( = ?auto_98782 ?auto_98783 ) ) ( not ( = ?auto_98782 ?auto_98784 ) ) ( not ( = ?auto_98782 ?auto_98785 ) ) ( not ( = ?auto_98783 ?auto_98784 ) ) ( not ( = ?auto_98783 ?auto_98785 ) ) ( not ( = ?auto_98784 ?auto_98785 ) ) ( ON ?auto_98785 ?auto_98786 ) ( CLEAR ?auto_98785 ) ( HAND-EMPTY ) ( not ( = ?auto_98782 ?auto_98786 ) ) ( not ( = ?auto_98783 ?auto_98786 ) ) ( not ( = ?auto_98784 ?auto_98786 ) ) ( not ( = ?auto_98785 ?auto_98786 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_98785 ?auto_98786 )
      ( MAKE-4PILE ?auto_98782 ?auto_98783 ?auto_98784 ?auto_98785 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98787 - BLOCK
      ?auto_98788 - BLOCK
      ?auto_98789 - BLOCK
      ?auto_98790 - BLOCK
    )
    :vars
    (
      ?auto_98791 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98787 ) ( ON ?auto_98788 ?auto_98787 ) ( not ( = ?auto_98787 ?auto_98788 ) ) ( not ( = ?auto_98787 ?auto_98789 ) ) ( not ( = ?auto_98787 ?auto_98790 ) ) ( not ( = ?auto_98788 ?auto_98789 ) ) ( not ( = ?auto_98788 ?auto_98790 ) ) ( not ( = ?auto_98789 ?auto_98790 ) ) ( ON ?auto_98790 ?auto_98791 ) ( CLEAR ?auto_98790 ) ( not ( = ?auto_98787 ?auto_98791 ) ) ( not ( = ?auto_98788 ?auto_98791 ) ) ( not ( = ?auto_98789 ?auto_98791 ) ) ( not ( = ?auto_98790 ?auto_98791 ) ) ( HOLDING ?auto_98789 ) ( CLEAR ?auto_98788 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98787 ?auto_98788 ?auto_98789 )
      ( MAKE-4PILE ?auto_98787 ?auto_98788 ?auto_98789 ?auto_98790 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98792 - BLOCK
      ?auto_98793 - BLOCK
      ?auto_98794 - BLOCK
      ?auto_98795 - BLOCK
    )
    :vars
    (
      ?auto_98796 - BLOCK
      ?auto_98799 - BLOCK
      ?auto_98798 - BLOCK
      ?auto_98797 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98792 ) ( ON ?auto_98793 ?auto_98792 ) ( not ( = ?auto_98792 ?auto_98793 ) ) ( not ( = ?auto_98792 ?auto_98794 ) ) ( not ( = ?auto_98792 ?auto_98795 ) ) ( not ( = ?auto_98793 ?auto_98794 ) ) ( not ( = ?auto_98793 ?auto_98795 ) ) ( not ( = ?auto_98794 ?auto_98795 ) ) ( ON ?auto_98795 ?auto_98796 ) ( not ( = ?auto_98792 ?auto_98796 ) ) ( not ( = ?auto_98793 ?auto_98796 ) ) ( not ( = ?auto_98794 ?auto_98796 ) ) ( not ( = ?auto_98795 ?auto_98796 ) ) ( CLEAR ?auto_98793 ) ( ON ?auto_98794 ?auto_98795 ) ( CLEAR ?auto_98794 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98799 ) ( ON ?auto_98798 ?auto_98799 ) ( ON ?auto_98797 ?auto_98798 ) ( ON ?auto_98796 ?auto_98797 ) ( not ( = ?auto_98799 ?auto_98798 ) ) ( not ( = ?auto_98799 ?auto_98797 ) ) ( not ( = ?auto_98799 ?auto_98796 ) ) ( not ( = ?auto_98799 ?auto_98795 ) ) ( not ( = ?auto_98799 ?auto_98794 ) ) ( not ( = ?auto_98798 ?auto_98797 ) ) ( not ( = ?auto_98798 ?auto_98796 ) ) ( not ( = ?auto_98798 ?auto_98795 ) ) ( not ( = ?auto_98798 ?auto_98794 ) ) ( not ( = ?auto_98797 ?auto_98796 ) ) ( not ( = ?auto_98797 ?auto_98795 ) ) ( not ( = ?auto_98797 ?auto_98794 ) ) ( not ( = ?auto_98792 ?auto_98799 ) ) ( not ( = ?auto_98792 ?auto_98798 ) ) ( not ( = ?auto_98792 ?auto_98797 ) ) ( not ( = ?auto_98793 ?auto_98799 ) ) ( not ( = ?auto_98793 ?auto_98798 ) ) ( not ( = ?auto_98793 ?auto_98797 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98799 ?auto_98798 ?auto_98797 ?auto_98796 ?auto_98795 )
      ( MAKE-4PILE ?auto_98792 ?auto_98793 ?auto_98794 ?auto_98795 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98800 - BLOCK
      ?auto_98801 - BLOCK
      ?auto_98802 - BLOCK
      ?auto_98803 - BLOCK
    )
    :vars
    (
      ?auto_98804 - BLOCK
      ?auto_98805 - BLOCK
      ?auto_98807 - BLOCK
      ?auto_98806 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98800 ) ( not ( = ?auto_98800 ?auto_98801 ) ) ( not ( = ?auto_98800 ?auto_98802 ) ) ( not ( = ?auto_98800 ?auto_98803 ) ) ( not ( = ?auto_98801 ?auto_98802 ) ) ( not ( = ?auto_98801 ?auto_98803 ) ) ( not ( = ?auto_98802 ?auto_98803 ) ) ( ON ?auto_98803 ?auto_98804 ) ( not ( = ?auto_98800 ?auto_98804 ) ) ( not ( = ?auto_98801 ?auto_98804 ) ) ( not ( = ?auto_98802 ?auto_98804 ) ) ( not ( = ?auto_98803 ?auto_98804 ) ) ( ON ?auto_98802 ?auto_98803 ) ( CLEAR ?auto_98802 ) ( ON-TABLE ?auto_98805 ) ( ON ?auto_98807 ?auto_98805 ) ( ON ?auto_98806 ?auto_98807 ) ( ON ?auto_98804 ?auto_98806 ) ( not ( = ?auto_98805 ?auto_98807 ) ) ( not ( = ?auto_98805 ?auto_98806 ) ) ( not ( = ?auto_98805 ?auto_98804 ) ) ( not ( = ?auto_98805 ?auto_98803 ) ) ( not ( = ?auto_98805 ?auto_98802 ) ) ( not ( = ?auto_98807 ?auto_98806 ) ) ( not ( = ?auto_98807 ?auto_98804 ) ) ( not ( = ?auto_98807 ?auto_98803 ) ) ( not ( = ?auto_98807 ?auto_98802 ) ) ( not ( = ?auto_98806 ?auto_98804 ) ) ( not ( = ?auto_98806 ?auto_98803 ) ) ( not ( = ?auto_98806 ?auto_98802 ) ) ( not ( = ?auto_98800 ?auto_98805 ) ) ( not ( = ?auto_98800 ?auto_98807 ) ) ( not ( = ?auto_98800 ?auto_98806 ) ) ( not ( = ?auto_98801 ?auto_98805 ) ) ( not ( = ?auto_98801 ?auto_98807 ) ) ( not ( = ?auto_98801 ?auto_98806 ) ) ( HOLDING ?auto_98801 ) ( CLEAR ?auto_98800 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98800 ?auto_98801 )
      ( MAKE-4PILE ?auto_98800 ?auto_98801 ?auto_98802 ?auto_98803 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98808 - BLOCK
      ?auto_98809 - BLOCK
      ?auto_98810 - BLOCK
      ?auto_98811 - BLOCK
    )
    :vars
    (
      ?auto_98815 - BLOCK
      ?auto_98814 - BLOCK
      ?auto_98812 - BLOCK
      ?auto_98813 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98808 ) ( not ( = ?auto_98808 ?auto_98809 ) ) ( not ( = ?auto_98808 ?auto_98810 ) ) ( not ( = ?auto_98808 ?auto_98811 ) ) ( not ( = ?auto_98809 ?auto_98810 ) ) ( not ( = ?auto_98809 ?auto_98811 ) ) ( not ( = ?auto_98810 ?auto_98811 ) ) ( ON ?auto_98811 ?auto_98815 ) ( not ( = ?auto_98808 ?auto_98815 ) ) ( not ( = ?auto_98809 ?auto_98815 ) ) ( not ( = ?auto_98810 ?auto_98815 ) ) ( not ( = ?auto_98811 ?auto_98815 ) ) ( ON ?auto_98810 ?auto_98811 ) ( ON-TABLE ?auto_98814 ) ( ON ?auto_98812 ?auto_98814 ) ( ON ?auto_98813 ?auto_98812 ) ( ON ?auto_98815 ?auto_98813 ) ( not ( = ?auto_98814 ?auto_98812 ) ) ( not ( = ?auto_98814 ?auto_98813 ) ) ( not ( = ?auto_98814 ?auto_98815 ) ) ( not ( = ?auto_98814 ?auto_98811 ) ) ( not ( = ?auto_98814 ?auto_98810 ) ) ( not ( = ?auto_98812 ?auto_98813 ) ) ( not ( = ?auto_98812 ?auto_98815 ) ) ( not ( = ?auto_98812 ?auto_98811 ) ) ( not ( = ?auto_98812 ?auto_98810 ) ) ( not ( = ?auto_98813 ?auto_98815 ) ) ( not ( = ?auto_98813 ?auto_98811 ) ) ( not ( = ?auto_98813 ?auto_98810 ) ) ( not ( = ?auto_98808 ?auto_98814 ) ) ( not ( = ?auto_98808 ?auto_98812 ) ) ( not ( = ?auto_98808 ?auto_98813 ) ) ( not ( = ?auto_98809 ?auto_98814 ) ) ( not ( = ?auto_98809 ?auto_98812 ) ) ( not ( = ?auto_98809 ?auto_98813 ) ) ( CLEAR ?auto_98808 ) ( ON ?auto_98809 ?auto_98810 ) ( CLEAR ?auto_98809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_98814 ?auto_98812 ?auto_98813 ?auto_98815 ?auto_98811 ?auto_98810 )
      ( MAKE-4PILE ?auto_98808 ?auto_98809 ?auto_98810 ?auto_98811 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98816 - BLOCK
      ?auto_98817 - BLOCK
      ?auto_98818 - BLOCK
      ?auto_98819 - BLOCK
    )
    :vars
    (
      ?auto_98823 - BLOCK
      ?auto_98822 - BLOCK
      ?auto_98821 - BLOCK
      ?auto_98820 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98816 ?auto_98817 ) ) ( not ( = ?auto_98816 ?auto_98818 ) ) ( not ( = ?auto_98816 ?auto_98819 ) ) ( not ( = ?auto_98817 ?auto_98818 ) ) ( not ( = ?auto_98817 ?auto_98819 ) ) ( not ( = ?auto_98818 ?auto_98819 ) ) ( ON ?auto_98819 ?auto_98823 ) ( not ( = ?auto_98816 ?auto_98823 ) ) ( not ( = ?auto_98817 ?auto_98823 ) ) ( not ( = ?auto_98818 ?auto_98823 ) ) ( not ( = ?auto_98819 ?auto_98823 ) ) ( ON ?auto_98818 ?auto_98819 ) ( ON-TABLE ?auto_98822 ) ( ON ?auto_98821 ?auto_98822 ) ( ON ?auto_98820 ?auto_98821 ) ( ON ?auto_98823 ?auto_98820 ) ( not ( = ?auto_98822 ?auto_98821 ) ) ( not ( = ?auto_98822 ?auto_98820 ) ) ( not ( = ?auto_98822 ?auto_98823 ) ) ( not ( = ?auto_98822 ?auto_98819 ) ) ( not ( = ?auto_98822 ?auto_98818 ) ) ( not ( = ?auto_98821 ?auto_98820 ) ) ( not ( = ?auto_98821 ?auto_98823 ) ) ( not ( = ?auto_98821 ?auto_98819 ) ) ( not ( = ?auto_98821 ?auto_98818 ) ) ( not ( = ?auto_98820 ?auto_98823 ) ) ( not ( = ?auto_98820 ?auto_98819 ) ) ( not ( = ?auto_98820 ?auto_98818 ) ) ( not ( = ?auto_98816 ?auto_98822 ) ) ( not ( = ?auto_98816 ?auto_98821 ) ) ( not ( = ?auto_98816 ?auto_98820 ) ) ( not ( = ?auto_98817 ?auto_98822 ) ) ( not ( = ?auto_98817 ?auto_98821 ) ) ( not ( = ?auto_98817 ?auto_98820 ) ) ( ON ?auto_98817 ?auto_98818 ) ( CLEAR ?auto_98817 ) ( HOLDING ?auto_98816 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_98816 )
      ( MAKE-4PILE ?auto_98816 ?auto_98817 ?auto_98818 ?auto_98819 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98824 - BLOCK
      ?auto_98825 - BLOCK
      ?auto_98826 - BLOCK
      ?auto_98827 - BLOCK
    )
    :vars
    (
      ?auto_98828 - BLOCK
      ?auto_98829 - BLOCK
      ?auto_98831 - BLOCK
      ?auto_98830 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98824 ?auto_98825 ) ) ( not ( = ?auto_98824 ?auto_98826 ) ) ( not ( = ?auto_98824 ?auto_98827 ) ) ( not ( = ?auto_98825 ?auto_98826 ) ) ( not ( = ?auto_98825 ?auto_98827 ) ) ( not ( = ?auto_98826 ?auto_98827 ) ) ( ON ?auto_98827 ?auto_98828 ) ( not ( = ?auto_98824 ?auto_98828 ) ) ( not ( = ?auto_98825 ?auto_98828 ) ) ( not ( = ?auto_98826 ?auto_98828 ) ) ( not ( = ?auto_98827 ?auto_98828 ) ) ( ON ?auto_98826 ?auto_98827 ) ( ON-TABLE ?auto_98829 ) ( ON ?auto_98831 ?auto_98829 ) ( ON ?auto_98830 ?auto_98831 ) ( ON ?auto_98828 ?auto_98830 ) ( not ( = ?auto_98829 ?auto_98831 ) ) ( not ( = ?auto_98829 ?auto_98830 ) ) ( not ( = ?auto_98829 ?auto_98828 ) ) ( not ( = ?auto_98829 ?auto_98827 ) ) ( not ( = ?auto_98829 ?auto_98826 ) ) ( not ( = ?auto_98831 ?auto_98830 ) ) ( not ( = ?auto_98831 ?auto_98828 ) ) ( not ( = ?auto_98831 ?auto_98827 ) ) ( not ( = ?auto_98831 ?auto_98826 ) ) ( not ( = ?auto_98830 ?auto_98828 ) ) ( not ( = ?auto_98830 ?auto_98827 ) ) ( not ( = ?auto_98830 ?auto_98826 ) ) ( not ( = ?auto_98824 ?auto_98829 ) ) ( not ( = ?auto_98824 ?auto_98831 ) ) ( not ( = ?auto_98824 ?auto_98830 ) ) ( not ( = ?auto_98825 ?auto_98829 ) ) ( not ( = ?auto_98825 ?auto_98831 ) ) ( not ( = ?auto_98825 ?auto_98830 ) ) ( ON ?auto_98825 ?auto_98826 ) ( ON ?auto_98824 ?auto_98825 ) ( CLEAR ?auto_98824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_98829 ?auto_98831 ?auto_98830 ?auto_98828 ?auto_98827 ?auto_98826 ?auto_98825 )
      ( MAKE-4PILE ?auto_98824 ?auto_98825 ?auto_98826 ?auto_98827 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98835 - BLOCK
      ?auto_98836 - BLOCK
      ?auto_98837 - BLOCK
    )
    :vars
    (
      ?auto_98838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98838 ?auto_98837 ) ( CLEAR ?auto_98838 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98835 ) ( ON ?auto_98836 ?auto_98835 ) ( ON ?auto_98837 ?auto_98836 ) ( not ( = ?auto_98835 ?auto_98836 ) ) ( not ( = ?auto_98835 ?auto_98837 ) ) ( not ( = ?auto_98835 ?auto_98838 ) ) ( not ( = ?auto_98836 ?auto_98837 ) ) ( not ( = ?auto_98836 ?auto_98838 ) ) ( not ( = ?auto_98837 ?auto_98838 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_98838 ?auto_98837 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98839 - BLOCK
      ?auto_98840 - BLOCK
      ?auto_98841 - BLOCK
    )
    :vars
    (
      ?auto_98842 - BLOCK
      ?auto_98843 - BLOCK
      ?auto_98844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98842 ?auto_98841 ) ( CLEAR ?auto_98842 ) ( ON-TABLE ?auto_98839 ) ( ON ?auto_98840 ?auto_98839 ) ( ON ?auto_98841 ?auto_98840 ) ( not ( = ?auto_98839 ?auto_98840 ) ) ( not ( = ?auto_98839 ?auto_98841 ) ) ( not ( = ?auto_98839 ?auto_98842 ) ) ( not ( = ?auto_98840 ?auto_98841 ) ) ( not ( = ?auto_98840 ?auto_98842 ) ) ( not ( = ?auto_98841 ?auto_98842 ) ) ( HOLDING ?auto_98843 ) ( CLEAR ?auto_98844 ) ( not ( = ?auto_98839 ?auto_98843 ) ) ( not ( = ?auto_98839 ?auto_98844 ) ) ( not ( = ?auto_98840 ?auto_98843 ) ) ( not ( = ?auto_98840 ?auto_98844 ) ) ( not ( = ?auto_98841 ?auto_98843 ) ) ( not ( = ?auto_98841 ?auto_98844 ) ) ( not ( = ?auto_98842 ?auto_98843 ) ) ( not ( = ?auto_98842 ?auto_98844 ) ) ( not ( = ?auto_98843 ?auto_98844 ) ) )
    :subtasks
    ( ( !STACK ?auto_98843 ?auto_98844 )
      ( MAKE-3PILE ?auto_98839 ?auto_98840 ?auto_98841 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98845 - BLOCK
      ?auto_98846 - BLOCK
      ?auto_98847 - BLOCK
    )
    :vars
    (
      ?auto_98849 - BLOCK
      ?auto_98850 - BLOCK
      ?auto_98848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98849 ?auto_98847 ) ( ON-TABLE ?auto_98845 ) ( ON ?auto_98846 ?auto_98845 ) ( ON ?auto_98847 ?auto_98846 ) ( not ( = ?auto_98845 ?auto_98846 ) ) ( not ( = ?auto_98845 ?auto_98847 ) ) ( not ( = ?auto_98845 ?auto_98849 ) ) ( not ( = ?auto_98846 ?auto_98847 ) ) ( not ( = ?auto_98846 ?auto_98849 ) ) ( not ( = ?auto_98847 ?auto_98849 ) ) ( CLEAR ?auto_98850 ) ( not ( = ?auto_98845 ?auto_98848 ) ) ( not ( = ?auto_98845 ?auto_98850 ) ) ( not ( = ?auto_98846 ?auto_98848 ) ) ( not ( = ?auto_98846 ?auto_98850 ) ) ( not ( = ?auto_98847 ?auto_98848 ) ) ( not ( = ?auto_98847 ?auto_98850 ) ) ( not ( = ?auto_98849 ?auto_98848 ) ) ( not ( = ?auto_98849 ?auto_98850 ) ) ( not ( = ?auto_98848 ?auto_98850 ) ) ( ON ?auto_98848 ?auto_98849 ) ( CLEAR ?auto_98848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98845 ?auto_98846 ?auto_98847 ?auto_98849 )
      ( MAKE-3PILE ?auto_98845 ?auto_98846 ?auto_98847 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98851 - BLOCK
      ?auto_98852 - BLOCK
      ?auto_98853 - BLOCK
    )
    :vars
    (
      ?auto_98855 - BLOCK
      ?auto_98856 - BLOCK
      ?auto_98854 - BLOCK
      ?auto_98858 - BLOCK
      ?auto_98857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98855 ?auto_98853 ) ( ON-TABLE ?auto_98851 ) ( ON ?auto_98852 ?auto_98851 ) ( ON ?auto_98853 ?auto_98852 ) ( not ( = ?auto_98851 ?auto_98852 ) ) ( not ( = ?auto_98851 ?auto_98853 ) ) ( not ( = ?auto_98851 ?auto_98855 ) ) ( not ( = ?auto_98852 ?auto_98853 ) ) ( not ( = ?auto_98852 ?auto_98855 ) ) ( not ( = ?auto_98853 ?auto_98855 ) ) ( not ( = ?auto_98851 ?auto_98856 ) ) ( not ( = ?auto_98851 ?auto_98854 ) ) ( not ( = ?auto_98852 ?auto_98856 ) ) ( not ( = ?auto_98852 ?auto_98854 ) ) ( not ( = ?auto_98853 ?auto_98856 ) ) ( not ( = ?auto_98853 ?auto_98854 ) ) ( not ( = ?auto_98855 ?auto_98856 ) ) ( not ( = ?auto_98855 ?auto_98854 ) ) ( not ( = ?auto_98856 ?auto_98854 ) ) ( ON ?auto_98856 ?auto_98855 ) ( CLEAR ?auto_98856 ) ( HOLDING ?auto_98854 ) ( CLEAR ?auto_98858 ) ( ON-TABLE ?auto_98857 ) ( ON ?auto_98858 ?auto_98857 ) ( not ( = ?auto_98857 ?auto_98858 ) ) ( not ( = ?auto_98857 ?auto_98854 ) ) ( not ( = ?auto_98858 ?auto_98854 ) ) ( not ( = ?auto_98851 ?auto_98858 ) ) ( not ( = ?auto_98851 ?auto_98857 ) ) ( not ( = ?auto_98852 ?auto_98858 ) ) ( not ( = ?auto_98852 ?auto_98857 ) ) ( not ( = ?auto_98853 ?auto_98858 ) ) ( not ( = ?auto_98853 ?auto_98857 ) ) ( not ( = ?auto_98855 ?auto_98858 ) ) ( not ( = ?auto_98855 ?auto_98857 ) ) ( not ( = ?auto_98856 ?auto_98858 ) ) ( not ( = ?auto_98856 ?auto_98857 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98857 ?auto_98858 ?auto_98854 )
      ( MAKE-3PILE ?auto_98851 ?auto_98852 ?auto_98853 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98859 - BLOCK
      ?auto_98860 - BLOCK
      ?auto_98861 - BLOCK
    )
    :vars
    (
      ?auto_98865 - BLOCK
      ?auto_98862 - BLOCK
      ?auto_98863 - BLOCK
      ?auto_98866 - BLOCK
      ?auto_98864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98865 ?auto_98861 ) ( ON-TABLE ?auto_98859 ) ( ON ?auto_98860 ?auto_98859 ) ( ON ?auto_98861 ?auto_98860 ) ( not ( = ?auto_98859 ?auto_98860 ) ) ( not ( = ?auto_98859 ?auto_98861 ) ) ( not ( = ?auto_98859 ?auto_98865 ) ) ( not ( = ?auto_98860 ?auto_98861 ) ) ( not ( = ?auto_98860 ?auto_98865 ) ) ( not ( = ?auto_98861 ?auto_98865 ) ) ( not ( = ?auto_98859 ?auto_98862 ) ) ( not ( = ?auto_98859 ?auto_98863 ) ) ( not ( = ?auto_98860 ?auto_98862 ) ) ( not ( = ?auto_98860 ?auto_98863 ) ) ( not ( = ?auto_98861 ?auto_98862 ) ) ( not ( = ?auto_98861 ?auto_98863 ) ) ( not ( = ?auto_98865 ?auto_98862 ) ) ( not ( = ?auto_98865 ?auto_98863 ) ) ( not ( = ?auto_98862 ?auto_98863 ) ) ( ON ?auto_98862 ?auto_98865 ) ( CLEAR ?auto_98866 ) ( ON-TABLE ?auto_98864 ) ( ON ?auto_98866 ?auto_98864 ) ( not ( = ?auto_98864 ?auto_98866 ) ) ( not ( = ?auto_98864 ?auto_98863 ) ) ( not ( = ?auto_98866 ?auto_98863 ) ) ( not ( = ?auto_98859 ?auto_98866 ) ) ( not ( = ?auto_98859 ?auto_98864 ) ) ( not ( = ?auto_98860 ?auto_98866 ) ) ( not ( = ?auto_98860 ?auto_98864 ) ) ( not ( = ?auto_98861 ?auto_98866 ) ) ( not ( = ?auto_98861 ?auto_98864 ) ) ( not ( = ?auto_98865 ?auto_98866 ) ) ( not ( = ?auto_98865 ?auto_98864 ) ) ( not ( = ?auto_98862 ?auto_98866 ) ) ( not ( = ?auto_98862 ?auto_98864 ) ) ( ON ?auto_98863 ?auto_98862 ) ( CLEAR ?auto_98863 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98859 ?auto_98860 ?auto_98861 ?auto_98865 ?auto_98862 )
      ( MAKE-3PILE ?auto_98859 ?auto_98860 ?auto_98861 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98867 - BLOCK
      ?auto_98868 - BLOCK
      ?auto_98869 - BLOCK
    )
    :vars
    (
      ?auto_98870 - BLOCK
      ?auto_98874 - BLOCK
      ?auto_98873 - BLOCK
      ?auto_98871 - BLOCK
      ?auto_98872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98870 ?auto_98869 ) ( ON-TABLE ?auto_98867 ) ( ON ?auto_98868 ?auto_98867 ) ( ON ?auto_98869 ?auto_98868 ) ( not ( = ?auto_98867 ?auto_98868 ) ) ( not ( = ?auto_98867 ?auto_98869 ) ) ( not ( = ?auto_98867 ?auto_98870 ) ) ( not ( = ?auto_98868 ?auto_98869 ) ) ( not ( = ?auto_98868 ?auto_98870 ) ) ( not ( = ?auto_98869 ?auto_98870 ) ) ( not ( = ?auto_98867 ?auto_98874 ) ) ( not ( = ?auto_98867 ?auto_98873 ) ) ( not ( = ?auto_98868 ?auto_98874 ) ) ( not ( = ?auto_98868 ?auto_98873 ) ) ( not ( = ?auto_98869 ?auto_98874 ) ) ( not ( = ?auto_98869 ?auto_98873 ) ) ( not ( = ?auto_98870 ?auto_98874 ) ) ( not ( = ?auto_98870 ?auto_98873 ) ) ( not ( = ?auto_98874 ?auto_98873 ) ) ( ON ?auto_98874 ?auto_98870 ) ( ON-TABLE ?auto_98871 ) ( not ( = ?auto_98871 ?auto_98872 ) ) ( not ( = ?auto_98871 ?auto_98873 ) ) ( not ( = ?auto_98872 ?auto_98873 ) ) ( not ( = ?auto_98867 ?auto_98872 ) ) ( not ( = ?auto_98867 ?auto_98871 ) ) ( not ( = ?auto_98868 ?auto_98872 ) ) ( not ( = ?auto_98868 ?auto_98871 ) ) ( not ( = ?auto_98869 ?auto_98872 ) ) ( not ( = ?auto_98869 ?auto_98871 ) ) ( not ( = ?auto_98870 ?auto_98872 ) ) ( not ( = ?auto_98870 ?auto_98871 ) ) ( not ( = ?auto_98874 ?auto_98872 ) ) ( not ( = ?auto_98874 ?auto_98871 ) ) ( ON ?auto_98873 ?auto_98874 ) ( CLEAR ?auto_98873 ) ( HOLDING ?auto_98872 ) ( CLEAR ?auto_98871 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98871 ?auto_98872 )
      ( MAKE-3PILE ?auto_98867 ?auto_98868 ?auto_98869 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98875 - BLOCK
      ?auto_98876 - BLOCK
      ?auto_98877 - BLOCK
    )
    :vars
    (
      ?auto_98881 - BLOCK
      ?auto_98880 - BLOCK
      ?auto_98882 - BLOCK
      ?auto_98879 - BLOCK
      ?auto_98878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98881 ?auto_98877 ) ( ON-TABLE ?auto_98875 ) ( ON ?auto_98876 ?auto_98875 ) ( ON ?auto_98877 ?auto_98876 ) ( not ( = ?auto_98875 ?auto_98876 ) ) ( not ( = ?auto_98875 ?auto_98877 ) ) ( not ( = ?auto_98875 ?auto_98881 ) ) ( not ( = ?auto_98876 ?auto_98877 ) ) ( not ( = ?auto_98876 ?auto_98881 ) ) ( not ( = ?auto_98877 ?auto_98881 ) ) ( not ( = ?auto_98875 ?auto_98880 ) ) ( not ( = ?auto_98875 ?auto_98882 ) ) ( not ( = ?auto_98876 ?auto_98880 ) ) ( not ( = ?auto_98876 ?auto_98882 ) ) ( not ( = ?auto_98877 ?auto_98880 ) ) ( not ( = ?auto_98877 ?auto_98882 ) ) ( not ( = ?auto_98881 ?auto_98880 ) ) ( not ( = ?auto_98881 ?auto_98882 ) ) ( not ( = ?auto_98880 ?auto_98882 ) ) ( ON ?auto_98880 ?auto_98881 ) ( ON-TABLE ?auto_98879 ) ( not ( = ?auto_98879 ?auto_98878 ) ) ( not ( = ?auto_98879 ?auto_98882 ) ) ( not ( = ?auto_98878 ?auto_98882 ) ) ( not ( = ?auto_98875 ?auto_98878 ) ) ( not ( = ?auto_98875 ?auto_98879 ) ) ( not ( = ?auto_98876 ?auto_98878 ) ) ( not ( = ?auto_98876 ?auto_98879 ) ) ( not ( = ?auto_98877 ?auto_98878 ) ) ( not ( = ?auto_98877 ?auto_98879 ) ) ( not ( = ?auto_98881 ?auto_98878 ) ) ( not ( = ?auto_98881 ?auto_98879 ) ) ( not ( = ?auto_98880 ?auto_98878 ) ) ( not ( = ?auto_98880 ?auto_98879 ) ) ( ON ?auto_98882 ?auto_98880 ) ( CLEAR ?auto_98879 ) ( ON ?auto_98878 ?auto_98882 ) ( CLEAR ?auto_98878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_98875 ?auto_98876 ?auto_98877 ?auto_98881 ?auto_98880 ?auto_98882 )
      ( MAKE-3PILE ?auto_98875 ?auto_98876 ?auto_98877 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98883 - BLOCK
      ?auto_98884 - BLOCK
      ?auto_98885 - BLOCK
    )
    :vars
    (
      ?auto_98890 - BLOCK
      ?auto_98888 - BLOCK
      ?auto_98889 - BLOCK
      ?auto_98887 - BLOCK
      ?auto_98886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98890 ?auto_98885 ) ( ON-TABLE ?auto_98883 ) ( ON ?auto_98884 ?auto_98883 ) ( ON ?auto_98885 ?auto_98884 ) ( not ( = ?auto_98883 ?auto_98884 ) ) ( not ( = ?auto_98883 ?auto_98885 ) ) ( not ( = ?auto_98883 ?auto_98890 ) ) ( not ( = ?auto_98884 ?auto_98885 ) ) ( not ( = ?auto_98884 ?auto_98890 ) ) ( not ( = ?auto_98885 ?auto_98890 ) ) ( not ( = ?auto_98883 ?auto_98888 ) ) ( not ( = ?auto_98883 ?auto_98889 ) ) ( not ( = ?auto_98884 ?auto_98888 ) ) ( not ( = ?auto_98884 ?auto_98889 ) ) ( not ( = ?auto_98885 ?auto_98888 ) ) ( not ( = ?auto_98885 ?auto_98889 ) ) ( not ( = ?auto_98890 ?auto_98888 ) ) ( not ( = ?auto_98890 ?auto_98889 ) ) ( not ( = ?auto_98888 ?auto_98889 ) ) ( ON ?auto_98888 ?auto_98890 ) ( not ( = ?auto_98887 ?auto_98886 ) ) ( not ( = ?auto_98887 ?auto_98889 ) ) ( not ( = ?auto_98886 ?auto_98889 ) ) ( not ( = ?auto_98883 ?auto_98886 ) ) ( not ( = ?auto_98883 ?auto_98887 ) ) ( not ( = ?auto_98884 ?auto_98886 ) ) ( not ( = ?auto_98884 ?auto_98887 ) ) ( not ( = ?auto_98885 ?auto_98886 ) ) ( not ( = ?auto_98885 ?auto_98887 ) ) ( not ( = ?auto_98890 ?auto_98886 ) ) ( not ( = ?auto_98890 ?auto_98887 ) ) ( not ( = ?auto_98888 ?auto_98886 ) ) ( not ( = ?auto_98888 ?auto_98887 ) ) ( ON ?auto_98889 ?auto_98888 ) ( ON ?auto_98886 ?auto_98889 ) ( CLEAR ?auto_98886 ) ( HOLDING ?auto_98887 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_98887 )
      ( MAKE-3PILE ?auto_98883 ?auto_98884 ?auto_98885 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98891 - BLOCK
      ?auto_98892 - BLOCK
      ?auto_98893 - BLOCK
    )
    :vars
    (
      ?auto_98895 - BLOCK
      ?auto_98896 - BLOCK
      ?auto_98898 - BLOCK
      ?auto_98897 - BLOCK
      ?auto_98894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98895 ?auto_98893 ) ( ON-TABLE ?auto_98891 ) ( ON ?auto_98892 ?auto_98891 ) ( ON ?auto_98893 ?auto_98892 ) ( not ( = ?auto_98891 ?auto_98892 ) ) ( not ( = ?auto_98891 ?auto_98893 ) ) ( not ( = ?auto_98891 ?auto_98895 ) ) ( not ( = ?auto_98892 ?auto_98893 ) ) ( not ( = ?auto_98892 ?auto_98895 ) ) ( not ( = ?auto_98893 ?auto_98895 ) ) ( not ( = ?auto_98891 ?auto_98896 ) ) ( not ( = ?auto_98891 ?auto_98898 ) ) ( not ( = ?auto_98892 ?auto_98896 ) ) ( not ( = ?auto_98892 ?auto_98898 ) ) ( not ( = ?auto_98893 ?auto_98896 ) ) ( not ( = ?auto_98893 ?auto_98898 ) ) ( not ( = ?auto_98895 ?auto_98896 ) ) ( not ( = ?auto_98895 ?auto_98898 ) ) ( not ( = ?auto_98896 ?auto_98898 ) ) ( ON ?auto_98896 ?auto_98895 ) ( not ( = ?auto_98897 ?auto_98894 ) ) ( not ( = ?auto_98897 ?auto_98898 ) ) ( not ( = ?auto_98894 ?auto_98898 ) ) ( not ( = ?auto_98891 ?auto_98894 ) ) ( not ( = ?auto_98891 ?auto_98897 ) ) ( not ( = ?auto_98892 ?auto_98894 ) ) ( not ( = ?auto_98892 ?auto_98897 ) ) ( not ( = ?auto_98893 ?auto_98894 ) ) ( not ( = ?auto_98893 ?auto_98897 ) ) ( not ( = ?auto_98895 ?auto_98894 ) ) ( not ( = ?auto_98895 ?auto_98897 ) ) ( not ( = ?auto_98896 ?auto_98894 ) ) ( not ( = ?auto_98896 ?auto_98897 ) ) ( ON ?auto_98898 ?auto_98896 ) ( ON ?auto_98894 ?auto_98898 ) ( ON ?auto_98897 ?auto_98894 ) ( CLEAR ?auto_98897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_98891 ?auto_98892 ?auto_98893 ?auto_98895 ?auto_98896 ?auto_98898 ?auto_98894 )
      ( MAKE-3PILE ?auto_98891 ?auto_98892 ?auto_98893 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98904 - BLOCK
      ?auto_98905 - BLOCK
      ?auto_98906 - BLOCK
      ?auto_98907 - BLOCK
      ?auto_98908 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_98908 ) ( CLEAR ?auto_98907 ) ( ON-TABLE ?auto_98904 ) ( ON ?auto_98905 ?auto_98904 ) ( ON ?auto_98906 ?auto_98905 ) ( ON ?auto_98907 ?auto_98906 ) ( not ( = ?auto_98904 ?auto_98905 ) ) ( not ( = ?auto_98904 ?auto_98906 ) ) ( not ( = ?auto_98904 ?auto_98907 ) ) ( not ( = ?auto_98904 ?auto_98908 ) ) ( not ( = ?auto_98905 ?auto_98906 ) ) ( not ( = ?auto_98905 ?auto_98907 ) ) ( not ( = ?auto_98905 ?auto_98908 ) ) ( not ( = ?auto_98906 ?auto_98907 ) ) ( not ( = ?auto_98906 ?auto_98908 ) ) ( not ( = ?auto_98907 ?auto_98908 ) ) )
    :subtasks
    ( ( !STACK ?auto_98908 ?auto_98907 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98909 - BLOCK
      ?auto_98910 - BLOCK
      ?auto_98911 - BLOCK
      ?auto_98912 - BLOCK
      ?auto_98913 - BLOCK
    )
    :vars
    (
      ?auto_98914 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_98912 ) ( ON-TABLE ?auto_98909 ) ( ON ?auto_98910 ?auto_98909 ) ( ON ?auto_98911 ?auto_98910 ) ( ON ?auto_98912 ?auto_98911 ) ( not ( = ?auto_98909 ?auto_98910 ) ) ( not ( = ?auto_98909 ?auto_98911 ) ) ( not ( = ?auto_98909 ?auto_98912 ) ) ( not ( = ?auto_98909 ?auto_98913 ) ) ( not ( = ?auto_98910 ?auto_98911 ) ) ( not ( = ?auto_98910 ?auto_98912 ) ) ( not ( = ?auto_98910 ?auto_98913 ) ) ( not ( = ?auto_98911 ?auto_98912 ) ) ( not ( = ?auto_98911 ?auto_98913 ) ) ( not ( = ?auto_98912 ?auto_98913 ) ) ( ON ?auto_98913 ?auto_98914 ) ( CLEAR ?auto_98913 ) ( HAND-EMPTY ) ( not ( = ?auto_98909 ?auto_98914 ) ) ( not ( = ?auto_98910 ?auto_98914 ) ) ( not ( = ?auto_98911 ?auto_98914 ) ) ( not ( = ?auto_98912 ?auto_98914 ) ) ( not ( = ?auto_98913 ?auto_98914 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_98913 ?auto_98914 )
      ( MAKE-5PILE ?auto_98909 ?auto_98910 ?auto_98911 ?auto_98912 ?auto_98913 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98915 - BLOCK
      ?auto_98916 - BLOCK
      ?auto_98917 - BLOCK
      ?auto_98918 - BLOCK
      ?auto_98919 - BLOCK
    )
    :vars
    (
      ?auto_98920 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98915 ) ( ON ?auto_98916 ?auto_98915 ) ( ON ?auto_98917 ?auto_98916 ) ( not ( = ?auto_98915 ?auto_98916 ) ) ( not ( = ?auto_98915 ?auto_98917 ) ) ( not ( = ?auto_98915 ?auto_98918 ) ) ( not ( = ?auto_98915 ?auto_98919 ) ) ( not ( = ?auto_98916 ?auto_98917 ) ) ( not ( = ?auto_98916 ?auto_98918 ) ) ( not ( = ?auto_98916 ?auto_98919 ) ) ( not ( = ?auto_98917 ?auto_98918 ) ) ( not ( = ?auto_98917 ?auto_98919 ) ) ( not ( = ?auto_98918 ?auto_98919 ) ) ( ON ?auto_98919 ?auto_98920 ) ( CLEAR ?auto_98919 ) ( not ( = ?auto_98915 ?auto_98920 ) ) ( not ( = ?auto_98916 ?auto_98920 ) ) ( not ( = ?auto_98917 ?auto_98920 ) ) ( not ( = ?auto_98918 ?auto_98920 ) ) ( not ( = ?auto_98919 ?auto_98920 ) ) ( HOLDING ?auto_98918 ) ( CLEAR ?auto_98917 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98915 ?auto_98916 ?auto_98917 ?auto_98918 )
      ( MAKE-5PILE ?auto_98915 ?auto_98916 ?auto_98917 ?auto_98918 ?auto_98919 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98921 - BLOCK
      ?auto_98922 - BLOCK
      ?auto_98923 - BLOCK
      ?auto_98924 - BLOCK
      ?auto_98925 - BLOCK
    )
    :vars
    (
      ?auto_98926 - BLOCK
      ?auto_98927 - BLOCK
      ?auto_98928 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98921 ) ( ON ?auto_98922 ?auto_98921 ) ( ON ?auto_98923 ?auto_98922 ) ( not ( = ?auto_98921 ?auto_98922 ) ) ( not ( = ?auto_98921 ?auto_98923 ) ) ( not ( = ?auto_98921 ?auto_98924 ) ) ( not ( = ?auto_98921 ?auto_98925 ) ) ( not ( = ?auto_98922 ?auto_98923 ) ) ( not ( = ?auto_98922 ?auto_98924 ) ) ( not ( = ?auto_98922 ?auto_98925 ) ) ( not ( = ?auto_98923 ?auto_98924 ) ) ( not ( = ?auto_98923 ?auto_98925 ) ) ( not ( = ?auto_98924 ?auto_98925 ) ) ( ON ?auto_98925 ?auto_98926 ) ( not ( = ?auto_98921 ?auto_98926 ) ) ( not ( = ?auto_98922 ?auto_98926 ) ) ( not ( = ?auto_98923 ?auto_98926 ) ) ( not ( = ?auto_98924 ?auto_98926 ) ) ( not ( = ?auto_98925 ?auto_98926 ) ) ( CLEAR ?auto_98923 ) ( ON ?auto_98924 ?auto_98925 ) ( CLEAR ?auto_98924 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98927 ) ( ON ?auto_98928 ?auto_98927 ) ( ON ?auto_98926 ?auto_98928 ) ( not ( = ?auto_98927 ?auto_98928 ) ) ( not ( = ?auto_98927 ?auto_98926 ) ) ( not ( = ?auto_98927 ?auto_98925 ) ) ( not ( = ?auto_98927 ?auto_98924 ) ) ( not ( = ?auto_98928 ?auto_98926 ) ) ( not ( = ?auto_98928 ?auto_98925 ) ) ( not ( = ?auto_98928 ?auto_98924 ) ) ( not ( = ?auto_98921 ?auto_98927 ) ) ( not ( = ?auto_98921 ?auto_98928 ) ) ( not ( = ?auto_98922 ?auto_98927 ) ) ( not ( = ?auto_98922 ?auto_98928 ) ) ( not ( = ?auto_98923 ?auto_98927 ) ) ( not ( = ?auto_98923 ?auto_98928 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98927 ?auto_98928 ?auto_98926 ?auto_98925 )
      ( MAKE-5PILE ?auto_98921 ?auto_98922 ?auto_98923 ?auto_98924 ?auto_98925 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98929 - BLOCK
      ?auto_98930 - BLOCK
      ?auto_98931 - BLOCK
      ?auto_98932 - BLOCK
      ?auto_98933 - BLOCK
    )
    :vars
    (
      ?auto_98936 - BLOCK
      ?auto_98935 - BLOCK
      ?auto_98934 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98929 ) ( ON ?auto_98930 ?auto_98929 ) ( not ( = ?auto_98929 ?auto_98930 ) ) ( not ( = ?auto_98929 ?auto_98931 ) ) ( not ( = ?auto_98929 ?auto_98932 ) ) ( not ( = ?auto_98929 ?auto_98933 ) ) ( not ( = ?auto_98930 ?auto_98931 ) ) ( not ( = ?auto_98930 ?auto_98932 ) ) ( not ( = ?auto_98930 ?auto_98933 ) ) ( not ( = ?auto_98931 ?auto_98932 ) ) ( not ( = ?auto_98931 ?auto_98933 ) ) ( not ( = ?auto_98932 ?auto_98933 ) ) ( ON ?auto_98933 ?auto_98936 ) ( not ( = ?auto_98929 ?auto_98936 ) ) ( not ( = ?auto_98930 ?auto_98936 ) ) ( not ( = ?auto_98931 ?auto_98936 ) ) ( not ( = ?auto_98932 ?auto_98936 ) ) ( not ( = ?auto_98933 ?auto_98936 ) ) ( ON ?auto_98932 ?auto_98933 ) ( CLEAR ?auto_98932 ) ( ON-TABLE ?auto_98935 ) ( ON ?auto_98934 ?auto_98935 ) ( ON ?auto_98936 ?auto_98934 ) ( not ( = ?auto_98935 ?auto_98934 ) ) ( not ( = ?auto_98935 ?auto_98936 ) ) ( not ( = ?auto_98935 ?auto_98933 ) ) ( not ( = ?auto_98935 ?auto_98932 ) ) ( not ( = ?auto_98934 ?auto_98936 ) ) ( not ( = ?auto_98934 ?auto_98933 ) ) ( not ( = ?auto_98934 ?auto_98932 ) ) ( not ( = ?auto_98929 ?auto_98935 ) ) ( not ( = ?auto_98929 ?auto_98934 ) ) ( not ( = ?auto_98930 ?auto_98935 ) ) ( not ( = ?auto_98930 ?auto_98934 ) ) ( not ( = ?auto_98931 ?auto_98935 ) ) ( not ( = ?auto_98931 ?auto_98934 ) ) ( HOLDING ?auto_98931 ) ( CLEAR ?auto_98930 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98929 ?auto_98930 ?auto_98931 )
      ( MAKE-5PILE ?auto_98929 ?auto_98930 ?auto_98931 ?auto_98932 ?auto_98933 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98937 - BLOCK
      ?auto_98938 - BLOCK
      ?auto_98939 - BLOCK
      ?auto_98940 - BLOCK
      ?auto_98941 - BLOCK
    )
    :vars
    (
      ?auto_98942 - BLOCK
      ?auto_98943 - BLOCK
      ?auto_98944 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98937 ) ( ON ?auto_98938 ?auto_98937 ) ( not ( = ?auto_98937 ?auto_98938 ) ) ( not ( = ?auto_98937 ?auto_98939 ) ) ( not ( = ?auto_98937 ?auto_98940 ) ) ( not ( = ?auto_98937 ?auto_98941 ) ) ( not ( = ?auto_98938 ?auto_98939 ) ) ( not ( = ?auto_98938 ?auto_98940 ) ) ( not ( = ?auto_98938 ?auto_98941 ) ) ( not ( = ?auto_98939 ?auto_98940 ) ) ( not ( = ?auto_98939 ?auto_98941 ) ) ( not ( = ?auto_98940 ?auto_98941 ) ) ( ON ?auto_98941 ?auto_98942 ) ( not ( = ?auto_98937 ?auto_98942 ) ) ( not ( = ?auto_98938 ?auto_98942 ) ) ( not ( = ?auto_98939 ?auto_98942 ) ) ( not ( = ?auto_98940 ?auto_98942 ) ) ( not ( = ?auto_98941 ?auto_98942 ) ) ( ON ?auto_98940 ?auto_98941 ) ( ON-TABLE ?auto_98943 ) ( ON ?auto_98944 ?auto_98943 ) ( ON ?auto_98942 ?auto_98944 ) ( not ( = ?auto_98943 ?auto_98944 ) ) ( not ( = ?auto_98943 ?auto_98942 ) ) ( not ( = ?auto_98943 ?auto_98941 ) ) ( not ( = ?auto_98943 ?auto_98940 ) ) ( not ( = ?auto_98944 ?auto_98942 ) ) ( not ( = ?auto_98944 ?auto_98941 ) ) ( not ( = ?auto_98944 ?auto_98940 ) ) ( not ( = ?auto_98937 ?auto_98943 ) ) ( not ( = ?auto_98937 ?auto_98944 ) ) ( not ( = ?auto_98938 ?auto_98943 ) ) ( not ( = ?auto_98938 ?auto_98944 ) ) ( not ( = ?auto_98939 ?auto_98943 ) ) ( not ( = ?auto_98939 ?auto_98944 ) ) ( CLEAR ?auto_98938 ) ( ON ?auto_98939 ?auto_98940 ) ( CLEAR ?auto_98939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98943 ?auto_98944 ?auto_98942 ?auto_98941 ?auto_98940 )
      ( MAKE-5PILE ?auto_98937 ?auto_98938 ?auto_98939 ?auto_98940 ?auto_98941 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98945 - BLOCK
      ?auto_98946 - BLOCK
      ?auto_98947 - BLOCK
      ?auto_98948 - BLOCK
      ?auto_98949 - BLOCK
    )
    :vars
    (
      ?auto_98952 - BLOCK
      ?auto_98950 - BLOCK
      ?auto_98951 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98945 ) ( not ( = ?auto_98945 ?auto_98946 ) ) ( not ( = ?auto_98945 ?auto_98947 ) ) ( not ( = ?auto_98945 ?auto_98948 ) ) ( not ( = ?auto_98945 ?auto_98949 ) ) ( not ( = ?auto_98946 ?auto_98947 ) ) ( not ( = ?auto_98946 ?auto_98948 ) ) ( not ( = ?auto_98946 ?auto_98949 ) ) ( not ( = ?auto_98947 ?auto_98948 ) ) ( not ( = ?auto_98947 ?auto_98949 ) ) ( not ( = ?auto_98948 ?auto_98949 ) ) ( ON ?auto_98949 ?auto_98952 ) ( not ( = ?auto_98945 ?auto_98952 ) ) ( not ( = ?auto_98946 ?auto_98952 ) ) ( not ( = ?auto_98947 ?auto_98952 ) ) ( not ( = ?auto_98948 ?auto_98952 ) ) ( not ( = ?auto_98949 ?auto_98952 ) ) ( ON ?auto_98948 ?auto_98949 ) ( ON-TABLE ?auto_98950 ) ( ON ?auto_98951 ?auto_98950 ) ( ON ?auto_98952 ?auto_98951 ) ( not ( = ?auto_98950 ?auto_98951 ) ) ( not ( = ?auto_98950 ?auto_98952 ) ) ( not ( = ?auto_98950 ?auto_98949 ) ) ( not ( = ?auto_98950 ?auto_98948 ) ) ( not ( = ?auto_98951 ?auto_98952 ) ) ( not ( = ?auto_98951 ?auto_98949 ) ) ( not ( = ?auto_98951 ?auto_98948 ) ) ( not ( = ?auto_98945 ?auto_98950 ) ) ( not ( = ?auto_98945 ?auto_98951 ) ) ( not ( = ?auto_98946 ?auto_98950 ) ) ( not ( = ?auto_98946 ?auto_98951 ) ) ( not ( = ?auto_98947 ?auto_98950 ) ) ( not ( = ?auto_98947 ?auto_98951 ) ) ( ON ?auto_98947 ?auto_98948 ) ( CLEAR ?auto_98947 ) ( HOLDING ?auto_98946 ) ( CLEAR ?auto_98945 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98945 ?auto_98946 )
      ( MAKE-5PILE ?auto_98945 ?auto_98946 ?auto_98947 ?auto_98948 ?auto_98949 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98953 - BLOCK
      ?auto_98954 - BLOCK
      ?auto_98955 - BLOCK
      ?auto_98956 - BLOCK
      ?auto_98957 - BLOCK
    )
    :vars
    (
      ?auto_98960 - BLOCK
      ?auto_98958 - BLOCK
      ?auto_98959 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98953 ) ( not ( = ?auto_98953 ?auto_98954 ) ) ( not ( = ?auto_98953 ?auto_98955 ) ) ( not ( = ?auto_98953 ?auto_98956 ) ) ( not ( = ?auto_98953 ?auto_98957 ) ) ( not ( = ?auto_98954 ?auto_98955 ) ) ( not ( = ?auto_98954 ?auto_98956 ) ) ( not ( = ?auto_98954 ?auto_98957 ) ) ( not ( = ?auto_98955 ?auto_98956 ) ) ( not ( = ?auto_98955 ?auto_98957 ) ) ( not ( = ?auto_98956 ?auto_98957 ) ) ( ON ?auto_98957 ?auto_98960 ) ( not ( = ?auto_98953 ?auto_98960 ) ) ( not ( = ?auto_98954 ?auto_98960 ) ) ( not ( = ?auto_98955 ?auto_98960 ) ) ( not ( = ?auto_98956 ?auto_98960 ) ) ( not ( = ?auto_98957 ?auto_98960 ) ) ( ON ?auto_98956 ?auto_98957 ) ( ON-TABLE ?auto_98958 ) ( ON ?auto_98959 ?auto_98958 ) ( ON ?auto_98960 ?auto_98959 ) ( not ( = ?auto_98958 ?auto_98959 ) ) ( not ( = ?auto_98958 ?auto_98960 ) ) ( not ( = ?auto_98958 ?auto_98957 ) ) ( not ( = ?auto_98958 ?auto_98956 ) ) ( not ( = ?auto_98959 ?auto_98960 ) ) ( not ( = ?auto_98959 ?auto_98957 ) ) ( not ( = ?auto_98959 ?auto_98956 ) ) ( not ( = ?auto_98953 ?auto_98958 ) ) ( not ( = ?auto_98953 ?auto_98959 ) ) ( not ( = ?auto_98954 ?auto_98958 ) ) ( not ( = ?auto_98954 ?auto_98959 ) ) ( not ( = ?auto_98955 ?auto_98958 ) ) ( not ( = ?auto_98955 ?auto_98959 ) ) ( ON ?auto_98955 ?auto_98956 ) ( CLEAR ?auto_98953 ) ( ON ?auto_98954 ?auto_98955 ) ( CLEAR ?auto_98954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_98958 ?auto_98959 ?auto_98960 ?auto_98957 ?auto_98956 ?auto_98955 )
      ( MAKE-5PILE ?auto_98953 ?auto_98954 ?auto_98955 ?auto_98956 ?auto_98957 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98961 - BLOCK
      ?auto_98962 - BLOCK
      ?auto_98963 - BLOCK
      ?auto_98964 - BLOCK
      ?auto_98965 - BLOCK
    )
    :vars
    (
      ?auto_98967 - BLOCK
      ?auto_98968 - BLOCK
      ?auto_98966 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98961 ?auto_98962 ) ) ( not ( = ?auto_98961 ?auto_98963 ) ) ( not ( = ?auto_98961 ?auto_98964 ) ) ( not ( = ?auto_98961 ?auto_98965 ) ) ( not ( = ?auto_98962 ?auto_98963 ) ) ( not ( = ?auto_98962 ?auto_98964 ) ) ( not ( = ?auto_98962 ?auto_98965 ) ) ( not ( = ?auto_98963 ?auto_98964 ) ) ( not ( = ?auto_98963 ?auto_98965 ) ) ( not ( = ?auto_98964 ?auto_98965 ) ) ( ON ?auto_98965 ?auto_98967 ) ( not ( = ?auto_98961 ?auto_98967 ) ) ( not ( = ?auto_98962 ?auto_98967 ) ) ( not ( = ?auto_98963 ?auto_98967 ) ) ( not ( = ?auto_98964 ?auto_98967 ) ) ( not ( = ?auto_98965 ?auto_98967 ) ) ( ON ?auto_98964 ?auto_98965 ) ( ON-TABLE ?auto_98968 ) ( ON ?auto_98966 ?auto_98968 ) ( ON ?auto_98967 ?auto_98966 ) ( not ( = ?auto_98968 ?auto_98966 ) ) ( not ( = ?auto_98968 ?auto_98967 ) ) ( not ( = ?auto_98968 ?auto_98965 ) ) ( not ( = ?auto_98968 ?auto_98964 ) ) ( not ( = ?auto_98966 ?auto_98967 ) ) ( not ( = ?auto_98966 ?auto_98965 ) ) ( not ( = ?auto_98966 ?auto_98964 ) ) ( not ( = ?auto_98961 ?auto_98968 ) ) ( not ( = ?auto_98961 ?auto_98966 ) ) ( not ( = ?auto_98962 ?auto_98968 ) ) ( not ( = ?auto_98962 ?auto_98966 ) ) ( not ( = ?auto_98963 ?auto_98968 ) ) ( not ( = ?auto_98963 ?auto_98966 ) ) ( ON ?auto_98963 ?auto_98964 ) ( ON ?auto_98962 ?auto_98963 ) ( CLEAR ?auto_98962 ) ( HOLDING ?auto_98961 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_98961 )
      ( MAKE-5PILE ?auto_98961 ?auto_98962 ?auto_98963 ?auto_98964 ?auto_98965 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98969 - BLOCK
      ?auto_98970 - BLOCK
      ?auto_98971 - BLOCK
      ?auto_98972 - BLOCK
      ?auto_98973 - BLOCK
    )
    :vars
    (
      ?auto_98976 - BLOCK
      ?auto_98975 - BLOCK
      ?auto_98974 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98969 ?auto_98970 ) ) ( not ( = ?auto_98969 ?auto_98971 ) ) ( not ( = ?auto_98969 ?auto_98972 ) ) ( not ( = ?auto_98969 ?auto_98973 ) ) ( not ( = ?auto_98970 ?auto_98971 ) ) ( not ( = ?auto_98970 ?auto_98972 ) ) ( not ( = ?auto_98970 ?auto_98973 ) ) ( not ( = ?auto_98971 ?auto_98972 ) ) ( not ( = ?auto_98971 ?auto_98973 ) ) ( not ( = ?auto_98972 ?auto_98973 ) ) ( ON ?auto_98973 ?auto_98976 ) ( not ( = ?auto_98969 ?auto_98976 ) ) ( not ( = ?auto_98970 ?auto_98976 ) ) ( not ( = ?auto_98971 ?auto_98976 ) ) ( not ( = ?auto_98972 ?auto_98976 ) ) ( not ( = ?auto_98973 ?auto_98976 ) ) ( ON ?auto_98972 ?auto_98973 ) ( ON-TABLE ?auto_98975 ) ( ON ?auto_98974 ?auto_98975 ) ( ON ?auto_98976 ?auto_98974 ) ( not ( = ?auto_98975 ?auto_98974 ) ) ( not ( = ?auto_98975 ?auto_98976 ) ) ( not ( = ?auto_98975 ?auto_98973 ) ) ( not ( = ?auto_98975 ?auto_98972 ) ) ( not ( = ?auto_98974 ?auto_98976 ) ) ( not ( = ?auto_98974 ?auto_98973 ) ) ( not ( = ?auto_98974 ?auto_98972 ) ) ( not ( = ?auto_98969 ?auto_98975 ) ) ( not ( = ?auto_98969 ?auto_98974 ) ) ( not ( = ?auto_98970 ?auto_98975 ) ) ( not ( = ?auto_98970 ?auto_98974 ) ) ( not ( = ?auto_98971 ?auto_98975 ) ) ( not ( = ?auto_98971 ?auto_98974 ) ) ( ON ?auto_98971 ?auto_98972 ) ( ON ?auto_98970 ?auto_98971 ) ( ON ?auto_98969 ?auto_98970 ) ( CLEAR ?auto_98969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_98975 ?auto_98974 ?auto_98976 ?auto_98973 ?auto_98972 ?auto_98971 ?auto_98970 )
      ( MAKE-5PILE ?auto_98969 ?auto_98970 ?auto_98971 ?auto_98972 ?auto_98973 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_98979 - BLOCK
      ?auto_98980 - BLOCK
    )
    :vars
    (
      ?auto_98981 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98981 ?auto_98980 ) ( CLEAR ?auto_98981 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98979 ) ( ON ?auto_98980 ?auto_98979 ) ( not ( = ?auto_98979 ?auto_98980 ) ) ( not ( = ?auto_98979 ?auto_98981 ) ) ( not ( = ?auto_98980 ?auto_98981 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_98981 ?auto_98980 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_98982 - BLOCK
      ?auto_98983 - BLOCK
    )
    :vars
    (
      ?auto_98984 - BLOCK
      ?auto_98985 - BLOCK
      ?auto_98986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98984 ?auto_98983 ) ( CLEAR ?auto_98984 ) ( ON-TABLE ?auto_98982 ) ( ON ?auto_98983 ?auto_98982 ) ( not ( = ?auto_98982 ?auto_98983 ) ) ( not ( = ?auto_98982 ?auto_98984 ) ) ( not ( = ?auto_98983 ?auto_98984 ) ) ( HOLDING ?auto_98985 ) ( CLEAR ?auto_98986 ) ( not ( = ?auto_98982 ?auto_98985 ) ) ( not ( = ?auto_98982 ?auto_98986 ) ) ( not ( = ?auto_98983 ?auto_98985 ) ) ( not ( = ?auto_98983 ?auto_98986 ) ) ( not ( = ?auto_98984 ?auto_98985 ) ) ( not ( = ?auto_98984 ?auto_98986 ) ) ( not ( = ?auto_98985 ?auto_98986 ) ) )
    :subtasks
    ( ( !STACK ?auto_98985 ?auto_98986 )
      ( MAKE-2PILE ?auto_98982 ?auto_98983 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_98987 - BLOCK
      ?auto_98988 - BLOCK
    )
    :vars
    (
      ?auto_98989 - BLOCK
      ?auto_98990 - BLOCK
      ?auto_98991 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98989 ?auto_98988 ) ( ON-TABLE ?auto_98987 ) ( ON ?auto_98988 ?auto_98987 ) ( not ( = ?auto_98987 ?auto_98988 ) ) ( not ( = ?auto_98987 ?auto_98989 ) ) ( not ( = ?auto_98988 ?auto_98989 ) ) ( CLEAR ?auto_98990 ) ( not ( = ?auto_98987 ?auto_98991 ) ) ( not ( = ?auto_98987 ?auto_98990 ) ) ( not ( = ?auto_98988 ?auto_98991 ) ) ( not ( = ?auto_98988 ?auto_98990 ) ) ( not ( = ?auto_98989 ?auto_98991 ) ) ( not ( = ?auto_98989 ?auto_98990 ) ) ( not ( = ?auto_98991 ?auto_98990 ) ) ( ON ?auto_98991 ?auto_98989 ) ( CLEAR ?auto_98991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98987 ?auto_98988 ?auto_98989 )
      ( MAKE-2PILE ?auto_98987 ?auto_98988 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_98992 - BLOCK
      ?auto_98993 - BLOCK
    )
    :vars
    (
      ?auto_98994 - BLOCK
      ?auto_98996 - BLOCK
      ?auto_98995 - BLOCK
      ?auto_98999 - BLOCK
      ?auto_98998 - BLOCK
      ?auto_98997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98994 ?auto_98993 ) ( ON-TABLE ?auto_98992 ) ( ON ?auto_98993 ?auto_98992 ) ( not ( = ?auto_98992 ?auto_98993 ) ) ( not ( = ?auto_98992 ?auto_98994 ) ) ( not ( = ?auto_98993 ?auto_98994 ) ) ( not ( = ?auto_98992 ?auto_98996 ) ) ( not ( = ?auto_98992 ?auto_98995 ) ) ( not ( = ?auto_98993 ?auto_98996 ) ) ( not ( = ?auto_98993 ?auto_98995 ) ) ( not ( = ?auto_98994 ?auto_98996 ) ) ( not ( = ?auto_98994 ?auto_98995 ) ) ( not ( = ?auto_98996 ?auto_98995 ) ) ( ON ?auto_98996 ?auto_98994 ) ( CLEAR ?auto_98996 ) ( HOLDING ?auto_98995 ) ( CLEAR ?auto_98999 ) ( ON-TABLE ?auto_98998 ) ( ON ?auto_98997 ?auto_98998 ) ( ON ?auto_98999 ?auto_98997 ) ( not ( = ?auto_98998 ?auto_98997 ) ) ( not ( = ?auto_98998 ?auto_98999 ) ) ( not ( = ?auto_98998 ?auto_98995 ) ) ( not ( = ?auto_98997 ?auto_98999 ) ) ( not ( = ?auto_98997 ?auto_98995 ) ) ( not ( = ?auto_98999 ?auto_98995 ) ) ( not ( = ?auto_98992 ?auto_98999 ) ) ( not ( = ?auto_98992 ?auto_98998 ) ) ( not ( = ?auto_98992 ?auto_98997 ) ) ( not ( = ?auto_98993 ?auto_98999 ) ) ( not ( = ?auto_98993 ?auto_98998 ) ) ( not ( = ?auto_98993 ?auto_98997 ) ) ( not ( = ?auto_98994 ?auto_98999 ) ) ( not ( = ?auto_98994 ?auto_98998 ) ) ( not ( = ?auto_98994 ?auto_98997 ) ) ( not ( = ?auto_98996 ?auto_98999 ) ) ( not ( = ?auto_98996 ?auto_98998 ) ) ( not ( = ?auto_98996 ?auto_98997 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98998 ?auto_98997 ?auto_98999 ?auto_98995 )
      ( MAKE-2PILE ?auto_98992 ?auto_98993 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99000 - BLOCK
      ?auto_99001 - BLOCK
    )
    :vars
    (
      ?auto_99005 - BLOCK
      ?auto_99007 - BLOCK
      ?auto_99004 - BLOCK
      ?auto_99002 - BLOCK
      ?auto_99006 - BLOCK
      ?auto_99003 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99005 ?auto_99001 ) ( ON-TABLE ?auto_99000 ) ( ON ?auto_99001 ?auto_99000 ) ( not ( = ?auto_99000 ?auto_99001 ) ) ( not ( = ?auto_99000 ?auto_99005 ) ) ( not ( = ?auto_99001 ?auto_99005 ) ) ( not ( = ?auto_99000 ?auto_99007 ) ) ( not ( = ?auto_99000 ?auto_99004 ) ) ( not ( = ?auto_99001 ?auto_99007 ) ) ( not ( = ?auto_99001 ?auto_99004 ) ) ( not ( = ?auto_99005 ?auto_99007 ) ) ( not ( = ?auto_99005 ?auto_99004 ) ) ( not ( = ?auto_99007 ?auto_99004 ) ) ( ON ?auto_99007 ?auto_99005 ) ( CLEAR ?auto_99002 ) ( ON-TABLE ?auto_99006 ) ( ON ?auto_99003 ?auto_99006 ) ( ON ?auto_99002 ?auto_99003 ) ( not ( = ?auto_99006 ?auto_99003 ) ) ( not ( = ?auto_99006 ?auto_99002 ) ) ( not ( = ?auto_99006 ?auto_99004 ) ) ( not ( = ?auto_99003 ?auto_99002 ) ) ( not ( = ?auto_99003 ?auto_99004 ) ) ( not ( = ?auto_99002 ?auto_99004 ) ) ( not ( = ?auto_99000 ?auto_99002 ) ) ( not ( = ?auto_99000 ?auto_99006 ) ) ( not ( = ?auto_99000 ?auto_99003 ) ) ( not ( = ?auto_99001 ?auto_99002 ) ) ( not ( = ?auto_99001 ?auto_99006 ) ) ( not ( = ?auto_99001 ?auto_99003 ) ) ( not ( = ?auto_99005 ?auto_99002 ) ) ( not ( = ?auto_99005 ?auto_99006 ) ) ( not ( = ?auto_99005 ?auto_99003 ) ) ( not ( = ?auto_99007 ?auto_99002 ) ) ( not ( = ?auto_99007 ?auto_99006 ) ) ( not ( = ?auto_99007 ?auto_99003 ) ) ( ON ?auto_99004 ?auto_99007 ) ( CLEAR ?auto_99004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_99000 ?auto_99001 ?auto_99005 ?auto_99007 )
      ( MAKE-2PILE ?auto_99000 ?auto_99001 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99008 - BLOCK
      ?auto_99009 - BLOCK
    )
    :vars
    (
      ?auto_99011 - BLOCK
      ?auto_99015 - BLOCK
      ?auto_99010 - BLOCK
      ?auto_99012 - BLOCK
      ?auto_99014 - BLOCK
      ?auto_99013 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99011 ?auto_99009 ) ( ON-TABLE ?auto_99008 ) ( ON ?auto_99009 ?auto_99008 ) ( not ( = ?auto_99008 ?auto_99009 ) ) ( not ( = ?auto_99008 ?auto_99011 ) ) ( not ( = ?auto_99009 ?auto_99011 ) ) ( not ( = ?auto_99008 ?auto_99015 ) ) ( not ( = ?auto_99008 ?auto_99010 ) ) ( not ( = ?auto_99009 ?auto_99015 ) ) ( not ( = ?auto_99009 ?auto_99010 ) ) ( not ( = ?auto_99011 ?auto_99015 ) ) ( not ( = ?auto_99011 ?auto_99010 ) ) ( not ( = ?auto_99015 ?auto_99010 ) ) ( ON ?auto_99015 ?auto_99011 ) ( ON-TABLE ?auto_99012 ) ( ON ?auto_99014 ?auto_99012 ) ( not ( = ?auto_99012 ?auto_99014 ) ) ( not ( = ?auto_99012 ?auto_99013 ) ) ( not ( = ?auto_99012 ?auto_99010 ) ) ( not ( = ?auto_99014 ?auto_99013 ) ) ( not ( = ?auto_99014 ?auto_99010 ) ) ( not ( = ?auto_99013 ?auto_99010 ) ) ( not ( = ?auto_99008 ?auto_99013 ) ) ( not ( = ?auto_99008 ?auto_99012 ) ) ( not ( = ?auto_99008 ?auto_99014 ) ) ( not ( = ?auto_99009 ?auto_99013 ) ) ( not ( = ?auto_99009 ?auto_99012 ) ) ( not ( = ?auto_99009 ?auto_99014 ) ) ( not ( = ?auto_99011 ?auto_99013 ) ) ( not ( = ?auto_99011 ?auto_99012 ) ) ( not ( = ?auto_99011 ?auto_99014 ) ) ( not ( = ?auto_99015 ?auto_99013 ) ) ( not ( = ?auto_99015 ?auto_99012 ) ) ( not ( = ?auto_99015 ?auto_99014 ) ) ( ON ?auto_99010 ?auto_99015 ) ( CLEAR ?auto_99010 ) ( HOLDING ?auto_99013 ) ( CLEAR ?auto_99014 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_99012 ?auto_99014 ?auto_99013 )
      ( MAKE-2PILE ?auto_99008 ?auto_99009 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99016 - BLOCK
      ?auto_99017 - BLOCK
    )
    :vars
    (
      ?auto_99023 - BLOCK
      ?auto_99022 - BLOCK
      ?auto_99021 - BLOCK
      ?auto_99018 - BLOCK
      ?auto_99019 - BLOCK
      ?auto_99020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99023 ?auto_99017 ) ( ON-TABLE ?auto_99016 ) ( ON ?auto_99017 ?auto_99016 ) ( not ( = ?auto_99016 ?auto_99017 ) ) ( not ( = ?auto_99016 ?auto_99023 ) ) ( not ( = ?auto_99017 ?auto_99023 ) ) ( not ( = ?auto_99016 ?auto_99022 ) ) ( not ( = ?auto_99016 ?auto_99021 ) ) ( not ( = ?auto_99017 ?auto_99022 ) ) ( not ( = ?auto_99017 ?auto_99021 ) ) ( not ( = ?auto_99023 ?auto_99022 ) ) ( not ( = ?auto_99023 ?auto_99021 ) ) ( not ( = ?auto_99022 ?auto_99021 ) ) ( ON ?auto_99022 ?auto_99023 ) ( ON-TABLE ?auto_99018 ) ( ON ?auto_99019 ?auto_99018 ) ( not ( = ?auto_99018 ?auto_99019 ) ) ( not ( = ?auto_99018 ?auto_99020 ) ) ( not ( = ?auto_99018 ?auto_99021 ) ) ( not ( = ?auto_99019 ?auto_99020 ) ) ( not ( = ?auto_99019 ?auto_99021 ) ) ( not ( = ?auto_99020 ?auto_99021 ) ) ( not ( = ?auto_99016 ?auto_99020 ) ) ( not ( = ?auto_99016 ?auto_99018 ) ) ( not ( = ?auto_99016 ?auto_99019 ) ) ( not ( = ?auto_99017 ?auto_99020 ) ) ( not ( = ?auto_99017 ?auto_99018 ) ) ( not ( = ?auto_99017 ?auto_99019 ) ) ( not ( = ?auto_99023 ?auto_99020 ) ) ( not ( = ?auto_99023 ?auto_99018 ) ) ( not ( = ?auto_99023 ?auto_99019 ) ) ( not ( = ?auto_99022 ?auto_99020 ) ) ( not ( = ?auto_99022 ?auto_99018 ) ) ( not ( = ?auto_99022 ?auto_99019 ) ) ( ON ?auto_99021 ?auto_99022 ) ( CLEAR ?auto_99019 ) ( ON ?auto_99020 ?auto_99021 ) ( CLEAR ?auto_99020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99016 ?auto_99017 ?auto_99023 ?auto_99022 ?auto_99021 )
      ( MAKE-2PILE ?auto_99016 ?auto_99017 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99024 - BLOCK
      ?auto_99025 - BLOCK
    )
    :vars
    (
      ?auto_99030 - BLOCK
      ?auto_99031 - BLOCK
      ?auto_99027 - BLOCK
      ?auto_99026 - BLOCK
      ?auto_99028 - BLOCK
      ?auto_99029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99030 ?auto_99025 ) ( ON-TABLE ?auto_99024 ) ( ON ?auto_99025 ?auto_99024 ) ( not ( = ?auto_99024 ?auto_99025 ) ) ( not ( = ?auto_99024 ?auto_99030 ) ) ( not ( = ?auto_99025 ?auto_99030 ) ) ( not ( = ?auto_99024 ?auto_99031 ) ) ( not ( = ?auto_99024 ?auto_99027 ) ) ( not ( = ?auto_99025 ?auto_99031 ) ) ( not ( = ?auto_99025 ?auto_99027 ) ) ( not ( = ?auto_99030 ?auto_99031 ) ) ( not ( = ?auto_99030 ?auto_99027 ) ) ( not ( = ?auto_99031 ?auto_99027 ) ) ( ON ?auto_99031 ?auto_99030 ) ( ON-TABLE ?auto_99026 ) ( not ( = ?auto_99026 ?auto_99028 ) ) ( not ( = ?auto_99026 ?auto_99029 ) ) ( not ( = ?auto_99026 ?auto_99027 ) ) ( not ( = ?auto_99028 ?auto_99029 ) ) ( not ( = ?auto_99028 ?auto_99027 ) ) ( not ( = ?auto_99029 ?auto_99027 ) ) ( not ( = ?auto_99024 ?auto_99029 ) ) ( not ( = ?auto_99024 ?auto_99026 ) ) ( not ( = ?auto_99024 ?auto_99028 ) ) ( not ( = ?auto_99025 ?auto_99029 ) ) ( not ( = ?auto_99025 ?auto_99026 ) ) ( not ( = ?auto_99025 ?auto_99028 ) ) ( not ( = ?auto_99030 ?auto_99029 ) ) ( not ( = ?auto_99030 ?auto_99026 ) ) ( not ( = ?auto_99030 ?auto_99028 ) ) ( not ( = ?auto_99031 ?auto_99029 ) ) ( not ( = ?auto_99031 ?auto_99026 ) ) ( not ( = ?auto_99031 ?auto_99028 ) ) ( ON ?auto_99027 ?auto_99031 ) ( ON ?auto_99029 ?auto_99027 ) ( CLEAR ?auto_99029 ) ( HOLDING ?auto_99028 ) ( CLEAR ?auto_99026 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_99026 ?auto_99028 )
      ( MAKE-2PILE ?auto_99024 ?auto_99025 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99032 - BLOCK
      ?auto_99033 - BLOCK
    )
    :vars
    (
      ?auto_99034 - BLOCK
      ?auto_99039 - BLOCK
      ?auto_99036 - BLOCK
      ?auto_99037 - BLOCK
      ?auto_99035 - BLOCK
      ?auto_99038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99034 ?auto_99033 ) ( ON-TABLE ?auto_99032 ) ( ON ?auto_99033 ?auto_99032 ) ( not ( = ?auto_99032 ?auto_99033 ) ) ( not ( = ?auto_99032 ?auto_99034 ) ) ( not ( = ?auto_99033 ?auto_99034 ) ) ( not ( = ?auto_99032 ?auto_99039 ) ) ( not ( = ?auto_99032 ?auto_99036 ) ) ( not ( = ?auto_99033 ?auto_99039 ) ) ( not ( = ?auto_99033 ?auto_99036 ) ) ( not ( = ?auto_99034 ?auto_99039 ) ) ( not ( = ?auto_99034 ?auto_99036 ) ) ( not ( = ?auto_99039 ?auto_99036 ) ) ( ON ?auto_99039 ?auto_99034 ) ( ON-TABLE ?auto_99037 ) ( not ( = ?auto_99037 ?auto_99035 ) ) ( not ( = ?auto_99037 ?auto_99038 ) ) ( not ( = ?auto_99037 ?auto_99036 ) ) ( not ( = ?auto_99035 ?auto_99038 ) ) ( not ( = ?auto_99035 ?auto_99036 ) ) ( not ( = ?auto_99038 ?auto_99036 ) ) ( not ( = ?auto_99032 ?auto_99038 ) ) ( not ( = ?auto_99032 ?auto_99037 ) ) ( not ( = ?auto_99032 ?auto_99035 ) ) ( not ( = ?auto_99033 ?auto_99038 ) ) ( not ( = ?auto_99033 ?auto_99037 ) ) ( not ( = ?auto_99033 ?auto_99035 ) ) ( not ( = ?auto_99034 ?auto_99038 ) ) ( not ( = ?auto_99034 ?auto_99037 ) ) ( not ( = ?auto_99034 ?auto_99035 ) ) ( not ( = ?auto_99039 ?auto_99038 ) ) ( not ( = ?auto_99039 ?auto_99037 ) ) ( not ( = ?auto_99039 ?auto_99035 ) ) ( ON ?auto_99036 ?auto_99039 ) ( ON ?auto_99038 ?auto_99036 ) ( CLEAR ?auto_99037 ) ( ON ?auto_99035 ?auto_99038 ) ( CLEAR ?auto_99035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_99032 ?auto_99033 ?auto_99034 ?auto_99039 ?auto_99036 ?auto_99038 )
      ( MAKE-2PILE ?auto_99032 ?auto_99033 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99040 - BLOCK
      ?auto_99041 - BLOCK
    )
    :vars
    (
      ?auto_99044 - BLOCK
      ?auto_99042 - BLOCK
      ?auto_99047 - BLOCK
      ?auto_99045 - BLOCK
      ?auto_99043 - BLOCK
      ?auto_99046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99044 ?auto_99041 ) ( ON-TABLE ?auto_99040 ) ( ON ?auto_99041 ?auto_99040 ) ( not ( = ?auto_99040 ?auto_99041 ) ) ( not ( = ?auto_99040 ?auto_99044 ) ) ( not ( = ?auto_99041 ?auto_99044 ) ) ( not ( = ?auto_99040 ?auto_99042 ) ) ( not ( = ?auto_99040 ?auto_99047 ) ) ( not ( = ?auto_99041 ?auto_99042 ) ) ( not ( = ?auto_99041 ?auto_99047 ) ) ( not ( = ?auto_99044 ?auto_99042 ) ) ( not ( = ?auto_99044 ?auto_99047 ) ) ( not ( = ?auto_99042 ?auto_99047 ) ) ( ON ?auto_99042 ?auto_99044 ) ( not ( = ?auto_99045 ?auto_99043 ) ) ( not ( = ?auto_99045 ?auto_99046 ) ) ( not ( = ?auto_99045 ?auto_99047 ) ) ( not ( = ?auto_99043 ?auto_99046 ) ) ( not ( = ?auto_99043 ?auto_99047 ) ) ( not ( = ?auto_99046 ?auto_99047 ) ) ( not ( = ?auto_99040 ?auto_99046 ) ) ( not ( = ?auto_99040 ?auto_99045 ) ) ( not ( = ?auto_99040 ?auto_99043 ) ) ( not ( = ?auto_99041 ?auto_99046 ) ) ( not ( = ?auto_99041 ?auto_99045 ) ) ( not ( = ?auto_99041 ?auto_99043 ) ) ( not ( = ?auto_99044 ?auto_99046 ) ) ( not ( = ?auto_99044 ?auto_99045 ) ) ( not ( = ?auto_99044 ?auto_99043 ) ) ( not ( = ?auto_99042 ?auto_99046 ) ) ( not ( = ?auto_99042 ?auto_99045 ) ) ( not ( = ?auto_99042 ?auto_99043 ) ) ( ON ?auto_99047 ?auto_99042 ) ( ON ?auto_99046 ?auto_99047 ) ( ON ?auto_99043 ?auto_99046 ) ( CLEAR ?auto_99043 ) ( HOLDING ?auto_99045 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_99045 )
      ( MAKE-2PILE ?auto_99040 ?auto_99041 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99048 - BLOCK
      ?auto_99049 - BLOCK
    )
    :vars
    (
      ?auto_99052 - BLOCK
      ?auto_99054 - BLOCK
      ?auto_99053 - BLOCK
      ?auto_99051 - BLOCK
      ?auto_99055 - BLOCK
      ?auto_99050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99052 ?auto_99049 ) ( ON-TABLE ?auto_99048 ) ( ON ?auto_99049 ?auto_99048 ) ( not ( = ?auto_99048 ?auto_99049 ) ) ( not ( = ?auto_99048 ?auto_99052 ) ) ( not ( = ?auto_99049 ?auto_99052 ) ) ( not ( = ?auto_99048 ?auto_99054 ) ) ( not ( = ?auto_99048 ?auto_99053 ) ) ( not ( = ?auto_99049 ?auto_99054 ) ) ( not ( = ?auto_99049 ?auto_99053 ) ) ( not ( = ?auto_99052 ?auto_99054 ) ) ( not ( = ?auto_99052 ?auto_99053 ) ) ( not ( = ?auto_99054 ?auto_99053 ) ) ( ON ?auto_99054 ?auto_99052 ) ( not ( = ?auto_99051 ?auto_99055 ) ) ( not ( = ?auto_99051 ?auto_99050 ) ) ( not ( = ?auto_99051 ?auto_99053 ) ) ( not ( = ?auto_99055 ?auto_99050 ) ) ( not ( = ?auto_99055 ?auto_99053 ) ) ( not ( = ?auto_99050 ?auto_99053 ) ) ( not ( = ?auto_99048 ?auto_99050 ) ) ( not ( = ?auto_99048 ?auto_99051 ) ) ( not ( = ?auto_99048 ?auto_99055 ) ) ( not ( = ?auto_99049 ?auto_99050 ) ) ( not ( = ?auto_99049 ?auto_99051 ) ) ( not ( = ?auto_99049 ?auto_99055 ) ) ( not ( = ?auto_99052 ?auto_99050 ) ) ( not ( = ?auto_99052 ?auto_99051 ) ) ( not ( = ?auto_99052 ?auto_99055 ) ) ( not ( = ?auto_99054 ?auto_99050 ) ) ( not ( = ?auto_99054 ?auto_99051 ) ) ( not ( = ?auto_99054 ?auto_99055 ) ) ( ON ?auto_99053 ?auto_99054 ) ( ON ?auto_99050 ?auto_99053 ) ( ON ?auto_99055 ?auto_99050 ) ( ON ?auto_99051 ?auto_99055 ) ( CLEAR ?auto_99051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_99048 ?auto_99049 ?auto_99052 ?auto_99054 ?auto_99053 ?auto_99050 ?auto_99055 )
      ( MAKE-2PILE ?auto_99048 ?auto_99049 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99062 - BLOCK
      ?auto_99063 - BLOCK
      ?auto_99064 - BLOCK
      ?auto_99065 - BLOCK
      ?auto_99066 - BLOCK
      ?auto_99067 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_99067 ) ( CLEAR ?auto_99066 ) ( ON-TABLE ?auto_99062 ) ( ON ?auto_99063 ?auto_99062 ) ( ON ?auto_99064 ?auto_99063 ) ( ON ?auto_99065 ?auto_99064 ) ( ON ?auto_99066 ?auto_99065 ) ( not ( = ?auto_99062 ?auto_99063 ) ) ( not ( = ?auto_99062 ?auto_99064 ) ) ( not ( = ?auto_99062 ?auto_99065 ) ) ( not ( = ?auto_99062 ?auto_99066 ) ) ( not ( = ?auto_99062 ?auto_99067 ) ) ( not ( = ?auto_99063 ?auto_99064 ) ) ( not ( = ?auto_99063 ?auto_99065 ) ) ( not ( = ?auto_99063 ?auto_99066 ) ) ( not ( = ?auto_99063 ?auto_99067 ) ) ( not ( = ?auto_99064 ?auto_99065 ) ) ( not ( = ?auto_99064 ?auto_99066 ) ) ( not ( = ?auto_99064 ?auto_99067 ) ) ( not ( = ?auto_99065 ?auto_99066 ) ) ( not ( = ?auto_99065 ?auto_99067 ) ) ( not ( = ?auto_99066 ?auto_99067 ) ) )
    :subtasks
    ( ( !STACK ?auto_99067 ?auto_99066 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99068 - BLOCK
      ?auto_99069 - BLOCK
      ?auto_99070 - BLOCK
      ?auto_99071 - BLOCK
      ?auto_99072 - BLOCK
      ?auto_99073 - BLOCK
    )
    :vars
    (
      ?auto_99074 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_99072 ) ( ON-TABLE ?auto_99068 ) ( ON ?auto_99069 ?auto_99068 ) ( ON ?auto_99070 ?auto_99069 ) ( ON ?auto_99071 ?auto_99070 ) ( ON ?auto_99072 ?auto_99071 ) ( not ( = ?auto_99068 ?auto_99069 ) ) ( not ( = ?auto_99068 ?auto_99070 ) ) ( not ( = ?auto_99068 ?auto_99071 ) ) ( not ( = ?auto_99068 ?auto_99072 ) ) ( not ( = ?auto_99068 ?auto_99073 ) ) ( not ( = ?auto_99069 ?auto_99070 ) ) ( not ( = ?auto_99069 ?auto_99071 ) ) ( not ( = ?auto_99069 ?auto_99072 ) ) ( not ( = ?auto_99069 ?auto_99073 ) ) ( not ( = ?auto_99070 ?auto_99071 ) ) ( not ( = ?auto_99070 ?auto_99072 ) ) ( not ( = ?auto_99070 ?auto_99073 ) ) ( not ( = ?auto_99071 ?auto_99072 ) ) ( not ( = ?auto_99071 ?auto_99073 ) ) ( not ( = ?auto_99072 ?auto_99073 ) ) ( ON ?auto_99073 ?auto_99074 ) ( CLEAR ?auto_99073 ) ( HAND-EMPTY ) ( not ( = ?auto_99068 ?auto_99074 ) ) ( not ( = ?auto_99069 ?auto_99074 ) ) ( not ( = ?auto_99070 ?auto_99074 ) ) ( not ( = ?auto_99071 ?auto_99074 ) ) ( not ( = ?auto_99072 ?auto_99074 ) ) ( not ( = ?auto_99073 ?auto_99074 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_99073 ?auto_99074 )
      ( MAKE-6PILE ?auto_99068 ?auto_99069 ?auto_99070 ?auto_99071 ?auto_99072 ?auto_99073 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99075 - BLOCK
      ?auto_99076 - BLOCK
      ?auto_99077 - BLOCK
      ?auto_99078 - BLOCK
      ?auto_99079 - BLOCK
      ?auto_99080 - BLOCK
    )
    :vars
    (
      ?auto_99081 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99075 ) ( ON ?auto_99076 ?auto_99075 ) ( ON ?auto_99077 ?auto_99076 ) ( ON ?auto_99078 ?auto_99077 ) ( not ( = ?auto_99075 ?auto_99076 ) ) ( not ( = ?auto_99075 ?auto_99077 ) ) ( not ( = ?auto_99075 ?auto_99078 ) ) ( not ( = ?auto_99075 ?auto_99079 ) ) ( not ( = ?auto_99075 ?auto_99080 ) ) ( not ( = ?auto_99076 ?auto_99077 ) ) ( not ( = ?auto_99076 ?auto_99078 ) ) ( not ( = ?auto_99076 ?auto_99079 ) ) ( not ( = ?auto_99076 ?auto_99080 ) ) ( not ( = ?auto_99077 ?auto_99078 ) ) ( not ( = ?auto_99077 ?auto_99079 ) ) ( not ( = ?auto_99077 ?auto_99080 ) ) ( not ( = ?auto_99078 ?auto_99079 ) ) ( not ( = ?auto_99078 ?auto_99080 ) ) ( not ( = ?auto_99079 ?auto_99080 ) ) ( ON ?auto_99080 ?auto_99081 ) ( CLEAR ?auto_99080 ) ( not ( = ?auto_99075 ?auto_99081 ) ) ( not ( = ?auto_99076 ?auto_99081 ) ) ( not ( = ?auto_99077 ?auto_99081 ) ) ( not ( = ?auto_99078 ?auto_99081 ) ) ( not ( = ?auto_99079 ?auto_99081 ) ) ( not ( = ?auto_99080 ?auto_99081 ) ) ( HOLDING ?auto_99079 ) ( CLEAR ?auto_99078 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99075 ?auto_99076 ?auto_99077 ?auto_99078 ?auto_99079 )
      ( MAKE-6PILE ?auto_99075 ?auto_99076 ?auto_99077 ?auto_99078 ?auto_99079 ?auto_99080 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99082 - BLOCK
      ?auto_99083 - BLOCK
      ?auto_99084 - BLOCK
      ?auto_99085 - BLOCK
      ?auto_99086 - BLOCK
      ?auto_99087 - BLOCK
    )
    :vars
    (
      ?auto_99088 - BLOCK
      ?auto_99089 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99082 ) ( ON ?auto_99083 ?auto_99082 ) ( ON ?auto_99084 ?auto_99083 ) ( ON ?auto_99085 ?auto_99084 ) ( not ( = ?auto_99082 ?auto_99083 ) ) ( not ( = ?auto_99082 ?auto_99084 ) ) ( not ( = ?auto_99082 ?auto_99085 ) ) ( not ( = ?auto_99082 ?auto_99086 ) ) ( not ( = ?auto_99082 ?auto_99087 ) ) ( not ( = ?auto_99083 ?auto_99084 ) ) ( not ( = ?auto_99083 ?auto_99085 ) ) ( not ( = ?auto_99083 ?auto_99086 ) ) ( not ( = ?auto_99083 ?auto_99087 ) ) ( not ( = ?auto_99084 ?auto_99085 ) ) ( not ( = ?auto_99084 ?auto_99086 ) ) ( not ( = ?auto_99084 ?auto_99087 ) ) ( not ( = ?auto_99085 ?auto_99086 ) ) ( not ( = ?auto_99085 ?auto_99087 ) ) ( not ( = ?auto_99086 ?auto_99087 ) ) ( ON ?auto_99087 ?auto_99088 ) ( not ( = ?auto_99082 ?auto_99088 ) ) ( not ( = ?auto_99083 ?auto_99088 ) ) ( not ( = ?auto_99084 ?auto_99088 ) ) ( not ( = ?auto_99085 ?auto_99088 ) ) ( not ( = ?auto_99086 ?auto_99088 ) ) ( not ( = ?auto_99087 ?auto_99088 ) ) ( CLEAR ?auto_99085 ) ( ON ?auto_99086 ?auto_99087 ) ( CLEAR ?auto_99086 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_99089 ) ( ON ?auto_99088 ?auto_99089 ) ( not ( = ?auto_99089 ?auto_99088 ) ) ( not ( = ?auto_99089 ?auto_99087 ) ) ( not ( = ?auto_99089 ?auto_99086 ) ) ( not ( = ?auto_99082 ?auto_99089 ) ) ( not ( = ?auto_99083 ?auto_99089 ) ) ( not ( = ?auto_99084 ?auto_99089 ) ) ( not ( = ?auto_99085 ?auto_99089 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_99089 ?auto_99088 ?auto_99087 )
      ( MAKE-6PILE ?auto_99082 ?auto_99083 ?auto_99084 ?auto_99085 ?auto_99086 ?auto_99087 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99090 - BLOCK
      ?auto_99091 - BLOCK
      ?auto_99092 - BLOCK
      ?auto_99093 - BLOCK
      ?auto_99094 - BLOCK
      ?auto_99095 - BLOCK
    )
    :vars
    (
      ?auto_99096 - BLOCK
      ?auto_99097 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99090 ) ( ON ?auto_99091 ?auto_99090 ) ( ON ?auto_99092 ?auto_99091 ) ( not ( = ?auto_99090 ?auto_99091 ) ) ( not ( = ?auto_99090 ?auto_99092 ) ) ( not ( = ?auto_99090 ?auto_99093 ) ) ( not ( = ?auto_99090 ?auto_99094 ) ) ( not ( = ?auto_99090 ?auto_99095 ) ) ( not ( = ?auto_99091 ?auto_99092 ) ) ( not ( = ?auto_99091 ?auto_99093 ) ) ( not ( = ?auto_99091 ?auto_99094 ) ) ( not ( = ?auto_99091 ?auto_99095 ) ) ( not ( = ?auto_99092 ?auto_99093 ) ) ( not ( = ?auto_99092 ?auto_99094 ) ) ( not ( = ?auto_99092 ?auto_99095 ) ) ( not ( = ?auto_99093 ?auto_99094 ) ) ( not ( = ?auto_99093 ?auto_99095 ) ) ( not ( = ?auto_99094 ?auto_99095 ) ) ( ON ?auto_99095 ?auto_99096 ) ( not ( = ?auto_99090 ?auto_99096 ) ) ( not ( = ?auto_99091 ?auto_99096 ) ) ( not ( = ?auto_99092 ?auto_99096 ) ) ( not ( = ?auto_99093 ?auto_99096 ) ) ( not ( = ?auto_99094 ?auto_99096 ) ) ( not ( = ?auto_99095 ?auto_99096 ) ) ( ON ?auto_99094 ?auto_99095 ) ( CLEAR ?auto_99094 ) ( ON-TABLE ?auto_99097 ) ( ON ?auto_99096 ?auto_99097 ) ( not ( = ?auto_99097 ?auto_99096 ) ) ( not ( = ?auto_99097 ?auto_99095 ) ) ( not ( = ?auto_99097 ?auto_99094 ) ) ( not ( = ?auto_99090 ?auto_99097 ) ) ( not ( = ?auto_99091 ?auto_99097 ) ) ( not ( = ?auto_99092 ?auto_99097 ) ) ( not ( = ?auto_99093 ?auto_99097 ) ) ( HOLDING ?auto_99093 ) ( CLEAR ?auto_99092 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_99090 ?auto_99091 ?auto_99092 ?auto_99093 )
      ( MAKE-6PILE ?auto_99090 ?auto_99091 ?auto_99092 ?auto_99093 ?auto_99094 ?auto_99095 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99098 - BLOCK
      ?auto_99099 - BLOCK
      ?auto_99100 - BLOCK
      ?auto_99101 - BLOCK
      ?auto_99102 - BLOCK
      ?auto_99103 - BLOCK
    )
    :vars
    (
      ?auto_99105 - BLOCK
      ?auto_99104 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99098 ) ( ON ?auto_99099 ?auto_99098 ) ( ON ?auto_99100 ?auto_99099 ) ( not ( = ?auto_99098 ?auto_99099 ) ) ( not ( = ?auto_99098 ?auto_99100 ) ) ( not ( = ?auto_99098 ?auto_99101 ) ) ( not ( = ?auto_99098 ?auto_99102 ) ) ( not ( = ?auto_99098 ?auto_99103 ) ) ( not ( = ?auto_99099 ?auto_99100 ) ) ( not ( = ?auto_99099 ?auto_99101 ) ) ( not ( = ?auto_99099 ?auto_99102 ) ) ( not ( = ?auto_99099 ?auto_99103 ) ) ( not ( = ?auto_99100 ?auto_99101 ) ) ( not ( = ?auto_99100 ?auto_99102 ) ) ( not ( = ?auto_99100 ?auto_99103 ) ) ( not ( = ?auto_99101 ?auto_99102 ) ) ( not ( = ?auto_99101 ?auto_99103 ) ) ( not ( = ?auto_99102 ?auto_99103 ) ) ( ON ?auto_99103 ?auto_99105 ) ( not ( = ?auto_99098 ?auto_99105 ) ) ( not ( = ?auto_99099 ?auto_99105 ) ) ( not ( = ?auto_99100 ?auto_99105 ) ) ( not ( = ?auto_99101 ?auto_99105 ) ) ( not ( = ?auto_99102 ?auto_99105 ) ) ( not ( = ?auto_99103 ?auto_99105 ) ) ( ON ?auto_99102 ?auto_99103 ) ( ON-TABLE ?auto_99104 ) ( ON ?auto_99105 ?auto_99104 ) ( not ( = ?auto_99104 ?auto_99105 ) ) ( not ( = ?auto_99104 ?auto_99103 ) ) ( not ( = ?auto_99104 ?auto_99102 ) ) ( not ( = ?auto_99098 ?auto_99104 ) ) ( not ( = ?auto_99099 ?auto_99104 ) ) ( not ( = ?auto_99100 ?auto_99104 ) ) ( not ( = ?auto_99101 ?auto_99104 ) ) ( CLEAR ?auto_99100 ) ( ON ?auto_99101 ?auto_99102 ) ( CLEAR ?auto_99101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_99104 ?auto_99105 ?auto_99103 ?auto_99102 )
      ( MAKE-6PILE ?auto_99098 ?auto_99099 ?auto_99100 ?auto_99101 ?auto_99102 ?auto_99103 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99106 - BLOCK
      ?auto_99107 - BLOCK
      ?auto_99108 - BLOCK
      ?auto_99109 - BLOCK
      ?auto_99110 - BLOCK
      ?auto_99111 - BLOCK
    )
    :vars
    (
      ?auto_99112 - BLOCK
      ?auto_99113 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99106 ) ( ON ?auto_99107 ?auto_99106 ) ( not ( = ?auto_99106 ?auto_99107 ) ) ( not ( = ?auto_99106 ?auto_99108 ) ) ( not ( = ?auto_99106 ?auto_99109 ) ) ( not ( = ?auto_99106 ?auto_99110 ) ) ( not ( = ?auto_99106 ?auto_99111 ) ) ( not ( = ?auto_99107 ?auto_99108 ) ) ( not ( = ?auto_99107 ?auto_99109 ) ) ( not ( = ?auto_99107 ?auto_99110 ) ) ( not ( = ?auto_99107 ?auto_99111 ) ) ( not ( = ?auto_99108 ?auto_99109 ) ) ( not ( = ?auto_99108 ?auto_99110 ) ) ( not ( = ?auto_99108 ?auto_99111 ) ) ( not ( = ?auto_99109 ?auto_99110 ) ) ( not ( = ?auto_99109 ?auto_99111 ) ) ( not ( = ?auto_99110 ?auto_99111 ) ) ( ON ?auto_99111 ?auto_99112 ) ( not ( = ?auto_99106 ?auto_99112 ) ) ( not ( = ?auto_99107 ?auto_99112 ) ) ( not ( = ?auto_99108 ?auto_99112 ) ) ( not ( = ?auto_99109 ?auto_99112 ) ) ( not ( = ?auto_99110 ?auto_99112 ) ) ( not ( = ?auto_99111 ?auto_99112 ) ) ( ON ?auto_99110 ?auto_99111 ) ( ON-TABLE ?auto_99113 ) ( ON ?auto_99112 ?auto_99113 ) ( not ( = ?auto_99113 ?auto_99112 ) ) ( not ( = ?auto_99113 ?auto_99111 ) ) ( not ( = ?auto_99113 ?auto_99110 ) ) ( not ( = ?auto_99106 ?auto_99113 ) ) ( not ( = ?auto_99107 ?auto_99113 ) ) ( not ( = ?auto_99108 ?auto_99113 ) ) ( not ( = ?auto_99109 ?auto_99113 ) ) ( ON ?auto_99109 ?auto_99110 ) ( CLEAR ?auto_99109 ) ( HOLDING ?auto_99108 ) ( CLEAR ?auto_99107 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_99106 ?auto_99107 ?auto_99108 )
      ( MAKE-6PILE ?auto_99106 ?auto_99107 ?auto_99108 ?auto_99109 ?auto_99110 ?auto_99111 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99114 - BLOCK
      ?auto_99115 - BLOCK
      ?auto_99116 - BLOCK
      ?auto_99117 - BLOCK
      ?auto_99118 - BLOCK
      ?auto_99119 - BLOCK
    )
    :vars
    (
      ?auto_99120 - BLOCK
      ?auto_99121 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99114 ) ( ON ?auto_99115 ?auto_99114 ) ( not ( = ?auto_99114 ?auto_99115 ) ) ( not ( = ?auto_99114 ?auto_99116 ) ) ( not ( = ?auto_99114 ?auto_99117 ) ) ( not ( = ?auto_99114 ?auto_99118 ) ) ( not ( = ?auto_99114 ?auto_99119 ) ) ( not ( = ?auto_99115 ?auto_99116 ) ) ( not ( = ?auto_99115 ?auto_99117 ) ) ( not ( = ?auto_99115 ?auto_99118 ) ) ( not ( = ?auto_99115 ?auto_99119 ) ) ( not ( = ?auto_99116 ?auto_99117 ) ) ( not ( = ?auto_99116 ?auto_99118 ) ) ( not ( = ?auto_99116 ?auto_99119 ) ) ( not ( = ?auto_99117 ?auto_99118 ) ) ( not ( = ?auto_99117 ?auto_99119 ) ) ( not ( = ?auto_99118 ?auto_99119 ) ) ( ON ?auto_99119 ?auto_99120 ) ( not ( = ?auto_99114 ?auto_99120 ) ) ( not ( = ?auto_99115 ?auto_99120 ) ) ( not ( = ?auto_99116 ?auto_99120 ) ) ( not ( = ?auto_99117 ?auto_99120 ) ) ( not ( = ?auto_99118 ?auto_99120 ) ) ( not ( = ?auto_99119 ?auto_99120 ) ) ( ON ?auto_99118 ?auto_99119 ) ( ON-TABLE ?auto_99121 ) ( ON ?auto_99120 ?auto_99121 ) ( not ( = ?auto_99121 ?auto_99120 ) ) ( not ( = ?auto_99121 ?auto_99119 ) ) ( not ( = ?auto_99121 ?auto_99118 ) ) ( not ( = ?auto_99114 ?auto_99121 ) ) ( not ( = ?auto_99115 ?auto_99121 ) ) ( not ( = ?auto_99116 ?auto_99121 ) ) ( not ( = ?auto_99117 ?auto_99121 ) ) ( ON ?auto_99117 ?auto_99118 ) ( CLEAR ?auto_99115 ) ( ON ?auto_99116 ?auto_99117 ) ( CLEAR ?auto_99116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99121 ?auto_99120 ?auto_99119 ?auto_99118 ?auto_99117 )
      ( MAKE-6PILE ?auto_99114 ?auto_99115 ?auto_99116 ?auto_99117 ?auto_99118 ?auto_99119 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99122 - BLOCK
      ?auto_99123 - BLOCK
      ?auto_99124 - BLOCK
      ?auto_99125 - BLOCK
      ?auto_99126 - BLOCK
      ?auto_99127 - BLOCK
    )
    :vars
    (
      ?auto_99129 - BLOCK
      ?auto_99128 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99122 ) ( not ( = ?auto_99122 ?auto_99123 ) ) ( not ( = ?auto_99122 ?auto_99124 ) ) ( not ( = ?auto_99122 ?auto_99125 ) ) ( not ( = ?auto_99122 ?auto_99126 ) ) ( not ( = ?auto_99122 ?auto_99127 ) ) ( not ( = ?auto_99123 ?auto_99124 ) ) ( not ( = ?auto_99123 ?auto_99125 ) ) ( not ( = ?auto_99123 ?auto_99126 ) ) ( not ( = ?auto_99123 ?auto_99127 ) ) ( not ( = ?auto_99124 ?auto_99125 ) ) ( not ( = ?auto_99124 ?auto_99126 ) ) ( not ( = ?auto_99124 ?auto_99127 ) ) ( not ( = ?auto_99125 ?auto_99126 ) ) ( not ( = ?auto_99125 ?auto_99127 ) ) ( not ( = ?auto_99126 ?auto_99127 ) ) ( ON ?auto_99127 ?auto_99129 ) ( not ( = ?auto_99122 ?auto_99129 ) ) ( not ( = ?auto_99123 ?auto_99129 ) ) ( not ( = ?auto_99124 ?auto_99129 ) ) ( not ( = ?auto_99125 ?auto_99129 ) ) ( not ( = ?auto_99126 ?auto_99129 ) ) ( not ( = ?auto_99127 ?auto_99129 ) ) ( ON ?auto_99126 ?auto_99127 ) ( ON-TABLE ?auto_99128 ) ( ON ?auto_99129 ?auto_99128 ) ( not ( = ?auto_99128 ?auto_99129 ) ) ( not ( = ?auto_99128 ?auto_99127 ) ) ( not ( = ?auto_99128 ?auto_99126 ) ) ( not ( = ?auto_99122 ?auto_99128 ) ) ( not ( = ?auto_99123 ?auto_99128 ) ) ( not ( = ?auto_99124 ?auto_99128 ) ) ( not ( = ?auto_99125 ?auto_99128 ) ) ( ON ?auto_99125 ?auto_99126 ) ( ON ?auto_99124 ?auto_99125 ) ( CLEAR ?auto_99124 ) ( HOLDING ?auto_99123 ) ( CLEAR ?auto_99122 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_99122 ?auto_99123 )
      ( MAKE-6PILE ?auto_99122 ?auto_99123 ?auto_99124 ?auto_99125 ?auto_99126 ?auto_99127 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99130 - BLOCK
      ?auto_99131 - BLOCK
      ?auto_99132 - BLOCK
      ?auto_99133 - BLOCK
      ?auto_99134 - BLOCK
      ?auto_99135 - BLOCK
    )
    :vars
    (
      ?auto_99136 - BLOCK
      ?auto_99137 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99130 ) ( not ( = ?auto_99130 ?auto_99131 ) ) ( not ( = ?auto_99130 ?auto_99132 ) ) ( not ( = ?auto_99130 ?auto_99133 ) ) ( not ( = ?auto_99130 ?auto_99134 ) ) ( not ( = ?auto_99130 ?auto_99135 ) ) ( not ( = ?auto_99131 ?auto_99132 ) ) ( not ( = ?auto_99131 ?auto_99133 ) ) ( not ( = ?auto_99131 ?auto_99134 ) ) ( not ( = ?auto_99131 ?auto_99135 ) ) ( not ( = ?auto_99132 ?auto_99133 ) ) ( not ( = ?auto_99132 ?auto_99134 ) ) ( not ( = ?auto_99132 ?auto_99135 ) ) ( not ( = ?auto_99133 ?auto_99134 ) ) ( not ( = ?auto_99133 ?auto_99135 ) ) ( not ( = ?auto_99134 ?auto_99135 ) ) ( ON ?auto_99135 ?auto_99136 ) ( not ( = ?auto_99130 ?auto_99136 ) ) ( not ( = ?auto_99131 ?auto_99136 ) ) ( not ( = ?auto_99132 ?auto_99136 ) ) ( not ( = ?auto_99133 ?auto_99136 ) ) ( not ( = ?auto_99134 ?auto_99136 ) ) ( not ( = ?auto_99135 ?auto_99136 ) ) ( ON ?auto_99134 ?auto_99135 ) ( ON-TABLE ?auto_99137 ) ( ON ?auto_99136 ?auto_99137 ) ( not ( = ?auto_99137 ?auto_99136 ) ) ( not ( = ?auto_99137 ?auto_99135 ) ) ( not ( = ?auto_99137 ?auto_99134 ) ) ( not ( = ?auto_99130 ?auto_99137 ) ) ( not ( = ?auto_99131 ?auto_99137 ) ) ( not ( = ?auto_99132 ?auto_99137 ) ) ( not ( = ?auto_99133 ?auto_99137 ) ) ( ON ?auto_99133 ?auto_99134 ) ( ON ?auto_99132 ?auto_99133 ) ( CLEAR ?auto_99130 ) ( ON ?auto_99131 ?auto_99132 ) ( CLEAR ?auto_99131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_99137 ?auto_99136 ?auto_99135 ?auto_99134 ?auto_99133 ?auto_99132 )
      ( MAKE-6PILE ?auto_99130 ?auto_99131 ?auto_99132 ?auto_99133 ?auto_99134 ?auto_99135 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99138 - BLOCK
      ?auto_99139 - BLOCK
      ?auto_99140 - BLOCK
      ?auto_99141 - BLOCK
      ?auto_99142 - BLOCK
      ?auto_99143 - BLOCK
    )
    :vars
    (
      ?auto_99144 - BLOCK
      ?auto_99145 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99138 ?auto_99139 ) ) ( not ( = ?auto_99138 ?auto_99140 ) ) ( not ( = ?auto_99138 ?auto_99141 ) ) ( not ( = ?auto_99138 ?auto_99142 ) ) ( not ( = ?auto_99138 ?auto_99143 ) ) ( not ( = ?auto_99139 ?auto_99140 ) ) ( not ( = ?auto_99139 ?auto_99141 ) ) ( not ( = ?auto_99139 ?auto_99142 ) ) ( not ( = ?auto_99139 ?auto_99143 ) ) ( not ( = ?auto_99140 ?auto_99141 ) ) ( not ( = ?auto_99140 ?auto_99142 ) ) ( not ( = ?auto_99140 ?auto_99143 ) ) ( not ( = ?auto_99141 ?auto_99142 ) ) ( not ( = ?auto_99141 ?auto_99143 ) ) ( not ( = ?auto_99142 ?auto_99143 ) ) ( ON ?auto_99143 ?auto_99144 ) ( not ( = ?auto_99138 ?auto_99144 ) ) ( not ( = ?auto_99139 ?auto_99144 ) ) ( not ( = ?auto_99140 ?auto_99144 ) ) ( not ( = ?auto_99141 ?auto_99144 ) ) ( not ( = ?auto_99142 ?auto_99144 ) ) ( not ( = ?auto_99143 ?auto_99144 ) ) ( ON ?auto_99142 ?auto_99143 ) ( ON-TABLE ?auto_99145 ) ( ON ?auto_99144 ?auto_99145 ) ( not ( = ?auto_99145 ?auto_99144 ) ) ( not ( = ?auto_99145 ?auto_99143 ) ) ( not ( = ?auto_99145 ?auto_99142 ) ) ( not ( = ?auto_99138 ?auto_99145 ) ) ( not ( = ?auto_99139 ?auto_99145 ) ) ( not ( = ?auto_99140 ?auto_99145 ) ) ( not ( = ?auto_99141 ?auto_99145 ) ) ( ON ?auto_99141 ?auto_99142 ) ( ON ?auto_99140 ?auto_99141 ) ( ON ?auto_99139 ?auto_99140 ) ( CLEAR ?auto_99139 ) ( HOLDING ?auto_99138 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_99138 )
      ( MAKE-6PILE ?auto_99138 ?auto_99139 ?auto_99140 ?auto_99141 ?auto_99142 ?auto_99143 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99146 - BLOCK
      ?auto_99147 - BLOCK
      ?auto_99148 - BLOCK
      ?auto_99149 - BLOCK
      ?auto_99150 - BLOCK
      ?auto_99151 - BLOCK
    )
    :vars
    (
      ?auto_99153 - BLOCK
      ?auto_99152 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99146 ?auto_99147 ) ) ( not ( = ?auto_99146 ?auto_99148 ) ) ( not ( = ?auto_99146 ?auto_99149 ) ) ( not ( = ?auto_99146 ?auto_99150 ) ) ( not ( = ?auto_99146 ?auto_99151 ) ) ( not ( = ?auto_99147 ?auto_99148 ) ) ( not ( = ?auto_99147 ?auto_99149 ) ) ( not ( = ?auto_99147 ?auto_99150 ) ) ( not ( = ?auto_99147 ?auto_99151 ) ) ( not ( = ?auto_99148 ?auto_99149 ) ) ( not ( = ?auto_99148 ?auto_99150 ) ) ( not ( = ?auto_99148 ?auto_99151 ) ) ( not ( = ?auto_99149 ?auto_99150 ) ) ( not ( = ?auto_99149 ?auto_99151 ) ) ( not ( = ?auto_99150 ?auto_99151 ) ) ( ON ?auto_99151 ?auto_99153 ) ( not ( = ?auto_99146 ?auto_99153 ) ) ( not ( = ?auto_99147 ?auto_99153 ) ) ( not ( = ?auto_99148 ?auto_99153 ) ) ( not ( = ?auto_99149 ?auto_99153 ) ) ( not ( = ?auto_99150 ?auto_99153 ) ) ( not ( = ?auto_99151 ?auto_99153 ) ) ( ON ?auto_99150 ?auto_99151 ) ( ON-TABLE ?auto_99152 ) ( ON ?auto_99153 ?auto_99152 ) ( not ( = ?auto_99152 ?auto_99153 ) ) ( not ( = ?auto_99152 ?auto_99151 ) ) ( not ( = ?auto_99152 ?auto_99150 ) ) ( not ( = ?auto_99146 ?auto_99152 ) ) ( not ( = ?auto_99147 ?auto_99152 ) ) ( not ( = ?auto_99148 ?auto_99152 ) ) ( not ( = ?auto_99149 ?auto_99152 ) ) ( ON ?auto_99149 ?auto_99150 ) ( ON ?auto_99148 ?auto_99149 ) ( ON ?auto_99147 ?auto_99148 ) ( ON ?auto_99146 ?auto_99147 ) ( CLEAR ?auto_99146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_99152 ?auto_99153 ?auto_99151 ?auto_99150 ?auto_99149 ?auto_99148 ?auto_99147 )
      ( MAKE-6PILE ?auto_99146 ?auto_99147 ?auto_99148 ?auto_99149 ?auto_99150 ?auto_99151 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99155 - BLOCK
    )
    :vars
    (
      ?auto_99156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99156 ?auto_99155 ) ( CLEAR ?auto_99156 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_99155 ) ( not ( = ?auto_99155 ?auto_99156 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_99156 ?auto_99155 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99157 - BLOCK
    )
    :vars
    (
      ?auto_99158 - BLOCK
      ?auto_99159 - BLOCK
      ?auto_99160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99158 ?auto_99157 ) ( CLEAR ?auto_99158 ) ( ON-TABLE ?auto_99157 ) ( not ( = ?auto_99157 ?auto_99158 ) ) ( HOLDING ?auto_99159 ) ( CLEAR ?auto_99160 ) ( not ( = ?auto_99157 ?auto_99159 ) ) ( not ( = ?auto_99157 ?auto_99160 ) ) ( not ( = ?auto_99158 ?auto_99159 ) ) ( not ( = ?auto_99158 ?auto_99160 ) ) ( not ( = ?auto_99159 ?auto_99160 ) ) )
    :subtasks
    ( ( !STACK ?auto_99159 ?auto_99160 )
      ( MAKE-1PILE ?auto_99157 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99161 - BLOCK
    )
    :vars
    (
      ?auto_99163 - BLOCK
      ?auto_99164 - BLOCK
      ?auto_99162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99163 ?auto_99161 ) ( ON-TABLE ?auto_99161 ) ( not ( = ?auto_99161 ?auto_99163 ) ) ( CLEAR ?auto_99164 ) ( not ( = ?auto_99161 ?auto_99162 ) ) ( not ( = ?auto_99161 ?auto_99164 ) ) ( not ( = ?auto_99163 ?auto_99162 ) ) ( not ( = ?auto_99163 ?auto_99164 ) ) ( not ( = ?auto_99162 ?auto_99164 ) ) ( ON ?auto_99162 ?auto_99163 ) ( CLEAR ?auto_99162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_99161 ?auto_99163 )
      ( MAKE-1PILE ?auto_99161 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99165 - BLOCK
    )
    :vars
    (
      ?auto_99166 - BLOCK
      ?auto_99167 - BLOCK
      ?auto_99168 - BLOCK
      ?auto_99170 - BLOCK
      ?auto_99171 - BLOCK
      ?auto_99172 - BLOCK
      ?auto_99169 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99166 ?auto_99165 ) ( ON-TABLE ?auto_99165 ) ( not ( = ?auto_99165 ?auto_99166 ) ) ( not ( = ?auto_99165 ?auto_99167 ) ) ( not ( = ?auto_99165 ?auto_99168 ) ) ( not ( = ?auto_99166 ?auto_99167 ) ) ( not ( = ?auto_99166 ?auto_99168 ) ) ( not ( = ?auto_99167 ?auto_99168 ) ) ( ON ?auto_99167 ?auto_99166 ) ( CLEAR ?auto_99167 ) ( HOLDING ?auto_99168 ) ( CLEAR ?auto_99170 ) ( ON-TABLE ?auto_99171 ) ( ON ?auto_99172 ?auto_99171 ) ( ON ?auto_99169 ?auto_99172 ) ( ON ?auto_99170 ?auto_99169 ) ( not ( = ?auto_99171 ?auto_99172 ) ) ( not ( = ?auto_99171 ?auto_99169 ) ) ( not ( = ?auto_99171 ?auto_99170 ) ) ( not ( = ?auto_99171 ?auto_99168 ) ) ( not ( = ?auto_99172 ?auto_99169 ) ) ( not ( = ?auto_99172 ?auto_99170 ) ) ( not ( = ?auto_99172 ?auto_99168 ) ) ( not ( = ?auto_99169 ?auto_99170 ) ) ( not ( = ?auto_99169 ?auto_99168 ) ) ( not ( = ?auto_99170 ?auto_99168 ) ) ( not ( = ?auto_99165 ?auto_99170 ) ) ( not ( = ?auto_99165 ?auto_99171 ) ) ( not ( = ?auto_99165 ?auto_99172 ) ) ( not ( = ?auto_99165 ?auto_99169 ) ) ( not ( = ?auto_99166 ?auto_99170 ) ) ( not ( = ?auto_99166 ?auto_99171 ) ) ( not ( = ?auto_99166 ?auto_99172 ) ) ( not ( = ?auto_99166 ?auto_99169 ) ) ( not ( = ?auto_99167 ?auto_99170 ) ) ( not ( = ?auto_99167 ?auto_99171 ) ) ( not ( = ?auto_99167 ?auto_99172 ) ) ( not ( = ?auto_99167 ?auto_99169 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99171 ?auto_99172 ?auto_99169 ?auto_99170 ?auto_99168 )
      ( MAKE-1PILE ?auto_99165 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99173 - BLOCK
    )
    :vars
    (
      ?auto_99175 - BLOCK
      ?auto_99177 - BLOCK
      ?auto_99174 - BLOCK
      ?auto_99180 - BLOCK
      ?auto_99179 - BLOCK
      ?auto_99178 - BLOCK
      ?auto_99176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99175 ?auto_99173 ) ( ON-TABLE ?auto_99173 ) ( not ( = ?auto_99173 ?auto_99175 ) ) ( not ( = ?auto_99173 ?auto_99177 ) ) ( not ( = ?auto_99173 ?auto_99174 ) ) ( not ( = ?auto_99175 ?auto_99177 ) ) ( not ( = ?auto_99175 ?auto_99174 ) ) ( not ( = ?auto_99177 ?auto_99174 ) ) ( ON ?auto_99177 ?auto_99175 ) ( CLEAR ?auto_99180 ) ( ON-TABLE ?auto_99179 ) ( ON ?auto_99178 ?auto_99179 ) ( ON ?auto_99176 ?auto_99178 ) ( ON ?auto_99180 ?auto_99176 ) ( not ( = ?auto_99179 ?auto_99178 ) ) ( not ( = ?auto_99179 ?auto_99176 ) ) ( not ( = ?auto_99179 ?auto_99180 ) ) ( not ( = ?auto_99179 ?auto_99174 ) ) ( not ( = ?auto_99178 ?auto_99176 ) ) ( not ( = ?auto_99178 ?auto_99180 ) ) ( not ( = ?auto_99178 ?auto_99174 ) ) ( not ( = ?auto_99176 ?auto_99180 ) ) ( not ( = ?auto_99176 ?auto_99174 ) ) ( not ( = ?auto_99180 ?auto_99174 ) ) ( not ( = ?auto_99173 ?auto_99180 ) ) ( not ( = ?auto_99173 ?auto_99179 ) ) ( not ( = ?auto_99173 ?auto_99178 ) ) ( not ( = ?auto_99173 ?auto_99176 ) ) ( not ( = ?auto_99175 ?auto_99180 ) ) ( not ( = ?auto_99175 ?auto_99179 ) ) ( not ( = ?auto_99175 ?auto_99178 ) ) ( not ( = ?auto_99175 ?auto_99176 ) ) ( not ( = ?auto_99177 ?auto_99180 ) ) ( not ( = ?auto_99177 ?auto_99179 ) ) ( not ( = ?auto_99177 ?auto_99178 ) ) ( not ( = ?auto_99177 ?auto_99176 ) ) ( ON ?auto_99174 ?auto_99177 ) ( CLEAR ?auto_99174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_99173 ?auto_99175 ?auto_99177 )
      ( MAKE-1PILE ?auto_99173 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99181 - BLOCK
    )
    :vars
    (
      ?auto_99185 - BLOCK
      ?auto_99182 - BLOCK
      ?auto_99184 - BLOCK
      ?auto_99183 - BLOCK
      ?auto_99187 - BLOCK
      ?auto_99188 - BLOCK
      ?auto_99186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99185 ?auto_99181 ) ( ON-TABLE ?auto_99181 ) ( not ( = ?auto_99181 ?auto_99185 ) ) ( not ( = ?auto_99181 ?auto_99182 ) ) ( not ( = ?auto_99181 ?auto_99184 ) ) ( not ( = ?auto_99185 ?auto_99182 ) ) ( not ( = ?auto_99185 ?auto_99184 ) ) ( not ( = ?auto_99182 ?auto_99184 ) ) ( ON ?auto_99182 ?auto_99185 ) ( ON-TABLE ?auto_99183 ) ( ON ?auto_99187 ?auto_99183 ) ( ON ?auto_99188 ?auto_99187 ) ( not ( = ?auto_99183 ?auto_99187 ) ) ( not ( = ?auto_99183 ?auto_99188 ) ) ( not ( = ?auto_99183 ?auto_99186 ) ) ( not ( = ?auto_99183 ?auto_99184 ) ) ( not ( = ?auto_99187 ?auto_99188 ) ) ( not ( = ?auto_99187 ?auto_99186 ) ) ( not ( = ?auto_99187 ?auto_99184 ) ) ( not ( = ?auto_99188 ?auto_99186 ) ) ( not ( = ?auto_99188 ?auto_99184 ) ) ( not ( = ?auto_99186 ?auto_99184 ) ) ( not ( = ?auto_99181 ?auto_99186 ) ) ( not ( = ?auto_99181 ?auto_99183 ) ) ( not ( = ?auto_99181 ?auto_99187 ) ) ( not ( = ?auto_99181 ?auto_99188 ) ) ( not ( = ?auto_99185 ?auto_99186 ) ) ( not ( = ?auto_99185 ?auto_99183 ) ) ( not ( = ?auto_99185 ?auto_99187 ) ) ( not ( = ?auto_99185 ?auto_99188 ) ) ( not ( = ?auto_99182 ?auto_99186 ) ) ( not ( = ?auto_99182 ?auto_99183 ) ) ( not ( = ?auto_99182 ?auto_99187 ) ) ( not ( = ?auto_99182 ?auto_99188 ) ) ( ON ?auto_99184 ?auto_99182 ) ( CLEAR ?auto_99184 ) ( HOLDING ?auto_99186 ) ( CLEAR ?auto_99188 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_99183 ?auto_99187 ?auto_99188 ?auto_99186 )
      ( MAKE-1PILE ?auto_99181 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99189 - BLOCK
    )
    :vars
    (
      ?auto_99193 - BLOCK
      ?auto_99196 - BLOCK
      ?auto_99194 - BLOCK
      ?auto_99190 - BLOCK
      ?auto_99195 - BLOCK
      ?auto_99192 - BLOCK
      ?auto_99191 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99193 ?auto_99189 ) ( ON-TABLE ?auto_99189 ) ( not ( = ?auto_99189 ?auto_99193 ) ) ( not ( = ?auto_99189 ?auto_99196 ) ) ( not ( = ?auto_99189 ?auto_99194 ) ) ( not ( = ?auto_99193 ?auto_99196 ) ) ( not ( = ?auto_99193 ?auto_99194 ) ) ( not ( = ?auto_99196 ?auto_99194 ) ) ( ON ?auto_99196 ?auto_99193 ) ( ON-TABLE ?auto_99190 ) ( ON ?auto_99195 ?auto_99190 ) ( ON ?auto_99192 ?auto_99195 ) ( not ( = ?auto_99190 ?auto_99195 ) ) ( not ( = ?auto_99190 ?auto_99192 ) ) ( not ( = ?auto_99190 ?auto_99191 ) ) ( not ( = ?auto_99190 ?auto_99194 ) ) ( not ( = ?auto_99195 ?auto_99192 ) ) ( not ( = ?auto_99195 ?auto_99191 ) ) ( not ( = ?auto_99195 ?auto_99194 ) ) ( not ( = ?auto_99192 ?auto_99191 ) ) ( not ( = ?auto_99192 ?auto_99194 ) ) ( not ( = ?auto_99191 ?auto_99194 ) ) ( not ( = ?auto_99189 ?auto_99191 ) ) ( not ( = ?auto_99189 ?auto_99190 ) ) ( not ( = ?auto_99189 ?auto_99195 ) ) ( not ( = ?auto_99189 ?auto_99192 ) ) ( not ( = ?auto_99193 ?auto_99191 ) ) ( not ( = ?auto_99193 ?auto_99190 ) ) ( not ( = ?auto_99193 ?auto_99195 ) ) ( not ( = ?auto_99193 ?auto_99192 ) ) ( not ( = ?auto_99196 ?auto_99191 ) ) ( not ( = ?auto_99196 ?auto_99190 ) ) ( not ( = ?auto_99196 ?auto_99195 ) ) ( not ( = ?auto_99196 ?auto_99192 ) ) ( ON ?auto_99194 ?auto_99196 ) ( CLEAR ?auto_99192 ) ( ON ?auto_99191 ?auto_99194 ) ( CLEAR ?auto_99191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_99189 ?auto_99193 ?auto_99196 ?auto_99194 )
      ( MAKE-1PILE ?auto_99189 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99197 - BLOCK
    )
    :vars
    (
      ?auto_99200 - BLOCK
      ?auto_99203 - BLOCK
      ?auto_99198 - BLOCK
      ?auto_99204 - BLOCK
      ?auto_99201 - BLOCK
      ?auto_99199 - BLOCK
      ?auto_99202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99200 ?auto_99197 ) ( ON-TABLE ?auto_99197 ) ( not ( = ?auto_99197 ?auto_99200 ) ) ( not ( = ?auto_99197 ?auto_99203 ) ) ( not ( = ?auto_99197 ?auto_99198 ) ) ( not ( = ?auto_99200 ?auto_99203 ) ) ( not ( = ?auto_99200 ?auto_99198 ) ) ( not ( = ?auto_99203 ?auto_99198 ) ) ( ON ?auto_99203 ?auto_99200 ) ( ON-TABLE ?auto_99204 ) ( ON ?auto_99201 ?auto_99204 ) ( not ( = ?auto_99204 ?auto_99201 ) ) ( not ( = ?auto_99204 ?auto_99199 ) ) ( not ( = ?auto_99204 ?auto_99202 ) ) ( not ( = ?auto_99204 ?auto_99198 ) ) ( not ( = ?auto_99201 ?auto_99199 ) ) ( not ( = ?auto_99201 ?auto_99202 ) ) ( not ( = ?auto_99201 ?auto_99198 ) ) ( not ( = ?auto_99199 ?auto_99202 ) ) ( not ( = ?auto_99199 ?auto_99198 ) ) ( not ( = ?auto_99202 ?auto_99198 ) ) ( not ( = ?auto_99197 ?auto_99202 ) ) ( not ( = ?auto_99197 ?auto_99204 ) ) ( not ( = ?auto_99197 ?auto_99201 ) ) ( not ( = ?auto_99197 ?auto_99199 ) ) ( not ( = ?auto_99200 ?auto_99202 ) ) ( not ( = ?auto_99200 ?auto_99204 ) ) ( not ( = ?auto_99200 ?auto_99201 ) ) ( not ( = ?auto_99200 ?auto_99199 ) ) ( not ( = ?auto_99203 ?auto_99202 ) ) ( not ( = ?auto_99203 ?auto_99204 ) ) ( not ( = ?auto_99203 ?auto_99201 ) ) ( not ( = ?auto_99203 ?auto_99199 ) ) ( ON ?auto_99198 ?auto_99203 ) ( ON ?auto_99202 ?auto_99198 ) ( CLEAR ?auto_99202 ) ( HOLDING ?auto_99199 ) ( CLEAR ?auto_99201 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_99204 ?auto_99201 ?auto_99199 )
      ( MAKE-1PILE ?auto_99197 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99205 - BLOCK
    )
    :vars
    (
      ?auto_99208 - BLOCK
      ?auto_99211 - BLOCK
      ?auto_99210 - BLOCK
      ?auto_99212 - BLOCK
      ?auto_99207 - BLOCK
      ?auto_99209 - BLOCK
      ?auto_99206 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99208 ?auto_99205 ) ( ON-TABLE ?auto_99205 ) ( not ( = ?auto_99205 ?auto_99208 ) ) ( not ( = ?auto_99205 ?auto_99211 ) ) ( not ( = ?auto_99205 ?auto_99210 ) ) ( not ( = ?auto_99208 ?auto_99211 ) ) ( not ( = ?auto_99208 ?auto_99210 ) ) ( not ( = ?auto_99211 ?auto_99210 ) ) ( ON ?auto_99211 ?auto_99208 ) ( ON-TABLE ?auto_99212 ) ( ON ?auto_99207 ?auto_99212 ) ( not ( = ?auto_99212 ?auto_99207 ) ) ( not ( = ?auto_99212 ?auto_99209 ) ) ( not ( = ?auto_99212 ?auto_99206 ) ) ( not ( = ?auto_99212 ?auto_99210 ) ) ( not ( = ?auto_99207 ?auto_99209 ) ) ( not ( = ?auto_99207 ?auto_99206 ) ) ( not ( = ?auto_99207 ?auto_99210 ) ) ( not ( = ?auto_99209 ?auto_99206 ) ) ( not ( = ?auto_99209 ?auto_99210 ) ) ( not ( = ?auto_99206 ?auto_99210 ) ) ( not ( = ?auto_99205 ?auto_99206 ) ) ( not ( = ?auto_99205 ?auto_99212 ) ) ( not ( = ?auto_99205 ?auto_99207 ) ) ( not ( = ?auto_99205 ?auto_99209 ) ) ( not ( = ?auto_99208 ?auto_99206 ) ) ( not ( = ?auto_99208 ?auto_99212 ) ) ( not ( = ?auto_99208 ?auto_99207 ) ) ( not ( = ?auto_99208 ?auto_99209 ) ) ( not ( = ?auto_99211 ?auto_99206 ) ) ( not ( = ?auto_99211 ?auto_99212 ) ) ( not ( = ?auto_99211 ?auto_99207 ) ) ( not ( = ?auto_99211 ?auto_99209 ) ) ( ON ?auto_99210 ?auto_99211 ) ( ON ?auto_99206 ?auto_99210 ) ( CLEAR ?auto_99207 ) ( ON ?auto_99209 ?auto_99206 ) ( CLEAR ?auto_99209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99205 ?auto_99208 ?auto_99211 ?auto_99210 ?auto_99206 )
      ( MAKE-1PILE ?auto_99205 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99213 - BLOCK
    )
    :vars
    (
      ?auto_99219 - BLOCK
      ?auto_99214 - BLOCK
      ?auto_99220 - BLOCK
      ?auto_99217 - BLOCK
      ?auto_99215 - BLOCK
      ?auto_99218 - BLOCK
      ?auto_99216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99219 ?auto_99213 ) ( ON-TABLE ?auto_99213 ) ( not ( = ?auto_99213 ?auto_99219 ) ) ( not ( = ?auto_99213 ?auto_99214 ) ) ( not ( = ?auto_99213 ?auto_99220 ) ) ( not ( = ?auto_99219 ?auto_99214 ) ) ( not ( = ?auto_99219 ?auto_99220 ) ) ( not ( = ?auto_99214 ?auto_99220 ) ) ( ON ?auto_99214 ?auto_99219 ) ( ON-TABLE ?auto_99217 ) ( not ( = ?auto_99217 ?auto_99215 ) ) ( not ( = ?auto_99217 ?auto_99218 ) ) ( not ( = ?auto_99217 ?auto_99216 ) ) ( not ( = ?auto_99217 ?auto_99220 ) ) ( not ( = ?auto_99215 ?auto_99218 ) ) ( not ( = ?auto_99215 ?auto_99216 ) ) ( not ( = ?auto_99215 ?auto_99220 ) ) ( not ( = ?auto_99218 ?auto_99216 ) ) ( not ( = ?auto_99218 ?auto_99220 ) ) ( not ( = ?auto_99216 ?auto_99220 ) ) ( not ( = ?auto_99213 ?auto_99216 ) ) ( not ( = ?auto_99213 ?auto_99217 ) ) ( not ( = ?auto_99213 ?auto_99215 ) ) ( not ( = ?auto_99213 ?auto_99218 ) ) ( not ( = ?auto_99219 ?auto_99216 ) ) ( not ( = ?auto_99219 ?auto_99217 ) ) ( not ( = ?auto_99219 ?auto_99215 ) ) ( not ( = ?auto_99219 ?auto_99218 ) ) ( not ( = ?auto_99214 ?auto_99216 ) ) ( not ( = ?auto_99214 ?auto_99217 ) ) ( not ( = ?auto_99214 ?auto_99215 ) ) ( not ( = ?auto_99214 ?auto_99218 ) ) ( ON ?auto_99220 ?auto_99214 ) ( ON ?auto_99216 ?auto_99220 ) ( ON ?auto_99218 ?auto_99216 ) ( CLEAR ?auto_99218 ) ( HOLDING ?auto_99215 ) ( CLEAR ?auto_99217 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_99217 ?auto_99215 )
      ( MAKE-1PILE ?auto_99213 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99221 - BLOCK
    )
    :vars
    (
      ?auto_99228 - BLOCK
      ?auto_99224 - BLOCK
      ?auto_99222 - BLOCK
      ?auto_99226 - BLOCK
      ?auto_99225 - BLOCK
      ?auto_99223 - BLOCK
      ?auto_99227 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99228 ?auto_99221 ) ( ON-TABLE ?auto_99221 ) ( not ( = ?auto_99221 ?auto_99228 ) ) ( not ( = ?auto_99221 ?auto_99224 ) ) ( not ( = ?auto_99221 ?auto_99222 ) ) ( not ( = ?auto_99228 ?auto_99224 ) ) ( not ( = ?auto_99228 ?auto_99222 ) ) ( not ( = ?auto_99224 ?auto_99222 ) ) ( ON ?auto_99224 ?auto_99228 ) ( ON-TABLE ?auto_99226 ) ( not ( = ?auto_99226 ?auto_99225 ) ) ( not ( = ?auto_99226 ?auto_99223 ) ) ( not ( = ?auto_99226 ?auto_99227 ) ) ( not ( = ?auto_99226 ?auto_99222 ) ) ( not ( = ?auto_99225 ?auto_99223 ) ) ( not ( = ?auto_99225 ?auto_99227 ) ) ( not ( = ?auto_99225 ?auto_99222 ) ) ( not ( = ?auto_99223 ?auto_99227 ) ) ( not ( = ?auto_99223 ?auto_99222 ) ) ( not ( = ?auto_99227 ?auto_99222 ) ) ( not ( = ?auto_99221 ?auto_99227 ) ) ( not ( = ?auto_99221 ?auto_99226 ) ) ( not ( = ?auto_99221 ?auto_99225 ) ) ( not ( = ?auto_99221 ?auto_99223 ) ) ( not ( = ?auto_99228 ?auto_99227 ) ) ( not ( = ?auto_99228 ?auto_99226 ) ) ( not ( = ?auto_99228 ?auto_99225 ) ) ( not ( = ?auto_99228 ?auto_99223 ) ) ( not ( = ?auto_99224 ?auto_99227 ) ) ( not ( = ?auto_99224 ?auto_99226 ) ) ( not ( = ?auto_99224 ?auto_99225 ) ) ( not ( = ?auto_99224 ?auto_99223 ) ) ( ON ?auto_99222 ?auto_99224 ) ( ON ?auto_99227 ?auto_99222 ) ( ON ?auto_99223 ?auto_99227 ) ( CLEAR ?auto_99226 ) ( ON ?auto_99225 ?auto_99223 ) ( CLEAR ?auto_99225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_99221 ?auto_99228 ?auto_99224 ?auto_99222 ?auto_99227 ?auto_99223 )
      ( MAKE-1PILE ?auto_99221 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99229 - BLOCK
    )
    :vars
    (
      ?auto_99233 - BLOCK
      ?auto_99236 - BLOCK
      ?auto_99230 - BLOCK
      ?auto_99232 - BLOCK
      ?auto_99235 - BLOCK
      ?auto_99231 - BLOCK
      ?auto_99234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99233 ?auto_99229 ) ( ON-TABLE ?auto_99229 ) ( not ( = ?auto_99229 ?auto_99233 ) ) ( not ( = ?auto_99229 ?auto_99236 ) ) ( not ( = ?auto_99229 ?auto_99230 ) ) ( not ( = ?auto_99233 ?auto_99236 ) ) ( not ( = ?auto_99233 ?auto_99230 ) ) ( not ( = ?auto_99236 ?auto_99230 ) ) ( ON ?auto_99236 ?auto_99233 ) ( not ( = ?auto_99232 ?auto_99235 ) ) ( not ( = ?auto_99232 ?auto_99231 ) ) ( not ( = ?auto_99232 ?auto_99234 ) ) ( not ( = ?auto_99232 ?auto_99230 ) ) ( not ( = ?auto_99235 ?auto_99231 ) ) ( not ( = ?auto_99235 ?auto_99234 ) ) ( not ( = ?auto_99235 ?auto_99230 ) ) ( not ( = ?auto_99231 ?auto_99234 ) ) ( not ( = ?auto_99231 ?auto_99230 ) ) ( not ( = ?auto_99234 ?auto_99230 ) ) ( not ( = ?auto_99229 ?auto_99234 ) ) ( not ( = ?auto_99229 ?auto_99232 ) ) ( not ( = ?auto_99229 ?auto_99235 ) ) ( not ( = ?auto_99229 ?auto_99231 ) ) ( not ( = ?auto_99233 ?auto_99234 ) ) ( not ( = ?auto_99233 ?auto_99232 ) ) ( not ( = ?auto_99233 ?auto_99235 ) ) ( not ( = ?auto_99233 ?auto_99231 ) ) ( not ( = ?auto_99236 ?auto_99234 ) ) ( not ( = ?auto_99236 ?auto_99232 ) ) ( not ( = ?auto_99236 ?auto_99235 ) ) ( not ( = ?auto_99236 ?auto_99231 ) ) ( ON ?auto_99230 ?auto_99236 ) ( ON ?auto_99234 ?auto_99230 ) ( ON ?auto_99231 ?auto_99234 ) ( ON ?auto_99235 ?auto_99231 ) ( CLEAR ?auto_99235 ) ( HOLDING ?auto_99232 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_99232 )
      ( MAKE-1PILE ?auto_99229 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99237 - BLOCK
    )
    :vars
    (
      ?auto_99239 - BLOCK
      ?auto_99243 - BLOCK
      ?auto_99238 - BLOCK
      ?auto_99242 - BLOCK
      ?auto_99241 - BLOCK
      ?auto_99240 - BLOCK
      ?auto_99244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99239 ?auto_99237 ) ( ON-TABLE ?auto_99237 ) ( not ( = ?auto_99237 ?auto_99239 ) ) ( not ( = ?auto_99237 ?auto_99243 ) ) ( not ( = ?auto_99237 ?auto_99238 ) ) ( not ( = ?auto_99239 ?auto_99243 ) ) ( not ( = ?auto_99239 ?auto_99238 ) ) ( not ( = ?auto_99243 ?auto_99238 ) ) ( ON ?auto_99243 ?auto_99239 ) ( not ( = ?auto_99242 ?auto_99241 ) ) ( not ( = ?auto_99242 ?auto_99240 ) ) ( not ( = ?auto_99242 ?auto_99244 ) ) ( not ( = ?auto_99242 ?auto_99238 ) ) ( not ( = ?auto_99241 ?auto_99240 ) ) ( not ( = ?auto_99241 ?auto_99244 ) ) ( not ( = ?auto_99241 ?auto_99238 ) ) ( not ( = ?auto_99240 ?auto_99244 ) ) ( not ( = ?auto_99240 ?auto_99238 ) ) ( not ( = ?auto_99244 ?auto_99238 ) ) ( not ( = ?auto_99237 ?auto_99244 ) ) ( not ( = ?auto_99237 ?auto_99242 ) ) ( not ( = ?auto_99237 ?auto_99241 ) ) ( not ( = ?auto_99237 ?auto_99240 ) ) ( not ( = ?auto_99239 ?auto_99244 ) ) ( not ( = ?auto_99239 ?auto_99242 ) ) ( not ( = ?auto_99239 ?auto_99241 ) ) ( not ( = ?auto_99239 ?auto_99240 ) ) ( not ( = ?auto_99243 ?auto_99244 ) ) ( not ( = ?auto_99243 ?auto_99242 ) ) ( not ( = ?auto_99243 ?auto_99241 ) ) ( not ( = ?auto_99243 ?auto_99240 ) ) ( ON ?auto_99238 ?auto_99243 ) ( ON ?auto_99244 ?auto_99238 ) ( ON ?auto_99240 ?auto_99244 ) ( ON ?auto_99241 ?auto_99240 ) ( ON ?auto_99242 ?auto_99241 ) ( CLEAR ?auto_99242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_99237 ?auto_99239 ?auto_99243 ?auto_99238 ?auto_99244 ?auto_99240 ?auto_99241 )
      ( MAKE-1PILE ?auto_99237 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99252 - BLOCK
      ?auto_99253 - BLOCK
      ?auto_99254 - BLOCK
      ?auto_99255 - BLOCK
      ?auto_99256 - BLOCK
      ?auto_99257 - BLOCK
      ?auto_99258 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_99258 ) ( CLEAR ?auto_99257 ) ( ON-TABLE ?auto_99252 ) ( ON ?auto_99253 ?auto_99252 ) ( ON ?auto_99254 ?auto_99253 ) ( ON ?auto_99255 ?auto_99254 ) ( ON ?auto_99256 ?auto_99255 ) ( ON ?auto_99257 ?auto_99256 ) ( not ( = ?auto_99252 ?auto_99253 ) ) ( not ( = ?auto_99252 ?auto_99254 ) ) ( not ( = ?auto_99252 ?auto_99255 ) ) ( not ( = ?auto_99252 ?auto_99256 ) ) ( not ( = ?auto_99252 ?auto_99257 ) ) ( not ( = ?auto_99252 ?auto_99258 ) ) ( not ( = ?auto_99253 ?auto_99254 ) ) ( not ( = ?auto_99253 ?auto_99255 ) ) ( not ( = ?auto_99253 ?auto_99256 ) ) ( not ( = ?auto_99253 ?auto_99257 ) ) ( not ( = ?auto_99253 ?auto_99258 ) ) ( not ( = ?auto_99254 ?auto_99255 ) ) ( not ( = ?auto_99254 ?auto_99256 ) ) ( not ( = ?auto_99254 ?auto_99257 ) ) ( not ( = ?auto_99254 ?auto_99258 ) ) ( not ( = ?auto_99255 ?auto_99256 ) ) ( not ( = ?auto_99255 ?auto_99257 ) ) ( not ( = ?auto_99255 ?auto_99258 ) ) ( not ( = ?auto_99256 ?auto_99257 ) ) ( not ( = ?auto_99256 ?auto_99258 ) ) ( not ( = ?auto_99257 ?auto_99258 ) ) )
    :subtasks
    ( ( !STACK ?auto_99258 ?auto_99257 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99259 - BLOCK
      ?auto_99260 - BLOCK
      ?auto_99261 - BLOCK
      ?auto_99262 - BLOCK
      ?auto_99263 - BLOCK
      ?auto_99264 - BLOCK
      ?auto_99265 - BLOCK
    )
    :vars
    (
      ?auto_99266 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_99264 ) ( ON-TABLE ?auto_99259 ) ( ON ?auto_99260 ?auto_99259 ) ( ON ?auto_99261 ?auto_99260 ) ( ON ?auto_99262 ?auto_99261 ) ( ON ?auto_99263 ?auto_99262 ) ( ON ?auto_99264 ?auto_99263 ) ( not ( = ?auto_99259 ?auto_99260 ) ) ( not ( = ?auto_99259 ?auto_99261 ) ) ( not ( = ?auto_99259 ?auto_99262 ) ) ( not ( = ?auto_99259 ?auto_99263 ) ) ( not ( = ?auto_99259 ?auto_99264 ) ) ( not ( = ?auto_99259 ?auto_99265 ) ) ( not ( = ?auto_99260 ?auto_99261 ) ) ( not ( = ?auto_99260 ?auto_99262 ) ) ( not ( = ?auto_99260 ?auto_99263 ) ) ( not ( = ?auto_99260 ?auto_99264 ) ) ( not ( = ?auto_99260 ?auto_99265 ) ) ( not ( = ?auto_99261 ?auto_99262 ) ) ( not ( = ?auto_99261 ?auto_99263 ) ) ( not ( = ?auto_99261 ?auto_99264 ) ) ( not ( = ?auto_99261 ?auto_99265 ) ) ( not ( = ?auto_99262 ?auto_99263 ) ) ( not ( = ?auto_99262 ?auto_99264 ) ) ( not ( = ?auto_99262 ?auto_99265 ) ) ( not ( = ?auto_99263 ?auto_99264 ) ) ( not ( = ?auto_99263 ?auto_99265 ) ) ( not ( = ?auto_99264 ?auto_99265 ) ) ( ON ?auto_99265 ?auto_99266 ) ( CLEAR ?auto_99265 ) ( HAND-EMPTY ) ( not ( = ?auto_99259 ?auto_99266 ) ) ( not ( = ?auto_99260 ?auto_99266 ) ) ( not ( = ?auto_99261 ?auto_99266 ) ) ( not ( = ?auto_99262 ?auto_99266 ) ) ( not ( = ?auto_99263 ?auto_99266 ) ) ( not ( = ?auto_99264 ?auto_99266 ) ) ( not ( = ?auto_99265 ?auto_99266 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_99265 ?auto_99266 )
      ( MAKE-7PILE ?auto_99259 ?auto_99260 ?auto_99261 ?auto_99262 ?auto_99263 ?auto_99264 ?auto_99265 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99267 - BLOCK
      ?auto_99268 - BLOCK
      ?auto_99269 - BLOCK
      ?auto_99270 - BLOCK
      ?auto_99271 - BLOCK
      ?auto_99272 - BLOCK
      ?auto_99273 - BLOCK
    )
    :vars
    (
      ?auto_99274 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99267 ) ( ON ?auto_99268 ?auto_99267 ) ( ON ?auto_99269 ?auto_99268 ) ( ON ?auto_99270 ?auto_99269 ) ( ON ?auto_99271 ?auto_99270 ) ( not ( = ?auto_99267 ?auto_99268 ) ) ( not ( = ?auto_99267 ?auto_99269 ) ) ( not ( = ?auto_99267 ?auto_99270 ) ) ( not ( = ?auto_99267 ?auto_99271 ) ) ( not ( = ?auto_99267 ?auto_99272 ) ) ( not ( = ?auto_99267 ?auto_99273 ) ) ( not ( = ?auto_99268 ?auto_99269 ) ) ( not ( = ?auto_99268 ?auto_99270 ) ) ( not ( = ?auto_99268 ?auto_99271 ) ) ( not ( = ?auto_99268 ?auto_99272 ) ) ( not ( = ?auto_99268 ?auto_99273 ) ) ( not ( = ?auto_99269 ?auto_99270 ) ) ( not ( = ?auto_99269 ?auto_99271 ) ) ( not ( = ?auto_99269 ?auto_99272 ) ) ( not ( = ?auto_99269 ?auto_99273 ) ) ( not ( = ?auto_99270 ?auto_99271 ) ) ( not ( = ?auto_99270 ?auto_99272 ) ) ( not ( = ?auto_99270 ?auto_99273 ) ) ( not ( = ?auto_99271 ?auto_99272 ) ) ( not ( = ?auto_99271 ?auto_99273 ) ) ( not ( = ?auto_99272 ?auto_99273 ) ) ( ON ?auto_99273 ?auto_99274 ) ( CLEAR ?auto_99273 ) ( not ( = ?auto_99267 ?auto_99274 ) ) ( not ( = ?auto_99268 ?auto_99274 ) ) ( not ( = ?auto_99269 ?auto_99274 ) ) ( not ( = ?auto_99270 ?auto_99274 ) ) ( not ( = ?auto_99271 ?auto_99274 ) ) ( not ( = ?auto_99272 ?auto_99274 ) ) ( not ( = ?auto_99273 ?auto_99274 ) ) ( HOLDING ?auto_99272 ) ( CLEAR ?auto_99271 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_99267 ?auto_99268 ?auto_99269 ?auto_99270 ?auto_99271 ?auto_99272 )
      ( MAKE-7PILE ?auto_99267 ?auto_99268 ?auto_99269 ?auto_99270 ?auto_99271 ?auto_99272 ?auto_99273 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99275 - BLOCK
      ?auto_99276 - BLOCK
      ?auto_99277 - BLOCK
      ?auto_99278 - BLOCK
      ?auto_99279 - BLOCK
      ?auto_99280 - BLOCK
      ?auto_99281 - BLOCK
    )
    :vars
    (
      ?auto_99282 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99275 ) ( ON ?auto_99276 ?auto_99275 ) ( ON ?auto_99277 ?auto_99276 ) ( ON ?auto_99278 ?auto_99277 ) ( ON ?auto_99279 ?auto_99278 ) ( not ( = ?auto_99275 ?auto_99276 ) ) ( not ( = ?auto_99275 ?auto_99277 ) ) ( not ( = ?auto_99275 ?auto_99278 ) ) ( not ( = ?auto_99275 ?auto_99279 ) ) ( not ( = ?auto_99275 ?auto_99280 ) ) ( not ( = ?auto_99275 ?auto_99281 ) ) ( not ( = ?auto_99276 ?auto_99277 ) ) ( not ( = ?auto_99276 ?auto_99278 ) ) ( not ( = ?auto_99276 ?auto_99279 ) ) ( not ( = ?auto_99276 ?auto_99280 ) ) ( not ( = ?auto_99276 ?auto_99281 ) ) ( not ( = ?auto_99277 ?auto_99278 ) ) ( not ( = ?auto_99277 ?auto_99279 ) ) ( not ( = ?auto_99277 ?auto_99280 ) ) ( not ( = ?auto_99277 ?auto_99281 ) ) ( not ( = ?auto_99278 ?auto_99279 ) ) ( not ( = ?auto_99278 ?auto_99280 ) ) ( not ( = ?auto_99278 ?auto_99281 ) ) ( not ( = ?auto_99279 ?auto_99280 ) ) ( not ( = ?auto_99279 ?auto_99281 ) ) ( not ( = ?auto_99280 ?auto_99281 ) ) ( ON ?auto_99281 ?auto_99282 ) ( not ( = ?auto_99275 ?auto_99282 ) ) ( not ( = ?auto_99276 ?auto_99282 ) ) ( not ( = ?auto_99277 ?auto_99282 ) ) ( not ( = ?auto_99278 ?auto_99282 ) ) ( not ( = ?auto_99279 ?auto_99282 ) ) ( not ( = ?auto_99280 ?auto_99282 ) ) ( not ( = ?auto_99281 ?auto_99282 ) ) ( CLEAR ?auto_99279 ) ( ON ?auto_99280 ?auto_99281 ) ( CLEAR ?auto_99280 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_99282 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_99282 ?auto_99281 )
      ( MAKE-7PILE ?auto_99275 ?auto_99276 ?auto_99277 ?auto_99278 ?auto_99279 ?auto_99280 ?auto_99281 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99283 - BLOCK
      ?auto_99284 - BLOCK
      ?auto_99285 - BLOCK
      ?auto_99286 - BLOCK
      ?auto_99287 - BLOCK
      ?auto_99288 - BLOCK
      ?auto_99289 - BLOCK
    )
    :vars
    (
      ?auto_99290 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99283 ) ( ON ?auto_99284 ?auto_99283 ) ( ON ?auto_99285 ?auto_99284 ) ( ON ?auto_99286 ?auto_99285 ) ( not ( = ?auto_99283 ?auto_99284 ) ) ( not ( = ?auto_99283 ?auto_99285 ) ) ( not ( = ?auto_99283 ?auto_99286 ) ) ( not ( = ?auto_99283 ?auto_99287 ) ) ( not ( = ?auto_99283 ?auto_99288 ) ) ( not ( = ?auto_99283 ?auto_99289 ) ) ( not ( = ?auto_99284 ?auto_99285 ) ) ( not ( = ?auto_99284 ?auto_99286 ) ) ( not ( = ?auto_99284 ?auto_99287 ) ) ( not ( = ?auto_99284 ?auto_99288 ) ) ( not ( = ?auto_99284 ?auto_99289 ) ) ( not ( = ?auto_99285 ?auto_99286 ) ) ( not ( = ?auto_99285 ?auto_99287 ) ) ( not ( = ?auto_99285 ?auto_99288 ) ) ( not ( = ?auto_99285 ?auto_99289 ) ) ( not ( = ?auto_99286 ?auto_99287 ) ) ( not ( = ?auto_99286 ?auto_99288 ) ) ( not ( = ?auto_99286 ?auto_99289 ) ) ( not ( = ?auto_99287 ?auto_99288 ) ) ( not ( = ?auto_99287 ?auto_99289 ) ) ( not ( = ?auto_99288 ?auto_99289 ) ) ( ON ?auto_99289 ?auto_99290 ) ( not ( = ?auto_99283 ?auto_99290 ) ) ( not ( = ?auto_99284 ?auto_99290 ) ) ( not ( = ?auto_99285 ?auto_99290 ) ) ( not ( = ?auto_99286 ?auto_99290 ) ) ( not ( = ?auto_99287 ?auto_99290 ) ) ( not ( = ?auto_99288 ?auto_99290 ) ) ( not ( = ?auto_99289 ?auto_99290 ) ) ( ON ?auto_99288 ?auto_99289 ) ( CLEAR ?auto_99288 ) ( ON-TABLE ?auto_99290 ) ( HOLDING ?auto_99287 ) ( CLEAR ?auto_99286 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99283 ?auto_99284 ?auto_99285 ?auto_99286 ?auto_99287 )
      ( MAKE-7PILE ?auto_99283 ?auto_99284 ?auto_99285 ?auto_99286 ?auto_99287 ?auto_99288 ?auto_99289 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99291 - BLOCK
      ?auto_99292 - BLOCK
      ?auto_99293 - BLOCK
      ?auto_99294 - BLOCK
      ?auto_99295 - BLOCK
      ?auto_99296 - BLOCK
      ?auto_99297 - BLOCK
    )
    :vars
    (
      ?auto_99298 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99291 ) ( ON ?auto_99292 ?auto_99291 ) ( ON ?auto_99293 ?auto_99292 ) ( ON ?auto_99294 ?auto_99293 ) ( not ( = ?auto_99291 ?auto_99292 ) ) ( not ( = ?auto_99291 ?auto_99293 ) ) ( not ( = ?auto_99291 ?auto_99294 ) ) ( not ( = ?auto_99291 ?auto_99295 ) ) ( not ( = ?auto_99291 ?auto_99296 ) ) ( not ( = ?auto_99291 ?auto_99297 ) ) ( not ( = ?auto_99292 ?auto_99293 ) ) ( not ( = ?auto_99292 ?auto_99294 ) ) ( not ( = ?auto_99292 ?auto_99295 ) ) ( not ( = ?auto_99292 ?auto_99296 ) ) ( not ( = ?auto_99292 ?auto_99297 ) ) ( not ( = ?auto_99293 ?auto_99294 ) ) ( not ( = ?auto_99293 ?auto_99295 ) ) ( not ( = ?auto_99293 ?auto_99296 ) ) ( not ( = ?auto_99293 ?auto_99297 ) ) ( not ( = ?auto_99294 ?auto_99295 ) ) ( not ( = ?auto_99294 ?auto_99296 ) ) ( not ( = ?auto_99294 ?auto_99297 ) ) ( not ( = ?auto_99295 ?auto_99296 ) ) ( not ( = ?auto_99295 ?auto_99297 ) ) ( not ( = ?auto_99296 ?auto_99297 ) ) ( ON ?auto_99297 ?auto_99298 ) ( not ( = ?auto_99291 ?auto_99298 ) ) ( not ( = ?auto_99292 ?auto_99298 ) ) ( not ( = ?auto_99293 ?auto_99298 ) ) ( not ( = ?auto_99294 ?auto_99298 ) ) ( not ( = ?auto_99295 ?auto_99298 ) ) ( not ( = ?auto_99296 ?auto_99298 ) ) ( not ( = ?auto_99297 ?auto_99298 ) ) ( ON ?auto_99296 ?auto_99297 ) ( ON-TABLE ?auto_99298 ) ( CLEAR ?auto_99294 ) ( ON ?auto_99295 ?auto_99296 ) ( CLEAR ?auto_99295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_99298 ?auto_99297 ?auto_99296 )
      ( MAKE-7PILE ?auto_99291 ?auto_99292 ?auto_99293 ?auto_99294 ?auto_99295 ?auto_99296 ?auto_99297 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99299 - BLOCK
      ?auto_99300 - BLOCK
      ?auto_99301 - BLOCK
      ?auto_99302 - BLOCK
      ?auto_99303 - BLOCK
      ?auto_99304 - BLOCK
      ?auto_99305 - BLOCK
    )
    :vars
    (
      ?auto_99306 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99299 ) ( ON ?auto_99300 ?auto_99299 ) ( ON ?auto_99301 ?auto_99300 ) ( not ( = ?auto_99299 ?auto_99300 ) ) ( not ( = ?auto_99299 ?auto_99301 ) ) ( not ( = ?auto_99299 ?auto_99302 ) ) ( not ( = ?auto_99299 ?auto_99303 ) ) ( not ( = ?auto_99299 ?auto_99304 ) ) ( not ( = ?auto_99299 ?auto_99305 ) ) ( not ( = ?auto_99300 ?auto_99301 ) ) ( not ( = ?auto_99300 ?auto_99302 ) ) ( not ( = ?auto_99300 ?auto_99303 ) ) ( not ( = ?auto_99300 ?auto_99304 ) ) ( not ( = ?auto_99300 ?auto_99305 ) ) ( not ( = ?auto_99301 ?auto_99302 ) ) ( not ( = ?auto_99301 ?auto_99303 ) ) ( not ( = ?auto_99301 ?auto_99304 ) ) ( not ( = ?auto_99301 ?auto_99305 ) ) ( not ( = ?auto_99302 ?auto_99303 ) ) ( not ( = ?auto_99302 ?auto_99304 ) ) ( not ( = ?auto_99302 ?auto_99305 ) ) ( not ( = ?auto_99303 ?auto_99304 ) ) ( not ( = ?auto_99303 ?auto_99305 ) ) ( not ( = ?auto_99304 ?auto_99305 ) ) ( ON ?auto_99305 ?auto_99306 ) ( not ( = ?auto_99299 ?auto_99306 ) ) ( not ( = ?auto_99300 ?auto_99306 ) ) ( not ( = ?auto_99301 ?auto_99306 ) ) ( not ( = ?auto_99302 ?auto_99306 ) ) ( not ( = ?auto_99303 ?auto_99306 ) ) ( not ( = ?auto_99304 ?auto_99306 ) ) ( not ( = ?auto_99305 ?auto_99306 ) ) ( ON ?auto_99304 ?auto_99305 ) ( ON-TABLE ?auto_99306 ) ( ON ?auto_99303 ?auto_99304 ) ( CLEAR ?auto_99303 ) ( HOLDING ?auto_99302 ) ( CLEAR ?auto_99301 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_99299 ?auto_99300 ?auto_99301 ?auto_99302 )
      ( MAKE-7PILE ?auto_99299 ?auto_99300 ?auto_99301 ?auto_99302 ?auto_99303 ?auto_99304 ?auto_99305 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99307 - BLOCK
      ?auto_99308 - BLOCK
      ?auto_99309 - BLOCK
      ?auto_99310 - BLOCK
      ?auto_99311 - BLOCK
      ?auto_99312 - BLOCK
      ?auto_99313 - BLOCK
    )
    :vars
    (
      ?auto_99314 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99307 ) ( ON ?auto_99308 ?auto_99307 ) ( ON ?auto_99309 ?auto_99308 ) ( not ( = ?auto_99307 ?auto_99308 ) ) ( not ( = ?auto_99307 ?auto_99309 ) ) ( not ( = ?auto_99307 ?auto_99310 ) ) ( not ( = ?auto_99307 ?auto_99311 ) ) ( not ( = ?auto_99307 ?auto_99312 ) ) ( not ( = ?auto_99307 ?auto_99313 ) ) ( not ( = ?auto_99308 ?auto_99309 ) ) ( not ( = ?auto_99308 ?auto_99310 ) ) ( not ( = ?auto_99308 ?auto_99311 ) ) ( not ( = ?auto_99308 ?auto_99312 ) ) ( not ( = ?auto_99308 ?auto_99313 ) ) ( not ( = ?auto_99309 ?auto_99310 ) ) ( not ( = ?auto_99309 ?auto_99311 ) ) ( not ( = ?auto_99309 ?auto_99312 ) ) ( not ( = ?auto_99309 ?auto_99313 ) ) ( not ( = ?auto_99310 ?auto_99311 ) ) ( not ( = ?auto_99310 ?auto_99312 ) ) ( not ( = ?auto_99310 ?auto_99313 ) ) ( not ( = ?auto_99311 ?auto_99312 ) ) ( not ( = ?auto_99311 ?auto_99313 ) ) ( not ( = ?auto_99312 ?auto_99313 ) ) ( ON ?auto_99313 ?auto_99314 ) ( not ( = ?auto_99307 ?auto_99314 ) ) ( not ( = ?auto_99308 ?auto_99314 ) ) ( not ( = ?auto_99309 ?auto_99314 ) ) ( not ( = ?auto_99310 ?auto_99314 ) ) ( not ( = ?auto_99311 ?auto_99314 ) ) ( not ( = ?auto_99312 ?auto_99314 ) ) ( not ( = ?auto_99313 ?auto_99314 ) ) ( ON ?auto_99312 ?auto_99313 ) ( ON-TABLE ?auto_99314 ) ( ON ?auto_99311 ?auto_99312 ) ( CLEAR ?auto_99309 ) ( ON ?auto_99310 ?auto_99311 ) ( CLEAR ?auto_99310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_99314 ?auto_99313 ?auto_99312 ?auto_99311 )
      ( MAKE-7PILE ?auto_99307 ?auto_99308 ?auto_99309 ?auto_99310 ?auto_99311 ?auto_99312 ?auto_99313 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99315 - BLOCK
      ?auto_99316 - BLOCK
      ?auto_99317 - BLOCK
      ?auto_99318 - BLOCK
      ?auto_99319 - BLOCK
      ?auto_99320 - BLOCK
      ?auto_99321 - BLOCK
    )
    :vars
    (
      ?auto_99322 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99315 ) ( ON ?auto_99316 ?auto_99315 ) ( not ( = ?auto_99315 ?auto_99316 ) ) ( not ( = ?auto_99315 ?auto_99317 ) ) ( not ( = ?auto_99315 ?auto_99318 ) ) ( not ( = ?auto_99315 ?auto_99319 ) ) ( not ( = ?auto_99315 ?auto_99320 ) ) ( not ( = ?auto_99315 ?auto_99321 ) ) ( not ( = ?auto_99316 ?auto_99317 ) ) ( not ( = ?auto_99316 ?auto_99318 ) ) ( not ( = ?auto_99316 ?auto_99319 ) ) ( not ( = ?auto_99316 ?auto_99320 ) ) ( not ( = ?auto_99316 ?auto_99321 ) ) ( not ( = ?auto_99317 ?auto_99318 ) ) ( not ( = ?auto_99317 ?auto_99319 ) ) ( not ( = ?auto_99317 ?auto_99320 ) ) ( not ( = ?auto_99317 ?auto_99321 ) ) ( not ( = ?auto_99318 ?auto_99319 ) ) ( not ( = ?auto_99318 ?auto_99320 ) ) ( not ( = ?auto_99318 ?auto_99321 ) ) ( not ( = ?auto_99319 ?auto_99320 ) ) ( not ( = ?auto_99319 ?auto_99321 ) ) ( not ( = ?auto_99320 ?auto_99321 ) ) ( ON ?auto_99321 ?auto_99322 ) ( not ( = ?auto_99315 ?auto_99322 ) ) ( not ( = ?auto_99316 ?auto_99322 ) ) ( not ( = ?auto_99317 ?auto_99322 ) ) ( not ( = ?auto_99318 ?auto_99322 ) ) ( not ( = ?auto_99319 ?auto_99322 ) ) ( not ( = ?auto_99320 ?auto_99322 ) ) ( not ( = ?auto_99321 ?auto_99322 ) ) ( ON ?auto_99320 ?auto_99321 ) ( ON-TABLE ?auto_99322 ) ( ON ?auto_99319 ?auto_99320 ) ( ON ?auto_99318 ?auto_99319 ) ( CLEAR ?auto_99318 ) ( HOLDING ?auto_99317 ) ( CLEAR ?auto_99316 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_99315 ?auto_99316 ?auto_99317 )
      ( MAKE-7PILE ?auto_99315 ?auto_99316 ?auto_99317 ?auto_99318 ?auto_99319 ?auto_99320 ?auto_99321 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99323 - BLOCK
      ?auto_99324 - BLOCK
      ?auto_99325 - BLOCK
      ?auto_99326 - BLOCK
      ?auto_99327 - BLOCK
      ?auto_99328 - BLOCK
      ?auto_99329 - BLOCK
    )
    :vars
    (
      ?auto_99330 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99323 ) ( ON ?auto_99324 ?auto_99323 ) ( not ( = ?auto_99323 ?auto_99324 ) ) ( not ( = ?auto_99323 ?auto_99325 ) ) ( not ( = ?auto_99323 ?auto_99326 ) ) ( not ( = ?auto_99323 ?auto_99327 ) ) ( not ( = ?auto_99323 ?auto_99328 ) ) ( not ( = ?auto_99323 ?auto_99329 ) ) ( not ( = ?auto_99324 ?auto_99325 ) ) ( not ( = ?auto_99324 ?auto_99326 ) ) ( not ( = ?auto_99324 ?auto_99327 ) ) ( not ( = ?auto_99324 ?auto_99328 ) ) ( not ( = ?auto_99324 ?auto_99329 ) ) ( not ( = ?auto_99325 ?auto_99326 ) ) ( not ( = ?auto_99325 ?auto_99327 ) ) ( not ( = ?auto_99325 ?auto_99328 ) ) ( not ( = ?auto_99325 ?auto_99329 ) ) ( not ( = ?auto_99326 ?auto_99327 ) ) ( not ( = ?auto_99326 ?auto_99328 ) ) ( not ( = ?auto_99326 ?auto_99329 ) ) ( not ( = ?auto_99327 ?auto_99328 ) ) ( not ( = ?auto_99327 ?auto_99329 ) ) ( not ( = ?auto_99328 ?auto_99329 ) ) ( ON ?auto_99329 ?auto_99330 ) ( not ( = ?auto_99323 ?auto_99330 ) ) ( not ( = ?auto_99324 ?auto_99330 ) ) ( not ( = ?auto_99325 ?auto_99330 ) ) ( not ( = ?auto_99326 ?auto_99330 ) ) ( not ( = ?auto_99327 ?auto_99330 ) ) ( not ( = ?auto_99328 ?auto_99330 ) ) ( not ( = ?auto_99329 ?auto_99330 ) ) ( ON ?auto_99328 ?auto_99329 ) ( ON-TABLE ?auto_99330 ) ( ON ?auto_99327 ?auto_99328 ) ( ON ?auto_99326 ?auto_99327 ) ( CLEAR ?auto_99324 ) ( ON ?auto_99325 ?auto_99326 ) ( CLEAR ?auto_99325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99330 ?auto_99329 ?auto_99328 ?auto_99327 ?auto_99326 )
      ( MAKE-7PILE ?auto_99323 ?auto_99324 ?auto_99325 ?auto_99326 ?auto_99327 ?auto_99328 ?auto_99329 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99331 - BLOCK
      ?auto_99332 - BLOCK
      ?auto_99333 - BLOCK
      ?auto_99334 - BLOCK
      ?auto_99335 - BLOCK
      ?auto_99336 - BLOCK
      ?auto_99337 - BLOCK
    )
    :vars
    (
      ?auto_99338 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99331 ) ( not ( = ?auto_99331 ?auto_99332 ) ) ( not ( = ?auto_99331 ?auto_99333 ) ) ( not ( = ?auto_99331 ?auto_99334 ) ) ( not ( = ?auto_99331 ?auto_99335 ) ) ( not ( = ?auto_99331 ?auto_99336 ) ) ( not ( = ?auto_99331 ?auto_99337 ) ) ( not ( = ?auto_99332 ?auto_99333 ) ) ( not ( = ?auto_99332 ?auto_99334 ) ) ( not ( = ?auto_99332 ?auto_99335 ) ) ( not ( = ?auto_99332 ?auto_99336 ) ) ( not ( = ?auto_99332 ?auto_99337 ) ) ( not ( = ?auto_99333 ?auto_99334 ) ) ( not ( = ?auto_99333 ?auto_99335 ) ) ( not ( = ?auto_99333 ?auto_99336 ) ) ( not ( = ?auto_99333 ?auto_99337 ) ) ( not ( = ?auto_99334 ?auto_99335 ) ) ( not ( = ?auto_99334 ?auto_99336 ) ) ( not ( = ?auto_99334 ?auto_99337 ) ) ( not ( = ?auto_99335 ?auto_99336 ) ) ( not ( = ?auto_99335 ?auto_99337 ) ) ( not ( = ?auto_99336 ?auto_99337 ) ) ( ON ?auto_99337 ?auto_99338 ) ( not ( = ?auto_99331 ?auto_99338 ) ) ( not ( = ?auto_99332 ?auto_99338 ) ) ( not ( = ?auto_99333 ?auto_99338 ) ) ( not ( = ?auto_99334 ?auto_99338 ) ) ( not ( = ?auto_99335 ?auto_99338 ) ) ( not ( = ?auto_99336 ?auto_99338 ) ) ( not ( = ?auto_99337 ?auto_99338 ) ) ( ON ?auto_99336 ?auto_99337 ) ( ON-TABLE ?auto_99338 ) ( ON ?auto_99335 ?auto_99336 ) ( ON ?auto_99334 ?auto_99335 ) ( ON ?auto_99333 ?auto_99334 ) ( CLEAR ?auto_99333 ) ( HOLDING ?auto_99332 ) ( CLEAR ?auto_99331 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_99331 ?auto_99332 )
      ( MAKE-7PILE ?auto_99331 ?auto_99332 ?auto_99333 ?auto_99334 ?auto_99335 ?auto_99336 ?auto_99337 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99339 - BLOCK
      ?auto_99340 - BLOCK
      ?auto_99341 - BLOCK
      ?auto_99342 - BLOCK
      ?auto_99343 - BLOCK
      ?auto_99344 - BLOCK
      ?auto_99345 - BLOCK
    )
    :vars
    (
      ?auto_99346 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99339 ) ( not ( = ?auto_99339 ?auto_99340 ) ) ( not ( = ?auto_99339 ?auto_99341 ) ) ( not ( = ?auto_99339 ?auto_99342 ) ) ( not ( = ?auto_99339 ?auto_99343 ) ) ( not ( = ?auto_99339 ?auto_99344 ) ) ( not ( = ?auto_99339 ?auto_99345 ) ) ( not ( = ?auto_99340 ?auto_99341 ) ) ( not ( = ?auto_99340 ?auto_99342 ) ) ( not ( = ?auto_99340 ?auto_99343 ) ) ( not ( = ?auto_99340 ?auto_99344 ) ) ( not ( = ?auto_99340 ?auto_99345 ) ) ( not ( = ?auto_99341 ?auto_99342 ) ) ( not ( = ?auto_99341 ?auto_99343 ) ) ( not ( = ?auto_99341 ?auto_99344 ) ) ( not ( = ?auto_99341 ?auto_99345 ) ) ( not ( = ?auto_99342 ?auto_99343 ) ) ( not ( = ?auto_99342 ?auto_99344 ) ) ( not ( = ?auto_99342 ?auto_99345 ) ) ( not ( = ?auto_99343 ?auto_99344 ) ) ( not ( = ?auto_99343 ?auto_99345 ) ) ( not ( = ?auto_99344 ?auto_99345 ) ) ( ON ?auto_99345 ?auto_99346 ) ( not ( = ?auto_99339 ?auto_99346 ) ) ( not ( = ?auto_99340 ?auto_99346 ) ) ( not ( = ?auto_99341 ?auto_99346 ) ) ( not ( = ?auto_99342 ?auto_99346 ) ) ( not ( = ?auto_99343 ?auto_99346 ) ) ( not ( = ?auto_99344 ?auto_99346 ) ) ( not ( = ?auto_99345 ?auto_99346 ) ) ( ON ?auto_99344 ?auto_99345 ) ( ON-TABLE ?auto_99346 ) ( ON ?auto_99343 ?auto_99344 ) ( ON ?auto_99342 ?auto_99343 ) ( ON ?auto_99341 ?auto_99342 ) ( CLEAR ?auto_99339 ) ( ON ?auto_99340 ?auto_99341 ) ( CLEAR ?auto_99340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_99346 ?auto_99345 ?auto_99344 ?auto_99343 ?auto_99342 ?auto_99341 )
      ( MAKE-7PILE ?auto_99339 ?auto_99340 ?auto_99341 ?auto_99342 ?auto_99343 ?auto_99344 ?auto_99345 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99347 - BLOCK
      ?auto_99348 - BLOCK
      ?auto_99349 - BLOCK
      ?auto_99350 - BLOCK
      ?auto_99351 - BLOCK
      ?auto_99352 - BLOCK
      ?auto_99353 - BLOCK
    )
    :vars
    (
      ?auto_99354 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99347 ?auto_99348 ) ) ( not ( = ?auto_99347 ?auto_99349 ) ) ( not ( = ?auto_99347 ?auto_99350 ) ) ( not ( = ?auto_99347 ?auto_99351 ) ) ( not ( = ?auto_99347 ?auto_99352 ) ) ( not ( = ?auto_99347 ?auto_99353 ) ) ( not ( = ?auto_99348 ?auto_99349 ) ) ( not ( = ?auto_99348 ?auto_99350 ) ) ( not ( = ?auto_99348 ?auto_99351 ) ) ( not ( = ?auto_99348 ?auto_99352 ) ) ( not ( = ?auto_99348 ?auto_99353 ) ) ( not ( = ?auto_99349 ?auto_99350 ) ) ( not ( = ?auto_99349 ?auto_99351 ) ) ( not ( = ?auto_99349 ?auto_99352 ) ) ( not ( = ?auto_99349 ?auto_99353 ) ) ( not ( = ?auto_99350 ?auto_99351 ) ) ( not ( = ?auto_99350 ?auto_99352 ) ) ( not ( = ?auto_99350 ?auto_99353 ) ) ( not ( = ?auto_99351 ?auto_99352 ) ) ( not ( = ?auto_99351 ?auto_99353 ) ) ( not ( = ?auto_99352 ?auto_99353 ) ) ( ON ?auto_99353 ?auto_99354 ) ( not ( = ?auto_99347 ?auto_99354 ) ) ( not ( = ?auto_99348 ?auto_99354 ) ) ( not ( = ?auto_99349 ?auto_99354 ) ) ( not ( = ?auto_99350 ?auto_99354 ) ) ( not ( = ?auto_99351 ?auto_99354 ) ) ( not ( = ?auto_99352 ?auto_99354 ) ) ( not ( = ?auto_99353 ?auto_99354 ) ) ( ON ?auto_99352 ?auto_99353 ) ( ON-TABLE ?auto_99354 ) ( ON ?auto_99351 ?auto_99352 ) ( ON ?auto_99350 ?auto_99351 ) ( ON ?auto_99349 ?auto_99350 ) ( ON ?auto_99348 ?auto_99349 ) ( CLEAR ?auto_99348 ) ( HOLDING ?auto_99347 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_99347 )
      ( MAKE-7PILE ?auto_99347 ?auto_99348 ?auto_99349 ?auto_99350 ?auto_99351 ?auto_99352 ?auto_99353 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99355 - BLOCK
      ?auto_99356 - BLOCK
      ?auto_99357 - BLOCK
      ?auto_99358 - BLOCK
      ?auto_99359 - BLOCK
      ?auto_99360 - BLOCK
      ?auto_99361 - BLOCK
    )
    :vars
    (
      ?auto_99362 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99355 ?auto_99356 ) ) ( not ( = ?auto_99355 ?auto_99357 ) ) ( not ( = ?auto_99355 ?auto_99358 ) ) ( not ( = ?auto_99355 ?auto_99359 ) ) ( not ( = ?auto_99355 ?auto_99360 ) ) ( not ( = ?auto_99355 ?auto_99361 ) ) ( not ( = ?auto_99356 ?auto_99357 ) ) ( not ( = ?auto_99356 ?auto_99358 ) ) ( not ( = ?auto_99356 ?auto_99359 ) ) ( not ( = ?auto_99356 ?auto_99360 ) ) ( not ( = ?auto_99356 ?auto_99361 ) ) ( not ( = ?auto_99357 ?auto_99358 ) ) ( not ( = ?auto_99357 ?auto_99359 ) ) ( not ( = ?auto_99357 ?auto_99360 ) ) ( not ( = ?auto_99357 ?auto_99361 ) ) ( not ( = ?auto_99358 ?auto_99359 ) ) ( not ( = ?auto_99358 ?auto_99360 ) ) ( not ( = ?auto_99358 ?auto_99361 ) ) ( not ( = ?auto_99359 ?auto_99360 ) ) ( not ( = ?auto_99359 ?auto_99361 ) ) ( not ( = ?auto_99360 ?auto_99361 ) ) ( ON ?auto_99361 ?auto_99362 ) ( not ( = ?auto_99355 ?auto_99362 ) ) ( not ( = ?auto_99356 ?auto_99362 ) ) ( not ( = ?auto_99357 ?auto_99362 ) ) ( not ( = ?auto_99358 ?auto_99362 ) ) ( not ( = ?auto_99359 ?auto_99362 ) ) ( not ( = ?auto_99360 ?auto_99362 ) ) ( not ( = ?auto_99361 ?auto_99362 ) ) ( ON ?auto_99360 ?auto_99361 ) ( ON-TABLE ?auto_99362 ) ( ON ?auto_99359 ?auto_99360 ) ( ON ?auto_99358 ?auto_99359 ) ( ON ?auto_99357 ?auto_99358 ) ( ON ?auto_99356 ?auto_99357 ) ( ON ?auto_99355 ?auto_99356 ) ( CLEAR ?auto_99355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_99362 ?auto_99361 ?auto_99360 ?auto_99359 ?auto_99358 ?auto_99357 ?auto_99356 )
      ( MAKE-7PILE ?auto_99355 ?auto_99356 ?auto_99357 ?auto_99358 ?auto_99359 ?auto_99360 ?auto_99361 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99369 - BLOCK
      ?auto_99370 - BLOCK
      ?auto_99371 - BLOCK
      ?auto_99372 - BLOCK
      ?auto_99373 - BLOCK
      ?auto_99374 - BLOCK
    )
    :vars
    (
      ?auto_99375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99375 ?auto_99374 ) ( CLEAR ?auto_99375 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_99369 ) ( ON ?auto_99370 ?auto_99369 ) ( ON ?auto_99371 ?auto_99370 ) ( ON ?auto_99372 ?auto_99371 ) ( ON ?auto_99373 ?auto_99372 ) ( ON ?auto_99374 ?auto_99373 ) ( not ( = ?auto_99369 ?auto_99370 ) ) ( not ( = ?auto_99369 ?auto_99371 ) ) ( not ( = ?auto_99369 ?auto_99372 ) ) ( not ( = ?auto_99369 ?auto_99373 ) ) ( not ( = ?auto_99369 ?auto_99374 ) ) ( not ( = ?auto_99369 ?auto_99375 ) ) ( not ( = ?auto_99370 ?auto_99371 ) ) ( not ( = ?auto_99370 ?auto_99372 ) ) ( not ( = ?auto_99370 ?auto_99373 ) ) ( not ( = ?auto_99370 ?auto_99374 ) ) ( not ( = ?auto_99370 ?auto_99375 ) ) ( not ( = ?auto_99371 ?auto_99372 ) ) ( not ( = ?auto_99371 ?auto_99373 ) ) ( not ( = ?auto_99371 ?auto_99374 ) ) ( not ( = ?auto_99371 ?auto_99375 ) ) ( not ( = ?auto_99372 ?auto_99373 ) ) ( not ( = ?auto_99372 ?auto_99374 ) ) ( not ( = ?auto_99372 ?auto_99375 ) ) ( not ( = ?auto_99373 ?auto_99374 ) ) ( not ( = ?auto_99373 ?auto_99375 ) ) ( not ( = ?auto_99374 ?auto_99375 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_99375 ?auto_99374 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99391 - BLOCK
      ?auto_99392 - BLOCK
      ?auto_99393 - BLOCK
      ?auto_99394 - BLOCK
      ?auto_99395 - BLOCK
      ?auto_99396 - BLOCK
    )
    :vars
    (
      ?auto_99397 - BLOCK
      ?auto_99398 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99391 ) ( ON ?auto_99392 ?auto_99391 ) ( ON ?auto_99393 ?auto_99392 ) ( ON ?auto_99394 ?auto_99393 ) ( ON ?auto_99395 ?auto_99394 ) ( not ( = ?auto_99391 ?auto_99392 ) ) ( not ( = ?auto_99391 ?auto_99393 ) ) ( not ( = ?auto_99391 ?auto_99394 ) ) ( not ( = ?auto_99391 ?auto_99395 ) ) ( not ( = ?auto_99391 ?auto_99396 ) ) ( not ( = ?auto_99391 ?auto_99397 ) ) ( not ( = ?auto_99392 ?auto_99393 ) ) ( not ( = ?auto_99392 ?auto_99394 ) ) ( not ( = ?auto_99392 ?auto_99395 ) ) ( not ( = ?auto_99392 ?auto_99396 ) ) ( not ( = ?auto_99392 ?auto_99397 ) ) ( not ( = ?auto_99393 ?auto_99394 ) ) ( not ( = ?auto_99393 ?auto_99395 ) ) ( not ( = ?auto_99393 ?auto_99396 ) ) ( not ( = ?auto_99393 ?auto_99397 ) ) ( not ( = ?auto_99394 ?auto_99395 ) ) ( not ( = ?auto_99394 ?auto_99396 ) ) ( not ( = ?auto_99394 ?auto_99397 ) ) ( not ( = ?auto_99395 ?auto_99396 ) ) ( not ( = ?auto_99395 ?auto_99397 ) ) ( not ( = ?auto_99396 ?auto_99397 ) ) ( ON ?auto_99397 ?auto_99398 ) ( CLEAR ?auto_99397 ) ( not ( = ?auto_99391 ?auto_99398 ) ) ( not ( = ?auto_99392 ?auto_99398 ) ) ( not ( = ?auto_99393 ?auto_99398 ) ) ( not ( = ?auto_99394 ?auto_99398 ) ) ( not ( = ?auto_99395 ?auto_99398 ) ) ( not ( = ?auto_99396 ?auto_99398 ) ) ( not ( = ?auto_99397 ?auto_99398 ) ) ( HOLDING ?auto_99396 ) ( CLEAR ?auto_99395 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_99391 ?auto_99392 ?auto_99393 ?auto_99394 ?auto_99395 ?auto_99396 ?auto_99397 )
      ( MAKE-6PILE ?auto_99391 ?auto_99392 ?auto_99393 ?auto_99394 ?auto_99395 ?auto_99396 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99399 - BLOCK
      ?auto_99400 - BLOCK
      ?auto_99401 - BLOCK
      ?auto_99402 - BLOCK
      ?auto_99403 - BLOCK
      ?auto_99404 - BLOCK
    )
    :vars
    (
      ?auto_99406 - BLOCK
      ?auto_99405 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99399 ) ( ON ?auto_99400 ?auto_99399 ) ( ON ?auto_99401 ?auto_99400 ) ( ON ?auto_99402 ?auto_99401 ) ( ON ?auto_99403 ?auto_99402 ) ( not ( = ?auto_99399 ?auto_99400 ) ) ( not ( = ?auto_99399 ?auto_99401 ) ) ( not ( = ?auto_99399 ?auto_99402 ) ) ( not ( = ?auto_99399 ?auto_99403 ) ) ( not ( = ?auto_99399 ?auto_99404 ) ) ( not ( = ?auto_99399 ?auto_99406 ) ) ( not ( = ?auto_99400 ?auto_99401 ) ) ( not ( = ?auto_99400 ?auto_99402 ) ) ( not ( = ?auto_99400 ?auto_99403 ) ) ( not ( = ?auto_99400 ?auto_99404 ) ) ( not ( = ?auto_99400 ?auto_99406 ) ) ( not ( = ?auto_99401 ?auto_99402 ) ) ( not ( = ?auto_99401 ?auto_99403 ) ) ( not ( = ?auto_99401 ?auto_99404 ) ) ( not ( = ?auto_99401 ?auto_99406 ) ) ( not ( = ?auto_99402 ?auto_99403 ) ) ( not ( = ?auto_99402 ?auto_99404 ) ) ( not ( = ?auto_99402 ?auto_99406 ) ) ( not ( = ?auto_99403 ?auto_99404 ) ) ( not ( = ?auto_99403 ?auto_99406 ) ) ( not ( = ?auto_99404 ?auto_99406 ) ) ( ON ?auto_99406 ?auto_99405 ) ( not ( = ?auto_99399 ?auto_99405 ) ) ( not ( = ?auto_99400 ?auto_99405 ) ) ( not ( = ?auto_99401 ?auto_99405 ) ) ( not ( = ?auto_99402 ?auto_99405 ) ) ( not ( = ?auto_99403 ?auto_99405 ) ) ( not ( = ?auto_99404 ?auto_99405 ) ) ( not ( = ?auto_99406 ?auto_99405 ) ) ( CLEAR ?auto_99403 ) ( ON ?auto_99404 ?auto_99406 ) ( CLEAR ?auto_99404 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_99405 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_99405 ?auto_99406 )
      ( MAKE-6PILE ?auto_99399 ?auto_99400 ?auto_99401 ?auto_99402 ?auto_99403 ?auto_99404 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99407 - BLOCK
      ?auto_99408 - BLOCK
      ?auto_99409 - BLOCK
      ?auto_99410 - BLOCK
      ?auto_99411 - BLOCK
      ?auto_99412 - BLOCK
    )
    :vars
    (
      ?auto_99413 - BLOCK
      ?auto_99414 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99407 ) ( ON ?auto_99408 ?auto_99407 ) ( ON ?auto_99409 ?auto_99408 ) ( ON ?auto_99410 ?auto_99409 ) ( not ( = ?auto_99407 ?auto_99408 ) ) ( not ( = ?auto_99407 ?auto_99409 ) ) ( not ( = ?auto_99407 ?auto_99410 ) ) ( not ( = ?auto_99407 ?auto_99411 ) ) ( not ( = ?auto_99407 ?auto_99412 ) ) ( not ( = ?auto_99407 ?auto_99413 ) ) ( not ( = ?auto_99408 ?auto_99409 ) ) ( not ( = ?auto_99408 ?auto_99410 ) ) ( not ( = ?auto_99408 ?auto_99411 ) ) ( not ( = ?auto_99408 ?auto_99412 ) ) ( not ( = ?auto_99408 ?auto_99413 ) ) ( not ( = ?auto_99409 ?auto_99410 ) ) ( not ( = ?auto_99409 ?auto_99411 ) ) ( not ( = ?auto_99409 ?auto_99412 ) ) ( not ( = ?auto_99409 ?auto_99413 ) ) ( not ( = ?auto_99410 ?auto_99411 ) ) ( not ( = ?auto_99410 ?auto_99412 ) ) ( not ( = ?auto_99410 ?auto_99413 ) ) ( not ( = ?auto_99411 ?auto_99412 ) ) ( not ( = ?auto_99411 ?auto_99413 ) ) ( not ( = ?auto_99412 ?auto_99413 ) ) ( ON ?auto_99413 ?auto_99414 ) ( not ( = ?auto_99407 ?auto_99414 ) ) ( not ( = ?auto_99408 ?auto_99414 ) ) ( not ( = ?auto_99409 ?auto_99414 ) ) ( not ( = ?auto_99410 ?auto_99414 ) ) ( not ( = ?auto_99411 ?auto_99414 ) ) ( not ( = ?auto_99412 ?auto_99414 ) ) ( not ( = ?auto_99413 ?auto_99414 ) ) ( ON ?auto_99412 ?auto_99413 ) ( CLEAR ?auto_99412 ) ( ON-TABLE ?auto_99414 ) ( HOLDING ?auto_99411 ) ( CLEAR ?auto_99410 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99407 ?auto_99408 ?auto_99409 ?auto_99410 ?auto_99411 )
      ( MAKE-6PILE ?auto_99407 ?auto_99408 ?auto_99409 ?auto_99410 ?auto_99411 ?auto_99412 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99415 - BLOCK
      ?auto_99416 - BLOCK
      ?auto_99417 - BLOCK
      ?auto_99418 - BLOCK
      ?auto_99419 - BLOCK
      ?auto_99420 - BLOCK
    )
    :vars
    (
      ?auto_99422 - BLOCK
      ?auto_99421 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99415 ) ( ON ?auto_99416 ?auto_99415 ) ( ON ?auto_99417 ?auto_99416 ) ( ON ?auto_99418 ?auto_99417 ) ( not ( = ?auto_99415 ?auto_99416 ) ) ( not ( = ?auto_99415 ?auto_99417 ) ) ( not ( = ?auto_99415 ?auto_99418 ) ) ( not ( = ?auto_99415 ?auto_99419 ) ) ( not ( = ?auto_99415 ?auto_99420 ) ) ( not ( = ?auto_99415 ?auto_99422 ) ) ( not ( = ?auto_99416 ?auto_99417 ) ) ( not ( = ?auto_99416 ?auto_99418 ) ) ( not ( = ?auto_99416 ?auto_99419 ) ) ( not ( = ?auto_99416 ?auto_99420 ) ) ( not ( = ?auto_99416 ?auto_99422 ) ) ( not ( = ?auto_99417 ?auto_99418 ) ) ( not ( = ?auto_99417 ?auto_99419 ) ) ( not ( = ?auto_99417 ?auto_99420 ) ) ( not ( = ?auto_99417 ?auto_99422 ) ) ( not ( = ?auto_99418 ?auto_99419 ) ) ( not ( = ?auto_99418 ?auto_99420 ) ) ( not ( = ?auto_99418 ?auto_99422 ) ) ( not ( = ?auto_99419 ?auto_99420 ) ) ( not ( = ?auto_99419 ?auto_99422 ) ) ( not ( = ?auto_99420 ?auto_99422 ) ) ( ON ?auto_99422 ?auto_99421 ) ( not ( = ?auto_99415 ?auto_99421 ) ) ( not ( = ?auto_99416 ?auto_99421 ) ) ( not ( = ?auto_99417 ?auto_99421 ) ) ( not ( = ?auto_99418 ?auto_99421 ) ) ( not ( = ?auto_99419 ?auto_99421 ) ) ( not ( = ?auto_99420 ?auto_99421 ) ) ( not ( = ?auto_99422 ?auto_99421 ) ) ( ON ?auto_99420 ?auto_99422 ) ( ON-TABLE ?auto_99421 ) ( CLEAR ?auto_99418 ) ( ON ?auto_99419 ?auto_99420 ) ( CLEAR ?auto_99419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_99421 ?auto_99422 ?auto_99420 )
      ( MAKE-6PILE ?auto_99415 ?auto_99416 ?auto_99417 ?auto_99418 ?auto_99419 ?auto_99420 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99423 - BLOCK
      ?auto_99424 - BLOCK
      ?auto_99425 - BLOCK
      ?auto_99426 - BLOCK
      ?auto_99427 - BLOCK
      ?auto_99428 - BLOCK
    )
    :vars
    (
      ?auto_99429 - BLOCK
      ?auto_99430 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99423 ) ( ON ?auto_99424 ?auto_99423 ) ( ON ?auto_99425 ?auto_99424 ) ( not ( = ?auto_99423 ?auto_99424 ) ) ( not ( = ?auto_99423 ?auto_99425 ) ) ( not ( = ?auto_99423 ?auto_99426 ) ) ( not ( = ?auto_99423 ?auto_99427 ) ) ( not ( = ?auto_99423 ?auto_99428 ) ) ( not ( = ?auto_99423 ?auto_99429 ) ) ( not ( = ?auto_99424 ?auto_99425 ) ) ( not ( = ?auto_99424 ?auto_99426 ) ) ( not ( = ?auto_99424 ?auto_99427 ) ) ( not ( = ?auto_99424 ?auto_99428 ) ) ( not ( = ?auto_99424 ?auto_99429 ) ) ( not ( = ?auto_99425 ?auto_99426 ) ) ( not ( = ?auto_99425 ?auto_99427 ) ) ( not ( = ?auto_99425 ?auto_99428 ) ) ( not ( = ?auto_99425 ?auto_99429 ) ) ( not ( = ?auto_99426 ?auto_99427 ) ) ( not ( = ?auto_99426 ?auto_99428 ) ) ( not ( = ?auto_99426 ?auto_99429 ) ) ( not ( = ?auto_99427 ?auto_99428 ) ) ( not ( = ?auto_99427 ?auto_99429 ) ) ( not ( = ?auto_99428 ?auto_99429 ) ) ( ON ?auto_99429 ?auto_99430 ) ( not ( = ?auto_99423 ?auto_99430 ) ) ( not ( = ?auto_99424 ?auto_99430 ) ) ( not ( = ?auto_99425 ?auto_99430 ) ) ( not ( = ?auto_99426 ?auto_99430 ) ) ( not ( = ?auto_99427 ?auto_99430 ) ) ( not ( = ?auto_99428 ?auto_99430 ) ) ( not ( = ?auto_99429 ?auto_99430 ) ) ( ON ?auto_99428 ?auto_99429 ) ( ON-TABLE ?auto_99430 ) ( ON ?auto_99427 ?auto_99428 ) ( CLEAR ?auto_99427 ) ( HOLDING ?auto_99426 ) ( CLEAR ?auto_99425 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_99423 ?auto_99424 ?auto_99425 ?auto_99426 )
      ( MAKE-6PILE ?auto_99423 ?auto_99424 ?auto_99425 ?auto_99426 ?auto_99427 ?auto_99428 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99431 - BLOCK
      ?auto_99432 - BLOCK
      ?auto_99433 - BLOCK
      ?auto_99434 - BLOCK
      ?auto_99435 - BLOCK
      ?auto_99436 - BLOCK
    )
    :vars
    (
      ?auto_99438 - BLOCK
      ?auto_99437 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99431 ) ( ON ?auto_99432 ?auto_99431 ) ( ON ?auto_99433 ?auto_99432 ) ( not ( = ?auto_99431 ?auto_99432 ) ) ( not ( = ?auto_99431 ?auto_99433 ) ) ( not ( = ?auto_99431 ?auto_99434 ) ) ( not ( = ?auto_99431 ?auto_99435 ) ) ( not ( = ?auto_99431 ?auto_99436 ) ) ( not ( = ?auto_99431 ?auto_99438 ) ) ( not ( = ?auto_99432 ?auto_99433 ) ) ( not ( = ?auto_99432 ?auto_99434 ) ) ( not ( = ?auto_99432 ?auto_99435 ) ) ( not ( = ?auto_99432 ?auto_99436 ) ) ( not ( = ?auto_99432 ?auto_99438 ) ) ( not ( = ?auto_99433 ?auto_99434 ) ) ( not ( = ?auto_99433 ?auto_99435 ) ) ( not ( = ?auto_99433 ?auto_99436 ) ) ( not ( = ?auto_99433 ?auto_99438 ) ) ( not ( = ?auto_99434 ?auto_99435 ) ) ( not ( = ?auto_99434 ?auto_99436 ) ) ( not ( = ?auto_99434 ?auto_99438 ) ) ( not ( = ?auto_99435 ?auto_99436 ) ) ( not ( = ?auto_99435 ?auto_99438 ) ) ( not ( = ?auto_99436 ?auto_99438 ) ) ( ON ?auto_99438 ?auto_99437 ) ( not ( = ?auto_99431 ?auto_99437 ) ) ( not ( = ?auto_99432 ?auto_99437 ) ) ( not ( = ?auto_99433 ?auto_99437 ) ) ( not ( = ?auto_99434 ?auto_99437 ) ) ( not ( = ?auto_99435 ?auto_99437 ) ) ( not ( = ?auto_99436 ?auto_99437 ) ) ( not ( = ?auto_99438 ?auto_99437 ) ) ( ON ?auto_99436 ?auto_99438 ) ( ON-TABLE ?auto_99437 ) ( ON ?auto_99435 ?auto_99436 ) ( CLEAR ?auto_99433 ) ( ON ?auto_99434 ?auto_99435 ) ( CLEAR ?auto_99434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_99437 ?auto_99438 ?auto_99436 ?auto_99435 )
      ( MAKE-6PILE ?auto_99431 ?auto_99432 ?auto_99433 ?auto_99434 ?auto_99435 ?auto_99436 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99439 - BLOCK
      ?auto_99440 - BLOCK
      ?auto_99441 - BLOCK
      ?auto_99442 - BLOCK
      ?auto_99443 - BLOCK
      ?auto_99444 - BLOCK
    )
    :vars
    (
      ?auto_99446 - BLOCK
      ?auto_99445 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99439 ) ( ON ?auto_99440 ?auto_99439 ) ( not ( = ?auto_99439 ?auto_99440 ) ) ( not ( = ?auto_99439 ?auto_99441 ) ) ( not ( = ?auto_99439 ?auto_99442 ) ) ( not ( = ?auto_99439 ?auto_99443 ) ) ( not ( = ?auto_99439 ?auto_99444 ) ) ( not ( = ?auto_99439 ?auto_99446 ) ) ( not ( = ?auto_99440 ?auto_99441 ) ) ( not ( = ?auto_99440 ?auto_99442 ) ) ( not ( = ?auto_99440 ?auto_99443 ) ) ( not ( = ?auto_99440 ?auto_99444 ) ) ( not ( = ?auto_99440 ?auto_99446 ) ) ( not ( = ?auto_99441 ?auto_99442 ) ) ( not ( = ?auto_99441 ?auto_99443 ) ) ( not ( = ?auto_99441 ?auto_99444 ) ) ( not ( = ?auto_99441 ?auto_99446 ) ) ( not ( = ?auto_99442 ?auto_99443 ) ) ( not ( = ?auto_99442 ?auto_99444 ) ) ( not ( = ?auto_99442 ?auto_99446 ) ) ( not ( = ?auto_99443 ?auto_99444 ) ) ( not ( = ?auto_99443 ?auto_99446 ) ) ( not ( = ?auto_99444 ?auto_99446 ) ) ( ON ?auto_99446 ?auto_99445 ) ( not ( = ?auto_99439 ?auto_99445 ) ) ( not ( = ?auto_99440 ?auto_99445 ) ) ( not ( = ?auto_99441 ?auto_99445 ) ) ( not ( = ?auto_99442 ?auto_99445 ) ) ( not ( = ?auto_99443 ?auto_99445 ) ) ( not ( = ?auto_99444 ?auto_99445 ) ) ( not ( = ?auto_99446 ?auto_99445 ) ) ( ON ?auto_99444 ?auto_99446 ) ( ON-TABLE ?auto_99445 ) ( ON ?auto_99443 ?auto_99444 ) ( ON ?auto_99442 ?auto_99443 ) ( CLEAR ?auto_99442 ) ( HOLDING ?auto_99441 ) ( CLEAR ?auto_99440 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_99439 ?auto_99440 ?auto_99441 )
      ( MAKE-6PILE ?auto_99439 ?auto_99440 ?auto_99441 ?auto_99442 ?auto_99443 ?auto_99444 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99447 - BLOCK
      ?auto_99448 - BLOCK
      ?auto_99449 - BLOCK
      ?auto_99450 - BLOCK
      ?auto_99451 - BLOCK
      ?auto_99452 - BLOCK
    )
    :vars
    (
      ?auto_99454 - BLOCK
      ?auto_99453 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99447 ) ( ON ?auto_99448 ?auto_99447 ) ( not ( = ?auto_99447 ?auto_99448 ) ) ( not ( = ?auto_99447 ?auto_99449 ) ) ( not ( = ?auto_99447 ?auto_99450 ) ) ( not ( = ?auto_99447 ?auto_99451 ) ) ( not ( = ?auto_99447 ?auto_99452 ) ) ( not ( = ?auto_99447 ?auto_99454 ) ) ( not ( = ?auto_99448 ?auto_99449 ) ) ( not ( = ?auto_99448 ?auto_99450 ) ) ( not ( = ?auto_99448 ?auto_99451 ) ) ( not ( = ?auto_99448 ?auto_99452 ) ) ( not ( = ?auto_99448 ?auto_99454 ) ) ( not ( = ?auto_99449 ?auto_99450 ) ) ( not ( = ?auto_99449 ?auto_99451 ) ) ( not ( = ?auto_99449 ?auto_99452 ) ) ( not ( = ?auto_99449 ?auto_99454 ) ) ( not ( = ?auto_99450 ?auto_99451 ) ) ( not ( = ?auto_99450 ?auto_99452 ) ) ( not ( = ?auto_99450 ?auto_99454 ) ) ( not ( = ?auto_99451 ?auto_99452 ) ) ( not ( = ?auto_99451 ?auto_99454 ) ) ( not ( = ?auto_99452 ?auto_99454 ) ) ( ON ?auto_99454 ?auto_99453 ) ( not ( = ?auto_99447 ?auto_99453 ) ) ( not ( = ?auto_99448 ?auto_99453 ) ) ( not ( = ?auto_99449 ?auto_99453 ) ) ( not ( = ?auto_99450 ?auto_99453 ) ) ( not ( = ?auto_99451 ?auto_99453 ) ) ( not ( = ?auto_99452 ?auto_99453 ) ) ( not ( = ?auto_99454 ?auto_99453 ) ) ( ON ?auto_99452 ?auto_99454 ) ( ON-TABLE ?auto_99453 ) ( ON ?auto_99451 ?auto_99452 ) ( ON ?auto_99450 ?auto_99451 ) ( CLEAR ?auto_99448 ) ( ON ?auto_99449 ?auto_99450 ) ( CLEAR ?auto_99449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99453 ?auto_99454 ?auto_99452 ?auto_99451 ?auto_99450 )
      ( MAKE-6PILE ?auto_99447 ?auto_99448 ?auto_99449 ?auto_99450 ?auto_99451 ?auto_99452 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99455 - BLOCK
      ?auto_99456 - BLOCK
      ?auto_99457 - BLOCK
      ?auto_99458 - BLOCK
      ?auto_99459 - BLOCK
      ?auto_99460 - BLOCK
    )
    :vars
    (
      ?auto_99462 - BLOCK
      ?auto_99461 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99455 ) ( not ( = ?auto_99455 ?auto_99456 ) ) ( not ( = ?auto_99455 ?auto_99457 ) ) ( not ( = ?auto_99455 ?auto_99458 ) ) ( not ( = ?auto_99455 ?auto_99459 ) ) ( not ( = ?auto_99455 ?auto_99460 ) ) ( not ( = ?auto_99455 ?auto_99462 ) ) ( not ( = ?auto_99456 ?auto_99457 ) ) ( not ( = ?auto_99456 ?auto_99458 ) ) ( not ( = ?auto_99456 ?auto_99459 ) ) ( not ( = ?auto_99456 ?auto_99460 ) ) ( not ( = ?auto_99456 ?auto_99462 ) ) ( not ( = ?auto_99457 ?auto_99458 ) ) ( not ( = ?auto_99457 ?auto_99459 ) ) ( not ( = ?auto_99457 ?auto_99460 ) ) ( not ( = ?auto_99457 ?auto_99462 ) ) ( not ( = ?auto_99458 ?auto_99459 ) ) ( not ( = ?auto_99458 ?auto_99460 ) ) ( not ( = ?auto_99458 ?auto_99462 ) ) ( not ( = ?auto_99459 ?auto_99460 ) ) ( not ( = ?auto_99459 ?auto_99462 ) ) ( not ( = ?auto_99460 ?auto_99462 ) ) ( ON ?auto_99462 ?auto_99461 ) ( not ( = ?auto_99455 ?auto_99461 ) ) ( not ( = ?auto_99456 ?auto_99461 ) ) ( not ( = ?auto_99457 ?auto_99461 ) ) ( not ( = ?auto_99458 ?auto_99461 ) ) ( not ( = ?auto_99459 ?auto_99461 ) ) ( not ( = ?auto_99460 ?auto_99461 ) ) ( not ( = ?auto_99462 ?auto_99461 ) ) ( ON ?auto_99460 ?auto_99462 ) ( ON-TABLE ?auto_99461 ) ( ON ?auto_99459 ?auto_99460 ) ( ON ?auto_99458 ?auto_99459 ) ( ON ?auto_99457 ?auto_99458 ) ( CLEAR ?auto_99457 ) ( HOLDING ?auto_99456 ) ( CLEAR ?auto_99455 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_99455 ?auto_99456 )
      ( MAKE-6PILE ?auto_99455 ?auto_99456 ?auto_99457 ?auto_99458 ?auto_99459 ?auto_99460 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99463 - BLOCK
      ?auto_99464 - BLOCK
      ?auto_99465 - BLOCK
      ?auto_99466 - BLOCK
      ?auto_99467 - BLOCK
      ?auto_99468 - BLOCK
    )
    :vars
    (
      ?auto_99469 - BLOCK
      ?auto_99470 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99463 ) ( not ( = ?auto_99463 ?auto_99464 ) ) ( not ( = ?auto_99463 ?auto_99465 ) ) ( not ( = ?auto_99463 ?auto_99466 ) ) ( not ( = ?auto_99463 ?auto_99467 ) ) ( not ( = ?auto_99463 ?auto_99468 ) ) ( not ( = ?auto_99463 ?auto_99469 ) ) ( not ( = ?auto_99464 ?auto_99465 ) ) ( not ( = ?auto_99464 ?auto_99466 ) ) ( not ( = ?auto_99464 ?auto_99467 ) ) ( not ( = ?auto_99464 ?auto_99468 ) ) ( not ( = ?auto_99464 ?auto_99469 ) ) ( not ( = ?auto_99465 ?auto_99466 ) ) ( not ( = ?auto_99465 ?auto_99467 ) ) ( not ( = ?auto_99465 ?auto_99468 ) ) ( not ( = ?auto_99465 ?auto_99469 ) ) ( not ( = ?auto_99466 ?auto_99467 ) ) ( not ( = ?auto_99466 ?auto_99468 ) ) ( not ( = ?auto_99466 ?auto_99469 ) ) ( not ( = ?auto_99467 ?auto_99468 ) ) ( not ( = ?auto_99467 ?auto_99469 ) ) ( not ( = ?auto_99468 ?auto_99469 ) ) ( ON ?auto_99469 ?auto_99470 ) ( not ( = ?auto_99463 ?auto_99470 ) ) ( not ( = ?auto_99464 ?auto_99470 ) ) ( not ( = ?auto_99465 ?auto_99470 ) ) ( not ( = ?auto_99466 ?auto_99470 ) ) ( not ( = ?auto_99467 ?auto_99470 ) ) ( not ( = ?auto_99468 ?auto_99470 ) ) ( not ( = ?auto_99469 ?auto_99470 ) ) ( ON ?auto_99468 ?auto_99469 ) ( ON-TABLE ?auto_99470 ) ( ON ?auto_99467 ?auto_99468 ) ( ON ?auto_99466 ?auto_99467 ) ( ON ?auto_99465 ?auto_99466 ) ( CLEAR ?auto_99463 ) ( ON ?auto_99464 ?auto_99465 ) ( CLEAR ?auto_99464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_99470 ?auto_99469 ?auto_99468 ?auto_99467 ?auto_99466 ?auto_99465 )
      ( MAKE-6PILE ?auto_99463 ?auto_99464 ?auto_99465 ?auto_99466 ?auto_99467 ?auto_99468 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99471 - BLOCK
      ?auto_99472 - BLOCK
      ?auto_99473 - BLOCK
      ?auto_99474 - BLOCK
      ?auto_99475 - BLOCK
      ?auto_99476 - BLOCK
    )
    :vars
    (
      ?auto_99478 - BLOCK
      ?auto_99477 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99471 ?auto_99472 ) ) ( not ( = ?auto_99471 ?auto_99473 ) ) ( not ( = ?auto_99471 ?auto_99474 ) ) ( not ( = ?auto_99471 ?auto_99475 ) ) ( not ( = ?auto_99471 ?auto_99476 ) ) ( not ( = ?auto_99471 ?auto_99478 ) ) ( not ( = ?auto_99472 ?auto_99473 ) ) ( not ( = ?auto_99472 ?auto_99474 ) ) ( not ( = ?auto_99472 ?auto_99475 ) ) ( not ( = ?auto_99472 ?auto_99476 ) ) ( not ( = ?auto_99472 ?auto_99478 ) ) ( not ( = ?auto_99473 ?auto_99474 ) ) ( not ( = ?auto_99473 ?auto_99475 ) ) ( not ( = ?auto_99473 ?auto_99476 ) ) ( not ( = ?auto_99473 ?auto_99478 ) ) ( not ( = ?auto_99474 ?auto_99475 ) ) ( not ( = ?auto_99474 ?auto_99476 ) ) ( not ( = ?auto_99474 ?auto_99478 ) ) ( not ( = ?auto_99475 ?auto_99476 ) ) ( not ( = ?auto_99475 ?auto_99478 ) ) ( not ( = ?auto_99476 ?auto_99478 ) ) ( ON ?auto_99478 ?auto_99477 ) ( not ( = ?auto_99471 ?auto_99477 ) ) ( not ( = ?auto_99472 ?auto_99477 ) ) ( not ( = ?auto_99473 ?auto_99477 ) ) ( not ( = ?auto_99474 ?auto_99477 ) ) ( not ( = ?auto_99475 ?auto_99477 ) ) ( not ( = ?auto_99476 ?auto_99477 ) ) ( not ( = ?auto_99478 ?auto_99477 ) ) ( ON ?auto_99476 ?auto_99478 ) ( ON-TABLE ?auto_99477 ) ( ON ?auto_99475 ?auto_99476 ) ( ON ?auto_99474 ?auto_99475 ) ( ON ?auto_99473 ?auto_99474 ) ( ON ?auto_99472 ?auto_99473 ) ( CLEAR ?auto_99472 ) ( HOLDING ?auto_99471 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_99471 )
      ( MAKE-6PILE ?auto_99471 ?auto_99472 ?auto_99473 ?auto_99474 ?auto_99475 ?auto_99476 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99479 - BLOCK
      ?auto_99480 - BLOCK
      ?auto_99481 - BLOCK
      ?auto_99482 - BLOCK
      ?auto_99483 - BLOCK
      ?auto_99484 - BLOCK
    )
    :vars
    (
      ?auto_99486 - BLOCK
      ?auto_99485 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99479 ?auto_99480 ) ) ( not ( = ?auto_99479 ?auto_99481 ) ) ( not ( = ?auto_99479 ?auto_99482 ) ) ( not ( = ?auto_99479 ?auto_99483 ) ) ( not ( = ?auto_99479 ?auto_99484 ) ) ( not ( = ?auto_99479 ?auto_99486 ) ) ( not ( = ?auto_99480 ?auto_99481 ) ) ( not ( = ?auto_99480 ?auto_99482 ) ) ( not ( = ?auto_99480 ?auto_99483 ) ) ( not ( = ?auto_99480 ?auto_99484 ) ) ( not ( = ?auto_99480 ?auto_99486 ) ) ( not ( = ?auto_99481 ?auto_99482 ) ) ( not ( = ?auto_99481 ?auto_99483 ) ) ( not ( = ?auto_99481 ?auto_99484 ) ) ( not ( = ?auto_99481 ?auto_99486 ) ) ( not ( = ?auto_99482 ?auto_99483 ) ) ( not ( = ?auto_99482 ?auto_99484 ) ) ( not ( = ?auto_99482 ?auto_99486 ) ) ( not ( = ?auto_99483 ?auto_99484 ) ) ( not ( = ?auto_99483 ?auto_99486 ) ) ( not ( = ?auto_99484 ?auto_99486 ) ) ( ON ?auto_99486 ?auto_99485 ) ( not ( = ?auto_99479 ?auto_99485 ) ) ( not ( = ?auto_99480 ?auto_99485 ) ) ( not ( = ?auto_99481 ?auto_99485 ) ) ( not ( = ?auto_99482 ?auto_99485 ) ) ( not ( = ?auto_99483 ?auto_99485 ) ) ( not ( = ?auto_99484 ?auto_99485 ) ) ( not ( = ?auto_99486 ?auto_99485 ) ) ( ON ?auto_99484 ?auto_99486 ) ( ON-TABLE ?auto_99485 ) ( ON ?auto_99483 ?auto_99484 ) ( ON ?auto_99482 ?auto_99483 ) ( ON ?auto_99481 ?auto_99482 ) ( ON ?auto_99480 ?auto_99481 ) ( ON ?auto_99479 ?auto_99480 ) ( CLEAR ?auto_99479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_99485 ?auto_99486 ?auto_99484 ?auto_99483 ?auto_99482 ?auto_99481 ?auto_99480 )
      ( MAKE-6PILE ?auto_99479 ?auto_99480 ?auto_99481 ?auto_99482 ?auto_99483 ?auto_99484 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99488 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_99488 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_99488 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99489 - BLOCK
    )
    :vars
    (
      ?auto_99490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99489 ?auto_99490 ) ( CLEAR ?auto_99489 ) ( HAND-EMPTY ) ( not ( = ?auto_99489 ?auto_99490 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_99489 ?auto_99490 )
      ( MAKE-1PILE ?auto_99489 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99491 - BLOCK
    )
    :vars
    (
      ?auto_99492 - BLOCK
      ?auto_99496 - BLOCK
      ?auto_99494 - BLOCK
      ?auto_99493 - BLOCK
      ?auto_99497 - BLOCK
      ?auto_99495 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99491 ?auto_99492 ) ) ( HOLDING ?auto_99491 ) ( CLEAR ?auto_99492 ) ( ON-TABLE ?auto_99496 ) ( ON ?auto_99494 ?auto_99496 ) ( ON ?auto_99493 ?auto_99494 ) ( ON ?auto_99497 ?auto_99493 ) ( ON ?auto_99495 ?auto_99497 ) ( ON ?auto_99492 ?auto_99495 ) ( not ( = ?auto_99496 ?auto_99494 ) ) ( not ( = ?auto_99496 ?auto_99493 ) ) ( not ( = ?auto_99496 ?auto_99497 ) ) ( not ( = ?auto_99496 ?auto_99495 ) ) ( not ( = ?auto_99496 ?auto_99492 ) ) ( not ( = ?auto_99496 ?auto_99491 ) ) ( not ( = ?auto_99494 ?auto_99493 ) ) ( not ( = ?auto_99494 ?auto_99497 ) ) ( not ( = ?auto_99494 ?auto_99495 ) ) ( not ( = ?auto_99494 ?auto_99492 ) ) ( not ( = ?auto_99494 ?auto_99491 ) ) ( not ( = ?auto_99493 ?auto_99497 ) ) ( not ( = ?auto_99493 ?auto_99495 ) ) ( not ( = ?auto_99493 ?auto_99492 ) ) ( not ( = ?auto_99493 ?auto_99491 ) ) ( not ( = ?auto_99497 ?auto_99495 ) ) ( not ( = ?auto_99497 ?auto_99492 ) ) ( not ( = ?auto_99497 ?auto_99491 ) ) ( not ( = ?auto_99495 ?auto_99492 ) ) ( not ( = ?auto_99495 ?auto_99491 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_99496 ?auto_99494 ?auto_99493 ?auto_99497 ?auto_99495 ?auto_99492 ?auto_99491 )
      ( MAKE-1PILE ?auto_99491 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99498 - BLOCK
    )
    :vars
    (
      ?auto_99499 - BLOCK
      ?auto_99500 - BLOCK
      ?auto_99504 - BLOCK
      ?auto_99503 - BLOCK
      ?auto_99501 - BLOCK
      ?auto_99502 - BLOCK
      ?auto_99505 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99498 ?auto_99499 ) ) ( CLEAR ?auto_99499 ) ( ON-TABLE ?auto_99500 ) ( ON ?auto_99504 ?auto_99500 ) ( ON ?auto_99503 ?auto_99504 ) ( ON ?auto_99501 ?auto_99503 ) ( ON ?auto_99502 ?auto_99501 ) ( ON ?auto_99499 ?auto_99502 ) ( not ( = ?auto_99500 ?auto_99504 ) ) ( not ( = ?auto_99500 ?auto_99503 ) ) ( not ( = ?auto_99500 ?auto_99501 ) ) ( not ( = ?auto_99500 ?auto_99502 ) ) ( not ( = ?auto_99500 ?auto_99499 ) ) ( not ( = ?auto_99500 ?auto_99498 ) ) ( not ( = ?auto_99504 ?auto_99503 ) ) ( not ( = ?auto_99504 ?auto_99501 ) ) ( not ( = ?auto_99504 ?auto_99502 ) ) ( not ( = ?auto_99504 ?auto_99499 ) ) ( not ( = ?auto_99504 ?auto_99498 ) ) ( not ( = ?auto_99503 ?auto_99501 ) ) ( not ( = ?auto_99503 ?auto_99502 ) ) ( not ( = ?auto_99503 ?auto_99499 ) ) ( not ( = ?auto_99503 ?auto_99498 ) ) ( not ( = ?auto_99501 ?auto_99502 ) ) ( not ( = ?auto_99501 ?auto_99499 ) ) ( not ( = ?auto_99501 ?auto_99498 ) ) ( not ( = ?auto_99502 ?auto_99499 ) ) ( not ( = ?auto_99502 ?auto_99498 ) ) ( ON ?auto_99498 ?auto_99505 ) ( CLEAR ?auto_99498 ) ( HAND-EMPTY ) ( not ( = ?auto_99498 ?auto_99505 ) ) ( not ( = ?auto_99499 ?auto_99505 ) ) ( not ( = ?auto_99500 ?auto_99505 ) ) ( not ( = ?auto_99504 ?auto_99505 ) ) ( not ( = ?auto_99503 ?auto_99505 ) ) ( not ( = ?auto_99501 ?auto_99505 ) ) ( not ( = ?auto_99502 ?auto_99505 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_99498 ?auto_99505 )
      ( MAKE-1PILE ?auto_99498 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99506 - BLOCK
    )
    :vars
    (
      ?auto_99510 - BLOCK
      ?auto_99508 - BLOCK
      ?auto_99511 - BLOCK
      ?auto_99513 - BLOCK
      ?auto_99509 - BLOCK
      ?auto_99507 - BLOCK
      ?auto_99512 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99506 ?auto_99510 ) ) ( ON-TABLE ?auto_99508 ) ( ON ?auto_99511 ?auto_99508 ) ( ON ?auto_99513 ?auto_99511 ) ( ON ?auto_99509 ?auto_99513 ) ( ON ?auto_99507 ?auto_99509 ) ( not ( = ?auto_99508 ?auto_99511 ) ) ( not ( = ?auto_99508 ?auto_99513 ) ) ( not ( = ?auto_99508 ?auto_99509 ) ) ( not ( = ?auto_99508 ?auto_99507 ) ) ( not ( = ?auto_99508 ?auto_99510 ) ) ( not ( = ?auto_99508 ?auto_99506 ) ) ( not ( = ?auto_99511 ?auto_99513 ) ) ( not ( = ?auto_99511 ?auto_99509 ) ) ( not ( = ?auto_99511 ?auto_99507 ) ) ( not ( = ?auto_99511 ?auto_99510 ) ) ( not ( = ?auto_99511 ?auto_99506 ) ) ( not ( = ?auto_99513 ?auto_99509 ) ) ( not ( = ?auto_99513 ?auto_99507 ) ) ( not ( = ?auto_99513 ?auto_99510 ) ) ( not ( = ?auto_99513 ?auto_99506 ) ) ( not ( = ?auto_99509 ?auto_99507 ) ) ( not ( = ?auto_99509 ?auto_99510 ) ) ( not ( = ?auto_99509 ?auto_99506 ) ) ( not ( = ?auto_99507 ?auto_99510 ) ) ( not ( = ?auto_99507 ?auto_99506 ) ) ( ON ?auto_99506 ?auto_99512 ) ( CLEAR ?auto_99506 ) ( not ( = ?auto_99506 ?auto_99512 ) ) ( not ( = ?auto_99510 ?auto_99512 ) ) ( not ( = ?auto_99508 ?auto_99512 ) ) ( not ( = ?auto_99511 ?auto_99512 ) ) ( not ( = ?auto_99513 ?auto_99512 ) ) ( not ( = ?auto_99509 ?auto_99512 ) ) ( not ( = ?auto_99507 ?auto_99512 ) ) ( HOLDING ?auto_99510 ) ( CLEAR ?auto_99507 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_99508 ?auto_99511 ?auto_99513 ?auto_99509 ?auto_99507 ?auto_99510 )
      ( MAKE-1PILE ?auto_99506 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99514 - BLOCK
    )
    :vars
    (
      ?auto_99518 - BLOCK
      ?auto_99519 - BLOCK
      ?auto_99515 - BLOCK
      ?auto_99521 - BLOCK
      ?auto_99517 - BLOCK
      ?auto_99516 - BLOCK
      ?auto_99520 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99514 ?auto_99518 ) ) ( ON-TABLE ?auto_99519 ) ( ON ?auto_99515 ?auto_99519 ) ( ON ?auto_99521 ?auto_99515 ) ( ON ?auto_99517 ?auto_99521 ) ( ON ?auto_99516 ?auto_99517 ) ( not ( = ?auto_99519 ?auto_99515 ) ) ( not ( = ?auto_99519 ?auto_99521 ) ) ( not ( = ?auto_99519 ?auto_99517 ) ) ( not ( = ?auto_99519 ?auto_99516 ) ) ( not ( = ?auto_99519 ?auto_99518 ) ) ( not ( = ?auto_99519 ?auto_99514 ) ) ( not ( = ?auto_99515 ?auto_99521 ) ) ( not ( = ?auto_99515 ?auto_99517 ) ) ( not ( = ?auto_99515 ?auto_99516 ) ) ( not ( = ?auto_99515 ?auto_99518 ) ) ( not ( = ?auto_99515 ?auto_99514 ) ) ( not ( = ?auto_99521 ?auto_99517 ) ) ( not ( = ?auto_99521 ?auto_99516 ) ) ( not ( = ?auto_99521 ?auto_99518 ) ) ( not ( = ?auto_99521 ?auto_99514 ) ) ( not ( = ?auto_99517 ?auto_99516 ) ) ( not ( = ?auto_99517 ?auto_99518 ) ) ( not ( = ?auto_99517 ?auto_99514 ) ) ( not ( = ?auto_99516 ?auto_99518 ) ) ( not ( = ?auto_99516 ?auto_99514 ) ) ( ON ?auto_99514 ?auto_99520 ) ( not ( = ?auto_99514 ?auto_99520 ) ) ( not ( = ?auto_99518 ?auto_99520 ) ) ( not ( = ?auto_99519 ?auto_99520 ) ) ( not ( = ?auto_99515 ?auto_99520 ) ) ( not ( = ?auto_99521 ?auto_99520 ) ) ( not ( = ?auto_99517 ?auto_99520 ) ) ( not ( = ?auto_99516 ?auto_99520 ) ) ( CLEAR ?auto_99516 ) ( ON ?auto_99518 ?auto_99514 ) ( CLEAR ?auto_99518 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_99520 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_99520 ?auto_99514 )
      ( MAKE-1PILE ?auto_99514 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99522 - BLOCK
    )
    :vars
    (
      ?auto_99529 - BLOCK
      ?auto_99526 - BLOCK
      ?auto_99528 - BLOCK
      ?auto_99525 - BLOCK
      ?auto_99523 - BLOCK
      ?auto_99524 - BLOCK
      ?auto_99527 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99522 ?auto_99529 ) ) ( ON-TABLE ?auto_99526 ) ( ON ?auto_99528 ?auto_99526 ) ( ON ?auto_99525 ?auto_99528 ) ( ON ?auto_99523 ?auto_99525 ) ( not ( = ?auto_99526 ?auto_99528 ) ) ( not ( = ?auto_99526 ?auto_99525 ) ) ( not ( = ?auto_99526 ?auto_99523 ) ) ( not ( = ?auto_99526 ?auto_99524 ) ) ( not ( = ?auto_99526 ?auto_99529 ) ) ( not ( = ?auto_99526 ?auto_99522 ) ) ( not ( = ?auto_99528 ?auto_99525 ) ) ( not ( = ?auto_99528 ?auto_99523 ) ) ( not ( = ?auto_99528 ?auto_99524 ) ) ( not ( = ?auto_99528 ?auto_99529 ) ) ( not ( = ?auto_99528 ?auto_99522 ) ) ( not ( = ?auto_99525 ?auto_99523 ) ) ( not ( = ?auto_99525 ?auto_99524 ) ) ( not ( = ?auto_99525 ?auto_99529 ) ) ( not ( = ?auto_99525 ?auto_99522 ) ) ( not ( = ?auto_99523 ?auto_99524 ) ) ( not ( = ?auto_99523 ?auto_99529 ) ) ( not ( = ?auto_99523 ?auto_99522 ) ) ( not ( = ?auto_99524 ?auto_99529 ) ) ( not ( = ?auto_99524 ?auto_99522 ) ) ( ON ?auto_99522 ?auto_99527 ) ( not ( = ?auto_99522 ?auto_99527 ) ) ( not ( = ?auto_99529 ?auto_99527 ) ) ( not ( = ?auto_99526 ?auto_99527 ) ) ( not ( = ?auto_99528 ?auto_99527 ) ) ( not ( = ?auto_99525 ?auto_99527 ) ) ( not ( = ?auto_99523 ?auto_99527 ) ) ( not ( = ?auto_99524 ?auto_99527 ) ) ( ON ?auto_99529 ?auto_99522 ) ( CLEAR ?auto_99529 ) ( ON-TABLE ?auto_99527 ) ( HOLDING ?auto_99524 ) ( CLEAR ?auto_99523 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99526 ?auto_99528 ?auto_99525 ?auto_99523 ?auto_99524 )
      ( MAKE-1PILE ?auto_99522 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99530 - BLOCK
    )
    :vars
    (
      ?auto_99532 - BLOCK
      ?auto_99537 - BLOCK
      ?auto_99531 - BLOCK
      ?auto_99536 - BLOCK
      ?auto_99534 - BLOCK
      ?auto_99533 - BLOCK
      ?auto_99535 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99530 ?auto_99532 ) ) ( ON-TABLE ?auto_99537 ) ( ON ?auto_99531 ?auto_99537 ) ( ON ?auto_99536 ?auto_99531 ) ( ON ?auto_99534 ?auto_99536 ) ( not ( = ?auto_99537 ?auto_99531 ) ) ( not ( = ?auto_99537 ?auto_99536 ) ) ( not ( = ?auto_99537 ?auto_99534 ) ) ( not ( = ?auto_99537 ?auto_99533 ) ) ( not ( = ?auto_99537 ?auto_99532 ) ) ( not ( = ?auto_99537 ?auto_99530 ) ) ( not ( = ?auto_99531 ?auto_99536 ) ) ( not ( = ?auto_99531 ?auto_99534 ) ) ( not ( = ?auto_99531 ?auto_99533 ) ) ( not ( = ?auto_99531 ?auto_99532 ) ) ( not ( = ?auto_99531 ?auto_99530 ) ) ( not ( = ?auto_99536 ?auto_99534 ) ) ( not ( = ?auto_99536 ?auto_99533 ) ) ( not ( = ?auto_99536 ?auto_99532 ) ) ( not ( = ?auto_99536 ?auto_99530 ) ) ( not ( = ?auto_99534 ?auto_99533 ) ) ( not ( = ?auto_99534 ?auto_99532 ) ) ( not ( = ?auto_99534 ?auto_99530 ) ) ( not ( = ?auto_99533 ?auto_99532 ) ) ( not ( = ?auto_99533 ?auto_99530 ) ) ( ON ?auto_99530 ?auto_99535 ) ( not ( = ?auto_99530 ?auto_99535 ) ) ( not ( = ?auto_99532 ?auto_99535 ) ) ( not ( = ?auto_99537 ?auto_99535 ) ) ( not ( = ?auto_99531 ?auto_99535 ) ) ( not ( = ?auto_99536 ?auto_99535 ) ) ( not ( = ?auto_99534 ?auto_99535 ) ) ( not ( = ?auto_99533 ?auto_99535 ) ) ( ON ?auto_99532 ?auto_99530 ) ( ON-TABLE ?auto_99535 ) ( CLEAR ?auto_99534 ) ( ON ?auto_99533 ?auto_99532 ) ( CLEAR ?auto_99533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_99535 ?auto_99530 ?auto_99532 )
      ( MAKE-1PILE ?auto_99530 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99538 - BLOCK
    )
    :vars
    (
      ?auto_99540 - BLOCK
      ?auto_99544 - BLOCK
      ?auto_99542 - BLOCK
      ?auto_99545 - BLOCK
      ?auto_99541 - BLOCK
      ?auto_99539 - BLOCK
      ?auto_99543 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99538 ?auto_99540 ) ) ( ON-TABLE ?auto_99544 ) ( ON ?auto_99542 ?auto_99544 ) ( ON ?auto_99545 ?auto_99542 ) ( not ( = ?auto_99544 ?auto_99542 ) ) ( not ( = ?auto_99544 ?auto_99545 ) ) ( not ( = ?auto_99544 ?auto_99541 ) ) ( not ( = ?auto_99544 ?auto_99539 ) ) ( not ( = ?auto_99544 ?auto_99540 ) ) ( not ( = ?auto_99544 ?auto_99538 ) ) ( not ( = ?auto_99542 ?auto_99545 ) ) ( not ( = ?auto_99542 ?auto_99541 ) ) ( not ( = ?auto_99542 ?auto_99539 ) ) ( not ( = ?auto_99542 ?auto_99540 ) ) ( not ( = ?auto_99542 ?auto_99538 ) ) ( not ( = ?auto_99545 ?auto_99541 ) ) ( not ( = ?auto_99545 ?auto_99539 ) ) ( not ( = ?auto_99545 ?auto_99540 ) ) ( not ( = ?auto_99545 ?auto_99538 ) ) ( not ( = ?auto_99541 ?auto_99539 ) ) ( not ( = ?auto_99541 ?auto_99540 ) ) ( not ( = ?auto_99541 ?auto_99538 ) ) ( not ( = ?auto_99539 ?auto_99540 ) ) ( not ( = ?auto_99539 ?auto_99538 ) ) ( ON ?auto_99538 ?auto_99543 ) ( not ( = ?auto_99538 ?auto_99543 ) ) ( not ( = ?auto_99540 ?auto_99543 ) ) ( not ( = ?auto_99544 ?auto_99543 ) ) ( not ( = ?auto_99542 ?auto_99543 ) ) ( not ( = ?auto_99545 ?auto_99543 ) ) ( not ( = ?auto_99541 ?auto_99543 ) ) ( not ( = ?auto_99539 ?auto_99543 ) ) ( ON ?auto_99540 ?auto_99538 ) ( ON-TABLE ?auto_99543 ) ( ON ?auto_99539 ?auto_99540 ) ( CLEAR ?auto_99539 ) ( HOLDING ?auto_99541 ) ( CLEAR ?auto_99545 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_99544 ?auto_99542 ?auto_99545 ?auto_99541 )
      ( MAKE-1PILE ?auto_99538 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99546 - BLOCK
    )
    :vars
    (
      ?auto_99553 - BLOCK
      ?auto_99552 - BLOCK
      ?auto_99550 - BLOCK
      ?auto_99547 - BLOCK
      ?auto_99548 - BLOCK
      ?auto_99551 - BLOCK
      ?auto_99549 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99546 ?auto_99553 ) ) ( ON-TABLE ?auto_99552 ) ( ON ?auto_99550 ?auto_99552 ) ( ON ?auto_99547 ?auto_99550 ) ( not ( = ?auto_99552 ?auto_99550 ) ) ( not ( = ?auto_99552 ?auto_99547 ) ) ( not ( = ?auto_99552 ?auto_99548 ) ) ( not ( = ?auto_99552 ?auto_99551 ) ) ( not ( = ?auto_99552 ?auto_99553 ) ) ( not ( = ?auto_99552 ?auto_99546 ) ) ( not ( = ?auto_99550 ?auto_99547 ) ) ( not ( = ?auto_99550 ?auto_99548 ) ) ( not ( = ?auto_99550 ?auto_99551 ) ) ( not ( = ?auto_99550 ?auto_99553 ) ) ( not ( = ?auto_99550 ?auto_99546 ) ) ( not ( = ?auto_99547 ?auto_99548 ) ) ( not ( = ?auto_99547 ?auto_99551 ) ) ( not ( = ?auto_99547 ?auto_99553 ) ) ( not ( = ?auto_99547 ?auto_99546 ) ) ( not ( = ?auto_99548 ?auto_99551 ) ) ( not ( = ?auto_99548 ?auto_99553 ) ) ( not ( = ?auto_99548 ?auto_99546 ) ) ( not ( = ?auto_99551 ?auto_99553 ) ) ( not ( = ?auto_99551 ?auto_99546 ) ) ( ON ?auto_99546 ?auto_99549 ) ( not ( = ?auto_99546 ?auto_99549 ) ) ( not ( = ?auto_99553 ?auto_99549 ) ) ( not ( = ?auto_99552 ?auto_99549 ) ) ( not ( = ?auto_99550 ?auto_99549 ) ) ( not ( = ?auto_99547 ?auto_99549 ) ) ( not ( = ?auto_99548 ?auto_99549 ) ) ( not ( = ?auto_99551 ?auto_99549 ) ) ( ON ?auto_99553 ?auto_99546 ) ( ON-TABLE ?auto_99549 ) ( ON ?auto_99551 ?auto_99553 ) ( CLEAR ?auto_99547 ) ( ON ?auto_99548 ?auto_99551 ) ( CLEAR ?auto_99548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_99549 ?auto_99546 ?auto_99553 ?auto_99551 )
      ( MAKE-1PILE ?auto_99546 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99554 - BLOCK
    )
    :vars
    (
      ?auto_99560 - BLOCK
      ?auto_99556 - BLOCK
      ?auto_99559 - BLOCK
      ?auto_99555 - BLOCK
      ?auto_99557 - BLOCK
      ?auto_99561 - BLOCK
      ?auto_99558 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99554 ?auto_99560 ) ) ( ON-TABLE ?auto_99556 ) ( ON ?auto_99559 ?auto_99556 ) ( not ( = ?auto_99556 ?auto_99559 ) ) ( not ( = ?auto_99556 ?auto_99555 ) ) ( not ( = ?auto_99556 ?auto_99557 ) ) ( not ( = ?auto_99556 ?auto_99561 ) ) ( not ( = ?auto_99556 ?auto_99560 ) ) ( not ( = ?auto_99556 ?auto_99554 ) ) ( not ( = ?auto_99559 ?auto_99555 ) ) ( not ( = ?auto_99559 ?auto_99557 ) ) ( not ( = ?auto_99559 ?auto_99561 ) ) ( not ( = ?auto_99559 ?auto_99560 ) ) ( not ( = ?auto_99559 ?auto_99554 ) ) ( not ( = ?auto_99555 ?auto_99557 ) ) ( not ( = ?auto_99555 ?auto_99561 ) ) ( not ( = ?auto_99555 ?auto_99560 ) ) ( not ( = ?auto_99555 ?auto_99554 ) ) ( not ( = ?auto_99557 ?auto_99561 ) ) ( not ( = ?auto_99557 ?auto_99560 ) ) ( not ( = ?auto_99557 ?auto_99554 ) ) ( not ( = ?auto_99561 ?auto_99560 ) ) ( not ( = ?auto_99561 ?auto_99554 ) ) ( ON ?auto_99554 ?auto_99558 ) ( not ( = ?auto_99554 ?auto_99558 ) ) ( not ( = ?auto_99560 ?auto_99558 ) ) ( not ( = ?auto_99556 ?auto_99558 ) ) ( not ( = ?auto_99559 ?auto_99558 ) ) ( not ( = ?auto_99555 ?auto_99558 ) ) ( not ( = ?auto_99557 ?auto_99558 ) ) ( not ( = ?auto_99561 ?auto_99558 ) ) ( ON ?auto_99560 ?auto_99554 ) ( ON-TABLE ?auto_99558 ) ( ON ?auto_99561 ?auto_99560 ) ( ON ?auto_99557 ?auto_99561 ) ( CLEAR ?auto_99557 ) ( HOLDING ?auto_99555 ) ( CLEAR ?auto_99559 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_99556 ?auto_99559 ?auto_99555 )
      ( MAKE-1PILE ?auto_99554 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99562 - BLOCK
    )
    :vars
    (
      ?auto_99567 - BLOCK
      ?auto_99564 - BLOCK
      ?auto_99568 - BLOCK
      ?auto_99563 - BLOCK
      ?auto_99566 - BLOCK
      ?auto_99565 - BLOCK
      ?auto_99569 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99562 ?auto_99567 ) ) ( ON-TABLE ?auto_99564 ) ( ON ?auto_99568 ?auto_99564 ) ( not ( = ?auto_99564 ?auto_99568 ) ) ( not ( = ?auto_99564 ?auto_99563 ) ) ( not ( = ?auto_99564 ?auto_99566 ) ) ( not ( = ?auto_99564 ?auto_99565 ) ) ( not ( = ?auto_99564 ?auto_99567 ) ) ( not ( = ?auto_99564 ?auto_99562 ) ) ( not ( = ?auto_99568 ?auto_99563 ) ) ( not ( = ?auto_99568 ?auto_99566 ) ) ( not ( = ?auto_99568 ?auto_99565 ) ) ( not ( = ?auto_99568 ?auto_99567 ) ) ( not ( = ?auto_99568 ?auto_99562 ) ) ( not ( = ?auto_99563 ?auto_99566 ) ) ( not ( = ?auto_99563 ?auto_99565 ) ) ( not ( = ?auto_99563 ?auto_99567 ) ) ( not ( = ?auto_99563 ?auto_99562 ) ) ( not ( = ?auto_99566 ?auto_99565 ) ) ( not ( = ?auto_99566 ?auto_99567 ) ) ( not ( = ?auto_99566 ?auto_99562 ) ) ( not ( = ?auto_99565 ?auto_99567 ) ) ( not ( = ?auto_99565 ?auto_99562 ) ) ( ON ?auto_99562 ?auto_99569 ) ( not ( = ?auto_99562 ?auto_99569 ) ) ( not ( = ?auto_99567 ?auto_99569 ) ) ( not ( = ?auto_99564 ?auto_99569 ) ) ( not ( = ?auto_99568 ?auto_99569 ) ) ( not ( = ?auto_99563 ?auto_99569 ) ) ( not ( = ?auto_99566 ?auto_99569 ) ) ( not ( = ?auto_99565 ?auto_99569 ) ) ( ON ?auto_99567 ?auto_99562 ) ( ON-TABLE ?auto_99569 ) ( ON ?auto_99565 ?auto_99567 ) ( ON ?auto_99566 ?auto_99565 ) ( CLEAR ?auto_99568 ) ( ON ?auto_99563 ?auto_99566 ) ( CLEAR ?auto_99563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99569 ?auto_99562 ?auto_99567 ?auto_99565 ?auto_99566 )
      ( MAKE-1PILE ?auto_99562 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99570 - BLOCK
    )
    :vars
    (
      ?auto_99574 - BLOCK
      ?auto_99576 - BLOCK
      ?auto_99577 - BLOCK
      ?auto_99575 - BLOCK
      ?auto_99573 - BLOCK
      ?auto_99572 - BLOCK
      ?auto_99571 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99570 ?auto_99574 ) ) ( ON-TABLE ?auto_99576 ) ( not ( = ?auto_99576 ?auto_99577 ) ) ( not ( = ?auto_99576 ?auto_99575 ) ) ( not ( = ?auto_99576 ?auto_99573 ) ) ( not ( = ?auto_99576 ?auto_99572 ) ) ( not ( = ?auto_99576 ?auto_99574 ) ) ( not ( = ?auto_99576 ?auto_99570 ) ) ( not ( = ?auto_99577 ?auto_99575 ) ) ( not ( = ?auto_99577 ?auto_99573 ) ) ( not ( = ?auto_99577 ?auto_99572 ) ) ( not ( = ?auto_99577 ?auto_99574 ) ) ( not ( = ?auto_99577 ?auto_99570 ) ) ( not ( = ?auto_99575 ?auto_99573 ) ) ( not ( = ?auto_99575 ?auto_99572 ) ) ( not ( = ?auto_99575 ?auto_99574 ) ) ( not ( = ?auto_99575 ?auto_99570 ) ) ( not ( = ?auto_99573 ?auto_99572 ) ) ( not ( = ?auto_99573 ?auto_99574 ) ) ( not ( = ?auto_99573 ?auto_99570 ) ) ( not ( = ?auto_99572 ?auto_99574 ) ) ( not ( = ?auto_99572 ?auto_99570 ) ) ( ON ?auto_99570 ?auto_99571 ) ( not ( = ?auto_99570 ?auto_99571 ) ) ( not ( = ?auto_99574 ?auto_99571 ) ) ( not ( = ?auto_99576 ?auto_99571 ) ) ( not ( = ?auto_99577 ?auto_99571 ) ) ( not ( = ?auto_99575 ?auto_99571 ) ) ( not ( = ?auto_99573 ?auto_99571 ) ) ( not ( = ?auto_99572 ?auto_99571 ) ) ( ON ?auto_99574 ?auto_99570 ) ( ON-TABLE ?auto_99571 ) ( ON ?auto_99572 ?auto_99574 ) ( ON ?auto_99573 ?auto_99572 ) ( ON ?auto_99575 ?auto_99573 ) ( CLEAR ?auto_99575 ) ( HOLDING ?auto_99577 ) ( CLEAR ?auto_99576 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_99576 ?auto_99577 )
      ( MAKE-1PILE ?auto_99570 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99578 - BLOCK
    )
    :vars
    (
      ?auto_99585 - BLOCK
      ?auto_99579 - BLOCK
      ?auto_99582 - BLOCK
      ?auto_99580 - BLOCK
      ?auto_99581 - BLOCK
      ?auto_99584 - BLOCK
      ?auto_99583 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99578 ?auto_99585 ) ) ( ON-TABLE ?auto_99579 ) ( not ( = ?auto_99579 ?auto_99582 ) ) ( not ( = ?auto_99579 ?auto_99580 ) ) ( not ( = ?auto_99579 ?auto_99581 ) ) ( not ( = ?auto_99579 ?auto_99584 ) ) ( not ( = ?auto_99579 ?auto_99585 ) ) ( not ( = ?auto_99579 ?auto_99578 ) ) ( not ( = ?auto_99582 ?auto_99580 ) ) ( not ( = ?auto_99582 ?auto_99581 ) ) ( not ( = ?auto_99582 ?auto_99584 ) ) ( not ( = ?auto_99582 ?auto_99585 ) ) ( not ( = ?auto_99582 ?auto_99578 ) ) ( not ( = ?auto_99580 ?auto_99581 ) ) ( not ( = ?auto_99580 ?auto_99584 ) ) ( not ( = ?auto_99580 ?auto_99585 ) ) ( not ( = ?auto_99580 ?auto_99578 ) ) ( not ( = ?auto_99581 ?auto_99584 ) ) ( not ( = ?auto_99581 ?auto_99585 ) ) ( not ( = ?auto_99581 ?auto_99578 ) ) ( not ( = ?auto_99584 ?auto_99585 ) ) ( not ( = ?auto_99584 ?auto_99578 ) ) ( ON ?auto_99578 ?auto_99583 ) ( not ( = ?auto_99578 ?auto_99583 ) ) ( not ( = ?auto_99585 ?auto_99583 ) ) ( not ( = ?auto_99579 ?auto_99583 ) ) ( not ( = ?auto_99582 ?auto_99583 ) ) ( not ( = ?auto_99580 ?auto_99583 ) ) ( not ( = ?auto_99581 ?auto_99583 ) ) ( not ( = ?auto_99584 ?auto_99583 ) ) ( ON ?auto_99585 ?auto_99578 ) ( ON-TABLE ?auto_99583 ) ( ON ?auto_99584 ?auto_99585 ) ( ON ?auto_99581 ?auto_99584 ) ( ON ?auto_99580 ?auto_99581 ) ( CLEAR ?auto_99579 ) ( ON ?auto_99582 ?auto_99580 ) ( CLEAR ?auto_99582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_99583 ?auto_99578 ?auto_99585 ?auto_99584 ?auto_99581 ?auto_99580 )
      ( MAKE-1PILE ?auto_99578 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99586 - BLOCK
    )
    :vars
    (
      ?auto_99587 - BLOCK
      ?auto_99593 - BLOCK
      ?auto_99590 - BLOCK
      ?auto_99589 - BLOCK
      ?auto_99592 - BLOCK
      ?auto_99588 - BLOCK
      ?auto_99591 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99586 ?auto_99587 ) ) ( not ( = ?auto_99593 ?auto_99590 ) ) ( not ( = ?auto_99593 ?auto_99589 ) ) ( not ( = ?auto_99593 ?auto_99592 ) ) ( not ( = ?auto_99593 ?auto_99588 ) ) ( not ( = ?auto_99593 ?auto_99587 ) ) ( not ( = ?auto_99593 ?auto_99586 ) ) ( not ( = ?auto_99590 ?auto_99589 ) ) ( not ( = ?auto_99590 ?auto_99592 ) ) ( not ( = ?auto_99590 ?auto_99588 ) ) ( not ( = ?auto_99590 ?auto_99587 ) ) ( not ( = ?auto_99590 ?auto_99586 ) ) ( not ( = ?auto_99589 ?auto_99592 ) ) ( not ( = ?auto_99589 ?auto_99588 ) ) ( not ( = ?auto_99589 ?auto_99587 ) ) ( not ( = ?auto_99589 ?auto_99586 ) ) ( not ( = ?auto_99592 ?auto_99588 ) ) ( not ( = ?auto_99592 ?auto_99587 ) ) ( not ( = ?auto_99592 ?auto_99586 ) ) ( not ( = ?auto_99588 ?auto_99587 ) ) ( not ( = ?auto_99588 ?auto_99586 ) ) ( ON ?auto_99586 ?auto_99591 ) ( not ( = ?auto_99586 ?auto_99591 ) ) ( not ( = ?auto_99587 ?auto_99591 ) ) ( not ( = ?auto_99593 ?auto_99591 ) ) ( not ( = ?auto_99590 ?auto_99591 ) ) ( not ( = ?auto_99589 ?auto_99591 ) ) ( not ( = ?auto_99592 ?auto_99591 ) ) ( not ( = ?auto_99588 ?auto_99591 ) ) ( ON ?auto_99587 ?auto_99586 ) ( ON-TABLE ?auto_99591 ) ( ON ?auto_99588 ?auto_99587 ) ( ON ?auto_99592 ?auto_99588 ) ( ON ?auto_99589 ?auto_99592 ) ( ON ?auto_99590 ?auto_99589 ) ( CLEAR ?auto_99590 ) ( HOLDING ?auto_99593 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_99593 )
      ( MAKE-1PILE ?auto_99586 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99594 - BLOCK
    )
    :vars
    (
      ?auto_99600 - BLOCK
      ?auto_99598 - BLOCK
      ?auto_99599 - BLOCK
      ?auto_99596 - BLOCK
      ?auto_99597 - BLOCK
      ?auto_99595 - BLOCK
      ?auto_99601 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99594 ?auto_99600 ) ) ( not ( = ?auto_99598 ?auto_99599 ) ) ( not ( = ?auto_99598 ?auto_99596 ) ) ( not ( = ?auto_99598 ?auto_99597 ) ) ( not ( = ?auto_99598 ?auto_99595 ) ) ( not ( = ?auto_99598 ?auto_99600 ) ) ( not ( = ?auto_99598 ?auto_99594 ) ) ( not ( = ?auto_99599 ?auto_99596 ) ) ( not ( = ?auto_99599 ?auto_99597 ) ) ( not ( = ?auto_99599 ?auto_99595 ) ) ( not ( = ?auto_99599 ?auto_99600 ) ) ( not ( = ?auto_99599 ?auto_99594 ) ) ( not ( = ?auto_99596 ?auto_99597 ) ) ( not ( = ?auto_99596 ?auto_99595 ) ) ( not ( = ?auto_99596 ?auto_99600 ) ) ( not ( = ?auto_99596 ?auto_99594 ) ) ( not ( = ?auto_99597 ?auto_99595 ) ) ( not ( = ?auto_99597 ?auto_99600 ) ) ( not ( = ?auto_99597 ?auto_99594 ) ) ( not ( = ?auto_99595 ?auto_99600 ) ) ( not ( = ?auto_99595 ?auto_99594 ) ) ( ON ?auto_99594 ?auto_99601 ) ( not ( = ?auto_99594 ?auto_99601 ) ) ( not ( = ?auto_99600 ?auto_99601 ) ) ( not ( = ?auto_99598 ?auto_99601 ) ) ( not ( = ?auto_99599 ?auto_99601 ) ) ( not ( = ?auto_99596 ?auto_99601 ) ) ( not ( = ?auto_99597 ?auto_99601 ) ) ( not ( = ?auto_99595 ?auto_99601 ) ) ( ON ?auto_99600 ?auto_99594 ) ( ON-TABLE ?auto_99601 ) ( ON ?auto_99595 ?auto_99600 ) ( ON ?auto_99597 ?auto_99595 ) ( ON ?auto_99596 ?auto_99597 ) ( ON ?auto_99599 ?auto_99596 ) ( ON ?auto_99598 ?auto_99599 ) ( CLEAR ?auto_99598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_99601 ?auto_99594 ?auto_99600 ?auto_99595 ?auto_99597 ?auto_99596 ?auto_99599 )
      ( MAKE-1PILE ?auto_99594 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_99607 - BLOCK
      ?auto_99608 - BLOCK
      ?auto_99609 - BLOCK
      ?auto_99610 - BLOCK
      ?auto_99611 - BLOCK
    )
    :vars
    (
      ?auto_99612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99612 ?auto_99611 ) ( CLEAR ?auto_99612 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_99607 ) ( ON ?auto_99608 ?auto_99607 ) ( ON ?auto_99609 ?auto_99608 ) ( ON ?auto_99610 ?auto_99609 ) ( ON ?auto_99611 ?auto_99610 ) ( not ( = ?auto_99607 ?auto_99608 ) ) ( not ( = ?auto_99607 ?auto_99609 ) ) ( not ( = ?auto_99607 ?auto_99610 ) ) ( not ( = ?auto_99607 ?auto_99611 ) ) ( not ( = ?auto_99607 ?auto_99612 ) ) ( not ( = ?auto_99608 ?auto_99609 ) ) ( not ( = ?auto_99608 ?auto_99610 ) ) ( not ( = ?auto_99608 ?auto_99611 ) ) ( not ( = ?auto_99608 ?auto_99612 ) ) ( not ( = ?auto_99609 ?auto_99610 ) ) ( not ( = ?auto_99609 ?auto_99611 ) ) ( not ( = ?auto_99609 ?auto_99612 ) ) ( not ( = ?auto_99610 ?auto_99611 ) ) ( not ( = ?auto_99610 ?auto_99612 ) ) ( not ( = ?auto_99611 ?auto_99612 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_99612 ?auto_99611 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_99613 - BLOCK
      ?auto_99614 - BLOCK
      ?auto_99615 - BLOCK
      ?auto_99616 - BLOCK
      ?auto_99617 - BLOCK
    )
    :vars
    (
      ?auto_99618 - BLOCK
      ?auto_99619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99618 ?auto_99617 ) ( CLEAR ?auto_99618 ) ( ON-TABLE ?auto_99613 ) ( ON ?auto_99614 ?auto_99613 ) ( ON ?auto_99615 ?auto_99614 ) ( ON ?auto_99616 ?auto_99615 ) ( ON ?auto_99617 ?auto_99616 ) ( not ( = ?auto_99613 ?auto_99614 ) ) ( not ( = ?auto_99613 ?auto_99615 ) ) ( not ( = ?auto_99613 ?auto_99616 ) ) ( not ( = ?auto_99613 ?auto_99617 ) ) ( not ( = ?auto_99613 ?auto_99618 ) ) ( not ( = ?auto_99614 ?auto_99615 ) ) ( not ( = ?auto_99614 ?auto_99616 ) ) ( not ( = ?auto_99614 ?auto_99617 ) ) ( not ( = ?auto_99614 ?auto_99618 ) ) ( not ( = ?auto_99615 ?auto_99616 ) ) ( not ( = ?auto_99615 ?auto_99617 ) ) ( not ( = ?auto_99615 ?auto_99618 ) ) ( not ( = ?auto_99616 ?auto_99617 ) ) ( not ( = ?auto_99616 ?auto_99618 ) ) ( not ( = ?auto_99617 ?auto_99618 ) ) ( HOLDING ?auto_99619 ) ( not ( = ?auto_99613 ?auto_99619 ) ) ( not ( = ?auto_99614 ?auto_99619 ) ) ( not ( = ?auto_99615 ?auto_99619 ) ) ( not ( = ?auto_99616 ?auto_99619 ) ) ( not ( = ?auto_99617 ?auto_99619 ) ) ( not ( = ?auto_99618 ?auto_99619 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_99619 )
      ( MAKE-5PILE ?auto_99613 ?auto_99614 ?auto_99615 ?auto_99616 ?auto_99617 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_99620 - BLOCK
      ?auto_99621 - BLOCK
      ?auto_99622 - BLOCK
      ?auto_99623 - BLOCK
      ?auto_99624 - BLOCK
    )
    :vars
    (
      ?auto_99625 - BLOCK
      ?auto_99626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99625 ?auto_99624 ) ( ON-TABLE ?auto_99620 ) ( ON ?auto_99621 ?auto_99620 ) ( ON ?auto_99622 ?auto_99621 ) ( ON ?auto_99623 ?auto_99622 ) ( ON ?auto_99624 ?auto_99623 ) ( not ( = ?auto_99620 ?auto_99621 ) ) ( not ( = ?auto_99620 ?auto_99622 ) ) ( not ( = ?auto_99620 ?auto_99623 ) ) ( not ( = ?auto_99620 ?auto_99624 ) ) ( not ( = ?auto_99620 ?auto_99625 ) ) ( not ( = ?auto_99621 ?auto_99622 ) ) ( not ( = ?auto_99621 ?auto_99623 ) ) ( not ( = ?auto_99621 ?auto_99624 ) ) ( not ( = ?auto_99621 ?auto_99625 ) ) ( not ( = ?auto_99622 ?auto_99623 ) ) ( not ( = ?auto_99622 ?auto_99624 ) ) ( not ( = ?auto_99622 ?auto_99625 ) ) ( not ( = ?auto_99623 ?auto_99624 ) ) ( not ( = ?auto_99623 ?auto_99625 ) ) ( not ( = ?auto_99624 ?auto_99625 ) ) ( not ( = ?auto_99620 ?auto_99626 ) ) ( not ( = ?auto_99621 ?auto_99626 ) ) ( not ( = ?auto_99622 ?auto_99626 ) ) ( not ( = ?auto_99623 ?auto_99626 ) ) ( not ( = ?auto_99624 ?auto_99626 ) ) ( not ( = ?auto_99625 ?auto_99626 ) ) ( ON ?auto_99626 ?auto_99625 ) ( CLEAR ?auto_99626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_99620 ?auto_99621 ?auto_99622 ?auto_99623 ?auto_99624 ?auto_99625 )
      ( MAKE-5PILE ?auto_99620 ?auto_99621 ?auto_99622 ?auto_99623 ?auto_99624 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_99627 - BLOCK
      ?auto_99628 - BLOCK
      ?auto_99629 - BLOCK
      ?auto_99630 - BLOCK
      ?auto_99631 - BLOCK
    )
    :vars
    (
      ?auto_99632 - BLOCK
      ?auto_99633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99632 ?auto_99631 ) ( ON-TABLE ?auto_99627 ) ( ON ?auto_99628 ?auto_99627 ) ( ON ?auto_99629 ?auto_99628 ) ( ON ?auto_99630 ?auto_99629 ) ( ON ?auto_99631 ?auto_99630 ) ( not ( = ?auto_99627 ?auto_99628 ) ) ( not ( = ?auto_99627 ?auto_99629 ) ) ( not ( = ?auto_99627 ?auto_99630 ) ) ( not ( = ?auto_99627 ?auto_99631 ) ) ( not ( = ?auto_99627 ?auto_99632 ) ) ( not ( = ?auto_99628 ?auto_99629 ) ) ( not ( = ?auto_99628 ?auto_99630 ) ) ( not ( = ?auto_99628 ?auto_99631 ) ) ( not ( = ?auto_99628 ?auto_99632 ) ) ( not ( = ?auto_99629 ?auto_99630 ) ) ( not ( = ?auto_99629 ?auto_99631 ) ) ( not ( = ?auto_99629 ?auto_99632 ) ) ( not ( = ?auto_99630 ?auto_99631 ) ) ( not ( = ?auto_99630 ?auto_99632 ) ) ( not ( = ?auto_99631 ?auto_99632 ) ) ( not ( = ?auto_99627 ?auto_99633 ) ) ( not ( = ?auto_99628 ?auto_99633 ) ) ( not ( = ?auto_99629 ?auto_99633 ) ) ( not ( = ?auto_99630 ?auto_99633 ) ) ( not ( = ?auto_99631 ?auto_99633 ) ) ( not ( = ?auto_99632 ?auto_99633 ) ) ( HOLDING ?auto_99633 ) ( CLEAR ?auto_99632 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_99627 ?auto_99628 ?auto_99629 ?auto_99630 ?auto_99631 ?auto_99632 ?auto_99633 )
      ( MAKE-5PILE ?auto_99627 ?auto_99628 ?auto_99629 ?auto_99630 ?auto_99631 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_99634 - BLOCK
      ?auto_99635 - BLOCK
      ?auto_99636 - BLOCK
      ?auto_99637 - BLOCK
      ?auto_99638 - BLOCK
    )
    :vars
    (
      ?auto_99639 - BLOCK
      ?auto_99640 - BLOCK
      ?auto_99641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99639 ?auto_99638 ) ( ON-TABLE ?auto_99634 ) ( ON ?auto_99635 ?auto_99634 ) ( ON ?auto_99636 ?auto_99635 ) ( ON ?auto_99637 ?auto_99636 ) ( ON ?auto_99638 ?auto_99637 ) ( not ( = ?auto_99634 ?auto_99635 ) ) ( not ( = ?auto_99634 ?auto_99636 ) ) ( not ( = ?auto_99634 ?auto_99637 ) ) ( not ( = ?auto_99634 ?auto_99638 ) ) ( not ( = ?auto_99634 ?auto_99639 ) ) ( not ( = ?auto_99635 ?auto_99636 ) ) ( not ( = ?auto_99635 ?auto_99637 ) ) ( not ( = ?auto_99635 ?auto_99638 ) ) ( not ( = ?auto_99635 ?auto_99639 ) ) ( not ( = ?auto_99636 ?auto_99637 ) ) ( not ( = ?auto_99636 ?auto_99638 ) ) ( not ( = ?auto_99636 ?auto_99639 ) ) ( not ( = ?auto_99637 ?auto_99638 ) ) ( not ( = ?auto_99637 ?auto_99639 ) ) ( not ( = ?auto_99638 ?auto_99639 ) ) ( not ( = ?auto_99634 ?auto_99640 ) ) ( not ( = ?auto_99635 ?auto_99640 ) ) ( not ( = ?auto_99636 ?auto_99640 ) ) ( not ( = ?auto_99637 ?auto_99640 ) ) ( not ( = ?auto_99638 ?auto_99640 ) ) ( not ( = ?auto_99639 ?auto_99640 ) ) ( CLEAR ?auto_99639 ) ( ON ?auto_99640 ?auto_99641 ) ( CLEAR ?auto_99640 ) ( HAND-EMPTY ) ( not ( = ?auto_99634 ?auto_99641 ) ) ( not ( = ?auto_99635 ?auto_99641 ) ) ( not ( = ?auto_99636 ?auto_99641 ) ) ( not ( = ?auto_99637 ?auto_99641 ) ) ( not ( = ?auto_99638 ?auto_99641 ) ) ( not ( = ?auto_99639 ?auto_99641 ) ) ( not ( = ?auto_99640 ?auto_99641 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_99640 ?auto_99641 )
      ( MAKE-5PILE ?auto_99634 ?auto_99635 ?auto_99636 ?auto_99637 ?auto_99638 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_99658 - BLOCK
      ?auto_99659 - BLOCK
      ?auto_99660 - BLOCK
      ?auto_99661 - BLOCK
      ?auto_99662 - BLOCK
    )
    :vars
    (
      ?auto_99664 - BLOCK
      ?auto_99663 - BLOCK
      ?auto_99665 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99658 ) ( ON ?auto_99659 ?auto_99658 ) ( ON ?auto_99660 ?auto_99659 ) ( ON ?auto_99661 ?auto_99660 ) ( not ( = ?auto_99658 ?auto_99659 ) ) ( not ( = ?auto_99658 ?auto_99660 ) ) ( not ( = ?auto_99658 ?auto_99661 ) ) ( not ( = ?auto_99658 ?auto_99662 ) ) ( not ( = ?auto_99658 ?auto_99664 ) ) ( not ( = ?auto_99659 ?auto_99660 ) ) ( not ( = ?auto_99659 ?auto_99661 ) ) ( not ( = ?auto_99659 ?auto_99662 ) ) ( not ( = ?auto_99659 ?auto_99664 ) ) ( not ( = ?auto_99660 ?auto_99661 ) ) ( not ( = ?auto_99660 ?auto_99662 ) ) ( not ( = ?auto_99660 ?auto_99664 ) ) ( not ( = ?auto_99661 ?auto_99662 ) ) ( not ( = ?auto_99661 ?auto_99664 ) ) ( not ( = ?auto_99662 ?auto_99664 ) ) ( not ( = ?auto_99658 ?auto_99663 ) ) ( not ( = ?auto_99659 ?auto_99663 ) ) ( not ( = ?auto_99660 ?auto_99663 ) ) ( not ( = ?auto_99661 ?auto_99663 ) ) ( not ( = ?auto_99662 ?auto_99663 ) ) ( not ( = ?auto_99664 ?auto_99663 ) ) ( ON ?auto_99663 ?auto_99665 ) ( not ( = ?auto_99658 ?auto_99665 ) ) ( not ( = ?auto_99659 ?auto_99665 ) ) ( not ( = ?auto_99660 ?auto_99665 ) ) ( not ( = ?auto_99661 ?auto_99665 ) ) ( not ( = ?auto_99662 ?auto_99665 ) ) ( not ( = ?auto_99664 ?auto_99665 ) ) ( not ( = ?auto_99663 ?auto_99665 ) ) ( ON ?auto_99664 ?auto_99663 ) ( CLEAR ?auto_99664 ) ( HOLDING ?auto_99662 ) ( CLEAR ?auto_99661 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_99658 ?auto_99659 ?auto_99660 ?auto_99661 ?auto_99662 ?auto_99664 )
      ( MAKE-5PILE ?auto_99658 ?auto_99659 ?auto_99660 ?auto_99661 ?auto_99662 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_99666 - BLOCK
      ?auto_99667 - BLOCK
      ?auto_99668 - BLOCK
      ?auto_99669 - BLOCK
      ?auto_99670 - BLOCK
    )
    :vars
    (
      ?auto_99671 - BLOCK
      ?auto_99672 - BLOCK
      ?auto_99673 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99666 ) ( ON ?auto_99667 ?auto_99666 ) ( ON ?auto_99668 ?auto_99667 ) ( ON ?auto_99669 ?auto_99668 ) ( not ( = ?auto_99666 ?auto_99667 ) ) ( not ( = ?auto_99666 ?auto_99668 ) ) ( not ( = ?auto_99666 ?auto_99669 ) ) ( not ( = ?auto_99666 ?auto_99670 ) ) ( not ( = ?auto_99666 ?auto_99671 ) ) ( not ( = ?auto_99667 ?auto_99668 ) ) ( not ( = ?auto_99667 ?auto_99669 ) ) ( not ( = ?auto_99667 ?auto_99670 ) ) ( not ( = ?auto_99667 ?auto_99671 ) ) ( not ( = ?auto_99668 ?auto_99669 ) ) ( not ( = ?auto_99668 ?auto_99670 ) ) ( not ( = ?auto_99668 ?auto_99671 ) ) ( not ( = ?auto_99669 ?auto_99670 ) ) ( not ( = ?auto_99669 ?auto_99671 ) ) ( not ( = ?auto_99670 ?auto_99671 ) ) ( not ( = ?auto_99666 ?auto_99672 ) ) ( not ( = ?auto_99667 ?auto_99672 ) ) ( not ( = ?auto_99668 ?auto_99672 ) ) ( not ( = ?auto_99669 ?auto_99672 ) ) ( not ( = ?auto_99670 ?auto_99672 ) ) ( not ( = ?auto_99671 ?auto_99672 ) ) ( ON ?auto_99672 ?auto_99673 ) ( not ( = ?auto_99666 ?auto_99673 ) ) ( not ( = ?auto_99667 ?auto_99673 ) ) ( not ( = ?auto_99668 ?auto_99673 ) ) ( not ( = ?auto_99669 ?auto_99673 ) ) ( not ( = ?auto_99670 ?auto_99673 ) ) ( not ( = ?auto_99671 ?auto_99673 ) ) ( not ( = ?auto_99672 ?auto_99673 ) ) ( ON ?auto_99671 ?auto_99672 ) ( CLEAR ?auto_99669 ) ( ON ?auto_99670 ?auto_99671 ) ( CLEAR ?auto_99670 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_99673 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_99673 ?auto_99672 ?auto_99671 )
      ( MAKE-5PILE ?auto_99666 ?auto_99667 ?auto_99668 ?auto_99669 ?auto_99670 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_99674 - BLOCK
      ?auto_99675 - BLOCK
      ?auto_99676 - BLOCK
      ?auto_99677 - BLOCK
      ?auto_99678 - BLOCK
    )
    :vars
    (
      ?auto_99679 - BLOCK
      ?auto_99680 - BLOCK
      ?auto_99681 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99674 ) ( ON ?auto_99675 ?auto_99674 ) ( ON ?auto_99676 ?auto_99675 ) ( not ( = ?auto_99674 ?auto_99675 ) ) ( not ( = ?auto_99674 ?auto_99676 ) ) ( not ( = ?auto_99674 ?auto_99677 ) ) ( not ( = ?auto_99674 ?auto_99678 ) ) ( not ( = ?auto_99674 ?auto_99679 ) ) ( not ( = ?auto_99675 ?auto_99676 ) ) ( not ( = ?auto_99675 ?auto_99677 ) ) ( not ( = ?auto_99675 ?auto_99678 ) ) ( not ( = ?auto_99675 ?auto_99679 ) ) ( not ( = ?auto_99676 ?auto_99677 ) ) ( not ( = ?auto_99676 ?auto_99678 ) ) ( not ( = ?auto_99676 ?auto_99679 ) ) ( not ( = ?auto_99677 ?auto_99678 ) ) ( not ( = ?auto_99677 ?auto_99679 ) ) ( not ( = ?auto_99678 ?auto_99679 ) ) ( not ( = ?auto_99674 ?auto_99680 ) ) ( not ( = ?auto_99675 ?auto_99680 ) ) ( not ( = ?auto_99676 ?auto_99680 ) ) ( not ( = ?auto_99677 ?auto_99680 ) ) ( not ( = ?auto_99678 ?auto_99680 ) ) ( not ( = ?auto_99679 ?auto_99680 ) ) ( ON ?auto_99680 ?auto_99681 ) ( not ( = ?auto_99674 ?auto_99681 ) ) ( not ( = ?auto_99675 ?auto_99681 ) ) ( not ( = ?auto_99676 ?auto_99681 ) ) ( not ( = ?auto_99677 ?auto_99681 ) ) ( not ( = ?auto_99678 ?auto_99681 ) ) ( not ( = ?auto_99679 ?auto_99681 ) ) ( not ( = ?auto_99680 ?auto_99681 ) ) ( ON ?auto_99679 ?auto_99680 ) ( ON ?auto_99678 ?auto_99679 ) ( CLEAR ?auto_99678 ) ( ON-TABLE ?auto_99681 ) ( HOLDING ?auto_99677 ) ( CLEAR ?auto_99676 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_99674 ?auto_99675 ?auto_99676 ?auto_99677 )
      ( MAKE-5PILE ?auto_99674 ?auto_99675 ?auto_99676 ?auto_99677 ?auto_99678 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_99682 - BLOCK
      ?auto_99683 - BLOCK
      ?auto_99684 - BLOCK
      ?auto_99685 - BLOCK
      ?auto_99686 - BLOCK
    )
    :vars
    (
      ?auto_99689 - BLOCK
      ?auto_99688 - BLOCK
      ?auto_99687 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99682 ) ( ON ?auto_99683 ?auto_99682 ) ( ON ?auto_99684 ?auto_99683 ) ( not ( = ?auto_99682 ?auto_99683 ) ) ( not ( = ?auto_99682 ?auto_99684 ) ) ( not ( = ?auto_99682 ?auto_99685 ) ) ( not ( = ?auto_99682 ?auto_99686 ) ) ( not ( = ?auto_99682 ?auto_99689 ) ) ( not ( = ?auto_99683 ?auto_99684 ) ) ( not ( = ?auto_99683 ?auto_99685 ) ) ( not ( = ?auto_99683 ?auto_99686 ) ) ( not ( = ?auto_99683 ?auto_99689 ) ) ( not ( = ?auto_99684 ?auto_99685 ) ) ( not ( = ?auto_99684 ?auto_99686 ) ) ( not ( = ?auto_99684 ?auto_99689 ) ) ( not ( = ?auto_99685 ?auto_99686 ) ) ( not ( = ?auto_99685 ?auto_99689 ) ) ( not ( = ?auto_99686 ?auto_99689 ) ) ( not ( = ?auto_99682 ?auto_99688 ) ) ( not ( = ?auto_99683 ?auto_99688 ) ) ( not ( = ?auto_99684 ?auto_99688 ) ) ( not ( = ?auto_99685 ?auto_99688 ) ) ( not ( = ?auto_99686 ?auto_99688 ) ) ( not ( = ?auto_99689 ?auto_99688 ) ) ( ON ?auto_99688 ?auto_99687 ) ( not ( = ?auto_99682 ?auto_99687 ) ) ( not ( = ?auto_99683 ?auto_99687 ) ) ( not ( = ?auto_99684 ?auto_99687 ) ) ( not ( = ?auto_99685 ?auto_99687 ) ) ( not ( = ?auto_99686 ?auto_99687 ) ) ( not ( = ?auto_99689 ?auto_99687 ) ) ( not ( = ?auto_99688 ?auto_99687 ) ) ( ON ?auto_99689 ?auto_99688 ) ( ON ?auto_99686 ?auto_99689 ) ( ON-TABLE ?auto_99687 ) ( CLEAR ?auto_99684 ) ( ON ?auto_99685 ?auto_99686 ) ( CLEAR ?auto_99685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_99687 ?auto_99688 ?auto_99689 ?auto_99686 )
      ( MAKE-5PILE ?auto_99682 ?auto_99683 ?auto_99684 ?auto_99685 ?auto_99686 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_99690 - BLOCK
      ?auto_99691 - BLOCK
      ?auto_99692 - BLOCK
      ?auto_99693 - BLOCK
      ?auto_99694 - BLOCK
    )
    :vars
    (
      ?auto_99696 - BLOCK
      ?auto_99695 - BLOCK
      ?auto_99697 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99690 ) ( ON ?auto_99691 ?auto_99690 ) ( not ( = ?auto_99690 ?auto_99691 ) ) ( not ( = ?auto_99690 ?auto_99692 ) ) ( not ( = ?auto_99690 ?auto_99693 ) ) ( not ( = ?auto_99690 ?auto_99694 ) ) ( not ( = ?auto_99690 ?auto_99696 ) ) ( not ( = ?auto_99691 ?auto_99692 ) ) ( not ( = ?auto_99691 ?auto_99693 ) ) ( not ( = ?auto_99691 ?auto_99694 ) ) ( not ( = ?auto_99691 ?auto_99696 ) ) ( not ( = ?auto_99692 ?auto_99693 ) ) ( not ( = ?auto_99692 ?auto_99694 ) ) ( not ( = ?auto_99692 ?auto_99696 ) ) ( not ( = ?auto_99693 ?auto_99694 ) ) ( not ( = ?auto_99693 ?auto_99696 ) ) ( not ( = ?auto_99694 ?auto_99696 ) ) ( not ( = ?auto_99690 ?auto_99695 ) ) ( not ( = ?auto_99691 ?auto_99695 ) ) ( not ( = ?auto_99692 ?auto_99695 ) ) ( not ( = ?auto_99693 ?auto_99695 ) ) ( not ( = ?auto_99694 ?auto_99695 ) ) ( not ( = ?auto_99696 ?auto_99695 ) ) ( ON ?auto_99695 ?auto_99697 ) ( not ( = ?auto_99690 ?auto_99697 ) ) ( not ( = ?auto_99691 ?auto_99697 ) ) ( not ( = ?auto_99692 ?auto_99697 ) ) ( not ( = ?auto_99693 ?auto_99697 ) ) ( not ( = ?auto_99694 ?auto_99697 ) ) ( not ( = ?auto_99696 ?auto_99697 ) ) ( not ( = ?auto_99695 ?auto_99697 ) ) ( ON ?auto_99696 ?auto_99695 ) ( ON ?auto_99694 ?auto_99696 ) ( ON-TABLE ?auto_99697 ) ( ON ?auto_99693 ?auto_99694 ) ( CLEAR ?auto_99693 ) ( HOLDING ?auto_99692 ) ( CLEAR ?auto_99691 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_99690 ?auto_99691 ?auto_99692 )
      ( MAKE-5PILE ?auto_99690 ?auto_99691 ?auto_99692 ?auto_99693 ?auto_99694 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_99698 - BLOCK
      ?auto_99699 - BLOCK
      ?auto_99700 - BLOCK
      ?auto_99701 - BLOCK
      ?auto_99702 - BLOCK
    )
    :vars
    (
      ?auto_99703 - BLOCK
      ?auto_99705 - BLOCK
      ?auto_99704 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99698 ) ( ON ?auto_99699 ?auto_99698 ) ( not ( = ?auto_99698 ?auto_99699 ) ) ( not ( = ?auto_99698 ?auto_99700 ) ) ( not ( = ?auto_99698 ?auto_99701 ) ) ( not ( = ?auto_99698 ?auto_99702 ) ) ( not ( = ?auto_99698 ?auto_99703 ) ) ( not ( = ?auto_99699 ?auto_99700 ) ) ( not ( = ?auto_99699 ?auto_99701 ) ) ( not ( = ?auto_99699 ?auto_99702 ) ) ( not ( = ?auto_99699 ?auto_99703 ) ) ( not ( = ?auto_99700 ?auto_99701 ) ) ( not ( = ?auto_99700 ?auto_99702 ) ) ( not ( = ?auto_99700 ?auto_99703 ) ) ( not ( = ?auto_99701 ?auto_99702 ) ) ( not ( = ?auto_99701 ?auto_99703 ) ) ( not ( = ?auto_99702 ?auto_99703 ) ) ( not ( = ?auto_99698 ?auto_99705 ) ) ( not ( = ?auto_99699 ?auto_99705 ) ) ( not ( = ?auto_99700 ?auto_99705 ) ) ( not ( = ?auto_99701 ?auto_99705 ) ) ( not ( = ?auto_99702 ?auto_99705 ) ) ( not ( = ?auto_99703 ?auto_99705 ) ) ( ON ?auto_99705 ?auto_99704 ) ( not ( = ?auto_99698 ?auto_99704 ) ) ( not ( = ?auto_99699 ?auto_99704 ) ) ( not ( = ?auto_99700 ?auto_99704 ) ) ( not ( = ?auto_99701 ?auto_99704 ) ) ( not ( = ?auto_99702 ?auto_99704 ) ) ( not ( = ?auto_99703 ?auto_99704 ) ) ( not ( = ?auto_99705 ?auto_99704 ) ) ( ON ?auto_99703 ?auto_99705 ) ( ON ?auto_99702 ?auto_99703 ) ( ON-TABLE ?auto_99704 ) ( ON ?auto_99701 ?auto_99702 ) ( CLEAR ?auto_99699 ) ( ON ?auto_99700 ?auto_99701 ) ( CLEAR ?auto_99700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99704 ?auto_99705 ?auto_99703 ?auto_99702 ?auto_99701 )
      ( MAKE-5PILE ?auto_99698 ?auto_99699 ?auto_99700 ?auto_99701 ?auto_99702 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_99706 - BLOCK
      ?auto_99707 - BLOCK
      ?auto_99708 - BLOCK
      ?auto_99709 - BLOCK
      ?auto_99710 - BLOCK
    )
    :vars
    (
      ?auto_99713 - BLOCK
      ?auto_99712 - BLOCK
      ?auto_99711 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99706 ) ( not ( = ?auto_99706 ?auto_99707 ) ) ( not ( = ?auto_99706 ?auto_99708 ) ) ( not ( = ?auto_99706 ?auto_99709 ) ) ( not ( = ?auto_99706 ?auto_99710 ) ) ( not ( = ?auto_99706 ?auto_99713 ) ) ( not ( = ?auto_99707 ?auto_99708 ) ) ( not ( = ?auto_99707 ?auto_99709 ) ) ( not ( = ?auto_99707 ?auto_99710 ) ) ( not ( = ?auto_99707 ?auto_99713 ) ) ( not ( = ?auto_99708 ?auto_99709 ) ) ( not ( = ?auto_99708 ?auto_99710 ) ) ( not ( = ?auto_99708 ?auto_99713 ) ) ( not ( = ?auto_99709 ?auto_99710 ) ) ( not ( = ?auto_99709 ?auto_99713 ) ) ( not ( = ?auto_99710 ?auto_99713 ) ) ( not ( = ?auto_99706 ?auto_99712 ) ) ( not ( = ?auto_99707 ?auto_99712 ) ) ( not ( = ?auto_99708 ?auto_99712 ) ) ( not ( = ?auto_99709 ?auto_99712 ) ) ( not ( = ?auto_99710 ?auto_99712 ) ) ( not ( = ?auto_99713 ?auto_99712 ) ) ( ON ?auto_99712 ?auto_99711 ) ( not ( = ?auto_99706 ?auto_99711 ) ) ( not ( = ?auto_99707 ?auto_99711 ) ) ( not ( = ?auto_99708 ?auto_99711 ) ) ( not ( = ?auto_99709 ?auto_99711 ) ) ( not ( = ?auto_99710 ?auto_99711 ) ) ( not ( = ?auto_99713 ?auto_99711 ) ) ( not ( = ?auto_99712 ?auto_99711 ) ) ( ON ?auto_99713 ?auto_99712 ) ( ON ?auto_99710 ?auto_99713 ) ( ON-TABLE ?auto_99711 ) ( ON ?auto_99709 ?auto_99710 ) ( ON ?auto_99708 ?auto_99709 ) ( CLEAR ?auto_99708 ) ( HOLDING ?auto_99707 ) ( CLEAR ?auto_99706 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_99706 ?auto_99707 )
      ( MAKE-5PILE ?auto_99706 ?auto_99707 ?auto_99708 ?auto_99709 ?auto_99710 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_99714 - BLOCK
      ?auto_99715 - BLOCK
      ?auto_99716 - BLOCK
      ?auto_99717 - BLOCK
      ?auto_99718 - BLOCK
    )
    :vars
    (
      ?auto_99720 - BLOCK
      ?auto_99721 - BLOCK
      ?auto_99719 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99714 ) ( not ( = ?auto_99714 ?auto_99715 ) ) ( not ( = ?auto_99714 ?auto_99716 ) ) ( not ( = ?auto_99714 ?auto_99717 ) ) ( not ( = ?auto_99714 ?auto_99718 ) ) ( not ( = ?auto_99714 ?auto_99720 ) ) ( not ( = ?auto_99715 ?auto_99716 ) ) ( not ( = ?auto_99715 ?auto_99717 ) ) ( not ( = ?auto_99715 ?auto_99718 ) ) ( not ( = ?auto_99715 ?auto_99720 ) ) ( not ( = ?auto_99716 ?auto_99717 ) ) ( not ( = ?auto_99716 ?auto_99718 ) ) ( not ( = ?auto_99716 ?auto_99720 ) ) ( not ( = ?auto_99717 ?auto_99718 ) ) ( not ( = ?auto_99717 ?auto_99720 ) ) ( not ( = ?auto_99718 ?auto_99720 ) ) ( not ( = ?auto_99714 ?auto_99721 ) ) ( not ( = ?auto_99715 ?auto_99721 ) ) ( not ( = ?auto_99716 ?auto_99721 ) ) ( not ( = ?auto_99717 ?auto_99721 ) ) ( not ( = ?auto_99718 ?auto_99721 ) ) ( not ( = ?auto_99720 ?auto_99721 ) ) ( ON ?auto_99721 ?auto_99719 ) ( not ( = ?auto_99714 ?auto_99719 ) ) ( not ( = ?auto_99715 ?auto_99719 ) ) ( not ( = ?auto_99716 ?auto_99719 ) ) ( not ( = ?auto_99717 ?auto_99719 ) ) ( not ( = ?auto_99718 ?auto_99719 ) ) ( not ( = ?auto_99720 ?auto_99719 ) ) ( not ( = ?auto_99721 ?auto_99719 ) ) ( ON ?auto_99720 ?auto_99721 ) ( ON ?auto_99718 ?auto_99720 ) ( ON-TABLE ?auto_99719 ) ( ON ?auto_99717 ?auto_99718 ) ( ON ?auto_99716 ?auto_99717 ) ( CLEAR ?auto_99714 ) ( ON ?auto_99715 ?auto_99716 ) ( CLEAR ?auto_99715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_99719 ?auto_99721 ?auto_99720 ?auto_99718 ?auto_99717 ?auto_99716 )
      ( MAKE-5PILE ?auto_99714 ?auto_99715 ?auto_99716 ?auto_99717 ?auto_99718 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_99722 - BLOCK
      ?auto_99723 - BLOCK
      ?auto_99724 - BLOCK
      ?auto_99725 - BLOCK
      ?auto_99726 - BLOCK
    )
    :vars
    (
      ?auto_99728 - BLOCK
      ?auto_99729 - BLOCK
      ?auto_99727 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99722 ?auto_99723 ) ) ( not ( = ?auto_99722 ?auto_99724 ) ) ( not ( = ?auto_99722 ?auto_99725 ) ) ( not ( = ?auto_99722 ?auto_99726 ) ) ( not ( = ?auto_99722 ?auto_99728 ) ) ( not ( = ?auto_99723 ?auto_99724 ) ) ( not ( = ?auto_99723 ?auto_99725 ) ) ( not ( = ?auto_99723 ?auto_99726 ) ) ( not ( = ?auto_99723 ?auto_99728 ) ) ( not ( = ?auto_99724 ?auto_99725 ) ) ( not ( = ?auto_99724 ?auto_99726 ) ) ( not ( = ?auto_99724 ?auto_99728 ) ) ( not ( = ?auto_99725 ?auto_99726 ) ) ( not ( = ?auto_99725 ?auto_99728 ) ) ( not ( = ?auto_99726 ?auto_99728 ) ) ( not ( = ?auto_99722 ?auto_99729 ) ) ( not ( = ?auto_99723 ?auto_99729 ) ) ( not ( = ?auto_99724 ?auto_99729 ) ) ( not ( = ?auto_99725 ?auto_99729 ) ) ( not ( = ?auto_99726 ?auto_99729 ) ) ( not ( = ?auto_99728 ?auto_99729 ) ) ( ON ?auto_99729 ?auto_99727 ) ( not ( = ?auto_99722 ?auto_99727 ) ) ( not ( = ?auto_99723 ?auto_99727 ) ) ( not ( = ?auto_99724 ?auto_99727 ) ) ( not ( = ?auto_99725 ?auto_99727 ) ) ( not ( = ?auto_99726 ?auto_99727 ) ) ( not ( = ?auto_99728 ?auto_99727 ) ) ( not ( = ?auto_99729 ?auto_99727 ) ) ( ON ?auto_99728 ?auto_99729 ) ( ON ?auto_99726 ?auto_99728 ) ( ON-TABLE ?auto_99727 ) ( ON ?auto_99725 ?auto_99726 ) ( ON ?auto_99724 ?auto_99725 ) ( ON ?auto_99723 ?auto_99724 ) ( CLEAR ?auto_99723 ) ( HOLDING ?auto_99722 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_99722 )
      ( MAKE-5PILE ?auto_99722 ?auto_99723 ?auto_99724 ?auto_99725 ?auto_99726 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_99730 - BLOCK
      ?auto_99731 - BLOCK
      ?auto_99732 - BLOCK
      ?auto_99733 - BLOCK
      ?auto_99734 - BLOCK
    )
    :vars
    (
      ?auto_99736 - BLOCK
      ?auto_99737 - BLOCK
      ?auto_99735 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99730 ?auto_99731 ) ) ( not ( = ?auto_99730 ?auto_99732 ) ) ( not ( = ?auto_99730 ?auto_99733 ) ) ( not ( = ?auto_99730 ?auto_99734 ) ) ( not ( = ?auto_99730 ?auto_99736 ) ) ( not ( = ?auto_99731 ?auto_99732 ) ) ( not ( = ?auto_99731 ?auto_99733 ) ) ( not ( = ?auto_99731 ?auto_99734 ) ) ( not ( = ?auto_99731 ?auto_99736 ) ) ( not ( = ?auto_99732 ?auto_99733 ) ) ( not ( = ?auto_99732 ?auto_99734 ) ) ( not ( = ?auto_99732 ?auto_99736 ) ) ( not ( = ?auto_99733 ?auto_99734 ) ) ( not ( = ?auto_99733 ?auto_99736 ) ) ( not ( = ?auto_99734 ?auto_99736 ) ) ( not ( = ?auto_99730 ?auto_99737 ) ) ( not ( = ?auto_99731 ?auto_99737 ) ) ( not ( = ?auto_99732 ?auto_99737 ) ) ( not ( = ?auto_99733 ?auto_99737 ) ) ( not ( = ?auto_99734 ?auto_99737 ) ) ( not ( = ?auto_99736 ?auto_99737 ) ) ( ON ?auto_99737 ?auto_99735 ) ( not ( = ?auto_99730 ?auto_99735 ) ) ( not ( = ?auto_99731 ?auto_99735 ) ) ( not ( = ?auto_99732 ?auto_99735 ) ) ( not ( = ?auto_99733 ?auto_99735 ) ) ( not ( = ?auto_99734 ?auto_99735 ) ) ( not ( = ?auto_99736 ?auto_99735 ) ) ( not ( = ?auto_99737 ?auto_99735 ) ) ( ON ?auto_99736 ?auto_99737 ) ( ON ?auto_99734 ?auto_99736 ) ( ON-TABLE ?auto_99735 ) ( ON ?auto_99733 ?auto_99734 ) ( ON ?auto_99732 ?auto_99733 ) ( ON ?auto_99731 ?auto_99732 ) ( ON ?auto_99730 ?auto_99731 ) ( CLEAR ?auto_99730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_99735 ?auto_99737 ?auto_99736 ?auto_99734 ?auto_99733 ?auto_99732 ?auto_99731 )
      ( MAKE-5PILE ?auto_99730 ?auto_99731 ?auto_99732 ?auto_99733 ?auto_99734 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99740 - BLOCK
      ?auto_99741 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_99741 ) ( CLEAR ?auto_99740 ) ( ON-TABLE ?auto_99740 ) ( not ( = ?auto_99740 ?auto_99741 ) ) )
    :subtasks
    ( ( !STACK ?auto_99741 ?auto_99740 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99742 - BLOCK
      ?auto_99743 - BLOCK
    )
    :vars
    (
      ?auto_99744 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_99742 ) ( ON-TABLE ?auto_99742 ) ( not ( = ?auto_99742 ?auto_99743 ) ) ( ON ?auto_99743 ?auto_99744 ) ( CLEAR ?auto_99743 ) ( HAND-EMPTY ) ( not ( = ?auto_99742 ?auto_99744 ) ) ( not ( = ?auto_99743 ?auto_99744 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_99743 ?auto_99744 )
      ( MAKE-2PILE ?auto_99742 ?auto_99743 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99745 - BLOCK
      ?auto_99746 - BLOCK
    )
    :vars
    (
      ?auto_99747 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99745 ?auto_99746 ) ) ( ON ?auto_99746 ?auto_99747 ) ( CLEAR ?auto_99746 ) ( not ( = ?auto_99745 ?auto_99747 ) ) ( not ( = ?auto_99746 ?auto_99747 ) ) ( HOLDING ?auto_99745 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_99745 )
      ( MAKE-2PILE ?auto_99745 ?auto_99746 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99748 - BLOCK
      ?auto_99749 - BLOCK
    )
    :vars
    (
      ?auto_99750 - BLOCK
      ?auto_99752 - BLOCK
      ?auto_99753 - BLOCK
      ?auto_99751 - BLOCK
      ?auto_99754 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99748 ?auto_99749 ) ) ( ON ?auto_99749 ?auto_99750 ) ( not ( = ?auto_99748 ?auto_99750 ) ) ( not ( = ?auto_99749 ?auto_99750 ) ) ( ON ?auto_99748 ?auto_99749 ) ( CLEAR ?auto_99748 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_99752 ) ( ON ?auto_99753 ?auto_99752 ) ( ON ?auto_99751 ?auto_99753 ) ( ON ?auto_99754 ?auto_99751 ) ( ON ?auto_99750 ?auto_99754 ) ( not ( = ?auto_99752 ?auto_99753 ) ) ( not ( = ?auto_99752 ?auto_99751 ) ) ( not ( = ?auto_99752 ?auto_99754 ) ) ( not ( = ?auto_99752 ?auto_99750 ) ) ( not ( = ?auto_99752 ?auto_99749 ) ) ( not ( = ?auto_99752 ?auto_99748 ) ) ( not ( = ?auto_99753 ?auto_99751 ) ) ( not ( = ?auto_99753 ?auto_99754 ) ) ( not ( = ?auto_99753 ?auto_99750 ) ) ( not ( = ?auto_99753 ?auto_99749 ) ) ( not ( = ?auto_99753 ?auto_99748 ) ) ( not ( = ?auto_99751 ?auto_99754 ) ) ( not ( = ?auto_99751 ?auto_99750 ) ) ( not ( = ?auto_99751 ?auto_99749 ) ) ( not ( = ?auto_99751 ?auto_99748 ) ) ( not ( = ?auto_99754 ?auto_99750 ) ) ( not ( = ?auto_99754 ?auto_99749 ) ) ( not ( = ?auto_99754 ?auto_99748 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_99752 ?auto_99753 ?auto_99751 ?auto_99754 ?auto_99750 ?auto_99749 )
      ( MAKE-2PILE ?auto_99748 ?auto_99749 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99755 - BLOCK
      ?auto_99756 - BLOCK
    )
    :vars
    (
      ?auto_99760 - BLOCK
      ?auto_99761 - BLOCK
      ?auto_99759 - BLOCK
      ?auto_99757 - BLOCK
      ?auto_99758 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99755 ?auto_99756 ) ) ( ON ?auto_99756 ?auto_99760 ) ( not ( = ?auto_99755 ?auto_99760 ) ) ( not ( = ?auto_99756 ?auto_99760 ) ) ( ON-TABLE ?auto_99761 ) ( ON ?auto_99759 ?auto_99761 ) ( ON ?auto_99757 ?auto_99759 ) ( ON ?auto_99758 ?auto_99757 ) ( ON ?auto_99760 ?auto_99758 ) ( not ( = ?auto_99761 ?auto_99759 ) ) ( not ( = ?auto_99761 ?auto_99757 ) ) ( not ( = ?auto_99761 ?auto_99758 ) ) ( not ( = ?auto_99761 ?auto_99760 ) ) ( not ( = ?auto_99761 ?auto_99756 ) ) ( not ( = ?auto_99761 ?auto_99755 ) ) ( not ( = ?auto_99759 ?auto_99757 ) ) ( not ( = ?auto_99759 ?auto_99758 ) ) ( not ( = ?auto_99759 ?auto_99760 ) ) ( not ( = ?auto_99759 ?auto_99756 ) ) ( not ( = ?auto_99759 ?auto_99755 ) ) ( not ( = ?auto_99757 ?auto_99758 ) ) ( not ( = ?auto_99757 ?auto_99760 ) ) ( not ( = ?auto_99757 ?auto_99756 ) ) ( not ( = ?auto_99757 ?auto_99755 ) ) ( not ( = ?auto_99758 ?auto_99760 ) ) ( not ( = ?auto_99758 ?auto_99756 ) ) ( not ( = ?auto_99758 ?auto_99755 ) ) ( HOLDING ?auto_99755 ) ( CLEAR ?auto_99756 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_99761 ?auto_99759 ?auto_99757 ?auto_99758 ?auto_99760 ?auto_99756 ?auto_99755 )
      ( MAKE-2PILE ?auto_99755 ?auto_99756 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99762 - BLOCK
      ?auto_99763 - BLOCK
    )
    :vars
    (
      ?auto_99765 - BLOCK
      ?auto_99766 - BLOCK
      ?auto_99768 - BLOCK
      ?auto_99764 - BLOCK
      ?auto_99767 - BLOCK
      ?auto_99769 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99762 ?auto_99763 ) ) ( ON ?auto_99763 ?auto_99765 ) ( not ( = ?auto_99762 ?auto_99765 ) ) ( not ( = ?auto_99763 ?auto_99765 ) ) ( ON-TABLE ?auto_99766 ) ( ON ?auto_99768 ?auto_99766 ) ( ON ?auto_99764 ?auto_99768 ) ( ON ?auto_99767 ?auto_99764 ) ( ON ?auto_99765 ?auto_99767 ) ( not ( = ?auto_99766 ?auto_99768 ) ) ( not ( = ?auto_99766 ?auto_99764 ) ) ( not ( = ?auto_99766 ?auto_99767 ) ) ( not ( = ?auto_99766 ?auto_99765 ) ) ( not ( = ?auto_99766 ?auto_99763 ) ) ( not ( = ?auto_99766 ?auto_99762 ) ) ( not ( = ?auto_99768 ?auto_99764 ) ) ( not ( = ?auto_99768 ?auto_99767 ) ) ( not ( = ?auto_99768 ?auto_99765 ) ) ( not ( = ?auto_99768 ?auto_99763 ) ) ( not ( = ?auto_99768 ?auto_99762 ) ) ( not ( = ?auto_99764 ?auto_99767 ) ) ( not ( = ?auto_99764 ?auto_99765 ) ) ( not ( = ?auto_99764 ?auto_99763 ) ) ( not ( = ?auto_99764 ?auto_99762 ) ) ( not ( = ?auto_99767 ?auto_99765 ) ) ( not ( = ?auto_99767 ?auto_99763 ) ) ( not ( = ?auto_99767 ?auto_99762 ) ) ( CLEAR ?auto_99763 ) ( ON ?auto_99762 ?auto_99769 ) ( CLEAR ?auto_99762 ) ( HAND-EMPTY ) ( not ( = ?auto_99762 ?auto_99769 ) ) ( not ( = ?auto_99763 ?auto_99769 ) ) ( not ( = ?auto_99765 ?auto_99769 ) ) ( not ( = ?auto_99766 ?auto_99769 ) ) ( not ( = ?auto_99768 ?auto_99769 ) ) ( not ( = ?auto_99764 ?auto_99769 ) ) ( not ( = ?auto_99767 ?auto_99769 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_99762 ?auto_99769 )
      ( MAKE-2PILE ?auto_99762 ?auto_99763 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99770 - BLOCK
      ?auto_99771 - BLOCK
    )
    :vars
    (
      ?auto_99775 - BLOCK
      ?auto_99776 - BLOCK
      ?auto_99773 - BLOCK
      ?auto_99774 - BLOCK
      ?auto_99777 - BLOCK
      ?auto_99772 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99770 ?auto_99771 ) ) ( not ( = ?auto_99770 ?auto_99775 ) ) ( not ( = ?auto_99771 ?auto_99775 ) ) ( ON-TABLE ?auto_99776 ) ( ON ?auto_99773 ?auto_99776 ) ( ON ?auto_99774 ?auto_99773 ) ( ON ?auto_99777 ?auto_99774 ) ( ON ?auto_99775 ?auto_99777 ) ( not ( = ?auto_99776 ?auto_99773 ) ) ( not ( = ?auto_99776 ?auto_99774 ) ) ( not ( = ?auto_99776 ?auto_99777 ) ) ( not ( = ?auto_99776 ?auto_99775 ) ) ( not ( = ?auto_99776 ?auto_99771 ) ) ( not ( = ?auto_99776 ?auto_99770 ) ) ( not ( = ?auto_99773 ?auto_99774 ) ) ( not ( = ?auto_99773 ?auto_99777 ) ) ( not ( = ?auto_99773 ?auto_99775 ) ) ( not ( = ?auto_99773 ?auto_99771 ) ) ( not ( = ?auto_99773 ?auto_99770 ) ) ( not ( = ?auto_99774 ?auto_99777 ) ) ( not ( = ?auto_99774 ?auto_99775 ) ) ( not ( = ?auto_99774 ?auto_99771 ) ) ( not ( = ?auto_99774 ?auto_99770 ) ) ( not ( = ?auto_99777 ?auto_99775 ) ) ( not ( = ?auto_99777 ?auto_99771 ) ) ( not ( = ?auto_99777 ?auto_99770 ) ) ( ON ?auto_99770 ?auto_99772 ) ( CLEAR ?auto_99770 ) ( not ( = ?auto_99770 ?auto_99772 ) ) ( not ( = ?auto_99771 ?auto_99772 ) ) ( not ( = ?auto_99775 ?auto_99772 ) ) ( not ( = ?auto_99776 ?auto_99772 ) ) ( not ( = ?auto_99773 ?auto_99772 ) ) ( not ( = ?auto_99774 ?auto_99772 ) ) ( not ( = ?auto_99777 ?auto_99772 ) ) ( HOLDING ?auto_99771 ) ( CLEAR ?auto_99775 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_99776 ?auto_99773 ?auto_99774 ?auto_99777 ?auto_99775 ?auto_99771 )
      ( MAKE-2PILE ?auto_99770 ?auto_99771 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99778 - BLOCK
      ?auto_99779 - BLOCK
    )
    :vars
    (
      ?auto_99781 - BLOCK
      ?auto_99784 - BLOCK
      ?auto_99780 - BLOCK
      ?auto_99785 - BLOCK
      ?auto_99782 - BLOCK
      ?auto_99783 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99778 ?auto_99779 ) ) ( not ( = ?auto_99778 ?auto_99781 ) ) ( not ( = ?auto_99779 ?auto_99781 ) ) ( ON-TABLE ?auto_99784 ) ( ON ?auto_99780 ?auto_99784 ) ( ON ?auto_99785 ?auto_99780 ) ( ON ?auto_99782 ?auto_99785 ) ( ON ?auto_99781 ?auto_99782 ) ( not ( = ?auto_99784 ?auto_99780 ) ) ( not ( = ?auto_99784 ?auto_99785 ) ) ( not ( = ?auto_99784 ?auto_99782 ) ) ( not ( = ?auto_99784 ?auto_99781 ) ) ( not ( = ?auto_99784 ?auto_99779 ) ) ( not ( = ?auto_99784 ?auto_99778 ) ) ( not ( = ?auto_99780 ?auto_99785 ) ) ( not ( = ?auto_99780 ?auto_99782 ) ) ( not ( = ?auto_99780 ?auto_99781 ) ) ( not ( = ?auto_99780 ?auto_99779 ) ) ( not ( = ?auto_99780 ?auto_99778 ) ) ( not ( = ?auto_99785 ?auto_99782 ) ) ( not ( = ?auto_99785 ?auto_99781 ) ) ( not ( = ?auto_99785 ?auto_99779 ) ) ( not ( = ?auto_99785 ?auto_99778 ) ) ( not ( = ?auto_99782 ?auto_99781 ) ) ( not ( = ?auto_99782 ?auto_99779 ) ) ( not ( = ?auto_99782 ?auto_99778 ) ) ( ON ?auto_99778 ?auto_99783 ) ( not ( = ?auto_99778 ?auto_99783 ) ) ( not ( = ?auto_99779 ?auto_99783 ) ) ( not ( = ?auto_99781 ?auto_99783 ) ) ( not ( = ?auto_99784 ?auto_99783 ) ) ( not ( = ?auto_99780 ?auto_99783 ) ) ( not ( = ?auto_99785 ?auto_99783 ) ) ( not ( = ?auto_99782 ?auto_99783 ) ) ( CLEAR ?auto_99781 ) ( ON ?auto_99779 ?auto_99778 ) ( CLEAR ?auto_99779 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_99783 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_99783 ?auto_99778 )
      ( MAKE-2PILE ?auto_99778 ?auto_99779 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99786 - BLOCK
      ?auto_99787 - BLOCK
    )
    :vars
    (
      ?auto_99790 - BLOCK
      ?auto_99791 - BLOCK
      ?auto_99789 - BLOCK
      ?auto_99792 - BLOCK
      ?auto_99788 - BLOCK
      ?auto_99793 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99786 ?auto_99787 ) ) ( not ( = ?auto_99786 ?auto_99790 ) ) ( not ( = ?auto_99787 ?auto_99790 ) ) ( ON-TABLE ?auto_99791 ) ( ON ?auto_99789 ?auto_99791 ) ( ON ?auto_99792 ?auto_99789 ) ( ON ?auto_99788 ?auto_99792 ) ( not ( = ?auto_99791 ?auto_99789 ) ) ( not ( = ?auto_99791 ?auto_99792 ) ) ( not ( = ?auto_99791 ?auto_99788 ) ) ( not ( = ?auto_99791 ?auto_99790 ) ) ( not ( = ?auto_99791 ?auto_99787 ) ) ( not ( = ?auto_99791 ?auto_99786 ) ) ( not ( = ?auto_99789 ?auto_99792 ) ) ( not ( = ?auto_99789 ?auto_99788 ) ) ( not ( = ?auto_99789 ?auto_99790 ) ) ( not ( = ?auto_99789 ?auto_99787 ) ) ( not ( = ?auto_99789 ?auto_99786 ) ) ( not ( = ?auto_99792 ?auto_99788 ) ) ( not ( = ?auto_99792 ?auto_99790 ) ) ( not ( = ?auto_99792 ?auto_99787 ) ) ( not ( = ?auto_99792 ?auto_99786 ) ) ( not ( = ?auto_99788 ?auto_99790 ) ) ( not ( = ?auto_99788 ?auto_99787 ) ) ( not ( = ?auto_99788 ?auto_99786 ) ) ( ON ?auto_99786 ?auto_99793 ) ( not ( = ?auto_99786 ?auto_99793 ) ) ( not ( = ?auto_99787 ?auto_99793 ) ) ( not ( = ?auto_99790 ?auto_99793 ) ) ( not ( = ?auto_99791 ?auto_99793 ) ) ( not ( = ?auto_99789 ?auto_99793 ) ) ( not ( = ?auto_99792 ?auto_99793 ) ) ( not ( = ?auto_99788 ?auto_99793 ) ) ( ON ?auto_99787 ?auto_99786 ) ( CLEAR ?auto_99787 ) ( ON-TABLE ?auto_99793 ) ( HOLDING ?auto_99790 ) ( CLEAR ?auto_99788 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99791 ?auto_99789 ?auto_99792 ?auto_99788 ?auto_99790 )
      ( MAKE-2PILE ?auto_99786 ?auto_99787 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99794 - BLOCK
      ?auto_99795 - BLOCK
    )
    :vars
    (
      ?auto_99801 - BLOCK
      ?auto_99796 - BLOCK
      ?auto_99797 - BLOCK
      ?auto_99798 - BLOCK
      ?auto_99799 - BLOCK
      ?auto_99800 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99794 ?auto_99795 ) ) ( not ( = ?auto_99794 ?auto_99801 ) ) ( not ( = ?auto_99795 ?auto_99801 ) ) ( ON-TABLE ?auto_99796 ) ( ON ?auto_99797 ?auto_99796 ) ( ON ?auto_99798 ?auto_99797 ) ( ON ?auto_99799 ?auto_99798 ) ( not ( = ?auto_99796 ?auto_99797 ) ) ( not ( = ?auto_99796 ?auto_99798 ) ) ( not ( = ?auto_99796 ?auto_99799 ) ) ( not ( = ?auto_99796 ?auto_99801 ) ) ( not ( = ?auto_99796 ?auto_99795 ) ) ( not ( = ?auto_99796 ?auto_99794 ) ) ( not ( = ?auto_99797 ?auto_99798 ) ) ( not ( = ?auto_99797 ?auto_99799 ) ) ( not ( = ?auto_99797 ?auto_99801 ) ) ( not ( = ?auto_99797 ?auto_99795 ) ) ( not ( = ?auto_99797 ?auto_99794 ) ) ( not ( = ?auto_99798 ?auto_99799 ) ) ( not ( = ?auto_99798 ?auto_99801 ) ) ( not ( = ?auto_99798 ?auto_99795 ) ) ( not ( = ?auto_99798 ?auto_99794 ) ) ( not ( = ?auto_99799 ?auto_99801 ) ) ( not ( = ?auto_99799 ?auto_99795 ) ) ( not ( = ?auto_99799 ?auto_99794 ) ) ( ON ?auto_99794 ?auto_99800 ) ( not ( = ?auto_99794 ?auto_99800 ) ) ( not ( = ?auto_99795 ?auto_99800 ) ) ( not ( = ?auto_99801 ?auto_99800 ) ) ( not ( = ?auto_99796 ?auto_99800 ) ) ( not ( = ?auto_99797 ?auto_99800 ) ) ( not ( = ?auto_99798 ?auto_99800 ) ) ( not ( = ?auto_99799 ?auto_99800 ) ) ( ON ?auto_99795 ?auto_99794 ) ( ON-TABLE ?auto_99800 ) ( CLEAR ?auto_99799 ) ( ON ?auto_99801 ?auto_99795 ) ( CLEAR ?auto_99801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_99800 ?auto_99794 ?auto_99795 )
      ( MAKE-2PILE ?auto_99794 ?auto_99795 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99802 - BLOCK
      ?auto_99803 - BLOCK
    )
    :vars
    (
      ?auto_99805 - BLOCK
      ?auto_99804 - BLOCK
      ?auto_99806 - BLOCK
      ?auto_99809 - BLOCK
      ?auto_99808 - BLOCK
      ?auto_99807 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99802 ?auto_99803 ) ) ( not ( = ?auto_99802 ?auto_99805 ) ) ( not ( = ?auto_99803 ?auto_99805 ) ) ( ON-TABLE ?auto_99804 ) ( ON ?auto_99806 ?auto_99804 ) ( ON ?auto_99809 ?auto_99806 ) ( not ( = ?auto_99804 ?auto_99806 ) ) ( not ( = ?auto_99804 ?auto_99809 ) ) ( not ( = ?auto_99804 ?auto_99808 ) ) ( not ( = ?auto_99804 ?auto_99805 ) ) ( not ( = ?auto_99804 ?auto_99803 ) ) ( not ( = ?auto_99804 ?auto_99802 ) ) ( not ( = ?auto_99806 ?auto_99809 ) ) ( not ( = ?auto_99806 ?auto_99808 ) ) ( not ( = ?auto_99806 ?auto_99805 ) ) ( not ( = ?auto_99806 ?auto_99803 ) ) ( not ( = ?auto_99806 ?auto_99802 ) ) ( not ( = ?auto_99809 ?auto_99808 ) ) ( not ( = ?auto_99809 ?auto_99805 ) ) ( not ( = ?auto_99809 ?auto_99803 ) ) ( not ( = ?auto_99809 ?auto_99802 ) ) ( not ( = ?auto_99808 ?auto_99805 ) ) ( not ( = ?auto_99808 ?auto_99803 ) ) ( not ( = ?auto_99808 ?auto_99802 ) ) ( ON ?auto_99802 ?auto_99807 ) ( not ( = ?auto_99802 ?auto_99807 ) ) ( not ( = ?auto_99803 ?auto_99807 ) ) ( not ( = ?auto_99805 ?auto_99807 ) ) ( not ( = ?auto_99804 ?auto_99807 ) ) ( not ( = ?auto_99806 ?auto_99807 ) ) ( not ( = ?auto_99809 ?auto_99807 ) ) ( not ( = ?auto_99808 ?auto_99807 ) ) ( ON ?auto_99803 ?auto_99802 ) ( ON-TABLE ?auto_99807 ) ( ON ?auto_99805 ?auto_99803 ) ( CLEAR ?auto_99805 ) ( HOLDING ?auto_99808 ) ( CLEAR ?auto_99809 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_99804 ?auto_99806 ?auto_99809 ?auto_99808 )
      ( MAKE-2PILE ?auto_99802 ?auto_99803 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99810 - BLOCK
      ?auto_99811 - BLOCK
    )
    :vars
    (
      ?auto_99813 - BLOCK
      ?auto_99817 - BLOCK
      ?auto_99816 - BLOCK
      ?auto_99812 - BLOCK
      ?auto_99815 - BLOCK
      ?auto_99814 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99810 ?auto_99811 ) ) ( not ( = ?auto_99810 ?auto_99813 ) ) ( not ( = ?auto_99811 ?auto_99813 ) ) ( ON-TABLE ?auto_99817 ) ( ON ?auto_99816 ?auto_99817 ) ( ON ?auto_99812 ?auto_99816 ) ( not ( = ?auto_99817 ?auto_99816 ) ) ( not ( = ?auto_99817 ?auto_99812 ) ) ( not ( = ?auto_99817 ?auto_99815 ) ) ( not ( = ?auto_99817 ?auto_99813 ) ) ( not ( = ?auto_99817 ?auto_99811 ) ) ( not ( = ?auto_99817 ?auto_99810 ) ) ( not ( = ?auto_99816 ?auto_99812 ) ) ( not ( = ?auto_99816 ?auto_99815 ) ) ( not ( = ?auto_99816 ?auto_99813 ) ) ( not ( = ?auto_99816 ?auto_99811 ) ) ( not ( = ?auto_99816 ?auto_99810 ) ) ( not ( = ?auto_99812 ?auto_99815 ) ) ( not ( = ?auto_99812 ?auto_99813 ) ) ( not ( = ?auto_99812 ?auto_99811 ) ) ( not ( = ?auto_99812 ?auto_99810 ) ) ( not ( = ?auto_99815 ?auto_99813 ) ) ( not ( = ?auto_99815 ?auto_99811 ) ) ( not ( = ?auto_99815 ?auto_99810 ) ) ( ON ?auto_99810 ?auto_99814 ) ( not ( = ?auto_99810 ?auto_99814 ) ) ( not ( = ?auto_99811 ?auto_99814 ) ) ( not ( = ?auto_99813 ?auto_99814 ) ) ( not ( = ?auto_99817 ?auto_99814 ) ) ( not ( = ?auto_99816 ?auto_99814 ) ) ( not ( = ?auto_99812 ?auto_99814 ) ) ( not ( = ?auto_99815 ?auto_99814 ) ) ( ON ?auto_99811 ?auto_99810 ) ( ON-TABLE ?auto_99814 ) ( ON ?auto_99813 ?auto_99811 ) ( CLEAR ?auto_99812 ) ( ON ?auto_99815 ?auto_99813 ) ( CLEAR ?auto_99815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_99814 ?auto_99810 ?auto_99811 ?auto_99813 )
      ( MAKE-2PILE ?auto_99810 ?auto_99811 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99818 - BLOCK
      ?auto_99819 - BLOCK
    )
    :vars
    (
      ?auto_99820 - BLOCK
      ?auto_99822 - BLOCK
      ?auto_99823 - BLOCK
      ?auto_99824 - BLOCK
      ?auto_99821 - BLOCK
      ?auto_99825 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99818 ?auto_99819 ) ) ( not ( = ?auto_99818 ?auto_99820 ) ) ( not ( = ?auto_99819 ?auto_99820 ) ) ( ON-TABLE ?auto_99822 ) ( ON ?auto_99823 ?auto_99822 ) ( not ( = ?auto_99822 ?auto_99823 ) ) ( not ( = ?auto_99822 ?auto_99824 ) ) ( not ( = ?auto_99822 ?auto_99821 ) ) ( not ( = ?auto_99822 ?auto_99820 ) ) ( not ( = ?auto_99822 ?auto_99819 ) ) ( not ( = ?auto_99822 ?auto_99818 ) ) ( not ( = ?auto_99823 ?auto_99824 ) ) ( not ( = ?auto_99823 ?auto_99821 ) ) ( not ( = ?auto_99823 ?auto_99820 ) ) ( not ( = ?auto_99823 ?auto_99819 ) ) ( not ( = ?auto_99823 ?auto_99818 ) ) ( not ( = ?auto_99824 ?auto_99821 ) ) ( not ( = ?auto_99824 ?auto_99820 ) ) ( not ( = ?auto_99824 ?auto_99819 ) ) ( not ( = ?auto_99824 ?auto_99818 ) ) ( not ( = ?auto_99821 ?auto_99820 ) ) ( not ( = ?auto_99821 ?auto_99819 ) ) ( not ( = ?auto_99821 ?auto_99818 ) ) ( ON ?auto_99818 ?auto_99825 ) ( not ( = ?auto_99818 ?auto_99825 ) ) ( not ( = ?auto_99819 ?auto_99825 ) ) ( not ( = ?auto_99820 ?auto_99825 ) ) ( not ( = ?auto_99822 ?auto_99825 ) ) ( not ( = ?auto_99823 ?auto_99825 ) ) ( not ( = ?auto_99824 ?auto_99825 ) ) ( not ( = ?auto_99821 ?auto_99825 ) ) ( ON ?auto_99819 ?auto_99818 ) ( ON-TABLE ?auto_99825 ) ( ON ?auto_99820 ?auto_99819 ) ( ON ?auto_99821 ?auto_99820 ) ( CLEAR ?auto_99821 ) ( HOLDING ?auto_99824 ) ( CLEAR ?auto_99823 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_99822 ?auto_99823 ?auto_99824 )
      ( MAKE-2PILE ?auto_99818 ?auto_99819 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99826 - BLOCK
      ?auto_99827 - BLOCK
    )
    :vars
    (
      ?auto_99829 - BLOCK
      ?auto_99833 - BLOCK
      ?auto_99828 - BLOCK
      ?auto_99830 - BLOCK
      ?auto_99831 - BLOCK
      ?auto_99832 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99826 ?auto_99827 ) ) ( not ( = ?auto_99826 ?auto_99829 ) ) ( not ( = ?auto_99827 ?auto_99829 ) ) ( ON-TABLE ?auto_99833 ) ( ON ?auto_99828 ?auto_99833 ) ( not ( = ?auto_99833 ?auto_99828 ) ) ( not ( = ?auto_99833 ?auto_99830 ) ) ( not ( = ?auto_99833 ?auto_99831 ) ) ( not ( = ?auto_99833 ?auto_99829 ) ) ( not ( = ?auto_99833 ?auto_99827 ) ) ( not ( = ?auto_99833 ?auto_99826 ) ) ( not ( = ?auto_99828 ?auto_99830 ) ) ( not ( = ?auto_99828 ?auto_99831 ) ) ( not ( = ?auto_99828 ?auto_99829 ) ) ( not ( = ?auto_99828 ?auto_99827 ) ) ( not ( = ?auto_99828 ?auto_99826 ) ) ( not ( = ?auto_99830 ?auto_99831 ) ) ( not ( = ?auto_99830 ?auto_99829 ) ) ( not ( = ?auto_99830 ?auto_99827 ) ) ( not ( = ?auto_99830 ?auto_99826 ) ) ( not ( = ?auto_99831 ?auto_99829 ) ) ( not ( = ?auto_99831 ?auto_99827 ) ) ( not ( = ?auto_99831 ?auto_99826 ) ) ( ON ?auto_99826 ?auto_99832 ) ( not ( = ?auto_99826 ?auto_99832 ) ) ( not ( = ?auto_99827 ?auto_99832 ) ) ( not ( = ?auto_99829 ?auto_99832 ) ) ( not ( = ?auto_99833 ?auto_99832 ) ) ( not ( = ?auto_99828 ?auto_99832 ) ) ( not ( = ?auto_99830 ?auto_99832 ) ) ( not ( = ?auto_99831 ?auto_99832 ) ) ( ON ?auto_99827 ?auto_99826 ) ( ON-TABLE ?auto_99832 ) ( ON ?auto_99829 ?auto_99827 ) ( ON ?auto_99831 ?auto_99829 ) ( CLEAR ?auto_99828 ) ( ON ?auto_99830 ?auto_99831 ) ( CLEAR ?auto_99830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99832 ?auto_99826 ?auto_99827 ?auto_99829 ?auto_99831 )
      ( MAKE-2PILE ?auto_99826 ?auto_99827 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99834 - BLOCK
      ?auto_99835 - BLOCK
    )
    :vars
    (
      ?auto_99840 - BLOCK
      ?auto_99841 - BLOCK
      ?auto_99839 - BLOCK
      ?auto_99836 - BLOCK
      ?auto_99838 - BLOCK
      ?auto_99837 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99834 ?auto_99835 ) ) ( not ( = ?auto_99834 ?auto_99840 ) ) ( not ( = ?auto_99835 ?auto_99840 ) ) ( ON-TABLE ?auto_99841 ) ( not ( = ?auto_99841 ?auto_99839 ) ) ( not ( = ?auto_99841 ?auto_99836 ) ) ( not ( = ?auto_99841 ?auto_99838 ) ) ( not ( = ?auto_99841 ?auto_99840 ) ) ( not ( = ?auto_99841 ?auto_99835 ) ) ( not ( = ?auto_99841 ?auto_99834 ) ) ( not ( = ?auto_99839 ?auto_99836 ) ) ( not ( = ?auto_99839 ?auto_99838 ) ) ( not ( = ?auto_99839 ?auto_99840 ) ) ( not ( = ?auto_99839 ?auto_99835 ) ) ( not ( = ?auto_99839 ?auto_99834 ) ) ( not ( = ?auto_99836 ?auto_99838 ) ) ( not ( = ?auto_99836 ?auto_99840 ) ) ( not ( = ?auto_99836 ?auto_99835 ) ) ( not ( = ?auto_99836 ?auto_99834 ) ) ( not ( = ?auto_99838 ?auto_99840 ) ) ( not ( = ?auto_99838 ?auto_99835 ) ) ( not ( = ?auto_99838 ?auto_99834 ) ) ( ON ?auto_99834 ?auto_99837 ) ( not ( = ?auto_99834 ?auto_99837 ) ) ( not ( = ?auto_99835 ?auto_99837 ) ) ( not ( = ?auto_99840 ?auto_99837 ) ) ( not ( = ?auto_99841 ?auto_99837 ) ) ( not ( = ?auto_99839 ?auto_99837 ) ) ( not ( = ?auto_99836 ?auto_99837 ) ) ( not ( = ?auto_99838 ?auto_99837 ) ) ( ON ?auto_99835 ?auto_99834 ) ( ON-TABLE ?auto_99837 ) ( ON ?auto_99840 ?auto_99835 ) ( ON ?auto_99838 ?auto_99840 ) ( ON ?auto_99836 ?auto_99838 ) ( CLEAR ?auto_99836 ) ( HOLDING ?auto_99839 ) ( CLEAR ?auto_99841 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_99841 ?auto_99839 )
      ( MAKE-2PILE ?auto_99834 ?auto_99835 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99842 - BLOCK
      ?auto_99843 - BLOCK
    )
    :vars
    (
      ?auto_99846 - BLOCK
      ?auto_99849 - BLOCK
      ?auto_99845 - BLOCK
      ?auto_99847 - BLOCK
      ?auto_99844 - BLOCK
      ?auto_99848 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99842 ?auto_99843 ) ) ( not ( = ?auto_99842 ?auto_99846 ) ) ( not ( = ?auto_99843 ?auto_99846 ) ) ( ON-TABLE ?auto_99849 ) ( not ( = ?auto_99849 ?auto_99845 ) ) ( not ( = ?auto_99849 ?auto_99847 ) ) ( not ( = ?auto_99849 ?auto_99844 ) ) ( not ( = ?auto_99849 ?auto_99846 ) ) ( not ( = ?auto_99849 ?auto_99843 ) ) ( not ( = ?auto_99849 ?auto_99842 ) ) ( not ( = ?auto_99845 ?auto_99847 ) ) ( not ( = ?auto_99845 ?auto_99844 ) ) ( not ( = ?auto_99845 ?auto_99846 ) ) ( not ( = ?auto_99845 ?auto_99843 ) ) ( not ( = ?auto_99845 ?auto_99842 ) ) ( not ( = ?auto_99847 ?auto_99844 ) ) ( not ( = ?auto_99847 ?auto_99846 ) ) ( not ( = ?auto_99847 ?auto_99843 ) ) ( not ( = ?auto_99847 ?auto_99842 ) ) ( not ( = ?auto_99844 ?auto_99846 ) ) ( not ( = ?auto_99844 ?auto_99843 ) ) ( not ( = ?auto_99844 ?auto_99842 ) ) ( ON ?auto_99842 ?auto_99848 ) ( not ( = ?auto_99842 ?auto_99848 ) ) ( not ( = ?auto_99843 ?auto_99848 ) ) ( not ( = ?auto_99846 ?auto_99848 ) ) ( not ( = ?auto_99849 ?auto_99848 ) ) ( not ( = ?auto_99845 ?auto_99848 ) ) ( not ( = ?auto_99847 ?auto_99848 ) ) ( not ( = ?auto_99844 ?auto_99848 ) ) ( ON ?auto_99843 ?auto_99842 ) ( ON-TABLE ?auto_99848 ) ( ON ?auto_99846 ?auto_99843 ) ( ON ?auto_99844 ?auto_99846 ) ( ON ?auto_99847 ?auto_99844 ) ( CLEAR ?auto_99849 ) ( ON ?auto_99845 ?auto_99847 ) ( CLEAR ?auto_99845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_99848 ?auto_99842 ?auto_99843 ?auto_99846 ?auto_99844 ?auto_99847 )
      ( MAKE-2PILE ?auto_99842 ?auto_99843 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99850 - BLOCK
      ?auto_99851 - BLOCK
    )
    :vars
    (
      ?auto_99857 - BLOCK
      ?auto_99856 - BLOCK
      ?auto_99855 - BLOCK
      ?auto_99854 - BLOCK
      ?auto_99853 - BLOCK
      ?auto_99852 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99850 ?auto_99851 ) ) ( not ( = ?auto_99850 ?auto_99857 ) ) ( not ( = ?auto_99851 ?auto_99857 ) ) ( not ( = ?auto_99856 ?auto_99855 ) ) ( not ( = ?auto_99856 ?auto_99854 ) ) ( not ( = ?auto_99856 ?auto_99853 ) ) ( not ( = ?auto_99856 ?auto_99857 ) ) ( not ( = ?auto_99856 ?auto_99851 ) ) ( not ( = ?auto_99856 ?auto_99850 ) ) ( not ( = ?auto_99855 ?auto_99854 ) ) ( not ( = ?auto_99855 ?auto_99853 ) ) ( not ( = ?auto_99855 ?auto_99857 ) ) ( not ( = ?auto_99855 ?auto_99851 ) ) ( not ( = ?auto_99855 ?auto_99850 ) ) ( not ( = ?auto_99854 ?auto_99853 ) ) ( not ( = ?auto_99854 ?auto_99857 ) ) ( not ( = ?auto_99854 ?auto_99851 ) ) ( not ( = ?auto_99854 ?auto_99850 ) ) ( not ( = ?auto_99853 ?auto_99857 ) ) ( not ( = ?auto_99853 ?auto_99851 ) ) ( not ( = ?auto_99853 ?auto_99850 ) ) ( ON ?auto_99850 ?auto_99852 ) ( not ( = ?auto_99850 ?auto_99852 ) ) ( not ( = ?auto_99851 ?auto_99852 ) ) ( not ( = ?auto_99857 ?auto_99852 ) ) ( not ( = ?auto_99856 ?auto_99852 ) ) ( not ( = ?auto_99855 ?auto_99852 ) ) ( not ( = ?auto_99854 ?auto_99852 ) ) ( not ( = ?auto_99853 ?auto_99852 ) ) ( ON ?auto_99851 ?auto_99850 ) ( ON-TABLE ?auto_99852 ) ( ON ?auto_99857 ?auto_99851 ) ( ON ?auto_99853 ?auto_99857 ) ( ON ?auto_99854 ?auto_99853 ) ( ON ?auto_99855 ?auto_99854 ) ( CLEAR ?auto_99855 ) ( HOLDING ?auto_99856 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_99856 )
      ( MAKE-2PILE ?auto_99850 ?auto_99851 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99858 - BLOCK
      ?auto_99859 - BLOCK
    )
    :vars
    (
      ?auto_99861 - BLOCK
      ?auto_99865 - BLOCK
      ?auto_99862 - BLOCK
      ?auto_99863 - BLOCK
      ?auto_99860 - BLOCK
      ?auto_99864 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99858 ?auto_99859 ) ) ( not ( = ?auto_99858 ?auto_99861 ) ) ( not ( = ?auto_99859 ?auto_99861 ) ) ( not ( = ?auto_99865 ?auto_99862 ) ) ( not ( = ?auto_99865 ?auto_99863 ) ) ( not ( = ?auto_99865 ?auto_99860 ) ) ( not ( = ?auto_99865 ?auto_99861 ) ) ( not ( = ?auto_99865 ?auto_99859 ) ) ( not ( = ?auto_99865 ?auto_99858 ) ) ( not ( = ?auto_99862 ?auto_99863 ) ) ( not ( = ?auto_99862 ?auto_99860 ) ) ( not ( = ?auto_99862 ?auto_99861 ) ) ( not ( = ?auto_99862 ?auto_99859 ) ) ( not ( = ?auto_99862 ?auto_99858 ) ) ( not ( = ?auto_99863 ?auto_99860 ) ) ( not ( = ?auto_99863 ?auto_99861 ) ) ( not ( = ?auto_99863 ?auto_99859 ) ) ( not ( = ?auto_99863 ?auto_99858 ) ) ( not ( = ?auto_99860 ?auto_99861 ) ) ( not ( = ?auto_99860 ?auto_99859 ) ) ( not ( = ?auto_99860 ?auto_99858 ) ) ( ON ?auto_99858 ?auto_99864 ) ( not ( = ?auto_99858 ?auto_99864 ) ) ( not ( = ?auto_99859 ?auto_99864 ) ) ( not ( = ?auto_99861 ?auto_99864 ) ) ( not ( = ?auto_99865 ?auto_99864 ) ) ( not ( = ?auto_99862 ?auto_99864 ) ) ( not ( = ?auto_99863 ?auto_99864 ) ) ( not ( = ?auto_99860 ?auto_99864 ) ) ( ON ?auto_99859 ?auto_99858 ) ( ON-TABLE ?auto_99864 ) ( ON ?auto_99861 ?auto_99859 ) ( ON ?auto_99860 ?auto_99861 ) ( ON ?auto_99863 ?auto_99860 ) ( ON ?auto_99862 ?auto_99863 ) ( ON ?auto_99865 ?auto_99862 ) ( CLEAR ?auto_99865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_99864 ?auto_99858 ?auto_99859 ?auto_99861 ?auto_99860 ?auto_99863 ?auto_99862 )
      ( MAKE-2PILE ?auto_99858 ?auto_99859 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_99870 - BLOCK
      ?auto_99871 - BLOCK
      ?auto_99872 - BLOCK
      ?auto_99873 - BLOCK
    )
    :vars
    (
      ?auto_99874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99874 ?auto_99873 ) ( CLEAR ?auto_99874 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_99870 ) ( ON ?auto_99871 ?auto_99870 ) ( ON ?auto_99872 ?auto_99871 ) ( ON ?auto_99873 ?auto_99872 ) ( not ( = ?auto_99870 ?auto_99871 ) ) ( not ( = ?auto_99870 ?auto_99872 ) ) ( not ( = ?auto_99870 ?auto_99873 ) ) ( not ( = ?auto_99870 ?auto_99874 ) ) ( not ( = ?auto_99871 ?auto_99872 ) ) ( not ( = ?auto_99871 ?auto_99873 ) ) ( not ( = ?auto_99871 ?auto_99874 ) ) ( not ( = ?auto_99872 ?auto_99873 ) ) ( not ( = ?auto_99872 ?auto_99874 ) ) ( not ( = ?auto_99873 ?auto_99874 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_99874 ?auto_99873 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_99875 - BLOCK
      ?auto_99876 - BLOCK
      ?auto_99877 - BLOCK
      ?auto_99878 - BLOCK
    )
    :vars
    (
      ?auto_99879 - BLOCK
      ?auto_99880 - BLOCK
      ?auto_99881 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99879 ?auto_99878 ) ( CLEAR ?auto_99879 ) ( ON-TABLE ?auto_99875 ) ( ON ?auto_99876 ?auto_99875 ) ( ON ?auto_99877 ?auto_99876 ) ( ON ?auto_99878 ?auto_99877 ) ( not ( = ?auto_99875 ?auto_99876 ) ) ( not ( = ?auto_99875 ?auto_99877 ) ) ( not ( = ?auto_99875 ?auto_99878 ) ) ( not ( = ?auto_99875 ?auto_99879 ) ) ( not ( = ?auto_99876 ?auto_99877 ) ) ( not ( = ?auto_99876 ?auto_99878 ) ) ( not ( = ?auto_99876 ?auto_99879 ) ) ( not ( = ?auto_99877 ?auto_99878 ) ) ( not ( = ?auto_99877 ?auto_99879 ) ) ( not ( = ?auto_99878 ?auto_99879 ) ) ( HOLDING ?auto_99880 ) ( CLEAR ?auto_99881 ) ( not ( = ?auto_99875 ?auto_99880 ) ) ( not ( = ?auto_99875 ?auto_99881 ) ) ( not ( = ?auto_99876 ?auto_99880 ) ) ( not ( = ?auto_99876 ?auto_99881 ) ) ( not ( = ?auto_99877 ?auto_99880 ) ) ( not ( = ?auto_99877 ?auto_99881 ) ) ( not ( = ?auto_99878 ?auto_99880 ) ) ( not ( = ?auto_99878 ?auto_99881 ) ) ( not ( = ?auto_99879 ?auto_99880 ) ) ( not ( = ?auto_99879 ?auto_99881 ) ) ( not ( = ?auto_99880 ?auto_99881 ) ) )
    :subtasks
    ( ( !STACK ?auto_99880 ?auto_99881 )
      ( MAKE-4PILE ?auto_99875 ?auto_99876 ?auto_99877 ?auto_99878 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_99882 - BLOCK
      ?auto_99883 - BLOCK
      ?auto_99884 - BLOCK
      ?auto_99885 - BLOCK
    )
    :vars
    (
      ?auto_99886 - BLOCK
      ?auto_99887 - BLOCK
      ?auto_99888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99886 ?auto_99885 ) ( ON-TABLE ?auto_99882 ) ( ON ?auto_99883 ?auto_99882 ) ( ON ?auto_99884 ?auto_99883 ) ( ON ?auto_99885 ?auto_99884 ) ( not ( = ?auto_99882 ?auto_99883 ) ) ( not ( = ?auto_99882 ?auto_99884 ) ) ( not ( = ?auto_99882 ?auto_99885 ) ) ( not ( = ?auto_99882 ?auto_99886 ) ) ( not ( = ?auto_99883 ?auto_99884 ) ) ( not ( = ?auto_99883 ?auto_99885 ) ) ( not ( = ?auto_99883 ?auto_99886 ) ) ( not ( = ?auto_99884 ?auto_99885 ) ) ( not ( = ?auto_99884 ?auto_99886 ) ) ( not ( = ?auto_99885 ?auto_99886 ) ) ( CLEAR ?auto_99887 ) ( not ( = ?auto_99882 ?auto_99888 ) ) ( not ( = ?auto_99882 ?auto_99887 ) ) ( not ( = ?auto_99883 ?auto_99888 ) ) ( not ( = ?auto_99883 ?auto_99887 ) ) ( not ( = ?auto_99884 ?auto_99888 ) ) ( not ( = ?auto_99884 ?auto_99887 ) ) ( not ( = ?auto_99885 ?auto_99888 ) ) ( not ( = ?auto_99885 ?auto_99887 ) ) ( not ( = ?auto_99886 ?auto_99888 ) ) ( not ( = ?auto_99886 ?auto_99887 ) ) ( not ( = ?auto_99888 ?auto_99887 ) ) ( ON ?auto_99888 ?auto_99886 ) ( CLEAR ?auto_99888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99882 ?auto_99883 ?auto_99884 ?auto_99885 ?auto_99886 )
      ( MAKE-4PILE ?auto_99882 ?auto_99883 ?auto_99884 ?auto_99885 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_99889 - BLOCK
      ?auto_99890 - BLOCK
      ?auto_99891 - BLOCK
      ?auto_99892 - BLOCK
    )
    :vars
    (
      ?auto_99893 - BLOCK
      ?auto_99895 - BLOCK
      ?auto_99894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99893 ?auto_99892 ) ( ON-TABLE ?auto_99889 ) ( ON ?auto_99890 ?auto_99889 ) ( ON ?auto_99891 ?auto_99890 ) ( ON ?auto_99892 ?auto_99891 ) ( not ( = ?auto_99889 ?auto_99890 ) ) ( not ( = ?auto_99889 ?auto_99891 ) ) ( not ( = ?auto_99889 ?auto_99892 ) ) ( not ( = ?auto_99889 ?auto_99893 ) ) ( not ( = ?auto_99890 ?auto_99891 ) ) ( not ( = ?auto_99890 ?auto_99892 ) ) ( not ( = ?auto_99890 ?auto_99893 ) ) ( not ( = ?auto_99891 ?auto_99892 ) ) ( not ( = ?auto_99891 ?auto_99893 ) ) ( not ( = ?auto_99892 ?auto_99893 ) ) ( not ( = ?auto_99889 ?auto_99895 ) ) ( not ( = ?auto_99889 ?auto_99894 ) ) ( not ( = ?auto_99890 ?auto_99895 ) ) ( not ( = ?auto_99890 ?auto_99894 ) ) ( not ( = ?auto_99891 ?auto_99895 ) ) ( not ( = ?auto_99891 ?auto_99894 ) ) ( not ( = ?auto_99892 ?auto_99895 ) ) ( not ( = ?auto_99892 ?auto_99894 ) ) ( not ( = ?auto_99893 ?auto_99895 ) ) ( not ( = ?auto_99893 ?auto_99894 ) ) ( not ( = ?auto_99895 ?auto_99894 ) ) ( ON ?auto_99895 ?auto_99893 ) ( CLEAR ?auto_99895 ) ( HOLDING ?auto_99894 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_99894 )
      ( MAKE-4PILE ?auto_99889 ?auto_99890 ?auto_99891 ?auto_99892 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_99896 - BLOCK
      ?auto_99897 - BLOCK
      ?auto_99898 - BLOCK
      ?auto_99899 - BLOCK
    )
    :vars
    (
      ?auto_99901 - BLOCK
      ?auto_99902 - BLOCK
      ?auto_99900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99901 ?auto_99899 ) ( ON-TABLE ?auto_99896 ) ( ON ?auto_99897 ?auto_99896 ) ( ON ?auto_99898 ?auto_99897 ) ( ON ?auto_99899 ?auto_99898 ) ( not ( = ?auto_99896 ?auto_99897 ) ) ( not ( = ?auto_99896 ?auto_99898 ) ) ( not ( = ?auto_99896 ?auto_99899 ) ) ( not ( = ?auto_99896 ?auto_99901 ) ) ( not ( = ?auto_99897 ?auto_99898 ) ) ( not ( = ?auto_99897 ?auto_99899 ) ) ( not ( = ?auto_99897 ?auto_99901 ) ) ( not ( = ?auto_99898 ?auto_99899 ) ) ( not ( = ?auto_99898 ?auto_99901 ) ) ( not ( = ?auto_99899 ?auto_99901 ) ) ( not ( = ?auto_99896 ?auto_99902 ) ) ( not ( = ?auto_99896 ?auto_99900 ) ) ( not ( = ?auto_99897 ?auto_99902 ) ) ( not ( = ?auto_99897 ?auto_99900 ) ) ( not ( = ?auto_99898 ?auto_99902 ) ) ( not ( = ?auto_99898 ?auto_99900 ) ) ( not ( = ?auto_99899 ?auto_99902 ) ) ( not ( = ?auto_99899 ?auto_99900 ) ) ( not ( = ?auto_99901 ?auto_99902 ) ) ( not ( = ?auto_99901 ?auto_99900 ) ) ( not ( = ?auto_99902 ?auto_99900 ) ) ( ON ?auto_99902 ?auto_99901 ) ( ON ?auto_99900 ?auto_99902 ) ( CLEAR ?auto_99900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_99896 ?auto_99897 ?auto_99898 ?auto_99899 ?auto_99901 ?auto_99902 )
      ( MAKE-4PILE ?auto_99896 ?auto_99897 ?auto_99898 ?auto_99899 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_99903 - BLOCK
      ?auto_99904 - BLOCK
      ?auto_99905 - BLOCK
      ?auto_99906 - BLOCK
    )
    :vars
    (
      ?auto_99908 - BLOCK
      ?auto_99909 - BLOCK
      ?auto_99907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99908 ?auto_99906 ) ( ON-TABLE ?auto_99903 ) ( ON ?auto_99904 ?auto_99903 ) ( ON ?auto_99905 ?auto_99904 ) ( ON ?auto_99906 ?auto_99905 ) ( not ( = ?auto_99903 ?auto_99904 ) ) ( not ( = ?auto_99903 ?auto_99905 ) ) ( not ( = ?auto_99903 ?auto_99906 ) ) ( not ( = ?auto_99903 ?auto_99908 ) ) ( not ( = ?auto_99904 ?auto_99905 ) ) ( not ( = ?auto_99904 ?auto_99906 ) ) ( not ( = ?auto_99904 ?auto_99908 ) ) ( not ( = ?auto_99905 ?auto_99906 ) ) ( not ( = ?auto_99905 ?auto_99908 ) ) ( not ( = ?auto_99906 ?auto_99908 ) ) ( not ( = ?auto_99903 ?auto_99909 ) ) ( not ( = ?auto_99903 ?auto_99907 ) ) ( not ( = ?auto_99904 ?auto_99909 ) ) ( not ( = ?auto_99904 ?auto_99907 ) ) ( not ( = ?auto_99905 ?auto_99909 ) ) ( not ( = ?auto_99905 ?auto_99907 ) ) ( not ( = ?auto_99906 ?auto_99909 ) ) ( not ( = ?auto_99906 ?auto_99907 ) ) ( not ( = ?auto_99908 ?auto_99909 ) ) ( not ( = ?auto_99908 ?auto_99907 ) ) ( not ( = ?auto_99909 ?auto_99907 ) ) ( ON ?auto_99909 ?auto_99908 ) ( HOLDING ?auto_99907 ) ( CLEAR ?auto_99909 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_99903 ?auto_99904 ?auto_99905 ?auto_99906 ?auto_99908 ?auto_99909 ?auto_99907 )
      ( MAKE-4PILE ?auto_99903 ?auto_99904 ?auto_99905 ?auto_99906 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_99910 - BLOCK
      ?auto_99911 - BLOCK
      ?auto_99912 - BLOCK
      ?auto_99913 - BLOCK
    )
    :vars
    (
      ?auto_99914 - BLOCK
      ?auto_99916 - BLOCK
      ?auto_99915 - BLOCK
      ?auto_99917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99914 ?auto_99913 ) ( ON-TABLE ?auto_99910 ) ( ON ?auto_99911 ?auto_99910 ) ( ON ?auto_99912 ?auto_99911 ) ( ON ?auto_99913 ?auto_99912 ) ( not ( = ?auto_99910 ?auto_99911 ) ) ( not ( = ?auto_99910 ?auto_99912 ) ) ( not ( = ?auto_99910 ?auto_99913 ) ) ( not ( = ?auto_99910 ?auto_99914 ) ) ( not ( = ?auto_99911 ?auto_99912 ) ) ( not ( = ?auto_99911 ?auto_99913 ) ) ( not ( = ?auto_99911 ?auto_99914 ) ) ( not ( = ?auto_99912 ?auto_99913 ) ) ( not ( = ?auto_99912 ?auto_99914 ) ) ( not ( = ?auto_99913 ?auto_99914 ) ) ( not ( = ?auto_99910 ?auto_99916 ) ) ( not ( = ?auto_99910 ?auto_99915 ) ) ( not ( = ?auto_99911 ?auto_99916 ) ) ( not ( = ?auto_99911 ?auto_99915 ) ) ( not ( = ?auto_99912 ?auto_99916 ) ) ( not ( = ?auto_99912 ?auto_99915 ) ) ( not ( = ?auto_99913 ?auto_99916 ) ) ( not ( = ?auto_99913 ?auto_99915 ) ) ( not ( = ?auto_99914 ?auto_99916 ) ) ( not ( = ?auto_99914 ?auto_99915 ) ) ( not ( = ?auto_99916 ?auto_99915 ) ) ( ON ?auto_99916 ?auto_99914 ) ( CLEAR ?auto_99916 ) ( ON ?auto_99915 ?auto_99917 ) ( CLEAR ?auto_99915 ) ( HAND-EMPTY ) ( not ( = ?auto_99910 ?auto_99917 ) ) ( not ( = ?auto_99911 ?auto_99917 ) ) ( not ( = ?auto_99912 ?auto_99917 ) ) ( not ( = ?auto_99913 ?auto_99917 ) ) ( not ( = ?auto_99914 ?auto_99917 ) ) ( not ( = ?auto_99916 ?auto_99917 ) ) ( not ( = ?auto_99915 ?auto_99917 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_99915 ?auto_99917 )
      ( MAKE-4PILE ?auto_99910 ?auto_99911 ?auto_99912 ?auto_99913 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_99918 - BLOCK
      ?auto_99919 - BLOCK
      ?auto_99920 - BLOCK
      ?auto_99921 - BLOCK
    )
    :vars
    (
      ?auto_99925 - BLOCK
      ?auto_99923 - BLOCK
      ?auto_99924 - BLOCK
      ?auto_99922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99925 ?auto_99921 ) ( ON-TABLE ?auto_99918 ) ( ON ?auto_99919 ?auto_99918 ) ( ON ?auto_99920 ?auto_99919 ) ( ON ?auto_99921 ?auto_99920 ) ( not ( = ?auto_99918 ?auto_99919 ) ) ( not ( = ?auto_99918 ?auto_99920 ) ) ( not ( = ?auto_99918 ?auto_99921 ) ) ( not ( = ?auto_99918 ?auto_99925 ) ) ( not ( = ?auto_99919 ?auto_99920 ) ) ( not ( = ?auto_99919 ?auto_99921 ) ) ( not ( = ?auto_99919 ?auto_99925 ) ) ( not ( = ?auto_99920 ?auto_99921 ) ) ( not ( = ?auto_99920 ?auto_99925 ) ) ( not ( = ?auto_99921 ?auto_99925 ) ) ( not ( = ?auto_99918 ?auto_99923 ) ) ( not ( = ?auto_99918 ?auto_99924 ) ) ( not ( = ?auto_99919 ?auto_99923 ) ) ( not ( = ?auto_99919 ?auto_99924 ) ) ( not ( = ?auto_99920 ?auto_99923 ) ) ( not ( = ?auto_99920 ?auto_99924 ) ) ( not ( = ?auto_99921 ?auto_99923 ) ) ( not ( = ?auto_99921 ?auto_99924 ) ) ( not ( = ?auto_99925 ?auto_99923 ) ) ( not ( = ?auto_99925 ?auto_99924 ) ) ( not ( = ?auto_99923 ?auto_99924 ) ) ( ON ?auto_99924 ?auto_99922 ) ( CLEAR ?auto_99924 ) ( not ( = ?auto_99918 ?auto_99922 ) ) ( not ( = ?auto_99919 ?auto_99922 ) ) ( not ( = ?auto_99920 ?auto_99922 ) ) ( not ( = ?auto_99921 ?auto_99922 ) ) ( not ( = ?auto_99925 ?auto_99922 ) ) ( not ( = ?auto_99923 ?auto_99922 ) ) ( not ( = ?auto_99924 ?auto_99922 ) ) ( HOLDING ?auto_99923 ) ( CLEAR ?auto_99925 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_99918 ?auto_99919 ?auto_99920 ?auto_99921 ?auto_99925 ?auto_99923 )
      ( MAKE-4PILE ?auto_99918 ?auto_99919 ?auto_99920 ?auto_99921 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_99926 - BLOCK
      ?auto_99927 - BLOCK
      ?auto_99928 - BLOCK
      ?auto_99929 - BLOCK
    )
    :vars
    (
      ?auto_99930 - BLOCK
      ?auto_99933 - BLOCK
      ?auto_99931 - BLOCK
      ?auto_99932 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99930 ?auto_99929 ) ( ON-TABLE ?auto_99926 ) ( ON ?auto_99927 ?auto_99926 ) ( ON ?auto_99928 ?auto_99927 ) ( ON ?auto_99929 ?auto_99928 ) ( not ( = ?auto_99926 ?auto_99927 ) ) ( not ( = ?auto_99926 ?auto_99928 ) ) ( not ( = ?auto_99926 ?auto_99929 ) ) ( not ( = ?auto_99926 ?auto_99930 ) ) ( not ( = ?auto_99927 ?auto_99928 ) ) ( not ( = ?auto_99927 ?auto_99929 ) ) ( not ( = ?auto_99927 ?auto_99930 ) ) ( not ( = ?auto_99928 ?auto_99929 ) ) ( not ( = ?auto_99928 ?auto_99930 ) ) ( not ( = ?auto_99929 ?auto_99930 ) ) ( not ( = ?auto_99926 ?auto_99933 ) ) ( not ( = ?auto_99926 ?auto_99931 ) ) ( not ( = ?auto_99927 ?auto_99933 ) ) ( not ( = ?auto_99927 ?auto_99931 ) ) ( not ( = ?auto_99928 ?auto_99933 ) ) ( not ( = ?auto_99928 ?auto_99931 ) ) ( not ( = ?auto_99929 ?auto_99933 ) ) ( not ( = ?auto_99929 ?auto_99931 ) ) ( not ( = ?auto_99930 ?auto_99933 ) ) ( not ( = ?auto_99930 ?auto_99931 ) ) ( not ( = ?auto_99933 ?auto_99931 ) ) ( ON ?auto_99931 ?auto_99932 ) ( not ( = ?auto_99926 ?auto_99932 ) ) ( not ( = ?auto_99927 ?auto_99932 ) ) ( not ( = ?auto_99928 ?auto_99932 ) ) ( not ( = ?auto_99929 ?auto_99932 ) ) ( not ( = ?auto_99930 ?auto_99932 ) ) ( not ( = ?auto_99933 ?auto_99932 ) ) ( not ( = ?auto_99931 ?auto_99932 ) ) ( CLEAR ?auto_99930 ) ( ON ?auto_99933 ?auto_99931 ) ( CLEAR ?auto_99933 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_99932 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_99932 ?auto_99931 )
      ( MAKE-4PILE ?auto_99926 ?auto_99927 ?auto_99928 ?auto_99929 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_99950 - BLOCK
      ?auto_99951 - BLOCK
      ?auto_99952 - BLOCK
      ?auto_99953 - BLOCK
    )
    :vars
    (
      ?auto_99956 - BLOCK
      ?auto_99955 - BLOCK
      ?auto_99954 - BLOCK
      ?auto_99957 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99950 ) ( ON ?auto_99951 ?auto_99950 ) ( ON ?auto_99952 ?auto_99951 ) ( not ( = ?auto_99950 ?auto_99951 ) ) ( not ( = ?auto_99950 ?auto_99952 ) ) ( not ( = ?auto_99950 ?auto_99953 ) ) ( not ( = ?auto_99950 ?auto_99956 ) ) ( not ( = ?auto_99951 ?auto_99952 ) ) ( not ( = ?auto_99951 ?auto_99953 ) ) ( not ( = ?auto_99951 ?auto_99956 ) ) ( not ( = ?auto_99952 ?auto_99953 ) ) ( not ( = ?auto_99952 ?auto_99956 ) ) ( not ( = ?auto_99953 ?auto_99956 ) ) ( not ( = ?auto_99950 ?auto_99955 ) ) ( not ( = ?auto_99950 ?auto_99954 ) ) ( not ( = ?auto_99951 ?auto_99955 ) ) ( not ( = ?auto_99951 ?auto_99954 ) ) ( not ( = ?auto_99952 ?auto_99955 ) ) ( not ( = ?auto_99952 ?auto_99954 ) ) ( not ( = ?auto_99953 ?auto_99955 ) ) ( not ( = ?auto_99953 ?auto_99954 ) ) ( not ( = ?auto_99956 ?auto_99955 ) ) ( not ( = ?auto_99956 ?auto_99954 ) ) ( not ( = ?auto_99955 ?auto_99954 ) ) ( ON ?auto_99954 ?auto_99957 ) ( not ( = ?auto_99950 ?auto_99957 ) ) ( not ( = ?auto_99951 ?auto_99957 ) ) ( not ( = ?auto_99952 ?auto_99957 ) ) ( not ( = ?auto_99953 ?auto_99957 ) ) ( not ( = ?auto_99956 ?auto_99957 ) ) ( not ( = ?auto_99955 ?auto_99957 ) ) ( not ( = ?auto_99954 ?auto_99957 ) ) ( ON ?auto_99955 ?auto_99954 ) ( ON-TABLE ?auto_99957 ) ( ON ?auto_99956 ?auto_99955 ) ( CLEAR ?auto_99956 ) ( HOLDING ?auto_99953 ) ( CLEAR ?auto_99952 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99950 ?auto_99951 ?auto_99952 ?auto_99953 ?auto_99956 )
      ( MAKE-4PILE ?auto_99950 ?auto_99951 ?auto_99952 ?auto_99953 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_99958 - BLOCK
      ?auto_99959 - BLOCK
      ?auto_99960 - BLOCK
      ?auto_99961 - BLOCK
    )
    :vars
    (
      ?auto_99964 - BLOCK
      ?auto_99963 - BLOCK
      ?auto_99965 - BLOCK
      ?auto_99962 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99958 ) ( ON ?auto_99959 ?auto_99958 ) ( ON ?auto_99960 ?auto_99959 ) ( not ( = ?auto_99958 ?auto_99959 ) ) ( not ( = ?auto_99958 ?auto_99960 ) ) ( not ( = ?auto_99958 ?auto_99961 ) ) ( not ( = ?auto_99958 ?auto_99964 ) ) ( not ( = ?auto_99959 ?auto_99960 ) ) ( not ( = ?auto_99959 ?auto_99961 ) ) ( not ( = ?auto_99959 ?auto_99964 ) ) ( not ( = ?auto_99960 ?auto_99961 ) ) ( not ( = ?auto_99960 ?auto_99964 ) ) ( not ( = ?auto_99961 ?auto_99964 ) ) ( not ( = ?auto_99958 ?auto_99963 ) ) ( not ( = ?auto_99958 ?auto_99965 ) ) ( not ( = ?auto_99959 ?auto_99963 ) ) ( not ( = ?auto_99959 ?auto_99965 ) ) ( not ( = ?auto_99960 ?auto_99963 ) ) ( not ( = ?auto_99960 ?auto_99965 ) ) ( not ( = ?auto_99961 ?auto_99963 ) ) ( not ( = ?auto_99961 ?auto_99965 ) ) ( not ( = ?auto_99964 ?auto_99963 ) ) ( not ( = ?auto_99964 ?auto_99965 ) ) ( not ( = ?auto_99963 ?auto_99965 ) ) ( ON ?auto_99965 ?auto_99962 ) ( not ( = ?auto_99958 ?auto_99962 ) ) ( not ( = ?auto_99959 ?auto_99962 ) ) ( not ( = ?auto_99960 ?auto_99962 ) ) ( not ( = ?auto_99961 ?auto_99962 ) ) ( not ( = ?auto_99964 ?auto_99962 ) ) ( not ( = ?auto_99963 ?auto_99962 ) ) ( not ( = ?auto_99965 ?auto_99962 ) ) ( ON ?auto_99963 ?auto_99965 ) ( ON-TABLE ?auto_99962 ) ( ON ?auto_99964 ?auto_99963 ) ( CLEAR ?auto_99960 ) ( ON ?auto_99961 ?auto_99964 ) ( CLEAR ?auto_99961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_99962 ?auto_99965 ?auto_99963 ?auto_99964 )
      ( MAKE-4PILE ?auto_99958 ?auto_99959 ?auto_99960 ?auto_99961 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_99966 - BLOCK
      ?auto_99967 - BLOCK
      ?auto_99968 - BLOCK
      ?auto_99969 - BLOCK
    )
    :vars
    (
      ?auto_99973 - BLOCK
      ?auto_99970 - BLOCK
      ?auto_99971 - BLOCK
      ?auto_99972 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99966 ) ( ON ?auto_99967 ?auto_99966 ) ( not ( = ?auto_99966 ?auto_99967 ) ) ( not ( = ?auto_99966 ?auto_99968 ) ) ( not ( = ?auto_99966 ?auto_99969 ) ) ( not ( = ?auto_99966 ?auto_99973 ) ) ( not ( = ?auto_99967 ?auto_99968 ) ) ( not ( = ?auto_99967 ?auto_99969 ) ) ( not ( = ?auto_99967 ?auto_99973 ) ) ( not ( = ?auto_99968 ?auto_99969 ) ) ( not ( = ?auto_99968 ?auto_99973 ) ) ( not ( = ?auto_99969 ?auto_99973 ) ) ( not ( = ?auto_99966 ?auto_99970 ) ) ( not ( = ?auto_99966 ?auto_99971 ) ) ( not ( = ?auto_99967 ?auto_99970 ) ) ( not ( = ?auto_99967 ?auto_99971 ) ) ( not ( = ?auto_99968 ?auto_99970 ) ) ( not ( = ?auto_99968 ?auto_99971 ) ) ( not ( = ?auto_99969 ?auto_99970 ) ) ( not ( = ?auto_99969 ?auto_99971 ) ) ( not ( = ?auto_99973 ?auto_99970 ) ) ( not ( = ?auto_99973 ?auto_99971 ) ) ( not ( = ?auto_99970 ?auto_99971 ) ) ( ON ?auto_99971 ?auto_99972 ) ( not ( = ?auto_99966 ?auto_99972 ) ) ( not ( = ?auto_99967 ?auto_99972 ) ) ( not ( = ?auto_99968 ?auto_99972 ) ) ( not ( = ?auto_99969 ?auto_99972 ) ) ( not ( = ?auto_99973 ?auto_99972 ) ) ( not ( = ?auto_99970 ?auto_99972 ) ) ( not ( = ?auto_99971 ?auto_99972 ) ) ( ON ?auto_99970 ?auto_99971 ) ( ON-TABLE ?auto_99972 ) ( ON ?auto_99973 ?auto_99970 ) ( ON ?auto_99969 ?auto_99973 ) ( CLEAR ?auto_99969 ) ( HOLDING ?auto_99968 ) ( CLEAR ?auto_99967 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_99966 ?auto_99967 ?auto_99968 )
      ( MAKE-4PILE ?auto_99966 ?auto_99967 ?auto_99968 ?auto_99969 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_99974 - BLOCK
      ?auto_99975 - BLOCK
      ?auto_99976 - BLOCK
      ?auto_99977 - BLOCK
    )
    :vars
    (
      ?auto_99979 - BLOCK
      ?auto_99980 - BLOCK
      ?auto_99981 - BLOCK
      ?auto_99978 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99974 ) ( ON ?auto_99975 ?auto_99974 ) ( not ( = ?auto_99974 ?auto_99975 ) ) ( not ( = ?auto_99974 ?auto_99976 ) ) ( not ( = ?auto_99974 ?auto_99977 ) ) ( not ( = ?auto_99974 ?auto_99979 ) ) ( not ( = ?auto_99975 ?auto_99976 ) ) ( not ( = ?auto_99975 ?auto_99977 ) ) ( not ( = ?auto_99975 ?auto_99979 ) ) ( not ( = ?auto_99976 ?auto_99977 ) ) ( not ( = ?auto_99976 ?auto_99979 ) ) ( not ( = ?auto_99977 ?auto_99979 ) ) ( not ( = ?auto_99974 ?auto_99980 ) ) ( not ( = ?auto_99974 ?auto_99981 ) ) ( not ( = ?auto_99975 ?auto_99980 ) ) ( not ( = ?auto_99975 ?auto_99981 ) ) ( not ( = ?auto_99976 ?auto_99980 ) ) ( not ( = ?auto_99976 ?auto_99981 ) ) ( not ( = ?auto_99977 ?auto_99980 ) ) ( not ( = ?auto_99977 ?auto_99981 ) ) ( not ( = ?auto_99979 ?auto_99980 ) ) ( not ( = ?auto_99979 ?auto_99981 ) ) ( not ( = ?auto_99980 ?auto_99981 ) ) ( ON ?auto_99981 ?auto_99978 ) ( not ( = ?auto_99974 ?auto_99978 ) ) ( not ( = ?auto_99975 ?auto_99978 ) ) ( not ( = ?auto_99976 ?auto_99978 ) ) ( not ( = ?auto_99977 ?auto_99978 ) ) ( not ( = ?auto_99979 ?auto_99978 ) ) ( not ( = ?auto_99980 ?auto_99978 ) ) ( not ( = ?auto_99981 ?auto_99978 ) ) ( ON ?auto_99980 ?auto_99981 ) ( ON-TABLE ?auto_99978 ) ( ON ?auto_99979 ?auto_99980 ) ( ON ?auto_99977 ?auto_99979 ) ( CLEAR ?auto_99975 ) ( ON ?auto_99976 ?auto_99977 ) ( CLEAR ?auto_99976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99978 ?auto_99981 ?auto_99980 ?auto_99979 ?auto_99977 )
      ( MAKE-4PILE ?auto_99974 ?auto_99975 ?auto_99976 ?auto_99977 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_99982 - BLOCK
      ?auto_99983 - BLOCK
      ?auto_99984 - BLOCK
      ?auto_99985 - BLOCK
    )
    :vars
    (
      ?auto_99988 - BLOCK
      ?auto_99989 - BLOCK
      ?auto_99986 - BLOCK
      ?auto_99987 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99982 ) ( not ( = ?auto_99982 ?auto_99983 ) ) ( not ( = ?auto_99982 ?auto_99984 ) ) ( not ( = ?auto_99982 ?auto_99985 ) ) ( not ( = ?auto_99982 ?auto_99988 ) ) ( not ( = ?auto_99983 ?auto_99984 ) ) ( not ( = ?auto_99983 ?auto_99985 ) ) ( not ( = ?auto_99983 ?auto_99988 ) ) ( not ( = ?auto_99984 ?auto_99985 ) ) ( not ( = ?auto_99984 ?auto_99988 ) ) ( not ( = ?auto_99985 ?auto_99988 ) ) ( not ( = ?auto_99982 ?auto_99989 ) ) ( not ( = ?auto_99982 ?auto_99986 ) ) ( not ( = ?auto_99983 ?auto_99989 ) ) ( not ( = ?auto_99983 ?auto_99986 ) ) ( not ( = ?auto_99984 ?auto_99989 ) ) ( not ( = ?auto_99984 ?auto_99986 ) ) ( not ( = ?auto_99985 ?auto_99989 ) ) ( not ( = ?auto_99985 ?auto_99986 ) ) ( not ( = ?auto_99988 ?auto_99989 ) ) ( not ( = ?auto_99988 ?auto_99986 ) ) ( not ( = ?auto_99989 ?auto_99986 ) ) ( ON ?auto_99986 ?auto_99987 ) ( not ( = ?auto_99982 ?auto_99987 ) ) ( not ( = ?auto_99983 ?auto_99987 ) ) ( not ( = ?auto_99984 ?auto_99987 ) ) ( not ( = ?auto_99985 ?auto_99987 ) ) ( not ( = ?auto_99988 ?auto_99987 ) ) ( not ( = ?auto_99989 ?auto_99987 ) ) ( not ( = ?auto_99986 ?auto_99987 ) ) ( ON ?auto_99989 ?auto_99986 ) ( ON-TABLE ?auto_99987 ) ( ON ?auto_99988 ?auto_99989 ) ( ON ?auto_99985 ?auto_99988 ) ( ON ?auto_99984 ?auto_99985 ) ( CLEAR ?auto_99984 ) ( HOLDING ?auto_99983 ) ( CLEAR ?auto_99982 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_99982 ?auto_99983 )
      ( MAKE-4PILE ?auto_99982 ?auto_99983 ?auto_99984 ?auto_99985 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_99990 - BLOCK
      ?auto_99991 - BLOCK
      ?auto_99992 - BLOCK
      ?auto_99993 - BLOCK
    )
    :vars
    (
      ?auto_99995 - BLOCK
      ?auto_99997 - BLOCK
      ?auto_99994 - BLOCK
      ?auto_99996 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99990 ) ( not ( = ?auto_99990 ?auto_99991 ) ) ( not ( = ?auto_99990 ?auto_99992 ) ) ( not ( = ?auto_99990 ?auto_99993 ) ) ( not ( = ?auto_99990 ?auto_99995 ) ) ( not ( = ?auto_99991 ?auto_99992 ) ) ( not ( = ?auto_99991 ?auto_99993 ) ) ( not ( = ?auto_99991 ?auto_99995 ) ) ( not ( = ?auto_99992 ?auto_99993 ) ) ( not ( = ?auto_99992 ?auto_99995 ) ) ( not ( = ?auto_99993 ?auto_99995 ) ) ( not ( = ?auto_99990 ?auto_99997 ) ) ( not ( = ?auto_99990 ?auto_99994 ) ) ( not ( = ?auto_99991 ?auto_99997 ) ) ( not ( = ?auto_99991 ?auto_99994 ) ) ( not ( = ?auto_99992 ?auto_99997 ) ) ( not ( = ?auto_99992 ?auto_99994 ) ) ( not ( = ?auto_99993 ?auto_99997 ) ) ( not ( = ?auto_99993 ?auto_99994 ) ) ( not ( = ?auto_99995 ?auto_99997 ) ) ( not ( = ?auto_99995 ?auto_99994 ) ) ( not ( = ?auto_99997 ?auto_99994 ) ) ( ON ?auto_99994 ?auto_99996 ) ( not ( = ?auto_99990 ?auto_99996 ) ) ( not ( = ?auto_99991 ?auto_99996 ) ) ( not ( = ?auto_99992 ?auto_99996 ) ) ( not ( = ?auto_99993 ?auto_99996 ) ) ( not ( = ?auto_99995 ?auto_99996 ) ) ( not ( = ?auto_99997 ?auto_99996 ) ) ( not ( = ?auto_99994 ?auto_99996 ) ) ( ON ?auto_99997 ?auto_99994 ) ( ON-TABLE ?auto_99996 ) ( ON ?auto_99995 ?auto_99997 ) ( ON ?auto_99993 ?auto_99995 ) ( ON ?auto_99992 ?auto_99993 ) ( CLEAR ?auto_99990 ) ( ON ?auto_99991 ?auto_99992 ) ( CLEAR ?auto_99991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_99996 ?auto_99994 ?auto_99997 ?auto_99995 ?auto_99993 ?auto_99992 )
      ( MAKE-4PILE ?auto_99990 ?auto_99991 ?auto_99992 ?auto_99993 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_99998 - BLOCK
      ?auto_99999 - BLOCK
      ?auto_100000 - BLOCK
      ?auto_100001 - BLOCK
    )
    :vars
    (
      ?auto_100005 - BLOCK
      ?auto_100002 - BLOCK
      ?auto_100004 - BLOCK
      ?auto_100003 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99998 ?auto_99999 ) ) ( not ( = ?auto_99998 ?auto_100000 ) ) ( not ( = ?auto_99998 ?auto_100001 ) ) ( not ( = ?auto_99998 ?auto_100005 ) ) ( not ( = ?auto_99999 ?auto_100000 ) ) ( not ( = ?auto_99999 ?auto_100001 ) ) ( not ( = ?auto_99999 ?auto_100005 ) ) ( not ( = ?auto_100000 ?auto_100001 ) ) ( not ( = ?auto_100000 ?auto_100005 ) ) ( not ( = ?auto_100001 ?auto_100005 ) ) ( not ( = ?auto_99998 ?auto_100002 ) ) ( not ( = ?auto_99998 ?auto_100004 ) ) ( not ( = ?auto_99999 ?auto_100002 ) ) ( not ( = ?auto_99999 ?auto_100004 ) ) ( not ( = ?auto_100000 ?auto_100002 ) ) ( not ( = ?auto_100000 ?auto_100004 ) ) ( not ( = ?auto_100001 ?auto_100002 ) ) ( not ( = ?auto_100001 ?auto_100004 ) ) ( not ( = ?auto_100005 ?auto_100002 ) ) ( not ( = ?auto_100005 ?auto_100004 ) ) ( not ( = ?auto_100002 ?auto_100004 ) ) ( ON ?auto_100004 ?auto_100003 ) ( not ( = ?auto_99998 ?auto_100003 ) ) ( not ( = ?auto_99999 ?auto_100003 ) ) ( not ( = ?auto_100000 ?auto_100003 ) ) ( not ( = ?auto_100001 ?auto_100003 ) ) ( not ( = ?auto_100005 ?auto_100003 ) ) ( not ( = ?auto_100002 ?auto_100003 ) ) ( not ( = ?auto_100004 ?auto_100003 ) ) ( ON ?auto_100002 ?auto_100004 ) ( ON-TABLE ?auto_100003 ) ( ON ?auto_100005 ?auto_100002 ) ( ON ?auto_100001 ?auto_100005 ) ( ON ?auto_100000 ?auto_100001 ) ( ON ?auto_99999 ?auto_100000 ) ( CLEAR ?auto_99999 ) ( HOLDING ?auto_99998 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_99998 )
      ( MAKE-4PILE ?auto_99998 ?auto_99999 ?auto_100000 ?auto_100001 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100006 - BLOCK
      ?auto_100007 - BLOCK
      ?auto_100008 - BLOCK
      ?auto_100009 - BLOCK
    )
    :vars
    (
      ?auto_100013 - BLOCK
      ?auto_100010 - BLOCK
      ?auto_100011 - BLOCK
      ?auto_100012 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100006 ?auto_100007 ) ) ( not ( = ?auto_100006 ?auto_100008 ) ) ( not ( = ?auto_100006 ?auto_100009 ) ) ( not ( = ?auto_100006 ?auto_100013 ) ) ( not ( = ?auto_100007 ?auto_100008 ) ) ( not ( = ?auto_100007 ?auto_100009 ) ) ( not ( = ?auto_100007 ?auto_100013 ) ) ( not ( = ?auto_100008 ?auto_100009 ) ) ( not ( = ?auto_100008 ?auto_100013 ) ) ( not ( = ?auto_100009 ?auto_100013 ) ) ( not ( = ?auto_100006 ?auto_100010 ) ) ( not ( = ?auto_100006 ?auto_100011 ) ) ( not ( = ?auto_100007 ?auto_100010 ) ) ( not ( = ?auto_100007 ?auto_100011 ) ) ( not ( = ?auto_100008 ?auto_100010 ) ) ( not ( = ?auto_100008 ?auto_100011 ) ) ( not ( = ?auto_100009 ?auto_100010 ) ) ( not ( = ?auto_100009 ?auto_100011 ) ) ( not ( = ?auto_100013 ?auto_100010 ) ) ( not ( = ?auto_100013 ?auto_100011 ) ) ( not ( = ?auto_100010 ?auto_100011 ) ) ( ON ?auto_100011 ?auto_100012 ) ( not ( = ?auto_100006 ?auto_100012 ) ) ( not ( = ?auto_100007 ?auto_100012 ) ) ( not ( = ?auto_100008 ?auto_100012 ) ) ( not ( = ?auto_100009 ?auto_100012 ) ) ( not ( = ?auto_100013 ?auto_100012 ) ) ( not ( = ?auto_100010 ?auto_100012 ) ) ( not ( = ?auto_100011 ?auto_100012 ) ) ( ON ?auto_100010 ?auto_100011 ) ( ON-TABLE ?auto_100012 ) ( ON ?auto_100013 ?auto_100010 ) ( ON ?auto_100009 ?auto_100013 ) ( ON ?auto_100008 ?auto_100009 ) ( ON ?auto_100007 ?auto_100008 ) ( ON ?auto_100006 ?auto_100007 ) ( CLEAR ?auto_100006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_100012 ?auto_100011 ?auto_100010 ?auto_100013 ?auto_100009 ?auto_100008 ?auto_100007 )
      ( MAKE-4PILE ?auto_100006 ?auto_100007 ?auto_100008 ?auto_100009 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100017 - BLOCK
      ?auto_100018 - BLOCK
      ?auto_100019 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_100019 ) ( CLEAR ?auto_100018 ) ( ON-TABLE ?auto_100017 ) ( ON ?auto_100018 ?auto_100017 ) ( not ( = ?auto_100017 ?auto_100018 ) ) ( not ( = ?auto_100017 ?auto_100019 ) ) ( not ( = ?auto_100018 ?auto_100019 ) ) )
    :subtasks
    ( ( !STACK ?auto_100019 ?auto_100018 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100020 - BLOCK
      ?auto_100021 - BLOCK
      ?auto_100022 - BLOCK
    )
    :vars
    (
      ?auto_100023 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_100021 ) ( ON-TABLE ?auto_100020 ) ( ON ?auto_100021 ?auto_100020 ) ( not ( = ?auto_100020 ?auto_100021 ) ) ( not ( = ?auto_100020 ?auto_100022 ) ) ( not ( = ?auto_100021 ?auto_100022 ) ) ( ON ?auto_100022 ?auto_100023 ) ( CLEAR ?auto_100022 ) ( HAND-EMPTY ) ( not ( = ?auto_100020 ?auto_100023 ) ) ( not ( = ?auto_100021 ?auto_100023 ) ) ( not ( = ?auto_100022 ?auto_100023 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100022 ?auto_100023 )
      ( MAKE-3PILE ?auto_100020 ?auto_100021 ?auto_100022 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100024 - BLOCK
      ?auto_100025 - BLOCK
      ?auto_100026 - BLOCK
    )
    :vars
    (
      ?auto_100027 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_100024 ) ( not ( = ?auto_100024 ?auto_100025 ) ) ( not ( = ?auto_100024 ?auto_100026 ) ) ( not ( = ?auto_100025 ?auto_100026 ) ) ( ON ?auto_100026 ?auto_100027 ) ( CLEAR ?auto_100026 ) ( not ( = ?auto_100024 ?auto_100027 ) ) ( not ( = ?auto_100025 ?auto_100027 ) ) ( not ( = ?auto_100026 ?auto_100027 ) ) ( HOLDING ?auto_100025 ) ( CLEAR ?auto_100024 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100024 ?auto_100025 )
      ( MAKE-3PILE ?auto_100024 ?auto_100025 ?auto_100026 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100028 - BLOCK
      ?auto_100029 - BLOCK
      ?auto_100030 - BLOCK
    )
    :vars
    (
      ?auto_100031 - BLOCK
      ?auto_100033 - BLOCK
      ?auto_100032 - BLOCK
      ?auto_100034 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_100028 ) ( not ( = ?auto_100028 ?auto_100029 ) ) ( not ( = ?auto_100028 ?auto_100030 ) ) ( not ( = ?auto_100029 ?auto_100030 ) ) ( ON ?auto_100030 ?auto_100031 ) ( not ( = ?auto_100028 ?auto_100031 ) ) ( not ( = ?auto_100029 ?auto_100031 ) ) ( not ( = ?auto_100030 ?auto_100031 ) ) ( CLEAR ?auto_100028 ) ( ON ?auto_100029 ?auto_100030 ) ( CLEAR ?auto_100029 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100033 ) ( ON ?auto_100032 ?auto_100033 ) ( ON ?auto_100034 ?auto_100032 ) ( ON ?auto_100031 ?auto_100034 ) ( not ( = ?auto_100033 ?auto_100032 ) ) ( not ( = ?auto_100033 ?auto_100034 ) ) ( not ( = ?auto_100033 ?auto_100031 ) ) ( not ( = ?auto_100033 ?auto_100030 ) ) ( not ( = ?auto_100033 ?auto_100029 ) ) ( not ( = ?auto_100032 ?auto_100034 ) ) ( not ( = ?auto_100032 ?auto_100031 ) ) ( not ( = ?auto_100032 ?auto_100030 ) ) ( not ( = ?auto_100032 ?auto_100029 ) ) ( not ( = ?auto_100034 ?auto_100031 ) ) ( not ( = ?auto_100034 ?auto_100030 ) ) ( not ( = ?auto_100034 ?auto_100029 ) ) ( not ( = ?auto_100028 ?auto_100033 ) ) ( not ( = ?auto_100028 ?auto_100032 ) ) ( not ( = ?auto_100028 ?auto_100034 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100033 ?auto_100032 ?auto_100034 ?auto_100031 ?auto_100030 )
      ( MAKE-3PILE ?auto_100028 ?auto_100029 ?auto_100030 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100035 - BLOCK
      ?auto_100036 - BLOCK
      ?auto_100037 - BLOCK
    )
    :vars
    (
      ?auto_100041 - BLOCK
      ?auto_100039 - BLOCK
      ?auto_100038 - BLOCK
      ?auto_100040 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100035 ?auto_100036 ) ) ( not ( = ?auto_100035 ?auto_100037 ) ) ( not ( = ?auto_100036 ?auto_100037 ) ) ( ON ?auto_100037 ?auto_100041 ) ( not ( = ?auto_100035 ?auto_100041 ) ) ( not ( = ?auto_100036 ?auto_100041 ) ) ( not ( = ?auto_100037 ?auto_100041 ) ) ( ON ?auto_100036 ?auto_100037 ) ( CLEAR ?auto_100036 ) ( ON-TABLE ?auto_100039 ) ( ON ?auto_100038 ?auto_100039 ) ( ON ?auto_100040 ?auto_100038 ) ( ON ?auto_100041 ?auto_100040 ) ( not ( = ?auto_100039 ?auto_100038 ) ) ( not ( = ?auto_100039 ?auto_100040 ) ) ( not ( = ?auto_100039 ?auto_100041 ) ) ( not ( = ?auto_100039 ?auto_100037 ) ) ( not ( = ?auto_100039 ?auto_100036 ) ) ( not ( = ?auto_100038 ?auto_100040 ) ) ( not ( = ?auto_100038 ?auto_100041 ) ) ( not ( = ?auto_100038 ?auto_100037 ) ) ( not ( = ?auto_100038 ?auto_100036 ) ) ( not ( = ?auto_100040 ?auto_100041 ) ) ( not ( = ?auto_100040 ?auto_100037 ) ) ( not ( = ?auto_100040 ?auto_100036 ) ) ( not ( = ?auto_100035 ?auto_100039 ) ) ( not ( = ?auto_100035 ?auto_100038 ) ) ( not ( = ?auto_100035 ?auto_100040 ) ) ( HOLDING ?auto_100035 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100035 )
      ( MAKE-3PILE ?auto_100035 ?auto_100036 ?auto_100037 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100042 - BLOCK
      ?auto_100043 - BLOCK
      ?auto_100044 - BLOCK
    )
    :vars
    (
      ?auto_100048 - BLOCK
      ?auto_100046 - BLOCK
      ?auto_100045 - BLOCK
      ?auto_100047 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100042 ?auto_100043 ) ) ( not ( = ?auto_100042 ?auto_100044 ) ) ( not ( = ?auto_100043 ?auto_100044 ) ) ( ON ?auto_100044 ?auto_100048 ) ( not ( = ?auto_100042 ?auto_100048 ) ) ( not ( = ?auto_100043 ?auto_100048 ) ) ( not ( = ?auto_100044 ?auto_100048 ) ) ( ON ?auto_100043 ?auto_100044 ) ( ON-TABLE ?auto_100046 ) ( ON ?auto_100045 ?auto_100046 ) ( ON ?auto_100047 ?auto_100045 ) ( ON ?auto_100048 ?auto_100047 ) ( not ( = ?auto_100046 ?auto_100045 ) ) ( not ( = ?auto_100046 ?auto_100047 ) ) ( not ( = ?auto_100046 ?auto_100048 ) ) ( not ( = ?auto_100046 ?auto_100044 ) ) ( not ( = ?auto_100046 ?auto_100043 ) ) ( not ( = ?auto_100045 ?auto_100047 ) ) ( not ( = ?auto_100045 ?auto_100048 ) ) ( not ( = ?auto_100045 ?auto_100044 ) ) ( not ( = ?auto_100045 ?auto_100043 ) ) ( not ( = ?auto_100047 ?auto_100048 ) ) ( not ( = ?auto_100047 ?auto_100044 ) ) ( not ( = ?auto_100047 ?auto_100043 ) ) ( not ( = ?auto_100042 ?auto_100046 ) ) ( not ( = ?auto_100042 ?auto_100045 ) ) ( not ( = ?auto_100042 ?auto_100047 ) ) ( ON ?auto_100042 ?auto_100043 ) ( CLEAR ?auto_100042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100046 ?auto_100045 ?auto_100047 ?auto_100048 ?auto_100044 ?auto_100043 )
      ( MAKE-3PILE ?auto_100042 ?auto_100043 ?auto_100044 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100049 - BLOCK
      ?auto_100050 - BLOCK
      ?auto_100051 - BLOCK
    )
    :vars
    (
      ?auto_100055 - BLOCK
      ?auto_100052 - BLOCK
      ?auto_100054 - BLOCK
      ?auto_100053 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100049 ?auto_100050 ) ) ( not ( = ?auto_100049 ?auto_100051 ) ) ( not ( = ?auto_100050 ?auto_100051 ) ) ( ON ?auto_100051 ?auto_100055 ) ( not ( = ?auto_100049 ?auto_100055 ) ) ( not ( = ?auto_100050 ?auto_100055 ) ) ( not ( = ?auto_100051 ?auto_100055 ) ) ( ON ?auto_100050 ?auto_100051 ) ( ON-TABLE ?auto_100052 ) ( ON ?auto_100054 ?auto_100052 ) ( ON ?auto_100053 ?auto_100054 ) ( ON ?auto_100055 ?auto_100053 ) ( not ( = ?auto_100052 ?auto_100054 ) ) ( not ( = ?auto_100052 ?auto_100053 ) ) ( not ( = ?auto_100052 ?auto_100055 ) ) ( not ( = ?auto_100052 ?auto_100051 ) ) ( not ( = ?auto_100052 ?auto_100050 ) ) ( not ( = ?auto_100054 ?auto_100053 ) ) ( not ( = ?auto_100054 ?auto_100055 ) ) ( not ( = ?auto_100054 ?auto_100051 ) ) ( not ( = ?auto_100054 ?auto_100050 ) ) ( not ( = ?auto_100053 ?auto_100055 ) ) ( not ( = ?auto_100053 ?auto_100051 ) ) ( not ( = ?auto_100053 ?auto_100050 ) ) ( not ( = ?auto_100049 ?auto_100052 ) ) ( not ( = ?auto_100049 ?auto_100054 ) ) ( not ( = ?auto_100049 ?auto_100053 ) ) ( HOLDING ?auto_100049 ) ( CLEAR ?auto_100050 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_100052 ?auto_100054 ?auto_100053 ?auto_100055 ?auto_100051 ?auto_100050 ?auto_100049 )
      ( MAKE-3PILE ?auto_100049 ?auto_100050 ?auto_100051 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100056 - BLOCK
      ?auto_100057 - BLOCK
      ?auto_100058 - BLOCK
    )
    :vars
    (
      ?auto_100059 - BLOCK
      ?auto_100060 - BLOCK
      ?auto_100061 - BLOCK
      ?auto_100062 - BLOCK
      ?auto_100063 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100056 ?auto_100057 ) ) ( not ( = ?auto_100056 ?auto_100058 ) ) ( not ( = ?auto_100057 ?auto_100058 ) ) ( ON ?auto_100058 ?auto_100059 ) ( not ( = ?auto_100056 ?auto_100059 ) ) ( not ( = ?auto_100057 ?auto_100059 ) ) ( not ( = ?auto_100058 ?auto_100059 ) ) ( ON ?auto_100057 ?auto_100058 ) ( ON-TABLE ?auto_100060 ) ( ON ?auto_100061 ?auto_100060 ) ( ON ?auto_100062 ?auto_100061 ) ( ON ?auto_100059 ?auto_100062 ) ( not ( = ?auto_100060 ?auto_100061 ) ) ( not ( = ?auto_100060 ?auto_100062 ) ) ( not ( = ?auto_100060 ?auto_100059 ) ) ( not ( = ?auto_100060 ?auto_100058 ) ) ( not ( = ?auto_100060 ?auto_100057 ) ) ( not ( = ?auto_100061 ?auto_100062 ) ) ( not ( = ?auto_100061 ?auto_100059 ) ) ( not ( = ?auto_100061 ?auto_100058 ) ) ( not ( = ?auto_100061 ?auto_100057 ) ) ( not ( = ?auto_100062 ?auto_100059 ) ) ( not ( = ?auto_100062 ?auto_100058 ) ) ( not ( = ?auto_100062 ?auto_100057 ) ) ( not ( = ?auto_100056 ?auto_100060 ) ) ( not ( = ?auto_100056 ?auto_100061 ) ) ( not ( = ?auto_100056 ?auto_100062 ) ) ( CLEAR ?auto_100057 ) ( ON ?auto_100056 ?auto_100063 ) ( CLEAR ?auto_100056 ) ( HAND-EMPTY ) ( not ( = ?auto_100056 ?auto_100063 ) ) ( not ( = ?auto_100057 ?auto_100063 ) ) ( not ( = ?auto_100058 ?auto_100063 ) ) ( not ( = ?auto_100059 ?auto_100063 ) ) ( not ( = ?auto_100060 ?auto_100063 ) ) ( not ( = ?auto_100061 ?auto_100063 ) ) ( not ( = ?auto_100062 ?auto_100063 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100056 ?auto_100063 )
      ( MAKE-3PILE ?auto_100056 ?auto_100057 ?auto_100058 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100064 - BLOCK
      ?auto_100065 - BLOCK
      ?auto_100066 - BLOCK
    )
    :vars
    (
      ?auto_100069 - BLOCK
      ?auto_100067 - BLOCK
      ?auto_100068 - BLOCK
      ?auto_100070 - BLOCK
      ?auto_100071 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100064 ?auto_100065 ) ) ( not ( = ?auto_100064 ?auto_100066 ) ) ( not ( = ?auto_100065 ?auto_100066 ) ) ( ON ?auto_100066 ?auto_100069 ) ( not ( = ?auto_100064 ?auto_100069 ) ) ( not ( = ?auto_100065 ?auto_100069 ) ) ( not ( = ?auto_100066 ?auto_100069 ) ) ( ON-TABLE ?auto_100067 ) ( ON ?auto_100068 ?auto_100067 ) ( ON ?auto_100070 ?auto_100068 ) ( ON ?auto_100069 ?auto_100070 ) ( not ( = ?auto_100067 ?auto_100068 ) ) ( not ( = ?auto_100067 ?auto_100070 ) ) ( not ( = ?auto_100067 ?auto_100069 ) ) ( not ( = ?auto_100067 ?auto_100066 ) ) ( not ( = ?auto_100067 ?auto_100065 ) ) ( not ( = ?auto_100068 ?auto_100070 ) ) ( not ( = ?auto_100068 ?auto_100069 ) ) ( not ( = ?auto_100068 ?auto_100066 ) ) ( not ( = ?auto_100068 ?auto_100065 ) ) ( not ( = ?auto_100070 ?auto_100069 ) ) ( not ( = ?auto_100070 ?auto_100066 ) ) ( not ( = ?auto_100070 ?auto_100065 ) ) ( not ( = ?auto_100064 ?auto_100067 ) ) ( not ( = ?auto_100064 ?auto_100068 ) ) ( not ( = ?auto_100064 ?auto_100070 ) ) ( ON ?auto_100064 ?auto_100071 ) ( CLEAR ?auto_100064 ) ( not ( = ?auto_100064 ?auto_100071 ) ) ( not ( = ?auto_100065 ?auto_100071 ) ) ( not ( = ?auto_100066 ?auto_100071 ) ) ( not ( = ?auto_100069 ?auto_100071 ) ) ( not ( = ?auto_100067 ?auto_100071 ) ) ( not ( = ?auto_100068 ?auto_100071 ) ) ( not ( = ?auto_100070 ?auto_100071 ) ) ( HOLDING ?auto_100065 ) ( CLEAR ?auto_100066 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100067 ?auto_100068 ?auto_100070 ?auto_100069 ?auto_100066 ?auto_100065 )
      ( MAKE-3PILE ?auto_100064 ?auto_100065 ?auto_100066 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100072 - BLOCK
      ?auto_100073 - BLOCK
      ?auto_100074 - BLOCK
    )
    :vars
    (
      ?auto_100076 - BLOCK
      ?auto_100078 - BLOCK
      ?auto_100075 - BLOCK
      ?auto_100077 - BLOCK
      ?auto_100079 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100072 ?auto_100073 ) ) ( not ( = ?auto_100072 ?auto_100074 ) ) ( not ( = ?auto_100073 ?auto_100074 ) ) ( ON ?auto_100074 ?auto_100076 ) ( not ( = ?auto_100072 ?auto_100076 ) ) ( not ( = ?auto_100073 ?auto_100076 ) ) ( not ( = ?auto_100074 ?auto_100076 ) ) ( ON-TABLE ?auto_100078 ) ( ON ?auto_100075 ?auto_100078 ) ( ON ?auto_100077 ?auto_100075 ) ( ON ?auto_100076 ?auto_100077 ) ( not ( = ?auto_100078 ?auto_100075 ) ) ( not ( = ?auto_100078 ?auto_100077 ) ) ( not ( = ?auto_100078 ?auto_100076 ) ) ( not ( = ?auto_100078 ?auto_100074 ) ) ( not ( = ?auto_100078 ?auto_100073 ) ) ( not ( = ?auto_100075 ?auto_100077 ) ) ( not ( = ?auto_100075 ?auto_100076 ) ) ( not ( = ?auto_100075 ?auto_100074 ) ) ( not ( = ?auto_100075 ?auto_100073 ) ) ( not ( = ?auto_100077 ?auto_100076 ) ) ( not ( = ?auto_100077 ?auto_100074 ) ) ( not ( = ?auto_100077 ?auto_100073 ) ) ( not ( = ?auto_100072 ?auto_100078 ) ) ( not ( = ?auto_100072 ?auto_100075 ) ) ( not ( = ?auto_100072 ?auto_100077 ) ) ( ON ?auto_100072 ?auto_100079 ) ( not ( = ?auto_100072 ?auto_100079 ) ) ( not ( = ?auto_100073 ?auto_100079 ) ) ( not ( = ?auto_100074 ?auto_100079 ) ) ( not ( = ?auto_100076 ?auto_100079 ) ) ( not ( = ?auto_100078 ?auto_100079 ) ) ( not ( = ?auto_100075 ?auto_100079 ) ) ( not ( = ?auto_100077 ?auto_100079 ) ) ( CLEAR ?auto_100074 ) ( ON ?auto_100073 ?auto_100072 ) ( CLEAR ?auto_100073 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100079 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100079 ?auto_100072 )
      ( MAKE-3PILE ?auto_100072 ?auto_100073 ?auto_100074 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100080 - BLOCK
      ?auto_100081 - BLOCK
      ?auto_100082 - BLOCK
    )
    :vars
    (
      ?auto_100083 - BLOCK
      ?auto_100084 - BLOCK
      ?auto_100085 - BLOCK
      ?auto_100087 - BLOCK
      ?auto_100086 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100080 ?auto_100081 ) ) ( not ( = ?auto_100080 ?auto_100082 ) ) ( not ( = ?auto_100081 ?auto_100082 ) ) ( not ( = ?auto_100080 ?auto_100083 ) ) ( not ( = ?auto_100081 ?auto_100083 ) ) ( not ( = ?auto_100082 ?auto_100083 ) ) ( ON-TABLE ?auto_100084 ) ( ON ?auto_100085 ?auto_100084 ) ( ON ?auto_100087 ?auto_100085 ) ( ON ?auto_100083 ?auto_100087 ) ( not ( = ?auto_100084 ?auto_100085 ) ) ( not ( = ?auto_100084 ?auto_100087 ) ) ( not ( = ?auto_100084 ?auto_100083 ) ) ( not ( = ?auto_100084 ?auto_100082 ) ) ( not ( = ?auto_100084 ?auto_100081 ) ) ( not ( = ?auto_100085 ?auto_100087 ) ) ( not ( = ?auto_100085 ?auto_100083 ) ) ( not ( = ?auto_100085 ?auto_100082 ) ) ( not ( = ?auto_100085 ?auto_100081 ) ) ( not ( = ?auto_100087 ?auto_100083 ) ) ( not ( = ?auto_100087 ?auto_100082 ) ) ( not ( = ?auto_100087 ?auto_100081 ) ) ( not ( = ?auto_100080 ?auto_100084 ) ) ( not ( = ?auto_100080 ?auto_100085 ) ) ( not ( = ?auto_100080 ?auto_100087 ) ) ( ON ?auto_100080 ?auto_100086 ) ( not ( = ?auto_100080 ?auto_100086 ) ) ( not ( = ?auto_100081 ?auto_100086 ) ) ( not ( = ?auto_100082 ?auto_100086 ) ) ( not ( = ?auto_100083 ?auto_100086 ) ) ( not ( = ?auto_100084 ?auto_100086 ) ) ( not ( = ?auto_100085 ?auto_100086 ) ) ( not ( = ?auto_100087 ?auto_100086 ) ) ( ON ?auto_100081 ?auto_100080 ) ( CLEAR ?auto_100081 ) ( ON-TABLE ?auto_100086 ) ( HOLDING ?auto_100082 ) ( CLEAR ?auto_100083 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100084 ?auto_100085 ?auto_100087 ?auto_100083 ?auto_100082 )
      ( MAKE-3PILE ?auto_100080 ?auto_100081 ?auto_100082 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100088 - BLOCK
      ?auto_100089 - BLOCK
      ?auto_100090 - BLOCK
    )
    :vars
    (
      ?auto_100092 - BLOCK
      ?auto_100091 - BLOCK
      ?auto_100094 - BLOCK
      ?auto_100093 - BLOCK
      ?auto_100095 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100088 ?auto_100089 ) ) ( not ( = ?auto_100088 ?auto_100090 ) ) ( not ( = ?auto_100089 ?auto_100090 ) ) ( not ( = ?auto_100088 ?auto_100092 ) ) ( not ( = ?auto_100089 ?auto_100092 ) ) ( not ( = ?auto_100090 ?auto_100092 ) ) ( ON-TABLE ?auto_100091 ) ( ON ?auto_100094 ?auto_100091 ) ( ON ?auto_100093 ?auto_100094 ) ( ON ?auto_100092 ?auto_100093 ) ( not ( = ?auto_100091 ?auto_100094 ) ) ( not ( = ?auto_100091 ?auto_100093 ) ) ( not ( = ?auto_100091 ?auto_100092 ) ) ( not ( = ?auto_100091 ?auto_100090 ) ) ( not ( = ?auto_100091 ?auto_100089 ) ) ( not ( = ?auto_100094 ?auto_100093 ) ) ( not ( = ?auto_100094 ?auto_100092 ) ) ( not ( = ?auto_100094 ?auto_100090 ) ) ( not ( = ?auto_100094 ?auto_100089 ) ) ( not ( = ?auto_100093 ?auto_100092 ) ) ( not ( = ?auto_100093 ?auto_100090 ) ) ( not ( = ?auto_100093 ?auto_100089 ) ) ( not ( = ?auto_100088 ?auto_100091 ) ) ( not ( = ?auto_100088 ?auto_100094 ) ) ( not ( = ?auto_100088 ?auto_100093 ) ) ( ON ?auto_100088 ?auto_100095 ) ( not ( = ?auto_100088 ?auto_100095 ) ) ( not ( = ?auto_100089 ?auto_100095 ) ) ( not ( = ?auto_100090 ?auto_100095 ) ) ( not ( = ?auto_100092 ?auto_100095 ) ) ( not ( = ?auto_100091 ?auto_100095 ) ) ( not ( = ?auto_100094 ?auto_100095 ) ) ( not ( = ?auto_100093 ?auto_100095 ) ) ( ON ?auto_100089 ?auto_100088 ) ( ON-TABLE ?auto_100095 ) ( CLEAR ?auto_100092 ) ( ON ?auto_100090 ?auto_100089 ) ( CLEAR ?auto_100090 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100095 ?auto_100088 ?auto_100089 )
      ( MAKE-3PILE ?auto_100088 ?auto_100089 ?auto_100090 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100096 - BLOCK
      ?auto_100097 - BLOCK
      ?auto_100098 - BLOCK
    )
    :vars
    (
      ?auto_100099 - BLOCK
      ?auto_100103 - BLOCK
      ?auto_100101 - BLOCK
      ?auto_100102 - BLOCK
      ?auto_100100 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100096 ?auto_100097 ) ) ( not ( = ?auto_100096 ?auto_100098 ) ) ( not ( = ?auto_100097 ?auto_100098 ) ) ( not ( = ?auto_100096 ?auto_100099 ) ) ( not ( = ?auto_100097 ?auto_100099 ) ) ( not ( = ?auto_100098 ?auto_100099 ) ) ( ON-TABLE ?auto_100103 ) ( ON ?auto_100101 ?auto_100103 ) ( ON ?auto_100102 ?auto_100101 ) ( not ( = ?auto_100103 ?auto_100101 ) ) ( not ( = ?auto_100103 ?auto_100102 ) ) ( not ( = ?auto_100103 ?auto_100099 ) ) ( not ( = ?auto_100103 ?auto_100098 ) ) ( not ( = ?auto_100103 ?auto_100097 ) ) ( not ( = ?auto_100101 ?auto_100102 ) ) ( not ( = ?auto_100101 ?auto_100099 ) ) ( not ( = ?auto_100101 ?auto_100098 ) ) ( not ( = ?auto_100101 ?auto_100097 ) ) ( not ( = ?auto_100102 ?auto_100099 ) ) ( not ( = ?auto_100102 ?auto_100098 ) ) ( not ( = ?auto_100102 ?auto_100097 ) ) ( not ( = ?auto_100096 ?auto_100103 ) ) ( not ( = ?auto_100096 ?auto_100101 ) ) ( not ( = ?auto_100096 ?auto_100102 ) ) ( ON ?auto_100096 ?auto_100100 ) ( not ( = ?auto_100096 ?auto_100100 ) ) ( not ( = ?auto_100097 ?auto_100100 ) ) ( not ( = ?auto_100098 ?auto_100100 ) ) ( not ( = ?auto_100099 ?auto_100100 ) ) ( not ( = ?auto_100103 ?auto_100100 ) ) ( not ( = ?auto_100101 ?auto_100100 ) ) ( not ( = ?auto_100102 ?auto_100100 ) ) ( ON ?auto_100097 ?auto_100096 ) ( ON-TABLE ?auto_100100 ) ( ON ?auto_100098 ?auto_100097 ) ( CLEAR ?auto_100098 ) ( HOLDING ?auto_100099 ) ( CLEAR ?auto_100102 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100103 ?auto_100101 ?auto_100102 ?auto_100099 )
      ( MAKE-3PILE ?auto_100096 ?auto_100097 ?auto_100098 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100104 - BLOCK
      ?auto_100105 - BLOCK
      ?auto_100106 - BLOCK
    )
    :vars
    (
      ?auto_100111 - BLOCK
      ?auto_100109 - BLOCK
      ?auto_100110 - BLOCK
      ?auto_100107 - BLOCK
      ?auto_100108 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100104 ?auto_100105 ) ) ( not ( = ?auto_100104 ?auto_100106 ) ) ( not ( = ?auto_100105 ?auto_100106 ) ) ( not ( = ?auto_100104 ?auto_100111 ) ) ( not ( = ?auto_100105 ?auto_100111 ) ) ( not ( = ?auto_100106 ?auto_100111 ) ) ( ON-TABLE ?auto_100109 ) ( ON ?auto_100110 ?auto_100109 ) ( ON ?auto_100107 ?auto_100110 ) ( not ( = ?auto_100109 ?auto_100110 ) ) ( not ( = ?auto_100109 ?auto_100107 ) ) ( not ( = ?auto_100109 ?auto_100111 ) ) ( not ( = ?auto_100109 ?auto_100106 ) ) ( not ( = ?auto_100109 ?auto_100105 ) ) ( not ( = ?auto_100110 ?auto_100107 ) ) ( not ( = ?auto_100110 ?auto_100111 ) ) ( not ( = ?auto_100110 ?auto_100106 ) ) ( not ( = ?auto_100110 ?auto_100105 ) ) ( not ( = ?auto_100107 ?auto_100111 ) ) ( not ( = ?auto_100107 ?auto_100106 ) ) ( not ( = ?auto_100107 ?auto_100105 ) ) ( not ( = ?auto_100104 ?auto_100109 ) ) ( not ( = ?auto_100104 ?auto_100110 ) ) ( not ( = ?auto_100104 ?auto_100107 ) ) ( ON ?auto_100104 ?auto_100108 ) ( not ( = ?auto_100104 ?auto_100108 ) ) ( not ( = ?auto_100105 ?auto_100108 ) ) ( not ( = ?auto_100106 ?auto_100108 ) ) ( not ( = ?auto_100111 ?auto_100108 ) ) ( not ( = ?auto_100109 ?auto_100108 ) ) ( not ( = ?auto_100110 ?auto_100108 ) ) ( not ( = ?auto_100107 ?auto_100108 ) ) ( ON ?auto_100105 ?auto_100104 ) ( ON-TABLE ?auto_100108 ) ( ON ?auto_100106 ?auto_100105 ) ( CLEAR ?auto_100107 ) ( ON ?auto_100111 ?auto_100106 ) ( CLEAR ?auto_100111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100108 ?auto_100104 ?auto_100105 ?auto_100106 )
      ( MAKE-3PILE ?auto_100104 ?auto_100105 ?auto_100106 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100112 - BLOCK
      ?auto_100113 - BLOCK
      ?auto_100114 - BLOCK
    )
    :vars
    (
      ?auto_100115 - BLOCK
      ?auto_100118 - BLOCK
      ?auto_100117 - BLOCK
      ?auto_100119 - BLOCK
      ?auto_100116 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100112 ?auto_100113 ) ) ( not ( = ?auto_100112 ?auto_100114 ) ) ( not ( = ?auto_100113 ?auto_100114 ) ) ( not ( = ?auto_100112 ?auto_100115 ) ) ( not ( = ?auto_100113 ?auto_100115 ) ) ( not ( = ?auto_100114 ?auto_100115 ) ) ( ON-TABLE ?auto_100118 ) ( ON ?auto_100117 ?auto_100118 ) ( not ( = ?auto_100118 ?auto_100117 ) ) ( not ( = ?auto_100118 ?auto_100119 ) ) ( not ( = ?auto_100118 ?auto_100115 ) ) ( not ( = ?auto_100118 ?auto_100114 ) ) ( not ( = ?auto_100118 ?auto_100113 ) ) ( not ( = ?auto_100117 ?auto_100119 ) ) ( not ( = ?auto_100117 ?auto_100115 ) ) ( not ( = ?auto_100117 ?auto_100114 ) ) ( not ( = ?auto_100117 ?auto_100113 ) ) ( not ( = ?auto_100119 ?auto_100115 ) ) ( not ( = ?auto_100119 ?auto_100114 ) ) ( not ( = ?auto_100119 ?auto_100113 ) ) ( not ( = ?auto_100112 ?auto_100118 ) ) ( not ( = ?auto_100112 ?auto_100117 ) ) ( not ( = ?auto_100112 ?auto_100119 ) ) ( ON ?auto_100112 ?auto_100116 ) ( not ( = ?auto_100112 ?auto_100116 ) ) ( not ( = ?auto_100113 ?auto_100116 ) ) ( not ( = ?auto_100114 ?auto_100116 ) ) ( not ( = ?auto_100115 ?auto_100116 ) ) ( not ( = ?auto_100118 ?auto_100116 ) ) ( not ( = ?auto_100117 ?auto_100116 ) ) ( not ( = ?auto_100119 ?auto_100116 ) ) ( ON ?auto_100113 ?auto_100112 ) ( ON-TABLE ?auto_100116 ) ( ON ?auto_100114 ?auto_100113 ) ( ON ?auto_100115 ?auto_100114 ) ( CLEAR ?auto_100115 ) ( HOLDING ?auto_100119 ) ( CLEAR ?auto_100117 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100118 ?auto_100117 ?auto_100119 )
      ( MAKE-3PILE ?auto_100112 ?auto_100113 ?auto_100114 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100120 - BLOCK
      ?auto_100121 - BLOCK
      ?auto_100122 - BLOCK
    )
    :vars
    (
      ?auto_100127 - BLOCK
      ?auto_100126 - BLOCK
      ?auto_100125 - BLOCK
      ?auto_100123 - BLOCK
      ?auto_100124 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100120 ?auto_100121 ) ) ( not ( = ?auto_100120 ?auto_100122 ) ) ( not ( = ?auto_100121 ?auto_100122 ) ) ( not ( = ?auto_100120 ?auto_100127 ) ) ( not ( = ?auto_100121 ?auto_100127 ) ) ( not ( = ?auto_100122 ?auto_100127 ) ) ( ON-TABLE ?auto_100126 ) ( ON ?auto_100125 ?auto_100126 ) ( not ( = ?auto_100126 ?auto_100125 ) ) ( not ( = ?auto_100126 ?auto_100123 ) ) ( not ( = ?auto_100126 ?auto_100127 ) ) ( not ( = ?auto_100126 ?auto_100122 ) ) ( not ( = ?auto_100126 ?auto_100121 ) ) ( not ( = ?auto_100125 ?auto_100123 ) ) ( not ( = ?auto_100125 ?auto_100127 ) ) ( not ( = ?auto_100125 ?auto_100122 ) ) ( not ( = ?auto_100125 ?auto_100121 ) ) ( not ( = ?auto_100123 ?auto_100127 ) ) ( not ( = ?auto_100123 ?auto_100122 ) ) ( not ( = ?auto_100123 ?auto_100121 ) ) ( not ( = ?auto_100120 ?auto_100126 ) ) ( not ( = ?auto_100120 ?auto_100125 ) ) ( not ( = ?auto_100120 ?auto_100123 ) ) ( ON ?auto_100120 ?auto_100124 ) ( not ( = ?auto_100120 ?auto_100124 ) ) ( not ( = ?auto_100121 ?auto_100124 ) ) ( not ( = ?auto_100122 ?auto_100124 ) ) ( not ( = ?auto_100127 ?auto_100124 ) ) ( not ( = ?auto_100126 ?auto_100124 ) ) ( not ( = ?auto_100125 ?auto_100124 ) ) ( not ( = ?auto_100123 ?auto_100124 ) ) ( ON ?auto_100121 ?auto_100120 ) ( ON-TABLE ?auto_100124 ) ( ON ?auto_100122 ?auto_100121 ) ( ON ?auto_100127 ?auto_100122 ) ( CLEAR ?auto_100125 ) ( ON ?auto_100123 ?auto_100127 ) ( CLEAR ?auto_100123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100124 ?auto_100120 ?auto_100121 ?auto_100122 ?auto_100127 )
      ( MAKE-3PILE ?auto_100120 ?auto_100121 ?auto_100122 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100128 - BLOCK
      ?auto_100129 - BLOCK
      ?auto_100130 - BLOCK
    )
    :vars
    (
      ?auto_100132 - BLOCK
      ?auto_100134 - BLOCK
      ?auto_100131 - BLOCK
      ?auto_100133 - BLOCK
      ?auto_100135 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100128 ?auto_100129 ) ) ( not ( = ?auto_100128 ?auto_100130 ) ) ( not ( = ?auto_100129 ?auto_100130 ) ) ( not ( = ?auto_100128 ?auto_100132 ) ) ( not ( = ?auto_100129 ?auto_100132 ) ) ( not ( = ?auto_100130 ?auto_100132 ) ) ( ON-TABLE ?auto_100134 ) ( not ( = ?auto_100134 ?auto_100131 ) ) ( not ( = ?auto_100134 ?auto_100133 ) ) ( not ( = ?auto_100134 ?auto_100132 ) ) ( not ( = ?auto_100134 ?auto_100130 ) ) ( not ( = ?auto_100134 ?auto_100129 ) ) ( not ( = ?auto_100131 ?auto_100133 ) ) ( not ( = ?auto_100131 ?auto_100132 ) ) ( not ( = ?auto_100131 ?auto_100130 ) ) ( not ( = ?auto_100131 ?auto_100129 ) ) ( not ( = ?auto_100133 ?auto_100132 ) ) ( not ( = ?auto_100133 ?auto_100130 ) ) ( not ( = ?auto_100133 ?auto_100129 ) ) ( not ( = ?auto_100128 ?auto_100134 ) ) ( not ( = ?auto_100128 ?auto_100131 ) ) ( not ( = ?auto_100128 ?auto_100133 ) ) ( ON ?auto_100128 ?auto_100135 ) ( not ( = ?auto_100128 ?auto_100135 ) ) ( not ( = ?auto_100129 ?auto_100135 ) ) ( not ( = ?auto_100130 ?auto_100135 ) ) ( not ( = ?auto_100132 ?auto_100135 ) ) ( not ( = ?auto_100134 ?auto_100135 ) ) ( not ( = ?auto_100131 ?auto_100135 ) ) ( not ( = ?auto_100133 ?auto_100135 ) ) ( ON ?auto_100129 ?auto_100128 ) ( ON-TABLE ?auto_100135 ) ( ON ?auto_100130 ?auto_100129 ) ( ON ?auto_100132 ?auto_100130 ) ( ON ?auto_100133 ?auto_100132 ) ( CLEAR ?auto_100133 ) ( HOLDING ?auto_100131 ) ( CLEAR ?auto_100134 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100134 ?auto_100131 )
      ( MAKE-3PILE ?auto_100128 ?auto_100129 ?auto_100130 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100136 - BLOCK
      ?auto_100137 - BLOCK
      ?auto_100138 - BLOCK
    )
    :vars
    (
      ?auto_100139 - BLOCK
      ?auto_100143 - BLOCK
      ?auto_100142 - BLOCK
      ?auto_100140 - BLOCK
      ?auto_100141 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100136 ?auto_100137 ) ) ( not ( = ?auto_100136 ?auto_100138 ) ) ( not ( = ?auto_100137 ?auto_100138 ) ) ( not ( = ?auto_100136 ?auto_100139 ) ) ( not ( = ?auto_100137 ?auto_100139 ) ) ( not ( = ?auto_100138 ?auto_100139 ) ) ( ON-TABLE ?auto_100143 ) ( not ( = ?auto_100143 ?auto_100142 ) ) ( not ( = ?auto_100143 ?auto_100140 ) ) ( not ( = ?auto_100143 ?auto_100139 ) ) ( not ( = ?auto_100143 ?auto_100138 ) ) ( not ( = ?auto_100143 ?auto_100137 ) ) ( not ( = ?auto_100142 ?auto_100140 ) ) ( not ( = ?auto_100142 ?auto_100139 ) ) ( not ( = ?auto_100142 ?auto_100138 ) ) ( not ( = ?auto_100142 ?auto_100137 ) ) ( not ( = ?auto_100140 ?auto_100139 ) ) ( not ( = ?auto_100140 ?auto_100138 ) ) ( not ( = ?auto_100140 ?auto_100137 ) ) ( not ( = ?auto_100136 ?auto_100143 ) ) ( not ( = ?auto_100136 ?auto_100142 ) ) ( not ( = ?auto_100136 ?auto_100140 ) ) ( ON ?auto_100136 ?auto_100141 ) ( not ( = ?auto_100136 ?auto_100141 ) ) ( not ( = ?auto_100137 ?auto_100141 ) ) ( not ( = ?auto_100138 ?auto_100141 ) ) ( not ( = ?auto_100139 ?auto_100141 ) ) ( not ( = ?auto_100143 ?auto_100141 ) ) ( not ( = ?auto_100142 ?auto_100141 ) ) ( not ( = ?auto_100140 ?auto_100141 ) ) ( ON ?auto_100137 ?auto_100136 ) ( ON-TABLE ?auto_100141 ) ( ON ?auto_100138 ?auto_100137 ) ( ON ?auto_100139 ?auto_100138 ) ( ON ?auto_100140 ?auto_100139 ) ( CLEAR ?auto_100143 ) ( ON ?auto_100142 ?auto_100140 ) ( CLEAR ?auto_100142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100141 ?auto_100136 ?auto_100137 ?auto_100138 ?auto_100139 ?auto_100140 )
      ( MAKE-3PILE ?auto_100136 ?auto_100137 ?auto_100138 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100144 - BLOCK
      ?auto_100145 - BLOCK
      ?auto_100146 - BLOCK
    )
    :vars
    (
      ?auto_100148 - BLOCK
      ?auto_100149 - BLOCK
      ?auto_100147 - BLOCK
      ?auto_100150 - BLOCK
      ?auto_100151 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100144 ?auto_100145 ) ) ( not ( = ?auto_100144 ?auto_100146 ) ) ( not ( = ?auto_100145 ?auto_100146 ) ) ( not ( = ?auto_100144 ?auto_100148 ) ) ( not ( = ?auto_100145 ?auto_100148 ) ) ( not ( = ?auto_100146 ?auto_100148 ) ) ( not ( = ?auto_100149 ?auto_100147 ) ) ( not ( = ?auto_100149 ?auto_100150 ) ) ( not ( = ?auto_100149 ?auto_100148 ) ) ( not ( = ?auto_100149 ?auto_100146 ) ) ( not ( = ?auto_100149 ?auto_100145 ) ) ( not ( = ?auto_100147 ?auto_100150 ) ) ( not ( = ?auto_100147 ?auto_100148 ) ) ( not ( = ?auto_100147 ?auto_100146 ) ) ( not ( = ?auto_100147 ?auto_100145 ) ) ( not ( = ?auto_100150 ?auto_100148 ) ) ( not ( = ?auto_100150 ?auto_100146 ) ) ( not ( = ?auto_100150 ?auto_100145 ) ) ( not ( = ?auto_100144 ?auto_100149 ) ) ( not ( = ?auto_100144 ?auto_100147 ) ) ( not ( = ?auto_100144 ?auto_100150 ) ) ( ON ?auto_100144 ?auto_100151 ) ( not ( = ?auto_100144 ?auto_100151 ) ) ( not ( = ?auto_100145 ?auto_100151 ) ) ( not ( = ?auto_100146 ?auto_100151 ) ) ( not ( = ?auto_100148 ?auto_100151 ) ) ( not ( = ?auto_100149 ?auto_100151 ) ) ( not ( = ?auto_100147 ?auto_100151 ) ) ( not ( = ?auto_100150 ?auto_100151 ) ) ( ON ?auto_100145 ?auto_100144 ) ( ON-TABLE ?auto_100151 ) ( ON ?auto_100146 ?auto_100145 ) ( ON ?auto_100148 ?auto_100146 ) ( ON ?auto_100150 ?auto_100148 ) ( ON ?auto_100147 ?auto_100150 ) ( CLEAR ?auto_100147 ) ( HOLDING ?auto_100149 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100149 )
      ( MAKE-3PILE ?auto_100144 ?auto_100145 ?auto_100146 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100152 - BLOCK
      ?auto_100153 - BLOCK
      ?auto_100154 - BLOCK
    )
    :vars
    (
      ?auto_100157 - BLOCK
      ?auto_100158 - BLOCK
      ?auto_100156 - BLOCK
      ?auto_100155 - BLOCK
      ?auto_100159 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100152 ?auto_100153 ) ) ( not ( = ?auto_100152 ?auto_100154 ) ) ( not ( = ?auto_100153 ?auto_100154 ) ) ( not ( = ?auto_100152 ?auto_100157 ) ) ( not ( = ?auto_100153 ?auto_100157 ) ) ( not ( = ?auto_100154 ?auto_100157 ) ) ( not ( = ?auto_100158 ?auto_100156 ) ) ( not ( = ?auto_100158 ?auto_100155 ) ) ( not ( = ?auto_100158 ?auto_100157 ) ) ( not ( = ?auto_100158 ?auto_100154 ) ) ( not ( = ?auto_100158 ?auto_100153 ) ) ( not ( = ?auto_100156 ?auto_100155 ) ) ( not ( = ?auto_100156 ?auto_100157 ) ) ( not ( = ?auto_100156 ?auto_100154 ) ) ( not ( = ?auto_100156 ?auto_100153 ) ) ( not ( = ?auto_100155 ?auto_100157 ) ) ( not ( = ?auto_100155 ?auto_100154 ) ) ( not ( = ?auto_100155 ?auto_100153 ) ) ( not ( = ?auto_100152 ?auto_100158 ) ) ( not ( = ?auto_100152 ?auto_100156 ) ) ( not ( = ?auto_100152 ?auto_100155 ) ) ( ON ?auto_100152 ?auto_100159 ) ( not ( = ?auto_100152 ?auto_100159 ) ) ( not ( = ?auto_100153 ?auto_100159 ) ) ( not ( = ?auto_100154 ?auto_100159 ) ) ( not ( = ?auto_100157 ?auto_100159 ) ) ( not ( = ?auto_100158 ?auto_100159 ) ) ( not ( = ?auto_100156 ?auto_100159 ) ) ( not ( = ?auto_100155 ?auto_100159 ) ) ( ON ?auto_100153 ?auto_100152 ) ( ON-TABLE ?auto_100159 ) ( ON ?auto_100154 ?auto_100153 ) ( ON ?auto_100157 ?auto_100154 ) ( ON ?auto_100155 ?auto_100157 ) ( ON ?auto_100156 ?auto_100155 ) ( ON ?auto_100158 ?auto_100156 ) ( CLEAR ?auto_100158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_100159 ?auto_100152 ?auto_100153 ?auto_100154 ?auto_100157 ?auto_100155 ?auto_100156 )
      ( MAKE-3PILE ?auto_100152 ?auto_100153 ?auto_100154 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100163 - BLOCK
      ?auto_100164 - BLOCK
      ?auto_100165 - BLOCK
    )
    :vars
    (
      ?auto_100166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100166 ?auto_100165 ) ( CLEAR ?auto_100166 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100163 ) ( ON ?auto_100164 ?auto_100163 ) ( ON ?auto_100165 ?auto_100164 ) ( not ( = ?auto_100163 ?auto_100164 ) ) ( not ( = ?auto_100163 ?auto_100165 ) ) ( not ( = ?auto_100163 ?auto_100166 ) ) ( not ( = ?auto_100164 ?auto_100165 ) ) ( not ( = ?auto_100164 ?auto_100166 ) ) ( not ( = ?auto_100165 ?auto_100166 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100166 ?auto_100165 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100167 - BLOCK
      ?auto_100168 - BLOCK
      ?auto_100169 - BLOCK
    )
    :vars
    (
      ?auto_100170 - BLOCK
      ?auto_100171 - BLOCK
      ?auto_100172 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100170 ?auto_100169 ) ( CLEAR ?auto_100170 ) ( ON-TABLE ?auto_100167 ) ( ON ?auto_100168 ?auto_100167 ) ( ON ?auto_100169 ?auto_100168 ) ( not ( = ?auto_100167 ?auto_100168 ) ) ( not ( = ?auto_100167 ?auto_100169 ) ) ( not ( = ?auto_100167 ?auto_100170 ) ) ( not ( = ?auto_100168 ?auto_100169 ) ) ( not ( = ?auto_100168 ?auto_100170 ) ) ( not ( = ?auto_100169 ?auto_100170 ) ) ( HOLDING ?auto_100171 ) ( CLEAR ?auto_100172 ) ( not ( = ?auto_100167 ?auto_100171 ) ) ( not ( = ?auto_100167 ?auto_100172 ) ) ( not ( = ?auto_100168 ?auto_100171 ) ) ( not ( = ?auto_100168 ?auto_100172 ) ) ( not ( = ?auto_100169 ?auto_100171 ) ) ( not ( = ?auto_100169 ?auto_100172 ) ) ( not ( = ?auto_100170 ?auto_100171 ) ) ( not ( = ?auto_100170 ?auto_100172 ) ) ( not ( = ?auto_100171 ?auto_100172 ) ) )
    :subtasks
    ( ( !STACK ?auto_100171 ?auto_100172 )
      ( MAKE-3PILE ?auto_100167 ?auto_100168 ?auto_100169 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100173 - BLOCK
      ?auto_100174 - BLOCK
      ?auto_100175 - BLOCK
    )
    :vars
    (
      ?auto_100178 - BLOCK
      ?auto_100177 - BLOCK
      ?auto_100176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100178 ?auto_100175 ) ( ON-TABLE ?auto_100173 ) ( ON ?auto_100174 ?auto_100173 ) ( ON ?auto_100175 ?auto_100174 ) ( not ( = ?auto_100173 ?auto_100174 ) ) ( not ( = ?auto_100173 ?auto_100175 ) ) ( not ( = ?auto_100173 ?auto_100178 ) ) ( not ( = ?auto_100174 ?auto_100175 ) ) ( not ( = ?auto_100174 ?auto_100178 ) ) ( not ( = ?auto_100175 ?auto_100178 ) ) ( CLEAR ?auto_100177 ) ( not ( = ?auto_100173 ?auto_100176 ) ) ( not ( = ?auto_100173 ?auto_100177 ) ) ( not ( = ?auto_100174 ?auto_100176 ) ) ( not ( = ?auto_100174 ?auto_100177 ) ) ( not ( = ?auto_100175 ?auto_100176 ) ) ( not ( = ?auto_100175 ?auto_100177 ) ) ( not ( = ?auto_100178 ?auto_100176 ) ) ( not ( = ?auto_100178 ?auto_100177 ) ) ( not ( = ?auto_100176 ?auto_100177 ) ) ( ON ?auto_100176 ?auto_100178 ) ( CLEAR ?auto_100176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100173 ?auto_100174 ?auto_100175 ?auto_100178 )
      ( MAKE-3PILE ?auto_100173 ?auto_100174 ?auto_100175 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100179 - BLOCK
      ?auto_100180 - BLOCK
      ?auto_100181 - BLOCK
    )
    :vars
    (
      ?auto_100182 - BLOCK
      ?auto_100183 - BLOCK
      ?auto_100184 - BLOCK
      ?auto_100185 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100182 ?auto_100181 ) ( ON-TABLE ?auto_100179 ) ( ON ?auto_100180 ?auto_100179 ) ( ON ?auto_100181 ?auto_100180 ) ( not ( = ?auto_100179 ?auto_100180 ) ) ( not ( = ?auto_100179 ?auto_100181 ) ) ( not ( = ?auto_100179 ?auto_100182 ) ) ( not ( = ?auto_100180 ?auto_100181 ) ) ( not ( = ?auto_100180 ?auto_100182 ) ) ( not ( = ?auto_100181 ?auto_100182 ) ) ( not ( = ?auto_100179 ?auto_100183 ) ) ( not ( = ?auto_100179 ?auto_100184 ) ) ( not ( = ?auto_100180 ?auto_100183 ) ) ( not ( = ?auto_100180 ?auto_100184 ) ) ( not ( = ?auto_100181 ?auto_100183 ) ) ( not ( = ?auto_100181 ?auto_100184 ) ) ( not ( = ?auto_100182 ?auto_100183 ) ) ( not ( = ?auto_100182 ?auto_100184 ) ) ( not ( = ?auto_100183 ?auto_100184 ) ) ( ON ?auto_100183 ?auto_100182 ) ( CLEAR ?auto_100183 ) ( HOLDING ?auto_100184 ) ( CLEAR ?auto_100185 ) ( ON-TABLE ?auto_100185 ) ( not ( = ?auto_100185 ?auto_100184 ) ) ( not ( = ?auto_100179 ?auto_100185 ) ) ( not ( = ?auto_100180 ?auto_100185 ) ) ( not ( = ?auto_100181 ?auto_100185 ) ) ( not ( = ?auto_100182 ?auto_100185 ) ) ( not ( = ?auto_100183 ?auto_100185 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100185 ?auto_100184 )
      ( MAKE-3PILE ?auto_100179 ?auto_100180 ?auto_100181 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100186 - BLOCK
      ?auto_100187 - BLOCK
      ?auto_100188 - BLOCK
    )
    :vars
    (
      ?auto_100191 - BLOCK
      ?auto_100192 - BLOCK
      ?auto_100189 - BLOCK
      ?auto_100190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100191 ?auto_100188 ) ( ON-TABLE ?auto_100186 ) ( ON ?auto_100187 ?auto_100186 ) ( ON ?auto_100188 ?auto_100187 ) ( not ( = ?auto_100186 ?auto_100187 ) ) ( not ( = ?auto_100186 ?auto_100188 ) ) ( not ( = ?auto_100186 ?auto_100191 ) ) ( not ( = ?auto_100187 ?auto_100188 ) ) ( not ( = ?auto_100187 ?auto_100191 ) ) ( not ( = ?auto_100188 ?auto_100191 ) ) ( not ( = ?auto_100186 ?auto_100192 ) ) ( not ( = ?auto_100186 ?auto_100189 ) ) ( not ( = ?auto_100187 ?auto_100192 ) ) ( not ( = ?auto_100187 ?auto_100189 ) ) ( not ( = ?auto_100188 ?auto_100192 ) ) ( not ( = ?auto_100188 ?auto_100189 ) ) ( not ( = ?auto_100191 ?auto_100192 ) ) ( not ( = ?auto_100191 ?auto_100189 ) ) ( not ( = ?auto_100192 ?auto_100189 ) ) ( ON ?auto_100192 ?auto_100191 ) ( CLEAR ?auto_100190 ) ( ON-TABLE ?auto_100190 ) ( not ( = ?auto_100190 ?auto_100189 ) ) ( not ( = ?auto_100186 ?auto_100190 ) ) ( not ( = ?auto_100187 ?auto_100190 ) ) ( not ( = ?auto_100188 ?auto_100190 ) ) ( not ( = ?auto_100191 ?auto_100190 ) ) ( not ( = ?auto_100192 ?auto_100190 ) ) ( ON ?auto_100189 ?auto_100192 ) ( CLEAR ?auto_100189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100186 ?auto_100187 ?auto_100188 ?auto_100191 ?auto_100192 )
      ( MAKE-3PILE ?auto_100186 ?auto_100187 ?auto_100188 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100193 - BLOCK
      ?auto_100194 - BLOCK
      ?auto_100195 - BLOCK
    )
    :vars
    (
      ?auto_100199 - BLOCK
      ?auto_100197 - BLOCK
      ?auto_100198 - BLOCK
      ?auto_100196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100199 ?auto_100195 ) ( ON-TABLE ?auto_100193 ) ( ON ?auto_100194 ?auto_100193 ) ( ON ?auto_100195 ?auto_100194 ) ( not ( = ?auto_100193 ?auto_100194 ) ) ( not ( = ?auto_100193 ?auto_100195 ) ) ( not ( = ?auto_100193 ?auto_100199 ) ) ( not ( = ?auto_100194 ?auto_100195 ) ) ( not ( = ?auto_100194 ?auto_100199 ) ) ( not ( = ?auto_100195 ?auto_100199 ) ) ( not ( = ?auto_100193 ?auto_100197 ) ) ( not ( = ?auto_100193 ?auto_100198 ) ) ( not ( = ?auto_100194 ?auto_100197 ) ) ( not ( = ?auto_100194 ?auto_100198 ) ) ( not ( = ?auto_100195 ?auto_100197 ) ) ( not ( = ?auto_100195 ?auto_100198 ) ) ( not ( = ?auto_100199 ?auto_100197 ) ) ( not ( = ?auto_100199 ?auto_100198 ) ) ( not ( = ?auto_100197 ?auto_100198 ) ) ( ON ?auto_100197 ?auto_100199 ) ( not ( = ?auto_100196 ?auto_100198 ) ) ( not ( = ?auto_100193 ?auto_100196 ) ) ( not ( = ?auto_100194 ?auto_100196 ) ) ( not ( = ?auto_100195 ?auto_100196 ) ) ( not ( = ?auto_100199 ?auto_100196 ) ) ( not ( = ?auto_100197 ?auto_100196 ) ) ( ON ?auto_100198 ?auto_100197 ) ( CLEAR ?auto_100198 ) ( HOLDING ?auto_100196 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100196 )
      ( MAKE-3PILE ?auto_100193 ?auto_100194 ?auto_100195 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100200 - BLOCK
      ?auto_100201 - BLOCK
      ?auto_100202 - BLOCK
    )
    :vars
    (
      ?auto_100203 - BLOCK
      ?auto_100206 - BLOCK
      ?auto_100205 - BLOCK
      ?auto_100204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100203 ?auto_100202 ) ( ON-TABLE ?auto_100200 ) ( ON ?auto_100201 ?auto_100200 ) ( ON ?auto_100202 ?auto_100201 ) ( not ( = ?auto_100200 ?auto_100201 ) ) ( not ( = ?auto_100200 ?auto_100202 ) ) ( not ( = ?auto_100200 ?auto_100203 ) ) ( not ( = ?auto_100201 ?auto_100202 ) ) ( not ( = ?auto_100201 ?auto_100203 ) ) ( not ( = ?auto_100202 ?auto_100203 ) ) ( not ( = ?auto_100200 ?auto_100206 ) ) ( not ( = ?auto_100200 ?auto_100205 ) ) ( not ( = ?auto_100201 ?auto_100206 ) ) ( not ( = ?auto_100201 ?auto_100205 ) ) ( not ( = ?auto_100202 ?auto_100206 ) ) ( not ( = ?auto_100202 ?auto_100205 ) ) ( not ( = ?auto_100203 ?auto_100206 ) ) ( not ( = ?auto_100203 ?auto_100205 ) ) ( not ( = ?auto_100206 ?auto_100205 ) ) ( ON ?auto_100206 ?auto_100203 ) ( not ( = ?auto_100204 ?auto_100205 ) ) ( not ( = ?auto_100200 ?auto_100204 ) ) ( not ( = ?auto_100201 ?auto_100204 ) ) ( not ( = ?auto_100202 ?auto_100204 ) ) ( not ( = ?auto_100203 ?auto_100204 ) ) ( not ( = ?auto_100206 ?auto_100204 ) ) ( ON ?auto_100205 ?auto_100206 ) ( ON ?auto_100204 ?auto_100205 ) ( CLEAR ?auto_100204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100200 ?auto_100201 ?auto_100202 ?auto_100203 ?auto_100206 ?auto_100205 )
      ( MAKE-3PILE ?auto_100200 ?auto_100201 ?auto_100202 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100207 - BLOCK
      ?auto_100208 - BLOCK
      ?auto_100209 - BLOCK
    )
    :vars
    (
      ?auto_100211 - BLOCK
      ?auto_100212 - BLOCK
      ?auto_100210 - BLOCK
      ?auto_100213 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100211 ?auto_100209 ) ( ON-TABLE ?auto_100207 ) ( ON ?auto_100208 ?auto_100207 ) ( ON ?auto_100209 ?auto_100208 ) ( not ( = ?auto_100207 ?auto_100208 ) ) ( not ( = ?auto_100207 ?auto_100209 ) ) ( not ( = ?auto_100207 ?auto_100211 ) ) ( not ( = ?auto_100208 ?auto_100209 ) ) ( not ( = ?auto_100208 ?auto_100211 ) ) ( not ( = ?auto_100209 ?auto_100211 ) ) ( not ( = ?auto_100207 ?auto_100212 ) ) ( not ( = ?auto_100207 ?auto_100210 ) ) ( not ( = ?auto_100208 ?auto_100212 ) ) ( not ( = ?auto_100208 ?auto_100210 ) ) ( not ( = ?auto_100209 ?auto_100212 ) ) ( not ( = ?auto_100209 ?auto_100210 ) ) ( not ( = ?auto_100211 ?auto_100212 ) ) ( not ( = ?auto_100211 ?auto_100210 ) ) ( not ( = ?auto_100212 ?auto_100210 ) ) ( ON ?auto_100212 ?auto_100211 ) ( not ( = ?auto_100213 ?auto_100210 ) ) ( not ( = ?auto_100207 ?auto_100213 ) ) ( not ( = ?auto_100208 ?auto_100213 ) ) ( not ( = ?auto_100209 ?auto_100213 ) ) ( not ( = ?auto_100211 ?auto_100213 ) ) ( not ( = ?auto_100212 ?auto_100213 ) ) ( ON ?auto_100210 ?auto_100212 ) ( HOLDING ?auto_100213 ) ( CLEAR ?auto_100210 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_100207 ?auto_100208 ?auto_100209 ?auto_100211 ?auto_100212 ?auto_100210 ?auto_100213 )
      ( MAKE-3PILE ?auto_100207 ?auto_100208 ?auto_100209 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100214 - BLOCK
      ?auto_100215 - BLOCK
      ?auto_100216 - BLOCK
    )
    :vars
    (
      ?auto_100219 - BLOCK
      ?auto_100220 - BLOCK
      ?auto_100217 - BLOCK
      ?auto_100218 - BLOCK
      ?auto_100221 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100219 ?auto_100216 ) ( ON-TABLE ?auto_100214 ) ( ON ?auto_100215 ?auto_100214 ) ( ON ?auto_100216 ?auto_100215 ) ( not ( = ?auto_100214 ?auto_100215 ) ) ( not ( = ?auto_100214 ?auto_100216 ) ) ( not ( = ?auto_100214 ?auto_100219 ) ) ( not ( = ?auto_100215 ?auto_100216 ) ) ( not ( = ?auto_100215 ?auto_100219 ) ) ( not ( = ?auto_100216 ?auto_100219 ) ) ( not ( = ?auto_100214 ?auto_100220 ) ) ( not ( = ?auto_100214 ?auto_100217 ) ) ( not ( = ?auto_100215 ?auto_100220 ) ) ( not ( = ?auto_100215 ?auto_100217 ) ) ( not ( = ?auto_100216 ?auto_100220 ) ) ( not ( = ?auto_100216 ?auto_100217 ) ) ( not ( = ?auto_100219 ?auto_100220 ) ) ( not ( = ?auto_100219 ?auto_100217 ) ) ( not ( = ?auto_100220 ?auto_100217 ) ) ( ON ?auto_100220 ?auto_100219 ) ( not ( = ?auto_100218 ?auto_100217 ) ) ( not ( = ?auto_100214 ?auto_100218 ) ) ( not ( = ?auto_100215 ?auto_100218 ) ) ( not ( = ?auto_100216 ?auto_100218 ) ) ( not ( = ?auto_100219 ?auto_100218 ) ) ( not ( = ?auto_100220 ?auto_100218 ) ) ( ON ?auto_100217 ?auto_100220 ) ( CLEAR ?auto_100217 ) ( ON ?auto_100218 ?auto_100221 ) ( CLEAR ?auto_100218 ) ( HAND-EMPTY ) ( not ( = ?auto_100214 ?auto_100221 ) ) ( not ( = ?auto_100215 ?auto_100221 ) ) ( not ( = ?auto_100216 ?auto_100221 ) ) ( not ( = ?auto_100219 ?auto_100221 ) ) ( not ( = ?auto_100220 ?auto_100221 ) ) ( not ( = ?auto_100217 ?auto_100221 ) ) ( not ( = ?auto_100218 ?auto_100221 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100218 ?auto_100221 )
      ( MAKE-3PILE ?auto_100214 ?auto_100215 ?auto_100216 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100222 - BLOCK
      ?auto_100223 - BLOCK
      ?auto_100224 - BLOCK
    )
    :vars
    (
      ?auto_100229 - BLOCK
      ?auto_100227 - BLOCK
      ?auto_100225 - BLOCK
      ?auto_100228 - BLOCK
      ?auto_100226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100229 ?auto_100224 ) ( ON-TABLE ?auto_100222 ) ( ON ?auto_100223 ?auto_100222 ) ( ON ?auto_100224 ?auto_100223 ) ( not ( = ?auto_100222 ?auto_100223 ) ) ( not ( = ?auto_100222 ?auto_100224 ) ) ( not ( = ?auto_100222 ?auto_100229 ) ) ( not ( = ?auto_100223 ?auto_100224 ) ) ( not ( = ?auto_100223 ?auto_100229 ) ) ( not ( = ?auto_100224 ?auto_100229 ) ) ( not ( = ?auto_100222 ?auto_100227 ) ) ( not ( = ?auto_100222 ?auto_100225 ) ) ( not ( = ?auto_100223 ?auto_100227 ) ) ( not ( = ?auto_100223 ?auto_100225 ) ) ( not ( = ?auto_100224 ?auto_100227 ) ) ( not ( = ?auto_100224 ?auto_100225 ) ) ( not ( = ?auto_100229 ?auto_100227 ) ) ( not ( = ?auto_100229 ?auto_100225 ) ) ( not ( = ?auto_100227 ?auto_100225 ) ) ( ON ?auto_100227 ?auto_100229 ) ( not ( = ?auto_100228 ?auto_100225 ) ) ( not ( = ?auto_100222 ?auto_100228 ) ) ( not ( = ?auto_100223 ?auto_100228 ) ) ( not ( = ?auto_100224 ?auto_100228 ) ) ( not ( = ?auto_100229 ?auto_100228 ) ) ( not ( = ?auto_100227 ?auto_100228 ) ) ( ON ?auto_100228 ?auto_100226 ) ( CLEAR ?auto_100228 ) ( not ( = ?auto_100222 ?auto_100226 ) ) ( not ( = ?auto_100223 ?auto_100226 ) ) ( not ( = ?auto_100224 ?auto_100226 ) ) ( not ( = ?auto_100229 ?auto_100226 ) ) ( not ( = ?auto_100227 ?auto_100226 ) ) ( not ( = ?auto_100225 ?auto_100226 ) ) ( not ( = ?auto_100228 ?auto_100226 ) ) ( HOLDING ?auto_100225 ) ( CLEAR ?auto_100227 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100222 ?auto_100223 ?auto_100224 ?auto_100229 ?auto_100227 ?auto_100225 )
      ( MAKE-3PILE ?auto_100222 ?auto_100223 ?auto_100224 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100230 - BLOCK
      ?auto_100231 - BLOCK
      ?auto_100232 - BLOCK
    )
    :vars
    (
      ?auto_100234 - BLOCK
      ?auto_100233 - BLOCK
      ?auto_100235 - BLOCK
      ?auto_100236 - BLOCK
      ?auto_100237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100234 ?auto_100232 ) ( ON-TABLE ?auto_100230 ) ( ON ?auto_100231 ?auto_100230 ) ( ON ?auto_100232 ?auto_100231 ) ( not ( = ?auto_100230 ?auto_100231 ) ) ( not ( = ?auto_100230 ?auto_100232 ) ) ( not ( = ?auto_100230 ?auto_100234 ) ) ( not ( = ?auto_100231 ?auto_100232 ) ) ( not ( = ?auto_100231 ?auto_100234 ) ) ( not ( = ?auto_100232 ?auto_100234 ) ) ( not ( = ?auto_100230 ?auto_100233 ) ) ( not ( = ?auto_100230 ?auto_100235 ) ) ( not ( = ?auto_100231 ?auto_100233 ) ) ( not ( = ?auto_100231 ?auto_100235 ) ) ( not ( = ?auto_100232 ?auto_100233 ) ) ( not ( = ?auto_100232 ?auto_100235 ) ) ( not ( = ?auto_100234 ?auto_100233 ) ) ( not ( = ?auto_100234 ?auto_100235 ) ) ( not ( = ?auto_100233 ?auto_100235 ) ) ( ON ?auto_100233 ?auto_100234 ) ( not ( = ?auto_100236 ?auto_100235 ) ) ( not ( = ?auto_100230 ?auto_100236 ) ) ( not ( = ?auto_100231 ?auto_100236 ) ) ( not ( = ?auto_100232 ?auto_100236 ) ) ( not ( = ?auto_100234 ?auto_100236 ) ) ( not ( = ?auto_100233 ?auto_100236 ) ) ( ON ?auto_100236 ?auto_100237 ) ( not ( = ?auto_100230 ?auto_100237 ) ) ( not ( = ?auto_100231 ?auto_100237 ) ) ( not ( = ?auto_100232 ?auto_100237 ) ) ( not ( = ?auto_100234 ?auto_100237 ) ) ( not ( = ?auto_100233 ?auto_100237 ) ) ( not ( = ?auto_100235 ?auto_100237 ) ) ( not ( = ?auto_100236 ?auto_100237 ) ) ( CLEAR ?auto_100233 ) ( ON ?auto_100235 ?auto_100236 ) ( CLEAR ?auto_100235 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100237 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100237 ?auto_100236 )
      ( MAKE-3PILE ?auto_100230 ?auto_100231 ?auto_100232 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100238 - BLOCK
      ?auto_100239 - BLOCK
      ?auto_100240 - BLOCK
    )
    :vars
    (
      ?auto_100241 - BLOCK
      ?auto_100245 - BLOCK
      ?auto_100242 - BLOCK
      ?auto_100243 - BLOCK
      ?auto_100244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100241 ?auto_100240 ) ( ON-TABLE ?auto_100238 ) ( ON ?auto_100239 ?auto_100238 ) ( ON ?auto_100240 ?auto_100239 ) ( not ( = ?auto_100238 ?auto_100239 ) ) ( not ( = ?auto_100238 ?auto_100240 ) ) ( not ( = ?auto_100238 ?auto_100241 ) ) ( not ( = ?auto_100239 ?auto_100240 ) ) ( not ( = ?auto_100239 ?auto_100241 ) ) ( not ( = ?auto_100240 ?auto_100241 ) ) ( not ( = ?auto_100238 ?auto_100245 ) ) ( not ( = ?auto_100238 ?auto_100242 ) ) ( not ( = ?auto_100239 ?auto_100245 ) ) ( not ( = ?auto_100239 ?auto_100242 ) ) ( not ( = ?auto_100240 ?auto_100245 ) ) ( not ( = ?auto_100240 ?auto_100242 ) ) ( not ( = ?auto_100241 ?auto_100245 ) ) ( not ( = ?auto_100241 ?auto_100242 ) ) ( not ( = ?auto_100245 ?auto_100242 ) ) ( not ( = ?auto_100243 ?auto_100242 ) ) ( not ( = ?auto_100238 ?auto_100243 ) ) ( not ( = ?auto_100239 ?auto_100243 ) ) ( not ( = ?auto_100240 ?auto_100243 ) ) ( not ( = ?auto_100241 ?auto_100243 ) ) ( not ( = ?auto_100245 ?auto_100243 ) ) ( ON ?auto_100243 ?auto_100244 ) ( not ( = ?auto_100238 ?auto_100244 ) ) ( not ( = ?auto_100239 ?auto_100244 ) ) ( not ( = ?auto_100240 ?auto_100244 ) ) ( not ( = ?auto_100241 ?auto_100244 ) ) ( not ( = ?auto_100245 ?auto_100244 ) ) ( not ( = ?auto_100242 ?auto_100244 ) ) ( not ( = ?auto_100243 ?auto_100244 ) ) ( ON ?auto_100242 ?auto_100243 ) ( CLEAR ?auto_100242 ) ( ON-TABLE ?auto_100244 ) ( HOLDING ?auto_100245 ) ( CLEAR ?auto_100241 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100238 ?auto_100239 ?auto_100240 ?auto_100241 ?auto_100245 )
      ( MAKE-3PILE ?auto_100238 ?auto_100239 ?auto_100240 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100246 - BLOCK
      ?auto_100247 - BLOCK
      ?auto_100248 - BLOCK
    )
    :vars
    (
      ?auto_100253 - BLOCK
      ?auto_100251 - BLOCK
      ?auto_100252 - BLOCK
      ?auto_100249 - BLOCK
      ?auto_100250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100253 ?auto_100248 ) ( ON-TABLE ?auto_100246 ) ( ON ?auto_100247 ?auto_100246 ) ( ON ?auto_100248 ?auto_100247 ) ( not ( = ?auto_100246 ?auto_100247 ) ) ( not ( = ?auto_100246 ?auto_100248 ) ) ( not ( = ?auto_100246 ?auto_100253 ) ) ( not ( = ?auto_100247 ?auto_100248 ) ) ( not ( = ?auto_100247 ?auto_100253 ) ) ( not ( = ?auto_100248 ?auto_100253 ) ) ( not ( = ?auto_100246 ?auto_100251 ) ) ( not ( = ?auto_100246 ?auto_100252 ) ) ( not ( = ?auto_100247 ?auto_100251 ) ) ( not ( = ?auto_100247 ?auto_100252 ) ) ( not ( = ?auto_100248 ?auto_100251 ) ) ( not ( = ?auto_100248 ?auto_100252 ) ) ( not ( = ?auto_100253 ?auto_100251 ) ) ( not ( = ?auto_100253 ?auto_100252 ) ) ( not ( = ?auto_100251 ?auto_100252 ) ) ( not ( = ?auto_100249 ?auto_100252 ) ) ( not ( = ?auto_100246 ?auto_100249 ) ) ( not ( = ?auto_100247 ?auto_100249 ) ) ( not ( = ?auto_100248 ?auto_100249 ) ) ( not ( = ?auto_100253 ?auto_100249 ) ) ( not ( = ?auto_100251 ?auto_100249 ) ) ( ON ?auto_100249 ?auto_100250 ) ( not ( = ?auto_100246 ?auto_100250 ) ) ( not ( = ?auto_100247 ?auto_100250 ) ) ( not ( = ?auto_100248 ?auto_100250 ) ) ( not ( = ?auto_100253 ?auto_100250 ) ) ( not ( = ?auto_100251 ?auto_100250 ) ) ( not ( = ?auto_100252 ?auto_100250 ) ) ( not ( = ?auto_100249 ?auto_100250 ) ) ( ON ?auto_100252 ?auto_100249 ) ( ON-TABLE ?auto_100250 ) ( CLEAR ?auto_100253 ) ( ON ?auto_100251 ?auto_100252 ) ( CLEAR ?auto_100251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100250 ?auto_100249 ?auto_100252 )
      ( MAKE-3PILE ?auto_100246 ?auto_100247 ?auto_100248 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100270 - BLOCK
      ?auto_100271 - BLOCK
      ?auto_100272 - BLOCK
    )
    :vars
    (
      ?auto_100273 - BLOCK
      ?auto_100277 - BLOCK
      ?auto_100274 - BLOCK
      ?auto_100275 - BLOCK
      ?auto_100276 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_100270 ) ( ON ?auto_100271 ?auto_100270 ) ( not ( = ?auto_100270 ?auto_100271 ) ) ( not ( = ?auto_100270 ?auto_100272 ) ) ( not ( = ?auto_100270 ?auto_100273 ) ) ( not ( = ?auto_100271 ?auto_100272 ) ) ( not ( = ?auto_100271 ?auto_100273 ) ) ( not ( = ?auto_100272 ?auto_100273 ) ) ( not ( = ?auto_100270 ?auto_100277 ) ) ( not ( = ?auto_100270 ?auto_100274 ) ) ( not ( = ?auto_100271 ?auto_100277 ) ) ( not ( = ?auto_100271 ?auto_100274 ) ) ( not ( = ?auto_100272 ?auto_100277 ) ) ( not ( = ?auto_100272 ?auto_100274 ) ) ( not ( = ?auto_100273 ?auto_100277 ) ) ( not ( = ?auto_100273 ?auto_100274 ) ) ( not ( = ?auto_100277 ?auto_100274 ) ) ( not ( = ?auto_100275 ?auto_100274 ) ) ( not ( = ?auto_100270 ?auto_100275 ) ) ( not ( = ?auto_100271 ?auto_100275 ) ) ( not ( = ?auto_100272 ?auto_100275 ) ) ( not ( = ?auto_100273 ?auto_100275 ) ) ( not ( = ?auto_100277 ?auto_100275 ) ) ( ON ?auto_100275 ?auto_100276 ) ( not ( = ?auto_100270 ?auto_100276 ) ) ( not ( = ?auto_100271 ?auto_100276 ) ) ( not ( = ?auto_100272 ?auto_100276 ) ) ( not ( = ?auto_100273 ?auto_100276 ) ) ( not ( = ?auto_100277 ?auto_100276 ) ) ( not ( = ?auto_100274 ?auto_100276 ) ) ( not ( = ?auto_100275 ?auto_100276 ) ) ( ON ?auto_100274 ?auto_100275 ) ( ON-TABLE ?auto_100276 ) ( ON ?auto_100277 ?auto_100274 ) ( ON ?auto_100273 ?auto_100277 ) ( CLEAR ?auto_100273 ) ( HOLDING ?auto_100272 ) ( CLEAR ?auto_100271 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100270 ?auto_100271 ?auto_100272 ?auto_100273 )
      ( MAKE-3PILE ?auto_100270 ?auto_100271 ?auto_100272 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100278 - BLOCK
      ?auto_100279 - BLOCK
      ?auto_100280 - BLOCK
    )
    :vars
    (
      ?auto_100283 - BLOCK
      ?auto_100282 - BLOCK
      ?auto_100285 - BLOCK
      ?auto_100281 - BLOCK
      ?auto_100284 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_100278 ) ( ON ?auto_100279 ?auto_100278 ) ( not ( = ?auto_100278 ?auto_100279 ) ) ( not ( = ?auto_100278 ?auto_100280 ) ) ( not ( = ?auto_100278 ?auto_100283 ) ) ( not ( = ?auto_100279 ?auto_100280 ) ) ( not ( = ?auto_100279 ?auto_100283 ) ) ( not ( = ?auto_100280 ?auto_100283 ) ) ( not ( = ?auto_100278 ?auto_100282 ) ) ( not ( = ?auto_100278 ?auto_100285 ) ) ( not ( = ?auto_100279 ?auto_100282 ) ) ( not ( = ?auto_100279 ?auto_100285 ) ) ( not ( = ?auto_100280 ?auto_100282 ) ) ( not ( = ?auto_100280 ?auto_100285 ) ) ( not ( = ?auto_100283 ?auto_100282 ) ) ( not ( = ?auto_100283 ?auto_100285 ) ) ( not ( = ?auto_100282 ?auto_100285 ) ) ( not ( = ?auto_100281 ?auto_100285 ) ) ( not ( = ?auto_100278 ?auto_100281 ) ) ( not ( = ?auto_100279 ?auto_100281 ) ) ( not ( = ?auto_100280 ?auto_100281 ) ) ( not ( = ?auto_100283 ?auto_100281 ) ) ( not ( = ?auto_100282 ?auto_100281 ) ) ( ON ?auto_100281 ?auto_100284 ) ( not ( = ?auto_100278 ?auto_100284 ) ) ( not ( = ?auto_100279 ?auto_100284 ) ) ( not ( = ?auto_100280 ?auto_100284 ) ) ( not ( = ?auto_100283 ?auto_100284 ) ) ( not ( = ?auto_100282 ?auto_100284 ) ) ( not ( = ?auto_100285 ?auto_100284 ) ) ( not ( = ?auto_100281 ?auto_100284 ) ) ( ON ?auto_100285 ?auto_100281 ) ( ON-TABLE ?auto_100284 ) ( ON ?auto_100282 ?auto_100285 ) ( ON ?auto_100283 ?auto_100282 ) ( CLEAR ?auto_100279 ) ( ON ?auto_100280 ?auto_100283 ) ( CLEAR ?auto_100280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100284 ?auto_100281 ?auto_100285 ?auto_100282 ?auto_100283 )
      ( MAKE-3PILE ?auto_100278 ?auto_100279 ?auto_100280 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100286 - BLOCK
      ?auto_100287 - BLOCK
      ?auto_100288 - BLOCK
    )
    :vars
    (
      ?auto_100290 - BLOCK
      ?auto_100289 - BLOCK
      ?auto_100293 - BLOCK
      ?auto_100292 - BLOCK
      ?auto_100291 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_100286 ) ( not ( = ?auto_100286 ?auto_100287 ) ) ( not ( = ?auto_100286 ?auto_100288 ) ) ( not ( = ?auto_100286 ?auto_100290 ) ) ( not ( = ?auto_100287 ?auto_100288 ) ) ( not ( = ?auto_100287 ?auto_100290 ) ) ( not ( = ?auto_100288 ?auto_100290 ) ) ( not ( = ?auto_100286 ?auto_100289 ) ) ( not ( = ?auto_100286 ?auto_100293 ) ) ( not ( = ?auto_100287 ?auto_100289 ) ) ( not ( = ?auto_100287 ?auto_100293 ) ) ( not ( = ?auto_100288 ?auto_100289 ) ) ( not ( = ?auto_100288 ?auto_100293 ) ) ( not ( = ?auto_100290 ?auto_100289 ) ) ( not ( = ?auto_100290 ?auto_100293 ) ) ( not ( = ?auto_100289 ?auto_100293 ) ) ( not ( = ?auto_100292 ?auto_100293 ) ) ( not ( = ?auto_100286 ?auto_100292 ) ) ( not ( = ?auto_100287 ?auto_100292 ) ) ( not ( = ?auto_100288 ?auto_100292 ) ) ( not ( = ?auto_100290 ?auto_100292 ) ) ( not ( = ?auto_100289 ?auto_100292 ) ) ( ON ?auto_100292 ?auto_100291 ) ( not ( = ?auto_100286 ?auto_100291 ) ) ( not ( = ?auto_100287 ?auto_100291 ) ) ( not ( = ?auto_100288 ?auto_100291 ) ) ( not ( = ?auto_100290 ?auto_100291 ) ) ( not ( = ?auto_100289 ?auto_100291 ) ) ( not ( = ?auto_100293 ?auto_100291 ) ) ( not ( = ?auto_100292 ?auto_100291 ) ) ( ON ?auto_100293 ?auto_100292 ) ( ON-TABLE ?auto_100291 ) ( ON ?auto_100289 ?auto_100293 ) ( ON ?auto_100290 ?auto_100289 ) ( ON ?auto_100288 ?auto_100290 ) ( CLEAR ?auto_100288 ) ( HOLDING ?auto_100287 ) ( CLEAR ?auto_100286 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100286 ?auto_100287 )
      ( MAKE-3PILE ?auto_100286 ?auto_100287 ?auto_100288 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100294 - BLOCK
      ?auto_100295 - BLOCK
      ?auto_100296 - BLOCK
    )
    :vars
    (
      ?auto_100299 - BLOCK
      ?auto_100300 - BLOCK
      ?auto_100297 - BLOCK
      ?auto_100301 - BLOCK
      ?auto_100298 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_100294 ) ( not ( = ?auto_100294 ?auto_100295 ) ) ( not ( = ?auto_100294 ?auto_100296 ) ) ( not ( = ?auto_100294 ?auto_100299 ) ) ( not ( = ?auto_100295 ?auto_100296 ) ) ( not ( = ?auto_100295 ?auto_100299 ) ) ( not ( = ?auto_100296 ?auto_100299 ) ) ( not ( = ?auto_100294 ?auto_100300 ) ) ( not ( = ?auto_100294 ?auto_100297 ) ) ( not ( = ?auto_100295 ?auto_100300 ) ) ( not ( = ?auto_100295 ?auto_100297 ) ) ( not ( = ?auto_100296 ?auto_100300 ) ) ( not ( = ?auto_100296 ?auto_100297 ) ) ( not ( = ?auto_100299 ?auto_100300 ) ) ( not ( = ?auto_100299 ?auto_100297 ) ) ( not ( = ?auto_100300 ?auto_100297 ) ) ( not ( = ?auto_100301 ?auto_100297 ) ) ( not ( = ?auto_100294 ?auto_100301 ) ) ( not ( = ?auto_100295 ?auto_100301 ) ) ( not ( = ?auto_100296 ?auto_100301 ) ) ( not ( = ?auto_100299 ?auto_100301 ) ) ( not ( = ?auto_100300 ?auto_100301 ) ) ( ON ?auto_100301 ?auto_100298 ) ( not ( = ?auto_100294 ?auto_100298 ) ) ( not ( = ?auto_100295 ?auto_100298 ) ) ( not ( = ?auto_100296 ?auto_100298 ) ) ( not ( = ?auto_100299 ?auto_100298 ) ) ( not ( = ?auto_100300 ?auto_100298 ) ) ( not ( = ?auto_100297 ?auto_100298 ) ) ( not ( = ?auto_100301 ?auto_100298 ) ) ( ON ?auto_100297 ?auto_100301 ) ( ON-TABLE ?auto_100298 ) ( ON ?auto_100300 ?auto_100297 ) ( ON ?auto_100299 ?auto_100300 ) ( ON ?auto_100296 ?auto_100299 ) ( CLEAR ?auto_100294 ) ( ON ?auto_100295 ?auto_100296 ) ( CLEAR ?auto_100295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100298 ?auto_100301 ?auto_100297 ?auto_100300 ?auto_100299 ?auto_100296 )
      ( MAKE-3PILE ?auto_100294 ?auto_100295 ?auto_100296 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100302 - BLOCK
      ?auto_100303 - BLOCK
      ?auto_100304 - BLOCK
    )
    :vars
    (
      ?auto_100305 - BLOCK
      ?auto_100308 - BLOCK
      ?auto_100307 - BLOCK
      ?auto_100306 - BLOCK
      ?auto_100309 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100302 ?auto_100303 ) ) ( not ( = ?auto_100302 ?auto_100304 ) ) ( not ( = ?auto_100302 ?auto_100305 ) ) ( not ( = ?auto_100303 ?auto_100304 ) ) ( not ( = ?auto_100303 ?auto_100305 ) ) ( not ( = ?auto_100304 ?auto_100305 ) ) ( not ( = ?auto_100302 ?auto_100308 ) ) ( not ( = ?auto_100302 ?auto_100307 ) ) ( not ( = ?auto_100303 ?auto_100308 ) ) ( not ( = ?auto_100303 ?auto_100307 ) ) ( not ( = ?auto_100304 ?auto_100308 ) ) ( not ( = ?auto_100304 ?auto_100307 ) ) ( not ( = ?auto_100305 ?auto_100308 ) ) ( not ( = ?auto_100305 ?auto_100307 ) ) ( not ( = ?auto_100308 ?auto_100307 ) ) ( not ( = ?auto_100306 ?auto_100307 ) ) ( not ( = ?auto_100302 ?auto_100306 ) ) ( not ( = ?auto_100303 ?auto_100306 ) ) ( not ( = ?auto_100304 ?auto_100306 ) ) ( not ( = ?auto_100305 ?auto_100306 ) ) ( not ( = ?auto_100308 ?auto_100306 ) ) ( ON ?auto_100306 ?auto_100309 ) ( not ( = ?auto_100302 ?auto_100309 ) ) ( not ( = ?auto_100303 ?auto_100309 ) ) ( not ( = ?auto_100304 ?auto_100309 ) ) ( not ( = ?auto_100305 ?auto_100309 ) ) ( not ( = ?auto_100308 ?auto_100309 ) ) ( not ( = ?auto_100307 ?auto_100309 ) ) ( not ( = ?auto_100306 ?auto_100309 ) ) ( ON ?auto_100307 ?auto_100306 ) ( ON-TABLE ?auto_100309 ) ( ON ?auto_100308 ?auto_100307 ) ( ON ?auto_100305 ?auto_100308 ) ( ON ?auto_100304 ?auto_100305 ) ( ON ?auto_100303 ?auto_100304 ) ( CLEAR ?auto_100303 ) ( HOLDING ?auto_100302 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100302 )
      ( MAKE-3PILE ?auto_100302 ?auto_100303 ?auto_100304 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100310 - BLOCK
      ?auto_100311 - BLOCK
      ?auto_100312 - BLOCK
    )
    :vars
    (
      ?auto_100314 - BLOCK
      ?auto_100317 - BLOCK
      ?auto_100315 - BLOCK
      ?auto_100313 - BLOCK
      ?auto_100316 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100310 ?auto_100311 ) ) ( not ( = ?auto_100310 ?auto_100312 ) ) ( not ( = ?auto_100310 ?auto_100314 ) ) ( not ( = ?auto_100311 ?auto_100312 ) ) ( not ( = ?auto_100311 ?auto_100314 ) ) ( not ( = ?auto_100312 ?auto_100314 ) ) ( not ( = ?auto_100310 ?auto_100317 ) ) ( not ( = ?auto_100310 ?auto_100315 ) ) ( not ( = ?auto_100311 ?auto_100317 ) ) ( not ( = ?auto_100311 ?auto_100315 ) ) ( not ( = ?auto_100312 ?auto_100317 ) ) ( not ( = ?auto_100312 ?auto_100315 ) ) ( not ( = ?auto_100314 ?auto_100317 ) ) ( not ( = ?auto_100314 ?auto_100315 ) ) ( not ( = ?auto_100317 ?auto_100315 ) ) ( not ( = ?auto_100313 ?auto_100315 ) ) ( not ( = ?auto_100310 ?auto_100313 ) ) ( not ( = ?auto_100311 ?auto_100313 ) ) ( not ( = ?auto_100312 ?auto_100313 ) ) ( not ( = ?auto_100314 ?auto_100313 ) ) ( not ( = ?auto_100317 ?auto_100313 ) ) ( ON ?auto_100313 ?auto_100316 ) ( not ( = ?auto_100310 ?auto_100316 ) ) ( not ( = ?auto_100311 ?auto_100316 ) ) ( not ( = ?auto_100312 ?auto_100316 ) ) ( not ( = ?auto_100314 ?auto_100316 ) ) ( not ( = ?auto_100317 ?auto_100316 ) ) ( not ( = ?auto_100315 ?auto_100316 ) ) ( not ( = ?auto_100313 ?auto_100316 ) ) ( ON ?auto_100315 ?auto_100313 ) ( ON-TABLE ?auto_100316 ) ( ON ?auto_100317 ?auto_100315 ) ( ON ?auto_100314 ?auto_100317 ) ( ON ?auto_100312 ?auto_100314 ) ( ON ?auto_100311 ?auto_100312 ) ( ON ?auto_100310 ?auto_100311 ) ( CLEAR ?auto_100310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_100316 ?auto_100313 ?auto_100315 ?auto_100317 ?auto_100314 ?auto_100312 ?auto_100311 )
      ( MAKE-3PILE ?auto_100310 ?auto_100311 ?auto_100312 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100322 - BLOCK
      ?auto_100323 - BLOCK
      ?auto_100324 - BLOCK
      ?auto_100325 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_100325 ) ( CLEAR ?auto_100324 ) ( ON-TABLE ?auto_100322 ) ( ON ?auto_100323 ?auto_100322 ) ( ON ?auto_100324 ?auto_100323 ) ( not ( = ?auto_100322 ?auto_100323 ) ) ( not ( = ?auto_100322 ?auto_100324 ) ) ( not ( = ?auto_100322 ?auto_100325 ) ) ( not ( = ?auto_100323 ?auto_100324 ) ) ( not ( = ?auto_100323 ?auto_100325 ) ) ( not ( = ?auto_100324 ?auto_100325 ) ) )
    :subtasks
    ( ( !STACK ?auto_100325 ?auto_100324 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100326 - BLOCK
      ?auto_100327 - BLOCK
      ?auto_100328 - BLOCK
      ?auto_100329 - BLOCK
    )
    :vars
    (
      ?auto_100330 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_100328 ) ( ON-TABLE ?auto_100326 ) ( ON ?auto_100327 ?auto_100326 ) ( ON ?auto_100328 ?auto_100327 ) ( not ( = ?auto_100326 ?auto_100327 ) ) ( not ( = ?auto_100326 ?auto_100328 ) ) ( not ( = ?auto_100326 ?auto_100329 ) ) ( not ( = ?auto_100327 ?auto_100328 ) ) ( not ( = ?auto_100327 ?auto_100329 ) ) ( not ( = ?auto_100328 ?auto_100329 ) ) ( ON ?auto_100329 ?auto_100330 ) ( CLEAR ?auto_100329 ) ( HAND-EMPTY ) ( not ( = ?auto_100326 ?auto_100330 ) ) ( not ( = ?auto_100327 ?auto_100330 ) ) ( not ( = ?auto_100328 ?auto_100330 ) ) ( not ( = ?auto_100329 ?auto_100330 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100329 ?auto_100330 )
      ( MAKE-4PILE ?auto_100326 ?auto_100327 ?auto_100328 ?auto_100329 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100331 - BLOCK
      ?auto_100332 - BLOCK
      ?auto_100333 - BLOCK
      ?auto_100334 - BLOCK
    )
    :vars
    (
      ?auto_100335 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_100331 ) ( ON ?auto_100332 ?auto_100331 ) ( not ( = ?auto_100331 ?auto_100332 ) ) ( not ( = ?auto_100331 ?auto_100333 ) ) ( not ( = ?auto_100331 ?auto_100334 ) ) ( not ( = ?auto_100332 ?auto_100333 ) ) ( not ( = ?auto_100332 ?auto_100334 ) ) ( not ( = ?auto_100333 ?auto_100334 ) ) ( ON ?auto_100334 ?auto_100335 ) ( CLEAR ?auto_100334 ) ( not ( = ?auto_100331 ?auto_100335 ) ) ( not ( = ?auto_100332 ?auto_100335 ) ) ( not ( = ?auto_100333 ?auto_100335 ) ) ( not ( = ?auto_100334 ?auto_100335 ) ) ( HOLDING ?auto_100333 ) ( CLEAR ?auto_100332 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100331 ?auto_100332 ?auto_100333 )
      ( MAKE-4PILE ?auto_100331 ?auto_100332 ?auto_100333 ?auto_100334 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100336 - BLOCK
      ?auto_100337 - BLOCK
      ?auto_100338 - BLOCK
      ?auto_100339 - BLOCK
    )
    :vars
    (
      ?auto_100340 - BLOCK
      ?auto_100342 - BLOCK
      ?auto_100341 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_100336 ) ( ON ?auto_100337 ?auto_100336 ) ( not ( = ?auto_100336 ?auto_100337 ) ) ( not ( = ?auto_100336 ?auto_100338 ) ) ( not ( = ?auto_100336 ?auto_100339 ) ) ( not ( = ?auto_100337 ?auto_100338 ) ) ( not ( = ?auto_100337 ?auto_100339 ) ) ( not ( = ?auto_100338 ?auto_100339 ) ) ( ON ?auto_100339 ?auto_100340 ) ( not ( = ?auto_100336 ?auto_100340 ) ) ( not ( = ?auto_100337 ?auto_100340 ) ) ( not ( = ?auto_100338 ?auto_100340 ) ) ( not ( = ?auto_100339 ?auto_100340 ) ) ( CLEAR ?auto_100337 ) ( ON ?auto_100338 ?auto_100339 ) ( CLEAR ?auto_100338 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100342 ) ( ON ?auto_100341 ?auto_100342 ) ( ON ?auto_100340 ?auto_100341 ) ( not ( = ?auto_100342 ?auto_100341 ) ) ( not ( = ?auto_100342 ?auto_100340 ) ) ( not ( = ?auto_100342 ?auto_100339 ) ) ( not ( = ?auto_100342 ?auto_100338 ) ) ( not ( = ?auto_100341 ?auto_100340 ) ) ( not ( = ?auto_100341 ?auto_100339 ) ) ( not ( = ?auto_100341 ?auto_100338 ) ) ( not ( = ?auto_100336 ?auto_100342 ) ) ( not ( = ?auto_100336 ?auto_100341 ) ) ( not ( = ?auto_100337 ?auto_100342 ) ) ( not ( = ?auto_100337 ?auto_100341 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100342 ?auto_100341 ?auto_100340 ?auto_100339 )
      ( MAKE-4PILE ?auto_100336 ?auto_100337 ?auto_100338 ?auto_100339 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100343 - BLOCK
      ?auto_100344 - BLOCK
      ?auto_100345 - BLOCK
      ?auto_100346 - BLOCK
    )
    :vars
    (
      ?auto_100347 - BLOCK
      ?auto_100348 - BLOCK
      ?auto_100349 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_100343 ) ( not ( = ?auto_100343 ?auto_100344 ) ) ( not ( = ?auto_100343 ?auto_100345 ) ) ( not ( = ?auto_100343 ?auto_100346 ) ) ( not ( = ?auto_100344 ?auto_100345 ) ) ( not ( = ?auto_100344 ?auto_100346 ) ) ( not ( = ?auto_100345 ?auto_100346 ) ) ( ON ?auto_100346 ?auto_100347 ) ( not ( = ?auto_100343 ?auto_100347 ) ) ( not ( = ?auto_100344 ?auto_100347 ) ) ( not ( = ?auto_100345 ?auto_100347 ) ) ( not ( = ?auto_100346 ?auto_100347 ) ) ( ON ?auto_100345 ?auto_100346 ) ( CLEAR ?auto_100345 ) ( ON-TABLE ?auto_100348 ) ( ON ?auto_100349 ?auto_100348 ) ( ON ?auto_100347 ?auto_100349 ) ( not ( = ?auto_100348 ?auto_100349 ) ) ( not ( = ?auto_100348 ?auto_100347 ) ) ( not ( = ?auto_100348 ?auto_100346 ) ) ( not ( = ?auto_100348 ?auto_100345 ) ) ( not ( = ?auto_100349 ?auto_100347 ) ) ( not ( = ?auto_100349 ?auto_100346 ) ) ( not ( = ?auto_100349 ?auto_100345 ) ) ( not ( = ?auto_100343 ?auto_100348 ) ) ( not ( = ?auto_100343 ?auto_100349 ) ) ( not ( = ?auto_100344 ?auto_100348 ) ) ( not ( = ?auto_100344 ?auto_100349 ) ) ( HOLDING ?auto_100344 ) ( CLEAR ?auto_100343 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100343 ?auto_100344 )
      ( MAKE-4PILE ?auto_100343 ?auto_100344 ?auto_100345 ?auto_100346 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100350 - BLOCK
      ?auto_100351 - BLOCK
      ?auto_100352 - BLOCK
      ?auto_100353 - BLOCK
    )
    :vars
    (
      ?auto_100355 - BLOCK
      ?auto_100356 - BLOCK
      ?auto_100354 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_100350 ) ( not ( = ?auto_100350 ?auto_100351 ) ) ( not ( = ?auto_100350 ?auto_100352 ) ) ( not ( = ?auto_100350 ?auto_100353 ) ) ( not ( = ?auto_100351 ?auto_100352 ) ) ( not ( = ?auto_100351 ?auto_100353 ) ) ( not ( = ?auto_100352 ?auto_100353 ) ) ( ON ?auto_100353 ?auto_100355 ) ( not ( = ?auto_100350 ?auto_100355 ) ) ( not ( = ?auto_100351 ?auto_100355 ) ) ( not ( = ?auto_100352 ?auto_100355 ) ) ( not ( = ?auto_100353 ?auto_100355 ) ) ( ON ?auto_100352 ?auto_100353 ) ( ON-TABLE ?auto_100356 ) ( ON ?auto_100354 ?auto_100356 ) ( ON ?auto_100355 ?auto_100354 ) ( not ( = ?auto_100356 ?auto_100354 ) ) ( not ( = ?auto_100356 ?auto_100355 ) ) ( not ( = ?auto_100356 ?auto_100353 ) ) ( not ( = ?auto_100356 ?auto_100352 ) ) ( not ( = ?auto_100354 ?auto_100355 ) ) ( not ( = ?auto_100354 ?auto_100353 ) ) ( not ( = ?auto_100354 ?auto_100352 ) ) ( not ( = ?auto_100350 ?auto_100356 ) ) ( not ( = ?auto_100350 ?auto_100354 ) ) ( not ( = ?auto_100351 ?auto_100356 ) ) ( not ( = ?auto_100351 ?auto_100354 ) ) ( CLEAR ?auto_100350 ) ( ON ?auto_100351 ?auto_100352 ) ( CLEAR ?auto_100351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100356 ?auto_100354 ?auto_100355 ?auto_100353 ?auto_100352 )
      ( MAKE-4PILE ?auto_100350 ?auto_100351 ?auto_100352 ?auto_100353 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100357 - BLOCK
      ?auto_100358 - BLOCK
      ?auto_100359 - BLOCK
      ?auto_100360 - BLOCK
    )
    :vars
    (
      ?auto_100362 - BLOCK
      ?auto_100361 - BLOCK
      ?auto_100363 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100357 ?auto_100358 ) ) ( not ( = ?auto_100357 ?auto_100359 ) ) ( not ( = ?auto_100357 ?auto_100360 ) ) ( not ( = ?auto_100358 ?auto_100359 ) ) ( not ( = ?auto_100358 ?auto_100360 ) ) ( not ( = ?auto_100359 ?auto_100360 ) ) ( ON ?auto_100360 ?auto_100362 ) ( not ( = ?auto_100357 ?auto_100362 ) ) ( not ( = ?auto_100358 ?auto_100362 ) ) ( not ( = ?auto_100359 ?auto_100362 ) ) ( not ( = ?auto_100360 ?auto_100362 ) ) ( ON ?auto_100359 ?auto_100360 ) ( ON-TABLE ?auto_100361 ) ( ON ?auto_100363 ?auto_100361 ) ( ON ?auto_100362 ?auto_100363 ) ( not ( = ?auto_100361 ?auto_100363 ) ) ( not ( = ?auto_100361 ?auto_100362 ) ) ( not ( = ?auto_100361 ?auto_100360 ) ) ( not ( = ?auto_100361 ?auto_100359 ) ) ( not ( = ?auto_100363 ?auto_100362 ) ) ( not ( = ?auto_100363 ?auto_100360 ) ) ( not ( = ?auto_100363 ?auto_100359 ) ) ( not ( = ?auto_100357 ?auto_100361 ) ) ( not ( = ?auto_100357 ?auto_100363 ) ) ( not ( = ?auto_100358 ?auto_100361 ) ) ( not ( = ?auto_100358 ?auto_100363 ) ) ( ON ?auto_100358 ?auto_100359 ) ( CLEAR ?auto_100358 ) ( HOLDING ?auto_100357 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100357 )
      ( MAKE-4PILE ?auto_100357 ?auto_100358 ?auto_100359 ?auto_100360 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100364 - BLOCK
      ?auto_100365 - BLOCK
      ?auto_100366 - BLOCK
      ?auto_100367 - BLOCK
    )
    :vars
    (
      ?auto_100370 - BLOCK
      ?auto_100369 - BLOCK
      ?auto_100368 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100364 ?auto_100365 ) ) ( not ( = ?auto_100364 ?auto_100366 ) ) ( not ( = ?auto_100364 ?auto_100367 ) ) ( not ( = ?auto_100365 ?auto_100366 ) ) ( not ( = ?auto_100365 ?auto_100367 ) ) ( not ( = ?auto_100366 ?auto_100367 ) ) ( ON ?auto_100367 ?auto_100370 ) ( not ( = ?auto_100364 ?auto_100370 ) ) ( not ( = ?auto_100365 ?auto_100370 ) ) ( not ( = ?auto_100366 ?auto_100370 ) ) ( not ( = ?auto_100367 ?auto_100370 ) ) ( ON ?auto_100366 ?auto_100367 ) ( ON-TABLE ?auto_100369 ) ( ON ?auto_100368 ?auto_100369 ) ( ON ?auto_100370 ?auto_100368 ) ( not ( = ?auto_100369 ?auto_100368 ) ) ( not ( = ?auto_100369 ?auto_100370 ) ) ( not ( = ?auto_100369 ?auto_100367 ) ) ( not ( = ?auto_100369 ?auto_100366 ) ) ( not ( = ?auto_100368 ?auto_100370 ) ) ( not ( = ?auto_100368 ?auto_100367 ) ) ( not ( = ?auto_100368 ?auto_100366 ) ) ( not ( = ?auto_100364 ?auto_100369 ) ) ( not ( = ?auto_100364 ?auto_100368 ) ) ( not ( = ?auto_100365 ?auto_100369 ) ) ( not ( = ?auto_100365 ?auto_100368 ) ) ( ON ?auto_100365 ?auto_100366 ) ( ON ?auto_100364 ?auto_100365 ) ( CLEAR ?auto_100364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100369 ?auto_100368 ?auto_100370 ?auto_100367 ?auto_100366 ?auto_100365 )
      ( MAKE-4PILE ?auto_100364 ?auto_100365 ?auto_100366 ?auto_100367 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100371 - BLOCK
      ?auto_100372 - BLOCK
      ?auto_100373 - BLOCK
      ?auto_100374 - BLOCK
    )
    :vars
    (
      ?auto_100376 - BLOCK
      ?auto_100375 - BLOCK
      ?auto_100377 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100371 ?auto_100372 ) ) ( not ( = ?auto_100371 ?auto_100373 ) ) ( not ( = ?auto_100371 ?auto_100374 ) ) ( not ( = ?auto_100372 ?auto_100373 ) ) ( not ( = ?auto_100372 ?auto_100374 ) ) ( not ( = ?auto_100373 ?auto_100374 ) ) ( ON ?auto_100374 ?auto_100376 ) ( not ( = ?auto_100371 ?auto_100376 ) ) ( not ( = ?auto_100372 ?auto_100376 ) ) ( not ( = ?auto_100373 ?auto_100376 ) ) ( not ( = ?auto_100374 ?auto_100376 ) ) ( ON ?auto_100373 ?auto_100374 ) ( ON-TABLE ?auto_100375 ) ( ON ?auto_100377 ?auto_100375 ) ( ON ?auto_100376 ?auto_100377 ) ( not ( = ?auto_100375 ?auto_100377 ) ) ( not ( = ?auto_100375 ?auto_100376 ) ) ( not ( = ?auto_100375 ?auto_100374 ) ) ( not ( = ?auto_100375 ?auto_100373 ) ) ( not ( = ?auto_100377 ?auto_100376 ) ) ( not ( = ?auto_100377 ?auto_100374 ) ) ( not ( = ?auto_100377 ?auto_100373 ) ) ( not ( = ?auto_100371 ?auto_100375 ) ) ( not ( = ?auto_100371 ?auto_100377 ) ) ( not ( = ?auto_100372 ?auto_100375 ) ) ( not ( = ?auto_100372 ?auto_100377 ) ) ( ON ?auto_100372 ?auto_100373 ) ( HOLDING ?auto_100371 ) ( CLEAR ?auto_100372 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_100375 ?auto_100377 ?auto_100376 ?auto_100374 ?auto_100373 ?auto_100372 ?auto_100371 )
      ( MAKE-4PILE ?auto_100371 ?auto_100372 ?auto_100373 ?auto_100374 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100378 - BLOCK
      ?auto_100379 - BLOCK
      ?auto_100380 - BLOCK
      ?auto_100381 - BLOCK
    )
    :vars
    (
      ?auto_100383 - BLOCK
      ?auto_100384 - BLOCK
      ?auto_100382 - BLOCK
      ?auto_100385 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100378 ?auto_100379 ) ) ( not ( = ?auto_100378 ?auto_100380 ) ) ( not ( = ?auto_100378 ?auto_100381 ) ) ( not ( = ?auto_100379 ?auto_100380 ) ) ( not ( = ?auto_100379 ?auto_100381 ) ) ( not ( = ?auto_100380 ?auto_100381 ) ) ( ON ?auto_100381 ?auto_100383 ) ( not ( = ?auto_100378 ?auto_100383 ) ) ( not ( = ?auto_100379 ?auto_100383 ) ) ( not ( = ?auto_100380 ?auto_100383 ) ) ( not ( = ?auto_100381 ?auto_100383 ) ) ( ON ?auto_100380 ?auto_100381 ) ( ON-TABLE ?auto_100384 ) ( ON ?auto_100382 ?auto_100384 ) ( ON ?auto_100383 ?auto_100382 ) ( not ( = ?auto_100384 ?auto_100382 ) ) ( not ( = ?auto_100384 ?auto_100383 ) ) ( not ( = ?auto_100384 ?auto_100381 ) ) ( not ( = ?auto_100384 ?auto_100380 ) ) ( not ( = ?auto_100382 ?auto_100383 ) ) ( not ( = ?auto_100382 ?auto_100381 ) ) ( not ( = ?auto_100382 ?auto_100380 ) ) ( not ( = ?auto_100378 ?auto_100384 ) ) ( not ( = ?auto_100378 ?auto_100382 ) ) ( not ( = ?auto_100379 ?auto_100384 ) ) ( not ( = ?auto_100379 ?auto_100382 ) ) ( ON ?auto_100379 ?auto_100380 ) ( CLEAR ?auto_100379 ) ( ON ?auto_100378 ?auto_100385 ) ( CLEAR ?auto_100378 ) ( HAND-EMPTY ) ( not ( = ?auto_100378 ?auto_100385 ) ) ( not ( = ?auto_100379 ?auto_100385 ) ) ( not ( = ?auto_100380 ?auto_100385 ) ) ( not ( = ?auto_100381 ?auto_100385 ) ) ( not ( = ?auto_100383 ?auto_100385 ) ) ( not ( = ?auto_100384 ?auto_100385 ) ) ( not ( = ?auto_100382 ?auto_100385 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100378 ?auto_100385 )
      ( MAKE-4PILE ?auto_100378 ?auto_100379 ?auto_100380 ?auto_100381 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100386 - BLOCK
      ?auto_100387 - BLOCK
      ?auto_100388 - BLOCK
      ?auto_100389 - BLOCK
    )
    :vars
    (
      ?auto_100392 - BLOCK
      ?auto_100393 - BLOCK
      ?auto_100390 - BLOCK
      ?auto_100391 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100386 ?auto_100387 ) ) ( not ( = ?auto_100386 ?auto_100388 ) ) ( not ( = ?auto_100386 ?auto_100389 ) ) ( not ( = ?auto_100387 ?auto_100388 ) ) ( not ( = ?auto_100387 ?auto_100389 ) ) ( not ( = ?auto_100388 ?auto_100389 ) ) ( ON ?auto_100389 ?auto_100392 ) ( not ( = ?auto_100386 ?auto_100392 ) ) ( not ( = ?auto_100387 ?auto_100392 ) ) ( not ( = ?auto_100388 ?auto_100392 ) ) ( not ( = ?auto_100389 ?auto_100392 ) ) ( ON ?auto_100388 ?auto_100389 ) ( ON-TABLE ?auto_100393 ) ( ON ?auto_100390 ?auto_100393 ) ( ON ?auto_100392 ?auto_100390 ) ( not ( = ?auto_100393 ?auto_100390 ) ) ( not ( = ?auto_100393 ?auto_100392 ) ) ( not ( = ?auto_100393 ?auto_100389 ) ) ( not ( = ?auto_100393 ?auto_100388 ) ) ( not ( = ?auto_100390 ?auto_100392 ) ) ( not ( = ?auto_100390 ?auto_100389 ) ) ( not ( = ?auto_100390 ?auto_100388 ) ) ( not ( = ?auto_100386 ?auto_100393 ) ) ( not ( = ?auto_100386 ?auto_100390 ) ) ( not ( = ?auto_100387 ?auto_100393 ) ) ( not ( = ?auto_100387 ?auto_100390 ) ) ( ON ?auto_100386 ?auto_100391 ) ( CLEAR ?auto_100386 ) ( not ( = ?auto_100386 ?auto_100391 ) ) ( not ( = ?auto_100387 ?auto_100391 ) ) ( not ( = ?auto_100388 ?auto_100391 ) ) ( not ( = ?auto_100389 ?auto_100391 ) ) ( not ( = ?auto_100392 ?auto_100391 ) ) ( not ( = ?auto_100393 ?auto_100391 ) ) ( not ( = ?auto_100390 ?auto_100391 ) ) ( HOLDING ?auto_100387 ) ( CLEAR ?auto_100388 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100393 ?auto_100390 ?auto_100392 ?auto_100389 ?auto_100388 ?auto_100387 )
      ( MAKE-4PILE ?auto_100386 ?auto_100387 ?auto_100388 ?auto_100389 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100394 - BLOCK
      ?auto_100395 - BLOCK
      ?auto_100396 - BLOCK
      ?auto_100397 - BLOCK
    )
    :vars
    (
      ?auto_100400 - BLOCK
      ?auto_100399 - BLOCK
      ?auto_100401 - BLOCK
      ?auto_100398 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100394 ?auto_100395 ) ) ( not ( = ?auto_100394 ?auto_100396 ) ) ( not ( = ?auto_100394 ?auto_100397 ) ) ( not ( = ?auto_100395 ?auto_100396 ) ) ( not ( = ?auto_100395 ?auto_100397 ) ) ( not ( = ?auto_100396 ?auto_100397 ) ) ( ON ?auto_100397 ?auto_100400 ) ( not ( = ?auto_100394 ?auto_100400 ) ) ( not ( = ?auto_100395 ?auto_100400 ) ) ( not ( = ?auto_100396 ?auto_100400 ) ) ( not ( = ?auto_100397 ?auto_100400 ) ) ( ON ?auto_100396 ?auto_100397 ) ( ON-TABLE ?auto_100399 ) ( ON ?auto_100401 ?auto_100399 ) ( ON ?auto_100400 ?auto_100401 ) ( not ( = ?auto_100399 ?auto_100401 ) ) ( not ( = ?auto_100399 ?auto_100400 ) ) ( not ( = ?auto_100399 ?auto_100397 ) ) ( not ( = ?auto_100399 ?auto_100396 ) ) ( not ( = ?auto_100401 ?auto_100400 ) ) ( not ( = ?auto_100401 ?auto_100397 ) ) ( not ( = ?auto_100401 ?auto_100396 ) ) ( not ( = ?auto_100394 ?auto_100399 ) ) ( not ( = ?auto_100394 ?auto_100401 ) ) ( not ( = ?auto_100395 ?auto_100399 ) ) ( not ( = ?auto_100395 ?auto_100401 ) ) ( ON ?auto_100394 ?auto_100398 ) ( not ( = ?auto_100394 ?auto_100398 ) ) ( not ( = ?auto_100395 ?auto_100398 ) ) ( not ( = ?auto_100396 ?auto_100398 ) ) ( not ( = ?auto_100397 ?auto_100398 ) ) ( not ( = ?auto_100400 ?auto_100398 ) ) ( not ( = ?auto_100399 ?auto_100398 ) ) ( not ( = ?auto_100401 ?auto_100398 ) ) ( CLEAR ?auto_100396 ) ( ON ?auto_100395 ?auto_100394 ) ( CLEAR ?auto_100395 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100398 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100398 ?auto_100394 )
      ( MAKE-4PILE ?auto_100394 ?auto_100395 ?auto_100396 ?auto_100397 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100402 - BLOCK
      ?auto_100403 - BLOCK
      ?auto_100404 - BLOCK
      ?auto_100405 - BLOCK
    )
    :vars
    (
      ?auto_100406 - BLOCK
      ?auto_100407 - BLOCK
      ?auto_100409 - BLOCK
      ?auto_100408 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100402 ?auto_100403 ) ) ( not ( = ?auto_100402 ?auto_100404 ) ) ( not ( = ?auto_100402 ?auto_100405 ) ) ( not ( = ?auto_100403 ?auto_100404 ) ) ( not ( = ?auto_100403 ?auto_100405 ) ) ( not ( = ?auto_100404 ?auto_100405 ) ) ( ON ?auto_100405 ?auto_100406 ) ( not ( = ?auto_100402 ?auto_100406 ) ) ( not ( = ?auto_100403 ?auto_100406 ) ) ( not ( = ?auto_100404 ?auto_100406 ) ) ( not ( = ?auto_100405 ?auto_100406 ) ) ( ON-TABLE ?auto_100407 ) ( ON ?auto_100409 ?auto_100407 ) ( ON ?auto_100406 ?auto_100409 ) ( not ( = ?auto_100407 ?auto_100409 ) ) ( not ( = ?auto_100407 ?auto_100406 ) ) ( not ( = ?auto_100407 ?auto_100405 ) ) ( not ( = ?auto_100407 ?auto_100404 ) ) ( not ( = ?auto_100409 ?auto_100406 ) ) ( not ( = ?auto_100409 ?auto_100405 ) ) ( not ( = ?auto_100409 ?auto_100404 ) ) ( not ( = ?auto_100402 ?auto_100407 ) ) ( not ( = ?auto_100402 ?auto_100409 ) ) ( not ( = ?auto_100403 ?auto_100407 ) ) ( not ( = ?auto_100403 ?auto_100409 ) ) ( ON ?auto_100402 ?auto_100408 ) ( not ( = ?auto_100402 ?auto_100408 ) ) ( not ( = ?auto_100403 ?auto_100408 ) ) ( not ( = ?auto_100404 ?auto_100408 ) ) ( not ( = ?auto_100405 ?auto_100408 ) ) ( not ( = ?auto_100406 ?auto_100408 ) ) ( not ( = ?auto_100407 ?auto_100408 ) ) ( not ( = ?auto_100409 ?auto_100408 ) ) ( ON ?auto_100403 ?auto_100402 ) ( CLEAR ?auto_100403 ) ( ON-TABLE ?auto_100408 ) ( HOLDING ?auto_100404 ) ( CLEAR ?auto_100405 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100407 ?auto_100409 ?auto_100406 ?auto_100405 ?auto_100404 )
      ( MAKE-4PILE ?auto_100402 ?auto_100403 ?auto_100404 ?auto_100405 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100410 - BLOCK
      ?auto_100411 - BLOCK
      ?auto_100412 - BLOCK
      ?auto_100413 - BLOCK
    )
    :vars
    (
      ?auto_100414 - BLOCK
      ?auto_100416 - BLOCK
      ?auto_100417 - BLOCK
      ?auto_100415 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100410 ?auto_100411 ) ) ( not ( = ?auto_100410 ?auto_100412 ) ) ( not ( = ?auto_100410 ?auto_100413 ) ) ( not ( = ?auto_100411 ?auto_100412 ) ) ( not ( = ?auto_100411 ?auto_100413 ) ) ( not ( = ?auto_100412 ?auto_100413 ) ) ( ON ?auto_100413 ?auto_100414 ) ( not ( = ?auto_100410 ?auto_100414 ) ) ( not ( = ?auto_100411 ?auto_100414 ) ) ( not ( = ?auto_100412 ?auto_100414 ) ) ( not ( = ?auto_100413 ?auto_100414 ) ) ( ON-TABLE ?auto_100416 ) ( ON ?auto_100417 ?auto_100416 ) ( ON ?auto_100414 ?auto_100417 ) ( not ( = ?auto_100416 ?auto_100417 ) ) ( not ( = ?auto_100416 ?auto_100414 ) ) ( not ( = ?auto_100416 ?auto_100413 ) ) ( not ( = ?auto_100416 ?auto_100412 ) ) ( not ( = ?auto_100417 ?auto_100414 ) ) ( not ( = ?auto_100417 ?auto_100413 ) ) ( not ( = ?auto_100417 ?auto_100412 ) ) ( not ( = ?auto_100410 ?auto_100416 ) ) ( not ( = ?auto_100410 ?auto_100417 ) ) ( not ( = ?auto_100411 ?auto_100416 ) ) ( not ( = ?auto_100411 ?auto_100417 ) ) ( ON ?auto_100410 ?auto_100415 ) ( not ( = ?auto_100410 ?auto_100415 ) ) ( not ( = ?auto_100411 ?auto_100415 ) ) ( not ( = ?auto_100412 ?auto_100415 ) ) ( not ( = ?auto_100413 ?auto_100415 ) ) ( not ( = ?auto_100414 ?auto_100415 ) ) ( not ( = ?auto_100416 ?auto_100415 ) ) ( not ( = ?auto_100417 ?auto_100415 ) ) ( ON ?auto_100411 ?auto_100410 ) ( ON-TABLE ?auto_100415 ) ( CLEAR ?auto_100413 ) ( ON ?auto_100412 ?auto_100411 ) ( CLEAR ?auto_100412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100415 ?auto_100410 ?auto_100411 )
      ( MAKE-4PILE ?auto_100410 ?auto_100411 ?auto_100412 ?auto_100413 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100418 - BLOCK
      ?auto_100419 - BLOCK
      ?auto_100420 - BLOCK
      ?auto_100421 - BLOCK
    )
    :vars
    (
      ?auto_100423 - BLOCK
      ?auto_100422 - BLOCK
      ?auto_100424 - BLOCK
      ?auto_100425 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100418 ?auto_100419 ) ) ( not ( = ?auto_100418 ?auto_100420 ) ) ( not ( = ?auto_100418 ?auto_100421 ) ) ( not ( = ?auto_100419 ?auto_100420 ) ) ( not ( = ?auto_100419 ?auto_100421 ) ) ( not ( = ?auto_100420 ?auto_100421 ) ) ( not ( = ?auto_100418 ?auto_100423 ) ) ( not ( = ?auto_100419 ?auto_100423 ) ) ( not ( = ?auto_100420 ?auto_100423 ) ) ( not ( = ?auto_100421 ?auto_100423 ) ) ( ON-TABLE ?auto_100422 ) ( ON ?auto_100424 ?auto_100422 ) ( ON ?auto_100423 ?auto_100424 ) ( not ( = ?auto_100422 ?auto_100424 ) ) ( not ( = ?auto_100422 ?auto_100423 ) ) ( not ( = ?auto_100422 ?auto_100421 ) ) ( not ( = ?auto_100422 ?auto_100420 ) ) ( not ( = ?auto_100424 ?auto_100423 ) ) ( not ( = ?auto_100424 ?auto_100421 ) ) ( not ( = ?auto_100424 ?auto_100420 ) ) ( not ( = ?auto_100418 ?auto_100422 ) ) ( not ( = ?auto_100418 ?auto_100424 ) ) ( not ( = ?auto_100419 ?auto_100422 ) ) ( not ( = ?auto_100419 ?auto_100424 ) ) ( ON ?auto_100418 ?auto_100425 ) ( not ( = ?auto_100418 ?auto_100425 ) ) ( not ( = ?auto_100419 ?auto_100425 ) ) ( not ( = ?auto_100420 ?auto_100425 ) ) ( not ( = ?auto_100421 ?auto_100425 ) ) ( not ( = ?auto_100423 ?auto_100425 ) ) ( not ( = ?auto_100422 ?auto_100425 ) ) ( not ( = ?auto_100424 ?auto_100425 ) ) ( ON ?auto_100419 ?auto_100418 ) ( ON-TABLE ?auto_100425 ) ( ON ?auto_100420 ?auto_100419 ) ( CLEAR ?auto_100420 ) ( HOLDING ?auto_100421 ) ( CLEAR ?auto_100423 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100422 ?auto_100424 ?auto_100423 ?auto_100421 )
      ( MAKE-4PILE ?auto_100418 ?auto_100419 ?auto_100420 ?auto_100421 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100426 - BLOCK
      ?auto_100427 - BLOCK
      ?auto_100428 - BLOCK
      ?auto_100429 - BLOCK
    )
    :vars
    (
      ?auto_100430 - BLOCK
      ?auto_100431 - BLOCK
      ?auto_100433 - BLOCK
      ?auto_100432 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100426 ?auto_100427 ) ) ( not ( = ?auto_100426 ?auto_100428 ) ) ( not ( = ?auto_100426 ?auto_100429 ) ) ( not ( = ?auto_100427 ?auto_100428 ) ) ( not ( = ?auto_100427 ?auto_100429 ) ) ( not ( = ?auto_100428 ?auto_100429 ) ) ( not ( = ?auto_100426 ?auto_100430 ) ) ( not ( = ?auto_100427 ?auto_100430 ) ) ( not ( = ?auto_100428 ?auto_100430 ) ) ( not ( = ?auto_100429 ?auto_100430 ) ) ( ON-TABLE ?auto_100431 ) ( ON ?auto_100433 ?auto_100431 ) ( ON ?auto_100430 ?auto_100433 ) ( not ( = ?auto_100431 ?auto_100433 ) ) ( not ( = ?auto_100431 ?auto_100430 ) ) ( not ( = ?auto_100431 ?auto_100429 ) ) ( not ( = ?auto_100431 ?auto_100428 ) ) ( not ( = ?auto_100433 ?auto_100430 ) ) ( not ( = ?auto_100433 ?auto_100429 ) ) ( not ( = ?auto_100433 ?auto_100428 ) ) ( not ( = ?auto_100426 ?auto_100431 ) ) ( not ( = ?auto_100426 ?auto_100433 ) ) ( not ( = ?auto_100427 ?auto_100431 ) ) ( not ( = ?auto_100427 ?auto_100433 ) ) ( ON ?auto_100426 ?auto_100432 ) ( not ( = ?auto_100426 ?auto_100432 ) ) ( not ( = ?auto_100427 ?auto_100432 ) ) ( not ( = ?auto_100428 ?auto_100432 ) ) ( not ( = ?auto_100429 ?auto_100432 ) ) ( not ( = ?auto_100430 ?auto_100432 ) ) ( not ( = ?auto_100431 ?auto_100432 ) ) ( not ( = ?auto_100433 ?auto_100432 ) ) ( ON ?auto_100427 ?auto_100426 ) ( ON-TABLE ?auto_100432 ) ( ON ?auto_100428 ?auto_100427 ) ( CLEAR ?auto_100430 ) ( ON ?auto_100429 ?auto_100428 ) ( CLEAR ?auto_100429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100432 ?auto_100426 ?auto_100427 ?auto_100428 )
      ( MAKE-4PILE ?auto_100426 ?auto_100427 ?auto_100428 ?auto_100429 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100434 - BLOCK
      ?auto_100435 - BLOCK
      ?auto_100436 - BLOCK
      ?auto_100437 - BLOCK
    )
    :vars
    (
      ?auto_100439 - BLOCK
      ?auto_100438 - BLOCK
      ?auto_100440 - BLOCK
      ?auto_100441 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100434 ?auto_100435 ) ) ( not ( = ?auto_100434 ?auto_100436 ) ) ( not ( = ?auto_100434 ?auto_100437 ) ) ( not ( = ?auto_100435 ?auto_100436 ) ) ( not ( = ?auto_100435 ?auto_100437 ) ) ( not ( = ?auto_100436 ?auto_100437 ) ) ( not ( = ?auto_100434 ?auto_100439 ) ) ( not ( = ?auto_100435 ?auto_100439 ) ) ( not ( = ?auto_100436 ?auto_100439 ) ) ( not ( = ?auto_100437 ?auto_100439 ) ) ( ON-TABLE ?auto_100438 ) ( ON ?auto_100440 ?auto_100438 ) ( not ( = ?auto_100438 ?auto_100440 ) ) ( not ( = ?auto_100438 ?auto_100439 ) ) ( not ( = ?auto_100438 ?auto_100437 ) ) ( not ( = ?auto_100438 ?auto_100436 ) ) ( not ( = ?auto_100440 ?auto_100439 ) ) ( not ( = ?auto_100440 ?auto_100437 ) ) ( not ( = ?auto_100440 ?auto_100436 ) ) ( not ( = ?auto_100434 ?auto_100438 ) ) ( not ( = ?auto_100434 ?auto_100440 ) ) ( not ( = ?auto_100435 ?auto_100438 ) ) ( not ( = ?auto_100435 ?auto_100440 ) ) ( ON ?auto_100434 ?auto_100441 ) ( not ( = ?auto_100434 ?auto_100441 ) ) ( not ( = ?auto_100435 ?auto_100441 ) ) ( not ( = ?auto_100436 ?auto_100441 ) ) ( not ( = ?auto_100437 ?auto_100441 ) ) ( not ( = ?auto_100439 ?auto_100441 ) ) ( not ( = ?auto_100438 ?auto_100441 ) ) ( not ( = ?auto_100440 ?auto_100441 ) ) ( ON ?auto_100435 ?auto_100434 ) ( ON-TABLE ?auto_100441 ) ( ON ?auto_100436 ?auto_100435 ) ( ON ?auto_100437 ?auto_100436 ) ( CLEAR ?auto_100437 ) ( HOLDING ?auto_100439 ) ( CLEAR ?auto_100440 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100438 ?auto_100440 ?auto_100439 )
      ( MAKE-4PILE ?auto_100434 ?auto_100435 ?auto_100436 ?auto_100437 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100442 - BLOCK
      ?auto_100443 - BLOCK
      ?auto_100444 - BLOCK
      ?auto_100445 - BLOCK
    )
    :vars
    (
      ?auto_100448 - BLOCK
      ?auto_100447 - BLOCK
      ?auto_100449 - BLOCK
      ?auto_100446 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100442 ?auto_100443 ) ) ( not ( = ?auto_100442 ?auto_100444 ) ) ( not ( = ?auto_100442 ?auto_100445 ) ) ( not ( = ?auto_100443 ?auto_100444 ) ) ( not ( = ?auto_100443 ?auto_100445 ) ) ( not ( = ?auto_100444 ?auto_100445 ) ) ( not ( = ?auto_100442 ?auto_100448 ) ) ( not ( = ?auto_100443 ?auto_100448 ) ) ( not ( = ?auto_100444 ?auto_100448 ) ) ( not ( = ?auto_100445 ?auto_100448 ) ) ( ON-TABLE ?auto_100447 ) ( ON ?auto_100449 ?auto_100447 ) ( not ( = ?auto_100447 ?auto_100449 ) ) ( not ( = ?auto_100447 ?auto_100448 ) ) ( not ( = ?auto_100447 ?auto_100445 ) ) ( not ( = ?auto_100447 ?auto_100444 ) ) ( not ( = ?auto_100449 ?auto_100448 ) ) ( not ( = ?auto_100449 ?auto_100445 ) ) ( not ( = ?auto_100449 ?auto_100444 ) ) ( not ( = ?auto_100442 ?auto_100447 ) ) ( not ( = ?auto_100442 ?auto_100449 ) ) ( not ( = ?auto_100443 ?auto_100447 ) ) ( not ( = ?auto_100443 ?auto_100449 ) ) ( ON ?auto_100442 ?auto_100446 ) ( not ( = ?auto_100442 ?auto_100446 ) ) ( not ( = ?auto_100443 ?auto_100446 ) ) ( not ( = ?auto_100444 ?auto_100446 ) ) ( not ( = ?auto_100445 ?auto_100446 ) ) ( not ( = ?auto_100448 ?auto_100446 ) ) ( not ( = ?auto_100447 ?auto_100446 ) ) ( not ( = ?auto_100449 ?auto_100446 ) ) ( ON ?auto_100443 ?auto_100442 ) ( ON-TABLE ?auto_100446 ) ( ON ?auto_100444 ?auto_100443 ) ( ON ?auto_100445 ?auto_100444 ) ( CLEAR ?auto_100449 ) ( ON ?auto_100448 ?auto_100445 ) ( CLEAR ?auto_100448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100446 ?auto_100442 ?auto_100443 ?auto_100444 ?auto_100445 )
      ( MAKE-4PILE ?auto_100442 ?auto_100443 ?auto_100444 ?auto_100445 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100450 - BLOCK
      ?auto_100451 - BLOCK
      ?auto_100452 - BLOCK
      ?auto_100453 - BLOCK
    )
    :vars
    (
      ?auto_100457 - BLOCK
      ?auto_100456 - BLOCK
      ?auto_100455 - BLOCK
      ?auto_100454 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100450 ?auto_100451 ) ) ( not ( = ?auto_100450 ?auto_100452 ) ) ( not ( = ?auto_100450 ?auto_100453 ) ) ( not ( = ?auto_100451 ?auto_100452 ) ) ( not ( = ?auto_100451 ?auto_100453 ) ) ( not ( = ?auto_100452 ?auto_100453 ) ) ( not ( = ?auto_100450 ?auto_100457 ) ) ( not ( = ?auto_100451 ?auto_100457 ) ) ( not ( = ?auto_100452 ?auto_100457 ) ) ( not ( = ?auto_100453 ?auto_100457 ) ) ( ON-TABLE ?auto_100456 ) ( not ( = ?auto_100456 ?auto_100455 ) ) ( not ( = ?auto_100456 ?auto_100457 ) ) ( not ( = ?auto_100456 ?auto_100453 ) ) ( not ( = ?auto_100456 ?auto_100452 ) ) ( not ( = ?auto_100455 ?auto_100457 ) ) ( not ( = ?auto_100455 ?auto_100453 ) ) ( not ( = ?auto_100455 ?auto_100452 ) ) ( not ( = ?auto_100450 ?auto_100456 ) ) ( not ( = ?auto_100450 ?auto_100455 ) ) ( not ( = ?auto_100451 ?auto_100456 ) ) ( not ( = ?auto_100451 ?auto_100455 ) ) ( ON ?auto_100450 ?auto_100454 ) ( not ( = ?auto_100450 ?auto_100454 ) ) ( not ( = ?auto_100451 ?auto_100454 ) ) ( not ( = ?auto_100452 ?auto_100454 ) ) ( not ( = ?auto_100453 ?auto_100454 ) ) ( not ( = ?auto_100457 ?auto_100454 ) ) ( not ( = ?auto_100456 ?auto_100454 ) ) ( not ( = ?auto_100455 ?auto_100454 ) ) ( ON ?auto_100451 ?auto_100450 ) ( ON-TABLE ?auto_100454 ) ( ON ?auto_100452 ?auto_100451 ) ( ON ?auto_100453 ?auto_100452 ) ( ON ?auto_100457 ?auto_100453 ) ( CLEAR ?auto_100457 ) ( HOLDING ?auto_100455 ) ( CLEAR ?auto_100456 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100456 ?auto_100455 )
      ( MAKE-4PILE ?auto_100450 ?auto_100451 ?auto_100452 ?auto_100453 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100458 - BLOCK
      ?auto_100459 - BLOCK
      ?auto_100460 - BLOCK
      ?auto_100461 - BLOCK
    )
    :vars
    (
      ?auto_100463 - BLOCK
      ?auto_100464 - BLOCK
      ?auto_100465 - BLOCK
      ?auto_100462 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100458 ?auto_100459 ) ) ( not ( = ?auto_100458 ?auto_100460 ) ) ( not ( = ?auto_100458 ?auto_100461 ) ) ( not ( = ?auto_100459 ?auto_100460 ) ) ( not ( = ?auto_100459 ?auto_100461 ) ) ( not ( = ?auto_100460 ?auto_100461 ) ) ( not ( = ?auto_100458 ?auto_100463 ) ) ( not ( = ?auto_100459 ?auto_100463 ) ) ( not ( = ?auto_100460 ?auto_100463 ) ) ( not ( = ?auto_100461 ?auto_100463 ) ) ( ON-TABLE ?auto_100464 ) ( not ( = ?auto_100464 ?auto_100465 ) ) ( not ( = ?auto_100464 ?auto_100463 ) ) ( not ( = ?auto_100464 ?auto_100461 ) ) ( not ( = ?auto_100464 ?auto_100460 ) ) ( not ( = ?auto_100465 ?auto_100463 ) ) ( not ( = ?auto_100465 ?auto_100461 ) ) ( not ( = ?auto_100465 ?auto_100460 ) ) ( not ( = ?auto_100458 ?auto_100464 ) ) ( not ( = ?auto_100458 ?auto_100465 ) ) ( not ( = ?auto_100459 ?auto_100464 ) ) ( not ( = ?auto_100459 ?auto_100465 ) ) ( ON ?auto_100458 ?auto_100462 ) ( not ( = ?auto_100458 ?auto_100462 ) ) ( not ( = ?auto_100459 ?auto_100462 ) ) ( not ( = ?auto_100460 ?auto_100462 ) ) ( not ( = ?auto_100461 ?auto_100462 ) ) ( not ( = ?auto_100463 ?auto_100462 ) ) ( not ( = ?auto_100464 ?auto_100462 ) ) ( not ( = ?auto_100465 ?auto_100462 ) ) ( ON ?auto_100459 ?auto_100458 ) ( ON-TABLE ?auto_100462 ) ( ON ?auto_100460 ?auto_100459 ) ( ON ?auto_100461 ?auto_100460 ) ( ON ?auto_100463 ?auto_100461 ) ( CLEAR ?auto_100464 ) ( ON ?auto_100465 ?auto_100463 ) ( CLEAR ?auto_100465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100462 ?auto_100458 ?auto_100459 ?auto_100460 ?auto_100461 ?auto_100463 )
      ( MAKE-4PILE ?auto_100458 ?auto_100459 ?auto_100460 ?auto_100461 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100466 - BLOCK
      ?auto_100467 - BLOCK
      ?auto_100468 - BLOCK
      ?auto_100469 - BLOCK
    )
    :vars
    (
      ?auto_100473 - BLOCK
      ?auto_100472 - BLOCK
      ?auto_100471 - BLOCK
      ?auto_100470 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100466 ?auto_100467 ) ) ( not ( = ?auto_100466 ?auto_100468 ) ) ( not ( = ?auto_100466 ?auto_100469 ) ) ( not ( = ?auto_100467 ?auto_100468 ) ) ( not ( = ?auto_100467 ?auto_100469 ) ) ( not ( = ?auto_100468 ?auto_100469 ) ) ( not ( = ?auto_100466 ?auto_100473 ) ) ( not ( = ?auto_100467 ?auto_100473 ) ) ( not ( = ?auto_100468 ?auto_100473 ) ) ( not ( = ?auto_100469 ?auto_100473 ) ) ( not ( = ?auto_100472 ?auto_100471 ) ) ( not ( = ?auto_100472 ?auto_100473 ) ) ( not ( = ?auto_100472 ?auto_100469 ) ) ( not ( = ?auto_100472 ?auto_100468 ) ) ( not ( = ?auto_100471 ?auto_100473 ) ) ( not ( = ?auto_100471 ?auto_100469 ) ) ( not ( = ?auto_100471 ?auto_100468 ) ) ( not ( = ?auto_100466 ?auto_100472 ) ) ( not ( = ?auto_100466 ?auto_100471 ) ) ( not ( = ?auto_100467 ?auto_100472 ) ) ( not ( = ?auto_100467 ?auto_100471 ) ) ( ON ?auto_100466 ?auto_100470 ) ( not ( = ?auto_100466 ?auto_100470 ) ) ( not ( = ?auto_100467 ?auto_100470 ) ) ( not ( = ?auto_100468 ?auto_100470 ) ) ( not ( = ?auto_100469 ?auto_100470 ) ) ( not ( = ?auto_100473 ?auto_100470 ) ) ( not ( = ?auto_100472 ?auto_100470 ) ) ( not ( = ?auto_100471 ?auto_100470 ) ) ( ON ?auto_100467 ?auto_100466 ) ( ON-TABLE ?auto_100470 ) ( ON ?auto_100468 ?auto_100467 ) ( ON ?auto_100469 ?auto_100468 ) ( ON ?auto_100473 ?auto_100469 ) ( ON ?auto_100471 ?auto_100473 ) ( CLEAR ?auto_100471 ) ( HOLDING ?auto_100472 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100472 )
      ( MAKE-4PILE ?auto_100466 ?auto_100467 ?auto_100468 ?auto_100469 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100474 - BLOCK
      ?auto_100475 - BLOCK
      ?auto_100476 - BLOCK
      ?auto_100477 - BLOCK
    )
    :vars
    (
      ?auto_100481 - BLOCK
      ?auto_100479 - BLOCK
      ?auto_100480 - BLOCK
      ?auto_100478 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100474 ?auto_100475 ) ) ( not ( = ?auto_100474 ?auto_100476 ) ) ( not ( = ?auto_100474 ?auto_100477 ) ) ( not ( = ?auto_100475 ?auto_100476 ) ) ( not ( = ?auto_100475 ?auto_100477 ) ) ( not ( = ?auto_100476 ?auto_100477 ) ) ( not ( = ?auto_100474 ?auto_100481 ) ) ( not ( = ?auto_100475 ?auto_100481 ) ) ( not ( = ?auto_100476 ?auto_100481 ) ) ( not ( = ?auto_100477 ?auto_100481 ) ) ( not ( = ?auto_100479 ?auto_100480 ) ) ( not ( = ?auto_100479 ?auto_100481 ) ) ( not ( = ?auto_100479 ?auto_100477 ) ) ( not ( = ?auto_100479 ?auto_100476 ) ) ( not ( = ?auto_100480 ?auto_100481 ) ) ( not ( = ?auto_100480 ?auto_100477 ) ) ( not ( = ?auto_100480 ?auto_100476 ) ) ( not ( = ?auto_100474 ?auto_100479 ) ) ( not ( = ?auto_100474 ?auto_100480 ) ) ( not ( = ?auto_100475 ?auto_100479 ) ) ( not ( = ?auto_100475 ?auto_100480 ) ) ( ON ?auto_100474 ?auto_100478 ) ( not ( = ?auto_100474 ?auto_100478 ) ) ( not ( = ?auto_100475 ?auto_100478 ) ) ( not ( = ?auto_100476 ?auto_100478 ) ) ( not ( = ?auto_100477 ?auto_100478 ) ) ( not ( = ?auto_100481 ?auto_100478 ) ) ( not ( = ?auto_100479 ?auto_100478 ) ) ( not ( = ?auto_100480 ?auto_100478 ) ) ( ON ?auto_100475 ?auto_100474 ) ( ON-TABLE ?auto_100478 ) ( ON ?auto_100476 ?auto_100475 ) ( ON ?auto_100477 ?auto_100476 ) ( ON ?auto_100481 ?auto_100477 ) ( ON ?auto_100480 ?auto_100481 ) ( ON ?auto_100479 ?auto_100480 ) ( CLEAR ?auto_100479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_100478 ?auto_100474 ?auto_100475 ?auto_100476 ?auto_100477 ?auto_100481 ?auto_100480 )
      ( MAKE-4PILE ?auto_100474 ?auto_100475 ?auto_100476 ?auto_100477 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100484 - BLOCK
      ?auto_100485 - BLOCK
    )
    :vars
    (
      ?auto_100486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100486 ?auto_100485 ) ( CLEAR ?auto_100486 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100484 ) ( ON ?auto_100485 ?auto_100484 ) ( not ( = ?auto_100484 ?auto_100485 ) ) ( not ( = ?auto_100484 ?auto_100486 ) ) ( not ( = ?auto_100485 ?auto_100486 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100486 ?auto_100485 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100487 - BLOCK
      ?auto_100488 - BLOCK
    )
    :vars
    (
      ?auto_100489 - BLOCK
      ?auto_100490 - BLOCK
      ?auto_100491 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100489 ?auto_100488 ) ( CLEAR ?auto_100489 ) ( ON-TABLE ?auto_100487 ) ( ON ?auto_100488 ?auto_100487 ) ( not ( = ?auto_100487 ?auto_100488 ) ) ( not ( = ?auto_100487 ?auto_100489 ) ) ( not ( = ?auto_100488 ?auto_100489 ) ) ( HOLDING ?auto_100490 ) ( CLEAR ?auto_100491 ) ( not ( = ?auto_100487 ?auto_100490 ) ) ( not ( = ?auto_100487 ?auto_100491 ) ) ( not ( = ?auto_100488 ?auto_100490 ) ) ( not ( = ?auto_100488 ?auto_100491 ) ) ( not ( = ?auto_100489 ?auto_100490 ) ) ( not ( = ?auto_100489 ?auto_100491 ) ) ( not ( = ?auto_100490 ?auto_100491 ) ) )
    :subtasks
    ( ( !STACK ?auto_100490 ?auto_100491 )
      ( MAKE-2PILE ?auto_100487 ?auto_100488 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100492 - BLOCK
      ?auto_100493 - BLOCK
    )
    :vars
    (
      ?auto_100496 - BLOCK
      ?auto_100495 - BLOCK
      ?auto_100494 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100496 ?auto_100493 ) ( ON-TABLE ?auto_100492 ) ( ON ?auto_100493 ?auto_100492 ) ( not ( = ?auto_100492 ?auto_100493 ) ) ( not ( = ?auto_100492 ?auto_100496 ) ) ( not ( = ?auto_100493 ?auto_100496 ) ) ( CLEAR ?auto_100495 ) ( not ( = ?auto_100492 ?auto_100494 ) ) ( not ( = ?auto_100492 ?auto_100495 ) ) ( not ( = ?auto_100493 ?auto_100494 ) ) ( not ( = ?auto_100493 ?auto_100495 ) ) ( not ( = ?auto_100496 ?auto_100494 ) ) ( not ( = ?auto_100496 ?auto_100495 ) ) ( not ( = ?auto_100494 ?auto_100495 ) ) ( ON ?auto_100494 ?auto_100496 ) ( CLEAR ?auto_100494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100492 ?auto_100493 ?auto_100496 )
      ( MAKE-2PILE ?auto_100492 ?auto_100493 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100497 - BLOCK
      ?auto_100498 - BLOCK
    )
    :vars
    (
      ?auto_100501 - BLOCK
      ?auto_100500 - BLOCK
      ?auto_100499 - BLOCK
      ?auto_100502 - BLOCK
      ?auto_100503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100501 ?auto_100498 ) ( ON-TABLE ?auto_100497 ) ( ON ?auto_100498 ?auto_100497 ) ( not ( = ?auto_100497 ?auto_100498 ) ) ( not ( = ?auto_100497 ?auto_100501 ) ) ( not ( = ?auto_100498 ?auto_100501 ) ) ( not ( = ?auto_100497 ?auto_100500 ) ) ( not ( = ?auto_100497 ?auto_100499 ) ) ( not ( = ?auto_100498 ?auto_100500 ) ) ( not ( = ?auto_100498 ?auto_100499 ) ) ( not ( = ?auto_100501 ?auto_100500 ) ) ( not ( = ?auto_100501 ?auto_100499 ) ) ( not ( = ?auto_100500 ?auto_100499 ) ) ( ON ?auto_100500 ?auto_100501 ) ( CLEAR ?auto_100500 ) ( HOLDING ?auto_100499 ) ( CLEAR ?auto_100502 ) ( ON-TABLE ?auto_100503 ) ( ON ?auto_100502 ?auto_100503 ) ( not ( = ?auto_100503 ?auto_100502 ) ) ( not ( = ?auto_100503 ?auto_100499 ) ) ( not ( = ?auto_100502 ?auto_100499 ) ) ( not ( = ?auto_100497 ?auto_100502 ) ) ( not ( = ?auto_100497 ?auto_100503 ) ) ( not ( = ?auto_100498 ?auto_100502 ) ) ( not ( = ?auto_100498 ?auto_100503 ) ) ( not ( = ?auto_100501 ?auto_100502 ) ) ( not ( = ?auto_100501 ?auto_100503 ) ) ( not ( = ?auto_100500 ?auto_100502 ) ) ( not ( = ?auto_100500 ?auto_100503 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100503 ?auto_100502 ?auto_100499 )
      ( MAKE-2PILE ?auto_100497 ?auto_100498 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100504 - BLOCK
      ?auto_100505 - BLOCK
    )
    :vars
    (
      ?auto_100510 - BLOCK
      ?auto_100508 - BLOCK
      ?auto_100507 - BLOCK
      ?auto_100506 - BLOCK
      ?auto_100509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100510 ?auto_100505 ) ( ON-TABLE ?auto_100504 ) ( ON ?auto_100505 ?auto_100504 ) ( not ( = ?auto_100504 ?auto_100505 ) ) ( not ( = ?auto_100504 ?auto_100510 ) ) ( not ( = ?auto_100505 ?auto_100510 ) ) ( not ( = ?auto_100504 ?auto_100508 ) ) ( not ( = ?auto_100504 ?auto_100507 ) ) ( not ( = ?auto_100505 ?auto_100508 ) ) ( not ( = ?auto_100505 ?auto_100507 ) ) ( not ( = ?auto_100510 ?auto_100508 ) ) ( not ( = ?auto_100510 ?auto_100507 ) ) ( not ( = ?auto_100508 ?auto_100507 ) ) ( ON ?auto_100508 ?auto_100510 ) ( CLEAR ?auto_100506 ) ( ON-TABLE ?auto_100509 ) ( ON ?auto_100506 ?auto_100509 ) ( not ( = ?auto_100509 ?auto_100506 ) ) ( not ( = ?auto_100509 ?auto_100507 ) ) ( not ( = ?auto_100506 ?auto_100507 ) ) ( not ( = ?auto_100504 ?auto_100506 ) ) ( not ( = ?auto_100504 ?auto_100509 ) ) ( not ( = ?auto_100505 ?auto_100506 ) ) ( not ( = ?auto_100505 ?auto_100509 ) ) ( not ( = ?auto_100510 ?auto_100506 ) ) ( not ( = ?auto_100510 ?auto_100509 ) ) ( not ( = ?auto_100508 ?auto_100506 ) ) ( not ( = ?auto_100508 ?auto_100509 ) ) ( ON ?auto_100507 ?auto_100508 ) ( CLEAR ?auto_100507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100504 ?auto_100505 ?auto_100510 ?auto_100508 )
      ( MAKE-2PILE ?auto_100504 ?auto_100505 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100511 - BLOCK
      ?auto_100512 - BLOCK
    )
    :vars
    (
      ?auto_100517 - BLOCK
      ?auto_100516 - BLOCK
      ?auto_100514 - BLOCK
      ?auto_100515 - BLOCK
      ?auto_100513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100517 ?auto_100512 ) ( ON-TABLE ?auto_100511 ) ( ON ?auto_100512 ?auto_100511 ) ( not ( = ?auto_100511 ?auto_100512 ) ) ( not ( = ?auto_100511 ?auto_100517 ) ) ( not ( = ?auto_100512 ?auto_100517 ) ) ( not ( = ?auto_100511 ?auto_100516 ) ) ( not ( = ?auto_100511 ?auto_100514 ) ) ( not ( = ?auto_100512 ?auto_100516 ) ) ( not ( = ?auto_100512 ?auto_100514 ) ) ( not ( = ?auto_100517 ?auto_100516 ) ) ( not ( = ?auto_100517 ?auto_100514 ) ) ( not ( = ?auto_100516 ?auto_100514 ) ) ( ON ?auto_100516 ?auto_100517 ) ( ON-TABLE ?auto_100515 ) ( not ( = ?auto_100515 ?auto_100513 ) ) ( not ( = ?auto_100515 ?auto_100514 ) ) ( not ( = ?auto_100513 ?auto_100514 ) ) ( not ( = ?auto_100511 ?auto_100513 ) ) ( not ( = ?auto_100511 ?auto_100515 ) ) ( not ( = ?auto_100512 ?auto_100513 ) ) ( not ( = ?auto_100512 ?auto_100515 ) ) ( not ( = ?auto_100517 ?auto_100513 ) ) ( not ( = ?auto_100517 ?auto_100515 ) ) ( not ( = ?auto_100516 ?auto_100513 ) ) ( not ( = ?auto_100516 ?auto_100515 ) ) ( ON ?auto_100514 ?auto_100516 ) ( CLEAR ?auto_100514 ) ( HOLDING ?auto_100513 ) ( CLEAR ?auto_100515 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100515 ?auto_100513 )
      ( MAKE-2PILE ?auto_100511 ?auto_100512 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100518 - BLOCK
      ?auto_100519 - BLOCK
    )
    :vars
    (
      ?auto_100524 - BLOCK
      ?auto_100520 - BLOCK
      ?auto_100522 - BLOCK
      ?auto_100523 - BLOCK
      ?auto_100521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100524 ?auto_100519 ) ( ON-TABLE ?auto_100518 ) ( ON ?auto_100519 ?auto_100518 ) ( not ( = ?auto_100518 ?auto_100519 ) ) ( not ( = ?auto_100518 ?auto_100524 ) ) ( not ( = ?auto_100519 ?auto_100524 ) ) ( not ( = ?auto_100518 ?auto_100520 ) ) ( not ( = ?auto_100518 ?auto_100522 ) ) ( not ( = ?auto_100519 ?auto_100520 ) ) ( not ( = ?auto_100519 ?auto_100522 ) ) ( not ( = ?auto_100524 ?auto_100520 ) ) ( not ( = ?auto_100524 ?auto_100522 ) ) ( not ( = ?auto_100520 ?auto_100522 ) ) ( ON ?auto_100520 ?auto_100524 ) ( ON-TABLE ?auto_100523 ) ( not ( = ?auto_100523 ?auto_100521 ) ) ( not ( = ?auto_100523 ?auto_100522 ) ) ( not ( = ?auto_100521 ?auto_100522 ) ) ( not ( = ?auto_100518 ?auto_100521 ) ) ( not ( = ?auto_100518 ?auto_100523 ) ) ( not ( = ?auto_100519 ?auto_100521 ) ) ( not ( = ?auto_100519 ?auto_100523 ) ) ( not ( = ?auto_100524 ?auto_100521 ) ) ( not ( = ?auto_100524 ?auto_100523 ) ) ( not ( = ?auto_100520 ?auto_100521 ) ) ( not ( = ?auto_100520 ?auto_100523 ) ) ( ON ?auto_100522 ?auto_100520 ) ( CLEAR ?auto_100523 ) ( ON ?auto_100521 ?auto_100522 ) ( CLEAR ?auto_100521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100518 ?auto_100519 ?auto_100524 ?auto_100520 ?auto_100522 )
      ( MAKE-2PILE ?auto_100518 ?auto_100519 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100525 - BLOCK
      ?auto_100526 - BLOCK
    )
    :vars
    (
      ?auto_100529 - BLOCK
      ?auto_100530 - BLOCK
      ?auto_100531 - BLOCK
      ?auto_100528 - BLOCK
      ?auto_100527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100529 ?auto_100526 ) ( ON-TABLE ?auto_100525 ) ( ON ?auto_100526 ?auto_100525 ) ( not ( = ?auto_100525 ?auto_100526 ) ) ( not ( = ?auto_100525 ?auto_100529 ) ) ( not ( = ?auto_100526 ?auto_100529 ) ) ( not ( = ?auto_100525 ?auto_100530 ) ) ( not ( = ?auto_100525 ?auto_100531 ) ) ( not ( = ?auto_100526 ?auto_100530 ) ) ( not ( = ?auto_100526 ?auto_100531 ) ) ( not ( = ?auto_100529 ?auto_100530 ) ) ( not ( = ?auto_100529 ?auto_100531 ) ) ( not ( = ?auto_100530 ?auto_100531 ) ) ( ON ?auto_100530 ?auto_100529 ) ( not ( = ?auto_100528 ?auto_100527 ) ) ( not ( = ?auto_100528 ?auto_100531 ) ) ( not ( = ?auto_100527 ?auto_100531 ) ) ( not ( = ?auto_100525 ?auto_100527 ) ) ( not ( = ?auto_100525 ?auto_100528 ) ) ( not ( = ?auto_100526 ?auto_100527 ) ) ( not ( = ?auto_100526 ?auto_100528 ) ) ( not ( = ?auto_100529 ?auto_100527 ) ) ( not ( = ?auto_100529 ?auto_100528 ) ) ( not ( = ?auto_100530 ?auto_100527 ) ) ( not ( = ?auto_100530 ?auto_100528 ) ) ( ON ?auto_100531 ?auto_100530 ) ( ON ?auto_100527 ?auto_100531 ) ( CLEAR ?auto_100527 ) ( HOLDING ?auto_100528 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100528 )
      ( MAKE-2PILE ?auto_100525 ?auto_100526 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100532 - BLOCK
      ?auto_100533 - BLOCK
    )
    :vars
    (
      ?auto_100534 - BLOCK
      ?auto_100536 - BLOCK
      ?auto_100538 - BLOCK
      ?auto_100535 - BLOCK
      ?auto_100537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100534 ?auto_100533 ) ( ON-TABLE ?auto_100532 ) ( ON ?auto_100533 ?auto_100532 ) ( not ( = ?auto_100532 ?auto_100533 ) ) ( not ( = ?auto_100532 ?auto_100534 ) ) ( not ( = ?auto_100533 ?auto_100534 ) ) ( not ( = ?auto_100532 ?auto_100536 ) ) ( not ( = ?auto_100532 ?auto_100538 ) ) ( not ( = ?auto_100533 ?auto_100536 ) ) ( not ( = ?auto_100533 ?auto_100538 ) ) ( not ( = ?auto_100534 ?auto_100536 ) ) ( not ( = ?auto_100534 ?auto_100538 ) ) ( not ( = ?auto_100536 ?auto_100538 ) ) ( ON ?auto_100536 ?auto_100534 ) ( not ( = ?auto_100535 ?auto_100537 ) ) ( not ( = ?auto_100535 ?auto_100538 ) ) ( not ( = ?auto_100537 ?auto_100538 ) ) ( not ( = ?auto_100532 ?auto_100537 ) ) ( not ( = ?auto_100532 ?auto_100535 ) ) ( not ( = ?auto_100533 ?auto_100537 ) ) ( not ( = ?auto_100533 ?auto_100535 ) ) ( not ( = ?auto_100534 ?auto_100537 ) ) ( not ( = ?auto_100534 ?auto_100535 ) ) ( not ( = ?auto_100536 ?auto_100537 ) ) ( not ( = ?auto_100536 ?auto_100535 ) ) ( ON ?auto_100538 ?auto_100536 ) ( ON ?auto_100537 ?auto_100538 ) ( ON ?auto_100535 ?auto_100537 ) ( CLEAR ?auto_100535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100532 ?auto_100533 ?auto_100534 ?auto_100536 ?auto_100538 ?auto_100537 )
      ( MAKE-2PILE ?auto_100532 ?auto_100533 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100539 - BLOCK
      ?auto_100540 - BLOCK
    )
    :vars
    (
      ?auto_100545 - BLOCK
      ?auto_100541 - BLOCK
      ?auto_100542 - BLOCK
      ?auto_100544 - BLOCK
      ?auto_100543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100545 ?auto_100540 ) ( ON-TABLE ?auto_100539 ) ( ON ?auto_100540 ?auto_100539 ) ( not ( = ?auto_100539 ?auto_100540 ) ) ( not ( = ?auto_100539 ?auto_100545 ) ) ( not ( = ?auto_100540 ?auto_100545 ) ) ( not ( = ?auto_100539 ?auto_100541 ) ) ( not ( = ?auto_100539 ?auto_100542 ) ) ( not ( = ?auto_100540 ?auto_100541 ) ) ( not ( = ?auto_100540 ?auto_100542 ) ) ( not ( = ?auto_100545 ?auto_100541 ) ) ( not ( = ?auto_100545 ?auto_100542 ) ) ( not ( = ?auto_100541 ?auto_100542 ) ) ( ON ?auto_100541 ?auto_100545 ) ( not ( = ?auto_100544 ?auto_100543 ) ) ( not ( = ?auto_100544 ?auto_100542 ) ) ( not ( = ?auto_100543 ?auto_100542 ) ) ( not ( = ?auto_100539 ?auto_100543 ) ) ( not ( = ?auto_100539 ?auto_100544 ) ) ( not ( = ?auto_100540 ?auto_100543 ) ) ( not ( = ?auto_100540 ?auto_100544 ) ) ( not ( = ?auto_100545 ?auto_100543 ) ) ( not ( = ?auto_100545 ?auto_100544 ) ) ( not ( = ?auto_100541 ?auto_100543 ) ) ( not ( = ?auto_100541 ?auto_100544 ) ) ( ON ?auto_100542 ?auto_100541 ) ( ON ?auto_100543 ?auto_100542 ) ( HOLDING ?auto_100544 ) ( CLEAR ?auto_100543 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_100539 ?auto_100540 ?auto_100545 ?auto_100541 ?auto_100542 ?auto_100543 ?auto_100544 )
      ( MAKE-2PILE ?auto_100539 ?auto_100540 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100546 - BLOCK
      ?auto_100547 - BLOCK
    )
    :vars
    (
      ?auto_100552 - BLOCK
      ?auto_100548 - BLOCK
      ?auto_100550 - BLOCK
      ?auto_100549 - BLOCK
      ?auto_100551 - BLOCK
      ?auto_100553 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100552 ?auto_100547 ) ( ON-TABLE ?auto_100546 ) ( ON ?auto_100547 ?auto_100546 ) ( not ( = ?auto_100546 ?auto_100547 ) ) ( not ( = ?auto_100546 ?auto_100552 ) ) ( not ( = ?auto_100547 ?auto_100552 ) ) ( not ( = ?auto_100546 ?auto_100548 ) ) ( not ( = ?auto_100546 ?auto_100550 ) ) ( not ( = ?auto_100547 ?auto_100548 ) ) ( not ( = ?auto_100547 ?auto_100550 ) ) ( not ( = ?auto_100552 ?auto_100548 ) ) ( not ( = ?auto_100552 ?auto_100550 ) ) ( not ( = ?auto_100548 ?auto_100550 ) ) ( ON ?auto_100548 ?auto_100552 ) ( not ( = ?auto_100549 ?auto_100551 ) ) ( not ( = ?auto_100549 ?auto_100550 ) ) ( not ( = ?auto_100551 ?auto_100550 ) ) ( not ( = ?auto_100546 ?auto_100551 ) ) ( not ( = ?auto_100546 ?auto_100549 ) ) ( not ( = ?auto_100547 ?auto_100551 ) ) ( not ( = ?auto_100547 ?auto_100549 ) ) ( not ( = ?auto_100552 ?auto_100551 ) ) ( not ( = ?auto_100552 ?auto_100549 ) ) ( not ( = ?auto_100548 ?auto_100551 ) ) ( not ( = ?auto_100548 ?auto_100549 ) ) ( ON ?auto_100550 ?auto_100548 ) ( ON ?auto_100551 ?auto_100550 ) ( CLEAR ?auto_100551 ) ( ON ?auto_100549 ?auto_100553 ) ( CLEAR ?auto_100549 ) ( HAND-EMPTY ) ( not ( = ?auto_100546 ?auto_100553 ) ) ( not ( = ?auto_100547 ?auto_100553 ) ) ( not ( = ?auto_100552 ?auto_100553 ) ) ( not ( = ?auto_100548 ?auto_100553 ) ) ( not ( = ?auto_100550 ?auto_100553 ) ) ( not ( = ?auto_100549 ?auto_100553 ) ) ( not ( = ?auto_100551 ?auto_100553 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100549 ?auto_100553 )
      ( MAKE-2PILE ?auto_100546 ?auto_100547 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100554 - BLOCK
      ?auto_100555 - BLOCK
    )
    :vars
    (
      ?auto_100556 - BLOCK
      ?auto_100560 - BLOCK
      ?auto_100561 - BLOCK
      ?auto_100557 - BLOCK
      ?auto_100559 - BLOCK
      ?auto_100558 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100556 ?auto_100555 ) ( ON-TABLE ?auto_100554 ) ( ON ?auto_100555 ?auto_100554 ) ( not ( = ?auto_100554 ?auto_100555 ) ) ( not ( = ?auto_100554 ?auto_100556 ) ) ( not ( = ?auto_100555 ?auto_100556 ) ) ( not ( = ?auto_100554 ?auto_100560 ) ) ( not ( = ?auto_100554 ?auto_100561 ) ) ( not ( = ?auto_100555 ?auto_100560 ) ) ( not ( = ?auto_100555 ?auto_100561 ) ) ( not ( = ?auto_100556 ?auto_100560 ) ) ( not ( = ?auto_100556 ?auto_100561 ) ) ( not ( = ?auto_100560 ?auto_100561 ) ) ( ON ?auto_100560 ?auto_100556 ) ( not ( = ?auto_100557 ?auto_100559 ) ) ( not ( = ?auto_100557 ?auto_100561 ) ) ( not ( = ?auto_100559 ?auto_100561 ) ) ( not ( = ?auto_100554 ?auto_100559 ) ) ( not ( = ?auto_100554 ?auto_100557 ) ) ( not ( = ?auto_100555 ?auto_100559 ) ) ( not ( = ?auto_100555 ?auto_100557 ) ) ( not ( = ?auto_100556 ?auto_100559 ) ) ( not ( = ?auto_100556 ?auto_100557 ) ) ( not ( = ?auto_100560 ?auto_100559 ) ) ( not ( = ?auto_100560 ?auto_100557 ) ) ( ON ?auto_100561 ?auto_100560 ) ( ON ?auto_100557 ?auto_100558 ) ( CLEAR ?auto_100557 ) ( not ( = ?auto_100554 ?auto_100558 ) ) ( not ( = ?auto_100555 ?auto_100558 ) ) ( not ( = ?auto_100556 ?auto_100558 ) ) ( not ( = ?auto_100560 ?auto_100558 ) ) ( not ( = ?auto_100561 ?auto_100558 ) ) ( not ( = ?auto_100557 ?auto_100558 ) ) ( not ( = ?auto_100559 ?auto_100558 ) ) ( HOLDING ?auto_100559 ) ( CLEAR ?auto_100561 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100554 ?auto_100555 ?auto_100556 ?auto_100560 ?auto_100561 ?auto_100559 )
      ( MAKE-2PILE ?auto_100554 ?auto_100555 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100562 - BLOCK
      ?auto_100563 - BLOCK
    )
    :vars
    (
      ?auto_100566 - BLOCK
      ?auto_100568 - BLOCK
      ?auto_100567 - BLOCK
      ?auto_100565 - BLOCK
      ?auto_100569 - BLOCK
      ?auto_100564 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100566 ?auto_100563 ) ( ON-TABLE ?auto_100562 ) ( ON ?auto_100563 ?auto_100562 ) ( not ( = ?auto_100562 ?auto_100563 ) ) ( not ( = ?auto_100562 ?auto_100566 ) ) ( not ( = ?auto_100563 ?auto_100566 ) ) ( not ( = ?auto_100562 ?auto_100568 ) ) ( not ( = ?auto_100562 ?auto_100567 ) ) ( not ( = ?auto_100563 ?auto_100568 ) ) ( not ( = ?auto_100563 ?auto_100567 ) ) ( not ( = ?auto_100566 ?auto_100568 ) ) ( not ( = ?auto_100566 ?auto_100567 ) ) ( not ( = ?auto_100568 ?auto_100567 ) ) ( ON ?auto_100568 ?auto_100566 ) ( not ( = ?auto_100565 ?auto_100569 ) ) ( not ( = ?auto_100565 ?auto_100567 ) ) ( not ( = ?auto_100569 ?auto_100567 ) ) ( not ( = ?auto_100562 ?auto_100569 ) ) ( not ( = ?auto_100562 ?auto_100565 ) ) ( not ( = ?auto_100563 ?auto_100569 ) ) ( not ( = ?auto_100563 ?auto_100565 ) ) ( not ( = ?auto_100566 ?auto_100569 ) ) ( not ( = ?auto_100566 ?auto_100565 ) ) ( not ( = ?auto_100568 ?auto_100569 ) ) ( not ( = ?auto_100568 ?auto_100565 ) ) ( ON ?auto_100567 ?auto_100568 ) ( ON ?auto_100565 ?auto_100564 ) ( not ( = ?auto_100562 ?auto_100564 ) ) ( not ( = ?auto_100563 ?auto_100564 ) ) ( not ( = ?auto_100566 ?auto_100564 ) ) ( not ( = ?auto_100568 ?auto_100564 ) ) ( not ( = ?auto_100567 ?auto_100564 ) ) ( not ( = ?auto_100565 ?auto_100564 ) ) ( not ( = ?auto_100569 ?auto_100564 ) ) ( CLEAR ?auto_100567 ) ( ON ?auto_100569 ?auto_100565 ) ( CLEAR ?auto_100569 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100564 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100564 ?auto_100565 )
      ( MAKE-2PILE ?auto_100562 ?auto_100563 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100570 - BLOCK
      ?auto_100571 - BLOCK
    )
    :vars
    (
      ?auto_100572 - BLOCK
      ?auto_100577 - BLOCK
      ?auto_100575 - BLOCK
      ?auto_100573 - BLOCK
      ?auto_100576 - BLOCK
      ?auto_100574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100572 ?auto_100571 ) ( ON-TABLE ?auto_100570 ) ( ON ?auto_100571 ?auto_100570 ) ( not ( = ?auto_100570 ?auto_100571 ) ) ( not ( = ?auto_100570 ?auto_100572 ) ) ( not ( = ?auto_100571 ?auto_100572 ) ) ( not ( = ?auto_100570 ?auto_100577 ) ) ( not ( = ?auto_100570 ?auto_100575 ) ) ( not ( = ?auto_100571 ?auto_100577 ) ) ( not ( = ?auto_100571 ?auto_100575 ) ) ( not ( = ?auto_100572 ?auto_100577 ) ) ( not ( = ?auto_100572 ?auto_100575 ) ) ( not ( = ?auto_100577 ?auto_100575 ) ) ( ON ?auto_100577 ?auto_100572 ) ( not ( = ?auto_100573 ?auto_100576 ) ) ( not ( = ?auto_100573 ?auto_100575 ) ) ( not ( = ?auto_100576 ?auto_100575 ) ) ( not ( = ?auto_100570 ?auto_100576 ) ) ( not ( = ?auto_100570 ?auto_100573 ) ) ( not ( = ?auto_100571 ?auto_100576 ) ) ( not ( = ?auto_100571 ?auto_100573 ) ) ( not ( = ?auto_100572 ?auto_100576 ) ) ( not ( = ?auto_100572 ?auto_100573 ) ) ( not ( = ?auto_100577 ?auto_100576 ) ) ( not ( = ?auto_100577 ?auto_100573 ) ) ( ON ?auto_100573 ?auto_100574 ) ( not ( = ?auto_100570 ?auto_100574 ) ) ( not ( = ?auto_100571 ?auto_100574 ) ) ( not ( = ?auto_100572 ?auto_100574 ) ) ( not ( = ?auto_100577 ?auto_100574 ) ) ( not ( = ?auto_100575 ?auto_100574 ) ) ( not ( = ?auto_100573 ?auto_100574 ) ) ( not ( = ?auto_100576 ?auto_100574 ) ) ( ON ?auto_100576 ?auto_100573 ) ( CLEAR ?auto_100576 ) ( ON-TABLE ?auto_100574 ) ( HOLDING ?auto_100575 ) ( CLEAR ?auto_100577 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100570 ?auto_100571 ?auto_100572 ?auto_100577 ?auto_100575 )
      ( MAKE-2PILE ?auto_100570 ?auto_100571 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100578 - BLOCK
      ?auto_100579 - BLOCK
    )
    :vars
    (
      ?auto_100582 - BLOCK
      ?auto_100585 - BLOCK
      ?auto_100584 - BLOCK
      ?auto_100580 - BLOCK
      ?auto_100583 - BLOCK
      ?auto_100581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100582 ?auto_100579 ) ( ON-TABLE ?auto_100578 ) ( ON ?auto_100579 ?auto_100578 ) ( not ( = ?auto_100578 ?auto_100579 ) ) ( not ( = ?auto_100578 ?auto_100582 ) ) ( not ( = ?auto_100579 ?auto_100582 ) ) ( not ( = ?auto_100578 ?auto_100585 ) ) ( not ( = ?auto_100578 ?auto_100584 ) ) ( not ( = ?auto_100579 ?auto_100585 ) ) ( not ( = ?auto_100579 ?auto_100584 ) ) ( not ( = ?auto_100582 ?auto_100585 ) ) ( not ( = ?auto_100582 ?auto_100584 ) ) ( not ( = ?auto_100585 ?auto_100584 ) ) ( ON ?auto_100585 ?auto_100582 ) ( not ( = ?auto_100580 ?auto_100583 ) ) ( not ( = ?auto_100580 ?auto_100584 ) ) ( not ( = ?auto_100583 ?auto_100584 ) ) ( not ( = ?auto_100578 ?auto_100583 ) ) ( not ( = ?auto_100578 ?auto_100580 ) ) ( not ( = ?auto_100579 ?auto_100583 ) ) ( not ( = ?auto_100579 ?auto_100580 ) ) ( not ( = ?auto_100582 ?auto_100583 ) ) ( not ( = ?auto_100582 ?auto_100580 ) ) ( not ( = ?auto_100585 ?auto_100583 ) ) ( not ( = ?auto_100585 ?auto_100580 ) ) ( ON ?auto_100580 ?auto_100581 ) ( not ( = ?auto_100578 ?auto_100581 ) ) ( not ( = ?auto_100579 ?auto_100581 ) ) ( not ( = ?auto_100582 ?auto_100581 ) ) ( not ( = ?auto_100585 ?auto_100581 ) ) ( not ( = ?auto_100584 ?auto_100581 ) ) ( not ( = ?auto_100580 ?auto_100581 ) ) ( not ( = ?auto_100583 ?auto_100581 ) ) ( ON ?auto_100583 ?auto_100580 ) ( ON-TABLE ?auto_100581 ) ( CLEAR ?auto_100585 ) ( ON ?auto_100584 ?auto_100583 ) ( CLEAR ?auto_100584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100581 ?auto_100580 ?auto_100583 )
      ( MAKE-2PILE ?auto_100578 ?auto_100579 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100586 - BLOCK
      ?auto_100587 - BLOCK
    )
    :vars
    (
      ?auto_100590 - BLOCK
      ?auto_100589 - BLOCK
      ?auto_100593 - BLOCK
      ?auto_100591 - BLOCK
      ?auto_100592 - BLOCK
      ?auto_100588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100590 ?auto_100587 ) ( ON-TABLE ?auto_100586 ) ( ON ?auto_100587 ?auto_100586 ) ( not ( = ?auto_100586 ?auto_100587 ) ) ( not ( = ?auto_100586 ?auto_100590 ) ) ( not ( = ?auto_100587 ?auto_100590 ) ) ( not ( = ?auto_100586 ?auto_100589 ) ) ( not ( = ?auto_100586 ?auto_100593 ) ) ( not ( = ?auto_100587 ?auto_100589 ) ) ( not ( = ?auto_100587 ?auto_100593 ) ) ( not ( = ?auto_100590 ?auto_100589 ) ) ( not ( = ?auto_100590 ?auto_100593 ) ) ( not ( = ?auto_100589 ?auto_100593 ) ) ( not ( = ?auto_100591 ?auto_100592 ) ) ( not ( = ?auto_100591 ?auto_100593 ) ) ( not ( = ?auto_100592 ?auto_100593 ) ) ( not ( = ?auto_100586 ?auto_100592 ) ) ( not ( = ?auto_100586 ?auto_100591 ) ) ( not ( = ?auto_100587 ?auto_100592 ) ) ( not ( = ?auto_100587 ?auto_100591 ) ) ( not ( = ?auto_100590 ?auto_100592 ) ) ( not ( = ?auto_100590 ?auto_100591 ) ) ( not ( = ?auto_100589 ?auto_100592 ) ) ( not ( = ?auto_100589 ?auto_100591 ) ) ( ON ?auto_100591 ?auto_100588 ) ( not ( = ?auto_100586 ?auto_100588 ) ) ( not ( = ?auto_100587 ?auto_100588 ) ) ( not ( = ?auto_100590 ?auto_100588 ) ) ( not ( = ?auto_100589 ?auto_100588 ) ) ( not ( = ?auto_100593 ?auto_100588 ) ) ( not ( = ?auto_100591 ?auto_100588 ) ) ( not ( = ?auto_100592 ?auto_100588 ) ) ( ON ?auto_100592 ?auto_100591 ) ( ON-TABLE ?auto_100588 ) ( ON ?auto_100593 ?auto_100592 ) ( CLEAR ?auto_100593 ) ( HOLDING ?auto_100589 ) ( CLEAR ?auto_100590 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100586 ?auto_100587 ?auto_100590 ?auto_100589 )
      ( MAKE-2PILE ?auto_100586 ?auto_100587 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100594 - BLOCK
      ?auto_100595 - BLOCK
    )
    :vars
    (
      ?auto_100599 - BLOCK
      ?auto_100596 - BLOCK
      ?auto_100597 - BLOCK
      ?auto_100598 - BLOCK
      ?auto_100601 - BLOCK
      ?auto_100600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100599 ?auto_100595 ) ( ON-TABLE ?auto_100594 ) ( ON ?auto_100595 ?auto_100594 ) ( not ( = ?auto_100594 ?auto_100595 ) ) ( not ( = ?auto_100594 ?auto_100599 ) ) ( not ( = ?auto_100595 ?auto_100599 ) ) ( not ( = ?auto_100594 ?auto_100596 ) ) ( not ( = ?auto_100594 ?auto_100597 ) ) ( not ( = ?auto_100595 ?auto_100596 ) ) ( not ( = ?auto_100595 ?auto_100597 ) ) ( not ( = ?auto_100599 ?auto_100596 ) ) ( not ( = ?auto_100599 ?auto_100597 ) ) ( not ( = ?auto_100596 ?auto_100597 ) ) ( not ( = ?auto_100598 ?auto_100601 ) ) ( not ( = ?auto_100598 ?auto_100597 ) ) ( not ( = ?auto_100601 ?auto_100597 ) ) ( not ( = ?auto_100594 ?auto_100601 ) ) ( not ( = ?auto_100594 ?auto_100598 ) ) ( not ( = ?auto_100595 ?auto_100601 ) ) ( not ( = ?auto_100595 ?auto_100598 ) ) ( not ( = ?auto_100599 ?auto_100601 ) ) ( not ( = ?auto_100599 ?auto_100598 ) ) ( not ( = ?auto_100596 ?auto_100601 ) ) ( not ( = ?auto_100596 ?auto_100598 ) ) ( ON ?auto_100598 ?auto_100600 ) ( not ( = ?auto_100594 ?auto_100600 ) ) ( not ( = ?auto_100595 ?auto_100600 ) ) ( not ( = ?auto_100599 ?auto_100600 ) ) ( not ( = ?auto_100596 ?auto_100600 ) ) ( not ( = ?auto_100597 ?auto_100600 ) ) ( not ( = ?auto_100598 ?auto_100600 ) ) ( not ( = ?auto_100601 ?auto_100600 ) ) ( ON ?auto_100601 ?auto_100598 ) ( ON-TABLE ?auto_100600 ) ( ON ?auto_100597 ?auto_100601 ) ( CLEAR ?auto_100599 ) ( ON ?auto_100596 ?auto_100597 ) ( CLEAR ?auto_100596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100600 ?auto_100598 ?auto_100601 ?auto_100597 )
      ( MAKE-2PILE ?auto_100594 ?auto_100595 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100618 - BLOCK
      ?auto_100619 - BLOCK
    )
    :vars
    (
      ?auto_100624 - BLOCK
      ?auto_100622 - BLOCK
      ?auto_100623 - BLOCK
      ?auto_100625 - BLOCK
      ?auto_100621 - BLOCK
      ?auto_100620 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_100618 ) ( not ( = ?auto_100618 ?auto_100619 ) ) ( not ( = ?auto_100618 ?auto_100624 ) ) ( not ( = ?auto_100619 ?auto_100624 ) ) ( not ( = ?auto_100618 ?auto_100622 ) ) ( not ( = ?auto_100618 ?auto_100623 ) ) ( not ( = ?auto_100619 ?auto_100622 ) ) ( not ( = ?auto_100619 ?auto_100623 ) ) ( not ( = ?auto_100624 ?auto_100622 ) ) ( not ( = ?auto_100624 ?auto_100623 ) ) ( not ( = ?auto_100622 ?auto_100623 ) ) ( not ( = ?auto_100625 ?auto_100621 ) ) ( not ( = ?auto_100625 ?auto_100623 ) ) ( not ( = ?auto_100621 ?auto_100623 ) ) ( not ( = ?auto_100618 ?auto_100621 ) ) ( not ( = ?auto_100618 ?auto_100625 ) ) ( not ( = ?auto_100619 ?auto_100621 ) ) ( not ( = ?auto_100619 ?auto_100625 ) ) ( not ( = ?auto_100624 ?auto_100621 ) ) ( not ( = ?auto_100624 ?auto_100625 ) ) ( not ( = ?auto_100622 ?auto_100621 ) ) ( not ( = ?auto_100622 ?auto_100625 ) ) ( ON ?auto_100625 ?auto_100620 ) ( not ( = ?auto_100618 ?auto_100620 ) ) ( not ( = ?auto_100619 ?auto_100620 ) ) ( not ( = ?auto_100624 ?auto_100620 ) ) ( not ( = ?auto_100622 ?auto_100620 ) ) ( not ( = ?auto_100623 ?auto_100620 ) ) ( not ( = ?auto_100625 ?auto_100620 ) ) ( not ( = ?auto_100621 ?auto_100620 ) ) ( ON ?auto_100621 ?auto_100625 ) ( ON-TABLE ?auto_100620 ) ( ON ?auto_100623 ?auto_100621 ) ( ON ?auto_100622 ?auto_100623 ) ( ON ?auto_100624 ?auto_100622 ) ( CLEAR ?auto_100624 ) ( HOLDING ?auto_100619 ) ( CLEAR ?auto_100618 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100618 ?auto_100619 ?auto_100624 )
      ( MAKE-2PILE ?auto_100618 ?auto_100619 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100626 - BLOCK
      ?auto_100627 - BLOCK
    )
    :vars
    (
      ?auto_100629 - BLOCK
      ?auto_100631 - BLOCK
      ?auto_100632 - BLOCK
      ?auto_100628 - BLOCK
      ?auto_100630 - BLOCK
      ?auto_100633 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_100626 ) ( not ( = ?auto_100626 ?auto_100627 ) ) ( not ( = ?auto_100626 ?auto_100629 ) ) ( not ( = ?auto_100627 ?auto_100629 ) ) ( not ( = ?auto_100626 ?auto_100631 ) ) ( not ( = ?auto_100626 ?auto_100632 ) ) ( not ( = ?auto_100627 ?auto_100631 ) ) ( not ( = ?auto_100627 ?auto_100632 ) ) ( not ( = ?auto_100629 ?auto_100631 ) ) ( not ( = ?auto_100629 ?auto_100632 ) ) ( not ( = ?auto_100631 ?auto_100632 ) ) ( not ( = ?auto_100628 ?auto_100630 ) ) ( not ( = ?auto_100628 ?auto_100632 ) ) ( not ( = ?auto_100630 ?auto_100632 ) ) ( not ( = ?auto_100626 ?auto_100630 ) ) ( not ( = ?auto_100626 ?auto_100628 ) ) ( not ( = ?auto_100627 ?auto_100630 ) ) ( not ( = ?auto_100627 ?auto_100628 ) ) ( not ( = ?auto_100629 ?auto_100630 ) ) ( not ( = ?auto_100629 ?auto_100628 ) ) ( not ( = ?auto_100631 ?auto_100630 ) ) ( not ( = ?auto_100631 ?auto_100628 ) ) ( ON ?auto_100628 ?auto_100633 ) ( not ( = ?auto_100626 ?auto_100633 ) ) ( not ( = ?auto_100627 ?auto_100633 ) ) ( not ( = ?auto_100629 ?auto_100633 ) ) ( not ( = ?auto_100631 ?auto_100633 ) ) ( not ( = ?auto_100632 ?auto_100633 ) ) ( not ( = ?auto_100628 ?auto_100633 ) ) ( not ( = ?auto_100630 ?auto_100633 ) ) ( ON ?auto_100630 ?auto_100628 ) ( ON-TABLE ?auto_100633 ) ( ON ?auto_100632 ?auto_100630 ) ( ON ?auto_100631 ?auto_100632 ) ( ON ?auto_100629 ?auto_100631 ) ( CLEAR ?auto_100626 ) ( ON ?auto_100627 ?auto_100629 ) ( CLEAR ?auto_100627 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100633 ?auto_100628 ?auto_100630 ?auto_100632 ?auto_100631 ?auto_100629 )
      ( MAKE-2PILE ?auto_100626 ?auto_100627 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100634 - BLOCK
      ?auto_100635 - BLOCK
    )
    :vars
    (
      ?auto_100638 - BLOCK
      ?auto_100637 - BLOCK
      ?auto_100639 - BLOCK
      ?auto_100636 - BLOCK
      ?auto_100641 - BLOCK
      ?auto_100640 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100634 ?auto_100635 ) ) ( not ( = ?auto_100634 ?auto_100638 ) ) ( not ( = ?auto_100635 ?auto_100638 ) ) ( not ( = ?auto_100634 ?auto_100637 ) ) ( not ( = ?auto_100634 ?auto_100639 ) ) ( not ( = ?auto_100635 ?auto_100637 ) ) ( not ( = ?auto_100635 ?auto_100639 ) ) ( not ( = ?auto_100638 ?auto_100637 ) ) ( not ( = ?auto_100638 ?auto_100639 ) ) ( not ( = ?auto_100637 ?auto_100639 ) ) ( not ( = ?auto_100636 ?auto_100641 ) ) ( not ( = ?auto_100636 ?auto_100639 ) ) ( not ( = ?auto_100641 ?auto_100639 ) ) ( not ( = ?auto_100634 ?auto_100641 ) ) ( not ( = ?auto_100634 ?auto_100636 ) ) ( not ( = ?auto_100635 ?auto_100641 ) ) ( not ( = ?auto_100635 ?auto_100636 ) ) ( not ( = ?auto_100638 ?auto_100641 ) ) ( not ( = ?auto_100638 ?auto_100636 ) ) ( not ( = ?auto_100637 ?auto_100641 ) ) ( not ( = ?auto_100637 ?auto_100636 ) ) ( ON ?auto_100636 ?auto_100640 ) ( not ( = ?auto_100634 ?auto_100640 ) ) ( not ( = ?auto_100635 ?auto_100640 ) ) ( not ( = ?auto_100638 ?auto_100640 ) ) ( not ( = ?auto_100637 ?auto_100640 ) ) ( not ( = ?auto_100639 ?auto_100640 ) ) ( not ( = ?auto_100636 ?auto_100640 ) ) ( not ( = ?auto_100641 ?auto_100640 ) ) ( ON ?auto_100641 ?auto_100636 ) ( ON-TABLE ?auto_100640 ) ( ON ?auto_100639 ?auto_100641 ) ( ON ?auto_100637 ?auto_100639 ) ( ON ?auto_100638 ?auto_100637 ) ( ON ?auto_100635 ?auto_100638 ) ( CLEAR ?auto_100635 ) ( HOLDING ?auto_100634 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100634 )
      ( MAKE-2PILE ?auto_100634 ?auto_100635 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100642 - BLOCK
      ?auto_100643 - BLOCK
    )
    :vars
    (
      ?auto_100644 - BLOCK
      ?auto_100647 - BLOCK
      ?auto_100645 - BLOCK
      ?auto_100646 - BLOCK
      ?auto_100649 - BLOCK
      ?auto_100648 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100642 ?auto_100643 ) ) ( not ( = ?auto_100642 ?auto_100644 ) ) ( not ( = ?auto_100643 ?auto_100644 ) ) ( not ( = ?auto_100642 ?auto_100647 ) ) ( not ( = ?auto_100642 ?auto_100645 ) ) ( not ( = ?auto_100643 ?auto_100647 ) ) ( not ( = ?auto_100643 ?auto_100645 ) ) ( not ( = ?auto_100644 ?auto_100647 ) ) ( not ( = ?auto_100644 ?auto_100645 ) ) ( not ( = ?auto_100647 ?auto_100645 ) ) ( not ( = ?auto_100646 ?auto_100649 ) ) ( not ( = ?auto_100646 ?auto_100645 ) ) ( not ( = ?auto_100649 ?auto_100645 ) ) ( not ( = ?auto_100642 ?auto_100649 ) ) ( not ( = ?auto_100642 ?auto_100646 ) ) ( not ( = ?auto_100643 ?auto_100649 ) ) ( not ( = ?auto_100643 ?auto_100646 ) ) ( not ( = ?auto_100644 ?auto_100649 ) ) ( not ( = ?auto_100644 ?auto_100646 ) ) ( not ( = ?auto_100647 ?auto_100649 ) ) ( not ( = ?auto_100647 ?auto_100646 ) ) ( ON ?auto_100646 ?auto_100648 ) ( not ( = ?auto_100642 ?auto_100648 ) ) ( not ( = ?auto_100643 ?auto_100648 ) ) ( not ( = ?auto_100644 ?auto_100648 ) ) ( not ( = ?auto_100647 ?auto_100648 ) ) ( not ( = ?auto_100645 ?auto_100648 ) ) ( not ( = ?auto_100646 ?auto_100648 ) ) ( not ( = ?auto_100649 ?auto_100648 ) ) ( ON ?auto_100649 ?auto_100646 ) ( ON-TABLE ?auto_100648 ) ( ON ?auto_100645 ?auto_100649 ) ( ON ?auto_100647 ?auto_100645 ) ( ON ?auto_100644 ?auto_100647 ) ( ON ?auto_100643 ?auto_100644 ) ( ON ?auto_100642 ?auto_100643 ) ( CLEAR ?auto_100642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_100648 ?auto_100646 ?auto_100649 ?auto_100645 ?auto_100647 ?auto_100644 ?auto_100643 )
      ( MAKE-2PILE ?auto_100642 ?auto_100643 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100655 - BLOCK
      ?auto_100656 - BLOCK
      ?auto_100657 - BLOCK
      ?auto_100658 - BLOCK
      ?auto_100659 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_100659 ) ( CLEAR ?auto_100658 ) ( ON-TABLE ?auto_100655 ) ( ON ?auto_100656 ?auto_100655 ) ( ON ?auto_100657 ?auto_100656 ) ( ON ?auto_100658 ?auto_100657 ) ( not ( = ?auto_100655 ?auto_100656 ) ) ( not ( = ?auto_100655 ?auto_100657 ) ) ( not ( = ?auto_100655 ?auto_100658 ) ) ( not ( = ?auto_100655 ?auto_100659 ) ) ( not ( = ?auto_100656 ?auto_100657 ) ) ( not ( = ?auto_100656 ?auto_100658 ) ) ( not ( = ?auto_100656 ?auto_100659 ) ) ( not ( = ?auto_100657 ?auto_100658 ) ) ( not ( = ?auto_100657 ?auto_100659 ) ) ( not ( = ?auto_100658 ?auto_100659 ) ) )
    :subtasks
    ( ( !STACK ?auto_100659 ?auto_100658 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100660 - BLOCK
      ?auto_100661 - BLOCK
      ?auto_100662 - BLOCK
      ?auto_100663 - BLOCK
      ?auto_100664 - BLOCK
    )
    :vars
    (
      ?auto_100665 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_100663 ) ( ON-TABLE ?auto_100660 ) ( ON ?auto_100661 ?auto_100660 ) ( ON ?auto_100662 ?auto_100661 ) ( ON ?auto_100663 ?auto_100662 ) ( not ( = ?auto_100660 ?auto_100661 ) ) ( not ( = ?auto_100660 ?auto_100662 ) ) ( not ( = ?auto_100660 ?auto_100663 ) ) ( not ( = ?auto_100660 ?auto_100664 ) ) ( not ( = ?auto_100661 ?auto_100662 ) ) ( not ( = ?auto_100661 ?auto_100663 ) ) ( not ( = ?auto_100661 ?auto_100664 ) ) ( not ( = ?auto_100662 ?auto_100663 ) ) ( not ( = ?auto_100662 ?auto_100664 ) ) ( not ( = ?auto_100663 ?auto_100664 ) ) ( ON ?auto_100664 ?auto_100665 ) ( CLEAR ?auto_100664 ) ( HAND-EMPTY ) ( not ( = ?auto_100660 ?auto_100665 ) ) ( not ( = ?auto_100661 ?auto_100665 ) ) ( not ( = ?auto_100662 ?auto_100665 ) ) ( not ( = ?auto_100663 ?auto_100665 ) ) ( not ( = ?auto_100664 ?auto_100665 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100664 ?auto_100665 )
      ( MAKE-5PILE ?auto_100660 ?auto_100661 ?auto_100662 ?auto_100663 ?auto_100664 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100666 - BLOCK
      ?auto_100667 - BLOCK
      ?auto_100668 - BLOCK
      ?auto_100669 - BLOCK
      ?auto_100670 - BLOCK
    )
    :vars
    (
      ?auto_100671 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_100666 ) ( ON ?auto_100667 ?auto_100666 ) ( ON ?auto_100668 ?auto_100667 ) ( not ( = ?auto_100666 ?auto_100667 ) ) ( not ( = ?auto_100666 ?auto_100668 ) ) ( not ( = ?auto_100666 ?auto_100669 ) ) ( not ( = ?auto_100666 ?auto_100670 ) ) ( not ( = ?auto_100667 ?auto_100668 ) ) ( not ( = ?auto_100667 ?auto_100669 ) ) ( not ( = ?auto_100667 ?auto_100670 ) ) ( not ( = ?auto_100668 ?auto_100669 ) ) ( not ( = ?auto_100668 ?auto_100670 ) ) ( not ( = ?auto_100669 ?auto_100670 ) ) ( ON ?auto_100670 ?auto_100671 ) ( CLEAR ?auto_100670 ) ( not ( = ?auto_100666 ?auto_100671 ) ) ( not ( = ?auto_100667 ?auto_100671 ) ) ( not ( = ?auto_100668 ?auto_100671 ) ) ( not ( = ?auto_100669 ?auto_100671 ) ) ( not ( = ?auto_100670 ?auto_100671 ) ) ( HOLDING ?auto_100669 ) ( CLEAR ?auto_100668 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100666 ?auto_100667 ?auto_100668 ?auto_100669 )
      ( MAKE-5PILE ?auto_100666 ?auto_100667 ?auto_100668 ?auto_100669 ?auto_100670 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100672 - BLOCK
      ?auto_100673 - BLOCK
      ?auto_100674 - BLOCK
      ?auto_100675 - BLOCK
      ?auto_100676 - BLOCK
    )
    :vars
    (
      ?auto_100677 - BLOCK
      ?auto_100678 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_100672 ) ( ON ?auto_100673 ?auto_100672 ) ( ON ?auto_100674 ?auto_100673 ) ( not ( = ?auto_100672 ?auto_100673 ) ) ( not ( = ?auto_100672 ?auto_100674 ) ) ( not ( = ?auto_100672 ?auto_100675 ) ) ( not ( = ?auto_100672 ?auto_100676 ) ) ( not ( = ?auto_100673 ?auto_100674 ) ) ( not ( = ?auto_100673 ?auto_100675 ) ) ( not ( = ?auto_100673 ?auto_100676 ) ) ( not ( = ?auto_100674 ?auto_100675 ) ) ( not ( = ?auto_100674 ?auto_100676 ) ) ( not ( = ?auto_100675 ?auto_100676 ) ) ( ON ?auto_100676 ?auto_100677 ) ( not ( = ?auto_100672 ?auto_100677 ) ) ( not ( = ?auto_100673 ?auto_100677 ) ) ( not ( = ?auto_100674 ?auto_100677 ) ) ( not ( = ?auto_100675 ?auto_100677 ) ) ( not ( = ?auto_100676 ?auto_100677 ) ) ( CLEAR ?auto_100674 ) ( ON ?auto_100675 ?auto_100676 ) ( CLEAR ?auto_100675 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100678 ) ( ON ?auto_100677 ?auto_100678 ) ( not ( = ?auto_100678 ?auto_100677 ) ) ( not ( = ?auto_100678 ?auto_100676 ) ) ( not ( = ?auto_100678 ?auto_100675 ) ) ( not ( = ?auto_100672 ?auto_100678 ) ) ( not ( = ?auto_100673 ?auto_100678 ) ) ( not ( = ?auto_100674 ?auto_100678 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100678 ?auto_100677 ?auto_100676 )
      ( MAKE-5PILE ?auto_100672 ?auto_100673 ?auto_100674 ?auto_100675 ?auto_100676 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100679 - BLOCK
      ?auto_100680 - BLOCK
      ?auto_100681 - BLOCK
      ?auto_100682 - BLOCK
      ?auto_100683 - BLOCK
    )
    :vars
    (
      ?auto_100684 - BLOCK
      ?auto_100685 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_100679 ) ( ON ?auto_100680 ?auto_100679 ) ( not ( = ?auto_100679 ?auto_100680 ) ) ( not ( = ?auto_100679 ?auto_100681 ) ) ( not ( = ?auto_100679 ?auto_100682 ) ) ( not ( = ?auto_100679 ?auto_100683 ) ) ( not ( = ?auto_100680 ?auto_100681 ) ) ( not ( = ?auto_100680 ?auto_100682 ) ) ( not ( = ?auto_100680 ?auto_100683 ) ) ( not ( = ?auto_100681 ?auto_100682 ) ) ( not ( = ?auto_100681 ?auto_100683 ) ) ( not ( = ?auto_100682 ?auto_100683 ) ) ( ON ?auto_100683 ?auto_100684 ) ( not ( = ?auto_100679 ?auto_100684 ) ) ( not ( = ?auto_100680 ?auto_100684 ) ) ( not ( = ?auto_100681 ?auto_100684 ) ) ( not ( = ?auto_100682 ?auto_100684 ) ) ( not ( = ?auto_100683 ?auto_100684 ) ) ( ON ?auto_100682 ?auto_100683 ) ( CLEAR ?auto_100682 ) ( ON-TABLE ?auto_100685 ) ( ON ?auto_100684 ?auto_100685 ) ( not ( = ?auto_100685 ?auto_100684 ) ) ( not ( = ?auto_100685 ?auto_100683 ) ) ( not ( = ?auto_100685 ?auto_100682 ) ) ( not ( = ?auto_100679 ?auto_100685 ) ) ( not ( = ?auto_100680 ?auto_100685 ) ) ( not ( = ?auto_100681 ?auto_100685 ) ) ( HOLDING ?auto_100681 ) ( CLEAR ?auto_100680 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100679 ?auto_100680 ?auto_100681 )
      ( MAKE-5PILE ?auto_100679 ?auto_100680 ?auto_100681 ?auto_100682 ?auto_100683 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100686 - BLOCK
      ?auto_100687 - BLOCK
      ?auto_100688 - BLOCK
      ?auto_100689 - BLOCK
      ?auto_100690 - BLOCK
    )
    :vars
    (
      ?auto_100691 - BLOCK
      ?auto_100692 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_100686 ) ( ON ?auto_100687 ?auto_100686 ) ( not ( = ?auto_100686 ?auto_100687 ) ) ( not ( = ?auto_100686 ?auto_100688 ) ) ( not ( = ?auto_100686 ?auto_100689 ) ) ( not ( = ?auto_100686 ?auto_100690 ) ) ( not ( = ?auto_100687 ?auto_100688 ) ) ( not ( = ?auto_100687 ?auto_100689 ) ) ( not ( = ?auto_100687 ?auto_100690 ) ) ( not ( = ?auto_100688 ?auto_100689 ) ) ( not ( = ?auto_100688 ?auto_100690 ) ) ( not ( = ?auto_100689 ?auto_100690 ) ) ( ON ?auto_100690 ?auto_100691 ) ( not ( = ?auto_100686 ?auto_100691 ) ) ( not ( = ?auto_100687 ?auto_100691 ) ) ( not ( = ?auto_100688 ?auto_100691 ) ) ( not ( = ?auto_100689 ?auto_100691 ) ) ( not ( = ?auto_100690 ?auto_100691 ) ) ( ON ?auto_100689 ?auto_100690 ) ( ON-TABLE ?auto_100692 ) ( ON ?auto_100691 ?auto_100692 ) ( not ( = ?auto_100692 ?auto_100691 ) ) ( not ( = ?auto_100692 ?auto_100690 ) ) ( not ( = ?auto_100692 ?auto_100689 ) ) ( not ( = ?auto_100686 ?auto_100692 ) ) ( not ( = ?auto_100687 ?auto_100692 ) ) ( not ( = ?auto_100688 ?auto_100692 ) ) ( CLEAR ?auto_100687 ) ( ON ?auto_100688 ?auto_100689 ) ( CLEAR ?auto_100688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100692 ?auto_100691 ?auto_100690 ?auto_100689 )
      ( MAKE-5PILE ?auto_100686 ?auto_100687 ?auto_100688 ?auto_100689 ?auto_100690 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100693 - BLOCK
      ?auto_100694 - BLOCK
      ?auto_100695 - BLOCK
      ?auto_100696 - BLOCK
      ?auto_100697 - BLOCK
    )
    :vars
    (
      ?auto_100699 - BLOCK
      ?auto_100698 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_100693 ) ( not ( = ?auto_100693 ?auto_100694 ) ) ( not ( = ?auto_100693 ?auto_100695 ) ) ( not ( = ?auto_100693 ?auto_100696 ) ) ( not ( = ?auto_100693 ?auto_100697 ) ) ( not ( = ?auto_100694 ?auto_100695 ) ) ( not ( = ?auto_100694 ?auto_100696 ) ) ( not ( = ?auto_100694 ?auto_100697 ) ) ( not ( = ?auto_100695 ?auto_100696 ) ) ( not ( = ?auto_100695 ?auto_100697 ) ) ( not ( = ?auto_100696 ?auto_100697 ) ) ( ON ?auto_100697 ?auto_100699 ) ( not ( = ?auto_100693 ?auto_100699 ) ) ( not ( = ?auto_100694 ?auto_100699 ) ) ( not ( = ?auto_100695 ?auto_100699 ) ) ( not ( = ?auto_100696 ?auto_100699 ) ) ( not ( = ?auto_100697 ?auto_100699 ) ) ( ON ?auto_100696 ?auto_100697 ) ( ON-TABLE ?auto_100698 ) ( ON ?auto_100699 ?auto_100698 ) ( not ( = ?auto_100698 ?auto_100699 ) ) ( not ( = ?auto_100698 ?auto_100697 ) ) ( not ( = ?auto_100698 ?auto_100696 ) ) ( not ( = ?auto_100693 ?auto_100698 ) ) ( not ( = ?auto_100694 ?auto_100698 ) ) ( not ( = ?auto_100695 ?auto_100698 ) ) ( ON ?auto_100695 ?auto_100696 ) ( CLEAR ?auto_100695 ) ( HOLDING ?auto_100694 ) ( CLEAR ?auto_100693 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100693 ?auto_100694 )
      ( MAKE-5PILE ?auto_100693 ?auto_100694 ?auto_100695 ?auto_100696 ?auto_100697 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100700 - BLOCK
      ?auto_100701 - BLOCK
      ?auto_100702 - BLOCK
      ?auto_100703 - BLOCK
      ?auto_100704 - BLOCK
    )
    :vars
    (
      ?auto_100705 - BLOCK
      ?auto_100706 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_100700 ) ( not ( = ?auto_100700 ?auto_100701 ) ) ( not ( = ?auto_100700 ?auto_100702 ) ) ( not ( = ?auto_100700 ?auto_100703 ) ) ( not ( = ?auto_100700 ?auto_100704 ) ) ( not ( = ?auto_100701 ?auto_100702 ) ) ( not ( = ?auto_100701 ?auto_100703 ) ) ( not ( = ?auto_100701 ?auto_100704 ) ) ( not ( = ?auto_100702 ?auto_100703 ) ) ( not ( = ?auto_100702 ?auto_100704 ) ) ( not ( = ?auto_100703 ?auto_100704 ) ) ( ON ?auto_100704 ?auto_100705 ) ( not ( = ?auto_100700 ?auto_100705 ) ) ( not ( = ?auto_100701 ?auto_100705 ) ) ( not ( = ?auto_100702 ?auto_100705 ) ) ( not ( = ?auto_100703 ?auto_100705 ) ) ( not ( = ?auto_100704 ?auto_100705 ) ) ( ON ?auto_100703 ?auto_100704 ) ( ON-TABLE ?auto_100706 ) ( ON ?auto_100705 ?auto_100706 ) ( not ( = ?auto_100706 ?auto_100705 ) ) ( not ( = ?auto_100706 ?auto_100704 ) ) ( not ( = ?auto_100706 ?auto_100703 ) ) ( not ( = ?auto_100700 ?auto_100706 ) ) ( not ( = ?auto_100701 ?auto_100706 ) ) ( not ( = ?auto_100702 ?auto_100706 ) ) ( ON ?auto_100702 ?auto_100703 ) ( CLEAR ?auto_100700 ) ( ON ?auto_100701 ?auto_100702 ) ( CLEAR ?auto_100701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100706 ?auto_100705 ?auto_100704 ?auto_100703 ?auto_100702 )
      ( MAKE-5PILE ?auto_100700 ?auto_100701 ?auto_100702 ?auto_100703 ?auto_100704 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100707 - BLOCK
      ?auto_100708 - BLOCK
      ?auto_100709 - BLOCK
      ?auto_100710 - BLOCK
      ?auto_100711 - BLOCK
    )
    :vars
    (
      ?auto_100712 - BLOCK
      ?auto_100713 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100707 ?auto_100708 ) ) ( not ( = ?auto_100707 ?auto_100709 ) ) ( not ( = ?auto_100707 ?auto_100710 ) ) ( not ( = ?auto_100707 ?auto_100711 ) ) ( not ( = ?auto_100708 ?auto_100709 ) ) ( not ( = ?auto_100708 ?auto_100710 ) ) ( not ( = ?auto_100708 ?auto_100711 ) ) ( not ( = ?auto_100709 ?auto_100710 ) ) ( not ( = ?auto_100709 ?auto_100711 ) ) ( not ( = ?auto_100710 ?auto_100711 ) ) ( ON ?auto_100711 ?auto_100712 ) ( not ( = ?auto_100707 ?auto_100712 ) ) ( not ( = ?auto_100708 ?auto_100712 ) ) ( not ( = ?auto_100709 ?auto_100712 ) ) ( not ( = ?auto_100710 ?auto_100712 ) ) ( not ( = ?auto_100711 ?auto_100712 ) ) ( ON ?auto_100710 ?auto_100711 ) ( ON-TABLE ?auto_100713 ) ( ON ?auto_100712 ?auto_100713 ) ( not ( = ?auto_100713 ?auto_100712 ) ) ( not ( = ?auto_100713 ?auto_100711 ) ) ( not ( = ?auto_100713 ?auto_100710 ) ) ( not ( = ?auto_100707 ?auto_100713 ) ) ( not ( = ?auto_100708 ?auto_100713 ) ) ( not ( = ?auto_100709 ?auto_100713 ) ) ( ON ?auto_100709 ?auto_100710 ) ( ON ?auto_100708 ?auto_100709 ) ( CLEAR ?auto_100708 ) ( HOLDING ?auto_100707 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100707 )
      ( MAKE-5PILE ?auto_100707 ?auto_100708 ?auto_100709 ?auto_100710 ?auto_100711 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100714 - BLOCK
      ?auto_100715 - BLOCK
      ?auto_100716 - BLOCK
      ?auto_100717 - BLOCK
      ?auto_100718 - BLOCK
    )
    :vars
    (
      ?auto_100719 - BLOCK
      ?auto_100720 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100714 ?auto_100715 ) ) ( not ( = ?auto_100714 ?auto_100716 ) ) ( not ( = ?auto_100714 ?auto_100717 ) ) ( not ( = ?auto_100714 ?auto_100718 ) ) ( not ( = ?auto_100715 ?auto_100716 ) ) ( not ( = ?auto_100715 ?auto_100717 ) ) ( not ( = ?auto_100715 ?auto_100718 ) ) ( not ( = ?auto_100716 ?auto_100717 ) ) ( not ( = ?auto_100716 ?auto_100718 ) ) ( not ( = ?auto_100717 ?auto_100718 ) ) ( ON ?auto_100718 ?auto_100719 ) ( not ( = ?auto_100714 ?auto_100719 ) ) ( not ( = ?auto_100715 ?auto_100719 ) ) ( not ( = ?auto_100716 ?auto_100719 ) ) ( not ( = ?auto_100717 ?auto_100719 ) ) ( not ( = ?auto_100718 ?auto_100719 ) ) ( ON ?auto_100717 ?auto_100718 ) ( ON-TABLE ?auto_100720 ) ( ON ?auto_100719 ?auto_100720 ) ( not ( = ?auto_100720 ?auto_100719 ) ) ( not ( = ?auto_100720 ?auto_100718 ) ) ( not ( = ?auto_100720 ?auto_100717 ) ) ( not ( = ?auto_100714 ?auto_100720 ) ) ( not ( = ?auto_100715 ?auto_100720 ) ) ( not ( = ?auto_100716 ?auto_100720 ) ) ( ON ?auto_100716 ?auto_100717 ) ( ON ?auto_100715 ?auto_100716 ) ( ON ?auto_100714 ?auto_100715 ) ( CLEAR ?auto_100714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100720 ?auto_100719 ?auto_100718 ?auto_100717 ?auto_100716 ?auto_100715 )
      ( MAKE-5PILE ?auto_100714 ?auto_100715 ?auto_100716 ?auto_100717 ?auto_100718 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100721 - BLOCK
      ?auto_100722 - BLOCK
      ?auto_100723 - BLOCK
      ?auto_100724 - BLOCK
      ?auto_100725 - BLOCK
    )
    :vars
    (
      ?auto_100727 - BLOCK
      ?auto_100726 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100721 ?auto_100722 ) ) ( not ( = ?auto_100721 ?auto_100723 ) ) ( not ( = ?auto_100721 ?auto_100724 ) ) ( not ( = ?auto_100721 ?auto_100725 ) ) ( not ( = ?auto_100722 ?auto_100723 ) ) ( not ( = ?auto_100722 ?auto_100724 ) ) ( not ( = ?auto_100722 ?auto_100725 ) ) ( not ( = ?auto_100723 ?auto_100724 ) ) ( not ( = ?auto_100723 ?auto_100725 ) ) ( not ( = ?auto_100724 ?auto_100725 ) ) ( ON ?auto_100725 ?auto_100727 ) ( not ( = ?auto_100721 ?auto_100727 ) ) ( not ( = ?auto_100722 ?auto_100727 ) ) ( not ( = ?auto_100723 ?auto_100727 ) ) ( not ( = ?auto_100724 ?auto_100727 ) ) ( not ( = ?auto_100725 ?auto_100727 ) ) ( ON ?auto_100724 ?auto_100725 ) ( ON-TABLE ?auto_100726 ) ( ON ?auto_100727 ?auto_100726 ) ( not ( = ?auto_100726 ?auto_100727 ) ) ( not ( = ?auto_100726 ?auto_100725 ) ) ( not ( = ?auto_100726 ?auto_100724 ) ) ( not ( = ?auto_100721 ?auto_100726 ) ) ( not ( = ?auto_100722 ?auto_100726 ) ) ( not ( = ?auto_100723 ?auto_100726 ) ) ( ON ?auto_100723 ?auto_100724 ) ( ON ?auto_100722 ?auto_100723 ) ( HOLDING ?auto_100721 ) ( CLEAR ?auto_100722 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_100726 ?auto_100727 ?auto_100725 ?auto_100724 ?auto_100723 ?auto_100722 ?auto_100721 )
      ( MAKE-5PILE ?auto_100721 ?auto_100722 ?auto_100723 ?auto_100724 ?auto_100725 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100728 - BLOCK
      ?auto_100729 - BLOCK
      ?auto_100730 - BLOCK
      ?auto_100731 - BLOCK
      ?auto_100732 - BLOCK
    )
    :vars
    (
      ?auto_100733 - BLOCK
      ?auto_100734 - BLOCK
      ?auto_100735 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100728 ?auto_100729 ) ) ( not ( = ?auto_100728 ?auto_100730 ) ) ( not ( = ?auto_100728 ?auto_100731 ) ) ( not ( = ?auto_100728 ?auto_100732 ) ) ( not ( = ?auto_100729 ?auto_100730 ) ) ( not ( = ?auto_100729 ?auto_100731 ) ) ( not ( = ?auto_100729 ?auto_100732 ) ) ( not ( = ?auto_100730 ?auto_100731 ) ) ( not ( = ?auto_100730 ?auto_100732 ) ) ( not ( = ?auto_100731 ?auto_100732 ) ) ( ON ?auto_100732 ?auto_100733 ) ( not ( = ?auto_100728 ?auto_100733 ) ) ( not ( = ?auto_100729 ?auto_100733 ) ) ( not ( = ?auto_100730 ?auto_100733 ) ) ( not ( = ?auto_100731 ?auto_100733 ) ) ( not ( = ?auto_100732 ?auto_100733 ) ) ( ON ?auto_100731 ?auto_100732 ) ( ON-TABLE ?auto_100734 ) ( ON ?auto_100733 ?auto_100734 ) ( not ( = ?auto_100734 ?auto_100733 ) ) ( not ( = ?auto_100734 ?auto_100732 ) ) ( not ( = ?auto_100734 ?auto_100731 ) ) ( not ( = ?auto_100728 ?auto_100734 ) ) ( not ( = ?auto_100729 ?auto_100734 ) ) ( not ( = ?auto_100730 ?auto_100734 ) ) ( ON ?auto_100730 ?auto_100731 ) ( ON ?auto_100729 ?auto_100730 ) ( CLEAR ?auto_100729 ) ( ON ?auto_100728 ?auto_100735 ) ( CLEAR ?auto_100728 ) ( HAND-EMPTY ) ( not ( = ?auto_100728 ?auto_100735 ) ) ( not ( = ?auto_100729 ?auto_100735 ) ) ( not ( = ?auto_100730 ?auto_100735 ) ) ( not ( = ?auto_100731 ?auto_100735 ) ) ( not ( = ?auto_100732 ?auto_100735 ) ) ( not ( = ?auto_100733 ?auto_100735 ) ) ( not ( = ?auto_100734 ?auto_100735 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100728 ?auto_100735 )
      ( MAKE-5PILE ?auto_100728 ?auto_100729 ?auto_100730 ?auto_100731 ?auto_100732 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100736 - BLOCK
      ?auto_100737 - BLOCK
      ?auto_100738 - BLOCK
      ?auto_100739 - BLOCK
      ?auto_100740 - BLOCK
    )
    :vars
    (
      ?auto_100742 - BLOCK
      ?auto_100743 - BLOCK
      ?auto_100741 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100736 ?auto_100737 ) ) ( not ( = ?auto_100736 ?auto_100738 ) ) ( not ( = ?auto_100736 ?auto_100739 ) ) ( not ( = ?auto_100736 ?auto_100740 ) ) ( not ( = ?auto_100737 ?auto_100738 ) ) ( not ( = ?auto_100737 ?auto_100739 ) ) ( not ( = ?auto_100737 ?auto_100740 ) ) ( not ( = ?auto_100738 ?auto_100739 ) ) ( not ( = ?auto_100738 ?auto_100740 ) ) ( not ( = ?auto_100739 ?auto_100740 ) ) ( ON ?auto_100740 ?auto_100742 ) ( not ( = ?auto_100736 ?auto_100742 ) ) ( not ( = ?auto_100737 ?auto_100742 ) ) ( not ( = ?auto_100738 ?auto_100742 ) ) ( not ( = ?auto_100739 ?auto_100742 ) ) ( not ( = ?auto_100740 ?auto_100742 ) ) ( ON ?auto_100739 ?auto_100740 ) ( ON-TABLE ?auto_100743 ) ( ON ?auto_100742 ?auto_100743 ) ( not ( = ?auto_100743 ?auto_100742 ) ) ( not ( = ?auto_100743 ?auto_100740 ) ) ( not ( = ?auto_100743 ?auto_100739 ) ) ( not ( = ?auto_100736 ?auto_100743 ) ) ( not ( = ?auto_100737 ?auto_100743 ) ) ( not ( = ?auto_100738 ?auto_100743 ) ) ( ON ?auto_100738 ?auto_100739 ) ( ON ?auto_100736 ?auto_100741 ) ( CLEAR ?auto_100736 ) ( not ( = ?auto_100736 ?auto_100741 ) ) ( not ( = ?auto_100737 ?auto_100741 ) ) ( not ( = ?auto_100738 ?auto_100741 ) ) ( not ( = ?auto_100739 ?auto_100741 ) ) ( not ( = ?auto_100740 ?auto_100741 ) ) ( not ( = ?auto_100742 ?auto_100741 ) ) ( not ( = ?auto_100743 ?auto_100741 ) ) ( HOLDING ?auto_100737 ) ( CLEAR ?auto_100738 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100743 ?auto_100742 ?auto_100740 ?auto_100739 ?auto_100738 ?auto_100737 )
      ( MAKE-5PILE ?auto_100736 ?auto_100737 ?auto_100738 ?auto_100739 ?auto_100740 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100744 - BLOCK
      ?auto_100745 - BLOCK
      ?auto_100746 - BLOCK
      ?auto_100747 - BLOCK
      ?auto_100748 - BLOCK
    )
    :vars
    (
      ?auto_100749 - BLOCK
      ?auto_100750 - BLOCK
      ?auto_100751 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100744 ?auto_100745 ) ) ( not ( = ?auto_100744 ?auto_100746 ) ) ( not ( = ?auto_100744 ?auto_100747 ) ) ( not ( = ?auto_100744 ?auto_100748 ) ) ( not ( = ?auto_100745 ?auto_100746 ) ) ( not ( = ?auto_100745 ?auto_100747 ) ) ( not ( = ?auto_100745 ?auto_100748 ) ) ( not ( = ?auto_100746 ?auto_100747 ) ) ( not ( = ?auto_100746 ?auto_100748 ) ) ( not ( = ?auto_100747 ?auto_100748 ) ) ( ON ?auto_100748 ?auto_100749 ) ( not ( = ?auto_100744 ?auto_100749 ) ) ( not ( = ?auto_100745 ?auto_100749 ) ) ( not ( = ?auto_100746 ?auto_100749 ) ) ( not ( = ?auto_100747 ?auto_100749 ) ) ( not ( = ?auto_100748 ?auto_100749 ) ) ( ON ?auto_100747 ?auto_100748 ) ( ON-TABLE ?auto_100750 ) ( ON ?auto_100749 ?auto_100750 ) ( not ( = ?auto_100750 ?auto_100749 ) ) ( not ( = ?auto_100750 ?auto_100748 ) ) ( not ( = ?auto_100750 ?auto_100747 ) ) ( not ( = ?auto_100744 ?auto_100750 ) ) ( not ( = ?auto_100745 ?auto_100750 ) ) ( not ( = ?auto_100746 ?auto_100750 ) ) ( ON ?auto_100746 ?auto_100747 ) ( ON ?auto_100744 ?auto_100751 ) ( not ( = ?auto_100744 ?auto_100751 ) ) ( not ( = ?auto_100745 ?auto_100751 ) ) ( not ( = ?auto_100746 ?auto_100751 ) ) ( not ( = ?auto_100747 ?auto_100751 ) ) ( not ( = ?auto_100748 ?auto_100751 ) ) ( not ( = ?auto_100749 ?auto_100751 ) ) ( not ( = ?auto_100750 ?auto_100751 ) ) ( CLEAR ?auto_100746 ) ( ON ?auto_100745 ?auto_100744 ) ( CLEAR ?auto_100745 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100751 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100751 ?auto_100744 )
      ( MAKE-5PILE ?auto_100744 ?auto_100745 ?auto_100746 ?auto_100747 ?auto_100748 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100752 - BLOCK
      ?auto_100753 - BLOCK
      ?auto_100754 - BLOCK
      ?auto_100755 - BLOCK
      ?auto_100756 - BLOCK
    )
    :vars
    (
      ?auto_100758 - BLOCK
      ?auto_100757 - BLOCK
      ?auto_100759 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100752 ?auto_100753 ) ) ( not ( = ?auto_100752 ?auto_100754 ) ) ( not ( = ?auto_100752 ?auto_100755 ) ) ( not ( = ?auto_100752 ?auto_100756 ) ) ( not ( = ?auto_100753 ?auto_100754 ) ) ( not ( = ?auto_100753 ?auto_100755 ) ) ( not ( = ?auto_100753 ?auto_100756 ) ) ( not ( = ?auto_100754 ?auto_100755 ) ) ( not ( = ?auto_100754 ?auto_100756 ) ) ( not ( = ?auto_100755 ?auto_100756 ) ) ( ON ?auto_100756 ?auto_100758 ) ( not ( = ?auto_100752 ?auto_100758 ) ) ( not ( = ?auto_100753 ?auto_100758 ) ) ( not ( = ?auto_100754 ?auto_100758 ) ) ( not ( = ?auto_100755 ?auto_100758 ) ) ( not ( = ?auto_100756 ?auto_100758 ) ) ( ON ?auto_100755 ?auto_100756 ) ( ON-TABLE ?auto_100757 ) ( ON ?auto_100758 ?auto_100757 ) ( not ( = ?auto_100757 ?auto_100758 ) ) ( not ( = ?auto_100757 ?auto_100756 ) ) ( not ( = ?auto_100757 ?auto_100755 ) ) ( not ( = ?auto_100752 ?auto_100757 ) ) ( not ( = ?auto_100753 ?auto_100757 ) ) ( not ( = ?auto_100754 ?auto_100757 ) ) ( ON ?auto_100752 ?auto_100759 ) ( not ( = ?auto_100752 ?auto_100759 ) ) ( not ( = ?auto_100753 ?auto_100759 ) ) ( not ( = ?auto_100754 ?auto_100759 ) ) ( not ( = ?auto_100755 ?auto_100759 ) ) ( not ( = ?auto_100756 ?auto_100759 ) ) ( not ( = ?auto_100758 ?auto_100759 ) ) ( not ( = ?auto_100757 ?auto_100759 ) ) ( ON ?auto_100753 ?auto_100752 ) ( CLEAR ?auto_100753 ) ( ON-TABLE ?auto_100759 ) ( HOLDING ?auto_100754 ) ( CLEAR ?auto_100755 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100757 ?auto_100758 ?auto_100756 ?auto_100755 ?auto_100754 )
      ( MAKE-5PILE ?auto_100752 ?auto_100753 ?auto_100754 ?auto_100755 ?auto_100756 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100760 - BLOCK
      ?auto_100761 - BLOCK
      ?auto_100762 - BLOCK
      ?auto_100763 - BLOCK
      ?auto_100764 - BLOCK
    )
    :vars
    (
      ?auto_100765 - BLOCK
      ?auto_100766 - BLOCK
      ?auto_100767 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100760 ?auto_100761 ) ) ( not ( = ?auto_100760 ?auto_100762 ) ) ( not ( = ?auto_100760 ?auto_100763 ) ) ( not ( = ?auto_100760 ?auto_100764 ) ) ( not ( = ?auto_100761 ?auto_100762 ) ) ( not ( = ?auto_100761 ?auto_100763 ) ) ( not ( = ?auto_100761 ?auto_100764 ) ) ( not ( = ?auto_100762 ?auto_100763 ) ) ( not ( = ?auto_100762 ?auto_100764 ) ) ( not ( = ?auto_100763 ?auto_100764 ) ) ( ON ?auto_100764 ?auto_100765 ) ( not ( = ?auto_100760 ?auto_100765 ) ) ( not ( = ?auto_100761 ?auto_100765 ) ) ( not ( = ?auto_100762 ?auto_100765 ) ) ( not ( = ?auto_100763 ?auto_100765 ) ) ( not ( = ?auto_100764 ?auto_100765 ) ) ( ON ?auto_100763 ?auto_100764 ) ( ON-TABLE ?auto_100766 ) ( ON ?auto_100765 ?auto_100766 ) ( not ( = ?auto_100766 ?auto_100765 ) ) ( not ( = ?auto_100766 ?auto_100764 ) ) ( not ( = ?auto_100766 ?auto_100763 ) ) ( not ( = ?auto_100760 ?auto_100766 ) ) ( not ( = ?auto_100761 ?auto_100766 ) ) ( not ( = ?auto_100762 ?auto_100766 ) ) ( ON ?auto_100760 ?auto_100767 ) ( not ( = ?auto_100760 ?auto_100767 ) ) ( not ( = ?auto_100761 ?auto_100767 ) ) ( not ( = ?auto_100762 ?auto_100767 ) ) ( not ( = ?auto_100763 ?auto_100767 ) ) ( not ( = ?auto_100764 ?auto_100767 ) ) ( not ( = ?auto_100765 ?auto_100767 ) ) ( not ( = ?auto_100766 ?auto_100767 ) ) ( ON ?auto_100761 ?auto_100760 ) ( ON-TABLE ?auto_100767 ) ( CLEAR ?auto_100763 ) ( ON ?auto_100762 ?auto_100761 ) ( CLEAR ?auto_100762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100767 ?auto_100760 ?auto_100761 )
      ( MAKE-5PILE ?auto_100760 ?auto_100761 ?auto_100762 ?auto_100763 ?auto_100764 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100768 - BLOCK
      ?auto_100769 - BLOCK
      ?auto_100770 - BLOCK
      ?auto_100771 - BLOCK
      ?auto_100772 - BLOCK
    )
    :vars
    (
      ?auto_100773 - BLOCK
      ?auto_100774 - BLOCK
      ?auto_100775 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100768 ?auto_100769 ) ) ( not ( = ?auto_100768 ?auto_100770 ) ) ( not ( = ?auto_100768 ?auto_100771 ) ) ( not ( = ?auto_100768 ?auto_100772 ) ) ( not ( = ?auto_100769 ?auto_100770 ) ) ( not ( = ?auto_100769 ?auto_100771 ) ) ( not ( = ?auto_100769 ?auto_100772 ) ) ( not ( = ?auto_100770 ?auto_100771 ) ) ( not ( = ?auto_100770 ?auto_100772 ) ) ( not ( = ?auto_100771 ?auto_100772 ) ) ( ON ?auto_100772 ?auto_100773 ) ( not ( = ?auto_100768 ?auto_100773 ) ) ( not ( = ?auto_100769 ?auto_100773 ) ) ( not ( = ?auto_100770 ?auto_100773 ) ) ( not ( = ?auto_100771 ?auto_100773 ) ) ( not ( = ?auto_100772 ?auto_100773 ) ) ( ON-TABLE ?auto_100774 ) ( ON ?auto_100773 ?auto_100774 ) ( not ( = ?auto_100774 ?auto_100773 ) ) ( not ( = ?auto_100774 ?auto_100772 ) ) ( not ( = ?auto_100774 ?auto_100771 ) ) ( not ( = ?auto_100768 ?auto_100774 ) ) ( not ( = ?auto_100769 ?auto_100774 ) ) ( not ( = ?auto_100770 ?auto_100774 ) ) ( ON ?auto_100768 ?auto_100775 ) ( not ( = ?auto_100768 ?auto_100775 ) ) ( not ( = ?auto_100769 ?auto_100775 ) ) ( not ( = ?auto_100770 ?auto_100775 ) ) ( not ( = ?auto_100771 ?auto_100775 ) ) ( not ( = ?auto_100772 ?auto_100775 ) ) ( not ( = ?auto_100773 ?auto_100775 ) ) ( not ( = ?auto_100774 ?auto_100775 ) ) ( ON ?auto_100769 ?auto_100768 ) ( ON-TABLE ?auto_100775 ) ( ON ?auto_100770 ?auto_100769 ) ( CLEAR ?auto_100770 ) ( HOLDING ?auto_100771 ) ( CLEAR ?auto_100772 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100774 ?auto_100773 ?auto_100772 ?auto_100771 )
      ( MAKE-5PILE ?auto_100768 ?auto_100769 ?auto_100770 ?auto_100771 ?auto_100772 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100776 - BLOCK
      ?auto_100777 - BLOCK
      ?auto_100778 - BLOCK
      ?auto_100779 - BLOCK
      ?auto_100780 - BLOCK
    )
    :vars
    (
      ?auto_100783 - BLOCK
      ?auto_100782 - BLOCK
      ?auto_100781 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100776 ?auto_100777 ) ) ( not ( = ?auto_100776 ?auto_100778 ) ) ( not ( = ?auto_100776 ?auto_100779 ) ) ( not ( = ?auto_100776 ?auto_100780 ) ) ( not ( = ?auto_100777 ?auto_100778 ) ) ( not ( = ?auto_100777 ?auto_100779 ) ) ( not ( = ?auto_100777 ?auto_100780 ) ) ( not ( = ?auto_100778 ?auto_100779 ) ) ( not ( = ?auto_100778 ?auto_100780 ) ) ( not ( = ?auto_100779 ?auto_100780 ) ) ( ON ?auto_100780 ?auto_100783 ) ( not ( = ?auto_100776 ?auto_100783 ) ) ( not ( = ?auto_100777 ?auto_100783 ) ) ( not ( = ?auto_100778 ?auto_100783 ) ) ( not ( = ?auto_100779 ?auto_100783 ) ) ( not ( = ?auto_100780 ?auto_100783 ) ) ( ON-TABLE ?auto_100782 ) ( ON ?auto_100783 ?auto_100782 ) ( not ( = ?auto_100782 ?auto_100783 ) ) ( not ( = ?auto_100782 ?auto_100780 ) ) ( not ( = ?auto_100782 ?auto_100779 ) ) ( not ( = ?auto_100776 ?auto_100782 ) ) ( not ( = ?auto_100777 ?auto_100782 ) ) ( not ( = ?auto_100778 ?auto_100782 ) ) ( ON ?auto_100776 ?auto_100781 ) ( not ( = ?auto_100776 ?auto_100781 ) ) ( not ( = ?auto_100777 ?auto_100781 ) ) ( not ( = ?auto_100778 ?auto_100781 ) ) ( not ( = ?auto_100779 ?auto_100781 ) ) ( not ( = ?auto_100780 ?auto_100781 ) ) ( not ( = ?auto_100783 ?auto_100781 ) ) ( not ( = ?auto_100782 ?auto_100781 ) ) ( ON ?auto_100777 ?auto_100776 ) ( ON-TABLE ?auto_100781 ) ( ON ?auto_100778 ?auto_100777 ) ( CLEAR ?auto_100780 ) ( ON ?auto_100779 ?auto_100778 ) ( CLEAR ?auto_100779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100781 ?auto_100776 ?auto_100777 ?auto_100778 )
      ( MAKE-5PILE ?auto_100776 ?auto_100777 ?auto_100778 ?auto_100779 ?auto_100780 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100784 - BLOCK
      ?auto_100785 - BLOCK
      ?auto_100786 - BLOCK
      ?auto_100787 - BLOCK
      ?auto_100788 - BLOCK
    )
    :vars
    (
      ?auto_100789 - BLOCK
      ?auto_100791 - BLOCK
      ?auto_100790 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100784 ?auto_100785 ) ) ( not ( = ?auto_100784 ?auto_100786 ) ) ( not ( = ?auto_100784 ?auto_100787 ) ) ( not ( = ?auto_100784 ?auto_100788 ) ) ( not ( = ?auto_100785 ?auto_100786 ) ) ( not ( = ?auto_100785 ?auto_100787 ) ) ( not ( = ?auto_100785 ?auto_100788 ) ) ( not ( = ?auto_100786 ?auto_100787 ) ) ( not ( = ?auto_100786 ?auto_100788 ) ) ( not ( = ?auto_100787 ?auto_100788 ) ) ( not ( = ?auto_100784 ?auto_100789 ) ) ( not ( = ?auto_100785 ?auto_100789 ) ) ( not ( = ?auto_100786 ?auto_100789 ) ) ( not ( = ?auto_100787 ?auto_100789 ) ) ( not ( = ?auto_100788 ?auto_100789 ) ) ( ON-TABLE ?auto_100791 ) ( ON ?auto_100789 ?auto_100791 ) ( not ( = ?auto_100791 ?auto_100789 ) ) ( not ( = ?auto_100791 ?auto_100788 ) ) ( not ( = ?auto_100791 ?auto_100787 ) ) ( not ( = ?auto_100784 ?auto_100791 ) ) ( not ( = ?auto_100785 ?auto_100791 ) ) ( not ( = ?auto_100786 ?auto_100791 ) ) ( ON ?auto_100784 ?auto_100790 ) ( not ( = ?auto_100784 ?auto_100790 ) ) ( not ( = ?auto_100785 ?auto_100790 ) ) ( not ( = ?auto_100786 ?auto_100790 ) ) ( not ( = ?auto_100787 ?auto_100790 ) ) ( not ( = ?auto_100788 ?auto_100790 ) ) ( not ( = ?auto_100789 ?auto_100790 ) ) ( not ( = ?auto_100791 ?auto_100790 ) ) ( ON ?auto_100785 ?auto_100784 ) ( ON-TABLE ?auto_100790 ) ( ON ?auto_100786 ?auto_100785 ) ( ON ?auto_100787 ?auto_100786 ) ( CLEAR ?auto_100787 ) ( HOLDING ?auto_100788 ) ( CLEAR ?auto_100789 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100791 ?auto_100789 ?auto_100788 )
      ( MAKE-5PILE ?auto_100784 ?auto_100785 ?auto_100786 ?auto_100787 ?auto_100788 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100792 - BLOCK
      ?auto_100793 - BLOCK
      ?auto_100794 - BLOCK
      ?auto_100795 - BLOCK
      ?auto_100796 - BLOCK
    )
    :vars
    (
      ?auto_100799 - BLOCK
      ?auto_100798 - BLOCK
      ?auto_100797 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100792 ?auto_100793 ) ) ( not ( = ?auto_100792 ?auto_100794 ) ) ( not ( = ?auto_100792 ?auto_100795 ) ) ( not ( = ?auto_100792 ?auto_100796 ) ) ( not ( = ?auto_100793 ?auto_100794 ) ) ( not ( = ?auto_100793 ?auto_100795 ) ) ( not ( = ?auto_100793 ?auto_100796 ) ) ( not ( = ?auto_100794 ?auto_100795 ) ) ( not ( = ?auto_100794 ?auto_100796 ) ) ( not ( = ?auto_100795 ?auto_100796 ) ) ( not ( = ?auto_100792 ?auto_100799 ) ) ( not ( = ?auto_100793 ?auto_100799 ) ) ( not ( = ?auto_100794 ?auto_100799 ) ) ( not ( = ?auto_100795 ?auto_100799 ) ) ( not ( = ?auto_100796 ?auto_100799 ) ) ( ON-TABLE ?auto_100798 ) ( ON ?auto_100799 ?auto_100798 ) ( not ( = ?auto_100798 ?auto_100799 ) ) ( not ( = ?auto_100798 ?auto_100796 ) ) ( not ( = ?auto_100798 ?auto_100795 ) ) ( not ( = ?auto_100792 ?auto_100798 ) ) ( not ( = ?auto_100793 ?auto_100798 ) ) ( not ( = ?auto_100794 ?auto_100798 ) ) ( ON ?auto_100792 ?auto_100797 ) ( not ( = ?auto_100792 ?auto_100797 ) ) ( not ( = ?auto_100793 ?auto_100797 ) ) ( not ( = ?auto_100794 ?auto_100797 ) ) ( not ( = ?auto_100795 ?auto_100797 ) ) ( not ( = ?auto_100796 ?auto_100797 ) ) ( not ( = ?auto_100799 ?auto_100797 ) ) ( not ( = ?auto_100798 ?auto_100797 ) ) ( ON ?auto_100793 ?auto_100792 ) ( ON-TABLE ?auto_100797 ) ( ON ?auto_100794 ?auto_100793 ) ( ON ?auto_100795 ?auto_100794 ) ( CLEAR ?auto_100799 ) ( ON ?auto_100796 ?auto_100795 ) ( CLEAR ?auto_100796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100797 ?auto_100792 ?auto_100793 ?auto_100794 ?auto_100795 )
      ( MAKE-5PILE ?auto_100792 ?auto_100793 ?auto_100794 ?auto_100795 ?auto_100796 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100800 - BLOCK
      ?auto_100801 - BLOCK
      ?auto_100802 - BLOCK
      ?auto_100803 - BLOCK
      ?auto_100804 - BLOCK
    )
    :vars
    (
      ?auto_100807 - BLOCK
      ?auto_100806 - BLOCK
      ?auto_100805 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100800 ?auto_100801 ) ) ( not ( = ?auto_100800 ?auto_100802 ) ) ( not ( = ?auto_100800 ?auto_100803 ) ) ( not ( = ?auto_100800 ?auto_100804 ) ) ( not ( = ?auto_100801 ?auto_100802 ) ) ( not ( = ?auto_100801 ?auto_100803 ) ) ( not ( = ?auto_100801 ?auto_100804 ) ) ( not ( = ?auto_100802 ?auto_100803 ) ) ( not ( = ?auto_100802 ?auto_100804 ) ) ( not ( = ?auto_100803 ?auto_100804 ) ) ( not ( = ?auto_100800 ?auto_100807 ) ) ( not ( = ?auto_100801 ?auto_100807 ) ) ( not ( = ?auto_100802 ?auto_100807 ) ) ( not ( = ?auto_100803 ?auto_100807 ) ) ( not ( = ?auto_100804 ?auto_100807 ) ) ( ON-TABLE ?auto_100806 ) ( not ( = ?auto_100806 ?auto_100807 ) ) ( not ( = ?auto_100806 ?auto_100804 ) ) ( not ( = ?auto_100806 ?auto_100803 ) ) ( not ( = ?auto_100800 ?auto_100806 ) ) ( not ( = ?auto_100801 ?auto_100806 ) ) ( not ( = ?auto_100802 ?auto_100806 ) ) ( ON ?auto_100800 ?auto_100805 ) ( not ( = ?auto_100800 ?auto_100805 ) ) ( not ( = ?auto_100801 ?auto_100805 ) ) ( not ( = ?auto_100802 ?auto_100805 ) ) ( not ( = ?auto_100803 ?auto_100805 ) ) ( not ( = ?auto_100804 ?auto_100805 ) ) ( not ( = ?auto_100807 ?auto_100805 ) ) ( not ( = ?auto_100806 ?auto_100805 ) ) ( ON ?auto_100801 ?auto_100800 ) ( ON-TABLE ?auto_100805 ) ( ON ?auto_100802 ?auto_100801 ) ( ON ?auto_100803 ?auto_100802 ) ( ON ?auto_100804 ?auto_100803 ) ( CLEAR ?auto_100804 ) ( HOLDING ?auto_100807 ) ( CLEAR ?auto_100806 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100806 ?auto_100807 )
      ( MAKE-5PILE ?auto_100800 ?auto_100801 ?auto_100802 ?auto_100803 ?auto_100804 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100808 - BLOCK
      ?auto_100809 - BLOCK
      ?auto_100810 - BLOCK
      ?auto_100811 - BLOCK
      ?auto_100812 - BLOCK
    )
    :vars
    (
      ?auto_100815 - BLOCK
      ?auto_100813 - BLOCK
      ?auto_100814 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100808 ?auto_100809 ) ) ( not ( = ?auto_100808 ?auto_100810 ) ) ( not ( = ?auto_100808 ?auto_100811 ) ) ( not ( = ?auto_100808 ?auto_100812 ) ) ( not ( = ?auto_100809 ?auto_100810 ) ) ( not ( = ?auto_100809 ?auto_100811 ) ) ( not ( = ?auto_100809 ?auto_100812 ) ) ( not ( = ?auto_100810 ?auto_100811 ) ) ( not ( = ?auto_100810 ?auto_100812 ) ) ( not ( = ?auto_100811 ?auto_100812 ) ) ( not ( = ?auto_100808 ?auto_100815 ) ) ( not ( = ?auto_100809 ?auto_100815 ) ) ( not ( = ?auto_100810 ?auto_100815 ) ) ( not ( = ?auto_100811 ?auto_100815 ) ) ( not ( = ?auto_100812 ?auto_100815 ) ) ( ON-TABLE ?auto_100813 ) ( not ( = ?auto_100813 ?auto_100815 ) ) ( not ( = ?auto_100813 ?auto_100812 ) ) ( not ( = ?auto_100813 ?auto_100811 ) ) ( not ( = ?auto_100808 ?auto_100813 ) ) ( not ( = ?auto_100809 ?auto_100813 ) ) ( not ( = ?auto_100810 ?auto_100813 ) ) ( ON ?auto_100808 ?auto_100814 ) ( not ( = ?auto_100808 ?auto_100814 ) ) ( not ( = ?auto_100809 ?auto_100814 ) ) ( not ( = ?auto_100810 ?auto_100814 ) ) ( not ( = ?auto_100811 ?auto_100814 ) ) ( not ( = ?auto_100812 ?auto_100814 ) ) ( not ( = ?auto_100815 ?auto_100814 ) ) ( not ( = ?auto_100813 ?auto_100814 ) ) ( ON ?auto_100809 ?auto_100808 ) ( ON-TABLE ?auto_100814 ) ( ON ?auto_100810 ?auto_100809 ) ( ON ?auto_100811 ?auto_100810 ) ( ON ?auto_100812 ?auto_100811 ) ( CLEAR ?auto_100813 ) ( ON ?auto_100815 ?auto_100812 ) ( CLEAR ?auto_100815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100814 ?auto_100808 ?auto_100809 ?auto_100810 ?auto_100811 ?auto_100812 )
      ( MAKE-5PILE ?auto_100808 ?auto_100809 ?auto_100810 ?auto_100811 ?auto_100812 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100816 - BLOCK
      ?auto_100817 - BLOCK
      ?auto_100818 - BLOCK
      ?auto_100819 - BLOCK
      ?auto_100820 - BLOCK
    )
    :vars
    (
      ?auto_100822 - BLOCK
      ?auto_100821 - BLOCK
      ?auto_100823 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100816 ?auto_100817 ) ) ( not ( = ?auto_100816 ?auto_100818 ) ) ( not ( = ?auto_100816 ?auto_100819 ) ) ( not ( = ?auto_100816 ?auto_100820 ) ) ( not ( = ?auto_100817 ?auto_100818 ) ) ( not ( = ?auto_100817 ?auto_100819 ) ) ( not ( = ?auto_100817 ?auto_100820 ) ) ( not ( = ?auto_100818 ?auto_100819 ) ) ( not ( = ?auto_100818 ?auto_100820 ) ) ( not ( = ?auto_100819 ?auto_100820 ) ) ( not ( = ?auto_100816 ?auto_100822 ) ) ( not ( = ?auto_100817 ?auto_100822 ) ) ( not ( = ?auto_100818 ?auto_100822 ) ) ( not ( = ?auto_100819 ?auto_100822 ) ) ( not ( = ?auto_100820 ?auto_100822 ) ) ( not ( = ?auto_100821 ?auto_100822 ) ) ( not ( = ?auto_100821 ?auto_100820 ) ) ( not ( = ?auto_100821 ?auto_100819 ) ) ( not ( = ?auto_100816 ?auto_100821 ) ) ( not ( = ?auto_100817 ?auto_100821 ) ) ( not ( = ?auto_100818 ?auto_100821 ) ) ( ON ?auto_100816 ?auto_100823 ) ( not ( = ?auto_100816 ?auto_100823 ) ) ( not ( = ?auto_100817 ?auto_100823 ) ) ( not ( = ?auto_100818 ?auto_100823 ) ) ( not ( = ?auto_100819 ?auto_100823 ) ) ( not ( = ?auto_100820 ?auto_100823 ) ) ( not ( = ?auto_100822 ?auto_100823 ) ) ( not ( = ?auto_100821 ?auto_100823 ) ) ( ON ?auto_100817 ?auto_100816 ) ( ON-TABLE ?auto_100823 ) ( ON ?auto_100818 ?auto_100817 ) ( ON ?auto_100819 ?auto_100818 ) ( ON ?auto_100820 ?auto_100819 ) ( ON ?auto_100822 ?auto_100820 ) ( CLEAR ?auto_100822 ) ( HOLDING ?auto_100821 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100821 )
      ( MAKE-5PILE ?auto_100816 ?auto_100817 ?auto_100818 ?auto_100819 ?auto_100820 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100824 - BLOCK
      ?auto_100825 - BLOCK
      ?auto_100826 - BLOCK
      ?auto_100827 - BLOCK
      ?auto_100828 - BLOCK
    )
    :vars
    (
      ?auto_100830 - BLOCK
      ?auto_100831 - BLOCK
      ?auto_100829 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100824 ?auto_100825 ) ) ( not ( = ?auto_100824 ?auto_100826 ) ) ( not ( = ?auto_100824 ?auto_100827 ) ) ( not ( = ?auto_100824 ?auto_100828 ) ) ( not ( = ?auto_100825 ?auto_100826 ) ) ( not ( = ?auto_100825 ?auto_100827 ) ) ( not ( = ?auto_100825 ?auto_100828 ) ) ( not ( = ?auto_100826 ?auto_100827 ) ) ( not ( = ?auto_100826 ?auto_100828 ) ) ( not ( = ?auto_100827 ?auto_100828 ) ) ( not ( = ?auto_100824 ?auto_100830 ) ) ( not ( = ?auto_100825 ?auto_100830 ) ) ( not ( = ?auto_100826 ?auto_100830 ) ) ( not ( = ?auto_100827 ?auto_100830 ) ) ( not ( = ?auto_100828 ?auto_100830 ) ) ( not ( = ?auto_100831 ?auto_100830 ) ) ( not ( = ?auto_100831 ?auto_100828 ) ) ( not ( = ?auto_100831 ?auto_100827 ) ) ( not ( = ?auto_100824 ?auto_100831 ) ) ( not ( = ?auto_100825 ?auto_100831 ) ) ( not ( = ?auto_100826 ?auto_100831 ) ) ( ON ?auto_100824 ?auto_100829 ) ( not ( = ?auto_100824 ?auto_100829 ) ) ( not ( = ?auto_100825 ?auto_100829 ) ) ( not ( = ?auto_100826 ?auto_100829 ) ) ( not ( = ?auto_100827 ?auto_100829 ) ) ( not ( = ?auto_100828 ?auto_100829 ) ) ( not ( = ?auto_100830 ?auto_100829 ) ) ( not ( = ?auto_100831 ?auto_100829 ) ) ( ON ?auto_100825 ?auto_100824 ) ( ON-TABLE ?auto_100829 ) ( ON ?auto_100826 ?auto_100825 ) ( ON ?auto_100827 ?auto_100826 ) ( ON ?auto_100828 ?auto_100827 ) ( ON ?auto_100830 ?auto_100828 ) ( ON ?auto_100831 ?auto_100830 ) ( CLEAR ?auto_100831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_100829 ?auto_100824 ?auto_100825 ?auto_100826 ?auto_100827 ?auto_100828 ?auto_100830 )
      ( MAKE-5PILE ?auto_100824 ?auto_100825 ?auto_100826 ?auto_100827 ?auto_100828 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_100833 - BLOCK
    )
    :vars
    (
      ?auto_100834 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100834 ?auto_100833 ) ( CLEAR ?auto_100834 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100833 ) ( not ( = ?auto_100833 ?auto_100834 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100834 ?auto_100833 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_100835 - BLOCK
    )
    :vars
    (
      ?auto_100836 - BLOCK
      ?auto_100837 - BLOCK
      ?auto_100838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100836 ?auto_100835 ) ( CLEAR ?auto_100836 ) ( ON-TABLE ?auto_100835 ) ( not ( = ?auto_100835 ?auto_100836 ) ) ( HOLDING ?auto_100837 ) ( CLEAR ?auto_100838 ) ( not ( = ?auto_100835 ?auto_100837 ) ) ( not ( = ?auto_100835 ?auto_100838 ) ) ( not ( = ?auto_100836 ?auto_100837 ) ) ( not ( = ?auto_100836 ?auto_100838 ) ) ( not ( = ?auto_100837 ?auto_100838 ) ) )
    :subtasks
    ( ( !STACK ?auto_100837 ?auto_100838 )
      ( MAKE-1PILE ?auto_100835 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_100839 - BLOCK
    )
    :vars
    (
      ?auto_100840 - BLOCK
      ?auto_100841 - BLOCK
      ?auto_100842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100840 ?auto_100839 ) ( ON-TABLE ?auto_100839 ) ( not ( = ?auto_100839 ?auto_100840 ) ) ( CLEAR ?auto_100841 ) ( not ( = ?auto_100839 ?auto_100842 ) ) ( not ( = ?auto_100839 ?auto_100841 ) ) ( not ( = ?auto_100840 ?auto_100842 ) ) ( not ( = ?auto_100840 ?auto_100841 ) ) ( not ( = ?auto_100842 ?auto_100841 ) ) ( ON ?auto_100842 ?auto_100840 ) ( CLEAR ?auto_100842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100839 ?auto_100840 )
      ( MAKE-1PILE ?auto_100839 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_100843 - BLOCK
    )
    :vars
    (
      ?auto_100845 - BLOCK
      ?auto_100846 - BLOCK
      ?auto_100844 - BLOCK
      ?auto_100847 - BLOCK
      ?auto_100848 - BLOCK
      ?auto_100849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100845 ?auto_100843 ) ( ON-TABLE ?auto_100843 ) ( not ( = ?auto_100843 ?auto_100845 ) ) ( not ( = ?auto_100843 ?auto_100846 ) ) ( not ( = ?auto_100843 ?auto_100844 ) ) ( not ( = ?auto_100845 ?auto_100846 ) ) ( not ( = ?auto_100845 ?auto_100844 ) ) ( not ( = ?auto_100846 ?auto_100844 ) ) ( ON ?auto_100846 ?auto_100845 ) ( CLEAR ?auto_100846 ) ( HOLDING ?auto_100844 ) ( CLEAR ?auto_100847 ) ( ON-TABLE ?auto_100848 ) ( ON ?auto_100849 ?auto_100848 ) ( ON ?auto_100847 ?auto_100849 ) ( not ( = ?auto_100848 ?auto_100849 ) ) ( not ( = ?auto_100848 ?auto_100847 ) ) ( not ( = ?auto_100848 ?auto_100844 ) ) ( not ( = ?auto_100849 ?auto_100847 ) ) ( not ( = ?auto_100849 ?auto_100844 ) ) ( not ( = ?auto_100847 ?auto_100844 ) ) ( not ( = ?auto_100843 ?auto_100847 ) ) ( not ( = ?auto_100843 ?auto_100848 ) ) ( not ( = ?auto_100843 ?auto_100849 ) ) ( not ( = ?auto_100845 ?auto_100847 ) ) ( not ( = ?auto_100845 ?auto_100848 ) ) ( not ( = ?auto_100845 ?auto_100849 ) ) ( not ( = ?auto_100846 ?auto_100847 ) ) ( not ( = ?auto_100846 ?auto_100848 ) ) ( not ( = ?auto_100846 ?auto_100849 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100848 ?auto_100849 ?auto_100847 ?auto_100844 )
      ( MAKE-1PILE ?auto_100843 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_100850 - BLOCK
    )
    :vars
    (
      ?auto_100852 - BLOCK
      ?auto_100855 - BLOCK
      ?auto_100853 - BLOCK
      ?auto_100851 - BLOCK
      ?auto_100854 - BLOCK
      ?auto_100856 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100852 ?auto_100850 ) ( ON-TABLE ?auto_100850 ) ( not ( = ?auto_100850 ?auto_100852 ) ) ( not ( = ?auto_100850 ?auto_100855 ) ) ( not ( = ?auto_100850 ?auto_100853 ) ) ( not ( = ?auto_100852 ?auto_100855 ) ) ( not ( = ?auto_100852 ?auto_100853 ) ) ( not ( = ?auto_100855 ?auto_100853 ) ) ( ON ?auto_100855 ?auto_100852 ) ( CLEAR ?auto_100851 ) ( ON-TABLE ?auto_100854 ) ( ON ?auto_100856 ?auto_100854 ) ( ON ?auto_100851 ?auto_100856 ) ( not ( = ?auto_100854 ?auto_100856 ) ) ( not ( = ?auto_100854 ?auto_100851 ) ) ( not ( = ?auto_100854 ?auto_100853 ) ) ( not ( = ?auto_100856 ?auto_100851 ) ) ( not ( = ?auto_100856 ?auto_100853 ) ) ( not ( = ?auto_100851 ?auto_100853 ) ) ( not ( = ?auto_100850 ?auto_100851 ) ) ( not ( = ?auto_100850 ?auto_100854 ) ) ( not ( = ?auto_100850 ?auto_100856 ) ) ( not ( = ?auto_100852 ?auto_100851 ) ) ( not ( = ?auto_100852 ?auto_100854 ) ) ( not ( = ?auto_100852 ?auto_100856 ) ) ( not ( = ?auto_100855 ?auto_100851 ) ) ( not ( = ?auto_100855 ?auto_100854 ) ) ( not ( = ?auto_100855 ?auto_100856 ) ) ( ON ?auto_100853 ?auto_100855 ) ( CLEAR ?auto_100853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100850 ?auto_100852 ?auto_100855 )
      ( MAKE-1PILE ?auto_100850 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_100857 - BLOCK
    )
    :vars
    (
      ?auto_100859 - BLOCK
      ?auto_100861 - BLOCK
      ?auto_100858 - BLOCK
      ?auto_100862 - BLOCK
      ?auto_100860 - BLOCK
      ?auto_100863 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100859 ?auto_100857 ) ( ON-TABLE ?auto_100857 ) ( not ( = ?auto_100857 ?auto_100859 ) ) ( not ( = ?auto_100857 ?auto_100861 ) ) ( not ( = ?auto_100857 ?auto_100858 ) ) ( not ( = ?auto_100859 ?auto_100861 ) ) ( not ( = ?auto_100859 ?auto_100858 ) ) ( not ( = ?auto_100861 ?auto_100858 ) ) ( ON ?auto_100861 ?auto_100859 ) ( ON-TABLE ?auto_100862 ) ( ON ?auto_100860 ?auto_100862 ) ( not ( = ?auto_100862 ?auto_100860 ) ) ( not ( = ?auto_100862 ?auto_100863 ) ) ( not ( = ?auto_100862 ?auto_100858 ) ) ( not ( = ?auto_100860 ?auto_100863 ) ) ( not ( = ?auto_100860 ?auto_100858 ) ) ( not ( = ?auto_100863 ?auto_100858 ) ) ( not ( = ?auto_100857 ?auto_100863 ) ) ( not ( = ?auto_100857 ?auto_100862 ) ) ( not ( = ?auto_100857 ?auto_100860 ) ) ( not ( = ?auto_100859 ?auto_100863 ) ) ( not ( = ?auto_100859 ?auto_100862 ) ) ( not ( = ?auto_100859 ?auto_100860 ) ) ( not ( = ?auto_100861 ?auto_100863 ) ) ( not ( = ?auto_100861 ?auto_100862 ) ) ( not ( = ?auto_100861 ?auto_100860 ) ) ( ON ?auto_100858 ?auto_100861 ) ( CLEAR ?auto_100858 ) ( HOLDING ?auto_100863 ) ( CLEAR ?auto_100860 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100862 ?auto_100860 ?auto_100863 )
      ( MAKE-1PILE ?auto_100857 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_100864 - BLOCK
    )
    :vars
    (
      ?auto_100870 - BLOCK
      ?auto_100865 - BLOCK
      ?auto_100867 - BLOCK
      ?auto_100869 - BLOCK
      ?auto_100866 - BLOCK
      ?auto_100868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100870 ?auto_100864 ) ( ON-TABLE ?auto_100864 ) ( not ( = ?auto_100864 ?auto_100870 ) ) ( not ( = ?auto_100864 ?auto_100865 ) ) ( not ( = ?auto_100864 ?auto_100867 ) ) ( not ( = ?auto_100870 ?auto_100865 ) ) ( not ( = ?auto_100870 ?auto_100867 ) ) ( not ( = ?auto_100865 ?auto_100867 ) ) ( ON ?auto_100865 ?auto_100870 ) ( ON-TABLE ?auto_100869 ) ( ON ?auto_100866 ?auto_100869 ) ( not ( = ?auto_100869 ?auto_100866 ) ) ( not ( = ?auto_100869 ?auto_100868 ) ) ( not ( = ?auto_100869 ?auto_100867 ) ) ( not ( = ?auto_100866 ?auto_100868 ) ) ( not ( = ?auto_100866 ?auto_100867 ) ) ( not ( = ?auto_100868 ?auto_100867 ) ) ( not ( = ?auto_100864 ?auto_100868 ) ) ( not ( = ?auto_100864 ?auto_100869 ) ) ( not ( = ?auto_100864 ?auto_100866 ) ) ( not ( = ?auto_100870 ?auto_100868 ) ) ( not ( = ?auto_100870 ?auto_100869 ) ) ( not ( = ?auto_100870 ?auto_100866 ) ) ( not ( = ?auto_100865 ?auto_100868 ) ) ( not ( = ?auto_100865 ?auto_100869 ) ) ( not ( = ?auto_100865 ?auto_100866 ) ) ( ON ?auto_100867 ?auto_100865 ) ( CLEAR ?auto_100866 ) ( ON ?auto_100868 ?auto_100867 ) ( CLEAR ?auto_100868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100864 ?auto_100870 ?auto_100865 ?auto_100867 )
      ( MAKE-1PILE ?auto_100864 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_100871 - BLOCK
    )
    :vars
    (
      ?auto_100876 - BLOCK
      ?auto_100877 - BLOCK
      ?auto_100874 - BLOCK
      ?auto_100875 - BLOCK
      ?auto_100872 - BLOCK
      ?auto_100873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100876 ?auto_100871 ) ( ON-TABLE ?auto_100871 ) ( not ( = ?auto_100871 ?auto_100876 ) ) ( not ( = ?auto_100871 ?auto_100877 ) ) ( not ( = ?auto_100871 ?auto_100874 ) ) ( not ( = ?auto_100876 ?auto_100877 ) ) ( not ( = ?auto_100876 ?auto_100874 ) ) ( not ( = ?auto_100877 ?auto_100874 ) ) ( ON ?auto_100877 ?auto_100876 ) ( ON-TABLE ?auto_100875 ) ( not ( = ?auto_100875 ?auto_100872 ) ) ( not ( = ?auto_100875 ?auto_100873 ) ) ( not ( = ?auto_100875 ?auto_100874 ) ) ( not ( = ?auto_100872 ?auto_100873 ) ) ( not ( = ?auto_100872 ?auto_100874 ) ) ( not ( = ?auto_100873 ?auto_100874 ) ) ( not ( = ?auto_100871 ?auto_100873 ) ) ( not ( = ?auto_100871 ?auto_100875 ) ) ( not ( = ?auto_100871 ?auto_100872 ) ) ( not ( = ?auto_100876 ?auto_100873 ) ) ( not ( = ?auto_100876 ?auto_100875 ) ) ( not ( = ?auto_100876 ?auto_100872 ) ) ( not ( = ?auto_100877 ?auto_100873 ) ) ( not ( = ?auto_100877 ?auto_100875 ) ) ( not ( = ?auto_100877 ?auto_100872 ) ) ( ON ?auto_100874 ?auto_100877 ) ( ON ?auto_100873 ?auto_100874 ) ( CLEAR ?auto_100873 ) ( HOLDING ?auto_100872 ) ( CLEAR ?auto_100875 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100875 ?auto_100872 )
      ( MAKE-1PILE ?auto_100871 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_100878 - BLOCK
    )
    :vars
    (
      ?auto_100884 - BLOCK
      ?auto_100882 - BLOCK
      ?auto_100879 - BLOCK
      ?auto_100881 - BLOCK
      ?auto_100883 - BLOCK
      ?auto_100880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100884 ?auto_100878 ) ( ON-TABLE ?auto_100878 ) ( not ( = ?auto_100878 ?auto_100884 ) ) ( not ( = ?auto_100878 ?auto_100882 ) ) ( not ( = ?auto_100878 ?auto_100879 ) ) ( not ( = ?auto_100884 ?auto_100882 ) ) ( not ( = ?auto_100884 ?auto_100879 ) ) ( not ( = ?auto_100882 ?auto_100879 ) ) ( ON ?auto_100882 ?auto_100884 ) ( ON-TABLE ?auto_100881 ) ( not ( = ?auto_100881 ?auto_100883 ) ) ( not ( = ?auto_100881 ?auto_100880 ) ) ( not ( = ?auto_100881 ?auto_100879 ) ) ( not ( = ?auto_100883 ?auto_100880 ) ) ( not ( = ?auto_100883 ?auto_100879 ) ) ( not ( = ?auto_100880 ?auto_100879 ) ) ( not ( = ?auto_100878 ?auto_100880 ) ) ( not ( = ?auto_100878 ?auto_100881 ) ) ( not ( = ?auto_100878 ?auto_100883 ) ) ( not ( = ?auto_100884 ?auto_100880 ) ) ( not ( = ?auto_100884 ?auto_100881 ) ) ( not ( = ?auto_100884 ?auto_100883 ) ) ( not ( = ?auto_100882 ?auto_100880 ) ) ( not ( = ?auto_100882 ?auto_100881 ) ) ( not ( = ?auto_100882 ?auto_100883 ) ) ( ON ?auto_100879 ?auto_100882 ) ( ON ?auto_100880 ?auto_100879 ) ( CLEAR ?auto_100881 ) ( ON ?auto_100883 ?auto_100880 ) ( CLEAR ?auto_100883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100878 ?auto_100884 ?auto_100882 ?auto_100879 ?auto_100880 )
      ( MAKE-1PILE ?auto_100878 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_100885 - BLOCK
    )
    :vars
    (
      ?auto_100889 - BLOCK
      ?auto_100888 - BLOCK
      ?auto_100891 - BLOCK
      ?auto_100887 - BLOCK
      ?auto_100890 - BLOCK
      ?auto_100886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100889 ?auto_100885 ) ( ON-TABLE ?auto_100885 ) ( not ( = ?auto_100885 ?auto_100889 ) ) ( not ( = ?auto_100885 ?auto_100888 ) ) ( not ( = ?auto_100885 ?auto_100891 ) ) ( not ( = ?auto_100889 ?auto_100888 ) ) ( not ( = ?auto_100889 ?auto_100891 ) ) ( not ( = ?auto_100888 ?auto_100891 ) ) ( ON ?auto_100888 ?auto_100889 ) ( not ( = ?auto_100887 ?auto_100890 ) ) ( not ( = ?auto_100887 ?auto_100886 ) ) ( not ( = ?auto_100887 ?auto_100891 ) ) ( not ( = ?auto_100890 ?auto_100886 ) ) ( not ( = ?auto_100890 ?auto_100891 ) ) ( not ( = ?auto_100886 ?auto_100891 ) ) ( not ( = ?auto_100885 ?auto_100886 ) ) ( not ( = ?auto_100885 ?auto_100887 ) ) ( not ( = ?auto_100885 ?auto_100890 ) ) ( not ( = ?auto_100889 ?auto_100886 ) ) ( not ( = ?auto_100889 ?auto_100887 ) ) ( not ( = ?auto_100889 ?auto_100890 ) ) ( not ( = ?auto_100888 ?auto_100886 ) ) ( not ( = ?auto_100888 ?auto_100887 ) ) ( not ( = ?auto_100888 ?auto_100890 ) ) ( ON ?auto_100891 ?auto_100888 ) ( ON ?auto_100886 ?auto_100891 ) ( ON ?auto_100890 ?auto_100886 ) ( CLEAR ?auto_100890 ) ( HOLDING ?auto_100887 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100887 )
      ( MAKE-1PILE ?auto_100885 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_100892 - BLOCK
    )
    :vars
    (
      ?auto_100895 - BLOCK
      ?auto_100894 - BLOCK
      ?auto_100896 - BLOCK
      ?auto_100893 - BLOCK
      ?auto_100897 - BLOCK
      ?auto_100898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100895 ?auto_100892 ) ( ON-TABLE ?auto_100892 ) ( not ( = ?auto_100892 ?auto_100895 ) ) ( not ( = ?auto_100892 ?auto_100894 ) ) ( not ( = ?auto_100892 ?auto_100896 ) ) ( not ( = ?auto_100895 ?auto_100894 ) ) ( not ( = ?auto_100895 ?auto_100896 ) ) ( not ( = ?auto_100894 ?auto_100896 ) ) ( ON ?auto_100894 ?auto_100895 ) ( not ( = ?auto_100893 ?auto_100897 ) ) ( not ( = ?auto_100893 ?auto_100898 ) ) ( not ( = ?auto_100893 ?auto_100896 ) ) ( not ( = ?auto_100897 ?auto_100898 ) ) ( not ( = ?auto_100897 ?auto_100896 ) ) ( not ( = ?auto_100898 ?auto_100896 ) ) ( not ( = ?auto_100892 ?auto_100898 ) ) ( not ( = ?auto_100892 ?auto_100893 ) ) ( not ( = ?auto_100892 ?auto_100897 ) ) ( not ( = ?auto_100895 ?auto_100898 ) ) ( not ( = ?auto_100895 ?auto_100893 ) ) ( not ( = ?auto_100895 ?auto_100897 ) ) ( not ( = ?auto_100894 ?auto_100898 ) ) ( not ( = ?auto_100894 ?auto_100893 ) ) ( not ( = ?auto_100894 ?auto_100897 ) ) ( ON ?auto_100896 ?auto_100894 ) ( ON ?auto_100898 ?auto_100896 ) ( ON ?auto_100897 ?auto_100898 ) ( ON ?auto_100893 ?auto_100897 ) ( CLEAR ?auto_100893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100892 ?auto_100895 ?auto_100894 ?auto_100896 ?auto_100898 ?auto_100897 )
      ( MAKE-1PILE ?auto_100892 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_100899 - BLOCK
    )
    :vars
    (
      ?auto_100901 - BLOCK
      ?auto_100903 - BLOCK
      ?auto_100905 - BLOCK
      ?auto_100902 - BLOCK
      ?auto_100900 - BLOCK
      ?auto_100904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100901 ?auto_100899 ) ( ON-TABLE ?auto_100899 ) ( not ( = ?auto_100899 ?auto_100901 ) ) ( not ( = ?auto_100899 ?auto_100903 ) ) ( not ( = ?auto_100899 ?auto_100905 ) ) ( not ( = ?auto_100901 ?auto_100903 ) ) ( not ( = ?auto_100901 ?auto_100905 ) ) ( not ( = ?auto_100903 ?auto_100905 ) ) ( ON ?auto_100903 ?auto_100901 ) ( not ( = ?auto_100902 ?auto_100900 ) ) ( not ( = ?auto_100902 ?auto_100904 ) ) ( not ( = ?auto_100902 ?auto_100905 ) ) ( not ( = ?auto_100900 ?auto_100904 ) ) ( not ( = ?auto_100900 ?auto_100905 ) ) ( not ( = ?auto_100904 ?auto_100905 ) ) ( not ( = ?auto_100899 ?auto_100904 ) ) ( not ( = ?auto_100899 ?auto_100902 ) ) ( not ( = ?auto_100899 ?auto_100900 ) ) ( not ( = ?auto_100901 ?auto_100904 ) ) ( not ( = ?auto_100901 ?auto_100902 ) ) ( not ( = ?auto_100901 ?auto_100900 ) ) ( not ( = ?auto_100903 ?auto_100904 ) ) ( not ( = ?auto_100903 ?auto_100902 ) ) ( not ( = ?auto_100903 ?auto_100900 ) ) ( ON ?auto_100905 ?auto_100903 ) ( ON ?auto_100904 ?auto_100905 ) ( ON ?auto_100900 ?auto_100904 ) ( HOLDING ?auto_100902 ) ( CLEAR ?auto_100900 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_100899 ?auto_100901 ?auto_100903 ?auto_100905 ?auto_100904 ?auto_100900 ?auto_100902 )
      ( MAKE-1PILE ?auto_100899 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_100906 - BLOCK
    )
    :vars
    (
      ?auto_100910 - BLOCK
      ?auto_100908 - BLOCK
      ?auto_100907 - BLOCK
      ?auto_100909 - BLOCK
      ?auto_100912 - BLOCK
      ?auto_100911 - BLOCK
      ?auto_100913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100910 ?auto_100906 ) ( ON-TABLE ?auto_100906 ) ( not ( = ?auto_100906 ?auto_100910 ) ) ( not ( = ?auto_100906 ?auto_100908 ) ) ( not ( = ?auto_100906 ?auto_100907 ) ) ( not ( = ?auto_100910 ?auto_100908 ) ) ( not ( = ?auto_100910 ?auto_100907 ) ) ( not ( = ?auto_100908 ?auto_100907 ) ) ( ON ?auto_100908 ?auto_100910 ) ( not ( = ?auto_100909 ?auto_100912 ) ) ( not ( = ?auto_100909 ?auto_100911 ) ) ( not ( = ?auto_100909 ?auto_100907 ) ) ( not ( = ?auto_100912 ?auto_100911 ) ) ( not ( = ?auto_100912 ?auto_100907 ) ) ( not ( = ?auto_100911 ?auto_100907 ) ) ( not ( = ?auto_100906 ?auto_100911 ) ) ( not ( = ?auto_100906 ?auto_100909 ) ) ( not ( = ?auto_100906 ?auto_100912 ) ) ( not ( = ?auto_100910 ?auto_100911 ) ) ( not ( = ?auto_100910 ?auto_100909 ) ) ( not ( = ?auto_100910 ?auto_100912 ) ) ( not ( = ?auto_100908 ?auto_100911 ) ) ( not ( = ?auto_100908 ?auto_100909 ) ) ( not ( = ?auto_100908 ?auto_100912 ) ) ( ON ?auto_100907 ?auto_100908 ) ( ON ?auto_100911 ?auto_100907 ) ( ON ?auto_100912 ?auto_100911 ) ( CLEAR ?auto_100912 ) ( ON ?auto_100909 ?auto_100913 ) ( CLEAR ?auto_100909 ) ( HAND-EMPTY ) ( not ( = ?auto_100906 ?auto_100913 ) ) ( not ( = ?auto_100910 ?auto_100913 ) ) ( not ( = ?auto_100908 ?auto_100913 ) ) ( not ( = ?auto_100907 ?auto_100913 ) ) ( not ( = ?auto_100909 ?auto_100913 ) ) ( not ( = ?auto_100912 ?auto_100913 ) ) ( not ( = ?auto_100911 ?auto_100913 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100909 ?auto_100913 )
      ( MAKE-1PILE ?auto_100906 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_100914 - BLOCK
    )
    :vars
    (
      ?auto_100921 - BLOCK
      ?auto_100918 - BLOCK
      ?auto_100919 - BLOCK
      ?auto_100917 - BLOCK
      ?auto_100916 - BLOCK
      ?auto_100920 - BLOCK
      ?auto_100915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100921 ?auto_100914 ) ( ON-TABLE ?auto_100914 ) ( not ( = ?auto_100914 ?auto_100921 ) ) ( not ( = ?auto_100914 ?auto_100918 ) ) ( not ( = ?auto_100914 ?auto_100919 ) ) ( not ( = ?auto_100921 ?auto_100918 ) ) ( not ( = ?auto_100921 ?auto_100919 ) ) ( not ( = ?auto_100918 ?auto_100919 ) ) ( ON ?auto_100918 ?auto_100921 ) ( not ( = ?auto_100917 ?auto_100916 ) ) ( not ( = ?auto_100917 ?auto_100920 ) ) ( not ( = ?auto_100917 ?auto_100919 ) ) ( not ( = ?auto_100916 ?auto_100920 ) ) ( not ( = ?auto_100916 ?auto_100919 ) ) ( not ( = ?auto_100920 ?auto_100919 ) ) ( not ( = ?auto_100914 ?auto_100920 ) ) ( not ( = ?auto_100914 ?auto_100917 ) ) ( not ( = ?auto_100914 ?auto_100916 ) ) ( not ( = ?auto_100921 ?auto_100920 ) ) ( not ( = ?auto_100921 ?auto_100917 ) ) ( not ( = ?auto_100921 ?auto_100916 ) ) ( not ( = ?auto_100918 ?auto_100920 ) ) ( not ( = ?auto_100918 ?auto_100917 ) ) ( not ( = ?auto_100918 ?auto_100916 ) ) ( ON ?auto_100919 ?auto_100918 ) ( ON ?auto_100920 ?auto_100919 ) ( ON ?auto_100917 ?auto_100915 ) ( CLEAR ?auto_100917 ) ( not ( = ?auto_100914 ?auto_100915 ) ) ( not ( = ?auto_100921 ?auto_100915 ) ) ( not ( = ?auto_100918 ?auto_100915 ) ) ( not ( = ?auto_100919 ?auto_100915 ) ) ( not ( = ?auto_100917 ?auto_100915 ) ) ( not ( = ?auto_100916 ?auto_100915 ) ) ( not ( = ?auto_100920 ?auto_100915 ) ) ( HOLDING ?auto_100916 ) ( CLEAR ?auto_100920 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100914 ?auto_100921 ?auto_100918 ?auto_100919 ?auto_100920 ?auto_100916 )
      ( MAKE-1PILE ?auto_100914 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_100922 - BLOCK
    )
    :vars
    (
      ?auto_100927 - BLOCK
      ?auto_100926 - BLOCK
      ?auto_100928 - BLOCK
      ?auto_100925 - BLOCK
      ?auto_100924 - BLOCK
      ?auto_100929 - BLOCK
      ?auto_100923 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100927 ?auto_100922 ) ( ON-TABLE ?auto_100922 ) ( not ( = ?auto_100922 ?auto_100927 ) ) ( not ( = ?auto_100922 ?auto_100926 ) ) ( not ( = ?auto_100922 ?auto_100928 ) ) ( not ( = ?auto_100927 ?auto_100926 ) ) ( not ( = ?auto_100927 ?auto_100928 ) ) ( not ( = ?auto_100926 ?auto_100928 ) ) ( ON ?auto_100926 ?auto_100927 ) ( not ( = ?auto_100925 ?auto_100924 ) ) ( not ( = ?auto_100925 ?auto_100929 ) ) ( not ( = ?auto_100925 ?auto_100928 ) ) ( not ( = ?auto_100924 ?auto_100929 ) ) ( not ( = ?auto_100924 ?auto_100928 ) ) ( not ( = ?auto_100929 ?auto_100928 ) ) ( not ( = ?auto_100922 ?auto_100929 ) ) ( not ( = ?auto_100922 ?auto_100925 ) ) ( not ( = ?auto_100922 ?auto_100924 ) ) ( not ( = ?auto_100927 ?auto_100929 ) ) ( not ( = ?auto_100927 ?auto_100925 ) ) ( not ( = ?auto_100927 ?auto_100924 ) ) ( not ( = ?auto_100926 ?auto_100929 ) ) ( not ( = ?auto_100926 ?auto_100925 ) ) ( not ( = ?auto_100926 ?auto_100924 ) ) ( ON ?auto_100928 ?auto_100926 ) ( ON ?auto_100929 ?auto_100928 ) ( ON ?auto_100925 ?auto_100923 ) ( not ( = ?auto_100922 ?auto_100923 ) ) ( not ( = ?auto_100927 ?auto_100923 ) ) ( not ( = ?auto_100926 ?auto_100923 ) ) ( not ( = ?auto_100928 ?auto_100923 ) ) ( not ( = ?auto_100925 ?auto_100923 ) ) ( not ( = ?auto_100924 ?auto_100923 ) ) ( not ( = ?auto_100929 ?auto_100923 ) ) ( CLEAR ?auto_100929 ) ( ON ?auto_100924 ?auto_100925 ) ( CLEAR ?auto_100924 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100923 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100923 ?auto_100925 )
      ( MAKE-1PILE ?auto_100922 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_100930 - BLOCK
    )
    :vars
    (
      ?auto_100937 - BLOCK
      ?auto_100931 - BLOCK
      ?auto_100936 - BLOCK
      ?auto_100932 - BLOCK
      ?auto_100934 - BLOCK
      ?auto_100933 - BLOCK
      ?auto_100935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100937 ?auto_100930 ) ( ON-TABLE ?auto_100930 ) ( not ( = ?auto_100930 ?auto_100937 ) ) ( not ( = ?auto_100930 ?auto_100931 ) ) ( not ( = ?auto_100930 ?auto_100936 ) ) ( not ( = ?auto_100937 ?auto_100931 ) ) ( not ( = ?auto_100937 ?auto_100936 ) ) ( not ( = ?auto_100931 ?auto_100936 ) ) ( ON ?auto_100931 ?auto_100937 ) ( not ( = ?auto_100932 ?auto_100934 ) ) ( not ( = ?auto_100932 ?auto_100933 ) ) ( not ( = ?auto_100932 ?auto_100936 ) ) ( not ( = ?auto_100934 ?auto_100933 ) ) ( not ( = ?auto_100934 ?auto_100936 ) ) ( not ( = ?auto_100933 ?auto_100936 ) ) ( not ( = ?auto_100930 ?auto_100933 ) ) ( not ( = ?auto_100930 ?auto_100932 ) ) ( not ( = ?auto_100930 ?auto_100934 ) ) ( not ( = ?auto_100937 ?auto_100933 ) ) ( not ( = ?auto_100937 ?auto_100932 ) ) ( not ( = ?auto_100937 ?auto_100934 ) ) ( not ( = ?auto_100931 ?auto_100933 ) ) ( not ( = ?auto_100931 ?auto_100932 ) ) ( not ( = ?auto_100931 ?auto_100934 ) ) ( ON ?auto_100936 ?auto_100931 ) ( ON ?auto_100932 ?auto_100935 ) ( not ( = ?auto_100930 ?auto_100935 ) ) ( not ( = ?auto_100937 ?auto_100935 ) ) ( not ( = ?auto_100931 ?auto_100935 ) ) ( not ( = ?auto_100936 ?auto_100935 ) ) ( not ( = ?auto_100932 ?auto_100935 ) ) ( not ( = ?auto_100934 ?auto_100935 ) ) ( not ( = ?auto_100933 ?auto_100935 ) ) ( ON ?auto_100934 ?auto_100932 ) ( CLEAR ?auto_100934 ) ( ON-TABLE ?auto_100935 ) ( HOLDING ?auto_100933 ) ( CLEAR ?auto_100936 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100930 ?auto_100937 ?auto_100931 ?auto_100936 ?auto_100933 )
      ( MAKE-1PILE ?auto_100930 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_100938 - BLOCK
    )
    :vars
    (
      ?auto_100943 - BLOCK
      ?auto_100945 - BLOCK
      ?auto_100939 - BLOCK
      ?auto_100941 - BLOCK
      ?auto_100940 - BLOCK
      ?auto_100942 - BLOCK
      ?auto_100944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100943 ?auto_100938 ) ( ON-TABLE ?auto_100938 ) ( not ( = ?auto_100938 ?auto_100943 ) ) ( not ( = ?auto_100938 ?auto_100945 ) ) ( not ( = ?auto_100938 ?auto_100939 ) ) ( not ( = ?auto_100943 ?auto_100945 ) ) ( not ( = ?auto_100943 ?auto_100939 ) ) ( not ( = ?auto_100945 ?auto_100939 ) ) ( ON ?auto_100945 ?auto_100943 ) ( not ( = ?auto_100941 ?auto_100940 ) ) ( not ( = ?auto_100941 ?auto_100942 ) ) ( not ( = ?auto_100941 ?auto_100939 ) ) ( not ( = ?auto_100940 ?auto_100942 ) ) ( not ( = ?auto_100940 ?auto_100939 ) ) ( not ( = ?auto_100942 ?auto_100939 ) ) ( not ( = ?auto_100938 ?auto_100942 ) ) ( not ( = ?auto_100938 ?auto_100941 ) ) ( not ( = ?auto_100938 ?auto_100940 ) ) ( not ( = ?auto_100943 ?auto_100942 ) ) ( not ( = ?auto_100943 ?auto_100941 ) ) ( not ( = ?auto_100943 ?auto_100940 ) ) ( not ( = ?auto_100945 ?auto_100942 ) ) ( not ( = ?auto_100945 ?auto_100941 ) ) ( not ( = ?auto_100945 ?auto_100940 ) ) ( ON ?auto_100939 ?auto_100945 ) ( ON ?auto_100941 ?auto_100944 ) ( not ( = ?auto_100938 ?auto_100944 ) ) ( not ( = ?auto_100943 ?auto_100944 ) ) ( not ( = ?auto_100945 ?auto_100944 ) ) ( not ( = ?auto_100939 ?auto_100944 ) ) ( not ( = ?auto_100941 ?auto_100944 ) ) ( not ( = ?auto_100940 ?auto_100944 ) ) ( not ( = ?auto_100942 ?auto_100944 ) ) ( ON ?auto_100940 ?auto_100941 ) ( ON-TABLE ?auto_100944 ) ( CLEAR ?auto_100939 ) ( ON ?auto_100942 ?auto_100940 ) ( CLEAR ?auto_100942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100944 ?auto_100941 ?auto_100940 )
      ( MAKE-1PILE ?auto_100938 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_100946 - BLOCK
    )
    :vars
    (
      ?auto_100949 - BLOCK
      ?auto_100952 - BLOCK
      ?auto_100951 - BLOCK
      ?auto_100953 - BLOCK
      ?auto_100947 - BLOCK
      ?auto_100950 - BLOCK
      ?auto_100948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100949 ?auto_100946 ) ( ON-TABLE ?auto_100946 ) ( not ( = ?auto_100946 ?auto_100949 ) ) ( not ( = ?auto_100946 ?auto_100952 ) ) ( not ( = ?auto_100946 ?auto_100951 ) ) ( not ( = ?auto_100949 ?auto_100952 ) ) ( not ( = ?auto_100949 ?auto_100951 ) ) ( not ( = ?auto_100952 ?auto_100951 ) ) ( ON ?auto_100952 ?auto_100949 ) ( not ( = ?auto_100953 ?auto_100947 ) ) ( not ( = ?auto_100953 ?auto_100950 ) ) ( not ( = ?auto_100953 ?auto_100951 ) ) ( not ( = ?auto_100947 ?auto_100950 ) ) ( not ( = ?auto_100947 ?auto_100951 ) ) ( not ( = ?auto_100950 ?auto_100951 ) ) ( not ( = ?auto_100946 ?auto_100950 ) ) ( not ( = ?auto_100946 ?auto_100953 ) ) ( not ( = ?auto_100946 ?auto_100947 ) ) ( not ( = ?auto_100949 ?auto_100950 ) ) ( not ( = ?auto_100949 ?auto_100953 ) ) ( not ( = ?auto_100949 ?auto_100947 ) ) ( not ( = ?auto_100952 ?auto_100950 ) ) ( not ( = ?auto_100952 ?auto_100953 ) ) ( not ( = ?auto_100952 ?auto_100947 ) ) ( ON ?auto_100953 ?auto_100948 ) ( not ( = ?auto_100946 ?auto_100948 ) ) ( not ( = ?auto_100949 ?auto_100948 ) ) ( not ( = ?auto_100952 ?auto_100948 ) ) ( not ( = ?auto_100951 ?auto_100948 ) ) ( not ( = ?auto_100953 ?auto_100948 ) ) ( not ( = ?auto_100947 ?auto_100948 ) ) ( not ( = ?auto_100950 ?auto_100948 ) ) ( ON ?auto_100947 ?auto_100953 ) ( ON-TABLE ?auto_100948 ) ( ON ?auto_100950 ?auto_100947 ) ( CLEAR ?auto_100950 ) ( HOLDING ?auto_100951 ) ( CLEAR ?auto_100952 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100946 ?auto_100949 ?auto_100952 ?auto_100951 )
      ( MAKE-1PILE ?auto_100946 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_100954 - BLOCK
    )
    :vars
    (
      ?auto_100956 - BLOCK
      ?auto_100955 - BLOCK
      ?auto_100960 - BLOCK
      ?auto_100961 - BLOCK
      ?auto_100957 - BLOCK
      ?auto_100959 - BLOCK
      ?auto_100958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100956 ?auto_100954 ) ( ON-TABLE ?auto_100954 ) ( not ( = ?auto_100954 ?auto_100956 ) ) ( not ( = ?auto_100954 ?auto_100955 ) ) ( not ( = ?auto_100954 ?auto_100960 ) ) ( not ( = ?auto_100956 ?auto_100955 ) ) ( not ( = ?auto_100956 ?auto_100960 ) ) ( not ( = ?auto_100955 ?auto_100960 ) ) ( ON ?auto_100955 ?auto_100956 ) ( not ( = ?auto_100961 ?auto_100957 ) ) ( not ( = ?auto_100961 ?auto_100959 ) ) ( not ( = ?auto_100961 ?auto_100960 ) ) ( not ( = ?auto_100957 ?auto_100959 ) ) ( not ( = ?auto_100957 ?auto_100960 ) ) ( not ( = ?auto_100959 ?auto_100960 ) ) ( not ( = ?auto_100954 ?auto_100959 ) ) ( not ( = ?auto_100954 ?auto_100961 ) ) ( not ( = ?auto_100954 ?auto_100957 ) ) ( not ( = ?auto_100956 ?auto_100959 ) ) ( not ( = ?auto_100956 ?auto_100961 ) ) ( not ( = ?auto_100956 ?auto_100957 ) ) ( not ( = ?auto_100955 ?auto_100959 ) ) ( not ( = ?auto_100955 ?auto_100961 ) ) ( not ( = ?auto_100955 ?auto_100957 ) ) ( ON ?auto_100961 ?auto_100958 ) ( not ( = ?auto_100954 ?auto_100958 ) ) ( not ( = ?auto_100956 ?auto_100958 ) ) ( not ( = ?auto_100955 ?auto_100958 ) ) ( not ( = ?auto_100960 ?auto_100958 ) ) ( not ( = ?auto_100961 ?auto_100958 ) ) ( not ( = ?auto_100957 ?auto_100958 ) ) ( not ( = ?auto_100959 ?auto_100958 ) ) ( ON ?auto_100957 ?auto_100961 ) ( ON-TABLE ?auto_100958 ) ( ON ?auto_100959 ?auto_100957 ) ( CLEAR ?auto_100955 ) ( ON ?auto_100960 ?auto_100959 ) ( CLEAR ?auto_100960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100958 ?auto_100961 ?auto_100957 ?auto_100959 )
      ( MAKE-1PILE ?auto_100954 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_100962 - BLOCK
    )
    :vars
    (
      ?auto_100968 - BLOCK
      ?auto_100965 - BLOCK
      ?auto_100969 - BLOCK
      ?auto_100967 - BLOCK
      ?auto_100966 - BLOCK
      ?auto_100963 - BLOCK
      ?auto_100964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100968 ?auto_100962 ) ( ON-TABLE ?auto_100962 ) ( not ( = ?auto_100962 ?auto_100968 ) ) ( not ( = ?auto_100962 ?auto_100965 ) ) ( not ( = ?auto_100962 ?auto_100969 ) ) ( not ( = ?auto_100968 ?auto_100965 ) ) ( not ( = ?auto_100968 ?auto_100969 ) ) ( not ( = ?auto_100965 ?auto_100969 ) ) ( not ( = ?auto_100967 ?auto_100966 ) ) ( not ( = ?auto_100967 ?auto_100963 ) ) ( not ( = ?auto_100967 ?auto_100969 ) ) ( not ( = ?auto_100966 ?auto_100963 ) ) ( not ( = ?auto_100966 ?auto_100969 ) ) ( not ( = ?auto_100963 ?auto_100969 ) ) ( not ( = ?auto_100962 ?auto_100963 ) ) ( not ( = ?auto_100962 ?auto_100967 ) ) ( not ( = ?auto_100962 ?auto_100966 ) ) ( not ( = ?auto_100968 ?auto_100963 ) ) ( not ( = ?auto_100968 ?auto_100967 ) ) ( not ( = ?auto_100968 ?auto_100966 ) ) ( not ( = ?auto_100965 ?auto_100963 ) ) ( not ( = ?auto_100965 ?auto_100967 ) ) ( not ( = ?auto_100965 ?auto_100966 ) ) ( ON ?auto_100967 ?auto_100964 ) ( not ( = ?auto_100962 ?auto_100964 ) ) ( not ( = ?auto_100968 ?auto_100964 ) ) ( not ( = ?auto_100965 ?auto_100964 ) ) ( not ( = ?auto_100969 ?auto_100964 ) ) ( not ( = ?auto_100967 ?auto_100964 ) ) ( not ( = ?auto_100966 ?auto_100964 ) ) ( not ( = ?auto_100963 ?auto_100964 ) ) ( ON ?auto_100966 ?auto_100967 ) ( ON-TABLE ?auto_100964 ) ( ON ?auto_100963 ?auto_100966 ) ( ON ?auto_100969 ?auto_100963 ) ( CLEAR ?auto_100969 ) ( HOLDING ?auto_100965 ) ( CLEAR ?auto_100968 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100962 ?auto_100968 ?auto_100965 )
      ( MAKE-1PILE ?auto_100962 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_100970 - BLOCK
    )
    :vars
    (
      ?auto_100972 - BLOCK
      ?auto_100975 - BLOCK
      ?auto_100971 - BLOCK
      ?auto_100977 - BLOCK
      ?auto_100974 - BLOCK
      ?auto_100976 - BLOCK
      ?auto_100973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100972 ?auto_100970 ) ( ON-TABLE ?auto_100970 ) ( not ( = ?auto_100970 ?auto_100972 ) ) ( not ( = ?auto_100970 ?auto_100975 ) ) ( not ( = ?auto_100970 ?auto_100971 ) ) ( not ( = ?auto_100972 ?auto_100975 ) ) ( not ( = ?auto_100972 ?auto_100971 ) ) ( not ( = ?auto_100975 ?auto_100971 ) ) ( not ( = ?auto_100977 ?auto_100974 ) ) ( not ( = ?auto_100977 ?auto_100976 ) ) ( not ( = ?auto_100977 ?auto_100971 ) ) ( not ( = ?auto_100974 ?auto_100976 ) ) ( not ( = ?auto_100974 ?auto_100971 ) ) ( not ( = ?auto_100976 ?auto_100971 ) ) ( not ( = ?auto_100970 ?auto_100976 ) ) ( not ( = ?auto_100970 ?auto_100977 ) ) ( not ( = ?auto_100970 ?auto_100974 ) ) ( not ( = ?auto_100972 ?auto_100976 ) ) ( not ( = ?auto_100972 ?auto_100977 ) ) ( not ( = ?auto_100972 ?auto_100974 ) ) ( not ( = ?auto_100975 ?auto_100976 ) ) ( not ( = ?auto_100975 ?auto_100977 ) ) ( not ( = ?auto_100975 ?auto_100974 ) ) ( ON ?auto_100977 ?auto_100973 ) ( not ( = ?auto_100970 ?auto_100973 ) ) ( not ( = ?auto_100972 ?auto_100973 ) ) ( not ( = ?auto_100975 ?auto_100973 ) ) ( not ( = ?auto_100971 ?auto_100973 ) ) ( not ( = ?auto_100977 ?auto_100973 ) ) ( not ( = ?auto_100974 ?auto_100973 ) ) ( not ( = ?auto_100976 ?auto_100973 ) ) ( ON ?auto_100974 ?auto_100977 ) ( ON-TABLE ?auto_100973 ) ( ON ?auto_100976 ?auto_100974 ) ( ON ?auto_100971 ?auto_100976 ) ( CLEAR ?auto_100972 ) ( ON ?auto_100975 ?auto_100971 ) ( CLEAR ?auto_100975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100973 ?auto_100977 ?auto_100974 ?auto_100976 ?auto_100971 )
      ( MAKE-1PILE ?auto_100970 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_100994 - BLOCK
    )
    :vars
    (
      ?auto_100999 - BLOCK
      ?auto_101000 - BLOCK
      ?auto_101001 - BLOCK
      ?auto_100995 - BLOCK
      ?auto_100996 - BLOCK
      ?auto_100997 - BLOCK
      ?auto_100998 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100994 ?auto_100999 ) ) ( not ( = ?auto_100994 ?auto_101000 ) ) ( not ( = ?auto_100994 ?auto_101001 ) ) ( not ( = ?auto_100999 ?auto_101000 ) ) ( not ( = ?auto_100999 ?auto_101001 ) ) ( not ( = ?auto_101000 ?auto_101001 ) ) ( not ( = ?auto_100995 ?auto_100996 ) ) ( not ( = ?auto_100995 ?auto_100997 ) ) ( not ( = ?auto_100995 ?auto_101001 ) ) ( not ( = ?auto_100996 ?auto_100997 ) ) ( not ( = ?auto_100996 ?auto_101001 ) ) ( not ( = ?auto_100997 ?auto_101001 ) ) ( not ( = ?auto_100994 ?auto_100997 ) ) ( not ( = ?auto_100994 ?auto_100995 ) ) ( not ( = ?auto_100994 ?auto_100996 ) ) ( not ( = ?auto_100999 ?auto_100997 ) ) ( not ( = ?auto_100999 ?auto_100995 ) ) ( not ( = ?auto_100999 ?auto_100996 ) ) ( not ( = ?auto_101000 ?auto_100997 ) ) ( not ( = ?auto_101000 ?auto_100995 ) ) ( not ( = ?auto_101000 ?auto_100996 ) ) ( ON ?auto_100995 ?auto_100998 ) ( not ( = ?auto_100994 ?auto_100998 ) ) ( not ( = ?auto_100999 ?auto_100998 ) ) ( not ( = ?auto_101000 ?auto_100998 ) ) ( not ( = ?auto_101001 ?auto_100998 ) ) ( not ( = ?auto_100995 ?auto_100998 ) ) ( not ( = ?auto_100996 ?auto_100998 ) ) ( not ( = ?auto_100997 ?auto_100998 ) ) ( ON ?auto_100996 ?auto_100995 ) ( ON-TABLE ?auto_100998 ) ( ON ?auto_100997 ?auto_100996 ) ( ON ?auto_101001 ?auto_100997 ) ( ON ?auto_101000 ?auto_101001 ) ( ON ?auto_100999 ?auto_101000 ) ( CLEAR ?auto_100999 ) ( HOLDING ?auto_100994 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100994 ?auto_100999 )
      ( MAKE-1PILE ?auto_100994 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_101002 - BLOCK
    )
    :vars
    (
      ?auto_101004 - BLOCK
      ?auto_101009 - BLOCK
      ?auto_101008 - BLOCK
      ?auto_101006 - BLOCK
      ?auto_101007 - BLOCK
      ?auto_101003 - BLOCK
      ?auto_101005 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101002 ?auto_101004 ) ) ( not ( = ?auto_101002 ?auto_101009 ) ) ( not ( = ?auto_101002 ?auto_101008 ) ) ( not ( = ?auto_101004 ?auto_101009 ) ) ( not ( = ?auto_101004 ?auto_101008 ) ) ( not ( = ?auto_101009 ?auto_101008 ) ) ( not ( = ?auto_101006 ?auto_101007 ) ) ( not ( = ?auto_101006 ?auto_101003 ) ) ( not ( = ?auto_101006 ?auto_101008 ) ) ( not ( = ?auto_101007 ?auto_101003 ) ) ( not ( = ?auto_101007 ?auto_101008 ) ) ( not ( = ?auto_101003 ?auto_101008 ) ) ( not ( = ?auto_101002 ?auto_101003 ) ) ( not ( = ?auto_101002 ?auto_101006 ) ) ( not ( = ?auto_101002 ?auto_101007 ) ) ( not ( = ?auto_101004 ?auto_101003 ) ) ( not ( = ?auto_101004 ?auto_101006 ) ) ( not ( = ?auto_101004 ?auto_101007 ) ) ( not ( = ?auto_101009 ?auto_101003 ) ) ( not ( = ?auto_101009 ?auto_101006 ) ) ( not ( = ?auto_101009 ?auto_101007 ) ) ( ON ?auto_101006 ?auto_101005 ) ( not ( = ?auto_101002 ?auto_101005 ) ) ( not ( = ?auto_101004 ?auto_101005 ) ) ( not ( = ?auto_101009 ?auto_101005 ) ) ( not ( = ?auto_101008 ?auto_101005 ) ) ( not ( = ?auto_101006 ?auto_101005 ) ) ( not ( = ?auto_101007 ?auto_101005 ) ) ( not ( = ?auto_101003 ?auto_101005 ) ) ( ON ?auto_101007 ?auto_101006 ) ( ON-TABLE ?auto_101005 ) ( ON ?auto_101003 ?auto_101007 ) ( ON ?auto_101008 ?auto_101003 ) ( ON ?auto_101009 ?auto_101008 ) ( ON ?auto_101004 ?auto_101009 ) ( ON ?auto_101002 ?auto_101004 ) ( CLEAR ?auto_101002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_101005 ?auto_101006 ?auto_101007 ?auto_101003 ?auto_101008 ?auto_101009 ?auto_101004 )
      ( MAKE-1PILE ?auto_101002 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101016 - BLOCK
      ?auto_101017 - BLOCK
      ?auto_101018 - BLOCK
      ?auto_101019 - BLOCK
      ?auto_101020 - BLOCK
      ?auto_101021 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_101021 ) ( CLEAR ?auto_101020 ) ( ON-TABLE ?auto_101016 ) ( ON ?auto_101017 ?auto_101016 ) ( ON ?auto_101018 ?auto_101017 ) ( ON ?auto_101019 ?auto_101018 ) ( ON ?auto_101020 ?auto_101019 ) ( not ( = ?auto_101016 ?auto_101017 ) ) ( not ( = ?auto_101016 ?auto_101018 ) ) ( not ( = ?auto_101016 ?auto_101019 ) ) ( not ( = ?auto_101016 ?auto_101020 ) ) ( not ( = ?auto_101016 ?auto_101021 ) ) ( not ( = ?auto_101017 ?auto_101018 ) ) ( not ( = ?auto_101017 ?auto_101019 ) ) ( not ( = ?auto_101017 ?auto_101020 ) ) ( not ( = ?auto_101017 ?auto_101021 ) ) ( not ( = ?auto_101018 ?auto_101019 ) ) ( not ( = ?auto_101018 ?auto_101020 ) ) ( not ( = ?auto_101018 ?auto_101021 ) ) ( not ( = ?auto_101019 ?auto_101020 ) ) ( not ( = ?auto_101019 ?auto_101021 ) ) ( not ( = ?auto_101020 ?auto_101021 ) ) )
    :subtasks
    ( ( !STACK ?auto_101021 ?auto_101020 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101022 - BLOCK
      ?auto_101023 - BLOCK
      ?auto_101024 - BLOCK
      ?auto_101025 - BLOCK
      ?auto_101026 - BLOCK
      ?auto_101027 - BLOCK
    )
    :vars
    (
      ?auto_101028 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_101026 ) ( ON-TABLE ?auto_101022 ) ( ON ?auto_101023 ?auto_101022 ) ( ON ?auto_101024 ?auto_101023 ) ( ON ?auto_101025 ?auto_101024 ) ( ON ?auto_101026 ?auto_101025 ) ( not ( = ?auto_101022 ?auto_101023 ) ) ( not ( = ?auto_101022 ?auto_101024 ) ) ( not ( = ?auto_101022 ?auto_101025 ) ) ( not ( = ?auto_101022 ?auto_101026 ) ) ( not ( = ?auto_101022 ?auto_101027 ) ) ( not ( = ?auto_101023 ?auto_101024 ) ) ( not ( = ?auto_101023 ?auto_101025 ) ) ( not ( = ?auto_101023 ?auto_101026 ) ) ( not ( = ?auto_101023 ?auto_101027 ) ) ( not ( = ?auto_101024 ?auto_101025 ) ) ( not ( = ?auto_101024 ?auto_101026 ) ) ( not ( = ?auto_101024 ?auto_101027 ) ) ( not ( = ?auto_101025 ?auto_101026 ) ) ( not ( = ?auto_101025 ?auto_101027 ) ) ( not ( = ?auto_101026 ?auto_101027 ) ) ( ON ?auto_101027 ?auto_101028 ) ( CLEAR ?auto_101027 ) ( HAND-EMPTY ) ( not ( = ?auto_101022 ?auto_101028 ) ) ( not ( = ?auto_101023 ?auto_101028 ) ) ( not ( = ?auto_101024 ?auto_101028 ) ) ( not ( = ?auto_101025 ?auto_101028 ) ) ( not ( = ?auto_101026 ?auto_101028 ) ) ( not ( = ?auto_101027 ?auto_101028 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_101027 ?auto_101028 )
      ( MAKE-6PILE ?auto_101022 ?auto_101023 ?auto_101024 ?auto_101025 ?auto_101026 ?auto_101027 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101029 - BLOCK
      ?auto_101030 - BLOCK
      ?auto_101031 - BLOCK
      ?auto_101032 - BLOCK
      ?auto_101033 - BLOCK
      ?auto_101034 - BLOCK
    )
    :vars
    (
      ?auto_101035 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101029 ) ( ON ?auto_101030 ?auto_101029 ) ( ON ?auto_101031 ?auto_101030 ) ( ON ?auto_101032 ?auto_101031 ) ( not ( = ?auto_101029 ?auto_101030 ) ) ( not ( = ?auto_101029 ?auto_101031 ) ) ( not ( = ?auto_101029 ?auto_101032 ) ) ( not ( = ?auto_101029 ?auto_101033 ) ) ( not ( = ?auto_101029 ?auto_101034 ) ) ( not ( = ?auto_101030 ?auto_101031 ) ) ( not ( = ?auto_101030 ?auto_101032 ) ) ( not ( = ?auto_101030 ?auto_101033 ) ) ( not ( = ?auto_101030 ?auto_101034 ) ) ( not ( = ?auto_101031 ?auto_101032 ) ) ( not ( = ?auto_101031 ?auto_101033 ) ) ( not ( = ?auto_101031 ?auto_101034 ) ) ( not ( = ?auto_101032 ?auto_101033 ) ) ( not ( = ?auto_101032 ?auto_101034 ) ) ( not ( = ?auto_101033 ?auto_101034 ) ) ( ON ?auto_101034 ?auto_101035 ) ( CLEAR ?auto_101034 ) ( not ( = ?auto_101029 ?auto_101035 ) ) ( not ( = ?auto_101030 ?auto_101035 ) ) ( not ( = ?auto_101031 ?auto_101035 ) ) ( not ( = ?auto_101032 ?auto_101035 ) ) ( not ( = ?auto_101033 ?auto_101035 ) ) ( not ( = ?auto_101034 ?auto_101035 ) ) ( HOLDING ?auto_101033 ) ( CLEAR ?auto_101032 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_101029 ?auto_101030 ?auto_101031 ?auto_101032 ?auto_101033 )
      ( MAKE-6PILE ?auto_101029 ?auto_101030 ?auto_101031 ?auto_101032 ?auto_101033 ?auto_101034 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101036 - BLOCK
      ?auto_101037 - BLOCK
      ?auto_101038 - BLOCK
      ?auto_101039 - BLOCK
      ?auto_101040 - BLOCK
      ?auto_101041 - BLOCK
    )
    :vars
    (
      ?auto_101042 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101036 ) ( ON ?auto_101037 ?auto_101036 ) ( ON ?auto_101038 ?auto_101037 ) ( ON ?auto_101039 ?auto_101038 ) ( not ( = ?auto_101036 ?auto_101037 ) ) ( not ( = ?auto_101036 ?auto_101038 ) ) ( not ( = ?auto_101036 ?auto_101039 ) ) ( not ( = ?auto_101036 ?auto_101040 ) ) ( not ( = ?auto_101036 ?auto_101041 ) ) ( not ( = ?auto_101037 ?auto_101038 ) ) ( not ( = ?auto_101037 ?auto_101039 ) ) ( not ( = ?auto_101037 ?auto_101040 ) ) ( not ( = ?auto_101037 ?auto_101041 ) ) ( not ( = ?auto_101038 ?auto_101039 ) ) ( not ( = ?auto_101038 ?auto_101040 ) ) ( not ( = ?auto_101038 ?auto_101041 ) ) ( not ( = ?auto_101039 ?auto_101040 ) ) ( not ( = ?auto_101039 ?auto_101041 ) ) ( not ( = ?auto_101040 ?auto_101041 ) ) ( ON ?auto_101041 ?auto_101042 ) ( not ( = ?auto_101036 ?auto_101042 ) ) ( not ( = ?auto_101037 ?auto_101042 ) ) ( not ( = ?auto_101038 ?auto_101042 ) ) ( not ( = ?auto_101039 ?auto_101042 ) ) ( not ( = ?auto_101040 ?auto_101042 ) ) ( not ( = ?auto_101041 ?auto_101042 ) ) ( CLEAR ?auto_101039 ) ( ON ?auto_101040 ?auto_101041 ) ( CLEAR ?auto_101040 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_101042 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101042 ?auto_101041 )
      ( MAKE-6PILE ?auto_101036 ?auto_101037 ?auto_101038 ?auto_101039 ?auto_101040 ?auto_101041 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101043 - BLOCK
      ?auto_101044 - BLOCK
      ?auto_101045 - BLOCK
      ?auto_101046 - BLOCK
      ?auto_101047 - BLOCK
      ?auto_101048 - BLOCK
    )
    :vars
    (
      ?auto_101049 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101043 ) ( ON ?auto_101044 ?auto_101043 ) ( ON ?auto_101045 ?auto_101044 ) ( not ( = ?auto_101043 ?auto_101044 ) ) ( not ( = ?auto_101043 ?auto_101045 ) ) ( not ( = ?auto_101043 ?auto_101046 ) ) ( not ( = ?auto_101043 ?auto_101047 ) ) ( not ( = ?auto_101043 ?auto_101048 ) ) ( not ( = ?auto_101044 ?auto_101045 ) ) ( not ( = ?auto_101044 ?auto_101046 ) ) ( not ( = ?auto_101044 ?auto_101047 ) ) ( not ( = ?auto_101044 ?auto_101048 ) ) ( not ( = ?auto_101045 ?auto_101046 ) ) ( not ( = ?auto_101045 ?auto_101047 ) ) ( not ( = ?auto_101045 ?auto_101048 ) ) ( not ( = ?auto_101046 ?auto_101047 ) ) ( not ( = ?auto_101046 ?auto_101048 ) ) ( not ( = ?auto_101047 ?auto_101048 ) ) ( ON ?auto_101048 ?auto_101049 ) ( not ( = ?auto_101043 ?auto_101049 ) ) ( not ( = ?auto_101044 ?auto_101049 ) ) ( not ( = ?auto_101045 ?auto_101049 ) ) ( not ( = ?auto_101046 ?auto_101049 ) ) ( not ( = ?auto_101047 ?auto_101049 ) ) ( not ( = ?auto_101048 ?auto_101049 ) ) ( ON ?auto_101047 ?auto_101048 ) ( CLEAR ?auto_101047 ) ( ON-TABLE ?auto_101049 ) ( HOLDING ?auto_101046 ) ( CLEAR ?auto_101045 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_101043 ?auto_101044 ?auto_101045 ?auto_101046 )
      ( MAKE-6PILE ?auto_101043 ?auto_101044 ?auto_101045 ?auto_101046 ?auto_101047 ?auto_101048 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101050 - BLOCK
      ?auto_101051 - BLOCK
      ?auto_101052 - BLOCK
      ?auto_101053 - BLOCK
      ?auto_101054 - BLOCK
      ?auto_101055 - BLOCK
    )
    :vars
    (
      ?auto_101056 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101050 ) ( ON ?auto_101051 ?auto_101050 ) ( ON ?auto_101052 ?auto_101051 ) ( not ( = ?auto_101050 ?auto_101051 ) ) ( not ( = ?auto_101050 ?auto_101052 ) ) ( not ( = ?auto_101050 ?auto_101053 ) ) ( not ( = ?auto_101050 ?auto_101054 ) ) ( not ( = ?auto_101050 ?auto_101055 ) ) ( not ( = ?auto_101051 ?auto_101052 ) ) ( not ( = ?auto_101051 ?auto_101053 ) ) ( not ( = ?auto_101051 ?auto_101054 ) ) ( not ( = ?auto_101051 ?auto_101055 ) ) ( not ( = ?auto_101052 ?auto_101053 ) ) ( not ( = ?auto_101052 ?auto_101054 ) ) ( not ( = ?auto_101052 ?auto_101055 ) ) ( not ( = ?auto_101053 ?auto_101054 ) ) ( not ( = ?auto_101053 ?auto_101055 ) ) ( not ( = ?auto_101054 ?auto_101055 ) ) ( ON ?auto_101055 ?auto_101056 ) ( not ( = ?auto_101050 ?auto_101056 ) ) ( not ( = ?auto_101051 ?auto_101056 ) ) ( not ( = ?auto_101052 ?auto_101056 ) ) ( not ( = ?auto_101053 ?auto_101056 ) ) ( not ( = ?auto_101054 ?auto_101056 ) ) ( not ( = ?auto_101055 ?auto_101056 ) ) ( ON ?auto_101054 ?auto_101055 ) ( ON-TABLE ?auto_101056 ) ( CLEAR ?auto_101052 ) ( ON ?auto_101053 ?auto_101054 ) ( CLEAR ?auto_101053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101056 ?auto_101055 ?auto_101054 )
      ( MAKE-6PILE ?auto_101050 ?auto_101051 ?auto_101052 ?auto_101053 ?auto_101054 ?auto_101055 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101057 - BLOCK
      ?auto_101058 - BLOCK
      ?auto_101059 - BLOCK
      ?auto_101060 - BLOCK
      ?auto_101061 - BLOCK
      ?auto_101062 - BLOCK
    )
    :vars
    (
      ?auto_101063 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101057 ) ( ON ?auto_101058 ?auto_101057 ) ( not ( = ?auto_101057 ?auto_101058 ) ) ( not ( = ?auto_101057 ?auto_101059 ) ) ( not ( = ?auto_101057 ?auto_101060 ) ) ( not ( = ?auto_101057 ?auto_101061 ) ) ( not ( = ?auto_101057 ?auto_101062 ) ) ( not ( = ?auto_101058 ?auto_101059 ) ) ( not ( = ?auto_101058 ?auto_101060 ) ) ( not ( = ?auto_101058 ?auto_101061 ) ) ( not ( = ?auto_101058 ?auto_101062 ) ) ( not ( = ?auto_101059 ?auto_101060 ) ) ( not ( = ?auto_101059 ?auto_101061 ) ) ( not ( = ?auto_101059 ?auto_101062 ) ) ( not ( = ?auto_101060 ?auto_101061 ) ) ( not ( = ?auto_101060 ?auto_101062 ) ) ( not ( = ?auto_101061 ?auto_101062 ) ) ( ON ?auto_101062 ?auto_101063 ) ( not ( = ?auto_101057 ?auto_101063 ) ) ( not ( = ?auto_101058 ?auto_101063 ) ) ( not ( = ?auto_101059 ?auto_101063 ) ) ( not ( = ?auto_101060 ?auto_101063 ) ) ( not ( = ?auto_101061 ?auto_101063 ) ) ( not ( = ?auto_101062 ?auto_101063 ) ) ( ON ?auto_101061 ?auto_101062 ) ( ON-TABLE ?auto_101063 ) ( ON ?auto_101060 ?auto_101061 ) ( CLEAR ?auto_101060 ) ( HOLDING ?auto_101059 ) ( CLEAR ?auto_101058 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101057 ?auto_101058 ?auto_101059 )
      ( MAKE-6PILE ?auto_101057 ?auto_101058 ?auto_101059 ?auto_101060 ?auto_101061 ?auto_101062 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101064 - BLOCK
      ?auto_101065 - BLOCK
      ?auto_101066 - BLOCK
      ?auto_101067 - BLOCK
      ?auto_101068 - BLOCK
      ?auto_101069 - BLOCK
    )
    :vars
    (
      ?auto_101070 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101064 ) ( ON ?auto_101065 ?auto_101064 ) ( not ( = ?auto_101064 ?auto_101065 ) ) ( not ( = ?auto_101064 ?auto_101066 ) ) ( not ( = ?auto_101064 ?auto_101067 ) ) ( not ( = ?auto_101064 ?auto_101068 ) ) ( not ( = ?auto_101064 ?auto_101069 ) ) ( not ( = ?auto_101065 ?auto_101066 ) ) ( not ( = ?auto_101065 ?auto_101067 ) ) ( not ( = ?auto_101065 ?auto_101068 ) ) ( not ( = ?auto_101065 ?auto_101069 ) ) ( not ( = ?auto_101066 ?auto_101067 ) ) ( not ( = ?auto_101066 ?auto_101068 ) ) ( not ( = ?auto_101066 ?auto_101069 ) ) ( not ( = ?auto_101067 ?auto_101068 ) ) ( not ( = ?auto_101067 ?auto_101069 ) ) ( not ( = ?auto_101068 ?auto_101069 ) ) ( ON ?auto_101069 ?auto_101070 ) ( not ( = ?auto_101064 ?auto_101070 ) ) ( not ( = ?auto_101065 ?auto_101070 ) ) ( not ( = ?auto_101066 ?auto_101070 ) ) ( not ( = ?auto_101067 ?auto_101070 ) ) ( not ( = ?auto_101068 ?auto_101070 ) ) ( not ( = ?auto_101069 ?auto_101070 ) ) ( ON ?auto_101068 ?auto_101069 ) ( ON-TABLE ?auto_101070 ) ( ON ?auto_101067 ?auto_101068 ) ( CLEAR ?auto_101065 ) ( ON ?auto_101066 ?auto_101067 ) ( CLEAR ?auto_101066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_101070 ?auto_101069 ?auto_101068 ?auto_101067 )
      ( MAKE-6PILE ?auto_101064 ?auto_101065 ?auto_101066 ?auto_101067 ?auto_101068 ?auto_101069 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101071 - BLOCK
      ?auto_101072 - BLOCK
      ?auto_101073 - BLOCK
      ?auto_101074 - BLOCK
      ?auto_101075 - BLOCK
      ?auto_101076 - BLOCK
    )
    :vars
    (
      ?auto_101077 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101071 ) ( not ( = ?auto_101071 ?auto_101072 ) ) ( not ( = ?auto_101071 ?auto_101073 ) ) ( not ( = ?auto_101071 ?auto_101074 ) ) ( not ( = ?auto_101071 ?auto_101075 ) ) ( not ( = ?auto_101071 ?auto_101076 ) ) ( not ( = ?auto_101072 ?auto_101073 ) ) ( not ( = ?auto_101072 ?auto_101074 ) ) ( not ( = ?auto_101072 ?auto_101075 ) ) ( not ( = ?auto_101072 ?auto_101076 ) ) ( not ( = ?auto_101073 ?auto_101074 ) ) ( not ( = ?auto_101073 ?auto_101075 ) ) ( not ( = ?auto_101073 ?auto_101076 ) ) ( not ( = ?auto_101074 ?auto_101075 ) ) ( not ( = ?auto_101074 ?auto_101076 ) ) ( not ( = ?auto_101075 ?auto_101076 ) ) ( ON ?auto_101076 ?auto_101077 ) ( not ( = ?auto_101071 ?auto_101077 ) ) ( not ( = ?auto_101072 ?auto_101077 ) ) ( not ( = ?auto_101073 ?auto_101077 ) ) ( not ( = ?auto_101074 ?auto_101077 ) ) ( not ( = ?auto_101075 ?auto_101077 ) ) ( not ( = ?auto_101076 ?auto_101077 ) ) ( ON ?auto_101075 ?auto_101076 ) ( ON-TABLE ?auto_101077 ) ( ON ?auto_101074 ?auto_101075 ) ( ON ?auto_101073 ?auto_101074 ) ( CLEAR ?auto_101073 ) ( HOLDING ?auto_101072 ) ( CLEAR ?auto_101071 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101071 ?auto_101072 )
      ( MAKE-6PILE ?auto_101071 ?auto_101072 ?auto_101073 ?auto_101074 ?auto_101075 ?auto_101076 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101078 - BLOCK
      ?auto_101079 - BLOCK
      ?auto_101080 - BLOCK
      ?auto_101081 - BLOCK
      ?auto_101082 - BLOCK
      ?auto_101083 - BLOCK
    )
    :vars
    (
      ?auto_101084 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101078 ) ( not ( = ?auto_101078 ?auto_101079 ) ) ( not ( = ?auto_101078 ?auto_101080 ) ) ( not ( = ?auto_101078 ?auto_101081 ) ) ( not ( = ?auto_101078 ?auto_101082 ) ) ( not ( = ?auto_101078 ?auto_101083 ) ) ( not ( = ?auto_101079 ?auto_101080 ) ) ( not ( = ?auto_101079 ?auto_101081 ) ) ( not ( = ?auto_101079 ?auto_101082 ) ) ( not ( = ?auto_101079 ?auto_101083 ) ) ( not ( = ?auto_101080 ?auto_101081 ) ) ( not ( = ?auto_101080 ?auto_101082 ) ) ( not ( = ?auto_101080 ?auto_101083 ) ) ( not ( = ?auto_101081 ?auto_101082 ) ) ( not ( = ?auto_101081 ?auto_101083 ) ) ( not ( = ?auto_101082 ?auto_101083 ) ) ( ON ?auto_101083 ?auto_101084 ) ( not ( = ?auto_101078 ?auto_101084 ) ) ( not ( = ?auto_101079 ?auto_101084 ) ) ( not ( = ?auto_101080 ?auto_101084 ) ) ( not ( = ?auto_101081 ?auto_101084 ) ) ( not ( = ?auto_101082 ?auto_101084 ) ) ( not ( = ?auto_101083 ?auto_101084 ) ) ( ON ?auto_101082 ?auto_101083 ) ( ON-TABLE ?auto_101084 ) ( ON ?auto_101081 ?auto_101082 ) ( ON ?auto_101080 ?auto_101081 ) ( CLEAR ?auto_101078 ) ( ON ?auto_101079 ?auto_101080 ) ( CLEAR ?auto_101079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_101084 ?auto_101083 ?auto_101082 ?auto_101081 ?auto_101080 )
      ( MAKE-6PILE ?auto_101078 ?auto_101079 ?auto_101080 ?auto_101081 ?auto_101082 ?auto_101083 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101085 - BLOCK
      ?auto_101086 - BLOCK
      ?auto_101087 - BLOCK
      ?auto_101088 - BLOCK
      ?auto_101089 - BLOCK
      ?auto_101090 - BLOCK
    )
    :vars
    (
      ?auto_101091 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101085 ?auto_101086 ) ) ( not ( = ?auto_101085 ?auto_101087 ) ) ( not ( = ?auto_101085 ?auto_101088 ) ) ( not ( = ?auto_101085 ?auto_101089 ) ) ( not ( = ?auto_101085 ?auto_101090 ) ) ( not ( = ?auto_101086 ?auto_101087 ) ) ( not ( = ?auto_101086 ?auto_101088 ) ) ( not ( = ?auto_101086 ?auto_101089 ) ) ( not ( = ?auto_101086 ?auto_101090 ) ) ( not ( = ?auto_101087 ?auto_101088 ) ) ( not ( = ?auto_101087 ?auto_101089 ) ) ( not ( = ?auto_101087 ?auto_101090 ) ) ( not ( = ?auto_101088 ?auto_101089 ) ) ( not ( = ?auto_101088 ?auto_101090 ) ) ( not ( = ?auto_101089 ?auto_101090 ) ) ( ON ?auto_101090 ?auto_101091 ) ( not ( = ?auto_101085 ?auto_101091 ) ) ( not ( = ?auto_101086 ?auto_101091 ) ) ( not ( = ?auto_101087 ?auto_101091 ) ) ( not ( = ?auto_101088 ?auto_101091 ) ) ( not ( = ?auto_101089 ?auto_101091 ) ) ( not ( = ?auto_101090 ?auto_101091 ) ) ( ON ?auto_101089 ?auto_101090 ) ( ON-TABLE ?auto_101091 ) ( ON ?auto_101088 ?auto_101089 ) ( ON ?auto_101087 ?auto_101088 ) ( ON ?auto_101086 ?auto_101087 ) ( CLEAR ?auto_101086 ) ( HOLDING ?auto_101085 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101085 )
      ( MAKE-6PILE ?auto_101085 ?auto_101086 ?auto_101087 ?auto_101088 ?auto_101089 ?auto_101090 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101092 - BLOCK
      ?auto_101093 - BLOCK
      ?auto_101094 - BLOCK
      ?auto_101095 - BLOCK
      ?auto_101096 - BLOCK
      ?auto_101097 - BLOCK
    )
    :vars
    (
      ?auto_101098 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101092 ?auto_101093 ) ) ( not ( = ?auto_101092 ?auto_101094 ) ) ( not ( = ?auto_101092 ?auto_101095 ) ) ( not ( = ?auto_101092 ?auto_101096 ) ) ( not ( = ?auto_101092 ?auto_101097 ) ) ( not ( = ?auto_101093 ?auto_101094 ) ) ( not ( = ?auto_101093 ?auto_101095 ) ) ( not ( = ?auto_101093 ?auto_101096 ) ) ( not ( = ?auto_101093 ?auto_101097 ) ) ( not ( = ?auto_101094 ?auto_101095 ) ) ( not ( = ?auto_101094 ?auto_101096 ) ) ( not ( = ?auto_101094 ?auto_101097 ) ) ( not ( = ?auto_101095 ?auto_101096 ) ) ( not ( = ?auto_101095 ?auto_101097 ) ) ( not ( = ?auto_101096 ?auto_101097 ) ) ( ON ?auto_101097 ?auto_101098 ) ( not ( = ?auto_101092 ?auto_101098 ) ) ( not ( = ?auto_101093 ?auto_101098 ) ) ( not ( = ?auto_101094 ?auto_101098 ) ) ( not ( = ?auto_101095 ?auto_101098 ) ) ( not ( = ?auto_101096 ?auto_101098 ) ) ( not ( = ?auto_101097 ?auto_101098 ) ) ( ON ?auto_101096 ?auto_101097 ) ( ON-TABLE ?auto_101098 ) ( ON ?auto_101095 ?auto_101096 ) ( ON ?auto_101094 ?auto_101095 ) ( ON ?auto_101093 ?auto_101094 ) ( ON ?auto_101092 ?auto_101093 ) ( CLEAR ?auto_101092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_101098 ?auto_101097 ?auto_101096 ?auto_101095 ?auto_101094 ?auto_101093 )
      ( MAKE-6PILE ?auto_101092 ?auto_101093 ?auto_101094 ?auto_101095 ?auto_101096 ?auto_101097 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101099 - BLOCK
      ?auto_101100 - BLOCK
      ?auto_101101 - BLOCK
      ?auto_101102 - BLOCK
      ?auto_101103 - BLOCK
      ?auto_101104 - BLOCK
    )
    :vars
    (
      ?auto_101105 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101099 ?auto_101100 ) ) ( not ( = ?auto_101099 ?auto_101101 ) ) ( not ( = ?auto_101099 ?auto_101102 ) ) ( not ( = ?auto_101099 ?auto_101103 ) ) ( not ( = ?auto_101099 ?auto_101104 ) ) ( not ( = ?auto_101100 ?auto_101101 ) ) ( not ( = ?auto_101100 ?auto_101102 ) ) ( not ( = ?auto_101100 ?auto_101103 ) ) ( not ( = ?auto_101100 ?auto_101104 ) ) ( not ( = ?auto_101101 ?auto_101102 ) ) ( not ( = ?auto_101101 ?auto_101103 ) ) ( not ( = ?auto_101101 ?auto_101104 ) ) ( not ( = ?auto_101102 ?auto_101103 ) ) ( not ( = ?auto_101102 ?auto_101104 ) ) ( not ( = ?auto_101103 ?auto_101104 ) ) ( ON ?auto_101104 ?auto_101105 ) ( not ( = ?auto_101099 ?auto_101105 ) ) ( not ( = ?auto_101100 ?auto_101105 ) ) ( not ( = ?auto_101101 ?auto_101105 ) ) ( not ( = ?auto_101102 ?auto_101105 ) ) ( not ( = ?auto_101103 ?auto_101105 ) ) ( not ( = ?auto_101104 ?auto_101105 ) ) ( ON ?auto_101103 ?auto_101104 ) ( ON-TABLE ?auto_101105 ) ( ON ?auto_101102 ?auto_101103 ) ( ON ?auto_101101 ?auto_101102 ) ( ON ?auto_101100 ?auto_101101 ) ( HOLDING ?auto_101099 ) ( CLEAR ?auto_101100 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_101105 ?auto_101104 ?auto_101103 ?auto_101102 ?auto_101101 ?auto_101100 ?auto_101099 )
      ( MAKE-6PILE ?auto_101099 ?auto_101100 ?auto_101101 ?auto_101102 ?auto_101103 ?auto_101104 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101106 - BLOCK
      ?auto_101107 - BLOCK
      ?auto_101108 - BLOCK
      ?auto_101109 - BLOCK
      ?auto_101110 - BLOCK
      ?auto_101111 - BLOCK
    )
    :vars
    (
      ?auto_101112 - BLOCK
      ?auto_101113 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101106 ?auto_101107 ) ) ( not ( = ?auto_101106 ?auto_101108 ) ) ( not ( = ?auto_101106 ?auto_101109 ) ) ( not ( = ?auto_101106 ?auto_101110 ) ) ( not ( = ?auto_101106 ?auto_101111 ) ) ( not ( = ?auto_101107 ?auto_101108 ) ) ( not ( = ?auto_101107 ?auto_101109 ) ) ( not ( = ?auto_101107 ?auto_101110 ) ) ( not ( = ?auto_101107 ?auto_101111 ) ) ( not ( = ?auto_101108 ?auto_101109 ) ) ( not ( = ?auto_101108 ?auto_101110 ) ) ( not ( = ?auto_101108 ?auto_101111 ) ) ( not ( = ?auto_101109 ?auto_101110 ) ) ( not ( = ?auto_101109 ?auto_101111 ) ) ( not ( = ?auto_101110 ?auto_101111 ) ) ( ON ?auto_101111 ?auto_101112 ) ( not ( = ?auto_101106 ?auto_101112 ) ) ( not ( = ?auto_101107 ?auto_101112 ) ) ( not ( = ?auto_101108 ?auto_101112 ) ) ( not ( = ?auto_101109 ?auto_101112 ) ) ( not ( = ?auto_101110 ?auto_101112 ) ) ( not ( = ?auto_101111 ?auto_101112 ) ) ( ON ?auto_101110 ?auto_101111 ) ( ON-TABLE ?auto_101112 ) ( ON ?auto_101109 ?auto_101110 ) ( ON ?auto_101108 ?auto_101109 ) ( ON ?auto_101107 ?auto_101108 ) ( CLEAR ?auto_101107 ) ( ON ?auto_101106 ?auto_101113 ) ( CLEAR ?auto_101106 ) ( HAND-EMPTY ) ( not ( = ?auto_101106 ?auto_101113 ) ) ( not ( = ?auto_101107 ?auto_101113 ) ) ( not ( = ?auto_101108 ?auto_101113 ) ) ( not ( = ?auto_101109 ?auto_101113 ) ) ( not ( = ?auto_101110 ?auto_101113 ) ) ( not ( = ?auto_101111 ?auto_101113 ) ) ( not ( = ?auto_101112 ?auto_101113 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_101106 ?auto_101113 )
      ( MAKE-6PILE ?auto_101106 ?auto_101107 ?auto_101108 ?auto_101109 ?auto_101110 ?auto_101111 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101114 - BLOCK
      ?auto_101115 - BLOCK
      ?auto_101116 - BLOCK
      ?auto_101117 - BLOCK
      ?auto_101118 - BLOCK
      ?auto_101119 - BLOCK
    )
    :vars
    (
      ?auto_101121 - BLOCK
      ?auto_101120 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101114 ?auto_101115 ) ) ( not ( = ?auto_101114 ?auto_101116 ) ) ( not ( = ?auto_101114 ?auto_101117 ) ) ( not ( = ?auto_101114 ?auto_101118 ) ) ( not ( = ?auto_101114 ?auto_101119 ) ) ( not ( = ?auto_101115 ?auto_101116 ) ) ( not ( = ?auto_101115 ?auto_101117 ) ) ( not ( = ?auto_101115 ?auto_101118 ) ) ( not ( = ?auto_101115 ?auto_101119 ) ) ( not ( = ?auto_101116 ?auto_101117 ) ) ( not ( = ?auto_101116 ?auto_101118 ) ) ( not ( = ?auto_101116 ?auto_101119 ) ) ( not ( = ?auto_101117 ?auto_101118 ) ) ( not ( = ?auto_101117 ?auto_101119 ) ) ( not ( = ?auto_101118 ?auto_101119 ) ) ( ON ?auto_101119 ?auto_101121 ) ( not ( = ?auto_101114 ?auto_101121 ) ) ( not ( = ?auto_101115 ?auto_101121 ) ) ( not ( = ?auto_101116 ?auto_101121 ) ) ( not ( = ?auto_101117 ?auto_101121 ) ) ( not ( = ?auto_101118 ?auto_101121 ) ) ( not ( = ?auto_101119 ?auto_101121 ) ) ( ON ?auto_101118 ?auto_101119 ) ( ON-TABLE ?auto_101121 ) ( ON ?auto_101117 ?auto_101118 ) ( ON ?auto_101116 ?auto_101117 ) ( ON ?auto_101114 ?auto_101120 ) ( CLEAR ?auto_101114 ) ( not ( = ?auto_101114 ?auto_101120 ) ) ( not ( = ?auto_101115 ?auto_101120 ) ) ( not ( = ?auto_101116 ?auto_101120 ) ) ( not ( = ?auto_101117 ?auto_101120 ) ) ( not ( = ?auto_101118 ?auto_101120 ) ) ( not ( = ?auto_101119 ?auto_101120 ) ) ( not ( = ?auto_101121 ?auto_101120 ) ) ( HOLDING ?auto_101115 ) ( CLEAR ?auto_101116 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_101121 ?auto_101119 ?auto_101118 ?auto_101117 ?auto_101116 ?auto_101115 )
      ( MAKE-6PILE ?auto_101114 ?auto_101115 ?auto_101116 ?auto_101117 ?auto_101118 ?auto_101119 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101122 - BLOCK
      ?auto_101123 - BLOCK
      ?auto_101124 - BLOCK
      ?auto_101125 - BLOCK
      ?auto_101126 - BLOCK
      ?auto_101127 - BLOCK
    )
    :vars
    (
      ?auto_101129 - BLOCK
      ?auto_101128 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101122 ?auto_101123 ) ) ( not ( = ?auto_101122 ?auto_101124 ) ) ( not ( = ?auto_101122 ?auto_101125 ) ) ( not ( = ?auto_101122 ?auto_101126 ) ) ( not ( = ?auto_101122 ?auto_101127 ) ) ( not ( = ?auto_101123 ?auto_101124 ) ) ( not ( = ?auto_101123 ?auto_101125 ) ) ( not ( = ?auto_101123 ?auto_101126 ) ) ( not ( = ?auto_101123 ?auto_101127 ) ) ( not ( = ?auto_101124 ?auto_101125 ) ) ( not ( = ?auto_101124 ?auto_101126 ) ) ( not ( = ?auto_101124 ?auto_101127 ) ) ( not ( = ?auto_101125 ?auto_101126 ) ) ( not ( = ?auto_101125 ?auto_101127 ) ) ( not ( = ?auto_101126 ?auto_101127 ) ) ( ON ?auto_101127 ?auto_101129 ) ( not ( = ?auto_101122 ?auto_101129 ) ) ( not ( = ?auto_101123 ?auto_101129 ) ) ( not ( = ?auto_101124 ?auto_101129 ) ) ( not ( = ?auto_101125 ?auto_101129 ) ) ( not ( = ?auto_101126 ?auto_101129 ) ) ( not ( = ?auto_101127 ?auto_101129 ) ) ( ON ?auto_101126 ?auto_101127 ) ( ON-TABLE ?auto_101129 ) ( ON ?auto_101125 ?auto_101126 ) ( ON ?auto_101124 ?auto_101125 ) ( ON ?auto_101122 ?auto_101128 ) ( not ( = ?auto_101122 ?auto_101128 ) ) ( not ( = ?auto_101123 ?auto_101128 ) ) ( not ( = ?auto_101124 ?auto_101128 ) ) ( not ( = ?auto_101125 ?auto_101128 ) ) ( not ( = ?auto_101126 ?auto_101128 ) ) ( not ( = ?auto_101127 ?auto_101128 ) ) ( not ( = ?auto_101129 ?auto_101128 ) ) ( CLEAR ?auto_101124 ) ( ON ?auto_101123 ?auto_101122 ) ( CLEAR ?auto_101123 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_101128 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101128 ?auto_101122 )
      ( MAKE-6PILE ?auto_101122 ?auto_101123 ?auto_101124 ?auto_101125 ?auto_101126 ?auto_101127 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101130 - BLOCK
      ?auto_101131 - BLOCK
      ?auto_101132 - BLOCK
      ?auto_101133 - BLOCK
      ?auto_101134 - BLOCK
      ?auto_101135 - BLOCK
    )
    :vars
    (
      ?auto_101136 - BLOCK
      ?auto_101137 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101130 ?auto_101131 ) ) ( not ( = ?auto_101130 ?auto_101132 ) ) ( not ( = ?auto_101130 ?auto_101133 ) ) ( not ( = ?auto_101130 ?auto_101134 ) ) ( not ( = ?auto_101130 ?auto_101135 ) ) ( not ( = ?auto_101131 ?auto_101132 ) ) ( not ( = ?auto_101131 ?auto_101133 ) ) ( not ( = ?auto_101131 ?auto_101134 ) ) ( not ( = ?auto_101131 ?auto_101135 ) ) ( not ( = ?auto_101132 ?auto_101133 ) ) ( not ( = ?auto_101132 ?auto_101134 ) ) ( not ( = ?auto_101132 ?auto_101135 ) ) ( not ( = ?auto_101133 ?auto_101134 ) ) ( not ( = ?auto_101133 ?auto_101135 ) ) ( not ( = ?auto_101134 ?auto_101135 ) ) ( ON ?auto_101135 ?auto_101136 ) ( not ( = ?auto_101130 ?auto_101136 ) ) ( not ( = ?auto_101131 ?auto_101136 ) ) ( not ( = ?auto_101132 ?auto_101136 ) ) ( not ( = ?auto_101133 ?auto_101136 ) ) ( not ( = ?auto_101134 ?auto_101136 ) ) ( not ( = ?auto_101135 ?auto_101136 ) ) ( ON ?auto_101134 ?auto_101135 ) ( ON-TABLE ?auto_101136 ) ( ON ?auto_101133 ?auto_101134 ) ( ON ?auto_101130 ?auto_101137 ) ( not ( = ?auto_101130 ?auto_101137 ) ) ( not ( = ?auto_101131 ?auto_101137 ) ) ( not ( = ?auto_101132 ?auto_101137 ) ) ( not ( = ?auto_101133 ?auto_101137 ) ) ( not ( = ?auto_101134 ?auto_101137 ) ) ( not ( = ?auto_101135 ?auto_101137 ) ) ( not ( = ?auto_101136 ?auto_101137 ) ) ( ON ?auto_101131 ?auto_101130 ) ( CLEAR ?auto_101131 ) ( ON-TABLE ?auto_101137 ) ( HOLDING ?auto_101132 ) ( CLEAR ?auto_101133 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_101136 ?auto_101135 ?auto_101134 ?auto_101133 ?auto_101132 )
      ( MAKE-6PILE ?auto_101130 ?auto_101131 ?auto_101132 ?auto_101133 ?auto_101134 ?auto_101135 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101138 - BLOCK
      ?auto_101139 - BLOCK
      ?auto_101140 - BLOCK
      ?auto_101141 - BLOCK
      ?auto_101142 - BLOCK
      ?auto_101143 - BLOCK
    )
    :vars
    (
      ?auto_101144 - BLOCK
      ?auto_101145 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101138 ?auto_101139 ) ) ( not ( = ?auto_101138 ?auto_101140 ) ) ( not ( = ?auto_101138 ?auto_101141 ) ) ( not ( = ?auto_101138 ?auto_101142 ) ) ( not ( = ?auto_101138 ?auto_101143 ) ) ( not ( = ?auto_101139 ?auto_101140 ) ) ( not ( = ?auto_101139 ?auto_101141 ) ) ( not ( = ?auto_101139 ?auto_101142 ) ) ( not ( = ?auto_101139 ?auto_101143 ) ) ( not ( = ?auto_101140 ?auto_101141 ) ) ( not ( = ?auto_101140 ?auto_101142 ) ) ( not ( = ?auto_101140 ?auto_101143 ) ) ( not ( = ?auto_101141 ?auto_101142 ) ) ( not ( = ?auto_101141 ?auto_101143 ) ) ( not ( = ?auto_101142 ?auto_101143 ) ) ( ON ?auto_101143 ?auto_101144 ) ( not ( = ?auto_101138 ?auto_101144 ) ) ( not ( = ?auto_101139 ?auto_101144 ) ) ( not ( = ?auto_101140 ?auto_101144 ) ) ( not ( = ?auto_101141 ?auto_101144 ) ) ( not ( = ?auto_101142 ?auto_101144 ) ) ( not ( = ?auto_101143 ?auto_101144 ) ) ( ON ?auto_101142 ?auto_101143 ) ( ON-TABLE ?auto_101144 ) ( ON ?auto_101141 ?auto_101142 ) ( ON ?auto_101138 ?auto_101145 ) ( not ( = ?auto_101138 ?auto_101145 ) ) ( not ( = ?auto_101139 ?auto_101145 ) ) ( not ( = ?auto_101140 ?auto_101145 ) ) ( not ( = ?auto_101141 ?auto_101145 ) ) ( not ( = ?auto_101142 ?auto_101145 ) ) ( not ( = ?auto_101143 ?auto_101145 ) ) ( not ( = ?auto_101144 ?auto_101145 ) ) ( ON ?auto_101139 ?auto_101138 ) ( ON-TABLE ?auto_101145 ) ( CLEAR ?auto_101141 ) ( ON ?auto_101140 ?auto_101139 ) ( CLEAR ?auto_101140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101145 ?auto_101138 ?auto_101139 )
      ( MAKE-6PILE ?auto_101138 ?auto_101139 ?auto_101140 ?auto_101141 ?auto_101142 ?auto_101143 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101146 - BLOCK
      ?auto_101147 - BLOCK
      ?auto_101148 - BLOCK
      ?auto_101149 - BLOCK
      ?auto_101150 - BLOCK
      ?auto_101151 - BLOCK
    )
    :vars
    (
      ?auto_101153 - BLOCK
      ?auto_101152 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101146 ?auto_101147 ) ) ( not ( = ?auto_101146 ?auto_101148 ) ) ( not ( = ?auto_101146 ?auto_101149 ) ) ( not ( = ?auto_101146 ?auto_101150 ) ) ( not ( = ?auto_101146 ?auto_101151 ) ) ( not ( = ?auto_101147 ?auto_101148 ) ) ( not ( = ?auto_101147 ?auto_101149 ) ) ( not ( = ?auto_101147 ?auto_101150 ) ) ( not ( = ?auto_101147 ?auto_101151 ) ) ( not ( = ?auto_101148 ?auto_101149 ) ) ( not ( = ?auto_101148 ?auto_101150 ) ) ( not ( = ?auto_101148 ?auto_101151 ) ) ( not ( = ?auto_101149 ?auto_101150 ) ) ( not ( = ?auto_101149 ?auto_101151 ) ) ( not ( = ?auto_101150 ?auto_101151 ) ) ( ON ?auto_101151 ?auto_101153 ) ( not ( = ?auto_101146 ?auto_101153 ) ) ( not ( = ?auto_101147 ?auto_101153 ) ) ( not ( = ?auto_101148 ?auto_101153 ) ) ( not ( = ?auto_101149 ?auto_101153 ) ) ( not ( = ?auto_101150 ?auto_101153 ) ) ( not ( = ?auto_101151 ?auto_101153 ) ) ( ON ?auto_101150 ?auto_101151 ) ( ON-TABLE ?auto_101153 ) ( ON ?auto_101146 ?auto_101152 ) ( not ( = ?auto_101146 ?auto_101152 ) ) ( not ( = ?auto_101147 ?auto_101152 ) ) ( not ( = ?auto_101148 ?auto_101152 ) ) ( not ( = ?auto_101149 ?auto_101152 ) ) ( not ( = ?auto_101150 ?auto_101152 ) ) ( not ( = ?auto_101151 ?auto_101152 ) ) ( not ( = ?auto_101153 ?auto_101152 ) ) ( ON ?auto_101147 ?auto_101146 ) ( ON-TABLE ?auto_101152 ) ( ON ?auto_101148 ?auto_101147 ) ( CLEAR ?auto_101148 ) ( HOLDING ?auto_101149 ) ( CLEAR ?auto_101150 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_101153 ?auto_101151 ?auto_101150 ?auto_101149 )
      ( MAKE-6PILE ?auto_101146 ?auto_101147 ?auto_101148 ?auto_101149 ?auto_101150 ?auto_101151 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101154 - BLOCK
      ?auto_101155 - BLOCK
      ?auto_101156 - BLOCK
      ?auto_101157 - BLOCK
      ?auto_101158 - BLOCK
      ?auto_101159 - BLOCK
    )
    :vars
    (
      ?auto_101160 - BLOCK
      ?auto_101161 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101154 ?auto_101155 ) ) ( not ( = ?auto_101154 ?auto_101156 ) ) ( not ( = ?auto_101154 ?auto_101157 ) ) ( not ( = ?auto_101154 ?auto_101158 ) ) ( not ( = ?auto_101154 ?auto_101159 ) ) ( not ( = ?auto_101155 ?auto_101156 ) ) ( not ( = ?auto_101155 ?auto_101157 ) ) ( not ( = ?auto_101155 ?auto_101158 ) ) ( not ( = ?auto_101155 ?auto_101159 ) ) ( not ( = ?auto_101156 ?auto_101157 ) ) ( not ( = ?auto_101156 ?auto_101158 ) ) ( not ( = ?auto_101156 ?auto_101159 ) ) ( not ( = ?auto_101157 ?auto_101158 ) ) ( not ( = ?auto_101157 ?auto_101159 ) ) ( not ( = ?auto_101158 ?auto_101159 ) ) ( ON ?auto_101159 ?auto_101160 ) ( not ( = ?auto_101154 ?auto_101160 ) ) ( not ( = ?auto_101155 ?auto_101160 ) ) ( not ( = ?auto_101156 ?auto_101160 ) ) ( not ( = ?auto_101157 ?auto_101160 ) ) ( not ( = ?auto_101158 ?auto_101160 ) ) ( not ( = ?auto_101159 ?auto_101160 ) ) ( ON ?auto_101158 ?auto_101159 ) ( ON-TABLE ?auto_101160 ) ( ON ?auto_101154 ?auto_101161 ) ( not ( = ?auto_101154 ?auto_101161 ) ) ( not ( = ?auto_101155 ?auto_101161 ) ) ( not ( = ?auto_101156 ?auto_101161 ) ) ( not ( = ?auto_101157 ?auto_101161 ) ) ( not ( = ?auto_101158 ?auto_101161 ) ) ( not ( = ?auto_101159 ?auto_101161 ) ) ( not ( = ?auto_101160 ?auto_101161 ) ) ( ON ?auto_101155 ?auto_101154 ) ( ON-TABLE ?auto_101161 ) ( ON ?auto_101156 ?auto_101155 ) ( CLEAR ?auto_101158 ) ( ON ?auto_101157 ?auto_101156 ) ( CLEAR ?auto_101157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_101161 ?auto_101154 ?auto_101155 ?auto_101156 )
      ( MAKE-6PILE ?auto_101154 ?auto_101155 ?auto_101156 ?auto_101157 ?auto_101158 ?auto_101159 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101162 - BLOCK
      ?auto_101163 - BLOCK
      ?auto_101164 - BLOCK
      ?auto_101165 - BLOCK
      ?auto_101166 - BLOCK
      ?auto_101167 - BLOCK
    )
    :vars
    (
      ?auto_101168 - BLOCK
      ?auto_101169 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101162 ?auto_101163 ) ) ( not ( = ?auto_101162 ?auto_101164 ) ) ( not ( = ?auto_101162 ?auto_101165 ) ) ( not ( = ?auto_101162 ?auto_101166 ) ) ( not ( = ?auto_101162 ?auto_101167 ) ) ( not ( = ?auto_101163 ?auto_101164 ) ) ( not ( = ?auto_101163 ?auto_101165 ) ) ( not ( = ?auto_101163 ?auto_101166 ) ) ( not ( = ?auto_101163 ?auto_101167 ) ) ( not ( = ?auto_101164 ?auto_101165 ) ) ( not ( = ?auto_101164 ?auto_101166 ) ) ( not ( = ?auto_101164 ?auto_101167 ) ) ( not ( = ?auto_101165 ?auto_101166 ) ) ( not ( = ?auto_101165 ?auto_101167 ) ) ( not ( = ?auto_101166 ?auto_101167 ) ) ( ON ?auto_101167 ?auto_101168 ) ( not ( = ?auto_101162 ?auto_101168 ) ) ( not ( = ?auto_101163 ?auto_101168 ) ) ( not ( = ?auto_101164 ?auto_101168 ) ) ( not ( = ?auto_101165 ?auto_101168 ) ) ( not ( = ?auto_101166 ?auto_101168 ) ) ( not ( = ?auto_101167 ?auto_101168 ) ) ( ON-TABLE ?auto_101168 ) ( ON ?auto_101162 ?auto_101169 ) ( not ( = ?auto_101162 ?auto_101169 ) ) ( not ( = ?auto_101163 ?auto_101169 ) ) ( not ( = ?auto_101164 ?auto_101169 ) ) ( not ( = ?auto_101165 ?auto_101169 ) ) ( not ( = ?auto_101166 ?auto_101169 ) ) ( not ( = ?auto_101167 ?auto_101169 ) ) ( not ( = ?auto_101168 ?auto_101169 ) ) ( ON ?auto_101163 ?auto_101162 ) ( ON-TABLE ?auto_101169 ) ( ON ?auto_101164 ?auto_101163 ) ( ON ?auto_101165 ?auto_101164 ) ( CLEAR ?auto_101165 ) ( HOLDING ?auto_101166 ) ( CLEAR ?auto_101167 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101168 ?auto_101167 ?auto_101166 )
      ( MAKE-6PILE ?auto_101162 ?auto_101163 ?auto_101164 ?auto_101165 ?auto_101166 ?auto_101167 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101170 - BLOCK
      ?auto_101171 - BLOCK
      ?auto_101172 - BLOCK
      ?auto_101173 - BLOCK
      ?auto_101174 - BLOCK
      ?auto_101175 - BLOCK
    )
    :vars
    (
      ?auto_101177 - BLOCK
      ?auto_101176 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101170 ?auto_101171 ) ) ( not ( = ?auto_101170 ?auto_101172 ) ) ( not ( = ?auto_101170 ?auto_101173 ) ) ( not ( = ?auto_101170 ?auto_101174 ) ) ( not ( = ?auto_101170 ?auto_101175 ) ) ( not ( = ?auto_101171 ?auto_101172 ) ) ( not ( = ?auto_101171 ?auto_101173 ) ) ( not ( = ?auto_101171 ?auto_101174 ) ) ( not ( = ?auto_101171 ?auto_101175 ) ) ( not ( = ?auto_101172 ?auto_101173 ) ) ( not ( = ?auto_101172 ?auto_101174 ) ) ( not ( = ?auto_101172 ?auto_101175 ) ) ( not ( = ?auto_101173 ?auto_101174 ) ) ( not ( = ?auto_101173 ?auto_101175 ) ) ( not ( = ?auto_101174 ?auto_101175 ) ) ( ON ?auto_101175 ?auto_101177 ) ( not ( = ?auto_101170 ?auto_101177 ) ) ( not ( = ?auto_101171 ?auto_101177 ) ) ( not ( = ?auto_101172 ?auto_101177 ) ) ( not ( = ?auto_101173 ?auto_101177 ) ) ( not ( = ?auto_101174 ?auto_101177 ) ) ( not ( = ?auto_101175 ?auto_101177 ) ) ( ON-TABLE ?auto_101177 ) ( ON ?auto_101170 ?auto_101176 ) ( not ( = ?auto_101170 ?auto_101176 ) ) ( not ( = ?auto_101171 ?auto_101176 ) ) ( not ( = ?auto_101172 ?auto_101176 ) ) ( not ( = ?auto_101173 ?auto_101176 ) ) ( not ( = ?auto_101174 ?auto_101176 ) ) ( not ( = ?auto_101175 ?auto_101176 ) ) ( not ( = ?auto_101177 ?auto_101176 ) ) ( ON ?auto_101171 ?auto_101170 ) ( ON-TABLE ?auto_101176 ) ( ON ?auto_101172 ?auto_101171 ) ( ON ?auto_101173 ?auto_101172 ) ( CLEAR ?auto_101175 ) ( ON ?auto_101174 ?auto_101173 ) ( CLEAR ?auto_101174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_101176 ?auto_101170 ?auto_101171 ?auto_101172 ?auto_101173 )
      ( MAKE-6PILE ?auto_101170 ?auto_101171 ?auto_101172 ?auto_101173 ?auto_101174 ?auto_101175 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101178 - BLOCK
      ?auto_101179 - BLOCK
      ?auto_101180 - BLOCK
      ?auto_101181 - BLOCK
      ?auto_101182 - BLOCK
      ?auto_101183 - BLOCK
    )
    :vars
    (
      ?auto_101185 - BLOCK
      ?auto_101184 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101178 ?auto_101179 ) ) ( not ( = ?auto_101178 ?auto_101180 ) ) ( not ( = ?auto_101178 ?auto_101181 ) ) ( not ( = ?auto_101178 ?auto_101182 ) ) ( not ( = ?auto_101178 ?auto_101183 ) ) ( not ( = ?auto_101179 ?auto_101180 ) ) ( not ( = ?auto_101179 ?auto_101181 ) ) ( not ( = ?auto_101179 ?auto_101182 ) ) ( not ( = ?auto_101179 ?auto_101183 ) ) ( not ( = ?auto_101180 ?auto_101181 ) ) ( not ( = ?auto_101180 ?auto_101182 ) ) ( not ( = ?auto_101180 ?auto_101183 ) ) ( not ( = ?auto_101181 ?auto_101182 ) ) ( not ( = ?auto_101181 ?auto_101183 ) ) ( not ( = ?auto_101182 ?auto_101183 ) ) ( not ( = ?auto_101178 ?auto_101185 ) ) ( not ( = ?auto_101179 ?auto_101185 ) ) ( not ( = ?auto_101180 ?auto_101185 ) ) ( not ( = ?auto_101181 ?auto_101185 ) ) ( not ( = ?auto_101182 ?auto_101185 ) ) ( not ( = ?auto_101183 ?auto_101185 ) ) ( ON-TABLE ?auto_101185 ) ( ON ?auto_101178 ?auto_101184 ) ( not ( = ?auto_101178 ?auto_101184 ) ) ( not ( = ?auto_101179 ?auto_101184 ) ) ( not ( = ?auto_101180 ?auto_101184 ) ) ( not ( = ?auto_101181 ?auto_101184 ) ) ( not ( = ?auto_101182 ?auto_101184 ) ) ( not ( = ?auto_101183 ?auto_101184 ) ) ( not ( = ?auto_101185 ?auto_101184 ) ) ( ON ?auto_101179 ?auto_101178 ) ( ON-TABLE ?auto_101184 ) ( ON ?auto_101180 ?auto_101179 ) ( ON ?auto_101181 ?auto_101180 ) ( ON ?auto_101182 ?auto_101181 ) ( CLEAR ?auto_101182 ) ( HOLDING ?auto_101183 ) ( CLEAR ?auto_101185 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101185 ?auto_101183 )
      ( MAKE-6PILE ?auto_101178 ?auto_101179 ?auto_101180 ?auto_101181 ?auto_101182 ?auto_101183 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101186 - BLOCK
      ?auto_101187 - BLOCK
      ?auto_101188 - BLOCK
      ?auto_101189 - BLOCK
      ?auto_101190 - BLOCK
      ?auto_101191 - BLOCK
    )
    :vars
    (
      ?auto_101193 - BLOCK
      ?auto_101192 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101186 ?auto_101187 ) ) ( not ( = ?auto_101186 ?auto_101188 ) ) ( not ( = ?auto_101186 ?auto_101189 ) ) ( not ( = ?auto_101186 ?auto_101190 ) ) ( not ( = ?auto_101186 ?auto_101191 ) ) ( not ( = ?auto_101187 ?auto_101188 ) ) ( not ( = ?auto_101187 ?auto_101189 ) ) ( not ( = ?auto_101187 ?auto_101190 ) ) ( not ( = ?auto_101187 ?auto_101191 ) ) ( not ( = ?auto_101188 ?auto_101189 ) ) ( not ( = ?auto_101188 ?auto_101190 ) ) ( not ( = ?auto_101188 ?auto_101191 ) ) ( not ( = ?auto_101189 ?auto_101190 ) ) ( not ( = ?auto_101189 ?auto_101191 ) ) ( not ( = ?auto_101190 ?auto_101191 ) ) ( not ( = ?auto_101186 ?auto_101193 ) ) ( not ( = ?auto_101187 ?auto_101193 ) ) ( not ( = ?auto_101188 ?auto_101193 ) ) ( not ( = ?auto_101189 ?auto_101193 ) ) ( not ( = ?auto_101190 ?auto_101193 ) ) ( not ( = ?auto_101191 ?auto_101193 ) ) ( ON-TABLE ?auto_101193 ) ( ON ?auto_101186 ?auto_101192 ) ( not ( = ?auto_101186 ?auto_101192 ) ) ( not ( = ?auto_101187 ?auto_101192 ) ) ( not ( = ?auto_101188 ?auto_101192 ) ) ( not ( = ?auto_101189 ?auto_101192 ) ) ( not ( = ?auto_101190 ?auto_101192 ) ) ( not ( = ?auto_101191 ?auto_101192 ) ) ( not ( = ?auto_101193 ?auto_101192 ) ) ( ON ?auto_101187 ?auto_101186 ) ( ON-TABLE ?auto_101192 ) ( ON ?auto_101188 ?auto_101187 ) ( ON ?auto_101189 ?auto_101188 ) ( ON ?auto_101190 ?auto_101189 ) ( CLEAR ?auto_101193 ) ( ON ?auto_101191 ?auto_101190 ) ( CLEAR ?auto_101191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_101192 ?auto_101186 ?auto_101187 ?auto_101188 ?auto_101189 ?auto_101190 )
      ( MAKE-6PILE ?auto_101186 ?auto_101187 ?auto_101188 ?auto_101189 ?auto_101190 ?auto_101191 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101194 - BLOCK
      ?auto_101195 - BLOCK
      ?auto_101196 - BLOCK
      ?auto_101197 - BLOCK
      ?auto_101198 - BLOCK
      ?auto_101199 - BLOCK
    )
    :vars
    (
      ?auto_101201 - BLOCK
      ?auto_101200 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101194 ?auto_101195 ) ) ( not ( = ?auto_101194 ?auto_101196 ) ) ( not ( = ?auto_101194 ?auto_101197 ) ) ( not ( = ?auto_101194 ?auto_101198 ) ) ( not ( = ?auto_101194 ?auto_101199 ) ) ( not ( = ?auto_101195 ?auto_101196 ) ) ( not ( = ?auto_101195 ?auto_101197 ) ) ( not ( = ?auto_101195 ?auto_101198 ) ) ( not ( = ?auto_101195 ?auto_101199 ) ) ( not ( = ?auto_101196 ?auto_101197 ) ) ( not ( = ?auto_101196 ?auto_101198 ) ) ( not ( = ?auto_101196 ?auto_101199 ) ) ( not ( = ?auto_101197 ?auto_101198 ) ) ( not ( = ?auto_101197 ?auto_101199 ) ) ( not ( = ?auto_101198 ?auto_101199 ) ) ( not ( = ?auto_101194 ?auto_101201 ) ) ( not ( = ?auto_101195 ?auto_101201 ) ) ( not ( = ?auto_101196 ?auto_101201 ) ) ( not ( = ?auto_101197 ?auto_101201 ) ) ( not ( = ?auto_101198 ?auto_101201 ) ) ( not ( = ?auto_101199 ?auto_101201 ) ) ( ON ?auto_101194 ?auto_101200 ) ( not ( = ?auto_101194 ?auto_101200 ) ) ( not ( = ?auto_101195 ?auto_101200 ) ) ( not ( = ?auto_101196 ?auto_101200 ) ) ( not ( = ?auto_101197 ?auto_101200 ) ) ( not ( = ?auto_101198 ?auto_101200 ) ) ( not ( = ?auto_101199 ?auto_101200 ) ) ( not ( = ?auto_101201 ?auto_101200 ) ) ( ON ?auto_101195 ?auto_101194 ) ( ON-TABLE ?auto_101200 ) ( ON ?auto_101196 ?auto_101195 ) ( ON ?auto_101197 ?auto_101196 ) ( ON ?auto_101198 ?auto_101197 ) ( ON ?auto_101199 ?auto_101198 ) ( CLEAR ?auto_101199 ) ( HOLDING ?auto_101201 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101201 )
      ( MAKE-6PILE ?auto_101194 ?auto_101195 ?auto_101196 ?auto_101197 ?auto_101198 ?auto_101199 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101202 - BLOCK
      ?auto_101203 - BLOCK
      ?auto_101204 - BLOCK
      ?auto_101205 - BLOCK
      ?auto_101206 - BLOCK
      ?auto_101207 - BLOCK
    )
    :vars
    (
      ?auto_101209 - BLOCK
      ?auto_101208 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101202 ?auto_101203 ) ) ( not ( = ?auto_101202 ?auto_101204 ) ) ( not ( = ?auto_101202 ?auto_101205 ) ) ( not ( = ?auto_101202 ?auto_101206 ) ) ( not ( = ?auto_101202 ?auto_101207 ) ) ( not ( = ?auto_101203 ?auto_101204 ) ) ( not ( = ?auto_101203 ?auto_101205 ) ) ( not ( = ?auto_101203 ?auto_101206 ) ) ( not ( = ?auto_101203 ?auto_101207 ) ) ( not ( = ?auto_101204 ?auto_101205 ) ) ( not ( = ?auto_101204 ?auto_101206 ) ) ( not ( = ?auto_101204 ?auto_101207 ) ) ( not ( = ?auto_101205 ?auto_101206 ) ) ( not ( = ?auto_101205 ?auto_101207 ) ) ( not ( = ?auto_101206 ?auto_101207 ) ) ( not ( = ?auto_101202 ?auto_101209 ) ) ( not ( = ?auto_101203 ?auto_101209 ) ) ( not ( = ?auto_101204 ?auto_101209 ) ) ( not ( = ?auto_101205 ?auto_101209 ) ) ( not ( = ?auto_101206 ?auto_101209 ) ) ( not ( = ?auto_101207 ?auto_101209 ) ) ( ON ?auto_101202 ?auto_101208 ) ( not ( = ?auto_101202 ?auto_101208 ) ) ( not ( = ?auto_101203 ?auto_101208 ) ) ( not ( = ?auto_101204 ?auto_101208 ) ) ( not ( = ?auto_101205 ?auto_101208 ) ) ( not ( = ?auto_101206 ?auto_101208 ) ) ( not ( = ?auto_101207 ?auto_101208 ) ) ( not ( = ?auto_101209 ?auto_101208 ) ) ( ON ?auto_101203 ?auto_101202 ) ( ON-TABLE ?auto_101208 ) ( ON ?auto_101204 ?auto_101203 ) ( ON ?auto_101205 ?auto_101204 ) ( ON ?auto_101206 ?auto_101205 ) ( ON ?auto_101207 ?auto_101206 ) ( ON ?auto_101209 ?auto_101207 ) ( CLEAR ?auto_101209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_101208 ?auto_101202 ?auto_101203 ?auto_101204 ?auto_101205 ?auto_101206 ?auto_101207 )
      ( MAKE-6PILE ?auto_101202 ?auto_101203 ?auto_101204 ?auto_101205 ?auto_101206 ?auto_101207 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101217 - BLOCK
      ?auto_101218 - BLOCK
      ?auto_101219 - BLOCK
      ?auto_101220 - BLOCK
      ?auto_101221 - BLOCK
      ?auto_101222 - BLOCK
      ?auto_101223 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_101223 ) ( CLEAR ?auto_101222 ) ( ON-TABLE ?auto_101217 ) ( ON ?auto_101218 ?auto_101217 ) ( ON ?auto_101219 ?auto_101218 ) ( ON ?auto_101220 ?auto_101219 ) ( ON ?auto_101221 ?auto_101220 ) ( ON ?auto_101222 ?auto_101221 ) ( not ( = ?auto_101217 ?auto_101218 ) ) ( not ( = ?auto_101217 ?auto_101219 ) ) ( not ( = ?auto_101217 ?auto_101220 ) ) ( not ( = ?auto_101217 ?auto_101221 ) ) ( not ( = ?auto_101217 ?auto_101222 ) ) ( not ( = ?auto_101217 ?auto_101223 ) ) ( not ( = ?auto_101218 ?auto_101219 ) ) ( not ( = ?auto_101218 ?auto_101220 ) ) ( not ( = ?auto_101218 ?auto_101221 ) ) ( not ( = ?auto_101218 ?auto_101222 ) ) ( not ( = ?auto_101218 ?auto_101223 ) ) ( not ( = ?auto_101219 ?auto_101220 ) ) ( not ( = ?auto_101219 ?auto_101221 ) ) ( not ( = ?auto_101219 ?auto_101222 ) ) ( not ( = ?auto_101219 ?auto_101223 ) ) ( not ( = ?auto_101220 ?auto_101221 ) ) ( not ( = ?auto_101220 ?auto_101222 ) ) ( not ( = ?auto_101220 ?auto_101223 ) ) ( not ( = ?auto_101221 ?auto_101222 ) ) ( not ( = ?auto_101221 ?auto_101223 ) ) ( not ( = ?auto_101222 ?auto_101223 ) ) )
    :subtasks
    ( ( !STACK ?auto_101223 ?auto_101222 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101224 - BLOCK
      ?auto_101225 - BLOCK
      ?auto_101226 - BLOCK
      ?auto_101227 - BLOCK
      ?auto_101228 - BLOCK
      ?auto_101229 - BLOCK
      ?auto_101230 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_101229 ) ( ON-TABLE ?auto_101224 ) ( ON ?auto_101225 ?auto_101224 ) ( ON ?auto_101226 ?auto_101225 ) ( ON ?auto_101227 ?auto_101226 ) ( ON ?auto_101228 ?auto_101227 ) ( ON ?auto_101229 ?auto_101228 ) ( not ( = ?auto_101224 ?auto_101225 ) ) ( not ( = ?auto_101224 ?auto_101226 ) ) ( not ( = ?auto_101224 ?auto_101227 ) ) ( not ( = ?auto_101224 ?auto_101228 ) ) ( not ( = ?auto_101224 ?auto_101229 ) ) ( not ( = ?auto_101224 ?auto_101230 ) ) ( not ( = ?auto_101225 ?auto_101226 ) ) ( not ( = ?auto_101225 ?auto_101227 ) ) ( not ( = ?auto_101225 ?auto_101228 ) ) ( not ( = ?auto_101225 ?auto_101229 ) ) ( not ( = ?auto_101225 ?auto_101230 ) ) ( not ( = ?auto_101226 ?auto_101227 ) ) ( not ( = ?auto_101226 ?auto_101228 ) ) ( not ( = ?auto_101226 ?auto_101229 ) ) ( not ( = ?auto_101226 ?auto_101230 ) ) ( not ( = ?auto_101227 ?auto_101228 ) ) ( not ( = ?auto_101227 ?auto_101229 ) ) ( not ( = ?auto_101227 ?auto_101230 ) ) ( not ( = ?auto_101228 ?auto_101229 ) ) ( not ( = ?auto_101228 ?auto_101230 ) ) ( not ( = ?auto_101229 ?auto_101230 ) ) ( ON-TABLE ?auto_101230 ) ( CLEAR ?auto_101230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_101230 )
      ( MAKE-7PILE ?auto_101224 ?auto_101225 ?auto_101226 ?auto_101227 ?auto_101228 ?auto_101229 ?auto_101230 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101231 - BLOCK
      ?auto_101232 - BLOCK
      ?auto_101233 - BLOCK
      ?auto_101234 - BLOCK
      ?auto_101235 - BLOCK
      ?auto_101236 - BLOCK
      ?auto_101237 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101231 ) ( ON ?auto_101232 ?auto_101231 ) ( ON ?auto_101233 ?auto_101232 ) ( ON ?auto_101234 ?auto_101233 ) ( ON ?auto_101235 ?auto_101234 ) ( not ( = ?auto_101231 ?auto_101232 ) ) ( not ( = ?auto_101231 ?auto_101233 ) ) ( not ( = ?auto_101231 ?auto_101234 ) ) ( not ( = ?auto_101231 ?auto_101235 ) ) ( not ( = ?auto_101231 ?auto_101236 ) ) ( not ( = ?auto_101231 ?auto_101237 ) ) ( not ( = ?auto_101232 ?auto_101233 ) ) ( not ( = ?auto_101232 ?auto_101234 ) ) ( not ( = ?auto_101232 ?auto_101235 ) ) ( not ( = ?auto_101232 ?auto_101236 ) ) ( not ( = ?auto_101232 ?auto_101237 ) ) ( not ( = ?auto_101233 ?auto_101234 ) ) ( not ( = ?auto_101233 ?auto_101235 ) ) ( not ( = ?auto_101233 ?auto_101236 ) ) ( not ( = ?auto_101233 ?auto_101237 ) ) ( not ( = ?auto_101234 ?auto_101235 ) ) ( not ( = ?auto_101234 ?auto_101236 ) ) ( not ( = ?auto_101234 ?auto_101237 ) ) ( not ( = ?auto_101235 ?auto_101236 ) ) ( not ( = ?auto_101235 ?auto_101237 ) ) ( not ( = ?auto_101236 ?auto_101237 ) ) ( ON-TABLE ?auto_101237 ) ( CLEAR ?auto_101237 ) ( HOLDING ?auto_101236 ) ( CLEAR ?auto_101235 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_101231 ?auto_101232 ?auto_101233 ?auto_101234 ?auto_101235 ?auto_101236 )
      ( MAKE-7PILE ?auto_101231 ?auto_101232 ?auto_101233 ?auto_101234 ?auto_101235 ?auto_101236 ?auto_101237 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101238 - BLOCK
      ?auto_101239 - BLOCK
      ?auto_101240 - BLOCK
      ?auto_101241 - BLOCK
      ?auto_101242 - BLOCK
      ?auto_101243 - BLOCK
      ?auto_101244 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101238 ) ( ON ?auto_101239 ?auto_101238 ) ( ON ?auto_101240 ?auto_101239 ) ( ON ?auto_101241 ?auto_101240 ) ( ON ?auto_101242 ?auto_101241 ) ( not ( = ?auto_101238 ?auto_101239 ) ) ( not ( = ?auto_101238 ?auto_101240 ) ) ( not ( = ?auto_101238 ?auto_101241 ) ) ( not ( = ?auto_101238 ?auto_101242 ) ) ( not ( = ?auto_101238 ?auto_101243 ) ) ( not ( = ?auto_101238 ?auto_101244 ) ) ( not ( = ?auto_101239 ?auto_101240 ) ) ( not ( = ?auto_101239 ?auto_101241 ) ) ( not ( = ?auto_101239 ?auto_101242 ) ) ( not ( = ?auto_101239 ?auto_101243 ) ) ( not ( = ?auto_101239 ?auto_101244 ) ) ( not ( = ?auto_101240 ?auto_101241 ) ) ( not ( = ?auto_101240 ?auto_101242 ) ) ( not ( = ?auto_101240 ?auto_101243 ) ) ( not ( = ?auto_101240 ?auto_101244 ) ) ( not ( = ?auto_101241 ?auto_101242 ) ) ( not ( = ?auto_101241 ?auto_101243 ) ) ( not ( = ?auto_101241 ?auto_101244 ) ) ( not ( = ?auto_101242 ?auto_101243 ) ) ( not ( = ?auto_101242 ?auto_101244 ) ) ( not ( = ?auto_101243 ?auto_101244 ) ) ( ON-TABLE ?auto_101244 ) ( CLEAR ?auto_101242 ) ( ON ?auto_101243 ?auto_101244 ) ( CLEAR ?auto_101243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101244 )
      ( MAKE-7PILE ?auto_101238 ?auto_101239 ?auto_101240 ?auto_101241 ?auto_101242 ?auto_101243 ?auto_101244 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101245 - BLOCK
      ?auto_101246 - BLOCK
      ?auto_101247 - BLOCK
      ?auto_101248 - BLOCK
      ?auto_101249 - BLOCK
      ?auto_101250 - BLOCK
      ?auto_101251 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101245 ) ( ON ?auto_101246 ?auto_101245 ) ( ON ?auto_101247 ?auto_101246 ) ( ON ?auto_101248 ?auto_101247 ) ( not ( = ?auto_101245 ?auto_101246 ) ) ( not ( = ?auto_101245 ?auto_101247 ) ) ( not ( = ?auto_101245 ?auto_101248 ) ) ( not ( = ?auto_101245 ?auto_101249 ) ) ( not ( = ?auto_101245 ?auto_101250 ) ) ( not ( = ?auto_101245 ?auto_101251 ) ) ( not ( = ?auto_101246 ?auto_101247 ) ) ( not ( = ?auto_101246 ?auto_101248 ) ) ( not ( = ?auto_101246 ?auto_101249 ) ) ( not ( = ?auto_101246 ?auto_101250 ) ) ( not ( = ?auto_101246 ?auto_101251 ) ) ( not ( = ?auto_101247 ?auto_101248 ) ) ( not ( = ?auto_101247 ?auto_101249 ) ) ( not ( = ?auto_101247 ?auto_101250 ) ) ( not ( = ?auto_101247 ?auto_101251 ) ) ( not ( = ?auto_101248 ?auto_101249 ) ) ( not ( = ?auto_101248 ?auto_101250 ) ) ( not ( = ?auto_101248 ?auto_101251 ) ) ( not ( = ?auto_101249 ?auto_101250 ) ) ( not ( = ?auto_101249 ?auto_101251 ) ) ( not ( = ?auto_101250 ?auto_101251 ) ) ( ON-TABLE ?auto_101251 ) ( ON ?auto_101250 ?auto_101251 ) ( CLEAR ?auto_101250 ) ( HOLDING ?auto_101249 ) ( CLEAR ?auto_101248 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_101245 ?auto_101246 ?auto_101247 ?auto_101248 ?auto_101249 )
      ( MAKE-7PILE ?auto_101245 ?auto_101246 ?auto_101247 ?auto_101248 ?auto_101249 ?auto_101250 ?auto_101251 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101252 - BLOCK
      ?auto_101253 - BLOCK
      ?auto_101254 - BLOCK
      ?auto_101255 - BLOCK
      ?auto_101256 - BLOCK
      ?auto_101257 - BLOCK
      ?auto_101258 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101252 ) ( ON ?auto_101253 ?auto_101252 ) ( ON ?auto_101254 ?auto_101253 ) ( ON ?auto_101255 ?auto_101254 ) ( not ( = ?auto_101252 ?auto_101253 ) ) ( not ( = ?auto_101252 ?auto_101254 ) ) ( not ( = ?auto_101252 ?auto_101255 ) ) ( not ( = ?auto_101252 ?auto_101256 ) ) ( not ( = ?auto_101252 ?auto_101257 ) ) ( not ( = ?auto_101252 ?auto_101258 ) ) ( not ( = ?auto_101253 ?auto_101254 ) ) ( not ( = ?auto_101253 ?auto_101255 ) ) ( not ( = ?auto_101253 ?auto_101256 ) ) ( not ( = ?auto_101253 ?auto_101257 ) ) ( not ( = ?auto_101253 ?auto_101258 ) ) ( not ( = ?auto_101254 ?auto_101255 ) ) ( not ( = ?auto_101254 ?auto_101256 ) ) ( not ( = ?auto_101254 ?auto_101257 ) ) ( not ( = ?auto_101254 ?auto_101258 ) ) ( not ( = ?auto_101255 ?auto_101256 ) ) ( not ( = ?auto_101255 ?auto_101257 ) ) ( not ( = ?auto_101255 ?auto_101258 ) ) ( not ( = ?auto_101256 ?auto_101257 ) ) ( not ( = ?auto_101256 ?auto_101258 ) ) ( not ( = ?auto_101257 ?auto_101258 ) ) ( ON-TABLE ?auto_101258 ) ( ON ?auto_101257 ?auto_101258 ) ( CLEAR ?auto_101255 ) ( ON ?auto_101256 ?auto_101257 ) ( CLEAR ?auto_101256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101258 ?auto_101257 )
      ( MAKE-7PILE ?auto_101252 ?auto_101253 ?auto_101254 ?auto_101255 ?auto_101256 ?auto_101257 ?auto_101258 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101259 - BLOCK
      ?auto_101260 - BLOCK
      ?auto_101261 - BLOCK
      ?auto_101262 - BLOCK
      ?auto_101263 - BLOCK
      ?auto_101264 - BLOCK
      ?auto_101265 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101259 ) ( ON ?auto_101260 ?auto_101259 ) ( ON ?auto_101261 ?auto_101260 ) ( not ( = ?auto_101259 ?auto_101260 ) ) ( not ( = ?auto_101259 ?auto_101261 ) ) ( not ( = ?auto_101259 ?auto_101262 ) ) ( not ( = ?auto_101259 ?auto_101263 ) ) ( not ( = ?auto_101259 ?auto_101264 ) ) ( not ( = ?auto_101259 ?auto_101265 ) ) ( not ( = ?auto_101260 ?auto_101261 ) ) ( not ( = ?auto_101260 ?auto_101262 ) ) ( not ( = ?auto_101260 ?auto_101263 ) ) ( not ( = ?auto_101260 ?auto_101264 ) ) ( not ( = ?auto_101260 ?auto_101265 ) ) ( not ( = ?auto_101261 ?auto_101262 ) ) ( not ( = ?auto_101261 ?auto_101263 ) ) ( not ( = ?auto_101261 ?auto_101264 ) ) ( not ( = ?auto_101261 ?auto_101265 ) ) ( not ( = ?auto_101262 ?auto_101263 ) ) ( not ( = ?auto_101262 ?auto_101264 ) ) ( not ( = ?auto_101262 ?auto_101265 ) ) ( not ( = ?auto_101263 ?auto_101264 ) ) ( not ( = ?auto_101263 ?auto_101265 ) ) ( not ( = ?auto_101264 ?auto_101265 ) ) ( ON-TABLE ?auto_101265 ) ( ON ?auto_101264 ?auto_101265 ) ( ON ?auto_101263 ?auto_101264 ) ( CLEAR ?auto_101263 ) ( HOLDING ?auto_101262 ) ( CLEAR ?auto_101261 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_101259 ?auto_101260 ?auto_101261 ?auto_101262 )
      ( MAKE-7PILE ?auto_101259 ?auto_101260 ?auto_101261 ?auto_101262 ?auto_101263 ?auto_101264 ?auto_101265 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101266 - BLOCK
      ?auto_101267 - BLOCK
      ?auto_101268 - BLOCK
      ?auto_101269 - BLOCK
      ?auto_101270 - BLOCK
      ?auto_101271 - BLOCK
      ?auto_101272 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101266 ) ( ON ?auto_101267 ?auto_101266 ) ( ON ?auto_101268 ?auto_101267 ) ( not ( = ?auto_101266 ?auto_101267 ) ) ( not ( = ?auto_101266 ?auto_101268 ) ) ( not ( = ?auto_101266 ?auto_101269 ) ) ( not ( = ?auto_101266 ?auto_101270 ) ) ( not ( = ?auto_101266 ?auto_101271 ) ) ( not ( = ?auto_101266 ?auto_101272 ) ) ( not ( = ?auto_101267 ?auto_101268 ) ) ( not ( = ?auto_101267 ?auto_101269 ) ) ( not ( = ?auto_101267 ?auto_101270 ) ) ( not ( = ?auto_101267 ?auto_101271 ) ) ( not ( = ?auto_101267 ?auto_101272 ) ) ( not ( = ?auto_101268 ?auto_101269 ) ) ( not ( = ?auto_101268 ?auto_101270 ) ) ( not ( = ?auto_101268 ?auto_101271 ) ) ( not ( = ?auto_101268 ?auto_101272 ) ) ( not ( = ?auto_101269 ?auto_101270 ) ) ( not ( = ?auto_101269 ?auto_101271 ) ) ( not ( = ?auto_101269 ?auto_101272 ) ) ( not ( = ?auto_101270 ?auto_101271 ) ) ( not ( = ?auto_101270 ?auto_101272 ) ) ( not ( = ?auto_101271 ?auto_101272 ) ) ( ON-TABLE ?auto_101272 ) ( ON ?auto_101271 ?auto_101272 ) ( ON ?auto_101270 ?auto_101271 ) ( CLEAR ?auto_101268 ) ( ON ?auto_101269 ?auto_101270 ) ( CLEAR ?auto_101269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101272 ?auto_101271 ?auto_101270 )
      ( MAKE-7PILE ?auto_101266 ?auto_101267 ?auto_101268 ?auto_101269 ?auto_101270 ?auto_101271 ?auto_101272 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101273 - BLOCK
      ?auto_101274 - BLOCK
      ?auto_101275 - BLOCK
      ?auto_101276 - BLOCK
      ?auto_101277 - BLOCK
      ?auto_101278 - BLOCK
      ?auto_101279 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101273 ) ( ON ?auto_101274 ?auto_101273 ) ( not ( = ?auto_101273 ?auto_101274 ) ) ( not ( = ?auto_101273 ?auto_101275 ) ) ( not ( = ?auto_101273 ?auto_101276 ) ) ( not ( = ?auto_101273 ?auto_101277 ) ) ( not ( = ?auto_101273 ?auto_101278 ) ) ( not ( = ?auto_101273 ?auto_101279 ) ) ( not ( = ?auto_101274 ?auto_101275 ) ) ( not ( = ?auto_101274 ?auto_101276 ) ) ( not ( = ?auto_101274 ?auto_101277 ) ) ( not ( = ?auto_101274 ?auto_101278 ) ) ( not ( = ?auto_101274 ?auto_101279 ) ) ( not ( = ?auto_101275 ?auto_101276 ) ) ( not ( = ?auto_101275 ?auto_101277 ) ) ( not ( = ?auto_101275 ?auto_101278 ) ) ( not ( = ?auto_101275 ?auto_101279 ) ) ( not ( = ?auto_101276 ?auto_101277 ) ) ( not ( = ?auto_101276 ?auto_101278 ) ) ( not ( = ?auto_101276 ?auto_101279 ) ) ( not ( = ?auto_101277 ?auto_101278 ) ) ( not ( = ?auto_101277 ?auto_101279 ) ) ( not ( = ?auto_101278 ?auto_101279 ) ) ( ON-TABLE ?auto_101279 ) ( ON ?auto_101278 ?auto_101279 ) ( ON ?auto_101277 ?auto_101278 ) ( ON ?auto_101276 ?auto_101277 ) ( CLEAR ?auto_101276 ) ( HOLDING ?auto_101275 ) ( CLEAR ?auto_101274 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101273 ?auto_101274 ?auto_101275 )
      ( MAKE-7PILE ?auto_101273 ?auto_101274 ?auto_101275 ?auto_101276 ?auto_101277 ?auto_101278 ?auto_101279 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101280 - BLOCK
      ?auto_101281 - BLOCK
      ?auto_101282 - BLOCK
      ?auto_101283 - BLOCK
      ?auto_101284 - BLOCK
      ?auto_101285 - BLOCK
      ?auto_101286 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101280 ) ( ON ?auto_101281 ?auto_101280 ) ( not ( = ?auto_101280 ?auto_101281 ) ) ( not ( = ?auto_101280 ?auto_101282 ) ) ( not ( = ?auto_101280 ?auto_101283 ) ) ( not ( = ?auto_101280 ?auto_101284 ) ) ( not ( = ?auto_101280 ?auto_101285 ) ) ( not ( = ?auto_101280 ?auto_101286 ) ) ( not ( = ?auto_101281 ?auto_101282 ) ) ( not ( = ?auto_101281 ?auto_101283 ) ) ( not ( = ?auto_101281 ?auto_101284 ) ) ( not ( = ?auto_101281 ?auto_101285 ) ) ( not ( = ?auto_101281 ?auto_101286 ) ) ( not ( = ?auto_101282 ?auto_101283 ) ) ( not ( = ?auto_101282 ?auto_101284 ) ) ( not ( = ?auto_101282 ?auto_101285 ) ) ( not ( = ?auto_101282 ?auto_101286 ) ) ( not ( = ?auto_101283 ?auto_101284 ) ) ( not ( = ?auto_101283 ?auto_101285 ) ) ( not ( = ?auto_101283 ?auto_101286 ) ) ( not ( = ?auto_101284 ?auto_101285 ) ) ( not ( = ?auto_101284 ?auto_101286 ) ) ( not ( = ?auto_101285 ?auto_101286 ) ) ( ON-TABLE ?auto_101286 ) ( ON ?auto_101285 ?auto_101286 ) ( ON ?auto_101284 ?auto_101285 ) ( ON ?auto_101283 ?auto_101284 ) ( CLEAR ?auto_101281 ) ( ON ?auto_101282 ?auto_101283 ) ( CLEAR ?auto_101282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_101286 ?auto_101285 ?auto_101284 ?auto_101283 )
      ( MAKE-7PILE ?auto_101280 ?auto_101281 ?auto_101282 ?auto_101283 ?auto_101284 ?auto_101285 ?auto_101286 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101287 - BLOCK
      ?auto_101288 - BLOCK
      ?auto_101289 - BLOCK
      ?auto_101290 - BLOCK
      ?auto_101291 - BLOCK
      ?auto_101292 - BLOCK
      ?auto_101293 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101287 ) ( not ( = ?auto_101287 ?auto_101288 ) ) ( not ( = ?auto_101287 ?auto_101289 ) ) ( not ( = ?auto_101287 ?auto_101290 ) ) ( not ( = ?auto_101287 ?auto_101291 ) ) ( not ( = ?auto_101287 ?auto_101292 ) ) ( not ( = ?auto_101287 ?auto_101293 ) ) ( not ( = ?auto_101288 ?auto_101289 ) ) ( not ( = ?auto_101288 ?auto_101290 ) ) ( not ( = ?auto_101288 ?auto_101291 ) ) ( not ( = ?auto_101288 ?auto_101292 ) ) ( not ( = ?auto_101288 ?auto_101293 ) ) ( not ( = ?auto_101289 ?auto_101290 ) ) ( not ( = ?auto_101289 ?auto_101291 ) ) ( not ( = ?auto_101289 ?auto_101292 ) ) ( not ( = ?auto_101289 ?auto_101293 ) ) ( not ( = ?auto_101290 ?auto_101291 ) ) ( not ( = ?auto_101290 ?auto_101292 ) ) ( not ( = ?auto_101290 ?auto_101293 ) ) ( not ( = ?auto_101291 ?auto_101292 ) ) ( not ( = ?auto_101291 ?auto_101293 ) ) ( not ( = ?auto_101292 ?auto_101293 ) ) ( ON-TABLE ?auto_101293 ) ( ON ?auto_101292 ?auto_101293 ) ( ON ?auto_101291 ?auto_101292 ) ( ON ?auto_101290 ?auto_101291 ) ( ON ?auto_101289 ?auto_101290 ) ( CLEAR ?auto_101289 ) ( HOLDING ?auto_101288 ) ( CLEAR ?auto_101287 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101287 ?auto_101288 )
      ( MAKE-7PILE ?auto_101287 ?auto_101288 ?auto_101289 ?auto_101290 ?auto_101291 ?auto_101292 ?auto_101293 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101294 - BLOCK
      ?auto_101295 - BLOCK
      ?auto_101296 - BLOCK
      ?auto_101297 - BLOCK
      ?auto_101298 - BLOCK
      ?auto_101299 - BLOCK
      ?auto_101300 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101294 ) ( not ( = ?auto_101294 ?auto_101295 ) ) ( not ( = ?auto_101294 ?auto_101296 ) ) ( not ( = ?auto_101294 ?auto_101297 ) ) ( not ( = ?auto_101294 ?auto_101298 ) ) ( not ( = ?auto_101294 ?auto_101299 ) ) ( not ( = ?auto_101294 ?auto_101300 ) ) ( not ( = ?auto_101295 ?auto_101296 ) ) ( not ( = ?auto_101295 ?auto_101297 ) ) ( not ( = ?auto_101295 ?auto_101298 ) ) ( not ( = ?auto_101295 ?auto_101299 ) ) ( not ( = ?auto_101295 ?auto_101300 ) ) ( not ( = ?auto_101296 ?auto_101297 ) ) ( not ( = ?auto_101296 ?auto_101298 ) ) ( not ( = ?auto_101296 ?auto_101299 ) ) ( not ( = ?auto_101296 ?auto_101300 ) ) ( not ( = ?auto_101297 ?auto_101298 ) ) ( not ( = ?auto_101297 ?auto_101299 ) ) ( not ( = ?auto_101297 ?auto_101300 ) ) ( not ( = ?auto_101298 ?auto_101299 ) ) ( not ( = ?auto_101298 ?auto_101300 ) ) ( not ( = ?auto_101299 ?auto_101300 ) ) ( ON-TABLE ?auto_101300 ) ( ON ?auto_101299 ?auto_101300 ) ( ON ?auto_101298 ?auto_101299 ) ( ON ?auto_101297 ?auto_101298 ) ( ON ?auto_101296 ?auto_101297 ) ( CLEAR ?auto_101294 ) ( ON ?auto_101295 ?auto_101296 ) ( CLEAR ?auto_101295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_101300 ?auto_101299 ?auto_101298 ?auto_101297 ?auto_101296 )
      ( MAKE-7PILE ?auto_101294 ?auto_101295 ?auto_101296 ?auto_101297 ?auto_101298 ?auto_101299 ?auto_101300 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101301 - BLOCK
      ?auto_101302 - BLOCK
      ?auto_101303 - BLOCK
      ?auto_101304 - BLOCK
      ?auto_101305 - BLOCK
      ?auto_101306 - BLOCK
      ?auto_101307 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101301 ?auto_101302 ) ) ( not ( = ?auto_101301 ?auto_101303 ) ) ( not ( = ?auto_101301 ?auto_101304 ) ) ( not ( = ?auto_101301 ?auto_101305 ) ) ( not ( = ?auto_101301 ?auto_101306 ) ) ( not ( = ?auto_101301 ?auto_101307 ) ) ( not ( = ?auto_101302 ?auto_101303 ) ) ( not ( = ?auto_101302 ?auto_101304 ) ) ( not ( = ?auto_101302 ?auto_101305 ) ) ( not ( = ?auto_101302 ?auto_101306 ) ) ( not ( = ?auto_101302 ?auto_101307 ) ) ( not ( = ?auto_101303 ?auto_101304 ) ) ( not ( = ?auto_101303 ?auto_101305 ) ) ( not ( = ?auto_101303 ?auto_101306 ) ) ( not ( = ?auto_101303 ?auto_101307 ) ) ( not ( = ?auto_101304 ?auto_101305 ) ) ( not ( = ?auto_101304 ?auto_101306 ) ) ( not ( = ?auto_101304 ?auto_101307 ) ) ( not ( = ?auto_101305 ?auto_101306 ) ) ( not ( = ?auto_101305 ?auto_101307 ) ) ( not ( = ?auto_101306 ?auto_101307 ) ) ( ON-TABLE ?auto_101307 ) ( ON ?auto_101306 ?auto_101307 ) ( ON ?auto_101305 ?auto_101306 ) ( ON ?auto_101304 ?auto_101305 ) ( ON ?auto_101303 ?auto_101304 ) ( ON ?auto_101302 ?auto_101303 ) ( CLEAR ?auto_101302 ) ( HOLDING ?auto_101301 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101301 )
      ( MAKE-7PILE ?auto_101301 ?auto_101302 ?auto_101303 ?auto_101304 ?auto_101305 ?auto_101306 ?auto_101307 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101308 - BLOCK
      ?auto_101309 - BLOCK
      ?auto_101310 - BLOCK
      ?auto_101311 - BLOCK
      ?auto_101312 - BLOCK
      ?auto_101313 - BLOCK
      ?auto_101314 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101308 ?auto_101309 ) ) ( not ( = ?auto_101308 ?auto_101310 ) ) ( not ( = ?auto_101308 ?auto_101311 ) ) ( not ( = ?auto_101308 ?auto_101312 ) ) ( not ( = ?auto_101308 ?auto_101313 ) ) ( not ( = ?auto_101308 ?auto_101314 ) ) ( not ( = ?auto_101309 ?auto_101310 ) ) ( not ( = ?auto_101309 ?auto_101311 ) ) ( not ( = ?auto_101309 ?auto_101312 ) ) ( not ( = ?auto_101309 ?auto_101313 ) ) ( not ( = ?auto_101309 ?auto_101314 ) ) ( not ( = ?auto_101310 ?auto_101311 ) ) ( not ( = ?auto_101310 ?auto_101312 ) ) ( not ( = ?auto_101310 ?auto_101313 ) ) ( not ( = ?auto_101310 ?auto_101314 ) ) ( not ( = ?auto_101311 ?auto_101312 ) ) ( not ( = ?auto_101311 ?auto_101313 ) ) ( not ( = ?auto_101311 ?auto_101314 ) ) ( not ( = ?auto_101312 ?auto_101313 ) ) ( not ( = ?auto_101312 ?auto_101314 ) ) ( not ( = ?auto_101313 ?auto_101314 ) ) ( ON-TABLE ?auto_101314 ) ( ON ?auto_101313 ?auto_101314 ) ( ON ?auto_101312 ?auto_101313 ) ( ON ?auto_101311 ?auto_101312 ) ( ON ?auto_101310 ?auto_101311 ) ( ON ?auto_101309 ?auto_101310 ) ( ON ?auto_101308 ?auto_101309 ) ( CLEAR ?auto_101308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_101314 ?auto_101313 ?auto_101312 ?auto_101311 ?auto_101310 ?auto_101309 )
      ( MAKE-7PILE ?auto_101308 ?auto_101309 ?auto_101310 ?auto_101311 ?auto_101312 ?auto_101313 ?auto_101314 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101315 - BLOCK
      ?auto_101316 - BLOCK
      ?auto_101317 - BLOCK
      ?auto_101318 - BLOCK
      ?auto_101319 - BLOCK
      ?auto_101320 - BLOCK
      ?auto_101321 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101315 ?auto_101316 ) ) ( not ( = ?auto_101315 ?auto_101317 ) ) ( not ( = ?auto_101315 ?auto_101318 ) ) ( not ( = ?auto_101315 ?auto_101319 ) ) ( not ( = ?auto_101315 ?auto_101320 ) ) ( not ( = ?auto_101315 ?auto_101321 ) ) ( not ( = ?auto_101316 ?auto_101317 ) ) ( not ( = ?auto_101316 ?auto_101318 ) ) ( not ( = ?auto_101316 ?auto_101319 ) ) ( not ( = ?auto_101316 ?auto_101320 ) ) ( not ( = ?auto_101316 ?auto_101321 ) ) ( not ( = ?auto_101317 ?auto_101318 ) ) ( not ( = ?auto_101317 ?auto_101319 ) ) ( not ( = ?auto_101317 ?auto_101320 ) ) ( not ( = ?auto_101317 ?auto_101321 ) ) ( not ( = ?auto_101318 ?auto_101319 ) ) ( not ( = ?auto_101318 ?auto_101320 ) ) ( not ( = ?auto_101318 ?auto_101321 ) ) ( not ( = ?auto_101319 ?auto_101320 ) ) ( not ( = ?auto_101319 ?auto_101321 ) ) ( not ( = ?auto_101320 ?auto_101321 ) ) ( ON-TABLE ?auto_101321 ) ( ON ?auto_101320 ?auto_101321 ) ( ON ?auto_101319 ?auto_101320 ) ( ON ?auto_101318 ?auto_101319 ) ( ON ?auto_101317 ?auto_101318 ) ( ON ?auto_101316 ?auto_101317 ) ( HOLDING ?auto_101315 ) ( CLEAR ?auto_101316 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_101321 ?auto_101320 ?auto_101319 ?auto_101318 ?auto_101317 ?auto_101316 ?auto_101315 )
      ( MAKE-7PILE ?auto_101315 ?auto_101316 ?auto_101317 ?auto_101318 ?auto_101319 ?auto_101320 ?auto_101321 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101322 - BLOCK
      ?auto_101323 - BLOCK
      ?auto_101324 - BLOCK
      ?auto_101325 - BLOCK
      ?auto_101326 - BLOCK
      ?auto_101327 - BLOCK
      ?auto_101328 - BLOCK
    )
    :vars
    (
      ?auto_101329 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101322 ?auto_101323 ) ) ( not ( = ?auto_101322 ?auto_101324 ) ) ( not ( = ?auto_101322 ?auto_101325 ) ) ( not ( = ?auto_101322 ?auto_101326 ) ) ( not ( = ?auto_101322 ?auto_101327 ) ) ( not ( = ?auto_101322 ?auto_101328 ) ) ( not ( = ?auto_101323 ?auto_101324 ) ) ( not ( = ?auto_101323 ?auto_101325 ) ) ( not ( = ?auto_101323 ?auto_101326 ) ) ( not ( = ?auto_101323 ?auto_101327 ) ) ( not ( = ?auto_101323 ?auto_101328 ) ) ( not ( = ?auto_101324 ?auto_101325 ) ) ( not ( = ?auto_101324 ?auto_101326 ) ) ( not ( = ?auto_101324 ?auto_101327 ) ) ( not ( = ?auto_101324 ?auto_101328 ) ) ( not ( = ?auto_101325 ?auto_101326 ) ) ( not ( = ?auto_101325 ?auto_101327 ) ) ( not ( = ?auto_101325 ?auto_101328 ) ) ( not ( = ?auto_101326 ?auto_101327 ) ) ( not ( = ?auto_101326 ?auto_101328 ) ) ( not ( = ?auto_101327 ?auto_101328 ) ) ( ON-TABLE ?auto_101328 ) ( ON ?auto_101327 ?auto_101328 ) ( ON ?auto_101326 ?auto_101327 ) ( ON ?auto_101325 ?auto_101326 ) ( ON ?auto_101324 ?auto_101325 ) ( ON ?auto_101323 ?auto_101324 ) ( CLEAR ?auto_101323 ) ( ON ?auto_101322 ?auto_101329 ) ( CLEAR ?auto_101322 ) ( HAND-EMPTY ) ( not ( = ?auto_101322 ?auto_101329 ) ) ( not ( = ?auto_101323 ?auto_101329 ) ) ( not ( = ?auto_101324 ?auto_101329 ) ) ( not ( = ?auto_101325 ?auto_101329 ) ) ( not ( = ?auto_101326 ?auto_101329 ) ) ( not ( = ?auto_101327 ?auto_101329 ) ) ( not ( = ?auto_101328 ?auto_101329 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_101322 ?auto_101329 )
      ( MAKE-7PILE ?auto_101322 ?auto_101323 ?auto_101324 ?auto_101325 ?auto_101326 ?auto_101327 ?auto_101328 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101330 - BLOCK
      ?auto_101331 - BLOCK
      ?auto_101332 - BLOCK
      ?auto_101333 - BLOCK
      ?auto_101334 - BLOCK
      ?auto_101335 - BLOCK
      ?auto_101336 - BLOCK
    )
    :vars
    (
      ?auto_101337 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101330 ?auto_101331 ) ) ( not ( = ?auto_101330 ?auto_101332 ) ) ( not ( = ?auto_101330 ?auto_101333 ) ) ( not ( = ?auto_101330 ?auto_101334 ) ) ( not ( = ?auto_101330 ?auto_101335 ) ) ( not ( = ?auto_101330 ?auto_101336 ) ) ( not ( = ?auto_101331 ?auto_101332 ) ) ( not ( = ?auto_101331 ?auto_101333 ) ) ( not ( = ?auto_101331 ?auto_101334 ) ) ( not ( = ?auto_101331 ?auto_101335 ) ) ( not ( = ?auto_101331 ?auto_101336 ) ) ( not ( = ?auto_101332 ?auto_101333 ) ) ( not ( = ?auto_101332 ?auto_101334 ) ) ( not ( = ?auto_101332 ?auto_101335 ) ) ( not ( = ?auto_101332 ?auto_101336 ) ) ( not ( = ?auto_101333 ?auto_101334 ) ) ( not ( = ?auto_101333 ?auto_101335 ) ) ( not ( = ?auto_101333 ?auto_101336 ) ) ( not ( = ?auto_101334 ?auto_101335 ) ) ( not ( = ?auto_101334 ?auto_101336 ) ) ( not ( = ?auto_101335 ?auto_101336 ) ) ( ON-TABLE ?auto_101336 ) ( ON ?auto_101335 ?auto_101336 ) ( ON ?auto_101334 ?auto_101335 ) ( ON ?auto_101333 ?auto_101334 ) ( ON ?auto_101332 ?auto_101333 ) ( ON ?auto_101330 ?auto_101337 ) ( CLEAR ?auto_101330 ) ( not ( = ?auto_101330 ?auto_101337 ) ) ( not ( = ?auto_101331 ?auto_101337 ) ) ( not ( = ?auto_101332 ?auto_101337 ) ) ( not ( = ?auto_101333 ?auto_101337 ) ) ( not ( = ?auto_101334 ?auto_101337 ) ) ( not ( = ?auto_101335 ?auto_101337 ) ) ( not ( = ?auto_101336 ?auto_101337 ) ) ( HOLDING ?auto_101331 ) ( CLEAR ?auto_101332 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_101336 ?auto_101335 ?auto_101334 ?auto_101333 ?auto_101332 ?auto_101331 )
      ( MAKE-7PILE ?auto_101330 ?auto_101331 ?auto_101332 ?auto_101333 ?auto_101334 ?auto_101335 ?auto_101336 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101338 - BLOCK
      ?auto_101339 - BLOCK
      ?auto_101340 - BLOCK
      ?auto_101341 - BLOCK
      ?auto_101342 - BLOCK
      ?auto_101343 - BLOCK
      ?auto_101344 - BLOCK
    )
    :vars
    (
      ?auto_101345 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101338 ?auto_101339 ) ) ( not ( = ?auto_101338 ?auto_101340 ) ) ( not ( = ?auto_101338 ?auto_101341 ) ) ( not ( = ?auto_101338 ?auto_101342 ) ) ( not ( = ?auto_101338 ?auto_101343 ) ) ( not ( = ?auto_101338 ?auto_101344 ) ) ( not ( = ?auto_101339 ?auto_101340 ) ) ( not ( = ?auto_101339 ?auto_101341 ) ) ( not ( = ?auto_101339 ?auto_101342 ) ) ( not ( = ?auto_101339 ?auto_101343 ) ) ( not ( = ?auto_101339 ?auto_101344 ) ) ( not ( = ?auto_101340 ?auto_101341 ) ) ( not ( = ?auto_101340 ?auto_101342 ) ) ( not ( = ?auto_101340 ?auto_101343 ) ) ( not ( = ?auto_101340 ?auto_101344 ) ) ( not ( = ?auto_101341 ?auto_101342 ) ) ( not ( = ?auto_101341 ?auto_101343 ) ) ( not ( = ?auto_101341 ?auto_101344 ) ) ( not ( = ?auto_101342 ?auto_101343 ) ) ( not ( = ?auto_101342 ?auto_101344 ) ) ( not ( = ?auto_101343 ?auto_101344 ) ) ( ON-TABLE ?auto_101344 ) ( ON ?auto_101343 ?auto_101344 ) ( ON ?auto_101342 ?auto_101343 ) ( ON ?auto_101341 ?auto_101342 ) ( ON ?auto_101340 ?auto_101341 ) ( ON ?auto_101338 ?auto_101345 ) ( not ( = ?auto_101338 ?auto_101345 ) ) ( not ( = ?auto_101339 ?auto_101345 ) ) ( not ( = ?auto_101340 ?auto_101345 ) ) ( not ( = ?auto_101341 ?auto_101345 ) ) ( not ( = ?auto_101342 ?auto_101345 ) ) ( not ( = ?auto_101343 ?auto_101345 ) ) ( not ( = ?auto_101344 ?auto_101345 ) ) ( CLEAR ?auto_101340 ) ( ON ?auto_101339 ?auto_101338 ) ( CLEAR ?auto_101339 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_101345 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101345 ?auto_101338 )
      ( MAKE-7PILE ?auto_101338 ?auto_101339 ?auto_101340 ?auto_101341 ?auto_101342 ?auto_101343 ?auto_101344 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101346 - BLOCK
      ?auto_101347 - BLOCK
      ?auto_101348 - BLOCK
      ?auto_101349 - BLOCK
      ?auto_101350 - BLOCK
      ?auto_101351 - BLOCK
      ?auto_101352 - BLOCK
    )
    :vars
    (
      ?auto_101353 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101346 ?auto_101347 ) ) ( not ( = ?auto_101346 ?auto_101348 ) ) ( not ( = ?auto_101346 ?auto_101349 ) ) ( not ( = ?auto_101346 ?auto_101350 ) ) ( not ( = ?auto_101346 ?auto_101351 ) ) ( not ( = ?auto_101346 ?auto_101352 ) ) ( not ( = ?auto_101347 ?auto_101348 ) ) ( not ( = ?auto_101347 ?auto_101349 ) ) ( not ( = ?auto_101347 ?auto_101350 ) ) ( not ( = ?auto_101347 ?auto_101351 ) ) ( not ( = ?auto_101347 ?auto_101352 ) ) ( not ( = ?auto_101348 ?auto_101349 ) ) ( not ( = ?auto_101348 ?auto_101350 ) ) ( not ( = ?auto_101348 ?auto_101351 ) ) ( not ( = ?auto_101348 ?auto_101352 ) ) ( not ( = ?auto_101349 ?auto_101350 ) ) ( not ( = ?auto_101349 ?auto_101351 ) ) ( not ( = ?auto_101349 ?auto_101352 ) ) ( not ( = ?auto_101350 ?auto_101351 ) ) ( not ( = ?auto_101350 ?auto_101352 ) ) ( not ( = ?auto_101351 ?auto_101352 ) ) ( ON-TABLE ?auto_101352 ) ( ON ?auto_101351 ?auto_101352 ) ( ON ?auto_101350 ?auto_101351 ) ( ON ?auto_101349 ?auto_101350 ) ( ON ?auto_101346 ?auto_101353 ) ( not ( = ?auto_101346 ?auto_101353 ) ) ( not ( = ?auto_101347 ?auto_101353 ) ) ( not ( = ?auto_101348 ?auto_101353 ) ) ( not ( = ?auto_101349 ?auto_101353 ) ) ( not ( = ?auto_101350 ?auto_101353 ) ) ( not ( = ?auto_101351 ?auto_101353 ) ) ( not ( = ?auto_101352 ?auto_101353 ) ) ( ON ?auto_101347 ?auto_101346 ) ( CLEAR ?auto_101347 ) ( ON-TABLE ?auto_101353 ) ( HOLDING ?auto_101348 ) ( CLEAR ?auto_101349 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_101352 ?auto_101351 ?auto_101350 ?auto_101349 ?auto_101348 )
      ( MAKE-7PILE ?auto_101346 ?auto_101347 ?auto_101348 ?auto_101349 ?auto_101350 ?auto_101351 ?auto_101352 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101354 - BLOCK
      ?auto_101355 - BLOCK
      ?auto_101356 - BLOCK
      ?auto_101357 - BLOCK
      ?auto_101358 - BLOCK
      ?auto_101359 - BLOCK
      ?auto_101360 - BLOCK
    )
    :vars
    (
      ?auto_101361 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101354 ?auto_101355 ) ) ( not ( = ?auto_101354 ?auto_101356 ) ) ( not ( = ?auto_101354 ?auto_101357 ) ) ( not ( = ?auto_101354 ?auto_101358 ) ) ( not ( = ?auto_101354 ?auto_101359 ) ) ( not ( = ?auto_101354 ?auto_101360 ) ) ( not ( = ?auto_101355 ?auto_101356 ) ) ( not ( = ?auto_101355 ?auto_101357 ) ) ( not ( = ?auto_101355 ?auto_101358 ) ) ( not ( = ?auto_101355 ?auto_101359 ) ) ( not ( = ?auto_101355 ?auto_101360 ) ) ( not ( = ?auto_101356 ?auto_101357 ) ) ( not ( = ?auto_101356 ?auto_101358 ) ) ( not ( = ?auto_101356 ?auto_101359 ) ) ( not ( = ?auto_101356 ?auto_101360 ) ) ( not ( = ?auto_101357 ?auto_101358 ) ) ( not ( = ?auto_101357 ?auto_101359 ) ) ( not ( = ?auto_101357 ?auto_101360 ) ) ( not ( = ?auto_101358 ?auto_101359 ) ) ( not ( = ?auto_101358 ?auto_101360 ) ) ( not ( = ?auto_101359 ?auto_101360 ) ) ( ON-TABLE ?auto_101360 ) ( ON ?auto_101359 ?auto_101360 ) ( ON ?auto_101358 ?auto_101359 ) ( ON ?auto_101357 ?auto_101358 ) ( ON ?auto_101354 ?auto_101361 ) ( not ( = ?auto_101354 ?auto_101361 ) ) ( not ( = ?auto_101355 ?auto_101361 ) ) ( not ( = ?auto_101356 ?auto_101361 ) ) ( not ( = ?auto_101357 ?auto_101361 ) ) ( not ( = ?auto_101358 ?auto_101361 ) ) ( not ( = ?auto_101359 ?auto_101361 ) ) ( not ( = ?auto_101360 ?auto_101361 ) ) ( ON ?auto_101355 ?auto_101354 ) ( ON-TABLE ?auto_101361 ) ( CLEAR ?auto_101357 ) ( ON ?auto_101356 ?auto_101355 ) ( CLEAR ?auto_101356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101361 ?auto_101354 ?auto_101355 )
      ( MAKE-7PILE ?auto_101354 ?auto_101355 ?auto_101356 ?auto_101357 ?auto_101358 ?auto_101359 ?auto_101360 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101362 - BLOCK
      ?auto_101363 - BLOCK
      ?auto_101364 - BLOCK
      ?auto_101365 - BLOCK
      ?auto_101366 - BLOCK
      ?auto_101367 - BLOCK
      ?auto_101368 - BLOCK
    )
    :vars
    (
      ?auto_101369 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101362 ?auto_101363 ) ) ( not ( = ?auto_101362 ?auto_101364 ) ) ( not ( = ?auto_101362 ?auto_101365 ) ) ( not ( = ?auto_101362 ?auto_101366 ) ) ( not ( = ?auto_101362 ?auto_101367 ) ) ( not ( = ?auto_101362 ?auto_101368 ) ) ( not ( = ?auto_101363 ?auto_101364 ) ) ( not ( = ?auto_101363 ?auto_101365 ) ) ( not ( = ?auto_101363 ?auto_101366 ) ) ( not ( = ?auto_101363 ?auto_101367 ) ) ( not ( = ?auto_101363 ?auto_101368 ) ) ( not ( = ?auto_101364 ?auto_101365 ) ) ( not ( = ?auto_101364 ?auto_101366 ) ) ( not ( = ?auto_101364 ?auto_101367 ) ) ( not ( = ?auto_101364 ?auto_101368 ) ) ( not ( = ?auto_101365 ?auto_101366 ) ) ( not ( = ?auto_101365 ?auto_101367 ) ) ( not ( = ?auto_101365 ?auto_101368 ) ) ( not ( = ?auto_101366 ?auto_101367 ) ) ( not ( = ?auto_101366 ?auto_101368 ) ) ( not ( = ?auto_101367 ?auto_101368 ) ) ( ON-TABLE ?auto_101368 ) ( ON ?auto_101367 ?auto_101368 ) ( ON ?auto_101366 ?auto_101367 ) ( ON ?auto_101362 ?auto_101369 ) ( not ( = ?auto_101362 ?auto_101369 ) ) ( not ( = ?auto_101363 ?auto_101369 ) ) ( not ( = ?auto_101364 ?auto_101369 ) ) ( not ( = ?auto_101365 ?auto_101369 ) ) ( not ( = ?auto_101366 ?auto_101369 ) ) ( not ( = ?auto_101367 ?auto_101369 ) ) ( not ( = ?auto_101368 ?auto_101369 ) ) ( ON ?auto_101363 ?auto_101362 ) ( ON-TABLE ?auto_101369 ) ( ON ?auto_101364 ?auto_101363 ) ( CLEAR ?auto_101364 ) ( HOLDING ?auto_101365 ) ( CLEAR ?auto_101366 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_101368 ?auto_101367 ?auto_101366 ?auto_101365 )
      ( MAKE-7PILE ?auto_101362 ?auto_101363 ?auto_101364 ?auto_101365 ?auto_101366 ?auto_101367 ?auto_101368 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101370 - BLOCK
      ?auto_101371 - BLOCK
      ?auto_101372 - BLOCK
      ?auto_101373 - BLOCK
      ?auto_101374 - BLOCK
      ?auto_101375 - BLOCK
      ?auto_101376 - BLOCK
    )
    :vars
    (
      ?auto_101377 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101370 ?auto_101371 ) ) ( not ( = ?auto_101370 ?auto_101372 ) ) ( not ( = ?auto_101370 ?auto_101373 ) ) ( not ( = ?auto_101370 ?auto_101374 ) ) ( not ( = ?auto_101370 ?auto_101375 ) ) ( not ( = ?auto_101370 ?auto_101376 ) ) ( not ( = ?auto_101371 ?auto_101372 ) ) ( not ( = ?auto_101371 ?auto_101373 ) ) ( not ( = ?auto_101371 ?auto_101374 ) ) ( not ( = ?auto_101371 ?auto_101375 ) ) ( not ( = ?auto_101371 ?auto_101376 ) ) ( not ( = ?auto_101372 ?auto_101373 ) ) ( not ( = ?auto_101372 ?auto_101374 ) ) ( not ( = ?auto_101372 ?auto_101375 ) ) ( not ( = ?auto_101372 ?auto_101376 ) ) ( not ( = ?auto_101373 ?auto_101374 ) ) ( not ( = ?auto_101373 ?auto_101375 ) ) ( not ( = ?auto_101373 ?auto_101376 ) ) ( not ( = ?auto_101374 ?auto_101375 ) ) ( not ( = ?auto_101374 ?auto_101376 ) ) ( not ( = ?auto_101375 ?auto_101376 ) ) ( ON-TABLE ?auto_101376 ) ( ON ?auto_101375 ?auto_101376 ) ( ON ?auto_101374 ?auto_101375 ) ( ON ?auto_101370 ?auto_101377 ) ( not ( = ?auto_101370 ?auto_101377 ) ) ( not ( = ?auto_101371 ?auto_101377 ) ) ( not ( = ?auto_101372 ?auto_101377 ) ) ( not ( = ?auto_101373 ?auto_101377 ) ) ( not ( = ?auto_101374 ?auto_101377 ) ) ( not ( = ?auto_101375 ?auto_101377 ) ) ( not ( = ?auto_101376 ?auto_101377 ) ) ( ON ?auto_101371 ?auto_101370 ) ( ON-TABLE ?auto_101377 ) ( ON ?auto_101372 ?auto_101371 ) ( CLEAR ?auto_101374 ) ( ON ?auto_101373 ?auto_101372 ) ( CLEAR ?auto_101373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_101377 ?auto_101370 ?auto_101371 ?auto_101372 )
      ( MAKE-7PILE ?auto_101370 ?auto_101371 ?auto_101372 ?auto_101373 ?auto_101374 ?auto_101375 ?auto_101376 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101378 - BLOCK
      ?auto_101379 - BLOCK
      ?auto_101380 - BLOCK
      ?auto_101381 - BLOCK
      ?auto_101382 - BLOCK
      ?auto_101383 - BLOCK
      ?auto_101384 - BLOCK
    )
    :vars
    (
      ?auto_101385 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101378 ?auto_101379 ) ) ( not ( = ?auto_101378 ?auto_101380 ) ) ( not ( = ?auto_101378 ?auto_101381 ) ) ( not ( = ?auto_101378 ?auto_101382 ) ) ( not ( = ?auto_101378 ?auto_101383 ) ) ( not ( = ?auto_101378 ?auto_101384 ) ) ( not ( = ?auto_101379 ?auto_101380 ) ) ( not ( = ?auto_101379 ?auto_101381 ) ) ( not ( = ?auto_101379 ?auto_101382 ) ) ( not ( = ?auto_101379 ?auto_101383 ) ) ( not ( = ?auto_101379 ?auto_101384 ) ) ( not ( = ?auto_101380 ?auto_101381 ) ) ( not ( = ?auto_101380 ?auto_101382 ) ) ( not ( = ?auto_101380 ?auto_101383 ) ) ( not ( = ?auto_101380 ?auto_101384 ) ) ( not ( = ?auto_101381 ?auto_101382 ) ) ( not ( = ?auto_101381 ?auto_101383 ) ) ( not ( = ?auto_101381 ?auto_101384 ) ) ( not ( = ?auto_101382 ?auto_101383 ) ) ( not ( = ?auto_101382 ?auto_101384 ) ) ( not ( = ?auto_101383 ?auto_101384 ) ) ( ON-TABLE ?auto_101384 ) ( ON ?auto_101383 ?auto_101384 ) ( ON ?auto_101378 ?auto_101385 ) ( not ( = ?auto_101378 ?auto_101385 ) ) ( not ( = ?auto_101379 ?auto_101385 ) ) ( not ( = ?auto_101380 ?auto_101385 ) ) ( not ( = ?auto_101381 ?auto_101385 ) ) ( not ( = ?auto_101382 ?auto_101385 ) ) ( not ( = ?auto_101383 ?auto_101385 ) ) ( not ( = ?auto_101384 ?auto_101385 ) ) ( ON ?auto_101379 ?auto_101378 ) ( ON-TABLE ?auto_101385 ) ( ON ?auto_101380 ?auto_101379 ) ( ON ?auto_101381 ?auto_101380 ) ( CLEAR ?auto_101381 ) ( HOLDING ?auto_101382 ) ( CLEAR ?auto_101383 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101384 ?auto_101383 ?auto_101382 )
      ( MAKE-7PILE ?auto_101378 ?auto_101379 ?auto_101380 ?auto_101381 ?auto_101382 ?auto_101383 ?auto_101384 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101386 - BLOCK
      ?auto_101387 - BLOCK
      ?auto_101388 - BLOCK
      ?auto_101389 - BLOCK
      ?auto_101390 - BLOCK
      ?auto_101391 - BLOCK
      ?auto_101392 - BLOCK
    )
    :vars
    (
      ?auto_101393 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101386 ?auto_101387 ) ) ( not ( = ?auto_101386 ?auto_101388 ) ) ( not ( = ?auto_101386 ?auto_101389 ) ) ( not ( = ?auto_101386 ?auto_101390 ) ) ( not ( = ?auto_101386 ?auto_101391 ) ) ( not ( = ?auto_101386 ?auto_101392 ) ) ( not ( = ?auto_101387 ?auto_101388 ) ) ( not ( = ?auto_101387 ?auto_101389 ) ) ( not ( = ?auto_101387 ?auto_101390 ) ) ( not ( = ?auto_101387 ?auto_101391 ) ) ( not ( = ?auto_101387 ?auto_101392 ) ) ( not ( = ?auto_101388 ?auto_101389 ) ) ( not ( = ?auto_101388 ?auto_101390 ) ) ( not ( = ?auto_101388 ?auto_101391 ) ) ( not ( = ?auto_101388 ?auto_101392 ) ) ( not ( = ?auto_101389 ?auto_101390 ) ) ( not ( = ?auto_101389 ?auto_101391 ) ) ( not ( = ?auto_101389 ?auto_101392 ) ) ( not ( = ?auto_101390 ?auto_101391 ) ) ( not ( = ?auto_101390 ?auto_101392 ) ) ( not ( = ?auto_101391 ?auto_101392 ) ) ( ON-TABLE ?auto_101392 ) ( ON ?auto_101391 ?auto_101392 ) ( ON ?auto_101386 ?auto_101393 ) ( not ( = ?auto_101386 ?auto_101393 ) ) ( not ( = ?auto_101387 ?auto_101393 ) ) ( not ( = ?auto_101388 ?auto_101393 ) ) ( not ( = ?auto_101389 ?auto_101393 ) ) ( not ( = ?auto_101390 ?auto_101393 ) ) ( not ( = ?auto_101391 ?auto_101393 ) ) ( not ( = ?auto_101392 ?auto_101393 ) ) ( ON ?auto_101387 ?auto_101386 ) ( ON-TABLE ?auto_101393 ) ( ON ?auto_101388 ?auto_101387 ) ( ON ?auto_101389 ?auto_101388 ) ( CLEAR ?auto_101391 ) ( ON ?auto_101390 ?auto_101389 ) ( CLEAR ?auto_101390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_101393 ?auto_101386 ?auto_101387 ?auto_101388 ?auto_101389 )
      ( MAKE-7PILE ?auto_101386 ?auto_101387 ?auto_101388 ?auto_101389 ?auto_101390 ?auto_101391 ?auto_101392 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101394 - BLOCK
      ?auto_101395 - BLOCK
      ?auto_101396 - BLOCK
      ?auto_101397 - BLOCK
      ?auto_101398 - BLOCK
      ?auto_101399 - BLOCK
      ?auto_101400 - BLOCK
    )
    :vars
    (
      ?auto_101401 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101394 ?auto_101395 ) ) ( not ( = ?auto_101394 ?auto_101396 ) ) ( not ( = ?auto_101394 ?auto_101397 ) ) ( not ( = ?auto_101394 ?auto_101398 ) ) ( not ( = ?auto_101394 ?auto_101399 ) ) ( not ( = ?auto_101394 ?auto_101400 ) ) ( not ( = ?auto_101395 ?auto_101396 ) ) ( not ( = ?auto_101395 ?auto_101397 ) ) ( not ( = ?auto_101395 ?auto_101398 ) ) ( not ( = ?auto_101395 ?auto_101399 ) ) ( not ( = ?auto_101395 ?auto_101400 ) ) ( not ( = ?auto_101396 ?auto_101397 ) ) ( not ( = ?auto_101396 ?auto_101398 ) ) ( not ( = ?auto_101396 ?auto_101399 ) ) ( not ( = ?auto_101396 ?auto_101400 ) ) ( not ( = ?auto_101397 ?auto_101398 ) ) ( not ( = ?auto_101397 ?auto_101399 ) ) ( not ( = ?auto_101397 ?auto_101400 ) ) ( not ( = ?auto_101398 ?auto_101399 ) ) ( not ( = ?auto_101398 ?auto_101400 ) ) ( not ( = ?auto_101399 ?auto_101400 ) ) ( ON-TABLE ?auto_101400 ) ( ON ?auto_101394 ?auto_101401 ) ( not ( = ?auto_101394 ?auto_101401 ) ) ( not ( = ?auto_101395 ?auto_101401 ) ) ( not ( = ?auto_101396 ?auto_101401 ) ) ( not ( = ?auto_101397 ?auto_101401 ) ) ( not ( = ?auto_101398 ?auto_101401 ) ) ( not ( = ?auto_101399 ?auto_101401 ) ) ( not ( = ?auto_101400 ?auto_101401 ) ) ( ON ?auto_101395 ?auto_101394 ) ( ON-TABLE ?auto_101401 ) ( ON ?auto_101396 ?auto_101395 ) ( ON ?auto_101397 ?auto_101396 ) ( ON ?auto_101398 ?auto_101397 ) ( CLEAR ?auto_101398 ) ( HOLDING ?auto_101399 ) ( CLEAR ?auto_101400 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101400 ?auto_101399 )
      ( MAKE-7PILE ?auto_101394 ?auto_101395 ?auto_101396 ?auto_101397 ?auto_101398 ?auto_101399 ?auto_101400 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101402 - BLOCK
      ?auto_101403 - BLOCK
      ?auto_101404 - BLOCK
      ?auto_101405 - BLOCK
      ?auto_101406 - BLOCK
      ?auto_101407 - BLOCK
      ?auto_101408 - BLOCK
    )
    :vars
    (
      ?auto_101409 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101402 ?auto_101403 ) ) ( not ( = ?auto_101402 ?auto_101404 ) ) ( not ( = ?auto_101402 ?auto_101405 ) ) ( not ( = ?auto_101402 ?auto_101406 ) ) ( not ( = ?auto_101402 ?auto_101407 ) ) ( not ( = ?auto_101402 ?auto_101408 ) ) ( not ( = ?auto_101403 ?auto_101404 ) ) ( not ( = ?auto_101403 ?auto_101405 ) ) ( not ( = ?auto_101403 ?auto_101406 ) ) ( not ( = ?auto_101403 ?auto_101407 ) ) ( not ( = ?auto_101403 ?auto_101408 ) ) ( not ( = ?auto_101404 ?auto_101405 ) ) ( not ( = ?auto_101404 ?auto_101406 ) ) ( not ( = ?auto_101404 ?auto_101407 ) ) ( not ( = ?auto_101404 ?auto_101408 ) ) ( not ( = ?auto_101405 ?auto_101406 ) ) ( not ( = ?auto_101405 ?auto_101407 ) ) ( not ( = ?auto_101405 ?auto_101408 ) ) ( not ( = ?auto_101406 ?auto_101407 ) ) ( not ( = ?auto_101406 ?auto_101408 ) ) ( not ( = ?auto_101407 ?auto_101408 ) ) ( ON-TABLE ?auto_101408 ) ( ON ?auto_101402 ?auto_101409 ) ( not ( = ?auto_101402 ?auto_101409 ) ) ( not ( = ?auto_101403 ?auto_101409 ) ) ( not ( = ?auto_101404 ?auto_101409 ) ) ( not ( = ?auto_101405 ?auto_101409 ) ) ( not ( = ?auto_101406 ?auto_101409 ) ) ( not ( = ?auto_101407 ?auto_101409 ) ) ( not ( = ?auto_101408 ?auto_101409 ) ) ( ON ?auto_101403 ?auto_101402 ) ( ON-TABLE ?auto_101409 ) ( ON ?auto_101404 ?auto_101403 ) ( ON ?auto_101405 ?auto_101404 ) ( ON ?auto_101406 ?auto_101405 ) ( CLEAR ?auto_101408 ) ( ON ?auto_101407 ?auto_101406 ) ( CLEAR ?auto_101407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_101409 ?auto_101402 ?auto_101403 ?auto_101404 ?auto_101405 ?auto_101406 )
      ( MAKE-7PILE ?auto_101402 ?auto_101403 ?auto_101404 ?auto_101405 ?auto_101406 ?auto_101407 ?auto_101408 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101410 - BLOCK
      ?auto_101411 - BLOCK
      ?auto_101412 - BLOCK
      ?auto_101413 - BLOCK
      ?auto_101414 - BLOCK
      ?auto_101415 - BLOCK
      ?auto_101416 - BLOCK
    )
    :vars
    (
      ?auto_101417 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101410 ?auto_101411 ) ) ( not ( = ?auto_101410 ?auto_101412 ) ) ( not ( = ?auto_101410 ?auto_101413 ) ) ( not ( = ?auto_101410 ?auto_101414 ) ) ( not ( = ?auto_101410 ?auto_101415 ) ) ( not ( = ?auto_101410 ?auto_101416 ) ) ( not ( = ?auto_101411 ?auto_101412 ) ) ( not ( = ?auto_101411 ?auto_101413 ) ) ( not ( = ?auto_101411 ?auto_101414 ) ) ( not ( = ?auto_101411 ?auto_101415 ) ) ( not ( = ?auto_101411 ?auto_101416 ) ) ( not ( = ?auto_101412 ?auto_101413 ) ) ( not ( = ?auto_101412 ?auto_101414 ) ) ( not ( = ?auto_101412 ?auto_101415 ) ) ( not ( = ?auto_101412 ?auto_101416 ) ) ( not ( = ?auto_101413 ?auto_101414 ) ) ( not ( = ?auto_101413 ?auto_101415 ) ) ( not ( = ?auto_101413 ?auto_101416 ) ) ( not ( = ?auto_101414 ?auto_101415 ) ) ( not ( = ?auto_101414 ?auto_101416 ) ) ( not ( = ?auto_101415 ?auto_101416 ) ) ( ON ?auto_101410 ?auto_101417 ) ( not ( = ?auto_101410 ?auto_101417 ) ) ( not ( = ?auto_101411 ?auto_101417 ) ) ( not ( = ?auto_101412 ?auto_101417 ) ) ( not ( = ?auto_101413 ?auto_101417 ) ) ( not ( = ?auto_101414 ?auto_101417 ) ) ( not ( = ?auto_101415 ?auto_101417 ) ) ( not ( = ?auto_101416 ?auto_101417 ) ) ( ON ?auto_101411 ?auto_101410 ) ( ON-TABLE ?auto_101417 ) ( ON ?auto_101412 ?auto_101411 ) ( ON ?auto_101413 ?auto_101412 ) ( ON ?auto_101414 ?auto_101413 ) ( ON ?auto_101415 ?auto_101414 ) ( CLEAR ?auto_101415 ) ( HOLDING ?auto_101416 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101416 )
      ( MAKE-7PILE ?auto_101410 ?auto_101411 ?auto_101412 ?auto_101413 ?auto_101414 ?auto_101415 ?auto_101416 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101418 - BLOCK
      ?auto_101419 - BLOCK
      ?auto_101420 - BLOCK
      ?auto_101421 - BLOCK
      ?auto_101422 - BLOCK
      ?auto_101423 - BLOCK
      ?auto_101424 - BLOCK
    )
    :vars
    (
      ?auto_101425 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101418 ?auto_101419 ) ) ( not ( = ?auto_101418 ?auto_101420 ) ) ( not ( = ?auto_101418 ?auto_101421 ) ) ( not ( = ?auto_101418 ?auto_101422 ) ) ( not ( = ?auto_101418 ?auto_101423 ) ) ( not ( = ?auto_101418 ?auto_101424 ) ) ( not ( = ?auto_101419 ?auto_101420 ) ) ( not ( = ?auto_101419 ?auto_101421 ) ) ( not ( = ?auto_101419 ?auto_101422 ) ) ( not ( = ?auto_101419 ?auto_101423 ) ) ( not ( = ?auto_101419 ?auto_101424 ) ) ( not ( = ?auto_101420 ?auto_101421 ) ) ( not ( = ?auto_101420 ?auto_101422 ) ) ( not ( = ?auto_101420 ?auto_101423 ) ) ( not ( = ?auto_101420 ?auto_101424 ) ) ( not ( = ?auto_101421 ?auto_101422 ) ) ( not ( = ?auto_101421 ?auto_101423 ) ) ( not ( = ?auto_101421 ?auto_101424 ) ) ( not ( = ?auto_101422 ?auto_101423 ) ) ( not ( = ?auto_101422 ?auto_101424 ) ) ( not ( = ?auto_101423 ?auto_101424 ) ) ( ON ?auto_101418 ?auto_101425 ) ( not ( = ?auto_101418 ?auto_101425 ) ) ( not ( = ?auto_101419 ?auto_101425 ) ) ( not ( = ?auto_101420 ?auto_101425 ) ) ( not ( = ?auto_101421 ?auto_101425 ) ) ( not ( = ?auto_101422 ?auto_101425 ) ) ( not ( = ?auto_101423 ?auto_101425 ) ) ( not ( = ?auto_101424 ?auto_101425 ) ) ( ON ?auto_101419 ?auto_101418 ) ( ON-TABLE ?auto_101425 ) ( ON ?auto_101420 ?auto_101419 ) ( ON ?auto_101421 ?auto_101420 ) ( ON ?auto_101422 ?auto_101421 ) ( ON ?auto_101423 ?auto_101422 ) ( ON ?auto_101424 ?auto_101423 ) ( CLEAR ?auto_101424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_101425 ?auto_101418 ?auto_101419 ?auto_101420 ?auto_101421 ?auto_101422 ?auto_101423 )
      ( MAKE-7PILE ?auto_101418 ?auto_101419 ?auto_101420 ?auto_101421 ?auto_101422 ?auto_101423 ?auto_101424 ) )
  )

)

