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

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_165651 - BLOCK
      ?auto_165652 - BLOCK
      ?auto_165653 - BLOCK
      ?auto_165654 - BLOCK
      ?auto_165655 - BLOCK
      ?auto_165656 - BLOCK
      ?auto_165657 - BLOCK
      ?auto_165658 - BLOCK
    )
    :vars
    (
      ?auto_165659 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165659 ?auto_165658 ) ( CLEAR ?auto_165659 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_165651 ) ( ON ?auto_165652 ?auto_165651 ) ( ON ?auto_165653 ?auto_165652 ) ( ON ?auto_165654 ?auto_165653 ) ( ON ?auto_165655 ?auto_165654 ) ( ON ?auto_165656 ?auto_165655 ) ( ON ?auto_165657 ?auto_165656 ) ( ON ?auto_165658 ?auto_165657 ) ( not ( = ?auto_165651 ?auto_165652 ) ) ( not ( = ?auto_165651 ?auto_165653 ) ) ( not ( = ?auto_165651 ?auto_165654 ) ) ( not ( = ?auto_165651 ?auto_165655 ) ) ( not ( = ?auto_165651 ?auto_165656 ) ) ( not ( = ?auto_165651 ?auto_165657 ) ) ( not ( = ?auto_165651 ?auto_165658 ) ) ( not ( = ?auto_165651 ?auto_165659 ) ) ( not ( = ?auto_165652 ?auto_165653 ) ) ( not ( = ?auto_165652 ?auto_165654 ) ) ( not ( = ?auto_165652 ?auto_165655 ) ) ( not ( = ?auto_165652 ?auto_165656 ) ) ( not ( = ?auto_165652 ?auto_165657 ) ) ( not ( = ?auto_165652 ?auto_165658 ) ) ( not ( = ?auto_165652 ?auto_165659 ) ) ( not ( = ?auto_165653 ?auto_165654 ) ) ( not ( = ?auto_165653 ?auto_165655 ) ) ( not ( = ?auto_165653 ?auto_165656 ) ) ( not ( = ?auto_165653 ?auto_165657 ) ) ( not ( = ?auto_165653 ?auto_165658 ) ) ( not ( = ?auto_165653 ?auto_165659 ) ) ( not ( = ?auto_165654 ?auto_165655 ) ) ( not ( = ?auto_165654 ?auto_165656 ) ) ( not ( = ?auto_165654 ?auto_165657 ) ) ( not ( = ?auto_165654 ?auto_165658 ) ) ( not ( = ?auto_165654 ?auto_165659 ) ) ( not ( = ?auto_165655 ?auto_165656 ) ) ( not ( = ?auto_165655 ?auto_165657 ) ) ( not ( = ?auto_165655 ?auto_165658 ) ) ( not ( = ?auto_165655 ?auto_165659 ) ) ( not ( = ?auto_165656 ?auto_165657 ) ) ( not ( = ?auto_165656 ?auto_165658 ) ) ( not ( = ?auto_165656 ?auto_165659 ) ) ( not ( = ?auto_165657 ?auto_165658 ) ) ( not ( = ?auto_165657 ?auto_165659 ) ) ( not ( = ?auto_165658 ?auto_165659 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_165659 ?auto_165658 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_165661 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_165661 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_165661 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_165662 - BLOCK
    )
    :vars
    (
      ?auto_165663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165662 ?auto_165663 ) ( CLEAR ?auto_165662 ) ( HAND-EMPTY ) ( not ( = ?auto_165662 ?auto_165663 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_165662 ?auto_165663 )
      ( MAKE-1PILE ?auto_165662 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_165671 - BLOCK
      ?auto_165672 - BLOCK
      ?auto_165673 - BLOCK
      ?auto_165674 - BLOCK
      ?auto_165675 - BLOCK
      ?auto_165676 - BLOCK
      ?auto_165677 - BLOCK
    )
    :vars
    (
      ?auto_165678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165678 ?auto_165677 ) ( CLEAR ?auto_165678 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_165671 ) ( ON ?auto_165672 ?auto_165671 ) ( ON ?auto_165673 ?auto_165672 ) ( ON ?auto_165674 ?auto_165673 ) ( ON ?auto_165675 ?auto_165674 ) ( ON ?auto_165676 ?auto_165675 ) ( ON ?auto_165677 ?auto_165676 ) ( not ( = ?auto_165671 ?auto_165672 ) ) ( not ( = ?auto_165671 ?auto_165673 ) ) ( not ( = ?auto_165671 ?auto_165674 ) ) ( not ( = ?auto_165671 ?auto_165675 ) ) ( not ( = ?auto_165671 ?auto_165676 ) ) ( not ( = ?auto_165671 ?auto_165677 ) ) ( not ( = ?auto_165671 ?auto_165678 ) ) ( not ( = ?auto_165672 ?auto_165673 ) ) ( not ( = ?auto_165672 ?auto_165674 ) ) ( not ( = ?auto_165672 ?auto_165675 ) ) ( not ( = ?auto_165672 ?auto_165676 ) ) ( not ( = ?auto_165672 ?auto_165677 ) ) ( not ( = ?auto_165672 ?auto_165678 ) ) ( not ( = ?auto_165673 ?auto_165674 ) ) ( not ( = ?auto_165673 ?auto_165675 ) ) ( not ( = ?auto_165673 ?auto_165676 ) ) ( not ( = ?auto_165673 ?auto_165677 ) ) ( not ( = ?auto_165673 ?auto_165678 ) ) ( not ( = ?auto_165674 ?auto_165675 ) ) ( not ( = ?auto_165674 ?auto_165676 ) ) ( not ( = ?auto_165674 ?auto_165677 ) ) ( not ( = ?auto_165674 ?auto_165678 ) ) ( not ( = ?auto_165675 ?auto_165676 ) ) ( not ( = ?auto_165675 ?auto_165677 ) ) ( not ( = ?auto_165675 ?auto_165678 ) ) ( not ( = ?auto_165676 ?auto_165677 ) ) ( not ( = ?auto_165676 ?auto_165678 ) ) ( not ( = ?auto_165677 ?auto_165678 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_165678 ?auto_165677 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_165679 - BLOCK
      ?auto_165680 - BLOCK
      ?auto_165681 - BLOCK
      ?auto_165682 - BLOCK
      ?auto_165683 - BLOCK
      ?auto_165684 - BLOCK
      ?auto_165685 - BLOCK
    )
    :vars
    (
      ?auto_165686 - BLOCK
      ?auto_165687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165686 ?auto_165685 ) ( CLEAR ?auto_165686 ) ( ON-TABLE ?auto_165679 ) ( ON ?auto_165680 ?auto_165679 ) ( ON ?auto_165681 ?auto_165680 ) ( ON ?auto_165682 ?auto_165681 ) ( ON ?auto_165683 ?auto_165682 ) ( ON ?auto_165684 ?auto_165683 ) ( ON ?auto_165685 ?auto_165684 ) ( not ( = ?auto_165679 ?auto_165680 ) ) ( not ( = ?auto_165679 ?auto_165681 ) ) ( not ( = ?auto_165679 ?auto_165682 ) ) ( not ( = ?auto_165679 ?auto_165683 ) ) ( not ( = ?auto_165679 ?auto_165684 ) ) ( not ( = ?auto_165679 ?auto_165685 ) ) ( not ( = ?auto_165679 ?auto_165686 ) ) ( not ( = ?auto_165680 ?auto_165681 ) ) ( not ( = ?auto_165680 ?auto_165682 ) ) ( not ( = ?auto_165680 ?auto_165683 ) ) ( not ( = ?auto_165680 ?auto_165684 ) ) ( not ( = ?auto_165680 ?auto_165685 ) ) ( not ( = ?auto_165680 ?auto_165686 ) ) ( not ( = ?auto_165681 ?auto_165682 ) ) ( not ( = ?auto_165681 ?auto_165683 ) ) ( not ( = ?auto_165681 ?auto_165684 ) ) ( not ( = ?auto_165681 ?auto_165685 ) ) ( not ( = ?auto_165681 ?auto_165686 ) ) ( not ( = ?auto_165682 ?auto_165683 ) ) ( not ( = ?auto_165682 ?auto_165684 ) ) ( not ( = ?auto_165682 ?auto_165685 ) ) ( not ( = ?auto_165682 ?auto_165686 ) ) ( not ( = ?auto_165683 ?auto_165684 ) ) ( not ( = ?auto_165683 ?auto_165685 ) ) ( not ( = ?auto_165683 ?auto_165686 ) ) ( not ( = ?auto_165684 ?auto_165685 ) ) ( not ( = ?auto_165684 ?auto_165686 ) ) ( not ( = ?auto_165685 ?auto_165686 ) ) ( HOLDING ?auto_165687 ) ( not ( = ?auto_165679 ?auto_165687 ) ) ( not ( = ?auto_165680 ?auto_165687 ) ) ( not ( = ?auto_165681 ?auto_165687 ) ) ( not ( = ?auto_165682 ?auto_165687 ) ) ( not ( = ?auto_165683 ?auto_165687 ) ) ( not ( = ?auto_165684 ?auto_165687 ) ) ( not ( = ?auto_165685 ?auto_165687 ) ) ( not ( = ?auto_165686 ?auto_165687 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_165687 )
      ( MAKE-7PILE ?auto_165679 ?auto_165680 ?auto_165681 ?auto_165682 ?auto_165683 ?auto_165684 ?auto_165685 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_165688 - BLOCK
      ?auto_165689 - BLOCK
      ?auto_165690 - BLOCK
      ?auto_165691 - BLOCK
      ?auto_165692 - BLOCK
      ?auto_165693 - BLOCK
      ?auto_165694 - BLOCK
    )
    :vars
    (
      ?auto_165696 - BLOCK
      ?auto_165695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165696 ?auto_165694 ) ( ON-TABLE ?auto_165688 ) ( ON ?auto_165689 ?auto_165688 ) ( ON ?auto_165690 ?auto_165689 ) ( ON ?auto_165691 ?auto_165690 ) ( ON ?auto_165692 ?auto_165691 ) ( ON ?auto_165693 ?auto_165692 ) ( ON ?auto_165694 ?auto_165693 ) ( not ( = ?auto_165688 ?auto_165689 ) ) ( not ( = ?auto_165688 ?auto_165690 ) ) ( not ( = ?auto_165688 ?auto_165691 ) ) ( not ( = ?auto_165688 ?auto_165692 ) ) ( not ( = ?auto_165688 ?auto_165693 ) ) ( not ( = ?auto_165688 ?auto_165694 ) ) ( not ( = ?auto_165688 ?auto_165696 ) ) ( not ( = ?auto_165689 ?auto_165690 ) ) ( not ( = ?auto_165689 ?auto_165691 ) ) ( not ( = ?auto_165689 ?auto_165692 ) ) ( not ( = ?auto_165689 ?auto_165693 ) ) ( not ( = ?auto_165689 ?auto_165694 ) ) ( not ( = ?auto_165689 ?auto_165696 ) ) ( not ( = ?auto_165690 ?auto_165691 ) ) ( not ( = ?auto_165690 ?auto_165692 ) ) ( not ( = ?auto_165690 ?auto_165693 ) ) ( not ( = ?auto_165690 ?auto_165694 ) ) ( not ( = ?auto_165690 ?auto_165696 ) ) ( not ( = ?auto_165691 ?auto_165692 ) ) ( not ( = ?auto_165691 ?auto_165693 ) ) ( not ( = ?auto_165691 ?auto_165694 ) ) ( not ( = ?auto_165691 ?auto_165696 ) ) ( not ( = ?auto_165692 ?auto_165693 ) ) ( not ( = ?auto_165692 ?auto_165694 ) ) ( not ( = ?auto_165692 ?auto_165696 ) ) ( not ( = ?auto_165693 ?auto_165694 ) ) ( not ( = ?auto_165693 ?auto_165696 ) ) ( not ( = ?auto_165694 ?auto_165696 ) ) ( not ( = ?auto_165688 ?auto_165695 ) ) ( not ( = ?auto_165689 ?auto_165695 ) ) ( not ( = ?auto_165690 ?auto_165695 ) ) ( not ( = ?auto_165691 ?auto_165695 ) ) ( not ( = ?auto_165692 ?auto_165695 ) ) ( not ( = ?auto_165693 ?auto_165695 ) ) ( not ( = ?auto_165694 ?auto_165695 ) ) ( not ( = ?auto_165696 ?auto_165695 ) ) ( ON ?auto_165695 ?auto_165696 ) ( CLEAR ?auto_165695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_165688 ?auto_165689 ?auto_165690 ?auto_165691 ?auto_165692 ?auto_165693 ?auto_165694 ?auto_165696 )
      ( MAKE-7PILE ?auto_165688 ?auto_165689 ?auto_165690 ?auto_165691 ?auto_165692 ?auto_165693 ?auto_165694 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_165699 - BLOCK
      ?auto_165700 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_165700 ) ( CLEAR ?auto_165699 ) ( ON-TABLE ?auto_165699 ) ( not ( = ?auto_165699 ?auto_165700 ) ) )
    :subtasks
    ( ( !STACK ?auto_165700 ?auto_165699 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_165701 - BLOCK
      ?auto_165702 - BLOCK
    )
    :vars
    (
      ?auto_165703 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_165701 ) ( ON-TABLE ?auto_165701 ) ( not ( = ?auto_165701 ?auto_165702 ) ) ( ON ?auto_165702 ?auto_165703 ) ( CLEAR ?auto_165702 ) ( HAND-EMPTY ) ( not ( = ?auto_165701 ?auto_165703 ) ) ( not ( = ?auto_165702 ?auto_165703 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_165702 ?auto_165703 )
      ( MAKE-2PILE ?auto_165701 ?auto_165702 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_165704 - BLOCK
      ?auto_165705 - BLOCK
    )
    :vars
    (
      ?auto_165706 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165704 ?auto_165705 ) ) ( ON ?auto_165705 ?auto_165706 ) ( CLEAR ?auto_165705 ) ( not ( = ?auto_165704 ?auto_165706 ) ) ( not ( = ?auto_165705 ?auto_165706 ) ) ( HOLDING ?auto_165704 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_165704 )
      ( MAKE-2PILE ?auto_165704 ?auto_165705 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_165707 - BLOCK
      ?auto_165708 - BLOCK
    )
    :vars
    (
      ?auto_165709 - BLOCK
      ?auto_165715 - BLOCK
      ?auto_165712 - BLOCK
      ?auto_165713 - BLOCK
      ?auto_165711 - BLOCK
      ?auto_165714 - BLOCK
      ?auto_165710 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165707 ?auto_165708 ) ) ( ON ?auto_165708 ?auto_165709 ) ( not ( = ?auto_165707 ?auto_165709 ) ) ( not ( = ?auto_165708 ?auto_165709 ) ) ( ON ?auto_165707 ?auto_165708 ) ( CLEAR ?auto_165707 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_165715 ) ( ON ?auto_165712 ?auto_165715 ) ( ON ?auto_165713 ?auto_165712 ) ( ON ?auto_165711 ?auto_165713 ) ( ON ?auto_165714 ?auto_165711 ) ( ON ?auto_165710 ?auto_165714 ) ( ON ?auto_165709 ?auto_165710 ) ( not ( = ?auto_165715 ?auto_165712 ) ) ( not ( = ?auto_165715 ?auto_165713 ) ) ( not ( = ?auto_165715 ?auto_165711 ) ) ( not ( = ?auto_165715 ?auto_165714 ) ) ( not ( = ?auto_165715 ?auto_165710 ) ) ( not ( = ?auto_165715 ?auto_165709 ) ) ( not ( = ?auto_165715 ?auto_165708 ) ) ( not ( = ?auto_165715 ?auto_165707 ) ) ( not ( = ?auto_165712 ?auto_165713 ) ) ( not ( = ?auto_165712 ?auto_165711 ) ) ( not ( = ?auto_165712 ?auto_165714 ) ) ( not ( = ?auto_165712 ?auto_165710 ) ) ( not ( = ?auto_165712 ?auto_165709 ) ) ( not ( = ?auto_165712 ?auto_165708 ) ) ( not ( = ?auto_165712 ?auto_165707 ) ) ( not ( = ?auto_165713 ?auto_165711 ) ) ( not ( = ?auto_165713 ?auto_165714 ) ) ( not ( = ?auto_165713 ?auto_165710 ) ) ( not ( = ?auto_165713 ?auto_165709 ) ) ( not ( = ?auto_165713 ?auto_165708 ) ) ( not ( = ?auto_165713 ?auto_165707 ) ) ( not ( = ?auto_165711 ?auto_165714 ) ) ( not ( = ?auto_165711 ?auto_165710 ) ) ( not ( = ?auto_165711 ?auto_165709 ) ) ( not ( = ?auto_165711 ?auto_165708 ) ) ( not ( = ?auto_165711 ?auto_165707 ) ) ( not ( = ?auto_165714 ?auto_165710 ) ) ( not ( = ?auto_165714 ?auto_165709 ) ) ( not ( = ?auto_165714 ?auto_165708 ) ) ( not ( = ?auto_165714 ?auto_165707 ) ) ( not ( = ?auto_165710 ?auto_165709 ) ) ( not ( = ?auto_165710 ?auto_165708 ) ) ( not ( = ?auto_165710 ?auto_165707 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_165715 ?auto_165712 ?auto_165713 ?auto_165711 ?auto_165714 ?auto_165710 ?auto_165709 ?auto_165708 )
      ( MAKE-2PILE ?auto_165707 ?auto_165708 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_165722 - BLOCK
      ?auto_165723 - BLOCK
      ?auto_165724 - BLOCK
      ?auto_165725 - BLOCK
      ?auto_165726 - BLOCK
      ?auto_165727 - BLOCK
    )
    :vars
    (
      ?auto_165728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165728 ?auto_165727 ) ( CLEAR ?auto_165728 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_165722 ) ( ON ?auto_165723 ?auto_165722 ) ( ON ?auto_165724 ?auto_165723 ) ( ON ?auto_165725 ?auto_165724 ) ( ON ?auto_165726 ?auto_165725 ) ( ON ?auto_165727 ?auto_165726 ) ( not ( = ?auto_165722 ?auto_165723 ) ) ( not ( = ?auto_165722 ?auto_165724 ) ) ( not ( = ?auto_165722 ?auto_165725 ) ) ( not ( = ?auto_165722 ?auto_165726 ) ) ( not ( = ?auto_165722 ?auto_165727 ) ) ( not ( = ?auto_165722 ?auto_165728 ) ) ( not ( = ?auto_165723 ?auto_165724 ) ) ( not ( = ?auto_165723 ?auto_165725 ) ) ( not ( = ?auto_165723 ?auto_165726 ) ) ( not ( = ?auto_165723 ?auto_165727 ) ) ( not ( = ?auto_165723 ?auto_165728 ) ) ( not ( = ?auto_165724 ?auto_165725 ) ) ( not ( = ?auto_165724 ?auto_165726 ) ) ( not ( = ?auto_165724 ?auto_165727 ) ) ( not ( = ?auto_165724 ?auto_165728 ) ) ( not ( = ?auto_165725 ?auto_165726 ) ) ( not ( = ?auto_165725 ?auto_165727 ) ) ( not ( = ?auto_165725 ?auto_165728 ) ) ( not ( = ?auto_165726 ?auto_165727 ) ) ( not ( = ?auto_165726 ?auto_165728 ) ) ( not ( = ?auto_165727 ?auto_165728 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_165728 ?auto_165727 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_165729 - BLOCK
      ?auto_165730 - BLOCK
      ?auto_165731 - BLOCK
      ?auto_165732 - BLOCK
      ?auto_165733 - BLOCK
      ?auto_165734 - BLOCK
    )
    :vars
    (
      ?auto_165735 - BLOCK
      ?auto_165736 - BLOCK
      ?auto_165737 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165735 ?auto_165734 ) ( CLEAR ?auto_165735 ) ( ON-TABLE ?auto_165729 ) ( ON ?auto_165730 ?auto_165729 ) ( ON ?auto_165731 ?auto_165730 ) ( ON ?auto_165732 ?auto_165731 ) ( ON ?auto_165733 ?auto_165732 ) ( ON ?auto_165734 ?auto_165733 ) ( not ( = ?auto_165729 ?auto_165730 ) ) ( not ( = ?auto_165729 ?auto_165731 ) ) ( not ( = ?auto_165729 ?auto_165732 ) ) ( not ( = ?auto_165729 ?auto_165733 ) ) ( not ( = ?auto_165729 ?auto_165734 ) ) ( not ( = ?auto_165729 ?auto_165735 ) ) ( not ( = ?auto_165730 ?auto_165731 ) ) ( not ( = ?auto_165730 ?auto_165732 ) ) ( not ( = ?auto_165730 ?auto_165733 ) ) ( not ( = ?auto_165730 ?auto_165734 ) ) ( not ( = ?auto_165730 ?auto_165735 ) ) ( not ( = ?auto_165731 ?auto_165732 ) ) ( not ( = ?auto_165731 ?auto_165733 ) ) ( not ( = ?auto_165731 ?auto_165734 ) ) ( not ( = ?auto_165731 ?auto_165735 ) ) ( not ( = ?auto_165732 ?auto_165733 ) ) ( not ( = ?auto_165732 ?auto_165734 ) ) ( not ( = ?auto_165732 ?auto_165735 ) ) ( not ( = ?auto_165733 ?auto_165734 ) ) ( not ( = ?auto_165733 ?auto_165735 ) ) ( not ( = ?auto_165734 ?auto_165735 ) ) ( HOLDING ?auto_165736 ) ( CLEAR ?auto_165737 ) ( not ( = ?auto_165729 ?auto_165736 ) ) ( not ( = ?auto_165729 ?auto_165737 ) ) ( not ( = ?auto_165730 ?auto_165736 ) ) ( not ( = ?auto_165730 ?auto_165737 ) ) ( not ( = ?auto_165731 ?auto_165736 ) ) ( not ( = ?auto_165731 ?auto_165737 ) ) ( not ( = ?auto_165732 ?auto_165736 ) ) ( not ( = ?auto_165732 ?auto_165737 ) ) ( not ( = ?auto_165733 ?auto_165736 ) ) ( not ( = ?auto_165733 ?auto_165737 ) ) ( not ( = ?auto_165734 ?auto_165736 ) ) ( not ( = ?auto_165734 ?auto_165737 ) ) ( not ( = ?auto_165735 ?auto_165736 ) ) ( not ( = ?auto_165735 ?auto_165737 ) ) ( not ( = ?auto_165736 ?auto_165737 ) ) )
    :subtasks
    ( ( !STACK ?auto_165736 ?auto_165737 )
      ( MAKE-6PILE ?auto_165729 ?auto_165730 ?auto_165731 ?auto_165732 ?auto_165733 ?auto_165734 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_167069 - BLOCK
      ?auto_167070 - BLOCK
      ?auto_167071 - BLOCK
      ?auto_167072 - BLOCK
      ?auto_167073 - BLOCK
      ?auto_167074 - BLOCK
    )
    :vars
    (
      ?auto_167076 - BLOCK
      ?auto_167075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167076 ?auto_167074 ) ( ON-TABLE ?auto_167069 ) ( ON ?auto_167070 ?auto_167069 ) ( ON ?auto_167071 ?auto_167070 ) ( ON ?auto_167072 ?auto_167071 ) ( ON ?auto_167073 ?auto_167072 ) ( ON ?auto_167074 ?auto_167073 ) ( not ( = ?auto_167069 ?auto_167070 ) ) ( not ( = ?auto_167069 ?auto_167071 ) ) ( not ( = ?auto_167069 ?auto_167072 ) ) ( not ( = ?auto_167069 ?auto_167073 ) ) ( not ( = ?auto_167069 ?auto_167074 ) ) ( not ( = ?auto_167069 ?auto_167076 ) ) ( not ( = ?auto_167070 ?auto_167071 ) ) ( not ( = ?auto_167070 ?auto_167072 ) ) ( not ( = ?auto_167070 ?auto_167073 ) ) ( not ( = ?auto_167070 ?auto_167074 ) ) ( not ( = ?auto_167070 ?auto_167076 ) ) ( not ( = ?auto_167071 ?auto_167072 ) ) ( not ( = ?auto_167071 ?auto_167073 ) ) ( not ( = ?auto_167071 ?auto_167074 ) ) ( not ( = ?auto_167071 ?auto_167076 ) ) ( not ( = ?auto_167072 ?auto_167073 ) ) ( not ( = ?auto_167072 ?auto_167074 ) ) ( not ( = ?auto_167072 ?auto_167076 ) ) ( not ( = ?auto_167073 ?auto_167074 ) ) ( not ( = ?auto_167073 ?auto_167076 ) ) ( not ( = ?auto_167074 ?auto_167076 ) ) ( not ( = ?auto_167069 ?auto_167075 ) ) ( not ( = ?auto_167070 ?auto_167075 ) ) ( not ( = ?auto_167071 ?auto_167075 ) ) ( not ( = ?auto_167072 ?auto_167075 ) ) ( not ( = ?auto_167073 ?auto_167075 ) ) ( not ( = ?auto_167074 ?auto_167075 ) ) ( not ( = ?auto_167076 ?auto_167075 ) ) ( ON ?auto_167075 ?auto_167076 ) ( CLEAR ?auto_167075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_167069 ?auto_167070 ?auto_167071 ?auto_167072 ?auto_167073 ?auto_167074 ?auto_167076 )
      ( MAKE-6PILE ?auto_167069 ?auto_167070 ?auto_167071 ?auto_167072 ?auto_167073 ?auto_167074 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_165747 - BLOCK
      ?auto_165748 - BLOCK
      ?auto_165749 - BLOCK
      ?auto_165750 - BLOCK
      ?auto_165751 - BLOCK
      ?auto_165752 - BLOCK
    )
    :vars
    (
      ?auto_165755 - BLOCK
      ?auto_165753 - BLOCK
      ?auto_165754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165755 ?auto_165752 ) ( ON-TABLE ?auto_165747 ) ( ON ?auto_165748 ?auto_165747 ) ( ON ?auto_165749 ?auto_165748 ) ( ON ?auto_165750 ?auto_165749 ) ( ON ?auto_165751 ?auto_165750 ) ( ON ?auto_165752 ?auto_165751 ) ( not ( = ?auto_165747 ?auto_165748 ) ) ( not ( = ?auto_165747 ?auto_165749 ) ) ( not ( = ?auto_165747 ?auto_165750 ) ) ( not ( = ?auto_165747 ?auto_165751 ) ) ( not ( = ?auto_165747 ?auto_165752 ) ) ( not ( = ?auto_165747 ?auto_165755 ) ) ( not ( = ?auto_165748 ?auto_165749 ) ) ( not ( = ?auto_165748 ?auto_165750 ) ) ( not ( = ?auto_165748 ?auto_165751 ) ) ( not ( = ?auto_165748 ?auto_165752 ) ) ( not ( = ?auto_165748 ?auto_165755 ) ) ( not ( = ?auto_165749 ?auto_165750 ) ) ( not ( = ?auto_165749 ?auto_165751 ) ) ( not ( = ?auto_165749 ?auto_165752 ) ) ( not ( = ?auto_165749 ?auto_165755 ) ) ( not ( = ?auto_165750 ?auto_165751 ) ) ( not ( = ?auto_165750 ?auto_165752 ) ) ( not ( = ?auto_165750 ?auto_165755 ) ) ( not ( = ?auto_165751 ?auto_165752 ) ) ( not ( = ?auto_165751 ?auto_165755 ) ) ( not ( = ?auto_165752 ?auto_165755 ) ) ( not ( = ?auto_165747 ?auto_165753 ) ) ( not ( = ?auto_165747 ?auto_165754 ) ) ( not ( = ?auto_165748 ?auto_165753 ) ) ( not ( = ?auto_165748 ?auto_165754 ) ) ( not ( = ?auto_165749 ?auto_165753 ) ) ( not ( = ?auto_165749 ?auto_165754 ) ) ( not ( = ?auto_165750 ?auto_165753 ) ) ( not ( = ?auto_165750 ?auto_165754 ) ) ( not ( = ?auto_165751 ?auto_165753 ) ) ( not ( = ?auto_165751 ?auto_165754 ) ) ( not ( = ?auto_165752 ?auto_165753 ) ) ( not ( = ?auto_165752 ?auto_165754 ) ) ( not ( = ?auto_165755 ?auto_165753 ) ) ( not ( = ?auto_165755 ?auto_165754 ) ) ( not ( = ?auto_165753 ?auto_165754 ) ) ( ON ?auto_165753 ?auto_165755 ) ( CLEAR ?auto_165753 ) ( HOLDING ?auto_165754 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_165754 )
      ( MAKE-6PILE ?auto_165747 ?auto_165748 ?auto_165749 ?auto_165750 ?auto_165751 ?auto_165752 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_165756 - BLOCK
      ?auto_165757 - BLOCK
      ?auto_165758 - BLOCK
      ?auto_165759 - BLOCK
      ?auto_165760 - BLOCK
      ?auto_165761 - BLOCK
    )
    :vars
    (
      ?auto_165762 - BLOCK
      ?auto_165764 - BLOCK
      ?auto_165763 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165762 ?auto_165761 ) ( ON-TABLE ?auto_165756 ) ( ON ?auto_165757 ?auto_165756 ) ( ON ?auto_165758 ?auto_165757 ) ( ON ?auto_165759 ?auto_165758 ) ( ON ?auto_165760 ?auto_165759 ) ( ON ?auto_165761 ?auto_165760 ) ( not ( = ?auto_165756 ?auto_165757 ) ) ( not ( = ?auto_165756 ?auto_165758 ) ) ( not ( = ?auto_165756 ?auto_165759 ) ) ( not ( = ?auto_165756 ?auto_165760 ) ) ( not ( = ?auto_165756 ?auto_165761 ) ) ( not ( = ?auto_165756 ?auto_165762 ) ) ( not ( = ?auto_165757 ?auto_165758 ) ) ( not ( = ?auto_165757 ?auto_165759 ) ) ( not ( = ?auto_165757 ?auto_165760 ) ) ( not ( = ?auto_165757 ?auto_165761 ) ) ( not ( = ?auto_165757 ?auto_165762 ) ) ( not ( = ?auto_165758 ?auto_165759 ) ) ( not ( = ?auto_165758 ?auto_165760 ) ) ( not ( = ?auto_165758 ?auto_165761 ) ) ( not ( = ?auto_165758 ?auto_165762 ) ) ( not ( = ?auto_165759 ?auto_165760 ) ) ( not ( = ?auto_165759 ?auto_165761 ) ) ( not ( = ?auto_165759 ?auto_165762 ) ) ( not ( = ?auto_165760 ?auto_165761 ) ) ( not ( = ?auto_165760 ?auto_165762 ) ) ( not ( = ?auto_165761 ?auto_165762 ) ) ( not ( = ?auto_165756 ?auto_165764 ) ) ( not ( = ?auto_165756 ?auto_165763 ) ) ( not ( = ?auto_165757 ?auto_165764 ) ) ( not ( = ?auto_165757 ?auto_165763 ) ) ( not ( = ?auto_165758 ?auto_165764 ) ) ( not ( = ?auto_165758 ?auto_165763 ) ) ( not ( = ?auto_165759 ?auto_165764 ) ) ( not ( = ?auto_165759 ?auto_165763 ) ) ( not ( = ?auto_165760 ?auto_165764 ) ) ( not ( = ?auto_165760 ?auto_165763 ) ) ( not ( = ?auto_165761 ?auto_165764 ) ) ( not ( = ?auto_165761 ?auto_165763 ) ) ( not ( = ?auto_165762 ?auto_165764 ) ) ( not ( = ?auto_165762 ?auto_165763 ) ) ( not ( = ?auto_165764 ?auto_165763 ) ) ( ON ?auto_165764 ?auto_165762 ) ( ON ?auto_165763 ?auto_165764 ) ( CLEAR ?auto_165763 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_165756 ?auto_165757 ?auto_165758 ?auto_165759 ?auto_165760 ?auto_165761 ?auto_165762 ?auto_165764 )
      ( MAKE-6PILE ?auto_165756 ?auto_165757 ?auto_165758 ?auto_165759 ?auto_165760 ?auto_165761 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_165768 - BLOCK
      ?auto_165769 - BLOCK
      ?auto_165770 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_165770 ) ( CLEAR ?auto_165769 ) ( ON-TABLE ?auto_165768 ) ( ON ?auto_165769 ?auto_165768 ) ( not ( = ?auto_165768 ?auto_165769 ) ) ( not ( = ?auto_165768 ?auto_165770 ) ) ( not ( = ?auto_165769 ?auto_165770 ) ) )
    :subtasks
    ( ( !STACK ?auto_165770 ?auto_165769 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_165771 - BLOCK
      ?auto_165772 - BLOCK
      ?auto_165773 - BLOCK
    )
    :vars
    (
      ?auto_165774 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_165772 ) ( ON-TABLE ?auto_165771 ) ( ON ?auto_165772 ?auto_165771 ) ( not ( = ?auto_165771 ?auto_165772 ) ) ( not ( = ?auto_165771 ?auto_165773 ) ) ( not ( = ?auto_165772 ?auto_165773 ) ) ( ON ?auto_165773 ?auto_165774 ) ( CLEAR ?auto_165773 ) ( HAND-EMPTY ) ( not ( = ?auto_165771 ?auto_165774 ) ) ( not ( = ?auto_165772 ?auto_165774 ) ) ( not ( = ?auto_165773 ?auto_165774 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_165773 ?auto_165774 )
      ( MAKE-3PILE ?auto_165771 ?auto_165772 ?auto_165773 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_165775 - BLOCK
      ?auto_165776 - BLOCK
      ?auto_165777 - BLOCK
    )
    :vars
    (
      ?auto_165778 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165775 ) ( not ( = ?auto_165775 ?auto_165776 ) ) ( not ( = ?auto_165775 ?auto_165777 ) ) ( not ( = ?auto_165776 ?auto_165777 ) ) ( ON ?auto_165777 ?auto_165778 ) ( CLEAR ?auto_165777 ) ( not ( = ?auto_165775 ?auto_165778 ) ) ( not ( = ?auto_165776 ?auto_165778 ) ) ( not ( = ?auto_165777 ?auto_165778 ) ) ( HOLDING ?auto_165776 ) ( CLEAR ?auto_165775 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_165775 ?auto_165776 )
      ( MAKE-3PILE ?auto_165775 ?auto_165776 ?auto_165777 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_165779 - BLOCK
      ?auto_165780 - BLOCK
      ?auto_165781 - BLOCK
    )
    :vars
    (
      ?auto_165782 - BLOCK
      ?auto_165784 - BLOCK
      ?auto_165783 - BLOCK
      ?auto_165785 - BLOCK
      ?auto_165786 - BLOCK
      ?auto_165787 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165779 ) ( not ( = ?auto_165779 ?auto_165780 ) ) ( not ( = ?auto_165779 ?auto_165781 ) ) ( not ( = ?auto_165780 ?auto_165781 ) ) ( ON ?auto_165781 ?auto_165782 ) ( not ( = ?auto_165779 ?auto_165782 ) ) ( not ( = ?auto_165780 ?auto_165782 ) ) ( not ( = ?auto_165781 ?auto_165782 ) ) ( CLEAR ?auto_165779 ) ( ON ?auto_165780 ?auto_165781 ) ( CLEAR ?auto_165780 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_165784 ) ( ON ?auto_165783 ?auto_165784 ) ( ON ?auto_165785 ?auto_165783 ) ( ON ?auto_165786 ?auto_165785 ) ( ON ?auto_165787 ?auto_165786 ) ( ON ?auto_165782 ?auto_165787 ) ( not ( = ?auto_165784 ?auto_165783 ) ) ( not ( = ?auto_165784 ?auto_165785 ) ) ( not ( = ?auto_165784 ?auto_165786 ) ) ( not ( = ?auto_165784 ?auto_165787 ) ) ( not ( = ?auto_165784 ?auto_165782 ) ) ( not ( = ?auto_165784 ?auto_165781 ) ) ( not ( = ?auto_165784 ?auto_165780 ) ) ( not ( = ?auto_165783 ?auto_165785 ) ) ( not ( = ?auto_165783 ?auto_165786 ) ) ( not ( = ?auto_165783 ?auto_165787 ) ) ( not ( = ?auto_165783 ?auto_165782 ) ) ( not ( = ?auto_165783 ?auto_165781 ) ) ( not ( = ?auto_165783 ?auto_165780 ) ) ( not ( = ?auto_165785 ?auto_165786 ) ) ( not ( = ?auto_165785 ?auto_165787 ) ) ( not ( = ?auto_165785 ?auto_165782 ) ) ( not ( = ?auto_165785 ?auto_165781 ) ) ( not ( = ?auto_165785 ?auto_165780 ) ) ( not ( = ?auto_165786 ?auto_165787 ) ) ( not ( = ?auto_165786 ?auto_165782 ) ) ( not ( = ?auto_165786 ?auto_165781 ) ) ( not ( = ?auto_165786 ?auto_165780 ) ) ( not ( = ?auto_165787 ?auto_165782 ) ) ( not ( = ?auto_165787 ?auto_165781 ) ) ( not ( = ?auto_165787 ?auto_165780 ) ) ( not ( = ?auto_165779 ?auto_165784 ) ) ( not ( = ?auto_165779 ?auto_165783 ) ) ( not ( = ?auto_165779 ?auto_165785 ) ) ( not ( = ?auto_165779 ?auto_165786 ) ) ( not ( = ?auto_165779 ?auto_165787 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_165784 ?auto_165783 ?auto_165785 ?auto_165786 ?auto_165787 ?auto_165782 ?auto_165781 )
      ( MAKE-3PILE ?auto_165779 ?auto_165780 ?auto_165781 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_165788 - BLOCK
      ?auto_165789 - BLOCK
      ?auto_165790 - BLOCK
    )
    :vars
    (
      ?auto_165796 - BLOCK
      ?auto_165793 - BLOCK
      ?auto_165794 - BLOCK
      ?auto_165795 - BLOCK
      ?auto_165792 - BLOCK
      ?auto_165791 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165788 ?auto_165789 ) ) ( not ( = ?auto_165788 ?auto_165790 ) ) ( not ( = ?auto_165789 ?auto_165790 ) ) ( ON ?auto_165790 ?auto_165796 ) ( not ( = ?auto_165788 ?auto_165796 ) ) ( not ( = ?auto_165789 ?auto_165796 ) ) ( not ( = ?auto_165790 ?auto_165796 ) ) ( ON ?auto_165789 ?auto_165790 ) ( CLEAR ?auto_165789 ) ( ON-TABLE ?auto_165793 ) ( ON ?auto_165794 ?auto_165793 ) ( ON ?auto_165795 ?auto_165794 ) ( ON ?auto_165792 ?auto_165795 ) ( ON ?auto_165791 ?auto_165792 ) ( ON ?auto_165796 ?auto_165791 ) ( not ( = ?auto_165793 ?auto_165794 ) ) ( not ( = ?auto_165793 ?auto_165795 ) ) ( not ( = ?auto_165793 ?auto_165792 ) ) ( not ( = ?auto_165793 ?auto_165791 ) ) ( not ( = ?auto_165793 ?auto_165796 ) ) ( not ( = ?auto_165793 ?auto_165790 ) ) ( not ( = ?auto_165793 ?auto_165789 ) ) ( not ( = ?auto_165794 ?auto_165795 ) ) ( not ( = ?auto_165794 ?auto_165792 ) ) ( not ( = ?auto_165794 ?auto_165791 ) ) ( not ( = ?auto_165794 ?auto_165796 ) ) ( not ( = ?auto_165794 ?auto_165790 ) ) ( not ( = ?auto_165794 ?auto_165789 ) ) ( not ( = ?auto_165795 ?auto_165792 ) ) ( not ( = ?auto_165795 ?auto_165791 ) ) ( not ( = ?auto_165795 ?auto_165796 ) ) ( not ( = ?auto_165795 ?auto_165790 ) ) ( not ( = ?auto_165795 ?auto_165789 ) ) ( not ( = ?auto_165792 ?auto_165791 ) ) ( not ( = ?auto_165792 ?auto_165796 ) ) ( not ( = ?auto_165792 ?auto_165790 ) ) ( not ( = ?auto_165792 ?auto_165789 ) ) ( not ( = ?auto_165791 ?auto_165796 ) ) ( not ( = ?auto_165791 ?auto_165790 ) ) ( not ( = ?auto_165791 ?auto_165789 ) ) ( not ( = ?auto_165788 ?auto_165793 ) ) ( not ( = ?auto_165788 ?auto_165794 ) ) ( not ( = ?auto_165788 ?auto_165795 ) ) ( not ( = ?auto_165788 ?auto_165792 ) ) ( not ( = ?auto_165788 ?auto_165791 ) ) ( HOLDING ?auto_165788 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_165788 )
      ( MAKE-3PILE ?auto_165788 ?auto_165789 ?auto_165790 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_165797 - BLOCK
      ?auto_165798 - BLOCK
      ?auto_165799 - BLOCK
    )
    :vars
    (
      ?auto_165801 - BLOCK
      ?auto_165802 - BLOCK
      ?auto_165804 - BLOCK
      ?auto_165803 - BLOCK
      ?auto_165800 - BLOCK
      ?auto_165805 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165797 ?auto_165798 ) ) ( not ( = ?auto_165797 ?auto_165799 ) ) ( not ( = ?auto_165798 ?auto_165799 ) ) ( ON ?auto_165799 ?auto_165801 ) ( not ( = ?auto_165797 ?auto_165801 ) ) ( not ( = ?auto_165798 ?auto_165801 ) ) ( not ( = ?auto_165799 ?auto_165801 ) ) ( ON ?auto_165798 ?auto_165799 ) ( ON-TABLE ?auto_165802 ) ( ON ?auto_165804 ?auto_165802 ) ( ON ?auto_165803 ?auto_165804 ) ( ON ?auto_165800 ?auto_165803 ) ( ON ?auto_165805 ?auto_165800 ) ( ON ?auto_165801 ?auto_165805 ) ( not ( = ?auto_165802 ?auto_165804 ) ) ( not ( = ?auto_165802 ?auto_165803 ) ) ( not ( = ?auto_165802 ?auto_165800 ) ) ( not ( = ?auto_165802 ?auto_165805 ) ) ( not ( = ?auto_165802 ?auto_165801 ) ) ( not ( = ?auto_165802 ?auto_165799 ) ) ( not ( = ?auto_165802 ?auto_165798 ) ) ( not ( = ?auto_165804 ?auto_165803 ) ) ( not ( = ?auto_165804 ?auto_165800 ) ) ( not ( = ?auto_165804 ?auto_165805 ) ) ( not ( = ?auto_165804 ?auto_165801 ) ) ( not ( = ?auto_165804 ?auto_165799 ) ) ( not ( = ?auto_165804 ?auto_165798 ) ) ( not ( = ?auto_165803 ?auto_165800 ) ) ( not ( = ?auto_165803 ?auto_165805 ) ) ( not ( = ?auto_165803 ?auto_165801 ) ) ( not ( = ?auto_165803 ?auto_165799 ) ) ( not ( = ?auto_165803 ?auto_165798 ) ) ( not ( = ?auto_165800 ?auto_165805 ) ) ( not ( = ?auto_165800 ?auto_165801 ) ) ( not ( = ?auto_165800 ?auto_165799 ) ) ( not ( = ?auto_165800 ?auto_165798 ) ) ( not ( = ?auto_165805 ?auto_165801 ) ) ( not ( = ?auto_165805 ?auto_165799 ) ) ( not ( = ?auto_165805 ?auto_165798 ) ) ( not ( = ?auto_165797 ?auto_165802 ) ) ( not ( = ?auto_165797 ?auto_165804 ) ) ( not ( = ?auto_165797 ?auto_165803 ) ) ( not ( = ?auto_165797 ?auto_165800 ) ) ( not ( = ?auto_165797 ?auto_165805 ) ) ( ON ?auto_165797 ?auto_165798 ) ( CLEAR ?auto_165797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_165802 ?auto_165804 ?auto_165803 ?auto_165800 ?auto_165805 ?auto_165801 ?auto_165799 ?auto_165798 )
      ( MAKE-3PILE ?auto_165797 ?auto_165798 ?auto_165799 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_165811 - BLOCK
      ?auto_165812 - BLOCK
      ?auto_165813 - BLOCK
      ?auto_165814 - BLOCK
      ?auto_165815 - BLOCK
    )
    :vars
    (
      ?auto_165816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165816 ?auto_165815 ) ( CLEAR ?auto_165816 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_165811 ) ( ON ?auto_165812 ?auto_165811 ) ( ON ?auto_165813 ?auto_165812 ) ( ON ?auto_165814 ?auto_165813 ) ( ON ?auto_165815 ?auto_165814 ) ( not ( = ?auto_165811 ?auto_165812 ) ) ( not ( = ?auto_165811 ?auto_165813 ) ) ( not ( = ?auto_165811 ?auto_165814 ) ) ( not ( = ?auto_165811 ?auto_165815 ) ) ( not ( = ?auto_165811 ?auto_165816 ) ) ( not ( = ?auto_165812 ?auto_165813 ) ) ( not ( = ?auto_165812 ?auto_165814 ) ) ( not ( = ?auto_165812 ?auto_165815 ) ) ( not ( = ?auto_165812 ?auto_165816 ) ) ( not ( = ?auto_165813 ?auto_165814 ) ) ( not ( = ?auto_165813 ?auto_165815 ) ) ( not ( = ?auto_165813 ?auto_165816 ) ) ( not ( = ?auto_165814 ?auto_165815 ) ) ( not ( = ?auto_165814 ?auto_165816 ) ) ( not ( = ?auto_165815 ?auto_165816 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_165816 ?auto_165815 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_165817 - BLOCK
      ?auto_165818 - BLOCK
      ?auto_165819 - BLOCK
      ?auto_165820 - BLOCK
      ?auto_165821 - BLOCK
    )
    :vars
    (
      ?auto_165822 - BLOCK
      ?auto_165823 - BLOCK
      ?auto_165824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165822 ?auto_165821 ) ( CLEAR ?auto_165822 ) ( ON-TABLE ?auto_165817 ) ( ON ?auto_165818 ?auto_165817 ) ( ON ?auto_165819 ?auto_165818 ) ( ON ?auto_165820 ?auto_165819 ) ( ON ?auto_165821 ?auto_165820 ) ( not ( = ?auto_165817 ?auto_165818 ) ) ( not ( = ?auto_165817 ?auto_165819 ) ) ( not ( = ?auto_165817 ?auto_165820 ) ) ( not ( = ?auto_165817 ?auto_165821 ) ) ( not ( = ?auto_165817 ?auto_165822 ) ) ( not ( = ?auto_165818 ?auto_165819 ) ) ( not ( = ?auto_165818 ?auto_165820 ) ) ( not ( = ?auto_165818 ?auto_165821 ) ) ( not ( = ?auto_165818 ?auto_165822 ) ) ( not ( = ?auto_165819 ?auto_165820 ) ) ( not ( = ?auto_165819 ?auto_165821 ) ) ( not ( = ?auto_165819 ?auto_165822 ) ) ( not ( = ?auto_165820 ?auto_165821 ) ) ( not ( = ?auto_165820 ?auto_165822 ) ) ( not ( = ?auto_165821 ?auto_165822 ) ) ( HOLDING ?auto_165823 ) ( CLEAR ?auto_165824 ) ( not ( = ?auto_165817 ?auto_165823 ) ) ( not ( = ?auto_165817 ?auto_165824 ) ) ( not ( = ?auto_165818 ?auto_165823 ) ) ( not ( = ?auto_165818 ?auto_165824 ) ) ( not ( = ?auto_165819 ?auto_165823 ) ) ( not ( = ?auto_165819 ?auto_165824 ) ) ( not ( = ?auto_165820 ?auto_165823 ) ) ( not ( = ?auto_165820 ?auto_165824 ) ) ( not ( = ?auto_165821 ?auto_165823 ) ) ( not ( = ?auto_165821 ?auto_165824 ) ) ( not ( = ?auto_165822 ?auto_165823 ) ) ( not ( = ?auto_165822 ?auto_165824 ) ) ( not ( = ?auto_165823 ?auto_165824 ) ) )
    :subtasks
    ( ( !STACK ?auto_165823 ?auto_165824 )
      ( MAKE-5PILE ?auto_165817 ?auto_165818 ?auto_165819 ?auto_165820 ?auto_165821 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_165825 - BLOCK
      ?auto_165826 - BLOCK
      ?auto_165827 - BLOCK
      ?auto_165828 - BLOCK
      ?auto_165829 - BLOCK
    )
    :vars
    (
      ?auto_165831 - BLOCK
      ?auto_165830 - BLOCK
      ?auto_165832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165831 ?auto_165829 ) ( ON-TABLE ?auto_165825 ) ( ON ?auto_165826 ?auto_165825 ) ( ON ?auto_165827 ?auto_165826 ) ( ON ?auto_165828 ?auto_165827 ) ( ON ?auto_165829 ?auto_165828 ) ( not ( = ?auto_165825 ?auto_165826 ) ) ( not ( = ?auto_165825 ?auto_165827 ) ) ( not ( = ?auto_165825 ?auto_165828 ) ) ( not ( = ?auto_165825 ?auto_165829 ) ) ( not ( = ?auto_165825 ?auto_165831 ) ) ( not ( = ?auto_165826 ?auto_165827 ) ) ( not ( = ?auto_165826 ?auto_165828 ) ) ( not ( = ?auto_165826 ?auto_165829 ) ) ( not ( = ?auto_165826 ?auto_165831 ) ) ( not ( = ?auto_165827 ?auto_165828 ) ) ( not ( = ?auto_165827 ?auto_165829 ) ) ( not ( = ?auto_165827 ?auto_165831 ) ) ( not ( = ?auto_165828 ?auto_165829 ) ) ( not ( = ?auto_165828 ?auto_165831 ) ) ( not ( = ?auto_165829 ?auto_165831 ) ) ( CLEAR ?auto_165830 ) ( not ( = ?auto_165825 ?auto_165832 ) ) ( not ( = ?auto_165825 ?auto_165830 ) ) ( not ( = ?auto_165826 ?auto_165832 ) ) ( not ( = ?auto_165826 ?auto_165830 ) ) ( not ( = ?auto_165827 ?auto_165832 ) ) ( not ( = ?auto_165827 ?auto_165830 ) ) ( not ( = ?auto_165828 ?auto_165832 ) ) ( not ( = ?auto_165828 ?auto_165830 ) ) ( not ( = ?auto_165829 ?auto_165832 ) ) ( not ( = ?auto_165829 ?auto_165830 ) ) ( not ( = ?auto_165831 ?auto_165832 ) ) ( not ( = ?auto_165831 ?auto_165830 ) ) ( not ( = ?auto_165832 ?auto_165830 ) ) ( ON ?auto_165832 ?auto_165831 ) ( CLEAR ?auto_165832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_165825 ?auto_165826 ?auto_165827 ?auto_165828 ?auto_165829 ?auto_165831 )
      ( MAKE-5PILE ?auto_165825 ?auto_165826 ?auto_165827 ?auto_165828 ?auto_165829 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_165833 - BLOCK
      ?auto_165834 - BLOCK
      ?auto_165835 - BLOCK
      ?auto_165836 - BLOCK
      ?auto_165837 - BLOCK
    )
    :vars
    (
      ?auto_165838 - BLOCK
      ?auto_165839 - BLOCK
      ?auto_165840 - BLOCK
      ?auto_165841 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165838 ?auto_165837 ) ( ON-TABLE ?auto_165833 ) ( ON ?auto_165834 ?auto_165833 ) ( ON ?auto_165835 ?auto_165834 ) ( ON ?auto_165836 ?auto_165835 ) ( ON ?auto_165837 ?auto_165836 ) ( not ( = ?auto_165833 ?auto_165834 ) ) ( not ( = ?auto_165833 ?auto_165835 ) ) ( not ( = ?auto_165833 ?auto_165836 ) ) ( not ( = ?auto_165833 ?auto_165837 ) ) ( not ( = ?auto_165833 ?auto_165838 ) ) ( not ( = ?auto_165834 ?auto_165835 ) ) ( not ( = ?auto_165834 ?auto_165836 ) ) ( not ( = ?auto_165834 ?auto_165837 ) ) ( not ( = ?auto_165834 ?auto_165838 ) ) ( not ( = ?auto_165835 ?auto_165836 ) ) ( not ( = ?auto_165835 ?auto_165837 ) ) ( not ( = ?auto_165835 ?auto_165838 ) ) ( not ( = ?auto_165836 ?auto_165837 ) ) ( not ( = ?auto_165836 ?auto_165838 ) ) ( not ( = ?auto_165837 ?auto_165838 ) ) ( not ( = ?auto_165833 ?auto_165839 ) ) ( not ( = ?auto_165833 ?auto_165840 ) ) ( not ( = ?auto_165834 ?auto_165839 ) ) ( not ( = ?auto_165834 ?auto_165840 ) ) ( not ( = ?auto_165835 ?auto_165839 ) ) ( not ( = ?auto_165835 ?auto_165840 ) ) ( not ( = ?auto_165836 ?auto_165839 ) ) ( not ( = ?auto_165836 ?auto_165840 ) ) ( not ( = ?auto_165837 ?auto_165839 ) ) ( not ( = ?auto_165837 ?auto_165840 ) ) ( not ( = ?auto_165838 ?auto_165839 ) ) ( not ( = ?auto_165838 ?auto_165840 ) ) ( not ( = ?auto_165839 ?auto_165840 ) ) ( ON ?auto_165839 ?auto_165838 ) ( CLEAR ?auto_165839 ) ( HOLDING ?auto_165840 ) ( CLEAR ?auto_165841 ) ( ON-TABLE ?auto_165841 ) ( not ( = ?auto_165841 ?auto_165840 ) ) ( not ( = ?auto_165833 ?auto_165841 ) ) ( not ( = ?auto_165834 ?auto_165841 ) ) ( not ( = ?auto_165835 ?auto_165841 ) ) ( not ( = ?auto_165836 ?auto_165841 ) ) ( not ( = ?auto_165837 ?auto_165841 ) ) ( not ( = ?auto_165838 ?auto_165841 ) ) ( not ( = ?auto_165839 ?auto_165841 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_165841 ?auto_165840 )
      ( MAKE-5PILE ?auto_165833 ?auto_165834 ?auto_165835 ?auto_165836 ?auto_165837 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_167361 - BLOCK
      ?auto_167362 - BLOCK
      ?auto_167363 - BLOCK
      ?auto_167364 - BLOCK
      ?auto_167365 - BLOCK
    )
    :vars
    (
      ?auto_167368 - BLOCK
      ?auto_167367 - BLOCK
      ?auto_167366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167368 ?auto_167365 ) ( ON-TABLE ?auto_167361 ) ( ON ?auto_167362 ?auto_167361 ) ( ON ?auto_167363 ?auto_167362 ) ( ON ?auto_167364 ?auto_167363 ) ( ON ?auto_167365 ?auto_167364 ) ( not ( = ?auto_167361 ?auto_167362 ) ) ( not ( = ?auto_167361 ?auto_167363 ) ) ( not ( = ?auto_167361 ?auto_167364 ) ) ( not ( = ?auto_167361 ?auto_167365 ) ) ( not ( = ?auto_167361 ?auto_167368 ) ) ( not ( = ?auto_167362 ?auto_167363 ) ) ( not ( = ?auto_167362 ?auto_167364 ) ) ( not ( = ?auto_167362 ?auto_167365 ) ) ( not ( = ?auto_167362 ?auto_167368 ) ) ( not ( = ?auto_167363 ?auto_167364 ) ) ( not ( = ?auto_167363 ?auto_167365 ) ) ( not ( = ?auto_167363 ?auto_167368 ) ) ( not ( = ?auto_167364 ?auto_167365 ) ) ( not ( = ?auto_167364 ?auto_167368 ) ) ( not ( = ?auto_167365 ?auto_167368 ) ) ( not ( = ?auto_167361 ?auto_167367 ) ) ( not ( = ?auto_167361 ?auto_167366 ) ) ( not ( = ?auto_167362 ?auto_167367 ) ) ( not ( = ?auto_167362 ?auto_167366 ) ) ( not ( = ?auto_167363 ?auto_167367 ) ) ( not ( = ?auto_167363 ?auto_167366 ) ) ( not ( = ?auto_167364 ?auto_167367 ) ) ( not ( = ?auto_167364 ?auto_167366 ) ) ( not ( = ?auto_167365 ?auto_167367 ) ) ( not ( = ?auto_167365 ?auto_167366 ) ) ( not ( = ?auto_167368 ?auto_167367 ) ) ( not ( = ?auto_167368 ?auto_167366 ) ) ( not ( = ?auto_167367 ?auto_167366 ) ) ( ON ?auto_167367 ?auto_167368 ) ( ON ?auto_167366 ?auto_167367 ) ( CLEAR ?auto_167366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_167361 ?auto_167362 ?auto_167363 ?auto_167364 ?auto_167365 ?auto_167368 ?auto_167367 )
      ( MAKE-5PILE ?auto_167361 ?auto_167362 ?auto_167363 ?auto_167364 ?auto_167365 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_165851 - BLOCK
      ?auto_165852 - BLOCK
      ?auto_165853 - BLOCK
      ?auto_165854 - BLOCK
      ?auto_165855 - BLOCK
    )
    :vars
    (
      ?auto_165856 - BLOCK
      ?auto_165858 - BLOCK
      ?auto_165859 - BLOCK
      ?auto_165857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165856 ?auto_165855 ) ( ON-TABLE ?auto_165851 ) ( ON ?auto_165852 ?auto_165851 ) ( ON ?auto_165853 ?auto_165852 ) ( ON ?auto_165854 ?auto_165853 ) ( ON ?auto_165855 ?auto_165854 ) ( not ( = ?auto_165851 ?auto_165852 ) ) ( not ( = ?auto_165851 ?auto_165853 ) ) ( not ( = ?auto_165851 ?auto_165854 ) ) ( not ( = ?auto_165851 ?auto_165855 ) ) ( not ( = ?auto_165851 ?auto_165856 ) ) ( not ( = ?auto_165852 ?auto_165853 ) ) ( not ( = ?auto_165852 ?auto_165854 ) ) ( not ( = ?auto_165852 ?auto_165855 ) ) ( not ( = ?auto_165852 ?auto_165856 ) ) ( not ( = ?auto_165853 ?auto_165854 ) ) ( not ( = ?auto_165853 ?auto_165855 ) ) ( not ( = ?auto_165853 ?auto_165856 ) ) ( not ( = ?auto_165854 ?auto_165855 ) ) ( not ( = ?auto_165854 ?auto_165856 ) ) ( not ( = ?auto_165855 ?auto_165856 ) ) ( not ( = ?auto_165851 ?auto_165858 ) ) ( not ( = ?auto_165851 ?auto_165859 ) ) ( not ( = ?auto_165852 ?auto_165858 ) ) ( not ( = ?auto_165852 ?auto_165859 ) ) ( not ( = ?auto_165853 ?auto_165858 ) ) ( not ( = ?auto_165853 ?auto_165859 ) ) ( not ( = ?auto_165854 ?auto_165858 ) ) ( not ( = ?auto_165854 ?auto_165859 ) ) ( not ( = ?auto_165855 ?auto_165858 ) ) ( not ( = ?auto_165855 ?auto_165859 ) ) ( not ( = ?auto_165856 ?auto_165858 ) ) ( not ( = ?auto_165856 ?auto_165859 ) ) ( not ( = ?auto_165858 ?auto_165859 ) ) ( ON ?auto_165858 ?auto_165856 ) ( not ( = ?auto_165857 ?auto_165859 ) ) ( not ( = ?auto_165851 ?auto_165857 ) ) ( not ( = ?auto_165852 ?auto_165857 ) ) ( not ( = ?auto_165853 ?auto_165857 ) ) ( not ( = ?auto_165854 ?auto_165857 ) ) ( not ( = ?auto_165855 ?auto_165857 ) ) ( not ( = ?auto_165856 ?auto_165857 ) ) ( not ( = ?auto_165858 ?auto_165857 ) ) ( ON ?auto_165859 ?auto_165858 ) ( CLEAR ?auto_165859 ) ( HOLDING ?auto_165857 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_165857 )
      ( MAKE-5PILE ?auto_165851 ?auto_165852 ?auto_165853 ?auto_165854 ?auto_165855 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_165860 - BLOCK
      ?auto_165861 - BLOCK
      ?auto_165862 - BLOCK
      ?auto_165863 - BLOCK
      ?auto_165864 - BLOCK
    )
    :vars
    (
      ?auto_165868 - BLOCK
      ?auto_165865 - BLOCK
      ?auto_165866 - BLOCK
      ?auto_165867 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165868 ?auto_165864 ) ( ON-TABLE ?auto_165860 ) ( ON ?auto_165861 ?auto_165860 ) ( ON ?auto_165862 ?auto_165861 ) ( ON ?auto_165863 ?auto_165862 ) ( ON ?auto_165864 ?auto_165863 ) ( not ( = ?auto_165860 ?auto_165861 ) ) ( not ( = ?auto_165860 ?auto_165862 ) ) ( not ( = ?auto_165860 ?auto_165863 ) ) ( not ( = ?auto_165860 ?auto_165864 ) ) ( not ( = ?auto_165860 ?auto_165868 ) ) ( not ( = ?auto_165861 ?auto_165862 ) ) ( not ( = ?auto_165861 ?auto_165863 ) ) ( not ( = ?auto_165861 ?auto_165864 ) ) ( not ( = ?auto_165861 ?auto_165868 ) ) ( not ( = ?auto_165862 ?auto_165863 ) ) ( not ( = ?auto_165862 ?auto_165864 ) ) ( not ( = ?auto_165862 ?auto_165868 ) ) ( not ( = ?auto_165863 ?auto_165864 ) ) ( not ( = ?auto_165863 ?auto_165868 ) ) ( not ( = ?auto_165864 ?auto_165868 ) ) ( not ( = ?auto_165860 ?auto_165865 ) ) ( not ( = ?auto_165860 ?auto_165866 ) ) ( not ( = ?auto_165861 ?auto_165865 ) ) ( not ( = ?auto_165861 ?auto_165866 ) ) ( not ( = ?auto_165862 ?auto_165865 ) ) ( not ( = ?auto_165862 ?auto_165866 ) ) ( not ( = ?auto_165863 ?auto_165865 ) ) ( not ( = ?auto_165863 ?auto_165866 ) ) ( not ( = ?auto_165864 ?auto_165865 ) ) ( not ( = ?auto_165864 ?auto_165866 ) ) ( not ( = ?auto_165868 ?auto_165865 ) ) ( not ( = ?auto_165868 ?auto_165866 ) ) ( not ( = ?auto_165865 ?auto_165866 ) ) ( ON ?auto_165865 ?auto_165868 ) ( not ( = ?auto_165867 ?auto_165866 ) ) ( not ( = ?auto_165860 ?auto_165867 ) ) ( not ( = ?auto_165861 ?auto_165867 ) ) ( not ( = ?auto_165862 ?auto_165867 ) ) ( not ( = ?auto_165863 ?auto_165867 ) ) ( not ( = ?auto_165864 ?auto_165867 ) ) ( not ( = ?auto_165868 ?auto_165867 ) ) ( not ( = ?auto_165865 ?auto_165867 ) ) ( ON ?auto_165866 ?auto_165865 ) ( ON ?auto_165867 ?auto_165866 ) ( CLEAR ?auto_165867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_165860 ?auto_165861 ?auto_165862 ?auto_165863 ?auto_165864 ?auto_165868 ?auto_165865 ?auto_165866 )
      ( MAKE-5PILE ?auto_165860 ?auto_165861 ?auto_165862 ?auto_165863 ?auto_165864 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_165873 - BLOCK
      ?auto_165874 - BLOCK
      ?auto_165875 - BLOCK
      ?auto_165876 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_165876 ) ( CLEAR ?auto_165875 ) ( ON-TABLE ?auto_165873 ) ( ON ?auto_165874 ?auto_165873 ) ( ON ?auto_165875 ?auto_165874 ) ( not ( = ?auto_165873 ?auto_165874 ) ) ( not ( = ?auto_165873 ?auto_165875 ) ) ( not ( = ?auto_165873 ?auto_165876 ) ) ( not ( = ?auto_165874 ?auto_165875 ) ) ( not ( = ?auto_165874 ?auto_165876 ) ) ( not ( = ?auto_165875 ?auto_165876 ) ) )
    :subtasks
    ( ( !STACK ?auto_165876 ?auto_165875 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_165877 - BLOCK
      ?auto_165878 - BLOCK
      ?auto_165879 - BLOCK
      ?auto_165880 - BLOCK
    )
    :vars
    (
      ?auto_165881 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_165879 ) ( ON-TABLE ?auto_165877 ) ( ON ?auto_165878 ?auto_165877 ) ( ON ?auto_165879 ?auto_165878 ) ( not ( = ?auto_165877 ?auto_165878 ) ) ( not ( = ?auto_165877 ?auto_165879 ) ) ( not ( = ?auto_165877 ?auto_165880 ) ) ( not ( = ?auto_165878 ?auto_165879 ) ) ( not ( = ?auto_165878 ?auto_165880 ) ) ( not ( = ?auto_165879 ?auto_165880 ) ) ( ON ?auto_165880 ?auto_165881 ) ( CLEAR ?auto_165880 ) ( HAND-EMPTY ) ( not ( = ?auto_165877 ?auto_165881 ) ) ( not ( = ?auto_165878 ?auto_165881 ) ) ( not ( = ?auto_165879 ?auto_165881 ) ) ( not ( = ?auto_165880 ?auto_165881 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_165880 ?auto_165881 )
      ( MAKE-4PILE ?auto_165877 ?auto_165878 ?auto_165879 ?auto_165880 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_165882 - BLOCK
      ?auto_165883 - BLOCK
      ?auto_165884 - BLOCK
      ?auto_165885 - BLOCK
    )
    :vars
    (
      ?auto_165886 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165882 ) ( ON ?auto_165883 ?auto_165882 ) ( not ( = ?auto_165882 ?auto_165883 ) ) ( not ( = ?auto_165882 ?auto_165884 ) ) ( not ( = ?auto_165882 ?auto_165885 ) ) ( not ( = ?auto_165883 ?auto_165884 ) ) ( not ( = ?auto_165883 ?auto_165885 ) ) ( not ( = ?auto_165884 ?auto_165885 ) ) ( ON ?auto_165885 ?auto_165886 ) ( CLEAR ?auto_165885 ) ( not ( = ?auto_165882 ?auto_165886 ) ) ( not ( = ?auto_165883 ?auto_165886 ) ) ( not ( = ?auto_165884 ?auto_165886 ) ) ( not ( = ?auto_165885 ?auto_165886 ) ) ( HOLDING ?auto_165884 ) ( CLEAR ?auto_165883 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_165882 ?auto_165883 ?auto_165884 )
      ( MAKE-4PILE ?auto_165882 ?auto_165883 ?auto_165884 ?auto_165885 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_165887 - BLOCK
      ?auto_165888 - BLOCK
      ?auto_165889 - BLOCK
      ?auto_165890 - BLOCK
    )
    :vars
    (
      ?auto_165891 - BLOCK
      ?auto_165892 - BLOCK
      ?auto_165895 - BLOCK
      ?auto_165894 - BLOCK
      ?auto_165893 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165887 ) ( ON ?auto_165888 ?auto_165887 ) ( not ( = ?auto_165887 ?auto_165888 ) ) ( not ( = ?auto_165887 ?auto_165889 ) ) ( not ( = ?auto_165887 ?auto_165890 ) ) ( not ( = ?auto_165888 ?auto_165889 ) ) ( not ( = ?auto_165888 ?auto_165890 ) ) ( not ( = ?auto_165889 ?auto_165890 ) ) ( ON ?auto_165890 ?auto_165891 ) ( not ( = ?auto_165887 ?auto_165891 ) ) ( not ( = ?auto_165888 ?auto_165891 ) ) ( not ( = ?auto_165889 ?auto_165891 ) ) ( not ( = ?auto_165890 ?auto_165891 ) ) ( CLEAR ?auto_165888 ) ( ON ?auto_165889 ?auto_165890 ) ( CLEAR ?auto_165889 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_165892 ) ( ON ?auto_165895 ?auto_165892 ) ( ON ?auto_165894 ?auto_165895 ) ( ON ?auto_165893 ?auto_165894 ) ( ON ?auto_165891 ?auto_165893 ) ( not ( = ?auto_165892 ?auto_165895 ) ) ( not ( = ?auto_165892 ?auto_165894 ) ) ( not ( = ?auto_165892 ?auto_165893 ) ) ( not ( = ?auto_165892 ?auto_165891 ) ) ( not ( = ?auto_165892 ?auto_165890 ) ) ( not ( = ?auto_165892 ?auto_165889 ) ) ( not ( = ?auto_165895 ?auto_165894 ) ) ( not ( = ?auto_165895 ?auto_165893 ) ) ( not ( = ?auto_165895 ?auto_165891 ) ) ( not ( = ?auto_165895 ?auto_165890 ) ) ( not ( = ?auto_165895 ?auto_165889 ) ) ( not ( = ?auto_165894 ?auto_165893 ) ) ( not ( = ?auto_165894 ?auto_165891 ) ) ( not ( = ?auto_165894 ?auto_165890 ) ) ( not ( = ?auto_165894 ?auto_165889 ) ) ( not ( = ?auto_165893 ?auto_165891 ) ) ( not ( = ?auto_165893 ?auto_165890 ) ) ( not ( = ?auto_165893 ?auto_165889 ) ) ( not ( = ?auto_165887 ?auto_165892 ) ) ( not ( = ?auto_165887 ?auto_165895 ) ) ( not ( = ?auto_165887 ?auto_165894 ) ) ( not ( = ?auto_165887 ?auto_165893 ) ) ( not ( = ?auto_165888 ?auto_165892 ) ) ( not ( = ?auto_165888 ?auto_165895 ) ) ( not ( = ?auto_165888 ?auto_165894 ) ) ( not ( = ?auto_165888 ?auto_165893 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_165892 ?auto_165895 ?auto_165894 ?auto_165893 ?auto_165891 ?auto_165890 )
      ( MAKE-4PILE ?auto_165887 ?auto_165888 ?auto_165889 ?auto_165890 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_165896 - BLOCK
      ?auto_165897 - BLOCK
      ?auto_165898 - BLOCK
      ?auto_165899 - BLOCK
    )
    :vars
    (
      ?auto_165904 - BLOCK
      ?auto_165901 - BLOCK
      ?auto_165902 - BLOCK
      ?auto_165903 - BLOCK
      ?auto_165900 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165896 ) ( not ( = ?auto_165896 ?auto_165897 ) ) ( not ( = ?auto_165896 ?auto_165898 ) ) ( not ( = ?auto_165896 ?auto_165899 ) ) ( not ( = ?auto_165897 ?auto_165898 ) ) ( not ( = ?auto_165897 ?auto_165899 ) ) ( not ( = ?auto_165898 ?auto_165899 ) ) ( ON ?auto_165899 ?auto_165904 ) ( not ( = ?auto_165896 ?auto_165904 ) ) ( not ( = ?auto_165897 ?auto_165904 ) ) ( not ( = ?auto_165898 ?auto_165904 ) ) ( not ( = ?auto_165899 ?auto_165904 ) ) ( ON ?auto_165898 ?auto_165899 ) ( CLEAR ?auto_165898 ) ( ON-TABLE ?auto_165901 ) ( ON ?auto_165902 ?auto_165901 ) ( ON ?auto_165903 ?auto_165902 ) ( ON ?auto_165900 ?auto_165903 ) ( ON ?auto_165904 ?auto_165900 ) ( not ( = ?auto_165901 ?auto_165902 ) ) ( not ( = ?auto_165901 ?auto_165903 ) ) ( not ( = ?auto_165901 ?auto_165900 ) ) ( not ( = ?auto_165901 ?auto_165904 ) ) ( not ( = ?auto_165901 ?auto_165899 ) ) ( not ( = ?auto_165901 ?auto_165898 ) ) ( not ( = ?auto_165902 ?auto_165903 ) ) ( not ( = ?auto_165902 ?auto_165900 ) ) ( not ( = ?auto_165902 ?auto_165904 ) ) ( not ( = ?auto_165902 ?auto_165899 ) ) ( not ( = ?auto_165902 ?auto_165898 ) ) ( not ( = ?auto_165903 ?auto_165900 ) ) ( not ( = ?auto_165903 ?auto_165904 ) ) ( not ( = ?auto_165903 ?auto_165899 ) ) ( not ( = ?auto_165903 ?auto_165898 ) ) ( not ( = ?auto_165900 ?auto_165904 ) ) ( not ( = ?auto_165900 ?auto_165899 ) ) ( not ( = ?auto_165900 ?auto_165898 ) ) ( not ( = ?auto_165896 ?auto_165901 ) ) ( not ( = ?auto_165896 ?auto_165902 ) ) ( not ( = ?auto_165896 ?auto_165903 ) ) ( not ( = ?auto_165896 ?auto_165900 ) ) ( not ( = ?auto_165897 ?auto_165901 ) ) ( not ( = ?auto_165897 ?auto_165902 ) ) ( not ( = ?auto_165897 ?auto_165903 ) ) ( not ( = ?auto_165897 ?auto_165900 ) ) ( HOLDING ?auto_165897 ) ( CLEAR ?auto_165896 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_165896 ?auto_165897 )
      ( MAKE-4PILE ?auto_165896 ?auto_165897 ?auto_165898 ?auto_165899 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_165905 - BLOCK
      ?auto_165906 - BLOCK
      ?auto_165907 - BLOCK
      ?auto_165908 - BLOCK
    )
    :vars
    (
      ?auto_165911 - BLOCK
      ?auto_165913 - BLOCK
      ?auto_165910 - BLOCK
      ?auto_165912 - BLOCK
      ?auto_165909 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165905 ) ( not ( = ?auto_165905 ?auto_165906 ) ) ( not ( = ?auto_165905 ?auto_165907 ) ) ( not ( = ?auto_165905 ?auto_165908 ) ) ( not ( = ?auto_165906 ?auto_165907 ) ) ( not ( = ?auto_165906 ?auto_165908 ) ) ( not ( = ?auto_165907 ?auto_165908 ) ) ( ON ?auto_165908 ?auto_165911 ) ( not ( = ?auto_165905 ?auto_165911 ) ) ( not ( = ?auto_165906 ?auto_165911 ) ) ( not ( = ?auto_165907 ?auto_165911 ) ) ( not ( = ?auto_165908 ?auto_165911 ) ) ( ON ?auto_165907 ?auto_165908 ) ( ON-TABLE ?auto_165913 ) ( ON ?auto_165910 ?auto_165913 ) ( ON ?auto_165912 ?auto_165910 ) ( ON ?auto_165909 ?auto_165912 ) ( ON ?auto_165911 ?auto_165909 ) ( not ( = ?auto_165913 ?auto_165910 ) ) ( not ( = ?auto_165913 ?auto_165912 ) ) ( not ( = ?auto_165913 ?auto_165909 ) ) ( not ( = ?auto_165913 ?auto_165911 ) ) ( not ( = ?auto_165913 ?auto_165908 ) ) ( not ( = ?auto_165913 ?auto_165907 ) ) ( not ( = ?auto_165910 ?auto_165912 ) ) ( not ( = ?auto_165910 ?auto_165909 ) ) ( not ( = ?auto_165910 ?auto_165911 ) ) ( not ( = ?auto_165910 ?auto_165908 ) ) ( not ( = ?auto_165910 ?auto_165907 ) ) ( not ( = ?auto_165912 ?auto_165909 ) ) ( not ( = ?auto_165912 ?auto_165911 ) ) ( not ( = ?auto_165912 ?auto_165908 ) ) ( not ( = ?auto_165912 ?auto_165907 ) ) ( not ( = ?auto_165909 ?auto_165911 ) ) ( not ( = ?auto_165909 ?auto_165908 ) ) ( not ( = ?auto_165909 ?auto_165907 ) ) ( not ( = ?auto_165905 ?auto_165913 ) ) ( not ( = ?auto_165905 ?auto_165910 ) ) ( not ( = ?auto_165905 ?auto_165912 ) ) ( not ( = ?auto_165905 ?auto_165909 ) ) ( not ( = ?auto_165906 ?auto_165913 ) ) ( not ( = ?auto_165906 ?auto_165910 ) ) ( not ( = ?auto_165906 ?auto_165912 ) ) ( not ( = ?auto_165906 ?auto_165909 ) ) ( CLEAR ?auto_165905 ) ( ON ?auto_165906 ?auto_165907 ) ( CLEAR ?auto_165906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_165913 ?auto_165910 ?auto_165912 ?auto_165909 ?auto_165911 ?auto_165908 ?auto_165907 )
      ( MAKE-4PILE ?auto_165905 ?auto_165906 ?auto_165907 ?auto_165908 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_165914 - BLOCK
      ?auto_165915 - BLOCK
      ?auto_165916 - BLOCK
      ?auto_165917 - BLOCK
    )
    :vars
    (
      ?auto_165919 - BLOCK
      ?auto_165922 - BLOCK
      ?auto_165920 - BLOCK
      ?auto_165918 - BLOCK
      ?auto_165921 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165914 ?auto_165915 ) ) ( not ( = ?auto_165914 ?auto_165916 ) ) ( not ( = ?auto_165914 ?auto_165917 ) ) ( not ( = ?auto_165915 ?auto_165916 ) ) ( not ( = ?auto_165915 ?auto_165917 ) ) ( not ( = ?auto_165916 ?auto_165917 ) ) ( ON ?auto_165917 ?auto_165919 ) ( not ( = ?auto_165914 ?auto_165919 ) ) ( not ( = ?auto_165915 ?auto_165919 ) ) ( not ( = ?auto_165916 ?auto_165919 ) ) ( not ( = ?auto_165917 ?auto_165919 ) ) ( ON ?auto_165916 ?auto_165917 ) ( ON-TABLE ?auto_165922 ) ( ON ?auto_165920 ?auto_165922 ) ( ON ?auto_165918 ?auto_165920 ) ( ON ?auto_165921 ?auto_165918 ) ( ON ?auto_165919 ?auto_165921 ) ( not ( = ?auto_165922 ?auto_165920 ) ) ( not ( = ?auto_165922 ?auto_165918 ) ) ( not ( = ?auto_165922 ?auto_165921 ) ) ( not ( = ?auto_165922 ?auto_165919 ) ) ( not ( = ?auto_165922 ?auto_165917 ) ) ( not ( = ?auto_165922 ?auto_165916 ) ) ( not ( = ?auto_165920 ?auto_165918 ) ) ( not ( = ?auto_165920 ?auto_165921 ) ) ( not ( = ?auto_165920 ?auto_165919 ) ) ( not ( = ?auto_165920 ?auto_165917 ) ) ( not ( = ?auto_165920 ?auto_165916 ) ) ( not ( = ?auto_165918 ?auto_165921 ) ) ( not ( = ?auto_165918 ?auto_165919 ) ) ( not ( = ?auto_165918 ?auto_165917 ) ) ( not ( = ?auto_165918 ?auto_165916 ) ) ( not ( = ?auto_165921 ?auto_165919 ) ) ( not ( = ?auto_165921 ?auto_165917 ) ) ( not ( = ?auto_165921 ?auto_165916 ) ) ( not ( = ?auto_165914 ?auto_165922 ) ) ( not ( = ?auto_165914 ?auto_165920 ) ) ( not ( = ?auto_165914 ?auto_165918 ) ) ( not ( = ?auto_165914 ?auto_165921 ) ) ( not ( = ?auto_165915 ?auto_165922 ) ) ( not ( = ?auto_165915 ?auto_165920 ) ) ( not ( = ?auto_165915 ?auto_165918 ) ) ( not ( = ?auto_165915 ?auto_165921 ) ) ( ON ?auto_165915 ?auto_165916 ) ( CLEAR ?auto_165915 ) ( HOLDING ?auto_165914 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_165914 )
      ( MAKE-4PILE ?auto_165914 ?auto_165915 ?auto_165916 ?auto_165917 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_165923 - BLOCK
      ?auto_165924 - BLOCK
      ?auto_165925 - BLOCK
      ?auto_165926 - BLOCK
    )
    :vars
    (
      ?auto_165927 - BLOCK
      ?auto_165929 - BLOCK
      ?auto_165928 - BLOCK
      ?auto_165931 - BLOCK
      ?auto_165930 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165923 ?auto_165924 ) ) ( not ( = ?auto_165923 ?auto_165925 ) ) ( not ( = ?auto_165923 ?auto_165926 ) ) ( not ( = ?auto_165924 ?auto_165925 ) ) ( not ( = ?auto_165924 ?auto_165926 ) ) ( not ( = ?auto_165925 ?auto_165926 ) ) ( ON ?auto_165926 ?auto_165927 ) ( not ( = ?auto_165923 ?auto_165927 ) ) ( not ( = ?auto_165924 ?auto_165927 ) ) ( not ( = ?auto_165925 ?auto_165927 ) ) ( not ( = ?auto_165926 ?auto_165927 ) ) ( ON ?auto_165925 ?auto_165926 ) ( ON-TABLE ?auto_165929 ) ( ON ?auto_165928 ?auto_165929 ) ( ON ?auto_165931 ?auto_165928 ) ( ON ?auto_165930 ?auto_165931 ) ( ON ?auto_165927 ?auto_165930 ) ( not ( = ?auto_165929 ?auto_165928 ) ) ( not ( = ?auto_165929 ?auto_165931 ) ) ( not ( = ?auto_165929 ?auto_165930 ) ) ( not ( = ?auto_165929 ?auto_165927 ) ) ( not ( = ?auto_165929 ?auto_165926 ) ) ( not ( = ?auto_165929 ?auto_165925 ) ) ( not ( = ?auto_165928 ?auto_165931 ) ) ( not ( = ?auto_165928 ?auto_165930 ) ) ( not ( = ?auto_165928 ?auto_165927 ) ) ( not ( = ?auto_165928 ?auto_165926 ) ) ( not ( = ?auto_165928 ?auto_165925 ) ) ( not ( = ?auto_165931 ?auto_165930 ) ) ( not ( = ?auto_165931 ?auto_165927 ) ) ( not ( = ?auto_165931 ?auto_165926 ) ) ( not ( = ?auto_165931 ?auto_165925 ) ) ( not ( = ?auto_165930 ?auto_165927 ) ) ( not ( = ?auto_165930 ?auto_165926 ) ) ( not ( = ?auto_165930 ?auto_165925 ) ) ( not ( = ?auto_165923 ?auto_165929 ) ) ( not ( = ?auto_165923 ?auto_165928 ) ) ( not ( = ?auto_165923 ?auto_165931 ) ) ( not ( = ?auto_165923 ?auto_165930 ) ) ( not ( = ?auto_165924 ?auto_165929 ) ) ( not ( = ?auto_165924 ?auto_165928 ) ) ( not ( = ?auto_165924 ?auto_165931 ) ) ( not ( = ?auto_165924 ?auto_165930 ) ) ( ON ?auto_165924 ?auto_165925 ) ( ON ?auto_165923 ?auto_165924 ) ( CLEAR ?auto_165923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_165929 ?auto_165928 ?auto_165931 ?auto_165930 ?auto_165927 ?auto_165926 ?auto_165925 ?auto_165924 )
      ( MAKE-4PILE ?auto_165923 ?auto_165924 ?auto_165925 ?auto_165926 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_165936 - BLOCK
      ?auto_165937 - BLOCK
      ?auto_165938 - BLOCK
      ?auto_165939 - BLOCK
    )
    :vars
    (
      ?auto_165940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165940 ?auto_165939 ) ( CLEAR ?auto_165940 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_165936 ) ( ON ?auto_165937 ?auto_165936 ) ( ON ?auto_165938 ?auto_165937 ) ( ON ?auto_165939 ?auto_165938 ) ( not ( = ?auto_165936 ?auto_165937 ) ) ( not ( = ?auto_165936 ?auto_165938 ) ) ( not ( = ?auto_165936 ?auto_165939 ) ) ( not ( = ?auto_165936 ?auto_165940 ) ) ( not ( = ?auto_165937 ?auto_165938 ) ) ( not ( = ?auto_165937 ?auto_165939 ) ) ( not ( = ?auto_165937 ?auto_165940 ) ) ( not ( = ?auto_165938 ?auto_165939 ) ) ( not ( = ?auto_165938 ?auto_165940 ) ) ( not ( = ?auto_165939 ?auto_165940 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_165940 ?auto_165939 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_165941 - BLOCK
      ?auto_165942 - BLOCK
      ?auto_165943 - BLOCK
      ?auto_165944 - BLOCK
    )
    :vars
    (
      ?auto_165945 - BLOCK
      ?auto_165946 - BLOCK
      ?auto_165947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165945 ?auto_165944 ) ( CLEAR ?auto_165945 ) ( ON-TABLE ?auto_165941 ) ( ON ?auto_165942 ?auto_165941 ) ( ON ?auto_165943 ?auto_165942 ) ( ON ?auto_165944 ?auto_165943 ) ( not ( = ?auto_165941 ?auto_165942 ) ) ( not ( = ?auto_165941 ?auto_165943 ) ) ( not ( = ?auto_165941 ?auto_165944 ) ) ( not ( = ?auto_165941 ?auto_165945 ) ) ( not ( = ?auto_165942 ?auto_165943 ) ) ( not ( = ?auto_165942 ?auto_165944 ) ) ( not ( = ?auto_165942 ?auto_165945 ) ) ( not ( = ?auto_165943 ?auto_165944 ) ) ( not ( = ?auto_165943 ?auto_165945 ) ) ( not ( = ?auto_165944 ?auto_165945 ) ) ( HOLDING ?auto_165946 ) ( CLEAR ?auto_165947 ) ( not ( = ?auto_165941 ?auto_165946 ) ) ( not ( = ?auto_165941 ?auto_165947 ) ) ( not ( = ?auto_165942 ?auto_165946 ) ) ( not ( = ?auto_165942 ?auto_165947 ) ) ( not ( = ?auto_165943 ?auto_165946 ) ) ( not ( = ?auto_165943 ?auto_165947 ) ) ( not ( = ?auto_165944 ?auto_165946 ) ) ( not ( = ?auto_165944 ?auto_165947 ) ) ( not ( = ?auto_165945 ?auto_165946 ) ) ( not ( = ?auto_165945 ?auto_165947 ) ) ( not ( = ?auto_165946 ?auto_165947 ) ) )
    :subtasks
    ( ( !STACK ?auto_165946 ?auto_165947 )
      ( MAKE-4PILE ?auto_165941 ?auto_165942 ?auto_165943 ?auto_165944 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_165948 - BLOCK
      ?auto_165949 - BLOCK
      ?auto_165950 - BLOCK
      ?auto_165951 - BLOCK
    )
    :vars
    (
      ?auto_165952 - BLOCK
      ?auto_165954 - BLOCK
      ?auto_165953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165952 ?auto_165951 ) ( ON-TABLE ?auto_165948 ) ( ON ?auto_165949 ?auto_165948 ) ( ON ?auto_165950 ?auto_165949 ) ( ON ?auto_165951 ?auto_165950 ) ( not ( = ?auto_165948 ?auto_165949 ) ) ( not ( = ?auto_165948 ?auto_165950 ) ) ( not ( = ?auto_165948 ?auto_165951 ) ) ( not ( = ?auto_165948 ?auto_165952 ) ) ( not ( = ?auto_165949 ?auto_165950 ) ) ( not ( = ?auto_165949 ?auto_165951 ) ) ( not ( = ?auto_165949 ?auto_165952 ) ) ( not ( = ?auto_165950 ?auto_165951 ) ) ( not ( = ?auto_165950 ?auto_165952 ) ) ( not ( = ?auto_165951 ?auto_165952 ) ) ( CLEAR ?auto_165954 ) ( not ( = ?auto_165948 ?auto_165953 ) ) ( not ( = ?auto_165948 ?auto_165954 ) ) ( not ( = ?auto_165949 ?auto_165953 ) ) ( not ( = ?auto_165949 ?auto_165954 ) ) ( not ( = ?auto_165950 ?auto_165953 ) ) ( not ( = ?auto_165950 ?auto_165954 ) ) ( not ( = ?auto_165951 ?auto_165953 ) ) ( not ( = ?auto_165951 ?auto_165954 ) ) ( not ( = ?auto_165952 ?auto_165953 ) ) ( not ( = ?auto_165952 ?auto_165954 ) ) ( not ( = ?auto_165953 ?auto_165954 ) ) ( ON ?auto_165953 ?auto_165952 ) ( CLEAR ?auto_165953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_165948 ?auto_165949 ?auto_165950 ?auto_165951 ?auto_165952 )
      ( MAKE-4PILE ?auto_165948 ?auto_165949 ?auto_165950 ?auto_165951 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_165955 - BLOCK
      ?auto_165956 - BLOCK
      ?auto_165957 - BLOCK
      ?auto_165958 - BLOCK
    )
    :vars
    (
      ?auto_165959 - BLOCK
      ?auto_165961 - BLOCK
      ?auto_165960 - BLOCK
      ?auto_165962 - BLOCK
      ?auto_165963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165959 ?auto_165958 ) ( ON-TABLE ?auto_165955 ) ( ON ?auto_165956 ?auto_165955 ) ( ON ?auto_165957 ?auto_165956 ) ( ON ?auto_165958 ?auto_165957 ) ( not ( = ?auto_165955 ?auto_165956 ) ) ( not ( = ?auto_165955 ?auto_165957 ) ) ( not ( = ?auto_165955 ?auto_165958 ) ) ( not ( = ?auto_165955 ?auto_165959 ) ) ( not ( = ?auto_165956 ?auto_165957 ) ) ( not ( = ?auto_165956 ?auto_165958 ) ) ( not ( = ?auto_165956 ?auto_165959 ) ) ( not ( = ?auto_165957 ?auto_165958 ) ) ( not ( = ?auto_165957 ?auto_165959 ) ) ( not ( = ?auto_165958 ?auto_165959 ) ) ( not ( = ?auto_165955 ?auto_165961 ) ) ( not ( = ?auto_165955 ?auto_165960 ) ) ( not ( = ?auto_165956 ?auto_165961 ) ) ( not ( = ?auto_165956 ?auto_165960 ) ) ( not ( = ?auto_165957 ?auto_165961 ) ) ( not ( = ?auto_165957 ?auto_165960 ) ) ( not ( = ?auto_165958 ?auto_165961 ) ) ( not ( = ?auto_165958 ?auto_165960 ) ) ( not ( = ?auto_165959 ?auto_165961 ) ) ( not ( = ?auto_165959 ?auto_165960 ) ) ( not ( = ?auto_165961 ?auto_165960 ) ) ( ON ?auto_165961 ?auto_165959 ) ( CLEAR ?auto_165961 ) ( HOLDING ?auto_165960 ) ( CLEAR ?auto_165962 ) ( ON-TABLE ?auto_165963 ) ( ON ?auto_165962 ?auto_165963 ) ( not ( = ?auto_165963 ?auto_165962 ) ) ( not ( = ?auto_165963 ?auto_165960 ) ) ( not ( = ?auto_165962 ?auto_165960 ) ) ( not ( = ?auto_165955 ?auto_165962 ) ) ( not ( = ?auto_165955 ?auto_165963 ) ) ( not ( = ?auto_165956 ?auto_165962 ) ) ( not ( = ?auto_165956 ?auto_165963 ) ) ( not ( = ?auto_165957 ?auto_165962 ) ) ( not ( = ?auto_165957 ?auto_165963 ) ) ( not ( = ?auto_165958 ?auto_165962 ) ) ( not ( = ?auto_165958 ?auto_165963 ) ) ( not ( = ?auto_165959 ?auto_165962 ) ) ( not ( = ?auto_165959 ?auto_165963 ) ) ( not ( = ?auto_165961 ?auto_165962 ) ) ( not ( = ?auto_165961 ?auto_165963 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_165963 ?auto_165962 ?auto_165960 )
      ( MAKE-4PILE ?auto_165955 ?auto_165956 ?auto_165957 ?auto_165958 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_165964 - BLOCK
      ?auto_165965 - BLOCK
      ?auto_165966 - BLOCK
      ?auto_165967 - BLOCK
    )
    :vars
    (
      ?auto_165971 - BLOCK
      ?auto_165972 - BLOCK
      ?auto_165970 - BLOCK
      ?auto_165968 - BLOCK
      ?auto_165969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165971 ?auto_165967 ) ( ON-TABLE ?auto_165964 ) ( ON ?auto_165965 ?auto_165964 ) ( ON ?auto_165966 ?auto_165965 ) ( ON ?auto_165967 ?auto_165966 ) ( not ( = ?auto_165964 ?auto_165965 ) ) ( not ( = ?auto_165964 ?auto_165966 ) ) ( not ( = ?auto_165964 ?auto_165967 ) ) ( not ( = ?auto_165964 ?auto_165971 ) ) ( not ( = ?auto_165965 ?auto_165966 ) ) ( not ( = ?auto_165965 ?auto_165967 ) ) ( not ( = ?auto_165965 ?auto_165971 ) ) ( not ( = ?auto_165966 ?auto_165967 ) ) ( not ( = ?auto_165966 ?auto_165971 ) ) ( not ( = ?auto_165967 ?auto_165971 ) ) ( not ( = ?auto_165964 ?auto_165972 ) ) ( not ( = ?auto_165964 ?auto_165970 ) ) ( not ( = ?auto_165965 ?auto_165972 ) ) ( not ( = ?auto_165965 ?auto_165970 ) ) ( not ( = ?auto_165966 ?auto_165972 ) ) ( not ( = ?auto_165966 ?auto_165970 ) ) ( not ( = ?auto_165967 ?auto_165972 ) ) ( not ( = ?auto_165967 ?auto_165970 ) ) ( not ( = ?auto_165971 ?auto_165972 ) ) ( not ( = ?auto_165971 ?auto_165970 ) ) ( not ( = ?auto_165972 ?auto_165970 ) ) ( ON ?auto_165972 ?auto_165971 ) ( CLEAR ?auto_165968 ) ( ON-TABLE ?auto_165969 ) ( ON ?auto_165968 ?auto_165969 ) ( not ( = ?auto_165969 ?auto_165968 ) ) ( not ( = ?auto_165969 ?auto_165970 ) ) ( not ( = ?auto_165968 ?auto_165970 ) ) ( not ( = ?auto_165964 ?auto_165968 ) ) ( not ( = ?auto_165964 ?auto_165969 ) ) ( not ( = ?auto_165965 ?auto_165968 ) ) ( not ( = ?auto_165965 ?auto_165969 ) ) ( not ( = ?auto_165966 ?auto_165968 ) ) ( not ( = ?auto_165966 ?auto_165969 ) ) ( not ( = ?auto_165967 ?auto_165968 ) ) ( not ( = ?auto_165967 ?auto_165969 ) ) ( not ( = ?auto_165971 ?auto_165968 ) ) ( not ( = ?auto_165971 ?auto_165969 ) ) ( not ( = ?auto_165972 ?auto_165968 ) ) ( not ( = ?auto_165972 ?auto_165969 ) ) ( ON ?auto_165970 ?auto_165972 ) ( CLEAR ?auto_165970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_165964 ?auto_165965 ?auto_165966 ?auto_165967 ?auto_165971 ?auto_165972 )
      ( MAKE-4PILE ?auto_165964 ?auto_165965 ?auto_165966 ?auto_165967 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_165973 - BLOCK
      ?auto_165974 - BLOCK
      ?auto_165975 - BLOCK
      ?auto_165976 - BLOCK
    )
    :vars
    (
      ?auto_165980 - BLOCK
      ?auto_165977 - BLOCK
      ?auto_165981 - BLOCK
      ?auto_165979 - BLOCK
      ?auto_165978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165980 ?auto_165976 ) ( ON-TABLE ?auto_165973 ) ( ON ?auto_165974 ?auto_165973 ) ( ON ?auto_165975 ?auto_165974 ) ( ON ?auto_165976 ?auto_165975 ) ( not ( = ?auto_165973 ?auto_165974 ) ) ( not ( = ?auto_165973 ?auto_165975 ) ) ( not ( = ?auto_165973 ?auto_165976 ) ) ( not ( = ?auto_165973 ?auto_165980 ) ) ( not ( = ?auto_165974 ?auto_165975 ) ) ( not ( = ?auto_165974 ?auto_165976 ) ) ( not ( = ?auto_165974 ?auto_165980 ) ) ( not ( = ?auto_165975 ?auto_165976 ) ) ( not ( = ?auto_165975 ?auto_165980 ) ) ( not ( = ?auto_165976 ?auto_165980 ) ) ( not ( = ?auto_165973 ?auto_165977 ) ) ( not ( = ?auto_165973 ?auto_165981 ) ) ( not ( = ?auto_165974 ?auto_165977 ) ) ( not ( = ?auto_165974 ?auto_165981 ) ) ( not ( = ?auto_165975 ?auto_165977 ) ) ( not ( = ?auto_165975 ?auto_165981 ) ) ( not ( = ?auto_165976 ?auto_165977 ) ) ( not ( = ?auto_165976 ?auto_165981 ) ) ( not ( = ?auto_165980 ?auto_165977 ) ) ( not ( = ?auto_165980 ?auto_165981 ) ) ( not ( = ?auto_165977 ?auto_165981 ) ) ( ON ?auto_165977 ?auto_165980 ) ( ON-TABLE ?auto_165979 ) ( not ( = ?auto_165979 ?auto_165978 ) ) ( not ( = ?auto_165979 ?auto_165981 ) ) ( not ( = ?auto_165978 ?auto_165981 ) ) ( not ( = ?auto_165973 ?auto_165978 ) ) ( not ( = ?auto_165973 ?auto_165979 ) ) ( not ( = ?auto_165974 ?auto_165978 ) ) ( not ( = ?auto_165974 ?auto_165979 ) ) ( not ( = ?auto_165975 ?auto_165978 ) ) ( not ( = ?auto_165975 ?auto_165979 ) ) ( not ( = ?auto_165976 ?auto_165978 ) ) ( not ( = ?auto_165976 ?auto_165979 ) ) ( not ( = ?auto_165980 ?auto_165978 ) ) ( not ( = ?auto_165980 ?auto_165979 ) ) ( not ( = ?auto_165977 ?auto_165978 ) ) ( not ( = ?auto_165977 ?auto_165979 ) ) ( ON ?auto_165981 ?auto_165977 ) ( CLEAR ?auto_165981 ) ( HOLDING ?auto_165978 ) ( CLEAR ?auto_165979 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_165979 ?auto_165978 )
      ( MAKE-4PILE ?auto_165973 ?auto_165974 ?auto_165975 ?auto_165976 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_167675 - BLOCK
      ?auto_167676 - BLOCK
      ?auto_167677 - BLOCK
      ?auto_167678 - BLOCK
    )
    :vars
    (
      ?auto_167679 - BLOCK
      ?auto_167680 - BLOCK
      ?auto_167682 - BLOCK
      ?auto_167681 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167679 ?auto_167678 ) ( ON-TABLE ?auto_167675 ) ( ON ?auto_167676 ?auto_167675 ) ( ON ?auto_167677 ?auto_167676 ) ( ON ?auto_167678 ?auto_167677 ) ( not ( = ?auto_167675 ?auto_167676 ) ) ( not ( = ?auto_167675 ?auto_167677 ) ) ( not ( = ?auto_167675 ?auto_167678 ) ) ( not ( = ?auto_167675 ?auto_167679 ) ) ( not ( = ?auto_167676 ?auto_167677 ) ) ( not ( = ?auto_167676 ?auto_167678 ) ) ( not ( = ?auto_167676 ?auto_167679 ) ) ( not ( = ?auto_167677 ?auto_167678 ) ) ( not ( = ?auto_167677 ?auto_167679 ) ) ( not ( = ?auto_167678 ?auto_167679 ) ) ( not ( = ?auto_167675 ?auto_167680 ) ) ( not ( = ?auto_167675 ?auto_167682 ) ) ( not ( = ?auto_167676 ?auto_167680 ) ) ( not ( = ?auto_167676 ?auto_167682 ) ) ( not ( = ?auto_167677 ?auto_167680 ) ) ( not ( = ?auto_167677 ?auto_167682 ) ) ( not ( = ?auto_167678 ?auto_167680 ) ) ( not ( = ?auto_167678 ?auto_167682 ) ) ( not ( = ?auto_167679 ?auto_167680 ) ) ( not ( = ?auto_167679 ?auto_167682 ) ) ( not ( = ?auto_167680 ?auto_167682 ) ) ( ON ?auto_167680 ?auto_167679 ) ( not ( = ?auto_167681 ?auto_167682 ) ) ( not ( = ?auto_167675 ?auto_167681 ) ) ( not ( = ?auto_167676 ?auto_167681 ) ) ( not ( = ?auto_167677 ?auto_167681 ) ) ( not ( = ?auto_167678 ?auto_167681 ) ) ( not ( = ?auto_167679 ?auto_167681 ) ) ( not ( = ?auto_167680 ?auto_167681 ) ) ( ON ?auto_167682 ?auto_167680 ) ( ON ?auto_167681 ?auto_167682 ) ( CLEAR ?auto_167681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_167675 ?auto_167676 ?auto_167677 ?auto_167678 ?auto_167679 ?auto_167680 ?auto_167682 )
      ( MAKE-4PILE ?auto_167675 ?auto_167676 ?auto_167677 ?auto_167678 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_165991 - BLOCK
      ?auto_165992 - BLOCK
      ?auto_165993 - BLOCK
      ?auto_165994 - BLOCK
    )
    :vars
    (
      ?auto_165998 - BLOCK
      ?auto_165996 - BLOCK
      ?auto_165995 - BLOCK
      ?auto_165997 - BLOCK
      ?auto_165999 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165998 ?auto_165994 ) ( ON-TABLE ?auto_165991 ) ( ON ?auto_165992 ?auto_165991 ) ( ON ?auto_165993 ?auto_165992 ) ( ON ?auto_165994 ?auto_165993 ) ( not ( = ?auto_165991 ?auto_165992 ) ) ( not ( = ?auto_165991 ?auto_165993 ) ) ( not ( = ?auto_165991 ?auto_165994 ) ) ( not ( = ?auto_165991 ?auto_165998 ) ) ( not ( = ?auto_165992 ?auto_165993 ) ) ( not ( = ?auto_165992 ?auto_165994 ) ) ( not ( = ?auto_165992 ?auto_165998 ) ) ( not ( = ?auto_165993 ?auto_165994 ) ) ( not ( = ?auto_165993 ?auto_165998 ) ) ( not ( = ?auto_165994 ?auto_165998 ) ) ( not ( = ?auto_165991 ?auto_165996 ) ) ( not ( = ?auto_165991 ?auto_165995 ) ) ( not ( = ?auto_165992 ?auto_165996 ) ) ( not ( = ?auto_165992 ?auto_165995 ) ) ( not ( = ?auto_165993 ?auto_165996 ) ) ( not ( = ?auto_165993 ?auto_165995 ) ) ( not ( = ?auto_165994 ?auto_165996 ) ) ( not ( = ?auto_165994 ?auto_165995 ) ) ( not ( = ?auto_165998 ?auto_165996 ) ) ( not ( = ?auto_165998 ?auto_165995 ) ) ( not ( = ?auto_165996 ?auto_165995 ) ) ( ON ?auto_165996 ?auto_165998 ) ( not ( = ?auto_165997 ?auto_165999 ) ) ( not ( = ?auto_165997 ?auto_165995 ) ) ( not ( = ?auto_165999 ?auto_165995 ) ) ( not ( = ?auto_165991 ?auto_165999 ) ) ( not ( = ?auto_165991 ?auto_165997 ) ) ( not ( = ?auto_165992 ?auto_165999 ) ) ( not ( = ?auto_165992 ?auto_165997 ) ) ( not ( = ?auto_165993 ?auto_165999 ) ) ( not ( = ?auto_165993 ?auto_165997 ) ) ( not ( = ?auto_165994 ?auto_165999 ) ) ( not ( = ?auto_165994 ?auto_165997 ) ) ( not ( = ?auto_165998 ?auto_165999 ) ) ( not ( = ?auto_165998 ?auto_165997 ) ) ( not ( = ?auto_165996 ?auto_165999 ) ) ( not ( = ?auto_165996 ?auto_165997 ) ) ( ON ?auto_165995 ?auto_165996 ) ( ON ?auto_165999 ?auto_165995 ) ( CLEAR ?auto_165999 ) ( HOLDING ?auto_165997 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_165997 )
      ( MAKE-4PILE ?auto_165991 ?auto_165992 ?auto_165993 ?auto_165994 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_166000 - BLOCK
      ?auto_166001 - BLOCK
      ?auto_166002 - BLOCK
      ?auto_166003 - BLOCK
    )
    :vars
    (
      ?auto_166006 - BLOCK
      ?auto_166005 - BLOCK
      ?auto_166007 - BLOCK
      ?auto_166008 - BLOCK
      ?auto_166004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166006 ?auto_166003 ) ( ON-TABLE ?auto_166000 ) ( ON ?auto_166001 ?auto_166000 ) ( ON ?auto_166002 ?auto_166001 ) ( ON ?auto_166003 ?auto_166002 ) ( not ( = ?auto_166000 ?auto_166001 ) ) ( not ( = ?auto_166000 ?auto_166002 ) ) ( not ( = ?auto_166000 ?auto_166003 ) ) ( not ( = ?auto_166000 ?auto_166006 ) ) ( not ( = ?auto_166001 ?auto_166002 ) ) ( not ( = ?auto_166001 ?auto_166003 ) ) ( not ( = ?auto_166001 ?auto_166006 ) ) ( not ( = ?auto_166002 ?auto_166003 ) ) ( not ( = ?auto_166002 ?auto_166006 ) ) ( not ( = ?auto_166003 ?auto_166006 ) ) ( not ( = ?auto_166000 ?auto_166005 ) ) ( not ( = ?auto_166000 ?auto_166007 ) ) ( not ( = ?auto_166001 ?auto_166005 ) ) ( not ( = ?auto_166001 ?auto_166007 ) ) ( not ( = ?auto_166002 ?auto_166005 ) ) ( not ( = ?auto_166002 ?auto_166007 ) ) ( not ( = ?auto_166003 ?auto_166005 ) ) ( not ( = ?auto_166003 ?auto_166007 ) ) ( not ( = ?auto_166006 ?auto_166005 ) ) ( not ( = ?auto_166006 ?auto_166007 ) ) ( not ( = ?auto_166005 ?auto_166007 ) ) ( ON ?auto_166005 ?auto_166006 ) ( not ( = ?auto_166008 ?auto_166004 ) ) ( not ( = ?auto_166008 ?auto_166007 ) ) ( not ( = ?auto_166004 ?auto_166007 ) ) ( not ( = ?auto_166000 ?auto_166004 ) ) ( not ( = ?auto_166000 ?auto_166008 ) ) ( not ( = ?auto_166001 ?auto_166004 ) ) ( not ( = ?auto_166001 ?auto_166008 ) ) ( not ( = ?auto_166002 ?auto_166004 ) ) ( not ( = ?auto_166002 ?auto_166008 ) ) ( not ( = ?auto_166003 ?auto_166004 ) ) ( not ( = ?auto_166003 ?auto_166008 ) ) ( not ( = ?auto_166006 ?auto_166004 ) ) ( not ( = ?auto_166006 ?auto_166008 ) ) ( not ( = ?auto_166005 ?auto_166004 ) ) ( not ( = ?auto_166005 ?auto_166008 ) ) ( ON ?auto_166007 ?auto_166005 ) ( ON ?auto_166004 ?auto_166007 ) ( ON ?auto_166008 ?auto_166004 ) ( CLEAR ?auto_166008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_166000 ?auto_166001 ?auto_166002 ?auto_166003 ?auto_166006 ?auto_166005 ?auto_166007 ?auto_166004 )
      ( MAKE-4PILE ?auto_166000 ?auto_166001 ?auto_166002 ?auto_166003 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_166014 - BLOCK
      ?auto_166015 - BLOCK
      ?auto_166016 - BLOCK
      ?auto_166017 - BLOCK
      ?auto_166018 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_166018 ) ( CLEAR ?auto_166017 ) ( ON-TABLE ?auto_166014 ) ( ON ?auto_166015 ?auto_166014 ) ( ON ?auto_166016 ?auto_166015 ) ( ON ?auto_166017 ?auto_166016 ) ( not ( = ?auto_166014 ?auto_166015 ) ) ( not ( = ?auto_166014 ?auto_166016 ) ) ( not ( = ?auto_166014 ?auto_166017 ) ) ( not ( = ?auto_166014 ?auto_166018 ) ) ( not ( = ?auto_166015 ?auto_166016 ) ) ( not ( = ?auto_166015 ?auto_166017 ) ) ( not ( = ?auto_166015 ?auto_166018 ) ) ( not ( = ?auto_166016 ?auto_166017 ) ) ( not ( = ?auto_166016 ?auto_166018 ) ) ( not ( = ?auto_166017 ?auto_166018 ) ) )
    :subtasks
    ( ( !STACK ?auto_166018 ?auto_166017 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_166019 - BLOCK
      ?auto_166020 - BLOCK
      ?auto_166021 - BLOCK
      ?auto_166022 - BLOCK
      ?auto_166023 - BLOCK
    )
    :vars
    (
      ?auto_166024 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_166022 ) ( ON-TABLE ?auto_166019 ) ( ON ?auto_166020 ?auto_166019 ) ( ON ?auto_166021 ?auto_166020 ) ( ON ?auto_166022 ?auto_166021 ) ( not ( = ?auto_166019 ?auto_166020 ) ) ( not ( = ?auto_166019 ?auto_166021 ) ) ( not ( = ?auto_166019 ?auto_166022 ) ) ( not ( = ?auto_166019 ?auto_166023 ) ) ( not ( = ?auto_166020 ?auto_166021 ) ) ( not ( = ?auto_166020 ?auto_166022 ) ) ( not ( = ?auto_166020 ?auto_166023 ) ) ( not ( = ?auto_166021 ?auto_166022 ) ) ( not ( = ?auto_166021 ?auto_166023 ) ) ( not ( = ?auto_166022 ?auto_166023 ) ) ( ON ?auto_166023 ?auto_166024 ) ( CLEAR ?auto_166023 ) ( HAND-EMPTY ) ( not ( = ?auto_166019 ?auto_166024 ) ) ( not ( = ?auto_166020 ?auto_166024 ) ) ( not ( = ?auto_166021 ?auto_166024 ) ) ( not ( = ?auto_166022 ?auto_166024 ) ) ( not ( = ?auto_166023 ?auto_166024 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166023 ?auto_166024 )
      ( MAKE-5PILE ?auto_166019 ?auto_166020 ?auto_166021 ?auto_166022 ?auto_166023 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_166025 - BLOCK
      ?auto_166026 - BLOCK
      ?auto_166027 - BLOCK
      ?auto_166028 - BLOCK
      ?auto_166029 - BLOCK
    )
    :vars
    (
      ?auto_166030 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166025 ) ( ON ?auto_166026 ?auto_166025 ) ( ON ?auto_166027 ?auto_166026 ) ( not ( = ?auto_166025 ?auto_166026 ) ) ( not ( = ?auto_166025 ?auto_166027 ) ) ( not ( = ?auto_166025 ?auto_166028 ) ) ( not ( = ?auto_166025 ?auto_166029 ) ) ( not ( = ?auto_166026 ?auto_166027 ) ) ( not ( = ?auto_166026 ?auto_166028 ) ) ( not ( = ?auto_166026 ?auto_166029 ) ) ( not ( = ?auto_166027 ?auto_166028 ) ) ( not ( = ?auto_166027 ?auto_166029 ) ) ( not ( = ?auto_166028 ?auto_166029 ) ) ( ON ?auto_166029 ?auto_166030 ) ( CLEAR ?auto_166029 ) ( not ( = ?auto_166025 ?auto_166030 ) ) ( not ( = ?auto_166026 ?auto_166030 ) ) ( not ( = ?auto_166027 ?auto_166030 ) ) ( not ( = ?auto_166028 ?auto_166030 ) ) ( not ( = ?auto_166029 ?auto_166030 ) ) ( HOLDING ?auto_166028 ) ( CLEAR ?auto_166027 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_166025 ?auto_166026 ?auto_166027 ?auto_166028 )
      ( MAKE-5PILE ?auto_166025 ?auto_166026 ?auto_166027 ?auto_166028 ?auto_166029 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_166031 - BLOCK
      ?auto_166032 - BLOCK
      ?auto_166033 - BLOCK
      ?auto_166034 - BLOCK
      ?auto_166035 - BLOCK
    )
    :vars
    (
      ?auto_166036 - BLOCK
      ?auto_166039 - BLOCK
      ?auto_166038 - BLOCK
      ?auto_166037 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166031 ) ( ON ?auto_166032 ?auto_166031 ) ( ON ?auto_166033 ?auto_166032 ) ( not ( = ?auto_166031 ?auto_166032 ) ) ( not ( = ?auto_166031 ?auto_166033 ) ) ( not ( = ?auto_166031 ?auto_166034 ) ) ( not ( = ?auto_166031 ?auto_166035 ) ) ( not ( = ?auto_166032 ?auto_166033 ) ) ( not ( = ?auto_166032 ?auto_166034 ) ) ( not ( = ?auto_166032 ?auto_166035 ) ) ( not ( = ?auto_166033 ?auto_166034 ) ) ( not ( = ?auto_166033 ?auto_166035 ) ) ( not ( = ?auto_166034 ?auto_166035 ) ) ( ON ?auto_166035 ?auto_166036 ) ( not ( = ?auto_166031 ?auto_166036 ) ) ( not ( = ?auto_166032 ?auto_166036 ) ) ( not ( = ?auto_166033 ?auto_166036 ) ) ( not ( = ?auto_166034 ?auto_166036 ) ) ( not ( = ?auto_166035 ?auto_166036 ) ) ( CLEAR ?auto_166033 ) ( ON ?auto_166034 ?auto_166035 ) ( CLEAR ?auto_166034 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_166039 ) ( ON ?auto_166038 ?auto_166039 ) ( ON ?auto_166037 ?auto_166038 ) ( ON ?auto_166036 ?auto_166037 ) ( not ( = ?auto_166039 ?auto_166038 ) ) ( not ( = ?auto_166039 ?auto_166037 ) ) ( not ( = ?auto_166039 ?auto_166036 ) ) ( not ( = ?auto_166039 ?auto_166035 ) ) ( not ( = ?auto_166039 ?auto_166034 ) ) ( not ( = ?auto_166038 ?auto_166037 ) ) ( not ( = ?auto_166038 ?auto_166036 ) ) ( not ( = ?auto_166038 ?auto_166035 ) ) ( not ( = ?auto_166038 ?auto_166034 ) ) ( not ( = ?auto_166037 ?auto_166036 ) ) ( not ( = ?auto_166037 ?auto_166035 ) ) ( not ( = ?auto_166037 ?auto_166034 ) ) ( not ( = ?auto_166031 ?auto_166039 ) ) ( not ( = ?auto_166031 ?auto_166038 ) ) ( not ( = ?auto_166031 ?auto_166037 ) ) ( not ( = ?auto_166032 ?auto_166039 ) ) ( not ( = ?auto_166032 ?auto_166038 ) ) ( not ( = ?auto_166032 ?auto_166037 ) ) ( not ( = ?auto_166033 ?auto_166039 ) ) ( not ( = ?auto_166033 ?auto_166038 ) ) ( not ( = ?auto_166033 ?auto_166037 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_166039 ?auto_166038 ?auto_166037 ?auto_166036 ?auto_166035 )
      ( MAKE-5PILE ?auto_166031 ?auto_166032 ?auto_166033 ?auto_166034 ?auto_166035 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_166040 - BLOCK
      ?auto_166041 - BLOCK
      ?auto_166042 - BLOCK
      ?auto_166043 - BLOCK
      ?auto_166044 - BLOCK
    )
    :vars
    (
      ?auto_166045 - BLOCK
      ?auto_166048 - BLOCK
      ?auto_166046 - BLOCK
      ?auto_166047 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166040 ) ( ON ?auto_166041 ?auto_166040 ) ( not ( = ?auto_166040 ?auto_166041 ) ) ( not ( = ?auto_166040 ?auto_166042 ) ) ( not ( = ?auto_166040 ?auto_166043 ) ) ( not ( = ?auto_166040 ?auto_166044 ) ) ( not ( = ?auto_166041 ?auto_166042 ) ) ( not ( = ?auto_166041 ?auto_166043 ) ) ( not ( = ?auto_166041 ?auto_166044 ) ) ( not ( = ?auto_166042 ?auto_166043 ) ) ( not ( = ?auto_166042 ?auto_166044 ) ) ( not ( = ?auto_166043 ?auto_166044 ) ) ( ON ?auto_166044 ?auto_166045 ) ( not ( = ?auto_166040 ?auto_166045 ) ) ( not ( = ?auto_166041 ?auto_166045 ) ) ( not ( = ?auto_166042 ?auto_166045 ) ) ( not ( = ?auto_166043 ?auto_166045 ) ) ( not ( = ?auto_166044 ?auto_166045 ) ) ( ON ?auto_166043 ?auto_166044 ) ( CLEAR ?auto_166043 ) ( ON-TABLE ?auto_166048 ) ( ON ?auto_166046 ?auto_166048 ) ( ON ?auto_166047 ?auto_166046 ) ( ON ?auto_166045 ?auto_166047 ) ( not ( = ?auto_166048 ?auto_166046 ) ) ( not ( = ?auto_166048 ?auto_166047 ) ) ( not ( = ?auto_166048 ?auto_166045 ) ) ( not ( = ?auto_166048 ?auto_166044 ) ) ( not ( = ?auto_166048 ?auto_166043 ) ) ( not ( = ?auto_166046 ?auto_166047 ) ) ( not ( = ?auto_166046 ?auto_166045 ) ) ( not ( = ?auto_166046 ?auto_166044 ) ) ( not ( = ?auto_166046 ?auto_166043 ) ) ( not ( = ?auto_166047 ?auto_166045 ) ) ( not ( = ?auto_166047 ?auto_166044 ) ) ( not ( = ?auto_166047 ?auto_166043 ) ) ( not ( = ?auto_166040 ?auto_166048 ) ) ( not ( = ?auto_166040 ?auto_166046 ) ) ( not ( = ?auto_166040 ?auto_166047 ) ) ( not ( = ?auto_166041 ?auto_166048 ) ) ( not ( = ?auto_166041 ?auto_166046 ) ) ( not ( = ?auto_166041 ?auto_166047 ) ) ( not ( = ?auto_166042 ?auto_166048 ) ) ( not ( = ?auto_166042 ?auto_166046 ) ) ( not ( = ?auto_166042 ?auto_166047 ) ) ( HOLDING ?auto_166042 ) ( CLEAR ?auto_166041 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_166040 ?auto_166041 ?auto_166042 )
      ( MAKE-5PILE ?auto_166040 ?auto_166041 ?auto_166042 ?auto_166043 ?auto_166044 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_166049 - BLOCK
      ?auto_166050 - BLOCK
      ?auto_166051 - BLOCK
      ?auto_166052 - BLOCK
      ?auto_166053 - BLOCK
    )
    :vars
    (
      ?auto_166055 - BLOCK
      ?auto_166054 - BLOCK
      ?auto_166057 - BLOCK
      ?auto_166056 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166049 ) ( ON ?auto_166050 ?auto_166049 ) ( not ( = ?auto_166049 ?auto_166050 ) ) ( not ( = ?auto_166049 ?auto_166051 ) ) ( not ( = ?auto_166049 ?auto_166052 ) ) ( not ( = ?auto_166049 ?auto_166053 ) ) ( not ( = ?auto_166050 ?auto_166051 ) ) ( not ( = ?auto_166050 ?auto_166052 ) ) ( not ( = ?auto_166050 ?auto_166053 ) ) ( not ( = ?auto_166051 ?auto_166052 ) ) ( not ( = ?auto_166051 ?auto_166053 ) ) ( not ( = ?auto_166052 ?auto_166053 ) ) ( ON ?auto_166053 ?auto_166055 ) ( not ( = ?auto_166049 ?auto_166055 ) ) ( not ( = ?auto_166050 ?auto_166055 ) ) ( not ( = ?auto_166051 ?auto_166055 ) ) ( not ( = ?auto_166052 ?auto_166055 ) ) ( not ( = ?auto_166053 ?auto_166055 ) ) ( ON ?auto_166052 ?auto_166053 ) ( ON-TABLE ?auto_166054 ) ( ON ?auto_166057 ?auto_166054 ) ( ON ?auto_166056 ?auto_166057 ) ( ON ?auto_166055 ?auto_166056 ) ( not ( = ?auto_166054 ?auto_166057 ) ) ( not ( = ?auto_166054 ?auto_166056 ) ) ( not ( = ?auto_166054 ?auto_166055 ) ) ( not ( = ?auto_166054 ?auto_166053 ) ) ( not ( = ?auto_166054 ?auto_166052 ) ) ( not ( = ?auto_166057 ?auto_166056 ) ) ( not ( = ?auto_166057 ?auto_166055 ) ) ( not ( = ?auto_166057 ?auto_166053 ) ) ( not ( = ?auto_166057 ?auto_166052 ) ) ( not ( = ?auto_166056 ?auto_166055 ) ) ( not ( = ?auto_166056 ?auto_166053 ) ) ( not ( = ?auto_166056 ?auto_166052 ) ) ( not ( = ?auto_166049 ?auto_166054 ) ) ( not ( = ?auto_166049 ?auto_166057 ) ) ( not ( = ?auto_166049 ?auto_166056 ) ) ( not ( = ?auto_166050 ?auto_166054 ) ) ( not ( = ?auto_166050 ?auto_166057 ) ) ( not ( = ?auto_166050 ?auto_166056 ) ) ( not ( = ?auto_166051 ?auto_166054 ) ) ( not ( = ?auto_166051 ?auto_166057 ) ) ( not ( = ?auto_166051 ?auto_166056 ) ) ( CLEAR ?auto_166050 ) ( ON ?auto_166051 ?auto_166052 ) ( CLEAR ?auto_166051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_166054 ?auto_166057 ?auto_166056 ?auto_166055 ?auto_166053 ?auto_166052 )
      ( MAKE-5PILE ?auto_166049 ?auto_166050 ?auto_166051 ?auto_166052 ?auto_166053 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_166058 - BLOCK
      ?auto_166059 - BLOCK
      ?auto_166060 - BLOCK
      ?auto_166061 - BLOCK
      ?auto_166062 - BLOCK
    )
    :vars
    (
      ?auto_166066 - BLOCK
      ?auto_166063 - BLOCK
      ?auto_166065 - BLOCK
      ?auto_166064 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166058 ) ( not ( = ?auto_166058 ?auto_166059 ) ) ( not ( = ?auto_166058 ?auto_166060 ) ) ( not ( = ?auto_166058 ?auto_166061 ) ) ( not ( = ?auto_166058 ?auto_166062 ) ) ( not ( = ?auto_166059 ?auto_166060 ) ) ( not ( = ?auto_166059 ?auto_166061 ) ) ( not ( = ?auto_166059 ?auto_166062 ) ) ( not ( = ?auto_166060 ?auto_166061 ) ) ( not ( = ?auto_166060 ?auto_166062 ) ) ( not ( = ?auto_166061 ?auto_166062 ) ) ( ON ?auto_166062 ?auto_166066 ) ( not ( = ?auto_166058 ?auto_166066 ) ) ( not ( = ?auto_166059 ?auto_166066 ) ) ( not ( = ?auto_166060 ?auto_166066 ) ) ( not ( = ?auto_166061 ?auto_166066 ) ) ( not ( = ?auto_166062 ?auto_166066 ) ) ( ON ?auto_166061 ?auto_166062 ) ( ON-TABLE ?auto_166063 ) ( ON ?auto_166065 ?auto_166063 ) ( ON ?auto_166064 ?auto_166065 ) ( ON ?auto_166066 ?auto_166064 ) ( not ( = ?auto_166063 ?auto_166065 ) ) ( not ( = ?auto_166063 ?auto_166064 ) ) ( not ( = ?auto_166063 ?auto_166066 ) ) ( not ( = ?auto_166063 ?auto_166062 ) ) ( not ( = ?auto_166063 ?auto_166061 ) ) ( not ( = ?auto_166065 ?auto_166064 ) ) ( not ( = ?auto_166065 ?auto_166066 ) ) ( not ( = ?auto_166065 ?auto_166062 ) ) ( not ( = ?auto_166065 ?auto_166061 ) ) ( not ( = ?auto_166064 ?auto_166066 ) ) ( not ( = ?auto_166064 ?auto_166062 ) ) ( not ( = ?auto_166064 ?auto_166061 ) ) ( not ( = ?auto_166058 ?auto_166063 ) ) ( not ( = ?auto_166058 ?auto_166065 ) ) ( not ( = ?auto_166058 ?auto_166064 ) ) ( not ( = ?auto_166059 ?auto_166063 ) ) ( not ( = ?auto_166059 ?auto_166065 ) ) ( not ( = ?auto_166059 ?auto_166064 ) ) ( not ( = ?auto_166060 ?auto_166063 ) ) ( not ( = ?auto_166060 ?auto_166065 ) ) ( not ( = ?auto_166060 ?auto_166064 ) ) ( ON ?auto_166060 ?auto_166061 ) ( CLEAR ?auto_166060 ) ( HOLDING ?auto_166059 ) ( CLEAR ?auto_166058 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_166058 ?auto_166059 )
      ( MAKE-5PILE ?auto_166058 ?auto_166059 ?auto_166060 ?auto_166061 ?auto_166062 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_166067 - BLOCK
      ?auto_166068 - BLOCK
      ?auto_166069 - BLOCK
      ?auto_166070 - BLOCK
      ?auto_166071 - BLOCK
    )
    :vars
    (
      ?auto_166072 - BLOCK
      ?auto_166075 - BLOCK
      ?auto_166074 - BLOCK
      ?auto_166073 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166067 ) ( not ( = ?auto_166067 ?auto_166068 ) ) ( not ( = ?auto_166067 ?auto_166069 ) ) ( not ( = ?auto_166067 ?auto_166070 ) ) ( not ( = ?auto_166067 ?auto_166071 ) ) ( not ( = ?auto_166068 ?auto_166069 ) ) ( not ( = ?auto_166068 ?auto_166070 ) ) ( not ( = ?auto_166068 ?auto_166071 ) ) ( not ( = ?auto_166069 ?auto_166070 ) ) ( not ( = ?auto_166069 ?auto_166071 ) ) ( not ( = ?auto_166070 ?auto_166071 ) ) ( ON ?auto_166071 ?auto_166072 ) ( not ( = ?auto_166067 ?auto_166072 ) ) ( not ( = ?auto_166068 ?auto_166072 ) ) ( not ( = ?auto_166069 ?auto_166072 ) ) ( not ( = ?auto_166070 ?auto_166072 ) ) ( not ( = ?auto_166071 ?auto_166072 ) ) ( ON ?auto_166070 ?auto_166071 ) ( ON-TABLE ?auto_166075 ) ( ON ?auto_166074 ?auto_166075 ) ( ON ?auto_166073 ?auto_166074 ) ( ON ?auto_166072 ?auto_166073 ) ( not ( = ?auto_166075 ?auto_166074 ) ) ( not ( = ?auto_166075 ?auto_166073 ) ) ( not ( = ?auto_166075 ?auto_166072 ) ) ( not ( = ?auto_166075 ?auto_166071 ) ) ( not ( = ?auto_166075 ?auto_166070 ) ) ( not ( = ?auto_166074 ?auto_166073 ) ) ( not ( = ?auto_166074 ?auto_166072 ) ) ( not ( = ?auto_166074 ?auto_166071 ) ) ( not ( = ?auto_166074 ?auto_166070 ) ) ( not ( = ?auto_166073 ?auto_166072 ) ) ( not ( = ?auto_166073 ?auto_166071 ) ) ( not ( = ?auto_166073 ?auto_166070 ) ) ( not ( = ?auto_166067 ?auto_166075 ) ) ( not ( = ?auto_166067 ?auto_166074 ) ) ( not ( = ?auto_166067 ?auto_166073 ) ) ( not ( = ?auto_166068 ?auto_166075 ) ) ( not ( = ?auto_166068 ?auto_166074 ) ) ( not ( = ?auto_166068 ?auto_166073 ) ) ( not ( = ?auto_166069 ?auto_166075 ) ) ( not ( = ?auto_166069 ?auto_166074 ) ) ( not ( = ?auto_166069 ?auto_166073 ) ) ( ON ?auto_166069 ?auto_166070 ) ( CLEAR ?auto_166067 ) ( ON ?auto_166068 ?auto_166069 ) ( CLEAR ?auto_166068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_166075 ?auto_166074 ?auto_166073 ?auto_166072 ?auto_166071 ?auto_166070 ?auto_166069 )
      ( MAKE-5PILE ?auto_166067 ?auto_166068 ?auto_166069 ?auto_166070 ?auto_166071 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_166076 - BLOCK
      ?auto_166077 - BLOCK
      ?auto_166078 - BLOCK
      ?auto_166079 - BLOCK
      ?auto_166080 - BLOCK
    )
    :vars
    (
      ?auto_166081 - BLOCK
      ?auto_166082 - BLOCK
      ?auto_166083 - BLOCK
      ?auto_166084 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166076 ?auto_166077 ) ) ( not ( = ?auto_166076 ?auto_166078 ) ) ( not ( = ?auto_166076 ?auto_166079 ) ) ( not ( = ?auto_166076 ?auto_166080 ) ) ( not ( = ?auto_166077 ?auto_166078 ) ) ( not ( = ?auto_166077 ?auto_166079 ) ) ( not ( = ?auto_166077 ?auto_166080 ) ) ( not ( = ?auto_166078 ?auto_166079 ) ) ( not ( = ?auto_166078 ?auto_166080 ) ) ( not ( = ?auto_166079 ?auto_166080 ) ) ( ON ?auto_166080 ?auto_166081 ) ( not ( = ?auto_166076 ?auto_166081 ) ) ( not ( = ?auto_166077 ?auto_166081 ) ) ( not ( = ?auto_166078 ?auto_166081 ) ) ( not ( = ?auto_166079 ?auto_166081 ) ) ( not ( = ?auto_166080 ?auto_166081 ) ) ( ON ?auto_166079 ?auto_166080 ) ( ON-TABLE ?auto_166082 ) ( ON ?auto_166083 ?auto_166082 ) ( ON ?auto_166084 ?auto_166083 ) ( ON ?auto_166081 ?auto_166084 ) ( not ( = ?auto_166082 ?auto_166083 ) ) ( not ( = ?auto_166082 ?auto_166084 ) ) ( not ( = ?auto_166082 ?auto_166081 ) ) ( not ( = ?auto_166082 ?auto_166080 ) ) ( not ( = ?auto_166082 ?auto_166079 ) ) ( not ( = ?auto_166083 ?auto_166084 ) ) ( not ( = ?auto_166083 ?auto_166081 ) ) ( not ( = ?auto_166083 ?auto_166080 ) ) ( not ( = ?auto_166083 ?auto_166079 ) ) ( not ( = ?auto_166084 ?auto_166081 ) ) ( not ( = ?auto_166084 ?auto_166080 ) ) ( not ( = ?auto_166084 ?auto_166079 ) ) ( not ( = ?auto_166076 ?auto_166082 ) ) ( not ( = ?auto_166076 ?auto_166083 ) ) ( not ( = ?auto_166076 ?auto_166084 ) ) ( not ( = ?auto_166077 ?auto_166082 ) ) ( not ( = ?auto_166077 ?auto_166083 ) ) ( not ( = ?auto_166077 ?auto_166084 ) ) ( not ( = ?auto_166078 ?auto_166082 ) ) ( not ( = ?auto_166078 ?auto_166083 ) ) ( not ( = ?auto_166078 ?auto_166084 ) ) ( ON ?auto_166078 ?auto_166079 ) ( ON ?auto_166077 ?auto_166078 ) ( CLEAR ?auto_166077 ) ( HOLDING ?auto_166076 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_166076 )
      ( MAKE-5PILE ?auto_166076 ?auto_166077 ?auto_166078 ?auto_166079 ?auto_166080 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_166085 - BLOCK
      ?auto_166086 - BLOCK
      ?auto_166087 - BLOCK
      ?auto_166088 - BLOCK
      ?auto_166089 - BLOCK
    )
    :vars
    (
      ?auto_166092 - BLOCK
      ?auto_166093 - BLOCK
      ?auto_166091 - BLOCK
      ?auto_166090 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166085 ?auto_166086 ) ) ( not ( = ?auto_166085 ?auto_166087 ) ) ( not ( = ?auto_166085 ?auto_166088 ) ) ( not ( = ?auto_166085 ?auto_166089 ) ) ( not ( = ?auto_166086 ?auto_166087 ) ) ( not ( = ?auto_166086 ?auto_166088 ) ) ( not ( = ?auto_166086 ?auto_166089 ) ) ( not ( = ?auto_166087 ?auto_166088 ) ) ( not ( = ?auto_166087 ?auto_166089 ) ) ( not ( = ?auto_166088 ?auto_166089 ) ) ( ON ?auto_166089 ?auto_166092 ) ( not ( = ?auto_166085 ?auto_166092 ) ) ( not ( = ?auto_166086 ?auto_166092 ) ) ( not ( = ?auto_166087 ?auto_166092 ) ) ( not ( = ?auto_166088 ?auto_166092 ) ) ( not ( = ?auto_166089 ?auto_166092 ) ) ( ON ?auto_166088 ?auto_166089 ) ( ON-TABLE ?auto_166093 ) ( ON ?auto_166091 ?auto_166093 ) ( ON ?auto_166090 ?auto_166091 ) ( ON ?auto_166092 ?auto_166090 ) ( not ( = ?auto_166093 ?auto_166091 ) ) ( not ( = ?auto_166093 ?auto_166090 ) ) ( not ( = ?auto_166093 ?auto_166092 ) ) ( not ( = ?auto_166093 ?auto_166089 ) ) ( not ( = ?auto_166093 ?auto_166088 ) ) ( not ( = ?auto_166091 ?auto_166090 ) ) ( not ( = ?auto_166091 ?auto_166092 ) ) ( not ( = ?auto_166091 ?auto_166089 ) ) ( not ( = ?auto_166091 ?auto_166088 ) ) ( not ( = ?auto_166090 ?auto_166092 ) ) ( not ( = ?auto_166090 ?auto_166089 ) ) ( not ( = ?auto_166090 ?auto_166088 ) ) ( not ( = ?auto_166085 ?auto_166093 ) ) ( not ( = ?auto_166085 ?auto_166091 ) ) ( not ( = ?auto_166085 ?auto_166090 ) ) ( not ( = ?auto_166086 ?auto_166093 ) ) ( not ( = ?auto_166086 ?auto_166091 ) ) ( not ( = ?auto_166086 ?auto_166090 ) ) ( not ( = ?auto_166087 ?auto_166093 ) ) ( not ( = ?auto_166087 ?auto_166091 ) ) ( not ( = ?auto_166087 ?auto_166090 ) ) ( ON ?auto_166087 ?auto_166088 ) ( ON ?auto_166086 ?auto_166087 ) ( ON ?auto_166085 ?auto_166086 ) ( CLEAR ?auto_166085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_166093 ?auto_166091 ?auto_166090 ?auto_166092 ?auto_166089 ?auto_166088 ?auto_166087 ?auto_166086 )
      ( MAKE-5PILE ?auto_166085 ?auto_166086 ?auto_166087 ?auto_166088 ?auto_166089 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_166097 - BLOCK
      ?auto_166098 - BLOCK
      ?auto_166099 - BLOCK
    )
    :vars
    (
      ?auto_166100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166100 ?auto_166099 ) ( CLEAR ?auto_166100 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_166097 ) ( ON ?auto_166098 ?auto_166097 ) ( ON ?auto_166099 ?auto_166098 ) ( not ( = ?auto_166097 ?auto_166098 ) ) ( not ( = ?auto_166097 ?auto_166099 ) ) ( not ( = ?auto_166097 ?auto_166100 ) ) ( not ( = ?auto_166098 ?auto_166099 ) ) ( not ( = ?auto_166098 ?auto_166100 ) ) ( not ( = ?auto_166099 ?auto_166100 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166100 ?auto_166099 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_166101 - BLOCK
      ?auto_166102 - BLOCK
      ?auto_166103 - BLOCK
    )
    :vars
    (
      ?auto_166104 - BLOCK
      ?auto_166105 - BLOCK
      ?auto_166106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166104 ?auto_166103 ) ( CLEAR ?auto_166104 ) ( ON-TABLE ?auto_166101 ) ( ON ?auto_166102 ?auto_166101 ) ( ON ?auto_166103 ?auto_166102 ) ( not ( = ?auto_166101 ?auto_166102 ) ) ( not ( = ?auto_166101 ?auto_166103 ) ) ( not ( = ?auto_166101 ?auto_166104 ) ) ( not ( = ?auto_166102 ?auto_166103 ) ) ( not ( = ?auto_166102 ?auto_166104 ) ) ( not ( = ?auto_166103 ?auto_166104 ) ) ( HOLDING ?auto_166105 ) ( CLEAR ?auto_166106 ) ( not ( = ?auto_166101 ?auto_166105 ) ) ( not ( = ?auto_166101 ?auto_166106 ) ) ( not ( = ?auto_166102 ?auto_166105 ) ) ( not ( = ?auto_166102 ?auto_166106 ) ) ( not ( = ?auto_166103 ?auto_166105 ) ) ( not ( = ?auto_166103 ?auto_166106 ) ) ( not ( = ?auto_166104 ?auto_166105 ) ) ( not ( = ?auto_166104 ?auto_166106 ) ) ( not ( = ?auto_166105 ?auto_166106 ) ) )
    :subtasks
    ( ( !STACK ?auto_166105 ?auto_166106 )
      ( MAKE-3PILE ?auto_166101 ?auto_166102 ?auto_166103 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_166107 - BLOCK
      ?auto_166108 - BLOCK
      ?auto_166109 - BLOCK
    )
    :vars
    (
      ?auto_166111 - BLOCK
      ?auto_166110 - BLOCK
      ?auto_166112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166111 ?auto_166109 ) ( ON-TABLE ?auto_166107 ) ( ON ?auto_166108 ?auto_166107 ) ( ON ?auto_166109 ?auto_166108 ) ( not ( = ?auto_166107 ?auto_166108 ) ) ( not ( = ?auto_166107 ?auto_166109 ) ) ( not ( = ?auto_166107 ?auto_166111 ) ) ( not ( = ?auto_166108 ?auto_166109 ) ) ( not ( = ?auto_166108 ?auto_166111 ) ) ( not ( = ?auto_166109 ?auto_166111 ) ) ( CLEAR ?auto_166110 ) ( not ( = ?auto_166107 ?auto_166112 ) ) ( not ( = ?auto_166107 ?auto_166110 ) ) ( not ( = ?auto_166108 ?auto_166112 ) ) ( not ( = ?auto_166108 ?auto_166110 ) ) ( not ( = ?auto_166109 ?auto_166112 ) ) ( not ( = ?auto_166109 ?auto_166110 ) ) ( not ( = ?auto_166111 ?auto_166112 ) ) ( not ( = ?auto_166111 ?auto_166110 ) ) ( not ( = ?auto_166112 ?auto_166110 ) ) ( ON ?auto_166112 ?auto_166111 ) ( CLEAR ?auto_166112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_166107 ?auto_166108 ?auto_166109 ?auto_166111 )
      ( MAKE-3PILE ?auto_166107 ?auto_166108 ?auto_166109 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_166113 - BLOCK
      ?auto_166114 - BLOCK
      ?auto_166115 - BLOCK
    )
    :vars
    (
      ?auto_166117 - BLOCK
      ?auto_166118 - BLOCK
      ?auto_166116 - BLOCK
      ?auto_166119 - BLOCK
      ?auto_166120 - BLOCK
      ?auto_166121 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166117 ?auto_166115 ) ( ON-TABLE ?auto_166113 ) ( ON ?auto_166114 ?auto_166113 ) ( ON ?auto_166115 ?auto_166114 ) ( not ( = ?auto_166113 ?auto_166114 ) ) ( not ( = ?auto_166113 ?auto_166115 ) ) ( not ( = ?auto_166113 ?auto_166117 ) ) ( not ( = ?auto_166114 ?auto_166115 ) ) ( not ( = ?auto_166114 ?auto_166117 ) ) ( not ( = ?auto_166115 ?auto_166117 ) ) ( not ( = ?auto_166113 ?auto_166118 ) ) ( not ( = ?auto_166113 ?auto_166116 ) ) ( not ( = ?auto_166114 ?auto_166118 ) ) ( not ( = ?auto_166114 ?auto_166116 ) ) ( not ( = ?auto_166115 ?auto_166118 ) ) ( not ( = ?auto_166115 ?auto_166116 ) ) ( not ( = ?auto_166117 ?auto_166118 ) ) ( not ( = ?auto_166117 ?auto_166116 ) ) ( not ( = ?auto_166118 ?auto_166116 ) ) ( ON ?auto_166118 ?auto_166117 ) ( CLEAR ?auto_166118 ) ( HOLDING ?auto_166116 ) ( CLEAR ?auto_166119 ) ( ON-TABLE ?auto_166120 ) ( ON ?auto_166121 ?auto_166120 ) ( ON ?auto_166119 ?auto_166121 ) ( not ( = ?auto_166120 ?auto_166121 ) ) ( not ( = ?auto_166120 ?auto_166119 ) ) ( not ( = ?auto_166120 ?auto_166116 ) ) ( not ( = ?auto_166121 ?auto_166119 ) ) ( not ( = ?auto_166121 ?auto_166116 ) ) ( not ( = ?auto_166119 ?auto_166116 ) ) ( not ( = ?auto_166113 ?auto_166119 ) ) ( not ( = ?auto_166113 ?auto_166120 ) ) ( not ( = ?auto_166113 ?auto_166121 ) ) ( not ( = ?auto_166114 ?auto_166119 ) ) ( not ( = ?auto_166114 ?auto_166120 ) ) ( not ( = ?auto_166114 ?auto_166121 ) ) ( not ( = ?auto_166115 ?auto_166119 ) ) ( not ( = ?auto_166115 ?auto_166120 ) ) ( not ( = ?auto_166115 ?auto_166121 ) ) ( not ( = ?auto_166117 ?auto_166119 ) ) ( not ( = ?auto_166117 ?auto_166120 ) ) ( not ( = ?auto_166117 ?auto_166121 ) ) ( not ( = ?auto_166118 ?auto_166119 ) ) ( not ( = ?auto_166118 ?auto_166120 ) ) ( not ( = ?auto_166118 ?auto_166121 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_166120 ?auto_166121 ?auto_166119 ?auto_166116 )
      ( MAKE-3PILE ?auto_166113 ?auto_166114 ?auto_166115 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_166122 - BLOCK
      ?auto_166123 - BLOCK
      ?auto_166124 - BLOCK
    )
    :vars
    (
      ?auto_166125 - BLOCK
      ?auto_166127 - BLOCK
      ?auto_166128 - BLOCK
      ?auto_166126 - BLOCK
      ?auto_166130 - BLOCK
      ?auto_166129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166125 ?auto_166124 ) ( ON-TABLE ?auto_166122 ) ( ON ?auto_166123 ?auto_166122 ) ( ON ?auto_166124 ?auto_166123 ) ( not ( = ?auto_166122 ?auto_166123 ) ) ( not ( = ?auto_166122 ?auto_166124 ) ) ( not ( = ?auto_166122 ?auto_166125 ) ) ( not ( = ?auto_166123 ?auto_166124 ) ) ( not ( = ?auto_166123 ?auto_166125 ) ) ( not ( = ?auto_166124 ?auto_166125 ) ) ( not ( = ?auto_166122 ?auto_166127 ) ) ( not ( = ?auto_166122 ?auto_166128 ) ) ( not ( = ?auto_166123 ?auto_166127 ) ) ( not ( = ?auto_166123 ?auto_166128 ) ) ( not ( = ?auto_166124 ?auto_166127 ) ) ( not ( = ?auto_166124 ?auto_166128 ) ) ( not ( = ?auto_166125 ?auto_166127 ) ) ( not ( = ?auto_166125 ?auto_166128 ) ) ( not ( = ?auto_166127 ?auto_166128 ) ) ( ON ?auto_166127 ?auto_166125 ) ( CLEAR ?auto_166126 ) ( ON-TABLE ?auto_166130 ) ( ON ?auto_166129 ?auto_166130 ) ( ON ?auto_166126 ?auto_166129 ) ( not ( = ?auto_166130 ?auto_166129 ) ) ( not ( = ?auto_166130 ?auto_166126 ) ) ( not ( = ?auto_166130 ?auto_166128 ) ) ( not ( = ?auto_166129 ?auto_166126 ) ) ( not ( = ?auto_166129 ?auto_166128 ) ) ( not ( = ?auto_166126 ?auto_166128 ) ) ( not ( = ?auto_166122 ?auto_166126 ) ) ( not ( = ?auto_166122 ?auto_166130 ) ) ( not ( = ?auto_166122 ?auto_166129 ) ) ( not ( = ?auto_166123 ?auto_166126 ) ) ( not ( = ?auto_166123 ?auto_166130 ) ) ( not ( = ?auto_166123 ?auto_166129 ) ) ( not ( = ?auto_166124 ?auto_166126 ) ) ( not ( = ?auto_166124 ?auto_166130 ) ) ( not ( = ?auto_166124 ?auto_166129 ) ) ( not ( = ?auto_166125 ?auto_166126 ) ) ( not ( = ?auto_166125 ?auto_166130 ) ) ( not ( = ?auto_166125 ?auto_166129 ) ) ( not ( = ?auto_166127 ?auto_166126 ) ) ( not ( = ?auto_166127 ?auto_166130 ) ) ( not ( = ?auto_166127 ?auto_166129 ) ) ( ON ?auto_166128 ?auto_166127 ) ( CLEAR ?auto_166128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_166122 ?auto_166123 ?auto_166124 ?auto_166125 ?auto_166127 )
      ( MAKE-3PILE ?auto_166122 ?auto_166123 ?auto_166124 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_166131 - BLOCK
      ?auto_166132 - BLOCK
      ?auto_166133 - BLOCK
    )
    :vars
    (
      ?auto_166139 - BLOCK
      ?auto_166137 - BLOCK
      ?auto_166138 - BLOCK
      ?auto_166135 - BLOCK
      ?auto_166136 - BLOCK
      ?auto_166134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166139 ?auto_166133 ) ( ON-TABLE ?auto_166131 ) ( ON ?auto_166132 ?auto_166131 ) ( ON ?auto_166133 ?auto_166132 ) ( not ( = ?auto_166131 ?auto_166132 ) ) ( not ( = ?auto_166131 ?auto_166133 ) ) ( not ( = ?auto_166131 ?auto_166139 ) ) ( not ( = ?auto_166132 ?auto_166133 ) ) ( not ( = ?auto_166132 ?auto_166139 ) ) ( not ( = ?auto_166133 ?auto_166139 ) ) ( not ( = ?auto_166131 ?auto_166137 ) ) ( not ( = ?auto_166131 ?auto_166138 ) ) ( not ( = ?auto_166132 ?auto_166137 ) ) ( not ( = ?auto_166132 ?auto_166138 ) ) ( not ( = ?auto_166133 ?auto_166137 ) ) ( not ( = ?auto_166133 ?auto_166138 ) ) ( not ( = ?auto_166139 ?auto_166137 ) ) ( not ( = ?auto_166139 ?auto_166138 ) ) ( not ( = ?auto_166137 ?auto_166138 ) ) ( ON ?auto_166137 ?auto_166139 ) ( ON-TABLE ?auto_166135 ) ( ON ?auto_166136 ?auto_166135 ) ( not ( = ?auto_166135 ?auto_166136 ) ) ( not ( = ?auto_166135 ?auto_166134 ) ) ( not ( = ?auto_166135 ?auto_166138 ) ) ( not ( = ?auto_166136 ?auto_166134 ) ) ( not ( = ?auto_166136 ?auto_166138 ) ) ( not ( = ?auto_166134 ?auto_166138 ) ) ( not ( = ?auto_166131 ?auto_166134 ) ) ( not ( = ?auto_166131 ?auto_166135 ) ) ( not ( = ?auto_166131 ?auto_166136 ) ) ( not ( = ?auto_166132 ?auto_166134 ) ) ( not ( = ?auto_166132 ?auto_166135 ) ) ( not ( = ?auto_166132 ?auto_166136 ) ) ( not ( = ?auto_166133 ?auto_166134 ) ) ( not ( = ?auto_166133 ?auto_166135 ) ) ( not ( = ?auto_166133 ?auto_166136 ) ) ( not ( = ?auto_166139 ?auto_166134 ) ) ( not ( = ?auto_166139 ?auto_166135 ) ) ( not ( = ?auto_166139 ?auto_166136 ) ) ( not ( = ?auto_166137 ?auto_166134 ) ) ( not ( = ?auto_166137 ?auto_166135 ) ) ( not ( = ?auto_166137 ?auto_166136 ) ) ( ON ?auto_166138 ?auto_166137 ) ( CLEAR ?auto_166138 ) ( HOLDING ?auto_166134 ) ( CLEAR ?auto_166136 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_166135 ?auto_166136 ?auto_166134 )
      ( MAKE-3PILE ?auto_166131 ?auto_166132 ?auto_166133 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_166140 - BLOCK
      ?auto_166141 - BLOCK
      ?auto_166142 - BLOCK
    )
    :vars
    (
      ?auto_166146 - BLOCK
      ?auto_166144 - BLOCK
      ?auto_166147 - BLOCK
      ?auto_166145 - BLOCK
      ?auto_166148 - BLOCK
      ?auto_166143 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166146 ?auto_166142 ) ( ON-TABLE ?auto_166140 ) ( ON ?auto_166141 ?auto_166140 ) ( ON ?auto_166142 ?auto_166141 ) ( not ( = ?auto_166140 ?auto_166141 ) ) ( not ( = ?auto_166140 ?auto_166142 ) ) ( not ( = ?auto_166140 ?auto_166146 ) ) ( not ( = ?auto_166141 ?auto_166142 ) ) ( not ( = ?auto_166141 ?auto_166146 ) ) ( not ( = ?auto_166142 ?auto_166146 ) ) ( not ( = ?auto_166140 ?auto_166144 ) ) ( not ( = ?auto_166140 ?auto_166147 ) ) ( not ( = ?auto_166141 ?auto_166144 ) ) ( not ( = ?auto_166141 ?auto_166147 ) ) ( not ( = ?auto_166142 ?auto_166144 ) ) ( not ( = ?auto_166142 ?auto_166147 ) ) ( not ( = ?auto_166146 ?auto_166144 ) ) ( not ( = ?auto_166146 ?auto_166147 ) ) ( not ( = ?auto_166144 ?auto_166147 ) ) ( ON ?auto_166144 ?auto_166146 ) ( ON-TABLE ?auto_166145 ) ( ON ?auto_166148 ?auto_166145 ) ( not ( = ?auto_166145 ?auto_166148 ) ) ( not ( = ?auto_166145 ?auto_166143 ) ) ( not ( = ?auto_166145 ?auto_166147 ) ) ( not ( = ?auto_166148 ?auto_166143 ) ) ( not ( = ?auto_166148 ?auto_166147 ) ) ( not ( = ?auto_166143 ?auto_166147 ) ) ( not ( = ?auto_166140 ?auto_166143 ) ) ( not ( = ?auto_166140 ?auto_166145 ) ) ( not ( = ?auto_166140 ?auto_166148 ) ) ( not ( = ?auto_166141 ?auto_166143 ) ) ( not ( = ?auto_166141 ?auto_166145 ) ) ( not ( = ?auto_166141 ?auto_166148 ) ) ( not ( = ?auto_166142 ?auto_166143 ) ) ( not ( = ?auto_166142 ?auto_166145 ) ) ( not ( = ?auto_166142 ?auto_166148 ) ) ( not ( = ?auto_166146 ?auto_166143 ) ) ( not ( = ?auto_166146 ?auto_166145 ) ) ( not ( = ?auto_166146 ?auto_166148 ) ) ( not ( = ?auto_166144 ?auto_166143 ) ) ( not ( = ?auto_166144 ?auto_166145 ) ) ( not ( = ?auto_166144 ?auto_166148 ) ) ( ON ?auto_166147 ?auto_166144 ) ( CLEAR ?auto_166148 ) ( ON ?auto_166143 ?auto_166147 ) ( CLEAR ?auto_166143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_166140 ?auto_166141 ?auto_166142 ?auto_166146 ?auto_166144 ?auto_166147 )
      ( MAKE-3PILE ?auto_166140 ?auto_166141 ?auto_166142 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_166149 - BLOCK
      ?auto_166150 - BLOCK
      ?auto_166151 - BLOCK
    )
    :vars
    (
      ?auto_166155 - BLOCK
      ?auto_166157 - BLOCK
      ?auto_166154 - BLOCK
      ?auto_166153 - BLOCK
      ?auto_166152 - BLOCK
      ?auto_166156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166155 ?auto_166151 ) ( ON-TABLE ?auto_166149 ) ( ON ?auto_166150 ?auto_166149 ) ( ON ?auto_166151 ?auto_166150 ) ( not ( = ?auto_166149 ?auto_166150 ) ) ( not ( = ?auto_166149 ?auto_166151 ) ) ( not ( = ?auto_166149 ?auto_166155 ) ) ( not ( = ?auto_166150 ?auto_166151 ) ) ( not ( = ?auto_166150 ?auto_166155 ) ) ( not ( = ?auto_166151 ?auto_166155 ) ) ( not ( = ?auto_166149 ?auto_166157 ) ) ( not ( = ?auto_166149 ?auto_166154 ) ) ( not ( = ?auto_166150 ?auto_166157 ) ) ( not ( = ?auto_166150 ?auto_166154 ) ) ( not ( = ?auto_166151 ?auto_166157 ) ) ( not ( = ?auto_166151 ?auto_166154 ) ) ( not ( = ?auto_166155 ?auto_166157 ) ) ( not ( = ?auto_166155 ?auto_166154 ) ) ( not ( = ?auto_166157 ?auto_166154 ) ) ( ON ?auto_166157 ?auto_166155 ) ( ON-TABLE ?auto_166153 ) ( not ( = ?auto_166153 ?auto_166152 ) ) ( not ( = ?auto_166153 ?auto_166156 ) ) ( not ( = ?auto_166153 ?auto_166154 ) ) ( not ( = ?auto_166152 ?auto_166156 ) ) ( not ( = ?auto_166152 ?auto_166154 ) ) ( not ( = ?auto_166156 ?auto_166154 ) ) ( not ( = ?auto_166149 ?auto_166156 ) ) ( not ( = ?auto_166149 ?auto_166153 ) ) ( not ( = ?auto_166149 ?auto_166152 ) ) ( not ( = ?auto_166150 ?auto_166156 ) ) ( not ( = ?auto_166150 ?auto_166153 ) ) ( not ( = ?auto_166150 ?auto_166152 ) ) ( not ( = ?auto_166151 ?auto_166156 ) ) ( not ( = ?auto_166151 ?auto_166153 ) ) ( not ( = ?auto_166151 ?auto_166152 ) ) ( not ( = ?auto_166155 ?auto_166156 ) ) ( not ( = ?auto_166155 ?auto_166153 ) ) ( not ( = ?auto_166155 ?auto_166152 ) ) ( not ( = ?auto_166157 ?auto_166156 ) ) ( not ( = ?auto_166157 ?auto_166153 ) ) ( not ( = ?auto_166157 ?auto_166152 ) ) ( ON ?auto_166154 ?auto_166157 ) ( ON ?auto_166156 ?auto_166154 ) ( CLEAR ?auto_166156 ) ( HOLDING ?auto_166152 ) ( CLEAR ?auto_166153 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_166153 ?auto_166152 )
      ( MAKE-3PILE ?auto_166149 ?auto_166150 ?auto_166151 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_168016 - BLOCK
      ?auto_168017 - BLOCK
      ?auto_168018 - BLOCK
    )
    :vars
    (
      ?auto_168023 - BLOCK
      ?auto_168020 - BLOCK
      ?auto_168022 - BLOCK
      ?auto_168019 - BLOCK
      ?auto_168021 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168023 ?auto_168018 ) ( ON-TABLE ?auto_168016 ) ( ON ?auto_168017 ?auto_168016 ) ( ON ?auto_168018 ?auto_168017 ) ( not ( = ?auto_168016 ?auto_168017 ) ) ( not ( = ?auto_168016 ?auto_168018 ) ) ( not ( = ?auto_168016 ?auto_168023 ) ) ( not ( = ?auto_168017 ?auto_168018 ) ) ( not ( = ?auto_168017 ?auto_168023 ) ) ( not ( = ?auto_168018 ?auto_168023 ) ) ( not ( = ?auto_168016 ?auto_168020 ) ) ( not ( = ?auto_168016 ?auto_168022 ) ) ( not ( = ?auto_168017 ?auto_168020 ) ) ( not ( = ?auto_168017 ?auto_168022 ) ) ( not ( = ?auto_168018 ?auto_168020 ) ) ( not ( = ?auto_168018 ?auto_168022 ) ) ( not ( = ?auto_168023 ?auto_168020 ) ) ( not ( = ?auto_168023 ?auto_168022 ) ) ( not ( = ?auto_168020 ?auto_168022 ) ) ( ON ?auto_168020 ?auto_168023 ) ( not ( = ?auto_168019 ?auto_168021 ) ) ( not ( = ?auto_168019 ?auto_168022 ) ) ( not ( = ?auto_168021 ?auto_168022 ) ) ( not ( = ?auto_168016 ?auto_168021 ) ) ( not ( = ?auto_168016 ?auto_168019 ) ) ( not ( = ?auto_168017 ?auto_168021 ) ) ( not ( = ?auto_168017 ?auto_168019 ) ) ( not ( = ?auto_168018 ?auto_168021 ) ) ( not ( = ?auto_168018 ?auto_168019 ) ) ( not ( = ?auto_168023 ?auto_168021 ) ) ( not ( = ?auto_168023 ?auto_168019 ) ) ( not ( = ?auto_168020 ?auto_168021 ) ) ( not ( = ?auto_168020 ?auto_168019 ) ) ( ON ?auto_168022 ?auto_168020 ) ( ON ?auto_168021 ?auto_168022 ) ( ON ?auto_168019 ?auto_168021 ) ( CLEAR ?auto_168019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_168016 ?auto_168017 ?auto_168018 ?auto_168023 ?auto_168020 ?auto_168022 ?auto_168021 )
      ( MAKE-3PILE ?auto_168016 ?auto_168017 ?auto_168018 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_166167 - BLOCK
      ?auto_166168 - BLOCK
      ?auto_166169 - BLOCK
    )
    :vars
    (
      ?auto_166171 - BLOCK
      ?auto_166175 - BLOCK
      ?auto_166170 - BLOCK
      ?auto_166174 - BLOCK
      ?auto_166173 - BLOCK
      ?auto_166172 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166171 ?auto_166169 ) ( ON-TABLE ?auto_166167 ) ( ON ?auto_166168 ?auto_166167 ) ( ON ?auto_166169 ?auto_166168 ) ( not ( = ?auto_166167 ?auto_166168 ) ) ( not ( = ?auto_166167 ?auto_166169 ) ) ( not ( = ?auto_166167 ?auto_166171 ) ) ( not ( = ?auto_166168 ?auto_166169 ) ) ( not ( = ?auto_166168 ?auto_166171 ) ) ( not ( = ?auto_166169 ?auto_166171 ) ) ( not ( = ?auto_166167 ?auto_166175 ) ) ( not ( = ?auto_166167 ?auto_166170 ) ) ( not ( = ?auto_166168 ?auto_166175 ) ) ( not ( = ?auto_166168 ?auto_166170 ) ) ( not ( = ?auto_166169 ?auto_166175 ) ) ( not ( = ?auto_166169 ?auto_166170 ) ) ( not ( = ?auto_166171 ?auto_166175 ) ) ( not ( = ?auto_166171 ?auto_166170 ) ) ( not ( = ?auto_166175 ?auto_166170 ) ) ( ON ?auto_166175 ?auto_166171 ) ( not ( = ?auto_166174 ?auto_166173 ) ) ( not ( = ?auto_166174 ?auto_166172 ) ) ( not ( = ?auto_166174 ?auto_166170 ) ) ( not ( = ?auto_166173 ?auto_166172 ) ) ( not ( = ?auto_166173 ?auto_166170 ) ) ( not ( = ?auto_166172 ?auto_166170 ) ) ( not ( = ?auto_166167 ?auto_166172 ) ) ( not ( = ?auto_166167 ?auto_166174 ) ) ( not ( = ?auto_166167 ?auto_166173 ) ) ( not ( = ?auto_166168 ?auto_166172 ) ) ( not ( = ?auto_166168 ?auto_166174 ) ) ( not ( = ?auto_166168 ?auto_166173 ) ) ( not ( = ?auto_166169 ?auto_166172 ) ) ( not ( = ?auto_166169 ?auto_166174 ) ) ( not ( = ?auto_166169 ?auto_166173 ) ) ( not ( = ?auto_166171 ?auto_166172 ) ) ( not ( = ?auto_166171 ?auto_166174 ) ) ( not ( = ?auto_166171 ?auto_166173 ) ) ( not ( = ?auto_166175 ?auto_166172 ) ) ( not ( = ?auto_166175 ?auto_166174 ) ) ( not ( = ?auto_166175 ?auto_166173 ) ) ( ON ?auto_166170 ?auto_166175 ) ( ON ?auto_166172 ?auto_166170 ) ( ON ?auto_166173 ?auto_166172 ) ( CLEAR ?auto_166173 ) ( HOLDING ?auto_166174 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_166174 )
      ( MAKE-3PILE ?auto_166167 ?auto_166168 ?auto_166169 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_166176 - BLOCK
      ?auto_166177 - BLOCK
      ?auto_166178 - BLOCK
    )
    :vars
    (
      ?auto_166181 - BLOCK
      ?auto_166179 - BLOCK
      ?auto_166180 - BLOCK
      ?auto_166182 - BLOCK
      ?auto_166183 - BLOCK
      ?auto_166184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166181 ?auto_166178 ) ( ON-TABLE ?auto_166176 ) ( ON ?auto_166177 ?auto_166176 ) ( ON ?auto_166178 ?auto_166177 ) ( not ( = ?auto_166176 ?auto_166177 ) ) ( not ( = ?auto_166176 ?auto_166178 ) ) ( not ( = ?auto_166176 ?auto_166181 ) ) ( not ( = ?auto_166177 ?auto_166178 ) ) ( not ( = ?auto_166177 ?auto_166181 ) ) ( not ( = ?auto_166178 ?auto_166181 ) ) ( not ( = ?auto_166176 ?auto_166179 ) ) ( not ( = ?auto_166176 ?auto_166180 ) ) ( not ( = ?auto_166177 ?auto_166179 ) ) ( not ( = ?auto_166177 ?auto_166180 ) ) ( not ( = ?auto_166178 ?auto_166179 ) ) ( not ( = ?auto_166178 ?auto_166180 ) ) ( not ( = ?auto_166181 ?auto_166179 ) ) ( not ( = ?auto_166181 ?auto_166180 ) ) ( not ( = ?auto_166179 ?auto_166180 ) ) ( ON ?auto_166179 ?auto_166181 ) ( not ( = ?auto_166182 ?auto_166183 ) ) ( not ( = ?auto_166182 ?auto_166184 ) ) ( not ( = ?auto_166182 ?auto_166180 ) ) ( not ( = ?auto_166183 ?auto_166184 ) ) ( not ( = ?auto_166183 ?auto_166180 ) ) ( not ( = ?auto_166184 ?auto_166180 ) ) ( not ( = ?auto_166176 ?auto_166184 ) ) ( not ( = ?auto_166176 ?auto_166182 ) ) ( not ( = ?auto_166176 ?auto_166183 ) ) ( not ( = ?auto_166177 ?auto_166184 ) ) ( not ( = ?auto_166177 ?auto_166182 ) ) ( not ( = ?auto_166177 ?auto_166183 ) ) ( not ( = ?auto_166178 ?auto_166184 ) ) ( not ( = ?auto_166178 ?auto_166182 ) ) ( not ( = ?auto_166178 ?auto_166183 ) ) ( not ( = ?auto_166181 ?auto_166184 ) ) ( not ( = ?auto_166181 ?auto_166182 ) ) ( not ( = ?auto_166181 ?auto_166183 ) ) ( not ( = ?auto_166179 ?auto_166184 ) ) ( not ( = ?auto_166179 ?auto_166182 ) ) ( not ( = ?auto_166179 ?auto_166183 ) ) ( ON ?auto_166180 ?auto_166179 ) ( ON ?auto_166184 ?auto_166180 ) ( ON ?auto_166183 ?auto_166184 ) ( ON ?auto_166182 ?auto_166183 ) ( CLEAR ?auto_166182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_166176 ?auto_166177 ?auto_166178 ?auto_166181 ?auto_166179 ?auto_166180 ?auto_166184 ?auto_166183 )
      ( MAKE-3PILE ?auto_166176 ?auto_166177 ?auto_166178 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_166191 - BLOCK
      ?auto_166192 - BLOCK
      ?auto_166193 - BLOCK
      ?auto_166194 - BLOCK
      ?auto_166195 - BLOCK
      ?auto_166196 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_166196 ) ( CLEAR ?auto_166195 ) ( ON-TABLE ?auto_166191 ) ( ON ?auto_166192 ?auto_166191 ) ( ON ?auto_166193 ?auto_166192 ) ( ON ?auto_166194 ?auto_166193 ) ( ON ?auto_166195 ?auto_166194 ) ( not ( = ?auto_166191 ?auto_166192 ) ) ( not ( = ?auto_166191 ?auto_166193 ) ) ( not ( = ?auto_166191 ?auto_166194 ) ) ( not ( = ?auto_166191 ?auto_166195 ) ) ( not ( = ?auto_166191 ?auto_166196 ) ) ( not ( = ?auto_166192 ?auto_166193 ) ) ( not ( = ?auto_166192 ?auto_166194 ) ) ( not ( = ?auto_166192 ?auto_166195 ) ) ( not ( = ?auto_166192 ?auto_166196 ) ) ( not ( = ?auto_166193 ?auto_166194 ) ) ( not ( = ?auto_166193 ?auto_166195 ) ) ( not ( = ?auto_166193 ?auto_166196 ) ) ( not ( = ?auto_166194 ?auto_166195 ) ) ( not ( = ?auto_166194 ?auto_166196 ) ) ( not ( = ?auto_166195 ?auto_166196 ) ) )
    :subtasks
    ( ( !STACK ?auto_166196 ?auto_166195 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_166197 - BLOCK
      ?auto_166198 - BLOCK
      ?auto_166199 - BLOCK
      ?auto_166200 - BLOCK
      ?auto_166201 - BLOCK
      ?auto_166202 - BLOCK
    )
    :vars
    (
      ?auto_166203 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_166201 ) ( ON-TABLE ?auto_166197 ) ( ON ?auto_166198 ?auto_166197 ) ( ON ?auto_166199 ?auto_166198 ) ( ON ?auto_166200 ?auto_166199 ) ( ON ?auto_166201 ?auto_166200 ) ( not ( = ?auto_166197 ?auto_166198 ) ) ( not ( = ?auto_166197 ?auto_166199 ) ) ( not ( = ?auto_166197 ?auto_166200 ) ) ( not ( = ?auto_166197 ?auto_166201 ) ) ( not ( = ?auto_166197 ?auto_166202 ) ) ( not ( = ?auto_166198 ?auto_166199 ) ) ( not ( = ?auto_166198 ?auto_166200 ) ) ( not ( = ?auto_166198 ?auto_166201 ) ) ( not ( = ?auto_166198 ?auto_166202 ) ) ( not ( = ?auto_166199 ?auto_166200 ) ) ( not ( = ?auto_166199 ?auto_166201 ) ) ( not ( = ?auto_166199 ?auto_166202 ) ) ( not ( = ?auto_166200 ?auto_166201 ) ) ( not ( = ?auto_166200 ?auto_166202 ) ) ( not ( = ?auto_166201 ?auto_166202 ) ) ( ON ?auto_166202 ?auto_166203 ) ( CLEAR ?auto_166202 ) ( HAND-EMPTY ) ( not ( = ?auto_166197 ?auto_166203 ) ) ( not ( = ?auto_166198 ?auto_166203 ) ) ( not ( = ?auto_166199 ?auto_166203 ) ) ( not ( = ?auto_166200 ?auto_166203 ) ) ( not ( = ?auto_166201 ?auto_166203 ) ) ( not ( = ?auto_166202 ?auto_166203 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166202 ?auto_166203 )
      ( MAKE-6PILE ?auto_166197 ?auto_166198 ?auto_166199 ?auto_166200 ?auto_166201 ?auto_166202 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_166204 - BLOCK
      ?auto_166205 - BLOCK
      ?auto_166206 - BLOCK
      ?auto_166207 - BLOCK
      ?auto_166208 - BLOCK
      ?auto_166209 - BLOCK
    )
    :vars
    (
      ?auto_166210 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166204 ) ( ON ?auto_166205 ?auto_166204 ) ( ON ?auto_166206 ?auto_166205 ) ( ON ?auto_166207 ?auto_166206 ) ( not ( = ?auto_166204 ?auto_166205 ) ) ( not ( = ?auto_166204 ?auto_166206 ) ) ( not ( = ?auto_166204 ?auto_166207 ) ) ( not ( = ?auto_166204 ?auto_166208 ) ) ( not ( = ?auto_166204 ?auto_166209 ) ) ( not ( = ?auto_166205 ?auto_166206 ) ) ( not ( = ?auto_166205 ?auto_166207 ) ) ( not ( = ?auto_166205 ?auto_166208 ) ) ( not ( = ?auto_166205 ?auto_166209 ) ) ( not ( = ?auto_166206 ?auto_166207 ) ) ( not ( = ?auto_166206 ?auto_166208 ) ) ( not ( = ?auto_166206 ?auto_166209 ) ) ( not ( = ?auto_166207 ?auto_166208 ) ) ( not ( = ?auto_166207 ?auto_166209 ) ) ( not ( = ?auto_166208 ?auto_166209 ) ) ( ON ?auto_166209 ?auto_166210 ) ( CLEAR ?auto_166209 ) ( not ( = ?auto_166204 ?auto_166210 ) ) ( not ( = ?auto_166205 ?auto_166210 ) ) ( not ( = ?auto_166206 ?auto_166210 ) ) ( not ( = ?auto_166207 ?auto_166210 ) ) ( not ( = ?auto_166208 ?auto_166210 ) ) ( not ( = ?auto_166209 ?auto_166210 ) ) ( HOLDING ?auto_166208 ) ( CLEAR ?auto_166207 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_166204 ?auto_166205 ?auto_166206 ?auto_166207 ?auto_166208 )
      ( MAKE-6PILE ?auto_166204 ?auto_166205 ?auto_166206 ?auto_166207 ?auto_166208 ?auto_166209 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_166211 - BLOCK
      ?auto_166212 - BLOCK
      ?auto_166213 - BLOCK
      ?auto_166214 - BLOCK
      ?auto_166215 - BLOCK
      ?auto_166216 - BLOCK
    )
    :vars
    (
      ?auto_166217 - BLOCK
      ?auto_166219 - BLOCK
      ?auto_166218 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166211 ) ( ON ?auto_166212 ?auto_166211 ) ( ON ?auto_166213 ?auto_166212 ) ( ON ?auto_166214 ?auto_166213 ) ( not ( = ?auto_166211 ?auto_166212 ) ) ( not ( = ?auto_166211 ?auto_166213 ) ) ( not ( = ?auto_166211 ?auto_166214 ) ) ( not ( = ?auto_166211 ?auto_166215 ) ) ( not ( = ?auto_166211 ?auto_166216 ) ) ( not ( = ?auto_166212 ?auto_166213 ) ) ( not ( = ?auto_166212 ?auto_166214 ) ) ( not ( = ?auto_166212 ?auto_166215 ) ) ( not ( = ?auto_166212 ?auto_166216 ) ) ( not ( = ?auto_166213 ?auto_166214 ) ) ( not ( = ?auto_166213 ?auto_166215 ) ) ( not ( = ?auto_166213 ?auto_166216 ) ) ( not ( = ?auto_166214 ?auto_166215 ) ) ( not ( = ?auto_166214 ?auto_166216 ) ) ( not ( = ?auto_166215 ?auto_166216 ) ) ( ON ?auto_166216 ?auto_166217 ) ( not ( = ?auto_166211 ?auto_166217 ) ) ( not ( = ?auto_166212 ?auto_166217 ) ) ( not ( = ?auto_166213 ?auto_166217 ) ) ( not ( = ?auto_166214 ?auto_166217 ) ) ( not ( = ?auto_166215 ?auto_166217 ) ) ( not ( = ?auto_166216 ?auto_166217 ) ) ( CLEAR ?auto_166214 ) ( ON ?auto_166215 ?auto_166216 ) ( CLEAR ?auto_166215 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_166219 ) ( ON ?auto_166218 ?auto_166219 ) ( ON ?auto_166217 ?auto_166218 ) ( not ( = ?auto_166219 ?auto_166218 ) ) ( not ( = ?auto_166219 ?auto_166217 ) ) ( not ( = ?auto_166219 ?auto_166216 ) ) ( not ( = ?auto_166219 ?auto_166215 ) ) ( not ( = ?auto_166218 ?auto_166217 ) ) ( not ( = ?auto_166218 ?auto_166216 ) ) ( not ( = ?auto_166218 ?auto_166215 ) ) ( not ( = ?auto_166211 ?auto_166219 ) ) ( not ( = ?auto_166211 ?auto_166218 ) ) ( not ( = ?auto_166212 ?auto_166219 ) ) ( not ( = ?auto_166212 ?auto_166218 ) ) ( not ( = ?auto_166213 ?auto_166219 ) ) ( not ( = ?auto_166213 ?auto_166218 ) ) ( not ( = ?auto_166214 ?auto_166219 ) ) ( not ( = ?auto_166214 ?auto_166218 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_166219 ?auto_166218 ?auto_166217 ?auto_166216 )
      ( MAKE-6PILE ?auto_166211 ?auto_166212 ?auto_166213 ?auto_166214 ?auto_166215 ?auto_166216 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_166220 - BLOCK
      ?auto_166221 - BLOCK
      ?auto_166222 - BLOCK
      ?auto_166223 - BLOCK
      ?auto_166224 - BLOCK
      ?auto_166225 - BLOCK
    )
    :vars
    (
      ?auto_166226 - BLOCK
      ?auto_166227 - BLOCK
      ?auto_166228 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166220 ) ( ON ?auto_166221 ?auto_166220 ) ( ON ?auto_166222 ?auto_166221 ) ( not ( = ?auto_166220 ?auto_166221 ) ) ( not ( = ?auto_166220 ?auto_166222 ) ) ( not ( = ?auto_166220 ?auto_166223 ) ) ( not ( = ?auto_166220 ?auto_166224 ) ) ( not ( = ?auto_166220 ?auto_166225 ) ) ( not ( = ?auto_166221 ?auto_166222 ) ) ( not ( = ?auto_166221 ?auto_166223 ) ) ( not ( = ?auto_166221 ?auto_166224 ) ) ( not ( = ?auto_166221 ?auto_166225 ) ) ( not ( = ?auto_166222 ?auto_166223 ) ) ( not ( = ?auto_166222 ?auto_166224 ) ) ( not ( = ?auto_166222 ?auto_166225 ) ) ( not ( = ?auto_166223 ?auto_166224 ) ) ( not ( = ?auto_166223 ?auto_166225 ) ) ( not ( = ?auto_166224 ?auto_166225 ) ) ( ON ?auto_166225 ?auto_166226 ) ( not ( = ?auto_166220 ?auto_166226 ) ) ( not ( = ?auto_166221 ?auto_166226 ) ) ( not ( = ?auto_166222 ?auto_166226 ) ) ( not ( = ?auto_166223 ?auto_166226 ) ) ( not ( = ?auto_166224 ?auto_166226 ) ) ( not ( = ?auto_166225 ?auto_166226 ) ) ( ON ?auto_166224 ?auto_166225 ) ( CLEAR ?auto_166224 ) ( ON-TABLE ?auto_166227 ) ( ON ?auto_166228 ?auto_166227 ) ( ON ?auto_166226 ?auto_166228 ) ( not ( = ?auto_166227 ?auto_166228 ) ) ( not ( = ?auto_166227 ?auto_166226 ) ) ( not ( = ?auto_166227 ?auto_166225 ) ) ( not ( = ?auto_166227 ?auto_166224 ) ) ( not ( = ?auto_166228 ?auto_166226 ) ) ( not ( = ?auto_166228 ?auto_166225 ) ) ( not ( = ?auto_166228 ?auto_166224 ) ) ( not ( = ?auto_166220 ?auto_166227 ) ) ( not ( = ?auto_166220 ?auto_166228 ) ) ( not ( = ?auto_166221 ?auto_166227 ) ) ( not ( = ?auto_166221 ?auto_166228 ) ) ( not ( = ?auto_166222 ?auto_166227 ) ) ( not ( = ?auto_166222 ?auto_166228 ) ) ( not ( = ?auto_166223 ?auto_166227 ) ) ( not ( = ?auto_166223 ?auto_166228 ) ) ( HOLDING ?auto_166223 ) ( CLEAR ?auto_166222 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_166220 ?auto_166221 ?auto_166222 ?auto_166223 )
      ( MAKE-6PILE ?auto_166220 ?auto_166221 ?auto_166222 ?auto_166223 ?auto_166224 ?auto_166225 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_166229 - BLOCK
      ?auto_166230 - BLOCK
      ?auto_166231 - BLOCK
      ?auto_166232 - BLOCK
      ?auto_166233 - BLOCK
      ?auto_166234 - BLOCK
    )
    :vars
    (
      ?auto_166237 - BLOCK
      ?auto_166236 - BLOCK
      ?auto_166235 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166229 ) ( ON ?auto_166230 ?auto_166229 ) ( ON ?auto_166231 ?auto_166230 ) ( not ( = ?auto_166229 ?auto_166230 ) ) ( not ( = ?auto_166229 ?auto_166231 ) ) ( not ( = ?auto_166229 ?auto_166232 ) ) ( not ( = ?auto_166229 ?auto_166233 ) ) ( not ( = ?auto_166229 ?auto_166234 ) ) ( not ( = ?auto_166230 ?auto_166231 ) ) ( not ( = ?auto_166230 ?auto_166232 ) ) ( not ( = ?auto_166230 ?auto_166233 ) ) ( not ( = ?auto_166230 ?auto_166234 ) ) ( not ( = ?auto_166231 ?auto_166232 ) ) ( not ( = ?auto_166231 ?auto_166233 ) ) ( not ( = ?auto_166231 ?auto_166234 ) ) ( not ( = ?auto_166232 ?auto_166233 ) ) ( not ( = ?auto_166232 ?auto_166234 ) ) ( not ( = ?auto_166233 ?auto_166234 ) ) ( ON ?auto_166234 ?auto_166237 ) ( not ( = ?auto_166229 ?auto_166237 ) ) ( not ( = ?auto_166230 ?auto_166237 ) ) ( not ( = ?auto_166231 ?auto_166237 ) ) ( not ( = ?auto_166232 ?auto_166237 ) ) ( not ( = ?auto_166233 ?auto_166237 ) ) ( not ( = ?auto_166234 ?auto_166237 ) ) ( ON ?auto_166233 ?auto_166234 ) ( ON-TABLE ?auto_166236 ) ( ON ?auto_166235 ?auto_166236 ) ( ON ?auto_166237 ?auto_166235 ) ( not ( = ?auto_166236 ?auto_166235 ) ) ( not ( = ?auto_166236 ?auto_166237 ) ) ( not ( = ?auto_166236 ?auto_166234 ) ) ( not ( = ?auto_166236 ?auto_166233 ) ) ( not ( = ?auto_166235 ?auto_166237 ) ) ( not ( = ?auto_166235 ?auto_166234 ) ) ( not ( = ?auto_166235 ?auto_166233 ) ) ( not ( = ?auto_166229 ?auto_166236 ) ) ( not ( = ?auto_166229 ?auto_166235 ) ) ( not ( = ?auto_166230 ?auto_166236 ) ) ( not ( = ?auto_166230 ?auto_166235 ) ) ( not ( = ?auto_166231 ?auto_166236 ) ) ( not ( = ?auto_166231 ?auto_166235 ) ) ( not ( = ?auto_166232 ?auto_166236 ) ) ( not ( = ?auto_166232 ?auto_166235 ) ) ( CLEAR ?auto_166231 ) ( ON ?auto_166232 ?auto_166233 ) ( CLEAR ?auto_166232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_166236 ?auto_166235 ?auto_166237 ?auto_166234 ?auto_166233 )
      ( MAKE-6PILE ?auto_166229 ?auto_166230 ?auto_166231 ?auto_166232 ?auto_166233 ?auto_166234 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_166238 - BLOCK
      ?auto_166239 - BLOCK
      ?auto_166240 - BLOCK
      ?auto_166241 - BLOCK
      ?auto_166242 - BLOCK
      ?auto_166243 - BLOCK
    )
    :vars
    (
      ?auto_166246 - BLOCK
      ?auto_166244 - BLOCK
      ?auto_166245 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166238 ) ( ON ?auto_166239 ?auto_166238 ) ( not ( = ?auto_166238 ?auto_166239 ) ) ( not ( = ?auto_166238 ?auto_166240 ) ) ( not ( = ?auto_166238 ?auto_166241 ) ) ( not ( = ?auto_166238 ?auto_166242 ) ) ( not ( = ?auto_166238 ?auto_166243 ) ) ( not ( = ?auto_166239 ?auto_166240 ) ) ( not ( = ?auto_166239 ?auto_166241 ) ) ( not ( = ?auto_166239 ?auto_166242 ) ) ( not ( = ?auto_166239 ?auto_166243 ) ) ( not ( = ?auto_166240 ?auto_166241 ) ) ( not ( = ?auto_166240 ?auto_166242 ) ) ( not ( = ?auto_166240 ?auto_166243 ) ) ( not ( = ?auto_166241 ?auto_166242 ) ) ( not ( = ?auto_166241 ?auto_166243 ) ) ( not ( = ?auto_166242 ?auto_166243 ) ) ( ON ?auto_166243 ?auto_166246 ) ( not ( = ?auto_166238 ?auto_166246 ) ) ( not ( = ?auto_166239 ?auto_166246 ) ) ( not ( = ?auto_166240 ?auto_166246 ) ) ( not ( = ?auto_166241 ?auto_166246 ) ) ( not ( = ?auto_166242 ?auto_166246 ) ) ( not ( = ?auto_166243 ?auto_166246 ) ) ( ON ?auto_166242 ?auto_166243 ) ( ON-TABLE ?auto_166244 ) ( ON ?auto_166245 ?auto_166244 ) ( ON ?auto_166246 ?auto_166245 ) ( not ( = ?auto_166244 ?auto_166245 ) ) ( not ( = ?auto_166244 ?auto_166246 ) ) ( not ( = ?auto_166244 ?auto_166243 ) ) ( not ( = ?auto_166244 ?auto_166242 ) ) ( not ( = ?auto_166245 ?auto_166246 ) ) ( not ( = ?auto_166245 ?auto_166243 ) ) ( not ( = ?auto_166245 ?auto_166242 ) ) ( not ( = ?auto_166238 ?auto_166244 ) ) ( not ( = ?auto_166238 ?auto_166245 ) ) ( not ( = ?auto_166239 ?auto_166244 ) ) ( not ( = ?auto_166239 ?auto_166245 ) ) ( not ( = ?auto_166240 ?auto_166244 ) ) ( not ( = ?auto_166240 ?auto_166245 ) ) ( not ( = ?auto_166241 ?auto_166244 ) ) ( not ( = ?auto_166241 ?auto_166245 ) ) ( ON ?auto_166241 ?auto_166242 ) ( CLEAR ?auto_166241 ) ( HOLDING ?auto_166240 ) ( CLEAR ?auto_166239 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_166238 ?auto_166239 ?auto_166240 )
      ( MAKE-6PILE ?auto_166238 ?auto_166239 ?auto_166240 ?auto_166241 ?auto_166242 ?auto_166243 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_166247 - BLOCK
      ?auto_166248 - BLOCK
      ?auto_166249 - BLOCK
      ?auto_166250 - BLOCK
      ?auto_166251 - BLOCK
      ?auto_166252 - BLOCK
    )
    :vars
    (
      ?auto_166253 - BLOCK
      ?auto_166254 - BLOCK
      ?auto_166255 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166247 ) ( ON ?auto_166248 ?auto_166247 ) ( not ( = ?auto_166247 ?auto_166248 ) ) ( not ( = ?auto_166247 ?auto_166249 ) ) ( not ( = ?auto_166247 ?auto_166250 ) ) ( not ( = ?auto_166247 ?auto_166251 ) ) ( not ( = ?auto_166247 ?auto_166252 ) ) ( not ( = ?auto_166248 ?auto_166249 ) ) ( not ( = ?auto_166248 ?auto_166250 ) ) ( not ( = ?auto_166248 ?auto_166251 ) ) ( not ( = ?auto_166248 ?auto_166252 ) ) ( not ( = ?auto_166249 ?auto_166250 ) ) ( not ( = ?auto_166249 ?auto_166251 ) ) ( not ( = ?auto_166249 ?auto_166252 ) ) ( not ( = ?auto_166250 ?auto_166251 ) ) ( not ( = ?auto_166250 ?auto_166252 ) ) ( not ( = ?auto_166251 ?auto_166252 ) ) ( ON ?auto_166252 ?auto_166253 ) ( not ( = ?auto_166247 ?auto_166253 ) ) ( not ( = ?auto_166248 ?auto_166253 ) ) ( not ( = ?auto_166249 ?auto_166253 ) ) ( not ( = ?auto_166250 ?auto_166253 ) ) ( not ( = ?auto_166251 ?auto_166253 ) ) ( not ( = ?auto_166252 ?auto_166253 ) ) ( ON ?auto_166251 ?auto_166252 ) ( ON-TABLE ?auto_166254 ) ( ON ?auto_166255 ?auto_166254 ) ( ON ?auto_166253 ?auto_166255 ) ( not ( = ?auto_166254 ?auto_166255 ) ) ( not ( = ?auto_166254 ?auto_166253 ) ) ( not ( = ?auto_166254 ?auto_166252 ) ) ( not ( = ?auto_166254 ?auto_166251 ) ) ( not ( = ?auto_166255 ?auto_166253 ) ) ( not ( = ?auto_166255 ?auto_166252 ) ) ( not ( = ?auto_166255 ?auto_166251 ) ) ( not ( = ?auto_166247 ?auto_166254 ) ) ( not ( = ?auto_166247 ?auto_166255 ) ) ( not ( = ?auto_166248 ?auto_166254 ) ) ( not ( = ?auto_166248 ?auto_166255 ) ) ( not ( = ?auto_166249 ?auto_166254 ) ) ( not ( = ?auto_166249 ?auto_166255 ) ) ( not ( = ?auto_166250 ?auto_166254 ) ) ( not ( = ?auto_166250 ?auto_166255 ) ) ( ON ?auto_166250 ?auto_166251 ) ( CLEAR ?auto_166248 ) ( ON ?auto_166249 ?auto_166250 ) ( CLEAR ?auto_166249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_166254 ?auto_166255 ?auto_166253 ?auto_166252 ?auto_166251 ?auto_166250 )
      ( MAKE-6PILE ?auto_166247 ?auto_166248 ?auto_166249 ?auto_166250 ?auto_166251 ?auto_166252 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_166256 - BLOCK
      ?auto_166257 - BLOCK
      ?auto_166258 - BLOCK
      ?auto_166259 - BLOCK
      ?auto_166260 - BLOCK
      ?auto_166261 - BLOCK
    )
    :vars
    (
      ?auto_166263 - BLOCK
      ?auto_166264 - BLOCK
      ?auto_166262 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166256 ) ( not ( = ?auto_166256 ?auto_166257 ) ) ( not ( = ?auto_166256 ?auto_166258 ) ) ( not ( = ?auto_166256 ?auto_166259 ) ) ( not ( = ?auto_166256 ?auto_166260 ) ) ( not ( = ?auto_166256 ?auto_166261 ) ) ( not ( = ?auto_166257 ?auto_166258 ) ) ( not ( = ?auto_166257 ?auto_166259 ) ) ( not ( = ?auto_166257 ?auto_166260 ) ) ( not ( = ?auto_166257 ?auto_166261 ) ) ( not ( = ?auto_166258 ?auto_166259 ) ) ( not ( = ?auto_166258 ?auto_166260 ) ) ( not ( = ?auto_166258 ?auto_166261 ) ) ( not ( = ?auto_166259 ?auto_166260 ) ) ( not ( = ?auto_166259 ?auto_166261 ) ) ( not ( = ?auto_166260 ?auto_166261 ) ) ( ON ?auto_166261 ?auto_166263 ) ( not ( = ?auto_166256 ?auto_166263 ) ) ( not ( = ?auto_166257 ?auto_166263 ) ) ( not ( = ?auto_166258 ?auto_166263 ) ) ( not ( = ?auto_166259 ?auto_166263 ) ) ( not ( = ?auto_166260 ?auto_166263 ) ) ( not ( = ?auto_166261 ?auto_166263 ) ) ( ON ?auto_166260 ?auto_166261 ) ( ON-TABLE ?auto_166264 ) ( ON ?auto_166262 ?auto_166264 ) ( ON ?auto_166263 ?auto_166262 ) ( not ( = ?auto_166264 ?auto_166262 ) ) ( not ( = ?auto_166264 ?auto_166263 ) ) ( not ( = ?auto_166264 ?auto_166261 ) ) ( not ( = ?auto_166264 ?auto_166260 ) ) ( not ( = ?auto_166262 ?auto_166263 ) ) ( not ( = ?auto_166262 ?auto_166261 ) ) ( not ( = ?auto_166262 ?auto_166260 ) ) ( not ( = ?auto_166256 ?auto_166264 ) ) ( not ( = ?auto_166256 ?auto_166262 ) ) ( not ( = ?auto_166257 ?auto_166264 ) ) ( not ( = ?auto_166257 ?auto_166262 ) ) ( not ( = ?auto_166258 ?auto_166264 ) ) ( not ( = ?auto_166258 ?auto_166262 ) ) ( not ( = ?auto_166259 ?auto_166264 ) ) ( not ( = ?auto_166259 ?auto_166262 ) ) ( ON ?auto_166259 ?auto_166260 ) ( ON ?auto_166258 ?auto_166259 ) ( CLEAR ?auto_166258 ) ( HOLDING ?auto_166257 ) ( CLEAR ?auto_166256 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_166256 ?auto_166257 )
      ( MAKE-6PILE ?auto_166256 ?auto_166257 ?auto_166258 ?auto_166259 ?auto_166260 ?auto_166261 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_166265 - BLOCK
      ?auto_166266 - BLOCK
      ?auto_166267 - BLOCK
      ?auto_166268 - BLOCK
      ?auto_166269 - BLOCK
      ?auto_166270 - BLOCK
    )
    :vars
    (
      ?auto_166273 - BLOCK
      ?auto_166271 - BLOCK
      ?auto_166272 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166265 ) ( not ( = ?auto_166265 ?auto_166266 ) ) ( not ( = ?auto_166265 ?auto_166267 ) ) ( not ( = ?auto_166265 ?auto_166268 ) ) ( not ( = ?auto_166265 ?auto_166269 ) ) ( not ( = ?auto_166265 ?auto_166270 ) ) ( not ( = ?auto_166266 ?auto_166267 ) ) ( not ( = ?auto_166266 ?auto_166268 ) ) ( not ( = ?auto_166266 ?auto_166269 ) ) ( not ( = ?auto_166266 ?auto_166270 ) ) ( not ( = ?auto_166267 ?auto_166268 ) ) ( not ( = ?auto_166267 ?auto_166269 ) ) ( not ( = ?auto_166267 ?auto_166270 ) ) ( not ( = ?auto_166268 ?auto_166269 ) ) ( not ( = ?auto_166268 ?auto_166270 ) ) ( not ( = ?auto_166269 ?auto_166270 ) ) ( ON ?auto_166270 ?auto_166273 ) ( not ( = ?auto_166265 ?auto_166273 ) ) ( not ( = ?auto_166266 ?auto_166273 ) ) ( not ( = ?auto_166267 ?auto_166273 ) ) ( not ( = ?auto_166268 ?auto_166273 ) ) ( not ( = ?auto_166269 ?auto_166273 ) ) ( not ( = ?auto_166270 ?auto_166273 ) ) ( ON ?auto_166269 ?auto_166270 ) ( ON-TABLE ?auto_166271 ) ( ON ?auto_166272 ?auto_166271 ) ( ON ?auto_166273 ?auto_166272 ) ( not ( = ?auto_166271 ?auto_166272 ) ) ( not ( = ?auto_166271 ?auto_166273 ) ) ( not ( = ?auto_166271 ?auto_166270 ) ) ( not ( = ?auto_166271 ?auto_166269 ) ) ( not ( = ?auto_166272 ?auto_166273 ) ) ( not ( = ?auto_166272 ?auto_166270 ) ) ( not ( = ?auto_166272 ?auto_166269 ) ) ( not ( = ?auto_166265 ?auto_166271 ) ) ( not ( = ?auto_166265 ?auto_166272 ) ) ( not ( = ?auto_166266 ?auto_166271 ) ) ( not ( = ?auto_166266 ?auto_166272 ) ) ( not ( = ?auto_166267 ?auto_166271 ) ) ( not ( = ?auto_166267 ?auto_166272 ) ) ( not ( = ?auto_166268 ?auto_166271 ) ) ( not ( = ?auto_166268 ?auto_166272 ) ) ( ON ?auto_166268 ?auto_166269 ) ( ON ?auto_166267 ?auto_166268 ) ( CLEAR ?auto_166265 ) ( ON ?auto_166266 ?auto_166267 ) ( CLEAR ?auto_166266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_166271 ?auto_166272 ?auto_166273 ?auto_166270 ?auto_166269 ?auto_166268 ?auto_166267 )
      ( MAKE-6PILE ?auto_166265 ?auto_166266 ?auto_166267 ?auto_166268 ?auto_166269 ?auto_166270 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_166274 - BLOCK
      ?auto_166275 - BLOCK
      ?auto_166276 - BLOCK
      ?auto_166277 - BLOCK
      ?auto_166278 - BLOCK
      ?auto_166279 - BLOCK
    )
    :vars
    (
      ?auto_166281 - BLOCK
      ?auto_166282 - BLOCK
      ?auto_166280 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166274 ?auto_166275 ) ) ( not ( = ?auto_166274 ?auto_166276 ) ) ( not ( = ?auto_166274 ?auto_166277 ) ) ( not ( = ?auto_166274 ?auto_166278 ) ) ( not ( = ?auto_166274 ?auto_166279 ) ) ( not ( = ?auto_166275 ?auto_166276 ) ) ( not ( = ?auto_166275 ?auto_166277 ) ) ( not ( = ?auto_166275 ?auto_166278 ) ) ( not ( = ?auto_166275 ?auto_166279 ) ) ( not ( = ?auto_166276 ?auto_166277 ) ) ( not ( = ?auto_166276 ?auto_166278 ) ) ( not ( = ?auto_166276 ?auto_166279 ) ) ( not ( = ?auto_166277 ?auto_166278 ) ) ( not ( = ?auto_166277 ?auto_166279 ) ) ( not ( = ?auto_166278 ?auto_166279 ) ) ( ON ?auto_166279 ?auto_166281 ) ( not ( = ?auto_166274 ?auto_166281 ) ) ( not ( = ?auto_166275 ?auto_166281 ) ) ( not ( = ?auto_166276 ?auto_166281 ) ) ( not ( = ?auto_166277 ?auto_166281 ) ) ( not ( = ?auto_166278 ?auto_166281 ) ) ( not ( = ?auto_166279 ?auto_166281 ) ) ( ON ?auto_166278 ?auto_166279 ) ( ON-TABLE ?auto_166282 ) ( ON ?auto_166280 ?auto_166282 ) ( ON ?auto_166281 ?auto_166280 ) ( not ( = ?auto_166282 ?auto_166280 ) ) ( not ( = ?auto_166282 ?auto_166281 ) ) ( not ( = ?auto_166282 ?auto_166279 ) ) ( not ( = ?auto_166282 ?auto_166278 ) ) ( not ( = ?auto_166280 ?auto_166281 ) ) ( not ( = ?auto_166280 ?auto_166279 ) ) ( not ( = ?auto_166280 ?auto_166278 ) ) ( not ( = ?auto_166274 ?auto_166282 ) ) ( not ( = ?auto_166274 ?auto_166280 ) ) ( not ( = ?auto_166275 ?auto_166282 ) ) ( not ( = ?auto_166275 ?auto_166280 ) ) ( not ( = ?auto_166276 ?auto_166282 ) ) ( not ( = ?auto_166276 ?auto_166280 ) ) ( not ( = ?auto_166277 ?auto_166282 ) ) ( not ( = ?auto_166277 ?auto_166280 ) ) ( ON ?auto_166277 ?auto_166278 ) ( ON ?auto_166276 ?auto_166277 ) ( ON ?auto_166275 ?auto_166276 ) ( CLEAR ?auto_166275 ) ( HOLDING ?auto_166274 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_166274 )
      ( MAKE-6PILE ?auto_166274 ?auto_166275 ?auto_166276 ?auto_166277 ?auto_166278 ?auto_166279 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_166283 - BLOCK
      ?auto_166284 - BLOCK
      ?auto_166285 - BLOCK
      ?auto_166286 - BLOCK
      ?auto_166287 - BLOCK
      ?auto_166288 - BLOCK
    )
    :vars
    (
      ?auto_166290 - BLOCK
      ?auto_166289 - BLOCK
      ?auto_166291 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166283 ?auto_166284 ) ) ( not ( = ?auto_166283 ?auto_166285 ) ) ( not ( = ?auto_166283 ?auto_166286 ) ) ( not ( = ?auto_166283 ?auto_166287 ) ) ( not ( = ?auto_166283 ?auto_166288 ) ) ( not ( = ?auto_166284 ?auto_166285 ) ) ( not ( = ?auto_166284 ?auto_166286 ) ) ( not ( = ?auto_166284 ?auto_166287 ) ) ( not ( = ?auto_166284 ?auto_166288 ) ) ( not ( = ?auto_166285 ?auto_166286 ) ) ( not ( = ?auto_166285 ?auto_166287 ) ) ( not ( = ?auto_166285 ?auto_166288 ) ) ( not ( = ?auto_166286 ?auto_166287 ) ) ( not ( = ?auto_166286 ?auto_166288 ) ) ( not ( = ?auto_166287 ?auto_166288 ) ) ( ON ?auto_166288 ?auto_166290 ) ( not ( = ?auto_166283 ?auto_166290 ) ) ( not ( = ?auto_166284 ?auto_166290 ) ) ( not ( = ?auto_166285 ?auto_166290 ) ) ( not ( = ?auto_166286 ?auto_166290 ) ) ( not ( = ?auto_166287 ?auto_166290 ) ) ( not ( = ?auto_166288 ?auto_166290 ) ) ( ON ?auto_166287 ?auto_166288 ) ( ON-TABLE ?auto_166289 ) ( ON ?auto_166291 ?auto_166289 ) ( ON ?auto_166290 ?auto_166291 ) ( not ( = ?auto_166289 ?auto_166291 ) ) ( not ( = ?auto_166289 ?auto_166290 ) ) ( not ( = ?auto_166289 ?auto_166288 ) ) ( not ( = ?auto_166289 ?auto_166287 ) ) ( not ( = ?auto_166291 ?auto_166290 ) ) ( not ( = ?auto_166291 ?auto_166288 ) ) ( not ( = ?auto_166291 ?auto_166287 ) ) ( not ( = ?auto_166283 ?auto_166289 ) ) ( not ( = ?auto_166283 ?auto_166291 ) ) ( not ( = ?auto_166284 ?auto_166289 ) ) ( not ( = ?auto_166284 ?auto_166291 ) ) ( not ( = ?auto_166285 ?auto_166289 ) ) ( not ( = ?auto_166285 ?auto_166291 ) ) ( not ( = ?auto_166286 ?auto_166289 ) ) ( not ( = ?auto_166286 ?auto_166291 ) ) ( ON ?auto_166286 ?auto_166287 ) ( ON ?auto_166285 ?auto_166286 ) ( ON ?auto_166284 ?auto_166285 ) ( ON ?auto_166283 ?auto_166284 ) ( CLEAR ?auto_166283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_166289 ?auto_166291 ?auto_166290 ?auto_166288 ?auto_166287 ?auto_166286 ?auto_166285 ?auto_166284 )
      ( MAKE-6PILE ?auto_166283 ?auto_166284 ?auto_166285 ?auto_166286 ?auto_166287 ?auto_166288 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_166294 - BLOCK
      ?auto_166295 - BLOCK
    )
    :vars
    (
      ?auto_166296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166296 ?auto_166295 ) ( CLEAR ?auto_166296 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_166294 ) ( ON ?auto_166295 ?auto_166294 ) ( not ( = ?auto_166294 ?auto_166295 ) ) ( not ( = ?auto_166294 ?auto_166296 ) ) ( not ( = ?auto_166295 ?auto_166296 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166296 ?auto_166295 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_166297 - BLOCK
      ?auto_166298 - BLOCK
    )
    :vars
    (
      ?auto_166299 - BLOCK
      ?auto_166300 - BLOCK
      ?auto_166301 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166299 ?auto_166298 ) ( CLEAR ?auto_166299 ) ( ON-TABLE ?auto_166297 ) ( ON ?auto_166298 ?auto_166297 ) ( not ( = ?auto_166297 ?auto_166298 ) ) ( not ( = ?auto_166297 ?auto_166299 ) ) ( not ( = ?auto_166298 ?auto_166299 ) ) ( HOLDING ?auto_166300 ) ( CLEAR ?auto_166301 ) ( not ( = ?auto_166297 ?auto_166300 ) ) ( not ( = ?auto_166297 ?auto_166301 ) ) ( not ( = ?auto_166298 ?auto_166300 ) ) ( not ( = ?auto_166298 ?auto_166301 ) ) ( not ( = ?auto_166299 ?auto_166300 ) ) ( not ( = ?auto_166299 ?auto_166301 ) ) ( not ( = ?auto_166300 ?auto_166301 ) ) )
    :subtasks
    ( ( !STACK ?auto_166300 ?auto_166301 )
      ( MAKE-2PILE ?auto_166297 ?auto_166298 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_166302 - BLOCK
      ?auto_166303 - BLOCK
    )
    :vars
    (
      ?auto_166304 - BLOCK
      ?auto_166305 - BLOCK
      ?auto_166306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166304 ?auto_166303 ) ( ON-TABLE ?auto_166302 ) ( ON ?auto_166303 ?auto_166302 ) ( not ( = ?auto_166302 ?auto_166303 ) ) ( not ( = ?auto_166302 ?auto_166304 ) ) ( not ( = ?auto_166303 ?auto_166304 ) ) ( CLEAR ?auto_166305 ) ( not ( = ?auto_166302 ?auto_166306 ) ) ( not ( = ?auto_166302 ?auto_166305 ) ) ( not ( = ?auto_166303 ?auto_166306 ) ) ( not ( = ?auto_166303 ?auto_166305 ) ) ( not ( = ?auto_166304 ?auto_166306 ) ) ( not ( = ?auto_166304 ?auto_166305 ) ) ( not ( = ?auto_166306 ?auto_166305 ) ) ( ON ?auto_166306 ?auto_166304 ) ( CLEAR ?auto_166306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_166302 ?auto_166303 ?auto_166304 )
      ( MAKE-2PILE ?auto_166302 ?auto_166303 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_166307 - BLOCK
      ?auto_166308 - BLOCK
    )
    :vars
    (
      ?auto_166311 - BLOCK
      ?auto_166310 - BLOCK
      ?auto_166309 - BLOCK
      ?auto_166315 - BLOCK
      ?auto_166313 - BLOCK
      ?auto_166312 - BLOCK
      ?auto_166314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166311 ?auto_166308 ) ( ON-TABLE ?auto_166307 ) ( ON ?auto_166308 ?auto_166307 ) ( not ( = ?auto_166307 ?auto_166308 ) ) ( not ( = ?auto_166307 ?auto_166311 ) ) ( not ( = ?auto_166308 ?auto_166311 ) ) ( not ( = ?auto_166307 ?auto_166310 ) ) ( not ( = ?auto_166307 ?auto_166309 ) ) ( not ( = ?auto_166308 ?auto_166310 ) ) ( not ( = ?auto_166308 ?auto_166309 ) ) ( not ( = ?auto_166311 ?auto_166310 ) ) ( not ( = ?auto_166311 ?auto_166309 ) ) ( not ( = ?auto_166310 ?auto_166309 ) ) ( ON ?auto_166310 ?auto_166311 ) ( CLEAR ?auto_166310 ) ( HOLDING ?auto_166309 ) ( CLEAR ?auto_166315 ) ( ON-TABLE ?auto_166313 ) ( ON ?auto_166312 ?auto_166313 ) ( ON ?auto_166314 ?auto_166312 ) ( ON ?auto_166315 ?auto_166314 ) ( not ( = ?auto_166313 ?auto_166312 ) ) ( not ( = ?auto_166313 ?auto_166314 ) ) ( not ( = ?auto_166313 ?auto_166315 ) ) ( not ( = ?auto_166313 ?auto_166309 ) ) ( not ( = ?auto_166312 ?auto_166314 ) ) ( not ( = ?auto_166312 ?auto_166315 ) ) ( not ( = ?auto_166312 ?auto_166309 ) ) ( not ( = ?auto_166314 ?auto_166315 ) ) ( not ( = ?auto_166314 ?auto_166309 ) ) ( not ( = ?auto_166315 ?auto_166309 ) ) ( not ( = ?auto_166307 ?auto_166315 ) ) ( not ( = ?auto_166307 ?auto_166313 ) ) ( not ( = ?auto_166307 ?auto_166312 ) ) ( not ( = ?auto_166307 ?auto_166314 ) ) ( not ( = ?auto_166308 ?auto_166315 ) ) ( not ( = ?auto_166308 ?auto_166313 ) ) ( not ( = ?auto_166308 ?auto_166312 ) ) ( not ( = ?auto_166308 ?auto_166314 ) ) ( not ( = ?auto_166311 ?auto_166315 ) ) ( not ( = ?auto_166311 ?auto_166313 ) ) ( not ( = ?auto_166311 ?auto_166312 ) ) ( not ( = ?auto_166311 ?auto_166314 ) ) ( not ( = ?auto_166310 ?auto_166315 ) ) ( not ( = ?auto_166310 ?auto_166313 ) ) ( not ( = ?auto_166310 ?auto_166312 ) ) ( not ( = ?auto_166310 ?auto_166314 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_166313 ?auto_166312 ?auto_166314 ?auto_166315 ?auto_166309 )
      ( MAKE-2PILE ?auto_166307 ?auto_166308 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_166316 - BLOCK
      ?auto_166317 - BLOCK
    )
    :vars
    (
      ?auto_166324 - BLOCK
      ?auto_166318 - BLOCK
      ?auto_166322 - BLOCK
      ?auto_166323 - BLOCK
      ?auto_166320 - BLOCK
      ?auto_166319 - BLOCK
      ?auto_166321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166324 ?auto_166317 ) ( ON-TABLE ?auto_166316 ) ( ON ?auto_166317 ?auto_166316 ) ( not ( = ?auto_166316 ?auto_166317 ) ) ( not ( = ?auto_166316 ?auto_166324 ) ) ( not ( = ?auto_166317 ?auto_166324 ) ) ( not ( = ?auto_166316 ?auto_166318 ) ) ( not ( = ?auto_166316 ?auto_166322 ) ) ( not ( = ?auto_166317 ?auto_166318 ) ) ( not ( = ?auto_166317 ?auto_166322 ) ) ( not ( = ?auto_166324 ?auto_166318 ) ) ( not ( = ?auto_166324 ?auto_166322 ) ) ( not ( = ?auto_166318 ?auto_166322 ) ) ( ON ?auto_166318 ?auto_166324 ) ( CLEAR ?auto_166323 ) ( ON-TABLE ?auto_166320 ) ( ON ?auto_166319 ?auto_166320 ) ( ON ?auto_166321 ?auto_166319 ) ( ON ?auto_166323 ?auto_166321 ) ( not ( = ?auto_166320 ?auto_166319 ) ) ( not ( = ?auto_166320 ?auto_166321 ) ) ( not ( = ?auto_166320 ?auto_166323 ) ) ( not ( = ?auto_166320 ?auto_166322 ) ) ( not ( = ?auto_166319 ?auto_166321 ) ) ( not ( = ?auto_166319 ?auto_166323 ) ) ( not ( = ?auto_166319 ?auto_166322 ) ) ( not ( = ?auto_166321 ?auto_166323 ) ) ( not ( = ?auto_166321 ?auto_166322 ) ) ( not ( = ?auto_166323 ?auto_166322 ) ) ( not ( = ?auto_166316 ?auto_166323 ) ) ( not ( = ?auto_166316 ?auto_166320 ) ) ( not ( = ?auto_166316 ?auto_166319 ) ) ( not ( = ?auto_166316 ?auto_166321 ) ) ( not ( = ?auto_166317 ?auto_166323 ) ) ( not ( = ?auto_166317 ?auto_166320 ) ) ( not ( = ?auto_166317 ?auto_166319 ) ) ( not ( = ?auto_166317 ?auto_166321 ) ) ( not ( = ?auto_166324 ?auto_166323 ) ) ( not ( = ?auto_166324 ?auto_166320 ) ) ( not ( = ?auto_166324 ?auto_166319 ) ) ( not ( = ?auto_166324 ?auto_166321 ) ) ( not ( = ?auto_166318 ?auto_166323 ) ) ( not ( = ?auto_166318 ?auto_166320 ) ) ( not ( = ?auto_166318 ?auto_166319 ) ) ( not ( = ?auto_166318 ?auto_166321 ) ) ( ON ?auto_166322 ?auto_166318 ) ( CLEAR ?auto_166322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_166316 ?auto_166317 ?auto_166324 ?auto_166318 )
      ( MAKE-2PILE ?auto_166316 ?auto_166317 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_166325 - BLOCK
      ?auto_166326 - BLOCK
    )
    :vars
    (
      ?auto_166333 - BLOCK
      ?auto_166331 - BLOCK
      ?auto_166332 - BLOCK
      ?auto_166327 - BLOCK
      ?auto_166330 - BLOCK
      ?auto_166329 - BLOCK
      ?auto_166328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166333 ?auto_166326 ) ( ON-TABLE ?auto_166325 ) ( ON ?auto_166326 ?auto_166325 ) ( not ( = ?auto_166325 ?auto_166326 ) ) ( not ( = ?auto_166325 ?auto_166333 ) ) ( not ( = ?auto_166326 ?auto_166333 ) ) ( not ( = ?auto_166325 ?auto_166331 ) ) ( not ( = ?auto_166325 ?auto_166332 ) ) ( not ( = ?auto_166326 ?auto_166331 ) ) ( not ( = ?auto_166326 ?auto_166332 ) ) ( not ( = ?auto_166333 ?auto_166331 ) ) ( not ( = ?auto_166333 ?auto_166332 ) ) ( not ( = ?auto_166331 ?auto_166332 ) ) ( ON ?auto_166331 ?auto_166333 ) ( ON-TABLE ?auto_166327 ) ( ON ?auto_166330 ?auto_166327 ) ( ON ?auto_166329 ?auto_166330 ) ( not ( = ?auto_166327 ?auto_166330 ) ) ( not ( = ?auto_166327 ?auto_166329 ) ) ( not ( = ?auto_166327 ?auto_166328 ) ) ( not ( = ?auto_166327 ?auto_166332 ) ) ( not ( = ?auto_166330 ?auto_166329 ) ) ( not ( = ?auto_166330 ?auto_166328 ) ) ( not ( = ?auto_166330 ?auto_166332 ) ) ( not ( = ?auto_166329 ?auto_166328 ) ) ( not ( = ?auto_166329 ?auto_166332 ) ) ( not ( = ?auto_166328 ?auto_166332 ) ) ( not ( = ?auto_166325 ?auto_166328 ) ) ( not ( = ?auto_166325 ?auto_166327 ) ) ( not ( = ?auto_166325 ?auto_166330 ) ) ( not ( = ?auto_166325 ?auto_166329 ) ) ( not ( = ?auto_166326 ?auto_166328 ) ) ( not ( = ?auto_166326 ?auto_166327 ) ) ( not ( = ?auto_166326 ?auto_166330 ) ) ( not ( = ?auto_166326 ?auto_166329 ) ) ( not ( = ?auto_166333 ?auto_166328 ) ) ( not ( = ?auto_166333 ?auto_166327 ) ) ( not ( = ?auto_166333 ?auto_166330 ) ) ( not ( = ?auto_166333 ?auto_166329 ) ) ( not ( = ?auto_166331 ?auto_166328 ) ) ( not ( = ?auto_166331 ?auto_166327 ) ) ( not ( = ?auto_166331 ?auto_166330 ) ) ( not ( = ?auto_166331 ?auto_166329 ) ) ( ON ?auto_166332 ?auto_166331 ) ( CLEAR ?auto_166332 ) ( HOLDING ?auto_166328 ) ( CLEAR ?auto_166329 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_166327 ?auto_166330 ?auto_166329 ?auto_166328 )
      ( MAKE-2PILE ?auto_166325 ?auto_166326 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_166334 - BLOCK
      ?auto_166335 - BLOCK
    )
    :vars
    (
      ?auto_166338 - BLOCK
      ?auto_166341 - BLOCK
      ?auto_166336 - BLOCK
      ?auto_166342 - BLOCK
      ?auto_166339 - BLOCK
      ?auto_166340 - BLOCK
      ?auto_166337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166338 ?auto_166335 ) ( ON-TABLE ?auto_166334 ) ( ON ?auto_166335 ?auto_166334 ) ( not ( = ?auto_166334 ?auto_166335 ) ) ( not ( = ?auto_166334 ?auto_166338 ) ) ( not ( = ?auto_166335 ?auto_166338 ) ) ( not ( = ?auto_166334 ?auto_166341 ) ) ( not ( = ?auto_166334 ?auto_166336 ) ) ( not ( = ?auto_166335 ?auto_166341 ) ) ( not ( = ?auto_166335 ?auto_166336 ) ) ( not ( = ?auto_166338 ?auto_166341 ) ) ( not ( = ?auto_166338 ?auto_166336 ) ) ( not ( = ?auto_166341 ?auto_166336 ) ) ( ON ?auto_166341 ?auto_166338 ) ( ON-TABLE ?auto_166342 ) ( ON ?auto_166339 ?auto_166342 ) ( ON ?auto_166340 ?auto_166339 ) ( not ( = ?auto_166342 ?auto_166339 ) ) ( not ( = ?auto_166342 ?auto_166340 ) ) ( not ( = ?auto_166342 ?auto_166337 ) ) ( not ( = ?auto_166342 ?auto_166336 ) ) ( not ( = ?auto_166339 ?auto_166340 ) ) ( not ( = ?auto_166339 ?auto_166337 ) ) ( not ( = ?auto_166339 ?auto_166336 ) ) ( not ( = ?auto_166340 ?auto_166337 ) ) ( not ( = ?auto_166340 ?auto_166336 ) ) ( not ( = ?auto_166337 ?auto_166336 ) ) ( not ( = ?auto_166334 ?auto_166337 ) ) ( not ( = ?auto_166334 ?auto_166342 ) ) ( not ( = ?auto_166334 ?auto_166339 ) ) ( not ( = ?auto_166334 ?auto_166340 ) ) ( not ( = ?auto_166335 ?auto_166337 ) ) ( not ( = ?auto_166335 ?auto_166342 ) ) ( not ( = ?auto_166335 ?auto_166339 ) ) ( not ( = ?auto_166335 ?auto_166340 ) ) ( not ( = ?auto_166338 ?auto_166337 ) ) ( not ( = ?auto_166338 ?auto_166342 ) ) ( not ( = ?auto_166338 ?auto_166339 ) ) ( not ( = ?auto_166338 ?auto_166340 ) ) ( not ( = ?auto_166341 ?auto_166337 ) ) ( not ( = ?auto_166341 ?auto_166342 ) ) ( not ( = ?auto_166341 ?auto_166339 ) ) ( not ( = ?auto_166341 ?auto_166340 ) ) ( ON ?auto_166336 ?auto_166341 ) ( CLEAR ?auto_166340 ) ( ON ?auto_166337 ?auto_166336 ) ( CLEAR ?auto_166337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_166334 ?auto_166335 ?auto_166338 ?auto_166341 ?auto_166336 )
      ( MAKE-2PILE ?auto_166334 ?auto_166335 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_166343 - BLOCK
      ?auto_166344 - BLOCK
    )
    :vars
    (
      ?auto_166346 - BLOCK
      ?auto_166350 - BLOCK
      ?auto_166348 - BLOCK
      ?auto_166345 - BLOCK
      ?auto_166349 - BLOCK
      ?auto_166347 - BLOCK
      ?auto_166351 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166346 ?auto_166344 ) ( ON-TABLE ?auto_166343 ) ( ON ?auto_166344 ?auto_166343 ) ( not ( = ?auto_166343 ?auto_166344 ) ) ( not ( = ?auto_166343 ?auto_166346 ) ) ( not ( = ?auto_166344 ?auto_166346 ) ) ( not ( = ?auto_166343 ?auto_166350 ) ) ( not ( = ?auto_166343 ?auto_166348 ) ) ( not ( = ?auto_166344 ?auto_166350 ) ) ( not ( = ?auto_166344 ?auto_166348 ) ) ( not ( = ?auto_166346 ?auto_166350 ) ) ( not ( = ?auto_166346 ?auto_166348 ) ) ( not ( = ?auto_166350 ?auto_166348 ) ) ( ON ?auto_166350 ?auto_166346 ) ( ON-TABLE ?auto_166345 ) ( ON ?auto_166349 ?auto_166345 ) ( not ( = ?auto_166345 ?auto_166349 ) ) ( not ( = ?auto_166345 ?auto_166347 ) ) ( not ( = ?auto_166345 ?auto_166351 ) ) ( not ( = ?auto_166345 ?auto_166348 ) ) ( not ( = ?auto_166349 ?auto_166347 ) ) ( not ( = ?auto_166349 ?auto_166351 ) ) ( not ( = ?auto_166349 ?auto_166348 ) ) ( not ( = ?auto_166347 ?auto_166351 ) ) ( not ( = ?auto_166347 ?auto_166348 ) ) ( not ( = ?auto_166351 ?auto_166348 ) ) ( not ( = ?auto_166343 ?auto_166351 ) ) ( not ( = ?auto_166343 ?auto_166345 ) ) ( not ( = ?auto_166343 ?auto_166349 ) ) ( not ( = ?auto_166343 ?auto_166347 ) ) ( not ( = ?auto_166344 ?auto_166351 ) ) ( not ( = ?auto_166344 ?auto_166345 ) ) ( not ( = ?auto_166344 ?auto_166349 ) ) ( not ( = ?auto_166344 ?auto_166347 ) ) ( not ( = ?auto_166346 ?auto_166351 ) ) ( not ( = ?auto_166346 ?auto_166345 ) ) ( not ( = ?auto_166346 ?auto_166349 ) ) ( not ( = ?auto_166346 ?auto_166347 ) ) ( not ( = ?auto_166350 ?auto_166351 ) ) ( not ( = ?auto_166350 ?auto_166345 ) ) ( not ( = ?auto_166350 ?auto_166349 ) ) ( not ( = ?auto_166350 ?auto_166347 ) ) ( ON ?auto_166348 ?auto_166350 ) ( ON ?auto_166351 ?auto_166348 ) ( CLEAR ?auto_166351 ) ( HOLDING ?auto_166347 ) ( CLEAR ?auto_166349 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_166345 ?auto_166349 ?auto_166347 )
      ( MAKE-2PILE ?auto_166343 ?auto_166344 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_166352 - BLOCK
      ?auto_166353 - BLOCK
    )
    :vars
    (
      ?auto_166358 - BLOCK
      ?auto_166354 - BLOCK
      ?auto_166360 - BLOCK
      ?auto_166359 - BLOCK
      ?auto_166357 - BLOCK
      ?auto_166355 - BLOCK
      ?auto_166356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166358 ?auto_166353 ) ( ON-TABLE ?auto_166352 ) ( ON ?auto_166353 ?auto_166352 ) ( not ( = ?auto_166352 ?auto_166353 ) ) ( not ( = ?auto_166352 ?auto_166358 ) ) ( not ( = ?auto_166353 ?auto_166358 ) ) ( not ( = ?auto_166352 ?auto_166354 ) ) ( not ( = ?auto_166352 ?auto_166360 ) ) ( not ( = ?auto_166353 ?auto_166354 ) ) ( not ( = ?auto_166353 ?auto_166360 ) ) ( not ( = ?auto_166358 ?auto_166354 ) ) ( not ( = ?auto_166358 ?auto_166360 ) ) ( not ( = ?auto_166354 ?auto_166360 ) ) ( ON ?auto_166354 ?auto_166358 ) ( ON-TABLE ?auto_166359 ) ( ON ?auto_166357 ?auto_166359 ) ( not ( = ?auto_166359 ?auto_166357 ) ) ( not ( = ?auto_166359 ?auto_166355 ) ) ( not ( = ?auto_166359 ?auto_166356 ) ) ( not ( = ?auto_166359 ?auto_166360 ) ) ( not ( = ?auto_166357 ?auto_166355 ) ) ( not ( = ?auto_166357 ?auto_166356 ) ) ( not ( = ?auto_166357 ?auto_166360 ) ) ( not ( = ?auto_166355 ?auto_166356 ) ) ( not ( = ?auto_166355 ?auto_166360 ) ) ( not ( = ?auto_166356 ?auto_166360 ) ) ( not ( = ?auto_166352 ?auto_166356 ) ) ( not ( = ?auto_166352 ?auto_166359 ) ) ( not ( = ?auto_166352 ?auto_166357 ) ) ( not ( = ?auto_166352 ?auto_166355 ) ) ( not ( = ?auto_166353 ?auto_166356 ) ) ( not ( = ?auto_166353 ?auto_166359 ) ) ( not ( = ?auto_166353 ?auto_166357 ) ) ( not ( = ?auto_166353 ?auto_166355 ) ) ( not ( = ?auto_166358 ?auto_166356 ) ) ( not ( = ?auto_166358 ?auto_166359 ) ) ( not ( = ?auto_166358 ?auto_166357 ) ) ( not ( = ?auto_166358 ?auto_166355 ) ) ( not ( = ?auto_166354 ?auto_166356 ) ) ( not ( = ?auto_166354 ?auto_166359 ) ) ( not ( = ?auto_166354 ?auto_166357 ) ) ( not ( = ?auto_166354 ?auto_166355 ) ) ( ON ?auto_166360 ?auto_166354 ) ( ON ?auto_166356 ?auto_166360 ) ( CLEAR ?auto_166357 ) ( ON ?auto_166355 ?auto_166356 ) ( CLEAR ?auto_166355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_166352 ?auto_166353 ?auto_166358 ?auto_166354 ?auto_166360 ?auto_166356 )
      ( MAKE-2PILE ?auto_166352 ?auto_166353 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_166361 - BLOCK
      ?auto_166362 - BLOCK
    )
    :vars
    (
      ?auto_166368 - BLOCK
      ?auto_166363 - BLOCK
      ?auto_166369 - BLOCK
      ?auto_166367 - BLOCK
      ?auto_166365 - BLOCK
      ?auto_166366 - BLOCK
      ?auto_166364 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166368 ?auto_166362 ) ( ON-TABLE ?auto_166361 ) ( ON ?auto_166362 ?auto_166361 ) ( not ( = ?auto_166361 ?auto_166362 ) ) ( not ( = ?auto_166361 ?auto_166368 ) ) ( not ( = ?auto_166362 ?auto_166368 ) ) ( not ( = ?auto_166361 ?auto_166363 ) ) ( not ( = ?auto_166361 ?auto_166369 ) ) ( not ( = ?auto_166362 ?auto_166363 ) ) ( not ( = ?auto_166362 ?auto_166369 ) ) ( not ( = ?auto_166368 ?auto_166363 ) ) ( not ( = ?auto_166368 ?auto_166369 ) ) ( not ( = ?auto_166363 ?auto_166369 ) ) ( ON ?auto_166363 ?auto_166368 ) ( ON-TABLE ?auto_166367 ) ( not ( = ?auto_166367 ?auto_166365 ) ) ( not ( = ?auto_166367 ?auto_166366 ) ) ( not ( = ?auto_166367 ?auto_166364 ) ) ( not ( = ?auto_166367 ?auto_166369 ) ) ( not ( = ?auto_166365 ?auto_166366 ) ) ( not ( = ?auto_166365 ?auto_166364 ) ) ( not ( = ?auto_166365 ?auto_166369 ) ) ( not ( = ?auto_166366 ?auto_166364 ) ) ( not ( = ?auto_166366 ?auto_166369 ) ) ( not ( = ?auto_166364 ?auto_166369 ) ) ( not ( = ?auto_166361 ?auto_166364 ) ) ( not ( = ?auto_166361 ?auto_166367 ) ) ( not ( = ?auto_166361 ?auto_166365 ) ) ( not ( = ?auto_166361 ?auto_166366 ) ) ( not ( = ?auto_166362 ?auto_166364 ) ) ( not ( = ?auto_166362 ?auto_166367 ) ) ( not ( = ?auto_166362 ?auto_166365 ) ) ( not ( = ?auto_166362 ?auto_166366 ) ) ( not ( = ?auto_166368 ?auto_166364 ) ) ( not ( = ?auto_166368 ?auto_166367 ) ) ( not ( = ?auto_166368 ?auto_166365 ) ) ( not ( = ?auto_166368 ?auto_166366 ) ) ( not ( = ?auto_166363 ?auto_166364 ) ) ( not ( = ?auto_166363 ?auto_166367 ) ) ( not ( = ?auto_166363 ?auto_166365 ) ) ( not ( = ?auto_166363 ?auto_166366 ) ) ( ON ?auto_166369 ?auto_166363 ) ( ON ?auto_166364 ?auto_166369 ) ( ON ?auto_166366 ?auto_166364 ) ( CLEAR ?auto_166366 ) ( HOLDING ?auto_166365 ) ( CLEAR ?auto_166367 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_166367 ?auto_166365 )
      ( MAKE-2PILE ?auto_166361 ?auto_166362 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_168388 - BLOCK
      ?auto_168389 - BLOCK
    )
    :vars
    (
      ?auto_168391 - BLOCK
      ?auto_168392 - BLOCK
      ?auto_168395 - BLOCK
      ?auto_168394 - BLOCK
      ?auto_168390 - BLOCK
      ?auto_168393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168391 ?auto_168389 ) ( ON-TABLE ?auto_168388 ) ( ON ?auto_168389 ?auto_168388 ) ( not ( = ?auto_168388 ?auto_168389 ) ) ( not ( = ?auto_168388 ?auto_168391 ) ) ( not ( = ?auto_168389 ?auto_168391 ) ) ( not ( = ?auto_168388 ?auto_168392 ) ) ( not ( = ?auto_168388 ?auto_168395 ) ) ( not ( = ?auto_168389 ?auto_168392 ) ) ( not ( = ?auto_168389 ?auto_168395 ) ) ( not ( = ?auto_168391 ?auto_168392 ) ) ( not ( = ?auto_168391 ?auto_168395 ) ) ( not ( = ?auto_168392 ?auto_168395 ) ) ( ON ?auto_168392 ?auto_168391 ) ( not ( = ?auto_168394 ?auto_168390 ) ) ( not ( = ?auto_168394 ?auto_168393 ) ) ( not ( = ?auto_168394 ?auto_168395 ) ) ( not ( = ?auto_168390 ?auto_168393 ) ) ( not ( = ?auto_168390 ?auto_168395 ) ) ( not ( = ?auto_168393 ?auto_168395 ) ) ( not ( = ?auto_168388 ?auto_168393 ) ) ( not ( = ?auto_168388 ?auto_168394 ) ) ( not ( = ?auto_168388 ?auto_168390 ) ) ( not ( = ?auto_168389 ?auto_168393 ) ) ( not ( = ?auto_168389 ?auto_168394 ) ) ( not ( = ?auto_168389 ?auto_168390 ) ) ( not ( = ?auto_168391 ?auto_168393 ) ) ( not ( = ?auto_168391 ?auto_168394 ) ) ( not ( = ?auto_168391 ?auto_168390 ) ) ( not ( = ?auto_168392 ?auto_168393 ) ) ( not ( = ?auto_168392 ?auto_168394 ) ) ( not ( = ?auto_168392 ?auto_168390 ) ) ( ON ?auto_168395 ?auto_168392 ) ( ON ?auto_168393 ?auto_168395 ) ( ON ?auto_168390 ?auto_168393 ) ( ON ?auto_168394 ?auto_168390 ) ( CLEAR ?auto_168394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_168388 ?auto_168389 ?auto_168391 ?auto_168392 ?auto_168395 ?auto_168393 ?auto_168390 )
      ( MAKE-2PILE ?auto_168388 ?auto_168389 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_166379 - BLOCK
      ?auto_166380 - BLOCK
    )
    :vars
    (
      ?auto_166387 - BLOCK
      ?auto_166383 - BLOCK
      ?auto_166386 - BLOCK
      ?auto_166381 - BLOCK
      ?auto_166385 - BLOCK
      ?auto_166382 - BLOCK
      ?auto_166384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166387 ?auto_166380 ) ( ON-TABLE ?auto_166379 ) ( ON ?auto_166380 ?auto_166379 ) ( not ( = ?auto_166379 ?auto_166380 ) ) ( not ( = ?auto_166379 ?auto_166387 ) ) ( not ( = ?auto_166380 ?auto_166387 ) ) ( not ( = ?auto_166379 ?auto_166383 ) ) ( not ( = ?auto_166379 ?auto_166386 ) ) ( not ( = ?auto_166380 ?auto_166383 ) ) ( not ( = ?auto_166380 ?auto_166386 ) ) ( not ( = ?auto_166387 ?auto_166383 ) ) ( not ( = ?auto_166387 ?auto_166386 ) ) ( not ( = ?auto_166383 ?auto_166386 ) ) ( ON ?auto_166383 ?auto_166387 ) ( not ( = ?auto_166381 ?auto_166385 ) ) ( not ( = ?auto_166381 ?auto_166382 ) ) ( not ( = ?auto_166381 ?auto_166384 ) ) ( not ( = ?auto_166381 ?auto_166386 ) ) ( not ( = ?auto_166385 ?auto_166382 ) ) ( not ( = ?auto_166385 ?auto_166384 ) ) ( not ( = ?auto_166385 ?auto_166386 ) ) ( not ( = ?auto_166382 ?auto_166384 ) ) ( not ( = ?auto_166382 ?auto_166386 ) ) ( not ( = ?auto_166384 ?auto_166386 ) ) ( not ( = ?auto_166379 ?auto_166384 ) ) ( not ( = ?auto_166379 ?auto_166381 ) ) ( not ( = ?auto_166379 ?auto_166385 ) ) ( not ( = ?auto_166379 ?auto_166382 ) ) ( not ( = ?auto_166380 ?auto_166384 ) ) ( not ( = ?auto_166380 ?auto_166381 ) ) ( not ( = ?auto_166380 ?auto_166385 ) ) ( not ( = ?auto_166380 ?auto_166382 ) ) ( not ( = ?auto_166387 ?auto_166384 ) ) ( not ( = ?auto_166387 ?auto_166381 ) ) ( not ( = ?auto_166387 ?auto_166385 ) ) ( not ( = ?auto_166387 ?auto_166382 ) ) ( not ( = ?auto_166383 ?auto_166384 ) ) ( not ( = ?auto_166383 ?auto_166381 ) ) ( not ( = ?auto_166383 ?auto_166385 ) ) ( not ( = ?auto_166383 ?auto_166382 ) ) ( ON ?auto_166386 ?auto_166383 ) ( ON ?auto_166384 ?auto_166386 ) ( ON ?auto_166382 ?auto_166384 ) ( ON ?auto_166385 ?auto_166382 ) ( CLEAR ?auto_166385 ) ( HOLDING ?auto_166381 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_166381 )
      ( MAKE-2PILE ?auto_166379 ?auto_166380 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_166388 - BLOCK
      ?auto_166389 - BLOCK
    )
    :vars
    (
      ?auto_166391 - BLOCK
      ?auto_166394 - BLOCK
      ?auto_166396 - BLOCK
      ?auto_166392 - BLOCK
      ?auto_166390 - BLOCK
      ?auto_166395 - BLOCK
      ?auto_166393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166391 ?auto_166389 ) ( ON-TABLE ?auto_166388 ) ( ON ?auto_166389 ?auto_166388 ) ( not ( = ?auto_166388 ?auto_166389 ) ) ( not ( = ?auto_166388 ?auto_166391 ) ) ( not ( = ?auto_166389 ?auto_166391 ) ) ( not ( = ?auto_166388 ?auto_166394 ) ) ( not ( = ?auto_166388 ?auto_166396 ) ) ( not ( = ?auto_166389 ?auto_166394 ) ) ( not ( = ?auto_166389 ?auto_166396 ) ) ( not ( = ?auto_166391 ?auto_166394 ) ) ( not ( = ?auto_166391 ?auto_166396 ) ) ( not ( = ?auto_166394 ?auto_166396 ) ) ( ON ?auto_166394 ?auto_166391 ) ( not ( = ?auto_166392 ?auto_166390 ) ) ( not ( = ?auto_166392 ?auto_166395 ) ) ( not ( = ?auto_166392 ?auto_166393 ) ) ( not ( = ?auto_166392 ?auto_166396 ) ) ( not ( = ?auto_166390 ?auto_166395 ) ) ( not ( = ?auto_166390 ?auto_166393 ) ) ( not ( = ?auto_166390 ?auto_166396 ) ) ( not ( = ?auto_166395 ?auto_166393 ) ) ( not ( = ?auto_166395 ?auto_166396 ) ) ( not ( = ?auto_166393 ?auto_166396 ) ) ( not ( = ?auto_166388 ?auto_166393 ) ) ( not ( = ?auto_166388 ?auto_166392 ) ) ( not ( = ?auto_166388 ?auto_166390 ) ) ( not ( = ?auto_166388 ?auto_166395 ) ) ( not ( = ?auto_166389 ?auto_166393 ) ) ( not ( = ?auto_166389 ?auto_166392 ) ) ( not ( = ?auto_166389 ?auto_166390 ) ) ( not ( = ?auto_166389 ?auto_166395 ) ) ( not ( = ?auto_166391 ?auto_166393 ) ) ( not ( = ?auto_166391 ?auto_166392 ) ) ( not ( = ?auto_166391 ?auto_166390 ) ) ( not ( = ?auto_166391 ?auto_166395 ) ) ( not ( = ?auto_166394 ?auto_166393 ) ) ( not ( = ?auto_166394 ?auto_166392 ) ) ( not ( = ?auto_166394 ?auto_166390 ) ) ( not ( = ?auto_166394 ?auto_166395 ) ) ( ON ?auto_166396 ?auto_166394 ) ( ON ?auto_166393 ?auto_166396 ) ( ON ?auto_166395 ?auto_166393 ) ( ON ?auto_166390 ?auto_166395 ) ( ON ?auto_166392 ?auto_166390 ) ( CLEAR ?auto_166392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_166388 ?auto_166389 ?auto_166391 ?auto_166394 ?auto_166396 ?auto_166393 ?auto_166395 ?auto_166390 )
      ( MAKE-2PILE ?auto_166388 ?auto_166389 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166404 - BLOCK
      ?auto_166405 - BLOCK
      ?auto_166406 - BLOCK
      ?auto_166407 - BLOCK
      ?auto_166408 - BLOCK
      ?auto_166409 - BLOCK
      ?auto_166410 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_166410 ) ( CLEAR ?auto_166409 ) ( ON-TABLE ?auto_166404 ) ( ON ?auto_166405 ?auto_166404 ) ( ON ?auto_166406 ?auto_166405 ) ( ON ?auto_166407 ?auto_166406 ) ( ON ?auto_166408 ?auto_166407 ) ( ON ?auto_166409 ?auto_166408 ) ( not ( = ?auto_166404 ?auto_166405 ) ) ( not ( = ?auto_166404 ?auto_166406 ) ) ( not ( = ?auto_166404 ?auto_166407 ) ) ( not ( = ?auto_166404 ?auto_166408 ) ) ( not ( = ?auto_166404 ?auto_166409 ) ) ( not ( = ?auto_166404 ?auto_166410 ) ) ( not ( = ?auto_166405 ?auto_166406 ) ) ( not ( = ?auto_166405 ?auto_166407 ) ) ( not ( = ?auto_166405 ?auto_166408 ) ) ( not ( = ?auto_166405 ?auto_166409 ) ) ( not ( = ?auto_166405 ?auto_166410 ) ) ( not ( = ?auto_166406 ?auto_166407 ) ) ( not ( = ?auto_166406 ?auto_166408 ) ) ( not ( = ?auto_166406 ?auto_166409 ) ) ( not ( = ?auto_166406 ?auto_166410 ) ) ( not ( = ?auto_166407 ?auto_166408 ) ) ( not ( = ?auto_166407 ?auto_166409 ) ) ( not ( = ?auto_166407 ?auto_166410 ) ) ( not ( = ?auto_166408 ?auto_166409 ) ) ( not ( = ?auto_166408 ?auto_166410 ) ) ( not ( = ?auto_166409 ?auto_166410 ) ) )
    :subtasks
    ( ( !STACK ?auto_166410 ?auto_166409 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166411 - BLOCK
      ?auto_166412 - BLOCK
      ?auto_166413 - BLOCK
      ?auto_166414 - BLOCK
      ?auto_166415 - BLOCK
      ?auto_166416 - BLOCK
      ?auto_166417 - BLOCK
    )
    :vars
    (
      ?auto_166418 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_166416 ) ( ON-TABLE ?auto_166411 ) ( ON ?auto_166412 ?auto_166411 ) ( ON ?auto_166413 ?auto_166412 ) ( ON ?auto_166414 ?auto_166413 ) ( ON ?auto_166415 ?auto_166414 ) ( ON ?auto_166416 ?auto_166415 ) ( not ( = ?auto_166411 ?auto_166412 ) ) ( not ( = ?auto_166411 ?auto_166413 ) ) ( not ( = ?auto_166411 ?auto_166414 ) ) ( not ( = ?auto_166411 ?auto_166415 ) ) ( not ( = ?auto_166411 ?auto_166416 ) ) ( not ( = ?auto_166411 ?auto_166417 ) ) ( not ( = ?auto_166412 ?auto_166413 ) ) ( not ( = ?auto_166412 ?auto_166414 ) ) ( not ( = ?auto_166412 ?auto_166415 ) ) ( not ( = ?auto_166412 ?auto_166416 ) ) ( not ( = ?auto_166412 ?auto_166417 ) ) ( not ( = ?auto_166413 ?auto_166414 ) ) ( not ( = ?auto_166413 ?auto_166415 ) ) ( not ( = ?auto_166413 ?auto_166416 ) ) ( not ( = ?auto_166413 ?auto_166417 ) ) ( not ( = ?auto_166414 ?auto_166415 ) ) ( not ( = ?auto_166414 ?auto_166416 ) ) ( not ( = ?auto_166414 ?auto_166417 ) ) ( not ( = ?auto_166415 ?auto_166416 ) ) ( not ( = ?auto_166415 ?auto_166417 ) ) ( not ( = ?auto_166416 ?auto_166417 ) ) ( ON ?auto_166417 ?auto_166418 ) ( CLEAR ?auto_166417 ) ( HAND-EMPTY ) ( not ( = ?auto_166411 ?auto_166418 ) ) ( not ( = ?auto_166412 ?auto_166418 ) ) ( not ( = ?auto_166413 ?auto_166418 ) ) ( not ( = ?auto_166414 ?auto_166418 ) ) ( not ( = ?auto_166415 ?auto_166418 ) ) ( not ( = ?auto_166416 ?auto_166418 ) ) ( not ( = ?auto_166417 ?auto_166418 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166417 ?auto_166418 )
      ( MAKE-7PILE ?auto_166411 ?auto_166412 ?auto_166413 ?auto_166414 ?auto_166415 ?auto_166416 ?auto_166417 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166419 - BLOCK
      ?auto_166420 - BLOCK
      ?auto_166421 - BLOCK
      ?auto_166422 - BLOCK
      ?auto_166423 - BLOCK
      ?auto_166424 - BLOCK
      ?auto_166425 - BLOCK
    )
    :vars
    (
      ?auto_166426 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166419 ) ( ON ?auto_166420 ?auto_166419 ) ( ON ?auto_166421 ?auto_166420 ) ( ON ?auto_166422 ?auto_166421 ) ( ON ?auto_166423 ?auto_166422 ) ( not ( = ?auto_166419 ?auto_166420 ) ) ( not ( = ?auto_166419 ?auto_166421 ) ) ( not ( = ?auto_166419 ?auto_166422 ) ) ( not ( = ?auto_166419 ?auto_166423 ) ) ( not ( = ?auto_166419 ?auto_166424 ) ) ( not ( = ?auto_166419 ?auto_166425 ) ) ( not ( = ?auto_166420 ?auto_166421 ) ) ( not ( = ?auto_166420 ?auto_166422 ) ) ( not ( = ?auto_166420 ?auto_166423 ) ) ( not ( = ?auto_166420 ?auto_166424 ) ) ( not ( = ?auto_166420 ?auto_166425 ) ) ( not ( = ?auto_166421 ?auto_166422 ) ) ( not ( = ?auto_166421 ?auto_166423 ) ) ( not ( = ?auto_166421 ?auto_166424 ) ) ( not ( = ?auto_166421 ?auto_166425 ) ) ( not ( = ?auto_166422 ?auto_166423 ) ) ( not ( = ?auto_166422 ?auto_166424 ) ) ( not ( = ?auto_166422 ?auto_166425 ) ) ( not ( = ?auto_166423 ?auto_166424 ) ) ( not ( = ?auto_166423 ?auto_166425 ) ) ( not ( = ?auto_166424 ?auto_166425 ) ) ( ON ?auto_166425 ?auto_166426 ) ( CLEAR ?auto_166425 ) ( not ( = ?auto_166419 ?auto_166426 ) ) ( not ( = ?auto_166420 ?auto_166426 ) ) ( not ( = ?auto_166421 ?auto_166426 ) ) ( not ( = ?auto_166422 ?auto_166426 ) ) ( not ( = ?auto_166423 ?auto_166426 ) ) ( not ( = ?auto_166424 ?auto_166426 ) ) ( not ( = ?auto_166425 ?auto_166426 ) ) ( HOLDING ?auto_166424 ) ( CLEAR ?auto_166423 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_166419 ?auto_166420 ?auto_166421 ?auto_166422 ?auto_166423 ?auto_166424 )
      ( MAKE-7PILE ?auto_166419 ?auto_166420 ?auto_166421 ?auto_166422 ?auto_166423 ?auto_166424 ?auto_166425 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166427 - BLOCK
      ?auto_166428 - BLOCK
      ?auto_166429 - BLOCK
      ?auto_166430 - BLOCK
      ?auto_166431 - BLOCK
      ?auto_166432 - BLOCK
      ?auto_166433 - BLOCK
    )
    :vars
    (
      ?auto_166434 - BLOCK
      ?auto_166435 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166427 ) ( ON ?auto_166428 ?auto_166427 ) ( ON ?auto_166429 ?auto_166428 ) ( ON ?auto_166430 ?auto_166429 ) ( ON ?auto_166431 ?auto_166430 ) ( not ( = ?auto_166427 ?auto_166428 ) ) ( not ( = ?auto_166427 ?auto_166429 ) ) ( not ( = ?auto_166427 ?auto_166430 ) ) ( not ( = ?auto_166427 ?auto_166431 ) ) ( not ( = ?auto_166427 ?auto_166432 ) ) ( not ( = ?auto_166427 ?auto_166433 ) ) ( not ( = ?auto_166428 ?auto_166429 ) ) ( not ( = ?auto_166428 ?auto_166430 ) ) ( not ( = ?auto_166428 ?auto_166431 ) ) ( not ( = ?auto_166428 ?auto_166432 ) ) ( not ( = ?auto_166428 ?auto_166433 ) ) ( not ( = ?auto_166429 ?auto_166430 ) ) ( not ( = ?auto_166429 ?auto_166431 ) ) ( not ( = ?auto_166429 ?auto_166432 ) ) ( not ( = ?auto_166429 ?auto_166433 ) ) ( not ( = ?auto_166430 ?auto_166431 ) ) ( not ( = ?auto_166430 ?auto_166432 ) ) ( not ( = ?auto_166430 ?auto_166433 ) ) ( not ( = ?auto_166431 ?auto_166432 ) ) ( not ( = ?auto_166431 ?auto_166433 ) ) ( not ( = ?auto_166432 ?auto_166433 ) ) ( ON ?auto_166433 ?auto_166434 ) ( not ( = ?auto_166427 ?auto_166434 ) ) ( not ( = ?auto_166428 ?auto_166434 ) ) ( not ( = ?auto_166429 ?auto_166434 ) ) ( not ( = ?auto_166430 ?auto_166434 ) ) ( not ( = ?auto_166431 ?auto_166434 ) ) ( not ( = ?auto_166432 ?auto_166434 ) ) ( not ( = ?auto_166433 ?auto_166434 ) ) ( CLEAR ?auto_166431 ) ( ON ?auto_166432 ?auto_166433 ) ( CLEAR ?auto_166432 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_166435 ) ( ON ?auto_166434 ?auto_166435 ) ( not ( = ?auto_166435 ?auto_166434 ) ) ( not ( = ?auto_166435 ?auto_166433 ) ) ( not ( = ?auto_166435 ?auto_166432 ) ) ( not ( = ?auto_166427 ?auto_166435 ) ) ( not ( = ?auto_166428 ?auto_166435 ) ) ( not ( = ?auto_166429 ?auto_166435 ) ) ( not ( = ?auto_166430 ?auto_166435 ) ) ( not ( = ?auto_166431 ?auto_166435 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_166435 ?auto_166434 ?auto_166433 )
      ( MAKE-7PILE ?auto_166427 ?auto_166428 ?auto_166429 ?auto_166430 ?auto_166431 ?auto_166432 ?auto_166433 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166436 - BLOCK
      ?auto_166437 - BLOCK
      ?auto_166438 - BLOCK
      ?auto_166439 - BLOCK
      ?auto_166440 - BLOCK
      ?auto_166441 - BLOCK
      ?auto_166442 - BLOCK
    )
    :vars
    (
      ?auto_166444 - BLOCK
      ?auto_166443 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166436 ) ( ON ?auto_166437 ?auto_166436 ) ( ON ?auto_166438 ?auto_166437 ) ( ON ?auto_166439 ?auto_166438 ) ( not ( = ?auto_166436 ?auto_166437 ) ) ( not ( = ?auto_166436 ?auto_166438 ) ) ( not ( = ?auto_166436 ?auto_166439 ) ) ( not ( = ?auto_166436 ?auto_166440 ) ) ( not ( = ?auto_166436 ?auto_166441 ) ) ( not ( = ?auto_166436 ?auto_166442 ) ) ( not ( = ?auto_166437 ?auto_166438 ) ) ( not ( = ?auto_166437 ?auto_166439 ) ) ( not ( = ?auto_166437 ?auto_166440 ) ) ( not ( = ?auto_166437 ?auto_166441 ) ) ( not ( = ?auto_166437 ?auto_166442 ) ) ( not ( = ?auto_166438 ?auto_166439 ) ) ( not ( = ?auto_166438 ?auto_166440 ) ) ( not ( = ?auto_166438 ?auto_166441 ) ) ( not ( = ?auto_166438 ?auto_166442 ) ) ( not ( = ?auto_166439 ?auto_166440 ) ) ( not ( = ?auto_166439 ?auto_166441 ) ) ( not ( = ?auto_166439 ?auto_166442 ) ) ( not ( = ?auto_166440 ?auto_166441 ) ) ( not ( = ?auto_166440 ?auto_166442 ) ) ( not ( = ?auto_166441 ?auto_166442 ) ) ( ON ?auto_166442 ?auto_166444 ) ( not ( = ?auto_166436 ?auto_166444 ) ) ( not ( = ?auto_166437 ?auto_166444 ) ) ( not ( = ?auto_166438 ?auto_166444 ) ) ( not ( = ?auto_166439 ?auto_166444 ) ) ( not ( = ?auto_166440 ?auto_166444 ) ) ( not ( = ?auto_166441 ?auto_166444 ) ) ( not ( = ?auto_166442 ?auto_166444 ) ) ( ON ?auto_166441 ?auto_166442 ) ( CLEAR ?auto_166441 ) ( ON-TABLE ?auto_166443 ) ( ON ?auto_166444 ?auto_166443 ) ( not ( = ?auto_166443 ?auto_166444 ) ) ( not ( = ?auto_166443 ?auto_166442 ) ) ( not ( = ?auto_166443 ?auto_166441 ) ) ( not ( = ?auto_166436 ?auto_166443 ) ) ( not ( = ?auto_166437 ?auto_166443 ) ) ( not ( = ?auto_166438 ?auto_166443 ) ) ( not ( = ?auto_166439 ?auto_166443 ) ) ( not ( = ?auto_166440 ?auto_166443 ) ) ( HOLDING ?auto_166440 ) ( CLEAR ?auto_166439 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_166436 ?auto_166437 ?auto_166438 ?auto_166439 ?auto_166440 )
      ( MAKE-7PILE ?auto_166436 ?auto_166437 ?auto_166438 ?auto_166439 ?auto_166440 ?auto_166441 ?auto_166442 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166445 - BLOCK
      ?auto_166446 - BLOCK
      ?auto_166447 - BLOCK
      ?auto_166448 - BLOCK
      ?auto_166449 - BLOCK
      ?auto_166450 - BLOCK
      ?auto_166451 - BLOCK
    )
    :vars
    (
      ?auto_166453 - BLOCK
      ?auto_166452 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166445 ) ( ON ?auto_166446 ?auto_166445 ) ( ON ?auto_166447 ?auto_166446 ) ( ON ?auto_166448 ?auto_166447 ) ( not ( = ?auto_166445 ?auto_166446 ) ) ( not ( = ?auto_166445 ?auto_166447 ) ) ( not ( = ?auto_166445 ?auto_166448 ) ) ( not ( = ?auto_166445 ?auto_166449 ) ) ( not ( = ?auto_166445 ?auto_166450 ) ) ( not ( = ?auto_166445 ?auto_166451 ) ) ( not ( = ?auto_166446 ?auto_166447 ) ) ( not ( = ?auto_166446 ?auto_166448 ) ) ( not ( = ?auto_166446 ?auto_166449 ) ) ( not ( = ?auto_166446 ?auto_166450 ) ) ( not ( = ?auto_166446 ?auto_166451 ) ) ( not ( = ?auto_166447 ?auto_166448 ) ) ( not ( = ?auto_166447 ?auto_166449 ) ) ( not ( = ?auto_166447 ?auto_166450 ) ) ( not ( = ?auto_166447 ?auto_166451 ) ) ( not ( = ?auto_166448 ?auto_166449 ) ) ( not ( = ?auto_166448 ?auto_166450 ) ) ( not ( = ?auto_166448 ?auto_166451 ) ) ( not ( = ?auto_166449 ?auto_166450 ) ) ( not ( = ?auto_166449 ?auto_166451 ) ) ( not ( = ?auto_166450 ?auto_166451 ) ) ( ON ?auto_166451 ?auto_166453 ) ( not ( = ?auto_166445 ?auto_166453 ) ) ( not ( = ?auto_166446 ?auto_166453 ) ) ( not ( = ?auto_166447 ?auto_166453 ) ) ( not ( = ?auto_166448 ?auto_166453 ) ) ( not ( = ?auto_166449 ?auto_166453 ) ) ( not ( = ?auto_166450 ?auto_166453 ) ) ( not ( = ?auto_166451 ?auto_166453 ) ) ( ON ?auto_166450 ?auto_166451 ) ( ON-TABLE ?auto_166452 ) ( ON ?auto_166453 ?auto_166452 ) ( not ( = ?auto_166452 ?auto_166453 ) ) ( not ( = ?auto_166452 ?auto_166451 ) ) ( not ( = ?auto_166452 ?auto_166450 ) ) ( not ( = ?auto_166445 ?auto_166452 ) ) ( not ( = ?auto_166446 ?auto_166452 ) ) ( not ( = ?auto_166447 ?auto_166452 ) ) ( not ( = ?auto_166448 ?auto_166452 ) ) ( not ( = ?auto_166449 ?auto_166452 ) ) ( CLEAR ?auto_166448 ) ( ON ?auto_166449 ?auto_166450 ) ( CLEAR ?auto_166449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_166452 ?auto_166453 ?auto_166451 ?auto_166450 )
      ( MAKE-7PILE ?auto_166445 ?auto_166446 ?auto_166447 ?auto_166448 ?auto_166449 ?auto_166450 ?auto_166451 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166454 - BLOCK
      ?auto_166455 - BLOCK
      ?auto_166456 - BLOCK
      ?auto_166457 - BLOCK
      ?auto_166458 - BLOCK
      ?auto_166459 - BLOCK
      ?auto_166460 - BLOCK
    )
    :vars
    (
      ?auto_166462 - BLOCK
      ?auto_166461 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166454 ) ( ON ?auto_166455 ?auto_166454 ) ( ON ?auto_166456 ?auto_166455 ) ( not ( = ?auto_166454 ?auto_166455 ) ) ( not ( = ?auto_166454 ?auto_166456 ) ) ( not ( = ?auto_166454 ?auto_166457 ) ) ( not ( = ?auto_166454 ?auto_166458 ) ) ( not ( = ?auto_166454 ?auto_166459 ) ) ( not ( = ?auto_166454 ?auto_166460 ) ) ( not ( = ?auto_166455 ?auto_166456 ) ) ( not ( = ?auto_166455 ?auto_166457 ) ) ( not ( = ?auto_166455 ?auto_166458 ) ) ( not ( = ?auto_166455 ?auto_166459 ) ) ( not ( = ?auto_166455 ?auto_166460 ) ) ( not ( = ?auto_166456 ?auto_166457 ) ) ( not ( = ?auto_166456 ?auto_166458 ) ) ( not ( = ?auto_166456 ?auto_166459 ) ) ( not ( = ?auto_166456 ?auto_166460 ) ) ( not ( = ?auto_166457 ?auto_166458 ) ) ( not ( = ?auto_166457 ?auto_166459 ) ) ( not ( = ?auto_166457 ?auto_166460 ) ) ( not ( = ?auto_166458 ?auto_166459 ) ) ( not ( = ?auto_166458 ?auto_166460 ) ) ( not ( = ?auto_166459 ?auto_166460 ) ) ( ON ?auto_166460 ?auto_166462 ) ( not ( = ?auto_166454 ?auto_166462 ) ) ( not ( = ?auto_166455 ?auto_166462 ) ) ( not ( = ?auto_166456 ?auto_166462 ) ) ( not ( = ?auto_166457 ?auto_166462 ) ) ( not ( = ?auto_166458 ?auto_166462 ) ) ( not ( = ?auto_166459 ?auto_166462 ) ) ( not ( = ?auto_166460 ?auto_166462 ) ) ( ON ?auto_166459 ?auto_166460 ) ( ON-TABLE ?auto_166461 ) ( ON ?auto_166462 ?auto_166461 ) ( not ( = ?auto_166461 ?auto_166462 ) ) ( not ( = ?auto_166461 ?auto_166460 ) ) ( not ( = ?auto_166461 ?auto_166459 ) ) ( not ( = ?auto_166454 ?auto_166461 ) ) ( not ( = ?auto_166455 ?auto_166461 ) ) ( not ( = ?auto_166456 ?auto_166461 ) ) ( not ( = ?auto_166457 ?auto_166461 ) ) ( not ( = ?auto_166458 ?auto_166461 ) ) ( ON ?auto_166458 ?auto_166459 ) ( CLEAR ?auto_166458 ) ( HOLDING ?auto_166457 ) ( CLEAR ?auto_166456 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_166454 ?auto_166455 ?auto_166456 ?auto_166457 )
      ( MAKE-7PILE ?auto_166454 ?auto_166455 ?auto_166456 ?auto_166457 ?auto_166458 ?auto_166459 ?auto_166460 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166463 - BLOCK
      ?auto_166464 - BLOCK
      ?auto_166465 - BLOCK
      ?auto_166466 - BLOCK
      ?auto_166467 - BLOCK
      ?auto_166468 - BLOCK
      ?auto_166469 - BLOCK
    )
    :vars
    (
      ?auto_166471 - BLOCK
      ?auto_166470 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166463 ) ( ON ?auto_166464 ?auto_166463 ) ( ON ?auto_166465 ?auto_166464 ) ( not ( = ?auto_166463 ?auto_166464 ) ) ( not ( = ?auto_166463 ?auto_166465 ) ) ( not ( = ?auto_166463 ?auto_166466 ) ) ( not ( = ?auto_166463 ?auto_166467 ) ) ( not ( = ?auto_166463 ?auto_166468 ) ) ( not ( = ?auto_166463 ?auto_166469 ) ) ( not ( = ?auto_166464 ?auto_166465 ) ) ( not ( = ?auto_166464 ?auto_166466 ) ) ( not ( = ?auto_166464 ?auto_166467 ) ) ( not ( = ?auto_166464 ?auto_166468 ) ) ( not ( = ?auto_166464 ?auto_166469 ) ) ( not ( = ?auto_166465 ?auto_166466 ) ) ( not ( = ?auto_166465 ?auto_166467 ) ) ( not ( = ?auto_166465 ?auto_166468 ) ) ( not ( = ?auto_166465 ?auto_166469 ) ) ( not ( = ?auto_166466 ?auto_166467 ) ) ( not ( = ?auto_166466 ?auto_166468 ) ) ( not ( = ?auto_166466 ?auto_166469 ) ) ( not ( = ?auto_166467 ?auto_166468 ) ) ( not ( = ?auto_166467 ?auto_166469 ) ) ( not ( = ?auto_166468 ?auto_166469 ) ) ( ON ?auto_166469 ?auto_166471 ) ( not ( = ?auto_166463 ?auto_166471 ) ) ( not ( = ?auto_166464 ?auto_166471 ) ) ( not ( = ?auto_166465 ?auto_166471 ) ) ( not ( = ?auto_166466 ?auto_166471 ) ) ( not ( = ?auto_166467 ?auto_166471 ) ) ( not ( = ?auto_166468 ?auto_166471 ) ) ( not ( = ?auto_166469 ?auto_166471 ) ) ( ON ?auto_166468 ?auto_166469 ) ( ON-TABLE ?auto_166470 ) ( ON ?auto_166471 ?auto_166470 ) ( not ( = ?auto_166470 ?auto_166471 ) ) ( not ( = ?auto_166470 ?auto_166469 ) ) ( not ( = ?auto_166470 ?auto_166468 ) ) ( not ( = ?auto_166463 ?auto_166470 ) ) ( not ( = ?auto_166464 ?auto_166470 ) ) ( not ( = ?auto_166465 ?auto_166470 ) ) ( not ( = ?auto_166466 ?auto_166470 ) ) ( not ( = ?auto_166467 ?auto_166470 ) ) ( ON ?auto_166467 ?auto_166468 ) ( CLEAR ?auto_166465 ) ( ON ?auto_166466 ?auto_166467 ) ( CLEAR ?auto_166466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_166470 ?auto_166471 ?auto_166469 ?auto_166468 ?auto_166467 )
      ( MAKE-7PILE ?auto_166463 ?auto_166464 ?auto_166465 ?auto_166466 ?auto_166467 ?auto_166468 ?auto_166469 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166472 - BLOCK
      ?auto_166473 - BLOCK
      ?auto_166474 - BLOCK
      ?auto_166475 - BLOCK
      ?auto_166476 - BLOCK
      ?auto_166477 - BLOCK
      ?auto_166478 - BLOCK
    )
    :vars
    (
      ?auto_166480 - BLOCK
      ?auto_166479 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166472 ) ( ON ?auto_166473 ?auto_166472 ) ( not ( = ?auto_166472 ?auto_166473 ) ) ( not ( = ?auto_166472 ?auto_166474 ) ) ( not ( = ?auto_166472 ?auto_166475 ) ) ( not ( = ?auto_166472 ?auto_166476 ) ) ( not ( = ?auto_166472 ?auto_166477 ) ) ( not ( = ?auto_166472 ?auto_166478 ) ) ( not ( = ?auto_166473 ?auto_166474 ) ) ( not ( = ?auto_166473 ?auto_166475 ) ) ( not ( = ?auto_166473 ?auto_166476 ) ) ( not ( = ?auto_166473 ?auto_166477 ) ) ( not ( = ?auto_166473 ?auto_166478 ) ) ( not ( = ?auto_166474 ?auto_166475 ) ) ( not ( = ?auto_166474 ?auto_166476 ) ) ( not ( = ?auto_166474 ?auto_166477 ) ) ( not ( = ?auto_166474 ?auto_166478 ) ) ( not ( = ?auto_166475 ?auto_166476 ) ) ( not ( = ?auto_166475 ?auto_166477 ) ) ( not ( = ?auto_166475 ?auto_166478 ) ) ( not ( = ?auto_166476 ?auto_166477 ) ) ( not ( = ?auto_166476 ?auto_166478 ) ) ( not ( = ?auto_166477 ?auto_166478 ) ) ( ON ?auto_166478 ?auto_166480 ) ( not ( = ?auto_166472 ?auto_166480 ) ) ( not ( = ?auto_166473 ?auto_166480 ) ) ( not ( = ?auto_166474 ?auto_166480 ) ) ( not ( = ?auto_166475 ?auto_166480 ) ) ( not ( = ?auto_166476 ?auto_166480 ) ) ( not ( = ?auto_166477 ?auto_166480 ) ) ( not ( = ?auto_166478 ?auto_166480 ) ) ( ON ?auto_166477 ?auto_166478 ) ( ON-TABLE ?auto_166479 ) ( ON ?auto_166480 ?auto_166479 ) ( not ( = ?auto_166479 ?auto_166480 ) ) ( not ( = ?auto_166479 ?auto_166478 ) ) ( not ( = ?auto_166479 ?auto_166477 ) ) ( not ( = ?auto_166472 ?auto_166479 ) ) ( not ( = ?auto_166473 ?auto_166479 ) ) ( not ( = ?auto_166474 ?auto_166479 ) ) ( not ( = ?auto_166475 ?auto_166479 ) ) ( not ( = ?auto_166476 ?auto_166479 ) ) ( ON ?auto_166476 ?auto_166477 ) ( ON ?auto_166475 ?auto_166476 ) ( CLEAR ?auto_166475 ) ( HOLDING ?auto_166474 ) ( CLEAR ?auto_166473 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_166472 ?auto_166473 ?auto_166474 )
      ( MAKE-7PILE ?auto_166472 ?auto_166473 ?auto_166474 ?auto_166475 ?auto_166476 ?auto_166477 ?auto_166478 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166481 - BLOCK
      ?auto_166482 - BLOCK
      ?auto_166483 - BLOCK
      ?auto_166484 - BLOCK
      ?auto_166485 - BLOCK
      ?auto_166486 - BLOCK
      ?auto_166487 - BLOCK
    )
    :vars
    (
      ?auto_166489 - BLOCK
      ?auto_166488 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166481 ) ( ON ?auto_166482 ?auto_166481 ) ( not ( = ?auto_166481 ?auto_166482 ) ) ( not ( = ?auto_166481 ?auto_166483 ) ) ( not ( = ?auto_166481 ?auto_166484 ) ) ( not ( = ?auto_166481 ?auto_166485 ) ) ( not ( = ?auto_166481 ?auto_166486 ) ) ( not ( = ?auto_166481 ?auto_166487 ) ) ( not ( = ?auto_166482 ?auto_166483 ) ) ( not ( = ?auto_166482 ?auto_166484 ) ) ( not ( = ?auto_166482 ?auto_166485 ) ) ( not ( = ?auto_166482 ?auto_166486 ) ) ( not ( = ?auto_166482 ?auto_166487 ) ) ( not ( = ?auto_166483 ?auto_166484 ) ) ( not ( = ?auto_166483 ?auto_166485 ) ) ( not ( = ?auto_166483 ?auto_166486 ) ) ( not ( = ?auto_166483 ?auto_166487 ) ) ( not ( = ?auto_166484 ?auto_166485 ) ) ( not ( = ?auto_166484 ?auto_166486 ) ) ( not ( = ?auto_166484 ?auto_166487 ) ) ( not ( = ?auto_166485 ?auto_166486 ) ) ( not ( = ?auto_166485 ?auto_166487 ) ) ( not ( = ?auto_166486 ?auto_166487 ) ) ( ON ?auto_166487 ?auto_166489 ) ( not ( = ?auto_166481 ?auto_166489 ) ) ( not ( = ?auto_166482 ?auto_166489 ) ) ( not ( = ?auto_166483 ?auto_166489 ) ) ( not ( = ?auto_166484 ?auto_166489 ) ) ( not ( = ?auto_166485 ?auto_166489 ) ) ( not ( = ?auto_166486 ?auto_166489 ) ) ( not ( = ?auto_166487 ?auto_166489 ) ) ( ON ?auto_166486 ?auto_166487 ) ( ON-TABLE ?auto_166488 ) ( ON ?auto_166489 ?auto_166488 ) ( not ( = ?auto_166488 ?auto_166489 ) ) ( not ( = ?auto_166488 ?auto_166487 ) ) ( not ( = ?auto_166488 ?auto_166486 ) ) ( not ( = ?auto_166481 ?auto_166488 ) ) ( not ( = ?auto_166482 ?auto_166488 ) ) ( not ( = ?auto_166483 ?auto_166488 ) ) ( not ( = ?auto_166484 ?auto_166488 ) ) ( not ( = ?auto_166485 ?auto_166488 ) ) ( ON ?auto_166485 ?auto_166486 ) ( ON ?auto_166484 ?auto_166485 ) ( CLEAR ?auto_166482 ) ( ON ?auto_166483 ?auto_166484 ) ( CLEAR ?auto_166483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_166488 ?auto_166489 ?auto_166487 ?auto_166486 ?auto_166485 ?auto_166484 )
      ( MAKE-7PILE ?auto_166481 ?auto_166482 ?auto_166483 ?auto_166484 ?auto_166485 ?auto_166486 ?auto_166487 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166490 - BLOCK
      ?auto_166491 - BLOCK
      ?auto_166492 - BLOCK
      ?auto_166493 - BLOCK
      ?auto_166494 - BLOCK
      ?auto_166495 - BLOCK
      ?auto_166496 - BLOCK
    )
    :vars
    (
      ?auto_166497 - BLOCK
      ?auto_166498 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166490 ) ( not ( = ?auto_166490 ?auto_166491 ) ) ( not ( = ?auto_166490 ?auto_166492 ) ) ( not ( = ?auto_166490 ?auto_166493 ) ) ( not ( = ?auto_166490 ?auto_166494 ) ) ( not ( = ?auto_166490 ?auto_166495 ) ) ( not ( = ?auto_166490 ?auto_166496 ) ) ( not ( = ?auto_166491 ?auto_166492 ) ) ( not ( = ?auto_166491 ?auto_166493 ) ) ( not ( = ?auto_166491 ?auto_166494 ) ) ( not ( = ?auto_166491 ?auto_166495 ) ) ( not ( = ?auto_166491 ?auto_166496 ) ) ( not ( = ?auto_166492 ?auto_166493 ) ) ( not ( = ?auto_166492 ?auto_166494 ) ) ( not ( = ?auto_166492 ?auto_166495 ) ) ( not ( = ?auto_166492 ?auto_166496 ) ) ( not ( = ?auto_166493 ?auto_166494 ) ) ( not ( = ?auto_166493 ?auto_166495 ) ) ( not ( = ?auto_166493 ?auto_166496 ) ) ( not ( = ?auto_166494 ?auto_166495 ) ) ( not ( = ?auto_166494 ?auto_166496 ) ) ( not ( = ?auto_166495 ?auto_166496 ) ) ( ON ?auto_166496 ?auto_166497 ) ( not ( = ?auto_166490 ?auto_166497 ) ) ( not ( = ?auto_166491 ?auto_166497 ) ) ( not ( = ?auto_166492 ?auto_166497 ) ) ( not ( = ?auto_166493 ?auto_166497 ) ) ( not ( = ?auto_166494 ?auto_166497 ) ) ( not ( = ?auto_166495 ?auto_166497 ) ) ( not ( = ?auto_166496 ?auto_166497 ) ) ( ON ?auto_166495 ?auto_166496 ) ( ON-TABLE ?auto_166498 ) ( ON ?auto_166497 ?auto_166498 ) ( not ( = ?auto_166498 ?auto_166497 ) ) ( not ( = ?auto_166498 ?auto_166496 ) ) ( not ( = ?auto_166498 ?auto_166495 ) ) ( not ( = ?auto_166490 ?auto_166498 ) ) ( not ( = ?auto_166491 ?auto_166498 ) ) ( not ( = ?auto_166492 ?auto_166498 ) ) ( not ( = ?auto_166493 ?auto_166498 ) ) ( not ( = ?auto_166494 ?auto_166498 ) ) ( ON ?auto_166494 ?auto_166495 ) ( ON ?auto_166493 ?auto_166494 ) ( ON ?auto_166492 ?auto_166493 ) ( CLEAR ?auto_166492 ) ( HOLDING ?auto_166491 ) ( CLEAR ?auto_166490 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_166490 ?auto_166491 )
      ( MAKE-7PILE ?auto_166490 ?auto_166491 ?auto_166492 ?auto_166493 ?auto_166494 ?auto_166495 ?auto_166496 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166499 - BLOCK
      ?auto_166500 - BLOCK
      ?auto_166501 - BLOCK
      ?auto_166502 - BLOCK
      ?auto_166503 - BLOCK
      ?auto_166504 - BLOCK
      ?auto_166505 - BLOCK
    )
    :vars
    (
      ?auto_166506 - BLOCK
      ?auto_166507 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166499 ) ( not ( = ?auto_166499 ?auto_166500 ) ) ( not ( = ?auto_166499 ?auto_166501 ) ) ( not ( = ?auto_166499 ?auto_166502 ) ) ( not ( = ?auto_166499 ?auto_166503 ) ) ( not ( = ?auto_166499 ?auto_166504 ) ) ( not ( = ?auto_166499 ?auto_166505 ) ) ( not ( = ?auto_166500 ?auto_166501 ) ) ( not ( = ?auto_166500 ?auto_166502 ) ) ( not ( = ?auto_166500 ?auto_166503 ) ) ( not ( = ?auto_166500 ?auto_166504 ) ) ( not ( = ?auto_166500 ?auto_166505 ) ) ( not ( = ?auto_166501 ?auto_166502 ) ) ( not ( = ?auto_166501 ?auto_166503 ) ) ( not ( = ?auto_166501 ?auto_166504 ) ) ( not ( = ?auto_166501 ?auto_166505 ) ) ( not ( = ?auto_166502 ?auto_166503 ) ) ( not ( = ?auto_166502 ?auto_166504 ) ) ( not ( = ?auto_166502 ?auto_166505 ) ) ( not ( = ?auto_166503 ?auto_166504 ) ) ( not ( = ?auto_166503 ?auto_166505 ) ) ( not ( = ?auto_166504 ?auto_166505 ) ) ( ON ?auto_166505 ?auto_166506 ) ( not ( = ?auto_166499 ?auto_166506 ) ) ( not ( = ?auto_166500 ?auto_166506 ) ) ( not ( = ?auto_166501 ?auto_166506 ) ) ( not ( = ?auto_166502 ?auto_166506 ) ) ( not ( = ?auto_166503 ?auto_166506 ) ) ( not ( = ?auto_166504 ?auto_166506 ) ) ( not ( = ?auto_166505 ?auto_166506 ) ) ( ON ?auto_166504 ?auto_166505 ) ( ON-TABLE ?auto_166507 ) ( ON ?auto_166506 ?auto_166507 ) ( not ( = ?auto_166507 ?auto_166506 ) ) ( not ( = ?auto_166507 ?auto_166505 ) ) ( not ( = ?auto_166507 ?auto_166504 ) ) ( not ( = ?auto_166499 ?auto_166507 ) ) ( not ( = ?auto_166500 ?auto_166507 ) ) ( not ( = ?auto_166501 ?auto_166507 ) ) ( not ( = ?auto_166502 ?auto_166507 ) ) ( not ( = ?auto_166503 ?auto_166507 ) ) ( ON ?auto_166503 ?auto_166504 ) ( ON ?auto_166502 ?auto_166503 ) ( ON ?auto_166501 ?auto_166502 ) ( CLEAR ?auto_166499 ) ( ON ?auto_166500 ?auto_166501 ) ( CLEAR ?auto_166500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_166507 ?auto_166506 ?auto_166505 ?auto_166504 ?auto_166503 ?auto_166502 ?auto_166501 )
      ( MAKE-7PILE ?auto_166499 ?auto_166500 ?auto_166501 ?auto_166502 ?auto_166503 ?auto_166504 ?auto_166505 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166508 - BLOCK
      ?auto_166509 - BLOCK
      ?auto_166510 - BLOCK
      ?auto_166511 - BLOCK
      ?auto_166512 - BLOCK
      ?auto_166513 - BLOCK
      ?auto_166514 - BLOCK
    )
    :vars
    (
      ?auto_166515 - BLOCK
      ?auto_166516 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166508 ?auto_166509 ) ) ( not ( = ?auto_166508 ?auto_166510 ) ) ( not ( = ?auto_166508 ?auto_166511 ) ) ( not ( = ?auto_166508 ?auto_166512 ) ) ( not ( = ?auto_166508 ?auto_166513 ) ) ( not ( = ?auto_166508 ?auto_166514 ) ) ( not ( = ?auto_166509 ?auto_166510 ) ) ( not ( = ?auto_166509 ?auto_166511 ) ) ( not ( = ?auto_166509 ?auto_166512 ) ) ( not ( = ?auto_166509 ?auto_166513 ) ) ( not ( = ?auto_166509 ?auto_166514 ) ) ( not ( = ?auto_166510 ?auto_166511 ) ) ( not ( = ?auto_166510 ?auto_166512 ) ) ( not ( = ?auto_166510 ?auto_166513 ) ) ( not ( = ?auto_166510 ?auto_166514 ) ) ( not ( = ?auto_166511 ?auto_166512 ) ) ( not ( = ?auto_166511 ?auto_166513 ) ) ( not ( = ?auto_166511 ?auto_166514 ) ) ( not ( = ?auto_166512 ?auto_166513 ) ) ( not ( = ?auto_166512 ?auto_166514 ) ) ( not ( = ?auto_166513 ?auto_166514 ) ) ( ON ?auto_166514 ?auto_166515 ) ( not ( = ?auto_166508 ?auto_166515 ) ) ( not ( = ?auto_166509 ?auto_166515 ) ) ( not ( = ?auto_166510 ?auto_166515 ) ) ( not ( = ?auto_166511 ?auto_166515 ) ) ( not ( = ?auto_166512 ?auto_166515 ) ) ( not ( = ?auto_166513 ?auto_166515 ) ) ( not ( = ?auto_166514 ?auto_166515 ) ) ( ON ?auto_166513 ?auto_166514 ) ( ON-TABLE ?auto_166516 ) ( ON ?auto_166515 ?auto_166516 ) ( not ( = ?auto_166516 ?auto_166515 ) ) ( not ( = ?auto_166516 ?auto_166514 ) ) ( not ( = ?auto_166516 ?auto_166513 ) ) ( not ( = ?auto_166508 ?auto_166516 ) ) ( not ( = ?auto_166509 ?auto_166516 ) ) ( not ( = ?auto_166510 ?auto_166516 ) ) ( not ( = ?auto_166511 ?auto_166516 ) ) ( not ( = ?auto_166512 ?auto_166516 ) ) ( ON ?auto_166512 ?auto_166513 ) ( ON ?auto_166511 ?auto_166512 ) ( ON ?auto_166510 ?auto_166511 ) ( ON ?auto_166509 ?auto_166510 ) ( CLEAR ?auto_166509 ) ( HOLDING ?auto_166508 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_166508 )
      ( MAKE-7PILE ?auto_166508 ?auto_166509 ?auto_166510 ?auto_166511 ?auto_166512 ?auto_166513 ?auto_166514 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166517 - BLOCK
      ?auto_166518 - BLOCK
      ?auto_166519 - BLOCK
      ?auto_166520 - BLOCK
      ?auto_166521 - BLOCK
      ?auto_166522 - BLOCK
      ?auto_166523 - BLOCK
    )
    :vars
    (
      ?auto_166525 - BLOCK
      ?auto_166524 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166517 ?auto_166518 ) ) ( not ( = ?auto_166517 ?auto_166519 ) ) ( not ( = ?auto_166517 ?auto_166520 ) ) ( not ( = ?auto_166517 ?auto_166521 ) ) ( not ( = ?auto_166517 ?auto_166522 ) ) ( not ( = ?auto_166517 ?auto_166523 ) ) ( not ( = ?auto_166518 ?auto_166519 ) ) ( not ( = ?auto_166518 ?auto_166520 ) ) ( not ( = ?auto_166518 ?auto_166521 ) ) ( not ( = ?auto_166518 ?auto_166522 ) ) ( not ( = ?auto_166518 ?auto_166523 ) ) ( not ( = ?auto_166519 ?auto_166520 ) ) ( not ( = ?auto_166519 ?auto_166521 ) ) ( not ( = ?auto_166519 ?auto_166522 ) ) ( not ( = ?auto_166519 ?auto_166523 ) ) ( not ( = ?auto_166520 ?auto_166521 ) ) ( not ( = ?auto_166520 ?auto_166522 ) ) ( not ( = ?auto_166520 ?auto_166523 ) ) ( not ( = ?auto_166521 ?auto_166522 ) ) ( not ( = ?auto_166521 ?auto_166523 ) ) ( not ( = ?auto_166522 ?auto_166523 ) ) ( ON ?auto_166523 ?auto_166525 ) ( not ( = ?auto_166517 ?auto_166525 ) ) ( not ( = ?auto_166518 ?auto_166525 ) ) ( not ( = ?auto_166519 ?auto_166525 ) ) ( not ( = ?auto_166520 ?auto_166525 ) ) ( not ( = ?auto_166521 ?auto_166525 ) ) ( not ( = ?auto_166522 ?auto_166525 ) ) ( not ( = ?auto_166523 ?auto_166525 ) ) ( ON ?auto_166522 ?auto_166523 ) ( ON-TABLE ?auto_166524 ) ( ON ?auto_166525 ?auto_166524 ) ( not ( = ?auto_166524 ?auto_166525 ) ) ( not ( = ?auto_166524 ?auto_166523 ) ) ( not ( = ?auto_166524 ?auto_166522 ) ) ( not ( = ?auto_166517 ?auto_166524 ) ) ( not ( = ?auto_166518 ?auto_166524 ) ) ( not ( = ?auto_166519 ?auto_166524 ) ) ( not ( = ?auto_166520 ?auto_166524 ) ) ( not ( = ?auto_166521 ?auto_166524 ) ) ( ON ?auto_166521 ?auto_166522 ) ( ON ?auto_166520 ?auto_166521 ) ( ON ?auto_166519 ?auto_166520 ) ( ON ?auto_166518 ?auto_166519 ) ( ON ?auto_166517 ?auto_166518 ) ( CLEAR ?auto_166517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_166524 ?auto_166525 ?auto_166523 ?auto_166522 ?auto_166521 ?auto_166520 ?auto_166519 ?auto_166518 )
      ( MAKE-7PILE ?auto_166517 ?auto_166518 ?auto_166519 ?auto_166520 ?auto_166521 ?auto_166522 ?auto_166523 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_166527 - BLOCK
    )
    :vars
    (
      ?auto_166528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166528 ?auto_166527 ) ( CLEAR ?auto_166528 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_166527 ) ( not ( = ?auto_166527 ?auto_166528 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166528 ?auto_166527 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_166529 - BLOCK
    )
    :vars
    (
      ?auto_166530 - BLOCK
      ?auto_166531 - BLOCK
      ?auto_166532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166530 ?auto_166529 ) ( CLEAR ?auto_166530 ) ( ON-TABLE ?auto_166529 ) ( not ( = ?auto_166529 ?auto_166530 ) ) ( HOLDING ?auto_166531 ) ( CLEAR ?auto_166532 ) ( not ( = ?auto_166529 ?auto_166531 ) ) ( not ( = ?auto_166529 ?auto_166532 ) ) ( not ( = ?auto_166530 ?auto_166531 ) ) ( not ( = ?auto_166530 ?auto_166532 ) ) ( not ( = ?auto_166531 ?auto_166532 ) ) )
    :subtasks
    ( ( !STACK ?auto_166531 ?auto_166532 )
      ( MAKE-1PILE ?auto_166529 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_166533 - BLOCK
    )
    :vars
    (
      ?auto_166536 - BLOCK
      ?auto_166535 - BLOCK
      ?auto_166534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166536 ?auto_166533 ) ( ON-TABLE ?auto_166533 ) ( not ( = ?auto_166533 ?auto_166536 ) ) ( CLEAR ?auto_166535 ) ( not ( = ?auto_166533 ?auto_166534 ) ) ( not ( = ?auto_166533 ?auto_166535 ) ) ( not ( = ?auto_166536 ?auto_166534 ) ) ( not ( = ?auto_166536 ?auto_166535 ) ) ( not ( = ?auto_166534 ?auto_166535 ) ) ( ON ?auto_166534 ?auto_166536 ) ( CLEAR ?auto_166534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_166533 ?auto_166536 )
      ( MAKE-1PILE ?auto_166533 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_166537 - BLOCK
    )
    :vars
    (
      ?auto_166540 - BLOCK
      ?auto_166538 - BLOCK
      ?auto_166539 - BLOCK
      ?auto_166544 - BLOCK
      ?auto_166545 - BLOCK
      ?auto_166541 - BLOCK
      ?auto_166542 - BLOCK
      ?auto_166543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166540 ?auto_166537 ) ( ON-TABLE ?auto_166537 ) ( not ( = ?auto_166537 ?auto_166540 ) ) ( not ( = ?auto_166537 ?auto_166538 ) ) ( not ( = ?auto_166537 ?auto_166539 ) ) ( not ( = ?auto_166540 ?auto_166538 ) ) ( not ( = ?auto_166540 ?auto_166539 ) ) ( not ( = ?auto_166538 ?auto_166539 ) ) ( ON ?auto_166538 ?auto_166540 ) ( CLEAR ?auto_166538 ) ( HOLDING ?auto_166539 ) ( CLEAR ?auto_166544 ) ( ON-TABLE ?auto_166545 ) ( ON ?auto_166541 ?auto_166545 ) ( ON ?auto_166542 ?auto_166541 ) ( ON ?auto_166543 ?auto_166542 ) ( ON ?auto_166544 ?auto_166543 ) ( not ( = ?auto_166545 ?auto_166541 ) ) ( not ( = ?auto_166545 ?auto_166542 ) ) ( not ( = ?auto_166545 ?auto_166543 ) ) ( not ( = ?auto_166545 ?auto_166544 ) ) ( not ( = ?auto_166545 ?auto_166539 ) ) ( not ( = ?auto_166541 ?auto_166542 ) ) ( not ( = ?auto_166541 ?auto_166543 ) ) ( not ( = ?auto_166541 ?auto_166544 ) ) ( not ( = ?auto_166541 ?auto_166539 ) ) ( not ( = ?auto_166542 ?auto_166543 ) ) ( not ( = ?auto_166542 ?auto_166544 ) ) ( not ( = ?auto_166542 ?auto_166539 ) ) ( not ( = ?auto_166543 ?auto_166544 ) ) ( not ( = ?auto_166543 ?auto_166539 ) ) ( not ( = ?auto_166544 ?auto_166539 ) ) ( not ( = ?auto_166537 ?auto_166544 ) ) ( not ( = ?auto_166537 ?auto_166545 ) ) ( not ( = ?auto_166537 ?auto_166541 ) ) ( not ( = ?auto_166537 ?auto_166542 ) ) ( not ( = ?auto_166537 ?auto_166543 ) ) ( not ( = ?auto_166540 ?auto_166544 ) ) ( not ( = ?auto_166540 ?auto_166545 ) ) ( not ( = ?auto_166540 ?auto_166541 ) ) ( not ( = ?auto_166540 ?auto_166542 ) ) ( not ( = ?auto_166540 ?auto_166543 ) ) ( not ( = ?auto_166538 ?auto_166544 ) ) ( not ( = ?auto_166538 ?auto_166545 ) ) ( not ( = ?auto_166538 ?auto_166541 ) ) ( not ( = ?auto_166538 ?auto_166542 ) ) ( not ( = ?auto_166538 ?auto_166543 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_166545 ?auto_166541 ?auto_166542 ?auto_166543 ?auto_166544 ?auto_166539 )
      ( MAKE-1PILE ?auto_166537 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_166546 - BLOCK
    )
    :vars
    (
      ?auto_166551 - BLOCK
      ?auto_166549 - BLOCK
      ?auto_166554 - BLOCK
      ?auto_166547 - BLOCK
      ?auto_166550 - BLOCK
      ?auto_166548 - BLOCK
      ?auto_166553 - BLOCK
      ?auto_166552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166551 ?auto_166546 ) ( ON-TABLE ?auto_166546 ) ( not ( = ?auto_166546 ?auto_166551 ) ) ( not ( = ?auto_166546 ?auto_166549 ) ) ( not ( = ?auto_166546 ?auto_166554 ) ) ( not ( = ?auto_166551 ?auto_166549 ) ) ( not ( = ?auto_166551 ?auto_166554 ) ) ( not ( = ?auto_166549 ?auto_166554 ) ) ( ON ?auto_166549 ?auto_166551 ) ( CLEAR ?auto_166547 ) ( ON-TABLE ?auto_166550 ) ( ON ?auto_166548 ?auto_166550 ) ( ON ?auto_166553 ?auto_166548 ) ( ON ?auto_166552 ?auto_166553 ) ( ON ?auto_166547 ?auto_166552 ) ( not ( = ?auto_166550 ?auto_166548 ) ) ( not ( = ?auto_166550 ?auto_166553 ) ) ( not ( = ?auto_166550 ?auto_166552 ) ) ( not ( = ?auto_166550 ?auto_166547 ) ) ( not ( = ?auto_166550 ?auto_166554 ) ) ( not ( = ?auto_166548 ?auto_166553 ) ) ( not ( = ?auto_166548 ?auto_166552 ) ) ( not ( = ?auto_166548 ?auto_166547 ) ) ( not ( = ?auto_166548 ?auto_166554 ) ) ( not ( = ?auto_166553 ?auto_166552 ) ) ( not ( = ?auto_166553 ?auto_166547 ) ) ( not ( = ?auto_166553 ?auto_166554 ) ) ( not ( = ?auto_166552 ?auto_166547 ) ) ( not ( = ?auto_166552 ?auto_166554 ) ) ( not ( = ?auto_166547 ?auto_166554 ) ) ( not ( = ?auto_166546 ?auto_166547 ) ) ( not ( = ?auto_166546 ?auto_166550 ) ) ( not ( = ?auto_166546 ?auto_166548 ) ) ( not ( = ?auto_166546 ?auto_166553 ) ) ( not ( = ?auto_166546 ?auto_166552 ) ) ( not ( = ?auto_166551 ?auto_166547 ) ) ( not ( = ?auto_166551 ?auto_166550 ) ) ( not ( = ?auto_166551 ?auto_166548 ) ) ( not ( = ?auto_166551 ?auto_166553 ) ) ( not ( = ?auto_166551 ?auto_166552 ) ) ( not ( = ?auto_166549 ?auto_166547 ) ) ( not ( = ?auto_166549 ?auto_166550 ) ) ( not ( = ?auto_166549 ?auto_166548 ) ) ( not ( = ?auto_166549 ?auto_166553 ) ) ( not ( = ?auto_166549 ?auto_166552 ) ) ( ON ?auto_166554 ?auto_166549 ) ( CLEAR ?auto_166554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_166546 ?auto_166551 ?auto_166549 )
      ( MAKE-1PILE ?auto_166546 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_166555 - BLOCK
    )
    :vars
    (
      ?auto_166561 - BLOCK
      ?auto_166562 - BLOCK
      ?auto_166557 - BLOCK
      ?auto_166556 - BLOCK
      ?auto_166559 - BLOCK
      ?auto_166560 - BLOCK
      ?auto_166563 - BLOCK
      ?auto_166558 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166561 ?auto_166555 ) ( ON-TABLE ?auto_166555 ) ( not ( = ?auto_166555 ?auto_166561 ) ) ( not ( = ?auto_166555 ?auto_166562 ) ) ( not ( = ?auto_166555 ?auto_166557 ) ) ( not ( = ?auto_166561 ?auto_166562 ) ) ( not ( = ?auto_166561 ?auto_166557 ) ) ( not ( = ?auto_166562 ?auto_166557 ) ) ( ON ?auto_166562 ?auto_166561 ) ( ON-TABLE ?auto_166556 ) ( ON ?auto_166559 ?auto_166556 ) ( ON ?auto_166560 ?auto_166559 ) ( ON ?auto_166563 ?auto_166560 ) ( not ( = ?auto_166556 ?auto_166559 ) ) ( not ( = ?auto_166556 ?auto_166560 ) ) ( not ( = ?auto_166556 ?auto_166563 ) ) ( not ( = ?auto_166556 ?auto_166558 ) ) ( not ( = ?auto_166556 ?auto_166557 ) ) ( not ( = ?auto_166559 ?auto_166560 ) ) ( not ( = ?auto_166559 ?auto_166563 ) ) ( not ( = ?auto_166559 ?auto_166558 ) ) ( not ( = ?auto_166559 ?auto_166557 ) ) ( not ( = ?auto_166560 ?auto_166563 ) ) ( not ( = ?auto_166560 ?auto_166558 ) ) ( not ( = ?auto_166560 ?auto_166557 ) ) ( not ( = ?auto_166563 ?auto_166558 ) ) ( not ( = ?auto_166563 ?auto_166557 ) ) ( not ( = ?auto_166558 ?auto_166557 ) ) ( not ( = ?auto_166555 ?auto_166558 ) ) ( not ( = ?auto_166555 ?auto_166556 ) ) ( not ( = ?auto_166555 ?auto_166559 ) ) ( not ( = ?auto_166555 ?auto_166560 ) ) ( not ( = ?auto_166555 ?auto_166563 ) ) ( not ( = ?auto_166561 ?auto_166558 ) ) ( not ( = ?auto_166561 ?auto_166556 ) ) ( not ( = ?auto_166561 ?auto_166559 ) ) ( not ( = ?auto_166561 ?auto_166560 ) ) ( not ( = ?auto_166561 ?auto_166563 ) ) ( not ( = ?auto_166562 ?auto_166558 ) ) ( not ( = ?auto_166562 ?auto_166556 ) ) ( not ( = ?auto_166562 ?auto_166559 ) ) ( not ( = ?auto_166562 ?auto_166560 ) ) ( not ( = ?auto_166562 ?auto_166563 ) ) ( ON ?auto_166557 ?auto_166562 ) ( CLEAR ?auto_166557 ) ( HOLDING ?auto_166558 ) ( CLEAR ?auto_166563 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_166556 ?auto_166559 ?auto_166560 ?auto_166563 ?auto_166558 )
      ( MAKE-1PILE ?auto_166555 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_166564 - BLOCK
    )
    :vars
    (
      ?auto_166572 - BLOCK
      ?auto_166571 - BLOCK
      ?auto_166567 - BLOCK
      ?auto_166570 - BLOCK
      ?auto_166565 - BLOCK
      ?auto_166566 - BLOCK
      ?auto_166568 - BLOCK
      ?auto_166569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166572 ?auto_166564 ) ( ON-TABLE ?auto_166564 ) ( not ( = ?auto_166564 ?auto_166572 ) ) ( not ( = ?auto_166564 ?auto_166571 ) ) ( not ( = ?auto_166564 ?auto_166567 ) ) ( not ( = ?auto_166572 ?auto_166571 ) ) ( not ( = ?auto_166572 ?auto_166567 ) ) ( not ( = ?auto_166571 ?auto_166567 ) ) ( ON ?auto_166571 ?auto_166572 ) ( ON-TABLE ?auto_166570 ) ( ON ?auto_166565 ?auto_166570 ) ( ON ?auto_166566 ?auto_166565 ) ( ON ?auto_166568 ?auto_166566 ) ( not ( = ?auto_166570 ?auto_166565 ) ) ( not ( = ?auto_166570 ?auto_166566 ) ) ( not ( = ?auto_166570 ?auto_166568 ) ) ( not ( = ?auto_166570 ?auto_166569 ) ) ( not ( = ?auto_166570 ?auto_166567 ) ) ( not ( = ?auto_166565 ?auto_166566 ) ) ( not ( = ?auto_166565 ?auto_166568 ) ) ( not ( = ?auto_166565 ?auto_166569 ) ) ( not ( = ?auto_166565 ?auto_166567 ) ) ( not ( = ?auto_166566 ?auto_166568 ) ) ( not ( = ?auto_166566 ?auto_166569 ) ) ( not ( = ?auto_166566 ?auto_166567 ) ) ( not ( = ?auto_166568 ?auto_166569 ) ) ( not ( = ?auto_166568 ?auto_166567 ) ) ( not ( = ?auto_166569 ?auto_166567 ) ) ( not ( = ?auto_166564 ?auto_166569 ) ) ( not ( = ?auto_166564 ?auto_166570 ) ) ( not ( = ?auto_166564 ?auto_166565 ) ) ( not ( = ?auto_166564 ?auto_166566 ) ) ( not ( = ?auto_166564 ?auto_166568 ) ) ( not ( = ?auto_166572 ?auto_166569 ) ) ( not ( = ?auto_166572 ?auto_166570 ) ) ( not ( = ?auto_166572 ?auto_166565 ) ) ( not ( = ?auto_166572 ?auto_166566 ) ) ( not ( = ?auto_166572 ?auto_166568 ) ) ( not ( = ?auto_166571 ?auto_166569 ) ) ( not ( = ?auto_166571 ?auto_166570 ) ) ( not ( = ?auto_166571 ?auto_166565 ) ) ( not ( = ?auto_166571 ?auto_166566 ) ) ( not ( = ?auto_166571 ?auto_166568 ) ) ( ON ?auto_166567 ?auto_166571 ) ( CLEAR ?auto_166568 ) ( ON ?auto_166569 ?auto_166567 ) ( CLEAR ?auto_166569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_166564 ?auto_166572 ?auto_166571 ?auto_166567 )
      ( MAKE-1PILE ?auto_166564 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_166573 - BLOCK
    )
    :vars
    (
      ?auto_166580 - BLOCK
      ?auto_166575 - BLOCK
      ?auto_166574 - BLOCK
      ?auto_166578 - BLOCK
      ?auto_166579 - BLOCK
      ?auto_166577 - BLOCK
      ?auto_166581 - BLOCK
      ?auto_166576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166580 ?auto_166573 ) ( ON-TABLE ?auto_166573 ) ( not ( = ?auto_166573 ?auto_166580 ) ) ( not ( = ?auto_166573 ?auto_166575 ) ) ( not ( = ?auto_166573 ?auto_166574 ) ) ( not ( = ?auto_166580 ?auto_166575 ) ) ( not ( = ?auto_166580 ?auto_166574 ) ) ( not ( = ?auto_166575 ?auto_166574 ) ) ( ON ?auto_166575 ?auto_166580 ) ( ON-TABLE ?auto_166578 ) ( ON ?auto_166579 ?auto_166578 ) ( ON ?auto_166577 ?auto_166579 ) ( not ( = ?auto_166578 ?auto_166579 ) ) ( not ( = ?auto_166578 ?auto_166577 ) ) ( not ( = ?auto_166578 ?auto_166581 ) ) ( not ( = ?auto_166578 ?auto_166576 ) ) ( not ( = ?auto_166578 ?auto_166574 ) ) ( not ( = ?auto_166579 ?auto_166577 ) ) ( not ( = ?auto_166579 ?auto_166581 ) ) ( not ( = ?auto_166579 ?auto_166576 ) ) ( not ( = ?auto_166579 ?auto_166574 ) ) ( not ( = ?auto_166577 ?auto_166581 ) ) ( not ( = ?auto_166577 ?auto_166576 ) ) ( not ( = ?auto_166577 ?auto_166574 ) ) ( not ( = ?auto_166581 ?auto_166576 ) ) ( not ( = ?auto_166581 ?auto_166574 ) ) ( not ( = ?auto_166576 ?auto_166574 ) ) ( not ( = ?auto_166573 ?auto_166576 ) ) ( not ( = ?auto_166573 ?auto_166578 ) ) ( not ( = ?auto_166573 ?auto_166579 ) ) ( not ( = ?auto_166573 ?auto_166577 ) ) ( not ( = ?auto_166573 ?auto_166581 ) ) ( not ( = ?auto_166580 ?auto_166576 ) ) ( not ( = ?auto_166580 ?auto_166578 ) ) ( not ( = ?auto_166580 ?auto_166579 ) ) ( not ( = ?auto_166580 ?auto_166577 ) ) ( not ( = ?auto_166580 ?auto_166581 ) ) ( not ( = ?auto_166575 ?auto_166576 ) ) ( not ( = ?auto_166575 ?auto_166578 ) ) ( not ( = ?auto_166575 ?auto_166579 ) ) ( not ( = ?auto_166575 ?auto_166577 ) ) ( not ( = ?auto_166575 ?auto_166581 ) ) ( ON ?auto_166574 ?auto_166575 ) ( ON ?auto_166576 ?auto_166574 ) ( CLEAR ?auto_166576 ) ( HOLDING ?auto_166581 ) ( CLEAR ?auto_166577 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_166578 ?auto_166579 ?auto_166577 ?auto_166581 )
      ( MAKE-1PILE ?auto_166573 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_166582 - BLOCK
    )
    :vars
    (
      ?auto_166583 - BLOCK
      ?auto_166584 - BLOCK
      ?auto_166587 - BLOCK
      ?auto_166588 - BLOCK
      ?auto_166586 - BLOCK
      ?auto_166589 - BLOCK
      ?auto_166585 - BLOCK
      ?auto_166590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166583 ?auto_166582 ) ( ON-TABLE ?auto_166582 ) ( not ( = ?auto_166582 ?auto_166583 ) ) ( not ( = ?auto_166582 ?auto_166584 ) ) ( not ( = ?auto_166582 ?auto_166587 ) ) ( not ( = ?auto_166583 ?auto_166584 ) ) ( not ( = ?auto_166583 ?auto_166587 ) ) ( not ( = ?auto_166584 ?auto_166587 ) ) ( ON ?auto_166584 ?auto_166583 ) ( ON-TABLE ?auto_166588 ) ( ON ?auto_166586 ?auto_166588 ) ( ON ?auto_166589 ?auto_166586 ) ( not ( = ?auto_166588 ?auto_166586 ) ) ( not ( = ?auto_166588 ?auto_166589 ) ) ( not ( = ?auto_166588 ?auto_166585 ) ) ( not ( = ?auto_166588 ?auto_166590 ) ) ( not ( = ?auto_166588 ?auto_166587 ) ) ( not ( = ?auto_166586 ?auto_166589 ) ) ( not ( = ?auto_166586 ?auto_166585 ) ) ( not ( = ?auto_166586 ?auto_166590 ) ) ( not ( = ?auto_166586 ?auto_166587 ) ) ( not ( = ?auto_166589 ?auto_166585 ) ) ( not ( = ?auto_166589 ?auto_166590 ) ) ( not ( = ?auto_166589 ?auto_166587 ) ) ( not ( = ?auto_166585 ?auto_166590 ) ) ( not ( = ?auto_166585 ?auto_166587 ) ) ( not ( = ?auto_166590 ?auto_166587 ) ) ( not ( = ?auto_166582 ?auto_166590 ) ) ( not ( = ?auto_166582 ?auto_166588 ) ) ( not ( = ?auto_166582 ?auto_166586 ) ) ( not ( = ?auto_166582 ?auto_166589 ) ) ( not ( = ?auto_166582 ?auto_166585 ) ) ( not ( = ?auto_166583 ?auto_166590 ) ) ( not ( = ?auto_166583 ?auto_166588 ) ) ( not ( = ?auto_166583 ?auto_166586 ) ) ( not ( = ?auto_166583 ?auto_166589 ) ) ( not ( = ?auto_166583 ?auto_166585 ) ) ( not ( = ?auto_166584 ?auto_166590 ) ) ( not ( = ?auto_166584 ?auto_166588 ) ) ( not ( = ?auto_166584 ?auto_166586 ) ) ( not ( = ?auto_166584 ?auto_166589 ) ) ( not ( = ?auto_166584 ?auto_166585 ) ) ( ON ?auto_166587 ?auto_166584 ) ( ON ?auto_166590 ?auto_166587 ) ( CLEAR ?auto_166589 ) ( ON ?auto_166585 ?auto_166590 ) ( CLEAR ?auto_166585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_166582 ?auto_166583 ?auto_166584 ?auto_166587 ?auto_166590 )
      ( MAKE-1PILE ?auto_166582 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_166591 - BLOCK
    )
    :vars
    (
      ?auto_166592 - BLOCK
      ?auto_166596 - BLOCK
      ?auto_166599 - BLOCK
      ?auto_166594 - BLOCK
      ?auto_166593 - BLOCK
      ?auto_166595 - BLOCK
      ?auto_166597 - BLOCK
      ?auto_166598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166592 ?auto_166591 ) ( ON-TABLE ?auto_166591 ) ( not ( = ?auto_166591 ?auto_166592 ) ) ( not ( = ?auto_166591 ?auto_166596 ) ) ( not ( = ?auto_166591 ?auto_166599 ) ) ( not ( = ?auto_166592 ?auto_166596 ) ) ( not ( = ?auto_166592 ?auto_166599 ) ) ( not ( = ?auto_166596 ?auto_166599 ) ) ( ON ?auto_166596 ?auto_166592 ) ( ON-TABLE ?auto_166594 ) ( ON ?auto_166593 ?auto_166594 ) ( not ( = ?auto_166594 ?auto_166593 ) ) ( not ( = ?auto_166594 ?auto_166595 ) ) ( not ( = ?auto_166594 ?auto_166597 ) ) ( not ( = ?auto_166594 ?auto_166598 ) ) ( not ( = ?auto_166594 ?auto_166599 ) ) ( not ( = ?auto_166593 ?auto_166595 ) ) ( not ( = ?auto_166593 ?auto_166597 ) ) ( not ( = ?auto_166593 ?auto_166598 ) ) ( not ( = ?auto_166593 ?auto_166599 ) ) ( not ( = ?auto_166595 ?auto_166597 ) ) ( not ( = ?auto_166595 ?auto_166598 ) ) ( not ( = ?auto_166595 ?auto_166599 ) ) ( not ( = ?auto_166597 ?auto_166598 ) ) ( not ( = ?auto_166597 ?auto_166599 ) ) ( not ( = ?auto_166598 ?auto_166599 ) ) ( not ( = ?auto_166591 ?auto_166598 ) ) ( not ( = ?auto_166591 ?auto_166594 ) ) ( not ( = ?auto_166591 ?auto_166593 ) ) ( not ( = ?auto_166591 ?auto_166595 ) ) ( not ( = ?auto_166591 ?auto_166597 ) ) ( not ( = ?auto_166592 ?auto_166598 ) ) ( not ( = ?auto_166592 ?auto_166594 ) ) ( not ( = ?auto_166592 ?auto_166593 ) ) ( not ( = ?auto_166592 ?auto_166595 ) ) ( not ( = ?auto_166592 ?auto_166597 ) ) ( not ( = ?auto_166596 ?auto_166598 ) ) ( not ( = ?auto_166596 ?auto_166594 ) ) ( not ( = ?auto_166596 ?auto_166593 ) ) ( not ( = ?auto_166596 ?auto_166595 ) ) ( not ( = ?auto_166596 ?auto_166597 ) ) ( ON ?auto_166599 ?auto_166596 ) ( ON ?auto_166598 ?auto_166599 ) ( ON ?auto_166597 ?auto_166598 ) ( CLEAR ?auto_166597 ) ( HOLDING ?auto_166595 ) ( CLEAR ?auto_166593 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_166594 ?auto_166593 ?auto_166595 )
      ( MAKE-1PILE ?auto_166591 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_166600 - BLOCK
    )
    :vars
    (
      ?auto_166601 - BLOCK
      ?auto_166604 - BLOCK
      ?auto_166608 - BLOCK
      ?auto_166605 - BLOCK
      ?auto_166603 - BLOCK
      ?auto_166607 - BLOCK
      ?auto_166606 - BLOCK
      ?auto_166602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166601 ?auto_166600 ) ( ON-TABLE ?auto_166600 ) ( not ( = ?auto_166600 ?auto_166601 ) ) ( not ( = ?auto_166600 ?auto_166604 ) ) ( not ( = ?auto_166600 ?auto_166608 ) ) ( not ( = ?auto_166601 ?auto_166604 ) ) ( not ( = ?auto_166601 ?auto_166608 ) ) ( not ( = ?auto_166604 ?auto_166608 ) ) ( ON ?auto_166604 ?auto_166601 ) ( ON-TABLE ?auto_166605 ) ( ON ?auto_166603 ?auto_166605 ) ( not ( = ?auto_166605 ?auto_166603 ) ) ( not ( = ?auto_166605 ?auto_166607 ) ) ( not ( = ?auto_166605 ?auto_166606 ) ) ( not ( = ?auto_166605 ?auto_166602 ) ) ( not ( = ?auto_166605 ?auto_166608 ) ) ( not ( = ?auto_166603 ?auto_166607 ) ) ( not ( = ?auto_166603 ?auto_166606 ) ) ( not ( = ?auto_166603 ?auto_166602 ) ) ( not ( = ?auto_166603 ?auto_166608 ) ) ( not ( = ?auto_166607 ?auto_166606 ) ) ( not ( = ?auto_166607 ?auto_166602 ) ) ( not ( = ?auto_166607 ?auto_166608 ) ) ( not ( = ?auto_166606 ?auto_166602 ) ) ( not ( = ?auto_166606 ?auto_166608 ) ) ( not ( = ?auto_166602 ?auto_166608 ) ) ( not ( = ?auto_166600 ?auto_166602 ) ) ( not ( = ?auto_166600 ?auto_166605 ) ) ( not ( = ?auto_166600 ?auto_166603 ) ) ( not ( = ?auto_166600 ?auto_166607 ) ) ( not ( = ?auto_166600 ?auto_166606 ) ) ( not ( = ?auto_166601 ?auto_166602 ) ) ( not ( = ?auto_166601 ?auto_166605 ) ) ( not ( = ?auto_166601 ?auto_166603 ) ) ( not ( = ?auto_166601 ?auto_166607 ) ) ( not ( = ?auto_166601 ?auto_166606 ) ) ( not ( = ?auto_166604 ?auto_166602 ) ) ( not ( = ?auto_166604 ?auto_166605 ) ) ( not ( = ?auto_166604 ?auto_166603 ) ) ( not ( = ?auto_166604 ?auto_166607 ) ) ( not ( = ?auto_166604 ?auto_166606 ) ) ( ON ?auto_166608 ?auto_166604 ) ( ON ?auto_166602 ?auto_166608 ) ( ON ?auto_166606 ?auto_166602 ) ( CLEAR ?auto_166603 ) ( ON ?auto_166607 ?auto_166606 ) ( CLEAR ?auto_166607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_166600 ?auto_166601 ?auto_166604 ?auto_166608 ?auto_166602 ?auto_166606 )
      ( MAKE-1PILE ?auto_166600 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_166609 - BLOCK
    )
    :vars
    (
      ?auto_166612 - BLOCK
      ?auto_166610 - BLOCK
      ?auto_166611 - BLOCK
      ?auto_166613 - BLOCK
      ?auto_166615 - BLOCK
      ?auto_166617 - BLOCK
      ?auto_166614 - BLOCK
      ?auto_166616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166612 ?auto_166609 ) ( ON-TABLE ?auto_166609 ) ( not ( = ?auto_166609 ?auto_166612 ) ) ( not ( = ?auto_166609 ?auto_166610 ) ) ( not ( = ?auto_166609 ?auto_166611 ) ) ( not ( = ?auto_166612 ?auto_166610 ) ) ( not ( = ?auto_166612 ?auto_166611 ) ) ( not ( = ?auto_166610 ?auto_166611 ) ) ( ON ?auto_166610 ?auto_166612 ) ( ON-TABLE ?auto_166613 ) ( not ( = ?auto_166613 ?auto_166615 ) ) ( not ( = ?auto_166613 ?auto_166617 ) ) ( not ( = ?auto_166613 ?auto_166614 ) ) ( not ( = ?auto_166613 ?auto_166616 ) ) ( not ( = ?auto_166613 ?auto_166611 ) ) ( not ( = ?auto_166615 ?auto_166617 ) ) ( not ( = ?auto_166615 ?auto_166614 ) ) ( not ( = ?auto_166615 ?auto_166616 ) ) ( not ( = ?auto_166615 ?auto_166611 ) ) ( not ( = ?auto_166617 ?auto_166614 ) ) ( not ( = ?auto_166617 ?auto_166616 ) ) ( not ( = ?auto_166617 ?auto_166611 ) ) ( not ( = ?auto_166614 ?auto_166616 ) ) ( not ( = ?auto_166614 ?auto_166611 ) ) ( not ( = ?auto_166616 ?auto_166611 ) ) ( not ( = ?auto_166609 ?auto_166616 ) ) ( not ( = ?auto_166609 ?auto_166613 ) ) ( not ( = ?auto_166609 ?auto_166615 ) ) ( not ( = ?auto_166609 ?auto_166617 ) ) ( not ( = ?auto_166609 ?auto_166614 ) ) ( not ( = ?auto_166612 ?auto_166616 ) ) ( not ( = ?auto_166612 ?auto_166613 ) ) ( not ( = ?auto_166612 ?auto_166615 ) ) ( not ( = ?auto_166612 ?auto_166617 ) ) ( not ( = ?auto_166612 ?auto_166614 ) ) ( not ( = ?auto_166610 ?auto_166616 ) ) ( not ( = ?auto_166610 ?auto_166613 ) ) ( not ( = ?auto_166610 ?auto_166615 ) ) ( not ( = ?auto_166610 ?auto_166617 ) ) ( not ( = ?auto_166610 ?auto_166614 ) ) ( ON ?auto_166611 ?auto_166610 ) ( ON ?auto_166616 ?auto_166611 ) ( ON ?auto_166614 ?auto_166616 ) ( ON ?auto_166617 ?auto_166614 ) ( CLEAR ?auto_166617 ) ( HOLDING ?auto_166615 ) ( CLEAR ?auto_166613 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_166613 ?auto_166615 )
      ( MAKE-1PILE ?auto_166609 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_168788 - BLOCK
    )
    :vars
    (
      ?auto_168791 - BLOCK
      ?auto_168795 - BLOCK
      ?auto_168794 - BLOCK
      ?auto_168789 - BLOCK
      ?auto_168793 - BLOCK
      ?auto_168790 - BLOCK
      ?auto_168792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168791 ?auto_168788 ) ( ON-TABLE ?auto_168788 ) ( not ( = ?auto_168788 ?auto_168791 ) ) ( not ( = ?auto_168788 ?auto_168795 ) ) ( not ( = ?auto_168788 ?auto_168794 ) ) ( not ( = ?auto_168791 ?auto_168795 ) ) ( not ( = ?auto_168791 ?auto_168794 ) ) ( not ( = ?auto_168795 ?auto_168794 ) ) ( ON ?auto_168795 ?auto_168791 ) ( not ( = ?auto_168789 ?auto_168793 ) ) ( not ( = ?auto_168789 ?auto_168790 ) ) ( not ( = ?auto_168789 ?auto_168792 ) ) ( not ( = ?auto_168789 ?auto_168794 ) ) ( not ( = ?auto_168793 ?auto_168790 ) ) ( not ( = ?auto_168793 ?auto_168792 ) ) ( not ( = ?auto_168793 ?auto_168794 ) ) ( not ( = ?auto_168790 ?auto_168792 ) ) ( not ( = ?auto_168790 ?auto_168794 ) ) ( not ( = ?auto_168792 ?auto_168794 ) ) ( not ( = ?auto_168788 ?auto_168792 ) ) ( not ( = ?auto_168788 ?auto_168789 ) ) ( not ( = ?auto_168788 ?auto_168793 ) ) ( not ( = ?auto_168788 ?auto_168790 ) ) ( not ( = ?auto_168791 ?auto_168792 ) ) ( not ( = ?auto_168791 ?auto_168789 ) ) ( not ( = ?auto_168791 ?auto_168793 ) ) ( not ( = ?auto_168791 ?auto_168790 ) ) ( not ( = ?auto_168795 ?auto_168792 ) ) ( not ( = ?auto_168795 ?auto_168789 ) ) ( not ( = ?auto_168795 ?auto_168793 ) ) ( not ( = ?auto_168795 ?auto_168790 ) ) ( ON ?auto_168794 ?auto_168795 ) ( ON ?auto_168792 ?auto_168794 ) ( ON ?auto_168790 ?auto_168792 ) ( ON ?auto_168793 ?auto_168790 ) ( ON ?auto_168789 ?auto_168793 ) ( CLEAR ?auto_168789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_168788 ?auto_168791 ?auto_168795 ?auto_168794 ?auto_168792 ?auto_168790 ?auto_168793 )
      ( MAKE-1PILE ?auto_168788 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_166627 - BLOCK
    )
    :vars
    (
      ?auto_166633 - BLOCK
      ?auto_166632 - BLOCK
      ?auto_166631 - BLOCK
      ?auto_166630 - BLOCK
      ?auto_166634 - BLOCK
      ?auto_166629 - BLOCK
      ?auto_166635 - BLOCK
      ?auto_166628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166633 ?auto_166627 ) ( ON-TABLE ?auto_166627 ) ( not ( = ?auto_166627 ?auto_166633 ) ) ( not ( = ?auto_166627 ?auto_166632 ) ) ( not ( = ?auto_166627 ?auto_166631 ) ) ( not ( = ?auto_166633 ?auto_166632 ) ) ( not ( = ?auto_166633 ?auto_166631 ) ) ( not ( = ?auto_166632 ?auto_166631 ) ) ( ON ?auto_166632 ?auto_166633 ) ( not ( = ?auto_166630 ?auto_166634 ) ) ( not ( = ?auto_166630 ?auto_166629 ) ) ( not ( = ?auto_166630 ?auto_166635 ) ) ( not ( = ?auto_166630 ?auto_166628 ) ) ( not ( = ?auto_166630 ?auto_166631 ) ) ( not ( = ?auto_166634 ?auto_166629 ) ) ( not ( = ?auto_166634 ?auto_166635 ) ) ( not ( = ?auto_166634 ?auto_166628 ) ) ( not ( = ?auto_166634 ?auto_166631 ) ) ( not ( = ?auto_166629 ?auto_166635 ) ) ( not ( = ?auto_166629 ?auto_166628 ) ) ( not ( = ?auto_166629 ?auto_166631 ) ) ( not ( = ?auto_166635 ?auto_166628 ) ) ( not ( = ?auto_166635 ?auto_166631 ) ) ( not ( = ?auto_166628 ?auto_166631 ) ) ( not ( = ?auto_166627 ?auto_166628 ) ) ( not ( = ?auto_166627 ?auto_166630 ) ) ( not ( = ?auto_166627 ?auto_166634 ) ) ( not ( = ?auto_166627 ?auto_166629 ) ) ( not ( = ?auto_166627 ?auto_166635 ) ) ( not ( = ?auto_166633 ?auto_166628 ) ) ( not ( = ?auto_166633 ?auto_166630 ) ) ( not ( = ?auto_166633 ?auto_166634 ) ) ( not ( = ?auto_166633 ?auto_166629 ) ) ( not ( = ?auto_166633 ?auto_166635 ) ) ( not ( = ?auto_166632 ?auto_166628 ) ) ( not ( = ?auto_166632 ?auto_166630 ) ) ( not ( = ?auto_166632 ?auto_166634 ) ) ( not ( = ?auto_166632 ?auto_166629 ) ) ( not ( = ?auto_166632 ?auto_166635 ) ) ( ON ?auto_166631 ?auto_166632 ) ( ON ?auto_166628 ?auto_166631 ) ( ON ?auto_166635 ?auto_166628 ) ( ON ?auto_166629 ?auto_166635 ) ( ON ?auto_166634 ?auto_166629 ) ( CLEAR ?auto_166634 ) ( HOLDING ?auto_166630 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_166630 )
      ( MAKE-1PILE ?auto_166627 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_166636 - BLOCK
    )
    :vars
    (
      ?auto_166638 - BLOCK
      ?auto_166637 - BLOCK
      ?auto_166642 - BLOCK
      ?auto_166640 - BLOCK
      ?auto_166639 - BLOCK
      ?auto_166644 - BLOCK
      ?auto_166641 - BLOCK
      ?auto_166643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166638 ?auto_166636 ) ( ON-TABLE ?auto_166636 ) ( not ( = ?auto_166636 ?auto_166638 ) ) ( not ( = ?auto_166636 ?auto_166637 ) ) ( not ( = ?auto_166636 ?auto_166642 ) ) ( not ( = ?auto_166638 ?auto_166637 ) ) ( not ( = ?auto_166638 ?auto_166642 ) ) ( not ( = ?auto_166637 ?auto_166642 ) ) ( ON ?auto_166637 ?auto_166638 ) ( not ( = ?auto_166640 ?auto_166639 ) ) ( not ( = ?auto_166640 ?auto_166644 ) ) ( not ( = ?auto_166640 ?auto_166641 ) ) ( not ( = ?auto_166640 ?auto_166643 ) ) ( not ( = ?auto_166640 ?auto_166642 ) ) ( not ( = ?auto_166639 ?auto_166644 ) ) ( not ( = ?auto_166639 ?auto_166641 ) ) ( not ( = ?auto_166639 ?auto_166643 ) ) ( not ( = ?auto_166639 ?auto_166642 ) ) ( not ( = ?auto_166644 ?auto_166641 ) ) ( not ( = ?auto_166644 ?auto_166643 ) ) ( not ( = ?auto_166644 ?auto_166642 ) ) ( not ( = ?auto_166641 ?auto_166643 ) ) ( not ( = ?auto_166641 ?auto_166642 ) ) ( not ( = ?auto_166643 ?auto_166642 ) ) ( not ( = ?auto_166636 ?auto_166643 ) ) ( not ( = ?auto_166636 ?auto_166640 ) ) ( not ( = ?auto_166636 ?auto_166639 ) ) ( not ( = ?auto_166636 ?auto_166644 ) ) ( not ( = ?auto_166636 ?auto_166641 ) ) ( not ( = ?auto_166638 ?auto_166643 ) ) ( not ( = ?auto_166638 ?auto_166640 ) ) ( not ( = ?auto_166638 ?auto_166639 ) ) ( not ( = ?auto_166638 ?auto_166644 ) ) ( not ( = ?auto_166638 ?auto_166641 ) ) ( not ( = ?auto_166637 ?auto_166643 ) ) ( not ( = ?auto_166637 ?auto_166640 ) ) ( not ( = ?auto_166637 ?auto_166639 ) ) ( not ( = ?auto_166637 ?auto_166644 ) ) ( not ( = ?auto_166637 ?auto_166641 ) ) ( ON ?auto_166642 ?auto_166637 ) ( ON ?auto_166643 ?auto_166642 ) ( ON ?auto_166641 ?auto_166643 ) ( ON ?auto_166644 ?auto_166641 ) ( ON ?auto_166639 ?auto_166644 ) ( ON ?auto_166640 ?auto_166639 ) ( CLEAR ?auto_166640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_166636 ?auto_166638 ?auto_166637 ?auto_166642 ?auto_166643 ?auto_166641 ?auto_166644 ?auto_166639 )
      ( MAKE-1PILE ?auto_166636 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166653 - BLOCK
      ?auto_166654 - BLOCK
      ?auto_166655 - BLOCK
      ?auto_166656 - BLOCK
      ?auto_166657 - BLOCK
      ?auto_166658 - BLOCK
      ?auto_166659 - BLOCK
      ?auto_166660 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_166660 ) ( CLEAR ?auto_166659 ) ( ON-TABLE ?auto_166653 ) ( ON ?auto_166654 ?auto_166653 ) ( ON ?auto_166655 ?auto_166654 ) ( ON ?auto_166656 ?auto_166655 ) ( ON ?auto_166657 ?auto_166656 ) ( ON ?auto_166658 ?auto_166657 ) ( ON ?auto_166659 ?auto_166658 ) ( not ( = ?auto_166653 ?auto_166654 ) ) ( not ( = ?auto_166653 ?auto_166655 ) ) ( not ( = ?auto_166653 ?auto_166656 ) ) ( not ( = ?auto_166653 ?auto_166657 ) ) ( not ( = ?auto_166653 ?auto_166658 ) ) ( not ( = ?auto_166653 ?auto_166659 ) ) ( not ( = ?auto_166653 ?auto_166660 ) ) ( not ( = ?auto_166654 ?auto_166655 ) ) ( not ( = ?auto_166654 ?auto_166656 ) ) ( not ( = ?auto_166654 ?auto_166657 ) ) ( not ( = ?auto_166654 ?auto_166658 ) ) ( not ( = ?auto_166654 ?auto_166659 ) ) ( not ( = ?auto_166654 ?auto_166660 ) ) ( not ( = ?auto_166655 ?auto_166656 ) ) ( not ( = ?auto_166655 ?auto_166657 ) ) ( not ( = ?auto_166655 ?auto_166658 ) ) ( not ( = ?auto_166655 ?auto_166659 ) ) ( not ( = ?auto_166655 ?auto_166660 ) ) ( not ( = ?auto_166656 ?auto_166657 ) ) ( not ( = ?auto_166656 ?auto_166658 ) ) ( not ( = ?auto_166656 ?auto_166659 ) ) ( not ( = ?auto_166656 ?auto_166660 ) ) ( not ( = ?auto_166657 ?auto_166658 ) ) ( not ( = ?auto_166657 ?auto_166659 ) ) ( not ( = ?auto_166657 ?auto_166660 ) ) ( not ( = ?auto_166658 ?auto_166659 ) ) ( not ( = ?auto_166658 ?auto_166660 ) ) ( not ( = ?auto_166659 ?auto_166660 ) ) )
    :subtasks
    ( ( !STACK ?auto_166660 ?auto_166659 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166661 - BLOCK
      ?auto_166662 - BLOCK
      ?auto_166663 - BLOCK
      ?auto_166664 - BLOCK
      ?auto_166665 - BLOCK
      ?auto_166666 - BLOCK
      ?auto_166667 - BLOCK
      ?auto_166668 - BLOCK
    )
    :vars
    (
      ?auto_166669 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_166667 ) ( ON-TABLE ?auto_166661 ) ( ON ?auto_166662 ?auto_166661 ) ( ON ?auto_166663 ?auto_166662 ) ( ON ?auto_166664 ?auto_166663 ) ( ON ?auto_166665 ?auto_166664 ) ( ON ?auto_166666 ?auto_166665 ) ( ON ?auto_166667 ?auto_166666 ) ( not ( = ?auto_166661 ?auto_166662 ) ) ( not ( = ?auto_166661 ?auto_166663 ) ) ( not ( = ?auto_166661 ?auto_166664 ) ) ( not ( = ?auto_166661 ?auto_166665 ) ) ( not ( = ?auto_166661 ?auto_166666 ) ) ( not ( = ?auto_166661 ?auto_166667 ) ) ( not ( = ?auto_166661 ?auto_166668 ) ) ( not ( = ?auto_166662 ?auto_166663 ) ) ( not ( = ?auto_166662 ?auto_166664 ) ) ( not ( = ?auto_166662 ?auto_166665 ) ) ( not ( = ?auto_166662 ?auto_166666 ) ) ( not ( = ?auto_166662 ?auto_166667 ) ) ( not ( = ?auto_166662 ?auto_166668 ) ) ( not ( = ?auto_166663 ?auto_166664 ) ) ( not ( = ?auto_166663 ?auto_166665 ) ) ( not ( = ?auto_166663 ?auto_166666 ) ) ( not ( = ?auto_166663 ?auto_166667 ) ) ( not ( = ?auto_166663 ?auto_166668 ) ) ( not ( = ?auto_166664 ?auto_166665 ) ) ( not ( = ?auto_166664 ?auto_166666 ) ) ( not ( = ?auto_166664 ?auto_166667 ) ) ( not ( = ?auto_166664 ?auto_166668 ) ) ( not ( = ?auto_166665 ?auto_166666 ) ) ( not ( = ?auto_166665 ?auto_166667 ) ) ( not ( = ?auto_166665 ?auto_166668 ) ) ( not ( = ?auto_166666 ?auto_166667 ) ) ( not ( = ?auto_166666 ?auto_166668 ) ) ( not ( = ?auto_166667 ?auto_166668 ) ) ( ON ?auto_166668 ?auto_166669 ) ( CLEAR ?auto_166668 ) ( HAND-EMPTY ) ( not ( = ?auto_166661 ?auto_166669 ) ) ( not ( = ?auto_166662 ?auto_166669 ) ) ( not ( = ?auto_166663 ?auto_166669 ) ) ( not ( = ?auto_166664 ?auto_166669 ) ) ( not ( = ?auto_166665 ?auto_166669 ) ) ( not ( = ?auto_166666 ?auto_166669 ) ) ( not ( = ?auto_166667 ?auto_166669 ) ) ( not ( = ?auto_166668 ?auto_166669 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166668 ?auto_166669 )
      ( MAKE-8PILE ?auto_166661 ?auto_166662 ?auto_166663 ?auto_166664 ?auto_166665 ?auto_166666 ?auto_166667 ?auto_166668 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166670 - BLOCK
      ?auto_166671 - BLOCK
      ?auto_166672 - BLOCK
      ?auto_166673 - BLOCK
      ?auto_166674 - BLOCK
      ?auto_166675 - BLOCK
      ?auto_166676 - BLOCK
      ?auto_166677 - BLOCK
    )
    :vars
    (
      ?auto_166678 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166670 ) ( ON ?auto_166671 ?auto_166670 ) ( ON ?auto_166672 ?auto_166671 ) ( ON ?auto_166673 ?auto_166672 ) ( ON ?auto_166674 ?auto_166673 ) ( ON ?auto_166675 ?auto_166674 ) ( not ( = ?auto_166670 ?auto_166671 ) ) ( not ( = ?auto_166670 ?auto_166672 ) ) ( not ( = ?auto_166670 ?auto_166673 ) ) ( not ( = ?auto_166670 ?auto_166674 ) ) ( not ( = ?auto_166670 ?auto_166675 ) ) ( not ( = ?auto_166670 ?auto_166676 ) ) ( not ( = ?auto_166670 ?auto_166677 ) ) ( not ( = ?auto_166671 ?auto_166672 ) ) ( not ( = ?auto_166671 ?auto_166673 ) ) ( not ( = ?auto_166671 ?auto_166674 ) ) ( not ( = ?auto_166671 ?auto_166675 ) ) ( not ( = ?auto_166671 ?auto_166676 ) ) ( not ( = ?auto_166671 ?auto_166677 ) ) ( not ( = ?auto_166672 ?auto_166673 ) ) ( not ( = ?auto_166672 ?auto_166674 ) ) ( not ( = ?auto_166672 ?auto_166675 ) ) ( not ( = ?auto_166672 ?auto_166676 ) ) ( not ( = ?auto_166672 ?auto_166677 ) ) ( not ( = ?auto_166673 ?auto_166674 ) ) ( not ( = ?auto_166673 ?auto_166675 ) ) ( not ( = ?auto_166673 ?auto_166676 ) ) ( not ( = ?auto_166673 ?auto_166677 ) ) ( not ( = ?auto_166674 ?auto_166675 ) ) ( not ( = ?auto_166674 ?auto_166676 ) ) ( not ( = ?auto_166674 ?auto_166677 ) ) ( not ( = ?auto_166675 ?auto_166676 ) ) ( not ( = ?auto_166675 ?auto_166677 ) ) ( not ( = ?auto_166676 ?auto_166677 ) ) ( ON ?auto_166677 ?auto_166678 ) ( CLEAR ?auto_166677 ) ( not ( = ?auto_166670 ?auto_166678 ) ) ( not ( = ?auto_166671 ?auto_166678 ) ) ( not ( = ?auto_166672 ?auto_166678 ) ) ( not ( = ?auto_166673 ?auto_166678 ) ) ( not ( = ?auto_166674 ?auto_166678 ) ) ( not ( = ?auto_166675 ?auto_166678 ) ) ( not ( = ?auto_166676 ?auto_166678 ) ) ( not ( = ?auto_166677 ?auto_166678 ) ) ( HOLDING ?auto_166676 ) ( CLEAR ?auto_166675 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_166670 ?auto_166671 ?auto_166672 ?auto_166673 ?auto_166674 ?auto_166675 ?auto_166676 )
      ( MAKE-8PILE ?auto_166670 ?auto_166671 ?auto_166672 ?auto_166673 ?auto_166674 ?auto_166675 ?auto_166676 ?auto_166677 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166679 - BLOCK
      ?auto_166680 - BLOCK
      ?auto_166681 - BLOCK
      ?auto_166682 - BLOCK
      ?auto_166683 - BLOCK
      ?auto_166684 - BLOCK
      ?auto_166685 - BLOCK
      ?auto_166686 - BLOCK
    )
    :vars
    (
      ?auto_166687 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166679 ) ( ON ?auto_166680 ?auto_166679 ) ( ON ?auto_166681 ?auto_166680 ) ( ON ?auto_166682 ?auto_166681 ) ( ON ?auto_166683 ?auto_166682 ) ( ON ?auto_166684 ?auto_166683 ) ( not ( = ?auto_166679 ?auto_166680 ) ) ( not ( = ?auto_166679 ?auto_166681 ) ) ( not ( = ?auto_166679 ?auto_166682 ) ) ( not ( = ?auto_166679 ?auto_166683 ) ) ( not ( = ?auto_166679 ?auto_166684 ) ) ( not ( = ?auto_166679 ?auto_166685 ) ) ( not ( = ?auto_166679 ?auto_166686 ) ) ( not ( = ?auto_166680 ?auto_166681 ) ) ( not ( = ?auto_166680 ?auto_166682 ) ) ( not ( = ?auto_166680 ?auto_166683 ) ) ( not ( = ?auto_166680 ?auto_166684 ) ) ( not ( = ?auto_166680 ?auto_166685 ) ) ( not ( = ?auto_166680 ?auto_166686 ) ) ( not ( = ?auto_166681 ?auto_166682 ) ) ( not ( = ?auto_166681 ?auto_166683 ) ) ( not ( = ?auto_166681 ?auto_166684 ) ) ( not ( = ?auto_166681 ?auto_166685 ) ) ( not ( = ?auto_166681 ?auto_166686 ) ) ( not ( = ?auto_166682 ?auto_166683 ) ) ( not ( = ?auto_166682 ?auto_166684 ) ) ( not ( = ?auto_166682 ?auto_166685 ) ) ( not ( = ?auto_166682 ?auto_166686 ) ) ( not ( = ?auto_166683 ?auto_166684 ) ) ( not ( = ?auto_166683 ?auto_166685 ) ) ( not ( = ?auto_166683 ?auto_166686 ) ) ( not ( = ?auto_166684 ?auto_166685 ) ) ( not ( = ?auto_166684 ?auto_166686 ) ) ( not ( = ?auto_166685 ?auto_166686 ) ) ( ON ?auto_166686 ?auto_166687 ) ( not ( = ?auto_166679 ?auto_166687 ) ) ( not ( = ?auto_166680 ?auto_166687 ) ) ( not ( = ?auto_166681 ?auto_166687 ) ) ( not ( = ?auto_166682 ?auto_166687 ) ) ( not ( = ?auto_166683 ?auto_166687 ) ) ( not ( = ?auto_166684 ?auto_166687 ) ) ( not ( = ?auto_166685 ?auto_166687 ) ) ( not ( = ?auto_166686 ?auto_166687 ) ) ( CLEAR ?auto_166684 ) ( ON ?auto_166685 ?auto_166686 ) ( CLEAR ?auto_166685 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_166687 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_166687 ?auto_166686 )
      ( MAKE-8PILE ?auto_166679 ?auto_166680 ?auto_166681 ?auto_166682 ?auto_166683 ?auto_166684 ?auto_166685 ?auto_166686 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166688 - BLOCK
      ?auto_166689 - BLOCK
      ?auto_166690 - BLOCK
      ?auto_166691 - BLOCK
      ?auto_166692 - BLOCK
      ?auto_166693 - BLOCK
      ?auto_166694 - BLOCK
      ?auto_166695 - BLOCK
    )
    :vars
    (
      ?auto_166696 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166688 ) ( ON ?auto_166689 ?auto_166688 ) ( ON ?auto_166690 ?auto_166689 ) ( ON ?auto_166691 ?auto_166690 ) ( ON ?auto_166692 ?auto_166691 ) ( not ( = ?auto_166688 ?auto_166689 ) ) ( not ( = ?auto_166688 ?auto_166690 ) ) ( not ( = ?auto_166688 ?auto_166691 ) ) ( not ( = ?auto_166688 ?auto_166692 ) ) ( not ( = ?auto_166688 ?auto_166693 ) ) ( not ( = ?auto_166688 ?auto_166694 ) ) ( not ( = ?auto_166688 ?auto_166695 ) ) ( not ( = ?auto_166689 ?auto_166690 ) ) ( not ( = ?auto_166689 ?auto_166691 ) ) ( not ( = ?auto_166689 ?auto_166692 ) ) ( not ( = ?auto_166689 ?auto_166693 ) ) ( not ( = ?auto_166689 ?auto_166694 ) ) ( not ( = ?auto_166689 ?auto_166695 ) ) ( not ( = ?auto_166690 ?auto_166691 ) ) ( not ( = ?auto_166690 ?auto_166692 ) ) ( not ( = ?auto_166690 ?auto_166693 ) ) ( not ( = ?auto_166690 ?auto_166694 ) ) ( not ( = ?auto_166690 ?auto_166695 ) ) ( not ( = ?auto_166691 ?auto_166692 ) ) ( not ( = ?auto_166691 ?auto_166693 ) ) ( not ( = ?auto_166691 ?auto_166694 ) ) ( not ( = ?auto_166691 ?auto_166695 ) ) ( not ( = ?auto_166692 ?auto_166693 ) ) ( not ( = ?auto_166692 ?auto_166694 ) ) ( not ( = ?auto_166692 ?auto_166695 ) ) ( not ( = ?auto_166693 ?auto_166694 ) ) ( not ( = ?auto_166693 ?auto_166695 ) ) ( not ( = ?auto_166694 ?auto_166695 ) ) ( ON ?auto_166695 ?auto_166696 ) ( not ( = ?auto_166688 ?auto_166696 ) ) ( not ( = ?auto_166689 ?auto_166696 ) ) ( not ( = ?auto_166690 ?auto_166696 ) ) ( not ( = ?auto_166691 ?auto_166696 ) ) ( not ( = ?auto_166692 ?auto_166696 ) ) ( not ( = ?auto_166693 ?auto_166696 ) ) ( not ( = ?auto_166694 ?auto_166696 ) ) ( not ( = ?auto_166695 ?auto_166696 ) ) ( ON ?auto_166694 ?auto_166695 ) ( CLEAR ?auto_166694 ) ( ON-TABLE ?auto_166696 ) ( HOLDING ?auto_166693 ) ( CLEAR ?auto_166692 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_166688 ?auto_166689 ?auto_166690 ?auto_166691 ?auto_166692 ?auto_166693 )
      ( MAKE-8PILE ?auto_166688 ?auto_166689 ?auto_166690 ?auto_166691 ?auto_166692 ?auto_166693 ?auto_166694 ?auto_166695 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166697 - BLOCK
      ?auto_166698 - BLOCK
      ?auto_166699 - BLOCK
      ?auto_166700 - BLOCK
      ?auto_166701 - BLOCK
      ?auto_166702 - BLOCK
      ?auto_166703 - BLOCK
      ?auto_166704 - BLOCK
    )
    :vars
    (
      ?auto_166705 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166697 ) ( ON ?auto_166698 ?auto_166697 ) ( ON ?auto_166699 ?auto_166698 ) ( ON ?auto_166700 ?auto_166699 ) ( ON ?auto_166701 ?auto_166700 ) ( not ( = ?auto_166697 ?auto_166698 ) ) ( not ( = ?auto_166697 ?auto_166699 ) ) ( not ( = ?auto_166697 ?auto_166700 ) ) ( not ( = ?auto_166697 ?auto_166701 ) ) ( not ( = ?auto_166697 ?auto_166702 ) ) ( not ( = ?auto_166697 ?auto_166703 ) ) ( not ( = ?auto_166697 ?auto_166704 ) ) ( not ( = ?auto_166698 ?auto_166699 ) ) ( not ( = ?auto_166698 ?auto_166700 ) ) ( not ( = ?auto_166698 ?auto_166701 ) ) ( not ( = ?auto_166698 ?auto_166702 ) ) ( not ( = ?auto_166698 ?auto_166703 ) ) ( not ( = ?auto_166698 ?auto_166704 ) ) ( not ( = ?auto_166699 ?auto_166700 ) ) ( not ( = ?auto_166699 ?auto_166701 ) ) ( not ( = ?auto_166699 ?auto_166702 ) ) ( not ( = ?auto_166699 ?auto_166703 ) ) ( not ( = ?auto_166699 ?auto_166704 ) ) ( not ( = ?auto_166700 ?auto_166701 ) ) ( not ( = ?auto_166700 ?auto_166702 ) ) ( not ( = ?auto_166700 ?auto_166703 ) ) ( not ( = ?auto_166700 ?auto_166704 ) ) ( not ( = ?auto_166701 ?auto_166702 ) ) ( not ( = ?auto_166701 ?auto_166703 ) ) ( not ( = ?auto_166701 ?auto_166704 ) ) ( not ( = ?auto_166702 ?auto_166703 ) ) ( not ( = ?auto_166702 ?auto_166704 ) ) ( not ( = ?auto_166703 ?auto_166704 ) ) ( ON ?auto_166704 ?auto_166705 ) ( not ( = ?auto_166697 ?auto_166705 ) ) ( not ( = ?auto_166698 ?auto_166705 ) ) ( not ( = ?auto_166699 ?auto_166705 ) ) ( not ( = ?auto_166700 ?auto_166705 ) ) ( not ( = ?auto_166701 ?auto_166705 ) ) ( not ( = ?auto_166702 ?auto_166705 ) ) ( not ( = ?auto_166703 ?auto_166705 ) ) ( not ( = ?auto_166704 ?auto_166705 ) ) ( ON ?auto_166703 ?auto_166704 ) ( ON-TABLE ?auto_166705 ) ( CLEAR ?auto_166701 ) ( ON ?auto_166702 ?auto_166703 ) ( CLEAR ?auto_166702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_166705 ?auto_166704 ?auto_166703 )
      ( MAKE-8PILE ?auto_166697 ?auto_166698 ?auto_166699 ?auto_166700 ?auto_166701 ?auto_166702 ?auto_166703 ?auto_166704 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166706 - BLOCK
      ?auto_166707 - BLOCK
      ?auto_166708 - BLOCK
      ?auto_166709 - BLOCK
      ?auto_166710 - BLOCK
      ?auto_166711 - BLOCK
      ?auto_166712 - BLOCK
      ?auto_166713 - BLOCK
    )
    :vars
    (
      ?auto_166714 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166706 ) ( ON ?auto_166707 ?auto_166706 ) ( ON ?auto_166708 ?auto_166707 ) ( ON ?auto_166709 ?auto_166708 ) ( not ( = ?auto_166706 ?auto_166707 ) ) ( not ( = ?auto_166706 ?auto_166708 ) ) ( not ( = ?auto_166706 ?auto_166709 ) ) ( not ( = ?auto_166706 ?auto_166710 ) ) ( not ( = ?auto_166706 ?auto_166711 ) ) ( not ( = ?auto_166706 ?auto_166712 ) ) ( not ( = ?auto_166706 ?auto_166713 ) ) ( not ( = ?auto_166707 ?auto_166708 ) ) ( not ( = ?auto_166707 ?auto_166709 ) ) ( not ( = ?auto_166707 ?auto_166710 ) ) ( not ( = ?auto_166707 ?auto_166711 ) ) ( not ( = ?auto_166707 ?auto_166712 ) ) ( not ( = ?auto_166707 ?auto_166713 ) ) ( not ( = ?auto_166708 ?auto_166709 ) ) ( not ( = ?auto_166708 ?auto_166710 ) ) ( not ( = ?auto_166708 ?auto_166711 ) ) ( not ( = ?auto_166708 ?auto_166712 ) ) ( not ( = ?auto_166708 ?auto_166713 ) ) ( not ( = ?auto_166709 ?auto_166710 ) ) ( not ( = ?auto_166709 ?auto_166711 ) ) ( not ( = ?auto_166709 ?auto_166712 ) ) ( not ( = ?auto_166709 ?auto_166713 ) ) ( not ( = ?auto_166710 ?auto_166711 ) ) ( not ( = ?auto_166710 ?auto_166712 ) ) ( not ( = ?auto_166710 ?auto_166713 ) ) ( not ( = ?auto_166711 ?auto_166712 ) ) ( not ( = ?auto_166711 ?auto_166713 ) ) ( not ( = ?auto_166712 ?auto_166713 ) ) ( ON ?auto_166713 ?auto_166714 ) ( not ( = ?auto_166706 ?auto_166714 ) ) ( not ( = ?auto_166707 ?auto_166714 ) ) ( not ( = ?auto_166708 ?auto_166714 ) ) ( not ( = ?auto_166709 ?auto_166714 ) ) ( not ( = ?auto_166710 ?auto_166714 ) ) ( not ( = ?auto_166711 ?auto_166714 ) ) ( not ( = ?auto_166712 ?auto_166714 ) ) ( not ( = ?auto_166713 ?auto_166714 ) ) ( ON ?auto_166712 ?auto_166713 ) ( ON-TABLE ?auto_166714 ) ( ON ?auto_166711 ?auto_166712 ) ( CLEAR ?auto_166711 ) ( HOLDING ?auto_166710 ) ( CLEAR ?auto_166709 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_166706 ?auto_166707 ?auto_166708 ?auto_166709 ?auto_166710 )
      ( MAKE-8PILE ?auto_166706 ?auto_166707 ?auto_166708 ?auto_166709 ?auto_166710 ?auto_166711 ?auto_166712 ?auto_166713 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166715 - BLOCK
      ?auto_166716 - BLOCK
      ?auto_166717 - BLOCK
      ?auto_166718 - BLOCK
      ?auto_166719 - BLOCK
      ?auto_166720 - BLOCK
      ?auto_166721 - BLOCK
      ?auto_166722 - BLOCK
    )
    :vars
    (
      ?auto_166723 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166715 ) ( ON ?auto_166716 ?auto_166715 ) ( ON ?auto_166717 ?auto_166716 ) ( ON ?auto_166718 ?auto_166717 ) ( not ( = ?auto_166715 ?auto_166716 ) ) ( not ( = ?auto_166715 ?auto_166717 ) ) ( not ( = ?auto_166715 ?auto_166718 ) ) ( not ( = ?auto_166715 ?auto_166719 ) ) ( not ( = ?auto_166715 ?auto_166720 ) ) ( not ( = ?auto_166715 ?auto_166721 ) ) ( not ( = ?auto_166715 ?auto_166722 ) ) ( not ( = ?auto_166716 ?auto_166717 ) ) ( not ( = ?auto_166716 ?auto_166718 ) ) ( not ( = ?auto_166716 ?auto_166719 ) ) ( not ( = ?auto_166716 ?auto_166720 ) ) ( not ( = ?auto_166716 ?auto_166721 ) ) ( not ( = ?auto_166716 ?auto_166722 ) ) ( not ( = ?auto_166717 ?auto_166718 ) ) ( not ( = ?auto_166717 ?auto_166719 ) ) ( not ( = ?auto_166717 ?auto_166720 ) ) ( not ( = ?auto_166717 ?auto_166721 ) ) ( not ( = ?auto_166717 ?auto_166722 ) ) ( not ( = ?auto_166718 ?auto_166719 ) ) ( not ( = ?auto_166718 ?auto_166720 ) ) ( not ( = ?auto_166718 ?auto_166721 ) ) ( not ( = ?auto_166718 ?auto_166722 ) ) ( not ( = ?auto_166719 ?auto_166720 ) ) ( not ( = ?auto_166719 ?auto_166721 ) ) ( not ( = ?auto_166719 ?auto_166722 ) ) ( not ( = ?auto_166720 ?auto_166721 ) ) ( not ( = ?auto_166720 ?auto_166722 ) ) ( not ( = ?auto_166721 ?auto_166722 ) ) ( ON ?auto_166722 ?auto_166723 ) ( not ( = ?auto_166715 ?auto_166723 ) ) ( not ( = ?auto_166716 ?auto_166723 ) ) ( not ( = ?auto_166717 ?auto_166723 ) ) ( not ( = ?auto_166718 ?auto_166723 ) ) ( not ( = ?auto_166719 ?auto_166723 ) ) ( not ( = ?auto_166720 ?auto_166723 ) ) ( not ( = ?auto_166721 ?auto_166723 ) ) ( not ( = ?auto_166722 ?auto_166723 ) ) ( ON ?auto_166721 ?auto_166722 ) ( ON-TABLE ?auto_166723 ) ( ON ?auto_166720 ?auto_166721 ) ( CLEAR ?auto_166718 ) ( ON ?auto_166719 ?auto_166720 ) ( CLEAR ?auto_166719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_166723 ?auto_166722 ?auto_166721 ?auto_166720 )
      ( MAKE-8PILE ?auto_166715 ?auto_166716 ?auto_166717 ?auto_166718 ?auto_166719 ?auto_166720 ?auto_166721 ?auto_166722 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166724 - BLOCK
      ?auto_166725 - BLOCK
      ?auto_166726 - BLOCK
      ?auto_166727 - BLOCK
      ?auto_166728 - BLOCK
      ?auto_166729 - BLOCK
      ?auto_166730 - BLOCK
      ?auto_166731 - BLOCK
    )
    :vars
    (
      ?auto_166732 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166724 ) ( ON ?auto_166725 ?auto_166724 ) ( ON ?auto_166726 ?auto_166725 ) ( not ( = ?auto_166724 ?auto_166725 ) ) ( not ( = ?auto_166724 ?auto_166726 ) ) ( not ( = ?auto_166724 ?auto_166727 ) ) ( not ( = ?auto_166724 ?auto_166728 ) ) ( not ( = ?auto_166724 ?auto_166729 ) ) ( not ( = ?auto_166724 ?auto_166730 ) ) ( not ( = ?auto_166724 ?auto_166731 ) ) ( not ( = ?auto_166725 ?auto_166726 ) ) ( not ( = ?auto_166725 ?auto_166727 ) ) ( not ( = ?auto_166725 ?auto_166728 ) ) ( not ( = ?auto_166725 ?auto_166729 ) ) ( not ( = ?auto_166725 ?auto_166730 ) ) ( not ( = ?auto_166725 ?auto_166731 ) ) ( not ( = ?auto_166726 ?auto_166727 ) ) ( not ( = ?auto_166726 ?auto_166728 ) ) ( not ( = ?auto_166726 ?auto_166729 ) ) ( not ( = ?auto_166726 ?auto_166730 ) ) ( not ( = ?auto_166726 ?auto_166731 ) ) ( not ( = ?auto_166727 ?auto_166728 ) ) ( not ( = ?auto_166727 ?auto_166729 ) ) ( not ( = ?auto_166727 ?auto_166730 ) ) ( not ( = ?auto_166727 ?auto_166731 ) ) ( not ( = ?auto_166728 ?auto_166729 ) ) ( not ( = ?auto_166728 ?auto_166730 ) ) ( not ( = ?auto_166728 ?auto_166731 ) ) ( not ( = ?auto_166729 ?auto_166730 ) ) ( not ( = ?auto_166729 ?auto_166731 ) ) ( not ( = ?auto_166730 ?auto_166731 ) ) ( ON ?auto_166731 ?auto_166732 ) ( not ( = ?auto_166724 ?auto_166732 ) ) ( not ( = ?auto_166725 ?auto_166732 ) ) ( not ( = ?auto_166726 ?auto_166732 ) ) ( not ( = ?auto_166727 ?auto_166732 ) ) ( not ( = ?auto_166728 ?auto_166732 ) ) ( not ( = ?auto_166729 ?auto_166732 ) ) ( not ( = ?auto_166730 ?auto_166732 ) ) ( not ( = ?auto_166731 ?auto_166732 ) ) ( ON ?auto_166730 ?auto_166731 ) ( ON-TABLE ?auto_166732 ) ( ON ?auto_166729 ?auto_166730 ) ( ON ?auto_166728 ?auto_166729 ) ( CLEAR ?auto_166728 ) ( HOLDING ?auto_166727 ) ( CLEAR ?auto_166726 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_166724 ?auto_166725 ?auto_166726 ?auto_166727 )
      ( MAKE-8PILE ?auto_166724 ?auto_166725 ?auto_166726 ?auto_166727 ?auto_166728 ?auto_166729 ?auto_166730 ?auto_166731 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166733 - BLOCK
      ?auto_166734 - BLOCK
      ?auto_166735 - BLOCK
      ?auto_166736 - BLOCK
      ?auto_166737 - BLOCK
      ?auto_166738 - BLOCK
      ?auto_166739 - BLOCK
      ?auto_166740 - BLOCK
    )
    :vars
    (
      ?auto_166741 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166733 ) ( ON ?auto_166734 ?auto_166733 ) ( ON ?auto_166735 ?auto_166734 ) ( not ( = ?auto_166733 ?auto_166734 ) ) ( not ( = ?auto_166733 ?auto_166735 ) ) ( not ( = ?auto_166733 ?auto_166736 ) ) ( not ( = ?auto_166733 ?auto_166737 ) ) ( not ( = ?auto_166733 ?auto_166738 ) ) ( not ( = ?auto_166733 ?auto_166739 ) ) ( not ( = ?auto_166733 ?auto_166740 ) ) ( not ( = ?auto_166734 ?auto_166735 ) ) ( not ( = ?auto_166734 ?auto_166736 ) ) ( not ( = ?auto_166734 ?auto_166737 ) ) ( not ( = ?auto_166734 ?auto_166738 ) ) ( not ( = ?auto_166734 ?auto_166739 ) ) ( not ( = ?auto_166734 ?auto_166740 ) ) ( not ( = ?auto_166735 ?auto_166736 ) ) ( not ( = ?auto_166735 ?auto_166737 ) ) ( not ( = ?auto_166735 ?auto_166738 ) ) ( not ( = ?auto_166735 ?auto_166739 ) ) ( not ( = ?auto_166735 ?auto_166740 ) ) ( not ( = ?auto_166736 ?auto_166737 ) ) ( not ( = ?auto_166736 ?auto_166738 ) ) ( not ( = ?auto_166736 ?auto_166739 ) ) ( not ( = ?auto_166736 ?auto_166740 ) ) ( not ( = ?auto_166737 ?auto_166738 ) ) ( not ( = ?auto_166737 ?auto_166739 ) ) ( not ( = ?auto_166737 ?auto_166740 ) ) ( not ( = ?auto_166738 ?auto_166739 ) ) ( not ( = ?auto_166738 ?auto_166740 ) ) ( not ( = ?auto_166739 ?auto_166740 ) ) ( ON ?auto_166740 ?auto_166741 ) ( not ( = ?auto_166733 ?auto_166741 ) ) ( not ( = ?auto_166734 ?auto_166741 ) ) ( not ( = ?auto_166735 ?auto_166741 ) ) ( not ( = ?auto_166736 ?auto_166741 ) ) ( not ( = ?auto_166737 ?auto_166741 ) ) ( not ( = ?auto_166738 ?auto_166741 ) ) ( not ( = ?auto_166739 ?auto_166741 ) ) ( not ( = ?auto_166740 ?auto_166741 ) ) ( ON ?auto_166739 ?auto_166740 ) ( ON-TABLE ?auto_166741 ) ( ON ?auto_166738 ?auto_166739 ) ( ON ?auto_166737 ?auto_166738 ) ( CLEAR ?auto_166735 ) ( ON ?auto_166736 ?auto_166737 ) ( CLEAR ?auto_166736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_166741 ?auto_166740 ?auto_166739 ?auto_166738 ?auto_166737 )
      ( MAKE-8PILE ?auto_166733 ?auto_166734 ?auto_166735 ?auto_166736 ?auto_166737 ?auto_166738 ?auto_166739 ?auto_166740 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166742 - BLOCK
      ?auto_166743 - BLOCK
      ?auto_166744 - BLOCK
      ?auto_166745 - BLOCK
      ?auto_166746 - BLOCK
      ?auto_166747 - BLOCK
      ?auto_166748 - BLOCK
      ?auto_166749 - BLOCK
    )
    :vars
    (
      ?auto_166750 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166742 ) ( ON ?auto_166743 ?auto_166742 ) ( not ( = ?auto_166742 ?auto_166743 ) ) ( not ( = ?auto_166742 ?auto_166744 ) ) ( not ( = ?auto_166742 ?auto_166745 ) ) ( not ( = ?auto_166742 ?auto_166746 ) ) ( not ( = ?auto_166742 ?auto_166747 ) ) ( not ( = ?auto_166742 ?auto_166748 ) ) ( not ( = ?auto_166742 ?auto_166749 ) ) ( not ( = ?auto_166743 ?auto_166744 ) ) ( not ( = ?auto_166743 ?auto_166745 ) ) ( not ( = ?auto_166743 ?auto_166746 ) ) ( not ( = ?auto_166743 ?auto_166747 ) ) ( not ( = ?auto_166743 ?auto_166748 ) ) ( not ( = ?auto_166743 ?auto_166749 ) ) ( not ( = ?auto_166744 ?auto_166745 ) ) ( not ( = ?auto_166744 ?auto_166746 ) ) ( not ( = ?auto_166744 ?auto_166747 ) ) ( not ( = ?auto_166744 ?auto_166748 ) ) ( not ( = ?auto_166744 ?auto_166749 ) ) ( not ( = ?auto_166745 ?auto_166746 ) ) ( not ( = ?auto_166745 ?auto_166747 ) ) ( not ( = ?auto_166745 ?auto_166748 ) ) ( not ( = ?auto_166745 ?auto_166749 ) ) ( not ( = ?auto_166746 ?auto_166747 ) ) ( not ( = ?auto_166746 ?auto_166748 ) ) ( not ( = ?auto_166746 ?auto_166749 ) ) ( not ( = ?auto_166747 ?auto_166748 ) ) ( not ( = ?auto_166747 ?auto_166749 ) ) ( not ( = ?auto_166748 ?auto_166749 ) ) ( ON ?auto_166749 ?auto_166750 ) ( not ( = ?auto_166742 ?auto_166750 ) ) ( not ( = ?auto_166743 ?auto_166750 ) ) ( not ( = ?auto_166744 ?auto_166750 ) ) ( not ( = ?auto_166745 ?auto_166750 ) ) ( not ( = ?auto_166746 ?auto_166750 ) ) ( not ( = ?auto_166747 ?auto_166750 ) ) ( not ( = ?auto_166748 ?auto_166750 ) ) ( not ( = ?auto_166749 ?auto_166750 ) ) ( ON ?auto_166748 ?auto_166749 ) ( ON-TABLE ?auto_166750 ) ( ON ?auto_166747 ?auto_166748 ) ( ON ?auto_166746 ?auto_166747 ) ( ON ?auto_166745 ?auto_166746 ) ( CLEAR ?auto_166745 ) ( HOLDING ?auto_166744 ) ( CLEAR ?auto_166743 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_166742 ?auto_166743 ?auto_166744 )
      ( MAKE-8PILE ?auto_166742 ?auto_166743 ?auto_166744 ?auto_166745 ?auto_166746 ?auto_166747 ?auto_166748 ?auto_166749 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166751 - BLOCK
      ?auto_166752 - BLOCK
      ?auto_166753 - BLOCK
      ?auto_166754 - BLOCK
      ?auto_166755 - BLOCK
      ?auto_166756 - BLOCK
      ?auto_166757 - BLOCK
      ?auto_166758 - BLOCK
    )
    :vars
    (
      ?auto_166759 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166751 ) ( ON ?auto_166752 ?auto_166751 ) ( not ( = ?auto_166751 ?auto_166752 ) ) ( not ( = ?auto_166751 ?auto_166753 ) ) ( not ( = ?auto_166751 ?auto_166754 ) ) ( not ( = ?auto_166751 ?auto_166755 ) ) ( not ( = ?auto_166751 ?auto_166756 ) ) ( not ( = ?auto_166751 ?auto_166757 ) ) ( not ( = ?auto_166751 ?auto_166758 ) ) ( not ( = ?auto_166752 ?auto_166753 ) ) ( not ( = ?auto_166752 ?auto_166754 ) ) ( not ( = ?auto_166752 ?auto_166755 ) ) ( not ( = ?auto_166752 ?auto_166756 ) ) ( not ( = ?auto_166752 ?auto_166757 ) ) ( not ( = ?auto_166752 ?auto_166758 ) ) ( not ( = ?auto_166753 ?auto_166754 ) ) ( not ( = ?auto_166753 ?auto_166755 ) ) ( not ( = ?auto_166753 ?auto_166756 ) ) ( not ( = ?auto_166753 ?auto_166757 ) ) ( not ( = ?auto_166753 ?auto_166758 ) ) ( not ( = ?auto_166754 ?auto_166755 ) ) ( not ( = ?auto_166754 ?auto_166756 ) ) ( not ( = ?auto_166754 ?auto_166757 ) ) ( not ( = ?auto_166754 ?auto_166758 ) ) ( not ( = ?auto_166755 ?auto_166756 ) ) ( not ( = ?auto_166755 ?auto_166757 ) ) ( not ( = ?auto_166755 ?auto_166758 ) ) ( not ( = ?auto_166756 ?auto_166757 ) ) ( not ( = ?auto_166756 ?auto_166758 ) ) ( not ( = ?auto_166757 ?auto_166758 ) ) ( ON ?auto_166758 ?auto_166759 ) ( not ( = ?auto_166751 ?auto_166759 ) ) ( not ( = ?auto_166752 ?auto_166759 ) ) ( not ( = ?auto_166753 ?auto_166759 ) ) ( not ( = ?auto_166754 ?auto_166759 ) ) ( not ( = ?auto_166755 ?auto_166759 ) ) ( not ( = ?auto_166756 ?auto_166759 ) ) ( not ( = ?auto_166757 ?auto_166759 ) ) ( not ( = ?auto_166758 ?auto_166759 ) ) ( ON ?auto_166757 ?auto_166758 ) ( ON-TABLE ?auto_166759 ) ( ON ?auto_166756 ?auto_166757 ) ( ON ?auto_166755 ?auto_166756 ) ( ON ?auto_166754 ?auto_166755 ) ( CLEAR ?auto_166752 ) ( ON ?auto_166753 ?auto_166754 ) ( CLEAR ?auto_166753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_166759 ?auto_166758 ?auto_166757 ?auto_166756 ?auto_166755 ?auto_166754 )
      ( MAKE-8PILE ?auto_166751 ?auto_166752 ?auto_166753 ?auto_166754 ?auto_166755 ?auto_166756 ?auto_166757 ?auto_166758 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166760 - BLOCK
      ?auto_166761 - BLOCK
      ?auto_166762 - BLOCK
      ?auto_166763 - BLOCK
      ?auto_166764 - BLOCK
      ?auto_166765 - BLOCK
      ?auto_166766 - BLOCK
      ?auto_166767 - BLOCK
    )
    :vars
    (
      ?auto_166768 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166760 ) ( not ( = ?auto_166760 ?auto_166761 ) ) ( not ( = ?auto_166760 ?auto_166762 ) ) ( not ( = ?auto_166760 ?auto_166763 ) ) ( not ( = ?auto_166760 ?auto_166764 ) ) ( not ( = ?auto_166760 ?auto_166765 ) ) ( not ( = ?auto_166760 ?auto_166766 ) ) ( not ( = ?auto_166760 ?auto_166767 ) ) ( not ( = ?auto_166761 ?auto_166762 ) ) ( not ( = ?auto_166761 ?auto_166763 ) ) ( not ( = ?auto_166761 ?auto_166764 ) ) ( not ( = ?auto_166761 ?auto_166765 ) ) ( not ( = ?auto_166761 ?auto_166766 ) ) ( not ( = ?auto_166761 ?auto_166767 ) ) ( not ( = ?auto_166762 ?auto_166763 ) ) ( not ( = ?auto_166762 ?auto_166764 ) ) ( not ( = ?auto_166762 ?auto_166765 ) ) ( not ( = ?auto_166762 ?auto_166766 ) ) ( not ( = ?auto_166762 ?auto_166767 ) ) ( not ( = ?auto_166763 ?auto_166764 ) ) ( not ( = ?auto_166763 ?auto_166765 ) ) ( not ( = ?auto_166763 ?auto_166766 ) ) ( not ( = ?auto_166763 ?auto_166767 ) ) ( not ( = ?auto_166764 ?auto_166765 ) ) ( not ( = ?auto_166764 ?auto_166766 ) ) ( not ( = ?auto_166764 ?auto_166767 ) ) ( not ( = ?auto_166765 ?auto_166766 ) ) ( not ( = ?auto_166765 ?auto_166767 ) ) ( not ( = ?auto_166766 ?auto_166767 ) ) ( ON ?auto_166767 ?auto_166768 ) ( not ( = ?auto_166760 ?auto_166768 ) ) ( not ( = ?auto_166761 ?auto_166768 ) ) ( not ( = ?auto_166762 ?auto_166768 ) ) ( not ( = ?auto_166763 ?auto_166768 ) ) ( not ( = ?auto_166764 ?auto_166768 ) ) ( not ( = ?auto_166765 ?auto_166768 ) ) ( not ( = ?auto_166766 ?auto_166768 ) ) ( not ( = ?auto_166767 ?auto_166768 ) ) ( ON ?auto_166766 ?auto_166767 ) ( ON-TABLE ?auto_166768 ) ( ON ?auto_166765 ?auto_166766 ) ( ON ?auto_166764 ?auto_166765 ) ( ON ?auto_166763 ?auto_166764 ) ( ON ?auto_166762 ?auto_166763 ) ( CLEAR ?auto_166762 ) ( HOLDING ?auto_166761 ) ( CLEAR ?auto_166760 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_166760 ?auto_166761 )
      ( MAKE-8PILE ?auto_166760 ?auto_166761 ?auto_166762 ?auto_166763 ?auto_166764 ?auto_166765 ?auto_166766 ?auto_166767 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166769 - BLOCK
      ?auto_166770 - BLOCK
      ?auto_166771 - BLOCK
      ?auto_166772 - BLOCK
      ?auto_166773 - BLOCK
      ?auto_166774 - BLOCK
      ?auto_166775 - BLOCK
      ?auto_166776 - BLOCK
    )
    :vars
    (
      ?auto_166777 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166769 ) ( not ( = ?auto_166769 ?auto_166770 ) ) ( not ( = ?auto_166769 ?auto_166771 ) ) ( not ( = ?auto_166769 ?auto_166772 ) ) ( not ( = ?auto_166769 ?auto_166773 ) ) ( not ( = ?auto_166769 ?auto_166774 ) ) ( not ( = ?auto_166769 ?auto_166775 ) ) ( not ( = ?auto_166769 ?auto_166776 ) ) ( not ( = ?auto_166770 ?auto_166771 ) ) ( not ( = ?auto_166770 ?auto_166772 ) ) ( not ( = ?auto_166770 ?auto_166773 ) ) ( not ( = ?auto_166770 ?auto_166774 ) ) ( not ( = ?auto_166770 ?auto_166775 ) ) ( not ( = ?auto_166770 ?auto_166776 ) ) ( not ( = ?auto_166771 ?auto_166772 ) ) ( not ( = ?auto_166771 ?auto_166773 ) ) ( not ( = ?auto_166771 ?auto_166774 ) ) ( not ( = ?auto_166771 ?auto_166775 ) ) ( not ( = ?auto_166771 ?auto_166776 ) ) ( not ( = ?auto_166772 ?auto_166773 ) ) ( not ( = ?auto_166772 ?auto_166774 ) ) ( not ( = ?auto_166772 ?auto_166775 ) ) ( not ( = ?auto_166772 ?auto_166776 ) ) ( not ( = ?auto_166773 ?auto_166774 ) ) ( not ( = ?auto_166773 ?auto_166775 ) ) ( not ( = ?auto_166773 ?auto_166776 ) ) ( not ( = ?auto_166774 ?auto_166775 ) ) ( not ( = ?auto_166774 ?auto_166776 ) ) ( not ( = ?auto_166775 ?auto_166776 ) ) ( ON ?auto_166776 ?auto_166777 ) ( not ( = ?auto_166769 ?auto_166777 ) ) ( not ( = ?auto_166770 ?auto_166777 ) ) ( not ( = ?auto_166771 ?auto_166777 ) ) ( not ( = ?auto_166772 ?auto_166777 ) ) ( not ( = ?auto_166773 ?auto_166777 ) ) ( not ( = ?auto_166774 ?auto_166777 ) ) ( not ( = ?auto_166775 ?auto_166777 ) ) ( not ( = ?auto_166776 ?auto_166777 ) ) ( ON ?auto_166775 ?auto_166776 ) ( ON-TABLE ?auto_166777 ) ( ON ?auto_166774 ?auto_166775 ) ( ON ?auto_166773 ?auto_166774 ) ( ON ?auto_166772 ?auto_166773 ) ( ON ?auto_166771 ?auto_166772 ) ( CLEAR ?auto_166769 ) ( ON ?auto_166770 ?auto_166771 ) ( CLEAR ?auto_166770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_166777 ?auto_166776 ?auto_166775 ?auto_166774 ?auto_166773 ?auto_166772 ?auto_166771 )
      ( MAKE-8PILE ?auto_166769 ?auto_166770 ?auto_166771 ?auto_166772 ?auto_166773 ?auto_166774 ?auto_166775 ?auto_166776 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166778 - BLOCK
      ?auto_166779 - BLOCK
      ?auto_166780 - BLOCK
      ?auto_166781 - BLOCK
      ?auto_166782 - BLOCK
      ?auto_166783 - BLOCK
      ?auto_166784 - BLOCK
      ?auto_166785 - BLOCK
    )
    :vars
    (
      ?auto_166786 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166778 ?auto_166779 ) ) ( not ( = ?auto_166778 ?auto_166780 ) ) ( not ( = ?auto_166778 ?auto_166781 ) ) ( not ( = ?auto_166778 ?auto_166782 ) ) ( not ( = ?auto_166778 ?auto_166783 ) ) ( not ( = ?auto_166778 ?auto_166784 ) ) ( not ( = ?auto_166778 ?auto_166785 ) ) ( not ( = ?auto_166779 ?auto_166780 ) ) ( not ( = ?auto_166779 ?auto_166781 ) ) ( not ( = ?auto_166779 ?auto_166782 ) ) ( not ( = ?auto_166779 ?auto_166783 ) ) ( not ( = ?auto_166779 ?auto_166784 ) ) ( not ( = ?auto_166779 ?auto_166785 ) ) ( not ( = ?auto_166780 ?auto_166781 ) ) ( not ( = ?auto_166780 ?auto_166782 ) ) ( not ( = ?auto_166780 ?auto_166783 ) ) ( not ( = ?auto_166780 ?auto_166784 ) ) ( not ( = ?auto_166780 ?auto_166785 ) ) ( not ( = ?auto_166781 ?auto_166782 ) ) ( not ( = ?auto_166781 ?auto_166783 ) ) ( not ( = ?auto_166781 ?auto_166784 ) ) ( not ( = ?auto_166781 ?auto_166785 ) ) ( not ( = ?auto_166782 ?auto_166783 ) ) ( not ( = ?auto_166782 ?auto_166784 ) ) ( not ( = ?auto_166782 ?auto_166785 ) ) ( not ( = ?auto_166783 ?auto_166784 ) ) ( not ( = ?auto_166783 ?auto_166785 ) ) ( not ( = ?auto_166784 ?auto_166785 ) ) ( ON ?auto_166785 ?auto_166786 ) ( not ( = ?auto_166778 ?auto_166786 ) ) ( not ( = ?auto_166779 ?auto_166786 ) ) ( not ( = ?auto_166780 ?auto_166786 ) ) ( not ( = ?auto_166781 ?auto_166786 ) ) ( not ( = ?auto_166782 ?auto_166786 ) ) ( not ( = ?auto_166783 ?auto_166786 ) ) ( not ( = ?auto_166784 ?auto_166786 ) ) ( not ( = ?auto_166785 ?auto_166786 ) ) ( ON ?auto_166784 ?auto_166785 ) ( ON-TABLE ?auto_166786 ) ( ON ?auto_166783 ?auto_166784 ) ( ON ?auto_166782 ?auto_166783 ) ( ON ?auto_166781 ?auto_166782 ) ( ON ?auto_166780 ?auto_166781 ) ( ON ?auto_166779 ?auto_166780 ) ( CLEAR ?auto_166779 ) ( HOLDING ?auto_166778 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_166778 )
      ( MAKE-8PILE ?auto_166778 ?auto_166779 ?auto_166780 ?auto_166781 ?auto_166782 ?auto_166783 ?auto_166784 ?auto_166785 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166787 - BLOCK
      ?auto_166788 - BLOCK
      ?auto_166789 - BLOCK
      ?auto_166790 - BLOCK
      ?auto_166791 - BLOCK
      ?auto_166792 - BLOCK
      ?auto_166793 - BLOCK
      ?auto_166794 - BLOCK
    )
    :vars
    (
      ?auto_166795 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166787 ?auto_166788 ) ) ( not ( = ?auto_166787 ?auto_166789 ) ) ( not ( = ?auto_166787 ?auto_166790 ) ) ( not ( = ?auto_166787 ?auto_166791 ) ) ( not ( = ?auto_166787 ?auto_166792 ) ) ( not ( = ?auto_166787 ?auto_166793 ) ) ( not ( = ?auto_166787 ?auto_166794 ) ) ( not ( = ?auto_166788 ?auto_166789 ) ) ( not ( = ?auto_166788 ?auto_166790 ) ) ( not ( = ?auto_166788 ?auto_166791 ) ) ( not ( = ?auto_166788 ?auto_166792 ) ) ( not ( = ?auto_166788 ?auto_166793 ) ) ( not ( = ?auto_166788 ?auto_166794 ) ) ( not ( = ?auto_166789 ?auto_166790 ) ) ( not ( = ?auto_166789 ?auto_166791 ) ) ( not ( = ?auto_166789 ?auto_166792 ) ) ( not ( = ?auto_166789 ?auto_166793 ) ) ( not ( = ?auto_166789 ?auto_166794 ) ) ( not ( = ?auto_166790 ?auto_166791 ) ) ( not ( = ?auto_166790 ?auto_166792 ) ) ( not ( = ?auto_166790 ?auto_166793 ) ) ( not ( = ?auto_166790 ?auto_166794 ) ) ( not ( = ?auto_166791 ?auto_166792 ) ) ( not ( = ?auto_166791 ?auto_166793 ) ) ( not ( = ?auto_166791 ?auto_166794 ) ) ( not ( = ?auto_166792 ?auto_166793 ) ) ( not ( = ?auto_166792 ?auto_166794 ) ) ( not ( = ?auto_166793 ?auto_166794 ) ) ( ON ?auto_166794 ?auto_166795 ) ( not ( = ?auto_166787 ?auto_166795 ) ) ( not ( = ?auto_166788 ?auto_166795 ) ) ( not ( = ?auto_166789 ?auto_166795 ) ) ( not ( = ?auto_166790 ?auto_166795 ) ) ( not ( = ?auto_166791 ?auto_166795 ) ) ( not ( = ?auto_166792 ?auto_166795 ) ) ( not ( = ?auto_166793 ?auto_166795 ) ) ( not ( = ?auto_166794 ?auto_166795 ) ) ( ON ?auto_166793 ?auto_166794 ) ( ON-TABLE ?auto_166795 ) ( ON ?auto_166792 ?auto_166793 ) ( ON ?auto_166791 ?auto_166792 ) ( ON ?auto_166790 ?auto_166791 ) ( ON ?auto_166789 ?auto_166790 ) ( ON ?auto_166788 ?auto_166789 ) ( ON ?auto_166787 ?auto_166788 ) ( CLEAR ?auto_166787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_166795 ?auto_166794 ?auto_166793 ?auto_166792 ?auto_166791 ?auto_166790 ?auto_166789 ?auto_166788 )
      ( MAKE-8PILE ?auto_166787 ?auto_166788 ?auto_166789 ?auto_166790 ?auto_166791 ?auto_166792 ?auto_166793 ?auto_166794 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_166932 - BLOCK
    )
    :vars
    (
      ?auto_166933 - BLOCK
      ?auto_166934 - BLOCK
      ?auto_166935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166932 ?auto_166933 ) ( CLEAR ?auto_166932 ) ( not ( = ?auto_166932 ?auto_166933 ) ) ( HOLDING ?auto_166934 ) ( CLEAR ?auto_166935 ) ( not ( = ?auto_166932 ?auto_166934 ) ) ( not ( = ?auto_166932 ?auto_166935 ) ) ( not ( = ?auto_166933 ?auto_166934 ) ) ( not ( = ?auto_166933 ?auto_166935 ) ) ( not ( = ?auto_166934 ?auto_166935 ) ) )
    :subtasks
    ( ( !STACK ?auto_166934 ?auto_166935 )
      ( MAKE-1PILE ?auto_166932 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_166936 - BLOCK
    )
    :vars
    (
      ?auto_166938 - BLOCK
      ?auto_166939 - BLOCK
      ?auto_166937 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166936 ?auto_166938 ) ( not ( = ?auto_166936 ?auto_166938 ) ) ( CLEAR ?auto_166939 ) ( not ( = ?auto_166936 ?auto_166937 ) ) ( not ( = ?auto_166936 ?auto_166939 ) ) ( not ( = ?auto_166938 ?auto_166937 ) ) ( not ( = ?auto_166938 ?auto_166939 ) ) ( not ( = ?auto_166937 ?auto_166939 ) ) ( ON ?auto_166937 ?auto_166936 ) ( CLEAR ?auto_166937 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_166938 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_166938 ?auto_166936 )
      ( MAKE-1PILE ?auto_166936 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_166940 - BLOCK
    )
    :vars
    (
      ?auto_166943 - BLOCK
      ?auto_166941 - BLOCK
      ?auto_166942 - BLOCK
      ?auto_166947 - BLOCK
      ?auto_166948 - BLOCK
      ?auto_166944 - BLOCK
      ?auto_166945 - BLOCK
      ?auto_166946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166940 ?auto_166943 ) ( not ( = ?auto_166940 ?auto_166943 ) ) ( not ( = ?auto_166940 ?auto_166941 ) ) ( not ( = ?auto_166940 ?auto_166942 ) ) ( not ( = ?auto_166943 ?auto_166941 ) ) ( not ( = ?auto_166943 ?auto_166942 ) ) ( not ( = ?auto_166941 ?auto_166942 ) ) ( ON ?auto_166941 ?auto_166940 ) ( CLEAR ?auto_166941 ) ( ON-TABLE ?auto_166943 ) ( HOLDING ?auto_166942 ) ( CLEAR ?auto_166947 ) ( ON-TABLE ?auto_166948 ) ( ON ?auto_166944 ?auto_166948 ) ( ON ?auto_166945 ?auto_166944 ) ( ON ?auto_166946 ?auto_166945 ) ( ON ?auto_166947 ?auto_166946 ) ( not ( = ?auto_166948 ?auto_166944 ) ) ( not ( = ?auto_166948 ?auto_166945 ) ) ( not ( = ?auto_166948 ?auto_166946 ) ) ( not ( = ?auto_166948 ?auto_166947 ) ) ( not ( = ?auto_166948 ?auto_166942 ) ) ( not ( = ?auto_166944 ?auto_166945 ) ) ( not ( = ?auto_166944 ?auto_166946 ) ) ( not ( = ?auto_166944 ?auto_166947 ) ) ( not ( = ?auto_166944 ?auto_166942 ) ) ( not ( = ?auto_166945 ?auto_166946 ) ) ( not ( = ?auto_166945 ?auto_166947 ) ) ( not ( = ?auto_166945 ?auto_166942 ) ) ( not ( = ?auto_166946 ?auto_166947 ) ) ( not ( = ?auto_166946 ?auto_166942 ) ) ( not ( = ?auto_166947 ?auto_166942 ) ) ( not ( = ?auto_166940 ?auto_166947 ) ) ( not ( = ?auto_166940 ?auto_166948 ) ) ( not ( = ?auto_166940 ?auto_166944 ) ) ( not ( = ?auto_166940 ?auto_166945 ) ) ( not ( = ?auto_166940 ?auto_166946 ) ) ( not ( = ?auto_166943 ?auto_166947 ) ) ( not ( = ?auto_166943 ?auto_166948 ) ) ( not ( = ?auto_166943 ?auto_166944 ) ) ( not ( = ?auto_166943 ?auto_166945 ) ) ( not ( = ?auto_166943 ?auto_166946 ) ) ( not ( = ?auto_166941 ?auto_166947 ) ) ( not ( = ?auto_166941 ?auto_166948 ) ) ( not ( = ?auto_166941 ?auto_166944 ) ) ( not ( = ?auto_166941 ?auto_166945 ) ) ( not ( = ?auto_166941 ?auto_166946 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_166948 ?auto_166944 ?auto_166945 ?auto_166946 ?auto_166947 ?auto_166942 )
      ( MAKE-1PILE ?auto_166940 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_166949 - BLOCK
    )
    :vars
    (
      ?auto_166954 - BLOCK
      ?auto_166953 - BLOCK
      ?auto_166957 - BLOCK
      ?auto_166951 - BLOCK
      ?auto_166956 - BLOCK
      ?auto_166950 - BLOCK
      ?auto_166955 - BLOCK
      ?auto_166952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166949 ?auto_166954 ) ( not ( = ?auto_166949 ?auto_166954 ) ) ( not ( = ?auto_166949 ?auto_166953 ) ) ( not ( = ?auto_166949 ?auto_166957 ) ) ( not ( = ?auto_166954 ?auto_166953 ) ) ( not ( = ?auto_166954 ?auto_166957 ) ) ( not ( = ?auto_166953 ?auto_166957 ) ) ( ON ?auto_166953 ?auto_166949 ) ( ON-TABLE ?auto_166954 ) ( CLEAR ?auto_166951 ) ( ON-TABLE ?auto_166956 ) ( ON ?auto_166950 ?auto_166956 ) ( ON ?auto_166955 ?auto_166950 ) ( ON ?auto_166952 ?auto_166955 ) ( ON ?auto_166951 ?auto_166952 ) ( not ( = ?auto_166956 ?auto_166950 ) ) ( not ( = ?auto_166956 ?auto_166955 ) ) ( not ( = ?auto_166956 ?auto_166952 ) ) ( not ( = ?auto_166956 ?auto_166951 ) ) ( not ( = ?auto_166956 ?auto_166957 ) ) ( not ( = ?auto_166950 ?auto_166955 ) ) ( not ( = ?auto_166950 ?auto_166952 ) ) ( not ( = ?auto_166950 ?auto_166951 ) ) ( not ( = ?auto_166950 ?auto_166957 ) ) ( not ( = ?auto_166955 ?auto_166952 ) ) ( not ( = ?auto_166955 ?auto_166951 ) ) ( not ( = ?auto_166955 ?auto_166957 ) ) ( not ( = ?auto_166952 ?auto_166951 ) ) ( not ( = ?auto_166952 ?auto_166957 ) ) ( not ( = ?auto_166951 ?auto_166957 ) ) ( not ( = ?auto_166949 ?auto_166951 ) ) ( not ( = ?auto_166949 ?auto_166956 ) ) ( not ( = ?auto_166949 ?auto_166950 ) ) ( not ( = ?auto_166949 ?auto_166955 ) ) ( not ( = ?auto_166949 ?auto_166952 ) ) ( not ( = ?auto_166954 ?auto_166951 ) ) ( not ( = ?auto_166954 ?auto_166956 ) ) ( not ( = ?auto_166954 ?auto_166950 ) ) ( not ( = ?auto_166954 ?auto_166955 ) ) ( not ( = ?auto_166954 ?auto_166952 ) ) ( not ( = ?auto_166953 ?auto_166951 ) ) ( not ( = ?auto_166953 ?auto_166956 ) ) ( not ( = ?auto_166953 ?auto_166950 ) ) ( not ( = ?auto_166953 ?auto_166955 ) ) ( not ( = ?auto_166953 ?auto_166952 ) ) ( ON ?auto_166957 ?auto_166953 ) ( CLEAR ?auto_166957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_166954 ?auto_166949 ?auto_166953 )
      ( MAKE-1PILE ?auto_166949 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_166958 - BLOCK
    )
    :vars
    (
      ?auto_166965 - BLOCK
      ?auto_166963 - BLOCK
      ?auto_166964 - BLOCK
      ?auto_166961 - BLOCK
      ?auto_166966 - BLOCK
      ?auto_166959 - BLOCK
      ?auto_166960 - BLOCK
      ?auto_166962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166958 ?auto_166965 ) ( not ( = ?auto_166958 ?auto_166965 ) ) ( not ( = ?auto_166958 ?auto_166963 ) ) ( not ( = ?auto_166958 ?auto_166964 ) ) ( not ( = ?auto_166965 ?auto_166963 ) ) ( not ( = ?auto_166965 ?auto_166964 ) ) ( not ( = ?auto_166963 ?auto_166964 ) ) ( ON ?auto_166963 ?auto_166958 ) ( ON-TABLE ?auto_166965 ) ( ON-TABLE ?auto_166961 ) ( ON ?auto_166966 ?auto_166961 ) ( ON ?auto_166959 ?auto_166966 ) ( ON ?auto_166960 ?auto_166959 ) ( not ( = ?auto_166961 ?auto_166966 ) ) ( not ( = ?auto_166961 ?auto_166959 ) ) ( not ( = ?auto_166961 ?auto_166960 ) ) ( not ( = ?auto_166961 ?auto_166962 ) ) ( not ( = ?auto_166961 ?auto_166964 ) ) ( not ( = ?auto_166966 ?auto_166959 ) ) ( not ( = ?auto_166966 ?auto_166960 ) ) ( not ( = ?auto_166966 ?auto_166962 ) ) ( not ( = ?auto_166966 ?auto_166964 ) ) ( not ( = ?auto_166959 ?auto_166960 ) ) ( not ( = ?auto_166959 ?auto_166962 ) ) ( not ( = ?auto_166959 ?auto_166964 ) ) ( not ( = ?auto_166960 ?auto_166962 ) ) ( not ( = ?auto_166960 ?auto_166964 ) ) ( not ( = ?auto_166962 ?auto_166964 ) ) ( not ( = ?auto_166958 ?auto_166962 ) ) ( not ( = ?auto_166958 ?auto_166961 ) ) ( not ( = ?auto_166958 ?auto_166966 ) ) ( not ( = ?auto_166958 ?auto_166959 ) ) ( not ( = ?auto_166958 ?auto_166960 ) ) ( not ( = ?auto_166965 ?auto_166962 ) ) ( not ( = ?auto_166965 ?auto_166961 ) ) ( not ( = ?auto_166965 ?auto_166966 ) ) ( not ( = ?auto_166965 ?auto_166959 ) ) ( not ( = ?auto_166965 ?auto_166960 ) ) ( not ( = ?auto_166963 ?auto_166962 ) ) ( not ( = ?auto_166963 ?auto_166961 ) ) ( not ( = ?auto_166963 ?auto_166966 ) ) ( not ( = ?auto_166963 ?auto_166959 ) ) ( not ( = ?auto_166963 ?auto_166960 ) ) ( ON ?auto_166964 ?auto_166963 ) ( CLEAR ?auto_166964 ) ( HOLDING ?auto_166962 ) ( CLEAR ?auto_166960 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_166961 ?auto_166966 ?auto_166959 ?auto_166960 ?auto_166962 )
      ( MAKE-1PILE ?auto_166958 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_166967 - BLOCK
    )
    :vars
    (
      ?auto_166971 - BLOCK
      ?auto_166968 - BLOCK
      ?auto_166972 - BLOCK
      ?auto_166969 - BLOCK
      ?auto_166970 - BLOCK
      ?auto_166974 - BLOCK
      ?auto_166973 - BLOCK
      ?auto_166975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166967 ?auto_166971 ) ( not ( = ?auto_166967 ?auto_166971 ) ) ( not ( = ?auto_166967 ?auto_166968 ) ) ( not ( = ?auto_166967 ?auto_166972 ) ) ( not ( = ?auto_166971 ?auto_166968 ) ) ( not ( = ?auto_166971 ?auto_166972 ) ) ( not ( = ?auto_166968 ?auto_166972 ) ) ( ON ?auto_166968 ?auto_166967 ) ( ON-TABLE ?auto_166971 ) ( ON-TABLE ?auto_166969 ) ( ON ?auto_166970 ?auto_166969 ) ( ON ?auto_166974 ?auto_166970 ) ( ON ?auto_166973 ?auto_166974 ) ( not ( = ?auto_166969 ?auto_166970 ) ) ( not ( = ?auto_166969 ?auto_166974 ) ) ( not ( = ?auto_166969 ?auto_166973 ) ) ( not ( = ?auto_166969 ?auto_166975 ) ) ( not ( = ?auto_166969 ?auto_166972 ) ) ( not ( = ?auto_166970 ?auto_166974 ) ) ( not ( = ?auto_166970 ?auto_166973 ) ) ( not ( = ?auto_166970 ?auto_166975 ) ) ( not ( = ?auto_166970 ?auto_166972 ) ) ( not ( = ?auto_166974 ?auto_166973 ) ) ( not ( = ?auto_166974 ?auto_166975 ) ) ( not ( = ?auto_166974 ?auto_166972 ) ) ( not ( = ?auto_166973 ?auto_166975 ) ) ( not ( = ?auto_166973 ?auto_166972 ) ) ( not ( = ?auto_166975 ?auto_166972 ) ) ( not ( = ?auto_166967 ?auto_166975 ) ) ( not ( = ?auto_166967 ?auto_166969 ) ) ( not ( = ?auto_166967 ?auto_166970 ) ) ( not ( = ?auto_166967 ?auto_166974 ) ) ( not ( = ?auto_166967 ?auto_166973 ) ) ( not ( = ?auto_166971 ?auto_166975 ) ) ( not ( = ?auto_166971 ?auto_166969 ) ) ( not ( = ?auto_166971 ?auto_166970 ) ) ( not ( = ?auto_166971 ?auto_166974 ) ) ( not ( = ?auto_166971 ?auto_166973 ) ) ( not ( = ?auto_166968 ?auto_166975 ) ) ( not ( = ?auto_166968 ?auto_166969 ) ) ( not ( = ?auto_166968 ?auto_166970 ) ) ( not ( = ?auto_166968 ?auto_166974 ) ) ( not ( = ?auto_166968 ?auto_166973 ) ) ( ON ?auto_166972 ?auto_166968 ) ( CLEAR ?auto_166973 ) ( ON ?auto_166975 ?auto_166972 ) ( CLEAR ?auto_166975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_166971 ?auto_166967 ?auto_166968 ?auto_166972 )
      ( MAKE-1PILE ?auto_166967 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_166976 - BLOCK
    )
    :vars
    (
      ?auto_166979 - BLOCK
      ?auto_166977 - BLOCK
      ?auto_166978 - BLOCK
      ?auto_166981 - BLOCK
      ?auto_166982 - BLOCK
      ?auto_166983 - BLOCK
      ?auto_166980 - BLOCK
      ?auto_166984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166976 ?auto_166979 ) ( not ( = ?auto_166976 ?auto_166979 ) ) ( not ( = ?auto_166976 ?auto_166977 ) ) ( not ( = ?auto_166976 ?auto_166978 ) ) ( not ( = ?auto_166979 ?auto_166977 ) ) ( not ( = ?auto_166979 ?auto_166978 ) ) ( not ( = ?auto_166977 ?auto_166978 ) ) ( ON ?auto_166977 ?auto_166976 ) ( ON-TABLE ?auto_166979 ) ( ON-TABLE ?auto_166981 ) ( ON ?auto_166982 ?auto_166981 ) ( ON ?auto_166983 ?auto_166982 ) ( not ( = ?auto_166981 ?auto_166982 ) ) ( not ( = ?auto_166981 ?auto_166983 ) ) ( not ( = ?auto_166981 ?auto_166980 ) ) ( not ( = ?auto_166981 ?auto_166984 ) ) ( not ( = ?auto_166981 ?auto_166978 ) ) ( not ( = ?auto_166982 ?auto_166983 ) ) ( not ( = ?auto_166982 ?auto_166980 ) ) ( not ( = ?auto_166982 ?auto_166984 ) ) ( not ( = ?auto_166982 ?auto_166978 ) ) ( not ( = ?auto_166983 ?auto_166980 ) ) ( not ( = ?auto_166983 ?auto_166984 ) ) ( not ( = ?auto_166983 ?auto_166978 ) ) ( not ( = ?auto_166980 ?auto_166984 ) ) ( not ( = ?auto_166980 ?auto_166978 ) ) ( not ( = ?auto_166984 ?auto_166978 ) ) ( not ( = ?auto_166976 ?auto_166984 ) ) ( not ( = ?auto_166976 ?auto_166981 ) ) ( not ( = ?auto_166976 ?auto_166982 ) ) ( not ( = ?auto_166976 ?auto_166983 ) ) ( not ( = ?auto_166976 ?auto_166980 ) ) ( not ( = ?auto_166979 ?auto_166984 ) ) ( not ( = ?auto_166979 ?auto_166981 ) ) ( not ( = ?auto_166979 ?auto_166982 ) ) ( not ( = ?auto_166979 ?auto_166983 ) ) ( not ( = ?auto_166979 ?auto_166980 ) ) ( not ( = ?auto_166977 ?auto_166984 ) ) ( not ( = ?auto_166977 ?auto_166981 ) ) ( not ( = ?auto_166977 ?auto_166982 ) ) ( not ( = ?auto_166977 ?auto_166983 ) ) ( not ( = ?auto_166977 ?auto_166980 ) ) ( ON ?auto_166978 ?auto_166977 ) ( ON ?auto_166984 ?auto_166978 ) ( CLEAR ?auto_166984 ) ( HOLDING ?auto_166980 ) ( CLEAR ?auto_166983 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_166981 ?auto_166982 ?auto_166983 ?auto_166980 )
      ( MAKE-1PILE ?auto_166976 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_166985 - BLOCK
    )
    :vars
    (
      ?auto_166988 - BLOCK
      ?auto_166991 - BLOCK
      ?auto_166993 - BLOCK
      ?auto_166986 - BLOCK
      ?auto_166989 - BLOCK
      ?auto_166987 - BLOCK
      ?auto_166992 - BLOCK
      ?auto_166990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166985 ?auto_166988 ) ( not ( = ?auto_166985 ?auto_166988 ) ) ( not ( = ?auto_166985 ?auto_166991 ) ) ( not ( = ?auto_166985 ?auto_166993 ) ) ( not ( = ?auto_166988 ?auto_166991 ) ) ( not ( = ?auto_166988 ?auto_166993 ) ) ( not ( = ?auto_166991 ?auto_166993 ) ) ( ON ?auto_166991 ?auto_166985 ) ( ON-TABLE ?auto_166988 ) ( ON-TABLE ?auto_166986 ) ( ON ?auto_166989 ?auto_166986 ) ( ON ?auto_166987 ?auto_166989 ) ( not ( = ?auto_166986 ?auto_166989 ) ) ( not ( = ?auto_166986 ?auto_166987 ) ) ( not ( = ?auto_166986 ?auto_166992 ) ) ( not ( = ?auto_166986 ?auto_166990 ) ) ( not ( = ?auto_166986 ?auto_166993 ) ) ( not ( = ?auto_166989 ?auto_166987 ) ) ( not ( = ?auto_166989 ?auto_166992 ) ) ( not ( = ?auto_166989 ?auto_166990 ) ) ( not ( = ?auto_166989 ?auto_166993 ) ) ( not ( = ?auto_166987 ?auto_166992 ) ) ( not ( = ?auto_166987 ?auto_166990 ) ) ( not ( = ?auto_166987 ?auto_166993 ) ) ( not ( = ?auto_166992 ?auto_166990 ) ) ( not ( = ?auto_166992 ?auto_166993 ) ) ( not ( = ?auto_166990 ?auto_166993 ) ) ( not ( = ?auto_166985 ?auto_166990 ) ) ( not ( = ?auto_166985 ?auto_166986 ) ) ( not ( = ?auto_166985 ?auto_166989 ) ) ( not ( = ?auto_166985 ?auto_166987 ) ) ( not ( = ?auto_166985 ?auto_166992 ) ) ( not ( = ?auto_166988 ?auto_166990 ) ) ( not ( = ?auto_166988 ?auto_166986 ) ) ( not ( = ?auto_166988 ?auto_166989 ) ) ( not ( = ?auto_166988 ?auto_166987 ) ) ( not ( = ?auto_166988 ?auto_166992 ) ) ( not ( = ?auto_166991 ?auto_166990 ) ) ( not ( = ?auto_166991 ?auto_166986 ) ) ( not ( = ?auto_166991 ?auto_166989 ) ) ( not ( = ?auto_166991 ?auto_166987 ) ) ( not ( = ?auto_166991 ?auto_166992 ) ) ( ON ?auto_166993 ?auto_166991 ) ( ON ?auto_166990 ?auto_166993 ) ( CLEAR ?auto_166987 ) ( ON ?auto_166992 ?auto_166990 ) ( CLEAR ?auto_166992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_166988 ?auto_166985 ?auto_166991 ?auto_166993 ?auto_166990 )
      ( MAKE-1PILE ?auto_166985 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_166994 - BLOCK
    )
    :vars
    (
      ?auto_167001 - BLOCK
      ?auto_167000 - BLOCK
      ?auto_167002 - BLOCK
      ?auto_166997 - BLOCK
      ?auto_166996 - BLOCK
      ?auto_166995 - BLOCK
      ?auto_166998 - BLOCK
      ?auto_166999 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166994 ?auto_167001 ) ( not ( = ?auto_166994 ?auto_167001 ) ) ( not ( = ?auto_166994 ?auto_167000 ) ) ( not ( = ?auto_166994 ?auto_167002 ) ) ( not ( = ?auto_167001 ?auto_167000 ) ) ( not ( = ?auto_167001 ?auto_167002 ) ) ( not ( = ?auto_167000 ?auto_167002 ) ) ( ON ?auto_167000 ?auto_166994 ) ( ON-TABLE ?auto_167001 ) ( ON-TABLE ?auto_166997 ) ( ON ?auto_166996 ?auto_166997 ) ( not ( = ?auto_166997 ?auto_166996 ) ) ( not ( = ?auto_166997 ?auto_166995 ) ) ( not ( = ?auto_166997 ?auto_166998 ) ) ( not ( = ?auto_166997 ?auto_166999 ) ) ( not ( = ?auto_166997 ?auto_167002 ) ) ( not ( = ?auto_166996 ?auto_166995 ) ) ( not ( = ?auto_166996 ?auto_166998 ) ) ( not ( = ?auto_166996 ?auto_166999 ) ) ( not ( = ?auto_166996 ?auto_167002 ) ) ( not ( = ?auto_166995 ?auto_166998 ) ) ( not ( = ?auto_166995 ?auto_166999 ) ) ( not ( = ?auto_166995 ?auto_167002 ) ) ( not ( = ?auto_166998 ?auto_166999 ) ) ( not ( = ?auto_166998 ?auto_167002 ) ) ( not ( = ?auto_166999 ?auto_167002 ) ) ( not ( = ?auto_166994 ?auto_166999 ) ) ( not ( = ?auto_166994 ?auto_166997 ) ) ( not ( = ?auto_166994 ?auto_166996 ) ) ( not ( = ?auto_166994 ?auto_166995 ) ) ( not ( = ?auto_166994 ?auto_166998 ) ) ( not ( = ?auto_167001 ?auto_166999 ) ) ( not ( = ?auto_167001 ?auto_166997 ) ) ( not ( = ?auto_167001 ?auto_166996 ) ) ( not ( = ?auto_167001 ?auto_166995 ) ) ( not ( = ?auto_167001 ?auto_166998 ) ) ( not ( = ?auto_167000 ?auto_166999 ) ) ( not ( = ?auto_167000 ?auto_166997 ) ) ( not ( = ?auto_167000 ?auto_166996 ) ) ( not ( = ?auto_167000 ?auto_166995 ) ) ( not ( = ?auto_167000 ?auto_166998 ) ) ( ON ?auto_167002 ?auto_167000 ) ( ON ?auto_166999 ?auto_167002 ) ( ON ?auto_166998 ?auto_166999 ) ( CLEAR ?auto_166998 ) ( HOLDING ?auto_166995 ) ( CLEAR ?auto_166996 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_166997 ?auto_166996 ?auto_166995 )
      ( MAKE-1PILE ?auto_166994 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_167003 - BLOCK
    )
    :vars
    (
      ?auto_167005 - BLOCK
      ?auto_167010 - BLOCK
      ?auto_167009 - BLOCK
      ?auto_167006 - BLOCK
      ?auto_167007 - BLOCK
      ?auto_167011 - BLOCK
      ?auto_167008 - BLOCK
      ?auto_167004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167003 ?auto_167005 ) ( not ( = ?auto_167003 ?auto_167005 ) ) ( not ( = ?auto_167003 ?auto_167010 ) ) ( not ( = ?auto_167003 ?auto_167009 ) ) ( not ( = ?auto_167005 ?auto_167010 ) ) ( not ( = ?auto_167005 ?auto_167009 ) ) ( not ( = ?auto_167010 ?auto_167009 ) ) ( ON ?auto_167010 ?auto_167003 ) ( ON-TABLE ?auto_167005 ) ( ON-TABLE ?auto_167006 ) ( ON ?auto_167007 ?auto_167006 ) ( not ( = ?auto_167006 ?auto_167007 ) ) ( not ( = ?auto_167006 ?auto_167011 ) ) ( not ( = ?auto_167006 ?auto_167008 ) ) ( not ( = ?auto_167006 ?auto_167004 ) ) ( not ( = ?auto_167006 ?auto_167009 ) ) ( not ( = ?auto_167007 ?auto_167011 ) ) ( not ( = ?auto_167007 ?auto_167008 ) ) ( not ( = ?auto_167007 ?auto_167004 ) ) ( not ( = ?auto_167007 ?auto_167009 ) ) ( not ( = ?auto_167011 ?auto_167008 ) ) ( not ( = ?auto_167011 ?auto_167004 ) ) ( not ( = ?auto_167011 ?auto_167009 ) ) ( not ( = ?auto_167008 ?auto_167004 ) ) ( not ( = ?auto_167008 ?auto_167009 ) ) ( not ( = ?auto_167004 ?auto_167009 ) ) ( not ( = ?auto_167003 ?auto_167004 ) ) ( not ( = ?auto_167003 ?auto_167006 ) ) ( not ( = ?auto_167003 ?auto_167007 ) ) ( not ( = ?auto_167003 ?auto_167011 ) ) ( not ( = ?auto_167003 ?auto_167008 ) ) ( not ( = ?auto_167005 ?auto_167004 ) ) ( not ( = ?auto_167005 ?auto_167006 ) ) ( not ( = ?auto_167005 ?auto_167007 ) ) ( not ( = ?auto_167005 ?auto_167011 ) ) ( not ( = ?auto_167005 ?auto_167008 ) ) ( not ( = ?auto_167010 ?auto_167004 ) ) ( not ( = ?auto_167010 ?auto_167006 ) ) ( not ( = ?auto_167010 ?auto_167007 ) ) ( not ( = ?auto_167010 ?auto_167011 ) ) ( not ( = ?auto_167010 ?auto_167008 ) ) ( ON ?auto_167009 ?auto_167010 ) ( ON ?auto_167004 ?auto_167009 ) ( ON ?auto_167008 ?auto_167004 ) ( CLEAR ?auto_167007 ) ( ON ?auto_167011 ?auto_167008 ) ( CLEAR ?auto_167011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_167005 ?auto_167003 ?auto_167010 ?auto_167009 ?auto_167004 ?auto_167008 )
      ( MAKE-1PILE ?auto_167003 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_167012 - BLOCK
    )
    :vars
    (
      ?auto_167018 - BLOCK
      ?auto_167019 - BLOCK
      ?auto_167017 - BLOCK
      ?auto_167013 - BLOCK
      ?auto_167016 - BLOCK
      ?auto_167015 - BLOCK
      ?auto_167020 - BLOCK
      ?auto_167014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167012 ?auto_167018 ) ( not ( = ?auto_167012 ?auto_167018 ) ) ( not ( = ?auto_167012 ?auto_167019 ) ) ( not ( = ?auto_167012 ?auto_167017 ) ) ( not ( = ?auto_167018 ?auto_167019 ) ) ( not ( = ?auto_167018 ?auto_167017 ) ) ( not ( = ?auto_167019 ?auto_167017 ) ) ( ON ?auto_167019 ?auto_167012 ) ( ON-TABLE ?auto_167018 ) ( ON-TABLE ?auto_167013 ) ( not ( = ?auto_167013 ?auto_167016 ) ) ( not ( = ?auto_167013 ?auto_167015 ) ) ( not ( = ?auto_167013 ?auto_167020 ) ) ( not ( = ?auto_167013 ?auto_167014 ) ) ( not ( = ?auto_167013 ?auto_167017 ) ) ( not ( = ?auto_167016 ?auto_167015 ) ) ( not ( = ?auto_167016 ?auto_167020 ) ) ( not ( = ?auto_167016 ?auto_167014 ) ) ( not ( = ?auto_167016 ?auto_167017 ) ) ( not ( = ?auto_167015 ?auto_167020 ) ) ( not ( = ?auto_167015 ?auto_167014 ) ) ( not ( = ?auto_167015 ?auto_167017 ) ) ( not ( = ?auto_167020 ?auto_167014 ) ) ( not ( = ?auto_167020 ?auto_167017 ) ) ( not ( = ?auto_167014 ?auto_167017 ) ) ( not ( = ?auto_167012 ?auto_167014 ) ) ( not ( = ?auto_167012 ?auto_167013 ) ) ( not ( = ?auto_167012 ?auto_167016 ) ) ( not ( = ?auto_167012 ?auto_167015 ) ) ( not ( = ?auto_167012 ?auto_167020 ) ) ( not ( = ?auto_167018 ?auto_167014 ) ) ( not ( = ?auto_167018 ?auto_167013 ) ) ( not ( = ?auto_167018 ?auto_167016 ) ) ( not ( = ?auto_167018 ?auto_167015 ) ) ( not ( = ?auto_167018 ?auto_167020 ) ) ( not ( = ?auto_167019 ?auto_167014 ) ) ( not ( = ?auto_167019 ?auto_167013 ) ) ( not ( = ?auto_167019 ?auto_167016 ) ) ( not ( = ?auto_167019 ?auto_167015 ) ) ( not ( = ?auto_167019 ?auto_167020 ) ) ( ON ?auto_167017 ?auto_167019 ) ( ON ?auto_167014 ?auto_167017 ) ( ON ?auto_167020 ?auto_167014 ) ( ON ?auto_167015 ?auto_167020 ) ( CLEAR ?auto_167015 ) ( HOLDING ?auto_167016 ) ( CLEAR ?auto_167013 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_167013 ?auto_167016 )
      ( MAKE-1PILE ?auto_167012 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_167021 - BLOCK
    )
    :vars
    (
      ?auto_167023 - BLOCK
      ?auto_167022 - BLOCK
      ?auto_167028 - BLOCK
      ?auto_167029 - BLOCK
      ?auto_167025 - BLOCK
      ?auto_167026 - BLOCK
      ?auto_167027 - BLOCK
      ?auto_167024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167021 ?auto_167023 ) ( not ( = ?auto_167021 ?auto_167023 ) ) ( not ( = ?auto_167021 ?auto_167022 ) ) ( not ( = ?auto_167021 ?auto_167028 ) ) ( not ( = ?auto_167023 ?auto_167022 ) ) ( not ( = ?auto_167023 ?auto_167028 ) ) ( not ( = ?auto_167022 ?auto_167028 ) ) ( ON ?auto_167022 ?auto_167021 ) ( ON-TABLE ?auto_167023 ) ( ON-TABLE ?auto_167029 ) ( not ( = ?auto_167029 ?auto_167025 ) ) ( not ( = ?auto_167029 ?auto_167026 ) ) ( not ( = ?auto_167029 ?auto_167027 ) ) ( not ( = ?auto_167029 ?auto_167024 ) ) ( not ( = ?auto_167029 ?auto_167028 ) ) ( not ( = ?auto_167025 ?auto_167026 ) ) ( not ( = ?auto_167025 ?auto_167027 ) ) ( not ( = ?auto_167025 ?auto_167024 ) ) ( not ( = ?auto_167025 ?auto_167028 ) ) ( not ( = ?auto_167026 ?auto_167027 ) ) ( not ( = ?auto_167026 ?auto_167024 ) ) ( not ( = ?auto_167026 ?auto_167028 ) ) ( not ( = ?auto_167027 ?auto_167024 ) ) ( not ( = ?auto_167027 ?auto_167028 ) ) ( not ( = ?auto_167024 ?auto_167028 ) ) ( not ( = ?auto_167021 ?auto_167024 ) ) ( not ( = ?auto_167021 ?auto_167029 ) ) ( not ( = ?auto_167021 ?auto_167025 ) ) ( not ( = ?auto_167021 ?auto_167026 ) ) ( not ( = ?auto_167021 ?auto_167027 ) ) ( not ( = ?auto_167023 ?auto_167024 ) ) ( not ( = ?auto_167023 ?auto_167029 ) ) ( not ( = ?auto_167023 ?auto_167025 ) ) ( not ( = ?auto_167023 ?auto_167026 ) ) ( not ( = ?auto_167023 ?auto_167027 ) ) ( not ( = ?auto_167022 ?auto_167024 ) ) ( not ( = ?auto_167022 ?auto_167029 ) ) ( not ( = ?auto_167022 ?auto_167025 ) ) ( not ( = ?auto_167022 ?auto_167026 ) ) ( not ( = ?auto_167022 ?auto_167027 ) ) ( ON ?auto_167028 ?auto_167022 ) ( ON ?auto_167024 ?auto_167028 ) ( ON ?auto_167027 ?auto_167024 ) ( ON ?auto_167026 ?auto_167027 ) ( CLEAR ?auto_167029 ) ( ON ?auto_167025 ?auto_167026 ) ( CLEAR ?auto_167025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_167023 ?auto_167021 ?auto_167022 ?auto_167028 ?auto_167024 ?auto_167027 ?auto_167026 )
      ( MAKE-1PILE ?auto_167021 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_167030 - BLOCK
    )
    :vars
    (
      ?auto_167035 - BLOCK
      ?auto_167037 - BLOCK
      ?auto_167038 - BLOCK
      ?auto_167032 - BLOCK
      ?auto_167034 - BLOCK
      ?auto_167031 - BLOCK
      ?auto_167033 - BLOCK
      ?auto_167036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167030 ?auto_167035 ) ( not ( = ?auto_167030 ?auto_167035 ) ) ( not ( = ?auto_167030 ?auto_167037 ) ) ( not ( = ?auto_167030 ?auto_167038 ) ) ( not ( = ?auto_167035 ?auto_167037 ) ) ( not ( = ?auto_167035 ?auto_167038 ) ) ( not ( = ?auto_167037 ?auto_167038 ) ) ( ON ?auto_167037 ?auto_167030 ) ( ON-TABLE ?auto_167035 ) ( not ( = ?auto_167032 ?auto_167034 ) ) ( not ( = ?auto_167032 ?auto_167031 ) ) ( not ( = ?auto_167032 ?auto_167033 ) ) ( not ( = ?auto_167032 ?auto_167036 ) ) ( not ( = ?auto_167032 ?auto_167038 ) ) ( not ( = ?auto_167034 ?auto_167031 ) ) ( not ( = ?auto_167034 ?auto_167033 ) ) ( not ( = ?auto_167034 ?auto_167036 ) ) ( not ( = ?auto_167034 ?auto_167038 ) ) ( not ( = ?auto_167031 ?auto_167033 ) ) ( not ( = ?auto_167031 ?auto_167036 ) ) ( not ( = ?auto_167031 ?auto_167038 ) ) ( not ( = ?auto_167033 ?auto_167036 ) ) ( not ( = ?auto_167033 ?auto_167038 ) ) ( not ( = ?auto_167036 ?auto_167038 ) ) ( not ( = ?auto_167030 ?auto_167036 ) ) ( not ( = ?auto_167030 ?auto_167032 ) ) ( not ( = ?auto_167030 ?auto_167034 ) ) ( not ( = ?auto_167030 ?auto_167031 ) ) ( not ( = ?auto_167030 ?auto_167033 ) ) ( not ( = ?auto_167035 ?auto_167036 ) ) ( not ( = ?auto_167035 ?auto_167032 ) ) ( not ( = ?auto_167035 ?auto_167034 ) ) ( not ( = ?auto_167035 ?auto_167031 ) ) ( not ( = ?auto_167035 ?auto_167033 ) ) ( not ( = ?auto_167037 ?auto_167036 ) ) ( not ( = ?auto_167037 ?auto_167032 ) ) ( not ( = ?auto_167037 ?auto_167034 ) ) ( not ( = ?auto_167037 ?auto_167031 ) ) ( not ( = ?auto_167037 ?auto_167033 ) ) ( ON ?auto_167038 ?auto_167037 ) ( ON ?auto_167036 ?auto_167038 ) ( ON ?auto_167033 ?auto_167036 ) ( ON ?auto_167031 ?auto_167033 ) ( ON ?auto_167034 ?auto_167031 ) ( CLEAR ?auto_167034 ) ( HOLDING ?auto_167032 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_167032 )
      ( MAKE-1PILE ?auto_167030 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_167039 - BLOCK
    )
    :vars
    (
      ?auto_167040 - BLOCK
      ?auto_167041 - BLOCK
      ?auto_167042 - BLOCK
      ?auto_167047 - BLOCK
      ?auto_167045 - BLOCK
      ?auto_167046 - BLOCK
      ?auto_167043 - BLOCK
      ?auto_167044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167039 ?auto_167040 ) ( not ( = ?auto_167039 ?auto_167040 ) ) ( not ( = ?auto_167039 ?auto_167041 ) ) ( not ( = ?auto_167039 ?auto_167042 ) ) ( not ( = ?auto_167040 ?auto_167041 ) ) ( not ( = ?auto_167040 ?auto_167042 ) ) ( not ( = ?auto_167041 ?auto_167042 ) ) ( ON ?auto_167041 ?auto_167039 ) ( ON-TABLE ?auto_167040 ) ( not ( = ?auto_167047 ?auto_167045 ) ) ( not ( = ?auto_167047 ?auto_167046 ) ) ( not ( = ?auto_167047 ?auto_167043 ) ) ( not ( = ?auto_167047 ?auto_167044 ) ) ( not ( = ?auto_167047 ?auto_167042 ) ) ( not ( = ?auto_167045 ?auto_167046 ) ) ( not ( = ?auto_167045 ?auto_167043 ) ) ( not ( = ?auto_167045 ?auto_167044 ) ) ( not ( = ?auto_167045 ?auto_167042 ) ) ( not ( = ?auto_167046 ?auto_167043 ) ) ( not ( = ?auto_167046 ?auto_167044 ) ) ( not ( = ?auto_167046 ?auto_167042 ) ) ( not ( = ?auto_167043 ?auto_167044 ) ) ( not ( = ?auto_167043 ?auto_167042 ) ) ( not ( = ?auto_167044 ?auto_167042 ) ) ( not ( = ?auto_167039 ?auto_167044 ) ) ( not ( = ?auto_167039 ?auto_167047 ) ) ( not ( = ?auto_167039 ?auto_167045 ) ) ( not ( = ?auto_167039 ?auto_167046 ) ) ( not ( = ?auto_167039 ?auto_167043 ) ) ( not ( = ?auto_167040 ?auto_167044 ) ) ( not ( = ?auto_167040 ?auto_167047 ) ) ( not ( = ?auto_167040 ?auto_167045 ) ) ( not ( = ?auto_167040 ?auto_167046 ) ) ( not ( = ?auto_167040 ?auto_167043 ) ) ( not ( = ?auto_167041 ?auto_167044 ) ) ( not ( = ?auto_167041 ?auto_167047 ) ) ( not ( = ?auto_167041 ?auto_167045 ) ) ( not ( = ?auto_167041 ?auto_167046 ) ) ( not ( = ?auto_167041 ?auto_167043 ) ) ( ON ?auto_167042 ?auto_167041 ) ( ON ?auto_167044 ?auto_167042 ) ( ON ?auto_167043 ?auto_167044 ) ( ON ?auto_167046 ?auto_167043 ) ( ON ?auto_167045 ?auto_167046 ) ( ON ?auto_167047 ?auto_167045 ) ( CLEAR ?auto_167047 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_167040 ?auto_167039 ?auto_167041 ?auto_167042 ?auto_167044 ?auto_167043 ?auto_167046 ?auto_167045 )
      ( MAKE-1PILE ?auto_167039 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_167061 - BLOCK
      ?auto_167062 - BLOCK
      ?auto_167063 - BLOCK
      ?auto_167064 - BLOCK
      ?auto_167065 - BLOCK
      ?auto_167066 - BLOCK
    )
    :vars
    (
      ?auto_167067 - BLOCK
      ?auto_167068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167067 ?auto_167066 ) ( CLEAR ?auto_167067 ) ( ON-TABLE ?auto_167061 ) ( ON ?auto_167062 ?auto_167061 ) ( ON ?auto_167063 ?auto_167062 ) ( ON ?auto_167064 ?auto_167063 ) ( ON ?auto_167065 ?auto_167064 ) ( ON ?auto_167066 ?auto_167065 ) ( not ( = ?auto_167061 ?auto_167062 ) ) ( not ( = ?auto_167061 ?auto_167063 ) ) ( not ( = ?auto_167061 ?auto_167064 ) ) ( not ( = ?auto_167061 ?auto_167065 ) ) ( not ( = ?auto_167061 ?auto_167066 ) ) ( not ( = ?auto_167061 ?auto_167067 ) ) ( not ( = ?auto_167062 ?auto_167063 ) ) ( not ( = ?auto_167062 ?auto_167064 ) ) ( not ( = ?auto_167062 ?auto_167065 ) ) ( not ( = ?auto_167062 ?auto_167066 ) ) ( not ( = ?auto_167062 ?auto_167067 ) ) ( not ( = ?auto_167063 ?auto_167064 ) ) ( not ( = ?auto_167063 ?auto_167065 ) ) ( not ( = ?auto_167063 ?auto_167066 ) ) ( not ( = ?auto_167063 ?auto_167067 ) ) ( not ( = ?auto_167064 ?auto_167065 ) ) ( not ( = ?auto_167064 ?auto_167066 ) ) ( not ( = ?auto_167064 ?auto_167067 ) ) ( not ( = ?auto_167065 ?auto_167066 ) ) ( not ( = ?auto_167065 ?auto_167067 ) ) ( not ( = ?auto_167066 ?auto_167067 ) ) ( HOLDING ?auto_167068 ) ( not ( = ?auto_167061 ?auto_167068 ) ) ( not ( = ?auto_167062 ?auto_167068 ) ) ( not ( = ?auto_167063 ?auto_167068 ) ) ( not ( = ?auto_167064 ?auto_167068 ) ) ( not ( = ?auto_167065 ?auto_167068 ) ) ( not ( = ?auto_167066 ?auto_167068 ) ) ( not ( = ?auto_167067 ?auto_167068 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_167068 )
      ( MAKE-6PILE ?auto_167061 ?auto_167062 ?auto_167063 ?auto_167064 ?auto_167065 ?auto_167066 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_167186 - BLOCK
      ?auto_167187 - BLOCK
    )
    :vars
    (
      ?auto_167188 - BLOCK
      ?auto_167190 - BLOCK
      ?auto_167193 - BLOCK
      ?auto_167191 - BLOCK
      ?auto_167189 - BLOCK
      ?auto_167192 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167186 ?auto_167187 ) ) ( ON ?auto_167187 ?auto_167188 ) ( not ( = ?auto_167186 ?auto_167188 ) ) ( not ( = ?auto_167187 ?auto_167188 ) ) ( ON ?auto_167186 ?auto_167187 ) ( CLEAR ?auto_167186 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_167190 ) ( ON ?auto_167193 ?auto_167190 ) ( ON ?auto_167191 ?auto_167193 ) ( ON ?auto_167189 ?auto_167191 ) ( ON ?auto_167192 ?auto_167189 ) ( ON ?auto_167188 ?auto_167192 ) ( not ( = ?auto_167190 ?auto_167193 ) ) ( not ( = ?auto_167190 ?auto_167191 ) ) ( not ( = ?auto_167190 ?auto_167189 ) ) ( not ( = ?auto_167190 ?auto_167192 ) ) ( not ( = ?auto_167190 ?auto_167188 ) ) ( not ( = ?auto_167190 ?auto_167187 ) ) ( not ( = ?auto_167190 ?auto_167186 ) ) ( not ( = ?auto_167193 ?auto_167191 ) ) ( not ( = ?auto_167193 ?auto_167189 ) ) ( not ( = ?auto_167193 ?auto_167192 ) ) ( not ( = ?auto_167193 ?auto_167188 ) ) ( not ( = ?auto_167193 ?auto_167187 ) ) ( not ( = ?auto_167193 ?auto_167186 ) ) ( not ( = ?auto_167191 ?auto_167189 ) ) ( not ( = ?auto_167191 ?auto_167192 ) ) ( not ( = ?auto_167191 ?auto_167188 ) ) ( not ( = ?auto_167191 ?auto_167187 ) ) ( not ( = ?auto_167191 ?auto_167186 ) ) ( not ( = ?auto_167189 ?auto_167192 ) ) ( not ( = ?auto_167189 ?auto_167188 ) ) ( not ( = ?auto_167189 ?auto_167187 ) ) ( not ( = ?auto_167189 ?auto_167186 ) ) ( not ( = ?auto_167192 ?auto_167188 ) ) ( not ( = ?auto_167192 ?auto_167187 ) ) ( not ( = ?auto_167192 ?auto_167186 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_167190 ?auto_167193 ?auto_167191 ?auto_167189 ?auto_167192 ?auto_167188 ?auto_167187 )
      ( MAKE-2PILE ?auto_167186 ?auto_167187 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_167196 - BLOCK
      ?auto_167197 - BLOCK
    )
    :vars
    (
      ?auto_167198 - BLOCK
      ?auto_167199 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167196 ?auto_167197 ) ) ( ON ?auto_167197 ?auto_167198 ) ( CLEAR ?auto_167197 ) ( not ( = ?auto_167196 ?auto_167198 ) ) ( not ( = ?auto_167197 ?auto_167198 ) ) ( ON ?auto_167196 ?auto_167199 ) ( CLEAR ?auto_167196 ) ( HAND-EMPTY ) ( not ( = ?auto_167196 ?auto_167199 ) ) ( not ( = ?auto_167197 ?auto_167199 ) ) ( not ( = ?auto_167198 ?auto_167199 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_167196 ?auto_167199 )
      ( MAKE-2PILE ?auto_167196 ?auto_167197 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_167200 - BLOCK
      ?auto_167201 - BLOCK
    )
    :vars
    (
      ?auto_167203 - BLOCK
      ?auto_167202 - BLOCK
      ?auto_167207 - BLOCK
      ?auto_167204 - BLOCK
      ?auto_167208 - BLOCK
      ?auto_167205 - BLOCK
      ?auto_167206 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167200 ?auto_167201 ) ) ( not ( = ?auto_167200 ?auto_167203 ) ) ( not ( = ?auto_167201 ?auto_167203 ) ) ( ON ?auto_167200 ?auto_167202 ) ( CLEAR ?auto_167200 ) ( not ( = ?auto_167200 ?auto_167202 ) ) ( not ( = ?auto_167201 ?auto_167202 ) ) ( not ( = ?auto_167203 ?auto_167202 ) ) ( HOLDING ?auto_167201 ) ( CLEAR ?auto_167203 ) ( ON-TABLE ?auto_167207 ) ( ON ?auto_167204 ?auto_167207 ) ( ON ?auto_167208 ?auto_167204 ) ( ON ?auto_167205 ?auto_167208 ) ( ON ?auto_167206 ?auto_167205 ) ( ON ?auto_167203 ?auto_167206 ) ( not ( = ?auto_167207 ?auto_167204 ) ) ( not ( = ?auto_167207 ?auto_167208 ) ) ( not ( = ?auto_167207 ?auto_167205 ) ) ( not ( = ?auto_167207 ?auto_167206 ) ) ( not ( = ?auto_167207 ?auto_167203 ) ) ( not ( = ?auto_167207 ?auto_167201 ) ) ( not ( = ?auto_167204 ?auto_167208 ) ) ( not ( = ?auto_167204 ?auto_167205 ) ) ( not ( = ?auto_167204 ?auto_167206 ) ) ( not ( = ?auto_167204 ?auto_167203 ) ) ( not ( = ?auto_167204 ?auto_167201 ) ) ( not ( = ?auto_167208 ?auto_167205 ) ) ( not ( = ?auto_167208 ?auto_167206 ) ) ( not ( = ?auto_167208 ?auto_167203 ) ) ( not ( = ?auto_167208 ?auto_167201 ) ) ( not ( = ?auto_167205 ?auto_167206 ) ) ( not ( = ?auto_167205 ?auto_167203 ) ) ( not ( = ?auto_167205 ?auto_167201 ) ) ( not ( = ?auto_167206 ?auto_167203 ) ) ( not ( = ?auto_167206 ?auto_167201 ) ) ( not ( = ?auto_167200 ?auto_167207 ) ) ( not ( = ?auto_167200 ?auto_167204 ) ) ( not ( = ?auto_167200 ?auto_167208 ) ) ( not ( = ?auto_167200 ?auto_167205 ) ) ( not ( = ?auto_167200 ?auto_167206 ) ) ( not ( = ?auto_167202 ?auto_167207 ) ) ( not ( = ?auto_167202 ?auto_167204 ) ) ( not ( = ?auto_167202 ?auto_167208 ) ) ( not ( = ?auto_167202 ?auto_167205 ) ) ( not ( = ?auto_167202 ?auto_167206 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_167207 ?auto_167204 ?auto_167208 ?auto_167205 ?auto_167206 ?auto_167203 ?auto_167201 )
      ( MAKE-2PILE ?auto_167200 ?auto_167201 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_167209 - BLOCK
      ?auto_167210 - BLOCK
    )
    :vars
    (
      ?auto_167211 - BLOCK
      ?auto_167213 - BLOCK
      ?auto_167214 - BLOCK
      ?auto_167212 - BLOCK
      ?auto_167215 - BLOCK
      ?auto_167216 - BLOCK
      ?auto_167217 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167209 ?auto_167210 ) ) ( not ( = ?auto_167209 ?auto_167211 ) ) ( not ( = ?auto_167210 ?auto_167211 ) ) ( ON ?auto_167209 ?auto_167213 ) ( not ( = ?auto_167209 ?auto_167213 ) ) ( not ( = ?auto_167210 ?auto_167213 ) ) ( not ( = ?auto_167211 ?auto_167213 ) ) ( CLEAR ?auto_167211 ) ( ON-TABLE ?auto_167214 ) ( ON ?auto_167212 ?auto_167214 ) ( ON ?auto_167215 ?auto_167212 ) ( ON ?auto_167216 ?auto_167215 ) ( ON ?auto_167217 ?auto_167216 ) ( ON ?auto_167211 ?auto_167217 ) ( not ( = ?auto_167214 ?auto_167212 ) ) ( not ( = ?auto_167214 ?auto_167215 ) ) ( not ( = ?auto_167214 ?auto_167216 ) ) ( not ( = ?auto_167214 ?auto_167217 ) ) ( not ( = ?auto_167214 ?auto_167211 ) ) ( not ( = ?auto_167214 ?auto_167210 ) ) ( not ( = ?auto_167212 ?auto_167215 ) ) ( not ( = ?auto_167212 ?auto_167216 ) ) ( not ( = ?auto_167212 ?auto_167217 ) ) ( not ( = ?auto_167212 ?auto_167211 ) ) ( not ( = ?auto_167212 ?auto_167210 ) ) ( not ( = ?auto_167215 ?auto_167216 ) ) ( not ( = ?auto_167215 ?auto_167217 ) ) ( not ( = ?auto_167215 ?auto_167211 ) ) ( not ( = ?auto_167215 ?auto_167210 ) ) ( not ( = ?auto_167216 ?auto_167217 ) ) ( not ( = ?auto_167216 ?auto_167211 ) ) ( not ( = ?auto_167216 ?auto_167210 ) ) ( not ( = ?auto_167217 ?auto_167211 ) ) ( not ( = ?auto_167217 ?auto_167210 ) ) ( not ( = ?auto_167209 ?auto_167214 ) ) ( not ( = ?auto_167209 ?auto_167212 ) ) ( not ( = ?auto_167209 ?auto_167215 ) ) ( not ( = ?auto_167209 ?auto_167216 ) ) ( not ( = ?auto_167209 ?auto_167217 ) ) ( not ( = ?auto_167213 ?auto_167214 ) ) ( not ( = ?auto_167213 ?auto_167212 ) ) ( not ( = ?auto_167213 ?auto_167215 ) ) ( not ( = ?auto_167213 ?auto_167216 ) ) ( not ( = ?auto_167213 ?auto_167217 ) ) ( ON ?auto_167210 ?auto_167209 ) ( CLEAR ?auto_167210 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_167213 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_167213 ?auto_167209 )
      ( MAKE-2PILE ?auto_167209 ?auto_167210 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_167218 - BLOCK
      ?auto_167219 - BLOCK
    )
    :vars
    (
      ?auto_167221 - BLOCK
      ?auto_167226 - BLOCK
      ?auto_167225 - BLOCK
      ?auto_167222 - BLOCK
      ?auto_167220 - BLOCK
      ?auto_167224 - BLOCK
      ?auto_167223 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167218 ?auto_167219 ) ) ( not ( = ?auto_167218 ?auto_167221 ) ) ( not ( = ?auto_167219 ?auto_167221 ) ) ( ON ?auto_167218 ?auto_167226 ) ( not ( = ?auto_167218 ?auto_167226 ) ) ( not ( = ?auto_167219 ?auto_167226 ) ) ( not ( = ?auto_167221 ?auto_167226 ) ) ( ON-TABLE ?auto_167225 ) ( ON ?auto_167222 ?auto_167225 ) ( ON ?auto_167220 ?auto_167222 ) ( ON ?auto_167224 ?auto_167220 ) ( ON ?auto_167223 ?auto_167224 ) ( not ( = ?auto_167225 ?auto_167222 ) ) ( not ( = ?auto_167225 ?auto_167220 ) ) ( not ( = ?auto_167225 ?auto_167224 ) ) ( not ( = ?auto_167225 ?auto_167223 ) ) ( not ( = ?auto_167225 ?auto_167221 ) ) ( not ( = ?auto_167225 ?auto_167219 ) ) ( not ( = ?auto_167222 ?auto_167220 ) ) ( not ( = ?auto_167222 ?auto_167224 ) ) ( not ( = ?auto_167222 ?auto_167223 ) ) ( not ( = ?auto_167222 ?auto_167221 ) ) ( not ( = ?auto_167222 ?auto_167219 ) ) ( not ( = ?auto_167220 ?auto_167224 ) ) ( not ( = ?auto_167220 ?auto_167223 ) ) ( not ( = ?auto_167220 ?auto_167221 ) ) ( not ( = ?auto_167220 ?auto_167219 ) ) ( not ( = ?auto_167224 ?auto_167223 ) ) ( not ( = ?auto_167224 ?auto_167221 ) ) ( not ( = ?auto_167224 ?auto_167219 ) ) ( not ( = ?auto_167223 ?auto_167221 ) ) ( not ( = ?auto_167223 ?auto_167219 ) ) ( not ( = ?auto_167218 ?auto_167225 ) ) ( not ( = ?auto_167218 ?auto_167222 ) ) ( not ( = ?auto_167218 ?auto_167220 ) ) ( not ( = ?auto_167218 ?auto_167224 ) ) ( not ( = ?auto_167218 ?auto_167223 ) ) ( not ( = ?auto_167226 ?auto_167225 ) ) ( not ( = ?auto_167226 ?auto_167222 ) ) ( not ( = ?auto_167226 ?auto_167220 ) ) ( not ( = ?auto_167226 ?auto_167224 ) ) ( not ( = ?auto_167226 ?auto_167223 ) ) ( ON ?auto_167219 ?auto_167218 ) ( CLEAR ?auto_167219 ) ( ON-TABLE ?auto_167226 ) ( HOLDING ?auto_167221 ) ( CLEAR ?auto_167223 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_167225 ?auto_167222 ?auto_167220 ?auto_167224 ?auto_167223 ?auto_167221 )
      ( MAKE-2PILE ?auto_167218 ?auto_167219 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_167227 - BLOCK
      ?auto_167228 - BLOCK
    )
    :vars
    (
      ?auto_167231 - BLOCK
      ?auto_167233 - BLOCK
      ?auto_167232 - BLOCK
      ?auto_167235 - BLOCK
      ?auto_167230 - BLOCK
      ?auto_167234 - BLOCK
      ?auto_167229 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167227 ?auto_167228 ) ) ( not ( = ?auto_167227 ?auto_167231 ) ) ( not ( = ?auto_167228 ?auto_167231 ) ) ( ON ?auto_167227 ?auto_167233 ) ( not ( = ?auto_167227 ?auto_167233 ) ) ( not ( = ?auto_167228 ?auto_167233 ) ) ( not ( = ?auto_167231 ?auto_167233 ) ) ( ON-TABLE ?auto_167232 ) ( ON ?auto_167235 ?auto_167232 ) ( ON ?auto_167230 ?auto_167235 ) ( ON ?auto_167234 ?auto_167230 ) ( ON ?auto_167229 ?auto_167234 ) ( not ( = ?auto_167232 ?auto_167235 ) ) ( not ( = ?auto_167232 ?auto_167230 ) ) ( not ( = ?auto_167232 ?auto_167234 ) ) ( not ( = ?auto_167232 ?auto_167229 ) ) ( not ( = ?auto_167232 ?auto_167231 ) ) ( not ( = ?auto_167232 ?auto_167228 ) ) ( not ( = ?auto_167235 ?auto_167230 ) ) ( not ( = ?auto_167235 ?auto_167234 ) ) ( not ( = ?auto_167235 ?auto_167229 ) ) ( not ( = ?auto_167235 ?auto_167231 ) ) ( not ( = ?auto_167235 ?auto_167228 ) ) ( not ( = ?auto_167230 ?auto_167234 ) ) ( not ( = ?auto_167230 ?auto_167229 ) ) ( not ( = ?auto_167230 ?auto_167231 ) ) ( not ( = ?auto_167230 ?auto_167228 ) ) ( not ( = ?auto_167234 ?auto_167229 ) ) ( not ( = ?auto_167234 ?auto_167231 ) ) ( not ( = ?auto_167234 ?auto_167228 ) ) ( not ( = ?auto_167229 ?auto_167231 ) ) ( not ( = ?auto_167229 ?auto_167228 ) ) ( not ( = ?auto_167227 ?auto_167232 ) ) ( not ( = ?auto_167227 ?auto_167235 ) ) ( not ( = ?auto_167227 ?auto_167230 ) ) ( not ( = ?auto_167227 ?auto_167234 ) ) ( not ( = ?auto_167227 ?auto_167229 ) ) ( not ( = ?auto_167233 ?auto_167232 ) ) ( not ( = ?auto_167233 ?auto_167235 ) ) ( not ( = ?auto_167233 ?auto_167230 ) ) ( not ( = ?auto_167233 ?auto_167234 ) ) ( not ( = ?auto_167233 ?auto_167229 ) ) ( ON ?auto_167228 ?auto_167227 ) ( ON-TABLE ?auto_167233 ) ( CLEAR ?auto_167229 ) ( ON ?auto_167231 ?auto_167228 ) ( CLEAR ?auto_167231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_167233 ?auto_167227 ?auto_167228 )
      ( MAKE-2PILE ?auto_167227 ?auto_167228 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_167236 - BLOCK
      ?auto_167237 - BLOCK
    )
    :vars
    (
      ?auto_167238 - BLOCK
      ?auto_167239 - BLOCK
      ?auto_167240 - BLOCK
      ?auto_167242 - BLOCK
      ?auto_167243 - BLOCK
      ?auto_167241 - BLOCK
      ?auto_167244 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167236 ?auto_167237 ) ) ( not ( = ?auto_167236 ?auto_167238 ) ) ( not ( = ?auto_167237 ?auto_167238 ) ) ( ON ?auto_167236 ?auto_167239 ) ( not ( = ?auto_167236 ?auto_167239 ) ) ( not ( = ?auto_167237 ?auto_167239 ) ) ( not ( = ?auto_167238 ?auto_167239 ) ) ( ON-TABLE ?auto_167240 ) ( ON ?auto_167242 ?auto_167240 ) ( ON ?auto_167243 ?auto_167242 ) ( ON ?auto_167241 ?auto_167243 ) ( not ( = ?auto_167240 ?auto_167242 ) ) ( not ( = ?auto_167240 ?auto_167243 ) ) ( not ( = ?auto_167240 ?auto_167241 ) ) ( not ( = ?auto_167240 ?auto_167244 ) ) ( not ( = ?auto_167240 ?auto_167238 ) ) ( not ( = ?auto_167240 ?auto_167237 ) ) ( not ( = ?auto_167242 ?auto_167243 ) ) ( not ( = ?auto_167242 ?auto_167241 ) ) ( not ( = ?auto_167242 ?auto_167244 ) ) ( not ( = ?auto_167242 ?auto_167238 ) ) ( not ( = ?auto_167242 ?auto_167237 ) ) ( not ( = ?auto_167243 ?auto_167241 ) ) ( not ( = ?auto_167243 ?auto_167244 ) ) ( not ( = ?auto_167243 ?auto_167238 ) ) ( not ( = ?auto_167243 ?auto_167237 ) ) ( not ( = ?auto_167241 ?auto_167244 ) ) ( not ( = ?auto_167241 ?auto_167238 ) ) ( not ( = ?auto_167241 ?auto_167237 ) ) ( not ( = ?auto_167244 ?auto_167238 ) ) ( not ( = ?auto_167244 ?auto_167237 ) ) ( not ( = ?auto_167236 ?auto_167240 ) ) ( not ( = ?auto_167236 ?auto_167242 ) ) ( not ( = ?auto_167236 ?auto_167243 ) ) ( not ( = ?auto_167236 ?auto_167241 ) ) ( not ( = ?auto_167236 ?auto_167244 ) ) ( not ( = ?auto_167239 ?auto_167240 ) ) ( not ( = ?auto_167239 ?auto_167242 ) ) ( not ( = ?auto_167239 ?auto_167243 ) ) ( not ( = ?auto_167239 ?auto_167241 ) ) ( not ( = ?auto_167239 ?auto_167244 ) ) ( ON ?auto_167237 ?auto_167236 ) ( ON-TABLE ?auto_167239 ) ( ON ?auto_167238 ?auto_167237 ) ( CLEAR ?auto_167238 ) ( HOLDING ?auto_167244 ) ( CLEAR ?auto_167241 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_167240 ?auto_167242 ?auto_167243 ?auto_167241 ?auto_167244 )
      ( MAKE-2PILE ?auto_167236 ?auto_167237 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_167245 - BLOCK
      ?auto_167246 - BLOCK
    )
    :vars
    (
      ?auto_167253 - BLOCK
      ?auto_167252 - BLOCK
      ?auto_167248 - BLOCK
      ?auto_167247 - BLOCK
      ?auto_167250 - BLOCK
      ?auto_167251 - BLOCK
      ?auto_167249 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167245 ?auto_167246 ) ) ( not ( = ?auto_167245 ?auto_167253 ) ) ( not ( = ?auto_167246 ?auto_167253 ) ) ( ON ?auto_167245 ?auto_167252 ) ( not ( = ?auto_167245 ?auto_167252 ) ) ( not ( = ?auto_167246 ?auto_167252 ) ) ( not ( = ?auto_167253 ?auto_167252 ) ) ( ON-TABLE ?auto_167248 ) ( ON ?auto_167247 ?auto_167248 ) ( ON ?auto_167250 ?auto_167247 ) ( ON ?auto_167251 ?auto_167250 ) ( not ( = ?auto_167248 ?auto_167247 ) ) ( not ( = ?auto_167248 ?auto_167250 ) ) ( not ( = ?auto_167248 ?auto_167251 ) ) ( not ( = ?auto_167248 ?auto_167249 ) ) ( not ( = ?auto_167248 ?auto_167253 ) ) ( not ( = ?auto_167248 ?auto_167246 ) ) ( not ( = ?auto_167247 ?auto_167250 ) ) ( not ( = ?auto_167247 ?auto_167251 ) ) ( not ( = ?auto_167247 ?auto_167249 ) ) ( not ( = ?auto_167247 ?auto_167253 ) ) ( not ( = ?auto_167247 ?auto_167246 ) ) ( not ( = ?auto_167250 ?auto_167251 ) ) ( not ( = ?auto_167250 ?auto_167249 ) ) ( not ( = ?auto_167250 ?auto_167253 ) ) ( not ( = ?auto_167250 ?auto_167246 ) ) ( not ( = ?auto_167251 ?auto_167249 ) ) ( not ( = ?auto_167251 ?auto_167253 ) ) ( not ( = ?auto_167251 ?auto_167246 ) ) ( not ( = ?auto_167249 ?auto_167253 ) ) ( not ( = ?auto_167249 ?auto_167246 ) ) ( not ( = ?auto_167245 ?auto_167248 ) ) ( not ( = ?auto_167245 ?auto_167247 ) ) ( not ( = ?auto_167245 ?auto_167250 ) ) ( not ( = ?auto_167245 ?auto_167251 ) ) ( not ( = ?auto_167245 ?auto_167249 ) ) ( not ( = ?auto_167252 ?auto_167248 ) ) ( not ( = ?auto_167252 ?auto_167247 ) ) ( not ( = ?auto_167252 ?auto_167250 ) ) ( not ( = ?auto_167252 ?auto_167251 ) ) ( not ( = ?auto_167252 ?auto_167249 ) ) ( ON ?auto_167246 ?auto_167245 ) ( ON-TABLE ?auto_167252 ) ( ON ?auto_167253 ?auto_167246 ) ( CLEAR ?auto_167251 ) ( ON ?auto_167249 ?auto_167253 ) ( CLEAR ?auto_167249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_167252 ?auto_167245 ?auto_167246 ?auto_167253 )
      ( MAKE-2PILE ?auto_167245 ?auto_167246 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_167254 - BLOCK
      ?auto_167255 - BLOCK
    )
    :vars
    (
      ?auto_167262 - BLOCK
      ?auto_167257 - BLOCK
      ?auto_167256 - BLOCK
      ?auto_167258 - BLOCK
      ?auto_167259 - BLOCK
      ?auto_167260 - BLOCK
      ?auto_167261 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167254 ?auto_167255 ) ) ( not ( = ?auto_167254 ?auto_167262 ) ) ( not ( = ?auto_167255 ?auto_167262 ) ) ( ON ?auto_167254 ?auto_167257 ) ( not ( = ?auto_167254 ?auto_167257 ) ) ( not ( = ?auto_167255 ?auto_167257 ) ) ( not ( = ?auto_167262 ?auto_167257 ) ) ( ON-TABLE ?auto_167256 ) ( ON ?auto_167258 ?auto_167256 ) ( ON ?auto_167259 ?auto_167258 ) ( not ( = ?auto_167256 ?auto_167258 ) ) ( not ( = ?auto_167256 ?auto_167259 ) ) ( not ( = ?auto_167256 ?auto_167260 ) ) ( not ( = ?auto_167256 ?auto_167261 ) ) ( not ( = ?auto_167256 ?auto_167262 ) ) ( not ( = ?auto_167256 ?auto_167255 ) ) ( not ( = ?auto_167258 ?auto_167259 ) ) ( not ( = ?auto_167258 ?auto_167260 ) ) ( not ( = ?auto_167258 ?auto_167261 ) ) ( not ( = ?auto_167258 ?auto_167262 ) ) ( not ( = ?auto_167258 ?auto_167255 ) ) ( not ( = ?auto_167259 ?auto_167260 ) ) ( not ( = ?auto_167259 ?auto_167261 ) ) ( not ( = ?auto_167259 ?auto_167262 ) ) ( not ( = ?auto_167259 ?auto_167255 ) ) ( not ( = ?auto_167260 ?auto_167261 ) ) ( not ( = ?auto_167260 ?auto_167262 ) ) ( not ( = ?auto_167260 ?auto_167255 ) ) ( not ( = ?auto_167261 ?auto_167262 ) ) ( not ( = ?auto_167261 ?auto_167255 ) ) ( not ( = ?auto_167254 ?auto_167256 ) ) ( not ( = ?auto_167254 ?auto_167258 ) ) ( not ( = ?auto_167254 ?auto_167259 ) ) ( not ( = ?auto_167254 ?auto_167260 ) ) ( not ( = ?auto_167254 ?auto_167261 ) ) ( not ( = ?auto_167257 ?auto_167256 ) ) ( not ( = ?auto_167257 ?auto_167258 ) ) ( not ( = ?auto_167257 ?auto_167259 ) ) ( not ( = ?auto_167257 ?auto_167260 ) ) ( not ( = ?auto_167257 ?auto_167261 ) ) ( ON ?auto_167255 ?auto_167254 ) ( ON-TABLE ?auto_167257 ) ( ON ?auto_167262 ?auto_167255 ) ( ON ?auto_167261 ?auto_167262 ) ( CLEAR ?auto_167261 ) ( HOLDING ?auto_167260 ) ( CLEAR ?auto_167259 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_167256 ?auto_167258 ?auto_167259 ?auto_167260 )
      ( MAKE-2PILE ?auto_167254 ?auto_167255 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_167263 - BLOCK
      ?auto_167264 - BLOCK
    )
    :vars
    (
      ?auto_167268 - BLOCK
      ?auto_167265 - BLOCK
      ?auto_167269 - BLOCK
      ?auto_167270 - BLOCK
      ?auto_167266 - BLOCK
      ?auto_167271 - BLOCK
      ?auto_167267 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167263 ?auto_167264 ) ) ( not ( = ?auto_167263 ?auto_167268 ) ) ( not ( = ?auto_167264 ?auto_167268 ) ) ( ON ?auto_167263 ?auto_167265 ) ( not ( = ?auto_167263 ?auto_167265 ) ) ( not ( = ?auto_167264 ?auto_167265 ) ) ( not ( = ?auto_167268 ?auto_167265 ) ) ( ON-TABLE ?auto_167269 ) ( ON ?auto_167270 ?auto_167269 ) ( ON ?auto_167266 ?auto_167270 ) ( not ( = ?auto_167269 ?auto_167270 ) ) ( not ( = ?auto_167269 ?auto_167266 ) ) ( not ( = ?auto_167269 ?auto_167271 ) ) ( not ( = ?auto_167269 ?auto_167267 ) ) ( not ( = ?auto_167269 ?auto_167268 ) ) ( not ( = ?auto_167269 ?auto_167264 ) ) ( not ( = ?auto_167270 ?auto_167266 ) ) ( not ( = ?auto_167270 ?auto_167271 ) ) ( not ( = ?auto_167270 ?auto_167267 ) ) ( not ( = ?auto_167270 ?auto_167268 ) ) ( not ( = ?auto_167270 ?auto_167264 ) ) ( not ( = ?auto_167266 ?auto_167271 ) ) ( not ( = ?auto_167266 ?auto_167267 ) ) ( not ( = ?auto_167266 ?auto_167268 ) ) ( not ( = ?auto_167266 ?auto_167264 ) ) ( not ( = ?auto_167271 ?auto_167267 ) ) ( not ( = ?auto_167271 ?auto_167268 ) ) ( not ( = ?auto_167271 ?auto_167264 ) ) ( not ( = ?auto_167267 ?auto_167268 ) ) ( not ( = ?auto_167267 ?auto_167264 ) ) ( not ( = ?auto_167263 ?auto_167269 ) ) ( not ( = ?auto_167263 ?auto_167270 ) ) ( not ( = ?auto_167263 ?auto_167266 ) ) ( not ( = ?auto_167263 ?auto_167271 ) ) ( not ( = ?auto_167263 ?auto_167267 ) ) ( not ( = ?auto_167265 ?auto_167269 ) ) ( not ( = ?auto_167265 ?auto_167270 ) ) ( not ( = ?auto_167265 ?auto_167266 ) ) ( not ( = ?auto_167265 ?auto_167271 ) ) ( not ( = ?auto_167265 ?auto_167267 ) ) ( ON ?auto_167264 ?auto_167263 ) ( ON-TABLE ?auto_167265 ) ( ON ?auto_167268 ?auto_167264 ) ( ON ?auto_167267 ?auto_167268 ) ( CLEAR ?auto_167266 ) ( ON ?auto_167271 ?auto_167267 ) ( CLEAR ?auto_167271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_167265 ?auto_167263 ?auto_167264 ?auto_167268 ?auto_167267 )
      ( MAKE-2PILE ?auto_167263 ?auto_167264 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_167272 - BLOCK
      ?auto_167273 - BLOCK
    )
    :vars
    (
      ?auto_167276 - BLOCK
      ?auto_167275 - BLOCK
      ?auto_167280 - BLOCK
      ?auto_167278 - BLOCK
      ?auto_167274 - BLOCK
      ?auto_167277 - BLOCK
      ?auto_167279 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167272 ?auto_167273 ) ) ( not ( = ?auto_167272 ?auto_167276 ) ) ( not ( = ?auto_167273 ?auto_167276 ) ) ( ON ?auto_167272 ?auto_167275 ) ( not ( = ?auto_167272 ?auto_167275 ) ) ( not ( = ?auto_167273 ?auto_167275 ) ) ( not ( = ?auto_167276 ?auto_167275 ) ) ( ON-TABLE ?auto_167280 ) ( ON ?auto_167278 ?auto_167280 ) ( not ( = ?auto_167280 ?auto_167278 ) ) ( not ( = ?auto_167280 ?auto_167274 ) ) ( not ( = ?auto_167280 ?auto_167277 ) ) ( not ( = ?auto_167280 ?auto_167279 ) ) ( not ( = ?auto_167280 ?auto_167276 ) ) ( not ( = ?auto_167280 ?auto_167273 ) ) ( not ( = ?auto_167278 ?auto_167274 ) ) ( not ( = ?auto_167278 ?auto_167277 ) ) ( not ( = ?auto_167278 ?auto_167279 ) ) ( not ( = ?auto_167278 ?auto_167276 ) ) ( not ( = ?auto_167278 ?auto_167273 ) ) ( not ( = ?auto_167274 ?auto_167277 ) ) ( not ( = ?auto_167274 ?auto_167279 ) ) ( not ( = ?auto_167274 ?auto_167276 ) ) ( not ( = ?auto_167274 ?auto_167273 ) ) ( not ( = ?auto_167277 ?auto_167279 ) ) ( not ( = ?auto_167277 ?auto_167276 ) ) ( not ( = ?auto_167277 ?auto_167273 ) ) ( not ( = ?auto_167279 ?auto_167276 ) ) ( not ( = ?auto_167279 ?auto_167273 ) ) ( not ( = ?auto_167272 ?auto_167280 ) ) ( not ( = ?auto_167272 ?auto_167278 ) ) ( not ( = ?auto_167272 ?auto_167274 ) ) ( not ( = ?auto_167272 ?auto_167277 ) ) ( not ( = ?auto_167272 ?auto_167279 ) ) ( not ( = ?auto_167275 ?auto_167280 ) ) ( not ( = ?auto_167275 ?auto_167278 ) ) ( not ( = ?auto_167275 ?auto_167274 ) ) ( not ( = ?auto_167275 ?auto_167277 ) ) ( not ( = ?auto_167275 ?auto_167279 ) ) ( ON ?auto_167273 ?auto_167272 ) ( ON-TABLE ?auto_167275 ) ( ON ?auto_167276 ?auto_167273 ) ( ON ?auto_167279 ?auto_167276 ) ( ON ?auto_167277 ?auto_167279 ) ( CLEAR ?auto_167277 ) ( HOLDING ?auto_167274 ) ( CLEAR ?auto_167278 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_167280 ?auto_167278 ?auto_167274 )
      ( MAKE-2PILE ?auto_167272 ?auto_167273 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_167281 - BLOCK
      ?auto_167282 - BLOCK
    )
    :vars
    (
      ?auto_167287 - BLOCK
      ?auto_167285 - BLOCK
      ?auto_167283 - BLOCK
      ?auto_167284 - BLOCK
      ?auto_167286 - BLOCK
      ?auto_167289 - BLOCK
      ?auto_167288 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167281 ?auto_167282 ) ) ( not ( = ?auto_167281 ?auto_167287 ) ) ( not ( = ?auto_167282 ?auto_167287 ) ) ( ON ?auto_167281 ?auto_167285 ) ( not ( = ?auto_167281 ?auto_167285 ) ) ( not ( = ?auto_167282 ?auto_167285 ) ) ( not ( = ?auto_167287 ?auto_167285 ) ) ( ON-TABLE ?auto_167283 ) ( ON ?auto_167284 ?auto_167283 ) ( not ( = ?auto_167283 ?auto_167284 ) ) ( not ( = ?auto_167283 ?auto_167286 ) ) ( not ( = ?auto_167283 ?auto_167289 ) ) ( not ( = ?auto_167283 ?auto_167288 ) ) ( not ( = ?auto_167283 ?auto_167287 ) ) ( not ( = ?auto_167283 ?auto_167282 ) ) ( not ( = ?auto_167284 ?auto_167286 ) ) ( not ( = ?auto_167284 ?auto_167289 ) ) ( not ( = ?auto_167284 ?auto_167288 ) ) ( not ( = ?auto_167284 ?auto_167287 ) ) ( not ( = ?auto_167284 ?auto_167282 ) ) ( not ( = ?auto_167286 ?auto_167289 ) ) ( not ( = ?auto_167286 ?auto_167288 ) ) ( not ( = ?auto_167286 ?auto_167287 ) ) ( not ( = ?auto_167286 ?auto_167282 ) ) ( not ( = ?auto_167289 ?auto_167288 ) ) ( not ( = ?auto_167289 ?auto_167287 ) ) ( not ( = ?auto_167289 ?auto_167282 ) ) ( not ( = ?auto_167288 ?auto_167287 ) ) ( not ( = ?auto_167288 ?auto_167282 ) ) ( not ( = ?auto_167281 ?auto_167283 ) ) ( not ( = ?auto_167281 ?auto_167284 ) ) ( not ( = ?auto_167281 ?auto_167286 ) ) ( not ( = ?auto_167281 ?auto_167289 ) ) ( not ( = ?auto_167281 ?auto_167288 ) ) ( not ( = ?auto_167285 ?auto_167283 ) ) ( not ( = ?auto_167285 ?auto_167284 ) ) ( not ( = ?auto_167285 ?auto_167286 ) ) ( not ( = ?auto_167285 ?auto_167289 ) ) ( not ( = ?auto_167285 ?auto_167288 ) ) ( ON ?auto_167282 ?auto_167281 ) ( ON-TABLE ?auto_167285 ) ( ON ?auto_167287 ?auto_167282 ) ( ON ?auto_167288 ?auto_167287 ) ( ON ?auto_167289 ?auto_167288 ) ( CLEAR ?auto_167284 ) ( ON ?auto_167286 ?auto_167289 ) ( CLEAR ?auto_167286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_167285 ?auto_167281 ?auto_167282 ?auto_167287 ?auto_167288 ?auto_167289 )
      ( MAKE-2PILE ?auto_167281 ?auto_167282 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_167290 - BLOCK
      ?auto_167291 - BLOCK
    )
    :vars
    (
      ?auto_167295 - BLOCK
      ?auto_167292 - BLOCK
      ?auto_167296 - BLOCK
      ?auto_167293 - BLOCK
      ?auto_167297 - BLOCK
      ?auto_167298 - BLOCK
      ?auto_167294 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167290 ?auto_167291 ) ) ( not ( = ?auto_167290 ?auto_167295 ) ) ( not ( = ?auto_167291 ?auto_167295 ) ) ( ON ?auto_167290 ?auto_167292 ) ( not ( = ?auto_167290 ?auto_167292 ) ) ( not ( = ?auto_167291 ?auto_167292 ) ) ( not ( = ?auto_167295 ?auto_167292 ) ) ( ON-TABLE ?auto_167296 ) ( not ( = ?auto_167296 ?auto_167293 ) ) ( not ( = ?auto_167296 ?auto_167297 ) ) ( not ( = ?auto_167296 ?auto_167298 ) ) ( not ( = ?auto_167296 ?auto_167294 ) ) ( not ( = ?auto_167296 ?auto_167295 ) ) ( not ( = ?auto_167296 ?auto_167291 ) ) ( not ( = ?auto_167293 ?auto_167297 ) ) ( not ( = ?auto_167293 ?auto_167298 ) ) ( not ( = ?auto_167293 ?auto_167294 ) ) ( not ( = ?auto_167293 ?auto_167295 ) ) ( not ( = ?auto_167293 ?auto_167291 ) ) ( not ( = ?auto_167297 ?auto_167298 ) ) ( not ( = ?auto_167297 ?auto_167294 ) ) ( not ( = ?auto_167297 ?auto_167295 ) ) ( not ( = ?auto_167297 ?auto_167291 ) ) ( not ( = ?auto_167298 ?auto_167294 ) ) ( not ( = ?auto_167298 ?auto_167295 ) ) ( not ( = ?auto_167298 ?auto_167291 ) ) ( not ( = ?auto_167294 ?auto_167295 ) ) ( not ( = ?auto_167294 ?auto_167291 ) ) ( not ( = ?auto_167290 ?auto_167296 ) ) ( not ( = ?auto_167290 ?auto_167293 ) ) ( not ( = ?auto_167290 ?auto_167297 ) ) ( not ( = ?auto_167290 ?auto_167298 ) ) ( not ( = ?auto_167290 ?auto_167294 ) ) ( not ( = ?auto_167292 ?auto_167296 ) ) ( not ( = ?auto_167292 ?auto_167293 ) ) ( not ( = ?auto_167292 ?auto_167297 ) ) ( not ( = ?auto_167292 ?auto_167298 ) ) ( not ( = ?auto_167292 ?auto_167294 ) ) ( ON ?auto_167291 ?auto_167290 ) ( ON-TABLE ?auto_167292 ) ( ON ?auto_167295 ?auto_167291 ) ( ON ?auto_167294 ?auto_167295 ) ( ON ?auto_167298 ?auto_167294 ) ( ON ?auto_167297 ?auto_167298 ) ( CLEAR ?auto_167297 ) ( HOLDING ?auto_167293 ) ( CLEAR ?auto_167296 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_167296 ?auto_167293 )
      ( MAKE-2PILE ?auto_167290 ?auto_167291 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_167299 - BLOCK
      ?auto_167300 - BLOCK
    )
    :vars
    (
      ?auto_167307 - BLOCK
      ?auto_167301 - BLOCK
      ?auto_167305 - BLOCK
      ?auto_167304 - BLOCK
      ?auto_167302 - BLOCK
      ?auto_167306 - BLOCK
      ?auto_167303 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167299 ?auto_167300 ) ) ( not ( = ?auto_167299 ?auto_167307 ) ) ( not ( = ?auto_167300 ?auto_167307 ) ) ( ON ?auto_167299 ?auto_167301 ) ( not ( = ?auto_167299 ?auto_167301 ) ) ( not ( = ?auto_167300 ?auto_167301 ) ) ( not ( = ?auto_167307 ?auto_167301 ) ) ( ON-TABLE ?auto_167305 ) ( not ( = ?auto_167305 ?auto_167304 ) ) ( not ( = ?auto_167305 ?auto_167302 ) ) ( not ( = ?auto_167305 ?auto_167306 ) ) ( not ( = ?auto_167305 ?auto_167303 ) ) ( not ( = ?auto_167305 ?auto_167307 ) ) ( not ( = ?auto_167305 ?auto_167300 ) ) ( not ( = ?auto_167304 ?auto_167302 ) ) ( not ( = ?auto_167304 ?auto_167306 ) ) ( not ( = ?auto_167304 ?auto_167303 ) ) ( not ( = ?auto_167304 ?auto_167307 ) ) ( not ( = ?auto_167304 ?auto_167300 ) ) ( not ( = ?auto_167302 ?auto_167306 ) ) ( not ( = ?auto_167302 ?auto_167303 ) ) ( not ( = ?auto_167302 ?auto_167307 ) ) ( not ( = ?auto_167302 ?auto_167300 ) ) ( not ( = ?auto_167306 ?auto_167303 ) ) ( not ( = ?auto_167306 ?auto_167307 ) ) ( not ( = ?auto_167306 ?auto_167300 ) ) ( not ( = ?auto_167303 ?auto_167307 ) ) ( not ( = ?auto_167303 ?auto_167300 ) ) ( not ( = ?auto_167299 ?auto_167305 ) ) ( not ( = ?auto_167299 ?auto_167304 ) ) ( not ( = ?auto_167299 ?auto_167302 ) ) ( not ( = ?auto_167299 ?auto_167306 ) ) ( not ( = ?auto_167299 ?auto_167303 ) ) ( not ( = ?auto_167301 ?auto_167305 ) ) ( not ( = ?auto_167301 ?auto_167304 ) ) ( not ( = ?auto_167301 ?auto_167302 ) ) ( not ( = ?auto_167301 ?auto_167306 ) ) ( not ( = ?auto_167301 ?auto_167303 ) ) ( ON ?auto_167300 ?auto_167299 ) ( ON-TABLE ?auto_167301 ) ( ON ?auto_167307 ?auto_167300 ) ( ON ?auto_167303 ?auto_167307 ) ( ON ?auto_167306 ?auto_167303 ) ( ON ?auto_167302 ?auto_167306 ) ( CLEAR ?auto_167305 ) ( ON ?auto_167304 ?auto_167302 ) ( CLEAR ?auto_167304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_167301 ?auto_167299 ?auto_167300 ?auto_167307 ?auto_167303 ?auto_167306 ?auto_167302 )
      ( MAKE-2PILE ?auto_167299 ?auto_167300 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_167308 - BLOCK
      ?auto_167309 - BLOCK
    )
    :vars
    (
      ?auto_167312 - BLOCK
      ?auto_167315 - BLOCK
      ?auto_167314 - BLOCK
      ?auto_167313 - BLOCK
      ?auto_167316 - BLOCK
      ?auto_167311 - BLOCK
      ?auto_167310 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167308 ?auto_167309 ) ) ( not ( = ?auto_167308 ?auto_167312 ) ) ( not ( = ?auto_167309 ?auto_167312 ) ) ( ON ?auto_167308 ?auto_167315 ) ( not ( = ?auto_167308 ?auto_167315 ) ) ( not ( = ?auto_167309 ?auto_167315 ) ) ( not ( = ?auto_167312 ?auto_167315 ) ) ( not ( = ?auto_167314 ?auto_167313 ) ) ( not ( = ?auto_167314 ?auto_167316 ) ) ( not ( = ?auto_167314 ?auto_167311 ) ) ( not ( = ?auto_167314 ?auto_167310 ) ) ( not ( = ?auto_167314 ?auto_167312 ) ) ( not ( = ?auto_167314 ?auto_167309 ) ) ( not ( = ?auto_167313 ?auto_167316 ) ) ( not ( = ?auto_167313 ?auto_167311 ) ) ( not ( = ?auto_167313 ?auto_167310 ) ) ( not ( = ?auto_167313 ?auto_167312 ) ) ( not ( = ?auto_167313 ?auto_167309 ) ) ( not ( = ?auto_167316 ?auto_167311 ) ) ( not ( = ?auto_167316 ?auto_167310 ) ) ( not ( = ?auto_167316 ?auto_167312 ) ) ( not ( = ?auto_167316 ?auto_167309 ) ) ( not ( = ?auto_167311 ?auto_167310 ) ) ( not ( = ?auto_167311 ?auto_167312 ) ) ( not ( = ?auto_167311 ?auto_167309 ) ) ( not ( = ?auto_167310 ?auto_167312 ) ) ( not ( = ?auto_167310 ?auto_167309 ) ) ( not ( = ?auto_167308 ?auto_167314 ) ) ( not ( = ?auto_167308 ?auto_167313 ) ) ( not ( = ?auto_167308 ?auto_167316 ) ) ( not ( = ?auto_167308 ?auto_167311 ) ) ( not ( = ?auto_167308 ?auto_167310 ) ) ( not ( = ?auto_167315 ?auto_167314 ) ) ( not ( = ?auto_167315 ?auto_167313 ) ) ( not ( = ?auto_167315 ?auto_167316 ) ) ( not ( = ?auto_167315 ?auto_167311 ) ) ( not ( = ?auto_167315 ?auto_167310 ) ) ( ON ?auto_167309 ?auto_167308 ) ( ON-TABLE ?auto_167315 ) ( ON ?auto_167312 ?auto_167309 ) ( ON ?auto_167310 ?auto_167312 ) ( ON ?auto_167311 ?auto_167310 ) ( ON ?auto_167316 ?auto_167311 ) ( ON ?auto_167313 ?auto_167316 ) ( CLEAR ?auto_167313 ) ( HOLDING ?auto_167314 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_167314 )
      ( MAKE-2PILE ?auto_167308 ?auto_167309 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_167317 - BLOCK
      ?auto_167318 - BLOCK
    )
    :vars
    (
      ?auto_167322 - BLOCK
      ?auto_167321 - BLOCK
      ?auto_167325 - BLOCK
      ?auto_167323 - BLOCK
      ?auto_167320 - BLOCK
      ?auto_167319 - BLOCK
      ?auto_167324 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167317 ?auto_167318 ) ) ( not ( = ?auto_167317 ?auto_167322 ) ) ( not ( = ?auto_167318 ?auto_167322 ) ) ( ON ?auto_167317 ?auto_167321 ) ( not ( = ?auto_167317 ?auto_167321 ) ) ( not ( = ?auto_167318 ?auto_167321 ) ) ( not ( = ?auto_167322 ?auto_167321 ) ) ( not ( = ?auto_167325 ?auto_167323 ) ) ( not ( = ?auto_167325 ?auto_167320 ) ) ( not ( = ?auto_167325 ?auto_167319 ) ) ( not ( = ?auto_167325 ?auto_167324 ) ) ( not ( = ?auto_167325 ?auto_167322 ) ) ( not ( = ?auto_167325 ?auto_167318 ) ) ( not ( = ?auto_167323 ?auto_167320 ) ) ( not ( = ?auto_167323 ?auto_167319 ) ) ( not ( = ?auto_167323 ?auto_167324 ) ) ( not ( = ?auto_167323 ?auto_167322 ) ) ( not ( = ?auto_167323 ?auto_167318 ) ) ( not ( = ?auto_167320 ?auto_167319 ) ) ( not ( = ?auto_167320 ?auto_167324 ) ) ( not ( = ?auto_167320 ?auto_167322 ) ) ( not ( = ?auto_167320 ?auto_167318 ) ) ( not ( = ?auto_167319 ?auto_167324 ) ) ( not ( = ?auto_167319 ?auto_167322 ) ) ( not ( = ?auto_167319 ?auto_167318 ) ) ( not ( = ?auto_167324 ?auto_167322 ) ) ( not ( = ?auto_167324 ?auto_167318 ) ) ( not ( = ?auto_167317 ?auto_167325 ) ) ( not ( = ?auto_167317 ?auto_167323 ) ) ( not ( = ?auto_167317 ?auto_167320 ) ) ( not ( = ?auto_167317 ?auto_167319 ) ) ( not ( = ?auto_167317 ?auto_167324 ) ) ( not ( = ?auto_167321 ?auto_167325 ) ) ( not ( = ?auto_167321 ?auto_167323 ) ) ( not ( = ?auto_167321 ?auto_167320 ) ) ( not ( = ?auto_167321 ?auto_167319 ) ) ( not ( = ?auto_167321 ?auto_167324 ) ) ( ON ?auto_167318 ?auto_167317 ) ( ON-TABLE ?auto_167321 ) ( ON ?auto_167322 ?auto_167318 ) ( ON ?auto_167324 ?auto_167322 ) ( ON ?auto_167319 ?auto_167324 ) ( ON ?auto_167320 ?auto_167319 ) ( ON ?auto_167323 ?auto_167320 ) ( ON ?auto_167325 ?auto_167323 ) ( CLEAR ?auto_167325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_167321 ?auto_167317 ?auto_167318 ?auto_167322 ?auto_167324 ?auto_167319 ?auto_167320 ?auto_167323 )
      ( MAKE-2PILE ?auto_167317 ?auto_167318 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_167353 - BLOCK
      ?auto_167354 - BLOCK
      ?auto_167355 - BLOCK
      ?auto_167356 - BLOCK
      ?auto_167357 - BLOCK
    )
    :vars
    (
      ?auto_167358 - BLOCK
      ?auto_167359 - BLOCK
      ?auto_167360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167358 ?auto_167357 ) ( ON-TABLE ?auto_167353 ) ( ON ?auto_167354 ?auto_167353 ) ( ON ?auto_167355 ?auto_167354 ) ( ON ?auto_167356 ?auto_167355 ) ( ON ?auto_167357 ?auto_167356 ) ( not ( = ?auto_167353 ?auto_167354 ) ) ( not ( = ?auto_167353 ?auto_167355 ) ) ( not ( = ?auto_167353 ?auto_167356 ) ) ( not ( = ?auto_167353 ?auto_167357 ) ) ( not ( = ?auto_167353 ?auto_167358 ) ) ( not ( = ?auto_167354 ?auto_167355 ) ) ( not ( = ?auto_167354 ?auto_167356 ) ) ( not ( = ?auto_167354 ?auto_167357 ) ) ( not ( = ?auto_167354 ?auto_167358 ) ) ( not ( = ?auto_167355 ?auto_167356 ) ) ( not ( = ?auto_167355 ?auto_167357 ) ) ( not ( = ?auto_167355 ?auto_167358 ) ) ( not ( = ?auto_167356 ?auto_167357 ) ) ( not ( = ?auto_167356 ?auto_167358 ) ) ( not ( = ?auto_167357 ?auto_167358 ) ) ( not ( = ?auto_167353 ?auto_167359 ) ) ( not ( = ?auto_167353 ?auto_167360 ) ) ( not ( = ?auto_167354 ?auto_167359 ) ) ( not ( = ?auto_167354 ?auto_167360 ) ) ( not ( = ?auto_167355 ?auto_167359 ) ) ( not ( = ?auto_167355 ?auto_167360 ) ) ( not ( = ?auto_167356 ?auto_167359 ) ) ( not ( = ?auto_167356 ?auto_167360 ) ) ( not ( = ?auto_167357 ?auto_167359 ) ) ( not ( = ?auto_167357 ?auto_167360 ) ) ( not ( = ?auto_167358 ?auto_167359 ) ) ( not ( = ?auto_167358 ?auto_167360 ) ) ( not ( = ?auto_167359 ?auto_167360 ) ) ( ON ?auto_167359 ?auto_167358 ) ( CLEAR ?auto_167359 ) ( HOLDING ?auto_167360 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_167360 )
      ( MAKE-5PILE ?auto_167353 ?auto_167354 ?auto_167355 ?auto_167356 ?auto_167357 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_167466 - BLOCK
      ?auto_167467 - BLOCK
      ?auto_167468 - BLOCK
    )
    :vars
    (
      ?auto_167469 - BLOCK
      ?auto_167472 - BLOCK
      ?auto_167471 - BLOCK
      ?auto_167473 - BLOCK
      ?auto_167470 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167466 ) ( not ( = ?auto_167466 ?auto_167467 ) ) ( not ( = ?auto_167466 ?auto_167468 ) ) ( not ( = ?auto_167467 ?auto_167468 ) ) ( ON ?auto_167468 ?auto_167469 ) ( not ( = ?auto_167466 ?auto_167469 ) ) ( not ( = ?auto_167467 ?auto_167469 ) ) ( not ( = ?auto_167468 ?auto_167469 ) ) ( CLEAR ?auto_167466 ) ( ON ?auto_167467 ?auto_167468 ) ( CLEAR ?auto_167467 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_167472 ) ( ON ?auto_167471 ?auto_167472 ) ( ON ?auto_167473 ?auto_167471 ) ( ON ?auto_167470 ?auto_167473 ) ( ON ?auto_167469 ?auto_167470 ) ( not ( = ?auto_167472 ?auto_167471 ) ) ( not ( = ?auto_167472 ?auto_167473 ) ) ( not ( = ?auto_167472 ?auto_167470 ) ) ( not ( = ?auto_167472 ?auto_167469 ) ) ( not ( = ?auto_167472 ?auto_167468 ) ) ( not ( = ?auto_167472 ?auto_167467 ) ) ( not ( = ?auto_167471 ?auto_167473 ) ) ( not ( = ?auto_167471 ?auto_167470 ) ) ( not ( = ?auto_167471 ?auto_167469 ) ) ( not ( = ?auto_167471 ?auto_167468 ) ) ( not ( = ?auto_167471 ?auto_167467 ) ) ( not ( = ?auto_167473 ?auto_167470 ) ) ( not ( = ?auto_167473 ?auto_167469 ) ) ( not ( = ?auto_167473 ?auto_167468 ) ) ( not ( = ?auto_167473 ?auto_167467 ) ) ( not ( = ?auto_167470 ?auto_167469 ) ) ( not ( = ?auto_167470 ?auto_167468 ) ) ( not ( = ?auto_167470 ?auto_167467 ) ) ( not ( = ?auto_167466 ?auto_167472 ) ) ( not ( = ?auto_167466 ?auto_167471 ) ) ( not ( = ?auto_167466 ?auto_167473 ) ) ( not ( = ?auto_167466 ?auto_167470 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_167472 ?auto_167471 ?auto_167473 ?auto_167470 ?auto_167469 ?auto_167468 )
      ( MAKE-3PILE ?auto_167466 ?auto_167467 ?auto_167468 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_167474 - BLOCK
      ?auto_167475 - BLOCK
      ?auto_167476 - BLOCK
    )
    :vars
    (
      ?auto_167478 - BLOCK
      ?auto_167479 - BLOCK
      ?auto_167481 - BLOCK
      ?auto_167480 - BLOCK
      ?auto_167477 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167474 ?auto_167475 ) ) ( not ( = ?auto_167474 ?auto_167476 ) ) ( not ( = ?auto_167475 ?auto_167476 ) ) ( ON ?auto_167476 ?auto_167478 ) ( not ( = ?auto_167474 ?auto_167478 ) ) ( not ( = ?auto_167475 ?auto_167478 ) ) ( not ( = ?auto_167476 ?auto_167478 ) ) ( ON ?auto_167475 ?auto_167476 ) ( CLEAR ?auto_167475 ) ( ON-TABLE ?auto_167479 ) ( ON ?auto_167481 ?auto_167479 ) ( ON ?auto_167480 ?auto_167481 ) ( ON ?auto_167477 ?auto_167480 ) ( ON ?auto_167478 ?auto_167477 ) ( not ( = ?auto_167479 ?auto_167481 ) ) ( not ( = ?auto_167479 ?auto_167480 ) ) ( not ( = ?auto_167479 ?auto_167477 ) ) ( not ( = ?auto_167479 ?auto_167478 ) ) ( not ( = ?auto_167479 ?auto_167476 ) ) ( not ( = ?auto_167479 ?auto_167475 ) ) ( not ( = ?auto_167481 ?auto_167480 ) ) ( not ( = ?auto_167481 ?auto_167477 ) ) ( not ( = ?auto_167481 ?auto_167478 ) ) ( not ( = ?auto_167481 ?auto_167476 ) ) ( not ( = ?auto_167481 ?auto_167475 ) ) ( not ( = ?auto_167480 ?auto_167477 ) ) ( not ( = ?auto_167480 ?auto_167478 ) ) ( not ( = ?auto_167480 ?auto_167476 ) ) ( not ( = ?auto_167480 ?auto_167475 ) ) ( not ( = ?auto_167477 ?auto_167478 ) ) ( not ( = ?auto_167477 ?auto_167476 ) ) ( not ( = ?auto_167477 ?auto_167475 ) ) ( not ( = ?auto_167474 ?auto_167479 ) ) ( not ( = ?auto_167474 ?auto_167481 ) ) ( not ( = ?auto_167474 ?auto_167480 ) ) ( not ( = ?auto_167474 ?auto_167477 ) ) ( HOLDING ?auto_167474 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_167474 )
      ( MAKE-3PILE ?auto_167474 ?auto_167475 ?auto_167476 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_167482 - BLOCK
      ?auto_167483 - BLOCK
      ?auto_167484 - BLOCK
    )
    :vars
    (
      ?auto_167486 - BLOCK
      ?auto_167487 - BLOCK
      ?auto_167485 - BLOCK
      ?auto_167488 - BLOCK
      ?auto_167489 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167482 ?auto_167483 ) ) ( not ( = ?auto_167482 ?auto_167484 ) ) ( not ( = ?auto_167483 ?auto_167484 ) ) ( ON ?auto_167484 ?auto_167486 ) ( not ( = ?auto_167482 ?auto_167486 ) ) ( not ( = ?auto_167483 ?auto_167486 ) ) ( not ( = ?auto_167484 ?auto_167486 ) ) ( ON ?auto_167483 ?auto_167484 ) ( ON-TABLE ?auto_167487 ) ( ON ?auto_167485 ?auto_167487 ) ( ON ?auto_167488 ?auto_167485 ) ( ON ?auto_167489 ?auto_167488 ) ( ON ?auto_167486 ?auto_167489 ) ( not ( = ?auto_167487 ?auto_167485 ) ) ( not ( = ?auto_167487 ?auto_167488 ) ) ( not ( = ?auto_167487 ?auto_167489 ) ) ( not ( = ?auto_167487 ?auto_167486 ) ) ( not ( = ?auto_167487 ?auto_167484 ) ) ( not ( = ?auto_167487 ?auto_167483 ) ) ( not ( = ?auto_167485 ?auto_167488 ) ) ( not ( = ?auto_167485 ?auto_167489 ) ) ( not ( = ?auto_167485 ?auto_167486 ) ) ( not ( = ?auto_167485 ?auto_167484 ) ) ( not ( = ?auto_167485 ?auto_167483 ) ) ( not ( = ?auto_167488 ?auto_167489 ) ) ( not ( = ?auto_167488 ?auto_167486 ) ) ( not ( = ?auto_167488 ?auto_167484 ) ) ( not ( = ?auto_167488 ?auto_167483 ) ) ( not ( = ?auto_167489 ?auto_167486 ) ) ( not ( = ?auto_167489 ?auto_167484 ) ) ( not ( = ?auto_167489 ?auto_167483 ) ) ( not ( = ?auto_167482 ?auto_167487 ) ) ( not ( = ?auto_167482 ?auto_167485 ) ) ( not ( = ?auto_167482 ?auto_167488 ) ) ( not ( = ?auto_167482 ?auto_167489 ) ) ( ON ?auto_167482 ?auto_167483 ) ( CLEAR ?auto_167482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_167487 ?auto_167485 ?auto_167488 ?auto_167489 ?auto_167486 ?auto_167484 ?auto_167483 )
      ( MAKE-3PILE ?auto_167482 ?auto_167483 ?auto_167484 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_167493 - BLOCK
      ?auto_167494 - BLOCK
      ?auto_167495 - BLOCK
    )
    :vars
    (
      ?auto_167497 - BLOCK
      ?auto_167498 - BLOCK
      ?auto_167499 - BLOCK
      ?auto_167500 - BLOCK
      ?auto_167496 - BLOCK
      ?auto_167501 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167493 ?auto_167494 ) ) ( not ( = ?auto_167493 ?auto_167495 ) ) ( not ( = ?auto_167494 ?auto_167495 ) ) ( ON ?auto_167495 ?auto_167497 ) ( not ( = ?auto_167493 ?auto_167497 ) ) ( not ( = ?auto_167494 ?auto_167497 ) ) ( not ( = ?auto_167495 ?auto_167497 ) ) ( ON ?auto_167494 ?auto_167495 ) ( CLEAR ?auto_167494 ) ( ON-TABLE ?auto_167498 ) ( ON ?auto_167499 ?auto_167498 ) ( ON ?auto_167500 ?auto_167499 ) ( ON ?auto_167496 ?auto_167500 ) ( ON ?auto_167497 ?auto_167496 ) ( not ( = ?auto_167498 ?auto_167499 ) ) ( not ( = ?auto_167498 ?auto_167500 ) ) ( not ( = ?auto_167498 ?auto_167496 ) ) ( not ( = ?auto_167498 ?auto_167497 ) ) ( not ( = ?auto_167498 ?auto_167495 ) ) ( not ( = ?auto_167498 ?auto_167494 ) ) ( not ( = ?auto_167499 ?auto_167500 ) ) ( not ( = ?auto_167499 ?auto_167496 ) ) ( not ( = ?auto_167499 ?auto_167497 ) ) ( not ( = ?auto_167499 ?auto_167495 ) ) ( not ( = ?auto_167499 ?auto_167494 ) ) ( not ( = ?auto_167500 ?auto_167496 ) ) ( not ( = ?auto_167500 ?auto_167497 ) ) ( not ( = ?auto_167500 ?auto_167495 ) ) ( not ( = ?auto_167500 ?auto_167494 ) ) ( not ( = ?auto_167496 ?auto_167497 ) ) ( not ( = ?auto_167496 ?auto_167495 ) ) ( not ( = ?auto_167496 ?auto_167494 ) ) ( not ( = ?auto_167493 ?auto_167498 ) ) ( not ( = ?auto_167493 ?auto_167499 ) ) ( not ( = ?auto_167493 ?auto_167500 ) ) ( not ( = ?auto_167493 ?auto_167496 ) ) ( ON ?auto_167493 ?auto_167501 ) ( CLEAR ?auto_167493 ) ( HAND-EMPTY ) ( not ( = ?auto_167493 ?auto_167501 ) ) ( not ( = ?auto_167494 ?auto_167501 ) ) ( not ( = ?auto_167495 ?auto_167501 ) ) ( not ( = ?auto_167497 ?auto_167501 ) ) ( not ( = ?auto_167498 ?auto_167501 ) ) ( not ( = ?auto_167499 ?auto_167501 ) ) ( not ( = ?auto_167500 ?auto_167501 ) ) ( not ( = ?auto_167496 ?auto_167501 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_167493 ?auto_167501 )
      ( MAKE-3PILE ?auto_167493 ?auto_167494 ?auto_167495 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_167502 - BLOCK
      ?auto_167503 - BLOCK
      ?auto_167504 - BLOCK
    )
    :vars
    (
      ?auto_167505 - BLOCK
      ?auto_167507 - BLOCK
      ?auto_167506 - BLOCK
      ?auto_167509 - BLOCK
      ?auto_167510 - BLOCK
      ?auto_167508 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167502 ?auto_167503 ) ) ( not ( = ?auto_167502 ?auto_167504 ) ) ( not ( = ?auto_167503 ?auto_167504 ) ) ( ON ?auto_167504 ?auto_167505 ) ( not ( = ?auto_167502 ?auto_167505 ) ) ( not ( = ?auto_167503 ?auto_167505 ) ) ( not ( = ?auto_167504 ?auto_167505 ) ) ( ON-TABLE ?auto_167507 ) ( ON ?auto_167506 ?auto_167507 ) ( ON ?auto_167509 ?auto_167506 ) ( ON ?auto_167510 ?auto_167509 ) ( ON ?auto_167505 ?auto_167510 ) ( not ( = ?auto_167507 ?auto_167506 ) ) ( not ( = ?auto_167507 ?auto_167509 ) ) ( not ( = ?auto_167507 ?auto_167510 ) ) ( not ( = ?auto_167507 ?auto_167505 ) ) ( not ( = ?auto_167507 ?auto_167504 ) ) ( not ( = ?auto_167507 ?auto_167503 ) ) ( not ( = ?auto_167506 ?auto_167509 ) ) ( not ( = ?auto_167506 ?auto_167510 ) ) ( not ( = ?auto_167506 ?auto_167505 ) ) ( not ( = ?auto_167506 ?auto_167504 ) ) ( not ( = ?auto_167506 ?auto_167503 ) ) ( not ( = ?auto_167509 ?auto_167510 ) ) ( not ( = ?auto_167509 ?auto_167505 ) ) ( not ( = ?auto_167509 ?auto_167504 ) ) ( not ( = ?auto_167509 ?auto_167503 ) ) ( not ( = ?auto_167510 ?auto_167505 ) ) ( not ( = ?auto_167510 ?auto_167504 ) ) ( not ( = ?auto_167510 ?auto_167503 ) ) ( not ( = ?auto_167502 ?auto_167507 ) ) ( not ( = ?auto_167502 ?auto_167506 ) ) ( not ( = ?auto_167502 ?auto_167509 ) ) ( not ( = ?auto_167502 ?auto_167510 ) ) ( ON ?auto_167502 ?auto_167508 ) ( CLEAR ?auto_167502 ) ( not ( = ?auto_167502 ?auto_167508 ) ) ( not ( = ?auto_167503 ?auto_167508 ) ) ( not ( = ?auto_167504 ?auto_167508 ) ) ( not ( = ?auto_167505 ?auto_167508 ) ) ( not ( = ?auto_167507 ?auto_167508 ) ) ( not ( = ?auto_167506 ?auto_167508 ) ) ( not ( = ?auto_167509 ?auto_167508 ) ) ( not ( = ?auto_167510 ?auto_167508 ) ) ( HOLDING ?auto_167503 ) ( CLEAR ?auto_167504 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_167507 ?auto_167506 ?auto_167509 ?auto_167510 ?auto_167505 ?auto_167504 ?auto_167503 )
      ( MAKE-3PILE ?auto_167502 ?auto_167503 ?auto_167504 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_167511 - BLOCK
      ?auto_167512 - BLOCK
      ?auto_167513 - BLOCK
    )
    :vars
    (
      ?auto_167517 - BLOCK
      ?auto_167516 - BLOCK
      ?auto_167514 - BLOCK
      ?auto_167515 - BLOCK
      ?auto_167519 - BLOCK
      ?auto_167518 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167511 ?auto_167512 ) ) ( not ( = ?auto_167511 ?auto_167513 ) ) ( not ( = ?auto_167512 ?auto_167513 ) ) ( ON ?auto_167513 ?auto_167517 ) ( not ( = ?auto_167511 ?auto_167517 ) ) ( not ( = ?auto_167512 ?auto_167517 ) ) ( not ( = ?auto_167513 ?auto_167517 ) ) ( ON-TABLE ?auto_167516 ) ( ON ?auto_167514 ?auto_167516 ) ( ON ?auto_167515 ?auto_167514 ) ( ON ?auto_167519 ?auto_167515 ) ( ON ?auto_167517 ?auto_167519 ) ( not ( = ?auto_167516 ?auto_167514 ) ) ( not ( = ?auto_167516 ?auto_167515 ) ) ( not ( = ?auto_167516 ?auto_167519 ) ) ( not ( = ?auto_167516 ?auto_167517 ) ) ( not ( = ?auto_167516 ?auto_167513 ) ) ( not ( = ?auto_167516 ?auto_167512 ) ) ( not ( = ?auto_167514 ?auto_167515 ) ) ( not ( = ?auto_167514 ?auto_167519 ) ) ( not ( = ?auto_167514 ?auto_167517 ) ) ( not ( = ?auto_167514 ?auto_167513 ) ) ( not ( = ?auto_167514 ?auto_167512 ) ) ( not ( = ?auto_167515 ?auto_167519 ) ) ( not ( = ?auto_167515 ?auto_167517 ) ) ( not ( = ?auto_167515 ?auto_167513 ) ) ( not ( = ?auto_167515 ?auto_167512 ) ) ( not ( = ?auto_167519 ?auto_167517 ) ) ( not ( = ?auto_167519 ?auto_167513 ) ) ( not ( = ?auto_167519 ?auto_167512 ) ) ( not ( = ?auto_167511 ?auto_167516 ) ) ( not ( = ?auto_167511 ?auto_167514 ) ) ( not ( = ?auto_167511 ?auto_167515 ) ) ( not ( = ?auto_167511 ?auto_167519 ) ) ( ON ?auto_167511 ?auto_167518 ) ( not ( = ?auto_167511 ?auto_167518 ) ) ( not ( = ?auto_167512 ?auto_167518 ) ) ( not ( = ?auto_167513 ?auto_167518 ) ) ( not ( = ?auto_167517 ?auto_167518 ) ) ( not ( = ?auto_167516 ?auto_167518 ) ) ( not ( = ?auto_167514 ?auto_167518 ) ) ( not ( = ?auto_167515 ?auto_167518 ) ) ( not ( = ?auto_167519 ?auto_167518 ) ) ( CLEAR ?auto_167513 ) ( ON ?auto_167512 ?auto_167511 ) ( CLEAR ?auto_167512 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_167518 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_167518 ?auto_167511 )
      ( MAKE-3PILE ?auto_167511 ?auto_167512 ?auto_167513 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_167520 - BLOCK
      ?auto_167521 - BLOCK
      ?auto_167522 - BLOCK
    )
    :vars
    (
      ?auto_167523 - BLOCK
      ?auto_167524 - BLOCK
      ?auto_167526 - BLOCK
      ?auto_167528 - BLOCK
      ?auto_167527 - BLOCK
      ?auto_167525 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167520 ?auto_167521 ) ) ( not ( = ?auto_167520 ?auto_167522 ) ) ( not ( = ?auto_167521 ?auto_167522 ) ) ( not ( = ?auto_167520 ?auto_167523 ) ) ( not ( = ?auto_167521 ?auto_167523 ) ) ( not ( = ?auto_167522 ?auto_167523 ) ) ( ON-TABLE ?auto_167524 ) ( ON ?auto_167526 ?auto_167524 ) ( ON ?auto_167528 ?auto_167526 ) ( ON ?auto_167527 ?auto_167528 ) ( ON ?auto_167523 ?auto_167527 ) ( not ( = ?auto_167524 ?auto_167526 ) ) ( not ( = ?auto_167524 ?auto_167528 ) ) ( not ( = ?auto_167524 ?auto_167527 ) ) ( not ( = ?auto_167524 ?auto_167523 ) ) ( not ( = ?auto_167524 ?auto_167522 ) ) ( not ( = ?auto_167524 ?auto_167521 ) ) ( not ( = ?auto_167526 ?auto_167528 ) ) ( not ( = ?auto_167526 ?auto_167527 ) ) ( not ( = ?auto_167526 ?auto_167523 ) ) ( not ( = ?auto_167526 ?auto_167522 ) ) ( not ( = ?auto_167526 ?auto_167521 ) ) ( not ( = ?auto_167528 ?auto_167527 ) ) ( not ( = ?auto_167528 ?auto_167523 ) ) ( not ( = ?auto_167528 ?auto_167522 ) ) ( not ( = ?auto_167528 ?auto_167521 ) ) ( not ( = ?auto_167527 ?auto_167523 ) ) ( not ( = ?auto_167527 ?auto_167522 ) ) ( not ( = ?auto_167527 ?auto_167521 ) ) ( not ( = ?auto_167520 ?auto_167524 ) ) ( not ( = ?auto_167520 ?auto_167526 ) ) ( not ( = ?auto_167520 ?auto_167528 ) ) ( not ( = ?auto_167520 ?auto_167527 ) ) ( ON ?auto_167520 ?auto_167525 ) ( not ( = ?auto_167520 ?auto_167525 ) ) ( not ( = ?auto_167521 ?auto_167525 ) ) ( not ( = ?auto_167522 ?auto_167525 ) ) ( not ( = ?auto_167523 ?auto_167525 ) ) ( not ( = ?auto_167524 ?auto_167525 ) ) ( not ( = ?auto_167526 ?auto_167525 ) ) ( not ( = ?auto_167528 ?auto_167525 ) ) ( not ( = ?auto_167527 ?auto_167525 ) ) ( ON ?auto_167521 ?auto_167520 ) ( CLEAR ?auto_167521 ) ( ON-TABLE ?auto_167525 ) ( HOLDING ?auto_167522 ) ( CLEAR ?auto_167523 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_167524 ?auto_167526 ?auto_167528 ?auto_167527 ?auto_167523 ?auto_167522 )
      ( MAKE-3PILE ?auto_167520 ?auto_167521 ?auto_167522 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_167529 - BLOCK
      ?auto_167530 - BLOCK
      ?auto_167531 - BLOCK
    )
    :vars
    (
      ?auto_167537 - BLOCK
      ?auto_167535 - BLOCK
      ?auto_167532 - BLOCK
      ?auto_167536 - BLOCK
      ?auto_167534 - BLOCK
      ?auto_167533 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167529 ?auto_167530 ) ) ( not ( = ?auto_167529 ?auto_167531 ) ) ( not ( = ?auto_167530 ?auto_167531 ) ) ( not ( = ?auto_167529 ?auto_167537 ) ) ( not ( = ?auto_167530 ?auto_167537 ) ) ( not ( = ?auto_167531 ?auto_167537 ) ) ( ON-TABLE ?auto_167535 ) ( ON ?auto_167532 ?auto_167535 ) ( ON ?auto_167536 ?auto_167532 ) ( ON ?auto_167534 ?auto_167536 ) ( ON ?auto_167537 ?auto_167534 ) ( not ( = ?auto_167535 ?auto_167532 ) ) ( not ( = ?auto_167535 ?auto_167536 ) ) ( not ( = ?auto_167535 ?auto_167534 ) ) ( not ( = ?auto_167535 ?auto_167537 ) ) ( not ( = ?auto_167535 ?auto_167531 ) ) ( not ( = ?auto_167535 ?auto_167530 ) ) ( not ( = ?auto_167532 ?auto_167536 ) ) ( not ( = ?auto_167532 ?auto_167534 ) ) ( not ( = ?auto_167532 ?auto_167537 ) ) ( not ( = ?auto_167532 ?auto_167531 ) ) ( not ( = ?auto_167532 ?auto_167530 ) ) ( not ( = ?auto_167536 ?auto_167534 ) ) ( not ( = ?auto_167536 ?auto_167537 ) ) ( not ( = ?auto_167536 ?auto_167531 ) ) ( not ( = ?auto_167536 ?auto_167530 ) ) ( not ( = ?auto_167534 ?auto_167537 ) ) ( not ( = ?auto_167534 ?auto_167531 ) ) ( not ( = ?auto_167534 ?auto_167530 ) ) ( not ( = ?auto_167529 ?auto_167535 ) ) ( not ( = ?auto_167529 ?auto_167532 ) ) ( not ( = ?auto_167529 ?auto_167536 ) ) ( not ( = ?auto_167529 ?auto_167534 ) ) ( ON ?auto_167529 ?auto_167533 ) ( not ( = ?auto_167529 ?auto_167533 ) ) ( not ( = ?auto_167530 ?auto_167533 ) ) ( not ( = ?auto_167531 ?auto_167533 ) ) ( not ( = ?auto_167537 ?auto_167533 ) ) ( not ( = ?auto_167535 ?auto_167533 ) ) ( not ( = ?auto_167532 ?auto_167533 ) ) ( not ( = ?auto_167536 ?auto_167533 ) ) ( not ( = ?auto_167534 ?auto_167533 ) ) ( ON ?auto_167530 ?auto_167529 ) ( ON-TABLE ?auto_167533 ) ( CLEAR ?auto_167537 ) ( ON ?auto_167531 ?auto_167530 ) ( CLEAR ?auto_167531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_167533 ?auto_167529 ?auto_167530 )
      ( MAKE-3PILE ?auto_167529 ?auto_167530 ?auto_167531 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_167538 - BLOCK
      ?auto_167539 - BLOCK
      ?auto_167540 - BLOCK
    )
    :vars
    (
      ?auto_167544 - BLOCK
      ?auto_167542 - BLOCK
      ?auto_167541 - BLOCK
      ?auto_167545 - BLOCK
      ?auto_167546 - BLOCK
      ?auto_167543 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167538 ?auto_167539 ) ) ( not ( = ?auto_167538 ?auto_167540 ) ) ( not ( = ?auto_167539 ?auto_167540 ) ) ( not ( = ?auto_167538 ?auto_167544 ) ) ( not ( = ?auto_167539 ?auto_167544 ) ) ( not ( = ?auto_167540 ?auto_167544 ) ) ( ON-TABLE ?auto_167542 ) ( ON ?auto_167541 ?auto_167542 ) ( ON ?auto_167545 ?auto_167541 ) ( ON ?auto_167546 ?auto_167545 ) ( not ( = ?auto_167542 ?auto_167541 ) ) ( not ( = ?auto_167542 ?auto_167545 ) ) ( not ( = ?auto_167542 ?auto_167546 ) ) ( not ( = ?auto_167542 ?auto_167544 ) ) ( not ( = ?auto_167542 ?auto_167540 ) ) ( not ( = ?auto_167542 ?auto_167539 ) ) ( not ( = ?auto_167541 ?auto_167545 ) ) ( not ( = ?auto_167541 ?auto_167546 ) ) ( not ( = ?auto_167541 ?auto_167544 ) ) ( not ( = ?auto_167541 ?auto_167540 ) ) ( not ( = ?auto_167541 ?auto_167539 ) ) ( not ( = ?auto_167545 ?auto_167546 ) ) ( not ( = ?auto_167545 ?auto_167544 ) ) ( not ( = ?auto_167545 ?auto_167540 ) ) ( not ( = ?auto_167545 ?auto_167539 ) ) ( not ( = ?auto_167546 ?auto_167544 ) ) ( not ( = ?auto_167546 ?auto_167540 ) ) ( not ( = ?auto_167546 ?auto_167539 ) ) ( not ( = ?auto_167538 ?auto_167542 ) ) ( not ( = ?auto_167538 ?auto_167541 ) ) ( not ( = ?auto_167538 ?auto_167545 ) ) ( not ( = ?auto_167538 ?auto_167546 ) ) ( ON ?auto_167538 ?auto_167543 ) ( not ( = ?auto_167538 ?auto_167543 ) ) ( not ( = ?auto_167539 ?auto_167543 ) ) ( not ( = ?auto_167540 ?auto_167543 ) ) ( not ( = ?auto_167544 ?auto_167543 ) ) ( not ( = ?auto_167542 ?auto_167543 ) ) ( not ( = ?auto_167541 ?auto_167543 ) ) ( not ( = ?auto_167545 ?auto_167543 ) ) ( not ( = ?auto_167546 ?auto_167543 ) ) ( ON ?auto_167539 ?auto_167538 ) ( ON-TABLE ?auto_167543 ) ( ON ?auto_167540 ?auto_167539 ) ( CLEAR ?auto_167540 ) ( HOLDING ?auto_167544 ) ( CLEAR ?auto_167546 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_167542 ?auto_167541 ?auto_167545 ?auto_167546 ?auto_167544 )
      ( MAKE-3PILE ?auto_167538 ?auto_167539 ?auto_167540 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_167547 - BLOCK
      ?auto_167548 - BLOCK
      ?auto_167549 - BLOCK
    )
    :vars
    (
      ?auto_167550 - BLOCK
      ?auto_167552 - BLOCK
      ?auto_167553 - BLOCK
      ?auto_167551 - BLOCK
      ?auto_167554 - BLOCK
      ?auto_167555 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167547 ?auto_167548 ) ) ( not ( = ?auto_167547 ?auto_167549 ) ) ( not ( = ?auto_167548 ?auto_167549 ) ) ( not ( = ?auto_167547 ?auto_167550 ) ) ( not ( = ?auto_167548 ?auto_167550 ) ) ( not ( = ?auto_167549 ?auto_167550 ) ) ( ON-TABLE ?auto_167552 ) ( ON ?auto_167553 ?auto_167552 ) ( ON ?auto_167551 ?auto_167553 ) ( ON ?auto_167554 ?auto_167551 ) ( not ( = ?auto_167552 ?auto_167553 ) ) ( not ( = ?auto_167552 ?auto_167551 ) ) ( not ( = ?auto_167552 ?auto_167554 ) ) ( not ( = ?auto_167552 ?auto_167550 ) ) ( not ( = ?auto_167552 ?auto_167549 ) ) ( not ( = ?auto_167552 ?auto_167548 ) ) ( not ( = ?auto_167553 ?auto_167551 ) ) ( not ( = ?auto_167553 ?auto_167554 ) ) ( not ( = ?auto_167553 ?auto_167550 ) ) ( not ( = ?auto_167553 ?auto_167549 ) ) ( not ( = ?auto_167553 ?auto_167548 ) ) ( not ( = ?auto_167551 ?auto_167554 ) ) ( not ( = ?auto_167551 ?auto_167550 ) ) ( not ( = ?auto_167551 ?auto_167549 ) ) ( not ( = ?auto_167551 ?auto_167548 ) ) ( not ( = ?auto_167554 ?auto_167550 ) ) ( not ( = ?auto_167554 ?auto_167549 ) ) ( not ( = ?auto_167554 ?auto_167548 ) ) ( not ( = ?auto_167547 ?auto_167552 ) ) ( not ( = ?auto_167547 ?auto_167553 ) ) ( not ( = ?auto_167547 ?auto_167551 ) ) ( not ( = ?auto_167547 ?auto_167554 ) ) ( ON ?auto_167547 ?auto_167555 ) ( not ( = ?auto_167547 ?auto_167555 ) ) ( not ( = ?auto_167548 ?auto_167555 ) ) ( not ( = ?auto_167549 ?auto_167555 ) ) ( not ( = ?auto_167550 ?auto_167555 ) ) ( not ( = ?auto_167552 ?auto_167555 ) ) ( not ( = ?auto_167553 ?auto_167555 ) ) ( not ( = ?auto_167551 ?auto_167555 ) ) ( not ( = ?auto_167554 ?auto_167555 ) ) ( ON ?auto_167548 ?auto_167547 ) ( ON-TABLE ?auto_167555 ) ( ON ?auto_167549 ?auto_167548 ) ( CLEAR ?auto_167554 ) ( ON ?auto_167550 ?auto_167549 ) ( CLEAR ?auto_167550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_167555 ?auto_167547 ?auto_167548 ?auto_167549 )
      ( MAKE-3PILE ?auto_167547 ?auto_167548 ?auto_167549 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_167556 - BLOCK
      ?auto_167557 - BLOCK
      ?auto_167558 - BLOCK
    )
    :vars
    (
      ?auto_167562 - BLOCK
      ?auto_167563 - BLOCK
      ?auto_167560 - BLOCK
      ?auto_167564 - BLOCK
      ?auto_167561 - BLOCK
      ?auto_167559 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167556 ?auto_167557 ) ) ( not ( = ?auto_167556 ?auto_167558 ) ) ( not ( = ?auto_167557 ?auto_167558 ) ) ( not ( = ?auto_167556 ?auto_167562 ) ) ( not ( = ?auto_167557 ?auto_167562 ) ) ( not ( = ?auto_167558 ?auto_167562 ) ) ( ON-TABLE ?auto_167563 ) ( ON ?auto_167560 ?auto_167563 ) ( ON ?auto_167564 ?auto_167560 ) ( not ( = ?auto_167563 ?auto_167560 ) ) ( not ( = ?auto_167563 ?auto_167564 ) ) ( not ( = ?auto_167563 ?auto_167561 ) ) ( not ( = ?auto_167563 ?auto_167562 ) ) ( not ( = ?auto_167563 ?auto_167558 ) ) ( not ( = ?auto_167563 ?auto_167557 ) ) ( not ( = ?auto_167560 ?auto_167564 ) ) ( not ( = ?auto_167560 ?auto_167561 ) ) ( not ( = ?auto_167560 ?auto_167562 ) ) ( not ( = ?auto_167560 ?auto_167558 ) ) ( not ( = ?auto_167560 ?auto_167557 ) ) ( not ( = ?auto_167564 ?auto_167561 ) ) ( not ( = ?auto_167564 ?auto_167562 ) ) ( not ( = ?auto_167564 ?auto_167558 ) ) ( not ( = ?auto_167564 ?auto_167557 ) ) ( not ( = ?auto_167561 ?auto_167562 ) ) ( not ( = ?auto_167561 ?auto_167558 ) ) ( not ( = ?auto_167561 ?auto_167557 ) ) ( not ( = ?auto_167556 ?auto_167563 ) ) ( not ( = ?auto_167556 ?auto_167560 ) ) ( not ( = ?auto_167556 ?auto_167564 ) ) ( not ( = ?auto_167556 ?auto_167561 ) ) ( ON ?auto_167556 ?auto_167559 ) ( not ( = ?auto_167556 ?auto_167559 ) ) ( not ( = ?auto_167557 ?auto_167559 ) ) ( not ( = ?auto_167558 ?auto_167559 ) ) ( not ( = ?auto_167562 ?auto_167559 ) ) ( not ( = ?auto_167563 ?auto_167559 ) ) ( not ( = ?auto_167560 ?auto_167559 ) ) ( not ( = ?auto_167564 ?auto_167559 ) ) ( not ( = ?auto_167561 ?auto_167559 ) ) ( ON ?auto_167557 ?auto_167556 ) ( ON-TABLE ?auto_167559 ) ( ON ?auto_167558 ?auto_167557 ) ( ON ?auto_167562 ?auto_167558 ) ( CLEAR ?auto_167562 ) ( HOLDING ?auto_167561 ) ( CLEAR ?auto_167564 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_167563 ?auto_167560 ?auto_167564 ?auto_167561 )
      ( MAKE-3PILE ?auto_167556 ?auto_167557 ?auto_167558 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_167565 - BLOCK
      ?auto_167566 - BLOCK
      ?auto_167567 - BLOCK
    )
    :vars
    (
      ?auto_167570 - BLOCK
      ?auto_167572 - BLOCK
      ?auto_167568 - BLOCK
      ?auto_167569 - BLOCK
      ?auto_167571 - BLOCK
      ?auto_167573 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167565 ?auto_167566 ) ) ( not ( = ?auto_167565 ?auto_167567 ) ) ( not ( = ?auto_167566 ?auto_167567 ) ) ( not ( = ?auto_167565 ?auto_167570 ) ) ( not ( = ?auto_167566 ?auto_167570 ) ) ( not ( = ?auto_167567 ?auto_167570 ) ) ( ON-TABLE ?auto_167572 ) ( ON ?auto_167568 ?auto_167572 ) ( ON ?auto_167569 ?auto_167568 ) ( not ( = ?auto_167572 ?auto_167568 ) ) ( not ( = ?auto_167572 ?auto_167569 ) ) ( not ( = ?auto_167572 ?auto_167571 ) ) ( not ( = ?auto_167572 ?auto_167570 ) ) ( not ( = ?auto_167572 ?auto_167567 ) ) ( not ( = ?auto_167572 ?auto_167566 ) ) ( not ( = ?auto_167568 ?auto_167569 ) ) ( not ( = ?auto_167568 ?auto_167571 ) ) ( not ( = ?auto_167568 ?auto_167570 ) ) ( not ( = ?auto_167568 ?auto_167567 ) ) ( not ( = ?auto_167568 ?auto_167566 ) ) ( not ( = ?auto_167569 ?auto_167571 ) ) ( not ( = ?auto_167569 ?auto_167570 ) ) ( not ( = ?auto_167569 ?auto_167567 ) ) ( not ( = ?auto_167569 ?auto_167566 ) ) ( not ( = ?auto_167571 ?auto_167570 ) ) ( not ( = ?auto_167571 ?auto_167567 ) ) ( not ( = ?auto_167571 ?auto_167566 ) ) ( not ( = ?auto_167565 ?auto_167572 ) ) ( not ( = ?auto_167565 ?auto_167568 ) ) ( not ( = ?auto_167565 ?auto_167569 ) ) ( not ( = ?auto_167565 ?auto_167571 ) ) ( ON ?auto_167565 ?auto_167573 ) ( not ( = ?auto_167565 ?auto_167573 ) ) ( not ( = ?auto_167566 ?auto_167573 ) ) ( not ( = ?auto_167567 ?auto_167573 ) ) ( not ( = ?auto_167570 ?auto_167573 ) ) ( not ( = ?auto_167572 ?auto_167573 ) ) ( not ( = ?auto_167568 ?auto_167573 ) ) ( not ( = ?auto_167569 ?auto_167573 ) ) ( not ( = ?auto_167571 ?auto_167573 ) ) ( ON ?auto_167566 ?auto_167565 ) ( ON-TABLE ?auto_167573 ) ( ON ?auto_167567 ?auto_167566 ) ( ON ?auto_167570 ?auto_167567 ) ( CLEAR ?auto_167569 ) ( ON ?auto_167571 ?auto_167570 ) ( CLEAR ?auto_167571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_167573 ?auto_167565 ?auto_167566 ?auto_167567 ?auto_167570 )
      ( MAKE-3PILE ?auto_167565 ?auto_167566 ?auto_167567 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_167574 - BLOCK
      ?auto_167575 - BLOCK
      ?auto_167576 - BLOCK
    )
    :vars
    (
      ?auto_167578 - BLOCK
      ?auto_167580 - BLOCK
      ?auto_167579 - BLOCK
      ?auto_167582 - BLOCK
      ?auto_167577 - BLOCK
      ?auto_167581 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167574 ?auto_167575 ) ) ( not ( = ?auto_167574 ?auto_167576 ) ) ( not ( = ?auto_167575 ?auto_167576 ) ) ( not ( = ?auto_167574 ?auto_167578 ) ) ( not ( = ?auto_167575 ?auto_167578 ) ) ( not ( = ?auto_167576 ?auto_167578 ) ) ( ON-TABLE ?auto_167580 ) ( ON ?auto_167579 ?auto_167580 ) ( not ( = ?auto_167580 ?auto_167579 ) ) ( not ( = ?auto_167580 ?auto_167582 ) ) ( not ( = ?auto_167580 ?auto_167577 ) ) ( not ( = ?auto_167580 ?auto_167578 ) ) ( not ( = ?auto_167580 ?auto_167576 ) ) ( not ( = ?auto_167580 ?auto_167575 ) ) ( not ( = ?auto_167579 ?auto_167582 ) ) ( not ( = ?auto_167579 ?auto_167577 ) ) ( not ( = ?auto_167579 ?auto_167578 ) ) ( not ( = ?auto_167579 ?auto_167576 ) ) ( not ( = ?auto_167579 ?auto_167575 ) ) ( not ( = ?auto_167582 ?auto_167577 ) ) ( not ( = ?auto_167582 ?auto_167578 ) ) ( not ( = ?auto_167582 ?auto_167576 ) ) ( not ( = ?auto_167582 ?auto_167575 ) ) ( not ( = ?auto_167577 ?auto_167578 ) ) ( not ( = ?auto_167577 ?auto_167576 ) ) ( not ( = ?auto_167577 ?auto_167575 ) ) ( not ( = ?auto_167574 ?auto_167580 ) ) ( not ( = ?auto_167574 ?auto_167579 ) ) ( not ( = ?auto_167574 ?auto_167582 ) ) ( not ( = ?auto_167574 ?auto_167577 ) ) ( ON ?auto_167574 ?auto_167581 ) ( not ( = ?auto_167574 ?auto_167581 ) ) ( not ( = ?auto_167575 ?auto_167581 ) ) ( not ( = ?auto_167576 ?auto_167581 ) ) ( not ( = ?auto_167578 ?auto_167581 ) ) ( not ( = ?auto_167580 ?auto_167581 ) ) ( not ( = ?auto_167579 ?auto_167581 ) ) ( not ( = ?auto_167582 ?auto_167581 ) ) ( not ( = ?auto_167577 ?auto_167581 ) ) ( ON ?auto_167575 ?auto_167574 ) ( ON-TABLE ?auto_167581 ) ( ON ?auto_167576 ?auto_167575 ) ( ON ?auto_167578 ?auto_167576 ) ( ON ?auto_167577 ?auto_167578 ) ( CLEAR ?auto_167577 ) ( HOLDING ?auto_167582 ) ( CLEAR ?auto_167579 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_167580 ?auto_167579 ?auto_167582 )
      ( MAKE-3PILE ?auto_167574 ?auto_167575 ?auto_167576 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_167583 - BLOCK
      ?auto_167584 - BLOCK
      ?auto_167585 - BLOCK
    )
    :vars
    (
      ?auto_167591 - BLOCK
      ?auto_167589 - BLOCK
      ?auto_167590 - BLOCK
      ?auto_167587 - BLOCK
      ?auto_167588 - BLOCK
      ?auto_167586 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167583 ?auto_167584 ) ) ( not ( = ?auto_167583 ?auto_167585 ) ) ( not ( = ?auto_167584 ?auto_167585 ) ) ( not ( = ?auto_167583 ?auto_167591 ) ) ( not ( = ?auto_167584 ?auto_167591 ) ) ( not ( = ?auto_167585 ?auto_167591 ) ) ( ON-TABLE ?auto_167589 ) ( ON ?auto_167590 ?auto_167589 ) ( not ( = ?auto_167589 ?auto_167590 ) ) ( not ( = ?auto_167589 ?auto_167587 ) ) ( not ( = ?auto_167589 ?auto_167588 ) ) ( not ( = ?auto_167589 ?auto_167591 ) ) ( not ( = ?auto_167589 ?auto_167585 ) ) ( not ( = ?auto_167589 ?auto_167584 ) ) ( not ( = ?auto_167590 ?auto_167587 ) ) ( not ( = ?auto_167590 ?auto_167588 ) ) ( not ( = ?auto_167590 ?auto_167591 ) ) ( not ( = ?auto_167590 ?auto_167585 ) ) ( not ( = ?auto_167590 ?auto_167584 ) ) ( not ( = ?auto_167587 ?auto_167588 ) ) ( not ( = ?auto_167587 ?auto_167591 ) ) ( not ( = ?auto_167587 ?auto_167585 ) ) ( not ( = ?auto_167587 ?auto_167584 ) ) ( not ( = ?auto_167588 ?auto_167591 ) ) ( not ( = ?auto_167588 ?auto_167585 ) ) ( not ( = ?auto_167588 ?auto_167584 ) ) ( not ( = ?auto_167583 ?auto_167589 ) ) ( not ( = ?auto_167583 ?auto_167590 ) ) ( not ( = ?auto_167583 ?auto_167587 ) ) ( not ( = ?auto_167583 ?auto_167588 ) ) ( ON ?auto_167583 ?auto_167586 ) ( not ( = ?auto_167583 ?auto_167586 ) ) ( not ( = ?auto_167584 ?auto_167586 ) ) ( not ( = ?auto_167585 ?auto_167586 ) ) ( not ( = ?auto_167591 ?auto_167586 ) ) ( not ( = ?auto_167589 ?auto_167586 ) ) ( not ( = ?auto_167590 ?auto_167586 ) ) ( not ( = ?auto_167587 ?auto_167586 ) ) ( not ( = ?auto_167588 ?auto_167586 ) ) ( ON ?auto_167584 ?auto_167583 ) ( ON-TABLE ?auto_167586 ) ( ON ?auto_167585 ?auto_167584 ) ( ON ?auto_167591 ?auto_167585 ) ( ON ?auto_167588 ?auto_167591 ) ( CLEAR ?auto_167590 ) ( ON ?auto_167587 ?auto_167588 ) ( CLEAR ?auto_167587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_167586 ?auto_167583 ?auto_167584 ?auto_167585 ?auto_167591 ?auto_167588 )
      ( MAKE-3PILE ?auto_167583 ?auto_167584 ?auto_167585 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_167592 - BLOCK
      ?auto_167593 - BLOCK
      ?auto_167594 - BLOCK
    )
    :vars
    (
      ?auto_167595 - BLOCK
      ?auto_167599 - BLOCK
      ?auto_167596 - BLOCK
      ?auto_167598 - BLOCK
      ?auto_167600 - BLOCK
      ?auto_167597 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167592 ?auto_167593 ) ) ( not ( = ?auto_167592 ?auto_167594 ) ) ( not ( = ?auto_167593 ?auto_167594 ) ) ( not ( = ?auto_167592 ?auto_167595 ) ) ( not ( = ?auto_167593 ?auto_167595 ) ) ( not ( = ?auto_167594 ?auto_167595 ) ) ( ON-TABLE ?auto_167599 ) ( not ( = ?auto_167599 ?auto_167596 ) ) ( not ( = ?auto_167599 ?auto_167598 ) ) ( not ( = ?auto_167599 ?auto_167600 ) ) ( not ( = ?auto_167599 ?auto_167595 ) ) ( not ( = ?auto_167599 ?auto_167594 ) ) ( not ( = ?auto_167599 ?auto_167593 ) ) ( not ( = ?auto_167596 ?auto_167598 ) ) ( not ( = ?auto_167596 ?auto_167600 ) ) ( not ( = ?auto_167596 ?auto_167595 ) ) ( not ( = ?auto_167596 ?auto_167594 ) ) ( not ( = ?auto_167596 ?auto_167593 ) ) ( not ( = ?auto_167598 ?auto_167600 ) ) ( not ( = ?auto_167598 ?auto_167595 ) ) ( not ( = ?auto_167598 ?auto_167594 ) ) ( not ( = ?auto_167598 ?auto_167593 ) ) ( not ( = ?auto_167600 ?auto_167595 ) ) ( not ( = ?auto_167600 ?auto_167594 ) ) ( not ( = ?auto_167600 ?auto_167593 ) ) ( not ( = ?auto_167592 ?auto_167599 ) ) ( not ( = ?auto_167592 ?auto_167596 ) ) ( not ( = ?auto_167592 ?auto_167598 ) ) ( not ( = ?auto_167592 ?auto_167600 ) ) ( ON ?auto_167592 ?auto_167597 ) ( not ( = ?auto_167592 ?auto_167597 ) ) ( not ( = ?auto_167593 ?auto_167597 ) ) ( not ( = ?auto_167594 ?auto_167597 ) ) ( not ( = ?auto_167595 ?auto_167597 ) ) ( not ( = ?auto_167599 ?auto_167597 ) ) ( not ( = ?auto_167596 ?auto_167597 ) ) ( not ( = ?auto_167598 ?auto_167597 ) ) ( not ( = ?auto_167600 ?auto_167597 ) ) ( ON ?auto_167593 ?auto_167592 ) ( ON-TABLE ?auto_167597 ) ( ON ?auto_167594 ?auto_167593 ) ( ON ?auto_167595 ?auto_167594 ) ( ON ?auto_167600 ?auto_167595 ) ( ON ?auto_167598 ?auto_167600 ) ( CLEAR ?auto_167598 ) ( HOLDING ?auto_167596 ) ( CLEAR ?auto_167599 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_167599 ?auto_167596 )
      ( MAKE-3PILE ?auto_167592 ?auto_167593 ?auto_167594 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_167601 - BLOCK
      ?auto_167602 - BLOCK
      ?auto_167603 - BLOCK
    )
    :vars
    (
      ?auto_167604 - BLOCK
      ?auto_167605 - BLOCK
      ?auto_167609 - BLOCK
      ?auto_167606 - BLOCK
      ?auto_167607 - BLOCK
      ?auto_167608 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167601 ?auto_167602 ) ) ( not ( = ?auto_167601 ?auto_167603 ) ) ( not ( = ?auto_167602 ?auto_167603 ) ) ( not ( = ?auto_167601 ?auto_167604 ) ) ( not ( = ?auto_167602 ?auto_167604 ) ) ( not ( = ?auto_167603 ?auto_167604 ) ) ( ON-TABLE ?auto_167605 ) ( not ( = ?auto_167605 ?auto_167609 ) ) ( not ( = ?auto_167605 ?auto_167606 ) ) ( not ( = ?auto_167605 ?auto_167607 ) ) ( not ( = ?auto_167605 ?auto_167604 ) ) ( not ( = ?auto_167605 ?auto_167603 ) ) ( not ( = ?auto_167605 ?auto_167602 ) ) ( not ( = ?auto_167609 ?auto_167606 ) ) ( not ( = ?auto_167609 ?auto_167607 ) ) ( not ( = ?auto_167609 ?auto_167604 ) ) ( not ( = ?auto_167609 ?auto_167603 ) ) ( not ( = ?auto_167609 ?auto_167602 ) ) ( not ( = ?auto_167606 ?auto_167607 ) ) ( not ( = ?auto_167606 ?auto_167604 ) ) ( not ( = ?auto_167606 ?auto_167603 ) ) ( not ( = ?auto_167606 ?auto_167602 ) ) ( not ( = ?auto_167607 ?auto_167604 ) ) ( not ( = ?auto_167607 ?auto_167603 ) ) ( not ( = ?auto_167607 ?auto_167602 ) ) ( not ( = ?auto_167601 ?auto_167605 ) ) ( not ( = ?auto_167601 ?auto_167609 ) ) ( not ( = ?auto_167601 ?auto_167606 ) ) ( not ( = ?auto_167601 ?auto_167607 ) ) ( ON ?auto_167601 ?auto_167608 ) ( not ( = ?auto_167601 ?auto_167608 ) ) ( not ( = ?auto_167602 ?auto_167608 ) ) ( not ( = ?auto_167603 ?auto_167608 ) ) ( not ( = ?auto_167604 ?auto_167608 ) ) ( not ( = ?auto_167605 ?auto_167608 ) ) ( not ( = ?auto_167609 ?auto_167608 ) ) ( not ( = ?auto_167606 ?auto_167608 ) ) ( not ( = ?auto_167607 ?auto_167608 ) ) ( ON ?auto_167602 ?auto_167601 ) ( ON-TABLE ?auto_167608 ) ( ON ?auto_167603 ?auto_167602 ) ( ON ?auto_167604 ?auto_167603 ) ( ON ?auto_167607 ?auto_167604 ) ( ON ?auto_167606 ?auto_167607 ) ( CLEAR ?auto_167605 ) ( ON ?auto_167609 ?auto_167606 ) ( CLEAR ?auto_167609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_167608 ?auto_167601 ?auto_167602 ?auto_167603 ?auto_167604 ?auto_167607 ?auto_167606 )
      ( MAKE-3PILE ?auto_167601 ?auto_167602 ?auto_167603 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_167610 - BLOCK
      ?auto_167611 - BLOCK
      ?auto_167612 - BLOCK
    )
    :vars
    (
      ?auto_167616 - BLOCK
      ?auto_167615 - BLOCK
      ?auto_167617 - BLOCK
      ?auto_167614 - BLOCK
      ?auto_167613 - BLOCK
      ?auto_167618 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167610 ?auto_167611 ) ) ( not ( = ?auto_167610 ?auto_167612 ) ) ( not ( = ?auto_167611 ?auto_167612 ) ) ( not ( = ?auto_167610 ?auto_167616 ) ) ( not ( = ?auto_167611 ?auto_167616 ) ) ( not ( = ?auto_167612 ?auto_167616 ) ) ( not ( = ?auto_167615 ?auto_167617 ) ) ( not ( = ?auto_167615 ?auto_167614 ) ) ( not ( = ?auto_167615 ?auto_167613 ) ) ( not ( = ?auto_167615 ?auto_167616 ) ) ( not ( = ?auto_167615 ?auto_167612 ) ) ( not ( = ?auto_167615 ?auto_167611 ) ) ( not ( = ?auto_167617 ?auto_167614 ) ) ( not ( = ?auto_167617 ?auto_167613 ) ) ( not ( = ?auto_167617 ?auto_167616 ) ) ( not ( = ?auto_167617 ?auto_167612 ) ) ( not ( = ?auto_167617 ?auto_167611 ) ) ( not ( = ?auto_167614 ?auto_167613 ) ) ( not ( = ?auto_167614 ?auto_167616 ) ) ( not ( = ?auto_167614 ?auto_167612 ) ) ( not ( = ?auto_167614 ?auto_167611 ) ) ( not ( = ?auto_167613 ?auto_167616 ) ) ( not ( = ?auto_167613 ?auto_167612 ) ) ( not ( = ?auto_167613 ?auto_167611 ) ) ( not ( = ?auto_167610 ?auto_167615 ) ) ( not ( = ?auto_167610 ?auto_167617 ) ) ( not ( = ?auto_167610 ?auto_167614 ) ) ( not ( = ?auto_167610 ?auto_167613 ) ) ( ON ?auto_167610 ?auto_167618 ) ( not ( = ?auto_167610 ?auto_167618 ) ) ( not ( = ?auto_167611 ?auto_167618 ) ) ( not ( = ?auto_167612 ?auto_167618 ) ) ( not ( = ?auto_167616 ?auto_167618 ) ) ( not ( = ?auto_167615 ?auto_167618 ) ) ( not ( = ?auto_167617 ?auto_167618 ) ) ( not ( = ?auto_167614 ?auto_167618 ) ) ( not ( = ?auto_167613 ?auto_167618 ) ) ( ON ?auto_167611 ?auto_167610 ) ( ON-TABLE ?auto_167618 ) ( ON ?auto_167612 ?auto_167611 ) ( ON ?auto_167616 ?auto_167612 ) ( ON ?auto_167613 ?auto_167616 ) ( ON ?auto_167614 ?auto_167613 ) ( ON ?auto_167617 ?auto_167614 ) ( CLEAR ?auto_167617 ) ( HOLDING ?auto_167615 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_167615 )
      ( MAKE-3PILE ?auto_167610 ?auto_167611 ?auto_167612 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_167619 - BLOCK
      ?auto_167620 - BLOCK
      ?auto_167621 - BLOCK
    )
    :vars
    (
      ?auto_167623 - BLOCK
      ?auto_167625 - BLOCK
      ?auto_167626 - BLOCK
      ?auto_167624 - BLOCK
      ?auto_167622 - BLOCK
      ?auto_167627 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167619 ?auto_167620 ) ) ( not ( = ?auto_167619 ?auto_167621 ) ) ( not ( = ?auto_167620 ?auto_167621 ) ) ( not ( = ?auto_167619 ?auto_167623 ) ) ( not ( = ?auto_167620 ?auto_167623 ) ) ( not ( = ?auto_167621 ?auto_167623 ) ) ( not ( = ?auto_167625 ?auto_167626 ) ) ( not ( = ?auto_167625 ?auto_167624 ) ) ( not ( = ?auto_167625 ?auto_167622 ) ) ( not ( = ?auto_167625 ?auto_167623 ) ) ( not ( = ?auto_167625 ?auto_167621 ) ) ( not ( = ?auto_167625 ?auto_167620 ) ) ( not ( = ?auto_167626 ?auto_167624 ) ) ( not ( = ?auto_167626 ?auto_167622 ) ) ( not ( = ?auto_167626 ?auto_167623 ) ) ( not ( = ?auto_167626 ?auto_167621 ) ) ( not ( = ?auto_167626 ?auto_167620 ) ) ( not ( = ?auto_167624 ?auto_167622 ) ) ( not ( = ?auto_167624 ?auto_167623 ) ) ( not ( = ?auto_167624 ?auto_167621 ) ) ( not ( = ?auto_167624 ?auto_167620 ) ) ( not ( = ?auto_167622 ?auto_167623 ) ) ( not ( = ?auto_167622 ?auto_167621 ) ) ( not ( = ?auto_167622 ?auto_167620 ) ) ( not ( = ?auto_167619 ?auto_167625 ) ) ( not ( = ?auto_167619 ?auto_167626 ) ) ( not ( = ?auto_167619 ?auto_167624 ) ) ( not ( = ?auto_167619 ?auto_167622 ) ) ( ON ?auto_167619 ?auto_167627 ) ( not ( = ?auto_167619 ?auto_167627 ) ) ( not ( = ?auto_167620 ?auto_167627 ) ) ( not ( = ?auto_167621 ?auto_167627 ) ) ( not ( = ?auto_167623 ?auto_167627 ) ) ( not ( = ?auto_167625 ?auto_167627 ) ) ( not ( = ?auto_167626 ?auto_167627 ) ) ( not ( = ?auto_167624 ?auto_167627 ) ) ( not ( = ?auto_167622 ?auto_167627 ) ) ( ON ?auto_167620 ?auto_167619 ) ( ON-TABLE ?auto_167627 ) ( ON ?auto_167621 ?auto_167620 ) ( ON ?auto_167623 ?auto_167621 ) ( ON ?auto_167622 ?auto_167623 ) ( ON ?auto_167624 ?auto_167622 ) ( ON ?auto_167626 ?auto_167624 ) ( ON ?auto_167625 ?auto_167626 ) ( CLEAR ?auto_167625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_167627 ?auto_167619 ?auto_167620 ?auto_167621 ?auto_167623 ?auto_167622 ?auto_167624 ?auto_167626 )
      ( MAKE-3PILE ?auto_167619 ?auto_167620 ?auto_167621 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_167651 - BLOCK
      ?auto_167652 - BLOCK
      ?auto_167653 - BLOCK
      ?auto_167654 - BLOCK
    )
    :vars
    (
      ?auto_167656 - BLOCK
      ?auto_167655 - BLOCK
      ?auto_167657 - BLOCK
      ?auto_167658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167656 ?auto_167654 ) ( ON-TABLE ?auto_167651 ) ( ON ?auto_167652 ?auto_167651 ) ( ON ?auto_167653 ?auto_167652 ) ( ON ?auto_167654 ?auto_167653 ) ( not ( = ?auto_167651 ?auto_167652 ) ) ( not ( = ?auto_167651 ?auto_167653 ) ) ( not ( = ?auto_167651 ?auto_167654 ) ) ( not ( = ?auto_167651 ?auto_167656 ) ) ( not ( = ?auto_167652 ?auto_167653 ) ) ( not ( = ?auto_167652 ?auto_167654 ) ) ( not ( = ?auto_167652 ?auto_167656 ) ) ( not ( = ?auto_167653 ?auto_167654 ) ) ( not ( = ?auto_167653 ?auto_167656 ) ) ( not ( = ?auto_167654 ?auto_167656 ) ) ( not ( = ?auto_167651 ?auto_167655 ) ) ( not ( = ?auto_167651 ?auto_167657 ) ) ( not ( = ?auto_167652 ?auto_167655 ) ) ( not ( = ?auto_167652 ?auto_167657 ) ) ( not ( = ?auto_167653 ?auto_167655 ) ) ( not ( = ?auto_167653 ?auto_167657 ) ) ( not ( = ?auto_167654 ?auto_167655 ) ) ( not ( = ?auto_167654 ?auto_167657 ) ) ( not ( = ?auto_167656 ?auto_167655 ) ) ( not ( = ?auto_167656 ?auto_167657 ) ) ( not ( = ?auto_167655 ?auto_167657 ) ) ( ON ?auto_167655 ?auto_167656 ) ( CLEAR ?auto_167655 ) ( HOLDING ?auto_167657 ) ( CLEAR ?auto_167658 ) ( ON-TABLE ?auto_167658 ) ( not ( = ?auto_167658 ?auto_167657 ) ) ( not ( = ?auto_167651 ?auto_167658 ) ) ( not ( = ?auto_167652 ?auto_167658 ) ) ( not ( = ?auto_167653 ?auto_167658 ) ) ( not ( = ?auto_167654 ?auto_167658 ) ) ( not ( = ?auto_167656 ?auto_167658 ) ) ( not ( = ?auto_167655 ?auto_167658 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_167658 ?auto_167657 )
      ( MAKE-4PILE ?auto_167651 ?auto_167652 ?auto_167653 ?auto_167654 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_167659 - BLOCK
      ?auto_167660 - BLOCK
      ?auto_167661 - BLOCK
      ?auto_167662 - BLOCK
    )
    :vars
    (
      ?auto_167664 - BLOCK
      ?auto_167666 - BLOCK
      ?auto_167665 - BLOCK
      ?auto_167663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167664 ?auto_167662 ) ( ON-TABLE ?auto_167659 ) ( ON ?auto_167660 ?auto_167659 ) ( ON ?auto_167661 ?auto_167660 ) ( ON ?auto_167662 ?auto_167661 ) ( not ( = ?auto_167659 ?auto_167660 ) ) ( not ( = ?auto_167659 ?auto_167661 ) ) ( not ( = ?auto_167659 ?auto_167662 ) ) ( not ( = ?auto_167659 ?auto_167664 ) ) ( not ( = ?auto_167660 ?auto_167661 ) ) ( not ( = ?auto_167660 ?auto_167662 ) ) ( not ( = ?auto_167660 ?auto_167664 ) ) ( not ( = ?auto_167661 ?auto_167662 ) ) ( not ( = ?auto_167661 ?auto_167664 ) ) ( not ( = ?auto_167662 ?auto_167664 ) ) ( not ( = ?auto_167659 ?auto_167666 ) ) ( not ( = ?auto_167659 ?auto_167665 ) ) ( not ( = ?auto_167660 ?auto_167666 ) ) ( not ( = ?auto_167660 ?auto_167665 ) ) ( not ( = ?auto_167661 ?auto_167666 ) ) ( not ( = ?auto_167661 ?auto_167665 ) ) ( not ( = ?auto_167662 ?auto_167666 ) ) ( not ( = ?auto_167662 ?auto_167665 ) ) ( not ( = ?auto_167664 ?auto_167666 ) ) ( not ( = ?auto_167664 ?auto_167665 ) ) ( not ( = ?auto_167666 ?auto_167665 ) ) ( ON ?auto_167666 ?auto_167664 ) ( CLEAR ?auto_167663 ) ( ON-TABLE ?auto_167663 ) ( not ( = ?auto_167663 ?auto_167665 ) ) ( not ( = ?auto_167659 ?auto_167663 ) ) ( not ( = ?auto_167660 ?auto_167663 ) ) ( not ( = ?auto_167661 ?auto_167663 ) ) ( not ( = ?auto_167662 ?auto_167663 ) ) ( not ( = ?auto_167664 ?auto_167663 ) ) ( not ( = ?auto_167666 ?auto_167663 ) ) ( ON ?auto_167665 ?auto_167666 ) ( CLEAR ?auto_167665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_167659 ?auto_167660 ?auto_167661 ?auto_167662 ?auto_167664 ?auto_167666 )
      ( MAKE-4PILE ?auto_167659 ?auto_167660 ?auto_167661 ?auto_167662 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_167667 - BLOCK
      ?auto_167668 - BLOCK
      ?auto_167669 - BLOCK
      ?auto_167670 - BLOCK
    )
    :vars
    (
      ?auto_167673 - BLOCK
      ?auto_167672 - BLOCK
      ?auto_167674 - BLOCK
      ?auto_167671 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167673 ?auto_167670 ) ( ON-TABLE ?auto_167667 ) ( ON ?auto_167668 ?auto_167667 ) ( ON ?auto_167669 ?auto_167668 ) ( ON ?auto_167670 ?auto_167669 ) ( not ( = ?auto_167667 ?auto_167668 ) ) ( not ( = ?auto_167667 ?auto_167669 ) ) ( not ( = ?auto_167667 ?auto_167670 ) ) ( not ( = ?auto_167667 ?auto_167673 ) ) ( not ( = ?auto_167668 ?auto_167669 ) ) ( not ( = ?auto_167668 ?auto_167670 ) ) ( not ( = ?auto_167668 ?auto_167673 ) ) ( not ( = ?auto_167669 ?auto_167670 ) ) ( not ( = ?auto_167669 ?auto_167673 ) ) ( not ( = ?auto_167670 ?auto_167673 ) ) ( not ( = ?auto_167667 ?auto_167672 ) ) ( not ( = ?auto_167667 ?auto_167674 ) ) ( not ( = ?auto_167668 ?auto_167672 ) ) ( not ( = ?auto_167668 ?auto_167674 ) ) ( not ( = ?auto_167669 ?auto_167672 ) ) ( not ( = ?auto_167669 ?auto_167674 ) ) ( not ( = ?auto_167670 ?auto_167672 ) ) ( not ( = ?auto_167670 ?auto_167674 ) ) ( not ( = ?auto_167673 ?auto_167672 ) ) ( not ( = ?auto_167673 ?auto_167674 ) ) ( not ( = ?auto_167672 ?auto_167674 ) ) ( ON ?auto_167672 ?auto_167673 ) ( not ( = ?auto_167671 ?auto_167674 ) ) ( not ( = ?auto_167667 ?auto_167671 ) ) ( not ( = ?auto_167668 ?auto_167671 ) ) ( not ( = ?auto_167669 ?auto_167671 ) ) ( not ( = ?auto_167670 ?auto_167671 ) ) ( not ( = ?auto_167673 ?auto_167671 ) ) ( not ( = ?auto_167672 ?auto_167671 ) ) ( ON ?auto_167674 ?auto_167672 ) ( CLEAR ?auto_167674 ) ( HOLDING ?auto_167671 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_167671 )
      ( MAKE-4PILE ?auto_167667 ?auto_167668 ?auto_167669 ?auto_167670 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_167687 - BLOCK
      ?auto_167688 - BLOCK
      ?auto_167689 - BLOCK
      ?auto_167690 - BLOCK
    )
    :vars
    (
      ?auto_167694 - BLOCK
      ?auto_167692 - BLOCK
      ?auto_167691 - BLOCK
      ?auto_167693 - BLOCK
      ?auto_167695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167694 ?auto_167690 ) ( ON-TABLE ?auto_167687 ) ( ON ?auto_167688 ?auto_167687 ) ( ON ?auto_167689 ?auto_167688 ) ( ON ?auto_167690 ?auto_167689 ) ( not ( = ?auto_167687 ?auto_167688 ) ) ( not ( = ?auto_167687 ?auto_167689 ) ) ( not ( = ?auto_167687 ?auto_167690 ) ) ( not ( = ?auto_167687 ?auto_167694 ) ) ( not ( = ?auto_167688 ?auto_167689 ) ) ( not ( = ?auto_167688 ?auto_167690 ) ) ( not ( = ?auto_167688 ?auto_167694 ) ) ( not ( = ?auto_167689 ?auto_167690 ) ) ( not ( = ?auto_167689 ?auto_167694 ) ) ( not ( = ?auto_167690 ?auto_167694 ) ) ( not ( = ?auto_167687 ?auto_167692 ) ) ( not ( = ?auto_167687 ?auto_167691 ) ) ( not ( = ?auto_167688 ?auto_167692 ) ) ( not ( = ?auto_167688 ?auto_167691 ) ) ( not ( = ?auto_167689 ?auto_167692 ) ) ( not ( = ?auto_167689 ?auto_167691 ) ) ( not ( = ?auto_167690 ?auto_167692 ) ) ( not ( = ?auto_167690 ?auto_167691 ) ) ( not ( = ?auto_167694 ?auto_167692 ) ) ( not ( = ?auto_167694 ?auto_167691 ) ) ( not ( = ?auto_167692 ?auto_167691 ) ) ( ON ?auto_167692 ?auto_167694 ) ( not ( = ?auto_167693 ?auto_167691 ) ) ( not ( = ?auto_167687 ?auto_167693 ) ) ( not ( = ?auto_167688 ?auto_167693 ) ) ( not ( = ?auto_167689 ?auto_167693 ) ) ( not ( = ?auto_167690 ?auto_167693 ) ) ( not ( = ?auto_167694 ?auto_167693 ) ) ( not ( = ?auto_167692 ?auto_167693 ) ) ( ON ?auto_167691 ?auto_167692 ) ( CLEAR ?auto_167691 ) ( ON ?auto_167693 ?auto_167695 ) ( CLEAR ?auto_167693 ) ( HAND-EMPTY ) ( not ( = ?auto_167687 ?auto_167695 ) ) ( not ( = ?auto_167688 ?auto_167695 ) ) ( not ( = ?auto_167689 ?auto_167695 ) ) ( not ( = ?auto_167690 ?auto_167695 ) ) ( not ( = ?auto_167694 ?auto_167695 ) ) ( not ( = ?auto_167692 ?auto_167695 ) ) ( not ( = ?auto_167691 ?auto_167695 ) ) ( not ( = ?auto_167693 ?auto_167695 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_167693 ?auto_167695 )
      ( MAKE-4PILE ?auto_167687 ?auto_167688 ?auto_167689 ?auto_167690 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_167696 - BLOCK
      ?auto_167697 - BLOCK
      ?auto_167698 - BLOCK
      ?auto_167699 - BLOCK
    )
    :vars
    (
      ?auto_167702 - BLOCK
      ?auto_167703 - BLOCK
      ?auto_167700 - BLOCK
      ?auto_167704 - BLOCK
      ?auto_167701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167702 ?auto_167699 ) ( ON-TABLE ?auto_167696 ) ( ON ?auto_167697 ?auto_167696 ) ( ON ?auto_167698 ?auto_167697 ) ( ON ?auto_167699 ?auto_167698 ) ( not ( = ?auto_167696 ?auto_167697 ) ) ( not ( = ?auto_167696 ?auto_167698 ) ) ( not ( = ?auto_167696 ?auto_167699 ) ) ( not ( = ?auto_167696 ?auto_167702 ) ) ( not ( = ?auto_167697 ?auto_167698 ) ) ( not ( = ?auto_167697 ?auto_167699 ) ) ( not ( = ?auto_167697 ?auto_167702 ) ) ( not ( = ?auto_167698 ?auto_167699 ) ) ( not ( = ?auto_167698 ?auto_167702 ) ) ( not ( = ?auto_167699 ?auto_167702 ) ) ( not ( = ?auto_167696 ?auto_167703 ) ) ( not ( = ?auto_167696 ?auto_167700 ) ) ( not ( = ?auto_167697 ?auto_167703 ) ) ( not ( = ?auto_167697 ?auto_167700 ) ) ( not ( = ?auto_167698 ?auto_167703 ) ) ( not ( = ?auto_167698 ?auto_167700 ) ) ( not ( = ?auto_167699 ?auto_167703 ) ) ( not ( = ?auto_167699 ?auto_167700 ) ) ( not ( = ?auto_167702 ?auto_167703 ) ) ( not ( = ?auto_167702 ?auto_167700 ) ) ( not ( = ?auto_167703 ?auto_167700 ) ) ( ON ?auto_167703 ?auto_167702 ) ( not ( = ?auto_167704 ?auto_167700 ) ) ( not ( = ?auto_167696 ?auto_167704 ) ) ( not ( = ?auto_167697 ?auto_167704 ) ) ( not ( = ?auto_167698 ?auto_167704 ) ) ( not ( = ?auto_167699 ?auto_167704 ) ) ( not ( = ?auto_167702 ?auto_167704 ) ) ( not ( = ?auto_167703 ?auto_167704 ) ) ( ON ?auto_167704 ?auto_167701 ) ( CLEAR ?auto_167704 ) ( not ( = ?auto_167696 ?auto_167701 ) ) ( not ( = ?auto_167697 ?auto_167701 ) ) ( not ( = ?auto_167698 ?auto_167701 ) ) ( not ( = ?auto_167699 ?auto_167701 ) ) ( not ( = ?auto_167702 ?auto_167701 ) ) ( not ( = ?auto_167703 ?auto_167701 ) ) ( not ( = ?auto_167700 ?auto_167701 ) ) ( not ( = ?auto_167704 ?auto_167701 ) ) ( HOLDING ?auto_167700 ) ( CLEAR ?auto_167703 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_167696 ?auto_167697 ?auto_167698 ?auto_167699 ?auto_167702 ?auto_167703 ?auto_167700 )
      ( MAKE-4PILE ?auto_167696 ?auto_167697 ?auto_167698 ?auto_167699 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_167778 - BLOCK
      ?auto_167779 - BLOCK
      ?auto_167780 - BLOCK
      ?auto_167781 - BLOCK
    )
    :vars
    (
      ?auto_167782 - BLOCK
      ?auto_167785 - BLOCK
      ?auto_167783 - BLOCK
      ?auto_167784 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167778 ) ( ON ?auto_167779 ?auto_167778 ) ( not ( = ?auto_167778 ?auto_167779 ) ) ( not ( = ?auto_167778 ?auto_167780 ) ) ( not ( = ?auto_167778 ?auto_167781 ) ) ( not ( = ?auto_167779 ?auto_167780 ) ) ( not ( = ?auto_167779 ?auto_167781 ) ) ( not ( = ?auto_167780 ?auto_167781 ) ) ( ON ?auto_167781 ?auto_167782 ) ( not ( = ?auto_167778 ?auto_167782 ) ) ( not ( = ?auto_167779 ?auto_167782 ) ) ( not ( = ?auto_167780 ?auto_167782 ) ) ( not ( = ?auto_167781 ?auto_167782 ) ) ( CLEAR ?auto_167779 ) ( ON ?auto_167780 ?auto_167781 ) ( CLEAR ?auto_167780 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_167785 ) ( ON ?auto_167783 ?auto_167785 ) ( ON ?auto_167784 ?auto_167783 ) ( ON ?auto_167782 ?auto_167784 ) ( not ( = ?auto_167785 ?auto_167783 ) ) ( not ( = ?auto_167785 ?auto_167784 ) ) ( not ( = ?auto_167785 ?auto_167782 ) ) ( not ( = ?auto_167785 ?auto_167781 ) ) ( not ( = ?auto_167785 ?auto_167780 ) ) ( not ( = ?auto_167783 ?auto_167784 ) ) ( not ( = ?auto_167783 ?auto_167782 ) ) ( not ( = ?auto_167783 ?auto_167781 ) ) ( not ( = ?auto_167783 ?auto_167780 ) ) ( not ( = ?auto_167784 ?auto_167782 ) ) ( not ( = ?auto_167784 ?auto_167781 ) ) ( not ( = ?auto_167784 ?auto_167780 ) ) ( not ( = ?auto_167778 ?auto_167785 ) ) ( not ( = ?auto_167778 ?auto_167783 ) ) ( not ( = ?auto_167778 ?auto_167784 ) ) ( not ( = ?auto_167779 ?auto_167785 ) ) ( not ( = ?auto_167779 ?auto_167783 ) ) ( not ( = ?auto_167779 ?auto_167784 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_167785 ?auto_167783 ?auto_167784 ?auto_167782 ?auto_167781 )
      ( MAKE-4PILE ?auto_167778 ?auto_167779 ?auto_167780 ?auto_167781 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_167786 - BLOCK
      ?auto_167787 - BLOCK
      ?auto_167788 - BLOCK
      ?auto_167789 - BLOCK
    )
    :vars
    (
      ?auto_167791 - BLOCK
      ?auto_167790 - BLOCK
      ?auto_167792 - BLOCK
      ?auto_167793 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167786 ) ( not ( = ?auto_167786 ?auto_167787 ) ) ( not ( = ?auto_167786 ?auto_167788 ) ) ( not ( = ?auto_167786 ?auto_167789 ) ) ( not ( = ?auto_167787 ?auto_167788 ) ) ( not ( = ?auto_167787 ?auto_167789 ) ) ( not ( = ?auto_167788 ?auto_167789 ) ) ( ON ?auto_167789 ?auto_167791 ) ( not ( = ?auto_167786 ?auto_167791 ) ) ( not ( = ?auto_167787 ?auto_167791 ) ) ( not ( = ?auto_167788 ?auto_167791 ) ) ( not ( = ?auto_167789 ?auto_167791 ) ) ( ON ?auto_167788 ?auto_167789 ) ( CLEAR ?auto_167788 ) ( ON-TABLE ?auto_167790 ) ( ON ?auto_167792 ?auto_167790 ) ( ON ?auto_167793 ?auto_167792 ) ( ON ?auto_167791 ?auto_167793 ) ( not ( = ?auto_167790 ?auto_167792 ) ) ( not ( = ?auto_167790 ?auto_167793 ) ) ( not ( = ?auto_167790 ?auto_167791 ) ) ( not ( = ?auto_167790 ?auto_167789 ) ) ( not ( = ?auto_167790 ?auto_167788 ) ) ( not ( = ?auto_167792 ?auto_167793 ) ) ( not ( = ?auto_167792 ?auto_167791 ) ) ( not ( = ?auto_167792 ?auto_167789 ) ) ( not ( = ?auto_167792 ?auto_167788 ) ) ( not ( = ?auto_167793 ?auto_167791 ) ) ( not ( = ?auto_167793 ?auto_167789 ) ) ( not ( = ?auto_167793 ?auto_167788 ) ) ( not ( = ?auto_167786 ?auto_167790 ) ) ( not ( = ?auto_167786 ?auto_167792 ) ) ( not ( = ?auto_167786 ?auto_167793 ) ) ( not ( = ?auto_167787 ?auto_167790 ) ) ( not ( = ?auto_167787 ?auto_167792 ) ) ( not ( = ?auto_167787 ?auto_167793 ) ) ( HOLDING ?auto_167787 ) ( CLEAR ?auto_167786 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_167786 ?auto_167787 )
      ( MAKE-4PILE ?auto_167786 ?auto_167787 ?auto_167788 ?auto_167789 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_167794 - BLOCK
      ?auto_167795 - BLOCK
      ?auto_167796 - BLOCK
      ?auto_167797 - BLOCK
    )
    :vars
    (
      ?auto_167800 - BLOCK
      ?auto_167798 - BLOCK
      ?auto_167801 - BLOCK
      ?auto_167799 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167794 ) ( not ( = ?auto_167794 ?auto_167795 ) ) ( not ( = ?auto_167794 ?auto_167796 ) ) ( not ( = ?auto_167794 ?auto_167797 ) ) ( not ( = ?auto_167795 ?auto_167796 ) ) ( not ( = ?auto_167795 ?auto_167797 ) ) ( not ( = ?auto_167796 ?auto_167797 ) ) ( ON ?auto_167797 ?auto_167800 ) ( not ( = ?auto_167794 ?auto_167800 ) ) ( not ( = ?auto_167795 ?auto_167800 ) ) ( not ( = ?auto_167796 ?auto_167800 ) ) ( not ( = ?auto_167797 ?auto_167800 ) ) ( ON ?auto_167796 ?auto_167797 ) ( ON-TABLE ?auto_167798 ) ( ON ?auto_167801 ?auto_167798 ) ( ON ?auto_167799 ?auto_167801 ) ( ON ?auto_167800 ?auto_167799 ) ( not ( = ?auto_167798 ?auto_167801 ) ) ( not ( = ?auto_167798 ?auto_167799 ) ) ( not ( = ?auto_167798 ?auto_167800 ) ) ( not ( = ?auto_167798 ?auto_167797 ) ) ( not ( = ?auto_167798 ?auto_167796 ) ) ( not ( = ?auto_167801 ?auto_167799 ) ) ( not ( = ?auto_167801 ?auto_167800 ) ) ( not ( = ?auto_167801 ?auto_167797 ) ) ( not ( = ?auto_167801 ?auto_167796 ) ) ( not ( = ?auto_167799 ?auto_167800 ) ) ( not ( = ?auto_167799 ?auto_167797 ) ) ( not ( = ?auto_167799 ?auto_167796 ) ) ( not ( = ?auto_167794 ?auto_167798 ) ) ( not ( = ?auto_167794 ?auto_167801 ) ) ( not ( = ?auto_167794 ?auto_167799 ) ) ( not ( = ?auto_167795 ?auto_167798 ) ) ( not ( = ?auto_167795 ?auto_167801 ) ) ( not ( = ?auto_167795 ?auto_167799 ) ) ( CLEAR ?auto_167794 ) ( ON ?auto_167795 ?auto_167796 ) ( CLEAR ?auto_167795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_167798 ?auto_167801 ?auto_167799 ?auto_167800 ?auto_167797 ?auto_167796 )
      ( MAKE-4PILE ?auto_167794 ?auto_167795 ?auto_167796 ?auto_167797 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_167802 - BLOCK
      ?auto_167803 - BLOCK
      ?auto_167804 - BLOCK
      ?auto_167805 - BLOCK
    )
    :vars
    (
      ?auto_167807 - BLOCK
      ?auto_167806 - BLOCK
      ?auto_167809 - BLOCK
      ?auto_167808 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167802 ?auto_167803 ) ) ( not ( = ?auto_167802 ?auto_167804 ) ) ( not ( = ?auto_167802 ?auto_167805 ) ) ( not ( = ?auto_167803 ?auto_167804 ) ) ( not ( = ?auto_167803 ?auto_167805 ) ) ( not ( = ?auto_167804 ?auto_167805 ) ) ( ON ?auto_167805 ?auto_167807 ) ( not ( = ?auto_167802 ?auto_167807 ) ) ( not ( = ?auto_167803 ?auto_167807 ) ) ( not ( = ?auto_167804 ?auto_167807 ) ) ( not ( = ?auto_167805 ?auto_167807 ) ) ( ON ?auto_167804 ?auto_167805 ) ( ON-TABLE ?auto_167806 ) ( ON ?auto_167809 ?auto_167806 ) ( ON ?auto_167808 ?auto_167809 ) ( ON ?auto_167807 ?auto_167808 ) ( not ( = ?auto_167806 ?auto_167809 ) ) ( not ( = ?auto_167806 ?auto_167808 ) ) ( not ( = ?auto_167806 ?auto_167807 ) ) ( not ( = ?auto_167806 ?auto_167805 ) ) ( not ( = ?auto_167806 ?auto_167804 ) ) ( not ( = ?auto_167809 ?auto_167808 ) ) ( not ( = ?auto_167809 ?auto_167807 ) ) ( not ( = ?auto_167809 ?auto_167805 ) ) ( not ( = ?auto_167809 ?auto_167804 ) ) ( not ( = ?auto_167808 ?auto_167807 ) ) ( not ( = ?auto_167808 ?auto_167805 ) ) ( not ( = ?auto_167808 ?auto_167804 ) ) ( not ( = ?auto_167802 ?auto_167806 ) ) ( not ( = ?auto_167802 ?auto_167809 ) ) ( not ( = ?auto_167802 ?auto_167808 ) ) ( not ( = ?auto_167803 ?auto_167806 ) ) ( not ( = ?auto_167803 ?auto_167809 ) ) ( not ( = ?auto_167803 ?auto_167808 ) ) ( ON ?auto_167803 ?auto_167804 ) ( CLEAR ?auto_167803 ) ( HOLDING ?auto_167802 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_167802 )
      ( MAKE-4PILE ?auto_167802 ?auto_167803 ?auto_167804 ?auto_167805 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_167810 - BLOCK
      ?auto_167811 - BLOCK
      ?auto_167812 - BLOCK
      ?auto_167813 - BLOCK
    )
    :vars
    (
      ?auto_167817 - BLOCK
      ?auto_167816 - BLOCK
      ?auto_167814 - BLOCK
      ?auto_167815 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167810 ?auto_167811 ) ) ( not ( = ?auto_167810 ?auto_167812 ) ) ( not ( = ?auto_167810 ?auto_167813 ) ) ( not ( = ?auto_167811 ?auto_167812 ) ) ( not ( = ?auto_167811 ?auto_167813 ) ) ( not ( = ?auto_167812 ?auto_167813 ) ) ( ON ?auto_167813 ?auto_167817 ) ( not ( = ?auto_167810 ?auto_167817 ) ) ( not ( = ?auto_167811 ?auto_167817 ) ) ( not ( = ?auto_167812 ?auto_167817 ) ) ( not ( = ?auto_167813 ?auto_167817 ) ) ( ON ?auto_167812 ?auto_167813 ) ( ON-TABLE ?auto_167816 ) ( ON ?auto_167814 ?auto_167816 ) ( ON ?auto_167815 ?auto_167814 ) ( ON ?auto_167817 ?auto_167815 ) ( not ( = ?auto_167816 ?auto_167814 ) ) ( not ( = ?auto_167816 ?auto_167815 ) ) ( not ( = ?auto_167816 ?auto_167817 ) ) ( not ( = ?auto_167816 ?auto_167813 ) ) ( not ( = ?auto_167816 ?auto_167812 ) ) ( not ( = ?auto_167814 ?auto_167815 ) ) ( not ( = ?auto_167814 ?auto_167817 ) ) ( not ( = ?auto_167814 ?auto_167813 ) ) ( not ( = ?auto_167814 ?auto_167812 ) ) ( not ( = ?auto_167815 ?auto_167817 ) ) ( not ( = ?auto_167815 ?auto_167813 ) ) ( not ( = ?auto_167815 ?auto_167812 ) ) ( not ( = ?auto_167810 ?auto_167816 ) ) ( not ( = ?auto_167810 ?auto_167814 ) ) ( not ( = ?auto_167810 ?auto_167815 ) ) ( not ( = ?auto_167811 ?auto_167816 ) ) ( not ( = ?auto_167811 ?auto_167814 ) ) ( not ( = ?auto_167811 ?auto_167815 ) ) ( ON ?auto_167811 ?auto_167812 ) ( ON ?auto_167810 ?auto_167811 ) ( CLEAR ?auto_167810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_167816 ?auto_167814 ?auto_167815 ?auto_167817 ?auto_167813 ?auto_167812 ?auto_167811 )
      ( MAKE-4PILE ?auto_167810 ?auto_167811 ?auto_167812 ?auto_167813 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_167822 - BLOCK
      ?auto_167823 - BLOCK
      ?auto_167824 - BLOCK
      ?auto_167825 - BLOCK
    )
    :vars
    (
      ?auto_167828 - BLOCK
      ?auto_167826 - BLOCK
      ?auto_167827 - BLOCK
      ?auto_167829 - BLOCK
      ?auto_167830 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167822 ?auto_167823 ) ) ( not ( = ?auto_167822 ?auto_167824 ) ) ( not ( = ?auto_167822 ?auto_167825 ) ) ( not ( = ?auto_167823 ?auto_167824 ) ) ( not ( = ?auto_167823 ?auto_167825 ) ) ( not ( = ?auto_167824 ?auto_167825 ) ) ( ON ?auto_167825 ?auto_167828 ) ( not ( = ?auto_167822 ?auto_167828 ) ) ( not ( = ?auto_167823 ?auto_167828 ) ) ( not ( = ?auto_167824 ?auto_167828 ) ) ( not ( = ?auto_167825 ?auto_167828 ) ) ( ON ?auto_167824 ?auto_167825 ) ( ON-TABLE ?auto_167826 ) ( ON ?auto_167827 ?auto_167826 ) ( ON ?auto_167829 ?auto_167827 ) ( ON ?auto_167828 ?auto_167829 ) ( not ( = ?auto_167826 ?auto_167827 ) ) ( not ( = ?auto_167826 ?auto_167829 ) ) ( not ( = ?auto_167826 ?auto_167828 ) ) ( not ( = ?auto_167826 ?auto_167825 ) ) ( not ( = ?auto_167826 ?auto_167824 ) ) ( not ( = ?auto_167827 ?auto_167829 ) ) ( not ( = ?auto_167827 ?auto_167828 ) ) ( not ( = ?auto_167827 ?auto_167825 ) ) ( not ( = ?auto_167827 ?auto_167824 ) ) ( not ( = ?auto_167829 ?auto_167828 ) ) ( not ( = ?auto_167829 ?auto_167825 ) ) ( not ( = ?auto_167829 ?auto_167824 ) ) ( not ( = ?auto_167822 ?auto_167826 ) ) ( not ( = ?auto_167822 ?auto_167827 ) ) ( not ( = ?auto_167822 ?auto_167829 ) ) ( not ( = ?auto_167823 ?auto_167826 ) ) ( not ( = ?auto_167823 ?auto_167827 ) ) ( not ( = ?auto_167823 ?auto_167829 ) ) ( ON ?auto_167823 ?auto_167824 ) ( CLEAR ?auto_167823 ) ( ON ?auto_167822 ?auto_167830 ) ( CLEAR ?auto_167822 ) ( HAND-EMPTY ) ( not ( = ?auto_167822 ?auto_167830 ) ) ( not ( = ?auto_167823 ?auto_167830 ) ) ( not ( = ?auto_167824 ?auto_167830 ) ) ( not ( = ?auto_167825 ?auto_167830 ) ) ( not ( = ?auto_167828 ?auto_167830 ) ) ( not ( = ?auto_167826 ?auto_167830 ) ) ( not ( = ?auto_167827 ?auto_167830 ) ) ( not ( = ?auto_167829 ?auto_167830 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_167822 ?auto_167830 )
      ( MAKE-4PILE ?auto_167822 ?auto_167823 ?auto_167824 ?auto_167825 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_167831 - BLOCK
      ?auto_167832 - BLOCK
      ?auto_167833 - BLOCK
      ?auto_167834 - BLOCK
    )
    :vars
    (
      ?auto_167838 - BLOCK
      ?auto_167836 - BLOCK
      ?auto_167835 - BLOCK
      ?auto_167839 - BLOCK
      ?auto_167837 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167831 ?auto_167832 ) ) ( not ( = ?auto_167831 ?auto_167833 ) ) ( not ( = ?auto_167831 ?auto_167834 ) ) ( not ( = ?auto_167832 ?auto_167833 ) ) ( not ( = ?auto_167832 ?auto_167834 ) ) ( not ( = ?auto_167833 ?auto_167834 ) ) ( ON ?auto_167834 ?auto_167838 ) ( not ( = ?auto_167831 ?auto_167838 ) ) ( not ( = ?auto_167832 ?auto_167838 ) ) ( not ( = ?auto_167833 ?auto_167838 ) ) ( not ( = ?auto_167834 ?auto_167838 ) ) ( ON ?auto_167833 ?auto_167834 ) ( ON-TABLE ?auto_167836 ) ( ON ?auto_167835 ?auto_167836 ) ( ON ?auto_167839 ?auto_167835 ) ( ON ?auto_167838 ?auto_167839 ) ( not ( = ?auto_167836 ?auto_167835 ) ) ( not ( = ?auto_167836 ?auto_167839 ) ) ( not ( = ?auto_167836 ?auto_167838 ) ) ( not ( = ?auto_167836 ?auto_167834 ) ) ( not ( = ?auto_167836 ?auto_167833 ) ) ( not ( = ?auto_167835 ?auto_167839 ) ) ( not ( = ?auto_167835 ?auto_167838 ) ) ( not ( = ?auto_167835 ?auto_167834 ) ) ( not ( = ?auto_167835 ?auto_167833 ) ) ( not ( = ?auto_167839 ?auto_167838 ) ) ( not ( = ?auto_167839 ?auto_167834 ) ) ( not ( = ?auto_167839 ?auto_167833 ) ) ( not ( = ?auto_167831 ?auto_167836 ) ) ( not ( = ?auto_167831 ?auto_167835 ) ) ( not ( = ?auto_167831 ?auto_167839 ) ) ( not ( = ?auto_167832 ?auto_167836 ) ) ( not ( = ?auto_167832 ?auto_167835 ) ) ( not ( = ?auto_167832 ?auto_167839 ) ) ( ON ?auto_167831 ?auto_167837 ) ( CLEAR ?auto_167831 ) ( not ( = ?auto_167831 ?auto_167837 ) ) ( not ( = ?auto_167832 ?auto_167837 ) ) ( not ( = ?auto_167833 ?auto_167837 ) ) ( not ( = ?auto_167834 ?auto_167837 ) ) ( not ( = ?auto_167838 ?auto_167837 ) ) ( not ( = ?auto_167836 ?auto_167837 ) ) ( not ( = ?auto_167835 ?auto_167837 ) ) ( not ( = ?auto_167839 ?auto_167837 ) ) ( HOLDING ?auto_167832 ) ( CLEAR ?auto_167833 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_167836 ?auto_167835 ?auto_167839 ?auto_167838 ?auto_167834 ?auto_167833 ?auto_167832 )
      ( MAKE-4PILE ?auto_167831 ?auto_167832 ?auto_167833 ?auto_167834 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_167840 - BLOCK
      ?auto_167841 - BLOCK
      ?auto_167842 - BLOCK
      ?auto_167843 - BLOCK
    )
    :vars
    (
      ?auto_167847 - BLOCK
      ?auto_167846 - BLOCK
      ?auto_167844 - BLOCK
      ?auto_167845 - BLOCK
      ?auto_167848 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167840 ?auto_167841 ) ) ( not ( = ?auto_167840 ?auto_167842 ) ) ( not ( = ?auto_167840 ?auto_167843 ) ) ( not ( = ?auto_167841 ?auto_167842 ) ) ( not ( = ?auto_167841 ?auto_167843 ) ) ( not ( = ?auto_167842 ?auto_167843 ) ) ( ON ?auto_167843 ?auto_167847 ) ( not ( = ?auto_167840 ?auto_167847 ) ) ( not ( = ?auto_167841 ?auto_167847 ) ) ( not ( = ?auto_167842 ?auto_167847 ) ) ( not ( = ?auto_167843 ?auto_167847 ) ) ( ON ?auto_167842 ?auto_167843 ) ( ON-TABLE ?auto_167846 ) ( ON ?auto_167844 ?auto_167846 ) ( ON ?auto_167845 ?auto_167844 ) ( ON ?auto_167847 ?auto_167845 ) ( not ( = ?auto_167846 ?auto_167844 ) ) ( not ( = ?auto_167846 ?auto_167845 ) ) ( not ( = ?auto_167846 ?auto_167847 ) ) ( not ( = ?auto_167846 ?auto_167843 ) ) ( not ( = ?auto_167846 ?auto_167842 ) ) ( not ( = ?auto_167844 ?auto_167845 ) ) ( not ( = ?auto_167844 ?auto_167847 ) ) ( not ( = ?auto_167844 ?auto_167843 ) ) ( not ( = ?auto_167844 ?auto_167842 ) ) ( not ( = ?auto_167845 ?auto_167847 ) ) ( not ( = ?auto_167845 ?auto_167843 ) ) ( not ( = ?auto_167845 ?auto_167842 ) ) ( not ( = ?auto_167840 ?auto_167846 ) ) ( not ( = ?auto_167840 ?auto_167844 ) ) ( not ( = ?auto_167840 ?auto_167845 ) ) ( not ( = ?auto_167841 ?auto_167846 ) ) ( not ( = ?auto_167841 ?auto_167844 ) ) ( not ( = ?auto_167841 ?auto_167845 ) ) ( ON ?auto_167840 ?auto_167848 ) ( not ( = ?auto_167840 ?auto_167848 ) ) ( not ( = ?auto_167841 ?auto_167848 ) ) ( not ( = ?auto_167842 ?auto_167848 ) ) ( not ( = ?auto_167843 ?auto_167848 ) ) ( not ( = ?auto_167847 ?auto_167848 ) ) ( not ( = ?auto_167846 ?auto_167848 ) ) ( not ( = ?auto_167844 ?auto_167848 ) ) ( not ( = ?auto_167845 ?auto_167848 ) ) ( CLEAR ?auto_167842 ) ( ON ?auto_167841 ?auto_167840 ) ( CLEAR ?auto_167841 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_167848 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_167848 ?auto_167840 )
      ( MAKE-4PILE ?auto_167840 ?auto_167841 ?auto_167842 ?auto_167843 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_167849 - BLOCK
      ?auto_167850 - BLOCK
      ?auto_167851 - BLOCK
      ?auto_167852 - BLOCK
    )
    :vars
    (
      ?auto_167855 - BLOCK
      ?auto_167854 - BLOCK
      ?auto_167857 - BLOCK
      ?auto_167856 - BLOCK
      ?auto_167853 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167849 ?auto_167850 ) ) ( not ( = ?auto_167849 ?auto_167851 ) ) ( not ( = ?auto_167849 ?auto_167852 ) ) ( not ( = ?auto_167850 ?auto_167851 ) ) ( not ( = ?auto_167850 ?auto_167852 ) ) ( not ( = ?auto_167851 ?auto_167852 ) ) ( ON ?auto_167852 ?auto_167855 ) ( not ( = ?auto_167849 ?auto_167855 ) ) ( not ( = ?auto_167850 ?auto_167855 ) ) ( not ( = ?auto_167851 ?auto_167855 ) ) ( not ( = ?auto_167852 ?auto_167855 ) ) ( ON-TABLE ?auto_167854 ) ( ON ?auto_167857 ?auto_167854 ) ( ON ?auto_167856 ?auto_167857 ) ( ON ?auto_167855 ?auto_167856 ) ( not ( = ?auto_167854 ?auto_167857 ) ) ( not ( = ?auto_167854 ?auto_167856 ) ) ( not ( = ?auto_167854 ?auto_167855 ) ) ( not ( = ?auto_167854 ?auto_167852 ) ) ( not ( = ?auto_167854 ?auto_167851 ) ) ( not ( = ?auto_167857 ?auto_167856 ) ) ( not ( = ?auto_167857 ?auto_167855 ) ) ( not ( = ?auto_167857 ?auto_167852 ) ) ( not ( = ?auto_167857 ?auto_167851 ) ) ( not ( = ?auto_167856 ?auto_167855 ) ) ( not ( = ?auto_167856 ?auto_167852 ) ) ( not ( = ?auto_167856 ?auto_167851 ) ) ( not ( = ?auto_167849 ?auto_167854 ) ) ( not ( = ?auto_167849 ?auto_167857 ) ) ( not ( = ?auto_167849 ?auto_167856 ) ) ( not ( = ?auto_167850 ?auto_167854 ) ) ( not ( = ?auto_167850 ?auto_167857 ) ) ( not ( = ?auto_167850 ?auto_167856 ) ) ( ON ?auto_167849 ?auto_167853 ) ( not ( = ?auto_167849 ?auto_167853 ) ) ( not ( = ?auto_167850 ?auto_167853 ) ) ( not ( = ?auto_167851 ?auto_167853 ) ) ( not ( = ?auto_167852 ?auto_167853 ) ) ( not ( = ?auto_167855 ?auto_167853 ) ) ( not ( = ?auto_167854 ?auto_167853 ) ) ( not ( = ?auto_167857 ?auto_167853 ) ) ( not ( = ?auto_167856 ?auto_167853 ) ) ( ON ?auto_167850 ?auto_167849 ) ( CLEAR ?auto_167850 ) ( ON-TABLE ?auto_167853 ) ( HOLDING ?auto_167851 ) ( CLEAR ?auto_167852 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_167854 ?auto_167857 ?auto_167856 ?auto_167855 ?auto_167852 ?auto_167851 )
      ( MAKE-4PILE ?auto_167849 ?auto_167850 ?auto_167851 ?auto_167852 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_167858 - BLOCK
      ?auto_167859 - BLOCK
      ?auto_167860 - BLOCK
      ?auto_167861 - BLOCK
    )
    :vars
    (
      ?auto_167866 - BLOCK
      ?auto_167865 - BLOCK
      ?auto_167862 - BLOCK
      ?auto_167864 - BLOCK
      ?auto_167863 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167858 ?auto_167859 ) ) ( not ( = ?auto_167858 ?auto_167860 ) ) ( not ( = ?auto_167858 ?auto_167861 ) ) ( not ( = ?auto_167859 ?auto_167860 ) ) ( not ( = ?auto_167859 ?auto_167861 ) ) ( not ( = ?auto_167860 ?auto_167861 ) ) ( ON ?auto_167861 ?auto_167866 ) ( not ( = ?auto_167858 ?auto_167866 ) ) ( not ( = ?auto_167859 ?auto_167866 ) ) ( not ( = ?auto_167860 ?auto_167866 ) ) ( not ( = ?auto_167861 ?auto_167866 ) ) ( ON-TABLE ?auto_167865 ) ( ON ?auto_167862 ?auto_167865 ) ( ON ?auto_167864 ?auto_167862 ) ( ON ?auto_167866 ?auto_167864 ) ( not ( = ?auto_167865 ?auto_167862 ) ) ( not ( = ?auto_167865 ?auto_167864 ) ) ( not ( = ?auto_167865 ?auto_167866 ) ) ( not ( = ?auto_167865 ?auto_167861 ) ) ( not ( = ?auto_167865 ?auto_167860 ) ) ( not ( = ?auto_167862 ?auto_167864 ) ) ( not ( = ?auto_167862 ?auto_167866 ) ) ( not ( = ?auto_167862 ?auto_167861 ) ) ( not ( = ?auto_167862 ?auto_167860 ) ) ( not ( = ?auto_167864 ?auto_167866 ) ) ( not ( = ?auto_167864 ?auto_167861 ) ) ( not ( = ?auto_167864 ?auto_167860 ) ) ( not ( = ?auto_167858 ?auto_167865 ) ) ( not ( = ?auto_167858 ?auto_167862 ) ) ( not ( = ?auto_167858 ?auto_167864 ) ) ( not ( = ?auto_167859 ?auto_167865 ) ) ( not ( = ?auto_167859 ?auto_167862 ) ) ( not ( = ?auto_167859 ?auto_167864 ) ) ( ON ?auto_167858 ?auto_167863 ) ( not ( = ?auto_167858 ?auto_167863 ) ) ( not ( = ?auto_167859 ?auto_167863 ) ) ( not ( = ?auto_167860 ?auto_167863 ) ) ( not ( = ?auto_167861 ?auto_167863 ) ) ( not ( = ?auto_167866 ?auto_167863 ) ) ( not ( = ?auto_167865 ?auto_167863 ) ) ( not ( = ?auto_167862 ?auto_167863 ) ) ( not ( = ?auto_167864 ?auto_167863 ) ) ( ON ?auto_167859 ?auto_167858 ) ( ON-TABLE ?auto_167863 ) ( CLEAR ?auto_167861 ) ( ON ?auto_167860 ?auto_167859 ) ( CLEAR ?auto_167860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_167863 ?auto_167858 ?auto_167859 )
      ( MAKE-4PILE ?auto_167858 ?auto_167859 ?auto_167860 ?auto_167861 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_167867 - BLOCK
      ?auto_167868 - BLOCK
      ?auto_167869 - BLOCK
      ?auto_167870 - BLOCK
    )
    :vars
    (
      ?auto_167874 - BLOCK
      ?auto_167872 - BLOCK
      ?auto_167873 - BLOCK
      ?auto_167875 - BLOCK
      ?auto_167871 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167867 ?auto_167868 ) ) ( not ( = ?auto_167867 ?auto_167869 ) ) ( not ( = ?auto_167867 ?auto_167870 ) ) ( not ( = ?auto_167868 ?auto_167869 ) ) ( not ( = ?auto_167868 ?auto_167870 ) ) ( not ( = ?auto_167869 ?auto_167870 ) ) ( not ( = ?auto_167867 ?auto_167874 ) ) ( not ( = ?auto_167868 ?auto_167874 ) ) ( not ( = ?auto_167869 ?auto_167874 ) ) ( not ( = ?auto_167870 ?auto_167874 ) ) ( ON-TABLE ?auto_167872 ) ( ON ?auto_167873 ?auto_167872 ) ( ON ?auto_167875 ?auto_167873 ) ( ON ?auto_167874 ?auto_167875 ) ( not ( = ?auto_167872 ?auto_167873 ) ) ( not ( = ?auto_167872 ?auto_167875 ) ) ( not ( = ?auto_167872 ?auto_167874 ) ) ( not ( = ?auto_167872 ?auto_167870 ) ) ( not ( = ?auto_167872 ?auto_167869 ) ) ( not ( = ?auto_167873 ?auto_167875 ) ) ( not ( = ?auto_167873 ?auto_167874 ) ) ( not ( = ?auto_167873 ?auto_167870 ) ) ( not ( = ?auto_167873 ?auto_167869 ) ) ( not ( = ?auto_167875 ?auto_167874 ) ) ( not ( = ?auto_167875 ?auto_167870 ) ) ( not ( = ?auto_167875 ?auto_167869 ) ) ( not ( = ?auto_167867 ?auto_167872 ) ) ( not ( = ?auto_167867 ?auto_167873 ) ) ( not ( = ?auto_167867 ?auto_167875 ) ) ( not ( = ?auto_167868 ?auto_167872 ) ) ( not ( = ?auto_167868 ?auto_167873 ) ) ( not ( = ?auto_167868 ?auto_167875 ) ) ( ON ?auto_167867 ?auto_167871 ) ( not ( = ?auto_167867 ?auto_167871 ) ) ( not ( = ?auto_167868 ?auto_167871 ) ) ( not ( = ?auto_167869 ?auto_167871 ) ) ( not ( = ?auto_167870 ?auto_167871 ) ) ( not ( = ?auto_167874 ?auto_167871 ) ) ( not ( = ?auto_167872 ?auto_167871 ) ) ( not ( = ?auto_167873 ?auto_167871 ) ) ( not ( = ?auto_167875 ?auto_167871 ) ) ( ON ?auto_167868 ?auto_167867 ) ( ON-TABLE ?auto_167871 ) ( ON ?auto_167869 ?auto_167868 ) ( CLEAR ?auto_167869 ) ( HOLDING ?auto_167870 ) ( CLEAR ?auto_167874 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_167872 ?auto_167873 ?auto_167875 ?auto_167874 ?auto_167870 )
      ( MAKE-4PILE ?auto_167867 ?auto_167868 ?auto_167869 ?auto_167870 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_167876 - BLOCK
      ?auto_167877 - BLOCK
      ?auto_167878 - BLOCK
      ?auto_167879 - BLOCK
    )
    :vars
    (
      ?auto_167883 - BLOCK
      ?auto_167884 - BLOCK
      ?auto_167882 - BLOCK
      ?auto_167881 - BLOCK
      ?auto_167880 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167876 ?auto_167877 ) ) ( not ( = ?auto_167876 ?auto_167878 ) ) ( not ( = ?auto_167876 ?auto_167879 ) ) ( not ( = ?auto_167877 ?auto_167878 ) ) ( not ( = ?auto_167877 ?auto_167879 ) ) ( not ( = ?auto_167878 ?auto_167879 ) ) ( not ( = ?auto_167876 ?auto_167883 ) ) ( not ( = ?auto_167877 ?auto_167883 ) ) ( not ( = ?auto_167878 ?auto_167883 ) ) ( not ( = ?auto_167879 ?auto_167883 ) ) ( ON-TABLE ?auto_167884 ) ( ON ?auto_167882 ?auto_167884 ) ( ON ?auto_167881 ?auto_167882 ) ( ON ?auto_167883 ?auto_167881 ) ( not ( = ?auto_167884 ?auto_167882 ) ) ( not ( = ?auto_167884 ?auto_167881 ) ) ( not ( = ?auto_167884 ?auto_167883 ) ) ( not ( = ?auto_167884 ?auto_167879 ) ) ( not ( = ?auto_167884 ?auto_167878 ) ) ( not ( = ?auto_167882 ?auto_167881 ) ) ( not ( = ?auto_167882 ?auto_167883 ) ) ( not ( = ?auto_167882 ?auto_167879 ) ) ( not ( = ?auto_167882 ?auto_167878 ) ) ( not ( = ?auto_167881 ?auto_167883 ) ) ( not ( = ?auto_167881 ?auto_167879 ) ) ( not ( = ?auto_167881 ?auto_167878 ) ) ( not ( = ?auto_167876 ?auto_167884 ) ) ( not ( = ?auto_167876 ?auto_167882 ) ) ( not ( = ?auto_167876 ?auto_167881 ) ) ( not ( = ?auto_167877 ?auto_167884 ) ) ( not ( = ?auto_167877 ?auto_167882 ) ) ( not ( = ?auto_167877 ?auto_167881 ) ) ( ON ?auto_167876 ?auto_167880 ) ( not ( = ?auto_167876 ?auto_167880 ) ) ( not ( = ?auto_167877 ?auto_167880 ) ) ( not ( = ?auto_167878 ?auto_167880 ) ) ( not ( = ?auto_167879 ?auto_167880 ) ) ( not ( = ?auto_167883 ?auto_167880 ) ) ( not ( = ?auto_167884 ?auto_167880 ) ) ( not ( = ?auto_167882 ?auto_167880 ) ) ( not ( = ?auto_167881 ?auto_167880 ) ) ( ON ?auto_167877 ?auto_167876 ) ( ON-TABLE ?auto_167880 ) ( ON ?auto_167878 ?auto_167877 ) ( CLEAR ?auto_167883 ) ( ON ?auto_167879 ?auto_167878 ) ( CLEAR ?auto_167879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_167880 ?auto_167876 ?auto_167877 ?auto_167878 )
      ( MAKE-4PILE ?auto_167876 ?auto_167877 ?auto_167878 ?auto_167879 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_167885 - BLOCK
      ?auto_167886 - BLOCK
      ?auto_167887 - BLOCK
      ?auto_167888 - BLOCK
    )
    :vars
    (
      ?auto_167889 - BLOCK
      ?auto_167893 - BLOCK
      ?auto_167891 - BLOCK
      ?auto_167890 - BLOCK
      ?auto_167892 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167885 ?auto_167886 ) ) ( not ( = ?auto_167885 ?auto_167887 ) ) ( not ( = ?auto_167885 ?auto_167888 ) ) ( not ( = ?auto_167886 ?auto_167887 ) ) ( not ( = ?auto_167886 ?auto_167888 ) ) ( not ( = ?auto_167887 ?auto_167888 ) ) ( not ( = ?auto_167885 ?auto_167889 ) ) ( not ( = ?auto_167886 ?auto_167889 ) ) ( not ( = ?auto_167887 ?auto_167889 ) ) ( not ( = ?auto_167888 ?auto_167889 ) ) ( ON-TABLE ?auto_167893 ) ( ON ?auto_167891 ?auto_167893 ) ( ON ?auto_167890 ?auto_167891 ) ( not ( = ?auto_167893 ?auto_167891 ) ) ( not ( = ?auto_167893 ?auto_167890 ) ) ( not ( = ?auto_167893 ?auto_167889 ) ) ( not ( = ?auto_167893 ?auto_167888 ) ) ( not ( = ?auto_167893 ?auto_167887 ) ) ( not ( = ?auto_167891 ?auto_167890 ) ) ( not ( = ?auto_167891 ?auto_167889 ) ) ( not ( = ?auto_167891 ?auto_167888 ) ) ( not ( = ?auto_167891 ?auto_167887 ) ) ( not ( = ?auto_167890 ?auto_167889 ) ) ( not ( = ?auto_167890 ?auto_167888 ) ) ( not ( = ?auto_167890 ?auto_167887 ) ) ( not ( = ?auto_167885 ?auto_167893 ) ) ( not ( = ?auto_167885 ?auto_167891 ) ) ( not ( = ?auto_167885 ?auto_167890 ) ) ( not ( = ?auto_167886 ?auto_167893 ) ) ( not ( = ?auto_167886 ?auto_167891 ) ) ( not ( = ?auto_167886 ?auto_167890 ) ) ( ON ?auto_167885 ?auto_167892 ) ( not ( = ?auto_167885 ?auto_167892 ) ) ( not ( = ?auto_167886 ?auto_167892 ) ) ( not ( = ?auto_167887 ?auto_167892 ) ) ( not ( = ?auto_167888 ?auto_167892 ) ) ( not ( = ?auto_167889 ?auto_167892 ) ) ( not ( = ?auto_167893 ?auto_167892 ) ) ( not ( = ?auto_167891 ?auto_167892 ) ) ( not ( = ?auto_167890 ?auto_167892 ) ) ( ON ?auto_167886 ?auto_167885 ) ( ON-TABLE ?auto_167892 ) ( ON ?auto_167887 ?auto_167886 ) ( ON ?auto_167888 ?auto_167887 ) ( CLEAR ?auto_167888 ) ( HOLDING ?auto_167889 ) ( CLEAR ?auto_167890 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_167893 ?auto_167891 ?auto_167890 ?auto_167889 )
      ( MAKE-4PILE ?auto_167885 ?auto_167886 ?auto_167887 ?auto_167888 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_167894 - BLOCK
      ?auto_167895 - BLOCK
      ?auto_167896 - BLOCK
      ?auto_167897 - BLOCK
    )
    :vars
    (
      ?auto_167900 - BLOCK
      ?auto_167902 - BLOCK
      ?auto_167898 - BLOCK
      ?auto_167901 - BLOCK
      ?auto_167899 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167894 ?auto_167895 ) ) ( not ( = ?auto_167894 ?auto_167896 ) ) ( not ( = ?auto_167894 ?auto_167897 ) ) ( not ( = ?auto_167895 ?auto_167896 ) ) ( not ( = ?auto_167895 ?auto_167897 ) ) ( not ( = ?auto_167896 ?auto_167897 ) ) ( not ( = ?auto_167894 ?auto_167900 ) ) ( not ( = ?auto_167895 ?auto_167900 ) ) ( not ( = ?auto_167896 ?auto_167900 ) ) ( not ( = ?auto_167897 ?auto_167900 ) ) ( ON-TABLE ?auto_167902 ) ( ON ?auto_167898 ?auto_167902 ) ( ON ?auto_167901 ?auto_167898 ) ( not ( = ?auto_167902 ?auto_167898 ) ) ( not ( = ?auto_167902 ?auto_167901 ) ) ( not ( = ?auto_167902 ?auto_167900 ) ) ( not ( = ?auto_167902 ?auto_167897 ) ) ( not ( = ?auto_167902 ?auto_167896 ) ) ( not ( = ?auto_167898 ?auto_167901 ) ) ( not ( = ?auto_167898 ?auto_167900 ) ) ( not ( = ?auto_167898 ?auto_167897 ) ) ( not ( = ?auto_167898 ?auto_167896 ) ) ( not ( = ?auto_167901 ?auto_167900 ) ) ( not ( = ?auto_167901 ?auto_167897 ) ) ( not ( = ?auto_167901 ?auto_167896 ) ) ( not ( = ?auto_167894 ?auto_167902 ) ) ( not ( = ?auto_167894 ?auto_167898 ) ) ( not ( = ?auto_167894 ?auto_167901 ) ) ( not ( = ?auto_167895 ?auto_167902 ) ) ( not ( = ?auto_167895 ?auto_167898 ) ) ( not ( = ?auto_167895 ?auto_167901 ) ) ( ON ?auto_167894 ?auto_167899 ) ( not ( = ?auto_167894 ?auto_167899 ) ) ( not ( = ?auto_167895 ?auto_167899 ) ) ( not ( = ?auto_167896 ?auto_167899 ) ) ( not ( = ?auto_167897 ?auto_167899 ) ) ( not ( = ?auto_167900 ?auto_167899 ) ) ( not ( = ?auto_167902 ?auto_167899 ) ) ( not ( = ?auto_167898 ?auto_167899 ) ) ( not ( = ?auto_167901 ?auto_167899 ) ) ( ON ?auto_167895 ?auto_167894 ) ( ON-TABLE ?auto_167899 ) ( ON ?auto_167896 ?auto_167895 ) ( ON ?auto_167897 ?auto_167896 ) ( CLEAR ?auto_167901 ) ( ON ?auto_167900 ?auto_167897 ) ( CLEAR ?auto_167900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_167899 ?auto_167894 ?auto_167895 ?auto_167896 ?auto_167897 )
      ( MAKE-4PILE ?auto_167894 ?auto_167895 ?auto_167896 ?auto_167897 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_167903 - BLOCK
      ?auto_167904 - BLOCK
      ?auto_167905 - BLOCK
      ?auto_167906 - BLOCK
    )
    :vars
    (
      ?auto_167907 - BLOCK
      ?auto_167911 - BLOCK
      ?auto_167909 - BLOCK
      ?auto_167910 - BLOCK
      ?auto_167908 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167903 ?auto_167904 ) ) ( not ( = ?auto_167903 ?auto_167905 ) ) ( not ( = ?auto_167903 ?auto_167906 ) ) ( not ( = ?auto_167904 ?auto_167905 ) ) ( not ( = ?auto_167904 ?auto_167906 ) ) ( not ( = ?auto_167905 ?auto_167906 ) ) ( not ( = ?auto_167903 ?auto_167907 ) ) ( not ( = ?auto_167904 ?auto_167907 ) ) ( not ( = ?auto_167905 ?auto_167907 ) ) ( not ( = ?auto_167906 ?auto_167907 ) ) ( ON-TABLE ?auto_167911 ) ( ON ?auto_167909 ?auto_167911 ) ( not ( = ?auto_167911 ?auto_167909 ) ) ( not ( = ?auto_167911 ?auto_167910 ) ) ( not ( = ?auto_167911 ?auto_167907 ) ) ( not ( = ?auto_167911 ?auto_167906 ) ) ( not ( = ?auto_167911 ?auto_167905 ) ) ( not ( = ?auto_167909 ?auto_167910 ) ) ( not ( = ?auto_167909 ?auto_167907 ) ) ( not ( = ?auto_167909 ?auto_167906 ) ) ( not ( = ?auto_167909 ?auto_167905 ) ) ( not ( = ?auto_167910 ?auto_167907 ) ) ( not ( = ?auto_167910 ?auto_167906 ) ) ( not ( = ?auto_167910 ?auto_167905 ) ) ( not ( = ?auto_167903 ?auto_167911 ) ) ( not ( = ?auto_167903 ?auto_167909 ) ) ( not ( = ?auto_167903 ?auto_167910 ) ) ( not ( = ?auto_167904 ?auto_167911 ) ) ( not ( = ?auto_167904 ?auto_167909 ) ) ( not ( = ?auto_167904 ?auto_167910 ) ) ( ON ?auto_167903 ?auto_167908 ) ( not ( = ?auto_167903 ?auto_167908 ) ) ( not ( = ?auto_167904 ?auto_167908 ) ) ( not ( = ?auto_167905 ?auto_167908 ) ) ( not ( = ?auto_167906 ?auto_167908 ) ) ( not ( = ?auto_167907 ?auto_167908 ) ) ( not ( = ?auto_167911 ?auto_167908 ) ) ( not ( = ?auto_167909 ?auto_167908 ) ) ( not ( = ?auto_167910 ?auto_167908 ) ) ( ON ?auto_167904 ?auto_167903 ) ( ON-TABLE ?auto_167908 ) ( ON ?auto_167905 ?auto_167904 ) ( ON ?auto_167906 ?auto_167905 ) ( ON ?auto_167907 ?auto_167906 ) ( CLEAR ?auto_167907 ) ( HOLDING ?auto_167910 ) ( CLEAR ?auto_167909 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_167911 ?auto_167909 ?auto_167910 )
      ( MAKE-4PILE ?auto_167903 ?auto_167904 ?auto_167905 ?auto_167906 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_167912 - BLOCK
      ?auto_167913 - BLOCK
      ?auto_167914 - BLOCK
      ?auto_167915 - BLOCK
    )
    :vars
    (
      ?auto_167916 - BLOCK
      ?auto_167917 - BLOCK
      ?auto_167920 - BLOCK
      ?auto_167918 - BLOCK
      ?auto_167919 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167912 ?auto_167913 ) ) ( not ( = ?auto_167912 ?auto_167914 ) ) ( not ( = ?auto_167912 ?auto_167915 ) ) ( not ( = ?auto_167913 ?auto_167914 ) ) ( not ( = ?auto_167913 ?auto_167915 ) ) ( not ( = ?auto_167914 ?auto_167915 ) ) ( not ( = ?auto_167912 ?auto_167916 ) ) ( not ( = ?auto_167913 ?auto_167916 ) ) ( not ( = ?auto_167914 ?auto_167916 ) ) ( not ( = ?auto_167915 ?auto_167916 ) ) ( ON-TABLE ?auto_167917 ) ( ON ?auto_167920 ?auto_167917 ) ( not ( = ?auto_167917 ?auto_167920 ) ) ( not ( = ?auto_167917 ?auto_167918 ) ) ( not ( = ?auto_167917 ?auto_167916 ) ) ( not ( = ?auto_167917 ?auto_167915 ) ) ( not ( = ?auto_167917 ?auto_167914 ) ) ( not ( = ?auto_167920 ?auto_167918 ) ) ( not ( = ?auto_167920 ?auto_167916 ) ) ( not ( = ?auto_167920 ?auto_167915 ) ) ( not ( = ?auto_167920 ?auto_167914 ) ) ( not ( = ?auto_167918 ?auto_167916 ) ) ( not ( = ?auto_167918 ?auto_167915 ) ) ( not ( = ?auto_167918 ?auto_167914 ) ) ( not ( = ?auto_167912 ?auto_167917 ) ) ( not ( = ?auto_167912 ?auto_167920 ) ) ( not ( = ?auto_167912 ?auto_167918 ) ) ( not ( = ?auto_167913 ?auto_167917 ) ) ( not ( = ?auto_167913 ?auto_167920 ) ) ( not ( = ?auto_167913 ?auto_167918 ) ) ( ON ?auto_167912 ?auto_167919 ) ( not ( = ?auto_167912 ?auto_167919 ) ) ( not ( = ?auto_167913 ?auto_167919 ) ) ( not ( = ?auto_167914 ?auto_167919 ) ) ( not ( = ?auto_167915 ?auto_167919 ) ) ( not ( = ?auto_167916 ?auto_167919 ) ) ( not ( = ?auto_167917 ?auto_167919 ) ) ( not ( = ?auto_167920 ?auto_167919 ) ) ( not ( = ?auto_167918 ?auto_167919 ) ) ( ON ?auto_167913 ?auto_167912 ) ( ON-TABLE ?auto_167919 ) ( ON ?auto_167914 ?auto_167913 ) ( ON ?auto_167915 ?auto_167914 ) ( ON ?auto_167916 ?auto_167915 ) ( CLEAR ?auto_167920 ) ( ON ?auto_167918 ?auto_167916 ) ( CLEAR ?auto_167918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_167919 ?auto_167912 ?auto_167913 ?auto_167914 ?auto_167915 ?auto_167916 )
      ( MAKE-4PILE ?auto_167912 ?auto_167913 ?auto_167914 ?auto_167915 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_167921 - BLOCK
      ?auto_167922 - BLOCK
      ?auto_167923 - BLOCK
      ?auto_167924 - BLOCK
    )
    :vars
    (
      ?auto_167928 - BLOCK
      ?auto_167926 - BLOCK
      ?auto_167929 - BLOCK
      ?auto_167925 - BLOCK
      ?auto_167927 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167921 ?auto_167922 ) ) ( not ( = ?auto_167921 ?auto_167923 ) ) ( not ( = ?auto_167921 ?auto_167924 ) ) ( not ( = ?auto_167922 ?auto_167923 ) ) ( not ( = ?auto_167922 ?auto_167924 ) ) ( not ( = ?auto_167923 ?auto_167924 ) ) ( not ( = ?auto_167921 ?auto_167928 ) ) ( not ( = ?auto_167922 ?auto_167928 ) ) ( not ( = ?auto_167923 ?auto_167928 ) ) ( not ( = ?auto_167924 ?auto_167928 ) ) ( ON-TABLE ?auto_167926 ) ( not ( = ?auto_167926 ?auto_167929 ) ) ( not ( = ?auto_167926 ?auto_167925 ) ) ( not ( = ?auto_167926 ?auto_167928 ) ) ( not ( = ?auto_167926 ?auto_167924 ) ) ( not ( = ?auto_167926 ?auto_167923 ) ) ( not ( = ?auto_167929 ?auto_167925 ) ) ( not ( = ?auto_167929 ?auto_167928 ) ) ( not ( = ?auto_167929 ?auto_167924 ) ) ( not ( = ?auto_167929 ?auto_167923 ) ) ( not ( = ?auto_167925 ?auto_167928 ) ) ( not ( = ?auto_167925 ?auto_167924 ) ) ( not ( = ?auto_167925 ?auto_167923 ) ) ( not ( = ?auto_167921 ?auto_167926 ) ) ( not ( = ?auto_167921 ?auto_167929 ) ) ( not ( = ?auto_167921 ?auto_167925 ) ) ( not ( = ?auto_167922 ?auto_167926 ) ) ( not ( = ?auto_167922 ?auto_167929 ) ) ( not ( = ?auto_167922 ?auto_167925 ) ) ( ON ?auto_167921 ?auto_167927 ) ( not ( = ?auto_167921 ?auto_167927 ) ) ( not ( = ?auto_167922 ?auto_167927 ) ) ( not ( = ?auto_167923 ?auto_167927 ) ) ( not ( = ?auto_167924 ?auto_167927 ) ) ( not ( = ?auto_167928 ?auto_167927 ) ) ( not ( = ?auto_167926 ?auto_167927 ) ) ( not ( = ?auto_167929 ?auto_167927 ) ) ( not ( = ?auto_167925 ?auto_167927 ) ) ( ON ?auto_167922 ?auto_167921 ) ( ON-TABLE ?auto_167927 ) ( ON ?auto_167923 ?auto_167922 ) ( ON ?auto_167924 ?auto_167923 ) ( ON ?auto_167928 ?auto_167924 ) ( ON ?auto_167925 ?auto_167928 ) ( CLEAR ?auto_167925 ) ( HOLDING ?auto_167929 ) ( CLEAR ?auto_167926 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_167926 ?auto_167929 )
      ( MAKE-4PILE ?auto_167921 ?auto_167922 ?auto_167923 ?auto_167924 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_167930 - BLOCK
      ?auto_167931 - BLOCK
      ?auto_167932 - BLOCK
      ?auto_167933 - BLOCK
    )
    :vars
    (
      ?auto_167936 - BLOCK
      ?auto_167934 - BLOCK
      ?auto_167937 - BLOCK
      ?auto_167935 - BLOCK
      ?auto_167938 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167930 ?auto_167931 ) ) ( not ( = ?auto_167930 ?auto_167932 ) ) ( not ( = ?auto_167930 ?auto_167933 ) ) ( not ( = ?auto_167931 ?auto_167932 ) ) ( not ( = ?auto_167931 ?auto_167933 ) ) ( not ( = ?auto_167932 ?auto_167933 ) ) ( not ( = ?auto_167930 ?auto_167936 ) ) ( not ( = ?auto_167931 ?auto_167936 ) ) ( not ( = ?auto_167932 ?auto_167936 ) ) ( not ( = ?auto_167933 ?auto_167936 ) ) ( ON-TABLE ?auto_167934 ) ( not ( = ?auto_167934 ?auto_167937 ) ) ( not ( = ?auto_167934 ?auto_167935 ) ) ( not ( = ?auto_167934 ?auto_167936 ) ) ( not ( = ?auto_167934 ?auto_167933 ) ) ( not ( = ?auto_167934 ?auto_167932 ) ) ( not ( = ?auto_167937 ?auto_167935 ) ) ( not ( = ?auto_167937 ?auto_167936 ) ) ( not ( = ?auto_167937 ?auto_167933 ) ) ( not ( = ?auto_167937 ?auto_167932 ) ) ( not ( = ?auto_167935 ?auto_167936 ) ) ( not ( = ?auto_167935 ?auto_167933 ) ) ( not ( = ?auto_167935 ?auto_167932 ) ) ( not ( = ?auto_167930 ?auto_167934 ) ) ( not ( = ?auto_167930 ?auto_167937 ) ) ( not ( = ?auto_167930 ?auto_167935 ) ) ( not ( = ?auto_167931 ?auto_167934 ) ) ( not ( = ?auto_167931 ?auto_167937 ) ) ( not ( = ?auto_167931 ?auto_167935 ) ) ( ON ?auto_167930 ?auto_167938 ) ( not ( = ?auto_167930 ?auto_167938 ) ) ( not ( = ?auto_167931 ?auto_167938 ) ) ( not ( = ?auto_167932 ?auto_167938 ) ) ( not ( = ?auto_167933 ?auto_167938 ) ) ( not ( = ?auto_167936 ?auto_167938 ) ) ( not ( = ?auto_167934 ?auto_167938 ) ) ( not ( = ?auto_167937 ?auto_167938 ) ) ( not ( = ?auto_167935 ?auto_167938 ) ) ( ON ?auto_167931 ?auto_167930 ) ( ON-TABLE ?auto_167938 ) ( ON ?auto_167932 ?auto_167931 ) ( ON ?auto_167933 ?auto_167932 ) ( ON ?auto_167936 ?auto_167933 ) ( ON ?auto_167935 ?auto_167936 ) ( CLEAR ?auto_167934 ) ( ON ?auto_167937 ?auto_167935 ) ( CLEAR ?auto_167937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_167938 ?auto_167930 ?auto_167931 ?auto_167932 ?auto_167933 ?auto_167936 ?auto_167935 )
      ( MAKE-4PILE ?auto_167930 ?auto_167931 ?auto_167932 ?auto_167933 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_167939 - BLOCK
      ?auto_167940 - BLOCK
      ?auto_167941 - BLOCK
      ?auto_167942 - BLOCK
    )
    :vars
    (
      ?auto_167945 - BLOCK
      ?auto_167947 - BLOCK
      ?auto_167946 - BLOCK
      ?auto_167943 - BLOCK
      ?auto_167944 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167939 ?auto_167940 ) ) ( not ( = ?auto_167939 ?auto_167941 ) ) ( not ( = ?auto_167939 ?auto_167942 ) ) ( not ( = ?auto_167940 ?auto_167941 ) ) ( not ( = ?auto_167940 ?auto_167942 ) ) ( not ( = ?auto_167941 ?auto_167942 ) ) ( not ( = ?auto_167939 ?auto_167945 ) ) ( not ( = ?auto_167940 ?auto_167945 ) ) ( not ( = ?auto_167941 ?auto_167945 ) ) ( not ( = ?auto_167942 ?auto_167945 ) ) ( not ( = ?auto_167947 ?auto_167946 ) ) ( not ( = ?auto_167947 ?auto_167943 ) ) ( not ( = ?auto_167947 ?auto_167945 ) ) ( not ( = ?auto_167947 ?auto_167942 ) ) ( not ( = ?auto_167947 ?auto_167941 ) ) ( not ( = ?auto_167946 ?auto_167943 ) ) ( not ( = ?auto_167946 ?auto_167945 ) ) ( not ( = ?auto_167946 ?auto_167942 ) ) ( not ( = ?auto_167946 ?auto_167941 ) ) ( not ( = ?auto_167943 ?auto_167945 ) ) ( not ( = ?auto_167943 ?auto_167942 ) ) ( not ( = ?auto_167943 ?auto_167941 ) ) ( not ( = ?auto_167939 ?auto_167947 ) ) ( not ( = ?auto_167939 ?auto_167946 ) ) ( not ( = ?auto_167939 ?auto_167943 ) ) ( not ( = ?auto_167940 ?auto_167947 ) ) ( not ( = ?auto_167940 ?auto_167946 ) ) ( not ( = ?auto_167940 ?auto_167943 ) ) ( ON ?auto_167939 ?auto_167944 ) ( not ( = ?auto_167939 ?auto_167944 ) ) ( not ( = ?auto_167940 ?auto_167944 ) ) ( not ( = ?auto_167941 ?auto_167944 ) ) ( not ( = ?auto_167942 ?auto_167944 ) ) ( not ( = ?auto_167945 ?auto_167944 ) ) ( not ( = ?auto_167947 ?auto_167944 ) ) ( not ( = ?auto_167946 ?auto_167944 ) ) ( not ( = ?auto_167943 ?auto_167944 ) ) ( ON ?auto_167940 ?auto_167939 ) ( ON-TABLE ?auto_167944 ) ( ON ?auto_167941 ?auto_167940 ) ( ON ?auto_167942 ?auto_167941 ) ( ON ?auto_167945 ?auto_167942 ) ( ON ?auto_167943 ?auto_167945 ) ( ON ?auto_167946 ?auto_167943 ) ( CLEAR ?auto_167946 ) ( HOLDING ?auto_167947 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_167947 )
      ( MAKE-4PILE ?auto_167939 ?auto_167940 ?auto_167941 ?auto_167942 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_167948 - BLOCK
      ?auto_167949 - BLOCK
      ?auto_167950 - BLOCK
      ?auto_167951 - BLOCK
    )
    :vars
    (
      ?auto_167952 - BLOCK
      ?auto_167954 - BLOCK
      ?auto_167953 - BLOCK
      ?auto_167955 - BLOCK
      ?auto_167956 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167948 ?auto_167949 ) ) ( not ( = ?auto_167948 ?auto_167950 ) ) ( not ( = ?auto_167948 ?auto_167951 ) ) ( not ( = ?auto_167949 ?auto_167950 ) ) ( not ( = ?auto_167949 ?auto_167951 ) ) ( not ( = ?auto_167950 ?auto_167951 ) ) ( not ( = ?auto_167948 ?auto_167952 ) ) ( not ( = ?auto_167949 ?auto_167952 ) ) ( not ( = ?auto_167950 ?auto_167952 ) ) ( not ( = ?auto_167951 ?auto_167952 ) ) ( not ( = ?auto_167954 ?auto_167953 ) ) ( not ( = ?auto_167954 ?auto_167955 ) ) ( not ( = ?auto_167954 ?auto_167952 ) ) ( not ( = ?auto_167954 ?auto_167951 ) ) ( not ( = ?auto_167954 ?auto_167950 ) ) ( not ( = ?auto_167953 ?auto_167955 ) ) ( not ( = ?auto_167953 ?auto_167952 ) ) ( not ( = ?auto_167953 ?auto_167951 ) ) ( not ( = ?auto_167953 ?auto_167950 ) ) ( not ( = ?auto_167955 ?auto_167952 ) ) ( not ( = ?auto_167955 ?auto_167951 ) ) ( not ( = ?auto_167955 ?auto_167950 ) ) ( not ( = ?auto_167948 ?auto_167954 ) ) ( not ( = ?auto_167948 ?auto_167953 ) ) ( not ( = ?auto_167948 ?auto_167955 ) ) ( not ( = ?auto_167949 ?auto_167954 ) ) ( not ( = ?auto_167949 ?auto_167953 ) ) ( not ( = ?auto_167949 ?auto_167955 ) ) ( ON ?auto_167948 ?auto_167956 ) ( not ( = ?auto_167948 ?auto_167956 ) ) ( not ( = ?auto_167949 ?auto_167956 ) ) ( not ( = ?auto_167950 ?auto_167956 ) ) ( not ( = ?auto_167951 ?auto_167956 ) ) ( not ( = ?auto_167952 ?auto_167956 ) ) ( not ( = ?auto_167954 ?auto_167956 ) ) ( not ( = ?auto_167953 ?auto_167956 ) ) ( not ( = ?auto_167955 ?auto_167956 ) ) ( ON ?auto_167949 ?auto_167948 ) ( ON-TABLE ?auto_167956 ) ( ON ?auto_167950 ?auto_167949 ) ( ON ?auto_167951 ?auto_167950 ) ( ON ?auto_167952 ?auto_167951 ) ( ON ?auto_167955 ?auto_167952 ) ( ON ?auto_167953 ?auto_167955 ) ( ON ?auto_167954 ?auto_167953 ) ( CLEAR ?auto_167954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_167956 ?auto_167948 ?auto_167949 ?auto_167950 ?auto_167951 ?auto_167952 ?auto_167955 ?auto_167953 )
      ( MAKE-4PILE ?auto_167948 ?auto_167949 ?auto_167950 ?auto_167951 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_167976 - BLOCK
      ?auto_167977 - BLOCK
      ?auto_167978 - BLOCK
    )
    :vars
    (
      ?auto_167979 - BLOCK
      ?auto_167980 - BLOCK
      ?auto_167981 - BLOCK
      ?auto_167983 - BLOCK
      ?auto_167982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167979 ?auto_167978 ) ( ON-TABLE ?auto_167976 ) ( ON ?auto_167977 ?auto_167976 ) ( ON ?auto_167978 ?auto_167977 ) ( not ( = ?auto_167976 ?auto_167977 ) ) ( not ( = ?auto_167976 ?auto_167978 ) ) ( not ( = ?auto_167976 ?auto_167979 ) ) ( not ( = ?auto_167977 ?auto_167978 ) ) ( not ( = ?auto_167977 ?auto_167979 ) ) ( not ( = ?auto_167978 ?auto_167979 ) ) ( not ( = ?auto_167976 ?auto_167980 ) ) ( not ( = ?auto_167976 ?auto_167981 ) ) ( not ( = ?auto_167977 ?auto_167980 ) ) ( not ( = ?auto_167977 ?auto_167981 ) ) ( not ( = ?auto_167978 ?auto_167980 ) ) ( not ( = ?auto_167978 ?auto_167981 ) ) ( not ( = ?auto_167979 ?auto_167980 ) ) ( not ( = ?auto_167979 ?auto_167981 ) ) ( not ( = ?auto_167980 ?auto_167981 ) ) ( ON ?auto_167980 ?auto_167979 ) ( CLEAR ?auto_167980 ) ( HOLDING ?auto_167981 ) ( CLEAR ?auto_167983 ) ( ON-TABLE ?auto_167982 ) ( ON ?auto_167983 ?auto_167982 ) ( not ( = ?auto_167982 ?auto_167983 ) ) ( not ( = ?auto_167982 ?auto_167981 ) ) ( not ( = ?auto_167983 ?auto_167981 ) ) ( not ( = ?auto_167976 ?auto_167983 ) ) ( not ( = ?auto_167976 ?auto_167982 ) ) ( not ( = ?auto_167977 ?auto_167983 ) ) ( not ( = ?auto_167977 ?auto_167982 ) ) ( not ( = ?auto_167978 ?auto_167983 ) ) ( not ( = ?auto_167978 ?auto_167982 ) ) ( not ( = ?auto_167979 ?auto_167983 ) ) ( not ( = ?auto_167979 ?auto_167982 ) ) ( not ( = ?auto_167980 ?auto_167983 ) ) ( not ( = ?auto_167980 ?auto_167982 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_167982 ?auto_167983 ?auto_167981 )
      ( MAKE-3PILE ?auto_167976 ?auto_167977 ?auto_167978 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_167984 - BLOCK
      ?auto_167985 - BLOCK
      ?auto_167986 - BLOCK
    )
    :vars
    (
      ?auto_167989 - BLOCK
      ?auto_167991 - BLOCK
      ?auto_167988 - BLOCK
      ?auto_167990 - BLOCK
      ?auto_167987 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167989 ?auto_167986 ) ( ON-TABLE ?auto_167984 ) ( ON ?auto_167985 ?auto_167984 ) ( ON ?auto_167986 ?auto_167985 ) ( not ( = ?auto_167984 ?auto_167985 ) ) ( not ( = ?auto_167984 ?auto_167986 ) ) ( not ( = ?auto_167984 ?auto_167989 ) ) ( not ( = ?auto_167985 ?auto_167986 ) ) ( not ( = ?auto_167985 ?auto_167989 ) ) ( not ( = ?auto_167986 ?auto_167989 ) ) ( not ( = ?auto_167984 ?auto_167991 ) ) ( not ( = ?auto_167984 ?auto_167988 ) ) ( not ( = ?auto_167985 ?auto_167991 ) ) ( not ( = ?auto_167985 ?auto_167988 ) ) ( not ( = ?auto_167986 ?auto_167991 ) ) ( not ( = ?auto_167986 ?auto_167988 ) ) ( not ( = ?auto_167989 ?auto_167991 ) ) ( not ( = ?auto_167989 ?auto_167988 ) ) ( not ( = ?auto_167991 ?auto_167988 ) ) ( ON ?auto_167991 ?auto_167989 ) ( CLEAR ?auto_167990 ) ( ON-TABLE ?auto_167987 ) ( ON ?auto_167990 ?auto_167987 ) ( not ( = ?auto_167987 ?auto_167990 ) ) ( not ( = ?auto_167987 ?auto_167988 ) ) ( not ( = ?auto_167990 ?auto_167988 ) ) ( not ( = ?auto_167984 ?auto_167990 ) ) ( not ( = ?auto_167984 ?auto_167987 ) ) ( not ( = ?auto_167985 ?auto_167990 ) ) ( not ( = ?auto_167985 ?auto_167987 ) ) ( not ( = ?auto_167986 ?auto_167990 ) ) ( not ( = ?auto_167986 ?auto_167987 ) ) ( not ( = ?auto_167989 ?auto_167990 ) ) ( not ( = ?auto_167989 ?auto_167987 ) ) ( not ( = ?auto_167991 ?auto_167990 ) ) ( not ( = ?auto_167991 ?auto_167987 ) ) ( ON ?auto_167988 ?auto_167991 ) ( CLEAR ?auto_167988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_167984 ?auto_167985 ?auto_167986 ?auto_167989 ?auto_167991 )
      ( MAKE-3PILE ?auto_167984 ?auto_167985 ?auto_167986 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_167992 - BLOCK
      ?auto_167993 - BLOCK
      ?auto_167994 - BLOCK
    )
    :vars
    (
      ?auto_167998 - BLOCK
      ?auto_167996 - BLOCK
      ?auto_167999 - BLOCK
      ?auto_167995 - BLOCK
      ?auto_167997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167998 ?auto_167994 ) ( ON-TABLE ?auto_167992 ) ( ON ?auto_167993 ?auto_167992 ) ( ON ?auto_167994 ?auto_167993 ) ( not ( = ?auto_167992 ?auto_167993 ) ) ( not ( = ?auto_167992 ?auto_167994 ) ) ( not ( = ?auto_167992 ?auto_167998 ) ) ( not ( = ?auto_167993 ?auto_167994 ) ) ( not ( = ?auto_167993 ?auto_167998 ) ) ( not ( = ?auto_167994 ?auto_167998 ) ) ( not ( = ?auto_167992 ?auto_167996 ) ) ( not ( = ?auto_167992 ?auto_167999 ) ) ( not ( = ?auto_167993 ?auto_167996 ) ) ( not ( = ?auto_167993 ?auto_167999 ) ) ( not ( = ?auto_167994 ?auto_167996 ) ) ( not ( = ?auto_167994 ?auto_167999 ) ) ( not ( = ?auto_167998 ?auto_167996 ) ) ( not ( = ?auto_167998 ?auto_167999 ) ) ( not ( = ?auto_167996 ?auto_167999 ) ) ( ON ?auto_167996 ?auto_167998 ) ( ON-TABLE ?auto_167995 ) ( not ( = ?auto_167995 ?auto_167997 ) ) ( not ( = ?auto_167995 ?auto_167999 ) ) ( not ( = ?auto_167997 ?auto_167999 ) ) ( not ( = ?auto_167992 ?auto_167997 ) ) ( not ( = ?auto_167992 ?auto_167995 ) ) ( not ( = ?auto_167993 ?auto_167997 ) ) ( not ( = ?auto_167993 ?auto_167995 ) ) ( not ( = ?auto_167994 ?auto_167997 ) ) ( not ( = ?auto_167994 ?auto_167995 ) ) ( not ( = ?auto_167998 ?auto_167997 ) ) ( not ( = ?auto_167998 ?auto_167995 ) ) ( not ( = ?auto_167996 ?auto_167997 ) ) ( not ( = ?auto_167996 ?auto_167995 ) ) ( ON ?auto_167999 ?auto_167996 ) ( CLEAR ?auto_167999 ) ( HOLDING ?auto_167997 ) ( CLEAR ?auto_167995 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_167995 ?auto_167997 )
      ( MAKE-3PILE ?auto_167992 ?auto_167993 ?auto_167994 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_168000 - BLOCK
      ?auto_168001 - BLOCK
      ?auto_168002 - BLOCK
    )
    :vars
    (
      ?auto_168005 - BLOCK
      ?auto_168003 - BLOCK
      ?auto_168006 - BLOCK
      ?auto_168004 - BLOCK
      ?auto_168007 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168005 ?auto_168002 ) ( ON-TABLE ?auto_168000 ) ( ON ?auto_168001 ?auto_168000 ) ( ON ?auto_168002 ?auto_168001 ) ( not ( = ?auto_168000 ?auto_168001 ) ) ( not ( = ?auto_168000 ?auto_168002 ) ) ( not ( = ?auto_168000 ?auto_168005 ) ) ( not ( = ?auto_168001 ?auto_168002 ) ) ( not ( = ?auto_168001 ?auto_168005 ) ) ( not ( = ?auto_168002 ?auto_168005 ) ) ( not ( = ?auto_168000 ?auto_168003 ) ) ( not ( = ?auto_168000 ?auto_168006 ) ) ( not ( = ?auto_168001 ?auto_168003 ) ) ( not ( = ?auto_168001 ?auto_168006 ) ) ( not ( = ?auto_168002 ?auto_168003 ) ) ( not ( = ?auto_168002 ?auto_168006 ) ) ( not ( = ?auto_168005 ?auto_168003 ) ) ( not ( = ?auto_168005 ?auto_168006 ) ) ( not ( = ?auto_168003 ?auto_168006 ) ) ( ON ?auto_168003 ?auto_168005 ) ( ON-TABLE ?auto_168004 ) ( not ( = ?auto_168004 ?auto_168007 ) ) ( not ( = ?auto_168004 ?auto_168006 ) ) ( not ( = ?auto_168007 ?auto_168006 ) ) ( not ( = ?auto_168000 ?auto_168007 ) ) ( not ( = ?auto_168000 ?auto_168004 ) ) ( not ( = ?auto_168001 ?auto_168007 ) ) ( not ( = ?auto_168001 ?auto_168004 ) ) ( not ( = ?auto_168002 ?auto_168007 ) ) ( not ( = ?auto_168002 ?auto_168004 ) ) ( not ( = ?auto_168005 ?auto_168007 ) ) ( not ( = ?auto_168005 ?auto_168004 ) ) ( not ( = ?auto_168003 ?auto_168007 ) ) ( not ( = ?auto_168003 ?auto_168004 ) ) ( ON ?auto_168006 ?auto_168003 ) ( CLEAR ?auto_168004 ) ( ON ?auto_168007 ?auto_168006 ) ( CLEAR ?auto_168007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_168000 ?auto_168001 ?auto_168002 ?auto_168005 ?auto_168003 ?auto_168006 )
      ( MAKE-3PILE ?auto_168000 ?auto_168001 ?auto_168002 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_168008 - BLOCK
      ?auto_168009 - BLOCK
      ?auto_168010 - BLOCK
    )
    :vars
    (
      ?auto_168014 - BLOCK
      ?auto_168013 - BLOCK
      ?auto_168015 - BLOCK
      ?auto_168012 - BLOCK
      ?auto_168011 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168014 ?auto_168010 ) ( ON-TABLE ?auto_168008 ) ( ON ?auto_168009 ?auto_168008 ) ( ON ?auto_168010 ?auto_168009 ) ( not ( = ?auto_168008 ?auto_168009 ) ) ( not ( = ?auto_168008 ?auto_168010 ) ) ( not ( = ?auto_168008 ?auto_168014 ) ) ( not ( = ?auto_168009 ?auto_168010 ) ) ( not ( = ?auto_168009 ?auto_168014 ) ) ( not ( = ?auto_168010 ?auto_168014 ) ) ( not ( = ?auto_168008 ?auto_168013 ) ) ( not ( = ?auto_168008 ?auto_168015 ) ) ( not ( = ?auto_168009 ?auto_168013 ) ) ( not ( = ?auto_168009 ?auto_168015 ) ) ( not ( = ?auto_168010 ?auto_168013 ) ) ( not ( = ?auto_168010 ?auto_168015 ) ) ( not ( = ?auto_168014 ?auto_168013 ) ) ( not ( = ?auto_168014 ?auto_168015 ) ) ( not ( = ?auto_168013 ?auto_168015 ) ) ( ON ?auto_168013 ?auto_168014 ) ( not ( = ?auto_168012 ?auto_168011 ) ) ( not ( = ?auto_168012 ?auto_168015 ) ) ( not ( = ?auto_168011 ?auto_168015 ) ) ( not ( = ?auto_168008 ?auto_168011 ) ) ( not ( = ?auto_168008 ?auto_168012 ) ) ( not ( = ?auto_168009 ?auto_168011 ) ) ( not ( = ?auto_168009 ?auto_168012 ) ) ( not ( = ?auto_168010 ?auto_168011 ) ) ( not ( = ?auto_168010 ?auto_168012 ) ) ( not ( = ?auto_168014 ?auto_168011 ) ) ( not ( = ?auto_168014 ?auto_168012 ) ) ( not ( = ?auto_168013 ?auto_168011 ) ) ( not ( = ?auto_168013 ?auto_168012 ) ) ( ON ?auto_168015 ?auto_168013 ) ( ON ?auto_168011 ?auto_168015 ) ( CLEAR ?auto_168011 ) ( HOLDING ?auto_168012 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_168012 )
      ( MAKE-3PILE ?auto_168008 ?auto_168009 ?auto_168010 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_168027 - BLOCK
      ?auto_168028 - BLOCK
      ?auto_168029 - BLOCK
    )
    :vars
    (
      ?auto_168030 - BLOCK
      ?auto_168034 - BLOCK
      ?auto_168032 - BLOCK
      ?auto_168033 - BLOCK
      ?auto_168031 - BLOCK
      ?auto_168035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168030 ?auto_168029 ) ( ON-TABLE ?auto_168027 ) ( ON ?auto_168028 ?auto_168027 ) ( ON ?auto_168029 ?auto_168028 ) ( not ( = ?auto_168027 ?auto_168028 ) ) ( not ( = ?auto_168027 ?auto_168029 ) ) ( not ( = ?auto_168027 ?auto_168030 ) ) ( not ( = ?auto_168028 ?auto_168029 ) ) ( not ( = ?auto_168028 ?auto_168030 ) ) ( not ( = ?auto_168029 ?auto_168030 ) ) ( not ( = ?auto_168027 ?auto_168034 ) ) ( not ( = ?auto_168027 ?auto_168032 ) ) ( not ( = ?auto_168028 ?auto_168034 ) ) ( not ( = ?auto_168028 ?auto_168032 ) ) ( not ( = ?auto_168029 ?auto_168034 ) ) ( not ( = ?auto_168029 ?auto_168032 ) ) ( not ( = ?auto_168030 ?auto_168034 ) ) ( not ( = ?auto_168030 ?auto_168032 ) ) ( not ( = ?auto_168034 ?auto_168032 ) ) ( ON ?auto_168034 ?auto_168030 ) ( not ( = ?auto_168033 ?auto_168031 ) ) ( not ( = ?auto_168033 ?auto_168032 ) ) ( not ( = ?auto_168031 ?auto_168032 ) ) ( not ( = ?auto_168027 ?auto_168031 ) ) ( not ( = ?auto_168027 ?auto_168033 ) ) ( not ( = ?auto_168028 ?auto_168031 ) ) ( not ( = ?auto_168028 ?auto_168033 ) ) ( not ( = ?auto_168029 ?auto_168031 ) ) ( not ( = ?auto_168029 ?auto_168033 ) ) ( not ( = ?auto_168030 ?auto_168031 ) ) ( not ( = ?auto_168030 ?auto_168033 ) ) ( not ( = ?auto_168034 ?auto_168031 ) ) ( not ( = ?auto_168034 ?auto_168033 ) ) ( ON ?auto_168032 ?auto_168034 ) ( ON ?auto_168031 ?auto_168032 ) ( CLEAR ?auto_168031 ) ( ON ?auto_168033 ?auto_168035 ) ( CLEAR ?auto_168033 ) ( HAND-EMPTY ) ( not ( = ?auto_168027 ?auto_168035 ) ) ( not ( = ?auto_168028 ?auto_168035 ) ) ( not ( = ?auto_168029 ?auto_168035 ) ) ( not ( = ?auto_168030 ?auto_168035 ) ) ( not ( = ?auto_168034 ?auto_168035 ) ) ( not ( = ?auto_168032 ?auto_168035 ) ) ( not ( = ?auto_168033 ?auto_168035 ) ) ( not ( = ?auto_168031 ?auto_168035 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_168033 ?auto_168035 )
      ( MAKE-3PILE ?auto_168027 ?auto_168028 ?auto_168029 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_168036 - BLOCK
      ?auto_168037 - BLOCK
      ?auto_168038 - BLOCK
    )
    :vars
    (
      ?auto_168039 - BLOCK
      ?auto_168042 - BLOCK
      ?auto_168044 - BLOCK
      ?auto_168043 - BLOCK
      ?auto_168041 - BLOCK
      ?auto_168040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168039 ?auto_168038 ) ( ON-TABLE ?auto_168036 ) ( ON ?auto_168037 ?auto_168036 ) ( ON ?auto_168038 ?auto_168037 ) ( not ( = ?auto_168036 ?auto_168037 ) ) ( not ( = ?auto_168036 ?auto_168038 ) ) ( not ( = ?auto_168036 ?auto_168039 ) ) ( not ( = ?auto_168037 ?auto_168038 ) ) ( not ( = ?auto_168037 ?auto_168039 ) ) ( not ( = ?auto_168038 ?auto_168039 ) ) ( not ( = ?auto_168036 ?auto_168042 ) ) ( not ( = ?auto_168036 ?auto_168044 ) ) ( not ( = ?auto_168037 ?auto_168042 ) ) ( not ( = ?auto_168037 ?auto_168044 ) ) ( not ( = ?auto_168038 ?auto_168042 ) ) ( not ( = ?auto_168038 ?auto_168044 ) ) ( not ( = ?auto_168039 ?auto_168042 ) ) ( not ( = ?auto_168039 ?auto_168044 ) ) ( not ( = ?auto_168042 ?auto_168044 ) ) ( ON ?auto_168042 ?auto_168039 ) ( not ( = ?auto_168043 ?auto_168041 ) ) ( not ( = ?auto_168043 ?auto_168044 ) ) ( not ( = ?auto_168041 ?auto_168044 ) ) ( not ( = ?auto_168036 ?auto_168041 ) ) ( not ( = ?auto_168036 ?auto_168043 ) ) ( not ( = ?auto_168037 ?auto_168041 ) ) ( not ( = ?auto_168037 ?auto_168043 ) ) ( not ( = ?auto_168038 ?auto_168041 ) ) ( not ( = ?auto_168038 ?auto_168043 ) ) ( not ( = ?auto_168039 ?auto_168041 ) ) ( not ( = ?auto_168039 ?auto_168043 ) ) ( not ( = ?auto_168042 ?auto_168041 ) ) ( not ( = ?auto_168042 ?auto_168043 ) ) ( ON ?auto_168044 ?auto_168042 ) ( ON ?auto_168043 ?auto_168040 ) ( CLEAR ?auto_168043 ) ( not ( = ?auto_168036 ?auto_168040 ) ) ( not ( = ?auto_168037 ?auto_168040 ) ) ( not ( = ?auto_168038 ?auto_168040 ) ) ( not ( = ?auto_168039 ?auto_168040 ) ) ( not ( = ?auto_168042 ?auto_168040 ) ) ( not ( = ?auto_168044 ?auto_168040 ) ) ( not ( = ?auto_168043 ?auto_168040 ) ) ( not ( = ?auto_168041 ?auto_168040 ) ) ( HOLDING ?auto_168041 ) ( CLEAR ?auto_168044 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_168036 ?auto_168037 ?auto_168038 ?auto_168039 ?auto_168042 ?auto_168044 ?auto_168041 )
      ( MAKE-3PILE ?auto_168036 ?auto_168037 ?auto_168038 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_168045 - BLOCK
      ?auto_168046 - BLOCK
      ?auto_168047 - BLOCK
    )
    :vars
    (
      ?auto_168053 - BLOCK
      ?auto_168051 - BLOCK
      ?auto_168052 - BLOCK
      ?auto_168048 - BLOCK
      ?auto_168049 - BLOCK
      ?auto_168050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168053 ?auto_168047 ) ( ON-TABLE ?auto_168045 ) ( ON ?auto_168046 ?auto_168045 ) ( ON ?auto_168047 ?auto_168046 ) ( not ( = ?auto_168045 ?auto_168046 ) ) ( not ( = ?auto_168045 ?auto_168047 ) ) ( not ( = ?auto_168045 ?auto_168053 ) ) ( not ( = ?auto_168046 ?auto_168047 ) ) ( not ( = ?auto_168046 ?auto_168053 ) ) ( not ( = ?auto_168047 ?auto_168053 ) ) ( not ( = ?auto_168045 ?auto_168051 ) ) ( not ( = ?auto_168045 ?auto_168052 ) ) ( not ( = ?auto_168046 ?auto_168051 ) ) ( not ( = ?auto_168046 ?auto_168052 ) ) ( not ( = ?auto_168047 ?auto_168051 ) ) ( not ( = ?auto_168047 ?auto_168052 ) ) ( not ( = ?auto_168053 ?auto_168051 ) ) ( not ( = ?auto_168053 ?auto_168052 ) ) ( not ( = ?auto_168051 ?auto_168052 ) ) ( ON ?auto_168051 ?auto_168053 ) ( not ( = ?auto_168048 ?auto_168049 ) ) ( not ( = ?auto_168048 ?auto_168052 ) ) ( not ( = ?auto_168049 ?auto_168052 ) ) ( not ( = ?auto_168045 ?auto_168049 ) ) ( not ( = ?auto_168045 ?auto_168048 ) ) ( not ( = ?auto_168046 ?auto_168049 ) ) ( not ( = ?auto_168046 ?auto_168048 ) ) ( not ( = ?auto_168047 ?auto_168049 ) ) ( not ( = ?auto_168047 ?auto_168048 ) ) ( not ( = ?auto_168053 ?auto_168049 ) ) ( not ( = ?auto_168053 ?auto_168048 ) ) ( not ( = ?auto_168051 ?auto_168049 ) ) ( not ( = ?auto_168051 ?auto_168048 ) ) ( ON ?auto_168052 ?auto_168051 ) ( ON ?auto_168048 ?auto_168050 ) ( not ( = ?auto_168045 ?auto_168050 ) ) ( not ( = ?auto_168046 ?auto_168050 ) ) ( not ( = ?auto_168047 ?auto_168050 ) ) ( not ( = ?auto_168053 ?auto_168050 ) ) ( not ( = ?auto_168051 ?auto_168050 ) ) ( not ( = ?auto_168052 ?auto_168050 ) ) ( not ( = ?auto_168048 ?auto_168050 ) ) ( not ( = ?auto_168049 ?auto_168050 ) ) ( CLEAR ?auto_168052 ) ( ON ?auto_168049 ?auto_168048 ) ( CLEAR ?auto_168049 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_168050 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_168050 ?auto_168048 )
      ( MAKE-3PILE ?auto_168045 ?auto_168046 ?auto_168047 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_168054 - BLOCK
      ?auto_168055 - BLOCK
      ?auto_168056 - BLOCK
    )
    :vars
    (
      ?auto_168058 - BLOCK
      ?auto_168060 - BLOCK
      ?auto_168059 - BLOCK
      ?auto_168057 - BLOCK
      ?auto_168062 - BLOCK
      ?auto_168061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168058 ?auto_168056 ) ( ON-TABLE ?auto_168054 ) ( ON ?auto_168055 ?auto_168054 ) ( ON ?auto_168056 ?auto_168055 ) ( not ( = ?auto_168054 ?auto_168055 ) ) ( not ( = ?auto_168054 ?auto_168056 ) ) ( not ( = ?auto_168054 ?auto_168058 ) ) ( not ( = ?auto_168055 ?auto_168056 ) ) ( not ( = ?auto_168055 ?auto_168058 ) ) ( not ( = ?auto_168056 ?auto_168058 ) ) ( not ( = ?auto_168054 ?auto_168060 ) ) ( not ( = ?auto_168054 ?auto_168059 ) ) ( not ( = ?auto_168055 ?auto_168060 ) ) ( not ( = ?auto_168055 ?auto_168059 ) ) ( not ( = ?auto_168056 ?auto_168060 ) ) ( not ( = ?auto_168056 ?auto_168059 ) ) ( not ( = ?auto_168058 ?auto_168060 ) ) ( not ( = ?auto_168058 ?auto_168059 ) ) ( not ( = ?auto_168060 ?auto_168059 ) ) ( ON ?auto_168060 ?auto_168058 ) ( not ( = ?auto_168057 ?auto_168062 ) ) ( not ( = ?auto_168057 ?auto_168059 ) ) ( not ( = ?auto_168062 ?auto_168059 ) ) ( not ( = ?auto_168054 ?auto_168062 ) ) ( not ( = ?auto_168054 ?auto_168057 ) ) ( not ( = ?auto_168055 ?auto_168062 ) ) ( not ( = ?auto_168055 ?auto_168057 ) ) ( not ( = ?auto_168056 ?auto_168062 ) ) ( not ( = ?auto_168056 ?auto_168057 ) ) ( not ( = ?auto_168058 ?auto_168062 ) ) ( not ( = ?auto_168058 ?auto_168057 ) ) ( not ( = ?auto_168060 ?auto_168062 ) ) ( not ( = ?auto_168060 ?auto_168057 ) ) ( ON ?auto_168057 ?auto_168061 ) ( not ( = ?auto_168054 ?auto_168061 ) ) ( not ( = ?auto_168055 ?auto_168061 ) ) ( not ( = ?auto_168056 ?auto_168061 ) ) ( not ( = ?auto_168058 ?auto_168061 ) ) ( not ( = ?auto_168060 ?auto_168061 ) ) ( not ( = ?auto_168059 ?auto_168061 ) ) ( not ( = ?auto_168057 ?auto_168061 ) ) ( not ( = ?auto_168062 ?auto_168061 ) ) ( ON ?auto_168062 ?auto_168057 ) ( CLEAR ?auto_168062 ) ( ON-TABLE ?auto_168061 ) ( HOLDING ?auto_168059 ) ( CLEAR ?auto_168060 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_168054 ?auto_168055 ?auto_168056 ?auto_168058 ?auto_168060 ?auto_168059 )
      ( MAKE-3PILE ?auto_168054 ?auto_168055 ?auto_168056 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168121 - BLOCK
      ?auto_168122 - BLOCK
      ?auto_168123 - BLOCK
      ?auto_168124 - BLOCK
      ?auto_168125 - BLOCK
    )
    :vars
    (
      ?auto_168126 - BLOCK
      ?auto_168127 - BLOCK
      ?auto_168128 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168121 ) ( ON ?auto_168122 ?auto_168121 ) ( ON ?auto_168123 ?auto_168122 ) ( not ( = ?auto_168121 ?auto_168122 ) ) ( not ( = ?auto_168121 ?auto_168123 ) ) ( not ( = ?auto_168121 ?auto_168124 ) ) ( not ( = ?auto_168121 ?auto_168125 ) ) ( not ( = ?auto_168122 ?auto_168123 ) ) ( not ( = ?auto_168122 ?auto_168124 ) ) ( not ( = ?auto_168122 ?auto_168125 ) ) ( not ( = ?auto_168123 ?auto_168124 ) ) ( not ( = ?auto_168123 ?auto_168125 ) ) ( not ( = ?auto_168124 ?auto_168125 ) ) ( ON ?auto_168125 ?auto_168126 ) ( not ( = ?auto_168121 ?auto_168126 ) ) ( not ( = ?auto_168122 ?auto_168126 ) ) ( not ( = ?auto_168123 ?auto_168126 ) ) ( not ( = ?auto_168124 ?auto_168126 ) ) ( not ( = ?auto_168125 ?auto_168126 ) ) ( CLEAR ?auto_168123 ) ( ON ?auto_168124 ?auto_168125 ) ( CLEAR ?auto_168124 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_168127 ) ( ON ?auto_168128 ?auto_168127 ) ( ON ?auto_168126 ?auto_168128 ) ( not ( = ?auto_168127 ?auto_168128 ) ) ( not ( = ?auto_168127 ?auto_168126 ) ) ( not ( = ?auto_168127 ?auto_168125 ) ) ( not ( = ?auto_168127 ?auto_168124 ) ) ( not ( = ?auto_168128 ?auto_168126 ) ) ( not ( = ?auto_168128 ?auto_168125 ) ) ( not ( = ?auto_168128 ?auto_168124 ) ) ( not ( = ?auto_168121 ?auto_168127 ) ) ( not ( = ?auto_168121 ?auto_168128 ) ) ( not ( = ?auto_168122 ?auto_168127 ) ) ( not ( = ?auto_168122 ?auto_168128 ) ) ( not ( = ?auto_168123 ?auto_168127 ) ) ( not ( = ?auto_168123 ?auto_168128 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_168127 ?auto_168128 ?auto_168126 ?auto_168125 )
      ( MAKE-5PILE ?auto_168121 ?auto_168122 ?auto_168123 ?auto_168124 ?auto_168125 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168129 - BLOCK
      ?auto_168130 - BLOCK
      ?auto_168131 - BLOCK
      ?auto_168132 - BLOCK
      ?auto_168133 - BLOCK
    )
    :vars
    (
      ?auto_168135 - BLOCK
      ?auto_168134 - BLOCK
      ?auto_168136 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168129 ) ( ON ?auto_168130 ?auto_168129 ) ( not ( = ?auto_168129 ?auto_168130 ) ) ( not ( = ?auto_168129 ?auto_168131 ) ) ( not ( = ?auto_168129 ?auto_168132 ) ) ( not ( = ?auto_168129 ?auto_168133 ) ) ( not ( = ?auto_168130 ?auto_168131 ) ) ( not ( = ?auto_168130 ?auto_168132 ) ) ( not ( = ?auto_168130 ?auto_168133 ) ) ( not ( = ?auto_168131 ?auto_168132 ) ) ( not ( = ?auto_168131 ?auto_168133 ) ) ( not ( = ?auto_168132 ?auto_168133 ) ) ( ON ?auto_168133 ?auto_168135 ) ( not ( = ?auto_168129 ?auto_168135 ) ) ( not ( = ?auto_168130 ?auto_168135 ) ) ( not ( = ?auto_168131 ?auto_168135 ) ) ( not ( = ?auto_168132 ?auto_168135 ) ) ( not ( = ?auto_168133 ?auto_168135 ) ) ( ON ?auto_168132 ?auto_168133 ) ( CLEAR ?auto_168132 ) ( ON-TABLE ?auto_168134 ) ( ON ?auto_168136 ?auto_168134 ) ( ON ?auto_168135 ?auto_168136 ) ( not ( = ?auto_168134 ?auto_168136 ) ) ( not ( = ?auto_168134 ?auto_168135 ) ) ( not ( = ?auto_168134 ?auto_168133 ) ) ( not ( = ?auto_168134 ?auto_168132 ) ) ( not ( = ?auto_168136 ?auto_168135 ) ) ( not ( = ?auto_168136 ?auto_168133 ) ) ( not ( = ?auto_168136 ?auto_168132 ) ) ( not ( = ?auto_168129 ?auto_168134 ) ) ( not ( = ?auto_168129 ?auto_168136 ) ) ( not ( = ?auto_168130 ?auto_168134 ) ) ( not ( = ?auto_168130 ?auto_168136 ) ) ( not ( = ?auto_168131 ?auto_168134 ) ) ( not ( = ?auto_168131 ?auto_168136 ) ) ( HOLDING ?auto_168131 ) ( CLEAR ?auto_168130 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_168129 ?auto_168130 ?auto_168131 )
      ( MAKE-5PILE ?auto_168129 ?auto_168130 ?auto_168131 ?auto_168132 ?auto_168133 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168137 - BLOCK
      ?auto_168138 - BLOCK
      ?auto_168139 - BLOCK
      ?auto_168140 - BLOCK
      ?auto_168141 - BLOCK
    )
    :vars
    (
      ?auto_168144 - BLOCK
      ?auto_168142 - BLOCK
      ?auto_168143 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168137 ) ( ON ?auto_168138 ?auto_168137 ) ( not ( = ?auto_168137 ?auto_168138 ) ) ( not ( = ?auto_168137 ?auto_168139 ) ) ( not ( = ?auto_168137 ?auto_168140 ) ) ( not ( = ?auto_168137 ?auto_168141 ) ) ( not ( = ?auto_168138 ?auto_168139 ) ) ( not ( = ?auto_168138 ?auto_168140 ) ) ( not ( = ?auto_168138 ?auto_168141 ) ) ( not ( = ?auto_168139 ?auto_168140 ) ) ( not ( = ?auto_168139 ?auto_168141 ) ) ( not ( = ?auto_168140 ?auto_168141 ) ) ( ON ?auto_168141 ?auto_168144 ) ( not ( = ?auto_168137 ?auto_168144 ) ) ( not ( = ?auto_168138 ?auto_168144 ) ) ( not ( = ?auto_168139 ?auto_168144 ) ) ( not ( = ?auto_168140 ?auto_168144 ) ) ( not ( = ?auto_168141 ?auto_168144 ) ) ( ON ?auto_168140 ?auto_168141 ) ( ON-TABLE ?auto_168142 ) ( ON ?auto_168143 ?auto_168142 ) ( ON ?auto_168144 ?auto_168143 ) ( not ( = ?auto_168142 ?auto_168143 ) ) ( not ( = ?auto_168142 ?auto_168144 ) ) ( not ( = ?auto_168142 ?auto_168141 ) ) ( not ( = ?auto_168142 ?auto_168140 ) ) ( not ( = ?auto_168143 ?auto_168144 ) ) ( not ( = ?auto_168143 ?auto_168141 ) ) ( not ( = ?auto_168143 ?auto_168140 ) ) ( not ( = ?auto_168137 ?auto_168142 ) ) ( not ( = ?auto_168137 ?auto_168143 ) ) ( not ( = ?auto_168138 ?auto_168142 ) ) ( not ( = ?auto_168138 ?auto_168143 ) ) ( not ( = ?auto_168139 ?auto_168142 ) ) ( not ( = ?auto_168139 ?auto_168143 ) ) ( CLEAR ?auto_168138 ) ( ON ?auto_168139 ?auto_168140 ) ( CLEAR ?auto_168139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_168142 ?auto_168143 ?auto_168144 ?auto_168141 ?auto_168140 )
      ( MAKE-5PILE ?auto_168137 ?auto_168138 ?auto_168139 ?auto_168140 ?auto_168141 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168145 - BLOCK
      ?auto_168146 - BLOCK
      ?auto_168147 - BLOCK
      ?auto_168148 - BLOCK
      ?auto_168149 - BLOCK
    )
    :vars
    (
      ?auto_168152 - BLOCK
      ?auto_168150 - BLOCK
      ?auto_168151 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168145 ) ( not ( = ?auto_168145 ?auto_168146 ) ) ( not ( = ?auto_168145 ?auto_168147 ) ) ( not ( = ?auto_168145 ?auto_168148 ) ) ( not ( = ?auto_168145 ?auto_168149 ) ) ( not ( = ?auto_168146 ?auto_168147 ) ) ( not ( = ?auto_168146 ?auto_168148 ) ) ( not ( = ?auto_168146 ?auto_168149 ) ) ( not ( = ?auto_168147 ?auto_168148 ) ) ( not ( = ?auto_168147 ?auto_168149 ) ) ( not ( = ?auto_168148 ?auto_168149 ) ) ( ON ?auto_168149 ?auto_168152 ) ( not ( = ?auto_168145 ?auto_168152 ) ) ( not ( = ?auto_168146 ?auto_168152 ) ) ( not ( = ?auto_168147 ?auto_168152 ) ) ( not ( = ?auto_168148 ?auto_168152 ) ) ( not ( = ?auto_168149 ?auto_168152 ) ) ( ON ?auto_168148 ?auto_168149 ) ( ON-TABLE ?auto_168150 ) ( ON ?auto_168151 ?auto_168150 ) ( ON ?auto_168152 ?auto_168151 ) ( not ( = ?auto_168150 ?auto_168151 ) ) ( not ( = ?auto_168150 ?auto_168152 ) ) ( not ( = ?auto_168150 ?auto_168149 ) ) ( not ( = ?auto_168150 ?auto_168148 ) ) ( not ( = ?auto_168151 ?auto_168152 ) ) ( not ( = ?auto_168151 ?auto_168149 ) ) ( not ( = ?auto_168151 ?auto_168148 ) ) ( not ( = ?auto_168145 ?auto_168150 ) ) ( not ( = ?auto_168145 ?auto_168151 ) ) ( not ( = ?auto_168146 ?auto_168150 ) ) ( not ( = ?auto_168146 ?auto_168151 ) ) ( not ( = ?auto_168147 ?auto_168150 ) ) ( not ( = ?auto_168147 ?auto_168151 ) ) ( ON ?auto_168147 ?auto_168148 ) ( CLEAR ?auto_168147 ) ( HOLDING ?auto_168146 ) ( CLEAR ?auto_168145 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_168145 ?auto_168146 )
      ( MAKE-5PILE ?auto_168145 ?auto_168146 ?auto_168147 ?auto_168148 ?auto_168149 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168153 - BLOCK
      ?auto_168154 - BLOCK
      ?auto_168155 - BLOCK
      ?auto_168156 - BLOCK
      ?auto_168157 - BLOCK
    )
    :vars
    (
      ?auto_168158 - BLOCK
      ?auto_168159 - BLOCK
      ?auto_168160 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168153 ) ( not ( = ?auto_168153 ?auto_168154 ) ) ( not ( = ?auto_168153 ?auto_168155 ) ) ( not ( = ?auto_168153 ?auto_168156 ) ) ( not ( = ?auto_168153 ?auto_168157 ) ) ( not ( = ?auto_168154 ?auto_168155 ) ) ( not ( = ?auto_168154 ?auto_168156 ) ) ( not ( = ?auto_168154 ?auto_168157 ) ) ( not ( = ?auto_168155 ?auto_168156 ) ) ( not ( = ?auto_168155 ?auto_168157 ) ) ( not ( = ?auto_168156 ?auto_168157 ) ) ( ON ?auto_168157 ?auto_168158 ) ( not ( = ?auto_168153 ?auto_168158 ) ) ( not ( = ?auto_168154 ?auto_168158 ) ) ( not ( = ?auto_168155 ?auto_168158 ) ) ( not ( = ?auto_168156 ?auto_168158 ) ) ( not ( = ?auto_168157 ?auto_168158 ) ) ( ON ?auto_168156 ?auto_168157 ) ( ON-TABLE ?auto_168159 ) ( ON ?auto_168160 ?auto_168159 ) ( ON ?auto_168158 ?auto_168160 ) ( not ( = ?auto_168159 ?auto_168160 ) ) ( not ( = ?auto_168159 ?auto_168158 ) ) ( not ( = ?auto_168159 ?auto_168157 ) ) ( not ( = ?auto_168159 ?auto_168156 ) ) ( not ( = ?auto_168160 ?auto_168158 ) ) ( not ( = ?auto_168160 ?auto_168157 ) ) ( not ( = ?auto_168160 ?auto_168156 ) ) ( not ( = ?auto_168153 ?auto_168159 ) ) ( not ( = ?auto_168153 ?auto_168160 ) ) ( not ( = ?auto_168154 ?auto_168159 ) ) ( not ( = ?auto_168154 ?auto_168160 ) ) ( not ( = ?auto_168155 ?auto_168159 ) ) ( not ( = ?auto_168155 ?auto_168160 ) ) ( ON ?auto_168155 ?auto_168156 ) ( CLEAR ?auto_168153 ) ( ON ?auto_168154 ?auto_168155 ) ( CLEAR ?auto_168154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_168159 ?auto_168160 ?auto_168158 ?auto_168157 ?auto_168156 ?auto_168155 )
      ( MAKE-5PILE ?auto_168153 ?auto_168154 ?auto_168155 ?auto_168156 ?auto_168157 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168161 - BLOCK
      ?auto_168162 - BLOCK
      ?auto_168163 - BLOCK
      ?auto_168164 - BLOCK
      ?auto_168165 - BLOCK
    )
    :vars
    (
      ?auto_168168 - BLOCK
      ?auto_168167 - BLOCK
      ?auto_168166 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168161 ?auto_168162 ) ) ( not ( = ?auto_168161 ?auto_168163 ) ) ( not ( = ?auto_168161 ?auto_168164 ) ) ( not ( = ?auto_168161 ?auto_168165 ) ) ( not ( = ?auto_168162 ?auto_168163 ) ) ( not ( = ?auto_168162 ?auto_168164 ) ) ( not ( = ?auto_168162 ?auto_168165 ) ) ( not ( = ?auto_168163 ?auto_168164 ) ) ( not ( = ?auto_168163 ?auto_168165 ) ) ( not ( = ?auto_168164 ?auto_168165 ) ) ( ON ?auto_168165 ?auto_168168 ) ( not ( = ?auto_168161 ?auto_168168 ) ) ( not ( = ?auto_168162 ?auto_168168 ) ) ( not ( = ?auto_168163 ?auto_168168 ) ) ( not ( = ?auto_168164 ?auto_168168 ) ) ( not ( = ?auto_168165 ?auto_168168 ) ) ( ON ?auto_168164 ?auto_168165 ) ( ON-TABLE ?auto_168167 ) ( ON ?auto_168166 ?auto_168167 ) ( ON ?auto_168168 ?auto_168166 ) ( not ( = ?auto_168167 ?auto_168166 ) ) ( not ( = ?auto_168167 ?auto_168168 ) ) ( not ( = ?auto_168167 ?auto_168165 ) ) ( not ( = ?auto_168167 ?auto_168164 ) ) ( not ( = ?auto_168166 ?auto_168168 ) ) ( not ( = ?auto_168166 ?auto_168165 ) ) ( not ( = ?auto_168166 ?auto_168164 ) ) ( not ( = ?auto_168161 ?auto_168167 ) ) ( not ( = ?auto_168161 ?auto_168166 ) ) ( not ( = ?auto_168162 ?auto_168167 ) ) ( not ( = ?auto_168162 ?auto_168166 ) ) ( not ( = ?auto_168163 ?auto_168167 ) ) ( not ( = ?auto_168163 ?auto_168166 ) ) ( ON ?auto_168163 ?auto_168164 ) ( ON ?auto_168162 ?auto_168163 ) ( CLEAR ?auto_168162 ) ( HOLDING ?auto_168161 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_168161 )
      ( MAKE-5PILE ?auto_168161 ?auto_168162 ?auto_168163 ?auto_168164 ?auto_168165 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168169 - BLOCK
      ?auto_168170 - BLOCK
      ?auto_168171 - BLOCK
      ?auto_168172 - BLOCK
      ?auto_168173 - BLOCK
    )
    :vars
    (
      ?auto_168176 - BLOCK
      ?auto_168174 - BLOCK
      ?auto_168175 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168169 ?auto_168170 ) ) ( not ( = ?auto_168169 ?auto_168171 ) ) ( not ( = ?auto_168169 ?auto_168172 ) ) ( not ( = ?auto_168169 ?auto_168173 ) ) ( not ( = ?auto_168170 ?auto_168171 ) ) ( not ( = ?auto_168170 ?auto_168172 ) ) ( not ( = ?auto_168170 ?auto_168173 ) ) ( not ( = ?auto_168171 ?auto_168172 ) ) ( not ( = ?auto_168171 ?auto_168173 ) ) ( not ( = ?auto_168172 ?auto_168173 ) ) ( ON ?auto_168173 ?auto_168176 ) ( not ( = ?auto_168169 ?auto_168176 ) ) ( not ( = ?auto_168170 ?auto_168176 ) ) ( not ( = ?auto_168171 ?auto_168176 ) ) ( not ( = ?auto_168172 ?auto_168176 ) ) ( not ( = ?auto_168173 ?auto_168176 ) ) ( ON ?auto_168172 ?auto_168173 ) ( ON-TABLE ?auto_168174 ) ( ON ?auto_168175 ?auto_168174 ) ( ON ?auto_168176 ?auto_168175 ) ( not ( = ?auto_168174 ?auto_168175 ) ) ( not ( = ?auto_168174 ?auto_168176 ) ) ( not ( = ?auto_168174 ?auto_168173 ) ) ( not ( = ?auto_168174 ?auto_168172 ) ) ( not ( = ?auto_168175 ?auto_168176 ) ) ( not ( = ?auto_168175 ?auto_168173 ) ) ( not ( = ?auto_168175 ?auto_168172 ) ) ( not ( = ?auto_168169 ?auto_168174 ) ) ( not ( = ?auto_168169 ?auto_168175 ) ) ( not ( = ?auto_168170 ?auto_168174 ) ) ( not ( = ?auto_168170 ?auto_168175 ) ) ( not ( = ?auto_168171 ?auto_168174 ) ) ( not ( = ?auto_168171 ?auto_168175 ) ) ( ON ?auto_168171 ?auto_168172 ) ( ON ?auto_168170 ?auto_168171 ) ( ON ?auto_168169 ?auto_168170 ) ( CLEAR ?auto_168169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_168174 ?auto_168175 ?auto_168176 ?auto_168173 ?auto_168172 ?auto_168171 ?auto_168170 )
      ( MAKE-5PILE ?auto_168169 ?auto_168170 ?auto_168171 ?auto_168172 ?auto_168173 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168182 - BLOCK
      ?auto_168183 - BLOCK
      ?auto_168184 - BLOCK
      ?auto_168185 - BLOCK
      ?auto_168186 - BLOCK
    )
    :vars
    (
      ?auto_168187 - BLOCK
      ?auto_168188 - BLOCK
      ?auto_168189 - BLOCK
      ?auto_168190 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168182 ?auto_168183 ) ) ( not ( = ?auto_168182 ?auto_168184 ) ) ( not ( = ?auto_168182 ?auto_168185 ) ) ( not ( = ?auto_168182 ?auto_168186 ) ) ( not ( = ?auto_168183 ?auto_168184 ) ) ( not ( = ?auto_168183 ?auto_168185 ) ) ( not ( = ?auto_168183 ?auto_168186 ) ) ( not ( = ?auto_168184 ?auto_168185 ) ) ( not ( = ?auto_168184 ?auto_168186 ) ) ( not ( = ?auto_168185 ?auto_168186 ) ) ( ON ?auto_168186 ?auto_168187 ) ( not ( = ?auto_168182 ?auto_168187 ) ) ( not ( = ?auto_168183 ?auto_168187 ) ) ( not ( = ?auto_168184 ?auto_168187 ) ) ( not ( = ?auto_168185 ?auto_168187 ) ) ( not ( = ?auto_168186 ?auto_168187 ) ) ( ON ?auto_168185 ?auto_168186 ) ( ON-TABLE ?auto_168188 ) ( ON ?auto_168189 ?auto_168188 ) ( ON ?auto_168187 ?auto_168189 ) ( not ( = ?auto_168188 ?auto_168189 ) ) ( not ( = ?auto_168188 ?auto_168187 ) ) ( not ( = ?auto_168188 ?auto_168186 ) ) ( not ( = ?auto_168188 ?auto_168185 ) ) ( not ( = ?auto_168189 ?auto_168187 ) ) ( not ( = ?auto_168189 ?auto_168186 ) ) ( not ( = ?auto_168189 ?auto_168185 ) ) ( not ( = ?auto_168182 ?auto_168188 ) ) ( not ( = ?auto_168182 ?auto_168189 ) ) ( not ( = ?auto_168183 ?auto_168188 ) ) ( not ( = ?auto_168183 ?auto_168189 ) ) ( not ( = ?auto_168184 ?auto_168188 ) ) ( not ( = ?auto_168184 ?auto_168189 ) ) ( ON ?auto_168184 ?auto_168185 ) ( ON ?auto_168183 ?auto_168184 ) ( CLEAR ?auto_168183 ) ( ON ?auto_168182 ?auto_168190 ) ( CLEAR ?auto_168182 ) ( HAND-EMPTY ) ( not ( = ?auto_168182 ?auto_168190 ) ) ( not ( = ?auto_168183 ?auto_168190 ) ) ( not ( = ?auto_168184 ?auto_168190 ) ) ( not ( = ?auto_168185 ?auto_168190 ) ) ( not ( = ?auto_168186 ?auto_168190 ) ) ( not ( = ?auto_168187 ?auto_168190 ) ) ( not ( = ?auto_168188 ?auto_168190 ) ) ( not ( = ?auto_168189 ?auto_168190 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_168182 ?auto_168190 )
      ( MAKE-5PILE ?auto_168182 ?auto_168183 ?auto_168184 ?auto_168185 ?auto_168186 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168191 - BLOCK
      ?auto_168192 - BLOCK
      ?auto_168193 - BLOCK
      ?auto_168194 - BLOCK
      ?auto_168195 - BLOCK
    )
    :vars
    (
      ?auto_168198 - BLOCK
      ?auto_168196 - BLOCK
      ?auto_168197 - BLOCK
      ?auto_168199 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168191 ?auto_168192 ) ) ( not ( = ?auto_168191 ?auto_168193 ) ) ( not ( = ?auto_168191 ?auto_168194 ) ) ( not ( = ?auto_168191 ?auto_168195 ) ) ( not ( = ?auto_168192 ?auto_168193 ) ) ( not ( = ?auto_168192 ?auto_168194 ) ) ( not ( = ?auto_168192 ?auto_168195 ) ) ( not ( = ?auto_168193 ?auto_168194 ) ) ( not ( = ?auto_168193 ?auto_168195 ) ) ( not ( = ?auto_168194 ?auto_168195 ) ) ( ON ?auto_168195 ?auto_168198 ) ( not ( = ?auto_168191 ?auto_168198 ) ) ( not ( = ?auto_168192 ?auto_168198 ) ) ( not ( = ?auto_168193 ?auto_168198 ) ) ( not ( = ?auto_168194 ?auto_168198 ) ) ( not ( = ?auto_168195 ?auto_168198 ) ) ( ON ?auto_168194 ?auto_168195 ) ( ON-TABLE ?auto_168196 ) ( ON ?auto_168197 ?auto_168196 ) ( ON ?auto_168198 ?auto_168197 ) ( not ( = ?auto_168196 ?auto_168197 ) ) ( not ( = ?auto_168196 ?auto_168198 ) ) ( not ( = ?auto_168196 ?auto_168195 ) ) ( not ( = ?auto_168196 ?auto_168194 ) ) ( not ( = ?auto_168197 ?auto_168198 ) ) ( not ( = ?auto_168197 ?auto_168195 ) ) ( not ( = ?auto_168197 ?auto_168194 ) ) ( not ( = ?auto_168191 ?auto_168196 ) ) ( not ( = ?auto_168191 ?auto_168197 ) ) ( not ( = ?auto_168192 ?auto_168196 ) ) ( not ( = ?auto_168192 ?auto_168197 ) ) ( not ( = ?auto_168193 ?auto_168196 ) ) ( not ( = ?auto_168193 ?auto_168197 ) ) ( ON ?auto_168193 ?auto_168194 ) ( ON ?auto_168191 ?auto_168199 ) ( CLEAR ?auto_168191 ) ( not ( = ?auto_168191 ?auto_168199 ) ) ( not ( = ?auto_168192 ?auto_168199 ) ) ( not ( = ?auto_168193 ?auto_168199 ) ) ( not ( = ?auto_168194 ?auto_168199 ) ) ( not ( = ?auto_168195 ?auto_168199 ) ) ( not ( = ?auto_168198 ?auto_168199 ) ) ( not ( = ?auto_168196 ?auto_168199 ) ) ( not ( = ?auto_168197 ?auto_168199 ) ) ( HOLDING ?auto_168192 ) ( CLEAR ?auto_168193 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_168196 ?auto_168197 ?auto_168198 ?auto_168195 ?auto_168194 ?auto_168193 ?auto_168192 )
      ( MAKE-5PILE ?auto_168191 ?auto_168192 ?auto_168193 ?auto_168194 ?auto_168195 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168200 - BLOCK
      ?auto_168201 - BLOCK
      ?auto_168202 - BLOCK
      ?auto_168203 - BLOCK
      ?auto_168204 - BLOCK
    )
    :vars
    (
      ?auto_168205 - BLOCK
      ?auto_168206 - BLOCK
      ?auto_168207 - BLOCK
      ?auto_168208 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168200 ?auto_168201 ) ) ( not ( = ?auto_168200 ?auto_168202 ) ) ( not ( = ?auto_168200 ?auto_168203 ) ) ( not ( = ?auto_168200 ?auto_168204 ) ) ( not ( = ?auto_168201 ?auto_168202 ) ) ( not ( = ?auto_168201 ?auto_168203 ) ) ( not ( = ?auto_168201 ?auto_168204 ) ) ( not ( = ?auto_168202 ?auto_168203 ) ) ( not ( = ?auto_168202 ?auto_168204 ) ) ( not ( = ?auto_168203 ?auto_168204 ) ) ( ON ?auto_168204 ?auto_168205 ) ( not ( = ?auto_168200 ?auto_168205 ) ) ( not ( = ?auto_168201 ?auto_168205 ) ) ( not ( = ?auto_168202 ?auto_168205 ) ) ( not ( = ?auto_168203 ?auto_168205 ) ) ( not ( = ?auto_168204 ?auto_168205 ) ) ( ON ?auto_168203 ?auto_168204 ) ( ON-TABLE ?auto_168206 ) ( ON ?auto_168207 ?auto_168206 ) ( ON ?auto_168205 ?auto_168207 ) ( not ( = ?auto_168206 ?auto_168207 ) ) ( not ( = ?auto_168206 ?auto_168205 ) ) ( not ( = ?auto_168206 ?auto_168204 ) ) ( not ( = ?auto_168206 ?auto_168203 ) ) ( not ( = ?auto_168207 ?auto_168205 ) ) ( not ( = ?auto_168207 ?auto_168204 ) ) ( not ( = ?auto_168207 ?auto_168203 ) ) ( not ( = ?auto_168200 ?auto_168206 ) ) ( not ( = ?auto_168200 ?auto_168207 ) ) ( not ( = ?auto_168201 ?auto_168206 ) ) ( not ( = ?auto_168201 ?auto_168207 ) ) ( not ( = ?auto_168202 ?auto_168206 ) ) ( not ( = ?auto_168202 ?auto_168207 ) ) ( ON ?auto_168202 ?auto_168203 ) ( ON ?auto_168200 ?auto_168208 ) ( not ( = ?auto_168200 ?auto_168208 ) ) ( not ( = ?auto_168201 ?auto_168208 ) ) ( not ( = ?auto_168202 ?auto_168208 ) ) ( not ( = ?auto_168203 ?auto_168208 ) ) ( not ( = ?auto_168204 ?auto_168208 ) ) ( not ( = ?auto_168205 ?auto_168208 ) ) ( not ( = ?auto_168206 ?auto_168208 ) ) ( not ( = ?auto_168207 ?auto_168208 ) ) ( CLEAR ?auto_168202 ) ( ON ?auto_168201 ?auto_168200 ) ( CLEAR ?auto_168201 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_168208 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_168208 ?auto_168200 )
      ( MAKE-5PILE ?auto_168200 ?auto_168201 ?auto_168202 ?auto_168203 ?auto_168204 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168209 - BLOCK
      ?auto_168210 - BLOCK
      ?auto_168211 - BLOCK
      ?auto_168212 - BLOCK
      ?auto_168213 - BLOCK
    )
    :vars
    (
      ?auto_168214 - BLOCK
      ?auto_168217 - BLOCK
      ?auto_168215 - BLOCK
      ?auto_168216 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168209 ?auto_168210 ) ) ( not ( = ?auto_168209 ?auto_168211 ) ) ( not ( = ?auto_168209 ?auto_168212 ) ) ( not ( = ?auto_168209 ?auto_168213 ) ) ( not ( = ?auto_168210 ?auto_168211 ) ) ( not ( = ?auto_168210 ?auto_168212 ) ) ( not ( = ?auto_168210 ?auto_168213 ) ) ( not ( = ?auto_168211 ?auto_168212 ) ) ( not ( = ?auto_168211 ?auto_168213 ) ) ( not ( = ?auto_168212 ?auto_168213 ) ) ( ON ?auto_168213 ?auto_168214 ) ( not ( = ?auto_168209 ?auto_168214 ) ) ( not ( = ?auto_168210 ?auto_168214 ) ) ( not ( = ?auto_168211 ?auto_168214 ) ) ( not ( = ?auto_168212 ?auto_168214 ) ) ( not ( = ?auto_168213 ?auto_168214 ) ) ( ON ?auto_168212 ?auto_168213 ) ( ON-TABLE ?auto_168217 ) ( ON ?auto_168215 ?auto_168217 ) ( ON ?auto_168214 ?auto_168215 ) ( not ( = ?auto_168217 ?auto_168215 ) ) ( not ( = ?auto_168217 ?auto_168214 ) ) ( not ( = ?auto_168217 ?auto_168213 ) ) ( not ( = ?auto_168217 ?auto_168212 ) ) ( not ( = ?auto_168215 ?auto_168214 ) ) ( not ( = ?auto_168215 ?auto_168213 ) ) ( not ( = ?auto_168215 ?auto_168212 ) ) ( not ( = ?auto_168209 ?auto_168217 ) ) ( not ( = ?auto_168209 ?auto_168215 ) ) ( not ( = ?auto_168210 ?auto_168217 ) ) ( not ( = ?auto_168210 ?auto_168215 ) ) ( not ( = ?auto_168211 ?auto_168217 ) ) ( not ( = ?auto_168211 ?auto_168215 ) ) ( ON ?auto_168209 ?auto_168216 ) ( not ( = ?auto_168209 ?auto_168216 ) ) ( not ( = ?auto_168210 ?auto_168216 ) ) ( not ( = ?auto_168211 ?auto_168216 ) ) ( not ( = ?auto_168212 ?auto_168216 ) ) ( not ( = ?auto_168213 ?auto_168216 ) ) ( not ( = ?auto_168214 ?auto_168216 ) ) ( not ( = ?auto_168217 ?auto_168216 ) ) ( not ( = ?auto_168215 ?auto_168216 ) ) ( ON ?auto_168210 ?auto_168209 ) ( CLEAR ?auto_168210 ) ( ON-TABLE ?auto_168216 ) ( HOLDING ?auto_168211 ) ( CLEAR ?auto_168212 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_168217 ?auto_168215 ?auto_168214 ?auto_168213 ?auto_168212 ?auto_168211 )
      ( MAKE-5PILE ?auto_168209 ?auto_168210 ?auto_168211 ?auto_168212 ?auto_168213 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168218 - BLOCK
      ?auto_168219 - BLOCK
      ?auto_168220 - BLOCK
      ?auto_168221 - BLOCK
      ?auto_168222 - BLOCK
    )
    :vars
    (
      ?auto_168224 - BLOCK
      ?auto_168223 - BLOCK
      ?auto_168225 - BLOCK
      ?auto_168226 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168218 ?auto_168219 ) ) ( not ( = ?auto_168218 ?auto_168220 ) ) ( not ( = ?auto_168218 ?auto_168221 ) ) ( not ( = ?auto_168218 ?auto_168222 ) ) ( not ( = ?auto_168219 ?auto_168220 ) ) ( not ( = ?auto_168219 ?auto_168221 ) ) ( not ( = ?auto_168219 ?auto_168222 ) ) ( not ( = ?auto_168220 ?auto_168221 ) ) ( not ( = ?auto_168220 ?auto_168222 ) ) ( not ( = ?auto_168221 ?auto_168222 ) ) ( ON ?auto_168222 ?auto_168224 ) ( not ( = ?auto_168218 ?auto_168224 ) ) ( not ( = ?auto_168219 ?auto_168224 ) ) ( not ( = ?auto_168220 ?auto_168224 ) ) ( not ( = ?auto_168221 ?auto_168224 ) ) ( not ( = ?auto_168222 ?auto_168224 ) ) ( ON ?auto_168221 ?auto_168222 ) ( ON-TABLE ?auto_168223 ) ( ON ?auto_168225 ?auto_168223 ) ( ON ?auto_168224 ?auto_168225 ) ( not ( = ?auto_168223 ?auto_168225 ) ) ( not ( = ?auto_168223 ?auto_168224 ) ) ( not ( = ?auto_168223 ?auto_168222 ) ) ( not ( = ?auto_168223 ?auto_168221 ) ) ( not ( = ?auto_168225 ?auto_168224 ) ) ( not ( = ?auto_168225 ?auto_168222 ) ) ( not ( = ?auto_168225 ?auto_168221 ) ) ( not ( = ?auto_168218 ?auto_168223 ) ) ( not ( = ?auto_168218 ?auto_168225 ) ) ( not ( = ?auto_168219 ?auto_168223 ) ) ( not ( = ?auto_168219 ?auto_168225 ) ) ( not ( = ?auto_168220 ?auto_168223 ) ) ( not ( = ?auto_168220 ?auto_168225 ) ) ( ON ?auto_168218 ?auto_168226 ) ( not ( = ?auto_168218 ?auto_168226 ) ) ( not ( = ?auto_168219 ?auto_168226 ) ) ( not ( = ?auto_168220 ?auto_168226 ) ) ( not ( = ?auto_168221 ?auto_168226 ) ) ( not ( = ?auto_168222 ?auto_168226 ) ) ( not ( = ?auto_168224 ?auto_168226 ) ) ( not ( = ?auto_168223 ?auto_168226 ) ) ( not ( = ?auto_168225 ?auto_168226 ) ) ( ON ?auto_168219 ?auto_168218 ) ( ON-TABLE ?auto_168226 ) ( CLEAR ?auto_168221 ) ( ON ?auto_168220 ?auto_168219 ) ( CLEAR ?auto_168220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_168226 ?auto_168218 ?auto_168219 )
      ( MAKE-5PILE ?auto_168218 ?auto_168219 ?auto_168220 ?auto_168221 ?auto_168222 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168227 - BLOCK
      ?auto_168228 - BLOCK
      ?auto_168229 - BLOCK
      ?auto_168230 - BLOCK
      ?auto_168231 - BLOCK
    )
    :vars
    (
      ?auto_168235 - BLOCK
      ?auto_168234 - BLOCK
      ?auto_168233 - BLOCK
      ?auto_168232 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168227 ?auto_168228 ) ) ( not ( = ?auto_168227 ?auto_168229 ) ) ( not ( = ?auto_168227 ?auto_168230 ) ) ( not ( = ?auto_168227 ?auto_168231 ) ) ( not ( = ?auto_168228 ?auto_168229 ) ) ( not ( = ?auto_168228 ?auto_168230 ) ) ( not ( = ?auto_168228 ?auto_168231 ) ) ( not ( = ?auto_168229 ?auto_168230 ) ) ( not ( = ?auto_168229 ?auto_168231 ) ) ( not ( = ?auto_168230 ?auto_168231 ) ) ( ON ?auto_168231 ?auto_168235 ) ( not ( = ?auto_168227 ?auto_168235 ) ) ( not ( = ?auto_168228 ?auto_168235 ) ) ( not ( = ?auto_168229 ?auto_168235 ) ) ( not ( = ?auto_168230 ?auto_168235 ) ) ( not ( = ?auto_168231 ?auto_168235 ) ) ( ON-TABLE ?auto_168234 ) ( ON ?auto_168233 ?auto_168234 ) ( ON ?auto_168235 ?auto_168233 ) ( not ( = ?auto_168234 ?auto_168233 ) ) ( not ( = ?auto_168234 ?auto_168235 ) ) ( not ( = ?auto_168234 ?auto_168231 ) ) ( not ( = ?auto_168234 ?auto_168230 ) ) ( not ( = ?auto_168233 ?auto_168235 ) ) ( not ( = ?auto_168233 ?auto_168231 ) ) ( not ( = ?auto_168233 ?auto_168230 ) ) ( not ( = ?auto_168227 ?auto_168234 ) ) ( not ( = ?auto_168227 ?auto_168233 ) ) ( not ( = ?auto_168228 ?auto_168234 ) ) ( not ( = ?auto_168228 ?auto_168233 ) ) ( not ( = ?auto_168229 ?auto_168234 ) ) ( not ( = ?auto_168229 ?auto_168233 ) ) ( ON ?auto_168227 ?auto_168232 ) ( not ( = ?auto_168227 ?auto_168232 ) ) ( not ( = ?auto_168228 ?auto_168232 ) ) ( not ( = ?auto_168229 ?auto_168232 ) ) ( not ( = ?auto_168230 ?auto_168232 ) ) ( not ( = ?auto_168231 ?auto_168232 ) ) ( not ( = ?auto_168235 ?auto_168232 ) ) ( not ( = ?auto_168234 ?auto_168232 ) ) ( not ( = ?auto_168233 ?auto_168232 ) ) ( ON ?auto_168228 ?auto_168227 ) ( ON-TABLE ?auto_168232 ) ( ON ?auto_168229 ?auto_168228 ) ( CLEAR ?auto_168229 ) ( HOLDING ?auto_168230 ) ( CLEAR ?auto_168231 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_168234 ?auto_168233 ?auto_168235 ?auto_168231 ?auto_168230 )
      ( MAKE-5PILE ?auto_168227 ?auto_168228 ?auto_168229 ?auto_168230 ?auto_168231 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168236 - BLOCK
      ?auto_168237 - BLOCK
      ?auto_168238 - BLOCK
      ?auto_168239 - BLOCK
      ?auto_168240 - BLOCK
    )
    :vars
    (
      ?auto_168242 - BLOCK
      ?auto_168243 - BLOCK
      ?auto_168244 - BLOCK
      ?auto_168241 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168236 ?auto_168237 ) ) ( not ( = ?auto_168236 ?auto_168238 ) ) ( not ( = ?auto_168236 ?auto_168239 ) ) ( not ( = ?auto_168236 ?auto_168240 ) ) ( not ( = ?auto_168237 ?auto_168238 ) ) ( not ( = ?auto_168237 ?auto_168239 ) ) ( not ( = ?auto_168237 ?auto_168240 ) ) ( not ( = ?auto_168238 ?auto_168239 ) ) ( not ( = ?auto_168238 ?auto_168240 ) ) ( not ( = ?auto_168239 ?auto_168240 ) ) ( ON ?auto_168240 ?auto_168242 ) ( not ( = ?auto_168236 ?auto_168242 ) ) ( not ( = ?auto_168237 ?auto_168242 ) ) ( not ( = ?auto_168238 ?auto_168242 ) ) ( not ( = ?auto_168239 ?auto_168242 ) ) ( not ( = ?auto_168240 ?auto_168242 ) ) ( ON-TABLE ?auto_168243 ) ( ON ?auto_168244 ?auto_168243 ) ( ON ?auto_168242 ?auto_168244 ) ( not ( = ?auto_168243 ?auto_168244 ) ) ( not ( = ?auto_168243 ?auto_168242 ) ) ( not ( = ?auto_168243 ?auto_168240 ) ) ( not ( = ?auto_168243 ?auto_168239 ) ) ( not ( = ?auto_168244 ?auto_168242 ) ) ( not ( = ?auto_168244 ?auto_168240 ) ) ( not ( = ?auto_168244 ?auto_168239 ) ) ( not ( = ?auto_168236 ?auto_168243 ) ) ( not ( = ?auto_168236 ?auto_168244 ) ) ( not ( = ?auto_168237 ?auto_168243 ) ) ( not ( = ?auto_168237 ?auto_168244 ) ) ( not ( = ?auto_168238 ?auto_168243 ) ) ( not ( = ?auto_168238 ?auto_168244 ) ) ( ON ?auto_168236 ?auto_168241 ) ( not ( = ?auto_168236 ?auto_168241 ) ) ( not ( = ?auto_168237 ?auto_168241 ) ) ( not ( = ?auto_168238 ?auto_168241 ) ) ( not ( = ?auto_168239 ?auto_168241 ) ) ( not ( = ?auto_168240 ?auto_168241 ) ) ( not ( = ?auto_168242 ?auto_168241 ) ) ( not ( = ?auto_168243 ?auto_168241 ) ) ( not ( = ?auto_168244 ?auto_168241 ) ) ( ON ?auto_168237 ?auto_168236 ) ( ON-TABLE ?auto_168241 ) ( ON ?auto_168238 ?auto_168237 ) ( CLEAR ?auto_168240 ) ( ON ?auto_168239 ?auto_168238 ) ( CLEAR ?auto_168239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_168241 ?auto_168236 ?auto_168237 ?auto_168238 )
      ( MAKE-5PILE ?auto_168236 ?auto_168237 ?auto_168238 ?auto_168239 ?auto_168240 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168245 - BLOCK
      ?auto_168246 - BLOCK
      ?auto_168247 - BLOCK
      ?auto_168248 - BLOCK
      ?auto_168249 - BLOCK
    )
    :vars
    (
      ?auto_168250 - BLOCK
      ?auto_168251 - BLOCK
      ?auto_168253 - BLOCK
      ?auto_168252 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168245 ?auto_168246 ) ) ( not ( = ?auto_168245 ?auto_168247 ) ) ( not ( = ?auto_168245 ?auto_168248 ) ) ( not ( = ?auto_168245 ?auto_168249 ) ) ( not ( = ?auto_168246 ?auto_168247 ) ) ( not ( = ?auto_168246 ?auto_168248 ) ) ( not ( = ?auto_168246 ?auto_168249 ) ) ( not ( = ?auto_168247 ?auto_168248 ) ) ( not ( = ?auto_168247 ?auto_168249 ) ) ( not ( = ?auto_168248 ?auto_168249 ) ) ( not ( = ?auto_168245 ?auto_168250 ) ) ( not ( = ?auto_168246 ?auto_168250 ) ) ( not ( = ?auto_168247 ?auto_168250 ) ) ( not ( = ?auto_168248 ?auto_168250 ) ) ( not ( = ?auto_168249 ?auto_168250 ) ) ( ON-TABLE ?auto_168251 ) ( ON ?auto_168253 ?auto_168251 ) ( ON ?auto_168250 ?auto_168253 ) ( not ( = ?auto_168251 ?auto_168253 ) ) ( not ( = ?auto_168251 ?auto_168250 ) ) ( not ( = ?auto_168251 ?auto_168249 ) ) ( not ( = ?auto_168251 ?auto_168248 ) ) ( not ( = ?auto_168253 ?auto_168250 ) ) ( not ( = ?auto_168253 ?auto_168249 ) ) ( not ( = ?auto_168253 ?auto_168248 ) ) ( not ( = ?auto_168245 ?auto_168251 ) ) ( not ( = ?auto_168245 ?auto_168253 ) ) ( not ( = ?auto_168246 ?auto_168251 ) ) ( not ( = ?auto_168246 ?auto_168253 ) ) ( not ( = ?auto_168247 ?auto_168251 ) ) ( not ( = ?auto_168247 ?auto_168253 ) ) ( ON ?auto_168245 ?auto_168252 ) ( not ( = ?auto_168245 ?auto_168252 ) ) ( not ( = ?auto_168246 ?auto_168252 ) ) ( not ( = ?auto_168247 ?auto_168252 ) ) ( not ( = ?auto_168248 ?auto_168252 ) ) ( not ( = ?auto_168249 ?auto_168252 ) ) ( not ( = ?auto_168250 ?auto_168252 ) ) ( not ( = ?auto_168251 ?auto_168252 ) ) ( not ( = ?auto_168253 ?auto_168252 ) ) ( ON ?auto_168246 ?auto_168245 ) ( ON-TABLE ?auto_168252 ) ( ON ?auto_168247 ?auto_168246 ) ( ON ?auto_168248 ?auto_168247 ) ( CLEAR ?auto_168248 ) ( HOLDING ?auto_168249 ) ( CLEAR ?auto_168250 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_168251 ?auto_168253 ?auto_168250 ?auto_168249 )
      ( MAKE-5PILE ?auto_168245 ?auto_168246 ?auto_168247 ?auto_168248 ?auto_168249 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168254 - BLOCK
      ?auto_168255 - BLOCK
      ?auto_168256 - BLOCK
      ?auto_168257 - BLOCK
      ?auto_168258 - BLOCK
    )
    :vars
    (
      ?auto_168260 - BLOCK
      ?auto_168261 - BLOCK
      ?auto_168262 - BLOCK
      ?auto_168259 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168254 ?auto_168255 ) ) ( not ( = ?auto_168254 ?auto_168256 ) ) ( not ( = ?auto_168254 ?auto_168257 ) ) ( not ( = ?auto_168254 ?auto_168258 ) ) ( not ( = ?auto_168255 ?auto_168256 ) ) ( not ( = ?auto_168255 ?auto_168257 ) ) ( not ( = ?auto_168255 ?auto_168258 ) ) ( not ( = ?auto_168256 ?auto_168257 ) ) ( not ( = ?auto_168256 ?auto_168258 ) ) ( not ( = ?auto_168257 ?auto_168258 ) ) ( not ( = ?auto_168254 ?auto_168260 ) ) ( not ( = ?auto_168255 ?auto_168260 ) ) ( not ( = ?auto_168256 ?auto_168260 ) ) ( not ( = ?auto_168257 ?auto_168260 ) ) ( not ( = ?auto_168258 ?auto_168260 ) ) ( ON-TABLE ?auto_168261 ) ( ON ?auto_168262 ?auto_168261 ) ( ON ?auto_168260 ?auto_168262 ) ( not ( = ?auto_168261 ?auto_168262 ) ) ( not ( = ?auto_168261 ?auto_168260 ) ) ( not ( = ?auto_168261 ?auto_168258 ) ) ( not ( = ?auto_168261 ?auto_168257 ) ) ( not ( = ?auto_168262 ?auto_168260 ) ) ( not ( = ?auto_168262 ?auto_168258 ) ) ( not ( = ?auto_168262 ?auto_168257 ) ) ( not ( = ?auto_168254 ?auto_168261 ) ) ( not ( = ?auto_168254 ?auto_168262 ) ) ( not ( = ?auto_168255 ?auto_168261 ) ) ( not ( = ?auto_168255 ?auto_168262 ) ) ( not ( = ?auto_168256 ?auto_168261 ) ) ( not ( = ?auto_168256 ?auto_168262 ) ) ( ON ?auto_168254 ?auto_168259 ) ( not ( = ?auto_168254 ?auto_168259 ) ) ( not ( = ?auto_168255 ?auto_168259 ) ) ( not ( = ?auto_168256 ?auto_168259 ) ) ( not ( = ?auto_168257 ?auto_168259 ) ) ( not ( = ?auto_168258 ?auto_168259 ) ) ( not ( = ?auto_168260 ?auto_168259 ) ) ( not ( = ?auto_168261 ?auto_168259 ) ) ( not ( = ?auto_168262 ?auto_168259 ) ) ( ON ?auto_168255 ?auto_168254 ) ( ON-TABLE ?auto_168259 ) ( ON ?auto_168256 ?auto_168255 ) ( ON ?auto_168257 ?auto_168256 ) ( CLEAR ?auto_168260 ) ( ON ?auto_168258 ?auto_168257 ) ( CLEAR ?auto_168258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_168259 ?auto_168254 ?auto_168255 ?auto_168256 ?auto_168257 )
      ( MAKE-5PILE ?auto_168254 ?auto_168255 ?auto_168256 ?auto_168257 ?auto_168258 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168263 - BLOCK
      ?auto_168264 - BLOCK
      ?auto_168265 - BLOCK
      ?auto_168266 - BLOCK
      ?auto_168267 - BLOCK
    )
    :vars
    (
      ?auto_168271 - BLOCK
      ?auto_168270 - BLOCK
      ?auto_168269 - BLOCK
      ?auto_168268 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168263 ?auto_168264 ) ) ( not ( = ?auto_168263 ?auto_168265 ) ) ( not ( = ?auto_168263 ?auto_168266 ) ) ( not ( = ?auto_168263 ?auto_168267 ) ) ( not ( = ?auto_168264 ?auto_168265 ) ) ( not ( = ?auto_168264 ?auto_168266 ) ) ( not ( = ?auto_168264 ?auto_168267 ) ) ( not ( = ?auto_168265 ?auto_168266 ) ) ( not ( = ?auto_168265 ?auto_168267 ) ) ( not ( = ?auto_168266 ?auto_168267 ) ) ( not ( = ?auto_168263 ?auto_168271 ) ) ( not ( = ?auto_168264 ?auto_168271 ) ) ( not ( = ?auto_168265 ?auto_168271 ) ) ( not ( = ?auto_168266 ?auto_168271 ) ) ( not ( = ?auto_168267 ?auto_168271 ) ) ( ON-TABLE ?auto_168270 ) ( ON ?auto_168269 ?auto_168270 ) ( not ( = ?auto_168270 ?auto_168269 ) ) ( not ( = ?auto_168270 ?auto_168271 ) ) ( not ( = ?auto_168270 ?auto_168267 ) ) ( not ( = ?auto_168270 ?auto_168266 ) ) ( not ( = ?auto_168269 ?auto_168271 ) ) ( not ( = ?auto_168269 ?auto_168267 ) ) ( not ( = ?auto_168269 ?auto_168266 ) ) ( not ( = ?auto_168263 ?auto_168270 ) ) ( not ( = ?auto_168263 ?auto_168269 ) ) ( not ( = ?auto_168264 ?auto_168270 ) ) ( not ( = ?auto_168264 ?auto_168269 ) ) ( not ( = ?auto_168265 ?auto_168270 ) ) ( not ( = ?auto_168265 ?auto_168269 ) ) ( ON ?auto_168263 ?auto_168268 ) ( not ( = ?auto_168263 ?auto_168268 ) ) ( not ( = ?auto_168264 ?auto_168268 ) ) ( not ( = ?auto_168265 ?auto_168268 ) ) ( not ( = ?auto_168266 ?auto_168268 ) ) ( not ( = ?auto_168267 ?auto_168268 ) ) ( not ( = ?auto_168271 ?auto_168268 ) ) ( not ( = ?auto_168270 ?auto_168268 ) ) ( not ( = ?auto_168269 ?auto_168268 ) ) ( ON ?auto_168264 ?auto_168263 ) ( ON-TABLE ?auto_168268 ) ( ON ?auto_168265 ?auto_168264 ) ( ON ?auto_168266 ?auto_168265 ) ( ON ?auto_168267 ?auto_168266 ) ( CLEAR ?auto_168267 ) ( HOLDING ?auto_168271 ) ( CLEAR ?auto_168269 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_168270 ?auto_168269 ?auto_168271 )
      ( MAKE-5PILE ?auto_168263 ?auto_168264 ?auto_168265 ?auto_168266 ?auto_168267 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168272 - BLOCK
      ?auto_168273 - BLOCK
      ?auto_168274 - BLOCK
      ?auto_168275 - BLOCK
      ?auto_168276 - BLOCK
    )
    :vars
    (
      ?auto_168279 - BLOCK
      ?auto_168277 - BLOCK
      ?auto_168280 - BLOCK
      ?auto_168278 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168272 ?auto_168273 ) ) ( not ( = ?auto_168272 ?auto_168274 ) ) ( not ( = ?auto_168272 ?auto_168275 ) ) ( not ( = ?auto_168272 ?auto_168276 ) ) ( not ( = ?auto_168273 ?auto_168274 ) ) ( not ( = ?auto_168273 ?auto_168275 ) ) ( not ( = ?auto_168273 ?auto_168276 ) ) ( not ( = ?auto_168274 ?auto_168275 ) ) ( not ( = ?auto_168274 ?auto_168276 ) ) ( not ( = ?auto_168275 ?auto_168276 ) ) ( not ( = ?auto_168272 ?auto_168279 ) ) ( not ( = ?auto_168273 ?auto_168279 ) ) ( not ( = ?auto_168274 ?auto_168279 ) ) ( not ( = ?auto_168275 ?auto_168279 ) ) ( not ( = ?auto_168276 ?auto_168279 ) ) ( ON-TABLE ?auto_168277 ) ( ON ?auto_168280 ?auto_168277 ) ( not ( = ?auto_168277 ?auto_168280 ) ) ( not ( = ?auto_168277 ?auto_168279 ) ) ( not ( = ?auto_168277 ?auto_168276 ) ) ( not ( = ?auto_168277 ?auto_168275 ) ) ( not ( = ?auto_168280 ?auto_168279 ) ) ( not ( = ?auto_168280 ?auto_168276 ) ) ( not ( = ?auto_168280 ?auto_168275 ) ) ( not ( = ?auto_168272 ?auto_168277 ) ) ( not ( = ?auto_168272 ?auto_168280 ) ) ( not ( = ?auto_168273 ?auto_168277 ) ) ( not ( = ?auto_168273 ?auto_168280 ) ) ( not ( = ?auto_168274 ?auto_168277 ) ) ( not ( = ?auto_168274 ?auto_168280 ) ) ( ON ?auto_168272 ?auto_168278 ) ( not ( = ?auto_168272 ?auto_168278 ) ) ( not ( = ?auto_168273 ?auto_168278 ) ) ( not ( = ?auto_168274 ?auto_168278 ) ) ( not ( = ?auto_168275 ?auto_168278 ) ) ( not ( = ?auto_168276 ?auto_168278 ) ) ( not ( = ?auto_168279 ?auto_168278 ) ) ( not ( = ?auto_168277 ?auto_168278 ) ) ( not ( = ?auto_168280 ?auto_168278 ) ) ( ON ?auto_168273 ?auto_168272 ) ( ON-TABLE ?auto_168278 ) ( ON ?auto_168274 ?auto_168273 ) ( ON ?auto_168275 ?auto_168274 ) ( ON ?auto_168276 ?auto_168275 ) ( CLEAR ?auto_168280 ) ( ON ?auto_168279 ?auto_168276 ) ( CLEAR ?auto_168279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_168278 ?auto_168272 ?auto_168273 ?auto_168274 ?auto_168275 ?auto_168276 )
      ( MAKE-5PILE ?auto_168272 ?auto_168273 ?auto_168274 ?auto_168275 ?auto_168276 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168281 - BLOCK
      ?auto_168282 - BLOCK
      ?auto_168283 - BLOCK
      ?auto_168284 - BLOCK
      ?auto_168285 - BLOCK
    )
    :vars
    (
      ?auto_168286 - BLOCK
      ?auto_168287 - BLOCK
      ?auto_168288 - BLOCK
      ?auto_168289 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168281 ?auto_168282 ) ) ( not ( = ?auto_168281 ?auto_168283 ) ) ( not ( = ?auto_168281 ?auto_168284 ) ) ( not ( = ?auto_168281 ?auto_168285 ) ) ( not ( = ?auto_168282 ?auto_168283 ) ) ( not ( = ?auto_168282 ?auto_168284 ) ) ( not ( = ?auto_168282 ?auto_168285 ) ) ( not ( = ?auto_168283 ?auto_168284 ) ) ( not ( = ?auto_168283 ?auto_168285 ) ) ( not ( = ?auto_168284 ?auto_168285 ) ) ( not ( = ?auto_168281 ?auto_168286 ) ) ( not ( = ?auto_168282 ?auto_168286 ) ) ( not ( = ?auto_168283 ?auto_168286 ) ) ( not ( = ?auto_168284 ?auto_168286 ) ) ( not ( = ?auto_168285 ?auto_168286 ) ) ( ON-TABLE ?auto_168287 ) ( not ( = ?auto_168287 ?auto_168288 ) ) ( not ( = ?auto_168287 ?auto_168286 ) ) ( not ( = ?auto_168287 ?auto_168285 ) ) ( not ( = ?auto_168287 ?auto_168284 ) ) ( not ( = ?auto_168288 ?auto_168286 ) ) ( not ( = ?auto_168288 ?auto_168285 ) ) ( not ( = ?auto_168288 ?auto_168284 ) ) ( not ( = ?auto_168281 ?auto_168287 ) ) ( not ( = ?auto_168281 ?auto_168288 ) ) ( not ( = ?auto_168282 ?auto_168287 ) ) ( not ( = ?auto_168282 ?auto_168288 ) ) ( not ( = ?auto_168283 ?auto_168287 ) ) ( not ( = ?auto_168283 ?auto_168288 ) ) ( ON ?auto_168281 ?auto_168289 ) ( not ( = ?auto_168281 ?auto_168289 ) ) ( not ( = ?auto_168282 ?auto_168289 ) ) ( not ( = ?auto_168283 ?auto_168289 ) ) ( not ( = ?auto_168284 ?auto_168289 ) ) ( not ( = ?auto_168285 ?auto_168289 ) ) ( not ( = ?auto_168286 ?auto_168289 ) ) ( not ( = ?auto_168287 ?auto_168289 ) ) ( not ( = ?auto_168288 ?auto_168289 ) ) ( ON ?auto_168282 ?auto_168281 ) ( ON-TABLE ?auto_168289 ) ( ON ?auto_168283 ?auto_168282 ) ( ON ?auto_168284 ?auto_168283 ) ( ON ?auto_168285 ?auto_168284 ) ( ON ?auto_168286 ?auto_168285 ) ( CLEAR ?auto_168286 ) ( HOLDING ?auto_168288 ) ( CLEAR ?auto_168287 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_168287 ?auto_168288 )
      ( MAKE-5PILE ?auto_168281 ?auto_168282 ?auto_168283 ?auto_168284 ?auto_168285 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168290 - BLOCK
      ?auto_168291 - BLOCK
      ?auto_168292 - BLOCK
      ?auto_168293 - BLOCK
      ?auto_168294 - BLOCK
    )
    :vars
    (
      ?auto_168297 - BLOCK
      ?auto_168298 - BLOCK
      ?auto_168295 - BLOCK
      ?auto_168296 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168290 ?auto_168291 ) ) ( not ( = ?auto_168290 ?auto_168292 ) ) ( not ( = ?auto_168290 ?auto_168293 ) ) ( not ( = ?auto_168290 ?auto_168294 ) ) ( not ( = ?auto_168291 ?auto_168292 ) ) ( not ( = ?auto_168291 ?auto_168293 ) ) ( not ( = ?auto_168291 ?auto_168294 ) ) ( not ( = ?auto_168292 ?auto_168293 ) ) ( not ( = ?auto_168292 ?auto_168294 ) ) ( not ( = ?auto_168293 ?auto_168294 ) ) ( not ( = ?auto_168290 ?auto_168297 ) ) ( not ( = ?auto_168291 ?auto_168297 ) ) ( not ( = ?auto_168292 ?auto_168297 ) ) ( not ( = ?auto_168293 ?auto_168297 ) ) ( not ( = ?auto_168294 ?auto_168297 ) ) ( ON-TABLE ?auto_168298 ) ( not ( = ?auto_168298 ?auto_168295 ) ) ( not ( = ?auto_168298 ?auto_168297 ) ) ( not ( = ?auto_168298 ?auto_168294 ) ) ( not ( = ?auto_168298 ?auto_168293 ) ) ( not ( = ?auto_168295 ?auto_168297 ) ) ( not ( = ?auto_168295 ?auto_168294 ) ) ( not ( = ?auto_168295 ?auto_168293 ) ) ( not ( = ?auto_168290 ?auto_168298 ) ) ( not ( = ?auto_168290 ?auto_168295 ) ) ( not ( = ?auto_168291 ?auto_168298 ) ) ( not ( = ?auto_168291 ?auto_168295 ) ) ( not ( = ?auto_168292 ?auto_168298 ) ) ( not ( = ?auto_168292 ?auto_168295 ) ) ( ON ?auto_168290 ?auto_168296 ) ( not ( = ?auto_168290 ?auto_168296 ) ) ( not ( = ?auto_168291 ?auto_168296 ) ) ( not ( = ?auto_168292 ?auto_168296 ) ) ( not ( = ?auto_168293 ?auto_168296 ) ) ( not ( = ?auto_168294 ?auto_168296 ) ) ( not ( = ?auto_168297 ?auto_168296 ) ) ( not ( = ?auto_168298 ?auto_168296 ) ) ( not ( = ?auto_168295 ?auto_168296 ) ) ( ON ?auto_168291 ?auto_168290 ) ( ON-TABLE ?auto_168296 ) ( ON ?auto_168292 ?auto_168291 ) ( ON ?auto_168293 ?auto_168292 ) ( ON ?auto_168294 ?auto_168293 ) ( ON ?auto_168297 ?auto_168294 ) ( CLEAR ?auto_168298 ) ( ON ?auto_168295 ?auto_168297 ) ( CLEAR ?auto_168295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_168296 ?auto_168290 ?auto_168291 ?auto_168292 ?auto_168293 ?auto_168294 ?auto_168297 )
      ( MAKE-5PILE ?auto_168290 ?auto_168291 ?auto_168292 ?auto_168293 ?auto_168294 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168299 - BLOCK
      ?auto_168300 - BLOCK
      ?auto_168301 - BLOCK
      ?auto_168302 - BLOCK
      ?auto_168303 - BLOCK
    )
    :vars
    (
      ?auto_168304 - BLOCK
      ?auto_168306 - BLOCK
      ?auto_168307 - BLOCK
      ?auto_168305 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168299 ?auto_168300 ) ) ( not ( = ?auto_168299 ?auto_168301 ) ) ( not ( = ?auto_168299 ?auto_168302 ) ) ( not ( = ?auto_168299 ?auto_168303 ) ) ( not ( = ?auto_168300 ?auto_168301 ) ) ( not ( = ?auto_168300 ?auto_168302 ) ) ( not ( = ?auto_168300 ?auto_168303 ) ) ( not ( = ?auto_168301 ?auto_168302 ) ) ( not ( = ?auto_168301 ?auto_168303 ) ) ( not ( = ?auto_168302 ?auto_168303 ) ) ( not ( = ?auto_168299 ?auto_168304 ) ) ( not ( = ?auto_168300 ?auto_168304 ) ) ( not ( = ?auto_168301 ?auto_168304 ) ) ( not ( = ?auto_168302 ?auto_168304 ) ) ( not ( = ?auto_168303 ?auto_168304 ) ) ( not ( = ?auto_168306 ?auto_168307 ) ) ( not ( = ?auto_168306 ?auto_168304 ) ) ( not ( = ?auto_168306 ?auto_168303 ) ) ( not ( = ?auto_168306 ?auto_168302 ) ) ( not ( = ?auto_168307 ?auto_168304 ) ) ( not ( = ?auto_168307 ?auto_168303 ) ) ( not ( = ?auto_168307 ?auto_168302 ) ) ( not ( = ?auto_168299 ?auto_168306 ) ) ( not ( = ?auto_168299 ?auto_168307 ) ) ( not ( = ?auto_168300 ?auto_168306 ) ) ( not ( = ?auto_168300 ?auto_168307 ) ) ( not ( = ?auto_168301 ?auto_168306 ) ) ( not ( = ?auto_168301 ?auto_168307 ) ) ( ON ?auto_168299 ?auto_168305 ) ( not ( = ?auto_168299 ?auto_168305 ) ) ( not ( = ?auto_168300 ?auto_168305 ) ) ( not ( = ?auto_168301 ?auto_168305 ) ) ( not ( = ?auto_168302 ?auto_168305 ) ) ( not ( = ?auto_168303 ?auto_168305 ) ) ( not ( = ?auto_168304 ?auto_168305 ) ) ( not ( = ?auto_168306 ?auto_168305 ) ) ( not ( = ?auto_168307 ?auto_168305 ) ) ( ON ?auto_168300 ?auto_168299 ) ( ON-TABLE ?auto_168305 ) ( ON ?auto_168301 ?auto_168300 ) ( ON ?auto_168302 ?auto_168301 ) ( ON ?auto_168303 ?auto_168302 ) ( ON ?auto_168304 ?auto_168303 ) ( ON ?auto_168307 ?auto_168304 ) ( CLEAR ?auto_168307 ) ( HOLDING ?auto_168306 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_168306 )
      ( MAKE-5PILE ?auto_168299 ?auto_168300 ?auto_168301 ?auto_168302 ?auto_168303 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168308 - BLOCK
      ?auto_168309 - BLOCK
      ?auto_168310 - BLOCK
      ?auto_168311 - BLOCK
      ?auto_168312 - BLOCK
    )
    :vars
    (
      ?auto_168313 - BLOCK
      ?auto_168315 - BLOCK
      ?auto_168316 - BLOCK
      ?auto_168314 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168308 ?auto_168309 ) ) ( not ( = ?auto_168308 ?auto_168310 ) ) ( not ( = ?auto_168308 ?auto_168311 ) ) ( not ( = ?auto_168308 ?auto_168312 ) ) ( not ( = ?auto_168309 ?auto_168310 ) ) ( not ( = ?auto_168309 ?auto_168311 ) ) ( not ( = ?auto_168309 ?auto_168312 ) ) ( not ( = ?auto_168310 ?auto_168311 ) ) ( not ( = ?auto_168310 ?auto_168312 ) ) ( not ( = ?auto_168311 ?auto_168312 ) ) ( not ( = ?auto_168308 ?auto_168313 ) ) ( not ( = ?auto_168309 ?auto_168313 ) ) ( not ( = ?auto_168310 ?auto_168313 ) ) ( not ( = ?auto_168311 ?auto_168313 ) ) ( not ( = ?auto_168312 ?auto_168313 ) ) ( not ( = ?auto_168315 ?auto_168316 ) ) ( not ( = ?auto_168315 ?auto_168313 ) ) ( not ( = ?auto_168315 ?auto_168312 ) ) ( not ( = ?auto_168315 ?auto_168311 ) ) ( not ( = ?auto_168316 ?auto_168313 ) ) ( not ( = ?auto_168316 ?auto_168312 ) ) ( not ( = ?auto_168316 ?auto_168311 ) ) ( not ( = ?auto_168308 ?auto_168315 ) ) ( not ( = ?auto_168308 ?auto_168316 ) ) ( not ( = ?auto_168309 ?auto_168315 ) ) ( not ( = ?auto_168309 ?auto_168316 ) ) ( not ( = ?auto_168310 ?auto_168315 ) ) ( not ( = ?auto_168310 ?auto_168316 ) ) ( ON ?auto_168308 ?auto_168314 ) ( not ( = ?auto_168308 ?auto_168314 ) ) ( not ( = ?auto_168309 ?auto_168314 ) ) ( not ( = ?auto_168310 ?auto_168314 ) ) ( not ( = ?auto_168311 ?auto_168314 ) ) ( not ( = ?auto_168312 ?auto_168314 ) ) ( not ( = ?auto_168313 ?auto_168314 ) ) ( not ( = ?auto_168315 ?auto_168314 ) ) ( not ( = ?auto_168316 ?auto_168314 ) ) ( ON ?auto_168309 ?auto_168308 ) ( ON-TABLE ?auto_168314 ) ( ON ?auto_168310 ?auto_168309 ) ( ON ?auto_168311 ?auto_168310 ) ( ON ?auto_168312 ?auto_168311 ) ( ON ?auto_168313 ?auto_168312 ) ( ON ?auto_168316 ?auto_168313 ) ( ON ?auto_168315 ?auto_168316 ) ( CLEAR ?auto_168315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_168314 ?auto_168308 ?auto_168309 ?auto_168310 ?auto_168311 ?auto_168312 ?auto_168313 ?auto_168316 )
      ( MAKE-5PILE ?auto_168308 ?auto_168309 ?auto_168310 ?auto_168311 ?auto_168312 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_168332 - BLOCK
      ?auto_168333 - BLOCK
    )
    :vars
    (
      ?auto_168336 - BLOCK
      ?auto_168334 - BLOCK
      ?auto_168335 - BLOCK
      ?auto_168339 - BLOCK
      ?auto_168338 - BLOCK
      ?auto_168337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168336 ?auto_168333 ) ( ON-TABLE ?auto_168332 ) ( ON ?auto_168333 ?auto_168332 ) ( not ( = ?auto_168332 ?auto_168333 ) ) ( not ( = ?auto_168332 ?auto_168336 ) ) ( not ( = ?auto_168333 ?auto_168336 ) ) ( not ( = ?auto_168332 ?auto_168334 ) ) ( not ( = ?auto_168332 ?auto_168335 ) ) ( not ( = ?auto_168333 ?auto_168334 ) ) ( not ( = ?auto_168333 ?auto_168335 ) ) ( not ( = ?auto_168336 ?auto_168334 ) ) ( not ( = ?auto_168336 ?auto_168335 ) ) ( not ( = ?auto_168334 ?auto_168335 ) ) ( ON ?auto_168334 ?auto_168336 ) ( CLEAR ?auto_168334 ) ( HOLDING ?auto_168335 ) ( CLEAR ?auto_168339 ) ( ON-TABLE ?auto_168338 ) ( ON ?auto_168337 ?auto_168338 ) ( ON ?auto_168339 ?auto_168337 ) ( not ( = ?auto_168338 ?auto_168337 ) ) ( not ( = ?auto_168338 ?auto_168339 ) ) ( not ( = ?auto_168338 ?auto_168335 ) ) ( not ( = ?auto_168337 ?auto_168339 ) ) ( not ( = ?auto_168337 ?auto_168335 ) ) ( not ( = ?auto_168339 ?auto_168335 ) ) ( not ( = ?auto_168332 ?auto_168339 ) ) ( not ( = ?auto_168332 ?auto_168338 ) ) ( not ( = ?auto_168332 ?auto_168337 ) ) ( not ( = ?auto_168333 ?auto_168339 ) ) ( not ( = ?auto_168333 ?auto_168338 ) ) ( not ( = ?auto_168333 ?auto_168337 ) ) ( not ( = ?auto_168336 ?auto_168339 ) ) ( not ( = ?auto_168336 ?auto_168338 ) ) ( not ( = ?auto_168336 ?auto_168337 ) ) ( not ( = ?auto_168334 ?auto_168339 ) ) ( not ( = ?auto_168334 ?auto_168338 ) ) ( not ( = ?auto_168334 ?auto_168337 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_168338 ?auto_168337 ?auto_168339 ?auto_168335 )
      ( MAKE-2PILE ?auto_168332 ?auto_168333 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_168340 - BLOCK
      ?auto_168341 - BLOCK
    )
    :vars
    (
      ?auto_168346 - BLOCK
      ?auto_168344 - BLOCK
      ?auto_168343 - BLOCK
      ?auto_168345 - BLOCK
      ?auto_168342 - BLOCK
      ?auto_168347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168346 ?auto_168341 ) ( ON-TABLE ?auto_168340 ) ( ON ?auto_168341 ?auto_168340 ) ( not ( = ?auto_168340 ?auto_168341 ) ) ( not ( = ?auto_168340 ?auto_168346 ) ) ( not ( = ?auto_168341 ?auto_168346 ) ) ( not ( = ?auto_168340 ?auto_168344 ) ) ( not ( = ?auto_168340 ?auto_168343 ) ) ( not ( = ?auto_168341 ?auto_168344 ) ) ( not ( = ?auto_168341 ?auto_168343 ) ) ( not ( = ?auto_168346 ?auto_168344 ) ) ( not ( = ?auto_168346 ?auto_168343 ) ) ( not ( = ?auto_168344 ?auto_168343 ) ) ( ON ?auto_168344 ?auto_168346 ) ( CLEAR ?auto_168345 ) ( ON-TABLE ?auto_168342 ) ( ON ?auto_168347 ?auto_168342 ) ( ON ?auto_168345 ?auto_168347 ) ( not ( = ?auto_168342 ?auto_168347 ) ) ( not ( = ?auto_168342 ?auto_168345 ) ) ( not ( = ?auto_168342 ?auto_168343 ) ) ( not ( = ?auto_168347 ?auto_168345 ) ) ( not ( = ?auto_168347 ?auto_168343 ) ) ( not ( = ?auto_168345 ?auto_168343 ) ) ( not ( = ?auto_168340 ?auto_168345 ) ) ( not ( = ?auto_168340 ?auto_168342 ) ) ( not ( = ?auto_168340 ?auto_168347 ) ) ( not ( = ?auto_168341 ?auto_168345 ) ) ( not ( = ?auto_168341 ?auto_168342 ) ) ( not ( = ?auto_168341 ?auto_168347 ) ) ( not ( = ?auto_168346 ?auto_168345 ) ) ( not ( = ?auto_168346 ?auto_168342 ) ) ( not ( = ?auto_168346 ?auto_168347 ) ) ( not ( = ?auto_168344 ?auto_168345 ) ) ( not ( = ?auto_168344 ?auto_168342 ) ) ( not ( = ?auto_168344 ?auto_168347 ) ) ( ON ?auto_168343 ?auto_168344 ) ( CLEAR ?auto_168343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_168340 ?auto_168341 ?auto_168346 ?auto_168344 )
      ( MAKE-2PILE ?auto_168340 ?auto_168341 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_168348 - BLOCK
      ?auto_168349 - BLOCK
    )
    :vars
    (
      ?auto_168354 - BLOCK
      ?auto_168355 - BLOCK
      ?auto_168351 - BLOCK
      ?auto_168353 - BLOCK
      ?auto_168350 - BLOCK
      ?auto_168352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168354 ?auto_168349 ) ( ON-TABLE ?auto_168348 ) ( ON ?auto_168349 ?auto_168348 ) ( not ( = ?auto_168348 ?auto_168349 ) ) ( not ( = ?auto_168348 ?auto_168354 ) ) ( not ( = ?auto_168349 ?auto_168354 ) ) ( not ( = ?auto_168348 ?auto_168355 ) ) ( not ( = ?auto_168348 ?auto_168351 ) ) ( not ( = ?auto_168349 ?auto_168355 ) ) ( not ( = ?auto_168349 ?auto_168351 ) ) ( not ( = ?auto_168354 ?auto_168355 ) ) ( not ( = ?auto_168354 ?auto_168351 ) ) ( not ( = ?auto_168355 ?auto_168351 ) ) ( ON ?auto_168355 ?auto_168354 ) ( ON-TABLE ?auto_168353 ) ( ON ?auto_168350 ?auto_168353 ) ( not ( = ?auto_168353 ?auto_168350 ) ) ( not ( = ?auto_168353 ?auto_168352 ) ) ( not ( = ?auto_168353 ?auto_168351 ) ) ( not ( = ?auto_168350 ?auto_168352 ) ) ( not ( = ?auto_168350 ?auto_168351 ) ) ( not ( = ?auto_168352 ?auto_168351 ) ) ( not ( = ?auto_168348 ?auto_168352 ) ) ( not ( = ?auto_168348 ?auto_168353 ) ) ( not ( = ?auto_168348 ?auto_168350 ) ) ( not ( = ?auto_168349 ?auto_168352 ) ) ( not ( = ?auto_168349 ?auto_168353 ) ) ( not ( = ?auto_168349 ?auto_168350 ) ) ( not ( = ?auto_168354 ?auto_168352 ) ) ( not ( = ?auto_168354 ?auto_168353 ) ) ( not ( = ?auto_168354 ?auto_168350 ) ) ( not ( = ?auto_168355 ?auto_168352 ) ) ( not ( = ?auto_168355 ?auto_168353 ) ) ( not ( = ?auto_168355 ?auto_168350 ) ) ( ON ?auto_168351 ?auto_168355 ) ( CLEAR ?auto_168351 ) ( HOLDING ?auto_168352 ) ( CLEAR ?auto_168350 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_168353 ?auto_168350 ?auto_168352 )
      ( MAKE-2PILE ?auto_168348 ?auto_168349 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_168356 - BLOCK
      ?auto_168357 - BLOCK
    )
    :vars
    (
      ?auto_168361 - BLOCK
      ?auto_168360 - BLOCK
      ?auto_168362 - BLOCK
      ?auto_168358 - BLOCK
      ?auto_168363 - BLOCK
      ?auto_168359 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168361 ?auto_168357 ) ( ON-TABLE ?auto_168356 ) ( ON ?auto_168357 ?auto_168356 ) ( not ( = ?auto_168356 ?auto_168357 ) ) ( not ( = ?auto_168356 ?auto_168361 ) ) ( not ( = ?auto_168357 ?auto_168361 ) ) ( not ( = ?auto_168356 ?auto_168360 ) ) ( not ( = ?auto_168356 ?auto_168362 ) ) ( not ( = ?auto_168357 ?auto_168360 ) ) ( not ( = ?auto_168357 ?auto_168362 ) ) ( not ( = ?auto_168361 ?auto_168360 ) ) ( not ( = ?auto_168361 ?auto_168362 ) ) ( not ( = ?auto_168360 ?auto_168362 ) ) ( ON ?auto_168360 ?auto_168361 ) ( ON-TABLE ?auto_168358 ) ( ON ?auto_168363 ?auto_168358 ) ( not ( = ?auto_168358 ?auto_168363 ) ) ( not ( = ?auto_168358 ?auto_168359 ) ) ( not ( = ?auto_168358 ?auto_168362 ) ) ( not ( = ?auto_168363 ?auto_168359 ) ) ( not ( = ?auto_168363 ?auto_168362 ) ) ( not ( = ?auto_168359 ?auto_168362 ) ) ( not ( = ?auto_168356 ?auto_168359 ) ) ( not ( = ?auto_168356 ?auto_168358 ) ) ( not ( = ?auto_168356 ?auto_168363 ) ) ( not ( = ?auto_168357 ?auto_168359 ) ) ( not ( = ?auto_168357 ?auto_168358 ) ) ( not ( = ?auto_168357 ?auto_168363 ) ) ( not ( = ?auto_168361 ?auto_168359 ) ) ( not ( = ?auto_168361 ?auto_168358 ) ) ( not ( = ?auto_168361 ?auto_168363 ) ) ( not ( = ?auto_168360 ?auto_168359 ) ) ( not ( = ?auto_168360 ?auto_168358 ) ) ( not ( = ?auto_168360 ?auto_168363 ) ) ( ON ?auto_168362 ?auto_168360 ) ( CLEAR ?auto_168363 ) ( ON ?auto_168359 ?auto_168362 ) ( CLEAR ?auto_168359 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_168356 ?auto_168357 ?auto_168361 ?auto_168360 ?auto_168362 )
      ( MAKE-2PILE ?auto_168356 ?auto_168357 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_168364 - BLOCK
      ?auto_168365 - BLOCK
    )
    :vars
    (
      ?auto_168368 - BLOCK
      ?auto_168366 - BLOCK
      ?auto_168370 - BLOCK
      ?auto_168369 - BLOCK
      ?auto_168371 - BLOCK
      ?auto_168367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168368 ?auto_168365 ) ( ON-TABLE ?auto_168364 ) ( ON ?auto_168365 ?auto_168364 ) ( not ( = ?auto_168364 ?auto_168365 ) ) ( not ( = ?auto_168364 ?auto_168368 ) ) ( not ( = ?auto_168365 ?auto_168368 ) ) ( not ( = ?auto_168364 ?auto_168366 ) ) ( not ( = ?auto_168364 ?auto_168370 ) ) ( not ( = ?auto_168365 ?auto_168366 ) ) ( not ( = ?auto_168365 ?auto_168370 ) ) ( not ( = ?auto_168368 ?auto_168366 ) ) ( not ( = ?auto_168368 ?auto_168370 ) ) ( not ( = ?auto_168366 ?auto_168370 ) ) ( ON ?auto_168366 ?auto_168368 ) ( ON-TABLE ?auto_168369 ) ( not ( = ?auto_168369 ?auto_168371 ) ) ( not ( = ?auto_168369 ?auto_168367 ) ) ( not ( = ?auto_168369 ?auto_168370 ) ) ( not ( = ?auto_168371 ?auto_168367 ) ) ( not ( = ?auto_168371 ?auto_168370 ) ) ( not ( = ?auto_168367 ?auto_168370 ) ) ( not ( = ?auto_168364 ?auto_168367 ) ) ( not ( = ?auto_168364 ?auto_168369 ) ) ( not ( = ?auto_168364 ?auto_168371 ) ) ( not ( = ?auto_168365 ?auto_168367 ) ) ( not ( = ?auto_168365 ?auto_168369 ) ) ( not ( = ?auto_168365 ?auto_168371 ) ) ( not ( = ?auto_168368 ?auto_168367 ) ) ( not ( = ?auto_168368 ?auto_168369 ) ) ( not ( = ?auto_168368 ?auto_168371 ) ) ( not ( = ?auto_168366 ?auto_168367 ) ) ( not ( = ?auto_168366 ?auto_168369 ) ) ( not ( = ?auto_168366 ?auto_168371 ) ) ( ON ?auto_168370 ?auto_168366 ) ( ON ?auto_168367 ?auto_168370 ) ( CLEAR ?auto_168367 ) ( HOLDING ?auto_168371 ) ( CLEAR ?auto_168369 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_168369 ?auto_168371 )
      ( MAKE-2PILE ?auto_168364 ?auto_168365 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_168372 - BLOCK
      ?auto_168373 - BLOCK
    )
    :vars
    (
      ?auto_168374 - BLOCK
      ?auto_168377 - BLOCK
      ?auto_168375 - BLOCK
      ?auto_168378 - BLOCK
      ?auto_168376 - BLOCK
      ?auto_168379 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168374 ?auto_168373 ) ( ON-TABLE ?auto_168372 ) ( ON ?auto_168373 ?auto_168372 ) ( not ( = ?auto_168372 ?auto_168373 ) ) ( not ( = ?auto_168372 ?auto_168374 ) ) ( not ( = ?auto_168373 ?auto_168374 ) ) ( not ( = ?auto_168372 ?auto_168377 ) ) ( not ( = ?auto_168372 ?auto_168375 ) ) ( not ( = ?auto_168373 ?auto_168377 ) ) ( not ( = ?auto_168373 ?auto_168375 ) ) ( not ( = ?auto_168374 ?auto_168377 ) ) ( not ( = ?auto_168374 ?auto_168375 ) ) ( not ( = ?auto_168377 ?auto_168375 ) ) ( ON ?auto_168377 ?auto_168374 ) ( ON-TABLE ?auto_168378 ) ( not ( = ?auto_168378 ?auto_168376 ) ) ( not ( = ?auto_168378 ?auto_168379 ) ) ( not ( = ?auto_168378 ?auto_168375 ) ) ( not ( = ?auto_168376 ?auto_168379 ) ) ( not ( = ?auto_168376 ?auto_168375 ) ) ( not ( = ?auto_168379 ?auto_168375 ) ) ( not ( = ?auto_168372 ?auto_168379 ) ) ( not ( = ?auto_168372 ?auto_168378 ) ) ( not ( = ?auto_168372 ?auto_168376 ) ) ( not ( = ?auto_168373 ?auto_168379 ) ) ( not ( = ?auto_168373 ?auto_168378 ) ) ( not ( = ?auto_168373 ?auto_168376 ) ) ( not ( = ?auto_168374 ?auto_168379 ) ) ( not ( = ?auto_168374 ?auto_168378 ) ) ( not ( = ?auto_168374 ?auto_168376 ) ) ( not ( = ?auto_168377 ?auto_168379 ) ) ( not ( = ?auto_168377 ?auto_168378 ) ) ( not ( = ?auto_168377 ?auto_168376 ) ) ( ON ?auto_168375 ?auto_168377 ) ( ON ?auto_168379 ?auto_168375 ) ( CLEAR ?auto_168378 ) ( ON ?auto_168376 ?auto_168379 ) ( CLEAR ?auto_168376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_168372 ?auto_168373 ?auto_168374 ?auto_168377 ?auto_168375 ?auto_168379 )
      ( MAKE-2PILE ?auto_168372 ?auto_168373 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_168380 - BLOCK
      ?auto_168381 - BLOCK
    )
    :vars
    (
      ?auto_168384 - BLOCK
      ?auto_168383 - BLOCK
      ?auto_168386 - BLOCK
      ?auto_168382 - BLOCK
      ?auto_168387 - BLOCK
      ?auto_168385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168384 ?auto_168381 ) ( ON-TABLE ?auto_168380 ) ( ON ?auto_168381 ?auto_168380 ) ( not ( = ?auto_168380 ?auto_168381 ) ) ( not ( = ?auto_168380 ?auto_168384 ) ) ( not ( = ?auto_168381 ?auto_168384 ) ) ( not ( = ?auto_168380 ?auto_168383 ) ) ( not ( = ?auto_168380 ?auto_168386 ) ) ( not ( = ?auto_168381 ?auto_168383 ) ) ( not ( = ?auto_168381 ?auto_168386 ) ) ( not ( = ?auto_168384 ?auto_168383 ) ) ( not ( = ?auto_168384 ?auto_168386 ) ) ( not ( = ?auto_168383 ?auto_168386 ) ) ( ON ?auto_168383 ?auto_168384 ) ( not ( = ?auto_168382 ?auto_168387 ) ) ( not ( = ?auto_168382 ?auto_168385 ) ) ( not ( = ?auto_168382 ?auto_168386 ) ) ( not ( = ?auto_168387 ?auto_168385 ) ) ( not ( = ?auto_168387 ?auto_168386 ) ) ( not ( = ?auto_168385 ?auto_168386 ) ) ( not ( = ?auto_168380 ?auto_168385 ) ) ( not ( = ?auto_168380 ?auto_168382 ) ) ( not ( = ?auto_168380 ?auto_168387 ) ) ( not ( = ?auto_168381 ?auto_168385 ) ) ( not ( = ?auto_168381 ?auto_168382 ) ) ( not ( = ?auto_168381 ?auto_168387 ) ) ( not ( = ?auto_168384 ?auto_168385 ) ) ( not ( = ?auto_168384 ?auto_168382 ) ) ( not ( = ?auto_168384 ?auto_168387 ) ) ( not ( = ?auto_168383 ?auto_168385 ) ) ( not ( = ?auto_168383 ?auto_168382 ) ) ( not ( = ?auto_168383 ?auto_168387 ) ) ( ON ?auto_168386 ?auto_168383 ) ( ON ?auto_168385 ?auto_168386 ) ( ON ?auto_168387 ?auto_168385 ) ( CLEAR ?auto_168387 ) ( HOLDING ?auto_168382 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_168382 )
      ( MAKE-2PILE ?auto_168380 ?auto_168381 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_168398 - BLOCK
      ?auto_168399 - BLOCK
    )
    :vars
    (
      ?auto_168403 - BLOCK
      ?auto_168401 - BLOCK
      ?auto_168400 - BLOCK
      ?auto_168404 - BLOCK
      ?auto_168405 - BLOCK
      ?auto_168402 - BLOCK
      ?auto_168406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168403 ?auto_168399 ) ( ON-TABLE ?auto_168398 ) ( ON ?auto_168399 ?auto_168398 ) ( not ( = ?auto_168398 ?auto_168399 ) ) ( not ( = ?auto_168398 ?auto_168403 ) ) ( not ( = ?auto_168399 ?auto_168403 ) ) ( not ( = ?auto_168398 ?auto_168401 ) ) ( not ( = ?auto_168398 ?auto_168400 ) ) ( not ( = ?auto_168399 ?auto_168401 ) ) ( not ( = ?auto_168399 ?auto_168400 ) ) ( not ( = ?auto_168403 ?auto_168401 ) ) ( not ( = ?auto_168403 ?auto_168400 ) ) ( not ( = ?auto_168401 ?auto_168400 ) ) ( ON ?auto_168401 ?auto_168403 ) ( not ( = ?auto_168404 ?auto_168405 ) ) ( not ( = ?auto_168404 ?auto_168402 ) ) ( not ( = ?auto_168404 ?auto_168400 ) ) ( not ( = ?auto_168405 ?auto_168402 ) ) ( not ( = ?auto_168405 ?auto_168400 ) ) ( not ( = ?auto_168402 ?auto_168400 ) ) ( not ( = ?auto_168398 ?auto_168402 ) ) ( not ( = ?auto_168398 ?auto_168404 ) ) ( not ( = ?auto_168398 ?auto_168405 ) ) ( not ( = ?auto_168399 ?auto_168402 ) ) ( not ( = ?auto_168399 ?auto_168404 ) ) ( not ( = ?auto_168399 ?auto_168405 ) ) ( not ( = ?auto_168403 ?auto_168402 ) ) ( not ( = ?auto_168403 ?auto_168404 ) ) ( not ( = ?auto_168403 ?auto_168405 ) ) ( not ( = ?auto_168401 ?auto_168402 ) ) ( not ( = ?auto_168401 ?auto_168404 ) ) ( not ( = ?auto_168401 ?auto_168405 ) ) ( ON ?auto_168400 ?auto_168401 ) ( ON ?auto_168402 ?auto_168400 ) ( ON ?auto_168405 ?auto_168402 ) ( CLEAR ?auto_168405 ) ( ON ?auto_168404 ?auto_168406 ) ( CLEAR ?auto_168404 ) ( HAND-EMPTY ) ( not ( = ?auto_168398 ?auto_168406 ) ) ( not ( = ?auto_168399 ?auto_168406 ) ) ( not ( = ?auto_168403 ?auto_168406 ) ) ( not ( = ?auto_168401 ?auto_168406 ) ) ( not ( = ?auto_168400 ?auto_168406 ) ) ( not ( = ?auto_168404 ?auto_168406 ) ) ( not ( = ?auto_168405 ?auto_168406 ) ) ( not ( = ?auto_168402 ?auto_168406 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_168404 ?auto_168406 )
      ( MAKE-2PILE ?auto_168398 ?auto_168399 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_168407 - BLOCK
      ?auto_168408 - BLOCK
    )
    :vars
    (
      ?auto_168410 - BLOCK
      ?auto_168412 - BLOCK
      ?auto_168411 - BLOCK
      ?auto_168409 - BLOCK
      ?auto_168414 - BLOCK
      ?auto_168415 - BLOCK
      ?auto_168413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168410 ?auto_168408 ) ( ON-TABLE ?auto_168407 ) ( ON ?auto_168408 ?auto_168407 ) ( not ( = ?auto_168407 ?auto_168408 ) ) ( not ( = ?auto_168407 ?auto_168410 ) ) ( not ( = ?auto_168408 ?auto_168410 ) ) ( not ( = ?auto_168407 ?auto_168412 ) ) ( not ( = ?auto_168407 ?auto_168411 ) ) ( not ( = ?auto_168408 ?auto_168412 ) ) ( not ( = ?auto_168408 ?auto_168411 ) ) ( not ( = ?auto_168410 ?auto_168412 ) ) ( not ( = ?auto_168410 ?auto_168411 ) ) ( not ( = ?auto_168412 ?auto_168411 ) ) ( ON ?auto_168412 ?auto_168410 ) ( not ( = ?auto_168409 ?auto_168414 ) ) ( not ( = ?auto_168409 ?auto_168415 ) ) ( not ( = ?auto_168409 ?auto_168411 ) ) ( not ( = ?auto_168414 ?auto_168415 ) ) ( not ( = ?auto_168414 ?auto_168411 ) ) ( not ( = ?auto_168415 ?auto_168411 ) ) ( not ( = ?auto_168407 ?auto_168415 ) ) ( not ( = ?auto_168407 ?auto_168409 ) ) ( not ( = ?auto_168407 ?auto_168414 ) ) ( not ( = ?auto_168408 ?auto_168415 ) ) ( not ( = ?auto_168408 ?auto_168409 ) ) ( not ( = ?auto_168408 ?auto_168414 ) ) ( not ( = ?auto_168410 ?auto_168415 ) ) ( not ( = ?auto_168410 ?auto_168409 ) ) ( not ( = ?auto_168410 ?auto_168414 ) ) ( not ( = ?auto_168412 ?auto_168415 ) ) ( not ( = ?auto_168412 ?auto_168409 ) ) ( not ( = ?auto_168412 ?auto_168414 ) ) ( ON ?auto_168411 ?auto_168412 ) ( ON ?auto_168415 ?auto_168411 ) ( ON ?auto_168409 ?auto_168413 ) ( CLEAR ?auto_168409 ) ( not ( = ?auto_168407 ?auto_168413 ) ) ( not ( = ?auto_168408 ?auto_168413 ) ) ( not ( = ?auto_168410 ?auto_168413 ) ) ( not ( = ?auto_168412 ?auto_168413 ) ) ( not ( = ?auto_168411 ?auto_168413 ) ) ( not ( = ?auto_168409 ?auto_168413 ) ) ( not ( = ?auto_168414 ?auto_168413 ) ) ( not ( = ?auto_168415 ?auto_168413 ) ) ( HOLDING ?auto_168414 ) ( CLEAR ?auto_168415 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_168407 ?auto_168408 ?auto_168410 ?auto_168412 ?auto_168411 ?auto_168415 ?auto_168414 )
      ( MAKE-2PILE ?auto_168407 ?auto_168408 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_168416 - BLOCK
      ?auto_168417 - BLOCK
    )
    :vars
    (
      ?auto_168419 - BLOCK
      ?auto_168421 - BLOCK
      ?auto_168422 - BLOCK
      ?auto_168420 - BLOCK
      ?auto_168418 - BLOCK
      ?auto_168424 - BLOCK
      ?auto_168423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168419 ?auto_168417 ) ( ON-TABLE ?auto_168416 ) ( ON ?auto_168417 ?auto_168416 ) ( not ( = ?auto_168416 ?auto_168417 ) ) ( not ( = ?auto_168416 ?auto_168419 ) ) ( not ( = ?auto_168417 ?auto_168419 ) ) ( not ( = ?auto_168416 ?auto_168421 ) ) ( not ( = ?auto_168416 ?auto_168422 ) ) ( not ( = ?auto_168417 ?auto_168421 ) ) ( not ( = ?auto_168417 ?auto_168422 ) ) ( not ( = ?auto_168419 ?auto_168421 ) ) ( not ( = ?auto_168419 ?auto_168422 ) ) ( not ( = ?auto_168421 ?auto_168422 ) ) ( ON ?auto_168421 ?auto_168419 ) ( not ( = ?auto_168420 ?auto_168418 ) ) ( not ( = ?auto_168420 ?auto_168424 ) ) ( not ( = ?auto_168420 ?auto_168422 ) ) ( not ( = ?auto_168418 ?auto_168424 ) ) ( not ( = ?auto_168418 ?auto_168422 ) ) ( not ( = ?auto_168424 ?auto_168422 ) ) ( not ( = ?auto_168416 ?auto_168424 ) ) ( not ( = ?auto_168416 ?auto_168420 ) ) ( not ( = ?auto_168416 ?auto_168418 ) ) ( not ( = ?auto_168417 ?auto_168424 ) ) ( not ( = ?auto_168417 ?auto_168420 ) ) ( not ( = ?auto_168417 ?auto_168418 ) ) ( not ( = ?auto_168419 ?auto_168424 ) ) ( not ( = ?auto_168419 ?auto_168420 ) ) ( not ( = ?auto_168419 ?auto_168418 ) ) ( not ( = ?auto_168421 ?auto_168424 ) ) ( not ( = ?auto_168421 ?auto_168420 ) ) ( not ( = ?auto_168421 ?auto_168418 ) ) ( ON ?auto_168422 ?auto_168421 ) ( ON ?auto_168424 ?auto_168422 ) ( ON ?auto_168420 ?auto_168423 ) ( not ( = ?auto_168416 ?auto_168423 ) ) ( not ( = ?auto_168417 ?auto_168423 ) ) ( not ( = ?auto_168419 ?auto_168423 ) ) ( not ( = ?auto_168421 ?auto_168423 ) ) ( not ( = ?auto_168422 ?auto_168423 ) ) ( not ( = ?auto_168420 ?auto_168423 ) ) ( not ( = ?auto_168418 ?auto_168423 ) ) ( not ( = ?auto_168424 ?auto_168423 ) ) ( CLEAR ?auto_168424 ) ( ON ?auto_168418 ?auto_168420 ) ( CLEAR ?auto_168418 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_168423 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_168423 ?auto_168420 )
      ( MAKE-2PILE ?auto_168416 ?auto_168417 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_168425 - BLOCK
      ?auto_168426 - BLOCK
    )
    :vars
    (
      ?auto_168431 - BLOCK
      ?auto_168427 - BLOCK
      ?auto_168433 - BLOCK
      ?auto_168430 - BLOCK
      ?auto_168428 - BLOCK
      ?auto_168432 - BLOCK
      ?auto_168429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168431 ?auto_168426 ) ( ON-TABLE ?auto_168425 ) ( ON ?auto_168426 ?auto_168425 ) ( not ( = ?auto_168425 ?auto_168426 ) ) ( not ( = ?auto_168425 ?auto_168431 ) ) ( not ( = ?auto_168426 ?auto_168431 ) ) ( not ( = ?auto_168425 ?auto_168427 ) ) ( not ( = ?auto_168425 ?auto_168433 ) ) ( not ( = ?auto_168426 ?auto_168427 ) ) ( not ( = ?auto_168426 ?auto_168433 ) ) ( not ( = ?auto_168431 ?auto_168427 ) ) ( not ( = ?auto_168431 ?auto_168433 ) ) ( not ( = ?auto_168427 ?auto_168433 ) ) ( ON ?auto_168427 ?auto_168431 ) ( not ( = ?auto_168430 ?auto_168428 ) ) ( not ( = ?auto_168430 ?auto_168432 ) ) ( not ( = ?auto_168430 ?auto_168433 ) ) ( not ( = ?auto_168428 ?auto_168432 ) ) ( not ( = ?auto_168428 ?auto_168433 ) ) ( not ( = ?auto_168432 ?auto_168433 ) ) ( not ( = ?auto_168425 ?auto_168432 ) ) ( not ( = ?auto_168425 ?auto_168430 ) ) ( not ( = ?auto_168425 ?auto_168428 ) ) ( not ( = ?auto_168426 ?auto_168432 ) ) ( not ( = ?auto_168426 ?auto_168430 ) ) ( not ( = ?auto_168426 ?auto_168428 ) ) ( not ( = ?auto_168431 ?auto_168432 ) ) ( not ( = ?auto_168431 ?auto_168430 ) ) ( not ( = ?auto_168431 ?auto_168428 ) ) ( not ( = ?auto_168427 ?auto_168432 ) ) ( not ( = ?auto_168427 ?auto_168430 ) ) ( not ( = ?auto_168427 ?auto_168428 ) ) ( ON ?auto_168433 ?auto_168427 ) ( ON ?auto_168430 ?auto_168429 ) ( not ( = ?auto_168425 ?auto_168429 ) ) ( not ( = ?auto_168426 ?auto_168429 ) ) ( not ( = ?auto_168431 ?auto_168429 ) ) ( not ( = ?auto_168427 ?auto_168429 ) ) ( not ( = ?auto_168433 ?auto_168429 ) ) ( not ( = ?auto_168430 ?auto_168429 ) ) ( not ( = ?auto_168428 ?auto_168429 ) ) ( not ( = ?auto_168432 ?auto_168429 ) ) ( ON ?auto_168428 ?auto_168430 ) ( CLEAR ?auto_168428 ) ( ON-TABLE ?auto_168429 ) ( HOLDING ?auto_168432 ) ( CLEAR ?auto_168433 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_168425 ?auto_168426 ?auto_168431 ?auto_168427 ?auto_168433 ?auto_168432 )
      ( MAKE-2PILE ?auto_168425 ?auto_168426 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_168434 - BLOCK
      ?auto_168435 - BLOCK
    )
    :vars
    (
      ?auto_168442 - BLOCK
      ?auto_168441 - BLOCK
      ?auto_168440 - BLOCK
      ?auto_168436 - BLOCK
      ?auto_168437 - BLOCK
      ?auto_168439 - BLOCK
      ?auto_168438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168442 ?auto_168435 ) ( ON-TABLE ?auto_168434 ) ( ON ?auto_168435 ?auto_168434 ) ( not ( = ?auto_168434 ?auto_168435 ) ) ( not ( = ?auto_168434 ?auto_168442 ) ) ( not ( = ?auto_168435 ?auto_168442 ) ) ( not ( = ?auto_168434 ?auto_168441 ) ) ( not ( = ?auto_168434 ?auto_168440 ) ) ( not ( = ?auto_168435 ?auto_168441 ) ) ( not ( = ?auto_168435 ?auto_168440 ) ) ( not ( = ?auto_168442 ?auto_168441 ) ) ( not ( = ?auto_168442 ?auto_168440 ) ) ( not ( = ?auto_168441 ?auto_168440 ) ) ( ON ?auto_168441 ?auto_168442 ) ( not ( = ?auto_168436 ?auto_168437 ) ) ( not ( = ?auto_168436 ?auto_168439 ) ) ( not ( = ?auto_168436 ?auto_168440 ) ) ( not ( = ?auto_168437 ?auto_168439 ) ) ( not ( = ?auto_168437 ?auto_168440 ) ) ( not ( = ?auto_168439 ?auto_168440 ) ) ( not ( = ?auto_168434 ?auto_168439 ) ) ( not ( = ?auto_168434 ?auto_168436 ) ) ( not ( = ?auto_168434 ?auto_168437 ) ) ( not ( = ?auto_168435 ?auto_168439 ) ) ( not ( = ?auto_168435 ?auto_168436 ) ) ( not ( = ?auto_168435 ?auto_168437 ) ) ( not ( = ?auto_168442 ?auto_168439 ) ) ( not ( = ?auto_168442 ?auto_168436 ) ) ( not ( = ?auto_168442 ?auto_168437 ) ) ( not ( = ?auto_168441 ?auto_168439 ) ) ( not ( = ?auto_168441 ?auto_168436 ) ) ( not ( = ?auto_168441 ?auto_168437 ) ) ( ON ?auto_168440 ?auto_168441 ) ( ON ?auto_168436 ?auto_168438 ) ( not ( = ?auto_168434 ?auto_168438 ) ) ( not ( = ?auto_168435 ?auto_168438 ) ) ( not ( = ?auto_168442 ?auto_168438 ) ) ( not ( = ?auto_168441 ?auto_168438 ) ) ( not ( = ?auto_168440 ?auto_168438 ) ) ( not ( = ?auto_168436 ?auto_168438 ) ) ( not ( = ?auto_168437 ?auto_168438 ) ) ( not ( = ?auto_168439 ?auto_168438 ) ) ( ON ?auto_168437 ?auto_168436 ) ( ON-TABLE ?auto_168438 ) ( CLEAR ?auto_168440 ) ( ON ?auto_168439 ?auto_168437 ) ( CLEAR ?auto_168439 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_168438 ?auto_168436 ?auto_168437 )
      ( MAKE-2PILE ?auto_168434 ?auto_168435 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168492 - BLOCK
      ?auto_168493 - BLOCK
      ?auto_168494 - BLOCK
      ?auto_168495 - BLOCK
      ?auto_168496 - BLOCK
      ?auto_168497 - BLOCK
    )
    :vars
    (
      ?auto_168498 - BLOCK
      ?auto_168499 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168492 ) ( ON ?auto_168493 ?auto_168492 ) ( ON ?auto_168494 ?auto_168493 ) ( ON ?auto_168495 ?auto_168494 ) ( not ( = ?auto_168492 ?auto_168493 ) ) ( not ( = ?auto_168492 ?auto_168494 ) ) ( not ( = ?auto_168492 ?auto_168495 ) ) ( not ( = ?auto_168492 ?auto_168496 ) ) ( not ( = ?auto_168492 ?auto_168497 ) ) ( not ( = ?auto_168493 ?auto_168494 ) ) ( not ( = ?auto_168493 ?auto_168495 ) ) ( not ( = ?auto_168493 ?auto_168496 ) ) ( not ( = ?auto_168493 ?auto_168497 ) ) ( not ( = ?auto_168494 ?auto_168495 ) ) ( not ( = ?auto_168494 ?auto_168496 ) ) ( not ( = ?auto_168494 ?auto_168497 ) ) ( not ( = ?auto_168495 ?auto_168496 ) ) ( not ( = ?auto_168495 ?auto_168497 ) ) ( not ( = ?auto_168496 ?auto_168497 ) ) ( ON ?auto_168497 ?auto_168498 ) ( not ( = ?auto_168492 ?auto_168498 ) ) ( not ( = ?auto_168493 ?auto_168498 ) ) ( not ( = ?auto_168494 ?auto_168498 ) ) ( not ( = ?auto_168495 ?auto_168498 ) ) ( not ( = ?auto_168496 ?auto_168498 ) ) ( not ( = ?auto_168497 ?auto_168498 ) ) ( CLEAR ?auto_168495 ) ( ON ?auto_168496 ?auto_168497 ) ( CLEAR ?auto_168496 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_168499 ) ( ON ?auto_168498 ?auto_168499 ) ( not ( = ?auto_168499 ?auto_168498 ) ) ( not ( = ?auto_168499 ?auto_168497 ) ) ( not ( = ?auto_168499 ?auto_168496 ) ) ( not ( = ?auto_168492 ?auto_168499 ) ) ( not ( = ?auto_168493 ?auto_168499 ) ) ( not ( = ?auto_168494 ?auto_168499 ) ) ( not ( = ?auto_168495 ?auto_168499 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_168499 ?auto_168498 ?auto_168497 )
      ( MAKE-6PILE ?auto_168492 ?auto_168493 ?auto_168494 ?auto_168495 ?auto_168496 ?auto_168497 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168500 - BLOCK
      ?auto_168501 - BLOCK
      ?auto_168502 - BLOCK
      ?auto_168503 - BLOCK
      ?auto_168504 - BLOCK
      ?auto_168505 - BLOCK
    )
    :vars
    (
      ?auto_168507 - BLOCK
      ?auto_168506 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168500 ) ( ON ?auto_168501 ?auto_168500 ) ( ON ?auto_168502 ?auto_168501 ) ( not ( = ?auto_168500 ?auto_168501 ) ) ( not ( = ?auto_168500 ?auto_168502 ) ) ( not ( = ?auto_168500 ?auto_168503 ) ) ( not ( = ?auto_168500 ?auto_168504 ) ) ( not ( = ?auto_168500 ?auto_168505 ) ) ( not ( = ?auto_168501 ?auto_168502 ) ) ( not ( = ?auto_168501 ?auto_168503 ) ) ( not ( = ?auto_168501 ?auto_168504 ) ) ( not ( = ?auto_168501 ?auto_168505 ) ) ( not ( = ?auto_168502 ?auto_168503 ) ) ( not ( = ?auto_168502 ?auto_168504 ) ) ( not ( = ?auto_168502 ?auto_168505 ) ) ( not ( = ?auto_168503 ?auto_168504 ) ) ( not ( = ?auto_168503 ?auto_168505 ) ) ( not ( = ?auto_168504 ?auto_168505 ) ) ( ON ?auto_168505 ?auto_168507 ) ( not ( = ?auto_168500 ?auto_168507 ) ) ( not ( = ?auto_168501 ?auto_168507 ) ) ( not ( = ?auto_168502 ?auto_168507 ) ) ( not ( = ?auto_168503 ?auto_168507 ) ) ( not ( = ?auto_168504 ?auto_168507 ) ) ( not ( = ?auto_168505 ?auto_168507 ) ) ( ON ?auto_168504 ?auto_168505 ) ( CLEAR ?auto_168504 ) ( ON-TABLE ?auto_168506 ) ( ON ?auto_168507 ?auto_168506 ) ( not ( = ?auto_168506 ?auto_168507 ) ) ( not ( = ?auto_168506 ?auto_168505 ) ) ( not ( = ?auto_168506 ?auto_168504 ) ) ( not ( = ?auto_168500 ?auto_168506 ) ) ( not ( = ?auto_168501 ?auto_168506 ) ) ( not ( = ?auto_168502 ?auto_168506 ) ) ( not ( = ?auto_168503 ?auto_168506 ) ) ( HOLDING ?auto_168503 ) ( CLEAR ?auto_168502 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_168500 ?auto_168501 ?auto_168502 ?auto_168503 )
      ( MAKE-6PILE ?auto_168500 ?auto_168501 ?auto_168502 ?auto_168503 ?auto_168504 ?auto_168505 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168508 - BLOCK
      ?auto_168509 - BLOCK
      ?auto_168510 - BLOCK
      ?auto_168511 - BLOCK
      ?auto_168512 - BLOCK
      ?auto_168513 - BLOCK
    )
    :vars
    (
      ?auto_168515 - BLOCK
      ?auto_168514 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168508 ) ( ON ?auto_168509 ?auto_168508 ) ( ON ?auto_168510 ?auto_168509 ) ( not ( = ?auto_168508 ?auto_168509 ) ) ( not ( = ?auto_168508 ?auto_168510 ) ) ( not ( = ?auto_168508 ?auto_168511 ) ) ( not ( = ?auto_168508 ?auto_168512 ) ) ( not ( = ?auto_168508 ?auto_168513 ) ) ( not ( = ?auto_168509 ?auto_168510 ) ) ( not ( = ?auto_168509 ?auto_168511 ) ) ( not ( = ?auto_168509 ?auto_168512 ) ) ( not ( = ?auto_168509 ?auto_168513 ) ) ( not ( = ?auto_168510 ?auto_168511 ) ) ( not ( = ?auto_168510 ?auto_168512 ) ) ( not ( = ?auto_168510 ?auto_168513 ) ) ( not ( = ?auto_168511 ?auto_168512 ) ) ( not ( = ?auto_168511 ?auto_168513 ) ) ( not ( = ?auto_168512 ?auto_168513 ) ) ( ON ?auto_168513 ?auto_168515 ) ( not ( = ?auto_168508 ?auto_168515 ) ) ( not ( = ?auto_168509 ?auto_168515 ) ) ( not ( = ?auto_168510 ?auto_168515 ) ) ( not ( = ?auto_168511 ?auto_168515 ) ) ( not ( = ?auto_168512 ?auto_168515 ) ) ( not ( = ?auto_168513 ?auto_168515 ) ) ( ON ?auto_168512 ?auto_168513 ) ( ON-TABLE ?auto_168514 ) ( ON ?auto_168515 ?auto_168514 ) ( not ( = ?auto_168514 ?auto_168515 ) ) ( not ( = ?auto_168514 ?auto_168513 ) ) ( not ( = ?auto_168514 ?auto_168512 ) ) ( not ( = ?auto_168508 ?auto_168514 ) ) ( not ( = ?auto_168509 ?auto_168514 ) ) ( not ( = ?auto_168510 ?auto_168514 ) ) ( not ( = ?auto_168511 ?auto_168514 ) ) ( CLEAR ?auto_168510 ) ( ON ?auto_168511 ?auto_168512 ) ( CLEAR ?auto_168511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_168514 ?auto_168515 ?auto_168513 ?auto_168512 )
      ( MAKE-6PILE ?auto_168508 ?auto_168509 ?auto_168510 ?auto_168511 ?auto_168512 ?auto_168513 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168516 - BLOCK
      ?auto_168517 - BLOCK
      ?auto_168518 - BLOCK
      ?auto_168519 - BLOCK
      ?auto_168520 - BLOCK
      ?auto_168521 - BLOCK
    )
    :vars
    (
      ?auto_168522 - BLOCK
      ?auto_168523 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168516 ) ( ON ?auto_168517 ?auto_168516 ) ( not ( = ?auto_168516 ?auto_168517 ) ) ( not ( = ?auto_168516 ?auto_168518 ) ) ( not ( = ?auto_168516 ?auto_168519 ) ) ( not ( = ?auto_168516 ?auto_168520 ) ) ( not ( = ?auto_168516 ?auto_168521 ) ) ( not ( = ?auto_168517 ?auto_168518 ) ) ( not ( = ?auto_168517 ?auto_168519 ) ) ( not ( = ?auto_168517 ?auto_168520 ) ) ( not ( = ?auto_168517 ?auto_168521 ) ) ( not ( = ?auto_168518 ?auto_168519 ) ) ( not ( = ?auto_168518 ?auto_168520 ) ) ( not ( = ?auto_168518 ?auto_168521 ) ) ( not ( = ?auto_168519 ?auto_168520 ) ) ( not ( = ?auto_168519 ?auto_168521 ) ) ( not ( = ?auto_168520 ?auto_168521 ) ) ( ON ?auto_168521 ?auto_168522 ) ( not ( = ?auto_168516 ?auto_168522 ) ) ( not ( = ?auto_168517 ?auto_168522 ) ) ( not ( = ?auto_168518 ?auto_168522 ) ) ( not ( = ?auto_168519 ?auto_168522 ) ) ( not ( = ?auto_168520 ?auto_168522 ) ) ( not ( = ?auto_168521 ?auto_168522 ) ) ( ON ?auto_168520 ?auto_168521 ) ( ON-TABLE ?auto_168523 ) ( ON ?auto_168522 ?auto_168523 ) ( not ( = ?auto_168523 ?auto_168522 ) ) ( not ( = ?auto_168523 ?auto_168521 ) ) ( not ( = ?auto_168523 ?auto_168520 ) ) ( not ( = ?auto_168516 ?auto_168523 ) ) ( not ( = ?auto_168517 ?auto_168523 ) ) ( not ( = ?auto_168518 ?auto_168523 ) ) ( not ( = ?auto_168519 ?auto_168523 ) ) ( ON ?auto_168519 ?auto_168520 ) ( CLEAR ?auto_168519 ) ( HOLDING ?auto_168518 ) ( CLEAR ?auto_168517 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_168516 ?auto_168517 ?auto_168518 )
      ( MAKE-6PILE ?auto_168516 ?auto_168517 ?auto_168518 ?auto_168519 ?auto_168520 ?auto_168521 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168524 - BLOCK
      ?auto_168525 - BLOCK
      ?auto_168526 - BLOCK
      ?auto_168527 - BLOCK
      ?auto_168528 - BLOCK
      ?auto_168529 - BLOCK
    )
    :vars
    (
      ?auto_168530 - BLOCK
      ?auto_168531 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168524 ) ( ON ?auto_168525 ?auto_168524 ) ( not ( = ?auto_168524 ?auto_168525 ) ) ( not ( = ?auto_168524 ?auto_168526 ) ) ( not ( = ?auto_168524 ?auto_168527 ) ) ( not ( = ?auto_168524 ?auto_168528 ) ) ( not ( = ?auto_168524 ?auto_168529 ) ) ( not ( = ?auto_168525 ?auto_168526 ) ) ( not ( = ?auto_168525 ?auto_168527 ) ) ( not ( = ?auto_168525 ?auto_168528 ) ) ( not ( = ?auto_168525 ?auto_168529 ) ) ( not ( = ?auto_168526 ?auto_168527 ) ) ( not ( = ?auto_168526 ?auto_168528 ) ) ( not ( = ?auto_168526 ?auto_168529 ) ) ( not ( = ?auto_168527 ?auto_168528 ) ) ( not ( = ?auto_168527 ?auto_168529 ) ) ( not ( = ?auto_168528 ?auto_168529 ) ) ( ON ?auto_168529 ?auto_168530 ) ( not ( = ?auto_168524 ?auto_168530 ) ) ( not ( = ?auto_168525 ?auto_168530 ) ) ( not ( = ?auto_168526 ?auto_168530 ) ) ( not ( = ?auto_168527 ?auto_168530 ) ) ( not ( = ?auto_168528 ?auto_168530 ) ) ( not ( = ?auto_168529 ?auto_168530 ) ) ( ON ?auto_168528 ?auto_168529 ) ( ON-TABLE ?auto_168531 ) ( ON ?auto_168530 ?auto_168531 ) ( not ( = ?auto_168531 ?auto_168530 ) ) ( not ( = ?auto_168531 ?auto_168529 ) ) ( not ( = ?auto_168531 ?auto_168528 ) ) ( not ( = ?auto_168524 ?auto_168531 ) ) ( not ( = ?auto_168525 ?auto_168531 ) ) ( not ( = ?auto_168526 ?auto_168531 ) ) ( not ( = ?auto_168527 ?auto_168531 ) ) ( ON ?auto_168527 ?auto_168528 ) ( CLEAR ?auto_168525 ) ( ON ?auto_168526 ?auto_168527 ) ( CLEAR ?auto_168526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_168531 ?auto_168530 ?auto_168529 ?auto_168528 ?auto_168527 )
      ( MAKE-6PILE ?auto_168524 ?auto_168525 ?auto_168526 ?auto_168527 ?auto_168528 ?auto_168529 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168532 - BLOCK
      ?auto_168533 - BLOCK
      ?auto_168534 - BLOCK
      ?auto_168535 - BLOCK
      ?auto_168536 - BLOCK
      ?auto_168537 - BLOCK
    )
    :vars
    (
      ?auto_168539 - BLOCK
      ?auto_168538 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168532 ) ( not ( = ?auto_168532 ?auto_168533 ) ) ( not ( = ?auto_168532 ?auto_168534 ) ) ( not ( = ?auto_168532 ?auto_168535 ) ) ( not ( = ?auto_168532 ?auto_168536 ) ) ( not ( = ?auto_168532 ?auto_168537 ) ) ( not ( = ?auto_168533 ?auto_168534 ) ) ( not ( = ?auto_168533 ?auto_168535 ) ) ( not ( = ?auto_168533 ?auto_168536 ) ) ( not ( = ?auto_168533 ?auto_168537 ) ) ( not ( = ?auto_168534 ?auto_168535 ) ) ( not ( = ?auto_168534 ?auto_168536 ) ) ( not ( = ?auto_168534 ?auto_168537 ) ) ( not ( = ?auto_168535 ?auto_168536 ) ) ( not ( = ?auto_168535 ?auto_168537 ) ) ( not ( = ?auto_168536 ?auto_168537 ) ) ( ON ?auto_168537 ?auto_168539 ) ( not ( = ?auto_168532 ?auto_168539 ) ) ( not ( = ?auto_168533 ?auto_168539 ) ) ( not ( = ?auto_168534 ?auto_168539 ) ) ( not ( = ?auto_168535 ?auto_168539 ) ) ( not ( = ?auto_168536 ?auto_168539 ) ) ( not ( = ?auto_168537 ?auto_168539 ) ) ( ON ?auto_168536 ?auto_168537 ) ( ON-TABLE ?auto_168538 ) ( ON ?auto_168539 ?auto_168538 ) ( not ( = ?auto_168538 ?auto_168539 ) ) ( not ( = ?auto_168538 ?auto_168537 ) ) ( not ( = ?auto_168538 ?auto_168536 ) ) ( not ( = ?auto_168532 ?auto_168538 ) ) ( not ( = ?auto_168533 ?auto_168538 ) ) ( not ( = ?auto_168534 ?auto_168538 ) ) ( not ( = ?auto_168535 ?auto_168538 ) ) ( ON ?auto_168535 ?auto_168536 ) ( ON ?auto_168534 ?auto_168535 ) ( CLEAR ?auto_168534 ) ( HOLDING ?auto_168533 ) ( CLEAR ?auto_168532 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_168532 ?auto_168533 )
      ( MAKE-6PILE ?auto_168532 ?auto_168533 ?auto_168534 ?auto_168535 ?auto_168536 ?auto_168537 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168540 - BLOCK
      ?auto_168541 - BLOCK
      ?auto_168542 - BLOCK
      ?auto_168543 - BLOCK
      ?auto_168544 - BLOCK
      ?auto_168545 - BLOCK
    )
    :vars
    (
      ?auto_168547 - BLOCK
      ?auto_168546 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168540 ) ( not ( = ?auto_168540 ?auto_168541 ) ) ( not ( = ?auto_168540 ?auto_168542 ) ) ( not ( = ?auto_168540 ?auto_168543 ) ) ( not ( = ?auto_168540 ?auto_168544 ) ) ( not ( = ?auto_168540 ?auto_168545 ) ) ( not ( = ?auto_168541 ?auto_168542 ) ) ( not ( = ?auto_168541 ?auto_168543 ) ) ( not ( = ?auto_168541 ?auto_168544 ) ) ( not ( = ?auto_168541 ?auto_168545 ) ) ( not ( = ?auto_168542 ?auto_168543 ) ) ( not ( = ?auto_168542 ?auto_168544 ) ) ( not ( = ?auto_168542 ?auto_168545 ) ) ( not ( = ?auto_168543 ?auto_168544 ) ) ( not ( = ?auto_168543 ?auto_168545 ) ) ( not ( = ?auto_168544 ?auto_168545 ) ) ( ON ?auto_168545 ?auto_168547 ) ( not ( = ?auto_168540 ?auto_168547 ) ) ( not ( = ?auto_168541 ?auto_168547 ) ) ( not ( = ?auto_168542 ?auto_168547 ) ) ( not ( = ?auto_168543 ?auto_168547 ) ) ( not ( = ?auto_168544 ?auto_168547 ) ) ( not ( = ?auto_168545 ?auto_168547 ) ) ( ON ?auto_168544 ?auto_168545 ) ( ON-TABLE ?auto_168546 ) ( ON ?auto_168547 ?auto_168546 ) ( not ( = ?auto_168546 ?auto_168547 ) ) ( not ( = ?auto_168546 ?auto_168545 ) ) ( not ( = ?auto_168546 ?auto_168544 ) ) ( not ( = ?auto_168540 ?auto_168546 ) ) ( not ( = ?auto_168541 ?auto_168546 ) ) ( not ( = ?auto_168542 ?auto_168546 ) ) ( not ( = ?auto_168543 ?auto_168546 ) ) ( ON ?auto_168543 ?auto_168544 ) ( ON ?auto_168542 ?auto_168543 ) ( CLEAR ?auto_168540 ) ( ON ?auto_168541 ?auto_168542 ) ( CLEAR ?auto_168541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_168546 ?auto_168547 ?auto_168545 ?auto_168544 ?auto_168543 ?auto_168542 )
      ( MAKE-6PILE ?auto_168540 ?auto_168541 ?auto_168542 ?auto_168543 ?auto_168544 ?auto_168545 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168548 - BLOCK
      ?auto_168549 - BLOCK
      ?auto_168550 - BLOCK
      ?auto_168551 - BLOCK
      ?auto_168552 - BLOCK
      ?auto_168553 - BLOCK
    )
    :vars
    (
      ?auto_168554 - BLOCK
      ?auto_168555 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168548 ?auto_168549 ) ) ( not ( = ?auto_168548 ?auto_168550 ) ) ( not ( = ?auto_168548 ?auto_168551 ) ) ( not ( = ?auto_168548 ?auto_168552 ) ) ( not ( = ?auto_168548 ?auto_168553 ) ) ( not ( = ?auto_168549 ?auto_168550 ) ) ( not ( = ?auto_168549 ?auto_168551 ) ) ( not ( = ?auto_168549 ?auto_168552 ) ) ( not ( = ?auto_168549 ?auto_168553 ) ) ( not ( = ?auto_168550 ?auto_168551 ) ) ( not ( = ?auto_168550 ?auto_168552 ) ) ( not ( = ?auto_168550 ?auto_168553 ) ) ( not ( = ?auto_168551 ?auto_168552 ) ) ( not ( = ?auto_168551 ?auto_168553 ) ) ( not ( = ?auto_168552 ?auto_168553 ) ) ( ON ?auto_168553 ?auto_168554 ) ( not ( = ?auto_168548 ?auto_168554 ) ) ( not ( = ?auto_168549 ?auto_168554 ) ) ( not ( = ?auto_168550 ?auto_168554 ) ) ( not ( = ?auto_168551 ?auto_168554 ) ) ( not ( = ?auto_168552 ?auto_168554 ) ) ( not ( = ?auto_168553 ?auto_168554 ) ) ( ON ?auto_168552 ?auto_168553 ) ( ON-TABLE ?auto_168555 ) ( ON ?auto_168554 ?auto_168555 ) ( not ( = ?auto_168555 ?auto_168554 ) ) ( not ( = ?auto_168555 ?auto_168553 ) ) ( not ( = ?auto_168555 ?auto_168552 ) ) ( not ( = ?auto_168548 ?auto_168555 ) ) ( not ( = ?auto_168549 ?auto_168555 ) ) ( not ( = ?auto_168550 ?auto_168555 ) ) ( not ( = ?auto_168551 ?auto_168555 ) ) ( ON ?auto_168551 ?auto_168552 ) ( ON ?auto_168550 ?auto_168551 ) ( ON ?auto_168549 ?auto_168550 ) ( CLEAR ?auto_168549 ) ( HOLDING ?auto_168548 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_168548 )
      ( MAKE-6PILE ?auto_168548 ?auto_168549 ?auto_168550 ?auto_168551 ?auto_168552 ?auto_168553 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168556 - BLOCK
      ?auto_168557 - BLOCK
      ?auto_168558 - BLOCK
      ?auto_168559 - BLOCK
      ?auto_168560 - BLOCK
      ?auto_168561 - BLOCK
    )
    :vars
    (
      ?auto_168563 - BLOCK
      ?auto_168562 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168556 ?auto_168557 ) ) ( not ( = ?auto_168556 ?auto_168558 ) ) ( not ( = ?auto_168556 ?auto_168559 ) ) ( not ( = ?auto_168556 ?auto_168560 ) ) ( not ( = ?auto_168556 ?auto_168561 ) ) ( not ( = ?auto_168557 ?auto_168558 ) ) ( not ( = ?auto_168557 ?auto_168559 ) ) ( not ( = ?auto_168557 ?auto_168560 ) ) ( not ( = ?auto_168557 ?auto_168561 ) ) ( not ( = ?auto_168558 ?auto_168559 ) ) ( not ( = ?auto_168558 ?auto_168560 ) ) ( not ( = ?auto_168558 ?auto_168561 ) ) ( not ( = ?auto_168559 ?auto_168560 ) ) ( not ( = ?auto_168559 ?auto_168561 ) ) ( not ( = ?auto_168560 ?auto_168561 ) ) ( ON ?auto_168561 ?auto_168563 ) ( not ( = ?auto_168556 ?auto_168563 ) ) ( not ( = ?auto_168557 ?auto_168563 ) ) ( not ( = ?auto_168558 ?auto_168563 ) ) ( not ( = ?auto_168559 ?auto_168563 ) ) ( not ( = ?auto_168560 ?auto_168563 ) ) ( not ( = ?auto_168561 ?auto_168563 ) ) ( ON ?auto_168560 ?auto_168561 ) ( ON-TABLE ?auto_168562 ) ( ON ?auto_168563 ?auto_168562 ) ( not ( = ?auto_168562 ?auto_168563 ) ) ( not ( = ?auto_168562 ?auto_168561 ) ) ( not ( = ?auto_168562 ?auto_168560 ) ) ( not ( = ?auto_168556 ?auto_168562 ) ) ( not ( = ?auto_168557 ?auto_168562 ) ) ( not ( = ?auto_168558 ?auto_168562 ) ) ( not ( = ?auto_168559 ?auto_168562 ) ) ( ON ?auto_168559 ?auto_168560 ) ( ON ?auto_168558 ?auto_168559 ) ( ON ?auto_168557 ?auto_168558 ) ( ON ?auto_168556 ?auto_168557 ) ( CLEAR ?auto_168556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_168562 ?auto_168563 ?auto_168561 ?auto_168560 ?auto_168559 ?auto_168558 ?auto_168557 )
      ( MAKE-6PILE ?auto_168556 ?auto_168557 ?auto_168558 ?auto_168559 ?auto_168560 ?auto_168561 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168570 - BLOCK
      ?auto_168571 - BLOCK
      ?auto_168572 - BLOCK
      ?auto_168573 - BLOCK
      ?auto_168574 - BLOCK
      ?auto_168575 - BLOCK
    )
    :vars
    (
      ?auto_168577 - BLOCK
      ?auto_168576 - BLOCK
      ?auto_168578 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168570 ?auto_168571 ) ) ( not ( = ?auto_168570 ?auto_168572 ) ) ( not ( = ?auto_168570 ?auto_168573 ) ) ( not ( = ?auto_168570 ?auto_168574 ) ) ( not ( = ?auto_168570 ?auto_168575 ) ) ( not ( = ?auto_168571 ?auto_168572 ) ) ( not ( = ?auto_168571 ?auto_168573 ) ) ( not ( = ?auto_168571 ?auto_168574 ) ) ( not ( = ?auto_168571 ?auto_168575 ) ) ( not ( = ?auto_168572 ?auto_168573 ) ) ( not ( = ?auto_168572 ?auto_168574 ) ) ( not ( = ?auto_168572 ?auto_168575 ) ) ( not ( = ?auto_168573 ?auto_168574 ) ) ( not ( = ?auto_168573 ?auto_168575 ) ) ( not ( = ?auto_168574 ?auto_168575 ) ) ( ON ?auto_168575 ?auto_168577 ) ( not ( = ?auto_168570 ?auto_168577 ) ) ( not ( = ?auto_168571 ?auto_168577 ) ) ( not ( = ?auto_168572 ?auto_168577 ) ) ( not ( = ?auto_168573 ?auto_168577 ) ) ( not ( = ?auto_168574 ?auto_168577 ) ) ( not ( = ?auto_168575 ?auto_168577 ) ) ( ON ?auto_168574 ?auto_168575 ) ( ON-TABLE ?auto_168576 ) ( ON ?auto_168577 ?auto_168576 ) ( not ( = ?auto_168576 ?auto_168577 ) ) ( not ( = ?auto_168576 ?auto_168575 ) ) ( not ( = ?auto_168576 ?auto_168574 ) ) ( not ( = ?auto_168570 ?auto_168576 ) ) ( not ( = ?auto_168571 ?auto_168576 ) ) ( not ( = ?auto_168572 ?auto_168576 ) ) ( not ( = ?auto_168573 ?auto_168576 ) ) ( ON ?auto_168573 ?auto_168574 ) ( ON ?auto_168572 ?auto_168573 ) ( ON ?auto_168571 ?auto_168572 ) ( CLEAR ?auto_168571 ) ( ON ?auto_168570 ?auto_168578 ) ( CLEAR ?auto_168570 ) ( HAND-EMPTY ) ( not ( = ?auto_168570 ?auto_168578 ) ) ( not ( = ?auto_168571 ?auto_168578 ) ) ( not ( = ?auto_168572 ?auto_168578 ) ) ( not ( = ?auto_168573 ?auto_168578 ) ) ( not ( = ?auto_168574 ?auto_168578 ) ) ( not ( = ?auto_168575 ?auto_168578 ) ) ( not ( = ?auto_168577 ?auto_168578 ) ) ( not ( = ?auto_168576 ?auto_168578 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_168570 ?auto_168578 )
      ( MAKE-6PILE ?auto_168570 ?auto_168571 ?auto_168572 ?auto_168573 ?auto_168574 ?auto_168575 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168579 - BLOCK
      ?auto_168580 - BLOCK
      ?auto_168581 - BLOCK
      ?auto_168582 - BLOCK
      ?auto_168583 - BLOCK
      ?auto_168584 - BLOCK
    )
    :vars
    (
      ?auto_168586 - BLOCK
      ?auto_168585 - BLOCK
      ?auto_168587 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168579 ?auto_168580 ) ) ( not ( = ?auto_168579 ?auto_168581 ) ) ( not ( = ?auto_168579 ?auto_168582 ) ) ( not ( = ?auto_168579 ?auto_168583 ) ) ( not ( = ?auto_168579 ?auto_168584 ) ) ( not ( = ?auto_168580 ?auto_168581 ) ) ( not ( = ?auto_168580 ?auto_168582 ) ) ( not ( = ?auto_168580 ?auto_168583 ) ) ( not ( = ?auto_168580 ?auto_168584 ) ) ( not ( = ?auto_168581 ?auto_168582 ) ) ( not ( = ?auto_168581 ?auto_168583 ) ) ( not ( = ?auto_168581 ?auto_168584 ) ) ( not ( = ?auto_168582 ?auto_168583 ) ) ( not ( = ?auto_168582 ?auto_168584 ) ) ( not ( = ?auto_168583 ?auto_168584 ) ) ( ON ?auto_168584 ?auto_168586 ) ( not ( = ?auto_168579 ?auto_168586 ) ) ( not ( = ?auto_168580 ?auto_168586 ) ) ( not ( = ?auto_168581 ?auto_168586 ) ) ( not ( = ?auto_168582 ?auto_168586 ) ) ( not ( = ?auto_168583 ?auto_168586 ) ) ( not ( = ?auto_168584 ?auto_168586 ) ) ( ON ?auto_168583 ?auto_168584 ) ( ON-TABLE ?auto_168585 ) ( ON ?auto_168586 ?auto_168585 ) ( not ( = ?auto_168585 ?auto_168586 ) ) ( not ( = ?auto_168585 ?auto_168584 ) ) ( not ( = ?auto_168585 ?auto_168583 ) ) ( not ( = ?auto_168579 ?auto_168585 ) ) ( not ( = ?auto_168580 ?auto_168585 ) ) ( not ( = ?auto_168581 ?auto_168585 ) ) ( not ( = ?auto_168582 ?auto_168585 ) ) ( ON ?auto_168582 ?auto_168583 ) ( ON ?auto_168581 ?auto_168582 ) ( ON ?auto_168579 ?auto_168587 ) ( CLEAR ?auto_168579 ) ( not ( = ?auto_168579 ?auto_168587 ) ) ( not ( = ?auto_168580 ?auto_168587 ) ) ( not ( = ?auto_168581 ?auto_168587 ) ) ( not ( = ?auto_168582 ?auto_168587 ) ) ( not ( = ?auto_168583 ?auto_168587 ) ) ( not ( = ?auto_168584 ?auto_168587 ) ) ( not ( = ?auto_168586 ?auto_168587 ) ) ( not ( = ?auto_168585 ?auto_168587 ) ) ( HOLDING ?auto_168580 ) ( CLEAR ?auto_168581 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_168585 ?auto_168586 ?auto_168584 ?auto_168583 ?auto_168582 ?auto_168581 ?auto_168580 )
      ( MAKE-6PILE ?auto_168579 ?auto_168580 ?auto_168581 ?auto_168582 ?auto_168583 ?auto_168584 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168588 - BLOCK
      ?auto_168589 - BLOCK
      ?auto_168590 - BLOCK
      ?auto_168591 - BLOCK
      ?auto_168592 - BLOCK
      ?auto_168593 - BLOCK
    )
    :vars
    (
      ?auto_168595 - BLOCK
      ?auto_168596 - BLOCK
      ?auto_168594 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168588 ?auto_168589 ) ) ( not ( = ?auto_168588 ?auto_168590 ) ) ( not ( = ?auto_168588 ?auto_168591 ) ) ( not ( = ?auto_168588 ?auto_168592 ) ) ( not ( = ?auto_168588 ?auto_168593 ) ) ( not ( = ?auto_168589 ?auto_168590 ) ) ( not ( = ?auto_168589 ?auto_168591 ) ) ( not ( = ?auto_168589 ?auto_168592 ) ) ( not ( = ?auto_168589 ?auto_168593 ) ) ( not ( = ?auto_168590 ?auto_168591 ) ) ( not ( = ?auto_168590 ?auto_168592 ) ) ( not ( = ?auto_168590 ?auto_168593 ) ) ( not ( = ?auto_168591 ?auto_168592 ) ) ( not ( = ?auto_168591 ?auto_168593 ) ) ( not ( = ?auto_168592 ?auto_168593 ) ) ( ON ?auto_168593 ?auto_168595 ) ( not ( = ?auto_168588 ?auto_168595 ) ) ( not ( = ?auto_168589 ?auto_168595 ) ) ( not ( = ?auto_168590 ?auto_168595 ) ) ( not ( = ?auto_168591 ?auto_168595 ) ) ( not ( = ?auto_168592 ?auto_168595 ) ) ( not ( = ?auto_168593 ?auto_168595 ) ) ( ON ?auto_168592 ?auto_168593 ) ( ON-TABLE ?auto_168596 ) ( ON ?auto_168595 ?auto_168596 ) ( not ( = ?auto_168596 ?auto_168595 ) ) ( not ( = ?auto_168596 ?auto_168593 ) ) ( not ( = ?auto_168596 ?auto_168592 ) ) ( not ( = ?auto_168588 ?auto_168596 ) ) ( not ( = ?auto_168589 ?auto_168596 ) ) ( not ( = ?auto_168590 ?auto_168596 ) ) ( not ( = ?auto_168591 ?auto_168596 ) ) ( ON ?auto_168591 ?auto_168592 ) ( ON ?auto_168590 ?auto_168591 ) ( ON ?auto_168588 ?auto_168594 ) ( not ( = ?auto_168588 ?auto_168594 ) ) ( not ( = ?auto_168589 ?auto_168594 ) ) ( not ( = ?auto_168590 ?auto_168594 ) ) ( not ( = ?auto_168591 ?auto_168594 ) ) ( not ( = ?auto_168592 ?auto_168594 ) ) ( not ( = ?auto_168593 ?auto_168594 ) ) ( not ( = ?auto_168595 ?auto_168594 ) ) ( not ( = ?auto_168596 ?auto_168594 ) ) ( CLEAR ?auto_168590 ) ( ON ?auto_168589 ?auto_168588 ) ( CLEAR ?auto_168589 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_168594 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_168594 ?auto_168588 )
      ( MAKE-6PILE ?auto_168588 ?auto_168589 ?auto_168590 ?auto_168591 ?auto_168592 ?auto_168593 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168597 - BLOCK
      ?auto_168598 - BLOCK
      ?auto_168599 - BLOCK
      ?auto_168600 - BLOCK
      ?auto_168601 - BLOCK
      ?auto_168602 - BLOCK
    )
    :vars
    (
      ?auto_168604 - BLOCK
      ?auto_168605 - BLOCK
      ?auto_168603 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168597 ?auto_168598 ) ) ( not ( = ?auto_168597 ?auto_168599 ) ) ( not ( = ?auto_168597 ?auto_168600 ) ) ( not ( = ?auto_168597 ?auto_168601 ) ) ( not ( = ?auto_168597 ?auto_168602 ) ) ( not ( = ?auto_168598 ?auto_168599 ) ) ( not ( = ?auto_168598 ?auto_168600 ) ) ( not ( = ?auto_168598 ?auto_168601 ) ) ( not ( = ?auto_168598 ?auto_168602 ) ) ( not ( = ?auto_168599 ?auto_168600 ) ) ( not ( = ?auto_168599 ?auto_168601 ) ) ( not ( = ?auto_168599 ?auto_168602 ) ) ( not ( = ?auto_168600 ?auto_168601 ) ) ( not ( = ?auto_168600 ?auto_168602 ) ) ( not ( = ?auto_168601 ?auto_168602 ) ) ( ON ?auto_168602 ?auto_168604 ) ( not ( = ?auto_168597 ?auto_168604 ) ) ( not ( = ?auto_168598 ?auto_168604 ) ) ( not ( = ?auto_168599 ?auto_168604 ) ) ( not ( = ?auto_168600 ?auto_168604 ) ) ( not ( = ?auto_168601 ?auto_168604 ) ) ( not ( = ?auto_168602 ?auto_168604 ) ) ( ON ?auto_168601 ?auto_168602 ) ( ON-TABLE ?auto_168605 ) ( ON ?auto_168604 ?auto_168605 ) ( not ( = ?auto_168605 ?auto_168604 ) ) ( not ( = ?auto_168605 ?auto_168602 ) ) ( not ( = ?auto_168605 ?auto_168601 ) ) ( not ( = ?auto_168597 ?auto_168605 ) ) ( not ( = ?auto_168598 ?auto_168605 ) ) ( not ( = ?auto_168599 ?auto_168605 ) ) ( not ( = ?auto_168600 ?auto_168605 ) ) ( ON ?auto_168600 ?auto_168601 ) ( ON ?auto_168597 ?auto_168603 ) ( not ( = ?auto_168597 ?auto_168603 ) ) ( not ( = ?auto_168598 ?auto_168603 ) ) ( not ( = ?auto_168599 ?auto_168603 ) ) ( not ( = ?auto_168600 ?auto_168603 ) ) ( not ( = ?auto_168601 ?auto_168603 ) ) ( not ( = ?auto_168602 ?auto_168603 ) ) ( not ( = ?auto_168604 ?auto_168603 ) ) ( not ( = ?auto_168605 ?auto_168603 ) ) ( ON ?auto_168598 ?auto_168597 ) ( CLEAR ?auto_168598 ) ( ON-TABLE ?auto_168603 ) ( HOLDING ?auto_168599 ) ( CLEAR ?auto_168600 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_168605 ?auto_168604 ?auto_168602 ?auto_168601 ?auto_168600 ?auto_168599 )
      ( MAKE-6PILE ?auto_168597 ?auto_168598 ?auto_168599 ?auto_168600 ?auto_168601 ?auto_168602 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168606 - BLOCK
      ?auto_168607 - BLOCK
      ?auto_168608 - BLOCK
      ?auto_168609 - BLOCK
      ?auto_168610 - BLOCK
      ?auto_168611 - BLOCK
    )
    :vars
    (
      ?auto_168613 - BLOCK
      ?auto_168612 - BLOCK
      ?auto_168614 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168606 ?auto_168607 ) ) ( not ( = ?auto_168606 ?auto_168608 ) ) ( not ( = ?auto_168606 ?auto_168609 ) ) ( not ( = ?auto_168606 ?auto_168610 ) ) ( not ( = ?auto_168606 ?auto_168611 ) ) ( not ( = ?auto_168607 ?auto_168608 ) ) ( not ( = ?auto_168607 ?auto_168609 ) ) ( not ( = ?auto_168607 ?auto_168610 ) ) ( not ( = ?auto_168607 ?auto_168611 ) ) ( not ( = ?auto_168608 ?auto_168609 ) ) ( not ( = ?auto_168608 ?auto_168610 ) ) ( not ( = ?auto_168608 ?auto_168611 ) ) ( not ( = ?auto_168609 ?auto_168610 ) ) ( not ( = ?auto_168609 ?auto_168611 ) ) ( not ( = ?auto_168610 ?auto_168611 ) ) ( ON ?auto_168611 ?auto_168613 ) ( not ( = ?auto_168606 ?auto_168613 ) ) ( not ( = ?auto_168607 ?auto_168613 ) ) ( not ( = ?auto_168608 ?auto_168613 ) ) ( not ( = ?auto_168609 ?auto_168613 ) ) ( not ( = ?auto_168610 ?auto_168613 ) ) ( not ( = ?auto_168611 ?auto_168613 ) ) ( ON ?auto_168610 ?auto_168611 ) ( ON-TABLE ?auto_168612 ) ( ON ?auto_168613 ?auto_168612 ) ( not ( = ?auto_168612 ?auto_168613 ) ) ( not ( = ?auto_168612 ?auto_168611 ) ) ( not ( = ?auto_168612 ?auto_168610 ) ) ( not ( = ?auto_168606 ?auto_168612 ) ) ( not ( = ?auto_168607 ?auto_168612 ) ) ( not ( = ?auto_168608 ?auto_168612 ) ) ( not ( = ?auto_168609 ?auto_168612 ) ) ( ON ?auto_168609 ?auto_168610 ) ( ON ?auto_168606 ?auto_168614 ) ( not ( = ?auto_168606 ?auto_168614 ) ) ( not ( = ?auto_168607 ?auto_168614 ) ) ( not ( = ?auto_168608 ?auto_168614 ) ) ( not ( = ?auto_168609 ?auto_168614 ) ) ( not ( = ?auto_168610 ?auto_168614 ) ) ( not ( = ?auto_168611 ?auto_168614 ) ) ( not ( = ?auto_168613 ?auto_168614 ) ) ( not ( = ?auto_168612 ?auto_168614 ) ) ( ON ?auto_168607 ?auto_168606 ) ( ON-TABLE ?auto_168614 ) ( CLEAR ?auto_168609 ) ( ON ?auto_168608 ?auto_168607 ) ( CLEAR ?auto_168608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_168614 ?auto_168606 ?auto_168607 )
      ( MAKE-6PILE ?auto_168606 ?auto_168607 ?auto_168608 ?auto_168609 ?auto_168610 ?auto_168611 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168615 - BLOCK
      ?auto_168616 - BLOCK
      ?auto_168617 - BLOCK
      ?auto_168618 - BLOCK
      ?auto_168619 - BLOCK
      ?auto_168620 - BLOCK
    )
    :vars
    (
      ?auto_168621 - BLOCK
      ?auto_168623 - BLOCK
      ?auto_168622 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168615 ?auto_168616 ) ) ( not ( = ?auto_168615 ?auto_168617 ) ) ( not ( = ?auto_168615 ?auto_168618 ) ) ( not ( = ?auto_168615 ?auto_168619 ) ) ( not ( = ?auto_168615 ?auto_168620 ) ) ( not ( = ?auto_168616 ?auto_168617 ) ) ( not ( = ?auto_168616 ?auto_168618 ) ) ( not ( = ?auto_168616 ?auto_168619 ) ) ( not ( = ?auto_168616 ?auto_168620 ) ) ( not ( = ?auto_168617 ?auto_168618 ) ) ( not ( = ?auto_168617 ?auto_168619 ) ) ( not ( = ?auto_168617 ?auto_168620 ) ) ( not ( = ?auto_168618 ?auto_168619 ) ) ( not ( = ?auto_168618 ?auto_168620 ) ) ( not ( = ?auto_168619 ?auto_168620 ) ) ( ON ?auto_168620 ?auto_168621 ) ( not ( = ?auto_168615 ?auto_168621 ) ) ( not ( = ?auto_168616 ?auto_168621 ) ) ( not ( = ?auto_168617 ?auto_168621 ) ) ( not ( = ?auto_168618 ?auto_168621 ) ) ( not ( = ?auto_168619 ?auto_168621 ) ) ( not ( = ?auto_168620 ?auto_168621 ) ) ( ON ?auto_168619 ?auto_168620 ) ( ON-TABLE ?auto_168623 ) ( ON ?auto_168621 ?auto_168623 ) ( not ( = ?auto_168623 ?auto_168621 ) ) ( not ( = ?auto_168623 ?auto_168620 ) ) ( not ( = ?auto_168623 ?auto_168619 ) ) ( not ( = ?auto_168615 ?auto_168623 ) ) ( not ( = ?auto_168616 ?auto_168623 ) ) ( not ( = ?auto_168617 ?auto_168623 ) ) ( not ( = ?auto_168618 ?auto_168623 ) ) ( ON ?auto_168615 ?auto_168622 ) ( not ( = ?auto_168615 ?auto_168622 ) ) ( not ( = ?auto_168616 ?auto_168622 ) ) ( not ( = ?auto_168617 ?auto_168622 ) ) ( not ( = ?auto_168618 ?auto_168622 ) ) ( not ( = ?auto_168619 ?auto_168622 ) ) ( not ( = ?auto_168620 ?auto_168622 ) ) ( not ( = ?auto_168621 ?auto_168622 ) ) ( not ( = ?auto_168623 ?auto_168622 ) ) ( ON ?auto_168616 ?auto_168615 ) ( ON-TABLE ?auto_168622 ) ( ON ?auto_168617 ?auto_168616 ) ( CLEAR ?auto_168617 ) ( HOLDING ?auto_168618 ) ( CLEAR ?auto_168619 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_168623 ?auto_168621 ?auto_168620 ?auto_168619 ?auto_168618 )
      ( MAKE-6PILE ?auto_168615 ?auto_168616 ?auto_168617 ?auto_168618 ?auto_168619 ?auto_168620 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168624 - BLOCK
      ?auto_168625 - BLOCK
      ?auto_168626 - BLOCK
      ?auto_168627 - BLOCK
      ?auto_168628 - BLOCK
      ?auto_168629 - BLOCK
    )
    :vars
    (
      ?auto_168630 - BLOCK
      ?auto_168631 - BLOCK
      ?auto_168632 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168624 ?auto_168625 ) ) ( not ( = ?auto_168624 ?auto_168626 ) ) ( not ( = ?auto_168624 ?auto_168627 ) ) ( not ( = ?auto_168624 ?auto_168628 ) ) ( not ( = ?auto_168624 ?auto_168629 ) ) ( not ( = ?auto_168625 ?auto_168626 ) ) ( not ( = ?auto_168625 ?auto_168627 ) ) ( not ( = ?auto_168625 ?auto_168628 ) ) ( not ( = ?auto_168625 ?auto_168629 ) ) ( not ( = ?auto_168626 ?auto_168627 ) ) ( not ( = ?auto_168626 ?auto_168628 ) ) ( not ( = ?auto_168626 ?auto_168629 ) ) ( not ( = ?auto_168627 ?auto_168628 ) ) ( not ( = ?auto_168627 ?auto_168629 ) ) ( not ( = ?auto_168628 ?auto_168629 ) ) ( ON ?auto_168629 ?auto_168630 ) ( not ( = ?auto_168624 ?auto_168630 ) ) ( not ( = ?auto_168625 ?auto_168630 ) ) ( not ( = ?auto_168626 ?auto_168630 ) ) ( not ( = ?auto_168627 ?auto_168630 ) ) ( not ( = ?auto_168628 ?auto_168630 ) ) ( not ( = ?auto_168629 ?auto_168630 ) ) ( ON ?auto_168628 ?auto_168629 ) ( ON-TABLE ?auto_168631 ) ( ON ?auto_168630 ?auto_168631 ) ( not ( = ?auto_168631 ?auto_168630 ) ) ( not ( = ?auto_168631 ?auto_168629 ) ) ( not ( = ?auto_168631 ?auto_168628 ) ) ( not ( = ?auto_168624 ?auto_168631 ) ) ( not ( = ?auto_168625 ?auto_168631 ) ) ( not ( = ?auto_168626 ?auto_168631 ) ) ( not ( = ?auto_168627 ?auto_168631 ) ) ( ON ?auto_168624 ?auto_168632 ) ( not ( = ?auto_168624 ?auto_168632 ) ) ( not ( = ?auto_168625 ?auto_168632 ) ) ( not ( = ?auto_168626 ?auto_168632 ) ) ( not ( = ?auto_168627 ?auto_168632 ) ) ( not ( = ?auto_168628 ?auto_168632 ) ) ( not ( = ?auto_168629 ?auto_168632 ) ) ( not ( = ?auto_168630 ?auto_168632 ) ) ( not ( = ?auto_168631 ?auto_168632 ) ) ( ON ?auto_168625 ?auto_168624 ) ( ON-TABLE ?auto_168632 ) ( ON ?auto_168626 ?auto_168625 ) ( CLEAR ?auto_168628 ) ( ON ?auto_168627 ?auto_168626 ) ( CLEAR ?auto_168627 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_168632 ?auto_168624 ?auto_168625 ?auto_168626 )
      ( MAKE-6PILE ?auto_168624 ?auto_168625 ?auto_168626 ?auto_168627 ?auto_168628 ?auto_168629 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168633 - BLOCK
      ?auto_168634 - BLOCK
      ?auto_168635 - BLOCK
      ?auto_168636 - BLOCK
      ?auto_168637 - BLOCK
      ?auto_168638 - BLOCK
    )
    :vars
    (
      ?auto_168640 - BLOCK
      ?auto_168641 - BLOCK
      ?auto_168639 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168633 ?auto_168634 ) ) ( not ( = ?auto_168633 ?auto_168635 ) ) ( not ( = ?auto_168633 ?auto_168636 ) ) ( not ( = ?auto_168633 ?auto_168637 ) ) ( not ( = ?auto_168633 ?auto_168638 ) ) ( not ( = ?auto_168634 ?auto_168635 ) ) ( not ( = ?auto_168634 ?auto_168636 ) ) ( not ( = ?auto_168634 ?auto_168637 ) ) ( not ( = ?auto_168634 ?auto_168638 ) ) ( not ( = ?auto_168635 ?auto_168636 ) ) ( not ( = ?auto_168635 ?auto_168637 ) ) ( not ( = ?auto_168635 ?auto_168638 ) ) ( not ( = ?auto_168636 ?auto_168637 ) ) ( not ( = ?auto_168636 ?auto_168638 ) ) ( not ( = ?auto_168637 ?auto_168638 ) ) ( ON ?auto_168638 ?auto_168640 ) ( not ( = ?auto_168633 ?auto_168640 ) ) ( not ( = ?auto_168634 ?auto_168640 ) ) ( not ( = ?auto_168635 ?auto_168640 ) ) ( not ( = ?auto_168636 ?auto_168640 ) ) ( not ( = ?auto_168637 ?auto_168640 ) ) ( not ( = ?auto_168638 ?auto_168640 ) ) ( ON-TABLE ?auto_168641 ) ( ON ?auto_168640 ?auto_168641 ) ( not ( = ?auto_168641 ?auto_168640 ) ) ( not ( = ?auto_168641 ?auto_168638 ) ) ( not ( = ?auto_168641 ?auto_168637 ) ) ( not ( = ?auto_168633 ?auto_168641 ) ) ( not ( = ?auto_168634 ?auto_168641 ) ) ( not ( = ?auto_168635 ?auto_168641 ) ) ( not ( = ?auto_168636 ?auto_168641 ) ) ( ON ?auto_168633 ?auto_168639 ) ( not ( = ?auto_168633 ?auto_168639 ) ) ( not ( = ?auto_168634 ?auto_168639 ) ) ( not ( = ?auto_168635 ?auto_168639 ) ) ( not ( = ?auto_168636 ?auto_168639 ) ) ( not ( = ?auto_168637 ?auto_168639 ) ) ( not ( = ?auto_168638 ?auto_168639 ) ) ( not ( = ?auto_168640 ?auto_168639 ) ) ( not ( = ?auto_168641 ?auto_168639 ) ) ( ON ?auto_168634 ?auto_168633 ) ( ON-TABLE ?auto_168639 ) ( ON ?auto_168635 ?auto_168634 ) ( ON ?auto_168636 ?auto_168635 ) ( CLEAR ?auto_168636 ) ( HOLDING ?auto_168637 ) ( CLEAR ?auto_168638 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_168641 ?auto_168640 ?auto_168638 ?auto_168637 )
      ( MAKE-6PILE ?auto_168633 ?auto_168634 ?auto_168635 ?auto_168636 ?auto_168637 ?auto_168638 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168642 - BLOCK
      ?auto_168643 - BLOCK
      ?auto_168644 - BLOCK
      ?auto_168645 - BLOCK
      ?auto_168646 - BLOCK
      ?auto_168647 - BLOCK
    )
    :vars
    (
      ?auto_168649 - BLOCK
      ?auto_168650 - BLOCK
      ?auto_168648 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168642 ?auto_168643 ) ) ( not ( = ?auto_168642 ?auto_168644 ) ) ( not ( = ?auto_168642 ?auto_168645 ) ) ( not ( = ?auto_168642 ?auto_168646 ) ) ( not ( = ?auto_168642 ?auto_168647 ) ) ( not ( = ?auto_168643 ?auto_168644 ) ) ( not ( = ?auto_168643 ?auto_168645 ) ) ( not ( = ?auto_168643 ?auto_168646 ) ) ( not ( = ?auto_168643 ?auto_168647 ) ) ( not ( = ?auto_168644 ?auto_168645 ) ) ( not ( = ?auto_168644 ?auto_168646 ) ) ( not ( = ?auto_168644 ?auto_168647 ) ) ( not ( = ?auto_168645 ?auto_168646 ) ) ( not ( = ?auto_168645 ?auto_168647 ) ) ( not ( = ?auto_168646 ?auto_168647 ) ) ( ON ?auto_168647 ?auto_168649 ) ( not ( = ?auto_168642 ?auto_168649 ) ) ( not ( = ?auto_168643 ?auto_168649 ) ) ( not ( = ?auto_168644 ?auto_168649 ) ) ( not ( = ?auto_168645 ?auto_168649 ) ) ( not ( = ?auto_168646 ?auto_168649 ) ) ( not ( = ?auto_168647 ?auto_168649 ) ) ( ON-TABLE ?auto_168650 ) ( ON ?auto_168649 ?auto_168650 ) ( not ( = ?auto_168650 ?auto_168649 ) ) ( not ( = ?auto_168650 ?auto_168647 ) ) ( not ( = ?auto_168650 ?auto_168646 ) ) ( not ( = ?auto_168642 ?auto_168650 ) ) ( not ( = ?auto_168643 ?auto_168650 ) ) ( not ( = ?auto_168644 ?auto_168650 ) ) ( not ( = ?auto_168645 ?auto_168650 ) ) ( ON ?auto_168642 ?auto_168648 ) ( not ( = ?auto_168642 ?auto_168648 ) ) ( not ( = ?auto_168643 ?auto_168648 ) ) ( not ( = ?auto_168644 ?auto_168648 ) ) ( not ( = ?auto_168645 ?auto_168648 ) ) ( not ( = ?auto_168646 ?auto_168648 ) ) ( not ( = ?auto_168647 ?auto_168648 ) ) ( not ( = ?auto_168649 ?auto_168648 ) ) ( not ( = ?auto_168650 ?auto_168648 ) ) ( ON ?auto_168643 ?auto_168642 ) ( ON-TABLE ?auto_168648 ) ( ON ?auto_168644 ?auto_168643 ) ( ON ?auto_168645 ?auto_168644 ) ( CLEAR ?auto_168647 ) ( ON ?auto_168646 ?auto_168645 ) ( CLEAR ?auto_168646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_168648 ?auto_168642 ?auto_168643 ?auto_168644 ?auto_168645 )
      ( MAKE-6PILE ?auto_168642 ?auto_168643 ?auto_168644 ?auto_168645 ?auto_168646 ?auto_168647 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168651 - BLOCK
      ?auto_168652 - BLOCK
      ?auto_168653 - BLOCK
      ?auto_168654 - BLOCK
      ?auto_168655 - BLOCK
      ?auto_168656 - BLOCK
    )
    :vars
    (
      ?auto_168657 - BLOCK
      ?auto_168658 - BLOCK
      ?auto_168659 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168651 ?auto_168652 ) ) ( not ( = ?auto_168651 ?auto_168653 ) ) ( not ( = ?auto_168651 ?auto_168654 ) ) ( not ( = ?auto_168651 ?auto_168655 ) ) ( not ( = ?auto_168651 ?auto_168656 ) ) ( not ( = ?auto_168652 ?auto_168653 ) ) ( not ( = ?auto_168652 ?auto_168654 ) ) ( not ( = ?auto_168652 ?auto_168655 ) ) ( not ( = ?auto_168652 ?auto_168656 ) ) ( not ( = ?auto_168653 ?auto_168654 ) ) ( not ( = ?auto_168653 ?auto_168655 ) ) ( not ( = ?auto_168653 ?auto_168656 ) ) ( not ( = ?auto_168654 ?auto_168655 ) ) ( not ( = ?auto_168654 ?auto_168656 ) ) ( not ( = ?auto_168655 ?auto_168656 ) ) ( not ( = ?auto_168651 ?auto_168657 ) ) ( not ( = ?auto_168652 ?auto_168657 ) ) ( not ( = ?auto_168653 ?auto_168657 ) ) ( not ( = ?auto_168654 ?auto_168657 ) ) ( not ( = ?auto_168655 ?auto_168657 ) ) ( not ( = ?auto_168656 ?auto_168657 ) ) ( ON-TABLE ?auto_168658 ) ( ON ?auto_168657 ?auto_168658 ) ( not ( = ?auto_168658 ?auto_168657 ) ) ( not ( = ?auto_168658 ?auto_168656 ) ) ( not ( = ?auto_168658 ?auto_168655 ) ) ( not ( = ?auto_168651 ?auto_168658 ) ) ( not ( = ?auto_168652 ?auto_168658 ) ) ( not ( = ?auto_168653 ?auto_168658 ) ) ( not ( = ?auto_168654 ?auto_168658 ) ) ( ON ?auto_168651 ?auto_168659 ) ( not ( = ?auto_168651 ?auto_168659 ) ) ( not ( = ?auto_168652 ?auto_168659 ) ) ( not ( = ?auto_168653 ?auto_168659 ) ) ( not ( = ?auto_168654 ?auto_168659 ) ) ( not ( = ?auto_168655 ?auto_168659 ) ) ( not ( = ?auto_168656 ?auto_168659 ) ) ( not ( = ?auto_168657 ?auto_168659 ) ) ( not ( = ?auto_168658 ?auto_168659 ) ) ( ON ?auto_168652 ?auto_168651 ) ( ON-TABLE ?auto_168659 ) ( ON ?auto_168653 ?auto_168652 ) ( ON ?auto_168654 ?auto_168653 ) ( ON ?auto_168655 ?auto_168654 ) ( CLEAR ?auto_168655 ) ( HOLDING ?auto_168656 ) ( CLEAR ?auto_168657 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_168658 ?auto_168657 ?auto_168656 )
      ( MAKE-6PILE ?auto_168651 ?auto_168652 ?auto_168653 ?auto_168654 ?auto_168655 ?auto_168656 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168660 - BLOCK
      ?auto_168661 - BLOCK
      ?auto_168662 - BLOCK
      ?auto_168663 - BLOCK
      ?auto_168664 - BLOCK
      ?auto_168665 - BLOCK
    )
    :vars
    (
      ?auto_168667 - BLOCK
      ?auto_168668 - BLOCK
      ?auto_168666 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168660 ?auto_168661 ) ) ( not ( = ?auto_168660 ?auto_168662 ) ) ( not ( = ?auto_168660 ?auto_168663 ) ) ( not ( = ?auto_168660 ?auto_168664 ) ) ( not ( = ?auto_168660 ?auto_168665 ) ) ( not ( = ?auto_168661 ?auto_168662 ) ) ( not ( = ?auto_168661 ?auto_168663 ) ) ( not ( = ?auto_168661 ?auto_168664 ) ) ( not ( = ?auto_168661 ?auto_168665 ) ) ( not ( = ?auto_168662 ?auto_168663 ) ) ( not ( = ?auto_168662 ?auto_168664 ) ) ( not ( = ?auto_168662 ?auto_168665 ) ) ( not ( = ?auto_168663 ?auto_168664 ) ) ( not ( = ?auto_168663 ?auto_168665 ) ) ( not ( = ?auto_168664 ?auto_168665 ) ) ( not ( = ?auto_168660 ?auto_168667 ) ) ( not ( = ?auto_168661 ?auto_168667 ) ) ( not ( = ?auto_168662 ?auto_168667 ) ) ( not ( = ?auto_168663 ?auto_168667 ) ) ( not ( = ?auto_168664 ?auto_168667 ) ) ( not ( = ?auto_168665 ?auto_168667 ) ) ( ON-TABLE ?auto_168668 ) ( ON ?auto_168667 ?auto_168668 ) ( not ( = ?auto_168668 ?auto_168667 ) ) ( not ( = ?auto_168668 ?auto_168665 ) ) ( not ( = ?auto_168668 ?auto_168664 ) ) ( not ( = ?auto_168660 ?auto_168668 ) ) ( not ( = ?auto_168661 ?auto_168668 ) ) ( not ( = ?auto_168662 ?auto_168668 ) ) ( not ( = ?auto_168663 ?auto_168668 ) ) ( ON ?auto_168660 ?auto_168666 ) ( not ( = ?auto_168660 ?auto_168666 ) ) ( not ( = ?auto_168661 ?auto_168666 ) ) ( not ( = ?auto_168662 ?auto_168666 ) ) ( not ( = ?auto_168663 ?auto_168666 ) ) ( not ( = ?auto_168664 ?auto_168666 ) ) ( not ( = ?auto_168665 ?auto_168666 ) ) ( not ( = ?auto_168667 ?auto_168666 ) ) ( not ( = ?auto_168668 ?auto_168666 ) ) ( ON ?auto_168661 ?auto_168660 ) ( ON-TABLE ?auto_168666 ) ( ON ?auto_168662 ?auto_168661 ) ( ON ?auto_168663 ?auto_168662 ) ( ON ?auto_168664 ?auto_168663 ) ( CLEAR ?auto_168667 ) ( ON ?auto_168665 ?auto_168664 ) ( CLEAR ?auto_168665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_168666 ?auto_168660 ?auto_168661 ?auto_168662 ?auto_168663 ?auto_168664 )
      ( MAKE-6PILE ?auto_168660 ?auto_168661 ?auto_168662 ?auto_168663 ?auto_168664 ?auto_168665 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168669 - BLOCK
      ?auto_168670 - BLOCK
      ?auto_168671 - BLOCK
      ?auto_168672 - BLOCK
      ?auto_168673 - BLOCK
      ?auto_168674 - BLOCK
    )
    :vars
    (
      ?auto_168675 - BLOCK
      ?auto_168677 - BLOCK
      ?auto_168676 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168669 ?auto_168670 ) ) ( not ( = ?auto_168669 ?auto_168671 ) ) ( not ( = ?auto_168669 ?auto_168672 ) ) ( not ( = ?auto_168669 ?auto_168673 ) ) ( not ( = ?auto_168669 ?auto_168674 ) ) ( not ( = ?auto_168670 ?auto_168671 ) ) ( not ( = ?auto_168670 ?auto_168672 ) ) ( not ( = ?auto_168670 ?auto_168673 ) ) ( not ( = ?auto_168670 ?auto_168674 ) ) ( not ( = ?auto_168671 ?auto_168672 ) ) ( not ( = ?auto_168671 ?auto_168673 ) ) ( not ( = ?auto_168671 ?auto_168674 ) ) ( not ( = ?auto_168672 ?auto_168673 ) ) ( not ( = ?auto_168672 ?auto_168674 ) ) ( not ( = ?auto_168673 ?auto_168674 ) ) ( not ( = ?auto_168669 ?auto_168675 ) ) ( not ( = ?auto_168670 ?auto_168675 ) ) ( not ( = ?auto_168671 ?auto_168675 ) ) ( not ( = ?auto_168672 ?auto_168675 ) ) ( not ( = ?auto_168673 ?auto_168675 ) ) ( not ( = ?auto_168674 ?auto_168675 ) ) ( ON-TABLE ?auto_168677 ) ( not ( = ?auto_168677 ?auto_168675 ) ) ( not ( = ?auto_168677 ?auto_168674 ) ) ( not ( = ?auto_168677 ?auto_168673 ) ) ( not ( = ?auto_168669 ?auto_168677 ) ) ( not ( = ?auto_168670 ?auto_168677 ) ) ( not ( = ?auto_168671 ?auto_168677 ) ) ( not ( = ?auto_168672 ?auto_168677 ) ) ( ON ?auto_168669 ?auto_168676 ) ( not ( = ?auto_168669 ?auto_168676 ) ) ( not ( = ?auto_168670 ?auto_168676 ) ) ( not ( = ?auto_168671 ?auto_168676 ) ) ( not ( = ?auto_168672 ?auto_168676 ) ) ( not ( = ?auto_168673 ?auto_168676 ) ) ( not ( = ?auto_168674 ?auto_168676 ) ) ( not ( = ?auto_168675 ?auto_168676 ) ) ( not ( = ?auto_168677 ?auto_168676 ) ) ( ON ?auto_168670 ?auto_168669 ) ( ON-TABLE ?auto_168676 ) ( ON ?auto_168671 ?auto_168670 ) ( ON ?auto_168672 ?auto_168671 ) ( ON ?auto_168673 ?auto_168672 ) ( ON ?auto_168674 ?auto_168673 ) ( CLEAR ?auto_168674 ) ( HOLDING ?auto_168675 ) ( CLEAR ?auto_168677 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_168677 ?auto_168675 )
      ( MAKE-6PILE ?auto_168669 ?auto_168670 ?auto_168671 ?auto_168672 ?auto_168673 ?auto_168674 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168678 - BLOCK
      ?auto_168679 - BLOCK
      ?auto_168680 - BLOCK
      ?auto_168681 - BLOCK
      ?auto_168682 - BLOCK
      ?auto_168683 - BLOCK
    )
    :vars
    (
      ?auto_168684 - BLOCK
      ?auto_168685 - BLOCK
      ?auto_168686 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168678 ?auto_168679 ) ) ( not ( = ?auto_168678 ?auto_168680 ) ) ( not ( = ?auto_168678 ?auto_168681 ) ) ( not ( = ?auto_168678 ?auto_168682 ) ) ( not ( = ?auto_168678 ?auto_168683 ) ) ( not ( = ?auto_168679 ?auto_168680 ) ) ( not ( = ?auto_168679 ?auto_168681 ) ) ( not ( = ?auto_168679 ?auto_168682 ) ) ( not ( = ?auto_168679 ?auto_168683 ) ) ( not ( = ?auto_168680 ?auto_168681 ) ) ( not ( = ?auto_168680 ?auto_168682 ) ) ( not ( = ?auto_168680 ?auto_168683 ) ) ( not ( = ?auto_168681 ?auto_168682 ) ) ( not ( = ?auto_168681 ?auto_168683 ) ) ( not ( = ?auto_168682 ?auto_168683 ) ) ( not ( = ?auto_168678 ?auto_168684 ) ) ( not ( = ?auto_168679 ?auto_168684 ) ) ( not ( = ?auto_168680 ?auto_168684 ) ) ( not ( = ?auto_168681 ?auto_168684 ) ) ( not ( = ?auto_168682 ?auto_168684 ) ) ( not ( = ?auto_168683 ?auto_168684 ) ) ( ON-TABLE ?auto_168685 ) ( not ( = ?auto_168685 ?auto_168684 ) ) ( not ( = ?auto_168685 ?auto_168683 ) ) ( not ( = ?auto_168685 ?auto_168682 ) ) ( not ( = ?auto_168678 ?auto_168685 ) ) ( not ( = ?auto_168679 ?auto_168685 ) ) ( not ( = ?auto_168680 ?auto_168685 ) ) ( not ( = ?auto_168681 ?auto_168685 ) ) ( ON ?auto_168678 ?auto_168686 ) ( not ( = ?auto_168678 ?auto_168686 ) ) ( not ( = ?auto_168679 ?auto_168686 ) ) ( not ( = ?auto_168680 ?auto_168686 ) ) ( not ( = ?auto_168681 ?auto_168686 ) ) ( not ( = ?auto_168682 ?auto_168686 ) ) ( not ( = ?auto_168683 ?auto_168686 ) ) ( not ( = ?auto_168684 ?auto_168686 ) ) ( not ( = ?auto_168685 ?auto_168686 ) ) ( ON ?auto_168679 ?auto_168678 ) ( ON-TABLE ?auto_168686 ) ( ON ?auto_168680 ?auto_168679 ) ( ON ?auto_168681 ?auto_168680 ) ( ON ?auto_168682 ?auto_168681 ) ( ON ?auto_168683 ?auto_168682 ) ( CLEAR ?auto_168685 ) ( ON ?auto_168684 ?auto_168683 ) ( CLEAR ?auto_168684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_168686 ?auto_168678 ?auto_168679 ?auto_168680 ?auto_168681 ?auto_168682 ?auto_168683 )
      ( MAKE-6PILE ?auto_168678 ?auto_168679 ?auto_168680 ?auto_168681 ?auto_168682 ?auto_168683 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168687 - BLOCK
      ?auto_168688 - BLOCK
      ?auto_168689 - BLOCK
      ?auto_168690 - BLOCK
      ?auto_168691 - BLOCK
      ?auto_168692 - BLOCK
    )
    :vars
    (
      ?auto_168695 - BLOCK
      ?auto_168694 - BLOCK
      ?auto_168693 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168687 ?auto_168688 ) ) ( not ( = ?auto_168687 ?auto_168689 ) ) ( not ( = ?auto_168687 ?auto_168690 ) ) ( not ( = ?auto_168687 ?auto_168691 ) ) ( not ( = ?auto_168687 ?auto_168692 ) ) ( not ( = ?auto_168688 ?auto_168689 ) ) ( not ( = ?auto_168688 ?auto_168690 ) ) ( not ( = ?auto_168688 ?auto_168691 ) ) ( not ( = ?auto_168688 ?auto_168692 ) ) ( not ( = ?auto_168689 ?auto_168690 ) ) ( not ( = ?auto_168689 ?auto_168691 ) ) ( not ( = ?auto_168689 ?auto_168692 ) ) ( not ( = ?auto_168690 ?auto_168691 ) ) ( not ( = ?auto_168690 ?auto_168692 ) ) ( not ( = ?auto_168691 ?auto_168692 ) ) ( not ( = ?auto_168687 ?auto_168695 ) ) ( not ( = ?auto_168688 ?auto_168695 ) ) ( not ( = ?auto_168689 ?auto_168695 ) ) ( not ( = ?auto_168690 ?auto_168695 ) ) ( not ( = ?auto_168691 ?auto_168695 ) ) ( not ( = ?auto_168692 ?auto_168695 ) ) ( not ( = ?auto_168694 ?auto_168695 ) ) ( not ( = ?auto_168694 ?auto_168692 ) ) ( not ( = ?auto_168694 ?auto_168691 ) ) ( not ( = ?auto_168687 ?auto_168694 ) ) ( not ( = ?auto_168688 ?auto_168694 ) ) ( not ( = ?auto_168689 ?auto_168694 ) ) ( not ( = ?auto_168690 ?auto_168694 ) ) ( ON ?auto_168687 ?auto_168693 ) ( not ( = ?auto_168687 ?auto_168693 ) ) ( not ( = ?auto_168688 ?auto_168693 ) ) ( not ( = ?auto_168689 ?auto_168693 ) ) ( not ( = ?auto_168690 ?auto_168693 ) ) ( not ( = ?auto_168691 ?auto_168693 ) ) ( not ( = ?auto_168692 ?auto_168693 ) ) ( not ( = ?auto_168695 ?auto_168693 ) ) ( not ( = ?auto_168694 ?auto_168693 ) ) ( ON ?auto_168688 ?auto_168687 ) ( ON-TABLE ?auto_168693 ) ( ON ?auto_168689 ?auto_168688 ) ( ON ?auto_168690 ?auto_168689 ) ( ON ?auto_168691 ?auto_168690 ) ( ON ?auto_168692 ?auto_168691 ) ( ON ?auto_168695 ?auto_168692 ) ( CLEAR ?auto_168695 ) ( HOLDING ?auto_168694 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_168694 )
      ( MAKE-6PILE ?auto_168687 ?auto_168688 ?auto_168689 ?auto_168690 ?auto_168691 ?auto_168692 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168696 - BLOCK
      ?auto_168697 - BLOCK
      ?auto_168698 - BLOCK
      ?auto_168699 - BLOCK
      ?auto_168700 - BLOCK
      ?auto_168701 - BLOCK
    )
    :vars
    (
      ?auto_168703 - BLOCK
      ?auto_168704 - BLOCK
      ?auto_168702 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168696 ?auto_168697 ) ) ( not ( = ?auto_168696 ?auto_168698 ) ) ( not ( = ?auto_168696 ?auto_168699 ) ) ( not ( = ?auto_168696 ?auto_168700 ) ) ( not ( = ?auto_168696 ?auto_168701 ) ) ( not ( = ?auto_168697 ?auto_168698 ) ) ( not ( = ?auto_168697 ?auto_168699 ) ) ( not ( = ?auto_168697 ?auto_168700 ) ) ( not ( = ?auto_168697 ?auto_168701 ) ) ( not ( = ?auto_168698 ?auto_168699 ) ) ( not ( = ?auto_168698 ?auto_168700 ) ) ( not ( = ?auto_168698 ?auto_168701 ) ) ( not ( = ?auto_168699 ?auto_168700 ) ) ( not ( = ?auto_168699 ?auto_168701 ) ) ( not ( = ?auto_168700 ?auto_168701 ) ) ( not ( = ?auto_168696 ?auto_168703 ) ) ( not ( = ?auto_168697 ?auto_168703 ) ) ( not ( = ?auto_168698 ?auto_168703 ) ) ( not ( = ?auto_168699 ?auto_168703 ) ) ( not ( = ?auto_168700 ?auto_168703 ) ) ( not ( = ?auto_168701 ?auto_168703 ) ) ( not ( = ?auto_168704 ?auto_168703 ) ) ( not ( = ?auto_168704 ?auto_168701 ) ) ( not ( = ?auto_168704 ?auto_168700 ) ) ( not ( = ?auto_168696 ?auto_168704 ) ) ( not ( = ?auto_168697 ?auto_168704 ) ) ( not ( = ?auto_168698 ?auto_168704 ) ) ( not ( = ?auto_168699 ?auto_168704 ) ) ( ON ?auto_168696 ?auto_168702 ) ( not ( = ?auto_168696 ?auto_168702 ) ) ( not ( = ?auto_168697 ?auto_168702 ) ) ( not ( = ?auto_168698 ?auto_168702 ) ) ( not ( = ?auto_168699 ?auto_168702 ) ) ( not ( = ?auto_168700 ?auto_168702 ) ) ( not ( = ?auto_168701 ?auto_168702 ) ) ( not ( = ?auto_168703 ?auto_168702 ) ) ( not ( = ?auto_168704 ?auto_168702 ) ) ( ON ?auto_168697 ?auto_168696 ) ( ON-TABLE ?auto_168702 ) ( ON ?auto_168698 ?auto_168697 ) ( ON ?auto_168699 ?auto_168698 ) ( ON ?auto_168700 ?auto_168699 ) ( ON ?auto_168701 ?auto_168700 ) ( ON ?auto_168703 ?auto_168701 ) ( ON ?auto_168704 ?auto_168703 ) ( CLEAR ?auto_168704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_168702 ?auto_168696 ?auto_168697 ?auto_168698 ?auto_168699 ?auto_168700 ?auto_168701 ?auto_168703 )
      ( MAKE-6PILE ?auto_168696 ?auto_168697 ?auto_168698 ?auto_168699 ?auto_168700 ?auto_168701 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_168716 - BLOCK
    )
    :vars
    (
      ?auto_168717 - BLOCK
      ?auto_168718 - BLOCK
      ?auto_168719 - BLOCK
      ?auto_168720 - BLOCK
      ?auto_168722 - BLOCK
      ?auto_168723 - BLOCK
      ?auto_168721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168717 ?auto_168716 ) ( ON-TABLE ?auto_168716 ) ( not ( = ?auto_168716 ?auto_168717 ) ) ( not ( = ?auto_168716 ?auto_168718 ) ) ( not ( = ?auto_168716 ?auto_168719 ) ) ( not ( = ?auto_168717 ?auto_168718 ) ) ( not ( = ?auto_168717 ?auto_168719 ) ) ( not ( = ?auto_168718 ?auto_168719 ) ) ( ON ?auto_168718 ?auto_168717 ) ( CLEAR ?auto_168718 ) ( HOLDING ?auto_168719 ) ( CLEAR ?auto_168720 ) ( ON-TABLE ?auto_168722 ) ( ON ?auto_168723 ?auto_168722 ) ( ON ?auto_168721 ?auto_168723 ) ( ON ?auto_168720 ?auto_168721 ) ( not ( = ?auto_168722 ?auto_168723 ) ) ( not ( = ?auto_168722 ?auto_168721 ) ) ( not ( = ?auto_168722 ?auto_168720 ) ) ( not ( = ?auto_168722 ?auto_168719 ) ) ( not ( = ?auto_168723 ?auto_168721 ) ) ( not ( = ?auto_168723 ?auto_168720 ) ) ( not ( = ?auto_168723 ?auto_168719 ) ) ( not ( = ?auto_168721 ?auto_168720 ) ) ( not ( = ?auto_168721 ?auto_168719 ) ) ( not ( = ?auto_168720 ?auto_168719 ) ) ( not ( = ?auto_168716 ?auto_168720 ) ) ( not ( = ?auto_168716 ?auto_168722 ) ) ( not ( = ?auto_168716 ?auto_168723 ) ) ( not ( = ?auto_168716 ?auto_168721 ) ) ( not ( = ?auto_168717 ?auto_168720 ) ) ( not ( = ?auto_168717 ?auto_168722 ) ) ( not ( = ?auto_168717 ?auto_168723 ) ) ( not ( = ?auto_168717 ?auto_168721 ) ) ( not ( = ?auto_168718 ?auto_168720 ) ) ( not ( = ?auto_168718 ?auto_168722 ) ) ( not ( = ?auto_168718 ?auto_168723 ) ) ( not ( = ?auto_168718 ?auto_168721 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_168722 ?auto_168723 ?auto_168721 ?auto_168720 ?auto_168719 )
      ( MAKE-1PILE ?auto_168716 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_168724 - BLOCK
    )
    :vars
    (
      ?auto_168726 - BLOCK
      ?auto_168729 - BLOCK
      ?auto_168727 - BLOCK
      ?auto_168730 - BLOCK
      ?auto_168725 - BLOCK
      ?auto_168728 - BLOCK
      ?auto_168731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168726 ?auto_168724 ) ( ON-TABLE ?auto_168724 ) ( not ( = ?auto_168724 ?auto_168726 ) ) ( not ( = ?auto_168724 ?auto_168729 ) ) ( not ( = ?auto_168724 ?auto_168727 ) ) ( not ( = ?auto_168726 ?auto_168729 ) ) ( not ( = ?auto_168726 ?auto_168727 ) ) ( not ( = ?auto_168729 ?auto_168727 ) ) ( ON ?auto_168729 ?auto_168726 ) ( CLEAR ?auto_168730 ) ( ON-TABLE ?auto_168725 ) ( ON ?auto_168728 ?auto_168725 ) ( ON ?auto_168731 ?auto_168728 ) ( ON ?auto_168730 ?auto_168731 ) ( not ( = ?auto_168725 ?auto_168728 ) ) ( not ( = ?auto_168725 ?auto_168731 ) ) ( not ( = ?auto_168725 ?auto_168730 ) ) ( not ( = ?auto_168725 ?auto_168727 ) ) ( not ( = ?auto_168728 ?auto_168731 ) ) ( not ( = ?auto_168728 ?auto_168730 ) ) ( not ( = ?auto_168728 ?auto_168727 ) ) ( not ( = ?auto_168731 ?auto_168730 ) ) ( not ( = ?auto_168731 ?auto_168727 ) ) ( not ( = ?auto_168730 ?auto_168727 ) ) ( not ( = ?auto_168724 ?auto_168730 ) ) ( not ( = ?auto_168724 ?auto_168725 ) ) ( not ( = ?auto_168724 ?auto_168728 ) ) ( not ( = ?auto_168724 ?auto_168731 ) ) ( not ( = ?auto_168726 ?auto_168730 ) ) ( not ( = ?auto_168726 ?auto_168725 ) ) ( not ( = ?auto_168726 ?auto_168728 ) ) ( not ( = ?auto_168726 ?auto_168731 ) ) ( not ( = ?auto_168729 ?auto_168730 ) ) ( not ( = ?auto_168729 ?auto_168725 ) ) ( not ( = ?auto_168729 ?auto_168728 ) ) ( not ( = ?auto_168729 ?auto_168731 ) ) ( ON ?auto_168727 ?auto_168729 ) ( CLEAR ?auto_168727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_168724 ?auto_168726 ?auto_168729 )
      ( MAKE-1PILE ?auto_168724 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_168732 - BLOCK
    )
    :vars
    (
      ?auto_168739 - BLOCK
      ?auto_168733 - BLOCK
      ?auto_168734 - BLOCK
      ?auto_168737 - BLOCK
      ?auto_168735 - BLOCK
      ?auto_168736 - BLOCK
      ?auto_168738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168739 ?auto_168732 ) ( ON-TABLE ?auto_168732 ) ( not ( = ?auto_168732 ?auto_168739 ) ) ( not ( = ?auto_168732 ?auto_168733 ) ) ( not ( = ?auto_168732 ?auto_168734 ) ) ( not ( = ?auto_168739 ?auto_168733 ) ) ( not ( = ?auto_168739 ?auto_168734 ) ) ( not ( = ?auto_168733 ?auto_168734 ) ) ( ON ?auto_168733 ?auto_168739 ) ( ON-TABLE ?auto_168737 ) ( ON ?auto_168735 ?auto_168737 ) ( ON ?auto_168736 ?auto_168735 ) ( not ( = ?auto_168737 ?auto_168735 ) ) ( not ( = ?auto_168737 ?auto_168736 ) ) ( not ( = ?auto_168737 ?auto_168738 ) ) ( not ( = ?auto_168737 ?auto_168734 ) ) ( not ( = ?auto_168735 ?auto_168736 ) ) ( not ( = ?auto_168735 ?auto_168738 ) ) ( not ( = ?auto_168735 ?auto_168734 ) ) ( not ( = ?auto_168736 ?auto_168738 ) ) ( not ( = ?auto_168736 ?auto_168734 ) ) ( not ( = ?auto_168738 ?auto_168734 ) ) ( not ( = ?auto_168732 ?auto_168738 ) ) ( not ( = ?auto_168732 ?auto_168737 ) ) ( not ( = ?auto_168732 ?auto_168735 ) ) ( not ( = ?auto_168732 ?auto_168736 ) ) ( not ( = ?auto_168739 ?auto_168738 ) ) ( not ( = ?auto_168739 ?auto_168737 ) ) ( not ( = ?auto_168739 ?auto_168735 ) ) ( not ( = ?auto_168739 ?auto_168736 ) ) ( not ( = ?auto_168733 ?auto_168738 ) ) ( not ( = ?auto_168733 ?auto_168737 ) ) ( not ( = ?auto_168733 ?auto_168735 ) ) ( not ( = ?auto_168733 ?auto_168736 ) ) ( ON ?auto_168734 ?auto_168733 ) ( CLEAR ?auto_168734 ) ( HOLDING ?auto_168738 ) ( CLEAR ?auto_168736 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_168737 ?auto_168735 ?auto_168736 ?auto_168738 )
      ( MAKE-1PILE ?auto_168732 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_168740 - BLOCK
    )
    :vars
    (
      ?auto_168744 - BLOCK
      ?auto_168743 - BLOCK
      ?auto_168742 - BLOCK
      ?auto_168747 - BLOCK
      ?auto_168741 - BLOCK
      ?auto_168745 - BLOCK
      ?auto_168746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168744 ?auto_168740 ) ( ON-TABLE ?auto_168740 ) ( not ( = ?auto_168740 ?auto_168744 ) ) ( not ( = ?auto_168740 ?auto_168743 ) ) ( not ( = ?auto_168740 ?auto_168742 ) ) ( not ( = ?auto_168744 ?auto_168743 ) ) ( not ( = ?auto_168744 ?auto_168742 ) ) ( not ( = ?auto_168743 ?auto_168742 ) ) ( ON ?auto_168743 ?auto_168744 ) ( ON-TABLE ?auto_168747 ) ( ON ?auto_168741 ?auto_168747 ) ( ON ?auto_168745 ?auto_168741 ) ( not ( = ?auto_168747 ?auto_168741 ) ) ( not ( = ?auto_168747 ?auto_168745 ) ) ( not ( = ?auto_168747 ?auto_168746 ) ) ( not ( = ?auto_168747 ?auto_168742 ) ) ( not ( = ?auto_168741 ?auto_168745 ) ) ( not ( = ?auto_168741 ?auto_168746 ) ) ( not ( = ?auto_168741 ?auto_168742 ) ) ( not ( = ?auto_168745 ?auto_168746 ) ) ( not ( = ?auto_168745 ?auto_168742 ) ) ( not ( = ?auto_168746 ?auto_168742 ) ) ( not ( = ?auto_168740 ?auto_168746 ) ) ( not ( = ?auto_168740 ?auto_168747 ) ) ( not ( = ?auto_168740 ?auto_168741 ) ) ( not ( = ?auto_168740 ?auto_168745 ) ) ( not ( = ?auto_168744 ?auto_168746 ) ) ( not ( = ?auto_168744 ?auto_168747 ) ) ( not ( = ?auto_168744 ?auto_168741 ) ) ( not ( = ?auto_168744 ?auto_168745 ) ) ( not ( = ?auto_168743 ?auto_168746 ) ) ( not ( = ?auto_168743 ?auto_168747 ) ) ( not ( = ?auto_168743 ?auto_168741 ) ) ( not ( = ?auto_168743 ?auto_168745 ) ) ( ON ?auto_168742 ?auto_168743 ) ( CLEAR ?auto_168745 ) ( ON ?auto_168746 ?auto_168742 ) ( CLEAR ?auto_168746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_168740 ?auto_168744 ?auto_168743 ?auto_168742 )
      ( MAKE-1PILE ?auto_168740 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_168748 - BLOCK
    )
    :vars
    (
      ?auto_168754 - BLOCK
      ?auto_168753 - BLOCK
      ?auto_168751 - BLOCK
      ?auto_168749 - BLOCK
      ?auto_168750 - BLOCK
      ?auto_168755 - BLOCK
      ?auto_168752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168754 ?auto_168748 ) ( ON-TABLE ?auto_168748 ) ( not ( = ?auto_168748 ?auto_168754 ) ) ( not ( = ?auto_168748 ?auto_168753 ) ) ( not ( = ?auto_168748 ?auto_168751 ) ) ( not ( = ?auto_168754 ?auto_168753 ) ) ( not ( = ?auto_168754 ?auto_168751 ) ) ( not ( = ?auto_168753 ?auto_168751 ) ) ( ON ?auto_168753 ?auto_168754 ) ( ON-TABLE ?auto_168749 ) ( ON ?auto_168750 ?auto_168749 ) ( not ( = ?auto_168749 ?auto_168750 ) ) ( not ( = ?auto_168749 ?auto_168755 ) ) ( not ( = ?auto_168749 ?auto_168752 ) ) ( not ( = ?auto_168749 ?auto_168751 ) ) ( not ( = ?auto_168750 ?auto_168755 ) ) ( not ( = ?auto_168750 ?auto_168752 ) ) ( not ( = ?auto_168750 ?auto_168751 ) ) ( not ( = ?auto_168755 ?auto_168752 ) ) ( not ( = ?auto_168755 ?auto_168751 ) ) ( not ( = ?auto_168752 ?auto_168751 ) ) ( not ( = ?auto_168748 ?auto_168752 ) ) ( not ( = ?auto_168748 ?auto_168749 ) ) ( not ( = ?auto_168748 ?auto_168750 ) ) ( not ( = ?auto_168748 ?auto_168755 ) ) ( not ( = ?auto_168754 ?auto_168752 ) ) ( not ( = ?auto_168754 ?auto_168749 ) ) ( not ( = ?auto_168754 ?auto_168750 ) ) ( not ( = ?auto_168754 ?auto_168755 ) ) ( not ( = ?auto_168753 ?auto_168752 ) ) ( not ( = ?auto_168753 ?auto_168749 ) ) ( not ( = ?auto_168753 ?auto_168750 ) ) ( not ( = ?auto_168753 ?auto_168755 ) ) ( ON ?auto_168751 ?auto_168753 ) ( ON ?auto_168752 ?auto_168751 ) ( CLEAR ?auto_168752 ) ( HOLDING ?auto_168755 ) ( CLEAR ?auto_168750 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_168749 ?auto_168750 ?auto_168755 )
      ( MAKE-1PILE ?auto_168748 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_168756 - BLOCK
    )
    :vars
    (
      ?auto_168763 - BLOCK
      ?auto_168760 - BLOCK
      ?auto_168759 - BLOCK
      ?auto_168761 - BLOCK
      ?auto_168757 - BLOCK
      ?auto_168758 - BLOCK
      ?auto_168762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168763 ?auto_168756 ) ( ON-TABLE ?auto_168756 ) ( not ( = ?auto_168756 ?auto_168763 ) ) ( not ( = ?auto_168756 ?auto_168760 ) ) ( not ( = ?auto_168756 ?auto_168759 ) ) ( not ( = ?auto_168763 ?auto_168760 ) ) ( not ( = ?auto_168763 ?auto_168759 ) ) ( not ( = ?auto_168760 ?auto_168759 ) ) ( ON ?auto_168760 ?auto_168763 ) ( ON-TABLE ?auto_168761 ) ( ON ?auto_168757 ?auto_168761 ) ( not ( = ?auto_168761 ?auto_168757 ) ) ( not ( = ?auto_168761 ?auto_168758 ) ) ( not ( = ?auto_168761 ?auto_168762 ) ) ( not ( = ?auto_168761 ?auto_168759 ) ) ( not ( = ?auto_168757 ?auto_168758 ) ) ( not ( = ?auto_168757 ?auto_168762 ) ) ( not ( = ?auto_168757 ?auto_168759 ) ) ( not ( = ?auto_168758 ?auto_168762 ) ) ( not ( = ?auto_168758 ?auto_168759 ) ) ( not ( = ?auto_168762 ?auto_168759 ) ) ( not ( = ?auto_168756 ?auto_168762 ) ) ( not ( = ?auto_168756 ?auto_168761 ) ) ( not ( = ?auto_168756 ?auto_168757 ) ) ( not ( = ?auto_168756 ?auto_168758 ) ) ( not ( = ?auto_168763 ?auto_168762 ) ) ( not ( = ?auto_168763 ?auto_168761 ) ) ( not ( = ?auto_168763 ?auto_168757 ) ) ( not ( = ?auto_168763 ?auto_168758 ) ) ( not ( = ?auto_168760 ?auto_168762 ) ) ( not ( = ?auto_168760 ?auto_168761 ) ) ( not ( = ?auto_168760 ?auto_168757 ) ) ( not ( = ?auto_168760 ?auto_168758 ) ) ( ON ?auto_168759 ?auto_168760 ) ( ON ?auto_168762 ?auto_168759 ) ( CLEAR ?auto_168757 ) ( ON ?auto_168758 ?auto_168762 ) ( CLEAR ?auto_168758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_168756 ?auto_168763 ?auto_168760 ?auto_168759 ?auto_168762 )
      ( MAKE-1PILE ?auto_168756 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_168764 - BLOCK
    )
    :vars
    (
      ?auto_168768 - BLOCK
      ?auto_168766 - BLOCK
      ?auto_168765 - BLOCK
      ?auto_168767 - BLOCK
      ?auto_168770 - BLOCK
      ?auto_168771 - BLOCK
      ?auto_168769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168768 ?auto_168764 ) ( ON-TABLE ?auto_168764 ) ( not ( = ?auto_168764 ?auto_168768 ) ) ( not ( = ?auto_168764 ?auto_168766 ) ) ( not ( = ?auto_168764 ?auto_168765 ) ) ( not ( = ?auto_168768 ?auto_168766 ) ) ( not ( = ?auto_168768 ?auto_168765 ) ) ( not ( = ?auto_168766 ?auto_168765 ) ) ( ON ?auto_168766 ?auto_168768 ) ( ON-TABLE ?auto_168767 ) ( not ( = ?auto_168767 ?auto_168770 ) ) ( not ( = ?auto_168767 ?auto_168771 ) ) ( not ( = ?auto_168767 ?auto_168769 ) ) ( not ( = ?auto_168767 ?auto_168765 ) ) ( not ( = ?auto_168770 ?auto_168771 ) ) ( not ( = ?auto_168770 ?auto_168769 ) ) ( not ( = ?auto_168770 ?auto_168765 ) ) ( not ( = ?auto_168771 ?auto_168769 ) ) ( not ( = ?auto_168771 ?auto_168765 ) ) ( not ( = ?auto_168769 ?auto_168765 ) ) ( not ( = ?auto_168764 ?auto_168769 ) ) ( not ( = ?auto_168764 ?auto_168767 ) ) ( not ( = ?auto_168764 ?auto_168770 ) ) ( not ( = ?auto_168764 ?auto_168771 ) ) ( not ( = ?auto_168768 ?auto_168769 ) ) ( not ( = ?auto_168768 ?auto_168767 ) ) ( not ( = ?auto_168768 ?auto_168770 ) ) ( not ( = ?auto_168768 ?auto_168771 ) ) ( not ( = ?auto_168766 ?auto_168769 ) ) ( not ( = ?auto_168766 ?auto_168767 ) ) ( not ( = ?auto_168766 ?auto_168770 ) ) ( not ( = ?auto_168766 ?auto_168771 ) ) ( ON ?auto_168765 ?auto_168766 ) ( ON ?auto_168769 ?auto_168765 ) ( ON ?auto_168771 ?auto_168769 ) ( CLEAR ?auto_168771 ) ( HOLDING ?auto_168770 ) ( CLEAR ?auto_168767 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_168767 ?auto_168770 )
      ( MAKE-1PILE ?auto_168764 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_168772 - BLOCK
    )
    :vars
    (
      ?auto_168774 - BLOCK
      ?auto_168777 - BLOCK
      ?auto_168778 - BLOCK
      ?auto_168773 - BLOCK
      ?auto_168776 - BLOCK
      ?auto_168775 - BLOCK
      ?auto_168779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168774 ?auto_168772 ) ( ON-TABLE ?auto_168772 ) ( not ( = ?auto_168772 ?auto_168774 ) ) ( not ( = ?auto_168772 ?auto_168777 ) ) ( not ( = ?auto_168772 ?auto_168778 ) ) ( not ( = ?auto_168774 ?auto_168777 ) ) ( not ( = ?auto_168774 ?auto_168778 ) ) ( not ( = ?auto_168777 ?auto_168778 ) ) ( ON ?auto_168777 ?auto_168774 ) ( ON-TABLE ?auto_168773 ) ( not ( = ?auto_168773 ?auto_168776 ) ) ( not ( = ?auto_168773 ?auto_168775 ) ) ( not ( = ?auto_168773 ?auto_168779 ) ) ( not ( = ?auto_168773 ?auto_168778 ) ) ( not ( = ?auto_168776 ?auto_168775 ) ) ( not ( = ?auto_168776 ?auto_168779 ) ) ( not ( = ?auto_168776 ?auto_168778 ) ) ( not ( = ?auto_168775 ?auto_168779 ) ) ( not ( = ?auto_168775 ?auto_168778 ) ) ( not ( = ?auto_168779 ?auto_168778 ) ) ( not ( = ?auto_168772 ?auto_168779 ) ) ( not ( = ?auto_168772 ?auto_168773 ) ) ( not ( = ?auto_168772 ?auto_168776 ) ) ( not ( = ?auto_168772 ?auto_168775 ) ) ( not ( = ?auto_168774 ?auto_168779 ) ) ( not ( = ?auto_168774 ?auto_168773 ) ) ( not ( = ?auto_168774 ?auto_168776 ) ) ( not ( = ?auto_168774 ?auto_168775 ) ) ( not ( = ?auto_168777 ?auto_168779 ) ) ( not ( = ?auto_168777 ?auto_168773 ) ) ( not ( = ?auto_168777 ?auto_168776 ) ) ( not ( = ?auto_168777 ?auto_168775 ) ) ( ON ?auto_168778 ?auto_168777 ) ( ON ?auto_168779 ?auto_168778 ) ( ON ?auto_168775 ?auto_168779 ) ( CLEAR ?auto_168773 ) ( ON ?auto_168776 ?auto_168775 ) ( CLEAR ?auto_168776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_168772 ?auto_168774 ?auto_168777 ?auto_168778 ?auto_168779 ?auto_168775 )
      ( MAKE-1PILE ?auto_168772 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_168780 - BLOCK
    )
    :vars
    (
      ?auto_168781 - BLOCK
      ?auto_168784 - BLOCK
      ?auto_168783 - BLOCK
      ?auto_168782 - BLOCK
      ?auto_168787 - BLOCK
      ?auto_168786 - BLOCK
      ?auto_168785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168781 ?auto_168780 ) ( ON-TABLE ?auto_168780 ) ( not ( = ?auto_168780 ?auto_168781 ) ) ( not ( = ?auto_168780 ?auto_168784 ) ) ( not ( = ?auto_168780 ?auto_168783 ) ) ( not ( = ?auto_168781 ?auto_168784 ) ) ( not ( = ?auto_168781 ?auto_168783 ) ) ( not ( = ?auto_168784 ?auto_168783 ) ) ( ON ?auto_168784 ?auto_168781 ) ( not ( = ?auto_168782 ?auto_168787 ) ) ( not ( = ?auto_168782 ?auto_168786 ) ) ( not ( = ?auto_168782 ?auto_168785 ) ) ( not ( = ?auto_168782 ?auto_168783 ) ) ( not ( = ?auto_168787 ?auto_168786 ) ) ( not ( = ?auto_168787 ?auto_168785 ) ) ( not ( = ?auto_168787 ?auto_168783 ) ) ( not ( = ?auto_168786 ?auto_168785 ) ) ( not ( = ?auto_168786 ?auto_168783 ) ) ( not ( = ?auto_168785 ?auto_168783 ) ) ( not ( = ?auto_168780 ?auto_168785 ) ) ( not ( = ?auto_168780 ?auto_168782 ) ) ( not ( = ?auto_168780 ?auto_168787 ) ) ( not ( = ?auto_168780 ?auto_168786 ) ) ( not ( = ?auto_168781 ?auto_168785 ) ) ( not ( = ?auto_168781 ?auto_168782 ) ) ( not ( = ?auto_168781 ?auto_168787 ) ) ( not ( = ?auto_168781 ?auto_168786 ) ) ( not ( = ?auto_168784 ?auto_168785 ) ) ( not ( = ?auto_168784 ?auto_168782 ) ) ( not ( = ?auto_168784 ?auto_168787 ) ) ( not ( = ?auto_168784 ?auto_168786 ) ) ( ON ?auto_168783 ?auto_168784 ) ( ON ?auto_168785 ?auto_168783 ) ( ON ?auto_168786 ?auto_168785 ) ( ON ?auto_168787 ?auto_168786 ) ( CLEAR ?auto_168787 ) ( HOLDING ?auto_168782 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_168782 )
      ( MAKE-1PILE ?auto_168780 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_168797 - BLOCK
    )
    :vars
    (
      ?auto_168801 - BLOCK
      ?auto_168798 - BLOCK
      ?auto_168800 - BLOCK
      ?auto_168804 - BLOCK
      ?auto_168803 - BLOCK
      ?auto_168799 - BLOCK
      ?auto_168802 - BLOCK
      ?auto_168805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168801 ?auto_168797 ) ( ON-TABLE ?auto_168797 ) ( not ( = ?auto_168797 ?auto_168801 ) ) ( not ( = ?auto_168797 ?auto_168798 ) ) ( not ( = ?auto_168797 ?auto_168800 ) ) ( not ( = ?auto_168801 ?auto_168798 ) ) ( not ( = ?auto_168801 ?auto_168800 ) ) ( not ( = ?auto_168798 ?auto_168800 ) ) ( ON ?auto_168798 ?auto_168801 ) ( not ( = ?auto_168804 ?auto_168803 ) ) ( not ( = ?auto_168804 ?auto_168799 ) ) ( not ( = ?auto_168804 ?auto_168802 ) ) ( not ( = ?auto_168804 ?auto_168800 ) ) ( not ( = ?auto_168803 ?auto_168799 ) ) ( not ( = ?auto_168803 ?auto_168802 ) ) ( not ( = ?auto_168803 ?auto_168800 ) ) ( not ( = ?auto_168799 ?auto_168802 ) ) ( not ( = ?auto_168799 ?auto_168800 ) ) ( not ( = ?auto_168802 ?auto_168800 ) ) ( not ( = ?auto_168797 ?auto_168802 ) ) ( not ( = ?auto_168797 ?auto_168804 ) ) ( not ( = ?auto_168797 ?auto_168803 ) ) ( not ( = ?auto_168797 ?auto_168799 ) ) ( not ( = ?auto_168801 ?auto_168802 ) ) ( not ( = ?auto_168801 ?auto_168804 ) ) ( not ( = ?auto_168801 ?auto_168803 ) ) ( not ( = ?auto_168801 ?auto_168799 ) ) ( not ( = ?auto_168798 ?auto_168802 ) ) ( not ( = ?auto_168798 ?auto_168804 ) ) ( not ( = ?auto_168798 ?auto_168803 ) ) ( not ( = ?auto_168798 ?auto_168799 ) ) ( ON ?auto_168800 ?auto_168798 ) ( ON ?auto_168802 ?auto_168800 ) ( ON ?auto_168799 ?auto_168802 ) ( ON ?auto_168803 ?auto_168799 ) ( CLEAR ?auto_168803 ) ( ON ?auto_168804 ?auto_168805 ) ( CLEAR ?auto_168804 ) ( HAND-EMPTY ) ( not ( = ?auto_168797 ?auto_168805 ) ) ( not ( = ?auto_168801 ?auto_168805 ) ) ( not ( = ?auto_168798 ?auto_168805 ) ) ( not ( = ?auto_168800 ?auto_168805 ) ) ( not ( = ?auto_168804 ?auto_168805 ) ) ( not ( = ?auto_168803 ?auto_168805 ) ) ( not ( = ?auto_168799 ?auto_168805 ) ) ( not ( = ?auto_168802 ?auto_168805 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_168804 ?auto_168805 )
      ( MAKE-1PILE ?auto_168797 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_168806 - BLOCK
    )
    :vars
    (
      ?auto_168813 - BLOCK
      ?auto_168808 - BLOCK
      ?auto_168810 - BLOCK
      ?auto_168812 - BLOCK
      ?auto_168809 - BLOCK
      ?auto_168807 - BLOCK
      ?auto_168811 - BLOCK
      ?auto_168814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168813 ?auto_168806 ) ( ON-TABLE ?auto_168806 ) ( not ( = ?auto_168806 ?auto_168813 ) ) ( not ( = ?auto_168806 ?auto_168808 ) ) ( not ( = ?auto_168806 ?auto_168810 ) ) ( not ( = ?auto_168813 ?auto_168808 ) ) ( not ( = ?auto_168813 ?auto_168810 ) ) ( not ( = ?auto_168808 ?auto_168810 ) ) ( ON ?auto_168808 ?auto_168813 ) ( not ( = ?auto_168812 ?auto_168809 ) ) ( not ( = ?auto_168812 ?auto_168807 ) ) ( not ( = ?auto_168812 ?auto_168811 ) ) ( not ( = ?auto_168812 ?auto_168810 ) ) ( not ( = ?auto_168809 ?auto_168807 ) ) ( not ( = ?auto_168809 ?auto_168811 ) ) ( not ( = ?auto_168809 ?auto_168810 ) ) ( not ( = ?auto_168807 ?auto_168811 ) ) ( not ( = ?auto_168807 ?auto_168810 ) ) ( not ( = ?auto_168811 ?auto_168810 ) ) ( not ( = ?auto_168806 ?auto_168811 ) ) ( not ( = ?auto_168806 ?auto_168812 ) ) ( not ( = ?auto_168806 ?auto_168809 ) ) ( not ( = ?auto_168806 ?auto_168807 ) ) ( not ( = ?auto_168813 ?auto_168811 ) ) ( not ( = ?auto_168813 ?auto_168812 ) ) ( not ( = ?auto_168813 ?auto_168809 ) ) ( not ( = ?auto_168813 ?auto_168807 ) ) ( not ( = ?auto_168808 ?auto_168811 ) ) ( not ( = ?auto_168808 ?auto_168812 ) ) ( not ( = ?auto_168808 ?auto_168809 ) ) ( not ( = ?auto_168808 ?auto_168807 ) ) ( ON ?auto_168810 ?auto_168808 ) ( ON ?auto_168811 ?auto_168810 ) ( ON ?auto_168807 ?auto_168811 ) ( ON ?auto_168812 ?auto_168814 ) ( CLEAR ?auto_168812 ) ( not ( = ?auto_168806 ?auto_168814 ) ) ( not ( = ?auto_168813 ?auto_168814 ) ) ( not ( = ?auto_168808 ?auto_168814 ) ) ( not ( = ?auto_168810 ?auto_168814 ) ) ( not ( = ?auto_168812 ?auto_168814 ) ) ( not ( = ?auto_168809 ?auto_168814 ) ) ( not ( = ?auto_168807 ?auto_168814 ) ) ( not ( = ?auto_168811 ?auto_168814 ) ) ( HOLDING ?auto_168809 ) ( CLEAR ?auto_168807 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_168806 ?auto_168813 ?auto_168808 ?auto_168810 ?auto_168811 ?auto_168807 ?auto_168809 )
      ( MAKE-1PILE ?auto_168806 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_168815 - BLOCK
    )
    :vars
    (
      ?auto_168817 - BLOCK
      ?auto_168820 - BLOCK
      ?auto_168822 - BLOCK
      ?auto_168821 - BLOCK
      ?auto_168823 - BLOCK
      ?auto_168816 - BLOCK
      ?auto_168818 - BLOCK
      ?auto_168819 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168817 ?auto_168815 ) ( ON-TABLE ?auto_168815 ) ( not ( = ?auto_168815 ?auto_168817 ) ) ( not ( = ?auto_168815 ?auto_168820 ) ) ( not ( = ?auto_168815 ?auto_168822 ) ) ( not ( = ?auto_168817 ?auto_168820 ) ) ( not ( = ?auto_168817 ?auto_168822 ) ) ( not ( = ?auto_168820 ?auto_168822 ) ) ( ON ?auto_168820 ?auto_168817 ) ( not ( = ?auto_168821 ?auto_168823 ) ) ( not ( = ?auto_168821 ?auto_168816 ) ) ( not ( = ?auto_168821 ?auto_168818 ) ) ( not ( = ?auto_168821 ?auto_168822 ) ) ( not ( = ?auto_168823 ?auto_168816 ) ) ( not ( = ?auto_168823 ?auto_168818 ) ) ( not ( = ?auto_168823 ?auto_168822 ) ) ( not ( = ?auto_168816 ?auto_168818 ) ) ( not ( = ?auto_168816 ?auto_168822 ) ) ( not ( = ?auto_168818 ?auto_168822 ) ) ( not ( = ?auto_168815 ?auto_168818 ) ) ( not ( = ?auto_168815 ?auto_168821 ) ) ( not ( = ?auto_168815 ?auto_168823 ) ) ( not ( = ?auto_168815 ?auto_168816 ) ) ( not ( = ?auto_168817 ?auto_168818 ) ) ( not ( = ?auto_168817 ?auto_168821 ) ) ( not ( = ?auto_168817 ?auto_168823 ) ) ( not ( = ?auto_168817 ?auto_168816 ) ) ( not ( = ?auto_168820 ?auto_168818 ) ) ( not ( = ?auto_168820 ?auto_168821 ) ) ( not ( = ?auto_168820 ?auto_168823 ) ) ( not ( = ?auto_168820 ?auto_168816 ) ) ( ON ?auto_168822 ?auto_168820 ) ( ON ?auto_168818 ?auto_168822 ) ( ON ?auto_168816 ?auto_168818 ) ( ON ?auto_168821 ?auto_168819 ) ( not ( = ?auto_168815 ?auto_168819 ) ) ( not ( = ?auto_168817 ?auto_168819 ) ) ( not ( = ?auto_168820 ?auto_168819 ) ) ( not ( = ?auto_168822 ?auto_168819 ) ) ( not ( = ?auto_168821 ?auto_168819 ) ) ( not ( = ?auto_168823 ?auto_168819 ) ) ( not ( = ?auto_168816 ?auto_168819 ) ) ( not ( = ?auto_168818 ?auto_168819 ) ) ( CLEAR ?auto_168816 ) ( ON ?auto_168823 ?auto_168821 ) ( CLEAR ?auto_168823 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_168819 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_168819 ?auto_168821 )
      ( MAKE-1PILE ?auto_168815 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_168824 - BLOCK
    )
    :vars
    (
      ?auto_168828 - BLOCK
      ?auto_168830 - BLOCK
      ?auto_168829 - BLOCK
      ?auto_168826 - BLOCK
      ?auto_168825 - BLOCK
      ?auto_168832 - BLOCK
      ?auto_168827 - BLOCK
      ?auto_168831 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168828 ?auto_168824 ) ( ON-TABLE ?auto_168824 ) ( not ( = ?auto_168824 ?auto_168828 ) ) ( not ( = ?auto_168824 ?auto_168830 ) ) ( not ( = ?auto_168824 ?auto_168829 ) ) ( not ( = ?auto_168828 ?auto_168830 ) ) ( not ( = ?auto_168828 ?auto_168829 ) ) ( not ( = ?auto_168830 ?auto_168829 ) ) ( ON ?auto_168830 ?auto_168828 ) ( not ( = ?auto_168826 ?auto_168825 ) ) ( not ( = ?auto_168826 ?auto_168832 ) ) ( not ( = ?auto_168826 ?auto_168827 ) ) ( not ( = ?auto_168826 ?auto_168829 ) ) ( not ( = ?auto_168825 ?auto_168832 ) ) ( not ( = ?auto_168825 ?auto_168827 ) ) ( not ( = ?auto_168825 ?auto_168829 ) ) ( not ( = ?auto_168832 ?auto_168827 ) ) ( not ( = ?auto_168832 ?auto_168829 ) ) ( not ( = ?auto_168827 ?auto_168829 ) ) ( not ( = ?auto_168824 ?auto_168827 ) ) ( not ( = ?auto_168824 ?auto_168826 ) ) ( not ( = ?auto_168824 ?auto_168825 ) ) ( not ( = ?auto_168824 ?auto_168832 ) ) ( not ( = ?auto_168828 ?auto_168827 ) ) ( not ( = ?auto_168828 ?auto_168826 ) ) ( not ( = ?auto_168828 ?auto_168825 ) ) ( not ( = ?auto_168828 ?auto_168832 ) ) ( not ( = ?auto_168830 ?auto_168827 ) ) ( not ( = ?auto_168830 ?auto_168826 ) ) ( not ( = ?auto_168830 ?auto_168825 ) ) ( not ( = ?auto_168830 ?auto_168832 ) ) ( ON ?auto_168829 ?auto_168830 ) ( ON ?auto_168827 ?auto_168829 ) ( ON ?auto_168826 ?auto_168831 ) ( not ( = ?auto_168824 ?auto_168831 ) ) ( not ( = ?auto_168828 ?auto_168831 ) ) ( not ( = ?auto_168830 ?auto_168831 ) ) ( not ( = ?auto_168829 ?auto_168831 ) ) ( not ( = ?auto_168826 ?auto_168831 ) ) ( not ( = ?auto_168825 ?auto_168831 ) ) ( not ( = ?auto_168832 ?auto_168831 ) ) ( not ( = ?auto_168827 ?auto_168831 ) ) ( ON ?auto_168825 ?auto_168826 ) ( CLEAR ?auto_168825 ) ( ON-TABLE ?auto_168831 ) ( HOLDING ?auto_168832 ) ( CLEAR ?auto_168827 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_168824 ?auto_168828 ?auto_168830 ?auto_168829 ?auto_168827 ?auto_168832 )
      ( MAKE-1PILE ?auto_168824 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_168833 - BLOCK
    )
    :vars
    (
      ?auto_168835 - BLOCK
      ?auto_168834 - BLOCK
      ?auto_168836 - BLOCK
      ?auto_168839 - BLOCK
      ?auto_168841 - BLOCK
      ?auto_168840 - BLOCK
      ?auto_168837 - BLOCK
      ?auto_168838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168835 ?auto_168833 ) ( ON-TABLE ?auto_168833 ) ( not ( = ?auto_168833 ?auto_168835 ) ) ( not ( = ?auto_168833 ?auto_168834 ) ) ( not ( = ?auto_168833 ?auto_168836 ) ) ( not ( = ?auto_168835 ?auto_168834 ) ) ( not ( = ?auto_168835 ?auto_168836 ) ) ( not ( = ?auto_168834 ?auto_168836 ) ) ( ON ?auto_168834 ?auto_168835 ) ( not ( = ?auto_168839 ?auto_168841 ) ) ( not ( = ?auto_168839 ?auto_168840 ) ) ( not ( = ?auto_168839 ?auto_168837 ) ) ( not ( = ?auto_168839 ?auto_168836 ) ) ( not ( = ?auto_168841 ?auto_168840 ) ) ( not ( = ?auto_168841 ?auto_168837 ) ) ( not ( = ?auto_168841 ?auto_168836 ) ) ( not ( = ?auto_168840 ?auto_168837 ) ) ( not ( = ?auto_168840 ?auto_168836 ) ) ( not ( = ?auto_168837 ?auto_168836 ) ) ( not ( = ?auto_168833 ?auto_168837 ) ) ( not ( = ?auto_168833 ?auto_168839 ) ) ( not ( = ?auto_168833 ?auto_168841 ) ) ( not ( = ?auto_168833 ?auto_168840 ) ) ( not ( = ?auto_168835 ?auto_168837 ) ) ( not ( = ?auto_168835 ?auto_168839 ) ) ( not ( = ?auto_168835 ?auto_168841 ) ) ( not ( = ?auto_168835 ?auto_168840 ) ) ( not ( = ?auto_168834 ?auto_168837 ) ) ( not ( = ?auto_168834 ?auto_168839 ) ) ( not ( = ?auto_168834 ?auto_168841 ) ) ( not ( = ?auto_168834 ?auto_168840 ) ) ( ON ?auto_168836 ?auto_168834 ) ( ON ?auto_168837 ?auto_168836 ) ( ON ?auto_168839 ?auto_168838 ) ( not ( = ?auto_168833 ?auto_168838 ) ) ( not ( = ?auto_168835 ?auto_168838 ) ) ( not ( = ?auto_168834 ?auto_168838 ) ) ( not ( = ?auto_168836 ?auto_168838 ) ) ( not ( = ?auto_168839 ?auto_168838 ) ) ( not ( = ?auto_168841 ?auto_168838 ) ) ( not ( = ?auto_168840 ?auto_168838 ) ) ( not ( = ?auto_168837 ?auto_168838 ) ) ( ON ?auto_168841 ?auto_168839 ) ( ON-TABLE ?auto_168838 ) ( CLEAR ?auto_168837 ) ( ON ?auto_168840 ?auto_168841 ) ( CLEAR ?auto_168840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_168838 ?auto_168839 ?auto_168841 )
      ( MAKE-1PILE ?auto_168833 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_168885 - BLOCK
      ?auto_168886 - BLOCK
      ?auto_168887 - BLOCK
      ?auto_168888 - BLOCK
      ?auto_168889 - BLOCK
      ?auto_168890 - BLOCK
      ?auto_168891 - BLOCK
    )
    :vars
    (
      ?auto_168892 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168885 ) ( ON ?auto_168886 ?auto_168885 ) ( ON ?auto_168887 ?auto_168886 ) ( ON ?auto_168888 ?auto_168887 ) ( ON ?auto_168889 ?auto_168888 ) ( not ( = ?auto_168885 ?auto_168886 ) ) ( not ( = ?auto_168885 ?auto_168887 ) ) ( not ( = ?auto_168885 ?auto_168888 ) ) ( not ( = ?auto_168885 ?auto_168889 ) ) ( not ( = ?auto_168885 ?auto_168890 ) ) ( not ( = ?auto_168885 ?auto_168891 ) ) ( not ( = ?auto_168886 ?auto_168887 ) ) ( not ( = ?auto_168886 ?auto_168888 ) ) ( not ( = ?auto_168886 ?auto_168889 ) ) ( not ( = ?auto_168886 ?auto_168890 ) ) ( not ( = ?auto_168886 ?auto_168891 ) ) ( not ( = ?auto_168887 ?auto_168888 ) ) ( not ( = ?auto_168887 ?auto_168889 ) ) ( not ( = ?auto_168887 ?auto_168890 ) ) ( not ( = ?auto_168887 ?auto_168891 ) ) ( not ( = ?auto_168888 ?auto_168889 ) ) ( not ( = ?auto_168888 ?auto_168890 ) ) ( not ( = ?auto_168888 ?auto_168891 ) ) ( not ( = ?auto_168889 ?auto_168890 ) ) ( not ( = ?auto_168889 ?auto_168891 ) ) ( not ( = ?auto_168890 ?auto_168891 ) ) ( ON ?auto_168891 ?auto_168892 ) ( not ( = ?auto_168885 ?auto_168892 ) ) ( not ( = ?auto_168886 ?auto_168892 ) ) ( not ( = ?auto_168887 ?auto_168892 ) ) ( not ( = ?auto_168888 ?auto_168892 ) ) ( not ( = ?auto_168889 ?auto_168892 ) ) ( not ( = ?auto_168890 ?auto_168892 ) ) ( not ( = ?auto_168891 ?auto_168892 ) ) ( CLEAR ?auto_168889 ) ( ON ?auto_168890 ?auto_168891 ) ( CLEAR ?auto_168890 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_168892 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_168892 ?auto_168891 )
      ( MAKE-7PILE ?auto_168885 ?auto_168886 ?auto_168887 ?auto_168888 ?auto_168889 ?auto_168890 ?auto_168891 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_168893 - BLOCK
      ?auto_168894 - BLOCK
      ?auto_168895 - BLOCK
      ?auto_168896 - BLOCK
      ?auto_168897 - BLOCK
      ?auto_168898 - BLOCK
      ?auto_168899 - BLOCK
    )
    :vars
    (
      ?auto_168900 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168893 ) ( ON ?auto_168894 ?auto_168893 ) ( ON ?auto_168895 ?auto_168894 ) ( ON ?auto_168896 ?auto_168895 ) ( not ( = ?auto_168893 ?auto_168894 ) ) ( not ( = ?auto_168893 ?auto_168895 ) ) ( not ( = ?auto_168893 ?auto_168896 ) ) ( not ( = ?auto_168893 ?auto_168897 ) ) ( not ( = ?auto_168893 ?auto_168898 ) ) ( not ( = ?auto_168893 ?auto_168899 ) ) ( not ( = ?auto_168894 ?auto_168895 ) ) ( not ( = ?auto_168894 ?auto_168896 ) ) ( not ( = ?auto_168894 ?auto_168897 ) ) ( not ( = ?auto_168894 ?auto_168898 ) ) ( not ( = ?auto_168894 ?auto_168899 ) ) ( not ( = ?auto_168895 ?auto_168896 ) ) ( not ( = ?auto_168895 ?auto_168897 ) ) ( not ( = ?auto_168895 ?auto_168898 ) ) ( not ( = ?auto_168895 ?auto_168899 ) ) ( not ( = ?auto_168896 ?auto_168897 ) ) ( not ( = ?auto_168896 ?auto_168898 ) ) ( not ( = ?auto_168896 ?auto_168899 ) ) ( not ( = ?auto_168897 ?auto_168898 ) ) ( not ( = ?auto_168897 ?auto_168899 ) ) ( not ( = ?auto_168898 ?auto_168899 ) ) ( ON ?auto_168899 ?auto_168900 ) ( not ( = ?auto_168893 ?auto_168900 ) ) ( not ( = ?auto_168894 ?auto_168900 ) ) ( not ( = ?auto_168895 ?auto_168900 ) ) ( not ( = ?auto_168896 ?auto_168900 ) ) ( not ( = ?auto_168897 ?auto_168900 ) ) ( not ( = ?auto_168898 ?auto_168900 ) ) ( not ( = ?auto_168899 ?auto_168900 ) ) ( ON ?auto_168898 ?auto_168899 ) ( CLEAR ?auto_168898 ) ( ON-TABLE ?auto_168900 ) ( HOLDING ?auto_168897 ) ( CLEAR ?auto_168896 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_168893 ?auto_168894 ?auto_168895 ?auto_168896 ?auto_168897 )
      ( MAKE-7PILE ?auto_168893 ?auto_168894 ?auto_168895 ?auto_168896 ?auto_168897 ?auto_168898 ?auto_168899 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_168901 - BLOCK
      ?auto_168902 - BLOCK
      ?auto_168903 - BLOCK
      ?auto_168904 - BLOCK
      ?auto_168905 - BLOCK
      ?auto_168906 - BLOCK
      ?auto_168907 - BLOCK
    )
    :vars
    (
      ?auto_168908 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168901 ) ( ON ?auto_168902 ?auto_168901 ) ( ON ?auto_168903 ?auto_168902 ) ( ON ?auto_168904 ?auto_168903 ) ( not ( = ?auto_168901 ?auto_168902 ) ) ( not ( = ?auto_168901 ?auto_168903 ) ) ( not ( = ?auto_168901 ?auto_168904 ) ) ( not ( = ?auto_168901 ?auto_168905 ) ) ( not ( = ?auto_168901 ?auto_168906 ) ) ( not ( = ?auto_168901 ?auto_168907 ) ) ( not ( = ?auto_168902 ?auto_168903 ) ) ( not ( = ?auto_168902 ?auto_168904 ) ) ( not ( = ?auto_168902 ?auto_168905 ) ) ( not ( = ?auto_168902 ?auto_168906 ) ) ( not ( = ?auto_168902 ?auto_168907 ) ) ( not ( = ?auto_168903 ?auto_168904 ) ) ( not ( = ?auto_168903 ?auto_168905 ) ) ( not ( = ?auto_168903 ?auto_168906 ) ) ( not ( = ?auto_168903 ?auto_168907 ) ) ( not ( = ?auto_168904 ?auto_168905 ) ) ( not ( = ?auto_168904 ?auto_168906 ) ) ( not ( = ?auto_168904 ?auto_168907 ) ) ( not ( = ?auto_168905 ?auto_168906 ) ) ( not ( = ?auto_168905 ?auto_168907 ) ) ( not ( = ?auto_168906 ?auto_168907 ) ) ( ON ?auto_168907 ?auto_168908 ) ( not ( = ?auto_168901 ?auto_168908 ) ) ( not ( = ?auto_168902 ?auto_168908 ) ) ( not ( = ?auto_168903 ?auto_168908 ) ) ( not ( = ?auto_168904 ?auto_168908 ) ) ( not ( = ?auto_168905 ?auto_168908 ) ) ( not ( = ?auto_168906 ?auto_168908 ) ) ( not ( = ?auto_168907 ?auto_168908 ) ) ( ON ?auto_168906 ?auto_168907 ) ( ON-TABLE ?auto_168908 ) ( CLEAR ?auto_168904 ) ( ON ?auto_168905 ?auto_168906 ) ( CLEAR ?auto_168905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_168908 ?auto_168907 ?auto_168906 )
      ( MAKE-7PILE ?auto_168901 ?auto_168902 ?auto_168903 ?auto_168904 ?auto_168905 ?auto_168906 ?auto_168907 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_168909 - BLOCK
      ?auto_168910 - BLOCK
      ?auto_168911 - BLOCK
      ?auto_168912 - BLOCK
      ?auto_168913 - BLOCK
      ?auto_168914 - BLOCK
      ?auto_168915 - BLOCK
    )
    :vars
    (
      ?auto_168916 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168909 ) ( ON ?auto_168910 ?auto_168909 ) ( ON ?auto_168911 ?auto_168910 ) ( not ( = ?auto_168909 ?auto_168910 ) ) ( not ( = ?auto_168909 ?auto_168911 ) ) ( not ( = ?auto_168909 ?auto_168912 ) ) ( not ( = ?auto_168909 ?auto_168913 ) ) ( not ( = ?auto_168909 ?auto_168914 ) ) ( not ( = ?auto_168909 ?auto_168915 ) ) ( not ( = ?auto_168910 ?auto_168911 ) ) ( not ( = ?auto_168910 ?auto_168912 ) ) ( not ( = ?auto_168910 ?auto_168913 ) ) ( not ( = ?auto_168910 ?auto_168914 ) ) ( not ( = ?auto_168910 ?auto_168915 ) ) ( not ( = ?auto_168911 ?auto_168912 ) ) ( not ( = ?auto_168911 ?auto_168913 ) ) ( not ( = ?auto_168911 ?auto_168914 ) ) ( not ( = ?auto_168911 ?auto_168915 ) ) ( not ( = ?auto_168912 ?auto_168913 ) ) ( not ( = ?auto_168912 ?auto_168914 ) ) ( not ( = ?auto_168912 ?auto_168915 ) ) ( not ( = ?auto_168913 ?auto_168914 ) ) ( not ( = ?auto_168913 ?auto_168915 ) ) ( not ( = ?auto_168914 ?auto_168915 ) ) ( ON ?auto_168915 ?auto_168916 ) ( not ( = ?auto_168909 ?auto_168916 ) ) ( not ( = ?auto_168910 ?auto_168916 ) ) ( not ( = ?auto_168911 ?auto_168916 ) ) ( not ( = ?auto_168912 ?auto_168916 ) ) ( not ( = ?auto_168913 ?auto_168916 ) ) ( not ( = ?auto_168914 ?auto_168916 ) ) ( not ( = ?auto_168915 ?auto_168916 ) ) ( ON ?auto_168914 ?auto_168915 ) ( ON-TABLE ?auto_168916 ) ( ON ?auto_168913 ?auto_168914 ) ( CLEAR ?auto_168913 ) ( HOLDING ?auto_168912 ) ( CLEAR ?auto_168911 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_168909 ?auto_168910 ?auto_168911 ?auto_168912 )
      ( MAKE-7PILE ?auto_168909 ?auto_168910 ?auto_168911 ?auto_168912 ?auto_168913 ?auto_168914 ?auto_168915 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_168917 - BLOCK
      ?auto_168918 - BLOCK
      ?auto_168919 - BLOCK
      ?auto_168920 - BLOCK
      ?auto_168921 - BLOCK
      ?auto_168922 - BLOCK
      ?auto_168923 - BLOCK
    )
    :vars
    (
      ?auto_168924 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168917 ) ( ON ?auto_168918 ?auto_168917 ) ( ON ?auto_168919 ?auto_168918 ) ( not ( = ?auto_168917 ?auto_168918 ) ) ( not ( = ?auto_168917 ?auto_168919 ) ) ( not ( = ?auto_168917 ?auto_168920 ) ) ( not ( = ?auto_168917 ?auto_168921 ) ) ( not ( = ?auto_168917 ?auto_168922 ) ) ( not ( = ?auto_168917 ?auto_168923 ) ) ( not ( = ?auto_168918 ?auto_168919 ) ) ( not ( = ?auto_168918 ?auto_168920 ) ) ( not ( = ?auto_168918 ?auto_168921 ) ) ( not ( = ?auto_168918 ?auto_168922 ) ) ( not ( = ?auto_168918 ?auto_168923 ) ) ( not ( = ?auto_168919 ?auto_168920 ) ) ( not ( = ?auto_168919 ?auto_168921 ) ) ( not ( = ?auto_168919 ?auto_168922 ) ) ( not ( = ?auto_168919 ?auto_168923 ) ) ( not ( = ?auto_168920 ?auto_168921 ) ) ( not ( = ?auto_168920 ?auto_168922 ) ) ( not ( = ?auto_168920 ?auto_168923 ) ) ( not ( = ?auto_168921 ?auto_168922 ) ) ( not ( = ?auto_168921 ?auto_168923 ) ) ( not ( = ?auto_168922 ?auto_168923 ) ) ( ON ?auto_168923 ?auto_168924 ) ( not ( = ?auto_168917 ?auto_168924 ) ) ( not ( = ?auto_168918 ?auto_168924 ) ) ( not ( = ?auto_168919 ?auto_168924 ) ) ( not ( = ?auto_168920 ?auto_168924 ) ) ( not ( = ?auto_168921 ?auto_168924 ) ) ( not ( = ?auto_168922 ?auto_168924 ) ) ( not ( = ?auto_168923 ?auto_168924 ) ) ( ON ?auto_168922 ?auto_168923 ) ( ON-TABLE ?auto_168924 ) ( ON ?auto_168921 ?auto_168922 ) ( CLEAR ?auto_168919 ) ( ON ?auto_168920 ?auto_168921 ) ( CLEAR ?auto_168920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_168924 ?auto_168923 ?auto_168922 ?auto_168921 )
      ( MAKE-7PILE ?auto_168917 ?auto_168918 ?auto_168919 ?auto_168920 ?auto_168921 ?auto_168922 ?auto_168923 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_168925 - BLOCK
      ?auto_168926 - BLOCK
      ?auto_168927 - BLOCK
      ?auto_168928 - BLOCK
      ?auto_168929 - BLOCK
      ?auto_168930 - BLOCK
      ?auto_168931 - BLOCK
    )
    :vars
    (
      ?auto_168932 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168925 ) ( ON ?auto_168926 ?auto_168925 ) ( not ( = ?auto_168925 ?auto_168926 ) ) ( not ( = ?auto_168925 ?auto_168927 ) ) ( not ( = ?auto_168925 ?auto_168928 ) ) ( not ( = ?auto_168925 ?auto_168929 ) ) ( not ( = ?auto_168925 ?auto_168930 ) ) ( not ( = ?auto_168925 ?auto_168931 ) ) ( not ( = ?auto_168926 ?auto_168927 ) ) ( not ( = ?auto_168926 ?auto_168928 ) ) ( not ( = ?auto_168926 ?auto_168929 ) ) ( not ( = ?auto_168926 ?auto_168930 ) ) ( not ( = ?auto_168926 ?auto_168931 ) ) ( not ( = ?auto_168927 ?auto_168928 ) ) ( not ( = ?auto_168927 ?auto_168929 ) ) ( not ( = ?auto_168927 ?auto_168930 ) ) ( not ( = ?auto_168927 ?auto_168931 ) ) ( not ( = ?auto_168928 ?auto_168929 ) ) ( not ( = ?auto_168928 ?auto_168930 ) ) ( not ( = ?auto_168928 ?auto_168931 ) ) ( not ( = ?auto_168929 ?auto_168930 ) ) ( not ( = ?auto_168929 ?auto_168931 ) ) ( not ( = ?auto_168930 ?auto_168931 ) ) ( ON ?auto_168931 ?auto_168932 ) ( not ( = ?auto_168925 ?auto_168932 ) ) ( not ( = ?auto_168926 ?auto_168932 ) ) ( not ( = ?auto_168927 ?auto_168932 ) ) ( not ( = ?auto_168928 ?auto_168932 ) ) ( not ( = ?auto_168929 ?auto_168932 ) ) ( not ( = ?auto_168930 ?auto_168932 ) ) ( not ( = ?auto_168931 ?auto_168932 ) ) ( ON ?auto_168930 ?auto_168931 ) ( ON-TABLE ?auto_168932 ) ( ON ?auto_168929 ?auto_168930 ) ( ON ?auto_168928 ?auto_168929 ) ( CLEAR ?auto_168928 ) ( HOLDING ?auto_168927 ) ( CLEAR ?auto_168926 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_168925 ?auto_168926 ?auto_168927 )
      ( MAKE-7PILE ?auto_168925 ?auto_168926 ?auto_168927 ?auto_168928 ?auto_168929 ?auto_168930 ?auto_168931 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_168933 - BLOCK
      ?auto_168934 - BLOCK
      ?auto_168935 - BLOCK
      ?auto_168936 - BLOCK
      ?auto_168937 - BLOCK
      ?auto_168938 - BLOCK
      ?auto_168939 - BLOCK
    )
    :vars
    (
      ?auto_168940 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168933 ) ( ON ?auto_168934 ?auto_168933 ) ( not ( = ?auto_168933 ?auto_168934 ) ) ( not ( = ?auto_168933 ?auto_168935 ) ) ( not ( = ?auto_168933 ?auto_168936 ) ) ( not ( = ?auto_168933 ?auto_168937 ) ) ( not ( = ?auto_168933 ?auto_168938 ) ) ( not ( = ?auto_168933 ?auto_168939 ) ) ( not ( = ?auto_168934 ?auto_168935 ) ) ( not ( = ?auto_168934 ?auto_168936 ) ) ( not ( = ?auto_168934 ?auto_168937 ) ) ( not ( = ?auto_168934 ?auto_168938 ) ) ( not ( = ?auto_168934 ?auto_168939 ) ) ( not ( = ?auto_168935 ?auto_168936 ) ) ( not ( = ?auto_168935 ?auto_168937 ) ) ( not ( = ?auto_168935 ?auto_168938 ) ) ( not ( = ?auto_168935 ?auto_168939 ) ) ( not ( = ?auto_168936 ?auto_168937 ) ) ( not ( = ?auto_168936 ?auto_168938 ) ) ( not ( = ?auto_168936 ?auto_168939 ) ) ( not ( = ?auto_168937 ?auto_168938 ) ) ( not ( = ?auto_168937 ?auto_168939 ) ) ( not ( = ?auto_168938 ?auto_168939 ) ) ( ON ?auto_168939 ?auto_168940 ) ( not ( = ?auto_168933 ?auto_168940 ) ) ( not ( = ?auto_168934 ?auto_168940 ) ) ( not ( = ?auto_168935 ?auto_168940 ) ) ( not ( = ?auto_168936 ?auto_168940 ) ) ( not ( = ?auto_168937 ?auto_168940 ) ) ( not ( = ?auto_168938 ?auto_168940 ) ) ( not ( = ?auto_168939 ?auto_168940 ) ) ( ON ?auto_168938 ?auto_168939 ) ( ON-TABLE ?auto_168940 ) ( ON ?auto_168937 ?auto_168938 ) ( ON ?auto_168936 ?auto_168937 ) ( CLEAR ?auto_168934 ) ( ON ?auto_168935 ?auto_168936 ) ( CLEAR ?auto_168935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_168940 ?auto_168939 ?auto_168938 ?auto_168937 ?auto_168936 )
      ( MAKE-7PILE ?auto_168933 ?auto_168934 ?auto_168935 ?auto_168936 ?auto_168937 ?auto_168938 ?auto_168939 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_168941 - BLOCK
      ?auto_168942 - BLOCK
      ?auto_168943 - BLOCK
      ?auto_168944 - BLOCK
      ?auto_168945 - BLOCK
      ?auto_168946 - BLOCK
      ?auto_168947 - BLOCK
    )
    :vars
    (
      ?auto_168948 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168941 ) ( not ( = ?auto_168941 ?auto_168942 ) ) ( not ( = ?auto_168941 ?auto_168943 ) ) ( not ( = ?auto_168941 ?auto_168944 ) ) ( not ( = ?auto_168941 ?auto_168945 ) ) ( not ( = ?auto_168941 ?auto_168946 ) ) ( not ( = ?auto_168941 ?auto_168947 ) ) ( not ( = ?auto_168942 ?auto_168943 ) ) ( not ( = ?auto_168942 ?auto_168944 ) ) ( not ( = ?auto_168942 ?auto_168945 ) ) ( not ( = ?auto_168942 ?auto_168946 ) ) ( not ( = ?auto_168942 ?auto_168947 ) ) ( not ( = ?auto_168943 ?auto_168944 ) ) ( not ( = ?auto_168943 ?auto_168945 ) ) ( not ( = ?auto_168943 ?auto_168946 ) ) ( not ( = ?auto_168943 ?auto_168947 ) ) ( not ( = ?auto_168944 ?auto_168945 ) ) ( not ( = ?auto_168944 ?auto_168946 ) ) ( not ( = ?auto_168944 ?auto_168947 ) ) ( not ( = ?auto_168945 ?auto_168946 ) ) ( not ( = ?auto_168945 ?auto_168947 ) ) ( not ( = ?auto_168946 ?auto_168947 ) ) ( ON ?auto_168947 ?auto_168948 ) ( not ( = ?auto_168941 ?auto_168948 ) ) ( not ( = ?auto_168942 ?auto_168948 ) ) ( not ( = ?auto_168943 ?auto_168948 ) ) ( not ( = ?auto_168944 ?auto_168948 ) ) ( not ( = ?auto_168945 ?auto_168948 ) ) ( not ( = ?auto_168946 ?auto_168948 ) ) ( not ( = ?auto_168947 ?auto_168948 ) ) ( ON ?auto_168946 ?auto_168947 ) ( ON-TABLE ?auto_168948 ) ( ON ?auto_168945 ?auto_168946 ) ( ON ?auto_168944 ?auto_168945 ) ( ON ?auto_168943 ?auto_168944 ) ( CLEAR ?auto_168943 ) ( HOLDING ?auto_168942 ) ( CLEAR ?auto_168941 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_168941 ?auto_168942 )
      ( MAKE-7PILE ?auto_168941 ?auto_168942 ?auto_168943 ?auto_168944 ?auto_168945 ?auto_168946 ?auto_168947 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_168949 - BLOCK
      ?auto_168950 - BLOCK
      ?auto_168951 - BLOCK
      ?auto_168952 - BLOCK
      ?auto_168953 - BLOCK
      ?auto_168954 - BLOCK
      ?auto_168955 - BLOCK
    )
    :vars
    (
      ?auto_168956 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168949 ) ( not ( = ?auto_168949 ?auto_168950 ) ) ( not ( = ?auto_168949 ?auto_168951 ) ) ( not ( = ?auto_168949 ?auto_168952 ) ) ( not ( = ?auto_168949 ?auto_168953 ) ) ( not ( = ?auto_168949 ?auto_168954 ) ) ( not ( = ?auto_168949 ?auto_168955 ) ) ( not ( = ?auto_168950 ?auto_168951 ) ) ( not ( = ?auto_168950 ?auto_168952 ) ) ( not ( = ?auto_168950 ?auto_168953 ) ) ( not ( = ?auto_168950 ?auto_168954 ) ) ( not ( = ?auto_168950 ?auto_168955 ) ) ( not ( = ?auto_168951 ?auto_168952 ) ) ( not ( = ?auto_168951 ?auto_168953 ) ) ( not ( = ?auto_168951 ?auto_168954 ) ) ( not ( = ?auto_168951 ?auto_168955 ) ) ( not ( = ?auto_168952 ?auto_168953 ) ) ( not ( = ?auto_168952 ?auto_168954 ) ) ( not ( = ?auto_168952 ?auto_168955 ) ) ( not ( = ?auto_168953 ?auto_168954 ) ) ( not ( = ?auto_168953 ?auto_168955 ) ) ( not ( = ?auto_168954 ?auto_168955 ) ) ( ON ?auto_168955 ?auto_168956 ) ( not ( = ?auto_168949 ?auto_168956 ) ) ( not ( = ?auto_168950 ?auto_168956 ) ) ( not ( = ?auto_168951 ?auto_168956 ) ) ( not ( = ?auto_168952 ?auto_168956 ) ) ( not ( = ?auto_168953 ?auto_168956 ) ) ( not ( = ?auto_168954 ?auto_168956 ) ) ( not ( = ?auto_168955 ?auto_168956 ) ) ( ON ?auto_168954 ?auto_168955 ) ( ON-TABLE ?auto_168956 ) ( ON ?auto_168953 ?auto_168954 ) ( ON ?auto_168952 ?auto_168953 ) ( ON ?auto_168951 ?auto_168952 ) ( CLEAR ?auto_168949 ) ( ON ?auto_168950 ?auto_168951 ) ( CLEAR ?auto_168950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_168956 ?auto_168955 ?auto_168954 ?auto_168953 ?auto_168952 ?auto_168951 )
      ( MAKE-7PILE ?auto_168949 ?auto_168950 ?auto_168951 ?auto_168952 ?auto_168953 ?auto_168954 ?auto_168955 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_168957 - BLOCK
      ?auto_168958 - BLOCK
      ?auto_168959 - BLOCK
      ?auto_168960 - BLOCK
      ?auto_168961 - BLOCK
      ?auto_168962 - BLOCK
      ?auto_168963 - BLOCK
    )
    :vars
    (
      ?auto_168964 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168957 ?auto_168958 ) ) ( not ( = ?auto_168957 ?auto_168959 ) ) ( not ( = ?auto_168957 ?auto_168960 ) ) ( not ( = ?auto_168957 ?auto_168961 ) ) ( not ( = ?auto_168957 ?auto_168962 ) ) ( not ( = ?auto_168957 ?auto_168963 ) ) ( not ( = ?auto_168958 ?auto_168959 ) ) ( not ( = ?auto_168958 ?auto_168960 ) ) ( not ( = ?auto_168958 ?auto_168961 ) ) ( not ( = ?auto_168958 ?auto_168962 ) ) ( not ( = ?auto_168958 ?auto_168963 ) ) ( not ( = ?auto_168959 ?auto_168960 ) ) ( not ( = ?auto_168959 ?auto_168961 ) ) ( not ( = ?auto_168959 ?auto_168962 ) ) ( not ( = ?auto_168959 ?auto_168963 ) ) ( not ( = ?auto_168960 ?auto_168961 ) ) ( not ( = ?auto_168960 ?auto_168962 ) ) ( not ( = ?auto_168960 ?auto_168963 ) ) ( not ( = ?auto_168961 ?auto_168962 ) ) ( not ( = ?auto_168961 ?auto_168963 ) ) ( not ( = ?auto_168962 ?auto_168963 ) ) ( ON ?auto_168963 ?auto_168964 ) ( not ( = ?auto_168957 ?auto_168964 ) ) ( not ( = ?auto_168958 ?auto_168964 ) ) ( not ( = ?auto_168959 ?auto_168964 ) ) ( not ( = ?auto_168960 ?auto_168964 ) ) ( not ( = ?auto_168961 ?auto_168964 ) ) ( not ( = ?auto_168962 ?auto_168964 ) ) ( not ( = ?auto_168963 ?auto_168964 ) ) ( ON ?auto_168962 ?auto_168963 ) ( ON-TABLE ?auto_168964 ) ( ON ?auto_168961 ?auto_168962 ) ( ON ?auto_168960 ?auto_168961 ) ( ON ?auto_168959 ?auto_168960 ) ( ON ?auto_168958 ?auto_168959 ) ( CLEAR ?auto_168958 ) ( HOLDING ?auto_168957 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_168957 )
      ( MAKE-7PILE ?auto_168957 ?auto_168958 ?auto_168959 ?auto_168960 ?auto_168961 ?auto_168962 ?auto_168963 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_168965 - BLOCK
      ?auto_168966 - BLOCK
      ?auto_168967 - BLOCK
      ?auto_168968 - BLOCK
      ?auto_168969 - BLOCK
      ?auto_168970 - BLOCK
      ?auto_168971 - BLOCK
    )
    :vars
    (
      ?auto_168972 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168965 ?auto_168966 ) ) ( not ( = ?auto_168965 ?auto_168967 ) ) ( not ( = ?auto_168965 ?auto_168968 ) ) ( not ( = ?auto_168965 ?auto_168969 ) ) ( not ( = ?auto_168965 ?auto_168970 ) ) ( not ( = ?auto_168965 ?auto_168971 ) ) ( not ( = ?auto_168966 ?auto_168967 ) ) ( not ( = ?auto_168966 ?auto_168968 ) ) ( not ( = ?auto_168966 ?auto_168969 ) ) ( not ( = ?auto_168966 ?auto_168970 ) ) ( not ( = ?auto_168966 ?auto_168971 ) ) ( not ( = ?auto_168967 ?auto_168968 ) ) ( not ( = ?auto_168967 ?auto_168969 ) ) ( not ( = ?auto_168967 ?auto_168970 ) ) ( not ( = ?auto_168967 ?auto_168971 ) ) ( not ( = ?auto_168968 ?auto_168969 ) ) ( not ( = ?auto_168968 ?auto_168970 ) ) ( not ( = ?auto_168968 ?auto_168971 ) ) ( not ( = ?auto_168969 ?auto_168970 ) ) ( not ( = ?auto_168969 ?auto_168971 ) ) ( not ( = ?auto_168970 ?auto_168971 ) ) ( ON ?auto_168971 ?auto_168972 ) ( not ( = ?auto_168965 ?auto_168972 ) ) ( not ( = ?auto_168966 ?auto_168972 ) ) ( not ( = ?auto_168967 ?auto_168972 ) ) ( not ( = ?auto_168968 ?auto_168972 ) ) ( not ( = ?auto_168969 ?auto_168972 ) ) ( not ( = ?auto_168970 ?auto_168972 ) ) ( not ( = ?auto_168971 ?auto_168972 ) ) ( ON ?auto_168970 ?auto_168971 ) ( ON-TABLE ?auto_168972 ) ( ON ?auto_168969 ?auto_168970 ) ( ON ?auto_168968 ?auto_168969 ) ( ON ?auto_168967 ?auto_168968 ) ( ON ?auto_168966 ?auto_168967 ) ( ON ?auto_168965 ?auto_168966 ) ( CLEAR ?auto_168965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_168972 ?auto_168971 ?auto_168970 ?auto_168969 ?auto_168968 ?auto_168967 ?auto_168966 )
      ( MAKE-7PILE ?auto_168965 ?auto_168966 ?auto_168967 ?auto_168968 ?auto_168969 ?auto_168970 ?auto_168971 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_168980 - BLOCK
      ?auto_168981 - BLOCK
      ?auto_168982 - BLOCK
      ?auto_168983 - BLOCK
      ?auto_168984 - BLOCK
      ?auto_168985 - BLOCK
      ?auto_168986 - BLOCK
    )
    :vars
    (
      ?auto_168987 - BLOCK
      ?auto_168988 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168980 ?auto_168981 ) ) ( not ( = ?auto_168980 ?auto_168982 ) ) ( not ( = ?auto_168980 ?auto_168983 ) ) ( not ( = ?auto_168980 ?auto_168984 ) ) ( not ( = ?auto_168980 ?auto_168985 ) ) ( not ( = ?auto_168980 ?auto_168986 ) ) ( not ( = ?auto_168981 ?auto_168982 ) ) ( not ( = ?auto_168981 ?auto_168983 ) ) ( not ( = ?auto_168981 ?auto_168984 ) ) ( not ( = ?auto_168981 ?auto_168985 ) ) ( not ( = ?auto_168981 ?auto_168986 ) ) ( not ( = ?auto_168982 ?auto_168983 ) ) ( not ( = ?auto_168982 ?auto_168984 ) ) ( not ( = ?auto_168982 ?auto_168985 ) ) ( not ( = ?auto_168982 ?auto_168986 ) ) ( not ( = ?auto_168983 ?auto_168984 ) ) ( not ( = ?auto_168983 ?auto_168985 ) ) ( not ( = ?auto_168983 ?auto_168986 ) ) ( not ( = ?auto_168984 ?auto_168985 ) ) ( not ( = ?auto_168984 ?auto_168986 ) ) ( not ( = ?auto_168985 ?auto_168986 ) ) ( ON ?auto_168986 ?auto_168987 ) ( not ( = ?auto_168980 ?auto_168987 ) ) ( not ( = ?auto_168981 ?auto_168987 ) ) ( not ( = ?auto_168982 ?auto_168987 ) ) ( not ( = ?auto_168983 ?auto_168987 ) ) ( not ( = ?auto_168984 ?auto_168987 ) ) ( not ( = ?auto_168985 ?auto_168987 ) ) ( not ( = ?auto_168986 ?auto_168987 ) ) ( ON ?auto_168985 ?auto_168986 ) ( ON-TABLE ?auto_168987 ) ( ON ?auto_168984 ?auto_168985 ) ( ON ?auto_168983 ?auto_168984 ) ( ON ?auto_168982 ?auto_168983 ) ( ON ?auto_168981 ?auto_168982 ) ( CLEAR ?auto_168981 ) ( ON ?auto_168980 ?auto_168988 ) ( CLEAR ?auto_168980 ) ( HAND-EMPTY ) ( not ( = ?auto_168980 ?auto_168988 ) ) ( not ( = ?auto_168981 ?auto_168988 ) ) ( not ( = ?auto_168982 ?auto_168988 ) ) ( not ( = ?auto_168983 ?auto_168988 ) ) ( not ( = ?auto_168984 ?auto_168988 ) ) ( not ( = ?auto_168985 ?auto_168988 ) ) ( not ( = ?auto_168986 ?auto_168988 ) ) ( not ( = ?auto_168987 ?auto_168988 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_168980 ?auto_168988 )
      ( MAKE-7PILE ?auto_168980 ?auto_168981 ?auto_168982 ?auto_168983 ?auto_168984 ?auto_168985 ?auto_168986 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_168989 - BLOCK
      ?auto_168990 - BLOCK
      ?auto_168991 - BLOCK
      ?auto_168992 - BLOCK
      ?auto_168993 - BLOCK
      ?auto_168994 - BLOCK
      ?auto_168995 - BLOCK
    )
    :vars
    (
      ?auto_168996 - BLOCK
      ?auto_168997 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168989 ?auto_168990 ) ) ( not ( = ?auto_168989 ?auto_168991 ) ) ( not ( = ?auto_168989 ?auto_168992 ) ) ( not ( = ?auto_168989 ?auto_168993 ) ) ( not ( = ?auto_168989 ?auto_168994 ) ) ( not ( = ?auto_168989 ?auto_168995 ) ) ( not ( = ?auto_168990 ?auto_168991 ) ) ( not ( = ?auto_168990 ?auto_168992 ) ) ( not ( = ?auto_168990 ?auto_168993 ) ) ( not ( = ?auto_168990 ?auto_168994 ) ) ( not ( = ?auto_168990 ?auto_168995 ) ) ( not ( = ?auto_168991 ?auto_168992 ) ) ( not ( = ?auto_168991 ?auto_168993 ) ) ( not ( = ?auto_168991 ?auto_168994 ) ) ( not ( = ?auto_168991 ?auto_168995 ) ) ( not ( = ?auto_168992 ?auto_168993 ) ) ( not ( = ?auto_168992 ?auto_168994 ) ) ( not ( = ?auto_168992 ?auto_168995 ) ) ( not ( = ?auto_168993 ?auto_168994 ) ) ( not ( = ?auto_168993 ?auto_168995 ) ) ( not ( = ?auto_168994 ?auto_168995 ) ) ( ON ?auto_168995 ?auto_168996 ) ( not ( = ?auto_168989 ?auto_168996 ) ) ( not ( = ?auto_168990 ?auto_168996 ) ) ( not ( = ?auto_168991 ?auto_168996 ) ) ( not ( = ?auto_168992 ?auto_168996 ) ) ( not ( = ?auto_168993 ?auto_168996 ) ) ( not ( = ?auto_168994 ?auto_168996 ) ) ( not ( = ?auto_168995 ?auto_168996 ) ) ( ON ?auto_168994 ?auto_168995 ) ( ON-TABLE ?auto_168996 ) ( ON ?auto_168993 ?auto_168994 ) ( ON ?auto_168992 ?auto_168993 ) ( ON ?auto_168991 ?auto_168992 ) ( ON ?auto_168989 ?auto_168997 ) ( CLEAR ?auto_168989 ) ( not ( = ?auto_168989 ?auto_168997 ) ) ( not ( = ?auto_168990 ?auto_168997 ) ) ( not ( = ?auto_168991 ?auto_168997 ) ) ( not ( = ?auto_168992 ?auto_168997 ) ) ( not ( = ?auto_168993 ?auto_168997 ) ) ( not ( = ?auto_168994 ?auto_168997 ) ) ( not ( = ?auto_168995 ?auto_168997 ) ) ( not ( = ?auto_168996 ?auto_168997 ) ) ( HOLDING ?auto_168990 ) ( CLEAR ?auto_168991 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_168996 ?auto_168995 ?auto_168994 ?auto_168993 ?auto_168992 ?auto_168991 ?auto_168990 )
      ( MAKE-7PILE ?auto_168989 ?auto_168990 ?auto_168991 ?auto_168992 ?auto_168993 ?auto_168994 ?auto_168995 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_168998 - BLOCK
      ?auto_168999 - BLOCK
      ?auto_169000 - BLOCK
      ?auto_169001 - BLOCK
      ?auto_169002 - BLOCK
      ?auto_169003 - BLOCK
      ?auto_169004 - BLOCK
    )
    :vars
    (
      ?auto_169005 - BLOCK
      ?auto_169006 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168998 ?auto_168999 ) ) ( not ( = ?auto_168998 ?auto_169000 ) ) ( not ( = ?auto_168998 ?auto_169001 ) ) ( not ( = ?auto_168998 ?auto_169002 ) ) ( not ( = ?auto_168998 ?auto_169003 ) ) ( not ( = ?auto_168998 ?auto_169004 ) ) ( not ( = ?auto_168999 ?auto_169000 ) ) ( not ( = ?auto_168999 ?auto_169001 ) ) ( not ( = ?auto_168999 ?auto_169002 ) ) ( not ( = ?auto_168999 ?auto_169003 ) ) ( not ( = ?auto_168999 ?auto_169004 ) ) ( not ( = ?auto_169000 ?auto_169001 ) ) ( not ( = ?auto_169000 ?auto_169002 ) ) ( not ( = ?auto_169000 ?auto_169003 ) ) ( not ( = ?auto_169000 ?auto_169004 ) ) ( not ( = ?auto_169001 ?auto_169002 ) ) ( not ( = ?auto_169001 ?auto_169003 ) ) ( not ( = ?auto_169001 ?auto_169004 ) ) ( not ( = ?auto_169002 ?auto_169003 ) ) ( not ( = ?auto_169002 ?auto_169004 ) ) ( not ( = ?auto_169003 ?auto_169004 ) ) ( ON ?auto_169004 ?auto_169005 ) ( not ( = ?auto_168998 ?auto_169005 ) ) ( not ( = ?auto_168999 ?auto_169005 ) ) ( not ( = ?auto_169000 ?auto_169005 ) ) ( not ( = ?auto_169001 ?auto_169005 ) ) ( not ( = ?auto_169002 ?auto_169005 ) ) ( not ( = ?auto_169003 ?auto_169005 ) ) ( not ( = ?auto_169004 ?auto_169005 ) ) ( ON ?auto_169003 ?auto_169004 ) ( ON-TABLE ?auto_169005 ) ( ON ?auto_169002 ?auto_169003 ) ( ON ?auto_169001 ?auto_169002 ) ( ON ?auto_169000 ?auto_169001 ) ( ON ?auto_168998 ?auto_169006 ) ( not ( = ?auto_168998 ?auto_169006 ) ) ( not ( = ?auto_168999 ?auto_169006 ) ) ( not ( = ?auto_169000 ?auto_169006 ) ) ( not ( = ?auto_169001 ?auto_169006 ) ) ( not ( = ?auto_169002 ?auto_169006 ) ) ( not ( = ?auto_169003 ?auto_169006 ) ) ( not ( = ?auto_169004 ?auto_169006 ) ) ( not ( = ?auto_169005 ?auto_169006 ) ) ( CLEAR ?auto_169000 ) ( ON ?auto_168999 ?auto_168998 ) ( CLEAR ?auto_168999 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169006 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169006 ?auto_168998 )
      ( MAKE-7PILE ?auto_168998 ?auto_168999 ?auto_169000 ?auto_169001 ?auto_169002 ?auto_169003 ?auto_169004 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_169007 - BLOCK
      ?auto_169008 - BLOCK
      ?auto_169009 - BLOCK
      ?auto_169010 - BLOCK
      ?auto_169011 - BLOCK
      ?auto_169012 - BLOCK
      ?auto_169013 - BLOCK
    )
    :vars
    (
      ?auto_169014 - BLOCK
      ?auto_169015 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169007 ?auto_169008 ) ) ( not ( = ?auto_169007 ?auto_169009 ) ) ( not ( = ?auto_169007 ?auto_169010 ) ) ( not ( = ?auto_169007 ?auto_169011 ) ) ( not ( = ?auto_169007 ?auto_169012 ) ) ( not ( = ?auto_169007 ?auto_169013 ) ) ( not ( = ?auto_169008 ?auto_169009 ) ) ( not ( = ?auto_169008 ?auto_169010 ) ) ( not ( = ?auto_169008 ?auto_169011 ) ) ( not ( = ?auto_169008 ?auto_169012 ) ) ( not ( = ?auto_169008 ?auto_169013 ) ) ( not ( = ?auto_169009 ?auto_169010 ) ) ( not ( = ?auto_169009 ?auto_169011 ) ) ( not ( = ?auto_169009 ?auto_169012 ) ) ( not ( = ?auto_169009 ?auto_169013 ) ) ( not ( = ?auto_169010 ?auto_169011 ) ) ( not ( = ?auto_169010 ?auto_169012 ) ) ( not ( = ?auto_169010 ?auto_169013 ) ) ( not ( = ?auto_169011 ?auto_169012 ) ) ( not ( = ?auto_169011 ?auto_169013 ) ) ( not ( = ?auto_169012 ?auto_169013 ) ) ( ON ?auto_169013 ?auto_169014 ) ( not ( = ?auto_169007 ?auto_169014 ) ) ( not ( = ?auto_169008 ?auto_169014 ) ) ( not ( = ?auto_169009 ?auto_169014 ) ) ( not ( = ?auto_169010 ?auto_169014 ) ) ( not ( = ?auto_169011 ?auto_169014 ) ) ( not ( = ?auto_169012 ?auto_169014 ) ) ( not ( = ?auto_169013 ?auto_169014 ) ) ( ON ?auto_169012 ?auto_169013 ) ( ON-TABLE ?auto_169014 ) ( ON ?auto_169011 ?auto_169012 ) ( ON ?auto_169010 ?auto_169011 ) ( ON ?auto_169007 ?auto_169015 ) ( not ( = ?auto_169007 ?auto_169015 ) ) ( not ( = ?auto_169008 ?auto_169015 ) ) ( not ( = ?auto_169009 ?auto_169015 ) ) ( not ( = ?auto_169010 ?auto_169015 ) ) ( not ( = ?auto_169011 ?auto_169015 ) ) ( not ( = ?auto_169012 ?auto_169015 ) ) ( not ( = ?auto_169013 ?auto_169015 ) ) ( not ( = ?auto_169014 ?auto_169015 ) ) ( ON ?auto_169008 ?auto_169007 ) ( CLEAR ?auto_169008 ) ( ON-TABLE ?auto_169015 ) ( HOLDING ?auto_169009 ) ( CLEAR ?auto_169010 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_169014 ?auto_169013 ?auto_169012 ?auto_169011 ?auto_169010 ?auto_169009 )
      ( MAKE-7PILE ?auto_169007 ?auto_169008 ?auto_169009 ?auto_169010 ?auto_169011 ?auto_169012 ?auto_169013 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_169016 - BLOCK
      ?auto_169017 - BLOCK
      ?auto_169018 - BLOCK
      ?auto_169019 - BLOCK
      ?auto_169020 - BLOCK
      ?auto_169021 - BLOCK
      ?auto_169022 - BLOCK
    )
    :vars
    (
      ?auto_169023 - BLOCK
      ?auto_169024 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169016 ?auto_169017 ) ) ( not ( = ?auto_169016 ?auto_169018 ) ) ( not ( = ?auto_169016 ?auto_169019 ) ) ( not ( = ?auto_169016 ?auto_169020 ) ) ( not ( = ?auto_169016 ?auto_169021 ) ) ( not ( = ?auto_169016 ?auto_169022 ) ) ( not ( = ?auto_169017 ?auto_169018 ) ) ( not ( = ?auto_169017 ?auto_169019 ) ) ( not ( = ?auto_169017 ?auto_169020 ) ) ( not ( = ?auto_169017 ?auto_169021 ) ) ( not ( = ?auto_169017 ?auto_169022 ) ) ( not ( = ?auto_169018 ?auto_169019 ) ) ( not ( = ?auto_169018 ?auto_169020 ) ) ( not ( = ?auto_169018 ?auto_169021 ) ) ( not ( = ?auto_169018 ?auto_169022 ) ) ( not ( = ?auto_169019 ?auto_169020 ) ) ( not ( = ?auto_169019 ?auto_169021 ) ) ( not ( = ?auto_169019 ?auto_169022 ) ) ( not ( = ?auto_169020 ?auto_169021 ) ) ( not ( = ?auto_169020 ?auto_169022 ) ) ( not ( = ?auto_169021 ?auto_169022 ) ) ( ON ?auto_169022 ?auto_169023 ) ( not ( = ?auto_169016 ?auto_169023 ) ) ( not ( = ?auto_169017 ?auto_169023 ) ) ( not ( = ?auto_169018 ?auto_169023 ) ) ( not ( = ?auto_169019 ?auto_169023 ) ) ( not ( = ?auto_169020 ?auto_169023 ) ) ( not ( = ?auto_169021 ?auto_169023 ) ) ( not ( = ?auto_169022 ?auto_169023 ) ) ( ON ?auto_169021 ?auto_169022 ) ( ON-TABLE ?auto_169023 ) ( ON ?auto_169020 ?auto_169021 ) ( ON ?auto_169019 ?auto_169020 ) ( ON ?auto_169016 ?auto_169024 ) ( not ( = ?auto_169016 ?auto_169024 ) ) ( not ( = ?auto_169017 ?auto_169024 ) ) ( not ( = ?auto_169018 ?auto_169024 ) ) ( not ( = ?auto_169019 ?auto_169024 ) ) ( not ( = ?auto_169020 ?auto_169024 ) ) ( not ( = ?auto_169021 ?auto_169024 ) ) ( not ( = ?auto_169022 ?auto_169024 ) ) ( not ( = ?auto_169023 ?auto_169024 ) ) ( ON ?auto_169017 ?auto_169016 ) ( ON-TABLE ?auto_169024 ) ( CLEAR ?auto_169019 ) ( ON ?auto_169018 ?auto_169017 ) ( CLEAR ?auto_169018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169024 ?auto_169016 ?auto_169017 )
      ( MAKE-7PILE ?auto_169016 ?auto_169017 ?auto_169018 ?auto_169019 ?auto_169020 ?auto_169021 ?auto_169022 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_169025 - BLOCK
      ?auto_169026 - BLOCK
      ?auto_169027 - BLOCK
      ?auto_169028 - BLOCK
      ?auto_169029 - BLOCK
      ?auto_169030 - BLOCK
      ?auto_169031 - BLOCK
    )
    :vars
    (
      ?auto_169032 - BLOCK
      ?auto_169033 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169025 ?auto_169026 ) ) ( not ( = ?auto_169025 ?auto_169027 ) ) ( not ( = ?auto_169025 ?auto_169028 ) ) ( not ( = ?auto_169025 ?auto_169029 ) ) ( not ( = ?auto_169025 ?auto_169030 ) ) ( not ( = ?auto_169025 ?auto_169031 ) ) ( not ( = ?auto_169026 ?auto_169027 ) ) ( not ( = ?auto_169026 ?auto_169028 ) ) ( not ( = ?auto_169026 ?auto_169029 ) ) ( not ( = ?auto_169026 ?auto_169030 ) ) ( not ( = ?auto_169026 ?auto_169031 ) ) ( not ( = ?auto_169027 ?auto_169028 ) ) ( not ( = ?auto_169027 ?auto_169029 ) ) ( not ( = ?auto_169027 ?auto_169030 ) ) ( not ( = ?auto_169027 ?auto_169031 ) ) ( not ( = ?auto_169028 ?auto_169029 ) ) ( not ( = ?auto_169028 ?auto_169030 ) ) ( not ( = ?auto_169028 ?auto_169031 ) ) ( not ( = ?auto_169029 ?auto_169030 ) ) ( not ( = ?auto_169029 ?auto_169031 ) ) ( not ( = ?auto_169030 ?auto_169031 ) ) ( ON ?auto_169031 ?auto_169032 ) ( not ( = ?auto_169025 ?auto_169032 ) ) ( not ( = ?auto_169026 ?auto_169032 ) ) ( not ( = ?auto_169027 ?auto_169032 ) ) ( not ( = ?auto_169028 ?auto_169032 ) ) ( not ( = ?auto_169029 ?auto_169032 ) ) ( not ( = ?auto_169030 ?auto_169032 ) ) ( not ( = ?auto_169031 ?auto_169032 ) ) ( ON ?auto_169030 ?auto_169031 ) ( ON-TABLE ?auto_169032 ) ( ON ?auto_169029 ?auto_169030 ) ( ON ?auto_169025 ?auto_169033 ) ( not ( = ?auto_169025 ?auto_169033 ) ) ( not ( = ?auto_169026 ?auto_169033 ) ) ( not ( = ?auto_169027 ?auto_169033 ) ) ( not ( = ?auto_169028 ?auto_169033 ) ) ( not ( = ?auto_169029 ?auto_169033 ) ) ( not ( = ?auto_169030 ?auto_169033 ) ) ( not ( = ?auto_169031 ?auto_169033 ) ) ( not ( = ?auto_169032 ?auto_169033 ) ) ( ON ?auto_169026 ?auto_169025 ) ( ON-TABLE ?auto_169033 ) ( ON ?auto_169027 ?auto_169026 ) ( CLEAR ?auto_169027 ) ( HOLDING ?auto_169028 ) ( CLEAR ?auto_169029 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_169032 ?auto_169031 ?auto_169030 ?auto_169029 ?auto_169028 )
      ( MAKE-7PILE ?auto_169025 ?auto_169026 ?auto_169027 ?auto_169028 ?auto_169029 ?auto_169030 ?auto_169031 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_169034 - BLOCK
      ?auto_169035 - BLOCK
      ?auto_169036 - BLOCK
      ?auto_169037 - BLOCK
      ?auto_169038 - BLOCK
      ?auto_169039 - BLOCK
      ?auto_169040 - BLOCK
    )
    :vars
    (
      ?auto_169041 - BLOCK
      ?auto_169042 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169034 ?auto_169035 ) ) ( not ( = ?auto_169034 ?auto_169036 ) ) ( not ( = ?auto_169034 ?auto_169037 ) ) ( not ( = ?auto_169034 ?auto_169038 ) ) ( not ( = ?auto_169034 ?auto_169039 ) ) ( not ( = ?auto_169034 ?auto_169040 ) ) ( not ( = ?auto_169035 ?auto_169036 ) ) ( not ( = ?auto_169035 ?auto_169037 ) ) ( not ( = ?auto_169035 ?auto_169038 ) ) ( not ( = ?auto_169035 ?auto_169039 ) ) ( not ( = ?auto_169035 ?auto_169040 ) ) ( not ( = ?auto_169036 ?auto_169037 ) ) ( not ( = ?auto_169036 ?auto_169038 ) ) ( not ( = ?auto_169036 ?auto_169039 ) ) ( not ( = ?auto_169036 ?auto_169040 ) ) ( not ( = ?auto_169037 ?auto_169038 ) ) ( not ( = ?auto_169037 ?auto_169039 ) ) ( not ( = ?auto_169037 ?auto_169040 ) ) ( not ( = ?auto_169038 ?auto_169039 ) ) ( not ( = ?auto_169038 ?auto_169040 ) ) ( not ( = ?auto_169039 ?auto_169040 ) ) ( ON ?auto_169040 ?auto_169041 ) ( not ( = ?auto_169034 ?auto_169041 ) ) ( not ( = ?auto_169035 ?auto_169041 ) ) ( not ( = ?auto_169036 ?auto_169041 ) ) ( not ( = ?auto_169037 ?auto_169041 ) ) ( not ( = ?auto_169038 ?auto_169041 ) ) ( not ( = ?auto_169039 ?auto_169041 ) ) ( not ( = ?auto_169040 ?auto_169041 ) ) ( ON ?auto_169039 ?auto_169040 ) ( ON-TABLE ?auto_169041 ) ( ON ?auto_169038 ?auto_169039 ) ( ON ?auto_169034 ?auto_169042 ) ( not ( = ?auto_169034 ?auto_169042 ) ) ( not ( = ?auto_169035 ?auto_169042 ) ) ( not ( = ?auto_169036 ?auto_169042 ) ) ( not ( = ?auto_169037 ?auto_169042 ) ) ( not ( = ?auto_169038 ?auto_169042 ) ) ( not ( = ?auto_169039 ?auto_169042 ) ) ( not ( = ?auto_169040 ?auto_169042 ) ) ( not ( = ?auto_169041 ?auto_169042 ) ) ( ON ?auto_169035 ?auto_169034 ) ( ON-TABLE ?auto_169042 ) ( ON ?auto_169036 ?auto_169035 ) ( CLEAR ?auto_169038 ) ( ON ?auto_169037 ?auto_169036 ) ( CLEAR ?auto_169037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169042 ?auto_169034 ?auto_169035 ?auto_169036 )
      ( MAKE-7PILE ?auto_169034 ?auto_169035 ?auto_169036 ?auto_169037 ?auto_169038 ?auto_169039 ?auto_169040 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_169043 - BLOCK
      ?auto_169044 - BLOCK
      ?auto_169045 - BLOCK
      ?auto_169046 - BLOCK
      ?auto_169047 - BLOCK
      ?auto_169048 - BLOCK
      ?auto_169049 - BLOCK
    )
    :vars
    (
      ?auto_169051 - BLOCK
      ?auto_169050 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169043 ?auto_169044 ) ) ( not ( = ?auto_169043 ?auto_169045 ) ) ( not ( = ?auto_169043 ?auto_169046 ) ) ( not ( = ?auto_169043 ?auto_169047 ) ) ( not ( = ?auto_169043 ?auto_169048 ) ) ( not ( = ?auto_169043 ?auto_169049 ) ) ( not ( = ?auto_169044 ?auto_169045 ) ) ( not ( = ?auto_169044 ?auto_169046 ) ) ( not ( = ?auto_169044 ?auto_169047 ) ) ( not ( = ?auto_169044 ?auto_169048 ) ) ( not ( = ?auto_169044 ?auto_169049 ) ) ( not ( = ?auto_169045 ?auto_169046 ) ) ( not ( = ?auto_169045 ?auto_169047 ) ) ( not ( = ?auto_169045 ?auto_169048 ) ) ( not ( = ?auto_169045 ?auto_169049 ) ) ( not ( = ?auto_169046 ?auto_169047 ) ) ( not ( = ?auto_169046 ?auto_169048 ) ) ( not ( = ?auto_169046 ?auto_169049 ) ) ( not ( = ?auto_169047 ?auto_169048 ) ) ( not ( = ?auto_169047 ?auto_169049 ) ) ( not ( = ?auto_169048 ?auto_169049 ) ) ( ON ?auto_169049 ?auto_169051 ) ( not ( = ?auto_169043 ?auto_169051 ) ) ( not ( = ?auto_169044 ?auto_169051 ) ) ( not ( = ?auto_169045 ?auto_169051 ) ) ( not ( = ?auto_169046 ?auto_169051 ) ) ( not ( = ?auto_169047 ?auto_169051 ) ) ( not ( = ?auto_169048 ?auto_169051 ) ) ( not ( = ?auto_169049 ?auto_169051 ) ) ( ON ?auto_169048 ?auto_169049 ) ( ON-TABLE ?auto_169051 ) ( ON ?auto_169043 ?auto_169050 ) ( not ( = ?auto_169043 ?auto_169050 ) ) ( not ( = ?auto_169044 ?auto_169050 ) ) ( not ( = ?auto_169045 ?auto_169050 ) ) ( not ( = ?auto_169046 ?auto_169050 ) ) ( not ( = ?auto_169047 ?auto_169050 ) ) ( not ( = ?auto_169048 ?auto_169050 ) ) ( not ( = ?auto_169049 ?auto_169050 ) ) ( not ( = ?auto_169051 ?auto_169050 ) ) ( ON ?auto_169044 ?auto_169043 ) ( ON-TABLE ?auto_169050 ) ( ON ?auto_169045 ?auto_169044 ) ( ON ?auto_169046 ?auto_169045 ) ( CLEAR ?auto_169046 ) ( HOLDING ?auto_169047 ) ( CLEAR ?auto_169048 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169051 ?auto_169049 ?auto_169048 ?auto_169047 )
      ( MAKE-7PILE ?auto_169043 ?auto_169044 ?auto_169045 ?auto_169046 ?auto_169047 ?auto_169048 ?auto_169049 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_169052 - BLOCK
      ?auto_169053 - BLOCK
      ?auto_169054 - BLOCK
      ?auto_169055 - BLOCK
      ?auto_169056 - BLOCK
      ?auto_169057 - BLOCK
      ?auto_169058 - BLOCK
    )
    :vars
    (
      ?auto_169059 - BLOCK
      ?auto_169060 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169052 ?auto_169053 ) ) ( not ( = ?auto_169052 ?auto_169054 ) ) ( not ( = ?auto_169052 ?auto_169055 ) ) ( not ( = ?auto_169052 ?auto_169056 ) ) ( not ( = ?auto_169052 ?auto_169057 ) ) ( not ( = ?auto_169052 ?auto_169058 ) ) ( not ( = ?auto_169053 ?auto_169054 ) ) ( not ( = ?auto_169053 ?auto_169055 ) ) ( not ( = ?auto_169053 ?auto_169056 ) ) ( not ( = ?auto_169053 ?auto_169057 ) ) ( not ( = ?auto_169053 ?auto_169058 ) ) ( not ( = ?auto_169054 ?auto_169055 ) ) ( not ( = ?auto_169054 ?auto_169056 ) ) ( not ( = ?auto_169054 ?auto_169057 ) ) ( not ( = ?auto_169054 ?auto_169058 ) ) ( not ( = ?auto_169055 ?auto_169056 ) ) ( not ( = ?auto_169055 ?auto_169057 ) ) ( not ( = ?auto_169055 ?auto_169058 ) ) ( not ( = ?auto_169056 ?auto_169057 ) ) ( not ( = ?auto_169056 ?auto_169058 ) ) ( not ( = ?auto_169057 ?auto_169058 ) ) ( ON ?auto_169058 ?auto_169059 ) ( not ( = ?auto_169052 ?auto_169059 ) ) ( not ( = ?auto_169053 ?auto_169059 ) ) ( not ( = ?auto_169054 ?auto_169059 ) ) ( not ( = ?auto_169055 ?auto_169059 ) ) ( not ( = ?auto_169056 ?auto_169059 ) ) ( not ( = ?auto_169057 ?auto_169059 ) ) ( not ( = ?auto_169058 ?auto_169059 ) ) ( ON ?auto_169057 ?auto_169058 ) ( ON-TABLE ?auto_169059 ) ( ON ?auto_169052 ?auto_169060 ) ( not ( = ?auto_169052 ?auto_169060 ) ) ( not ( = ?auto_169053 ?auto_169060 ) ) ( not ( = ?auto_169054 ?auto_169060 ) ) ( not ( = ?auto_169055 ?auto_169060 ) ) ( not ( = ?auto_169056 ?auto_169060 ) ) ( not ( = ?auto_169057 ?auto_169060 ) ) ( not ( = ?auto_169058 ?auto_169060 ) ) ( not ( = ?auto_169059 ?auto_169060 ) ) ( ON ?auto_169053 ?auto_169052 ) ( ON-TABLE ?auto_169060 ) ( ON ?auto_169054 ?auto_169053 ) ( ON ?auto_169055 ?auto_169054 ) ( CLEAR ?auto_169057 ) ( ON ?auto_169056 ?auto_169055 ) ( CLEAR ?auto_169056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_169060 ?auto_169052 ?auto_169053 ?auto_169054 ?auto_169055 )
      ( MAKE-7PILE ?auto_169052 ?auto_169053 ?auto_169054 ?auto_169055 ?auto_169056 ?auto_169057 ?auto_169058 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_169061 - BLOCK
      ?auto_169062 - BLOCK
      ?auto_169063 - BLOCK
      ?auto_169064 - BLOCK
      ?auto_169065 - BLOCK
      ?auto_169066 - BLOCK
      ?auto_169067 - BLOCK
    )
    :vars
    (
      ?auto_169069 - BLOCK
      ?auto_169068 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169061 ?auto_169062 ) ) ( not ( = ?auto_169061 ?auto_169063 ) ) ( not ( = ?auto_169061 ?auto_169064 ) ) ( not ( = ?auto_169061 ?auto_169065 ) ) ( not ( = ?auto_169061 ?auto_169066 ) ) ( not ( = ?auto_169061 ?auto_169067 ) ) ( not ( = ?auto_169062 ?auto_169063 ) ) ( not ( = ?auto_169062 ?auto_169064 ) ) ( not ( = ?auto_169062 ?auto_169065 ) ) ( not ( = ?auto_169062 ?auto_169066 ) ) ( not ( = ?auto_169062 ?auto_169067 ) ) ( not ( = ?auto_169063 ?auto_169064 ) ) ( not ( = ?auto_169063 ?auto_169065 ) ) ( not ( = ?auto_169063 ?auto_169066 ) ) ( not ( = ?auto_169063 ?auto_169067 ) ) ( not ( = ?auto_169064 ?auto_169065 ) ) ( not ( = ?auto_169064 ?auto_169066 ) ) ( not ( = ?auto_169064 ?auto_169067 ) ) ( not ( = ?auto_169065 ?auto_169066 ) ) ( not ( = ?auto_169065 ?auto_169067 ) ) ( not ( = ?auto_169066 ?auto_169067 ) ) ( ON ?auto_169067 ?auto_169069 ) ( not ( = ?auto_169061 ?auto_169069 ) ) ( not ( = ?auto_169062 ?auto_169069 ) ) ( not ( = ?auto_169063 ?auto_169069 ) ) ( not ( = ?auto_169064 ?auto_169069 ) ) ( not ( = ?auto_169065 ?auto_169069 ) ) ( not ( = ?auto_169066 ?auto_169069 ) ) ( not ( = ?auto_169067 ?auto_169069 ) ) ( ON-TABLE ?auto_169069 ) ( ON ?auto_169061 ?auto_169068 ) ( not ( = ?auto_169061 ?auto_169068 ) ) ( not ( = ?auto_169062 ?auto_169068 ) ) ( not ( = ?auto_169063 ?auto_169068 ) ) ( not ( = ?auto_169064 ?auto_169068 ) ) ( not ( = ?auto_169065 ?auto_169068 ) ) ( not ( = ?auto_169066 ?auto_169068 ) ) ( not ( = ?auto_169067 ?auto_169068 ) ) ( not ( = ?auto_169069 ?auto_169068 ) ) ( ON ?auto_169062 ?auto_169061 ) ( ON-TABLE ?auto_169068 ) ( ON ?auto_169063 ?auto_169062 ) ( ON ?auto_169064 ?auto_169063 ) ( ON ?auto_169065 ?auto_169064 ) ( CLEAR ?auto_169065 ) ( HOLDING ?auto_169066 ) ( CLEAR ?auto_169067 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169069 ?auto_169067 ?auto_169066 )
      ( MAKE-7PILE ?auto_169061 ?auto_169062 ?auto_169063 ?auto_169064 ?auto_169065 ?auto_169066 ?auto_169067 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_169070 - BLOCK
      ?auto_169071 - BLOCK
      ?auto_169072 - BLOCK
      ?auto_169073 - BLOCK
      ?auto_169074 - BLOCK
      ?auto_169075 - BLOCK
      ?auto_169076 - BLOCK
    )
    :vars
    (
      ?auto_169077 - BLOCK
      ?auto_169078 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169070 ?auto_169071 ) ) ( not ( = ?auto_169070 ?auto_169072 ) ) ( not ( = ?auto_169070 ?auto_169073 ) ) ( not ( = ?auto_169070 ?auto_169074 ) ) ( not ( = ?auto_169070 ?auto_169075 ) ) ( not ( = ?auto_169070 ?auto_169076 ) ) ( not ( = ?auto_169071 ?auto_169072 ) ) ( not ( = ?auto_169071 ?auto_169073 ) ) ( not ( = ?auto_169071 ?auto_169074 ) ) ( not ( = ?auto_169071 ?auto_169075 ) ) ( not ( = ?auto_169071 ?auto_169076 ) ) ( not ( = ?auto_169072 ?auto_169073 ) ) ( not ( = ?auto_169072 ?auto_169074 ) ) ( not ( = ?auto_169072 ?auto_169075 ) ) ( not ( = ?auto_169072 ?auto_169076 ) ) ( not ( = ?auto_169073 ?auto_169074 ) ) ( not ( = ?auto_169073 ?auto_169075 ) ) ( not ( = ?auto_169073 ?auto_169076 ) ) ( not ( = ?auto_169074 ?auto_169075 ) ) ( not ( = ?auto_169074 ?auto_169076 ) ) ( not ( = ?auto_169075 ?auto_169076 ) ) ( ON ?auto_169076 ?auto_169077 ) ( not ( = ?auto_169070 ?auto_169077 ) ) ( not ( = ?auto_169071 ?auto_169077 ) ) ( not ( = ?auto_169072 ?auto_169077 ) ) ( not ( = ?auto_169073 ?auto_169077 ) ) ( not ( = ?auto_169074 ?auto_169077 ) ) ( not ( = ?auto_169075 ?auto_169077 ) ) ( not ( = ?auto_169076 ?auto_169077 ) ) ( ON-TABLE ?auto_169077 ) ( ON ?auto_169070 ?auto_169078 ) ( not ( = ?auto_169070 ?auto_169078 ) ) ( not ( = ?auto_169071 ?auto_169078 ) ) ( not ( = ?auto_169072 ?auto_169078 ) ) ( not ( = ?auto_169073 ?auto_169078 ) ) ( not ( = ?auto_169074 ?auto_169078 ) ) ( not ( = ?auto_169075 ?auto_169078 ) ) ( not ( = ?auto_169076 ?auto_169078 ) ) ( not ( = ?auto_169077 ?auto_169078 ) ) ( ON ?auto_169071 ?auto_169070 ) ( ON-TABLE ?auto_169078 ) ( ON ?auto_169072 ?auto_169071 ) ( ON ?auto_169073 ?auto_169072 ) ( ON ?auto_169074 ?auto_169073 ) ( CLEAR ?auto_169076 ) ( ON ?auto_169075 ?auto_169074 ) ( CLEAR ?auto_169075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_169078 ?auto_169070 ?auto_169071 ?auto_169072 ?auto_169073 ?auto_169074 )
      ( MAKE-7PILE ?auto_169070 ?auto_169071 ?auto_169072 ?auto_169073 ?auto_169074 ?auto_169075 ?auto_169076 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_169079 - BLOCK
      ?auto_169080 - BLOCK
      ?auto_169081 - BLOCK
      ?auto_169082 - BLOCK
      ?auto_169083 - BLOCK
      ?auto_169084 - BLOCK
      ?auto_169085 - BLOCK
    )
    :vars
    (
      ?auto_169086 - BLOCK
      ?auto_169087 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169079 ?auto_169080 ) ) ( not ( = ?auto_169079 ?auto_169081 ) ) ( not ( = ?auto_169079 ?auto_169082 ) ) ( not ( = ?auto_169079 ?auto_169083 ) ) ( not ( = ?auto_169079 ?auto_169084 ) ) ( not ( = ?auto_169079 ?auto_169085 ) ) ( not ( = ?auto_169080 ?auto_169081 ) ) ( not ( = ?auto_169080 ?auto_169082 ) ) ( not ( = ?auto_169080 ?auto_169083 ) ) ( not ( = ?auto_169080 ?auto_169084 ) ) ( not ( = ?auto_169080 ?auto_169085 ) ) ( not ( = ?auto_169081 ?auto_169082 ) ) ( not ( = ?auto_169081 ?auto_169083 ) ) ( not ( = ?auto_169081 ?auto_169084 ) ) ( not ( = ?auto_169081 ?auto_169085 ) ) ( not ( = ?auto_169082 ?auto_169083 ) ) ( not ( = ?auto_169082 ?auto_169084 ) ) ( not ( = ?auto_169082 ?auto_169085 ) ) ( not ( = ?auto_169083 ?auto_169084 ) ) ( not ( = ?auto_169083 ?auto_169085 ) ) ( not ( = ?auto_169084 ?auto_169085 ) ) ( not ( = ?auto_169079 ?auto_169086 ) ) ( not ( = ?auto_169080 ?auto_169086 ) ) ( not ( = ?auto_169081 ?auto_169086 ) ) ( not ( = ?auto_169082 ?auto_169086 ) ) ( not ( = ?auto_169083 ?auto_169086 ) ) ( not ( = ?auto_169084 ?auto_169086 ) ) ( not ( = ?auto_169085 ?auto_169086 ) ) ( ON-TABLE ?auto_169086 ) ( ON ?auto_169079 ?auto_169087 ) ( not ( = ?auto_169079 ?auto_169087 ) ) ( not ( = ?auto_169080 ?auto_169087 ) ) ( not ( = ?auto_169081 ?auto_169087 ) ) ( not ( = ?auto_169082 ?auto_169087 ) ) ( not ( = ?auto_169083 ?auto_169087 ) ) ( not ( = ?auto_169084 ?auto_169087 ) ) ( not ( = ?auto_169085 ?auto_169087 ) ) ( not ( = ?auto_169086 ?auto_169087 ) ) ( ON ?auto_169080 ?auto_169079 ) ( ON-TABLE ?auto_169087 ) ( ON ?auto_169081 ?auto_169080 ) ( ON ?auto_169082 ?auto_169081 ) ( ON ?auto_169083 ?auto_169082 ) ( ON ?auto_169084 ?auto_169083 ) ( CLEAR ?auto_169084 ) ( HOLDING ?auto_169085 ) ( CLEAR ?auto_169086 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169086 ?auto_169085 )
      ( MAKE-7PILE ?auto_169079 ?auto_169080 ?auto_169081 ?auto_169082 ?auto_169083 ?auto_169084 ?auto_169085 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_169088 - BLOCK
      ?auto_169089 - BLOCK
      ?auto_169090 - BLOCK
      ?auto_169091 - BLOCK
      ?auto_169092 - BLOCK
      ?auto_169093 - BLOCK
      ?auto_169094 - BLOCK
    )
    :vars
    (
      ?auto_169095 - BLOCK
      ?auto_169096 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169088 ?auto_169089 ) ) ( not ( = ?auto_169088 ?auto_169090 ) ) ( not ( = ?auto_169088 ?auto_169091 ) ) ( not ( = ?auto_169088 ?auto_169092 ) ) ( not ( = ?auto_169088 ?auto_169093 ) ) ( not ( = ?auto_169088 ?auto_169094 ) ) ( not ( = ?auto_169089 ?auto_169090 ) ) ( not ( = ?auto_169089 ?auto_169091 ) ) ( not ( = ?auto_169089 ?auto_169092 ) ) ( not ( = ?auto_169089 ?auto_169093 ) ) ( not ( = ?auto_169089 ?auto_169094 ) ) ( not ( = ?auto_169090 ?auto_169091 ) ) ( not ( = ?auto_169090 ?auto_169092 ) ) ( not ( = ?auto_169090 ?auto_169093 ) ) ( not ( = ?auto_169090 ?auto_169094 ) ) ( not ( = ?auto_169091 ?auto_169092 ) ) ( not ( = ?auto_169091 ?auto_169093 ) ) ( not ( = ?auto_169091 ?auto_169094 ) ) ( not ( = ?auto_169092 ?auto_169093 ) ) ( not ( = ?auto_169092 ?auto_169094 ) ) ( not ( = ?auto_169093 ?auto_169094 ) ) ( not ( = ?auto_169088 ?auto_169095 ) ) ( not ( = ?auto_169089 ?auto_169095 ) ) ( not ( = ?auto_169090 ?auto_169095 ) ) ( not ( = ?auto_169091 ?auto_169095 ) ) ( not ( = ?auto_169092 ?auto_169095 ) ) ( not ( = ?auto_169093 ?auto_169095 ) ) ( not ( = ?auto_169094 ?auto_169095 ) ) ( ON-TABLE ?auto_169095 ) ( ON ?auto_169088 ?auto_169096 ) ( not ( = ?auto_169088 ?auto_169096 ) ) ( not ( = ?auto_169089 ?auto_169096 ) ) ( not ( = ?auto_169090 ?auto_169096 ) ) ( not ( = ?auto_169091 ?auto_169096 ) ) ( not ( = ?auto_169092 ?auto_169096 ) ) ( not ( = ?auto_169093 ?auto_169096 ) ) ( not ( = ?auto_169094 ?auto_169096 ) ) ( not ( = ?auto_169095 ?auto_169096 ) ) ( ON ?auto_169089 ?auto_169088 ) ( ON-TABLE ?auto_169096 ) ( ON ?auto_169090 ?auto_169089 ) ( ON ?auto_169091 ?auto_169090 ) ( ON ?auto_169092 ?auto_169091 ) ( ON ?auto_169093 ?auto_169092 ) ( CLEAR ?auto_169095 ) ( ON ?auto_169094 ?auto_169093 ) ( CLEAR ?auto_169094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_169096 ?auto_169088 ?auto_169089 ?auto_169090 ?auto_169091 ?auto_169092 ?auto_169093 )
      ( MAKE-7PILE ?auto_169088 ?auto_169089 ?auto_169090 ?auto_169091 ?auto_169092 ?auto_169093 ?auto_169094 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_169097 - BLOCK
      ?auto_169098 - BLOCK
      ?auto_169099 - BLOCK
      ?auto_169100 - BLOCK
      ?auto_169101 - BLOCK
      ?auto_169102 - BLOCK
      ?auto_169103 - BLOCK
    )
    :vars
    (
      ?auto_169105 - BLOCK
      ?auto_169104 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169097 ?auto_169098 ) ) ( not ( = ?auto_169097 ?auto_169099 ) ) ( not ( = ?auto_169097 ?auto_169100 ) ) ( not ( = ?auto_169097 ?auto_169101 ) ) ( not ( = ?auto_169097 ?auto_169102 ) ) ( not ( = ?auto_169097 ?auto_169103 ) ) ( not ( = ?auto_169098 ?auto_169099 ) ) ( not ( = ?auto_169098 ?auto_169100 ) ) ( not ( = ?auto_169098 ?auto_169101 ) ) ( not ( = ?auto_169098 ?auto_169102 ) ) ( not ( = ?auto_169098 ?auto_169103 ) ) ( not ( = ?auto_169099 ?auto_169100 ) ) ( not ( = ?auto_169099 ?auto_169101 ) ) ( not ( = ?auto_169099 ?auto_169102 ) ) ( not ( = ?auto_169099 ?auto_169103 ) ) ( not ( = ?auto_169100 ?auto_169101 ) ) ( not ( = ?auto_169100 ?auto_169102 ) ) ( not ( = ?auto_169100 ?auto_169103 ) ) ( not ( = ?auto_169101 ?auto_169102 ) ) ( not ( = ?auto_169101 ?auto_169103 ) ) ( not ( = ?auto_169102 ?auto_169103 ) ) ( not ( = ?auto_169097 ?auto_169105 ) ) ( not ( = ?auto_169098 ?auto_169105 ) ) ( not ( = ?auto_169099 ?auto_169105 ) ) ( not ( = ?auto_169100 ?auto_169105 ) ) ( not ( = ?auto_169101 ?auto_169105 ) ) ( not ( = ?auto_169102 ?auto_169105 ) ) ( not ( = ?auto_169103 ?auto_169105 ) ) ( ON ?auto_169097 ?auto_169104 ) ( not ( = ?auto_169097 ?auto_169104 ) ) ( not ( = ?auto_169098 ?auto_169104 ) ) ( not ( = ?auto_169099 ?auto_169104 ) ) ( not ( = ?auto_169100 ?auto_169104 ) ) ( not ( = ?auto_169101 ?auto_169104 ) ) ( not ( = ?auto_169102 ?auto_169104 ) ) ( not ( = ?auto_169103 ?auto_169104 ) ) ( not ( = ?auto_169105 ?auto_169104 ) ) ( ON ?auto_169098 ?auto_169097 ) ( ON-TABLE ?auto_169104 ) ( ON ?auto_169099 ?auto_169098 ) ( ON ?auto_169100 ?auto_169099 ) ( ON ?auto_169101 ?auto_169100 ) ( ON ?auto_169102 ?auto_169101 ) ( ON ?auto_169103 ?auto_169102 ) ( CLEAR ?auto_169103 ) ( HOLDING ?auto_169105 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169105 )
      ( MAKE-7PILE ?auto_169097 ?auto_169098 ?auto_169099 ?auto_169100 ?auto_169101 ?auto_169102 ?auto_169103 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_169106 - BLOCK
      ?auto_169107 - BLOCK
      ?auto_169108 - BLOCK
      ?auto_169109 - BLOCK
      ?auto_169110 - BLOCK
      ?auto_169111 - BLOCK
      ?auto_169112 - BLOCK
    )
    :vars
    (
      ?auto_169114 - BLOCK
      ?auto_169113 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169106 ?auto_169107 ) ) ( not ( = ?auto_169106 ?auto_169108 ) ) ( not ( = ?auto_169106 ?auto_169109 ) ) ( not ( = ?auto_169106 ?auto_169110 ) ) ( not ( = ?auto_169106 ?auto_169111 ) ) ( not ( = ?auto_169106 ?auto_169112 ) ) ( not ( = ?auto_169107 ?auto_169108 ) ) ( not ( = ?auto_169107 ?auto_169109 ) ) ( not ( = ?auto_169107 ?auto_169110 ) ) ( not ( = ?auto_169107 ?auto_169111 ) ) ( not ( = ?auto_169107 ?auto_169112 ) ) ( not ( = ?auto_169108 ?auto_169109 ) ) ( not ( = ?auto_169108 ?auto_169110 ) ) ( not ( = ?auto_169108 ?auto_169111 ) ) ( not ( = ?auto_169108 ?auto_169112 ) ) ( not ( = ?auto_169109 ?auto_169110 ) ) ( not ( = ?auto_169109 ?auto_169111 ) ) ( not ( = ?auto_169109 ?auto_169112 ) ) ( not ( = ?auto_169110 ?auto_169111 ) ) ( not ( = ?auto_169110 ?auto_169112 ) ) ( not ( = ?auto_169111 ?auto_169112 ) ) ( not ( = ?auto_169106 ?auto_169114 ) ) ( not ( = ?auto_169107 ?auto_169114 ) ) ( not ( = ?auto_169108 ?auto_169114 ) ) ( not ( = ?auto_169109 ?auto_169114 ) ) ( not ( = ?auto_169110 ?auto_169114 ) ) ( not ( = ?auto_169111 ?auto_169114 ) ) ( not ( = ?auto_169112 ?auto_169114 ) ) ( ON ?auto_169106 ?auto_169113 ) ( not ( = ?auto_169106 ?auto_169113 ) ) ( not ( = ?auto_169107 ?auto_169113 ) ) ( not ( = ?auto_169108 ?auto_169113 ) ) ( not ( = ?auto_169109 ?auto_169113 ) ) ( not ( = ?auto_169110 ?auto_169113 ) ) ( not ( = ?auto_169111 ?auto_169113 ) ) ( not ( = ?auto_169112 ?auto_169113 ) ) ( not ( = ?auto_169114 ?auto_169113 ) ) ( ON ?auto_169107 ?auto_169106 ) ( ON-TABLE ?auto_169113 ) ( ON ?auto_169108 ?auto_169107 ) ( ON ?auto_169109 ?auto_169108 ) ( ON ?auto_169110 ?auto_169109 ) ( ON ?auto_169111 ?auto_169110 ) ( ON ?auto_169112 ?auto_169111 ) ( ON ?auto_169114 ?auto_169112 ) ( CLEAR ?auto_169114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_169113 ?auto_169106 ?auto_169107 ?auto_169108 ?auto_169109 ?auto_169110 ?auto_169111 ?auto_169112 )
      ( MAKE-7PILE ?auto_169106 ?auto_169107 ?auto_169108 ?auto_169109 ?auto_169110 ?auto_169111 ?auto_169112 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_169131 - BLOCK
      ?auto_169132 - BLOCK
      ?auto_169133 - BLOCK
      ?auto_169134 - BLOCK
      ?auto_169135 - BLOCK
      ?auto_169136 - BLOCK
      ?auto_169137 - BLOCK
      ?auto_169138 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_169137 ) ( ON-TABLE ?auto_169131 ) ( ON ?auto_169132 ?auto_169131 ) ( ON ?auto_169133 ?auto_169132 ) ( ON ?auto_169134 ?auto_169133 ) ( ON ?auto_169135 ?auto_169134 ) ( ON ?auto_169136 ?auto_169135 ) ( ON ?auto_169137 ?auto_169136 ) ( not ( = ?auto_169131 ?auto_169132 ) ) ( not ( = ?auto_169131 ?auto_169133 ) ) ( not ( = ?auto_169131 ?auto_169134 ) ) ( not ( = ?auto_169131 ?auto_169135 ) ) ( not ( = ?auto_169131 ?auto_169136 ) ) ( not ( = ?auto_169131 ?auto_169137 ) ) ( not ( = ?auto_169131 ?auto_169138 ) ) ( not ( = ?auto_169132 ?auto_169133 ) ) ( not ( = ?auto_169132 ?auto_169134 ) ) ( not ( = ?auto_169132 ?auto_169135 ) ) ( not ( = ?auto_169132 ?auto_169136 ) ) ( not ( = ?auto_169132 ?auto_169137 ) ) ( not ( = ?auto_169132 ?auto_169138 ) ) ( not ( = ?auto_169133 ?auto_169134 ) ) ( not ( = ?auto_169133 ?auto_169135 ) ) ( not ( = ?auto_169133 ?auto_169136 ) ) ( not ( = ?auto_169133 ?auto_169137 ) ) ( not ( = ?auto_169133 ?auto_169138 ) ) ( not ( = ?auto_169134 ?auto_169135 ) ) ( not ( = ?auto_169134 ?auto_169136 ) ) ( not ( = ?auto_169134 ?auto_169137 ) ) ( not ( = ?auto_169134 ?auto_169138 ) ) ( not ( = ?auto_169135 ?auto_169136 ) ) ( not ( = ?auto_169135 ?auto_169137 ) ) ( not ( = ?auto_169135 ?auto_169138 ) ) ( not ( = ?auto_169136 ?auto_169137 ) ) ( not ( = ?auto_169136 ?auto_169138 ) ) ( not ( = ?auto_169137 ?auto_169138 ) ) ( ON-TABLE ?auto_169138 ) ( CLEAR ?auto_169138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_169138 )
      ( MAKE-8PILE ?auto_169131 ?auto_169132 ?auto_169133 ?auto_169134 ?auto_169135 ?auto_169136 ?auto_169137 ?auto_169138 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_169139 - BLOCK
      ?auto_169140 - BLOCK
      ?auto_169141 - BLOCK
      ?auto_169142 - BLOCK
      ?auto_169143 - BLOCK
      ?auto_169144 - BLOCK
      ?auto_169145 - BLOCK
      ?auto_169146 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169139 ) ( ON ?auto_169140 ?auto_169139 ) ( ON ?auto_169141 ?auto_169140 ) ( ON ?auto_169142 ?auto_169141 ) ( ON ?auto_169143 ?auto_169142 ) ( ON ?auto_169144 ?auto_169143 ) ( not ( = ?auto_169139 ?auto_169140 ) ) ( not ( = ?auto_169139 ?auto_169141 ) ) ( not ( = ?auto_169139 ?auto_169142 ) ) ( not ( = ?auto_169139 ?auto_169143 ) ) ( not ( = ?auto_169139 ?auto_169144 ) ) ( not ( = ?auto_169139 ?auto_169145 ) ) ( not ( = ?auto_169139 ?auto_169146 ) ) ( not ( = ?auto_169140 ?auto_169141 ) ) ( not ( = ?auto_169140 ?auto_169142 ) ) ( not ( = ?auto_169140 ?auto_169143 ) ) ( not ( = ?auto_169140 ?auto_169144 ) ) ( not ( = ?auto_169140 ?auto_169145 ) ) ( not ( = ?auto_169140 ?auto_169146 ) ) ( not ( = ?auto_169141 ?auto_169142 ) ) ( not ( = ?auto_169141 ?auto_169143 ) ) ( not ( = ?auto_169141 ?auto_169144 ) ) ( not ( = ?auto_169141 ?auto_169145 ) ) ( not ( = ?auto_169141 ?auto_169146 ) ) ( not ( = ?auto_169142 ?auto_169143 ) ) ( not ( = ?auto_169142 ?auto_169144 ) ) ( not ( = ?auto_169142 ?auto_169145 ) ) ( not ( = ?auto_169142 ?auto_169146 ) ) ( not ( = ?auto_169143 ?auto_169144 ) ) ( not ( = ?auto_169143 ?auto_169145 ) ) ( not ( = ?auto_169143 ?auto_169146 ) ) ( not ( = ?auto_169144 ?auto_169145 ) ) ( not ( = ?auto_169144 ?auto_169146 ) ) ( not ( = ?auto_169145 ?auto_169146 ) ) ( ON-TABLE ?auto_169146 ) ( CLEAR ?auto_169146 ) ( HOLDING ?auto_169145 ) ( CLEAR ?auto_169144 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_169139 ?auto_169140 ?auto_169141 ?auto_169142 ?auto_169143 ?auto_169144 ?auto_169145 )
      ( MAKE-8PILE ?auto_169139 ?auto_169140 ?auto_169141 ?auto_169142 ?auto_169143 ?auto_169144 ?auto_169145 ?auto_169146 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_169147 - BLOCK
      ?auto_169148 - BLOCK
      ?auto_169149 - BLOCK
      ?auto_169150 - BLOCK
      ?auto_169151 - BLOCK
      ?auto_169152 - BLOCK
      ?auto_169153 - BLOCK
      ?auto_169154 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169147 ) ( ON ?auto_169148 ?auto_169147 ) ( ON ?auto_169149 ?auto_169148 ) ( ON ?auto_169150 ?auto_169149 ) ( ON ?auto_169151 ?auto_169150 ) ( ON ?auto_169152 ?auto_169151 ) ( not ( = ?auto_169147 ?auto_169148 ) ) ( not ( = ?auto_169147 ?auto_169149 ) ) ( not ( = ?auto_169147 ?auto_169150 ) ) ( not ( = ?auto_169147 ?auto_169151 ) ) ( not ( = ?auto_169147 ?auto_169152 ) ) ( not ( = ?auto_169147 ?auto_169153 ) ) ( not ( = ?auto_169147 ?auto_169154 ) ) ( not ( = ?auto_169148 ?auto_169149 ) ) ( not ( = ?auto_169148 ?auto_169150 ) ) ( not ( = ?auto_169148 ?auto_169151 ) ) ( not ( = ?auto_169148 ?auto_169152 ) ) ( not ( = ?auto_169148 ?auto_169153 ) ) ( not ( = ?auto_169148 ?auto_169154 ) ) ( not ( = ?auto_169149 ?auto_169150 ) ) ( not ( = ?auto_169149 ?auto_169151 ) ) ( not ( = ?auto_169149 ?auto_169152 ) ) ( not ( = ?auto_169149 ?auto_169153 ) ) ( not ( = ?auto_169149 ?auto_169154 ) ) ( not ( = ?auto_169150 ?auto_169151 ) ) ( not ( = ?auto_169150 ?auto_169152 ) ) ( not ( = ?auto_169150 ?auto_169153 ) ) ( not ( = ?auto_169150 ?auto_169154 ) ) ( not ( = ?auto_169151 ?auto_169152 ) ) ( not ( = ?auto_169151 ?auto_169153 ) ) ( not ( = ?auto_169151 ?auto_169154 ) ) ( not ( = ?auto_169152 ?auto_169153 ) ) ( not ( = ?auto_169152 ?auto_169154 ) ) ( not ( = ?auto_169153 ?auto_169154 ) ) ( ON-TABLE ?auto_169154 ) ( CLEAR ?auto_169152 ) ( ON ?auto_169153 ?auto_169154 ) ( CLEAR ?auto_169153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169154 )
      ( MAKE-8PILE ?auto_169147 ?auto_169148 ?auto_169149 ?auto_169150 ?auto_169151 ?auto_169152 ?auto_169153 ?auto_169154 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_169155 - BLOCK
      ?auto_169156 - BLOCK
      ?auto_169157 - BLOCK
      ?auto_169158 - BLOCK
      ?auto_169159 - BLOCK
      ?auto_169160 - BLOCK
      ?auto_169161 - BLOCK
      ?auto_169162 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169155 ) ( ON ?auto_169156 ?auto_169155 ) ( ON ?auto_169157 ?auto_169156 ) ( ON ?auto_169158 ?auto_169157 ) ( ON ?auto_169159 ?auto_169158 ) ( not ( = ?auto_169155 ?auto_169156 ) ) ( not ( = ?auto_169155 ?auto_169157 ) ) ( not ( = ?auto_169155 ?auto_169158 ) ) ( not ( = ?auto_169155 ?auto_169159 ) ) ( not ( = ?auto_169155 ?auto_169160 ) ) ( not ( = ?auto_169155 ?auto_169161 ) ) ( not ( = ?auto_169155 ?auto_169162 ) ) ( not ( = ?auto_169156 ?auto_169157 ) ) ( not ( = ?auto_169156 ?auto_169158 ) ) ( not ( = ?auto_169156 ?auto_169159 ) ) ( not ( = ?auto_169156 ?auto_169160 ) ) ( not ( = ?auto_169156 ?auto_169161 ) ) ( not ( = ?auto_169156 ?auto_169162 ) ) ( not ( = ?auto_169157 ?auto_169158 ) ) ( not ( = ?auto_169157 ?auto_169159 ) ) ( not ( = ?auto_169157 ?auto_169160 ) ) ( not ( = ?auto_169157 ?auto_169161 ) ) ( not ( = ?auto_169157 ?auto_169162 ) ) ( not ( = ?auto_169158 ?auto_169159 ) ) ( not ( = ?auto_169158 ?auto_169160 ) ) ( not ( = ?auto_169158 ?auto_169161 ) ) ( not ( = ?auto_169158 ?auto_169162 ) ) ( not ( = ?auto_169159 ?auto_169160 ) ) ( not ( = ?auto_169159 ?auto_169161 ) ) ( not ( = ?auto_169159 ?auto_169162 ) ) ( not ( = ?auto_169160 ?auto_169161 ) ) ( not ( = ?auto_169160 ?auto_169162 ) ) ( not ( = ?auto_169161 ?auto_169162 ) ) ( ON-TABLE ?auto_169162 ) ( ON ?auto_169161 ?auto_169162 ) ( CLEAR ?auto_169161 ) ( HOLDING ?auto_169160 ) ( CLEAR ?auto_169159 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_169155 ?auto_169156 ?auto_169157 ?auto_169158 ?auto_169159 ?auto_169160 )
      ( MAKE-8PILE ?auto_169155 ?auto_169156 ?auto_169157 ?auto_169158 ?auto_169159 ?auto_169160 ?auto_169161 ?auto_169162 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_169163 - BLOCK
      ?auto_169164 - BLOCK
      ?auto_169165 - BLOCK
      ?auto_169166 - BLOCK
      ?auto_169167 - BLOCK
      ?auto_169168 - BLOCK
      ?auto_169169 - BLOCK
      ?auto_169170 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169163 ) ( ON ?auto_169164 ?auto_169163 ) ( ON ?auto_169165 ?auto_169164 ) ( ON ?auto_169166 ?auto_169165 ) ( ON ?auto_169167 ?auto_169166 ) ( not ( = ?auto_169163 ?auto_169164 ) ) ( not ( = ?auto_169163 ?auto_169165 ) ) ( not ( = ?auto_169163 ?auto_169166 ) ) ( not ( = ?auto_169163 ?auto_169167 ) ) ( not ( = ?auto_169163 ?auto_169168 ) ) ( not ( = ?auto_169163 ?auto_169169 ) ) ( not ( = ?auto_169163 ?auto_169170 ) ) ( not ( = ?auto_169164 ?auto_169165 ) ) ( not ( = ?auto_169164 ?auto_169166 ) ) ( not ( = ?auto_169164 ?auto_169167 ) ) ( not ( = ?auto_169164 ?auto_169168 ) ) ( not ( = ?auto_169164 ?auto_169169 ) ) ( not ( = ?auto_169164 ?auto_169170 ) ) ( not ( = ?auto_169165 ?auto_169166 ) ) ( not ( = ?auto_169165 ?auto_169167 ) ) ( not ( = ?auto_169165 ?auto_169168 ) ) ( not ( = ?auto_169165 ?auto_169169 ) ) ( not ( = ?auto_169165 ?auto_169170 ) ) ( not ( = ?auto_169166 ?auto_169167 ) ) ( not ( = ?auto_169166 ?auto_169168 ) ) ( not ( = ?auto_169166 ?auto_169169 ) ) ( not ( = ?auto_169166 ?auto_169170 ) ) ( not ( = ?auto_169167 ?auto_169168 ) ) ( not ( = ?auto_169167 ?auto_169169 ) ) ( not ( = ?auto_169167 ?auto_169170 ) ) ( not ( = ?auto_169168 ?auto_169169 ) ) ( not ( = ?auto_169168 ?auto_169170 ) ) ( not ( = ?auto_169169 ?auto_169170 ) ) ( ON-TABLE ?auto_169170 ) ( ON ?auto_169169 ?auto_169170 ) ( CLEAR ?auto_169167 ) ( ON ?auto_169168 ?auto_169169 ) ( CLEAR ?auto_169168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169170 ?auto_169169 )
      ( MAKE-8PILE ?auto_169163 ?auto_169164 ?auto_169165 ?auto_169166 ?auto_169167 ?auto_169168 ?auto_169169 ?auto_169170 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_169171 - BLOCK
      ?auto_169172 - BLOCK
      ?auto_169173 - BLOCK
      ?auto_169174 - BLOCK
      ?auto_169175 - BLOCK
      ?auto_169176 - BLOCK
      ?auto_169177 - BLOCK
      ?auto_169178 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169171 ) ( ON ?auto_169172 ?auto_169171 ) ( ON ?auto_169173 ?auto_169172 ) ( ON ?auto_169174 ?auto_169173 ) ( not ( = ?auto_169171 ?auto_169172 ) ) ( not ( = ?auto_169171 ?auto_169173 ) ) ( not ( = ?auto_169171 ?auto_169174 ) ) ( not ( = ?auto_169171 ?auto_169175 ) ) ( not ( = ?auto_169171 ?auto_169176 ) ) ( not ( = ?auto_169171 ?auto_169177 ) ) ( not ( = ?auto_169171 ?auto_169178 ) ) ( not ( = ?auto_169172 ?auto_169173 ) ) ( not ( = ?auto_169172 ?auto_169174 ) ) ( not ( = ?auto_169172 ?auto_169175 ) ) ( not ( = ?auto_169172 ?auto_169176 ) ) ( not ( = ?auto_169172 ?auto_169177 ) ) ( not ( = ?auto_169172 ?auto_169178 ) ) ( not ( = ?auto_169173 ?auto_169174 ) ) ( not ( = ?auto_169173 ?auto_169175 ) ) ( not ( = ?auto_169173 ?auto_169176 ) ) ( not ( = ?auto_169173 ?auto_169177 ) ) ( not ( = ?auto_169173 ?auto_169178 ) ) ( not ( = ?auto_169174 ?auto_169175 ) ) ( not ( = ?auto_169174 ?auto_169176 ) ) ( not ( = ?auto_169174 ?auto_169177 ) ) ( not ( = ?auto_169174 ?auto_169178 ) ) ( not ( = ?auto_169175 ?auto_169176 ) ) ( not ( = ?auto_169175 ?auto_169177 ) ) ( not ( = ?auto_169175 ?auto_169178 ) ) ( not ( = ?auto_169176 ?auto_169177 ) ) ( not ( = ?auto_169176 ?auto_169178 ) ) ( not ( = ?auto_169177 ?auto_169178 ) ) ( ON-TABLE ?auto_169178 ) ( ON ?auto_169177 ?auto_169178 ) ( ON ?auto_169176 ?auto_169177 ) ( CLEAR ?auto_169176 ) ( HOLDING ?auto_169175 ) ( CLEAR ?auto_169174 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_169171 ?auto_169172 ?auto_169173 ?auto_169174 ?auto_169175 )
      ( MAKE-8PILE ?auto_169171 ?auto_169172 ?auto_169173 ?auto_169174 ?auto_169175 ?auto_169176 ?auto_169177 ?auto_169178 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_169179 - BLOCK
      ?auto_169180 - BLOCK
      ?auto_169181 - BLOCK
      ?auto_169182 - BLOCK
      ?auto_169183 - BLOCK
      ?auto_169184 - BLOCK
      ?auto_169185 - BLOCK
      ?auto_169186 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169179 ) ( ON ?auto_169180 ?auto_169179 ) ( ON ?auto_169181 ?auto_169180 ) ( ON ?auto_169182 ?auto_169181 ) ( not ( = ?auto_169179 ?auto_169180 ) ) ( not ( = ?auto_169179 ?auto_169181 ) ) ( not ( = ?auto_169179 ?auto_169182 ) ) ( not ( = ?auto_169179 ?auto_169183 ) ) ( not ( = ?auto_169179 ?auto_169184 ) ) ( not ( = ?auto_169179 ?auto_169185 ) ) ( not ( = ?auto_169179 ?auto_169186 ) ) ( not ( = ?auto_169180 ?auto_169181 ) ) ( not ( = ?auto_169180 ?auto_169182 ) ) ( not ( = ?auto_169180 ?auto_169183 ) ) ( not ( = ?auto_169180 ?auto_169184 ) ) ( not ( = ?auto_169180 ?auto_169185 ) ) ( not ( = ?auto_169180 ?auto_169186 ) ) ( not ( = ?auto_169181 ?auto_169182 ) ) ( not ( = ?auto_169181 ?auto_169183 ) ) ( not ( = ?auto_169181 ?auto_169184 ) ) ( not ( = ?auto_169181 ?auto_169185 ) ) ( not ( = ?auto_169181 ?auto_169186 ) ) ( not ( = ?auto_169182 ?auto_169183 ) ) ( not ( = ?auto_169182 ?auto_169184 ) ) ( not ( = ?auto_169182 ?auto_169185 ) ) ( not ( = ?auto_169182 ?auto_169186 ) ) ( not ( = ?auto_169183 ?auto_169184 ) ) ( not ( = ?auto_169183 ?auto_169185 ) ) ( not ( = ?auto_169183 ?auto_169186 ) ) ( not ( = ?auto_169184 ?auto_169185 ) ) ( not ( = ?auto_169184 ?auto_169186 ) ) ( not ( = ?auto_169185 ?auto_169186 ) ) ( ON-TABLE ?auto_169186 ) ( ON ?auto_169185 ?auto_169186 ) ( ON ?auto_169184 ?auto_169185 ) ( CLEAR ?auto_169182 ) ( ON ?auto_169183 ?auto_169184 ) ( CLEAR ?auto_169183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169186 ?auto_169185 ?auto_169184 )
      ( MAKE-8PILE ?auto_169179 ?auto_169180 ?auto_169181 ?auto_169182 ?auto_169183 ?auto_169184 ?auto_169185 ?auto_169186 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_169187 - BLOCK
      ?auto_169188 - BLOCK
      ?auto_169189 - BLOCK
      ?auto_169190 - BLOCK
      ?auto_169191 - BLOCK
      ?auto_169192 - BLOCK
      ?auto_169193 - BLOCK
      ?auto_169194 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169187 ) ( ON ?auto_169188 ?auto_169187 ) ( ON ?auto_169189 ?auto_169188 ) ( not ( = ?auto_169187 ?auto_169188 ) ) ( not ( = ?auto_169187 ?auto_169189 ) ) ( not ( = ?auto_169187 ?auto_169190 ) ) ( not ( = ?auto_169187 ?auto_169191 ) ) ( not ( = ?auto_169187 ?auto_169192 ) ) ( not ( = ?auto_169187 ?auto_169193 ) ) ( not ( = ?auto_169187 ?auto_169194 ) ) ( not ( = ?auto_169188 ?auto_169189 ) ) ( not ( = ?auto_169188 ?auto_169190 ) ) ( not ( = ?auto_169188 ?auto_169191 ) ) ( not ( = ?auto_169188 ?auto_169192 ) ) ( not ( = ?auto_169188 ?auto_169193 ) ) ( not ( = ?auto_169188 ?auto_169194 ) ) ( not ( = ?auto_169189 ?auto_169190 ) ) ( not ( = ?auto_169189 ?auto_169191 ) ) ( not ( = ?auto_169189 ?auto_169192 ) ) ( not ( = ?auto_169189 ?auto_169193 ) ) ( not ( = ?auto_169189 ?auto_169194 ) ) ( not ( = ?auto_169190 ?auto_169191 ) ) ( not ( = ?auto_169190 ?auto_169192 ) ) ( not ( = ?auto_169190 ?auto_169193 ) ) ( not ( = ?auto_169190 ?auto_169194 ) ) ( not ( = ?auto_169191 ?auto_169192 ) ) ( not ( = ?auto_169191 ?auto_169193 ) ) ( not ( = ?auto_169191 ?auto_169194 ) ) ( not ( = ?auto_169192 ?auto_169193 ) ) ( not ( = ?auto_169192 ?auto_169194 ) ) ( not ( = ?auto_169193 ?auto_169194 ) ) ( ON-TABLE ?auto_169194 ) ( ON ?auto_169193 ?auto_169194 ) ( ON ?auto_169192 ?auto_169193 ) ( ON ?auto_169191 ?auto_169192 ) ( CLEAR ?auto_169191 ) ( HOLDING ?auto_169190 ) ( CLEAR ?auto_169189 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169187 ?auto_169188 ?auto_169189 ?auto_169190 )
      ( MAKE-8PILE ?auto_169187 ?auto_169188 ?auto_169189 ?auto_169190 ?auto_169191 ?auto_169192 ?auto_169193 ?auto_169194 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_169195 - BLOCK
      ?auto_169196 - BLOCK
      ?auto_169197 - BLOCK
      ?auto_169198 - BLOCK
      ?auto_169199 - BLOCK
      ?auto_169200 - BLOCK
      ?auto_169201 - BLOCK
      ?auto_169202 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169195 ) ( ON ?auto_169196 ?auto_169195 ) ( ON ?auto_169197 ?auto_169196 ) ( not ( = ?auto_169195 ?auto_169196 ) ) ( not ( = ?auto_169195 ?auto_169197 ) ) ( not ( = ?auto_169195 ?auto_169198 ) ) ( not ( = ?auto_169195 ?auto_169199 ) ) ( not ( = ?auto_169195 ?auto_169200 ) ) ( not ( = ?auto_169195 ?auto_169201 ) ) ( not ( = ?auto_169195 ?auto_169202 ) ) ( not ( = ?auto_169196 ?auto_169197 ) ) ( not ( = ?auto_169196 ?auto_169198 ) ) ( not ( = ?auto_169196 ?auto_169199 ) ) ( not ( = ?auto_169196 ?auto_169200 ) ) ( not ( = ?auto_169196 ?auto_169201 ) ) ( not ( = ?auto_169196 ?auto_169202 ) ) ( not ( = ?auto_169197 ?auto_169198 ) ) ( not ( = ?auto_169197 ?auto_169199 ) ) ( not ( = ?auto_169197 ?auto_169200 ) ) ( not ( = ?auto_169197 ?auto_169201 ) ) ( not ( = ?auto_169197 ?auto_169202 ) ) ( not ( = ?auto_169198 ?auto_169199 ) ) ( not ( = ?auto_169198 ?auto_169200 ) ) ( not ( = ?auto_169198 ?auto_169201 ) ) ( not ( = ?auto_169198 ?auto_169202 ) ) ( not ( = ?auto_169199 ?auto_169200 ) ) ( not ( = ?auto_169199 ?auto_169201 ) ) ( not ( = ?auto_169199 ?auto_169202 ) ) ( not ( = ?auto_169200 ?auto_169201 ) ) ( not ( = ?auto_169200 ?auto_169202 ) ) ( not ( = ?auto_169201 ?auto_169202 ) ) ( ON-TABLE ?auto_169202 ) ( ON ?auto_169201 ?auto_169202 ) ( ON ?auto_169200 ?auto_169201 ) ( ON ?auto_169199 ?auto_169200 ) ( CLEAR ?auto_169197 ) ( ON ?auto_169198 ?auto_169199 ) ( CLEAR ?auto_169198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169202 ?auto_169201 ?auto_169200 ?auto_169199 )
      ( MAKE-8PILE ?auto_169195 ?auto_169196 ?auto_169197 ?auto_169198 ?auto_169199 ?auto_169200 ?auto_169201 ?auto_169202 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_169203 - BLOCK
      ?auto_169204 - BLOCK
      ?auto_169205 - BLOCK
      ?auto_169206 - BLOCK
      ?auto_169207 - BLOCK
      ?auto_169208 - BLOCK
      ?auto_169209 - BLOCK
      ?auto_169210 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169203 ) ( ON ?auto_169204 ?auto_169203 ) ( not ( = ?auto_169203 ?auto_169204 ) ) ( not ( = ?auto_169203 ?auto_169205 ) ) ( not ( = ?auto_169203 ?auto_169206 ) ) ( not ( = ?auto_169203 ?auto_169207 ) ) ( not ( = ?auto_169203 ?auto_169208 ) ) ( not ( = ?auto_169203 ?auto_169209 ) ) ( not ( = ?auto_169203 ?auto_169210 ) ) ( not ( = ?auto_169204 ?auto_169205 ) ) ( not ( = ?auto_169204 ?auto_169206 ) ) ( not ( = ?auto_169204 ?auto_169207 ) ) ( not ( = ?auto_169204 ?auto_169208 ) ) ( not ( = ?auto_169204 ?auto_169209 ) ) ( not ( = ?auto_169204 ?auto_169210 ) ) ( not ( = ?auto_169205 ?auto_169206 ) ) ( not ( = ?auto_169205 ?auto_169207 ) ) ( not ( = ?auto_169205 ?auto_169208 ) ) ( not ( = ?auto_169205 ?auto_169209 ) ) ( not ( = ?auto_169205 ?auto_169210 ) ) ( not ( = ?auto_169206 ?auto_169207 ) ) ( not ( = ?auto_169206 ?auto_169208 ) ) ( not ( = ?auto_169206 ?auto_169209 ) ) ( not ( = ?auto_169206 ?auto_169210 ) ) ( not ( = ?auto_169207 ?auto_169208 ) ) ( not ( = ?auto_169207 ?auto_169209 ) ) ( not ( = ?auto_169207 ?auto_169210 ) ) ( not ( = ?auto_169208 ?auto_169209 ) ) ( not ( = ?auto_169208 ?auto_169210 ) ) ( not ( = ?auto_169209 ?auto_169210 ) ) ( ON-TABLE ?auto_169210 ) ( ON ?auto_169209 ?auto_169210 ) ( ON ?auto_169208 ?auto_169209 ) ( ON ?auto_169207 ?auto_169208 ) ( ON ?auto_169206 ?auto_169207 ) ( CLEAR ?auto_169206 ) ( HOLDING ?auto_169205 ) ( CLEAR ?auto_169204 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169203 ?auto_169204 ?auto_169205 )
      ( MAKE-8PILE ?auto_169203 ?auto_169204 ?auto_169205 ?auto_169206 ?auto_169207 ?auto_169208 ?auto_169209 ?auto_169210 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_169211 - BLOCK
      ?auto_169212 - BLOCK
      ?auto_169213 - BLOCK
      ?auto_169214 - BLOCK
      ?auto_169215 - BLOCK
      ?auto_169216 - BLOCK
      ?auto_169217 - BLOCK
      ?auto_169218 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169211 ) ( ON ?auto_169212 ?auto_169211 ) ( not ( = ?auto_169211 ?auto_169212 ) ) ( not ( = ?auto_169211 ?auto_169213 ) ) ( not ( = ?auto_169211 ?auto_169214 ) ) ( not ( = ?auto_169211 ?auto_169215 ) ) ( not ( = ?auto_169211 ?auto_169216 ) ) ( not ( = ?auto_169211 ?auto_169217 ) ) ( not ( = ?auto_169211 ?auto_169218 ) ) ( not ( = ?auto_169212 ?auto_169213 ) ) ( not ( = ?auto_169212 ?auto_169214 ) ) ( not ( = ?auto_169212 ?auto_169215 ) ) ( not ( = ?auto_169212 ?auto_169216 ) ) ( not ( = ?auto_169212 ?auto_169217 ) ) ( not ( = ?auto_169212 ?auto_169218 ) ) ( not ( = ?auto_169213 ?auto_169214 ) ) ( not ( = ?auto_169213 ?auto_169215 ) ) ( not ( = ?auto_169213 ?auto_169216 ) ) ( not ( = ?auto_169213 ?auto_169217 ) ) ( not ( = ?auto_169213 ?auto_169218 ) ) ( not ( = ?auto_169214 ?auto_169215 ) ) ( not ( = ?auto_169214 ?auto_169216 ) ) ( not ( = ?auto_169214 ?auto_169217 ) ) ( not ( = ?auto_169214 ?auto_169218 ) ) ( not ( = ?auto_169215 ?auto_169216 ) ) ( not ( = ?auto_169215 ?auto_169217 ) ) ( not ( = ?auto_169215 ?auto_169218 ) ) ( not ( = ?auto_169216 ?auto_169217 ) ) ( not ( = ?auto_169216 ?auto_169218 ) ) ( not ( = ?auto_169217 ?auto_169218 ) ) ( ON-TABLE ?auto_169218 ) ( ON ?auto_169217 ?auto_169218 ) ( ON ?auto_169216 ?auto_169217 ) ( ON ?auto_169215 ?auto_169216 ) ( ON ?auto_169214 ?auto_169215 ) ( CLEAR ?auto_169212 ) ( ON ?auto_169213 ?auto_169214 ) ( CLEAR ?auto_169213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_169218 ?auto_169217 ?auto_169216 ?auto_169215 ?auto_169214 )
      ( MAKE-8PILE ?auto_169211 ?auto_169212 ?auto_169213 ?auto_169214 ?auto_169215 ?auto_169216 ?auto_169217 ?auto_169218 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_169219 - BLOCK
      ?auto_169220 - BLOCK
      ?auto_169221 - BLOCK
      ?auto_169222 - BLOCK
      ?auto_169223 - BLOCK
      ?auto_169224 - BLOCK
      ?auto_169225 - BLOCK
      ?auto_169226 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169219 ) ( not ( = ?auto_169219 ?auto_169220 ) ) ( not ( = ?auto_169219 ?auto_169221 ) ) ( not ( = ?auto_169219 ?auto_169222 ) ) ( not ( = ?auto_169219 ?auto_169223 ) ) ( not ( = ?auto_169219 ?auto_169224 ) ) ( not ( = ?auto_169219 ?auto_169225 ) ) ( not ( = ?auto_169219 ?auto_169226 ) ) ( not ( = ?auto_169220 ?auto_169221 ) ) ( not ( = ?auto_169220 ?auto_169222 ) ) ( not ( = ?auto_169220 ?auto_169223 ) ) ( not ( = ?auto_169220 ?auto_169224 ) ) ( not ( = ?auto_169220 ?auto_169225 ) ) ( not ( = ?auto_169220 ?auto_169226 ) ) ( not ( = ?auto_169221 ?auto_169222 ) ) ( not ( = ?auto_169221 ?auto_169223 ) ) ( not ( = ?auto_169221 ?auto_169224 ) ) ( not ( = ?auto_169221 ?auto_169225 ) ) ( not ( = ?auto_169221 ?auto_169226 ) ) ( not ( = ?auto_169222 ?auto_169223 ) ) ( not ( = ?auto_169222 ?auto_169224 ) ) ( not ( = ?auto_169222 ?auto_169225 ) ) ( not ( = ?auto_169222 ?auto_169226 ) ) ( not ( = ?auto_169223 ?auto_169224 ) ) ( not ( = ?auto_169223 ?auto_169225 ) ) ( not ( = ?auto_169223 ?auto_169226 ) ) ( not ( = ?auto_169224 ?auto_169225 ) ) ( not ( = ?auto_169224 ?auto_169226 ) ) ( not ( = ?auto_169225 ?auto_169226 ) ) ( ON-TABLE ?auto_169226 ) ( ON ?auto_169225 ?auto_169226 ) ( ON ?auto_169224 ?auto_169225 ) ( ON ?auto_169223 ?auto_169224 ) ( ON ?auto_169222 ?auto_169223 ) ( ON ?auto_169221 ?auto_169222 ) ( CLEAR ?auto_169221 ) ( HOLDING ?auto_169220 ) ( CLEAR ?auto_169219 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169219 ?auto_169220 )
      ( MAKE-8PILE ?auto_169219 ?auto_169220 ?auto_169221 ?auto_169222 ?auto_169223 ?auto_169224 ?auto_169225 ?auto_169226 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_169227 - BLOCK
      ?auto_169228 - BLOCK
      ?auto_169229 - BLOCK
      ?auto_169230 - BLOCK
      ?auto_169231 - BLOCK
      ?auto_169232 - BLOCK
      ?auto_169233 - BLOCK
      ?auto_169234 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169227 ) ( not ( = ?auto_169227 ?auto_169228 ) ) ( not ( = ?auto_169227 ?auto_169229 ) ) ( not ( = ?auto_169227 ?auto_169230 ) ) ( not ( = ?auto_169227 ?auto_169231 ) ) ( not ( = ?auto_169227 ?auto_169232 ) ) ( not ( = ?auto_169227 ?auto_169233 ) ) ( not ( = ?auto_169227 ?auto_169234 ) ) ( not ( = ?auto_169228 ?auto_169229 ) ) ( not ( = ?auto_169228 ?auto_169230 ) ) ( not ( = ?auto_169228 ?auto_169231 ) ) ( not ( = ?auto_169228 ?auto_169232 ) ) ( not ( = ?auto_169228 ?auto_169233 ) ) ( not ( = ?auto_169228 ?auto_169234 ) ) ( not ( = ?auto_169229 ?auto_169230 ) ) ( not ( = ?auto_169229 ?auto_169231 ) ) ( not ( = ?auto_169229 ?auto_169232 ) ) ( not ( = ?auto_169229 ?auto_169233 ) ) ( not ( = ?auto_169229 ?auto_169234 ) ) ( not ( = ?auto_169230 ?auto_169231 ) ) ( not ( = ?auto_169230 ?auto_169232 ) ) ( not ( = ?auto_169230 ?auto_169233 ) ) ( not ( = ?auto_169230 ?auto_169234 ) ) ( not ( = ?auto_169231 ?auto_169232 ) ) ( not ( = ?auto_169231 ?auto_169233 ) ) ( not ( = ?auto_169231 ?auto_169234 ) ) ( not ( = ?auto_169232 ?auto_169233 ) ) ( not ( = ?auto_169232 ?auto_169234 ) ) ( not ( = ?auto_169233 ?auto_169234 ) ) ( ON-TABLE ?auto_169234 ) ( ON ?auto_169233 ?auto_169234 ) ( ON ?auto_169232 ?auto_169233 ) ( ON ?auto_169231 ?auto_169232 ) ( ON ?auto_169230 ?auto_169231 ) ( ON ?auto_169229 ?auto_169230 ) ( CLEAR ?auto_169227 ) ( ON ?auto_169228 ?auto_169229 ) ( CLEAR ?auto_169228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_169234 ?auto_169233 ?auto_169232 ?auto_169231 ?auto_169230 ?auto_169229 )
      ( MAKE-8PILE ?auto_169227 ?auto_169228 ?auto_169229 ?auto_169230 ?auto_169231 ?auto_169232 ?auto_169233 ?auto_169234 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_169235 - BLOCK
      ?auto_169236 - BLOCK
      ?auto_169237 - BLOCK
      ?auto_169238 - BLOCK
      ?auto_169239 - BLOCK
      ?auto_169240 - BLOCK
      ?auto_169241 - BLOCK
      ?auto_169242 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169235 ?auto_169236 ) ) ( not ( = ?auto_169235 ?auto_169237 ) ) ( not ( = ?auto_169235 ?auto_169238 ) ) ( not ( = ?auto_169235 ?auto_169239 ) ) ( not ( = ?auto_169235 ?auto_169240 ) ) ( not ( = ?auto_169235 ?auto_169241 ) ) ( not ( = ?auto_169235 ?auto_169242 ) ) ( not ( = ?auto_169236 ?auto_169237 ) ) ( not ( = ?auto_169236 ?auto_169238 ) ) ( not ( = ?auto_169236 ?auto_169239 ) ) ( not ( = ?auto_169236 ?auto_169240 ) ) ( not ( = ?auto_169236 ?auto_169241 ) ) ( not ( = ?auto_169236 ?auto_169242 ) ) ( not ( = ?auto_169237 ?auto_169238 ) ) ( not ( = ?auto_169237 ?auto_169239 ) ) ( not ( = ?auto_169237 ?auto_169240 ) ) ( not ( = ?auto_169237 ?auto_169241 ) ) ( not ( = ?auto_169237 ?auto_169242 ) ) ( not ( = ?auto_169238 ?auto_169239 ) ) ( not ( = ?auto_169238 ?auto_169240 ) ) ( not ( = ?auto_169238 ?auto_169241 ) ) ( not ( = ?auto_169238 ?auto_169242 ) ) ( not ( = ?auto_169239 ?auto_169240 ) ) ( not ( = ?auto_169239 ?auto_169241 ) ) ( not ( = ?auto_169239 ?auto_169242 ) ) ( not ( = ?auto_169240 ?auto_169241 ) ) ( not ( = ?auto_169240 ?auto_169242 ) ) ( not ( = ?auto_169241 ?auto_169242 ) ) ( ON-TABLE ?auto_169242 ) ( ON ?auto_169241 ?auto_169242 ) ( ON ?auto_169240 ?auto_169241 ) ( ON ?auto_169239 ?auto_169240 ) ( ON ?auto_169238 ?auto_169239 ) ( ON ?auto_169237 ?auto_169238 ) ( ON ?auto_169236 ?auto_169237 ) ( CLEAR ?auto_169236 ) ( HOLDING ?auto_169235 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169235 )
      ( MAKE-8PILE ?auto_169235 ?auto_169236 ?auto_169237 ?auto_169238 ?auto_169239 ?auto_169240 ?auto_169241 ?auto_169242 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_169243 - BLOCK
      ?auto_169244 - BLOCK
      ?auto_169245 - BLOCK
      ?auto_169246 - BLOCK
      ?auto_169247 - BLOCK
      ?auto_169248 - BLOCK
      ?auto_169249 - BLOCK
      ?auto_169250 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169243 ?auto_169244 ) ) ( not ( = ?auto_169243 ?auto_169245 ) ) ( not ( = ?auto_169243 ?auto_169246 ) ) ( not ( = ?auto_169243 ?auto_169247 ) ) ( not ( = ?auto_169243 ?auto_169248 ) ) ( not ( = ?auto_169243 ?auto_169249 ) ) ( not ( = ?auto_169243 ?auto_169250 ) ) ( not ( = ?auto_169244 ?auto_169245 ) ) ( not ( = ?auto_169244 ?auto_169246 ) ) ( not ( = ?auto_169244 ?auto_169247 ) ) ( not ( = ?auto_169244 ?auto_169248 ) ) ( not ( = ?auto_169244 ?auto_169249 ) ) ( not ( = ?auto_169244 ?auto_169250 ) ) ( not ( = ?auto_169245 ?auto_169246 ) ) ( not ( = ?auto_169245 ?auto_169247 ) ) ( not ( = ?auto_169245 ?auto_169248 ) ) ( not ( = ?auto_169245 ?auto_169249 ) ) ( not ( = ?auto_169245 ?auto_169250 ) ) ( not ( = ?auto_169246 ?auto_169247 ) ) ( not ( = ?auto_169246 ?auto_169248 ) ) ( not ( = ?auto_169246 ?auto_169249 ) ) ( not ( = ?auto_169246 ?auto_169250 ) ) ( not ( = ?auto_169247 ?auto_169248 ) ) ( not ( = ?auto_169247 ?auto_169249 ) ) ( not ( = ?auto_169247 ?auto_169250 ) ) ( not ( = ?auto_169248 ?auto_169249 ) ) ( not ( = ?auto_169248 ?auto_169250 ) ) ( not ( = ?auto_169249 ?auto_169250 ) ) ( ON-TABLE ?auto_169250 ) ( ON ?auto_169249 ?auto_169250 ) ( ON ?auto_169248 ?auto_169249 ) ( ON ?auto_169247 ?auto_169248 ) ( ON ?auto_169246 ?auto_169247 ) ( ON ?auto_169245 ?auto_169246 ) ( ON ?auto_169244 ?auto_169245 ) ( ON ?auto_169243 ?auto_169244 ) ( CLEAR ?auto_169243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_169250 ?auto_169249 ?auto_169248 ?auto_169247 ?auto_169246 ?auto_169245 ?auto_169244 )
      ( MAKE-8PILE ?auto_169243 ?auto_169244 ?auto_169245 ?auto_169246 ?auto_169247 ?auto_169248 ?auto_169249 ?auto_169250 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_169259 - BLOCK
      ?auto_169260 - BLOCK
      ?auto_169261 - BLOCK
      ?auto_169262 - BLOCK
      ?auto_169263 - BLOCK
      ?auto_169264 - BLOCK
      ?auto_169265 - BLOCK
      ?auto_169266 - BLOCK
    )
    :vars
    (
      ?auto_169267 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169259 ?auto_169260 ) ) ( not ( = ?auto_169259 ?auto_169261 ) ) ( not ( = ?auto_169259 ?auto_169262 ) ) ( not ( = ?auto_169259 ?auto_169263 ) ) ( not ( = ?auto_169259 ?auto_169264 ) ) ( not ( = ?auto_169259 ?auto_169265 ) ) ( not ( = ?auto_169259 ?auto_169266 ) ) ( not ( = ?auto_169260 ?auto_169261 ) ) ( not ( = ?auto_169260 ?auto_169262 ) ) ( not ( = ?auto_169260 ?auto_169263 ) ) ( not ( = ?auto_169260 ?auto_169264 ) ) ( not ( = ?auto_169260 ?auto_169265 ) ) ( not ( = ?auto_169260 ?auto_169266 ) ) ( not ( = ?auto_169261 ?auto_169262 ) ) ( not ( = ?auto_169261 ?auto_169263 ) ) ( not ( = ?auto_169261 ?auto_169264 ) ) ( not ( = ?auto_169261 ?auto_169265 ) ) ( not ( = ?auto_169261 ?auto_169266 ) ) ( not ( = ?auto_169262 ?auto_169263 ) ) ( not ( = ?auto_169262 ?auto_169264 ) ) ( not ( = ?auto_169262 ?auto_169265 ) ) ( not ( = ?auto_169262 ?auto_169266 ) ) ( not ( = ?auto_169263 ?auto_169264 ) ) ( not ( = ?auto_169263 ?auto_169265 ) ) ( not ( = ?auto_169263 ?auto_169266 ) ) ( not ( = ?auto_169264 ?auto_169265 ) ) ( not ( = ?auto_169264 ?auto_169266 ) ) ( not ( = ?auto_169265 ?auto_169266 ) ) ( ON-TABLE ?auto_169266 ) ( ON ?auto_169265 ?auto_169266 ) ( ON ?auto_169264 ?auto_169265 ) ( ON ?auto_169263 ?auto_169264 ) ( ON ?auto_169262 ?auto_169263 ) ( ON ?auto_169261 ?auto_169262 ) ( ON ?auto_169260 ?auto_169261 ) ( CLEAR ?auto_169260 ) ( ON ?auto_169259 ?auto_169267 ) ( CLEAR ?auto_169259 ) ( HAND-EMPTY ) ( not ( = ?auto_169259 ?auto_169267 ) ) ( not ( = ?auto_169260 ?auto_169267 ) ) ( not ( = ?auto_169261 ?auto_169267 ) ) ( not ( = ?auto_169262 ?auto_169267 ) ) ( not ( = ?auto_169263 ?auto_169267 ) ) ( not ( = ?auto_169264 ?auto_169267 ) ) ( not ( = ?auto_169265 ?auto_169267 ) ) ( not ( = ?auto_169266 ?auto_169267 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169259 ?auto_169267 )
      ( MAKE-8PILE ?auto_169259 ?auto_169260 ?auto_169261 ?auto_169262 ?auto_169263 ?auto_169264 ?auto_169265 ?auto_169266 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_169268 - BLOCK
      ?auto_169269 - BLOCK
      ?auto_169270 - BLOCK
      ?auto_169271 - BLOCK
      ?auto_169272 - BLOCK
      ?auto_169273 - BLOCK
      ?auto_169274 - BLOCK
      ?auto_169275 - BLOCK
    )
    :vars
    (
      ?auto_169276 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169268 ?auto_169269 ) ) ( not ( = ?auto_169268 ?auto_169270 ) ) ( not ( = ?auto_169268 ?auto_169271 ) ) ( not ( = ?auto_169268 ?auto_169272 ) ) ( not ( = ?auto_169268 ?auto_169273 ) ) ( not ( = ?auto_169268 ?auto_169274 ) ) ( not ( = ?auto_169268 ?auto_169275 ) ) ( not ( = ?auto_169269 ?auto_169270 ) ) ( not ( = ?auto_169269 ?auto_169271 ) ) ( not ( = ?auto_169269 ?auto_169272 ) ) ( not ( = ?auto_169269 ?auto_169273 ) ) ( not ( = ?auto_169269 ?auto_169274 ) ) ( not ( = ?auto_169269 ?auto_169275 ) ) ( not ( = ?auto_169270 ?auto_169271 ) ) ( not ( = ?auto_169270 ?auto_169272 ) ) ( not ( = ?auto_169270 ?auto_169273 ) ) ( not ( = ?auto_169270 ?auto_169274 ) ) ( not ( = ?auto_169270 ?auto_169275 ) ) ( not ( = ?auto_169271 ?auto_169272 ) ) ( not ( = ?auto_169271 ?auto_169273 ) ) ( not ( = ?auto_169271 ?auto_169274 ) ) ( not ( = ?auto_169271 ?auto_169275 ) ) ( not ( = ?auto_169272 ?auto_169273 ) ) ( not ( = ?auto_169272 ?auto_169274 ) ) ( not ( = ?auto_169272 ?auto_169275 ) ) ( not ( = ?auto_169273 ?auto_169274 ) ) ( not ( = ?auto_169273 ?auto_169275 ) ) ( not ( = ?auto_169274 ?auto_169275 ) ) ( ON-TABLE ?auto_169275 ) ( ON ?auto_169274 ?auto_169275 ) ( ON ?auto_169273 ?auto_169274 ) ( ON ?auto_169272 ?auto_169273 ) ( ON ?auto_169271 ?auto_169272 ) ( ON ?auto_169270 ?auto_169271 ) ( ON ?auto_169268 ?auto_169276 ) ( CLEAR ?auto_169268 ) ( not ( = ?auto_169268 ?auto_169276 ) ) ( not ( = ?auto_169269 ?auto_169276 ) ) ( not ( = ?auto_169270 ?auto_169276 ) ) ( not ( = ?auto_169271 ?auto_169276 ) ) ( not ( = ?auto_169272 ?auto_169276 ) ) ( not ( = ?auto_169273 ?auto_169276 ) ) ( not ( = ?auto_169274 ?auto_169276 ) ) ( not ( = ?auto_169275 ?auto_169276 ) ) ( HOLDING ?auto_169269 ) ( CLEAR ?auto_169270 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_169275 ?auto_169274 ?auto_169273 ?auto_169272 ?auto_169271 ?auto_169270 ?auto_169269 )
      ( MAKE-8PILE ?auto_169268 ?auto_169269 ?auto_169270 ?auto_169271 ?auto_169272 ?auto_169273 ?auto_169274 ?auto_169275 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_169277 - BLOCK
      ?auto_169278 - BLOCK
      ?auto_169279 - BLOCK
      ?auto_169280 - BLOCK
      ?auto_169281 - BLOCK
      ?auto_169282 - BLOCK
      ?auto_169283 - BLOCK
      ?auto_169284 - BLOCK
    )
    :vars
    (
      ?auto_169285 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169277 ?auto_169278 ) ) ( not ( = ?auto_169277 ?auto_169279 ) ) ( not ( = ?auto_169277 ?auto_169280 ) ) ( not ( = ?auto_169277 ?auto_169281 ) ) ( not ( = ?auto_169277 ?auto_169282 ) ) ( not ( = ?auto_169277 ?auto_169283 ) ) ( not ( = ?auto_169277 ?auto_169284 ) ) ( not ( = ?auto_169278 ?auto_169279 ) ) ( not ( = ?auto_169278 ?auto_169280 ) ) ( not ( = ?auto_169278 ?auto_169281 ) ) ( not ( = ?auto_169278 ?auto_169282 ) ) ( not ( = ?auto_169278 ?auto_169283 ) ) ( not ( = ?auto_169278 ?auto_169284 ) ) ( not ( = ?auto_169279 ?auto_169280 ) ) ( not ( = ?auto_169279 ?auto_169281 ) ) ( not ( = ?auto_169279 ?auto_169282 ) ) ( not ( = ?auto_169279 ?auto_169283 ) ) ( not ( = ?auto_169279 ?auto_169284 ) ) ( not ( = ?auto_169280 ?auto_169281 ) ) ( not ( = ?auto_169280 ?auto_169282 ) ) ( not ( = ?auto_169280 ?auto_169283 ) ) ( not ( = ?auto_169280 ?auto_169284 ) ) ( not ( = ?auto_169281 ?auto_169282 ) ) ( not ( = ?auto_169281 ?auto_169283 ) ) ( not ( = ?auto_169281 ?auto_169284 ) ) ( not ( = ?auto_169282 ?auto_169283 ) ) ( not ( = ?auto_169282 ?auto_169284 ) ) ( not ( = ?auto_169283 ?auto_169284 ) ) ( ON-TABLE ?auto_169284 ) ( ON ?auto_169283 ?auto_169284 ) ( ON ?auto_169282 ?auto_169283 ) ( ON ?auto_169281 ?auto_169282 ) ( ON ?auto_169280 ?auto_169281 ) ( ON ?auto_169279 ?auto_169280 ) ( ON ?auto_169277 ?auto_169285 ) ( not ( = ?auto_169277 ?auto_169285 ) ) ( not ( = ?auto_169278 ?auto_169285 ) ) ( not ( = ?auto_169279 ?auto_169285 ) ) ( not ( = ?auto_169280 ?auto_169285 ) ) ( not ( = ?auto_169281 ?auto_169285 ) ) ( not ( = ?auto_169282 ?auto_169285 ) ) ( not ( = ?auto_169283 ?auto_169285 ) ) ( not ( = ?auto_169284 ?auto_169285 ) ) ( CLEAR ?auto_169279 ) ( ON ?auto_169278 ?auto_169277 ) ( CLEAR ?auto_169278 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169285 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169285 ?auto_169277 )
      ( MAKE-8PILE ?auto_169277 ?auto_169278 ?auto_169279 ?auto_169280 ?auto_169281 ?auto_169282 ?auto_169283 ?auto_169284 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_169286 - BLOCK
      ?auto_169287 - BLOCK
      ?auto_169288 - BLOCK
      ?auto_169289 - BLOCK
      ?auto_169290 - BLOCK
      ?auto_169291 - BLOCK
      ?auto_169292 - BLOCK
      ?auto_169293 - BLOCK
    )
    :vars
    (
      ?auto_169294 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169286 ?auto_169287 ) ) ( not ( = ?auto_169286 ?auto_169288 ) ) ( not ( = ?auto_169286 ?auto_169289 ) ) ( not ( = ?auto_169286 ?auto_169290 ) ) ( not ( = ?auto_169286 ?auto_169291 ) ) ( not ( = ?auto_169286 ?auto_169292 ) ) ( not ( = ?auto_169286 ?auto_169293 ) ) ( not ( = ?auto_169287 ?auto_169288 ) ) ( not ( = ?auto_169287 ?auto_169289 ) ) ( not ( = ?auto_169287 ?auto_169290 ) ) ( not ( = ?auto_169287 ?auto_169291 ) ) ( not ( = ?auto_169287 ?auto_169292 ) ) ( not ( = ?auto_169287 ?auto_169293 ) ) ( not ( = ?auto_169288 ?auto_169289 ) ) ( not ( = ?auto_169288 ?auto_169290 ) ) ( not ( = ?auto_169288 ?auto_169291 ) ) ( not ( = ?auto_169288 ?auto_169292 ) ) ( not ( = ?auto_169288 ?auto_169293 ) ) ( not ( = ?auto_169289 ?auto_169290 ) ) ( not ( = ?auto_169289 ?auto_169291 ) ) ( not ( = ?auto_169289 ?auto_169292 ) ) ( not ( = ?auto_169289 ?auto_169293 ) ) ( not ( = ?auto_169290 ?auto_169291 ) ) ( not ( = ?auto_169290 ?auto_169292 ) ) ( not ( = ?auto_169290 ?auto_169293 ) ) ( not ( = ?auto_169291 ?auto_169292 ) ) ( not ( = ?auto_169291 ?auto_169293 ) ) ( not ( = ?auto_169292 ?auto_169293 ) ) ( ON-TABLE ?auto_169293 ) ( ON ?auto_169292 ?auto_169293 ) ( ON ?auto_169291 ?auto_169292 ) ( ON ?auto_169290 ?auto_169291 ) ( ON ?auto_169289 ?auto_169290 ) ( ON ?auto_169286 ?auto_169294 ) ( not ( = ?auto_169286 ?auto_169294 ) ) ( not ( = ?auto_169287 ?auto_169294 ) ) ( not ( = ?auto_169288 ?auto_169294 ) ) ( not ( = ?auto_169289 ?auto_169294 ) ) ( not ( = ?auto_169290 ?auto_169294 ) ) ( not ( = ?auto_169291 ?auto_169294 ) ) ( not ( = ?auto_169292 ?auto_169294 ) ) ( not ( = ?auto_169293 ?auto_169294 ) ) ( ON ?auto_169287 ?auto_169286 ) ( CLEAR ?auto_169287 ) ( ON-TABLE ?auto_169294 ) ( HOLDING ?auto_169288 ) ( CLEAR ?auto_169289 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_169293 ?auto_169292 ?auto_169291 ?auto_169290 ?auto_169289 ?auto_169288 )
      ( MAKE-8PILE ?auto_169286 ?auto_169287 ?auto_169288 ?auto_169289 ?auto_169290 ?auto_169291 ?auto_169292 ?auto_169293 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_169295 - BLOCK
      ?auto_169296 - BLOCK
      ?auto_169297 - BLOCK
      ?auto_169298 - BLOCK
      ?auto_169299 - BLOCK
      ?auto_169300 - BLOCK
      ?auto_169301 - BLOCK
      ?auto_169302 - BLOCK
    )
    :vars
    (
      ?auto_169303 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169295 ?auto_169296 ) ) ( not ( = ?auto_169295 ?auto_169297 ) ) ( not ( = ?auto_169295 ?auto_169298 ) ) ( not ( = ?auto_169295 ?auto_169299 ) ) ( not ( = ?auto_169295 ?auto_169300 ) ) ( not ( = ?auto_169295 ?auto_169301 ) ) ( not ( = ?auto_169295 ?auto_169302 ) ) ( not ( = ?auto_169296 ?auto_169297 ) ) ( not ( = ?auto_169296 ?auto_169298 ) ) ( not ( = ?auto_169296 ?auto_169299 ) ) ( not ( = ?auto_169296 ?auto_169300 ) ) ( not ( = ?auto_169296 ?auto_169301 ) ) ( not ( = ?auto_169296 ?auto_169302 ) ) ( not ( = ?auto_169297 ?auto_169298 ) ) ( not ( = ?auto_169297 ?auto_169299 ) ) ( not ( = ?auto_169297 ?auto_169300 ) ) ( not ( = ?auto_169297 ?auto_169301 ) ) ( not ( = ?auto_169297 ?auto_169302 ) ) ( not ( = ?auto_169298 ?auto_169299 ) ) ( not ( = ?auto_169298 ?auto_169300 ) ) ( not ( = ?auto_169298 ?auto_169301 ) ) ( not ( = ?auto_169298 ?auto_169302 ) ) ( not ( = ?auto_169299 ?auto_169300 ) ) ( not ( = ?auto_169299 ?auto_169301 ) ) ( not ( = ?auto_169299 ?auto_169302 ) ) ( not ( = ?auto_169300 ?auto_169301 ) ) ( not ( = ?auto_169300 ?auto_169302 ) ) ( not ( = ?auto_169301 ?auto_169302 ) ) ( ON-TABLE ?auto_169302 ) ( ON ?auto_169301 ?auto_169302 ) ( ON ?auto_169300 ?auto_169301 ) ( ON ?auto_169299 ?auto_169300 ) ( ON ?auto_169298 ?auto_169299 ) ( ON ?auto_169295 ?auto_169303 ) ( not ( = ?auto_169295 ?auto_169303 ) ) ( not ( = ?auto_169296 ?auto_169303 ) ) ( not ( = ?auto_169297 ?auto_169303 ) ) ( not ( = ?auto_169298 ?auto_169303 ) ) ( not ( = ?auto_169299 ?auto_169303 ) ) ( not ( = ?auto_169300 ?auto_169303 ) ) ( not ( = ?auto_169301 ?auto_169303 ) ) ( not ( = ?auto_169302 ?auto_169303 ) ) ( ON ?auto_169296 ?auto_169295 ) ( ON-TABLE ?auto_169303 ) ( CLEAR ?auto_169298 ) ( ON ?auto_169297 ?auto_169296 ) ( CLEAR ?auto_169297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169303 ?auto_169295 ?auto_169296 )
      ( MAKE-8PILE ?auto_169295 ?auto_169296 ?auto_169297 ?auto_169298 ?auto_169299 ?auto_169300 ?auto_169301 ?auto_169302 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_169304 - BLOCK
      ?auto_169305 - BLOCK
      ?auto_169306 - BLOCK
      ?auto_169307 - BLOCK
      ?auto_169308 - BLOCK
      ?auto_169309 - BLOCK
      ?auto_169310 - BLOCK
      ?auto_169311 - BLOCK
    )
    :vars
    (
      ?auto_169312 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169304 ?auto_169305 ) ) ( not ( = ?auto_169304 ?auto_169306 ) ) ( not ( = ?auto_169304 ?auto_169307 ) ) ( not ( = ?auto_169304 ?auto_169308 ) ) ( not ( = ?auto_169304 ?auto_169309 ) ) ( not ( = ?auto_169304 ?auto_169310 ) ) ( not ( = ?auto_169304 ?auto_169311 ) ) ( not ( = ?auto_169305 ?auto_169306 ) ) ( not ( = ?auto_169305 ?auto_169307 ) ) ( not ( = ?auto_169305 ?auto_169308 ) ) ( not ( = ?auto_169305 ?auto_169309 ) ) ( not ( = ?auto_169305 ?auto_169310 ) ) ( not ( = ?auto_169305 ?auto_169311 ) ) ( not ( = ?auto_169306 ?auto_169307 ) ) ( not ( = ?auto_169306 ?auto_169308 ) ) ( not ( = ?auto_169306 ?auto_169309 ) ) ( not ( = ?auto_169306 ?auto_169310 ) ) ( not ( = ?auto_169306 ?auto_169311 ) ) ( not ( = ?auto_169307 ?auto_169308 ) ) ( not ( = ?auto_169307 ?auto_169309 ) ) ( not ( = ?auto_169307 ?auto_169310 ) ) ( not ( = ?auto_169307 ?auto_169311 ) ) ( not ( = ?auto_169308 ?auto_169309 ) ) ( not ( = ?auto_169308 ?auto_169310 ) ) ( not ( = ?auto_169308 ?auto_169311 ) ) ( not ( = ?auto_169309 ?auto_169310 ) ) ( not ( = ?auto_169309 ?auto_169311 ) ) ( not ( = ?auto_169310 ?auto_169311 ) ) ( ON-TABLE ?auto_169311 ) ( ON ?auto_169310 ?auto_169311 ) ( ON ?auto_169309 ?auto_169310 ) ( ON ?auto_169308 ?auto_169309 ) ( ON ?auto_169304 ?auto_169312 ) ( not ( = ?auto_169304 ?auto_169312 ) ) ( not ( = ?auto_169305 ?auto_169312 ) ) ( not ( = ?auto_169306 ?auto_169312 ) ) ( not ( = ?auto_169307 ?auto_169312 ) ) ( not ( = ?auto_169308 ?auto_169312 ) ) ( not ( = ?auto_169309 ?auto_169312 ) ) ( not ( = ?auto_169310 ?auto_169312 ) ) ( not ( = ?auto_169311 ?auto_169312 ) ) ( ON ?auto_169305 ?auto_169304 ) ( ON-TABLE ?auto_169312 ) ( ON ?auto_169306 ?auto_169305 ) ( CLEAR ?auto_169306 ) ( HOLDING ?auto_169307 ) ( CLEAR ?auto_169308 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_169311 ?auto_169310 ?auto_169309 ?auto_169308 ?auto_169307 )
      ( MAKE-8PILE ?auto_169304 ?auto_169305 ?auto_169306 ?auto_169307 ?auto_169308 ?auto_169309 ?auto_169310 ?auto_169311 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_169313 - BLOCK
      ?auto_169314 - BLOCK
      ?auto_169315 - BLOCK
      ?auto_169316 - BLOCK
      ?auto_169317 - BLOCK
      ?auto_169318 - BLOCK
      ?auto_169319 - BLOCK
      ?auto_169320 - BLOCK
    )
    :vars
    (
      ?auto_169321 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169313 ?auto_169314 ) ) ( not ( = ?auto_169313 ?auto_169315 ) ) ( not ( = ?auto_169313 ?auto_169316 ) ) ( not ( = ?auto_169313 ?auto_169317 ) ) ( not ( = ?auto_169313 ?auto_169318 ) ) ( not ( = ?auto_169313 ?auto_169319 ) ) ( not ( = ?auto_169313 ?auto_169320 ) ) ( not ( = ?auto_169314 ?auto_169315 ) ) ( not ( = ?auto_169314 ?auto_169316 ) ) ( not ( = ?auto_169314 ?auto_169317 ) ) ( not ( = ?auto_169314 ?auto_169318 ) ) ( not ( = ?auto_169314 ?auto_169319 ) ) ( not ( = ?auto_169314 ?auto_169320 ) ) ( not ( = ?auto_169315 ?auto_169316 ) ) ( not ( = ?auto_169315 ?auto_169317 ) ) ( not ( = ?auto_169315 ?auto_169318 ) ) ( not ( = ?auto_169315 ?auto_169319 ) ) ( not ( = ?auto_169315 ?auto_169320 ) ) ( not ( = ?auto_169316 ?auto_169317 ) ) ( not ( = ?auto_169316 ?auto_169318 ) ) ( not ( = ?auto_169316 ?auto_169319 ) ) ( not ( = ?auto_169316 ?auto_169320 ) ) ( not ( = ?auto_169317 ?auto_169318 ) ) ( not ( = ?auto_169317 ?auto_169319 ) ) ( not ( = ?auto_169317 ?auto_169320 ) ) ( not ( = ?auto_169318 ?auto_169319 ) ) ( not ( = ?auto_169318 ?auto_169320 ) ) ( not ( = ?auto_169319 ?auto_169320 ) ) ( ON-TABLE ?auto_169320 ) ( ON ?auto_169319 ?auto_169320 ) ( ON ?auto_169318 ?auto_169319 ) ( ON ?auto_169317 ?auto_169318 ) ( ON ?auto_169313 ?auto_169321 ) ( not ( = ?auto_169313 ?auto_169321 ) ) ( not ( = ?auto_169314 ?auto_169321 ) ) ( not ( = ?auto_169315 ?auto_169321 ) ) ( not ( = ?auto_169316 ?auto_169321 ) ) ( not ( = ?auto_169317 ?auto_169321 ) ) ( not ( = ?auto_169318 ?auto_169321 ) ) ( not ( = ?auto_169319 ?auto_169321 ) ) ( not ( = ?auto_169320 ?auto_169321 ) ) ( ON ?auto_169314 ?auto_169313 ) ( ON-TABLE ?auto_169321 ) ( ON ?auto_169315 ?auto_169314 ) ( CLEAR ?auto_169317 ) ( ON ?auto_169316 ?auto_169315 ) ( CLEAR ?auto_169316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169321 ?auto_169313 ?auto_169314 ?auto_169315 )
      ( MAKE-8PILE ?auto_169313 ?auto_169314 ?auto_169315 ?auto_169316 ?auto_169317 ?auto_169318 ?auto_169319 ?auto_169320 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_169322 - BLOCK
      ?auto_169323 - BLOCK
      ?auto_169324 - BLOCK
      ?auto_169325 - BLOCK
      ?auto_169326 - BLOCK
      ?auto_169327 - BLOCK
      ?auto_169328 - BLOCK
      ?auto_169329 - BLOCK
    )
    :vars
    (
      ?auto_169330 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169322 ?auto_169323 ) ) ( not ( = ?auto_169322 ?auto_169324 ) ) ( not ( = ?auto_169322 ?auto_169325 ) ) ( not ( = ?auto_169322 ?auto_169326 ) ) ( not ( = ?auto_169322 ?auto_169327 ) ) ( not ( = ?auto_169322 ?auto_169328 ) ) ( not ( = ?auto_169322 ?auto_169329 ) ) ( not ( = ?auto_169323 ?auto_169324 ) ) ( not ( = ?auto_169323 ?auto_169325 ) ) ( not ( = ?auto_169323 ?auto_169326 ) ) ( not ( = ?auto_169323 ?auto_169327 ) ) ( not ( = ?auto_169323 ?auto_169328 ) ) ( not ( = ?auto_169323 ?auto_169329 ) ) ( not ( = ?auto_169324 ?auto_169325 ) ) ( not ( = ?auto_169324 ?auto_169326 ) ) ( not ( = ?auto_169324 ?auto_169327 ) ) ( not ( = ?auto_169324 ?auto_169328 ) ) ( not ( = ?auto_169324 ?auto_169329 ) ) ( not ( = ?auto_169325 ?auto_169326 ) ) ( not ( = ?auto_169325 ?auto_169327 ) ) ( not ( = ?auto_169325 ?auto_169328 ) ) ( not ( = ?auto_169325 ?auto_169329 ) ) ( not ( = ?auto_169326 ?auto_169327 ) ) ( not ( = ?auto_169326 ?auto_169328 ) ) ( not ( = ?auto_169326 ?auto_169329 ) ) ( not ( = ?auto_169327 ?auto_169328 ) ) ( not ( = ?auto_169327 ?auto_169329 ) ) ( not ( = ?auto_169328 ?auto_169329 ) ) ( ON-TABLE ?auto_169329 ) ( ON ?auto_169328 ?auto_169329 ) ( ON ?auto_169327 ?auto_169328 ) ( ON ?auto_169322 ?auto_169330 ) ( not ( = ?auto_169322 ?auto_169330 ) ) ( not ( = ?auto_169323 ?auto_169330 ) ) ( not ( = ?auto_169324 ?auto_169330 ) ) ( not ( = ?auto_169325 ?auto_169330 ) ) ( not ( = ?auto_169326 ?auto_169330 ) ) ( not ( = ?auto_169327 ?auto_169330 ) ) ( not ( = ?auto_169328 ?auto_169330 ) ) ( not ( = ?auto_169329 ?auto_169330 ) ) ( ON ?auto_169323 ?auto_169322 ) ( ON-TABLE ?auto_169330 ) ( ON ?auto_169324 ?auto_169323 ) ( ON ?auto_169325 ?auto_169324 ) ( CLEAR ?auto_169325 ) ( HOLDING ?auto_169326 ) ( CLEAR ?auto_169327 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169329 ?auto_169328 ?auto_169327 ?auto_169326 )
      ( MAKE-8PILE ?auto_169322 ?auto_169323 ?auto_169324 ?auto_169325 ?auto_169326 ?auto_169327 ?auto_169328 ?auto_169329 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_169331 - BLOCK
      ?auto_169332 - BLOCK
      ?auto_169333 - BLOCK
      ?auto_169334 - BLOCK
      ?auto_169335 - BLOCK
      ?auto_169336 - BLOCK
      ?auto_169337 - BLOCK
      ?auto_169338 - BLOCK
    )
    :vars
    (
      ?auto_169339 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169331 ?auto_169332 ) ) ( not ( = ?auto_169331 ?auto_169333 ) ) ( not ( = ?auto_169331 ?auto_169334 ) ) ( not ( = ?auto_169331 ?auto_169335 ) ) ( not ( = ?auto_169331 ?auto_169336 ) ) ( not ( = ?auto_169331 ?auto_169337 ) ) ( not ( = ?auto_169331 ?auto_169338 ) ) ( not ( = ?auto_169332 ?auto_169333 ) ) ( not ( = ?auto_169332 ?auto_169334 ) ) ( not ( = ?auto_169332 ?auto_169335 ) ) ( not ( = ?auto_169332 ?auto_169336 ) ) ( not ( = ?auto_169332 ?auto_169337 ) ) ( not ( = ?auto_169332 ?auto_169338 ) ) ( not ( = ?auto_169333 ?auto_169334 ) ) ( not ( = ?auto_169333 ?auto_169335 ) ) ( not ( = ?auto_169333 ?auto_169336 ) ) ( not ( = ?auto_169333 ?auto_169337 ) ) ( not ( = ?auto_169333 ?auto_169338 ) ) ( not ( = ?auto_169334 ?auto_169335 ) ) ( not ( = ?auto_169334 ?auto_169336 ) ) ( not ( = ?auto_169334 ?auto_169337 ) ) ( not ( = ?auto_169334 ?auto_169338 ) ) ( not ( = ?auto_169335 ?auto_169336 ) ) ( not ( = ?auto_169335 ?auto_169337 ) ) ( not ( = ?auto_169335 ?auto_169338 ) ) ( not ( = ?auto_169336 ?auto_169337 ) ) ( not ( = ?auto_169336 ?auto_169338 ) ) ( not ( = ?auto_169337 ?auto_169338 ) ) ( ON-TABLE ?auto_169338 ) ( ON ?auto_169337 ?auto_169338 ) ( ON ?auto_169336 ?auto_169337 ) ( ON ?auto_169331 ?auto_169339 ) ( not ( = ?auto_169331 ?auto_169339 ) ) ( not ( = ?auto_169332 ?auto_169339 ) ) ( not ( = ?auto_169333 ?auto_169339 ) ) ( not ( = ?auto_169334 ?auto_169339 ) ) ( not ( = ?auto_169335 ?auto_169339 ) ) ( not ( = ?auto_169336 ?auto_169339 ) ) ( not ( = ?auto_169337 ?auto_169339 ) ) ( not ( = ?auto_169338 ?auto_169339 ) ) ( ON ?auto_169332 ?auto_169331 ) ( ON-TABLE ?auto_169339 ) ( ON ?auto_169333 ?auto_169332 ) ( ON ?auto_169334 ?auto_169333 ) ( CLEAR ?auto_169336 ) ( ON ?auto_169335 ?auto_169334 ) ( CLEAR ?auto_169335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_169339 ?auto_169331 ?auto_169332 ?auto_169333 ?auto_169334 )
      ( MAKE-8PILE ?auto_169331 ?auto_169332 ?auto_169333 ?auto_169334 ?auto_169335 ?auto_169336 ?auto_169337 ?auto_169338 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_169340 - BLOCK
      ?auto_169341 - BLOCK
      ?auto_169342 - BLOCK
      ?auto_169343 - BLOCK
      ?auto_169344 - BLOCK
      ?auto_169345 - BLOCK
      ?auto_169346 - BLOCK
      ?auto_169347 - BLOCK
    )
    :vars
    (
      ?auto_169348 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169340 ?auto_169341 ) ) ( not ( = ?auto_169340 ?auto_169342 ) ) ( not ( = ?auto_169340 ?auto_169343 ) ) ( not ( = ?auto_169340 ?auto_169344 ) ) ( not ( = ?auto_169340 ?auto_169345 ) ) ( not ( = ?auto_169340 ?auto_169346 ) ) ( not ( = ?auto_169340 ?auto_169347 ) ) ( not ( = ?auto_169341 ?auto_169342 ) ) ( not ( = ?auto_169341 ?auto_169343 ) ) ( not ( = ?auto_169341 ?auto_169344 ) ) ( not ( = ?auto_169341 ?auto_169345 ) ) ( not ( = ?auto_169341 ?auto_169346 ) ) ( not ( = ?auto_169341 ?auto_169347 ) ) ( not ( = ?auto_169342 ?auto_169343 ) ) ( not ( = ?auto_169342 ?auto_169344 ) ) ( not ( = ?auto_169342 ?auto_169345 ) ) ( not ( = ?auto_169342 ?auto_169346 ) ) ( not ( = ?auto_169342 ?auto_169347 ) ) ( not ( = ?auto_169343 ?auto_169344 ) ) ( not ( = ?auto_169343 ?auto_169345 ) ) ( not ( = ?auto_169343 ?auto_169346 ) ) ( not ( = ?auto_169343 ?auto_169347 ) ) ( not ( = ?auto_169344 ?auto_169345 ) ) ( not ( = ?auto_169344 ?auto_169346 ) ) ( not ( = ?auto_169344 ?auto_169347 ) ) ( not ( = ?auto_169345 ?auto_169346 ) ) ( not ( = ?auto_169345 ?auto_169347 ) ) ( not ( = ?auto_169346 ?auto_169347 ) ) ( ON-TABLE ?auto_169347 ) ( ON ?auto_169346 ?auto_169347 ) ( ON ?auto_169340 ?auto_169348 ) ( not ( = ?auto_169340 ?auto_169348 ) ) ( not ( = ?auto_169341 ?auto_169348 ) ) ( not ( = ?auto_169342 ?auto_169348 ) ) ( not ( = ?auto_169343 ?auto_169348 ) ) ( not ( = ?auto_169344 ?auto_169348 ) ) ( not ( = ?auto_169345 ?auto_169348 ) ) ( not ( = ?auto_169346 ?auto_169348 ) ) ( not ( = ?auto_169347 ?auto_169348 ) ) ( ON ?auto_169341 ?auto_169340 ) ( ON-TABLE ?auto_169348 ) ( ON ?auto_169342 ?auto_169341 ) ( ON ?auto_169343 ?auto_169342 ) ( ON ?auto_169344 ?auto_169343 ) ( CLEAR ?auto_169344 ) ( HOLDING ?auto_169345 ) ( CLEAR ?auto_169346 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169347 ?auto_169346 ?auto_169345 )
      ( MAKE-8PILE ?auto_169340 ?auto_169341 ?auto_169342 ?auto_169343 ?auto_169344 ?auto_169345 ?auto_169346 ?auto_169347 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_169349 - BLOCK
      ?auto_169350 - BLOCK
      ?auto_169351 - BLOCK
      ?auto_169352 - BLOCK
      ?auto_169353 - BLOCK
      ?auto_169354 - BLOCK
      ?auto_169355 - BLOCK
      ?auto_169356 - BLOCK
    )
    :vars
    (
      ?auto_169357 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169349 ?auto_169350 ) ) ( not ( = ?auto_169349 ?auto_169351 ) ) ( not ( = ?auto_169349 ?auto_169352 ) ) ( not ( = ?auto_169349 ?auto_169353 ) ) ( not ( = ?auto_169349 ?auto_169354 ) ) ( not ( = ?auto_169349 ?auto_169355 ) ) ( not ( = ?auto_169349 ?auto_169356 ) ) ( not ( = ?auto_169350 ?auto_169351 ) ) ( not ( = ?auto_169350 ?auto_169352 ) ) ( not ( = ?auto_169350 ?auto_169353 ) ) ( not ( = ?auto_169350 ?auto_169354 ) ) ( not ( = ?auto_169350 ?auto_169355 ) ) ( not ( = ?auto_169350 ?auto_169356 ) ) ( not ( = ?auto_169351 ?auto_169352 ) ) ( not ( = ?auto_169351 ?auto_169353 ) ) ( not ( = ?auto_169351 ?auto_169354 ) ) ( not ( = ?auto_169351 ?auto_169355 ) ) ( not ( = ?auto_169351 ?auto_169356 ) ) ( not ( = ?auto_169352 ?auto_169353 ) ) ( not ( = ?auto_169352 ?auto_169354 ) ) ( not ( = ?auto_169352 ?auto_169355 ) ) ( not ( = ?auto_169352 ?auto_169356 ) ) ( not ( = ?auto_169353 ?auto_169354 ) ) ( not ( = ?auto_169353 ?auto_169355 ) ) ( not ( = ?auto_169353 ?auto_169356 ) ) ( not ( = ?auto_169354 ?auto_169355 ) ) ( not ( = ?auto_169354 ?auto_169356 ) ) ( not ( = ?auto_169355 ?auto_169356 ) ) ( ON-TABLE ?auto_169356 ) ( ON ?auto_169355 ?auto_169356 ) ( ON ?auto_169349 ?auto_169357 ) ( not ( = ?auto_169349 ?auto_169357 ) ) ( not ( = ?auto_169350 ?auto_169357 ) ) ( not ( = ?auto_169351 ?auto_169357 ) ) ( not ( = ?auto_169352 ?auto_169357 ) ) ( not ( = ?auto_169353 ?auto_169357 ) ) ( not ( = ?auto_169354 ?auto_169357 ) ) ( not ( = ?auto_169355 ?auto_169357 ) ) ( not ( = ?auto_169356 ?auto_169357 ) ) ( ON ?auto_169350 ?auto_169349 ) ( ON-TABLE ?auto_169357 ) ( ON ?auto_169351 ?auto_169350 ) ( ON ?auto_169352 ?auto_169351 ) ( ON ?auto_169353 ?auto_169352 ) ( CLEAR ?auto_169355 ) ( ON ?auto_169354 ?auto_169353 ) ( CLEAR ?auto_169354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_169357 ?auto_169349 ?auto_169350 ?auto_169351 ?auto_169352 ?auto_169353 )
      ( MAKE-8PILE ?auto_169349 ?auto_169350 ?auto_169351 ?auto_169352 ?auto_169353 ?auto_169354 ?auto_169355 ?auto_169356 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_169358 - BLOCK
      ?auto_169359 - BLOCK
      ?auto_169360 - BLOCK
      ?auto_169361 - BLOCK
      ?auto_169362 - BLOCK
      ?auto_169363 - BLOCK
      ?auto_169364 - BLOCK
      ?auto_169365 - BLOCK
    )
    :vars
    (
      ?auto_169366 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169358 ?auto_169359 ) ) ( not ( = ?auto_169358 ?auto_169360 ) ) ( not ( = ?auto_169358 ?auto_169361 ) ) ( not ( = ?auto_169358 ?auto_169362 ) ) ( not ( = ?auto_169358 ?auto_169363 ) ) ( not ( = ?auto_169358 ?auto_169364 ) ) ( not ( = ?auto_169358 ?auto_169365 ) ) ( not ( = ?auto_169359 ?auto_169360 ) ) ( not ( = ?auto_169359 ?auto_169361 ) ) ( not ( = ?auto_169359 ?auto_169362 ) ) ( not ( = ?auto_169359 ?auto_169363 ) ) ( not ( = ?auto_169359 ?auto_169364 ) ) ( not ( = ?auto_169359 ?auto_169365 ) ) ( not ( = ?auto_169360 ?auto_169361 ) ) ( not ( = ?auto_169360 ?auto_169362 ) ) ( not ( = ?auto_169360 ?auto_169363 ) ) ( not ( = ?auto_169360 ?auto_169364 ) ) ( not ( = ?auto_169360 ?auto_169365 ) ) ( not ( = ?auto_169361 ?auto_169362 ) ) ( not ( = ?auto_169361 ?auto_169363 ) ) ( not ( = ?auto_169361 ?auto_169364 ) ) ( not ( = ?auto_169361 ?auto_169365 ) ) ( not ( = ?auto_169362 ?auto_169363 ) ) ( not ( = ?auto_169362 ?auto_169364 ) ) ( not ( = ?auto_169362 ?auto_169365 ) ) ( not ( = ?auto_169363 ?auto_169364 ) ) ( not ( = ?auto_169363 ?auto_169365 ) ) ( not ( = ?auto_169364 ?auto_169365 ) ) ( ON-TABLE ?auto_169365 ) ( ON ?auto_169358 ?auto_169366 ) ( not ( = ?auto_169358 ?auto_169366 ) ) ( not ( = ?auto_169359 ?auto_169366 ) ) ( not ( = ?auto_169360 ?auto_169366 ) ) ( not ( = ?auto_169361 ?auto_169366 ) ) ( not ( = ?auto_169362 ?auto_169366 ) ) ( not ( = ?auto_169363 ?auto_169366 ) ) ( not ( = ?auto_169364 ?auto_169366 ) ) ( not ( = ?auto_169365 ?auto_169366 ) ) ( ON ?auto_169359 ?auto_169358 ) ( ON-TABLE ?auto_169366 ) ( ON ?auto_169360 ?auto_169359 ) ( ON ?auto_169361 ?auto_169360 ) ( ON ?auto_169362 ?auto_169361 ) ( ON ?auto_169363 ?auto_169362 ) ( CLEAR ?auto_169363 ) ( HOLDING ?auto_169364 ) ( CLEAR ?auto_169365 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169365 ?auto_169364 )
      ( MAKE-8PILE ?auto_169358 ?auto_169359 ?auto_169360 ?auto_169361 ?auto_169362 ?auto_169363 ?auto_169364 ?auto_169365 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_169367 - BLOCK
      ?auto_169368 - BLOCK
      ?auto_169369 - BLOCK
      ?auto_169370 - BLOCK
      ?auto_169371 - BLOCK
      ?auto_169372 - BLOCK
      ?auto_169373 - BLOCK
      ?auto_169374 - BLOCK
    )
    :vars
    (
      ?auto_169375 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169367 ?auto_169368 ) ) ( not ( = ?auto_169367 ?auto_169369 ) ) ( not ( = ?auto_169367 ?auto_169370 ) ) ( not ( = ?auto_169367 ?auto_169371 ) ) ( not ( = ?auto_169367 ?auto_169372 ) ) ( not ( = ?auto_169367 ?auto_169373 ) ) ( not ( = ?auto_169367 ?auto_169374 ) ) ( not ( = ?auto_169368 ?auto_169369 ) ) ( not ( = ?auto_169368 ?auto_169370 ) ) ( not ( = ?auto_169368 ?auto_169371 ) ) ( not ( = ?auto_169368 ?auto_169372 ) ) ( not ( = ?auto_169368 ?auto_169373 ) ) ( not ( = ?auto_169368 ?auto_169374 ) ) ( not ( = ?auto_169369 ?auto_169370 ) ) ( not ( = ?auto_169369 ?auto_169371 ) ) ( not ( = ?auto_169369 ?auto_169372 ) ) ( not ( = ?auto_169369 ?auto_169373 ) ) ( not ( = ?auto_169369 ?auto_169374 ) ) ( not ( = ?auto_169370 ?auto_169371 ) ) ( not ( = ?auto_169370 ?auto_169372 ) ) ( not ( = ?auto_169370 ?auto_169373 ) ) ( not ( = ?auto_169370 ?auto_169374 ) ) ( not ( = ?auto_169371 ?auto_169372 ) ) ( not ( = ?auto_169371 ?auto_169373 ) ) ( not ( = ?auto_169371 ?auto_169374 ) ) ( not ( = ?auto_169372 ?auto_169373 ) ) ( not ( = ?auto_169372 ?auto_169374 ) ) ( not ( = ?auto_169373 ?auto_169374 ) ) ( ON-TABLE ?auto_169374 ) ( ON ?auto_169367 ?auto_169375 ) ( not ( = ?auto_169367 ?auto_169375 ) ) ( not ( = ?auto_169368 ?auto_169375 ) ) ( not ( = ?auto_169369 ?auto_169375 ) ) ( not ( = ?auto_169370 ?auto_169375 ) ) ( not ( = ?auto_169371 ?auto_169375 ) ) ( not ( = ?auto_169372 ?auto_169375 ) ) ( not ( = ?auto_169373 ?auto_169375 ) ) ( not ( = ?auto_169374 ?auto_169375 ) ) ( ON ?auto_169368 ?auto_169367 ) ( ON-TABLE ?auto_169375 ) ( ON ?auto_169369 ?auto_169368 ) ( ON ?auto_169370 ?auto_169369 ) ( ON ?auto_169371 ?auto_169370 ) ( ON ?auto_169372 ?auto_169371 ) ( CLEAR ?auto_169374 ) ( ON ?auto_169373 ?auto_169372 ) ( CLEAR ?auto_169373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_169375 ?auto_169367 ?auto_169368 ?auto_169369 ?auto_169370 ?auto_169371 ?auto_169372 )
      ( MAKE-8PILE ?auto_169367 ?auto_169368 ?auto_169369 ?auto_169370 ?auto_169371 ?auto_169372 ?auto_169373 ?auto_169374 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_169376 - BLOCK
      ?auto_169377 - BLOCK
      ?auto_169378 - BLOCK
      ?auto_169379 - BLOCK
      ?auto_169380 - BLOCK
      ?auto_169381 - BLOCK
      ?auto_169382 - BLOCK
      ?auto_169383 - BLOCK
    )
    :vars
    (
      ?auto_169384 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169376 ?auto_169377 ) ) ( not ( = ?auto_169376 ?auto_169378 ) ) ( not ( = ?auto_169376 ?auto_169379 ) ) ( not ( = ?auto_169376 ?auto_169380 ) ) ( not ( = ?auto_169376 ?auto_169381 ) ) ( not ( = ?auto_169376 ?auto_169382 ) ) ( not ( = ?auto_169376 ?auto_169383 ) ) ( not ( = ?auto_169377 ?auto_169378 ) ) ( not ( = ?auto_169377 ?auto_169379 ) ) ( not ( = ?auto_169377 ?auto_169380 ) ) ( not ( = ?auto_169377 ?auto_169381 ) ) ( not ( = ?auto_169377 ?auto_169382 ) ) ( not ( = ?auto_169377 ?auto_169383 ) ) ( not ( = ?auto_169378 ?auto_169379 ) ) ( not ( = ?auto_169378 ?auto_169380 ) ) ( not ( = ?auto_169378 ?auto_169381 ) ) ( not ( = ?auto_169378 ?auto_169382 ) ) ( not ( = ?auto_169378 ?auto_169383 ) ) ( not ( = ?auto_169379 ?auto_169380 ) ) ( not ( = ?auto_169379 ?auto_169381 ) ) ( not ( = ?auto_169379 ?auto_169382 ) ) ( not ( = ?auto_169379 ?auto_169383 ) ) ( not ( = ?auto_169380 ?auto_169381 ) ) ( not ( = ?auto_169380 ?auto_169382 ) ) ( not ( = ?auto_169380 ?auto_169383 ) ) ( not ( = ?auto_169381 ?auto_169382 ) ) ( not ( = ?auto_169381 ?auto_169383 ) ) ( not ( = ?auto_169382 ?auto_169383 ) ) ( ON ?auto_169376 ?auto_169384 ) ( not ( = ?auto_169376 ?auto_169384 ) ) ( not ( = ?auto_169377 ?auto_169384 ) ) ( not ( = ?auto_169378 ?auto_169384 ) ) ( not ( = ?auto_169379 ?auto_169384 ) ) ( not ( = ?auto_169380 ?auto_169384 ) ) ( not ( = ?auto_169381 ?auto_169384 ) ) ( not ( = ?auto_169382 ?auto_169384 ) ) ( not ( = ?auto_169383 ?auto_169384 ) ) ( ON ?auto_169377 ?auto_169376 ) ( ON-TABLE ?auto_169384 ) ( ON ?auto_169378 ?auto_169377 ) ( ON ?auto_169379 ?auto_169378 ) ( ON ?auto_169380 ?auto_169379 ) ( ON ?auto_169381 ?auto_169380 ) ( ON ?auto_169382 ?auto_169381 ) ( CLEAR ?auto_169382 ) ( HOLDING ?auto_169383 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169383 )
      ( MAKE-8PILE ?auto_169376 ?auto_169377 ?auto_169378 ?auto_169379 ?auto_169380 ?auto_169381 ?auto_169382 ?auto_169383 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_169385 - BLOCK
      ?auto_169386 - BLOCK
      ?auto_169387 - BLOCK
      ?auto_169388 - BLOCK
      ?auto_169389 - BLOCK
      ?auto_169390 - BLOCK
      ?auto_169391 - BLOCK
      ?auto_169392 - BLOCK
    )
    :vars
    (
      ?auto_169393 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169385 ?auto_169386 ) ) ( not ( = ?auto_169385 ?auto_169387 ) ) ( not ( = ?auto_169385 ?auto_169388 ) ) ( not ( = ?auto_169385 ?auto_169389 ) ) ( not ( = ?auto_169385 ?auto_169390 ) ) ( not ( = ?auto_169385 ?auto_169391 ) ) ( not ( = ?auto_169385 ?auto_169392 ) ) ( not ( = ?auto_169386 ?auto_169387 ) ) ( not ( = ?auto_169386 ?auto_169388 ) ) ( not ( = ?auto_169386 ?auto_169389 ) ) ( not ( = ?auto_169386 ?auto_169390 ) ) ( not ( = ?auto_169386 ?auto_169391 ) ) ( not ( = ?auto_169386 ?auto_169392 ) ) ( not ( = ?auto_169387 ?auto_169388 ) ) ( not ( = ?auto_169387 ?auto_169389 ) ) ( not ( = ?auto_169387 ?auto_169390 ) ) ( not ( = ?auto_169387 ?auto_169391 ) ) ( not ( = ?auto_169387 ?auto_169392 ) ) ( not ( = ?auto_169388 ?auto_169389 ) ) ( not ( = ?auto_169388 ?auto_169390 ) ) ( not ( = ?auto_169388 ?auto_169391 ) ) ( not ( = ?auto_169388 ?auto_169392 ) ) ( not ( = ?auto_169389 ?auto_169390 ) ) ( not ( = ?auto_169389 ?auto_169391 ) ) ( not ( = ?auto_169389 ?auto_169392 ) ) ( not ( = ?auto_169390 ?auto_169391 ) ) ( not ( = ?auto_169390 ?auto_169392 ) ) ( not ( = ?auto_169391 ?auto_169392 ) ) ( ON ?auto_169385 ?auto_169393 ) ( not ( = ?auto_169385 ?auto_169393 ) ) ( not ( = ?auto_169386 ?auto_169393 ) ) ( not ( = ?auto_169387 ?auto_169393 ) ) ( not ( = ?auto_169388 ?auto_169393 ) ) ( not ( = ?auto_169389 ?auto_169393 ) ) ( not ( = ?auto_169390 ?auto_169393 ) ) ( not ( = ?auto_169391 ?auto_169393 ) ) ( not ( = ?auto_169392 ?auto_169393 ) ) ( ON ?auto_169386 ?auto_169385 ) ( ON-TABLE ?auto_169393 ) ( ON ?auto_169387 ?auto_169386 ) ( ON ?auto_169388 ?auto_169387 ) ( ON ?auto_169389 ?auto_169388 ) ( ON ?auto_169390 ?auto_169389 ) ( ON ?auto_169391 ?auto_169390 ) ( ON ?auto_169392 ?auto_169391 ) ( CLEAR ?auto_169392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_169393 ?auto_169385 ?auto_169386 ?auto_169387 ?auto_169388 ?auto_169389 ?auto_169390 ?auto_169391 )
      ( MAKE-8PILE ?auto_169385 ?auto_169386 ?auto_169387 ?auto_169388 ?auto_169389 ?auto_169390 ?auto_169391 ?auto_169392 ) )
  )

)

