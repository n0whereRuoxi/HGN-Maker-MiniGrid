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
      ?auto_169484 - BLOCK
    )
    :vars
    (
      ?auto_169485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169484 ?auto_169485 ) ( CLEAR ?auto_169484 ) ( HAND-EMPTY ) ( not ( = ?auto_169484 ?auto_169485 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169484 ?auto_169485 )
      ( !PUTDOWN ?auto_169484 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_169491 - BLOCK
      ?auto_169492 - BLOCK
    )
    :vars
    (
      ?auto_169493 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_169491 ) ( ON ?auto_169492 ?auto_169493 ) ( CLEAR ?auto_169492 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169491 ) ( not ( = ?auto_169491 ?auto_169492 ) ) ( not ( = ?auto_169491 ?auto_169493 ) ) ( not ( = ?auto_169492 ?auto_169493 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169492 ?auto_169493 )
      ( !STACK ?auto_169492 ?auto_169491 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_169501 - BLOCK
      ?auto_169502 - BLOCK
    )
    :vars
    (
      ?auto_169503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169502 ?auto_169503 ) ( not ( = ?auto_169501 ?auto_169502 ) ) ( not ( = ?auto_169501 ?auto_169503 ) ) ( not ( = ?auto_169502 ?auto_169503 ) ) ( ON ?auto_169501 ?auto_169502 ) ( CLEAR ?auto_169501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169501 )
      ( MAKE-2PILE ?auto_169501 ?auto_169502 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169512 - BLOCK
      ?auto_169513 - BLOCK
      ?auto_169514 - BLOCK
    )
    :vars
    (
      ?auto_169515 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_169513 ) ( ON ?auto_169514 ?auto_169515 ) ( CLEAR ?auto_169514 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169512 ) ( ON ?auto_169513 ?auto_169512 ) ( not ( = ?auto_169512 ?auto_169513 ) ) ( not ( = ?auto_169512 ?auto_169514 ) ) ( not ( = ?auto_169512 ?auto_169515 ) ) ( not ( = ?auto_169513 ?auto_169514 ) ) ( not ( = ?auto_169513 ?auto_169515 ) ) ( not ( = ?auto_169514 ?auto_169515 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169514 ?auto_169515 )
      ( !STACK ?auto_169514 ?auto_169513 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169526 - BLOCK
      ?auto_169527 - BLOCK
      ?auto_169528 - BLOCK
    )
    :vars
    (
      ?auto_169529 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169528 ?auto_169529 ) ( ON-TABLE ?auto_169526 ) ( not ( = ?auto_169526 ?auto_169527 ) ) ( not ( = ?auto_169526 ?auto_169528 ) ) ( not ( = ?auto_169526 ?auto_169529 ) ) ( not ( = ?auto_169527 ?auto_169528 ) ) ( not ( = ?auto_169527 ?auto_169529 ) ) ( not ( = ?auto_169528 ?auto_169529 ) ) ( CLEAR ?auto_169526 ) ( ON ?auto_169527 ?auto_169528 ) ( CLEAR ?auto_169527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169526 ?auto_169527 )
      ( MAKE-3PILE ?auto_169526 ?auto_169527 ?auto_169528 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169540 - BLOCK
      ?auto_169541 - BLOCK
      ?auto_169542 - BLOCK
    )
    :vars
    (
      ?auto_169543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169542 ?auto_169543 ) ( not ( = ?auto_169540 ?auto_169541 ) ) ( not ( = ?auto_169540 ?auto_169542 ) ) ( not ( = ?auto_169540 ?auto_169543 ) ) ( not ( = ?auto_169541 ?auto_169542 ) ) ( not ( = ?auto_169541 ?auto_169543 ) ) ( not ( = ?auto_169542 ?auto_169543 ) ) ( ON ?auto_169541 ?auto_169542 ) ( ON ?auto_169540 ?auto_169541 ) ( CLEAR ?auto_169540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169540 )
      ( MAKE-3PILE ?auto_169540 ?auto_169541 ?auto_169542 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169555 - BLOCK
      ?auto_169556 - BLOCK
      ?auto_169557 - BLOCK
      ?auto_169558 - BLOCK
    )
    :vars
    (
      ?auto_169559 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_169557 ) ( ON ?auto_169558 ?auto_169559 ) ( CLEAR ?auto_169558 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169555 ) ( ON ?auto_169556 ?auto_169555 ) ( ON ?auto_169557 ?auto_169556 ) ( not ( = ?auto_169555 ?auto_169556 ) ) ( not ( = ?auto_169555 ?auto_169557 ) ) ( not ( = ?auto_169555 ?auto_169558 ) ) ( not ( = ?auto_169555 ?auto_169559 ) ) ( not ( = ?auto_169556 ?auto_169557 ) ) ( not ( = ?auto_169556 ?auto_169558 ) ) ( not ( = ?auto_169556 ?auto_169559 ) ) ( not ( = ?auto_169557 ?auto_169558 ) ) ( not ( = ?auto_169557 ?auto_169559 ) ) ( not ( = ?auto_169558 ?auto_169559 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169558 ?auto_169559 )
      ( !STACK ?auto_169558 ?auto_169557 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169573 - BLOCK
      ?auto_169574 - BLOCK
      ?auto_169575 - BLOCK
      ?auto_169576 - BLOCK
    )
    :vars
    (
      ?auto_169577 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169576 ?auto_169577 ) ( ON-TABLE ?auto_169573 ) ( ON ?auto_169574 ?auto_169573 ) ( not ( = ?auto_169573 ?auto_169574 ) ) ( not ( = ?auto_169573 ?auto_169575 ) ) ( not ( = ?auto_169573 ?auto_169576 ) ) ( not ( = ?auto_169573 ?auto_169577 ) ) ( not ( = ?auto_169574 ?auto_169575 ) ) ( not ( = ?auto_169574 ?auto_169576 ) ) ( not ( = ?auto_169574 ?auto_169577 ) ) ( not ( = ?auto_169575 ?auto_169576 ) ) ( not ( = ?auto_169575 ?auto_169577 ) ) ( not ( = ?auto_169576 ?auto_169577 ) ) ( CLEAR ?auto_169574 ) ( ON ?auto_169575 ?auto_169576 ) ( CLEAR ?auto_169575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169573 ?auto_169574 ?auto_169575 )
      ( MAKE-4PILE ?auto_169573 ?auto_169574 ?auto_169575 ?auto_169576 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169591 - BLOCK
      ?auto_169592 - BLOCK
      ?auto_169593 - BLOCK
      ?auto_169594 - BLOCK
    )
    :vars
    (
      ?auto_169595 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169594 ?auto_169595 ) ( ON-TABLE ?auto_169591 ) ( not ( = ?auto_169591 ?auto_169592 ) ) ( not ( = ?auto_169591 ?auto_169593 ) ) ( not ( = ?auto_169591 ?auto_169594 ) ) ( not ( = ?auto_169591 ?auto_169595 ) ) ( not ( = ?auto_169592 ?auto_169593 ) ) ( not ( = ?auto_169592 ?auto_169594 ) ) ( not ( = ?auto_169592 ?auto_169595 ) ) ( not ( = ?auto_169593 ?auto_169594 ) ) ( not ( = ?auto_169593 ?auto_169595 ) ) ( not ( = ?auto_169594 ?auto_169595 ) ) ( ON ?auto_169593 ?auto_169594 ) ( CLEAR ?auto_169591 ) ( ON ?auto_169592 ?auto_169593 ) ( CLEAR ?auto_169592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169591 ?auto_169592 )
      ( MAKE-4PILE ?auto_169591 ?auto_169592 ?auto_169593 ?auto_169594 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169609 - BLOCK
      ?auto_169610 - BLOCK
      ?auto_169611 - BLOCK
      ?auto_169612 - BLOCK
    )
    :vars
    (
      ?auto_169613 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169612 ?auto_169613 ) ( not ( = ?auto_169609 ?auto_169610 ) ) ( not ( = ?auto_169609 ?auto_169611 ) ) ( not ( = ?auto_169609 ?auto_169612 ) ) ( not ( = ?auto_169609 ?auto_169613 ) ) ( not ( = ?auto_169610 ?auto_169611 ) ) ( not ( = ?auto_169610 ?auto_169612 ) ) ( not ( = ?auto_169610 ?auto_169613 ) ) ( not ( = ?auto_169611 ?auto_169612 ) ) ( not ( = ?auto_169611 ?auto_169613 ) ) ( not ( = ?auto_169612 ?auto_169613 ) ) ( ON ?auto_169611 ?auto_169612 ) ( ON ?auto_169610 ?auto_169611 ) ( ON ?auto_169609 ?auto_169610 ) ( CLEAR ?auto_169609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169609 )
      ( MAKE-4PILE ?auto_169609 ?auto_169610 ?auto_169611 ?auto_169612 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169628 - BLOCK
      ?auto_169629 - BLOCK
      ?auto_169630 - BLOCK
      ?auto_169631 - BLOCK
      ?auto_169632 - BLOCK
    )
    :vars
    (
      ?auto_169633 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_169631 ) ( ON ?auto_169632 ?auto_169633 ) ( CLEAR ?auto_169632 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169628 ) ( ON ?auto_169629 ?auto_169628 ) ( ON ?auto_169630 ?auto_169629 ) ( ON ?auto_169631 ?auto_169630 ) ( not ( = ?auto_169628 ?auto_169629 ) ) ( not ( = ?auto_169628 ?auto_169630 ) ) ( not ( = ?auto_169628 ?auto_169631 ) ) ( not ( = ?auto_169628 ?auto_169632 ) ) ( not ( = ?auto_169628 ?auto_169633 ) ) ( not ( = ?auto_169629 ?auto_169630 ) ) ( not ( = ?auto_169629 ?auto_169631 ) ) ( not ( = ?auto_169629 ?auto_169632 ) ) ( not ( = ?auto_169629 ?auto_169633 ) ) ( not ( = ?auto_169630 ?auto_169631 ) ) ( not ( = ?auto_169630 ?auto_169632 ) ) ( not ( = ?auto_169630 ?auto_169633 ) ) ( not ( = ?auto_169631 ?auto_169632 ) ) ( not ( = ?auto_169631 ?auto_169633 ) ) ( not ( = ?auto_169632 ?auto_169633 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169632 ?auto_169633 )
      ( !STACK ?auto_169632 ?auto_169631 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169650 - BLOCK
      ?auto_169651 - BLOCK
      ?auto_169652 - BLOCK
      ?auto_169653 - BLOCK
      ?auto_169654 - BLOCK
    )
    :vars
    (
      ?auto_169655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169654 ?auto_169655 ) ( ON-TABLE ?auto_169650 ) ( ON ?auto_169651 ?auto_169650 ) ( ON ?auto_169652 ?auto_169651 ) ( not ( = ?auto_169650 ?auto_169651 ) ) ( not ( = ?auto_169650 ?auto_169652 ) ) ( not ( = ?auto_169650 ?auto_169653 ) ) ( not ( = ?auto_169650 ?auto_169654 ) ) ( not ( = ?auto_169650 ?auto_169655 ) ) ( not ( = ?auto_169651 ?auto_169652 ) ) ( not ( = ?auto_169651 ?auto_169653 ) ) ( not ( = ?auto_169651 ?auto_169654 ) ) ( not ( = ?auto_169651 ?auto_169655 ) ) ( not ( = ?auto_169652 ?auto_169653 ) ) ( not ( = ?auto_169652 ?auto_169654 ) ) ( not ( = ?auto_169652 ?auto_169655 ) ) ( not ( = ?auto_169653 ?auto_169654 ) ) ( not ( = ?auto_169653 ?auto_169655 ) ) ( not ( = ?auto_169654 ?auto_169655 ) ) ( CLEAR ?auto_169652 ) ( ON ?auto_169653 ?auto_169654 ) ( CLEAR ?auto_169653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169650 ?auto_169651 ?auto_169652 ?auto_169653 )
      ( MAKE-5PILE ?auto_169650 ?auto_169651 ?auto_169652 ?auto_169653 ?auto_169654 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169672 - BLOCK
      ?auto_169673 - BLOCK
      ?auto_169674 - BLOCK
      ?auto_169675 - BLOCK
      ?auto_169676 - BLOCK
    )
    :vars
    (
      ?auto_169677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169676 ?auto_169677 ) ( ON-TABLE ?auto_169672 ) ( ON ?auto_169673 ?auto_169672 ) ( not ( = ?auto_169672 ?auto_169673 ) ) ( not ( = ?auto_169672 ?auto_169674 ) ) ( not ( = ?auto_169672 ?auto_169675 ) ) ( not ( = ?auto_169672 ?auto_169676 ) ) ( not ( = ?auto_169672 ?auto_169677 ) ) ( not ( = ?auto_169673 ?auto_169674 ) ) ( not ( = ?auto_169673 ?auto_169675 ) ) ( not ( = ?auto_169673 ?auto_169676 ) ) ( not ( = ?auto_169673 ?auto_169677 ) ) ( not ( = ?auto_169674 ?auto_169675 ) ) ( not ( = ?auto_169674 ?auto_169676 ) ) ( not ( = ?auto_169674 ?auto_169677 ) ) ( not ( = ?auto_169675 ?auto_169676 ) ) ( not ( = ?auto_169675 ?auto_169677 ) ) ( not ( = ?auto_169676 ?auto_169677 ) ) ( ON ?auto_169675 ?auto_169676 ) ( CLEAR ?auto_169673 ) ( ON ?auto_169674 ?auto_169675 ) ( CLEAR ?auto_169674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169672 ?auto_169673 ?auto_169674 )
      ( MAKE-5PILE ?auto_169672 ?auto_169673 ?auto_169674 ?auto_169675 ?auto_169676 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169694 - BLOCK
      ?auto_169695 - BLOCK
      ?auto_169696 - BLOCK
      ?auto_169697 - BLOCK
      ?auto_169698 - BLOCK
    )
    :vars
    (
      ?auto_169699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169698 ?auto_169699 ) ( ON-TABLE ?auto_169694 ) ( not ( = ?auto_169694 ?auto_169695 ) ) ( not ( = ?auto_169694 ?auto_169696 ) ) ( not ( = ?auto_169694 ?auto_169697 ) ) ( not ( = ?auto_169694 ?auto_169698 ) ) ( not ( = ?auto_169694 ?auto_169699 ) ) ( not ( = ?auto_169695 ?auto_169696 ) ) ( not ( = ?auto_169695 ?auto_169697 ) ) ( not ( = ?auto_169695 ?auto_169698 ) ) ( not ( = ?auto_169695 ?auto_169699 ) ) ( not ( = ?auto_169696 ?auto_169697 ) ) ( not ( = ?auto_169696 ?auto_169698 ) ) ( not ( = ?auto_169696 ?auto_169699 ) ) ( not ( = ?auto_169697 ?auto_169698 ) ) ( not ( = ?auto_169697 ?auto_169699 ) ) ( not ( = ?auto_169698 ?auto_169699 ) ) ( ON ?auto_169697 ?auto_169698 ) ( ON ?auto_169696 ?auto_169697 ) ( CLEAR ?auto_169694 ) ( ON ?auto_169695 ?auto_169696 ) ( CLEAR ?auto_169695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169694 ?auto_169695 )
      ( MAKE-5PILE ?auto_169694 ?auto_169695 ?auto_169696 ?auto_169697 ?auto_169698 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169716 - BLOCK
      ?auto_169717 - BLOCK
      ?auto_169718 - BLOCK
      ?auto_169719 - BLOCK
      ?auto_169720 - BLOCK
    )
    :vars
    (
      ?auto_169721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169720 ?auto_169721 ) ( not ( = ?auto_169716 ?auto_169717 ) ) ( not ( = ?auto_169716 ?auto_169718 ) ) ( not ( = ?auto_169716 ?auto_169719 ) ) ( not ( = ?auto_169716 ?auto_169720 ) ) ( not ( = ?auto_169716 ?auto_169721 ) ) ( not ( = ?auto_169717 ?auto_169718 ) ) ( not ( = ?auto_169717 ?auto_169719 ) ) ( not ( = ?auto_169717 ?auto_169720 ) ) ( not ( = ?auto_169717 ?auto_169721 ) ) ( not ( = ?auto_169718 ?auto_169719 ) ) ( not ( = ?auto_169718 ?auto_169720 ) ) ( not ( = ?auto_169718 ?auto_169721 ) ) ( not ( = ?auto_169719 ?auto_169720 ) ) ( not ( = ?auto_169719 ?auto_169721 ) ) ( not ( = ?auto_169720 ?auto_169721 ) ) ( ON ?auto_169719 ?auto_169720 ) ( ON ?auto_169718 ?auto_169719 ) ( ON ?auto_169717 ?auto_169718 ) ( ON ?auto_169716 ?auto_169717 ) ( CLEAR ?auto_169716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169716 )
      ( MAKE-5PILE ?auto_169716 ?auto_169717 ?auto_169718 ?auto_169719 ?auto_169720 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169739 - BLOCK
      ?auto_169740 - BLOCK
      ?auto_169741 - BLOCK
      ?auto_169742 - BLOCK
      ?auto_169743 - BLOCK
      ?auto_169744 - BLOCK
    )
    :vars
    (
      ?auto_169745 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_169743 ) ( ON ?auto_169744 ?auto_169745 ) ( CLEAR ?auto_169744 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169739 ) ( ON ?auto_169740 ?auto_169739 ) ( ON ?auto_169741 ?auto_169740 ) ( ON ?auto_169742 ?auto_169741 ) ( ON ?auto_169743 ?auto_169742 ) ( not ( = ?auto_169739 ?auto_169740 ) ) ( not ( = ?auto_169739 ?auto_169741 ) ) ( not ( = ?auto_169739 ?auto_169742 ) ) ( not ( = ?auto_169739 ?auto_169743 ) ) ( not ( = ?auto_169739 ?auto_169744 ) ) ( not ( = ?auto_169739 ?auto_169745 ) ) ( not ( = ?auto_169740 ?auto_169741 ) ) ( not ( = ?auto_169740 ?auto_169742 ) ) ( not ( = ?auto_169740 ?auto_169743 ) ) ( not ( = ?auto_169740 ?auto_169744 ) ) ( not ( = ?auto_169740 ?auto_169745 ) ) ( not ( = ?auto_169741 ?auto_169742 ) ) ( not ( = ?auto_169741 ?auto_169743 ) ) ( not ( = ?auto_169741 ?auto_169744 ) ) ( not ( = ?auto_169741 ?auto_169745 ) ) ( not ( = ?auto_169742 ?auto_169743 ) ) ( not ( = ?auto_169742 ?auto_169744 ) ) ( not ( = ?auto_169742 ?auto_169745 ) ) ( not ( = ?auto_169743 ?auto_169744 ) ) ( not ( = ?auto_169743 ?auto_169745 ) ) ( not ( = ?auto_169744 ?auto_169745 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169744 ?auto_169745 )
      ( !STACK ?auto_169744 ?auto_169743 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169765 - BLOCK
      ?auto_169766 - BLOCK
      ?auto_169767 - BLOCK
      ?auto_169768 - BLOCK
      ?auto_169769 - BLOCK
      ?auto_169770 - BLOCK
    )
    :vars
    (
      ?auto_169771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169770 ?auto_169771 ) ( ON-TABLE ?auto_169765 ) ( ON ?auto_169766 ?auto_169765 ) ( ON ?auto_169767 ?auto_169766 ) ( ON ?auto_169768 ?auto_169767 ) ( not ( = ?auto_169765 ?auto_169766 ) ) ( not ( = ?auto_169765 ?auto_169767 ) ) ( not ( = ?auto_169765 ?auto_169768 ) ) ( not ( = ?auto_169765 ?auto_169769 ) ) ( not ( = ?auto_169765 ?auto_169770 ) ) ( not ( = ?auto_169765 ?auto_169771 ) ) ( not ( = ?auto_169766 ?auto_169767 ) ) ( not ( = ?auto_169766 ?auto_169768 ) ) ( not ( = ?auto_169766 ?auto_169769 ) ) ( not ( = ?auto_169766 ?auto_169770 ) ) ( not ( = ?auto_169766 ?auto_169771 ) ) ( not ( = ?auto_169767 ?auto_169768 ) ) ( not ( = ?auto_169767 ?auto_169769 ) ) ( not ( = ?auto_169767 ?auto_169770 ) ) ( not ( = ?auto_169767 ?auto_169771 ) ) ( not ( = ?auto_169768 ?auto_169769 ) ) ( not ( = ?auto_169768 ?auto_169770 ) ) ( not ( = ?auto_169768 ?auto_169771 ) ) ( not ( = ?auto_169769 ?auto_169770 ) ) ( not ( = ?auto_169769 ?auto_169771 ) ) ( not ( = ?auto_169770 ?auto_169771 ) ) ( CLEAR ?auto_169768 ) ( ON ?auto_169769 ?auto_169770 ) ( CLEAR ?auto_169769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_169765 ?auto_169766 ?auto_169767 ?auto_169768 ?auto_169769 )
      ( MAKE-6PILE ?auto_169765 ?auto_169766 ?auto_169767 ?auto_169768 ?auto_169769 ?auto_169770 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169791 - BLOCK
      ?auto_169792 - BLOCK
      ?auto_169793 - BLOCK
      ?auto_169794 - BLOCK
      ?auto_169795 - BLOCK
      ?auto_169796 - BLOCK
    )
    :vars
    (
      ?auto_169797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169796 ?auto_169797 ) ( ON-TABLE ?auto_169791 ) ( ON ?auto_169792 ?auto_169791 ) ( ON ?auto_169793 ?auto_169792 ) ( not ( = ?auto_169791 ?auto_169792 ) ) ( not ( = ?auto_169791 ?auto_169793 ) ) ( not ( = ?auto_169791 ?auto_169794 ) ) ( not ( = ?auto_169791 ?auto_169795 ) ) ( not ( = ?auto_169791 ?auto_169796 ) ) ( not ( = ?auto_169791 ?auto_169797 ) ) ( not ( = ?auto_169792 ?auto_169793 ) ) ( not ( = ?auto_169792 ?auto_169794 ) ) ( not ( = ?auto_169792 ?auto_169795 ) ) ( not ( = ?auto_169792 ?auto_169796 ) ) ( not ( = ?auto_169792 ?auto_169797 ) ) ( not ( = ?auto_169793 ?auto_169794 ) ) ( not ( = ?auto_169793 ?auto_169795 ) ) ( not ( = ?auto_169793 ?auto_169796 ) ) ( not ( = ?auto_169793 ?auto_169797 ) ) ( not ( = ?auto_169794 ?auto_169795 ) ) ( not ( = ?auto_169794 ?auto_169796 ) ) ( not ( = ?auto_169794 ?auto_169797 ) ) ( not ( = ?auto_169795 ?auto_169796 ) ) ( not ( = ?auto_169795 ?auto_169797 ) ) ( not ( = ?auto_169796 ?auto_169797 ) ) ( ON ?auto_169795 ?auto_169796 ) ( CLEAR ?auto_169793 ) ( ON ?auto_169794 ?auto_169795 ) ( CLEAR ?auto_169794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169791 ?auto_169792 ?auto_169793 ?auto_169794 )
      ( MAKE-6PILE ?auto_169791 ?auto_169792 ?auto_169793 ?auto_169794 ?auto_169795 ?auto_169796 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169817 - BLOCK
      ?auto_169818 - BLOCK
      ?auto_169819 - BLOCK
      ?auto_169820 - BLOCK
      ?auto_169821 - BLOCK
      ?auto_169822 - BLOCK
    )
    :vars
    (
      ?auto_169823 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169822 ?auto_169823 ) ( ON-TABLE ?auto_169817 ) ( ON ?auto_169818 ?auto_169817 ) ( not ( = ?auto_169817 ?auto_169818 ) ) ( not ( = ?auto_169817 ?auto_169819 ) ) ( not ( = ?auto_169817 ?auto_169820 ) ) ( not ( = ?auto_169817 ?auto_169821 ) ) ( not ( = ?auto_169817 ?auto_169822 ) ) ( not ( = ?auto_169817 ?auto_169823 ) ) ( not ( = ?auto_169818 ?auto_169819 ) ) ( not ( = ?auto_169818 ?auto_169820 ) ) ( not ( = ?auto_169818 ?auto_169821 ) ) ( not ( = ?auto_169818 ?auto_169822 ) ) ( not ( = ?auto_169818 ?auto_169823 ) ) ( not ( = ?auto_169819 ?auto_169820 ) ) ( not ( = ?auto_169819 ?auto_169821 ) ) ( not ( = ?auto_169819 ?auto_169822 ) ) ( not ( = ?auto_169819 ?auto_169823 ) ) ( not ( = ?auto_169820 ?auto_169821 ) ) ( not ( = ?auto_169820 ?auto_169822 ) ) ( not ( = ?auto_169820 ?auto_169823 ) ) ( not ( = ?auto_169821 ?auto_169822 ) ) ( not ( = ?auto_169821 ?auto_169823 ) ) ( not ( = ?auto_169822 ?auto_169823 ) ) ( ON ?auto_169821 ?auto_169822 ) ( ON ?auto_169820 ?auto_169821 ) ( CLEAR ?auto_169818 ) ( ON ?auto_169819 ?auto_169820 ) ( CLEAR ?auto_169819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169817 ?auto_169818 ?auto_169819 )
      ( MAKE-6PILE ?auto_169817 ?auto_169818 ?auto_169819 ?auto_169820 ?auto_169821 ?auto_169822 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169843 - BLOCK
      ?auto_169844 - BLOCK
      ?auto_169845 - BLOCK
      ?auto_169846 - BLOCK
      ?auto_169847 - BLOCK
      ?auto_169848 - BLOCK
    )
    :vars
    (
      ?auto_169849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169848 ?auto_169849 ) ( ON-TABLE ?auto_169843 ) ( not ( = ?auto_169843 ?auto_169844 ) ) ( not ( = ?auto_169843 ?auto_169845 ) ) ( not ( = ?auto_169843 ?auto_169846 ) ) ( not ( = ?auto_169843 ?auto_169847 ) ) ( not ( = ?auto_169843 ?auto_169848 ) ) ( not ( = ?auto_169843 ?auto_169849 ) ) ( not ( = ?auto_169844 ?auto_169845 ) ) ( not ( = ?auto_169844 ?auto_169846 ) ) ( not ( = ?auto_169844 ?auto_169847 ) ) ( not ( = ?auto_169844 ?auto_169848 ) ) ( not ( = ?auto_169844 ?auto_169849 ) ) ( not ( = ?auto_169845 ?auto_169846 ) ) ( not ( = ?auto_169845 ?auto_169847 ) ) ( not ( = ?auto_169845 ?auto_169848 ) ) ( not ( = ?auto_169845 ?auto_169849 ) ) ( not ( = ?auto_169846 ?auto_169847 ) ) ( not ( = ?auto_169846 ?auto_169848 ) ) ( not ( = ?auto_169846 ?auto_169849 ) ) ( not ( = ?auto_169847 ?auto_169848 ) ) ( not ( = ?auto_169847 ?auto_169849 ) ) ( not ( = ?auto_169848 ?auto_169849 ) ) ( ON ?auto_169847 ?auto_169848 ) ( ON ?auto_169846 ?auto_169847 ) ( ON ?auto_169845 ?auto_169846 ) ( CLEAR ?auto_169843 ) ( ON ?auto_169844 ?auto_169845 ) ( CLEAR ?auto_169844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169843 ?auto_169844 )
      ( MAKE-6PILE ?auto_169843 ?auto_169844 ?auto_169845 ?auto_169846 ?auto_169847 ?auto_169848 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169869 - BLOCK
      ?auto_169870 - BLOCK
      ?auto_169871 - BLOCK
      ?auto_169872 - BLOCK
      ?auto_169873 - BLOCK
      ?auto_169874 - BLOCK
    )
    :vars
    (
      ?auto_169875 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169874 ?auto_169875 ) ( not ( = ?auto_169869 ?auto_169870 ) ) ( not ( = ?auto_169869 ?auto_169871 ) ) ( not ( = ?auto_169869 ?auto_169872 ) ) ( not ( = ?auto_169869 ?auto_169873 ) ) ( not ( = ?auto_169869 ?auto_169874 ) ) ( not ( = ?auto_169869 ?auto_169875 ) ) ( not ( = ?auto_169870 ?auto_169871 ) ) ( not ( = ?auto_169870 ?auto_169872 ) ) ( not ( = ?auto_169870 ?auto_169873 ) ) ( not ( = ?auto_169870 ?auto_169874 ) ) ( not ( = ?auto_169870 ?auto_169875 ) ) ( not ( = ?auto_169871 ?auto_169872 ) ) ( not ( = ?auto_169871 ?auto_169873 ) ) ( not ( = ?auto_169871 ?auto_169874 ) ) ( not ( = ?auto_169871 ?auto_169875 ) ) ( not ( = ?auto_169872 ?auto_169873 ) ) ( not ( = ?auto_169872 ?auto_169874 ) ) ( not ( = ?auto_169872 ?auto_169875 ) ) ( not ( = ?auto_169873 ?auto_169874 ) ) ( not ( = ?auto_169873 ?auto_169875 ) ) ( not ( = ?auto_169874 ?auto_169875 ) ) ( ON ?auto_169873 ?auto_169874 ) ( ON ?auto_169872 ?auto_169873 ) ( ON ?auto_169871 ?auto_169872 ) ( ON ?auto_169870 ?auto_169871 ) ( ON ?auto_169869 ?auto_169870 ) ( CLEAR ?auto_169869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169869 )
      ( MAKE-6PILE ?auto_169869 ?auto_169870 ?auto_169871 ?auto_169872 ?auto_169873 ?auto_169874 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_169896 - BLOCK
      ?auto_169897 - BLOCK
      ?auto_169898 - BLOCK
      ?auto_169899 - BLOCK
      ?auto_169900 - BLOCK
      ?auto_169901 - BLOCK
      ?auto_169902 - BLOCK
    )
    :vars
    (
      ?auto_169903 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_169901 ) ( ON ?auto_169902 ?auto_169903 ) ( CLEAR ?auto_169902 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169896 ) ( ON ?auto_169897 ?auto_169896 ) ( ON ?auto_169898 ?auto_169897 ) ( ON ?auto_169899 ?auto_169898 ) ( ON ?auto_169900 ?auto_169899 ) ( ON ?auto_169901 ?auto_169900 ) ( not ( = ?auto_169896 ?auto_169897 ) ) ( not ( = ?auto_169896 ?auto_169898 ) ) ( not ( = ?auto_169896 ?auto_169899 ) ) ( not ( = ?auto_169896 ?auto_169900 ) ) ( not ( = ?auto_169896 ?auto_169901 ) ) ( not ( = ?auto_169896 ?auto_169902 ) ) ( not ( = ?auto_169896 ?auto_169903 ) ) ( not ( = ?auto_169897 ?auto_169898 ) ) ( not ( = ?auto_169897 ?auto_169899 ) ) ( not ( = ?auto_169897 ?auto_169900 ) ) ( not ( = ?auto_169897 ?auto_169901 ) ) ( not ( = ?auto_169897 ?auto_169902 ) ) ( not ( = ?auto_169897 ?auto_169903 ) ) ( not ( = ?auto_169898 ?auto_169899 ) ) ( not ( = ?auto_169898 ?auto_169900 ) ) ( not ( = ?auto_169898 ?auto_169901 ) ) ( not ( = ?auto_169898 ?auto_169902 ) ) ( not ( = ?auto_169898 ?auto_169903 ) ) ( not ( = ?auto_169899 ?auto_169900 ) ) ( not ( = ?auto_169899 ?auto_169901 ) ) ( not ( = ?auto_169899 ?auto_169902 ) ) ( not ( = ?auto_169899 ?auto_169903 ) ) ( not ( = ?auto_169900 ?auto_169901 ) ) ( not ( = ?auto_169900 ?auto_169902 ) ) ( not ( = ?auto_169900 ?auto_169903 ) ) ( not ( = ?auto_169901 ?auto_169902 ) ) ( not ( = ?auto_169901 ?auto_169903 ) ) ( not ( = ?auto_169902 ?auto_169903 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169902 ?auto_169903 )
      ( !STACK ?auto_169902 ?auto_169901 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_169926 - BLOCK
      ?auto_169927 - BLOCK
      ?auto_169928 - BLOCK
      ?auto_169929 - BLOCK
      ?auto_169930 - BLOCK
      ?auto_169931 - BLOCK
      ?auto_169932 - BLOCK
    )
    :vars
    (
      ?auto_169933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169932 ?auto_169933 ) ( ON-TABLE ?auto_169926 ) ( ON ?auto_169927 ?auto_169926 ) ( ON ?auto_169928 ?auto_169927 ) ( ON ?auto_169929 ?auto_169928 ) ( ON ?auto_169930 ?auto_169929 ) ( not ( = ?auto_169926 ?auto_169927 ) ) ( not ( = ?auto_169926 ?auto_169928 ) ) ( not ( = ?auto_169926 ?auto_169929 ) ) ( not ( = ?auto_169926 ?auto_169930 ) ) ( not ( = ?auto_169926 ?auto_169931 ) ) ( not ( = ?auto_169926 ?auto_169932 ) ) ( not ( = ?auto_169926 ?auto_169933 ) ) ( not ( = ?auto_169927 ?auto_169928 ) ) ( not ( = ?auto_169927 ?auto_169929 ) ) ( not ( = ?auto_169927 ?auto_169930 ) ) ( not ( = ?auto_169927 ?auto_169931 ) ) ( not ( = ?auto_169927 ?auto_169932 ) ) ( not ( = ?auto_169927 ?auto_169933 ) ) ( not ( = ?auto_169928 ?auto_169929 ) ) ( not ( = ?auto_169928 ?auto_169930 ) ) ( not ( = ?auto_169928 ?auto_169931 ) ) ( not ( = ?auto_169928 ?auto_169932 ) ) ( not ( = ?auto_169928 ?auto_169933 ) ) ( not ( = ?auto_169929 ?auto_169930 ) ) ( not ( = ?auto_169929 ?auto_169931 ) ) ( not ( = ?auto_169929 ?auto_169932 ) ) ( not ( = ?auto_169929 ?auto_169933 ) ) ( not ( = ?auto_169930 ?auto_169931 ) ) ( not ( = ?auto_169930 ?auto_169932 ) ) ( not ( = ?auto_169930 ?auto_169933 ) ) ( not ( = ?auto_169931 ?auto_169932 ) ) ( not ( = ?auto_169931 ?auto_169933 ) ) ( not ( = ?auto_169932 ?auto_169933 ) ) ( CLEAR ?auto_169930 ) ( ON ?auto_169931 ?auto_169932 ) ( CLEAR ?auto_169931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_169926 ?auto_169927 ?auto_169928 ?auto_169929 ?auto_169930 ?auto_169931 )
      ( MAKE-7PILE ?auto_169926 ?auto_169927 ?auto_169928 ?auto_169929 ?auto_169930 ?auto_169931 ?auto_169932 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_169956 - BLOCK
      ?auto_169957 - BLOCK
      ?auto_169958 - BLOCK
      ?auto_169959 - BLOCK
      ?auto_169960 - BLOCK
      ?auto_169961 - BLOCK
      ?auto_169962 - BLOCK
    )
    :vars
    (
      ?auto_169963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169962 ?auto_169963 ) ( ON-TABLE ?auto_169956 ) ( ON ?auto_169957 ?auto_169956 ) ( ON ?auto_169958 ?auto_169957 ) ( ON ?auto_169959 ?auto_169958 ) ( not ( = ?auto_169956 ?auto_169957 ) ) ( not ( = ?auto_169956 ?auto_169958 ) ) ( not ( = ?auto_169956 ?auto_169959 ) ) ( not ( = ?auto_169956 ?auto_169960 ) ) ( not ( = ?auto_169956 ?auto_169961 ) ) ( not ( = ?auto_169956 ?auto_169962 ) ) ( not ( = ?auto_169956 ?auto_169963 ) ) ( not ( = ?auto_169957 ?auto_169958 ) ) ( not ( = ?auto_169957 ?auto_169959 ) ) ( not ( = ?auto_169957 ?auto_169960 ) ) ( not ( = ?auto_169957 ?auto_169961 ) ) ( not ( = ?auto_169957 ?auto_169962 ) ) ( not ( = ?auto_169957 ?auto_169963 ) ) ( not ( = ?auto_169958 ?auto_169959 ) ) ( not ( = ?auto_169958 ?auto_169960 ) ) ( not ( = ?auto_169958 ?auto_169961 ) ) ( not ( = ?auto_169958 ?auto_169962 ) ) ( not ( = ?auto_169958 ?auto_169963 ) ) ( not ( = ?auto_169959 ?auto_169960 ) ) ( not ( = ?auto_169959 ?auto_169961 ) ) ( not ( = ?auto_169959 ?auto_169962 ) ) ( not ( = ?auto_169959 ?auto_169963 ) ) ( not ( = ?auto_169960 ?auto_169961 ) ) ( not ( = ?auto_169960 ?auto_169962 ) ) ( not ( = ?auto_169960 ?auto_169963 ) ) ( not ( = ?auto_169961 ?auto_169962 ) ) ( not ( = ?auto_169961 ?auto_169963 ) ) ( not ( = ?auto_169962 ?auto_169963 ) ) ( ON ?auto_169961 ?auto_169962 ) ( CLEAR ?auto_169959 ) ( ON ?auto_169960 ?auto_169961 ) ( CLEAR ?auto_169960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_169956 ?auto_169957 ?auto_169958 ?auto_169959 ?auto_169960 )
      ( MAKE-7PILE ?auto_169956 ?auto_169957 ?auto_169958 ?auto_169959 ?auto_169960 ?auto_169961 ?auto_169962 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_169986 - BLOCK
      ?auto_169987 - BLOCK
      ?auto_169988 - BLOCK
      ?auto_169989 - BLOCK
      ?auto_169990 - BLOCK
      ?auto_169991 - BLOCK
      ?auto_169992 - BLOCK
    )
    :vars
    (
      ?auto_169993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169992 ?auto_169993 ) ( ON-TABLE ?auto_169986 ) ( ON ?auto_169987 ?auto_169986 ) ( ON ?auto_169988 ?auto_169987 ) ( not ( = ?auto_169986 ?auto_169987 ) ) ( not ( = ?auto_169986 ?auto_169988 ) ) ( not ( = ?auto_169986 ?auto_169989 ) ) ( not ( = ?auto_169986 ?auto_169990 ) ) ( not ( = ?auto_169986 ?auto_169991 ) ) ( not ( = ?auto_169986 ?auto_169992 ) ) ( not ( = ?auto_169986 ?auto_169993 ) ) ( not ( = ?auto_169987 ?auto_169988 ) ) ( not ( = ?auto_169987 ?auto_169989 ) ) ( not ( = ?auto_169987 ?auto_169990 ) ) ( not ( = ?auto_169987 ?auto_169991 ) ) ( not ( = ?auto_169987 ?auto_169992 ) ) ( not ( = ?auto_169987 ?auto_169993 ) ) ( not ( = ?auto_169988 ?auto_169989 ) ) ( not ( = ?auto_169988 ?auto_169990 ) ) ( not ( = ?auto_169988 ?auto_169991 ) ) ( not ( = ?auto_169988 ?auto_169992 ) ) ( not ( = ?auto_169988 ?auto_169993 ) ) ( not ( = ?auto_169989 ?auto_169990 ) ) ( not ( = ?auto_169989 ?auto_169991 ) ) ( not ( = ?auto_169989 ?auto_169992 ) ) ( not ( = ?auto_169989 ?auto_169993 ) ) ( not ( = ?auto_169990 ?auto_169991 ) ) ( not ( = ?auto_169990 ?auto_169992 ) ) ( not ( = ?auto_169990 ?auto_169993 ) ) ( not ( = ?auto_169991 ?auto_169992 ) ) ( not ( = ?auto_169991 ?auto_169993 ) ) ( not ( = ?auto_169992 ?auto_169993 ) ) ( ON ?auto_169991 ?auto_169992 ) ( ON ?auto_169990 ?auto_169991 ) ( CLEAR ?auto_169988 ) ( ON ?auto_169989 ?auto_169990 ) ( CLEAR ?auto_169989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169986 ?auto_169987 ?auto_169988 ?auto_169989 )
      ( MAKE-7PILE ?auto_169986 ?auto_169987 ?auto_169988 ?auto_169989 ?auto_169990 ?auto_169991 ?auto_169992 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170016 - BLOCK
      ?auto_170017 - BLOCK
      ?auto_170018 - BLOCK
      ?auto_170019 - BLOCK
      ?auto_170020 - BLOCK
      ?auto_170021 - BLOCK
      ?auto_170022 - BLOCK
    )
    :vars
    (
      ?auto_170023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170022 ?auto_170023 ) ( ON-TABLE ?auto_170016 ) ( ON ?auto_170017 ?auto_170016 ) ( not ( = ?auto_170016 ?auto_170017 ) ) ( not ( = ?auto_170016 ?auto_170018 ) ) ( not ( = ?auto_170016 ?auto_170019 ) ) ( not ( = ?auto_170016 ?auto_170020 ) ) ( not ( = ?auto_170016 ?auto_170021 ) ) ( not ( = ?auto_170016 ?auto_170022 ) ) ( not ( = ?auto_170016 ?auto_170023 ) ) ( not ( = ?auto_170017 ?auto_170018 ) ) ( not ( = ?auto_170017 ?auto_170019 ) ) ( not ( = ?auto_170017 ?auto_170020 ) ) ( not ( = ?auto_170017 ?auto_170021 ) ) ( not ( = ?auto_170017 ?auto_170022 ) ) ( not ( = ?auto_170017 ?auto_170023 ) ) ( not ( = ?auto_170018 ?auto_170019 ) ) ( not ( = ?auto_170018 ?auto_170020 ) ) ( not ( = ?auto_170018 ?auto_170021 ) ) ( not ( = ?auto_170018 ?auto_170022 ) ) ( not ( = ?auto_170018 ?auto_170023 ) ) ( not ( = ?auto_170019 ?auto_170020 ) ) ( not ( = ?auto_170019 ?auto_170021 ) ) ( not ( = ?auto_170019 ?auto_170022 ) ) ( not ( = ?auto_170019 ?auto_170023 ) ) ( not ( = ?auto_170020 ?auto_170021 ) ) ( not ( = ?auto_170020 ?auto_170022 ) ) ( not ( = ?auto_170020 ?auto_170023 ) ) ( not ( = ?auto_170021 ?auto_170022 ) ) ( not ( = ?auto_170021 ?auto_170023 ) ) ( not ( = ?auto_170022 ?auto_170023 ) ) ( ON ?auto_170021 ?auto_170022 ) ( ON ?auto_170020 ?auto_170021 ) ( ON ?auto_170019 ?auto_170020 ) ( CLEAR ?auto_170017 ) ( ON ?auto_170018 ?auto_170019 ) ( CLEAR ?auto_170018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_170016 ?auto_170017 ?auto_170018 )
      ( MAKE-7PILE ?auto_170016 ?auto_170017 ?auto_170018 ?auto_170019 ?auto_170020 ?auto_170021 ?auto_170022 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170046 - BLOCK
      ?auto_170047 - BLOCK
      ?auto_170048 - BLOCK
      ?auto_170049 - BLOCK
      ?auto_170050 - BLOCK
      ?auto_170051 - BLOCK
      ?auto_170052 - BLOCK
    )
    :vars
    (
      ?auto_170053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170052 ?auto_170053 ) ( ON-TABLE ?auto_170046 ) ( not ( = ?auto_170046 ?auto_170047 ) ) ( not ( = ?auto_170046 ?auto_170048 ) ) ( not ( = ?auto_170046 ?auto_170049 ) ) ( not ( = ?auto_170046 ?auto_170050 ) ) ( not ( = ?auto_170046 ?auto_170051 ) ) ( not ( = ?auto_170046 ?auto_170052 ) ) ( not ( = ?auto_170046 ?auto_170053 ) ) ( not ( = ?auto_170047 ?auto_170048 ) ) ( not ( = ?auto_170047 ?auto_170049 ) ) ( not ( = ?auto_170047 ?auto_170050 ) ) ( not ( = ?auto_170047 ?auto_170051 ) ) ( not ( = ?auto_170047 ?auto_170052 ) ) ( not ( = ?auto_170047 ?auto_170053 ) ) ( not ( = ?auto_170048 ?auto_170049 ) ) ( not ( = ?auto_170048 ?auto_170050 ) ) ( not ( = ?auto_170048 ?auto_170051 ) ) ( not ( = ?auto_170048 ?auto_170052 ) ) ( not ( = ?auto_170048 ?auto_170053 ) ) ( not ( = ?auto_170049 ?auto_170050 ) ) ( not ( = ?auto_170049 ?auto_170051 ) ) ( not ( = ?auto_170049 ?auto_170052 ) ) ( not ( = ?auto_170049 ?auto_170053 ) ) ( not ( = ?auto_170050 ?auto_170051 ) ) ( not ( = ?auto_170050 ?auto_170052 ) ) ( not ( = ?auto_170050 ?auto_170053 ) ) ( not ( = ?auto_170051 ?auto_170052 ) ) ( not ( = ?auto_170051 ?auto_170053 ) ) ( not ( = ?auto_170052 ?auto_170053 ) ) ( ON ?auto_170051 ?auto_170052 ) ( ON ?auto_170050 ?auto_170051 ) ( ON ?auto_170049 ?auto_170050 ) ( ON ?auto_170048 ?auto_170049 ) ( CLEAR ?auto_170046 ) ( ON ?auto_170047 ?auto_170048 ) ( CLEAR ?auto_170047 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_170046 ?auto_170047 )
      ( MAKE-7PILE ?auto_170046 ?auto_170047 ?auto_170048 ?auto_170049 ?auto_170050 ?auto_170051 ?auto_170052 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170076 - BLOCK
      ?auto_170077 - BLOCK
      ?auto_170078 - BLOCK
      ?auto_170079 - BLOCK
      ?auto_170080 - BLOCK
      ?auto_170081 - BLOCK
      ?auto_170082 - BLOCK
    )
    :vars
    (
      ?auto_170083 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170082 ?auto_170083 ) ( not ( = ?auto_170076 ?auto_170077 ) ) ( not ( = ?auto_170076 ?auto_170078 ) ) ( not ( = ?auto_170076 ?auto_170079 ) ) ( not ( = ?auto_170076 ?auto_170080 ) ) ( not ( = ?auto_170076 ?auto_170081 ) ) ( not ( = ?auto_170076 ?auto_170082 ) ) ( not ( = ?auto_170076 ?auto_170083 ) ) ( not ( = ?auto_170077 ?auto_170078 ) ) ( not ( = ?auto_170077 ?auto_170079 ) ) ( not ( = ?auto_170077 ?auto_170080 ) ) ( not ( = ?auto_170077 ?auto_170081 ) ) ( not ( = ?auto_170077 ?auto_170082 ) ) ( not ( = ?auto_170077 ?auto_170083 ) ) ( not ( = ?auto_170078 ?auto_170079 ) ) ( not ( = ?auto_170078 ?auto_170080 ) ) ( not ( = ?auto_170078 ?auto_170081 ) ) ( not ( = ?auto_170078 ?auto_170082 ) ) ( not ( = ?auto_170078 ?auto_170083 ) ) ( not ( = ?auto_170079 ?auto_170080 ) ) ( not ( = ?auto_170079 ?auto_170081 ) ) ( not ( = ?auto_170079 ?auto_170082 ) ) ( not ( = ?auto_170079 ?auto_170083 ) ) ( not ( = ?auto_170080 ?auto_170081 ) ) ( not ( = ?auto_170080 ?auto_170082 ) ) ( not ( = ?auto_170080 ?auto_170083 ) ) ( not ( = ?auto_170081 ?auto_170082 ) ) ( not ( = ?auto_170081 ?auto_170083 ) ) ( not ( = ?auto_170082 ?auto_170083 ) ) ( ON ?auto_170081 ?auto_170082 ) ( ON ?auto_170080 ?auto_170081 ) ( ON ?auto_170079 ?auto_170080 ) ( ON ?auto_170078 ?auto_170079 ) ( ON ?auto_170077 ?auto_170078 ) ( ON ?auto_170076 ?auto_170077 ) ( CLEAR ?auto_170076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_170076 )
      ( MAKE-7PILE ?auto_170076 ?auto_170077 ?auto_170078 ?auto_170079 ?auto_170080 ?auto_170081 ?auto_170082 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170107 - BLOCK
      ?auto_170108 - BLOCK
      ?auto_170109 - BLOCK
      ?auto_170110 - BLOCK
      ?auto_170111 - BLOCK
      ?auto_170112 - BLOCK
      ?auto_170113 - BLOCK
      ?auto_170114 - BLOCK
    )
    :vars
    (
      ?auto_170115 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_170113 ) ( ON ?auto_170114 ?auto_170115 ) ( CLEAR ?auto_170114 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_170107 ) ( ON ?auto_170108 ?auto_170107 ) ( ON ?auto_170109 ?auto_170108 ) ( ON ?auto_170110 ?auto_170109 ) ( ON ?auto_170111 ?auto_170110 ) ( ON ?auto_170112 ?auto_170111 ) ( ON ?auto_170113 ?auto_170112 ) ( not ( = ?auto_170107 ?auto_170108 ) ) ( not ( = ?auto_170107 ?auto_170109 ) ) ( not ( = ?auto_170107 ?auto_170110 ) ) ( not ( = ?auto_170107 ?auto_170111 ) ) ( not ( = ?auto_170107 ?auto_170112 ) ) ( not ( = ?auto_170107 ?auto_170113 ) ) ( not ( = ?auto_170107 ?auto_170114 ) ) ( not ( = ?auto_170107 ?auto_170115 ) ) ( not ( = ?auto_170108 ?auto_170109 ) ) ( not ( = ?auto_170108 ?auto_170110 ) ) ( not ( = ?auto_170108 ?auto_170111 ) ) ( not ( = ?auto_170108 ?auto_170112 ) ) ( not ( = ?auto_170108 ?auto_170113 ) ) ( not ( = ?auto_170108 ?auto_170114 ) ) ( not ( = ?auto_170108 ?auto_170115 ) ) ( not ( = ?auto_170109 ?auto_170110 ) ) ( not ( = ?auto_170109 ?auto_170111 ) ) ( not ( = ?auto_170109 ?auto_170112 ) ) ( not ( = ?auto_170109 ?auto_170113 ) ) ( not ( = ?auto_170109 ?auto_170114 ) ) ( not ( = ?auto_170109 ?auto_170115 ) ) ( not ( = ?auto_170110 ?auto_170111 ) ) ( not ( = ?auto_170110 ?auto_170112 ) ) ( not ( = ?auto_170110 ?auto_170113 ) ) ( not ( = ?auto_170110 ?auto_170114 ) ) ( not ( = ?auto_170110 ?auto_170115 ) ) ( not ( = ?auto_170111 ?auto_170112 ) ) ( not ( = ?auto_170111 ?auto_170113 ) ) ( not ( = ?auto_170111 ?auto_170114 ) ) ( not ( = ?auto_170111 ?auto_170115 ) ) ( not ( = ?auto_170112 ?auto_170113 ) ) ( not ( = ?auto_170112 ?auto_170114 ) ) ( not ( = ?auto_170112 ?auto_170115 ) ) ( not ( = ?auto_170113 ?auto_170114 ) ) ( not ( = ?auto_170113 ?auto_170115 ) ) ( not ( = ?auto_170114 ?auto_170115 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_170114 ?auto_170115 )
      ( !STACK ?auto_170114 ?auto_170113 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170141 - BLOCK
      ?auto_170142 - BLOCK
      ?auto_170143 - BLOCK
      ?auto_170144 - BLOCK
      ?auto_170145 - BLOCK
      ?auto_170146 - BLOCK
      ?auto_170147 - BLOCK
      ?auto_170148 - BLOCK
    )
    :vars
    (
      ?auto_170149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170148 ?auto_170149 ) ( ON-TABLE ?auto_170141 ) ( ON ?auto_170142 ?auto_170141 ) ( ON ?auto_170143 ?auto_170142 ) ( ON ?auto_170144 ?auto_170143 ) ( ON ?auto_170145 ?auto_170144 ) ( ON ?auto_170146 ?auto_170145 ) ( not ( = ?auto_170141 ?auto_170142 ) ) ( not ( = ?auto_170141 ?auto_170143 ) ) ( not ( = ?auto_170141 ?auto_170144 ) ) ( not ( = ?auto_170141 ?auto_170145 ) ) ( not ( = ?auto_170141 ?auto_170146 ) ) ( not ( = ?auto_170141 ?auto_170147 ) ) ( not ( = ?auto_170141 ?auto_170148 ) ) ( not ( = ?auto_170141 ?auto_170149 ) ) ( not ( = ?auto_170142 ?auto_170143 ) ) ( not ( = ?auto_170142 ?auto_170144 ) ) ( not ( = ?auto_170142 ?auto_170145 ) ) ( not ( = ?auto_170142 ?auto_170146 ) ) ( not ( = ?auto_170142 ?auto_170147 ) ) ( not ( = ?auto_170142 ?auto_170148 ) ) ( not ( = ?auto_170142 ?auto_170149 ) ) ( not ( = ?auto_170143 ?auto_170144 ) ) ( not ( = ?auto_170143 ?auto_170145 ) ) ( not ( = ?auto_170143 ?auto_170146 ) ) ( not ( = ?auto_170143 ?auto_170147 ) ) ( not ( = ?auto_170143 ?auto_170148 ) ) ( not ( = ?auto_170143 ?auto_170149 ) ) ( not ( = ?auto_170144 ?auto_170145 ) ) ( not ( = ?auto_170144 ?auto_170146 ) ) ( not ( = ?auto_170144 ?auto_170147 ) ) ( not ( = ?auto_170144 ?auto_170148 ) ) ( not ( = ?auto_170144 ?auto_170149 ) ) ( not ( = ?auto_170145 ?auto_170146 ) ) ( not ( = ?auto_170145 ?auto_170147 ) ) ( not ( = ?auto_170145 ?auto_170148 ) ) ( not ( = ?auto_170145 ?auto_170149 ) ) ( not ( = ?auto_170146 ?auto_170147 ) ) ( not ( = ?auto_170146 ?auto_170148 ) ) ( not ( = ?auto_170146 ?auto_170149 ) ) ( not ( = ?auto_170147 ?auto_170148 ) ) ( not ( = ?auto_170147 ?auto_170149 ) ) ( not ( = ?auto_170148 ?auto_170149 ) ) ( CLEAR ?auto_170146 ) ( ON ?auto_170147 ?auto_170148 ) ( CLEAR ?auto_170147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_170141 ?auto_170142 ?auto_170143 ?auto_170144 ?auto_170145 ?auto_170146 ?auto_170147 )
      ( MAKE-8PILE ?auto_170141 ?auto_170142 ?auto_170143 ?auto_170144 ?auto_170145 ?auto_170146 ?auto_170147 ?auto_170148 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170175 - BLOCK
      ?auto_170176 - BLOCK
      ?auto_170177 - BLOCK
      ?auto_170178 - BLOCK
      ?auto_170179 - BLOCK
      ?auto_170180 - BLOCK
      ?auto_170181 - BLOCK
      ?auto_170182 - BLOCK
    )
    :vars
    (
      ?auto_170183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170182 ?auto_170183 ) ( ON-TABLE ?auto_170175 ) ( ON ?auto_170176 ?auto_170175 ) ( ON ?auto_170177 ?auto_170176 ) ( ON ?auto_170178 ?auto_170177 ) ( ON ?auto_170179 ?auto_170178 ) ( not ( = ?auto_170175 ?auto_170176 ) ) ( not ( = ?auto_170175 ?auto_170177 ) ) ( not ( = ?auto_170175 ?auto_170178 ) ) ( not ( = ?auto_170175 ?auto_170179 ) ) ( not ( = ?auto_170175 ?auto_170180 ) ) ( not ( = ?auto_170175 ?auto_170181 ) ) ( not ( = ?auto_170175 ?auto_170182 ) ) ( not ( = ?auto_170175 ?auto_170183 ) ) ( not ( = ?auto_170176 ?auto_170177 ) ) ( not ( = ?auto_170176 ?auto_170178 ) ) ( not ( = ?auto_170176 ?auto_170179 ) ) ( not ( = ?auto_170176 ?auto_170180 ) ) ( not ( = ?auto_170176 ?auto_170181 ) ) ( not ( = ?auto_170176 ?auto_170182 ) ) ( not ( = ?auto_170176 ?auto_170183 ) ) ( not ( = ?auto_170177 ?auto_170178 ) ) ( not ( = ?auto_170177 ?auto_170179 ) ) ( not ( = ?auto_170177 ?auto_170180 ) ) ( not ( = ?auto_170177 ?auto_170181 ) ) ( not ( = ?auto_170177 ?auto_170182 ) ) ( not ( = ?auto_170177 ?auto_170183 ) ) ( not ( = ?auto_170178 ?auto_170179 ) ) ( not ( = ?auto_170178 ?auto_170180 ) ) ( not ( = ?auto_170178 ?auto_170181 ) ) ( not ( = ?auto_170178 ?auto_170182 ) ) ( not ( = ?auto_170178 ?auto_170183 ) ) ( not ( = ?auto_170179 ?auto_170180 ) ) ( not ( = ?auto_170179 ?auto_170181 ) ) ( not ( = ?auto_170179 ?auto_170182 ) ) ( not ( = ?auto_170179 ?auto_170183 ) ) ( not ( = ?auto_170180 ?auto_170181 ) ) ( not ( = ?auto_170180 ?auto_170182 ) ) ( not ( = ?auto_170180 ?auto_170183 ) ) ( not ( = ?auto_170181 ?auto_170182 ) ) ( not ( = ?auto_170181 ?auto_170183 ) ) ( not ( = ?auto_170182 ?auto_170183 ) ) ( ON ?auto_170181 ?auto_170182 ) ( CLEAR ?auto_170179 ) ( ON ?auto_170180 ?auto_170181 ) ( CLEAR ?auto_170180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_170175 ?auto_170176 ?auto_170177 ?auto_170178 ?auto_170179 ?auto_170180 )
      ( MAKE-8PILE ?auto_170175 ?auto_170176 ?auto_170177 ?auto_170178 ?auto_170179 ?auto_170180 ?auto_170181 ?auto_170182 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170209 - BLOCK
      ?auto_170210 - BLOCK
      ?auto_170211 - BLOCK
      ?auto_170212 - BLOCK
      ?auto_170213 - BLOCK
      ?auto_170214 - BLOCK
      ?auto_170215 - BLOCK
      ?auto_170216 - BLOCK
    )
    :vars
    (
      ?auto_170217 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170216 ?auto_170217 ) ( ON-TABLE ?auto_170209 ) ( ON ?auto_170210 ?auto_170209 ) ( ON ?auto_170211 ?auto_170210 ) ( ON ?auto_170212 ?auto_170211 ) ( not ( = ?auto_170209 ?auto_170210 ) ) ( not ( = ?auto_170209 ?auto_170211 ) ) ( not ( = ?auto_170209 ?auto_170212 ) ) ( not ( = ?auto_170209 ?auto_170213 ) ) ( not ( = ?auto_170209 ?auto_170214 ) ) ( not ( = ?auto_170209 ?auto_170215 ) ) ( not ( = ?auto_170209 ?auto_170216 ) ) ( not ( = ?auto_170209 ?auto_170217 ) ) ( not ( = ?auto_170210 ?auto_170211 ) ) ( not ( = ?auto_170210 ?auto_170212 ) ) ( not ( = ?auto_170210 ?auto_170213 ) ) ( not ( = ?auto_170210 ?auto_170214 ) ) ( not ( = ?auto_170210 ?auto_170215 ) ) ( not ( = ?auto_170210 ?auto_170216 ) ) ( not ( = ?auto_170210 ?auto_170217 ) ) ( not ( = ?auto_170211 ?auto_170212 ) ) ( not ( = ?auto_170211 ?auto_170213 ) ) ( not ( = ?auto_170211 ?auto_170214 ) ) ( not ( = ?auto_170211 ?auto_170215 ) ) ( not ( = ?auto_170211 ?auto_170216 ) ) ( not ( = ?auto_170211 ?auto_170217 ) ) ( not ( = ?auto_170212 ?auto_170213 ) ) ( not ( = ?auto_170212 ?auto_170214 ) ) ( not ( = ?auto_170212 ?auto_170215 ) ) ( not ( = ?auto_170212 ?auto_170216 ) ) ( not ( = ?auto_170212 ?auto_170217 ) ) ( not ( = ?auto_170213 ?auto_170214 ) ) ( not ( = ?auto_170213 ?auto_170215 ) ) ( not ( = ?auto_170213 ?auto_170216 ) ) ( not ( = ?auto_170213 ?auto_170217 ) ) ( not ( = ?auto_170214 ?auto_170215 ) ) ( not ( = ?auto_170214 ?auto_170216 ) ) ( not ( = ?auto_170214 ?auto_170217 ) ) ( not ( = ?auto_170215 ?auto_170216 ) ) ( not ( = ?auto_170215 ?auto_170217 ) ) ( not ( = ?auto_170216 ?auto_170217 ) ) ( ON ?auto_170215 ?auto_170216 ) ( ON ?auto_170214 ?auto_170215 ) ( CLEAR ?auto_170212 ) ( ON ?auto_170213 ?auto_170214 ) ( CLEAR ?auto_170213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_170209 ?auto_170210 ?auto_170211 ?auto_170212 ?auto_170213 )
      ( MAKE-8PILE ?auto_170209 ?auto_170210 ?auto_170211 ?auto_170212 ?auto_170213 ?auto_170214 ?auto_170215 ?auto_170216 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170243 - BLOCK
      ?auto_170244 - BLOCK
      ?auto_170245 - BLOCK
      ?auto_170246 - BLOCK
      ?auto_170247 - BLOCK
      ?auto_170248 - BLOCK
      ?auto_170249 - BLOCK
      ?auto_170250 - BLOCK
    )
    :vars
    (
      ?auto_170251 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170250 ?auto_170251 ) ( ON-TABLE ?auto_170243 ) ( ON ?auto_170244 ?auto_170243 ) ( ON ?auto_170245 ?auto_170244 ) ( not ( = ?auto_170243 ?auto_170244 ) ) ( not ( = ?auto_170243 ?auto_170245 ) ) ( not ( = ?auto_170243 ?auto_170246 ) ) ( not ( = ?auto_170243 ?auto_170247 ) ) ( not ( = ?auto_170243 ?auto_170248 ) ) ( not ( = ?auto_170243 ?auto_170249 ) ) ( not ( = ?auto_170243 ?auto_170250 ) ) ( not ( = ?auto_170243 ?auto_170251 ) ) ( not ( = ?auto_170244 ?auto_170245 ) ) ( not ( = ?auto_170244 ?auto_170246 ) ) ( not ( = ?auto_170244 ?auto_170247 ) ) ( not ( = ?auto_170244 ?auto_170248 ) ) ( not ( = ?auto_170244 ?auto_170249 ) ) ( not ( = ?auto_170244 ?auto_170250 ) ) ( not ( = ?auto_170244 ?auto_170251 ) ) ( not ( = ?auto_170245 ?auto_170246 ) ) ( not ( = ?auto_170245 ?auto_170247 ) ) ( not ( = ?auto_170245 ?auto_170248 ) ) ( not ( = ?auto_170245 ?auto_170249 ) ) ( not ( = ?auto_170245 ?auto_170250 ) ) ( not ( = ?auto_170245 ?auto_170251 ) ) ( not ( = ?auto_170246 ?auto_170247 ) ) ( not ( = ?auto_170246 ?auto_170248 ) ) ( not ( = ?auto_170246 ?auto_170249 ) ) ( not ( = ?auto_170246 ?auto_170250 ) ) ( not ( = ?auto_170246 ?auto_170251 ) ) ( not ( = ?auto_170247 ?auto_170248 ) ) ( not ( = ?auto_170247 ?auto_170249 ) ) ( not ( = ?auto_170247 ?auto_170250 ) ) ( not ( = ?auto_170247 ?auto_170251 ) ) ( not ( = ?auto_170248 ?auto_170249 ) ) ( not ( = ?auto_170248 ?auto_170250 ) ) ( not ( = ?auto_170248 ?auto_170251 ) ) ( not ( = ?auto_170249 ?auto_170250 ) ) ( not ( = ?auto_170249 ?auto_170251 ) ) ( not ( = ?auto_170250 ?auto_170251 ) ) ( ON ?auto_170249 ?auto_170250 ) ( ON ?auto_170248 ?auto_170249 ) ( ON ?auto_170247 ?auto_170248 ) ( CLEAR ?auto_170245 ) ( ON ?auto_170246 ?auto_170247 ) ( CLEAR ?auto_170246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_170243 ?auto_170244 ?auto_170245 ?auto_170246 )
      ( MAKE-8PILE ?auto_170243 ?auto_170244 ?auto_170245 ?auto_170246 ?auto_170247 ?auto_170248 ?auto_170249 ?auto_170250 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170277 - BLOCK
      ?auto_170278 - BLOCK
      ?auto_170279 - BLOCK
      ?auto_170280 - BLOCK
      ?auto_170281 - BLOCK
      ?auto_170282 - BLOCK
      ?auto_170283 - BLOCK
      ?auto_170284 - BLOCK
    )
    :vars
    (
      ?auto_170285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170284 ?auto_170285 ) ( ON-TABLE ?auto_170277 ) ( ON ?auto_170278 ?auto_170277 ) ( not ( = ?auto_170277 ?auto_170278 ) ) ( not ( = ?auto_170277 ?auto_170279 ) ) ( not ( = ?auto_170277 ?auto_170280 ) ) ( not ( = ?auto_170277 ?auto_170281 ) ) ( not ( = ?auto_170277 ?auto_170282 ) ) ( not ( = ?auto_170277 ?auto_170283 ) ) ( not ( = ?auto_170277 ?auto_170284 ) ) ( not ( = ?auto_170277 ?auto_170285 ) ) ( not ( = ?auto_170278 ?auto_170279 ) ) ( not ( = ?auto_170278 ?auto_170280 ) ) ( not ( = ?auto_170278 ?auto_170281 ) ) ( not ( = ?auto_170278 ?auto_170282 ) ) ( not ( = ?auto_170278 ?auto_170283 ) ) ( not ( = ?auto_170278 ?auto_170284 ) ) ( not ( = ?auto_170278 ?auto_170285 ) ) ( not ( = ?auto_170279 ?auto_170280 ) ) ( not ( = ?auto_170279 ?auto_170281 ) ) ( not ( = ?auto_170279 ?auto_170282 ) ) ( not ( = ?auto_170279 ?auto_170283 ) ) ( not ( = ?auto_170279 ?auto_170284 ) ) ( not ( = ?auto_170279 ?auto_170285 ) ) ( not ( = ?auto_170280 ?auto_170281 ) ) ( not ( = ?auto_170280 ?auto_170282 ) ) ( not ( = ?auto_170280 ?auto_170283 ) ) ( not ( = ?auto_170280 ?auto_170284 ) ) ( not ( = ?auto_170280 ?auto_170285 ) ) ( not ( = ?auto_170281 ?auto_170282 ) ) ( not ( = ?auto_170281 ?auto_170283 ) ) ( not ( = ?auto_170281 ?auto_170284 ) ) ( not ( = ?auto_170281 ?auto_170285 ) ) ( not ( = ?auto_170282 ?auto_170283 ) ) ( not ( = ?auto_170282 ?auto_170284 ) ) ( not ( = ?auto_170282 ?auto_170285 ) ) ( not ( = ?auto_170283 ?auto_170284 ) ) ( not ( = ?auto_170283 ?auto_170285 ) ) ( not ( = ?auto_170284 ?auto_170285 ) ) ( ON ?auto_170283 ?auto_170284 ) ( ON ?auto_170282 ?auto_170283 ) ( ON ?auto_170281 ?auto_170282 ) ( ON ?auto_170280 ?auto_170281 ) ( CLEAR ?auto_170278 ) ( ON ?auto_170279 ?auto_170280 ) ( CLEAR ?auto_170279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_170277 ?auto_170278 ?auto_170279 )
      ( MAKE-8PILE ?auto_170277 ?auto_170278 ?auto_170279 ?auto_170280 ?auto_170281 ?auto_170282 ?auto_170283 ?auto_170284 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170311 - BLOCK
      ?auto_170312 - BLOCK
      ?auto_170313 - BLOCK
      ?auto_170314 - BLOCK
      ?auto_170315 - BLOCK
      ?auto_170316 - BLOCK
      ?auto_170317 - BLOCK
      ?auto_170318 - BLOCK
    )
    :vars
    (
      ?auto_170319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170318 ?auto_170319 ) ( ON-TABLE ?auto_170311 ) ( not ( = ?auto_170311 ?auto_170312 ) ) ( not ( = ?auto_170311 ?auto_170313 ) ) ( not ( = ?auto_170311 ?auto_170314 ) ) ( not ( = ?auto_170311 ?auto_170315 ) ) ( not ( = ?auto_170311 ?auto_170316 ) ) ( not ( = ?auto_170311 ?auto_170317 ) ) ( not ( = ?auto_170311 ?auto_170318 ) ) ( not ( = ?auto_170311 ?auto_170319 ) ) ( not ( = ?auto_170312 ?auto_170313 ) ) ( not ( = ?auto_170312 ?auto_170314 ) ) ( not ( = ?auto_170312 ?auto_170315 ) ) ( not ( = ?auto_170312 ?auto_170316 ) ) ( not ( = ?auto_170312 ?auto_170317 ) ) ( not ( = ?auto_170312 ?auto_170318 ) ) ( not ( = ?auto_170312 ?auto_170319 ) ) ( not ( = ?auto_170313 ?auto_170314 ) ) ( not ( = ?auto_170313 ?auto_170315 ) ) ( not ( = ?auto_170313 ?auto_170316 ) ) ( not ( = ?auto_170313 ?auto_170317 ) ) ( not ( = ?auto_170313 ?auto_170318 ) ) ( not ( = ?auto_170313 ?auto_170319 ) ) ( not ( = ?auto_170314 ?auto_170315 ) ) ( not ( = ?auto_170314 ?auto_170316 ) ) ( not ( = ?auto_170314 ?auto_170317 ) ) ( not ( = ?auto_170314 ?auto_170318 ) ) ( not ( = ?auto_170314 ?auto_170319 ) ) ( not ( = ?auto_170315 ?auto_170316 ) ) ( not ( = ?auto_170315 ?auto_170317 ) ) ( not ( = ?auto_170315 ?auto_170318 ) ) ( not ( = ?auto_170315 ?auto_170319 ) ) ( not ( = ?auto_170316 ?auto_170317 ) ) ( not ( = ?auto_170316 ?auto_170318 ) ) ( not ( = ?auto_170316 ?auto_170319 ) ) ( not ( = ?auto_170317 ?auto_170318 ) ) ( not ( = ?auto_170317 ?auto_170319 ) ) ( not ( = ?auto_170318 ?auto_170319 ) ) ( ON ?auto_170317 ?auto_170318 ) ( ON ?auto_170316 ?auto_170317 ) ( ON ?auto_170315 ?auto_170316 ) ( ON ?auto_170314 ?auto_170315 ) ( ON ?auto_170313 ?auto_170314 ) ( CLEAR ?auto_170311 ) ( ON ?auto_170312 ?auto_170313 ) ( CLEAR ?auto_170312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_170311 ?auto_170312 )
      ( MAKE-8PILE ?auto_170311 ?auto_170312 ?auto_170313 ?auto_170314 ?auto_170315 ?auto_170316 ?auto_170317 ?auto_170318 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170345 - BLOCK
      ?auto_170346 - BLOCK
      ?auto_170347 - BLOCK
      ?auto_170348 - BLOCK
      ?auto_170349 - BLOCK
      ?auto_170350 - BLOCK
      ?auto_170351 - BLOCK
      ?auto_170352 - BLOCK
    )
    :vars
    (
      ?auto_170353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170352 ?auto_170353 ) ( not ( = ?auto_170345 ?auto_170346 ) ) ( not ( = ?auto_170345 ?auto_170347 ) ) ( not ( = ?auto_170345 ?auto_170348 ) ) ( not ( = ?auto_170345 ?auto_170349 ) ) ( not ( = ?auto_170345 ?auto_170350 ) ) ( not ( = ?auto_170345 ?auto_170351 ) ) ( not ( = ?auto_170345 ?auto_170352 ) ) ( not ( = ?auto_170345 ?auto_170353 ) ) ( not ( = ?auto_170346 ?auto_170347 ) ) ( not ( = ?auto_170346 ?auto_170348 ) ) ( not ( = ?auto_170346 ?auto_170349 ) ) ( not ( = ?auto_170346 ?auto_170350 ) ) ( not ( = ?auto_170346 ?auto_170351 ) ) ( not ( = ?auto_170346 ?auto_170352 ) ) ( not ( = ?auto_170346 ?auto_170353 ) ) ( not ( = ?auto_170347 ?auto_170348 ) ) ( not ( = ?auto_170347 ?auto_170349 ) ) ( not ( = ?auto_170347 ?auto_170350 ) ) ( not ( = ?auto_170347 ?auto_170351 ) ) ( not ( = ?auto_170347 ?auto_170352 ) ) ( not ( = ?auto_170347 ?auto_170353 ) ) ( not ( = ?auto_170348 ?auto_170349 ) ) ( not ( = ?auto_170348 ?auto_170350 ) ) ( not ( = ?auto_170348 ?auto_170351 ) ) ( not ( = ?auto_170348 ?auto_170352 ) ) ( not ( = ?auto_170348 ?auto_170353 ) ) ( not ( = ?auto_170349 ?auto_170350 ) ) ( not ( = ?auto_170349 ?auto_170351 ) ) ( not ( = ?auto_170349 ?auto_170352 ) ) ( not ( = ?auto_170349 ?auto_170353 ) ) ( not ( = ?auto_170350 ?auto_170351 ) ) ( not ( = ?auto_170350 ?auto_170352 ) ) ( not ( = ?auto_170350 ?auto_170353 ) ) ( not ( = ?auto_170351 ?auto_170352 ) ) ( not ( = ?auto_170351 ?auto_170353 ) ) ( not ( = ?auto_170352 ?auto_170353 ) ) ( ON ?auto_170351 ?auto_170352 ) ( ON ?auto_170350 ?auto_170351 ) ( ON ?auto_170349 ?auto_170350 ) ( ON ?auto_170348 ?auto_170349 ) ( ON ?auto_170347 ?auto_170348 ) ( ON ?auto_170346 ?auto_170347 ) ( ON ?auto_170345 ?auto_170346 ) ( CLEAR ?auto_170345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_170345 )
      ( MAKE-8PILE ?auto_170345 ?auto_170346 ?auto_170347 ?auto_170348 ?auto_170349 ?auto_170350 ?auto_170351 ?auto_170352 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_170380 - BLOCK
      ?auto_170381 - BLOCK
      ?auto_170382 - BLOCK
      ?auto_170383 - BLOCK
      ?auto_170384 - BLOCK
      ?auto_170385 - BLOCK
      ?auto_170386 - BLOCK
      ?auto_170387 - BLOCK
      ?auto_170388 - BLOCK
    )
    :vars
    (
      ?auto_170389 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_170387 ) ( ON ?auto_170388 ?auto_170389 ) ( CLEAR ?auto_170388 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_170380 ) ( ON ?auto_170381 ?auto_170380 ) ( ON ?auto_170382 ?auto_170381 ) ( ON ?auto_170383 ?auto_170382 ) ( ON ?auto_170384 ?auto_170383 ) ( ON ?auto_170385 ?auto_170384 ) ( ON ?auto_170386 ?auto_170385 ) ( ON ?auto_170387 ?auto_170386 ) ( not ( = ?auto_170380 ?auto_170381 ) ) ( not ( = ?auto_170380 ?auto_170382 ) ) ( not ( = ?auto_170380 ?auto_170383 ) ) ( not ( = ?auto_170380 ?auto_170384 ) ) ( not ( = ?auto_170380 ?auto_170385 ) ) ( not ( = ?auto_170380 ?auto_170386 ) ) ( not ( = ?auto_170380 ?auto_170387 ) ) ( not ( = ?auto_170380 ?auto_170388 ) ) ( not ( = ?auto_170380 ?auto_170389 ) ) ( not ( = ?auto_170381 ?auto_170382 ) ) ( not ( = ?auto_170381 ?auto_170383 ) ) ( not ( = ?auto_170381 ?auto_170384 ) ) ( not ( = ?auto_170381 ?auto_170385 ) ) ( not ( = ?auto_170381 ?auto_170386 ) ) ( not ( = ?auto_170381 ?auto_170387 ) ) ( not ( = ?auto_170381 ?auto_170388 ) ) ( not ( = ?auto_170381 ?auto_170389 ) ) ( not ( = ?auto_170382 ?auto_170383 ) ) ( not ( = ?auto_170382 ?auto_170384 ) ) ( not ( = ?auto_170382 ?auto_170385 ) ) ( not ( = ?auto_170382 ?auto_170386 ) ) ( not ( = ?auto_170382 ?auto_170387 ) ) ( not ( = ?auto_170382 ?auto_170388 ) ) ( not ( = ?auto_170382 ?auto_170389 ) ) ( not ( = ?auto_170383 ?auto_170384 ) ) ( not ( = ?auto_170383 ?auto_170385 ) ) ( not ( = ?auto_170383 ?auto_170386 ) ) ( not ( = ?auto_170383 ?auto_170387 ) ) ( not ( = ?auto_170383 ?auto_170388 ) ) ( not ( = ?auto_170383 ?auto_170389 ) ) ( not ( = ?auto_170384 ?auto_170385 ) ) ( not ( = ?auto_170384 ?auto_170386 ) ) ( not ( = ?auto_170384 ?auto_170387 ) ) ( not ( = ?auto_170384 ?auto_170388 ) ) ( not ( = ?auto_170384 ?auto_170389 ) ) ( not ( = ?auto_170385 ?auto_170386 ) ) ( not ( = ?auto_170385 ?auto_170387 ) ) ( not ( = ?auto_170385 ?auto_170388 ) ) ( not ( = ?auto_170385 ?auto_170389 ) ) ( not ( = ?auto_170386 ?auto_170387 ) ) ( not ( = ?auto_170386 ?auto_170388 ) ) ( not ( = ?auto_170386 ?auto_170389 ) ) ( not ( = ?auto_170387 ?auto_170388 ) ) ( not ( = ?auto_170387 ?auto_170389 ) ) ( not ( = ?auto_170388 ?auto_170389 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_170388 ?auto_170389 )
      ( !STACK ?auto_170388 ?auto_170387 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_170418 - BLOCK
      ?auto_170419 - BLOCK
      ?auto_170420 - BLOCK
      ?auto_170421 - BLOCK
      ?auto_170422 - BLOCK
      ?auto_170423 - BLOCK
      ?auto_170424 - BLOCK
      ?auto_170425 - BLOCK
      ?auto_170426 - BLOCK
    )
    :vars
    (
      ?auto_170427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170426 ?auto_170427 ) ( ON-TABLE ?auto_170418 ) ( ON ?auto_170419 ?auto_170418 ) ( ON ?auto_170420 ?auto_170419 ) ( ON ?auto_170421 ?auto_170420 ) ( ON ?auto_170422 ?auto_170421 ) ( ON ?auto_170423 ?auto_170422 ) ( ON ?auto_170424 ?auto_170423 ) ( not ( = ?auto_170418 ?auto_170419 ) ) ( not ( = ?auto_170418 ?auto_170420 ) ) ( not ( = ?auto_170418 ?auto_170421 ) ) ( not ( = ?auto_170418 ?auto_170422 ) ) ( not ( = ?auto_170418 ?auto_170423 ) ) ( not ( = ?auto_170418 ?auto_170424 ) ) ( not ( = ?auto_170418 ?auto_170425 ) ) ( not ( = ?auto_170418 ?auto_170426 ) ) ( not ( = ?auto_170418 ?auto_170427 ) ) ( not ( = ?auto_170419 ?auto_170420 ) ) ( not ( = ?auto_170419 ?auto_170421 ) ) ( not ( = ?auto_170419 ?auto_170422 ) ) ( not ( = ?auto_170419 ?auto_170423 ) ) ( not ( = ?auto_170419 ?auto_170424 ) ) ( not ( = ?auto_170419 ?auto_170425 ) ) ( not ( = ?auto_170419 ?auto_170426 ) ) ( not ( = ?auto_170419 ?auto_170427 ) ) ( not ( = ?auto_170420 ?auto_170421 ) ) ( not ( = ?auto_170420 ?auto_170422 ) ) ( not ( = ?auto_170420 ?auto_170423 ) ) ( not ( = ?auto_170420 ?auto_170424 ) ) ( not ( = ?auto_170420 ?auto_170425 ) ) ( not ( = ?auto_170420 ?auto_170426 ) ) ( not ( = ?auto_170420 ?auto_170427 ) ) ( not ( = ?auto_170421 ?auto_170422 ) ) ( not ( = ?auto_170421 ?auto_170423 ) ) ( not ( = ?auto_170421 ?auto_170424 ) ) ( not ( = ?auto_170421 ?auto_170425 ) ) ( not ( = ?auto_170421 ?auto_170426 ) ) ( not ( = ?auto_170421 ?auto_170427 ) ) ( not ( = ?auto_170422 ?auto_170423 ) ) ( not ( = ?auto_170422 ?auto_170424 ) ) ( not ( = ?auto_170422 ?auto_170425 ) ) ( not ( = ?auto_170422 ?auto_170426 ) ) ( not ( = ?auto_170422 ?auto_170427 ) ) ( not ( = ?auto_170423 ?auto_170424 ) ) ( not ( = ?auto_170423 ?auto_170425 ) ) ( not ( = ?auto_170423 ?auto_170426 ) ) ( not ( = ?auto_170423 ?auto_170427 ) ) ( not ( = ?auto_170424 ?auto_170425 ) ) ( not ( = ?auto_170424 ?auto_170426 ) ) ( not ( = ?auto_170424 ?auto_170427 ) ) ( not ( = ?auto_170425 ?auto_170426 ) ) ( not ( = ?auto_170425 ?auto_170427 ) ) ( not ( = ?auto_170426 ?auto_170427 ) ) ( CLEAR ?auto_170424 ) ( ON ?auto_170425 ?auto_170426 ) ( CLEAR ?auto_170425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_170418 ?auto_170419 ?auto_170420 ?auto_170421 ?auto_170422 ?auto_170423 ?auto_170424 ?auto_170425 )
      ( MAKE-9PILE ?auto_170418 ?auto_170419 ?auto_170420 ?auto_170421 ?auto_170422 ?auto_170423 ?auto_170424 ?auto_170425 ?auto_170426 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_170456 - BLOCK
      ?auto_170457 - BLOCK
      ?auto_170458 - BLOCK
      ?auto_170459 - BLOCK
      ?auto_170460 - BLOCK
      ?auto_170461 - BLOCK
      ?auto_170462 - BLOCK
      ?auto_170463 - BLOCK
      ?auto_170464 - BLOCK
    )
    :vars
    (
      ?auto_170465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170464 ?auto_170465 ) ( ON-TABLE ?auto_170456 ) ( ON ?auto_170457 ?auto_170456 ) ( ON ?auto_170458 ?auto_170457 ) ( ON ?auto_170459 ?auto_170458 ) ( ON ?auto_170460 ?auto_170459 ) ( ON ?auto_170461 ?auto_170460 ) ( not ( = ?auto_170456 ?auto_170457 ) ) ( not ( = ?auto_170456 ?auto_170458 ) ) ( not ( = ?auto_170456 ?auto_170459 ) ) ( not ( = ?auto_170456 ?auto_170460 ) ) ( not ( = ?auto_170456 ?auto_170461 ) ) ( not ( = ?auto_170456 ?auto_170462 ) ) ( not ( = ?auto_170456 ?auto_170463 ) ) ( not ( = ?auto_170456 ?auto_170464 ) ) ( not ( = ?auto_170456 ?auto_170465 ) ) ( not ( = ?auto_170457 ?auto_170458 ) ) ( not ( = ?auto_170457 ?auto_170459 ) ) ( not ( = ?auto_170457 ?auto_170460 ) ) ( not ( = ?auto_170457 ?auto_170461 ) ) ( not ( = ?auto_170457 ?auto_170462 ) ) ( not ( = ?auto_170457 ?auto_170463 ) ) ( not ( = ?auto_170457 ?auto_170464 ) ) ( not ( = ?auto_170457 ?auto_170465 ) ) ( not ( = ?auto_170458 ?auto_170459 ) ) ( not ( = ?auto_170458 ?auto_170460 ) ) ( not ( = ?auto_170458 ?auto_170461 ) ) ( not ( = ?auto_170458 ?auto_170462 ) ) ( not ( = ?auto_170458 ?auto_170463 ) ) ( not ( = ?auto_170458 ?auto_170464 ) ) ( not ( = ?auto_170458 ?auto_170465 ) ) ( not ( = ?auto_170459 ?auto_170460 ) ) ( not ( = ?auto_170459 ?auto_170461 ) ) ( not ( = ?auto_170459 ?auto_170462 ) ) ( not ( = ?auto_170459 ?auto_170463 ) ) ( not ( = ?auto_170459 ?auto_170464 ) ) ( not ( = ?auto_170459 ?auto_170465 ) ) ( not ( = ?auto_170460 ?auto_170461 ) ) ( not ( = ?auto_170460 ?auto_170462 ) ) ( not ( = ?auto_170460 ?auto_170463 ) ) ( not ( = ?auto_170460 ?auto_170464 ) ) ( not ( = ?auto_170460 ?auto_170465 ) ) ( not ( = ?auto_170461 ?auto_170462 ) ) ( not ( = ?auto_170461 ?auto_170463 ) ) ( not ( = ?auto_170461 ?auto_170464 ) ) ( not ( = ?auto_170461 ?auto_170465 ) ) ( not ( = ?auto_170462 ?auto_170463 ) ) ( not ( = ?auto_170462 ?auto_170464 ) ) ( not ( = ?auto_170462 ?auto_170465 ) ) ( not ( = ?auto_170463 ?auto_170464 ) ) ( not ( = ?auto_170463 ?auto_170465 ) ) ( not ( = ?auto_170464 ?auto_170465 ) ) ( ON ?auto_170463 ?auto_170464 ) ( CLEAR ?auto_170461 ) ( ON ?auto_170462 ?auto_170463 ) ( CLEAR ?auto_170462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_170456 ?auto_170457 ?auto_170458 ?auto_170459 ?auto_170460 ?auto_170461 ?auto_170462 )
      ( MAKE-9PILE ?auto_170456 ?auto_170457 ?auto_170458 ?auto_170459 ?auto_170460 ?auto_170461 ?auto_170462 ?auto_170463 ?auto_170464 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_170494 - BLOCK
      ?auto_170495 - BLOCK
      ?auto_170496 - BLOCK
      ?auto_170497 - BLOCK
      ?auto_170498 - BLOCK
      ?auto_170499 - BLOCK
      ?auto_170500 - BLOCK
      ?auto_170501 - BLOCK
      ?auto_170502 - BLOCK
    )
    :vars
    (
      ?auto_170503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170502 ?auto_170503 ) ( ON-TABLE ?auto_170494 ) ( ON ?auto_170495 ?auto_170494 ) ( ON ?auto_170496 ?auto_170495 ) ( ON ?auto_170497 ?auto_170496 ) ( ON ?auto_170498 ?auto_170497 ) ( not ( = ?auto_170494 ?auto_170495 ) ) ( not ( = ?auto_170494 ?auto_170496 ) ) ( not ( = ?auto_170494 ?auto_170497 ) ) ( not ( = ?auto_170494 ?auto_170498 ) ) ( not ( = ?auto_170494 ?auto_170499 ) ) ( not ( = ?auto_170494 ?auto_170500 ) ) ( not ( = ?auto_170494 ?auto_170501 ) ) ( not ( = ?auto_170494 ?auto_170502 ) ) ( not ( = ?auto_170494 ?auto_170503 ) ) ( not ( = ?auto_170495 ?auto_170496 ) ) ( not ( = ?auto_170495 ?auto_170497 ) ) ( not ( = ?auto_170495 ?auto_170498 ) ) ( not ( = ?auto_170495 ?auto_170499 ) ) ( not ( = ?auto_170495 ?auto_170500 ) ) ( not ( = ?auto_170495 ?auto_170501 ) ) ( not ( = ?auto_170495 ?auto_170502 ) ) ( not ( = ?auto_170495 ?auto_170503 ) ) ( not ( = ?auto_170496 ?auto_170497 ) ) ( not ( = ?auto_170496 ?auto_170498 ) ) ( not ( = ?auto_170496 ?auto_170499 ) ) ( not ( = ?auto_170496 ?auto_170500 ) ) ( not ( = ?auto_170496 ?auto_170501 ) ) ( not ( = ?auto_170496 ?auto_170502 ) ) ( not ( = ?auto_170496 ?auto_170503 ) ) ( not ( = ?auto_170497 ?auto_170498 ) ) ( not ( = ?auto_170497 ?auto_170499 ) ) ( not ( = ?auto_170497 ?auto_170500 ) ) ( not ( = ?auto_170497 ?auto_170501 ) ) ( not ( = ?auto_170497 ?auto_170502 ) ) ( not ( = ?auto_170497 ?auto_170503 ) ) ( not ( = ?auto_170498 ?auto_170499 ) ) ( not ( = ?auto_170498 ?auto_170500 ) ) ( not ( = ?auto_170498 ?auto_170501 ) ) ( not ( = ?auto_170498 ?auto_170502 ) ) ( not ( = ?auto_170498 ?auto_170503 ) ) ( not ( = ?auto_170499 ?auto_170500 ) ) ( not ( = ?auto_170499 ?auto_170501 ) ) ( not ( = ?auto_170499 ?auto_170502 ) ) ( not ( = ?auto_170499 ?auto_170503 ) ) ( not ( = ?auto_170500 ?auto_170501 ) ) ( not ( = ?auto_170500 ?auto_170502 ) ) ( not ( = ?auto_170500 ?auto_170503 ) ) ( not ( = ?auto_170501 ?auto_170502 ) ) ( not ( = ?auto_170501 ?auto_170503 ) ) ( not ( = ?auto_170502 ?auto_170503 ) ) ( ON ?auto_170501 ?auto_170502 ) ( ON ?auto_170500 ?auto_170501 ) ( CLEAR ?auto_170498 ) ( ON ?auto_170499 ?auto_170500 ) ( CLEAR ?auto_170499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_170494 ?auto_170495 ?auto_170496 ?auto_170497 ?auto_170498 ?auto_170499 )
      ( MAKE-9PILE ?auto_170494 ?auto_170495 ?auto_170496 ?auto_170497 ?auto_170498 ?auto_170499 ?auto_170500 ?auto_170501 ?auto_170502 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_170532 - BLOCK
      ?auto_170533 - BLOCK
      ?auto_170534 - BLOCK
      ?auto_170535 - BLOCK
      ?auto_170536 - BLOCK
      ?auto_170537 - BLOCK
      ?auto_170538 - BLOCK
      ?auto_170539 - BLOCK
      ?auto_170540 - BLOCK
    )
    :vars
    (
      ?auto_170541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170540 ?auto_170541 ) ( ON-TABLE ?auto_170532 ) ( ON ?auto_170533 ?auto_170532 ) ( ON ?auto_170534 ?auto_170533 ) ( ON ?auto_170535 ?auto_170534 ) ( not ( = ?auto_170532 ?auto_170533 ) ) ( not ( = ?auto_170532 ?auto_170534 ) ) ( not ( = ?auto_170532 ?auto_170535 ) ) ( not ( = ?auto_170532 ?auto_170536 ) ) ( not ( = ?auto_170532 ?auto_170537 ) ) ( not ( = ?auto_170532 ?auto_170538 ) ) ( not ( = ?auto_170532 ?auto_170539 ) ) ( not ( = ?auto_170532 ?auto_170540 ) ) ( not ( = ?auto_170532 ?auto_170541 ) ) ( not ( = ?auto_170533 ?auto_170534 ) ) ( not ( = ?auto_170533 ?auto_170535 ) ) ( not ( = ?auto_170533 ?auto_170536 ) ) ( not ( = ?auto_170533 ?auto_170537 ) ) ( not ( = ?auto_170533 ?auto_170538 ) ) ( not ( = ?auto_170533 ?auto_170539 ) ) ( not ( = ?auto_170533 ?auto_170540 ) ) ( not ( = ?auto_170533 ?auto_170541 ) ) ( not ( = ?auto_170534 ?auto_170535 ) ) ( not ( = ?auto_170534 ?auto_170536 ) ) ( not ( = ?auto_170534 ?auto_170537 ) ) ( not ( = ?auto_170534 ?auto_170538 ) ) ( not ( = ?auto_170534 ?auto_170539 ) ) ( not ( = ?auto_170534 ?auto_170540 ) ) ( not ( = ?auto_170534 ?auto_170541 ) ) ( not ( = ?auto_170535 ?auto_170536 ) ) ( not ( = ?auto_170535 ?auto_170537 ) ) ( not ( = ?auto_170535 ?auto_170538 ) ) ( not ( = ?auto_170535 ?auto_170539 ) ) ( not ( = ?auto_170535 ?auto_170540 ) ) ( not ( = ?auto_170535 ?auto_170541 ) ) ( not ( = ?auto_170536 ?auto_170537 ) ) ( not ( = ?auto_170536 ?auto_170538 ) ) ( not ( = ?auto_170536 ?auto_170539 ) ) ( not ( = ?auto_170536 ?auto_170540 ) ) ( not ( = ?auto_170536 ?auto_170541 ) ) ( not ( = ?auto_170537 ?auto_170538 ) ) ( not ( = ?auto_170537 ?auto_170539 ) ) ( not ( = ?auto_170537 ?auto_170540 ) ) ( not ( = ?auto_170537 ?auto_170541 ) ) ( not ( = ?auto_170538 ?auto_170539 ) ) ( not ( = ?auto_170538 ?auto_170540 ) ) ( not ( = ?auto_170538 ?auto_170541 ) ) ( not ( = ?auto_170539 ?auto_170540 ) ) ( not ( = ?auto_170539 ?auto_170541 ) ) ( not ( = ?auto_170540 ?auto_170541 ) ) ( ON ?auto_170539 ?auto_170540 ) ( ON ?auto_170538 ?auto_170539 ) ( ON ?auto_170537 ?auto_170538 ) ( CLEAR ?auto_170535 ) ( ON ?auto_170536 ?auto_170537 ) ( CLEAR ?auto_170536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_170532 ?auto_170533 ?auto_170534 ?auto_170535 ?auto_170536 )
      ( MAKE-9PILE ?auto_170532 ?auto_170533 ?auto_170534 ?auto_170535 ?auto_170536 ?auto_170537 ?auto_170538 ?auto_170539 ?auto_170540 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_170570 - BLOCK
      ?auto_170571 - BLOCK
      ?auto_170572 - BLOCK
      ?auto_170573 - BLOCK
      ?auto_170574 - BLOCK
      ?auto_170575 - BLOCK
      ?auto_170576 - BLOCK
      ?auto_170577 - BLOCK
      ?auto_170578 - BLOCK
    )
    :vars
    (
      ?auto_170579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170578 ?auto_170579 ) ( ON-TABLE ?auto_170570 ) ( ON ?auto_170571 ?auto_170570 ) ( ON ?auto_170572 ?auto_170571 ) ( not ( = ?auto_170570 ?auto_170571 ) ) ( not ( = ?auto_170570 ?auto_170572 ) ) ( not ( = ?auto_170570 ?auto_170573 ) ) ( not ( = ?auto_170570 ?auto_170574 ) ) ( not ( = ?auto_170570 ?auto_170575 ) ) ( not ( = ?auto_170570 ?auto_170576 ) ) ( not ( = ?auto_170570 ?auto_170577 ) ) ( not ( = ?auto_170570 ?auto_170578 ) ) ( not ( = ?auto_170570 ?auto_170579 ) ) ( not ( = ?auto_170571 ?auto_170572 ) ) ( not ( = ?auto_170571 ?auto_170573 ) ) ( not ( = ?auto_170571 ?auto_170574 ) ) ( not ( = ?auto_170571 ?auto_170575 ) ) ( not ( = ?auto_170571 ?auto_170576 ) ) ( not ( = ?auto_170571 ?auto_170577 ) ) ( not ( = ?auto_170571 ?auto_170578 ) ) ( not ( = ?auto_170571 ?auto_170579 ) ) ( not ( = ?auto_170572 ?auto_170573 ) ) ( not ( = ?auto_170572 ?auto_170574 ) ) ( not ( = ?auto_170572 ?auto_170575 ) ) ( not ( = ?auto_170572 ?auto_170576 ) ) ( not ( = ?auto_170572 ?auto_170577 ) ) ( not ( = ?auto_170572 ?auto_170578 ) ) ( not ( = ?auto_170572 ?auto_170579 ) ) ( not ( = ?auto_170573 ?auto_170574 ) ) ( not ( = ?auto_170573 ?auto_170575 ) ) ( not ( = ?auto_170573 ?auto_170576 ) ) ( not ( = ?auto_170573 ?auto_170577 ) ) ( not ( = ?auto_170573 ?auto_170578 ) ) ( not ( = ?auto_170573 ?auto_170579 ) ) ( not ( = ?auto_170574 ?auto_170575 ) ) ( not ( = ?auto_170574 ?auto_170576 ) ) ( not ( = ?auto_170574 ?auto_170577 ) ) ( not ( = ?auto_170574 ?auto_170578 ) ) ( not ( = ?auto_170574 ?auto_170579 ) ) ( not ( = ?auto_170575 ?auto_170576 ) ) ( not ( = ?auto_170575 ?auto_170577 ) ) ( not ( = ?auto_170575 ?auto_170578 ) ) ( not ( = ?auto_170575 ?auto_170579 ) ) ( not ( = ?auto_170576 ?auto_170577 ) ) ( not ( = ?auto_170576 ?auto_170578 ) ) ( not ( = ?auto_170576 ?auto_170579 ) ) ( not ( = ?auto_170577 ?auto_170578 ) ) ( not ( = ?auto_170577 ?auto_170579 ) ) ( not ( = ?auto_170578 ?auto_170579 ) ) ( ON ?auto_170577 ?auto_170578 ) ( ON ?auto_170576 ?auto_170577 ) ( ON ?auto_170575 ?auto_170576 ) ( ON ?auto_170574 ?auto_170575 ) ( CLEAR ?auto_170572 ) ( ON ?auto_170573 ?auto_170574 ) ( CLEAR ?auto_170573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_170570 ?auto_170571 ?auto_170572 ?auto_170573 )
      ( MAKE-9PILE ?auto_170570 ?auto_170571 ?auto_170572 ?auto_170573 ?auto_170574 ?auto_170575 ?auto_170576 ?auto_170577 ?auto_170578 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_170608 - BLOCK
      ?auto_170609 - BLOCK
      ?auto_170610 - BLOCK
      ?auto_170611 - BLOCK
      ?auto_170612 - BLOCK
      ?auto_170613 - BLOCK
      ?auto_170614 - BLOCK
      ?auto_170615 - BLOCK
      ?auto_170616 - BLOCK
    )
    :vars
    (
      ?auto_170617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170616 ?auto_170617 ) ( ON-TABLE ?auto_170608 ) ( ON ?auto_170609 ?auto_170608 ) ( not ( = ?auto_170608 ?auto_170609 ) ) ( not ( = ?auto_170608 ?auto_170610 ) ) ( not ( = ?auto_170608 ?auto_170611 ) ) ( not ( = ?auto_170608 ?auto_170612 ) ) ( not ( = ?auto_170608 ?auto_170613 ) ) ( not ( = ?auto_170608 ?auto_170614 ) ) ( not ( = ?auto_170608 ?auto_170615 ) ) ( not ( = ?auto_170608 ?auto_170616 ) ) ( not ( = ?auto_170608 ?auto_170617 ) ) ( not ( = ?auto_170609 ?auto_170610 ) ) ( not ( = ?auto_170609 ?auto_170611 ) ) ( not ( = ?auto_170609 ?auto_170612 ) ) ( not ( = ?auto_170609 ?auto_170613 ) ) ( not ( = ?auto_170609 ?auto_170614 ) ) ( not ( = ?auto_170609 ?auto_170615 ) ) ( not ( = ?auto_170609 ?auto_170616 ) ) ( not ( = ?auto_170609 ?auto_170617 ) ) ( not ( = ?auto_170610 ?auto_170611 ) ) ( not ( = ?auto_170610 ?auto_170612 ) ) ( not ( = ?auto_170610 ?auto_170613 ) ) ( not ( = ?auto_170610 ?auto_170614 ) ) ( not ( = ?auto_170610 ?auto_170615 ) ) ( not ( = ?auto_170610 ?auto_170616 ) ) ( not ( = ?auto_170610 ?auto_170617 ) ) ( not ( = ?auto_170611 ?auto_170612 ) ) ( not ( = ?auto_170611 ?auto_170613 ) ) ( not ( = ?auto_170611 ?auto_170614 ) ) ( not ( = ?auto_170611 ?auto_170615 ) ) ( not ( = ?auto_170611 ?auto_170616 ) ) ( not ( = ?auto_170611 ?auto_170617 ) ) ( not ( = ?auto_170612 ?auto_170613 ) ) ( not ( = ?auto_170612 ?auto_170614 ) ) ( not ( = ?auto_170612 ?auto_170615 ) ) ( not ( = ?auto_170612 ?auto_170616 ) ) ( not ( = ?auto_170612 ?auto_170617 ) ) ( not ( = ?auto_170613 ?auto_170614 ) ) ( not ( = ?auto_170613 ?auto_170615 ) ) ( not ( = ?auto_170613 ?auto_170616 ) ) ( not ( = ?auto_170613 ?auto_170617 ) ) ( not ( = ?auto_170614 ?auto_170615 ) ) ( not ( = ?auto_170614 ?auto_170616 ) ) ( not ( = ?auto_170614 ?auto_170617 ) ) ( not ( = ?auto_170615 ?auto_170616 ) ) ( not ( = ?auto_170615 ?auto_170617 ) ) ( not ( = ?auto_170616 ?auto_170617 ) ) ( ON ?auto_170615 ?auto_170616 ) ( ON ?auto_170614 ?auto_170615 ) ( ON ?auto_170613 ?auto_170614 ) ( ON ?auto_170612 ?auto_170613 ) ( ON ?auto_170611 ?auto_170612 ) ( CLEAR ?auto_170609 ) ( ON ?auto_170610 ?auto_170611 ) ( CLEAR ?auto_170610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_170608 ?auto_170609 ?auto_170610 )
      ( MAKE-9PILE ?auto_170608 ?auto_170609 ?auto_170610 ?auto_170611 ?auto_170612 ?auto_170613 ?auto_170614 ?auto_170615 ?auto_170616 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_170646 - BLOCK
      ?auto_170647 - BLOCK
      ?auto_170648 - BLOCK
      ?auto_170649 - BLOCK
      ?auto_170650 - BLOCK
      ?auto_170651 - BLOCK
      ?auto_170652 - BLOCK
      ?auto_170653 - BLOCK
      ?auto_170654 - BLOCK
    )
    :vars
    (
      ?auto_170655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170654 ?auto_170655 ) ( ON-TABLE ?auto_170646 ) ( not ( = ?auto_170646 ?auto_170647 ) ) ( not ( = ?auto_170646 ?auto_170648 ) ) ( not ( = ?auto_170646 ?auto_170649 ) ) ( not ( = ?auto_170646 ?auto_170650 ) ) ( not ( = ?auto_170646 ?auto_170651 ) ) ( not ( = ?auto_170646 ?auto_170652 ) ) ( not ( = ?auto_170646 ?auto_170653 ) ) ( not ( = ?auto_170646 ?auto_170654 ) ) ( not ( = ?auto_170646 ?auto_170655 ) ) ( not ( = ?auto_170647 ?auto_170648 ) ) ( not ( = ?auto_170647 ?auto_170649 ) ) ( not ( = ?auto_170647 ?auto_170650 ) ) ( not ( = ?auto_170647 ?auto_170651 ) ) ( not ( = ?auto_170647 ?auto_170652 ) ) ( not ( = ?auto_170647 ?auto_170653 ) ) ( not ( = ?auto_170647 ?auto_170654 ) ) ( not ( = ?auto_170647 ?auto_170655 ) ) ( not ( = ?auto_170648 ?auto_170649 ) ) ( not ( = ?auto_170648 ?auto_170650 ) ) ( not ( = ?auto_170648 ?auto_170651 ) ) ( not ( = ?auto_170648 ?auto_170652 ) ) ( not ( = ?auto_170648 ?auto_170653 ) ) ( not ( = ?auto_170648 ?auto_170654 ) ) ( not ( = ?auto_170648 ?auto_170655 ) ) ( not ( = ?auto_170649 ?auto_170650 ) ) ( not ( = ?auto_170649 ?auto_170651 ) ) ( not ( = ?auto_170649 ?auto_170652 ) ) ( not ( = ?auto_170649 ?auto_170653 ) ) ( not ( = ?auto_170649 ?auto_170654 ) ) ( not ( = ?auto_170649 ?auto_170655 ) ) ( not ( = ?auto_170650 ?auto_170651 ) ) ( not ( = ?auto_170650 ?auto_170652 ) ) ( not ( = ?auto_170650 ?auto_170653 ) ) ( not ( = ?auto_170650 ?auto_170654 ) ) ( not ( = ?auto_170650 ?auto_170655 ) ) ( not ( = ?auto_170651 ?auto_170652 ) ) ( not ( = ?auto_170651 ?auto_170653 ) ) ( not ( = ?auto_170651 ?auto_170654 ) ) ( not ( = ?auto_170651 ?auto_170655 ) ) ( not ( = ?auto_170652 ?auto_170653 ) ) ( not ( = ?auto_170652 ?auto_170654 ) ) ( not ( = ?auto_170652 ?auto_170655 ) ) ( not ( = ?auto_170653 ?auto_170654 ) ) ( not ( = ?auto_170653 ?auto_170655 ) ) ( not ( = ?auto_170654 ?auto_170655 ) ) ( ON ?auto_170653 ?auto_170654 ) ( ON ?auto_170652 ?auto_170653 ) ( ON ?auto_170651 ?auto_170652 ) ( ON ?auto_170650 ?auto_170651 ) ( ON ?auto_170649 ?auto_170650 ) ( ON ?auto_170648 ?auto_170649 ) ( CLEAR ?auto_170646 ) ( ON ?auto_170647 ?auto_170648 ) ( CLEAR ?auto_170647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_170646 ?auto_170647 )
      ( MAKE-9PILE ?auto_170646 ?auto_170647 ?auto_170648 ?auto_170649 ?auto_170650 ?auto_170651 ?auto_170652 ?auto_170653 ?auto_170654 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_170684 - BLOCK
      ?auto_170685 - BLOCK
      ?auto_170686 - BLOCK
      ?auto_170687 - BLOCK
      ?auto_170688 - BLOCK
      ?auto_170689 - BLOCK
      ?auto_170690 - BLOCK
      ?auto_170691 - BLOCK
      ?auto_170692 - BLOCK
    )
    :vars
    (
      ?auto_170693 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170692 ?auto_170693 ) ( not ( = ?auto_170684 ?auto_170685 ) ) ( not ( = ?auto_170684 ?auto_170686 ) ) ( not ( = ?auto_170684 ?auto_170687 ) ) ( not ( = ?auto_170684 ?auto_170688 ) ) ( not ( = ?auto_170684 ?auto_170689 ) ) ( not ( = ?auto_170684 ?auto_170690 ) ) ( not ( = ?auto_170684 ?auto_170691 ) ) ( not ( = ?auto_170684 ?auto_170692 ) ) ( not ( = ?auto_170684 ?auto_170693 ) ) ( not ( = ?auto_170685 ?auto_170686 ) ) ( not ( = ?auto_170685 ?auto_170687 ) ) ( not ( = ?auto_170685 ?auto_170688 ) ) ( not ( = ?auto_170685 ?auto_170689 ) ) ( not ( = ?auto_170685 ?auto_170690 ) ) ( not ( = ?auto_170685 ?auto_170691 ) ) ( not ( = ?auto_170685 ?auto_170692 ) ) ( not ( = ?auto_170685 ?auto_170693 ) ) ( not ( = ?auto_170686 ?auto_170687 ) ) ( not ( = ?auto_170686 ?auto_170688 ) ) ( not ( = ?auto_170686 ?auto_170689 ) ) ( not ( = ?auto_170686 ?auto_170690 ) ) ( not ( = ?auto_170686 ?auto_170691 ) ) ( not ( = ?auto_170686 ?auto_170692 ) ) ( not ( = ?auto_170686 ?auto_170693 ) ) ( not ( = ?auto_170687 ?auto_170688 ) ) ( not ( = ?auto_170687 ?auto_170689 ) ) ( not ( = ?auto_170687 ?auto_170690 ) ) ( not ( = ?auto_170687 ?auto_170691 ) ) ( not ( = ?auto_170687 ?auto_170692 ) ) ( not ( = ?auto_170687 ?auto_170693 ) ) ( not ( = ?auto_170688 ?auto_170689 ) ) ( not ( = ?auto_170688 ?auto_170690 ) ) ( not ( = ?auto_170688 ?auto_170691 ) ) ( not ( = ?auto_170688 ?auto_170692 ) ) ( not ( = ?auto_170688 ?auto_170693 ) ) ( not ( = ?auto_170689 ?auto_170690 ) ) ( not ( = ?auto_170689 ?auto_170691 ) ) ( not ( = ?auto_170689 ?auto_170692 ) ) ( not ( = ?auto_170689 ?auto_170693 ) ) ( not ( = ?auto_170690 ?auto_170691 ) ) ( not ( = ?auto_170690 ?auto_170692 ) ) ( not ( = ?auto_170690 ?auto_170693 ) ) ( not ( = ?auto_170691 ?auto_170692 ) ) ( not ( = ?auto_170691 ?auto_170693 ) ) ( not ( = ?auto_170692 ?auto_170693 ) ) ( ON ?auto_170691 ?auto_170692 ) ( ON ?auto_170690 ?auto_170691 ) ( ON ?auto_170689 ?auto_170690 ) ( ON ?auto_170688 ?auto_170689 ) ( ON ?auto_170687 ?auto_170688 ) ( ON ?auto_170686 ?auto_170687 ) ( ON ?auto_170685 ?auto_170686 ) ( ON ?auto_170684 ?auto_170685 ) ( CLEAR ?auto_170684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_170684 )
      ( MAKE-9PILE ?auto_170684 ?auto_170685 ?auto_170686 ?auto_170687 ?auto_170688 ?auto_170689 ?auto_170690 ?auto_170691 ?auto_170692 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_170723 - BLOCK
      ?auto_170724 - BLOCK
      ?auto_170725 - BLOCK
      ?auto_170726 - BLOCK
      ?auto_170727 - BLOCK
      ?auto_170728 - BLOCK
      ?auto_170729 - BLOCK
      ?auto_170730 - BLOCK
      ?auto_170731 - BLOCK
      ?auto_170732 - BLOCK
    )
    :vars
    (
      ?auto_170733 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_170731 ) ( ON ?auto_170732 ?auto_170733 ) ( CLEAR ?auto_170732 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_170723 ) ( ON ?auto_170724 ?auto_170723 ) ( ON ?auto_170725 ?auto_170724 ) ( ON ?auto_170726 ?auto_170725 ) ( ON ?auto_170727 ?auto_170726 ) ( ON ?auto_170728 ?auto_170727 ) ( ON ?auto_170729 ?auto_170728 ) ( ON ?auto_170730 ?auto_170729 ) ( ON ?auto_170731 ?auto_170730 ) ( not ( = ?auto_170723 ?auto_170724 ) ) ( not ( = ?auto_170723 ?auto_170725 ) ) ( not ( = ?auto_170723 ?auto_170726 ) ) ( not ( = ?auto_170723 ?auto_170727 ) ) ( not ( = ?auto_170723 ?auto_170728 ) ) ( not ( = ?auto_170723 ?auto_170729 ) ) ( not ( = ?auto_170723 ?auto_170730 ) ) ( not ( = ?auto_170723 ?auto_170731 ) ) ( not ( = ?auto_170723 ?auto_170732 ) ) ( not ( = ?auto_170723 ?auto_170733 ) ) ( not ( = ?auto_170724 ?auto_170725 ) ) ( not ( = ?auto_170724 ?auto_170726 ) ) ( not ( = ?auto_170724 ?auto_170727 ) ) ( not ( = ?auto_170724 ?auto_170728 ) ) ( not ( = ?auto_170724 ?auto_170729 ) ) ( not ( = ?auto_170724 ?auto_170730 ) ) ( not ( = ?auto_170724 ?auto_170731 ) ) ( not ( = ?auto_170724 ?auto_170732 ) ) ( not ( = ?auto_170724 ?auto_170733 ) ) ( not ( = ?auto_170725 ?auto_170726 ) ) ( not ( = ?auto_170725 ?auto_170727 ) ) ( not ( = ?auto_170725 ?auto_170728 ) ) ( not ( = ?auto_170725 ?auto_170729 ) ) ( not ( = ?auto_170725 ?auto_170730 ) ) ( not ( = ?auto_170725 ?auto_170731 ) ) ( not ( = ?auto_170725 ?auto_170732 ) ) ( not ( = ?auto_170725 ?auto_170733 ) ) ( not ( = ?auto_170726 ?auto_170727 ) ) ( not ( = ?auto_170726 ?auto_170728 ) ) ( not ( = ?auto_170726 ?auto_170729 ) ) ( not ( = ?auto_170726 ?auto_170730 ) ) ( not ( = ?auto_170726 ?auto_170731 ) ) ( not ( = ?auto_170726 ?auto_170732 ) ) ( not ( = ?auto_170726 ?auto_170733 ) ) ( not ( = ?auto_170727 ?auto_170728 ) ) ( not ( = ?auto_170727 ?auto_170729 ) ) ( not ( = ?auto_170727 ?auto_170730 ) ) ( not ( = ?auto_170727 ?auto_170731 ) ) ( not ( = ?auto_170727 ?auto_170732 ) ) ( not ( = ?auto_170727 ?auto_170733 ) ) ( not ( = ?auto_170728 ?auto_170729 ) ) ( not ( = ?auto_170728 ?auto_170730 ) ) ( not ( = ?auto_170728 ?auto_170731 ) ) ( not ( = ?auto_170728 ?auto_170732 ) ) ( not ( = ?auto_170728 ?auto_170733 ) ) ( not ( = ?auto_170729 ?auto_170730 ) ) ( not ( = ?auto_170729 ?auto_170731 ) ) ( not ( = ?auto_170729 ?auto_170732 ) ) ( not ( = ?auto_170729 ?auto_170733 ) ) ( not ( = ?auto_170730 ?auto_170731 ) ) ( not ( = ?auto_170730 ?auto_170732 ) ) ( not ( = ?auto_170730 ?auto_170733 ) ) ( not ( = ?auto_170731 ?auto_170732 ) ) ( not ( = ?auto_170731 ?auto_170733 ) ) ( not ( = ?auto_170732 ?auto_170733 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_170732 ?auto_170733 )
      ( !STACK ?auto_170732 ?auto_170731 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_170765 - BLOCK
      ?auto_170766 - BLOCK
      ?auto_170767 - BLOCK
      ?auto_170768 - BLOCK
      ?auto_170769 - BLOCK
      ?auto_170770 - BLOCK
      ?auto_170771 - BLOCK
      ?auto_170772 - BLOCK
      ?auto_170773 - BLOCK
      ?auto_170774 - BLOCK
    )
    :vars
    (
      ?auto_170775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170774 ?auto_170775 ) ( ON-TABLE ?auto_170765 ) ( ON ?auto_170766 ?auto_170765 ) ( ON ?auto_170767 ?auto_170766 ) ( ON ?auto_170768 ?auto_170767 ) ( ON ?auto_170769 ?auto_170768 ) ( ON ?auto_170770 ?auto_170769 ) ( ON ?auto_170771 ?auto_170770 ) ( ON ?auto_170772 ?auto_170771 ) ( not ( = ?auto_170765 ?auto_170766 ) ) ( not ( = ?auto_170765 ?auto_170767 ) ) ( not ( = ?auto_170765 ?auto_170768 ) ) ( not ( = ?auto_170765 ?auto_170769 ) ) ( not ( = ?auto_170765 ?auto_170770 ) ) ( not ( = ?auto_170765 ?auto_170771 ) ) ( not ( = ?auto_170765 ?auto_170772 ) ) ( not ( = ?auto_170765 ?auto_170773 ) ) ( not ( = ?auto_170765 ?auto_170774 ) ) ( not ( = ?auto_170765 ?auto_170775 ) ) ( not ( = ?auto_170766 ?auto_170767 ) ) ( not ( = ?auto_170766 ?auto_170768 ) ) ( not ( = ?auto_170766 ?auto_170769 ) ) ( not ( = ?auto_170766 ?auto_170770 ) ) ( not ( = ?auto_170766 ?auto_170771 ) ) ( not ( = ?auto_170766 ?auto_170772 ) ) ( not ( = ?auto_170766 ?auto_170773 ) ) ( not ( = ?auto_170766 ?auto_170774 ) ) ( not ( = ?auto_170766 ?auto_170775 ) ) ( not ( = ?auto_170767 ?auto_170768 ) ) ( not ( = ?auto_170767 ?auto_170769 ) ) ( not ( = ?auto_170767 ?auto_170770 ) ) ( not ( = ?auto_170767 ?auto_170771 ) ) ( not ( = ?auto_170767 ?auto_170772 ) ) ( not ( = ?auto_170767 ?auto_170773 ) ) ( not ( = ?auto_170767 ?auto_170774 ) ) ( not ( = ?auto_170767 ?auto_170775 ) ) ( not ( = ?auto_170768 ?auto_170769 ) ) ( not ( = ?auto_170768 ?auto_170770 ) ) ( not ( = ?auto_170768 ?auto_170771 ) ) ( not ( = ?auto_170768 ?auto_170772 ) ) ( not ( = ?auto_170768 ?auto_170773 ) ) ( not ( = ?auto_170768 ?auto_170774 ) ) ( not ( = ?auto_170768 ?auto_170775 ) ) ( not ( = ?auto_170769 ?auto_170770 ) ) ( not ( = ?auto_170769 ?auto_170771 ) ) ( not ( = ?auto_170769 ?auto_170772 ) ) ( not ( = ?auto_170769 ?auto_170773 ) ) ( not ( = ?auto_170769 ?auto_170774 ) ) ( not ( = ?auto_170769 ?auto_170775 ) ) ( not ( = ?auto_170770 ?auto_170771 ) ) ( not ( = ?auto_170770 ?auto_170772 ) ) ( not ( = ?auto_170770 ?auto_170773 ) ) ( not ( = ?auto_170770 ?auto_170774 ) ) ( not ( = ?auto_170770 ?auto_170775 ) ) ( not ( = ?auto_170771 ?auto_170772 ) ) ( not ( = ?auto_170771 ?auto_170773 ) ) ( not ( = ?auto_170771 ?auto_170774 ) ) ( not ( = ?auto_170771 ?auto_170775 ) ) ( not ( = ?auto_170772 ?auto_170773 ) ) ( not ( = ?auto_170772 ?auto_170774 ) ) ( not ( = ?auto_170772 ?auto_170775 ) ) ( not ( = ?auto_170773 ?auto_170774 ) ) ( not ( = ?auto_170773 ?auto_170775 ) ) ( not ( = ?auto_170774 ?auto_170775 ) ) ( CLEAR ?auto_170772 ) ( ON ?auto_170773 ?auto_170774 ) ( CLEAR ?auto_170773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_170765 ?auto_170766 ?auto_170767 ?auto_170768 ?auto_170769 ?auto_170770 ?auto_170771 ?auto_170772 ?auto_170773 )
      ( MAKE-10PILE ?auto_170765 ?auto_170766 ?auto_170767 ?auto_170768 ?auto_170769 ?auto_170770 ?auto_170771 ?auto_170772 ?auto_170773 ?auto_170774 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_170807 - BLOCK
      ?auto_170808 - BLOCK
      ?auto_170809 - BLOCK
      ?auto_170810 - BLOCK
      ?auto_170811 - BLOCK
      ?auto_170812 - BLOCK
      ?auto_170813 - BLOCK
      ?auto_170814 - BLOCK
      ?auto_170815 - BLOCK
      ?auto_170816 - BLOCK
    )
    :vars
    (
      ?auto_170817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170816 ?auto_170817 ) ( ON-TABLE ?auto_170807 ) ( ON ?auto_170808 ?auto_170807 ) ( ON ?auto_170809 ?auto_170808 ) ( ON ?auto_170810 ?auto_170809 ) ( ON ?auto_170811 ?auto_170810 ) ( ON ?auto_170812 ?auto_170811 ) ( ON ?auto_170813 ?auto_170812 ) ( not ( = ?auto_170807 ?auto_170808 ) ) ( not ( = ?auto_170807 ?auto_170809 ) ) ( not ( = ?auto_170807 ?auto_170810 ) ) ( not ( = ?auto_170807 ?auto_170811 ) ) ( not ( = ?auto_170807 ?auto_170812 ) ) ( not ( = ?auto_170807 ?auto_170813 ) ) ( not ( = ?auto_170807 ?auto_170814 ) ) ( not ( = ?auto_170807 ?auto_170815 ) ) ( not ( = ?auto_170807 ?auto_170816 ) ) ( not ( = ?auto_170807 ?auto_170817 ) ) ( not ( = ?auto_170808 ?auto_170809 ) ) ( not ( = ?auto_170808 ?auto_170810 ) ) ( not ( = ?auto_170808 ?auto_170811 ) ) ( not ( = ?auto_170808 ?auto_170812 ) ) ( not ( = ?auto_170808 ?auto_170813 ) ) ( not ( = ?auto_170808 ?auto_170814 ) ) ( not ( = ?auto_170808 ?auto_170815 ) ) ( not ( = ?auto_170808 ?auto_170816 ) ) ( not ( = ?auto_170808 ?auto_170817 ) ) ( not ( = ?auto_170809 ?auto_170810 ) ) ( not ( = ?auto_170809 ?auto_170811 ) ) ( not ( = ?auto_170809 ?auto_170812 ) ) ( not ( = ?auto_170809 ?auto_170813 ) ) ( not ( = ?auto_170809 ?auto_170814 ) ) ( not ( = ?auto_170809 ?auto_170815 ) ) ( not ( = ?auto_170809 ?auto_170816 ) ) ( not ( = ?auto_170809 ?auto_170817 ) ) ( not ( = ?auto_170810 ?auto_170811 ) ) ( not ( = ?auto_170810 ?auto_170812 ) ) ( not ( = ?auto_170810 ?auto_170813 ) ) ( not ( = ?auto_170810 ?auto_170814 ) ) ( not ( = ?auto_170810 ?auto_170815 ) ) ( not ( = ?auto_170810 ?auto_170816 ) ) ( not ( = ?auto_170810 ?auto_170817 ) ) ( not ( = ?auto_170811 ?auto_170812 ) ) ( not ( = ?auto_170811 ?auto_170813 ) ) ( not ( = ?auto_170811 ?auto_170814 ) ) ( not ( = ?auto_170811 ?auto_170815 ) ) ( not ( = ?auto_170811 ?auto_170816 ) ) ( not ( = ?auto_170811 ?auto_170817 ) ) ( not ( = ?auto_170812 ?auto_170813 ) ) ( not ( = ?auto_170812 ?auto_170814 ) ) ( not ( = ?auto_170812 ?auto_170815 ) ) ( not ( = ?auto_170812 ?auto_170816 ) ) ( not ( = ?auto_170812 ?auto_170817 ) ) ( not ( = ?auto_170813 ?auto_170814 ) ) ( not ( = ?auto_170813 ?auto_170815 ) ) ( not ( = ?auto_170813 ?auto_170816 ) ) ( not ( = ?auto_170813 ?auto_170817 ) ) ( not ( = ?auto_170814 ?auto_170815 ) ) ( not ( = ?auto_170814 ?auto_170816 ) ) ( not ( = ?auto_170814 ?auto_170817 ) ) ( not ( = ?auto_170815 ?auto_170816 ) ) ( not ( = ?auto_170815 ?auto_170817 ) ) ( not ( = ?auto_170816 ?auto_170817 ) ) ( ON ?auto_170815 ?auto_170816 ) ( CLEAR ?auto_170813 ) ( ON ?auto_170814 ?auto_170815 ) ( CLEAR ?auto_170814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_170807 ?auto_170808 ?auto_170809 ?auto_170810 ?auto_170811 ?auto_170812 ?auto_170813 ?auto_170814 )
      ( MAKE-10PILE ?auto_170807 ?auto_170808 ?auto_170809 ?auto_170810 ?auto_170811 ?auto_170812 ?auto_170813 ?auto_170814 ?auto_170815 ?auto_170816 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_170849 - BLOCK
      ?auto_170850 - BLOCK
      ?auto_170851 - BLOCK
      ?auto_170852 - BLOCK
      ?auto_170853 - BLOCK
      ?auto_170854 - BLOCK
      ?auto_170855 - BLOCK
      ?auto_170856 - BLOCK
      ?auto_170857 - BLOCK
      ?auto_170858 - BLOCK
    )
    :vars
    (
      ?auto_170859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170858 ?auto_170859 ) ( ON-TABLE ?auto_170849 ) ( ON ?auto_170850 ?auto_170849 ) ( ON ?auto_170851 ?auto_170850 ) ( ON ?auto_170852 ?auto_170851 ) ( ON ?auto_170853 ?auto_170852 ) ( ON ?auto_170854 ?auto_170853 ) ( not ( = ?auto_170849 ?auto_170850 ) ) ( not ( = ?auto_170849 ?auto_170851 ) ) ( not ( = ?auto_170849 ?auto_170852 ) ) ( not ( = ?auto_170849 ?auto_170853 ) ) ( not ( = ?auto_170849 ?auto_170854 ) ) ( not ( = ?auto_170849 ?auto_170855 ) ) ( not ( = ?auto_170849 ?auto_170856 ) ) ( not ( = ?auto_170849 ?auto_170857 ) ) ( not ( = ?auto_170849 ?auto_170858 ) ) ( not ( = ?auto_170849 ?auto_170859 ) ) ( not ( = ?auto_170850 ?auto_170851 ) ) ( not ( = ?auto_170850 ?auto_170852 ) ) ( not ( = ?auto_170850 ?auto_170853 ) ) ( not ( = ?auto_170850 ?auto_170854 ) ) ( not ( = ?auto_170850 ?auto_170855 ) ) ( not ( = ?auto_170850 ?auto_170856 ) ) ( not ( = ?auto_170850 ?auto_170857 ) ) ( not ( = ?auto_170850 ?auto_170858 ) ) ( not ( = ?auto_170850 ?auto_170859 ) ) ( not ( = ?auto_170851 ?auto_170852 ) ) ( not ( = ?auto_170851 ?auto_170853 ) ) ( not ( = ?auto_170851 ?auto_170854 ) ) ( not ( = ?auto_170851 ?auto_170855 ) ) ( not ( = ?auto_170851 ?auto_170856 ) ) ( not ( = ?auto_170851 ?auto_170857 ) ) ( not ( = ?auto_170851 ?auto_170858 ) ) ( not ( = ?auto_170851 ?auto_170859 ) ) ( not ( = ?auto_170852 ?auto_170853 ) ) ( not ( = ?auto_170852 ?auto_170854 ) ) ( not ( = ?auto_170852 ?auto_170855 ) ) ( not ( = ?auto_170852 ?auto_170856 ) ) ( not ( = ?auto_170852 ?auto_170857 ) ) ( not ( = ?auto_170852 ?auto_170858 ) ) ( not ( = ?auto_170852 ?auto_170859 ) ) ( not ( = ?auto_170853 ?auto_170854 ) ) ( not ( = ?auto_170853 ?auto_170855 ) ) ( not ( = ?auto_170853 ?auto_170856 ) ) ( not ( = ?auto_170853 ?auto_170857 ) ) ( not ( = ?auto_170853 ?auto_170858 ) ) ( not ( = ?auto_170853 ?auto_170859 ) ) ( not ( = ?auto_170854 ?auto_170855 ) ) ( not ( = ?auto_170854 ?auto_170856 ) ) ( not ( = ?auto_170854 ?auto_170857 ) ) ( not ( = ?auto_170854 ?auto_170858 ) ) ( not ( = ?auto_170854 ?auto_170859 ) ) ( not ( = ?auto_170855 ?auto_170856 ) ) ( not ( = ?auto_170855 ?auto_170857 ) ) ( not ( = ?auto_170855 ?auto_170858 ) ) ( not ( = ?auto_170855 ?auto_170859 ) ) ( not ( = ?auto_170856 ?auto_170857 ) ) ( not ( = ?auto_170856 ?auto_170858 ) ) ( not ( = ?auto_170856 ?auto_170859 ) ) ( not ( = ?auto_170857 ?auto_170858 ) ) ( not ( = ?auto_170857 ?auto_170859 ) ) ( not ( = ?auto_170858 ?auto_170859 ) ) ( ON ?auto_170857 ?auto_170858 ) ( ON ?auto_170856 ?auto_170857 ) ( CLEAR ?auto_170854 ) ( ON ?auto_170855 ?auto_170856 ) ( CLEAR ?auto_170855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_170849 ?auto_170850 ?auto_170851 ?auto_170852 ?auto_170853 ?auto_170854 ?auto_170855 )
      ( MAKE-10PILE ?auto_170849 ?auto_170850 ?auto_170851 ?auto_170852 ?auto_170853 ?auto_170854 ?auto_170855 ?auto_170856 ?auto_170857 ?auto_170858 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_170891 - BLOCK
      ?auto_170892 - BLOCK
      ?auto_170893 - BLOCK
      ?auto_170894 - BLOCK
      ?auto_170895 - BLOCK
      ?auto_170896 - BLOCK
      ?auto_170897 - BLOCK
      ?auto_170898 - BLOCK
      ?auto_170899 - BLOCK
      ?auto_170900 - BLOCK
    )
    :vars
    (
      ?auto_170901 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170900 ?auto_170901 ) ( ON-TABLE ?auto_170891 ) ( ON ?auto_170892 ?auto_170891 ) ( ON ?auto_170893 ?auto_170892 ) ( ON ?auto_170894 ?auto_170893 ) ( ON ?auto_170895 ?auto_170894 ) ( not ( = ?auto_170891 ?auto_170892 ) ) ( not ( = ?auto_170891 ?auto_170893 ) ) ( not ( = ?auto_170891 ?auto_170894 ) ) ( not ( = ?auto_170891 ?auto_170895 ) ) ( not ( = ?auto_170891 ?auto_170896 ) ) ( not ( = ?auto_170891 ?auto_170897 ) ) ( not ( = ?auto_170891 ?auto_170898 ) ) ( not ( = ?auto_170891 ?auto_170899 ) ) ( not ( = ?auto_170891 ?auto_170900 ) ) ( not ( = ?auto_170891 ?auto_170901 ) ) ( not ( = ?auto_170892 ?auto_170893 ) ) ( not ( = ?auto_170892 ?auto_170894 ) ) ( not ( = ?auto_170892 ?auto_170895 ) ) ( not ( = ?auto_170892 ?auto_170896 ) ) ( not ( = ?auto_170892 ?auto_170897 ) ) ( not ( = ?auto_170892 ?auto_170898 ) ) ( not ( = ?auto_170892 ?auto_170899 ) ) ( not ( = ?auto_170892 ?auto_170900 ) ) ( not ( = ?auto_170892 ?auto_170901 ) ) ( not ( = ?auto_170893 ?auto_170894 ) ) ( not ( = ?auto_170893 ?auto_170895 ) ) ( not ( = ?auto_170893 ?auto_170896 ) ) ( not ( = ?auto_170893 ?auto_170897 ) ) ( not ( = ?auto_170893 ?auto_170898 ) ) ( not ( = ?auto_170893 ?auto_170899 ) ) ( not ( = ?auto_170893 ?auto_170900 ) ) ( not ( = ?auto_170893 ?auto_170901 ) ) ( not ( = ?auto_170894 ?auto_170895 ) ) ( not ( = ?auto_170894 ?auto_170896 ) ) ( not ( = ?auto_170894 ?auto_170897 ) ) ( not ( = ?auto_170894 ?auto_170898 ) ) ( not ( = ?auto_170894 ?auto_170899 ) ) ( not ( = ?auto_170894 ?auto_170900 ) ) ( not ( = ?auto_170894 ?auto_170901 ) ) ( not ( = ?auto_170895 ?auto_170896 ) ) ( not ( = ?auto_170895 ?auto_170897 ) ) ( not ( = ?auto_170895 ?auto_170898 ) ) ( not ( = ?auto_170895 ?auto_170899 ) ) ( not ( = ?auto_170895 ?auto_170900 ) ) ( not ( = ?auto_170895 ?auto_170901 ) ) ( not ( = ?auto_170896 ?auto_170897 ) ) ( not ( = ?auto_170896 ?auto_170898 ) ) ( not ( = ?auto_170896 ?auto_170899 ) ) ( not ( = ?auto_170896 ?auto_170900 ) ) ( not ( = ?auto_170896 ?auto_170901 ) ) ( not ( = ?auto_170897 ?auto_170898 ) ) ( not ( = ?auto_170897 ?auto_170899 ) ) ( not ( = ?auto_170897 ?auto_170900 ) ) ( not ( = ?auto_170897 ?auto_170901 ) ) ( not ( = ?auto_170898 ?auto_170899 ) ) ( not ( = ?auto_170898 ?auto_170900 ) ) ( not ( = ?auto_170898 ?auto_170901 ) ) ( not ( = ?auto_170899 ?auto_170900 ) ) ( not ( = ?auto_170899 ?auto_170901 ) ) ( not ( = ?auto_170900 ?auto_170901 ) ) ( ON ?auto_170899 ?auto_170900 ) ( ON ?auto_170898 ?auto_170899 ) ( ON ?auto_170897 ?auto_170898 ) ( CLEAR ?auto_170895 ) ( ON ?auto_170896 ?auto_170897 ) ( CLEAR ?auto_170896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_170891 ?auto_170892 ?auto_170893 ?auto_170894 ?auto_170895 ?auto_170896 )
      ( MAKE-10PILE ?auto_170891 ?auto_170892 ?auto_170893 ?auto_170894 ?auto_170895 ?auto_170896 ?auto_170897 ?auto_170898 ?auto_170899 ?auto_170900 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_170933 - BLOCK
      ?auto_170934 - BLOCK
      ?auto_170935 - BLOCK
      ?auto_170936 - BLOCK
      ?auto_170937 - BLOCK
      ?auto_170938 - BLOCK
      ?auto_170939 - BLOCK
      ?auto_170940 - BLOCK
      ?auto_170941 - BLOCK
      ?auto_170942 - BLOCK
    )
    :vars
    (
      ?auto_170943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170942 ?auto_170943 ) ( ON-TABLE ?auto_170933 ) ( ON ?auto_170934 ?auto_170933 ) ( ON ?auto_170935 ?auto_170934 ) ( ON ?auto_170936 ?auto_170935 ) ( not ( = ?auto_170933 ?auto_170934 ) ) ( not ( = ?auto_170933 ?auto_170935 ) ) ( not ( = ?auto_170933 ?auto_170936 ) ) ( not ( = ?auto_170933 ?auto_170937 ) ) ( not ( = ?auto_170933 ?auto_170938 ) ) ( not ( = ?auto_170933 ?auto_170939 ) ) ( not ( = ?auto_170933 ?auto_170940 ) ) ( not ( = ?auto_170933 ?auto_170941 ) ) ( not ( = ?auto_170933 ?auto_170942 ) ) ( not ( = ?auto_170933 ?auto_170943 ) ) ( not ( = ?auto_170934 ?auto_170935 ) ) ( not ( = ?auto_170934 ?auto_170936 ) ) ( not ( = ?auto_170934 ?auto_170937 ) ) ( not ( = ?auto_170934 ?auto_170938 ) ) ( not ( = ?auto_170934 ?auto_170939 ) ) ( not ( = ?auto_170934 ?auto_170940 ) ) ( not ( = ?auto_170934 ?auto_170941 ) ) ( not ( = ?auto_170934 ?auto_170942 ) ) ( not ( = ?auto_170934 ?auto_170943 ) ) ( not ( = ?auto_170935 ?auto_170936 ) ) ( not ( = ?auto_170935 ?auto_170937 ) ) ( not ( = ?auto_170935 ?auto_170938 ) ) ( not ( = ?auto_170935 ?auto_170939 ) ) ( not ( = ?auto_170935 ?auto_170940 ) ) ( not ( = ?auto_170935 ?auto_170941 ) ) ( not ( = ?auto_170935 ?auto_170942 ) ) ( not ( = ?auto_170935 ?auto_170943 ) ) ( not ( = ?auto_170936 ?auto_170937 ) ) ( not ( = ?auto_170936 ?auto_170938 ) ) ( not ( = ?auto_170936 ?auto_170939 ) ) ( not ( = ?auto_170936 ?auto_170940 ) ) ( not ( = ?auto_170936 ?auto_170941 ) ) ( not ( = ?auto_170936 ?auto_170942 ) ) ( not ( = ?auto_170936 ?auto_170943 ) ) ( not ( = ?auto_170937 ?auto_170938 ) ) ( not ( = ?auto_170937 ?auto_170939 ) ) ( not ( = ?auto_170937 ?auto_170940 ) ) ( not ( = ?auto_170937 ?auto_170941 ) ) ( not ( = ?auto_170937 ?auto_170942 ) ) ( not ( = ?auto_170937 ?auto_170943 ) ) ( not ( = ?auto_170938 ?auto_170939 ) ) ( not ( = ?auto_170938 ?auto_170940 ) ) ( not ( = ?auto_170938 ?auto_170941 ) ) ( not ( = ?auto_170938 ?auto_170942 ) ) ( not ( = ?auto_170938 ?auto_170943 ) ) ( not ( = ?auto_170939 ?auto_170940 ) ) ( not ( = ?auto_170939 ?auto_170941 ) ) ( not ( = ?auto_170939 ?auto_170942 ) ) ( not ( = ?auto_170939 ?auto_170943 ) ) ( not ( = ?auto_170940 ?auto_170941 ) ) ( not ( = ?auto_170940 ?auto_170942 ) ) ( not ( = ?auto_170940 ?auto_170943 ) ) ( not ( = ?auto_170941 ?auto_170942 ) ) ( not ( = ?auto_170941 ?auto_170943 ) ) ( not ( = ?auto_170942 ?auto_170943 ) ) ( ON ?auto_170941 ?auto_170942 ) ( ON ?auto_170940 ?auto_170941 ) ( ON ?auto_170939 ?auto_170940 ) ( ON ?auto_170938 ?auto_170939 ) ( CLEAR ?auto_170936 ) ( ON ?auto_170937 ?auto_170938 ) ( CLEAR ?auto_170937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_170933 ?auto_170934 ?auto_170935 ?auto_170936 ?auto_170937 )
      ( MAKE-10PILE ?auto_170933 ?auto_170934 ?auto_170935 ?auto_170936 ?auto_170937 ?auto_170938 ?auto_170939 ?auto_170940 ?auto_170941 ?auto_170942 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_170975 - BLOCK
      ?auto_170976 - BLOCK
      ?auto_170977 - BLOCK
      ?auto_170978 - BLOCK
      ?auto_170979 - BLOCK
      ?auto_170980 - BLOCK
      ?auto_170981 - BLOCK
      ?auto_170982 - BLOCK
      ?auto_170983 - BLOCK
      ?auto_170984 - BLOCK
    )
    :vars
    (
      ?auto_170985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170984 ?auto_170985 ) ( ON-TABLE ?auto_170975 ) ( ON ?auto_170976 ?auto_170975 ) ( ON ?auto_170977 ?auto_170976 ) ( not ( = ?auto_170975 ?auto_170976 ) ) ( not ( = ?auto_170975 ?auto_170977 ) ) ( not ( = ?auto_170975 ?auto_170978 ) ) ( not ( = ?auto_170975 ?auto_170979 ) ) ( not ( = ?auto_170975 ?auto_170980 ) ) ( not ( = ?auto_170975 ?auto_170981 ) ) ( not ( = ?auto_170975 ?auto_170982 ) ) ( not ( = ?auto_170975 ?auto_170983 ) ) ( not ( = ?auto_170975 ?auto_170984 ) ) ( not ( = ?auto_170975 ?auto_170985 ) ) ( not ( = ?auto_170976 ?auto_170977 ) ) ( not ( = ?auto_170976 ?auto_170978 ) ) ( not ( = ?auto_170976 ?auto_170979 ) ) ( not ( = ?auto_170976 ?auto_170980 ) ) ( not ( = ?auto_170976 ?auto_170981 ) ) ( not ( = ?auto_170976 ?auto_170982 ) ) ( not ( = ?auto_170976 ?auto_170983 ) ) ( not ( = ?auto_170976 ?auto_170984 ) ) ( not ( = ?auto_170976 ?auto_170985 ) ) ( not ( = ?auto_170977 ?auto_170978 ) ) ( not ( = ?auto_170977 ?auto_170979 ) ) ( not ( = ?auto_170977 ?auto_170980 ) ) ( not ( = ?auto_170977 ?auto_170981 ) ) ( not ( = ?auto_170977 ?auto_170982 ) ) ( not ( = ?auto_170977 ?auto_170983 ) ) ( not ( = ?auto_170977 ?auto_170984 ) ) ( not ( = ?auto_170977 ?auto_170985 ) ) ( not ( = ?auto_170978 ?auto_170979 ) ) ( not ( = ?auto_170978 ?auto_170980 ) ) ( not ( = ?auto_170978 ?auto_170981 ) ) ( not ( = ?auto_170978 ?auto_170982 ) ) ( not ( = ?auto_170978 ?auto_170983 ) ) ( not ( = ?auto_170978 ?auto_170984 ) ) ( not ( = ?auto_170978 ?auto_170985 ) ) ( not ( = ?auto_170979 ?auto_170980 ) ) ( not ( = ?auto_170979 ?auto_170981 ) ) ( not ( = ?auto_170979 ?auto_170982 ) ) ( not ( = ?auto_170979 ?auto_170983 ) ) ( not ( = ?auto_170979 ?auto_170984 ) ) ( not ( = ?auto_170979 ?auto_170985 ) ) ( not ( = ?auto_170980 ?auto_170981 ) ) ( not ( = ?auto_170980 ?auto_170982 ) ) ( not ( = ?auto_170980 ?auto_170983 ) ) ( not ( = ?auto_170980 ?auto_170984 ) ) ( not ( = ?auto_170980 ?auto_170985 ) ) ( not ( = ?auto_170981 ?auto_170982 ) ) ( not ( = ?auto_170981 ?auto_170983 ) ) ( not ( = ?auto_170981 ?auto_170984 ) ) ( not ( = ?auto_170981 ?auto_170985 ) ) ( not ( = ?auto_170982 ?auto_170983 ) ) ( not ( = ?auto_170982 ?auto_170984 ) ) ( not ( = ?auto_170982 ?auto_170985 ) ) ( not ( = ?auto_170983 ?auto_170984 ) ) ( not ( = ?auto_170983 ?auto_170985 ) ) ( not ( = ?auto_170984 ?auto_170985 ) ) ( ON ?auto_170983 ?auto_170984 ) ( ON ?auto_170982 ?auto_170983 ) ( ON ?auto_170981 ?auto_170982 ) ( ON ?auto_170980 ?auto_170981 ) ( ON ?auto_170979 ?auto_170980 ) ( CLEAR ?auto_170977 ) ( ON ?auto_170978 ?auto_170979 ) ( CLEAR ?auto_170978 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_170975 ?auto_170976 ?auto_170977 ?auto_170978 )
      ( MAKE-10PILE ?auto_170975 ?auto_170976 ?auto_170977 ?auto_170978 ?auto_170979 ?auto_170980 ?auto_170981 ?auto_170982 ?auto_170983 ?auto_170984 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_171017 - BLOCK
      ?auto_171018 - BLOCK
      ?auto_171019 - BLOCK
      ?auto_171020 - BLOCK
      ?auto_171021 - BLOCK
      ?auto_171022 - BLOCK
      ?auto_171023 - BLOCK
      ?auto_171024 - BLOCK
      ?auto_171025 - BLOCK
      ?auto_171026 - BLOCK
    )
    :vars
    (
      ?auto_171027 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171026 ?auto_171027 ) ( ON-TABLE ?auto_171017 ) ( ON ?auto_171018 ?auto_171017 ) ( not ( = ?auto_171017 ?auto_171018 ) ) ( not ( = ?auto_171017 ?auto_171019 ) ) ( not ( = ?auto_171017 ?auto_171020 ) ) ( not ( = ?auto_171017 ?auto_171021 ) ) ( not ( = ?auto_171017 ?auto_171022 ) ) ( not ( = ?auto_171017 ?auto_171023 ) ) ( not ( = ?auto_171017 ?auto_171024 ) ) ( not ( = ?auto_171017 ?auto_171025 ) ) ( not ( = ?auto_171017 ?auto_171026 ) ) ( not ( = ?auto_171017 ?auto_171027 ) ) ( not ( = ?auto_171018 ?auto_171019 ) ) ( not ( = ?auto_171018 ?auto_171020 ) ) ( not ( = ?auto_171018 ?auto_171021 ) ) ( not ( = ?auto_171018 ?auto_171022 ) ) ( not ( = ?auto_171018 ?auto_171023 ) ) ( not ( = ?auto_171018 ?auto_171024 ) ) ( not ( = ?auto_171018 ?auto_171025 ) ) ( not ( = ?auto_171018 ?auto_171026 ) ) ( not ( = ?auto_171018 ?auto_171027 ) ) ( not ( = ?auto_171019 ?auto_171020 ) ) ( not ( = ?auto_171019 ?auto_171021 ) ) ( not ( = ?auto_171019 ?auto_171022 ) ) ( not ( = ?auto_171019 ?auto_171023 ) ) ( not ( = ?auto_171019 ?auto_171024 ) ) ( not ( = ?auto_171019 ?auto_171025 ) ) ( not ( = ?auto_171019 ?auto_171026 ) ) ( not ( = ?auto_171019 ?auto_171027 ) ) ( not ( = ?auto_171020 ?auto_171021 ) ) ( not ( = ?auto_171020 ?auto_171022 ) ) ( not ( = ?auto_171020 ?auto_171023 ) ) ( not ( = ?auto_171020 ?auto_171024 ) ) ( not ( = ?auto_171020 ?auto_171025 ) ) ( not ( = ?auto_171020 ?auto_171026 ) ) ( not ( = ?auto_171020 ?auto_171027 ) ) ( not ( = ?auto_171021 ?auto_171022 ) ) ( not ( = ?auto_171021 ?auto_171023 ) ) ( not ( = ?auto_171021 ?auto_171024 ) ) ( not ( = ?auto_171021 ?auto_171025 ) ) ( not ( = ?auto_171021 ?auto_171026 ) ) ( not ( = ?auto_171021 ?auto_171027 ) ) ( not ( = ?auto_171022 ?auto_171023 ) ) ( not ( = ?auto_171022 ?auto_171024 ) ) ( not ( = ?auto_171022 ?auto_171025 ) ) ( not ( = ?auto_171022 ?auto_171026 ) ) ( not ( = ?auto_171022 ?auto_171027 ) ) ( not ( = ?auto_171023 ?auto_171024 ) ) ( not ( = ?auto_171023 ?auto_171025 ) ) ( not ( = ?auto_171023 ?auto_171026 ) ) ( not ( = ?auto_171023 ?auto_171027 ) ) ( not ( = ?auto_171024 ?auto_171025 ) ) ( not ( = ?auto_171024 ?auto_171026 ) ) ( not ( = ?auto_171024 ?auto_171027 ) ) ( not ( = ?auto_171025 ?auto_171026 ) ) ( not ( = ?auto_171025 ?auto_171027 ) ) ( not ( = ?auto_171026 ?auto_171027 ) ) ( ON ?auto_171025 ?auto_171026 ) ( ON ?auto_171024 ?auto_171025 ) ( ON ?auto_171023 ?auto_171024 ) ( ON ?auto_171022 ?auto_171023 ) ( ON ?auto_171021 ?auto_171022 ) ( ON ?auto_171020 ?auto_171021 ) ( CLEAR ?auto_171018 ) ( ON ?auto_171019 ?auto_171020 ) ( CLEAR ?auto_171019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_171017 ?auto_171018 ?auto_171019 )
      ( MAKE-10PILE ?auto_171017 ?auto_171018 ?auto_171019 ?auto_171020 ?auto_171021 ?auto_171022 ?auto_171023 ?auto_171024 ?auto_171025 ?auto_171026 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_171059 - BLOCK
      ?auto_171060 - BLOCK
      ?auto_171061 - BLOCK
      ?auto_171062 - BLOCK
      ?auto_171063 - BLOCK
      ?auto_171064 - BLOCK
      ?auto_171065 - BLOCK
      ?auto_171066 - BLOCK
      ?auto_171067 - BLOCK
      ?auto_171068 - BLOCK
    )
    :vars
    (
      ?auto_171069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171068 ?auto_171069 ) ( ON-TABLE ?auto_171059 ) ( not ( = ?auto_171059 ?auto_171060 ) ) ( not ( = ?auto_171059 ?auto_171061 ) ) ( not ( = ?auto_171059 ?auto_171062 ) ) ( not ( = ?auto_171059 ?auto_171063 ) ) ( not ( = ?auto_171059 ?auto_171064 ) ) ( not ( = ?auto_171059 ?auto_171065 ) ) ( not ( = ?auto_171059 ?auto_171066 ) ) ( not ( = ?auto_171059 ?auto_171067 ) ) ( not ( = ?auto_171059 ?auto_171068 ) ) ( not ( = ?auto_171059 ?auto_171069 ) ) ( not ( = ?auto_171060 ?auto_171061 ) ) ( not ( = ?auto_171060 ?auto_171062 ) ) ( not ( = ?auto_171060 ?auto_171063 ) ) ( not ( = ?auto_171060 ?auto_171064 ) ) ( not ( = ?auto_171060 ?auto_171065 ) ) ( not ( = ?auto_171060 ?auto_171066 ) ) ( not ( = ?auto_171060 ?auto_171067 ) ) ( not ( = ?auto_171060 ?auto_171068 ) ) ( not ( = ?auto_171060 ?auto_171069 ) ) ( not ( = ?auto_171061 ?auto_171062 ) ) ( not ( = ?auto_171061 ?auto_171063 ) ) ( not ( = ?auto_171061 ?auto_171064 ) ) ( not ( = ?auto_171061 ?auto_171065 ) ) ( not ( = ?auto_171061 ?auto_171066 ) ) ( not ( = ?auto_171061 ?auto_171067 ) ) ( not ( = ?auto_171061 ?auto_171068 ) ) ( not ( = ?auto_171061 ?auto_171069 ) ) ( not ( = ?auto_171062 ?auto_171063 ) ) ( not ( = ?auto_171062 ?auto_171064 ) ) ( not ( = ?auto_171062 ?auto_171065 ) ) ( not ( = ?auto_171062 ?auto_171066 ) ) ( not ( = ?auto_171062 ?auto_171067 ) ) ( not ( = ?auto_171062 ?auto_171068 ) ) ( not ( = ?auto_171062 ?auto_171069 ) ) ( not ( = ?auto_171063 ?auto_171064 ) ) ( not ( = ?auto_171063 ?auto_171065 ) ) ( not ( = ?auto_171063 ?auto_171066 ) ) ( not ( = ?auto_171063 ?auto_171067 ) ) ( not ( = ?auto_171063 ?auto_171068 ) ) ( not ( = ?auto_171063 ?auto_171069 ) ) ( not ( = ?auto_171064 ?auto_171065 ) ) ( not ( = ?auto_171064 ?auto_171066 ) ) ( not ( = ?auto_171064 ?auto_171067 ) ) ( not ( = ?auto_171064 ?auto_171068 ) ) ( not ( = ?auto_171064 ?auto_171069 ) ) ( not ( = ?auto_171065 ?auto_171066 ) ) ( not ( = ?auto_171065 ?auto_171067 ) ) ( not ( = ?auto_171065 ?auto_171068 ) ) ( not ( = ?auto_171065 ?auto_171069 ) ) ( not ( = ?auto_171066 ?auto_171067 ) ) ( not ( = ?auto_171066 ?auto_171068 ) ) ( not ( = ?auto_171066 ?auto_171069 ) ) ( not ( = ?auto_171067 ?auto_171068 ) ) ( not ( = ?auto_171067 ?auto_171069 ) ) ( not ( = ?auto_171068 ?auto_171069 ) ) ( ON ?auto_171067 ?auto_171068 ) ( ON ?auto_171066 ?auto_171067 ) ( ON ?auto_171065 ?auto_171066 ) ( ON ?auto_171064 ?auto_171065 ) ( ON ?auto_171063 ?auto_171064 ) ( ON ?auto_171062 ?auto_171063 ) ( ON ?auto_171061 ?auto_171062 ) ( CLEAR ?auto_171059 ) ( ON ?auto_171060 ?auto_171061 ) ( CLEAR ?auto_171060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_171059 ?auto_171060 )
      ( MAKE-10PILE ?auto_171059 ?auto_171060 ?auto_171061 ?auto_171062 ?auto_171063 ?auto_171064 ?auto_171065 ?auto_171066 ?auto_171067 ?auto_171068 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_171101 - BLOCK
      ?auto_171102 - BLOCK
      ?auto_171103 - BLOCK
      ?auto_171104 - BLOCK
      ?auto_171105 - BLOCK
      ?auto_171106 - BLOCK
      ?auto_171107 - BLOCK
      ?auto_171108 - BLOCK
      ?auto_171109 - BLOCK
      ?auto_171110 - BLOCK
    )
    :vars
    (
      ?auto_171111 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171110 ?auto_171111 ) ( not ( = ?auto_171101 ?auto_171102 ) ) ( not ( = ?auto_171101 ?auto_171103 ) ) ( not ( = ?auto_171101 ?auto_171104 ) ) ( not ( = ?auto_171101 ?auto_171105 ) ) ( not ( = ?auto_171101 ?auto_171106 ) ) ( not ( = ?auto_171101 ?auto_171107 ) ) ( not ( = ?auto_171101 ?auto_171108 ) ) ( not ( = ?auto_171101 ?auto_171109 ) ) ( not ( = ?auto_171101 ?auto_171110 ) ) ( not ( = ?auto_171101 ?auto_171111 ) ) ( not ( = ?auto_171102 ?auto_171103 ) ) ( not ( = ?auto_171102 ?auto_171104 ) ) ( not ( = ?auto_171102 ?auto_171105 ) ) ( not ( = ?auto_171102 ?auto_171106 ) ) ( not ( = ?auto_171102 ?auto_171107 ) ) ( not ( = ?auto_171102 ?auto_171108 ) ) ( not ( = ?auto_171102 ?auto_171109 ) ) ( not ( = ?auto_171102 ?auto_171110 ) ) ( not ( = ?auto_171102 ?auto_171111 ) ) ( not ( = ?auto_171103 ?auto_171104 ) ) ( not ( = ?auto_171103 ?auto_171105 ) ) ( not ( = ?auto_171103 ?auto_171106 ) ) ( not ( = ?auto_171103 ?auto_171107 ) ) ( not ( = ?auto_171103 ?auto_171108 ) ) ( not ( = ?auto_171103 ?auto_171109 ) ) ( not ( = ?auto_171103 ?auto_171110 ) ) ( not ( = ?auto_171103 ?auto_171111 ) ) ( not ( = ?auto_171104 ?auto_171105 ) ) ( not ( = ?auto_171104 ?auto_171106 ) ) ( not ( = ?auto_171104 ?auto_171107 ) ) ( not ( = ?auto_171104 ?auto_171108 ) ) ( not ( = ?auto_171104 ?auto_171109 ) ) ( not ( = ?auto_171104 ?auto_171110 ) ) ( not ( = ?auto_171104 ?auto_171111 ) ) ( not ( = ?auto_171105 ?auto_171106 ) ) ( not ( = ?auto_171105 ?auto_171107 ) ) ( not ( = ?auto_171105 ?auto_171108 ) ) ( not ( = ?auto_171105 ?auto_171109 ) ) ( not ( = ?auto_171105 ?auto_171110 ) ) ( not ( = ?auto_171105 ?auto_171111 ) ) ( not ( = ?auto_171106 ?auto_171107 ) ) ( not ( = ?auto_171106 ?auto_171108 ) ) ( not ( = ?auto_171106 ?auto_171109 ) ) ( not ( = ?auto_171106 ?auto_171110 ) ) ( not ( = ?auto_171106 ?auto_171111 ) ) ( not ( = ?auto_171107 ?auto_171108 ) ) ( not ( = ?auto_171107 ?auto_171109 ) ) ( not ( = ?auto_171107 ?auto_171110 ) ) ( not ( = ?auto_171107 ?auto_171111 ) ) ( not ( = ?auto_171108 ?auto_171109 ) ) ( not ( = ?auto_171108 ?auto_171110 ) ) ( not ( = ?auto_171108 ?auto_171111 ) ) ( not ( = ?auto_171109 ?auto_171110 ) ) ( not ( = ?auto_171109 ?auto_171111 ) ) ( not ( = ?auto_171110 ?auto_171111 ) ) ( ON ?auto_171109 ?auto_171110 ) ( ON ?auto_171108 ?auto_171109 ) ( ON ?auto_171107 ?auto_171108 ) ( ON ?auto_171106 ?auto_171107 ) ( ON ?auto_171105 ?auto_171106 ) ( ON ?auto_171104 ?auto_171105 ) ( ON ?auto_171103 ?auto_171104 ) ( ON ?auto_171102 ?auto_171103 ) ( ON ?auto_171101 ?auto_171102 ) ( CLEAR ?auto_171101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_171101 )
      ( MAKE-10PILE ?auto_171101 ?auto_171102 ?auto_171103 ?auto_171104 ?auto_171105 ?auto_171106 ?auto_171107 ?auto_171108 ?auto_171109 ?auto_171110 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_171144 - BLOCK
      ?auto_171145 - BLOCK
      ?auto_171146 - BLOCK
      ?auto_171147 - BLOCK
      ?auto_171148 - BLOCK
      ?auto_171149 - BLOCK
      ?auto_171150 - BLOCK
      ?auto_171151 - BLOCK
      ?auto_171152 - BLOCK
      ?auto_171153 - BLOCK
      ?auto_171154 - BLOCK
    )
    :vars
    (
      ?auto_171155 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_171153 ) ( ON ?auto_171154 ?auto_171155 ) ( CLEAR ?auto_171154 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_171144 ) ( ON ?auto_171145 ?auto_171144 ) ( ON ?auto_171146 ?auto_171145 ) ( ON ?auto_171147 ?auto_171146 ) ( ON ?auto_171148 ?auto_171147 ) ( ON ?auto_171149 ?auto_171148 ) ( ON ?auto_171150 ?auto_171149 ) ( ON ?auto_171151 ?auto_171150 ) ( ON ?auto_171152 ?auto_171151 ) ( ON ?auto_171153 ?auto_171152 ) ( not ( = ?auto_171144 ?auto_171145 ) ) ( not ( = ?auto_171144 ?auto_171146 ) ) ( not ( = ?auto_171144 ?auto_171147 ) ) ( not ( = ?auto_171144 ?auto_171148 ) ) ( not ( = ?auto_171144 ?auto_171149 ) ) ( not ( = ?auto_171144 ?auto_171150 ) ) ( not ( = ?auto_171144 ?auto_171151 ) ) ( not ( = ?auto_171144 ?auto_171152 ) ) ( not ( = ?auto_171144 ?auto_171153 ) ) ( not ( = ?auto_171144 ?auto_171154 ) ) ( not ( = ?auto_171144 ?auto_171155 ) ) ( not ( = ?auto_171145 ?auto_171146 ) ) ( not ( = ?auto_171145 ?auto_171147 ) ) ( not ( = ?auto_171145 ?auto_171148 ) ) ( not ( = ?auto_171145 ?auto_171149 ) ) ( not ( = ?auto_171145 ?auto_171150 ) ) ( not ( = ?auto_171145 ?auto_171151 ) ) ( not ( = ?auto_171145 ?auto_171152 ) ) ( not ( = ?auto_171145 ?auto_171153 ) ) ( not ( = ?auto_171145 ?auto_171154 ) ) ( not ( = ?auto_171145 ?auto_171155 ) ) ( not ( = ?auto_171146 ?auto_171147 ) ) ( not ( = ?auto_171146 ?auto_171148 ) ) ( not ( = ?auto_171146 ?auto_171149 ) ) ( not ( = ?auto_171146 ?auto_171150 ) ) ( not ( = ?auto_171146 ?auto_171151 ) ) ( not ( = ?auto_171146 ?auto_171152 ) ) ( not ( = ?auto_171146 ?auto_171153 ) ) ( not ( = ?auto_171146 ?auto_171154 ) ) ( not ( = ?auto_171146 ?auto_171155 ) ) ( not ( = ?auto_171147 ?auto_171148 ) ) ( not ( = ?auto_171147 ?auto_171149 ) ) ( not ( = ?auto_171147 ?auto_171150 ) ) ( not ( = ?auto_171147 ?auto_171151 ) ) ( not ( = ?auto_171147 ?auto_171152 ) ) ( not ( = ?auto_171147 ?auto_171153 ) ) ( not ( = ?auto_171147 ?auto_171154 ) ) ( not ( = ?auto_171147 ?auto_171155 ) ) ( not ( = ?auto_171148 ?auto_171149 ) ) ( not ( = ?auto_171148 ?auto_171150 ) ) ( not ( = ?auto_171148 ?auto_171151 ) ) ( not ( = ?auto_171148 ?auto_171152 ) ) ( not ( = ?auto_171148 ?auto_171153 ) ) ( not ( = ?auto_171148 ?auto_171154 ) ) ( not ( = ?auto_171148 ?auto_171155 ) ) ( not ( = ?auto_171149 ?auto_171150 ) ) ( not ( = ?auto_171149 ?auto_171151 ) ) ( not ( = ?auto_171149 ?auto_171152 ) ) ( not ( = ?auto_171149 ?auto_171153 ) ) ( not ( = ?auto_171149 ?auto_171154 ) ) ( not ( = ?auto_171149 ?auto_171155 ) ) ( not ( = ?auto_171150 ?auto_171151 ) ) ( not ( = ?auto_171150 ?auto_171152 ) ) ( not ( = ?auto_171150 ?auto_171153 ) ) ( not ( = ?auto_171150 ?auto_171154 ) ) ( not ( = ?auto_171150 ?auto_171155 ) ) ( not ( = ?auto_171151 ?auto_171152 ) ) ( not ( = ?auto_171151 ?auto_171153 ) ) ( not ( = ?auto_171151 ?auto_171154 ) ) ( not ( = ?auto_171151 ?auto_171155 ) ) ( not ( = ?auto_171152 ?auto_171153 ) ) ( not ( = ?auto_171152 ?auto_171154 ) ) ( not ( = ?auto_171152 ?auto_171155 ) ) ( not ( = ?auto_171153 ?auto_171154 ) ) ( not ( = ?auto_171153 ?auto_171155 ) ) ( not ( = ?auto_171154 ?auto_171155 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_171154 ?auto_171155 )
      ( !STACK ?auto_171154 ?auto_171153 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_171190 - BLOCK
      ?auto_171191 - BLOCK
      ?auto_171192 - BLOCK
      ?auto_171193 - BLOCK
      ?auto_171194 - BLOCK
      ?auto_171195 - BLOCK
      ?auto_171196 - BLOCK
      ?auto_171197 - BLOCK
      ?auto_171198 - BLOCK
      ?auto_171199 - BLOCK
      ?auto_171200 - BLOCK
    )
    :vars
    (
      ?auto_171201 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171200 ?auto_171201 ) ( ON-TABLE ?auto_171190 ) ( ON ?auto_171191 ?auto_171190 ) ( ON ?auto_171192 ?auto_171191 ) ( ON ?auto_171193 ?auto_171192 ) ( ON ?auto_171194 ?auto_171193 ) ( ON ?auto_171195 ?auto_171194 ) ( ON ?auto_171196 ?auto_171195 ) ( ON ?auto_171197 ?auto_171196 ) ( ON ?auto_171198 ?auto_171197 ) ( not ( = ?auto_171190 ?auto_171191 ) ) ( not ( = ?auto_171190 ?auto_171192 ) ) ( not ( = ?auto_171190 ?auto_171193 ) ) ( not ( = ?auto_171190 ?auto_171194 ) ) ( not ( = ?auto_171190 ?auto_171195 ) ) ( not ( = ?auto_171190 ?auto_171196 ) ) ( not ( = ?auto_171190 ?auto_171197 ) ) ( not ( = ?auto_171190 ?auto_171198 ) ) ( not ( = ?auto_171190 ?auto_171199 ) ) ( not ( = ?auto_171190 ?auto_171200 ) ) ( not ( = ?auto_171190 ?auto_171201 ) ) ( not ( = ?auto_171191 ?auto_171192 ) ) ( not ( = ?auto_171191 ?auto_171193 ) ) ( not ( = ?auto_171191 ?auto_171194 ) ) ( not ( = ?auto_171191 ?auto_171195 ) ) ( not ( = ?auto_171191 ?auto_171196 ) ) ( not ( = ?auto_171191 ?auto_171197 ) ) ( not ( = ?auto_171191 ?auto_171198 ) ) ( not ( = ?auto_171191 ?auto_171199 ) ) ( not ( = ?auto_171191 ?auto_171200 ) ) ( not ( = ?auto_171191 ?auto_171201 ) ) ( not ( = ?auto_171192 ?auto_171193 ) ) ( not ( = ?auto_171192 ?auto_171194 ) ) ( not ( = ?auto_171192 ?auto_171195 ) ) ( not ( = ?auto_171192 ?auto_171196 ) ) ( not ( = ?auto_171192 ?auto_171197 ) ) ( not ( = ?auto_171192 ?auto_171198 ) ) ( not ( = ?auto_171192 ?auto_171199 ) ) ( not ( = ?auto_171192 ?auto_171200 ) ) ( not ( = ?auto_171192 ?auto_171201 ) ) ( not ( = ?auto_171193 ?auto_171194 ) ) ( not ( = ?auto_171193 ?auto_171195 ) ) ( not ( = ?auto_171193 ?auto_171196 ) ) ( not ( = ?auto_171193 ?auto_171197 ) ) ( not ( = ?auto_171193 ?auto_171198 ) ) ( not ( = ?auto_171193 ?auto_171199 ) ) ( not ( = ?auto_171193 ?auto_171200 ) ) ( not ( = ?auto_171193 ?auto_171201 ) ) ( not ( = ?auto_171194 ?auto_171195 ) ) ( not ( = ?auto_171194 ?auto_171196 ) ) ( not ( = ?auto_171194 ?auto_171197 ) ) ( not ( = ?auto_171194 ?auto_171198 ) ) ( not ( = ?auto_171194 ?auto_171199 ) ) ( not ( = ?auto_171194 ?auto_171200 ) ) ( not ( = ?auto_171194 ?auto_171201 ) ) ( not ( = ?auto_171195 ?auto_171196 ) ) ( not ( = ?auto_171195 ?auto_171197 ) ) ( not ( = ?auto_171195 ?auto_171198 ) ) ( not ( = ?auto_171195 ?auto_171199 ) ) ( not ( = ?auto_171195 ?auto_171200 ) ) ( not ( = ?auto_171195 ?auto_171201 ) ) ( not ( = ?auto_171196 ?auto_171197 ) ) ( not ( = ?auto_171196 ?auto_171198 ) ) ( not ( = ?auto_171196 ?auto_171199 ) ) ( not ( = ?auto_171196 ?auto_171200 ) ) ( not ( = ?auto_171196 ?auto_171201 ) ) ( not ( = ?auto_171197 ?auto_171198 ) ) ( not ( = ?auto_171197 ?auto_171199 ) ) ( not ( = ?auto_171197 ?auto_171200 ) ) ( not ( = ?auto_171197 ?auto_171201 ) ) ( not ( = ?auto_171198 ?auto_171199 ) ) ( not ( = ?auto_171198 ?auto_171200 ) ) ( not ( = ?auto_171198 ?auto_171201 ) ) ( not ( = ?auto_171199 ?auto_171200 ) ) ( not ( = ?auto_171199 ?auto_171201 ) ) ( not ( = ?auto_171200 ?auto_171201 ) ) ( CLEAR ?auto_171198 ) ( ON ?auto_171199 ?auto_171200 ) ( CLEAR ?auto_171199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_171190 ?auto_171191 ?auto_171192 ?auto_171193 ?auto_171194 ?auto_171195 ?auto_171196 ?auto_171197 ?auto_171198 ?auto_171199 )
      ( MAKE-11PILE ?auto_171190 ?auto_171191 ?auto_171192 ?auto_171193 ?auto_171194 ?auto_171195 ?auto_171196 ?auto_171197 ?auto_171198 ?auto_171199 ?auto_171200 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_171236 - BLOCK
      ?auto_171237 - BLOCK
      ?auto_171238 - BLOCK
      ?auto_171239 - BLOCK
      ?auto_171240 - BLOCK
      ?auto_171241 - BLOCK
      ?auto_171242 - BLOCK
      ?auto_171243 - BLOCK
      ?auto_171244 - BLOCK
      ?auto_171245 - BLOCK
      ?auto_171246 - BLOCK
    )
    :vars
    (
      ?auto_171247 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171246 ?auto_171247 ) ( ON-TABLE ?auto_171236 ) ( ON ?auto_171237 ?auto_171236 ) ( ON ?auto_171238 ?auto_171237 ) ( ON ?auto_171239 ?auto_171238 ) ( ON ?auto_171240 ?auto_171239 ) ( ON ?auto_171241 ?auto_171240 ) ( ON ?auto_171242 ?auto_171241 ) ( ON ?auto_171243 ?auto_171242 ) ( not ( = ?auto_171236 ?auto_171237 ) ) ( not ( = ?auto_171236 ?auto_171238 ) ) ( not ( = ?auto_171236 ?auto_171239 ) ) ( not ( = ?auto_171236 ?auto_171240 ) ) ( not ( = ?auto_171236 ?auto_171241 ) ) ( not ( = ?auto_171236 ?auto_171242 ) ) ( not ( = ?auto_171236 ?auto_171243 ) ) ( not ( = ?auto_171236 ?auto_171244 ) ) ( not ( = ?auto_171236 ?auto_171245 ) ) ( not ( = ?auto_171236 ?auto_171246 ) ) ( not ( = ?auto_171236 ?auto_171247 ) ) ( not ( = ?auto_171237 ?auto_171238 ) ) ( not ( = ?auto_171237 ?auto_171239 ) ) ( not ( = ?auto_171237 ?auto_171240 ) ) ( not ( = ?auto_171237 ?auto_171241 ) ) ( not ( = ?auto_171237 ?auto_171242 ) ) ( not ( = ?auto_171237 ?auto_171243 ) ) ( not ( = ?auto_171237 ?auto_171244 ) ) ( not ( = ?auto_171237 ?auto_171245 ) ) ( not ( = ?auto_171237 ?auto_171246 ) ) ( not ( = ?auto_171237 ?auto_171247 ) ) ( not ( = ?auto_171238 ?auto_171239 ) ) ( not ( = ?auto_171238 ?auto_171240 ) ) ( not ( = ?auto_171238 ?auto_171241 ) ) ( not ( = ?auto_171238 ?auto_171242 ) ) ( not ( = ?auto_171238 ?auto_171243 ) ) ( not ( = ?auto_171238 ?auto_171244 ) ) ( not ( = ?auto_171238 ?auto_171245 ) ) ( not ( = ?auto_171238 ?auto_171246 ) ) ( not ( = ?auto_171238 ?auto_171247 ) ) ( not ( = ?auto_171239 ?auto_171240 ) ) ( not ( = ?auto_171239 ?auto_171241 ) ) ( not ( = ?auto_171239 ?auto_171242 ) ) ( not ( = ?auto_171239 ?auto_171243 ) ) ( not ( = ?auto_171239 ?auto_171244 ) ) ( not ( = ?auto_171239 ?auto_171245 ) ) ( not ( = ?auto_171239 ?auto_171246 ) ) ( not ( = ?auto_171239 ?auto_171247 ) ) ( not ( = ?auto_171240 ?auto_171241 ) ) ( not ( = ?auto_171240 ?auto_171242 ) ) ( not ( = ?auto_171240 ?auto_171243 ) ) ( not ( = ?auto_171240 ?auto_171244 ) ) ( not ( = ?auto_171240 ?auto_171245 ) ) ( not ( = ?auto_171240 ?auto_171246 ) ) ( not ( = ?auto_171240 ?auto_171247 ) ) ( not ( = ?auto_171241 ?auto_171242 ) ) ( not ( = ?auto_171241 ?auto_171243 ) ) ( not ( = ?auto_171241 ?auto_171244 ) ) ( not ( = ?auto_171241 ?auto_171245 ) ) ( not ( = ?auto_171241 ?auto_171246 ) ) ( not ( = ?auto_171241 ?auto_171247 ) ) ( not ( = ?auto_171242 ?auto_171243 ) ) ( not ( = ?auto_171242 ?auto_171244 ) ) ( not ( = ?auto_171242 ?auto_171245 ) ) ( not ( = ?auto_171242 ?auto_171246 ) ) ( not ( = ?auto_171242 ?auto_171247 ) ) ( not ( = ?auto_171243 ?auto_171244 ) ) ( not ( = ?auto_171243 ?auto_171245 ) ) ( not ( = ?auto_171243 ?auto_171246 ) ) ( not ( = ?auto_171243 ?auto_171247 ) ) ( not ( = ?auto_171244 ?auto_171245 ) ) ( not ( = ?auto_171244 ?auto_171246 ) ) ( not ( = ?auto_171244 ?auto_171247 ) ) ( not ( = ?auto_171245 ?auto_171246 ) ) ( not ( = ?auto_171245 ?auto_171247 ) ) ( not ( = ?auto_171246 ?auto_171247 ) ) ( ON ?auto_171245 ?auto_171246 ) ( CLEAR ?auto_171243 ) ( ON ?auto_171244 ?auto_171245 ) ( CLEAR ?auto_171244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_171236 ?auto_171237 ?auto_171238 ?auto_171239 ?auto_171240 ?auto_171241 ?auto_171242 ?auto_171243 ?auto_171244 )
      ( MAKE-11PILE ?auto_171236 ?auto_171237 ?auto_171238 ?auto_171239 ?auto_171240 ?auto_171241 ?auto_171242 ?auto_171243 ?auto_171244 ?auto_171245 ?auto_171246 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_171282 - BLOCK
      ?auto_171283 - BLOCK
      ?auto_171284 - BLOCK
      ?auto_171285 - BLOCK
      ?auto_171286 - BLOCK
      ?auto_171287 - BLOCK
      ?auto_171288 - BLOCK
      ?auto_171289 - BLOCK
      ?auto_171290 - BLOCK
      ?auto_171291 - BLOCK
      ?auto_171292 - BLOCK
    )
    :vars
    (
      ?auto_171293 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171292 ?auto_171293 ) ( ON-TABLE ?auto_171282 ) ( ON ?auto_171283 ?auto_171282 ) ( ON ?auto_171284 ?auto_171283 ) ( ON ?auto_171285 ?auto_171284 ) ( ON ?auto_171286 ?auto_171285 ) ( ON ?auto_171287 ?auto_171286 ) ( ON ?auto_171288 ?auto_171287 ) ( not ( = ?auto_171282 ?auto_171283 ) ) ( not ( = ?auto_171282 ?auto_171284 ) ) ( not ( = ?auto_171282 ?auto_171285 ) ) ( not ( = ?auto_171282 ?auto_171286 ) ) ( not ( = ?auto_171282 ?auto_171287 ) ) ( not ( = ?auto_171282 ?auto_171288 ) ) ( not ( = ?auto_171282 ?auto_171289 ) ) ( not ( = ?auto_171282 ?auto_171290 ) ) ( not ( = ?auto_171282 ?auto_171291 ) ) ( not ( = ?auto_171282 ?auto_171292 ) ) ( not ( = ?auto_171282 ?auto_171293 ) ) ( not ( = ?auto_171283 ?auto_171284 ) ) ( not ( = ?auto_171283 ?auto_171285 ) ) ( not ( = ?auto_171283 ?auto_171286 ) ) ( not ( = ?auto_171283 ?auto_171287 ) ) ( not ( = ?auto_171283 ?auto_171288 ) ) ( not ( = ?auto_171283 ?auto_171289 ) ) ( not ( = ?auto_171283 ?auto_171290 ) ) ( not ( = ?auto_171283 ?auto_171291 ) ) ( not ( = ?auto_171283 ?auto_171292 ) ) ( not ( = ?auto_171283 ?auto_171293 ) ) ( not ( = ?auto_171284 ?auto_171285 ) ) ( not ( = ?auto_171284 ?auto_171286 ) ) ( not ( = ?auto_171284 ?auto_171287 ) ) ( not ( = ?auto_171284 ?auto_171288 ) ) ( not ( = ?auto_171284 ?auto_171289 ) ) ( not ( = ?auto_171284 ?auto_171290 ) ) ( not ( = ?auto_171284 ?auto_171291 ) ) ( not ( = ?auto_171284 ?auto_171292 ) ) ( not ( = ?auto_171284 ?auto_171293 ) ) ( not ( = ?auto_171285 ?auto_171286 ) ) ( not ( = ?auto_171285 ?auto_171287 ) ) ( not ( = ?auto_171285 ?auto_171288 ) ) ( not ( = ?auto_171285 ?auto_171289 ) ) ( not ( = ?auto_171285 ?auto_171290 ) ) ( not ( = ?auto_171285 ?auto_171291 ) ) ( not ( = ?auto_171285 ?auto_171292 ) ) ( not ( = ?auto_171285 ?auto_171293 ) ) ( not ( = ?auto_171286 ?auto_171287 ) ) ( not ( = ?auto_171286 ?auto_171288 ) ) ( not ( = ?auto_171286 ?auto_171289 ) ) ( not ( = ?auto_171286 ?auto_171290 ) ) ( not ( = ?auto_171286 ?auto_171291 ) ) ( not ( = ?auto_171286 ?auto_171292 ) ) ( not ( = ?auto_171286 ?auto_171293 ) ) ( not ( = ?auto_171287 ?auto_171288 ) ) ( not ( = ?auto_171287 ?auto_171289 ) ) ( not ( = ?auto_171287 ?auto_171290 ) ) ( not ( = ?auto_171287 ?auto_171291 ) ) ( not ( = ?auto_171287 ?auto_171292 ) ) ( not ( = ?auto_171287 ?auto_171293 ) ) ( not ( = ?auto_171288 ?auto_171289 ) ) ( not ( = ?auto_171288 ?auto_171290 ) ) ( not ( = ?auto_171288 ?auto_171291 ) ) ( not ( = ?auto_171288 ?auto_171292 ) ) ( not ( = ?auto_171288 ?auto_171293 ) ) ( not ( = ?auto_171289 ?auto_171290 ) ) ( not ( = ?auto_171289 ?auto_171291 ) ) ( not ( = ?auto_171289 ?auto_171292 ) ) ( not ( = ?auto_171289 ?auto_171293 ) ) ( not ( = ?auto_171290 ?auto_171291 ) ) ( not ( = ?auto_171290 ?auto_171292 ) ) ( not ( = ?auto_171290 ?auto_171293 ) ) ( not ( = ?auto_171291 ?auto_171292 ) ) ( not ( = ?auto_171291 ?auto_171293 ) ) ( not ( = ?auto_171292 ?auto_171293 ) ) ( ON ?auto_171291 ?auto_171292 ) ( ON ?auto_171290 ?auto_171291 ) ( CLEAR ?auto_171288 ) ( ON ?auto_171289 ?auto_171290 ) ( CLEAR ?auto_171289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_171282 ?auto_171283 ?auto_171284 ?auto_171285 ?auto_171286 ?auto_171287 ?auto_171288 ?auto_171289 )
      ( MAKE-11PILE ?auto_171282 ?auto_171283 ?auto_171284 ?auto_171285 ?auto_171286 ?auto_171287 ?auto_171288 ?auto_171289 ?auto_171290 ?auto_171291 ?auto_171292 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_171328 - BLOCK
      ?auto_171329 - BLOCK
      ?auto_171330 - BLOCK
      ?auto_171331 - BLOCK
      ?auto_171332 - BLOCK
      ?auto_171333 - BLOCK
      ?auto_171334 - BLOCK
      ?auto_171335 - BLOCK
      ?auto_171336 - BLOCK
      ?auto_171337 - BLOCK
      ?auto_171338 - BLOCK
    )
    :vars
    (
      ?auto_171339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171338 ?auto_171339 ) ( ON-TABLE ?auto_171328 ) ( ON ?auto_171329 ?auto_171328 ) ( ON ?auto_171330 ?auto_171329 ) ( ON ?auto_171331 ?auto_171330 ) ( ON ?auto_171332 ?auto_171331 ) ( ON ?auto_171333 ?auto_171332 ) ( not ( = ?auto_171328 ?auto_171329 ) ) ( not ( = ?auto_171328 ?auto_171330 ) ) ( not ( = ?auto_171328 ?auto_171331 ) ) ( not ( = ?auto_171328 ?auto_171332 ) ) ( not ( = ?auto_171328 ?auto_171333 ) ) ( not ( = ?auto_171328 ?auto_171334 ) ) ( not ( = ?auto_171328 ?auto_171335 ) ) ( not ( = ?auto_171328 ?auto_171336 ) ) ( not ( = ?auto_171328 ?auto_171337 ) ) ( not ( = ?auto_171328 ?auto_171338 ) ) ( not ( = ?auto_171328 ?auto_171339 ) ) ( not ( = ?auto_171329 ?auto_171330 ) ) ( not ( = ?auto_171329 ?auto_171331 ) ) ( not ( = ?auto_171329 ?auto_171332 ) ) ( not ( = ?auto_171329 ?auto_171333 ) ) ( not ( = ?auto_171329 ?auto_171334 ) ) ( not ( = ?auto_171329 ?auto_171335 ) ) ( not ( = ?auto_171329 ?auto_171336 ) ) ( not ( = ?auto_171329 ?auto_171337 ) ) ( not ( = ?auto_171329 ?auto_171338 ) ) ( not ( = ?auto_171329 ?auto_171339 ) ) ( not ( = ?auto_171330 ?auto_171331 ) ) ( not ( = ?auto_171330 ?auto_171332 ) ) ( not ( = ?auto_171330 ?auto_171333 ) ) ( not ( = ?auto_171330 ?auto_171334 ) ) ( not ( = ?auto_171330 ?auto_171335 ) ) ( not ( = ?auto_171330 ?auto_171336 ) ) ( not ( = ?auto_171330 ?auto_171337 ) ) ( not ( = ?auto_171330 ?auto_171338 ) ) ( not ( = ?auto_171330 ?auto_171339 ) ) ( not ( = ?auto_171331 ?auto_171332 ) ) ( not ( = ?auto_171331 ?auto_171333 ) ) ( not ( = ?auto_171331 ?auto_171334 ) ) ( not ( = ?auto_171331 ?auto_171335 ) ) ( not ( = ?auto_171331 ?auto_171336 ) ) ( not ( = ?auto_171331 ?auto_171337 ) ) ( not ( = ?auto_171331 ?auto_171338 ) ) ( not ( = ?auto_171331 ?auto_171339 ) ) ( not ( = ?auto_171332 ?auto_171333 ) ) ( not ( = ?auto_171332 ?auto_171334 ) ) ( not ( = ?auto_171332 ?auto_171335 ) ) ( not ( = ?auto_171332 ?auto_171336 ) ) ( not ( = ?auto_171332 ?auto_171337 ) ) ( not ( = ?auto_171332 ?auto_171338 ) ) ( not ( = ?auto_171332 ?auto_171339 ) ) ( not ( = ?auto_171333 ?auto_171334 ) ) ( not ( = ?auto_171333 ?auto_171335 ) ) ( not ( = ?auto_171333 ?auto_171336 ) ) ( not ( = ?auto_171333 ?auto_171337 ) ) ( not ( = ?auto_171333 ?auto_171338 ) ) ( not ( = ?auto_171333 ?auto_171339 ) ) ( not ( = ?auto_171334 ?auto_171335 ) ) ( not ( = ?auto_171334 ?auto_171336 ) ) ( not ( = ?auto_171334 ?auto_171337 ) ) ( not ( = ?auto_171334 ?auto_171338 ) ) ( not ( = ?auto_171334 ?auto_171339 ) ) ( not ( = ?auto_171335 ?auto_171336 ) ) ( not ( = ?auto_171335 ?auto_171337 ) ) ( not ( = ?auto_171335 ?auto_171338 ) ) ( not ( = ?auto_171335 ?auto_171339 ) ) ( not ( = ?auto_171336 ?auto_171337 ) ) ( not ( = ?auto_171336 ?auto_171338 ) ) ( not ( = ?auto_171336 ?auto_171339 ) ) ( not ( = ?auto_171337 ?auto_171338 ) ) ( not ( = ?auto_171337 ?auto_171339 ) ) ( not ( = ?auto_171338 ?auto_171339 ) ) ( ON ?auto_171337 ?auto_171338 ) ( ON ?auto_171336 ?auto_171337 ) ( ON ?auto_171335 ?auto_171336 ) ( CLEAR ?auto_171333 ) ( ON ?auto_171334 ?auto_171335 ) ( CLEAR ?auto_171334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_171328 ?auto_171329 ?auto_171330 ?auto_171331 ?auto_171332 ?auto_171333 ?auto_171334 )
      ( MAKE-11PILE ?auto_171328 ?auto_171329 ?auto_171330 ?auto_171331 ?auto_171332 ?auto_171333 ?auto_171334 ?auto_171335 ?auto_171336 ?auto_171337 ?auto_171338 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_171374 - BLOCK
      ?auto_171375 - BLOCK
      ?auto_171376 - BLOCK
      ?auto_171377 - BLOCK
      ?auto_171378 - BLOCK
      ?auto_171379 - BLOCK
      ?auto_171380 - BLOCK
      ?auto_171381 - BLOCK
      ?auto_171382 - BLOCK
      ?auto_171383 - BLOCK
      ?auto_171384 - BLOCK
    )
    :vars
    (
      ?auto_171385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171384 ?auto_171385 ) ( ON-TABLE ?auto_171374 ) ( ON ?auto_171375 ?auto_171374 ) ( ON ?auto_171376 ?auto_171375 ) ( ON ?auto_171377 ?auto_171376 ) ( ON ?auto_171378 ?auto_171377 ) ( not ( = ?auto_171374 ?auto_171375 ) ) ( not ( = ?auto_171374 ?auto_171376 ) ) ( not ( = ?auto_171374 ?auto_171377 ) ) ( not ( = ?auto_171374 ?auto_171378 ) ) ( not ( = ?auto_171374 ?auto_171379 ) ) ( not ( = ?auto_171374 ?auto_171380 ) ) ( not ( = ?auto_171374 ?auto_171381 ) ) ( not ( = ?auto_171374 ?auto_171382 ) ) ( not ( = ?auto_171374 ?auto_171383 ) ) ( not ( = ?auto_171374 ?auto_171384 ) ) ( not ( = ?auto_171374 ?auto_171385 ) ) ( not ( = ?auto_171375 ?auto_171376 ) ) ( not ( = ?auto_171375 ?auto_171377 ) ) ( not ( = ?auto_171375 ?auto_171378 ) ) ( not ( = ?auto_171375 ?auto_171379 ) ) ( not ( = ?auto_171375 ?auto_171380 ) ) ( not ( = ?auto_171375 ?auto_171381 ) ) ( not ( = ?auto_171375 ?auto_171382 ) ) ( not ( = ?auto_171375 ?auto_171383 ) ) ( not ( = ?auto_171375 ?auto_171384 ) ) ( not ( = ?auto_171375 ?auto_171385 ) ) ( not ( = ?auto_171376 ?auto_171377 ) ) ( not ( = ?auto_171376 ?auto_171378 ) ) ( not ( = ?auto_171376 ?auto_171379 ) ) ( not ( = ?auto_171376 ?auto_171380 ) ) ( not ( = ?auto_171376 ?auto_171381 ) ) ( not ( = ?auto_171376 ?auto_171382 ) ) ( not ( = ?auto_171376 ?auto_171383 ) ) ( not ( = ?auto_171376 ?auto_171384 ) ) ( not ( = ?auto_171376 ?auto_171385 ) ) ( not ( = ?auto_171377 ?auto_171378 ) ) ( not ( = ?auto_171377 ?auto_171379 ) ) ( not ( = ?auto_171377 ?auto_171380 ) ) ( not ( = ?auto_171377 ?auto_171381 ) ) ( not ( = ?auto_171377 ?auto_171382 ) ) ( not ( = ?auto_171377 ?auto_171383 ) ) ( not ( = ?auto_171377 ?auto_171384 ) ) ( not ( = ?auto_171377 ?auto_171385 ) ) ( not ( = ?auto_171378 ?auto_171379 ) ) ( not ( = ?auto_171378 ?auto_171380 ) ) ( not ( = ?auto_171378 ?auto_171381 ) ) ( not ( = ?auto_171378 ?auto_171382 ) ) ( not ( = ?auto_171378 ?auto_171383 ) ) ( not ( = ?auto_171378 ?auto_171384 ) ) ( not ( = ?auto_171378 ?auto_171385 ) ) ( not ( = ?auto_171379 ?auto_171380 ) ) ( not ( = ?auto_171379 ?auto_171381 ) ) ( not ( = ?auto_171379 ?auto_171382 ) ) ( not ( = ?auto_171379 ?auto_171383 ) ) ( not ( = ?auto_171379 ?auto_171384 ) ) ( not ( = ?auto_171379 ?auto_171385 ) ) ( not ( = ?auto_171380 ?auto_171381 ) ) ( not ( = ?auto_171380 ?auto_171382 ) ) ( not ( = ?auto_171380 ?auto_171383 ) ) ( not ( = ?auto_171380 ?auto_171384 ) ) ( not ( = ?auto_171380 ?auto_171385 ) ) ( not ( = ?auto_171381 ?auto_171382 ) ) ( not ( = ?auto_171381 ?auto_171383 ) ) ( not ( = ?auto_171381 ?auto_171384 ) ) ( not ( = ?auto_171381 ?auto_171385 ) ) ( not ( = ?auto_171382 ?auto_171383 ) ) ( not ( = ?auto_171382 ?auto_171384 ) ) ( not ( = ?auto_171382 ?auto_171385 ) ) ( not ( = ?auto_171383 ?auto_171384 ) ) ( not ( = ?auto_171383 ?auto_171385 ) ) ( not ( = ?auto_171384 ?auto_171385 ) ) ( ON ?auto_171383 ?auto_171384 ) ( ON ?auto_171382 ?auto_171383 ) ( ON ?auto_171381 ?auto_171382 ) ( ON ?auto_171380 ?auto_171381 ) ( CLEAR ?auto_171378 ) ( ON ?auto_171379 ?auto_171380 ) ( CLEAR ?auto_171379 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_171374 ?auto_171375 ?auto_171376 ?auto_171377 ?auto_171378 ?auto_171379 )
      ( MAKE-11PILE ?auto_171374 ?auto_171375 ?auto_171376 ?auto_171377 ?auto_171378 ?auto_171379 ?auto_171380 ?auto_171381 ?auto_171382 ?auto_171383 ?auto_171384 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_171420 - BLOCK
      ?auto_171421 - BLOCK
      ?auto_171422 - BLOCK
      ?auto_171423 - BLOCK
      ?auto_171424 - BLOCK
      ?auto_171425 - BLOCK
      ?auto_171426 - BLOCK
      ?auto_171427 - BLOCK
      ?auto_171428 - BLOCK
      ?auto_171429 - BLOCK
      ?auto_171430 - BLOCK
    )
    :vars
    (
      ?auto_171431 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171430 ?auto_171431 ) ( ON-TABLE ?auto_171420 ) ( ON ?auto_171421 ?auto_171420 ) ( ON ?auto_171422 ?auto_171421 ) ( ON ?auto_171423 ?auto_171422 ) ( not ( = ?auto_171420 ?auto_171421 ) ) ( not ( = ?auto_171420 ?auto_171422 ) ) ( not ( = ?auto_171420 ?auto_171423 ) ) ( not ( = ?auto_171420 ?auto_171424 ) ) ( not ( = ?auto_171420 ?auto_171425 ) ) ( not ( = ?auto_171420 ?auto_171426 ) ) ( not ( = ?auto_171420 ?auto_171427 ) ) ( not ( = ?auto_171420 ?auto_171428 ) ) ( not ( = ?auto_171420 ?auto_171429 ) ) ( not ( = ?auto_171420 ?auto_171430 ) ) ( not ( = ?auto_171420 ?auto_171431 ) ) ( not ( = ?auto_171421 ?auto_171422 ) ) ( not ( = ?auto_171421 ?auto_171423 ) ) ( not ( = ?auto_171421 ?auto_171424 ) ) ( not ( = ?auto_171421 ?auto_171425 ) ) ( not ( = ?auto_171421 ?auto_171426 ) ) ( not ( = ?auto_171421 ?auto_171427 ) ) ( not ( = ?auto_171421 ?auto_171428 ) ) ( not ( = ?auto_171421 ?auto_171429 ) ) ( not ( = ?auto_171421 ?auto_171430 ) ) ( not ( = ?auto_171421 ?auto_171431 ) ) ( not ( = ?auto_171422 ?auto_171423 ) ) ( not ( = ?auto_171422 ?auto_171424 ) ) ( not ( = ?auto_171422 ?auto_171425 ) ) ( not ( = ?auto_171422 ?auto_171426 ) ) ( not ( = ?auto_171422 ?auto_171427 ) ) ( not ( = ?auto_171422 ?auto_171428 ) ) ( not ( = ?auto_171422 ?auto_171429 ) ) ( not ( = ?auto_171422 ?auto_171430 ) ) ( not ( = ?auto_171422 ?auto_171431 ) ) ( not ( = ?auto_171423 ?auto_171424 ) ) ( not ( = ?auto_171423 ?auto_171425 ) ) ( not ( = ?auto_171423 ?auto_171426 ) ) ( not ( = ?auto_171423 ?auto_171427 ) ) ( not ( = ?auto_171423 ?auto_171428 ) ) ( not ( = ?auto_171423 ?auto_171429 ) ) ( not ( = ?auto_171423 ?auto_171430 ) ) ( not ( = ?auto_171423 ?auto_171431 ) ) ( not ( = ?auto_171424 ?auto_171425 ) ) ( not ( = ?auto_171424 ?auto_171426 ) ) ( not ( = ?auto_171424 ?auto_171427 ) ) ( not ( = ?auto_171424 ?auto_171428 ) ) ( not ( = ?auto_171424 ?auto_171429 ) ) ( not ( = ?auto_171424 ?auto_171430 ) ) ( not ( = ?auto_171424 ?auto_171431 ) ) ( not ( = ?auto_171425 ?auto_171426 ) ) ( not ( = ?auto_171425 ?auto_171427 ) ) ( not ( = ?auto_171425 ?auto_171428 ) ) ( not ( = ?auto_171425 ?auto_171429 ) ) ( not ( = ?auto_171425 ?auto_171430 ) ) ( not ( = ?auto_171425 ?auto_171431 ) ) ( not ( = ?auto_171426 ?auto_171427 ) ) ( not ( = ?auto_171426 ?auto_171428 ) ) ( not ( = ?auto_171426 ?auto_171429 ) ) ( not ( = ?auto_171426 ?auto_171430 ) ) ( not ( = ?auto_171426 ?auto_171431 ) ) ( not ( = ?auto_171427 ?auto_171428 ) ) ( not ( = ?auto_171427 ?auto_171429 ) ) ( not ( = ?auto_171427 ?auto_171430 ) ) ( not ( = ?auto_171427 ?auto_171431 ) ) ( not ( = ?auto_171428 ?auto_171429 ) ) ( not ( = ?auto_171428 ?auto_171430 ) ) ( not ( = ?auto_171428 ?auto_171431 ) ) ( not ( = ?auto_171429 ?auto_171430 ) ) ( not ( = ?auto_171429 ?auto_171431 ) ) ( not ( = ?auto_171430 ?auto_171431 ) ) ( ON ?auto_171429 ?auto_171430 ) ( ON ?auto_171428 ?auto_171429 ) ( ON ?auto_171427 ?auto_171428 ) ( ON ?auto_171426 ?auto_171427 ) ( ON ?auto_171425 ?auto_171426 ) ( CLEAR ?auto_171423 ) ( ON ?auto_171424 ?auto_171425 ) ( CLEAR ?auto_171424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_171420 ?auto_171421 ?auto_171422 ?auto_171423 ?auto_171424 )
      ( MAKE-11PILE ?auto_171420 ?auto_171421 ?auto_171422 ?auto_171423 ?auto_171424 ?auto_171425 ?auto_171426 ?auto_171427 ?auto_171428 ?auto_171429 ?auto_171430 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_171466 - BLOCK
      ?auto_171467 - BLOCK
      ?auto_171468 - BLOCK
      ?auto_171469 - BLOCK
      ?auto_171470 - BLOCK
      ?auto_171471 - BLOCK
      ?auto_171472 - BLOCK
      ?auto_171473 - BLOCK
      ?auto_171474 - BLOCK
      ?auto_171475 - BLOCK
      ?auto_171476 - BLOCK
    )
    :vars
    (
      ?auto_171477 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171476 ?auto_171477 ) ( ON-TABLE ?auto_171466 ) ( ON ?auto_171467 ?auto_171466 ) ( ON ?auto_171468 ?auto_171467 ) ( not ( = ?auto_171466 ?auto_171467 ) ) ( not ( = ?auto_171466 ?auto_171468 ) ) ( not ( = ?auto_171466 ?auto_171469 ) ) ( not ( = ?auto_171466 ?auto_171470 ) ) ( not ( = ?auto_171466 ?auto_171471 ) ) ( not ( = ?auto_171466 ?auto_171472 ) ) ( not ( = ?auto_171466 ?auto_171473 ) ) ( not ( = ?auto_171466 ?auto_171474 ) ) ( not ( = ?auto_171466 ?auto_171475 ) ) ( not ( = ?auto_171466 ?auto_171476 ) ) ( not ( = ?auto_171466 ?auto_171477 ) ) ( not ( = ?auto_171467 ?auto_171468 ) ) ( not ( = ?auto_171467 ?auto_171469 ) ) ( not ( = ?auto_171467 ?auto_171470 ) ) ( not ( = ?auto_171467 ?auto_171471 ) ) ( not ( = ?auto_171467 ?auto_171472 ) ) ( not ( = ?auto_171467 ?auto_171473 ) ) ( not ( = ?auto_171467 ?auto_171474 ) ) ( not ( = ?auto_171467 ?auto_171475 ) ) ( not ( = ?auto_171467 ?auto_171476 ) ) ( not ( = ?auto_171467 ?auto_171477 ) ) ( not ( = ?auto_171468 ?auto_171469 ) ) ( not ( = ?auto_171468 ?auto_171470 ) ) ( not ( = ?auto_171468 ?auto_171471 ) ) ( not ( = ?auto_171468 ?auto_171472 ) ) ( not ( = ?auto_171468 ?auto_171473 ) ) ( not ( = ?auto_171468 ?auto_171474 ) ) ( not ( = ?auto_171468 ?auto_171475 ) ) ( not ( = ?auto_171468 ?auto_171476 ) ) ( not ( = ?auto_171468 ?auto_171477 ) ) ( not ( = ?auto_171469 ?auto_171470 ) ) ( not ( = ?auto_171469 ?auto_171471 ) ) ( not ( = ?auto_171469 ?auto_171472 ) ) ( not ( = ?auto_171469 ?auto_171473 ) ) ( not ( = ?auto_171469 ?auto_171474 ) ) ( not ( = ?auto_171469 ?auto_171475 ) ) ( not ( = ?auto_171469 ?auto_171476 ) ) ( not ( = ?auto_171469 ?auto_171477 ) ) ( not ( = ?auto_171470 ?auto_171471 ) ) ( not ( = ?auto_171470 ?auto_171472 ) ) ( not ( = ?auto_171470 ?auto_171473 ) ) ( not ( = ?auto_171470 ?auto_171474 ) ) ( not ( = ?auto_171470 ?auto_171475 ) ) ( not ( = ?auto_171470 ?auto_171476 ) ) ( not ( = ?auto_171470 ?auto_171477 ) ) ( not ( = ?auto_171471 ?auto_171472 ) ) ( not ( = ?auto_171471 ?auto_171473 ) ) ( not ( = ?auto_171471 ?auto_171474 ) ) ( not ( = ?auto_171471 ?auto_171475 ) ) ( not ( = ?auto_171471 ?auto_171476 ) ) ( not ( = ?auto_171471 ?auto_171477 ) ) ( not ( = ?auto_171472 ?auto_171473 ) ) ( not ( = ?auto_171472 ?auto_171474 ) ) ( not ( = ?auto_171472 ?auto_171475 ) ) ( not ( = ?auto_171472 ?auto_171476 ) ) ( not ( = ?auto_171472 ?auto_171477 ) ) ( not ( = ?auto_171473 ?auto_171474 ) ) ( not ( = ?auto_171473 ?auto_171475 ) ) ( not ( = ?auto_171473 ?auto_171476 ) ) ( not ( = ?auto_171473 ?auto_171477 ) ) ( not ( = ?auto_171474 ?auto_171475 ) ) ( not ( = ?auto_171474 ?auto_171476 ) ) ( not ( = ?auto_171474 ?auto_171477 ) ) ( not ( = ?auto_171475 ?auto_171476 ) ) ( not ( = ?auto_171475 ?auto_171477 ) ) ( not ( = ?auto_171476 ?auto_171477 ) ) ( ON ?auto_171475 ?auto_171476 ) ( ON ?auto_171474 ?auto_171475 ) ( ON ?auto_171473 ?auto_171474 ) ( ON ?auto_171472 ?auto_171473 ) ( ON ?auto_171471 ?auto_171472 ) ( ON ?auto_171470 ?auto_171471 ) ( CLEAR ?auto_171468 ) ( ON ?auto_171469 ?auto_171470 ) ( CLEAR ?auto_171469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_171466 ?auto_171467 ?auto_171468 ?auto_171469 )
      ( MAKE-11PILE ?auto_171466 ?auto_171467 ?auto_171468 ?auto_171469 ?auto_171470 ?auto_171471 ?auto_171472 ?auto_171473 ?auto_171474 ?auto_171475 ?auto_171476 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_171512 - BLOCK
      ?auto_171513 - BLOCK
      ?auto_171514 - BLOCK
      ?auto_171515 - BLOCK
      ?auto_171516 - BLOCK
      ?auto_171517 - BLOCK
      ?auto_171518 - BLOCK
      ?auto_171519 - BLOCK
      ?auto_171520 - BLOCK
      ?auto_171521 - BLOCK
      ?auto_171522 - BLOCK
    )
    :vars
    (
      ?auto_171523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171522 ?auto_171523 ) ( ON-TABLE ?auto_171512 ) ( ON ?auto_171513 ?auto_171512 ) ( not ( = ?auto_171512 ?auto_171513 ) ) ( not ( = ?auto_171512 ?auto_171514 ) ) ( not ( = ?auto_171512 ?auto_171515 ) ) ( not ( = ?auto_171512 ?auto_171516 ) ) ( not ( = ?auto_171512 ?auto_171517 ) ) ( not ( = ?auto_171512 ?auto_171518 ) ) ( not ( = ?auto_171512 ?auto_171519 ) ) ( not ( = ?auto_171512 ?auto_171520 ) ) ( not ( = ?auto_171512 ?auto_171521 ) ) ( not ( = ?auto_171512 ?auto_171522 ) ) ( not ( = ?auto_171512 ?auto_171523 ) ) ( not ( = ?auto_171513 ?auto_171514 ) ) ( not ( = ?auto_171513 ?auto_171515 ) ) ( not ( = ?auto_171513 ?auto_171516 ) ) ( not ( = ?auto_171513 ?auto_171517 ) ) ( not ( = ?auto_171513 ?auto_171518 ) ) ( not ( = ?auto_171513 ?auto_171519 ) ) ( not ( = ?auto_171513 ?auto_171520 ) ) ( not ( = ?auto_171513 ?auto_171521 ) ) ( not ( = ?auto_171513 ?auto_171522 ) ) ( not ( = ?auto_171513 ?auto_171523 ) ) ( not ( = ?auto_171514 ?auto_171515 ) ) ( not ( = ?auto_171514 ?auto_171516 ) ) ( not ( = ?auto_171514 ?auto_171517 ) ) ( not ( = ?auto_171514 ?auto_171518 ) ) ( not ( = ?auto_171514 ?auto_171519 ) ) ( not ( = ?auto_171514 ?auto_171520 ) ) ( not ( = ?auto_171514 ?auto_171521 ) ) ( not ( = ?auto_171514 ?auto_171522 ) ) ( not ( = ?auto_171514 ?auto_171523 ) ) ( not ( = ?auto_171515 ?auto_171516 ) ) ( not ( = ?auto_171515 ?auto_171517 ) ) ( not ( = ?auto_171515 ?auto_171518 ) ) ( not ( = ?auto_171515 ?auto_171519 ) ) ( not ( = ?auto_171515 ?auto_171520 ) ) ( not ( = ?auto_171515 ?auto_171521 ) ) ( not ( = ?auto_171515 ?auto_171522 ) ) ( not ( = ?auto_171515 ?auto_171523 ) ) ( not ( = ?auto_171516 ?auto_171517 ) ) ( not ( = ?auto_171516 ?auto_171518 ) ) ( not ( = ?auto_171516 ?auto_171519 ) ) ( not ( = ?auto_171516 ?auto_171520 ) ) ( not ( = ?auto_171516 ?auto_171521 ) ) ( not ( = ?auto_171516 ?auto_171522 ) ) ( not ( = ?auto_171516 ?auto_171523 ) ) ( not ( = ?auto_171517 ?auto_171518 ) ) ( not ( = ?auto_171517 ?auto_171519 ) ) ( not ( = ?auto_171517 ?auto_171520 ) ) ( not ( = ?auto_171517 ?auto_171521 ) ) ( not ( = ?auto_171517 ?auto_171522 ) ) ( not ( = ?auto_171517 ?auto_171523 ) ) ( not ( = ?auto_171518 ?auto_171519 ) ) ( not ( = ?auto_171518 ?auto_171520 ) ) ( not ( = ?auto_171518 ?auto_171521 ) ) ( not ( = ?auto_171518 ?auto_171522 ) ) ( not ( = ?auto_171518 ?auto_171523 ) ) ( not ( = ?auto_171519 ?auto_171520 ) ) ( not ( = ?auto_171519 ?auto_171521 ) ) ( not ( = ?auto_171519 ?auto_171522 ) ) ( not ( = ?auto_171519 ?auto_171523 ) ) ( not ( = ?auto_171520 ?auto_171521 ) ) ( not ( = ?auto_171520 ?auto_171522 ) ) ( not ( = ?auto_171520 ?auto_171523 ) ) ( not ( = ?auto_171521 ?auto_171522 ) ) ( not ( = ?auto_171521 ?auto_171523 ) ) ( not ( = ?auto_171522 ?auto_171523 ) ) ( ON ?auto_171521 ?auto_171522 ) ( ON ?auto_171520 ?auto_171521 ) ( ON ?auto_171519 ?auto_171520 ) ( ON ?auto_171518 ?auto_171519 ) ( ON ?auto_171517 ?auto_171518 ) ( ON ?auto_171516 ?auto_171517 ) ( ON ?auto_171515 ?auto_171516 ) ( CLEAR ?auto_171513 ) ( ON ?auto_171514 ?auto_171515 ) ( CLEAR ?auto_171514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_171512 ?auto_171513 ?auto_171514 )
      ( MAKE-11PILE ?auto_171512 ?auto_171513 ?auto_171514 ?auto_171515 ?auto_171516 ?auto_171517 ?auto_171518 ?auto_171519 ?auto_171520 ?auto_171521 ?auto_171522 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_171558 - BLOCK
      ?auto_171559 - BLOCK
      ?auto_171560 - BLOCK
      ?auto_171561 - BLOCK
      ?auto_171562 - BLOCK
      ?auto_171563 - BLOCK
      ?auto_171564 - BLOCK
      ?auto_171565 - BLOCK
      ?auto_171566 - BLOCK
      ?auto_171567 - BLOCK
      ?auto_171568 - BLOCK
    )
    :vars
    (
      ?auto_171569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171568 ?auto_171569 ) ( ON-TABLE ?auto_171558 ) ( not ( = ?auto_171558 ?auto_171559 ) ) ( not ( = ?auto_171558 ?auto_171560 ) ) ( not ( = ?auto_171558 ?auto_171561 ) ) ( not ( = ?auto_171558 ?auto_171562 ) ) ( not ( = ?auto_171558 ?auto_171563 ) ) ( not ( = ?auto_171558 ?auto_171564 ) ) ( not ( = ?auto_171558 ?auto_171565 ) ) ( not ( = ?auto_171558 ?auto_171566 ) ) ( not ( = ?auto_171558 ?auto_171567 ) ) ( not ( = ?auto_171558 ?auto_171568 ) ) ( not ( = ?auto_171558 ?auto_171569 ) ) ( not ( = ?auto_171559 ?auto_171560 ) ) ( not ( = ?auto_171559 ?auto_171561 ) ) ( not ( = ?auto_171559 ?auto_171562 ) ) ( not ( = ?auto_171559 ?auto_171563 ) ) ( not ( = ?auto_171559 ?auto_171564 ) ) ( not ( = ?auto_171559 ?auto_171565 ) ) ( not ( = ?auto_171559 ?auto_171566 ) ) ( not ( = ?auto_171559 ?auto_171567 ) ) ( not ( = ?auto_171559 ?auto_171568 ) ) ( not ( = ?auto_171559 ?auto_171569 ) ) ( not ( = ?auto_171560 ?auto_171561 ) ) ( not ( = ?auto_171560 ?auto_171562 ) ) ( not ( = ?auto_171560 ?auto_171563 ) ) ( not ( = ?auto_171560 ?auto_171564 ) ) ( not ( = ?auto_171560 ?auto_171565 ) ) ( not ( = ?auto_171560 ?auto_171566 ) ) ( not ( = ?auto_171560 ?auto_171567 ) ) ( not ( = ?auto_171560 ?auto_171568 ) ) ( not ( = ?auto_171560 ?auto_171569 ) ) ( not ( = ?auto_171561 ?auto_171562 ) ) ( not ( = ?auto_171561 ?auto_171563 ) ) ( not ( = ?auto_171561 ?auto_171564 ) ) ( not ( = ?auto_171561 ?auto_171565 ) ) ( not ( = ?auto_171561 ?auto_171566 ) ) ( not ( = ?auto_171561 ?auto_171567 ) ) ( not ( = ?auto_171561 ?auto_171568 ) ) ( not ( = ?auto_171561 ?auto_171569 ) ) ( not ( = ?auto_171562 ?auto_171563 ) ) ( not ( = ?auto_171562 ?auto_171564 ) ) ( not ( = ?auto_171562 ?auto_171565 ) ) ( not ( = ?auto_171562 ?auto_171566 ) ) ( not ( = ?auto_171562 ?auto_171567 ) ) ( not ( = ?auto_171562 ?auto_171568 ) ) ( not ( = ?auto_171562 ?auto_171569 ) ) ( not ( = ?auto_171563 ?auto_171564 ) ) ( not ( = ?auto_171563 ?auto_171565 ) ) ( not ( = ?auto_171563 ?auto_171566 ) ) ( not ( = ?auto_171563 ?auto_171567 ) ) ( not ( = ?auto_171563 ?auto_171568 ) ) ( not ( = ?auto_171563 ?auto_171569 ) ) ( not ( = ?auto_171564 ?auto_171565 ) ) ( not ( = ?auto_171564 ?auto_171566 ) ) ( not ( = ?auto_171564 ?auto_171567 ) ) ( not ( = ?auto_171564 ?auto_171568 ) ) ( not ( = ?auto_171564 ?auto_171569 ) ) ( not ( = ?auto_171565 ?auto_171566 ) ) ( not ( = ?auto_171565 ?auto_171567 ) ) ( not ( = ?auto_171565 ?auto_171568 ) ) ( not ( = ?auto_171565 ?auto_171569 ) ) ( not ( = ?auto_171566 ?auto_171567 ) ) ( not ( = ?auto_171566 ?auto_171568 ) ) ( not ( = ?auto_171566 ?auto_171569 ) ) ( not ( = ?auto_171567 ?auto_171568 ) ) ( not ( = ?auto_171567 ?auto_171569 ) ) ( not ( = ?auto_171568 ?auto_171569 ) ) ( ON ?auto_171567 ?auto_171568 ) ( ON ?auto_171566 ?auto_171567 ) ( ON ?auto_171565 ?auto_171566 ) ( ON ?auto_171564 ?auto_171565 ) ( ON ?auto_171563 ?auto_171564 ) ( ON ?auto_171562 ?auto_171563 ) ( ON ?auto_171561 ?auto_171562 ) ( ON ?auto_171560 ?auto_171561 ) ( CLEAR ?auto_171558 ) ( ON ?auto_171559 ?auto_171560 ) ( CLEAR ?auto_171559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_171558 ?auto_171559 )
      ( MAKE-11PILE ?auto_171558 ?auto_171559 ?auto_171560 ?auto_171561 ?auto_171562 ?auto_171563 ?auto_171564 ?auto_171565 ?auto_171566 ?auto_171567 ?auto_171568 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_171604 - BLOCK
      ?auto_171605 - BLOCK
      ?auto_171606 - BLOCK
      ?auto_171607 - BLOCK
      ?auto_171608 - BLOCK
      ?auto_171609 - BLOCK
      ?auto_171610 - BLOCK
      ?auto_171611 - BLOCK
      ?auto_171612 - BLOCK
      ?auto_171613 - BLOCK
      ?auto_171614 - BLOCK
    )
    :vars
    (
      ?auto_171615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171614 ?auto_171615 ) ( not ( = ?auto_171604 ?auto_171605 ) ) ( not ( = ?auto_171604 ?auto_171606 ) ) ( not ( = ?auto_171604 ?auto_171607 ) ) ( not ( = ?auto_171604 ?auto_171608 ) ) ( not ( = ?auto_171604 ?auto_171609 ) ) ( not ( = ?auto_171604 ?auto_171610 ) ) ( not ( = ?auto_171604 ?auto_171611 ) ) ( not ( = ?auto_171604 ?auto_171612 ) ) ( not ( = ?auto_171604 ?auto_171613 ) ) ( not ( = ?auto_171604 ?auto_171614 ) ) ( not ( = ?auto_171604 ?auto_171615 ) ) ( not ( = ?auto_171605 ?auto_171606 ) ) ( not ( = ?auto_171605 ?auto_171607 ) ) ( not ( = ?auto_171605 ?auto_171608 ) ) ( not ( = ?auto_171605 ?auto_171609 ) ) ( not ( = ?auto_171605 ?auto_171610 ) ) ( not ( = ?auto_171605 ?auto_171611 ) ) ( not ( = ?auto_171605 ?auto_171612 ) ) ( not ( = ?auto_171605 ?auto_171613 ) ) ( not ( = ?auto_171605 ?auto_171614 ) ) ( not ( = ?auto_171605 ?auto_171615 ) ) ( not ( = ?auto_171606 ?auto_171607 ) ) ( not ( = ?auto_171606 ?auto_171608 ) ) ( not ( = ?auto_171606 ?auto_171609 ) ) ( not ( = ?auto_171606 ?auto_171610 ) ) ( not ( = ?auto_171606 ?auto_171611 ) ) ( not ( = ?auto_171606 ?auto_171612 ) ) ( not ( = ?auto_171606 ?auto_171613 ) ) ( not ( = ?auto_171606 ?auto_171614 ) ) ( not ( = ?auto_171606 ?auto_171615 ) ) ( not ( = ?auto_171607 ?auto_171608 ) ) ( not ( = ?auto_171607 ?auto_171609 ) ) ( not ( = ?auto_171607 ?auto_171610 ) ) ( not ( = ?auto_171607 ?auto_171611 ) ) ( not ( = ?auto_171607 ?auto_171612 ) ) ( not ( = ?auto_171607 ?auto_171613 ) ) ( not ( = ?auto_171607 ?auto_171614 ) ) ( not ( = ?auto_171607 ?auto_171615 ) ) ( not ( = ?auto_171608 ?auto_171609 ) ) ( not ( = ?auto_171608 ?auto_171610 ) ) ( not ( = ?auto_171608 ?auto_171611 ) ) ( not ( = ?auto_171608 ?auto_171612 ) ) ( not ( = ?auto_171608 ?auto_171613 ) ) ( not ( = ?auto_171608 ?auto_171614 ) ) ( not ( = ?auto_171608 ?auto_171615 ) ) ( not ( = ?auto_171609 ?auto_171610 ) ) ( not ( = ?auto_171609 ?auto_171611 ) ) ( not ( = ?auto_171609 ?auto_171612 ) ) ( not ( = ?auto_171609 ?auto_171613 ) ) ( not ( = ?auto_171609 ?auto_171614 ) ) ( not ( = ?auto_171609 ?auto_171615 ) ) ( not ( = ?auto_171610 ?auto_171611 ) ) ( not ( = ?auto_171610 ?auto_171612 ) ) ( not ( = ?auto_171610 ?auto_171613 ) ) ( not ( = ?auto_171610 ?auto_171614 ) ) ( not ( = ?auto_171610 ?auto_171615 ) ) ( not ( = ?auto_171611 ?auto_171612 ) ) ( not ( = ?auto_171611 ?auto_171613 ) ) ( not ( = ?auto_171611 ?auto_171614 ) ) ( not ( = ?auto_171611 ?auto_171615 ) ) ( not ( = ?auto_171612 ?auto_171613 ) ) ( not ( = ?auto_171612 ?auto_171614 ) ) ( not ( = ?auto_171612 ?auto_171615 ) ) ( not ( = ?auto_171613 ?auto_171614 ) ) ( not ( = ?auto_171613 ?auto_171615 ) ) ( not ( = ?auto_171614 ?auto_171615 ) ) ( ON ?auto_171613 ?auto_171614 ) ( ON ?auto_171612 ?auto_171613 ) ( ON ?auto_171611 ?auto_171612 ) ( ON ?auto_171610 ?auto_171611 ) ( ON ?auto_171609 ?auto_171610 ) ( ON ?auto_171608 ?auto_171609 ) ( ON ?auto_171607 ?auto_171608 ) ( ON ?auto_171606 ?auto_171607 ) ( ON ?auto_171605 ?auto_171606 ) ( ON ?auto_171604 ?auto_171605 ) ( CLEAR ?auto_171604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_171604 )
      ( MAKE-11PILE ?auto_171604 ?auto_171605 ?auto_171606 ?auto_171607 ?auto_171608 ?auto_171609 ?auto_171610 ?auto_171611 ?auto_171612 ?auto_171613 ?auto_171614 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_171651 - BLOCK
      ?auto_171652 - BLOCK
      ?auto_171653 - BLOCK
      ?auto_171654 - BLOCK
      ?auto_171655 - BLOCK
      ?auto_171656 - BLOCK
      ?auto_171657 - BLOCK
      ?auto_171658 - BLOCK
      ?auto_171659 - BLOCK
      ?auto_171660 - BLOCK
      ?auto_171661 - BLOCK
      ?auto_171662 - BLOCK
    )
    :vars
    (
      ?auto_171663 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_171661 ) ( ON ?auto_171662 ?auto_171663 ) ( CLEAR ?auto_171662 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_171651 ) ( ON ?auto_171652 ?auto_171651 ) ( ON ?auto_171653 ?auto_171652 ) ( ON ?auto_171654 ?auto_171653 ) ( ON ?auto_171655 ?auto_171654 ) ( ON ?auto_171656 ?auto_171655 ) ( ON ?auto_171657 ?auto_171656 ) ( ON ?auto_171658 ?auto_171657 ) ( ON ?auto_171659 ?auto_171658 ) ( ON ?auto_171660 ?auto_171659 ) ( ON ?auto_171661 ?auto_171660 ) ( not ( = ?auto_171651 ?auto_171652 ) ) ( not ( = ?auto_171651 ?auto_171653 ) ) ( not ( = ?auto_171651 ?auto_171654 ) ) ( not ( = ?auto_171651 ?auto_171655 ) ) ( not ( = ?auto_171651 ?auto_171656 ) ) ( not ( = ?auto_171651 ?auto_171657 ) ) ( not ( = ?auto_171651 ?auto_171658 ) ) ( not ( = ?auto_171651 ?auto_171659 ) ) ( not ( = ?auto_171651 ?auto_171660 ) ) ( not ( = ?auto_171651 ?auto_171661 ) ) ( not ( = ?auto_171651 ?auto_171662 ) ) ( not ( = ?auto_171651 ?auto_171663 ) ) ( not ( = ?auto_171652 ?auto_171653 ) ) ( not ( = ?auto_171652 ?auto_171654 ) ) ( not ( = ?auto_171652 ?auto_171655 ) ) ( not ( = ?auto_171652 ?auto_171656 ) ) ( not ( = ?auto_171652 ?auto_171657 ) ) ( not ( = ?auto_171652 ?auto_171658 ) ) ( not ( = ?auto_171652 ?auto_171659 ) ) ( not ( = ?auto_171652 ?auto_171660 ) ) ( not ( = ?auto_171652 ?auto_171661 ) ) ( not ( = ?auto_171652 ?auto_171662 ) ) ( not ( = ?auto_171652 ?auto_171663 ) ) ( not ( = ?auto_171653 ?auto_171654 ) ) ( not ( = ?auto_171653 ?auto_171655 ) ) ( not ( = ?auto_171653 ?auto_171656 ) ) ( not ( = ?auto_171653 ?auto_171657 ) ) ( not ( = ?auto_171653 ?auto_171658 ) ) ( not ( = ?auto_171653 ?auto_171659 ) ) ( not ( = ?auto_171653 ?auto_171660 ) ) ( not ( = ?auto_171653 ?auto_171661 ) ) ( not ( = ?auto_171653 ?auto_171662 ) ) ( not ( = ?auto_171653 ?auto_171663 ) ) ( not ( = ?auto_171654 ?auto_171655 ) ) ( not ( = ?auto_171654 ?auto_171656 ) ) ( not ( = ?auto_171654 ?auto_171657 ) ) ( not ( = ?auto_171654 ?auto_171658 ) ) ( not ( = ?auto_171654 ?auto_171659 ) ) ( not ( = ?auto_171654 ?auto_171660 ) ) ( not ( = ?auto_171654 ?auto_171661 ) ) ( not ( = ?auto_171654 ?auto_171662 ) ) ( not ( = ?auto_171654 ?auto_171663 ) ) ( not ( = ?auto_171655 ?auto_171656 ) ) ( not ( = ?auto_171655 ?auto_171657 ) ) ( not ( = ?auto_171655 ?auto_171658 ) ) ( not ( = ?auto_171655 ?auto_171659 ) ) ( not ( = ?auto_171655 ?auto_171660 ) ) ( not ( = ?auto_171655 ?auto_171661 ) ) ( not ( = ?auto_171655 ?auto_171662 ) ) ( not ( = ?auto_171655 ?auto_171663 ) ) ( not ( = ?auto_171656 ?auto_171657 ) ) ( not ( = ?auto_171656 ?auto_171658 ) ) ( not ( = ?auto_171656 ?auto_171659 ) ) ( not ( = ?auto_171656 ?auto_171660 ) ) ( not ( = ?auto_171656 ?auto_171661 ) ) ( not ( = ?auto_171656 ?auto_171662 ) ) ( not ( = ?auto_171656 ?auto_171663 ) ) ( not ( = ?auto_171657 ?auto_171658 ) ) ( not ( = ?auto_171657 ?auto_171659 ) ) ( not ( = ?auto_171657 ?auto_171660 ) ) ( not ( = ?auto_171657 ?auto_171661 ) ) ( not ( = ?auto_171657 ?auto_171662 ) ) ( not ( = ?auto_171657 ?auto_171663 ) ) ( not ( = ?auto_171658 ?auto_171659 ) ) ( not ( = ?auto_171658 ?auto_171660 ) ) ( not ( = ?auto_171658 ?auto_171661 ) ) ( not ( = ?auto_171658 ?auto_171662 ) ) ( not ( = ?auto_171658 ?auto_171663 ) ) ( not ( = ?auto_171659 ?auto_171660 ) ) ( not ( = ?auto_171659 ?auto_171661 ) ) ( not ( = ?auto_171659 ?auto_171662 ) ) ( not ( = ?auto_171659 ?auto_171663 ) ) ( not ( = ?auto_171660 ?auto_171661 ) ) ( not ( = ?auto_171660 ?auto_171662 ) ) ( not ( = ?auto_171660 ?auto_171663 ) ) ( not ( = ?auto_171661 ?auto_171662 ) ) ( not ( = ?auto_171661 ?auto_171663 ) ) ( not ( = ?auto_171662 ?auto_171663 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_171662 ?auto_171663 )
      ( !STACK ?auto_171662 ?auto_171661 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_171676 - BLOCK
      ?auto_171677 - BLOCK
      ?auto_171678 - BLOCK
      ?auto_171679 - BLOCK
      ?auto_171680 - BLOCK
      ?auto_171681 - BLOCK
      ?auto_171682 - BLOCK
      ?auto_171683 - BLOCK
      ?auto_171684 - BLOCK
      ?auto_171685 - BLOCK
      ?auto_171686 - BLOCK
      ?auto_171687 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_171686 ) ( ON-TABLE ?auto_171687 ) ( CLEAR ?auto_171687 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_171676 ) ( ON ?auto_171677 ?auto_171676 ) ( ON ?auto_171678 ?auto_171677 ) ( ON ?auto_171679 ?auto_171678 ) ( ON ?auto_171680 ?auto_171679 ) ( ON ?auto_171681 ?auto_171680 ) ( ON ?auto_171682 ?auto_171681 ) ( ON ?auto_171683 ?auto_171682 ) ( ON ?auto_171684 ?auto_171683 ) ( ON ?auto_171685 ?auto_171684 ) ( ON ?auto_171686 ?auto_171685 ) ( not ( = ?auto_171676 ?auto_171677 ) ) ( not ( = ?auto_171676 ?auto_171678 ) ) ( not ( = ?auto_171676 ?auto_171679 ) ) ( not ( = ?auto_171676 ?auto_171680 ) ) ( not ( = ?auto_171676 ?auto_171681 ) ) ( not ( = ?auto_171676 ?auto_171682 ) ) ( not ( = ?auto_171676 ?auto_171683 ) ) ( not ( = ?auto_171676 ?auto_171684 ) ) ( not ( = ?auto_171676 ?auto_171685 ) ) ( not ( = ?auto_171676 ?auto_171686 ) ) ( not ( = ?auto_171676 ?auto_171687 ) ) ( not ( = ?auto_171677 ?auto_171678 ) ) ( not ( = ?auto_171677 ?auto_171679 ) ) ( not ( = ?auto_171677 ?auto_171680 ) ) ( not ( = ?auto_171677 ?auto_171681 ) ) ( not ( = ?auto_171677 ?auto_171682 ) ) ( not ( = ?auto_171677 ?auto_171683 ) ) ( not ( = ?auto_171677 ?auto_171684 ) ) ( not ( = ?auto_171677 ?auto_171685 ) ) ( not ( = ?auto_171677 ?auto_171686 ) ) ( not ( = ?auto_171677 ?auto_171687 ) ) ( not ( = ?auto_171678 ?auto_171679 ) ) ( not ( = ?auto_171678 ?auto_171680 ) ) ( not ( = ?auto_171678 ?auto_171681 ) ) ( not ( = ?auto_171678 ?auto_171682 ) ) ( not ( = ?auto_171678 ?auto_171683 ) ) ( not ( = ?auto_171678 ?auto_171684 ) ) ( not ( = ?auto_171678 ?auto_171685 ) ) ( not ( = ?auto_171678 ?auto_171686 ) ) ( not ( = ?auto_171678 ?auto_171687 ) ) ( not ( = ?auto_171679 ?auto_171680 ) ) ( not ( = ?auto_171679 ?auto_171681 ) ) ( not ( = ?auto_171679 ?auto_171682 ) ) ( not ( = ?auto_171679 ?auto_171683 ) ) ( not ( = ?auto_171679 ?auto_171684 ) ) ( not ( = ?auto_171679 ?auto_171685 ) ) ( not ( = ?auto_171679 ?auto_171686 ) ) ( not ( = ?auto_171679 ?auto_171687 ) ) ( not ( = ?auto_171680 ?auto_171681 ) ) ( not ( = ?auto_171680 ?auto_171682 ) ) ( not ( = ?auto_171680 ?auto_171683 ) ) ( not ( = ?auto_171680 ?auto_171684 ) ) ( not ( = ?auto_171680 ?auto_171685 ) ) ( not ( = ?auto_171680 ?auto_171686 ) ) ( not ( = ?auto_171680 ?auto_171687 ) ) ( not ( = ?auto_171681 ?auto_171682 ) ) ( not ( = ?auto_171681 ?auto_171683 ) ) ( not ( = ?auto_171681 ?auto_171684 ) ) ( not ( = ?auto_171681 ?auto_171685 ) ) ( not ( = ?auto_171681 ?auto_171686 ) ) ( not ( = ?auto_171681 ?auto_171687 ) ) ( not ( = ?auto_171682 ?auto_171683 ) ) ( not ( = ?auto_171682 ?auto_171684 ) ) ( not ( = ?auto_171682 ?auto_171685 ) ) ( not ( = ?auto_171682 ?auto_171686 ) ) ( not ( = ?auto_171682 ?auto_171687 ) ) ( not ( = ?auto_171683 ?auto_171684 ) ) ( not ( = ?auto_171683 ?auto_171685 ) ) ( not ( = ?auto_171683 ?auto_171686 ) ) ( not ( = ?auto_171683 ?auto_171687 ) ) ( not ( = ?auto_171684 ?auto_171685 ) ) ( not ( = ?auto_171684 ?auto_171686 ) ) ( not ( = ?auto_171684 ?auto_171687 ) ) ( not ( = ?auto_171685 ?auto_171686 ) ) ( not ( = ?auto_171685 ?auto_171687 ) ) ( not ( = ?auto_171686 ?auto_171687 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_171687 )
      ( !STACK ?auto_171687 ?auto_171686 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_171700 - BLOCK
      ?auto_171701 - BLOCK
      ?auto_171702 - BLOCK
      ?auto_171703 - BLOCK
      ?auto_171704 - BLOCK
      ?auto_171705 - BLOCK
      ?auto_171706 - BLOCK
      ?auto_171707 - BLOCK
      ?auto_171708 - BLOCK
      ?auto_171709 - BLOCK
      ?auto_171710 - BLOCK
      ?auto_171711 - BLOCK
    )
    :vars
    (
      ?auto_171712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171711 ?auto_171712 ) ( ON-TABLE ?auto_171700 ) ( ON ?auto_171701 ?auto_171700 ) ( ON ?auto_171702 ?auto_171701 ) ( ON ?auto_171703 ?auto_171702 ) ( ON ?auto_171704 ?auto_171703 ) ( ON ?auto_171705 ?auto_171704 ) ( ON ?auto_171706 ?auto_171705 ) ( ON ?auto_171707 ?auto_171706 ) ( ON ?auto_171708 ?auto_171707 ) ( ON ?auto_171709 ?auto_171708 ) ( not ( = ?auto_171700 ?auto_171701 ) ) ( not ( = ?auto_171700 ?auto_171702 ) ) ( not ( = ?auto_171700 ?auto_171703 ) ) ( not ( = ?auto_171700 ?auto_171704 ) ) ( not ( = ?auto_171700 ?auto_171705 ) ) ( not ( = ?auto_171700 ?auto_171706 ) ) ( not ( = ?auto_171700 ?auto_171707 ) ) ( not ( = ?auto_171700 ?auto_171708 ) ) ( not ( = ?auto_171700 ?auto_171709 ) ) ( not ( = ?auto_171700 ?auto_171710 ) ) ( not ( = ?auto_171700 ?auto_171711 ) ) ( not ( = ?auto_171700 ?auto_171712 ) ) ( not ( = ?auto_171701 ?auto_171702 ) ) ( not ( = ?auto_171701 ?auto_171703 ) ) ( not ( = ?auto_171701 ?auto_171704 ) ) ( not ( = ?auto_171701 ?auto_171705 ) ) ( not ( = ?auto_171701 ?auto_171706 ) ) ( not ( = ?auto_171701 ?auto_171707 ) ) ( not ( = ?auto_171701 ?auto_171708 ) ) ( not ( = ?auto_171701 ?auto_171709 ) ) ( not ( = ?auto_171701 ?auto_171710 ) ) ( not ( = ?auto_171701 ?auto_171711 ) ) ( not ( = ?auto_171701 ?auto_171712 ) ) ( not ( = ?auto_171702 ?auto_171703 ) ) ( not ( = ?auto_171702 ?auto_171704 ) ) ( not ( = ?auto_171702 ?auto_171705 ) ) ( not ( = ?auto_171702 ?auto_171706 ) ) ( not ( = ?auto_171702 ?auto_171707 ) ) ( not ( = ?auto_171702 ?auto_171708 ) ) ( not ( = ?auto_171702 ?auto_171709 ) ) ( not ( = ?auto_171702 ?auto_171710 ) ) ( not ( = ?auto_171702 ?auto_171711 ) ) ( not ( = ?auto_171702 ?auto_171712 ) ) ( not ( = ?auto_171703 ?auto_171704 ) ) ( not ( = ?auto_171703 ?auto_171705 ) ) ( not ( = ?auto_171703 ?auto_171706 ) ) ( not ( = ?auto_171703 ?auto_171707 ) ) ( not ( = ?auto_171703 ?auto_171708 ) ) ( not ( = ?auto_171703 ?auto_171709 ) ) ( not ( = ?auto_171703 ?auto_171710 ) ) ( not ( = ?auto_171703 ?auto_171711 ) ) ( not ( = ?auto_171703 ?auto_171712 ) ) ( not ( = ?auto_171704 ?auto_171705 ) ) ( not ( = ?auto_171704 ?auto_171706 ) ) ( not ( = ?auto_171704 ?auto_171707 ) ) ( not ( = ?auto_171704 ?auto_171708 ) ) ( not ( = ?auto_171704 ?auto_171709 ) ) ( not ( = ?auto_171704 ?auto_171710 ) ) ( not ( = ?auto_171704 ?auto_171711 ) ) ( not ( = ?auto_171704 ?auto_171712 ) ) ( not ( = ?auto_171705 ?auto_171706 ) ) ( not ( = ?auto_171705 ?auto_171707 ) ) ( not ( = ?auto_171705 ?auto_171708 ) ) ( not ( = ?auto_171705 ?auto_171709 ) ) ( not ( = ?auto_171705 ?auto_171710 ) ) ( not ( = ?auto_171705 ?auto_171711 ) ) ( not ( = ?auto_171705 ?auto_171712 ) ) ( not ( = ?auto_171706 ?auto_171707 ) ) ( not ( = ?auto_171706 ?auto_171708 ) ) ( not ( = ?auto_171706 ?auto_171709 ) ) ( not ( = ?auto_171706 ?auto_171710 ) ) ( not ( = ?auto_171706 ?auto_171711 ) ) ( not ( = ?auto_171706 ?auto_171712 ) ) ( not ( = ?auto_171707 ?auto_171708 ) ) ( not ( = ?auto_171707 ?auto_171709 ) ) ( not ( = ?auto_171707 ?auto_171710 ) ) ( not ( = ?auto_171707 ?auto_171711 ) ) ( not ( = ?auto_171707 ?auto_171712 ) ) ( not ( = ?auto_171708 ?auto_171709 ) ) ( not ( = ?auto_171708 ?auto_171710 ) ) ( not ( = ?auto_171708 ?auto_171711 ) ) ( not ( = ?auto_171708 ?auto_171712 ) ) ( not ( = ?auto_171709 ?auto_171710 ) ) ( not ( = ?auto_171709 ?auto_171711 ) ) ( not ( = ?auto_171709 ?auto_171712 ) ) ( not ( = ?auto_171710 ?auto_171711 ) ) ( not ( = ?auto_171710 ?auto_171712 ) ) ( not ( = ?auto_171711 ?auto_171712 ) ) ( CLEAR ?auto_171709 ) ( ON ?auto_171710 ?auto_171711 ) ( CLEAR ?auto_171710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_171700 ?auto_171701 ?auto_171702 ?auto_171703 ?auto_171704 ?auto_171705 ?auto_171706 ?auto_171707 ?auto_171708 ?auto_171709 ?auto_171710 )
      ( MAKE-12PILE ?auto_171700 ?auto_171701 ?auto_171702 ?auto_171703 ?auto_171704 ?auto_171705 ?auto_171706 ?auto_171707 ?auto_171708 ?auto_171709 ?auto_171710 ?auto_171711 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_171725 - BLOCK
      ?auto_171726 - BLOCK
      ?auto_171727 - BLOCK
      ?auto_171728 - BLOCK
      ?auto_171729 - BLOCK
      ?auto_171730 - BLOCK
      ?auto_171731 - BLOCK
      ?auto_171732 - BLOCK
      ?auto_171733 - BLOCK
      ?auto_171734 - BLOCK
      ?auto_171735 - BLOCK
      ?auto_171736 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171736 ) ( ON-TABLE ?auto_171725 ) ( ON ?auto_171726 ?auto_171725 ) ( ON ?auto_171727 ?auto_171726 ) ( ON ?auto_171728 ?auto_171727 ) ( ON ?auto_171729 ?auto_171728 ) ( ON ?auto_171730 ?auto_171729 ) ( ON ?auto_171731 ?auto_171730 ) ( ON ?auto_171732 ?auto_171731 ) ( ON ?auto_171733 ?auto_171732 ) ( ON ?auto_171734 ?auto_171733 ) ( not ( = ?auto_171725 ?auto_171726 ) ) ( not ( = ?auto_171725 ?auto_171727 ) ) ( not ( = ?auto_171725 ?auto_171728 ) ) ( not ( = ?auto_171725 ?auto_171729 ) ) ( not ( = ?auto_171725 ?auto_171730 ) ) ( not ( = ?auto_171725 ?auto_171731 ) ) ( not ( = ?auto_171725 ?auto_171732 ) ) ( not ( = ?auto_171725 ?auto_171733 ) ) ( not ( = ?auto_171725 ?auto_171734 ) ) ( not ( = ?auto_171725 ?auto_171735 ) ) ( not ( = ?auto_171725 ?auto_171736 ) ) ( not ( = ?auto_171726 ?auto_171727 ) ) ( not ( = ?auto_171726 ?auto_171728 ) ) ( not ( = ?auto_171726 ?auto_171729 ) ) ( not ( = ?auto_171726 ?auto_171730 ) ) ( not ( = ?auto_171726 ?auto_171731 ) ) ( not ( = ?auto_171726 ?auto_171732 ) ) ( not ( = ?auto_171726 ?auto_171733 ) ) ( not ( = ?auto_171726 ?auto_171734 ) ) ( not ( = ?auto_171726 ?auto_171735 ) ) ( not ( = ?auto_171726 ?auto_171736 ) ) ( not ( = ?auto_171727 ?auto_171728 ) ) ( not ( = ?auto_171727 ?auto_171729 ) ) ( not ( = ?auto_171727 ?auto_171730 ) ) ( not ( = ?auto_171727 ?auto_171731 ) ) ( not ( = ?auto_171727 ?auto_171732 ) ) ( not ( = ?auto_171727 ?auto_171733 ) ) ( not ( = ?auto_171727 ?auto_171734 ) ) ( not ( = ?auto_171727 ?auto_171735 ) ) ( not ( = ?auto_171727 ?auto_171736 ) ) ( not ( = ?auto_171728 ?auto_171729 ) ) ( not ( = ?auto_171728 ?auto_171730 ) ) ( not ( = ?auto_171728 ?auto_171731 ) ) ( not ( = ?auto_171728 ?auto_171732 ) ) ( not ( = ?auto_171728 ?auto_171733 ) ) ( not ( = ?auto_171728 ?auto_171734 ) ) ( not ( = ?auto_171728 ?auto_171735 ) ) ( not ( = ?auto_171728 ?auto_171736 ) ) ( not ( = ?auto_171729 ?auto_171730 ) ) ( not ( = ?auto_171729 ?auto_171731 ) ) ( not ( = ?auto_171729 ?auto_171732 ) ) ( not ( = ?auto_171729 ?auto_171733 ) ) ( not ( = ?auto_171729 ?auto_171734 ) ) ( not ( = ?auto_171729 ?auto_171735 ) ) ( not ( = ?auto_171729 ?auto_171736 ) ) ( not ( = ?auto_171730 ?auto_171731 ) ) ( not ( = ?auto_171730 ?auto_171732 ) ) ( not ( = ?auto_171730 ?auto_171733 ) ) ( not ( = ?auto_171730 ?auto_171734 ) ) ( not ( = ?auto_171730 ?auto_171735 ) ) ( not ( = ?auto_171730 ?auto_171736 ) ) ( not ( = ?auto_171731 ?auto_171732 ) ) ( not ( = ?auto_171731 ?auto_171733 ) ) ( not ( = ?auto_171731 ?auto_171734 ) ) ( not ( = ?auto_171731 ?auto_171735 ) ) ( not ( = ?auto_171731 ?auto_171736 ) ) ( not ( = ?auto_171732 ?auto_171733 ) ) ( not ( = ?auto_171732 ?auto_171734 ) ) ( not ( = ?auto_171732 ?auto_171735 ) ) ( not ( = ?auto_171732 ?auto_171736 ) ) ( not ( = ?auto_171733 ?auto_171734 ) ) ( not ( = ?auto_171733 ?auto_171735 ) ) ( not ( = ?auto_171733 ?auto_171736 ) ) ( not ( = ?auto_171734 ?auto_171735 ) ) ( not ( = ?auto_171734 ?auto_171736 ) ) ( not ( = ?auto_171735 ?auto_171736 ) ) ( CLEAR ?auto_171734 ) ( ON ?auto_171735 ?auto_171736 ) ( CLEAR ?auto_171735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_171725 ?auto_171726 ?auto_171727 ?auto_171728 ?auto_171729 ?auto_171730 ?auto_171731 ?auto_171732 ?auto_171733 ?auto_171734 ?auto_171735 )
      ( MAKE-12PILE ?auto_171725 ?auto_171726 ?auto_171727 ?auto_171728 ?auto_171729 ?auto_171730 ?auto_171731 ?auto_171732 ?auto_171733 ?auto_171734 ?auto_171735 ?auto_171736 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_171749 - BLOCK
      ?auto_171750 - BLOCK
      ?auto_171751 - BLOCK
      ?auto_171752 - BLOCK
      ?auto_171753 - BLOCK
      ?auto_171754 - BLOCK
      ?auto_171755 - BLOCK
      ?auto_171756 - BLOCK
      ?auto_171757 - BLOCK
      ?auto_171758 - BLOCK
      ?auto_171759 - BLOCK
      ?auto_171760 - BLOCK
    )
    :vars
    (
      ?auto_171761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171760 ?auto_171761 ) ( ON-TABLE ?auto_171749 ) ( ON ?auto_171750 ?auto_171749 ) ( ON ?auto_171751 ?auto_171750 ) ( ON ?auto_171752 ?auto_171751 ) ( ON ?auto_171753 ?auto_171752 ) ( ON ?auto_171754 ?auto_171753 ) ( ON ?auto_171755 ?auto_171754 ) ( ON ?auto_171756 ?auto_171755 ) ( ON ?auto_171757 ?auto_171756 ) ( not ( = ?auto_171749 ?auto_171750 ) ) ( not ( = ?auto_171749 ?auto_171751 ) ) ( not ( = ?auto_171749 ?auto_171752 ) ) ( not ( = ?auto_171749 ?auto_171753 ) ) ( not ( = ?auto_171749 ?auto_171754 ) ) ( not ( = ?auto_171749 ?auto_171755 ) ) ( not ( = ?auto_171749 ?auto_171756 ) ) ( not ( = ?auto_171749 ?auto_171757 ) ) ( not ( = ?auto_171749 ?auto_171758 ) ) ( not ( = ?auto_171749 ?auto_171759 ) ) ( not ( = ?auto_171749 ?auto_171760 ) ) ( not ( = ?auto_171749 ?auto_171761 ) ) ( not ( = ?auto_171750 ?auto_171751 ) ) ( not ( = ?auto_171750 ?auto_171752 ) ) ( not ( = ?auto_171750 ?auto_171753 ) ) ( not ( = ?auto_171750 ?auto_171754 ) ) ( not ( = ?auto_171750 ?auto_171755 ) ) ( not ( = ?auto_171750 ?auto_171756 ) ) ( not ( = ?auto_171750 ?auto_171757 ) ) ( not ( = ?auto_171750 ?auto_171758 ) ) ( not ( = ?auto_171750 ?auto_171759 ) ) ( not ( = ?auto_171750 ?auto_171760 ) ) ( not ( = ?auto_171750 ?auto_171761 ) ) ( not ( = ?auto_171751 ?auto_171752 ) ) ( not ( = ?auto_171751 ?auto_171753 ) ) ( not ( = ?auto_171751 ?auto_171754 ) ) ( not ( = ?auto_171751 ?auto_171755 ) ) ( not ( = ?auto_171751 ?auto_171756 ) ) ( not ( = ?auto_171751 ?auto_171757 ) ) ( not ( = ?auto_171751 ?auto_171758 ) ) ( not ( = ?auto_171751 ?auto_171759 ) ) ( not ( = ?auto_171751 ?auto_171760 ) ) ( not ( = ?auto_171751 ?auto_171761 ) ) ( not ( = ?auto_171752 ?auto_171753 ) ) ( not ( = ?auto_171752 ?auto_171754 ) ) ( not ( = ?auto_171752 ?auto_171755 ) ) ( not ( = ?auto_171752 ?auto_171756 ) ) ( not ( = ?auto_171752 ?auto_171757 ) ) ( not ( = ?auto_171752 ?auto_171758 ) ) ( not ( = ?auto_171752 ?auto_171759 ) ) ( not ( = ?auto_171752 ?auto_171760 ) ) ( not ( = ?auto_171752 ?auto_171761 ) ) ( not ( = ?auto_171753 ?auto_171754 ) ) ( not ( = ?auto_171753 ?auto_171755 ) ) ( not ( = ?auto_171753 ?auto_171756 ) ) ( not ( = ?auto_171753 ?auto_171757 ) ) ( not ( = ?auto_171753 ?auto_171758 ) ) ( not ( = ?auto_171753 ?auto_171759 ) ) ( not ( = ?auto_171753 ?auto_171760 ) ) ( not ( = ?auto_171753 ?auto_171761 ) ) ( not ( = ?auto_171754 ?auto_171755 ) ) ( not ( = ?auto_171754 ?auto_171756 ) ) ( not ( = ?auto_171754 ?auto_171757 ) ) ( not ( = ?auto_171754 ?auto_171758 ) ) ( not ( = ?auto_171754 ?auto_171759 ) ) ( not ( = ?auto_171754 ?auto_171760 ) ) ( not ( = ?auto_171754 ?auto_171761 ) ) ( not ( = ?auto_171755 ?auto_171756 ) ) ( not ( = ?auto_171755 ?auto_171757 ) ) ( not ( = ?auto_171755 ?auto_171758 ) ) ( not ( = ?auto_171755 ?auto_171759 ) ) ( not ( = ?auto_171755 ?auto_171760 ) ) ( not ( = ?auto_171755 ?auto_171761 ) ) ( not ( = ?auto_171756 ?auto_171757 ) ) ( not ( = ?auto_171756 ?auto_171758 ) ) ( not ( = ?auto_171756 ?auto_171759 ) ) ( not ( = ?auto_171756 ?auto_171760 ) ) ( not ( = ?auto_171756 ?auto_171761 ) ) ( not ( = ?auto_171757 ?auto_171758 ) ) ( not ( = ?auto_171757 ?auto_171759 ) ) ( not ( = ?auto_171757 ?auto_171760 ) ) ( not ( = ?auto_171757 ?auto_171761 ) ) ( not ( = ?auto_171758 ?auto_171759 ) ) ( not ( = ?auto_171758 ?auto_171760 ) ) ( not ( = ?auto_171758 ?auto_171761 ) ) ( not ( = ?auto_171759 ?auto_171760 ) ) ( not ( = ?auto_171759 ?auto_171761 ) ) ( not ( = ?auto_171760 ?auto_171761 ) ) ( ON ?auto_171759 ?auto_171760 ) ( CLEAR ?auto_171757 ) ( ON ?auto_171758 ?auto_171759 ) ( CLEAR ?auto_171758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_171749 ?auto_171750 ?auto_171751 ?auto_171752 ?auto_171753 ?auto_171754 ?auto_171755 ?auto_171756 ?auto_171757 ?auto_171758 )
      ( MAKE-12PILE ?auto_171749 ?auto_171750 ?auto_171751 ?auto_171752 ?auto_171753 ?auto_171754 ?auto_171755 ?auto_171756 ?auto_171757 ?auto_171758 ?auto_171759 ?auto_171760 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_171774 - BLOCK
      ?auto_171775 - BLOCK
      ?auto_171776 - BLOCK
      ?auto_171777 - BLOCK
      ?auto_171778 - BLOCK
      ?auto_171779 - BLOCK
      ?auto_171780 - BLOCK
      ?auto_171781 - BLOCK
      ?auto_171782 - BLOCK
      ?auto_171783 - BLOCK
      ?auto_171784 - BLOCK
      ?auto_171785 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171785 ) ( ON-TABLE ?auto_171774 ) ( ON ?auto_171775 ?auto_171774 ) ( ON ?auto_171776 ?auto_171775 ) ( ON ?auto_171777 ?auto_171776 ) ( ON ?auto_171778 ?auto_171777 ) ( ON ?auto_171779 ?auto_171778 ) ( ON ?auto_171780 ?auto_171779 ) ( ON ?auto_171781 ?auto_171780 ) ( ON ?auto_171782 ?auto_171781 ) ( not ( = ?auto_171774 ?auto_171775 ) ) ( not ( = ?auto_171774 ?auto_171776 ) ) ( not ( = ?auto_171774 ?auto_171777 ) ) ( not ( = ?auto_171774 ?auto_171778 ) ) ( not ( = ?auto_171774 ?auto_171779 ) ) ( not ( = ?auto_171774 ?auto_171780 ) ) ( not ( = ?auto_171774 ?auto_171781 ) ) ( not ( = ?auto_171774 ?auto_171782 ) ) ( not ( = ?auto_171774 ?auto_171783 ) ) ( not ( = ?auto_171774 ?auto_171784 ) ) ( not ( = ?auto_171774 ?auto_171785 ) ) ( not ( = ?auto_171775 ?auto_171776 ) ) ( not ( = ?auto_171775 ?auto_171777 ) ) ( not ( = ?auto_171775 ?auto_171778 ) ) ( not ( = ?auto_171775 ?auto_171779 ) ) ( not ( = ?auto_171775 ?auto_171780 ) ) ( not ( = ?auto_171775 ?auto_171781 ) ) ( not ( = ?auto_171775 ?auto_171782 ) ) ( not ( = ?auto_171775 ?auto_171783 ) ) ( not ( = ?auto_171775 ?auto_171784 ) ) ( not ( = ?auto_171775 ?auto_171785 ) ) ( not ( = ?auto_171776 ?auto_171777 ) ) ( not ( = ?auto_171776 ?auto_171778 ) ) ( not ( = ?auto_171776 ?auto_171779 ) ) ( not ( = ?auto_171776 ?auto_171780 ) ) ( not ( = ?auto_171776 ?auto_171781 ) ) ( not ( = ?auto_171776 ?auto_171782 ) ) ( not ( = ?auto_171776 ?auto_171783 ) ) ( not ( = ?auto_171776 ?auto_171784 ) ) ( not ( = ?auto_171776 ?auto_171785 ) ) ( not ( = ?auto_171777 ?auto_171778 ) ) ( not ( = ?auto_171777 ?auto_171779 ) ) ( not ( = ?auto_171777 ?auto_171780 ) ) ( not ( = ?auto_171777 ?auto_171781 ) ) ( not ( = ?auto_171777 ?auto_171782 ) ) ( not ( = ?auto_171777 ?auto_171783 ) ) ( not ( = ?auto_171777 ?auto_171784 ) ) ( not ( = ?auto_171777 ?auto_171785 ) ) ( not ( = ?auto_171778 ?auto_171779 ) ) ( not ( = ?auto_171778 ?auto_171780 ) ) ( not ( = ?auto_171778 ?auto_171781 ) ) ( not ( = ?auto_171778 ?auto_171782 ) ) ( not ( = ?auto_171778 ?auto_171783 ) ) ( not ( = ?auto_171778 ?auto_171784 ) ) ( not ( = ?auto_171778 ?auto_171785 ) ) ( not ( = ?auto_171779 ?auto_171780 ) ) ( not ( = ?auto_171779 ?auto_171781 ) ) ( not ( = ?auto_171779 ?auto_171782 ) ) ( not ( = ?auto_171779 ?auto_171783 ) ) ( not ( = ?auto_171779 ?auto_171784 ) ) ( not ( = ?auto_171779 ?auto_171785 ) ) ( not ( = ?auto_171780 ?auto_171781 ) ) ( not ( = ?auto_171780 ?auto_171782 ) ) ( not ( = ?auto_171780 ?auto_171783 ) ) ( not ( = ?auto_171780 ?auto_171784 ) ) ( not ( = ?auto_171780 ?auto_171785 ) ) ( not ( = ?auto_171781 ?auto_171782 ) ) ( not ( = ?auto_171781 ?auto_171783 ) ) ( not ( = ?auto_171781 ?auto_171784 ) ) ( not ( = ?auto_171781 ?auto_171785 ) ) ( not ( = ?auto_171782 ?auto_171783 ) ) ( not ( = ?auto_171782 ?auto_171784 ) ) ( not ( = ?auto_171782 ?auto_171785 ) ) ( not ( = ?auto_171783 ?auto_171784 ) ) ( not ( = ?auto_171783 ?auto_171785 ) ) ( not ( = ?auto_171784 ?auto_171785 ) ) ( ON ?auto_171784 ?auto_171785 ) ( CLEAR ?auto_171782 ) ( ON ?auto_171783 ?auto_171784 ) ( CLEAR ?auto_171783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_171774 ?auto_171775 ?auto_171776 ?auto_171777 ?auto_171778 ?auto_171779 ?auto_171780 ?auto_171781 ?auto_171782 ?auto_171783 )
      ( MAKE-12PILE ?auto_171774 ?auto_171775 ?auto_171776 ?auto_171777 ?auto_171778 ?auto_171779 ?auto_171780 ?auto_171781 ?auto_171782 ?auto_171783 ?auto_171784 ?auto_171785 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_171798 - BLOCK
      ?auto_171799 - BLOCK
      ?auto_171800 - BLOCK
      ?auto_171801 - BLOCK
      ?auto_171802 - BLOCK
      ?auto_171803 - BLOCK
      ?auto_171804 - BLOCK
      ?auto_171805 - BLOCK
      ?auto_171806 - BLOCK
      ?auto_171807 - BLOCK
      ?auto_171808 - BLOCK
      ?auto_171809 - BLOCK
    )
    :vars
    (
      ?auto_171810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171809 ?auto_171810 ) ( ON-TABLE ?auto_171798 ) ( ON ?auto_171799 ?auto_171798 ) ( ON ?auto_171800 ?auto_171799 ) ( ON ?auto_171801 ?auto_171800 ) ( ON ?auto_171802 ?auto_171801 ) ( ON ?auto_171803 ?auto_171802 ) ( ON ?auto_171804 ?auto_171803 ) ( ON ?auto_171805 ?auto_171804 ) ( not ( = ?auto_171798 ?auto_171799 ) ) ( not ( = ?auto_171798 ?auto_171800 ) ) ( not ( = ?auto_171798 ?auto_171801 ) ) ( not ( = ?auto_171798 ?auto_171802 ) ) ( not ( = ?auto_171798 ?auto_171803 ) ) ( not ( = ?auto_171798 ?auto_171804 ) ) ( not ( = ?auto_171798 ?auto_171805 ) ) ( not ( = ?auto_171798 ?auto_171806 ) ) ( not ( = ?auto_171798 ?auto_171807 ) ) ( not ( = ?auto_171798 ?auto_171808 ) ) ( not ( = ?auto_171798 ?auto_171809 ) ) ( not ( = ?auto_171798 ?auto_171810 ) ) ( not ( = ?auto_171799 ?auto_171800 ) ) ( not ( = ?auto_171799 ?auto_171801 ) ) ( not ( = ?auto_171799 ?auto_171802 ) ) ( not ( = ?auto_171799 ?auto_171803 ) ) ( not ( = ?auto_171799 ?auto_171804 ) ) ( not ( = ?auto_171799 ?auto_171805 ) ) ( not ( = ?auto_171799 ?auto_171806 ) ) ( not ( = ?auto_171799 ?auto_171807 ) ) ( not ( = ?auto_171799 ?auto_171808 ) ) ( not ( = ?auto_171799 ?auto_171809 ) ) ( not ( = ?auto_171799 ?auto_171810 ) ) ( not ( = ?auto_171800 ?auto_171801 ) ) ( not ( = ?auto_171800 ?auto_171802 ) ) ( not ( = ?auto_171800 ?auto_171803 ) ) ( not ( = ?auto_171800 ?auto_171804 ) ) ( not ( = ?auto_171800 ?auto_171805 ) ) ( not ( = ?auto_171800 ?auto_171806 ) ) ( not ( = ?auto_171800 ?auto_171807 ) ) ( not ( = ?auto_171800 ?auto_171808 ) ) ( not ( = ?auto_171800 ?auto_171809 ) ) ( not ( = ?auto_171800 ?auto_171810 ) ) ( not ( = ?auto_171801 ?auto_171802 ) ) ( not ( = ?auto_171801 ?auto_171803 ) ) ( not ( = ?auto_171801 ?auto_171804 ) ) ( not ( = ?auto_171801 ?auto_171805 ) ) ( not ( = ?auto_171801 ?auto_171806 ) ) ( not ( = ?auto_171801 ?auto_171807 ) ) ( not ( = ?auto_171801 ?auto_171808 ) ) ( not ( = ?auto_171801 ?auto_171809 ) ) ( not ( = ?auto_171801 ?auto_171810 ) ) ( not ( = ?auto_171802 ?auto_171803 ) ) ( not ( = ?auto_171802 ?auto_171804 ) ) ( not ( = ?auto_171802 ?auto_171805 ) ) ( not ( = ?auto_171802 ?auto_171806 ) ) ( not ( = ?auto_171802 ?auto_171807 ) ) ( not ( = ?auto_171802 ?auto_171808 ) ) ( not ( = ?auto_171802 ?auto_171809 ) ) ( not ( = ?auto_171802 ?auto_171810 ) ) ( not ( = ?auto_171803 ?auto_171804 ) ) ( not ( = ?auto_171803 ?auto_171805 ) ) ( not ( = ?auto_171803 ?auto_171806 ) ) ( not ( = ?auto_171803 ?auto_171807 ) ) ( not ( = ?auto_171803 ?auto_171808 ) ) ( not ( = ?auto_171803 ?auto_171809 ) ) ( not ( = ?auto_171803 ?auto_171810 ) ) ( not ( = ?auto_171804 ?auto_171805 ) ) ( not ( = ?auto_171804 ?auto_171806 ) ) ( not ( = ?auto_171804 ?auto_171807 ) ) ( not ( = ?auto_171804 ?auto_171808 ) ) ( not ( = ?auto_171804 ?auto_171809 ) ) ( not ( = ?auto_171804 ?auto_171810 ) ) ( not ( = ?auto_171805 ?auto_171806 ) ) ( not ( = ?auto_171805 ?auto_171807 ) ) ( not ( = ?auto_171805 ?auto_171808 ) ) ( not ( = ?auto_171805 ?auto_171809 ) ) ( not ( = ?auto_171805 ?auto_171810 ) ) ( not ( = ?auto_171806 ?auto_171807 ) ) ( not ( = ?auto_171806 ?auto_171808 ) ) ( not ( = ?auto_171806 ?auto_171809 ) ) ( not ( = ?auto_171806 ?auto_171810 ) ) ( not ( = ?auto_171807 ?auto_171808 ) ) ( not ( = ?auto_171807 ?auto_171809 ) ) ( not ( = ?auto_171807 ?auto_171810 ) ) ( not ( = ?auto_171808 ?auto_171809 ) ) ( not ( = ?auto_171808 ?auto_171810 ) ) ( not ( = ?auto_171809 ?auto_171810 ) ) ( ON ?auto_171808 ?auto_171809 ) ( ON ?auto_171807 ?auto_171808 ) ( CLEAR ?auto_171805 ) ( ON ?auto_171806 ?auto_171807 ) ( CLEAR ?auto_171806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_171798 ?auto_171799 ?auto_171800 ?auto_171801 ?auto_171802 ?auto_171803 ?auto_171804 ?auto_171805 ?auto_171806 )
      ( MAKE-12PILE ?auto_171798 ?auto_171799 ?auto_171800 ?auto_171801 ?auto_171802 ?auto_171803 ?auto_171804 ?auto_171805 ?auto_171806 ?auto_171807 ?auto_171808 ?auto_171809 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_171823 - BLOCK
      ?auto_171824 - BLOCK
      ?auto_171825 - BLOCK
      ?auto_171826 - BLOCK
      ?auto_171827 - BLOCK
      ?auto_171828 - BLOCK
      ?auto_171829 - BLOCK
      ?auto_171830 - BLOCK
      ?auto_171831 - BLOCK
      ?auto_171832 - BLOCK
      ?auto_171833 - BLOCK
      ?auto_171834 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171834 ) ( ON-TABLE ?auto_171823 ) ( ON ?auto_171824 ?auto_171823 ) ( ON ?auto_171825 ?auto_171824 ) ( ON ?auto_171826 ?auto_171825 ) ( ON ?auto_171827 ?auto_171826 ) ( ON ?auto_171828 ?auto_171827 ) ( ON ?auto_171829 ?auto_171828 ) ( ON ?auto_171830 ?auto_171829 ) ( not ( = ?auto_171823 ?auto_171824 ) ) ( not ( = ?auto_171823 ?auto_171825 ) ) ( not ( = ?auto_171823 ?auto_171826 ) ) ( not ( = ?auto_171823 ?auto_171827 ) ) ( not ( = ?auto_171823 ?auto_171828 ) ) ( not ( = ?auto_171823 ?auto_171829 ) ) ( not ( = ?auto_171823 ?auto_171830 ) ) ( not ( = ?auto_171823 ?auto_171831 ) ) ( not ( = ?auto_171823 ?auto_171832 ) ) ( not ( = ?auto_171823 ?auto_171833 ) ) ( not ( = ?auto_171823 ?auto_171834 ) ) ( not ( = ?auto_171824 ?auto_171825 ) ) ( not ( = ?auto_171824 ?auto_171826 ) ) ( not ( = ?auto_171824 ?auto_171827 ) ) ( not ( = ?auto_171824 ?auto_171828 ) ) ( not ( = ?auto_171824 ?auto_171829 ) ) ( not ( = ?auto_171824 ?auto_171830 ) ) ( not ( = ?auto_171824 ?auto_171831 ) ) ( not ( = ?auto_171824 ?auto_171832 ) ) ( not ( = ?auto_171824 ?auto_171833 ) ) ( not ( = ?auto_171824 ?auto_171834 ) ) ( not ( = ?auto_171825 ?auto_171826 ) ) ( not ( = ?auto_171825 ?auto_171827 ) ) ( not ( = ?auto_171825 ?auto_171828 ) ) ( not ( = ?auto_171825 ?auto_171829 ) ) ( not ( = ?auto_171825 ?auto_171830 ) ) ( not ( = ?auto_171825 ?auto_171831 ) ) ( not ( = ?auto_171825 ?auto_171832 ) ) ( not ( = ?auto_171825 ?auto_171833 ) ) ( not ( = ?auto_171825 ?auto_171834 ) ) ( not ( = ?auto_171826 ?auto_171827 ) ) ( not ( = ?auto_171826 ?auto_171828 ) ) ( not ( = ?auto_171826 ?auto_171829 ) ) ( not ( = ?auto_171826 ?auto_171830 ) ) ( not ( = ?auto_171826 ?auto_171831 ) ) ( not ( = ?auto_171826 ?auto_171832 ) ) ( not ( = ?auto_171826 ?auto_171833 ) ) ( not ( = ?auto_171826 ?auto_171834 ) ) ( not ( = ?auto_171827 ?auto_171828 ) ) ( not ( = ?auto_171827 ?auto_171829 ) ) ( not ( = ?auto_171827 ?auto_171830 ) ) ( not ( = ?auto_171827 ?auto_171831 ) ) ( not ( = ?auto_171827 ?auto_171832 ) ) ( not ( = ?auto_171827 ?auto_171833 ) ) ( not ( = ?auto_171827 ?auto_171834 ) ) ( not ( = ?auto_171828 ?auto_171829 ) ) ( not ( = ?auto_171828 ?auto_171830 ) ) ( not ( = ?auto_171828 ?auto_171831 ) ) ( not ( = ?auto_171828 ?auto_171832 ) ) ( not ( = ?auto_171828 ?auto_171833 ) ) ( not ( = ?auto_171828 ?auto_171834 ) ) ( not ( = ?auto_171829 ?auto_171830 ) ) ( not ( = ?auto_171829 ?auto_171831 ) ) ( not ( = ?auto_171829 ?auto_171832 ) ) ( not ( = ?auto_171829 ?auto_171833 ) ) ( not ( = ?auto_171829 ?auto_171834 ) ) ( not ( = ?auto_171830 ?auto_171831 ) ) ( not ( = ?auto_171830 ?auto_171832 ) ) ( not ( = ?auto_171830 ?auto_171833 ) ) ( not ( = ?auto_171830 ?auto_171834 ) ) ( not ( = ?auto_171831 ?auto_171832 ) ) ( not ( = ?auto_171831 ?auto_171833 ) ) ( not ( = ?auto_171831 ?auto_171834 ) ) ( not ( = ?auto_171832 ?auto_171833 ) ) ( not ( = ?auto_171832 ?auto_171834 ) ) ( not ( = ?auto_171833 ?auto_171834 ) ) ( ON ?auto_171833 ?auto_171834 ) ( ON ?auto_171832 ?auto_171833 ) ( CLEAR ?auto_171830 ) ( ON ?auto_171831 ?auto_171832 ) ( CLEAR ?auto_171831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_171823 ?auto_171824 ?auto_171825 ?auto_171826 ?auto_171827 ?auto_171828 ?auto_171829 ?auto_171830 ?auto_171831 )
      ( MAKE-12PILE ?auto_171823 ?auto_171824 ?auto_171825 ?auto_171826 ?auto_171827 ?auto_171828 ?auto_171829 ?auto_171830 ?auto_171831 ?auto_171832 ?auto_171833 ?auto_171834 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_171847 - BLOCK
      ?auto_171848 - BLOCK
      ?auto_171849 - BLOCK
      ?auto_171850 - BLOCK
      ?auto_171851 - BLOCK
      ?auto_171852 - BLOCK
      ?auto_171853 - BLOCK
      ?auto_171854 - BLOCK
      ?auto_171855 - BLOCK
      ?auto_171856 - BLOCK
      ?auto_171857 - BLOCK
      ?auto_171858 - BLOCK
    )
    :vars
    (
      ?auto_171859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171858 ?auto_171859 ) ( ON-TABLE ?auto_171847 ) ( ON ?auto_171848 ?auto_171847 ) ( ON ?auto_171849 ?auto_171848 ) ( ON ?auto_171850 ?auto_171849 ) ( ON ?auto_171851 ?auto_171850 ) ( ON ?auto_171852 ?auto_171851 ) ( ON ?auto_171853 ?auto_171852 ) ( not ( = ?auto_171847 ?auto_171848 ) ) ( not ( = ?auto_171847 ?auto_171849 ) ) ( not ( = ?auto_171847 ?auto_171850 ) ) ( not ( = ?auto_171847 ?auto_171851 ) ) ( not ( = ?auto_171847 ?auto_171852 ) ) ( not ( = ?auto_171847 ?auto_171853 ) ) ( not ( = ?auto_171847 ?auto_171854 ) ) ( not ( = ?auto_171847 ?auto_171855 ) ) ( not ( = ?auto_171847 ?auto_171856 ) ) ( not ( = ?auto_171847 ?auto_171857 ) ) ( not ( = ?auto_171847 ?auto_171858 ) ) ( not ( = ?auto_171847 ?auto_171859 ) ) ( not ( = ?auto_171848 ?auto_171849 ) ) ( not ( = ?auto_171848 ?auto_171850 ) ) ( not ( = ?auto_171848 ?auto_171851 ) ) ( not ( = ?auto_171848 ?auto_171852 ) ) ( not ( = ?auto_171848 ?auto_171853 ) ) ( not ( = ?auto_171848 ?auto_171854 ) ) ( not ( = ?auto_171848 ?auto_171855 ) ) ( not ( = ?auto_171848 ?auto_171856 ) ) ( not ( = ?auto_171848 ?auto_171857 ) ) ( not ( = ?auto_171848 ?auto_171858 ) ) ( not ( = ?auto_171848 ?auto_171859 ) ) ( not ( = ?auto_171849 ?auto_171850 ) ) ( not ( = ?auto_171849 ?auto_171851 ) ) ( not ( = ?auto_171849 ?auto_171852 ) ) ( not ( = ?auto_171849 ?auto_171853 ) ) ( not ( = ?auto_171849 ?auto_171854 ) ) ( not ( = ?auto_171849 ?auto_171855 ) ) ( not ( = ?auto_171849 ?auto_171856 ) ) ( not ( = ?auto_171849 ?auto_171857 ) ) ( not ( = ?auto_171849 ?auto_171858 ) ) ( not ( = ?auto_171849 ?auto_171859 ) ) ( not ( = ?auto_171850 ?auto_171851 ) ) ( not ( = ?auto_171850 ?auto_171852 ) ) ( not ( = ?auto_171850 ?auto_171853 ) ) ( not ( = ?auto_171850 ?auto_171854 ) ) ( not ( = ?auto_171850 ?auto_171855 ) ) ( not ( = ?auto_171850 ?auto_171856 ) ) ( not ( = ?auto_171850 ?auto_171857 ) ) ( not ( = ?auto_171850 ?auto_171858 ) ) ( not ( = ?auto_171850 ?auto_171859 ) ) ( not ( = ?auto_171851 ?auto_171852 ) ) ( not ( = ?auto_171851 ?auto_171853 ) ) ( not ( = ?auto_171851 ?auto_171854 ) ) ( not ( = ?auto_171851 ?auto_171855 ) ) ( not ( = ?auto_171851 ?auto_171856 ) ) ( not ( = ?auto_171851 ?auto_171857 ) ) ( not ( = ?auto_171851 ?auto_171858 ) ) ( not ( = ?auto_171851 ?auto_171859 ) ) ( not ( = ?auto_171852 ?auto_171853 ) ) ( not ( = ?auto_171852 ?auto_171854 ) ) ( not ( = ?auto_171852 ?auto_171855 ) ) ( not ( = ?auto_171852 ?auto_171856 ) ) ( not ( = ?auto_171852 ?auto_171857 ) ) ( not ( = ?auto_171852 ?auto_171858 ) ) ( not ( = ?auto_171852 ?auto_171859 ) ) ( not ( = ?auto_171853 ?auto_171854 ) ) ( not ( = ?auto_171853 ?auto_171855 ) ) ( not ( = ?auto_171853 ?auto_171856 ) ) ( not ( = ?auto_171853 ?auto_171857 ) ) ( not ( = ?auto_171853 ?auto_171858 ) ) ( not ( = ?auto_171853 ?auto_171859 ) ) ( not ( = ?auto_171854 ?auto_171855 ) ) ( not ( = ?auto_171854 ?auto_171856 ) ) ( not ( = ?auto_171854 ?auto_171857 ) ) ( not ( = ?auto_171854 ?auto_171858 ) ) ( not ( = ?auto_171854 ?auto_171859 ) ) ( not ( = ?auto_171855 ?auto_171856 ) ) ( not ( = ?auto_171855 ?auto_171857 ) ) ( not ( = ?auto_171855 ?auto_171858 ) ) ( not ( = ?auto_171855 ?auto_171859 ) ) ( not ( = ?auto_171856 ?auto_171857 ) ) ( not ( = ?auto_171856 ?auto_171858 ) ) ( not ( = ?auto_171856 ?auto_171859 ) ) ( not ( = ?auto_171857 ?auto_171858 ) ) ( not ( = ?auto_171857 ?auto_171859 ) ) ( not ( = ?auto_171858 ?auto_171859 ) ) ( ON ?auto_171857 ?auto_171858 ) ( ON ?auto_171856 ?auto_171857 ) ( ON ?auto_171855 ?auto_171856 ) ( CLEAR ?auto_171853 ) ( ON ?auto_171854 ?auto_171855 ) ( CLEAR ?auto_171854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_171847 ?auto_171848 ?auto_171849 ?auto_171850 ?auto_171851 ?auto_171852 ?auto_171853 ?auto_171854 )
      ( MAKE-12PILE ?auto_171847 ?auto_171848 ?auto_171849 ?auto_171850 ?auto_171851 ?auto_171852 ?auto_171853 ?auto_171854 ?auto_171855 ?auto_171856 ?auto_171857 ?auto_171858 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_171872 - BLOCK
      ?auto_171873 - BLOCK
      ?auto_171874 - BLOCK
      ?auto_171875 - BLOCK
      ?auto_171876 - BLOCK
      ?auto_171877 - BLOCK
      ?auto_171878 - BLOCK
      ?auto_171879 - BLOCK
      ?auto_171880 - BLOCK
      ?auto_171881 - BLOCK
      ?auto_171882 - BLOCK
      ?auto_171883 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171883 ) ( ON-TABLE ?auto_171872 ) ( ON ?auto_171873 ?auto_171872 ) ( ON ?auto_171874 ?auto_171873 ) ( ON ?auto_171875 ?auto_171874 ) ( ON ?auto_171876 ?auto_171875 ) ( ON ?auto_171877 ?auto_171876 ) ( ON ?auto_171878 ?auto_171877 ) ( not ( = ?auto_171872 ?auto_171873 ) ) ( not ( = ?auto_171872 ?auto_171874 ) ) ( not ( = ?auto_171872 ?auto_171875 ) ) ( not ( = ?auto_171872 ?auto_171876 ) ) ( not ( = ?auto_171872 ?auto_171877 ) ) ( not ( = ?auto_171872 ?auto_171878 ) ) ( not ( = ?auto_171872 ?auto_171879 ) ) ( not ( = ?auto_171872 ?auto_171880 ) ) ( not ( = ?auto_171872 ?auto_171881 ) ) ( not ( = ?auto_171872 ?auto_171882 ) ) ( not ( = ?auto_171872 ?auto_171883 ) ) ( not ( = ?auto_171873 ?auto_171874 ) ) ( not ( = ?auto_171873 ?auto_171875 ) ) ( not ( = ?auto_171873 ?auto_171876 ) ) ( not ( = ?auto_171873 ?auto_171877 ) ) ( not ( = ?auto_171873 ?auto_171878 ) ) ( not ( = ?auto_171873 ?auto_171879 ) ) ( not ( = ?auto_171873 ?auto_171880 ) ) ( not ( = ?auto_171873 ?auto_171881 ) ) ( not ( = ?auto_171873 ?auto_171882 ) ) ( not ( = ?auto_171873 ?auto_171883 ) ) ( not ( = ?auto_171874 ?auto_171875 ) ) ( not ( = ?auto_171874 ?auto_171876 ) ) ( not ( = ?auto_171874 ?auto_171877 ) ) ( not ( = ?auto_171874 ?auto_171878 ) ) ( not ( = ?auto_171874 ?auto_171879 ) ) ( not ( = ?auto_171874 ?auto_171880 ) ) ( not ( = ?auto_171874 ?auto_171881 ) ) ( not ( = ?auto_171874 ?auto_171882 ) ) ( not ( = ?auto_171874 ?auto_171883 ) ) ( not ( = ?auto_171875 ?auto_171876 ) ) ( not ( = ?auto_171875 ?auto_171877 ) ) ( not ( = ?auto_171875 ?auto_171878 ) ) ( not ( = ?auto_171875 ?auto_171879 ) ) ( not ( = ?auto_171875 ?auto_171880 ) ) ( not ( = ?auto_171875 ?auto_171881 ) ) ( not ( = ?auto_171875 ?auto_171882 ) ) ( not ( = ?auto_171875 ?auto_171883 ) ) ( not ( = ?auto_171876 ?auto_171877 ) ) ( not ( = ?auto_171876 ?auto_171878 ) ) ( not ( = ?auto_171876 ?auto_171879 ) ) ( not ( = ?auto_171876 ?auto_171880 ) ) ( not ( = ?auto_171876 ?auto_171881 ) ) ( not ( = ?auto_171876 ?auto_171882 ) ) ( not ( = ?auto_171876 ?auto_171883 ) ) ( not ( = ?auto_171877 ?auto_171878 ) ) ( not ( = ?auto_171877 ?auto_171879 ) ) ( not ( = ?auto_171877 ?auto_171880 ) ) ( not ( = ?auto_171877 ?auto_171881 ) ) ( not ( = ?auto_171877 ?auto_171882 ) ) ( not ( = ?auto_171877 ?auto_171883 ) ) ( not ( = ?auto_171878 ?auto_171879 ) ) ( not ( = ?auto_171878 ?auto_171880 ) ) ( not ( = ?auto_171878 ?auto_171881 ) ) ( not ( = ?auto_171878 ?auto_171882 ) ) ( not ( = ?auto_171878 ?auto_171883 ) ) ( not ( = ?auto_171879 ?auto_171880 ) ) ( not ( = ?auto_171879 ?auto_171881 ) ) ( not ( = ?auto_171879 ?auto_171882 ) ) ( not ( = ?auto_171879 ?auto_171883 ) ) ( not ( = ?auto_171880 ?auto_171881 ) ) ( not ( = ?auto_171880 ?auto_171882 ) ) ( not ( = ?auto_171880 ?auto_171883 ) ) ( not ( = ?auto_171881 ?auto_171882 ) ) ( not ( = ?auto_171881 ?auto_171883 ) ) ( not ( = ?auto_171882 ?auto_171883 ) ) ( ON ?auto_171882 ?auto_171883 ) ( ON ?auto_171881 ?auto_171882 ) ( ON ?auto_171880 ?auto_171881 ) ( CLEAR ?auto_171878 ) ( ON ?auto_171879 ?auto_171880 ) ( CLEAR ?auto_171879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_171872 ?auto_171873 ?auto_171874 ?auto_171875 ?auto_171876 ?auto_171877 ?auto_171878 ?auto_171879 )
      ( MAKE-12PILE ?auto_171872 ?auto_171873 ?auto_171874 ?auto_171875 ?auto_171876 ?auto_171877 ?auto_171878 ?auto_171879 ?auto_171880 ?auto_171881 ?auto_171882 ?auto_171883 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_171896 - BLOCK
      ?auto_171897 - BLOCK
      ?auto_171898 - BLOCK
      ?auto_171899 - BLOCK
      ?auto_171900 - BLOCK
      ?auto_171901 - BLOCK
      ?auto_171902 - BLOCK
      ?auto_171903 - BLOCK
      ?auto_171904 - BLOCK
      ?auto_171905 - BLOCK
      ?auto_171906 - BLOCK
      ?auto_171907 - BLOCK
    )
    :vars
    (
      ?auto_171908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171907 ?auto_171908 ) ( ON-TABLE ?auto_171896 ) ( ON ?auto_171897 ?auto_171896 ) ( ON ?auto_171898 ?auto_171897 ) ( ON ?auto_171899 ?auto_171898 ) ( ON ?auto_171900 ?auto_171899 ) ( ON ?auto_171901 ?auto_171900 ) ( not ( = ?auto_171896 ?auto_171897 ) ) ( not ( = ?auto_171896 ?auto_171898 ) ) ( not ( = ?auto_171896 ?auto_171899 ) ) ( not ( = ?auto_171896 ?auto_171900 ) ) ( not ( = ?auto_171896 ?auto_171901 ) ) ( not ( = ?auto_171896 ?auto_171902 ) ) ( not ( = ?auto_171896 ?auto_171903 ) ) ( not ( = ?auto_171896 ?auto_171904 ) ) ( not ( = ?auto_171896 ?auto_171905 ) ) ( not ( = ?auto_171896 ?auto_171906 ) ) ( not ( = ?auto_171896 ?auto_171907 ) ) ( not ( = ?auto_171896 ?auto_171908 ) ) ( not ( = ?auto_171897 ?auto_171898 ) ) ( not ( = ?auto_171897 ?auto_171899 ) ) ( not ( = ?auto_171897 ?auto_171900 ) ) ( not ( = ?auto_171897 ?auto_171901 ) ) ( not ( = ?auto_171897 ?auto_171902 ) ) ( not ( = ?auto_171897 ?auto_171903 ) ) ( not ( = ?auto_171897 ?auto_171904 ) ) ( not ( = ?auto_171897 ?auto_171905 ) ) ( not ( = ?auto_171897 ?auto_171906 ) ) ( not ( = ?auto_171897 ?auto_171907 ) ) ( not ( = ?auto_171897 ?auto_171908 ) ) ( not ( = ?auto_171898 ?auto_171899 ) ) ( not ( = ?auto_171898 ?auto_171900 ) ) ( not ( = ?auto_171898 ?auto_171901 ) ) ( not ( = ?auto_171898 ?auto_171902 ) ) ( not ( = ?auto_171898 ?auto_171903 ) ) ( not ( = ?auto_171898 ?auto_171904 ) ) ( not ( = ?auto_171898 ?auto_171905 ) ) ( not ( = ?auto_171898 ?auto_171906 ) ) ( not ( = ?auto_171898 ?auto_171907 ) ) ( not ( = ?auto_171898 ?auto_171908 ) ) ( not ( = ?auto_171899 ?auto_171900 ) ) ( not ( = ?auto_171899 ?auto_171901 ) ) ( not ( = ?auto_171899 ?auto_171902 ) ) ( not ( = ?auto_171899 ?auto_171903 ) ) ( not ( = ?auto_171899 ?auto_171904 ) ) ( not ( = ?auto_171899 ?auto_171905 ) ) ( not ( = ?auto_171899 ?auto_171906 ) ) ( not ( = ?auto_171899 ?auto_171907 ) ) ( not ( = ?auto_171899 ?auto_171908 ) ) ( not ( = ?auto_171900 ?auto_171901 ) ) ( not ( = ?auto_171900 ?auto_171902 ) ) ( not ( = ?auto_171900 ?auto_171903 ) ) ( not ( = ?auto_171900 ?auto_171904 ) ) ( not ( = ?auto_171900 ?auto_171905 ) ) ( not ( = ?auto_171900 ?auto_171906 ) ) ( not ( = ?auto_171900 ?auto_171907 ) ) ( not ( = ?auto_171900 ?auto_171908 ) ) ( not ( = ?auto_171901 ?auto_171902 ) ) ( not ( = ?auto_171901 ?auto_171903 ) ) ( not ( = ?auto_171901 ?auto_171904 ) ) ( not ( = ?auto_171901 ?auto_171905 ) ) ( not ( = ?auto_171901 ?auto_171906 ) ) ( not ( = ?auto_171901 ?auto_171907 ) ) ( not ( = ?auto_171901 ?auto_171908 ) ) ( not ( = ?auto_171902 ?auto_171903 ) ) ( not ( = ?auto_171902 ?auto_171904 ) ) ( not ( = ?auto_171902 ?auto_171905 ) ) ( not ( = ?auto_171902 ?auto_171906 ) ) ( not ( = ?auto_171902 ?auto_171907 ) ) ( not ( = ?auto_171902 ?auto_171908 ) ) ( not ( = ?auto_171903 ?auto_171904 ) ) ( not ( = ?auto_171903 ?auto_171905 ) ) ( not ( = ?auto_171903 ?auto_171906 ) ) ( not ( = ?auto_171903 ?auto_171907 ) ) ( not ( = ?auto_171903 ?auto_171908 ) ) ( not ( = ?auto_171904 ?auto_171905 ) ) ( not ( = ?auto_171904 ?auto_171906 ) ) ( not ( = ?auto_171904 ?auto_171907 ) ) ( not ( = ?auto_171904 ?auto_171908 ) ) ( not ( = ?auto_171905 ?auto_171906 ) ) ( not ( = ?auto_171905 ?auto_171907 ) ) ( not ( = ?auto_171905 ?auto_171908 ) ) ( not ( = ?auto_171906 ?auto_171907 ) ) ( not ( = ?auto_171906 ?auto_171908 ) ) ( not ( = ?auto_171907 ?auto_171908 ) ) ( ON ?auto_171906 ?auto_171907 ) ( ON ?auto_171905 ?auto_171906 ) ( ON ?auto_171904 ?auto_171905 ) ( ON ?auto_171903 ?auto_171904 ) ( CLEAR ?auto_171901 ) ( ON ?auto_171902 ?auto_171903 ) ( CLEAR ?auto_171902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_171896 ?auto_171897 ?auto_171898 ?auto_171899 ?auto_171900 ?auto_171901 ?auto_171902 )
      ( MAKE-12PILE ?auto_171896 ?auto_171897 ?auto_171898 ?auto_171899 ?auto_171900 ?auto_171901 ?auto_171902 ?auto_171903 ?auto_171904 ?auto_171905 ?auto_171906 ?auto_171907 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_171921 - BLOCK
      ?auto_171922 - BLOCK
      ?auto_171923 - BLOCK
      ?auto_171924 - BLOCK
      ?auto_171925 - BLOCK
      ?auto_171926 - BLOCK
      ?auto_171927 - BLOCK
      ?auto_171928 - BLOCK
      ?auto_171929 - BLOCK
      ?auto_171930 - BLOCK
      ?auto_171931 - BLOCK
      ?auto_171932 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171932 ) ( ON-TABLE ?auto_171921 ) ( ON ?auto_171922 ?auto_171921 ) ( ON ?auto_171923 ?auto_171922 ) ( ON ?auto_171924 ?auto_171923 ) ( ON ?auto_171925 ?auto_171924 ) ( ON ?auto_171926 ?auto_171925 ) ( not ( = ?auto_171921 ?auto_171922 ) ) ( not ( = ?auto_171921 ?auto_171923 ) ) ( not ( = ?auto_171921 ?auto_171924 ) ) ( not ( = ?auto_171921 ?auto_171925 ) ) ( not ( = ?auto_171921 ?auto_171926 ) ) ( not ( = ?auto_171921 ?auto_171927 ) ) ( not ( = ?auto_171921 ?auto_171928 ) ) ( not ( = ?auto_171921 ?auto_171929 ) ) ( not ( = ?auto_171921 ?auto_171930 ) ) ( not ( = ?auto_171921 ?auto_171931 ) ) ( not ( = ?auto_171921 ?auto_171932 ) ) ( not ( = ?auto_171922 ?auto_171923 ) ) ( not ( = ?auto_171922 ?auto_171924 ) ) ( not ( = ?auto_171922 ?auto_171925 ) ) ( not ( = ?auto_171922 ?auto_171926 ) ) ( not ( = ?auto_171922 ?auto_171927 ) ) ( not ( = ?auto_171922 ?auto_171928 ) ) ( not ( = ?auto_171922 ?auto_171929 ) ) ( not ( = ?auto_171922 ?auto_171930 ) ) ( not ( = ?auto_171922 ?auto_171931 ) ) ( not ( = ?auto_171922 ?auto_171932 ) ) ( not ( = ?auto_171923 ?auto_171924 ) ) ( not ( = ?auto_171923 ?auto_171925 ) ) ( not ( = ?auto_171923 ?auto_171926 ) ) ( not ( = ?auto_171923 ?auto_171927 ) ) ( not ( = ?auto_171923 ?auto_171928 ) ) ( not ( = ?auto_171923 ?auto_171929 ) ) ( not ( = ?auto_171923 ?auto_171930 ) ) ( not ( = ?auto_171923 ?auto_171931 ) ) ( not ( = ?auto_171923 ?auto_171932 ) ) ( not ( = ?auto_171924 ?auto_171925 ) ) ( not ( = ?auto_171924 ?auto_171926 ) ) ( not ( = ?auto_171924 ?auto_171927 ) ) ( not ( = ?auto_171924 ?auto_171928 ) ) ( not ( = ?auto_171924 ?auto_171929 ) ) ( not ( = ?auto_171924 ?auto_171930 ) ) ( not ( = ?auto_171924 ?auto_171931 ) ) ( not ( = ?auto_171924 ?auto_171932 ) ) ( not ( = ?auto_171925 ?auto_171926 ) ) ( not ( = ?auto_171925 ?auto_171927 ) ) ( not ( = ?auto_171925 ?auto_171928 ) ) ( not ( = ?auto_171925 ?auto_171929 ) ) ( not ( = ?auto_171925 ?auto_171930 ) ) ( not ( = ?auto_171925 ?auto_171931 ) ) ( not ( = ?auto_171925 ?auto_171932 ) ) ( not ( = ?auto_171926 ?auto_171927 ) ) ( not ( = ?auto_171926 ?auto_171928 ) ) ( not ( = ?auto_171926 ?auto_171929 ) ) ( not ( = ?auto_171926 ?auto_171930 ) ) ( not ( = ?auto_171926 ?auto_171931 ) ) ( not ( = ?auto_171926 ?auto_171932 ) ) ( not ( = ?auto_171927 ?auto_171928 ) ) ( not ( = ?auto_171927 ?auto_171929 ) ) ( not ( = ?auto_171927 ?auto_171930 ) ) ( not ( = ?auto_171927 ?auto_171931 ) ) ( not ( = ?auto_171927 ?auto_171932 ) ) ( not ( = ?auto_171928 ?auto_171929 ) ) ( not ( = ?auto_171928 ?auto_171930 ) ) ( not ( = ?auto_171928 ?auto_171931 ) ) ( not ( = ?auto_171928 ?auto_171932 ) ) ( not ( = ?auto_171929 ?auto_171930 ) ) ( not ( = ?auto_171929 ?auto_171931 ) ) ( not ( = ?auto_171929 ?auto_171932 ) ) ( not ( = ?auto_171930 ?auto_171931 ) ) ( not ( = ?auto_171930 ?auto_171932 ) ) ( not ( = ?auto_171931 ?auto_171932 ) ) ( ON ?auto_171931 ?auto_171932 ) ( ON ?auto_171930 ?auto_171931 ) ( ON ?auto_171929 ?auto_171930 ) ( ON ?auto_171928 ?auto_171929 ) ( CLEAR ?auto_171926 ) ( ON ?auto_171927 ?auto_171928 ) ( CLEAR ?auto_171927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_171921 ?auto_171922 ?auto_171923 ?auto_171924 ?auto_171925 ?auto_171926 ?auto_171927 )
      ( MAKE-12PILE ?auto_171921 ?auto_171922 ?auto_171923 ?auto_171924 ?auto_171925 ?auto_171926 ?auto_171927 ?auto_171928 ?auto_171929 ?auto_171930 ?auto_171931 ?auto_171932 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_171945 - BLOCK
      ?auto_171946 - BLOCK
      ?auto_171947 - BLOCK
      ?auto_171948 - BLOCK
      ?auto_171949 - BLOCK
      ?auto_171950 - BLOCK
      ?auto_171951 - BLOCK
      ?auto_171952 - BLOCK
      ?auto_171953 - BLOCK
      ?auto_171954 - BLOCK
      ?auto_171955 - BLOCK
      ?auto_171956 - BLOCK
    )
    :vars
    (
      ?auto_171957 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171956 ?auto_171957 ) ( ON-TABLE ?auto_171945 ) ( ON ?auto_171946 ?auto_171945 ) ( ON ?auto_171947 ?auto_171946 ) ( ON ?auto_171948 ?auto_171947 ) ( ON ?auto_171949 ?auto_171948 ) ( not ( = ?auto_171945 ?auto_171946 ) ) ( not ( = ?auto_171945 ?auto_171947 ) ) ( not ( = ?auto_171945 ?auto_171948 ) ) ( not ( = ?auto_171945 ?auto_171949 ) ) ( not ( = ?auto_171945 ?auto_171950 ) ) ( not ( = ?auto_171945 ?auto_171951 ) ) ( not ( = ?auto_171945 ?auto_171952 ) ) ( not ( = ?auto_171945 ?auto_171953 ) ) ( not ( = ?auto_171945 ?auto_171954 ) ) ( not ( = ?auto_171945 ?auto_171955 ) ) ( not ( = ?auto_171945 ?auto_171956 ) ) ( not ( = ?auto_171945 ?auto_171957 ) ) ( not ( = ?auto_171946 ?auto_171947 ) ) ( not ( = ?auto_171946 ?auto_171948 ) ) ( not ( = ?auto_171946 ?auto_171949 ) ) ( not ( = ?auto_171946 ?auto_171950 ) ) ( not ( = ?auto_171946 ?auto_171951 ) ) ( not ( = ?auto_171946 ?auto_171952 ) ) ( not ( = ?auto_171946 ?auto_171953 ) ) ( not ( = ?auto_171946 ?auto_171954 ) ) ( not ( = ?auto_171946 ?auto_171955 ) ) ( not ( = ?auto_171946 ?auto_171956 ) ) ( not ( = ?auto_171946 ?auto_171957 ) ) ( not ( = ?auto_171947 ?auto_171948 ) ) ( not ( = ?auto_171947 ?auto_171949 ) ) ( not ( = ?auto_171947 ?auto_171950 ) ) ( not ( = ?auto_171947 ?auto_171951 ) ) ( not ( = ?auto_171947 ?auto_171952 ) ) ( not ( = ?auto_171947 ?auto_171953 ) ) ( not ( = ?auto_171947 ?auto_171954 ) ) ( not ( = ?auto_171947 ?auto_171955 ) ) ( not ( = ?auto_171947 ?auto_171956 ) ) ( not ( = ?auto_171947 ?auto_171957 ) ) ( not ( = ?auto_171948 ?auto_171949 ) ) ( not ( = ?auto_171948 ?auto_171950 ) ) ( not ( = ?auto_171948 ?auto_171951 ) ) ( not ( = ?auto_171948 ?auto_171952 ) ) ( not ( = ?auto_171948 ?auto_171953 ) ) ( not ( = ?auto_171948 ?auto_171954 ) ) ( not ( = ?auto_171948 ?auto_171955 ) ) ( not ( = ?auto_171948 ?auto_171956 ) ) ( not ( = ?auto_171948 ?auto_171957 ) ) ( not ( = ?auto_171949 ?auto_171950 ) ) ( not ( = ?auto_171949 ?auto_171951 ) ) ( not ( = ?auto_171949 ?auto_171952 ) ) ( not ( = ?auto_171949 ?auto_171953 ) ) ( not ( = ?auto_171949 ?auto_171954 ) ) ( not ( = ?auto_171949 ?auto_171955 ) ) ( not ( = ?auto_171949 ?auto_171956 ) ) ( not ( = ?auto_171949 ?auto_171957 ) ) ( not ( = ?auto_171950 ?auto_171951 ) ) ( not ( = ?auto_171950 ?auto_171952 ) ) ( not ( = ?auto_171950 ?auto_171953 ) ) ( not ( = ?auto_171950 ?auto_171954 ) ) ( not ( = ?auto_171950 ?auto_171955 ) ) ( not ( = ?auto_171950 ?auto_171956 ) ) ( not ( = ?auto_171950 ?auto_171957 ) ) ( not ( = ?auto_171951 ?auto_171952 ) ) ( not ( = ?auto_171951 ?auto_171953 ) ) ( not ( = ?auto_171951 ?auto_171954 ) ) ( not ( = ?auto_171951 ?auto_171955 ) ) ( not ( = ?auto_171951 ?auto_171956 ) ) ( not ( = ?auto_171951 ?auto_171957 ) ) ( not ( = ?auto_171952 ?auto_171953 ) ) ( not ( = ?auto_171952 ?auto_171954 ) ) ( not ( = ?auto_171952 ?auto_171955 ) ) ( not ( = ?auto_171952 ?auto_171956 ) ) ( not ( = ?auto_171952 ?auto_171957 ) ) ( not ( = ?auto_171953 ?auto_171954 ) ) ( not ( = ?auto_171953 ?auto_171955 ) ) ( not ( = ?auto_171953 ?auto_171956 ) ) ( not ( = ?auto_171953 ?auto_171957 ) ) ( not ( = ?auto_171954 ?auto_171955 ) ) ( not ( = ?auto_171954 ?auto_171956 ) ) ( not ( = ?auto_171954 ?auto_171957 ) ) ( not ( = ?auto_171955 ?auto_171956 ) ) ( not ( = ?auto_171955 ?auto_171957 ) ) ( not ( = ?auto_171956 ?auto_171957 ) ) ( ON ?auto_171955 ?auto_171956 ) ( ON ?auto_171954 ?auto_171955 ) ( ON ?auto_171953 ?auto_171954 ) ( ON ?auto_171952 ?auto_171953 ) ( ON ?auto_171951 ?auto_171952 ) ( CLEAR ?auto_171949 ) ( ON ?auto_171950 ?auto_171951 ) ( CLEAR ?auto_171950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_171945 ?auto_171946 ?auto_171947 ?auto_171948 ?auto_171949 ?auto_171950 )
      ( MAKE-12PILE ?auto_171945 ?auto_171946 ?auto_171947 ?auto_171948 ?auto_171949 ?auto_171950 ?auto_171951 ?auto_171952 ?auto_171953 ?auto_171954 ?auto_171955 ?auto_171956 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_171970 - BLOCK
      ?auto_171971 - BLOCK
      ?auto_171972 - BLOCK
      ?auto_171973 - BLOCK
      ?auto_171974 - BLOCK
      ?auto_171975 - BLOCK
      ?auto_171976 - BLOCK
      ?auto_171977 - BLOCK
      ?auto_171978 - BLOCK
      ?auto_171979 - BLOCK
      ?auto_171980 - BLOCK
      ?auto_171981 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171981 ) ( ON-TABLE ?auto_171970 ) ( ON ?auto_171971 ?auto_171970 ) ( ON ?auto_171972 ?auto_171971 ) ( ON ?auto_171973 ?auto_171972 ) ( ON ?auto_171974 ?auto_171973 ) ( not ( = ?auto_171970 ?auto_171971 ) ) ( not ( = ?auto_171970 ?auto_171972 ) ) ( not ( = ?auto_171970 ?auto_171973 ) ) ( not ( = ?auto_171970 ?auto_171974 ) ) ( not ( = ?auto_171970 ?auto_171975 ) ) ( not ( = ?auto_171970 ?auto_171976 ) ) ( not ( = ?auto_171970 ?auto_171977 ) ) ( not ( = ?auto_171970 ?auto_171978 ) ) ( not ( = ?auto_171970 ?auto_171979 ) ) ( not ( = ?auto_171970 ?auto_171980 ) ) ( not ( = ?auto_171970 ?auto_171981 ) ) ( not ( = ?auto_171971 ?auto_171972 ) ) ( not ( = ?auto_171971 ?auto_171973 ) ) ( not ( = ?auto_171971 ?auto_171974 ) ) ( not ( = ?auto_171971 ?auto_171975 ) ) ( not ( = ?auto_171971 ?auto_171976 ) ) ( not ( = ?auto_171971 ?auto_171977 ) ) ( not ( = ?auto_171971 ?auto_171978 ) ) ( not ( = ?auto_171971 ?auto_171979 ) ) ( not ( = ?auto_171971 ?auto_171980 ) ) ( not ( = ?auto_171971 ?auto_171981 ) ) ( not ( = ?auto_171972 ?auto_171973 ) ) ( not ( = ?auto_171972 ?auto_171974 ) ) ( not ( = ?auto_171972 ?auto_171975 ) ) ( not ( = ?auto_171972 ?auto_171976 ) ) ( not ( = ?auto_171972 ?auto_171977 ) ) ( not ( = ?auto_171972 ?auto_171978 ) ) ( not ( = ?auto_171972 ?auto_171979 ) ) ( not ( = ?auto_171972 ?auto_171980 ) ) ( not ( = ?auto_171972 ?auto_171981 ) ) ( not ( = ?auto_171973 ?auto_171974 ) ) ( not ( = ?auto_171973 ?auto_171975 ) ) ( not ( = ?auto_171973 ?auto_171976 ) ) ( not ( = ?auto_171973 ?auto_171977 ) ) ( not ( = ?auto_171973 ?auto_171978 ) ) ( not ( = ?auto_171973 ?auto_171979 ) ) ( not ( = ?auto_171973 ?auto_171980 ) ) ( not ( = ?auto_171973 ?auto_171981 ) ) ( not ( = ?auto_171974 ?auto_171975 ) ) ( not ( = ?auto_171974 ?auto_171976 ) ) ( not ( = ?auto_171974 ?auto_171977 ) ) ( not ( = ?auto_171974 ?auto_171978 ) ) ( not ( = ?auto_171974 ?auto_171979 ) ) ( not ( = ?auto_171974 ?auto_171980 ) ) ( not ( = ?auto_171974 ?auto_171981 ) ) ( not ( = ?auto_171975 ?auto_171976 ) ) ( not ( = ?auto_171975 ?auto_171977 ) ) ( not ( = ?auto_171975 ?auto_171978 ) ) ( not ( = ?auto_171975 ?auto_171979 ) ) ( not ( = ?auto_171975 ?auto_171980 ) ) ( not ( = ?auto_171975 ?auto_171981 ) ) ( not ( = ?auto_171976 ?auto_171977 ) ) ( not ( = ?auto_171976 ?auto_171978 ) ) ( not ( = ?auto_171976 ?auto_171979 ) ) ( not ( = ?auto_171976 ?auto_171980 ) ) ( not ( = ?auto_171976 ?auto_171981 ) ) ( not ( = ?auto_171977 ?auto_171978 ) ) ( not ( = ?auto_171977 ?auto_171979 ) ) ( not ( = ?auto_171977 ?auto_171980 ) ) ( not ( = ?auto_171977 ?auto_171981 ) ) ( not ( = ?auto_171978 ?auto_171979 ) ) ( not ( = ?auto_171978 ?auto_171980 ) ) ( not ( = ?auto_171978 ?auto_171981 ) ) ( not ( = ?auto_171979 ?auto_171980 ) ) ( not ( = ?auto_171979 ?auto_171981 ) ) ( not ( = ?auto_171980 ?auto_171981 ) ) ( ON ?auto_171980 ?auto_171981 ) ( ON ?auto_171979 ?auto_171980 ) ( ON ?auto_171978 ?auto_171979 ) ( ON ?auto_171977 ?auto_171978 ) ( ON ?auto_171976 ?auto_171977 ) ( CLEAR ?auto_171974 ) ( ON ?auto_171975 ?auto_171976 ) ( CLEAR ?auto_171975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_171970 ?auto_171971 ?auto_171972 ?auto_171973 ?auto_171974 ?auto_171975 )
      ( MAKE-12PILE ?auto_171970 ?auto_171971 ?auto_171972 ?auto_171973 ?auto_171974 ?auto_171975 ?auto_171976 ?auto_171977 ?auto_171978 ?auto_171979 ?auto_171980 ?auto_171981 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_171994 - BLOCK
      ?auto_171995 - BLOCK
      ?auto_171996 - BLOCK
      ?auto_171997 - BLOCK
      ?auto_171998 - BLOCK
      ?auto_171999 - BLOCK
      ?auto_172000 - BLOCK
      ?auto_172001 - BLOCK
      ?auto_172002 - BLOCK
      ?auto_172003 - BLOCK
      ?auto_172004 - BLOCK
      ?auto_172005 - BLOCK
    )
    :vars
    (
      ?auto_172006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172005 ?auto_172006 ) ( ON-TABLE ?auto_171994 ) ( ON ?auto_171995 ?auto_171994 ) ( ON ?auto_171996 ?auto_171995 ) ( ON ?auto_171997 ?auto_171996 ) ( not ( = ?auto_171994 ?auto_171995 ) ) ( not ( = ?auto_171994 ?auto_171996 ) ) ( not ( = ?auto_171994 ?auto_171997 ) ) ( not ( = ?auto_171994 ?auto_171998 ) ) ( not ( = ?auto_171994 ?auto_171999 ) ) ( not ( = ?auto_171994 ?auto_172000 ) ) ( not ( = ?auto_171994 ?auto_172001 ) ) ( not ( = ?auto_171994 ?auto_172002 ) ) ( not ( = ?auto_171994 ?auto_172003 ) ) ( not ( = ?auto_171994 ?auto_172004 ) ) ( not ( = ?auto_171994 ?auto_172005 ) ) ( not ( = ?auto_171994 ?auto_172006 ) ) ( not ( = ?auto_171995 ?auto_171996 ) ) ( not ( = ?auto_171995 ?auto_171997 ) ) ( not ( = ?auto_171995 ?auto_171998 ) ) ( not ( = ?auto_171995 ?auto_171999 ) ) ( not ( = ?auto_171995 ?auto_172000 ) ) ( not ( = ?auto_171995 ?auto_172001 ) ) ( not ( = ?auto_171995 ?auto_172002 ) ) ( not ( = ?auto_171995 ?auto_172003 ) ) ( not ( = ?auto_171995 ?auto_172004 ) ) ( not ( = ?auto_171995 ?auto_172005 ) ) ( not ( = ?auto_171995 ?auto_172006 ) ) ( not ( = ?auto_171996 ?auto_171997 ) ) ( not ( = ?auto_171996 ?auto_171998 ) ) ( not ( = ?auto_171996 ?auto_171999 ) ) ( not ( = ?auto_171996 ?auto_172000 ) ) ( not ( = ?auto_171996 ?auto_172001 ) ) ( not ( = ?auto_171996 ?auto_172002 ) ) ( not ( = ?auto_171996 ?auto_172003 ) ) ( not ( = ?auto_171996 ?auto_172004 ) ) ( not ( = ?auto_171996 ?auto_172005 ) ) ( not ( = ?auto_171996 ?auto_172006 ) ) ( not ( = ?auto_171997 ?auto_171998 ) ) ( not ( = ?auto_171997 ?auto_171999 ) ) ( not ( = ?auto_171997 ?auto_172000 ) ) ( not ( = ?auto_171997 ?auto_172001 ) ) ( not ( = ?auto_171997 ?auto_172002 ) ) ( not ( = ?auto_171997 ?auto_172003 ) ) ( not ( = ?auto_171997 ?auto_172004 ) ) ( not ( = ?auto_171997 ?auto_172005 ) ) ( not ( = ?auto_171997 ?auto_172006 ) ) ( not ( = ?auto_171998 ?auto_171999 ) ) ( not ( = ?auto_171998 ?auto_172000 ) ) ( not ( = ?auto_171998 ?auto_172001 ) ) ( not ( = ?auto_171998 ?auto_172002 ) ) ( not ( = ?auto_171998 ?auto_172003 ) ) ( not ( = ?auto_171998 ?auto_172004 ) ) ( not ( = ?auto_171998 ?auto_172005 ) ) ( not ( = ?auto_171998 ?auto_172006 ) ) ( not ( = ?auto_171999 ?auto_172000 ) ) ( not ( = ?auto_171999 ?auto_172001 ) ) ( not ( = ?auto_171999 ?auto_172002 ) ) ( not ( = ?auto_171999 ?auto_172003 ) ) ( not ( = ?auto_171999 ?auto_172004 ) ) ( not ( = ?auto_171999 ?auto_172005 ) ) ( not ( = ?auto_171999 ?auto_172006 ) ) ( not ( = ?auto_172000 ?auto_172001 ) ) ( not ( = ?auto_172000 ?auto_172002 ) ) ( not ( = ?auto_172000 ?auto_172003 ) ) ( not ( = ?auto_172000 ?auto_172004 ) ) ( not ( = ?auto_172000 ?auto_172005 ) ) ( not ( = ?auto_172000 ?auto_172006 ) ) ( not ( = ?auto_172001 ?auto_172002 ) ) ( not ( = ?auto_172001 ?auto_172003 ) ) ( not ( = ?auto_172001 ?auto_172004 ) ) ( not ( = ?auto_172001 ?auto_172005 ) ) ( not ( = ?auto_172001 ?auto_172006 ) ) ( not ( = ?auto_172002 ?auto_172003 ) ) ( not ( = ?auto_172002 ?auto_172004 ) ) ( not ( = ?auto_172002 ?auto_172005 ) ) ( not ( = ?auto_172002 ?auto_172006 ) ) ( not ( = ?auto_172003 ?auto_172004 ) ) ( not ( = ?auto_172003 ?auto_172005 ) ) ( not ( = ?auto_172003 ?auto_172006 ) ) ( not ( = ?auto_172004 ?auto_172005 ) ) ( not ( = ?auto_172004 ?auto_172006 ) ) ( not ( = ?auto_172005 ?auto_172006 ) ) ( ON ?auto_172004 ?auto_172005 ) ( ON ?auto_172003 ?auto_172004 ) ( ON ?auto_172002 ?auto_172003 ) ( ON ?auto_172001 ?auto_172002 ) ( ON ?auto_172000 ?auto_172001 ) ( ON ?auto_171999 ?auto_172000 ) ( CLEAR ?auto_171997 ) ( ON ?auto_171998 ?auto_171999 ) ( CLEAR ?auto_171998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_171994 ?auto_171995 ?auto_171996 ?auto_171997 ?auto_171998 )
      ( MAKE-12PILE ?auto_171994 ?auto_171995 ?auto_171996 ?auto_171997 ?auto_171998 ?auto_171999 ?auto_172000 ?auto_172001 ?auto_172002 ?auto_172003 ?auto_172004 ?auto_172005 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_172019 - BLOCK
      ?auto_172020 - BLOCK
      ?auto_172021 - BLOCK
      ?auto_172022 - BLOCK
      ?auto_172023 - BLOCK
      ?auto_172024 - BLOCK
      ?auto_172025 - BLOCK
      ?auto_172026 - BLOCK
      ?auto_172027 - BLOCK
      ?auto_172028 - BLOCK
      ?auto_172029 - BLOCK
      ?auto_172030 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172030 ) ( ON-TABLE ?auto_172019 ) ( ON ?auto_172020 ?auto_172019 ) ( ON ?auto_172021 ?auto_172020 ) ( ON ?auto_172022 ?auto_172021 ) ( not ( = ?auto_172019 ?auto_172020 ) ) ( not ( = ?auto_172019 ?auto_172021 ) ) ( not ( = ?auto_172019 ?auto_172022 ) ) ( not ( = ?auto_172019 ?auto_172023 ) ) ( not ( = ?auto_172019 ?auto_172024 ) ) ( not ( = ?auto_172019 ?auto_172025 ) ) ( not ( = ?auto_172019 ?auto_172026 ) ) ( not ( = ?auto_172019 ?auto_172027 ) ) ( not ( = ?auto_172019 ?auto_172028 ) ) ( not ( = ?auto_172019 ?auto_172029 ) ) ( not ( = ?auto_172019 ?auto_172030 ) ) ( not ( = ?auto_172020 ?auto_172021 ) ) ( not ( = ?auto_172020 ?auto_172022 ) ) ( not ( = ?auto_172020 ?auto_172023 ) ) ( not ( = ?auto_172020 ?auto_172024 ) ) ( not ( = ?auto_172020 ?auto_172025 ) ) ( not ( = ?auto_172020 ?auto_172026 ) ) ( not ( = ?auto_172020 ?auto_172027 ) ) ( not ( = ?auto_172020 ?auto_172028 ) ) ( not ( = ?auto_172020 ?auto_172029 ) ) ( not ( = ?auto_172020 ?auto_172030 ) ) ( not ( = ?auto_172021 ?auto_172022 ) ) ( not ( = ?auto_172021 ?auto_172023 ) ) ( not ( = ?auto_172021 ?auto_172024 ) ) ( not ( = ?auto_172021 ?auto_172025 ) ) ( not ( = ?auto_172021 ?auto_172026 ) ) ( not ( = ?auto_172021 ?auto_172027 ) ) ( not ( = ?auto_172021 ?auto_172028 ) ) ( not ( = ?auto_172021 ?auto_172029 ) ) ( not ( = ?auto_172021 ?auto_172030 ) ) ( not ( = ?auto_172022 ?auto_172023 ) ) ( not ( = ?auto_172022 ?auto_172024 ) ) ( not ( = ?auto_172022 ?auto_172025 ) ) ( not ( = ?auto_172022 ?auto_172026 ) ) ( not ( = ?auto_172022 ?auto_172027 ) ) ( not ( = ?auto_172022 ?auto_172028 ) ) ( not ( = ?auto_172022 ?auto_172029 ) ) ( not ( = ?auto_172022 ?auto_172030 ) ) ( not ( = ?auto_172023 ?auto_172024 ) ) ( not ( = ?auto_172023 ?auto_172025 ) ) ( not ( = ?auto_172023 ?auto_172026 ) ) ( not ( = ?auto_172023 ?auto_172027 ) ) ( not ( = ?auto_172023 ?auto_172028 ) ) ( not ( = ?auto_172023 ?auto_172029 ) ) ( not ( = ?auto_172023 ?auto_172030 ) ) ( not ( = ?auto_172024 ?auto_172025 ) ) ( not ( = ?auto_172024 ?auto_172026 ) ) ( not ( = ?auto_172024 ?auto_172027 ) ) ( not ( = ?auto_172024 ?auto_172028 ) ) ( not ( = ?auto_172024 ?auto_172029 ) ) ( not ( = ?auto_172024 ?auto_172030 ) ) ( not ( = ?auto_172025 ?auto_172026 ) ) ( not ( = ?auto_172025 ?auto_172027 ) ) ( not ( = ?auto_172025 ?auto_172028 ) ) ( not ( = ?auto_172025 ?auto_172029 ) ) ( not ( = ?auto_172025 ?auto_172030 ) ) ( not ( = ?auto_172026 ?auto_172027 ) ) ( not ( = ?auto_172026 ?auto_172028 ) ) ( not ( = ?auto_172026 ?auto_172029 ) ) ( not ( = ?auto_172026 ?auto_172030 ) ) ( not ( = ?auto_172027 ?auto_172028 ) ) ( not ( = ?auto_172027 ?auto_172029 ) ) ( not ( = ?auto_172027 ?auto_172030 ) ) ( not ( = ?auto_172028 ?auto_172029 ) ) ( not ( = ?auto_172028 ?auto_172030 ) ) ( not ( = ?auto_172029 ?auto_172030 ) ) ( ON ?auto_172029 ?auto_172030 ) ( ON ?auto_172028 ?auto_172029 ) ( ON ?auto_172027 ?auto_172028 ) ( ON ?auto_172026 ?auto_172027 ) ( ON ?auto_172025 ?auto_172026 ) ( ON ?auto_172024 ?auto_172025 ) ( CLEAR ?auto_172022 ) ( ON ?auto_172023 ?auto_172024 ) ( CLEAR ?auto_172023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_172019 ?auto_172020 ?auto_172021 ?auto_172022 ?auto_172023 )
      ( MAKE-12PILE ?auto_172019 ?auto_172020 ?auto_172021 ?auto_172022 ?auto_172023 ?auto_172024 ?auto_172025 ?auto_172026 ?auto_172027 ?auto_172028 ?auto_172029 ?auto_172030 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_172043 - BLOCK
      ?auto_172044 - BLOCK
      ?auto_172045 - BLOCK
      ?auto_172046 - BLOCK
      ?auto_172047 - BLOCK
      ?auto_172048 - BLOCK
      ?auto_172049 - BLOCK
      ?auto_172050 - BLOCK
      ?auto_172051 - BLOCK
      ?auto_172052 - BLOCK
      ?auto_172053 - BLOCK
      ?auto_172054 - BLOCK
    )
    :vars
    (
      ?auto_172055 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172054 ?auto_172055 ) ( ON-TABLE ?auto_172043 ) ( ON ?auto_172044 ?auto_172043 ) ( ON ?auto_172045 ?auto_172044 ) ( not ( = ?auto_172043 ?auto_172044 ) ) ( not ( = ?auto_172043 ?auto_172045 ) ) ( not ( = ?auto_172043 ?auto_172046 ) ) ( not ( = ?auto_172043 ?auto_172047 ) ) ( not ( = ?auto_172043 ?auto_172048 ) ) ( not ( = ?auto_172043 ?auto_172049 ) ) ( not ( = ?auto_172043 ?auto_172050 ) ) ( not ( = ?auto_172043 ?auto_172051 ) ) ( not ( = ?auto_172043 ?auto_172052 ) ) ( not ( = ?auto_172043 ?auto_172053 ) ) ( not ( = ?auto_172043 ?auto_172054 ) ) ( not ( = ?auto_172043 ?auto_172055 ) ) ( not ( = ?auto_172044 ?auto_172045 ) ) ( not ( = ?auto_172044 ?auto_172046 ) ) ( not ( = ?auto_172044 ?auto_172047 ) ) ( not ( = ?auto_172044 ?auto_172048 ) ) ( not ( = ?auto_172044 ?auto_172049 ) ) ( not ( = ?auto_172044 ?auto_172050 ) ) ( not ( = ?auto_172044 ?auto_172051 ) ) ( not ( = ?auto_172044 ?auto_172052 ) ) ( not ( = ?auto_172044 ?auto_172053 ) ) ( not ( = ?auto_172044 ?auto_172054 ) ) ( not ( = ?auto_172044 ?auto_172055 ) ) ( not ( = ?auto_172045 ?auto_172046 ) ) ( not ( = ?auto_172045 ?auto_172047 ) ) ( not ( = ?auto_172045 ?auto_172048 ) ) ( not ( = ?auto_172045 ?auto_172049 ) ) ( not ( = ?auto_172045 ?auto_172050 ) ) ( not ( = ?auto_172045 ?auto_172051 ) ) ( not ( = ?auto_172045 ?auto_172052 ) ) ( not ( = ?auto_172045 ?auto_172053 ) ) ( not ( = ?auto_172045 ?auto_172054 ) ) ( not ( = ?auto_172045 ?auto_172055 ) ) ( not ( = ?auto_172046 ?auto_172047 ) ) ( not ( = ?auto_172046 ?auto_172048 ) ) ( not ( = ?auto_172046 ?auto_172049 ) ) ( not ( = ?auto_172046 ?auto_172050 ) ) ( not ( = ?auto_172046 ?auto_172051 ) ) ( not ( = ?auto_172046 ?auto_172052 ) ) ( not ( = ?auto_172046 ?auto_172053 ) ) ( not ( = ?auto_172046 ?auto_172054 ) ) ( not ( = ?auto_172046 ?auto_172055 ) ) ( not ( = ?auto_172047 ?auto_172048 ) ) ( not ( = ?auto_172047 ?auto_172049 ) ) ( not ( = ?auto_172047 ?auto_172050 ) ) ( not ( = ?auto_172047 ?auto_172051 ) ) ( not ( = ?auto_172047 ?auto_172052 ) ) ( not ( = ?auto_172047 ?auto_172053 ) ) ( not ( = ?auto_172047 ?auto_172054 ) ) ( not ( = ?auto_172047 ?auto_172055 ) ) ( not ( = ?auto_172048 ?auto_172049 ) ) ( not ( = ?auto_172048 ?auto_172050 ) ) ( not ( = ?auto_172048 ?auto_172051 ) ) ( not ( = ?auto_172048 ?auto_172052 ) ) ( not ( = ?auto_172048 ?auto_172053 ) ) ( not ( = ?auto_172048 ?auto_172054 ) ) ( not ( = ?auto_172048 ?auto_172055 ) ) ( not ( = ?auto_172049 ?auto_172050 ) ) ( not ( = ?auto_172049 ?auto_172051 ) ) ( not ( = ?auto_172049 ?auto_172052 ) ) ( not ( = ?auto_172049 ?auto_172053 ) ) ( not ( = ?auto_172049 ?auto_172054 ) ) ( not ( = ?auto_172049 ?auto_172055 ) ) ( not ( = ?auto_172050 ?auto_172051 ) ) ( not ( = ?auto_172050 ?auto_172052 ) ) ( not ( = ?auto_172050 ?auto_172053 ) ) ( not ( = ?auto_172050 ?auto_172054 ) ) ( not ( = ?auto_172050 ?auto_172055 ) ) ( not ( = ?auto_172051 ?auto_172052 ) ) ( not ( = ?auto_172051 ?auto_172053 ) ) ( not ( = ?auto_172051 ?auto_172054 ) ) ( not ( = ?auto_172051 ?auto_172055 ) ) ( not ( = ?auto_172052 ?auto_172053 ) ) ( not ( = ?auto_172052 ?auto_172054 ) ) ( not ( = ?auto_172052 ?auto_172055 ) ) ( not ( = ?auto_172053 ?auto_172054 ) ) ( not ( = ?auto_172053 ?auto_172055 ) ) ( not ( = ?auto_172054 ?auto_172055 ) ) ( ON ?auto_172053 ?auto_172054 ) ( ON ?auto_172052 ?auto_172053 ) ( ON ?auto_172051 ?auto_172052 ) ( ON ?auto_172050 ?auto_172051 ) ( ON ?auto_172049 ?auto_172050 ) ( ON ?auto_172048 ?auto_172049 ) ( ON ?auto_172047 ?auto_172048 ) ( CLEAR ?auto_172045 ) ( ON ?auto_172046 ?auto_172047 ) ( CLEAR ?auto_172046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_172043 ?auto_172044 ?auto_172045 ?auto_172046 )
      ( MAKE-12PILE ?auto_172043 ?auto_172044 ?auto_172045 ?auto_172046 ?auto_172047 ?auto_172048 ?auto_172049 ?auto_172050 ?auto_172051 ?auto_172052 ?auto_172053 ?auto_172054 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_172068 - BLOCK
      ?auto_172069 - BLOCK
      ?auto_172070 - BLOCK
      ?auto_172071 - BLOCK
      ?auto_172072 - BLOCK
      ?auto_172073 - BLOCK
      ?auto_172074 - BLOCK
      ?auto_172075 - BLOCK
      ?auto_172076 - BLOCK
      ?auto_172077 - BLOCK
      ?auto_172078 - BLOCK
      ?auto_172079 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172079 ) ( ON-TABLE ?auto_172068 ) ( ON ?auto_172069 ?auto_172068 ) ( ON ?auto_172070 ?auto_172069 ) ( not ( = ?auto_172068 ?auto_172069 ) ) ( not ( = ?auto_172068 ?auto_172070 ) ) ( not ( = ?auto_172068 ?auto_172071 ) ) ( not ( = ?auto_172068 ?auto_172072 ) ) ( not ( = ?auto_172068 ?auto_172073 ) ) ( not ( = ?auto_172068 ?auto_172074 ) ) ( not ( = ?auto_172068 ?auto_172075 ) ) ( not ( = ?auto_172068 ?auto_172076 ) ) ( not ( = ?auto_172068 ?auto_172077 ) ) ( not ( = ?auto_172068 ?auto_172078 ) ) ( not ( = ?auto_172068 ?auto_172079 ) ) ( not ( = ?auto_172069 ?auto_172070 ) ) ( not ( = ?auto_172069 ?auto_172071 ) ) ( not ( = ?auto_172069 ?auto_172072 ) ) ( not ( = ?auto_172069 ?auto_172073 ) ) ( not ( = ?auto_172069 ?auto_172074 ) ) ( not ( = ?auto_172069 ?auto_172075 ) ) ( not ( = ?auto_172069 ?auto_172076 ) ) ( not ( = ?auto_172069 ?auto_172077 ) ) ( not ( = ?auto_172069 ?auto_172078 ) ) ( not ( = ?auto_172069 ?auto_172079 ) ) ( not ( = ?auto_172070 ?auto_172071 ) ) ( not ( = ?auto_172070 ?auto_172072 ) ) ( not ( = ?auto_172070 ?auto_172073 ) ) ( not ( = ?auto_172070 ?auto_172074 ) ) ( not ( = ?auto_172070 ?auto_172075 ) ) ( not ( = ?auto_172070 ?auto_172076 ) ) ( not ( = ?auto_172070 ?auto_172077 ) ) ( not ( = ?auto_172070 ?auto_172078 ) ) ( not ( = ?auto_172070 ?auto_172079 ) ) ( not ( = ?auto_172071 ?auto_172072 ) ) ( not ( = ?auto_172071 ?auto_172073 ) ) ( not ( = ?auto_172071 ?auto_172074 ) ) ( not ( = ?auto_172071 ?auto_172075 ) ) ( not ( = ?auto_172071 ?auto_172076 ) ) ( not ( = ?auto_172071 ?auto_172077 ) ) ( not ( = ?auto_172071 ?auto_172078 ) ) ( not ( = ?auto_172071 ?auto_172079 ) ) ( not ( = ?auto_172072 ?auto_172073 ) ) ( not ( = ?auto_172072 ?auto_172074 ) ) ( not ( = ?auto_172072 ?auto_172075 ) ) ( not ( = ?auto_172072 ?auto_172076 ) ) ( not ( = ?auto_172072 ?auto_172077 ) ) ( not ( = ?auto_172072 ?auto_172078 ) ) ( not ( = ?auto_172072 ?auto_172079 ) ) ( not ( = ?auto_172073 ?auto_172074 ) ) ( not ( = ?auto_172073 ?auto_172075 ) ) ( not ( = ?auto_172073 ?auto_172076 ) ) ( not ( = ?auto_172073 ?auto_172077 ) ) ( not ( = ?auto_172073 ?auto_172078 ) ) ( not ( = ?auto_172073 ?auto_172079 ) ) ( not ( = ?auto_172074 ?auto_172075 ) ) ( not ( = ?auto_172074 ?auto_172076 ) ) ( not ( = ?auto_172074 ?auto_172077 ) ) ( not ( = ?auto_172074 ?auto_172078 ) ) ( not ( = ?auto_172074 ?auto_172079 ) ) ( not ( = ?auto_172075 ?auto_172076 ) ) ( not ( = ?auto_172075 ?auto_172077 ) ) ( not ( = ?auto_172075 ?auto_172078 ) ) ( not ( = ?auto_172075 ?auto_172079 ) ) ( not ( = ?auto_172076 ?auto_172077 ) ) ( not ( = ?auto_172076 ?auto_172078 ) ) ( not ( = ?auto_172076 ?auto_172079 ) ) ( not ( = ?auto_172077 ?auto_172078 ) ) ( not ( = ?auto_172077 ?auto_172079 ) ) ( not ( = ?auto_172078 ?auto_172079 ) ) ( ON ?auto_172078 ?auto_172079 ) ( ON ?auto_172077 ?auto_172078 ) ( ON ?auto_172076 ?auto_172077 ) ( ON ?auto_172075 ?auto_172076 ) ( ON ?auto_172074 ?auto_172075 ) ( ON ?auto_172073 ?auto_172074 ) ( ON ?auto_172072 ?auto_172073 ) ( CLEAR ?auto_172070 ) ( ON ?auto_172071 ?auto_172072 ) ( CLEAR ?auto_172071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_172068 ?auto_172069 ?auto_172070 ?auto_172071 )
      ( MAKE-12PILE ?auto_172068 ?auto_172069 ?auto_172070 ?auto_172071 ?auto_172072 ?auto_172073 ?auto_172074 ?auto_172075 ?auto_172076 ?auto_172077 ?auto_172078 ?auto_172079 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_172092 - BLOCK
      ?auto_172093 - BLOCK
      ?auto_172094 - BLOCK
      ?auto_172095 - BLOCK
      ?auto_172096 - BLOCK
      ?auto_172097 - BLOCK
      ?auto_172098 - BLOCK
      ?auto_172099 - BLOCK
      ?auto_172100 - BLOCK
      ?auto_172101 - BLOCK
      ?auto_172102 - BLOCK
      ?auto_172103 - BLOCK
    )
    :vars
    (
      ?auto_172104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172103 ?auto_172104 ) ( ON-TABLE ?auto_172092 ) ( ON ?auto_172093 ?auto_172092 ) ( not ( = ?auto_172092 ?auto_172093 ) ) ( not ( = ?auto_172092 ?auto_172094 ) ) ( not ( = ?auto_172092 ?auto_172095 ) ) ( not ( = ?auto_172092 ?auto_172096 ) ) ( not ( = ?auto_172092 ?auto_172097 ) ) ( not ( = ?auto_172092 ?auto_172098 ) ) ( not ( = ?auto_172092 ?auto_172099 ) ) ( not ( = ?auto_172092 ?auto_172100 ) ) ( not ( = ?auto_172092 ?auto_172101 ) ) ( not ( = ?auto_172092 ?auto_172102 ) ) ( not ( = ?auto_172092 ?auto_172103 ) ) ( not ( = ?auto_172092 ?auto_172104 ) ) ( not ( = ?auto_172093 ?auto_172094 ) ) ( not ( = ?auto_172093 ?auto_172095 ) ) ( not ( = ?auto_172093 ?auto_172096 ) ) ( not ( = ?auto_172093 ?auto_172097 ) ) ( not ( = ?auto_172093 ?auto_172098 ) ) ( not ( = ?auto_172093 ?auto_172099 ) ) ( not ( = ?auto_172093 ?auto_172100 ) ) ( not ( = ?auto_172093 ?auto_172101 ) ) ( not ( = ?auto_172093 ?auto_172102 ) ) ( not ( = ?auto_172093 ?auto_172103 ) ) ( not ( = ?auto_172093 ?auto_172104 ) ) ( not ( = ?auto_172094 ?auto_172095 ) ) ( not ( = ?auto_172094 ?auto_172096 ) ) ( not ( = ?auto_172094 ?auto_172097 ) ) ( not ( = ?auto_172094 ?auto_172098 ) ) ( not ( = ?auto_172094 ?auto_172099 ) ) ( not ( = ?auto_172094 ?auto_172100 ) ) ( not ( = ?auto_172094 ?auto_172101 ) ) ( not ( = ?auto_172094 ?auto_172102 ) ) ( not ( = ?auto_172094 ?auto_172103 ) ) ( not ( = ?auto_172094 ?auto_172104 ) ) ( not ( = ?auto_172095 ?auto_172096 ) ) ( not ( = ?auto_172095 ?auto_172097 ) ) ( not ( = ?auto_172095 ?auto_172098 ) ) ( not ( = ?auto_172095 ?auto_172099 ) ) ( not ( = ?auto_172095 ?auto_172100 ) ) ( not ( = ?auto_172095 ?auto_172101 ) ) ( not ( = ?auto_172095 ?auto_172102 ) ) ( not ( = ?auto_172095 ?auto_172103 ) ) ( not ( = ?auto_172095 ?auto_172104 ) ) ( not ( = ?auto_172096 ?auto_172097 ) ) ( not ( = ?auto_172096 ?auto_172098 ) ) ( not ( = ?auto_172096 ?auto_172099 ) ) ( not ( = ?auto_172096 ?auto_172100 ) ) ( not ( = ?auto_172096 ?auto_172101 ) ) ( not ( = ?auto_172096 ?auto_172102 ) ) ( not ( = ?auto_172096 ?auto_172103 ) ) ( not ( = ?auto_172096 ?auto_172104 ) ) ( not ( = ?auto_172097 ?auto_172098 ) ) ( not ( = ?auto_172097 ?auto_172099 ) ) ( not ( = ?auto_172097 ?auto_172100 ) ) ( not ( = ?auto_172097 ?auto_172101 ) ) ( not ( = ?auto_172097 ?auto_172102 ) ) ( not ( = ?auto_172097 ?auto_172103 ) ) ( not ( = ?auto_172097 ?auto_172104 ) ) ( not ( = ?auto_172098 ?auto_172099 ) ) ( not ( = ?auto_172098 ?auto_172100 ) ) ( not ( = ?auto_172098 ?auto_172101 ) ) ( not ( = ?auto_172098 ?auto_172102 ) ) ( not ( = ?auto_172098 ?auto_172103 ) ) ( not ( = ?auto_172098 ?auto_172104 ) ) ( not ( = ?auto_172099 ?auto_172100 ) ) ( not ( = ?auto_172099 ?auto_172101 ) ) ( not ( = ?auto_172099 ?auto_172102 ) ) ( not ( = ?auto_172099 ?auto_172103 ) ) ( not ( = ?auto_172099 ?auto_172104 ) ) ( not ( = ?auto_172100 ?auto_172101 ) ) ( not ( = ?auto_172100 ?auto_172102 ) ) ( not ( = ?auto_172100 ?auto_172103 ) ) ( not ( = ?auto_172100 ?auto_172104 ) ) ( not ( = ?auto_172101 ?auto_172102 ) ) ( not ( = ?auto_172101 ?auto_172103 ) ) ( not ( = ?auto_172101 ?auto_172104 ) ) ( not ( = ?auto_172102 ?auto_172103 ) ) ( not ( = ?auto_172102 ?auto_172104 ) ) ( not ( = ?auto_172103 ?auto_172104 ) ) ( ON ?auto_172102 ?auto_172103 ) ( ON ?auto_172101 ?auto_172102 ) ( ON ?auto_172100 ?auto_172101 ) ( ON ?auto_172099 ?auto_172100 ) ( ON ?auto_172098 ?auto_172099 ) ( ON ?auto_172097 ?auto_172098 ) ( ON ?auto_172096 ?auto_172097 ) ( ON ?auto_172095 ?auto_172096 ) ( CLEAR ?auto_172093 ) ( ON ?auto_172094 ?auto_172095 ) ( CLEAR ?auto_172094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172092 ?auto_172093 ?auto_172094 )
      ( MAKE-12PILE ?auto_172092 ?auto_172093 ?auto_172094 ?auto_172095 ?auto_172096 ?auto_172097 ?auto_172098 ?auto_172099 ?auto_172100 ?auto_172101 ?auto_172102 ?auto_172103 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_172117 - BLOCK
      ?auto_172118 - BLOCK
      ?auto_172119 - BLOCK
      ?auto_172120 - BLOCK
      ?auto_172121 - BLOCK
      ?auto_172122 - BLOCK
      ?auto_172123 - BLOCK
      ?auto_172124 - BLOCK
      ?auto_172125 - BLOCK
      ?auto_172126 - BLOCK
      ?auto_172127 - BLOCK
      ?auto_172128 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172128 ) ( ON-TABLE ?auto_172117 ) ( ON ?auto_172118 ?auto_172117 ) ( not ( = ?auto_172117 ?auto_172118 ) ) ( not ( = ?auto_172117 ?auto_172119 ) ) ( not ( = ?auto_172117 ?auto_172120 ) ) ( not ( = ?auto_172117 ?auto_172121 ) ) ( not ( = ?auto_172117 ?auto_172122 ) ) ( not ( = ?auto_172117 ?auto_172123 ) ) ( not ( = ?auto_172117 ?auto_172124 ) ) ( not ( = ?auto_172117 ?auto_172125 ) ) ( not ( = ?auto_172117 ?auto_172126 ) ) ( not ( = ?auto_172117 ?auto_172127 ) ) ( not ( = ?auto_172117 ?auto_172128 ) ) ( not ( = ?auto_172118 ?auto_172119 ) ) ( not ( = ?auto_172118 ?auto_172120 ) ) ( not ( = ?auto_172118 ?auto_172121 ) ) ( not ( = ?auto_172118 ?auto_172122 ) ) ( not ( = ?auto_172118 ?auto_172123 ) ) ( not ( = ?auto_172118 ?auto_172124 ) ) ( not ( = ?auto_172118 ?auto_172125 ) ) ( not ( = ?auto_172118 ?auto_172126 ) ) ( not ( = ?auto_172118 ?auto_172127 ) ) ( not ( = ?auto_172118 ?auto_172128 ) ) ( not ( = ?auto_172119 ?auto_172120 ) ) ( not ( = ?auto_172119 ?auto_172121 ) ) ( not ( = ?auto_172119 ?auto_172122 ) ) ( not ( = ?auto_172119 ?auto_172123 ) ) ( not ( = ?auto_172119 ?auto_172124 ) ) ( not ( = ?auto_172119 ?auto_172125 ) ) ( not ( = ?auto_172119 ?auto_172126 ) ) ( not ( = ?auto_172119 ?auto_172127 ) ) ( not ( = ?auto_172119 ?auto_172128 ) ) ( not ( = ?auto_172120 ?auto_172121 ) ) ( not ( = ?auto_172120 ?auto_172122 ) ) ( not ( = ?auto_172120 ?auto_172123 ) ) ( not ( = ?auto_172120 ?auto_172124 ) ) ( not ( = ?auto_172120 ?auto_172125 ) ) ( not ( = ?auto_172120 ?auto_172126 ) ) ( not ( = ?auto_172120 ?auto_172127 ) ) ( not ( = ?auto_172120 ?auto_172128 ) ) ( not ( = ?auto_172121 ?auto_172122 ) ) ( not ( = ?auto_172121 ?auto_172123 ) ) ( not ( = ?auto_172121 ?auto_172124 ) ) ( not ( = ?auto_172121 ?auto_172125 ) ) ( not ( = ?auto_172121 ?auto_172126 ) ) ( not ( = ?auto_172121 ?auto_172127 ) ) ( not ( = ?auto_172121 ?auto_172128 ) ) ( not ( = ?auto_172122 ?auto_172123 ) ) ( not ( = ?auto_172122 ?auto_172124 ) ) ( not ( = ?auto_172122 ?auto_172125 ) ) ( not ( = ?auto_172122 ?auto_172126 ) ) ( not ( = ?auto_172122 ?auto_172127 ) ) ( not ( = ?auto_172122 ?auto_172128 ) ) ( not ( = ?auto_172123 ?auto_172124 ) ) ( not ( = ?auto_172123 ?auto_172125 ) ) ( not ( = ?auto_172123 ?auto_172126 ) ) ( not ( = ?auto_172123 ?auto_172127 ) ) ( not ( = ?auto_172123 ?auto_172128 ) ) ( not ( = ?auto_172124 ?auto_172125 ) ) ( not ( = ?auto_172124 ?auto_172126 ) ) ( not ( = ?auto_172124 ?auto_172127 ) ) ( not ( = ?auto_172124 ?auto_172128 ) ) ( not ( = ?auto_172125 ?auto_172126 ) ) ( not ( = ?auto_172125 ?auto_172127 ) ) ( not ( = ?auto_172125 ?auto_172128 ) ) ( not ( = ?auto_172126 ?auto_172127 ) ) ( not ( = ?auto_172126 ?auto_172128 ) ) ( not ( = ?auto_172127 ?auto_172128 ) ) ( ON ?auto_172127 ?auto_172128 ) ( ON ?auto_172126 ?auto_172127 ) ( ON ?auto_172125 ?auto_172126 ) ( ON ?auto_172124 ?auto_172125 ) ( ON ?auto_172123 ?auto_172124 ) ( ON ?auto_172122 ?auto_172123 ) ( ON ?auto_172121 ?auto_172122 ) ( ON ?auto_172120 ?auto_172121 ) ( CLEAR ?auto_172118 ) ( ON ?auto_172119 ?auto_172120 ) ( CLEAR ?auto_172119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172117 ?auto_172118 ?auto_172119 )
      ( MAKE-12PILE ?auto_172117 ?auto_172118 ?auto_172119 ?auto_172120 ?auto_172121 ?auto_172122 ?auto_172123 ?auto_172124 ?auto_172125 ?auto_172126 ?auto_172127 ?auto_172128 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_172141 - BLOCK
      ?auto_172142 - BLOCK
      ?auto_172143 - BLOCK
      ?auto_172144 - BLOCK
      ?auto_172145 - BLOCK
      ?auto_172146 - BLOCK
      ?auto_172147 - BLOCK
      ?auto_172148 - BLOCK
      ?auto_172149 - BLOCK
      ?auto_172150 - BLOCK
      ?auto_172151 - BLOCK
      ?auto_172152 - BLOCK
    )
    :vars
    (
      ?auto_172153 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172152 ?auto_172153 ) ( ON-TABLE ?auto_172141 ) ( not ( = ?auto_172141 ?auto_172142 ) ) ( not ( = ?auto_172141 ?auto_172143 ) ) ( not ( = ?auto_172141 ?auto_172144 ) ) ( not ( = ?auto_172141 ?auto_172145 ) ) ( not ( = ?auto_172141 ?auto_172146 ) ) ( not ( = ?auto_172141 ?auto_172147 ) ) ( not ( = ?auto_172141 ?auto_172148 ) ) ( not ( = ?auto_172141 ?auto_172149 ) ) ( not ( = ?auto_172141 ?auto_172150 ) ) ( not ( = ?auto_172141 ?auto_172151 ) ) ( not ( = ?auto_172141 ?auto_172152 ) ) ( not ( = ?auto_172141 ?auto_172153 ) ) ( not ( = ?auto_172142 ?auto_172143 ) ) ( not ( = ?auto_172142 ?auto_172144 ) ) ( not ( = ?auto_172142 ?auto_172145 ) ) ( not ( = ?auto_172142 ?auto_172146 ) ) ( not ( = ?auto_172142 ?auto_172147 ) ) ( not ( = ?auto_172142 ?auto_172148 ) ) ( not ( = ?auto_172142 ?auto_172149 ) ) ( not ( = ?auto_172142 ?auto_172150 ) ) ( not ( = ?auto_172142 ?auto_172151 ) ) ( not ( = ?auto_172142 ?auto_172152 ) ) ( not ( = ?auto_172142 ?auto_172153 ) ) ( not ( = ?auto_172143 ?auto_172144 ) ) ( not ( = ?auto_172143 ?auto_172145 ) ) ( not ( = ?auto_172143 ?auto_172146 ) ) ( not ( = ?auto_172143 ?auto_172147 ) ) ( not ( = ?auto_172143 ?auto_172148 ) ) ( not ( = ?auto_172143 ?auto_172149 ) ) ( not ( = ?auto_172143 ?auto_172150 ) ) ( not ( = ?auto_172143 ?auto_172151 ) ) ( not ( = ?auto_172143 ?auto_172152 ) ) ( not ( = ?auto_172143 ?auto_172153 ) ) ( not ( = ?auto_172144 ?auto_172145 ) ) ( not ( = ?auto_172144 ?auto_172146 ) ) ( not ( = ?auto_172144 ?auto_172147 ) ) ( not ( = ?auto_172144 ?auto_172148 ) ) ( not ( = ?auto_172144 ?auto_172149 ) ) ( not ( = ?auto_172144 ?auto_172150 ) ) ( not ( = ?auto_172144 ?auto_172151 ) ) ( not ( = ?auto_172144 ?auto_172152 ) ) ( not ( = ?auto_172144 ?auto_172153 ) ) ( not ( = ?auto_172145 ?auto_172146 ) ) ( not ( = ?auto_172145 ?auto_172147 ) ) ( not ( = ?auto_172145 ?auto_172148 ) ) ( not ( = ?auto_172145 ?auto_172149 ) ) ( not ( = ?auto_172145 ?auto_172150 ) ) ( not ( = ?auto_172145 ?auto_172151 ) ) ( not ( = ?auto_172145 ?auto_172152 ) ) ( not ( = ?auto_172145 ?auto_172153 ) ) ( not ( = ?auto_172146 ?auto_172147 ) ) ( not ( = ?auto_172146 ?auto_172148 ) ) ( not ( = ?auto_172146 ?auto_172149 ) ) ( not ( = ?auto_172146 ?auto_172150 ) ) ( not ( = ?auto_172146 ?auto_172151 ) ) ( not ( = ?auto_172146 ?auto_172152 ) ) ( not ( = ?auto_172146 ?auto_172153 ) ) ( not ( = ?auto_172147 ?auto_172148 ) ) ( not ( = ?auto_172147 ?auto_172149 ) ) ( not ( = ?auto_172147 ?auto_172150 ) ) ( not ( = ?auto_172147 ?auto_172151 ) ) ( not ( = ?auto_172147 ?auto_172152 ) ) ( not ( = ?auto_172147 ?auto_172153 ) ) ( not ( = ?auto_172148 ?auto_172149 ) ) ( not ( = ?auto_172148 ?auto_172150 ) ) ( not ( = ?auto_172148 ?auto_172151 ) ) ( not ( = ?auto_172148 ?auto_172152 ) ) ( not ( = ?auto_172148 ?auto_172153 ) ) ( not ( = ?auto_172149 ?auto_172150 ) ) ( not ( = ?auto_172149 ?auto_172151 ) ) ( not ( = ?auto_172149 ?auto_172152 ) ) ( not ( = ?auto_172149 ?auto_172153 ) ) ( not ( = ?auto_172150 ?auto_172151 ) ) ( not ( = ?auto_172150 ?auto_172152 ) ) ( not ( = ?auto_172150 ?auto_172153 ) ) ( not ( = ?auto_172151 ?auto_172152 ) ) ( not ( = ?auto_172151 ?auto_172153 ) ) ( not ( = ?auto_172152 ?auto_172153 ) ) ( ON ?auto_172151 ?auto_172152 ) ( ON ?auto_172150 ?auto_172151 ) ( ON ?auto_172149 ?auto_172150 ) ( ON ?auto_172148 ?auto_172149 ) ( ON ?auto_172147 ?auto_172148 ) ( ON ?auto_172146 ?auto_172147 ) ( ON ?auto_172145 ?auto_172146 ) ( ON ?auto_172144 ?auto_172145 ) ( ON ?auto_172143 ?auto_172144 ) ( CLEAR ?auto_172141 ) ( ON ?auto_172142 ?auto_172143 ) ( CLEAR ?auto_172142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172141 ?auto_172142 )
      ( MAKE-12PILE ?auto_172141 ?auto_172142 ?auto_172143 ?auto_172144 ?auto_172145 ?auto_172146 ?auto_172147 ?auto_172148 ?auto_172149 ?auto_172150 ?auto_172151 ?auto_172152 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_172166 - BLOCK
      ?auto_172167 - BLOCK
      ?auto_172168 - BLOCK
      ?auto_172169 - BLOCK
      ?auto_172170 - BLOCK
      ?auto_172171 - BLOCK
      ?auto_172172 - BLOCK
      ?auto_172173 - BLOCK
      ?auto_172174 - BLOCK
      ?auto_172175 - BLOCK
      ?auto_172176 - BLOCK
      ?auto_172177 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172177 ) ( ON-TABLE ?auto_172166 ) ( not ( = ?auto_172166 ?auto_172167 ) ) ( not ( = ?auto_172166 ?auto_172168 ) ) ( not ( = ?auto_172166 ?auto_172169 ) ) ( not ( = ?auto_172166 ?auto_172170 ) ) ( not ( = ?auto_172166 ?auto_172171 ) ) ( not ( = ?auto_172166 ?auto_172172 ) ) ( not ( = ?auto_172166 ?auto_172173 ) ) ( not ( = ?auto_172166 ?auto_172174 ) ) ( not ( = ?auto_172166 ?auto_172175 ) ) ( not ( = ?auto_172166 ?auto_172176 ) ) ( not ( = ?auto_172166 ?auto_172177 ) ) ( not ( = ?auto_172167 ?auto_172168 ) ) ( not ( = ?auto_172167 ?auto_172169 ) ) ( not ( = ?auto_172167 ?auto_172170 ) ) ( not ( = ?auto_172167 ?auto_172171 ) ) ( not ( = ?auto_172167 ?auto_172172 ) ) ( not ( = ?auto_172167 ?auto_172173 ) ) ( not ( = ?auto_172167 ?auto_172174 ) ) ( not ( = ?auto_172167 ?auto_172175 ) ) ( not ( = ?auto_172167 ?auto_172176 ) ) ( not ( = ?auto_172167 ?auto_172177 ) ) ( not ( = ?auto_172168 ?auto_172169 ) ) ( not ( = ?auto_172168 ?auto_172170 ) ) ( not ( = ?auto_172168 ?auto_172171 ) ) ( not ( = ?auto_172168 ?auto_172172 ) ) ( not ( = ?auto_172168 ?auto_172173 ) ) ( not ( = ?auto_172168 ?auto_172174 ) ) ( not ( = ?auto_172168 ?auto_172175 ) ) ( not ( = ?auto_172168 ?auto_172176 ) ) ( not ( = ?auto_172168 ?auto_172177 ) ) ( not ( = ?auto_172169 ?auto_172170 ) ) ( not ( = ?auto_172169 ?auto_172171 ) ) ( not ( = ?auto_172169 ?auto_172172 ) ) ( not ( = ?auto_172169 ?auto_172173 ) ) ( not ( = ?auto_172169 ?auto_172174 ) ) ( not ( = ?auto_172169 ?auto_172175 ) ) ( not ( = ?auto_172169 ?auto_172176 ) ) ( not ( = ?auto_172169 ?auto_172177 ) ) ( not ( = ?auto_172170 ?auto_172171 ) ) ( not ( = ?auto_172170 ?auto_172172 ) ) ( not ( = ?auto_172170 ?auto_172173 ) ) ( not ( = ?auto_172170 ?auto_172174 ) ) ( not ( = ?auto_172170 ?auto_172175 ) ) ( not ( = ?auto_172170 ?auto_172176 ) ) ( not ( = ?auto_172170 ?auto_172177 ) ) ( not ( = ?auto_172171 ?auto_172172 ) ) ( not ( = ?auto_172171 ?auto_172173 ) ) ( not ( = ?auto_172171 ?auto_172174 ) ) ( not ( = ?auto_172171 ?auto_172175 ) ) ( not ( = ?auto_172171 ?auto_172176 ) ) ( not ( = ?auto_172171 ?auto_172177 ) ) ( not ( = ?auto_172172 ?auto_172173 ) ) ( not ( = ?auto_172172 ?auto_172174 ) ) ( not ( = ?auto_172172 ?auto_172175 ) ) ( not ( = ?auto_172172 ?auto_172176 ) ) ( not ( = ?auto_172172 ?auto_172177 ) ) ( not ( = ?auto_172173 ?auto_172174 ) ) ( not ( = ?auto_172173 ?auto_172175 ) ) ( not ( = ?auto_172173 ?auto_172176 ) ) ( not ( = ?auto_172173 ?auto_172177 ) ) ( not ( = ?auto_172174 ?auto_172175 ) ) ( not ( = ?auto_172174 ?auto_172176 ) ) ( not ( = ?auto_172174 ?auto_172177 ) ) ( not ( = ?auto_172175 ?auto_172176 ) ) ( not ( = ?auto_172175 ?auto_172177 ) ) ( not ( = ?auto_172176 ?auto_172177 ) ) ( ON ?auto_172176 ?auto_172177 ) ( ON ?auto_172175 ?auto_172176 ) ( ON ?auto_172174 ?auto_172175 ) ( ON ?auto_172173 ?auto_172174 ) ( ON ?auto_172172 ?auto_172173 ) ( ON ?auto_172171 ?auto_172172 ) ( ON ?auto_172170 ?auto_172171 ) ( ON ?auto_172169 ?auto_172170 ) ( ON ?auto_172168 ?auto_172169 ) ( CLEAR ?auto_172166 ) ( ON ?auto_172167 ?auto_172168 ) ( CLEAR ?auto_172167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172166 ?auto_172167 )
      ( MAKE-12PILE ?auto_172166 ?auto_172167 ?auto_172168 ?auto_172169 ?auto_172170 ?auto_172171 ?auto_172172 ?auto_172173 ?auto_172174 ?auto_172175 ?auto_172176 ?auto_172177 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_172190 - BLOCK
      ?auto_172191 - BLOCK
      ?auto_172192 - BLOCK
      ?auto_172193 - BLOCK
      ?auto_172194 - BLOCK
      ?auto_172195 - BLOCK
      ?auto_172196 - BLOCK
      ?auto_172197 - BLOCK
      ?auto_172198 - BLOCK
      ?auto_172199 - BLOCK
      ?auto_172200 - BLOCK
      ?auto_172201 - BLOCK
    )
    :vars
    (
      ?auto_172202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172201 ?auto_172202 ) ( not ( = ?auto_172190 ?auto_172191 ) ) ( not ( = ?auto_172190 ?auto_172192 ) ) ( not ( = ?auto_172190 ?auto_172193 ) ) ( not ( = ?auto_172190 ?auto_172194 ) ) ( not ( = ?auto_172190 ?auto_172195 ) ) ( not ( = ?auto_172190 ?auto_172196 ) ) ( not ( = ?auto_172190 ?auto_172197 ) ) ( not ( = ?auto_172190 ?auto_172198 ) ) ( not ( = ?auto_172190 ?auto_172199 ) ) ( not ( = ?auto_172190 ?auto_172200 ) ) ( not ( = ?auto_172190 ?auto_172201 ) ) ( not ( = ?auto_172190 ?auto_172202 ) ) ( not ( = ?auto_172191 ?auto_172192 ) ) ( not ( = ?auto_172191 ?auto_172193 ) ) ( not ( = ?auto_172191 ?auto_172194 ) ) ( not ( = ?auto_172191 ?auto_172195 ) ) ( not ( = ?auto_172191 ?auto_172196 ) ) ( not ( = ?auto_172191 ?auto_172197 ) ) ( not ( = ?auto_172191 ?auto_172198 ) ) ( not ( = ?auto_172191 ?auto_172199 ) ) ( not ( = ?auto_172191 ?auto_172200 ) ) ( not ( = ?auto_172191 ?auto_172201 ) ) ( not ( = ?auto_172191 ?auto_172202 ) ) ( not ( = ?auto_172192 ?auto_172193 ) ) ( not ( = ?auto_172192 ?auto_172194 ) ) ( not ( = ?auto_172192 ?auto_172195 ) ) ( not ( = ?auto_172192 ?auto_172196 ) ) ( not ( = ?auto_172192 ?auto_172197 ) ) ( not ( = ?auto_172192 ?auto_172198 ) ) ( not ( = ?auto_172192 ?auto_172199 ) ) ( not ( = ?auto_172192 ?auto_172200 ) ) ( not ( = ?auto_172192 ?auto_172201 ) ) ( not ( = ?auto_172192 ?auto_172202 ) ) ( not ( = ?auto_172193 ?auto_172194 ) ) ( not ( = ?auto_172193 ?auto_172195 ) ) ( not ( = ?auto_172193 ?auto_172196 ) ) ( not ( = ?auto_172193 ?auto_172197 ) ) ( not ( = ?auto_172193 ?auto_172198 ) ) ( not ( = ?auto_172193 ?auto_172199 ) ) ( not ( = ?auto_172193 ?auto_172200 ) ) ( not ( = ?auto_172193 ?auto_172201 ) ) ( not ( = ?auto_172193 ?auto_172202 ) ) ( not ( = ?auto_172194 ?auto_172195 ) ) ( not ( = ?auto_172194 ?auto_172196 ) ) ( not ( = ?auto_172194 ?auto_172197 ) ) ( not ( = ?auto_172194 ?auto_172198 ) ) ( not ( = ?auto_172194 ?auto_172199 ) ) ( not ( = ?auto_172194 ?auto_172200 ) ) ( not ( = ?auto_172194 ?auto_172201 ) ) ( not ( = ?auto_172194 ?auto_172202 ) ) ( not ( = ?auto_172195 ?auto_172196 ) ) ( not ( = ?auto_172195 ?auto_172197 ) ) ( not ( = ?auto_172195 ?auto_172198 ) ) ( not ( = ?auto_172195 ?auto_172199 ) ) ( not ( = ?auto_172195 ?auto_172200 ) ) ( not ( = ?auto_172195 ?auto_172201 ) ) ( not ( = ?auto_172195 ?auto_172202 ) ) ( not ( = ?auto_172196 ?auto_172197 ) ) ( not ( = ?auto_172196 ?auto_172198 ) ) ( not ( = ?auto_172196 ?auto_172199 ) ) ( not ( = ?auto_172196 ?auto_172200 ) ) ( not ( = ?auto_172196 ?auto_172201 ) ) ( not ( = ?auto_172196 ?auto_172202 ) ) ( not ( = ?auto_172197 ?auto_172198 ) ) ( not ( = ?auto_172197 ?auto_172199 ) ) ( not ( = ?auto_172197 ?auto_172200 ) ) ( not ( = ?auto_172197 ?auto_172201 ) ) ( not ( = ?auto_172197 ?auto_172202 ) ) ( not ( = ?auto_172198 ?auto_172199 ) ) ( not ( = ?auto_172198 ?auto_172200 ) ) ( not ( = ?auto_172198 ?auto_172201 ) ) ( not ( = ?auto_172198 ?auto_172202 ) ) ( not ( = ?auto_172199 ?auto_172200 ) ) ( not ( = ?auto_172199 ?auto_172201 ) ) ( not ( = ?auto_172199 ?auto_172202 ) ) ( not ( = ?auto_172200 ?auto_172201 ) ) ( not ( = ?auto_172200 ?auto_172202 ) ) ( not ( = ?auto_172201 ?auto_172202 ) ) ( ON ?auto_172200 ?auto_172201 ) ( ON ?auto_172199 ?auto_172200 ) ( ON ?auto_172198 ?auto_172199 ) ( ON ?auto_172197 ?auto_172198 ) ( ON ?auto_172196 ?auto_172197 ) ( ON ?auto_172195 ?auto_172196 ) ( ON ?auto_172194 ?auto_172195 ) ( ON ?auto_172193 ?auto_172194 ) ( ON ?auto_172192 ?auto_172193 ) ( ON ?auto_172191 ?auto_172192 ) ( ON ?auto_172190 ?auto_172191 ) ( CLEAR ?auto_172190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_172190 )
      ( MAKE-12PILE ?auto_172190 ?auto_172191 ?auto_172192 ?auto_172193 ?auto_172194 ?auto_172195 ?auto_172196 ?auto_172197 ?auto_172198 ?auto_172199 ?auto_172200 ?auto_172201 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_172215 - BLOCK
      ?auto_172216 - BLOCK
      ?auto_172217 - BLOCK
      ?auto_172218 - BLOCK
      ?auto_172219 - BLOCK
      ?auto_172220 - BLOCK
      ?auto_172221 - BLOCK
      ?auto_172222 - BLOCK
      ?auto_172223 - BLOCK
      ?auto_172224 - BLOCK
      ?auto_172225 - BLOCK
      ?auto_172226 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172226 ) ( not ( = ?auto_172215 ?auto_172216 ) ) ( not ( = ?auto_172215 ?auto_172217 ) ) ( not ( = ?auto_172215 ?auto_172218 ) ) ( not ( = ?auto_172215 ?auto_172219 ) ) ( not ( = ?auto_172215 ?auto_172220 ) ) ( not ( = ?auto_172215 ?auto_172221 ) ) ( not ( = ?auto_172215 ?auto_172222 ) ) ( not ( = ?auto_172215 ?auto_172223 ) ) ( not ( = ?auto_172215 ?auto_172224 ) ) ( not ( = ?auto_172215 ?auto_172225 ) ) ( not ( = ?auto_172215 ?auto_172226 ) ) ( not ( = ?auto_172216 ?auto_172217 ) ) ( not ( = ?auto_172216 ?auto_172218 ) ) ( not ( = ?auto_172216 ?auto_172219 ) ) ( not ( = ?auto_172216 ?auto_172220 ) ) ( not ( = ?auto_172216 ?auto_172221 ) ) ( not ( = ?auto_172216 ?auto_172222 ) ) ( not ( = ?auto_172216 ?auto_172223 ) ) ( not ( = ?auto_172216 ?auto_172224 ) ) ( not ( = ?auto_172216 ?auto_172225 ) ) ( not ( = ?auto_172216 ?auto_172226 ) ) ( not ( = ?auto_172217 ?auto_172218 ) ) ( not ( = ?auto_172217 ?auto_172219 ) ) ( not ( = ?auto_172217 ?auto_172220 ) ) ( not ( = ?auto_172217 ?auto_172221 ) ) ( not ( = ?auto_172217 ?auto_172222 ) ) ( not ( = ?auto_172217 ?auto_172223 ) ) ( not ( = ?auto_172217 ?auto_172224 ) ) ( not ( = ?auto_172217 ?auto_172225 ) ) ( not ( = ?auto_172217 ?auto_172226 ) ) ( not ( = ?auto_172218 ?auto_172219 ) ) ( not ( = ?auto_172218 ?auto_172220 ) ) ( not ( = ?auto_172218 ?auto_172221 ) ) ( not ( = ?auto_172218 ?auto_172222 ) ) ( not ( = ?auto_172218 ?auto_172223 ) ) ( not ( = ?auto_172218 ?auto_172224 ) ) ( not ( = ?auto_172218 ?auto_172225 ) ) ( not ( = ?auto_172218 ?auto_172226 ) ) ( not ( = ?auto_172219 ?auto_172220 ) ) ( not ( = ?auto_172219 ?auto_172221 ) ) ( not ( = ?auto_172219 ?auto_172222 ) ) ( not ( = ?auto_172219 ?auto_172223 ) ) ( not ( = ?auto_172219 ?auto_172224 ) ) ( not ( = ?auto_172219 ?auto_172225 ) ) ( not ( = ?auto_172219 ?auto_172226 ) ) ( not ( = ?auto_172220 ?auto_172221 ) ) ( not ( = ?auto_172220 ?auto_172222 ) ) ( not ( = ?auto_172220 ?auto_172223 ) ) ( not ( = ?auto_172220 ?auto_172224 ) ) ( not ( = ?auto_172220 ?auto_172225 ) ) ( not ( = ?auto_172220 ?auto_172226 ) ) ( not ( = ?auto_172221 ?auto_172222 ) ) ( not ( = ?auto_172221 ?auto_172223 ) ) ( not ( = ?auto_172221 ?auto_172224 ) ) ( not ( = ?auto_172221 ?auto_172225 ) ) ( not ( = ?auto_172221 ?auto_172226 ) ) ( not ( = ?auto_172222 ?auto_172223 ) ) ( not ( = ?auto_172222 ?auto_172224 ) ) ( not ( = ?auto_172222 ?auto_172225 ) ) ( not ( = ?auto_172222 ?auto_172226 ) ) ( not ( = ?auto_172223 ?auto_172224 ) ) ( not ( = ?auto_172223 ?auto_172225 ) ) ( not ( = ?auto_172223 ?auto_172226 ) ) ( not ( = ?auto_172224 ?auto_172225 ) ) ( not ( = ?auto_172224 ?auto_172226 ) ) ( not ( = ?auto_172225 ?auto_172226 ) ) ( ON ?auto_172225 ?auto_172226 ) ( ON ?auto_172224 ?auto_172225 ) ( ON ?auto_172223 ?auto_172224 ) ( ON ?auto_172222 ?auto_172223 ) ( ON ?auto_172221 ?auto_172222 ) ( ON ?auto_172220 ?auto_172221 ) ( ON ?auto_172219 ?auto_172220 ) ( ON ?auto_172218 ?auto_172219 ) ( ON ?auto_172217 ?auto_172218 ) ( ON ?auto_172216 ?auto_172217 ) ( ON ?auto_172215 ?auto_172216 ) ( CLEAR ?auto_172215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_172215 )
      ( MAKE-12PILE ?auto_172215 ?auto_172216 ?auto_172217 ?auto_172218 ?auto_172219 ?auto_172220 ?auto_172221 ?auto_172222 ?auto_172223 ?auto_172224 ?auto_172225 ?auto_172226 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_172239 - BLOCK
      ?auto_172240 - BLOCK
      ?auto_172241 - BLOCK
      ?auto_172242 - BLOCK
      ?auto_172243 - BLOCK
      ?auto_172244 - BLOCK
      ?auto_172245 - BLOCK
      ?auto_172246 - BLOCK
      ?auto_172247 - BLOCK
      ?auto_172248 - BLOCK
      ?auto_172249 - BLOCK
      ?auto_172250 - BLOCK
    )
    :vars
    (
      ?auto_172251 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172239 ?auto_172240 ) ) ( not ( = ?auto_172239 ?auto_172241 ) ) ( not ( = ?auto_172239 ?auto_172242 ) ) ( not ( = ?auto_172239 ?auto_172243 ) ) ( not ( = ?auto_172239 ?auto_172244 ) ) ( not ( = ?auto_172239 ?auto_172245 ) ) ( not ( = ?auto_172239 ?auto_172246 ) ) ( not ( = ?auto_172239 ?auto_172247 ) ) ( not ( = ?auto_172239 ?auto_172248 ) ) ( not ( = ?auto_172239 ?auto_172249 ) ) ( not ( = ?auto_172239 ?auto_172250 ) ) ( not ( = ?auto_172240 ?auto_172241 ) ) ( not ( = ?auto_172240 ?auto_172242 ) ) ( not ( = ?auto_172240 ?auto_172243 ) ) ( not ( = ?auto_172240 ?auto_172244 ) ) ( not ( = ?auto_172240 ?auto_172245 ) ) ( not ( = ?auto_172240 ?auto_172246 ) ) ( not ( = ?auto_172240 ?auto_172247 ) ) ( not ( = ?auto_172240 ?auto_172248 ) ) ( not ( = ?auto_172240 ?auto_172249 ) ) ( not ( = ?auto_172240 ?auto_172250 ) ) ( not ( = ?auto_172241 ?auto_172242 ) ) ( not ( = ?auto_172241 ?auto_172243 ) ) ( not ( = ?auto_172241 ?auto_172244 ) ) ( not ( = ?auto_172241 ?auto_172245 ) ) ( not ( = ?auto_172241 ?auto_172246 ) ) ( not ( = ?auto_172241 ?auto_172247 ) ) ( not ( = ?auto_172241 ?auto_172248 ) ) ( not ( = ?auto_172241 ?auto_172249 ) ) ( not ( = ?auto_172241 ?auto_172250 ) ) ( not ( = ?auto_172242 ?auto_172243 ) ) ( not ( = ?auto_172242 ?auto_172244 ) ) ( not ( = ?auto_172242 ?auto_172245 ) ) ( not ( = ?auto_172242 ?auto_172246 ) ) ( not ( = ?auto_172242 ?auto_172247 ) ) ( not ( = ?auto_172242 ?auto_172248 ) ) ( not ( = ?auto_172242 ?auto_172249 ) ) ( not ( = ?auto_172242 ?auto_172250 ) ) ( not ( = ?auto_172243 ?auto_172244 ) ) ( not ( = ?auto_172243 ?auto_172245 ) ) ( not ( = ?auto_172243 ?auto_172246 ) ) ( not ( = ?auto_172243 ?auto_172247 ) ) ( not ( = ?auto_172243 ?auto_172248 ) ) ( not ( = ?auto_172243 ?auto_172249 ) ) ( not ( = ?auto_172243 ?auto_172250 ) ) ( not ( = ?auto_172244 ?auto_172245 ) ) ( not ( = ?auto_172244 ?auto_172246 ) ) ( not ( = ?auto_172244 ?auto_172247 ) ) ( not ( = ?auto_172244 ?auto_172248 ) ) ( not ( = ?auto_172244 ?auto_172249 ) ) ( not ( = ?auto_172244 ?auto_172250 ) ) ( not ( = ?auto_172245 ?auto_172246 ) ) ( not ( = ?auto_172245 ?auto_172247 ) ) ( not ( = ?auto_172245 ?auto_172248 ) ) ( not ( = ?auto_172245 ?auto_172249 ) ) ( not ( = ?auto_172245 ?auto_172250 ) ) ( not ( = ?auto_172246 ?auto_172247 ) ) ( not ( = ?auto_172246 ?auto_172248 ) ) ( not ( = ?auto_172246 ?auto_172249 ) ) ( not ( = ?auto_172246 ?auto_172250 ) ) ( not ( = ?auto_172247 ?auto_172248 ) ) ( not ( = ?auto_172247 ?auto_172249 ) ) ( not ( = ?auto_172247 ?auto_172250 ) ) ( not ( = ?auto_172248 ?auto_172249 ) ) ( not ( = ?auto_172248 ?auto_172250 ) ) ( not ( = ?auto_172249 ?auto_172250 ) ) ( ON ?auto_172239 ?auto_172251 ) ( not ( = ?auto_172250 ?auto_172251 ) ) ( not ( = ?auto_172249 ?auto_172251 ) ) ( not ( = ?auto_172248 ?auto_172251 ) ) ( not ( = ?auto_172247 ?auto_172251 ) ) ( not ( = ?auto_172246 ?auto_172251 ) ) ( not ( = ?auto_172245 ?auto_172251 ) ) ( not ( = ?auto_172244 ?auto_172251 ) ) ( not ( = ?auto_172243 ?auto_172251 ) ) ( not ( = ?auto_172242 ?auto_172251 ) ) ( not ( = ?auto_172241 ?auto_172251 ) ) ( not ( = ?auto_172240 ?auto_172251 ) ) ( not ( = ?auto_172239 ?auto_172251 ) ) ( ON ?auto_172240 ?auto_172239 ) ( ON ?auto_172241 ?auto_172240 ) ( ON ?auto_172242 ?auto_172241 ) ( ON ?auto_172243 ?auto_172242 ) ( ON ?auto_172244 ?auto_172243 ) ( ON ?auto_172245 ?auto_172244 ) ( ON ?auto_172246 ?auto_172245 ) ( ON ?auto_172247 ?auto_172246 ) ( ON ?auto_172248 ?auto_172247 ) ( ON ?auto_172249 ?auto_172248 ) ( ON ?auto_172250 ?auto_172249 ) ( CLEAR ?auto_172250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_172250 ?auto_172249 ?auto_172248 ?auto_172247 ?auto_172246 ?auto_172245 ?auto_172244 ?auto_172243 ?auto_172242 ?auto_172241 ?auto_172240 ?auto_172239 )
      ( MAKE-12PILE ?auto_172239 ?auto_172240 ?auto_172241 ?auto_172242 ?auto_172243 ?auto_172244 ?auto_172245 ?auto_172246 ?auto_172247 ?auto_172248 ?auto_172249 ?auto_172250 ) )
  )

)

