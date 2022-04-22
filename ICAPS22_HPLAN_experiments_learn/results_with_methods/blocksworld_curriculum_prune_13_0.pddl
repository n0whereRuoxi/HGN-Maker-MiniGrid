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
      ?auto_205481 - BLOCK
    )
    :vars
    (
      ?auto_205482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205481 ?auto_205482 ) ( CLEAR ?auto_205481 ) ( HAND-EMPTY ) ( not ( = ?auto_205481 ?auto_205482 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_205481 ?auto_205482 )
      ( !PUTDOWN ?auto_205481 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_205488 - BLOCK
      ?auto_205489 - BLOCK
    )
    :vars
    (
      ?auto_205490 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_205488 ) ( ON ?auto_205489 ?auto_205490 ) ( CLEAR ?auto_205489 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_205488 ) ( not ( = ?auto_205488 ?auto_205489 ) ) ( not ( = ?auto_205488 ?auto_205490 ) ) ( not ( = ?auto_205489 ?auto_205490 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_205489 ?auto_205490 )
      ( !STACK ?auto_205489 ?auto_205488 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_205498 - BLOCK
      ?auto_205499 - BLOCK
    )
    :vars
    (
      ?auto_205500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205499 ?auto_205500 ) ( not ( = ?auto_205498 ?auto_205499 ) ) ( not ( = ?auto_205498 ?auto_205500 ) ) ( not ( = ?auto_205499 ?auto_205500 ) ) ( ON ?auto_205498 ?auto_205499 ) ( CLEAR ?auto_205498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_205498 )
      ( MAKE-2PILE ?auto_205498 ?auto_205499 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_205509 - BLOCK
      ?auto_205510 - BLOCK
      ?auto_205511 - BLOCK
    )
    :vars
    (
      ?auto_205512 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_205510 ) ( ON ?auto_205511 ?auto_205512 ) ( CLEAR ?auto_205511 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_205509 ) ( ON ?auto_205510 ?auto_205509 ) ( not ( = ?auto_205509 ?auto_205510 ) ) ( not ( = ?auto_205509 ?auto_205511 ) ) ( not ( = ?auto_205509 ?auto_205512 ) ) ( not ( = ?auto_205510 ?auto_205511 ) ) ( not ( = ?auto_205510 ?auto_205512 ) ) ( not ( = ?auto_205511 ?auto_205512 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_205511 ?auto_205512 )
      ( !STACK ?auto_205511 ?auto_205510 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_205523 - BLOCK
      ?auto_205524 - BLOCK
      ?auto_205525 - BLOCK
    )
    :vars
    (
      ?auto_205526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205525 ?auto_205526 ) ( ON-TABLE ?auto_205523 ) ( not ( = ?auto_205523 ?auto_205524 ) ) ( not ( = ?auto_205523 ?auto_205525 ) ) ( not ( = ?auto_205523 ?auto_205526 ) ) ( not ( = ?auto_205524 ?auto_205525 ) ) ( not ( = ?auto_205524 ?auto_205526 ) ) ( not ( = ?auto_205525 ?auto_205526 ) ) ( CLEAR ?auto_205523 ) ( ON ?auto_205524 ?auto_205525 ) ( CLEAR ?auto_205524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_205523 ?auto_205524 )
      ( MAKE-3PILE ?auto_205523 ?auto_205524 ?auto_205525 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_205537 - BLOCK
      ?auto_205538 - BLOCK
      ?auto_205539 - BLOCK
    )
    :vars
    (
      ?auto_205540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205539 ?auto_205540 ) ( not ( = ?auto_205537 ?auto_205538 ) ) ( not ( = ?auto_205537 ?auto_205539 ) ) ( not ( = ?auto_205537 ?auto_205540 ) ) ( not ( = ?auto_205538 ?auto_205539 ) ) ( not ( = ?auto_205538 ?auto_205540 ) ) ( not ( = ?auto_205539 ?auto_205540 ) ) ( ON ?auto_205538 ?auto_205539 ) ( ON ?auto_205537 ?auto_205538 ) ( CLEAR ?auto_205537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_205537 )
      ( MAKE-3PILE ?auto_205537 ?auto_205538 ?auto_205539 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_205552 - BLOCK
      ?auto_205553 - BLOCK
      ?auto_205554 - BLOCK
      ?auto_205555 - BLOCK
    )
    :vars
    (
      ?auto_205556 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_205554 ) ( ON ?auto_205555 ?auto_205556 ) ( CLEAR ?auto_205555 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_205552 ) ( ON ?auto_205553 ?auto_205552 ) ( ON ?auto_205554 ?auto_205553 ) ( not ( = ?auto_205552 ?auto_205553 ) ) ( not ( = ?auto_205552 ?auto_205554 ) ) ( not ( = ?auto_205552 ?auto_205555 ) ) ( not ( = ?auto_205552 ?auto_205556 ) ) ( not ( = ?auto_205553 ?auto_205554 ) ) ( not ( = ?auto_205553 ?auto_205555 ) ) ( not ( = ?auto_205553 ?auto_205556 ) ) ( not ( = ?auto_205554 ?auto_205555 ) ) ( not ( = ?auto_205554 ?auto_205556 ) ) ( not ( = ?auto_205555 ?auto_205556 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_205555 ?auto_205556 )
      ( !STACK ?auto_205555 ?auto_205554 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_205570 - BLOCK
      ?auto_205571 - BLOCK
      ?auto_205572 - BLOCK
      ?auto_205573 - BLOCK
    )
    :vars
    (
      ?auto_205574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205573 ?auto_205574 ) ( ON-TABLE ?auto_205570 ) ( ON ?auto_205571 ?auto_205570 ) ( not ( = ?auto_205570 ?auto_205571 ) ) ( not ( = ?auto_205570 ?auto_205572 ) ) ( not ( = ?auto_205570 ?auto_205573 ) ) ( not ( = ?auto_205570 ?auto_205574 ) ) ( not ( = ?auto_205571 ?auto_205572 ) ) ( not ( = ?auto_205571 ?auto_205573 ) ) ( not ( = ?auto_205571 ?auto_205574 ) ) ( not ( = ?auto_205572 ?auto_205573 ) ) ( not ( = ?auto_205572 ?auto_205574 ) ) ( not ( = ?auto_205573 ?auto_205574 ) ) ( CLEAR ?auto_205571 ) ( ON ?auto_205572 ?auto_205573 ) ( CLEAR ?auto_205572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_205570 ?auto_205571 ?auto_205572 )
      ( MAKE-4PILE ?auto_205570 ?auto_205571 ?auto_205572 ?auto_205573 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_205588 - BLOCK
      ?auto_205589 - BLOCK
      ?auto_205590 - BLOCK
      ?auto_205591 - BLOCK
    )
    :vars
    (
      ?auto_205592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205591 ?auto_205592 ) ( ON-TABLE ?auto_205588 ) ( not ( = ?auto_205588 ?auto_205589 ) ) ( not ( = ?auto_205588 ?auto_205590 ) ) ( not ( = ?auto_205588 ?auto_205591 ) ) ( not ( = ?auto_205588 ?auto_205592 ) ) ( not ( = ?auto_205589 ?auto_205590 ) ) ( not ( = ?auto_205589 ?auto_205591 ) ) ( not ( = ?auto_205589 ?auto_205592 ) ) ( not ( = ?auto_205590 ?auto_205591 ) ) ( not ( = ?auto_205590 ?auto_205592 ) ) ( not ( = ?auto_205591 ?auto_205592 ) ) ( ON ?auto_205590 ?auto_205591 ) ( CLEAR ?auto_205588 ) ( ON ?auto_205589 ?auto_205590 ) ( CLEAR ?auto_205589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_205588 ?auto_205589 )
      ( MAKE-4PILE ?auto_205588 ?auto_205589 ?auto_205590 ?auto_205591 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_205606 - BLOCK
      ?auto_205607 - BLOCK
      ?auto_205608 - BLOCK
      ?auto_205609 - BLOCK
    )
    :vars
    (
      ?auto_205610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205609 ?auto_205610 ) ( not ( = ?auto_205606 ?auto_205607 ) ) ( not ( = ?auto_205606 ?auto_205608 ) ) ( not ( = ?auto_205606 ?auto_205609 ) ) ( not ( = ?auto_205606 ?auto_205610 ) ) ( not ( = ?auto_205607 ?auto_205608 ) ) ( not ( = ?auto_205607 ?auto_205609 ) ) ( not ( = ?auto_205607 ?auto_205610 ) ) ( not ( = ?auto_205608 ?auto_205609 ) ) ( not ( = ?auto_205608 ?auto_205610 ) ) ( not ( = ?auto_205609 ?auto_205610 ) ) ( ON ?auto_205608 ?auto_205609 ) ( ON ?auto_205607 ?auto_205608 ) ( ON ?auto_205606 ?auto_205607 ) ( CLEAR ?auto_205606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_205606 )
      ( MAKE-4PILE ?auto_205606 ?auto_205607 ?auto_205608 ?auto_205609 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_205625 - BLOCK
      ?auto_205626 - BLOCK
      ?auto_205627 - BLOCK
      ?auto_205628 - BLOCK
      ?auto_205629 - BLOCK
    )
    :vars
    (
      ?auto_205630 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_205628 ) ( ON ?auto_205629 ?auto_205630 ) ( CLEAR ?auto_205629 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_205625 ) ( ON ?auto_205626 ?auto_205625 ) ( ON ?auto_205627 ?auto_205626 ) ( ON ?auto_205628 ?auto_205627 ) ( not ( = ?auto_205625 ?auto_205626 ) ) ( not ( = ?auto_205625 ?auto_205627 ) ) ( not ( = ?auto_205625 ?auto_205628 ) ) ( not ( = ?auto_205625 ?auto_205629 ) ) ( not ( = ?auto_205625 ?auto_205630 ) ) ( not ( = ?auto_205626 ?auto_205627 ) ) ( not ( = ?auto_205626 ?auto_205628 ) ) ( not ( = ?auto_205626 ?auto_205629 ) ) ( not ( = ?auto_205626 ?auto_205630 ) ) ( not ( = ?auto_205627 ?auto_205628 ) ) ( not ( = ?auto_205627 ?auto_205629 ) ) ( not ( = ?auto_205627 ?auto_205630 ) ) ( not ( = ?auto_205628 ?auto_205629 ) ) ( not ( = ?auto_205628 ?auto_205630 ) ) ( not ( = ?auto_205629 ?auto_205630 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_205629 ?auto_205630 )
      ( !STACK ?auto_205629 ?auto_205628 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_205647 - BLOCK
      ?auto_205648 - BLOCK
      ?auto_205649 - BLOCK
      ?auto_205650 - BLOCK
      ?auto_205651 - BLOCK
    )
    :vars
    (
      ?auto_205652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205651 ?auto_205652 ) ( ON-TABLE ?auto_205647 ) ( ON ?auto_205648 ?auto_205647 ) ( ON ?auto_205649 ?auto_205648 ) ( not ( = ?auto_205647 ?auto_205648 ) ) ( not ( = ?auto_205647 ?auto_205649 ) ) ( not ( = ?auto_205647 ?auto_205650 ) ) ( not ( = ?auto_205647 ?auto_205651 ) ) ( not ( = ?auto_205647 ?auto_205652 ) ) ( not ( = ?auto_205648 ?auto_205649 ) ) ( not ( = ?auto_205648 ?auto_205650 ) ) ( not ( = ?auto_205648 ?auto_205651 ) ) ( not ( = ?auto_205648 ?auto_205652 ) ) ( not ( = ?auto_205649 ?auto_205650 ) ) ( not ( = ?auto_205649 ?auto_205651 ) ) ( not ( = ?auto_205649 ?auto_205652 ) ) ( not ( = ?auto_205650 ?auto_205651 ) ) ( not ( = ?auto_205650 ?auto_205652 ) ) ( not ( = ?auto_205651 ?auto_205652 ) ) ( CLEAR ?auto_205649 ) ( ON ?auto_205650 ?auto_205651 ) ( CLEAR ?auto_205650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_205647 ?auto_205648 ?auto_205649 ?auto_205650 )
      ( MAKE-5PILE ?auto_205647 ?auto_205648 ?auto_205649 ?auto_205650 ?auto_205651 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_205669 - BLOCK
      ?auto_205670 - BLOCK
      ?auto_205671 - BLOCK
      ?auto_205672 - BLOCK
      ?auto_205673 - BLOCK
    )
    :vars
    (
      ?auto_205674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205673 ?auto_205674 ) ( ON-TABLE ?auto_205669 ) ( ON ?auto_205670 ?auto_205669 ) ( not ( = ?auto_205669 ?auto_205670 ) ) ( not ( = ?auto_205669 ?auto_205671 ) ) ( not ( = ?auto_205669 ?auto_205672 ) ) ( not ( = ?auto_205669 ?auto_205673 ) ) ( not ( = ?auto_205669 ?auto_205674 ) ) ( not ( = ?auto_205670 ?auto_205671 ) ) ( not ( = ?auto_205670 ?auto_205672 ) ) ( not ( = ?auto_205670 ?auto_205673 ) ) ( not ( = ?auto_205670 ?auto_205674 ) ) ( not ( = ?auto_205671 ?auto_205672 ) ) ( not ( = ?auto_205671 ?auto_205673 ) ) ( not ( = ?auto_205671 ?auto_205674 ) ) ( not ( = ?auto_205672 ?auto_205673 ) ) ( not ( = ?auto_205672 ?auto_205674 ) ) ( not ( = ?auto_205673 ?auto_205674 ) ) ( ON ?auto_205672 ?auto_205673 ) ( CLEAR ?auto_205670 ) ( ON ?auto_205671 ?auto_205672 ) ( CLEAR ?auto_205671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_205669 ?auto_205670 ?auto_205671 )
      ( MAKE-5PILE ?auto_205669 ?auto_205670 ?auto_205671 ?auto_205672 ?auto_205673 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_205691 - BLOCK
      ?auto_205692 - BLOCK
      ?auto_205693 - BLOCK
      ?auto_205694 - BLOCK
      ?auto_205695 - BLOCK
    )
    :vars
    (
      ?auto_205696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205695 ?auto_205696 ) ( ON-TABLE ?auto_205691 ) ( not ( = ?auto_205691 ?auto_205692 ) ) ( not ( = ?auto_205691 ?auto_205693 ) ) ( not ( = ?auto_205691 ?auto_205694 ) ) ( not ( = ?auto_205691 ?auto_205695 ) ) ( not ( = ?auto_205691 ?auto_205696 ) ) ( not ( = ?auto_205692 ?auto_205693 ) ) ( not ( = ?auto_205692 ?auto_205694 ) ) ( not ( = ?auto_205692 ?auto_205695 ) ) ( not ( = ?auto_205692 ?auto_205696 ) ) ( not ( = ?auto_205693 ?auto_205694 ) ) ( not ( = ?auto_205693 ?auto_205695 ) ) ( not ( = ?auto_205693 ?auto_205696 ) ) ( not ( = ?auto_205694 ?auto_205695 ) ) ( not ( = ?auto_205694 ?auto_205696 ) ) ( not ( = ?auto_205695 ?auto_205696 ) ) ( ON ?auto_205694 ?auto_205695 ) ( ON ?auto_205693 ?auto_205694 ) ( CLEAR ?auto_205691 ) ( ON ?auto_205692 ?auto_205693 ) ( CLEAR ?auto_205692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_205691 ?auto_205692 )
      ( MAKE-5PILE ?auto_205691 ?auto_205692 ?auto_205693 ?auto_205694 ?auto_205695 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_205713 - BLOCK
      ?auto_205714 - BLOCK
      ?auto_205715 - BLOCK
      ?auto_205716 - BLOCK
      ?auto_205717 - BLOCK
    )
    :vars
    (
      ?auto_205718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205717 ?auto_205718 ) ( not ( = ?auto_205713 ?auto_205714 ) ) ( not ( = ?auto_205713 ?auto_205715 ) ) ( not ( = ?auto_205713 ?auto_205716 ) ) ( not ( = ?auto_205713 ?auto_205717 ) ) ( not ( = ?auto_205713 ?auto_205718 ) ) ( not ( = ?auto_205714 ?auto_205715 ) ) ( not ( = ?auto_205714 ?auto_205716 ) ) ( not ( = ?auto_205714 ?auto_205717 ) ) ( not ( = ?auto_205714 ?auto_205718 ) ) ( not ( = ?auto_205715 ?auto_205716 ) ) ( not ( = ?auto_205715 ?auto_205717 ) ) ( not ( = ?auto_205715 ?auto_205718 ) ) ( not ( = ?auto_205716 ?auto_205717 ) ) ( not ( = ?auto_205716 ?auto_205718 ) ) ( not ( = ?auto_205717 ?auto_205718 ) ) ( ON ?auto_205716 ?auto_205717 ) ( ON ?auto_205715 ?auto_205716 ) ( ON ?auto_205714 ?auto_205715 ) ( ON ?auto_205713 ?auto_205714 ) ( CLEAR ?auto_205713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_205713 )
      ( MAKE-5PILE ?auto_205713 ?auto_205714 ?auto_205715 ?auto_205716 ?auto_205717 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_205736 - BLOCK
      ?auto_205737 - BLOCK
      ?auto_205738 - BLOCK
      ?auto_205739 - BLOCK
      ?auto_205740 - BLOCK
      ?auto_205741 - BLOCK
    )
    :vars
    (
      ?auto_205742 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_205740 ) ( ON ?auto_205741 ?auto_205742 ) ( CLEAR ?auto_205741 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_205736 ) ( ON ?auto_205737 ?auto_205736 ) ( ON ?auto_205738 ?auto_205737 ) ( ON ?auto_205739 ?auto_205738 ) ( ON ?auto_205740 ?auto_205739 ) ( not ( = ?auto_205736 ?auto_205737 ) ) ( not ( = ?auto_205736 ?auto_205738 ) ) ( not ( = ?auto_205736 ?auto_205739 ) ) ( not ( = ?auto_205736 ?auto_205740 ) ) ( not ( = ?auto_205736 ?auto_205741 ) ) ( not ( = ?auto_205736 ?auto_205742 ) ) ( not ( = ?auto_205737 ?auto_205738 ) ) ( not ( = ?auto_205737 ?auto_205739 ) ) ( not ( = ?auto_205737 ?auto_205740 ) ) ( not ( = ?auto_205737 ?auto_205741 ) ) ( not ( = ?auto_205737 ?auto_205742 ) ) ( not ( = ?auto_205738 ?auto_205739 ) ) ( not ( = ?auto_205738 ?auto_205740 ) ) ( not ( = ?auto_205738 ?auto_205741 ) ) ( not ( = ?auto_205738 ?auto_205742 ) ) ( not ( = ?auto_205739 ?auto_205740 ) ) ( not ( = ?auto_205739 ?auto_205741 ) ) ( not ( = ?auto_205739 ?auto_205742 ) ) ( not ( = ?auto_205740 ?auto_205741 ) ) ( not ( = ?auto_205740 ?auto_205742 ) ) ( not ( = ?auto_205741 ?auto_205742 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_205741 ?auto_205742 )
      ( !STACK ?auto_205741 ?auto_205740 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_205762 - BLOCK
      ?auto_205763 - BLOCK
      ?auto_205764 - BLOCK
      ?auto_205765 - BLOCK
      ?auto_205766 - BLOCK
      ?auto_205767 - BLOCK
    )
    :vars
    (
      ?auto_205768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205767 ?auto_205768 ) ( ON-TABLE ?auto_205762 ) ( ON ?auto_205763 ?auto_205762 ) ( ON ?auto_205764 ?auto_205763 ) ( ON ?auto_205765 ?auto_205764 ) ( not ( = ?auto_205762 ?auto_205763 ) ) ( not ( = ?auto_205762 ?auto_205764 ) ) ( not ( = ?auto_205762 ?auto_205765 ) ) ( not ( = ?auto_205762 ?auto_205766 ) ) ( not ( = ?auto_205762 ?auto_205767 ) ) ( not ( = ?auto_205762 ?auto_205768 ) ) ( not ( = ?auto_205763 ?auto_205764 ) ) ( not ( = ?auto_205763 ?auto_205765 ) ) ( not ( = ?auto_205763 ?auto_205766 ) ) ( not ( = ?auto_205763 ?auto_205767 ) ) ( not ( = ?auto_205763 ?auto_205768 ) ) ( not ( = ?auto_205764 ?auto_205765 ) ) ( not ( = ?auto_205764 ?auto_205766 ) ) ( not ( = ?auto_205764 ?auto_205767 ) ) ( not ( = ?auto_205764 ?auto_205768 ) ) ( not ( = ?auto_205765 ?auto_205766 ) ) ( not ( = ?auto_205765 ?auto_205767 ) ) ( not ( = ?auto_205765 ?auto_205768 ) ) ( not ( = ?auto_205766 ?auto_205767 ) ) ( not ( = ?auto_205766 ?auto_205768 ) ) ( not ( = ?auto_205767 ?auto_205768 ) ) ( CLEAR ?auto_205765 ) ( ON ?auto_205766 ?auto_205767 ) ( CLEAR ?auto_205766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_205762 ?auto_205763 ?auto_205764 ?auto_205765 ?auto_205766 )
      ( MAKE-6PILE ?auto_205762 ?auto_205763 ?auto_205764 ?auto_205765 ?auto_205766 ?auto_205767 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_205788 - BLOCK
      ?auto_205789 - BLOCK
      ?auto_205790 - BLOCK
      ?auto_205791 - BLOCK
      ?auto_205792 - BLOCK
      ?auto_205793 - BLOCK
    )
    :vars
    (
      ?auto_205794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205793 ?auto_205794 ) ( ON-TABLE ?auto_205788 ) ( ON ?auto_205789 ?auto_205788 ) ( ON ?auto_205790 ?auto_205789 ) ( not ( = ?auto_205788 ?auto_205789 ) ) ( not ( = ?auto_205788 ?auto_205790 ) ) ( not ( = ?auto_205788 ?auto_205791 ) ) ( not ( = ?auto_205788 ?auto_205792 ) ) ( not ( = ?auto_205788 ?auto_205793 ) ) ( not ( = ?auto_205788 ?auto_205794 ) ) ( not ( = ?auto_205789 ?auto_205790 ) ) ( not ( = ?auto_205789 ?auto_205791 ) ) ( not ( = ?auto_205789 ?auto_205792 ) ) ( not ( = ?auto_205789 ?auto_205793 ) ) ( not ( = ?auto_205789 ?auto_205794 ) ) ( not ( = ?auto_205790 ?auto_205791 ) ) ( not ( = ?auto_205790 ?auto_205792 ) ) ( not ( = ?auto_205790 ?auto_205793 ) ) ( not ( = ?auto_205790 ?auto_205794 ) ) ( not ( = ?auto_205791 ?auto_205792 ) ) ( not ( = ?auto_205791 ?auto_205793 ) ) ( not ( = ?auto_205791 ?auto_205794 ) ) ( not ( = ?auto_205792 ?auto_205793 ) ) ( not ( = ?auto_205792 ?auto_205794 ) ) ( not ( = ?auto_205793 ?auto_205794 ) ) ( ON ?auto_205792 ?auto_205793 ) ( CLEAR ?auto_205790 ) ( ON ?auto_205791 ?auto_205792 ) ( CLEAR ?auto_205791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_205788 ?auto_205789 ?auto_205790 ?auto_205791 )
      ( MAKE-6PILE ?auto_205788 ?auto_205789 ?auto_205790 ?auto_205791 ?auto_205792 ?auto_205793 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_205814 - BLOCK
      ?auto_205815 - BLOCK
      ?auto_205816 - BLOCK
      ?auto_205817 - BLOCK
      ?auto_205818 - BLOCK
      ?auto_205819 - BLOCK
    )
    :vars
    (
      ?auto_205820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205819 ?auto_205820 ) ( ON-TABLE ?auto_205814 ) ( ON ?auto_205815 ?auto_205814 ) ( not ( = ?auto_205814 ?auto_205815 ) ) ( not ( = ?auto_205814 ?auto_205816 ) ) ( not ( = ?auto_205814 ?auto_205817 ) ) ( not ( = ?auto_205814 ?auto_205818 ) ) ( not ( = ?auto_205814 ?auto_205819 ) ) ( not ( = ?auto_205814 ?auto_205820 ) ) ( not ( = ?auto_205815 ?auto_205816 ) ) ( not ( = ?auto_205815 ?auto_205817 ) ) ( not ( = ?auto_205815 ?auto_205818 ) ) ( not ( = ?auto_205815 ?auto_205819 ) ) ( not ( = ?auto_205815 ?auto_205820 ) ) ( not ( = ?auto_205816 ?auto_205817 ) ) ( not ( = ?auto_205816 ?auto_205818 ) ) ( not ( = ?auto_205816 ?auto_205819 ) ) ( not ( = ?auto_205816 ?auto_205820 ) ) ( not ( = ?auto_205817 ?auto_205818 ) ) ( not ( = ?auto_205817 ?auto_205819 ) ) ( not ( = ?auto_205817 ?auto_205820 ) ) ( not ( = ?auto_205818 ?auto_205819 ) ) ( not ( = ?auto_205818 ?auto_205820 ) ) ( not ( = ?auto_205819 ?auto_205820 ) ) ( ON ?auto_205818 ?auto_205819 ) ( ON ?auto_205817 ?auto_205818 ) ( CLEAR ?auto_205815 ) ( ON ?auto_205816 ?auto_205817 ) ( CLEAR ?auto_205816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_205814 ?auto_205815 ?auto_205816 )
      ( MAKE-6PILE ?auto_205814 ?auto_205815 ?auto_205816 ?auto_205817 ?auto_205818 ?auto_205819 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_205840 - BLOCK
      ?auto_205841 - BLOCK
      ?auto_205842 - BLOCK
      ?auto_205843 - BLOCK
      ?auto_205844 - BLOCK
      ?auto_205845 - BLOCK
    )
    :vars
    (
      ?auto_205846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205845 ?auto_205846 ) ( ON-TABLE ?auto_205840 ) ( not ( = ?auto_205840 ?auto_205841 ) ) ( not ( = ?auto_205840 ?auto_205842 ) ) ( not ( = ?auto_205840 ?auto_205843 ) ) ( not ( = ?auto_205840 ?auto_205844 ) ) ( not ( = ?auto_205840 ?auto_205845 ) ) ( not ( = ?auto_205840 ?auto_205846 ) ) ( not ( = ?auto_205841 ?auto_205842 ) ) ( not ( = ?auto_205841 ?auto_205843 ) ) ( not ( = ?auto_205841 ?auto_205844 ) ) ( not ( = ?auto_205841 ?auto_205845 ) ) ( not ( = ?auto_205841 ?auto_205846 ) ) ( not ( = ?auto_205842 ?auto_205843 ) ) ( not ( = ?auto_205842 ?auto_205844 ) ) ( not ( = ?auto_205842 ?auto_205845 ) ) ( not ( = ?auto_205842 ?auto_205846 ) ) ( not ( = ?auto_205843 ?auto_205844 ) ) ( not ( = ?auto_205843 ?auto_205845 ) ) ( not ( = ?auto_205843 ?auto_205846 ) ) ( not ( = ?auto_205844 ?auto_205845 ) ) ( not ( = ?auto_205844 ?auto_205846 ) ) ( not ( = ?auto_205845 ?auto_205846 ) ) ( ON ?auto_205844 ?auto_205845 ) ( ON ?auto_205843 ?auto_205844 ) ( ON ?auto_205842 ?auto_205843 ) ( CLEAR ?auto_205840 ) ( ON ?auto_205841 ?auto_205842 ) ( CLEAR ?auto_205841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_205840 ?auto_205841 )
      ( MAKE-6PILE ?auto_205840 ?auto_205841 ?auto_205842 ?auto_205843 ?auto_205844 ?auto_205845 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_205866 - BLOCK
      ?auto_205867 - BLOCK
      ?auto_205868 - BLOCK
      ?auto_205869 - BLOCK
      ?auto_205870 - BLOCK
      ?auto_205871 - BLOCK
    )
    :vars
    (
      ?auto_205872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205871 ?auto_205872 ) ( not ( = ?auto_205866 ?auto_205867 ) ) ( not ( = ?auto_205866 ?auto_205868 ) ) ( not ( = ?auto_205866 ?auto_205869 ) ) ( not ( = ?auto_205866 ?auto_205870 ) ) ( not ( = ?auto_205866 ?auto_205871 ) ) ( not ( = ?auto_205866 ?auto_205872 ) ) ( not ( = ?auto_205867 ?auto_205868 ) ) ( not ( = ?auto_205867 ?auto_205869 ) ) ( not ( = ?auto_205867 ?auto_205870 ) ) ( not ( = ?auto_205867 ?auto_205871 ) ) ( not ( = ?auto_205867 ?auto_205872 ) ) ( not ( = ?auto_205868 ?auto_205869 ) ) ( not ( = ?auto_205868 ?auto_205870 ) ) ( not ( = ?auto_205868 ?auto_205871 ) ) ( not ( = ?auto_205868 ?auto_205872 ) ) ( not ( = ?auto_205869 ?auto_205870 ) ) ( not ( = ?auto_205869 ?auto_205871 ) ) ( not ( = ?auto_205869 ?auto_205872 ) ) ( not ( = ?auto_205870 ?auto_205871 ) ) ( not ( = ?auto_205870 ?auto_205872 ) ) ( not ( = ?auto_205871 ?auto_205872 ) ) ( ON ?auto_205870 ?auto_205871 ) ( ON ?auto_205869 ?auto_205870 ) ( ON ?auto_205868 ?auto_205869 ) ( ON ?auto_205867 ?auto_205868 ) ( ON ?auto_205866 ?auto_205867 ) ( CLEAR ?auto_205866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_205866 )
      ( MAKE-6PILE ?auto_205866 ?auto_205867 ?auto_205868 ?auto_205869 ?auto_205870 ?auto_205871 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205893 - BLOCK
      ?auto_205894 - BLOCK
      ?auto_205895 - BLOCK
      ?auto_205896 - BLOCK
      ?auto_205897 - BLOCK
      ?auto_205898 - BLOCK
      ?auto_205899 - BLOCK
    )
    :vars
    (
      ?auto_205900 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_205898 ) ( ON ?auto_205899 ?auto_205900 ) ( CLEAR ?auto_205899 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_205893 ) ( ON ?auto_205894 ?auto_205893 ) ( ON ?auto_205895 ?auto_205894 ) ( ON ?auto_205896 ?auto_205895 ) ( ON ?auto_205897 ?auto_205896 ) ( ON ?auto_205898 ?auto_205897 ) ( not ( = ?auto_205893 ?auto_205894 ) ) ( not ( = ?auto_205893 ?auto_205895 ) ) ( not ( = ?auto_205893 ?auto_205896 ) ) ( not ( = ?auto_205893 ?auto_205897 ) ) ( not ( = ?auto_205893 ?auto_205898 ) ) ( not ( = ?auto_205893 ?auto_205899 ) ) ( not ( = ?auto_205893 ?auto_205900 ) ) ( not ( = ?auto_205894 ?auto_205895 ) ) ( not ( = ?auto_205894 ?auto_205896 ) ) ( not ( = ?auto_205894 ?auto_205897 ) ) ( not ( = ?auto_205894 ?auto_205898 ) ) ( not ( = ?auto_205894 ?auto_205899 ) ) ( not ( = ?auto_205894 ?auto_205900 ) ) ( not ( = ?auto_205895 ?auto_205896 ) ) ( not ( = ?auto_205895 ?auto_205897 ) ) ( not ( = ?auto_205895 ?auto_205898 ) ) ( not ( = ?auto_205895 ?auto_205899 ) ) ( not ( = ?auto_205895 ?auto_205900 ) ) ( not ( = ?auto_205896 ?auto_205897 ) ) ( not ( = ?auto_205896 ?auto_205898 ) ) ( not ( = ?auto_205896 ?auto_205899 ) ) ( not ( = ?auto_205896 ?auto_205900 ) ) ( not ( = ?auto_205897 ?auto_205898 ) ) ( not ( = ?auto_205897 ?auto_205899 ) ) ( not ( = ?auto_205897 ?auto_205900 ) ) ( not ( = ?auto_205898 ?auto_205899 ) ) ( not ( = ?auto_205898 ?auto_205900 ) ) ( not ( = ?auto_205899 ?auto_205900 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_205899 ?auto_205900 )
      ( !STACK ?auto_205899 ?auto_205898 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205923 - BLOCK
      ?auto_205924 - BLOCK
      ?auto_205925 - BLOCK
      ?auto_205926 - BLOCK
      ?auto_205927 - BLOCK
      ?auto_205928 - BLOCK
      ?auto_205929 - BLOCK
    )
    :vars
    (
      ?auto_205930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205929 ?auto_205930 ) ( ON-TABLE ?auto_205923 ) ( ON ?auto_205924 ?auto_205923 ) ( ON ?auto_205925 ?auto_205924 ) ( ON ?auto_205926 ?auto_205925 ) ( ON ?auto_205927 ?auto_205926 ) ( not ( = ?auto_205923 ?auto_205924 ) ) ( not ( = ?auto_205923 ?auto_205925 ) ) ( not ( = ?auto_205923 ?auto_205926 ) ) ( not ( = ?auto_205923 ?auto_205927 ) ) ( not ( = ?auto_205923 ?auto_205928 ) ) ( not ( = ?auto_205923 ?auto_205929 ) ) ( not ( = ?auto_205923 ?auto_205930 ) ) ( not ( = ?auto_205924 ?auto_205925 ) ) ( not ( = ?auto_205924 ?auto_205926 ) ) ( not ( = ?auto_205924 ?auto_205927 ) ) ( not ( = ?auto_205924 ?auto_205928 ) ) ( not ( = ?auto_205924 ?auto_205929 ) ) ( not ( = ?auto_205924 ?auto_205930 ) ) ( not ( = ?auto_205925 ?auto_205926 ) ) ( not ( = ?auto_205925 ?auto_205927 ) ) ( not ( = ?auto_205925 ?auto_205928 ) ) ( not ( = ?auto_205925 ?auto_205929 ) ) ( not ( = ?auto_205925 ?auto_205930 ) ) ( not ( = ?auto_205926 ?auto_205927 ) ) ( not ( = ?auto_205926 ?auto_205928 ) ) ( not ( = ?auto_205926 ?auto_205929 ) ) ( not ( = ?auto_205926 ?auto_205930 ) ) ( not ( = ?auto_205927 ?auto_205928 ) ) ( not ( = ?auto_205927 ?auto_205929 ) ) ( not ( = ?auto_205927 ?auto_205930 ) ) ( not ( = ?auto_205928 ?auto_205929 ) ) ( not ( = ?auto_205928 ?auto_205930 ) ) ( not ( = ?auto_205929 ?auto_205930 ) ) ( CLEAR ?auto_205927 ) ( ON ?auto_205928 ?auto_205929 ) ( CLEAR ?auto_205928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_205923 ?auto_205924 ?auto_205925 ?auto_205926 ?auto_205927 ?auto_205928 )
      ( MAKE-7PILE ?auto_205923 ?auto_205924 ?auto_205925 ?auto_205926 ?auto_205927 ?auto_205928 ?auto_205929 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205953 - BLOCK
      ?auto_205954 - BLOCK
      ?auto_205955 - BLOCK
      ?auto_205956 - BLOCK
      ?auto_205957 - BLOCK
      ?auto_205958 - BLOCK
      ?auto_205959 - BLOCK
    )
    :vars
    (
      ?auto_205960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205959 ?auto_205960 ) ( ON-TABLE ?auto_205953 ) ( ON ?auto_205954 ?auto_205953 ) ( ON ?auto_205955 ?auto_205954 ) ( ON ?auto_205956 ?auto_205955 ) ( not ( = ?auto_205953 ?auto_205954 ) ) ( not ( = ?auto_205953 ?auto_205955 ) ) ( not ( = ?auto_205953 ?auto_205956 ) ) ( not ( = ?auto_205953 ?auto_205957 ) ) ( not ( = ?auto_205953 ?auto_205958 ) ) ( not ( = ?auto_205953 ?auto_205959 ) ) ( not ( = ?auto_205953 ?auto_205960 ) ) ( not ( = ?auto_205954 ?auto_205955 ) ) ( not ( = ?auto_205954 ?auto_205956 ) ) ( not ( = ?auto_205954 ?auto_205957 ) ) ( not ( = ?auto_205954 ?auto_205958 ) ) ( not ( = ?auto_205954 ?auto_205959 ) ) ( not ( = ?auto_205954 ?auto_205960 ) ) ( not ( = ?auto_205955 ?auto_205956 ) ) ( not ( = ?auto_205955 ?auto_205957 ) ) ( not ( = ?auto_205955 ?auto_205958 ) ) ( not ( = ?auto_205955 ?auto_205959 ) ) ( not ( = ?auto_205955 ?auto_205960 ) ) ( not ( = ?auto_205956 ?auto_205957 ) ) ( not ( = ?auto_205956 ?auto_205958 ) ) ( not ( = ?auto_205956 ?auto_205959 ) ) ( not ( = ?auto_205956 ?auto_205960 ) ) ( not ( = ?auto_205957 ?auto_205958 ) ) ( not ( = ?auto_205957 ?auto_205959 ) ) ( not ( = ?auto_205957 ?auto_205960 ) ) ( not ( = ?auto_205958 ?auto_205959 ) ) ( not ( = ?auto_205958 ?auto_205960 ) ) ( not ( = ?auto_205959 ?auto_205960 ) ) ( ON ?auto_205958 ?auto_205959 ) ( CLEAR ?auto_205956 ) ( ON ?auto_205957 ?auto_205958 ) ( CLEAR ?auto_205957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_205953 ?auto_205954 ?auto_205955 ?auto_205956 ?auto_205957 )
      ( MAKE-7PILE ?auto_205953 ?auto_205954 ?auto_205955 ?auto_205956 ?auto_205957 ?auto_205958 ?auto_205959 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205983 - BLOCK
      ?auto_205984 - BLOCK
      ?auto_205985 - BLOCK
      ?auto_205986 - BLOCK
      ?auto_205987 - BLOCK
      ?auto_205988 - BLOCK
      ?auto_205989 - BLOCK
    )
    :vars
    (
      ?auto_205990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205989 ?auto_205990 ) ( ON-TABLE ?auto_205983 ) ( ON ?auto_205984 ?auto_205983 ) ( ON ?auto_205985 ?auto_205984 ) ( not ( = ?auto_205983 ?auto_205984 ) ) ( not ( = ?auto_205983 ?auto_205985 ) ) ( not ( = ?auto_205983 ?auto_205986 ) ) ( not ( = ?auto_205983 ?auto_205987 ) ) ( not ( = ?auto_205983 ?auto_205988 ) ) ( not ( = ?auto_205983 ?auto_205989 ) ) ( not ( = ?auto_205983 ?auto_205990 ) ) ( not ( = ?auto_205984 ?auto_205985 ) ) ( not ( = ?auto_205984 ?auto_205986 ) ) ( not ( = ?auto_205984 ?auto_205987 ) ) ( not ( = ?auto_205984 ?auto_205988 ) ) ( not ( = ?auto_205984 ?auto_205989 ) ) ( not ( = ?auto_205984 ?auto_205990 ) ) ( not ( = ?auto_205985 ?auto_205986 ) ) ( not ( = ?auto_205985 ?auto_205987 ) ) ( not ( = ?auto_205985 ?auto_205988 ) ) ( not ( = ?auto_205985 ?auto_205989 ) ) ( not ( = ?auto_205985 ?auto_205990 ) ) ( not ( = ?auto_205986 ?auto_205987 ) ) ( not ( = ?auto_205986 ?auto_205988 ) ) ( not ( = ?auto_205986 ?auto_205989 ) ) ( not ( = ?auto_205986 ?auto_205990 ) ) ( not ( = ?auto_205987 ?auto_205988 ) ) ( not ( = ?auto_205987 ?auto_205989 ) ) ( not ( = ?auto_205987 ?auto_205990 ) ) ( not ( = ?auto_205988 ?auto_205989 ) ) ( not ( = ?auto_205988 ?auto_205990 ) ) ( not ( = ?auto_205989 ?auto_205990 ) ) ( ON ?auto_205988 ?auto_205989 ) ( ON ?auto_205987 ?auto_205988 ) ( CLEAR ?auto_205985 ) ( ON ?auto_205986 ?auto_205987 ) ( CLEAR ?auto_205986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_205983 ?auto_205984 ?auto_205985 ?auto_205986 )
      ( MAKE-7PILE ?auto_205983 ?auto_205984 ?auto_205985 ?auto_205986 ?auto_205987 ?auto_205988 ?auto_205989 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_206013 - BLOCK
      ?auto_206014 - BLOCK
      ?auto_206015 - BLOCK
      ?auto_206016 - BLOCK
      ?auto_206017 - BLOCK
      ?auto_206018 - BLOCK
      ?auto_206019 - BLOCK
    )
    :vars
    (
      ?auto_206020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206019 ?auto_206020 ) ( ON-TABLE ?auto_206013 ) ( ON ?auto_206014 ?auto_206013 ) ( not ( = ?auto_206013 ?auto_206014 ) ) ( not ( = ?auto_206013 ?auto_206015 ) ) ( not ( = ?auto_206013 ?auto_206016 ) ) ( not ( = ?auto_206013 ?auto_206017 ) ) ( not ( = ?auto_206013 ?auto_206018 ) ) ( not ( = ?auto_206013 ?auto_206019 ) ) ( not ( = ?auto_206013 ?auto_206020 ) ) ( not ( = ?auto_206014 ?auto_206015 ) ) ( not ( = ?auto_206014 ?auto_206016 ) ) ( not ( = ?auto_206014 ?auto_206017 ) ) ( not ( = ?auto_206014 ?auto_206018 ) ) ( not ( = ?auto_206014 ?auto_206019 ) ) ( not ( = ?auto_206014 ?auto_206020 ) ) ( not ( = ?auto_206015 ?auto_206016 ) ) ( not ( = ?auto_206015 ?auto_206017 ) ) ( not ( = ?auto_206015 ?auto_206018 ) ) ( not ( = ?auto_206015 ?auto_206019 ) ) ( not ( = ?auto_206015 ?auto_206020 ) ) ( not ( = ?auto_206016 ?auto_206017 ) ) ( not ( = ?auto_206016 ?auto_206018 ) ) ( not ( = ?auto_206016 ?auto_206019 ) ) ( not ( = ?auto_206016 ?auto_206020 ) ) ( not ( = ?auto_206017 ?auto_206018 ) ) ( not ( = ?auto_206017 ?auto_206019 ) ) ( not ( = ?auto_206017 ?auto_206020 ) ) ( not ( = ?auto_206018 ?auto_206019 ) ) ( not ( = ?auto_206018 ?auto_206020 ) ) ( not ( = ?auto_206019 ?auto_206020 ) ) ( ON ?auto_206018 ?auto_206019 ) ( ON ?auto_206017 ?auto_206018 ) ( ON ?auto_206016 ?auto_206017 ) ( CLEAR ?auto_206014 ) ( ON ?auto_206015 ?auto_206016 ) ( CLEAR ?auto_206015 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_206013 ?auto_206014 ?auto_206015 )
      ( MAKE-7PILE ?auto_206013 ?auto_206014 ?auto_206015 ?auto_206016 ?auto_206017 ?auto_206018 ?auto_206019 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_206043 - BLOCK
      ?auto_206044 - BLOCK
      ?auto_206045 - BLOCK
      ?auto_206046 - BLOCK
      ?auto_206047 - BLOCK
      ?auto_206048 - BLOCK
      ?auto_206049 - BLOCK
    )
    :vars
    (
      ?auto_206050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206049 ?auto_206050 ) ( ON-TABLE ?auto_206043 ) ( not ( = ?auto_206043 ?auto_206044 ) ) ( not ( = ?auto_206043 ?auto_206045 ) ) ( not ( = ?auto_206043 ?auto_206046 ) ) ( not ( = ?auto_206043 ?auto_206047 ) ) ( not ( = ?auto_206043 ?auto_206048 ) ) ( not ( = ?auto_206043 ?auto_206049 ) ) ( not ( = ?auto_206043 ?auto_206050 ) ) ( not ( = ?auto_206044 ?auto_206045 ) ) ( not ( = ?auto_206044 ?auto_206046 ) ) ( not ( = ?auto_206044 ?auto_206047 ) ) ( not ( = ?auto_206044 ?auto_206048 ) ) ( not ( = ?auto_206044 ?auto_206049 ) ) ( not ( = ?auto_206044 ?auto_206050 ) ) ( not ( = ?auto_206045 ?auto_206046 ) ) ( not ( = ?auto_206045 ?auto_206047 ) ) ( not ( = ?auto_206045 ?auto_206048 ) ) ( not ( = ?auto_206045 ?auto_206049 ) ) ( not ( = ?auto_206045 ?auto_206050 ) ) ( not ( = ?auto_206046 ?auto_206047 ) ) ( not ( = ?auto_206046 ?auto_206048 ) ) ( not ( = ?auto_206046 ?auto_206049 ) ) ( not ( = ?auto_206046 ?auto_206050 ) ) ( not ( = ?auto_206047 ?auto_206048 ) ) ( not ( = ?auto_206047 ?auto_206049 ) ) ( not ( = ?auto_206047 ?auto_206050 ) ) ( not ( = ?auto_206048 ?auto_206049 ) ) ( not ( = ?auto_206048 ?auto_206050 ) ) ( not ( = ?auto_206049 ?auto_206050 ) ) ( ON ?auto_206048 ?auto_206049 ) ( ON ?auto_206047 ?auto_206048 ) ( ON ?auto_206046 ?auto_206047 ) ( ON ?auto_206045 ?auto_206046 ) ( CLEAR ?auto_206043 ) ( ON ?auto_206044 ?auto_206045 ) ( CLEAR ?auto_206044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_206043 ?auto_206044 )
      ( MAKE-7PILE ?auto_206043 ?auto_206044 ?auto_206045 ?auto_206046 ?auto_206047 ?auto_206048 ?auto_206049 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_206073 - BLOCK
      ?auto_206074 - BLOCK
      ?auto_206075 - BLOCK
      ?auto_206076 - BLOCK
      ?auto_206077 - BLOCK
      ?auto_206078 - BLOCK
      ?auto_206079 - BLOCK
    )
    :vars
    (
      ?auto_206080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206079 ?auto_206080 ) ( not ( = ?auto_206073 ?auto_206074 ) ) ( not ( = ?auto_206073 ?auto_206075 ) ) ( not ( = ?auto_206073 ?auto_206076 ) ) ( not ( = ?auto_206073 ?auto_206077 ) ) ( not ( = ?auto_206073 ?auto_206078 ) ) ( not ( = ?auto_206073 ?auto_206079 ) ) ( not ( = ?auto_206073 ?auto_206080 ) ) ( not ( = ?auto_206074 ?auto_206075 ) ) ( not ( = ?auto_206074 ?auto_206076 ) ) ( not ( = ?auto_206074 ?auto_206077 ) ) ( not ( = ?auto_206074 ?auto_206078 ) ) ( not ( = ?auto_206074 ?auto_206079 ) ) ( not ( = ?auto_206074 ?auto_206080 ) ) ( not ( = ?auto_206075 ?auto_206076 ) ) ( not ( = ?auto_206075 ?auto_206077 ) ) ( not ( = ?auto_206075 ?auto_206078 ) ) ( not ( = ?auto_206075 ?auto_206079 ) ) ( not ( = ?auto_206075 ?auto_206080 ) ) ( not ( = ?auto_206076 ?auto_206077 ) ) ( not ( = ?auto_206076 ?auto_206078 ) ) ( not ( = ?auto_206076 ?auto_206079 ) ) ( not ( = ?auto_206076 ?auto_206080 ) ) ( not ( = ?auto_206077 ?auto_206078 ) ) ( not ( = ?auto_206077 ?auto_206079 ) ) ( not ( = ?auto_206077 ?auto_206080 ) ) ( not ( = ?auto_206078 ?auto_206079 ) ) ( not ( = ?auto_206078 ?auto_206080 ) ) ( not ( = ?auto_206079 ?auto_206080 ) ) ( ON ?auto_206078 ?auto_206079 ) ( ON ?auto_206077 ?auto_206078 ) ( ON ?auto_206076 ?auto_206077 ) ( ON ?auto_206075 ?auto_206076 ) ( ON ?auto_206074 ?auto_206075 ) ( ON ?auto_206073 ?auto_206074 ) ( CLEAR ?auto_206073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_206073 )
      ( MAKE-7PILE ?auto_206073 ?auto_206074 ?auto_206075 ?auto_206076 ?auto_206077 ?auto_206078 ?auto_206079 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_206104 - BLOCK
      ?auto_206105 - BLOCK
      ?auto_206106 - BLOCK
      ?auto_206107 - BLOCK
      ?auto_206108 - BLOCK
      ?auto_206109 - BLOCK
      ?auto_206110 - BLOCK
      ?auto_206111 - BLOCK
    )
    :vars
    (
      ?auto_206112 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_206110 ) ( ON ?auto_206111 ?auto_206112 ) ( CLEAR ?auto_206111 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_206104 ) ( ON ?auto_206105 ?auto_206104 ) ( ON ?auto_206106 ?auto_206105 ) ( ON ?auto_206107 ?auto_206106 ) ( ON ?auto_206108 ?auto_206107 ) ( ON ?auto_206109 ?auto_206108 ) ( ON ?auto_206110 ?auto_206109 ) ( not ( = ?auto_206104 ?auto_206105 ) ) ( not ( = ?auto_206104 ?auto_206106 ) ) ( not ( = ?auto_206104 ?auto_206107 ) ) ( not ( = ?auto_206104 ?auto_206108 ) ) ( not ( = ?auto_206104 ?auto_206109 ) ) ( not ( = ?auto_206104 ?auto_206110 ) ) ( not ( = ?auto_206104 ?auto_206111 ) ) ( not ( = ?auto_206104 ?auto_206112 ) ) ( not ( = ?auto_206105 ?auto_206106 ) ) ( not ( = ?auto_206105 ?auto_206107 ) ) ( not ( = ?auto_206105 ?auto_206108 ) ) ( not ( = ?auto_206105 ?auto_206109 ) ) ( not ( = ?auto_206105 ?auto_206110 ) ) ( not ( = ?auto_206105 ?auto_206111 ) ) ( not ( = ?auto_206105 ?auto_206112 ) ) ( not ( = ?auto_206106 ?auto_206107 ) ) ( not ( = ?auto_206106 ?auto_206108 ) ) ( not ( = ?auto_206106 ?auto_206109 ) ) ( not ( = ?auto_206106 ?auto_206110 ) ) ( not ( = ?auto_206106 ?auto_206111 ) ) ( not ( = ?auto_206106 ?auto_206112 ) ) ( not ( = ?auto_206107 ?auto_206108 ) ) ( not ( = ?auto_206107 ?auto_206109 ) ) ( not ( = ?auto_206107 ?auto_206110 ) ) ( not ( = ?auto_206107 ?auto_206111 ) ) ( not ( = ?auto_206107 ?auto_206112 ) ) ( not ( = ?auto_206108 ?auto_206109 ) ) ( not ( = ?auto_206108 ?auto_206110 ) ) ( not ( = ?auto_206108 ?auto_206111 ) ) ( not ( = ?auto_206108 ?auto_206112 ) ) ( not ( = ?auto_206109 ?auto_206110 ) ) ( not ( = ?auto_206109 ?auto_206111 ) ) ( not ( = ?auto_206109 ?auto_206112 ) ) ( not ( = ?auto_206110 ?auto_206111 ) ) ( not ( = ?auto_206110 ?auto_206112 ) ) ( not ( = ?auto_206111 ?auto_206112 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_206111 ?auto_206112 )
      ( !STACK ?auto_206111 ?auto_206110 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_206138 - BLOCK
      ?auto_206139 - BLOCK
      ?auto_206140 - BLOCK
      ?auto_206141 - BLOCK
      ?auto_206142 - BLOCK
      ?auto_206143 - BLOCK
      ?auto_206144 - BLOCK
      ?auto_206145 - BLOCK
    )
    :vars
    (
      ?auto_206146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206145 ?auto_206146 ) ( ON-TABLE ?auto_206138 ) ( ON ?auto_206139 ?auto_206138 ) ( ON ?auto_206140 ?auto_206139 ) ( ON ?auto_206141 ?auto_206140 ) ( ON ?auto_206142 ?auto_206141 ) ( ON ?auto_206143 ?auto_206142 ) ( not ( = ?auto_206138 ?auto_206139 ) ) ( not ( = ?auto_206138 ?auto_206140 ) ) ( not ( = ?auto_206138 ?auto_206141 ) ) ( not ( = ?auto_206138 ?auto_206142 ) ) ( not ( = ?auto_206138 ?auto_206143 ) ) ( not ( = ?auto_206138 ?auto_206144 ) ) ( not ( = ?auto_206138 ?auto_206145 ) ) ( not ( = ?auto_206138 ?auto_206146 ) ) ( not ( = ?auto_206139 ?auto_206140 ) ) ( not ( = ?auto_206139 ?auto_206141 ) ) ( not ( = ?auto_206139 ?auto_206142 ) ) ( not ( = ?auto_206139 ?auto_206143 ) ) ( not ( = ?auto_206139 ?auto_206144 ) ) ( not ( = ?auto_206139 ?auto_206145 ) ) ( not ( = ?auto_206139 ?auto_206146 ) ) ( not ( = ?auto_206140 ?auto_206141 ) ) ( not ( = ?auto_206140 ?auto_206142 ) ) ( not ( = ?auto_206140 ?auto_206143 ) ) ( not ( = ?auto_206140 ?auto_206144 ) ) ( not ( = ?auto_206140 ?auto_206145 ) ) ( not ( = ?auto_206140 ?auto_206146 ) ) ( not ( = ?auto_206141 ?auto_206142 ) ) ( not ( = ?auto_206141 ?auto_206143 ) ) ( not ( = ?auto_206141 ?auto_206144 ) ) ( not ( = ?auto_206141 ?auto_206145 ) ) ( not ( = ?auto_206141 ?auto_206146 ) ) ( not ( = ?auto_206142 ?auto_206143 ) ) ( not ( = ?auto_206142 ?auto_206144 ) ) ( not ( = ?auto_206142 ?auto_206145 ) ) ( not ( = ?auto_206142 ?auto_206146 ) ) ( not ( = ?auto_206143 ?auto_206144 ) ) ( not ( = ?auto_206143 ?auto_206145 ) ) ( not ( = ?auto_206143 ?auto_206146 ) ) ( not ( = ?auto_206144 ?auto_206145 ) ) ( not ( = ?auto_206144 ?auto_206146 ) ) ( not ( = ?auto_206145 ?auto_206146 ) ) ( CLEAR ?auto_206143 ) ( ON ?auto_206144 ?auto_206145 ) ( CLEAR ?auto_206144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_206138 ?auto_206139 ?auto_206140 ?auto_206141 ?auto_206142 ?auto_206143 ?auto_206144 )
      ( MAKE-8PILE ?auto_206138 ?auto_206139 ?auto_206140 ?auto_206141 ?auto_206142 ?auto_206143 ?auto_206144 ?auto_206145 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_206172 - BLOCK
      ?auto_206173 - BLOCK
      ?auto_206174 - BLOCK
      ?auto_206175 - BLOCK
      ?auto_206176 - BLOCK
      ?auto_206177 - BLOCK
      ?auto_206178 - BLOCK
      ?auto_206179 - BLOCK
    )
    :vars
    (
      ?auto_206180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206179 ?auto_206180 ) ( ON-TABLE ?auto_206172 ) ( ON ?auto_206173 ?auto_206172 ) ( ON ?auto_206174 ?auto_206173 ) ( ON ?auto_206175 ?auto_206174 ) ( ON ?auto_206176 ?auto_206175 ) ( not ( = ?auto_206172 ?auto_206173 ) ) ( not ( = ?auto_206172 ?auto_206174 ) ) ( not ( = ?auto_206172 ?auto_206175 ) ) ( not ( = ?auto_206172 ?auto_206176 ) ) ( not ( = ?auto_206172 ?auto_206177 ) ) ( not ( = ?auto_206172 ?auto_206178 ) ) ( not ( = ?auto_206172 ?auto_206179 ) ) ( not ( = ?auto_206172 ?auto_206180 ) ) ( not ( = ?auto_206173 ?auto_206174 ) ) ( not ( = ?auto_206173 ?auto_206175 ) ) ( not ( = ?auto_206173 ?auto_206176 ) ) ( not ( = ?auto_206173 ?auto_206177 ) ) ( not ( = ?auto_206173 ?auto_206178 ) ) ( not ( = ?auto_206173 ?auto_206179 ) ) ( not ( = ?auto_206173 ?auto_206180 ) ) ( not ( = ?auto_206174 ?auto_206175 ) ) ( not ( = ?auto_206174 ?auto_206176 ) ) ( not ( = ?auto_206174 ?auto_206177 ) ) ( not ( = ?auto_206174 ?auto_206178 ) ) ( not ( = ?auto_206174 ?auto_206179 ) ) ( not ( = ?auto_206174 ?auto_206180 ) ) ( not ( = ?auto_206175 ?auto_206176 ) ) ( not ( = ?auto_206175 ?auto_206177 ) ) ( not ( = ?auto_206175 ?auto_206178 ) ) ( not ( = ?auto_206175 ?auto_206179 ) ) ( not ( = ?auto_206175 ?auto_206180 ) ) ( not ( = ?auto_206176 ?auto_206177 ) ) ( not ( = ?auto_206176 ?auto_206178 ) ) ( not ( = ?auto_206176 ?auto_206179 ) ) ( not ( = ?auto_206176 ?auto_206180 ) ) ( not ( = ?auto_206177 ?auto_206178 ) ) ( not ( = ?auto_206177 ?auto_206179 ) ) ( not ( = ?auto_206177 ?auto_206180 ) ) ( not ( = ?auto_206178 ?auto_206179 ) ) ( not ( = ?auto_206178 ?auto_206180 ) ) ( not ( = ?auto_206179 ?auto_206180 ) ) ( ON ?auto_206178 ?auto_206179 ) ( CLEAR ?auto_206176 ) ( ON ?auto_206177 ?auto_206178 ) ( CLEAR ?auto_206177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_206172 ?auto_206173 ?auto_206174 ?auto_206175 ?auto_206176 ?auto_206177 )
      ( MAKE-8PILE ?auto_206172 ?auto_206173 ?auto_206174 ?auto_206175 ?auto_206176 ?auto_206177 ?auto_206178 ?auto_206179 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_206206 - BLOCK
      ?auto_206207 - BLOCK
      ?auto_206208 - BLOCK
      ?auto_206209 - BLOCK
      ?auto_206210 - BLOCK
      ?auto_206211 - BLOCK
      ?auto_206212 - BLOCK
      ?auto_206213 - BLOCK
    )
    :vars
    (
      ?auto_206214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206213 ?auto_206214 ) ( ON-TABLE ?auto_206206 ) ( ON ?auto_206207 ?auto_206206 ) ( ON ?auto_206208 ?auto_206207 ) ( ON ?auto_206209 ?auto_206208 ) ( not ( = ?auto_206206 ?auto_206207 ) ) ( not ( = ?auto_206206 ?auto_206208 ) ) ( not ( = ?auto_206206 ?auto_206209 ) ) ( not ( = ?auto_206206 ?auto_206210 ) ) ( not ( = ?auto_206206 ?auto_206211 ) ) ( not ( = ?auto_206206 ?auto_206212 ) ) ( not ( = ?auto_206206 ?auto_206213 ) ) ( not ( = ?auto_206206 ?auto_206214 ) ) ( not ( = ?auto_206207 ?auto_206208 ) ) ( not ( = ?auto_206207 ?auto_206209 ) ) ( not ( = ?auto_206207 ?auto_206210 ) ) ( not ( = ?auto_206207 ?auto_206211 ) ) ( not ( = ?auto_206207 ?auto_206212 ) ) ( not ( = ?auto_206207 ?auto_206213 ) ) ( not ( = ?auto_206207 ?auto_206214 ) ) ( not ( = ?auto_206208 ?auto_206209 ) ) ( not ( = ?auto_206208 ?auto_206210 ) ) ( not ( = ?auto_206208 ?auto_206211 ) ) ( not ( = ?auto_206208 ?auto_206212 ) ) ( not ( = ?auto_206208 ?auto_206213 ) ) ( not ( = ?auto_206208 ?auto_206214 ) ) ( not ( = ?auto_206209 ?auto_206210 ) ) ( not ( = ?auto_206209 ?auto_206211 ) ) ( not ( = ?auto_206209 ?auto_206212 ) ) ( not ( = ?auto_206209 ?auto_206213 ) ) ( not ( = ?auto_206209 ?auto_206214 ) ) ( not ( = ?auto_206210 ?auto_206211 ) ) ( not ( = ?auto_206210 ?auto_206212 ) ) ( not ( = ?auto_206210 ?auto_206213 ) ) ( not ( = ?auto_206210 ?auto_206214 ) ) ( not ( = ?auto_206211 ?auto_206212 ) ) ( not ( = ?auto_206211 ?auto_206213 ) ) ( not ( = ?auto_206211 ?auto_206214 ) ) ( not ( = ?auto_206212 ?auto_206213 ) ) ( not ( = ?auto_206212 ?auto_206214 ) ) ( not ( = ?auto_206213 ?auto_206214 ) ) ( ON ?auto_206212 ?auto_206213 ) ( ON ?auto_206211 ?auto_206212 ) ( CLEAR ?auto_206209 ) ( ON ?auto_206210 ?auto_206211 ) ( CLEAR ?auto_206210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_206206 ?auto_206207 ?auto_206208 ?auto_206209 ?auto_206210 )
      ( MAKE-8PILE ?auto_206206 ?auto_206207 ?auto_206208 ?auto_206209 ?auto_206210 ?auto_206211 ?auto_206212 ?auto_206213 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_206240 - BLOCK
      ?auto_206241 - BLOCK
      ?auto_206242 - BLOCK
      ?auto_206243 - BLOCK
      ?auto_206244 - BLOCK
      ?auto_206245 - BLOCK
      ?auto_206246 - BLOCK
      ?auto_206247 - BLOCK
    )
    :vars
    (
      ?auto_206248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206247 ?auto_206248 ) ( ON-TABLE ?auto_206240 ) ( ON ?auto_206241 ?auto_206240 ) ( ON ?auto_206242 ?auto_206241 ) ( not ( = ?auto_206240 ?auto_206241 ) ) ( not ( = ?auto_206240 ?auto_206242 ) ) ( not ( = ?auto_206240 ?auto_206243 ) ) ( not ( = ?auto_206240 ?auto_206244 ) ) ( not ( = ?auto_206240 ?auto_206245 ) ) ( not ( = ?auto_206240 ?auto_206246 ) ) ( not ( = ?auto_206240 ?auto_206247 ) ) ( not ( = ?auto_206240 ?auto_206248 ) ) ( not ( = ?auto_206241 ?auto_206242 ) ) ( not ( = ?auto_206241 ?auto_206243 ) ) ( not ( = ?auto_206241 ?auto_206244 ) ) ( not ( = ?auto_206241 ?auto_206245 ) ) ( not ( = ?auto_206241 ?auto_206246 ) ) ( not ( = ?auto_206241 ?auto_206247 ) ) ( not ( = ?auto_206241 ?auto_206248 ) ) ( not ( = ?auto_206242 ?auto_206243 ) ) ( not ( = ?auto_206242 ?auto_206244 ) ) ( not ( = ?auto_206242 ?auto_206245 ) ) ( not ( = ?auto_206242 ?auto_206246 ) ) ( not ( = ?auto_206242 ?auto_206247 ) ) ( not ( = ?auto_206242 ?auto_206248 ) ) ( not ( = ?auto_206243 ?auto_206244 ) ) ( not ( = ?auto_206243 ?auto_206245 ) ) ( not ( = ?auto_206243 ?auto_206246 ) ) ( not ( = ?auto_206243 ?auto_206247 ) ) ( not ( = ?auto_206243 ?auto_206248 ) ) ( not ( = ?auto_206244 ?auto_206245 ) ) ( not ( = ?auto_206244 ?auto_206246 ) ) ( not ( = ?auto_206244 ?auto_206247 ) ) ( not ( = ?auto_206244 ?auto_206248 ) ) ( not ( = ?auto_206245 ?auto_206246 ) ) ( not ( = ?auto_206245 ?auto_206247 ) ) ( not ( = ?auto_206245 ?auto_206248 ) ) ( not ( = ?auto_206246 ?auto_206247 ) ) ( not ( = ?auto_206246 ?auto_206248 ) ) ( not ( = ?auto_206247 ?auto_206248 ) ) ( ON ?auto_206246 ?auto_206247 ) ( ON ?auto_206245 ?auto_206246 ) ( ON ?auto_206244 ?auto_206245 ) ( CLEAR ?auto_206242 ) ( ON ?auto_206243 ?auto_206244 ) ( CLEAR ?auto_206243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_206240 ?auto_206241 ?auto_206242 ?auto_206243 )
      ( MAKE-8PILE ?auto_206240 ?auto_206241 ?auto_206242 ?auto_206243 ?auto_206244 ?auto_206245 ?auto_206246 ?auto_206247 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_206274 - BLOCK
      ?auto_206275 - BLOCK
      ?auto_206276 - BLOCK
      ?auto_206277 - BLOCK
      ?auto_206278 - BLOCK
      ?auto_206279 - BLOCK
      ?auto_206280 - BLOCK
      ?auto_206281 - BLOCK
    )
    :vars
    (
      ?auto_206282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206281 ?auto_206282 ) ( ON-TABLE ?auto_206274 ) ( ON ?auto_206275 ?auto_206274 ) ( not ( = ?auto_206274 ?auto_206275 ) ) ( not ( = ?auto_206274 ?auto_206276 ) ) ( not ( = ?auto_206274 ?auto_206277 ) ) ( not ( = ?auto_206274 ?auto_206278 ) ) ( not ( = ?auto_206274 ?auto_206279 ) ) ( not ( = ?auto_206274 ?auto_206280 ) ) ( not ( = ?auto_206274 ?auto_206281 ) ) ( not ( = ?auto_206274 ?auto_206282 ) ) ( not ( = ?auto_206275 ?auto_206276 ) ) ( not ( = ?auto_206275 ?auto_206277 ) ) ( not ( = ?auto_206275 ?auto_206278 ) ) ( not ( = ?auto_206275 ?auto_206279 ) ) ( not ( = ?auto_206275 ?auto_206280 ) ) ( not ( = ?auto_206275 ?auto_206281 ) ) ( not ( = ?auto_206275 ?auto_206282 ) ) ( not ( = ?auto_206276 ?auto_206277 ) ) ( not ( = ?auto_206276 ?auto_206278 ) ) ( not ( = ?auto_206276 ?auto_206279 ) ) ( not ( = ?auto_206276 ?auto_206280 ) ) ( not ( = ?auto_206276 ?auto_206281 ) ) ( not ( = ?auto_206276 ?auto_206282 ) ) ( not ( = ?auto_206277 ?auto_206278 ) ) ( not ( = ?auto_206277 ?auto_206279 ) ) ( not ( = ?auto_206277 ?auto_206280 ) ) ( not ( = ?auto_206277 ?auto_206281 ) ) ( not ( = ?auto_206277 ?auto_206282 ) ) ( not ( = ?auto_206278 ?auto_206279 ) ) ( not ( = ?auto_206278 ?auto_206280 ) ) ( not ( = ?auto_206278 ?auto_206281 ) ) ( not ( = ?auto_206278 ?auto_206282 ) ) ( not ( = ?auto_206279 ?auto_206280 ) ) ( not ( = ?auto_206279 ?auto_206281 ) ) ( not ( = ?auto_206279 ?auto_206282 ) ) ( not ( = ?auto_206280 ?auto_206281 ) ) ( not ( = ?auto_206280 ?auto_206282 ) ) ( not ( = ?auto_206281 ?auto_206282 ) ) ( ON ?auto_206280 ?auto_206281 ) ( ON ?auto_206279 ?auto_206280 ) ( ON ?auto_206278 ?auto_206279 ) ( ON ?auto_206277 ?auto_206278 ) ( CLEAR ?auto_206275 ) ( ON ?auto_206276 ?auto_206277 ) ( CLEAR ?auto_206276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_206274 ?auto_206275 ?auto_206276 )
      ( MAKE-8PILE ?auto_206274 ?auto_206275 ?auto_206276 ?auto_206277 ?auto_206278 ?auto_206279 ?auto_206280 ?auto_206281 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_206308 - BLOCK
      ?auto_206309 - BLOCK
      ?auto_206310 - BLOCK
      ?auto_206311 - BLOCK
      ?auto_206312 - BLOCK
      ?auto_206313 - BLOCK
      ?auto_206314 - BLOCK
      ?auto_206315 - BLOCK
    )
    :vars
    (
      ?auto_206316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206315 ?auto_206316 ) ( ON-TABLE ?auto_206308 ) ( not ( = ?auto_206308 ?auto_206309 ) ) ( not ( = ?auto_206308 ?auto_206310 ) ) ( not ( = ?auto_206308 ?auto_206311 ) ) ( not ( = ?auto_206308 ?auto_206312 ) ) ( not ( = ?auto_206308 ?auto_206313 ) ) ( not ( = ?auto_206308 ?auto_206314 ) ) ( not ( = ?auto_206308 ?auto_206315 ) ) ( not ( = ?auto_206308 ?auto_206316 ) ) ( not ( = ?auto_206309 ?auto_206310 ) ) ( not ( = ?auto_206309 ?auto_206311 ) ) ( not ( = ?auto_206309 ?auto_206312 ) ) ( not ( = ?auto_206309 ?auto_206313 ) ) ( not ( = ?auto_206309 ?auto_206314 ) ) ( not ( = ?auto_206309 ?auto_206315 ) ) ( not ( = ?auto_206309 ?auto_206316 ) ) ( not ( = ?auto_206310 ?auto_206311 ) ) ( not ( = ?auto_206310 ?auto_206312 ) ) ( not ( = ?auto_206310 ?auto_206313 ) ) ( not ( = ?auto_206310 ?auto_206314 ) ) ( not ( = ?auto_206310 ?auto_206315 ) ) ( not ( = ?auto_206310 ?auto_206316 ) ) ( not ( = ?auto_206311 ?auto_206312 ) ) ( not ( = ?auto_206311 ?auto_206313 ) ) ( not ( = ?auto_206311 ?auto_206314 ) ) ( not ( = ?auto_206311 ?auto_206315 ) ) ( not ( = ?auto_206311 ?auto_206316 ) ) ( not ( = ?auto_206312 ?auto_206313 ) ) ( not ( = ?auto_206312 ?auto_206314 ) ) ( not ( = ?auto_206312 ?auto_206315 ) ) ( not ( = ?auto_206312 ?auto_206316 ) ) ( not ( = ?auto_206313 ?auto_206314 ) ) ( not ( = ?auto_206313 ?auto_206315 ) ) ( not ( = ?auto_206313 ?auto_206316 ) ) ( not ( = ?auto_206314 ?auto_206315 ) ) ( not ( = ?auto_206314 ?auto_206316 ) ) ( not ( = ?auto_206315 ?auto_206316 ) ) ( ON ?auto_206314 ?auto_206315 ) ( ON ?auto_206313 ?auto_206314 ) ( ON ?auto_206312 ?auto_206313 ) ( ON ?auto_206311 ?auto_206312 ) ( ON ?auto_206310 ?auto_206311 ) ( CLEAR ?auto_206308 ) ( ON ?auto_206309 ?auto_206310 ) ( CLEAR ?auto_206309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_206308 ?auto_206309 )
      ( MAKE-8PILE ?auto_206308 ?auto_206309 ?auto_206310 ?auto_206311 ?auto_206312 ?auto_206313 ?auto_206314 ?auto_206315 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_206342 - BLOCK
      ?auto_206343 - BLOCK
      ?auto_206344 - BLOCK
      ?auto_206345 - BLOCK
      ?auto_206346 - BLOCK
      ?auto_206347 - BLOCK
      ?auto_206348 - BLOCK
      ?auto_206349 - BLOCK
    )
    :vars
    (
      ?auto_206350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206349 ?auto_206350 ) ( not ( = ?auto_206342 ?auto_206343 ) ) ( not ( = ?auto_206342 ?auto_206344 ) ) ( not ( = ?auto_206342 ?auto_206345 ) ) ( not ( = ?auto_206342 ?auto_206346 ) ) ( not ( = ?auto_206342 ?auto_206347 ) ) ( not ( = ?auto_206342 ?auto_206348 ) ) ( not ( = ?auto_206342 ?auto_206349 ) ) ( not ( = ?auto_206342 ?auto_206350 ) ) ( not ( = ?auto_206343 ?auto_206344 ) ) ( not ( = ?auto_206343 ?auto_206345 ) ) ( not ( = ?auto_206343 ?auto_206346 ) ) ( not ( = ?auto_206343 ?auto_206347 ) ) ( not ( = ?auto_206343 ?auto_206348 ) ) ( not ( = ?auto_206343 ?auto_206349 ) ) ( not ( = ?auto_206343 ?auto_206350 ) ) ( not ( = ?auto_206344 ?auto_206345 ) ) ( not ( = ?auto_206344 ?auto_206346 ) ) ( not ( = ?auto_206344 ?auto_206347 ) ) ( not ( = ?auto_206344 ?auto_206348 ) ) ( not ( = ?auto_206344 ?auto_206349 ) ) ( not ( = ?auto_206344 ?auto_206350 ) ) ( not ( = ?auto_206345 ?auto_206346 ) ) ( not ( = ?auto_206345 ?auto_206347 ) ) ( not ( = ?auto_206345 ?auto_206348 ) ) ( not ( = ?auto_206345 ?auto_206349 ) ) ( not ( = ?auto_206345 ?auto_206350 ) ) ( not ( = ?auto_206346 ?auto_206347 ) ) ( not ( = ?auto_206346 ?auto_206348 ) ) ( not ( = ?auto_206346 ?auto_206349 ) ) ( not ( = ?auto_206346 ?auto_206350 ) ) ( not ( = ?auto_206347 ?auto_206348 ) ) ( not ( = ?auto_206347 ?auto_206349 ) ) ( not ( = ?auto_206347 ?auto_206350 ) ) ( not ( = ?auto_206348 ?auto_206349 ) ) ( not ( = ?auto_206348 ?auto_206350 ) ) ( not ( = ?auto_206349 ?auto_206350 ) ) ( ON ?auto_206348 ?auto_206349 ) ( ON ?auto_206347 ?auto_206348 ) ( ON ?auto_206346 ?auto_206347 ) ( ON ?auto_206345 ?auto_206346 ) ( ON ?auto_206344 ?auto_206345 ) ( ON ?auto_206343 ?auto_206344 ) ( ON ?auto_206342 ?auto_206343 ) ( CLEAR ?auto_206342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_206342 )
      ( MAKE-8PILE ?auto_206342 ?auto_206343 ?auto_206344 ?auto_206345 ?auto_206346 ?auto_206347 ?auto_206348 ?auto_206349 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_206377 - BLOCK
      ?auto_206378 - BLOCK
      ?auto_206379 - BLOCK
      ?auto_206380 - BLOCK
      ?auto_206381 - BLOCK
      ?auto_206382 - BLOCK
      ?auto_206383 - BLOCK
      ?auto_206384 - BLOCK
      ?auto_206385 - BLOCK
    )
    :vars
    (
      ?auto_206386 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_206384 ) ( ON ?auto_206385 ?auto_206386 ) ( CLEAR ?auto_206385 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_206377 ) ( ON ?auto_206378 ?auto_206377 ) ( ON ?auto_206379 ?auto_206378 ) ( ON ?auto_206380 ?auto_206379 ) ( ON ?auto_206381 ?auto_206380 ) ( ON ?auto_206382 ?auto_206381 ) ( ON ?auto_206383 ?auto_206382 ) ( ON ?auto_206384 ?auto_206383 ) ( not ( = ?auto_206377 ?auto_206378 ) ) ( not ( = ?auto_206377 ?auto_206379 ) ) ( not ( = ?auto_206377 ?auto_206380 ) ) ( not ( = ?auto_206377 ?auto_206381 ) ) ( not ( = ?auto_206377 ?auto_206382 ) ) ( not ( = ?auto_206377 ?auto_206383 ) ) ( not ( = ?auto_206377 ?auto_206384 ) ) ( not ( = ?auto_206377 ?auto_206385 ) ) ( not ( = ?auto_206377 ?auto_206386 ) ) ( not ( = ?auto_206378 ?auto_206379 ) ) ( not ( = ?auto_206378 ?auto_206380 ) ) ( not ( = ?auto_206378 ?auto_206381 ) ) ( not ( = ?auto_206378 ?auto_206382 ) ) ( not ( = ?auto_206378 ?auto_206383 ) ) ( not ( = ?auto_206378 ?auto_206384 ) ) ( not ( = ?auto_206378 ?auto_206385 ) ) ( not ( = ?auto_206378 ?auto_206386 ) ) ( not ( = ?auto_206379 ?auto_206380 ) ) ( not ( = ?auto_206379 ?auto_206381 ) ) ( not ( = ?auto_206379 ?auto_206382 ) ) ( not ( = ?auto_206379 ?auto_206383 ) ) ( not ( = ?auto_206379 ?auto_206384 ) ) ( not ( = ?auto_206379 ?auto_206385 ) ) ( not ( = ?auto_206379 ?auto_206386 ) ) ( not ( = ?auto_206380 ?auto_206381 ) ) ( not ( = ?auto_206380 ?auto_206382 ) ) ( not ( = ?auto_206380 ?auto_206383 ) ) ( not ( = ?auto_206380 ?auto_206384 ) ) ( not ( = ?auto_206380 ?auto_206385 ) ) ( not ( = ?auto_206380 ?auto_206386 ) ) ( not ( = ?auto_206381 ?auto_206382 ) ) ( not ( = ?auto_206381 ?auto_206383 ) ) ( not ( = ?auto_206381 ?auto_206384 ) ) ( not ( = ?auto_206381 ?auto_206385 ) ) ( not ( = ?auto_206381 ?auto_206386 ) ) ( not ( = ?auto_206382 ?auto_206383 ) ) ( not ( = ?auto_206382 ?auto_206384 ) ) ( not ( = ?auto_206382 ?auto_206385 ) ) ( not ( = ?auto_206382 ?auto_206386 ) ) ( not ( = ?auto_206383 ?auto_206384 ) ) ( not ( = ?auto_206383 ?auto_206385 ) ) ( not ( = ?auto_206383 ?auto_206386 ) ) ( not ( = ?auto_206384 ?auto_206385 ) ) ( not ( = ?auto_206384 ?auto_206386 ) ) ( not ( = ?auto_206385 ?auto_206386 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_206385 ?auto_206386 )
      ( !STACK ?auto_206385 ?auto_206384 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_206415 - BLOCK
      ?auto_206416 - BLOCK
      ?auto_206417 - BLOCK
      ?auto_206418 - BLOCK
      ?auto_206419 - BLOCK
      ?auto_206420 - BLOCK
      ?auto_206421 - BLOCK
      ?auto_206422 - BLOCK
      ?auto_206423 - BLOCK
    )
    :vars
    (
      ?auto_206424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206423 ?auto_206424 ) ( ON-TABLE ?auto_206415 ) ( ON ?auto_206416 ?auto_206415 ) ( ON ?auto_206417 ?auto_206416 ) ( ON ?auto_206418 ?auto_206417 ) ( ON ?auto_206419 ?auto_206418 ) ( ON ?auto_206420 ?auto_206419 ) ( ON ?auto_206421 ?auto_206420 ) ( not ( = ?auto_206415 ?auto_206416 ) ) ( not ( = ?auto_206415 ?auto_206417 ) ) ( not ( = ?auto_206415 ?auto_206418 ) ) ( not ( = ?auto_206415 ?auto_206419 ) ) ( not ( = ?auto_206415 ?auto_206420 ) ) ( not ( = ?auto_206415 ?auto_206421 ) ) ( not ( = ?auto_206415 ?auto_206422 ) ) ( not ( = ?auto_206415 ?auto_206423 ) ) ( not ( = ?auto_206415 ?auto_206424 ) ) ( not ( = ?auto_206416 ?auto_206417 ) ) ( not ( = ?auto_206416 ?auto_206418 ) ) ( not ( = ?auto_206416 ?auto_206419 ) ) ( not ( = ?auto_206416 ?auto_206420 ) ) ( not ( = ?auto_206416 ?auto_206421 ) ) ( not ( = ?auto_206416 ?auto_206422 ) ) ( not ( = ?auto_206416 ?auto_206423 ) ) ( not ( = ?auto_206416 ?auto_206424 ) ) ( not ( = ?auto_206417 ?auto_206418 ) ) ( not ( = ?auto_206417 ?auto_206419 ) ) ( not ( = ?auto_206417 ?auto_206420 ) ) ( not ( = ?auto_206417 ?auto_206421 ) ) ( not ( = ?auto_206417 ?auto_206422 ) ) ( not ( = ?auto_206417 ?auto_206423 ) ) ( not ( = ?auto_206417 ?auto_206424 ) ) ( not ( = ?auto_206418 ?auto_206419 ) ) ( not ( = ?auto_206418 ?auto_206420 ) ) ( not ( = ?auto_206418 ?auto_206421 ) ) ( not ( = ?auto_206418 ?auto_206422 ) ) ( not ( = ?auto_206418 ?auto_206423 ) ) ( not ( = ?auto_206418 ?auto_206424 ) ) ( not ( = ?auto_206419 ?auto_206420 ) ) ( not ( = ?auto_206419 ?auto_206421 ) ) ( not ( = ?auto_206419 ?auto_206422 ) ) ( not ( = ?auto_206419 ?auto_206423 ) ) ( not ( = ?auto_206419 ?auto_206424 ) ) ( not ( = ?auto_206420 ?auto_206421 ) ) ( not ( = ?auto_206420 ?auto_206422 ) ) ( not ( = ?auto_206420 ?auto_206423 ) ) ( not ( = ?auto_206420 ?auto_206424 ) ) ( not ( = ?auto_206421 ?auto_206422 ) ) ( not ( = ?auto_206421 ?auto_206423 ) ) ( not ( = ?auto_206421 ?auto_206424 ) ) ( not ( = ?auto_206422 ?auto_206423 ) ) ( not ( = ?auto_206422 ?auto_206424 ) ) ( not ( = ?auto_206423 ?auto_206424 ) ) ( CLEAR ?auto_206421 ) ( ON ?auto_206422 ?auto_206423 ) ( CLEAR ?auto_206422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_206415 ?auto_206416 ?auto_206417 ?auto_206418 ?auto_206419 ?auto_206420 ?auto_206421 ?auto_206422 )
      ( MAKE-9PILE ?auto_206415 ?auto_206416 ?auto_206417 ?auto_206418 ?auto_206419 ?auto_206420 ?auto_206421 ?auto_206422 ?auto_206423 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_206453 - BLOCK
      ?auto_206454 - BLOCK
      ?auto_206455 - BLOCK
      ?auto_206456 - BLOCK
      ?auto_206457 - BLOCK
      ?auto_206458 - BLOCK
      ?auto_206459 - BLOCK
      ?auto_206460 - BLOCK
      ?auto_206461 - BLOCK
    )
    :vars
    (
      ?auto_206462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206461 ?auto_206462 ) ( ON-TABLE ?auto_206453 ) ( ON ?auto_206454 ?auto_206453 ) ( ON ?auto_206455 ?auto_206454 ) ( ON ?auto_206456 ?auto_206455 ) ( ON ?auto_206457 ?auto_206456 ) ( ON ?auto_206458 ?auto_206457 ) ( not ( = ?auto_206453 ?auto_206454 ) ) ( not ( = ?auto_206453 ?auto_206455 ) ) ( not ( = ?auto_206453 ?auto_206456 ) ) ( not ( = ?auto_206453 ?auto_206457 ) ) ( not ( = ?auto_206453 ?auto_206458 ) ) ( not ( = ?auto_206453 ?auto_206459 ) ) ( not ( = ?auto_206453 ?auto_206460 ) ) ( not ( = ?auto_206453 ?auto_206461 ) ) ( not ( = ?auto_206453 ?auto_206462 ) ) ( not ( = ?auto_206454 ?auto_206455 ) ) ( not ( = ?auto_206454 ?auto_206456 ) ) ( not ( = ?auto_206454 ?auto_206457 ) ) ( not ( = ?auto_206454 ?auto_206458 ) ) ( not ( = ?auto_206454 ?auto_206459 ) ) ( not ( = ?auto_206454 ?auto_206460 ) ) ( not ( = ?auto_206454 ?auto_206461 ) ) ( not ( = ?auto_206454 ?auto_206462 ) ) ( not ( = ?auto_206455 ?auto_206456 ) ) ( not ( = ?auto_206455 ?auto_206457 ) ) ( not ( = ?auto_206455 ?auto_206458 ) ) ( not ( = ?auto_206455 ?auto_206459 ) ) ( not ( = ?auto_206455 ?auto_206460 ) ) ( not ( = ?auto_206455 ?auto_206461 ) ) ( not ( = ?auto_206455 ?auto_206462 ) ) ( not ( = ?auto_206456 ?auto_206457 ) ) ( not ( = ?auto_206456 ?auto_206458 ) ) ( not ( = ?auto_206456 ?auto_206459 ) ) ( not ( = ?auto_206456 ?auto_206460 ) ) ( not ( = ?auto_206456 ?auto_206461 ) ) ( not ( = ?auto_206456 ?auto_206462 ) ) ( not ( = ?auto_206457 ?auto_206458 ) ) ( not ( = ?auto_206457 ?auto_206459 ) ) ( not ( = ?auto_206457 ?auto_206460 ) ) ( not ( = ?auto_206457 ?auto_206461 ) ) ( not ( = ?auto_206457 ?auto_206462 ) ) ( not ( = ?auto_206458 ?auto_206459 ) ) ( not ( = ?auto_206458 ?auto_206460 ) ) ( not ( = ?auto_206458 ?auto_206461 ) ) ( not ( = ?auto_206458 ?auto_206462 ) ) ( not ( = ?auto_206459 ?auto_206460 ) ) ( not ( = ?auto_206459 ?auto_206461 ) ) ( not ( = ?auto_206459 ?auto_206462 ) ) ( not ( = ?auto_206460 ?auto_206461 ) ) ( not ( = ?auto_206460 ?auto_206462 ) ) ( not ( = ?auto_206461 ?auto_206462 ) ) ( ON ?auto_206460 ?auto_206461 ) ( CLEAR ?auto_206458 ) ( ON ?auto_206459 ?auto_206460 ) ( CLEAR ?auto_206459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_206453 ?auto_206454 ?auto_206455 ?auto_206456 ?auto_206457 ?auto_206458 ?auto_206459 )
      ( MAKE-9PILE ?auto_206453 ?auto_206454 ?auto_206455 ?auto_206456 ?auto_206457 ?auto_206458 ?auto_206459 ?auto_206460 ?auto_206461 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_206491 - BLOCK
      ?auto_206492 - BLOCK
      ?auto_206493 - BLOCK
      ?auto_206494 - BLOCK
      ?auto_206495 - BLOCK
      ?auto_206496 - BLOCK
      ?auto_206497 - BLOCK
      ?auto_206498 - BLOCK
      ?auto_206499 - BLOCK
    )
    :vars
    (
      ?auto_206500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206499 ?auto_206500 ) ( ON-TABLE ?auto_206491 ) ( ON ?auto_206492 ?auto_206491 ) ( ON ?auto_206493 ?auto_206492 ) ( ON ?auto_206494 ?auto_206493 ) ( ON ?auto_206495 ?auto_206494 ) ( not ( = ?auto_206491 ?auto_206492 ) ) ( not ( = ?auto_206491 ?auto_206493 ) ) ( not ( = ?auto_206491 ?auto_206494 ) ) ( not ( = ?auto_206491 ?auto_206495 ) ) ( not ( = ?auto_206491 ?auto_206496 ) ) ( not ( = ?auto_206491 ?auto_206497 ) ) ( not ( = ?auto_206491 ?auto_206498 ) ) ( not ( = ?auto_206491 ?auto_206499 ) ) ( not ( = ?auto_206491 ?auto_206500 ) ) ( not ( = ?auto_206492 ?auto_206493 ) ) ( not ( = ?auto_206492 ?auto_206494 ) ) ( not ( = ?auto_206492 ?auto_206495 ) ) ( not ( = ?auto_206492 ?auto_206496 ) ) ( not ( = ?auto_206492 ?auto_206497 ) ) ( not ( = ?auto_206492 ?auto_206498 ) ) ( not ( = ?auto_206492 ?auto_206499 ) ) ( not ( = ?auto_206492 ?auto_206500 ) ) ( not ( = ?auto_206493 ?auto_206494 ) ) ( not ( = ?auto_206493 ?auto_206495 ) ) ( not ( = ?auto_206493 ?auto_206496 ) ) ( not ( = ?auto_206493 ?auto_206497 ) ) ( not ( = ?auto_206493 ?auto_206498 ) ) ( not ( = ?auto_206493 ?auto_206499 ) ) ( not ( = ?auto_206493 ?auto_206500 ) ) ( not ( = ?auto_206494 ?auto_206495 ) ) ( not ( = ?auto_206494 ?auto_206496 ) ) ( not ( = ?auto_206494 ?auto_206497 ) ) ( not ( = ?auto_206494 ?auto_206498 ) ) ( not ( = ?auto_206494 ?auto_206499 ) ) ( not ( = ?auto_206494 ?auto_206500 ) ) ( not ( = ?auto_206495 ?auto_206496 ) ) ( not ( = ?auto_206495 ?auto_206497 ) ) ( not ( = ?auto_206495 ?auto_206498 ) ) ( not ( = ?auto_206495 ?auto_206499 ) ) ( not ( = ?auto_206495 ?auto_206500 ) ) ( not ( = ?auto_206496 ?auto_206497 ) ) ( not ( = ?auto_206496 ?auto_206498 ) ) ( not ( = ?auto_206496 ?auto_206499 ) ) ( not ( = ?auto_206496 ?auto_206500 ) ) ( not ( = ?auto_206497 ?auto_206498 ) ) ( not ( = ?auto_206497 ?auto_206499 ) ) ( not ( = ?auto_206497 ?auto_206500 ) ) ( not ( = ?auto_206498 ?auto_206499 ) ) ( not ( = ?auto_206498 ?auto_206500 ) ) ( not ( = ?auto_206499 ?auto_206500 ) ) ( ON ?auto_206498 ?auto_206499 ) ( ON ?auto_206497 ?auto_206498 ) ( CLEAR ?auto_206495 ) ( ON ?auto_206496 ?auto_206497 ) ( CLEAR ?auto_206496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_206491 ?auto_206492 ?auto_206493 ?auto_206494 ?auto_206495 ?auto_206496 )
      ( MAKE-9PILE ?auto_206491 ?auto_206492 ?auto_206493 ?auto_206494 ?auto_206495 ?auto_206496 ?auto_206497 ?auto_206498 ?auto_206499 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_206529 - BLOCK
      ?auto_206530 - BLOCK
      ?auto_206531 - BLOCK
      ?auto_206532 - BLOCK
      ?auto_206533 - BLOCK
      ?auto_206534 - BLOCK
      ?auto_206535 - BLOCK
      ?auto_206536 - BLOCK
      ?auto_206537 - BLOCK
    )
    :vars
    (
      ?auto_206538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206537 ?auto_206538 ) ( ON-TABLE ?auto_206529 ) ( ON ?auto_206530 ?auto_206529 ) ( ON ?auto_206531 ?auto_206530 ) ( ON ?auto_206532 ?auto_206531 ) ( not ( = ?auto_206529 ?auto_206530 ) ) ( not ( = ?auto_206529 ?auto_206531 ) ) ( not ( = ?auto_206529 ?auto_206532 ) ) ( not ( = ?auto_206529 ?auto_206533 ) ) ( not ( = ?auto_206529 ?auto_206534 ) ) ( not ( = ?auto_206529 ?auto_206535 ) ) ( not ( = ?auto_206529 ?auto_206536 ) ) ( not ( = ?auto_206529 ?auto_206537 ) ) ( not ( = ?auto_206529 ?auto_206538 ) ) ( not ( = ?auto_206530 ?auto_206531 ) ) ( not ( = ?auto_206530 ?auto_206532 ) ) ( not ( = ?auto_206530 ?auto_206533 ) ) ( not ( = ?auto_206530 ?auto_206534 ) ) ( not ( = ?auto_206530 ?auto_206535 ) ) ( not ( = ?auto_206530 ?auto_206536 ) ) ( not ( = ?auto_206530 ?auto_206537 ) ) ( not ( = ?auto_206530 ?auto_206538 ) ) ( not ( = ?auto_206531 ?auto_206532 ) ) ( not ( = ?auto_206531 ?auto_206533 ) ) ( not ( = ?auto_206531 ?auto_206534 ) ) ( not ( = ?auto_206531 ?auto_206535 ) ) ( not ( = ?auto_206531 ?auto_206536 ) ) ( not ( = ?auto_206531 ?auto_206537 ) ) ( not ( = ?auto_206531 ?auto_206538 ) ) ( not ( = ?auto_206532 ?auto_206533 ) ) ( not ( = ?auto_206532 ?auto_206534 ) ) ( not ( = ?auto_206532 ?auto_206535 ) ) ( not ( = ?auto_206532 ?auto_206536 ) ) ( not ( = ?auto_206532 ?auto_206537 ) ) ( not ( = ?auto_206532 ?auto_206538 ) ) ( not ( = ?auto_206533 ?auto_206534 ) ) ( not ( = ?auto_206533 ?auto_206535 ) ) ( not ( = ?auto_206533 ?auto_206536 ) ) ( not ( = ?auto_206533 ?auto_206537 ) ) ( not ( = ?auto_206533 ?auto_206538 ) ) ( not ( = ?auto_206534 ?auto_206535 ) ) ( not ( = ?auto_206534 ?auto_206536 ) ) ( not ( = ?auto_206534 ?auto_206537 ) ) ( not ( = ?auto_206534 ?auto_206538 ) ) ( not ( = ?auto_206535 ?auto_206536 ) ) ( not ( = ?auto_206535 ?auto_206537 ) ) ( not ( = ?auto_206535 ?auto_206538 ) ) ( not ( = ?auto_206536 ?auto_206537 ) ) ( not ( = ?auto_206536 ?auto_206538 ) ) ( not ( = ?auto_206537 ?auto_206538 ) ) ( ON ?auto_206536 ?auto_206537 ) ( ON ?auto_206535 ?auto_206536 ) ( ON ?auto_206534 ?auto_206535 ) ( CLEAR ?auto_206532 ) ( ON ?auto_206533 ?auto_206534 ) ( CLEAR ?auto_206533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_206529 ?auto_206530 ?auto_206531 ?auto_206532 ?auto_206533 )
      ( MAKE-9PILE ?auto_206529 ?auto_206530 ?auto_206531 ?auto_206532 ?auto_206533 ?auto_206534 ?auto_206535 ?auto_206536 ?auto_206537 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_206567 - BLOCK
      ?auto_206568 - BLOCK
      ?auto_206569 - BLOCK
      ?auto_206570 - BLOCK
      ?auto_206571 - BLOCK
      ?auto_206572 - BLOCK
      ?auto_206573 - BLOCK
      ?auto_206574 - BLOCK
      ?auto_206575 - BLOCK
    )
    :vars
    (
      ?auto_206576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206575 ?auto_206576 ) ( ON-TABLE ?auto_206567 ) ( ON ?auto_206568 ?auto_206567 ) ( ON ?auto_206569 ?auto_206568 ) ( not ( = ?auto_206567 ?auto_206568 ) ) ( not ( = ?auto_206567 ?auto_206569 ) ) ( not ( = ?auto_206567 ?auto_206570 ) ) ( not ( = ?auto_206567 ?auto_206571 ) ) ( not ( = ?auto_206567 ?auto_206572 ) ) ( not ( = ?auto_206567 ?auto_206573 ) ) ( not ( = ?auto_206567 ?auto_206574 ) ) ( not ( = ?auto_206567 ?auto_206575 ) ) ( not ( = ?auto_206567 ?auto_206576 ) ) ( not ( = ?auto_206568 ?auto_206569 ) ) ( not ( = ?auto_206568 ?auto_206570 ) ) ( not ( = ?auto_206568 ?auto_206571 ) ) ( not ( = ?auto_206568 ?auto_206572 ) ) ( not ( = ?auto_206568 ?auto_206573 ) ) ( not ( = ?auto_206568 ?auto_206574 ) ) ( not ( = ?auto_206568 ?auto_206575 ) ) ( not ( = ?auto_206568 ?auto_206576 ) ) ( not ( = ?auto_206569 ?auto_206570 ) ) ( not ( = ?auto_206569 ?auto_206571 ) ) ( not ( = ?auto_206569 ?auto_206572 ) ) ( not ( = ?auto_206569 ?auto_206573 ) ) ( not ( = ?auto_206569 ?auto_206574 ) ) ( not ( = ?auto_206569 ?auto_206575 ) ) ( not ( = ?auto_206569 ?auto_206576 ) ) ( not ( = ?auto_206570 ?auto_206571 ) ) ( not ( = ?auto_206570 ?auto_206572 ) ) ( not ( = ?auto_206570 ?auto_206573 ) ) ( not ( = ?auto_206570 ?auto_206574 ) ) ( not ( = ?auto_206570 ?auto_206575 ) ) ( not ( = ?auto_206570 ?auto_206576 ) ) ( not ( = ?auto_206571 ?auto_206572 ) ) ( not ( = ?auto_206571 ?auto_206573 ) ) ( not ( = ?auto_206571 ?auto_206574 ) ) ( not ( = ?auto_206571 ?auto_206575 ) ) ( not ( = ?auto_206571 ?auto_206576 ) ) ( not ( = ?auto_206572 ?auto_206573 ) ) ( not ( = ?auto_206572 ?auto_206574 ) ) ( not ( = ?auto_206572 ?auto_206575 ) ) ( not ( = ?auto_206572 ?auto_206576 ) ) ( not ( = ?auto_206573 ?auto_206574 ) ) ( not ( = ?auto_206573 ?auto_206575 ) ) ( not ( = ?auto_206573 ?auto_206576 ) ) ( not ( = ?auto_206574 ?auto_206575 ) ) ( not ( = ?auto_206574 ?auto_206576 ) ) ( not ( = ?auto_206575 ?auto_206576 ) ) ( ON ?auto_206574 ?auto_206575 ) ( ON ?auto_206573 ?auto_206574 ) ( ON ?auto_206572 ?auto_206573 ) ( ON ?auto_206571 ?auto_206572 ) ( CLEAR ?auto_206569 ) ( ON ?auto_206570 ?auto_206571 ) ( CLEAR ?auto_206570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_206567 ?auto_206568 ?auto_206569 ?auto_206570 )
      ( MAKE-9PILE ?auto_206567 ?auto_206568 ?auto_206569 ?auto_206570 ?auto_206571 ?auto_206572 ?auto_206573 ?auto_206574 ?auto_206575 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_206605 - BLOCK
      ?auto_206606 - BLOCK
      ?auto_206607 - BLOCK
      ?auto_206608 - BLOCK
      ?auto_206609 - BLOCK
      ?auto_206610 - BLOCK
      ?auto_206611 - BLOCK
      ?auto_206612 - BLOCK
      ?auto_206613 - BLOCK
    )
    :vars
    (
      ?auto_206614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206613 ?auto_206614 ) ( ON-TABLE ?auto_206605 ) ( ON ?auto_206606 ?auto_206605 ) ( not ( = ?auto_206605 ?auto_206606 ) ) ( not ( = ?auto_206605 ?auto_206607 ) ) ( not ( = ?auto_206605 ?auto_206608 ) ) ( not ( = ?auto_206605 ?auto_206609 ) ) ( not ( = ?auto_206605 ?auto_206610 ) ) ( not ( = ?auto_206605 ?auto_206611 ) ) ( not ( = ?auto_206605 ?auto_206612 ) ) ( not ( = ?auto_206605 ?auto_206613 ) ) ( not ( = ?auto_206605 ?auto_206614 ) ) ( not ( = ?auto_206606 ?auto_206607 ) ) ( not ( = ?auto_206606 ?auto_206608 ) ) ( not ( = ?auto_206606 ?auto_206609 ) ) ( not ( = ?auto_206606 ?auto_206610 ) ) ( not ( = ?auto_206606 ?auto_206611 ) ) ( not ( = ?auto_206606 ?auto_206612 ) ) ( not ( = ?auto_206606 ?auto_206613 ) ) ( not ( = ?auto_206606 ?auto_206614 ) ) ( not ( = ?auto_206607 ?auto_206608 ) ) ( not ( = ?auto_206607 ?auto_206609 ) ) ( not ( = ?auto_206607 ?auto_206610 ) ) ( not ( = ?auto_206607 ?auto_206611 ) ) ( not ( = ?auto_206607 ?auto_206612 ) ) ( not ( = ?auto_206607 ?auto_206613 ) ) ( not ( = ?auto_206607 ?auto_206614 ) ) ( not ( = ?auto_206608 ?auto_206609 ) ) ( not ( = ?auto_206608 ?auto_206610 ) ) ( not ( = ?auto_206608 ?auto_206611 ) ) ( not ( = ?auto_206608 ?auto_206612 ) ) ( not ( = ?auto_206608 ?auto_206613 ) ) ( not ( = ?auto_206608 ?auto_206614 ) ) ( not ( = ?auto_206609 ?auto_206610 ) ) ( not ( = ?auto_206609 ?auto_206611 ) ) ( not ( = ?auto_206609 ?auto_206612 ) ) ( not ( = ?auto_206609 ?auto_206613 ) ) ( not ( = ?auto_206609 ?auto_206614 ) ) ( not ( = ?auto_206610 ?auto_206611 ) ) ( not ( = ?auto_206610 ?auto_206612 ) ) ( not ( = ?auto_206610 ?auto_206613 ) ) ( not ( = ?auto_206610 ?auto_206614 ) ) ( not ( = ?auto_206611 ?auto_206612 ) ) ( not ( = ?auto_206611 ?auto_206613 ) ) ( not ( = ?auto_206611 ?auto_206614 ) ) ( not ( = ?auto_206612 ?auto_206613 ) ) ( not ( = ?auto_206612 ?auto_206614 ) ) ( not ( = ?auto_206613 ?auto_206614 ) ) ( ON ?auto_206612 ?auto_206613 ) ( ON ?auto_206611 ?auto_206612 ) ( ON ?auto_206610 ?auto_206611 ) ( ON ?auto_206609 ?auto_206610 ) ( ON ?auto_206608 ?auto_206609 ) ( CLEAR ?auto_206606 ) ( ON ?auto_206607 ?auto_206608 ) ( CLEAR ?auto_206607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_206605 ?auto_206606 ?auto_206607 )
      ( MAKE-9PILE ?auto_206605 ?auto_206606 ?auto_206607 ?auto_206608 ?auto_206609 ?auto_206610 ?auto_206611 ?auto_206612 ?auto_206613 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_206643 - BLOCK
      ?auto_206644 - BLOCK
      ?auto_206645 - BLOCK
      ?auto_206646 - BLOCK
      ?auto_206647 - BLOCK
      ?auto_206648 - BLOCK
      ?auto_206649 - BLOCK
      ?auto_206650 - BLOCK
      ?auto_206651 - BLOCK
    )
    :vars
    (
      ?auto_206652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206651 ?auto_206652 ) ( ON-TABLE ?auto_206643 ) ( not ( = ?auto_206643 ?auto_206644 ) ) ( not ( = ?auto_206643 ?auto_206645 ) ) ( not ( = ?auto_206643 ?auto_206646 ) ) ( not ( = ?auto_206643 ?auto_206647 ) ) ( not ( = ?auto_206643 ?auto_206648 ) ) ( not ( = ?auto_206643 ?auto_206649 ) ) ( not ( = ?auto_206643 ?auto_206650 ) ) ( not ( = ?auto_206643 ?auto_206651 ) ) ( not ( = ?auto_206643 ?auto_206652 ) ) ( not ( = ?auto_206644 ?auto_206645 ) ) ( not ( = ?auto_206644 ?auto_206646 ) ) ( not ( = ?auto_206644 ?auto_206647 ) ) ( not ( = ?auto_206644 ?auto_206648 ) ) ( not ( = ?auto_206644 ?auto_206649 ) ) ( not ( = ?auto_206644 ?auto_206650 ) ) ( not ( = ?auto_206644 ?auto_206651 ) ) ( not ( = ?auto_206644 ?auto_206652 ) ) ( not ( = ?auto_206645 ?auto_206646 ) ) ( not ( = ?auto_206645 ?auto_206647 ) ) ( not ( = ?auto_206645 ?auto_206648 ) ) ( not ( = ?auto_206645 ?auto_206649 ) ) ( not ( = ?auto_206645 ?auto_206650 ) ) ( not ( = ?auto_206645 ?auto_206651 ) ) ( not ( = ?auto_206645 ?auto_206652 ) ) ( not ( = ?auto_206646 ?auto_206647 ) ) ( not ( = ?auto_206646 ?auto_206648 ) ) ( not ( = ?auto_206646 ?auto_206649 ) ) ( not ( = ?auto_206646 ?auto_206650 ) ) ( not ( = ?auto_206646 ?auto_206651 ) ) ( not ( = ?auto_206646 ?auto_206652 ) ) ( not ( = ?auto_206647 ?auto_206648 ) ) ( not ( = ?auto_206647 ?auto_206649 ) ) ( not ( = ?auto_206647 ?auto_206650 ) ) ( not ( = ?auto_206647 ?auto_206651 ) ) ( not ( = ?auto_206647 ?auto_206652 ) ) ( not ( = ?auto_206648 ?auto_206649 ) ) ( not ( = ?auto_206648 ?auto_206650 ) ) ( not ( = ?auto_206648 ?auto_206651 ) ) ( not ( = ?auto_206648 ?auto_206652 ) ) ( not ( = ?auto_206649 ?auto_206650 ) ) ( not ( = ?auto_206649 ?auto_206651 ) ) ( not ( = ?auto_206649 ?auto_206652 ) ) ( not ( = ?auto_206650 ?auto_206651 ) ) ( not ( = ?auto_206650 ?auto_206652 ) ) ( not ( = ?auto_206651 ?auto_206652 ) ) ( ON ?auto_206650 ?auto_206651 ) ( ON ?auto_206649 ?auto_206650 ) ( ON ?auto_206648 ?auto_206649 ) ( ON ?auto_206647 ?auto_206648 ) ( ON ?auto_206646 ?auto_206647 ) ( ON ?auto_206645 ?auto_206646 ) ( CLEAR ?auto_206643 ) ( ON ?auto_206644 ?auto_206645 ) ( CLEAR ?auto_206644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_206643 ?auto_206644 )
      ( MAKE-9PILE ?auto_206643 ?auto_206644 ?auto_206645 ?auto_206646 ?auto_206647 ?auto_206648 ?auto_206649 ?auto_206650 ?auto_206651 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_206681 - BLOCK
      ?auto_206682 - BLOCK
      ?auto_206683 - BLOCK
      ?auto_206684 - BLOCK
      ?auto_206685 - BLOCK
      ?auto_206686 - BLOCK
      ?auto_206687 - BLOCK
      ?auto_206688 - BLOCK
      ?auto_206689 - BLOCK
    )
    :vars
    (
      ?auto_206690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206689 ?auto_206690 ) ( not ( = ?auto_206681 ?auto_206682 ) ) ( not ( = ?auto_206681 ?auto_206683 ) ) ( not ( = ?auto_206681 ?auto_206684 ) ) ( not ( = ?auto_206681 ?auto_206685 ) ) ( not ( = ?auto_206681 ?auto_206686 ) ) ( not ( = ?auto_206681 ?auto_206687 ) ) ( not ( = ?auto_206681 ?auto_206688 ) ) ( not ( = ?auto_206681 ?auto_206689 ) ) ( not ( = ?auto_206681 ?auto_206690 ) ) ( not ( = ?auto_206682 ?auto_206683 ) ) ( not ( = ?auto_206682 ?auto_206684 ) ) ( not ( = ?auto_206682 ?auto_206685 ) ) ( not ( = ?auto_206682 ?auto_206686 ) ) ( not ( = ?auto_206682 ?auto_206687 ) ) ( not ( = ?auto_206682 ?auto_206688 ) ) ( not ( = ?auto_206682 ?auto_206689 ) ) ( not ( = ?auto_206682 ?auto_206690 ) ) ( not ( = ?auto_206683 ?auto_206684 ) ) ( not ( = ?auto_206683 ?auto_206685 ) ) ( not ( = ?auto_206683 ?auto_206686 ) ) ( not ( = ?auto_206683 ?auto_206687 ) ) ( not ( = ?auto_206683 ?auto_206688 ) ) ( not ( = ?auto_206683 ?auto_206689 ) ) ( not ( = ?auto_206683 ?auto_206690 ) ) ( not ( = ?auto_206684 ?auto_206685 ) ) ( not ( = ?auto_206684 ?auto_206686 ) ) ( not ( = ?auto_206684 ?auto_206687 ) ) ( not ( = ?auto_206684 ?auto_206688 ) ) ( not ( = ?auto_206684 ?auto_206689 ) ) ( not ( = ?auto_206684 ?auto_206690 ) ) ( not ( = ?auto_206685 ?auto_206686 ) ) ( not ( = ?auto_206685 ?auto_206687 ) ) ( not ( = ?auto_206685 ?auto_206688 ) ) ( not ( = ?auto_206685 ?auto_206689 ) ) ( not ( = ?auto_206685 ?auto_206690 ) ) ( not ( = ?auto_206686 ?auto_206687 ) ) ( not ( = ?auto_206686 ?auto_206688 ) ) ( not ( = ?auto_206686 ?auto_206689 ) ) ( not ( = ?auto_206686 ?auto_206690 ) ) ( not ( = ?auto_206687 ?auto_206688 ) ) ( not ( = ?auto_206687 ?auto_206689 ) ) ( not ( = ?auto_206687 ?auto_206690 ) ) ( not ( = ?auto_206688 ?auto_206689 ) ) ( not ( = ?auto_206688 ?auto_206690 ) ) ( not ( = ?auto_206689 ?auto_206690 ) ) ( ON ?auto_206688 ?auto_206689 ) ( ON ?auto_206687 ?auto_206688 ) ( ON ?auto_206686 ?auto_206687 ) ( ON ?auto_206685 ?auto_206686 ) ( ON ?auto_206684 ?auto_206685 ) ( ON ?auto_206683 ?auto_206684 ) ( ON ?auto_206682 ?auto_206683 ) ( ON ?auto_206681 ?auto_206682 ) ( CLEAR ?auto_206681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_206681 )
      ( MAKE-9PILE ?auto_206681 ?auto_206682 ?auto_206683 ?auto_206684 ?auto_206685 ?auto_206686 ?auto_206687 ?auto_206688 ?auto_206689 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_206720 - BLOCK
      ?auto_206721 - BLOCK
      ?auto_206722 - BLOCK
      ?auto_206723 - BLOCK
      ?auto_206724 - BLOCK
      ?auto_206725 - BLOCK
      ?auto_206726 - BLOCK
      ?auto_206727 - BLOCK
      ?auto_206728 - BLOCK
      ?auto_206729 - BLOCK
    )
    :vars
    (
      ?auto_206730 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_206728 ) ( ON ?auto_206729 ?auto_206730 ) ( CLEAR ?auto_206729 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_206720 ) ( ON ?auto_206721 ?auto_206720 ) ( ON ?auto_206722 ?auto_206721 ) ( ON ?auto_206723 ?auto_206722 ) ( ON ?auto_206724 ?auto_206723 ) ( ON ?auto_206725 ?auto_206724 ) ( ON ?auto_206726 ?auto_206725 ) ( ON ?auto_206727 ?auto_206726 ) ( ON ?auto_206728 ?auto_206727 ) ( not ( = ?auto_206720 ?auto_206721 ) ) ( not ( = ?auto_206720 ?auto_206722 ) ) ( not ( = ?auto_206720 ?auto_206723 ) ) ( not ( = ?auto_206720 ?auto_206724 ) ) ( not ( = ?auto_206720 ?auto_206725 ) ) ( not ( = ?auto_206720 ?auto_206726 ) ) ( not ( = ?auto_206720 ?auto_206727 ) ) ( not ( = ?auto_206720 ?auto_206728 ) ) ( not ( = ?auto_206720 ?auto_206729 ) ) ( not ( = ?auto_206720 ?auto_206730 ) ) ( not ( = ?auto_206721 ?auto_206722 ) ) ( not ( = ?auto_206721 ?auto_206723 ) ) ( not ( = ?auto_206721 ?auto_206724 ) ) ( not ( = ?auto_206721 ?auto_206725 ) ) ( not ( = ?auto_206721 ?auto_206726 ) ) ( not ( = ?auto_206721 ?auto_206727 ) ) ( not ( = ?auto_206721 ?auto_206728 ) ) ( not ( = ?auto_206721 ?auto_206729 ) ) ( not ( = ?auto_206721 ?auto_206730 ) ) ( not ( = ?auto_206722 ?auto_206723 ) ) ( not ( = ?auto_206722 ?auto_206724 ) ) ( not ( = ?auto_206722 ?auto_206725 ) ) ( not ( = ?auto_206722 ?auto_206726 ) ) ( not ( = ?auto_206722 ?auto_206727 ) ) ( not ( = ?auto_206722 ?auto_206728 ) ) ( not ( = ?auto_206722 ?auto_206729 ) ) ( not ( = ?auto_206722 ?auto_206730 ) ) ( not ( = ?auto_206723 ?auto_206724 ) ) ( not ( = ?auto_206723 ?auto_206725 ) ) ( not ( = ?auto_206723 ?auto_206726 ) ) ( not ( = ?auto_206723 ?auto_206727 ) ) ( not ( = ?auto_206723 ?auto_206728 ) ) ( not ( = ?auto_206723 ?auto_206729 ) ) ( not ( = ?auto_206723 ?auto_206730 ) ) ( not ( = ?auto_206724 ?auto_206725 ) ) ( not ( = ?auto_206724 ?auto_206726 ) ) ( not ( = ?auto_206724 ?auto_206727 ) ) ( not ( = ?auto_206724 ?auto_206728 ) ) ( not ( = ?auto_206724 ?auto_206729 ) ) ( not ( = ?auto_206724 ?auto_206730 ) ) ( not ( = ?auto_206725 ?auto_206726 ) ) ( not ( = ?auto_206725 ?auto_206727 ) ) ( not ( = ?auto_206725 ?auto_206728 ) ) ( not ( = ?auto_206725 ?auto_206729 ) ) ( not ( = ?auto_206725 ?auto_206730 ) ) ( not ( = ?auto_206726 ?auto_206727 ) ) ( not ( = ?auto_206726 ?auto_206728 ) ) ( not ( = ?auto_206726 ?auto_206729 ) ) ( not ( = ?auto_206726 ?auto_206730 ) ) ( not ( = ?auto_206727 ?auto_206728 ) ) ( not ( = ?auto_206727 ?auto_206729 ) ) ( not ( = ?auto_206727 ?auto_206730 ) ) ( not ( = ?auto_206728 ?auto_206729 ) ) ( not ( = ?auto_206728 ?auto_206730 ) ) ( not ( = ?auto_206729 ?auto_206730 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_206729 ?auto_206730 )
      ( !STACK ?auto_206729 ?auto_206728 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_206762 - BLOCK
      ?auto_206763 - BLOCK
      ?auto_206764 - BLOCK
      ?auto_206765 - BLOCK
      ?auto_206766 - BLOCK
      ?auto_206767 - BLOCK
      ?auto_206768 - BLOCK
      ?auto_206769 - BLOCK
      ?auto_206770 - BLOCK
      ?auto_206771 - BLOCK
    )
    :vars
    (
      ?auto_206772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206771 ?auto_206772 ) ( ON-TABLE ?auto_206762 ) ( ON ?auto_206763 ?auto_206762 ) ( ON ?auto_206764 ?auto_206763 ) ( ON ?auto_206765 ?auto_206764 ) ( ON ?auto_206766 ?auto_206765 ) ( ON ?auto_206767 ?auto_206766 ) ( ON ?auto_206768 ?auto_206767 ) ( ON ?auto_206769 ?auto_206768 ) ( not ( = ?auto_206762 ?auto_206763 ) ) ( not ( = ?auto_206762 ?auto_206764 ) ) ( not ( = ?auto_206762 ?auto_206765 ) ) ( not ( = ?auto_206762 ?auto_206766 ) ) ( not ( = ?auto_206762 ?auto_206767 ) ) ( not ( = ?auto_206762 ?auto_206768 ) ) ( not ( = ?auto_206762 ?auto_206769 ) ) ( not ( = ?auto_206762 ?auto_206770 ) ) ( not ( = ?auto_206762 ?auto_206771 ) ) ( not ( = ?auto_206762 ?auto_206772 ) ) ( not ( = ?auto_206763 ?auto_206764 ) ) ( not ( = ?auto_206763 ?auto_206765 ) ) ( not ( = ?auto_206763 ?auto_206766 ) ) ( not ( = ?auto_206763 ?auto_206767 ) ) ( not ( = ?auto_206763 ?auto_206768 ) ) ( not ( = ?auto_206763 ?auto_206769 ) ) ( not ( = ?auto_206763 ?auto_206770 ) ) ( not ( = ?auto_206763 ?auto_206771 ) ) ( not ( = ?auto_206763 ?auto_206772 ) ) ( not ( = ?auto_206764 ?auto_206765 ) ) ( not ( = ?auto_206764 ?auto_206766 ) ) ( not ( = ?auto_206764 ?auto_206767 ) ) ( not ( = ?auto_206764 ?auto_206768 ) ) ( not ( = ?auto_206764 ?auto_206769 ) ) ( not ( = ?auto_206764 ?auto_206770 ) ) ( not ( = ?auto_206764 ?auto_206771 ) ) ( not ( = ?auto_206764 ?auto_206772 ) ) ( not ( = ?auto_206765 ?auto_206766 ) ) ( not ( = ?auto_206765 ?auto_206767 ) ) ( not ( = ?auto_206765 ?auto_206768 ) ) ( not ( = ?auto_206765 ?auto_206769 ) ) ( not ( = ?auto_206765 ?auto_206770 ) ) ( not ( = ?auto_206765 ?auto_206771 ) ) ( not ( = ?auto_206765 ?auto_206772 ) ) ( not ( = ?auto_206766 ?auto_206767 ) ) ( not ( = ?auto_206766 ?auto_206768 ) ) ( not ( = ?auto_206766 ?auto_206769 ) ) ( not ( = ?auto_206766 ?auto_206770 ) ) ( not ( = ?auto_206766 ?auto_206771 ) ) ( not ( = ?auto_206766 ?auto_206772 ) ) ( not ( = ?auto_206767 ?auto_206768 ) ) ( not ( = ?auto_206767 ?auto_206769 ) ) ( not ( = ?auto_206767 ?auto_206770 ) ) ( not ( = ?auto_206767 ?auto_206771 ) ) ( not ( = ?auto_206767 ?auto_206772 ) ) ( not ( = ?auto_206768 ?auto_206769 ) ) ( not ( = ?auto_206768 ?auto_206770 ) ) ( not ( = ?auto_206768 ?auto_206771 ) ) ( not ( = ?auto_206768 ?auto_206772 ) ) ( not ( = ?auto_206769 ?auto_206770 ) ) ( not ( = ?auto_206769 ?auto_206771 ) ) ( not ( = ?auto_206769 ?auto_206772 ) ) ( not ( = ?auto_206770 ?auto_206771 ) ) ( not ( = ?auto_206770 ?auto_206772 ) ) ( not ( = ?auto_206771 ?auto_206772 ) ) ( CLEAR ?auto_206769 ) ( ON ?auto_206770 ?auto_206771 ) ( CLEAR ?auto_206770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_206762 ?auto_206763 ?auto_206764 ?auto_206765 ?auto_206766 ?auto_206767 ?auto_206768 ?auto_206769 ?auto_206770 )
      ( MAKE-10PILE ?auto_206762 ?auto_206763 ?auto_206764 ?auto_206765 ?auto_206766 ?auto_206767 ?auto_206768 ?auto_206769 ?auto_206770 ?auto_206771 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_206804 - BLOCK
      ?auto_206805 - BLOCK
      ?auto_206806 - BLOCK
      ?auto_206807 - BLOCK
      ?auto_206808 - BLOCK
      ?auto_206809 - BLOCK
      ?auto_206810 - BLOCK
      ?auto_206811 - BLOCK
      ?auto_206812 - BLOCK
      ?auto_206813 - BLOCK
    )
    :vars
    (
      ?auto_206814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206813 ?auto_206814 ) ( ON-TABLE ?auto_206804 ) ( ON ?auto_206805 ?auto_206804 ) ( ON ?auto_206806 ?auto_206805 ) ( ON ?auto_206807 ?auto_206806 ) ( ON ?auto_206808 ?auto_206807 ) ( ON ?auto_206809 ?auto_206808 ) ( ON ?auto_206810 ?auto_206809 ) ( not ( = ?auto_206804 ?auto_206805 ) ) ( not ( = ?auto_206804 ?auto_206806 ) ) ( not ( = ?auto_206804 ?auto_206807 ) ) ( not ( = ?auto_206804 ?auto_206808 ) ) ( not ( = ?auto_206804 ?auto_206809 ) ) ( not ( = ?auto_206804 ?auto_206810 ) ) ( not ( = ?auto_206804 ?auto_206811 ) ) ( not ( = ?auto_206804 ?auto_206812 ) ) ( not ( = ?auto_206804 ?auto_206813 ) ) ( not ( = ?auto_206804 ?auto_206814 ) ) ( not ( = ?auto_206805 ?auto_206806 ) ) ( not ( = ?auto_206805 ?auto_206807 ) ) ( not ( = ?auto_206805 ?auto_206808 ) ) ( not ( = ?auto_206805 ?auto_206809 ) ) ( not ( = ?auto_206805 ?auto_206810 ) ) ( not ( = ?auto_206805 ?auto_206811 ) ) ( not ( = ?auto_206805 ?auto_206812 ) ) ( not ( = ?auto_206805 ?auto_206813 ) ) ( not ( = ?auto_206805 ?auto_206814 ) ) ( not ( = ?auto_206806 ?auto_206807 ) ) ( not ( = ?auto_206806 ?auto_206808 ) ) ( not ( = ?auto_206806 ?auto_206809 ) ) ( not ( = ?auto_206806 ?auto_206810 ) ) ( not ( = ?auto_206806 ?auto_206811 ) ) ( not ( = ?auto_206806 ?auto_206812 ) ) ( not ( = ?auto_206806 ?auto_206813 ) ) ( not ( = ?auto_206806 ?auto_206814 ) ) ( not ( = ?auto_206807 ?auto_206808 ) ) ( not ( = ?auto_206807 ?auto_206809 ) ) ( not ( = ?auto_206807 ?auto_206810 ) ) ( not ( = ?auto_206807 ?auto_206811 ) ) ( not ( = ?auto_206807 ?auto_206812 ) ) ( not ( = ?auto_206807 ?auto_206813 ) ) ( not ( = ?auto_206807 ?auto_206814 ) ) ( not ( = ?auto_206808 ?auto_206809 ) ) ( not ( = ?auto_206808 ?auto_206810 ) ) ( not ( = ?auto_206808 ?auto_206811 ) ) ( not ( = ?auto_206808 ?auto_206812 ) ) ( not ( = ?auto_206808 ?auto_206813 ) ) ( not ( = ?auto_206808 ?auto_206814 ) ) ( not ( = ?auto_206809 ?auto_206810 ) ) ( not ( = ?auto_206809 ?auto_206811 ) ) ( not ( = ?auto_206809 ?auto_206812 ) ) ( not ( = ?auto_206809 ?auto_206813 ) ) ( not ( = ?auto_206809 ?auto_206814 ) ) ( not ( = ?auto_206810 ?auto_206811 ) ) ( not ( = ?auto_206810 ?auto_206812 ) ) ( not ( = ?auto_206810 ?auto_206813 ) ) ( not ( = ?auto_206810 ?auto_206814 ) ) ( not ( = ?auto_206811 ?auto_206812 ) ) ( not ( = ?auto_206811 ?auto_206813 ) ) ( not ( = ?auto_206811 ?auto_206814 ) ) ( not ( = ?auto_206812 ?auto_206813 ) ) ( not ( = ?auto_206812 ?auto_206814 ) ) ( not ( = ?auto_206813 ?auto_206814 ) ) ( ON ?auto_206812 ?auto_206813 ) ( CLEAR ?auto_206810 ) ( ON ?auto_206811 ?auto_206812 ) ( CLEAR ?auto_206811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_206804 ?auto_206805 ?auto_206806 ?auto_206807 ?auto_206808 ?auto_206809 ?auto_206810 ?auto_206811 )
      ( MAKE-10PILE ?auto_206804 ?auto_206805 ?auto_206806 ?auto_206807 ?auto_206808 ?auto_206809 ?auto_206810 ?auto_206811 ?auto_206812 ?auto_206813 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_206846 - BLOCK
      ?auto_206847 - BLOCK
      ?auto_206848 - BLOCK
      ?auto_206849 - BLOCK
      ?auto_206850 - BLOCK
      ?auto_206851 - BLOCK
      ?auto_206852 - BLOCK
      ?auto_206853 - BLOCK
      ?auto_206854 - BLOCK
      ?auto_206855 - BLOCK
    )
    :vars
    (
      ?auto_206856 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206855 ?auto_206856 ) ( ON-TABLE ?auto_206846 ) ( ON ?auto_206847 ?auto_206846 ) ( ON ?auto_206848 ?auto_206847 ) ( ON ?auto_206849 ?auto_206848 ) ( ON ?auto_206850 ?auto_206849 ) ( ON ?auto_206851 ?auto_206850 ) ( not ( = ?auto_206846 ?auto_206847 ) ) ( not ( = ?auto_206846 ?auto_206848 ) ) ( not ( = ?auto_206846 ?auto_206849 ) ) ( not ( = ?auto_206846 ?auto_206850 ) ) ( not ( = ?auto_206846 ?auto_206851 ) ) ( not ( = ?auto_206846 ?auto_206852 ) ) ( not ( = ?auto_206846 ?auto_206853 ) ) ( not ( = ?auto_206846 ?auto_206854 ) ) ( not ( = ?auto_206846 ?auto_206855 ) ) ( not ( = ?auto_206846 ?auto_206856 ) ) ( not ( = ?auto_206847 ?auto_206848 ) ) ( not ( = ?auto_206847 ?auto_206849 ) ) ( not ( = ?auto_206847 ?auto_206850 ) ) ( not ( = ?auto_206847 ?auto_206851 ) ) ( not ( = ?auto_206847 ?auto_206852 ) ) ( not ( = ?auto_206847 ?auto_206853 ) ) ( not ( = ?auto_206847 ?auto_206854 ) ) ( not ( = ?auto_206847 ?auto_206855 ) ) ( not ( = ?auto_206847 ?auto_206856 ) ) ( not ( = ?auto_206848 ?auto_206849 ) ) ( not ( = ?auto_206848 ?auto_206850 ) ) ( not ( = ?auto_206848 ?auto_206851 ) ) ( not ( = ?auto_206848 ?auto_206852 ) ) ( not ( = ?auto_206848 ?auto_206853 ) ) ( not ( = ?auto_206848 ?auto_206854 ) ) ( not ( = ?auto_206848 ?auto_206855 ) ) ( not ( = ?auto_206848 ?auto_206856 ) ) ( not ( = ?auto_206849 ?auto_206850 ) ) ( not ( = ?auto_206849 ?auto_206851 ) ) ( not ( = ?auto_206849 ?auto_206852 ) ) ( not ( = ?auto_206849 ?auto_206853 ) ) ( not ( = ?auto_206849 ?auto_206854 ) ) ( not ( = ?auto_206849 ?auto_206855 ) ) ( not ( = ?auto_206849 ?auto_206856 ) ) ( not ( = ?auto_206850 ?auto_206851 ) ) ( not ( = ?auto_206850 ?auto_206852 ) ) ( not ( = ?auto_206850 ?auto_206853 ) ) ( not ( = ?auto_206850 ?auto_206854 ) ) ( not ( = ?auto_206850 ?auto_206855 ) ) ( not ( = ?auto_206850 ?auto_206856 ) ) ( not ( = ?auto_206851 ?auto_206852 ) ) ( not ( = ?auto_206851 ?auto_206853 ) ) ( not ( = ?auto_206851 ?auto_206854 ) ) ( not ( = ?auto_206851 ?auto_206855 ) ) ( not ( = ?auto_206851 ?auto_206856 ) ) ( not ( = ?auto_206852 ?auto_206853 ) ) ( not ( = ?auto_206852 ?auto_206854 ) ) ( not ( = ?auto_206852 ?auto_206855 ) ) ( not ( = ?auto_206852 ?auto_206856 ) ) ( not ( = ?auto_206853 ?auto_206854 ) ) ( not ( = ?auto_206853 ?auto_206855 ) ) ( not ( = ?auto_206853 ?auto_206856 ) ) ( not ( = ?auto_206854 ?auto_206855 ) ) ( not ( = ?auto_206854 ?auto_206856 ) ) ( not ( = ?auto_206855 ?auto_206856 ) ) ( ON ?auto_206854 ?auto_206855 ) ( ON ?auto_206853 ?auto_206854 ) ( CLEAR ?auto_206851 ) ( ON ?auto_206852 ?auto_206853 ) ( CLEAR ?auto_206852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_206846 ?auto_206847 ?auto_206848 ?auto_206849 ?auto_206850 ?auto_206851 ?auto_206852 )
      ( MAKE-10PILE ?auto_206846 ?auto_206847 ?auto_206848 ?auto_206849 ?auto_206850 ?auto_206851 ?auto_206852 ?auto_206853 ?auto_206854 ?auto_206855 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_206888 - BLOCK
      ?auto_206889 - BLOCK
      ?auto_206890 - BLOCK
      ?auto_206891 - BLOCK
      ?auto_206892 - BLOCK
      ?auto_206893 - BLOCK
      ?auto_206894 - BLOCK
      ?auto_206895 - BLOCK
      ?auto_206896 - BLOCK
      ?auto_206897 - BLOCK
    )
    :vars
    (
      ?auto_206898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206897 ?auto_206898 ) ( ON-TABLE ?auto_206888 ) ( ON ?auto_206889 ?auto_206888 ) ( ON ?auto_206890 ?auto_206889 ) ( ON ?auto_206891 ?auto_206890 ) ( ON ?auto_206892 ?auto_206891 ) ( not ( = ?auto_206888 ?auto_206889 ) ) ( not ( = ?auto_206888 ?auto_206890 ) ) ( not ( = ?auto_206888 ?auto_206891 ) ) ( not ( = ?auto_206888 ?auto_206892 ) ) ( not ( = ?auto_206888 ?auto_206893 ) ) ( not ( = ?auto_206888 ?auto_206894 ) ) ( not ( = ?auto_206888 ?auto_206895 ) ) ( not ( = ?auto_206888 ?auto_206896 ) ) ( not ( = ?auto_206888 ?auto_206897 ) ) ( not ( = ?auto_206888 ?auto_206898 ) ) ( not ( = ?auto_206889 ?auto_206890 ) ) ( not ( = ?auto_206889 ?auto_206891 ) ) ( not ( = ?auto_206889 ?auto_206892 ) ) ( not ( = ?auto_206889 ?auto_206893 ) ) ( not ( = ?auto_206889 ?auto_206894 ) ) ( not ( = ?auto_206889 ?auto_206895 ) ) ( not ( = ?auto_206889 ?auto_206896 ) ) ( not ( = ?auto_206889 ?auto_206897 ) ) ( not ( = ?auto_206889 ?auto_206898 ) ) ( not ( = ?auto_206890 ?auto_206891 ) ) ( not ( = ?auto_206890 ?auto_206892 ) ) ( not ( = ?auto_206890 ?auto_206893 ) ) ( not ( = ?auto_206890 ?auto_206894 ) ) ( not ( = ?auto_206890 ?auto_206895 ) ) ( not ( = ?auto_206890 ?auto_206896 ) ) ( not ( = ?auto_206890 ?auto_206897 ) ) ( not ( = ?auto_206890 ?auto_206898 ) ) ( not ( = ?auto_206891 ?auto_206892 ) ) ( not ( = ?auto_206891 ?auto_206893 ) ) ( not ( = ?auto_206891 ?auto_206894 ) ) ( not ( = ?auto_206891 ?auto_206895 ) ) ( not ( = ?auto_206891 ?auto_206896 ) ) ( not ( = ?auto_206891 ?auto_206897 ) ) ( not ( = ?auto_206891 ?auto_206898 ) ) ( not ( = ?auto_206892 ?auto_206893 ) ) ( not ( = ?auto_206892 ?auto_206894 ) ) ( not ( = ?auto_206892 ?auto_206895 ) ) ( not ( = ?auto_206892 ?auto_206896 ) ) ( not ( = ?auto_206892 ?auto_206897 ) ) ( not ( = ?auto_206892 ?auto_206898 ) ) ( not ( = ?auto_206893 ?auto_206894 ) ) ( not ( = ?auto_206893 ?auto_206895 ) ) ( not ( = ?auto_206893 ?auto_206896 ) ) ( not ( = ?auto_206893 ?auto_206897 ) ) ( not ( = ?auto_206893 ?auto_206898 ) ) ( not ( = ?auto_206894 ?auto_206895 ) ) ( not ( = ?auto_206894 ?auto_206896 ) ) ( not ( = ?auto_206894 ?auto_206897 ) ) ( not ( = ?auto_206894 ?auto_206898 ) ) ( not ( = ?auto_206895 ?auto_206896 ) ) ( not ( = ?auto_206895 ?auto_206897 ) ) ( not ( = ?auto_206895 ?auto_206898 ) ) ( not ( = ?auto_206896 ?auto_206897 ) ) ( not ( = ?auto_206896 ?auto_206898 ) ) ( not ( = ?auto_206897 ?auto_206898 ) ) ( ON ?auto_206896 ?auto_206897 ) ( ON ?auto_206895 ?auto_206896 ) ( ON ?auto_206894 ?auto_206895 ) ( CLEAR ?auto_206892 ) ( ON ?auto_206893 ?auto_206894 ) ( CLEAR ?auto_206893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_206888 ?auto_206889 ?auto_206890 ?auto_206891 ?auto_206892 ?auto_206893 )
      ( MAKE-10PILE ?auto_206888 ?auto_206889 ?auto_206890 ?auto_206891 ?auto_206892 ?auto_206893 ?auto_206894 ?auto_206895 ?auto_206896 ?auto_206897 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_206930 - BLOCK
      ?auto_206931 - BLOCK
      ?auto_206932 - BLOCK
      ?auto_206933 - BLOCK
      ?auto_206934 - BLOCK
      ?auto_206935 - BLOCK
      ?auto_206936 - BLOCK
      ?auto_206937 - BLOCK
      ?auto_206938 - BLOCK
      ?auto_206939 - BLOCK
    )
    :vars
    (
      ?auto_206940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206939 ?auto_206940 ) ( ON-TABLE ?auto_206930 ) ( ON ?auto_206931 ?auto_206930 ) ( ON ?auto_206932 ?auto_206931 ) ( ON ?auto_206933 ?auto_206932 ) ( not ( = ?auto_206930 ?auto_206931 ) ) ( not ( = ?auto_206930 ?auto_206932 ) ) ( not ( = ?auto_206930 ?auto_206933 ) ) ( not ( = ?auto_206930 ?auto_206934 ) ) ( not ( = ?auto_206930 ?auto_206935 ) ) ( not ( = ?auto_206930 ?auto_206936 ) ) ( not ( = ?auto_206930 ?auto_206937 ) ) ( not ( = ?auto_206930 ?auto_206938 ) ) ( not ( = ?auto_206930 ?auto_206939 ) ) ( not ( = ?auto_206930 ?auto_206940 ) ) ( not ( = ?auto_206931 ?auto_206932 ) ) ( not ( = ?auto_206931 ?auto_206933 ) ) ( not ( = ?auto_206931 ?auto_206934 ) ) ( not ( = ?auto_206931 ?auto_206935 ) ) ( not ( = ?auto_206931 ?auto_206936 ) ) ( not ( = ?auto_206931 ?auto_206937 ) ) ( not ( = ?auto_206931 ?auto_206938 ) ) ( not ( = ?auto_206931 ?auto_206939 ) ) ( not ( = ?auto_206931 ?auto_206940 ) ) ( not ( = ?auto_206932 ?auto_206933 ) ) ( not ( = ?auto_206932 ?auto_206934 ) ) ( not ( = ?auto_206932 ?auto_206935 ) ) ( not ( = ?auto_206932 ?auto_206936 ) ) ( not ( = ?auto_206932 ?auto_206937 ) ) ( not ( = ?auto_206932 ?auto_206938 ) ) ( not ( = ?auto_206932 ?auto_206939 ) ) ( not ( = ?auto_206932 ?auto_206940 ) ) ( not ( = ?auto_206933 ?auto_206934 ) ) ( not ( = ?auto_206933 ?auto_206935 ) ) ( not ( = ?auto_206933 ?auto_206936 ) ) ( not ( = ?auto_206933 ?auto_206937 ) ) ( not ( = ?auto_206933 ?auto_206938 ) ) ( not ( = ?auto_206933 ?auto_206939 ) ) ( not ( = ?auto_206933 ?auto_206940 ) ) ( not ( = ?auto_206934 ?auto_206935 ) ) ( not ( = ?auto_206934 ?auto_206936 ) ) ( not ( = ?auto_206934 ?auto_206937 ) ) ( not ( = ?auto_206934 ?auto_206938 ) ) ( not ( = ?auto_206934 ?auto_206939 ) ) ( not ( = ?auto_206934 ?auto_206940 ) ) ( not ( = ?auto_206935 ?auto_206936 ) ) ( not ( = ?auto_206935 ?auto_206937 ) ) ( not ( = ?auto_206935 ?auto_206938 ) ) ( not ( = ?auto_206935 ?auto_206939 ) ) ( not ( = ?auto_206935 ?auto_206940 ) ) ( not ( = ?auto_206936 ?auto_206937 ) ) ( not ( = ?auto_206936 ?auto_206938 ) ) ( not ( = ?auto_206936 ?auto_206939 ) ) ( not ( = ?auto_206936 ?auto_206940 ) ) ( not ( = ?auto_206937 ?auto_206938 ) ) ( not ( = ?auto_206937 ?auto_206939 ) ) ( not ( = ?auto_206937 ?auto_206940 ) ) ( not ( = ?auto_206938 ?auto_206939 ) ) ( not ( = ?auto_206938 ?auto_206940 ) ) ( not ( = ?auto_206939 ?auto_206940 ) ) ( ON ?auto_206938 ?auto_206939 ) ( ON ?auto_206937 ?auto_206938 ) ( ON ?auto_206936 ?auto_206937 ) ( ON ?auto_206935 ?auto_206936 ) ( CLEAR ?auto_206933 ) ( ON ?auto_206934 ?auto_206935 ) ( CLEAR ?auto_206934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_206930 ?auto_206931 ?auto_206932 ?auto_206933 ?auto_206934 )
      ( MAKE-10PILE ?auto_206930 ?auto_206931 ?auto_206932 ?auto_206933 ?auto_206934 ?auto_206935 ?auto_206936 ?auto_206937 ?auto_206938 ?auto_206939 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_206972 - BLOCK
      ?auto_206973 - BLOCK
      ?auto_206974 - BLOCK
      ?auto_206975 - BLOCK
      ?auto_206976 - BLOCK
      ?auto_206977 - BLOCK
      ?auto_206978 - BLOCK
      ?auto_206979 - BLOCK
      ?auto_206980 - BLOCK
      ?auto_206981 - BLOCK
    )
    :vars
    (
      ?auto_206982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206981 ?auto_206982 ) ( ON-TABLE ?auto_206972 ) ( ON ?auto_206973 ?auto_206972 ) ( ON ?auto_206974 ?auto_206973 ) ( not ( = ?auto_206972 ?auto_206973 ) ) ( not ( = ?auto_206972 ?auto_206974 ) ) ( not ( = ?auto_206972 ?auto_206975 ) ) ( not ( = ?auto_206972 ?auto_206976 ) ) ( not ( = ?auto_206972 ?auto_206977 ) ) ( not ( = ?auto_206972 ?auto_206978 ) ) ( not ( = ?auto_206972 ?auto_206979 ) ) ( not ( = ?auto_206972 ?auto_206980 ) ) ( not ( = ?auto_206972 ?auto_206981 ) ) ( not ( = ?auto_206972 ?auto_206982 ) ) ( not ( = ?auto_206973 ?auto_206974 ) ) ( not ( = ?auto_206973 ?auto_206975 ) ) ( not ( = ?auto_206973 ?auto_206976 ) ) ( not ( = ?auto_206973 ?auto_206977 ) ) ( not ( = ?auto_206973 ?auto_206978 ) ) ( not ( = ?auto_206973 ?auto_206979 ) ) ( not ( = ?auto_206973 ?auto_206980 ) ) ( not ( = ?auto_206973 ?auto_206981 ) ) ( not ( = ?auto_206973 ?auto_206982 ) ) ( not ( = ?auto_206974 ?auto_206975 ) ) ( not ( = ?auto_206974 ?auto_206976 ) ) ( not ( = ?auto_206974 ?auto_206977 ) ) ( not ( = ?auto_206974 ?auto_206978 ) ) ( not ( = ?auto_206974 ?auto_206979 ) ) ( not ( = ?auto_206974 ?auto_206980 ) ) ( not ( = ?auto_206974 ?auto_206981 ) ) ( not ( = ?auto_206974 ?auto_206982 ) ) ( not ( = ?auto_206975 ?auto_206976 ) ) ( not ( = ?auto_206975 ?auto_206977 ) ) ( not ( = ?auto_206975 ?auto_206978 ) ) ( not ( = ?auto_206975 ?auto_206979 ) ) ( not ( = ?auto_206975 ?auto_206980 ) ) ( not ( = ?auto_206975 ?auto_206981 ) ) ( not ( = ?auto_206975 ?auto_206982 ) ) ( not ( = ?auto_206976 ?auto_206977 ) ) ( not ( = ?auto_206976 ?auto_206978 ) ) ( not ( = ?auto_206976 ?auto_206979 ) ) ( not ( = ?auto_206976 ?auto_206980 ) ) ( not ( = ?auto_206976 ?auto_206981 ) ) ( not ( = ?auto_206976 ?auto_206982 ) ) ( not ( = ?auto_206977 ?auto_206978 ) ) ( not ( = ?auto_206977 ?auto_206979 ) ) ( not ( = ?auto_206977 ?auto_206980 ) ) ( not ( = ?auto_206977 ?auto_206981 ) ) ( not ( = ?auto_206977 ?auto_206982 ) ) ( not ( = ?auto_206978 ?auto_206979 ) ) ( not ( = ?auto_206978 ?auto_206980 ) ) ( not ( = ?auto_206978 ?auto_206981 ) ) ( not ( = ?auto_206978 ?auto_206982 ) ) ( not ( = ?auto_206979 ?auto_206980 ) ) ( not ( = ?auto_206979 ?auto_206981 ) ) ( not ( = ?auto_206979 ?auto_206982 ) ) ( not ( = ?auto_206980 ?auto_206981 ) ) ( not ( = ?auto_206980 ?auto_206982 ) ) ( not ( = ?auto_206981 ?auto_206982 ) ) ( ON ?auto_206980 ?auto_206981 ) ( ON ?auto_206979 ?auto_206980 ) ( ON ?auto_206978 ?auto_206979 ) ( ON ?auto_206977 ?auto_206978 ) ( ON ?auto_206976 ?auto_206977 ) ( CLEAR ?auto_206974 ) ( ON ?auto_206975 ?auto_206976 ) ( CLEAR ?auto_206975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_206972 ?auto_206973 ?auto_206974 ?auto_206975 )
      ( MAKE-10PILE ?auto_206972 ?auto_206973 ?auto_206974 ?auto_206975 ?auto_206976 ?auto_206977 ?auto_206978 ?auto_206979 ?auto_206980 ?auto_206981 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_207014 - BLOCK
      ?auto_207015 - BLOCK
      ?auto_207016 - BLOCK
      ?auto_207017 - BLOCK
      ?auto_207018 - BLOCK
      ?auto_207019 - BLOCK
      ?auto_207020 - BLOCK
      ?auto_207021 - BLOCK
      ?auto_207022 - BLOCK
      ?auto_207023 - BLOCK
    )
    :vars
    (
      ?auto_207024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207023 ?auto_207024 ) ( ON-TABLE ?auto_207014 ) ( ON ?auto_207015 ?auto_207014 ) ( not ( = ?auto_207014 ?auto_207015 ) ) ( not ( = ?auto_207014 ?auto_207016 ) ) ( not ( = ?auto_207014 ?auto_207017 ) ) ( not ( = ?auto_207014 ?auto_207018 ) ) ( not ( = ?auto_207014 ?auto_207019 ) ) ( not ( = ?auto_207014 ?auto_207020 ) ) ( not ( = ?auto_207014 ?auto_207021 ) ) ( not ( = ?auto_207014 ?auto_207022 ) ) ( not ( = ?auto_207014 ?auto_207023 ) ) ( not ( = ?auto_207014 ?auto_207024 ) ) ( not ( = ?auto_207015 ?auto_207016 ) ) ( not ( = ?auto_207015 ?auto_207017 ) ) ( not ( = ?auto_207015 ?auto_207018 ) ) ( not ( = ?auto_207015 ?auto_207019 ) ) ( not ( = ?auto_207015 ?auto_207020 ) ) ( not ( = ?auto_207015 ?auto_207021 ) ) ( not ( = ?auto_207015 ?auto_207022 ) ) ( not ( = ?auto_207015 ?auto_207023 ) ) ( not ( = ?auto_207015 ?auto_207024 ) ) ( not ( = ?auto_207016 ?auto_207017 ) ) ( not ( = ?auto_207016 ?auto_207018 ) ) ( not ( = ?auto_207016 ?auto_207019 ) ) ( not ( = ?auto_207016 ?auto_207020 ) ) ( not ( = ?auto_207016 ?auto_207021 ) ) ( not ( = ?auto_207016 ?auto_207022 ) ) ( not ( = ?auto_207016 ?auto_207023 ) ) ( not ( = ?auto_207016 ?auto_207024 ) ) ( not ( = ?auto_207017 ?auto_207018 ) ) ( not ( = ?auto_207017 ?auto_207019 ) ) ( not ( = ?auto_207017 ?auto_207020 ) ) ( not ( = ?auto_207017 ?auto_207021 ) ) ( not ( = ?auto_207017 ?auto_207022 ) ) ( not ( = ?auto_207017 ?auto_207023 ) ) ( not ( = ?auto_207017 ?auto_207024 ) ) ( not ( = ?auto_207018 ?auto_207019 ) ) ( not ( = ?auto_207018 ?auto_207020 ) ) ( not ( = ?auto_207018 ?auto_207021 ) ) ( not ( = ?auto_207018 ?auto_207022 ) ) ( not ( = ?auto_207018 ?auto_207023 ) ) ( not ( = ?auto_207018 ?auto_207024 ) ) ( not ( = ?auto_207019 ?auto_207020 ) ) ( not ( = ?auto_207019 ?auto_207021 ) ) ( not ( = ?auto_207019 ?auto_207022 ) ) ( not ( = ?auto_207019 ?auto_207023 ) ) ( not ( = ?auto_207019 ?auto_207024 ) ) ( not ( = ?auto_207020 ?auto_207021 ) ) ( not ( = ?auto_207020 ?auto_207022 ) ) ( not ( = ?auto_207020 ?auto_207023 ) ) ( not ( = ?auto_207020 ?auto_207024 ) ) ( not ( = ?auto_207021 ?auto_207022 ) ) ( not ( = ?auto_207021 ?auto_207023 ) ) ( not ( = ?auto_207021 ?auto_207024 ) ) ( not ( = ?auto_207022 ?auto_207023 ) ) ( not ( = ?auto_207022 ?auto_207024 ) ) ( not ( = ?auto_207023 ?auto_207024 ) ) ( ON ?auto_207022 ?auto_207023 ) ( ON ?auto_207021 ?auto_207022 ) ( ON ?auto_207020 ?auto_207021 ) ( ON ?auto_207019 ?auto_207020 ) ( ON ?auto_207018 ?auto_207019 ) ( ON ?auto_207017 ?auto_207018 ) ( CLEAR ?auto_207015 ) ( ON ?auto_207016 ?auto_207017 ) ( CLEAR ?auto_207016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_207014 ?auto_207015 ?auto_207016 )
      ( MAKE-10PILE ?auto_207014 ?auto_207015 ?auto_207016 ?auto_207017 ?auto_207018 ?auto_207019 ?auto_207020 ?auto_207021 ?auto_207022 ?auto_207023 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_207056 - BLOCK
      ?auto_207057 - BLOCK
      ?auto_207058 - BLOCK
      ?auto_207059 - BLOCK
      ?auto_207060 - BLOCK
      ?auto_207061 - BLOCK
      ?auto_207062 - BLOCK
      ?auto_207063 - BLOCK
      ?auto_207064 - BLOCK
      ?auto_207065 - BLOCK
    )
    :vars
    (
      ?auto_207066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207065 ?auto_207066 ) ( ON-TABLE ?auto_207056 ) ( not ( = ?auto_207056 ?auto_207057 ) ) ( not ( = ?auto_207056 ?auto_207058 ) ) ( not ( = ?auto_207056 ?auto_207059 ) ) ( not ( = ?auto_207056 ?auto_207060 ) ) ( not ( = ?auto_207056 ?auto_207061 ) ) ( not ( = ?auto_207056 ?auto_207062 ) ) ( not ( = ?auto_207056 ?auto_207063 ) ) ( not ( = ?auto_207056 ?auto_207064 ) ) ( not ( = ?auto_207056 ?auto_207065 ) ) ( not ( = ?auto_207056 ?auto_207066 ) ) ( not ( = ?auto_207057 ?auto_207058 ) ) ( not ( = ?auto_207057 ?auto_207059 ) ) ( not ( = ?auto_207057 ?auto_207060 ) ) ( not ( = ?auto_207057 ?auto_207061 ) ) ( not ( = ?auto_207057 ?auto_207062 ) ) ( not ( = ?auto_207057 ?auto_207063 ) ) ( not ( = ?auto_207057 ?auto_207064 ) ) ( not ( = ?auto_207057 ?auto_207065 ) ) ( not ( = ?auto_207057 ?auto_207066 ) ) ( not ( = ?auto_207058 ?auto_207059 ) ) ( not ( = ?auto_207058 ?auto_207060 ) ) ( not ( = ?auto_207058 ?auto_207061 ) ) ( not ( = ?auto_207058 ?auto_207062 ) ) ( not ( = ?auto_207058 ?auto_207063 ) ) ( not ( = ?auto_207058 ?auto_207064 ) ) ( not ( = ?auto_207058 ?auto_207065 ) ) ( not ( = ?auto_207058 ?auto_207066 ) ) ( not ( = ?auto_207059 ?auto_207060 ) ) ( not ( = ?auto_207059 ?auto_207061 ) ) ( not ( = ?auto_207059 ?auto_207062 ) ) ( not ( = ?auto_207059 ?auto_207063 ) ) ( not ( = ?auto_207059 ?auto_207064 ) ) ( not ( = ?auto_207059 ?auto_207065 ) ) ( not ( = ?auto_207059 ?auto_207066 ) ) ( not ( = ?auto_207060 ?auto_207061 ) ) ( not ( = ?auto_207060 ?auto_207062 ) ) ( not ( = ?auto_207060 ?auto_207063 ) ) ( not ( = ?auto_207060 ?auto_207064 ) ) ( not ( = ?auto_207060 ?auto_207065 ) ) ( not ( = ?auto_207060 ?auto_207066 ) ) ( not ( = ?auto_207061 ?auto_207062 ) ) ( not ( = ?auto_207061 ?auto_207063 ) ) ( not ( = ?auto_207061 ?auto_207064 ) ) ( not ( = ?auto_207061 ?auto_207065 ) ) ( not ( = ?auto_207061 ?auto_207066 ) ) ( not ( = ?auto_207062 ?auto_207063 ) ) ( not ( = ?auto_207062 ?auto_207064 ) ) ( not ( = ?auto_207062 ?auto_207065 ) ) ( not ( = ?auto_207062 ?auto_207066 ) ) ( not ( = ?auto_207063 ?auto_207064 ) ) ( not ( = ?auto_207063 ?auto_207065 ) ) ( not ( = ?auto_207063 ?auto_207066 ) ) ( not ( = ?auto_207064 ?auto_207065 ) ) ( not ( = ?auto_207064 ?auto_207066 ) ) ( not ( = ?auto_207065 ?auto_207066 ) ) ( ON ?auto_207064 ?auto_207065 ) ( ON ?auto_207063 ?auto_207064 ) ( ON ?auto_207062 ?auto_207063 ) ( ON ?auto_207061 ?auto_207062 ) ( ON ?auto_207060 ?auto_207061 ) ( ON ?auto_207059 ?auto_207060 ) ( ON ?auto_207058 ?auto_207059 ) ( CLEAR ?auto_207056 ) ( ON ?auto_207057 ?auto_207058 ) ( CLEAR ?auto_207057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_207056 ?auto_207057 )
      ( MAKE-10PILE ?auto_207056 ?auto_207057 ?auto_207058 ?auto_207059 ?auto_207060 ?auto_207061 ?auto_207062 ?auto_207063 ?auto_207064 ?auto_207065 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_207098 - BLOCK
      ?auto_207099 - BLOCK
      ?auto_207100 - BLOCK
      ?auto_207101 - BLOCK
      ?auto_207102 - BLOCK
      ?auto_207103 - BLOCK
      ?auto_207104 - BLOCK
      ?auto_207105 - BLOCK
      ?auto_207106 - BLOCK
      ?auto_207107 - BLOCK
    )
    :vars
    (
      ?auto_207108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207107 ?auto_207108 ) ( not ( = ?auto_207098 ?auto_207099 ) ) ( not ( = ?auto_207098 ?auto_207100 ) ) ( not ( = ?auto_207098 ?auto_207101 ) ) ( not ( = ?auto_207098 ?auto_207102 ) ) ( not ( = ?auto_207098 ?auto_207103 ) ) ( not ( = ?auto_207098 ?auto_207104 ) ) ( not ( = ?auto_207098 ?auto_207105 ) ) ( not ( = ?auto_207098 ?auto_207106 ) ) ( not ( = ?auto_207098 ?auto_207107 ) ) ( not ( = ?auto_207098 ?auto_207108 ) ) ( not ( = ?auto_207099 ?auto_207100 ) ) ( not ( = ?auto_207099 ?auto_207101 ) ) ( not ( = ?auto_207099 ?auto_207102 ) ) ( not ( = ?auto_207099 ?auto_207103 ) ) ( not ( = ?auto_207099 ?auto_207104 ) ) ( not ( = ?auto_207099 ?auto_207105 ) ) ( not ( = ?auto_207099 ?auto_207106 ) ) ( not ( = ?auto_207099 ?auto_207107 ) ) ( not ( = ?auto_207099 ?auto_207108 ) ) ( not ( = ?auto_207100 ?auto_207101 ) ) ( not ( = ?auto_207100 ?auto_207102 ) ) ( not ( = ?auto_207100 ?auto_207103 ) ) ( not ( = ?auto_207100 ?auto_207104 ) ) ( not ( = ?auto_207100 ?auto_207105 ) ) ( not ( = ?auto_207100 ?auto_207106 ) ) ( not ( = ?auto_207100 ?auto_207107 ) ) ( not ( = ?auto_207100 ?auto_207108 ) ) ( not ( = ?auto_207101 ?auto_207102 ) ) ( not ( = ?auto_207101 ?auto_207103 ) ) ( not ( = ?auto_207101 ?auto_207104 ) ) ( not ( = ?auto_207101 ?auto_207105 ) ) ( not ( = ?auto_207101 ?auto_207106 ) ) ( not ( = ?auto_207101 ?auto_207107 ) ) ( not ( = ?auto_207101 ?auto_207108 ) ) ( not ( = ?auto_207102 ?auto_207103 ) ) ( not ( = ?auto_207102 ?auto_207104 ) ) ( not ( = ?auto_207102 ?auto_207105 ) ) ( not ( = ?auto_207102 ?auto_207106 ) ) ( not ( = ?auto_207102 ?auto_207107 ) ) ( not ( = ?auto_207102 ?auto_207108 ) ) ( not ( = ?auto_207103 ?auto_207104 ) ) ( not ( = ?auto_207103 ?auto_207105 ) ) ( not ( = ?auto_207103 ?auto_207106 ) ) ( not ( = ?auto_207103 ?auto_207107 ) ) ( not ( = ?auto_207103 ?auto_207108 ) ) ( not ( = ?auto_207104 ?auto_207105 ) ) ( not ( = ?auto_207104 ?auto_207106 ) ) ( not ( = ?auto_207104 ?auto_207107 ) ) ( not ( = ?auto_207104 ?auto_207108 ) ) ( not ( = ?auto_207105 ?auto_207106 ) ) ( not ( = ?auto_207105 ?auto_207107 ) ) ( not ( = ?auto_207105 ?auto_207108 ) ) ( not ( = ?auto_207106 ?auto_207107 ) ) ( not ( = ?auto_207106 ?auto_207108 ) ) ( not ( = ?auto_207107 ?auto_207108 ) ) ( ON ?auto_207106 ?auto_207107 ) ( ON ?auto_207105 ?auto_207106 ) ( ON ?auto_207104 ?auto_207105 ) ( ON ?auto_207103 ?auto_207104 ) ( ON ?auto_207102 ?auto_207103 ) ( ON ?auto_207101 ?auto_207102 ) ( ON ?auto_207100 ?auto_207101 ) ( ON ?auto_207099 ?auto_207100 ) ( ON ?auto_207098 ?auto_207099 ) ( CLEAR ?auto_207098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_207098 )
      ( MAKE-10PILE ?auto_207098 ?auto_207099 ?auto_207100 ?auto_207101 ?auto_207102 ?auto_207103 ?auto_207104 ?auto_207105 ?auto_207106 ?auto_207107 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_207141 - BLOCK
      ?auto_207142 - BLOCK
      ?auto_207143 - BLOCK
      ?auto_207144 - BLOCK
      ?auto_207145 - BLOCK
      ?auto_207146 - BLOCK
      ?auto_207147 - BLOCK
      ?auto_207148 - BLOCK
      ?auto_207149 - BLOCK
      ?auto_207150 - BLOCK
      ?auto_207151 - BLOCK
    )
    :vars
    (
      ?auto_207152 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_207150 ) ( ON ?auto_207151 ?auto_207152 ) ( CLEAR ?auto_207151 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_207141 ) ( ON ?auto_207142 ?auto_207141 ) ( ON ?auto_207143 ?auto_207142 ) ( ON ?auto_207144 ?auto_207143 ) ( ON ?auto_207145 ?auto_207144 ) ( ON ?auto_207146 ?auto_207145 ) ( ON ?auto_207147 ?auto_207146 ) ( ON ?auto_207148 ?auto_207147 ) ( ON ?auto_207149 ?auto_207148 ) ( ON ?auto_207150 ?auto_207149 ) ( not ( = ?auto_207141 ?auto_207142 ) ) ( not ( = ?auto_207141 ?auto_207143 ) ) ( not ( = ?auto_207141 ?auto_207144 ) ) ( not ( = ?auto_207141 ?auto_207145 ) ) ( not ( = ?auto_207141 ?auto_207146 ) ) ( not ( = ?auto_207141 ?auto_207147 ) ) ( not ( = ?auto_207141 ?auto_207148 ) ) ( not ( = ?auto_207141 ?auto_207149 ) ) ( not ( = ?auto_207141 ?auto_207150 ) ) ( not ( = ?auto_207141 ?auto_207151 ) ) ( not ( = ?auto_207141 ?auto_207152 ) ) ( not ( = ?auto_207142 ?auto_207143 ) ) ( not ( = ?auto_207142 ?auto_207144 ) ) ( not ( = ?auto_207142 ?auto_207145 ) ) ( not ( = ?auto_207142 ?auto_207146 ) ) ( not ( = ?auto_207142 ?auto_207147 ) ) ( not ( = ?auto_207142 ?auto_207148 ) ) ( not ( = ?auto_207142 ?auto_207149 ) ) ( not ( = ?auto_207142 ?auto_207150 ) ) ( not ( = ?auto_207142 ?auto_207151 ) ) ( not ( = ?auto_207142 ?auto_207152 ) ) ( not ( = ?auto_207143 ?auto_207144 ) ) ( not ( = ?auto_207143 ?auto_207145 ) ) ( not ( = ?auto_207143 ?auto_207146 ) ) ( not ( = ?auto_207143 ?auto_207147 ) ) ( not ( = ?auto_207143 ?auto_207148 ) ) ( not ( = ?auto_207143 ?auto_207149 ) ) ( not ( = ?auto_207143 ?auto_207150 ) ) ( not ( = ?auto_207143 ?auto_207151 ) ) ( not ( = ?auto_207143 ?auto_207152 ) ) ( not ( = ?auto_207144 ?auto_207145 ) ) ( not ( = ?auto_207144 ?auto_207146 ) ) ( not ( = ?auto_207144 ?auto_207147 ) ) ( not ( = ?auto_207144 ?auto_207148 ) ) ( not ( = ?auto_207144 ?auto_207149 ) ) ( not ( = ?auto_207144 ?auto_207150 ) ) ( not ( = ?auto_207144 ?auto_207151 ) ) ( not ( = ?auto_207144 ?auto_207152 ) ) ( not ( = ?auto_207145 ?auto_207146 ) ) ( not ( = ?auto_207145 ?auto_207147 ) ) ( not ( = ?auto_207145 ?auto_207148 ) ) ( not ( = ?auto_207145 ?auto_207149 ) ) ( not ( = ?auto_207145 ?auto_207150 ) ) ( not ( = ?auto_207145 ?auto_207151 ) ) ( not ( = ?auto_207145 ?auto_207152 ) ) ( not ( = ?auto_207146 ?auto_207147 ) ) ( not ( = ?auto_207146 ?auto_207148 ) ) ( not ( = ?auto_207146 ?auto_207149 ) ) ( not ( = ?auto_207146 ?auto_207150 ) ) ( not ( = ?auto_207146 ?auto_207151 ) ) ( not ( = ?auto_207146 ?auto_207152 ) ) ( not ( = ?auto_207147 ?auto_207148 ) ) ( not ( = ?auto_207147 ?auto_207149 ) ) ( not ( = ?auto_207147 ?auto_207150 ) ) ( not ( = ?auto_207147 ?auto_207151 ) ) ( not ( = ?auto_207147 ?auto_207152 ) ) ( not ( = ?auto_207148 ?auto_207149 ) ) ( not ( = ?auto_207148 ?auto_207150 ) ) ( not ( = ?auto_207148 ?auto_207151 ) ) ( not ( = ?auto_207148 ?auto_207152 ) ) ( not ( = ?auto_207149 ?auto_207150 ) ) ( not ( = ?auto_207149 ?auto_207151 ) ) ( not ( = ?auto_207149 ?auto_207152 ) ) ( not ( = ?auto_207150 ?auto_207151 ) ) ( not ( = ?auto_207150 ?auto_207152 ) ) ( not ( = ?auto_207151 ?auto_207152 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_207151 ?auto_207152 )
      ( !STACK ?auto_207151 ?auto_207150 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_207187 - BLOCK
      ?auto_207188 - BLOCK
      ?auto_207189 - BLOCK
      ?auto_207190 - BLOCK
      ?auto_207191 - BLOCK
      ?auto_207192 - BLOCK
      ?auto_207193 - BLOCK
      ?auto_207194 - BLOCK
      ?auto_207195 - BLOCK
      ?auto_207196 - BLOCK
      ?auto_207197 - BLOCK
    )
    :vars
    (
      ?auto_207198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207197 ?auto_207198 ) ( ON-TABLE ?auto_207187 ) ( ON ?auto_207188 ?auto_207187 ) ( ON ?auto_207189 ?auto_207188 ) ( ON ?auto_207190 ?auto_207189 ) ( ON ?auto_207191 ?auto_207190 ) ( ON ?auto_207192 ?auto_207191 ) ( ON ?auto_207193 ?auto_207192 ) ( ON ?auto_207194 ?auto_207193 ) ( ON ?auto_207195 ?auto_207194 ) ( not ( = ?auto_207187 ?auto_207188 ) ) ( not ( = ?auto_207187 ?auto_207189 ) ) ( not ( = ?auto_207187 ?auto_207190 ) ) ( not ( = ?auto_207187 ?auto_207191 ) ) ( not ( = ?auto_207187 ?auto_207192 ) ) ( not ( = ?auto_207187 ?auto_207193 ) ) ( not ( = ?auto_207187 ?auto_207194 ) ) ( not ( = ?auto_207187 ?auto_207195 ) ) ( not ( = ?auto_207187 ?auto_207196 ) ) ( not ( = ?auto_207187 ?auto_207197 ) ) ( not ( = ?auto_207187 ?auto_207198 ) ) ( not ( = ?auto_207188 ?auto_207189 ) ) ( not ( = ?auto_207188 ?auto_207190 ) ) ( not ( = ?auto_207188 ?auto_207191 ) ) ( not ( = ?auto_207188 ?auto_207192 ) ) ( not ( = ?auto_207188 ?auto_207193 ) ) ( not ( = ?auto_207188 ?auto_207194 ) ) ( not ( = ?auto_207188 ?auto_207195 ) ) ( not ( = ?auto_207188 ?auto_207196 ) ) ( not ( = ?auto_207188 ?auto_207197 ) ) ( not ( = ?auto_207188 ?auto_207198 ) ) ( not ( = ?auto_207189 ?auto_207190 ) ) ( not ( = ?auto_207189 ?auto_207191 ) ) ( not ( = ?auto_207189 ?auto_207192 ) ) ( not ( = ?auto_207189 ?auto_207193 ) ) ( not ( = ?auto_207189 ?auto_207194 ) ) ( not ( = ?auto_207189 ?auto_207195 ) ) ( not ( = ?auto_207189 ?auto_207196 ) ) ( not ( = ?auto_207189 ?auto_207197 ) ) ( not ( = ?auto_207189 ?auto_207198 ) ) ( not ( = ?auto_207190 ?auto_207191 ) ) ( not ( = ?auto_207190 ?auto_207192 ) ) ( not ( = ?auto_207190 ?auto_207193 ) ) ( not ( = ?auto_207190 ?auto_207194 ) ) ( not ( = ?auto_207190 ?auto_207195 ) ) ( not ( = ?auto_207190 ?auto_207196 ) ) ( not ( = ?auto_207190 ?auto_207197 ) ) ( not ( = ?auto_207190 ?auto_207198 ) ) ( not ( = ?auto_207191 ?auto_207192 ) ) ( not ( = ?auto_207191 ?auto_207193 ) ) ( not ( = ?auto_207191 ?auto_207194 ) ) ( not ( = ?auto_207191 ?auto_207195 ) ) ( not ( = ?auto_207191 ?auto_207196 ) ) ( not ( = ?auto_207191 ?auto_207197 ) ) ( not ( = ?auto_207191 ?auto_207198 ) ) ( not ( = ?auto_207192 ?auto_207193 ) ) ( not ( = ?auto_207192 ?auto_207194 ) ) ( not ( = ?auto_207192 ?auto_207195 ) ) ( not ( = ?auto_207192 ?auto_207196 ) ) ( not ( = ?auto_207192 ?auto_207197 ) ) ( not ( = ?auto_207192 ?auto_207198 ) ) ( not ( = ?auto_207193 ?auto_207194 ) ) ( not ( = ?auto_207193 ?auto_207195 ) ) ( not ( = ?auto_207193 ?auto_207196 ) ) ( not ( = ?auto_207193 ?auto_207197 ) ) ( not ( = ?auto_207193 ?auto_207198 ) ) ( not ( = ?auto_207194 ?auto_207195 ) ) ( not ( = ?auto_207194 ?auto_207196 ) ) ( not ( = ?auto_207194 ?auto_207197 ) ) ( not ( = ?auto_207194 ?auto_207198 ) ) ( not ( = ?auto_207195 ?auto_207196 ) ) ( not ( = ?auto_207195 ?auto_207197 ) ) ( not ( = ?auto_207195 ?auto_207198 ) ) ( not ( = ?auto_207196 ?auto_207197 ) ) ( not ( = ?auto_207196 ?auto_207198 ) ) ( not ( = ?auto_207197 ?auto_207198 ) ) ( CLEAR ?auto_207195 ) ( ON ?auto_207196 ?auto_207197 ) ( CLEAR ?auto_207196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_207187 ?auto_207188 ?auto_207189 ?auto_207190 ?auto_207191 ?auto_207192 ?auto_207193 ?auto_207194 ?auto_207195 ?auto_207196 )
      ( MAKE-11PILE ?auto_207187 ?auto_207188 ?auto_207189 ?auto_207190 ?auto_207191 ?auto_207192 ?auto_207193 ?auto_207194 ?auto_207195 ?auto_207196 ?auto_207197 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_207233 - BLOCK
      ?auto_207234 - BLOCK
      ?auto_207235 - BLOCK
      ?auto_207236 - BLOCK
      ?auto_207237 - BLOCK
      ?auto_207238 - BLOCK
      ?auto_207239 - BLOCK
      ?auto_207240 - BLOCK
      ?auto_207241 - BLOCK
      ?auto_207242 - BLOCK
      ?auto_207243 - BLOCK
    )
    :vars
    (
      ?auto_207244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207243 ?auto_207244 ) ( ON-TABLE ?auto_207233 ) ( ON ?auto_207234 ?auto_207233 ) ( ON ?auto_207235 ?auto_207234 ) ( ON ?auto_207236 ?auto_207235 ) ( ON ?auto_207237 ?auto_207236 ) ( ON ?auto_207238 ?auto_207237 ) ( ON ?auto_207239 ?auto_207238 ) ( ON ?auto_207240 ?auto_207239 ) ( not ( = ?auto_207233 ?auto_207234 ) ) ( not ( = ?auto_207233 ?auto_207235 ) ) ( not ( = ?auto_207233 ?auto_207236 ) ) ( not ( = ?auto_207233 ?auto_207237 ) ) ( not ( = ?auto_207233 ?auto_207238 ) ) ( not ( = ?auto_207233 ?auto_207239 ) ) ( not ( = ?auto_207233 ?auto_207240 ) ) ( not ( = ?auto_207233 ?auto_207241 ) ) ( not ( = ?auto_207233 ?auto_207242 ) ) ( not ( = ?auto_207233 ?auto_207243 ) ) ( not ( = ?auto_207233 ?auto_207244 ) ) ( not ( = ?auto_207234 ?auto_207235 ) ) ( not ( = ?auto_207234 ?auto_207236 ) ) ( not ( = ?auto_207234 ?auto_207237 ) ) ( not ( = ?auto_207234 ?auto_207238 ) ) ( not ( = ?auto_207234 ?auto_207239 ) ) ( not ( = ?auto_207234 ?auto_207240 ) ) ( not ( = ?auto_207234 ?auto_207241 ) ) ( not ( = ?auto_207234 ?auto_207242 ) ) ( not ( = ?auto_207234 ?auto_207243 ) ) ( not ( = ?auto_207234 ?auto_207244 ) ) ( not ( = ?auto_207235 ?auto_207236 ) ) ( not ( = ?auto_207235 ?auto_207237 ) ) ( not ( = ?auto_207235 ?auto_207238 ) ) ( not ( = ?auto_207235 ?auto_207239 ) ) ( not ( = ?auto_207235 ?auto_207240 ) ) ( not ( = ?auto_207235 ?auto_207241 ) ) ( not ( = ?auto_207235 ?auto_207242 ) ) ( not ( = ?auto_207235 ?auto_207243 ) ) ( not ( = ?auto_207235 ?auto_207244 ) ) ( not ( = ?auto_207236 ?auto_207237 ) ) ( not ( = ?auto_207236 ?auto_207238 ) ) ( not ( = ?auto_207236 ?auto_207239 ) ) ( not ( = ?auto_207236 ?auto_207240 ) ) ( not ( = ?auto_207236 ?auto_207241 ) ) ( not ( = ?auto_207236 ?auto_207242 ) ) ( not ( = ?auto_207236 ?auto_207243 ) ) ( not ( = ?auto_207236 ?auto_207244 ) ) ( not ( = ?auto_207237 ?auto_207238 ) ) ( not ( = ?auto_207237 ?auto_207239 ) ) ( not ( = ?auto_207237 ?auto_207240 ) ) ( not ( = ?auto_207237 ?auto_207241 ) ) ( not ( = ?auto_207237 ?auto_207242 ) ) ( not ( = ?auto_207237 ?auto_207243 ) ) ( not ( = ?auto_207237 ?auto_207244 ) ) ( not ( = ?auto_207238 ?auto_207239 ) ) ( not ( = ?auto_207238 ?auto_207240 ) ) ( not ( = ?auto_207238 ?auto_207241 ) ) ( not ( = ?auto_207238 ?auto_207242 ) ) ( not ( = ?auto_207238 ?auto_207243 ) ) ( not ( = ?auto_207238 ?auto_207244 ) ) ( not ( = ?auto_207239 ?auto_207240 ) ) ( not ( = ?auto_207239 ?auto_207241 ) ) ( not ( = ?auto_207239 ?auto_207242 ) ) ( not ( = ?auto_207239 ?auto_207243 ) ) ( not ( = ?auto_207239 ?auto_207244 ) ) ( not ( = ?auto_207240 ?auto_207241 ) ) ( not ( = ?auto_207240 ?auto_207242 ) ) ( not ( = ?auto_207240 ?auto_207243 ) ) ( not ( = ?auto_207240 ?auto_207244 ) ) ( not ( = ?auto_207241 ?auto_207242 ) ) ( not ( = ?auto_207241 ?auto_207243 ) ) ( not ( = ?auto_207241 ?auto_207244 ) ) ( not ( = ?auto_207242 ?auto_207243 ) ) ( not ( = ?auto_207242 ?auto_207244 ) ) ( not ( = ?auto_207243 ?auto_207244 ) ) ( ON ?auto_207242 ?auto_207243 ) ( CLEAR ?auto_207240 ) ( ON ?auto_207241 ?auto_207242 ) ( CLEAR ?auto_207241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_207233 ?auto_207234 ?auto_207235 ?auto_207236 ?auto_207237 ?auto_207238 ?auto_207239 ?auto_207240 ?auto_207241 )
      ( MAKE-11PILE ?auto_207233 ?auto_207234 ?auto_207235 ?auto_207236 ?auto_207237 ?auto_207238 ?auto_207239 ?auto_207240 ?auto_207241 ?auto_207242 ?auto_207243 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_207279 - BLOCK
      ?auto_207280 - BLOCK
      ?auto_207281 - BLOCK
      ?auto_207282 - BLOCK
      ?auto_207283 - BLOCK
      ?auto_207284 - BLOCK
      ?auto_207285 - BLOCK
      ?auto_207286 - BLOCK
      ?auto_207287 - BLOCK
      ?auto_207288 - BLOCK
      ?auto_207289 - BLOCK
    )
    :vars
    (
      ?auto_207290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207289 ?auto_207290 ) ( ON-TABLE ?auto_207279 ) ( ON ?auto_207280 ?auto_207279 ) ( ON ?auto_207281 ?auto_207280 ) ( ON ?auto_207282 ?auto_207281 ) ( ON ?auto_207283 ?auto_207282 ) ( ON ?auto_207284 ?auto_207283 ) ( ON ?auto_207285 ?auto_207284 ) ( not ( = ?auto_207279 ?auto_207280 ) ) ( not ( = ?auto_207279 ?auto_207281 ) ) ( not ( = ?auto_207279 ?auto_207282 ) ) ( not ( = ?auto_207279 ?auto_207283 ) ) ( not ( = ?auto_207279 ?auto_207284 ) ) ( not ( = ?auto_207279 ?auto_207285 ) ) ( not ( = ?auto_207279 ?auto_207286 ) ) ( not ( = ?auto_207279 ?auto_207287 ) ) ( not ( = ?auto_207279 ?auto_207288 ) ) ( not ( = ?auto_207279 ?auto_207289 ) ) ( not ( = ?auto_207279 ?auto_207290 ) ) ( not ( = ?auto_207280 ?auto_207281 ) ) ( not ( = ?auto_207280 ?auto_207282 ) ) ( not ( = ?auto_207280 ?auto_207283 ) ) ( not ( = ?auto_207280 ?auto_207284 ) ) ( not ( = ?auto_207280 ?auto_207285 ) ) ( not ( = ?auto_207280 ?auto_207286 ) ) ( not ( = ?auto_207280 ?auto_207287 ) ) ( not ( = ?auto_207280 ?auto_207288 ) ) ( not ( = ?auto_207280 ?auto_207289 ) ) ( not ( = ?auto_207280 ?auto_207290 ) ) ( not ( = ?auto_207281 ?auto_207282 ) ) ( not ( = ?auto_207281 ?auto_207283 ) ) ( not ( = ?auto_207281 ?auto_207284 ) ) ( not ( = ?auto_207281 ?auto_207285 ) ) ( not ( = ?auto_207281 ?auto_207286 ) ) ( not ( = ?auto_207281 ?auto_207287 ) ) ( not ( = ?auto_207281 ?auto_207288 ) ) ( not ( = ?auto_207281 ?auto_207289 ) ) ( not ( = ?auto_207281 ?auto_207290 ) ) ( not ( = ?auto_207282 ?auto_207283 ) ) ( not ( = ?auto_207282 ?auto_207284 ) ) ( not ( = ?auto_207282 ?auto_207285 ) ) ( not ( = ?auto_207282 ?auto_207286 ) ) ( not ( = ?auto_207282 ?auto_207287 ) ) ( not ( = ?auto_207282 ?auto_207288 ) ) ( not ( = ?auto_207282 ?auto_207289 ) ) ( not ( = ?auto_207282 ?auto_207290 ) ) ( not ( = ?auto_207283 ?auto_207284 ) ) ( not ( = ?auto_207283 ?auto_207285 ) ) ( not ( = ?auto_207283 ?auto_207286 ) ) ( not ( = ?auto_207283 ?auto_207287 ) ) ( not ( = ?auto_207283 ?auto_207288 ) ) ( not ( = ?auto_207283 ?auto_207289 ) ) ( not ( = ?auto_207283 ?auto_207290 ) ) ( not ( = ?auto_207284 ?auto_207285 ) ) ( not ( = ?auto_207284 ?auto_207286 ) ) ( not ( = ?auto_207284 ?auto_207287 ) ) ( not ( = ?auto_207284 ?auto_207288 ) ) ( not ( = ?auto_207284 ?auto_207289 ) ) ( not ( = ?auto_207284 ?auto_207290 ) ) ( not ( = ?auto_207285 ?auto_207286 ) ) ( not ( = ?auto_207285 ?auto_207287 ) ) ( not ( = ?auto_207285 ?auto_207288 ) ) ( not ( = ?auto_207285 ?auto_207289 ) ) ( not ( = ?auto_207285 ?auto_207290 ) ) ( not ( = ?auto_207286 ?auto_207287 ) ) ( not ( = ?auto_207286 ?auto_207288 ) ) ( not ( = ?auto_207286 ?auto_207289 ) ) ( not ( = ?auto_207286 ?auto_207290 ) ) ( not ( = ?auto_207287 ?auto_207288 ) ) ( not ( = ?auto_207287 ?auto_207289 ) ) ( not ( = ?auto_207287 ?auto_207290 ) ) ( not ( = ?auto_207288 ?auto_207289 ) ) ( not ( = ?auto_207288 ?auto_207290 ) ) ( not ( = ?auto_207289 ?auto_207290 ) ) ( ON ?auto_207288 ?auto_207289 ) ( ON ?auto_207287 ?auto_207288 ) ( CLEAR ?auto_207285 ) ( ON ?auto_207286 ?auto_207287 ) ( CLEAR ?auto_207286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_207279 ?auto_207280 ?auto_207281 ?auto_207282 ?auto_207283 ?auto_207284 ?auto_207285 ?auto_207286 )
      ( MAKE-11PILE ?auto_207279 ?auto_207280 ?auto_207281 ?auto_207282 ?auto_207283 ?auto_207284 ?auto_207285 ?auto_207286 ?auto_207287 ?auto_207288 ?auto_207289 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_207325 - BLOCK
      ?auto_207326 - BLOCK
      ?auto_207327 - BLOCK
      ?auto_207328 - BLOCK
      ?auto_207329 - BLOCK
      ?auto_207330 - BLOCK
      ?auto_207331 - BLOCK
      ?auto_207332 - BLOCK
      ?auto_207333 - BLOCK
      ?auto_207334 - BLOCK
      ?auto_207335 - BLOCK
    )
    :vars
    (
      ?auto_207336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207335 ?auto_207336 ) ( ON-TABLE ?auto_207325 ) ( ON ?auto_207326 ?auto_207325 ) ( ON ?auto_207327 ?auto_207326 ) ( ON ?auto_207328 ?auto_207327 ) ( ON ?auto_207329 ?auto_207328 ) ( ON ?auto_207330 ?auto_207329 ) ( not ( = ?auto_207325 ?auto_207326 ) ) ( not ( = ?auto_207325 ?auto_207327 ) ) ( not ( = ?auto_207325 ?auto_207328 ) ) ( not ( = ?auto_207325 ?auto_207329 ) ) ( not ( = ?auto_207325 ?auto_207330 ) ) ( not ( = ?auto_207325 ?auto_207331 ) ) ( not ( = ?auto_207325 ?auto_207332 ) ) ( not ( = ?auto_207325 ?auto_207333 ) ) ( not ( = ?auto_207325 ?auto_207334 ) ) ( not ( = ?auto_207325 ?auto_207335 ) ) ( not ( = ?auto_207325 ?auto_207336 ) ) ( not ( = ?auto_207326 ?auto_207327 ) ) ( not ( = ?auto_207326 ?auto_207328 ) ) ( not ( = ?auto_207326 ?auto_207329 ) ) ( not ( = ?auto_207326 ?auto_207330 ) ) ( not ( = ?auto_207326 ?auto_207331 ) ) ( not ( = ?auto_207326 ?auto_207332 ) ) ( not ( = ?auto_207326 ?auto_207333 ) ) ( not ( = ?auto_207326 ?auto_207334 ) ) ( not ( = ?auto_207326 ?auto_207335 ) ) ( not ( = ?auto_207326 ?auto_207336 ) ) ( not ( = ?auto_207327 ?auto_207328 ) ) ( not ( = ?auto_207327 ?auto_207329 ) ) ( not ( = ?auto_207327 ?auto_207330 ) ) ( not ( = ?auto_207327 ?auto_207331 ) ) ( not ( = ?auto_207327 ?auto_207332 ) ) ( not ( = ?auto_207327 ?auto_207333 ) ) ( not ( = ?auto_207327 ?auto_207334 ) ) ( not ( = ?auto_207327 ?auto_207335 ) ) ( not ( = ?auto_207327 ?auto_207336 ) ) ( not ( = ?auto_207328 ?auto_207329 ) ) ( not ( = ?auto_207328 ?auto_207330 ) ) ( not ( = ?auto_207328 ?auto_207331 ) ) ( not ( = ?auto_207328 ?auto_207332 ) ) ( not ( = ?auto_207328 ?auto_207333 ) ) ( not ( = ?auto_207328 ?auto_207334 ) ) ( not ( = ?auto_207328 ?auto_207335 ) ) ( not ( = ?auto_207328 ?auto_207336 ) ) ( not ( = ?auto_207329 ?auto_207330 ) ) ( not ( = ?auto_207329 ?auto_207331 ) ) ( not ( = ?auto_207329 ?auto_207332 ) ) ( not ( = ?auto_207329 ?auto_207333 ) ) ( not ( = ?auto_207329 ?auto_207334 ) ) ( not ( = ?auto_207329 ?auto_207335 ) ) ( not ( = ?auto_207329 ?auto_207336 ) ) ( not ( = ?auto_207330 ?auto_207331 ) ) ( not ( = ?auto_207330 ?auto_207332 ) ) ( not ( = ?auto_207330 ?auto_207333 ) ) ( not ( = ?auto_207330 ?auto_207334 ) ) ( not ( = ?auto_207330 ?auto_207335 ) ) ( not ( = ?auto_207330 ?auto_207336 ) ) ( not ( = ?auto_207331 ?auto_207332 ) ) ( not ( = ?auto_207331 ?auto_207333 ) ) ( not ( = ?auto_207331 ?auto_207334 ) ) ( not ( = ?auto_207331 ?auto_207335 ) ) ( not ( = ?auto_207331 ?auto_207336 ) ) ( not ( = ?auto_207332 ?auto_207333 ) ) ( not ( = ?auto_207332 ?auto_207334 ) ) ( not ( = ?auto_207332 ?auto_207335 ) ) ( not ( = ?auto_207332 ?auto_207336 ) ) ( not ( = ?auto_207333 ?auto_207334 ) ) ( not ( = ?auto_207333 ?auto_207335 ) ) ( not ( = ?auto_207333 ?auto_207336 ) ) ( not ( = ?auto_207334 ?auto_207335 ) ) ( not ( = ?auto_207334 ?auto_207336 ) ) ( not ( = ?auto_207335 ?auto_207336 ) ) ( ON ?auto_207334 ?auto_207335 ) ( ON ?auto_207333 ?auto_207334 ) ( ON ?auto_207332 ?auto_207333 ) ( CLEAR ?auto_207330 ) ( ON ?auto_207331 ?auto_207332 ) ( CLEAR ?auto_207331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_207325 ?auto_207326 ?auto_207327 ?auto_207328 ?auto_207329 ?auto_207330 ?auto_207331 )
      ( MAKE-11PILE ?auto_207325 ?auto_207326 ?auto_207327 ?auto_207328 ?auto_207329 ?auto_207330 ?auto_207331 ?auto_207332 ?auto_207333 ?auto_207334 ?auto_207335 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_207371 - BLOCK
      ?auto_207372 - BLOCK
      ?auto_207373 - BLOCK
      ?auto_207374 - BLOCK
      ?auto_207375 - BLOCK
      ?auto_207376 - BLOCK
      ?auto_207377 - BLOCK
      ?auto_207378 - BLOCK
      ?auto_207379 - BLOCK
      ?auto_207380 - BLOCK
      ?auto_207381 - BLOCK
    )
    :vars
    (
      ?auto_207382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207381 ?auto_207382 ) ( ON-TABLE ?auto_207371 ) ( ON ?auto_207372 ?auto_207371 ) ( ON ?auto_207373 ?auto_207372 ) ( ON ?auto_207374 ?auto_207373 ) ( ON ?auto_207375 ?auto_207374 ) ( not ( = ?auto_207371 ?auto_207372 ) ) ( not ( = ?auto_207371 ?auto_207373 ) ) ( not ( = ?auto_207371 ?auto_207374 ) ) ( not ( = ?auto_207371 ?auto_207375 ) ) ( not ( = ?auto_207371 ?auto_207376 ) ) ( not ( = ?auto_207371 ?auto_207377 ) ) ( not ( = ?auto_207371 ?auto_207378 ) ) ( not ( = ?auto_207371 ?auto_207379 ) ) ( not ( = ?auto_207371 ?auto_207380 ) ) ( not ( = ?auto_207371 ?auto_207381 ) ) ( not ( = ?auto_207371 ?auto_207382 ) ) ( not ( = ?auto_207372 ?auto_207373 ) ) ( not ( = ?auto_207372 ?auto_207374 ) ) ( not ( = ?auto_207372 ?auto_207375 ) ) ( not ( = ?auto_207372 ?auto_207376 ) ) ( not ( = ?auto_207372 ?auto_207377 ) ) ( not ( = ?auto_207372 ?auto_207378 ) ) ( not ( = ?auto_207372 ?auto_207379 ) ) ( not ( = ?auto_207372 ?auto_207380 ) ) ( not ( = ?auto_207372 ?auto_207381 ) ) ( not ( = ?auto_207372 ?auto_207382 ) ) ( not ( = ?auto_207373 ?auto_207374 ) ) ( not ( = ?auto_207373 ?auto_207375 ) ) ( not ( = ?auto_207373 ?auto_207376 ) ) ( not ( = ?auto_207373 ?auto_207377 ) ) ( not ( = ?auto_207373 ?auto_207378 ) ) ( not ( = ?auto_207373 ?auto_207379 ) ) ( not ( = ?auto_207373 ?auto_207380 ) ) ( not ( = ?auto_207373 ?auto_207381 ) ) ( not ( = ?auto_207373 ?auto_207382 ) ) ( not ( = ?auto_207374 ?auto_207375 ) ) ( not ( = ?auto_207374 ?auto_207376 ) ) ( not ( = ?auto_207374 ?auto_207377 ) ) ( not ( = ?auto_207374 ?auto_207378 ) ) ( not ( = ?auto_207374 ?auto_207379 ) ) ( not ( = ?auto_207374 ?auto_207380 ) ) ( not ( = ?auto_207374 ?auto_207381 ) ) ( not ( = ?auto_207374 ?auto_207382 ) ) ( not ( = ?auto_207375 ?auto_207376 ) ) ( not ( = ?auto_207375 ?auto_207377 ) ) ( not ( = ?auto_207375 ?auto_207378 ) ) ( not ( = ?auto_207375 ?auto_207379 ) ) ( not ( = ?auto_207375 ?auto_207380 ) ) ( not ( = ?auto_207375 ?auto_207381 ) ) ( not ( = ?auto_207375 ?auto_207382 ) ) ( not ( = ?auto_207376 ?auto_207377 ) ) ( not ( = ?auto_207376 ?auto_207378 ) ) ( not ( = ?auto_207376 ?auto_207379 ) ) ( not ( = ?auto_207376 ?auto_207380 ) ) ( not ( = ?auto_207376 ?auto_207381 ) ) ( not ( = ?auto_207376 ?auto_207382 ) ) ( not ( = ?auto_207377 ?auto_207378 ) ) ( not ( = ?auto_207377 ?auto_207379 ) ) ( not ( = ?auto_207377 ?auto_207380 ) ) ( not ( = ?auto_207377 ?auto_207381 ) ) ( not ( = ?auto_207377 ?auto_207382 ) ) ( not ( = ?auto_207378 ?auto_207379 ) ) ( not ( = ?auto_207378 ?auto_207380 ) ) ( not ( = ?auto_207378 ?auto_207381 ) ) ( not ( = ?auto_207378 ?auto_207382 ) ) ( not ( = ?auto_207379 ?auto_207380 ) ) ( not ( = ?auto_207379 ?auto_207381 ) ) ( not ( = ?auto_207379 ?auto_207382 ) ) ( not ( = ?auto_207380 ?auto_207381 ) ) ( not ( = ?auto_207380 ?auto_207382 ) ) ( not ( = ?auto_207381 ?auto_207382 ) ) ( ON ?auto_207380 ?auto_207381 ) ( ON ?auto_207379 ?auto_207380 ) ( ON ?auto_207378 ?auto_207379 ) ( ON ?auto_207377 ?auto_207378 ) ( CLEAR ?auto_207375 ) ( ON ?auto_207376 ?auto_207377 ) ( CLEAR ?auto_207376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_207371 ?auto_207372 ?auto_207373 ?auto_207374 ?auto_207375 ?auto_207376 )
      ( MAKE-11PILE ?auto_207371 ?auto_207372 ?auto_207373 ?auto_207374 ?auto_207375 ?auto_207376 ?auto_207377 ?auto_207378 ?auto_207379 ?auto_207380 ?auto_207381 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_207417 - BLOCK
      ?auto_207418 - BLOCK
      ?auto_207419 - BLOCK
      ?auto_207420 - BLOCK
      ?auto_207421 - BLOCK
      ?auto_207422 - BLOCK
      ?auto_207423 - BLOCK
      ?auto_207424 - BLOCK
      ?auto_207425 - BLOCK
      ?auto_207426 - BLOCK
      ?auto_207427 - BLOCK
    )
    :vars
    (
      ?auto_207428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207427 ?auto_207428 ) ( ON-TABLE ?auto_207417 ) ( ON ?auto_207418 ?auto_207417 ) ( ON ?auto_207419 ?auto_207418 ) ( ON ?auto_207420 ?auto_207419 ) ( not ( = ?auto_207417 ?auto_207418 ) ) ( not ( = ?auto_207417 ?auto_207419 ) ) ( not ( = ?auto_207417 ?auto_207420 ) ) ( not ( = ?auto_207417 ?auto_207421 ) ) ( not ( = ?auto_207417 ?auto_207422 ) ) ( not ( = ?auto_207417 ?auto_207423 ) ) ( not ( = ?auto_207417 ?auto_207424 ) ) ( not ( = ?auto_207417 ?auto_207425 ) ) ( not ( = ?auto_207417 ?auto_207426 ) ) ( not ( = ?auto_207417 ?auto_207427 ) ) ( not ( = ?auto_207417 ?auto_207428 ) ) ( not ( = ?auto_207418 ?auto_207419 ) ) ( not ( = ?auto_207418 ?auto_207420 ) ) ( not ( = ?auto_207418 ?auto_207421 ) ) ( not ( = ?auto_207418 ?auto_207422 ) ) ( not ( = ?auto_207418 ?auto_207423 ) ) ( not ( = ?auto_207418 ?auto_207424 ) ) ( not ( = ?auto_207418 ?auto_207425 ) ) ( not ( = ?auto_207418 ?auto_207426 ) ) ( not ( = ?auto_207418 ?auto_207427 ) ) ( not ( = ?auto_207418 ?auto_207428 ) ) ( not ( = ?auto_207419 ?auto_207420 ) ) ( not ( = ?auto_207419 ?auto_207421 ) ) ( not ( = ?auto_207419 ?auto_207422 ) ) ( not ( = ?auto_207419 ?auto_207423 ) ) ( not ( = ?auto_207419 ?auto_207424 ) ) ( not ( = ?auto_207419 ?auto_207425 ) ) ( not ( = ?auto_207419 ?auto_207426 ) ) ( not ( = ?auto_207419 ?auto_207427 ) ) ( not ( = ?auto_207419 ?auto_207428 ) ) ( not ( = ?auto_207420 ?auto_207421 ) ) ( not ( = ?auto_207420 ?auto_207422 ) ) ( not ( = ?auto_207420 ?auto_207423 ) ) ( not ( = ?auto_207420 ?auto_207424 ) ) ( not ( = ?auto_207420 ?auto_207425 ) ) ( not ( = ?auto_207420 ?auto_207426 ) ) ( not ( = ?auto_207420 ?auto_207427 ) ) ( not ( = ?auto_207420 ?auto_207428 ) ) ( not ( = ?auto_207421 ?auto_207422 ) ) ( not ( = ?auto_207421 ?auto_207423 ) ) ( not ( = ?auto_207421 ?auto_207424 ) ) ( not ( = ?auto_207421 ?auto_207425 ) ) ( not ( = ?auto_207421 ?auto_207426 ) ) ( not ( = ?auto_207421 ?auto_207427 ) ) ( not ( = ?auto_207421 ?auto_207428 ) ) ( not ( = ?auto_207422 ?auto_207423 ) ) ( not ( = ?auto_207422 ?auto_207424 ) ) ( not ( = ?auto_207422 ?auto_207425 ) ) ( not ( = ?auto_207422 ?auto_207426 ) ) ( not ( = ?auto_207422 ?auto_207427 ) ) ( not ( = ?auto_207422 ?auto_207428 ) ) ( not ( = ?auto_207423 ?auto_207424 ) ) ( not ( = ?auto_207423 ?auto_207425 ) ) ( not ( = ?auto_207423 ?auto_207426 ) ) ( not ( = ?auto_207423 ?auto_207427 ) ) ( not ( = ?auto_207423 ?auto_207428 ) ) ( not ( = ?auto_207424 ?auto_207425 ) ) ( not ( = ?auto_207424 ?auto_207426 ) ) ( not ( = ?auto_207424 ?auto_207427 ) ) ( not ( = ?auto_207424 ?auto_207428 ) ) ( not ( = ?auto_207425 ?auto_207426 ) ) ( not ( = ?auto_207425 ?auto_207427 ) ) ( not ( = ?auto_207425 ?auto_207428 ) ) ( not ( = ?auto_207426 ?auto_207427 ) ) ( not ( = ?auto_207426 ?auto_207428 ) ) ( not ( = ?auto_207427 ?auto_207428 ) ) ( ON ?auto_207426 ?auto_207427 ) ( ON ?auto_207425 ?auto_207426 ) ( ON ?auto_207424 ?auto_207425 ) ( ON ?auto_207423 ?auto_207424 ) ( ON ?auto_207422 ?auto_207423 ) ( CLEAR ?auto_207420 ) ( ON ?auto_207421 ?auto_207422 ) ( CLEAR ?auto_207421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_207417 ?auto_207418 ?auto_207419 ?auto_207420 ?auto_207421 )
      ( MAKE-11PILE ?auto_207417 ?auto_207418 ?auto_207419 ?auto_207420 ?auto_207421 ?auto_207422 ?auto_207423 ?auto_207424 ?auto_207425 ?auto_207426 ?auto_207427 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_207463 - BLOCK
      ?auto_207464 - BLOCK
      ?auto_207465 - BLOCK
      ?auto_207466 - BLOCK
      ?auto_207467 - BLOCK
      ?auto_207468 - BLOCK
      ?auto_207469 - BLOCK
      ?auto_207470 - BLOCK
      ?auto_207471 - BLOCK
      ?auto_207472 - BLOCK
      ?auto_207473 - BLOCK
    )
    :vars
    (
      ?auto_207474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207473 ?auto_207474 ) ( ON-TABLE ?auto_207463 ) ( ON ?auto_207464 ?auto_207463 ) ( ON ?auto_207465 ?auto_207464 ) ( not ( = ?auto_207463 ?auto_207464 ) ) ( not ( = ?auto_207463 ?auto_207465 ) ) ( not ( = ?auto_207463 ?auto_207466 ) ) ( not ( = ?auto_207463 ?auto_207467 ) ) ( not ( = ?auto_207463 ?auto_207468 ) ) ( not ( = ?auto_207463 ?auto_207469 ) ) ( not ( = ?auto_207463 ?auto_207470 ) ) ( not ( = ?auto_207463 ?auto_207471 ) ) ( not ( = ?auto_207463 ?auto_207472 ) ) ( not ( = ?auto_207463 ?auto_207473 ) ) ( not ( = ?auto_207463 ?auto_207474 ) ) ( not ( = ?auto_207464 ?auto_207465 ) ) ( not ( = ?auto_207464 ?auto_207466 ) ) ( not ( = ?auto_207464 ?auto_207467 ) ) ( not ( = ?auto_207464 ?auto_207468 ) ) ( not ( = ?auto_207464 ?auto_207469 ) ) ( not ( = ?auto_207464 ?auto_207470 ) ) ( not ( = ?auto_207464 ?auto_207471 ) ) ( not ( = ?auto_207464 ?auto_207472 ) ) ( not ( = ?auto_207464 ?auto_207473 ) ) ( not ( = ?auto_207464 ?auto_207474 ) ) ( not ( = ?auto_207465 ?auto_207466 ) ) ( not ( = ?auto_207465 ?auto_207467 ) ) ( not ( = ?auto_207465 ?auto_207468 ) ) ( not ( = ?auto_207465 ?auto_207469 ) ) ( not ( = ?auto_207465 ?auto_207470 ) ) ( not ( = ?auto_207465 ?auto_207471 ) ) ( not ( = ?auto_207465 ?auto_207472 ) ) ( not ( = ?auto_207465 ?auto_207473 ) ) ( not ( = ?auto_207465 ?auto_207474 ) ) ( not ( = ?auto_207466 ?auto_207467 ) ) ( not ( = ?auto_207466 ?auto_207468 ) ) ( not ( = ?auto_207466 ?auto_207469 ) ) ( not ( = ?auto_207466 ?auto_207470 ) ) ( not ( = ?auto_207466 ?auto_207471 ) ) ( not ( = ?auto_207466 ?auto_207472 ) ) ( not ( = ?auto_207466 ?auto_207473 ) ) ( not ( = ?auto_207466 ?auto_207474 ) ) ( not ( = ?auto_207467 ?auto_207468 ) ) ( not ( = ?auto_207467 ?auto_207469 ) ) ( not ( = ?auto_207467 ?auto_207470 ) ) ( not ( = ?auto_207467 ?auto_207471 ) ) ( not ( = ?auto_207467 ?auto_207472 ) ) ( not ( = ?auto_207467 ?auto_207473 ) ) ( not ( = ?auto_207467 ?auto_207474 ) ) ( not ( = ?auto_207468 ?auto_207469 ) ) ( not ( = ?auto_207468 ?auto_207470 ) ) ( not ( = ?auto_207468 ?auto_207471 ) ) ( not ( = ?auto_207468 ?auto_207472 ) ) ( not ( = ?auto_207468 ?auto_207473 ) ) ( not ( = ?auto_207468 ?auto_207474 ) ) ( not ( = ?auto_207469 ?auto_207470 ) ) ( not ( = ?auto_207469 ?auto_207471 ) ) ( not ( = ?auto_207469 ?auto_207472 ) ) ( not ( = ?auto_207469 ?auto_207473 ) ) ( not ( = ?auto_207469 ?auto_207474 ) ) ( not ( = ?auto_207470 ?auto_207471 ) ) ( not ( = ?auto_207470 ?auto_207472 ) ) ( not ( = ?auto_207470 ?auto_207473 ) ) ( not ( = ?auto_207470 ?auto_207474 ) ) ( not ( = ?auto_207471 ?auto_207472 ) ) ( not ( = ?auto_207471 ?auto_207473 ) ) ( not ( = ?auto_207471 ?auto_207474 ) ) ( not ( = ?auto_207472 ?auto_207473 ) ) ( not ( = ?auto_207472 ?auto_207474 ) ) ( not ( = ?auto_207473 ?auto_207474 ) ) ( ON ?auto_207472 ?auto_207473 ) ( ON ?auto_207471 ?auto_207472 ) ( ON ?auto_207470 ?auto_207471 ) ( ON ?auto_207469 ?auto_207470 ) ( ON ?auto_207468 ?auto_207469 ) ( ON ?auto_207467 ?auto_207468 ) ( CLEAR ?auto_207465 ) ( ON ?auto_207466 ?auto_207467 ) ( CLEAR ?auto_207466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_207463 ?auto_207464 ?auto_207465 ?auto_207466 )
      ( MAKE-11PILE ?auto_207463 ?auto_207464 ?auto_207465 ?auto_207466 ?auto_207467 ?auto_207468 ?auto_207469 ?auto_207470 ?auto_207471 ?auto_207472 ?auto_207473 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_207509 - BLOCK
      ?auto_207510 - BLOCK
      ?auto_207511 - BLOCK
      ?auto_207512 - BLOCK
      ?auto_207513 - BLOCK
      ?auto_207514 - BLOCK
      ?auto_207515 - BLOCK
      ?auto_207516 - BLOCK
      ?auto_207517 - BLOCK
      ?auto_207518 - BLOCK
      ?auto_207519 - BLOCK
    )
    :vars
    (
      ?auto_207520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207519 ?auto_207520 ) ( ON-TABLE ?auto_207509 ) ( ON ?auto_207510 ?auto_207509 ) ( not ( = ?auto_207509 ?auto_207510 ) ) ( not ( = ?auto_207509 ?auto_207511 ) ) ( not ( = ?auto_207509 ?auto_207512 ) ) ( not ( = ?auto_207509 ?auto_207513 ) ) ( not ( = ?auto_207509 ?auto_207514 ) ) ( not ( = ?auto_207509 ?auto_207515 ) ) ( not ( = ?auto_207509 ?auto_207516 ) ) ( not ( = ?auto_207509 ?auto_207517 ) ) ( not ( = ?auto_207509 ?auto_207518 ) ) ( not ( = ?auto_207509 ?auto_207519 ) ) ( not ( = ?auto_207509 ?auto_207520 ) ) ( not ( = ?auto_207510 ?auto_207511 ) ) ( not ( = ?auto_207510 ?auto_207512 ) ) ( not ( = ?auto_207510 ?auto_207513 ) ) ( not ( = ?auto_207510 ?auto_207514 ) ) ( not ( = ?auto_207510 ?auto_207515 ) ) ( not ( = ?auto_207510 ?auto_207516 ) ) ( not ( = ?auto_207510 ?auto_207517 ) ) ( not ( = ?auto_207510 ?auto_207518 ) ) ( not ( = ?auto_207510 ?auto_207519 ) ) ( not ( = ?auto_207510 ?auto_207520 ) ) ( not ( = ?auto_207511 ?auto_207512 ) ) ( not ( = ?auto_207511 ?auto_207513 ) ) ( not ( = ?auto_207511 ?auto_207514 ) ) ( not ( = ?auto_207511 ?auto_207515 ) ) ( not ( = ?auto_207511 ?auto_207516 ) ) ( not ( = ?auto_207511 ?auto_207517 ) ) ( not ( = ?auto_207511 ?auto_207518 ) ) ( not ( = ?auto_207511 ?auto_207519 ) ) ( not ( = ?auto_207511 ?auto_207520 ) ) ( not ( = ?auto_207512 ?auto_207513 ) ) ( not ( = ?auto_207512 ?auto_207514 ) ) ( not ( = ?auto_207512 ?auto_207515 ) ) ( not ( = ?auto_207512 ?auto_207516 ) ) ( not ( = ?auto_207512 ?auto_207517 ) ) ( not ( = ?auto_207512 ?auto_207518 ) ) ( not ( = ?auto_207512 ?auto_207519 ) ) ( not ( = ?auto_207512 ?auto_207520 ) ) ( not ( = ?auto_207513 ?auto_207514 ) ) ( not ( = ?auto_207513 ?auto_207515 ) ) ( not ( = ?auto_207513 ?auto_207516 ) ) ( not ( = ?auto_207513 ?auto_207517 ) ) ( not ( = ?auto_207513 ?auto_207518 ) ) ( not ( = ?auto_207513 ?auto_207519 ) ) ( not ( = ?auto_207513 ?auto_207520 ) ) ( not ( = ?auto_207514 ?auto_207515 ) ) ( not ( = ?auto_207514 ?auto_207516 ) ) ( not ( = ?auto_207514 ?auto_207517 ) ) ( not ( = ?auto_207514 ?auto_207518 ) ) ( not ( = ?auto_207514 ?auto_207519 ) ) ( not ( = ?auto_207514 ?auto_207520 ) ) ( not ( = ?auto_207515 ?auto_207516 ) ) ( not ( = ?auto_207515 ?auto_207517 ) ) ( not ( = ?auto_207515 ?auto_207518 ) ) ( not ( = ?auto_207515 ?auto_207519 ) ) ( not ( = ?auto_207515 ?auto_207520 ) ) ( not ( = ?auto_207516 ?auto_207517 ) ) ( not ( = ?auto_207516 ?auto_207518 ) ) ( not ( = ?auto_207516 ?auto_207519 ) ) ( not ( = ?auto_207516 ?auto_207520 ) ) ( not ( = ?auto_207517 ?auto_207518 ) ) ( not ( = ?auto_207517 ?auto_207519 ) ) ( not ( = ?auto_207517 ?auto_207520 ) ) ( not ( = ?auto_207518 ?auto_207519 ) ) ( not ( = ?auto_207518 ?auto_207520 ) ) ( not ( = ?auto_207519 ?auto_207520 ) ) ( ON ?auto_207518 ?auto_207519 ) ( ON ?auto_207517 ?auto_207518 ) ( ON ?auto_207516 ?auto_207517 ) ( ON ?auto_207515 ?auto_207516 ) ( ON ?auto_207514 ?auto_207515 ) ( ON ?auto_207513 ?auto_207514 ) ( ON ?auto_207512 ?auto_207513 ) ( CLEAR ?auto_207510 ) ( ON ?auto_207511 ?auto_207512 ) ( CLEAR ?auto_207511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_207509 ?auto_207510 ?auto_207511 )
      ( MAKE-11PILE ?auto_207509 ?auto_207510 ?auto_207511 ?auto_207512 ?auto_207513 ?auto_207514 ?auto_207515 ?auto_207516 ?auto_207517 ?auto_207518 ?auto_207519 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_207555 - BLOCK
      ?auto_207556 - BLOCK
      ?auto_207557 - BLOCK
      ?auto_207558 - BLOCK
      ?auto_207559 - BLOCK
      ?auto_207560 - BLOCK
      ?auto_207561 - BLOCK
      ?auto_207562 - BLOCK
      ?auto_207563 - BLOCK
      ?auto_207564 - BLOCK
      ?auto_207565 - BLOCK
    )
    :vars
    (
      ?auto_207566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207565 ?auto_207566 ) ( ON-TABLE ?auto_207555 ) ( not ( = ?auto_207555 ?auto_207556 ) ) ( not ( = ?auto_207555 ?auto_207557 ) ) ( not ( = ?auto_207555 ?auto_207558 ) ) ( not ( = ?auto_207555 ?auto_207559 ) ) ( not ( = ?auto_207555 ?auto_207560 ) ) ( not ( = ?auto_207555 ?auto_207561 ) ) ( not ( = ?auto_207555 ?auto_207562 ) ) ( not ( = ?auto_207555 ?auto_207563 ) ) ( not ( = ?auto_207555 ?auto_207564 ) ) ( not ( = ?auto_207555 ?auto_207565 ) ) ( not ( = ?auto_207555 ?auto_207566 ) ) ( not ( = ?auto_207556 ?auto_207557 ) ) ( not ( = ?auto_207556 ?auto_207558 ) ) ( not ( = ?auto_207556 ?auto_207559 ) ) ( not ( = ?auto_207556 ?auto_207560 ) ) ( not ( = ?auto_207556 ?auto_207561 ) ) ( not ( = ?auto_207556 ?auto_207562 ) ) ( not ( = ?auto_207556 ?auto_207563 ) ) ( not ( = ?auto_207556 ?auto_207564 ) ) ( not ( = ?auto_207556 ?auto_207565 ) ) ( not ( = ?auto_207556 ?auto_207566 ) ) ( not ( = ?auto_207557 ?auto_207558 ) ) ( not ( = ?auto_207557 ?auto_207559 ) ) ( not ( = ?auto_207557 ?auto_207560 ) ) ( not ( = ?auto_207557 ?auto_207561 ) ) ( not ( = ?auto_207557 ?auto_207562 ) ) ( not ( = ?auto_207557 ?auto_207563 ) ) ( not ( = ?auto_207557 ?auto_207564 ) ) ( not ( = ?auto_207557 ?auto_207565 ) ) ( not ( = ?auto_207557 ?auto_207566 ) ) ( not ( = ?auto_207558 ?auto_207559 ) ) ( not ( = ?auto_207558 ?auto_207560 ) ) ( not ( = ?auto_207558 ?auto_207561 ) ) ( not ( = ?auto_207558 ?auto_207562 ) ) ( not ( = ?auto_207558 ?auto_207563 ) ) ( not ( = ?auto_207558 ?auto_207564 ) ) ( not ( = ?auto_207558 ?auto_207565 ) ) ( not ( = ?auto_207558 ?auto_207566 ) ) ( not ( = ?auto_207559 ?auto_207560 ) ) ( not ( = ?auto_207559 ?auto_207561 ) ) ( not ( = ?auto_207559 ?auto_207562 ) ) ( not ( = ?auto_207559 ?auto_207563 ) ) ( not ( = ?auto_207559 ?auto_207564 ) ) ( not ( = ?auto_207559 ?auto_207565 ) ) ( not ( = ?auto_207559 ?auto_207566 ) ) ( not ( = ?auto_207560 ?auto_207561 ) ) ( not ( = ?auto_207560 ?auto_207562 ) ) ( not ( = ?auto_207560 ?auto_207563 ) ) ( not ( = ?auto_207560 ?auto_207564 ) ) ( not ( = ?auto_207560 ?auto_207565 ) ) ( not ( = ?auto_207560 ?auto_207566 ) ) ( not ( = ?auto_207561 ?auto_207562 ) ) ( not ( = ?auto_207561 ?auto_207563 ) ) ( not ( = ?auto_207561 ?auto_207564 ) ) ( not ( = ?auto_207561 ?auto_207565 ) ) ( not ( = ?auto_207561 ?auto_207566 ) ) ( not ( = ?auto_207562 ?auto_207563 ) ) ( not ( = ?auto_207562 ?auto_207564 ) ) ( not ( = ?auto_207562 ?auto_207565 ) ) ( not ( = ?auto_207562 ?auto_207566 ) ) ( not ( = ?auto_207563 ?auto_207564 ) ) ( not ( = ?auto_207563 ?auto_207565 ) ) ( not ( = ?auto_207563 ?auto_207566 ) ) ( not ( = ?auto_207564 ?auto_207565 ) ) ( not ( = ?auto_207564 ?auto_207566 ) ) ( not ( = ?auto_207565 ?auto_207566 ) ) ( ON ?auto_207564 ?auto_207565 ) ( ON ?auto_207563 ?auto_207564 ) ( ON ?auto_207562 ?auto_207563 ) ( ON ?auto_207561 ?auto_207562 ) ( ON ?auto_207560 ?auto_207561 ) ( ON ?auto_207559 ?auto_207560 ) ( ON ?auto_207558 ?auto_207559 ) ( ON ?auto_207557 ?auto_207558 ) ( CLEAR ?auto_207555 ) ( ON ?auto_207556 ?auto_207557 ) ( CLEAR ?auto_207556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_207555 ?auto_207556 )
      ( MAKE-11PILE ?auto_207555 ?auto_207556 ?auto_207557 ?auto_207558 ?auto_207559 ?auto_207560 ?auto_207561 ?auto_207562 ?auto_207563 ?auto_207564 ?auto_207565 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_207601 - BLOCK
      ?auto_207602 - BLOCK
      ?auto_207603 - BLOCK
      ?auto_207604 - BLOCK
      ?auto_207605 - BLOCK
      ?auto_207606 - BLOCK
      ?auto_207607 - BLOCK
      ?auto_207608 - BLOCK
      ?auto_207609 - BLOCK
      ?auto_207610 - BLOCK
      ?auto_207611 - BLOCK
    )
    :vars
    (
      ?auto_207612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207611 ?auto_207612 ) ( not ( = ?auto_207601 ?auto_207602 ) ) ( not ( = ?auto_207601 ?auto_207603 ) ) ( not ( = ?auto_207601 ?auto_207604 ) ) ( not ( = ?auto_207601 ?auto_207605 ) ) ( not ( = ?auto_207601 ?auto_207606 ) ) ( not ( = ?auto_207601 ?auto_207607 ) ) ( not ( = ?auto_207601 ?auto_207608 ) ) ( not ( = ?auto_207601 ?auto_207609 ) ) ( not ( = ?auto_207601 ?auto_207610 ) ) ( not ( = ?auto_207601 ?auto_207611 ) ) ( not ( = ?auto_207601 ?auto_207612 ) ) ( not ( = ?auto_207602 ?auto_207603 ) ) ( not ( = ?auto_207602 ?auto_207604 ) ) ( not ( = ?auto_207602 ?auto_207605 ) ) ( not ( = ?auto_207602 ?auto_207606 ) ) ( not ( = ?auto_207602 ?auto_207607 ) ) ( not ( = ?auto_207602 ?auto_207608 ) ) ( not ( = ?auto_207602 ?auto_207609 ) ) ( not ( = ?auto_207602 ?auto_207610 ) ) ( not ( = ?auto_207602 ?auto_207611 ) ) ( not ( = ?auto_207602 ?auto_207612 ) ) ( not ( = ?auto_207603 ?auto_207604 ) ) ( not ( = ?auto_207603 ?auto_207605 ) ) ( not ( = ?auto_207603 ?auto_207606 ) ) ( not ( = ?auto_207603 ?auto_207607 ) ) ( not ( = ?auto_207603 ?auto_207608 ) ) ( not ( = ?auto_207603 ?auto_207609 ) ) ( not ( = ?auto_207603 ?auto_207610 ) ) ( not ( = ?auto_207603 ?auto_207611 ) ) ( not ( = ?auto_207603 ?auto_207612 ) ) ( not ( = ?auto_207604 ?auto_207605 ) ) ( not ( = ?auto_207604 ?auto_207606 ) ) ( not ( = ?auto_207604 ?auto_207607 ) ) ( not ( = ?auto_207604 ?auto_207608 ) ) ( not ( = ?auto_207604 ?auto_207609 ) ) ( not ( = ?auto_207604 ?auto_207610 ) ) ( not ( = ?auto_207604 ?auto_207611 ) ) ( not ( = ?auto_207604 ?auto_207612 ) ) ( not ( = ?auto_207605 ?auto_207606 ) ) ( not ( = ?auto_207605 ?auto_207607 ) ) ( not ( = ?auto_207605 ?auto_207608 ) ) ( not ( = ?auto_207605 ?auto_207609 ) ) ( not ( = ?auto_207605 ?auto_207610 ) ) ( not ( = ?auto_207605 ?auto_207611 ) ) ( not ( = ?auto_207605 ?auto_207612 ) ) ( not ( = ?auto_207606 ?auto_207607 ) ) ( not ( = ?auto_207606 ?auto_207608 ) ) ( not ( = ?auto_207606 ?auto_207609 ) ) ( not ( = ?auto_207606 ?auto_207610 ) ) ( not ( = ?auto_207606 ?auto_207611 ) ) ( not ( = ?auto_207606 ?auto_207612 ) ) ( not ( = ?auto_207607 ?auto_207608 ) ) ( not ( = ?auto_207607 ?auto_207609 ) ) ( not ( = ?auto_207607 ?auto_207610 ) ) ( not ( = ?auto_207607 ?auto_207611 ) ) ( not ( = ?auto_207607 ?auto_207612 ) ) ( not ( = ?auto_207608 ?auto_207609 ) ) ( not ( = ?auto_207608 ?auto_207610 ) ) ( not ( = ?auto_207608 ?auto_207611 ) ) ( not ( = ?auto_207608 ?auto_207612 ) ) ( not ( = ?auto_207609 ?auto_207610 ) ) ( not ( = ?auto_207609 ?auto_207611 ) ) ( not ( = ?auto_207609 ?auto_207612 ) ) ( not ( = ?auto_207610 ?auto_207611 ) ) ( not ( = ?auto_207610 ?auto_207612 ) ) ( not ( = ?auto_207611 ?auto_207612 ) ) ( ON ?auto_207610 ?auto_207611 ) ( ON ?auto_207609 ?auto_207610 ) ( ON ?auto_207608 ?auto_207609 ) ( ON ?auto_207607 ?auto_207608 ) ( ON ?auto_207606 ?auto_207607 ) ( ON ?auto_207605 ?auto_207606 ) ( ON ?auto_207604 ?auto_207605 ) ( ON ?auto_207603 ?auto_207604 ) ( ON ?auto_207602 ?auto_207603 ) ( ON ?auto_207601 ?auto_207602 ) ( CLEAR ?auto_207601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_207601 )
      ( MAKE-11PILE ?auto_207601 ?auto_207602 ?auto_207603 ?auto_207604 ?auto_207605 ?auto_207606 ?auto_207607 ?auto_207608 ?auto_207609 ?auto_207610 ?auto_207611 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_207648 - BLOCK
      ?auto_207649 - BLOCK
      ?auto_207650 - BLOCK
      ?auto_207651 - BLOCK
      ?auto_207652 - BLOCK
      ?auto_207653 - BLOCK
      ?auto_207654 - BLOCK
      ?auto_207655 - BLOCK
      ?auto_207656 - BLOCK
      ?auto_207657 - BLOCK
      ?auto_207658 - BLOCK
      ?auto_207659 - BLOCK
    )
    :vars
    (
      ?auto_207660 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_207658 ) ( ON ?auto_207659 ?auto_207660 ) ( CLEAR ?auto_207659 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_207648 ) ( ON ?auto_207649 ?auto_207648 ) ( ON ?auto_207650 ?auto_207649 ) ( ON ?auto_207651 ?auto_207650 ) ( ON ?auto_207652 ?auto_207651 ) ( ON ?auto_207653 ?auto_207652 ) ( ON ?auto_207654 ?auto_207653 ) ( ON ?auto_207655 ?auto_207654 ) ( ON ?auto_207656 ?auto_207655 ) ( ON ?auto_207657 ?auto_207656 ) ( ON ?auto_207658 ?auto_207657 ) ( not ( = ?auto_207648 ?auto_207649 ) ) ( not ( = ?auto_207648 ?auto_207650 ) ) ( not ( = ?auto_207648 ?auto_207651 ) ) ( not ( = ?auto_207648 ?auto_207652 ) ) ( not ( = ?auto_207648 ?auto_207653 ) ) ( not ( = ?auto_207648 ?auto_207654 ) ) ( not ( = ?auto_207648 ?auto_207655 ) ) ( not ( = ?auto_207648 ?auto_207656 ) ) ( not ( = ?auto_207648 ?auto_207657 ) ) ( not ( = ?auto_207648 ?auto_207658 ) ) ( not ( = ?auto_207648 ?auto_207659 ) ) ( not ( = ?auto_207648 ?auto_207660 ) ) ( not ( = ?auto_207649 ?auto_207650 ) ) ( not ( = ?auto_207649 ?auto_207651 ) ) ( not ( = ?auto_207649 ?auto_207652 ) ) ( not ( = ?auto_207649 ?auto_207653 ) ) ( not ( = ?auto_207649 ?auto_207654 ) ) ( not ( = ?auto_207649 ?auto_207655 ) ) ( not ( = ?auto_207649 ?auto_207656 ) ) ( not ( = ?auto_207649 ?auto_207657 ) ) ( not ( = ?auto_207649 ?auto_207658 ) ) ( not ( = ?auto_207649 ?auto_207659 ) ) ( not ( = ?auto_207649 ?auto_207660 ) ) ( not ( = ?auto_207650 ?auto_207651 ) ) ( not ( = ?auto_207650 ?auto_207652 ) ) ( not ( = ?auto_207650 ?auto_207653 ) ) ( not ( = ?auto_207650 ?auto_207654 ) ) ( not ( = ?auto_207650 ?auto_207655 ) ) ( not ( = ?auto_207650 ?auto_207656 ) ) ( not ( = ?auto_207650 ?auto_207657 ) ) ( not ( = ?auto_207650 ?auto_207658 ) ) ( not ( = ?auto_207650 ?auto_207659 ) ) ( not ( = ?auto_207650 ?auto_207660 ) ) ( not ( = ?auto_207651 ?auto_207652 ) ) ( not ( = ?auto_207651 ?auto_207653 ) ) ( not ( = ?auto_207651 ?auto_207654 ) ) ( not ( = ?auto_207651 ?auto_207655 ) ) ( not ( = ?auto_207651 ?auto_207656 ) ) ( not ( = ?auto_207651 ?auto_207657 ) ) ( not ( = ?auto_207651 ?auto_207658 ) ) ( not ( = ?auto_207651 ?auto_207659 ) ) ( not ( = ?auto_207651 ?auto_207660 ) ) ( not ( = ?auto_207652 ?auto_207653 ) ) ( not ( = ?auto_207652 ?auto_207654 ) ) ( not ( = ?auto_207652 ?auto_207655 ) ) ( not ( = ?auto_207652 ?auto_207656 ) ) ( not ( = ?auto_207652 ?auto_207657 ) ) ( not ( = ?auto_207652 ?auto_207658 ) ) ( not ( = ?auto_207652 ?auto_207659 ) ) ( not ( = ?auto_207652 ?auto_207660 ) ) ( not ( = ?auto_207653 ?auto_207654 ) ) ( not ( = ?auto_207653 ?auto_207655 ) ) ( not ( = ?auto_207653 ?auto_207656 ) ) ( not ( = ?auto_207653 ?auto_207657 ) ) ( not ( = ?auto_207653 ?auto_207658 ) ) ( not ( = ?auto_207653 ?auto_207659 ) ) ( not ( = ?auto_207653 ?auto_207660 ) ) ( not ( = ?auto_207654 ?auto_207655 ) ) ( not ( = ?auto_207654 ?auto_207656 ) ) ( not ( = ?auto_207654 ?auto_207657 ) ) ( not ( = ?auto_207654 ?auto_207658 ) ) ( not ( = ?auto_207654 ?auto_207659 ) ) ( not ( = ?auto_207654 ?auto_207660 ) ) ( not ( = ?auto_207655 ?auto_207656 ) ) ( not ( = ?auto_207655 ?auto_207657 ) ) ( not ( = ?auto_207655 ?auto_207658 ) ) ( not ( = ?auto_207655 ?auto_207659 ) ) ( not ( = ?auto_207655 ?auto_207660 ) ) ( not ( = ?auto_207656 ?auto_207657 ) ) ( not ( = ?auto_207656 ?auto_207658 ) ) ( not ( = ?auto_207656 ?auto_207659 ) ) ( not ( = ?auto_207656 ?auto_207660 ) ) ( not ( = ?auto_207657 ?auto_207658 ) ) ( not ( = ?auto_207657 ?auto_207659 ) ) ( not ( = ?auto_207657 ?auto_207660 ) ) ( not ( = ?auto_207658 ?auto_207659 ) ) ( not ( = ?auto_207658 ?auto_207660 ) ) ( not ( = ?auto_207659 ?auto_207660 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_207659 ?auto_207660 )
      ( !STACK ?auto_207659 ?auto_207658 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_207698 - BLOCK
      ?auto_207699 - BLOCK
      ?auto_207700 - BLOCK
      ?auto_207701 - BLOCK
      ?auto_207702 - BLOCK
      ?auto_207703 - BLOCK
      ?auto_207704 - BLOCK
      ?auto_207705 - BLOCK
      ?auto_207706 - BLOCK
      ?auto_207707 - BLOCK
      ?auto_207708 - BLOCK
      ?auto_207709 - BLOCK
    )
    :vars
    (
      ?auto_207710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207709 ?auto_207710 ) ( ON-TABLE ?auto_207698 ) ( ON ?auto_207699 ?auto_207698 ) ( ON ?auto_207700 ?auto_207699 ) ( ON ?auto_207701 ?auto_207700 ) ( ON ?auto_207702 ?auto_207701 ) ( ON ?auto_207703 ?auto_207702 ) ( ON ?auto_207704 ?auto_207703 ) ( ON ?auto_207705 ?auto_207704 ) ( ON ?auto_207706 ?auto_207705 ) ( ON ?auto_207707 ?auto_207706 ) ( not ( = ?auto_207698 ?auto_207699 ) ) ( not ( = ?auto_207698 ?auto_207700 ) ) ( not ( = ?auto_207698 ?auto_207701 ) ) ( not ( = ?auto_207698 ?auto_207702 ) ) ( not ( = ?auto_207698 ?auto_207703 ) ) ( not ( = ?auto_207698 ?auto_207704 ) ) ( not ( = ?auto_207698 ?auto_207705 ) ) ( not ( = ?auto_207698 ?auto_207706 ) ) ( not ( = ?auto_207698 ?auto_207707 ) ) ( not ( = ?auto_207698 ?auto_207708 ) ) ( not ( = ?auto_207698 ?auto_207709 ) ) ( not ( = ?auto_207698 ?auto_207710 ) ) ( not ( = ?auto_207699 ?auto_207700 ) ) ( not ( = ?auto_207699 ?auto_207701 ) ) ( not ( = ?auto_207699 ?auto_207702 ) ) ( not ( = ?auto_207699 ?auto_207703 ) ) ( not ( = ?auto_207699 ?auto_207704 ) ) ( not ( = ?auto_207699 ?auto_207705 ) ) ( not ( = ?auto_207699 ?auto_207706 ) ) ( not ( = ?auto_207699 ?auto_207707 ) ) ( not ( = ?auto_207699 ?auto_207708 ) ) ( not ( = ?auto_207699 ?auto_207709 ) ) ( not ( = ?auto_207699 ?auto_207710 ) ) ( not ( = ?auto_207700 ?auto_207701 ) ) ( not ( = ?auto_207700 ?auto_207702 ) ) ( not ( = ?auto_207700 ?auto_207703 ) ) ( not ( = ?auto_207700 ?auto_207704 ) ) ( not ( = ?auto_207700 ?auto_207705 ) ) ( not ( = ?auto_207700 ?auto_207706 ) ) ( not ( = ?auto_207700 ?auto_207707 ) ) ( not ( = ?auto_207700 ?auto_207708 ) ) ( not ( = ?auto_207700 ?auto_207709 ) ) ( not ( = ?auto_207700 ?auto_207710 ) ) ( not ( = ?auto_207701 ?auto_207702 ) ) ( not ( = ?auto_207701 ?auto_207703 ) ) ( not ( = ?auto_207701 ?auto_207704 ) ) ( not ( = ?auto_207701 ?auto_207705 ) ) ( not ( = ?auto_207701 ?auto_207706 ) ) ( not ( = ?auto_207701 ?auto_207707 ) ) ( not ( = ?auto_207701 ?auto_207708 ) ) ( not ( = ?auto_207701 ?auto_207709 ) ) ( not ( = ?auto_207701 ?auto_207710 ) ) ( not ( = ?auto_207702 ?auto_207703 ) ) ( not ( = ?auto_207702 ?auto_207704 ) ) ( not ( = ?auto_207702 ?auto_207705 ) ) ( not ( = ?auto_207702 ?auto_207706 ) ) ( not ( = ?auto_207702 ?auto_207707 ) ) ( not ( = ?auto_207702 ?auto_207708 ) ) ( not ( = ?auto_207702 ?auto_207709 ) ) ( not ( = ?auto_207702 ?auto_207710 ) ) ( not ( = ?auto_207703 ?auto_207704 ) ) ( not ( = ?auto_207703 ?auto_207705 ) ) ( not ( = ?auto_207703 ?auto_207706 ) ) ( not ( = ?auto_207703 ?auto_207707 ) ) ( not ( = ?auto_207703 ?auto_207708 ) ) ( not ( = ?auto_207703 ?auto_207709 ) ) ( not ( = ?auto_207703 ?auto_207710 ) ) ( not ( = ?auto_207704 ?auto_207705 ) ) ( not ( = ?auto_207704 ?auto_207706 ) ) ( not ( = ?auto_207704 ?auto_207707 ) ) ( not ( = ?auto_207704 ?auto_207708 ) ) ( not ( = ?auto_207704 ?auto_207709 ) ) ( not ( = ?auto_207704 ?auto_207710 ) ) ( not ( = ?auto_207705 ?auto_207706 ) ) ( not ( = ?auto_207705 ?auto_207707 ) ) ( not ( = ?auto_207705 ?auto_207708 ) ) ( not ( = ?auto_207705 ?auto_207709 ) ) ( not ( = ?auto_207705 ?auto_207710 ) ) ( not ( = ?auto_207706 ?auto_207707 ) ) ( not ( = ?auto_207706 ?auto_207708 ) ) ( not ( = ?auto_207706 ?auto_207709 ) ) ( not ( = ?auto_207706 ?auto_207710 ) ) ( not ( = ?auto_207707 ?auto_207708 ) ) ( not ( = ?auto_207707 ?auto_207709 ) ) ( not ( = ?auto_207707 ?auto_207710 ) ) ( not ( = ?auto_207708 ?auto_207709 ) ) ( not ( = ?auto_207708 ?auto_207710 ) ) ( not ( = ?auto_207709 ?auto_207710 ) ) ( CLEAR ?auto_207707 ) ( ON ?auto_207708 ?auto_207709 ) ( CLEAR ?auto_207708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_207698 ?auto_207699 ?auto_207700 ?auto_207701 ?auto_207702 ?auto_207703 ?auto_207704 ?auto_207705 ?auto_207706 ?auto_207707 ?auto_207708 )
      ( MAKE-12PILE ?auto_207698 ?auto_207699 ?auto_207700 ?auto_207701 ?auto_207702 ?auto_207703 ?auto_207704 ?auto_207705 ?auto_207706 ?auto_207707 ?auto_207708 ?auto_207709 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_207748 - BLOCK
      ?auto_207749 - BLOCK
      ?auto_207750 - BLOCK
      ?auto_207751 - BLOCK
      ?auto_207752 - BLOCK
      ?auto_207753 - BLOCK
      ?auto_207754 - BLOCK
      ?auto_207755 - BLOCK
      ?auto_207756 - BLOCK
      ?auto_207757 - BLOCK
      ?auto_207758 - BLOCK
      ?auto_207759 - BLOCK
    )
    :vars
    (
      ?auto_207760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207759 ?auto_207760 ) ( ON-TABLE ?auto_207748 ) ( ON ?auto_207749 ?auto_207748 ) ( ON ?auto_207750 ?auto_207749 ) ( ON ?auto_207751 ?auto_207750 ) ( ON ?auto_207752 ?auto_207751 ) ( ON ?auto_207753 ?auto_207752 ) ( ON ?auto_207754 ?auto_207753 ) ( ON ?auto_207755 ?auto_207754 ) ( ON ?auto_207756 ?auto_207755 ) ( not ( = ?auto_207748 ?auto_207749 ) ) ( not ( = ?auto_207748 ?auto_207750 ) ) ( not ( = ?auto_207748 ?auto_207751 ) ) ( not ( = ?auto_207748 ?auto_207752 ) ) ( not ( = ?auto_207748 ?auto_207753 ) ) ( not ( = ?auto_207748 ?auto_207754 ) ) ( not ( = ?auto_207748 ?auto_207755 ) ) ( not ( = ?auto_207748 ?auto_207756 ) ) ( not ( = ?auto_207748 ?auto_207757 ) ) ( not ( = ?auto_207748 ?auto_207758 ) ) ( not ( = ?auto_207748 ?auto_207759 ) ) ( not ( = ?auto_207748 ?auto_207760 ) ) ( not ( = ?auto_207749 ?auto_207750 ) ) ( not ( = ?auto_207749 ?auto_207751 ) ) ( not ( = ?auto_207749 ?auto_207752 ) ) ( not ( = ?auto_207749 ?auto_207753 ) ) ( not ( = ?auto_207749 ?auto_207754 ) ) ( not ( = ?auto_207749 ?auto_207755 ) ) ( not ( = ?auto_207749 ?auto_207756 ) ) ( not ( = ?auto_207749 ?auto_207757 ) ) ( not ( = ?auto_207749 ?auto_207758 ) ) ( not ( = ?auto_207749 ?auto_207759 ) ) ( not ( = ?auto_207749 ?auto_207760 ) ) ( not ( = ?auto_207750 ?auto_207751 ) ) ( not ( = ?auto_207750 ?auto_207752 ) ) ( not ( = ?auto_207750 ?auto_207753 ) ) ( not ( = ?auto_207750 ?auto_207754 ) ) ( not ( = ?auto_207750 ?auto_207755 ) ) ( not ( = ?auto_207750 ?auto_207756 ) ) ( not ( = ?auto_207750 ?auto_207757 ) ) ( not ( = ?auto_207750 ?auto_207758 ) ) ( not ( = ?auto_207750 ?auto_207759 ) ) ( not ( = ?auto_207750 ?auto_207760 ) ) ( not ( = ?auto_207751 ?auto_207752 ) ) ( not ( = ?auto_207751 ?auto_207753 ) ) ( not ( = ?auto_207751 ?auto_207754 ) ) ( not ( = ?auto_207751 ?auto_207755 ) ) ( not ( = ?auto_207751 ?auto_207756 ) ) ( not ( = ?auto_207751 ?auto_207757 ) ) ( not ( = ?auto_207751 ?auto_207758 ) ) ( not ( = ?auto_207751 ?auto_207759 ) ) ( not ( = ?auto_207751 ?auto_207760 ) ) ( not ( = ?auto_207752 ?auto_207753 ) ) ( not ( = ?auto_207752 ?auto_207754 ) ) ( not ( = ?auto_207752 ?auto_207755 ) ) ( not ( = ?auto_207752 ?auto_207756 ) ) ( not ( = ?auto_207752 ?auto_207757 ) ) ( not ( = ?auto_207752 ?auto_207758 ) ) ( not ( = ?auto_207752 ?auto_207759 ) ) ( not ( = ?auto_207752 ?auto_207760 ) ) ( not ( = ?auto_207753 ?auto_207754 ) ) ( not ( = ?auto_207753 ?auto_207755 ) ) ( not ( = ?auto_207753 ?auto_207756 ) ) ( not ( = ?auto_207753 ?auto_207757 ) ) ( not ( = ?auto_207753 ?auto_207758 ) ) ( not ( = ?auto_207753 ?auto_207759 ) ) ( not ( = ?auto_207753 ?auto_207760 ) ) ( not ( = ?auto_207754 ?auto_207755 ) ) ( not ( = ?auto_207754 ?auto_207756 ) ) ( not ( = ?auto_207754 ?auto_207757 ) ) ( not ( = ?auto_207754 ?auto_207758 ) ) ( not ( = ?auto_207754 ?auto_207759 ) ) ( not ( = ?auto_207754 ?auto_207760 ) ) ( not ( = ?auto_207755 ?auto_207756 ) ) ( not ( = ?auto_207755 ?auto_207757 ) ) ( not ( = ?auto_207755 ?auto_207758 ) ) ( not ( = ?auto_207755 ?auto_207759 ) ) ( not ( = ?auto_207755 ?auto_207760 ) ) ( not ( = ?auto_207756 ?auto_207757 ) ) ( not ( = ?auto_207756 ?auto_207758 ) ) ( not ( = ?auto_207756 ?auto_207759 ) ) ( not ( = ?auto_207756 ?auto_207760 ) ) ( not ( = ?auto_207757 ?auto_207758 ) ) ( not ( = ?auto_207757 ?auto_207759 ) ) ( not ( = ?auto_207757 ?auto_207760 ) ) ( not ( = ?auto_207758 ?auto_207759 ) ) ( not ( = ?auto_207758 ?auto_207760 ) ) ( not ( = ?auto_207759 ?auto_207760 ) ) ( ON ?auto_207758 ?auto_207759 ) ( CLEAR ?auto_207756 ) ( ON ?auto_207757 ?auto_207758 ) ( CLEAR ?auto_207757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_207748 ?auto_207749 ?auto_207750 ?auto_207751 ?auto_207752 ?auto_207753 ?auto_207754 ?auto_207755 ?auto_207756 ?auto_207757 )
      ( MAKE-12PILE ?auto_207748 ?auto_207749 ?auto_207750 ?auto_207751 ?auto_207752 ?auto_207753 ?auto_207754 ?auto_207755 ?auto_207756 ?auto_207757 ?auto_207758 ?auto_207759 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_207798 - BLOCK
      ?auto_207799 - BLOCK
      ?auto_207800 - BLOCK
      ?auto_207801 - BLOCK
      ?auto_207802 - BLOCK
      ?auto_207803 - BLOCK
      ?auto_207804 - BLOCK
      ?auto_207805 - BLOCK
      ?auto_207806 - BLOCK
      ?auto_207807 - BLOCK
      ?auto_207808 - BLOCK
      ?auto_207809 - BLOCK
    )
    :vars
    (
      ?auto_207810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207809 ?auto_207810 ) ( ON-TABLE ?auto_207798 ) ( ON ?auto_207799 ?auto_207798 ) ( ON ?auto_207800 ?auto_207799 ) ( ON ?auto_207801 ?auto_207800 ) ( ON ?auto_207802 ?auto_207801 ) ( ON ?auto_207803 ?auto_207802 ) ( ON ?auto_207804 ?auto_207803 ) ( ON ?auto_207805 ?auto_207804 ) ( not ( = ?auto_207798 ?auto_207799 ) ) ( not ( = ?auto_207798 ?auto_207800 ) ) ( not ( = ?auto_207798 ?auto_207801 ) ) ( not ( = ?auto_207798 ?auto_207802 ) ) ( not ( = ?auto_207798 ?auto_207803 ) ) ( not ( = ?auto_207798 ?auto_207804 ) ) ( not ( = ?auto_207798 ?auto_207805 ) ) ( not ( = ?auto_207798 ?auto_207806 ) ) ( not ( = ?auto_207798 ?auto_207807 ) ) ( not ( = ?auto_207798 ?auto_207808 ) ) ( not ( = ?auto_207798 ?auto_207809 ) ) ( not ( = ?auto_207798 ?auto_207810 ) ) ( not ( = ?auto_207799 ?auto_207800 ) ) ( not ( = ?auto_207799 ?auto_207801 ) ) ( not ( = ?auto_207799 ?auto_207802 ) ) ( not ( = ?auto_207799 ?auto_207803 ) ) ( not ( = ?auto_207799 ?auto_207804 ) ) ( not ( = ?auto_207799 ?auto_207805 ) ) ( not ( = ?auto_207799 ?auto_207806 ) ) ( not ( = ?auto_207799 ?auto_207807 ) ) ( not ( = ?auto_207799 ?auto_207808 ) ) ( not ( = ?auto_207799 ?auto_207809 ) ) ( not ( = ?auto_207799 ?auto_207810 ) ) ( not ( = ?auto_207800 ?auto_207801 ) ) ( not ( = ?auto_207800 ?auto_207802 ) ) ( not ( = ?auto_207800 ?auto_207803 ) ) ( not ( = ?auto_207800 ?auto_207804 ) ) ( not ( = ?auto_207800 ?auto_207805 ) ) ( not ( = ?auto_207800 ?auto_207806 ) ) ( not ( = ?auto_207800 ?auto_207807 ) ) ( not ( = ?auto_207800 ?auto_207808 ) ) ( not ( = ?auto_207800 ?auto_207809 ) ) ( not ( = ?auto_207800 ?auto_207810 ) ) ( not ( = ?auto_207801 ?auto_207802 ) ) ( not ( = ?auto_207801 ?auto_207803 ) ) ( not ( = ?auto_207801 ?auto_207804 ) ) ( not ( = ?auto_207801 ?auto_207805 ) ) ( not ( = ?auto_207801 ?auto_207806 ) ) ( not ( = ?auto_207801 ?auto_207807 ) ) ( not ( = ?auto_207801 ?auto_207808 ) ) ( not ( = ?auto_207801 ?auto_207809 ) ) ( not ( = ?auto_207801 ?auto_207810 ) ) ( not ( = ?auto_207802 ?auto_207803 ) ) ( not ( = ?auto_207802 ?auto_207804 ) ) ( not ( = ?auto_207802 ?auto_207805 ) ) ( not ( = ?auto_207802 ?auto_207806 ) ) ( not ( = ?auto_207802 ?auto_207807 ) ) ( not ( = ?auto_207802 ?auto_207808 ) ) ( not ( = ?auto_207802 ?auto_207809 ) ) ( not ( = ?auto_207802 ?auto_207810 ) ) ( not ( = ?auto_207803 ?auto_207804 ) ) ( not ( = ?auto_207803 ?auto_207805 ) ) ( not ( = ?auto_207803 ?auto_207806 ) ) ( not ( = ?auto_207803 ?auto_207807 ) ) ( not ( = ?auto_207803 ?auto_207808 ) ) ( not ( = ?auto_207803 ?auto_207809 ) ) ( not ( = ?auto_207803 ?auto_207810 ) ) ( not ( = ?auto_207804 ?auto_207805 ) ) ( not ( = ?auto_207804 ?auto_207806 ) ) ( not ( = ?auto_207804 ?auto_207807 ) ) ( not ( = ?auto_207804 ?auto_207808 ) ) ( not ( = ?auto_207804 ?auto_207809 ) ) ( not ( = ?auto_207804 ?auto_207810 ) ) ( not ( = ?auto_207805 ?auto_207806 ) ) ( not ( = ?auto_207805 ?auto_207807 ) ) ( not ( = ?auto_207805 ?auto_207808 ) ) ( not ( = ?auto_207805 ?auto_207809 ) ) ( not ( = ?auto_207805 ?auto_207810 ) ) ( not ( = ?auto_207806 ?auto_207807 ) ) ( not ( = ?auto_207806 ?auto_207808 ) ) ( not ( = ?auto_207806 ?auto_207809 ) ) ( not ( = ?auto_207806 ?auto_207810 ) ) ( not ( = ?auto_207807 ?auto_207808 ) ) ( not ( = ?auto_207807 ?auto_207809 ) ) ( not ( = ?auto_207807 ?auto_207810 ) ) ( not ( = ?auto_207808 ?auto_207809 ) ) ( not ( = ?auto_207808 ?auto_207810 ) ) ( not ( = ?auto_207809 ?auto_207810 ) ) ( ON ?auto_207808 ?auto_207809 ) ( ON ?auto_207807 ?auto_207808 ) ( CLEAR ?auto_207805 ) ( ON ?auto_207806 ?auto_207807 ) ( CLEAR ?auto_207806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_207798 ?auto_207799 ?auto_207800 ?auto_207801 ?auto_207802 ?auto_207803 ?auto_207804 ?auto_207805 ?auto_207806 )
      ( MAKE-12PILE ?auto_207798 ?auto_207799 ?auto_207800 ?auto_207801 ?auto_207802 ?auto_207803 ?auto_207804 ?auto_207805 ?auto_207806 ?auto_207807 ?auto_207808 ?auto_207809 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_207848 - BLOCK
      ?auto_207849 - BLOCK
      ?auto_207850 - BLOCK
      ?auto_207851 - BLOCK
      ?auto_207852 - BLOCK
      ?auto_207853 - BLOCK
      ?auto_207854 - BLOCK
      ?auto_207855 - BLOCK
      ?auto_207856 - BLOCK
      ?auto_207857 - BLOCK
      ?auto_207858 - BLOCK
      ?auto_207859 - BLOCK
    )
    :vars
    (
      ?auto_207860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207859 ?auto_207860 ) ( ON-TABLE ?auto_207848 ) ( ON ?auto_207849 ?auto_207848 ) ( ON ?auto_207850 ?auto_207849 ) ( ON ?auto_207851 ?auto_207850 ) ( ON ?auto_207852 ?auto_207851 ) ( ON ?auto_207853 ?auto_207852 ) ( ON ?auto_207854 ?auto_207853 ) ( not ( = ?auto_207848 ?auto_207849 ) ) ( not ( = ?auto_207848 ?auto_207850 ) ) ( not ( = ?auto_207848 ?auto_207851 ) ) ( not ( = ?auto_207848 ?auto_207852 ) ) ( not ( = ?auto_207848 ?auto_207853 ) ) ( not ( = ?auto_207848 ?auto_207854 ) ) ( not ( = ?auto_207848 ?auto_207855 ) ) ( not ( = ?auto_207848 ?auto_207856 ) ) ( not ( = ?auto_207848 ?auto_207857 ) ) ( not ( = ?auto_207848 ?auto_207858 ) ) ( not ( = ?auto_207848 ?auto_207859 ) ) ( not ( = ?auto_207848 ?auto_207860 ) ) ( not ( = ?auto_207849 ?auto_207850 ) ) ( not ( = ?auto_207849 ?auto_207851 ) ) ( not ( = ?auto_207849 ?auto_207852 ) ) ( not ( = ?auto_207849 ?auto_207853 ) ) ( not ( = ?auto_207849 ?auto_207854 ) ) ( not ( = ?auto_207849 ?auto_207855 ) ) ( not ( = ?auto_207849 ?auto_207856 ) ) ( not ( = ?auto_207849 ?auto_207857 ) ) ( not ( = ?auto_207849 ?auto_207858 ) ) ( not ( = ?auto_207849 ?auto_207859 ) ) ( not ( = ?auto_207849 ?auto_207860 ) ) ( not ( = ?auto_207850 ?auto_207851 ) ) ( not ( = ?auto_207850 ?auto_207852 ) ) ( not ( = ?auto_207850 ?auto_207853 ) ) ( not ( = ?auto_207850 ?auto_207854 ) ) ( not ( = ?auto_207850 ?auto_207855 ) ) ( not ( = ?auto_207850 ?auto_207856 ) ) ( not ( = ?auto_207850 ?auto_207857 ) ) ( not ( = ?auto_207850 ?auto_207858 ) ) ( not ( = ?auto_207850 ?auto_207859 ) ) ( not ( = ?auto_207850 ?auto_207860 ) ) ( not ( = ?auto_207851 ?auto_207852 ) ) ( not ( = ?auto_207851 ?auto_207853 ) ) ( not ( = ?auto_207851 ?auto_207854 ) ) ( not ( = ?auto_207851 ?auto_207855 ) ) ( not ( = ?auto_207851 ?auto_207856 ) ) ( not ( = ?auto_207851 ?auto_207857 ) ) ( not ( = ?auto_207851 ?auto_207858 ) ) ( not ( = ?auto_207851 ?auto_207859 ) ) ( not ( = ?auto_207851 ?auto_207860 ) ) ( not ( = ?auto_207852 ?auto_207853 ) ) ( not ( = ?auto_207852 ?auto_207854 ) ) ( not ( = ?auto_207852 ?auto_207855 ) ) ( not ( = ?auto_207852 ?auto_207856 ) ) ( not ( = ?auto_207852 ?auto_207857 ) ) ( not ( = ?auto_207852 ?auto_207858 ) ) ( not ( = ?auto_207852 ?auto_207859 ) ) ( not ( = ?auto_207852 ?auto_207860 ) ) ( not ( = ?auto_207853 ?auto_207854 ) ) ( not ( = ?auto_207853 ?auto_207855 ) ) ( not ( = ?auto_207853 ?auto_207856 ) ) ( not ( = ?auto_207853 ?auto_207857 ) ) ( not ( = ?auto_207853 ?auto_207858 ) ) ( not ( = ?auto_207853 ?auto_207859 ) ) ( not ( = ?auto_207853 ?auto_207860 ) ) ( not ( = ?auto_207854 ?auto_207855 ) ) ( not ( = ?auto_207854 ?auto_207856 ) ) ( not ( = ?auto_207854 ?auto_207857 ) ) ( not ( = ?auto_207854 ?auto_207858 ) ) ( not ( = ?auto_207854 ?auto_207859 ) ) ( not ( = ?auto_207854 ?auto_207860 ) ) ( not ( = ?auto_207855 ?auto_207856 ) ) ( not ( = ?auto_207855 ?auto_207857 ) ) ( not ( = ?auto_207855 ?auto_207858 ) ) ( not ( = ?auto_207855 ?auto_207859 ) ) ( not ( = ?auto_207855 ?auto_207860 ) ) ( not ( = ?auto_207856 ?auto_207857 ) ) ( not ( = ?auto_207856 ?auto_207858 ) ) ( not ( = ?auto_207856 ?auto_207859 ) ) ( not ( = ?auto_207856 ?auto_207860 ) ) ( not ( = ?auto_207857 ?auto_207858 ) ) ( not ( = ?auto_207857 ?auto_207859 ) ) ( not ( = ?auto_207857 ?auto_207860 ) ) ( not ( = ?auto_207858 ?auto_207859 ) ) ( not ( = ?auto_207858 ?auto_207860 ) ) ( not ( = ?auto_207859 ?auto_207860 ) ) ( ON ?auto_207858 ?auto_207859 ) ( ON ?auto_207857 ?auto_207858 ) ( ON ?auto_207856 ?auto_207857 ) ( CLEAR ?auto_207854 ) ( ON ?auto_207855 ?auto_207856 ) ( CLEAR ?auto_207855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_207848 ?auto_207849 ?auto_207850 ?auto_207851 ?auto_207852 ?auto_207853 ?auto_207854 ?auto_207855 )
      ( MAKE-12PILE ?auto_207848 ?auto_207849 ?auto_207850 ?auto_207851 ?auto_207852 ?auto_207853 ?auto_207854 ?auto_207855 ?auto_207856 ?auto_207857 ?auto_207858 ?auto_207859 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_207898 - BLOCK
      ?auto_207899 - BLOCK
      ?auto_207900 - BLOCK
      ?auto_207901 - BLOCK
      ?auto_207902 - BLOCK
      ?auto_207903 - BLOCK
      ?auto_207904 - BLOCK
      ?auto_207905 - BLOCK
      ?auto_207906 - BLOCK
      ?auto_207907 - BLOCK
      ?auto_207908 - BLOCK
      ?auto_207909 - BLOCK
    )
    :vars
    (
      ?auto_207910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207909 ?auto_207910 ) ( ON-TABLE ?auto_207898 ) ( ON ?auto_207899 ?auto_207898 ) ( ON ?auto_207900 ?auto_207899 ) ( ON ?auto_207901 ?auto_207900 ) ( ON ?auto_207902 ?auto_207901 ) ( ON ?auto_207903 ?auto_207902 ) ( not ( = ?auto_207898 ?auto_207899 ) ) ( not ( = ?auto_207898 ?auto_207900 ) ) ( not ( = ?auto_207898 ?auto_207901 ) ) ( not ( = ?auto_207898 ?auto_207902 ) ) ( not ( = ?auto_207898 ?auto_207903 ) ) ( not ( = ?auto_207898 ?auto_207904 ) ) ( not ( = ?auto_207898 ?auto_207905 ) ) ( not ( = ?auto_207898 ?auto_207906 ) ) ( not ( = ?auto_207898 ?auto_207907 ) ) ( not ( = ?auto_207898 ?auto_207908 ) ) ( not ( = ?auto_207898 ?auto_207909 ) ) ( not ( = ?auto_207898 ?auto_207910 ) ) ( not ( = ?auto_207899 ?auto_207900 ) ) ( not ( = ?auto_207899 ?auto_207901 ) ) ( not ( = ?auto_207899 ?auto_207902 ) ) ( not ( = ?auto_207899 ?auto_207903 ) ) ( not ( = ?auto_207899 ?auto_207904 ) ) ( not ( = ?auto_207899 ?auto_207905 ) ) ( not ( = ?auto_207899 ?auto_207906 ) ) ( not ( = ?auto_207899 ?auto_207907 ) ) ( not ( = ?auto_207899 ?auto_207908 ) ) ( not ( = ?auto_207899 ?auto_207909 ) ) ( not ( = ?auto_207899 ?auto_207910 ) ) ( not ( = ?auto_207900 ?auto_207901 ) ) ( not ( = ?auto_207900 ?auto_207902 ) ) ( not ( = ?auto_207900 ?auto_207903 ) ) ( not ( = ?auto_207900 ?auto_207904 ) ) ( not ( = ?auto_207900 ?auto_207905 ) ) ( not ( = ?auto_207900 ?auto_207906 ) ) ( not ( = ?auto_207900 ?auto_207907 ) ) ( not ( = ?auto_207900 ?auto_207908 ) ) ( not ( = ?auto_207900 ?auto_207909 ) ) ( not ( = ?auto_207900 ?auto_207910 ) ) ( not ( = ?auto_207901 ?auto_207902 ) ) ( not ( = ?auto_207901 ?auto_207903 ) ) ( not ( = ?auto_207901 ?auto_207904 ) ) ( not ( = ?auto_207901 ?auto_207905 ) ) ( not ( = ?auto_207901 ?auto_207906 ) ) ( not ( = ?auto_207901 ?auto_207907 ) ) ( not ( = ?auto_207901 ?auto_207908 ) ) ( not ( = ?auto_207901 ?auto_207909 ) ) ( not ( = ?auto_207901 ?auto_207910 ) ) ( not ( = ?auto_207902 ?auto_207903 ) ) ( not ( = ?auto_207902 ?auto_207904 ) ) ( not ( = ?auto_207902 ?auto_207905 ) ) ( not ( = ?auto_207902 ?auto_207906 ) ) ( not ( = ?auto_207902 ?auto_207907 ) ) ( not ( = ?auto_207902 ?auto_207908 ) ) ( not ( = ?auto_207902 ?auto_207909 ) ) ( not ( = ?auto_207902 ?auto_207910 ) ) ( not ( = ?auto_207903 ?auto_207904 ) ) ( not ( = ?auto_207903 ?auto_207905 ) ) ( not ( = ?auto_207903 ?auto_207906 ) ) ( not ( = ?auto_207903 ?auto_207907 ) ) ( not ( = ?auto_207903 ?auto_207908 ) ) ( not ( = ?auto_207903 ?auto_207909 ) ) ( not ( = ?auto_207903 ?auto_207910 ) ) ( not ( = ?auto_207904 ?auto_207905 ) ) ( not ( = ?auto_207904 ?auto_207906 ) ) ( not ( = ?auto_207904 ?auto_207907 ) ) ( not ( = ?auto_207904 ?auto_207908 ) ) ( not ( = ?auto_207904 ?auto_207909 ) ) ( not ( = ?auto_207904 ?auto_207910 ) ) ( not ( = ?auto_207905 ?auto_207906 ) ) ( not ( = ?auto_207905 ?auto_207907 ) ) ( not ( = ?auto_207905 ?auto_207908 ) ) ( not ( = ?auto_207905 ?auto_207909 ) ) ( not ( = ?auto_207905 ?auto_207910 ) ) ( not ( = ?auto_207906 ?auto_207907 ) ) ( not ( = ?auto_207906 ?auto_207908 ) ) ( not ( = ?auto_207906 ?auto_207909 ) ) ( not ( = ?auto_207906 ?auto_207910 ) ) ( not ( = ?auto_207907 ?auto_207908 ) ) ( not ( = ?auto_207907 ?auto_207909 ) ) ( not ( = ?auto_207907 ?auto_207910 ) ) ( not ( = ?auto_207908 ?auto_207909 ) ) ( not ( = ?auto_207908 ?auto_207910 ) ) ( not ( = ?auto_207909 ?auto_207910 ) ) ( ON ?auto_207908 ?auto_207909 ) ( ON ?auto_207907 ?auto_207908 ) ( ON ?auto_207906 ?auto_207907 ) ( ON ?auto_207905 ?auto_207906 ) ( CLEAR ?auto_207903 ) ( ON ?auto_207904 ?auto_207905 ) ( CLEAR ?auto_207904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_207898 ?auto_207899 ?auto_207900 ?auto_207901 ?auto_207902 ?auto_207903 ?auto_207904 )
      ( MAKE-12PILE ?auto_207898 ?auto_207899 ?auto_207900 ?auto_207901 ?auto_207902 ?auto_207903 ?auto_207904 ?auto_207905 ?auto_207906 ?auto_207907 ?auto_207908 ?auto_207909 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_207948 - BLOCK
      ?auto_207949 - BLOCK
      ?auto_207950 - BLOCK
      ?auto_207951 - BLOCK
      ?auto_207952 - BLOCK
      ?auto_207953 - BLOCK
      ?auto_207954 - BLOCK
      ?auto_207955 - BLOCK
      ?auto_207956 - BLOCK
      ?auto_207957 - BLOCK
      ?auto_207958 - BLOCK
      ?auto_207959 - BLOCK
    )
    :vars
    (
      ?auto_207960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207959 ?auto_207960 ) ( ON-TABLE ?auto_207948 ) ( ON ?auto_207949 ?auto_207948 ) ( ON ?auto_207950 ?auto_207949 ) ( ON ?auto_207951 ?auto_207950 ) ( ON ?auto_207952 ?auto_207951 ) ( not ( = ?auto_207948 ?auto_207949 ) ) ( not ( = ?auto_207948 ?auto_207950 ) ) ( not ( = ?auto_207948 ?auto_207951 ) ) ( not ( = ?auto_207948 ?auto_207952 ) ) ( not ( = ?auto_207948 ?auto_207953 ) ) ( not ( = ?auto_207948 ?auto_207954 ) ) ( not ( = ?auto_207948 ?auto_207955 ) ) ( not ( = ?auto_207948 ?auto_207956 ) ) ( not ( = ?auto_207948 ?auto_207957 ) ) ( not ( = ?auto_207948 ?auto_207958 ) ) ( not ( = ?auto_207948 ?auto_207959 ) ) ( not ( = ?auto_207948 ?auto_207960 ) ) ( not ( = ?auto_207949 ?auto_207950 ) ) ( not ( = ?auto_207949 ?auto_207951 ) ) ( not ( = ?auto_207949 ?auto_207952 ) ) ( not ( = ?auto_207949 ?auto_207953 ) ) ( not ( = ?auto_207949 ?auto_207954 ) ) ( not ( = ?auto_207949 ?auto_207955 ) ) ( not ( = ?auto_207949 ?auto_207956 ) ) ( not ( = ?auto_207949 ?auto_207957 ) ) ( not ( = ?auto_207949 ?auto_207958 ) ) ( not ( = ?auto_207949 ?auto_207959 ) ) ( not ( = ?auto_207949 ?auto_207960 ) ) ( not ( = ?auto_207950 ?auto_207951 ) ) ( not ( = ?auto_207950 ?auto_207952 ) ) ( not ( = ?auto_207950 ?auto_207953 ) ) ( not ( = ?auto_207950 ?auto_207954 ) ) ( not ( = ?auto_207950 ?auto_207955 ) ) ( not ( = ?auto_207950 ?auto_207956 ) ) ( not ( = ?auto_207950 ?auto_207957 ) ) ( not ( = ?auto_207950 ?auto_207958 ) ) ( not ( = ?auto_207950 ?auto_207959 ) ) ( not ( = ?auto_207950 ?auto_207960 ) ) ( not ( = ?auto_207951 ?auto_207952 ) ) ( not ( = ?auto_207951 ?auto_207953 ) ) ( not ( = ?auto_207951 ?auto_207954 ) ) ( not ( = ?auto_207951 ?auto_207955 ) ) ( not ( = ?auto_207951 ?auto_207956 ) ) ( not ( = ?auto_207951 ?auto_207957 ) ) ( not ( = ?auto_207951 ?auto_207958 ) ) ( not ( = ?auto_207951 ?auto_207959 ) ) ( not ( = ?auto_207951 ?auto_207960 ) ) ( not ( = ?auto_207952 ?auto_207953 ) ) ( not ( = ?auto_207952 ?auto_207954 ) ) ( not ( = ?auto_207952 ?auto_207955 ) ) ( not ( = ?auto_207952 ?auto_207956 ) ) ( not ( = ?auto_207952 ?auto_207957 ) ) ( not ( = ?auto_207952 ?auto_207958 ) ) ( not ( = ?auto_207952 ?auto_207959 ) ) ( not ( = ?auto_207952 ?auto_207960 ) ) ( not ( = ?auto_207953 ?auto_207954 ) ) ( not ( = ?auto_207953 ?auto_207955 ) ) ( not ( = ?auto_207953 ?auto_207956 ) ) ( not ( = ?auto_207953 ?auto_207957 ) ) ( not ( = ?auto_207953 ?auto_207958 ) ) ( not ( = ?auto_207953 ?auto_207959 ) ) ( not ( = ?auto_207953 ?auto_207960 ) ) ( not ( = ?auto_207954 ?auto_207955 ) ) ( not ( = ?auto_207954 ?auto_207956 ) ) ( not ( = ?auto_207954 ?auto_207957 ) ) ( not ( = ?auto_207954 ?auto_207958 ) ) ( not ( = ?auto_207954 ?auto_207959 ) ) ( not ( = ?auto_207954 ?auto_207960 ) ) ( not ( = ?auto_207955 ?auto_207956 ) ) ( not ( = ?auto_207955 ?auto_207957 ) ) ( not ( = ?auto_207955 ?auto_207958 ) ) ( not ( = ?auto_207955 ?auto_207959 ) ) ( not ( = ?auto_207955 ?auto_207960 ) ) ( not ( = ?auto_207956 ?auto_207957 ) ) ( not ( = ?auto_207956 ?auto_207958 ) ) ( not ( = ?auto_207956 ?auto_207959 ) ) ( not ( = ?auto_207956 ?auto_207960 ) ) ( not ( = ?auto_207957 ?auto_207958 ) ) ( not ( = ?auto_207957 ?auto_207959 ) ) ( not ( = ?auto_207957 ?auto_207960 ) ) ( not ( = ?auto_207958 ?auto_207959 ) ) ( not ( = ?auto_207958 ?auto_207960 ) ) ( not ( = ?auto_207959 ?auto_207960 ) ) ( ON ?auto_207958 ?auto_207959 ) ( ON ?auto_207957 ?auto_207958 ) ( ON ?auto_207956 ?auto_207957 ) ( ON ?auto_207955 ?auto_207956 ) ( ON ?auto_207954 ?auto_207955 ) ( CLEAR ?auto_207952 ) ( ON ?auto_207953 ?auto_207954 ) ( CLEAR ?auto_207953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_207948 ?auto_207949 ?auto_207950 ?auto_207951 ?auto_207952 ?auto_207953 )
      ( MAKE-12PILE ?auto_207948 ?auto_207949 ?auto_207950 ?auto_207951 ?auto_207952 ?auto_207953 ?auto_207954 ?auto_207955 ?auto_207956 ?auto_207957 ?auto_207958 ?auto_207959 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_207998 - BLOCK
      ?auto_207999 - BLOCK
      ?auto_208000 - BLOCK
      ?auto_208001 - BLOCK
      ?auto_208002 - BLOCK
      ?auto_208003 - BLOCK
      ?auto_208004 - BLOCK
      ?auto_208005 - BLOCK
      ?auto_208006 - BLOCK
      ?auto_208007 - BLOCK
      ?auto_208008 - BLOCK
      ?auto_208009 - BLOCK
    )
    :vars
    (
      ?auto_208010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208009 ?auto_208010 ) ( ON-TABLE ?auto_207998 ) ( ON ?auto_207999 ?auto_207998 ) ( ON ?auto_208000 ?auto_207999 ) ( ON ?auto_208001 ?auto_208000 ) ( not ( = ?auto_207998 ?auto_207999 ) ) ( not ( = ?auto_207998 ?auto_208000 ) ) ( not ( = ?auto_207998 ?auto_208001 ) ) ( not ( = ?auto_207998 ?auto_208002 ) ) ( not ( = ?auto_207998 ?auto_208003 ) ) ( not ( = ?auto_207998 ?auto_208004 ) ) ( not ( = ?auto_207998 ?auto_208005 ) ) ( not ( = ?auto_207998 ?auto_208006 ) ) ( not ( = ?auto_207998 ?auto_208007 ) ) ( not ( = ?auto_207998 ?auto_208008 ) ) ( not ( = ?auto_207998 ?auto_208009 ) ) ( not ( = ?auto_207998 ?auto_208010 ) ) ( not ( = ?auto_207999 ?auto_208000 ) ) ( not ( = ?auto_207999 ?auto_208001 ) ) ( not ( = ?auto_207999 ?auto_208002 ) ) ( not ( = ?auto_207999 ?auto_208003 ) ) ( not ( = ?auto_207999 ?auto_208004 ) ) ( not ( = ?auto_207999 ?auto_208005 ) ) ( not ( = ?auto_207999 ?auto_208006 ) ) ( not ( = ?auto_207999 ?auto_208007 ) ) ( not ( = ?auto_207999 ?auto_208008 ) ) ( not ( = ?auto_207999 ?auto_208009 ) ) ( not ( = ?auto_207999 ?auto_208010 ) ) ( not ( = ?auto_208000 ?auto_208001 ) ) ( not ( = ?auto_208000 ?auto_208002 ) ) ( not ( = ?auto_208000 ?auto_208003 ) ) ( not ( = ?auto_208000 ?auto_208004 ) ) ( not ( = ?auto_208000 ?auto_208005 ) ) ( not ( = ?auto_208000 ?auto_208006 ) ) ( not ( = ?auto_208000 ?auto_208007 ) ) ( not ( = ?auto_208000 ?auto_208008 ) ) ( not ( = ?auto_208000 ?auto_208009 ) ) ( not ( = ?auto_208000 ?auto_208010 ) ) ( not ( = ?auto_208001 ?auto_208002 ) ) ( not ( = ?auto_208001 ?auto_208003 ) ) ( not ( = ?auto_208001 ?auto_208004 ) ) ( not ( = ?auto_208001 ?auto_208005 ) ) ( not ( = ?auto_208001 ?auto_208006 ) ) ( not ( = ?auto_208001 ?auto_208007 ) ) ( not ( = ?auto_208001 ?auto_208008 ) ) ( not ( = ?auto_208001 ?auto_208009 ) ) ( not ( = ?auto_208001 ?auto_208010 ) ) ( not ( = ?auto_208002 ?auto_208003 ) ) ( not ( = ?auto_208002 ?auto_208004 ) ) ( not ( = ?auto_208002 ?auto_208005 ) ) ( not ( = ?auto_208002 ?auto_208006 ) ) ( not ( = ?auto_208002 ?auto_208007 ) ) ( not ( = ?auto_208002 ?auto_208008 ) ) ( not ( = ?auto_208002 ?auto_208009 ) ) ( not ( = ?auto_208002 ?auto_208010 ) ) ( not ( = ?auto_208003 ?auto_208004 ) ) ( not ( = ?auto_208003 ?auto_208005 ) ) ( not ( = ?auto_208003 ?auto_208006 ) ) ( not ( = ?auto_208003 ?auto_208007 ) ) ( not ( = ?auto_208003 ?auto_208008 ) ) ( not ( = ?auto_208003 ?auto_208009 ) ) ( not ( = ?auto_208003 ?auto_208010 ) ) ( not ( = ?auto_208004 ?auto_208005 ) ) ( not ( = ?auto_208004 ?auto_208006 ) ) ( not ( = ?auto_208004 ?auto_208007 ) ) ( not ( = ?auto_208004 ?auto_208008 ) ) ( not ( = ?auto_208004 ?auto_208009 ) ) ( not ( = ?auto_208004 ?auto_208010 ) ) ( not ( = ?auto_208005 ?auto_208006 ) ) ( not ( = ?auto_208005 ?auto_208007 ) ) ( not ( = ?auto_208005 ?auto_208008 ) ) ( not ( = ?auto_208005 ?auto_208009 ) ) ( not ( = ?auto_208005 ?auto_208010 ) ) ( not ( = ?auto_208006 ?auto_208007 ) ) ( not ( = ?auto_208006 ?auto_208008 ) ) ( not ( = ?auto_208006 ?auto_208009 ) ) ( not ( = ?auto_208006 ?auto_208010 ) ) ( not ( = ?auto_208007 ?auto_208008 ) ) ( not ( = ?auto_208007 ?auto_208009 ) ) ( not ( = ?auto_208007 ?auto_208010 ) ) ( not ( = ?auto_208008 ?auto_208009 ) ) ( not ( = ?auto_208008 ?auto_208010 ) ) ( not ( = ?auto_208009 ?auto_208010 ) ) ( ON ?auto_208008 ?auto_208009 ) ( ON ?auto_208007 ?auto_208008 ) ( ON ?auto_208006 ?auto_208007 ) ( ON ?auto_208005 ?auto_208006 ) ( ON ?auto_208004 ?auto_208005 ) ( ON ?auto_208003 ?auto_208004 ) ( CLEAR ?auto_208001 ) ( ON ?auto_208002 ?auto_208003 ) ( CLEAR ?auto_208002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_207998 ?auto_207999 ?auto_208000 ?auto_208001 ?auto_208002 )
      ( MAKE-12PILE ?auto_207998 ?auto_207999 ?auto_208000 ?auto_208001 ?auto_208002 ?auto_208003 ?auto_208004 ?auto_208005 ?auto_208006 ?auto_208007 ?auto_208008 ?auto_208009 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_208048 - BLOCK
      ?auto_208049 - BLOCK
      ?auto_208050 - BLOCK
      ?auto_208051 - BLOCK
      ?auto_208052 - BLOCK
      ?auto_208053 - BLOCK
      ?auto_208054 - BLOCK
      ?auto_208055 - BLOCK
      ?auto_208056 - BLOCK
      ?auto_208057 - BLOCK
      ?auto_208058 - BLOCK
      ?auto_208059 - BLOCK
    )
    :vars
    (
      ?auto_208060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208059 ?auto_208060 ) ( ON-TABLE ?auto_208048 ) ( ON ?auto_208049 ?auto_208048 ) ( ON ?auto_208050 ?auto_208049 ) ( not ( = ?auto_208048 ?auto_208049 ) ) ( not ( = ?auto_208048 ?auto_208050 ) ) ( not ( = ?auto_208048 ?auto_208051 ) ) ( not ( = ?auto_208048 ?auto_208052 ) ) ( not ( = ?auto_208048 ?auto_208053 ) ) ( not ( = ?auto_208048 ?auto_208054 ) ) ( not ( = ?auto_208048 ?auto_208055 ) ) ( not ( = ?auto_208048 ?auto_208056 ) ) ( not ( = ?auto_208048 ?auto_208057 ) ) ( not ( = ?auto_208048 ?auto_208058 ) ) ( not ( = ?auto_208048 ?auto_208059 ) ) ( not ( = ?auto_208048 ?auto_208060 ) ) ( not ( = ?auto_208049 ?auto_208050 ) ) ( not ( = ?auto_208049 ?auto_208051 ) ) ( not ( = ?auto_208049 ?auto_208052 ) ) ( not ( = ?auto_208049 ?auto_208053 ) ) ( not ( = ?auto_208049 ?auto_208054 ) ) ( not ( = ?auto_208049 ?auto_208055 ) ) ( not ( = ?auto_208049 ?auto_208056 ) ) ( not ( = ?auto_208049 ?auto_208057 ) ) ( not ( = ?auto_208049 ?auto_208058 ) ) ( not ( = ?auto_208049 ?auto_208059 ) ) ( not ( = ?auto_208049 ?auto_208060 ) ) ( not ( = ?auto_208050 ?auto_208051 ) ) ( not ( = ?auto_208050 ?auto_208052 ) ) ( not ( = ?auto_208050 ?auto_208053 ) ) ( not ( = ?auto_208050 ?auto_208054 ) ) ( not ( = ?auto_208050 ?auto_208055 ) ) ( not ( = ?auto_208050 ?auto_208056 ) ) ( not ( = ?auto_208050 ?auto_208057 ) ) ( not ( = ?auto_208050 ?auto_208058 ) ) ( not ( = ?auto_208050 ?auto_208059 ) ) ( not ( = ?auto_208050 ?auto_208060 ) ) ( not ( = ?auto_208051 ?auto_208052 ) ) ( not ( = ?auto_208051 ?auto_208053 ) ) ( not ( = ?auto_208051 ?auto_208054 ) ) ( not ( = ?auto_208051 ?auto_208055 ) ) ( not ( = ?auto_208051 ?auto_208056 ) ) ( not ( = ?auto_208051 ?auto_208057 ) ) ( not ( = ?auto_208051 ?auto_208058 ) ) ( not ( = ?auto_208051 ?auto_208059 ) ) ( not ( = ?auto_208051 ?auto_208060 ) ) ( not ( = ?auto_208052 ?auto_208053 ) ) ( not ( = ?auto_208052 ?auto_208054 ) ) ( not ( = ?auto_208052 ?auto_208055 ) ) ( not ( = ?auto_208052 ?auto_208056 ) ) ( not ( = ?auto_208052 ?auto_208057 ) ) ( not ( = ?auto_208052 ?auto_208058 ) ) ( not ( = ?auto_208052 ?auto_208059 ) ) ( not ( = ?auto_208052 ?auto_208060 ) ) ( not ( = ?auto_208053 ?auto_208054 ) ) ( not ( = ?auto_208053 ?auto_208055 ) ) ( not ( = ?auto_208053 ?auto_208056 ) ) ( not ( = ?auto_208053 ?auto_208057 ) ) ( not ( = ?auto_208053 ?auto_208058 ) ) ( not ( = ?auto_208053 ?auto_208059 ) ) ( not ( = ?auto_208053 ?auto_208060 ) ) ( not ( = ?auto_208054 ?auto_208055 ) ) ( not ( = ?auto_208054 ?auto_208056 ) ) ( not ( = ?auto_208054 ?auto_208057 ) ) ( not ( = ?auto_208054 ?auto_208058 ) ) ( not ( = ?auto_208054 ?auto_208059 ) ) ( not ( = ?auto_208054 ?auto_208060 ) ) ( not ( = ?auto_208055 ?auto_208056 ) ) ( not ( = ?auto_208055 ?auto_208057 ) ) ( not ( = ?auto_208055 ?auto_208058 ) ) ( not ( = ?auto_208055 ?auto_208059 ) ) ( not ( = ?auto_208055 ?auto_208060 ) ) ( not ( = ?auto_208056 ?auto_208057 ) ) ( not ( = ?auto_208056 ?auto_208058 ) ) ( not ( = ?auto_208056 ?auto_208059 ) ) ( not ( = ?auto_208056 ?auto_208060 ) ) ( not ( = ?auto_208057 ?auto_208058 ) ) ( not ( = ?auto_208057 ?auto_208059 ) ) ( not ( = ?auto_208057 ?auto_208060 ) ) ( not ( = ?auto_208058 ?auto_208059 ) ) ( not ( = ?auto_208058 ?auto_208060 ) ) ( not ( = ?auto_208059 ?auto_208060 ) ) ( ON ?auto_208058 ?auto_208059 ) ( ON ?auto_208057 ?auto_208058 ) ( ON ?auto_208056 ?auto_208057 ) ( ON ?auto_208055 ?auto_208056 ) ( ON ?auto_208054 ?auto_208055 ) ( ON ?auto_208053 ?auto_208054 ) ( ON ?auto_208052 ?auto_208053 ) ( CLEAR ?auto_208050 ) ( ON ?auto_208051 ?auto_208052 ) ( CLEAR ?auto_208051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_208048 ?auto_208049 ?auto_208050 ?auto_208051 )
      ( MAKE-12PILE ?auto_208048 ?auto_208049 ?auto_208050 ?auto_208051 ?auto_208052 ?auto_208053 ?auto_208054 ?auto_208055 ?auto_208056 ?auto_208057 ?auto_208058 ?auto_208059 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_208098 - BLOCK
      ?auto_208099 - BLOCK
      ?auto_208100 - BLOCK
      ?auto_208101 - BLOCK
      ?auto_208102 - BLOCK
      ?auto_208103 - BLOCK
      ?auto_208104 - BLOCK
      ?auto_208105 - BLOCK
      ?auto_208106 - BLOCK
      ?auto_208107 - BLOCK
      ?auto_208108 - BLOCK
      ?auto_208109 - BLOCK
    )
    :vars
    (
      ?auto_208110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208109 ?auto_208110 ) ( ON-TABLE ?auto_208098 ) ( ON ?auto_208099 ?auto_208098 ) ( not ( = ?auto_208098 ?auto_208099 ) ) ( not ( = ?auto_208098 ?auto_208100 ) ) ( not ( = ?auto_208098 ?auto_208101 ) ) ( not ( = ?auto_208098 ?auto_208102 ) ) ( not ( = ?auto_208098 ?auto_208103 ) ) ( not ( = ?auto_208098 ?auto_208104 ) ) ( not ( = ?auto_208098 ?auto_208105 ) ) ( not ( = ?auto_208098 ?auto_208106 ) ) ( not ( = ?auto_208098 ?auto_208107 ) ) ( not ( = ?auto_208098 ?auto_208108 ) ) ( not ( = ?auto_208098 ?auto_208109 ) ) ( not ( = ?auto_208098 ?auto_208110 ) ) ( not ( = ?auto_208099 ?auto_208100 ) ) ( not ( = ?auto_208099 ?auto_208101 ) ) ( not ( = ?auto_208099 ?auto_208102 ) ) ( not ( = ?auto_208099 ?auto_208103 ) ) ( not ( = ?auto_208099 ?auto_208104 ) ) ( not ( = ?auto_208099 ?auto_208105 ) ) ( not ( = ?auto_208099 ?auto_208106 ) ) ( not ( = ?auto_208099 ?auto_208107 ) ) ( not ( = ?auto_208099 ?auto_208108 ) ) ( not ( = ?auto_208099 ?auto_208109 ) ) ( not ( = ?auto_208099 ?auto_208110 ) ) ( not ( = ?auto_208100 ?auto_208101 ) ) ( not ( = ?auto_208100 ?auto_208102 ) ) ( not ( = ?auto_208100 ?auto_208103 ) ) ( not ( = ?auto_208100 ?auto_208104 ) ) ( not ( = ?auto_208100 ?auto_208105 ) ) ( not ( = ?auto_208100 ?auto_208106 ) ) ( not ( = ?auto_208100 ?auto_208107 ) ) ( not ( = ?auto_208100 ?auto_208108 ) ) ( not ( = ?auto_208100 ?auto_208109 ) ) ( not ( = ?auto_208100 ?auto_208110 ) ) ( not ( = ?auto_208101 ?auto_208102 ) ) ( not ( = ?auto_208101 ?auto_208103 ) ) ( not ( = ?auto_208101 ?auto_208104 ) ) ( not ( = ?auto_208101 ?auto_208105 ) ) ( not ( = ?auto_208101 ?auto_208106 ) ) ( not ( = ?auto_208101 ?auto_208107 ) ) ( not ( = ?auto_208101 ?auto_208108 ) ) ( not ( = ?auto_208101 ?auto_208109 ) ) ( not ( = ?auto_208101 ?auto_208110 ) ) ( not ( = ?auto_208102 ?auto_208103 ) ) ( not ( = ?auto_208102 ?auto_208104 ) ) ( not ( = ?auto_208102 ?auto_208105 ) ) ( not ( = ?auto_208102 ?auto_208106 ) ) ( not ( = ?auto_208102 ?auto_208107 ) ) ( not ( = ?auto_208102 ?auto_208108 ) ) ( not ( = ?auto_208102 ?auto_208109 ) ) ( not ( = ?auto_208102 ?auto_208110 ) ) ( not ( = ?auto_208103 ?auto_208104 ) ) ( not ( = ?auto_208103 ?auto_208105 ) ) ( not ( = ?auto_208103 ?auto_208106 ) ) ( not ( = ?auto_208103 ?auto_208107 ) ) ( not ( = ?auto_208103 ?auto_208108 ) ) ( not ( = ?auto_208103 ?auto_208109 ) ) ( not ( = ?auto_208103 ?auto_208110 ) ) ( not ( = ?auto_208104 ?auto_208105 ) ) ( not ( = ?auto_208104 ?auto_208106 ) ) ( not ( = ?auto_208104 ?auto_208107 ) ) ( not ( = ?auto_208104 ?auto_208108 ) ) ( not ( = ?auto_208104 ?auto_208109 ) ) ( not ( = ?auto_208104 ?auto_208110 ) ) ( not ( = ?auto_208105 ?auto_208106 ) ) ( not ( = ?auto_208105 ?auto_208107 ) ) ( not ( = ?auto_208105 ?auto_208108 ) ) ( not ( = ?auto_208105 ?auto_208109 ) ) ( not ( = ?auto_208105 ?auto_208110 ) ) ( not ( = ?auto_208106 ?auto_208107 ) ) ( not ( = ?auto_208106 ?auto_208108 ) ) ( not ( = ?auto_208106 ?auto_208109 ) ) ( not ( = ?auto_208106 ?auto_208110 ) ) ( not ( = ?auto_208107 ?auto_208108 ) ) ( not ( = ?auto_208107 ?auto_208109 ) ) ( not ( = ?auto_208107 ?auto_208110 ) ) ( not ( = ?auto_208108 ?auto_208109 ) ) ( not ( = ?auto_208108 ?auto_208110 ) ) ( not ( = ?auto_208109 ?auto_208110 ) ) ( ON ?auto_208108 ?auto_208109 ) ( ON ?auto_208107 ?auto_208108 ) ( ON ?auto_208106 ?auto_208107 ) ( ON ?auto_208105 ?auto_208106 ) ( ON ?auto_208104 ?auto_208105 ) ( ON ?auto_208103 ?auto_208104 ) ( ON ?auto_208102 ?auto_208103 ) ( ON ?auto_208101 ?auto_208102 ) ( CLEAR ?auto_208099 ) ( ON ?auto_208100 ?auto_208101 ) ( CLEAR ?auto_208100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_208098 ?auto_208099 ?auto_208100 )
      ( MAKE-12PILE ?auto_208098 ?auto_208099 ?auto_208100 ?auto_208101 ?auto_208102 ?auto_208103 ?auto_208104 ?auto_208105 ?auto_208106 ?auto_208107 ?auto_208108 ?auto_208109 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_208148 - BLOCK
      ?auto_208149 - BLOCK
      ?auto_208150 - BLOCK
      ?auto_208151 - BLOCK
      ?auto_208152 - BLOCK
      ?auto_208153 - BLOCK
      ?auto_208154 - BLOCK
      ?auto_208155 - BLOCK
      ?auto_208156 - BLOCK
      ?auto_208157 - BLOCK
      ?auto_208158 - BLOCK
      ?auto_208159 - BLOCK
    )
    :vars
    (
      ?auto_208160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208159 ?auto_208160 ) ( ON-TABLE ?auto_208148 ) ( not ( = ?auto_208148 ?auto_208149 ) ) ( not ( = ?auto_208148 ?auto_208150 ) ) ( not ( = ?auto_208148 ?auto_208151 ) ) ( not ( = ?auto_208148 ?auto_208152 ) ) ( not ( = ?auto_208148 ?auto_208153 ) ) ( not ( = ?auto_208148 ?auto_208154 ) ) ( not ( = ?auto_208148 ?auto_208155 ) ) ( not ( = ?auto_208148 ?auto_208156 ) ) ( not ( = ?auto_208148 ?auto_208157 ) ) ( not ( = ?auto_208148 ?auto_208158 ) ) ( not ( = ?auto_208148 ?auto_208159 ) ) ( not ( = ?auto_208148 ?auto_208160 ) ) ( not ( = ?auto_208149 ?auto_208150 ) ) ( not ( = ?auto_208149 ?auto_208151 ) ) ( not ( = ?auto_208149 ?auto_208152 ) ) ( not ( = ?auto_208149 ?auto_208153 ) ) ( not ( = ?auto_208149 ?auto_208154 ) ) ( not ( = ?auto_208149 ?auto_208155 ) ) ( not ( = ?auto_208149 ?auto_208156 ) ) ( not ( = ?auto_208149 ?auto_208157 ) ) ( not ( = ?auto_208149 ?auto_208158 ) ) ( not ( = ?auto_208149 ?auto_208159 ) ) ( not ( = ?auto_208149 ?auto_208160 ) ) ( not ( = ?auto_208150 ?auto_208151 ) ) ( not ( = ?auto_208150 ?auto_208152 ) ) ( not ( = ?auto_208150 ?auto_208153 ) ) ( not ( = ?auto_208150 ?auto_208154 ) ) ( not ( = ?auto_208150 ?auto_208155 ) ) ( not ( = ?auto_208150 ?auto_208156 ) ) ( not ( = ?auto_208150 ?auto_208157 ) ) ( not ( = ?auto_208150 ?auto_208158 ) ) ( not ( = ?auto_208150 ?auto_208159 ) ) ( not ( = ?auto_208150 ?auto_208160 ) ) ( not ( = ?auto_208151 ?auto_208152 ) ) ( not ( = ?auto_208151 ?auto_208153 ) ) ( not ( = ?auto_208151 ?auto_208154 ) ) ( not ( = ?auto_208151 ?auto_208155 ) ) ( not ( = ?auto_208151 ?auto_208156 ) ) ( not ( = ?auto_208151 ?auto_208157 ) ) ( not ( = ?auto_208151 ?auto_208158 ) ) ( not ( = ?auto_208151 ?auto_208159 ) ) ( not ( = ?auto_208151 ?auto_208160 ) ) ( not ( = ?auto_208152 ?auto_208153 ) ) ( not ( = ?auto_208152 ?auto_208154 ) ) ( not ( = ?auto_208152 ?auto_208155 ) ) ( not ( = ?auto_208152 ?auto_208156 ) ) ( not ( = ?auto_208152 ?auto_208157 ) ) ( not ( = ?auto_208152 ?auto_208158 ) ) ( not ( = ?auto_208152 ?auto_208159 ) ) ( not ( = ?auto_208152 ?auto_208160 ) ) ( not ( = ?auto_208153 ?auto_208154 ) ) ( not ( = ?auto_208153 ?auto_208155 ) ) ( not ( = ?auto_208153 ?auto_208156 ) ) ( not ( = ?auto_208153 ?auto_208157 ) ) ( not ( = ?auto_208153 ?auto_208158 ) ) ( not ( = ?auto_208153 ?auto_208159 ) ) ( not ( = ?auto_208153 ?auto_208160 ) ) ( not ( = ?auto_208154 ?auto_208155 ) ) ( not ( = ?auto_208154 ?auto_208156 ) ) ( not ( = ?auto_208154 ?auto_208157 ) ) ( not ( = ?auto_208154 ?auto_208158 ) ) ( not ( = ?auto_208154 ?auto_208159 ) ) ( not ( = ?auto_208154 ?auto_208160 ) ) ( not ( = ?auto_208155 ?auto_208156 ) ) ( not ( = ?auto_208155 ?auto_208157 ) ) ( not ( = ?auto_208155 ?auto_208158 ) ) ( not ( = ?auto_208155 ?auto_208159 ) ) ( not ( = ?auto_208155 ?auto_208160 ) ) ( not ( = ?auto_208156 ?auto_208157 ) ) ( not ( = ?auto_208156 ?auto_208158 ) ) ( not ( = ?auto_208156 ?auto_208159 ) ) ( not ( = ?auto_208156 ?auto_208160 ) ) ( not ( = ?auto_208157 ?auto_208158 ) ) ( not ( = ?auto_208157 ?auto_208159 ) ) ( not ( = ?auto_208157 ?auto_208160 ) ) ( not ( = ?auto_208158 ?auto_208159 ) ) ( not ( = ?auto_208158 ?auto_208160 ) ) ( not ( = ?auto_208159 ?auto_208160 ) ) ( ON ?auto_208158 ?auto_208159 ) ( ON ?auto_208157 ?auto_208158 ) ( ON ?auto_208156 ?auto_208157 ) ( ON ?auto_208155 ?auto_208156 ) ( ON ?auto_208154 ?auto_208155 ) ( ON ?auto_208153 ?auto_208154 ) ( ON ?auto_208152 ?auto_208153 ) ( ON ?auto_208151 ?auto_208152 ) ( ON ?auto_208150 ?auto_208151 ) ( CLEAR ?auto_208148 ) ( ON ?auto_208149 ?auto_208150 ) ( CLEAR ?auto_208149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_208148 ?auto_208149 )
      ( MAKE-12PILE ?auto_208148 ?auto_208149 ?auto_208150 ?auto_208151 ?auto_208152 ?auto_208153 ?auto_208154 ?auto_208155 ?auto_208156 ?auto_208157 ?auto_208158 ?auto_208159 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_208198 - BLOCK
      ?auto_208199 - BLOCK
      ?auto_208200 - BLOCK
      ?auto_208201 - BLOCK
      ?auto_208202 - BLOCK
      ?auto_208203 - BLOCK
      ?auto_208204 - BLOCK
      ?auto_208205 - BLOCK
      ?auto_208206 - BLOCK
      ?auto_208207 - BLOCK
      ?auto_208208 - BLOCK
      ?auto_208209 - BLOCK
    )
    :vars
    (
      ?auto_208210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208209 ?auto_208210 ) ( not ( = ?auto_208198 ?auto_208199 ) ) ( not ( = ?auto_208198 ?auto_208200 ) ) ( not ( = ?auto_208198 ?auto_208201 ) ) ( not ( = ?auto_208198 ?auto_208202 ) ) ( not ( = ?auto_208198 ?auto_208203 ) ) ( not ( = ?auto_208198 ?auto_208204 ) ) ( not ( = ?auto_208198 ?auto_208205 ) ) ( not ( = ?auto_208198 ?auto_208206 ) ) ( not ( = ?auto_208198 ?auto_208207 ) ) ( not ( = ?auto_208198 ?auto_208208 ) ) ( not ( = ?auto_208198 ?auto_208209 ) ) ( not ( = ?auto_208198 ?auto_208210 ) ) ( not ( = ?auto_208199 ?auto_208200 ) ) ( not ( = ?auto_208199 ?auto_208201 ) ) ( not ( = ?auto_208199 ?auto_208202 ) ) ( not ( = ?auto_208199 ?auto_208203 ) ) ( not ( = ?auto_208199 ?auto_208204 ) ) ( not ( = ?auto_208199 ?auto_208205 ) ) ( not ( = ?auto_208199 ?auto_208206 ) ) ( not ( = ?auto_208199 ?auto_208207 ) ) ( not ( = ?auto_208199 ?auto_208208 ) ) ( not ( = ?auto_208199 ?auto_208209 ) ) ( not ( = ?auto_208199 ?auto_208210 ) ) ( not ( = ?auto_208200 ?auto_208201 ) ) ( not ( = ?auto_208200 ?auto_208202 ) ) ( not ( = ?auto_208200 ?auto_208203 ) ) ( not ( = ?auto_208200 ?auto_208204 ) ) ( not ( = ?auto_208200 ?auto_208205 ) ) ( not ( = ?auto_208200 ?auto_208206 ) ) ( not ( = ?auto_208200 ?auto_208207 ) ) ( not ( = ?auto_208200 ?auto_208208 ) ) ( not ( = ?auto_208200 ?auto_208209 ) ) ( not ( = ?auto_208200 ?auto_208210 ) ) ( not ( = ?auto_208201 ?auto_208202 ) ) ( not ( = ?auto_208201 ?auto_208203 ) ) ( not ( = ?auto_208201 ?auto_208204 ) ) ( not ( = ?auto_208201 ?auto_208205 ) ) ( not ( = ?auto_208201 ?auto_208206 ) ) ( not ( = ?auto_208201 ?auto_208207 ) ) ( not ( = ?auto_208201 ?auto_208208 ) ) ( not ( = ?auto_208201 ?auto_208209 ) ) ( not ( = ?auto_208201 ?auto_208210 ) ) ( not ( = ?auto_208202 ?auto_208203 ) ) ( not ( = ?auto_208202 ?auto_208204 ) ) ( not ( = ?auto_208202 ?auto_208205 ) ) ( not ( = ?auto_208202 ?auto_208206 ) ) ( not ( = ?auto_208202 ?auto_208207 ) ) ( not ( = ?auto_208202 ?auto_208208 ) ) ( not ( = ?auto_208202 ?auto_208209 ) ) ( not ( = ?auto_208202 ?auto_208210 ) ) ( not ( = ?auto_208203 ?auto_208204 ) ) ( not ( = ?auto_208203 ?auto_208205 ) ) ( not ( = ?auto_208203 ?auto_208206 ) ) ( not ( = ?auto_208203 ?auto_208207 ) ) ( not ( = ?auto_208203 ?auto_208208 ) ) ( not ( = ?auto_208203 ?auto_208209 ) ) ( not ( = ?auto_208203 ?auto_208210 ) ) ( not ( = ?auto_208204 ?auto_208205 ) ) ( not ( = ?auto_208204 ?auto_208206 ) ) ( not ( = ?auto_208204 ?auto_208207 ) ) ( not ( = ?auto_208204 ?auto_208208 ) ) ( not ( = ?auto_208204 ?auto_208209 ) ) ( not ( = ?auto_208204 ?auto_208210 ) ) ( not ( = ?auto_208205 ?auto_208206 ) ) ( not ( = ?auto_208205 ?auto_208207 ) ) ( not ( = ?auto_208205 ?auto_208208 ) ) ( not ( = ?auto_208205 ?auto_208209 ) ) ( not ( = ?auto_208205 ?auto_208210 ) ) ( not ( = ?auto_208206 ?auto_208207 ) ) ( not ( = ?auto_208206 ?auto_208208 ) ) ( not ( = ?auto_208206 ?auto_208209 ) ) ( not ( = ?auto_208206 ?auto_208210 ) ) ( not ( = ?auto_208207 ?auto_208208 ) ) ( not ( = ?auto_208207 ?auto_208209 ) ) ( not ( = ?auto_208207 ?auto_208210 ) ) ( not ( = ?auto_208208 ?auto_208209 ) ) ( not ( = ?auto_208208 ?auto_208210 ) ) ( not ( = ?auto_208209 ?auto_208210 ) ) ( ON ?auto_208208 ?auto_208209 ) ( ON ?auto_208207 ?auto_208208 ) ( ON ?auto_208206 ?auto_208207 ) ( ON ?auto_208205 ?auto_208206 ) ( ON ?auto_208204 ?auto_208205 ) ( ON ?auto_208203 ?auto_208204 ) ( ON ?auto_208202 ?auto_208203 ) ( ON ?auto_208201 ?auto_208202 ) ( ON ?auto_208200 ?auto_208201 ) ( ON ?auto_208199 ?auto_208200 ) ( ON ?auto_208198 ?auto_208199 ) ( CLEAR ?auto_208198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_208198 )
      ( MAKE-12PILE ?auto_208198 ?auto_208199 ?auto_208200 ?auto_208201 ?auto_208202 ?auto_208203 ?auto_208204 ?auto_208205 ?auto_208206 ?auto_208207 ?auto_208208 ?auto_208209 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208249 - BLOCK
      ?auto_208250 - BLOCK
      ?auto_208251 - BLOCK
      ?auto_208252 - BLOCK
      ?auto_208253 - BLOCK
      ?auto_208254 - BLOCK
      ?auto_208255 - BLOCK
      ?auto_208256 - BLOCK
      ?auto_208257 - BLOCK
      ?auto_208258 - BLOCK
      ?auto_208259 - BLOCK
      ?auto_208260 - BLOCK
      ?auto_208261 - BLOCK
    )
    :vars
    (
      ?auto_208262 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_208260 ) ( ON ?auto_208261 ?auto_208262 ) ( CLEAR ?auto_208261 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_208249 ) ( ON ?auto_208250 ?auto_208249 ) ( ON ?auto_208251 ?auto_208250 ) ( ON ?auto_208252 ?auto_208251 ) ( ON ?auto_208253 ?auto_208252 ) ( ON ?auto_208254 ?auto_208253 ) ( ON ?auto_208255 ?auto_208254 ) ( ON ?auto_208256 ?auto_208255 ) ( ON ?auto_208257 ?auto_208256 ) ( ON ?auto_208258 ?auto_208257 ) ( ON ?auto_208259 ?auto_208258 ) ( ON ?auto_208260 ?auto_208259 ) ( not ( = ?auto_208249 ?auto_208250 ) ) ( not ( = ?auto_208249 ?auto_208251 ) ) ( not ( = ?auto_208249 ?auto_208252 ) ) ( not ( = ?auto_208249 ?auto_208253 ) ) ( not ( = ?auto_208249 ?auto_208254 ) ) ( not ( = ?auto_208249 ?auto_208255 ) ) ( not ( = ?auto_208249 ?auto_208256 ) ) ( not ( = ?auto_208249 ?auto_208257 ) ) ( not ( = ?auto_208249 ?auto_208258 ) ) ( not ( = ?auto_208249 ?auto_208259 ) ) ( not ( = ?auto_208249 ?auto_208260 ) ) ( not ( = ?auto_208249 ?auto_208261 ) ) ( not ( = ?auto_208249 ?auto_208262 ) ) ( not ( = ?auto_208250 ?auto_208251 ) ) ( not ( = ?auto_208250 ?auto_208252 ) ) ( not ( = ?auto_208250 ?auto_208253 ) ) ( not ( = ?auto_208250 ?auto_208254 ) ) ( not ( = ?auto_208250 ?auto_208255 ) ) ( not ( = ?auto_208250 ?auto_208256 ) ) ( not ( = ?auto_208250 ?auto_208257 ) ) ( not ( = ?auto_208250 ?auto_208258 ) ) ( not ( = ?auto_208250 ?auto_208259 ) ) ( not ( = ?auto_208250 ?auto_208260 ) ) ( not ( = ?auto_208250 ?auto_208261 ) ) ( not ( = ?auto_208250 ?auto_208262 ) ) ( not ( = ?auto_208251 ?auto_208252 ) ) ( not ( = ?auto_208251 ?auto_208253 ) ) ( not ( = ?auto_208251 ?auto_208254 ) ) ( not ( = ?auto_208251 ?auto_208255 ) ) ( not ( = ?auto_208251 ?auto_208256 ) ) ( not ( = ?auto_208251 ?auto_208257 ) ) ( not ( = ?auto_208251 ?auto_208258 ) ) ( not ( = ?auto_208251 ?auto_208259 ) ) ( not ( = ?auto_208251 ?auto_208260 ) ) ( not ( = ?auto_208251 ?auto_208261 ) ) ( not ( = ?auto_208251 ?auto_208262 ) ) ( not ( = ?auto_208252 ?auto_208253 ) ) ( not ( = ?auto_208252 ?auto_208254 ) ) ( not ( = ?auto_208252 ?auto_208255 ) ) ( not ( = ?auto_208252 ?auto_208256 ) ) ( not ( = ?auto_208252 ?auto_208257 ) ) ( not ( = ?auto_208252 ?auto_208258 ) ) ( not ( = ?auto_208252 ?auto_208259 ) ) ( not ( = ?auto_208252 ?auto_208260 ) ) ( not ( = ?auto_208252 ?auto_208261 ) ) ( not ( = ?auto_208252 ?auto_208262 ) ) ( not ( = ?auto_208253 ?auto_208254 ) ) ( not ( = ?auto_208253 ?auto_208255 ) ) ( not ( = ?auto_208253 ?auto_208256 ) ) ( not ( = ?auto_208253 ?auto_208257 ) ) ( not ( = ?auto_208253 ?auto_208258 ) ) ( not ( = ?auto_208253 ?auto_208259 ) ) ( not ( = ?auto_208253 ?auto_208260 ) ) ( not ( = ?auto_208253 ?auto_208261 ) ) ( not ( = ?auto_208253 ?auto_208262 ) ) ( not ( = ?auto_208254 ?auto_208255 ) ) ( not ( = ?auto_208254 ?auto_208256 ) ) ( not ( = ?auto_208254 ?auto_208257 ) ) ( not ( = ?auto_208254 ?auto_208258 ) ) ( not ( = ?auto_208254 ?auto_208259 ) ) ( not ( = ?auto_208254 ?auto_208260 ) ) ( not ( = ?auto_208254 ?auto_208261 ) ) ( not ( = ?auto_208254 ?auto_208262 ) ) ( not ( = ?auto_208255 ?auto_208256 ) ) ( not ( = ?auto_208255 ?auto_208257 ) ) ( not ( = ?auto_208255 ?auto_208258 ) ) ( not ( = ?auto_208255 ?auto_208259 ) ) ( not ( = ?auto_208255 ?auto_208260 ) ) ( not ( = ?auto_208255 ?auto_208261 ) ) ( not ( = ?auto_208255 ?auto_208262 ) ) ( not ( = ?auto_208256 ?auto_208257 ) ) ( not ( = ?auto_208256 ?auto_208258 ) ) ( not ( = ?auto_208256 ?auto_208259 ) ) ( not ( = ?auto_208256 ?auto_208260 ) ) ( not ( = ?auto_208256 ?auto_208261 ) ) ( not ( = ?auto_208256 ?auto_208262 ) ) ( not ( = ?auto_208257 ?auto_208258 ) ) ( not ( = ?auto_208257 ?auto_208259 ) ) ( not ( = ?auto_208257 ?auto_208260 ) ) ( not ( = ?auto_208257 ?auto_208261 ) ) ( not ( = ?auto_208257 ?auto_208262 ) ) ( not ( = ?auto_208258 ?auto_208259 ) ) ( not ( = ?auto_208258 ?auto_208260 ) ) ( not ( = ?auto_208258 ?auto_208261 ) ) ( not ( = ?auto_208258 ?auto_208262 ) ) ( not ( = ?auto_208259 ?auto_208260 ) ) ( not ( = ?auto_208259 ?auto_208261 ) ) ( not ( = ?auto_208259 ?auto_208262 ) ) ( not ( = ?auto_208260 ?auto_208261 ) ) ( not ( = ?auto_208260 ?auto_208262 ) ) ( not ( = ?auto_208261 ?auto_208262 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_208261 ?auto_208262 )
      ( !STACK ?auto_208261 ?auto_208260 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208276 - BLOCK
      ?auto_208277 - BLOCK
      ?auto_208278 - BLOCK
      ?auto_208279 - BLOCK
      ?auto_208280 - BLOCK
      ?auto_208281 - BLOCK
      ?auto_208282 - BLOCK
      ?auto_208283 - BLOCK
      ?auto_208284 - BLOCK
      ?auto_208285 - BLOCK
      ?auto_208286 - BLOCK
      ?auto_208287 - BLOCK
      ?auto_208288 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_208287 ) ( ON-TABLE ?auto_208288 ) ( CLEAR ?auto_208288 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_208276 ) ( ON ?auto_208277 ?auto_208276 ) ( ON ?auto_208278 ?auto_208277 ) ( ON ?auto_208279 ?auto_208278 ) ( ON ?auto_208280 ?auto_208279 ) ( ON ?auto_208281 ?auto_208280 ) ( ON ?auto_208282 ?auto_208281 ) ( ON ?auto_208283 ?auto_208282 ) ( ON ?auto_208284 ?auto_208283 ) ( ON ?auto_208285 ?auto_208284 ) ( ON ?auto_208286 ?auto_208285 ) ( ON ?auto_208287 ?auto_208286 ) ( not ( = ?auto_208276 ?auto_208277 ) ) ( not ( = ?auto_208276 ?auto_208278 ) ) ( not ( = ?auto_208276 ?auto_208279 ) ) ( not ( = ?auto_208276 ?auto_208280 ) ) ( not ( = ?auto_208276 ?auto_208281 ) ) ( not ( = ?auto_208276 ?auto_208282 ) ) ( not ( = ?auto_208276 ?auto_208283 ) ) ( not ( = ?auto_208276 ?auto_208284 ) ) ( not ( = ?auto_208276 ?auto_208285 ) ) ( not ( = ?auto_208276 ?auto_208286 ) ) ( not ( = ?auto_208276 ?auto_208287 ) ) ( not ( = ?auto_208276 ?auto_208288 ) ) ( not ( = ?auto_208277 ?auto_208278 ) ) ( not ( = ?auto_208277 ?auto_208279 ) ) ( not ( = ?auto_208277 ?auto_208280 ) ) ( not ( = ?auto_208277 ?auto_208281 ) ) ( not ( = ?auto_208277 ?auto_208282 ) ) ( not ( = ?auto_208277 ?auto_208283 ) ) ( not ( = ?auto_208277 ?auto_208284 ) ) ( not ( = ?auto_208277 ?auto_208285 ) ) ( not ( = ?auto_208277 ?auto_208286 ) ) ( not ( = ?auto_208277 ?auto_208287 ) ) ( not ( = ?auto_208277 ?auto_208288 ) ) ( not ( = ?auto_208278 ?auto_208279 ) ) ( not ( = ?auto_208278 ?auto_208280 ) ) ( not ( = ?auto_208278 ?auto_208281 ) ) ( not ( = ?auto_208278 ?auto_208282 ) ) ( not ( = ?auto_208278 ?auto_208283 ) ) ( not ( = ?auto_208278 ?auto_208284 ) ) ( not ( = ?auto_208278 ?auto_208285 ) ) ( not ( = ?auto_208278 ?auto_208286 ) ) ( not ( = ?auto_208278 ?auto_208287 ) ) ( not ( = ?auto_208278 ?auto_208288 ) ) ( not ( = ?auto_208279 ?auto_208280 ) ) ( not ( = ?auto_208279 ?auto_208281 ) ) ( not ( = ?auto_208279 ?auto_208282 ) ) ( not ( = ?auto_208279 ?auto_208283 ) ) ( not ( = ?auto_208279 ?auto_208284 ) ) ( not ( = ?auto_208279 ?auto_208285 ) ) ( not ( = ?auto_208279 ?auto_208286 ) ) ( not ( = ?auto_208279 ?auto_208287 ) ) ( not ( = ?auto_208279 ?auto_208288 ) ) ( not ( = ?auto_208280 ?auto_208281 ) ) ( not ( = ?auto_208280 ?auto_208282 ) ) ( not ( = ?auto_208280 ?auto_208283 ) ) ( not ( = ?auto_208280 ?auto_208284 ) ) ( not ( = ?auto_208280 ?auto_208285 ) ) ( not ( = ?auto_208280 ?auto_208286 ) ) ( not ( = ?auto_208280 ?auto_208287 ) ) ( not ( = ?auto_208280 ?auto_208288 ) ) ( not ( = ?auto_208281 ?auto_208282 ) ) ( not ( = ?auto_208281 ?auto_208283 ) ) ( not ( = ?auto_208281 ?auto_208284 ) ) ( not ( = ?auto_208281 ?auto_208285 ) ) ( not ( = ?auto_208281 ?auto_208286 ) ) ( not ( = ?auto_208281 ?auto_208287 ) ) ( not ( = ?auto_208281 ?auto_208288 ) ) ( not ( = ?auto_208282 ?auto_208283 ) ) ( not ( = ?auto_208282 ?auto_208284 ) ) ( not ( = ?auto_208282 ?auto_208285 ) ) ( not ( = ?auto_208282 ?auto_208286 ) ) ( not ( = ?auto_208282 ?auto_208287 ) ) ( not ( = ?auto_208282 ?auto_208288 ) ) ( not ( = ?auto_208283 ?auto_208284 ) ) ( not ( = ?auto_208283 ?auto_208285 ) ) ( not ( = ?auto_208283 ?auto_208286 ) ) ( not ( = ?auto_208283 ?auto_208287 ) ) ( not ( = ?auto_208283 ?auto_208288 ) ) ( not ( = ?auto_208284 ?auto_208285 ) ) ( not ( = ?auto_208284 ?auto_208286 ) ) ( not ( = ?auto_208284 ?auto_208287 ) ) ( not ( = ?auto_208284 ?auto_208288 ) ) ( not ( = ?auto_208285 ?auto_208286 ) ) ( not ( = ?auto_208285 ?auto_208287 ) ) ( not ( = ?auto_208285 ?auto_208288 ) ) ( not ( = ?auto_208286 ?auto_208287 ) ) ( not ( = ?auto_208286 ?auto_208288 ) ) ( not ( = ?auto_208287 ?auto_208288 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_208288 )
      ( !STACK ?auto_208288 ?auto_208287 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208302 - BLOCK
      ?auto_208303 - BLOCK
      ?auto_208304 - BLOCK
      ?auto_208305 - BLOCK
      ?auto_208306 - BLOCK
      ?auto_208307 - BLOCK
      ?auto_208308 - BLOCK
      ?auto_208309 - BLOCK
      ?auto_208310 - BLOCK
      ?auto_208311 - BLOCK
      ?auto_208312 - BLOCK
      ?auto_208313 - BLOCK
      ?auto_208314 - BLOCK
    )
    :vars
    (
      ?auto_208315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208314 ?auto_208315 ) ( ON-TABLE ?auto_208302 ) ( ON ?auto_208303 ?auto_208302 ) ( ON ?auto_208304 ?auto_208303 ) ( ON ?auto_208305 ?auto_208304 ) ( ON ?auto_208306 ?auto_208305 ) ( ON ?auto_208307 ?auto_208306 ) ( ON ?auto_208308 ?auto_208307 ) ( ON ?auto_208309 ?auto_208308 ) ( ON ?auto_208310 ?auto_208309 ) ( ON ?auto_208311 ?auto_208310 ) ( ON ?auto_208312 ?auto_208311 ) ( not ( = ?auto_208302 ?auto_208303 ) ) ( not ( = ?auto_208302 ?auto_208304 ) ) ( not ( = ?auto_208302 ?auto_208305 ) ) ( not ( = ?auto_208302 ?auto_208306 ) ) ( not ( = ?auto_208302 ?auto_208307 ) ) ( not ( = ?auto_208302 ?auto_208308 ) ) ( not ( = ?auto_208302 ?auto_208309 ) ) ( not ( = ?auto_208302 ?auto_208310 ) ) ( not ( = ?auto_208302 ?auto_208311 ) ) ( not ( = ?auto_208302 ?auto_208312 ) ) ( not ( = ?auto_208302 ?auto_208313 ) ) ( not ( = ?auto_208302 ?auto_208314 ) ) ( not ( = ?auto_208302 ?auto_208315 ) ) ( not ( = ?auto_208303 ?auto_208304 ) ) ( not ( = ?auto_208303 ?auto_208305 ) ) ( not ( = ?auto_208303 ?auto_208306 ) ) ( not ( = ?auto_208303 ?auto_208307 ) ) ( not ( = ?auto_208303 ?auto_208308 ) ) ( not ( = ?auto_208303 ?auto_208309 ) ) ( not ( = ?auto_208303 ?auto_208310 ) ) ( not ( = ?auto_208303 ?auto_208311 ) ) ( not ( = ?auto_208303 ?auto_208312 ) ) ( not ( = ?auto_208303 ?auto_208313 ) ) ( not ( = ?auto_208303 ?auto_208314 ) ) ( not ( = ?auto_208303 ?auto_208315 ) ) ( not ( = ?auto_208304 ?auto_208305 ) ) ( not ( = ?auto_208304 ?auto_208306 ) ) ( not ( = ?auto_208304 ?auto_208307 ) ) ( not ( = ?auto_208304 ?auto_208308 ) ) ( not ( = ?auto_208304 ?auto_208309 ) ) ( not ( = ?auto_208304 ?auto_208310 ) ) ( not ( = ?auto_208304 ?auto_208311 ) ) ( not ( = ?auto_208304 ?auto_208312 ) ) ( not ( = ?auto_208304 ?auto_208313 ) ) ( not ( = ?auto_208304 ?auto_208314 ) ) ( not ( = ?auto_208304 ?auto_208315 ) ) ( not ( = ?auto_208305 ?auto_208306 ) ) ( not ( = ?auto_208305 ?auto_208307 ) ) ( not ( = ?auto_208305 ?auto_208308 ) ) ( not ( = ?auto_208305 ?auto_208309 ) ) ( not ( = ?auto_208305 ?auto_208310 ) ) ( not ( = ?auto_208305 ?auto_208311 ) ) ( not ( = ?auto_208305 ?auto_208312 ) ) ( not ( = ?auto_208305 ?auto_208313 ) ) ( not ( = ?auto_208305 ?auto_208314 ) ) ( not ( = ?auto_208305 ?auto_208315 ) ) ( not ( = ?auto_208306 ?auto_208307 ) ) ( not ( = ?auto_208306 ?auto_208308 ) ) ( not ( = ?auto_208306 ?auto_208309 ) ) ( not ( = ?auto_208306 ?auto_208310 ) ) ( not ( = ?auto_208306 ?auto_208311 ) ) ( not ( = ?auto_208306 ?auto_208312 ) ) ( not ( = ?auto_208306 ?auto_208313 ) ) ( not ( = ?auto_208306 ?auto_208314 ) ) ( not ( = ?auto_208306 ?auto_208315 ) ) ( not ( = ?auto_208307 ?auto_208308 ) ) ( not ( = ?auto_208307 ?auto_208309 ) ) ( not ( = ?auto_208307 ?auto_208310 ) ) ( not ( = ?auto_208307 ?auto_208311 ) ) ( not ( = ?auto_208307 ?auto_208312 ) ) ( not ( = ?auto_208307 ?auto_208313 ) ) ( not ( = ?auto_208307 ?auto_208314 ) ) ( not ( = ?auto_208307 ?auto_208315 ) ) ( not ( = ?auto_208308 ?auto_208309 ) ) ( not ( = ?auto_208308 ?auto_208310 ) ) ( not ( = ?auto_208308 ?auto_208311 ) ) ( not ( = ?auto_208308 ?auto_208312 ) ) ( not ( = ?auto_208308 ?auto_208313 ) ) ( not ( = ?auto_208308 ?auto_208314 ) ) ( not ( = ?auto_208308 ?auto_208315 ) ) ( not ( = ?auto_208309 ?auto_208310 ) ) ( not ( = ?auto_208309 ?auto_208311 ) ) ( not ( = ?auto_208309 ?auto_208312 ) ) ( not ( = ?auto_208309 ?auto_208313 ) ) ( not ( = ?auto_208309 ?auto_208314 ) ) ( not ( = ?auto_208309 ?auto_208315 ) ) ( not ( = ?auto_208310 ?auto_208311 ) ) ( not ( = ?auto_208310 ?auto_208312 ) ) ( not ( = ?auto_208310 ?auto_208313 ) ) ( not ( = ?auto_208310 ?auto_208314 ) ) ( not ( = ?auto_208310 ?auto_208315 ) ) ( not ( = ?auto_208311 ?auto_208312 ) ) ( not ( = ?auto_208311 ?auto_208313 ) ) ( not ( = ?auto_208311 ?auto_208314 ) ) ( not ( = ?auto_208311 ?auto_208315 ) ) ( not ( = ?auto_208312 ?auto_208313 ) ) ( not ( = ?auto_208312 ?auto_208314 ) ) ( not ( = ?auto_208312 ?auto_208315 ) ) ( not ( = ?auto_208313 ?auto_208314 ) ) ( not ( = ?auto_208313 ?auto_208315 ) ) ( not ( = ?auto_208314 ?auto_208315 ) ) ( CLEAR ?auto_208312 ) ( ON ?auto_208313 ?auto_208314 ) ( CLEAR ?auto_208313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_208302 ?auto_208303 ?auto_208304 ?auto_208305 ?auto_208306 ?auto_208307 ?auto_208308 ?auto_208309 ?auto_208310 ?auto_208311 ?auto_208312 ?auto_208313 )
      ( MAKE-13PILE ?auto_208302 ?auto_208303 ?auto_208304 ?auto_208305 ?auto_208306 ?auto_208307 ?auto_208308 ?auto_208309 ?auto_208310 ?auto_208311 ?auto_208312 ?auto_208313 ?auto_208314 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208329 - BLOCK
      ?auto_208330 - BLOCK
      ?auto_208331 - BLOCK
      ?auto_208332 - BLOCK
      ?auto_208333 - BLOCK
      ?auto_208334 - BLOCK
      ?auto_208335 - BLOCK
      ?auto_208336 - BLOCK
      ?auto_208337 - BLOCK
      ?auto_208338 - BLOCK
      ?auto_208339 - BLOCK
      ?auto_208340 - BLOCK
      ?auto_208341 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208341 ) ( ON-TABLE ?auto_208329 ) ( ON ?auto_208330 ?auto_208329 ) ( ON ?auto_208331 ?auto_208330 ) ( ON ?auto_208332 ?auto_208331 ) ( ON ?auto_208333 ?auto_208332 ) ( ON ?auto_208334 ?auto_208333 ) ( ON ?auto_208335 ?auto_208334 ) ( ON ?auto_208336 ?auto_208335 ) ( ON ?auto_208337 ?auto_208336 ) ( ON ?auto_208338 ?auto_208337 ) ( ON ?auto_208339 ?auto_208338 ) ( not ( = ?auto_208329 ?auto_208330 ) ) ( not ( = ?auto_208329 ?auto_208331 ) ) ( not ( = ?auto_208329 ?auto_208332 ) ) ( not ( = ?auto_208329 ?auto_208333 ) ) ( not ( = ?auto_208329 ?auto_208334 ) ) ( not ( = ?auto_208329 ?auto_208335 ) ) ( not ( = ?auto_208329 ?auto_208336 ) ) ( not ( = ?auto_208329 ?auto_208337 ) ) ( not ( = ?auto_208329 ?auto_208338 ) ) ( not ( = ?auto_208329 ?auto_208339 ) ) ( not ( = ?auto_208329 ?auto_208340 ) ) ( not ( = ?auto_208329 ?auto_208341 ) ) ( not ( = ?auto_208330 ?auto_208331 ) ) ( not ( = ?auto_208330 ?auto_208332 ) ) ( not ( = ?auto_208330 ?auto_208333 ) ) ( not ( = ?auto_208330 ?auto_208334 ) ) ( not ( = ?auto_208330 ?auto_208335 ) ) ( not ( = ?auto_208330 ?auto_208336 ) ) ( not ( = ?auto_208330 ?auto_208337 ) ) ( not ( = ?auto_208330 ?auto_208338 ) ) ( not ( = ?auto_208330 ?auto_208339 ) ) ( not ( = ?auto_208330 ?auto_208340 ) ) ( not ( = ?auto_208330 ?auto_208341 ) ) ( not ( = ?auto_208331 ?auto_208332 ) ) ( not ( = ?auto_208331 ?auto_208333 ) ) ( not ( = ?auto_208331 ?auto_208334 ) ) ( not ( = ?auto_208331 ?auto_208335 ) ) ( not ( = ?auto_208331 ?auto_208336 ) ) ( not ( = ?auto_208331 ?auto_208337 ) ) ( not ( = ?auto_208331 ?auto_208338 ) ) ( not ( = ?auto_208331 ?auto_208339 ) ) ( not ( = ?auto_208331 ?auto_208340 ) ) ( not ( = ?auto_208331 ?auto_208341 ) ) ( not ( = ?auto_208332 ?auto_208333 ) ) ( not ( = ?auto_208332 ?auto_208334 ) ) ( not ( = ?auto_208332 ?auto_208335 ) ) ( not ( = ?auto_208332 ?auto_208336 ) ) ( not ( = ?auto_208332 ?auto_208337 ) ) ( not ( = ?auto_208332 ?auto_208338 ) ) ( not ( = ?auto_208332 ?auto_208339 ) ) ( not ( = ?auto_208332 ?auto_208340 ) ) ( not ( = ?auto_208332 ?auto_208341 ) ) ( not ( = ?auto_208333 ?auto_208334 ) ) ( not ( = ?auto_208333 ?auto_208335 ) ) ( not ( = ?auto_208333 ?auto_208336 ) ) ( not ( = ?auto_208333 ?auto_208337 ) ) ( not ( = ?auto_208333 ?auto_208338 ) ) ( not ( = ?auto_208333 ?auto_208339 ) ) ( not ( = ?auto_208333 ?auto_208340 ) ) ( not ( = ?auto_208333 ?auto_208341 ) ) ( not ( = ?auto_208334 ?auto_208335 ) ) ( not ( = ?auto_208334 ?auto_208336 ) ) ( not ( = ?auto_208334 ?auto_208337 ) ) ( not ( = ?auto_208334 ?auto_208338 ) ) ( not ( = ?auto_208334 ?auto_208339 ) ) ( not ( = ?auto_208334 ?auto_208340 ) ) ( not ( = ?auto_208334 ?auto_208341 ) ) ( not ( = ?auto_208335 ?auto_208336 ) ) ( not ( = ?auto_208335 ?auto_208337 ) ) ( not ( = ?auto_208335 ?auto_208338 ) ) ( not ( = ?auto_208335 ?auto_208339 ) ) ( not ( = ?auto_208335 ?auto_208340 ) ) ( not ( = ?auto_208335 ?auto_208341 ) ) ( not ( = ?auto_208336 ?auto_208337 ) ) ( not ( = ?auto_208336 ?auto_208338 ) ) ( not ( = ?auto_208336 ?auto_208339 ) ) ( not ( = ?auto_208336 ?auto_208340 ) ) ( not ( = ?auto_208336 ?auto_208341 ) ) ( not ( = ?auto_208337 ?auto_208338 ) ) ( not ( = ?auto_208337 ?auto_208339 ) ) ( not ( = ?auto_208337 ?auto_208340 ) ) ( not ( = ?auto_208337 ?auto_208341 ) ) ( not ( = ?auto_208338 ?auto_208339 ) ) ( not ( = ?auto_208338 ?auto_208340 ) ) ( not ( = ?auto_208338 ?auto_208341 ) ) ( not ( = ?auto_208339 ?auto_208340 ) ) ( not ( = ?auto_208339 ?auto_208341 ) ) ( not ( = ?auto_208340 ?auto_208341 ) ) ( CLEAR ?auto_208339 ) ( ON ?auto_208340 ?auto_208341 ) ( CLEAR ?auto_208340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_208329 ?auto_208330 ?auto_208331 ?auto_208332 ?auto_208333 ?auto_208334 ?auto_208335 ?auto_208336 ?auto_208337 ?auto_208338 ?auto_208339 ?auto_208340 )
      ( MAKE-13PILE ?auto_208329 ?auto_208330 ?auto_208331 ?auto_208332 ?auto_208333 ?auto_208334 ?auto_208335 ?auto_208336 ?auto_208337 ?auto_208338 ?auto_208339 ?auto_208340 ?auto_208341 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208355 - BLOCK
      ?auto_208356 - BLOCK
      ?auto_208357 - BLOCK
      ?auto_208358 - BLOCK
      ?auto_208359 - BLOCK
      ?auto_208360 - BLOCK
      ?auto_208361 - BLOCK
      ?auto_208362 - BLOCK
      ?auto_208363 - BLOCK
      ?auto_208364 - BLOCK
      ?auto_208365 - BLOCK
      ?auto_208366 - BLOCK
      ?auto_208367 - BLOCK
    )
    :vars
    (
      ?auto_208368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208367 ?auto_208368 ) ( ON-TABLE ?auto_208355 ) ( ON ?auto_208356 ?auto_208355 ) ( ON ?auto_208357 ?auto_208356 ) ( ON ?auto_208358 ?auto_208357 ) ( ON ?auto_208359 ?auto_208358 ) ( ON ?auto_208360 ?auto_208359 ) ( ON ?auto_208361 ?auto_208360 ) ( ON ?auto_208362 ?auto_208361 ) ( ON ?auto_208363 ?auto_208362 ) ( ON ?auto_208364 ?auto_208363 ) ( not ( = ?auto_208355 ?auto_208356 ) ) ( not ( = ?auto_208355 ?auto_208357 ) ) ( not ( = ?auto_208355 ?auto_208358 ) ) ( not ( = ?auto_208355 ?auto_208359 ) ) ( not ( = ?auto_208355 ?auto_208360 ) ) ( not ( = ?auto_208355 ?auto_208361 ) ) ( not ( = ?auto_208355 ?auto_208362 ) ) ( not ( = ?auto_208355 ?auto_208363 ) ) ( not ( = ?auto_208355 ?auto_208364 ) ) ( not ( = ?auto_208355 ?auto_208365 ) ) ( not ( = ?auto_208355 ?auto_208366 ) ) ( not ( = ?auto_208355 ?auto_208367 ) ) ( not ( = ?auto_208355 ?auto_208368 ) ) ( not ( = ?auto_208356 ?auto_208357 ) ) ( not ( = ?auto_208356 ?auto_208358 ) ) ( not ( = ?auto_208356 ?auto_208359 ) ) ( not ( = ?auto_208356 ?auto_208360 ) ) ( not ( = ?auto_208356 ?auto_208361 ) ) ( not ( = ?auto_208356 ?auto_208362 ) ) ( not ( = ?auto_208356 ?auto_208363 ) ) ( not ( = ?auto_208356 ?auto_208364 ) ) ( not ( = ?auto_208356 ?auto_208365 ) ) ( not ( = ?auto_208356 ?auto_208366 ) ) ( not ( = ?auto_208356 ?auto_208367 ) ) ( not ( = ?auto_208356 ?auto_208368 ) ) ( not ( = ?auto_208357 ?auto_208358 ) ) ( not ( = ?auto_208357 ?auto_208359 ) ) ( not ( = ?auto_208357 ?auto_208360 ) ) ( not ( = ?auto_208357 ?auto_208361 ) ) ( not ( = ?auto_208357 ?auto_208362 ) ) ( not ( = ?auto_208357 ?auto_208363 ) ) ( not ( = ?auto_208357 ?auto_208364 ) ) ( not ( = ?auto_208357 ?auto_208365 ) ) ( not ( = ?auto_208357 ?auto_208366 ) ) ( not ( = ?auto_208357 ?auto_208367 ) ) ( not ( = ?auto_208357 ?auto_208368 ) ) ( not ( = ?auto_208358 ?auto_208359 ) ) ( not ( = ?auto_208358 ?auto_208360 ) ) ( not ( = ?auto_208358 ?auto_208361 ) ) ( not ( = ?auto_208358 ?auto_208362 ) ) ( not ( = ?auto_208358 ?auto_208363 ) ) ( not ( = ?auto_208358 ?auto_208364 ) ) ( not ( = ?auto_208358 ?auto_208365 ) ) ( not ( = ?auto_208358 ?auto_208366 ) ) ( not ( = ?auto_208358 ?auto_208367 ) ) ( not ( = ?auto_208358 ?auto_208368 ) ) ( not ( = ?auto_208359 ?auto_208360 ) ) ( not ( = ?auto_208359 ?auto_208361 ) ) ( not ( = ?auto_208359 ?auto_208362 ) ) ( not ( = ?auto_208359 ?auto_208363 ) ) ( not ( = ?auto_208359 ?auto_208364 ) ) ( not ( = ?auto_208359 ?auto_208365 ) ) ( not ( = ?auto_208359 ?auto_208366 ) ) ( not ( = ?auto_208359 ?auto_208367 ) ) ( not ( = ?auto_208359 ?auto_208368 ) ) ( not ( = ?auto_208360 ?auto_208361 ) ) ( not ( = ?auto_208360 ?auto_208362 ) ) ( not ( = ?auto_208360 ?auto_208363 ) ) ( not ( = ?auto_208360 ?auto_208364 ) ) ( not ( = ?auto_208360 ?auto_208365 ) ) ( not ( = ?auto_208360 ?auto_208366 ) ) ( not ( = ?auto_208360 ?auto_208367 ) ) ( not ( = ?auto_208360 ?auto_208368 ) ) ( not ( = ?auto_208361 ?auto_208362 ) ) ( not ( = ?auto_208361 ?auto_208363 ) ) ( not ( = ?auto_208361 ?auto_208364 ) ) ( not ( = ?auto_208361 ?auto_208365 ) ) ( not ( = ?auto_208361 ?auto_208366 ) ) ( not ( = ?auto_208361 ?auto_208367 ) ) ( not ( = ?auto_208361 ?auto_208368 ) ) ( not ( = ?auto_208362 ?auto_208363 ) ) ( not ( = ?auto_208362 ?auto_208364 ) ) ( not ( = ?auto_208362 ?auto_208365 ) ) ( not ( = ?auto_208362 ?auto_208366 ) ) ( not ( = ?auto_208362 ?auto_208367 ) ) ( not ( = ?auto_208362 ?auto_208368 ) ) ( not ( = ?auto_208363 ?auto_208364 ) ) ( not ( = ?auto_208363 ?auto_208365 ) ) ( not ( = ?auto_208363 ?auto_208366 ) ) ( not ( = ?auto_208363 ?auto_208367 ) ) ( not ( = ?auto_208363 ?auto_208368 ) ) ( not ( = ?auto_208364 ?auto_208365 ) ) ( not ( = ?auto_208364 ?auto_208366 ) ) ( not ( = ?auto_208364 ?auto_208367 ) ) ( not ( = ?auto_208364 ?auto_208368 ) ) ( not ( = ?auto_208365 ?auto_208366 ) ) ( not ( = ?auto_208365 ?auto_208367 ) ) ( not ( = ?auto_208365 ?auto_208368 ) ) ( not ( = ?auto_208366 ?auto_208367 ) ) ( not ( = ?auto_208366 ?auto_208368 ) ) ( not ( = ?auto_208367 ?auto_208368 ) ) ( ON ?auto_208366 ?auto_208367 ) ( CLEAR ?auto_208364 ) ( ON ?auto_208365 ?auto_208366 ) ( CLEAR ?auto_208365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_208355 ?auto_208356 ?auto_208357 ?auto_208358 ?auto_208359 ?auto_208360 ?auto_208361 ?auto_208362 ?auto_208363 ?auto_208364 ?auto_208365 )
      ( MAKE-13PILE ?auto_208355 ?auto_208356 ?auto_208357 ?auto_208358 ?auto_208359 ?auto_208360 ?auto_208361 ?auto_208362 ?auto_208363 ?auto_208364 ?auto_208365 ?auto_208366 ?auto_208367 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208382 - BLOCK
      ?auto_208383 - BLOCK
      ?auto_208384 - BLOCK
      ?auto_208385 - BLOCK
      ?auto_208386 - BLOCK
      ?auto_208387 - BLOCK
      ?auto_208388 - BLOCK
      ?auto_208389 - BLOCK
      ?auto_208390 - BLOCK
      ?auto_208391 - BLOCK
      ?auto_208392 - BLOCK
      ?auto_208393 - BLOCK
      ?auto_208394 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208394 ) ( ON-TABLE ?auto_208382 ) ( ON ?auto_208383 ?auto_208382 ) ( ON ?auto_208384 ?auto_208383 ) ( ON ?auto_208385 ?auto_208384 ) ( ON ?auto_208386 ?auto_208385 ) ( ON ?auto_208387 ?auto_208386 ) ( ON ?auto_208388 ?auto_208387 ) ( ON ?auto_208389 ?auto_208388 ) ( ON ?auto_208390 ?auto_208389 ) ( ON ?auto_208391 ?auto_208390 ) ( not ( = ?auto_208382 ?auto_208383 ) ) ( not ( = ?auto_208382 ?auto_208384 ) ) ( not ( = ?auto_208382 ?auto_208385 ) ) ( not ( = ?auto_208382 ?auto_208386 ) ) ( not ( = ?auto_208382 ?auto_208387 ) ) ( not ( = ?auto_208382 ?auto_208388 ) ) ( not ( = ?auto_208382 ?auto_208389 ) ) ( not ( = ?auto_208382 ?auto_208390 ) ) ( not ( = ?auto_208382 ?auto_208391 ) ) ( not ( = ?auto_208382 ?auto_208392 ) ) ( not ( = ?auto_208382 ?auto_208393 ) ) ( not ( = ?auto_208382 ?auto_208394 ) ) ( not ( = ?auto_208383 ?auto_208384 ) ) ( not ( = ?auto_208383 ?auto_208385 ) ) ( not ( = ?auto_208383 ?auto_208386 ) ) ( not ( = ?auto_208383 ?auto_208387 ) ) ( not ( = ?auto_208383 ?auto_208388 ) ) ( not ( = ?auto_208383 ?auto_208389 ) ) ( not ( = ?auto_208383 ?auto_208390 ) ) ( not ( = ?auto_208383 ?auto_208391 ) ) ( not ( = ?auto_208383 ?auto_208392 ) ) ( not ( = ?auto_208383 ?auto_208393 ) ) ( not ( = ?auto_208383 ?auto_208394 ) ) ( not ( = ?auto_208384 ?auto_208385 ) ) ( not ( = ?auto_208384 ?auto_208386 ) ) ( not ( = ?auto_208384 ?auto_208387 ) ) ( not ( = ?auto_208384 ?auto_208388 ) ) ( not ( = ?auto_208384 ?auto_208389 ) ) ( not ( = ?auto_208384 ?auto_208390 ) ) ( not ( = ?auto_208384 ?auto_208391 ) ) ( not ( = ?auto_208384 ?auto_208392 ) ) ( not ( = ?auto_208384 ?auto_208393 ) ) ( not ( = ?auto_208384 ?auto_208394 ) ) ( not ( = ?auto_208385 ?auto_208386 ) ) ( not ( = ?auto_208385 ?auto_208387 ) ) ( not ( = ?auto_208385 ?auto_208388 ) ) ( not ( = ?auto_208385 ?auto_208389 ) ) ( not ( = ?auto_208385 ?auto_208390 ) ) ( not ( = ?auto_208385 ?auto_208391 ) ) ( not ( = ?auto_208385 ?auto_208392 ) ) ( not ( = ?auto_208385 ?auto_208393 ) ) ( not ( = ?auto_208385 ?auto_208394 ) ) ( not ( = ?auto_208386 ?auto_208387 ) ) ( not ( = ?auto_208386 ?auto_208388 ) ) ( not ( = ?auto_208386 ?auto_208389 ) ) ( not ( = ?auto_208386 ?auto_208390 ) ) ( not ( = ?auto_208386 ?auto_208391 ) ) ( not ( = ?auto_208386 ?auto_208392 ) ) ( not ( = ?auto_208386 ?auto_208393 ) ) ( not ( = ?auto_208386 ?auto_208394 ) ) ( not ( = ?auto_208387 ?auto_208388 ) ) ( not ( = ?auto_208387 ?auto_208389 ) ) ( not ( = ?auto_208387 ?auto_208390 ) ) ( not ( = ?auto_208387 ?auto_208391 ) ) ( not ( = ?auto_208387 ?auto_208392 ) ) ( not ( = ?auto_208387 ?auto_208393 ) ) ( not ( = ?auto_208387 ?auto_208394 ) ) ( not ( = ?auto_208388 ?auto_208389 ) ) ( not ( = ?auto_208388 ?auto_208390 ) ) ( not ( = ?auto_208388 ?auto_208391 ) ) ( not ( = ?auto_208388 ?auto_208392 ) ) ( not ( = ?auto_208388 ?auto_208393 ) ) ( not ( = ?auto_208388 ?auto_208394 ) ) ( not ( = ?auto_208389 ?auto_208390 ) ) ( not ( = ?auto_208389 ?auto_208391 ) ) ( not ( = ?auto_208389 ?auto_208392 ) ) ( not ( = ?auto_208389 ?auto_208393 ) ) ( not ( = ?auto_208389 ?auto_208394 ) ) ( not ( = ?auto_208390 ?auto_208391 ) ) ( not ( = ?auto_208390 ?auto_208392 ) ) ( not ( = ?auto_208390 ?auto_208393 ) ) ( not ( = ?auto_208390 ?auto_208394 ) ) ( not ( = ?auto_208391 ?auto_208392 ) ) ( not ( = ?auto_208391 ?auto_208393 ) ) ( not ( = ?auto_208391 ?auto_208394 ) ) ( not ( = ?auto_208392 ?auto_208393 ) ) ( not ( = ?auto_208392 ?auto_208394 ) ) ( not ( = ?auto_208393 ?auto_208394 ) ) ( ON ?auto_208393 ?auto_208394 ) ( CLEAR ?auto_208391 ) ( ON ?auto_208392 ?auto_208393 ) ( CLEAR ?auto_208392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_208382 ?auto_208383 ?auto_208384 ?auto_208385 ?auto_208386 ?auto_208387 ?auto_208388 ?auto_208389 ?auto_208390 ?auto_208391 ?auto_208392 )
      ( MAKE-13PILE ?auto_208382 ?auto_208383 ?auto_208384 ?auto_208385 ?auto_208386 ?auto_208387 ?auto_208388 ?auto_208389 ?auto_208390 ?auto_208391 ?auto_208392 ?auto_208393 ?auto_208394 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208408 - BLOCK
      ?auto_208409 - BLOCK
      ?auto_208410 - BLOCK
      ?auto_208411 - BLOCK
      ?auto_208412 - BLOCK
      ?auto_208413 - BLOCK
      ?auto_208414 - BLOCK
      ?auto_208415 - BLOCK
      ?auto_208416 - BLOCK
      ?auto_208417 - BLOCK
      ?auto_208418 - BLOCK
      ?auto_208419 - BLOCK
      ?auto_208420 - BLOCK
    )
    :vars
    (
      ?auto_208421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208420 ?auto_208421 ) ( ON-TABLE ?auto_208408 ) ( ON ?auto_208409 ?auto_208408 ) ( ON ?auto_208410 ?auto_208409 ) ( ON ?auto_208411 ?auto_208410 ) ( ON ?auto_208412 ?auto_208411 ) ( ON ?auto_208413 ?auto_208412 ) ( ON ?auto_208414 ?auto_208413 ) ( ON ?auto_208415 ?auto_208414 ) ( ON ?auto_208416 ?auto_208415 ) ( not ( = ?auto_208408 ?auto_208409 ) ) ( not ( = ?auto_208408 ?auto_208410 ) ) ( not ( = ?auto_208408 ?auto_208411 ) ) ( not ( = ?auto_208408 ?auto_208412 ) ) ( not ( = ?auto_208408 ?auto_208413 ) ) ( not ( = ?auto_208408 ?auto_208414 ) ) ( not ( = ?auto_208408 ?auto_208415 ) ) ( not ( = ?auto_208408 ?auto_208416 ) ) ( not ( = ?auto_208408 ?auto_208417 ) ) ( not ( = ?auto_208408 ?auto_208418 ) ) ( not ( = ?auto_208408 ?auto_208419 ) ) ( not ( = ?auto_208408 ?auto_208420 ) ) ( not ( = ?auto_208408 ?auto_208421 ) ) ( not ( = ?auto_208409 ?auto_208410 ) ) ( not ( = ?auto_208409 ?auto_208411 ) ) ( not ( = ?auto_208409 ?auto_208412 ) ) ( not ( = ?auto_208409 ?auto_208413 ) ) ( not ( = ?auto_208409 ?auto_208414 ) ) ( not ( = ?auto_208409 ?auto_208415 ) ) ( not ( = ?auto_208409 ?auto_208416 ) ) ( not ( = ?auto_208409 ?auto_208417 ) ) ( not ( = ?auto_208409 ?auto_208418 ) ) ( not ( = ?auto_208409 ?auto_208419 ) ) ( not ( = ?auto_208409 ?auto_208420 ) ) ( not ( = ?auto_208409 ?auto_208421 ) ) ( not ( = ?auto_208410 ?auto_208411 ) ) ( not ( = ?auto_208410 ?auto_208412 ) ) ( not ( = ?auto_208410 ?auto_208413 ) ) ( not ( = ?auto_208410 ?auto_208414 ) ) ( not ( = ?auto_208410 ?auto_208415 ) ) ( not ( = ?auto_208410 ?auto_208416 ) ) ( not ( = ?auto_208410 ?auto_208417 ) ) ( not ( = ?auto_208410 ?auto_208418 ) ) ( not ( = ?auto_208410 ?auto_208419 ) ) ( not ( = ?auto_208410 ?auto_208420 ) ) ( not ( = ?auto_208410 ?auto_208421 ) ) ( not ( = ?auto_208411 ?auto_208412 ) ) ( not ( = ?auto_208411 ?auto_208413 ) ) ( not ( = ?auto_208411 ?auto_208414 ) ) ( not ( = ?auto_208411 ?auto_208415 ) ) ( not ( = ?auto_208411 ?auto_208416 ) ) ( not ( = ?auto_208411 ?auto_208417 ) ) ( not ( = ?auto_208411 ?auto_208418 ) ) ( not ( = ?auto_208411 ?auto_208419 ) ) ( not ( = ?auto_208411 ?auto_208420 ) ) ( not ( = ?auto_208411 ?auto_208421 ) ) ( not ( = ?auto_208412 ?auto_208413 ) ) ( not ( = ?auto_208412 ?auto_208414 ) ) ( not ( = ?auto_208412 ?auto_208415 ) ) ( not ( = ?auto_208412 ?auto_208416 ) ) ( not ( = ?auto_208412 ?auto_208417 ) ) ( not ( = ?auto_208412 ?auto_208418 ) ) ( not ( = ?auto_208412 ?auto_208419 ) ) ( not ( = ?auto_208412 ?auto_208420 ) ) ( not ( = ?auto_208412 ?auto_208421 ) ) ( not ( = ?auto_208413 ?auto_208414 ) ) ( not ( = ?auto_208413 ?auto_208415 ) ) ( not ( = ?auto_208413 ?auto_208416 ) ) ( not ( = ?auto_208413 ?auto_208417 ) ) ( not ( = ?auto_208413 ?auto_208418 ) ) ( not ( = ?auto_208413 ?auto_208419 ) ) ( not ( = ?auto_208413 ?auto_208420 ) ) ( not ( = ?auto_208413 ?auto_208421 ) ) ( not ( = ?auto_208414 ?auto_208415 ) ) ( not ( = ?auto_208414 ?auto_208416 ) ) ( not ( = ?auto_208414 ?auto_208417 ) ) ( not ( = ?auto_208414 ?auto_208418 ) ) ( not ( = ?auto_208414 ?auto_208419 ) ) ( not ( = ?auto_208414 ?auto_208420 ) ) ( not ( = ?auto_208414 ?auto_208421 ) ) ( not ( = ?auto_208415 ?auto_208416 ) ) ( not ( = ?auto_208415 ?auto_208417 ) ) ( not ( = ?auto_208415 ?auto_208418 ) ) ( not ( = ?auto_208415 ?auto_208419 ) ) ( not ( = ?auto_208415 ?auto_208420 ) ) ( not ( = ?auto_208415 ?auto_208421 ) ) ( not ( = ?auto_208416 ?auto_208417 ) ) ( not ( = ?auto_208416 ?auto_208418 ) ) ( not ( = ?auto_208416 ?auto_208419 ) ) ( not ( = ?auto_208416 ?auto_208420 ) ) ( not ( = ?auto_208416 ?auto_208421 ) ) ( not ( = ?auto_208417 ?auto_208418 ) ) ( not ( = ?auto_208417 ?auto_208419 ) ) ( not ( = ?auto_208417 ?auto_208420 ) ) ( not ( = ?auto_208417 ?auto_208421 ) ) ( not ( = ?auto_208418 ?auto_208419 ) ) ( not ( = ?auto_208418 ?auto_208420 ) ) ( not ( = ?auto_208418 ?auto_208421 ) ) ( not ( = ?auto_208419 ?auto_208420 ) ) ( not ( = ?auto_208419 ?auto_208421 ) ) ( not ( = ?auto_208420 ?auto_208421 ) ) ( ON ?auto_208419 ?auto_208420 ) ( ON ?auto_208418 ?auto_208419 ) ( CLEAR ?auto_208416 ) ( ON ?auto_208417 ?auto_208418 ) ( CLEAR ?auto_208417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_208408 ?auto_208409 ?auto_208410 ?auto_208411 ?auto_208412 ?auto_208413 ?auto_208414 ?auto_208415 ?auto_208416 ?auto_208417 )
      ( MAKE-13PILE ?auto_208408 ?auto_208409 ?auto_208410 ?auto_208411 ?auto_208412 ?auto_208413 ?auto_208414 ?auto_208415 ?auto_208416 ?auto_208417 ?auto_208418 ?auto_208419 ?auto_208420 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208435 - BLOCK
      ?auto_208436 - BLOCK
      ?auto_208437 - BLOCK
      ?auto_208438 - BLOCK
      ?auto_208439 - BLOCK
      ?auto_208440 - BLOCK
      ?auto_208441 - BLOCK
      ?auto_208442 - BLOCK
      ?auto_208443 - BLOCK
      ?auto_208444 - BLOCK
      ?auto_208445 - BLOCK
      ?auto_208446 - BLOCK
      ?auto_208447 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208447 ) ( ON-TABLE ?auto_208435 ) ( ON ?auto_208436 ?auto_208435 ) ( ON ?auto_208437 ?auto_208436 ) ( ON ?auto_208438 ?auto_208437 ) ( ON ?auto_208439 ?auto_208438 ) ( ON ?auto_208440 ?auto_208439 ) ( ON ?auto_208441 ?auto_208440 ) ( ON ?auto_208442 ?auto_208441 ) ( ON ?auto_208443 ?auto_208442 ) ( not ( = ?auto_208435 ?auto_208436 ) ) ( not ( = ?auto_208435 ?auto_208437 ) ) ( not ( = ?auto_208435 ?auto_208438 ) ) ( not ( = ?auto_208435 ?auto_208439 ) ) ( not ( = ?auto_208435 ?auto_208440 ) ) ( not ( = ?auto_208435 ?auto_208441 ) ) ( not ( = ?auto_208435 ?auto_208442 ) ) ( not ( = ?auto_208435 ?auto_208443 ) ) ( not ( = ?auto_208435 ?auto_208444 ) ) ( not ( = ?auto_208435 ?auto_208445 ) ) ( not ( = ?auto_208435 ?auto_208446 ) ) ( not ( = ?auto_208435 ?auto_208447 ) ) ( not ( = ?auto_208436 ?auto_208437 ) ) ( not ( = ?auto_208436 ?auto_208438 ) ) ( not ( = ?auto_208436 ?auto_208439 ) ) ( not ( = ?auto_208436 ?auto_208440 ) ) ( not ( = ?auto_208436 ?auto_208441 ) ) ( not ( = ?auto_208436 ?auto_208442 ) ) ( not ( = ?auto_208436 ?auto_208443 ) ) ( not ( = ?auto_208436 ?auto_208444 ) ) ( not ( = ?auto_208436 ?auto_208445 ) ) ( not ( = ?auto_208436 ?auto_208446 ) ) ( not ( = ?auto_208436 ?auto_208447 ) ) ( not ( = ?auto_208437 ?auto_208438 ) ) ( not ( = ?auto_208437 ?auto_208439 ) ) ( not ( = ?auto_208437 ?auto_208440 ) ) ( not ( = ?auto_208437 ?auto_208441 ) ) ( not ( = ?auto_208437 ?auto_208442 ) ) ( not ( = ?auto_208437 ?auto_208443 ) ) ( not ( = ?auto_208437 ?auto_208444 ) ) ( not ( = ?auto_208437 ?auto_208445 ) ) ( not ( = ?auto_208437 ?auto_208446 ) ) ( not ( = ?auto_208437 ?auto_208447 ) ) ( not ( = ?auto_208438 ?auto_208439 ) ) ( not ( = ?auto_208438 ?auto_208440 ) ) ( not ( = ?auto_208438 ?auto_208441 ) ) ( not ( = ?auto_208438 ?auto_208442 ) ) ( not ( = ?auto_208438 ?auto_208443 ) ) ( not ( = ?auto_208438 ?auto_208444 ) ) ( not ( = ?auto_208438 ?auto_208445 ) ) ( not ( = ?auto_208438 ?auto_208446 ) ) ( not ( = ?auto_208438 ?auto_208447 ) ) ( not ( = ?auto_208439 ?auto_208440 ) ) ( not ( = ?auto_208439 ?auto_208441 ) ) ( not ( = ?auto_208439 ?auto_208442 ) ) ( not ( = ?auto_208439 ?auto_208443 ) ) ( not ( = ?auto_208439 ?auto_208444 ) ) ( not ( = ?auto_208439 ?auto_208445 ) ) ( not ( = ?auto_208439 ?auto_208446 ) ) ( not ( = ?auto_208439 ?auto_208447 ) ) ( not ( = ?auto_208440 ?auto_208441 ) ) ( not ( = ?auto_208440 ?auto_208442 ) ) ( not ( = ?auto_208440 ?auto_208443 ) ) ( not ( = ?auto_208440 ?auto_208444 ) ) ( not ( = ?auto_208440 ?auto_208445 ) ) ( not ( = ?auto_208440 ?auto_208446 ) ) ( not ( = ?auto_208440 ?auto_208447 ) ) ( not ( = ?auto_208441 ?auto_208442 ) ) ( not ( = ?auto_208441 ?auto_208443 ) ) ( not ( = ?auto_208441 ?auto_208444 ) ) ( not ( = ?auto_208441 ?auto_208445 ) ) ( not ( = ?auto_208441 ?auto_208446 ) ) ( not ( = ?auto_208441 ?auto_208447 ) ) ( not ( = ?auto_208442 ?auto_208443 ) ) ( not ( = ?auto_208442 ?auto_208444 ) ) ( not ( = ?auto_208442 ?auto_208445 ) ) ( not ( = ?auto_208442 ?auto_208446 ) ) ( not ( = ?auto_208442 ?auto_208447 ) ) ( not ( = ?auto_208443 ?auto_208444 ) ) ( not ( = ?auto_208443 ?auto_208445 ) ) ( not ( = ?auto_208443 ?auto_208446 ) ) ( not ( = ?auto_208443 ?auto_208447 ) ) ( not ( = ?auto_208444 ?auto_208445 ) ) ( not ( = ?auto_208444 ?auto_208446 ) ) ( not ( = ?auto_208444 ?auto_208447 ) ) ( not ( = ?auto_208445 ?auto_208446 ) ) ( not ( = ?auto_208445 ?auto_208447 ) ) ( not ( = ?auto_208446 ?auto_208447 ) ) ( ON ?auto_208446 ?auto_208447 ) ( ON ?auto_208445 ?auto_208446 ) ( CLEAR ?auto_208443 ) ( ON ?auto_208444 ?auto_208445 ) ( CLEAR ?auto_208444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_208435 ?auto_208436 ?auto_208437 ?auto_208438 ?auto_208439 ?auto_208440 ?auto_208441 ?auto_208442 ?auto_208443 ?auto_208444 )
      ( MAKE-13PILE ?auto_208435 ?auto_208436 ?auto_208437 ?auto_208438 ?auto_208439 ?auto_208440 ?auto_208441 ?auto_208442 ?auto_208443 ?auto_208444 ?auto_208445 ?auto_208446 ?auto_208447 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208461 - BLOCK
      ?auto_208462 - BLOCK
      ?auto_208463 - BLOCK
      ?auto_208464 - BLOCK
      ?auto_208465 - BLOCK
      ?auto_208466 - BLOCK
      ?auto_208467 - BLOCK
      ?auto_208468 - BLOCK
      ?auto_208469 - BLOCK
      ?auto_208470 - BLOCK
      ?auto_208471 - BLOCK
      ?auto_208472 - BLOCK
      ?auto_208473 - BLOCK
    )
    :vars
    (
      ?auto_208474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208473 ?auto_208474 ) ( ON-TABLE ?auto_208461 ) ( ON ?auto_208462 ?auto_208461 ) ( ON ?auto_208463 ?auto_208462 ) ( ON ?auto_208464 ?auto_208463 ) ( ON ?auto_208465 ?auto_208464 ) ( ON ?auto_208466 ?auto_208465 ) ( ON ?auto_208467 ?auto_208466 ) ( ON ?auto_208468 ?auto_208467 ) ( not ( = ?auto_208461 ?auto_208462 ) ) ( not ( = ?auto_208461 ?auto_208463 ) ) ( not ( = ?auto_208461 ?auto_208464 ) ) ( not ( = ?auto_208461 ?auto_208465 ) ) ( not ( = ?auto_208461 ?auto_208466 ) ) ( not ( = ?auto_208461 ?auto_208467 ) ) ( not ( = ?auto_208461 ?auto_208468 ) ) ( not ( = ?auto_208461 ?auto_208469 ) ) ( not ( = ?auto_208461 ?auto_208470 ) ) ( not ( = ?auto_208461 ?auto_208471 ) ) ( not ( = ?auto_208461 ?auto_208472 ) ) ( not ( = ?auto_208461 ?auto_208473 ) ) ( not ( = ?auto_208461 ?auto_208474 ) ) ( not ( = ?auto_208462 ?auto_208463 ) ) ( not ( = ?auto_208462 ?auto_208464 ) ) ( not ( = ?auto_208462 ?auto_208465 ) ) ( not ( = ?auto_208462 ?auto_208466 ) ) ( not ( = ?auto_208462 ?auto_208467 ) ) ( not ( = ?auto_208462 ?auto_208468 ) ) ( not ( = ?auto_208462 ?auto_208469 ) ) ( not ( = ?auto_208462 ?auto_208470 ) ) ( not ( = ?auto_208462 ?auto_208471 ) ) ( not ( = ?auto_208462 ?auto_208472 ) ) ( not ( = ?auto_208462 ?auto_208473 ) ) ( not ( = ?auto_208462 ?auto_208474 ) ) ( not ( = ?auto_208463 ?auto_208464 ) ) ( not ( = ?auto_208463 ?auto_208465 ) ) ( not ( = ?auto_208463 ?auto_208466 ) ) ( not ( = ?auto_208463 ?auto_208467 ) ) ( not ( = ?auto_208463 ?auto_208468 ) ) ( not ( = ?auto_208463 ?auto_208469 ) ) ( not ( = ?auto_208463 ?auto_208470 ) ) ( not ( = ?auto_208463 ?auto_208471 ) ) ( not ( = ?auto_208463 ?auto_208472 ) ) ( not ( = ?auto_208463 ?auto_208473 ) ) ( not ( = ?auto_208463 ?auto_208474 ) ) ( not ( = ?auto_208464 ?auto_208465 ) ) ( not ( = ?auto_208464 ?auto_208466 ) ) ( not ( = ?auto_208464 ?auto_208467 ) ) ( not ( = ?auto_208464 ?auto_208468 ) ) ( not ( = ?auto_208464 ?auto_208469 ) ) ( not ( = ?auto_208464 ?auto_208470 ) ) ( not ( = ?auto_208464 ?auto_208471 ) ) ( not ( = ?auto_208464 ?auto_208472 ) ) ( not ( = ?auto_208464 ?auto_208473 ) ) ( not ( = ?auto_208464 ?auto_208474 ) ) ( not ( = ?auto_208465 ?auto_208466 ) ) ( not ( = ?auto_208465 ?auto_208467 ) ) ( not ( = ?auto_208465 ?auto_208468 ) ) ( not ( = ?auto_208465 ?auto_208469 ) ) ( not ( = ?auto_208465 ?auto_208470 ) ) ( not ( = ?auto_208465 ?auto_208471 ) ) ( not ( = ?auto_208465 ?auto_208472 ) ) ( not ( = ?auto_208465 ?auto_208473 ) ) ( not ( = ?auto_208465 ?auto_208474 ) ) ( not ( = ?auto_208466 ?auto_208467 ) ) ( not ( = ?auto_208466 ?auto_208468 ) ) ( not ( = ?auto_208466 ?auto_208469 ) ) ( not ( = ?auto_208466 ?auto_208470 ) ) ( not ( = ?auto_208466 ?auto_208471 ) ) ( not ( = ?auto_208466 ?auto_208472 ) ) ( not ( = ?auto_208466 ?auto_208473 ) ) ( not ( = ?auto_208466 ?auto_208474 ) ) ( not ( = ?auto_208467 ?auto_208468 ) ) ( not ( = ?auto_208467 ?auto_208469 ) ) ( not ( = ?auto_208467 ?auto_208470 ) ) ( not ( = ?auto_208467 ?auto_208471 ) ) ( not ( = ?auto_208467 ?auto_208472 ) ) ( not ( = ?auto_208467 ?auto_208473 ) ) ( not ( = ?auto_208467 ?auto_208474 ) ) ( not ( = ?auto_208468 ?auto_208469 ) ) ( not ( = ?auto_208468 ?auto_208470 ) ) ( not ( = ?auto_208468 ?auto_208471 ) ) ( not ( = ?auto_208468 ?auto_208472 ) ) ( not ( = ?auto_208468 ?auto_208473 ) ) ( not ( = ?auto_208468 ?auto_208474 ) ) ( not ( = ?auto_208469 ?auto_208470 ) ) ( not ( = ?auto_208469 ?auto_208471 ) ) ( not ( = ?auto_208469 ?auto_208472 ) ) ( not ( = ?auto_208469 ?auto_208473 ) ) ( not ( = ?auto_208469 ?auto_208474 ) ) ( not ( = ?auto_208470 ?auto_208471 ) ) ( not ( = ?auto_208470 ?auto_208472 ) ) ( not ( = ?auto_208470 ?auto_208473 ) ) ( not ( = ?auto_208470 ?auto_208474 ) ) ( not ( = ?auto_208471 ?auto_208472 ) ) ( not ( = ?auto_208471 ?auto_208473 ) ) ( not ( = ?auto_208471 ?auto_208474 ) ) ( not ( = ?auto_208472 ?auto_208473 ) ) ( not ( = ?auto_208472 ?auto_208474 ) ) ( not ( = ?auto_208473 ?auto_208474 ) ) ( ON ?auto_208472 ?auto_208473 ) ( ON ?auto_208471 ?auto_208472 ) ( ON ?auto_208470 ?auto_208471 ) ( CLEAR ?auto_208468 ) ( ON ?auto_208469 ?auto_208470 ) ( CLEAR ?auto_208469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_208461 ?auto_208462 ?auto_208463 ?auto_208464 ?auto_208465 ?auto_208466 ?auto_208467 ?auto_208468 ?auto_208469 )
      ( MAKE-13PILE ?auto_208461 ?auto_208462 ?auto_208463 ?auto_208464 ?auto_208465 ?auto_208466 ?auto_208467 ?auto_208468 ?auto_208469 ?auto_208470 ?auto_208471 ?auto_208472 ?auto_208473 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208488 - BLOCK
      ?auto_208489 - BLOCK
      ?auto_208490 - BLOCK
      ?auto_208491 - BLOCK
      ?auto_208492 - BLOCK
      ?auto_208493 - BLOCK
      ?auto_208494 - BLOCK
      ?auto_208495 - BLOCK
      ?auto_208496 - BLOCK
      ?auto_208497 - BLOCK
      ?auto_208498 - BLOCK
      ?auto_208499 - BLOCK
      ?auto_208500 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208500 ) ( ON-TABLE ?auto_208488 ) ( ON ?auto_208489 ?auto_208488 ) ( ON ?auto_208490 ?auto_208489 ) ( ON ?auto_208491 ?auto_208490 ) ( ON ?auto_208492 ?auto_208491 ) ( ON ?auto_208493 ?auto_208492 ) ( ON ?auto_208494 ?auto_208493 ) ( ON ?auto_208495 ?auto_208494 ) ( not ( = ?auto_208488 ?auto_208489 ) ) ( not ( = ?auto_208488 ?auto_208490 ) ) ( not ( = ?auto_208488 ?auto_208491 ) ) ( not ( = ?auto_208488 ?auto_208492 ) ) ( not ( = ?auto_208488 ?auto_208493 ) ) ( not ( = ?auto_208488 ?auto_208494 ) ) ( not ( = ?auto_208488 ?auto_208495 ) ) ( not ( = ?auto_208488 ?auto_208496 ) ) ( not ( = ?auto_208488 ?auto_208497 ) ) ( not ( = ?auto_208488 ?auto_208498 ) ) ( not ( = ?auto_208488 ?auto_208499 ) ) ( not ( = ?auto_208488 ?auto_208500 ) ) ( not ( = ?auto_208489 ?auto_208490 ) ) ( not ( = ?auto_208489 ?auto_208491 ) ) ( not ( = ?auto_208489 ?auto_208492 ) ) ( not ( = ?auto_208489 ?auto_208493 ) ) ( not ( = ?auto_208489 ?auto_208494 ) ) ( not ( = ?auto_208489 ?auto_208495 ) ) ( not ( = ?auto_208489 ?auto_208496 ) ) ( not ( = ?auto_208489 ?auto_208497 ) ) ( not ( = ?auto_208489 ?auto_208498 ) ) ( not ( = ?auto_208489 ?auto_208499 ) ) ( not ( = ?auto_208489 ?auto_208500 ) ) ( not ( = ?auto_208490 ?auto_208491 ) ) ( not ( = ?auto_208490 ?auto_208492 ) ) ( not ( = ?auto_208490 ?auto_208493 ) ) ( not ( = ?auto_208490 ?auto_208494 ) ) ( not ( = ?auto_208490 ?auto_208495 ) ) ( not ( = ?auto_208490 ?auto_208496 ) ) ( not ( = ?auto_208490 ?auto_208497 ) ) ( not ( = ?auto_208490 ?auto_208498 ) ) ( not ( = ?auto_208490 ?auto_208499 ) ) ( not ( = ?auto_208490 ?auto_208500 ) ) ( not ( = ?auto_208491 ?auto_208492 ) ) ( not ( = ?auto_208491 ?auto_208493 ) ) ( not ( = ?auto_208491 ?auto_208494 ) ) ( not ( = ?auto_208491 ?auto_208495 ) ) ( not ( = ?auto_208491 ?auto_208496 ) ) ( not ( = ?auto_208491 ?auto_208497 ) ) ( not ( = ?auto_208491 ?auto_208498 ) ) ( not ( = ?auto_208491 ?auto_208499 ) ) ( not ( = ?auto_208491 ?auto_208500 ) ) ( not ( = ?auto_208492 ?auto_208493 ) ) ( not ( = ?auto_208492 ?auto_208494 ) ) ( not ( = ?auto_208492 ?auto_208495 ) ) ( not ( = ?auto_208492 ?auto_208496 ) ) ( not ( = ?auto_208492 ?auto_208497 ) ) ( not ( = ?auto_208492 ?auto_208498 ) ) ( not ( = ?auto_208492 ?auto_208499 ) ) ( not ( = ?auto_208492 ?auto_208500 ) ) ( not ( = ?auto_208493 ?auto_208494 ) ) ( not ( = ?auto_208493 ?auto_208495 ) ) ( not ( = ?auto_208493 ?auto_208496 ) ) ( not ( = ?auto_208493 ?auto_208497 ) ) ( not ( = ?auto_208493 ?auto_208498 ) ) ( not ( = ?auto_208493 ?auto_208499 ) ) ( not ( = ?auto_208493 ?auto_208500 ) ) ( not ( = ?auto_208494 ?auto_208495 ) ) ( not ( = ?auto_208494 ?auto_208496 ) ) ( not ( = ?auto_208494 ?auto_208497 ) ) ( not ( = ?auto_208494 ?auto_208498 ) ) ( not ( = ?auto_208494 ?auto_208499 ) ) ( not ( = ?auto_208494 ?auto_208500 ) ) ( not ( = ?auto_208495 ?auto_208496 ) ) ( not ( = ?auto_208495 ?auto_208497 ) ) ( not ( = ?auto_208495 ?auto_208498 ) ) ( not ( = ?auto_208495 ?auto_208499 ) ) ( not ( = ?auto_208495 ?auto_208500 ) ) ( not ( = ?auto_208496 ?auto_208497 ) ) ( not ( = ?auto_208496 ?auto_208498 ) ) ( not ( = ?auto_208496 ?auto_208499 ) ) ( not ( = ?auto_208496 ?auto_208500 ) ) ( not ( = ?auto_208497 ?auto_208498 ) ) ( not ( = ?auto_208497 ?auto_208499 ) ) ( not ( = ?auto_208497 ?auto_208500 ) ) ( not ( = ?auto_208498 ?auto_208499 ) ) ( not ( = ?auto_208498 ?auto_208500 ) ) ( not ( = ?auto_208499 ?auto_208500 ) ) ( ON ?auto_208499 ?auto_208500 ) ( ON ?auto_208498 ?auto_208499 ) ( ON ?auto_208497 ?auto_208498 ) ( CLEAR ?auto_208495 ) ( ON ?auto_208496 ?auto_208497 ) ( CLEAR ?auto_208496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_208488 ?auto_208489 ?auto_208490 ?auto_208491 ?auto_208492 ?auto_208493 ?auto_208494 ?auto_208495 ?auto_208496 )
      ( MAKE-13PILE ?auto_208488 ?auto_208489 ?auto_208490 ?auto_208491 ?auto_208492 ?auto_208493 ?auto_208494 ?auto_208495 ?auto_208496 ?auto_208497 ?auto_208498 ?auto_208499 ?auto_208500 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208514 - BLOCK
      ?auto_208515 - BLOCK
      ?auto_208516 - BLOCK
      ?auto_208517 - BLOCK
      ?auto_208518 - BLOCK
      ?auto_208519 - BLOCK
      ?auto_208520 - BLOCK
      ?auto_208521 - BLOCK
      ?auto_208522 - BLOCK
      ?auto_208523 - BLOCK
      ?auto_208524 - BLOCK
      ?auto_208525 - BLOCK
      ?auto_208526 - BLOCK
    )
    :vars
    (
      ?auto_208527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208526 ?auto_208527 ) ( ON-TABLE ?auto_208514 ) ( ON ?auto_208515 ?auto_208514 ) ( ON ?auto_208516 ?auto_208515 ) ( ON ?auto_208517 ?auto_208516 ) ( ON ?auto_208518 ?auto_208517 ) ( ON ?auto_208519 ?auto_208518 ) ( ON ?auto_208520 ?auto_208519 ) ( not ( = ?auto_208514 ?auto_208515 ) ) ( not ( = ?auto_208514 ?auto_208516 ) ) ( not ( = ?auto_208514 ?auto_208517 ) ) ( not ( = ?auto_208514 ?auto_208518 ) ) ( not ( = ?auto_208514 ?auto_208519 ) ) ( not ( = ?auto_208514 ?auto_208520 ) ) ( not ( = ?auto_208514 ?auto_208521 ) ) ( not ( = ?auto_208514 ?auto_208522 ) ) ( not ( = ?auto_208514 ?auto_208523 ) ) ( not ( = ?auto_208514 ?auto_208524 ) ) ( not ( = ?auto_208514 ?auto_208525 ) ) ( not ( = ?auto_208514 ?auto_208526 ) ) ( not ( = ?auto_208514 ?auto_208527 ) ) ( not ( = ?auto_208515 ?auto_208516 ) ) ( not ( = ?auto_208515 ?auto_208517 ) ) ( not ( = ?auto_208515 ?auto_208518 ) ) ( not ( = ?auto_208515 ?auto_208519 ) ) ( not ( = ?auto_208515 ?auto_208520 ) ) ( not ( = ?auto_208515 ?auto_208521 ) ) ( not ( = ?auto_208515 ?auto_208522 ) ) ( not ( = ?auto_208515 ?auto_208523 ) ) ( not ( = ?auto_208515 ?auto_208524 ) ) ( not ( = ?auto_208515 ?auto_208525 ) ) ( not ( = ?auto_208515 ?auto_208526 ) ) ( not ( = ?auto_208515 ?auto_208527 ) ) ( not ( = ?auto_208516 ?auto_208517 ) ) ( not ( = ?auto_208516 ?auto_208518 ) ) ( not ( = ?auto_208516 ?auto_208519 ) ) ( not ( = ?auto_208516 ?auto_208520 ) ) ( not ( = ?auto_208516 ?auto_208521 ) ) ( not ( = ?auto_208516 ?auto_208522 ) ) ( not ( = ?auto_208516 ?auto_208523 ) ) ( not ( = ?auto_208516 ?auto_208524 ) ) ( not ( = ?auto_208516 ?auto_208525 ) ) ( not ( = ?auto_208516 ?auto_208526 ) ) ( not ( = ?auto_208516 ?auto_208527 ) ) ( not ( = ?auto_208517 ?auto_208518 ) ) ( not ( = ?auto_208517 ?auto_208519 ) ) ( not ( = ?auto_208517 ?auto_208520 ) ) ( not ( = ?auto_208517 ?auto_208521 ) ) ( not ( = ?auto_208517 ?auto_208522 ) ) ( not ( = ?auto_208517 ?auto_208523 ) ) ( not ( = ?auto_208517 ?auto_208524 ) ) ( not ( = ?auto_208517 ?auto_208525 ) ) ( not ( = ?auto_208517 ?auto_208526 ) ) ( not ( = ?auto_208517 ?auto_208527 ) ) ( not ( = ?auto_208518 ?auto_208519 ) ) ( not ( = ?auto_208518 ?auto_208520 ) ) ( not ( = ?auto_208518 ?auto_208521 ) ) ( not ( = ?auto_208518 ?auto_208522 ) ) ( not ( = ?auto_208518 ?auto_208523 ) ) ( not ( = ?auto_208518 ?auto_208524 ) ) ( not ( = ?auto_208518 ?auto_208525 ) ) ( not ( = ?auto_208518 ?auto_208526 ) ) ( not ( = ?auto_208518 ?auto_208527 ) ) ( not ( = ?auto_208519 ?auto_208520 ) ) ( not ( = ?auto_208519 ?auto_208521 ) ) ( not ( = ?auto_208519 ?auto_208522 ) ) ( not ( = ?auto_208519 ?auto_208523 ) ) ( not ( = ?auto_208519 ?auto_208524 ) ) ( not ( = ?auto_208519 ?auto_208525 ) ) ( not ( = ?auto_208519 ?auto_208526 ) ) ( not ( = ?auto_208519 ?auto_208527 ) ) ( not ( = ?auto_208520 ?auto_208521 ) ) ( not ( = ?auto_208520 ?auto_208522 ) ) ( not ( = ?auto_208520 ?auto_208523 ) ) ( not ( = ?auto_208520 ?auto_208524 ) ) ( not ( = ?auto_208520 ?auto_208525 ) ) ( not ( = ?auto_208520 ?auto_208526 ) ) ( not ( = ?auto_208520 ?auto_208527 ) ) ( not ( = ?auto_208521 ?auto_208522 ) ) ( not ( = ?auto_208521 ?auto_208523 ) ) ( not ( = ?auto_208521 ?auto_208524 ) ) ( not ( = ?auto_208521 ?auto_208525 ) ) ( not ( = ?auto_208521 ?auto_208526 ) ) ( not ( = ?auto_208521 ?auto_208527 ) ) ( not ( = ?auto_208522 ?auto_208523 ) ) ( not ( = ?auto_208522 ?auto_208524 ) ) ( not ( = ?auto_208522 ?auto_208525 ) ) ( not ( = ?auto_208522 ?auto_208526 ) ) ( not ( = ?auto_208522 ?auto_208527 ) ) ( not ( = ?auto_208523 ?auto_208524 ) ) ( not ( = ?auto_208523 ?auto_208525 ) ) ( not ( = ?auto_208523 ?auto_208526 ) ) ( not ( = ?auto_208523 ?auto_208527 ) ) ( not ( = ?auto_208524 ?auto_208525 ) ) ( not ( = ?auto_208524 ?auto_208526 ) ) ( not ( = ?auto_208524 ?auto_208527 ) ) ( not ( = ?auto_208525 ?auto_208526 ) ) ( not ( = ?auto_208525 ?auto_208527 ) ) ( not ( = ?auto_208526 ?auto_208527 ) ) ( ON ?auto_208525 ?auto_208526 ) ( ON ?auto_208524 ?auto_208525 ) ( ON ?auto_208523 ?auto_208524 ) ( ON ?auto_208522 ?auto_208523 ) ( CLEAR ?auto_208520 ) ( ON ?auto_208521 ?auto_208522 ) ( CLEAR ?auto_208521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_208514 ?auto_208515 ?auto_208516 ?auto_208517 ?auto_208518 ?auto_208519 ?auto_208520 ?auto_208521 )
      ( MAKE-13PILE ?auto_208514 ?auto_208515 ?auto_208516 ?auto_208517 ?auto_208518 ?auto_208519 ?auto_208520 ?auto_208521 ?auto_208522 ?auto_208523 ?auto_208524 ?auto_208525 ?auto_208526 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208541 - BLOCK
      ?auto_208542 - BLOCK
      ?auto_208543 - BLOCK
      ?auto_208544 - BLOCK
      ?auto_208545 - BLOCK
      ?auto_208546 - BLOCK
      ?auto_208547 - BLOCK
      ?auto_208548 - BLOCK
      ?auto_208549 - BLOCK
      ?auto_208550 - BLOCK
      ?auto_208551 - BLOCK
      ?auto_208552 - BLOCK
      ?auto_208553 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208553 ) ( ON-TABLE ?auto_208541 ) ( ON ?auto_208542 ?auto_208541 ) ( ON ?auto_208543 ?auto_208542 ) ( ON ?auto_208544 ?auto_208543 ) ( ON ?auto_208545 ?auto_208544 ) ( ON ?auto_208546 ?auto_208545 ) ( ON ?auto_208547 ?auto_208546 ) ( not ( = ?auto_208541 ?auto_208542 ) ) ( not ( = ?auto_208541 ?auto_208543 ) ) ( not ( = ?auto_208541 ?auto_208544 ) ) ( not ( = ?auto_208541 ?auto_208545 ) ) ( not ( = ?auto_208541 ?auto_208546 ) ) ( not ( = ?auto_208541 ?auto_208547 ) ) ( not ( = ?auto_208541 ?auto_208548 ) ) ( not ( = ?auto_208541 ?auto_208549 ) ) ( not ( = ?auto_208541 ?auto_208550 ) ) ( not ( = ?auto_208541 ?auto_208551 ) ) ( not ( = ?auto_208541 ?auto_208552 ) ) ( not ( = ?auto_208541 ?auto_208553 ) ) ( not ( = ?auto_208542 ?auto_208543 ) ) ( not ( = ?auto_208542 ?auto_208544 ) ) ( not ( = ?auto_208542 ?auto_208545 ) ) ( not ( = ?auto_208542 ?auto_208546 ) ) ( not ( = ?auto_208542 ?auto_208547 ) ) ( not ( = ?auto_208542 ?auto_208548 ) ) ( not ( = ?auto_208542 ?auto_208549 ) ) ( not ( = ?auto_208542 ?auto_208550 ) ) ( not ( = ?auto_208542 ?auto_208551 ) ) ( not ( = ?auto_208542 ?auto_208552 ) ) ( not ( = ?auto_208542 ?auto_208553 ) ) ( not ( = ?auto_208543 ?auto_208544 ) ) ( not ( = ?auto_208543 ?auto_208545 ) ) ( not ( = ?auto_208543 ?auto_208546 ) ) ( not ( = ?auto_208543 ?auto_208547 ) ) ( not ( = ?auto_208543 ?auto_208548 ) ) ( not ( = ?auto_208543 ?auto_208549 ) ) ( not ( = ?auto_208543 ?auto_208550 ) ) ( not ( = ?auto_208543 ?auto_208551 ) ) ( not ( = ?auto_208543 ?auto_208552 ) ) ( not ( = ?auto_208543 ?auto_208553 ) ) ( not ( = ?auto_208544 ?auto_208545 ) ) ( not ( = ?auto_208544 ?auto_208546 ) ) ( not ( = ?auto_208544 ?auto_208547 ) ) ( not ( = ?auto_208544 ?auto_208548 ) ) ( not ( = ?auto_208544 ?auto_208549 ) ) ( not ( = ?auto_208544 ?auto_208550 ) ) ( not ( = ?auto_208544 ?auto_208551 ) ) ( not ( = ?auto_208544 ?auto_208552 ) ) ( not ( = ?auto_208544 ?auto_208553 ) ) ( not ( = ?auto_208545 ?auto_208546 ) ) ( not ( = ?auto_208545 ?auto_208547 ) ) ( not ( = ?auto_208545 ?auto_208548 ) ) ( not ( = ?auto_208545 ?auto_208549 ) ) ( not ( = ?auto_208545 ?auto_208550 ) ) ( not ( = ?auto_208545 ?auto_208551 ) ) ( not ( = ?auto_208545 ?auto_208552 ) ) ( not ( = ?auto_208545 ?auto_208553 ) ) ( not ( = ?auto_208546 ?auto_208547 ) ) ( not ( = ?auto_208546 ?auto_208548 ) ) ( not ( = ?auto_208546 ?auto_208549 ) ) ( not ( = ?auto_208546 ?auto_208550 ) ) ( not ( = ?auto_208546 ?auto_208551 ) ) ( not ( = ?auto_208546 ?auto_208552 ) ) ( not ( = ?auto_208546 ?auto_208553 ) ) ( not ( = ?auto_208547 ?auto_208548 ) ) ( not ( = ?auto_208547 ?auto_208549 ) ) ( not ( = ?auto_208547 ?auto_208550 ) ) ( not ( = ?auto_208547 ?auto_208551 ) ) ( not ( = ?auto_208547 ?auto_208552 ) ) ( not ( = ?auto_208547 ?auto_208553 ) ) ( not ( = ?auto_208548 ?auto_208549 ) ) ( not ( = ?auto_208548 ?auto_208550 ) ) ( not ( = ?auto_208548 ?auto_208551 ) ) ( not ( = ?auto_208548 ?auto_208552 ) ) ( not ( = ?auto_208548 ?auto_208553 ) ) ( not ( = ?auto_208549 ?auto_208550 ) ) ( not ( = ?auto_208549 ?auto_208551 ) ) ( not ( = ?auto_208549 ?auto_208552 ) ) ( not ( = ?auto_208549 ?auto_208553 ) ) ( not ( = ?auto_208550 ?auto_208551 ) ) ( not ( = ?auto_208550 ?auto_208552 ) ) ( not ( = ?auto_208550 ?auto_208553 ) ) ( not ( = ?auto_208551 ?auto_208552 ) ) ( not ( = ?auto_208551 ?auto_208553 ) ) ( not ( = ?auto_208552 ?auto_208553 ) ) ( ON ?auto_208552 ?auto_208553 ) ( ON ?auto_208551 ?auto_208552 ) ( ON ?auto_208550 ?auto_208551 ) ( ON ?auto_208549 ?auto_208550 ) ( CLEAR ?auto_208547 ) ( ON ?auto_208548 ?auto_208549 ) ( CLEAR ?auto_208548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_208541 ?auto_208542 ?auto_208543 ?auto_208544 ?auto_208545 ?auto_208546 ?auto_208547 ?auto_208548 )
      ( MAKE-13PILE ?auto_208541 ?auto_208542 ?auto_208543 ?auto_208544 ?auto_208545 ?auto_208546 ?auto_208547 ?auto_208548 ?auto_208549 ?auto_208550 ?auto_208551 ?auto_208552 ?auto_208553 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208567 - BLOCK
      ?auto_208568 - BLOCK
      ?auto_208569 - BLOCK
      ?auto_208570 - BLOCK
      ?auto_208571 - BLOCK
      ?auto_208572 - BLOCK
      ?auto_208573 - BLOCK
      ?auto_208574 - BLOCK
      ?auto_208575 - BLOCK
      ?auto_208576 - BLOCK
      ?auto_208577 - BLOCK
      ?auto_208578 - BLOCK
      ?auto_208579 - BLOCK
    )
    :vars
    (
      ?auto_208580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208579 ?auto_208580 ) ( ON-TABLE ?auto_208567 ) ( ON ?auto_208568 ?auto_208567 ) ( ON ?auto_208569 ?auto_208568 ) ( ON ?auto_208570 ?auto_208569 ) ( ON ?auto_208571 ?auto_208570 ) ( ON ?auto_208572 ?auto_208571 ) ( not ( = ?auto_208567 ?auto_208568 ) ) ( not ( = ?auto_208567 ?auto_208569 ) ) ( not ( = ?auto_208567 ?auto_208570 ) ) ( not ( = ?auto_208567 ?auto_208571 ) ) ( not ( = ?auto_208567 ?auto_208572 ) ) ( not ( = ?auto_208567 ?auto_208573 ) ) ( not ( = ?auto_208567 ?auto_208574 ) ) ( not ( = ?auto_208567 ?auto_208575 ) ) ( not ( = ?auto_208567 ?auto_208576 ) ) ( not ( = ?auto_208567 ?auto_208577 ) ) ( not ( = ?auto_208567 ?auto_208578 ) ) ( not ( = ?auto_208567 ?auto_208579 ) ) ( not ( = ?auto_208567 ?auto_208580 ) ) ( not ( = ?auto_208568 ?auto_208569 ) ) ( not ( = ?auto_208568 ?auto_208570 ) ) ( not ( = ?auto_208568 ?auto_208571 ) ) ( not ( = ?auto_208568 ?auto_208572 ) ) ( not ( = ?auto_208568 ?auto_208573 ) ) ( not ( = ?auto_208568 ?auto_208574 ) ) ( not ( = ?auto_208568 ?auto_208575 ) ) ( not ( = ?auto_208568 ?auto_208576 ) ) ( not ( = ?auto_208568 ?auto_208577 ) ) ( not ( = ?auto_208568 ?auto_208578 ) ) ( not ( = ?auto_208568 ?auto_208579 ) ) ( not ( = ?auto_208568 ?auto_208580 ) ) ( not ( = ?auto_208569 ?auto_208570 ) ) ( not ( = ?auto_208569 ?auto_208571 ) ) ( not ( = ?auto_208569 ?auto_208572 ) ) ( not ( = ?auto_208569 ?auto_208573 ) ) ( not ( = ?auto_208569 ?auto_208574 ) ) ( not ( = ?auto_208569 ?auto_208575 ) ) ( not ( = ?auto_208569 ?auto_208576 ) ) ( not ( = ?auto_208569 ?auto_208577 ) ) ( not ( = ?auto_208569 ?auto_208578 ) ) ( not ( = ?auto_208569 ?auto_208579 ) ) ( not ( = ?auto_208569 ?auto_208580 ) ) ( not ( = ?auto_208570 ?auto_208571 ) ) ( not ( = ?auto_208570 ?auto_208572 ) ) ( not ( = ?auto_208570 ?auto_208573 ) ) ( not ( = ?auto_208570 ?auto_208574 ) ) ( not ( = ?auto_208570 ?auto_208575 ) ) ( not ( = ?auto_208570 ?auto_208576 ) ) ( not ( = ?auto_208570 ?auto_208577 ) ) ( not ( = ?auto_208570 ?auto_208578 ) ) ( not ( = ?auto_208570 ?auto_208579 ) ) ( not ( = ?auto_208570 ?auto_208580 ) ) ( not ( = ?auto_208571 ?auto_208572 ) ) ( not ( = ?auto_208571 ?auto_208573 ) ) ( not ( = ?auto_208571 ?auto_208574 ) ) ( not ( = ?auto_208571 ?auto_208575 ) ) ( not ( = ?auto_208571 ?auto_208576 ) ) ( not ( = ?auto_208571 ?auto_208577 ) ) ( not ( = ?auto_208571 ?auto_208578 ) ) ( not ( = ?auto_208571 ?auto_208579 ) ) ( not ( = ?auto_208571 ?auto_208580 ) ) ( not ( = ?auto_208572 ?auto_208573 ) ) ( not ( = ?auto_208572 ?auto_208574 ) ) ( not ( = ?auto_208572 ?auto_208575 ) ) ( not ( = ?auto_208572 ?auto_208576 ) ) ( not ( = ?auto_208572 ?auto_208577 ) ) ( not ( = ?auto_208572 ?auto_208578 ) ) ( not ( = ?auto_208572 ?auto_208579 ) ) ( not ( = ?auto_208572 ?auto_208580 ) ) ( not ( = ?auto_208573 ?auto_208574 ) ) ( not ( = ?auto_208573 ?auto_208575 ) ) ( not ( = ?auto_208573 ?auto_208576 ) ) ( not ( = ?auto_208573 ?auto_208577 ) ) ( not ( = ?auto_208573 ?auto_208578 ) ) ( not ( = ?auto_208573 ?auto_208579 ) ) ( not ( = ?auto_208573 ?auto_208580 ) ) ( not ( = ?auto_208574 ?auto_208575 ) ) ( not ( = ?auto_208574 ?auto_208576 ) ) ( not ( = ?auto_208574 ?auto_208577 ) ) ( not ( = ?auto_208574 ?auto_208578 ) ) ( not ( = ?auto_208574 ?auto_208579 ) ) ( not ( = ?auto_208574 ?auto_208580 ) ) ( not ( = ?auto_208575 ?auto_208576 ) ) ( not ( = ?auto_208575 ?auto_208577 ) ) ( not ( = ?auto_208575 ?auto_208578 ) ) ( not ( = ?auto_208575 ?auto_208579 ) ) ( not ( = ?auto_208575 ?auto_208580 ) ) ( not ( = ?auto_208576 ?auto_208577 ) ) ( not ( = ?auto_208576 ?auto_208578 ) ) ( not ( = ?auto_208576 ?auto_208579 ) ) ( not ( = ?auto_208576 ?auto_208580 ) ) ( not ( = ?auto_208577 ?auto_208578 ) ) ( not ( = ?auto_208577 ?auto_208579 ) ) ( not ( = ?auto_208577 ?auto_208580 ) ) ( not ( = ?auto_208578 ?auto_208579 ) ) ( not ( = ?auto_208578 ?auto_208580 ) ) ( not ( = ?auto_208579 ?auto_208580 ) ) ( ON ?auto_208578 ?auto_208579 ) ( ON ?auto_208577 ?auto_208578 ) ( ON ?auto_208576 ?auto_208577 ) ( ON ?auto_208575 ?auto_208576 ) ( ON ?auto_208574 ?auto_208575 ) ( CLEAR ?auto_208572 ) ( ON ?auto_208573 ?auto_208574 ) ( CLEAR ?auto_208573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_208567 ?auto_208568 ?auto_208569 ?auto_208570 ?auto_208571 ?auto_208572 ?auto_208573 )
      ( MAKE-13PILE ?auto_208567 ?auto_208568 ?auto_208569 ?auto_208570 ?auto_208571 ?auto_208572 ?auto_208573 ?auto_208574 ?auto_208575 ?auto_208576 ?auto_208577 ?auto_208578 ?auto_208579 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208594 - BLOCK
      ?auto_208595 - BLOCK
      ?auto_208596 - BLOCK
      ?auto_208597 - BLOCK
      ?auto_208598 - BLOCK
      ?auto_208599 - BLOCK
      ?auto_208600 - BLOCK
      ?auto_208601 - BLOCK
      ?auto_208602 - BLOCK
      ?auto_208603 - BLOCK
      ?auto_208604 - BLOCK
      ?auto_208605 - BLOCK
      ?auto_208606 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208606 ) ( ON-TABLE ?auto_208594 ) ( ON ?auto_208595 ?auto_208594 ) ( ON ?auto_208596 ?auto_208595 ) ( ON ?auto_208597 ?auto_208596 ) ( ON ?auto_208598 ?auto_208597 ) ( ON ?auto_208599 ?auto_208598 ) ( not ( = ?auto_208594 ?auto_208595 ) ) ( not ( = ?auto_208594 ?auto_208596 ) ) ( not ( = ?auto_208594 ?auto_208597 ) ) ( not ( = ?auto_208594 ?auto_208598 ) ) ( not ( = ?auto_208594 ?auto_208599 ) ) ( not ( = ?auto_208594 ?auto_208600 ) ) ( not ( = ?auto_208594 ?auto_208601 ) ) ( not ( = ?auto_208594 ?auto_208602 ) ) ( not ( = ?auto_208594 ?auto_208603 ) ) ( not ( = ?auto_208594 ?auto_208604 ) ) ( not ( = ?auto_208594 ?auto_208605 ) ) ( not ( = ?auto_208594 ?auto_208606 ) ) ( not ( = ?auto_208595 ?auto_208596 ) ) ( not ( = ?auto_208595 ?auto_208597 ) ) ( not ( = ?auto_208595 ?auto_208598 ) ) ( not ( = ?auto_208595 ?auto_208599 ) ) ( not ( = ?auto_208595 ?auto_208600 ) ) ( not ( = ?auto_208595 ?auto_208601 ) ) ( not ( = ?auto_208595 ?auto_208602 ) ) ( not ( = ?auto_208595 ?auto_208603 ) ) ( not ( = ?auto_208595 ?auto_208604 ) ) ( not ( = ?auto_208595 ?auto_208605 ) ) ( not ( = ?auto_208595 ?auto_208606 ) ) ( not ( = ?auto_208596 ?auto_208597 ) ) ( not ( = ?auto_208596 ?auto_208598 ) ) ( not ( = ?auto_208596 ?auto_208599 ) ) ( not ( = ?auto_208596 ?auto_208600 ) ) ( not ( = ?auto_208596 ?auto_208601 ) ) ( not ( = ?auto_208596 ?auto_208602 ) ) ( not ( = ?auto_208596 ?auto_208603 ) ) ( not ( = ?auto_208596 ?auto_208604 ) ) ( not ( = ?auto_208596 ?auto_208605 ) ) ( not ( = ?auto_208596 ?auto_208606 ) ) ( not ( = ?auto_208597 ?auto_208598 ) ) ( not ( = ?auto_208597 ?auto_208599 ) ) ( not ( = ?auto_208597 ?auto_208600 ) ) ( not ( = ?auto_208597 ?auto_208601 ) ) ( not ( = ?auto_208597 ?auto_208602 ) ) ( not ( = ?auto_208597 ?auto_208603 ) ) ( not ( = ?auto_208597 ?auto_208604 ) ) ( not ( = ?auto_208597 ?auto_208605 ) ) ( not ( = ?auto_208597 ?auto_208606 ) ) ( not ( = ?auto_208598 ?auto_208599 ) ) ( not ( = ?auto_208598 ?auto_208600 ) ) ( not ( = ?auto_208598 ?auto_208601 ) ) ( not ( = ?auto_208598 ?auto_208602 ) ) ( not ( = ?auto_208598 ?auto_208603 ) ) ( not ( = ?auto_208598 ?auto_208604 ) ) ( not ( = ?auto_208598 ?auto_208605 ) ) ( not ( = ?auto_208598 ?auto_208606 ) ) ( not ( = ?auto_208599 ?auto_208600 ) ) ( not ( = ?auto_208599 ?auto_208601 ) ) ( not ( = ?auto_208599 ?auto_208602 ) ) ( not ( = ?auto_208599 ?auto_208603 ) ) ( not ( = ?auto_208599 ?auto_208604 ) ) ( not ( = ?auto_208599 ?auto_208605 ) ) ( not ( = ?auto_208599 ?auto_208606 ) ) ( not ( = ?auto_208600 ?auto_208601 ) ) ( not ( = ?auto_208600 ?auto_208602 ) ) ( not ( = ?auto_208600 ?auto_208603 ) ) ( not ( = ?auto_208600 ?auto_208604 ) ) ( not ( = ?auto_208600 ?auto_208605 ) ) ( not ( = ?auto_208600 ?auto_208606 ) ) ( not ( = ?auto_208601 ?auto_208602 ) ) ( not ( = ?auto_208601 ?auto_208603 ) ) ( not ( = ?auto_208601 ?auto_208604 ) ) ( not ( = ?auto_208601 ?auto_208605 ) ) ( not ( = ?auto_208601 ?auto_208606 ) ) ( not ( = ?auto_208602 ?auto_208603 ) ) ( not ( = ?auto_208602 ?auto_208604 ) ) ( not ( = ?auto_208602 ?auto_208605 ) ) ( not ( = ?auto_208602 ?auto_208606 ) ) ( not ( = ?auto_208603 ?auto_208604 ) ) ( not ( = ?auto_208603 ?auto_208605 ) ) ( not ( = ?auto_208603 ?auto_208606 ) ) ( not ( = ?auto_208604 ?auto_208605 ) ) ( not ( = ?auto_208604 ?auto_208606 ) ) ( not ( = ?auto_208605 ?auto_208606 ) ) ( ON ?auto_208605 ?auto_208606 ) ( ON ?auto_208604 ?auto_208605 ) ( ON ?auto_208603 ?auto_208604 ) ( ON ?auto_208602 ?auto_208603 ) ( ON ?auto_208601 ?auto_208602 ) ( CLEAR ?auto_208599 ) ( ON ?auto_208600 ?auto_208601 ) ( CLEAR ?auto_208600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_208594 ?auto_208595 ?auto_208596 ?auto_208597 ?auto_208598 ?auto_208599 ?auto_208600 )
      ( MAKE-13PILE ?auto_208594 ?auto_208595 ?auto_208596 ?auto_208597 ?auto_208598 ?auto_208599 ?auto_208600 ?auto_208601 ?auto_208602 ?auto_208603 ?auto_208604 ?auto_208605 ?auto_208606 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208620 - BLOCK
      ?auto_208621 - BLOCK
      ?auto_208622 - BLOCK
      ?auto_208623 - BLOCK
      ?auto_208624 - BLOCK
      ?auto_208625 - BLOCK
      ?auto_208626 - BLOCK
      ?auto_208627 - BLOCK
      ?auto_208628 - BLOCK
      ?auto_208629 - BLOCK
      ?auto_208630 - BLOCK
      ?auto_208631 - BLOCK
      ?auto_208632 - BLOCK
    )
    :vars
    (
      ?auto_208633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208632 ?auto_208633 ) ( ON-TABLE ?auto_208620 ) ( ON ?auto_208621 ?auto_208620 ) ( ON ?auto_208622 ?auto_208621 ) ( ON ?auto_208623 ?auto_208622 ) ( ON ?auto_208624 ?auto_208623 ) ( not ( = ?auto_208620 ?auto_208621 ) ) ( not ( = ?auto_208620 ?auto_208622 ) ) ( not ( = ?auto_208620 ?auto_208623 ) ) ( not ( = ?auto_208620 ?auto_208624 ) ) ( not ( = ?auto_208620 ?auto_208625 ) ) ( not ( = ?auto_208620 ?auto_208626 ) ) ( not ( = ?auto_208620 ?auto_208627 ) ) ( not ( = ?auto_208620 ?auto_208628 ) ) ( not ( = ?auto_208620 ?auto_208629 ) ) ( not ( = ?auto_208620 ?auto_208630 ) ) ( not ( = ?auto_208620 ?auto_208631 ) ) ( not ( = ?auto_208620 ?auto_208632 ) ) ( not ( = ?auto_208620 ?auto_208633 ) ) ( not ( = ?auto_208621 ?auto_208622 ) ) ( not ( = ?auto_208621 ?auto_208623 ) ) ( not ( = ?auto_208621 ?auto_208624 ) ) ( not ( = ?auto_208621 ?auto_208625 ) ) ( not ( = ?auto_208621 ?auto_208626 ) ) ( not ( = ?auto_208621 ?auto_208627 ) ) ( not ( = ?auto_208621 ?auto_208628 ) ) ( not ( = ?auto_208621 ?auto_208629 ) ) ( not ( = ?auto_208621 ?auto_208630 ) ) ( not ( = ?auto_208621 ?auto_208631 ) ) ( not ( = ?auto_208621 ?auto_208632 ) ) ( not ( = ?auto_208621 ?auto_208633 ) ) ( not ( = ?auto_208622 ?auto_208623 ) ) ( not ( = ?auto_208622 ?auto_208624 ) ) ( not ( = ?auto_208622 ?auto_208625 ) ) ( not ( = ?auto_208622 ?auto_208626 ) ) ( not ( = ?auto_208622 ?auto_208627 ) ) ( not ( = ?auto_208622 ?auto_208628 ) ) ( not ( = ?auto_208622 ?auto_208629 ) ) ( not ( = ?auto_208622 ?auto_208630 ) ) ( not ( = ?auto_208622 ?auto_208631 ) ) ( not ( = ?auto_208622 ?auto_208632 ) ) ( not ( = ?auto_208622 ?auto_208633 ) ) ( not ( = ?auto_208623 ?auto_208624 ) ) ( not ( = ?auto_208623 ?auto_208625 ) ) ( not ( = ?auto_208623 ?auto_208626 ) ) ( not ( = ?auto_208623 ?auto_208627 ) ) ( not ( = ?auto_208623 ?auto_208628 ) ) ( not ( = ?auto_208623 ?auto_208629 ) ) ( not ( = ?auto_208623 ?auto_208630 ) ) ( not ( = ?auto_208623 ?auto_208631 ) ) ( not ( = ?auto_208623 ?auto_208632 ) ) ( not ( = ?auto_208623 ?auto_208633 ) ) ( not ( = ?auto_208624 ?auto_208625 ) ) ( not ( = ?auto_208624 ?auto_208626 ) ) ( not ( = ?auto_208624 ?auto_208627 ) ) ( not ( = ?auto_208624 ?auto_208628 ) ) ( not ( = ?auto_208624 ?auto_208629 ) ) ( not ( = ?auto_208624 ?auto_208630 ) ) ( not ( = ?auto_208624 ?auto_208631 ) ) ( not ( = ?auto_208624 ?auto_208632 ) ) ( not ( = ?auto_208624 ?auto_208633 ) ) ( not ( = ?auto_208625 ?auto_208626 ) ) ( not ( = ?auto_208625 ?auto_208627 ) ) ( not ( = ?auto_208625 ?auto_208628 ) ) ( not ( = ?auto_208625 ?auto_208629 ) ) ( not ( = ?auto_208625 ?auto_208630 ) ) ( not ( = ?auto_208625 ?auto_208631 ) ) ( not ( = ?auto_208625 ?auto_208632 ) ) ( not ( = ?auto_208625 ?auto_208633 ) ) ( not ( = ?auto_208626 ?auto_208627 ) ) ( not ( = ?auto_208626 ?auto_208628 ) ) ( not ( = ?auto_208626 ?auto_208629 ) ) ( not ( = ?auto_208626 ?auto_208630 ) ) ( not ( = ?auto_208626 ?auto_208631 ) ) ( not ( = ?auto_208626 ?auto_208632 ) ) ( not ( = ?auto_208626 ?auto_208633 ) ) ( not ( = ?auto_208627 ?auto_208628 ) ) ( not ( = ?auto_208627 ?auto_208629 ) ) ( not ( = ?auto_208627 ?auto_208630 ) ) ( not ( = ?auto_208627 ?auto_208631 ) ) ( not ( = ?auto_208627 ?auto_208632 ) ) ( not ( = ?auto_208627 ?auto_208633 ) ) ( not ( = ?auto_208628 ?auto_208629 ) ) ( not ( = ?auto_208628 ?auto_208630 ) ) ( not ( = ?auto_208628 ?auto_208631 ) ) ( not ( = ?auto_208628 ?auto_208632 ) ) ( not ( = ?auto_208628 ?auto_208633 ) ) ( not ( = ?auto_208629 ?auto_208630 ) ) ( not ( = ?auto_208629 ?auto_208631 ) ) ( not ( = ?auto_208629 ?auto_208632 ) ) ( not ( = ?auto_208629 ?auto_208633 ) ) ( not ( = ?auto_208630 ?auto_208631 ) ) ( not ( = ?auto_208630 ?auto_208632 ) ) ( not ( = ?auto_208630 ?auto_208633 ) ) ( not ( = ?auto_208631 ?auto_208632 ) ) ( not ( = ?auto_208631 ?auto_208633 ) ) ( not ( = ?auto_208632 ?auto_208633 ) ) ( ON ?auto_208631 ?auto_208632 ) ( ON ?auto_208630 ?auto_208631 ) ( ON ?auto_208629 ?auto_208630 ) ( ON ?auto_208628 ?auto_208629 ) ( ON ?auto_208627 ?auto_208628 ) ( ON ?auto_208626 ?auto_208627 ) ( CLEAR ?auto_208624 ) ( ON ?auto_208625 ?auto_208626 ) ( CLEAR ?auto_208625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_208620 ?auto_208621 ?auto_208622 ?auto_208623 ?auto_208624 ?auto_208625 )
      ( MAKE-13PILE ?auto_208620 ?auto_208621 ?auto_208622 ?auto_208623 ?auto_208624 ?auto_208625 ?auto_208626 ?auto_208627 ?auto_208628 ?auto_208629 ?auto_208630 ?auto_208631 ?auto_208632 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208647 - BLOCK
      ?auto_208648 - BLOCK
      ?auto_208649 - BLOCK
      ?auto_208650 - BLOCK
      ?auto_208651 - BLOCK
      ?auto_208652 - BLOCK
      ?auto_208653 - BLOCK
      ?auto_208654 - BLOCK
      ?auto_208655 - BLOCK
      ?auto_208656 - BLOCK
      ?auto_208657 - BLOCK
      ?auto_208658 - BLOCK
      ?auto_208659 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208659 ) ( ON-TABLE ?auto_208647 ) ( ON ?auto_208648 ?auto_208647 ) ( ON ?auto_208649 ?auto_208648 ) ( ON ?auto_208650 ?auto_208649 ) ( ON ?auto_208651 ?auto_208650 ) ( not ( = ?auto_208647 ?auto_208648 ) ) ( not ( = ?auto_208647 ?auto_208649 ) ) ( not ( = ?auto_208647 ?auto_208650 ) ) ( not ( = ?auto_208647 ?auto_208651 ) ) ( not ( = ?auto_208647 ?auto_208652 ) ) ( not ( = ?auto_208647 ?auto_208653 ) ) ( not ( = ?auto_208647 ?auto_208654 ) ) ( not ( = ?auto_208647 ?auto_208655 ) ) ( not ( = ?auto_208647 ?auto_208656 ) ) ( not ( = ?auto_208647 ?auto_208657 ) ) ( not ( = ?auto_208647 ?auto_208658 ) ) ( not ( = ?auto_208647 ?auto_208659 ) ) ( not ( = ?auto_208648 ?auto_208649 ) ) ( not ( = ?auto_208648 ?auto_208650 ) ) ( not ( = ?auto_208648 ?auto_208651 ) ) ( not ( = ?auto_208648 ?auto_208652 ) ) ( not ( = ?auto_208648 ?auto_208653 ) ) ( not ( = ?auto_208648 ?auto_208654 ) ) ( not ( = ?auto_208648 ?auto_208655 ) ) ( not ( = ?auto_208648 ?auto_208656 ) ) ( not ( = ?auto_208648 ?auto_208657 ) ) ( not ( = ?auto_208648 ?auto_208658 ) ) ( not ( = ?auto_208648 ?auto_208659 ) ) ( not ( = ?auto_208649 ?auto_208650 ) ) ( not ( = ?auto_208649 ?auto_208651 ) ) ( not ( = ?auto_208649 ?auto_208652 ) ) ( not ( = ?auto_208649 ?auto_208653 ) ) ( not ( = ?auto_208649 ?auto_208654 ) ) ( not ( = ?auto_208649 ?auto_208655 ) ) ( not ( = ?auto_208649 ?auto_208656 ) ) ( not ( = ?auto_208649 ?auto_208657 ) ) ( not ( = ?auto_208649 ?auto_208658 ) ) ( not ( = ?auto_208649 ?auto_208659 ) ) ( not ( = ?auto_208650 ?auto_208651 ) ) ( not ( = ?auto_208650 ?auto_208652 ) ) ( not ( = ?auto_208650 ?auto_208653 ) ) ( not ( = ?auto_208650 ?auto_208654 ) ) ( not ( = ?auto_208650 ?auto_208655 ) ) ( not ( = ?auto_208650 ?auto_208656 ) ) ( not ( = ?auto_208650 ?auto_208657 ) ) ( not ( = ?auto_208650 ?auto_208658 ) ) ( not ( = ?auto_208650 ?auto_208659 ) ) ( not ( = ?auto_208651 ?auto_208652 ) ) ( not ( = ?auto_208651 ?auto_208653 ) ) ( not ( = ?auto_208651 ?auto_208654 ) ) ( not ( = ?auto_208651 ?auto_208655 ) ) ( not ( = ?auto_208651 ?auto_208656 ) ) ( not ( = ?auto_208651 ?auto_208657 ) ) ( not ( = ?auto_208651 ?auto_208658 ) ) ( not ( = ?auto_208651 ?auto_208659 ) ) ( not ( = ?auto_208652 ?auto_208653 ) ) ( not ( = ?auto_208652 ?auto_208654 ) ) ( not ( = ?auto_208652 ?auto_208655 ) ) ( not ( = ?auto_208652 ?auto_208656 ) ) ( not ( = ?auto_208652 ?auto_208657 ) ) ( not ( = ?auto_208652 ?auto_208658 ) ) ( not ( = ?auto_208652 ?auto_208659 ) ) ( not ( = ?auto_208653 ?auto_208654 ) ) ( not ( = ?auto_208653 ?auto_208655 ) ) ( not ( = ?auto_208653 ?auto_208656 ) ) ( not ( = ?auto_208653 ?auto_208657 ) ) ( not ( = ?auto_208653 ?auto_208658 ) ) ( not ( = ?auto_208653 ?auto_208659 ) ) ( not ( = ?auto_208654 ?auto_208655 ) ) ( not ( = ?auto_208654 ?auto_208656 ) ) ( not ( = ?auto_208654 ?auto_208657 ) ) ( not ( = ?auto_208654 ?auto_208658 ) ) ( not ( = ?auto_208654 ?auto_208659 ) ) ( not ( = ?auto_208655 ?auto_208656 ) ) ( not ( = ?auto_208655 ?auto_208657 ) ) ( not ( = ?auto_208655 ?auto_208658 ) ) ( not ( = ?auto_208655 ?auto_208659 ) ) ( not ( = ?auto_208656 ?auto_208657 ) ) ( not ( = ?auto_208656 ?auto_208658 ) ) ( not ( = ?auto_208656 ?auto_208659 ) ) ( not ( = ?auto_208657 ?auto_208658 ) ) ( not ( = ?auto_208657 ?auto_208659 ) ) ( not ( = ?auto_208658 ?auto_208659 ) ) ( ON ?auto_208658 ?auto_208659 ) ( ON ?auto_208657 ?auto_208658 ) ( ON ?auto_208656 ?auto_208657 ) ( ON ?auto_208655 ?auto_208656 ) ( ON ?auto_208654 ?auto_208655 ) ( ON ?auto_208653 ?auto_208654 ) ( CLEAR ?auto_208651 ) ( ON ?auto_208652 ?auto_208653 ) ( CLEAR ?auto_208652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_208647 ?auto_208648 ?auto_208649 ?auto_208650 ?auto_208651 ?auto_208652 )
      ( MAKE-13PILE ?auto_208647 ?auto_208648 ?auto_208649 ?auto_208650 ?auto_208651 ?auto_208652 ?auto_208653 ?auto_208654 ?auto_208655 ?auto_208656 ?auto_208657 ?auto_208658 ?auto_208659 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208673 - BLOCK
      ?auto_208674 - BLOCK
      ?auto_208675 - BLOCK
      ?auto_208676 - BLOCK
      ?auto_208677 - BLOCK
      ?auto_208678 - BLOCK
      ?auto_208679 - BLOCK
      ?auto_208680 - BLOCK
      ?auto_208681 - BLOCK
      ?auto_208682 - BLOCK
      ?auto_208683 - BLOCK
      ?auto_208684 - BLOCK
      ?auto_208685 - BLOCK
    )
    :vars
    (
      ?auto_208686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208685 ?auto_208686 ) ( ON-TABLE ?auto_208673 ) ( ON ?auto_208674 ?auto_208673 ) ( ON ?auto_208675 ?auto_208674 ) ( ON ?auto_208676 ?auto_208675 ) ( not ( = ?auto_208673 ?auto_208674 ) ) ( not ( = ?auto_208673 ?auto_208675 ) ) ( not ( = ?auto_208673 ?auto_208676 ) ) ( not ( = ?auto_208673 ?auto_208677 ) ) ( not ( = ?auto_208673 ?auto_208678 ) ) ( not ( = ?auto_208673 ?auto_208679 ) ) ( not ( = ?auto_208673 ?auto_208680 ) ) ( not ( = ?auto_208673 ?auto_208681 ) ) ( not ( = ?auto_208673 ?auto_208682 ) ) ( not ( = ?auto_208673 ?auto_208683 ) ) ( not ( = ?auto_208673 ?auto_208684 ) ) ( not ( = ?auto_208673 ?auto_208685 ) ) ( not ( = ?auto_208673 ?auto_208686 ) ) ( not ( = ?auto_208674 ?auto_208675 ) ) ( not ( = ?auto_208674 ?auto_208676 ) ) ( not ( = ?auto_208674 ?auto_208677 ) ) ( not ( = ?auto_208674 ?auto_208678 ) ) ( not ( = ?auto_208674 ?auto_208679 ) ) ( not ( = ?auto_208674 ?auto_208680 ) ) ( not ( = ?auto_208674 ?auto_208681 ) ) ( not ( = ?auto_208674 ?auto_208682 ) ) ( not ( = ?auto_208674 ?auto_208683 ) ) ( not ( = ?auto_208674 ?auto_208684 ) ) ( not ( = ?auto_208674 ?auto_208685 ) ) ( not ( = ?auto_208674 ?auto_208686 ) ) ( not ( = ?auto_208675 ?auto_208676 ) ) ( not ( = ?auto_208675 ?auto_208677 ) ) ( not ( = ?auto_208675 ?auto_208678 ) ) ( not ( = ?auto_208675 ?auto_208679 ) ) ( not ( = ?auto_208675 ?auto_208680 ) ) ( not ( = ?auto_208675 ?auto_208681 ) ) ( not ( = ?auto_208675 ?auto_208682 ) ) ( not ( = ?auto_208675 ?auto_208683 ) ) ( not ( = ?auto_208675 ?auto_208684 ) ) ( not ( = ?auto_208675 ?auto_208685 ) ) ( not ( = ?auto_208675 ?auto_208686 ) ) ( not ( = ?auto_208676 ?auto_208677 ) ) ( not ( = ?auto_208676 ?auto_208678 ) ) ( not ( = ?auto_208676 ?auto_208679 ) ) ( not ( = ?auto_208676 ?auto_208680 ) ) ( not ( = ?auto_208676 ?auto_208681 ) ) ( not ( = ?auto_208676 ?auto_208682 ) ) ( not ( = ?auto_208676 ?auto_208683 ) ) ( not ( = ?auto_208676 ?auto_208684 ) ) ( not ( = ?auto_208676 ?auto_208685 ) ) ( not ( = ?auto_208676 ?auto_208686 ) ) ( not ( = ?auto_208677 ?auto_208678 ) ) ( not ( = ?auto_208677 ?auto_208679 ) ) ( not ( = ?auto_208677 ?auto_208680 ) ) ( not ( = ?auto_208677 ?auto_208681 ) ) ( not ( = ?auto_208677 ?auto_208682 ) ) ( not ( = ?auto_208677 ?auto_208683 ) ) ( not ( = ?auto_208677 ?auto_208684 ) ) ( not ( = ?auto_208677 ?auto_208685 ) ) ( not ( = ?auto_208677 ?auto_208686 ) ) ( not ( = ?auto_208678 ?auto_208679 ) ) ( not ( = ?auto_208678 ?auto_208680 ) ) ( not ( = ?auto_208678 ?auto_208681 ) ) ( not ( = ?auto_208678 ?auto_208682 ) ) ( not ( = ?auto_208678 ?auto_208683 ) ) ( not ( = ?auto_208678 ?auto_208684 ) ) ( not ( = ?auto_208678 ?auto_208685 ) ) ( not ( = ?auto_208678 ?auto_208686 ) ) ( not ( = ?auto_208679 ?auto_208680 ) ) ( not ( = ?auto_208679 ?auto_208681 ) ) ( not ( = ?auto_208679 ?auto_208682 ) ) ( not ( = ?auto_208679 ?auto_208683 ) ) ( not ( = ?auto_208679 ?auto_208684 ) ) ( not ( = ?auto_208679 ?auto_208685 ) ) ( not ( = ?auto_208679 ?auto_208686 ) ) ( not ( = ?auto_208680 ?auto_208681 ) ) ( not ( = ?auto_208680 ?auto_208682 ) ) ( not ( = ?auto_208680 ?auto_208683 ) ) ( not ( = ?auto_208680 ?auto_208684 ) ) ( not ( = ?auto_208680 ?auto_208685 ) ) ( not ( = ?auto_208680 ?auto_208686 ) ) ( not ( = ?auto_208681 ?auto_208682 ) ) ( not ( = ?auto_208681 ?auto_208683 ) ) ( not ( = ?auto_208681 ?auto_208684 ) ) ( not ( = ?auto_208681 ?auto_208685 ) ) ( not ( = ?auto_208681 ?auto_208686 ) ) ( not ( = ?auto_208682 ?auto_208683 ) ) ( not ( = ?auto_208682 ?auto_208684 ) ) ( not ( = ?auto_208682 ?auto_208685 ) ) ( not ( = ?auto_208682 ?auto_208686 ) ) ( not ( = ?auto_208683 ?auto_208684 ) ) ( not ( = ?auto_208683 ?auto_208685 ) ) ( not ( = ?auto_208683 ?auto_208686 ) ) ( not ( = ?auto_208684 ?auto_208685 ) ) ( not ( = ?auto_208684 ?auto_208686 ) ) ( not ( = ?auto_208685 ?auto_208686 ) ) ( ON ?auto_208684 ?auto_208685 ) ( ON ?auto_208683 ?auto_208684 ) ( ON ?auto_208682 ?auto_208683 ) ( ON ?auto_208681 ?auto_208682 ) ( ON ?auto_208680 ?auto_208681 ) ( ON ?auto_208679 ?auto_208680 ) ( ON ?auto_208678 ?auto_208679 ) ( CLEAR ?auto_208676 ) ( ON ?auto_208677 ?auto_208678 ) ( CLEAR ?auto_208677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_208673 ?auto_208674 ?auto_208675 ?auto_208676 ?auto_208677 )
      ( MAKE-13PILE ?auto_208673 ?auto_208674 ?auto_208675 ?auto_208676 ?auto_208677 ?auto_208678 ?auto_208679 ?auto_208680 ?auto_208681 ?auto_208682 ?auto_208683 ?auto_208684 ?auto_208685 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208700 - BLOCK
      ?auto_208701 - BLOCK
      ?auto_208702 - BLOCK
      ?auto_208703 - BLOCK
      ?auto_208704 - BLOCK
      ?auto_208705 - BLOCK
      ?auto_208706 - BLOCK
      ?auto_208707 - BLOCK
      ?auto_208708 - BLOCK
      ?auto_208709 - BLOCK
      ?auto_208710 - BLOCK
      ?auto_208711 - BLOCK
      ?auto_208712 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208712 ) ( ON-TABLE ?auto_208700 ) ( ON ?auto_208701 ?auto_208700 ) ( ON ?auto_208702 ?auto_208701 ) ( ON ?auto_208703 ?auto_208702 ) ( not ( = ?auto_208700 ?auto_208701 ) ) ( not ( = ?auto_208700 ?auto_208702 ) ) ( not ( = ?auto_208700 ?auto_208703 ) ) ( not ( = ?auto_208700 ?auto_208704 ) ) ( not ( = ?auto_208700 ?auto_208705 ) ) ( not ( = ?auto_208700 ?auto_208706 ) ) ( not ( = ?auto_208700 ?auto_208707 ) ) ( not ( = ?auto_208700 ?auto_208708 ) ) ( not ( = ?auto_208700 ?auto_208709 ) ) ( not ( = ?auto_208700 ?auto_208710 ) ) ( not ( = ?auto_208700 ?auto_208711 ) ) ( not ( = ?auto_208700 ?auto_208712 ) ) ( not ( = ?auto_208701 ?auto_208702 ) ) ( not ( = ?auto_208701 ?auto_208703 ) ) ( not ( = ?auto_208701 ?auto_208704 ) ) ( not ( = ?auto_208701 ?auto_208705 ) ) ( not ( = ?auto_208701 ?auto_208706 ) ) ( not ( = ?auto_208701 ?auto_208707 ) ) ( not ( = ?auto_208701 ?auto_208708 ) ) ( not ( = ?auto_208701 ?auto_208709 ) ) ( not ( = ?auto_208701 ?auto_208710 ) ) ( not ( = ?auto_208701 ?auto_208711 ) ) ( not ( = ?auto_208701 ?auto_208712 ) ) ( not ( = ?auto_208702 ?auto_208703 ) ) ( not ( = ?auto_208702 ?auto_208704 ) ) ( not ( = ?auto_208702 ?auto_208705 ) ) ( not ( = ?auto_208702 ?auto_208706 ) ) ( not ( = ?auto_208702 ?auto_208707 ) ) ( not ( = ?auto_208702 ?auto_208708 ) ) ( not ( = ?auto_208702 ?auto_208709 ) ) ( not ( = ?auto_208702 ?auto_208710 ) ) ( not ( = ?auto_208702 ?auto_208711 ) ) ( not ( = ?auto_208702 ?auto_208712 ) ) ( not ( = ?auto_208703 ?auto_208704 ) ) ( not ( = ?auto_208703 ?auto_208705 ) ) ( not ( = ?auto_208703 ?auto_208706 ) ) ( not ( = ?auto_208703 ?auto_208707 ) ) ( not ( = ?auto_208703 ?auto_208708 ) ) ( not ( = ?auto_208703 ?auto_208709 ) ) ( not ( = ?auto_208703 ?auto_208710 ) ) ( not ( = ?auto_208703 ?auto_208711 ) ) ( not ( = ?auto_208703 ?auto_208712 ) ) ( not ( = ?auto_208704 ?auto_208705 ) ) ( not ( = ?auto_208704 ?auto_208706 ) ) ( not ( = ?auto_208704 ?auto_208707 ) ) ( not ( = ?auto_208704 ?auto_208708 ) ) ( not ( = ?auto_208704 ?auto_208709 ) ) ( not ( = ?auto_208704 ?auto_208710 ) ) ( not ( = ?auto_208704 ?auto_208711 ) ) ( not ( = ?auto_208704 ?auto_208712 ) ) ( not ( = ?auto_208705 ?auto_208706 ) ) ( not ( = ?auto_208705 ?auto_208707 ) ) ( not ( = ?auto_208705 ?auto_208708 ) ) ( not ( = ?auto_208705 ?auto_208709 ) ) ( not ( = ?auto_208705 ?auto_208710 ) ) ( not ( = ?auto_208705 ?auto_208711 ) ) ( not ( = ?auto_208705 ?auto_208712 ) ) ( not ( = ?auto_208706 ?auto_208707 ) ) ( not ( = ?auto_208706 ?auto_208708 ) ) ( not ( = ?auto_208706 ?auto_208709 ) ) ( not ( = ?auto_208706 ?auto_208710 ) ) ( not ( = ?auto_208706 ?auto_208711 ) ) ( not ( = ?auto_208706 ?auto_208712 ) ) ( not ( = ?auto_208707 ?auto_208708 ) ) ( not ( = ?auto_208707 ?auto_208709 ) ) ( not ( = ?auto_208707 ?auto_208710 ) ) ( not ( = ?auto_208707 ?auto_208711 ) ) ( not ( = ?auto_208707 ?auto_208712 ) ) ( not ( = ?auto_208708 ?auto_208709 ) ) ( not ( = ?auto_208708 ?auto_208710 ) ) ( not ( = ?auto_208708 ?auto_208711 ) ) ( not ( = ?auto_208708 ?auto_208712 ) ) ( not ( = ?auto_208709 ?auto_208710 ) ) ( not ( = ?auto_208709 ?auto_208711 ) ) ( not ( = ?auto_208709 ?auto_208712 ) ) ( not ( = ?auto_208710 ?auto_208711 ) ) ( not ( = ?auto_208710 ?auto_208712 ) ) ( not ( = ?auto_208711 ?auto_208712 ) ) ( ON ?auto_208711 ?auto_208712 ) ( ON ?auto_208710 ?auto_208711 ) ( ON ?auto_208709 ?auto_208710 ) ( ON ?auto_208708 ?auto_208709 ) ( ON ?auto_208707 ?auto_208708 ) ( ON ?auto_208706 ?auto_208707 ) ( ON ?auto_208705 ?auto_208706 ) ( CLEAR ?auto_208703 ) ( ON ?auto_208704 ?auto_208705 ) ( CLEAR ?auto_208704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_208700 ?auto_208701 ?auto_208702 ?auto_208703 ?auto_208704 )
      ( MAKE-13PILE ?auto_208700 ?auto_208701 ?auto_208702 ?auto_208703 ?auto_208704 ?auto_208705 ?auto_208706 ?auto_208707 ?auto_208708 ?auto_208709 ?auto_208710 ?auto_208711 ?auto_208712 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208726 - BLOCK
      ?auto_208727 - BLOCK
      ?auto_208728 - BLOCK
      ?auto_208729 - BLOCK
      ?auto_208730 - BLOCK
      ?auto_208731 - BLOCK
      ?auto_208732 - BLOCK
      ?auto_208733 - BLOCK
      ?auto_208734 - BLOCK
      ?auto_208735 - BLOCK
      ?auto_208736 - BLOCK
      ?auto_208737 - BLOCK
      ?auto_208738 - BLOCK
    )
    :vars
    (
      ?auto_208739 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208738 ?auto_208739 ) ( ON-TABLE ?auto_208726 ) ( ON ?auto_208727 ?auto_208726 ) ( ON ?auto_208728 ?auto_208727 ) ( not ( = ?auto_208726 ?auto_208727 ) ) ( not ( = ?auto_208726 ?auto_208728 ) ) ( not ( = ?auto_208726 ?auto_208729 ) ) ( not ( = ?auto_208726 ?auto_208730 ) ) ( not ( = ?auto_208726 ?auto_208731 ) ) ( not ( = ?auto_208726 ?auto_208732 ) ) ( not ( = ?auto_208726 ?auto_208733 ) ) ( not ( = ?auto_208726 ?auto_208734 ) ) ( not ( = ?auto_208726 ?auto_208735 ) ) ( not ( = ?auto_208726 ?auto_208736 ) ) ( not ( = ?auto_208726 ?auto_208737 ) ) ( not ( = ?auto_208726 ?auto_208738 ) ) ( not ( = ?auto_208726 ?auto_208739 ) ) ( not ( = ?auto_208727 ?auto_208728 ) ) ( not ( = ?auto_208727 ?auto_208729 ) ) ( not ( = ?auto_208727 ?auto_208730 ) ) ( not ( = ?auto_208727 ?auto_208731 ) ) ( not ( = ?auto_208727 ?auto_208732 ) ) ( not ( = ?auto_208727 ?auto_208733 ) ) ( not ( = ?auto_208727 ?auto_208734 ) ) ( not ( = ?auto_208727 ?auto_208735 ) ) ( not ( = ?auto_208727 ?auto_208736 ) ) ( not ( = ?auto_208727 ?auto_208737 ) ) ( not ( = ?auto_208727 ?auto_208738 ) ) ( not ( = ?auto_208727 ?auto_208739 ) ) ( not ( = ?auto_208728 ?auto_208729 ) ) ( not ( = ?auto_208728 ?auto_208730 ) ) ( not ( = ?auto_208728 ?auto_208731 ) ) ( not ( = ?auto_208728 ?auto_208732 ) ) ( not ( = ?auto_208728 ?auto_208733 ) ) ( not ( = ?auto_208728 ?auto_208734 ) ) ( not ( = ?auto_208728 ?auto_208735 ) ) ( not ( = ?auto_208728 ?auto_208736 ) ) ( not ( = ?auto_208728 ?auto_208737 ) ) ( not ( = ?auto_208728 ?auto_208738 ) ) ( not ( = ?auto_208728 ?auto_208739 ) ) ( not ( = ?auto_208729 ?auto_208730 ) ) ( not ( = ?auto_208729 ?auto_208731 ) ) ( not ( = ?auto_208729 ?auto_208732 ) ) ( not ( = ?auto_208729 ?auto_208733 ) ) ( not ( = ?auto_208729 ?auto_208734 ) ) ( not ( = ?auto_208729 ?auto_208735 ) ) ( not ( = ?auto_208729 ?auto_208736 ) ) ( not ( = ?auto_208729 ?auto_208737 ) ) ( not ( = ?auto_208729 ?auto_208738 ) ) ( not ( = ?auto_208729 ?auto_208739 ) ) ( not ( = ?auto_208730 ?auto_208731 ) ) ( not ( = ?auto_208730 ?auto_208732 ) ) ( not ( = ?auto_208730 ?auto_208733 ) ) ( not ( = ?auto_208730 ?auto_208734 ) ) ( not ( = ?auto_208730 ?auto_208735 ) ) ( not ( = ?auto_208730 ?auto_208736 ) ) ( not ( = ?auto_208730 ?auto_208737 ) ) ( not ( = ?auto_208730 ?auto_208738 ) ) ( not ( = ?auto_208730 ?auto_208739 ) ) ( not ( = ?auto_208731 ?auto_208732 ) ) ( not ( = ?auto_208731 ?auto_208733 ) ) ( not ( = ?auto_208731 ?auto_208734 ) ) ( not ( = ?auto_208731 ?auto_208735 ) ) ( not ( = ?auto_208731 ?auto_208736 ) ) ( not ( = ?auto_208731 ?auto_208737 ) ) ( not ( = ?auto_208731 ?auto_208738 ) ) ( not ( = ?auto_208731 ?auto_208739 ) ) ( not ( = ?auto_208732 ?auto_208733 ) ) ( not ( = ?auto_208732 ?auto_208734 ) ) ( not ( = ?auto_208732 ?auto_208735 ) ) ( not ( = ?auto_208732 ?auto_208736 ) ) ( not ( = ?auto_208732 ?auto_208737 ) ) ( not ( = ?auto_208732 ?auto_208738 ) ) ( not ( = ?auto_208732 ?auto_208739 ) ) ( not ( = ?auto_208733 ?auto_208734 ) ) ( not ( = ?auto_208733 ?auto_208735 ) ) ( not ( = ?auto_208733 ?auto_208736 ) ) ( not ( = ?auto_208733 ?auto_208737 ) ) ( not ( = ?auto_208733 ?auto_208738 ) ) ( not ( = ?auto_208733 ?auto_208739 ) ) ( not ( = ?auto_208734 ?auto_208735 ) ) ( not ( = ?auto_208734 ?auto_208736 ) ) ( not ( = ?auto_208734 ?auto_208737 ) ) ( not ( = ?auto_208734 ?auto_208738 ) ) ( not ( = ?auto_208734 ?auto_208739 ) ) ( not ( = ?auto_208735 ?auto_208736 ) ) ( not ( = ?auto_208735 ?auto_208737 ) ) ( not ( = ?auto_208735 ?auto_208738 ) ) ( not ( = ?auto_208735 ?auto_208739 ) ) ( not ( = ?auto_208736 ?auto_208737 ) ) ( not ( = ?auto_208736 ?auto_208738 ) ) ( not ( = ?auto_208736 ?auto_208739 ) ) ( not ( = ?auto_208737 ?auto_208738 ) ) ( not ( = ?auto_208737 ?auto_208739 ) ) ( not ( = ?auto_208738 ?auto_208739 ) ) ( ON ?auto_208737 ?auto_208738 ) ( ON ?auto_208736 ?auto_208737 ) ( ON ?auto_208735 ?auto_208736 ) ( ON ?auto_208734 ?auto_208735 ) ( ON ?auto_208733 ?auto_208734 ) ( ON ?auto_208732 ?auto_208733 ) ( ON ?auto_208731 ?auto_208732 ) ( ON ?auto_208730 ?auto_208731 ) ( CLEAR ?auto_208728 ) ( ON ?auto_208729 ?auto_208730 ) ( CLEAR ?auto_208729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_208726 ?auto_208727 ?auto_208728 ?auto_208729 )
      ( MAKE-13PILE ?auto_208726 ?auto_208727 ?auto_208728 ?auto_208729 ?auto_208730 ?auto_208731 ?auto_208732 ?auto_208733 ?auto_208734 ?auto_208735 ?auto_208736 ?auto_208737 ?auto_208738 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208753 - BLOCK
      ?auto_208754 - BLOCK
      ?auto_208755 - BLOCK
      ?auto_208756 - BLOCK
      ?auto_208757 - BLOCK
      ?auto_208758 - BLOCK
      ?auto_208759 - BLOCK
      ?auto_208760 - BLOCK
      ?auto_208761 - BLOCK
      ?auto_208762 - BLOCK
      ?auto_208763 - BLOCK
      ?auto_208764 - BLOCK
      ?auto_208765 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208765 ) ( ON-TABLE ?auto_208753 ) ( ON ?auto_208754 ?auto_208753 ) ( ON ?auto_208755 ?auto_208754 ) ( not ( = ?auto_208753 ?auto_208754 ) ) ( not ( = ?auto_208753 ?auto_208755 ) ) ( not ( = ?auto_208753 ?auto_208756 ) ) ( not ( = ?auto_208753 ?auto_208757 ) ) ( not ( = ?auto_208753 ?auto_208758 ) ) ( not ( = ?auto_208753 ?auto_208759 ) ) ( not ( = ?auto_208753 ?auto_208760 ) ) ( not ( = ?auto_208753 ?auto_208761 ) ) ( not ( = ?auto_208753 ?auto_208762 ) ) ( not ( = ?auto_208753 ?auto_208763 ) ) ( not ( = ?auto_208753 ?auto_208764 ) ) ( not ( = ?auto_208753 ?auto_208765 ) ) ( not ( = ?auto_208754 ?auto_208755 ) ) ( not ( = ?auto_208754 ?auto_208756 ) ) ( not ( = ?auto_208754 ?auto_208757 ) ) ( not ( = ?auto_208754 ?auto_208758 ) ) ( not ( = ?auto_208754 ?auto_208759 ) ) ( not ( = ?auto_208754 ?auto_208760 ) ) ( not ( = ?auto_208754 ?auto_208761 ) ) ( not ( = ?auto_208754 ?auto_208762 ) ) ( not ( = ?auto_208754 ?auto_208763 ) ) ( not ( = ?auto_208754 ?auto_208764 ) ) ( not ( = ?auto_208754 ?auto_208765 ) ) ( not ( = ?auto_208755 ?auto_208756 ) ) ( not ( = ?auto_208755 ?auto_208757 ) ) ( not ( = ?auto_208755 ?auto_208758 ) ) ( not ( = ?auto_208755 ?auto_208759 ) ) ( not ( = ?auto_208755 ?auto_208760 ) ) ( not ( = ?auto_208755 ?auto_208761 ) ) ( not ( = ?auto_208755 ?auto_208762 ) ) ( not ( = ?auto_208755 ?auto_208763 ) ) ( not ( = ?auto_208755 ?auto_208764 ) ) ( not ( = ?auto_208755 ?auto_208765 ) ) ( not ( = ?auto_208756 ?auto_208757 ) ) ( not ( = ?auto_208756 ?auto_208758 ) ) ( not ( = ?auto_208756 ?auto_208759 ) ) ( not ( = ?auto_208756 ?auto_208760 ) ) ( not ( = ?auto_208756 ?auto_208761 ) ) ( not ( = ?auto_208756 ?auto_208762 ) ) ( not ( = ?auto_208756 ?auto_208763 ) ) ( not ( = ?auto_208756 ?auto_208764 ) ) ( not ( = ?auto_208756 ?auto_208765 ) ) ( not ( = ?auto_208757 ?auto_208758 ) ) ( not ( = ?auto_208757 ?auto_208759 ) ) ( not ( = ?auto_208757 ?auto_208760 ) ) ( not ( = ?auto_208757 ?auto_208761 ) ) ( not ( = ?auto_208757 ?auto_208762 ) ) ( not ( = ?auto_208757 ?auto_208763 ) ) ( not ( = ?auto_208757 ?auto_208764 ) ) ( not ( = ?auto_208757 ?auto_208765 ) ) ( not ( = ?auto_208758 ?auto_208759 ) ) ( not ( = ?auto_208758 ?auto_208760 ) ) ( not ( = ?auto_208758 ?auto_208761 ) ) ( not ( = ?auto_208758 ?auto_208762 ) ) ( not ( = ?auto_208758 ?auto_208763 ) ) ( not ( = ?auto_208758 ?auto_208764 ) ) ( not ( = ?auto_208758 ?auto_208765 ) ) ( not ( = ?auto_208759 ?auto_208760 ) ) ( not ( = ?auto_208759 ?auto_208761 ) ) ( not ( = ?auto_208759 ?auto_208762 ) ) ( not ( = ?auto_208759 ?auto_208763 ) ) ( not ( = ?auto_208759 ?auto_208764 ) ) ( not ( = ?auto_208759 ?auto_208765 ) ) ( not ( = ?auto_208760 ?auto_208761 ) ) ( not ( = ?auto_208760 ?auto_208762 ) ) ( not ( = ?auto_208760 ?auto_208763 ) ) ( not ( = ?auto_208760 ?auto_208764 ) ) ( not ( = ?auto_208760 ?auto_208765 ) ) ( not ( = ?auto_208761 ?auto_208762 ) ) ( not ( = ?auto_208761 ?auto_208763 ) ) ( not ( = ?auto_208761 ?auto_208764 ) ) ( not ( = ?auto_208761 ?auto_208765 ) ) ( not ( = ?auto_208762 ?auto_208763 ) ) ( not ( = ?auto_208762 ?auto_208764 ) ) ( not ( = ?auto_208762 ?auto_208765 ) ) ( not ( = ?auto_208763 ?auto_208764 ) ) ( not ( = ?auto_208763 ?auto_208765 ) ) ( not ( = ?auto_208764 ?auto_208765 ) ) ( ON ?auto_208764 ?auto_208765 ) ( ON ?auto_208763 ?auto_208764 ) ( ON ?auto_208762 ?auto_208763 ) ( ON ?auto_208761 ?auto_208762 ) ( ON ?auto_208760 ?auto_208761 ) ( ON ?auto_208759 ?auto_208760 ) ( ON ?auto_208758 ?auto_208759 ) ( ON ?auto_208757 ?auto_208758 ) ( CLEAR ?auto_208755 ) ( ON ?auto_208756 ?auto_208757 ) ( CLEAR ?auto_208756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_208753 ?auto_208754 ?auto_208755 ?auto_208756 )
      ( MAKE-13PILE ?auto_208753 ?auto_208754 ?auto_208755 ?auto_208756 ?auto_208757 ?auto_208758 ?auto_208759 ?auto_208760 ?auto_208761 ?auto_208762 ?auto_208763 ?auto_208764 ?auto_208765 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208779 - BLOCK
      ?auto_208780 - BLOCK
      ?auto_208781 - BLOCK
      ?auto_208782 - BLOCK
      ?auto_208783 - BLOCK
      ?auto_208784 - BLOCK
      ?auto_208785 - BLOCK
      ?auto_208786 - BLOCK
      ?auto_208787 - BLOCK
      ?auto_208788 - BLOCK
      ?auto_208789 - BLOCK
      ?auto_208790 - BLOCK
      ?auto_208791 - BLOCK
    )
    :vars
    (
      ?auto_208792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208791 ?auto_208792 ) ( ON-TABLE ?auto_208779 ) ( ON ?auto_208780 ?auto_208779 ) ( not ( = ?auto_208779 ?auto_208780 ) ) ( not ( = ?auto_208779 ?auto_208781 ) ) ( not ( = ?auto_208779 ?auto_208782 ) ) ( not ( = ?auto_208779 ?auto_208783 ) ) ( not ( = ?auto_208779 ?auto_208784 ) ) ( not ( = ?auto_208779 ?auto_208785 ) ) ( not ( = ?auto_208779 ?auto_208786 ) ) ( not ( = ?auto_208779 ?auto_208787 ) ) ( not ( = ?auto_208779 ?auto_208788 ) ) ( not ( = ?auto_208779 ?auto_208789 ) ) ( not ( = ?auto_208779 ?auto_208790 ) ) ( not ( = ?auto_208779 ?auto_208791 ) ) ( not ( = ?auto_208779 ?auto_208792 ) ) ( not ( = ?auto_208780 ?auto_208781 ) ) ( not ( = ?auto_208780 ?auto_208782 ) ) ( not ( = ?auto_208780 ?auto_208783 ) ) ( not ( = ?auto_208780 ?auto_208784 ) ) ( not ( = ?auto_208780 ?auto_208785 ) ) ( not ( = ?auto_208780 ?auto_208786 ) ) ( not ( = ?auto_208780 ?auto_208787 ) ) ( not ( = ?auto_208780 ?auto_208788 ) ) ( not ( = ?auto_208780 ?auto_208789 ) ) ( not ( = ?auto_208780 ?auto_208790 ) ) ( not ( = ?auto_208780 ?auto_208791 ) ) ( not ( = ?auto_208780 ?auto_208792 ) ) ( not ( = ?auto_208781 ?auto_208782 ) ) ( not ( = ?auto_208781 ?auto_208783 ) ) ( not ( = ?auto_208781 ?auto_208784 ) ) ( not ( = ?auto_208781 ?auto_208785 ) ) ( not ( = ?auto_208781 ?auto_208786 ) ) ( not ( = ?auto_208781 ?auto_208787 ) ) ( not ( = ?auto_208781 ?auto_208788 ) ) ( not ( = ?auto_208781 ?auto_208789 ) ) ( not ( = ?auto_208781 ?auto_208790 ) ) ( not ( = ?auto_208781 ?auto_208791 ) ) ( not ( = ?auto_208781 ?auto_208792 ) ) ( not ( = ?auto_208782 ?auto_208783 ) ) ( not ( = ?auto_208782 ?auto_208784 ) ) ( not ( = ?auto_208782 ?auto_208785 ) ) ( not ( = ?auto_208782 ?auto_208786 ) ) ( not ( = ?auto_208782 ?auto_208787 ) ) ( not ( = ?auto_208782 ?auto_208788 ) ) ( not ( = ?auto_208782 ?auto_208789 ) ) ( not ( = ?auto_208782 ?auto_208790 ) ) ( not ( = ?auto_208782 ?auto_208791 ) ) ( not ( = ?auto_208782 ?auto_208792 ) ) ( not ( = ?auto_208783 ?auto_208784 ) ) ( not ( = ?auto_208783 ?auto_208785 ) ) ( not ( = ?auto_208783 ?auto_208786 ) ) ( not ( = ?auto_208783 ?auto_208787 ) ) ( not ( = ?auto_208783 ?auto_208788 ) ) ( not ( = ?auto_208783 ?auto_208789 ) ) ( not ( = ?auto_208783 ?auto_208790 ) ) ( not ( = ?auto_208783 ?auto_208791 ) ) ( not ( = ?auto_208783 ?auto_208792 ) ) ( not ( = ?auto_208784 ?auto_208785 ) ) ( not ( = ?auto_208784 ?auto_208786 ) ) ( not ( = ?auto_208784 ?auto_208787 ) ) ( not ( = ?auto_208784 ?auto_208788 ) ) ( not ( = ?auto_208784 ?auto_208789 ) ) ( not ( = ?auto_208784 ?auto_208790 ) ) ( not ( = ?auto_208784 ?auto_208791 ) ) ( not ( = ?auto_208784 ?auto_208792 ) ) ( not ( = ?auto_208785 ?auto_208786 ) ) ( not ( = ?auto_208785 ?auto_208787 ) ) ( not ( = ?auto_208785 ?auto_208788 ) ) ( not ( = ?auto_208785 ?auto_208789 ) ) ( not ( = ?auto_208785 ?auto_208790 ) ) ( not ( = ?auto_208785 ?auto_208791 ) ) ( not ( = ?auto_208785 ?auto_208792 ) ) ( not ( = ?auto_208786 ?auto_208787 ) ) ( not ( = ?auto_208786 ?auto_208788 ) ) ( not ( = ?auto_208786 ?auto_208789 ) ) ( not ( = ?auto_208786 ?auto_208790 ) ) ( not ( = ?auto_208786 ?auto_208791 ) ) ( not ( = ?auto_208786 ?auto_208792 ) ) ( not ( = ?auto_208787 ?auto_208788 ) ) ( not ( = ?auto_208787 ?auto_208789 ) ) ( not ( = ?auto_208787 ?auto_208790 ) ) ( not ( = ?auto_208787 ?auto_208791 ) ) ( not ( = ?auto_208787 ?auto_208792 ) ) ( not ( = ?auto_208788 ?auto_208789 ) ) ( not ( = ?auto_208788 ?auto_208790 ) ) ( not ( = ?auto_208788 ?auto_208791 ) ) ( not ( = ?auto_208788 ?auto_208792 ) ) ( not ( = ?auto_208789 ?auto_208790 ) ) ( not ( = ?auto_208789 ?auto_208791 ) ) ( not ( = ?auto_208789 ?auto_208792 ) ) ( not ( = ?auto_208790 ?auto_208791 ) ) ( not ( = ?auto_208790 ?auto_208792 ) ) ( not ( = ?auto_208791 ?auto_208792 ) ) ( ON ?auto_208790 ?auto_208791 ) ( ON ?auto_208789 ?auto_208790 ) ( ON ?auto_208788 ?auto_208789 ) ( ON ?auto_208787 ?auto_208788 ) ( ON ?auto_208786 ?auto_208787 ) ( ON ?auto_208785 ?auto_208786 ) ( ON ?auto_208784 ?auto_208785 ) ( ON ?auto_208783 ?auto_208784 ) ( ON ?auto_208782 ?auto_208783 ) ( CLEAR ?auto_208780 ) ( ON ?auto_208781 ?auto_208782 ) ( CLEAR ?auto_208781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_208779 ?auto_208780 ?auto_208781 )
      ( MAKE-13PILE ?auto_208779 ?auto_208780 ?auto_208781 ?auto_208782 ?auto_208783 ?auto_208784 ?auto_208785 ?auto_208786 ?auto_208787 ?auto_208788 ?auto_208789 ?auto_208790 ?auto_208791 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208806 - BLOCK
      ?auto_208807 - BLOCK
      ?auto_208808 - BLOCK
      ?auto_208809 - BLOCK
      ?auto_208810 - BLOCK
      ?auto_208811 - BLOCK
      ?auto_208812 - BLOCK
      ?auto_208813 - BLOCK
      ?auto_208814 - BLOCK
      ?auto_208815 - BLOCK
      ?auto_208816 - BLOCK
      ?auto_208817 - BLOCK
      ?auto_208818 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208818 ) ( ON-TABLE ?auto_208806 ) ( ON ?auto_208807 ?auto_208806 ) ( not ( = ?auto_208806 ?auto_208807 ) ) ( not ( = ?auto_208806 ?auto_208808 ) ) ( not ( = ?auto_208806 ?auto_208809 ) ) ( not ( = ?auto_208806 ?auto_208810 ) ) ( not ( = ?auto_208806 ?auto_208811 ) ) ( not ( = ?auto_208806 ?auto_208812 ) ) ( not ( = ?auto_208806 ?auto_208813 ) ) ( not ( = ?auto_208806 ?auto_208814 ) ) ( not ( = ?auto_208806 ?auto_208815 ) ) ( not ( = ?auto_208806 ?auto_208816 ) ) ( not ( = ?auto_208806 ?auto_208817 ) ) ( not ( = ?auto_208806 ?auto_208818 ) ) ( not ( = ?auto_208807 ?auto_208808 ) ) ( not ( = ?auto_208807 ?auto_208809 ) ) ( not ( = ?auto_208807 ?auto_208810 ) ) ( not ( = ?auto_208807 ?auto_208811 ) ) ( not ( = ?auto_208807 ?auto_208812 ) ) ( not ( = ?auto_208807 ?auto_208813 ) ) ( not ( = ?auto_208807 ?auto_208814 ) ) ( not ( = ?auto_208807 ?auto_208815 ) ) ( not ( = ?auto_208807 ?auto_208816 ) ) ( not ( = ?auto_208807 ?auto_208817 ) ) ( not ( = ?auto_208807 ?auto_208818 ) ) ( not ( = ?auto_208808 ?auto_208809 ) ) ( not ( = ?auto_208808 ?auto_208810 ) ) ( not ( = ?auto_208808 ?auto_208811 ) ) ( not ( = ?auto_208808 ?auto_208812 ) ) ( not ( = ?auto_208808 ?auto_208813 ) ) ( not ( = ?auto_208808 ?auto_208814 ) ) ( not ( = ?auto_208808 ?auto_208815 ) ) ( not ( = ?auto_208808 ?auto_208816 ) ) ( not ( = ?auto_208808 ?auto_208817 ) ) ( not ( = ?auto_208808 ?auto_208818 ) ) ( not ( = ?auto_208809 ?auto_208810 ) ) ( not ( = ?auto_208809 ?auto_208811 ) ) ( not ( = ?auto_208809 ?auto_208812 ) ) ( not ( = ?auto_208809 ?auto_208813 ) ) ( not ( = ?auto_208809 ?auto_208814 ) ) ( not ( = ?auto_208809 ?auto_208815 ) ) ( not ( = ?auto_208809 ?auto_208816 ) ) ( not ( = ?auto_208809 ?auto_208817 ) ) ( not ( = ?auto_208809 ?auto_208818 ) ) ( not ( = ?auto_208810 ?auto_208811 ) ) ( not ( = ?auto_208810 ?auto_208812 ) ) ( not ( = ?auto_208810 ?auto_208813 ) ) ( not ( = ?auto_208810 ?auto_208814 ) ) ( not ( = ?auto_208810 ?auto_208815 ) ) ( not ( = ?auto_208810 ?auto_208816 ) ) ( not ( = ?auto_208810 ?auto_208817 ) ) ( not ( = ?auto_208810 ?auto_208818 ) ) ( not ( = ?auto_208811 ?auto_208812 ) ) ( not ( = ?auto_208811 ?auto_208813 ) ) ( not ( = ?auto_208811 ?auto_208814 ) ) ( not ( = ?auto_208811 ?auto_208815 ) ) ( not ( = ?auto_208811 ?auto_208816 ) ) ( not ( = ?auto_208811 ?auto_208817 ) ) ( not ( = ?auto_208811 ?auto_208818 ) ) ( not ( = ?auto_208812 ?auto_208813 ) ) ( not ( = ?auto_208812 ?auto_208814 ) ) ( not ( = ?auto_208812 ?auto_208815 ) ) ( not ( = ?auto_208812 ?auto_208816 ) ) ( not ( = ?auto_208812 ?auto_208817 ) ) ( not ( = ?auto_208812 ?auto_208818 ) ) ( not ( = ?auto_208813 ?auto_208814 ) ) ( not ( = ?auto_208813 ?auto_208815 ) ) ( not ( = ?auto_208813 ?auto_208816 ) ) ( not ( = ?auto_208813 ?auto_208817 ) ) ( not ( = ?auto_208813 ?auto_208818 ) ) ( not ( = ?auto_208814 ?auto_208815 ) ) ( not ( = ?auto_208814 ?auto_208816 ) ) ( not ( = ?auto_208814 ?auto_208817 ) ) ( not ( = ?auto_208814 ?auto_208818 ) ) ( not ( = ?auto_208815 ?auto_208816 ) ) ( not ( = ?auto_208815 ?auto_208817 ) ) ( not ( = ?auto_208815 ?auto_208818 ) ) ( not ( = ?auto_208816 ?auto_208817 ) ) ( not ( = ?auto_208816 ?auto_208818 ) ) ( not ( = ?auto_208817 ?auto_208818 ) ) ( ON ?auto_208817 ?auto_208818 ) ( ON ?auto_208816 ?auto_208817 ) ( ON ?auto_208815 ?auto_208816 ) ( ON ?auto_208814 ?auto_208815 ) ( ON ?auto_208813 ?auto_208814 ) ( ON ?auto_208812 ?auto_208813 ) ( ON ?auto_208811 ?auto_208812 ) ( ON ?auto_208810 ?auto_208811 ) ( ON ?auto_208809 ?auto_208810 ) ( CLEAR ?auto_208807 ) ( ON ?auto_208808 ?auto_208809 ) ( CLEAR ?auto_208808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_208806 ?auto_208807 ?auto_208808 )
      ( MAKE-13PILE ?auto_208806 ?auto_208807 ?auto_208808 ?auto_208809 ?auto_208810 ?auto_208811 ?auto_208812 ?auto_208813 ?auto_208814 ?auto_208815 ?auto_208816 ?auto_208817 ?auto_208818 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208832 - BLOCK
      ?auto_208833 - BLOCK
      ?auto_208834 - BLOCK
      ?auto_208835 - BLOCK
      ?auto_208836 - BLOCK
      ?auto_208837 - BLOCK
      ?auto_208838 - BLOCK
      ?auto_208839 - BLOCK
      ?auto_208840 - BLOCK
      ?auto_208841 - BLOCK
      ?auto_208842 - BLOCK
      ?auto_208843 - BLOCK
      ?auto_208844 - BLOCK
    )
    :vars
    (
      ?auto_208845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208844 ?auto_208845 ) ( ON-TABLE ?auto_208832 ) ( not ( = ?auto_208832 ?auto_208833 ) ) ( not ( = ?auto_208832 ?auto_208834 ) ) ( not ( = ?auto_208832 ?auto_208835 ) ) ( not ( = ?auto_208832 ?auto_208836 ) ) ( not ( = ?auto_208832 ?auto_208837 ) ) ( not ( = ?auto_208832 ?auto_208838 ) ) ( not ( = ?auto_208832 ?auto_208839 ) ) ( not ( = ?auto_208832 ?auto_208840 ) ) ( not ( = ?auto_208832 ?auto_208841 ) ) ( not ( = ?auto_208832 ?auto_208842 ) ) ( not ( = ?auto_208832 ?auto_208843 ) ) ( not ( = ?auto_208832 ?auto_208844 ) ) ( not ( = ?auto_208832 ?auto_208845 ) ) ( not ( = ?auto_208833 ?auto_208834 ) ) ( not ( = ?auto_208833 ?auto_208835 ) ) ( not ( = ?auto_208833 ?auto_208836 ) ) ( not ( = ?auto_208833 ?auto_208837 ) ) ( not ( = ?auto_208833 ?auto_208838 ) ) ( not ( = ?auto_208833 ?auto_208839 ) ) ( not ( = ?auto_208833 ?auto_208840 ) ) ( not ( = ?auto_208833 ?auto_208841 ) ) ( not ( = ?auto_208833 ?auto_208842 ) ) ( not ( = ?auto_208833 ?auto_208843 ) ) ( not ( = ?auto_208833 ?auto_208844 ) ) ( not ( = ?auto_208833 ?auto_208845 ) ) ( not ( = ?auto_208834 ?auto_208835 ) ) ( not ( = ?auto_208834 ?auto_208836 ) ) ( not ( = ?auto_208834 ?auto_208837 ) ) ( not ( = ?auto_208834 ?auto_208838 ) ) ( not ( = ?auto_208834 ?auto_208839 ) ) ( not ( = ?auto_208834 ?auto_208840 ) ) ( not ( = ?auto_208834 ?auto_208841 ) ) ( not ( = ?auto_208834 ?auto_208842 ) ) ( not ( = ?auto_208834 ?auto_208843 ) ) ( not ( = ?auto_208834 ?auto_208844 ) ) ( not ( = ?auto_208834 ?auto_208845 ) ) ( not ( = ?auto_208835 ?auto_208836 ) ) ( not ( = ?auto_208835 ?auto_208837 ) ) ( not ( = ?auto_208835 ?auto_208838 ) ) ( not ( = ?auto_208835 ?auto_208839 ) ) ( not ( = ?auto_208835 ?auto_208840 ) ) ( not ( = ?auto_208835 ?auto_208841 ) ) ( not ( = ?auto_208835 ?auto_208842 ) ) ( not ( = ?auto_208835 ?auto_208843 ) ) ( not ( = ?auto_208835 ?auto_208844 ) ) ( not ( = ?auto_208835 ?auto_208845 ) ) ( not ( = ?auto_208836 ?auto_208837 ) ) ( not ( = ?auto_208836 ?auto_208838 ) ) ( not ( = ?auto_208836 ?auto_208839 ) ) ( not ( = ?auto_208836 ?auto_208840 ) ) ( not ( = ?auto_208836 ?auto_208841 ) ) ( not ( = ?auto_208836 ?auto_208842 ) ) ( not ( = ?auto_208836 ?auto_208843 ) ) ( not ( = ?auto_208836 ?auto_208844 ) ) ( not ( = ?auto_208836 ?auto_208845 ) ) ( not ( = ?auto_208837 ?auto_208838 ) ) ( not ( = ?auto_208837 ?auto_208839 ) ) ( not ( = ?auto_208837 ?auto_208840 ) ) ( not ( = ?auto_208837 ?auto_208841 ) ) ( not ( = ?auto_208837 ?auto_208842 ) ) ( not ( = ?auto_208837 ?auto_208843 ) ) ( not ( = ?auto_208837 ?auto_208844 ) ) ( not ( = ?auto_208837 ?auto_208845 ) ) ( not ( = ?auto_208838 ?auto_208839 ) ) ( not ( = ?auto_208838 ?auto_208840 ) ) ( not ( = ?auto_208838 ?auto_208841 ) ) ( not ( = ?auto_208838 ?auto_208842 ) ) ( not ( = ?auto_208838 ?auto_208843 ) ) ( not ( = ?auto_208838 ?auto_208844 ) ) ( not ( = ?auto_208838 ?auto_208845 ) ) ( not ( = ?auto_208839 ?auto_208840 ) ) ( not ( = ?auto_208839 ?auto_208841 ) ) ( not ( = ?auto_208839 ?auto_208842 ) ) ( not ( = ?auto_208839 ?auto_208843 ) ) ( not ( = ?auto_208839 ?auto_208844 ) ) ( not ( = ?auto_208839 ?auto_208845 ) ) ( not ( = ?auto_208840 ?auto_208841 ) ) ( not ( = ?auto_208840 ?auto_208842 ) ) ( not ( = ?auto_208840 ?auto_208843 ) ) ( not ( = ?auto_208840 ?auto_208844 ) ) ( not ( = ?auto_208840 ?auto_208845 ) ) ( not ( = ?auto_208841 ?auto_208842 ) ) ( not ( = ?auto_208841 ?auto_208843 ) ) ( not ( = ?auto_208841 ?auto_208844 ) ) ( not ( = ?auto_208841 ?auto_208845 ) ) ( not ( = ?auto_208842 ?auto_208843 ) ) ( not ( = ?auto_208842 ?auto_208844 ) ) ( not ( = ?auto_208842 ?auto_208845 ) ) ( not ( = ?auto_208843 ?auto_208844 ) ) ( not ( = ?auto_208843 ?auto_208845 ) ) ( not ( = ?auto_208844 ?auto_208845 ) ) ( ON ?auto_208843 ?auto_208844 ) ( ON ?auto_208842 ?auto_208843 ) ( ON ?auto_208841 ?auto_208842 ) ( ON ?auto_208840 ?auto_208841 ) ( ON ?auto_208839 ?auto_208840 ) ( ON ?auto_208838 ?auto_208839 ) ( ON ?auto_208837 ?auto_208838 ) ( ON ?auto_208836 ?auto_208837 ) ( ON ?auto_208835 ?auto_208836 ) ( ON ?auto_208834 ?auto_208835 ) ( CLEAR ?auto_208832 ) ( ON ?auto_208833 ?auto_208834 ) ( CLEAR ?auto_208833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_208832 ?auto_208833 )
      ( MAKE-13PILE ?auto_208832 ?auto_208833 ?auto_208834 ?auto_208835 ?auto_208836 ?auto_208837 ?auto_208838 ?auto_208839 ?auto_208840 ?auto_208841 ?auto_208842 ?auto_208843 ?auto_208844 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208859 - BLOCK
      ?auto_208860 - BLOCK
      ?auto_208861 - BLOCK
      ?auto_208862 - BLOCK
      ?auto_208863 - BLOCK
      ?auto_208864 - BLOCK
      ?auto_208865 - BLOCK
      ?auto_208866 - BLOCK
      ?auto_208867 - BLOCK
      ?auto_208868 - BLOCK
      ?auto_208869 - BLOCK
      ?auto_208870 - BLOCK
      ?auto_208871 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208871 ) ( ON-TABLE ?auto_208859 ) ( not ( = ?auto_208859 ?auto_208860 ) ) ( not ( = ?auto_208859 ?auto_208861 ) ) ( not ( = ?auto_208859 ?auto_208862 ) ) ( not ( = ?auto_208859 ?auto_208863 ) ) ( not ( = ?auto_208859 ?auto_208864 ) ) ( not ( = ?auto_208859 ?auto_208865 ) ) ( not ( = ?auto_208859 ?auto_208866 ) ) ( not ( = ?auto_208859 ?auto_208867 ) ) ( not ( = ?auto_208859 ?auto_208868 ) ) ( not ( = ?auto_208859 ?auto_208869 ) ) ( not ( = ?auto_208859 ?auto_208870 ) ) ( not ( = ?auto_208859 ?auto_208871 ) ) ( not ( = ?auto_208860 ?auto_208861 ) ) ( not ( = ?auto_208860 ?auto_208862 ) ) ( not ( = ?auto_208860 ?auto_208863 ) ) ( not ( = ?auto_208860 ?auto_208864 ) ) ( not ( = ?auto_208860 ?auto_208865 ) ) ( not ( = ?auto_208860 ?auto_208866 ) ) ( not ( = ?auto_208860 ?auto_208867 ) ) ( not ( = ?auto_208860 ?auto_208868 ) ) ( not ( = ?auto_208860 ?auto_208869 ) ) ( not ( = ?auto_208860 ?auto_208870 ) ) ( not ( = ?auto_208860 ?auto_208871 ) ) ( not ( = ?auto_208861 ?auto_208862 ) ) ( not ( = ?auto_208861 ?auto_208863 ) ) ( not ( = ?auto_208861 ?auto_208864 ) ) ( not ( = ?auto_208861 ?auto_208865 ) ) ( not ( = ?auto_208861 ?auto_208866 ) ) ( not ( = ?auto_208861 ?auto_208867 ) ) ( not ( = ?auto_208861 ?auto_208868 ) ) ( not ( = ?auto_208861 ?auto_208869 ) ) ( not ( = ?auto_208861 ?auto_208870 ) ) ( not ( = ?auto_208861 ?auto_208871 ) ) ( not ( = ?auto_208862 ?auto_208863 ) ) ( not ( = ?auto_208862 ?auto_208864 ) ) ( not ( = ?auto_208862 ?auto_208865 ) ) ( not ( = ?auto_208862 ?auto_208866 ) ) ( not ( = ?auto_208862 ?auto_208867 ) ) ( not ( = ?auto_208862 ?auto_208868 ) ) ( not ( = ?auto_208862 ?auto_208869 ) ) ( not ( = ?auto_208862 ?auto_208870 ) ) ( not ( = ?auto_208862 ?auto_208871 ) ) ( not ( = ?auto_208863 ?auto_208864 ) ) ( not ( = ?auto_208863 ?auto_208865 ) ) ( not ( = ?auto_208863 ?auto_208866 ) ) ( not ( = ?auto_208863 ?auto_208867 ) ) ( not ( = ?auto_208863 ?auto_208868 ) ) ( not ( = ?auto_208863 ?auto_208869 ) ) ( not ( = ?auto_208863 ?auto_208870 ) ) ( not ( = ?auto_208863 ?auto_208871 ) ) ( not ( = ?auto_208864 ?auto_208865 ) ) ( not ( = ?auto_208864 ?auto_208866 ) ) ( not ( = ?auto_208864 ?auto_208867 ) ) ( not ( = ?auto_208864 ?auto_208868 ) ) ( not ( = ?auto_208864 ?auto_208869 ) ) ( not ( = ?auto_208864 ?auto_208870 ) ) ( not ( = ?auto_208864 ?auto_208871 ) ) ( not ( = ?auto_208865 ?auto_208866 ) ) ( not ( = ?auto_208865 ?auto_208867 ) ) ( not ( = ?auto_208865 ?auto_208868 ) ) ( not ( = ?auto_208865 ?auto_208869 ) ) ( not ( = ?auto_208865 ?auto_208870 ) ) ( not ( = ?auto_208865 ?auto_208871 ) ) ( not ( = ?auto_208866 ?auto_208867 ) ) ( not ( = ?auto_208866 ?auto_208868 ) ) ( not ( = ?auto_208866 ?auto_208869 ) ) ( not ( = ?auto_208866 ?auto_208870 ) ) ( not ( = ?auto_208866 ?auto_208871 ) ) ( not ( = ?auto_208867 ?auto_208868 ) ) ( not ( = ?auto_208867 ?auto_208869 ) ) ( not ( = ?auto_208867 ?auto_208870 ) ) ( not ( = ?auto_208867 ?auto_208871 ) ) ( not ( = ?auto_208868 ?auto_208869 ) ) ( not ( = ?auto_208868 ?auto_208870 ) ) ( not ( = ?auto_208868 ?auto_208871 ) ) ( not ( = ?auto_208869 ?auto_208870 ) ) ( not ( = ?auto_208869 ?auto_208871 ) ) ( not ( = ?auto_208870 ?auto_208871 ) ) ( ON ?auto_208870 ?auto_208871 ) ( ON ?auto_208869 ?auto_208870 ) ( ON ?auto_208868 ?auto_208869 ) ( ON ?auto_208867 ?auto_208868 ) ( ON ?auto_208866 ?auto_208867 ) ( ON ?auto_208865 ?auto_208866 ) ( ON ?auto_208864 ?auto_208865 ) ( ON ?auto_208863 ?auto_208864 ) ( ON ?auto_208862 ?auto_208863 ) ( ON ?auto_208861 ?auto_208862 ) ( CLEAR ?auto_208859 ) ( ON ?auto_208860 ?auto_208861 ) ( CLEAR ?auto_208860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_208859 ?auto_208860 )
      ( MAKE-13PILE ?auto_208859 ?auto_208860 ?auto_208861 ?auto_208862 ?auto_208863 ?auto_208864 ?auto_208865 ?auto_208866 ?auto_208867 ?auto_208868 ?auto_208869 ?auto_208870 ?auto_208871 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208885 - BLOCK
      ?auto_208886 - BLOCK
      ?auto_208887 - BLOCK
      ?auto_208888 - BLOCK
      ?auto_208889 - BLOCK
      ?auto_208890 - BLOCK
      ?auto_208891 - BLOCK
      ?auto_208892 - BLOCK
      ?auto_208893 - BLOCK
      ?auto_208894 - BLOCK
      ?auto_208895 - BLOCK
      ?auto_208896 - BLOCK
      ?auto_208897 - BLOCK
    )
    :vars
    (
      ?auto_208898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208897 ?auto_208898 ) ( not ( = ?auto_208885 ?auto_208886 ) ) ( not ( = ?auto_208885 ?auto_208887 ) ) ( not ( = ?auto_208885 ?auto_208888 ) ) ( not ( = ?auto_208885 ?auto_208889 ) ) ( not ( = ?auto_208885 ?auto_208890 ) ) ( not ( = ?auto_208885 ?auto_208891 ) ) ( not ( = ?auto_208885 ?auto_208892 ) ) ( not ( = ?auto_208885 ?auto_208893 ) ) ( not ( = ?auto_208885 ?auto_208894 ) ) ( not ( = ?auto_208885 ?auto_208895 ) ) ( not ( = ?auto_208885 ?auto_208896 ) ) ( not ( = ?auto_208885 ?auto_208897 ) ) ( not ( = ?auto_208885 ?auto_208898 ) ) ( not ( = ?auto_208886 ?auto_208887 ) ) ( not ( = ?auto_208886 ?auto_208888 ) ) ( not ( = ?auto_208886 ?auto_208889 ) ) ( not ( = ?auto_208886 ?auto_208890 ) ) ( not ( = ?auto_208886 ?auto_208891 ) ) ( not ( = ?auto_208886 ?auto_208892 ) ) ( not ( = ?auto_208886 ?auto_208893 ) ) ( not ( = ?auto_208886 ?auto_208894 ) ) ( not ( = ?auto_208886 ?auto_208895 ) ) ( not ( = ?auto_208886 ?auto_208896 ) ) ( not ( = ?auto_208886 ?auto_208897 ) ) ( not ( = ?auto_208886 ?auto_208898 ) ) ( not ( = ?auto_208887 ?auto_208888 ) ) ( not ( = ?auto_208887 ?auto_208889 ) ) ( not ( = ?auto_208887 ?auto_208890 ) ) ( not ( = ?auto_208887 ?auto_208891 ) ) ( not ( = ?auto_208887 ?auto_208892 ) ) ( not ( = ?auto_208887 ?auto_208893 ) ) ( not ( = ?auto_208887 ?auto_208894 ) ) ( not ( = ?auto_208887 ?auto_208895 ) ) ( not ( = ?auto_208887 ?auto_208896 ) ) ( not ( = ?auto_208887 ?auto_208897 ) ) ( not ( = ?auto_208887 ?auto_208898 ) ) ( not ( = ?auto_208888 ?auto_208889 ) ) ( not ( = ?auto_208888 ?auto_208890 ) ) ( not ( = ?auto_208888 ?auto_208891 ) ) ( not ( = ?auto_208888 ?auto_208892 ) ) ( not ( = ?auto_208888 ?auto_208893 ) ) ( not ( = ?auto_208888 ?auto_208894 ) ) ( not ( = ?auto_208888 ?auto_208895 ) ) ( not ( = ?auto_208888 ?auto_208896 ) ) ( not ( = ?auto_208888 ?auto_208897 ) ) ( not ( = ?auto_208888 ?auto_208898 ) ) ( not ( = ?auto_208889 ?auto_208890 ) ) ( not ( = ?auto_208889 ?auto_208891 ) ) ( not ( = ?auto_208889 ?auto_208892 ) ) ( not ( = ?auto_208889 ?auto_208893 ) ) ( not ( = ?auto_208889 ?auto_208894 ) ) ( not ( = ?auto_208889 ?auto_208895 ) ) ( not ( = ?auto_208889 ?auto_208896 ) ) ( not ( = ?auto_208889 ?auto_208897 ) ) ( not ( = ?auto_208889 ?auto_208898 ) ) ( not ( = ?auto_208890 ?auto_208891 ) ) ( not ( = ?auto_208890 ?auto_208892 ) ) ( not ( = ?auto_208890 ?auto_208893 ) ) ( not ( = ?auto_208890 ?auto_208894 ) ) ( not ( = ?auto_208890 ?auto_208895 ) ) ( not ( = ?auto_208890 ?auto_208896 ) ) ( not ( = ?auto_208890 ?auto_208897 ) ) ( not ( = ?auto_208890 ?auto_208898 ) ) ( not ( = ?auto_208891 ?auto_208892 ) ) ( not ( = ?auto_208891 ?auto_208893 ) ) ( not ( = ?auto_208891 ?auto_208894 ) ) ( not ( = ?auto_208891 ?auto_208895 ) ) ( not ( = ?auto_208891 ?auto_208896 ) ) ( not ( = ?auto_208891 ?auto_208897 ) ) ( not ( = ?auto_208891 ?auto_208898 ) ) ( not ( = ?auto_208892 ?auto_208893 ) ) ( not ( = ?auto_208892 ?auto_208894 ) ) ( not ( = ?auto_208892 ?auto_208895 ) ) ( not ( = ?auto_208892 ?auto_208896 ) ) ( not ( = ?auto_208892 ?auto_208897 ) ) ( not ( = ?auto_208892 ?auto_208898 ) ) ( not ( = ?auto_208893 ?auto_208894 ) ) ( not ( = ?auto_208893 ?auto_208895 ) ) ( not ( = ?auto_208893 ?auto_208896 ) ) ( not ( = ?auto_208893 ?auto_208897 ) ) ( not ( = ?auto_208893 ?auto_208898 ) ) ( not ( = ?auto_208894 ?auto_208895 ) ) ( not ( = ?auto_208894 ?auto_208896 ) ) ( not ( = ?auto_208894 ?auto_208897 ) ) ( not ( = ?auto_208894 ?auto_208898 ) ) ( not ( = ?auto_208895 ?auto_208896 ) ) ( not ( = ?auto_208895 ?auto_208897 ) ) ( not ( = ?auto_208895 ?auto_208898 ) ) ( not ( = ?auto_208896 ?auto_208897 ) ) ( not ( = ?auto_208896 ?auto_208898 ) ) ( not ( = ?auto_208897 ?auto_208898 ) ) ( ON ?auto_208896 ?auto_208897 ) ( ON ?auto_208895 ?auto_208896 ) ( ON ?auto_208894 ?auto_208895 ) ( ON ?auto_208893 ?auto_208894 ) ( ON ?auto_208892 ?auto_208893 ) ( ON ?auto_208891 ?auto_208892 ) ( ON ?auto_208890 ?auto_208891 ) ( ON ?auto_208889 ?auto_208890 ) ( ON ?auto_208888 ?auto_208889 ) ( ON ?auto_208887 ?auto_208888 ) ( ON ?auto_208886 ?auto_208887 ) ( ON ?auto_208885 ?auto_208886 ) ( CLEAR ?auto_208885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_208885 )
      ( MAKE-13PILE ?auto_208885 ?auto_208886 ?auto_208887 ?auto_208888 ?auto_208889 ?auto_208890 ?auto_208891 ?auto_208892 ?auto_208893 ?auto_208894 ?auto_208895 ?auto_208896 ?auto_208897 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208912 - BLOCK
      ?auto_208913 - BLOCK
      ?auto_208914 - BLOCK
      ?auto_208915 - BLOCK
      ?auto_208916 - BLOCK
      ?auto_208917 - BLOCK
      ?auto_208918 - BLOCK
      ?auto_208919 - BLOCK
      ?auto_208920 - BLOCK
      ?auto_208921 - BLOCK
      ?auto_208922 - BLOCK
      ?auto_208923 - BLOCK
      ?auto_208924 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208924 ) ( not ( = ?auto_208912 ?auto_208913 ) ) ( not ( = ?auto_208912 ?auto_208914 ) ) ( not ( = ?auto_208912 ?auto_208915 ) ) ( not ( = ?auto_208912 ?auto_208916 ) ) ( not ( = ?auto_208912 ?auto_208917 ) ) ( not ( = ?auto_208912 ?auto_208918 ) ) ( not ( = ?auto_208912 ?auto_208919 ) ) ( not ( = ?auto_208912 ?auto_208920 ) ) ( not ( = ?auto_208912 ?auto_208921 ) ) ( not ( = ?auto_208912 ?auto_208922 ) ) ( not ( = ?auto_208912 ?auto_208923 ) ) ( not ( = ?auto_208912 ?auto_208924 ) ) ( not ( = ?auto_208913 ?auto_208914 ) ) ( not ( = ?auto_208913 ?auto_208915 ) ) ( not ( = ?auto_208913 ?auto_208916 ) ) ( not ( = ?auto_208913 ?auto_208917 ) ) ( not ( = ?auto_208913 ?auto_208918 ) ) ( not ( = ?auto_208913 ?auto_208919 ) ) ( not ( = ?auto_208913 ?auto_208920 ) ) ( not ( = ?auto_208913 ?auto_208921 ) ) ( not ( = ?auto_208913 ?auto_208922 ) ) ( not ( = ?auto_208913 ?auto_208923 ) ) ( not ( = ?auto_208913 ?auto_208924 ) ) ( not ( = ?auto_208914 ?auto_208915 ) ) ( not ( = ?auto_208914 ?auto_208916 ) ) ( not ( = ?auto_208914 ?auto_208917 ) ) ( not ( = ?auto_208914 ?auto_208918 ) ) ( not ( = ?auto_208914 ?auto_208919 ) ) ( not ( = ?auto_208914 ?auto_208920 ) ) ( not ( = ?auto_208914 ?auto_208921 ) ) ( not ( = ?auto_208914 ?auto_208922 ) ) ( not ( = ?auto_208914 ?auto_208923 ) ) ( not ( = ?auto_208914 ?auto_208924 ) ) ( not ( = ?auto_208915 ?auto_208916 ) ) ( not ( = ?auto_208915 ?auto_208917 ) ) ( not ( = ?auto_208915 ?auto_208918 ) ) ( not ( = ?auto_208915 ?auto_208919 ) ) ( not ( = ?auto_208915 ?auto_208920 ) ) ( not ( = ?auto_208915 ?auto_208921 ) ) ( not ( = ?auto_208915 ?auto_208922 ) ) ( not ( = ?auto_208915 ?auto_208923 ) ) ( not ( = ?auto_208915 ?auto_208924 ) ) ( not ( = ?auto_208916 ?auto_208917 ) ) ( not ( = ?auto_208916 ?auto_208918 ) ) ( not ( = ?auto_208916 ?auto_208919 ) ) ( not ( = ?auto_208916 ?auto_208920 ) ) ( not ( = ?auto_208916 ?auto_208921 ) ) ( not ( = ?auto_208916 ?auto_208922 ) ) ( not ( = ?auto_208916 ?auto_208923 ) ) ( not ( = ?auto_208916 ?auto_208924 ) ) ( not ( = ?auto_208917 ?auto_208918 ) ) ( not ( = ?auto_208917 ?auto_208919 ) ) ( not ( = ?auto_208917 ?auto_208920 ) ) ( not ( = ?auto_208917 ?auto_208921 ) ) ( not ( = ?auto_208917 ?auto_208922 ) ) ( not ( = ?auto_208917 ?auto_208923 ) ) ( not ( = ?auto_208917 ?auto_208924 ) ) ( not ( = ?auto_208918 ?auto_208919 ) ) ( not ( = ?auto_208918 ?auto_208920 ) ) ( not ( = ?auto_208918 ?auto_208921 ) ) ( not ( = ?auto_208918 ?auto_208922 ) ) ( not ( = ?auto_208918 ?auto_208923 ) ) ( not ( = ?auto_208918 ?auto_208924 ) ) ( not ( = ?auto_208919 ?auto_208920 ) ) ( not ( = ?auto_208919 ?auto_208921 ) ) ( not ( = ?auto_208919 ?auto_208922 ) ) ( not ( = ?auto_208919 ?auto_208923 ) ) ( not ( = ?auto_208919 ?auto_208924 ) ) ( not ( = ?auto_208920 ?auto_208921 ) ) ( not ( = ?auto_208920 ?auto_208922 ) ) ( not ( = ?auto_208920 ?auto_208923 ) ) ( not ( = ?auto_208920 ?auto_208924 ) ) ( not ( = ?auto_208921 ?auto_208922 ) ) ( not ( = ?auto_208921 ?auto_208923 ) ) ( not ( = ?auto_208921 ?auto_208924 ) ) ( not ( = ?auto_208922 ?auto_208923 ) ) ( not ( = ?auto_208922 ?auto_208924 ) ) ( not ( = ?auto_208923 ?auto_208924 ) ) ( ON ?auto_208923 ?auto_208924 ) ( ON ?auto_208922 ?auto_208923 ) ( ON ?auto_208921 ?auto_208922 ) ( ON ?auto_208920 ?auto_208921 ) ( ON ?auto_208919 ?auto_208920 ) ( ON ?auto_208918 ?auto_208919 ) ( ON ?auto_208917 ?auto_208918 ) ( ON ?auto_208916 ?auto_208917 ) ( ON ?auto_208915 ?auto_208916 ) ( ON ?auto_208914 ?auto_208915 ) ( ON ?auto_208913 ?auto_208914 ) ( ON ?auto_208912 ?auto_208913 ) ( CLEAR ?auto_208912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_208912 )
      ( MAKE-13PILE ?auto_208912 ?auto_208913 ?auto_208914 ?auto_208915 ?auto_208916 ?auto_208917 ?auto_208918 ?auto_208919 ?auto_208920 ?auto_208921 ?auto_208922 ?auto_208923 ?auto_208924 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208938 - BLOCK
      ?auto_208939 - BLOCK
      ?auto_208940 - BLOCK
      ?auto_208941 - BLOCK
      ?auto_208942 - BLOCK
      ?auto_208943 - BLOCK
      ?auto_208944 - BLOCK
      ?auto_208945 - BLOCK
      ?auto_208946 - BLOCK
      ?auto_208947 - BLOCK
      ?auto_208948 - BLOCK
      ?auto_208949 - BLOCK
      ?auto_208950 - BLOCK
    )
    :vars
    (
      ?auto_208951 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208938 ?auto_208939 ) ) ( not ( = ?auto_208938 ?auto_208940 ) ) ( not ( = ?auto_208938 ?auto_208941 ) ) ( not ( = ?auto_208938 ?auto_208942 ) ) ( not ( = ?auto_208938 ?auto_208943 ) ) ( not ( = ?auto_208938 ?auto_208944 ) ) ( not ( = ?auto_208938 ?auto_208945 ) ) ( not ( = ?auto_208938 ?auto_208946 ) ) ( not ( = ?auto_208938 ?auto_208947 ) ) ( not ( = ?auto_208938 ?auto_208948 ) ) ( not ( = ?auto_208938 ?auto_208949 ) ) ( not ( = ?auto_208938 ?auto_208950 ) ) ( not ( = ?auto_208939 ?auto_208940 ) ) ( not ( = ?auto_208939 ?auto_208941 ) ) ( not ( = ?auto_208939 ?auto_208942 ) ) ( not ( = ?auto_208939 ?auto_208943 ) ) ( not ( = ?auto_208939 ?auto_208944 ) ) ( not ( = ?auto_208939 ?auto_208945 ) ) ( not ( = ?auto_208939 ?auto_208946 ) ) ( not ( = ?auto_208939 ?auto_208947 ) ) ( not ( = ?auto_208939 ?auto_208948 ) ) ( not ( = ?auto_208939 ?auto_208949 ) ) ( not ( = ?auto_208939 ?auto_208950 ) ) ( not ( = ?auto_208940 ?auto_208941 ) ) ( not ( = ?auto_208940 ?auto_208942 ) ) ( not ( = ?auto_208940 ?auto_208943 ) ) ( not ( = ?auto_208940 ?auto_208944 ) ) ( not ( = ?auto_208940 ?auto_208945 ) ) ( not ( = ?auto_208940 ?auto_208946 ) ) ( not ( = ?auto_208940 ?auto_208947 ) ) ( not ( = ?auto_208940 ?auto_208948 ) ) ( not ( = ?auto_208940 ?auto_208949 ) ) ( not ( = ?auto_208940 ?auto_208950 ) ) ( not ( = ?auto_208941 ?auto_208942 ) ) ( not ( = ?auto_208941 ?auto_208943 ) ) ( not ( = ?auto_208941 ?auto_208944 ) ) ( not ( = ?auto_208941 ?auto_208945 ) ) ( not ( = ?auto_208941 ?auto_208946 ) ) ( not ( = ?auto_208941 ?auto_208947 ) ) ( not ( = ?auto_208941 ?auto_208948 ) ) ( not ( = ?auto_208941 ?auto_208949 ) ) ( not ( = ?auto_208941 ?auto_208950 ) ) ( not ( = ?auto_208942 ?auto_208943 ) ) ( not ( = ?auto_208942 ?auto_208944 ) ) ( not ( = ?auto_208942 ?auto_208945 ) ) ( not ( = ?auto_208942 ?auto_208946 ) ) ( not ( = ?auto_208942 ?auto_208947 ) ) ( not ( = ?auto_208942 ?auto_208948 ) ) ( not ( = ?auto_208942 ?auto_208949 ) ) ( not ( = ?auto_208942 ?auto_208950 ) ) ( not ( = ?auto_208943 ?auto_208944 ) ) ( not ( = ?auto_208943 ?auto_208945 ) ) ( not ( = ?auto_208943 ?auto_208946 ) ) ( not ( = ?auto_208943 ?auto_208947 ) ) ( not ( = ?auto_208943 ?auto_208948 ) ) ( not ( = ?auto_208943 ?auto_208949 ) ) ( not ( = ?auto_208943 ?auto_208950 ) ) ( not ( = ?auto_208944 ?auto_208945 ) ) ( not ( = ?auto_208944 ?auto_208946 ) ) ( not ( = ?auto_208944 ?auto_208947 ) ) ( not ( = ?auto_208944 ?auto_208948 ) ) ( not ( = ?auto_208944 ?auto_208949 ) ) ( not ( = ?auto_208944 ?auto_208950 ) ) ( not ( = ?auto_208945 ?auto_208946 ) ) ( not ( = ?auto_208945 ?auto_208947 ) ) ( not ( = ?auto_208945 ?auto_208948 ) ) ( not ( = ?auto_208945 ?auto_208949 ) ) ( not ( = ?auto_208945 ?auto_208950 ) ) ( not ( = ?auto_208946 ?auto_208947 ) ) ( not ( = ?auto_208946 ?auto_208948 ) ) ( not ( = ?auto_208946 ?auto_208949 ) ) ( not ( = ?auto_208946 ?auto_208950 ) ) ( not ( = ?auto_208947 ?auto_208948 ) ) ( not ( = ?auto_208947 ?auto_208949 ) ) ( not ( = ?auto_208947 ?auto_208950 ) ) ( not ( = ?auto_208948 ?auto_208949 ) ) ( not ( = ?auto_208948 ?auto_208950 ) ) ( not ( = ?auto_208949 ?auto_208950 ) ) ( ON ?auto_208938 ?auto_208951 ) ( not ( = ?auto_208950 ?auto_208951 ) ) ( not ( = ?auto_208949 ?auto_208951 ) ) ( not ( = ?auto_208948 ?auto_208951 ) ) ( not ( = ?auto_208947 ?auto_208951 ) ) ( not ( = ?auto_208946 ?auto_208951 ) ) ( not ( = ?auto_208945 ?auto_208951 ) ) ( not ( = ?auto_208944 ?auto_208951 ) ) ( not ( = ?auto_208943 ?auto_208951 ) ) ( not ( = ?auto_208942 ?auto_208951 ) ) ( not ( = ?auto_208941 ?auto_208951 ) ) ( not ( = ?auto_208940 ?auto_208951 ) ) ( not ( = ?auto_208939 ?auto_208951 ) ) ( not ( = ?auto_208938 ?auto_208951 ) ) ( ON ?auto_208939 ?auto_208938 ) ( ON ?auto_208940 ?auto_208939 ) ( ON ?auto_208941 ?auto_208940 ) ( ON ?auto_208942 ?auto_208941 ) ( ON ?auto_208943 ?auto_208942 ) ( ON ?auto_208944 ?auto_208943 ) ( ON ?auto_208945 ?auto_208944 ) ( ON ?auto_208946 ?auto_208945 ) ( ON ?auto_208947 ?auto_208946 ) ( ON ?auto_208948 ?auto_208947 ) ( ON ?auto_208949 ?auto_208948 ) ( ON ?auto_208950 ?auto_208949 ) ( CLEAR ?auto_208950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_208950 ?auto_208949 ?auto_208948 ?auto_208947 ?auto_208946 ?auto_208945 ?auto_208944 ?auto_208943 ?auto_208942 ?auto_208941 ?auto_208940 ?auto_208939 ?auto_208938 )
      ( MAKE-13PILE ?auto_208938 ?auto_208939 ?auto_208940 ?auto_208941 ?auto_208942 ?auto_208943 ?auto_208944 ?auto_208945 ?auto_208946 ?auto_208947 ?auto_208948 ?auto_208949 ?auto_208950 ) )
  )

)

