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
      ?auto_283491 - BLOCK
    )
    :vars
    (
      ?auto_283492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_283491 ?auto_283492 ) ( CLEAR ?auto_283491 ) ( HAND-EMPTY ) ( not ( = ?auto_283491 ?auto_283492 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_283491 ?auto_283492 )
      ( !PUTDOWN ?auto_283491 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_283498 - BLOCK
      ?auto_283499 - BLOCK
    )
    :vars
    (
      ?auto_283500 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_283498 ) ( ON ?auto_283499 ?auto_283500 ) ( CLEAR ?auto_283499 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_283498 ) ( not ( = ?auto_283498 ?auto_283499 ) ) ( not ( = ?auto_283498 ?auto_283500 ) ) ( not ( = ?auto_283499 ?auto_283500 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_283499 ?auto_283500 )
      ( !STACK ?auto_283499 ?auto_283498 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_283508 - BLOCK
      ?auto_283509 - BLOCK
    )
    :vars
    (
      ?auto_283510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_283509 ?auto_283510 ) ( not ( = ?auto_283508 ?auto_283509 ) ) ( not ( = ?auto_283508 ?auto_283510 ) ) ( not ( = ?auto_283509 ?auto_283510 ) ) ( ON ?auto_283508 ?auto_283509 ) ( CLEAR ?auto_283508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_283508 )
      ( MAKE-2PILE ?auto_283508 ?auto_283509 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_283519 - BLOCK
      ?auto_283520 - BLOCK
      ?auto_283521 - BLOCK
    )
    :vars
    (
      ?auto_283522 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_283520 ) ( ON ?auto_283521 ?auto_283522 ) ( CLEAR ?auto_283521 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_283519 ) ( ON ?auto_283520 ?auto_283519 ) ( not ( = ?auto_283519 ?auto_283520 ) ) ( not ( = ?auto_283519 ?auto_283521 ) ) ( not ( = ?auto_283519 ?auto_283522 ) ) ( not ( = ?auto_283520 ?auto_283521 ) ) ( not ( = ?auto_283520 ?auto_283522 ) ) ( not ( = ?auto_283521 ?auto_283522 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_283521 ?auto_283522 )
      ( !STACK ?auto_283521 ?auto_283520 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_283533 - BLOCK
      ?auto_283534 - BLOCK
      ?auto_283535 - BLOCK
    )
    :vars
    (
      ?auto_283536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_283535 ?auto_283536 ) ( ON-TABLE ?auto_283533 ) ( not ( = ?auto_283533 ?auto_283534 ) ) ( not ( = ?auto_283533 ?auto_283535 ) ) ( not ( = ?auto_283533 ?auto_283536 ) ) ( not ( = ?auto_283534 ?auto_283535 ) ) ( not ( = ?auto_283534 ?auto_283536 ) ) ( not ( = ?auto_283535 ?auto_283536 ) ) ( CLEAR ?auto_283533 ) ( ON ?auto_283534 ?auto_283535 ) ( CLEAR ?auto_283534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_283533 ?auto_283534 )
      ( MAKE-3PILE ?auto_283533 ?auto_283534 ?auto_283535 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_283547 - BLOCK
      ?auto_283548 - BLOCK
      ?auto_283549 - BLOCK
    )
    :vars
    (
      ?auto_283550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_283549 ?auto_283550 ) ( not ( = ?auto_283547 ?auto_283548 ) ) ( not ( = ?auto_283547 ?auto_283549 ) ) ( not ( = ?auto_283547 ?auto_283550 ) ) ( not ( = ?auto_283548 ?auto_283549 ) ) ( not ( = ?auto_283548 ?auto_283550 ) ) ( not ( = ?auto_283549 ?auto_283550 ) ) ( ON ?auto_283548 ?auto_283549 ) ( ON ?auto_283547 ?auto_283548 ) ( CLEAR ?auto_283547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_283547 )
      ( MAKE-3PILE ?auto_283547 ?auto_283548 ?auto_283549 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_283562 - BLOCK
      ?auto_283563 - BLOCK
      ?auto_283564 - BLOCK
      ?auto_283565 - BLOCK
    )
    :vars
    (
      ?auto_283566 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_283564 ) ( ON ?auto_283565 ?auto_283566 ) ( CLEAR ?auto_283565 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_283562 ) ( ON ?auto_283563 ?auto_283562 ) ( ON ?auto_283564 ?auto_283563 ) ( not ( = ?auto_283562 ?auto_283563 ) ) ( not ( = ?auto_283562 ?auto_283564 ) ) ( not ( = ?auto_283562 ?auto_283565 ) ) ( not ( = ?auto_283562 ?auto_283566 ) ) ( not ( = ?auto_283563 ?auto_283564 ) ) ( not ( = ?auto_283563 ?auto_283565 ) ) ( not ( = ?auto_283563 ?auto_283566 ) ) ( not ( = ?auto_283564 ?auto_283565 ) ) ( not ( = ?auto_283564 ?auto_283566 ) ) ( not ( = ?auto_283565 ?auto_283566 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_283565 ?auto_283566 )
      ( !STACK ?auto_283565 ?auto_283564 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_283580 - BLOCK
      ?auto_283581 - BLOCK
      ?auto_283582 - BLOCK
      ?auto_283583 - BLOCK
    )
    :vars
    (
      ?auto_283584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_283583 ?auto_283584 ) ( ON-TABLE ?auto_283580 ) ( ON ?auto_283581 ?auto_283580 ) ( not ( = ?auto_283580 ?auto_283581 ) ) ( not ( = ?auto_283580 ?auto_283582 ) ) ( not ( = ?auto_283580 ?auto_283583 ) ) ( not ( = ?auto_283580 ?auto_283584 ) ) ( not ( = ?auto_283581 ?auto_283582 ) ) ( not ( = ?auto_283581 ?auto_283583 ) ) ( not ( = ?auto_283581 ?auto_283584 ) ) ( not ( = ?auto_283582 ?auto_283583 ) ) ( not ( = ?auto_283582 ?auto_283584 ) ) ( not ( = ?auto_283583 ?auto_283584 ) ) ( CLEAR ?auto_283581 ) ( ON ?auto_283582 ?auto_283583 ) ( CLEAR ?auto_283582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_283580 ?auto_283581 ?auto_283582 )
      ( MAKE-4PILE ?auto_283580 ?auto_283581 ?auto_283582 ?auto_283583 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_283598 - BLOCK
      ?auto_283599 - BLOCK
      ?auto_283600 - BLOCK
      ?auto_283601 - BLOCK
    )
    :vars
    (
      ?auto_283602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_283601 ?auto_283602 ) ( ON-TABLE ?auto_283598 ) ( not ( = ?auto_283598 ?auto_283599 ) ) ( not ( = ?auto_283598 ?auto_283600 ) ) ( not ( = ?auto_283598 ?auto_283601 ) ) ( not ( = ?auto_283598 ?auto_283602 ) ) ( not ( = ?auto_283599 ?auto_283600 ) ) ( not ( = ?auto_283599 ?auto_283601 ) ) ( not ( = ?auto_283599 ?auto_283602 ) ) ( not ( = ?auto_283600 ?auto_283601 ) ) ( not ( = ?auto_283600 ?auto_283602 ) ) ( not ( = ?auto_283601 ?auto_283602 ) ) ( ON ?auto_283600 ?auto_283601 ) ( CLEAR ?auto_283598 ) ( ON ?auto_283599 ?auto_283600 ) ( CLEAR ?auto_283599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_283598 ?auto_283599 )
      ( MAKE-4PILE ?auto_283598 ?auto_283599 ?auto_283600 ?auto_283601 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_283616 - BLOCK
      ?auto_283617 - BLOCK
      ?auto_283618 - BLOCK
      ?auto_283619 - BLOCK
    )
    :vars
    (
      ?auto_283620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_283619 ?auto_283620 ) ( not ( = ?auto_283616 ?auto_283617 ) ) ( not ( = ?auto_283616 ?auto_283618 ) ) ( not ( = ?auto_283616 ?auto_283619 ) ) ( not ( = ?auto_283616 ?auto_283620 ) ) ( not ( = ?auto_283617 ?auto_283618 ) ) ( not ( = ?auto_283617 ?auto_283619 ) ) ( not ( = ?auto_283617 ?auto_283620 ) ) ( not ( = ?auto_283618 ?auto_283619 ) ) ( not ( = ?auto_283618 ?auto_283620 ) ) ( not ( = ?auto_283619 ?auto_283620 ) ) ( ON ?auto_283618 ?auto_283619 ) ( ON ?auto_283617 ?auto_283618 ) ( ON ?auto_283616 ?auto_283617 ) ( CLEAR ?auto_283616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_283616 )
      ( MAKE-4PILE ?auto_283616 ?auto_283617 ?auto_283618 ?auto_283619 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_283635 - BLOCK
      ?auto_283636 - BLOCK
      ?auto_283637 - BLOCK
      ?auto_283638 - BLOCK
      ?auto_283639 - BLOCK
    )
    :vars
    (
      ?auto_283640 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_283638 ) ( ON ?auto_283639 ?auto_283640 ) ( CLEAR ?auto_283639 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_283635 ) ( ON ?auto_283636 ?auto_283635 ) ( ON ?auto_283637 ?auto_283636 ) ( ON ?auto_283638 ?auto_283637 ) ( not ( = ?auto_283635 ?auto_283636 ) ) ( not ( = ?auto_283635 ?auto_283637 ) ) ( not ( = ?auto_283635 ?auto_283638 ) ) ( not ( = ?auto_283635 ?auto_283639 ) ) ( not ( = ?auto_283635 ?auto_283640 ) ) ( not ( = ?auto_283636 ?auto_283637 ) ) ( not ( = ?auto_283636 ?auto_283638 ) ) ( not ( = ?auto_283636 ?auto_283639 ) ) ( not ( = ?auto_283636 ?auto_283640 ) ) ( not ( = ?auto_283637 ?auto_283638 ) ) ( not ( = ?auto_283637 ?auto_283639 ) ) ( not ( = ?auto_283637 ?auto_283640 ) ) ( not ( = ?auto_283638 ?auto_283639 ) ) ( not ( = ?auto_283638 ?auto_283640 ) ) ( not ( = ?auto_283639 ?auto_283640 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_283639 ?auto_283640 )
      ( !STACK ?auto_283639 ?auto_283638 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_283657 - BLOCK
      ?auto_283658 - BLOCK
      ?auto_283659 - BLOCK
      ?auto_283660 - BLOCK
      ?auto_283661 - BLOCK
    )
    :vars
    (
      ?auto_283662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_283661 ?auto_283662 ) ( ON-TABLE ?auto_283657 ) ( ON ?auto_283658 ?auto_283657 ) ( ON ?auto_283659 ?auto_283658 ) ( not ( = ?auto_283657 ?auto_283658 ) ) ( not ( = ?auto_283657 ?auto_283659 ) ) ( not ( = ?auto_283657 ?auto_283660 ) ) ( not ( = ?auto_283657 ?auto_283661 ) ) ( not ( = ?auto_283657 ?auto_283662 ) ) ( not ( = ?auto_283658 ?auto_283659 ) ) ( not ( = ?auto_283658 ?auto_283660 ) ) ( not ( = ?auto_283658 ?auto_283661 ) ) ( not ( = ?auto_283658 ?auto_283662 ) ) ( not ( = ?auto_283659 ?auto_283660 ) ) ( not ( = ?auto_283659 ?auto_283661 ) ) ( not ( = ?auto_283659 ?auto_283662 ) ) ( not ( = ?auto_283660 ?auto_283661 ) ) ( not ( = ?auto_283660 ?auto_283662 ) ) ( not ( = ?auto_283661 ?auto_283662 ) ) ( CLEAR ?auto_283659 ) ( ON ?auto_283660 ?auto_283661 ) ( CLEAR ?auto_283660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_283657 ?auto_283658 ?auto_283659 ?auto_283660 )
      ( MAKE-5PILE ?auto_283657 ?auto_283658 ?auto_283659 ?auto_283660 ?auto_283661 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_283679 - BLOCK
      ?auto_283680 - BLOCK
      ?auto_283681 - BLOCK
      ?auto_283682 - BLOCK
      ?auto_283683 - BLOCK
    )
    :vars
    (
      ?auto_283684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_283683 ?auto_283684 ) ( ON-TABLE ?auto_283679 ) ( ON ?auto_283680 ?auto_283679 ) ( not ( = ?auto_283679 ?auto_283680 ) ) ( not ( = ?auto_283679 ?auto_283681 ) ) ( not ( = ?auto_283679 ?auto_283682 ) ) ( not ( = ?auto_283679 ?auto_283683 ) ) ( not ( = ?auto_283679 ?auto_283684 ) ) ( not ( = ?auto_283680 ?auto_283681 ) ) ( not ( = ?auto_283680 ?auto_283682 ) ) ( not ( = ?auto_283680 ?auto_283683 ) ) ( not ( = ?auto_283680 ?auto_283684 ) ) ( not ( = ?auto_283681 ?auto_283682 ) ) ( not ( = ?auto_283681 ?auto_283683 ) ) ( not ( = ?auto_283681 ?auto_283684 ) ) ( not ( = ?auto_283682 ?auto_283683 ) ) ( not ( = ?auto_283682 ?auto_283684 ) ) ( not ( = ?auto_283683 ?auto_283684 ) ) ( ON ?auto_283682 ?auto_283683 ) ( CLEAR ?auto_283680 ) ( ON ?auto_283681 ?auto_283682 ) ( CLEAR ?auto_283681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_283679 ?auto_283680 ?auto_283681 )
      ( MAKE-5PILE ?auto_283679 ?auto_283680 ?auto_283681 ?auto_283682 ?auto_283683 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_283701 - BLOCK
      ?auto_283702 - BLOCK
      ?auto_283703 - BLOCK
      ?auto_283704 - BLOCK
      ?auto_283705 - BLOCK
    )
    :vars
    (
      ?auto_283706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_283705 ?auto_283706 ) ( ON-TABLE ?auto_283701 ) ( not ( = ?auto_283701 ?auto_283702 ) ) ( not ( = ?auto_283701 ?auto_283703 ) ) ( not ( = ?auto_283701 ?auto_283704 ) ) ( not ( = ?auto_283701 ?auto_283705 ) ) ( not ( = ?auto_283701 ?auto_283706 ) ) ( not ( = ?auto_283702 ?auto_283703 ) ) ( not ( = ?auto_283702 ?auto_283704 ) ) ( not ( = ?auto_283702 ?auto_283705 ) ) ( not ( = ?auto_283702 ?auto_283706 ) ) ( not ( = ?auto_283703 ?auto_283704 ) ) ( not ( = ?auto_283703 ?auto_283705 ) ) ( not ( = ?auto_283703 ?auto_283706 ) ) ( not ( = ?auto_283704 ?auto_283705 ) ) ( not ( = ?auto_283704 ?auto_283706 ) ) ( not ( = ?auto_283705 ?auto_283706 ) ) ( ON ?auto_283704 ?auto_283705 ) ( ON ?auto_283703 ?auto_283704 ) ( CLEAR ?auto_283701 ) ( ON ?auto_283702 ?auto_283703 ) ( CLEAR ?auto_283702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_283701 ?auto_283702 )
      ( MAKE-5PILE ?auto_283701 ?auto_283702 ?auto_283703 ?auto_283704 ?auto_283705 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_283723 - BLOCK
      ?auto_283724 - BLOCK
      ?auto_283725 - BLOCK
      ?auto_283726 - BLOCK
      ?auto_283727 - BLOCK
    )
    :vars
    (
      ?auto_283728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_283727 ?auto_283728 ) ( not ( = ?auto_283723 ?auto_283724 ) ) ( not ( = ?auto_283723 ?auto_283725 ) ) ( not ( = ?auto_283723 ?auto_283726 ) ) ( not ( = ?auto_283723 ?auto_283727 ) ) ( not ( = ?auto_283723 ?auto_283728 ) ) ( not ( = ?auto_283724 ?auto_283725 ) ) ( not ( = ?auto_283724 ?auto_283726 ) ) ( not ( = ?auto_283724 ?auto_283727 ) ) ( not ( = ?auto_283724 ?auto_283728 ) ) ( not ( = ?auto_283725 ?auto_283726 ) ) ( not ( = ?auto_283725 ?auto_283727 ) ) ( not ( = ?auto_283725 ?auto_283728 ) ) ( not ( = ?auto_283726 ?auto_283727 ) ) ( not ( = ?auto_283726 ?auto_283728 ) ) ( not ( = ?auto_283727 ?auto_283728 ) ) ( ON ?auto_283726 ?auto_283727 ) ( ON ?auto_283725 ?auto_283726 ) ( ON ?auto_283724 ?auto_283725 ) ( ON ?auto_283723 ?auto_283724 ) ( CLEAR ?auto_283723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_283723 )
      ( MAKE-5PILE ?auto_283723 ?auto_283724 ?auto_283725 ?auto_283726 ?auto_283727 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_283746 - BLOCK
      ?auto_283747 - BLOCK
      ?auto_283748 - BLOCK
      ?auto_283749 - BLOCK
      ?auto_283750 - BLOCK
      ?auto_283751 - BLOCK
    )
    :vars
    (
      ?auto_283752 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_283750 ) ( ON ?auto_283751 ?auto_283752 ) ( CLEAR ?auto_283751 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_283746 ) ( ON ?auto_283747 ?auto_283746 ) ( ON ?auto_283748 ?auto_283747 ) ( ON ?auto_283749 ?auto_283748 ) ( ON ?auto_283750 ?auto_283749 ) ( not ( = ?auto_283746 ?auto_283747 ) ) ( not ( = ?auto_283746 ?auto_283748 ) ) ( not ( = ?auto_283746 ?auto_283749 ) ) ( not ( = ?auto_283746 ?auto_283750 ) ) ( not ( = ?auto_283746 ?auto_283751 ) ) ( not ( = ?auto_283746 ?auto_283752 ) ) ( not ( = ?auto_283747 ?auto_283748 ) ) ( not ( = ?auto_283747 ?auto_283749 ) ) ( not ( = ?auto_283747 ?auto_283750 ) ) ( not ( = ?auto_283747 ?auto_283751 ) ) ( not ( = ?auto_283747 ?auto_283752 ) ) ( not ( = ?auto_283748 ?auto_283749 ) ) ( not ( = ?auto_283748 ?auto_283750 ) ) ( not ( = ?auto_283748 ?auto_283751 ) ) ( not ( = ?auto_283748 ?auto_283752 ) ) ( not ( = ?auto_283749 ?auto_283750 ) ) ( not ( = ?auto_283749 ?auto_283751 ) ) ( not ( = ?auto_283749 ?auto_283752 ) ) ( not ( = ?auto_283750 ?auto_283751 ) ) ( not ( = ?auto_283750 ?auto_283752 ) ) ( not ( = ?auto_283751 ?auto_283752 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_283751 ?auto_283752 )
      ( !STACK ?auto_283751 ?auto_283750 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_283772 - BLOCK
      ?auto_283773 - BLOCK
      ?auto_283774 - BLOCK
      ?auto_283775 - BLOCK
      ?auto_283776 - BLOCK
      ?auto_283777 - BLOCK
    )
    :vars
    (
      ?auto_283778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_283777 ?auto_283778 ) ( ON-TABLE ?auto_283772 ) ( ON ?auto_283773 ?auto_283772 ) ( ON ?auto_283774 ?auto_283773 ) ( ON ?auto_283775 ?auto_283774 ) ( not ( = ?auto_283772 ?auto_283773 ) ) ( not ( = ?auto_283772 ?auto_283774 ) ) ( not ( = ?auto_283772 ?auto_283775 ) ) ( not ( = ?auto_283772 ?auto_283776 ) ) ( not ( = ?auto_283772 ?auto_283777 ) ) ( not ( = ?auto_283772 ?auto_283778 ) ) ( not ( = ?auto_283773 ?auto_283774 ) ) ( not ( = ?auto_283773 ?auto_283775 ) ) ( not ( = ?auto_283773 ?auto_283776 ) ) ( not ( = ?auto_283773 ?auto_283777 ) ) ( not ( = ?auto_283773 ?auto_283778 ) ) ( not ( = ?auto_283774 ?auto_283775 ) ) ( not ( = ?auto_283774 ?auto_283776 ) ) ( not ( = ?auto_283774 ?auto_283777 ) ) ( not ( = ?auto_283774 ?auto_283778 ) ) ( not ( = ?auto_283775 ?auto_283776 ) ) ( not ( = ?auto_283775 ?auto_283777 ) ) ( not ( = ?auto_283775 ?auto_283778 ) ) ( not ( = ?auto_283776 ?auto_283777 ) ) ( not ( = ?auto_283776 ?auto_283778 ) ) ( not ( = ?auto_283777 ?auto_283778 ) ) ( CLEAR ?auto_283775 ) ( ON ?auto_283776 ?auto_283777 ) ( CLEAR ?auto_283776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_283772 ?auto_283773 ?auto_283774 ?auto_283775 ?auto_283776 )
      ( MAKE-6PILE ?auto_283772 ?auto_283773 ?auto_283774 ?auto_283775 ?auto_283776 ?auto_283777 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_283798 - BLOCK
      ?auto_283799 - BLOCK
      ?auto_283800 - BLOCK
      ?auto_283801 - BLOCK
      ?auto_283802 - BLOCK
      ?auto_283803 - BLOCK
    )
    :vars
    (
      ?auto_283804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_283803 ?auto_283804 ) ( ON-TABLE ?auto_283798 ) ( ON ?auto_283799 ?auto_283798 ) ( ON ?auto_283800 ?auto_283799 ) ( not ( = ?auto_283798 ?auto_283799 ) ) ( not ( = ?auto_283798 ?auto_283800 ) ) ( not ( = ?auto_283798 ?auto_283801 ) ) ( not ( = ?auto_283798 ?auto_283802 ) ) ( not ( = ?auto_283798 ?auto_283803 ) ) ( not ( = ?auto_283798 ?auto_283804 ) ) ( not ( = ?auto_283799 ?auto_283800 ) ) ( not ( = ?auto_283799 ?auto_283801 ) ) ( not ( = ?auto_283799 ?auto_283802 ) ) ( not ( = ?auto_283799 ?auto_283803 ) ) ( not ( = ?auto_283799 ?auto_283804 ) ) ( not ( = ?auto_283800 ?auto_283801 ) ) ( not ( = ?auto_283800 ?auto_283802 ) ) ( not ( = ?auto_283800 ?auto_283803 ) ) ( not ( = ?auto_283800 ?auto_283804 ) ) ( not ( = ?auto_283801 ?auto_283802 ) ) ( not ( = ?auto_283801 ?auto_283803 ) ) ( not ( = ?auto_283801 ?auto_283804 ) ) ( not ( = ?auto_283802 ?auto_283803 ) ) ( not ( = ?auto_283802 ?auto_283804 ) ) ( not ( = ?auto_283803 ?auto_283804 ) ) ( ON ?auto_283802 ?auto_283803 ) ( CLEAR ?auto_283800 ) ( ON ?auto_283801 ?auto_283802 ) ( CLEAR ?auto_283801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_283798 ?auto_283799 ?auto_283800 ?auto_283801 )
      ( MAKE-6PILE ?auto_283798 ?auto_283799 ?auto_283800 ?auto_283801 ?auto_283802 ?auto_283803 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_283824 - BLOCK
      ?auto_283825 - BLOCK
      ?auto_283826 - BLOCK
      ?auto_283827 - BLOCK
      ?auto_283828 - BLOCK
      ?auto_283829 - BLOCK
    )
    :vars
    (
      ?auto_283830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_283829 ?auto_283830 ) ( ON-TABLE ?auto_283824 ) ( ON ?auto_283825 ?auto_283824 ) ( not ( = ?auto_283824 ?auto_283825 ) ) ( not ( = ?auto_283824 ?auto_283826 ) ) ( not ( = ?auto_283824 ?auto_283827 ) ) ( not ( = ?auto_283824 ?auto_283828 ) ) ( not ( = ?auto_283824 ?auto_283829 ) ) ( not ( = ?auto_283824 ?auto_283830 ) ) ( not ( = ?auto_283825 ?auto_283826 ) ) ( not ( = ?auto_283825 ?auto_283827 ) ) ( not ( = ?auto_283825 ?auto_283828 ) ) ( not ( = ?auto_283825 ?auto_283829 ) ) ( not ( = ?auto_283825 ?auto_283830 ) ) ( not ( = ?auto_283826 ?auto_283827 ) ) ( not ( = ?auto_283826 ?auto_283828 ) ) ( not ( = ?auto_283826 ?auto_283829 ) ) ( not ( = ?auto_283826 ?auto_283830 ) ) ( not ( = ?auto_283827 ?auto_283828 ) ) ( not ( = ?auto_283827 ?auto_283829 ) ) ( not ( = ?auto_283827 ?auto_283830 ) ) ( not ( = ?auto_283828 ?auto_283829 ) ) ( not ( = ?auto_283828 ?auto_283830 ) ) ( not ( = ?auto_283829 ?auto_283830 ) ) ( ON ?auto_283828 ?auto_283829 ) ( ON ?auto_283827 ?auto_283828 ) ( CLEAR ?auto_283825 ) ( ON ?auto_283826 ?auto_283827 ) ( CLEAR ?auto_283826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_283824 ?auto_283825 ?auto_283826 )
      ( MAKE-6PILE ?auto_283824 ?auto_283825 ?auto_283826 ?auto_283827 ?auto_283828 ?auto_283829 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_283850 - BLOCK
      ?auto_283851 - BLOCK
      ?auto_283852 - BLOCK
      ?auto_283853 - BLOCK
      ?auto_283854 - BLOCK
      ?auto_283855 - BLOCK
    )
    :vars
    (
      ?auto_283856 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_283855 ?auto_283856 ) ( ON-TABLE ?auto_283850 ) ( not ( = ?auto_283850 ?auto_283851 ) ) ( not ( = ?auto_283850 ?auto_283852 ) ) ( not ( = ?auto_283850 ?auto_283853 ) ) ( not ( = ?auto_283850 ?auto_283854 ) ) ( not ( = ?auto_283850 ?auto_283855 ) ) ( not ( = ?auto_283850 ?auto_283856 ) ) ( not ( = ?auto_283851 ?auto_283852 ) ) ( not ( = ?auto_283851 ?auto_283853 ) ) ( not ( = ?auto_283851 ?auto_283854 ) ) ( not ( = ?auto_283851 ?auto_283855 ) ) ( not ( = ?auto_283851 ?auto_283856 ) ) ( not ( = ?auto_283852 ?auto_283853 ) ) ( not ( = ?auto_283852 ?auto_283854 ) ) ( not ( = ?auto_283852 ?auto_283855 ) ) ( not ( = ?auto_283852 ?auto_283856 ) ) ( not ( = ?auto_283853 ?auto_283854 ) ) ( not ( = ?auto_283853 ?auto_283855 ) ) ( not ( = ?auto_283853 ?auto_283856 ) ) ( not ( = ?auto_283854 ?auto_283855 ) ) ( not ( = ?auto_283854 ?auto_283856 ) ) ( not ( = ?auto_283855 ?auto_283856 ) ) ( ON ?auto_283854 ?auto_283855 ) ( ON ?auto_283853 ?auto_283854 ) ( ON ?auto_283852 ?auto_283853 ) ( CLEAR ?auto_283850 ) ( ON ?auto_283851 ?auto_283852 ) ( CLEAR ?auto_283851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_283850 ?auto_283851 )
      ( MAKE-6PILE ?auto_283850 ?auto_283851 ?auto_283852 ?auto_283853 ?auto_283854 ?auto_283855 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_283876 - BLOCK
      ?auto_283877 - BLOCK
      ?auto_283878 - BLOCK
      ?auto_283879 - BLOCK
      ?auto_283880 - BLOCK
      ?auto_283881 - BLOCK
    )
    :vars
    (
      ?auto_283882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_283881 ?auto_283882 ) ( not ( = ?auto_283876 ?auto_283877 ) ) ( not ( = ?auto_283876 ?auto_283878 ) ) ( not ( = ?auto_283876 ?auto_283879 ) ) ( not ( = ?auto_283876 ?auto_283880 ) ) ( not ( = ?auto_283876 ?auto_283881 ) ) ( not ( = ?auto_283876 ?auto_283882 ) ) ( not ( = ?auto_283877 ?auto_283878 ) ) ( not ( = ?auto_283877 ?auto_283879 ) ) ( not ( = ?auto_283877 ?auto_283880 ) ) ( not ( = ?auto_283877 ?auto_283881 ) ) ( not ( = ?auto_283877 ?auto_283882 ) ) ( not ( = ?auto_283878 ?auto_283879 ) ) ( not ( = ?auto_283878 ?auto_283880 ) ) ( not ( = ?auto_283878 ?auto_283881 ) ) ( not ( = ?auto_283878 ?auto_283882 ) ) ( not ( = ?auto_283879 ?auto_283880 ) ) ( not ( = ?auto_283879 ?auto_283881 ) ) ( not ( = ?auto_283879 ?auto_283882 ) ) ( not ( = ?auto_283880 ?auto_283881 ) ) ( not ( = ?auto_283880 ?auto_283882 ) ) ( not ( = ?auto_283881 ?auto_283882 ) ) ( ON ?auto_283880 ?auto_283881 ) ( ON ?auto_283879 ?auto_283880 ) ( ON ?auto_283878 ?auto_283879 ) ( ON ?auto_283877 ?auto_283878 ) ( ON ?auto_283876 ?auto_283877 ) ( CLEAR ?auto_283876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_283876 )
      ( MAKE-6PILE ?auto_283876 ?auto_283877 ?auto_283878 ?auto_283879 ?auto_283880 ?auto_283881 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_283903 - BLOCK
      ?auto_283904 - BLOCK
      ?auto_283905 - BLOCK
      ?auto_283906 - BLOCK
      ?auto_283907 - BLOCK
      ?auto_283908 - BLOCK
      ?auto_283909 - BLOCK
    )
    :vars
    (
      ?auto_283910 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_283908 ) ( ON ?auto_283909 ?auto_283910 ) ( CLEAR ?auto_283909 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_283903 ) ( ON ?auto_283904 ?auto_283903 ) ( ON ?auto_283905 ?auto_283904 ) ( ON ?auto_283906 ?auto_283905 ) ( ON ?auto_283907 ?auto_283906 ) ( ON ?auto_283908 ?auto_283907 ) ( not ( = ?auto_283903 ?auto_283904 ) ) ( not ( = ?auto_283903 ?auto_283905 ) ) ( not ( = ?auto_283903 ?auto_283906 ) ) ( not ( = ?auto_283903 ?auto_283907 ) ) ( not ( = ?auto_283903 ?auto_283908 ) ) ( not ( = ?auto_283903 ?auto_283909 ) ) ( not ( = ?auto_283903 ?auto_283910 ) ) ( not ( = ?auto_283904 ?auto_283905 ) ) ( not ( = ?auto_283904 ?auto_283906 ) ) ( not ( = ?auto_283904 ?auto_283907 ) ) ( not ( = ?auto_283904 ?auto_283908 ) ) ( not ( = ?auto_283904 ?auto_283909 ) ) ( not ( = ?auto_283904 ?auto_283910 ) ) ( not ( = ?auto_283905 ?auto_283906 ) ) ( not ( = ?auto_283905 ?auto_283907 ) ) ( not ( = ?auto_283905 ?auto_283908 ) ) ( not ( = ?auto_283905 ?auto_283909 ) ) ( not ( = ?auto_283905 ?auto_283910 ) ) ( not ( = ?auto_283906 ?auto_283907 ) ) ( not ( = ?auto_283906 ?auto_283908 ) ) ( not ( = ?auto_283906 ?auto_283909 ) ) ( not ( = ?auto_283906 ?auto_283910 ) ) ( not ( = ?auto_283907 ?auto_283908 ) ) ( not ( = ?auto_283907 ?auto_283909 ) ) ( not ( = ?auto_283907 ?auto_283910 ) ) ( not ( = ?auto_283908 ?auto_283909 ) ) ( not ( = ?auto_283908 ?auto_283910 ) ) ( not ( = ?auto_283909 ?auto_283910 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_283909 ?auto_283910 )
      ( !STACK ?auto_283909 ?auto_283908 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_283933 - BLOCK
      ?auto_283934 - BLOCK
      ?auto_283935 - BLOCK
      ?auto_283936 - BLOCK
      ?auto_283937 - BLOCK
      ?auto_283938 - BLOCK
      ?auto_283939 - BLOCK
    )
    :vars
    (
      ?auto_283940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_283939 ?auto_283940 ) ( ON-TABLE ?auto_283933 ) ( ON ?auto_283934 ?auto_283933 ) ( ON ?auto_283935 ?auto_283934 ) ( ON ?auto_283936 ?auto_283935 ) ( ON ?auto_283937 ?auto_283936 ) ( not ( = ?auto_283933 ?auto_283934 ) ) ( not ( = ?auto_283933 ?auto_283935 ) ) ( not ( = ?auto_283933 ?auto_283936 ) ) ( not ( = ?auto_283933 ?auto_283937 ) ) ( not ( = ?auto_283933 ?auto_283938 ) ) ( not ( = ?auto_283933 ?auto_283939 ) ) ( not ( = ?auto_283933 ?auto_283940 ) ) ( not ( = ?auto_283934 ?auto_283935 ) ) ( not ( = ?auto_283934 ?auto_283936 ) ) ( not ( = ?auto_283934 ?auto_283937 ) ) ( not ( = ?auto_283934 ?auto_283938 ) ) ( not ( = ?auto_283934 ?auto_283939 ) ) ( not ( = ?auto_283934 ?auto_283940 ) ) ( not ( = ?auto_283935 ?auto_283936 ) ) ( not ( = ?auto_283935 ?auto_283937 ) ) ( not ( = ?auto_283935 ?auto_283938 ) ) ( not ( = ?auto_283935 ?auto_283939 ) ) ( not ( = ?auto_283935 ?auto_283940 ) ) ( not ( = ?auto_283936 ?auto_283937 ) ) ( not ( = ?auto_283936 ?auto_283938 ) ) ( not ( = ?auto_283936 ?auto_283939 ) ) ( not ( = ?auto_283936 ?auto_283940 ) ) ( not ( = ?auto_283937 ?auto_283938 ) ) ( not ( = ?auto_283937 ?auto_283939 ) ) ( not ( = ?auto_283937 ?auto_283940 ) ) ( not ( = ?auto_283938 ?auto_283939 ) ) ( not ( = ?auto_283938 ?auto_283940 ) ) ( not ( = ?auto_283939 ?auto_283940 ) ) ( CLEAR ?auto_283937 ) ( ON ?auto_283938 ?auto_283939 ) ( CLEAR ?auto_283938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_283933 ?auto_283934 ?auto_283935 ?auto_283936 ?auto_283937 ?auto_283938 )
      ( MAKE-7PILE ?auto_283933 ?auto_283934 ?auto_283935 ?auto_283936 ?auto_283937 ?auto_283938 ?auto_283939 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_283963 - BLOCK
      ?auto_283964 - BLOCK
      ?auto_283965 - BLOCK
      ?auto_283966 - BLOCK
      ?auto_283967 - BLOCK
      ?auto_283968 - BLOCK
      ?auto_283969 - BLOCK
    )
    :vars
    (
      ?auto_283970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_283969 ?auto_283970 ) ( ON-TABLE ?auto_283963 ) ( ON ?auto_283964 ?auto_283963 ) ( ON ?auto_283965 ?auto_283964 ) ( ON ?auto_283966 ?auto_283965 ) ( not ( = ?auto_283963 ?auto_283964 ) ) ( not ( = ?auto_283963 ?auto_283965 ) ) ( not ( = ?auto_283963 ?auto_283966 ) ) ( not ( = ?auto_283963 ?auto_283967 ) ) ( not ( = ?auto_283963 ?auto_283968 ) ) ( not ( = ?auto_283963 ?auto_283969 ) ) ( not ( = ?auto_283963 ?auto_283970 ) ) ( not ( = ?auto_283964 ?auto_283965 ) ) ( not ( = ?auto_283964 ?auto_283966 ) ) ( not ( = ?auto_283964 ?auto_283967 ) ) ( not ( = ?auto_283964 ?auto_283968 ) ) ( not ( = ?auto_283964 ?auto_283969 ) ) ( not ( = ?auto_283964 ?auto_283970 ) ) ( not ( = ?auto_283965 ?auto_283966 ) ) ( not ( = ?auto_283965 ?auto_283967 ) ) ( not ( = ?auto_283965 ?auto_283968 ) ) ( not ( = ?auto_283965 ?auto_283969 ) ) ( not ( = ?auto_283965 ?auto_283970 ) ) ( not ( = ?auto_283966 ?auto_283967 ) ) ( not ( = ?auto_283966 ?auto_283968 ) ) ( not ( = ?auto_283966 ?auto_283969 ) ) ( not ( = ?auto_283966 ?auto_283970 ) ) ( not ( = ?auto_283967 ?auto_283968 ) ) ( not ( = ?auto_283967 ?auto_283969 ) ) ( not ( = ?auto_283967 ?auto_283970 ) ) ( not ( = ?auto_283968 ?auto_283969 ) ) ( not ( = ?auto_283968 ?auto_283970 ) ) ( not ( = ?auto_283969 ?auto_283970 ) ) ( ON ?auto_283968 ?auto_283969 ) ( CLEAR ?auto_283966 ) ( ON ?auto_283967 ?auto_283968 ) ( CLEAR ?auto_283967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_283963 ?auto_283964 ?auto_283965 ?auto_283966 ?auto_283967 )
      ( MAKE-7PILE ?auto_283963 ?auto_283964 ?auto_283965 ?auto_283966 ?auto_283967 ?auto_283968 ?auto_283969 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_283993 - BLOCK
      ?auto_283994 - BLOCK
      ?auto_283995 - BLOCK
      ?auto_283996 - BLOCK
      ?auto_283997 - BLOCK
      ?auto_283998 - BLOCK
      ?auto_283999 - BLOCK
    )
    :vars
    (
      ?auto_284000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_283999 ?auto_284000 ) ( ON-TABLE ?auto_283993 ) ( ON ?auto_283994 ?auto_283993 ) ( ON ?auto_283995 ?auto_283994 ) ( not ( = ?auto_283993 ?auto_283994 ) ) ( not ( = ?auto_283993 ?auto_283995 ) ) ( not ( = ?auto_283993 ?auto_283996 ) ) ( not ( = ?auto_283993 ?auto_283997 ) ) ( not ( = ?auto_283993 ?auto_283998 ) ) ( not ( = ?auto_283993 ?auto_283999 ) ) ( not ( = ?auto_283993 ?auto_284000 ) ) ( not ( = ?auto_283994 ?auto_283995 ) ) ( not ( = ?auto_283994 ?auto_283996 ) ) ( not ( = ?auto_283994 ?auto_283997 ) ) ( not ( = ?auto_283994 ?auto_283998 ) ) ( not ( = ?auto_283994 ?auto_283999 ) ) ( not ( = ?auto_283994 ?auto_284000 ) ) ( not ( = ?auto_283995 ?auto_283996 ) ) ( not ( = ?auto_283995 ?auto_283997 ) ) ( not ( = ?auto_283995 ?auto_283998 ) ) ( not ( = ?auto_283995 ?auto_283999 ) ) ( not ( = ?auto_283995 ?auto_284000 ) ) ( not ( = ?auto_283996 ?auto_283997 ) ) ( not ( = ?auto_283996 ?auto_283998 ) ) ( not ( = ?auto_283996 ?auto_283999 ) ) ( not ( = ?auto_283996 ?auto_284000 ) ) ( not ( = ?auto_283997 ?auto_283998 ) ) ( not ( = ?auto_283997 ?auto_283999 ) ) ( not ( = ?auto_283997 ?auto_284000 ) ) ( not ( = ?auto_283998 ?auto_283999 ) ) ( not ( = ?auto_283998 ?auto_284000 ) ) ( not ( = ?auto_283999 ?auto_284000 ) ) ( ON ?auto_283998 ?auto_283999 ) ( ON ?auto_283997 ?auto_283998 ) ( CLEAR ?auto_283995 ) ( ON ?auto_283996 ?auto_283997 ) ( CLEAR ?auto_283996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_283993 ?auto_283994 ?auto_283995 ?auto_283996 )
      ( MAKE-7PILE ?auto_283993 ?auto_283994 ?auto_283995 ?auto_283996 ?auto_283997 ?auto_283998 ?auto_283999 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_284023 - BLOCK
      ?auto_284024 - BLOCK
      ?auto_284025 - BLOCK
      ?auto_284026 - BLOCK
      ?auto_284027 - BLOCK
      ?auto_284028 - BLOCK
      ?auto_284029 - BLOCK
    )
    :vars
    (
      ?auto_284030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_284029 ?auto_284030 ) ( ON-TABLE ?auto_284023 ) ( ON ?auto_284024 ?auto_284023 ) ( not ( = ?auto_284023 ?auto_284024 ) ) ( not ( = ?auto_284023 ?auto_284025 ) ) ( not ( = ?auto_284023 ?auto_284026 ) ) ( not ( = ?auto_284023 ?auto_284027 ) ) ( not ( = ?auto_284023 ?auto_284028 ) ) ( not ( = ?auto_284023 ?auto_284029 ) ) ( not ( = ?auto_284023 ?auto_284030 ) ) ( not ( = ?auto_284024 ?auto_284025 ) ) ( not ( = ?auto_284024 ?auto_284026 ) ) ( not ( = ?auto_284024 ?auto_284027 ) ) ( not ( = ?auto_284024 ?auto_284028 ) ) ( not ( = ?auto_284024 ?auto_284029 ) ) ( not ( = ?auto_284024 ?auto_284030 ) ) ( not ( = ?auto_284025 ?auto_284026 ) ) ( not ( = ?auto_284025 ?auto_284027 ) ) ( not ( = ?auto_284025 ?auto_284028 ) ) ( not ( = ?auto_284025 ?auto_284029 ) ) ( not ( = ?auto_284025 ?auto_284030 ) ) ( not ( = ?auto_284026 ?auto_284027 ) ) ( not ( = ?auto_284026 ?auto_284028 ) ) ( not ( = ?auto_284026 ?auto_284029 ) ) ( not ( = ?auto_284026 ?auto_284030 ) ) ( not ( = ?auto_284027 ?auto_284028 ) ) ( not ( = ?auto_284027 ?auto_284029 ) ) ( not ( = ?auto_284027 ?auto_284030 ) ) ( not ( = ?auto_284028 ?auto_284029 ) ) ( not ( = ?auto_284028 ?auto_284030 ) ) ( not ( = ?auto_284029 ?auto_284030 ) ) ( ON ?auto_284028 ?auto_284029 ) ( ON ?auto_284027 ?auto_284028 ) ( ON ?auto_284026 ?auto_284027 ) ( CLEAR ?auto_284024 ) ( ON ?auto_284025 ?auto_284026 ) ( CLEAR ?auto_284025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_284023 ?auto_284024 ?auto_284025 )
      ( MAKE-7PILE ?auto_284023 ?auto_284024 ?auto_284025 ?auto_284026 ?auto_284027 ?auto_284028 ?auto_284029 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_284053 - BLOCK
      ?auto_284054 - BLOCK
      ?auto_284055 - BLOCK
      ?auto_284056 - BLOCK
      ?auto_284057 - BLOCK
      ?auto_284058 - BLOCK
      ?auto_284059 - BLOCK
    )
    :vars
    (
      ?auto_284060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_284059 ?auto_284060 ) ( ON-TABLE ?auto_284053 ) ( not ( = ?auto_284053 ?auto_284054 ) ) ( not ( = ?auto_284053 ?auto_284055 ) ) ( not ( = ?auto_284053 ?auto_284056 ) ) ( not ( = ?auto_284053 ?auto_284057 ) ) ( not ( = ?auto_284053 ?auto_284058 ) ) ( not ( = ?auto_284053 ?auto_284059 ) ) ( not ( = ?auto_284053 ?auto_284060 ) ) ( not ( = ?auto_284054 ?auto_284055 ) ) ( not ( = ?auto_284054 ?auto_284056 ) ) ( not ( = ?auto_284054 ?auto_284057 ) ) ( not ( = ?auto_284054 ?auto_284058 ) ) ( not ( = ?auto_284054 ?auto_284059 ) ) ( not ( = ?auto_284054 ?auto_284060 ) ) ( not ( = ?auto_284055 ?auto_284056 ) ) ( not ( = ?auto_284055 ?auto_284057 ) ) ( not ( = ?auto_284055 ?auto_284058 ) ) ( not ( = ?auto_284055 ?auto_284059 ) ) ( not ( = ?auto_284055 ?auto_284060 ) ) ( not ( = ?auto_284056 ?auto_284057 ) ) ( not ( = ?auto_284056 ?auto_284058 ) ) ( not ( = ?auto_284056 ?auto_284059 ) ) ( not ( = ?auto_284056 ?auto_284060 ) ) ( not ( = ?auto_284057 ?auto_284058 ) ) ( not ( = ?auto_284057 ?auto_284059 ) ) ( not ( = ?auto_284057 ?auto_284060 ) ) ( not ( = ?auto_284058 ?auto_284059 ) ) ( not ( = ?auto_284058 ?auto_284060 ) ) ( not ( = ?auto_284059 ?auto_284060 ) ) ( ON ?auto_284058 ?auto_284059 ) ( ON ?auto_284057 ?auto_284058 ) ( ON ?auto_284056 ?auto_284057 ) ( ON ?auto_284055 ?auto_284056 ) ( CLEAR ?auto_284053 ) ( ON ?auto_284054 ?auto_284055 ) ( CLEAR ?auto_284054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_284053 ?auto_284054 )
      ( MAKE-7PILE ?auto_284053 ?auto_284054 ?auto_284055 ?auto_284056 ?auto_284057 ?auto_284058 ?auto_284059 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_284083 - BLOCK
      ?auto_284084 - BLOCK
      ?auto_284085 - BLOCK
      ?auto_284086 - BLOCK
      ?auto_284087 - BLOCK
      ?auto_284088 - BLOCK
      ?auto_284089 - BLOCK
    )
    :vars
    (
      ?auto_284090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_284089 ?auto_284090 ) ( not ( = ?auto_284083 ?auto_284084 ) ) ( not ( = ?auto_284083 ?auto_284085 ) ) ( not ( = ?auto_284083 ?auto_284086 ) ) ( not ( = ?auto_284083 ?auto_284087 ) ) ( not ( = ?auto_284083 ?auto_284088 ) ) ( not ( = ?auto_284083 ?auto_284089 ) ) ( not ( = ?auto_284083 ?auto_284090 ) ) ( not ( = ?auto_284084 ?auto_284085 ) ) ( not ( = ?auto_284084 ?auto_284086 ) ) ( not ( = ?auto_284084 ?auto_284087 ) ) ( not ( = ?auto_284084 ?auto_284088 ) ) ( not ( = ?auto_284084 ?auto_284089 ) ) ( not ( = ?auto_284084 ?auto_284090 ) ) ( not ( = ?auto_284085 ?auto_284086 ) ) ( not ( = ?auto_284085 ?auto_284087 ) ) ( not ( = ?auto_284085 ?auto_284088 ) ) ( not ( = ?auto_284085 ?auto_284089 ) ) ( not ( = ?auto_284085 ?auto_284090 ) ) ( not ( = ?auto_284086 ?auto_284087 ) ) ( not ( = ?auto_284086 ?auto_284088 ) ) ( not ( = ?auto_284086 ?auto_284089 ) ) ( not ( = ?auto_284086 ?auto_284090 ) ) ( not ( = ?auto_284087 ?auto_284088 ) ) ( not ( = ?auto_284087 ?auto_284089 ) ) ( not ( = ?auto_284087 ?auto_284090 ) ) ( not ( = ?auto_284088 ?auto_284089 ) ) ( not ( = ?auto_284088 ?auto_284090 ) ) ( not ( = ?auto_284089 ?auto_284090 ) ) ( ON ?auto_284088 ?auto_284089 ) ( ON ?auto_284087 ?auto_284088 ) ( ON ?auto_284086 ?auto_284087 ) ( ON ?auto_284085 ?auto_284086 ) ( ON ?auto_284084 ?auto_284085 ) ( ON ?auto_284083 ?auto_284084 ) ( CLEAR ?auto_284083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_284083 )
      ( MAKE-7PILE ?auto_284083 ?auto_284084 ?auto_284085 ?auto_284086 ?auto_284087 ?auto_284088 ?auto_284089 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_284114 - BLOCK
      ?auto_284115 - BLOCK
      ?auto_284116 - BLOCK
      ?auto_284117 - BLOCK
      ?auto_284118 - BLOCK
      ?auto_284119 - BLOCK
      ?auto_284120 - BLOCK
      ?auto_284121 - BLOCK
    )
    :vars
    (
      ?auto_284122 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_284120 ) ( ON ?auto_284121 ?auto_284122 ) ( CLEAR ?auto_284121 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_284114 ) ( ON ?auto_284115 ?auto_284114 ) ( ON ?auto_284116 ?auto_284115 ) ( ON ?auto_284117 ?auto_284116 ) ( ON ?auto_284118 ?auto_284117 ) ( ON ?auto_284119 ?auto_284118 ) ( ON ?auto_284120 ?auto_284119 ) ( not ( = ?auto_284114 ?auto_284115 ) ) ( not ( = ?auto_284114 ?auto_284116 ) ) ( not ( = ?auto_284114 ?auto_284117 ) ) ( not ( = ?auto_284114 ?auto_284118 ) ) ( not ( = ?auto_284114 ?auto_284119 ) ) ( not ( = ?auto_284114 ?auto_284120 ) ) ( not ( = ?auto_284114 ?auto_284121 ) ) ( not ( = ?auto_284114 ?auto_284122 ) ) ( not ( = ?auto_284115 ?auto_284116 ) ) ( not ( = ?auto_284115 ?auto_284117 ) ) ( not ( = ?auto_284115 ?auto_284118 ) ) ( not ( = ?auto_284115 ?auto_284119 ) ) ( not ( = ?auto_284115 ?auto_284120 ) ) ( not ( = ?auto_284115 ?auto_284121 ) ) ( not ( = ?auto_284115 ?auto_284122 ) ) ( not ( = ?auto_284116 ?auto_284117 ) ) ( not ( = ?auto_284116 ?auto_284118 ) ) ( not ( = ?auto_284116 ?auto_284119 ) ) ( not ( = ?auto_284116 ?auto_284120 ) ) ( not ( = ?auto_284116 ?auto_284121 ) ) ( not ( = ?auto_284116 ?auto_284122 ) ) ( not ( = ?auto_284117 ?auto_284118 ) ) ( not ( = ?auto_284117 ?auto_284119 ) ) ( not ( = ?auto_284117 ?auto_284120 ) ) ( not ( = ?auto_284117 ?auto_284121 ) ) ( not ( = ?auto_284117 ?auto_284122 ) ) ( not ( = ?auto_284118 ?auto_284119 ) ) ( not ( = ?auto_284118 ?auto_284120 ) ) ( not ( = ?auto_284118 ?auto_284121 ) ) ( not ( = ?auto_284118 ?auto_284122 ) ) ( not ( = ?auto_284119 ?auto_284120 ) ) ( not ( = ?auto_284119 ?auto_284121 ) ) ( not ( = ?auto_284119 ?auto_284122 ) ) ( not ( = ?auto_284120 ?auto_284121 ) ) ( not ( = ?auto_284120 ?auto_284122 ) ) ( not ( = ?auto_284121 ?auto_284122 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_284121 ?auto_284122 )
      ( !STACK ?auto_284121 ?auto_284120 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_284148 - BLOCK
      ?auto_284149 - BLOCK
      ?auto_284150 - BLOCK
      ?auto_284151 - BLOCK
      ?auto_284152 - BLOCK
      ?auto_284153 - BLOCK
      ?auto_284154 - BLOCK
      ?auto_284155 - BLOCK
    )
    :vars
    (
      ?auto_284156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_284155 ?auto_284156 ) ( ON-TABLE ?auto_284148 ) ( ON ?auto_284149 ?auto_284148 ) ( ON ?auto_284150 ?auto_284149 ) ( ON ?auto_284151 ?auto_284150 ) ( ON ?auto_284152 ?auto_284151 ) ( ON ?auto_284153 ?auto_284152 ) ( not ( = ?auto_284148 ?auto_284149 ) ) ( not ( = ?auto_284148 ?auto_284150 ) ) ( not ( = ?auto_284148 ?auto_284151 ) ) ( not ( = ?auto_284148 ?auto_284152 ) ) ( not ( = ?auto_284148 ?auto_284153 ) ) ( not ( = ?auto_284148 ?auto_284154 ) ) ( not ( = ?auto_284148 ?auto_284155 ) ) ( not ( = ?auto_284148 ?auto_284156 ) ) ( not ( = ?auto_284149 ?auto_284150 ) ) ( not ( = ?auto_284149 ?auto_284151 ) ) ( not ( = ?auto_284149 ?auto_284152 ) ) ( not ( = ?auto_284149 ?auto_284153 ) ) ( not ( = ?auto_284149 ?auto_284154 ) ) ( not ( = ?auto_284149 ?auto_284155 ) ) ( not ( = ?auto_284149 ?auto_284156 ) ) ( not ( = ?auto_284150 ?auto_284151 ) ) ( not ( = ?auto_284150 ?auto_284152 ) ) ( not ( = ?auto_284150 ?auto_284153 ) ) ( not ( = ?auto_284150 ?auto_284154 ) ) ( not ( = ?auto_284150 ?auto_284155 ) ) ( not ( = ?auto_284150 ?auto_284156 ) ) ( not ( = ?auto_284151 ?auto_284152 ) ) ( not ( = ?auto_284151 ?auto_284153 ) ) ( not ( = ?auto_284151 ?auto_284154 ) ) ( not ( = ?auto_284151 ?auto_284155 ) ) ( not ( = ?auto_284151 ?auto_284156 ) ) ( not ( = ?auto_284152 ?auto_284153 ) ) ( not ( = ?auto_284152 ?auto_284154 ) ) ( not ( = ?auto_284152 ?auto_284155 ) ) ( not ( = ?auto_284152 ?auto_284156 ) ) ( not ( = ?auto_284153 ?auto_284154 ) ) ( not ( = ?auto_284153 ?auto_284155 ) ) ( not ( = ?auto_284153 ?auto_284156 ) ) ( not ( = ?auto_284154 ?auto_284155 ) ) ( not ( = ?auto_284154 ?auto_284156 ) ) ( not ( = ?auto_284155 ?auto_284156 ) ) ( CLEAR ?auto_284153 ) ( ON ?auto_284154 ?auto_284155 ) ( CLEAR ?auto_284154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_284148 ?auto_284149 ?auto_284150 ?auto_284151 ?auto_284152 ?auto_284153 ?auto_284154 )
      ( MAKE-8PILE ?auto_284148 ?auto_284149 ?auto_284150 ?auto_284151 ?auto_284152 ?auto_284153 ?auto_284154 ?auto_284155 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_284182 - BLOCK
      ?auto_284183 - BLOCK
      ?auto_284184 - BLOCK
      ?auto_284185 - BLOCK
      ?auto_284186 - BLOCK
      ?auto_284187 - BLOCK
      ?auto_284188 - BLOCK
      ?auto_284189 - BLOCK
    )
    :vars
    (
      ?auto_284190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_284189 ?auto_284190 ) ( ON-TABLE ?auto_284182 ) ( ON ?auto_284183 ?auto_284182 ) ( ON ?auto_284184 ?auto_284183 ) ( ON ?auto_284185 ?auto_284184 ) ( ON ?auto_284186 ?auto_284185 ) ( not ( = ?auto_284182 ?auto_284183 ) ) ( not ( = ?auto_284182 ?auto_284184 ) ) ( not ( = ?auto_284182 ?auto_284185 ) ) ( not ( = ?auto_284182 ?auto_284186 ) ) ( not ( = ?auto_284182 ?auto_284187 ) ) ( not ( = ?auto_284182 ?auto_284188 ) ) ( not ( = ?auto_284182 ?auto_284189 ) ) ( not ( = ?auto_284182 ?auto_284190 ) ) ( not ( = ?auto_284183 ?auto_284184 ) ) ( not ( = ?auto_284183 ?auto_284185 ) ) ( not ( = ?auto_284183 ?auto_284186 ) ) ( not ( = ?auto_284183 ?auto_284187 ) ) ( not ( = ?auto_284183 ?auto_284188 ) ) ( not ( = ?auto_284183 ?auto_284189 ) ) ( not ( = ?auto_284183 ?auto_284190 ) ) ( not ( = ?auto_284184 ?auto_284185 ) ) ( not ( = ?auto_284184 ?auto_284186 ) ) ( not ( = ?auto_284184 ?auto_284187 ) ) ( not ( = ?auto_284184 ?auto_284188 ) ) ( not ( = ?auto_284184 ?auto_284189 ) ) ( not ( = ?auto_284184 ?auto_284190 ) ) ( not ( = ?auto_284185 ?auto_284186 ) ) ( not ( = ?auto_284185 ?auto_284187 ) ) ( not ( = ?auto_284185 ?auto_284188 ) ) ( not ( = ?auto_284185 ?auto_284189 ) ) ( not ( = ?auto_284185 ?auto_284190 ) ) ( not ( = ?auto_284186 ?auto_284187 ) ) ( not ( = ?auto_284186 ?auto_284188 ) ) ( not ( = ?auto_284186 ?auto_284189 ) ) ( not ( = ?auto_284186 ?auto_284190 ) ) ( not ( = ?auto_284187 ?auto_284188 ) ) ( not ( = ?auto_284187 ?auto_284189 ) ) ( not ( = ?auto_284187 ?auto_284190 ) ) ( not ( = ?auto_284188 ?auto_284189 ) ) ( not ( = ?auto_284188 ?auto_284190 ) ) ( not ( = ?auto_284189 ?auto_284190 ) ) ( ON ?auto_284188 ?auto_284189 ) ( CLEAR ?auto_284186 ) ( ON ?auto_284187 ?auto_284188 ) ( CLEAR ?auto_284187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_284182 ?auto_284183 ?auto_284184 ?auto_284185 ?auto_284186 ?auto_284187 )
      ( MAKE-8PILE ?auto_284182 ?auto_284183 ?auto_284184 ?auto_284185 ?auto_284186 ?auto_284187 ?auto_284188 ?auto_284189 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_284216 - BLOCK
      ?auto_284217 - BLOCK
      ?auto_284218 - BLOCK
      ?auto_284219 - BLOCK
      ?auto_284220 - BLOCK
      ?auto_284221 - BLOCK
      ?auto_284222 - BLOCK
      ?auto_284223 - BLOCK
    )
    :vars
    (
      ?auto_284224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_284223 ?auto_284224 ) ( ON-TABLE ?auto_284216 ) ( ON ?auto_284217 ?auto_284216 ) ( ON ?auto_284218 ?auto_284217 ) ( ON ?auto_284219 ?auto_284218 ) ( not ( = ?auto_284216 ?auto_284217 ) ) ( not ( = ?auto_284216 ?auto_284218 ) ) ( not ( = ?auto_284216 ?auto_284219 ) ) ( not ( = ?auto_284216 ?auto_284220 ) ) ( not ( = ?auto_284216 ?auto_284221 ) ) ( not ( = ?auto_284216 ?auto_284222 ) ) ( not ( = ?auto_284216 ?auto_284223 ) ) ( not ( = ?auto_284216 ?auto_284224 ) ) ( not ( = ?auto_284217 ?auto_284218 ) ) ( not ( = ?auto_284217 ?auto_284219 ) ) ( not ( = ?auto_284217 ?auto_284220 ) ) ( not ( = ?auto_284217 ?auto_284221 ) ) ( not ( = ?auto_284217 ?auto_284222 ) ) ( not ( = ?auto_284217 ?auto_284223 ) ) ( not ( = ?auto_284217 ?auto_284224 ) ) ( not ( = ?auto_284218 ?auto_284219 ) ) ( not ( = ?auto_284218 ?auto_284220 ) ) ( not ( = ?auto_284218 ?auto_284221 ) ) ( not ( = ?auto_284218 ?auto_284222 ) ) ( not ( = ?auto_284218 ?auto_284223 ) ) ( not ( = ?auto_284218 ?auto_284224 ) ) ( not ( = ?auto_284219 ?auto_284220 ) ) ( not ( = ?auto_284219 ?auto_284221 ) ) ( not ( = ?auto_284219 ?auto_284222 ) ) ( not ( = ?auto_284219 ?auto_284223 ) ) ( not ( = ?auto_284219 ?auto_284224 ) ) ( not ( = ?auto_284220 ?auto_284221 ) ) ( not ( = ?auto_284220 ?auto_284222 ) ) ( not ( = ?auto_284220 ?auto_284223 ) ) ( not ( = ?auto_284220 ?auto_284224 ) ) ( not ( = ?auto_284221 ?auto_284222 ) ) ( not ( = ?auto_284221 ?auto_284223 ) ) ( not ( = ?auto_284221 ?auto_284224 ) ) ( not ( = ?auto_284222 ?auto_284223 ) ) ( not ( = ?auto_284222 ?auto_284224 ) ) ( not ( = ?auto_284223 ?auto_284224 ) ) ( ON ?auto_284222 ?auto_284223 ) ( ON ?auto_284221 ?auto_284222 ) ( CLEAR ?auto_284219 ) ( ON ?auto_284220 ?auto_284221 ) ( CLEAR ?auto_284220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_284216 ?auto_284217 ?auto_284218 ?auto_284219 ?auto_284220 )
      ( MAKE-8PILE ?auto_284216 ?auto_284217 ?auto_284218 ?auto_284219 ?auto_284220 ?auto_284221 ?auto_284222 ?auto_284223 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_284250 - BLOCK
      ?auto_284251 - BLOCK
      ?auto_284252 - BLOCK
      ?auto_284253 - BLOCK
      ?auto_284254 - BLOCK
      ?auto_284255 - BLOCK
      ?auto_284256 - BLOCK
      ?auto_284257 - BLOCK
    )
    :vars
    (
      ?auto_284258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_284257 ?auto_284258 ) ( ON-TABLE ?auto_284250 ) ( ON ?auto_284251 ?auto_284250 ) ( ON ?auto_284252 ?auto_284251 ) ( not ( = ?auto_284250 ?auto_284251 ) ) ( not ( = ?auto_284250 ?auto_284252 ) ) ( not ( = ?auto_284250 ?auto_284253 ) ) ( not ( = ?auto_284250 ?auto_284254 ) ) ( not ( = ?auto_284250 ?auto_284255 ) ) ( not ( = ?auto_284250 ?auto_284256 ) ) ( not ( = ?auto_284250 ?auto_284257 ) ) ( not ( = ?auto_284250 ?auto_284258 ) ) ( not ( = ?auto_284251 ?auto_284252 ) ) ( not ( = ?auto_284251 ?auto_284253 ) ) ( not ( = ?auto_284251 ?auto_284254 ) ) ( not ( = ?auto_284251 ?auto_284255 ) ) ( not ( = ?auto_284251 ?auto_284256 ) ) ( not ( = ?auto_284251 ?auto_284257 ) ) ( not ( = ?auto_284251 ?auto_284258 ) ) ( not ( = ?auto_284252 ?auto_284253 ) ) ( not ( = ?auto_284252 ?auto_284254 ) ) ( not ( = ?auto_284252 ?auto_284255 ) ) ( not ( = ?auto_284252 ?auto_284256 ) ) ( not ( = ?auto_284252 ?auto_284257 ) ) ( not ( = ?auto_284252 ?auto_284258 ) ) ( not ( = ?auto_284253 ?auto_284254 ) ) ( not ( = ?auto_284253 ?auto_284255 ) ) ( not ( = ?auto_284253 ?auto_284256 ) ) ( not ( = ?auto_284253 ?auto_284257 ) ) ( not ( = ?auto_284253 ?auto_284258 ) ) ( not ( = ?auto_284254 ?auto_284255 ) ) ( not ( = ?auto_284254 ?auto_284256 ) ) ( not ( = ?auto_284254 ?auto_284257 ) ) ( not ( = ?auto_284254 ?auto_284258 ) ) ( not ( = ?auto_284255 ?auto_284256 ) ) ( not ( = ?auto_284255 ?auto_284257 ) ) ( not ( = ?auto_284255 ?auto_284258 ) ) ( not ( = ?auto_284256 ?auto_284257 ) ) ( not ( = ?auto_284256 ?auto_284258 ) ) ( not ( = ?auto_284257 ?auto_284258 ) ) ( ON ?auto_284256 ?auto_284257 ) ( ON ?auto_284255 ?auto_284256 ) ( ON ?auto_284254 ?auto_284255 ) ( CLEAR ?auto_284252 ) ( ON ?auto_284253 ?auto_284254 ) ( CLEAR ?auto_284253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_284250 ?auto_284251 ?auto_284252 ?auto_284253 )
      ( MAKE-8PILE ?auto_284250 ?auto_284251 ?auto_284252 ?auto_284253 ?auto_284254 ?auto_284255 ?auto_284256 ?auto_284257 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_284284 - BLOCK
      ?auto_284285 - BLOCK
      ?auto_284286 - BLOCK
      ?auto_284287 - BLOCK
      ?auto_284288 - BLOCK
      ?auto_284289 - BLOCK
      ?auto_284290 - BLOCK
      ?auto_284291 - BLOCK
    )
    :vars
    (
      ?auto_284292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_284291 ?auto_284292 ) ( ON-TABLE ?auto_284284 ) ( ON ?auto_284285 ?auto_284284 ) ( not ( = ?auto_284284 ?auto_284285 ) ) ( not ( = ?auto_284284 ?auto_284286 ) ) ( not ( = ?auto_284284 ?auto_284287 ) ) ( not ( = ?auto_284284 ?auto_284288 ) ) ( not ( = ?auto_284284 ?auto_284289 ) ) ( not ( = ?auto_284284 ?auto_284290 ) ) ( not ( = ?auto_284284 ?auto_284291 ) ) ( not ( = ?auto_284284 ?auto_284292 ) ) ( not ( = ?auto_284285 ?auto_284286 ) ) ( not ( = ?auto_284285 ?auto_284287 ) ) ( not ( = ?auto_284285 ?auto_284288 ) ) ( not ( = ?auto_284285 ?auto_284289 ) ) ( not ( = ?auto_284285 ?auto_284290 ) ) ( not ( = ?auto_284285 ?auto_284291 ) ) ( not ( = ?auto_284285 ?auto_284292 ) ) ( not ( = ?auto_284286 ?auto_284287 ) ) ( not ( = ?auto_284286 ?auto_284288 ) ) ( not ( = ?auto_284286 ?auto_284289 ) ) ( not ( = ?auto_284286 ?auto_284290 ) ) ( not ( = ?auto_284286 ?auto_284291 ) ) ( not ( = ?auto_284286 ?auto_284292 ) ) ( not ( = ?auto_284287 ?auto_284288 ) ) ( not ( = ?auto_284287 ?auto_284289 ) ) ( not ( = ?auto_284287 ?auto_284290 ) ) ( not ( = ?auto_284287 ?auto_284291 ) ) ( not ( = ?auto_284287 ?auto_284292 ) ) ( not ( = ?auto_284288 ?auto_284289 ) ) ( not ( = ?auto_284288 ?auto_284290 ) ) ( not ( = ?auto_284288 ?auto_284291 ) ) ( not ( = ?auto_284288 ?auto_284292 ) ) ( not ( = ?auto_284289 ?auto_284290 ) ) ( not ( = ?auto_284289 ?auto_284291 ) ) ( not ( = ?auto_284289 ?auto_284292 ) ) ( not ( = ?auto_284290 ?auto_284291 ) ) ( not ( = ?auto_284290 ?auto_284292 ) ) ( not ( = ?auto_284291 ?auto_284292 ) ) ( ON ?auto_284290 ?auto_284291 ) ( ON ?auto_284289 ?auto_284290 ) ( ON ?auto_284288 ?auto_284289 ) ( ON ?auto_284287 ?auto_284288 ) ( CLEAR ?auto_284285 ) ( ON ?auto_284286 ?auto_284287 ) ( CLEAR ?auto_284286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_284284 ?auto_284285 ?auto_284286 )
      ( MAKE-8PILE ?auto_284284 ?auto_284285 ?auto_284286 ?auto_284287 ?auto_284288 ?auto_284289 ?auto_284290 ?auto_284291 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_284318 - BLOCK
      ?auto_284319 - BLOCK
      ?auto_284320 - BLOCK
      ?auto_284321 - BLOCK
      ?auto_284322 - BLOCK
      ?auto_284323 - BLOCK
      ?auto_284324 - BLOCK
      ?auto_284325 - BLOCK
    )
    :vars
    (
      ?auto_284326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_284325 ?auto_284326 ) ( ON-TABLE ?auto_284318 ) ( not ( = ?auto_284318 ?auto_284319 ) ) ( not ( = ?auto_284318 ?auto_284320 ) ) ( not ( = ?auto_284318 ?auto_284321 ) ) ( not ( = ?auto_284318 ?auto_284322 ) ) ( not ( = ?auto_284318 ?auto_284323 ) ) ( not ( = ?auto_284318 ?auto_284324 ) ) ( not ( = ?auto_284318 ?auto_284325 ) ) ( not ( = ?auto_284318 ?auto_284326 ) ) ( not ( = ?auto_284319 ?auto_284320 ) ) ( not ( = ?auto_284319 ?auto_284321 ) ) ( not ( = ?auto_284319 ?auto_284322 ) ) ( not ( = ?auto_284319 ?auto_284323 ) ) ( not ( = ?auto_284319 ?auto_284324 ) ) ( not ( = ?auto_284319 ?auto_284325 ) ) ( not ( = ?auto_284319 ?auto_284326 ) ) ( not ( = ?auto_284320 ?auto_284321 ) ) ( not ( = ?auto_284320 ?auto_284322 ) ) ( not ( = ?auto_284320 ?auto_284323 ) ) ( not ( = ?auto_284320 ?auto_284324 ) ) ( not ( = ?auto_284320 ?auto_284325 ) ) ( not ( = ?auto_284320 ?auto_284326 ) ) ( not ( = ?auto_284321 ?auto_284322 ) ) ( not ( = ?auto_284321 ?auto_284323 ) ) ( not ( = ?auto_284321 ?auto_284324 ) ) ( not ( = ?auto_284321 ?auto_284325 ) ) ( not ( = ?auto_284321 ?auto_284326 ) ) ( not ( = ?auto_284322 ?auto_284323 ) ) ( not ( = ?auto_284322 ?auto_284324 ) ) ( not ( = ?auto_284322 ?auto_284325 ) ) ( not ( = ?auto_284322 ?auto_284326 ) ) ( not ( = ?auto_284323 ?auto_284324 ) ) ( not ( = ?auto_284323 ?auto_284325 ) ) ( not ( = ?auto_284323 ?auto_284326 ) ) ( not ( = ?auto_284324 ?auto_284325 ) ) ( not ( = ?auto_284324 ?auto_284326 ) ) ( not ( = ?auto_284325 ?auto_284326 ) ) ( ON ?auto_284324 ?auto_284325 ) ( ON ?auto_284323 ?auto_284324 ) ( ON ?auto_284322 ?auto_284323 ) ( ON ?auto_284321 ?auto_284322 ) ( ON ?auto_284320 ?auto_284321 ) ( CLEAR ?auto_284318 ) ( ON ?auto_284319 ?auto_284320 ) ( CLEAR ?auto_284319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_284318 ?auto_284319 )
      ( MAKE-8PILE ?auto_284318 ?auto_284319 ?auto_284320 ?auto_284321 ?auto_284322 ?auto_284323 ?auto_284324 ?auto_284325 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_284352 - BLOCK
      ?auto_284353 - BLOCK
      ?auto_284354 - BLOCK
      ?auto_284355 - BLOCK
      ?auto_284356 - BLOCK
      ?auto_284357 - BLOCK
      ?auto_284358 - BLOCK
      ?auto_284359 - BLOCK
    )
    :vars
    (
      ?auto_284360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_284359 ?auto_284360 ) ( not ( = ?auto_284352 ?auto_284353 ) ) ( not ( = ?auto_284352 ?auto_284354 ) ) ( not ( = ?auto_284352 ?auto_284355 ) ) ( not ( = ?auto_284352 ?auto_284356 ) ) ( not ( = ?auto_284352 ?auto_284357 ) ) ( not ( = ?auto_284352 ?auto_284358 ) ) ( not ( = ?auto_284352 ?auto_284359 ) ) ( not ( = ?auto_284352 ?auto_284360 ) ) ( not ( = ?auto_284353 ?auto_284354 ) ) ( not ( = ?auto_284353 ?auto_284355 ) ) ( not ( = ?auto_284353 ?auto_284356 ) ) ( not ( = ?auto_284353 ?auto_284357 ) ) ( not ( = ?auto_284353 ?auto_284358 ) ) ( not ( = ?auto_284353 ?auto_284359 ) ) ( not ( = ?auto_284353 ?auto_284360 ) ) ( not ( = ?auto_284354 ?auto_284355 ) ) ( not ( = ?auto_284354 ?auto_284356 ) ) ( not ( = ?auto_284354 ?auto_284357 ) ) ( not ( = ?auto_284354 ?auto_284358 ) ) ( not ( = ?auto_284354 ?auto_284359 ) ) ( not ( = ?auto_284354 ?auto_284360 ) ) ( not ( = ?auto_284355 ?auto_284356 ) ) ( not ( = ?auto_284355 ?auto_284357 ) ) ( not ( = ?auto_284355 ?auto_284358 ) ) ( not ( = ?auto_284355 ?auto_284359 ) ) ( not ( = ?auto_284355 ?auto_284360 ) ) ( not ( = ?auto_284356 ?auto_284357 ) ) ( not ( = ?auto_284356 ?auto_284358 ) ) ( not ( = ?auto_284356 ?auto_284359 ) ) ( not ( = ?auto_284356 ?auto_284360 ) ) ( not ( = ?auto_284357 ?auto_284358 ) ) ( not ( = ?auto_284357 ?auto_284359 ) ) ( not ( = ?auto_284357 ?auto_284360 ) ) ( not ( = ?auto_284358 ?auto_284359 ) ) ( not ( = ?auto_284358 ?auto_284360 ) ) ( not ( = ?auto_284359 ?auto_284360 ) ) ( ON ?auto_284358 ?auto_284359 ) ( ON ?auto_284357 ?auto_284358 ) ( ON ?auto_284356 ?auto_284357 ) ( ON ?auto_284355 ?auto_284356 ) ( ON ?auto_284354 ?auto_284355 ) ( ON ?auto_284353 ?auto_284354 ) ( ON ?auto_284352 ?auto_284353 ) ( CLEAR ?auto_284352 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_284352 )
      ( MAKE-8PILE ?auto_284352 ?auto_284353 ?auto_284354 ?auto_284355 ?auto_284356 ?auto_284357 ?auto_284358 ?auto_284359 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_284387 - BLOCK
      ?auto_284388 - BLOCK
      ?auto_284389 - BLOCK
      ?auto_284390 - BLOCK
      ?auto_284391 - BLOCK
      ?auto_284392 - BLOCK
      ?auto_284393 - BLOCK
      ?auto_284394 - BLOCK
      ?auto_284395 - BLOCK
    )
    :vars
    (
      ?auto_284396 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_284394 ) ( ON ?auto_284395 ?auto_284396 ) ( CLEAR ?auto_284395 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_284387 ) ( ON ?auto_284388 ?auto_284387 ) ( ON ?auto_284389 ?auto_284388 ) ( ON ?auto_284390 ?auto_284389 ) ( ON ?auto_284391 ?auto_284390 ) ( ON ?auto_284392 ?auto_284391 ) ( ON ?auto_284393 ?auto_284392 ) ( ON ?auto_284394 ?auto_284393 ) ( not ( = ?auto_284387 ?auto_284388 ) ) ( not ( = ?auto_284387 ?auto_284389 ) ) ( not ( = ?auto_284387 ?auto_284390 ) ) ( not ( = ?auto_284387 ?auto_284391 ) ) ( not ( = ?auto_284387 ?auto_284392 ) ) ( not ( = ?auto_284387 ?auto_284393 ) ) ( not ( = ?auto_284387 ?auto_284394 ) ) ( not ( = ?auto_284387 ?auto_284395 ) ) ( not ( = ?auto_284387 ?auto_284396 ) ) ( not ( = ?auto_284388 ?auto_284389 ) ) ( not ( = ?auto_284388 ?auto_284390 ) ) ( not ( = ?auto_284388 ?auto_284391 ) ) ( not ( = ?auto_284388 ?auto_284392 ) ) ( not ( = ?auto_284388 ?auto_284393 ) ) ( not ( = ?auto_284388 ?auto_284394 ) ) ( not ( = ?auto_284388 ?auto_284395 ) ) ( not ( = ?auto_284388 ?auto_284396 ) ) ( not ( = ?auto_284389 ?auto_284390 ) ) ( not ( = ?auto_284389 ?auto_284391 ) ) ( not ( = ?auto_284389 ?auto_284392 ) ) ( not ( = ?auto_284389 ?auto_284393 ) ) ( not ( = ?auto_284389 ?auto_284394 ) ) ( not ( = ?auto_284389 ?auto_284395 ) ) ( not ( = ?auto_284389 ?auto_284396 ) ) ( not ( = ?auto_284390 ?auto_284391 ) ) ( not ( = ?auto_284390 ?auto_284392 ) ) ( not ( = ?auto_284390 ?auto_284393 ) ) ( not ( = ?auto_284390 ?auto_284394 ) ) ( not ( = ?auto_284390 ?auto_284395 ) ) ( not ( = ?auto_284390 ?auto_284396 ) ) ( not ( = ?auto_284391 ?auto_284392 ) ) ( not ( = ?auto_284391 ?auto_284393 ) ) ( not ( = ?auto_284391 ?auto_284394 ) ) ( not ( = ?auto_284391 ?auto_284395 ) ) ( not ( = ?auto_284391 ?auto_284396 ) ) ( not ( = ?auto_284392 ?auto_284393 ) ) ( not ( = ?auto_284392 ?auto_284394 ) ) ( not ( = ?auto_284392 ?auto_284395 ) ) ( not ( = ?auto_284392 ?auto_284396 ) ) ( not ( = ?auto_284393 ?auto_284394 ) ) ( not ( = ?auto_284393 ?auto_284395 ) ) ( not ( = ?auto_284393 ?auto_284396 ) ) ( not ( = ?auto_284394 ?auto_284395 ) ) ( not ( = ?auto_284394 ?auto_284396 ) ) ( not ( = ?auto_284395 ?auto_284396 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_284395 ?auto_284396 )
      ( !STACK ?auto_284395 ?auto_284394 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_284425 - BLOCK
      ?auto_284426 - BLOCK
      ?auto_284427 - BLOCK
      ?auto_284428 - BLOCK
      ?auto_284429 - BLOCK
      ?auto_284430 - BLOCK
      ?auto_284431 - BLOCK
      ?auto_284432 - BLOCK
      ?auto_284433 - BLOCK
    )
    :vars
    (
      ?auto_284434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_284433 ?auto_284434 ) ( ON-TABLE ?auto_284425 ) ( ON ?auto_284426 ?auto_284425 ) ( ON ?auto_284427 ?auto_284426 ) ( ON ?auto_284428 ?auto_284427 ) ( ON ?auto_284429 ?auto_284428 ) ( ON ?auto_284430 ?auto_284429 ) ( ON ?auto_284431 ?auto_284430 ) ( not ( = ?auto_284425 ?auto_284426 ) ) ( not ( = ?auto_284425 ?auto_284427 ) ) ( not ( = ?auto_284425 ?auto_284428 ) ) ( not ( = ?auto_284425 ?auto_284429 ) ) ( not ( = ?auto_284425 ?auto_284430 ) ) ( not ( = ?auto_284425 ?auto_284431 ) ) ( not ( = ?auto_284425 ?auto_284432 ) ) ( not ( = ?auto_284425 ?auto_284433 ) ) ( not ( = ?auto_284425 ?auto_284434 ) ) ( not ( = ?auto_284426 ?auto_284427 ) ) ( not ( = ?auto_284426 ?auto_284428 ) ) ( not ( = ?auto_284426 ?auto_284429 ) ) ( not ( = ?auto_284426 ?auto_284430 ) ) ( not ( = ?auto_284426 ?auto_284431 ) ) ( not ( = ?auto_284426 ?auto_284432 ) ) ( not ( = ?auto_284426 ?auto_284433 ) ) ( not ( = ?auto_284426 ?auto_284434 ) ) ( not ( = ?auto_284427 ?auto_284428 ) ) ( not ( = ?auto_284427 ?auto_284429 ) ) ( not ( = ?auto_284427 ?auto_284430 ) ) ( not ( = ?auto_284427 ?auto_284431 ) ) ( not ( = ?auto_284427 ?auto_284432 ) ) ( not ( = ?auto_284427 ?auto_284433 ) ) ( not ( = ?auto_284427 ?auto_284434 ) ) ( not ( = ?auto_284428 ?auto_284429 ) ) ( not ( = ?auto_284428 ?auto_284430 ) ) ( not ( = ?auto_284428 ?auto_284431 ) ) ( not ( = ?auto_284428 ?auto_284432 ) ) ( not ( = ?auto_284428 ?auto_284433 ) ) ( not ( = ?auto_284428 ?auto_284434 ) ) ( not ( = ?auto_284429 ?auto_284430 ) ) ( not ( = ?auto_284429 ?auto_284431 ) ) ( not ( = ?auto_284429 ?auto_284432 ) ) ( not ( = ?auto_284429 ?auto_284433 ) ) ( not ( = ?auto_284429 ?auto_284434 ) ) ( not ( = ?auto_284430 ?auto_284431 ) ) ( not ( = ?auto_284430 ?auto_284432 ) ) ( not ( = ?auto_284430 ?auto_284433 ) ) ( not ( = ?auto_284430 ?auto_284434 ) ) ( not ( = ?auto_284431 ?auto_284432 ) ) ( not ( = ?auto_284431 ?auto_284433 ) ) ( not ( = ?auto_284431 ?auto_284434 ) ) ( not ( = ?auto_284432 ?auto_284433 ) ) ( not ( = ?auto_284432 ?auto_284434 ) ) ( not ( = ?auto_284433 ?auto_284434 ) ) ( CLEAR ?auto_284431 ) ( ON ?auto_284432 ?auto_284433 ) ( CLEAR ?auto_284432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_284425 ?auto_284426 ?auto_284427 ?auto_284428 ?auto_284429 ?auto_284430 ?auto_284431 ?auto_284432 )
      ( MAKE-9PILE ?auto_284425 ?auto_284426 ?auto_284427 ?auto_284428 ?auto_284429 ?auto_284430 ?auto_284431 ?auto_284432 ?auto_284433 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_284463 - BLOCK
      ?auto_284464 - BLOCK
      ?auto_284465 - BLOCK
      ?auto_284466 - BLOCK
      ?auto_284467 - BLOCK
      ?auto_284468 - BLOCK
      ?auto_284469 - BLOCK
      ?auto_284470 - BLOCK
      ?auto_284471 - BLOCK
    )
    :vars
    (
      ?auto_284472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_284471 ?auto_284472 ) ( ON-TABLE ?auto_284463 ) ( ON ?auto_284464 ?auto_284463 ) ( ON ?auto_284465 ?auto_284464 ) ( ON ?auto_284466 ?auto_284465 ) ( ON ?auto_284467 ?auto_284466 ) ( ON ?auto_284468 ?auto_284467 ) ( not ( = ?auto_284463 ?auto_284464 ) ) ( not ( = ?auto_284463 ?auto_284465 ) ) ( not ( = ?auto_284463 ?auto_284466 ) ) ( not ( = ?auto_284463 ?auto_284467 ) ) ( not ( = ?auto_284463 ?auto_284468 ) ) ( not ( = ?auto_284463 ?auto_284469 ) ) ( not ( = ?auto_284463 ?auto_284470 ) ) ( not ( = ?auto_284463 ?auto_284471 ) ) ( not ( = ?auto_284463 ?auto_284472 ) ) ( not ( = ?auto_284464 ?auto_284465 ) ) ( not ( = ?auto_284464 ?auto_284466 ) ) ( not ( = ?auto_284464 ?auto_284467 ) ) ( not ( = ?auto_284464 ?auto_284468 ) ) ( not ( = ?auto_284464 ?auto_284469 ) ) ( not ( = ?auto_284464 ?auto_284470 ) ) ( not ( = ?auto_284464 ?auto_284471 ) ) ( not ( = ?auto_284464 ?auto_284472 ) ) ( not ( = ?auto_284465 ?auto_284466 ) ) ( not ( = ?auto_284465 ?auto_284467 ) ) ( not ( = ?auto_284465 ?auto_284468 ) ) ( not ( = ?auto_284465 ?auto_284469 ) ) ( not ( = ?auto_284465 ?auto_284470 ) ) ( not ( = ?auto_284465 ?auto_284471 ) ) ( not ( = ?auto_284465 ?auto_284472 ) ) ( not ( = ?auto_284466 ?auto_284467 ) ) ( not ( = ?auto_284466 ?auto_284468 ) ) ( not ( = ?auto_284466 ?auto_284469 ) ) ( not ( = ?auto_284466 ?auto_284470 ) ) ( not ( = ?auto_284466 ?auto_284471 ) ) ( not ( = ?auto_284466 ?auto_284472 ) ) ( not ( = ?auto_284467 ?auto_284468 ) ) ( not ( = ?auto_284467 ?auto_284469 ) ) ( not ( = ?auto_284467 ?auto_284470 ) ) ( not ( = ?auto_284467 ?auto_284471 ) ) ( not ( = ?auto_284467 ?auto_284472 ) ) ( not ( = ?auto_284468 ?auto_284469 ) ) ( not ( = ?auto_284468 ?auto_284470 ) ) ( not ( = ?auto_284468 ?auto_284471 ) ) ( not ( = ?auto_284468 ?auto_284472 ) ) ( not ( = ?auto_284469 ?auto_284470 ) ) ( not ( = ?auto_284469 ?auto_284471 ) ) ( not ( = ?auto_284469 ?auto_284472 ) ) ( not ( = ?auto_284470 ?auto_284471 ) ) ( not ( = ?auto_284470 ?auto_284472 ) ) ( not ( = ?auto_284471 ?auto_284472 ) ) ( ON ?auto_284470 ?auto_284471 ) ( CLEAR ?auto_284468 ) ( ON ?auto_284469 ?auto_284470 ) ( CLEAR ?auto_284469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_284463 ?auto_284464 ?auto_284465 ?auto_284466 ?auto_284467 ?auto_284468 ?auto_284469 )
      ( MAKE-9PILE ?auto_284463 ?auto_284464 ?auto_284465 ?auto_284466 ?auto_284467 ?auto_284468 ?auto_284469 ?auto_284470 ?auto_284471 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_284501 - BLOCK
      ?auto_284502 - BLOCK
      ?auto_284503 - BLOCK
      ?auto_284504 - BLOCK
      ?auto_284505 - BLOCK
      ?auto_284506 - BLOCK
      ?auto_284507 - BLOCK
      ?auto_284508 - BLOCK
      ?auto_284509 - BLOCK
    )
    :vars
    (
      ?auto_284510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_284509 ?auto_284510 ) ( ON-TABLE ?auto_284501 ) ( ON ?auto_284502 ?auto_284501 ) ( ON ?auto_284503 ?auto_284502 ) ( ON ?auto_284504 ?auto_284503 ) ( ON ?auto_284505 ?auto_284504 ) ( not ( = ?auto_284501 ?auto_284502 ) ) ( not ( = ?auto_284501 ?auto_284503 ) ) ( not ( = ?auto_284501 ?auto_284504 ) ) ( not ( = ?auto_284501 ?auto_284505 ) ) ( not ( = ?auto_284501 ?auto_284506 ) ) ( not ( = ?auto_284501 ?auto_284507 ) ) ( not ( = ?auto_284501 ?auto_284508 ) ) ( not ( = ?auto_284501 ?auto_284509 ) ) ( not ( = ?auto_284501 ?auto_284510 ) ) ( not ( = ?auto_284502 ?auto_284503 ) ) ( not ( = ?auto_284502 ?auto_284504 ) ) ( not ( = ?auto_284502 ?auto_284505 ) ) ( not ( = ?auto_284502 ?auto_284506 ) ) ( not ( = ?auto_284502 ?auto_284507 ) ) ( not ( = ?auto_284502 ?auto_284508 ) ) ( not ( = ?auto_284502 ?auto_284509 ) ) ( not ( = ?auto_284502 ?auto_284510 ) ) ( not ( = ?auto_284503 ?auto_284504 ) ) ( not ( = ?auto_284503 ?auto_284505 ) ) ( not ( = ?auto_284503 ?auto_284506 ) ) ( not ( = ?auto_284503 ?auto_284507 ) ) ( not ( = ?auto_284503 ?auto_284508 ) ) ( not ( = ?auto_284503 ?auto_284509 ) ) ( not ( = ?auto_284503 ?auto_284510 ) ) ( not ( = ?auto_284504 ?auto_284505 ) ) ( not ( = ?auto_284504 ?auto_284506 ) ) ( not ( = ?auto_284504 ?auto_284507 ) ) ( not ( = ?auto_284504 ?auto_284508 ) ) ( not ( = ?auto_284504 ?auto_284509 ) ) ( not ( = ?auto_284504 ?auto_284510 ) ) ( not ( = ?auto_284505 ?auto_284506 ) ) ( not ( = ?auto_284505 ?auto_284507 ) ) ( not ( = ?auto_284505 ?auto_284508 ) ) ( not ( = ?auto_284505 ?auto_284509 ) ) ( not ( = ?auto_284505 ?auto_284510 ) ) ( not ( = ?auto_284506 ?auto_284507 ) ) ( not ( = ?auto_284506 ?auto_284508 ) ) ( not ( = ?auto_284506 ?auto_284509 ) ) ( not ( = ?auto_284506 ?auto_284510 ) ) ( not ( = ?auto_284507 ?auto_284508 ) ) ( not ( = ?auto_284507 ?auto_284509 ) ) ( not ( = ?auto_284507 ?auto_284510 ) ) ( not ( = ?auto_284508 ?auto_284509 ) ) ( not ( = ?auto_284508 ?auto_284510 ) ) ( not ( = ?auto_284509 ?auto_284510 ) ) ( ON ?auto_284508 ?auto_284509 ) ( ON ?auto_284507 ?auto_284508 ) ( CLEAR ?auto_284505 ) ( ON ?auto_284506 ?auto_284507 ) ( CLEAR ?auto_284506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_284501 ?auto_284502 ?auto_284503 ?auto_284504 ?auto_284505 ?auto_284506 )
      ( MAKE-9PILE ?auto_284501 ?auto_284502 ?auto_284503 ?auto_284504 ?auto_284505 ?auto_284506 ?auto_284507 ?auto_284508 ?auto_284509 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_284539 - BLOCK
      ?auto_284540 - BLOCK
      ?auto_284541 - BLOCK
      ?auto_284542 - BLOCK
      ?auto_284543 - BLOCK
      ?auto_284544 - BLOCK
      ?auto_284545 - BLOCK
      ?auto_284546 - BLOCK
      ?auto_284547 - BLOCK
    )
    :vars
    (
      ?auto_284548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_284547 ?auto_284548 ) ( ON-TABLE ?auto_284539 ) ( ON ?auto_284540 ?auto_284539 ) ( ON ?auto_284541 ?auto_284540 ) ( ON ?auto_284542 ?auto_284541 ) ( not ( = ?auto_284539 ?auto_284540 ) ) ( not ( = ?auto_284539 ?auto_284541 ) ) ( not ( = ?auto_284539 ?auto_284542 ) ) ( not ( = ?auto_284539 ?auto_284543 ) ) ( not ( = ?auto_284539 ?auto_284544 ) ) ( not ( = ?auto_284539 ?auto_284545 ) ) ( not ( = ?auto_284539 ?auto_284546 ) ) ( not ( = ?auto_284539 ?auto_284547 ) ) ( not ( = ?auto_284539 ?auto_284548 ) ) ( not ( = ?auto_284540 ?auto_284541 ) ) ( not ( = ?auto_284540 ?auto_284542 ) ) ( not ( = ?auto_284540 ?auto_284543 ) ) ( not ( = ?auto_284540 ?auto_284544 ) ) ( not ( = ?auto_284540 ?auto_284545 ) ) ( not ( = ?auto_284540 ?auto_284546 ) ) ( not ( = ?auto_284540 ?auto_284547 ) ) ( not ( = ?auto_284540 ?auto_284548 ) ) ( not ( = ?auto_284541 ?auto_284542 ) ) ( not ( = ?auto_284541 ?auto_284543 ) ) ( not ( = ?auto_284541 ?auto_284544 ) ) ( not ( = ?auto_284541 ?auto_284545 ) ) ( not ( = ?auto_284541 ?auto_284546 ) ) ( not ( = ?auto_284541 ?auto_284547 ) ) ( not ( = ?auto_284541 ?auto_284548 ) ) ( not ( = ?auto_284542 ?auto_284543 ) ) ( not ( = ?auto_284542 ?auto_284544 ) ) ( not ( = ?auto_284542 ?auto_284545 ) ) ( not ( = ?auto_284542 ?auto_284546 ) ) ( not ( = ?auto_284542 ?auto_284547 ) ) ( not ( = ?auto_284542 ?auto_284548 ) ) ( not ( = ?auto_284543 ?auto_284544 ) ) ( not ( = ?auto_284543 ?auto_284545 ) ) ( not ( = ?auto_284543 ?auto_284546 ) ) ( not ( = ?auto_284543 ?auto_284547 ) ) ( not ( = ?auto_284543 ?auto_284548 ) ) ( not ( = ?auto_284544 ?auto_284545 ) ) ( not ( = ?auto_284544 ?auto_284546 ) ) ( not ( = ?auto_284544 ?auto_284547 ) ) ( not ( = ?auto_284544 ?auto_284548 ) ) ( not ( = ?auto_284545 ?auto_284546 ) ) ( not ( = ?auto_284545 ?auto_284547 ) ) ( not ( = ?auto_284545 ?auto_284548 ) ) ( not ( = ?auto_284546 ?auto_284547 ) ) ( not ( = ?auto_284546 ?auto_284548 ) ) ( not ( = ?auto_284547 ?auto_284548 ) ) ( ON ?auto_284546 ?auto_284547 ) ( ON ?auto_284545 ?auto_284546 ) ( ON ?auto_284544 ?auto_284545 ) ( CLEAR ?auto_284542 ) ( ON ?auto_284543 ?auto_284544 ) ( CLEAR ?auto_284543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_284539 ?auto_284540 ?auto_284541 ?auto_284542 ?auto_284543 )
      ( MAKE-9PILE ?auto_284539 ?auto_284540 ?auto_284541 ?auto_284542 ?auto_284543 ?auto_284544 ?auto_284545 ?auto_284546 ?auto_284547 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_284577 - BLOCK
      ?auto_284578 - BLOCK
      ?auto_284579 - BLOCK
      ?auto_284580 - BLOCK
      ?auto_284581 - BLOCK
      ?auto_284582 - BLOCK
      ?auto_284583 - BLOCK
      ?auto_284584 - BLOCK
      ?auto_284585 - BLOCK
    )
    :vars
    (
      ?auto_284586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_284585 ?auto_284586 ) ( ON-TABLE ?auto_284577 ) ( ON ?auto_284578 ?auto_284577 ) ( ON ?auto_284579 ?auto_284578 ) ( not ( = ?auto_284577 ?auto_284578 ) ) ( not ( = ?auto_284577 ?auto_284579 ) ) ( not ( = ?auto_284577 ?auto_284580 ) ) ( not ( = ?auto_284577 ?auto_284581 ) ) ( not ( = ?auto_284577 ?auto_284582 ) ) ( not ( = ?auto_284577 ?auto_284583 ) ) ( not ( = ?auto_284577 ?auto_284584 ) ) ( not ( = ?auto_284577 ?auto_284585 ) ) ( not ( = ?auto_284577 ?auto_284586 ) ) ( not ( = ?auto_284578 ?auto_284579 ) ) ( not ( = ?auto_284578 ?auto_284580 ) ) ( not ( = ?auto_284578 ?auto_284581 ) ) ( not ( = ?auto_284578 ?auto_284582 ) ) ( not ( = ?auto_284578 ?auto_284583 ) ) ( not ( = ?auto_284578 ?auto_284584 ) ) ( not ( = ?auto_284578 ?auto_284585 ) ) ( not ( = ?auto_284578 ?auto_284586 ) ) ( not ( = ?auto_284579 ?auto_284580 ) ) ( not ( = ?auto_284579 ?auto_284581 ) ) ( not ( = ?auto_284579 ?auto_284582 ) ) ( not ( = ?auto_284579 ?auto_284583 ) ) ( not ( = ?auto_284579 ?auto_284584 ) ) ( not ( = ?auto_284579 ?auto_284585 ) ) ( not ( = ?auto_284579 ?auto_284586 ) ) ( not ( = ?auto_284580 ?auto_284581 ) ) ( not ( = ?auto_284580 ?auto_284582 ) ) ( not ( = ?auto_284580 ?auto_284583 ) ) ( not ( = ?auto_284580 ?auto_284584 ) ) ( not ( = ?auto_284580 ?auto_284585 ) ) ( not ( = ?auto_284580 ?auto_284586 ) ) ( not ( = ?auto_284581 ?auto_284582 ) ) ( not ( = ?auto_284581 ?auto_284583 ) ) ( not ( = ?auto_284581 ?auto_284584 ) ) ( not ( = ?auto_284581 ?auto_284585 ) ) ( not ( = ?auto_284581 ?auto_284586 ) ) ( not ( = ?auto_284582 ?auto_284583 ) ) ( not ( = ?auto_284582 ?auto_284584 ) ) ( not ( = ?auto_284582 ?auto_284585 ) ) ( not ( = ?auto_284582 ?auto_284586 ) ) ( not ( = ?auto_284583 ?auto_284584 ) ) ( not ( = ?auto_284583 ?auto_284585 ) ) ( not ( = ?auto_284583 ?auto_284586 ) ) ( not ( = ?auto_284584 ?auto_284585 ) ) ( not ( = ?auto_284584 ?auto_284586 ) ) ( not ( = ?auto_284585 ?auto_284586 ) ) ( ON ?auto_284584 ?auto_284585 ) ( ON ?auto_284583 ?auto_284584 ) ( ON ?auto_284582 ?auto_284583 ) ( ON ?auto_284581 ?auto_284582 ) ( CLEAR ?auto_284579 ) ( ON ?auto_284580 ?auto_284581 ) ( CLEAR ?auto_284580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_284577 ?auto_284578 ?auto_284579 ?auto_284580 )
      ( MAKE-9PILE ?auto_284577 ?auto_284578 ?auto_284579 ?auto_284580 ?auto_284581 ?auto_284582 ?auto_284583 ?auto_284584 ?auto_284585 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_284615 - BLOCK
      ?auto_284616 - BLOCK
      ?auto_284617 - BLOCK
      ?auto_284618 - BLOCK
      ?auto_284619 - BLOCK
      ?auto_284620 - BLOCK
      ?auto_284621 - BLOCK
      ?auto_284622 - BLOCK
      ?auto_284623 - BLOCK
    )
    :vars
    (
      ?auto_284624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_284623 ?auto_284624 ) ( ON-TABLE ?auto_284615 ) ( ON ?auto_284616 ?auto_284615 ) ( not ( = ?auto_284615 ?auto_284616 ) ) ( not ( = ?auto_284615 ?auto_284617 ) ) ( not ( = ?auto_284615 ?auto_284618 ) ) ( not ( = ?auto_284615 ?auto_284619 ) ) ( not ( = ?auto_284615 ?auto_284620 ) ) ( not ( = ?auto_284615 ?auto_284621 ) ) ( not ( = ?auto_284615 ?auto_284622 ) ) ( not ( = ?auto_284615 ?auto_284623 ) ) ( not ( = ?auto_284615 ?auto_284624 ) ) ( not ( = ?auto_284616 ?auto_284617 ) ) ( not ( = ?auto_284616 ?auto_284618 ) ) ( not ( = ?auto_284616 ?auto_284619 ) ) ( not ( = ?auto_284616 ?auto_284620 ) ) ( not ( = ?auto_284616 ?auto_284621 ) ) ( not ( = ?auto_284616 ?auto_284622 ) ) ( not ( = ?auto_284616 ?auto_284623 ) ) ( not ( = ?auto_284616 ?auto_284624 ) ) ( not ( = ?auto_284617 ?auto_284618 ) ) ( not ( = ?auto_284617 ?auto_284619 ) ) ( not ( = ?auto_284617 ?auto_284620 ) ) ( not ( = ?auto_284617 ?auto_284621 ) ) ( not ( = ?auto_284617 ?auto_284622 ) ) ( not ( = ?auto_284617 ?auto_284623 ) ) ( not ( = ?auto_284617 ?auto_284624 ) ) ( not ( = ?auto_284618 ?auto_284619 ) ) ( not ( = ?auto_284618 ?auto_284620 ) ) ( not ( = ?auto_284618 ?auto_284621 ) ) ( not ( = ?auto_284618 ?auto_284622 ) ) ( not ( = ?auto_284618 ?auto_284623 ) ) ( not ( = ?auto_284618 ?auto_284624 ) ) ( not ( = ?auto_284619 ?auto_284620 ) ) ( not ( = ?auto_284619 ?auto_284621 ) ) ( not ( = ?auto_284619 ?auto_284622 ) ) ( not ( = ?auto_284619 ?auto_284623 ) ) ( not ( = ?auto_284619 ?auto_284624 ) ) ( not ( = ?auto_284620 ?auto_284621 ) ) ( not ( = ?auto_284620 ?auto_284622 ) ) ( not ( = ?auto_284620 ?auto_284623 ) ) ( not ( = ?auto_284620 ?auto_284624 ) ) ( not ( = ?auto_284621 ?auto_284622 ) ) ( not ( = ?auto_284621 ?auto_284623 ) ) ( not ( = ?auto_284621 ?auto_284624 ) ) ( not ( = ?auto_284622 ?auto_284623 ) ) ( not ( = ?auto_284622 ?auto_284624 ) ) ( not ( = ?auto_284623 ?auto_284624 ) ) ( ON ?auto_284622 ?auto_284623 ) ( ON ?auto_284621 ?auto_284622 ) ( ON ?auto_284620 ?auto_284621 ) ( ON ?auto_284619 ?auto_284620 ) ( ON ?auto_284618 ?auto_284619 ) ( CLEAR ?auto_284616 ) ( ON ?auto_284617 ?auto_284618 ) ( CLEAR ?auto_284617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_284615 ?auto_284616 ?auto_284617 )
      ( MAKE-9PILE ?auto_284615 ?auto_284616 ?auto_284617 ?auto_284618 ?auto_284619 ?auto_284620 ?auto_284621 ?auto_284622 ?auto_284623 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_284653 - BLOCK
      ?auto_284654 - BLOCK
      ?auto_284655 - BLOCK
      ?auto_284656 - BLOCK
      ?auto_284657 - BLOCK
      ?auto_284658 - BLOCK
      ?auto_284659 - BLOCK
      ?auto_284660 - BLOCK
      ?auto_284661 - BLOCK
    )
    :vars
    (
      ?auto_284662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_284661 ?auto_284662 ) ( ON-TABLE ?auto_284653 ) ( not ( = ?auto_284653 ?auto_284654 ) ) ( not ( = ?auto_284653 ?auto_284655 ) ) ( not ( = ?auto_284653 ?auto_284656 ) ) ( not ( = ?auto_284653 ?auto_284657 ) ) ( not ( = ?auto_284653 ?auto_284658 ) ) ( not ( = ?auto_284653 ?auto_284659 ) ) ( not ( = ?auto_284653 ?auto_284660 ) ) ( not ( = ?auto_284653 ?auto_284661 ) ) ( not ( = ?auto_284653 ?auto_284662 ) ) ( not ( = ?auto_284654 ?auto_284655 ) ) ( not ( = ?auto_284654 ?auto_284656 ) ) ( not ( = ?auto_284654 ?auto_284657 ) ) ( not ( = ?auto_284654 ?auto_284658 ) ) ( not ( = ?auto_284654 ?auto_284659 ) ) ( not ( = ?auto_284654 ?auto_284660 ) ) ( not ( = ?auto_284654 ?auto_284661 ) ) ( not ( = ?auto_284654 ?auto_284662 ) ) ( not ( = ?auto_284655 ?auto_284656 ) ) ( not ( = ?auto_284655 ?auto_284657 ) ) ( not ( = ?auto_284655 ?auto_284658 ) ) ( not ( = ?auto_284655 ?auto_284659 ) ) ( not ( = ?auto_284655 ?auto_284660 ) ) ( not ( = ?auto_284655 ?auto_284661 ) ) ( not ( = ?auto_284655 ?auto_284662 ) ) ( not ( = ?auto_284656 ?auto_284657 ) ) ( not ( = ?auto_284656 ?auto_284658 ) ) ( not ( = ?auto_284656 ?auto_284659 ) ) ( not ( = ?auto_284656 ?auto_284660 ) ) ( not ( = ?auto_284656 ?auto_284661 ) ) ( not ( = ?auto_284656 ?auto_284662 ) ) ( not ( = ?auto_284657 ?auto_284658 ) ) ( not ( = ?auto_284657 ?auto_284659 ) ) ( not ( = ?auto_284657 ?auto_284660 ) ) ( not ( = ?auto_284657 ?auto_284661 ) ) ( not ( = ?auto_284657 ?auto_284662 ) ) ( not ( = ?auto_284658 ?auto_284659 ) ) ( not ( = ?auto_284658 ?auto_284660 ) ) ( not ( = ?auto_284658 ?auto_284661 ) ) ( not ( = ?auto_284658 ?auto_284662 ) ) ( not ( = ?auto_284659 ?auto_284660 ) ) ( not ( = ?auto_284659 ?auto_284661 ) ) ( not ( = ?auto_284659 ?auto_284662 ) ) ( not ( = ?auto_284660 ?auto_284661 ) ) ( not ( = ?auto_284660 ?auto_284662 ) ) ( not ( = ?auto_284661 ?auto_284662 ) ) ( ON ?auto_284660 ?auto_284661 ) ( ON ?auto_284659 ?auto_284660 ) ( ON ?auto_284658 ?auto_284659 ) ( ON ?auto_284657 ?auto_284658 ) ( ON ?auto_284656 ?auto_284657 ) ( ON ?auto_284655 ?auto_284656 ) ( CLEAR ?auto_284653 ) ( ON ?auto_284654 ?auto_284655 ) ( CLEAR ?auto_284654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_284653 ?auto_284654 )
      ( MAKE-9PILE ?auto_284653 ?auto_284654 ?auto_284655 ?auto_284656 ?auto_284657 ?auto_284658 ?auto_284659 ?auto_284660 ?auto_284661 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_284691 - BLOCK
      ?auto_284692 - BLOCK
      ?auto_284693 - BLOCK
      ?auto_284694 - BLOCK
      ?auto_284695 - BLOCK
      ?auto_284696 - BLOCK
      ?auto_284697 - BLOCK
      ?auto_284698 - BLOCK
      ?auto_284699 - BLOCK
    )
    :vars
    (
      ?auto_284700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_284699 ?auto_284700 ) ( not ( = ?auto_284691 ?auto_284692 ) ) ( not ( = ?auto_284691 ?auto_284693 ) ) ( not ( = ?auto_284691 ?auto_284694 ) ) ( not ( = ?auto_284691 ?auto_284695 ) ) ( not ( = ?auto_284691 ?auto_284696 ) ) ( not ( = ?auto_284691 ?auto_284697 ) ) ( not ( = ?auto_284691 ?auto_284698 ) ) ( not ( = ?auto_284691 ?auto_284699 ) ) ( not ( = ?auto_284691 ?auto_284700 ) ) ( not ( = ?auto_284692 ?auto_284693 ) ) ( not ( = ?auto_284692 ?auto_284694 ) ) ( not ( = ?auto_284692 ?auto_284695 ) ) ( not ( = ?auto_284692 ?auto_284696 ) ) ( not ( = ?auto_284692 ?auto_284697 ) ) ( not ( = ?auto_284692 ?auto_284698 ) ) ( not ( = ?auto_284692 ?auto_284699 ) ) ( not ( = ?auto_284692 ?auto_284700 ) ) ( not ( = ?auto_284693 ?auto_284694 ) ) ( not ( = ?auto_284693 ?auto_284695 ) ) ( not ( = ?auto_284693 ?auto_284696 ) ) ( not ( = ?auto_284693 ?auto_284697 ) ) ( not ( = ?auto_284693 ?auto_284698 ) ) ( not ( = ?auto_284693 ?auto_284699 ) ) ( not ( = ?auto_284693 ?auto_284700 ) ) ( not ( = ?auto_284694 ?auto_284695 ) ) ( not ( = ?auto_284694 ?auto_284696 ) ) ( not ( = ?auto_284694 ?auto_284697 ) ) ( not ( = ?auto_284694 ?auto_284698 ) ) ( not ( = ?auto_284694 ?auto_284699 ) ) ( not ( = ?auto_284694 ?auto_284700 ) ) ( not ( = ?auto_284695 ?auto_284696 ) ) ( not ( = ?auto_284695 ?auto_284697 ) ) ( not ( = ?auto_284695 ?auto_284698 ) ) ( not ( = ?auto_284695 ?auto_284699 ) ) ( not ( = ?auto_284695 ?auto_284700 ) ) ( not ( = ?auto_284696 ?auto_284697 ) ) ( not ( = ?auto_284696 ?auto_284698 ) ) ( not ( = ?auto_284696 ?auto_284699 ) ) ( not ( = ?auto_284696 ?auto_284700 ) ) ( not ( = ?auto_284697 ?auto_284698 ) ) ( not ( = ?auto_284697 ?auto_284699 ) ) ( not ( = ?auto_284697 ?auto_284700 ) ) ( not ( = ?auto_284698 ?auto_284699 ) ) ( not ( = ?auto_284698 ?auto_284700 ) ) ( not ( = ?auto_284699 ?auto_284700 ) ) ( ON ?auto_284698 ?auto_284699 ) ( ON ?auto_284697 ?auto_284698 ) ( ON ?auto_284696 ?auto_284697 ) ( ON ?auto_284695 ?auto_284696 ) ( ON ?auto_284694 ?auto_284695 ) ( ON ?auto_284693 ?auto_284694 ) ( ON ?auto_284692 ?auto_284693 ) ( ON ?auto_284691 ?auto_284692 ) ( CLEAR ?auto_284691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_284691 )
      ( MAKE-9PILE ?auto_284691 ?auto_284692 ?auto_284693 ?auto_284694 ?auto_284695 ?auto_284696 ?auto_284697 ?auto_284698 ?auto_284699 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_284730 - BLOCK
      ?auto_284731 - BLOCK
      ?auto_284732 - BLOCK
      ?auto_284733 - BLOCK
      ?auto_284734 - BLOCK
      ?auto_284735 - BLOCK
      ?auto_284736 - BLOCK
      ?auto_284737 - BLOCK
      ?auto_284738 - BLOCK
      ?auto_284739 - BLOCK
    )
    :vars
    (
      ?auto_284740 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_284738 ) ( ON ?auto_284739 ?auto_284740 ) ( CLEAR ?auto_284739 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_284730 ) ( ON ?auto_284731 ?auto_284730 ) ( ON ?auto_284732 ?auto_284731 ) ( ON ?auto_284733 ?auto_284732 ) ( ON ?auto_284734 ?auto_284733 ) ( ON ?auto_284735 ?auto_284734 ) ( ON ?auto_284736 ?auto_284735 ) ( ON ?auto_284737 ?auto_284736 ) ( ON ?auto_284738 ?auto_284737 ) ( not ( = ?auto_284730 ?auto_284731 ) ) ( not ( = ?auto_284730 ?auto_284732 ) ) ( not ( = ?auto_284730 ?auto_284733 ) ) ( not ( = ?auto_284730 ?auto_284734 ) ) ( not ( = ?auto_284730 ?auto_284735 ) ) ( not ( = ?auto_284730 ?auto_284736 ) ) ( not ( = ?auto_284730 ?auto_284737 ) ) ( not ( = ?auto_284730 ?auto_284738 ) ) ( not ( = ?auto_284730 ?auto_284739 ) ) ( not ( = ?auto_284730 ?auto_284740 ) ) ( not ( = ?auto_284731 ?auto_284732 ) ) ( not ( = ?auto_284731 ?auto_284733 ) ) ( not ( = ?auto_284731 ?auto_284734 ) ) ( not ( = ?auto_284731 ?auto_284735 ) ) ( not ( = ?auto_284731 ?auto_284736 ) ) ( not ( = ?auto_284731 ?auto_284737 ) ) ( not ( = ?auto_284731 ?auto_284738 ) ) ( not ( = ?auto_284731 ?auto_284739 ) ) ( not ( = ?auto_284731 ?auto_284740 ) ) ( not ( = ?auto_284732 ?auto_284733 ) ) ( not ( = ?auto_284732 ?auto_284734 ) ) ( not ( = ?auto_284732 ?auto_284735 ) ) ( not ( = ?auto_284732 ?auto_284736 ) ) ( not ( = ?auto_284732 ?auto_284737 ) ) ( not ( = ?auto_284732 ?auto_284738 ) ) ( not ( = ?auto_284732 ?auto_284739 ) ) ( not ( = ?auto_284732 ?auto_284740 ) ) ( not ( = ?auto_284733 ?auto_284734 ) ) ( not ( = ?auto_284733 ?auto_284735 ) ) ( not ( = ?auto_284733 ?auto_284736 ) ) ( not ( = ?auto_284733 ?auto_284737 ) ) ( not ( = ?auto_284733 ?auto_284738 ) ) ( not ( = ?auto_284733 ?auto_284739 ) ) ( not ( = ?auto_284733 ?auto_284740 ) ) ( not ( = ?auto_284734 ?auto_284735 ) ) ( not ( = ?auto_284734 ?auto_284736 ) ) ( not ( = ?auto_284734 ?auto_284737 ) ) ( not ( = ?auto_284734 ?auto_284738 ) ) ( not ( = ?auto_284734 ?auto_284739 ) ) ( not ( = ?auto_284734 ?auto_284740 ) ) ( not ( = ?auto_284735 ?auto_284736 ) ) ( not ( = ?auto_284735 ?auto_284737 ) ) ( not ( = ?auto_284735 ?auto_284738 ) ) ( not ( = ?auto_284735 ?auto_284739 ) ) ( not ( = ?auto_284735 ?auto_284740 ) ) ( not ( = ?auto_284736 ?auto_284737 ) ) ( not ( = ?auto_284736 ?auto_284738 ) ) ( not ( = ?auto_284736 ?auto_284739 ) ) ( not ( = ?auto_284736 ?auto_284740 ) ) ( not ( = ?auto_284737 ?auto_284738 ) ) ( not ( = ?auto_284737 ?auto_284739 ) ) ( not ( = ?auto_284737 ?auto_284740 ) ) ( not ( = ?auto_284738 ?auto_284739 ) ) ( not ( = ?auto_284738 ?auto_284740 ) ) ( not ( = ?auto_284739 ?auto_284740 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_284739 ?auto_284740 )
      ( !STACK ?auto_284739 ?auto_284738 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_284772 - BLOCK
      ?auto_284773 - BLOCK
      ?auto_284774 - BLOCK
      ?auto_284775 - BLOCK
      ?auto_284776 - BLOCK
      ?auto_284777 - BLOCK
      ?auto_284778 - BLOCK
      ?auto_284779 - BLOCK
      ?auto_284780 - BLOCK
      ?auto_284781 - BLOCK
    )
    :vars
    (
      ?auto_284782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_284781 ?auto_284782 ) ( ON-TABLE ?auto_284772 ) ( ON ?auto_284773 ?auto_284772 ) ( ON ?auto_284774 ?auto_284773 ) ( ON ?auto_284775 ?auto_284774 ) ( ON ?auto_284776 ?auto_284775 ) ( ON ?auto_284777 ?auto_284776 ) ( ON ?auto_284778 ?auto_284777 ) ( ON ?auto_284779 ?auto_284778 ) ( not ( = ?auto_284772 ?auto_284773 ) ) ( not ( = ?auto_284772 ?auto_284774 ) ) ( not ( = ?auto_284772 ?auto_284775 ) ) ( not ( = ?auto_284772 ?auto_284776 ) ) ( not ( = ?auto_284772 ?auto_284777 ) ) ( not ( = ?auto_284772 ?auto_284778 ) ) ( not ( = ?auto_284772 ?auto_284779 ) ) ( not ( = ?auto_284772 ?auto_284780 ) ) ( not ( = ?auto_284772 ?auto_284781 ) ) ( not ( = ?auto_284772 ?auto_284782 ) ) ( not ( = ?auto_284773 ?auto_284774 ) ) ( not ( = ?auto_284773 ?auto_284775 ) ) ( not ( = ?auto_284773 ?auto_284776 ) ) ( not ( = ?auto_284773 ?auto_284777 ) ) ( not ( = ?auto_284773 ?auto_284778 ) ) ( not ( = ?auto_284773 ?auto_284779 ) ) ( not ( = ?auto_284773 ?auto_284780 ) ) ( not ( = ?auto_284773 ?auto_284781 ) ) ( not ( = ?auto_284773 ?auto_284782 ) ) ( not ( = ?auto_284774 ?auto_284775 ) ) ( not ( = ?auto_284774 ?auto_284776 ) ) ( not ( = ?auto_284774 ?auto_284777 ) ) ( not ( = ?auto_284774 ?auto_284778 ) ) ( not ( = ?auto_284774 ?auto_284779 ) ) ( not ( = ?auto_284774 ?auto_284780 ) ) ( not ( = ?auto_284774 ?auto_284781 ) ) ( not ( = ?auto_284774 ?auto_284782 ) ) ( not ( = ?auto_284775 ?auto_284776 ) ) ( not ( = ?auto_284775 ?auto_284777 ) ) ( not ( = ?auto_284775 ?auto_284778 ) ) ( not ( = ?auto_284775 ?auto_284779 ) ) ( not ( = ?auto_284775 ?auto_284780 ) ) ( not ( = ?auto_284775 ?auto_284781 ) ) ( not ( = ?auto_284775 ?auto_284782 ) ) ( not ( = ?auto_284776 ?auto_284777 ) ) ( not ( = ?auto_284776 ?auto_284778 ) ) ( not ( = ?auto_284776 ?auto_284779 ) ) ( not ( = ?auto_284776 ?auto_284780 ) ) ( not ( = ?auto_284776 ?auto_284781 ) ) ( not ( = ?auto_284776 ?auto_284782 ) ) ( not ( = ?auto_284777 ?auto_284778 ) ) ( not ( = ?auto_284777 ?auto_284779 ) ) ( not ( = ?auto_284777 ?auto_284780 ) ) ( not ( = ?auto_284777 ?auto_284781 ) ) ( not ( = ?auto_284777 ?auto_284782 ) ) ( not ( = ?auto_284778 ?auto_284779 ) ) ( not ( = ?auto_284778 ?auto_284780 ) ) ( not ( = ?auto_284778 ?auto_284781 ) ) ( not ( = ?auto_284778 ?auto_284782 ) ) ( not ( = ?auto_284779 ?auto_284780 ) ) ( not ( = ?auto_284779 ?auto_284781 ) ) ( not ( = ?auto_284779 ?auto_284782 ) ) ( not ( = ?auto_284780 ?auto_284781 ) ) ( not ( = ?auto_284780 ?auto_284782 ) ) ( not ( = ?auto_284781 ?auto_284782 ) ) ( CLEAR ?auto_284779 ) ( ON ?auto_284780 ?auto_284781 ) ( CLEAR ?auto_284780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_284772 ?auto_284773 ?auto_284774 ?auto_284775 ?auto_284776 ?auto_284777 ?auto_284778 ?auto_284779 ?auto_284780 )
      ( MAKE-10PILE ?auto_284772 ?auto_284773 ?auto_284774 ?auto_284775 ?auto_284776 ?auto_284777 ?auto_284778 ?auto_284779 ?auto_284780 ?auto_284781 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_284814 - BLOCK
      ?auto_284815 - BLOCK
      ?auto_284816 - BLOCK
      ?auto_284817 - BLOCK
      ?auto_284818 - BLOCK
      ?auto_284819 - BLOCK
      ?auto_284820 - BLOCK
      ?auto_284821 - BLOCK
      ?auto_284822 - BLOCK
      ?auto_284823 - BLOCK
    )
    :vars
    (
      ?auto_284824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_284823 ?auto_284824 ) ( ON-TABLE ?auto_284814 ) ( ON ?auto_284815 ?auto_284814 ) ( ON ?auto_284816 ?auto_284815 ) ( ON ?auto_284817 ?auto_284816 ) ( ON ?auto_284818 ?auto_284817 ) ( ON ?auto_284819 ?auto_284818 ) ( ON ?auto_284820 ?auto_284819 ) ( not ( = ?auto_284814 ?auto_284815 ) ) ( not ( = ?auto_284814 ?auto_284816 ) ) ( not ( = ?auto_284814 ?auto_284817 ) ) ( not ( = ?auto_284814 ?auto_284818 ) ) ( not ( = ?auto_284814 ?auto_284819 ) ) ( not ( = ?auto_284814 ?auto_284820 ) ) ( not ( = ?auto_284814 ?auto_284821 ) ) ( not ( = ?auto_284814 ?auto_284822 ) ) ( not ( = ?auto_284814 ?auto_284823 ) ) ( not ( = ?auto_284814 ?auto_284824 ) ) ( not ( = ?auto_284815 ?auto_284816 ) ) ( not ( = ?auto_284815 ?auto_284817 ) ) ( not ( = ?auto_284815 ?auto_284818 ) ) ( not ( = ?auto_284815 ?auto_284819 ) ) ( not ( = ?auto_284815 ?auto_284820 ) ) ( not ( = ?auto_284815 ?auto_284821 ) ) ( not ( = ?auto_284815 ?auto_284822 ) ) ( not ( = ?auto_284815 ?auto_284823 ) ) ( not ( = ?auto_284815 ?auto_284824 ) ) ( not ( = ?auto_284816 ?auto_284817 ) ) ( not ( = ?auto_284816 ?auto_284818 ) ) ( not ( = ?auto_284816 ?auto_284819 ) ) ( not ( = ?auto_284816 ?auto_284820 ) ) ( not ( = ?auto_284816 ?auto_284821 ) ) ( not ( = ?auto_284816 ?auto_284822 ) ) ( not ( = ?auto_284816 ?auto_284823 ) ) ( not ( = ?auto_284816 ?auto_284824 ) ) ( not ( = ?auto_284817 ?auto_284818 ) ) ( not ( = ?auto_284817 ?auto_284819 ) ) ( not ( = ?auto_284817 ?auto_284820 ) ) ( not ( = ?auto_284817 ?auto_284821 ) ) ( not ( = ?auto_284817 ?auto_284822 ) ) ( not ( = ?auto_284817 ?auto_284823 ) ) ( not ( = ?auto_284817 ?auto_284824 ) ) ( not ( = ?auto_284818 ?auto_284819 ) ) ( not ( = ?auto_284818 ?auto_284820 ) ) ( not ( = ?auto_284818 ?auto_284821 ) ) ( not ( = ?auto_284818 ?auto_284822 ) ) ( not ( = ?auto_284818 ?auto_284823 ) ) ( not ( = ?auto_284818 ?auto_284824 ) ) ( not ( = ?auto_284819 ?auto_284820 ) ) ( not ( = ?auto_284819 ?auto_284821 ) ) ( not ( = ?auto_284819 ?auto_284822 ) ) ( not ( = ?auto_284819 ?auto_284823 ) ) ( not ( = ?auto_284819 ?auto_284824 ) ) ( not ( = ?auto_284820 ?auto_284821 ) ) ( not ( = ?auto_284820 ?auto_284822 ) ) ( not ( = ?auto_284820 ?auto_284823 ) ) ( not ( = ?auto_284820 ?auto_284824 ) ) ( not ( = ?auto_284821 ?auto_284822 ) ) ( not ( = ?auto_284821 ?auto_284823 ) ) ( not ( = ?auto_284821 ?auto_284824 ) ) ( not ( = ?auto_284822 ?auto_284823 ) ) ( not ( = ?auto_284822 ?auto_284824 ) ) ( not ( = ?auto_284823 ?auto_284824 ) ) ( ON ?auto_284822 ?auto_284823 ) ( CLEAR ?auto_284820 ) ( ON ?auto_284821 ?auto_284822 ) ( CLEAR ?auto_284821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_284814 ?auto_284815 ?auto_284816 ?auto_284817 ?auto_284818 ?auto_284819 ?auto_284820 ?auto_284821 )
      ( MAKE-10PILE ?auto_284814 ?auto_284815 ?auto_284816 ?auto_284817 ?auto_284818 ?auto_284819 ?auto_284820 ?auto_284821 ?auto_284822 ?auto_284823 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_284856 - BLOCK
      ?auto_284857 - BLOCK
      ?auto_284858 - BLOCK
      ?auto_284859 - BLOCK
      ?auto_284860 - BLOCK
      ?auto_284861 - BLOCK
      ?auto_284862 - BLOCK
      ?auto_284863 - BLOCK
      ?auto_284864 - BLOCK
      ?auto_284865 - BLOCK
    )
    :vars
    (
      ?auto_284866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_284865 ?auto_284866 ) ( ON-TABLE ?auto_284856 ) ( ON ?auto_284857 ?auto_284856 ) ( ON ?auto_284858 ?auto_284857 ) ( ON ?auto_284859 ?auto_284858 ) ( ON ?auto_284860 ?auto_284859 ) ( ON ?auto_284861 ?auto_284860 ) ( not ( = ?auto_284856 ?auto_284857 ) ) ( not ( = ?auto_284856 ?auto_284858 ) ) ( not ( = ?auto_284856 ?auto_284859 ) ) ( not ( = ?auto_284856 ?auto_284860 ) ) ( not ( = ?auto_284856 ?auto_284861 ) ) ( not ( = ?auto_284856 ?auto_284862 ) ) ( not ( = ?auto_284856 ?auto_284863 ) ) ( not ( = ?auto_284856 ?auto_284864 ) ) ( not ( = ?auto_284856 ?auto_284865 ) ) ( not ( = ?auto_284856 ?auto_284866 ) ) ( not ( = ?auto_284857 ?auto_284858 ) ) ( not ( = ?auto_284857 ?auto_284859 ) ) ( not ( = ?auto_284857 ?auto_284860 ) ) ( not ( = ?auto_284857 ?auto_284861 ) ) ( not ( = ?auto_284857 ?auto_284862 ) ) ( not ( = ?auto_284857 ?auto_284863 ) ) ( not ( = ?auto_284857 ?auto_284864 ) ) ( not ( = ?auto_284857 ?auto_284865 ) ) ( not ( = ?auto_284857 ?auto_284866 ) ) ( not ( = ?auto_284858 ?auto_284859 ) ) ( not ( = ?auto_284858 ?auto_284860 ) ) ( not ( = ?auto_284858 ?auto_284861 ) ) ( not ( = ?auto_284858 ?auto_284862 ) ) ( not ( = ?auto_284858 ?auto_284863 ) ) ( not ( = ?auto_284858 ?auto_284864 ) ) ( not ( = ?auto_284858 ?auto_284865 ) ) ( not ( = ?auto_284858 ?auto_284866 ) ) ( not ( = ?auto_284859 ?auto_284860 ) ) ( not ( = ?auto_284859 ?auto_284861 ) ) ( not ( = ?auto_284859 ?auto_284862 ) ) ( not ( = ?auto_284859 ?auto_284863 ) ) ( not ( = ?auto_284859 ?auto_284864 ) ) ( not ( = ?auto_284859 ?auto_284865 ) ) ( not ( = ?auto_284859 ?auto_284866 ) ) ( not ( = ?auto_284860 ?auto_284861 ) ) ( not ( = ?auto_284860 ?auto_284862 ) ) ( not ( = ?auto_284860 ?auto_284863 ) ) ( not ( = ?auto_284860 ?auto_284864 ) ) ( not ( = ?auto_284860 ?auto_284865 ) ) ( not ( = ?auto_284860 ?auto_284866 ) ) ( not ( = ?auto_284861 ?auto_284862 ) ) ( not ( = ?auto_284861 ?auto_284863 ) ) ( not ( = ?auto_284861 ?auto_284864 ) ) ( not ( = ?auto_284861 ?auto_284865 ) ) ( not ( = ?auto_284861 ?auto_284866 ) ) ( not ( = ?auto_284862 ?auto_284863 ) ) ( not ( = ?auto_284862 ?auto_284864 ) ) ( not ( = ?auto_284862 ?auto_284865 ) ) ( not ( = ?auto_284862 ?auto_284866 ) ) ( not ( = ?auto_284863 ?auto_284864 ) ) ( not ( = ?auto_284863 ?auto_284865 ) ) ( not ( = ?auto_284863 ?auto_284866 ) ) ( not ( = ?auto_284864 ?auto_284865 ) ) ( not ( = ?auto_284864 ?auto_284866 ) ) ( not ( = ?auto_284865 ?auto_284866 ) ) ( ON ?auto_284864 ?auto_284865 ) ( ON ?auto_284863 ?auto_284864 ) ( CLEAR ?auto_284861 ) ( ON ?auto_284862 ?auto_284863 ) ( CLEAR ?auto_284862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_284856 ?auto_284857 ?auto_284858 ?auto_284859 ?auto_284860 ?auto_284861 ?auto_284862 )
      ( MAKE-10PILE ?auto_284856 ?auto_284857 ?auto_284858 ?auto_284859 ?auto_284860 ?auto_284861 ?auto_284862 ?auto_284863 ?auto_284864 ?auto_284865 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_284898 - BLOCK
      ?auto_284899 - BLOCK
      ?auto_284900 - BLOCK
      ?auto_284901 - BLOCK
      ?auto_284902 - BLOCK
      ?auto_284903 - BLOCK
      ?auto_284904 - BLOCK
      ?auto_284905 - BLOCK
      ?auto_284906 - BLOCK
      ?auto_284907 - BLOCK
    )
    :vars
    (
      ?auto_284908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_284907 ?auto_284908 ) ( ON-TABLE ?auto_284898 ) ( ON ?auto_284899 ?auto_284898 ) ( ON ?auto_284900 ?auto_284899 ) ( ON ?auto_284901 ?auto_284900 ) ( ON ?auto_284902 ?auto_284901 ) ( not ( = ?auto_284898 ?auto_284899 ) ) ( not ( = ?auto_284898 ?auto_284900 ) ) ( not ( = ?auto_284898 ?auto_284901 ) ) ( not ( = ?auto_284898 ?auto_284902 ) ) ( not ( = ?auto_284898 ?auto_284903 ) ) ( not ( = ?auto_284898 ?auto_284904 ) ) ( not ( = ?auto_284898 ?auto_284905 ) ) ( not ( = ?auto_284898 ?auto_284906 ) ) ( not ( = ?auto_284898 ?auto_284907 ) ) ( not ( = ?auto_284898 ?auto_284908 ) ) ( not ( = ?auto_284899 ?auto_284900 ) ) ( not ( = ?auto_284899 ?auto_284901 ) ) ( not ( = ?auto_284899 ?auto_284902 ) ) ( not ( = ?auto_284899 ?auto_284903 ) ) ( not ( = ?auto_284899 ?auto_284904 ) ) ( not ( = ?auto_284899 ?auto_284905 ) ) ( not ( = ?auto_284899 ?auto_284906 ) ) ( not ( = ?auto_284899 ?auto_284907 ) ) ( not ( = ?auto_284899 ?auto_284908 ) ) ( not ( = ?auto_284900 ?auto_284901 ) ) ( not ( = ?auto_284900 ?auto_284902 ) ) ( not ( = ?auto_284900 ?auto_284903 ) ) ( not ( = ?auto_284900 ?auto_284904 ) ) ( not ( = ?auto_284900 ?auto_284905 ) ) ( not ( = ?auto_284900 ?auto_284906 ) ) ( not ( = ?auto_284900 ?auto_284907 ) ) ( not ( = ?auto_284900 ?auto_284908 ) ) ( not ( = ?auto_284901 ?auto_284902 ) ) ( not ( = ?auto_284901 ?auto_284903 ) ) ( not ( = ?auto_284901 ?auto_284904 ) ) ( not ( = ?auto_284901 ?auto_284905 ) ) ( not ( = ?auto_284901 ?auto_284906 ) ) ( not ( = ?auto_284901 ?auto_284907 ) ) ( not ( = ?auto_284901 ?auto_284908 ) ) ( not ( = ?auto_284902 ?auto_284903 ) ) ( not ( = ?auto_284902 ?auto_284904 ) ) ( not ( = ?auto_284902 ?auto_284905 ) ) ( not ( = ?auto_284902 ?auto_284906 ) ) ( not ( = ?auto_284902 ?auto_284907 ) ) ( not ( = ?auto_284902 ?auto_284908 ) ) ( not ( = ?auto_284903 ?auto_284904 ) ) ( not ( = ?auto_284903 ?auto_284905 ) ) ( not ( = ?auto_284903 ?auto_284906 ) ) ( not ( = ?auto_284903 ?auto_284907 ) ) ( not ( = ?auto_284903 ?auto_284908 ) ) ( not ( = ?auto_284904 ?auto_284905 ) ) ( not ( = ?auto_284904 ?auto_284906 ) ) ( not ( = ?auto_284904 ?auto_284907 ) ) ( not ( = ?auto_284904 ?auto_284908 ) ) ( not ( = ?auto_284905 ?auto_284906 ) ) ( not ( = ?auto_284905 ?auto_284907 ) ) ( not ( = ?auto_284905 ?auto_284908 ) ) ( not ( = ?auto_284906 ?auto_284907 ) ) ( not ( = ?auto_284906 ?auto_284908 ) ) ( not ( = ?auto_284907 ?auto_284908 ) ) ( ON ?auto_284906 ?auto_284907 ) ( ON ?auto_284905 ?auto_284906 ) ( ON ?auto_284904 ?auto_284905 ) ( CLEAR ?auto_284902 ) ( ON ?auto_284903 ?auto_284904 ) ( CLEAR ?auto_284903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_284898 ?auto_284899 ?auto_284900 ?auto_284901 ?auto_284902 ?auto_284903 )
      ( MAKE-10PILE ?auto_284898 ?auto_284899 ?auto_284900 ?auto_284901 ?auto_284902 ?auto_284903 ?auto_284904 ?auto_284905 ?auto_284906 ?auto_284907 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_284940 - BLOCK
      ?auto_284941 - BLOCK
      ?auto_284942 - BLOCK
      ?auto_284943 - BLOCK
      ?auto_284944 - BLOCK
      ?auto_284945 - BLOCK
      ?auto_284946 - BLOCK
      ?auto_284947 - BLOCK
      ?auto_284948 - BLOCK
      ?auto_284949 - BLOCK
    )
    :vars
    (
      ?auto_284950 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_284949 ?auto_284950 ) ( ON-TABLE ?auto_284940 ) ( ON ?auto_284941 ?auto_284940 ) ( ON ?auto_284942 ?auto_284941 ) ( ON ?auto_284943 ?auto_284942 ) ( not ( = ?auto_284940 ?auto_284941 ) ) ( not ( = ?auto_284940 ?auto_284942 ) ) ( not ( = ?auto_284940 ?auto_284943 ) ) ( not ( = ?auto_284940 ?auto_284944 ) ) ( not ( = ?auto_284940 ?auto_284945 ) ) ( not ( = ?auto_284940 ?auto_284946 ) ) ( not ( = ?auto_284940 ?auto_284947 ) ) ( not ( = ?auto_284940 ?auto_284948 ) ) ( not ( = ?auto_284940 ?auto_284949 ) ) ( not ( = ?auto_284940 ?auto_284950 ) ) ( not ( = ?auto_284941 ?auto_284942 ) ) ( not ( = ?auto_284941 ?auto_284943 ) ) ( not ( = ?auto_284941 ?auto_284944 ) ) ( not ( = ?auto_284941 ?auto_284945 ) ) ( not ( = ?auto_284941 ?auto_284946 ) ) ( not ( = ?auto_284941 ?auto_284947 ) ) ( not ( = ?auto_284941 ?auto_284948 ) ) ( not ( = ?auto_284941 ?auto_284949 ) ) ( not ( = ?auto_284941 ?auto_284950 ) ) ( not ( = ?auto_284942 ?auto_284943 ) ) ( not ( = ?auto_284942 ?auto_284944 ) ) ( not ( = ?auto_284942 ?auto_284945 ) ) ( not ( = ?auto_284942 ?auto_284946 ) ) ( not ( = ?auto_284942 ?auto_284947 ) ) ( not ( = ?auto_284942 ?auto_284948 ) ) ( not ( = ?auto_284942 ?auto_284949 ) ) ( not ( = ?auto_284942 ?auto_284950 ) ) ( not ( = ?auto_284943 ?auto_284944 ) ) ( not ( = ?auto_284943 ?auto_284945 ) ) ( not ( = ?auto_284943 ?auto_284946 ) ) ( not ( = ?auto_284943 ?auto_284947 ) ) ( not ( = ?auto_284943 ?auto_284948 ) ) ( not ( = ?auto_284943 ?auto_284949 ) ) ( not ( = ?auto_284943 ?auto_284950 ) ) ( not ( = ?auto_284944 ?auto_284945 ) ) ( not ( = ?auto_284944 ?auto_284946 ) ) ( not ( = ?auto_284944 ?auto_284947 ) ) ( not ( = ?auto_284944 ?auto_284948 ) ) ( not ( = ?auto_284944 ?auto_284949 ) ) ( not ( = ?auto_284944 ?auto_284950 ) ) ( not ( = ?auto_284945 ?auto_284946 ) ) ( not ( = ?auto_284945 ?auto_284947 ) ) ( not ( = ?auto_284945 ?auto_284948 ) ) ( not ( = ?auto_284945 ?auto_284949 ) ) ( not ( = ?auto_284945 ?auto_284950 ) ) ( not ( = ?auto_284946 ?auto_284947 ) ) ( not ( = ?auto_284946 ?auto_284948 ) ) ( not ( = ?auto_284946 ?auto_284949 ) ) ( not ( = ?auto_284946 ?auto_284950 ) ) ( not ( = ?auto_284947 ?auto_284948 ) ) ( not ( = ?auto_284947 ?auto_284949 ) ) ( not ( = ?auto_284947 ?auto_284950 ) ) ( not ( = ?auto_284948 ?auto_284949 ) ) ( not ( = ?auto_284948 ?auto_284950 ) ) ( not ( = ?auto_284949 ?auto_284950 ) ) ( ON ?auto_284948 ?auto_284949 ) ( ON ?auto_284947 ?auto_284948 ) ( ON ?auto_284946 ?auto_284947 ) ( ON ?auto_284945 ?auto_284946 ) ( CLEAR ?auto_284943 ) ( ON ?auto_284944 ?auto_284945 ) ( CLEAR ?auto_284944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_284940 ?auto_284941 ?auto_284942 ?auto_284943 ?auto_284944 )
      ( MAKE-10PILE ?auto_284940 ?auto_284941 ?auto_284942 ?auto_284943 ?auto_284944 ?auto_284945 ?auto_284946 ?auto_284947 ?auto_284948 ?auto_284949 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_284982 - BLOCK
      ?auto_284983 - BLOCK
      ?auto_284984 - BLOCK
      ?auto_284985 - BLOCK
      ?auto_284986 - BLOCK
      ?auto_284987 - BLOCK
      ?auto_284988 - BLOCK
      ?auto_284989 - BLOCK
      ?auto_284990 - BLOCK
      ?auto_284991 - BLOCK
    )
    :vars
    (
      ?auto_284992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_284991 ?auto_284992 ) ( ON-TABLE ?auto_284982 ) ( ON ?auto_284983 ?auto_284982 ) ( ON ?auto_284984 ?auto_284983 ) ( not ( = ?auto_284982 ?auto_284983 ) ) ( not ( = ?auto_284982 ?auto_284984 ) ) ( not ( = ?auto_284982 ?auto_284985 ) ) ( not ( = ?auto_284982 ?auto_284986 ) ) ( not ( = ?auto_284982 ?auto_284987 ) ) ( not ( = ?auto_284982 ?auto_284988 ) ) ( not ( = ?auto_284982 ?auto_284989 ) ) ( not ( = ?auto_284982 ?auto_284990 ) ) ( not ( = ?auto_284982 ?auto_284991 ) ) ( not ( = ?auto_284982 ?auto_284992 ) ) ( not ( = ?auto_284983 ?auto_284984 ) ) ( not ( = ?auto_284983 ?auto_284985 ) ) ( not ( = ?auto_284983 ?auto_284986 ) ) ( not ( = ?auto_284983 ?auto_284987 ) ) ( not ( = ?auto_284983 ?auto_284988 ) ) ( not ( = ?auto_284983 ?auto_284989 ) ) ( not ( = ?auto_284983 ?auto_284990 ) ) ( not ( = ?auto_284983 ?auto_284991 ) ) ( not ( = ?auto_284983 ?auto_284992 ) ) ( not ( = ?auto_284984 ?auto_284985 ) ) ( not ( = ?auto_284984 ?auto_284986 ) ) ( not ( = ?auto_284984 ?auto_284987 ) ) ( not ( = ?auto_284984 ?auto_284988 ) ) ( not ( = ?auto_284984 ?auto_284989 ) ) ( not ( = ?auto_284984 ?auto_284990 ) ) ( not ( = ?auto_284984 ?auto_284991 ) ) ( not ( = ?auto_284984 ?auto_284992 ) ) ( not ( = ?auto_284985 ?auto_284986 ) ) ( not ( = ?auto_284985 ?auto_284987 ) ) ( not ( = ?auto_284985 ?auto_284988 ) ) ( not ( = ?auto_284985 ?auto_284989 ) ) ( not ( = ?auto_284985 ?auto_284990 ) ) ( not ( = ?auto_284985 ?auto_284991 ) ) ( not ( = ?auto_284985 ?auto_284992 ) ) ( not ( = ?auto_284986 ?auto_284987 ) ) ( not ( = ?auto_284986 ?auto_284988 ) ) ( not ( = ?auto_284986 ?auto_284989 ) ) ( not ( = ?auto_284986 ?auto_284990 ) ) ( not ( = ?auto_284986 ?auto_284991 ) ) ( not ( = ?auto_284986 ?auto_284992 ) ) ( not ( = ?auto_284987 ?auto_284988 ) ) ( not ( = ?auto_284987 ?auto_284989 ) ) ( not ( = ?auto_284987 ?auto_284990 ) ) ( not ( = ?auto_284987 ?auto_284991 ) ) ( not ( = ?auto_284987 ?auto_284992 ) ) ( not ( = ?auto_284988 ?auto_284989 ) ) ( not ( = ?auto_284988 ?auto_284990 ) ) ( not ( = ?auto_284988 ?auto_284991 ) ) ( not ( = ?auto_284988 ?auto_284992 ) ) ( not ( = ?auto_284989 ?auto_284990 ) ) ( not ( = ?auto_284989 ?auto_284991 ) ) ( not ( = ?auto_284989 ?auto_284992 ) ) ( not ( = ?auto_284990 ?auto_284991 ) ) ( not ( = ?auto_284990 ?auto_284992 ) ) ( not ( = ?auto_284991 ?auto_284992 ) ) ( ON ?auto_284990 ?auto_284991 ) ( ON ?auto_284989 ?auto_284990 ) ( ON ?auto_284988 ?auto_284989 ) ( ON ?auto_284987 ?auto_284988 ) ( ON ?auto_284986 ?auto_284987 ) ( CLEAR ?auto_284984 ) ( ON ?auto_284985 ?auto_284986 ) ( CLEAR ?auto_284985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_284982 ?auto_284983 ?auto_284984 ?auto_284985 )
      ( MAKE-10PILE ?auto_284982 ?auto_284983 ?auto_284984 ?auto_284985 ?auto_284986 ?auto_284987 ?auto_284988 ?auto_284989 ?auto_284990 ?auto_284991 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_285024 - BLOCK
      ?auto_285025 - BLOCK
      ?auto_285026 - BLOCK
      ?auto_285027 - BLOCK
      ?auto_285028 - BLOCK
      ?auto_285029 - BLOCK
      ?auto_285030 - BLOCK
      ?auto_285031 - BLOCK
      ?auto_285032 - BLOCK
      ?auto_285033 - BLOCK
    )
    :vars
    (
      ?auto_285034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_285033 ?auto_285034 ) ( ON-TABLE ?auto_285024 ) ( ON ?auto_285025 ?auto_285024 ) ( not ( = ?auto_285024 ?auto_285025 ) ) ( not ( = ?auto_285024 ?auto_285026 ) ) ( not ( = ?auto_285024 ?auto_285027 ) ) ( not ( = ?auto_285024 ?auto_285028 ) ) ( not ( = ?auto_285024 ?auto_285029 ) ) ( not ( = ?auto_285024 ?auto_285030 ) ) ( not ( = ?auto_285024 ?auto_285031 ) ) ( not ( = ?auto_285024 ?auto_285032 ) ) ( not ( = ?auto_285024 ?auto_285033 ) ) ( not ( = ?auto_285024 ?auto_285034 ) ) ( not ( = ?auto_285025 ?auto_285026 ) ) ( not ( = ?auto_285025 ?auto_285027 ) ) ( not ( = ?auto_285025 ?auto_285028 ) ) ( not ( = ?auto_285025 ?auto_285029 ) ) ( not ( = ?auto_285025 ?auto_285030 ) ) ( not ( = ?auto_285025 ?auto_285031 ) ) ( not ( = ?auto_285025 ?auto_285032 ) ) ( not ( = ?auto_285025 ?auto_285033 ) ) ( not ( = ?auto_285025 ?auto_285034 ) ) ( not ( = ?auto_285026 ?auto_285027 ) ) ( not ( = ?auto_285026 ?auto_285028 ) ) ( not ( = ?auto_285026 ?auto_285029 ) ) ( not ( = ?auto_285026 ?auto_285030 ) ) ( not ( = ?auto_285026 ?auto_285031 ) ) ( not ( = ?auto_285026 ?auto_285032 ) ) ( not ( = ?auto_285026 ?auto_285033 ) ) ( not ( = ?auto_285026 ?auto_285034 ) ) ( not ( = ?auto_285027 ?auto_285028 ) ) ( not ( = ?auto_285027 ?auto_285029 ) ) ( not ( = ?auto_285027 ?auto_285030 ) ) ( not ( = ?auto_285027 ?auto_285031 ) ) ( not ( = ?auto_285027 ?auto_285032 ) ) ( not ( = ?auto_285027 ?auto_285033 ) ) ( not ( = ?auto_285027 ?auto_285034 ) ) ( not ( = ?auto_285028 ?auto_285029 ) ) ( not ( = ?auto_285028 ?auto_285030 ) ) ( not ( = ?auto_285028 ?auto_285031 ) ) ( not ( = ?auto_285028 ?auto_285032 ) ) ( not ( = ?auto_285028 ?auto_285033 ) ) ( not ( = ?auto_285028 ?auto_285034 ) ) ( not ( = ?auto_285029 ?auto_285030 ) ) ( not ( = ?auto_285029 ?auto_285031 ) ) ( not ( = ?auto_285029 ?auto_285032 ) ) ( not ( = ?auto_285029 ?auto_285033 ) ) ( not ( = ?auto_285029 ?auto_285034 ) ) ( not ( = ?auto_285030 ?auto_285031 ) ) ( not ( = ?auto_285030 ?auto_285032 ) ) ( not ( = ?auto_285030 ?auto_285033 ) ) ( not ( = ?auto_285030 ?auto_285034 ) ) ( not ( = ?auto_285031 ?auto_285032 ) ) ( not ( = ?auto_285031 ?auto_285033 ) ) ( not ( = ?auto_285031 ?auto_285034 ) ) ( not ( = ?auto_285032 ?auto_285033 ) ) ( not ( = ?auto_285032 ?auto_285034 ) ) ( not ( = ?auto_285033 ?auto_285034 ) ) ( ON ?auto_285032 ?auto_285033 ) ( ON ?auto_285031 ?auto_285032 ) ( ON ?auto_285030 ?auto_285031 ) ( ON ?auto_285029 ?auto_285030 ) ( ON ?auto_285028 ?auto_285029 ) ( ON ?auto_285027 ?auto_285028 ) ( CLEAR ?auto_285025 ) ( ON ?auto_285026 ?auto_285027 ) ( CLEAR ?auto_285026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_285024 ?auto_285025 ?auto_285026 )
      ( MAKE-10PILE ?auto_285024 ?auto_285025 ?auto_285026 ?auto_285027 ?auto_285028 ?auto_285029 ?auto_285030 ?auto_285031 ?auto_285032 ?auto_285033 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_285066 - BLOCK
      ?auto_285067 - BLOCK
      ?auto_285068 - BLOCK
      ?auto_285069 - BLOCK
      ?auto_285070 - BLOCK
      ?auto_285071 - BLOCK
      ?auto_285072 - BLOCK
      ?auto_285073 - BLOCK
      ?auto_285074 - BLOCK
      ?auto_285075 - BLOCK
    )
    :vars
    (
      ?auto_285076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_285075 ?auto_285076 ) ( ON-TABLE ?auto_285066 ) ( not ( = ?auto_285066 ?auto_285067 ) ) ( not ( = ?auto_285066 ?auto_285068 ) ) ( not ( = ?auto_285066 ?auto_285069 ) ) ( not ( = ?auto_285066 ?auto_285070 ) ) ( not ( = ?auto_285066 ?auto_285071 ) ) ( not ( = ?auto_285066 ?auto_285072 ) ) ( not ( = ?auto_285066 ?auto_285073 ) ) ( not ( = ?auto_285066 ?auto_285074 ) ) ( not ( = ?auto_285066 ?auto_285075 ) ) ( not ( = ?auto_285066 ?auto_285076 ) ) ( not ( = ?auto_285067 ?auto_285068 ) ) ( not ( = ?auto_285067 ?auto_285069 ) ) ( not ( = ?auto_285067 ?auto_285070 ) ) ( not ( = ?auto_285067 ?auto_285071 ) ) ( not ( = ?auto_285067 ?auto_285072 ) ) ( not ( = ?auto_285067 ?auto_285073 ) ) ( not ( = ?auto_285067 ?auto_285074 ) ) ( not ( = ?auto_285067 ?auto_285075 ) ) ( not ( = ?auto_285067 ?auto_285076 ) ) ( not ( = ?auto_285068 ?auto_285069 ) ) ( not ( = ?auto_285068 ?auto_285070 ) ) ( not ( = ?auto_285068 ?auto_285071 ) ) ( not ( = ?auto_285068 ?auto_285072 ) ) ( not ( = ?auto_285068 ?auto_285073 ) ) ( not ( = ?auto_285068 ?auto_285074 ) ) ( not ( = ?auto_285068 ?auto_285075 ) ) ( not ( = ?auto_285068 ?auto_285076 ) ) ( not ( = ?auto_285069 ?auto_285070 ) ) ( not ( = ?auto_285069 ?auto_285071 ) ) ( not ( = ?auto_285069 ?auto_285072 ) ) ( not ( = ?auto_285069 ?auto_285073 ) ) ( not ( = ?auto_285069 ?auto_285074 ) ) ( not ( = ?auto_285069 ?auto_285075 ) ) ( not ( = ?auto_285069 ?auto_285076 ) ) ( not ( = ?auto_285070 ?auto_285071 ) ) ( not ( = ?auto_285070 ?auto_285072 ) ) ( not ( = ?auto_285070 ?auto_285073 ) ) ( not ( = ?auto_285070 ?auto_285074 ) ) ( not ( = ?auto_285070 ?auto_285075 ) ) ( not ( = ?auto_285070 ?auto_285076 ) ) ( not ( = ?auto_285071 ?auto_285072 ) ) ( not ( = ?auto_285071 ?auto_285073 ) ) ( not ( = ?auto_285071 ?auto_285074 ) ) ( not ( = ?auto_285071 ?auto_285075 ) ) ( not ( = ?auto_285071 ?auto_285076 ) ) ( not ( = ?auto_285072 ?auto_285073 ) ) ( not ( = ?auto_285072 ?auto_285074 ) ) ( not ( = ?auto_285072 ?auto_285075 ) ) ( not ( = ?auto_285072 ?auto_285076 ) ) ( not ( = ?auto_285073 ?auto_285074 ) ) ( not ( = ?auto_285073 ?auto_285075 ) ) ( not ( = ?auto_285073 ?auto_285076 ) ) ( not ( = ?auto_285074 ?auto_285075 ) ) ( not ( = ?auto_285074 ?auto_285076 ) ) ( not ( = ?auto_285075 ?auto_285076 ) ) ( ON ?auto_285074 ?auto_285075 ) ( ON ?auto_285073 ?auto_285074 ) ( ON ?auto_285072 ?auto_285073 ) ( ON ?auto_285071 ?auto_285072 ) ( ON ?auto_285070 ?auto_285071 ) ( ON ?auto_285069 ?auto_285070 ) ( ON ?auto_285068 ?auto_285069 ) ( CLEAR ?auto_285066 ) ( ON ?auto_285067 ?auto_285068 ) ( CLEAR ?auto_285067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_285066 ?auto_285067 )
      ( MAKE-10PILE ?auto_285066 ?auto_285067 ?auto_285068 ?auto_285069 ?auto_285070 ?auto_285071 ?auto_285072 ?auto_285073 ?auto_285074 ?auto_285075 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_285108 - BLOCK
      ?auto_285109 - BLOCK
      ?auto_285110 - BLOCK
      ?auto_285111 - BLOCK
      ?auto_285112 - BLOCK
      ?auto_285113 - BLOCK
      ?auto_285114 - BLOCK
      ?auto_285115 - BLOCK
      ?auto_285116 - BLOCK
      ?auto_285117 - BLOCK
    )
    :vars
    (
      ?auto_285118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_285117 ?auto_285118 ) ( not ( = ?auto_285108 ?auto_285109 ) ) ( not ( = ?auto_285108 ?auto_285110 ) ) ( not ( = ?auto_285108 ?auto_285111 ) ) ( not ( = ?auto_285108 ?auto_285112 ) ) ( not ( = ?auto_285108 ?auto_285113 ) ) ( not ( = ?auto_285108 ?auto_285114 ) ) ( not ( = ?auto_285108 ?auto_285115 ) ) ( not ( = ?auto_285108 ?auto_285116 ) ) ( not ( = ?auto_285108 ?auto_285117 ) ) ( not ( = ?auto_285108 ?auto_285118 ) ) ( not ( = ?auto_285109 ?auto_285110 ) ) ( not ( = ?auto_285109 ?auto_285111 ) ) ( not ( = ?auto_285109 ?auto_285112 ) ) ( not ( = ?auto_285109 ?auto_285113 ) ) ( not ( = ?auto_285109 ?auto_285114 ) ) ( not ( = ?auto_285109 ?auto_285115 ) ) ( not ( = ?auto_285109 ?auto_285116 ) ) ( not ( = ?auto_285109 ?auto_285117 ) ) ( not ( = ?auto_285109 ?auto_285118 ) ) ( not ( = ?auto_285110 ?auto_285111 ) ) ( not ( = ?auto_285110 ?auto_285112 ) ) ( not ( = ?auto_285110 ?auto_285113 ) ) ( not ( = ?auto_285110 ?auto_285114 ) ) ( not ( = ?auto_285110 ?auto_285115 ) ) ( not ( = ?auto_285110 ?auto_285116 ) ) ( not ( = ?auto_285110 ?auto_285117 ) ) ( not ( = ?auto_285110 ?auto_285118 ) ) ( not ( = ?auto_285111 ?auto_285112 ) ) ( not ( = ?auto_285111 ?auto_285113 ) ) ( not ( = ?auto_285111 ?auto_285114 ) ) ( not ( = ?auto_285111 ?auto_285115 ) ) ( not ( = ?auto_285111 ?auto_285116 ) ) ( not ( = ?auto_285111 ?auto_285117 ) ) ( not ( = ?auto_285111 ?auto_285118 ) ) ( not ( = ?auto_285112 ?auto_285113 ) ) ( not ( = ?auto_285112 ?auto_285114 ) ) ( not ( = ?auto_285112 ?auto_285115 ) ) ( not ( = ?auto_285112 ?auto_285116 ) ) ( not ( = ?auto_285112 ?auto_285117 ) ) ( not ( = ?auto_285112 ?auto_285118 ) ) ( not ( = ?auto_285113 ?auto_285114 ) ) ( not ( = ?auto_285113 ?auto_285115 ) ) ( not ( = ?auto_285113 ?auto_285116 ) ) ( not ( = ?auto_285113 ?auto_285117 ) ) ( not ( = ?auto_285113 ?auto_285118 ) ) ( not ( = ?auto_285114 ?auto_285115 ) ) ( not ( = ?auto_285114 ?auto_285116 ) ) ( not ( = ?auto_285114 ?auto_285117 ) ) ( not ( = ?auto_285114 ?auto_285118 ) ) ( not ( = ?auto_285115 ?auto_285116 ) ) ( not ( = ?auto_285115 ?auto_285117 ) ) ( not ( = ?auto_285115 ?auto_285118 ) ) ( not ( = ?auto_285116 ?auto_285117 ) ) ( not ( = ?auto_285116 ?auto_285118 ) ) ( not ( = ?auto_285117 ?auto_285118 ) ) ( ON ?auto_285116 ?auto_285117 ) ( ON ?auto_285115 ?auto_285116 ) ( ON ?auto_285114 ?auto_285115 ) ( ON ?auto_285113 ?auto_285114 ) ( ON ?auto_285112 ?auto_285113 ) ( ON ?auto_285111 ?auto_285112 ) ( ON ?auto_285110 ?auto_285111 ) ( ON ?auto_285109 ?auto_285110 ) ( ON ?auto_285108 ?auto_285109 ) ( CLEAR ?auto_285108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_285108 )
      ( MAKE-10PILE ?auto_285108 ?auto_285109 ?auto_285110 ?auto_285111 ?auto_285112 ?auto_285113 ?auto_285114 ?auto_285115 ?auto_285116 ?auto_285117 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_285151 - BLOCK
      ?auto_285152 - BLOCK
      ?auto_285153 - BLOCK
      ?auto_285154 - BLOCK
      ?auto_285155 - BLOCK
      ?auto_285156 - BLOCK
      ?auto_285157 - BLOCK
      ?auto_285158 - BLOCK
      ?auto_285159 - BLOCK
      ?auto_285160 - BLOCK
      ?auto_285161 - BLOCK
    )
    :vars
    (
      ?auto_285162 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_285160 ) ( ON ?auto_285161 ?auto_285162 ) ( CLEAR ?auto_285161 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_285151 ) ( ON ?auto_285152 ?auto_285151 ) ( ON ?auto_285153 ?auto_285152 ) ( ON ?auto_285154 ?auto_285153 ) ( ON ?auto_285155 ?auto_285154 ) ( ON ?auto_285156 ?auto_285155 ) ( ON ?auto_285157 ?auto_285156 ) ( ON ?auto_285158 ?auto_285157 ) ( ON ?auto_285159 ?auto_285158 ) ( ON ?auto_285160 ?auto_285159 ) ( not ( = ?auto_285151 ?auto_285152 ) ) ( not ( = ?auto_285151 ?auto_285153 ) ) ( not ( = ?auto_285151 ?auto_285154 ) ) ( not ( = ?auto_285151 ?auto_285155 ) ) ( not ( = ?auto_285151 ?auto_285156 ) ) ( not ( = ?auto_285151 ?auto_285157 ) ) ( not ( = ?auto_285151 ?auto_285158 ) ) ( not ( = ?auto_285151 ?auto_285159 ) ) ( not ( = ?auto_285151 ?auto_285160 ) ) ( not ( = ?auto_285151 ?auto_285161 ) ) ( not ( = ?auto_285151 ?auto_285162 ) ) ( not ( = ?auto_285152 ?auto_285153 ) ) ( not ( = ?auto_285152 ?auto_285154 ) ) ( not ( = ?auto_285152 ?auto_285155 ) ) ( not ( = ?auto_285152 ?auto_285156 ) ) ( not ( = ?auto_285152 ?auto_285157 ) ) ( not ( = ?auto_285152 ?auto_285158 ) ) ( not ( = ?auto_285152 ?auto_285159 ) ) ( not ( = ?auto_285152 ?auto_285160 ) ) ( not ( = ?auto_285152 ?auto_285161 ) ) ( not ( = ?auto_285152 ?auto_285162 ) ) ( not ( = ?auto_285153 ?auto_285154 ) ) ( not ( = ?auto_285153 ?auto_285155 ) ) ( not ( = ?auto_285153 ?auto_285156 ) ) ( not ( = ?auto_285153 ?auto_285157 ) ) ( not ( = ?auto_285153 ?auto_285158 ) ) ( not ( = ?auto_285153 ?auto_285159 ) ) ( not ( = ?auto_285153 ?auto_285160 ) ) ( not ( = ?auto_285153 ?auto_285161 ) ) ( not ( = ?auto_285153 ?auto_285162 ) ) ( not ( = ?auto_285154 ?auto_285155 ) ) ( not ( = ?auto_285154 ?auto_285156 ) ) ( not ( = ?auto_285154 ?auto_285157 ) ) ( not ( = ?auto_285154 ?auto_285158 ) ) ( not ( = ?auto_285154 ?auto_285159 ) ) ( not ( = ?auto_285154 ?auto_285160 ) ) ( not ( = ?auto_285154 ?auto_285161 ) ) ( not ( = ?auto_285154 ?auto_285162 ) ) ( not ( = ?auto_285155 ?auto_285156 ) ) ( not ( = ?auto_285155 ?auto_285157 ) ) ( not ( = ?auto_285155 ?auto_285158 ) ) ( not ( = ?auto_285155 ?auto_285159 ) ) ( not ( = ?auto_285155 ?auto_285160 ) ) ( not ( = ?auto_285155 ?auto_285161 ) ) ( not ( = ?auto_285155 ?auto_285162 ) ) ( not ( = ?auto_285156 ?auto_285157 ) ) ( not ( = ?auto_285156 ?auto_285158 ) ) ( not ( = ?auto_285156 ?auto_285159 ) ) ( not ( = ?auto_285156 ?auto_285160 ) ) ( not ( = ?auto_285156 ?auto_285161 ) ) ( not ( = ?auto_285156 ?auto_285162 ) ) ( not ( = ?auto_285157 ?auto_285158 ) ) ( not ( = ?auto_285157 ?auto_285159 ) ) ( not ( = ?auto_285157 ?auto_285160 ) ) ( not ( = ?auto_285157 ?auto_285161 ) ) ( not ( = ?auto_285157 ?auto_285162 ) ) ( not ( = ?auto_285158 ?auto_285159 ) ) ( not ( = ?auto_285158 ?auto_285160 ) ) ( not ( = ?auto_285158 ?auto_285161 ) ) ( not ( = ?auto_285158 ?auto_285162 ) ) ( not ( = ?auto_285159 ?auto_285160 ) ) ( not ( = ?auto_285159 ?auto_285161 ) ) ( not ( = ?auto_285159 ?auto_285162 ) ) ( not ( = ?auto_285160 ?auto_285161 ) ) ( not ( = ?auto_285160 ?auto_285162 ) ) ( not ( = ?auto_285161 ?auto_285162 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_285161 ?auto_285162 )
      ( !STACK ?auto_285161 ?auto_285160 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_285197 - BLOCK
      ?auto_285198 - BLOCK
      ?auto_285199 - BLOCK
      ?auto_285200 - BLOCK
      ?auto_285201 - BLOCK
      ?auto_285202 - BLOCK
      ?auto_285203 - BLOCK
      ?auto_285204 - BLOCK
      ?auto_285205 - BLOCK
      ?auto_285206 - BLOCK
      ?auto_285207 - BLOCK
    )
    :vars
    (
      ?auto_285208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_285207 ?auto_285208 ) ( ON-TABLE ?auto_285197 ) ( ON ?auto_285198 ?auto_285197 ) ( ON ?auto_285199 ?auto_285198 ) ( ON ?auto_285200 ?auto_285199 ) ( ON ?auto_285201 ?auto_285200 ) ( ON ?auto_285202 ?auto_285201 ) ( ON ?auto_285203 ?auto_285202 ) ( ON ?auto_285204 ?auto_285203 ) ( ON ?auto_285205 ?auto_285204 ) ( not ( = ?auto_285197 ?auto_285198 ) ) ( not ( = ?auto_285197 ?auto_285199 ) ) ( not ( = ?auto_285197 ?auto_285200 ) ) ( not ( = ?auto_285197 ?auto_285201 ) ) ( not ( = ?auto_285197 ?auto_285202 ) ) ( not ( = ?auto_285197 ?auto_285203 ) ) ( not ( = ?auto_285197 ?auto_285204 ) ) ( not ( = ?auto_285197 ?auto_285205 ) ) ( not ( = ?auto_285197 ?auto_285206 ) ) ( not ( = ?auto_285197 ?auto_285207 ) ) ( not ( = ?auto_285197 ?auto_285208 ) ) ( not ( = ?auto_285198 ?auto_285199 ) ) ( not ( = ?auto_285198 ?auto_285200 ) ) ( not ( = ?auto_285198 ?auto_285201 ) ) ( not ( = ?auto_285198 ?auto_285202 ) ) ( not ( = ?auto_285198 ?auto_285203 ) ) ( not ( = ?auto_285198 ?auto_285204 ) ) ( not ( = ?auto_285198 ?auto_285205 ) ) ( not ( = ?auto_285198 ?auto_285206 ) ) ( not ( = ?auto_285198 ?auto_285207 ) ) ( not ( = ?auto_285198 ?auto_285208 ) ) ( not ( = ?auto_285199 ?auto_285200 ) ) ( not ( = ?auto_285199 ?auto_285201 ) ) ( not ( = ?auto_285199 ?auto_285202 ) ) ( not ( = ?auto_285199 ?auto_285203 ) ) ( not ( = ?auto_285199 ?auto_285204 ) ) ( not ( = ?auto_285199 ?auto_285205 ) ) ( not ( = ?auto_285199 ?auto_285206 ) ) ( not ( = ?auto_285199 ?auto_285207 ) ) ( not ( = ?auto_285199 ?auto_285208 ) ) ( not ( = ?auto_285200 ?auto_285201 ) ) ( not ( = ?auto_285200 ?auto_285202 ) ) ( not ( = ?auto_285200 ?auto_285203 ) ) ( not ( = ?auto_285200 ?auto_285204 ) ) ( not ( = ?auto_285200 ?auto_285205 ) ) ( not ( = ?auto_285200 ?auto_285206 ) ) ( not ( = ?auto_285200 ?auto_285207 ) ) ( not ( = ?auto_285200 ?auto_285208 ) ) ( not ( = ?auto_285201 ?auto_285202 ) ) ( not ( = ?auto_285201 ?auto_285203 ) ) ( not ( = ?auto_285201 ?auto_285204 ) ) ( not ( = ?auto_285201 ?auto_285205 ) ) ( not ( = ?auto_285201 ?auto_285206 ) ) ( not ( = ?auto_285201 ?auto_285207 ) ) ( not ( = ?auto_285201 ?auto_285208 ) ) ( not ( = ?auto_285202 ?auto_285203 ) ) ( not ( = ?auto_285202 ?auto_285204 ) ) ( not ( = ?auto_285202 ?auto_285205 ) ) ( not ( = ?auto_285202 ?auto_285206 ) ) ( not ( = ?auto_285202 ?auto_285207 ) ) ( not ( = ?auto_285202 ?auto_285208 ) ) ( not ( = ?auto_285203 ?auto_285204 ) ) ( not ( = ?auto_285203 ?auto_285205 ) ) ( not ( = ?auto_285203 ?auto_285206 ) ) ( not ( = ?auto_285203 ?auto_285207 ) ) ( not ( = ?auto_285203 ?auto_285208 ) ) ( not ( = ?auto_285204 ?auto_285205 ) ) ( not ( = ?auto_285204 ?auto_285206 ) ) ( not ( = ?auto_285204 ?auto_285207 ) ) ( not ( = ?auto_285204 ?auto_285208 ) ) ( not ( = ?auto_285205 ?auto_285206 ) ) ( not ( = ?auto_285205 ?auto_285207 ) ) ( not ( = ?auto_285205 ?auto_285208 ) ) ( not ( = ?auto_285206 ?auto_285207 ) ) ( not ( = ?auto_285206 ?auto_285208 ) ) ( not ( = ?auto_285207 ?auto_285208 ) ) ( CLEAR ?auto_285205 ) ( ON ?auto_285206 ?auto_285207 ) ( CLEAR ?auto_285206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_285197 ?auto_285198 ?auto_285199 ?auto_285200 ?auto_285201 ?auto_285202 ?auto_285203 ?auto_285204 ?auto_285205 ?auto_285206 )
      ( MAKE-11PILE ?auto_285197 ?auto_285198 ?auto_285199 ?auto_285200 ?auto_285201 ?auto_285202 ?auto_285203 ?auto_285204 ?auto_285205 ?auto_285206 ?auto_285207 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_285243 - BLOCK
      ?auto_285244 - BLOCK
      ?auto_285245 - BLOCK
      ?auto_285246 - BLOCK
      ?auto_285247 - BLOCK
      ?auto_285248 - BLOCK
      ?auto_285249 - BLOCK
      ?auto_285250 - BLOCK
      ?auto_285251 - BLOCK
      ?auto_285252 - BLOCK
      ?auto_285253 - BLOCK
    )
    :vars
    (
      ?auto_285254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_285253 ?auto_285254 ) ( ON-TABLE ?auto_285243 ) ( ON ?auto_285244 ?auto_285243 ) ( ON ?auto_285245 ?auto_285244 ) ( ON ?auto_285246 ?auto_285245 ) ( ON ?auto_285247 ?auto_285246 ) ( ON ?auto_285248 ?auto_285247 ) ( ON ?auto_285249 ?auto_285248 ) ( ON ?auto_285250 ?auto_285249 ) ( not ( = ?auto_285243 ?auto_285244 ) ) ( not ( = ?auto_285243 ?auto_285245 ) ) ( not ( = ?auto_285243 ?auto_285246 ) ) ( not ( = ?auto_285243 ?auto_285247 ) ) ( not ( = ?auto_285243 ?auto_285248 ) ) ( not ( = ?auto_285243 ?auto_285249 ) ) ( not ( = ?auto_285243 ?auto_285250 ) ) ( not ( = ?auto_285243 ?auto_285251 ) ) ( not ( = ?auto_285243 ?auto_285252 ) ) ( not ( = ?auto_285243 ?auto_285253 ) ) ( not ( = ?auto_285243 ?auto_285254 ) ) ( not ( = ?auto_285244 ?auto_285245 ) ) ( not ( = ?auto_285244 ?auto_285246 ) ) ( not ( = ?auto_285244 ?auto_285247 ) ) ( not ( = ?auto_285244 ?auto_285248 ) ) ( not ( = ?auto_285244 ?auto_285249 ) ) ( not ( = ?auto_285244 ?auto_285250 ) ) ( not ( = ?auto_285244 ?auto_285251 ) ) ( not ( = ?auto_285244 ?auto_285252 ) ) ( not ( = ?auto_285244 ?auto_285253 ) ) ( not ( = ?auto_285244 ?auto_285254 ) ) ( not ( = ?auto_285245 ?auto_285246 ) ) ( not ( = ?auto_285245 ?auto_285247 ) ) ( not ( = ?auto_285245 ?auto_285248 ) ) ( not ( = ?auto_285245 ?auto_285249 ) ) ( not ( = ?auto_285245 ?auto_285250 ) ) ( not ( = ?auto_285245 ?auto_285251 ) ) ( not ( = ?auto_285245 ?auto_285252 ) ) ( not ( = ?auto_285245 ?auto_285253 ) ) ( not ( = ?auto_285245 ?auto_285254 ) ) ( not ( = ?auto_285246 ?auto_285247 ) ) ( not ( = ?auto_285246 ?auto_285248 ) ) ( not ( = ?auto_285246 ?auto_285249 ) ) ( not ( = ?auto_285246 ?auto_285250 ) ) ( not ( = ?auto_285246 ?auto_285251 ) ) ( not ( = ?auto_285246 ?auto_285252 ) ) ( not ( = ?auto_285246 ?auto_285253 ) ) ( not ( = ?auto_285246 ?auto_285254 ) ) ( not ( = ?auto_285247 ?auto_285248 ) ) ( not ( = ?auto_285247 ?auto_285249 ) ) ( not ( = ?auto_285247 ?auto_285250 ) ) ( not ( = ?auto_285247 ?auto_285251 ) ) ( not ( = ?auto_285247 ?auto_285252 ) ) ( not ( = ?auto_285247 ?auto_285253 ) ) ( not ( = ?auto_285247 ?auto_285254 ) ) ( not ( = ?auto_285248 ?auto_285249 ) ) ( not ( = ?auto_285248 ?auto_285250 ) ) ( not ( = ?auto_285248 ?auto_285251 ) ) ( not ( = ?auto_285248 ?auto_285252 ) ) ( not ( = ?auto_285248 ?auto_285253 ) ) ( not ( = ?auto_285248 ?auto_285254 ) ) ( not ( = ?auto_285249 ?auto_285250 ) ) ( not ( = ?auto_285249 ?auto_285251 ) ) ( not ( = ?auto_285249 ?auto_285252 ) ) ( not ( = ?auto_285249 ?auto_285253 ) ) ( not ( = ?auto_285249 ?auto_285254 ) ) ( not ( = ?auto_285250 ?auto_285251 ) ) ( not ( = ?auto_285250 ?auto_285252 ) ) ( not ( = ?auto_285250 ?auto_285253 ) ) ( not ( = ?auto_285250 ?auto_285254 ) ) ( not ( = ?auto_285251 ?auto_285252 ) ) ( not ( = ?auto_285251 ?auto_285253 ) ) ( not ( = ?auto_285251 ?auto_285254 ) ) ( not ( = ?auto_285252 ?auto_285253 ) ) ( not ( = ?auto_285252 ?auto_285254 ) ) ( not ( = ?auto_285253 ?auto_285254 ) ) ( ON ?auto_285252 ?auto_285253 ) ( CLEAR ?auto_285250 ) ( ON ?auto_285251 ?auto_285252 ) ( CLEAR ?auto_285251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_285243 ?auto_285244 ?auto_285245 ?auto_285246 ?auto_285247 ?auto_285248 ?auto_285249 ?auto_285250 ?auto_285251 )
      ( MAKE-11PILE ?auto_285243 ?auto_285244 ?auto_285245 ?auto_285246 ?auto_285247 ?auto_285248 ?auto_285249 ?auto_285250 ?auto_285251 ?auto_285252 ?auto_285253 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_285289 - BLOCK
      ?auto_285290 - BLOCK
      ?auto_285291 - BLOCK
      ?auto_285292 - BLOCK
      ?auto_285293 - BLOCK
      ?auto_285294 - BLOCK
      ?auto_285295 - BLOCK
      ?auto_285296 - BLOCK
      ?auto_285297 - BLOCK
      ?auto_285298 - BLOCK
      ?auto_285299 - BLOCK
    )
    :vars
    (
      ?auto_285300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_285299 ?auto_285300 ) ( ON-TABLE ?auto_285289 ) ( ON ?auto_285290 ?auto_285289 ) ( ON ?auto_285291 ?auto_285290 ) ( ON ?auto_285292 ?auto_285291 ) ( ON ?auto_285293 ?auto_285292 ) ( ON ?auto_285294 ?auto_285293 ) ( ON ?auto_285295 ?auto_285294 ) ( not ( = ?auto_285289 ?auto_285290 ) ) ( not ( = ?auto_285289 ?auto_285291 ) ) ( not ( = ?auto_285289 ?auto_285292 ) ) ( not ( = ?auto_285289 ?auto_285293 ) ) ( not ( = ?auto_285289 ?auto_285294 ) ) ( not ( = ?auto_285289 ?auto_285295 ) ) ( not ( = ?auto_285289 ?auto_285296 ) ) ( not ( = ?auto_285289 ?auto_285297 ) ) ( not ( = ?auto_285289 ?auto_285298 ) ) ( not ( = ?auto_285289 ?auto_285299 ) ) ( not ( = ?auto_285289 ?auto_285300 ) ) ( not ( = ?auto_285290 ?auto_285291 ) ) ( not ( = ?auto_285290 ?auto_285292 ) ) ( not ( = ?auto_285290 ?auto_285293 ) ) ( not ( = ?auto_285290 ?auto_285294 ) ) ( not ( = ?auto_285290 ?auto_285295 ) ) ( not ( = ?auto_285290 ?auto_285296 ) ) ( not ( = ?auto_285290 ?auto_285297 ) ) ( not ( = ?auto_285290 ?auto_285298 ) ) ( not ( = ?auto_285290 ?auto_285299 ) ) ( not ( = ?auto_285290 ?auto_285300 ) ) ( not ( = ?auto_285291 ?auto_285292 ) ) ( not ( = ?auto_285291 ?auto_285293 ) ) ( not ( = ?auto_285291 ?auto_285294 ) ) ( not ( = ?auto_285291 ?auto_285295 ) ) ( not ( = ?auto_285291 ?auto_285296 ) ) ( not ( = ?auto_285291 ?auto_285297 ) ) ( not ( = ?auto_285291 ?auto_285298 ) ) ( not ( = ?auto_285291 ?auto_285299 ) ) ( not ( = ?auto_285291 ?auto_285300 ) ) ( not ( = ?auto_285292 ?auto_285293 ) ) ( not ( = ?auto_285292 ?auto_285294 ) ) ( not ( = ?auto_285292 ?auto_285295 ) ) ( not ( = ?auto_285292 ?auto_285296 ) ) ( not ( = ?auto_285292 ?auto_285297 ) ) ( not ( = ?auto_285292 ?auto_285298 ) ) ( not ( = ?auto_285292 ?auto_285299 ) ) ( not ( = ?auto_285292 ?auto_285300 ) ) ( not ( = ?auto_285293 ?auto_285294 ) ) ( not ( = ?auto_285293 ?auto_285295 ) ) ( not ( = ?auto_285293 ?auto_285296 ) ) ( not ( = ?auto_285293 ?auto_285297 ) ) ( not ( = ?auto_285293 ?auto_285298 ) ) ( not ( = ?auto_285293 ?auto_285299 ) ) ( not ( = ?auto_285293 ?auto_285300 ) ) ( not ( = ?auto_285294 ?auto_285295 ) ) ( not ( = ?auto_285294 ?auto_285296 ) ) ( not ( = ?auto_285294 ?auto_285297 ) ) ( not ( = ?auto_285294 ?auto_285298 ) ) ( not ( = ?auto_285294 ?auto_285299 ) ) ( not ( = ?auto_285294 ?auto_285300 ) ) ( not ( = ?auto_285295 ?auto_285296 ) ) ( not ( = ?auto_285295 ?auto_285297 ) ) ( not ( = ?auto_285295 ?auto_285298 ) ) ( not ( = ?auto_285295 ?auto_285299 ) ) ( not ( = ?auto_285295 ?auto_285300 ) ) ( not ( = ?auto_285296 ?auto_285297 ) ) ( not ( = ?auto_285296 ?auto_285298 ) ) ( not ( = ?auto_285296 ?auto_285299 ) ) ( not ( = ?auto_285296 ?auto_285300 ) ) ( not ( = ?auto_285297 ?auto_285298 ) ) ( not ( = ?auto_285297 ?auto_285299 ) ) ( not ( = ?auto_285297 ?auto_285300 ) ) ( not ( = ?auto_285298 ?auto_285299 ) ) ( not ( = ?auto_285298 ?auto_285300 ) ) ( not ( = ?auto_285299 ?auto_285300 ) ) ( ON ?auto_285298 ?auto_285299 ) ( ON ?auto_285297 ?auto_285298 ) ( CLEAR ?auto_285295 ) ( ON ?auto_285296 ?auto_285297 ) ( CLEAR ?auto_285296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_285289 ?auto_285290 ?auto_285291 ?auto_285292 ?auto_285293 ?auto_285294 ?auto_285295 ?auto_285296 )
      ( MAKE-11PILE ?auto_285289 ?auto_285290 ?auto_285291 ?auto_285292 ?auto_285293 ?auto_285294 ?auto_285295 ?auto_285296 ?auto_285297 ?auto_285298 ?auto_285299 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_285335 - BLOCK
      ?auto_285336 - BLOCK
      ?auto_285337 - BLOCK
      ?auto_285338 - BLOCK
      ?auto_285339 - BLOCK
      ?auto_285340 - BLOCK
      ?auto_285341 - BLOCK
      ?auto_285342 - BLOCK
      ?auto_285343 - BLOCK
      ?auto_285344 - BLOCK
      ?auto_285345 - BLOCK
    )
    :vars
    (
      ?auto_285346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_285345 ?auto_285346 ) ( ON-TABLE ?auto_285335 ) ( ON ?auto_285336 ?auto_285335 ) ( ON ?auto_285337 ?auto_285336 ) ( ON ?auto_285338 ?auto_285337 ) ( ON ?auto_285339 ?auto_285338 ) ( ON ?auto_285340 ?auto_285339 ) ( not ( = ?auto_285335 ?auto_285336 ) ) ( not ( = ?auto_285335 ?auto_285337 ) ) ( not ( = ?auto_285335 ?auto_285338 ) ) ( not ( = ?auto_285335 ?auto_285339 ) ) ( not ( = ?auto_285335 ?auto_285340 ) ) ( not ( = ?auto_285335 ?auto_285341 ) ) ( not ( = ?auto_285335 ?auto_285342 ) ) ( not ( = ?auto_285335 ?auto_285343 ) ) ( not ( = ?auto_285335 ?auto_285344 ) ) ( not ( = ?auto_285335 ?auto_285345 ) ) ( not ( = ?auto_285335 ?auto_285346 ) ) ( not ( = ?auto_285336 ?auto_285337 ) ) ( not ( = ?auto_285336 ?auto_285338 ) ) ( not ( = ?auto_285336 ?auto_285339 ) ) ( not ( = ?auto_285336 ?auto_285340 ) ) ( not ( = ?auto_285336 ?auto_285341 ) ) ( not ( = ?auto_285336 ?auto_285342 ) ) ( not ( = ?auto_285336 ?auto_285343 ) ) ( not ( = ?auto_285336 ?auto_285344 ) ) ( not ( = ?auto_285336 ?auto_285345 ) ) ( not ( = ?auto_285336 ?auto_285346 ) ) ( not ( = ?auto_285337 ?auto_285338 ) ) ( not ( = ?auto_285337 ?auto_285339 ) ) ( not ( = ?auto_285337 ?auto_285340 ) ) ( not ( = ?auto_285337 ?auto_285341 ) ) ( not ( = ?auto_285337 ?auto_285342 ) ) ( not ( = ?auto_285337 ?auto_285343 ) ) ( not ( = ?auto_285337 ?auto_285344 ) ) ( not ( = ?auto_285337 ?auto_285345 ) ) ( not ( = ?auto_285337 ?auto_285346 ) ) ( not ( = ?auto_285338 ?auto_285339 ) ) ( not ( = ?auto_285338 ?auto_285340 ) ) ( not ( = ?auto_285338 ?auto_285341 ) ) ( not ( = ?auto_285338 ?auto_285342 ) ) ( not ( = ?auto_285338 ?auto_285343 ) ) ( not ( = ?auto_285338 ?auto_285344 ) ) ( not ( = ?auto_285338 ?auto_285345 ) ) ( not ( = ?auto_285338 ?auto_285346 ) ) ( not ( = ?auto_285339 ?auto_285340 ) ) ( not ( = ?auto_285339 ?auto_285341 ) ) ( not ( = ?auto_285339 ?auto_285342 ) ) ( not ( = ?auto_285339 ?auto_285343 ) ) ( not ( = ?auto_285339 ?auto_285344 ) ) ( not ( = ?auto_285339 ?auto_285345 ) ) ( not ( = ?auto_285339 ?auto_285346 ) ) ( not ( = ?auto_285340 ?auto_285341 ) ) ( not ( = ?auto_285340 ?auto_285342 ) ) ( not ( = ?auto_285340 ?auto_285343 ) ) ( not ( = ?auto_285340 ?auto_285344 ) ) ( not ( = ?auto_285340 ?auto_285345 ) ) ( not ( = ?auto_285340 ?auto_285346 ) ) ( not ( = ?auto_285341 ?auto_285342 ) ) ( not ( = ?auto_285341 ?auto_285343 ) ) ( not ( = ?auto_285341 ?auto_285344 ) ) ( not ( = ?auto_285341 ?auto_285345 ) ) ( not ( = ?auto_285341 ?auto_285346 ) ) ( not ( = ?auto_285342 ?auto_285343 ) ) ( not ( = ?auto_285342 ?auto_285344 ) ) ( not ( = ?auto_285342 ?auto_285345 ) ) ( not ( = ?auto_285342 ?auto_285346 ) ) ( not ( = ?auto_285343 ?auto_285344 ) ) ( not ( = ?auto_285343 ?auto_285345 ) ) ( not ( = ?auto_285343 ?auto_285346 ) ) ( not ( = ?auto_285344 ?auto_285345 ) ) ( not ( = ?auto_285344 ?auto_285346 ) ) ( not ( = ?auto_285345 ?auto_285346 ) ) ( ON ?auto_285344 ?auto_285345 ) ( ON ?auto_285343 ?auto_285344 ) ( ON ?auto_285342 ?auto_285343 ) ( CLEAR ?auto_285340 ) ( ON ?auto_285341 ?auto_285342 ) ( CLEAR ?auto_285341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_285335 ?auto_285336 ?auto_285337 ?auto_285338 ?auto_285339 ?auto_285340 ?auto_285341 )
      ( MAKE-11PILE ?auto_285335 ?auto_285336 ?auto_285337 ?auto_285338 ?auto_285339 ?auto_285340 ?auto_285341 ?auto_285342 ?auto_285343 ?auto_285344 ?auto_285345 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_285381 - BLOCK
      ?auto_285382 - BLOCK
      ?auto_285383 - BLOCK
      ?auto_285384 - BLOCK
      ?auto_285385 - BLOCK
      ?auto_285386 - BLOCK
      ?auto_285387 - BLOCK
      ?auto_285388 - BLOCK
      ?auto_285389 - BLOCK
      ?auto_285390 - BLOCK
      ?auto_285391 - BLOCK
    )
    :vars
    (
      ?auto_285392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_285391 ?auto_285392 ) ( ON-TABLE ?auto_285381 ) ( ON ?auto_285382 ?auto_285381 ) ( ON ?auto_285383 ?auto_285382 ) ( ON ?auto_285384 ?auto_285383 ) ( ON ?auto_285385 ?auto_285384 ) ( not ( = ?auto_285381 ?auto_285382 ) ) ( not ( = ?auto_285381 ?auto_285383 ) ) ( not ( = ?auto_285381 ?auto_285384 ) ) ( not ( = ?auto_285381 ?auto_285385 ) ) ( not ( = ?auto_285381 ?auto_285386 ) ) ( not ( = ?auto_285381 ?auto_285387 ) ) ( not ( = ?auto_285381 ?auto_285388 ) ) ( not ( = ?auto_285381 ?auto_285389 ) ) ( not ( = ?auto_285381 ?auto_285390 ) ) ( not ( = ?auto_285381 ?auto_285391 ) ) ( not ( = ?auto_285381 ?auto_285392 ) ) ( not ( = ?auto_285382 ?auto_285383 ) ) ( not ( = ?auto_285382 ?auto_285384 ) ) ( not ( = ?auto_285382 ?auto_285385 ) ) ( not ( = ?auto_285382 ?auto_285386 ) ) ( not ( = ?auto_285382 ?auto_285387 ) ) ( not ( = ?auto_285382 ?auto_285388 ) ) ( not ( = ?auto_285382 ?auto_285389 ) ) ( not ( = ?auto_285382 ?auto_285390 ) ) ( not ( = ?auto_285382 ?auto_285391 ) ) ( not ( = ?auto_285382 ?auto_285392 ) ) ( not ( = ?auto_285383 ?auto_285384 ) ) ( not ( = ?auto_285383 ?auto_285385 ) ) ( not ( = ?auto_285383 ?auto_285386 ) ) ( not ( = ?auto_285383 ?auto_285387 ) ) ( not ( = ?auto_285383 ?auto_285388 ) ) ( not ( = ?auto_285383 ?auto_285389 ) ) ( not ( = ?auto_285383 ?auto_285390 ) ) ( not ( = ?auto_285383 ?auto_285391 ) ) ( not ( = ?auto_285383 ?auto_285392 ) ) ( not ( = ?auto_285384 ?auto_285385 ) ) ( not ( = ?auto_285384 ?auto_285386 ) ) ( not ( = ?auto_285384 ?auto_285387 ) ) ( not ( = ?auto_285384 ?auto_285388 ) ) ( not ( = ?auto_285384 ?auto_285389 ) ) ( not ( = ?auto_285384 ?auto_285390 ) ) ( not ( = ?auto_285384 ?auto_285391 ) ) ( not ( = ?auto_285384 ?auto_285392 ) ) ( not ( = ?auto_285385 ?auto_285386 ) ) ( not ( = ?auto_285385 ?auto_285387 ) ) ( not ( = ?auto_285385 ?auto_285388 ) ) ( not ( = ?auto_285385 ?auto_285389 ) ) ( not ( = ?auto_285385 ?auto_285390 ) ) ( not ( = ?auto_285385 ?auto_285391 ) ) ( not ( = ?auto_285385 ?auto_285392 ) ) ( not ( = ?auto_285386 ?auto_285387 ) ) ( not ( = ?auto_285386 ?auto_285388 ) ) ( not ( = ?auto_285386 ?auto_285389 ) ) ( not ( = ?auto_285386 ?auto_285390 ) ) ( not ( = ?auto_285386 ?auto_285391 ) ) ( not ( = ?auto_285386 ?auto_285392 ) ) ( not ( = ?auto_285387 ?auto_285388 ) ) ( not ( = ?auto_285387 ?auto_285389 ) ) ( not ( = ?auto_285387 ?auto_285390 ) ) ( not ( = ?auto_285387 ?auto_285391 ) ) ( not ( = ?auto_285387 ?auto_285392 ) ) ( not ( = ?auto_285388 ?auto_285389 ) ) ( not ( = ?auto_285388 ?auto_285390 ) ) ( not ( = ?auto_285388 ?auto_285391 ) ) ( not ( = ?auto_285388 ?auto_285392 ) ) ( not ( = ?auto_285389 ?auto_285390 ) ) ( not ( = ?auto_285389 ?auto_285391 ) ) ( not ( = ?auto_285389 ?auto_285392 ) ) ( not ( = ?auto_285390 ?auto_285391 ) ) ( not ( = ?auto_285390 ?auto_285392 ) ) ( not ( = ?auto_285391 ?auto_285392 ) ) ( ON ?auto_285390 ?auto_285391 ) ( ON ?auto_285389 ?auto_285390 ) ( ON ?auto_285388 ?auto_285389 ) ( ON ?auto_285387 ?auto_285388 ) ( CLEAR ?auto_285385 ) ( ON ?auto_285386 ?auto_285387 ) ( CLEAR ?auto_285386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_285381 ?auto_285382 ?auto_285383 ?auto_285384 ?auto_285385 ?auto_285386 )
      ( MAKE-11PILE ?auto_285381 ?auto_285382 ?auto_285383 ?auto_285384 ?auto_285385 ?auto_285386 ?auto_285387 ?auto_285388 ?auto_285389 ?auto_285390 ?auto_285391 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_285427 - BLOCK
      ?auto_285428 - BLOCK
      ?auto_285429 - BLOCK
      ?auto_285430 - BLOCK
      ?auto_285431 - BLOCK
      ?auto_285432 - BLOCK
      ?auto_285433 - BLOCK
      ?auto_285434 - BLOCK
      ?auto_285435 - BLOCK
      ?auto_285436 - BLOCK
      ?auto_285437 - BLOCK
    )
    :vars
    (
      ?auto_285438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_285437 ?auto_285438 ) ( ON-TABLE ?auto_285427 ) ( ON ?auto_285428 ?auto_285427 ) ( ON ?auto_285429 ?auto_285428 ) ( ON ?auto_285430 ?auto_285429 ) ( not ( = ?auto_285427 ?auto_285428 ) ) ( not ( = ?auto_285427 ?auto_285429 ) ) ( not ( = ?auto_285427 ?auto_285430 ) ) ( not ( = ?auto_285427 ?auto_285431 ) ) ( not ( = ?auto_285427 ?auto_285432 ) ) ( not ( = ?auto_285427 ?auto_285433 ) ) ( not ( = ?auto_285427 ?auto_285434 ) ) ( not ( = ?auto_285427 ?auto_285435 ) ) ( not ( = ?auto_285427 ?auto_285436 ) ) ( not ( = ?auto_285427 ?auto_285437 ) ) ( not ( = ?auto_285427 ?auto_285438 ) ) ( not ( = ?auto_285428 ?auto_285429 ) ) ( not ( = ?auto_285428 ?auto_285430 ) ) ( not ( = ?auto_285428 ?auto_285431 ) ) ( not ( = ?auto_285428 ?auto_285432 ) ) ( not ( = ?auto_285428 ?auto_285433 ) ) ( not ( = ?auto_285428 ?auto_285434 ) ) ( not ( = ?auto_285428 ?auto_285435 ) ) ( not ( = ?auto_285428 ?auto_285436 ) ) ( not ( = ?auto_285428 ?auto_285437 ) ) ( not ( = ?auto_285428 ?auto_285438 ) ) ( not ( = ?auto_285429 ?auto_285430 ) ) ( not ( = ?auto_285429 ?auto_285431 ) ) ( not ( = ?auto_285429 ?auto_285432 ) ) ( not ( = ?auto_285429 ?auto_285433 ) ) ( not ( = ?auto_285429 ?auto_285434 ) ) ( not ( = ?auto_285429 ?auto_285435 ) ) ( not ( = ?auto_285429 ?auto_285436 ) ) ( not ( = ?auto_285429 ?auto_285437 ) ) ( not ( = ?auto_285429 ?auto_285438 ) ) ( not ( = ?auto_285430 ?auto_285431 ) ) ( not ( = ?auto_285430 ?auto_285432 ) ) ( not ( = ?auto_285430 ?auto_285433 ) ) ( not ( = ?auto_285430 ?auto_285434 ) ) ( not ( = ?auto_285430 ?auto_285435 ) ) ( not ( = ?auto_285430 ?auto_285436 ) ) ( not ( = ?auto_285430 ?auto_285437 ) ) ( not ( = ?auto_285430 ?auto_285438 ) ) ( not ( = ?auto_285431 ?auto_285432 ) ) ( not ( = ?auto_285431 ?auto_285433 ) ) ( not ( = ?auto_285431 ?auto_285434 ) ) ( not ( = ?auto_285431 ?auto_285435 ) ) ( not ( = ?auto_285431 ?auto_285436 ) ) ( not ( = ?auto_285431 ?auto_285437 ) ) ( not ( = ?auto_285431 ?auto_285438 ) ) ( not ( = ?auto_285432 ?auto_285433 ) ) ( not ( = ?auto_285432 ?auto_285434 ) ) ( not ( = ?auto_285432 ?auto_285435 ) ) ( not ( = ?auto_285432 ?auto_285436 ) ) ( not ( = ?auto_285432 ?auto_285437 ) ) ( not ( = ?auto_285432 ?auto_285438 ) ) ( not ( = ?auto_285433 ?auto_285434 ) ) ( not ( = ?auto_285433 ?auto_285435 ) ) ( not ( = ?auto_285433 ?auto_285436 ) ) ( not ( = ?auto_285433 ?auto_285437 ) ) ( not ( = ?auto_285433 ?auto_285438 ) ) ( not ( = ?auto_285434 ?auto_285435 ) ) ( not ( = ?auto_285434 ?auto_285436 ) ) ( not ( = ?auto_285434 ?auto_285437 ) ) ( not ( = ?auto_285434 ?auto_285438 ) ) ( not ( = ?auto_285435 ?auto_285436 ) ) ( not ( = ?auto_285435 ?auto_285437 ) ) ( not ( = ?auto_285435 ?auto_285438 ) ) ( not ( = ?auto_285436 ?auto_285437 ) ) ( not ( = ?auto_285436 ?auto_285438 ) ) ( not ( = ?auto_285437 ?auto_285438 ) ) ( ON ?auto_285436 ?auto_285437 ) ( ON ?auto_285435 ?auto_285436 ) ( ON ?auto_285434 ?auto_285435 ) ( ON ?auto_285433 ?auto_285434 ) ( ON ?auto_285432 ?auto_285433 ) ( CLEAR ?auto_285430 ) ( ON ?auto_285431 ?auto_285432 ) ( CLEAR ?auto_285431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_285427 ?auto_285428 ?auto_285429 ?auto_285430 ?auto_285431 )
      ( MAKE-11PILE ?auto_285427 ?auto_285428 ?auto_285429 ?auto_285430 ?auto_285431 ?auto_285432 ?auto_285433 ?auto_285434 ?auto_285435 ?auto_285436 ?auto_285437 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_285473 - BLOCK
      ?auto_285474 - BLOCK
      ?auto_285475 - BLOCK
      ?auto_285476 - BLOCK
      ?auto_285477 - BLOCK
      ?auto_285478 - BLOCK
      ?auto_285479 - BLOCK
      ?auto_285480 - BLOCK
      ?auto_285481 - BLOCK
      ?auto_285482 - BLOCK
      ?auto_285483 - BLOCK
    )
    :vars
    (
      ?auto_285484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_285483 ?auto_285484 ) ( ON-TABLE ?auto_285473 ) ( ON ?auto_285474 ?auto_285473 ) ( ON ?auto_285475 ?auto_285474 ) ( not ( = ?auto_285473 ?auto_285474 ) ) ( not ( = ?auto_285473 ?auto_285475 ) ) ( not ( = ?auto_285473 ?auto_285476 ) ) ( not ( = ?auto_285473 ?auto_285477 ) ) ( not ( = ?auto_285473 ?auto_285478 ) ) ( not ( = ?auto_285473 ?auto_285479 ) ) ( not ( = ?auto_285473 ?auto_285480 ) ) ( not ( = ?auto_285473 ?auto_285481 ) ) ( not ( = ?auto_285473 ?auto_285482 ) ) ( not ( = ?auto_285473 ?auto_285483 ) ) ( not ( = ?auto_285473 ?auto_285484 ) ) ( not ( = ?auto_285474 ?auto_285475 ) ) ( not ( = ?auto_285474 ?auto_285476 ) ) ( not ( = ?auto_285474 ?auto_285477 ) ) ( not ( = ?auto_285474 ?auto_285478 ) ) ( not ( = ?auto_285474 ?auto_285479 ) ) ( not ( = ?auto_285474 ?auto_285480 ) ) ( not ( = ?auto_285474 ?auto_285481 ) ) ( not ( = ?auto_285474 ?auto_285482 ) ) ( not ( = ?auto_285474 ?auto_285483 ) ) ( not ( = ?auto_285474 ?auto_285484 ) ) ( not ( = ?auto_285475 ?auto_285476 ) ) ( not ( = ?auto_285475 ?auto_285477 ) ) ( not ( = ?auto_285475 ?auto_285478 ) ) ( not ( = ?auto_285475 ?auto_285479 ) ) ( not ( = ?auto_285475 ?auto_285480 ) ) ( not ( = ?auto_285475 ?auto_285481 ) ) ( not ( = ?auto_285475 ?auto_285482 ) ) ( not ( = ?auto_285475 ?auto_285483 ) ) ( not ( = ?auto_285475 ?auto_285484 ) ) ( not ( = ?auto_285476 ?auto_285477 ) ) ( not ( = ?auto_285476 ?auto_285478 ) ) ( not ( = ?auto_285476 ?auto_285479 ) ) ( not ( = ?auto_285476 ?auto_285480 ) ) ( not ( = ?auto_285476 ?auto_285481 ) ) ( not ( = ?auto_285476 ?auto_285482 ) ) ( not ( = ?auto_285476 ?auto_285483 ) ) ( not ( = ?auto_285476 ?auto_285484 ) ) ( not ( = ?auto_285477 ?auto_285478 ) ) ( not ( = ?auto_285477 ?auto_285479 ) ) ( not ( = ?auto_285477 ?auto_285480 ) ) ( not ( = ?auto_285477 ?auto_285481 ) ) ( not ( = ?auto_285477 ?auto_285482 ) ) ( not ( = ?auto_285477 ?auto_285483 ) ) ( not ( = ?auto_285477 ?auto_285484 ) ) ( not ( = ?auto_285478 ?auto_285479 ) ) ( not ( = ?auto_285478 ?auto_285480 ) ) ( not ( = ?auto_285478 ?auto_285481 ) ) ( not ( = ?auto_285478 ?auto_285482 ) ) ( not ( = ?auto_285478 ?auto_285483 ) ) ( not ( = ?auto_285478 ?auto_285484 ) ) ( not ( = ?auto_285479 ?auto_285480 ) ) ( not ( = ?auto_285479 ?auto_285481 ) ) ( not ( = ?auto_285479 ?auto_285482 ) ) ( not ( = ?auto_285479 ?auto_285483 ) ) ( not ( = ?auto_285479 ?auto_285484 ) ) ( not ( = ?auto_285480 ?auto_285481 ) ) ( not ( = ?auto_285480 ?auto_285482 ) ) ( not ( = ?auto_285480 ?auto_285483 ) ) ( not ( = ?auto_285480 ?auto_285484 ) ) ( not ( = ?auto_285481 ?auto_285482 ) ) ( not ( = ?auto_285481 ?auto_285483 ) ) ( not ( = ?auto_285481 ?auto_285484 ) ) ( not ( = ?auto_285482 ?auto_285483 ) ) ( not ( = ?auto_285482 ?auto_285484 ) ) ( not ( = ?auto_285483 ?auto_285484 ) ) ( ON ?auto_285482 ?auto_285483 ) ( ON ?auto_285481 ?auto_285482 ) ( ON ?auto_285480 ?auto_285481 ) ( ON ?auto_285479 ?auto_285480 ) ( ON ?auto_285478 ?auto_285479 ) ( ON ?auto_285477 ?auto_285478 ) ( CLEAR ?auto_285475 ) ( ON ?auto_285476 ?auto_285477 ) ( CLEAR ?auto_285476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_285473 ?auto_285474 ?auto_285475 ?auto_285476 )
      ( MAKE-11PILE ?auto_285473 ?auto_285474 ?auto_285475 ?auto_285476 ?auto_285477 ?auto_285478 ?auto_285479 ?auto_285480 ?auto_285481 ?auto_285482 ?auto_285483 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_285519 - BLOCK
      ?auto_285520 - BLOCK
      ?auto_285521 - BLOCK
      ?auto_285522 - BLOCK
      ?auto_285523 - BLOCK
      ?auto_285524 - BLOCK
      ?auto_285525 - BLOCK
      ?auto_285526 - BLOCK
      ?auto_285527 - BLOCK
      ?auto_285528 - BLOCK
      ?auto_285529 - BLOCK
    )
    :vars
    (
      ?auto_285530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_285529 ?auto_285530 ) ( ON-TABLE ?auto_285519 ) ( ON ?auto_285520 ?auto_285519 ) ( not ( = ?auto_285519 ?auto_285520 ) ) ( not ( = ?auto_285519 ?auto_285521 ) ) ( not ( = ?auto_285519 ?auto_285522 ) ) ( not ( = ?auto_285519 ?auto_285523 ) ) ( not ( = ?auto_285519 ?auto_285524 ) ) ( not ( = ?auto_285519 ?auto_285525 ) ) ( not ( = ?auto_285519 ?auto_285526 ) ) ( not ( = ?auto_285519 ?auto_285527 ) ) ( not ( = ?auto_285519 ?auto_285528 ) ) ( not ( = ?auto_285519 ?auto_285529 ) ) ( not ( = ?auto_285519 ?auto_285530 ) ) ( not ( = ?auto_285520 ?auto_285521 ) ) ( not ( = ?auto_285520 ?auto_285522 ) ) ( not ( = ?auto_285520 ?auto_285523 ) ) ( not ( = ?auto_285520 ?auto_285524 ) ) ( not ( = ?auto_285520 ?auto_285525 ) ) ( not ( = ?auto_285520 ?auto_285526 ) ) ( not ( = ?auto_285520 ?auto_285527 ) ) ( not ( = ?auto_285520 ?auto_285528 ) ) ( not ( = ?auto_285520 ?auto_285529 ) ) ( not ( = ?auto_285520 ?auto_285530 ) ) ( not ( = ?auto_285521 ?auto_285522 ) ) ( not ( = ?auto_285521 ?auto_285523 ) ) ( not ( = ?auto_285521 ?auto_285524 ) ) ( not ( = ?auto_285521 ?auto_285525 ) ) ( not ( = ?auto_285521 ?auto_285526 ) ) ( not ( = ?auto_285521 ?auto_285527 ) ) ( not ( = ?auto_285521 ?auto_285528 ) ) ( not ( = ?auto_285521 ?auto_285529 ) ) ( not ( = ?auto_285521 ?auto_285530 ) ) ( not ( = ?auto_285522 ?auto_285523 ) ) ( not ( = ?auto_285522 ?auto_285524 ) ) ( not ( = ?auto_285522 ?auto_285525 ) ) ( not ( = ?auto_285522 ?auto_285526 ) ) ( not ( = ?auto_285522 ?auto_285527 ) ) ( not ( = ?auto_285522 ?auto_285528 ) ) ( not ( = ?auto_285522 ?auto_285529 ) ) ( not ( = ?auto_285522 ?auto_285530 ) ) ( not ( = ?auto_285523 ?auto_285524 ) ) ( not ( = ?auto_285523 ?auto_285525 ) ) ( not ( = ?auto_285523 ?auto_285526 ) ) ( not ( = ?auto_285523 ?auto_285527 ) ) ( not ( = ?auto_285523 ?auto_285528 ) ) ( not ( = ?auto_285523 ?auto_285529 ) ) ( not ( = ?auto_285523 ?auto_285530 ) ) ( not ( = ?auto_285524 ?auto_285525 ) ) ( not ( = ?auto_285524 ?auto_285526 ) ) ( not ( = ?auto_285524 ?auto_285527 ) ) ( not ( = ?auto_285524 ?auto_285528 ) ) ( not ( = ?auto_285524 ?auto_285529 ) ) ( not ( = ?auto_285524 ?auto_285530 ) ) ( not ( = ?auto_285525 ?auto_285526 ) ) ( not ( = ?auto_285525 ?auto_285527 ) ) ( not ( = ?auto_285525 ?auto_285528 ) ) ( not ( = ?auto_285525 ?auto_285529 ) ) ( not ( = ?auto_285525 ?auto_285530 ) ) ( not ( = ?auto_285526 ?auto_285527 ) ) ( not ( = ?auto_285526 ?auto_285528 ) ) ( not ( = ?auto_285526 ?auto_285529 ) ) ( not ( = ?auto_285526 ?auto_285530 ) ) ( not ( = ?auto_285527 ?auto_285528 ) ) ( not ( = ?auto_285527 ?auto_285529 ) ) ( not ( = ?auto_285527 ?auto_285530 ) ) ( not ( = ?auto_285528 ?auto_285529 ) ) ( not ( = ?auto_285528 ?auto_285530 ) ) ( not ( = ?auto_285529 ?auto_285530 ) ) ( ON ?auto_285528 ?auto_285529 ) ( ON ?auto_285527 ?auto_285528 ) ( ON ?auto_285526 ?auto_285527 ) ( ON ?auto_285525 ?auto_285526 ) ( ON ?auto_285524 ?auto_285525 ) ( ON ?auto_285523 ?auto_285524 ) ( ON ?auto_285522 ?auto_285523 ) ( CLEAR ?auto_285520 ) ( ON ?auto_285521 ?auto_285522 ) ( CLEAR ?auto_285521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_285519 ?auto_285520 ?auto_285521 )
      ( MAKE-11PILE ?auto_285519 ?auto_285520 ?auto_285521 ?auto_285522 ?auto_285523 ?auto_285524 ?auto_285525 ?auto_285526 ?auto_285527 ?auto_285528 ?auto_285529 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_285565 - BLOCK
      ?auto_285566 - BLOCK
      ?auto_285567 - BLOCK
      ?auto_285568 - BLOCK
      ?auto_285569 - BLOCK
      ?auto_285570 - BLOCK
      ?auto_285571 - BLOCK
      ?auto_285572 - BLOCK
      ?auto_285573 - BLOCK
      ?auto_285574 - BLOCK
      ?auto_285575 - BLOCK
    )
    :vars
    (
      ?auto_285576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_285575 ?auto_285576 ) ( ON-TABLE ?auto_285565 ) ( not ( = ?auto_285565 ?auto_285566 ) ) ( not ( = ?auto_285565 ?auto_285567 ) ) ( not ( = ?auto_285565 ?auto_285568 ) ) ( not ( = ?auto_285565 ?auto_285569 ) ) ( not ( = ?auto_285565 ?auto_285570 ) ) ( not ( = ?auto_285565 ?auto_285571 ) ) ( not ( = ?auto_285565 ?auto_285572 ) ) ( not ( = ?auto_285565 ?auto_285573 ) ) ( not ( = ?auto_285565 ?auto_285574 ) ) ( not ( = ?auto_285565 ?auto_285575 ) ) ( not ( = ?auto_285565 ?auto_285576 ) ) ( not ( = ?auto_285566 ?auto_285567 ) ) ( not ( = ?auto_285566 ?auto_285568 ) ) ( not ( = ?auto_285566 ?auto_285569 ) ) ( not ( = ?auto_285566 ?auto_285570 ) ) ( not ( = ?auto_285566 ?auto_285571 ) ) ( not ( = ?auto_285566 ?auto_285572 ) ) ( not ( = ?auto_285566 ?auto_285573 ) ) ( not ( = ?auto_285566 ?auto_285574 ) ) ( not ( = ?auto_285566 ?auto_285575 ) ) ( not ( = ?auto_285566 ?auto_285576 ) ) ( not ( = ?auto_285567 ?auto_285568 ) ) ( not ( = ?auto_285567 ?auto_285569 ) ) ( not ( = ?auto_285567 ?auto_285570 ) ) ( not ( = ?auto_285567 ?auto_285571 ) ) ( not ( = ?auto_285567 ?auto_285572 ) ) ( not ( = ?auto_285567 ?auto_285573 ) ) ( not ( = ?auto_285567 ?auto_285574 ) ) ( not ( = ?auto_285567 ?auto_285575 ) ) ( not ( = ?auto_285567 ?auto_285576 ) ) ( not ( = ?auto_285568 ?auto_285569 ) ) ( not ( = ?auto_285568 ?auto_285570 ) ) ( not ( = ?auto_285568 ?auto_285571 ) ) ( not ( = ?auto_285568 ?auto_285572 ) ) ( not ( = ?auto_285568 ?auto_285573 ) ) ( not ( = ?auto_285568 ?auto_285574 ) ) ( not ( = ?auto_285568 ?auto_285575 ) ) ( not ( = ?auto_285568 ?auto_285576 ) ) ( not ( = ?auto_285569 ?auto_285570 ) ) ( not ( = ?auto_285569 ?auto_285571 ) ) ( not ( = ?auto_285569 ?auto_285572 ) ) ( not ( = ?auto_285569 ?auto_285573 ) ) ( not ( = ?auto_285569 ?auto_285574 ) ) ( not ( = ?auto_285569 ?auto_285575 ) ) ( not ( = ?auto_285569 ?auto_285576 ) ) ( not ( = ?auto_285570 ?auto_285571 ) ) ( not ( = ?auto_285570 ?auto_285572 ) ) ( not ( = ?auto_285570 ?auto_285573 ) ) ( not ( = ?auto_285570 ?auto_285574 ) ) ( not ( = ?auto_285570 ?auto_285575 ) ) ( not ( = ?auto_285570 ?auto_285576 ) ) ( not ( = ?auto_285571 ?auto_285572 ) ) ( not ( = ?auto_285571 ?auto_285573 ) ) ( not ( = ?auto_285571 ?auto_285574 ) ) ( not ( = ?auto_285571 ?auto_285575 ) ) ( not ( = ?auto_285571 ?auto_285576 ) ) ( not ( = ?auto_285572 ?auto_285573 ) ) ( not ( = ?auto_285572 ?auto_285574 ) ) ( not ( = ?auto_285572 ?auto_285575 ) ) ( not ( = ?auto_285572 ?auto_285576 ) ) ( not ( = ?auto_285573 ?auto_285574 ) ) ( not ( = ?auto_285573 ?auto_285575 ) ) ( not ( = ?auto_285573 ?auto_285576 ) ) ( not ( = ?auto_285574 ?auto_285575 ) ) ( not ( = ?auto_285574 ?auto_285576 ) ) ( not ( = ?auto_285575 ?auto_285576 ) ) ( ON ?auto_285574 ?auto_285575 ) ( ON ?auto_285573 ?auto_285574 ) ( ON ?auto_285572 ?auto_285573 ) ( ON ?auto_285571 ?auto_285572 ) ( ON ?auto_285570 ?auto_285571 ) ( ON ?auto_285569 ?auto_285570 ) ( ON ?auto_285568 ?auto_285569 ) ( ON ?auto_285567 ?auto_285568 ) ( CLEAR ?auto_285565 ) ( ON ?auto_285566 ?auto_285567 ) ( CLEAR ?auto_285566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_285565 ?auto_285566 )
      ( MAKE-11PILE ?auto_285565 ?auto_285566 ?auto_285567 ?auto_285568 ?auto_285569 ?auto_285570 ?auto_285571 ?auto_285572 ?auto_285573 ?auto_285574 ?auto_285575 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_285611 - BLOCK
      ?auto_285612 - BLOCK
      ?auto_285613 - BLOCK
      ?auto_285614 - BLOCK
      ?auto_285615 - BLOCK
      ?auto_285616 - BLOCK
      ?auto_285617 - BLOCK
      ?auto_285618 - BLOCK
      ?auto_285619 - BLOCK
      ?auto_285620 - BLOCK
      ?auto_285621 - BLOCK
    )
    :vars
    (
      ?auto_285622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_285621 ?auto_285622 ) ( not ( = ?auto_285611 ?auto_285612 ) ) ( not ( = ?auto_285611 ?auto_285613 ) ) ( not ( = ?auto_285611 ?auto_285614 ) ) ( not ( = ?auto_285611 ?auto_285615 ) ) ( not ( = ?auto_285611 ?auto_285616 ) ) ( not ( = ?auto_285611 ?auto_285617 ) ) ( not ( = ?auto_285611 ?auto_285618 ) ) ( not ( = ?auto_285611 ?auto_285619 ) ) ( not ( = ?auto_285611 ?auto_285620 ) ) ( not ( = ?auto_285611 ?auto_285621 ) ) ( not ( = ?auto_285611 ?auto_285622 ) ) ( not ( = ?auto_285612 ?auto_285613 ) ) ( not ( = ?auto_285612 ?auto_285614 ) ) ( not ( = ?auto_285612 ?auto_285615 ) ) ( not ( = ?auto_285612 ?auto_285616 ) ) ( not ( = ?auto_285612 ?auto_285617 ) ) ( not ( = ?auto_285612 ?auto_285618 ) ) ( not ( = ?auto_285612 ?auto_285619 ) ) ( not ( = ?auto_285612 ?auto_285620 ) ) ( not ( = ?auto_285612 ?auto_285621 ) ) ( not ( = ?auto_285612 ?auto_285622 ) ) ( not ( = ?auto_285613 ?auto_285614 ) ) ( not ( = ?auto_285613 ?auto_285615 ) ) ( not ( = ?auto_285613 ?auto_285616 ) ) ( not ( = ?auto_285613 ?auto_285617 ) ) ( not ( = ?auto_285613 ?auto_285618 ) ) ( not ( = ?auto_285613 ?auto_285619 ) ) ( not ( = ?auto_285613 ?auto_285620 ) ) ( not ( = ?auto_285613 ?auto_285621 ) ) ( not ( = ?auto_285613 ?auto_285622 ) ) ( not ( = ?auto_285614 ?auto_285615 ) ) ( not ( = ?auto_285614 ?auto_285616 ) ) ( not ( = ?auto_285614 ?auto_285617 ) ) ( not ( = ?auto_285614 ?auto_285618 ) ) ( not ( = ?auto_285614 ?auto_285619 ) ) ( not ( = ?auto_285614 ?auto_285620 ) ) ( not ( = ?auto_285614 ?auto_285621 ) ) ( not ( = ?auto_285614 ?auto_285622 ) ) ( not ( = ?auto_285615 ?auto_285616 ) ) ( not ( = ?auto_285615 ?auto_285617 ) ) ( not ( = ?auto_285615 ?auto_285618 ) ) ( not ( = ?auto_285615 ?auto_285619 ) ) ( not ( = ?auto_285615 ?auto_285620 ) ) ( not ( = ?auto_285615 ?auto_285621 ) ) ( not ( = ?auto_285615 ?auto_285622 ) ) ( not ( = ?auto_285616 ?auto_285617 ) ) ( not ( = ?auto_285616 ?auto_285618 ) ) ( not ( = ?auto_285616 ?auto_285619 ) ) ( not ( = ?auto_285616 ?auto_285620 ) ) ( not ( = ?auto_285616 ?auto_285621 ) ) ( not ( = ?auto_285616 ?auto_285622 ) ) ( not ( = ?auto_285617 ?auto_285618 ) ) ( not ( = ?auto_285617 ?auto_285619 ) ) ( not ( = ?auto_285617 ?auto_285620 ) ) ( not ( = ?auto_285617 ?auto_285621 ) ) ( not ( = ?auto_285617 ?auto_285622 ) ) ( not ( = ?auto_285618 ?auto_285619 ) ) ( not ( = ?auto_285618 ?auto_285620 ) ) ( not ( = ?auto_285618 ?auto_285621 ) ) ( not ( = ?auto_285618 ?auto_285622 ) ) ( not ( = ?auto_285619 ?auto_285620 ) ) ( not ( = ?auto_285619 ?auto_285621 ) ) ( not ( = ?auto_285619 ?auto_285622 ) ) ( not ( = ?auto_285620 ?auto_285621 ) ) ( not ( = ?auto_285620 ?auto_285622 ) ) ( not ( = ?auto_285621 ?auto_285622 ) ) ( ON ?auto_285620 ?auto_285621 ) ( ON ?auto_285619 ?auto_285620 ) ( ON ?auto_285618 ?auto_285619 ) ( ON ?auto_285617 ?auto_285618 ) ( ON ?auto_285616 ?auto_285617 ) ( ON ?auto_285615 ?auto_285616 ) ( ON ?auto_285614 ?auto_285615 ) ( ON ?auto_285613 ?auto_285614 ) ( ON ?auto_285612 ?auto_285613 ) ( ON ?auto_285611 ?auto_285612 ) ( CLEAR ?auto_285611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_285611 )
      ( MAKE-11PILE ?auto_285611 ?auto_285612 ?auto_285613 ?auto_285614 ?auto_285615 ?auto_285616 ?auto_285617 ?auto_285618 ?auto_285619 ?auto_285620 ?auto_285621 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_285658 - BLOCK
      ?auto_285659 - BLOCK
      ?auto_285660 - BLOCK
      ?auto_285661 - BLOCK
      ?auto_285662 - BLOCK
      ?auto_285663 - BLOCK
      ?auto_285664 - BLOCK
      ?auto_285665 - BLOCK
      ?auto_285666 - BLOCK
      ?auto_285667 - BLOCK
      ?auto_285668 - BLOCK
      ?auto_285669 - BLOCK
    )
    :vars
    (
      ?auto_285670 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_285668 ) ( ON ?auto_285669 ?auto_285670 ) ( CLEAR ?auto_285669 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_285658 ) ( ON ?auto_285659 ?auto_285658 ) ( ON ?auto_285660 ?auto_285659 ) ( ON ?auto_285661 ?auto_285660 ) ( ON ?auto_285662 ?auto_285661 ) ( ON ?auto_285663 ?auto_285662 ) ( ON ?auto_285664 ?auto_285663 ) ( ON ?auto_285665 ?auto_285664 ) ( ON ?auto_285666 ?auto_285665 ) ( ON ?auto_285667 ?auto_285666 ) ( ON ?auto_285668 ?auto_285667 ) ( not ( = ?auto_285658 ?auto_285659 ) ) ( not ( = ?auto_285658 ?auto_285660 ) ) ( not ( = ?auto_285658 ?auto_285661 ) ) ( not ( = ?auto_285658 ?auto_285662 ) ) ( not ( = ?auto_285658 ?auto_285663 ) ) ( not ( = ?auto_285658 ?auto_285664 ) ) ( not ( = ?auto_285658 ?auto_285665 ) ) ( not ( = ?auto_285658 ?auto_285666 ) ) ( not ( = ?auto_285658 ?auto_285667 ) ) ( not ( = ?auto_285658 ?auto_285668 ) ) ( not ( = ?auto_285658 ?auto_285669 ) ) ( not ( = ?auto_285658 ?auto_285670 ) ) ( not ( = ?auto_285659 ?auto_285660 ) ) ( not ( = ?auto_285659 ?auto_285661 ) ) ( not ( = ?auto_285659 ?auto_285662 ) ) ( not ( = ?auto_285659 ?auto_285663 ) ) ( not ( = ?auto_285659 ?auto_285664 ) ) ( not ( = ?auto_285659 ?auto_285665 ) ) ( not ( = ?auto_285659 ?auto_285666 ) ) ( not ( = ?auto_285659 ?auto_285667 ) ) ( not ( = ?auto_285659 ?auto_285668 ) ) ( not ( = ?auto_285659 ?auto_285669 ) ) ( not ( = ?auto_285659 ?auto_285670 ) ) ( not ( = ?auto_285660 ?auto_285661 ) ) ( not ( = ?auto_285660 ?auto_285662 ) ) ( not ( = ?auto_285660 ?auto_285663 ) ) ( not ( = ?auto_285660 ?auto_285664 ) ) ( not ( = ?auto_285660 ?auto_285665 ) ) ( not ( = ?auto_285660 ?auto_285666 ) ) ( not ( = ?auto_285660 ?auto_285667 ) ) ( not ( = ?auto_285660 ?auto_285668 ) ) ( not ( = ?auto_285660 ?auto_285669 ) ) ( not ( = ?auto_285660 ?auto_285670 ) ) ( not ( = ?auto_285661 ?auto_285662 ) ) ( not ( = ?auto_285661 ?auto_285663 ) ) ( not ( = ?auto_285661 ?auto_285664 ) ) ( not ( = ?auto_285661 ?auto_285665 ) ) ( not ( = ?auto_285661 ?auto_285666 ) ) ( not ( = ?auto_285661 ?auto_285667 ) ) ( not ( = ?auto_285661 ?auto_285668 ) ) ( not ( = ?auto_285661 ?auto_285669 ) ) ( not ( = ?auto_285661 ?auto_285670 ) ) ( not ( = ?auto_285662 ?auto_285663 ) ) ( not ( = ?auto_285662 ?auto_285664 ) ) ( not ( = ?auto_285662 ?auto_285665 ) ) ( not ( = ?auto_285662 ?auto_285666 ) ) ( not ( = ?auto_285662 ?auto_285667 ) ) ( not ( = ?auto_285662 ?auto_285668 ) ) ( not ( = ?auto_285662 ?auto_285669 ) ) ( not ( = ?auto_285662 ?auto_285670 ) ) ( not ( = ?auto_285663 ?auto_285664 ) ) ( not ( = ?auto_285663 ?auto_285665 ) ) ( not ( = ?auto_285663 ?auto_285666 ) ) ( not ( = ?auto_285663 ?auto_285667 ) ) ( not ( = ?auto_285663 ?auto_285668 ) ) ( not ( = ?auto_285663 ?auto_285669 ) ) ( not ( = ?auto_285663 ?auto_285670 ) ) ( not ( = ?auto_285664 ?auto_285665 ) ) ( not ( = ?auto_285664 ?auto_285666 ) ) ( not ( = ?auto_285664 ?auto_285667 ) ) ( not ( = ?auto_285664 ?auto_285668 ) ) ( not ( = ?auto_285664 ?auto_285669 ) ) ( not ( = ?auto_285664 ?auto_285670 ) ) ( not ( = ?auto_285665 ?auto_285666 ) ) ( not ( = ?auto_285665 ?auto_285667 ) ) ( not ( = ?auto_285665 ?auto_285668 ) ) ( not ( = ?auto_285665 ?auto_285669 ) ) ( not ( = ?auto_285665 ?auto_285670 ) ) ( not ( = ?auto_285666 ?auto_285667 ) ) ( not ( = ?auto_285666 ?auto_285668 ) ) ( not ( = ?auto_285666 ?auto_285669 ) ) ( not ( = ?auto_285666 ?auto_285670 ) ) ( not ( = ?auto_285667 ?auto_285668 ) ) ( not ( = ?auto_285667 ?auto_285669 ) ) ( not ( = ?auto_285667 ?auto_285670 ) ) ( not ( = ?auto_285668 ?auto_285669 ) ) ( not ( = ?auto_285668 ?auto_285670 ) ) ( not ( = ?auto_285669 ?auto_285670 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_285669 ?auto_285670 )
      ( !STACK ?auto_285669 ?auto_285668 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_285708 - BLOCK
      ?auto_285709 - BLOCK
      ?auto_285710 - BLOCK
      ?auto_285711 - BLOCK
      ?auto_285712 - BLOCK
      ?auto_285713 - BLOCK
      ?auto_285714 - BLOCK
      ?auto_285715 - BLOCK
      ?auto_285716 - BLOCK
      ?auto_285717 - BLOCK
      ?auto_285718 - BLOCK
      ?auto_285719 - BLOCK
    )
    :vars
    (
      ?auto_285720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_285719 ?auto_285720 ) ( ON-TABLE ?auto_285708 ) ( ON ?auto_285709 ?auto_285708 ) ( ON ?auto_285710 ?auto_285709 ) ( ON ?auto_285711 ?auto_285710 ) ( ON ?auto_285712 ?auto_285711 ) ( ON ?auto_285713 ?auto_285712 ) ( ON ?auto_285714 ?auto_285713 ) ( ON ?auto_285715 ?auto_285714 ) ( ON ?auto_285716 ?auto_285715 ) ( ON ?auto_285717 ?auto_285716 ) ( not ( = ?auto_285708 ?auto_285709 ) ) ( not ( = ?auto_285708 ?auto_285710 ) ) ( not ( = ?auto_285708 ?auto_285711 ) ) ( not ( = ?auto_285708 ?auto_285712 ) ) ( not ( = ?auto_285708 ?auto_285713 ) ) ( not ( = ?auto_285708 ?auto_285714 ) ) ( not ( = ?auto_285708 ?auto_285715 ) ) ( not ( = ?auto_285708 ?auto_285716 ) ) ( not ( = ?auto_285708 ?auto_285717 ) ) ( not ( = ?auto_285708 ?auto_285718 ) ) ( not ( = ?auto_285708 ?auto_285719 ) ) ( not ( = ?auto_285708 ?auto_285720 ) ) ( not ( = ?auto_285709 ?auto_285710 ) ) ( not ( = ?auto_285709 ?auto_285711 ) ) ( not ( = ?auto_285709 ?auto_285712 ) ) ( not ( = ?auto_285709 ?auto_285713 ) ) ( not ( = ?auto_285709 ?auto_285714 ) ) ( not ( = ?auto_285709 ?auto_285715 ) ) ( not ( = ?auto_285709 ?auto_285716 ) ) ( not ( = ?auto_285709 ?auto_285717 ) ) ( not ( = ?auto_285709 ?auto_285718 ) ) ( not ( = ?auto_285709 ?auto_285719 ) ) ( not ( = ?auto_285709 ?auto_285720 ) ) ( not ( = ?auto_285710 ?auto_285711 ) ) ( not ( = ?auto_285710 ?auto_285712 ) ) ( not ( = ?auto_285710 ?auto_285713 ) ) ( not ( = ?auto_285710 ?auto_285714 ) ) ( not ( = ?auto_285710 ?auto_285715 ) ) ( not ( = ?auto_285710 ?auto_285716 ) ) ( not ( = ?auto_285710 ?auto_285717 ) ) ( not ( = ?auto_285710 ?auto_285718 ) ) ( not ( = ?auto_285710 ?auto_285719 ) ) ( not ( = ?auto_285710 ?auto_285720 ) ) ( not ( = ?auto_285711 ?auto_285712 ) ) ( not ( = ?auto_285711 ?auto_285713 ) ) ( not ( = ?auto_285711 ?auto_285714 ) ) ( not ( = ?auto_285711 ?auto_285715 ) ) ( not ( = ?auto_285711 ?auto_285716 ) ) ( not ( = ?auto_285711 ?auto_285717 ) ) ( not ( = ?auto_285711 ?auto_285718 ) ) ( not ( = ?auto_285711 ?auto_285719 ) ) ( not ( = ?auto_285711 ?auto_285720 ) ) ( not ( = ?auto_285712 ?auto_285713 ) ) ( not ( = ?auto_285712 ?auto_285714 ) ) ( not ( = ?auto_285712 ?auto_285715 ) ) ( not ( = ?auto_285712 ?auto_285716 ) ) ( not ( = ?auto_285712 ?auto_285717 ) ) ( not ( = ?auto_285712 ?auto_285718 ) ) ( not ( = ?auto_285712 ?auto_285719 ) ) ( not ( = ?auto_285712 ?auto_285720 ) ) ( not ( = ?auto_285713 ?auto_285714 ) ) ( not ( = ?auto_285713 ?auto_285715 ) ) ( not ( = ?auto_285713 ?auto_285716 ) ) ( not ( = ?auto_285713 ?auto_285717 ) ) ( not ( = ?auto_285713 ?auto_285718 ) ) ( not ( = ?auto_285713 ?auto_285719 ) ) ( not ( = ?auto_285713 ?auto_285720 ) ) ( not ( = ?auto_285714 ?auto_285715 ) ) ( not ( = ?auto_285714 ?auto_285716 ) ) ( not ( = ?auto_285714 ?auto_285717 ) ) ( not ( = ?auto_285714 ?auto_285718 ) ) ( not ( = ?auto_285714 ?auto_285719 ) ) ( not ( = ?auto_285714 ?auto_285720 ) ) ( not ( = ?auto_285715 ?auto_285716 ) ) ( not ( = ?auto_285715 ?auto_285717 ) ) ( not ( = ?auto_285715 ?auto_285718 ) ) ( not ( = ?auto_285715 ?auto_285719 ) ) ( not ( = ?auto_285715 ?auto_285720 ) ) ( not ( = ?auto_285716 ?auto_285717 ) ) ( not ( = ?auto_285716 ?auto_285718 ) ) ( not ( = ?auto_285716 ?auto_285719 ) ) ( not ( = ?auto_285716 ?auto_285720 ) ) ( not ( = ?auto_285717 ?auto_285718 ) ) ( not ( = ?auto_285717 ?auto_285719 ) ) ( not ( = ?auto_285717 ?auto_285720 ) ) ( not ( = ?auto_285718 ?auto_285719 ) ) ( not ( = ?auto_285718 ?auto_285720 ) ) ( not ( = ?auto_285719 ?auto_285720 ) ) ( CLEAR ?auto_285717 ) ( ON ?auto_285718 ?auto_285719 ) ( CLEAR ?auto_285718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_285708 ?auto_285709 ?auto_285710 ?auto_285711 ?auto_285712 ?auto_285713 ?auto_285714 ?auto_285715 ?auto_285716 ?auto_285717 ?auto_285718 )
      ( MAKE-12PILE ?auto_285708 ?auto_285709 ?auto_285710 ?auto_285711 ?auto_285712 ?auto_285713 ?auto_285714 ?auto_285715 ?auto_285716 ?auto_285717 ?auto_285718 ?auto_285719 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_285758 - BLOCK
      ?auto_285759 - BLOCK
      ?auto_285760 - BLOCK
      ?auto_285761 - BLOCK
      ?auto_285762 - BLOCK
      ?auto_285763 - BLOCK
      ?auto_285764 - BLOCK
      ?auto_285765 - BLOCK
      ?auto_285766 - BLOCK
      ?auto_285767 - BLOCK
      ?auto_285768 - BLOCK
      ?auto_285769 - BLOCK
    )
    :vars
    (
      ?auto_285770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_285769 ?auto_285770 ) ( ON-TABLE ?auto_285758 ) ( ON ?auto_285759 ?auto_285758 ) ( ON ?auto_285760 ?auto_285759 ) ( ON ?auto_285761 ?auto_285760 ) ( ON ?auto_285762 ?auto_285761 ) ( ON ?auto_285763 ?auto_285762 ) ( ON ?auto_285764 ?auto_285763 ) ( ON ?auto_285765 ?auto_285764 ) ( ON ?auto_285766 ?auto_285765 ) ( not ( = ?auto_285758 ?auto_285759 ) ) ( not ( = ?auto_285758 ?auto_285760 ) ) ( not ( = ?auto_285758 ?auto_285761 ) ) ( not ( = ?auto_285758 ?auto_285762 ) ) ( not ( = ?auto_285758 ?auto_285763 ) ) ( not ( = ?auto_285758 ?auto_285764 ) ) ( not ( = ?auto_285758 ?auto_285765 ) ) ( not ( = ?auto_285758 ?auto_285766 ) ) ( not ( = ?auto_285758 ?auto_285767 ) ) ( not ( = ?auto_285758 ?auto_285768 ) ) ( not ( = ?auto_285758 ?auto_285769 ) ) ( not ( = ?auto_285758 ?auto_285770 ) ) ( not ( = ?auto_285759 ?auto_285760 ) ) ( not ( = ?auto_285759 ?auto_285761 ) ) ( not ( = ?auto_285759 ?auto_285762 ) ) ( not ( = ?auto_285759 ?auto_285763 ) ) ( not ( = ?auto_285759 ?auto_285764 ) ) ( not ( = ?auto_285759 ?auto_285765 ) ) ( not ( = ?auto_285759 ?auto_285766 ) ) ( not ( = ?auto_285759 ?auto_285767 ) ) ( not ( = ?auto_285759 ?auto_285768 ) ) ( not ( = ?auto_285759 ?auto_285769 ) ) ( not ( = ?auto_285759 ?auto_285770 ) ) ( not ( = ?auto_285760 ?auto_285761 ) ) ( not ( = ?auto_285760 ?auto_285762 ) ) ( not ( = ?auto_285760 ?auto_285763 ) ) ( not ( = ?auto_285760 ?auto_285764 ) ) ( not ( = ?auto_285760 ?auto_285765 ) ) ( not ( = ?auto_285760 ?auto_285766 ) ) ( not ( = ?auto_285760 ?auto_285767 ) ) ( not ( = ?auto_285760 ?auto_285768 ) ) ( not ( = ?auto_285760 ?auto_285769 ) ) ( not ( = ?auto_285760 ?auto_285770 ) ) ( not ( = ?auto_285761 ?auto_285762 ) ) ( not ( = ?auto_285761 ?auto_285763 ) ) ( not ( = ?auto_285761 ?auto_285764 ) ) ( not ( = ?auto_285761 ?auto_285765 ) ) ( not ( = ?auto_285761 ?auto_285766 ) ) ( not ( = ?auto_285761 ?auto_285767 ) ) ( not ( = ?auto_285761 ?auto_285768 ) ) ( not ( = ?auto_285761 ?auto_285769 ) ) ( not ( = ?auto_285761 ?auto_285770 ) ) ( not ( = ?auto_285762 ?auto_285763 ) ) ( not ( = ?auto_285762 ?auto_285764 ) ) ( not ( = ?auto_285762 ?auto_285765 ) ) ( not ( = ?auto_285762 ?auto_285766 ) ) ( not ( = ?auto_285762 ?auto_285767 ) ) ( not ( = ?auto_285762 ?auto_285768 ) ) ( not ( = ?auto_285762 ?auto_285769 ) ) ( not ( = ?auto_285762 ?auto_285770 ) ) ( not ( = ?auto_285763 ?auto_285764 ) ) ( not ( = ?auto_285763 ?auto_285765 ) ) ( not ( = ?auto_285763 ?auto_285766 ) ) ( not ( = ?auto_285763 ?auto_285767 ) ) ( not ( = ?auto_285763 ?auto_285768 ) ) ( not ( = ?auto_285763 ?auto_285769 ) ) ( not ( = ?auto_285763 ?auto_285770 ) ) ( not ( = ?auto_285764 ?auto_285765 ) ) ( not ( = ?auto_285764 ?auto_285766 ) ) ( not ( = ?auto_285764 ?auto_285767 ) ) ( not ( = ?auto_285764 ?auto_285768 ) ) ( not ( = ?auto_285764 ?auto_285769 ) ) ( not ( = ?auto_285764 ?auto_285770 ) ) ( not ( = ?auto_285765 ?auto_285766 ) ) ( not ( = ?auto_285765 ?auto_285767 ) ) ( not ( = ?auto_285765 ?auto_285768 ) ) ( not ( = ?auto_285765 ?auto_285769 ) ) ( not ( = ?auto_285765 ?auto_285770 ) ) ( not ( = ?auto_285766 ?auto_285767 ) ) ( not ( = ?auto_285766 ?auto_285768 ) ) ( not ( = ?auto_285766 ?auto_285769 ) ) ( not ( = ?auto_285766 ?auto_285770 ) ) ( not ( = ?auto_285767 ?auto_285768 ) ) ( not ( = ?auto_285767 ?auto_285769 ) ) ( not ( = ?auto_285767 ?auto_285770 ) ) ( not ( = ?auto_285768 ?auto_285769 ) ) ( not ( = ?auto_285768 ?auto_285770 ) ) ( not ( = ?auto_285769 ?auto_285770 ) ) ( ON ?auto_285768 ?auto_285769 ) ( CLEAR ?auto_285766 ) ( ON ?auto_285767 ?auto_285768 ) ( CLEAR ?auto_285767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_285758 ?auto_285759 ?auto_285760 ?auto_285761 ?auto_285762 ?auto_285763 ?auto_285764 ?auto_285765 ?auto_285766 ?auto_285767 )
      ( MAKE-12PILE ?auto_285758 ?auto_285759 ?auto_285760 ?auto_285761 ?auto_285762 ?auto_285763 ?auto_285764 ?auto_285765 ?auto_285766 ?auto_285767 ?auto_285768 ?auto_285769 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_285808 - BLOCK
      ?auto_285809 - BLOCK
      ?auto_285810 - BLOCK
      ?auto_285811 - BLOCK
      ?auto_285812 - BLOCK
      ?auto_285813 - BLOCK
      ?auto_285814 - BLOCK
      ?auto_285815 - BLOCK
      ?auto_285816 - BLOCK
      ?auto_285817 - BLOCK
      ?auto_285818 - BLOCK
      ?auto_285819 - BLOCK
    )
    :vars
    (
      ?auto_285820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_285819 ?auto_285820 ) ( ON-TABLE ?auto_285808 ) ( ON ?auto_285809 ?auto_285808 ) ( ON ?auto_285810 ?auto_285809 ) ( ON ?auto_285811 ?auto_285810 ) ( ON ?auto_285812 ?auto_285811 ) ( ON ?auto_285813 ?auto_285812 ) ( ON ?auto_285814 ?auto_285813 ) ( ON ?auto_285815 ?auto_285814 ) ( not ( = ?auto_285808 ?auto_285809 ) ) ( not ( = ?auto_285808 ?auto_285810 ) ) ( not ( = ?auto_285808 ?auto_285811 ) ) ( not ( = ?auto_285808 ?auto_285812 ) ) ( not ( = ?auto_285808 ?auto_285813 ) ) ( not ( = ?auto_285808 ?auto_285814 ) ) ( not ( = ?auto_285808 ?auto_285815 ) ) ( not ( = ?auto_285808 ?auto_285816 ) ) ( not ( = ?auto_285808 ?auto_285817 ) ) ( not ( = ?auto_285808 ?auto_285818 ) ) ( not ( = ?auto_285808 ?auto_285819 ) ) ( not ( = ?auto_285808 ?auto_285820 ) ) ( not ( = ?auto_285809 ?auto_285810 ) ) ( not ( = ?auto_285809 ?auto_285811 ) ) ( not ( = ?auto_285809 ?auto_285812 ) ) ( not ( = ?auto_285809 ?auto_285813 ) ) ( not ( = ?auto_285809 ?auto_285814 ) ) ( not ( = ?auto_285809 ?auto_285815 ) ) ( not ( = ?auto_285809 ?auto_285816 ) ) ( not ( = ?auto_285809 ?auto_285817 ) ) ( not ( = ?auto_285809 ?auto_285818 ) ) ( not ( = ?auto_285809 ?auto_285819 ) ) ( not ( = ?auto_285809 ?auto_285820 ) ) ( not ( = ?auto_285810 ?auto_285811 ) ) ( not ( = ?auto_285810 ?auto_285812 ) ) ( not ( = ?auto_285810 ?auto_285813 ) ) ( not ( = ?auto_285810 ?auto_285814 ) ) ( not ( = ?auto_285810 ?auto_285815 ) ) ( not ( = ?auto_285810 ?auto_285816 ) ) ( not ( = ?auto_285810 ?auto_285817 ) ) ( not ( = ?auto_285810 ?auto_285818 ) ) ( not ( = ?auto_285810 ?auto_285819 ) ) ( not ( = ?auto_285810 ?auto_285820 ) ) ( not ( = ?auto_285811 ?auto_285812 ) ) ( not ( = ?auto_285811 ?auto_285813 ) ) ( not ( = ?auto_285811 ?auto_285814 ) ) ( not ( = ?auto_285811 ?auto_285815 ) ) ( not ( = ?auto_285811 ?auto_285816 ) ) ( not ( = ?auto_285811 ?auto_285817 ) ) ( not ( = ?auto_285811 ?auto_285818 ) ) ( not ( = ?auto_285811 ?auto_285819 ) ) ( not ( = ?auto_285811 ?auto_285820 ) ) ( not ( = ?auto_285812 ?auto_285813 ) ) ( not ( = ?auto_285812 ?auto_285814 ) ) ( not ( = ?auto_285812 ?auto_285815 ) ) ( not ( = ?auto_285812 ?auto_285816 ) ) ( not ( = ?auto_285812 ?auto_285817 ) ) ( not ( = ?auto_285812 ?auto_285818 ) ) ( not ( = ?auto_285812 ?auto_285819 ) ) ( not ( = ?auto_285812 ?auto_285820 ) ) ( not ( = ?auto_285813 ?auto_285814 ) ) ( not ( = ?auto_285813 ?auto_285815 ) ) ( not ( = ?auto_285813 ?auto_285816 ) ) ( not ( = ?auto_285813 ?auto_285817 ) ) ( not ( = ?auto_285813 ?auto_285818 ) ) ( not ( = ?auto_285813 ?auto_285819 ) ) ( not ( = ?auto_285813 ?auto_285820 ) ) ( not ( = ?auto_285814 ?auto_285815 ) ) ( not ( = ?auto_285814 ?auto_285816 ) ) ( not ( = ?auto_285814 ?auto_285817 ) ) ( not ( = ?auto_285814 ?auto_285818 ) ) ( not ( = ?auto_285814 ?auto_285819 ) ) ( not ( = ?auto_285814 ?auto_285820 ) ) ( not ( = ?auto_285815 ?auto_285816 ) ) ( not ( = ?auto_285815 ?auto_285817 ) ) ( not ( = ?auto_285815 ?auto_285818 ) ) ( not ( = ?auto_285815 ?auto_285819 ) ) ( not ( = ?auto_285815 ?auto_285820 ) ) ( not ( = ?auto_285816 ?auto_285817 ) ) ( not ( = ?auto_285816 ?auto_285818 ) ) ( not ( = ?auto_285816 ?auto_285819 ) ) ( not ( = ?auto_285816 ?auto_285820 ) ) ( not ( = ?auto_285817 ?auto_285818 ) ) ( not ( = ?auto_285817 ?auto_285819 ) ) ( not ( = ?auto_285817 ?auto_285820 ) ) ( not ( = ?auto_285818 ?auto_285819 ) ) ( not ( = ?auto_285818 ?auto_285820 ) ) ( not ( = ?auto_285819 ?auto_285820 ) ) ( ON ?auto_285818 ?auto_285819 ) ( ON ?auto_285817 ?auto_285818 ) ( CLEAR ?auto_285815 ) ( ON ?auto_285816 ?auto_285817 ) ( CLEAR ?auto_285816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_285808 ?auto_285809 ?auto_285810 ?auto_285811 ?auto_285812 ?auto_285813 ?auto_285814 ?auto_285815 ?auto_285816 )
      ( MAKE-12PILE ?auto_285808 ?auto_285809 ?auto_285810 ?auto_285811 ?auto_285812 ?auto_285813 ?auto_285814 ?auto_285815 ?auto_285816 ?auto_285817 ?auto_285818 ?auto_285819 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_285858 - BLOCK
      ?auto_285859 - BLOCK
      ?auto_285860 - BLOCK
      ?auto_285861 - BLOCK
      ?auto_285862 - BLOCK
      ?auto_285863 - BLOCK
      ?auto_285864 - BLOCK
      ?auto_285865 - BLOCK
      ?auto_285866 - BLOCK
      ?auto_285867 - BLOCK
      ?auto_285868 - BLOCK
      ?auto_285869 - BLOCK
    )
    :vars
    (
      ?auto_285870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_285869 ?auto_285870 ) ( ON-TABLE ?auto_285858 ) ( ON ?auto_285859 ?auto_285858 ) ( ON ?auto_285860 ?auto_285859 ) ( ON ?auto_285861 ?auto_285860 ) ( ON ?auto_285862 ?auto_285861 ) ( ON ?auto_285863 ?auto_285862 ) ( ON ?auto_285864 ?auto_285863 ) ( not ( = ?auto_285858 ?auto_285859 ) ) ( not ( = ?auto_285858 ?auto_285860 ) ) ( not ( = ?auto_285858 ?auto_285861 ) ) ( not ( = ?auto_285858 ?auto_285862 ) ) ( not ( = ?auto_285858 ?auto_285863 ) ) ( not ( = ?auto_285858 ?auto_285864 ) ) ( not ( = ?auto_285858 ?auto_285865 ) ) ( not ( = ?auto_285858 ?auto_285866 ) ) ( not ( = ?auto_285858 ?auto_285867 ) ) ( not ( = ?auto_285858 ?auto_285868 ) ) ( not ( = ?auto_285858 ?auto_285869 ) ) ( not ( = ?auto_285858 ?auto_285870 ) ) ( not ( = ?auto_285859 ?auto_285860 ) ) ( not ( = ?auto_285859 ?auto_285861 ) ) ( not ( = ?auto_285859 ?auto_285862 ) ) ( not ( = ?auto_285859 ?auto_285863 ) ) ( not ( = ?auto_285859 ?auto_285864 ) ) ( not ( = ?auto_285859 ?auto_285865 ) ) ( not ( = ?auto_285859 ?auto_285866 ) ) ( not ( = ?auto_285859 ?auto_285867 ) ) ( not ( = ?auto_285859 ?auto_285868 ) ) ( not ( = ?auto_285859 ?auto_285869 ) ) ( not ( = ?auto_285859 ?auto_285870 ) ) ( not ( = ?auto_285860 ?auto_285861 ) ) ( not ( = ?auto_285860 ?auto_285862 ) ) ( not ( = ?auto_285860 ?auto_285863 ) ) ( not ( = ?auto_285860 ?auto_285864 ) ) ( not ( = ?auto_285860 ?auto_285865 ) ) ( not ( = ?auto_285860 ?auto_285866 ) ) ( not ( = ?auto_285860 ?auto_285867 ) ) ( not ( = ?auto_285860 ?auto_285868 ) ) ( not ( = ?auto_285860 ?auto_285869 ) ) ( not ( = ?auto_285860 ?auto_285870 ) ) ( not ( = ?auto_285861 ?auto_285862 ) ) ( not ( = ?auto_285861 ?auto_285863 ) ) ( not ( = ?auto_285861 ?auto_285864 ) ) ( not ( = ?auto_285861 ?auto_285865 ) ) ( not ( = ?auto_285861 ?auto_285866 ) ) ( not ( = ?auto_285861 ?auto_285867 ) ) ( not ( = ?auto_285861 ?auto_285868 ) ) ( not ( = ?auto_285861 ?auto_285869 ) ) ( not ( = ?auto_285861 ?auto_285870 ) ) ( not ( = ?auto_285862 ?auto_285863 ) ) ( not ( = ?auto_285862 ?auto_285864 ) ) ( not ( = ?auto_285862 ?auto_285865 ) ) ( not ( = ?auto_285862 ?auto_285866 ) ) ( not ( = ?auto_285862 ?auto_285867 ) ) ( not ( = ?auto_285862 ?auto_285868 ) ) ( not ( = ?auto_285862 ?auto_285869 ) ) ( not ( = ?auto_285862 ?auto_285870 ) ) ( not ( = ?auto_285863 ?auto_285864 ) ) ( not ( = ?auto_285863 ?auto_285865 ) ) ( not ( = ?auto_285863 ?auto_285866 ) ) ( not ( = ?auto_285863 ?auto_285867 ) ) ( not ( = ?auto_285863 ?auto_285868 ) ) ( not ( = ?auto_285863 ?auto_285869 ) ) ( not ( = ?auto_285863 ?auto_285870 ) ) ( not ( = ?auto_285864 ?auto_285865 ) ) ( not ( = ?auto_285864 ?auto_285866 ) ) ( not ( = ?auto_285864 ?auto_285867 ) ) ( not ( = ?auto_285864 ?auto_285868 ) ) ( not ( = ?auto_285864 ?auto_285869 ) ) ( not ( = ?auto_285864 ?auto_285870 ) ) ( not ( = ?auto_285865 ?auto_285866 ) ) ( not ( = ?auto_285865 ?auto_285867 ) ) ( not ( = ?auto_285865 ?auto_285868 ) ) ( not ( = ?auto_285865 ?auto_285869 ) ) ( not ( = ?auto_285865 ?auto_285870 ) ) ( not ( = ?auto_285866 ?auto_285867 ) ) ( not ( = ?auto_285866 ?auto_285868 ) ) ( not ( = ?auto_285866 ?auto_285869 ) ) ( not ( = ?auto_285866 ?auto_285870 ) ) ( not ( = ?auto_285867 ?auto_285868 ) ) ( not ( = ?auto_285867 ?auto_285869 ) ) ( not ( = ?auto_285867 ?auto_285870 ) ) ( not ( = ?auto_285868 ?auto_285869 ) ) ( not ( = ?auto_285868 ?auto_285870 ) ) ( not ( = ?auto_285869 ?auto_285870 ) ) ( ON ?auto_285868 ?auto_285869 ) ( ON ?auto_285867 ?auto_285868 ) ( ON ?auto_285866 ?auto_285867 ) ( CLEAR ?auto_285864 ) ( ON ?auto_285865 ?auto_285866 ) ( CLEAR ?auto_285865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_285858 ?auto_285859 ?auto_285860 ?auto_285861 ?auto_285862 ?auto_285863 ?auto_285864 ?auto_285865 )
      ( MAKE-12PILE ?auto_285858 ?auto_285859 ?auto_285860 ?auto_285861 ?auto_285862 ?auto_285863 ?auto_285864 ?auto_285865 ?auto_285866 ?auto_285867 ?auto_285868 ?auto_285869 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_285908 - BLOCK
      ?auto_285909 - BLOCK
      ?auto_285910 - BLOCK
      ?auto_285911 - BLOCK
      ?auto_285912 - BLOCK
      ?auto_285913 - BLOCK
      ?auto_285914 - BLOCK
      ?auto_285915 - BLOCK
      ?auto_285916 - BLOCK
      ?auto_285917 - BLOCK
      ?auto_285918 - BLOCK
      ?auto_285919 - BLOCK
    )
    :vars
    (
      ?auto_285920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_285919 ?auto_285920 ) ( ON-TABLE ?auto_285908 ) ( ON ?auto_285909 ?auto_285908 ) ( ON ?auto_285910 ?auto_285909 ) ( ON ?auto_285911 ?auto_285910 ) ( ON ?auto_285912 ?auto_285911 ) ( ON ?auto_285913 ?auto_285912 ) ( not ( = ?auto_285908 ?auto_285909 ) ) ( not ( = ?auto_285908 ?auto_285910 ) ) ( not ( = ?auto_285908 ?auto_285911 ) ) ( not ( = ?auto_285908 ?auto_285912 ) ) ( not ( = ?auto_285908 ?auto_285913 ) ) ( not ( = ?auto_285908 ?auto_285914 ) ) ( not ( = ?auto_285908 ?auto_285915 ) ) ( not ( = ?auto_285908 ?auto_285916 ) ) ( not ( = ?auto_285908 ?auto_285917 ) ) ( not ( = ?auto_285908 ?auto_285918 ) ) ( not ( = ?auto_285908 ?auto_285919 ) ) ( not ( = ?auto_285908 ?auto_285920 ) ) ( not ( = ?auto_285909 ?auto_285910 ) ) ( not ( = ?auto_285909 ?auto_285911 ) ) ( not ( = ?auto_285909 ?auto_285912 ) ) ( not ( = ?auto_285909 ?auto_285913 ) ) ( not ( = ?auto_285909 ?auto_285914 ) ) ( not ( = ?auto_285909 ?auto_285915 ) ) ( not ( = ?auto_285909 ?auto_285916 ) ) ( not ( = ?auto_285909 ?auto_285917 ) ) ( not ( = ?auto_285909 ?auto_285918 ) ) ( not ( = ?auto_285909 ?auto_285919 ) ) ( not ( = ?auto_285909 ?auto_285920 ) ) ( not ( = ?auto_285910 ?auto_285911 ) ) ( not ( = ?auto_285910 ?auto_285912 ) ) ( not ( = ?auto_285910 ?auto_285913 ) ) ( not ( = ?auto_285910 ?auto_285914 ) ) ( not ( = ?auto_285910 ?auto_285915 ) ) ( not ( = ?auto_285910 ?auto_285916 ) ) ( not ( = ?auto_285910 ?auto_285917 ) ) ( not ( = ?auto_285910 ?auto_285918 ) ) ( not ( = ?auto_285910 ?auto_285919 ) ) ( not ( = ?auto_285910 ?auto_285920 ) ) ( not ( = ?auto_285911 ?auto_285912 ) ) ( not ( = ?auto_285911 ?auto_285913 ) ) ( not ( = ?auto_285911 ?auto_285914 ) ) ( not ( = ?auto_285911 ?auto_285915 ) ) ( not ( = ?auto_285911 ?auto_285916 ) ) ( not ( = ?auto_285911 ?auto_285917 ) ) ( not ( = ?auto_285911 ?auto_285918 ) ) ( not ( = ?auto_285911 ?auto_285919 ) ) ( not ( = ?auto_285911 ?auto_285920 ) ) ( not ( = ?auto_285912 ?auto_285913 ) ) ( not ( = ?auto_285912 ?auto_285914 ) ) ( not ( = ?auto_285912 ?auto_285915 ) ) ( not ( = ?auto_285912 ?auto_285916 ) ) ( not ( = ?auto_285912 ?auto_285917 ) ) ( not ( = ?auto_285912 ?auto_285918 ) ) ( not ( = ?auto_285912 ?auto_285919 ) ) ( not ( = ?auto_285912 ?auto_285920 ) ) ( not ( = ?auto_285913 ?auto_285914 ) ) ( not ( = ?auto_285913 ?auto_285915 ) ) ( not ( = ?auto_285913 ?auto_285916 ) ) ( not ( = ?auto_285913 ?auto_285917 ) ) ( not ( = ?auto_285913 ?auto_285918 ) ) ( not ( = ?auto_285913 ?auto_285919 ) ) ( not ( = ?auto_285913 ?auto_285920 ) ) ( not ( = ?auto_285914 ?auto_285915 ) ) ( not ( = ?auto_285914 ?auto_285916 ) ) ( not ( = ?auto_285914 ?auto_285917 ) ) ( not ( = ?auto_285914 ?auto_285918 ) ) ( not ( = ?auto_285914 ?auto_285919 ) ) ( not ( = ?auto_285914 ?auto_285920 ) ) ( not ( = ?auto_285915 ?auto_285916 ) ) ( not ( = ?auto_285915 ?auto_285917 ) ) ( not ( = ?auto_285915 ?auto_285918 ) ) ( not ( = ?auto_285915 ?auto_285919 ) ) ( not ( = ?auto_285915 ?auto_285920 ) ) ( not ( = ?auto_285916 ?auto_285917 ) ) ( not ( = ?auto_285916 ?auto_285918 ) ) ( not ( = ?auto_285916 ?auto_285919 ) ) ( not ( = ?auto_285916 ?auto_285920 ) ) ( not ( = ?auto_285917 ?auto_285918 ) ) ( not ( = ?auto_285917 ?auto_285919 ) ) ( not ( = ?auto_285917 ?auto_285920 ) ) ( not ( = ?auto_285918 ?auto_285919 ) ) ( not ( = ?auto_285918 ?auto_285920 ) ) ( not ( = ?auto_285919 ?auto_285920 ) ) ( ON ?auto_285918 ?auto_285919 ) ( ON ?auto_285917 ?auto_285918 ) ( ON ?auto_285916 ?auto_285917 ) ( ON ?auto_285915 ?auto_285916 ) ( CLEAR ?auto_285913 ) ( ON ?auto_285914 ?auto_285915 ) ( CLEAR ?auto_285914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_285908 ?auto_285909 ?auto_285910 ?auto_285911 ?auto_285912 ?auto_285913 ?auto_285914 )
      ( MAKE-12PILE ?auto_285908 ?auto_285909 ?auto_285910 ?auto_285911 ?auto_285912 ?auto_285913 ?auto_285914 ?auto_285915 ?auto_285916 ?auto_285917 ?auto_285918 ?auto_285919 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_285958 - BLOCK
      ?auto_285959 - BLOCK
      ?auto_285960 - BLOCK
      ?auto_285961 - BLOCK
      ?auto_285962 - BLOCK
      ?auto_285963 - BLOCK
      ?auto_285964 - BLOCK
      ?auto_285965 - BLOCK
      ?auto_285966 - BLOCK
      ?auto_285967 - BLOCK
      ?auto_285968 - BLOCK
      ?auto_285969 - BLOCK
    )
    :vars
    (
      ?auto_285970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_285969 ?auto_285970 ) ( ON-TABLE ?auto_285958 ) ( ON ?auto_285959 ?auto_285958 ) ( ON ?auto_285960 ?auto_285959 ) ( ON ?auto_285961 ?auto_285960 ) ( ON ?auto_285962 ?auto_285961 ) ( not ( = ?auto_285958 ?auto_285959 ) ) ( not ( = ?auto_285958 ?auto_285960 ) ) ( not ( = ?auto_285958 ?auto_285961 ) ) ( not ( = ?auto_285958 ?auto_285962 ) ) ( not ( = ?auto_285958 ?auto_285963 ) ) ( not ( = ?auto_285958 ?auto_285964 ) ) ( not ( = ?auto_285958 ?auto_285965 ) ) ( not ( = ?auto_285958 ?auto_285966 ) ) ( not ( = ?auto_285958 ?auto_285967 ) ) ( not ( = ?auto_285958 ?auto_285968 ) ) ( not ( = ?auto_285958 ?auto_285969 ) ) ( not ( = ?auto_285958 ?auto_285970 ) ) ( not ( = ?auto_285959 ?auto_285960 ) ) ( not ( = ?auto_285959 ?auto_285961 ) ) ( not ( = ?auto_285959 ?auto_285962 ) ) ( not ( = ?auto_285959 ?auto_285963 ) ) ( not ( = ?auto_285959 ?auto_285964 ) ) ( not ( = ?auto_285959 ?auto_285965 ) ) ( not ( = ?auto_285959 ?auto_285966 ) ) ( not ( = ?auto_285959 ?auto_285967 ) ) ( not ( = ?auto_285959 ?auto_285968 ) ) ( not ( = ?auto_285959 ?auto_285969 ) ) ( not ( = ?auto_285959 ?auto_285970 ) ) ( not ( = ?auto_285960 ?auto_285961 ) ) ( not ( = ?auto_285960 ?auto_285962 ) ) ( not ( = ?auto_285960 ?auto_285963 ) ) ( not ( = ?auto_285960 ?auto_285964 ) ) ( not ( = ?auto_285960 ?auto_285965 ) ) ( not ( = ?auto_285960 ?auto_285966 ) ) ( not ( = ?auto_285960 ?auto_285967 ) ) ( not ( = ?auto_285960 ?auto_285968 ) ) ( not ( = ?auto_285960 ?auto_285969 ) ) ( not ( = ?auto_285960 ?auto_285970 ) ) ( not ( = ?auto_285961 ?auto_285962 ) ) ( not ( = ?auto_285961 ?auto_285963 ) ) ( not ( = ?auto_285961 ?auto_285964 ) ) ( not ( = ?auto_285961 ?auto_285965 ) ) ( not ( = ?auto_285961 ?auto_285966 ) ) ( not ( = ?auto_285961 ?auto_285967 ) ) ( not ( = ?auto_285961 ?auto_285968 ) ) ( not ( = ?auto_285961 ?auto_285969 ) ) ( not ( = ?auto_285961 ?auto_285970 ) ) ( not ( = ?auto_285962 ?auto_285963 ) ) ( not ( = ?auto_285962 ?auto_285964 ) ) ( not ( = ?auto_285962 ?auto_285965 ) ) ( not ( = ?auto_285962 ?auto_285966 ) ) ( not ( = ?auto_285962 ?auto_285967 ) ) ( not ( = ?auto_285962 ?auto_285968 ) ) ( not ( = ?auto_285962 ?auto_285969 ) ) ( not ( = ?auto_285962 ?auto_285970 ) ) ( not ( = ?auto_285963 ?auto_285964 ) ) ( not ( = ?auto_285963 ?auto_285965 ) ) ( not ( = ?auto_285963 ?auto_285966 ) ) ( not ( = ?auto_285963 ?auto_285967 ) ) ( not ( = ?auto_285963 ?auto_285968 ) ) ( not ( = ?auto_285963 ?auto_285969 ) ) ( not ( = ?auto_285963 ?auto_285970 ) ) ( not ( = ?auto_285964 ?auto_285965 ) ) ( not ( = ?auto_285964 ?auto_285966 ) ) ( not ( = ?auto_285964 ?auto_285967 ) ) ( not ( = ?auto_285964 ?auto_285968 ) ) ( not ( = ?auto_285964 ?auto_285969 ) ) ( not ( = ?auto_285964 ?auto_285970 ) ) ( not ( = ?auto_285965 ?auto_285966 ) ) ( not ( = ?auto_285965 ?auto_285967 ) ) ( not ( = ?auto_285965 ?auto_285968 ) ) ( not ( = ?auto_285965 ?auto_285969 ) ) ( not ( = ?auto_285965 ?auto_285970 ) ) ( not ( = ?auto_285966 ?auto_285967 ) ) ( not ( = ?auto_285966 ?auto_285968 ) ) ( not ( = ?auto_285966 ?auto_285969 ) ) ( not ( = ?auto_285966 ?auto_285970 ) ) ( not ( = ?auto_285967 ?auto_285968 ) ) ( not ( = ?auto_285967 ?auto_285969 ) ) ( not ( = ?auto_285967 ?auto_285970 ) ) ( not ( = ?auto_285968 ?auto_285969 ) ) ( not ( = ?auto_285968 ?auto_285970 ) ) ( not ( = ?auto_285969 ?auto_285970 ) ) ( ON ?auto_285968 ?auto_285969 ) ( ON ?auto_285967 ?auto_285968 ) ( ON ?auto_285966 ?auto_285967 ) ( ON ?auto_285965 ?auto_285966 ) ( ON ?auto_285964 ?auto_285965 ) ( CLEAR ?auto_285962 ) ( ON ?auto_285963 ?auto_285964 ) ( CLEAR ?auto_285963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_285958 ?auto_285959 ?auto_285960 ?auto_285961 ?auto_285962 ?auto_285963 )
      ( MAKE-12PILE ?auto_285958 ?auto_285959 ?auto_285960 ?auto_285961 ?auto_285962 ?auto_285963 ?auto_285964 ?auto_285965 ?auto_285966 ?auto_285967 ?auto_285968 ?auto_285969 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_286008 - BLOCK
      ?auto_286009 - BLOCK
      ?auto_286010 - BLOCK
      ?auto_286011 - BLOCK
      ?auto_286012 - BLOCK
      ?auto_286013 - BLOCK
      ?auto_286014 - BLOCK
      ?auto_286015 - BLOCK
      ?auto_286016 - BLOCK
      ?auto_286017 - BLOCK
      ?auto_286018 - BLOCK
      ?auto_286019 - BLOCK
    )
    :vars
    (
      ?auto_286020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_286019 ?auto_286020 ) ( ON-TABLE ?auto_286008 ) ( ON ?auto_286009 ?auto_286008 ) ( ON ?auto_286010 ?auto_286009 ) ( ON ?auto_286011 ?auto_286010 ) ( not ( = ?auto_286008 ?auto_286009 ) ) ( not ( = ?auto_286008 ?auto_286010 ) ) ( not ( = ?auto_286008 ?auto_286011 ) ) ( not ( = ?auto_286008 ?auto_286012 ) ) ( not ( = ?auto_286008 ?auto_286013 ) ) ( not ( = ?auto_286008 ?auto_286014 ) ) ( not ( = ?auto_286008 ?auto_286015 ) ) ( not ( = ?auto_286008 ?auto_286016 ) ) ( not ( = ?auto_286008 ?auto_286017 ) ) ( not ( = ?auto_286008 ?auto_286018 ) ) ( not ( = ?auto_286008 ?auto_286019 ) ) ( not ( = ?auto_286008 ?auto_286020 ) ) ( not ( = ?auto_286009 ?auto_286010 ) ) ( not ( = ?auto_286009 ?auto_286011 ) ) ( not ( = ?auto_286009 ?auto_286012 ) ) ( not ( = ?auto_286009 ?auto_286013 ) ) ( not ( = ?auto_286009 ?auto_286014 ) ) ( not ( = ?auto_286009 ?auto_286015 ) ) ( not ( = ?auto_286009 ?auto_286016 ) ) ( not ( = ?auto_286009 ?auto_286017 ) ) ( not ( = ?auto_286009 ?auto_286018 ) ) ( not ( = ?auto_286009 ?auto_286019 ) ) ( not ( = ?auto_286009 ?auto_286020 ) ) ( not ( = ?auto_286010 ?auto_286011 ) ) ( not ( = ?auto_286010 ?auto_286012 ) ) ( not ( = ?auto_286010 ?auto_286013 ) ) ( not ( = ?auto_286010 ?auto_286014 ) ) ( not ( = ?auto_286010 ?auto_286015 ) ) ( not ( = ?auto_286010 ?auto_286016 ) ) ( not ( = ?auto_286010 ?auto_286017 ) ) ( not ( = ?auto_286010 ?auto_286018 ) ) ( not ( = ?auto_286010 ?auto_286019 ) ) ( not ( = ?auto_286010 ?auto_286020 ) ) ( not ( = ?auto_286011 ?auto_286012 ) ) ( not ( = ?auto_286011 ?auto_286013 ) ) ( not ( = ?auto_286011 ?auto_286014 ) ) ( not ( = ?auto_286011 ?auto_286015 ) ) ( not ( = ?auto_286011 ?auto_286016 ) ) ( not ( = ?auto_286011 ?auto_286017 ) ) ( not ( = ?auto_286011 ?auto_286018 ) ) ( not ( = ?auto_286011 ?auto_286019 ) ) ( not ( = ?auto_286011 ?auto_286020 ) ) ( not ( = ?auto_286012 ?auto_286013 ) ) ( not ( = ?auto_286012 ?auto_286014 ) ) ( not ( = ?auto_286012 ?auto_286015 ) ) ( not ( = ?auto_286012 ?auto_286016 ) ) ( not ( = ?auto_286012 ?auto_286017 ) ) ( not ( = ?auto_286012 ?auto_286018 ) ) ( not ( = ?auto_286012 ?auto_286019 ) ) ( not ( = ?auto_286012 ?auto_286020 ) ) ( not ( = ?auto_286013 ?auto_286014 ) ) ( not ( = ?auto_286013 ?auto_286015 ) ) ( not ( = ?auto_286013 ?auto_286016 ) ) ( not ( = ?auto_286013 ?auto_286017 ) ) ( not ( = ?auto_286013 ?auto_286018 ) ) ( not ( = ?auto_286013 ?auto_286019 ) ) ( not ( = ?auto_286013 ?auto_286020 ) ) ( not ( = ?auto_286014 ?auto_286015 ) ) ( not ( = ?auto_286014 ?auto_286016 ) ) ( not ( = ?auto_286014 ?auto_286017 ) ) ( not ( = ?auto_286014 ?auto_286018 ) ) ( not ( = ?auto_286014 ?auto_286019 ) ) ( not ( = ?auto_286014 ?auto_286020 ) ) ( not ( = ?auto_286015 ?auto_286016 ) ) ( not ( = ?auto_286015 ?auto_286017 ) ) ( not ( = ?auto_286015 ?auto_286018 ) ) ( not ( = ?auto_286015 ?auto_286019 ) ) ( not ( = ?auto_286015 ?auto_286020 ) ) ( not ( = ?auto_286016 ?auto_286017 ) ) ( not ( = ?auto_286016 ?auto_286018 ) ) ( not ( = ?auto_286016 ?auto_286019 ) ) ( not ( = ?auto_286016 ?auto_286020 ) ) ( not ( = ?auto_286017 ?auto_286018 ) ) ( not ( = ?auto_286017 ?auto_286019 ) ) ( not ( = ?auto_286017 ?auto_286020 ) ) ( not ( = ?auto_286018 ?auto_286019 ) ) ( not ( = ?auto_286018 ?auto_286020 ) ) ( not ( = ?auto_286019 ?auto_286020 ) ) ( ON ?auto_286018 ?auto_286019 ) ( ON ?auto_286017 ?auto_286018 ) ( ON ?auto_286016 ?auto_286017 ) ( ON ?auto_286015 ?auto_286016 ) ( ON ?auto_286014 ?auto_286015 ) ( ON ?auto_286013 ?auto_286014 ) ( CLEAR ?auto_286011 ) ( ON ?auto_286012 ?auto_286013 ) ( CLEAR ?auto_286012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_286008 ?auto_286009 ?auto_286010 ?auto_286011 ?auto_286012 )
      ( MAKE-12PILE ?auto_286008 ?auto_286009 ?auto_286010 ?auto_286011 ?auto_286012 ?auto_286013 ?auto_286014 ?auto_286015 ?auto_286016 ?auto_286017 ?auto_286018 ?auto_286019 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_286058 - BLOCK
      ?auto_286059 - BLOCK
      ?auto_286060 - BLOCK
      ?auto_286061 - BLOCK
      ?auto_286062 - BLOCK
      ?auto_286063 - BLOCK
      ?auto_286064 - BLOCK
      ?auto_286065 - BLOCK
      ?auto_286066 - BLOCK
      ?auto_286067 - BLOCK
      ?auto_286068 - BLOCK
      ?auto_286069 - BLOCK
    )
    :vars
    (
      ?auto_286070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_286069 ?auto_286070 ) ( ON-TABLE ?auto_286058 ) ( ON ?auto_286059 ?auto_286058 ) ( ON ?auto_286060 ?auto_286059 ) ( not ( = ?auto_286058 ?auto_286059 ) ) ( not ( = ?auto_286058 ?auto_286060 ) ) ( not ( = ?auto_286058 ?auto_286061 ) ) ( not ( = ?auto_286058 ?auto_286062 ) ) ( not ( = ?auto_286058 ?auto_286063 ) ) ( not ( = ?auto_286058 ?auto_286064 ) ) ( not ( = ?auto_286058 ?auto_286065 ) ) ( not ( = ?auto_286058 ?auto_286066 ) ) ( not ( = ?auto_286058 ?auto_286067 ) ) ( not ( = ?auto_286058 ?auto_286068 ) ) ( not ( = ?auto_286058 ?auto_286069 ) ) ( not ( = ?auto_286058 ?auto_286070 ) ) ( not ( = ?auto_286059 ?auto_286060 ) ) ( not ( = ?auto_286059 ?auto_286061 ) ) ( not ( = ?auto_286059 ?auto_286062 ) ) ( not ( = ?auto_286059 ?auto_286063 ) ) ( not ( = ?auto_286059 ?auto_286064 ) ) ( not ( = ?auto_286059 ?auto_286065 ) ) ( not ( = ?auto_286059 ?auto_286066 ) ) ( not ( = ?auto_286059 ?auto_286067 ) ) ( not ( = ?auto_286059 ?auto_286068 ) ) ( not ( = ?auto_286059 ?auto_286069 ) ) ( not ( = ?auto_286059 ?auto_286070 ) ) ( not ( = ?auto_286060 ?auto_286061 ) ) ( not ( = ?auto_286060 ?auto_286062 ) ) ( not ( = ?auto_286060 ?auto_286063 ) ) ( not ( = ?auto_286060 ?auto_286064 ) ) ( not ( = ?auto_286060 ?auto_286065 ) ) ( not ( = ?auto_286060 ?auto_286066 ) ) ( not ( = ?auto_286060 ?auto_286067 ) ) ( not ( = ?auto_286060 ?auto_286068 ) ) ( not ( = ?auto_286060 ?auto_286069 ) ) ( not ( = ?auto_286060 ?auto_286070 ) ) ( not ( = ?auto_286061 ?auto_286062 ) ) ( not ( = ?auto_286061 ?auto_286063 ) ) ( not ( = ?auto_286061 ?auto_286064 ) ) ( not ( = ?auto_286061 ?auto_286065 ) ) ( not ( = ?auto_286061 ?auto_286066 ) ) ( not ( = ?auto_286061 ?auto_286067 ) ) ( not ( = ?auto_286061 ?auto_286068 ) ) ( not ( = ?auto_286061 ?auto_286069 ) ) ( not ( = ?auto_286061 ?auto_286070 ) ) ( not ( = ?auto_286062 ?auto_286063 ) ) ( not ( = ?auto_286062 ?auto_286064 ) ) ( not ( = ?auto_286062 ?auto_286065 ) ) ( not ( = ?auto_286062 ?auto_286066 ) ) ( not ( = ?auto_286062 ?auto_286067 ) ) ( not ( = ?auto_286062 ?auto_286068 ) ) ( not ( = ?auto_286062 ?auto_286069 ) ) ( not ( = ?auto_286062 ?auto_286070 ) ) ( not ( = ?auto_286063 ?auto_286064 ) ) ( not ( = ?auto_286063 ?auto_286065 ) ) ( not ( = ?auto_286063 ?auto_286066 ) ) ( not ( = ?auto_286063 ?auto_286067 ) ) ( not ( = ?auto_286063 ?auto_286068 ) ) ( not ( = ?auto_286063 ?auto_286069 ) ) ( not ( = ?auto_286063 ?auto_286070 ) ) ( not ( = ?auto_286064 ?auto_286065 ) ) ( not ( = ?auto_286064 ?auto_286066 ) ) ( not ( = ?auto_286064 ?auto_286067 ) ) ( not ( = ?auto_286064 ?auto_286068 ) ) ( not ( = ?auto_286064 ?auto_286069 ) ) ( not ( = ?auto_286064 ?auto_286070 ) ) ( not ( = ?auto_286065 ?auto_286066 ) ) ( not ( = ?auto_286065 ?auto_286067 ) ) ( not ( = ?auto_286065 ?auto_286068 ) ) ( not ( = ?auto_286065 ?auto_286069 ) ) ( not ( = ?auto_286065 ?auto_286070 ) ) ( not ( = ?auto_286066 ?auto_286067 ) ) ( not ( = ?auto_286066 ?auto_286068 ) ) ( not ( = ?auto_286066 ?auto_286069 ) ) ( not ( = ?auto_286066 ?auto_286070 ) ) ( not ( = ?auto_286067 ?auto_286068 ) ) ( not ( = ?auto_286067 ?auto_286069 ) ) ( not ( = ?auto_286067 ?auto_286070 ) ) ( not ( = ?auto_286068 ?auto_286069 ) ) ( not ( = ?auto_286068 ?auto_286070 ) ) ( not ( = ?auto_286069 ?auto_286070 ) ) ( ON ?auto_286068 ?auto_286069 ) ( ON ?auto_286067 ?auto_286068 ) ( ON ?auto_286066 ?auto_286067 ) ( ON ?auto_286065 ?auto_286066 ) ( ON ?auto_286064 ?auto_286065 ) ( ON ?auto_286063 ?auto_286064 ) ( ON ?auto_286062 ?auto_286063 ) ( CLEAR ?auto_286060 ) ( ON ?auto_286061 ?auto_286062 ) ( CLEAR ?auto_286061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_286058 ?auto_286059 ?auto_286060 ?auto_286061 )
      ( MAKE-12PILE ?auto_286058 ?auto_286059 ?auto_286060 ?auto_286061 ?auto_286062 ?auto_286063 ?auto_286064 ?auto_286065 ?auto_286066 ?auto_286067 ?auto_286068 ?auto_286069 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_286108 - BLOCK
      ?auto_286109 - BLOCK
      ?auto_286110 - BLOCK
      ?auto_286111 - BLOCK
      ?auto_286112 - BLOCK
      ?auto_286113 - BLOCK
      ?auto_286114 - BLOCK
      ?auto_286115 - BLOCK
      ?auto_286116 - BLOCK
      ?auto_286117 - BLOCK
      ?auto_286118 - BLOCK
      ?auto_286119 - BLOCK
    )
    :vars
    (
      ?auto_286120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_286119 ?auto_286120 ) ( ON-TABLE ?auto_286108 ) ( ON ?auto_286109 ?auto_286108 ) ( not ( = ?auto_286108 ?auto_286109 ) ) ( not ( = ?auto_286108 ?auto_286110 ) ) ( not ( = ?auto_286108 ?auto_286111 ) ) ( not ( = ?auto_286108 ?auto_286112 ) ) ( not ( = ?auto_286108 ?auto_286113 ) ) ( not ( = ?auto_286108 ?auto_286114 ) ) ( not ( = ?auto_286108 ?auto_286115 ) ) ( not ( = ?auto_286108 ?auto_286116 ) ) ( not ( = ?auto_286108 ?auto_286117 ) ) ( not ( = ?auto_286108 ?auto_286118 ) ) ( not ( = ?auto_286108 ?auto_286119 ) ) ( not ( = ?auto_286108 ?auto_286120 ) ) ( not ( = ?auto_286109 ?auto_286110 ) ) ( not ( = ?auto_286109 ?auto_286111 ) ) ( not ( = ?auto_286109 ?auto_286112 ) ) ( not ( = ?auto_286109 ?auto_286113 ) ) ( not ( = ?auto_286109 ?auto_286114 ) ) ( not ( = ?auto_286109 ?auto_286115 ) ) ( not ( = ?auto_286109 ?auto_286116 ) ) ( not ( = ?auto_286109 ?auto_286117 ) ) ( not ( = ?auto_286109 ?auto_286118 ) ) ( not ( = ?auto_286109 ?auto_286119 ) ) ( not ( = ?auto_286109 ?auto_286120 ) ) ( not ( = ?auto_286110 ?auto_286111 ) ) ( not ( = ?auto_286110 ?auto_286112 ) ) ( not ( = ?auto_286110 ?auto_286113 ) ) ( not ( = ?auto_286110 ?auto_286114 ) ) ( not ( = ?auto_286110 ?auto_286115 ) ) ( not ( = ?auto_286110 ?auto_286116 ) ) ( not ( = ?auto_286110 ?auto_286117 ) ) ( not ( = ?auto_286110 ?auto_286118 ) ) ( not ( = ?auto_286110 ?auto_286119 ) ) ( not ( = ?auto_286110 ?auto_286120 ) ) ( not ( = ?auto_286111 ?auto_286112 ) ) ( not ( = ?auto_286111 ?auto_286113 ) ) ( not ( = ?auto_286111 ?auto_286114 ) ) ( not ( = ?auto_286111 ?auto_286115 ) ) ( not ( = ?auto_286111 ?auto_286116 ) ) ( not ( = ?auto_286111 ?auto_286117 ) ) ( not ( = ?auto_286111 ?auto_286118 ) ) ( not ( = ?auto_286111 ?auto_286119 ) ) ( not ( = ?auto_286111 ?auto_286120 ) ) ( not ( = ?auto_286112 ?auto_286113 ) ) ( not ( = ?auto_286112 ?auto_286114 ) ) ( not ( = ?auto_286112 ?auto_286115 ) ) ( not ( = ?auto_286112 ?auto_286116 ) ) ( not ( = ?auto_286112 ?auto_286117 ) ) ( not ( = ?auto_286112 ?auto_286118 ) ) ( not ( = ?auto_286112 ?auto_286119 ) ) ( not ( = ?auto_286112 ?auto_286120 ) ) ( not ( = ?auto_286113 ?auto_286114 ) ) ( not ( = ?auto_286113 ?auto_286115 ) ) ( not ( = ?auto_286113 ?auto_286116 ) ) ( not ( = ?auto_286113 ?auto_286117 ) ) ( not ( = ?auto_286113 ?auto_286118 ) ) ( not ( = ?auto_286113 ?auto_286119 ) ) ( not ( = ?auto_286113 ?auto_286120 ) ) ( not ( = ?auto_286114 ?auto_286115 ) ) ( not ( = ?auto_286114 ?auto_286116 ) ) ( not ( = ?auto_286114 ?auto_286117 ) ) ( not ( = ?auto_286114 ?auto_286118 ) ) ( not ( = ?auto_286114 ?auto_286119 ) ) ( not ( = ?auto_286114 ?auto_286120 ) ) ( not ( = ?auto_286115 ?auto_286116 ) ) ( not ( = ?auto_286115 ?auto_286117 ) ) ( not ( = ?auto_286115 ?auto_286118 ) ) ( not ( = ?auto_286115 ?auto_286119 ) ) ( not ( = ?auto_286115 ?auto_286120 ) ) ( not ( = ?auto_286116 ?auto_286117 ) ) ( not ( = ?auto_286116 ?auto_286118 ) ) ( not ( = ?auto_286116 ?auto_286119 ) ) ( not ( = ?auto_286116 ?auto_286120 ) ) ( not ( = ?auto_286117 ?auto_286118 ) ) ( not ( = ?auto_286117 ?auto_286119 ) ) ( not ( = ?auto_286117 ?auto_286120 ) ) ( not ( = ?auto_286118 ?auto_286119 ) ) ( not ( = ?auto_286118 ?auto_286120 ) ) ( not ( = ?auto_286119 ?auto_286120 ) ) ( ON ?auto_286118 ?auto_286119 ) ( ON ?auto_286117 ?auto_286118 ) ( ON ?auto_286116 ?auto_286117 ) ( ON ?auto_286115 ?auto_286116 ) ( ON ?auto_286114 ?auto_286115 ) ( ON ?auto_286113 ?auto_286114 ) ( ON ?auto_286112 ?auto_286113 ) ( ON ?auto_286111 ?auto_286112 ) ( CLEAR ?auto_286109 ) ( ON ?auto_286110 ?auto_286111 ) ( CLEAR ?auto_286110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_286108 ?auto_286109 ?auto_286110 )
      ( MAKE-12PILE ?auto_286108 ?auto_286109 ?auto_286110 ?auto_286111 ?auto_286112 ?auto_286113 ?auto_286114 ?auto_286115 ?auto_286116 ?auto_286117 ?auto_286118 ?auto_286119 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_286158 - BLOCK
      ?auto_286159 - BLOCK
      ?auto_286160 - BLOCK
      ?auto_286161 - BLOCK
      ?auto_286162 - BLOCK
      ?auto_286163 - BLOCK
      ?auto_286164 - BLOCK
      ?auto_286165 - BLOCK
      ?auto_286166 - BLOCK
      ?auto_286167 - BLOCK
      ?auto_286168 - BLOCK
      ?auto_286169 - BLOCK
    )
    :vars
    (
      ?auto_286170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_286169 ?auto_286170 ) ( ON-TABLE ?auto_286158 ) ( not ( = ?auto_286158 ?auto_286159 ) ) ( not ( = ?auto_286158 ?auto_286160 ) ) ( not ( = ?auto_286158 ?auto_286161 ) ) ( not ( = ?auto_286158 ?auto_286162 ) ) ( not ( = ?auto_286158 ?auto_286163 ) ) ( not ( = ?auto_286158 ?auto_286164 ) ) ( not ( = ?auto_286158 ?auto_286165 ) ) ( not ( = ?auto_286158 ?auto_286166 ) ) ( not ( = ?auto_286158 ?auto_286167 ) ) ( not ( = ?auto_286158 ?auto_286168 ) ) ( not ( = ?auto_286158 ?auto_286169 ) ) ( not ( = ?auto_286158 ?auto_286170 ) ) ( not ( = ?auto_286159 ?auto_286160 ) ) ( not ( = ?auto_286159 ?auto_286161 ) ) ( not ( = ?auto_286159 ?auto_286162 ) ) ( not ( = ?auto_286159 ?auto_286163 ) ) ( not ( = ?auto_286159 ?auto_286164 ) ) ( not ( = ?auto_286159 ?auto_286165 ) ) ( not ( = ?auto_286159 ?auto_286166 ) ) ( not ( = ?auto_286159 ?auto_286167 ) ) ( not ( = ?auto_286159 ?auto_286168 ) ) ( not ( = ?auto_286159 ?auto_286169 ) ) ( not ( = ?auto_286159 ?auto_286170 ) ) ( not ( = ?auto_286160 ?auto_286161 ) ) ( not ( = ?auto_286160 ?auto_286162 ) ) ( not ( = ?auto_286160 ?auto_286163 ) ) ( not ( = ?auto_286160 ?auto_286164 ) ) ( not ( = ?auto_286160 ?auto_286165 ) ) ( not ( = ?auto_286160 ?auto_286166 ) ) ( not ( = ?auto_286160 ?auto_286167 ) ) ( not ( = ?auto_286160 ?auto_286168 ) ) ( not ( = ?auto_286160 ?auto_286169 ) ) ( not ( = ?auto_286160 ?auto_286170 ) ) ( not ( = ?auto_286161 ?auto_286162 ) ) ( not ( = ?auto_286161 ?auto_286163 ) ) ( not ( = ?auto_286161 ?auto_286164 ) ) ( not ( = ?auto_286161 ?auto_286165 ) ) ( not ( = ?auto_286161 ?auto_286166 ) ) ( not ( = ?auto_286161 ?auto_286167 ) ) ( not ( = ?auto_286161 ?auto_286168 ) ) ( not ( = ?auto_286161 ?auto_286169 ) ) ( not ( = ?auto_286161 ?auto_286170 ) ) ( not ( = ?auto_286162 ?auto_286163 ) ) ( not ( = ?auto_286162 ?auto_286164 ) ) ( not ( = ?auto_286162 ?auto_286165 ) ) ( not ( = ?auto_286162 ?auto_286166 ) ) ( not ( = ?auto_286162 ?auto_286167 ) ) ( not ( = ?auto_286162 ?auto_286168 ) ) ( not ( = ?auto_286162 ?auto_286169 ) ) ( not ( = ?auto_286162 ?auto_286170 ) ) ( not ( = ?auto_286163 ?auto_286164 ) ) ( not ( = ?auto_286163 ?auto_286165 ) ) ( not ( = ?auto_286163 ?auto_286166 ) ) ( not ( = ?auto_286163 ?auto_286167 ) ) ( not ( = ?auto_286163 ?auto_286168 ) ) ( not ( = ?auto_286163 ?auto_286169 ) ) ( not ( = ?auto_286163 ?auto_286170 ) ) ( not ( = ?auto_286164 ?auto_286165 ) ) ( not ( = ?auto_286164 ?auto_286166 ) ) ( not ( = ?auto_286164 ?auto_286167 ) ) ( not ( = ?auto_286164 ?auto_286168 ) ) ( not ( = ?auto_286164 ?auto_286169 ) ) ( not ( = ?auto_286164 ?auto_286170 ) ) ( not ( = ?auto_286165 ?auto_286166 ) ) ( not ( = ?auto_286165 ?auto_286167 ) ) ( not ( = ?auto_286165 ?auto_286168 ) ) ( not ( = ?auto_286165 ?auto_286169 ) ) ( not ( = ?auto_286165 ?auto_286170 ) ) ( not ( = ?auto_286166 ?auto_286167 ) ) ( not ( = ?auto_286166 ?auto_286168 ) ) ( not ( = ?auto_286166 ?auto_286169 ) ) ( not ( = ?auto_286166 ?auto_286170 ) ) ( not ( = ?auto_286167 ?auto_286168 ) ) ( not ( = ?auto_286167 ?auto_286169 ) ) ( not ( = ?auto_286167 ?auto_286170 ) ) ( not ( = ?auto_286168 ?auto_286169 ) ) ( not ( = ?auto_286168 ?auto_286170 ) ) ( not ( = ?auto_286169 ?auto_286170 ) ) ( ON ?auto_286168 ?auto_286169 ) ( ON ?auto_286167 ?auto_286168 ) ( ON ?auto_286166 ?auto_286167 ) ( ON ?auto_286165 ?auto_286166 ) ( ON ?auto_286164 ?auto_286165 ) ( ON ?auto_286163 ?auto_286164 ) ( ON ?auto_286162 ?auto_286163 ) ( ON ?auto_286161 ?auto_286162 ) ( ON ?auto_286160 ?auto_286161 ) ( CLEAR ?auto_286158 ) ( ON ?auto_286159 ?auto_286160 ) ( CLEAR ?auto_286159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_286158 ?auto_286159 )
      ( MAKE-12PILE ?auto_286158 ?auto_286159 ?auto_286160 ?auto_286161 ?auto_286162 ?auto_286163 ?auto_286164 ?auto_286165 ?auto_286166 ?auto_286167 ?auto_286168 ?auto_286169 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_286208 - BLOCK
      ?auto_286209 - BLOCK
      ?auto_286210 - BLOCK
      ?auto_286211 - BLOCK
      ?auto_286212 - BLOCK
      ?auto_286213 - BLOCK
      ?auto_286214 - BLOCK
      ?auto_286215 - BLOCK
      ?auto_286216 - BLOCK
      ?auto_286217 - BLOCK
      ?auto_286218 - BLOCK
      ?auto_286219 - BLOCK
    )
    :vars
    (
      ?auto_286220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_286219 ?auto_286220 ) ( not ( = ?auto_286208 ?auto_286209 ) ) ( not ( = ?auto_286208 ?auto_286210 ) ) ( not ( = ?auto_286208 ?auto_286211 ) ) ( not ( = ?auto_286208 ?auto_286212 ) ) ( not ( = ?auto_286208 ?auto_286213 ) ) ( not ( = ?auto_286208 ?auto_286214 ) ) ( not ( = ?auto_286208 ?auto_286215 ) ) ( not ( = ?auto_286208 ?auto_286216 ) ) ( not ( = ?auto_286208 ?auto_286217 ) ) ( not ( = ?auto_286208 ?auto_286218 ) ) ( not ( = ?auto_286208 ?auto_286219 ) ) ( not ( = ?auto_286208 ?auto_286220 ) ) ( not ( = ?auto_286209 ?auto_286210 ) ) ( not ( = ?auto_286209 ?auto_286211 ) ) ( not ( = ?auto_286209 ?auto_286212 ) ) ( not ( = ?auto_286209 ?auto_286213 ) ) ( not ( = ?auto_286209 ?auto_286214 ) ) ( not ( = ?auto_286209 ?auto_286215 ) ) ( not ( = ?auto_286209 ?auto_286216 ) ) ( not ( = ?auto_286209 ?auto_286217 ) ) ( not ( = ?auto_286209 ?auto_286218 ) ) ( not ( = ?auto_286209 ?auto_286219 ) ) ( not ( = ?auto_286209 ?auto_286220 ) ) ( not ( = ?auto_286210 ?auto_286211 ) ) ( not ( = ?auto_286210 ?auto_286212 ) ) ( not ( = ?auto_286210 ?auto_286213 ) ) ( not ( = ?auto_286210 ?auto_286214 ) ) ( not ( = ?auto_286210 ?auto_286215 ) ) ( not ( = ?auto_286210 ?auto_286216 ) ) ( not ( = ?auto_286210 ?auto_286217 ) ) ( not ( = ?auto_286210 ?auto_286218 ) ) ( not ( = ?auto_286210 ?auto_286219 ) ) ( not ( = ?auto_286210 ?auto_286220 ) ) ( not ( = ?auto_286211 ?auto_286212 ) ) ( not ( = ?auto_286211 ?auto_286213 ) ) ( not ( = ?auto_286211 ?auto_286214 ) ) ( not ( = ?auto_286211 ?auto_286215 ) ) ( not ( = ?auto_286211 ?auto_286216 ) ) ( not ( = ?auto_286211 ?auto_286217 ) ) ( not ( = ?auto_286211 ?auto_286218 ) ) ( not ( = ?auto_286211 ?auto_286219 ) ) ( not ( = ?auto_286211 ?auto_286220 ) ) ( not ( = ?auto_286212 ?auto_286213 ) ) ( not ( = ?auto_286212 ?auto_286214 ) ) ( not ( = ?auto_286212 ?auto_286215 ) ) ( not ( = ?auto_286212 ?auto_286216 ) ) ( not ( = ?auto_286212 ?auto_286217 ) ) ( not ( = ?auto_286212 ?auto_286218 ) ) ( not ( = ?auto_286212 ?auto_286219 ) ) ( not ( = ?auto_286212 ?auto_286220 ) ) ( not ( = ?auto_286213 ?auto_286214 ) ) ( not ( = ?auto_286213 ?auto_286215 ) ) ( not ( = ?auto_286213 ?auto_286216 ) ) ( not ( = ?auto_286213 ?auto_286217 ) ) ( not ( = ?auto_286213 ?auto_286218 ) ) ( not ( = ?auto_286213 ?auto_286219 ) ) ( not ( = ?auto_286213 ?auto_286220 ) ) ( not ( = ?auto_286214 ?auto_286215 ) ) ( not ( = ?auto_286214 ?auto_286216 ) ) ( not ( = ?auto_286214 ?auto_286217 ) ) ( not ( = ?auto_286214 ?auto_286218 ) ) ( not ( = ?auto_286214 ?auto_286219 ) ) ( not ( = ?auto_286214 ?auto_286220 ) ) ( not ( = ?auto_286215 ?auto_286216 ) ) ( not ( = ?auto_286215 ?auto_286217 ) ) ( not ( = ?auto_286215 ?auto_286218 ) ) ( not ( = ?auto_286215 ?auto_286219 ) ) ( not ( = ?auto_286215 ?auto_286220 ) ) ( not ( = ?auto_286216 ?auto_286217 ) ) ( not ( = ?auto_286216 ?auto_286218 ) ) ( not ( = ?auto_286216 ?auto_286219 ) ) ( not ( = ?auto_286216 ?auto_286220 ) ) ( not ( = ?auto_286217 ?auto_286218 ) ) ( not ( = ?auto_286217 ?auto_286219 ) ) ( not ( = ?auto_286217 ?auto_286220 ) ) ( not ( = ?auto_286218 ?auto_286219 ) ) ( not ( = ?auto_286218 ?auto_286220 ) ) ( not ( = ?auto_286219 ?auto_286220 ) ) ( ON ?auto_286218 ?auto_286219 ) ( ON ?auto_286217 ?auto_286218 ) ( ON ?auto_286216 ?auto_286217 ) ( ON ?auto_286215 ?auto_286216 ) ( ON ?auto_286214 ?auto_286215 ) ( ON ?auto_286213 ?auto_286214 ) ( ON ?auto_286212 ?auto_286213 ) ( ON ?auto_286211 ?auto_286212 ) ( ON ?auto_286210 ?auto_286211 ) ( ON ?auto_286209 ?auto_286210 ) ( ON ?auto_286208 ?auto_286209 ) ( CLEAR ?auto_286208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_286208 )
      ( MAKE-12PILE ?auto_286208 ?auto_286209 ?auto_286210 ?auto_286211 ?auto_286212 ?auto_286213 ?auto_286214 ?auto_286215 ?auto_286216 ?auto_286217 ?auto_286218 ?auto_286219 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_286259 - BLOCK
      ?auto_286260 - BLOCK
      ?auto_286261 - BLOCK
      ?auto_286262 - BLOCK
      ?auto_286263 - BLOCK
      ?auto_286264 - BLOCK
      ?auto_286265 - BLOCK
      ?auto_286266 - BLOCK
      ?auto_286267 - BLOCK
      ?auto_286268 - BLOCK
      ?auto_286269 - BLOCK
      ?auto_286270 - BLOCK
      ?auto_286271 - BLOCK
    )
    :vars
    (
      ?auto_286272 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_286270 ) ( ON ?auto_286271 ?auto_286272 ) ( CLEAR ?auto_286271 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_286259 ) ( ON ?auto_286260 ?auto_286259 ) ( ON ?auto_286261 ?auto_286260 ) ( ON ?auto_286262 ?auto_286261 ) ( ON ?auto_286263 ?auto_286262 ) ( ON ?auto_286264 ?auto_286263 ) ( ON ?auto_286265 ?auto_286264 ) ( ON ?auto_286266 ?auto_286265 ) ( ON ?auto_286267 ?auto_286266 ) ( ON ?auto_286268 ?auto_286267 ) ( ON ?auto_286269 ?auto_286268 ) ( ON ?auto_286270 ?auto_286269 ) ( not ( = ?auto_286259 ?auto_286260 ) ) ( not ( = ?auto_286259 ?auto_286261 ) ) ( not ( = ?auto_286259 ?auto_286262 ) ) ( not ( = ?auto_286259 ?auto_286263 ) ) ( not ( = ?auto_286259 ?auto_286264 ) ) ( not ( = ?auto_286259 ?auto_286265 ) ) ( not ( = ?auto_286259 ?auto_286266 ) ) ( not ( = ?auto_286259 ?auto_286267 ) ) ( not ( = ?auto_286259 ?auto_286268 ) ) ( not ( = ?auto_286259 ?auto_286269 ) ) ( not ( = ?auto_286259 ?auto_286270 ) ) ( not ( = ?auto_286259 ?auto_286271 ) ) ( not ( = ?auto_286259 ?auto_286272 ) ) ( not ( = ?auto_286260 ?auto_286261 ) ) ( not ( = ?auto_286260 ?auto_286262 ) ) ( not ( = ?auto_286260 ?auto_286263 ) ) ( not ( = ?auto_286260 ?auto_286264 ) ) ( not ( = ?auto_286260 ?auto_286265 ) ) ( not ( = ?auto_286260 ?auto_286266 ) ) ( not ( = ?auto_286260 ?auto_286267 ) ) ( not ( = ?auto_286260 ?auto_286268 ) ) ( not ( = ?auto_286260 ?auto_286269 ) ) ( not ( = ?auto_286260 ?auto_286270 ) ) ( not ( = ?auto_286260 ?auto_286271 ) ) ( not ( = ?auto_286260 ?auto_286272 ) ) ( not ( = ?auto_286261 ?auto_286262 ) ) ( not ( = ?auto_286261 ?auto_286263 ) ) ( not ( = ?auto_286261 ?auto_286264 ) ) ( not ( = ?auto_286261 ?auto_286265 ) ) ( not ( = ?auto_286261 ?auto_286266 ) ) ( not ( = ?auto_286261 ?auto_286267 ) ) ( not ( = ?auto_286261 ?auto_286268 ) ) ( not ( = ?auto_286261 ?auto_286269 ) ) ( not ( = ?auto_286261 ?auto_286270 ) ) ( not ( = ?auto_286261 ?auto_286271 ) ) ( not ( = ?auto_286261 ?auto_286272 ) ) ( not ( = ?auto_286262 ?auto_286263 ) ) ( not ( = ?auto_286262 ?auto_286264 ) ) ( not ( = ?auto_286262 ?auto_286265 ) ) ( not ( = ?auto_286262 ?auto_286266 ) ) ( not ( = ?auto_286262 ?auto_286267 ) ) ( not ( = ?auto_286262 ?auto_286268 ) ) ( not ( = ?auto_286262 ?auto_286269 ) ) ( not ( = ?auto_286262 ?auto_286270 ) ) ( not ( = ?auto_286262 ?auto_286271 ) ) ( not ( = ?auto_286262 ?auto_286272 ) ) ( not ( = ?auto_286263 ?auto_286264 ) ) ( not ( = ?auto_286263 ?auto_286265 ) ) ( not ( = ?auto_286263 ?auto_286266 ) ) ( not ( = ?auto_286263 ?auto_286267 ) ) ( not ( = ?auto_286263 ?auto_286268 ) ) ( not ( = ?auto_286263 ?auto_286269 ) ) ( not ( = ?auto_286263 ?auto_286270 ) ) ( not ( = ?auto_286263 ?auto_286271 ) ) ( not ( = ?auto_286263 ?auto_286272 ) ) ( not ( = ?auto_286264 ?auto_286265 ) ) ( not ( = ?auto_286264 ?auto_286266 ) ) ( not ( = ?auto_286264 ?auto_286267 ) ) ( not ( = ?auto_286264 ?auto_286268 ) ) ( not ( = ?auto_286264 ?auto_286269 ) ) ( not ( = ?auto_286264 ?auto_286270 ) ) ( not ( = ?auto_286264 ?auto_286271 ) ) ( not ( = ?auto_286264 ?auto_286272 ) ) ( not ( = ?auto_286265 ?auto_286266 ) ) ( not ( = ?auto_286265 ?auto_286267 ) ) ( not ( = ?auto_286265 ?auto_286268 ) ) ( not ( = ?auto_286265 ?auto_286269 ) ) ( not ( = ?auto_286265 ?auto_286270 ) ) ( not ( = ?auto_286265 ?auto_286271 ) ) ( not ( = ?auto_286265 ?auto_286272 ) ) ( not ( = ?auto_286266 ?auto_286267 ) ) ( not ( = ?auto_286266 ?auto_286268 ) ) ( not ( = ?auto_286266 ?auto_286269 ) ) ( not ( = ?auto_286266 ?auto_286270 ) ) ( not ( = ?auto_286266 ?auto_286271 ) ) ( not ( = ?auto_286266 ?auto_286272 ) ) ( not ( = ?auto_286267 ?auto_286268 ) ) ( not ( = ?auto_286267 ?auto_286269 ) ) ( not ( = ?auto_286267 ?auto_286270 ) ) ( not ( = ?auto_286267 ?auto_286271 ) ) ( not ( = ?auto_286267 ?auto_286272 ) ) ( not ( = ?auto_286268 ?auto_286269 ) ) ( not ( = ?auto_286268 ?auto_286270 ) ) ( not ( = ?auto_286268 ?auto_286271 ) ) ( not ( = ?auto_286268 ?auto_286272 ) ) ( not ( = ?auto_286269 ?auto_286270 ) ) ( not ( = ?auto_286269 ?auto_286271 ) ) ( not ( = ?auto_286269 ?auto_286272 ) ) ( not ( = ?auto_286270 ?auto_286271 ) ) ( not ( = ?auto_286270 ?auto_286272 ) ) ( not ( = ?auto_286271 ?auto_286272 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_286271 ?auto_286272 )
      ( !STACK ?auto_286271 ?auto_286270 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_286313 - BLOCK
      ?auto_286314 - BLOCK
      ?auto_286315 - BLOCK
      ?auto_286316 - BLOCK
      ?auto_286317 - BLOCK
      ?auto_286318 - BLOCK
      ?auto_286319 - BLOCK
      ?auto_286320 - BLOCK
      ?auto_286321 - BLOCK
      ?auto_286322 - BLOCK
      ?auto_286323 - BLOCK
      ?auto_286324 - BLOCK
      ?auto_286325 - BLOCK
    )
    :vars
    (
      ?auto_286326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_286325 ?auto_286326 ) ( ON-TABLE ?auto_286313 ) ( ON ?auto_286314 ?auto_286313 ) ( ON ?auto_286315 ?auto_286314 ) ( ON ?auto_286316 ?auto_286315 ) ( ON ?auto_286317 ?auto_286316 ) ( ON ?auto_286318 ?auto_286317 ) ( ON ?auto_286319 ?auto_286318 ) ( ON ?auto_286320 ?auto_286319 ) ( ON ?auto_286321 ?auto_286320 ) ( ON ?auto_286322 ?auto_286321 ) ( ON ?auto_286323 ?auto_286322 ) ( not ( = ?auto_286313 ?auto_286314 ) ) ( not ( = ?auto_286313 ?auto_286315 ) ) ( not ( = ?auto_286313 ?auto_286316 ) ) ( not ( = ?auto_286313 ?auto_286317 ) ) ( not ( = ?auto_286313 ?auto_286318 ) ) ( not ( = ?auto_286313 ?auto_286319 ) ) ( not ( = ?auto_286313 ?auto_286320 ) ) ( not ( = ?auto_286313 ?auto_286321 ) ) ( not ( = ?auto_286313 ?auto_286322 ) ) ( not ( = ?auto_286313 ?auto_286323 ) ) ( not ( = ?auto_286313 ?auto_286324 ) ) ( not ( = ?auto_286313 ?auto_286325 ) ) ( not ( = ?auto_286313 ?auto_286326 ) ) ( not ( = ?auto_286314 ?auto_286315 ) ) ( not ( = ?auto_286314 ?auto_286316 ) ) ( not ( = ?auto_286314 ?auto_286317 ) ) ( not ( = ?auto_286314 ?auto_286318 ) ) ( not ( = ?auto_286314 ?auto_286319 ) ) ( not ( = ?auto_286314 ?auto_286320 ) ) ( not ( = ?auto_286314 ?auto_286321 ) ) ( not ( = ?auto_286314 ?auto_286322 ) ) ( not ( = ?auto_286314 ?auto_286323 ) ) ( not ( = ?auto_286314 ?auto_286324 ) ) ( not ( = ?auto_286314 ?auto_286325 ) ) ( not ( = ?auto_286314 ?auto_286326 ) ) ( not ( = ?auto_286315 ?auto_286316 ) ) ( not ( = ?auto_286315 ?auto_286317 ) ) ( not ( = ?auto_286315 ?auto_286318 ) ) ( not ( = ?auto_286315 ?auto_286319 ) ) ( not ( = ?auto_286315 ?auto_286320 ) ) ( not ( = ?auto_286315 ?auto_286321 ) ) ( not ( = ?auto_286315 ?auto_286322 ) ) ( not ( = ?auto_286315 ?auto_286323 ) ) ( not ( = ?auto_286315 ?auto_286324 ) ) ( not ( = ?auto_286315 ?auto_286325 ) ) ( not ( = ?auto_286315 ?auto_286326 ) ) ( not ( = ?auto_286316 ?auto_286317 ) ) ( not ( = ?auto_286316 ?auto_286318 ) ) ( not ( = ?auto_286316 ?auto_286319 ) ) ( not ( = ?auto_286316 ?auto_286320 ) ) ( not ( = ?auto_286316 ?auto_286321 ) ) ( not ( = ?auto_286316 ?auto_286322 ) ) ( not ( = ?auto_286316 ?auto_286323 ) ) ( not ( = ?auto_286316 ?auto_286324 ) ) ( not ( = ?auto_286316 ?auto_286325 ) ) ( not ( = ?auto_286316 ?auto_286326 ) ) ( not ( = ?auto_286317 ?auto_286318 ) ) ( not ( = ?auto_286317 ?auto_286319 ) ) ( not ( = ?auto_286317 ?auto_286320 ) ) ( not ( = ?auto_286317 ?auto_286321 ) ) ( not ( = ?auto_286317 ?auto_286322 ) ) ( not ( = ?auto_286317 ?auto_286323 ) ) ( not ( = ?auto_286317 ?auto_286324 ) ) ( not ( = ?auto_286317 ?auto_286325 ) ) ( not ( = ?auto_286317 ?auto_286326 ) ) ( not ( = ?auto_286318 ?auto_286319 ) ) ( not ( = ?auto_286318 ?auto_286320 ) ) ( not ( = ?auto_286318 ?auto_286321 ) ) ( not ( = ?auto_286318 ?auto_286322 ) ) ( not ( = ?auto_286318 ?auto_286323 ) ) ( not ( = ?auto_286318 ?auto_286324 ) ) ( not ( = ?auto_286318 ?auto_286325 ) ) ( not ( = ?auto_286318 ?auto_286326 ) ) ( not ( = ?auto_286319 ?auto_286320 ) ) ( not ( = ?auto_286319 ?auto_286321 ) ) ( not ( = ?auto_286319 ?auto_286322 ) ) ( not ( = ?auto_286319 ?auto_286323 ) ) ( not ( = ?auto_286319 ?auto_286324 ) ) ( not ( = ?auto_286319 ?auto_286325 ) ) ( not ( = ?auto_286319 ?auto_286326 ) ) ( not ( = ?auto_286320 ?auto_286321 ) ) ( not ( = ?auto_286320 ?auto_286322 ) ) ( not ( = ?auto_286320 ?auto_286323 ) ) ( not ( = ?auto_286320 ?auto_286324 ) ) ( not ( = ?auto_286320 ?auto_286325 ) ) ( not ( = ?auto_286320 ?auto_286326 ) ) ( not ( = ?auto_286321 ?auto_286322 ) ) ( not ( = ?auto_286321 ?auto_286323 ) ) ( not ( = ?auto_286321 ?auto_286324 ) ) ( not ( = ?auto_286321 ?auto_286325 ) ) ( not ( = ?auto_286321 ?auto_286326 ) ) ( not ( = ?auto_286322 ?auto_286323 ) ) ( not ( = ?auto_286322 ?auto_286324 ) ) ( not ( = ?auto_286322 ?auto_286325 ) ) ( not ( = ?auto_286322 ?auto_286326 ) ) ( not ( = ?auto_286323 ?auto_286324 ) ) ( not ( = ?auto_286323 ?auto_286325 ) ) ( not ( = ?auto_286323 ?auto_286326 ) ) ( not ( = ?auto_286324 ?auto_286325 ) ) ( not ( = ?auto_286324 ?auto_286326 ) ) ( not ( = ?auto_286325 ?auto_286326 ) ) ( CLEAR ?auto_286323 ) ( ON ?auto_286324 ?auto_286325 ) ( CLEAR ?auto_286324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_286313 ?auto_286314 ?auto_286315 ?auto_286316 ?auto_286317 ?auto_286318 ?auto_286319 ?auto_286320 ?auto_286321 ?auto_286322 ?auto_286323 ?auto_286324 )
      ( MAKE-13PILE ?auto_286313 ?auto_286314 ?auto_286315 ?auto_286316 ?auto_286317 ?auto_286318 ?auto_286319 ?auto_286320 ?auto_286321 ?auto_286322 ?auto_286323 ?auto_286324 ?auto_286325 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_286367 - BLOCK
      ?auto_286368 - BLOCK
      ?auto_286369 - BLOCK
      ?auto_286370 - BLOCK
      ?auto_286371 - BLOCK
      ?auto_286372 - BLOCK
      ?auto_286373 - BLOCK
      ?auto_286374 - BLOCK
      ?auto_286375 - BLOCK
      ?auto_286376 - BLOCK
      ?auto_286377 - BLOCK
      ?auto_286378 - BLOCK
      ?auto_286379 - BLOCK
    )
    :vars
    (
      ?auto_286380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_286379 ?auto_286380 ) ( ON-TABLE ?auto_286367 ) ( ON ?auto_286368 ?auto_286367 ) ( ON ?auto_286369 ?auto_286368 ) ( ON ?auto_286370 ?auto_286369 ) ( ON ?auto_286371 ?auto_286370 ) ( ON ?auto_286372 ?auto_286371 ) ( ON ?auto_286373 ?auto_286372 ) ( ON ?auto_286374 ?auto_286373 ) ( ON ?auto_286375 ?auto_286374 ) ( ON ?auto_286376 ?auto_286375 ) ( not ( = ?auto_286367 ?auto_286368 ) ) ( not ( = ?auto_286367 ?auto_286369 ) ) ( not ( = ?auto_286367 ?auto_286370 ) ) ( not ( = ?auto_286367 ?auto_286371 ) ) ( not ( = ?auto_286367 ?auto_286372 ) ) ( not ( = ?auto_286367 ?auto_286373 ) ) ( not ( = ?auto_286367 ?auto_286374 ) ) ( not ( = ?auto_286367 ?auto_286375 ) ) ( not ( = ?auto_286367 ?auto_286376 ) ) ( not ( = ?auto_286367 ?auto_286377 ) ) ( not ( = ?auto_286367 ?auto_286378 ) ) ( not ( = ?auto_286367 ?auto_286379 ) ) ( not ( = ?auto_286367 ?auto_286380 ) ) ( not ( = ?auto_286368 ?auto_286369 ) ) ( not ( = ?auto_286368 ?auto_286370 ) ) ( not ( = ?auto_286368 ?auto_286371 ) ) ( not ( = ?auto_286368 ?auto_286372 ) ) ( not ( = ?auto_286368 ?auto_286373 ) ) ( not ( = ?auto_286368 ?auto_286374 ) ) ( not ( = ?auto_286368 ?auto_286375 ) ) ( not ( = ?auto_286368 ?auto_286376 ) ) ( not ( = ?auto_286368 ?auto_286377 ) ) ( not ( = ?auto_286368 ?auto_286378 ) ) ( not ( = ?auto_286368 ?auto_286379 ) ) ( not ( = ?auto_286368 ?auto_286380 ) ) ( not ( = ?auto_286369 ?auto_286370 ) ) ( not ( = ?auto_286369 ?auto_286371 ) ) ( not ( = ?auto_286369 ?auto_286372 ) ) ( not ( = ?auto_286369 ?auto_286373 ) ) ( not ( = ?auto_286369 ?auto_286374 ) ) ( not ( = ?auto_286369 ?auto_286375 ) ) ( not ( = ?auto_286369 ?auto_286376 ) ) ( not ( = ?auto_286369 ?auto_286377 ) ) ( not ( = ?auto_286369 ?auto_286378 ) ) ( not ( = ?auto_286369 ?auto_286379 ) ) ( not ( = ?auto_286369 ?auto_286380 ) ) ( not ( = ?auto_286370 ?auto_286371 ) ) ( not ( = ?auto_286370 ?auto_286372 ) ) ( not ( = ?auto_286370 ?auto_286373 ) ) ( not ( = ?auto_286370 ?auto_286374 ) ) ( not ( = ?auto_286370 ?auto_286375 ) ) ( not ( = ?auto_286370 ?auto_286376 ) ) ( not ( = ?auto_286370 ?auto_286377 ) ) ( not ( = ?auto_286370 ?auto_286378 ) ) ( not ( = ?auto_286370 ?auto_286379 ) ) ( not ( = ?auto_286370 ?auto_286380 ) ) ( not ( = ?auto_286371 ?auto_286372 ) ) ( not ( = ?auto_286371 ?auto_286373 ) ) ( not ( = ?auto_286371 ?auto_286374 ) ) ( not ( = ?auto_286371 ?auto_286375 ) ) ( not ( = ?auto_286371 ?auto_286376 ) ) ( not ( = ?auto_286371 ?auto_286377 ) ) ( not ( = ?auto_286371 ?auto_286378 ) ) ( not ( = ?auto_286371 ?auto_286379 ) ) ( not ( = ?auto_286371 ?auto_286380 ) ) ( not ( = ?auto_286372 ?auto_286373 ) ) ( not ( = ?auto_286372 ?auto_286374 ) ) ( not ( = ?auto_286372 ?auto_286375 ) ) ( not ( = ?auto_286372 ?auto_286376 ) ) ( not ( = ?auto_286372 ?auto_286377 ) ) ( not ( = ?auto_286372 ?auto_286378 ) ) ( not ( = ?auto_286372 ?auto_286379 ) ) ( not ( = ?auto_286372 ?auto_286380 ) ) ( not ( = ?auto_286373 ?auto_286374 ) ) ( not ( = ?auto_286373 ?auto_286375 ) ) ( not ( = ?auto_286373 ?auto_286376 ) ) ( not ( = ?auto_286373 ?auto_286377 ) ) ( not ( = ?auto_286373 ?auto_286378 ) ) ( not ( = ?auto_286373 ?auto_286379 ) ) ( not ( = ?auto_286373 ?auto_286380 ) ) ( not ( = ?auto_286374 ?auto_286375 ) ) ( not ( = ?auto_286374 ?auto_286376 ) ) ( not ( = ?auto_286374 ?auto_286377 ) ) ( not ( = ?auto_286374 ?auto_286378 ) ) ( not ( = ?auto_286374 ?auto_286379 ) ) ( not ( = ?auto_286374 ?auto_286380 ) ) ( not ( = ?auto_286375 ?auto_286376 ) ) ( not ( = ?auto_286375 ?auto_286377 ) ) ( not ( = ?auto_286375 ?auto_286378 ) ) ( not ( = ?auto_286375 ?auto_286379 ) ) ( not ( = ?auto_286375 ?auto_286380 ) ) ( not ( = ?auto_286376 ?auto_286377 ) ) ( not ( = ?auto_286376 ?auto_286378 ) ) ( not ( = ?auto_286376 ?auto_286379 ) ) ( not ( = ?auto_286376 ?auto_286380 ) ) ( not ( = ?auto_286377 ?auto_286378 ) ) ( not ( = ?auto_286377 ?auto_286379 ) ) ( not ( = ?auto_286377 ?auto_286380 ) ) ( not ( = ?auto_286378 ?auto_286379 ) ) ( not ( = ?auto_286378 ?auto_286380 ) ) ( not ( = ?auto_286379 ?auto_286380 ) ) ( ON ?auto_286378 ?auto_286379 ) ( CLEAR ?auto_286376 ) ( ON ?auto_286377 ?auto_286378 ) ( CLEAR ?auto_286377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_286367 ?auto_286368 ?auto_286369 ?auto_286370 ?auto_286371 ?auto_286372 ?auto_286373 ?auto_286374 ?auto_286375 ?auto_286376 ?auto_286377 )
      ( MAKE-13PILE ?auto_286367 ?auto_286368 ?auto_286369 ?auto_286370 ?auto_286371 ?auto_286372 ?auto_286373 ?auto_286374 ?auto_286375 ?auto_286376 ?auto_286377 ?auto_286378 ?auto_286379 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_286421 - BLOCK
      ?auto_286422 - BLOCK
      ?auto_286423 - BLOCK
      ?auto_286424 - BLOCK
      ?auto_286425 - BLOCK
      ?auto_286426 - BLOCK
      ?auto_286427 - BLOCK
      ?auto_286428 - BLOCK
      ?auto_286429 - BLOCK
      ?auto_286430 - BLOCK
      ?auto_286431 - BLOCK
      ?auto_286432 - BLOCK
      ?auto_286433 - BLOCK
    )
    :vars
    (
      ?auto_286434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_286433 ?auto_286434 ) ( ON-TABLE ?auto_286421 ) ( ON ?auto_286422 ?auto_286421 ) ( ON ?auto_286423 ?auto_286422 ) ( ON ?auto_286424 ?auto_286423 ) ( ON ?auto_286425 ?auto_286424 ) ( ON ?auto_286426 ?auto_286425 ) ( ON ?auto_286427 ?auto_286426 ) ( ON ?auto_286428 ?auto_286427 ) ( ON ?auto_286429 ?auto_286428 ) ( not ( = ?auto_286421 ?auto_286422 ) ) ( not ( = ?auto_286421 ?auto_286423 ) ) ( not ( = ?auto_286421 ?auto_286424 ) ) ( not ( = ?auto_286421 ?auto_286425 ) ) ( not ( = ?auto_286421 ?auto_286426 ) ) ( not ( = ?auto_286421 ?auto_286427 ) ) ( not ( = ?auto_286421 ?auto_286428 ) ) ( not ( = ?auto_286421 ?auto_286429 ) ) ( not ( = ?auto_286421 ?auto_286430 ) ) ( not ( = ?auto_286421 ?auto_286431 ) ) ( not ( = ?auto_286421 ?auto_286432 ) ) ( not ( = ?auto_286421 ?auto_286433 ) ) ( not ( = ?auto_286421 ?auto_286434 ) ) ( not ( = ?auto_286422 ?auto_286423 ) ) ( not ( = ?auto_286422 ?auto_286424 ) ) ( not ( = ?auto_286422 ?auto_286425 ) ) ( not ( = ?auto_286422 ?auto_286426 ) ) ( not ( = ?auto_286422 ?auto_286427 ) ) ( not ( = ?auto_286422 ?auto_286428 ) ) ( not ( = ?auto_286422 ?auto_286429 ) ) ( not ( = ?auto_286422 ?auto_286430 ) ) ( not ( = ?auto_286422 ?auto_286431 ) ) ( not ( = ?auto_286422 ?auto_286432 ) ) ( not ( = ?auto_286422 ?auto_286433 ) ) ( not ( = ?auto_286422 ?auto_286434 ) ) ( not ( = ?auto_286423 ?auto_286424 ) ) ( not ( = ?auto_286423 ?auto_286425 ) ) ( not ( = ?auto_286423 ?auto_286426 ) ) ( not ( = ?auto_286423 ?auto_286427 ) ) ( not ( = ?auto_286423 ?auto_286428 ) ) ( not ( = ?auto_286423 ?auto_286429 ) ) ( not ( = ?auto_286423 ?auto_286430 ) ) ( not ( = ?auto_286423 ?auto_286431 ) ) ( not ( = ?auto_286423 ?auto_286432 ) ) ( not ( = ?auto_286423 ?auto_286433 ) ) ( not ( = ?auto_286423 ?auto_286434 ) ) ( not ( = ?auto_286424 ?auto_286425 ) ) ( not ( = ?auto_286424 ?auto_286426 ) ) ( not ( = ?auto_286424 ?auto_286427 ) ) ( not ( = ?auto_286424 ?auto_286428 ) ) ( not ( = ?auto_286424 ?auto_286429 ) ) ( not ( = ?auto_286424 ?auto_286430 ) ) ( not ( = ?auto_286424 ?auto_286431 ) ) ( not ( = ?auto_286424 ?auto_286432 ) ) ( not ( = ?auto_286424 ?auto_286433 ) ) ( not ( = ?auto_286424 ?auto_286434 ) ) ( not ( = ?auto_286425 ?auto_286426 ) ) ( not ( = ?auto_286425 ?auto_286427 ) ) ( not ( = ?auto_286425 ?auto_286428 ) ) ( not ( = ?auto_286425 ?auto_286429 ) ) ( not ( = ?auto_286425 ?auto_286430 ) ) ( not ( = ?auto_286425 ?auto_286431 ) ) ( not ( = ?auto_286425 ?auto_286432 ) ) ( not ( = ?auto_286425 ?auto_286433 ) ) ( not ( = ?auto_286425 ?auto_286434 ) ) ( not ( = ?auto_286426 ?auto_286427 ) ) ( not ( = ?auto_286426 ?auto_286428 ) ) ( not ( = ?auto_286426 ?auto_286429 ) ) ( not ( = ?auto_286426 ?auto_286430 ) ) ( not ( = ?auto_286426 ?auto_286431 ) ) ( not ( = ?auto_286426 ?auto_286432 ) ) ( not ( = ?auto_286426 ?auto_286433 ) ) ( not ( = ?auto_286426 ?auto_286434 ) ) ( not ( = ?auto_286427 ?auto_286428 ) ) ( not ( = ?auto_286427 ?auto_286429 ) ) ( not ( = ?auto_286427 ?auto_286430 ) ) ( not ( = ?auto_286427 ?auto_286431 ) ) ( not ( = ?auto_286427 ?auto_286432 ) ) ( not ( = ?auto_286427 ?auto_286433 ) ) ( not ( = ?auto_286427 ?auto_286434 ) ) ( not ( = ?auto_286428 ?auto_286429 ) ) ( not ( = ?auto_286428 ?auto_286430 ) ) ( not ( = ?auto_286428 ?auto_286431 ) ) ( not ( = ?auto_286428 ?auto_286432 ) ) ( not ( = ?auto_286428 ?auto_286433 ) ) ( not ( = ?auto_286428 ?auto_286434 ) ) ( not ( = ?auto_286429 ?auto_286430 ) ) ( not ( = ?auto_286429 ?auto_286431 ) ) ( not ( = ?auto_286429 ?auto_286432 ) ) ( not ( = ?auto_286429 ?auto_286433 ) ) ( not ( = ?auto_286429 ?auto_286434 ) ) ( not ( = ?auto_286430 ?auto_286431 ) ) ( not ( = ?auto_286430 ?auto_286432 ) ) ( not ( = ?auto_286430 ?auto_286433 ) ) ( not ( = ?auto_286430 ?auto_286434 ) ) ( not ( = ?auto_286431 ?auto_286432 ) ) ( not ( = ?auto_286431 ?auto_286433 ) ) ( not ( = ?auto_286431 ?auto_286434 ) ) ( not ( = ?auto_286432 ?auto_286433 ) ) ( not ( = ?auto_286432 ?auto_286434 ) ) ( not ( = ?auto_286433 ?auto_286434 ) ) ( ON ?auto_286432 ?auto_286433 ) ( ON ?auto_286431 ?auto_286432 ) ( CLEAR ?auto_286429 ) ( ON ?auto_286430 ?auto_286431 ) ( CLEAR ?auto_286430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_286421 ?auto_286422 ?auto_286423 ?auto_286424 ?auto_286425 ?auto_286426 ?auto_286427 ?auto_286428 ?auto_286429 ?auto_286430 )
      ( MAKE-13PILE ?auto_286421 ?auto_286422 ?auto_286423 ?auto_286424 ?auto_286425 ?auto_286426 ?auto_286427 ?auto_286428 ?auto_286429 ?auto_286430 ?auto_286431 ?auto_286432 ?auto_286433 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_286475 - BLOCK
      ?auto_286476 - BLOCK
      ?auto_286477 - BLOCK
      ?auto_286478 - BLOCK
      ?auto_286479 - BLOCK
      ?auto_286480 - BLOCK
      ?auto_286481 - BLOCK
      ?auto_286482 - BLOCK
      ?auto_286483 - BLOCK
      ?auto_286484 - BLOCK
      ?auto_286485 - BLOCK
      ?auto_286486 - BLOCK
      ?auto_286487 - BLOCK
    )
    :vars
    (
      ?auto_286488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_286487 ?auto_286488 ) ( ON-TABLE ?auto_286475 ) ( ON ?auto_286476 ?auto_286475 ) ( ON ?auto_286477 ?auto_286476 ) ( ON ?auto_286478 ?auto_286477 ) ( ON ?auto_286479 ?auto_286478 ) ( ON ?auto_286480 ?auto_286479 ) ( ON ?auto_286481 ?auto_286480 ) ( ON ?auto_286482 ?auto_286481 ) ( not ( = ?auto_286475 ?auto_286476 ) ) ( not ( = ?auto_286475 ?auto_286477 ) ) ( not ( = ?auto_286475 ?auto_286478 ) ) ( not ( = ?auto_286475 ?auto_286479 ) ) ( not ( = ?auto_286475 ?auto_286480 ) ) ( not ( = ?auto_286475 ?auto_286481 ) ) ( not ( = ?auto_286475 ?auto_286482 ) ) ( not ( = ?auto_286475 ?auto_286483 ) ) ( not ( = ?auto_286475 ?auto_286484 ) ) ( not ( = ?auto_286475 ?auto_286485 ) ) ( not ( = ?auto_286475 ?auto_286486 ) ) ( not ( = ?auto_286475 ?auto_286487 ) ) ( not ( = ?auto_286475 ?auto_286488 ) ) ( not ( = ?auto_286476 ?auto_286477 ) ) ( not ( = ?auto_286476 ?auto_286478 ) ) ( not ( = ?auto_286476 ?auto_286479 ) ) ( not ( = ?auto_286476 ?auto_286480 ) ) ( not ( = ?auto_286476 ?auto_286481 ) ) ( not ( = ?auto_286476 ?auto_286482 ) ) ( not ( = ?auto_286476 ?auto_286483 ) ) ( not ( = ?auto_286476 ?auto_286484 ) ) ( not ( = ?auto_286476 ?auto_286485 ) ) ( not ( = ?auto_286476 ?auto_286486 ) ) ( not ( = ?auto_286476 ?auto_286487 ) ) ( not ( = ?auto_286476 ?auto_286488 ) ) ( not ( = ?auto_286477 ?auto_286478 ) ) ( not ( = ?auto_286477 ?auto_286479 ) ) ( not ( = ?auto_286477 ?auto_286480 ) ) ( not ( = ?auto_286477 ?auto_286481 ) ) ( not ( = ?auto_286477 ?auto_286482 ) ) ( not ( = ?auto_286477 ?auto_286483 ) ) ( not ( = ?auto_286477 ?auto_286484 ) ) ( not ( = ?auto_286477 ?auto_286485 ) ) ( not ( = ?auto_286477 ?auto_286486 ) ) ( not ( = ?auto_286477 ?auto_286487 ) ) ( not ( = ?auto_286477 ?auto_286488 ) ) ( not ( = ?auto_286478 ?auto_286479 ) ) ( not ( = ?auto_286478 ?auto_286480 ) ) ( not ( = ?auto_286478 ?auto_286481 ) ) ( not ( = ?auto_286478 ?auto_286482 ) ) ( not ( = ?auto_286478 ?auto_286483 ) ) ( not ( = ?auto_286478 ?auto_286484 ) ) ( not ( = ?auto_286478 ?auto_286485 ) ) ( not ( = ?auto_286478 ?auto_286486 ) ) ( not ( = ?auto_286478 ?auto_286487 ) ) ( not ( = ?auto_286478 ?auto_286488 ) ) ( not ( = ?auto_286479 ?auto_286480 ) ) ( not ( = ?auto_286479 ?auto_286481 ) ) ( not ( = ?auto_286479 ?auto_286482 ) ) ( not ( = ?auto_286479 ?auto_286483 ) ) ( not ( = ?auto_286479 ?auto_286484 ) ) ( not ( = ?auto_286479 ?auto_286485 ) ) ( not ( = ?auto_286479 ?auto_286486 ) ) ( not ( = ?auto_286479 ?auto_286487 ) ) ( not ( = ?auto_286479 ?auto_286488 ) ) ( not ( = ?auto_286480 ?auto_286481 ) ) ( not ( = ?auto_286480 ?auto_286482 ) ) ( not ( = ?auto_286480 ?auto_286483 ) ) ( not ( = ?auto_286480 ?auto_286484 ) ) ( not ( = ?auto_286480 ?auto_286485 ) ) ( not ( = ?auto_286480 ?auto_286486 ) ) ( not ( = ?auto_286480 ?auto_286487 ) ) ( not ( = ?auto_286480 ?auto_286488 ) ) ( not ( = ?auto_286481 ?auto_286482 ) ) ( not ( = ?auto_286481 ?auto_286483 ) ) ( not ( = ?auto_286481 ?auto_286484 ) ) ( not ( = ?auto_286481 ?auto_286485 ) ) ( not ( = ?auto_286481 ?auto_286486 ) ) ( not ( = ?auto_286481 ?auto_286487 ) ) ( not ( = ?auto_286481 ?auto_286488 ) ) ( not ( = ?auto_286482 ?auto_286483 ) ) ( not ( = ?auto_286482 ?auto_286484 ) ) ( not ( = ?auto_286482 ?auto_286485 ) ) ( not ( = ?auto_286482 ?auto_286486 ) ) ( not ( = ?auto_286482 ?auto_286487 ) ) ( not ( = ?auto_286482 ?auto_286488 ) ) ( not ( = ?auto_286483 ?auto_286484 ) ) ( not ( = ?auto_286483 ?auto_286485 ) ) ( not ( = ?auto_286483 ?auto_286486 ) ) ( not ( = ?auto_286483 ?auto_286487 ) ) ( not ( = ?auto_286483 ?auto_286488 ) ) ( not ( = ?auto_286484 ?auto_286485 ) ) ( not ( = ?auto_286484 ?auto_286486 ) ) ( not ( = ?auto_286484 ?auto_286487 ) ) ( not ( = ?auto_286484 ?auto_286488 ) ) ( not ( = ?auto_286485 ?auto_286486 ) ) ( not ( = ?auto_286485 ?auto_286487 ) ) ( not ( = ?auto_286485 ?auto_286488 ) ) ( not ( = ?auto_286486 ?auto_286487 ) ) ( not ( = ?auto_286486 ?auto_286488 ) ) ( not ( = ?auto_286487 ?auto_286488 ) ) ( ON ?auto_286486 ?auto_286487 ) ( ON ?auto_286485 ?auto_286486 ) ( ON ?auto_286484 ?auto_286485 ) ( CLEAR ?auto_286482 ) ( ON ?auto_286483 ?auto_286484 ) ( CLEAR ?auto_286483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_286475 ?auto_286476 ?auto_286477 ?auto_286478 ?auto_286479 ?auto_286480 ?auto_286481 ?auto_286482 ?auto_286483 )
      ( MAKE-13PILE ?auto_286475 ?auto_286476 ?auto_286477 ?auto_286478 ?auto_286479 ?auto_286480 ?auto_286481 ?auto_286482 ?auto_286483 ?auto_286484 ?auto_286485 ?auto_286486 ?auto_286487 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_286529 - BLOCK
      ?auto_286530 - BLOCK
      ?auto_286531 - BLOCK
      ?auto_286532 - BLOCK
      ?auto_286533 - BLOCK
      ?auto_286534 - BLOCK
      ?auto_286535 - BLOCK
      ?auto_286536 - BLOCK
      ?auto_286537 - BLOCK
      ?auto_286538 - BLOCK
      ?auto_286539 - BLOCK
      ?auto_286540 - BLOCK
      ?auto_286541 - BLOCK
    )
    :vars
    (
      ?auto_286542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_286541 ?auto_286542 ) ( ON-TABLE ?auto_286529 ) ( ON ?auto_286530 ?auto_286529 ) ( ON ?auto_286531 ?auto_286530 ) ( ON ?auto_286532 ?auto_286531 ) ( ON ?auto_286533 ?auto_286532 ) ( ON ?auto_286534 ?auto_286533 ) ( ON ?auto_286535 ?auto_286534 ) ( not ( = ?auto_286529 ?auto_286530 ) ) ( not ( = ?auto_286529 ?auto_286531 ) ) ( not ( = ?auto_286529 ?auto_286532 ) ) ( not ( = ?auto_286529 ?auto_286533 ) ) ( not ( = ?auto_286529 ?auto_286534 ) ) ( not ( = ?auto_286529 ?auto_286535 ) ) ( not ( = ?auto_286529 ?auto_286536 ) ) ( not ( = ?auto_286529 ?auto_286537 ) ) ( not ( = ?auto_286529 ?auto_286538 ) ) ( not ( = ?auto_286529 ?auto_286539 ) ) ( not ( = ?auto_286529 ?auto_286540 ) ) ( not ( = ?auto_286529 ?auto_286541 ) ) ( not ( = ?auto_286529 ?auto_286542 ) ) ( not ( = ?auto_286530 ?auto_286531 ) ) ( not ( = ?auto_286530 ?auto_286532 ) ) ( not ( = ?auto_286530 ?auto_286533 ) ) ( not ( = ?auto_286530 ?auto_286534 ) ) ( not ( = ?auto_286530 ?auto_286535 ) ) ( not ( = ?auto_286530 ?auto_286536 ) ) ( not ( = ?auto_286530 ?auto_286537 ) ) ( not ( = ?auto_286530 ?auto_286538 ) ) ( not ( = ?auto_286530 ?auto_286539 ) ) ( not ( = ?auto_286530 ?auto_286540 ) ) ( not ( = ?auto_286530 ?auto_286541 ) ) ( not ( = ?auto_286530 ?auto_286542 ) ) ( not ( = ?auto_286531 ?auto_286532 ) ) ( not ( = ?auto_286531 ?auto_286533 ) ) ( not ( = ?auto_286531 ?auto_286534 ) ) ( not ( = ?auto_286531 ?auto_286535 ) ) ( not ( = ?auto_286531 ?auto_286536 ) ) ( not ( = ?auto_286531 ?auto_286537 ) ) ( not ( = ?auto_286531 ?auto_286538 ) ) ( not ( = ?auto_286531 ?auto_286539 ) ) ( not ( = ?auto_286531 ?auto_286540 ) ) ( not ( = ?auto_286531 ?auto_286541 ) ) ( not ( = ?auto_286531 ?auto_286542 ) ) ( not ( = ?auto_286532 ?auto_286533 ) ) ( not ( = ?auto_286532 ?auto_286534 ) ) ( not ( = ?auto_286532 ?auto_286535 ) ) ( not ( = ?auto_286532 ?auto_286536 ) ) ( not ( = ?auto_286532 ?auto_286537 ) ) ( not ( = ?auto_286532 ?auto_286538 ) ) ( not ( = ?auto_286532 ?auto_286539 ) ) ( not ( = ?auto_286532 ?auto_286540 ) ) ( not ( = ?auto_286532 ?auto_286541 ) ) ( not ( = ?auto_286532 ?auto_286542 ) ) ( not ( = ?auto_286533 ?auto_286534 ) ) ( not ( = ?auto_286533 ?auto_286535 ) ) ( not ( = ?auto_286533 ?auto_286536 ) ) ( not ( = ?auto_286533 ?auto_286537 ) ) ( not ( = ?auto_286533 ?auto_286538 ) ) ( not ( = ?auto_286533 ?auto_286539 ) ) ( not ( = ?auto_286533 ?auto_286540 ) ) ( not ( = ?auto_286533 ?auto_286541 ) ) ( not ( = ?auto_286533 ?auto_286542 ) ) ( not ( = ?auto_286534 ?auto_286535 ) ) ( not ( = ?auto_286534 ?auto_286536 ) ) ( not ( = ?auto_286534 ?auto_286537 ) ) ( not ( = ?auto_286534 ?auto_286538 ) ) ( not ( = ?auto_286534 ?auto_286539 ) ) ( not ( = ?auto_286534 ?auto_286540 ) ) ( not ( = ?auto_286534 ?auto_286541 ) ) ( not ( = ?auto_286534 ?auto_286542 ) ) ( not ( = ?auto_286535 ?auto_286536 ) ) ( not ( = ?auto_286535 ?auto_286537 ) ) ( not ( = ?auto_286535 ?auto_286538 ) ) ( not ( = ?auto_286535 ?auto_286539 ) ) ( not ( = ?auto_286535 ?auto_286540 ) ) ( not ( = ?auto_286535 ?auto_286541 ) ) ( not ( = ?auto_286535 ?auto_286542 ) ) ( not ( = ?auto_286536 ?auto_286537 ) ) ( not ( = ?auto_286536 ?auto_286538 ) ) ( not ( = ?auto_286536 ?auto_286539 ) ) ( not ( = ?auto_286536 ?auto_286540 ) ) ( not ( = ?auto_286536 ?auto_286541 ) ) ( not ( = ?auto_286536 ?auto_286542 ) ) ( not ( = ?auto_286537 ?auto_286538 ) ) ( not ( = ?auto_286537 ?auto_286539 ) ) ( not ( = ?auto_286537 ?auto_286540 ) ) ( not ( = ?auto_286537 ?auto_286541 ) ) ( not ( = ?auto_286537 ?auto_286542 ) ) ( not ( = ?auto_286538 ?auto_286539 ) ) ( not ( = ?auto_286538 ?auto_286540 ) ) ( not ( = ?auto_286538 ?auto_286541 ) ) ( not ( = ?auto_286538 ?auto_286542 ) ) ( not ( = ?auto_286539 ?auto_286540 ) ) ( not ( = ?auto_286539 ?auto_286541 ) ) ( not ( = ?auto_286539 ?auto_286542 ) ) ( not ( = ?auto_286540 ?auto_286541 ) ) ( not ( = ?auto_286540 ?auto_286542 ) ) ( not ( = ?auto_286541 ?auto_286542 ) ) ( ON ?auto_286540 ?auto_286541 ) ( ON ?auto_286539 ?auto_286540 ) ( ON ?auto_286538 ?auto_286539 ) ( ON ?auto_286537 ?auto_286538 ) ( CLEAR ?auto_286535 ) ( ON ?auto_286536 ?auto_286537 ) ( CLEAR ?auto_286536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_286529 ?auto_286530 ?auto_286531 ?auto_286532 ?auto_286533 ?auto_286534 ?auto_286535 ?auto_286536 )
      ( MAKE-13PILE ?auto_286529 ?auto_286530 ?auto_286531 ?auto_286532 ?auto_286533 ?auto_286534 ?auto_286535 ?auto_286536 ?auto_286537 ?auto_286538 ?auto_286539 ?auto_286540 ?auto_286541 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_286583 - BLOCK
      ?auto_286584 - BLOCK
      ?auto_286585 - BLOCK
      ?auto_286586 - BLOCK
      ?auto_286587 - BLOCK
      ?auto_286588 - BLOCK
      ?auto_286589 - BLOCK
      ?auto_286590 - BLOCK
      ?auto_286591 - BLOCK
      ?auto_286592 - BLOCK
      ?auto_286593 - BLOCK
      ?auto_286594 - BLOCK
      ?auto_286595 - BLOCK
    )
    :vars
    (
      ?auto_286596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_286595 ?auto_286596 ) ( ON-TABLE ?auto_286583 ) ( ON ?auto_286584 ?auto_286583 ) ( ON ?auto_286585 ?auto_286584 ) ( ON ?auto_286586 ?auto_286585 ) ( ON ?auto_286587 ?auto_286586 ) ( ON ?auto_286588 ?auto_286587 ) ( not ( = ?auto_286583 ?auto_286584 ) ) ( not ( = ?auto_286583 ?auto_286585 ) ) ( not ( = ?auto_286583 ?auto_286586 ) ) ( not ( = ?auto_286583 ?auto_286587 ) ) ( not ( = ?auto_286583 ?auto_286588 ) ) ( not ( = ?auto_286583 ?auto_286589 ) ) ( not ( = ?auto_286583 ?auto_286590 ) ) ( not ( = ?auto_286583 ?auto_286591 ) ) ( not ( = ?auto_286583 ?auto_286592 ) ) ( not ( = ?auto_286583 ?auto_286593 ) ) ( not ( = ?auto_286583 ?auto_286594 ) ) ( not ( = ?auto_286583 ?auto_286595 ) ) ( not ( = ?auto_286583 ?auto_286596 ) ) ( not ( = ?auto_286584 ?auto_286585 ) ) ( not ( = ?auto_286584 ?auto_286586 ) ) ( not ( = ?auto_286584 ?auto_286587 ) ) ( not ( = ?auto_286584 ?auto_286588 ) ) ( not ( = ?auto_286584 ?auto_286589 ) ) ( not ( = ?auto_286584 ?auto_286590 ) ) ( not ( = ?auto_286584 ?auto_286591 ) ) ( not ( = ?auto_286584 ?auto_286592 ) ) ( not ( = ?auto_286584 ?auto_286593 ) ) ( not ( = ?auto_286584 ?auto_286594 ) ) ( not ( = ?auto_286584 ?auto_286595 ) ) ( not ( = ?auto_286584 ?auto_286596 ) ) ( not ( = ?auto_286585 ?auto_286586 ) ) ( not ( = ?auto_286585 ?auto_286587 ) ) ( not ( = ?auto_286585 ?auto_286588 ) ) ( not ( = ?auto_286585 ?auto_286589 ) ) ( not ( = ?auto_286585 ?auto_286590 ) ) ( not ( = ?auto_286585 ?auto_286591 ) ) ( not ( = ?auto_286585 ?auto_286592 ) ) ( not ( = ?auto_286585 ?auto_286593 ) ) ( not ( = ?auto_286585 ?auto_286594 ) ) ( not ( = ?auto_286585 ?auto_286595 ) ) ( not ( = ?auto_286585 ?auto_286596 ) ) ( not ( = ?auto_286586 ?auto_286587 ) ) ( not ( = ?auto_286586 ?auto_286588 ) ) ( not ( = ?auto_286586 ?auto_286589 ) ) ( not ( = ?auto_286586 ?auto_286590 ) ) ( not ( = ?auto_286586 ?auto_286591 ) ) ( not ( = ?auto_286586 ?auto_286592 ) ) ( not ( = ?auto_286586 ?auto_286593 ) ) ( not ( = ?auto_286586 ?auto_286594 ) ) ( not ( = ?auto_286586 ?auto_286595 ) ) ( not ( = ?auto_286586 ?auto_286596 ) ) ( not ( = ?auto_286587 ?auto_286588 ) ) ( not ( = ?auto_286587 ?auto_286589 ) ) ( not ( = ?auto_286587 ?auto_286590 ) ) ( not ( = ?auto_286587 ?auto_286591 ) ) ( not ( = ?auto_286587 ?auto_286592 ) ) ( not ( = ?auto_286587 ?auto_286593 ) ) ( not ( = ?auto_286587 ?auto_286594 ) ) ( not ( = ?auto_286587 ?auto_286595 ) ) ( not ( = ?auto_286587 ?auto_286596 ) ) ( not ( = ?auto_286588 ?auto_286589 ) ) ( not ( = ?auto_286588 ?auto_286590 ) ) ( not ( = ?auto_286588 ?auto_286591 ) ) ( not ( = ?auto_286588 ?auto_286592 ) ) ( not ( = ?auto_286588 ?auto_286593 ) ) ( not ( = ?auto_286588 ?auto_286594 ) ) ( not ( = ?auto_286588 ?auto_286595 ) ) ( not ( = ?auto_286588 ?auto_286596 ) ) ( not ( = ?auto_286589 ?auto_286590 ) ) ( not ( = ?auto_286589 ?auto_286591 ) ) ( not ( = ?auto_286589 ?auto_286592 ) ) ( not ( = ?auto_286589 ?auto_286593 ) ) ( not ( = ?auto_286589 ?auto_286594 ) ) ( not ( = ?auto_286589 ?auto_286595 ) ) ( not ( = ?auto_286589 ?auto_286596 ) ) ( not ( = ?auto_286590 ?auto_286591 ) ) ( not ( = ?auto_286590 ?auto_286592 ) ) ( not ( = ?auto_286590 ?auto_286593 ) ) ( not ( = ?auto_286590 ?auto_286594 ) ) ( not ( = ?auto_286590 ?auto_286595 ) ) ( not ( = ?auto_286590 ?auto_286596 ) ) ( not ( = ?auto_286591 ?auto_286592 ) ) ( not ( = ?auto_286591 ?auto_286593 ) ) ( not ( = ?auto_286591 ?auto_286594 ) ) ( not ( = ?auto_286591 ?auto_286595 ) ) ( not ( = ?auto_286591 ?auto_286596 ) ) ( not ( = ?auto_286592 ?auto_286593 ) ) ( not ( = ?auto_286592 ?auto_286594 ) ) ( not ( = ?auto_286592 ?auto_286595 ) ) ( not ( = ?auto_286592 ?auto_286596 ) ) ( not ( = ?auto_286593 ?auto_286594 ) ) ( not ( = ?auto_286593 ?auto_286595 ) ) ( not ( = ?auto_286593 ?auto_286596 ) ) ( not ( = ?auto_286594 ?auto_286595 ) ) ( not ( = ?auto_286594 ?auto_286596 ) ) ( not ( = ?auto_286595 ?auto_286596 ) ) ( ON ?auto_286594 ?auto_286595 ) ( ON ?auto_286593 ?auto_286594 ) ( ON ?auto_286592 ?auto_286593 ) ( ON ?auto_286591 ?auto_286592 ) ( ON ?auto_286590 ?auto_286591 ) ( CLEAR ?auto_286588 ) ( ON ?auto_286589 ?auto_286590 ) ( CLEAR ?auto_286589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_286583 ?auto_286584 ?auto_286585 ?auto_286586 ?auto_286587 ?auto_286588 ?auto_286589 )
      ( MAKE-13PILE ?auto_286583 ?auto_286584 ?auto_286585 ?auto_286586 ?auto_286587 ?auto_286588 ?auto_286589 ?auto_286590 ?auto_286591 ?auto_286592 ?auto_286593 ?auto_286594 ?auto_286595 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_286637 - BLOCK
      ?auto_286638 - BLOCK
      ?auto_286639 - BLOCK
      ?auto_286640 - BLOCK
      ?auto_286641 - BLOCK
      ?auto_286642 - BLOCK
      ?auto_286643 - BLOCK
      ?auto_286644 - BLOCK
      ?auto_286645 - BLOCK
      ?auto_286646 - BLOCK
      ?auto_286647 - BLOCK
      ?auto_286648 - BLOCK
      ?auto_286649 - BLOCK
    )
    :vars
    (
      ?auto_286650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_286649 ?auto_286650 ) ( ON-TABLE ?auto_286637 ) ( ON ?auto_286638 ?auto_286637 ) ( ON ?auto_286639 ?auto_286638 ) ( ON ?auto_286640 ?auto_286639 ) ( ON ?auto_286641 ?auto_286640 ) ( not ( = ?auto_286637 ?auto_286638 ) ) ( not ( = ?auto_286637 ?auto_286639 ) ) ( not ( = ?auto_286637 ?auto_286640 ) ) ( not ( = ?auto_286637 ?auto_286641 ) ) ( not ( = ?auto_286637 ?auto_286642 ) ) ( not ( = ?auto_286637 ?auto_286643 ) ) ( not ( = ?auto_286637 ?auto_286644 ) ) ( not ( = ?auto_286637 ?auto_286645 ) ) ( not ( = ?auto_286637 ?auto_286646 ) ) ( not ( = ?auto_286637 ?auto_286647 ) ) ( not ( = ?auto_286637 ?auto_286648 ) ) ( not ( = ?auto_286637 ?auto_286649 ) ) ( not ( = ?auto_286637 ?auto_286650 ) ) ( not ( = ?auto_286638 ?auto_286639 ) ) ( not ( = ?auto_286638 ?auto_286640 ) ) ( not ( = ?auto_286638 ?auto_286641 ) ) ( not ( = ?auto_286638 ?auto_286642 ) ) ( not ( = ?auto_286638 ?auto_286643 ) ) ( not ( = ?auto_286638 ?auto_286644 ) ) ( not ( = ?auto_286638 ?auto_286645 ) ) ( not ( = ?auto_286638 ?auto_286646 ) ) ( not ( = ?auto_286638 ?auto_286647 ) ) ( not ( = ?auto_286638 ?auto_286648 ) ) ( not ( = ?auto_286638 ?auto_286649 ) ) ( not ( = ?auto_286638 ?auto_286650 ) ) ( not ( = ?auto_286639 ?auto_286640 ) ) ( not ( = ?auto_286639 ?auto_286641 ) ) ( not ( = ?auto_286639 ?auto_286642 ) ) ( not ( = ?auto_286639 ?auto_286643 ) ) ( not ( = ?auto_286639 ?auto_286644 ) ) ( not ( = ?auto_286639 ?auto_286645 ) ) ( not ( = ?auto_286639 ?auto_286646 ) ) ( not ( = ?auto_286639 ?auto_286647 ) ) ( not ( = ?auto_286639 ?auto_286648 ) ) ( not ( = ?auto_286639 ?auto_286649 ) ) ( not ( = ?auto_286639 ?auto_286650 ) ) ( not ( = ?auto_286640 ?auto_286641 ) ) ( not ( = ?auto_286640 ?auto_286642 ) ) ( not ( = ?auto_286640 ?auto_286643 ) ) ( not ( = ?auto_286640 ?auto_286644 ) ) ( not ( = ?auto_286640 ?auto_286645 ) ) ( not ( = ?auto_286640 ?auto_286646 ) ) ( not ( = ?auto_286640 ?auto_286647 ) ) ( not ( = ?auto_286640 ?auto_286648 ) ) ( not ( = ?auto_286640 ?auto_286649 ) ) ( not ( = ?auto_286640 ?auto_286650 ) ) ( not ( = ?auto_286641 ?auto_286642 ) ) ( not ( = ?auto_286641 ?auto_286643 ) ) ( not ( = ?auto_286641 ?auto_286644 ) ) ( not ( = ?auto_286641 ?auto_286645 ) ) ( not ( = ?auto_286641 ?auto_286646 ) ) ( not ( = ?auto_286641 ?auto_286647 ) ) ( not ( = ?auto_286641 ?auto_286648 ) ) ( not ( = ?auto_286641 ?auto_286649 ) ) ( not ( = ?auto_286641 ?auto_286650 ) ) ( not ( = ?auto_286642 ?auto_286643 ) ) ( not ( = ?auto_286642 ?auto_286644 ) ) ( not ( = ?auto_286642 ?auto_286645 ) ) ( not ( = ?auto_286642 ?auto_286646 ) ) ( not ( = ?auto_286642 ?auto_286647 ) ) ( not ( = ?auto_286642 ?auto_286648 ) ) ( not ( = ?auto_286642 ?auto_286649 ) ) ( not ( = ?auto_286642 ?auto_286650 ) ) ( not ( = ?auto_286643 ?auto_286644 ) ) ( not ( = ?auto_286643 ?auto_286645 ) ) ( not ( = ?auto_286643 ?auto_286646 ) ) ( not ( = ?auto_286643 ?auto_286647 ) ) ( not ( = ?auto_286643 ?auto_286648 ) ) ( not ( = ?auto_286643 ?auto_286649 ) ) ( not ( = ?auto_286643 ?auto_286650 ) ) ( not ( = ?auto_286644 ?auto_286645 ) ) ( not ( = ?auto_286644 ?auto_286646 ) ) ( not ( = ?auto_286644 ?auto_286647 ) ) ( not ( = ?auto_286644 ?auto_286648 ) ) ( not ( = ?auto_286644 ?auto_286649 ) ) ( not ( = ?auto_286644 ?auto_286650 ) ) ( not ( = ?auto_286645 ?auto_286646 ) ) ( not ( = ?auto_286645 ?auto_286647 ) ) ( not ( = ?auto_286645 ?auto_286648 ) ) ( not ( = ?auto_286645 ?auto_286649 ) ) ( not ( = ?auto_286645 ?auto_286650 ) ) ( not ( = ?auto_286646 ?auto_286647 ) ) ( not ( = ?auto_286646 ?auto_286648 ) ) ( not ( = ?auto_286646 ?auto_286649 ) ) ( not ( = ?auto_286646 ?auto_286650 ) ) ( not ( = ?auto_286647 ?auto_286648 ) ) ( not ( = ?auto_286647 ?auto_286649 ) ) ( not ( = ?auto_286647 ?auto_286650 ) ) ( not ( = ?auto_286648 ?auto_286649 ) ) ( not ( = ?auto_286648 ?auto_286650 ) ) ( not ( = ?auto_286649 ?auto_286650 ) ) ( ON ?auto_286648 ?auto_286649 ) ( ON ?auto_286647 ?auto_286648 ) ( ON ?auto_286646 ?auto_286647 ) ( ON ?auto_286645 ?auto_286646 ) ( ON ?auto_286644 ?auto_286645 ) ( ON ?auto_286643 ?auto_286644 ) ( CLEAR ?auto_286641 ) ( ON ?auto_286642 ?auto_286643 ) ( CLEAR ?auto_286642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_286637 ?auto_286638 ?auto_286639 ?auto_286640 ?auto_286641 ?auto_286642 )
      ( MAKE-13PILE ?auto_286637 ?auto_286638 ?auto_286639 ?auto_286640 ?auto_286641 ?auto_286642 ?auto_286643 ?auto_286644 ?auto_286645 ?auto_286646 ?auto_286647 ?auto_286648 ?auto_286649 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_286691 - BLOCK
      ?auto_286692 - BLOCK
      ?auto_286693 - BLOCK
      ?auto_286694 - BLOCK
      ?auto_286695 - BLOCK
      ?auto_286696 - BLOCK
      ?auto_286697 - BLOCK
      ?auto_286698 - BLOCK
      ?auto_286699 - BLOCK
      ?auto_286700 - BLOCK
      ?auto_286701 - BLOCK
      ?auto_286702 - BLOCK
      ?auto_286703 - BLOCK
    )
    :vars
    (
      ?auto_286704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_286703 ?auto_286704 ) ( ON-TABLE ?auto_286691 ) ( ON ?auto_286692 ?auto_286691 ) ( ON ?auto_286693 ?auto_286692 ) ( ON ?auto_286694 ?auto_286693 ) ( not ( = ?auto_286691 ?auto_286692 ) ) ( not ( = ?auto_286691 ?auto_286693 ) ) ( not ( = ?auto_286691 ?auto_286694 ) ) ( not ( = ?auto_286691 ?auto_286695 ) ) ( not ( = ?auto_286691 ?auto_286696 ) ) ( not ( = ?auto_286691 ?auto_286697 ) ) ( not ( = ?auto_286691 ?auto_286698 ) ) ( not ( = ?auto_286691 ?auto_286699 ) ) ( not ( = ?auto_286691 ?auto_286700 ) ) ( not ( = ?auto_286691 ?auto_286701 ) ) ( not ( = ?auto_286691 ?auto_286702 ) ) ( not ( = ?auto_286691 ?auto_286703 ) ) ( not ( = ?auto_286691 ?auto_286704 ) ) ( not ( = ?auto_286692 ?auto_286693 ) ) ( not ( = ?auto_286692 ?auto_286694 ) ) ( not ( = ?auto_286692 ?auto_286695 ) ) ( not ( = ?auto_286692 ?auto_286696 ) ) ( not ( = ?auto_286692 ?auto_286697 ) ) ( not ( = ?auto_286692 ?auto_286698 ) ) ( not ( = ?auto_286692 ?auto_286699 ) ) ( not ( = ?auto_286692 ?auto_286700 ) ) ( not ( = ?auto_286692 ?auto_286701 ) ) ( not ( = ?auto_286692 ?auto_286702 ) ) ( not ( = ?auto_286692 ?auto_286703 ) ) ( not ( = ?auto_286692 ?auto_286704 ) ) ( not ( = ?auto_286693 ?auto_286694 ) ) ( not ( = ?auto_286693 ?auto_286695 ) ) ( not ( = ?auto_286693 ?auto_286696 ) ) ( not ( = ?auto_286693 ?auto_286697 ) ) ( not ( = ?auto_286693 ?auto_286698 ) ) ( not ( = ?auto_286693 ?auto_286699 ) ) ( not ( = ?auto_286693 ?auto_286700 ) ) ( not ( = ?auto_286693 ?auto_286701 ) ) ( not ( = ?auto_286693 ?auto_286702 ) ) ( not ( = ?auto_286693 ?auto_286703 ) ) ( not ( = ?auto_286693 ?auto_286704 ) ) ( not ( = ?auto_286694 ?auto_286695 ) ) ( not ( = ?auto_286694 ?auto_286696 ) ) ( not ( = ?auto_286694 ?auto_286697 ) ) ( not ( = ?auto_286694 ?auto_286698 ) ) ( not ( = ?auto_286694 ?auto_286699 ) ) ( not ( = ?auto_286694 ?auto_286700 ) ) ( not ( = ?auto_286694 ?auto_286701 ) ) ( not ( = ?auto_286694 ?auto_286702 ) ) ( not ( = ?auto_286694 ?auto_286703 ) ) ( not ( = ?auto_286694 ?auto_286704 ) ) ( not ( = ?auto_286695 ?auto_286696 ) ) ( not ( = ?auto_286695 ?auto_286697 ) ) ( not ( = ?auto_286695 ?auto_286698 ) ) ( not ( = ?auto_286695 ?auto_286699 ) ) ( not ( = ?auto_286695 ?auto_286700 ) ) ( not ( = ?auto_286695 ?auto_286701 ) ) ( not ( = ?auto_286695 ?auto_286702 ) ) ( not ( = ?auto_286695 ?auto_286703 ) ) ( not ( = ?auto_286695 ?auto_286704 ) ) ( not ( = ?auto_286696 ?auto_286697 ) ) ( not ( = ?auto_286696 ?auto_286698 ) ) ( not ( = ?auto_286696 ?auto_286699 ) ) ( not ( = ?auto_286696 ?auto_286700 ) ) ( not ( = ?auto_286696 ?auto_286701 ) ) ( not ( = ?auto_286696 ?auto_286702 ) ) ( not ( = ?auto_286696 ?auto_286703 ) ) ( not ( = ?auto_286696 ?auto_286704 ) ) ( not ( = ?auto_286697 ?auto_286698 ) ) ( not ( = ?auto_286697 ?auto_286699 ) ) ( not ( = ?auto_286697 ?auto_286700 ) ) ( not ( = ?auto_286697 ?auto_286701 ) ) ( not ( = ?auto_286697 ?auto_286702 ) ) ( not ( = ?auto_286697 ?auto_286703 ) ) ( not ( = ?auto_286697 ?auto_286704 ) ) ( not ( = ?auto_286698 ?auto_286699 ) ) ( not ( = ?auto_286698 ?auto_286700 ) ) ( not ( = ?auto_286698 ?auto_286701 ) ) ( not ( = ?auto_286698 ?auto_286702 ) ) ( not ( = ?auto_286698 ?auto_286703 ) ) ( not ( = ?auto_286698 ?auto_286704 ) ) ( not ( = ?auto_286699 ?auto_286700 ) ) ( not ( = ?auto_286699 ?auto_286701 ) ) ( not ( = ?auto_286699 ?auto_286702 ) ) ( not ( = ?auto_286699 ?auto_286703 ) ) ( not ( = ?auto_286699 ?auto_286704 ) ) ( not ( = ?auto_286700 ?auto_286701 ) ) ( not ( = ?auto_286700 ?auto_286702 ) ) ( not ( = ?auto_286700 ?auto_286703 ) ) ( not ( = ?auto_286700 ?auto_286704 ) ) ( not ( = ?auto_286701 ?auto_286702 ) ) ( not ( = ?auto_286701 ?auto_286703 ) ) ( not ( = ?auto_286701 ?auto_286704 ) ) ( not ( = ?auto_286702 ?auto_286703 ) ) ( not ( = ?auto_286702 ?auto_286704 ) ) ( not ( = ?auto_286703 ?auto_286704 ) ) ( ON ?auto_286702 ?auto_286703 ) ( ON ?auto_286701 ?auto_286702 ) ( ON ?auto_286700 ?auto_286701 ) ( ON ?auto_286699 ?auto_286700 ) ( ON ?auto_286698 ?auto_286699 ) ( ON ?auto_286697 ?auto_286698 ) ( ON ?auto_286696 ?auto_286697 ) ( CLEAR ?auto_286694 ) ( ON ?auto_286695 ?auto_286696 ) ( CLEAR ?auto_286695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_286691 ?auto_286692 ?auto_286693 ?auto_286694 ?auto_286695 )
      ( MAKE-13PILE ?auto_286691 ?auto_286692 ?auto_286693 ?auto_286694 ?auto_286695 ?auto_286696 ?auto_286697 ?auto_286698 ?auto_286699 ?auto_286700 ?auto_286701 ?auto_286702 ?auto_286703 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_286745 - BLOCK
      ?auto_286746 - BLOCK
      ?auto_286747 - BLOCK
      ?auto_286748 - BLOCK
      ?auto_286749 - BLOCK
      ?auto_286750 - BLOCK
      ?auto_286751 - BLOCK
      ?auto_286752 - BLOCK
      ?auto_286753 - BLOCK
      ?auto_286754 - BLOCK
      ?auto_286755 - BLOCK
      ?auto_286756 - BLOCK
      ?auto_286757 - BLOCK
    )
    :vars
    (
      ?auto_286758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_286757 ?auto_286758 ) ( ON-TABLE ?auto_286745 ) ( ON ?auto_286746 ?auto_286745 ) ( ON ?auto_286747 ?auto_286746 ) ( not ( = ?auto_286745 ?auto_286746 ) ) ( not ( = ?auto_286745 ?auto_286747 ) ) ( not ( = ?auto_286745 ?auto_286748 ) ) ( not ( = ?auto_286745 ?auto_286749 ) ) ( not ( = ?auto_286745 ?auto_286750 ) ) ( not ( = ?auto_286745 ?auto_286751 ) ) ( not ( = ?auto_286745 ?auto_286752 ) ) ( not ( = ?auto_286745 ?auto_286753 ) ) ( not ( = ?auto_286745 ?auto_286754 ) ) ( not ( = ?auto_286745 ?auto_286755 ) ) ( not ( = ?auto_286745 ?auto_286756 ) ) ( not ( = ?auto_286745 ?auto_286757 ) ) ( not ( = ?auto_286745 ?auto_286758 ) ) ( not ( = ?auto_286746 ?auto_286747 ) ) ( not ( = ?auto_286746 ?auto_286748 ) ) ( not ( = ?auto_286746 ?auto_286749 ) ) ( not ( = ?auto_286746 ?auto_286750 ) ) ( not ( = ?auto_286746 ?auto_286751 ) ) ( not ( = ?auto_286746 ?auto_286752 ) ) ( not ( = ?auto_286746 ?auto_286753 ) ) ( not ( = ?auto_286746 ?auto_286754 ) ) ( not ( = ?auto_286746 ?auto_286755 ) ) ( not ( = ?auto_286746 ?auto_286756 ) ) ( not ( = ?auto_286746 ?auto_286757 ) ) ( not ( = ?auto_286746 ?auto_286758 ) ) ( not ( = ?auto_286747 ?auto_286748 ) ) ( not ( = ?auto_286747 ?auto_286749 ) ) ( not ( = ?auto_286747 ?auto_286750 ) ) ( not ( = ?auto_286747 ?auto_286751 ) ) ( not ( = ?auto_286747 ?auto_286752 ) ) ( not ( = ?auto_286747 ?auto_286753 ) ) ( not ( = ?auto_286747 ?auto_286754 ) ) ( not ( = ?auto_286747 ?auto_286755 ) ) ( not ( = ?auto_286747 ?auto_286756 ) ) ( not ( = ?auto_286747 ?auto_286757 ) ) ( not ( = ?auto_286747 ?auto_286758 ) ) ( not ( = ?auto_286748 ?auto_286749 ) ) ( not ( = ?auto_286748 ?auto_286750 ) ) ( not ( = ?auto_286748 ?auto_286751 ) ) ( not ( = ?auto_286748 ?auto_286752 ) ) ( not ( = ?auto_286748 ?auto_286753 ) ) ( not ( = ?auto_286748 ?auto_286754 ) ) ( not ( = ?auto_286748 ?auto_286755 ) ) ( not ( = ?auto_286748 ?auto_286756 ) ) ( not ( = ?auto_286748 ?auto_286757 ) ) ( not ( = ?auto_286748 ?auto_286758 ) ) ( not ( = ?auto_286749 ?auto_286750 ) ) ( not ( = ?auto_286749 ?auto_286751 ) ) ( not ( = ?auto_286749 ?auto_286752 ) ) ( not ( = ?auto_286749 ?auto_286753 ) ) ( not ( = ?auto_286749 ?auto_286754 ) ) ( not ( = ?auto_286749 ?auto_286755 ) ) ( not ( = ?auto_286749 ?auto_286756 ) ) ( not ( = ?auto_286749 ?auto_286757 ) ) ( not ( = ?auto_286749 ?auto_286758 ) ) ( not ( = ?auto_286750 ?auto_286751 ) ) ( not ( = ?auto_286750 ?auto_286752 ) ) ( not ( = ?auto_286750 ?auto_286753 ) ) ( not ( = ?auto_286750 ?auto_286754 ) ) ( not ( = ?auto_286750 ?auto_286755 ) ) ( not ( = ?auto_286750 ?auto_286756 ) ) ( not ( = ?auto_286750 ?auto_286757 ) ) ( not ( = ?auto_286750 ?auto_286758 ) ) ( not ( = ?auto_286751 ?auto_286752 ) ) ( not ( = ?auto_286751 ?auto_286753 ) ) ( not ( = ?auto_286751 ?auto_286754 ) ) ( not ( = ?auto_286751 ?auto_286755 ) ) ( not ( = ?auto_286751 ?auto_286756 ) ) ( not ( = ?auto_286751 ?auto_286757 ) ) ( not ( = ?auto_286751 ?auto_286758 ) ) ( not ( = ?auto_286752 ?auto_286753 ) ) ( not ( = ?auto_286752 ?auto_286754 ) ) ( not ( = ?auto_286752 ?auto_286755 ) ) ( not ( = ?auto_286752 ?auto_286756 ) ) ( not ( = ?auto_286752 ?auto_286757 ) ) ( not ( = ?auto_286752 ?auto_286758 ) ) ( not ( = ?auto_286753 ?auto_286754 ) ) ( not ( = ?auto_286753 ?auto_286755 ) ) ( not ( = ?auto_286753 ?auto_286756 ) ) ( not ( = ?auto_286753 ?auto_286757 ) ) ( not ( = ?auto_286753 ?auto_286758 ) ) ( not ( = ?auto_286754 ?auto_286755 ) ) ( not ( = ?auto_286754 ?auto_286756 ) ) ( not ( = ?auto_286754 ?auto_286757 ) ) ( not ( = ?auto_286754 ?auto_286758 ) ) ( not ( = ?auto_286755 ?auto_286756 ) ) ( not ( = ?auto_286755 ?auto_286757 ) ) ( not ( = ?auto_286755 ?auto_286758 ) ) ( not ( = ?auto_286756 ?auto_286757 ) ) ( not ( = ?auto_286756 ?auto_286758 ) ) ( not ( = ?auto_286757 ?auto_286758 ) ) ( ON ?auto_286756 ?auto_286757 ) ( ON ?auto_286755 ?auto_286756 ) ( ON ?auto_286754 ?auto_286755 ) ( ON ?auto_286753 ?auto_286754 ) ( ON ?auto_286752 ?auto_286753 ) ( ON ?auto_286751 ?auto_286752 ) ( ON ?auto_286750 ?auto_286751 ) ( ON ?auto_286749 ?auto_286750 ) ( CLEAR ?auto_286747 ) ( ON ?auto_286748 ?auto_286749 ) ( CLEAR ?auto_286748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_286745 ?auto_286746 ?auto_286747 ?auto_286748 )
      ( MAKE-13PILE ?auto_286745 ?auto_286746 ?auto_286747 ?auto_286748 ?auto_286749 ?auto_286750 ?auto_286751 ?auto_286752 ?auto_286753 ?auto_286754 ?auto_286755 ?auto_286756 ?auto_286757 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_286799 - BLOCK
      ?auto_286800 - BLOCK
      ?auto_286801 - BLOCK
      ?auto_286802 - BLOCK
      ?auto_286803 - BLOCK
      ?auto_286804 - BLOCK
      ?auto_286805 - BLOCK
      ?auto_286806 - BLOCK
      ?auto_286807 - BLOCK
      ?auto_286808 - BLOCK
      ?auto_286809 - BLOCK
      ?auto_286810 - BLOCK
      ?auto_286811 - BLOCK
    )
    :vars
    (
      ?auto_286812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_286811 ?auto_286812 ) ( ON-TABLE ?auto_286799 ) ( ON ?auto_286800 ?auto_286799 ) ( not ( = ?auto_286799 ?auto_286800 ) ) ( not ( = ?auto_286799 ?auto_286801 ) ) ( not ( = ?auto_286799 ?auto_286802 ) ) ( not ( = ?auto_286799 ?auto_286803 ) ) ( not ( = ?auto_286799 ?auto_286804 ) ) ( not ( = ?auto_286799 ?auto_286805 ) ) ( not ( = ?auto_286799 ?auto_286806 ) ) ( not ( = ?auto_286799 ?auto_286807 ) ) ( not ( = ?auto_286799 ?auto_286808 ) ) ( not ( = ?auto_286799 ?auto_286809 ) ) ( not ( = ?auto_286799 ?auto_286810 ) ) ( not ( = ?auto_286799 ?auto_286811 ) ) ( not ( = ?auto_286799 ?auto_286812 ) ) ( not ( = ?auto_286800 ?auto_286801 ) ) ( not ( = ?auto_286800 ?auto_286802 ) ) ( not ( = ?auto_286800 ?auto_286803 ) ) ( not ( = ?auto_286800 ?auto_286804 ) ) ( not ( = ?auto_286800 ?auto_286805 ) ) ( not ( = ?auto_286800 ?auto_286806 ) ) ( not ( = ?auto_286800 ?auto_286807 ) ) ( not ( = ?auto_286800 ?auto_286808 ) ) ( not ( = ?auto_286800 ?auto_286809 ) ) ( not ( = ?auto_286800 ?auto_286810 ) ) ( not ( = ?auto_286800 ?auto_286811 ) ) ( not ( = ?auto_286800 ?auto_286812 ) ) ( not ( = ?auto_286801 ?auto_286802 ) ) ( not ( = ?auto_286801 ?auto_286803 ) ) ( not ( = ?auto_286801 ?auto_286804 ) ) ( not ( = ?auto_286801 ?auto_286805 ) ) ( not ( = ?auto_286801 ?auto_286806 ) ) ( not ( = ?auto_286801 ?auto_286807 ) ) ( not ( = ?auto_286801 ?auto_286808 ) ) ( not ( = ?auto_286801 ?auto_286809 ) ) ( not ( = ?auto_286801 ?auto_286810 ) ) ( not ( = ?auto_286801 ?auto_286811 ) ) ( not ( = ?auto_286801 ?auto_286812 ) ) ( not ( = ?auto_286802 ?auto_286803 ) ) ( not ( = ?auto_286802 ?auto_286804 ) ) ( not ( = ?auto_286802 ?auto_286805 ) ) ( not ( = ?auto_286802 ?auto_286806 ) ) ( not ( = ?auto_286802 ?auto_286807 ) ) ( not ( = ?auto_286802 ?auto_286808 ) ) ( not ( = ?auto_286802 ?auto_286809 ) ) ( not ( = ?auto_286802 ?auto_286810 ) ) ( not ( = ?auto_286802 ?auto_286811 ) ) ( not ( = ?auto_286802 ?auto_286812 ) ) ( not ( = ?auto_286803 ?auto_286804 ) ) ( not ( = ?auto_286803 ?auto_286805 ) ) ( not ( = ?auto_286803 ?auto_286806 ) ) ( not ( = ?auto_286803 ?auto_286807 ) ) ( not ( = ?auto_286803 ?auto_286808 ) ) ( not ( = ?auto_286803 ?auto_286809 ) ) ( not ( = ?auto_286803 ?auto_286810 ) ) ( not ( = ?auto_286803 ?auto_286811 ) ) ( not ( = ?auto_286803 ?auto_286812 ) ) ( not ( = ?auto_286804 ?auto_286805 ) ) ( not ( = ?auto_286804 ?auto_286806 ) ) ( not ( = ?auto_286804 ?auto_286807 ) ) ( not ( = ?auto_286804 ?auto_286808 ) ) ( not ( = ?auto_286804 ?auto_286809 ) ) ( not ( = ?auto_286804 ?auto_286810 ) ) ( not ( = ?auto_286804 ?auto_286811 ) ) ( not ( = ?auto_286804 ?auto_286812 ) ) ( not ( = ?auto_286805 ?auto_286806 ) ) ( not ( = ?auto_286805 ?auto_286807 ) ) ( not ( = ?auto_286805 ?auto_286808 ) ) ( not ( = ?auto_286805 ?auto_286809 ) ) ( not ( = ?auto_286805 ?auto_286810 ) ) ( not ( = ?auto_286805 ?auto_286811 ) ) ( not ( = ?auto_286805 ?auto_286812 ) ) ( not ( = ?auto_286806 ?auto_286807 ) ) ( not ( = ?auto_286806 ?auto_286808 ) ) ( not ( = ?auto_286806 ?auto_286809 ) ) ( not ( = ?auto_286806 ?auto_286810 ) ) ( not ( = ?auto_286806 ?auto_286811 ) ) ( not ( = ?auto_286806 ?auto_286812 ) ) ( not ( = ?auto_286807 ?auto_286808 ) ) ( not ( = ?auto_286807 ?auto_286809 ) ) ( not ( = ?auto_286807 ?auto_286810 ) ) ( not ( = ?auto_286807 ?auto_286811 ) ) ( not ( = ?auto_286807 ?auto_286812 ) ) ( not ( = ?auto_286808 ?auto_286809 ) ) ( not ( = ?auto_286808 ?auto_286810 ) ) ( not ( = ?auto_286808 ?auto_286811 ) ) ( not ( = ?auto_286808 ?auto_286812 ) ) ( not ( = ?auto_286809 ?auto_286810 ) ) ( not ( = ?auto_286809 ?auto_286811 ) ) ( not ( = ?auto_286809 ?auto_286812 ) ) ( not ( = ?auto_286810 ?auto_286811 ) ) ( not ( = ?auto_286810 ?auto_286812 ) ) ( not ( = ?auto_286811 ?auto_286812 ) ) ( ON ?auto_286810 ?auto_286811 ) ( ON ?auto_286809 ?auto_286810 ) ( ON ?auto_286808 ?auto_286809 ) ( ON ?auto_286807 ?auto_286808 ) ( ON ?auto_286806 ?auto_286807 ) ( ON ?auto_286805 ?auto_286806 ) ( ON ?auto_286804 ?auto_286805 ) ( ON ?auto_286803 ?auto_286804 ) ( ON ?auto_286802 ?auto_286803 ) ( CLEAR ?auto_286800 ) ( ON ?auto_286801 ?auto_286802 ) ( CLEAR ?auto_286801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_286799 ?auto_286800 ?auto_286801 )
      ( MAKE-13PILE ?auto_286799 ?auto_286800 ?auto_286801 ?auto_286802 ?auto_286803 ?auto_286804 ?auto_286805 ?auto_286806 ?auto_286807 ?auto_286808 ?auto_286809 ?auto_286810 ?auto_286811 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_286853 - BLOCK
      ?auto_286854 - BLOCK
      ?auto_286855 - BLOCK
      ?auto_286856 - BLOCK
      ?auto_286857 - BLOCK
      ?auto_286858 - BLOCK
      ?auto_286859 - BLOCK
      ?auto_286860 - BLOCK
      ?auto_286861 - BLOCK
      ?auto_286862 - BLOCK
      ?auto_286863 - BLOCK
      ?auto_286864 - BLOCK
      ?auto_286865 - BLOCK
    )
    :vars
    (
      ?auto_286866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_286865 ?auto_286866 ) ( ON-TABLE ?auto_286853 ) ( not ( = ?auto_286853 ?auto_286854 ) ) ( not ( = ?auto_286853 ?auto_286855 ) ) ( not ( = ?auto_286853 ?auto_286856 ) ) ( not ( = ?auto_286853 ?auto_286857 ) ) ( not ( = ?auto_286853 ?auto_286858 ) ) ( not ( = ?auto_286853 ?auto_286859 ) ) ( not ( = ?auto_286853 ?auto_286860 ) ) ( not ( = ?auto_286853 ?auto_286861 ) ) ( not ( = ?auto_286853 ?auto_286862 ) ) ( not ( = ?auto_286853 ?auto_286863 ) ) ( not ( = ?auto_286853 ?auto_286864 ) ) ( not ( = ?auto_286853 ?auto_286865 ) ) ( not ( = ?auto_286853 ?auto_286866 ) ) ( not ( = ?auto_286854 ?auto_286855 ) ) ( not ( = ?auto_286854 ?auto_286856 ) ) ( not ( = ?auto_286854 ?auto_286857 ) ) ( not ( = ?auto_286854 ?auto_286858 ) ) ( not ( = ?auto_286854 ?auto_286859 ) ) ( not ( = ?auto_286854 ?auto_286860 ) ) ( not ( = ?auto_286854 ?auto_286861 ) ) ( not ( = ?auto_286854 ?auto_286862 ) ) ( not ( = ?auto_286854 ?auto_286863 ) ) ( not ( = ?auto_286854 ?auto_286864 ) ) ( not ( = ?auto_286854 ?auto_286865 ) ) ( not ( = ?auto_286854 ?auto_286866 ) ) ( not ( = ?auto_286855 ?auto_286856 ) ) ( not ( = ?auto_286855 ?auto_286857 ) ) ( not ( = ?auto_286855 ?auto_286858 ) ) ( not ( = ?auto_286855 ?auto_286859 ) ) ( not ( = ?auto_286855 ?auto_286860 ) ) ( not ( = ?auto_286855 ?auto_286861 ) ) ( not ( = ?auto_286855 ?auto_286862 ) ) ( not ( = ?auto_286855 ?auto_286863 ) ) ( not ( = ?auto_286855 ?auto_286864 ) ) ( not ( = ?auto_286855 ?auto_286865 ) ) ( not ( = ?auto_286855 ?auto_286866 ) ) ( not ( = ?auto_286856 ?auto_286857 ) ) ( not ( = ?auto_286856 ?auto_286858 ) ) ( not ( = ?auto_286856 ?auto_286859 ) ) ( not ( = ?auto_286856 ?auto_286860 ) ) ( not ( = ?auto_286856 ?auto_286861 ) ) ( not ( = ?auto_286856 ?auto_286862 ) ) ( not ( = ?auto_286856 ?auto_286863 ) ) ( not ( = ?auto_286856 ?auto_286864 ) ) ( not ( = ?auto_286856 ?auto_286865 ) ) ( not ( = ?auto_286856 ?auto_286866 ) ) ( not ( = ?auto_286857 ?auto_286858 ) ) ( not ( = ?auto_286857 ?auto_286859 ) ) ( not ( = ?auto_286857 ?auto_286860 ) ) ( not ( = ?auto_286857 ?auto_286861 ) ) ( not ( = ?auto_286857 ?auto_286862 ) ) ( not ( = ?auto_286857 ?auto_286863 ) ) ( not ( = ?auto_286857 ?auto_286864 ) ) ( not ( = ?auto_286857 ?auto_286865 ) ) ( not ( = ?auto_286857 ?auto_286866 ) ) ( not ( = ?auto_286858 ?auto_286859 ) ) ( not ( = ?auto_286858 ?auto_286860 ) ) ( not ( = ?auto_286858 ?auto_286861 ) ) ( not ( = ?auto_286858 ?auto_286862 ) ) ( not ( = ?auto_286858 ?auto_286863 ) ) ( not ( = ?auto_286858 ?auto_286864 ) ) ( not ( = ?auto_286858 ?auto_286865 ) ) ( not ( = ?auto_286858 ?auto_286866 ) ) ( not ( = ?auto_286859 ?auto_286860 ) ) ( not ( = ?auto_286859 ?auto_286861 ) ) ( not ( = ?auto_286859 ?auto_286862 ) ) ( not ( = ?auto_286859 ?auto_286863 ) ) ( not ( = ?auto_286859 ?auto_286864 ) ) ( not ( = ?auto_286859 ?auto_286865 ) ) ( not ( = ?auto_286859 ?auto_286866 ) ) ( not ( = ?auto_286860 ?auto_286861 ) ) ( not ( = ?auto_286860 ?auto_286862 ) ) ( not ( = ?auto_286860 ?auto_286863 ) ) ( not ( = ?auto_286860 ?auto_286864 ) ) ( not ( = ?auto_286860 ?auto_286865 ) ) ( not ( = ?auto_286860 ?auto_286866 ) ) ( not ( = ?auto_286861 ?auto_286862 ) ) ( not ( = ?auto_286861 ?auto_286863 ) ) ( not ( = ?auto_286861 ?auto_286864 ) ) ( not ( = ?auto_286861 ?auto_286865 ) ) ( not ( = ?auto_286861 ?auto_286866 ) ) ( not ( = ?auto_286862 ?auto_286863 ) ) ( not ( = ?auto_286862 ?auto_286864 ) ) ( not ( = ?auto_286862 ?auto_286865 ) ) ( not ( = ?auto_286862 ?auto_286866 ) ) ( not ( = ?auto_286863 ?auto_286864 ) ) ( not ( = ?auto_286863 ?auto_286865 ) ) ( not ( = ?auto_286863 ?auto_286866 ) ) ( not ( = ?auto_286864 ?auto_286865 ) ) ( not ( = ?auto_286864 ?auto_286866 ) ) ( not ( = ?auto_286865 ?auto_286866 ) ) ( ON ?auto_286864 ?auto_286865 ) ( ON ?auto_286863 ?auto_286864 ) ( ON ?auto_286862 ?auto_286863 ) ( ON ?auto_286861 ?auto_286862 ) ( ON ?auto_286860 ?auto_286861 ) ( ON ?auto_286859 ?auto_286860 ) ( ON ?auto_286858 ?auto_286859 ) ( ON ?auto_286857 ?auto_286858 ) ( ON ?auto_286856 ?auto_286857 ) ( ON ?auto_286855 ?auto_286856 ) ( CLEAR ?auto_286853 ) ( ON ?auto_286854 ?auto_286855 ) ( CLEAR ?auto_286854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_286853 ?auto_286854 )
      ( MAKE-13PILE ?auto_286853 ?auto_286854 ?auto_286855 ?auto_286856 ?auto_286857 ?auto_286858 ?auto_286859 ?auto_286860 ?auto_286861 ?auto_286862 ?auto_286863 ?auto_286864 ?auto_286865 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_286907 - BLOCK
      ?auto_286908 - BLOCK
      ?auto_286909 - BLOCK
      ?auto_286910 - BLOCK
      ?auto_286911 - BLOCK
      ?auto_286912 - BLOCK
      ?auto_286913 - BLOCK
      ?auto_286914 - BLOCK
      ?auto_286915 - BLOCK
      ?auto_286916 - BLOCK
      ?auto_286917 - BLOCK
      ?auto_286918 - BLOCK
      ?auto_286919 - BLOCK
    )
    :vars
    (
      ?auto_286920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_286919 ?auto_286920 ) ( not ( = ?auto_286907 ?auto_286908 ) ) ( not ( = ?auto_286907 ?auto_286909 ) ) ( not ( = ?auto_286907 ?auto_286910 ) ) ( not ( = ?auto_286907 ?auto_286911 ) ) ( not ( = ?auto_286907 ?auto_286912 ) ) ( not ( = ?auto_286907 ?auto_286913 ) ) ( not ( = ?auto_286907 ?auto_286914 ) ) ( not ( = ?auto_286907 ?auto_286915 ) ) ( not ( = ?auto_286907 ?auto_286916 ) ) ( not ( = ?auto_286907 ?auto_286917 ) ) ( not ( = ?auto_286907 ?auto_286918 ) ) ( not ( = ?auto_286907 ?auto_286919 ) ) ( not ( = ?auto_286907 ?auto_286920 ) ) ( not ( = ?auto_286908 ?auto_286909 ) ) ( not ( = ?auto_286908 ?auto_286910 ) ) ( not ( = ?auto_286908 ?auto_286911 ) ) ( not ( = ?auto_286908 ?auto_286912 ) ) ( not ( = ?auto_286908 ?auto_286913 ) ) ( not ( = ?auto_286908 ?auto_286914 ) ) ( not ( = ?auto_286908 ?auto_286915 ) ) ( not ( = ?auto_286908 ?auto_286916 ) ) ( not ( = ?auto_286908 ?auto_286917 ) ) ( not ( = ?auto_286908 ?auto_286918 ) ) ( not ( = ?auto_286908 ?auto_286919 ) ) ( not ( = ?auto_286908 ?auto_286920 ) ) ( not ( = ?auto_286909 ?auto_286910 ) ) ( not ( = ?auto_286909 ?auto_286911 ) ) ( not ( = ?auto_286909 ?auto_286912 ) ) ( not ( = ?auto_286909 ?auto_286913 ) ) ( not ( = ?auto_286909 ?auto_286914 ) ) ( not ( = ?auto_286909 ?auto_286915 ) ) ( not ( = ?auto_286909 ?auto_286916 ) ) ( not ( = ?auto_286909 ?auto_286917 ) ) ( not ( = ?auto_286909 ?auto_286918 ) ) ( not ( = ?auto_286909 ?auto_286919 ) ) ( not ( = ?auto_286909 ?auto_286920 ) ) ( not ( = ?auto_286910 ?auto_286911 ) ) ( not ( = ?auto_286910 ?auto_286912 ) ) ( not ( = ?auto_286910 ?auto_286913 ) ) ( not ( = ?auto_286910 ?auto_286914 ) ) ( not ( = ?auto_286910 ?auto_286915 ) ) ( not ( = ?auto_286910 ?auto_286916 ) ) ( not ( = ?auto_286910 ?auto_286917 ) ) ( not ( = ?auto_286910 ?auto_286918 ) ) ( not ( = ?auto_286910 ?auto_286919 ) ) ( not ( = ?auto_286910 ?auto_286920 ) ) ( not ( = ?auto_286911 ?auto_286912 ) ) ( not ( = ?auto_286911 ?auto_286913 ) ) ( not ( = ?auto_286911 ?auto_286914 ) ) ( not ( = ?auto_286911 ?auto_286915 ) ) ( not ( = ?auto_286911 ?auto_286916 ) ) ( not ( = ?auto_286911 ?auto_286917 ) ) ( not ( = ?auto_286911 ?auto_286918 ) ) ( not ( = ?auto_286911 ?auto_286919 ) ) ( not ( = ?auto_286911 ?auto_286920 ) ) ( not ( = ?auto_286912 ?auto_286913 ) ) ( not ( = ?auto_286912 ?auto_286914 ) ) ( not ( = ?auto_286912 ?auto_286915 ) ) ( not ( = ?auto_286912 ?auto_286916 ) ) ( not ( = ?auto_286912 ?auto_286917 ) ) ( not ( = ?auto_286912 ?auto_286918 ) ) ( not ( = ?auto_286912 ?auto_286919 ) ) ( not ( = ?auto_286912 ?auto_286920 ) ) ( not ( = ?auto_286913 ?auto_286914 ) ) ( not ( = ?auto_286913 ?auto_286915 ) ) ( not ( = ?auto_286913 ?auto_286916 ) ) ( not ( = ?auto_286913 ?auto_286917 ) ) ( not ( = ?auto_286913 ?auto_286918 ) ) ( not ( = ?auto_286913 ?auto_286919 ) ) ( not ( = ?auto_286913 ?auto_286920 ) ) ( not ( = ?auto_286914 ?auto_286915 ) ) ( not ( = ?auto_286914 ?auto_286916 ) ) ( not ( = ?auto_286914 ?auto_286917 ) ) ( not ( = ?auto_286914 ?auto_286918 ) ) ( not ( = ?auto_286914 ?auto_286919 ) ) ( not ( = ?auto_286914 ?auto_286920 ) ) ( not ( = ?auto_286915 ?auto_286916 ) ) ( not ( = ?auto_286915 ?auto_286917 ) ) ( not ( = ?auto_286915 ?auto_286918 ) ) ( not ( = ?auto_286915 ?auto_286919 ) ) ( not ( = ?auto_286915 ?auto_286920 ) ) ( not ( = ?auto_286916 ?auto_286917 ) ) ( not ( = ?auto_286916 ?auto_286918 ) ) ( not ( = ?auto_286916 ?auto_286919 ) ) ( not ( = ?auto_286916 ?auto_286920 ) ) ( not ( = ?auto_286917 ?auto_286918 ) ) ( not ( = ?auto_286917 ?auto_286919 ) ) ( not ( = ?auto_286917 ?auto_286920 ) ) ( not ( = ?auto_286918 ?auto_286919 ) ) ( not ( = ?auto_286918 ?auto_286920 ) ) ( not ( = ?auto_286919 ?auto_286920 ) ) ( ON ?auto_286918 ?auto_286919 ) ( ON ?auto_286917 ?auto_286918 ) ( ON ?auto_286916 ?auto_286917 ) ( ON ?auto_286915 ?auto_286916 ) ( ON ?auto_286914 ?auto_286915 ) ( ON ?auto_286913 ?auto_286914 ) ( ON ?auto_286912 ?auto_286913 ) ( ON ?auto_286911 ?auto_286912 ) ( ON ?auto_286910 ?auto_286911 ) ( ON ?auto_286909 ?auto_286910 ) ( ON ?auto_286908 ?auto_286909 ) ( ON ?auto_286907 ?auto_286908 ) ( CLEAR ?auto_286907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_286907 )
      ( MAKE-13PILE ?auto_286907 ?auto_286908 ?auto_286909 ?auto_286910 ?auto_286911 ?auto_286912 ?auto_286913 ?auto_286914 ?auto_286915 ?auto_286916 ?auto_286917 ?auto_286918 ?auto_286919 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_286962 - BLOCK
      ?auto_286963 - BLOCK
      ?auto_286964 - BLOCK
      ?auto_286965 - BLOCK
      ?auto_286966 - BLOCK
      ?auto_286967 - BLOCK
      ?auto_286968 - BLOCK
      ?auto_286969 - BLOCK
      ?auto_286970 - BLOCK
      ?auto_286971 - BLOCK
      ?auto_286972 - BLOCK
      ?auto_286973 - BLOCK
      ?auto_286974 - BLOCK
      ?auto_286975 - BLOCK
    )
    :vars
    (
      ?auto_286976 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_286974 ) ( ON ?auto_286975 ?auto_286976 ) ( CLEAR ?auto_286975 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_286962 ) ( ON ?auto_286963 ?auto_286962 ) ( ON ?auto_286964 ?auto_286963 ) ( ON ?auto_286965 ?auto_286964 ) ( ON ?auto_286966 ?auto_286965 ) ( ON ?auto_286967 ?auto_286966 ) ( ON ?auto_286968 ?auto_286967 ) ( ON ?auto_286969 ?auto_286968 ) ( ON ?auto_286970 ?auto_286969 ) ( ON ?auto_286971 ?auto_286970 ) ( ON ?auto_286972 ?auto_286971 ) ( ON ?auto_286973 ?auto_286972 ) ( ON ?auto_286974 ?auto_286973 ) ( not ( = ?auto_286962 ?auto_286963 ) ) ( not ( = ?auto_286962 ?auto_286964 ) ) ( not ( = ?auto_286962 ?auto_286965 ) ) ( not ( = ?auto_286962 ?auto_286966 ) ) ( not ( = ?auto_286962 ?auto_286967 ) ) ( not ( = ?auto_286962 ?auto_286968 ) ) ( not ( = ?auto_286962 ?auto_286969 ) ) ( not ( = ?auto_286962 ?auto_286970 ) ) ( not ( = ?auto_286962 ?auto_286971 ) ) ( not ( = ?auto_286962 ?auto_286972 ) ) ( not ( = ?auto_286962 ?auto_286973 ) ) ( not ( = ?auto_286962 ?auto_286974 ) ) ( not ( = ?auto_286962 ?auto_286975 ) ) ( not ( = ?auto_286962 ?auto_286976 ) ) ( not ( = ?auto_286963 ?auto_286964 ) ) ( not ( = ?auto_286963 ?auto_286965 ) ) ( not ( = ?auto_286963 ?auto_286966 ) ) ( not ( = ?auto_286963 ?auto_286967 ) ) ( not ( = ?auto_286963 ?auto_286968 ) ) ( not ( = ?auto_286963 ?auto_286969 ) ) ( not ( = ?auto_286963 ?auto_286970 ) ) ( not ( = ?auto_286963 ?auto_286971 ) ) ( not ( = ?auto_286963 ?auto_286972 ) ) ( not ( = ?auto_286963 ?auto_286973 ) ) ( not ( = ?auto_286963 ?auto_286974 ) ) ( not ( = ?auto_286963 ?auto_286975 ) ) ( not ( = ?auto_286963 ?auto_286976 ) ) ( not ( = ?auto_286964 ?auto_286965 ) ) ( not ( = ?auto_286964 ?auto_286966 ) ) ( not ( = ?auto_286964 ?auto_286967 ) ) ( not ( = ?auto_286964 ?auto_286968 ) ) ( not ( = ?auto_286964 ?auto_286969 ) ) ( not ( = ?auto_286964 ?auto_286970 ) ) ( not ( = ?auto_286964 ?auto_286971 ) ) ( not ( = ?auto_286964 ?auto_286972 ) ) ( not ( = ?auto_286964 ?auto_286973 ) ) ( not ( = ?auto_286964 ?auto_286974 ) ) ( not ( = ?auto_286964 ?auto_286975 ) ) ( not ( = ?auto_286964 ?auto_286976 ) ) ( not ( = ?auto_286965 ?auto_286966 ) ) ( not ( = ?auto_286965 ?auto_286967 ) ) ( not ( = ?auto_286965 ?auto_286968 ) ) ( not ( = ?auto_286965 ?auto_286969 ) ) ( not ( = ?auto_286965 ?auto_286970 ) ) ( not ( = ?auto_286965 ?auto_286971 ) ) ( not ( = ?auto_286965 ?auto_286972 ) ) ( not ( = ?auto_286965 ?auto_286973 ) ) ( not ( = ?auto_286965 ?auto_286974 ) ) ( not ( = ?auto_286965 ?auto_286975 ) ) ( not ( = ?auto_286965 ?auto_286976 ) ) ( not ( = ?auto_286966 ?auto_286967 ) ) ( not ( = ?auto_286966 ?auto_286968 ) ) ( not ( = ?auto_286966 ?auto_286969 ) ) ( not ( = ?auto_286966 ?auto_286970 ) ) ( not ( = ?auto_286966 ?auto_286971 ) ) ( not ( = ?auto_286966 ?auto_286972 ) ) ( not ( = ?auto_286966 ?auto_286973 ) ) ( not ( = ?auto_286966 ?auto_286974 ) ) ( not ( = ?auto_286966 ?auto_286975 ) ) ( not ( = ?auto_286966 ?auto_286976 ) ) ( not ( = ?auto_286967 ?auto_286968 ) ) ( not ( = ?auto_286967 ?auto_286969 ) ) ( not ( = ?auto_286967 ?auto_286970 ) ) ( not ( = ?auto_286967 ?auto_286971 ) ) ( not ( = ?auto_286967 ?auto_286972 ) ) ( not ( = ?auto_286967 ?auto_286973 ) ) ( not ( = ?auto_286967 ?auto_286974 ) ) ( not ( = ?auto_286967 ?auto_286975 ) ) ( not ( = ?auto_286967 ?auto_286976 ) ) ( not ( = ?auto_286968 ?auto_286969 ) ) ( not ( = ?auto_286968 ?auto_286970 ) ) ( not ( = ?auto_286968 ?auto_286971 ) ) ( not ( = ?auto_286968 ?auto_286972 ) ) ( not ( = ?auto_286968 ?auto_286973 ) ) ( not ( = ?auto_286968 ?auto_286974 ) ) ( not ( = ?auto_286968 ?auto_286975 ) ) ( not ( = ?auto_286968 ?auto_286976 ) ) ( not ( = ?auto_286969 ?auto_286970 ) ) ( not ( = ?auto_286969 ?auto_286971 ) ) ( not ( = ?auto_286969 ?auto_286972 ) ) ( not ( = ?auto_286969 ?auto_286973 ) ) ( not ( = ?auto_286969 ?auto_286974 ) ) ( not ( = ?auto_286969 ?auto_286975 ) ) ( not ( = ?auto_286969 ?auto_286976 ) ) ( not ( = ?auto_286970 ?auto_286971 ) ) ( not ( = ?auto_286970 ?auto_286972 ) ) ( not ( = ?auto_286970 ?auto_286973 ) ) ( not ( = ?auto_286970 ?auto_286974 ) ) ( not ( = ?auto_286970 ?auto_286975 ) ) ( not ( = ?auto_286970 ?auto_286976 ) ) ( not ( = ?auto_286971 ?auto_286972 ) ) ( not ( = ?auto_286971 ?auto_286973 ) ) ( not ( = ?auto_286971 ?auto_286974 ) ) ( not ( = ?auto_286971 ?auto_286975 ) ) ( not ( = ?auto_286971 ?auto_286976 ) ) ( not ( = ?auto_286972 ?auto_286973 ) ) ( not ( = ?auto_286972 ?auto_286974 ) ) ( not ( = ?auto_286972 ?auto_286975 ) ) ( not ( = ?auto_286972 ?auto_286976 ) ) ( not ( = ?auto_286973 ?auto_286974 ) ) ( not ( = ?auto_286973 ?auto_286975 ) ) ( not ( = ?auto_286973 ?auto_286976 ) ) ( not ( = ?auto_286974 ?auto_286975 ) ) ( not ( = ?auto_286974 ?auto_286976 ) ) ( not ( = ?auto_286975 ?auto_286976 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_286975 ?auto_286976 )
      ( !STACK ?auto_286975 ?auto_286974 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_286991 - BLOCK
      ?auto_286992 - BLOCK
      ?auto_286993 - BLOCK
      ?auto_286994 - BLOCK
      ?auto_286995 - BLOCK
      ?auto_286996 - BLOCK
      ?auto_286997 - BLOCK
      ?auto_286998 - BLOCK
      ?auto_286999 - BLOCK
      ?auto_287000 - BLOCK
      ?auto_287001 - BLOCK
      ?auto_287002 - BLOCK
      ?auto_287003 - BLOCK
      ?auto_287004 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_287003 ) ( ON-TABLE ?auto_287004 ) ( CLEAR ?auto_287004 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_286991 ) ( ON ?auto_286992 ?auto_286991 ) ( ON ?auto_286993 ?auto_286992 ) ( ON ?auto_286994 ?auto_286993 ) ( ON ?auto_286995 ?auto_286994 ) ( ON ?auto_286996 ?auto_286995 ) ( ON ?auto_286997 ?auto_286996 ) ( ON ?auto_286998 ?auto_286997 ) ( ON ?auto_286999 ?auto_286998 ) ( ON ?auto_287000 ?auto_286999 ) ( ON ?auto_287001 ?auto_287000 ) ( ON ?auto_287002 ?auto_287001 ) ( ON ?auto_287003 ?auto_287002 ) ( not ( = ?auto_286991 ?auto_286992 ) ) ( not ( = ?auto_286991 ?auto_286993 ) ) ( not ( = ?auto_286991 ?auto_286994 ) ) ( not ( = ?auto_286991 ?auto_286995 ) ) ( not ( = ?auto_286991 ?auto_286996 ) ) ( not ( = ?auto_286991 ?auto_286997 ) ) ( not ( = ?auto_286991 ?auto_286998 ) ) ( not ( = ?auto_286991 ?auto_286999 ) ) ( not ( = ?auto_286991 ?auto_287000 ) ) ( not ( = ?auto_286991 ?auto_287001 ) ) ( not ( = ?auto_286991 ?auto_287002 ) ) ( not ( = ?auto_286991 ?auto_287003 ) ) ( not ( = ?auto_286991 ?auto_287004 ) ) ( not ( = ?auto_286992 ?auto_286993 ) ) ( not ( = ?auto_286992 ?auto_286994 ) ) ( not ( = ?auto_286992 ?auto_286995 ) ) ( not ( = ?auto_286992 ?auto_286996 ) ) ( not ( = ?auto_286992 ?auto_286997 ) ) ( not ( = ?auto_286992 ?auto_286998 ) ) ( not ( = ?auto_286992 ?auto_286999 ) ) ( not ( = ?auto_286992 ?auto_287000 ) ) ( not ( = ?auto_286992 ?auto_287001 ) ) ( not ( = ?auto_286992 ?auto_287002 ) ) ( not ( = ?auto_286992 ?auto_287003 ) ) ( not ( = ?auto_286992 ?auto_287004 ) ) ( not ( = ?auto_286993 ?auto_286994 ) ) ( not ( = ?auto_286993 ?auto_286995 ) ) ( not ( = ?auto_286993 ?auto_286996 ) ) ( not ( = ?auto_286993 ?auto_286997 ) ) ( not ( = ?auto_286993 ?auto_286998 ) ) ( not ( = ?auto_286993 ?auto_286999 ) ) ( not ( = ?auto_286993 ?auto_287000 ) ) ( not ( = ?auto_286993 ?auto_287001 ) ) ( not ( = ?auto_286993 ?auto_287002 ) ) ( not ( = ?auto_286993 ?auto_287003 ) ) ( not ( = ?auto_286993 ?auto_287004 ) ) ( not ( = ?auto_286994 ?auto_286995 ) ) ( not ( = ?auto_286994 ?auto_286996 ) ) ( not ( = ?auto_286994 ?auto_286997 ) ) ( not ( = ?auto_286994 ?auto_286998 ) ) ( not ( = ?auto_286994 ?auto_286999 ) ) ( not ( = ?auto_286994 ?auto_287000 ) ) ( not ( = ?auto_286994 ?auto_287001 ) ) ( not ( = ?auto_286994 ?auto_287002 ) ) ( not ( = ?auto_286994 ?auto_287003 ) ) ( not ( = ?auto_286994 ?auto_287004 ) ) ( not ( = ?auto_286995 ?auto_286996 ) ) ( not ( = ?auto_286995 ?auto_286997 ) ) ( not ( = ?auto_286995 ?auto_286998 ) ) ( not ( = ?auto_286995 ?auto_286999 ) ) ( not ( = ?auto_286995 ?auto_287000 ) ) ( not ( = ?auto_286995 ?auto_287001 ) ) ( not ( = ?auto_286995 ?auto_287002 ) ) ( not ( = ?auto_286995 ?auto_287003 ) ) ( not ( = ?auto_286995 ?auto_287004 ) ) ( not ( = ?auto_286996 ?auto_286997 ) ) ( not ( = ?auto_286996 ?auto_286998 ) ) ( not ( = ?auto_286996 ?auto_286999 ) ) ( not ( = ?auto_286996 ?auto_287000 ) ) ( not ( = ?auto_286996 ?auto_287001 ) ) ( not ( = ?auto_286996 ?auto_287002 ) ) ( not ( = ?auto_286996 ?auto_287003 ) ) ( not ( = ?auto_286996 ?auto_287004 ) ) ( not ( = ?auto_286997 ?auto_286998 ) ) ( not ( = ?auto_286997 ?auto_286999 ) ) ( not ( = ?auto_286997 ?auto_287000 ) ) ( not ( = ?auto_286997 ?auto_287001 ) ) ( not ( = ?auto_286997 ?auto_287002 ) ) ( not ( = ?auto_286997 ?auto_287003 ) ) ( not ( = ?auto_286997 ?auto_287004 ) ) ( not ( = ?auto_286998 ?auto_286999 ) ) ( not ( = ?auto_286998 ?auto_287000 ) ) ( not ( = ?auto_286998 ?auto_287001 ) ) ( not ( = ?auto_286998 ?auto_287002 ) ) ( not ( = ?auto_286998 ?auto_287003 ) ) ( not ( = ?auto_286998 ?auto_287004 ) ) ( not ( = ?auto_286999 ?auto_287000 ) ) ( not ( = ?auto_286999 ?auto_287001 ) ) ( not ( = ?auto_286999 ?auto_287002 ) ) ( not ( = ?auto_286999 ?auto_287003 ) ) ( not ( = ?auto_286999 ?auto_287004 ) ) ( not ( = ?auto_287000 ?auto_287001 ) ) ( not ( = ?auto_287000 ?auto_287002 ) ) ( not ( = ?auto_287000 ?auto_287003 ) ) ( not ( = ?auto_287000 ?auto_287004 ) ) ( not ( = ?auto_287001 ?auto_287002 ) ) ( not ( = ?auto_287001 ?auto_287003 ) ) ( not ( = ?auto_287001 ?auto_287004 ) ) ( not ( = ?auto_287002 ?auto_287003 ) ) ( not ( = ?auto_287002 ?auto_287004 ) ) ( not ( = ?auto_287003 ?auto_287004 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_287004 )
      ( !STACK ?auto_287004 ?auto_287003 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_287019 - BLOCK
      ?auto_287020 - BLOCK
      ?auto_287021 - BLOCK
      ?auto_287022 - BLOCK
      ?auto_287023 - BLOCK
      ?auto_287024 - BLOCK
      ?auto_287025 - BLOCK
      ?auto_287026 - BLOCK
      ?auto_287027 - BLOCK
      ?auto_287028 - BLOCK
      ?auto_287029 - BLOCK
      ?auto_287030 - BLOCK
      ?auto_287031 - BLOCK
      ?auto_287032 - BLOCK
    )
    :vars
    (
      ?auto_287033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287032 ?auto_287033 ) ( ON-TABLE ?auto_287019 ) ( ON ?auto_287020 ?auto_287019 ) ( ON ?auto_287021 ?auto_287020 ) ( ON ?auto_287022 ?auto_287021 ) ( ON ?auto_287023 ?auto_287022 ) ( ON ?auto_287024 ?auto_287023 ) ( ON ?auto_287025 ?auto_287024 ) ( ON ?auto_287026 ?auto_287025 ) ( ON ?auto_287027 ?auto_287026 ) ( ON ?auto_287028 ?auto_287027 ) ( ON ?auto_287029 ?auto_287028 ) ( ON ?auto_287030 ?auto_287029 ) ( not ( = ?auto_287019 ?auto_287020 ) ) ( not ( = ?auto_287019 ?auto_287021 ) ) ( not ( = ?auto_287019 ?auto_287022 ) ) ( not ( = ?auto_287019 ?auto_287023 ) ) ( not ( = ?auto_287019 ?auto_287024 ) ) ( not ( = ?auto_287019 ?auto_287025 ) ) ( not ( = ?auto_287019 ?auto_287026 ) ) ( not ( = ?auto_287019 ?auto_287027 ) ) ( not ( = ?auto_287019 ?auto_287028 ) ) ( not ( = ?auto_287019 ?auto_287029 ) ) ( not ( = ?auto_287019 ?auto_287030 ) ) ( not ( = ?auto_287019 ?auto_287031 ) ) ( not ( = ?auto_287019 ?auto_287032 ) ) ( not ( = ?auto_287019 ?auto_287033 ) ) ( not ( = ?auto_287020 ?auto_287021 ) ) ( not ( = ?auto_287020 ?auto_287022 ) ) ( not ( = ?auto_287020 ?auto_287023 ) ) ( not ( = ?auto_287020 ?auto_287024 ) ) ( not ( = ?auto_287020 ?auto_287025 ) ) ( not ( = ?auto_287020 ?auto_287026 ) ) ( not ( = ?auto_287020 ?auto_287027 ) ) ( not ( = ?auto_287020 ?auto_287028 ) ) ( not ( = ?auto_287020 ?auto_287029 ) ) ( not ( = ?auto_287020 ?auto_287030 ) ) ( not ( = ?auto_287020 ?auto_287031 ) ) ( not ( = ?auto_287020 ?auto_287032 ) ) ( not ( = ?auto_287020 ?auto_287033 ) ) ( not ( = ?auto_287021 ?auto_287022 ) ) ( not ( = ?auto_287021 ?auto_287023 ) ) ( not ( = ?auto_287021 ?auto_287024 ) ) ( not ( = ?auto_287021 ?auto_287025 ) ) ( not ( = ?auto_287021 ?auto_287026 ) ) ( not ( = ?auto_287021 ?auto_287027 ) ) ( not ( = ?auto_287021 ?auto_287028 ) ) ( not ( = ?auto_287021 ?auto_287029 ) ) ( not ( = ?auto_287021 ?auto_287030 ) ) ( not ( = ?auto_287021 ?auto_287031 ) ) ( not ( = ?auto_287021 ?auto_287032 ) ) ( not ( = ?auto_287021 ?auto_287033 ) ) ( not ( = ?auto_287022 ?auto_287023 ) ) ( not ( = ?auto_287022 ?auto_287024 ) ) ( not ( = ?auto_287022 ?auto_287025 ) ) ( not ( = ?auto_287022 ?auto_287026 ) ) ( not ( = ?auto_287022 ?auto_287027 ) ) ( not ( = ?auto_287022 ?auto_287028 ) ) ( not ( = ?auto_287022 ?auto_287029 ) ) ( not ( = ?auto_287022 ?auto_287030 ) ) ( not ( = ?auto_287022 ?auto_287031 ) ) ( not ( = ?auto_287022 ?auto_287032 ) ) ( not ( = ?auto_287022 ?auto_287033 ) ) ( not ( = ?auto_287023 ?auto_287024 ) ) ( not ( = ?auto_287023 ?auto_287025 ) ) ( not ( = ?auto_287023 ?auto_287026 ) ) ( not ( = ?auto_287023 ?auto_287027 ) ) ( not ( = ?auto_287023 ?auto_287028 ) ) ( not ( = ?auto_287023 ?auto_287029 ) ) ( not ( = ?auto_287023 ?auto_287030 ) ) ( not ( = ?auto_287023 ?auto_287031 ) ) ( not ( = ?auto_287023 ?auto_287032 ) ) ( not ( = ?auto_287023 ?auto_287033 ) ) ( not ( = ?auto_287024 ?auto_287025 ) ) ( not ( = ?auto_287024 ?auto_287026 ) ) ( not ( = ?auto_287024 ?auto_287027 ) ) ( not ( = ?auto_287024 ?auto_287028 ) ) ( not ( = ?auto_287024 ?auto_287029 ) ) ( not ( = ?auto_287024 ?auto_287030 ) ) ( not ( = ?auto_287024 ?auto_287031 ) ) ( not ( = ?auto_287024 ?auto_287032 ) ) ( not ( = ?auto_287024 ?auto_287033 ) ) ( not ( = ?auto_287025 ?auto_287026 ) ) ( not ( = ?auto_287025 ?auto_287027 ) ) ( not ( = ?auto_287025 ?auto_287028 ) ) ( not ( = ?auto_287025 ?auto_287029 ) ) ( not ( = ?auto_287025 ?auto_287030 ) ) ( not ( = ?auto_287025 ?auto_287031 ) ) ( not ( = ?auto_287025 ?auto_287032 ) ) ( not ( = ?auto_287025 ?auto_287033 ) ) ( not ( = ?auto_287026 ?auto_287027 ) ) ( not ( = ?auto_287026 ?auto_287028 ) ) ( not ( = ?auto_287026 ?auto_287029 ) ) ( not ( = ?auto_287026 ?auto_287030 ) ) ( not ( = ?auto_287026 ?auto_287031 ) ) ( not ( = ?auto_287026 ?auto_287032 ) ) ( not ( = ?auto_287026 ?auto_287033 ) ) ( not ( = ?auto_287027 ?auto_287028 ) ) ( not ( = ?auto_287027 ?auto_287029 ) ) ( not ( = ?auto_287027 ?auto_287030 ) ) ( not ( = ?auto_287027 ?auto_287031 ) ) ( not ( = ?auto_287027 ?auto_287032 ) ) ( not ( = ?auto_287027 ?auto_287033 ) ) ( not ( = ?auto_287028 ?auto_287029 ) ) ( not ( = ?auto_287028 ?auto_287030 ) ) ( not ( = ?auto_287028 ?auto_287031 ) ) ( not ( = ?auto_287028 ?auto_287032 ) ) ( not ( = ?auto_287028 ?auto_287033 ) ) ( not ( = ?auto_287029 ?auto_287030 ) ) ( not ( = ?auto_287029 ?auto_287031 ) ) ( not ( = ?auto_287029 ?auto_287032 ) ) ( not ( = ?auto_287029 ?auto_287033 ) ) ( not ( = ?auto_287030 ?auto_287031 ) ) ( not ( = ?auto_287030 ?auto_287032 ) ) ( not ( = ?auto_287030 ?auto_287033 ) ) ( not ( = ?auto_287031 ?auto_287032 ) ) ( not ( = ?auto_287031 ?auto_287033 ) ) ( not ( = ?auto_287032 ?auto_287033 ) ) ( CLEAR ?auto_287030 ) ( ON ?auto_287031 ?auto_287032 ) ( CLEAR ?auto_287031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_287019 ?auto_287020 ?auto_287021 ?auto_287022 ?auto_287023 ?auto_287024 ?auto_287025 ?auto_287026 ?auto_287027 ?auto_287028 ?auto_287029 ?auto_287030 ?auto_287031 )
      ( MAKE-14PILE ?auto_287019 ?auto_287020 ?auto_287021 ?auto_287022 ?auto_287023 ?auto_287024 ?auto_287025 ?auto_287026 ?auto_287027 ?auto_287028 ?auto_287029 ?auto_287030 ?auto_287031 ?auto_287032 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_287048 - BLOCK
      ?auto_287049 - BLOCK
      ?auto_287050 - BLOCK
      ?auto_287051 - BLOCK
      ?auto_287052 - BLOCK
      ?auto_287053 - BLOCK
      ?auto_287054 - BLOCK
      ?auto_287055 - BLOCK
      ?auto_287056 - BLOCK
      ?auto_287057 - BLOCK
      ?auto_287058 - BLOCK
      ?auto_287059 - BLOCK
      ?auto_287060 - BLOCK
      ?auto_287061 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_287061 ) ( ON-TABLE ?auto_287048 ) ( ON ?auto_287049 ?auto_287048 ) ( ON ?auto_287050 ?auto_287049 ) ( ON ?auto_287051 ?auto_287050 ) ( ON ?auto_287052 ?auto_287051 ) ( ON ?auto_287053 ?auto_287052 ) ( ON ?auto_287054 ?auto_287053 ) ( ON ?auto_287055 ?auto_287054 ) ( ON ?auto_287056 ?auto_287055 ) ( ON ?auto_287057 ?auto_287056 ) ( ON ?auto_287058 ?auto_287057 ) ( ON ?auto_287059 ?auto_287058 ) ( not ( = ?auto_287048 ?auto_287049 ) ) ( not ( = ?auto_287048 ?auto_287050 ) ) ( not ( = ?auto_287048 ?auto_287051 ) ) ( not ( = ?auto_287048 ?auto_287052 ) ) ( not ( = ?auto_287048 ?auto_287053 ) ) ( not ( = ?auto_287048 ?auto_287054 ) ) ( not ( = ?auto_287048 ?auto_287055 ) ) ( not ( = ?auto_287048 ?auto_287056 ) ) ( not ( = ?auto_287048 ?auto_287057 ) ) ( not ( = ?auto_287048 ?auto_287058 ) ) ( not ( = ?auto_287048 ?auto_287059 ) ) ( not ( = ?auto_287048 ?auto_287060 ) ) ( not ( = ?auto_287048 ?auto_287061 ) ) ( not ( = ?auto_287049 ?auto_287050 ) ) ( not ( = ?auto_287049 ?auto_287051 ) ) ( not ( = ?auto_287049 ?auto_287052 ) ) ( not ( = ?auto_287049 ?auto_287053 ) ) ( not ( = ?auto_287049 ?auto_287054 ) ) ( not ( = ?auto_287049 ?auto_287055 ) ) ( not ( = ?auto_287049 ?auto_287056 ) ) ( not ( = ?auto_287049 ?auto_287057 ) ) ( not ( = ?auto_287049 ?auto_287058 ) ) ( not ( = ?auto_287049 ?auto_287059 ) ) ( not ( = ?auto_287049 ?auto_287060 ) ) ( not ( = ?auto_287049 ?auto_287061 ) ) ( not ( = ?auto_287050 ?auto_287051 ) ) ( not ( = ?auto_287050 ?auto_287052 ) ) ( not ( = ?auto_287050 ?auto_287053 ) ) ( not ( = ?auto_287050 ?auto_287054 ) ) ( not ( = ?auto_287050 ?auto_287055 ) ) ( not ( = ?auto_287050 ?auto_287056 ) ) ( not ( = ?auto_287050 ?auto_287057 ) ) ( not ( = ?auto_287050 ?auto_287058 ) ) ( not ( = ?auto_287050 ?auto_287059 ) ) ( not ( = ?auto_287050 ?auto_287060 ) ) ( not ( = ?auto_287050 ?auto_287061 ) ) ( not ( = ?auto_287051 ?auto_287052 ) ) ( not ( = ?auto_287051 ?auto_287053 ) ) ( not ( = ?auto_287051 ?auto_287054 ) ) ( not ( = ?auto_287051 ?auto_287055 ) ) ( not ( = ?auto_287051 ?auto_287056 ) ) ( not ( = ?auto_287051 ?auto_287057 ) ) ( not ( = ?auto_287051 ?auto_287058 ) ) ( not ( = ?auto_287051 ?auto_287059 ) ) ( not ( = ?auto_287051 ?auto_287060 ) ) ( not ( = ?auto_287051 ?auto_287061 ) ) ( not ( = ?auto_287052 ?auto_287053 ) ) ( not ( = ?auto_287052 ?auto_287054 ) ) ( not ( = ?auto_287052 ?auto_287055 ) ) ( not ( = ?auto_287052 ?auto_287056 ) ) ( not ( = ?auto_287052 ?auto_287057 ) ) ( not ( = ?auto_287052 ?auto_287058 ) ) ( not ( = ?auto_287052 ?auto_287059 ) ) ( not ( = ?auto_287052 ?auto_287060 ) ) ( not ( = ?auto_287052 ?auto_287061 ) ) ( not ( = ?auto_287053 ?auto_287054 ) ) ( not ( = ?auto_287053 ?auto_287055 ) ) ( not ( = ?auto_287053 ?auto_287056 ) ) ( not ( = ?auto_287053 ?auto_287057 ) ) ( not ( = ?auto_287053 ?auto_287058 ) ) ( not ( = ?auto_287053 ?auto_287059 ) ) ( not ( = ?auto_287053 ?auto_287060 ) ) ( not ( = ?auto_287053 ?auto_287061 ) ) ( not ( = ?auto_287054 ?auto_287055 ) ) ( not ( = ?auto_287054 ?auto_287056 ) ) ( not ( = ?auto_287054 ?auto_287057 ) ) ( not ( = ?auto_287054 ?auto_287058 ) ) ( not ( = ?auto_287054 ?auto_287059 ) ) ( not ( = ?auto_287054 ?auto_287060 ) ) ( not ( = ?auto_287054 ?auto_287061 ) ) ( not ( = ?auto_287055 ?auto_287056 ) ) ( not ( = ?auto_287055 ?auto_287057 ) ) ( not ( = ?auto_287055 ?auto_287058 ) ) ( not ( = ?auto_287055 ?auto_287059 ) ) ( not ( = ?auto_287055 ?auto_287060 ) ) ( not ( = ?auto_287055 ?auto_287061 ) ) ( not ( = ?auto_287056 ?auto_287057 ) ) ( not ( = ?auto_287056 ?auto_287058 ) ) ( not ( = ?auto_287056 ?auto_287059 ) ) ( not ( = ?auto_287056 ?auto_287060 ) ) ( not ( = ?auto_287056 ?auto_287061 ) ) ( not ( = ?auto_287057 ?auto_287058 ) ) ( not ( = ?auto_287057 ?auto_287059 ) ) ( not ( = ?auto_287057 ?auto_287060 ) ) ( not ( = ?auto_287057 ?auto_287061 ) ) ( not ( = ?auto_287058 ?auto_287059 ) ) ( not ( = ?auto_287058 ?auto_287060 ) ) ( not ( = ?auto_287058 ?auto_287061 ) ) ( not ( = ?auto_287059 ?auto_287060 ) ) ( not ( = ?auto_287059 ?auto_287061 ) ) ( not ( = ?auto_287060 ?auto_287061 ) ) ( CLEAR ?auto_287059 ) ( ON ?auto_287060 ?auto_287061 ) ( CLEAR ?auto_287060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_287048 ?auto_287049 ?auto_287050 ?auto_287051 ?auto_287052 ?auto_287053 ?auto_287054 ?auto_287055 ?auto_287056 ?auto_287057 ?auto_287058 ?auto_287059 ?auto_287060 )
      ( MAKE-14PILE ?auto_287048 ?auto_287049 ?auto_287050 ?auto_287051 ?auto_287052 ?auto_287053 ?auto_287054 ?auto_287055 ?auto_287056 ?auto_287057 ?auto_287058 ?auto_287059 ?auto_287060 ?auto_287061 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_287076 - BLOCK
      ?auto_287077 - BLOCK
      ?auto_287078 - BLOCK
      ?auto_287079 - BLOCK
      ?auto_287080 - BLOCK
      ?auto_287081 - BLOCK
      ?auto_287082 - BLOCK
      ?auto_287083 - BLOCK
      ?auto_287084 - BLOCK
      ?auto_287085 - BLOCK
      ?auto_287086 - BLOCK
      ?auto_287087 - BLOCK
      ?auto_287088 - BLOCK
      ?auto_287089 - BLOCK
    )
    :vars
    (
      ?auto_287090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287089 ?auto_287090 ) ( ON-TABLE ?auto_287076 ) ( ON ?auto_287077 ?auto_287076 ) ( ON ?auto_287078 ?auto_287077 ) ( ON ?auto_287079 ?auto_287078 ) ( ON ?auto_287080 ?auto_287079 ) ( ON ?auto_287081 ?auto_287080 ) ( ON ?auto_287082 ?auto_287081 ) ( ON ?auto_287083 ?auto_287082 ) ( ON ?auto_287084 ?auto_287083 ) ( ON ?auto_287085 ?auto_287084 ) ( ON ?auto_287086 ?auto_287085 ) ( not ( = ?auto_287076 ?auto_287077 ) ) ( not ( = ?auto_287076 ?auto_287078 ) ) ( not ( = ?auto_287076 ?auto_287079 ) ) ( not ( = ?auto_287076 ?auto_287080 ) ) ( not ( = ?auto_287076 ?auto_287081 ) ) ( not ( = ?auto_287076 ?auto_287082 ) ) ( not ( = ?auto_287076 ?auto_287083 ) ) ( not ( = ?auto_287076 ?auto_287084 ) ) ( not ( = ?auto_287076 ?auto_287085 ) ) ( not ( = ?auto_287076 ?auto_287086 ) ) ( not ( = ?auto_287076 ?auto_287087 ) ) ( not ( = ?auto_287076 ?auto_287088 ) ) ( not ( = ?auto_287076 ?auto_287089 ) ) ( not ( = ?auto_287076 ?auto_287090 ) ) ( not ( = ?auto_287077 ?auto_287078 ) ) ( not ( = ?auto_287077 ?auto_287079 ) ) ( not ( = ?auto_287077 ?auto_287080 ) ) ( not ( = ?auto_287077 ?auto_287081 ) ) ( not ( = ?auto_287077 ?auto_287082 ) ) ( not ( = ?auto_287077 ?auto_287083 ) ) ( not ( = ?auto_287077 ?auto_287084 ) ) ( not ( = ?auto_287077 ?auto_287085 ) ) ( not ( = ?auto_287077 ?auto_287086 ) ) ( not ( = ?auto_287077 ?auto_287087 ) ) ( not ( = ?auto_287077 ?auto_287088 ) ) ( not ( = ?auto_287077 ?auto_287089 ) ) ( not ( = ?auto_287077 ?auto_287090 ) ) ( not ( = ?auto_287078 ?auto_287079 ) ) ( not ( = ?auto_287078 ?auto_287080 ) ) ( not ( = ?auto_287078 ?auto_287081 ) ) ( not ( = ?auto_287078 ?auto_287082 ) ) ( not ( = ?auto_287078 ?auto_287083 ) ) ( not ( = ?auto_287078 ?auto_287084 ) ) ( not ( = ?auto_287078 ?auto_287085 ) ) ( not ( = ?auto_287078 ?auto_287086 ) ) ( not ( = ?auto_287078 ?auto_287087 ) ) ( not ( = ?auto_287078 ?auto_287088 ) ) ( not ( = ?auto_287078 ?auto_287089 ) ) ( not ( = ?auto_287078 ?auto_287090 ) ) ( not ( = ?auto_287079 ?auto_287080 ) ) ( not ( = ?auto_287079 ?auto_287081 ) ) ( not ( = ?auto_287079 ?auto_287082 ) ) ( not ( = ?auto_287079 ?auto_287083 ) ) ( not ( = ?auto_287079 ?auto_287084 ) ) ( not ( = ?auto_287079 ?auto_287085 ) ) ( not ( = ?auto_287079 ?auto_287086 ) ) ( not ( = ?auto_287079 ?auto_287087 ) ) ( not ( = ?auto_287079 ?auto_287088 ) ) ( not ( = ?auto_287079 ?auto_287089 ) ) ( not ( = ?auto_287079 ?auto_287090 ) ) ( not ( = ?auto_287080 ?auto_287081 ) ) ( not ( = ?auto_287080 ?auto_287082 ) ) ( not ( = ?auto_287080 ?auto_287083 ) ) ( not ( = ?auto_287080 ?auto_287084 ) ) ( not ( = ?auto_287080 ?auto_287085 ) ) ( not ( = ?auto_287080 ?auto_287086 ) ) ( not ( = ?auto_287080 ?auto_287087 ) ) ( not ( = ?auto_287080 ?auto_287088 ) ) ( not ( = ?auto_287080 ?auto_287089 ) ) ( not ( = ?auto_287080 ?auto_287090 ) ) ( not ( = ?auto_287081 ?auto_287082 ) ) ( not ( = ?auto_287081 ?auto_287083 ) ) ( not ( = ?auto_287081 ?auto_287084 ) ) ( not ( = ?auto_287081 ?auto_287085 ) ) ( not ( = ?auto_287081 ?auto_287086 ) ) ( not ( = ?auto_287081 ?auto_287087 ) ) ( not ( = ?auto_287081 ?auto_287088 ) ) ( not ( = ?auto_287081 ?auto_287089 ) ) ( not ( = ?auto_287081 ?auto_287090 ) ) ( not ( = ?auto_287082 ?auto_287083 ) ) ( not ( = ?auto_287082 ?auto_287084 ) ) ( not ( = ?auto_287082 ?auto_287085 ) ) ( not ( = ?auto_287082 ?auto_287086 ) ) ( not ( = ?auto_287082 ?auto_287087 ) ) ( not ( = ?auto_287082 ?auto_287088 ) ) ( not ( = ?auto_287082 ?auto_287089 ) ) ( not ( = ?auto_287082 ?auto_287090 ) ) ( not ( = ?auto_287083 ?auto_287084 ) ) ( not ( = ?auto_287083 ?auto_287085 ) ) ( not ( = ?auto_287083 ?auto_287086 ) ) ( not ( = ?auto_287083 ?auto_287087 ) ) ( not ( = ?auto_287083 ?auto_287088 ) ) ( not ( = ?auto_287083 ?auto_287089 ) ) ( not ( = ?auto_287083 ?auto_287090 ) ) ( not ( = ?auto_287084 ?auto_287085 ) ) ( not ( = ?auto_287084 ?auto_287086 ) ) ( not ( = ?auto_287084 ?auto_287087 ) ) ( not ( = ?auto_287084 ?auto_287088 ) ) ( not ( = ?auto_287084 ?auto_287089 ) ) ( not ( = ?auto_287084 ?auto_287090 ) ) ( not ( = ?auto_287085 ?auto_287086 ) ) ( not ( = ?auto_287085 ?auto_287087 ) ) ( not ( = ?auto_287085 ?auto_287088 ) ) ( not ( = ?auto_287085 ?auto_287089 ) ) ( not ( = ?auto_287085 ?auto_287090 ) ) ( not ( = ?auto_287086 ?auto_287087 ) ) ( not ( = ?auto_287086 ?auto_287088 ) ) ( not ( = ?auto_287086 ?auto_287089 ) ) ( not ( = ?auto_287086 ?auto_287090 ) ) ( not ( = ?auto_287087 ?auto_287088 ) ) ( not ( = ?auto_287087 ?auto_287089 ) ) ( not ( = ?auto_287087 ?auto_287090 ) ) ( not ( = ?auto_287088 ?auto_287089 ) ) ( not ( = ?auto_287088 ?auto_287090 ) ) ( not ( = ?auto_287089 ?auto_287090 ) ) ( ON ?auto_287088 ?auto_287089 ) ( CLEAR ?auto_287086 ) ( ON ?auto_287087 ?auto_287088 ) ( CLEAR ?auto_287087 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_287076 ?auto_287077 ?auto_287078 ?auto_287079 ?auto_287080 ?auto_287081 ?auto_287082 ?auto_287083 ?auto_287084 ?auto_287085 ?auto_287086 ?auto_287087 )
      ( MAKE-14PILE ?auto_287076 ?auto_287077 ?auto_287078 ?auto_287079 ?auto_287080 ?auto_287081 ?auto_287082 ?auto_287083 ?auto_287084 ?auto_287085 ?auto_287086 ?auto_287087 ?auto_287088 ?auto_287089 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_287105 - BLOCK
      ?auto_287106 - BLOCK
      ?auto_287107 - BLOCK
      ?auto_287108 - BLOCK
      ?auto_287109 - BLOCK
      ?auto_287110 - BLOCK
      ?auto_287111 - BLOCK
      ?auto_287112 - BLOCK
      ?auto_287113 - BLOCK
      ?auto_287114 - BLOCK
      ?auto_287115 - BLOCK
      ?auto_287116 - BLOCK
      ?auto_287117 - BLOCK
      ?auto_287118 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_287118 ) ( ON-TABLE ?auto_287105 ) ( ON ?auto_287106 ?auto_287105 ) ( ON ?auto_287107 ?auto_287106 ) ( ON ?auto_287108 ?auto_287107 ) ( ON ?auto_287109 ?auto_287108 ) ( ON ?auto_287110 ?auto_287109 ) ( ON ?auto_287111 ?auto_287110 ) ( ON ?auto_287112 ?auto_287111 ) ( ON ?auto_287113 ?auto_287112 ) ( ON ?auto_287114 ?auto_287113 ) ( ON ?auto_287115 ?auto_287114 ) ( not ( = ?auto_287105 ?auto_287106 ) ) ( not ( = ?auto_287105 ?auto_287107 ) ) ( not ( = ?auto_287105 ?auto_287108 ) ) ( not ( = ?auto_287105 ?auto_287109 ) ) ( not ( = ?auto_287105 ?auto_287110 ) ) ( not ( = ?auto_287105 ?auto_287111 ) ) ( not ( = ?auto_287105 ?auto_287112 ) ) ( not ( = ?auto_287105 ?auto_287113 ) ) ( not ( = ?auto_287105 ?auto_287114 ) ) ( not ( = ?auto_287105 ?auto_287115 ) ) ( not ( = ?auto_287105 ?auto_287116 ) ) ( not ( = ?auto_287105 ?auto_287117 ) ) ( not ( = ?auto_287105 ?auto_287118 ) ) ( not ( = ?auto_287106 ?auto_287107 ) ) ( not ( = ?auto_287106 ?auto_287108 ) ) ( not ( = ?auto_287106 ?auto_287109 ) ) ( not ( = ?auto_287106 ?auto_287110 ) ) ( not ( = ?auto_287106 ?auto_287111 ) ) ( not ( = ?auto_287106 ?auto_287112 ) ) ( not ( = ?auto_287106 ?auto_287113 ) ) ( not ( = ?auto_287106 ?auto_287114 ) ) ( not ( = ?auto_287106 ?auto_287115 ) ) ( not ( = ?auto_287106 ?auto_287116 ) ) ( not ( = ?auto_287106 ?auto_287117 ) ) ( not ( = ?auto_287106 ?auto_287118 ) ) ( not ( = ?auto_287107 ?auto_287108 ) ) ( not ( = ?auto_287107 ?auto_287109 ) ) ( not ( = ?auto_287107 ?auto_287110 ) ) ( not ( = ?auto_287107 ?auto_287111 ) ) ( not ( = ?auto_287107 ?auto_287112 ) ) ( not ( = ?auto_287107 ?auto_287113 ) ) ( not ( = ?auto_287107 ?auto_287114 ) ) ( not ( = ?auto_287107 ?auto_287115 ) ) ( not ( = ?auto_287107 ?auto_287116 ) ) ( not ( = ?auto_287107 ?auto_287117 ) ) ( not ( = ?auto_287107 ?auto_287118 ) ) ( not ( = ?auto_287108 ?auto_287109 ) ) ( not ( = ?auto_287108 ?auto_287110 ) ) ( not ( = ?auto_287108 ?auto_287111 ) ) ( not ( = ?auto_287108 ?auto_287112 ) ) ( not ( = ?auto_287108 ?auto_287113 ) ) ( not ( = ?auto_287108 ?auto_287114 ) ) ( not ( = ?auto_287108 ?auto_287115 ) ) ( not ( = ?auto_287108 ?auto_287116 ) ) ( not ( = ?auto_287108 ?auto_287117 ) ) ( not ( = ?auto_287108 ?auto_287118 ) ) ( not ( = ?auto_287109 ?auto_287110 ) ) ( not ( = ?auto_287109 ?auto_287111 ) ) ( not ( = ?auto_287109 ?auto_287112 ) ) ( not ( = ?auto_287109 ?auto_287113 ) ) ( not ( = ?auto_287109 ?auto_287114 ) ) ( not ( = ?auto_287109 ?auto_287115 ) ) ( not ( = ?auto_287109 ?auto_287116 ) ) ( not ( = ?auto_287109 ?auto_287117 ) ) ( not ( = ?auto_287109 ?auto_287118 ) ) ( not ( = ?auto_287110 ?auto_287111 ) ) ( not ( = ?auto_287110 ?auto_287112 ) ) ( not ( = ?auto_287110 ?auto_287113 ) ) ( not ( = ?auto_287110 ?auto_287114 ) ) ( not ( = ?auto_287110 ?auto_287115 ) ) ( not ( = ?auto_287110 ?auto_287116 ) ) ( not ( = ?auto_287110 ?auto_287117 ) ) ( not ( = ?auto_287110 ?auto_287118 ) ) ( not ( = ?auto_287111 ?auto_287112 ) ) ( not ( = ?auto_287111 ?auto_287113 ) ) ( not ( = ?auto_287111 ?auto_287114 ) ) ( not ( = ?auto_287111 ?auto_287115 ) ) ( not ( = ?auto_287111 ?auto_287116 ) ) ( not ( = ?auto_287111 ?auto_287117 ) ) ( not ( = ?auto_287111 ?auto_287118 ) ) ( not ( = ?auto_287112 ?auto_287113 ) ) ( not ( = ?auto_287112 ?auto_287114 ) ) ( not ( = ?auto_287112 ?auto_287115 ) ) ( not ( = ?auto_287112 ?auto_287116 ) ) ( not ( = ?auto_287112 ?auto_287117 ) ) ( not ( = ?auto_287112 ?auto_287118 ) ) ( not ( = ?auto_287113 ?auto_287114 ) ) ( not ( = ?auto_287113 ?auto_287115 ) ) ( not ( = ?auto_287113 ?auto_287116 ) ) ( not ( = ?auto_287113 ?auto_287117 ) ) ( not ( = ?auto_287113 ?auto_287118 ) ) ( not ( = ?auto_287114 ?auto_287115 ) ) ( not ( = ?auto_287114 ?auto_287116 ) ) ( not ( = ?auto_287114 ?auto_287117 ) ) ( not ( = ?auto_287114 ?auto_287118 ) ) ( not ( = ?auto_287115 ?auto_287116 ) ) ( not ( = ?auto_287115 ?auto_287117 ) ) ( not ( = ?auto_287115 ?auto_287118 ) ) ( not ( = ?auto_287116 ?auto_287117 ) ) ( not ( = ?auto_287116 ?auto_287118 ) ) ( not ( = ?auto_287117 ?auto_287118 ) ) ( ON ?auto_287117 ?auto_287118 ) ( CLEAR ?auto_287115 ) ( ON ?auto_287116 ?auto_287117 ) ( CLEAR ?auto_287116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_287105 ?auto_287106 ?auto_287107 ?auto_287108 ?auto_287109 ?auto_287110 ?auto_287111 ?auto_287112 ?auto_287113 ?auto_287114 ?auto_287115 ?auto_287116 )
      ( MAKE-14PILE ?auto_287105 ?auto_287106 ?auto_287107 ?auto_287108 ?auto_287109 ?auto_287110 ?auto_287111 ?auto_287112 ?auto_287113 ?auto_287114 ?auto_287115 ?auto_287116 ?auto_287117 ?auto_287118 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_287133 - BLOCK
      ?auto_287134 - BLOCK
      ?auto_287135 - BLOCK
      ?auto_287136 - BLOCK
      ?auto_287137 - BLOCK
      ?auto_287138 - BLOCK
      ?auto_287139 - BLOCK
      ?auto_287140 - BLOCK
      ?auto_287141 - BLOCK
      ?auto_287142 - BLOCK
      ?auto_287143 - BLOCK
      ?auto_287144 - BLOCK
      ?auto_287145 - BLOCK
      ?auto_287146 - BLOCK
    )
    :vars
    (
      ?auto_287147 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287146 ?auto_287147 ) ( ON-TABLE ?auto_287133 ) ( ON ?auto_287134 ?auto_287133 ) ( ON ?auto_287135 ?auto_287134 ) ( ON ?auto_287136 ?auto_287135 ) ( ON ?auto_287137 ?auto_287136 ) ( ON ?auto_287138 ?auto_287137 ) ( ON ?auto_287139 ?auto_287138 ) ( ON ?auto_287140 ?auto_287139 ) ( ON ?auto_287141 ?auto_287140 ) ( ON ?auto_287142 ?auto_287141 ) ( not ( = ?auto_287133 ?auto_287134 ) ) ( not ( = ?auto_287133 ?auto_287135 ) ) ( not ( = ?auto_287133 ?auto_287136 ) ) ( not ( = ?auto_287133 ?auto_287137 ) ) ( not ( = ?auto_287133 ?auto_287138 ) ) ( not ( = ?auto_287133 ?auto_287139 ) ) ( not ( = ?auto_287133 ?auto_287140 ) ) ( not ( = ?auto_287133 ?auto_287141 ) ) ( not ( = ?auto_287133 ?auto_287142 ) ) ( not ( = ?auto_287133 ?auto_287143 ) ) ( not ( = ?auto_287133 ?auto_287144 ) ) ( not ( = ?auto_287133 ?auto_287145 ) ) ( not ( = ?auto_287133 ?auto_287146 ) ) ( not ( = ?auto_287133 ?auto_287147 ) ) ( not ( = ?auto_287134 ?auto_287135 ) ) ( not ( = ?auto_287134 ?auto_287136 ) ) ( not ( = ?auto_287134 ?auto_287137 ) ) ( not ( = ?auto_287134 ?auto_287138 ) ) ( not ( = ?auto_287134 ?auto_287139 ) ) ( not ( = ?auto_287134 ?auto_287140 ) ) ( not ( = ?auto_287134 ?auto_287141 ) ) ( not ( = ?auto_287134 ?auto_287142 ) ) ( not ( = ?auto_287134 ?auto_287143 ) ) ( not ( = ?auto_287134 ?auto_287144 ) ) ( not ( = ?auto_287134 ?auto_287145 ) ) ( not ( = ?auto_287134 ?auto_287146 ) ) ( not ( = ?auto_287134 ?auto_287147 ) ) ( not ( = ?auto_287135 ?auto_287136 ) ) ( not ( = ?auto_287135 ?auto_287137 ) ) ( not ( = ?auto_287135 ?auto_287138 ) ) ( not ( = ?auto_287135 ?auto_287139 ) ) ( not ( = ?auto_287135 ?auto_287140 ) ) ( not ( = ?auto_287135 ?auto_287141 ) ) ( not ( = ?auto_287135 ?auto_287142 ) ) ( not ( = ?auto_287135 ?auto_287143 ) ) ( not ( = ?auto_287135 ?auto_287144 ) ) ( not ( = ?auto_287135 ?auto_287145 ) ) ( not ( = ?auto_287135 ?auto_287146 ) ) ( not ( = ?auto_287135 ?auto_287147 ) ) ( not ( = ?auto_287136 ?auto_287137 ) ) ( not ( = ?auto_287136 ?auto_287138 ) ) ( not ( = ?auto_287136 ?auto_287139 ) ) ( not ( = ?auto_287136 ?auto_287140 ) ) ( not ( = ?auto_287136 ?auto_287141 ) ) ( not ( = ?auto_287136 ?auto_287142 ) ) ( not ( = ?auto_287136 ?auto_287143 ) ) ( not ( = ?auto_287136 ?auto_287144 ) ) ( not ( = ?auto_287136 ?auto_287145 ) ) ( not ( = ?auto_287136 ?auto_287146 ) ) ( not ( = ?auto_287136 ?auto_287147 ) ) ( not ( = ?auto_287137 ?auto_287138 ) ) ( not ( = ?auto_287137 ?auto_287139 ) ) ( not ( = ?auto_287137 ?auto_287140 ) ) ( not ( = ?auto_287137 ?auto_287141 ) ) ( not ( = ?auto_287137 ?auto_287142 ) ) ( not ( = ?auto_287137 ?auto_287143 ) ) ( not ( = ?auto_287137 ?auto_287144 ) ) ( not ( = ?auto_287137 ?auto_287145 ) ) ( not ( = ?auto_287137 ?auto_287146 ) ) ( not ( = ?auto_287137 ?auto_287147 ) ) ( not ( = ?auto_287138 ?auto_287139 ) ) ( not ( = ?auto_287138 ?auto_287140 ) ) ( not ( = ?auto_287138 ?auto_287141 ) ) ( not ( = ?auto_287138 ?auto_287142 ) ) ( not ( = ?auto_287138 ?auto_287143 ) ) ( not ( = ?auto_287138 ?auto_287144 ) ) ( not ( = ?auto_287138 ?auto_287145 ) ) ( not ( = ?auto_287138 ?auto_287146 ) ) ( not ( = ?auto_287138 ?auto_287147 ) ) ( not ( = ?auto_287139 ?auto_287140 ) ) ( not ( = ?auto_287139 ?auto_287141 ) ) ( not ( = ?auto_287139 ?auto_287142 ) ) ( not ( = ?auto_287139 ?auto_287143 ) ) ( not ( = ?auto_287139 ?auto_287144 ) ) ( not ( = ?auto_287139 ?auto_287145 ) ) ( not ( = ?auto_287139 ?auto_287146 ) ) ( not ( = ?auto_287139 ?auto_287147 ) ) ( not ( = ?auto_287140 ?auto_287141 ) ) ( not ( = ?auto_287140 ?auto_287142 ) ) ( not ( = ?auto_287140 ?auto_287143 ) ) ( not ( = ?auto_287140 ?auto_287144 ) ) ( not ( = ?auto_287140 ?auto_287145 ) ) ( not ( = ?auto_287140 ?auto_287146 ) ) ( not ( = ?auto_287140 ?auto_287147 ) ) ( not ( = ?auto_287141 ?auto_287142 ) ) ( not ( = ?auto_287141 ?auto_287143 ) ) ( not ( = ?auto_287141 ?auto_287144 ) ) ( not ( = ?auto_287141 ?auto_287145 ) ) ( not ( = ?auto_287141 ?auto_287146 ) ) ( not ( = ?auto_287141 ?auto_287147 ) ) ( not ( = ?auto_287142 ?auto_287143 ) ) ( not ( = ?auto_287142 ?auto_287144 ) ) ( not ( = ?auto_287142 ?auto_287145 ) ) ( not ( = ?auto_287142 ?auto_287146 ) ) ( not ( = ?auto_287142 ?auto_287147 ) ) ( not ( = ?auto_287143 ?auto_287144 ) ) ( not ( = ?auto_287143 ?auto_287145 ) ) ( not ( = ?auto_287143 ?auto_287146 ) ) ( not ( = ?auto_287143 ?auto_287147 ) ) ( not ( = ?auto_287144 ?auto_287145 ) ) ( not ( = ?auto_287144 ?auto_287146 ) ) ( not ( = ?auto_287144 ?auto_287147 ) ) ( not ( = ?auto_287145 ?auto_287146 ) ) ( not ( = ?auto_287145 ?auto_287147 ) ) ( not ( = ?auto_287146 ?auto_287147 ) ) ( ON ?auto_287145 ?auto_287146 ) ( ON ?auto_287144 ?auto_287145 ) ( CLEAR ?auto_287142 ) ( ON ?auto_287143 ?auto_287144 ) ( CLEAR ?auto_287143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_287133 ?auto_287134 ?auto_287135 ?auto_287136 ?auto_287137 ?auto_287138 ?auto_287139 ?auto_287140 ?auto_287141 ?auto_287142 ?auto_287143 )
      ( MAKE-14PILE ?auto_287133 ?auto_287134 ?auto_287135 ?auto_287136 ?auto_287137 ?auto_287138 ?auto_287139 ?auto_287140 ?auto_287141 ?auto_287142 ?auto_287143 ?auto_287144 ?auto_287145 ?auto_287146 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_287162 - BLOCK
      ?auto_287163 - BLOCK
      ?auto_287164 - BLOCK
      ?auto_287165 - BLOCK
      ?auto_287166 - BLOCK
      ?auto_287167 - BLOCK
      ?auto_287168 - BLOCK
      ?auto_287169 - BLOCK
      ?auto_287170 - BLOCK
      ?auto_287171 - BLOCK
      ?auto_287172 - BLOCK
      ?auto_287173 - BLOCK
      ?auto_287174 - BLOCK
      ?auto_287175 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_287175 ) ( ON-TABLE ?auto_287162 ) ( ON ?auto_287163 ?auto_287162 ) ( ON ?auto_287164 ?auto_287163 ) ( ON ?auto_287165 ?auto_287164 ) ( ON ?auto_287166 ?auto_287165 ) ( ON ?auto_287167 ?auto_287166 ) ( ON ?auto_287168 ?auto_287167 ) ( ON ?auto_287169 ?auto_287168 ) ( ON ?auto_287170 ?auto_287169 ) ( ON ?auto_287171 ?auto_287170 ) ( not ( = ?auto_287162 ?auto_287163 ) ) ( not ( = ?auto_287162 ?auto_287164 ) ) ( not ( = ?auto_287162 ?auto_287165 ) ) ( not ( = ?auto_287162 ?auto_287166 ) ) ( not ( = ?auto_287162 ?auto_287167 ) ) ( not ( = ?auto_287162 ?auto_287168 ) ) ( not ( = ?auto_287162 ?auto_287169 ) ) ( not ( = ?auto_287162 ?auto_287170 ) ) ( not ( = ?auto_287162 ?auto_287171 ) ) ( not ( = ?auto_287162 ?auto_287172 ) ) ( not ( = ?auto_287162 ?auto_287173 ) ) ( not ( = ?auto_287162 ?auto_287174 ) ) ( not ( = ?auto_287162 ?auto_287175 ) ) ( not ( = ?auto_287163 ?auto_287164 ) ) ( not ( = ?auto_287163 ?auto_287165 ) ) ( not ( = ?auto_287163 ?auto_287166 ) ) ( not ( = ?auto_287163 ?auto_287167 ) ) ( not ( = ?auto_287163 ?auto_287168 ) ) ( not ( = ?auto_287163 ?auto_287169 ) ) ( not ( = ?auto_287163 ?auto_287170 ) ) ( not ( = ?auto_287163 ?auto_287171 ) ) ( not ( = ?auto_287163 ?auto_287172 ) ) ( not ( = ?auto_287163 ?auto_287173 ) ) ( not ( = ?auto_287163 ?auto_287174 ) ) ( not ( = ?auto_287163 ?auto_287175 ) ) ( not ( = ?auto_287164 ?auto_287165 ) ) ( not ( = ?auto_287164 ?auto_287166 ) ) ( not ( = ?auto_287164 ?auto_287167 ) ) ( not ( = ?auto_287164 ?auto_287168 ) ) ( not ( = ?auto_287164 ?auto_287169 ) ) ( not ( = ?auto_287164 ?auto_287170 ) ) ( not ( = ?auto_287164 ?auto_287171 ) ) ( not ( = ?auto_287164 ?auto_287172 ) ) ( not ( = ?auto_287164 ?auto_287173 ) ) ( not ( = ?auto_287164 ?auto_287174 ) ) ( not ( = ?auto_287164 ?auto_287175 ) ) ( not ( = ?auto_287165 ?auto_287166 ) ) ( not ( = ?auto_287165 ?auto_287167 ) ) ( not ( = ?auto_287165 ?auto_287168 ) ) ( not ( = ?auto_287165 ?auto_287169 ) ) ( not ( = ?auto_287165 ?auto_287170 ) ) ( not ( = ?auto_287165 ?auto_287171 ) ) ( not ( = ?auto_287165 ?auto_287172 ) ) ( not ( = ?auto_287165 ?auto_287173 ) ) ( not ( = ?auto_287165 ?auto_287174 ) ) ( not ( = ?auto_287165 ?auto_287175 ) ) ( not ( = ?auto_287166 ?auto_287167 ) ) ( not ( = ?auto_287166 ?auto_287168 ) ) ( not ( = ?auto_287166 ?auto_287169 ) ) ( not ( = ?auto_287166 ?auto_287170 ) ) ( not ( = ?auto_287166 ?auto_287171 ) ) ( not ( = ?auto_287166 ?auto_287172 ) ) ( not ( = ?auto_287166 ?auto_287173 ) ) ( not ( = ?auto_287166 ?auto_287174 ) ) ( not ( = ?auto_287166 ?auto_287175 ) ) ( not ( = ?auto_287167 ?auto_287168 ) ) ( not ( = ?auto_287167 ?auto_287169 ) ) ( not ( = ?auto_287167 ?auto_287170 ) ) ( not ( = ?auto_287167 ?auto_287171 ) ) ( not ( = ?auto_287167 ?auto_287172 ) ) ( not ( = ?auto_287167 ?auto_287173 ) ) ( not ( = ?auto_287167 ?auto_287174 ) ) ( not ( = ?auto_287167 ?auto_287175 ) ) ( not ( = ?auto_287168 ?auto_287169 ) ) ( not ( = ?auto_287168 ?auto_287170 ) ) ( not ( = ?auto_287168 ?auto_287171 ) ) ( not ( = ?auto_287168 ?auto_287172 ) ) ( not ( = ?auto_287168 ?auto_287173 ) ) ( not ( = ?auto_287168 ?auto_287174 ) ) ( not ( = ?auto_287168 ?auto_287175 ) ) ( not ( = ?auto_287169 ?auto_287170 ) ) ( not ( = ?auto_287169 ?auto_287171 ) ) ( not ( = ?auto_287169 ?auto_287172 ) ) ( not ( = ?auto_287169 ?auto_287173 ) ) ( not ( = ?auto_287169 ?auto_287174 ) ) ( not ( = ?auto_287169 ?auto_287175 ) ) ( not ( = ?auto_287170 ?auto_287171 ) ) ( not ( = ?auto_287170 ?auto_287172 ) ) ( not ( = ?auto_287170 ?auto_287173 ) ) ( not ( = ?auto_287170 ?auto_287174 ) ) ( not ( = ?auto_287170 ?auto_287175 ) ) ( not ( = ?auto_287171 ?auto_287172 ) ) ( not ( = ?auto_287171 ?auto_287173 ) ) ( not ( = ?auto_287171 ?auto_287174 ) ) ( not ( = ?auto_287171 ?auto_287175 ) ) ( not ( = ?auto_287172 ?auto_287173 ) ) ( not ( = ?auto_287172 ?auto_287174 ) ) ( not ( = ?auto_287172 ?auto_287175 ) ) ( not ( = ?auto_287173 ?auto_287174 ) ) ( not ( = ?auto_287173 ?auto_287175 ) ) ( not ( = ?auto_287174 ?auto_287175 ) ) ( ON ?auto_287174 ?auto_287175 ) ( ON ?auto_287173 ?auto_287174 ) ( CLEAR ?auto_287171 ) ( ON ?auto_287172 ?auto_287173 ) ( CLEAR ?auto_287172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_287162 ?auto_287163 ?auto_287164 ?auto_287165 ?auto_287166 ?auto_287167 ?auto_287168 ?auto_287169 ?auto_287170 ?auto_287171 ?auto_287172 )
      ( MAKE-14PILE ?auto_287162 ?auto_287163 ?auto_287164 ?auto_287165 ?auto_287166 ?auto_287167 ?auto_287168 ?auto_287169 ?auto_287170 ?auto_287171 ?auto_287172 ?auto_287173 ?auto_287174 ?auto_287175 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_287190 - BLOCK
      ?auto_287191 - BLOCK
      ?auto_287192 - BLOCK
      ?auto_287193 - BLOCK
      ?auto_287194 - BLOCK
      ?auto_287195 - BLOCK
      ?auto_287196 - BLOCK
      ?auto_287197 - BLOCK
      ?auto_287198 - BLOCK
      ?auto_287199 - BLOCK
      ?auto_287200 - BLOCK
      ?auto_287201 - BLOCK
      ?auto_287202 - BLOCK
      ?auto_287203 - BLOCK
    )
    :vars
    (
      ?auto_287204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287203 ?auto_287204 ) ( ON-TABLE ?auto_287190 ) ( ON ?auto_287191 ?auto_287190 ) ( ON ?auto_287192 ?auto_287191 ) ( ON ?auto_287193 ?auto_287192 ) ( ON ?auto_287194 ?auto_287193 ) ( ON ?auto_287195 ?auto_287194 ) ( ON ?auto_287196 ?auto_287195 ) ( ON ?auto_287197 ?auto_287196 ) ( ON ?auto_287198 ?auto_287197 ) ( not ( = ?auto_287190 ?auto_287191 ) ) ( not ( = ?auto_287190 ?auto_287192 ) ) ( not ( = ?auto_287190 ?auto_287193 ) ) ( not ( = ?auto_287190 ?auto_287194 ) ) ( not ( = ?auto_287190 ?auto_287195 ) ) ( not ( = ?auto_287190 ?auto_287196 ) ) ( not ( = ?auto_287190 ?auto_287197 ) ) ( not ( = ?auto_287190 ?auto_287198 ) ) ( not ( = ?auto_287190 ?auto_287199 ) ) ( not ( = ?auto_287190 ?auto_287200 ) ) ( not ( = ?auto_287190 ?auto_287201 ) ) ( not ( = ?auto_287190 ?auto_287202 ) ) ( not ( = ?auto_287190 ?auto_287203 ) ) ( not ( = ?auto_287190 ?auto_287204 ) ) ( not ( = ?auto_287191 ?auto_287192 ) ) ( not ( = ?auto_287191 ?auto_287193 ) ) ( not ( = ?auto_287191 ?auto_287194 ) ) ( not ( = ?auto_287191 ?auto_287195 ) ) ( not ( = ?auto_287191 ?auto_287196 ) ) ( not ( = ?auto_287191 ?auto_287197 ) ) ( not ( = ?auto_287191 ?auto_287198 ) ) ( not ( = ?auto_287191 ?auto_287199 ) ) ( not ( = ?auto_287191 ?auto_287200 ) ) ( not ( = ?auto_287191 ?auto_287201 ) ) ( not ( = ?auto_287191 ?auto_287202 ) ) ( not ( = ?auto_287191 ?auto_287203 ) ) ( not ( = ?auto_287191 ?auto_287204 ) ) ( not ( = ?auto_287192 ?auto_287193 ) ) ( not ( = ?auto_287192 ?auto_287194 ) ) ( not ( = ?auto_287192 ?auto_287195 ) ) ( not ( = ?auto_287192 ?auto_287196 ) ) ( not ( = ?auto_287192 ?auto_287197 ) ) ( not ( = ?auto_287192 ?auto_287198 ) ) ( not ( = ?auto_287192 ?auto_287199 ) ) ( not ( = ?auto_287192 ?auto_287200 ) ) ( not ( = ?auto_287192 ?auto_287201 ) ) ( not ( = ?auto_287192 ?auto_287202 ) ) ( not ( = ?auto_287192 ?auto_287203 ) ) ( not ( = ?auto_287192 ?auto_287204 ) ) ( not ( = ?auto_287193 ?auto_287194 ) ) ( not ( = ?auto_287193 ?auto_287195 ) ) ( not ( = ?auto_287193 ?auto_287196 ) ) ( not ( = ?auto_287193 ?auto_287197 ) ) ( not ( = ?auto_287193 ?auto_287198 ) ) ( not ( = ?auto_287193 ?auto_287199 ) ) ( not ( = ?auto_287193 ?auto_287200 ) ) ( not ( = ?auto_287193 ?auto_287201 ) ) ( not ( = ?auto_287193 ?auto_287202 ) ) ( not ( = ?auto_287193 ?auto_287203 ) ) ( not ( = ?auto_287193 ?auto_287204 ) ) ( not ( = ?auto_287194 ?auto_287195 ) ) ( not ( = ?auto_287194 ?auto_287196 ) ) ( not ( = ?auto_287194 ?auto_287197 ) ) ( not ( = ?auto_287194 ?auto_287198 ) ) ( not ( = ?auto_287194 ?auto_287199 ) ) ( not ( = ?auto_287194 ?auto_287200 ) ) ( not ( = ?auto_287194 ?auto_287201 ) ) ( not ( = ?auto_287194 ?auto_287202 ) ) ( not ( = ?auto_287194 ?auto_287203 ) ) ( not ( = ?auto_287194 ?auto_287204 ) ) ( not ( = ?auto_287195 ?auto_287196 ) ) ( not ( = ?auto_287195 ?auto_287197 ) ) ( not ( = ?auto_287195 ?auto_287198 ) ) ( not ( = ?auto_287195 ?auto_287199 ) ) ( not ( = ?auto_287195 ?auto_287200 ) ) ( not ( = ?auto_287195 ?auto_287201 ) ) ( not ( = ?auto_287195 ?auto_287202 ) ) ( not ( = ?auto_287195 ?auto_287203 ) ) ( not ( = ?auto_287195 ?auto_287204 ) ) ( not ( = ?auto_287196 ?auto_287197 ) ) ( not ( = ?auto_287196 ?auto_287198 ) ) ( not ( = ?auto_287196 ?auto_287199 ) ) ( not ( = ?auto_287196 ?auto_287200 ) ) ( not ( = ?auto_287196 ?auto_287201 ) ) ( not ( = ?auto_287196 ?auto_287202 ) ) ( not ( = ?auto_287196 ?auto_287203 ) ) ( not ( = ?auto_287196 ?auto_287204 ) ) ( not ( = ?auto_287197 ?auto_287198 ) ) ( not ( = ?auto_287197 ?auto_287199 ) ) ( not ( = ?auto_287197 ?auto_287200 ) ) ( not ( = ?auto_287197 ?auto_287201 ) ) ( not ( = ?auto_287197 ?auto_287202 ) ) ( not ( = ?auto_287197 ?auto_287203 ) ) ( not ( = ?auto_287197 ?auto_287204 ) ) ( not ( = ?auto_287198 ?auto_287199 ) ) ( not ( = ?auto_287198 ?auto_287200 ) ) ( not ( = ?auto_287198 ?auto_287201 ) ) ( not ( = ?auto_287198 ?auto_287202 ) ) ( not ( = ?auto_287198 ?auto_287203 ) ) ( not ( = ?auto_287198 ?auto_287204 ) ) ( not ( = ?auto_287199 ?auto_287200 ) ) ( not ( = ?auto_287199 ?auto_287201 ) ) ( not ( = ?auto_287199 ?auto_287202 ) ) ( not ( = ?auto_287199 ?auto_287203 ) ) ( not ( = ?auto_287199 ?auto_287204 ) ) ( not ( = ?auto_287200 ?auto_287201 ) ) ( not ( = ?auto_287200 ?auto_287202 ) ) ( not ( = ?auto_287200 ?auto_287203 ) ) ( not ( = ?auto_287200 ?auto_287204 ) ) ( not ( = ?auto_287201 ?auto_287202 ) ) ( not ( = ?auto_287201 ?auto_287203 ) ) ( not ( = ?auto_287201 ?auto_287204 ) ) ( not ( = ?auto_287202 ?auto_287203 ) ) ( not ( = ?auto_287202 ?auto_287204 ) ) ( not ( = ?auto_287203 ?auto_287204 ) ) ( ON ?auto_287202 ?auto_287203 ) ( ON ?auto_287201 ?auto_287202 ) ( ON ?auto_287200 ?auto_287201 ) ( CLEAR ?auto_287198 ) ( ON ?auto_287199 ?auto_287200 ) ( CLEAR ?auto_287199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_287190 ?auto_287191 ?auto_287192 ?auto_287193 ?auto_287194 ?auto_287195 ?auto_287196 ?auto_287197 ?auto_287198 ?auto_287199 )
      ( MAKE-14PILE ?auto_287190 ?auto_287191 ?auto_287192 ?auto_287193 ?auto_287194 ?auto_287195 ?auto_287196 ?auto_287197 ?auto_287198 ?auto_287199 ?auto_287200 ?auto_287201 ?auto_287202 ?auto_287203 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_287219 - BLOCK
      ?auto_287220 - BLOCK
      ?auto_287221 - BLOCK
      ?auto_287222 - BLOCK
      ?auto_287223 - BLOCK
      ?auto_287224 - BLOCK
      ?auto_287225 - BLOCK
      ?auto_287226 - BLOCK
      ?auto_287227 - BLOCK
      ?auto_287228 - BLOCK
      ?auto_287229 - BLOCK
      ?auto_287230 - BLOCK
      ?auto_287231 - BLOCK
      ?auto_287232 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_287232 ) ( ON-TABLE ?auto_287219 ) ( ON ?auto_287220 ?auto_287219 ) ( ON ?auto_287221 ?auto_287220 ) ( ON ?auto_287222 ?auto_287221 ) ( ON ?auto_287223 ?auto_287222 ) ( ON ?auto_287224 ?auto_287223 ) ( ON ?auto_287225 ?auto_287224 ) ( ON ?auto_287226 ?auto_287225 ) ( ON ?auto_287227 ?auto_287226 ) ( not ( = ?auto_287219 ?auto_287220 ) ) ( not ( = ?auto_287219 ?auto_287221 ) ) ( not ( = ?auto_287219 ?auto_287222 ) ) ( not ( = ?auto_287219 ?auto_287223 ) ) ( not ( = ?auto_287219 ?auto_287224 ) ) ( not ( = ?auto_287219 ?auto_287225 ) ) ( not ( = ?auto_287219 ?auto_287226 ) ) ( not ( = ?auto_287219 ?auto_287227 ) ) ( not ( = ?auto_287219 ?auto_287228 ) ) ( not ( = ?auto_287219 ?auto_287229 ) ) ( not ( = ?auto_287219 ?auto_287230 ) ) ( not ( = ?auto_287219 ?auto_287231 ) ) ( not ( = ?auto_287219 ?auto_287232 ) ) ( not ( = ?auto_287220 ?auto_287221 ) ) ( not ( = ?auto_287220 ?auto_287222 ) ) ( not ( = ?auto_287220 ?auto_287223 ) ) ( not ( = ?auto_287220 ?auto_287224 ) ) ( not ( = ?auto_287220 ?auto_287225 ) ) ( not ( = ?auto_287220 ?auto_287226 ) ) ( not ( = ?auto_287220 ?auto_287227 ) ) ( not ( = ?auto_287220 ?auto_287228 ) ) ( not ( = ?auto_287220 ?auto_287229 ) ) ( not ( = ?auto_287220 ?auto_287230 ) ) ( not ( = ?auto_287220 ?auto_287231 ) ) ( not ( = ?auto_287220 ?auto_287232 ) ) ( not ( = ?auto_287221 ?auto_287222 ) ) ( not ( = ?auto_287221 ?auto_287223 ) ) ( not ( = ?auto_287221 ?auto_287224 ) ) ( not ( = ?auto_287221 ?auto_287225 ) ) ( not ( = ?auto_287221 ?auto_287226 ) ) ( not ( = ?auto_287221 ?auto_287227 ) ) ( not ( = ?auto_287221 ?auto_287228 ) ) ( not ( = ?auto_287221 ?auto_287229 ) ) ( not ( = ?auto_287221 ?auto_287230 ) ) ( not ( = ?auto_287221 ?auto_287231 ) ) ( not ( = ?auto_287221 ?auto_287232 ) ) ( not ( = ?auto_287222 ?auto_287223 ) ) ( not ( = ?auto_287222 ?auto_287224 ) ) ( not ( = ?auto_287222 ?auto_287225 ) ) ( not ( = ?auto_287222 ?auto_287226 ) ) ( not ( = ?auto_287222 ?auto_287227 ) ) ( not ( = ?auto_287222 ?auto_287228 ) ) ( not ( = ?auto_287222 ?auto_287229 ) ) ( not ( = ?auto_287222 ?auto_287230 ) ) ( not ( = ?auto_287222 ?auto_287231 ) ) ( not ( = ?auto_287222 ?auto_287232 ) ) ( not ( = ?auto_287223 ?auto_287224 ) ) ( not ( = ?auto_287223 ?auto_287225 ) ) ( not ( = ?auto_287223 ?auto_287226 ) ) ( not ( = ?auto_287223 ?auto_287227 ) ) ( not ( = ?auto_287223 ?auto_287228 ) ) ( not ( = ?auto_287223 ?auto_287229 ) ) ( not ( = ?auto_287223 ?auto_287230 ) ) ( not ( = ?auto_287223 ?auto_287231 ) ) ( not ( = ?auto_287223 ?auto_287232 ) ) ( not ( = ?auto_287224 ?auto_287225 ) ) ( not ( = ?auto_287224 ?auto_287226 ) ) ( not ( = ?auto_287224 ?auto_287227 ) ) ( not ( = ?auto_287224 ?auto_287228 ) ) ( not ( = ?auto_287224 ?auto_287229 ) ) ( not ( = ?auto_287224 ?auto_287230 ) ) ( not ( = ?auto_287224 ?auto_287231 ) ) ( not ( = ?auto_287224 ?auto_287232 ) ) ( not ( = ?auto_287225 ?auto_287226 ) ) ( not ( = ?auto_287225 ?auto_287227 ) ) ( not ( = ?auto_287225 ?auto_287228 ) ) ( not ( = ?auto_287225 ?auto_287229 ) ) ( not ( = ?auto_287225 ?auto_287230 ) ) ( not ( = ?auto_287225 ?auto_287231 ) ) ( not ( = ?auto_287225 ?auto_287232 ) ) ( not ( = ?auto_287226 ?auto_287227 ) ) ( not ( = ?auto_287226 ?auto_287228 ) ) ( not ( = ?auto_287226 ?auto_287229 ) ) ( not ( = ?auto_287226 ?auto_287230 ) ) ( not ( = ?auto_287226 ?auto_287231 ) ) ( not ( = ?auto_287226 ?auto_287232 ) ) ( not ( = ?auto_287227 ?auto_287228 ) ) ( not ( = ?auto_287227 ?auto_287229 ) ) ( not ( = ?auto_287227 ?auto_287230 ) ) ( not ( = ?auto_287227 ?auto_287231 ) ) ( not ( = ?auto_287227 ?auto_287232 ) ) ( not ( = ?auto_287228 ?auto_287229 ) ) ( not ( = ?auto_287228 ?auto_287230 ) ) ( not ( = ?auto_287228 ?auto_287231 ) ) ( not ( = ?auto_287228 ?auto_287232 ) ) ( not ( = ?auto_287229 ?auto_287230 ) ) ( not ( = ?auto_287229 ?auto_287231 ) ) ( not ( = ?auto_287229 ?auto_287232 ) ) ( not ( = ?auto_287230 ?auto_287231 ) ) ( not ( = ?auto_287230 ?auto_287232 ) ) ( not ( = ?auto_287231 ?auto_287232 ) ) ( ON ?auto_287231 ?auto_287232 ) ( ON ?auto_287230 ?auto_287231 ) ( ON ?auto_287229 ?auto_287230 ) ( CLEAR ?auto_287227 ) ( ON ?auto_287228 ?auto_287229 ) ( CLEAR ?auto_287228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_287219 ?auto_287220 ?auto_287221 ?auto_287222 ?auto_287223 ?auto_287224 ?auto_287225 ?auto_287226 ?auto_287227 ?auto_287228 )
      ( MAKE-14PILE ?auto_287219 ?auto_287220 ?auto_287221 ?auto_287222 ?auto_287223 ?auto_287224 ?auto_287225 ?auto_287226 ?auto_287227 ?auto_287228 ?auto_287229 ?auto_287230 ?auto_287231 ?auto_287232 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_287247 - BLOCK
      ?auto_287248 - BLOCK
      ?auto_287249 - BLOCK
      ?auto_287250 - BLOCK
      ?auto_287251 - BLOCK
      ?auto_287252 - BLOCK
      ?auto_287253 - BLOCK
      ?auto_287254 - BLOCK
      ?auto_287255 - BLOCK
      ?auto_287256 - BLOCK
      ?auto_287257 - BLOCK
      ?auto_287258 - BLOCK
      ?auto_287259 - BLOCK
      ?auto_287260 - BLOCK
    )
    :vars
    (
      ?auto_287261 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287260 ?auto_287261 ) ( ON-TABLE ?auto_287247 ) ( ON ?auto_287248 ?auto_287247 ) ( ON ?auto_287249 ?auto_287248 ) ( ON ?auto_287250 ?auto_287249 ) ( ON ?auto_287251 ?auto_287250 ) ( ON ?auto_287252 ?auto_287251 ) ( ON ?auto_287253 ?auto_287252 ) ( ON ?auto_287254 ?auto_287253 ) ( not ( = ?auto_287247 ?auto_287248 ) ) ( not ( = ?auto_287247 ?auto_287249 ) ) ( not ( = ?auto_287247 ?auto_287250 ) ) ( not ( = ?auto_287247 ?auto_287251 ) ) ( not ( = ?auto_287247 ?auto_287252 ) ) ( not ( = ?auto_287247 ?auto_287253 ) ) ( not ( = ?auto_287247 ?auto_287254 ) ) ( not ( = ?auto_287247 ?auto_287255 ) ) ( not ( = ?auto_287247 ?auto_287256 ) ) ( not ( = ?auto_287247 ?auto_287257 ) ) ( not ( = ?auto_287247 ?auto_287258 ) ) ( not ( = ?auto_287247 ?auto_287259 ) ) ( not ( = ?auto_287247 ?auto_287260 ) ) ( not ( = ?auto_287247 ?auto_287261 ) ) ( not ( = ?auto_287248 ?auto_287249 ) ) ( not ( = ?auto_287248 ?auto_287250 ) ) ( not ( = ?auto_287248 ?auto_287251 ) ) ( not ( = ?auto_287248 ?auto_287252 ) ) ( not ( = ?auto_287248 ?auto_287253 ) ) ( not ( = ?auto_287248 ?auto_287254 ) ) ( not ( = ?auto_287248 ?auto_287255 ) ) ( not ( = ?auto_287248 ?auto_287256 ) ) ( not ( = ?auto_287248 ?auto_287257 ) ) ( not ( = ?auto_287248 ?auto_287258 ) ) ( not ( = ?auto_287248 ?auto_287259 ) ) ( not ( = ?auto_287248 ?auto_287260 ) ) ( not ( = ?auto_287248 ?auto_287261 ) ) ( not ( = ?auto_287249 ?auto_287250 ) ) ( not ( = ?auto_287249 ?auto_287251 ) ) ( not ( = ?auto_287249 ?auto_287252 ) ) ( not ( = ?auto_287249 ?auto_287253 ) ) ( not ( = ?auto_287249 ?auto_287254 ) ) ( not ( = ?auto_287249 ?auto_287255 ) ) ( not ( = ?auto_287249 ?auto_287256 ) ) ( not ( = ?auto_287249 ?auto_287257 ) ) ( not ( = ?auto_287249 ?auto_287258 ) ) ( not ( = ?auto_287249 ?auto_287259 ) ) ( not ( = ?auto_287249 ?auto_287260 ) ) ( not ( = ?auto_287249 ?auto_287261 ) ) ( not ( = ?auto_287250 ?auto_287251 ) ) ( not ( = ?auto_287250 ?auto_287252 ) ) ( not ( = ?auto_287250 ?auto_287253 ) ) ( not ( = ?auto_287250 ?auto_287254 ) ) ( not ( = ?auto_287250 ?auto_287255 ) ) ( not ( = ?auto_287250 ?auto_287256 ) ) ( not ( = ?auto_287250 ?auto_287257 ) ) ( not ( = ?auto_287250 ?auto_287258 ) ) ( not ( = ?auto_287250 ?auto_287259 ) ) ( not ( = ?auto_287250 ?auto_287260 ) ) ( not ( = ?auto_287250 ?auto_287261 ) ) ( not ( = ?auto_287251 ?auto_287252 ) ) ( not ( = ?auto_287251 ?auto_287253 ) ) ( not ( = ?auto_287251 ?auto_287254 ) ) ( not ( = ?auto_287251 ?auto_287255 ) ) ( not ( = ?auto_287251 ?auto_287256 ) ) ( not ( = ?auto_287251 ?auto_287257 ) ) ( not ( = ?auto_287251 ?auto_287258 ) ) ( not ( = ?auto_287251 ?auto_287259 ) ) ( not ( = ?auto_287251 ?auto_287260 ) ) ( not ( = ?auto_287251 ?auto_287261 ) ) ( not ( = ?auto_287252 ?auto_287253 ) ) ( not ( = ?auto_287252 ?auto_287254 ) ) ( not ( = ?auto_287252 ?auto_287255 ) ) ( not ( = ?auto_287252 ?auto_287256 ) ) ( not ( = ?auto_287252 ?auto_287257 ) ) ( not ( = ?auto_287252 ?auto_287258 ) ) ( not ( = ?auto_287252 ?auto_287259 ) ) ( not ( = ?auto_287252 ?auto_287260 ) ) ( not ( = ?auto_287252 ?auto_287261 ) ) ( not ( = ?auto_287253 ?auto_287254 ) ) ( not ( = ?auto_287253 ?auto_287255 ) ) ( not ( = ?auto_287253 ?auto_287256 ) ) ( not ( = ?auto_287253 ?auto_287257 ) ) ( not ( = ?auto_287253 ?auto_287258 ) ) ( not ( = ?auto_287253 ?auto_287259 ) ) ( not ( = ?auto_287253 ?auto_287260 ) ) ( not ( = ?auto_287253 ?auto_287261 ) ) ( not ( = ?auto_287254 ?auto_287255 ) ) ( not ( = ?auto_287254 ?auto_287256 ) ) ( not ( = ?auto_287254 ?auto_287257 ) ) ( not ( = ?auto_287254 ?auto_287258 ) ) ( not ( = ?auto_287254 ?auto_287259 ) ) ( not ( = ?auto_287254 ?auto_287260 ) ) ( not ( = ?auto_287254 ?auto_287261 ) ) ( not ( = ?auto_287255 ?auto_287256 ) ) ( not ( = ?auto_287255 ?auto_287257 ) ) ( not ( = ?auto_287255 ?auto_287258 ) ) ( not ( = ?auto_287255 ?auto_287259 ) ) ( not ( = ?auto_287255 ?auto_287260 ) ) ( not ( = ?auto_287255 ?auto_287261 ) ) ( not ( = ?auto_287256 ?auto_287257 ) ) ( not ( = ?auto_287256 ?auto_287258 ) ) ( not ( = ?auto_287256 ?auto_287259 ) ) ( not ( = ?auto_287256 ?auto_287260 ) ) ( not ( = ?auto_287256 ?auto_287261 ) ) ( not ( = ?auto_287257 ?auto_287258 ) ) ( not ( = ?auto_287257 ?auto_287259 ) ) ( not ( = ?auto_287257 ?auto_287260 ) ) ( not ( = ?auto_287257 ?auto_287261 ) ) ( not ( = ?auto_287258 ?auto_287259 ) ) ( not ( = ?auto_287258 ?auto_287260 ) ) ( not ( = ?auto_287258 ?auto_287261 ) ) ( not ( = ?auto_287259 ?auto_287260 ) ) ( not ( = ?auto_287259 ?auto_287261 ) ) ( not ( = ?auto_287260 ?auto_287261 ) ) ( ON ?auto_287259 ?auto_287260 ) ( ON ?auto_287258 ?auto_287259 ) ( ON ?auto_287257 ?auto_287258 ) ( ON ?auto_287256 ?auto_287257 ) ( CLEAR ?auto_287254 ) ( ON ?auto_287255 ?auto_287256 ) ( CLEAR ?auto_287255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_287247 ?auto_287248 ?auto_287249 ?auto_287250 ?auto_287251 ?auto_287252 ?auto_287253 ?auto_287254 ?auto_287255 )
      ( MAKE-14PILE ?auto_287247 ?auto_287248 ?auto_287249 ?auto_287250 ?auto_287251 ?auto_287252 ?auto_287253 ?auto_287254 ?auto_287255 ?auto_287256 ?auto_287257 ?auto_287258 ?auto_287259 ?auto_287260 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_287276 - BLOCK
      ?auto_287277 - BLOCK
      ?auto_287278 - BLOCK
      ?auto_287279 - BLOCK
      ?auto_287280 - BLOCK
      ?auto_287281 - BLOCK
      ?auto_287282 - BLOCK
      ?auto_287283 - BLOCK
      ?auto_287284 - BLOCK
      ?auto_287285 - BLOCK
      ?auto_287286 - BLOCK
      ?auto_287287 - BLOCK
      ?auto_287288 - BLOCK
      ?auto_287289 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_287289 ) ( ON-TABLE ?auto_287276 ) ( ON ?auto_287277 ?auto_287276 ) ( ON ?auto_287278 ?auto_287277 ) ( ON ?auto_287279 ?auto_287278 ) ( ON ?auto_287280 ?auto_287279 ) ( ON ?auto_287281 ?auto_287280 ) ( ON ?auto_287282 ?auto_287281 ) ( ON ?auto_287283 ?auto_287282 ) ( not ( = ?auto_287276 ?auto_287277 ) ) ( not ( = ?auto_287276 ?auto_287278 ) ) ( not ( = ?auto_287276 ?auto_287279 ) ) ( not ( = ?auto_287276 ?auto_287280 ) ) ( not ( = ?auto_287276 ?auto_287281 ) ) ( not ( = ?auto_287276 ?auto_287282 ) ) ( not ( = ?auto_287276 ?auto_287283 ) ) ( not ( = ?auto_287276 ?auto_287284 ) ) ( not ( = ?auto_287276 ?auto_287285 ) ) ( not ( = ?auto_287276 ?auto_287286 ) ) ( not ( = ?auto_287276 ?auto_287287 ) ) ( not ( = ?auto_287276 ?auto_287288 ) ) ( not ( = ?auto_287276 ?auto_287289 ) ) ( not ( = ?auto_287277 ?auto_287278 ) ) ( not ( = ?auto_287277 ?auto_287279 ) ) ( not ( = ?auto_287277 ?auto_287280 ) ) ( not ( = ?auto_287277 ?auto_287281 ) ) ( not ( = ?auto_287277 ?auto_287282 ) ) ( not ( = ?auto_287277 ?auto_287283 ) ) ( not ( = ?auto_287277 ?auto_287284 ) ) ( not ( = ?auto_287277 ?auto_287285 ) ) ( not ( = ?auto_287277 ?auto_287286 ) ) ( not ( = ?auto_287277 ?auto_287287 ) ) ( not ( = ?auto_287277 ?auto_287288 ) ) ( not ( = ?auto_287277 ?auto_287289 ) ) ( not ( = ?auto_287278 ?auto_287279 ) ) ( not ( = ?auto_287278 ?auto_287280 ) ) ( not ( = ?auto_287278 ?auto_287281 ) ) ( not ( = ?auto_287278 ?auto_287282 ) ) ( not ( = ?auto_287278 ?auto_287283 ) ) ( not ( = ?auto_287278 ?auto_287284 ) ) ( not ( = ?auto_287278 ?auto_287285 ) ) ( not ( = ?auto_287278 ?auto_287286 ) ) ( not ( = ?auto_287278 ?auto_287287 ) ) ( not ( = ?auto_287278 ?auto_287288 ) ) ( not ( = ?auto_287278 ?auto_287289 ) ) ( not ( = ?auto_287279 ?auto_287280 ) ) ( not ( = ?auto_287279 ?auto_287281 ) ) ( not ( = ?auto_287279 ?auto_287282 ) ) ( not ( = ?auto_287279 ?auto_287283 ) ) ( not ( = ?auto_287279 ?auto_287284 ) ) ( not ( = ?auto_287279 ?auto_287285 ) ) ( not ( = ?auto_287279 ?auto_287286 ) ) ( not ( = ?auto_287279 ?auto_287287 ) ) ( not ( = ?auto_287279 ?auto_287288 ) ) ( not ( = ?auto_287279 ?auto_287289 ) ) ( not ( = ?auto_287280 ?auto_287281 ) ) ( not ( = ?auto_287280 ?auto_287282 ) ) ( not ( = ?auto_287280 ?auto_287283 ) ) ( not ( = ?auto_287280 ?auto_287284 ) ) ( not ( = ?auto_287280 ?auto_287285 ) ) ( not ( = ?auto_287280 ?auto_287286 ) ) ( not ( = ?auto_287280 ?auto_287287 ) ) ( not ( = ?auto_287280 ?auto_287288 ) ) ( not ( = ?auto_287280 ?auto_287289 ) ) ( not ( = ?auto_287281 ?auto_287282 ) ) ( not ( = ?auto_287281 ?auto_287283 ) ) ( not ( = ?auto_287281 ?auto_287284 ) ) ( not ( = ?auto_287281 ?auto_287285 ) ) ( not ( = ?auto_287281 ?auto_287286 ) ) ( not ( = ?auto_287281 ?auto_287287 ) ) ( not ( = ?auto_287281 ?auto_287288 ) ) ( not ( = ?auto_287281 ?auto_287289 ) ) ( not ( = ?auto_287282 ?auto_287283 ) ) ( not ( = ?auto_287282 ?auto_287284 ) ) ( not ( = ?auto_287282 ?auto_287285 ) ) ( not ( = ?auto_287282 ?auto_287286 ) ) ( not ( = ?auto_287282 ?auto_287287 ) ) ( not ( = ?auto_287282 ?auto_287288 ) ) ( not ( = ?auto_287282 ?auto_287289 ) ) ( not ( = ?auto_287283 ?auto_287284 ) ) ( not ( = ?auto_287283 ?auto_287285 ) ) ( not ( = ?auto_287283 ?auto_287286 ) ) ( not ( = ?auto_287283 ?auto_287287 ) ) ( not ( = ?auto_287283 ?auto_287288 ) ) ( not ( = ?auto_287283 ?auto_287289 ) ) ( not ( = ?auto_287284 ?auto_287285 ) ) ( not ( = ?auto_287284 ?auto_287286 ) ) ( not ( = ?auto_287284 ?auto_287287 ) ) ( not ( = ?auto_287284 ?auto_287288 ) ) ( not ( = ?auto_287284 ?auto_287289 ) ) ( not ( = ?auto_287285 ?auto_287286 ) ) ( not ( = ?auto_287285 ?auto_287287 ) ) ( not ( = ?auto_287285 ?auto_287288 ) ) ( not ( = ?auto_287285 ?auto_287289 ) ) ( not ( = ?auto_287286 ?auto_287287 ) ) ( not ( = ?auto_287286 ?auto_287288 ) ) ( not ( = ?auto_287286 ?auto_287289 ) ) ( not ( = ?auto_287287 ?auto_287288 ) ) ( not ( = ?auto_287287 ?auto_287289 ) ) ( not ( = ?auto_287288 ?auto_287289 ) ) ( ON ?auto_287288 ?auto_287289 ) ( ON ?auto_287287 ?auto_287288 ) ( ON ?auto_287286 ?auto_287287 ) ( ON ?auto_287285 ?auto_287286 ) ( CLEAR ?auto_287283 ) ( ON ?auto_287284 ?auto_287285 ) ( CLEAR ?auto_287284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_287276 ?auto_287277 ?auto_287278 ?auto_287279 ?auto_287280 ?auto_287281 ?auto_287282 ?auto_287283 ?auto_287284 )
      ( MAKE-14PILE ?auto_287276 ?auto_287277 ?auto_287278 ?auto_287279 ?auto_287280 ?auto_287281 ?auto_287282 ?auto_287283 ?auto_287284 ?auto_287285 ?auto_287286 ?auto_287287 ?auto_287288 ?auto_287289 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_287304 - BLOCK
      ?auto_287305 - BLOCK
      ?auto_287306 - BLOCK
      ?auto_287307 - BLOCK
      ?auto_287308 - BLOCK
      ?auto_287309 - BLOCK
      ?auto_287310 - BLOCK
      ?auto_287311 - BLOCK
      ?auto_287312 - BLOCK
      ?auto_287313 - BLOCK
      ?auto_287314 - BLOCK
      ?auto_287315 - BLOCK
      ?auto_287316 - BLOCK
      ?auto_287317 - BLOCK
    )
    :vars
    (
      ?auto_287318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287317 ?auto_287318 ) ( ON-TABLE ?auto_287304 ) ( ON ?auto_287305 ?auto_287304 ) ( ON ?auto_287306 ?auto_287305 ) ( ON ?auto_287307 ?auto_287306 ) ( ON ?auto_287308 ?auto_287307 ) ( ON ?auto_287309 ?auto_287308 ) ( ON ?auto_287310 ?auto_287309 ) ( not ( = ?auto_287304 ?auto_287305 ) ) ( not ( = ?auto_287304 ?auto_287306 ) ) ( not ( = ?auto_287304 ?auto_287307 ) ) ( not ( = ?auto_287304 ?auto_287308 ) ) ( not ( = ?auto_287304 ?auto_287309 ) ) ( not ( = ?auto_287304 ?auto_287310 ) ) ( not ( = ?auto_287304 ?auto_287311 ) ) ( not ( = ?auto_287304 ?auto_287312 ) ) ( not ( = ?auto_287304 ?auto_287313 ) ) ( not ( = ?auto_287304 ?auto_287314 ) ) ( not ( = ?auto_287304 ?auto_287315 ) ) ( not ( = ?auto_287304 ?auto_287316 ) ) ( not ( = ?auto_287304 ?auto_287317 ) ) ( not ( = ?auto_287304 ?auto_287318 ) ) ( not ( = ?auto_287305 ?auto_287306 ) ) ( not ( = ?auto_287305 ?auto_287307 ) ) ( not ( = ?auto_287305 ?auto_287308 ) ) ( not ( = ?auto_287305 ?auto_287309 ) ) ( not ( = ?auto_287305 ?auto_287310 ) ) ( not ( = ?auto_287305 ?auto_287311 ) ) ( not ( = ?auto_287305 ?auto_287312 ) ) ( not ( = ?auto_287305 ?auto_287313 ) ) ( not ( = ?auto_287305 ?auto_287314 ) ) ( not ( = ?auto_287305 ?auto_287315 ) ) ( not ( = ?auto_287305 ?auto_287316 ) ) ( not ( = ?auto_287305 ?auto_287317 ) ) ( not ( = ?auto_287305 ?auto_287318 ) ) ( not ( = ?auto_287306 ?auto_287307 ) ) ( not ( = ?auto_287306 ?auto_287308 ) ) ( not ( = ?auto_287306 ?auto_287309 ) ) ( not ( = ?auto_287306 ?auto_287310 ) ) ( not ( = ?auto_287306 ?auto_287311 ) ) ( not ( = ?auto_287306 ?auto_287312 ) ) ( not ( = ?auto_287306 ?auto_287313 ) ) ( not ( = ?auto_287306 ?auto_287314 ) ) ( not ( = ?auto_287306 ?auto_287315 ) ) ( not ( = ?auto_287306 ?auto_287316 ) ) ( not ( = ?auto_287306 ?auto_287317 ) ) ( not ( = ?auto_287306 ?auto_287318 ) ) ( not ( = ?auto_287307 ?auto_287308 ) ) ( not ( = ?auto_287307 ?auto_287309 ) ) ( not ( = ?auto_287307 ?auto_287310 ) ) ( not ( = ?auto_287307 ?auto_287311 ) ) ( not ( = ?auto_287307 ?auto_287312 ) ) ( not ( = ?auto_287307 ?auto_287313 ) ) ( not ( = ?auto_287307 ?auto_287314 ) ) ( not ( = ?auto_287307 ?auto_287315 ) ) ( not ( = ?auto_287307 ?auto_287316 ) ) ( not ( = ?auto_287307 ?auto_287317 ) ) ( not ( = ?auto_287307 ?auto_287318 ) ) ( not ( = ?auto_287308 ?auto_287309 ) ) ( not ( = ?auto_287308 ?auto_287310 ) ) ( not ( = ?auto_287308 ?auto_287311 ) ) ( not ( = ?auto_287308 ?auto_287312 ) ) ( not ( = ?auto_287308 ?auto_287313 ) ) ( not ( = ?auto_287308 ?auto_287314 ) ) ( not ( = ?auto_287308 ?auto_287315 ) ) ( not ( = ?auto_287308 ?auto_287316 ) ) ( not ( = ?auto_287308 ?auto_287317 ) ) ( not ( = ?auto_287308 ?auto_287318 ) ) ( not ( = ?auto_287309 ?auto_287310 ) ) ( not ( = ?auto_287309 ?auto_287311 ) ) ( not ( = ?auto_287309 ?auto_287312 ) ) ( not ( = ?auto_287309 ?auto_287313 ) ) ( not ( = ?auto_287309 ?auto_287314 ) ) ( not ( = ?auto_287309 ?auto_287315 ) ) ( not ( = ?auto_287309 ?auto_287316 ) ) ( not ( = ?auto_287309 ?auto_287317 ) ) ( not ( = ?auto_287309 ?auto_287318 ) ) ( not ( = ?auto_287310 ?auto_287311 ) ) ( not ( = ?auto_287310 ?auto_287312 ) ) ( not ( = ?auto_287310 ?auto_287313 ) ) ( not ( = ?auto_287310 ?auto_287314 ) ) ( not ( = ?auto_287310 ?auto_287315 ) ) ( not ( = ?auto_287310 ?auto_287316 ) ) ( not ( = ?auto_287310 ?auto_287317 ) ) ( not ( = ?auto_287310 ?auto_287318 ) ) ( not ( = ?auto_287311 ?auto_287312 ) ) ( not ( = ?auto_287311 ?auto_287313 ) ) ( not ( = ?auto_287311 ?auto_287314 ) ) ( not ( = ?auto_287311 ?auto_287315 ) ) ( not ( = ?auto_287311 ?auto_287316 ) ) ( not ( = ?auto_287311 ?auto_287317 ) ) ( not ( = ?auto_287311 ?auto_287318 ) ) ( not ( = ?auto_287312 ?auto_287313 ) ) ( not ( = ?auto_287312 ?auto_287314 ) ) ( not ( = ?auto_287312 ?auto_287315 ) ) ( not ( = ?auto_287312 ?auto_287316 ) ) ( not ( = ?auto_287312 ?auto_287317 ) ) ( not ( = ?auto_287312 ?auto_287318 ) ) ( not ( = ?auto_287313 ?auto_287314 ) ) ( not ( = ?auto_287313 ?auto_287315 ) ) ( not ( = ?auto_287313 ?auto_287316 ) ) ( not ( = ?auto_287313 ?auto_287317 ) ) ( not ( = ?auto_287313 ?auto_287318 ) ) ( not ( = ?auto_287314 ?auto_287315 ) ) ( not ( = ?auto_287314 ?auto_287316 ) ) ( not ( = ?auto_287314 ?auto_287317 ) ) ( not ( = ?auto_287314 ?auto_287318 ) ) ( not ( = ?auto_287315 ?auto_287316 ) ) ( not ( = ?auto_287315 ?auto_287317 ) ) ( not ( = ?auto_287315 ?auto_287318 ) ) ( not ( = ?auto_287316 ?auto_287317 ) ) ( not ( = ?auto_287316 ?auto_287318 ) ) ( not ( = ?auto_287317 ?auto_287318 ) ) ( ON ?auto_287316 ?auto_287317 ) ( ON ?auto_287315 ?auto_287316 ) ( ON ?auto_287314 ?auto_287315 ) ( ON ?auto_287313 ?auto_287314 ) ( ON ?auto_287312 ?auto_287313 ) ( CLEAR ?auto_287310 ) ( ON ?auto_287311 ?auto_287312 ) ( CLEAR ?auto_287311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_287304 ?auto_287305 ?auto_287306 ?auto_287307 ?auto_287308 ?auto_287309 ?auto_287310 ?auto_287311 )
      ( MAKE-14PILE ?auto_287304 ?auto_287305 ?auto_287306 ?auto_287307 ?auto_287308 ?auto_287309 ?auto_287310 ?auto_287311 ?auto_287312 ?auto_287313 ?auto_287314 ?auto_287315 ?auto_287316 ?auto_287317 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_287333 - BLOCK
      ?auto_287334 - BLOCK
      ?auto_287335 - BLOCK
      ?auto_287336 - BLOCK
      ?auto_287337 - BLOCK
      ?auto_287338 - BLOCK
      ?auto_287339 - BLOCK
      ?auto_287340 - BLOCK
      ?auto_287341 - BLOCK
      ?auto_287342 - BLOCK
      ?auto_287343 - BLOCK
      ?auto_287344 - BLOCK
      ?auto_287345 - BLOCK
      ?auto_287346 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_287346 ) ( ON-TABLE ?auto_287333 ) ( ON ?auto_287334 ?auto_287333 ) ( ON ?auto_287335 ?auto_287334 ) ( ON ?auto_287336 ?auto_287335 ) ( ON ?auto_287337 ?auto_287336 ) ( ON ?auto_287338 ?auto_287337 ) ( ON ?auto_287339 ?auto_287338 ) ( not ( = ?auto_287333 ?auto_287334 ) ) ( not ( = ?auto_287333 ?auto_287335 ) ) ( not ( = ?auto_287333 ?auto_287336 ) ) ( not ( = ?auto_287333 ?auto_287337 ) ) ( not ( = ?auto_287333 ?auto_287338 ) ) ( not ( = ?auto_287333 ?auto_287339 ) ) ( not ( = ?auto_287333 ?auto_287340 ) ) ( not ( = ?auto_287333 ?auto_287341 ) ) ( not ( = ?auto_287333 ?auto_287342 ) ) ( not ( = ?auto_287333 ?auto_287343 ) ) ( not ( = ?auto_287333 ?auto_287344 ) ) ( not ( = ?auto_287333 ?auto_287345 ) ) ( not ( = ?auto_287333 ?auto_287346 ) ) ( not ( = ?auto_287334 ?auto_287335 ) ) ( not ( = ?auto_287334 ?auto_287336 ) ) ( not ( = ?auto_287334 ?auto_287337 ) ) ( not ( = ?auto_287334 ?auto_287338 ) ) ( not ( = ?auto_287334 ?auto_287339 ) ) ( not ( = ?auto_287334 ?auto_287340 ) ) ( not ( = ?auto_287334 ?auto_287341 ) ) ( not ( = ?auto_287334 ?auto_287342 ) ) ( not ( = ?auto_287334 ?auto_287343 ) ) ( not ( = ?auto_287334 ?auto_287344 ) ) ( not ( = ?auto_287334 ?auto_287345 ) ) ( not ( = ?auto_287334 ?auto_287346 ) ) ( not ( = ?auto_287335 ?auto_287336 ) ) ( not ( = ?auto_287335 ?auto_287337 ) ) ( not ( = ?auto_287335 ?auto_287338 ) ) ( not ( = ?auto_287335 ?auto_287339 ) ) ( not ( = ?auto_287335 ?auto_287340 ) ) ( not ( = ?auto_287335 ?auto_287341 ) ) ( not ( = ?auto_287335 ?auto_287342 ) ) ( not ( = ?auto_287335 ?auto_287343 ) ) ( not ( = ?auto_287335 ?auto_287344 ) ) ( not ( = ?auto_287335 ?auto_287345 ) ) ( not ( = ?auto_287335 ?auto_287346 ) ) ( not ( = ?auto_287336 ?auto_287337 ) ) ( not ( = ?auto_287336 ?auto_287338 ) ) ( not ( = ?auto_287336 ?auto_287339 ) ) ( not ( = ?auto_287336 ?auto_287340 ) ) ( not ( = ?auto_287336 ?auto_287341 ) ) ( not ( = ?auto_287336 ?auto_287342 ) ) ( not ( = ?auto_287336 ?auto_287343 ) ) ( not ( = ?auto_287336 ?auto_287344 ) ) ( not ( = ?auto_287336 ?auto_287345 ) ) ( not ( = ?auto_287336 ?auto_287346 ) ) ( not ( = ?auto_287337 ?auto_287338 ) ) ( not ( = ?auto_287337 ?auto_287339 ) ) ( not ( = ?auto_287337 ?auto_287340 ) ) ( not ( = ?auto_287337 ?auto_287341 ) ) ( not ( = ?auto_287337 ?auto_287342 ) ) ( not ( = ?auto_287337 ?auto_287343 ) ) ( not ( = ?auto_287337 ?auto_287344 ) ) ( not ( = ?auto_287337 ?auto_287345 ) ) ( not ( = ?auto_287337 ?auto_287346 ) ) ( not ( = ?auto_287338 ?auto_287339 ) ) ( not ( = ?auto_287338 ?auto_287340 ) ) ( not ( = ?auto_287338 ?auto_287341 ) ) ( not ( = ?auto_287338 ?auto_287342 ) ) ( not ( = ?auto_287338 ?auto_287343 ) ) ( not ( = ?auto_287338 ?auto_287344 ) ) ( not ( = ?auto_287338 ?auto_287345 ) ) ( not ( = ?auto_287338 ?auto_287346 ) ) ( not ( = ?auto_287339 ?auto_287340 ) ) ( not ( = ?auto_287339 ?auto_287341 ) ) ( not ( = ?auto_287339 ?auto_287342 ) ) ( not ( = ?auto_287339 ?auto_287343 ) ) ( not ( = ?auto_287339 ?auto_287344 ) ) ( not ( = ?auto_287339 ?auto_287345 ) ) ( not ( = ?auto_287339 ?auto_287346 ) ) ( not ( = ?auto_287340 ?auto_287341 ) ) ( not ( = ?auto_287340 ?auto_287342 ) ) ( not ( = ?auto_287340 ?auto_287343 ) ) ( not ( = ?auto_287340 ?auto_287344 ) ) ( not ( = ?auto_287340 ?auto_287345 ) ) ( not ( = ?auto_287340 ?auto_287346 ) ) ( not ( = ?auto_287341 ?auto_287342 ) ) ( not ( = ?auto_287341 ?auto_287343 ) ) ( not ( = ?auto_287341 ?auto_287344 ) ) ( not ( = ?auto_287341 ?auto_287345 ) ) ( not ( = ?auto_287341 ?auto_287346 ) ) ( not ( = ?auto_287342 ?auto_287343 ) ) ( not ( = ?auto_287342 ?auto_287344 ) ) ( not ( = ?auto_287342 ?auto_287345 ) ) ( not ( = ?auto_287342 ?auto_287346 ) ) ( not ( = ?auto_287343 ?auto_287344 ) ) ( not ( = ?auto_287343 ?auto_287345 ) ) ( not ( = ?auto_287343 ?auto_287346 ) ) ( not ( = ?auto_287344 ?auto_287345 ) ) ( not ( = ?auto_287344 ?auto_287346 ) ) ( not ( = ?auto_287345 ?auto_287346 ) ) ( ON ?auto_287345 ?auto_287346 ) ( ON ?auto_287344 ?auto_287345 ) ( ON ?auto_287343 ?auto_287344 ) ( ON ?auto_287342 ?auto_287343 ) ( ON ?auto_287341 ?auto_287342 ) ( CLEAR ?auto_287339 ) ( ON ?auto_287340 ?auto_287341 ) ( CLEAR ?auto_287340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_287333 ?auto_287334 ?auto_287335 ?auto_287336 ?auto_287337 ?auto_287338 ?auto_287339 ?auto_287340 )
      ( MAKE-14PILE ?auto_287333 ?auto_287334 ?auto_287335 ?auto_287336 ?auto_287337 ?auto_287338 ?auto_287339 ?auto_287340 ?auto_287341 ?auto_287342 ?auto_287343 ?auto_287344 ?auto_287345 ?auto_287346 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_287361 - BLOCK
      ?auto_287362 - BLOCK
      ?auto_287363 - BLOCK
      ?auto_287364 - BLOCK
      ?auto_287365 - BLOCK
      ?auto_287366 - BLOCK
      ?auto_287367 - BLOCK
      ?auto_287368 - BLOCK
      ?auto_287369 - BLOCK
      ?auto_287370 - BLOCK
      ?auto_287371 - BLOCK
      ?auto_287372 - BLOCK
      ?auto_287373 - BLOCK
      ?auto_287374 - BLOCK
    )
    :vars
    (
      ?auto_287375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287374 ?auto_287375 ) ( ON-TABLE ?auto_287361 ) ( ON ?auto_287362 ?auto_287361 ) ( ON ?auto_287363 ?auto_287362 ) ( ON ?auto_287364 ?auto_287363 ) ( ON ?auto_287365 ?auto_287364 ) ( ON ?auto_287366 ?auto_287365 ) ( not ( = ?auto_287361 ?auto_287362 ) ) ( not ( = ?auto_287361 ?auto_287363 ) ) ( not ( = ?auto_287361 ?auto_287364 ) ) ( not ( = ?auto_287361 ?auto_287365 ) ) ( not ( = ?auto_287361 ?auto_287366 ) ) ( not ( = ?auto_287361 ?auto_287367 ) ) ( not ( = ?auto_287361 ?auto_287368 ) ) ( not ( = ?auto_287361 ?auto_287369 ) ) ( not ( = ?auto_287361 ?auto_287370 ) ) ( not ( = ?auto_287361 ?auto_287371 ) ) ( not ( = ?auto_287361 ?auto_287372 ) ) ( not ( = ?auto_287361 ?auto_287373 ) ) ( not ( = ?auto_287361 ?auto_287374 ) ) ( not ( = ?auto_287361 ?auto_287375 ) ) ( not ( = ?auto_287362 ?auto_287363 ) ) ( not ( = ?auto_287362 ?auto_287364 ) ) ( not ( = ?auto_287362 ?auto_287365 ) ) ( not ( = ?auto_287362 ?auto_287366 ) ) ( not ( = ?auto_287362 ?auto_287367 ) ) ( not ( = ?auto_287362 ?auto_287368 ) ) ( not ( = ?auto_287362 ?auto_287369 ) ) ( not ( = ?auto_287362 ?auto_287370 ) ) ( not ( = ?auto_287362 ?auto_287371 ) ) ( not ( = ?auto_287362 ?auto_287372 ) ) ( not ( = ?auto_287362 ?auto_287373 ) ) ( not ( = ?auto_287362 ?auto_287374 ) ) ( not ( = ?auto_287362 ?auto_287375 ) ) ( not ( = ?auto_287363 ?auto_287364 ) ) ( not ( = ?auto_287363 ?auto_287365 ) ) ( not ( = ?auto_287363 ?auto_287366 ) ) ( not ( = ?auto_287363 ?auto_287367 ) ) ( not ( = ?auto_287363 ?auto_287368 ) ) ( not ( = ?auto_287363 ?auto_287369 ) ) ( not ( = ?auto_287363 ?auto_287370 ) ) ( not ( = ?auto_287363 ?auto_287371 ) ) ( not ( = ?auto_287363 ?auto_287372 ) ) ( not ( = ?auto_287363 ?auto_287373 ) ) ( not ( = ?auto_287363 ?auto_287374 ) ) ( not ( = ?auto_287363 ?auto_287375 ) ) ( not ( = ?auto_287364 ?auto_287365 ) ) ( not ( = ?auto_287364 ?auto_287366 ) ) ( not ( = ?auto_287364 ?auto_287367 ) ) ( not ( = ?auto_287364 ?auto_287368 ) ) ( not ( = ?auto_287364 ?auto_287369 ) ) ( not ( = ?auto_287364 ?auto_287370 ) ) ( not ( = ?auto_287364 ?auto_287371 ) ) ( not ( = ?auto_287364 ?auto_287372 ) ) ( not ( = ?auto_287364 ?auto_287373 ) ) ( not ( = ?auto_287364 ?auto_287374 ) ) ( not ( = ?auto_287364 ?auto_287375 ) ) ( not ( = ?auto_287365 ?auto_287366 ) ) ( not ( = ?auto_287365 ?auto_287367 ) ) ( not ( = ?auto_287365 ?auto_287368 ) ) ( not ( = ?auto_287365 ?auto_287369 ) ) ( not ( = ?auto_287365 ?auto_287370 ) ) ( not ( = ?auto_287365 ?auto_287371 ) ) ( not ( = ?auto_287365 ?auto_287372 ) ) ( not ( = ?auto_287365 ?auto_287373 ) ) ( not ( = ?auto_287365 ?auto_287374 ) ) ( not ( = ?auto_287365 ?auto_287375 ) ) ( not ( = ?auto_287366 ?auto_287367 ) ) ( not ( = ?auto_287366 ?auto_287368 ) ) ( not ( = ?auto_287366 ?auto_287369 ) ) ( not ( = ?auto_287366 ?auto_287370 ) ) ( not ( = ?auto_287366 ?auto_287371 ) ) ( not ( = ?auto_287366 ?auto_287372 ) ) ( not ( = ?auto_287366 ?auto_287373 ) ) ( not ( = ?auto_287366 ?auto_287374 ) ) ( not ( = ?auto_287366 ?auto_287375 ) ) ( not ( = ?auto_287367 ?auto_287368 ) ) ( not ( = ?auto_287367 ?auto_287369 ) ) ( not ( = ?auto_287367 ?auto_287370 ) ) ( not ( = ?auto_287367 ?auto_287371 ) ) ( not ( = ?auto_287367 ?auto_287372 ) ) ( not ( = ?auto_287367 ?auto_287373 ) ) ( not ( = ?auto_287367 ?auto_287374 ) ) ( not ( = ?auto_287367 ?auto_287375 ) ) ( not ( = ?auto_287368 ?auto_287369 ) ) ( not ( = ?auto_287368 ?auto_287370 ) ) ( not ( = ?auto_287368 ?auto_287371 ) ) ( not ( = ?auto_287368 ?auto_287372 ) ) ( not ( = ?auto_287368 ?auto_287373 ) ) ( not ( = ?auto_287368 ?auto_287374 ) ) ( not ( = ?auto_287368 ?auto_287375 ) ) ( not ( = ?auto_287369 ?auto_287370 ) ) ( not ( = ?auto_287369 ?auto_287371 ) ) ( not ( = ?auto_287369 ?auto_287372 ) ) ( not ( = ?auto_287369 ?auto_287373 ) ) ( not ( = ?auto_287369 ?auto_287374 ) ) ( not ( = ?auto_287369 ?auto_287375 ) ) ( not ( = ?auto_287370 ?auto_287371 ) ) ( not ( = ?auto_287370 ?auto_287372 ) ) ( not ( = ?auto_287370 ?auto_287373 ) ) ( not ( = ?auto_287370 ?auto_287374 ) ) ( not ( = ?auto_287370 ?auto_287375 ) ) ( not ( = ?auto_287371 ?auto_287372 ) ) ( not ( = ?auto_287371 ?auto_287373 ) ) ( not ( = ?auto_287371 ?auto_287374 ) ) ( not ( = ?auto_287371 ?auto_287375 ) ) ( not ( = ?auto_287372 ?auto_287373 ) ) ( not ( = ?auto_287372 ?auto_287374 ) ) ( not ( = ?auto_287372 ?auto_287375 ) ) ( not ( = ?auto_287373 ?auto_287374 ) ) ( not ( = ?auto_287373 ?auto_287375 ) ) ( not ( = ?auto_287374 ?auto_287375 ) ) ( ON ?auto_287373 ?auto_287374 ) ( ON ?auto_287372 ?auto_287373 ) ( ON ?auto_287371 ?auto_287372 ) ( ON ?auto_287370 ?auto_287371 ) ( ON ?auto_287369 ?auto_287370 ) ( ON ?auto_287368 ?auto_287369 ) ( CLEAR ?auto_287366 ) ( ON ?auto_287367 ?auto_287368 ) ( CLEAR ?auto_287367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_287361 ?auto_287362 ?auto_287363 ?auto_287364 ?auto_287365 ?auto_287366 ?auto_287367 )
      ( MAKE-14PILE ?auto_287361 ?auto_287362 ?auto_287363 ?auto_287364 ?auto_287365 ?auto_287366 ?auto_287367 ?auto_287368 ?auto_287369 ?auto_287370 ?auto_287371 ?auto_287372 ?auto_287373 ?auto_287374 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_287390 - BLOCK
      ?auto_287391 - BLOCK
      ?auto_287392 - BLOCK
      ?auto_287393 - BLOCK
      ?auto_287394 - BLOCK
      ?auto_287395 - BLOCK
      ?auto_287396 - BLOCK
      ?auto_287397 - BLOCK
      ?auto_287398 - BLOCK
      ?auto_287399 - BLOCK
      ?auto_287400 - BLOCK
      ?auto_287401 - BLOCK
      ?auto_287402 - BLOCK
      ?auto_287403 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_287403 ) ( ON-TABLE ?auto_287390 ) ( ON ?auto_287391 ?auto_287390 ) ( ON ?auto_287392 ?auto_287391 ) ( ON ?auto_287393 ?auto_287392 ) ( ON ?auto_287394 ?auto_287393 ) ( ON ?auto_287395 ?auto_287394 ) ( not ( = ?auto_287390 ?auto_287391 ) ) ( not ( = ?auto_287390 ?auto_287392 ) ) ( not ( = ?auto_287390 ?auto_287393 ) ) ( not ( = ?auto_287390 ?auto_287394 ) ) ( not ( = ?auto_287390 ?auto_287395 ) ) ( not ( = ?auto_287390 ?auto_287396 ) ) ( not ( = ?auto_287390 ?auto_287397 ) ) ( not ( = ?auto_287390 ?auto_287398 ) ) ( not ( = ?auto_287390 ?auto_287399 ) ) ( not ( = ?auto_287390 ?auto_287400 ) ) ( not ( = ?auto_287390 ?auto_287401 ) ) ( not ( = ?auto_287390 ?auto_287402 ) ) ( not ( = ?auto_287390 ?auto_287403 ) ) ( not ( = ?auto_287391 ?auto_287392 ) ) ( not ( = ?auto_287391 ?auto_287393 ) ) ( not ( = ?auto_287391 ?auto_287394 ) ) ( not ( = ?auto_287391 ?auto_287395 ) ) ( not ( = ?auto_287391 ?auto_287396 ) ) ( not ( = ?auto_287391 ?auto_287397 ) ) ( not ( = ?auto_287391 ?auto_287398 ) ) ( not ( = ?auto_287391 ?auto_287399 ) ) ( not ( = ?auto_287391 ?auto_287400 ) ) ( not ( = ?auto_287391 ?auto_287401 ) ) ( not ( = ?auto_287391 ?auto_287402 ) ) ( not ( = ?auto_287391 ?auto_287403 ) ) ( not ( = ?auto_287392 ?auto_287393 ) ) ( not ( = ?auto_287392 ?auto_287394 ) ) ( not ( = ?auto_287392 ?auto_287395 ) ) ( not ( = ?auto_287392 ?auto_287396 ) ) ( not ( = ?auto_287392 ?auto_287397 ) ) ( not ( = ?auto_287392 ?auto_287398 ) ) ( not ( = ?auto_287392 ?auto_287399 ) ) ( not ( = ?auto_287392 ?auto_287400 ) ) ( not ( = ?auto_287392 ?auto_287401 ) ) ( not ( = ?auto_287392 ?auto_287402 ) ) ( not ( = ?auto_287392 ?auto_287403 ) ) ( not ( = ?auto_287393 ?auto_287394 ) ) ( not ( = ?auto_287393 ?auto_287395 ) ) ( not ( = ?auto_287393 ?auto_287396 ) ) ( not ( = ?auto_287393 ?auto_287397 ) ) ( not ( = ?auto_287393 ?auto_287398 ) ) ( not ( = ?auto_287393 ?auto_287399 ) ) ( not ( = ?auto_287393 ?auto_287400 ) ) ( not ( = ?auto_287393 ?auto_287401 ) ) ( not ( = ?auto_287393 ?auto_287402 ) ) ( not ( = ?auto_287393 ?auto_287403 ) ) ( not ( = ?auto_287394 ?auto_287395 ) ) ( not ( = ?auto_287394 ?auto_287396 ) ) ( not ( = ?auto_287394 ?auto_287397 ) ) ( not ( = ?auto_287394 ?auto_287398 ) ) ( not ( = ?auto_287394 ?auto_287399 ) ) ( not ( = ?auto_287394 ?auto_287400 ) ) ( not ( = ?auto_287394 ?auto_287401 ) ) ( not ( = ?auto_287394 ?auto_287402 ) ) ( not ( = ?auto_287394 ?auto_287403 ) ) ( not ( = ?auto_287395 ?auto_287396 ) ) ( not ( = ?auto_287395 ?auto_287397 ) ) ( not ( = ?auto_287395 ?auto_287398 ) ) ( not ( = ?auto_287395 ?auto_287399 ) ) ( not ( = ?auto_287395 ?auto_287400 ) ) ( not ( = ?auto_287395 ?auto_287401 ) ) ( not ( = ?auto_287395 ?auto_287402 ) ) ( not ( = ?auto_287395 ?auto_287403 ) ) ( not ( = ?auto_287396 ?auto_287397 ) ) ( not ( = ?auto_287396 ?auto_287398 ) ) ( not ( = ?auto_287396 ?auto_287399 ) ) ( not ( = ?auto_287396 ?auto_287400 ) ) ( not ( = ?auto_287396 ?auto_287401 ) ) ( not ( = ?auto_287396 ?auto_287402 ) ) ( not ( = ?auto_287396 ?auto_287403 ) ) ( not ( = ?auto_287397 ?auto_287398 ) ) ( not ( = ?auto_287397 ?auto_287399 ) ) ( not ( = ?auto_287397 ?auto_287400 ) ) ( not ( = ?auto_287397 ?auto_287401 ) ) ( not ( = ?auto_287397 ?auto_287402 ) ) ( not ( = ?auto_287397 ?auto_287403 ) ) ( not ( = ?auto_287398 ?auto_287399 ) ) ( not ( = ?auto_287398 ?auto_287400 ) ) ( not ( = ?auto_287398 ?auto_287401 ) ) ( not ( = ?auto_287398 ?auto_287402 ) ) ( not ( = ?auto_287398 ?auto_287403 ) ) ( not ( = ?auto_287399 ?auto_287400 ) ) ( not ( = ?auto_287399 ?auto_287401 ) ) ( not ( = ?auto_287399 ?auto_287402 ) ) ( not ( = ?auto_287399 ?auto_287403 ) ) ( not ( = ?auto_287400 ?auto_287401 ) ) ( not ( = ?auto_287400 ?auto_287402 ) ) ( not ( = ?auto_287400 ?auto_287403 ) ) ( not ( = ?auto_287401 ?auto_287402 ) ) ( not ( = ?auto_287401 ?auto_287403 ) ) ( not ( = ?auto_287402 ?auto_287403 ) ) ( ON ?auto_287402 ?auto_287403 ) ( ON ?auto_287401 ?auto_287402 ) ( ON ?auto_287400 ?auto_287401 ) ( ON ?auto_287399 ?auto_287400 ) ( ON ?auto_287398 ?auto_287399 ) ( ON ?auto_287397 ?auto_287398 ) ( CLEAR ?auto_287395 ) ( ON ?auto_287396 ?auto_287397 ) ( CLEAR ?auto_287396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_287390 ?auto_287391 ?auto_287392 ?auto_287393 ?auto_287394 ?auto_287395 ?auto_287396 )
      ( MAKE-14PILE ?auto_287390 ?auto_287391 ?auto_287392 ?auto_287393 ?auto_287394 ?auto_287395 ?auto_287396 ?auto_287397 ?auto_287398 ?auto_287399 ?auto_287400 ?auto_287401 ?auto_287402 ?auto_287403 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_287418 - BLOCK
      ?auto_287419 - BLOCK
      ?auto_287420 - BLOCK
      ?auto_287421 - BLOCK
      ?auto_287422 - BLOCK
      ?auto_287423 - BLOCK
      ?auto_287424 - BLOCK
      ?auto_287425 - BLOCK
      ?auto_287426 - BLOCK
      ?auto_287427 - BLOCK
      ?auto_287428 - BLOCK
      ?auto_287429 - BLOCK
      ?auto_287430 - BLOCK
      ?auto_287431 - BLOCK
    )
    :vars
    (
      ?auto_287432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287431 ?auto_287432 ) ( ON-TABLE ?auto_287418 ) ( ON ?auto_287419 ?auto_287418 ) ( ON ?auto_287420 ?auto_287419 ) ( ON ?auto_287421 ?auto_287420 ) ( ON ?auto_287422 ?auto_287421 ) ( not ( = ?auto_287418 ?auto_287419 ) ) ( not ( = ?auto_287418 ?auto_287420 ) ) ( not ( = ?auto_287418 ?auto_287421 ) ) ( not ( = ?auto_287418 ?auto_287422 ) ) ( not ( = ?auto_287418 ?auto_287423 ) ) ( not ( = ?auto_287418 ?auto_287424 ) ) ( not ( = ?auto_287418 ?auto_287425 ) ) ( not ( = ?auto_287418 ?auto_287426 ) ) ( not ( = ?auto_287418 ?auto_287427 ) ) ( not ( = ?auto_287418 ?auto_287428 ) ) ( not ( = ?auto_287418 ?auto_287429 ) ) ( not ( = ?auto_287418 ?auto_287430 ) ) ( not ( = ?auto_287418 ?auto_287431 ) ) ( not ( = ?auto_287418 ?auto_287432 ) ) ( not ( = ?auto_287419 ?auto_287420 ) ) ( not ( = ?auto_287419 ?auto_287421 ) ) ( not ( = ?auto_287419 ?auto_287422 ) ) ( not ( = ?auto_287419 ?auto_287423 ) ) ( not ( = ?auto_287419 ?auto_287424 ) ) ( not ( = ?auto_287419 ?auto_287425 ) ) ( not ( = ?auto_287419 ?auto_287426 ) ) ( not ( = ?auto_287419 ?auto_287427 ) ) ( not ( = ?auto_287419 ?auto_287428 ) ) ( not ( = ?auto_287419 ?auto_287429 ) ) ( not ( = ?auto_287419 ?auto_287430 ) ) ( not ( = ?auto_287419 ?auto_287431 ) ) ( not ( = ?auto_287419 ?auto_287432 ) ) ( not ( = ?auto_287420 ?auto_287421 ) ) ( not ( = ?auto_287420 ?auto_287422 ) ) ( not ( = ?auto_287420 ?auto_287423 ) ) ( not ( = ?auto_287420 ?auto_287424 ) ) ( not ( = ?auto_287420 ?auto_287425 ) ) ( not ( = ?auto_287420 ?auto_287426 ) ) ( not ( = ?auto_287420 ?auto_287427 ) ) ( not ( = ?auto_287420 ?auto_287428 ) ) ( not ( = ?auto_287420 ?auto_287429 ) ) ( not ( = ?auto_287420 ?auto_287430 ) ) ( not ( = ?auto_287420 ?auto_287431 ) ) ( not ( = ?auto_287420 ?auto_287432 ) ) ( not ( = ?auto_287421 ?auto_287422 ) ) ( not ( = ?auto_287421 ?auto_287423 ) ) ( not ( = ?auto_287421 ?auto_287424 ) ) ( not ( = ?auto_287421 ?auto_287425 ) ) ( not ( = ?auto_287421 ?auto_287426 ) ) ( not ( = ?auto_287421 ?auto_287427 ) ) ( not ( = ?auto_287421 ?auto_287428 ) ) ( not ( = ?auto_287421 ?auto_287429 ) ) ( not ( = ?auto_287421 ?auto_287430 ) ) ( not ( = ?auto_287421 ?auto_287431 ) ) ( not ( = ?auto_287421 ?auto_287432 ) ) ( not ( = ?auto_287422 ?auto_287423 ) ) ( not ( = ?auto_287422 ?auto_287424 ) ) ( not ( = ?auto_287422 ?auto_287425 ) ) ( not ( = ?auto_287422 ?auto_287426 ) ) ( not ( = ?auto_287422 ?auto_287427 ) ) ( not ( = ?auto_287422 ?auto_287428 ) ) ( not ( = ?auto_287422 ?auto_287429 ) ) ( not ( = ?auto_287422 ?auto_287430 ) ) ( not ( = ?auto_287422 ?auto_287431 ) ) ( not ( = ?auto_287422 ?auto_287432 ) ) ( not ( = ?auto_287423 ?auto_287424 ) ) ( not ( = ?auto_287423 ?auto_287425 ) ) ( not ( = ?auto_287423 ?auto_287426 ) ) ( not ( = ?auto_287423 ?auto_287427 ) ) ( not ( = ?auto_287423 ?auto_287428 ) ) ( not ( = ?auto_287423 ?auto_287429 ) ) ( not ( = ?auto_287423 ?auto_287430 ) ) ( not ( = ?auto_287423 ?auto_287431 ) ) ( not ( = ?auto_287423 ?auto_287432 ) ) ( not ( = ?auto_287424 ?auto_287425 ) ) ( not ( = ?auto_287424 ?auto_287426 ) ) ( not ( = ?auto_287424 ?auto_287427 ) ) ( not ( = ?auto_287424 ?auto_287428 ) ) ( not ( = ?auto_287424 ?auto_287429 ) ) ( not ( = ?auto_287424 ?auto_287430 ) ) ( not ( = ?auto_287424 ?auto_287431 ) ) ( not ( = ?auto_287424 ?auto_287432 ) ) ( not ( = ?auto_287425 ?auto_287426 ) ) ( not ( = ?auto_287425 ?auto_287427 ) ) ( not ( = ?auto_287425 ?auto_287428 ) ) ( not ( = ?auto_287425 ?auto_287429 ) ) ( not ( = ?auto_287425 ?auto_287430 ) ) ( not ( = ?auto_287425 ?auto_287431 ) ) ( not ( = ?auto_287425 ?auto_287432 ) ) ( not ( = ?auto_287426 ?auto_287427 ) ) ( not ( = ?auto_287426 ?auto_287428 ) ) ( not ( = ?auto_287426 ?auto_287429 ) ) ( not ( = ?auto_287426 ?auto_287430 ) ) ( not ( = ?auto_287426 ?auto_287431 ) ) ( not ( = ?auto_287426 ?auto_287432 ) ) ( not ( = ?auto_287427 ?auto_287428 ) ) ( not ( = ?auto_287427 ?auto_287429 ) ) ( not ( = ?auto_287427 ?auto_287430 ) ) ( not ( = ?auto_287427 ?auto_287431 ) ) ( not ( = ?auto_287427 ?auto_287432 ) ) ( not ( = ?auto_287428 ?auto_287429 ) ) ( not ( = ?auto_287428 ?auto_287430 ) ) ( not ( = ?auto_287428 ?auto_287431 ) ) ( not ( = ?auto_287428 ?auto_287432 ) ) ( not ( = ?auto_287429 ?auto_287430 ) ) ( not ( = ?auto_287429 ?auto_287431 ) ) ( not ( = ?auto_287429 ?auto_287432 ) ) ( not ( = ?auto_287430 ?auto_287431 ) ) ( not ( = ?auto_287430 ?auto_287432 ) ) ( not ( = ?auto_287431 ?auto_287432 ) ) ( ON ?auto_287430 ?auto_287431 ) ( ON ?auto_287429 ?auto_287430 ) ( ON ?auto_287428 ?auto_287429 ) ( ON ?auto_287427 ?auto_287428 ) ( ON ?auto_287426 ?auto_287427 ) ( ON ?auto_287425 ?auto_287426 ) ( ON ?auto_287424 ?auto_287425 ) ( CLEAR ?auto_287422 ) ( ON ?auto_287423 ?auto_287424 ) ( CLEAR ?auto_287423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_287418 ?auto_287419 ?auto_287420 ?auto_287421 ?auto_287422 ?auto_287423 )
      ( MAKE-14PILE ?auto_287418 ?auto_287419 ?auto_287420 ?auto_287421 ?auto_287422 ?auto_287423 ?auto_287424 ?auto_287425 ?auto_287426 ?auto_287427 ?auto_287428 ?auto_287429 ?auto_287430 ?auto_287431 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_287447 - BLOCK
      ?auto_287448 - BLOCK
      ?auto_287449 - BLOCK
      ?auto_287450 - BLOCK
      ?auto_287451 - BLOCK
      ?auto_287452 - BLOCK
      ?auto_287453 - BLOCK
      ?auto_287454 - BLOCK
      ?auto_287455 - BLOCK
      ?auto_287456 - BLOCK
      ?auto_287457 - BLOCK
      ?auto_287458 - BLOCK
      ?auto_287459 - BLOCK
      ?auto_287460 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_287460 ) ( ON-TABLE ?auto_287447 ) ( ON ?auto_287448 ?auto_287447 ) ( ON ?auto_287449 ?auto_287448 ) ( ON ?auto_287450 ?auto_287449 ) ( ON ?auto_287451 ?auto_287450 ) ( not ( = ?auto_287447 ?auto_287448 ) ) ( not ( = ?auto_287447 ?auto_287449 ) ) ( not ( = ?auto_287447 ?auto_287450 ) ) ( not ( = ?auto_287447 ?auto_287451 ) ) ( not ( = ?auto_287447 ?auto_287452 ) ) ( not ( = ?auto_287447 ?auto_287453 ) ) ( not ( = ?auto_287447 ?auto_287454 ) ) ( not ( = ?auto_287447 ?auto_287455 ) ) ( not ( = ?auto_287447 ?auto_287456 ) ) ( not ( = ?auto_287447 ?auto_287457 ) ) ( not ( = ?auto_287447 ?auto_287458 ) ) ( not ( = ?auto_287447 ?auto_287459 ) ) ( not ( = ?auto_287447 ?auto_287460 ) ) ( not ( = ?auto_287448 ?auto_287449 ) ) ( not ( = ?auto_287448 ?auto_287450 ) ) ( not ( = ?auto_287448 ?auto_287451 ) ) ( not ( = ?auto_287448 ?auto_287452 ) ) ( not ( = ?auto_287448 ?auto_287453 ) ) ( not ( = ?auto_287448 ?auto_287454 ) ) ( not ( = ?auto_287448 ?auto_287455 ) ) ( not ( = ?auto_287448 ?auto_287456 ) ) ( not ( = ?auto_287448 ?auto_287457 ) ) ( not ( = ?auto_287448 ?auto_287458 ) ) ( not ( = ?auto_287448 ?auto_287459 ) ) ( not ( = ?auto_287448 ?auto_287460 ) ) ( not ( = ?auto_287449 ?auto_287450 ) ) ( not ( = ?auto_287449 ?auto_287451 ) ) ( not ( = ?auto_287449 ?auto_287452 ) ) ( not ( = ?auto_287449 ?auto_287453 ) ) ( not ( = ?auto_287449 ?auto_287454 ) ) ( not ( = ?auto_287449 ?auto_287455 ) ) ( not ( = ?auto_287449 ?auto_287456 ) ) ( not ( = ?auto_287449 ?auto_287457 ) ) ( not ( = ?auto_287449 ?auto_287458 ) ) ( not ( = ?auto_287449 ?auto_287459 ) ) ( not ( = ?auto_287449 ?auto_287460 ) ) ( not ( = ?auto_287450 ?auto_287451 ) ) ( not ( = ?auto_287450 ?auto_287452 ) ) ( not ( = ?auto_287450 ?auto_287453 ) ) ( not ( = ?auto_287450 ?auto_287454 ) ) ( not ( = ?auto_287450 ?auto_287455 ) ) ( not ( = ?auto_287450 ?auto_287456 ) ) ( not ( = ?auto_287450 ?auto_287457 ) ) ( not ( = ?auto_287450 ?auto_287458 ) ) ( not ( = ?auto_287450 ?auto_287459 ) ) ( not ( = ?auto_287450 ?auto_287460 ) ) ( not ( = ?auto_287451 ?auto_287452 ) ) ( not ( = ?auto_287451 ?auto_287453 ) ) ( not ( = ?auto_287451 ?auto_287454 ) ) ( not ( = ?auto_287451 ?auto_287455 ) ) ( not ( = ?auto_287451 ?auto_287456 ) ) ( not ( = ?auto_287451 ?auto_287457 ) ) ( not ( = ?auto_287451 ?auto_287458 ) ) ( not ( = ?auto_287451 ?auto_287459 ) ) ( not ( = ?auto_287451 ?auto_287460 ) ) ( not ( = ?auto_287452 ?auto_287453 ) ) ( not ( = ?auto_287452 ?auto_287454 ) ) ( not ( = ?auto_287452 ?auto_287455 ) ) ( not ( = ?auto_287452 ?auto_287456 ) ) ( not ( = ?auto_287452 ?auto_287457 ) ) ( not ( = ?auto_287452 ?auto_287458 ) ) ( not ( = ?auto_287452 ?auto_287459 ) ) ( not ( = ?auto_287452 ?auto_287460 ) ) ( not ( = ?auto_287453 ?auto_287454 ) ) ( not ( = ?auto_287453 ?auto_287455 ) ) ( not ( = ?auto_287453 ?auto_287456 ) ) ( not ( = ?auto_287453 ?auto_287457 ) ) ( not ( = ?auto_287453 ?auto_287458 ) ) ( not ( = ?auto_287453 ?auto_287459 ) ) ( not ( = ?auto_287453 ?auto_287460 ) ) ( not ( = ?auto_287454 ?auto_287455 ) ) ( not ( = ?auto_287454 ?auto_287456 ) ) ( not ( = ?auto_287454 ?auto_287457 ) ) ( not ( = ?auto_287454 ?auto_287458 ) ) ( not ( = ?auto_287454 ?auto_287459 ) ) ( not ( = ?auto_287454 ?auto_287460 ) ) ( not ( = ?auto_287455 ?auto_287456 ) ) ( not ( = ?auto_287455 ?auto_287457 ) ) ( not ( = ?auto_287455 ?auto_287458 ) ) ( not ( = ?auto_287455 ?auto_287459 ) ) ( not ( = ?auto_287455 ?auto_287460 ) ) ( not ( = ?auto_287456 ?auto_287457 ) ) ( not ( = ?auto_287456 ?auto_287458 ) ) ( not ( = ?auto_287456 ?auto_287459 ) ) ( not ( = ?auto_287456 ?auto_287460 ) ) ( not ( = ?auto_287457 ?auto_287458 ) ) ( not ( = ?auto_287457 ?auto_287459 ) ) ( not ( = ?auto_287457 ?auto_287460 ) ) ( not ( = ?auto_287458 ?auto_287459 ) ) ( not ( = ?auto_287458 ?auto_287460 ) ) ( not ( = ?auto_287459 ?auto_287460 ) ) ( ON ?auto_287459 ?auto_287460 ) ( ON ?auto_287458 ?auto_287459 ) ( ON ?auto_287457 ?auto_287458 ) ( ON ?auto_287456 ?auto_287457 ) ( ON ?auto_287455 ?auto_287456 ) ( ON ?auto_287454 ?auto_287455 ) ( ON ?auto_287453 ?auto_287454 ) ( CLEAR ?auto_287451 ) ( ON ?auto_287452 ?auto_287453 ) ( CLEAR ?auto_287452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_287447 ?auto_287448 ?auto_287449 ?auto_287450 ?auto_287451 ?auto_287452 )
      ( MAKE-14PILE ?auto_287447 ?auto_287448 ?auto_287449 ?auto_287450 ?auto_287451 ?auto_287452 ?auto_287453 ?auto_287454 ?auto_287455 ?auto_287456 ?auto_287457 ?auto_287458 ?auto_287459 ?auto_287460 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_287475 - BLOCK
      ?auto_287476 - BLOCK
      ?auto_287477 - BLOCK
      ?auto_287478 - BLOCK
      ?auto_287479 - BLOCK
      ?auto_287480 - BLOCK
      ?auto_287481 - BLOCK
      ?auto_287482 - BLOCK
      ?auto_287483 - BLOCK
      ?auto_287484 - BLOCK
      ?auto_287485 - BLOCK
      ?auto_287486 - BLOCK
      ?auto_287487 - BLOCK
      ?auto_287488 - BLOCK
    )
    :vars
    (
      ?auto_287489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287488 ?auto_287489 ) ( ON-TABLE ?auto_287475 ) ( ON ?auto_287476 ?auto_287475 ) ( ON ?auto_287477 ?auto_287476 ) ( ON ?auto_287478 ?auto_287477 ) ( not ( = ?auto_287475 ?auto_287476 ) ) ( not ( = ?auto_287475 ?auto_287477 ) ) ( not ( = ?auto_287475 ?auto_287478 ) ) ( not ( = ?auto_287475 ?auto_287479 ) ) ( not ( = ?auto_287475 ?auto_287480 ) ) ( not ( = ?auto_287475 ?auto_287481 ) ) ( not ( = ?auto_287475 ?auto_287482 ) ) ( not ( = ?auto_287475 ?auto_287483 ) ) ( not ( = ?auto_287475 ?auto_287484 ) ) ( not ( = ?auto_287475 ?auto_287485 ) ) ( not ( = ?auto_287475 ?auto_287486 ) ) ( not ( = ?auto_287475 ?auto_287487 ) ) ( not ( = ?auto_287475 ?auto_287488 ) ) ( not ( = ?auto_287475 ?auto_287489 ) ) ( not ( = ?auto_287476 ?auto_287477 ) ) ( not ( = ?auto_287476 ?auto_287478 ) ) ( not ( = ?auto_287476 ?auto_287479 ) ) ( not ( = ?auto_287476 ?auto_287480 ) ) ( not ( = ?auto_287476 ?auto_287481 ) ) ( not ( = ?auto_287476 ?auto_287482 ) ) ( not ( = ?auto_287476 ?auto_287483 ) ) ( not ( = ?auto_287476 ?auto_287484 ) ) ( not ( = ?auto_287476 ?auto_287485 ) ) ( not ( = ?auto_287476 ?auto_287486 ) ) ( not ( = ?auto_287476 ?auto_287487 ) ) ( not ( = ?auto_287476 ?auto_287488 ) ) ( not ( = ?auto_287476 ?auto_287489 ) ) ( not ( = ?auto_287477 ?auto_287478 ) ) ( not ( = ?auto_287477 ?auto_287479 ) ) ( not ( = ?auto_287477 ?auto_287480 ) ) ( not ( = ?auto_287477 ?auto_287481 ) ) ( not ( = ?auto_287477 ?auto_287482 ) ) ( not ( = ?auto_287477 ?auto_287483 ) ) ( not ( = ?auto_287477 ?auto_287484 ) ) ( not ( = ?auto_287477 ?auto_287485 ) ) ( not ( = ?auto_287477 ?auto_287486 ) ) ( not ( = ?auto_287477 ?auto_287487 ) ) ( not ( = ?auto_287477 ?auto_287488 ) ) ( not ( = ?auto_287477 ?auto_287489 ) ) ( not ( = ?auto_287478 ?auto_287479 ) ) ( not ( = ?auto_287478 ?auto_287480 ) ) ( not ( = ?auto_287478 ?auto_287481 ) ) ( not ( = ?auto_287478 ?auto_287482 ) ) ( not ( = ?auto_287478 ?auto_287483 ) ) ( not ( = ?auto_287478 ?auto_287484 ) ) ( not ( = ?auto_287478 ?auto_287485 ) ) ( not ( = ?auto_287478 ?auto_287486 ) ) ( not ( = ?auto_287478 ?auto_287487 ) ) ( not ( = ?auto_287478 ?auto_287488 ) ) ( not ( = ?auto_287478 ?auto_287489 ) ) ( not ( = ?auto_287479 ?auto_287480 ) ) ( not ( = ?auto_287479 ?auto_287481 ) ) ( not ( = ?auto_287479 ?auto_287482 ) ) ( not ( = ?auto_287479 ?auto_287483 ) ) ( not ( = ?auto_287479 ?auto_287484 ) ) ( not ( = ?auto_287479 ?auto_287485 ) ) ( not ( = ?auto_287479 ?auto_287486 ) ) ( not ( = ?auto_287479 ?auto_287487 ) ) ( not ( = ?auto_287479 ?auto_287488 ) ) ( not ( = ?auto_287479 ?auto_287489 ) ) ( not ( = ?auto_287480 ?auto_287481 ) ) ( not ( = ?auto_287480 ?auto_287482 ) ) ( not ( = ?auto_287480 ?auto_287483 ) ) ( not ( = ?auto_287480 ?auto_287484 ) ) ( not ( = ?auto_287480 ?auto_287485 ) ) ( not ( = ?auto_287480 ?auto_287486 ) ) ( not ( = ?auto_287480 ?auto_287487 ) ) ( not ( = ?auto_287480 ?auto_287488 ) ) ( not ( = ?auto_287480 ?auto_287489 ) ) ( not ( = ?auto_287481 ?auto_287482 ) ) ( not ( = ?auto_287481 ?auto_287483 ) ) ( not ( = ?auto_287481 ?auto_287484 ) ) ( not ( = ?auto_287481 ?auto_287485 ) ) ( not ( = ?auto_287481 ?auto_287486 ) ) ( not ( = ?auto_287481 ?auto_287487 ) ) ( not ( = ?auto_287481 ?auto_287488 ) ) ( not ( = ?auto_287481 ?auto_287489 ) ) ( not ( = ?auto_287482 ?auto_287483 ) ) ( not ( = ?auto_287482 ?auto_287484 ) ) ( not ( = ?auto_287482 ?auto_287485 ) ) ( not ( = ?auto_287482 ?auto_287486 ) ) ( not ( = ?auto_287482 ?auto_287487 ) ) ( not ( = ?auto_287482 ?auto_287488 ) ) ( not ( = ?auto_287482 ?auto_287489 ) ) ( not ( = ?auto_287483 ?auto_287484 ) ) ( not ( = ?auto_287483 ?auto_287485 ) ) ( not ( = ?auto_287483 ?auto_287486 ) ) ( not ( = ?auto_287483 ?auto_287487 ) ) ( not ( = ?auto_287483 ?auto_287488 ) ) ( not ( = ?auto_287483 ?auto_287489 ) ) ( not ( = ?auto_287484 ?auto_287485 ) ) ( not ( = ?auto_287484 ?auto_287486 ) ) ( not ( = ?auto_287484 ?auto_287487 ) ) ( not ( = ?auto_287484 ?auto_287488 ) ) ( not ( = ?auto_287484 ?auto_287489 ) ) ( not ( = ?auto_287485 ?auto_287486 ) ) ( not ( = ?auto_287485 ?auto_287487 ) ) ( not ( = ?auto_287485 ?auto_287488 ) ) ( not ( = ?auto_287485 ?auto_287489 ) ) ( not ( = ?auto_287486 ?auto_287487 ) ) ( not ( = ?auto_287486 ?auto_287488 ) ) ( not ( = ?auto_287486 ?auto_287489 ) ) ( not ( = ?auto_287487 ?auto_287488 ) ) ( not ( = ?auto_287487 ?auto_287489 ) ) ( not ( = ?auto_287488 ?auto_287489 ) ) ( ON ?auto_287487 ?auto_287488 ) ( ON ?auto_287486 ?auto_287487 ) ( ON ?auto_287485 ?auto_287486 ) ( ON ?auto_287484 ?auto_287485 ) ( ON ?auto_287483 ?auto_287484 ) ( ON ?auto_287482 ?auto_287483 ) ( ON ?auto_287481 ?auto_287482 ) ( ON ?auto_287480 ?auto_287481 ) ( CLEAR ?auto_287478 ) ( ON ?auto_287479 ?auto_287480 ) ( CLEAR ?auto_287479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_287475 ?auto_287476 ?auto_287477 ?auto_287478 ?auto_287479 )
      ( MAKE-14PILE ?auto_287475 ?auto_287476 ?auto_287477 ?auto_287478 ?auto_287479 ?auto_287480 ?auto_287481 ?auto_287482 ?auto_287483 ?auto_287484 ?auto_287485 ?auto_287486 ?auto_287487 ?auto_287488 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_287504 - BLOCK
      ?auto_287505 - BLOCK
      ?auto_287506 - BLOCK
      ?auto_287507 - BLOCK
      ?auto_287508 - BLOCK
      ?auto_287509 - BLOCK
      ?auto_287510 - BLOCK
      ?auto_287511 - BLOCK
      ?auto_287512 - BLOCK
      ?auto_287513 - BLOCK
      ?auto_287514 - BLOCK
      ?auto_287515 - BLOCK
      ?auto_287516 - BLOCK
      ?auto_287517 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_287517 ) ( ON-TABLE ?auto_287504 ) ( ON ?auto_287505 ?auto_287504 ) ( ON ?auto_287506 ?auto_287505 ) ( ON ?auto_287507 ?auto_287506 ) ( not ( = ?auto_287504 ?auto_287505 ) ) ( not ( = ?auto_287504 ?auto_287506 ) ) ( not ( = ?auto_287504 ?auto_287507 ) ) ( not ( = ?auto_287504 ?auto_287508 ) ) ( not ( = ?auto_287504 ?auto_287509 ) ) ( not ( = ?auto_287504 ?auto_287510 ) ) ( not ( = ?auto_287504 ?auto_287511 ) ) ( not ( = ?auto_287504 ?auto_287512 ) ) ( not ( = ?auto_287504 ?auto_287513 ) ) ( not ( = ?auto_287504 ?auto_287514 ) ) ( not ( = ?auto_287504 ?auto_287515 ) ) ( not ( = ?auto_287504 ?auto_287516 ) ) ( not ( = ?auto_287504 ?auto_287517 ) ) ( not ( = ?auto_287505 ?auto_287506 ) ) ( not ( = ?auto_287505 ?auto_287507 ) ) ( not ( = ?auto_287505 ?auto_287508 ) ) ( not ( = ?auto_287505 ?auto_287509 ) ) ( not ( = ?auto_287505 ?auto_287510 ) ) ( not ( = ?auto_287505 ?auto_287511 ) ) ( not ( = ?auto_287505 ?auto_287512 ) ) ( not ( = ?auto_287505 ?auto_287513 ) ) ( not ( = ?auto_287505 ?auto_287514 ) ) ( not ( = ?auto_287505 ?auto_287515 ) ) ( not ( = ?auto_287505 ?auto_287516 ) ) ( not ( = ?auto_287505 ?auto_287517 ) ) ( not ( = ?auto_287506 ?auto_287507 ) ) ( not ( = ?auto_287506 ?auto_287508 ) ) ( not ( = ?auto_287506 ?auto_287509 ) ) ( not ( = ?auto_287506 ?auto_287510 ) ) ( not ( = ?auto_287506 ?auto_287511 ) ) ( not ( = ?auto_287506 ?auto_287512 ) ) ( not ( = ?auto_287506 ?auto_287513 ) ) ( not ( = ?auto_287506 ?auto_287514 ) ) ( not ( = ?auto_287506 ?auto_287515 ) ) ( not ( = ?auto_287506 ?auto_287516 ) ) ( not ( = ?auto_287506 ?auto_287517 ) ) ( not ( = ?auto_287507 ?auto_287508 ) ) ( not ( = ?auto_287507 ?auto_287509 ) ) ( not ( = ?auto_287507 ?auto_287510 ) ) ( not ( = ?auto_287507 ?auto_287511 ) ) ( not ( = ?auto_287507 ?auto_287512 ) ) ( not ( = ?auto_287507 ?auto_287513 ) ) ( not ( = ?auto_287507 ?auto_287514 ) ) ( not ( = ?auto_287507 ?auto_287515 ) ) ( not ( = ?auto_287507 ?auto_287516 ) ) ( not ( = ?auto_287507 ?auto_287517 ) ) ( not ( = ?auto_287508 ?auto_287509 ) ) ( not ( = ?auto_287508 ?auto_287510 ) ) ( not ( = ?auto_287508 ?auto_287511 ) ) ( not ( = ?auto_287508 ?auto_287512 ) ) ( not ( = ?auto_287508 ?auto_287513 ) ) ( not ( = ?auto_287508 ?auto_287514 ) ) ( not ( = ?auto_287508 ?auto_287515 ) ) ( not ( = ?auto_287508 ?auto_287516 ) ) ( not ( = ?auto_287508 ?auto_287517 ) ) ( not ( = ?auto_287509 ?auto_287510 ) ) ( not ( = ?auto_287509 ?auto_287511 ) ) ( not ( = ?auto_287509 ?auto_287512 ) ) ( not ( = ?auto_287509 ?auto_287513 ) ) ( not ( = ?auto_287509 ?auto_287514 ) ) ( not ( = ?auto_287509 ?auto_287515 ) ) ( not ( = ?auto_287509 ?auto_287516 ) ) ( not ( = ?auto_287509 ?auto_287517 ) ) ( not ( = ?auto_287510 ?auto_287511 ) ) ( not ( = ?auto_287510 ?auto_287512 ) ) ( not ( = ?auto_287510 ?auto_287513 ) ) ( not ( = ?auto_287510 ?auto_287514 ) ) ( not ( = ?auto_287510 ?auto_287515 ) ) ( not ( = ?auto_287510 ?auto_287516 ) ) ( not ( = ?auto_287510 ?auto_287517 ) ) ( not ( = ?auto_287511 ?auto_287512 ) ) ( not ( = ?auto_287511 ?auto_287513 ) ) ( not ( = ?auto_287511 ?auto_287514 ) ) ( not ( = ?auto_287511 ?auto_287515 ) ) ( not ( = ?auto_287511 ?auto_287516 ) ) ( not ( = ?auto_287511 ?auto_287517 ) ) ( not ( = ?auto_287512 ?auto_287513 ) ) ( not ( = ?auto_287512 ?auto_287514 ) ) ( not ( = ?auto_287512 ?auto_287515 ) ) ( not ( = ?auto_287512 ?auto_287516 ) ) ( not ( = ?auto_287512 ?auto_287517 ) ) ( not ( = ?auto_287513 ?auto_287514 ) ) ( not ( = ?auto_287513 ?auto_287515 ) ) ( not ( = ?auto_287513 ?auto_287516 ) ) ( not ( = ?auto_287513 ?auto_287517 ) ) ( not ( = ?auto_287514 ?auto_287515 ) ) ( not ( = ?auto_287514 ?auto_287516 ) ) ( not ( = ?auto_287514 ?auto_287517 ) ) ( not ( = ?auto_287515 ?auto_287516 ) ) ( not ( = ?auto_287515 ?auto_287517 ) ) ( not ( = ?auto_287516 ?auto_287517 ) ) ( ON ?auto_287516 ?auto_287517 ) ( ON ?auto_287515 ?auto_287516 ) ( ON ?auto_287514 ?auto_287515 ) ( ON ?auto_287513 ?auto_287514 ) ( ON ?auto_287512 ?auto_287513 ) ( ON ?auto_287511 ?auto_287512 ) ( ON ?auto_287510 ?auto_287511 ) ( ON ?auto_287509 ?auto_287510 ) ( CLEAR ?auto_287507 ) ( ON ?auto_287508 ?auto_287509 ) ( CLEAR ?auto_287508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_287504 ?auto_287505 ?auto_287506 ?auto_287507 ?auto_287508 )
      ( MAKE-14PILE ?auto_287504 ?auto_287505 ?auto_287506 ?auto_287507 ?auto_287508 ?auto_287509 ?auto_287510 ?auto_287511 ?auto_287512 ?auto_287513 ?auto_287514 ?auto_287515 ?auto_287516 ?auto_287517 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_287532 - BLOCK
      ?auto_287533 - BLOCK
      ?auto_287534 - BLOCK
      ?auto_287535 - BLOCK
      ?auto_287536 - BLOCK
      ?auto_287537 - BLOCK
      ?auto_287538 - BLOCK
      ?auto_287539 - BLOCK
      ?auto_287540 - BLOCK
      ?auto_287541 - BLOCK
      ?auto_287542 - BLOCK
      ?auto_287543 - BLOCK
      ?auto_287544 - BLOCK
      ?auto_287545 - BLOCK
    )
    :vars
    (
      ?auto_287546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287545 ?auto_287546 ) ( ON-TABLE ?auto_287532 ) ( ON ?auto_287533 ?auto_287532 ) ( ON ?auto_287534 ?auto_287533 ) ( not ( = ?auto_287532 ?auto_287533 ) ) ( not ( = ?auto_287532 ?auto_287534 ) ) ( not ( = ?auto_287532 ?auto_287535 ) ) ( not ( = ?auto_287532 ?auto_287536 ) ) ( not ( = ?auto_287532 ?auto_287537 ) ) ( not ( = ?auto_287532 ?auto_287538 ) ) ( not ( = ?auto_287532 ?auto_287539 ) ) ( not ( = ?auto_287532 ?auto_287540 ) ) ( not ( = ?auto_287532 ?auto_287541 ) ) ( not ( = ?auto_287532 ?auto_287542 ) ) ( not ( = ?auto_287532 ?auto_287543 ) ) ( not ( = ?auto_287532 ?auto_287544 ) ) ( not ( = ?auto_287532 ?auto_287545 ) ) ( not ( = ?auto_287532 ?auto_287546 ) ) ( not ( = ?auto_287533 ?auto_287534 ) ) ( not ( = ?auto_287533 ?auto_287535 ) ) ( not ( = ?auto_287533 ?auto_287536 ) ) ( not ( = ?auto_287533 ?auto_287537 ) ) ( not ( = ?auto_287533 ?auto_287538 ) ) ( not ( = ?auto_287533 ?auto_287539 ) ) ( not ( = ?auto_287533 ?auto_287540 ) ) ( not ( = ?auto_287533 ?auto_287541 ) ) ( not ( = ?auto_287533 ?auto_287542 ) ) ( not ( = ?auto_287533 ?auto_287543 ) ) ( not ( = ?auto_287533 ?auto_287544 ) ) ( not ( = ?auto_287533 ?auto_287545 ) ) ( not ( = ?auto_287533 ?auto_287546 ) ) ( not ( = ?auto_287534 ?auto_287535 ) ) ( not ( = ?auto_287534 ?auto_287536 ) ) ( not ( = ?auto_287534 ?auto_287537 ) ) ( not ( = ?auto_287534 ?auto_287538 ) ) ( not ( = ?auto_287534 ?auto_287539 ) ) ( not ( = ?auto_287534 ?auto_287540 ) ) ( not ( = ?auto_287534 ?auto_287541 ) ) ( not ( = ?auto_287534 ?auto_287542 ) ) ( not ( = ?auto_287534 ?auto_287543 ) ) ( not ( = ?auto_287534 ?auto_287544 ) ) ( not ( = ?auto_287534 ?auto_287545 ) ) ( not ( = ?auto_287534 ?auto_287546 ) ) ( not ( = ?auto_287535 ?auto_287536 ) ) ( not ( = ?auto_287535 ?auto_287537 ) ) ( not ( = ?auto_287535 ?auto_287538 ) ) ( not ( = ?auto_287535 ?auto_287539 ) ) ( not ( = ?auto_287535 ?auto_287540 ) ) ( not ( = ?auto_287535 ?auto_287541 ) ) ( not ( = ?auto_287535 ?auto_287542 ) ) ( not ( = ?auto_287535 ?auto_287543 ) ) ( not ( = ?auto_287535 ?auto_287544 ) ) ( not ( = ?auto_287535 ?auto_287545 ) ) ( not ( = ?auto_287535 ?auto_287546 ) ) ( not ( = ?auto_287536 ?auto_287537 ) ) ( not ( = ?auto_287536 ?auto_287538 ) ) ( not ( = ?auto_287536 ?auto_287539 ) ) ( not ( = ?auto_287536 ?auto_287540 ) ) ( not ( = ?auto_287536 ?auto_287541 ) ) ( not ( = ?auto_287536 ?auto_287542 ) ) ( not ( = ?auto_287536 ?auto_287543 ) ) ( not ( = ?auto_287536 ?auto_287544 ) ) ( not ( = ?auto_287536 ?auto_287545 ) ) ( not ( = ?auto_287536 ?auto_287546 ) ) ( not ( = ?auto_287537 ?auto_287538 ) ) ( not ( = ?auto_287537 ?auto_287539 ) ) ( not ( = ?auto_287537 ?auto_287540 ) ) ( not ( = ?auto_287537 ?auto_287541 ) ) ( not ( = ?auto_287537 ?auto_287542 ) ) ( not ( = ?auto_287537 ?auto_287543 ) ) ( not ( = ?auto_287537 ?auto_287544 ) ) ( not ( = ?auto_287537 ?auto_287545 ) ) ( not ( = ?auto_287537 ?auto_287546 ) ) ( not ( = ?auto_287538 ?auto_287539 ) ) ( not ( = ?auto_287538 ?auto_287540 ) ) ( not ( = ?auto_287538 ?auto_287541 ) ) ( not ( = ?auto_287538 ?auto_287542 ) ) ( not ( = ?auto_287538 ?auto_287543 ) ) ( not ( = ?auto_287538 ?auto_287544 ) ) ( not ( = ?auto_287538 ?auto_287545 ) ) ( not ( = ?auto_287538 ?auto_287546 ) ) ( not ( = ?auto_287539 ?auto_287540 ) ) ( not ( = ?auto_287539 ?auto_287541 ) ) ( not ( = ?auto_287539 ?auto_287542 ) ) ( not ( = ?auto_287539 ?auto_287543 ) ) ( not ( = ?auto_287539 ?auto_287544 ) ) ( not ( = ?auto_287539 ?auto_287545 ) ) ( not ( = ?auto_287539 ?auto_287546 ) ) ( not ( = ?auto_287540 ?auto_287541 ) ) ( not ( = ?auto_287540 ?auto_287542 ) ) ( not ( = ?auto_287540 ?auto_287543 ) ) ( not ( = ?auto_287540 ?auto_287544 ) ) ( not ( = ?auto_287540 ?auto_287545 ) ) ( not ( = ?auto_287540 ?auto_287546 ) ) ( not ( = ?auto_287541 ?auto_287542 ) ) ( not ( = ?auto_287541 ?auto_287543 ) ) ( not ( = ?auto_287541 ?auto_287544 ) ) ( not ( = ?auto_287541 ?auto_287545 ) ) ( not ( = ?auto_287541 ?auto_287546 ) ) ( not ( = ?auto_287542 ?auto_287543 ) ) ( not ( = ?auto_287542 ?auto_287544 ) ) ( not ( = ?auto_287542 ?auto_287545 ) ) ( not ( = ?auto_287542 ?auto_287546 ) ) ( not ( = ?auto_287543 ?auto_287544 ) ) ( not ( = ?auto_287543 ?auto_287545 ) ) ( not ( = ?auto_287543 ?auto_287546 ) ) ( not ( = ?auto_287544 ?auto_287545 ) ) ( not ( = ?auto_287544 ?auto_287546 ) ) ( not ( = ?auto_287545 ?auto_287546 ) ) ( ON ?auto_287544 ?auto_287545 ) ( ON ?auto_287543 ?auto_287544 ) ( ON ?auto_287542 ?auto_287543 ) ( ON ?auto_287541 ?auto_287542 ) ( ON ?auto_287540 ?auto_287541 ) ( ON ?auto_287539 ?auto_287540 ) ( ON ?auto_287538 ?auto_287539 ) ( ON ?auto_287537 ?auto_287538 ) ( ON ?auto_287536 ?auto_287537 ) ( CLEAR ?auto_287534 ) ( ON ?auto_287535 ?auto_287536 ) ( CLEAR ?auto_287535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_287532 ?auto_287533 ?auto_287534 ?auto_287535 )
      ( MAKE-14PILE ?auto_287532 ?auto_287533 ?auto_287534 ?auto_287535 ?auto_287536 ?auto_287537 ?auto_287538 ?auto_287539 ?auto_287540 ?auto_287541 ?auto_287542 ?auto_287543 ?auto_287544 ?auto_287545 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_287561 - BLOCK
      ?auto_287562 - BLOCK
      ?auto_287563 - BLOCK
      ?auto_287564 - BLOCK
      ?auto_287565 - BLOCK
      ?auto_287566 - BLOCK
      ?auto_287567 - BLOCK
      ?auto_287568 - BLOCK
      ?auto_287569 - BLOCK
      ?auto_287570 - BLOCK
      ?auto_287571 - BLOCK
      ?auto_287572 - BLOCK
      ?auto_287573 - BLOCK
      ?auto_287574 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_287574 ) ( ON-TABLE ?auto_287561 ) ( ON ?auto_287562 ?auto_287561 ) ( ON ?auto_287563 ?auto_287562 ) ( not ( = ?auto_287561 ?auto_287562 ) ) ( not ( = ?auto_287561 ?auto_287563 ) ) ( not ( = ?auto_287561 ?auto_287564 ) ) ( not ( = ?auto_287561 ?auto_287565 ) ) ( not ( = ?auto_287561 ?auto_287566 ) ) ( not ( = ?auto_287561 ?auto_287567 ) ) ( not ( = ?auto_287561 ?auto_287568 ) ) ( not ( = ?auto_287561 ?auto_287569 ) ) ( not ( = ?auto_287561 ?auto_287570 ) ) ( not ( = ?auto_287561 ?auto_287571 ) ) ( not ( = ?auto_287561 ?auto_287572 ) ) ( not ( = ?auto_287561 ?auto_287573 ) ) ( not ( = ?auto_287561 ?auto_287574 ) ) ( not ( = ?auto_287562 ?auto_287563 ) ) ( not ( = ?auto_287562 ?auto_287564 ) ) ( not ( = ?auto_287562 ?auto_287565 ) ) ( not ( = ?auto_287562 ?auto_287566 ) ) ( not ( = ?auto_287562 ?auto_287567 ) ) ( not ( = ?auto_287562 ?auto_287568 ) ) ( not ( = ?auto_287562 ?auto_287569 ) ) ( not ( = ?auto_287562 ?auto_287570 ) ) ( not ( = ?auto_287562 ?auto_287571 ) ) ( not ( = ?auto_287562 ?auto_287572 ) ) ( not ( = ?auto_287562 ?auto_287573 ) ) ( not ( = ?auto_287562 ?auto_287574 ) ) ( not ( = ?auto_287563 ?auto_287564 ) ) ( not ( = ?auto_287563 ?auto_287565 ) ) ( not ( = ?auto_287563 ?auto_287566 ) ) ( not ( = ?auto_287563 ?auto_287567 ) ) ( not ( = ?auto_287563 ?auto_287568 ) ) ( not ( = ?auto_287563 ?auto_287569 ) ) ( not ( = ?auto_287563 ?auto_287570 ) ) ( not ( = ?auto_287563 ?auto_287571 ) ) ( not ( = ?auto_287563 ?auto_287572 ) ) ( not ( = ?auto_287563 ?auto_287573 ) ) ( not ( = ?auto_287563 ?auto_287574 ) ) ( not ( = ?auto_287564 ?auto_287565 ) ) ( not ( = ?auto_287564 ?auto_287566 ) ) ( not ( = ?auto_287564 ?auto_287567 ) ) ( not ( = ?auto_287564 ?auto_287568 ) ) ( not ( = ?auto_287564 ?auto_287569 ) ) ( not ( = ?auto_287564 ?auto_287570 ) ) ( not ( = ?auto_287564 ?auto_287571 ) ) ( not ( = ?auto_287564 ?auto_287572 ) ) ( not ( = ?auto_287564 ?auto_287573 ) ) ( not ( = ?auto_287564 ?auto_287574 ) ) ( not ( = ?auto_287565 ?auto_287566 ) ) ( not ( = ?auto_287565 ?auto_287567 ) ) ( not ( = ?auto_287565 ?auto_287568 ) ) ( not ( = ?auto_287565 ?auto_287569 ) ) ( not ( = ?auto_287565 ?auto_287570 ) ) ( not ( = ?auto_287565 ?auto_287571 ) ) ( not ( = ?auto_287565 ?auto_287572 ) ) ( not ( = ?auto_287565 ?auto_287573 ) ) ( not ( = ?auto_287565 ?auto_287574 ) ) ( not ( = ?auto_287566 ?auto_287567 ) ) ( not ( = ?auto_287566 ?auto_287568 ) ) ( not ( = ?auto_287566 ?auto_287569 ) ) ( not ( = ?auto_287566 ?auto_287570 ) ) ( not ( = ?auto_287566 ?auto_287571 ) ) ( not ( = ?auto_287566 ?auto_287572 ) ) ( not ( = ?auto_287566 ?auto_287573 ) ) ( not ( = ?auto_287566 ?auto_287574 ) ) ( not ( = ?auto_287567 ?auto_287568 ) ) ( not ( = ?auto_287567 ?auto_287569 ) ) ( not ( = ?auto_287567 ?auto_287570 ) ) ( not ( = ?auto_287567 ?auto_287571 ) ) ( not ( = ?auto_287567 ?auto_287572 ) ) ( not ( = ?auto_287567 ?auto_287573 ) ) ( not ( = ?auto_287567 ?auto_287574 ) ) ( not ( = ?auto_287568 ?auto_287569 ) ) ( not ( = ?auto_287568 ?auto_287570 ) ) ( not ( = ?auto_287568 ?auto_287571 ) ) ( not ( = ?auto_287568 ?auto_287572 ) ) ( not ( = ?auto_287568 ?auto_287573 ) ) ( not ( = ?auto_287568 ?auto_287574 ) ) ( not ( = ?auto_287569 ?auto_287570 ) ) ( not ( = ?auto_287569 ?auto_287571 ) ) ( not ( = ?auto_287569 ?auto_287572 ) ) ( not ( = ?auto_287569 ?auto_287573 ) ) ( not ( = ?auto_287569 ?auto_287574 ) ) ( not ( = ?auto_287570 ?auto_287571 ) ) ( not ( = ?auto_287570 ?auto_287572 ) ) ( not ( = ?auto_287570 ?auto_287573 ) ) ( not ( = ?auto_287570 ?auto_287574 ) ) ( not ( = ?auto_287571 ?auto_287572 ) ) ( not ( = ?auto_287571 ?auto_287573 ) ) ( not ( = ?auto_287571 ?auto_287574 ) ) ( not ( = ?auto_287572 ?auto_287573 ) ) ( not ( = ?auto_287572 ?auto_287574 ) ) ( not ( = ?auto_287573 ?auto_287574 ) ) ( ON ?auto_287573 ?auto_287574 ) ( ON ?auto_287572 ?auto_287573 ) ( ON ?auto_287571 ?auto_287572 ) ( ON ?auto_287570 ?auto_287571 ) ( ON ?auto_287569 ?auto_287570 ) ( ON ?auto_287568 ?auto_287569 ) ( ON ?auto_287567 ?auto_287568 ) ( ON ?auto_287566 ?auto_287567 ) ( ON ?auto_287565 ?auto_287566 ) ( CLEAR ?auto_287563 ) ( ON ?auto_287564 ?auto_287565 ) ( CLEAR ?auto_287564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_287561 ?auto_287562 ?auto_287563 ?auto_287564 )
      ( MAKE-14PILE ?auto_287561 ?auto_287562 ?auto_287563 ?auto_287564 ?auto_287565 ?auto_287566 ?auto_287567 ?auto_287568 ?auto_287569 ?auto_287570 ?auto_287571 ?auto_287572 ?auto_287573 ?auto_287574 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_287589 - BLOCK
      ?auto_287590 - BLOCK
      ?auto_287591 - BLOCK
      ?auto_287592 - BLOCK
      ?auto_287593 - BLOCK
      ?auto_287594 - BLOCK
      ?auto_287595 - BLOCK
      ?auto_287596 - BLOCK
      ?auto_287597 - BLOCK
      ?auto_287598 - BLOCK
      ?auto_287599 - BLOCK
      ?auto_287600 - BLOCK
      ?auto_287601 - BLOCK
      ?auto_287602 - BLOCK
    )
    :vars
    (
      ?auto_287603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287602 ?auto_287603 ) ( ON-TABLE ?auto_287589 ) ( ON ?auto_287590 ?auto_287589 ) ( not ( = ?auto_287589 ?auto_287590 ) ) ( not ( = ?auto_287589 ?auto_287591 ) ) ( not ( = ?auto_287589 ?auto_287592 ) ) ( not ( = ?auto_287589 ?auto_287593 ) ) ( not ( = ?auto_287589 ?auto_287594 ) ) ( not ( = ?auto_287589 ?auto_287595 ) ) ( not ( = ?auto_287589 ?auto_287596 ) ) ( not ( = ?auto_287589 ?auto_287597 ) ) ( not ( = ?auto_287589 ?auto_287598 ) ) ( not ( = ?auto_287589 ?auto_287599 ) ) ( not ( = ?auto_287589 ?auto_287600 ) ) ( not ( = ?auto_287589 ?auto_287601 ) ) ( not ( = ?auto_287589 ?auto_287602 ) ) ( not ( = ?auto_287589 ?auto_287603 ) ) ( not ( = ?auto_287590 ?auto_287591 ) ) ( not ( = ?auto_287590 ?auto_287592 ) ) ( not ( = ?auto_287590 ?auto_287593 ) ) ( not ( = ?auto_287590 ?auto_287594 ) ) ( not ( = ?auto_287590 ?auto_287595 ) ) ( not ( = ?auto_287590 ?auto_287596 ) ) ( not ( = ?auto_287590 ?auto_287597 ) ) ( not ( = ?auto_287590 ?auto_287598 ) ) ( not ( = ?auto_287590 ?auto_287599 ) ) ( not ( = ?auto_287590 ?auto_287600 ) ) ( not ( = ?auto_287590 ?auto_287601 ) ) ( not ( = ?auto_287590 ?auto_287602 ) ) ( not ( = ?auto_287590 ?auto_287603 ) ) ( not ( = ?auto_287591 ?auto_287592 ) ) ( not ( = ?auto_287591 ?auto_287593 ) ) ( not ( = ?auto_287591 ?auto_287594 ) ) ( not ( = ?auto_287591 ?auto_287595 ) ) ( not ( = ?auto_287591 ?auto_287596 ) ) ( not ( = ?auto_287591 ?auto_287597 ) ) ( not ( = ?auto_287591 ?auto_287598 ) ) ( not ( = ?auto_287591 ?auto_287599 ) ) ( not ( = ?auto_287591 ?auto_287600 ) ) ( not ( = ?auto_287591 ?auto_287601 ) ) ( not ( = ?auto_287591 ?auto_287602 ) ) ( not ( = ?auto_287591 ?auto_287603 ) ) ( not ( = ?auto_287592 ?auto_287593 ) ) ( not ( = ?auto_287592 ?auto_287594 ) ) ( not ( = ?auto_287592 ?auto_287595 ) ) ( not ( = ?auto_287592 ?auto_287596 ) ) ( not ( = ?auto_287592 ?auto_287597 ) ) ( not ( = ?auto_287592 ?auto_287598 ) ) ( not ( = ?auto_287592 ?auto_287599 ) ) ( not ( = ?auto_287592 ?auto_287600 ) ) ( not ( = ?auto_287592 ?auto_287601 ) ) ( not ( = ?auto_287592 ?auto_287602 ) ) ( not ( = ?auto_287592 ?auto_287603 ) ) ( not ( = ?auto_287593 ?auto_287594 ) ) ( not ( = ?auto_287593 ?auto_287595 ) ) ( not ( = ?auto_287593 ?auto_287596 ) ) ( not ( = ?auto_287593 ?auto_287597 ) ) ( not ( = ?auto_287593 ?auto_287598 ) ) ( not ( = ?auto_287593 ?auto_287599 ) ) ( not ( = ?auto_287593 ?auto_287600 ) ) ( not ( = ?auto_287593 ?auto_287601 ) ) ( not ( = ?auto_287593 ?auto_287602 ) ) ( not ( = ?auto_287593 ?auto_287603 ) ) ( not ( = ?auto_287594 ?auto_287595 ) ) ( not ( = ?auto_287594 ?auto_287596 ) ) ( not ( = ?auto_287594 ?auto_287597 ) ) ( not ( = ?auto_287594 ?auto_287598 ) ) ( not ( = ?auto_287594 ?auto_287599 ) ) ( not ( = ?auto_287594 ?auto_287600 ) ) ( not ( = ?auto_287594 ?auto_287601 ) ) ( not ( = ?auto_287594 ?auto_287602 ) ) ( not ( = ?auto_287594 ?auto_287603 ) ) ( not ( = ?auto_287595 ?auto_287596 ) ) ( not ( = ?auto_287595 ?auto_287597 ) ) ( not ( = ?auto_287595 ?auto_287598 ) ) ( not ( = ?auto_287595 ?auto_287599 ) ) ( not ( = ?auto_287595 ?auto_287600 ) ) ( not ( = ?auto_287595 ?auto_287601 ) ) ( not ( = ?auto_287595 ?auto_287602 ) ) ( not ( = ?auto_287595 ?auto_287603 ) ) ( not ( = ?auto_287596 ?auto_287597 ) ) ( not ( = ?auto_287596 ?auto_287598 ) ) ( not ( = ?auto_287596 ?auto_287599 ) ) ( not ( = ?auto_287596 ?auto_287600 ) ) ( not ( = ?auto_287596 ?auto_287601 ) ) ( not ( = ?auto_287596 ?auto_287602 ) ) ( not ( = ?auto_287596 ?auto_287603 ) ) ( not ( = ?auto_287597 ?auto_287598 ) ) ( not ( = ?auto_287597 ?auto_287599 ) ) ( not ( = ?auto_287597 ?auto_287600 ) ) ( not ( = ?auto_287597 ?auto_287601 ) ) ( not ( = ?auto_287597 ?auto_287602 ) ) ( not ( = ?auto_287597 ?auto_287603 ) ) ( not ( = ?auto_287598 ?auto_287599 ) ) ( not ( = ?auto_287598 ?auto_287600 ) ) ( not ( = ?auto_287598 ?auto_287601 ) ) ( not ( = ?auto_287598 ?auto_287602 ) ) ( not ( = ?auto_287598 ?auto_287603 ) ) ( not ( = ?auto_287599 ?auto_287600 ) ) ( not ( = ?auto_287599 ?auto_287601 ) ) ( not ( = ?auto_287599 ?auto_287602 ) ) ( not ( = ?auto_287599 ?auto_287603 ) ) ( not ( = ?auto_287600 ?auto_287601 ) ) ( not ( = ?auto_287600 ?auto_287602 ) ) ( not ( = ?auto_287600 ?auto_287603 ) ) ( not ( = ?auto_287601 ?auto_287602 ) ) ( not ( = ?auto_287601 ?auto_287603 ) ) ( not ( = ?auto_287602 ?auto_287603 ) ) ( ON ?auto_287601 ?auto_287602 ) ( ON ?auto_287600 ?auto_287601 ) ( ON ?auto_287599 ?auto_287600 ) ( ON ?auto_287598 ?auto_287599 ) ( ON ?auto_287597 ?auto_287598 ) ( ON ?auto_287596 ?auto_287597 ) ( ON ?auto_287595 ?auto_287596 ) ( ON ?auto_287594 ?auto_287595 ) ( ON ?auto_287593 ?auto_287594 ) ( ON ?auto_287592 ?auto_287593 ) ( CLEAR ?auto_287590 ) ( ON ?auto_287591 ?auto_287592 ) ( CLEAR ?auto_287591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_287589 ?auto_287590 ?auto_287591 )
      ( MAKE-14PILE ?auto_287589 ?auto_287590 ?auto_287591 ?auto_287592 ?auto_287593 ?auto_287594 ?auto_287595 ?auto_287596 ?auto_287597 ?auto_287598 ?auto_287599 ?auto_287600 ?auto_287601 ?auto_287602 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_287618 - BLOCK
      ?auto_287619 - BLOCK
      ?auto_287620 - BLOCK
      ?auto_287621 - BLOCK
      ?auto_287622 - BLOCK
      ?auto_287623 - BLOCK
      ?auto_287624 - BLOCK
      ?auto_287625 - BLOCK
      ?auto_287626 - BLOCK
      ?auto_287627 - BLOCK
      ?auto_287628 - BLOCK
      ?auto_287629 - BLOCK
      ?auto_287630 - BLOCK
      ?auto_287631 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_287631 ) ( ON-TABLE ?auto_287618 ) ( ON ?auto_287619 ?auto_287618 ) ( not ( = ?auto_287618 ?auto_287619 ) ) ( not ( = ?auto_287618 ?auto_287620 ) ) ( not ( = ?auto_287618 ?auto_287621 ) ) ( not ( = ?auto_287618 ?auto_287622 ) ) ( not ( = ?auto_287618 ?auto_287623 ) ) ( not ( = ?auto_287618 ?auto_287624 ) ) ( not ( = ?auto_287618 ?auto_287625 ) ) ( not ( = ?auto_287618 ?auto_287626 ) ) ( not ( = ?auto_287618 ?auto_287627 ) ) ( not ( = ?auto_287618 ?auto_287628 ) ) ( not ( = ?auto_287618 ?auto_287629 ) ) ( not ( = ?auto_287618 ?auto_287630 ) ) ( not ( = ?auto_287618 ?auto_287631 ) ) ( not ( = ?auto_287619 ?auto_287620 ) ) ( not ( = ?auto_287619 ?auto_287621 ) ) ( not ( = ?auto_287619 ?auto_287622 ) ) ( not ( = ?auto_287619 ?auto_287623 ) ) ( not ( = ?auto_287619 ?auto_287624 ) ) ( not ( = ?auto_287619 ?auto_287625 ) ) ( not ( = ?auto_287619 ?auto_287626 ) ) ( not ( = ?auto_287619 ?auto_287627 ) ) ( not ( = ?auto_287619 ?auto_287628 ) ) ( not ( = ?auto_287619 ?auto_287629 ) ) ( not ( = ?auto_287619 ?auto_287630 ) ) ( not ( = ?auto_287619 ?auto_287631 ) ) ( not ( = ?auto_287620 ?auto_287621 ) ) ( not ( = ?auto_287620 ?auto_287622 ) ) ( not ( = ?auto_287620 ?auto_287623 ) ) ( not ( = ?auto_287620 ?auto_287624 ) ) ( not ( = ?auto_287620 ?auto_287625 ) ) ( not ( = ?auto_287620 ?auto_287626 ) ) ( not ( = ?auto_287620 ?auto_287627 ) ) ( not ( = ?auto_287620 ?auto_287628 ) ) ( not ( = ?auto_287620 ?auto_287629 ) ) ( not ( = ?auto_287620 ?auto_287630 ) ) ( not ( = ?auto_287620 ?auto_287631 ) ) ( not ( = ?auto_287621 ?auto_287622 ) ) ( not ( = ?auto_287621 ?auto_287623 ) ) ( not ( = ?auto_287621 ?auto_287624 ) ) ( not ( = ?auto_287621 ?auto_287625 ) ) ( not ( = ?auto_287621 ?auto_287626 ) ) ( not ( = ?auto_287621 ?auto_287627 ) ) ( not ( = ?auto_287621 ?auto_287628 ) ) ( not ( = ?auto_287621 ?auto_287629 ) ) ( not ( = ?auto_287621 ?auto_287630 ) ) ( not ( = ?auto_287621 ?auto_287631 ) ) ( not ( = ?auto_287622 ?auto_287623 ) ) ( not ( = ?auto_287622 ?auto_287624 ) ) ( not ( = ?auto_287622 ?auto_287625 ) ) ( not ( = ?auto_287622 ?auto_287626 ) ) ( not ( = ?auto_287622 ?auto_287627 ) ) ( not ( = ?auto_287622 ?auto_287628 ) ) ( not ( = ?auto_287622 ?auto_287629 ) ) ( not ( = ?auto_287622 ?auto_287630 ) ) ( not ( = ?auto_287622 ?auto_287631 ) ) ( not ( = ?auto_287623 ?auto_287624 ) ) ( not ( = ?auto_287623 ?auto_287625 ) ) ( not ( = ?auto_287623 ?auto_287626 ) ) ( not ( = ?auto_287623 ?auto_287627 ) ) ( not ( = ?auto_287623 ?auto_287628 ) ) ( not ( = ?auto_287623 ?auto_287629 ) ) ( not ( = ?auto_287623 ?auto_287630 ) ) ( not ( = ?auto_287623 ?auto_287631 ) ) ( not ( = ?auto_287624 ?auto_287625 ) ) ( not ( = ?auto_287624 ?auto_287626 ) ) ( not ( = ?auto_287624 ?auto_287627 ) ) ( not ( = ?auto_287624 ?auto_287628 ) ) ( not ( = ?auto_287624 ?auto_287629 ) ) ( not ( = ?auto_287624 ?auto_287630 ) ) ( not ( = ?auto_287624 ?auto_287631 ) ) ( not ( = ?auto_287625 ?auto_287626 ) ) ( not ( = ?auto_287625 ?auto_287627 ) ) ( not ( = ?auto_287625 ?auto_287628 ) ) ( not ( = ?auto_287625 ?auto_287629 ) ) ( not ( = ?auto_287625 ?auto_287630 ) ) ( not ( = ?auto_287625 ?auto_287631 ) ) ( not ( = ?auto_287626 ?auto_287627 ) ) ( not ( = ?auto_287626 ?auto_287628 ) ) ( not ( = ?auto_287626 ?auto_287629 ) ) ( not ( = ?auto_287626 ?auto_287630 ) ) ( not ( = ?auto_287626 ?auto_287631 ) ) ( not ( = ?auto_287627 ?auto_287628 ) ) ( not ( = ?auto_287627 ?auto_287629 ) ) ( not ( = ?auto_287627 ?auto_287630 ) ) ( not ( = ?auto_287627 ?auto_287631 ) ) ( not ( = ?auto_287628 ?auto_287629 ) ) ( not ( = ?auto_287628 ?auto_287630 ) ) ( not ( = ?auto_287628 ?auto_287631 ) ) ( not ( = ?auto_287629 ?auto_287630 ) ) ( not ( = ?auto_287629 ?auto_287631 ) ) ( not ( = ?auto_287630 ?auto_287631 ) ) ( ON ?auto_287630 ?auto_287631 ) ( ON ?auto_287629 ?auto_287630 ) ( ON ?auto_287628 ?auto_287629 ) ( ON ?auto_287627 ?auto_287628 ) ( ON ?auto_287626 ?auto_287627 ) ( ON ?auto_287625 ?auto_287626 ) ( ON ?auto_287624 ?auto_287625 ) ( ON ?auto_287623 ?auto_287624 ) ( ON ?auto_287622 ?auto_287623 ) ( ON ?auto_287621 ?auto_287622 ) ( CLEAR ?auto_287619 ) ( ON ?auto_287620 ?auto_287621 ) ( CLEAR ?auto_287620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_287618 ?auto_287619 ?auto_287620 )
      ( MAKE-14PILE ?auto_287618 ?auto_287619 ?auto_287620 ?auto_287621 ?auto_287622 ?auto_287623 ?auto_287624 ?auto_287625 ?auto_287626 ?auto_287627 ?auto_287628 ?auto_287629 ?auto_287630 ?auto_287631 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_287646 - BLOCK
      ?auto_287647 - BLOCK
      ?auto_287648 - BLOCK
      ?auto_287649 - BLOCK
      ?auto_287650 - BLOCK
      ?auto_287651 - BLOCK
      ?auto_287652 - BLOCK
      ?auto_287653 - BLOCK
      ?auto_287654 - BLOCK
      ?auto_287655 - BLOCK
      ?auto_287656 - BLOCK
      ?auto_287657 - BLOCK
      ?auto_287658 - BLOCK
      ?auto_287659 - BLOCK
    )
    :vars
    (
      ?auto_287660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287659 ?auto_287660 ) ( ON-TABLE ?auto_287646 ) ( not ( = ?auto_287646 ?auto_287647 ) ) ( not ( = ?auto_287646 ?auto_287648 ) ) ( not ( = ?auto_287646 ?auto_287649 ) ) ( not ( = ?auto_287646 ?auto_287650 ) ) ( not ( = ?auto_287646 ?auto_287651 ) ) ( not ( = ?auto_287646 ?auto_287652 ) ) ( not ( = ?auto_287646 ?auto_287653 ) ) ( not ( = ?auto_287646 ?auto_287654 ) ) ( not ( = ?auto_287646 ?auto_287655 ) ) ( not ( = ?auto_287646 ?auto_287656 ) ) ( not ( = ?auto_287646 ?auto_287657 ) ) ( not ( = ?auto_287646 ?auto_287658 ) ) ( not ( = ?auto_287646 ?auto_287659 ) ) ( not ( = ?auto_287646 ?auto_287660 ) ) ( not ( = ?auto_287647 ?auto_287648 ) ) ( not ( = ?auto_287647 ?auto_287649 ) ) ( not ( = ?auto_287647 ?auto_287650 ) ) ( not ( = ?auto_287647 ?auto_287651 ) ) ( not ( = ?auto_287647 ?auto_287652 ) ) ( not ( = ?auto_287647 ?auto_287653 ) ) ( not ( = ?auto_287647 ?auto_287654 ) ) ( not ( = ?auto_287647 ?auto_287655 ) ) ( not ( = ?auto_287647 ?auto_287656 ) ) ( not ( = ?auto_287647 ?auto_287657 ) ) ( not ( = ?auto_287647 ?auto_287658 ) ) ( not ( = ?auto_287647 ?auto_287659 ) ) ( not ( = ?auto_287647 ?auto_287660 ) ) ( not ( = ?auto_287648 ?auto_287649 ) ) ( not ( = ?auto_287648 ?auto_287650 ) ) ( not ( = ?auto_287648 ?auto_287651 ) ) ( not ( = ?auto_287648 ?auto_287652 ) ) ( not ( = ?auto_287648 ?auto_287653 ) ) ( not ( = ?auto_287648 ?auto_287654 ) ) ( not ( = ?auto_287648 ?auto_287655 ) ) ( not ( = ?auto_287648 ?auto_287656 ) ) ( not ( = ?auto_287648 ?auto_287657 ) ) ( not ( = ?auto_287648 ?auto_287658 ) ) ( not ( = ?auto_287648 ?auto_287659 ) ) ( not ( = ?auto_287648 ?auto_287660 ) ) ( not ( = ?auto_287649 ?auto_287650 ) ) ( not ( = ?auto_287649 ?auto_287651 ) ) ( not ( = ?auto_287649 ?auto_287652 ) ) ( not ( = ?auto_287649 ?auto_287653 ) ) ( not ( = ?auto_287649 ?auto_287654 ) ) ( not ( = ?auto_287649 ?auto_287655 ) ) ( not ( = ?auto_287649 ?auto_287656 ) ) ( not ( = ?auto_287649 ?auto_287657 ) ) ( not ( = ?auto_287649 ?auto_287658 ) ) ( not ( = ?auto_287649 ?auto_287659 ) ) ( not ( = ?auto_287649 ?auto_287660 ) ) ( not ( = ?auto_287650 ?auto_287651 ) ) ( not ( = ?auto_287650 ?auto_287652 ) ) ( not ( = ?auto_287650 ?auto_287653 ) ) ( not ( = ?auto_287650 ?auto_287654 ) ) ( not ( = ?auto_287650 ?auto_287655 ) ) ( not ( = ?auto_287650 ?auto_287656 ) ) ( not ( = ?auto_287650 ?auto_287657 ) ) ( not ( = ?auto_287650 ?auto_287658 ) ) ( not ( = ?auto_287650 ?auto_287659 ) ) ( not ( = ?auto_287650 ?auto_287660 ) ) ( not ( = ?auto_287651 ?auto_287652 ) ) ( not ( = ?auto_287651 ?auto_287653 ) ) ( not ( = ?auto_287651 ?auto_287654 ) ) ( not ( = ?auto_287651 ?auto_287655 ) ) ( not ( = ?auto_287651 ?auto_287656 ) ) ( not ( = ?auto_287651 ?auto_287657 ) ) ( not ( = ?auto_287651 ?auto_287658 ) ) ( not ( = ?auto_287651 ?auto_287659 ) ) ( not ( = ?auto_287651 ?auto_287660 ) ) ( not ( = ?auto_287652 ?auto_287653 ) ) ( not ( = ?auto_287652 ?auto_287654 ) ) ( not ( = ?auto_287652 ?auto_287655 ) ) ( not ( = ?auto_287652 ?auto_287656 ) ) ( not ( = ?auto_287652 ?auto_287657 ) ) ( not ( = ?auto_287652 ?auto_287658 ) ) ( not ( = ?auto_287652 ?auto_287659 ) ) ( not ( = ?auto_287652 ?auto_287660 ) ) ( not ( = ?auto_287653 ?auto_287654 ) ) ( not ( = ?auto_287653 ?auto_287655 ) ) ( not ( = ?auto_287653 ?auto_287656 ) ) ( not ( = ?auto_287653 ?auto_287657 ) ) ( not ( = ?auto_287653 ?auto_287658 ) ) ( not ( = ?auto_287653 ?auto_287659 ) ) ( not ( = ?auto_287653 ?auto_287660 ) ) ( not ( = ?auto_287654 ?auto_287655 ) ) ( not ( = ?auto_287654 ?auto_287656 ) ) ( not ( = ?auto_287654 ?auto_287657 ) ) ( not ( = ?auto_287654 ?auto_287658 ) ) ( not ( = ?auto_287654 ?auto_287659 ) ) ( not ( = ?auto_287654 ?auto_287660 ) ) ( not ( = ?auto_287655 ?auto_287656 ) ) ( not ( = ?auto_287655 ?auto_287657 ) ) ( not ( = ?auto_287655 ?auto_287658 ) ) ( not ( = ?auto_287655 ?auto_287659 ) ) ( not ( = ?auto_287655 ?auto_287660 ) ) ( not ( = ?auto_287656 ?auto_287657 ) ) ( not ( = ?auto_287656 ?auto_287658 ) ) ( not ( = ?auto_287656 ?auto_287659 ) ) ( not ( = ?auto_287656 ?auto_287660 ) ) ( not ( = ?auto_287657 ?auto_287658 ) ) ( not ( = ?auto_287657 ?auto_287659 ) ) ( not ( = ?auto_287657 ?auto_287660 ) ) ( not ( = ?auto_287658 ?auto_287659 ) ) ( not ( = ?auto_287658 ?auto_287660 ) ) ( not ( = ?auto_287659 ?auto_287660 ) ) ( ON ?auto_287658 ?auto_287659 ) ( ON ?auto_287657 ?auto_287658 ) ( ON ?auto_287656 ?auto_287657 ) ( ON ?auto_287655 ?auto_287656 ) ( ON ?auto_287654 ?auto_287655 ) ( ON ?auto_287653 ?auto_287654 ) ( ON ?auto_287652 ?auto_287653 ) ( ON ?auto_287651 ?auto_287652 ) ( ON ?auto_287650 ?auto_287651 ) ( ON ?auto_287649 ?auto_287650 ) ( ON ?auto_287648 ?auto_287649 ) ( CLEAR ?auto_287646 ) ( ON ?auto_287647 ?auto_287648 ) ( CLEAR ?auto_287647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_287646 ?auto_287647 )
      ( MAKE-14PILE ?auto_287646 ?auto_287647 ?auto_287648 ?auto_287649 ?auto_287650 ?auto_287651 ?auto_287652 ?auto_287653 ?auto_287654 ?auto_287655 ?auto_287656 ?auto_287657 ?auto_287658 ?auto_287659 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_287675 - BLOCK
      ?auto_287676 - BLOCK
      ?auto_287677 - BLOCK
      ?auto_287678 - BLOCK
      ?auto_287679 - BLOCK
      ?auto_287680 - BLOCK
      ?auto_287681 - BLOCK
      ?auto_287682 - BLOCK
      ?auto_287683 - BLOCK
      ?auto_287684 - BLOCK
      ?auto_287685 - BLOCK
      ?auto_287686 - BLOCK
      ?auto_287687 - BLOCK
      ?auto_287688 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_287688 ) ( ON-TABLE ?auto_287675 ) ( not ( = ?auto_287675 ?auto_287676 ) ) ( not ( = ?auto_287675 ?auto_287677 ) ) ( not ( = ?auto_287675 ?auto_287678 ) ) ( not ( = ?auto_287675 ?auto_287679 ) ) ( not ( = ?auto_287675 ?auto_287680 ) ) ( not ( = ?auto_287675 ?auto_287681 ) ) ( not ( = ?auto_287675 ?auto_287682 ) ) ( not ( = ?auto_287675 ?auto_287683 ) ) ( not ( = ?auto_287675 ?auto_287684 ) ) ( not ( = ?auto_287675 ?auto_287685 ) ) ( not ( = ?auto_287675 ?auto_287686 ) ) ( not ( = ?auto_287675 ?auto_287687 ) ) ( not ( = ?auto_287675 ?auto_287688 ) ) ( not ( = ?auto_287676 ?auto_287677 ) ) ( not ( = ?auto_287676 ?auto_287678 ) ) ( not ( = ?auto_287676 ?auto_287679 ) ) ( not ( = ?auto_287676 ?auto_287680 ) ) ( not ( = ?auto_287676 ?auto_287681 ) ) ( not ( = ?auto_287676 ?auto_287682 ) ) ( not ( = ?auto_287676 ?auto_287683 ) ) ( not ( = ?auto_287676 ?auto_287684 ) ) ( not ( = ?auto_287676 ?auto_287685 ) ) ( not ( = ?auto_287676 ?auto_287686 ) ) ( not ( = ?auto_287676 ?auto_287687 ) ) ( not ( = ?auto_287676 ?auto_287688 ) ) ( not ( = ?auto_287677 ?auto_287678 ) ) ( not ( = ?auto_287677 ?auto_287679 ) ) ( not ( = ?auto_287677 ?auto_287680 ) ) ( not ( = ?auto_287677 ?auto_287681 ) ) ( not ( = ?auto_287677 ?auto_287682 ) ) ( not ( = ?auto_287677 ?auto_287683 ) ) ( not ( = ?auto_287677 ?auto_287684 ) ) ( not ( = ?auto_287677 ?auto_287685 ) ) ( not ( = ?auto_287677 ?auto_287686 ) ) ( not ( = ?auto_287677 ?auto_287687 ) ) ( not ( = ?auto_287677 ?auto_287688 ) ) ( not ( = ?auto_287678 ?auto_287679 ) ) ( not ( = ?auto_287678 ?auto_287680 ) ) ( not ( = ?auto_287678 ?auto_287681 ) ) ( not ( = ?auto_287678 ?auto_287682 ) ) ( not ( = ?auto_287678 ?auto_287683 ) ) ( not ( = ?auto_287678 ?auto_287684 ) ) ( not ( = ?auto_287678 ?auto_287685 ) ) ( not ( = ?auto_287678 ?auto_287686 ) ) ( not ( = ?auto_287678 ?auto_287687 ) ) ( not ( = ?auto_287678 ?auto_287688 ) ) ( not ( = ?auto_287679 ?auto_287680 ) ) ( not ( = ?auto_287679 ?auto_287681 ) ) ( not ( = ?auto_287679 ?auto_287682 ) ) ( not ( = ?auto_287679 ?auto_287683 ) ) ( not ( = ?auto_287679 ?auto_287684 ) ) ( not ( = ?auto_287679 ?auto_287685 ) ) ( not ( = ?auto_287679 ?auto_287686 ) ) ( not ( = ?auto_287679 ?auto_287687 ) ) ( not ( = ?auto_287679 ?auto_287688 ) ) ( not ( = ?auto_287680 ?auto_287681 ) ) ( not ( = ?auto_287680 ?auto_287682 ) ) ( not ( = ?auto_287680 ?auto_287683 ) ) ( not ( = ?auto_287680 ?auto_287684 ) ) ( not ( = ?auto_287680 ?auto_287685 ) ) ( not ( = ?auto_287680 ?auto_287686 ) ) ( not ( = ?auto_287680 ?auto_287687 ) ) ( not ( = ?auto_287680 ?auto_287688 ) ) ( not ( = ?auto_287681 ?auto_287682 ) ) ( not ( = ?auto_287681 ?auto_287683 ) ) ( not ( = ?auto_287681 ?auto_287684 ) ) ( not ( = ?auto_287681 ?auto_287685 ) ) ( not ( = ?auto_287681 ?auto_287686 ) ) ( not ( = ?auto_287681 ?auto_287687 ) ) ( not ( = ?auto_287681 ?auto_287688 ) ) ( not ( = ?auto_287682 ?auto_287683 ) ) ( not ( = ?auto_287682 ?auto_287684 ) ) ( not ( = ?auto_287682 ?auto_287685 ) ) ( not ( = ?auto_287682 ?auto_287686 ) ) ( not ( = ?auto_287682 ?auto_287687 ) ) ( not ( = ?auto_287682 ?auto_287688 ) ) ( not ( = ?auto_287683 ?auto_287684 ) ) ( not ( = ?auto_287683 ?auto_287685 ) ) ( not ( = ?auto_287683 ?auto_287686 ) ) ( not ( = ?auto_287683 ?auto_287687 ) ) ( not ( = ?auto_287683 ?auto_287688 ) ) ( not ( = ?auto_287684 ?auto_287685 ) ) ( not ( = ?auto_287684 ?auto_287686 ) ) ( not ( = ?auto_287684 ?auto_287687 ) ) ( not ( = ?auto_287684 ?auto_287688 ) ) ( not ( = ?auto_287685 ?auto_287686 ) ) ( not ( = ?auto_287685 ?auto_287687 ) ) ( not ( = ?auto_287685 ?auto_287688 ) ) ( not ( = ?auto_287686 ?auto_287687 ) ) ( not ( = ?auto_287686 ?auto_287688 ) ) ( not ( = ?auto_287687 ?auto_287688 ) ) ( ON ?auto_287687 ?auto_287688 ) ( ON ?auto_287686 ?auto_287687 ) ( ON ?auto_287685 ?auto_287686 ) ( ON ?auto_287684 ?auto_287685 ) ( ON ?auto_287683 ?auto_287684 ) ( ON ?auto_287682 ?auto_287683 ) ( ON ?auto_287681 ?auto_287682 ) ( ON ?auto_287680 ?auto_287681 ) ( ON ?auto_287679 ?auto_287680 ) ( ON ?auto_287678 ?auto_287679 ) ( ON ?auto_287677 ?auto_287678 ) ( CLEAR ?auto_287675 ) ( ON ?auto_287676 ?auto_287677 ) ( CLEAR ?auto_287676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_287675 ?auto_287676 )
      ( MAKE-14PILE ?auto_287675 ?auto_287676 ?auto_287677 ?auto_287678 ?auto_287679 ?auto_287680 ?auto_287681 ?auto_287682 ?auto_287683 ?auto_287684 ?auto_287685 ?auto_287686 ?auto_287687 ?auto_287688 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_287703 - BLOCK
      ?auto_287704 - BLOCK
      ?auto_287705 - BLOCK
      ?auto_287706 - BLOCK
      ?auto_287707 - BLOCK
      ?auto_287708 - BLOCK
      ?auto_287709 - BLOCK
      ?auto_287710 - BLOCK
      ?auto_287711 - BLOCK
      ?auto_287712 - BLOCK
      ?auto_287713 - BLOCK
      ?auto_287714 - BLOCK
      ?auto_287715 - BLOCK
      ?auto_287716 - BLOCK
    )
    :vars
    (
      ?auto_287717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287716 ?auto_287717 ) ( not ( = ?auto_287703 ?auto_287704 ) ) ( not ( = ?auto_287703 ?auto_287705 ) ) ( not ( = ?auto_287703 ?auto_287706 ) ) ( not ( = ?auto_287703 ?auto_287707 ) ) ( not ( = ?auto_287703 ?auto_287708 ) ) ( not ( = ?auto_287703 ?auto_287709 ) ) ( not ( = ?auto_287703 ?auto_287710 ) ) ( not ( = ?auto_287703 ?auto_287711 ) ) ( not ( = ?auto_287703 ?auto_287712 ) ) ( not ( = ?auto_287703 ?auto_287713 ) ) ( not ( = ?auto_287703 ?auto_287714 ) ) ( not ( = ?auto_287703 ?auto_287715 ) ) ( not ( = ?auto_287703 ?auto_287716 ) ) ( not ( = ?auto_287703 ?auto_287717 ) ) ( not ( = ?auto_287704 ?auto_287705 ) ) ( not ( = ?auto_287704 ?auto_287706 ) ) ( not ( = ?auto_287704 ?auto_287707 ) ) ( not ( = ?auto_287704 ?auto_287708 ) ) ( not ( = ?auto_287704 ?auto_287709 ) ) ( not ( = ?auto_287704 ?auto_287710 ) ) ( not ( = ?auto_287704 ?auto_287711 ) ) ( not ( = ?auto_287704 ?auto_287712 ) ) ( not ( = ?auto_287704 ?auto_287713 ) ) ( not ( = ?auto_287704 ?auto_287714 ) ) ( not ( = ?auto_287704 ?auto_287715 ) ) ( not ( = ?auto_287704 ?auto_287716 ) ) ( not ( = ?auto_287704 ?auto_287717 ) ) ( not ( = ?auto_287705 ?auto_287706 ) ) ( not ( = ?auto_287705 ?auto_287707 ) ) ( not ( = ?auto_287705 ?auto_287708 ) ) ( not ( = ?auto_287705 ?auto_287709 ) ) ( not ( = ?auto_287705 ?auto_287710 ) ) ( not ( = ?auto_287705 ?auto_287711 ) ) ( not ( = ?auto_287705 ?auto_287712 ) ) ( not ( = ?auto_287705 ?auto_287713 ) ) ( not ( = ?auto_287705 ?auto_287714 ) ) ( not ( = ?auto_287705 ?auto_287715 ) ) ( not ( = ?auto_287705 ?auto_287716 ) ) ( not ( = ?auto_287705 ?auto_287717 ) ) ( not ( = ?auto_287706 ?auto_287707 ) ) ( not ( = ?auto_287706 ?auto_287708 ) ) ( not ( = ?auto_287706 ?auto_287709 ) ) ( not ( = ?auto_287706 ?auto_287710 ) ) ( not ( = ?auto_287706 ?auto_287711 ) ) ( not ( = ?auto_287706 ?auto_287712 ) ) ( not ( = ?auto_287706 ?auto_287713 ) ) ( not ( = ?auto_287706 ?auto_287714 ) ) ( not ( = ?auto_287706 ?auto_287715 ) ) ( not ( = ?auto_287706 ?auto_287716 ) ) ( not ( = ?auto_287706 ?auto_287717 ) ) ( not ( = ?auto_287707 ?auto_287708 ) ) ( not ( = ?auto_287707 ?auto_287709 ) ) ( not ( = ?auto_287707 ?auto_287710 ) ) ( not ( = ?auto_287707 ?auto_287711 ) ) ( not ( = ?auto_287707 ?auto_287712 ) ) ( not ( = ?auto_287707 ?auto_287713 ) ) ( not ( = ?auto_287707 ?auto_287714 ) ) ( not ( = ?auto_287707 ?auto_287715 ) ) ( not ( = ?auto_287707 ?auto_287716 ) ) ( not ( = ?auto_287707 ?auto_287717 ) ) ( not ( = ?auto_287708 ?auto_287709 ) ) ( not ( = ?auto_287708 ?auto_287710 ) ) ( not ( = ?auto_287708 ?auto_287711 ) ) ( not ( = ?auto_287708 ?auto_287712 ) ) ( not ( = ?auto_287708 ?auto_287713 ) ) ( not ( = ?auto_287708 ?auto_287714 ) ) ( not ( = ?auto_287708 ?auto_287715 ) ) ( not ( = ?auto_287708 ?auto_287716 ) ) ( not ( = ?auto_287708 ?auto_287717 ) ) ( not ( = ?auto_287709 ?auto_287710 ) ) ( not ( = ?auto_287709 ?auto_287711 ) ) ( not ( = ?auto_287709 ?auto_287712 ) ) ( not ( = ?auto_287709 ?auto_287713 ) ) ( not ( = ?auto_287709 ?auto_287714 ) ) ( not ( = ?auto_287709 ?auto_287715 ) ) ( not ( = ?auto_287709 ?auto_287716 ) ) ( not ( = ?auto_287709 ?auto_287717 ) ) ( not ( = ?auto_287710 ?auto_287711 ) ) ( not ( = ?auto_287710 ?auto_287712 ) ) ( not ( = ?auto_287710 ?auto_287713 ) ) ( not ( = ?auto_287710 ?auto_287714 ) ) ( not ( = ?auto_287710 ?auto_287715 ) ) ( not ( = ?auto_287710 ?auto_287716 ) ) ( not ( = ?auto_287710 ?auto_287717 ) ) ( not ( = ?auto_287711 ?auto_287712 ) ) ( not ( = ?auto_287711 ?auto_287713 ) ) ( not ( = ?auto_287711 ?auto_287714 ) ) ( not ( = ?auto_287711 ?auto_287715 ) ) ( not ( = ?auto_287711 ?auto_287716 ) ) ( not ( = ?auto_287711 ?auto_287717 ) ) ( not ( = ?auto_287712 ?auto_287713 ) ) ( not ( = ?auto_287712 ?auto_287714 ) ) ( not ( = ?auto_287712 ?auto_287715 ) ) ( not ( = ?auto_287712 ?auto_287716 ) ) ( not ( = ?auto_287712 ?auto_287717 ) ) ( not ( = ?auto_287713 ?auto_287714 ) ) ( not ( = ?auto_287713 ?auto_287715 ) ) ( not ( = ?auto_287713 ?auto_287716 ) ) ( not ( = ?auto_287713 ?auto_287717 ) ) ( not ( = ?auto_287714 ?auto_287715 ) ) ( not ( = ?auto_287714 ?auto_287716 ) ) ( not ( = ?auto_287714 ?auto_287717 ) ) ( not ( = ?auto_287715 ?auto_287716 ) ) ( not ( = ?auto_287715 ?auto_287717 ) ) ( not ( = ?auto_287716 ?auto_287717 ) ) ( ON ?auto_287715 ?auto_287716 ) ( ON ?auto_287714 ?auto_287715 ) ( ON ?auto_287713 ?auto_287714 ) ( ON ?auto_287712 ?auto_287713 ) ( ON ?auto_287711 ?auto_287712 ) ( ON ?auto_287710 ?auto_287711 ) ( ON ?auto_287709 ?auto_287710 ) ( ON ?auto_287708 ?auto_287709 ) ( ON ?auto_287707 ?auto_287708 ) ( ON ?auto_287706 ?auto_287707 ) ( ON ?auto_287705 ?auto_287706 ) ( ON ?auto_287704 ?auto_287705 ) ( ON ?auto_287703 ?auto_287704 ) ( CLEAR ?auto_287703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_287703 )
      ( MAKE-14PILE ?auto_287703 ?auto_287704 ?auto_287705 ?auto_287706 ?auto_287707 ?auto_287708 ?auto_287709 ?auto_287710 ?auto_287711 ?auto_287712 ?auto_287713 ?auto_287714 ?auto_287715 ?auto_287716 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_287732 - BLOCK
      ?auto_287733 - BLOCK
      ?auto_287734 - BLOCK
      ?auto_287735 - BLOCK
      ?auto_287736 - BLOCK
      ?auto_287737 - BLOCK
      ?auto_287738 - BLOCK
      ?auto_287739 - BLOCK
      ?auto_287740 - BLOCK
      ?auto_287741 - BLOCK
      ?auto_287742 - BLOCK
      ?auto_287743 - BLOCK
      ?auto_287744 - BLOCK
      ?auto_287745 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_287745 ) ( not ( = ?auto_287732 ?auto_287733 ) ) ( not ( = ?auto_287732 ?auto_287734 ) ) ( not ( = ?auto_287732 ?auto_287735 ) ) ( not ( = ?auto_287732 ?auto_287736 ) ) ( not ( = ?auto_287732 ?auto_287737 ) ) ( not ( = ?auto_287732 ?auto_287738 ) ) ( not ( = ?auto_287732 ?auto_287739 ) ) ( not ( = ?auto_287732 ?auto_287740 ) ) ( not ( = ?auto_287732 ?auto_287741 ) ) ( not ( = ?auto_287732 ?auto_287742 ) ) ( not ( = ?auto_287732 ?auto_287743 ) ) ( not ( = ?auto_287732 ?auto_287744 ) ) ( not ( = ?auto_287732 ?auto_287745 ) ) ( not ( = ?auto_287733 ?auto_287734 ) ) ( not ( = ?auto_287733 ?auto_287735 ) ) ( not ( = ?auto_287733 ?auto_287736 ) ) ( not ( = ?auto_287733 ?auto_287737 ) ) ( not ( = ?auto_287733 ?auto_287738 ) ) ( not ( = ?auto_287733 ?auto_287739 ) ) ( not ( = ?auto_287733 ?auto_287740 ) ) ( not ( = ?auto_287733 ?auto_287741 ) ) ( not ( = ?auto_287733 ?auto_287742 ) ) ( not ( = ?auto_287733 ?auto_287743 ) ) ( not ( = ?auto_287733 ?auto_287744 ) ) ( not ( = ?auto_287733 ?auto_287745 ) ) ( not ( = ?auto_287734 ?auto_287735 ) ) ( not ( = ?auto_287734 ?auto_287736 ) ) ( not ( = ?auto_287734 ?auto_287737 ) ) ( not ( = ?auto_287734 ?auto_287738 ) ) ( not ( = ?auto_287734 ?auto_287739 ) ) ( not ( = ?auto_287734 ?auto_287740 ) ) ( not ( = ?auto_287734 ?auto_287741 ) ) ( not ( = ?auto_287734 ?auto_287742 ) ) ( not ( = ?auto_287734 ?auto_287743 ) ) ( not ( = ?auto_287734 ?auto_287744 ) ) ( not ( = ?auto_287734 ?auto_287745 ) ) ( not ( = ?auto_287735 ?auto_287736 ) ) ( not ( = ?auto_287735 ?auto_287737 ) ) ( not ( = ?auto_287735 ?auto_287738 ) ) ( not ( = ?auto_287735 ?auto_287739 ) ) ( not ( = ?auto_287735 ?auto_287740 ) ) ( not ( = ?auto_287735 ?auto_287741 ) ) ( not ( = ?auto_287735 ?auto_287742 ) ) ( not ( = ?auto_287735 ?auto_287743 ) ) ( not ( = ?auto_287735 ?auto_287744 ) ) ( not ( = ?auto_287735 ?auto_287745 ) ) ( not ( = ?auto_287736 ?auto_287737 ) ) ( not ( = ?auto_287736 ?auto_287738 ) ) ( not ( = ?auto_287736 ?auto_287739 ) ) ( not ( = ?auto_287736 ?auto_287740 ) ) ( not ( = ?auto_287736 ?auto_287741 ) ) ( not ( = ?auto_287736 ?auto_287742 ) ) ( not ( = ?auto_287736 ?auto_287743 ) ) ( not ( = ?auto_287736 ?auto_287744 ) ) ( not ( = ?auto_287736 ?auto_287745 ) ) ( not ( = ?auto_287737 ?auto_287738 ) ) ( not ( = ?auto_287737 ?auto_287739 ) ) ( not ( = ?auto_287737 ?auto_287740 ) ) ( not ( = ?auto_287737 ?auto_287741 ) ) ( not ( = ?auto_287737 ?auto_287742 ) ) ( not ( = ?auto_287737 ?auto_287743 ) ) ( not ( = ?auto_287737 ?auto_287744 ) ) ( not ( = ?auto_287737 ?auto_287745 ) ) ( not ( = ?auto_287738 ?auto_287739 ) ) ( not ( = ?auto_287738 ?auto_287740 ) ) ( not ( = ?auto_287738 ?auto_287741 ) ) ( not ( = ?auto_287738 ?auto_287742 ) ) ( not ( = ?auto_287738 ?auto_287743 ) ) ( not ( = ?auto_287738 ?auto_287744 ) ) ( not ( = ?auto_287738 ?auto_287745 ) ) ( not ( = ?auto_287739 ?auto_287740 ) ) ( not ( = ?auto_287739 ?auto_287741 ) ) ( not ( = ?auto_287739 ?auto_287742 ) ) ( not ( = ?auto_287739 ?auto_287743 ) ) ( not ( = ?auto_287739 ?auto_287744 ) ) ( not ( = ?auto_287739 ?auto_287745 ) ) ( not ( = ?auto_287740 ?auto_287741 ) ) ( not ( = ?auto_287740 ?auto_287742 ) ) ( not ( = ?auto_287740 ?auto_287743 ) ) ( not ( = ?auto_287740 ?auto_287744 ) ) ( not ( = ?auto_287740 ?auto_287745 ) ) ( not ( = ?auto_287741 ?auto_287742 ) ) ( not ( = ?auto_287741 ?auto_287743 ) ) ( not ( = ?auto_287741 ?auto_287744 ) ) ( not ( = ?auto_287741 ?auto_287745 ) ) ( not ( = ?auto_287742 ?auto_287743 ) ) ( not ( = ?auto_287742 ?auto_287744 ) ) ( not ( = ?auto_287742 ?auto_287745 ) ) ( not ( = ?auto_287743 ?auto_287744 ) ) ( not ( = ?auto_287743 ?auto_287745 ) ) ( not ( = ?auto_287744 ?auto_287745 ) ) ( ON ?auto_287744 ?auto_287745 ) ( ON ?auto_287743 ?auto_287744 ) ( ON ?auto_287742 ?auto_287743 ) ( ON ?auto_287741 ?auto_287742 ) ( ON ?auto_287740 ?auto_287741 ) ( ON ?auto_287739 ?auto_287740 ) ( ON ?auto_287738 ?auto_287739 ) ( ON ?auto_287737 ?auto_287738 ) ( ON ?auto_287736 ?auto_287737 ) ( ON ?auto_287735 ?auto_287736 ) ( ON ?auto_287734 ?auto_287735 ) ( ON ?auto_287733 ?auto_287734 ) ( ON ?auto_287732 ?auto_287733 ) ( CLEAR ?auto_287732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_287732 )
      ( MAKE-14PILE ?auto_287732 ?auto_287733 ?auto_287734 ?auto_287735 ?auto_287736 ?auto_287737 ?auto_287738 ?auto_287739 ?auto_287740 ?auto_287741 ?auto_287742 ?auto_287743 ?auto_287744 ?auto_287745 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_287760 - BLOCK
      ?auto_287761 - BLOCK
      ?auto_287762 - BLOCK
      ?auto_287763 - BLOCK
      ?auto_287764 - BLOCK
      ?auto_287765 - BLOCK
      ?auto_287766 - BLOCK
      ?auto_287767 - BLOCK
      ?auto_287768 - BLOCK
      ?auto_287769 - BLOCK
      ?auto_287770 - BLOCK
      ?auto_287771 - BLOCK
      ?auto_287772 - BLOCK
      ?auto_287773 - BLOCK
    )
    :vars
    (
      ?auto_287774 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_287760 ?auto_287761 ) ) ( not ( = ?auto_287760 ?auto_287762 ) ) ( not ( = ?auto_287760 ?auto_287763 ) ) ( not ( = ?auto_287760 ?auto_287764 ) ) ( not ( = ?auto_287760 ?auto_287765 ) ) ( not ( = ?auto_287760 ?auto_287766 ) ) ( not ( = ?auto_287760 ?auto_287767 ) ) ( not ( = ?auto_287760 ?auto_287768 ) ) ( not ( = ?auto_287760 ?auto_287769 ) ) ( not ( = ?auto_287760 ?auto_287770 ) ) ( not ( = ?auto_287760 ?auto_287771 ) ) ( not ( = ?auto_287760 ?auto_287772 ) ) ( not ( = ?auto_287760 ?auto_287773 ) ) ( not ( = ?auto_287761 ?auto_287762 ) ) ( not ( = ?auto_287761 ?auto_287763 ) ) ( not ( = ?auto_287761 ?auto_287764 ) ) ( not ( = ?auto_287761 ?auto_287765 ) ) ( not ( = ?auto_287761 ?auto_287766 ) ) ( not ( = ?auto_287761 ?auto_287767 ) ) ( not ( = ?auto_287761 ?auto_287768 ) ) ( not ( = ?auto_287761 ?auto_287769 ) ) ( not ( = ?auto_287761 ?auto_287770 ) ) ( not ( = ?auto_287761 ?auto_287771 ) ) ( not ( = ?auto_287761 ?auto_287772 ) ) ( not ( = ?auto_287761 ?auto_287773 ) ) ( not ( = ?auto_287762 ?auto_287763 ) ) ( not ( = ?auto_287762 ?auto_287764 ) ) ( not ( = ?auto_287762 ?auto_287765 ) ) ( not ( = ?auto_287762 ?auto_287766 ) ) ( not ( = ?auto_287762 ?auto_287767 ) ) ( not ( = ?auto_287762 ?auto_287768 ) ) ( not ( = ?auto_287762 ?auto_287769 ) ) ( not ( = ?auto_287762 ?auto_287770 ) ) ( not ( = ?auto_287762 ?auto_287771 ) ) ( not ( = ?auto_287762 ?auto_287772 ) ) ( not ( = ?auto_287762 ?auto_287773 ) ) ( not ( = ?auto_287763 ?auto_287764 ) ) ( not ( = ?auto_287763 ?auto_287765 ) ) ( not ( = ?auto_287763 ?auto_287766 ) ) ( not ( = ?auto_287763 ?auto_287767 ) ) ( not ( = ?auto_287763 ?auto_287768 ) ) ( not ( = ?auto_287763 ?auto_287769 ) ) ( not ( = ?auto_287763 ?auto_287770 ) ) ( not ( = ?auto_287763 ?auto_287771 ) ) ( not ( = ?auto_287763 ?auto_287772 ) ) ( not ( = ?auto_287763 ?auto_287773 ) ) ( not ( = ?auto_287764 ?auto_287765 ) ) ( not ( = ?auto_287764 ?auto_287766 ) ) ( not ( = ?auto_287764 ?auto_287767 ) ) ( not ( = ?auto_287764 ?auto_287768 ) ) ( not ( = ?auto_287764 ?auto_287769 ) ) ( not ( = ?auto_287764 ?auto_287770 ) ) ( not ( = ?auto_287764 ?auto_287771 ) ) ( not ( = ?auto_287764 ?auto_287772 ) ) ( not ( = ?auto_287764 ?auto_287773 ) ) ( not ( = ?auto_287765 ?auto_287766 ) ) ( not ( = ?auto_287765 ?auto_287767 ) ) ( not ( = ?auto_287765 ?auto_287768 ) ) ( not ( = ?auto_287765 ?auto_287769 ) ) ( not ( = ?auto_287765 ?auto_287770 ) ) ( not ( = ?auto_287765 ?auto_287771 ) ) ( not ( = ?auto_287765 ?auto_287772 ) ) ( not ( = ?auto_287765 ?auto_287773 ) ) ( not ( = ?auto_287766 ?auto_287767 ) ) ( not ( = ?auto_287766 ?auto_287768 ) ) ( not ( = ?auto_287766 ?auto_287769 ) ) ( not ( = ?auto_287766 ?auto_287770 ) ) ( not ( = ?auto_287766 ?auto_287771 ) ) ( not ( = ?auto_287766 ?auto_287772 ) ) ( not ( = ?auto_287766 ?auto_287773 ) ) ( not ( = ?auto_287767 ?auto_287768 ) ) ( not ( = ?auto_287767 ?auto_287769 ) ) ( not ( = ?auto_287767 ?auto_287770 ) ) ( not ( = ?auto_287767 ?auto_287771 ) ) ( not ( = ?auto_287767 ?auto_287772 ) ) ( not ( = ?auto_287767 ?auto_287773 ) ) ( not ( = ?auto_287768 ?auto_287769 ) ) ( not ( = ?auto_287768 ?auto_287770 ) ) ( not ( = ?auto_287768 ?auto_287771 ) ) ( not ( = ?auto_287768 ?auto_287772 ) ) ( not ( = ?auto_287768 ?auto_287773 ) ) ( not ( = ?auto_287769 ?auto_287770 ) ) ( not ( = ?auto_287769 ?auto_287771 ) ) ( not ( = ?auto_287769 ?auto_287772 ) ) ( not ( = ?auto_287769 ?auto_287773 ) ) ( not ( = ?auto_287770 ?auto_287771 ) ) ( not ( = ?auto_287770 ?auto_287772 ) ) ( not ( = ?auto_287770 ?auto_287773 ) ) ( not ( = ?auto_287771 ?auto_287772 ) ) ( not ( = ?auto_287771 ?auto_287773 ) ) ( not ( = ?auto_287772 ?auto_287773 ) ) ( ON ?auto_287760 ?auto_287774 ) ( not ( = ?auto_287773 ?auto_287774 ) ) ( not ( = ?auto_287772 ?auto_287774 ) ) ( not ( = ?auto_287771 ?auto_287774 ) ) ( not ( = ?auto_287770 ?auto_287774 ) ) ( not ( = ?auto_287769 ?auto_287774 ) ) ( not ( = ?auto_287768 ?auto_287774 ) ) ( not ( = ?auto_287767 ?auto_287774 ) ) ( not ( = ?auto_287766 ?auto_287774 ) ) ( not ( = ?auto_287765 ?auto_287774 ) ) ( not ( = ?auto_287764 ?auto_287774 ) ) ( not ( = ?auto_287763 ?auto_287774 ) ) ( not ( = ?auto_287762 ?auto_287774 ) ) ( not ( = ?auto_287761 ?auto_287774 ) ) ( not ( = ?auto_287760 ?auto_287774 ) ) ( ON ?auto_287761 ?auto_287760 ) ( ON ?auto_287762 ?auto_287761 ) ( ON ?auto_287763 ?auto_287762 ) ( ON ?auto_287764 ?auto_287763 ) ( ON ?auto_287765 ?auto_287764 ) ( ON ?auto_287766 ?auto_287765 ) ( ON ?auto_287767 ?auto_287766 ) ( ON ?auto_287768 ?auto_287767 ) ( ON ?auto_287769 ?auto_287768 ) ( ON ?auto_287770 ?auto_287769 ) ( ON ?auto_287771 ?auto_287770 ) ( ON ?auto_287772 ?auto_287771 ) ( ON ?auto_287773 ?auto_287772 ) ( CLEAR ?auto_287773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_287773 ?auto_287772 ?auto_287771 ?auto_287770 ?auto_287769 ?auto_287768 ?auto_287767 ?auto_287766 ?auto_287765 ?auto_287764 ?auto_287763 ?auto_287762 ?auto_287761 ?auto_287760 )
      ( MAKE-14PILE ?auto_287760 ?auto_287761 ?auto_287762 ?auto_287763 ?auto_287764 ?auto_287765 ?auto_287766 ?auto_287767 ?auto_287768 ?auto_287769 ?auto_287770 ?auto_287771 ?auto_287772 ?auto_287773 ) )
  )

)

