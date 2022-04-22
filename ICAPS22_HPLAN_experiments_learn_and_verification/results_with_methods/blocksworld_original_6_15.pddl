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

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66651 - BLOCK
      ?auto_66652 - BLOCK
      ?auto_66653 - BLOCK
      ?auto_66654 - BLOCK
      ?auto_66655 - BLOCK
      ?auto_66656 - BLOCK
    )
    :vars
    (
      ?auto_66657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66657 ?auto_66656 ) ( CLEAR ?auto_66657 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66651 ) ( ON ?auto_66652 ?auto_66651 ) ( ON ?auto_66653 ?auto_66652 ) ( ON ?auto_66654 ?auto_66653 ) ( ON ?auto_66655 ?auto_66654 ) ( ON ?auto_66656 ?auto_66655 ) ( not ( = ?auto_66651 ?auto_66652 ) ) ( not ( = ?auto_66651 ?auto_66653 ) ) ( not ( = ?auto_66651 ?auto_66654 ) ) ( not ( = ?auto_66651 ?auto_66655 ) ) ( not ( = ?auto_66651 ?auto_66656 ) ) ( not ( = ?auto_66651 ?auto_66657 ) ) ( not ( = ?auto_66652 ?auto_66653 ) ) ( not ( = ?auto_66652 ?auto_66654 ) ) ( not ( = ?auto_66652 ?auto_66655 ) ) ( not ( = ?auto_66652 ?auto_66656 ) ) ( not ( = ?auto_66652 ?auto_66657 ) ) ( not ( = ?auto_66653 ?auto_66654 ) ) ( not ( = ?auto_66653 ?auto_66655 ) ) ( not ( = ?auto_66653 ?auto_66656 ) ) ( not ( = ?auto_66653 ?auto_66657 ) ) ( not ( = ?auto_66654 ?auto_66655 ) ) ( not ( = ?auto_66654 ?auto_66656 ) ) ( not ( = ?auto_66654 ?auto_66657 ) ) ( not ( = ?auto_66655 ?auto_66656 ) ) ( not ( = ?auto_66655 ?auto_66657 ) ) ( not ( = ?auto_66656 ?auto_66657 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66657 ?auto_66656 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_66659 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_66659 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_66659 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_66660 - BLOCK
    )
    :vars
    (
      ?auto_66661 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66660 ?auto_66661 ) ( CLEAR ?auto_66660 ) ( HAND-EMPTY ) ( not ( = ?auto_66660 ?auto_66661 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66660 ?auto_66661 )
      ( MAKE-1PILE ?auto_66660 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66667 - BLOCK
      ?auto_66668 - BLOCK
      ?auto_66669 - BLOCK
      ?auto_66670 - BLOCK
      ?auto_66671 - BLOCK
    )
    :vars
    (
      ?auto_66672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66672 ?auto_66671 ) ( CLEAR ?auto_66672 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66667 ) ( ON ?auto_66668 ?auto_66667 ) ( ON ?auto_66669 ?auto_66668 ) ( ON ?auto_66670 ?auto_66669 ) ( ON ?auto_66671 ?auto_66670 ) ( not ( = ?auto_66667 ?auto_66668 ) ) ( not ( = ?auto_66667 ?auto_66669 ) ) ( not ( = ?auto_66667 ?auto_66670 ) ) ( not ( = ?auto_66667 ?auto_66671 ) ) ( not ( = ?auto_66667 ?auto_66672 ) ) ( not ( = ?auto_66668 ?auto_66669 ) ) ( not ( = ?auto_66668 ?auto_66670 ) ) ( not ( = ?auto_66668 ?auto_66671 ) ) ( not ( = ?auto_66668 ?auto_66672 ) ) ( not ( = ?auto_66669 ?auto_66670 ) ) ( not ( = ?auto_66669 ?auto_66671 ) ) ( not ( = ?auto_66669 ?auto_66672 ) ) ( not ( = ?auto_66670 ?auto_66671 ) ) ( not ( = ?auto_66670 ?auto_66672 ) ) ( not ( = ?auto_66671 ?auto_66672 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66672 ?auto_66671 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66673 - BLOCK
      ?auto_66674 - BLOCK
      ?auto_66675 - BLOCK
      ?auto_66676 - BLOCK
      ?auto_66677 - BLOCK
    )
    :vars
    (
      ?auto_66678 - BLOCK
      ?auto_66679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66678 ?auto_66677 ) ( CLEAR ?auto_66678 ) ( ON-TABLE ?auto_66673 ) ( ON ?auto_66674 ?auto_66673 ) ( ON ?auto_66675 ?auto_66674 ) ( ON ?auto_66676 ?auto_66675 ) ( ON ?auto_66677 ?auto_66676 ) ( not ( = ?auto_66673 ?auto_66674 ) ) ( not ( = ?auto_66673 ?auto_66675 ) ) ( not ( = ?auto_66673 ?auto_66676 ) ) ( not ( = ?auto_66673 ?auto_66677 ) ) ( not ( = ?auto_66673 ?auto_66678 ) ) ( not ( = ?auto_66674 ?auto_66675 ) ) ( not ( = ?auto_66674 ?auto_66676 ) ) ( not ( = ?auto_66674 ?auto_66677 ) ) ( not ( = ?auto_66674 ?auto_66678 ) ) ( not ( = ?auto_66675 ?auto_66676 ) ) ( not ( = ?auto_66675 ?auto_66677 ) ) ( not ( = ?auto_66675 ?auto_66678 ) ) ( not ( = ?auto_66676 ?auto_66677 ) ) ( not ( = ?auto_66676 ?auto_66678 ) ) ( not ( = ?auto_66677 ?auto_66678 ) ) ( HOLDING ?auto_66679 ) ( not ( = ?auto_66673 ?auto_66679 ) ) ( not ( = ?auto_66674 ?auto_66679 ) ) ( not ( = ?auto_66675 ?auto_66679 ) ) ( not ( = ?auto_66676 ?auto_66679 ) ) ( not ( = ?auto_66677 ?auto_66679 ) ) ( not ( = ?auto_66678 ?auto_66679 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_66679 )
      ( MAKE-5PILE ?auto_66673 ?auto_66674 ?auto_66675 ?auto_66676 ?auto_66677 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66680 - BLOCK
      ?auto_66681 - BLOCK
      ?auto_66682 - BLOCK
      ?auto_66683 - BLOCK
      ?auto_66684 - BLOCK
    )
    :vars
    (
      ?auto_66686 - BLOCK
      ?auto_66685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66686 ?auto_66684 ) ( ON-TABLE ?auto_66680 ) ( ON ?auto_66681 ?auto_66680 ) ( ON ?auto_66682 ?auto_66681 ) ( ON ?auto_66683 ?auto_66682 ) ( ON ?auto_66684 ?auto_66683 ) ( not ( = ?auto_66680 ?auto_66681 ) ) ( not ( = ?auto_66680 ?auto_66682 ) ) ( not ( = ?auto_66680 ?auto_66683 ) ) ( not ( = ?auto_66680 ?auto_66684 ) ) ( not ( = ?auto_66680 ?auto_66686 ) ) ( not ( = ?auto_66681 ?auto_66682 ) ) ( not ( = ?auto_66681 ?auto_66683 ) ) ( not ( = ?auto_66681 ?auto_66684 ) ) ( not ( = ?auto_66681 ?auto_66686 ) ) ( not ( = ?auto_66682 ?auto_66683 ) ) ( not ( = ?auto_66682 ?auto_66684 ) ) ( not ( = ?auto_66682 ?auto_66686 ) ) ( not ( = ?auto_66683 ?auto_66684 ) ) ( not ( = ?auto_66683 ?auto_66686 ) ) ( not ( = ?auto_66684 ?auto_66686 ) ) ( not ( = ?auto_66680 ?auto_66685 ) ) ( not ( = ?auto_66681 ?auto_66685 ) ) ( not ( = ?auto_66682 ?auto_66685 ) ) ( not ( = ?auto_66683 ?auto_66685 ) ) ( not ( = ?auto_66684 ?auto_66685 ) ) ( not ( = ?auto_66686 ?auto_66685 ) ) ( ON ?auto_66685 ?auto_66686 ) ( CLEAR ?auto_66685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_66680 ?auto_66681 ?auto_66682 ?auto_66683 ?auto_66684 ?auto_66686 )
      ( MAKE-5PILE ?auto_66680 ?auto_66681 ?auto_66682 ?auto_66683 ?auto_66684 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66689 - BLOCK
      ?auto_66690 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_66690 ) ( CLEAR ?auto_66689 ) ( ON-TABLE ?auto_66689 ) ( not ( = ?auto_66689 ?auto_66690 ) ) )
    :subtasks
    ( ( !STACK ?auto_66690 ?auto_66689 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66691 - BLOCK
      ?auto_66692 - BLOCK
    )
    :vars
    (
      ?auto_66693 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_66691 ) ( ON-TABLE ?auto_66691 ) ( not ( = ?auto_66691 ?auto_66692 ) ) ( ON ?auto_66692 ?auto_66693 ) ( CLEAR ?auto_66692 ) ( HAND-EMPTY ) ( not ( = ?auto_66691 ?auto_66693 ) ) ( not ( = ?auto_66692 ?auto_66693 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66692 ?auto_66693 )
      ( MAKE-2PILE ?auto_66691 ?auto_66692 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66694 - BLOCK
      ?auto_66695 - BLOCK
    )
    :vars
    (
      ?auto_66696 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66694 ?auto_66695 ) ) ( ON ?auto_66695 ?auto_66696 ) ( CLEAR ?auto_66695 ) ( not ( = ?auto_66694 ?auto_66696 ) ) ( not ( = ?auto_66695 ?auto_66696 ) ) ( HOLDING ?auto_66694 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66694 )
      ( MAKE-2PILE ?auto_66694 ?auto_66695 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66697 - BLOCK
      ?auto_66698 - BLOCK
    )
    :vars
    (
      ?auto_66699 - BLOCK
      ?auto_66702 - BLOCK
      ?auto_66700 - BLOCK
      ?auto_66703 - BLOCK
      ?auto_66701 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66697 ?auto_66698 ) ) ( ON ?auto_66698 ?auto_66699 ) ( not ( = ?auto_66697 ?auto_66699 ) ) ( not ( = ?auto_66698 ?auto_66699 ) ) ( ON ?auto_66697 ?auto_66698 ) ( CLEAR ?auto_66697 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66702 ) ( ON ?auto_66700 ?auto_66702 ) ( ON ?auto_66703 ?auto_66700 ) ( ON ?auto_66701 ?auto_66703 ) ( ON ?auto_66699 ?auto_66701 ) ( not ( = ?auto_66702 ?auto_66700 ) ) ( not ( = ?auto_66702 ?auto_66703 ) ) ( not ( = ?auto_66702 ?auto_66701 ) ) ( not ( = ?auto_66702 ?auto_66699 ) ) ( not ( = ?auto_66702 ?auto_66698 ) ) ( not ( = ?auto_66702 ?auto_66697 ) ) ( not ( = ?auto_66700 ?auto_66703 ) ) ( not ( = ?auto_66700 ?auto_66701 ) ) ( not ( = ?auto_66700 ?auto_66699 ) ) ( not ( = ?auto_66700 ?auto_66698 ) ) ( not ( = ?auto_66700 ?auto_66697 ) ) ( not ( = ?auto_66703 ?auto_66701 ) ) ( not ( = ?auto_66703 ?auto_66699 ) ) ( not ( = ?auto_66703 ?auto_66698 ) ) ( not ( = ?auto_66703 ?auto_66697 ) ) ( not ( = ?auto_66701 ?auto_66699 ) ) ( not ( = ?auto_66701 ?auto_66698 ) ) ( not ( = ?auto_66701 ?auto_66697 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_66702 ?auto_66700 ?auto_66703 ?auto_66701 ?auto_66699 ?auto_66698 )
      ( MAKE-2PILE ?auto_66697 ?auto_66698 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66708 - BLOCK
      ?auto_66709 - BLOCK
      ?auto_66710 - BLOCK
      ?auto_66711 - BLOCK
    )
    :vars
    (
      ?auto_66712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66712 ?auto_66711 ) ( CLEAR ?auto_66712 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66708 ) ( ON ?auto_66709 ?auto_66708 ) ( ON ?auto_66710 ?auto_66709 ) ( ON ?auto_66711 ?auto_66710 ) ( not ( = ?auto_66708 ?auto_66709 ) ) ( not ( = ?auto_66708 ?auto_66710 ) ) ( not ( = ?auto_66708 ?auto_66711 ) ) ( not ( = ?auto_66708 ?auto_66712 ) ) ( not ( = ?auto_66709 ?auto_66710 ) ) ( not ( = ?auto_66709 ?auto_66711 ) ) ( not ( = ?auto_66709 ?auto_66712 ) ) ( not ( = ?auto_66710 ?auto_66711 ) ) ( not ( = ?auto_66710 ?auto_66712 ) ) ( not ( = ?auto_66711 ?auto_66712 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66712 ?auto_66711 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66713 - BLOCK
      ?auto_66714 - BLOCK
      ?auto_66715 - BLOCK
      ?auto_66716 - BLOCK
    )
    :vars
    (
      ?auto_66717 - BLOCK
      ?auto_66718 - BLOCK
      ?auto_66719 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66717 ?auto_66716 ) ( CLEAR ?auto_66717 ) ( ON-TABLE ?auto_66713 ) ( ON ?auto_66714 ?auto_66713 ) ( ON ?auto_66715 ?auto_66714 ) ( ON ?auto_66716 ?auto_66715 ) ( not ( = ?auto_66713 ?auto_66714 ) ) ( not ( = ?auto_66713 ?auto_66715 ) ) ( not ( = ?auto_66713 ?auto_66716 ) ) ( not ( = ?auto_66713 ?auto_66717 ) ) ( not ( = ?auto_66714 ?auto_66715 ) ) ( not ( = ?auto_66714 ?auto_66716 ) ) ( not ( = ?auto_66714 ?auto_66717 ) ) ( not ( = ?auto_66715 ?auto_66716 ) ) ( not ( = ?auto_66715 ?auto_66717 ) ) ( not ( = ?auto_66716 ?auto_66717 ) ) ( HOLDING ?auto_66718 ) ( CLEAR ?auto_66719 ) ( not ( = ?auto_66713 ?auto_66718 ) ) ( not ( = ?auto_66713 ?auto_66719 ) ) ( not ( = ?auto_66714 ?auto_66718 ) ) ( not ( = ?auto_66714 ?auto_66719 ) ) ( not ( = ?auto_66715 ?auto_66718 ) ) ( not ( = ?auto_66715 ?auto_66719 ) ) ( not ( = ?auto_66716 ?auto_66718 ) ) ( not ( = ?auto_66716 ?auto_66719 ) ) ( not ( = ?auto_66717 ?auto_66718 ) ) ( not ( = ?auto_66717 ?auto_66719 ) ) ( not ( = ?auto_66718 ?auto_66719 ) ) )
    :subtasks
    ( ( !STACK ?auto_66718 ?auto_66719 )
      ( MAKE-4PILE ?auto_66713 ?auto_66714 ?auto_66715 ?auto_66716 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66720 - BLOCK
      ?auto_66721 - BLOCK
      ?auto_66722 - BLOCK
      ?auto_66723 - BLOCK
    )
    :vars
    (
      ?auto_66726 - BLOCK
      ?auto_66725 - BLOCK
      ?auto_66724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66726 ?auto_66723 ) ( ON-TABLE ?auto_66720 ) ( ON ?auto_66721 ?auto_66720 ) ( ON ?auto_66722 ?auto_66721 ) ( ON ?auto_66723 ?auto_66722 ) ( not ( = ?auto_66720 ?auto_66721 ) ) ( not ( = ?auto_66720 ?auto_66722 ) ) ( not ( = ?auto_66720 ?auto_66723 ) ) ( not ( = ?auto_66720 ?auto_66726 ) ) ( not ( = ?auto_66721 ?auto_66722 ) ) ( not ( = ?auto_66721 ?auto_66723 ) ) ( not ( = ?auto_66721 ?auto_66726 ) ) ( not ( = ?auto_66722 ?auto_66723 ) ) ( not ( = ?auto_66722 ?auto_66726 ) ) ( not ( = ?auto_66723 ?auto_66726 ) ) ( CLEAR ?auto_66725 ) ( not ( = ?auto_66720 ?auto_66724 ) ) ( not ( = ?auto_66720 ?auto_66725 ) ) ( not ( = ?auto_66721 ?auto_66724 ) ) ( not ( = ?auto_66721 ?auto_66725 ) ) ( not ( = ?auto_66722 ?auto_66724 ) ) ( not ( = ?auto_66722 ?auto_66725 ) ) ( not ( = ?auto_66723 ?auto_66724 ) ) ( not ( = ?auto_66723 ?auto_66725 ) ) ( not ( = ?auto_66726 ?auto_66724 ) ) ( not ( = ?auto_66726 ?auto_66725 ) ) ( not ( = ?auto_66724 ?auto_66725 ) ) ( ON ?auto_66724 ?auto_66726 ) ( CLEAR ?auto_66724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66720 ?auto_66721 ?auto_66722 ?auto_66723 ?auto_66726 )
      ( MAKE-4PILE ?auto_66720 ?auto_66721 ?auto_66722 ?auto_66723 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66727 - BLOCK
      ?auto_66728 - BLOCK
      ?auto_66729 - BLOCK
      ?auto_66730 - BLOCK
    )
    :vars
    (
      ?auto_66733 - BLOCK
      ?auto_66732 - BLOCK
      ?auto_66731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66733 ?auto_66730 ) ( ON-TABLE ?auto_66727 ) ( ON ?auto_66728 ?auto_66727 ) ( ON ?auto_66729 ?auto_66728 ) ( ON ?auto_66730 ?auto_66729 ) ( not ( = ?auto_66727 ?auto_66728 ) ) ( not ( = ?auto_66727 ?auto_66729 ) ) ( not ( = ?auto_66727 ?auto_66730 ) ) ( not ( = ?auto_66727 ?auto_66733 ) ) ( not ( = ?auto_66728 ?auto_66729 ) ) ( not ( = ?auto_66728 ?auto_66730 ) ) ( not ( = ?auto_66728 ?auto_66733 ) ) ( not ( = ?auto_66729 ?auto_66730 ) ) ( not ( = ?auto_66729 ?auto_66733 ) ) ( not ( = ?auto_66730 ?auto_66733 ) ) ( not ( = ?auto_66727 ?auto_66732 ) ) ( not ( = ?auto_66727 ?auto_66731 ) ) ( not ( = ?auto_66728 ?auto_66732 ) ) ( not ( = ?auto_66728 ?auto_66731 ) ) ( not ( = ?auto_66729 ?auto_66732 ) ) ( not ( = ?auto_66729 ?auto_66731 ) ) ( not ( = ?auto_66730 ?auto_66732 ) ) ( not ( = ?auto_66730 ?auto_66731 ) ) ( not ( = ?auto_66733 ?auto_66732 ) ) ( not ( = ?auto_66733 ?auto_66731 ) ) ( not ( = ?auto_66732 ?auto_66731 ) ) ( ON ?auto_66732 ?auto_66733 ) ( CLEAR ?auto_66732 ) ( HOLDING ?auto_66731 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66731 )
      ( MAKE-4PILE ?auto_66727 ?auto_66728 ?auto_66729 ?auto_66730 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66734 - BLOCK
      ?auto_66735 - BLOCK
      ?auto_66736 - BLOCK
      ?auto_66737 - BLOCK
    )
    :vars
    (
      ?auto_66740 - BLOCK
      ?auto_66738 - BLOCK
      ?auto_66739 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66740 ?auto_66737 ) ( ON-TABLE ?auto_66734 ) ( ON ?auto_66735 ?auto_66734 ) ( ON ?auto_66736 ?auto_66735 ) ( ON ?auto_66737 ?auto_66736 ) ( not ( = ?auto_66734 ?auto_66735 ) ) ( not ( = ?auto_66734 ?auto_66736 ) ) ( not ( = ?auto_66734 ?auto_66737 ) ) ( not ( = ?auto_66734 ?auto_66740 ) ) ( not ( = ?auto_66735 ?auto_66736 ) ) ( not ( = ?auto_66735 ?auto_66737 ) ) ( not ( = ?auto_66735 ?auto_66740 ) ) ( not ( = ?auto_66736 ?auto_66737 ) ) ( not ( = ?auto_66736 ?auto_66740 ) ) ( not ( = ?auto_66737 ?auto_66740 ) ) ( not ( = ?auto_66734 ?auto_66738 ) ) ( not ( = ?auto_66734 ?auto_66739 ) ) ( not ( = ?auto_66735 ?auto_66738 ) ) ( not ( = ?auto_66735 ?auto_66739 ) ) ( not ( = ?auto_66736 ?auto_66738 ) ) ( not ( = ?auto_66736 ?auto_66739 ) ) ( not ( = ?auto_66737 ?auto_66738 ) ) ( not ( = ?auto_66737 ?auto_66739 ) ) ( not ( = ?auto_66740 ?auto_66738 ) ) ( not ( = ?auto_66740 ?auto_66739 ) ) ( not ( = ?auto_66738 ?auto_66739 ) ) ( ON ?auto_66738 ?auto_66740 ) ( ON ?auto_66739 ?auto_66738 ) ( CLEAR ?auto_66739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_66734 ?auto_66735 ?auto_66736 ?auto_66737 ?auto_66740 ?auto_66738 )
      ( MAKE-4PILE ?auto_66734 ?auto_66735 ?auto_66736 ?auto_66737 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_66744 - BLOCK
      ?auto_66745 - BLOCK
      ?auto_66746 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_66746 ) ( CLEAR ?auto_66745 ) ( ON-TABLE ?auto_66744 ) ( ON ?auto_66745 ?auto_66744 ) ( not ( = ?auto_66744 ?auto_66745 ) ) ( not ( = ?auto_66744 ?auto_66746 ) ) ( not ( = ?auto_66745 ?auto_66746 ) ) )
    :subtasks
    ( ( !STACK ?auto_66746 ?auto_66745 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_66747 - BLOCK
      ?auto_66748 - BLOCK
      ?auto_66749 - BLOCK
    )
    :vars
    (
      ?auto_66750 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_66748 ) ( ON-TABLE ?auto_66747 ) ( ON ?auto_66748 ?auto_66747 ) ( not ( = ?auto_66747 ?auto_66748 ) ) ( not ( = ?auto_66747 ?auto_66749 ) ) ( not ( = ?auto_66748 ?auto_66749 ) ) ( ON ?auto_66749 ?auto_66750 ) ( CLEAR ?auto_66749 ) ( HAND-EMPTY ) ( not ( = ?auto_66747 ?auto_66750 ) ) ( not ( = ?auto_66748 ?auto_66750 ) ) ( not ( = ?auto_66749 ?auto_66750 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66749 ?auto_66750 )
      ( MAKE-3PILE ?auto_66747 ?auto_66748 ?auto_66749 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_66751 - BLOCK
      ?auto_66752 - BLOCK
      ?auto_66753 - BLOCK
    )
    :vars
    (
      ?auto_66754 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66751 ) ( not ( = ?auto_66751 ?auto_66752 ) ) ( not ( = ?auto_66751 ?auto_66753 ) ) ( not ( = ?auto_66752 ?auto_66753 ) ) ( ON ?auto_66753 ?auto_66754 ) ( CLEAR ?auto_66753 ) ( not ( = ?auto_66751 ?auto_66754 ) ) ( not ( = ?auto_66752 ?auto_66754 ) ) ( not ( = ?auto_66753 ?auto_66754 ) ) ( HOLDING ?auto_66752 ) ( CLEAR ?auto_66751 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66751 ?auto_66752 )
      ( MAKE-3PILE ?auto_66751 ?auto_66752 ?auto_66753 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_66755 - BLOCK
      ?auto_66756 - BLOCK
      ?auto_66757 - BLOCK
    )
    :vars
    (
      ?auto_66758 - BLOCK
      ?auto_66761 - BLOCK
      ?auto_66760 - BLOCK
      ?auto_66759 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66755 ) ( not ( = ?auto_66755 ?auto_66756 ) ) ( not ( = ?auto_66755 ?auto_66757 ) ) ( not ( = ?auto_66756 ?auto_66757 ) ) ( ON ?auto_66757 ?auto_66758 ) ( not ( = ?auto_66755 ?auto_66758 ) ) ( not ( = ?auto_66756 ?auto_66758 ) ) ( not ( = ?auto_66757 ?auto_66758 ) ) ( CLEAR ?auto_66755 ) ( ON ?auto_66756 ?auto_66757 ) ( CLEAR ?auto_66756 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66761 ) ( ON ?auto_66760 ?auto_66761 ) ( ON ?auto_66759 ?auto_66760 ) ( ON ?auto_66758 ?auto_66759 ) ( not ( = ?auto_66761 ?auto_66760 ) ) ( not ( = ?auto_66761 ?auto_66759 ) ) ( not ( = ?auto_66761 ?auto_66758 ) ) ( not ( = ?auto_66761 ?auto_66757 ) ) ( not ( = ?auto_66761 ?auto_66756 ) ) ( not ( = ?auto_66760 ?auto_66759 ) ) ( not ( = ?auto_66760 ?auto_66758 ) ) ( not ( = ?auto_66760 ?auto_66757 ) ) ( not ( = ?auto_66760 ?auto_66756 ) ) ( not ( = ?auto_66759 ?auto_66758 ) ) ( not ( = ?auto_66759 ?auto_66757 ) ) ( not ( = ?auto_66759 ?auto_66756 ) ) ( not ( = ?auto_66755 ?auto_66761 ) ) ( not ( = ?auto_66755 ?auto_66760 ) ) ( not ( = ?auto_66755 ?auto_66759 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66761 ?auto_66760 ?auto_66759 ?auto_66758 ?auto_66757 )
      ( MAKE-3PILE ?auto_66755 ?auto_66756 ?auto_66757 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_66762 - BLOCK
      ?auto_66763 - BLOCK
      ?auto_66764 - BLOCK
    )
    :vars
    (
      ?auto_66766 - BLOCK
      ?auto_66767 - BLOCK
      ?auto_66765 - BLOCK
      ?auto_66768 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66762 ?auto_66763 ) ) ( not ( = ?auto_66762 ?auto_66764 ) ) ( not ( = ?auto_66763 ?auto_66764 ) ) ( ON ?auto_66764 ?auto_66766 ) ( not ( = ?auto_66762 ?auto_66766 ) ) ( not ( = ?auto_66763 ?auto_66766 ) ) ( not ( = ?auto_66764 ?auto_66766 ) ) ( ON ?auto_66763 ?auto_66764 ) ( CLEAR ?auto_66763 ) ( ON-TABLE ?auto_66767 ) ( ON ?auto_66765 ?auto_66767 ) ( ON ?auto_66768 ?auto_66765 ) ( ON ?auto_66766 ?auto_66768 ) ( not ( = ?auto_66767 ?auto_66765 ) ) ( not ( = ?auto_66767 ?auto_66768 ) ) ( not ( = ?auto_66767 ?auto_66766 ) ) ( not ( = ?auto_66767 ?auto_66764 ) ) ( not ( = ?auto_66767 ?auto_66763 ) ) ( not ( = ?auto_66765 ?auto_66768 ) ) ( not ( = ?auto_66765 ?auto_66766 ) ) ( not ( = ?auto_66765 ?auto_66764 ) ) ( not ( = ?auto_66765 ?auto_66763 ) ) ( not ( = ?auto_66768 ?auto_66766 ) ) ( not ( = ?auto_66768 ?auto_66764 ) ) ( not ( = ?auto_66768 ?auto_66763 ) ) ( not ( = ?auto_66762 ?auto_66767 ) ) ( not ( = ?auto_66762 ?auto_66765 ) ) ( not ( = ?auto_66762 ?auto_66768 ) ) ( HOLDING ?auto_66762 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66762 )
      ( MAKE-3PILE ?auto_66762 ?auto_66763 ?auto_66764 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_66769 - BLOCK
      ?auto_66770 - BLOCK
      ?auto_66771 - BLOCK
    )
    :vars
    (
      ?auto_66772 - BLOCK
      ?auto_66774 - BLOCK
      ?auto_66775 - BLOCK
      ?auto_66773 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66769 ?auto_66770 ) ) ( not ( = ?auto_66769 ?auto_66771 ) ) ( not ( = ?auto_66770 ?auto_66771 ) ) ( ON ?auto_66771 ?auto_66772 ) ( not ( = ?auto_66769 ?auto_66772 ) ) ( not ( = ?auto_66770 ?auto_66772 ) ) ( not ( = ?auto_66771 ?auto_66772 ) ) ( ON ?auto_66770 ?auto_66771 ) ( ON-TABLE ?auto_66774 ) ( ON ?auto_66775 ?auto_66774 ) ( ON ?auto_66773 ?auto_66775 ) ( ON ?auto_66772 ?auto_66773 ) ( not ( = ?auto_66774 ?auto_66775 ) ) ( not ( = ?auto_66774 ?auto_66773 ) ) ( not ( = ?auto_66774 ?auto_66772 ) ) ( not ( = ?auto_66774 ?auto_66771 ) ) ( not ( = ?auto_66774 ?auto_66770 ) ) ( not ( = ?auto_66775 ?auto_66773 ) ) ( not ( = ?auto_66775 ?auto_66772 ) ) ( not ( = ?auto_66775 ?auto_66771 ) ) ( not ( = ?auto_66775 ?auto_66770 ) ) ( not ( = ?auto_66773 ?auto_66772 ) ) ( not ( = ?auto_66773 ?auto_66771 ) ) ( not ( = ?auto_66773 ?auto_66770 ) ) ( not ( = ?auto_66769 ?auto_66774 ) ) ( not ( = ?auto_66769 ?auto_66775 ) ) ( not ( = ?auto_66769 ?auto_66773 ) ) ( ON ?auto_66769 ?auto_66770 ) ( CLEAR ?auto_66769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_66774 ?auto_66775 ?auto_66773 ?auto_66772 ?auto_66771 ?auto_66770 )
      ( MAKE-3PILE ?auto_66769 ?auto_66770 ?auto_66771 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_66779 - BLOCK
      ?auto_66780 - BLOCK
      ?auto_66781 - BLOCK
    )
    :vars
    (
      ?auto_66782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66782 ?auto_66781 ) ( CLEAR ?auto_66782 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66779 ) ( ON ?auto_66780 ?auto_66779 ) ( ON ?auto_66781 ?auto_66780 ) ( not ( = ?auto_66779 ?auto_66780 ) ) ( not ( = ?auto_66779 ?auto_66781 ) ) ( not ( = ?auto_66779 ?auto_66782 ) ) ( not ( = ?auto_66780 ?auto_66781 ) ) ( not ( = ?auto_66780 ?auto_66782 ) ) ( not ( = ?auto_66781 ?auto_66782 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66782 ?auto_66781 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_66783 - BLOCK
      ?auto_66784 - BLOCK
      ?auto_66785 - BLOCK
    )
    :vars
    (
      ?auto_66786 - BLOCK
      ?auto_66787 - BLOCK
      ?auto_66788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66786 ?auto_66785 ) ( CLEAR ?auto_66786 ) ( ON-TABLE ?auto_66783 ) ( ON ?auto_66784 ?auto_66783 ) ( ON ?auto_66785 ?auto_66784 ) ( not ( = ?auto_66783 ?auto_66784 ) ) ( not ( = ?auto_66783 ?auto_66785 ) ) ( not ( = ?auto_66783 ?auto_66786 ) ) ( not ( = ?auto_66784 ?auto_66785 ) ) ( not ( = ?auto_66784 ?auto_66786 ) ) ( not ( = ?auto_66785 ?auto_66786 ) ) ( HOLDING ?auto_66787 ) ( CLEAR ?auto_66788 ) ( not ( = ?auto_66783 ?auto_66787 ) ) ( not ( = ?auto_66783 ?auto_66788 ) ) ( not ( = ?auto_66784 ?auto_66787 ) ) ( not ( = ?auto_66784 ?auto_66788 ) ) ( not ( = ?auto_66785 ?auto_66787 ) ) ( not ( = ?auto_66785 ?auto_66788 ) ) ( not ( = ?auto_66786 ?auto_66787 ) ) ( not ( = ?auto_66786 ?auto_66788 ) ) ( not ( = ?auto_66787 ?auto_66788 ) ) )
    :subtasks
    ( ( !STACK ?auto_66787 ?auto_66788 )
      ( MAKE-3PILE ?auto_66783 ?auto_66784 ?auto_66785 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_66789 - BLOCK
      ?auto_66790 - BLOCK
      ?auto_66791 - BLOCK
    )
    :vars
    (
      ?auto_66794 - BLOCK
      ?auto_66793 - BLOCK
      ?auto_66792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66794 ?auto_66791 ) ( ON-TABLE ?auto_66789 ) ( ON ?auto_66790 ?auto_66789 ) ( ON ?auto_66791 ?auto_66790 ) ( not ( = ?auto_66789 ?auto_66790 ) ) ( not ( = ?auto_66789 ?auto_66791 ) ) ( not ( = ?auto_66789 ?auto_66794 ) ) ( not ( = ?auto_66790 ?auto_66791 ) ) ( not ( = ?auto_66790 ?auto_66794 ) ) ( not ( = ?auto_66791 ?auto_66794 ) ) ( CLEAR ?auto_66793 ) ( not ( = ?auto_66789 ?auto_66792 ) ) ( not ( = ?auto_66789 ?auto_66793 ) ) ( not ( = ?auto_66790 ?auto_66792 ) ) ( not ( = ?auto_66790 ?auto_66793 ) ) ( not ( = ?auto_66791 ?auto_66792 ) ) ( not ( = ?auto_66791 ?auto_66793 ) ) ( not ( = ?auto_66794 ?auto_66792 ) ) ( not ( = ?auto_66794 ?auto_66793 ) ) ( not ( = ?auto_66792 ?auto_66793 ) ) ( ON ?auto_66792 ?auto_66794 ) ( CLEAR ?auto_66792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66789 ?auto_66790 ?auto_66791 ?auto_66794 )
      ( MAKE-3PILE ?auto_66789 ?auto_66790 ?auto_66791 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_66795 - BLOCK
      ?auto_66796 - BLOCK
      ?auto_66797 - BLOCK
    )
    :vars
    (
      ?auto_66799 - BLOCK
      ?auto_66800 - BLOCK
      ?auto_66798 - BLOCK
      ?auto_66801 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66799 ?auto_66797 ) ( ON-TABLE ?auto_66795 ) ( ON ?auto_66796 ?auto_66795 ) ( ON ?auto_66797 ?auto_66796 ) ( not ( = ?auto_66795 ?auto_66796 ) ) ( not ( = ?auto_66795 ?auto_66797 ) ) ( not ( = ?auto_66795 ?auto_66799 ) ) ( not ( = ?auto_66796 ?auto_66797 ) ) ( not ( = ?auto_66796 ?auto_66799 ) ) ( not ( = ?auto_66797 ?auto_66799 ) ) ( not ( = ?auto_66795 ?auto_66800 ) ) ( not ( = ?auto_66795 ?auto_66798 ) ) ( not ( = ?auto_66796 ?auto_66800 ) ) ( not ( = ?auto_66796 ?auto_66798 ) ) ( not ( = ?auto_66797 ?auto_66800 ) ) ( not ( = ?auto_66797 ?auto_66798 ) ) ( not ( = ?auto_66799 ?auto_66800 ) ) ( not ( = ?auto_66799 ?auto_66798 ) ) ( not ( = ?auto_66800 ?auto_66798 ) ) ( ON ?auto_66800 ?auto_66799 ) ( CLEAR ?auto_66800 ) ( HOLDING ?auto_66798 ) ( CLEAR ?auto_66801 ) ( ON-TABLE ?auto_66801 ) ( not ( = ?auto_66801 ?auto_66798 ) ) ( not ( = ?auto_66795 ?auto_66801 ) ) ( not ( = ?auto_66796 ?auto_66801 ) ) ( not ( = ?auto_66797 ?auto_66801 ) ) ( not ( = ?auto_66799 ?auto_66801 ) ) ( not ( = ?auto_66800 ?auto_66801 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66801 ?auto_66798 )
      ( MAKE-3PILE ?auto_66795 ?auto_66796 ?auto_66797 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_66802 - BLOCK
      ?auto_66803 - BLOCK
      ?auto_66804 - BLOCK
    )
    :vars
    (
      ?auto_66808 - BLOCK
      ?auto_66807 - BLOCK
      ?auto_66805 - BLOCK
      ?auto_66806 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66808 ?auto_66804 ) ( ON-TABLE ?auto_66802 ) ( ON ?auto_66803 ?auto_66802 ) ( ON ?auto_66804 ?auto_66803 ) ( not ( = ?auto_66802 ?auto_66803 ) ) ( not ( = ?auto_66802 ?auto_66804 ) ) ( not ( = ?auto_66802 ?auto_66808 ) ) ( not ( = ?auto_66803 ?auto_66804 ) ) ( not ( = ?auto_66803 ?auto_66808 ) ) ( not ( = ?auto_66804 ?auto_66808 ) ) ( not ( = ?auto_66802 ?auto_66807 ) ) ( not ( = ?auto_66802 ?auto_66805 ) ) ( not ( = ?auto_66803 ?auto_66807 ) ) ( not ( = ?auto_66803 ?auto_66805 ) ) ( not ( = ?auto_66804 ?auto_66807 ) ) ( not ( = ?auto_66804 ?auto_66805 ) ) ( not ( = ?auto_66808 ?auto_66807 ) ) ( not ( = ?auto_66808 ?auto_66805 ) ) ( not ( = ?auto_66807 ?auto_66805 ) ) ( ON ?auto_66807 ?auto_66808 ) ( CLEAR ?auto_66806 ) ( ON-TABLE ?auto_66806 ) ( not ( = ?auto_66806 ?auto_66805 ) ) ( not ( = ?auto_66802 ?auto_66806 ) ) ( not ( = ?auto_66803 ?auto_66806 ) ) ( not ( = ?auto_66804 ?auto_66806 ) ) ( not ( = ?auto_66808 ?auto_66806 ) ) ( not ( = ?auto_66807 ?auto_66806 ) ) ( ON ?auto_66805 ?auto_66807 ) ( CLEAR ?auto_66805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66802 ?auto_66803 ?auto_66804 ?auto_66808 ?auto_66807 )
      ( MAKE-3PILE ?auto_66802 ?auto_66803 ?auto_66804 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_66809 - BLOCK
      ?auto_66810 - BLOCK
      ?auto_66811 - BLOCK
    )
    :vars
    (
      ?auto_66813 - BLOCK
      ?auto_66812 - BLOCK
      ?auto_66815 - BLOCK
      ?auto_66814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66813 ?auto_66811 ) ( ON-TABLE ?auto_66809 ) ( ON ?auto_66810 ?auto_66809 ) ( ON ?auto_66811 ?auto_66810 ) ( not ( = ?auto_66809 ?auto_66810 ) ) ( not ( = ?auto_66809 ?auto_66811 ) ) ( not ( = ?auto_66809 ?auto_66813 ) ) ( not ( = ?auto_66810 ?auto_66811 ) ) ( not ( = ?auto_66810 ?auto_66813 ) ) ( not ( = ?auto_66811 ?auto_66813 ) ) ( not ( = ?auto_66809 ?auto_66812 ) ) ( not ( = ?auto_66809 ?auto_66815 ) ) ( not ( = ?auto_66810 ?auto_66812 ) ) ( not ( = ?auto_66810 ?auto_66815 ) ) ( not ( = ?auto_66811 ?auto_66812 ) ) ( not ( = ?auto_66811 ?auto_66815 ) ) ( not ( = ?auto_66813 ?auto_66812 ) ) ( not ( = ?auto_66813 ?auto_66815 ) ) ( not ( = ?auto_66812 ?auto_66815 ) ) ( ON ?auto_66812 ?auto_66813 ) ( not ( = ?auto_66814 ?auto_66815 ) ) ( not ( = ?auto_66809 ?auto_66814 ) ) ( not ( = ?auto_66810 ?auto_66814 ) ) ( not ( = ?auto_66811 ?auto_66814 ) ) ( not ( = ?auto_66813 ?auto_66814 ) ) ( not ( = ?auto_66812 ?auto_66814 ) ) ( ON ?auto_66815 ?auto_66812 ) ( CLEAR ?auto_66815 ) ( HOLDING ?auto_66814 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66814 )
      ( MAKE-3PILE ?auto_66809 ?auto_66810 ?auto_66811 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_66816 - BLOCK
      ?auto_66817 - BLOCK
      ?auto_66818 - BLOCK
    )
    :vars
    (
      ?auto_66822 - BLOCK
      ?auto_66821 - BLOCK
      ?auto_66820 - BLOCK
      ?auto_66819 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66822 ?auto_66818 ) ( ON-TABLE ?auto_66816 ) ( ON ?auto_66817 ?auto_66816 ) ( ON ?auto_66818 ?auto_66817 ) ( not ( = ?auto_66816 ?auto_66817 ) ) ( not ( = ?auto_66816 ?auto_66818 ) ) ( not ( = ?auto_66816 ?auto_66822 ) ) ( not ( = ?auto_66817 ?auto_66818 ) ) ( not ( = ?auto_66817 ?auto_66822 ) ) ( not ( = ?auto_66818 ?auto_66822 ) ) ( not ( = ?auto_66816 ?auto_66821 ) ) ( not ( = ?auto_66816 ?auto_66820 ) ) ( not ( = ?auto_66817 ?auto_66821 ) ) ( not ( = ?auto_66817 ?auto_66820 ) ) ( not ( = ?auto_66818 ?auto_66821 ) ) ( not ( = ?auto_66818 ?auto_66820 ) ) ( not ( = ?auto_66822 ?auto_66821 ) ) ( not ( = ?auto_66822 ?auto_66820 ) ) ( not ( = ?auto_66821 ?auto_66820 ) ) ( ON ?auto_66821 ?auto_66822 ) ( not ( = ?auto_66819 ?auto_66820 ) ) ( not ( = ?auto_66816 ?auto_66819 ) ) ( not ( = ?auto_66817 ?auto_66819 ) ) ( not ( = ?auto_66818 ?auto_66819 ) ) ( not ( = ?auto_66822 ?auto_66819 ) ) ( not ( = ?auto_66821 ?auto_66819 ) ) ( ON ?auto_66820 ?auto_66821 ) ( ON ?auto_66819 ?auto_66820 ) ( CLEAR ?auto_66819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_66816 ?auto_66817 ?auto_66818 ?auto_66822 ?auto_66821 ?auto_66820 )
      ( MAKE-3PILE ?auto_66816 ?auto_66817 ?auto_66818 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66827 - BLOCK
      ?auto_66828 - BLOCK
      ?auto_66829 - BLOCK
      ?auto_66830 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_66830 ) ( CLEAR ?auto_66829 ) ( ON-TABLE ?auto_66827 ) ( ON ?auto_66828 ?auto_66827 ) ( ON ?auto_66829 ?auto_66828 ) ( not ( = ?auto_66827 ?auto_66828 ) ) ( not ( = ?auto_66827 ?auto_66829 ) ) ( not ( = ?auto_66827 ?auto_66830 ) ) ( not ( = ?auto_66828 ?auto_66829 ) ) ( not ( = ?auto_66828 ?auto_66830 ) ) ( not ( = ?auto_66829 ?auto_66830 ) ) )
    :subtasks
    ( ( !STACK ?auto_66830 ?auto_66829 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66831 - BLOCK
      ?auto_66832 - BLOCK
      ?auto_66833 - BLOCK
      ?auto_66834 - BLOCK
    )
    :vars
    (
      ?auto_66835 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_66833 ) ( ON-TABLE ?auto_66831 ) ( ON ?auto_66832 ?auto_66831 ) ( ON ?auto_66833 ?auto_66832 ) ( not ( = ?auto_66831 ?auto_66832 ) ) ( not ( = ?auto_66831 ?auto_66833 ) ) ( not ( = ?auto_66831 ?auto_66834 ) ) ( not ( = ?auto_66832 ?auto_66833 ) ) ( not ( = ?auto_66832 ?auto_66834 ) ) ( not ( = ?auto_66833 ?auto_66834 ) ) ( ON ?auto_66834 ?auto_66835 ) ( CLEAR ?auto_66834 ) ( HAND-EMPTY ) ( not ( = ?auto_66831 ?auto_66835 ) ) ( not ( = ?auto_66832 ?auto_66835 ) ) ( not ( = ?auto_66833 ?auto_66835 ) ) ( not ( = ?auto_66834 ?auto_66835 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66834 ?auto_66835 )
      ( MAKE-4PILE ?auto_66831 ?auto_66832 ?auto_66833 ?auto_66834 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66836 - BLOCK
      ?auto_66837 - BLOCK
      ?auto_66838 - BLOCK
      ?auto_66839 - BLOCK
    )
    :vars
    (
      ?auto_66840 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66836 ) ( ON ?auto_66837 ?auto_66836 ) ( not ( = ?auto_66836 ?auto_66837 ) ) ( not ( = ?auto_66836 ?auto_66838 ) ) ( not ( = ?auto_66836 ?auto_66839 ) ) ( not ( = ?auto_66837 ?auto_66838 ) ) ( not ( = ?auto_66837 ?auto_66839 ) ) ( not ( = ?auto_66838 ?auto_66839 ) ) ( ON ?auto_66839 ?auto_66840 ) ( CLEAR ?auto_66839 ) ( not ( = ?auto_66836 ?auto_66840 ) ) ( not ( = ?auto_66837 ?auto_66840 ) ) ( not ( = ?auto_66838 ?auto_66840 ) ) ( not ( = ?auto_66839 ?auto_66840 ) ) ( HOLDING ?auto_66838 ) ( CLEAR ?auto_66837 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66836 ?auto_66837 ?auto_66838 )
      ( MAKE-4PILE ?auto_66836 ?auto_66837 ?auto_66838 ?auto_66839 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66841 - BLOCK
      ?auto_66842 - BLOCK
      ?auto_66843 - BLOCK
      ?auto_66844 - BLOCK
    )
    :vars
    (
      ?auto_66845 - BLOCK
      ?auto_66846 - BLOCK
      ?auto_66847 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66841 ) ( ON ?auto_66842 ?auto_66841 ) ( not ( = ?auto_66841 ?auto_66842 ) ) ( not ( = ?auto_66841 ?auto_66843 ) ) ( not ( = ?auto_66841 ?auto_66844 ) ) ( not ( = ?auto_66842 ?auto_66843 ) ) ( not ( = ?auto_66842 ?auto_66844 ) ) ( not ( = ?auto_66843 ?auto_66844 ) ) ( ON ?auto_66844 ?auto_66845 ) ( not ( = ?auto_66841 ?auto_66845 ) ) ( not ( = ?auto_66842 ?auto_66845 ) ) ( not ( = ?auto_66843 ?auto_66845 ) ) ( not ( = ?auto_66844 ?auto_66845 ) ) ( CLEAR ?auto_66842 ) ( ON ?auto_66843 ?auto_66844 ) ( CLEAR ?auto_66843 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66846 ) ( ON ?auto_66847 ?auto_66846 ) ( ON ?auto_66845 ?auto_66847 ) ( not ( = ?auto_66846 ?auto_66847 ) ) ( not ( = ?auto_66846 ?auto_66845 ) ) ( not ( = ?auto_66846 ?auto_66844 ) ) ( not ( = ?auto_66846 ?auto_66843 ) ) ( not ( = ?auto_66847 ?auto_66845 ) ) ( not ( = ?auto_66847 ?auto_66844 ) ) ( not ( = ?auto_66847 ?auto_66843 ) ) ( not ( = ?auto_66841 ?auto_66846 ) ) ( not ( = ?auto_66841 ?auto_66847 ) ) ( not ( = ?auto_66842 ?auto_66846 ) ) ( not ( = ?auto_66842 ?auto_66847 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66846 ?auto_66847 ?auto_66845 ?auto_66844 )
      ( MAKE-4PILE ?auto_66841 ?auto_66842 ?auto_66843 ?auto_66844 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66848 - BLOCK
      ?auto_66849 - BLOCK
      ?auto_66850 - BLOCK
      ?auto_66851 - BLOCK
    )
    :vars
    (
      ?auto_66854 - BLOCK
      ?auto_66853 - BLOCK
      ?auto_66852 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66848 ) ( not ( = ?auto_66848 ?auto_66849 ) ) ( not ( = ?auto_66848 ?auto_66850 ) ) ( not ( = ?auto_66848 ?auto_66851 ) ) ( not ( = ?auto_66849 ?auto_66850 ) ) ( not ( = ?auto_66849 ?auto_66851 ) ) ( not ( = ?auto_66850 ?auto_66851 ) ) ( ON ?auto_66851 ?auto_66854 ) ( not ( = ?auto_66848 ?auto_66854 ) ) ( not ( = ?auto_66849 ?auto_66854 ) ) ( not ( = ?auto_66850 ?auto_66854 ) ) ( not ( = ?auto_66851 ?auto_66854 ) ) ( ON ?auto_66850 ?auto_66851 ) ( CLEAR ?auto_66850 ) ( ON-TABLE ?auto_66853 ) ( ON ?auto_66852 ?auto_66853 ) ( ON ?auto_66854 ?auto_66852 ) ( not ( = ?auto_66853 ?auto_66852 ) ) ( not ( = ?auto_66853 ?auto_66854 ) ) ( not ( = ?auto_66853 ?auto_66851 ) ) ( not ( = ?auto_66853 ?auto_66850 ) ) ( not ( = ?auto_66852 ?auto_66854 ) ) ( not ( = ?auto_66852 ?auto_66851 ) ) ( not ( = ?auto_66852 ?auto_66850 ) ) ( not ( = ?auto_66848 ?auto_66853 ) ) ( not ( = ?auto_66848 ?auto_66852 ) ) ( not ( = ?auto_66849 ?auto_66853 ) ) ( not ( = ?auto_66849 ?auto_66852 ) ) ( HOLDING ?auto_66849 ) ( CLEAR ?auto_66848 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66848 ?auto_66849 )
      ( MAKE-4PILE ?auto_66848 ?auto_66849 ?auto_66850 ?auto_66851 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66855 - BLOCK
      ?auto_66856 - BLOCK
      ?auto_66857 - BLOCK
      ?auto_66858 - BLOCK
    )
    :vars
    (
      ?auto_66860 - BLOCK
      ?auto_66861 - BLOCK
      ?auto_66859 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66855 ) ( not ( = ?auto_66855 ?auto_66856 ) ) ( not ( = ?auto_66855 ?auto_66857 ) ) ( not ( = ?auto_66855 ?auto_66858 ) ) ( not ( = ?auto_66856 ?auto_66857 ) ) ( not ( = ?auto_66856 ?auto_66858 ) ) ( not ( = ?auto_66857 ?auto_66858 ) ) ( ON ?auto_66858 ?auto_66860 ) ( not ( = ?auto_66855 ?auto_66860 ) ) ( not ( = ?auto_66856 ?auto_66860 ) ) ( not ( = ?auto_66857 ?auto_66860 ) ) ( not ( = ?auto_66858 ?auto_66860 ) ) ( ON ?auto_66857 ?auto_66858 ) ( ON-TABLE ?auto_66861 ) ( ON ?auto_66859 ?auto_66861 ) ( ON ?auto_66860 ?auto_66859 ) ( not ( = ?auto_66861 ?auto_66859 ) ) ( not ( = ?auto_66861 ?auto_66860 ) ) ( not ( = ?auto_66861 ?auto_66858 ) ) ( not ( = ?auto_66861 ?auto_66857 ) ) ( not ( = ?auto_66859 ?auto_66860 ) ) ( not ( = ?auto_66859 ?auto_66858 ) ) ( not ( = ?auto_66859 ?auto_66857 ) ) ( not ( = ?auto_66855 ?auto_66861 ) ) ( not ( = ?auto_66855 ?auto_66859 ) ) ( not ( = ?auto_66856 ?auto_66861 ) ) ( not ( = ?auto_66856 ?auto_66859 ) ) ( CLEAR ?auto_66855 ) ( ON ?auto_66856 ?auto_66857 ) ( CLEAR ?auto_66856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66861 ?auto_66859 ?auto_66860 ?auto_66858 ?auto_66857 )
      ( MAKE-4PILE ?auto_66855 ?auto_66856 ?auto_66857 ?auto_66858 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66862 - BLOCK
      ?auto_66863 - BLOCK
      ?auto_66864 - BLOCK
      ?auto_66865 - BLOCK
    )
    :vars
    (
      ?auto_66867 - BLOCK
      ?auto_66866 - BLOCK
      ?auto_66868 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66862 ?auto_66863 ) ) ( not ( = ?auto_66862 ?auto_66864 ) ) ( not ( = ?auto_66862 ?auto_66865 ) ) ( not ( = ?auto_66863 ?auto_66864 ) ) ( not ( = ?auto_66863 ?auto_66865 ) ) ( not ( = ?auto_66864 ?auto_66865 ) ) ( ON ?auto_66865 ?auto_66867 ) ( not ( = ?auto_66862 ?auto_66867 ) ) ( not ( = ?auto_66863 ?auto_66867 ) ) ( not ( = ?auto_66864 ?auto_66867 ) ) ( not ( = ?auto_66865 ?auto_66867 ) ) ( ON ?auto_66864 ?auto_66865 ) ( ON-TABLE ?auto_66866 ) ( ON ?auto_66868 ?auto_66866 ) ( ON ?auto_66867 ?auto_66868 ) ( not ( = ?auto_66866 ?auto_66868 ) ) ( not ( = ?auto_66866 ?auto_66867 ) ) ( not ( = ?auto_66866 ?auto_66865 ) ) ( not ( = ?auto_66866 ?auto_66864 ) ) ( not ( = ?auto_66868 ?auto_66867 ) ) ( not ( = ?auto_66868 ?auto_66865 ) ) ( not ( = ?auto_66868 ?auto_66864 ) ) ( not ( = ?auto_66862 ?auto_66866 ) ) ( not ( = ?auto_66862 ?auto_66868 ) ) ( not ( = ?auto_66863 ?auto_66866 ) ) ( not ( = ?auto_66863 ?auto_66868 ) ) ( ON ?auto_66863 ?auto_66864 ) ( CLEAR ?auto_66863 ) ( HOLDING ?auto_66862 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66862 )
      ( MAKE-4PILE ?auto_66862 ?auto_66863 ?auto_66864 ?auto_66865 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66869 - BLOCK
      ?auto_66870 - BLOCK
      ?auto_66871 - BLOCK
      ?auto_66872 - BLOCK
    )
    :vars
    (
      ?auto_66874 - BLOCK
      ?auto_66875 - BLOCK
      ?auto_66873 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66869 ?auto_66870 ) ) ( not ( = ?auto_66869 ?auto_66871 ) ) ( not ( = ?auto_66869 ?auto_66872 ) ) ( not ( = ?auto_66870 ?auto_66871 ) ) ( not ( = ?auto_66870 ?auto_66872 ) ) ( not ( = ?auto_66871 ?auto_66872 ) ) ( ON ?auto_66872 ?auto_66874 ) ( not ( = ?auto_66869 ?auto_66874 ) ) ( not ( = ?auto_66870 ?auto_66874 ) ) ( not ( = ?auto_66871 ?auto_66874 ) ) ( not ( = ?auto_66872 ?auto_66874 ) ) ( ON ?auto_66871 ?auto_66872 ) ( ON-TABLE ?auto_66875 ) ( ON ?auto_66873 ?auto_66875 ) ( ON ?auto_66874 ?auto_66873 ) ( not ( = ?auto_66875 ?auto_66873 ) ) ( not ( = ?auto_66875 ?auto_66874 ) ) ( not ( = ?auto_66875 ?auto_66872 ) ) ( not ( = ?auto_66875 ?auto_66871 ) ) ( not ( = ?auto_66873 ?auto_66874 ) ) ( not ( = ?auto_66873 ?auto_66872 ) ) ( not ( = ?auto_66873 ?auto_66871 ) ) ( not ( = ?auto_66869 ?auto_66875 ) ) ( not ( = ?auto_66869 ?auto_66873 ) ) ( not ( = ?auto_66870 ?auto_66875 ) ) ( not ( = ?auto_66870 ?auto_66873 ) ) ( ON ?auto_66870 ?auto_66871 ) ( ON ?auto_66869 ?auto_66870 ) ( CLEAR ?auto_66869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_66875 ?auto_66873 ?auto_66874 ?auto_66872 ?auto_66871 ?auto_66870 )
      ( MAKE-4PILE ?auto_66869 ?auto_66870 ?auto_66871 ?auto_66872 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66878 - BLOCK
      ?auto_66879 - BLOCK
    )
    :vars
    (
      ?auto_66880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66880 ?auto_66879 ) ( CLEAR ?auto_66880 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66878 ) ( ON ?auto_66879 ?auto_66878 ) ( not ( = ?auto_66878 ?auto_66879 ) ) ( not ( = ?auto_66878 ?auto_66880 ) ) ( not ( = ?auto_66879 ?auto_66880 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66880 ?auto_66879 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66881 - BLOCK
      ?auto_66882 - BLOCK
    )
    :vars
    (
      ?auto_66883 - BLOCK
      ?auto_66884 - BLOCK
      ?auto_66885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66883 ?auto_66882 ) ( CLEAR ?auto_66883 ) ( ON-TABLE ?auto_66881 ) ( ON ?auto_66882 ?auto_66881 ) ( not ( = ?auto_66881 ?auto_66882 ) ) ( not ( = ?auto_66881 ?auto_66883 ) ) ( not ( = ?auto_66882 ?auto_66883 ) ) ( HOLDING ?auto_66884 ) ( CLEAR ?auto_66885 ) ( not ( = ?auto_66881 ?auto_66884 ) ) ( not ( = ?auto_66881 ?auto_66885 ) ) ( not ( = ?auto_66882 ?auto_66884 ) ) ( not ( = ?auto_66882 ?auto_66885 ) ) ( not ( = ?auto_66883 ?auto_66884 ) ) ( not ( = ?auto_66883 ?auto_66885 ) ) ( not ( = ?auto_66884 ?auto_66885 ) ) )
    :subtasks
    ( ( !STACK ?auto_66884 ?auto_66885 )
      ( MAKE-2PILE ?auto_66881 ?auto_66882 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66886 - BLOCK
      ?auto_66887 - BLOCK
    )
    :vars
    (
      ?auto_66888 - BLOCK
      ?auto_66890 - BLOCK
      ?auto_66889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66888 ?auto_66887 ) ( ON-TABLE ?auto_66886 ) ( ON ?auto_66887 ?auto_66886 ) ( not ( = ?auto_66886 ?auto_66887 ) ) ( not ( = ?auto_66886 ?auto_66888 ) ) ( not ( = ?auto_66887 ?auto_66888 ) ) ( CLEAR ?auto_66890 ) ( not ( = ?auto_66886 ?auto_66889 ) ) ( not ( = ?auto_66886 ?auto_66890 ) ) ( not ( = ?auto_66887 ?auto_66889 ) ) ( not ( = ?auto_66887 ?auto_66890 ) ) ( not ( = ?auto_66888 ?auto_66889 ) ) ( not ( = ?auto_66888 ?auto_66890 ) ) ( not ( = ?auto_66889 ?auto_66890 ) ) ( ON ?auto_66889 ?auto_66888 ) ( CLEAR ?auto_66889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66886 ?auto_66887 ?auto_66888 )
      ( MAKE-2PILE ?auto_66886 ?auto_66887 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66891 - BLOCK
      ?auto_66892 - BLOCK
    )
    :vars
    (
      ?auto_66893 - BLOCK
      ?auto_66895 - BLOCK
      ?auto_66894 - BLOCK
      ?auto_66896 - BLOCK
      ?auto_66897 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66893 ?auto_66892 ) ( ON-TABLE ?auto_66891 ) ( ON ?auto_66892 ?auto_66891 ) ( not ( = ?auto_66891 ?auto_66892 ) ) ( not ( = ?auto_66891 ?auto_66893 ) ) ( not ( = ?auto_66892 ?auto_66893 ) ) ( not ( = ?auto_66891 ?auto_66895 ) ) ( not ( = ?auto_66891 ?auto_66894 ) ) ( not ( = ?auto_66892 ?auto_66895 ) ) ( not ( = ?auto_66892 ?auto_66894 ) ) ( not ( = ?auto_66893 ?auto_66895 ) ) ( not ( = ?auto_66893 ?auto_66894 ) ) ( not ( = ?auto_66895 ?auto_66894 ) ) ( ON ?auto_66895 ?auto_66893 ) ( CLEAR ?auto_66895 ) ( HOLDING ?auto_66894 ) ( CLEAR ?auto_66896 ) ( ON-TABLE ?auto_66897 ) ( ON ?auto_66896 ?auto_66897 ) ( not ( = ?auto_66897 ?auto_66896 ) ) ( not ( = ?auto_66897 ?auto_66894 ) ) ( not ( = ?auto_66896 ?auto_66894 ) ) ( not ( = ?auto_66891 ?auto_66896 ) ) ( not ( = ?auto_66891 ?auto_66897 ) ) ( not ( = ?auto_66892 ?auto_66896 ) ) ( not ( = ?auto_66892 ?auto_66897 ) ) ( not ( = ?auto_66893 ?auto_66896 ) ) ( not ( = ?auto_66893 ?auto_66897 ) ) ( not ( = ?auto_66895 ?auto_66896 ) ) ( not ( = ?auto_66895 ?auto_66897 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66897 ?auto_66896 ?auto_66894 )
      ( MAKE-2PILE ?auto_66891 ?auto_66892 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66898 - BLOCK
      ?auto_66899 - BLOCK
    )
    :vars
    (
      ?auto_66901 - BLOCK
      ?auto_66900 - BLOCK
      ?auto_66904 - BLOCK
      ?auto_66902 - BLOCK
      ?auto_66903 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66901 ?auto_66899 ) ( ON-TABLE ?auto_66898 ) ( ON ?auto_66899 ?auto_66898 ) ( not ( = ?auto_66898 ?auto_66899 ) ) ( not ( = ?auto_66898 ?auto_66901 ) ) ( not ( = ?auto_66899 ?auto_66901 ) ) ( not ( = ?auto_66898 ?auto_66900 ) ) ( not ( = ?auto_66898 ?auto_66904 ) ) ( not ( = ?auto_66899 ?auto_66900 ) ) ( not ( = ?auto_66899 ?auto_66904 ) ) ( not ( = ?auto_66901 ?auto_66900 ) ) ( not ( = ?auto_66901 ?auto_66904 ) ) ( not ( = ?auto_66900 ?auto_66904 ) ) ( ON ?auto_66900 ?auto_66901 ) ( CLEAR ?auto_66902 ) ( ON-TABLE ?auto_66903 ) ( ON ?auto_66902 ?auto_66903 ) ( not ( = ?auto_66903 ?auto_66902 ) ) ( not ( = ?auto_66903 ?auto_66904 ) ) ( not ( = ?auto_66902 ?auto_66904 ) ) ( not ( = ?auto_66898 ?auto_66902 ) ) ( not ( = ?auto_66898 ?auto_66903 ) ) ( not ( = ?auto_66899 ?auto_66902 ) ) ( not ( = ?auto_66899 ?auto_66903 ) ) ( not ( = ?auto_66901 ?auto_66902 ) ) ( not ( = ?auto_66901 ?auto_66903 ) ) ( not ( = ?auto_66900 ?auto_66902 ) ) ( not ( = ?auto_66900 ?auto_66903 ) ) ( ON ?auto_66904 ?auto_66900 ) ( CLEAR ?auto_66904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66898 ?auto_66899 ?auto_66901 ?auto_66900 )
      ( MAKE-2PILE ?auto_66898 ?auto_66899 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66905 - BLOCK
      ?auto_66906 - BLOCK
    )
    :vars
    (
      ?auto_66907 - BLOCK
      ?auto_66908 - BLOCK
      ?auto_66911 - BLOCK
      ?auto_66909 - BLOCK
      ?auto_66910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66907 ?auto_66906 ) ( ON-TABLE ?auto_66905 ) ( ON ?auto_66906 ?auto_66905 ) ( not ( = ?auto_66905 ?auto_66906 ) ) ( not ( = ?auto_66905 ?auto_66907 ) ) ( not ( = ?auto_66906 ?auto_66907 ) ) ( not ( = ?auto_66905 ?auto_66908 ) ) ( not ( = ?auto_66905 ?auto_66911 ) ) ( not ( = ?auto_66906 ?auto_66908 ) ) ( not ( = ?auto_66906 ?auto_66911 ) ) ( not ( = ?auto_66907 ?auto_66908 ) ) ( not ( = ?auto_66907 ?auto_66911 ) ) ( not ( = ?auto_66908 ?auto_66911 ) ) ( ON ?auto_66908 ?auto_66907 ) ( ON-TABLE ?auto_66909 ) ( not ( = ?auto_66909 ?auto_66910 ) ) ( not ( = ?auto_66909 ?auto_66911 ) ) ( not ( = ?auto_66910 ?auto_66911 ) ) ( not ( = ?auto_66905 ?auto_66910 ) ) ( not ( = ?auto_66905 ?auto_66909 ) ) ( not ( = ?auto_66906 ?auto_66910 ) ) ( not ( = ?auto_66906 ?auto_66909 ) ) ( not ( = ?auto_66907 ?auto_66910 ) ) ( not ( = ?auto_66907 ?auto_66909 ) ) ( not ( = ?auto_66908 ?auto_66910 ) ) ( not ( = ?auto_66908 ?auto_66909 ) ) ( ON ?auto_66911 ?auto_66908 ) ( CLEAR ?auto_66911 ) ( HOLDING ?auto_66910 ) ( CLEAR ?auto_66909 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66909 ?auto_66910 )
      ( MAKE-2PILE ?auto_66905 ?auto_66906 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66912 - BLOCK
      ?auto_66913 - BLOCK
    )
    :vars
    (
      ?auto_66917 - BLOCK
      ?auto_66914 - BLOCK
      ?auto_66916 - BLOCK
      ?auto_66915 - BLOCK
      ?auto_66918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66917 ?auto_66913 ) ( ON-TABLE ?auto_66912 ) ( ON ?auto_66913 ?auto_66912 ) ( not ( = ?auto_66912 ?auto_66913 ) ) ( not ( = ?auto_66912 ?auto_66917 ) ) ( not ( = ?auto_66913 ?auto_66917 ) ) ( not ( = ?auto_66912 ?auto_66914 ) ) ( not ( = ?auto_66912 ?auto_66916 ) ) ( not ( = ?auto_66913 ?auto_66914 ) ) ( not ( = ?auto_66913 ?auto_66916 ) ) ( not ( = ?auto_66917 ?auto_66914 ) ) ( not ( = ?auto_66917 ?auto_66916 ) ) ( not ( = ?auto_66914 ?auto_66916 ) ) ( ON ?auto_66914 ?auto_66917 ) ( ON-TABLE ?auto_66915 ) ( not ( = ?auto_66915 ?auto_66918 ) ) ( not ( = ?auto_66915 ?auto_66916 ) ) ( not ( = ?auto_66918 ?auto_66916 ) ) ( not ( = ?auto_66912 ?auto_66918 ) ) ( not ( = ?auto_66912 ?auto_66915 ) ) ( not ( = ?auto_66913 ?auto_66918 ) ) ( not ( = ?auto_66913 ?auto_66915 ) ) ( not ( = ?auto_66917 ?auto_66918 ) ) ( not ( = ?auto_66917 ?auto_66915 ) ) ( not ( = ?auto_66914 ?auto_66918 ) ) ( not ( = ?auto_66914 ?auto_66915 ) ) ( ON ?auto_66916 ?auto_66914 ) ( CLEAR ?auto_66915 ) ( ON ?auto_66918 ?auto_66916 ) ( CLEAR ?auto_66918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66912 ?auto_66913 ?auto_66917 ?auto_66914 ?auto_66916 )
      ( MAKE-2PILE ?auto_66912 ?auto_66913 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66919 - BLOCK
      ?auto_66920 - BLOCK
    )
    :vars
    (
      ?auto_66923 - BLOCK
      ?auto_66922 - BLOCK
      ?auto_66924 - BLOCK
      ?auto_66921 - BLOCK
      ?auto_66925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66923 ?auto_66920 ) ( ON-TABLE ?auto_66919 ) ( ON ?auto_66920 ?auto_66919 ) ( not ( = ?auto_66919 ?auto_66920 ) ) ( not ( = ?auto_66919 ?auto_66923 ) ) ( not ( = ?auto_66920 ?auto_66923 ) ) ( not ( = ?auto_66919 ?auto_66922 ) ) ( not ( = ?auto_66919 ?auto_66924 ) ) ( not ( = ?auto_66920 ?auto_66922 ) ) ( not ( = ?auto_66920 ?auto_66924 ) ) ( not ( = ?auto_66923 ?auto_66922 ) ) ( not ( = ?auto_66923 ?auto_66924 ) ) ( not ( = ?auto_66922 ?auto_66924 ) ) ( ON ?auto_66922 ?auto_66923 ) ( not ( = ?auto_66921 ?auto_66925 ) ) ( not ( = ?auto_66921 ?auto_66924 ) ) ( not ( = ?auto_66925 ?auto_66924 ) ) ( not ( = ?auto_66919 ?auto_66925 ) ) ( not ( = ?auto_66919 ?auto_66921 ) ) ( not ( = ?auto_66920 ?auto_66925 ) ) ( not ( = ?auto_66920 ?auto_66921 ) ) ( not ( = ?auto_66923 ?auto_66925 ) ) ( not ( = ?auto_66923 ?auto_66921 ) ) ( not ( = ?auto_66922 ?auto_66925 ) ) ( not ( = ?auto_66922 ?auto_66921 ) ) ( ON ?auto_66924 ?auto_66922 ) ( ON ?auto_66925 ?auto_66924 ) ( CLEAR ?auto_66925 ) ( HOLDING ?auto_66921 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66921 )
      ( MAKE-2PILE ?auto_66919 ?auto_66920 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66926 - BLOCK
      ?auto_66927 - BLOCK
    )
    :vars
    (
      ?auto_66931 - BLOCK
      ?auto_66930 - BLOCK
      ?auto_66932 - BLOCK
      ?auto_66928 - BLOCK
      ?auto_66929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66931 ?auto_66927 ) ( ON-TABLE ?auto_66926 ) ( ON ?auto_66927 ?auto_66926 ) ( not ( = ?auto_66926 ?auto_66927 ) ) ( not ( = ?auto_66926 ?auto_66931 ) ) ( not ( = ?auto_66927 ?auto_66931 ) ) ( not ( = ?auto_66926 ?auto_66930 ) ) ( not ( = ?auto_66926 ?auto_66932 ) ) ( not ( = ?auto_66927 ?auto_66930 ) ) ( not ( = ?auto_66927 ?auto_66932 ) ) ( not ( = ?auto_66931 ?auto_66930 ) ) ( not ( = ?auto_66931 ?auto_66932 ) ) ( not ( = ?auto_66930 ?auto_66932 ) ) ( ON ?auto_66930 ?auto_66931 ) ( not ( = ?auto_66928 ?auto_66929 ) ) ( not ( = ?auto_66928 ?auto_66932 ) ) ( not ( = ?auto_66929 ?auto_66932 ) ) ( not ( = ?auto_66926 ?auto_66929 ) ) ( not ( = ?auto_66926 ?auto_66928 ) ) ( not ( = ?auto_66927 ?auto_66929 ) ) ( not ( = ?auto_66927 ?auto_66928 ) ) ( not ( = ?auto_66931 ?auto_66929 ) ) ( not ( = ?auto_66931 ?auto_66928 ) ) ( not ( = ?auto_66930 ?auto_66929 ) ) ( not ( = ?auto_66930 ?auto_66928 ) ) ( ON ?auto_66932 ?auto_66930 ) ( ON ?auto_66929 ?auto_66932 ) ( ON ?auto_66928 ?auto_66929 ) ( CLEAR ?auto_66928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_66926 ?auto_66927 ?auto_66931 ?auto_66930 ?auto_66932 ?auto_66929 )
      ( MAKE-2PILE ?auto_66926 ?auto_66927 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66938 - BLOCK
      ?auto_66939 - BLOCK
      ?auto_66940 - BLOCK
      ?auto_66941 - BLOCK
      ?auto_66942 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_66942 ) ( CLEAR ?auto_66941 ) ( ON-TABLE ?auto_66938 ) ( ON ?auto_66939 ?auto_66938 ) ( ON ?auto_66940 ?auto_66939 ) ( ON ?auto_66941 ?auto_66940 ) ( not ( = ?auto_66938 ?auto_66939 ) ) ( not ( = ?auto_66938 ?auto_66940 ) ) ( not ( = ?auto_66938 ?auto_66941 ) ) ( not ( = ?auto_66938 ?auto_66942 ) ) ( not ( = ?auto_66939 ?auto_66940 ) ) ( not ( = ?auto_66939 ?auto_66941 ) ) ( not ( = ?auto_66939 ?auto_66942 ) ) ( not ( = ?auto_66940 ?auto_66941 ) ) ( not ( = ?auto_66940 ?auto_66942 ) ) ( not ( = ?auto_66941 ?auto_66942 ) ) )
    :subtasks
    ( ( !STACK ?auto_66942 ?auto_66941 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66943 - BLOCK
      ?auto_66944 - BLOCK
      ?auto_66945 - BLOCK
      ?auto_66946 - BLOCK
      ?auto_66947 - BLOCK
    )
    :vars
    (
      ?auto_66948 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_66946 ) ( ON-TABLE ?auto_66943 ) ( ON ?auto_66944 ?auto_66943 ) ( ON ?auto_66945 ?auto_66944 ) ( ON ?auto_66946 ?auto_66945 ) ( not ( = ?auto_66943 ?auto_66944 ) ) ( not ( = ?auto_66943 ?auto_66945 ) ) ( not ( = ?auto_66943 ?auto_66946 ) ) ( not ( = ?auto_66943 ?auto_66947 ) ) ( not ( = ?auto_66944 ?auto_66945 ) ) ( not ( = ?auto_66944 ?auto_66946 ) ) ( not ( = ?auto_66944 ?auto_66947 ) ) ( not ( = ?auto_66945 ?auto_66946 ) ) ( not ( = ?auto_66945 ?auto_66947 ) ) ( not ( = ?auto_66946 ?auto_66947 ) ) ( ON ?auto_66947 ?auto_66948 ) ( CLEAR ?auto_66947 ) ( HAND-EMPTY ) ( not ( = ?auto_66943 ?auto_66948 ) ) ( not ( = ?auto_66944 ?auto_66948 ) ) ( not ( = ?auto_66945 ?auto_66948 ) ) ( not ( = ?auto_66946 ?auto_66948 ) ) ( not ( = ?auto_66947 ?auto_66948 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66947 ?auto_66948 )
      ( MAKE-5PILE ?auto_66943 ?auto_66944 ?auto_66945 ?auto_66946 ?auto_66947 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66949 - BLOCK
      ?auto_66950 - BLOCK
      ?auto_66951 - BLOCK
      ?auto_66952 - BLOCK
      ?auto_66953 - BLOCK
    )
    :vars
    (
      ?auto_66954 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66949 ) ( ON ?auto_66950 ?auto_66949 ) ( ON ?auto_66951 ?auto_66950 ) ( not ( = ?auto_66949 ?auto_66950 ) ) ( not ( = ?auto_66949 ?auto_66951 ) ) ( not ( = ?auto_66949 ?auto_66952 ) ) ( not ( = ?auto_66949 ?auto_66953 ) ) ( not ( = ?auto_66950 ?auto_66951 ) ) ( not ( = ?auto_66950 ?auto_66952 ) ) ( not ( = ?auto_66950 ?auto_66953 ) ) ( not ( = ?auto_66951 ?auto_66952 ) ) ( not ( = ?auto_66951 ?auto_66953 ) ) ( not ( = ?auto_66952 ?auto_66953 ) ) ( ON ?auto_66953 ?auto_66954 ) ( CLEAR ?auto_66953 ) ( not ( = ?auto_66949 ?auto_66954 ) ) ( not ( = ?auto_66950 ?auto_66954 ) ) ( not ( = ?auto_66951 ?auto_66954 ) ) ( not ( = ?auto_66952 ?auto_66954 ) ) ( not ( = ?auto_66953 ?auto_66954 ) ) ( HOLDING ?auto_66952 ) ( CLEAR ?auto_66951 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66949 ?auto_66950 ?auto_66951 ?auto_66952 )
      ( MAKE-5PILE ?auto_66949 ?auto_66950 ?auto_66951 ?auto_66952 ?auto_66953 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66955 - BLOCK
      ?auto_66956 - BLOCK
      ?auto_66957 - BLOCK
      ?auto_66958 - BLOCK
      ?auto_66959 - BLOCK
    )
    :vars
    (
      ?auto_66960 - BLOCK
      ?auto_66961 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66955 ) ( ON ?auto_66956 ?auto_66955 ) ( ON ?auto_66957 ?auto_66956 ) ( not ( = ?auto_66955 ?auto_66956 ) ) ( not ( = ?auto_66955 ?auto_66957 ) ) ( not ( = ?auto_66955 ?auto_66958 ) ) ( not ( = ?auto_66955 ?auto_66959 ) ) ( not ( = ?auto_66956 ?auto_66957 ) ) ( not ( = ?auto_66956 ?auto_66958 ) ) ( not ( = ?auto_66956 ?auto_66959 ) ) ( not ( = ?auto_66957 ?auto_66958 ) ) ( not ( = ?auto_66957 ?auto_66959 ) ) ( not ( = ?auto_66958 ?auto_66959 ) ) ( ON ?auto_66959 ?auto_66960 ) ( not ( = ?auto_66955 ?auto_66960 ) ) ( not ( = ?auto_66956 ?auto_66960 ) ) ( not ( = ?auto_66957 ?auto_66960 ) ) ( not ( = ?auto_66958 ?auto_66960 ) ) ( not ( = ?auto_66959 ?auto_66960 ) ) ( CLEAR ?auto_66957 ) ( ON ?auto_66958 ?auto_66959 ) ( CLEAR ?auto_66958 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66961 ) ( ON ?auto_66960 ?auto_66961 ) ( not ( = ?auto_66961 ?auto_66960 ) ) ( not ( = ?auto_66961 ?auto_66959 ) ) ( not ( = ?auto_66961 ?auto_66958 ) ) ( not ( = ?auto_66955 ?auto_66961 ) ) ( not ( = ?auto_66956 ?auto_66961 ) ) ( not ( = ?auto_66957 ?auto_66961 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66961 ?auto_66960 ?auto_66959 )
      ( MAKE-5PILE ?auto_66955 ?auto_66956 ?auto_66957 ?auto_66958 ?auto_66959 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66962 - BLOCK
      ?auto_66963 - BLOCK
      ?auto_66964 - BLOCK
      ?auto_66965 - BLOCK
      ?auto_66966 - BLOCK
    )
    :vars
    (
      ?auto_66967 - BLOCK
      ?auto_66968 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66962 ) ( ON ?auto_66963 ?auto_66962 ) ( not ( = ?auto_66962 ?auto_66963 ) ) ( not ( = ?auto_66962 ?auto_66964 ) ) ( not ( = ?auto_66962 ?auto_66965 ) ) ( not ( = ?auto_66962 ?auto_66966 ) ) ( not ( = ?auto_66963 ?auto_66964 ) ) ( not ( = ?auto_66963 ?auto_66965 ) ) ( not ( = ?auto_66963 ?auto_66966 ) ) ( not ( = ?auto_66964 ?auto_66965 ) ) ( not ( = ?auto_66964 ?auto_66966 ) ) ( not ( = ?auto_66965 ?auto_66966 ) ) ( ON ?auto_66966 ?auto_66967 ) ( not ( = ?auto_66962 ?auto_66967 ) ) ( not ( = ?auto_66963 ?auto_66967 ) ) ( not ( = ?auto_66964 ?auto_66967 ) ) ( not ( = ?auto_66965 ?auto_66967 ) ) ( not ( = ?auto_66966 ?auto_66967 ) ) ( ON ?auto_66965 ?auto_66966 ) ( CLEAR ?auto_66965 ) ( ON-TABLE ?auto_66968 ) ( ON ?auto_66967 ?auto_66968 ) ( not ( = ?auto_66968 ?auto_66967 ) ) ( not ( = ?auto_66968 ?auto_66966 ) ) ( not ( = ?auto_66968 ?auto_66965 ) ) ( not ( = ?auto_66962 ?auto_66968 ) ) ( not ( = ?auto_66963 ?auto_66968 ) ) ( not ( = ?auto_66964 ?auto_66968 ) ) ( HOLDING ?auto_66964 ) ( CLEAR ?auto_66963 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66962 ?auto_66963 ?auto_66964 )
      ( MAKE-5PILE ?auto_66962 ?auto_66963 ?auto_66964 ?auto_66965 ?auto_66966 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66969 - BLOCK
      ?auto_66970 - BLOCK
      ?auto_66971 - BLOCK
      ?auto_66972 - BLOCK
      ?auto_66973 - BLOCK
    )
    :vars
    (
      ?auto_66975 - BLOCK
      ?auto_66974 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66969 ) ( ON ?auto_66970 ?auto_66969 ) ( not ( = ?auto_66969 ?auto_66970 ) ) ( not ( = ?auto_66969 ?auto_66971 ) ) ( not ( = ?auto_66969 ?auto_66972 ) ) ( not ( = ?auto_66969 ?auto_66973 ) ) ( not ( = ?auto_66970 ?auto_66971 ) ) ( not ( = ?auto_66970 ?auto_66972 ) ) ( not ( = ?auto_66970 ?auto_66973 ) ) ( not ( = ?auto_66971 ?auto_66972 ) ) ( not ( = ?auto_66971 ?auto_66973 ) ) ( not ( = ?auto_66972 ?auto_66973 ) ) ( ON ?auto_66973 ?auto_66975 ) ( not ( = ?auto_66969 ?auto_66975 ) ) ( not ( = ?auto_66970 ?auto_66975 ) ) ( not ( = ?auto_66971 ?auto_66975 ) ) ( not ( = ?auto_66972 ?auto_66975 ) ) ( not ( = ?auto_66973 ?auto_66975 ) ) ( ON ?auto_66972 ?auto_66973 ) ( ON-TABLE ?auto_66974 ) ( ON ?auto_66975 ?auto_66974 ) ( not ( = ?auto_66974 ?auto_66975 ) ) ( not ( = ?auto_66974 ?auto_66973 ) ) ( not ( = ?auto_66974 ?auto_66972 ) ) ( not ( = ?auto_66969 ?auto_66974 ) ) ( not ( = ?auto_66970 ?auto_66974 ) ) ( not ( = ?auto_66971 ?auto_66974 ) ) ( CLEAR ?auto_66970 ) ( ON ?auto_66971 ?auto_66972 ) ( CLEAR ?auto_66971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66974 ?auto_66975 ?auto_66973 ?auto_66972 )
      ( MAKE-5PILE ?auto_66969 ?auto_66970 ?auto_66971 ?auto_66972 ?auto_66973 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66976 - BLOCK
      ?auto_66977 - BLOCK
      ?auto_66978 - BLOCK
      ?auto_66979 - BLOCK
      ?auto_66980 - BLOCK
    )
    :vars
    (
      ?auto_66982 - BLOCK
      ?auto_66981 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66976 ) ( not ( = ?auto_66976 ?auto_66977 ) ) ( not ( = ?auto_66976 ?auto_66978 ) ) ( not ( = ?auto_66976 ?auto_66979 ) ) ( not ( = ?auto_66976 ?auto_66980 ) ) ( not ( = ?auto_66977 ?auto_66978 ) ) ( not ( = ?auto_66977 ?auto_66979 ) ) ( not ( = ?auto_66977 ?auto_66980 ) ) ( not ( = ?auto_66978 ?auto_66979 ) ) ( not ( = ?auto_66978 ?auto_66980 ) ) ( not ( = ?auto_66979 ?auto_66980 ) ) ( ON ?auto_66980 ?auto_66982 ) ( not ( = ?auto_66976 ?auto_66982 ) ) ( not ( = ?auto_66977 ?auto_66982 ) ) ( not ( = ?auto_66978 ?auto_66982 ) ) ( not ( = ?auto_66979 ?auto_66982 ) ) ( not ( = ?auto_66980 ?auto_66982 ) ) ( ON ?auto_66979 ?auto_66980 ) ( ON-TABLE ?auto_66981 ) ( ON ?auto_66982 ?auto_66981 ) ( not ( = ?auto_66981 ?auto_66982 ) ) ( not ( = ?auto_66981 ?auto_66980 ) ) ( not ( = ?auto_66981 ?auto_66979 ) ) ( not ( = ?auto_66976 ?auto_66981 ) ) ( not ( = ?auto_66977 ?auto_66981 ) ) ( not ( = ?auto_66978 ?auto_66981 ) ) ( ON ?auto_66978 ?auto_66979 ) ( CLEAR ?auto_66978 ) ( HOLDING ?auto_66977 ) ( CLEAR ?auto_66976 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66976 ?auto_66977 )
      ( MAKE-5PILE ?auto_66976 ?auto_66977 ?auto_66978 ?auto_66979 ?auto_66980 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66983 - BLOCK
      ?auto_66984 - BLOCK
      ?auto_66985 - BLOCK
      ?auto_66986 - BLOCK
      ?auto_66987 - BLOCK
    )
    :vars
    (
      ?auto_66989 - BLOCK
      ?auto_66988 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66983 ) ( not ( = ?auto_66983 ?auto_66984 ) ) ( not ( = ?auto_66983 ?auto_66985 ) ) ( not ( = ?auto_66983 ?auto_66986 ) ) ( not ( = ?auto_66983 ?auto_66987 ) ) ( not ( = ?auto_66984 ?auto_66985 ) ) ( not ( = ?auto_66984 ?auto_66986 ) ) ( not ( = ?auto_66984 ?auto_66987 ) ) ( not ( = ?auto_66985 ?auto_66986 ) ) ( not ( = ?auto_66985 ?auto_66987 ) ) ( not ( = ?auto_66986 ?auto_66987 ) ) ( ON ?auto_66987 ?auto_66989 ) ( not ( = ?auto_66983 ?auto_66989 ) ) ( not ( = ?auto_66984 ?auto_66989 ) ) ( not ( = ?auto_66985 ?auto_66989 ) ) ( not ( = ?auto_66986 ?auto_66989 ) ) ( not ( = ?auto_66987 ?auto_66989 ) ) ( ON ?auto_66986 ?auto_66987 ) ( ON-TABLE ?auto_66988 ) ( ON ?auto_66989 ?auto_66988 ) ( not ( = ?auto_66988 ?auto_66989 ) ) ( not ( = ?auto_66988 ?auto_66987 ) ) ( not ( = ?auto_66988 ?auto_66986 ) ) ( not ( = ?auto_66983 ?auto_66988 ) ) ( not ( = ?auto_66984 ?auto_66988 ) ) ( not ( = ?auto_66985 ?auto_66988 ) ) ( ON ?auto_66985 ?auto_66986 ) ( CLEAR ?auto_66983 ) ( ON ?auto_66984 ?auto_66985 ) ( CLEAR ?auto_66984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66988 ?auto_66989 ?auto_66987 ?auto_66986 ?auto_66985 )
      ( MAKE-5PILE ?auto_66983 ?auto_66984 ?auto_66985 ?auto_66986 ?auto_66987 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66990 - BLOCK
      ?auto_66991 - BLOCK
      ?auto_66992 - BLOCK
      ?auto_66993 - BLOCK
      ?auto_66994 - BLOCK
    )
    :vars
    (
      ?auto_66996 - BLOCK
      ?auto_66995 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66990 ?auto_66991 ) ) ( not ( = ?auto_66990 ?auto_66992 ) ) ( not ( = ?auto_66990 ?auto_66993 ) ) ( not ( = ?auto_66990 ?auto_66994 ) ) ( not ( = ?auto_66991 ?auto_66992 ) ) ( not ( = ?auto_66991 ?auto_66993 ) ) ( not ( = ?auto_66991 ?auto_66994 ) ) ( not ( = ?auto_66992 ?auto_66993 ) ) ( not ( = ?auto_66992 ?auto_66994 ) ) ( not ( = ?auto_66993 ?auto_66994 ) ) ( ON ?auto_66994 ?auto_66996 ) ( not ( = ?auto_66990 ?auto_66996 ) ) ( not ( = ?auto_66991 ?auto_66996 ) ) ( not ( = ?auto_66992 ?auto_66996 ) ) ( not ( = ?auto_66993 ?auto_66996 ) ) ( not ( = ?auto_66994 ?auto_66996 ) ) ( ON ?auto_66993 ?auto_66994 ) ( ON-TABLE ?auto_66995 ) ( ON ?auto_66996 ?auto_66995 ) ( not ( = ?auto_66995 ?auto_66996 ) ) ( not ( = ?auto_66995 ?auto_66994 ) ) ( not ( = ?auto_66995 ?auto_66993 ) ) ( not ( = ?auto_66990 ?auto_66995 ) ) ( not ( = ?auto_66991 ?auto_66995 ) ) ( not ( = ?auto_66992 ?auto_66995 ) ) ( ON ?auto_66992 ?auto_66993 ) ( ON ?auto_66991 ?auto_66992 ) ( CLEAR ?auto_66991 ) ( HOLDING ?auto_66990 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66990 )
      ( MAKE-5PILE ?auto_66990 ?auto_66991 ?auto_66992 ?auto_66993 ?auto_66994 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66997 - BLOCK
      ?auto_66998 - BLOCK
      ?auto_66999 - BLOCK
      ?auto_67000 - BLOCK
      ?auto_67001 - BLOCK
    )
    :vars
    (
      ?auto_67002 - BLOCK
      ?auto_67003 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66997 ?auto_66998 ) ) ( not ( = ?auto_66997 ?auto_66999 ) ) ( not ( = ?auto_66997 ?auto_67000 ) ) ( not ( = ?auto_66997 ?auto_67001 ) ) ( not ( = ?auto_66998 ?auto_66999 ) ) ( not ( = ?auto_66998 ?auto_67000 ) ) ( not ( = ?auto_66998 ?auto_67001 ) ) ( not ( = ?auto_66999 ?auto_67000 ) ) ( not ( = ?auto_66999 ?auto_67001 ) ) ( not ( = ?auto_67000 ?auto_67001 ) ) ( ON ?auto_67001 ?auto_67002 ) ( not ( = ?auto_66997 ?auto_67002 ) ) ( not ( = ?auto_66998 ?auto_67002 ) ) ( not ( = ?auto_66999 ?auto_67002 ) ) ( not ( = ?auto_67000 ?auto_67002 ) ) ( not ( = ?auto_67001 ?auto_67002 ) ) ( ON ?auto_67000 ?auto_67001 ) ( ON-TABLE ?auto_67003 ) ( ON ?auto_67002 ?auto_67003 ) ( not ( = ?auto_67003 ?auto_67002 ) ) ( not ( = ?auto_67003 ?auto_67001 ) ) ( not ( = ?auto_67003 ?auto_67000 ) ) ( not ( = ?auto_66997 ?auto_67003 ) ) ( not ( = ?auto_66998 ?auto_67003 ) ) ( not ( = ?auto_66999 ?auto_67003 ) ) ( ON ?auto_66999 ?auto_67000 ) ( ON ?auto_66998 ?auto_66999 ) ( ON ?auto_66997 ?auto_66998 ) ( CLEAR ?auto_66997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_67003 ?auto_67002 ?auto_67001 ?auto_67000 ?auto_66999 ?auto_66998 )
      ( MAKE-5PILE ?auto_66997 ?auto_66998 ?auto_66999 ?auto_67000 ?auto_67001 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67005 - BLOCK
    )
    :vars
    (
      ?auto_67006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67006 ?auto_67005 ) ( CLEAR ?auto_67006 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_67005 ) ( not ( = ?auto_67005 ?auto_67006 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_67006 ?auto_67005 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67007 - BLOCK
    )
    :vars
    (
      ?auto_67008 - BLOCK
      ?auto_67009 - BLOCK
      ?auto_67010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67008 ?auto_67007 ) ( CLEAR ?auto_67008 ) ( ON-TABLE ?auto_67007 ) ( not ( = ?auto_67007 ?auto_67008 ) ) ( HOLDING ?auto_67009 ) ( CLEAR ?auto_67010 ) ( not ( = ?auto_67007 ?auto_67009 ) ) ( not ( = ?auto_67007 ?auto_67010 ) ) ( not ( = ?auto_67008 ?auto_67009 ) ) ( not ( = ?auto_67008 ?auto_67010 ) ) ( not ( = ?auto_67009 ?auto_67010 ) ) )
    :subtasks
    ( ( !STACK ?auto_67009 ?auto_67010 )
      ( MAKE-1PILE ?auto_67007 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67011 - BLOCK
    )
    :vars
    (
      ?auto_67014 - BLOCK
      ?auto_67013 - BLOCK
      ?auto_67012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67014 ?auto_67011 ) ( ON-TABLE ?auto_67011 ) ( not ( = ?auto_67011 ?auto_67014 ) ) ( CLEAR ?auto_67013 ) ( not ( = ?auto_67011 ?auto_67012 ) ) ( not ( = ?auto_67011 ?auto_67013 ) ) ( not ( = ?auto_67014 ?auto_67012 ) ) ( not ( = ?auto_67014 ?auto_67013 ) ) ( not ( = ?auto_67012 ?auto_67013 ) ) ( ON ?auto_67012 ?auto_67014 ) ( CLEAR ?auto_67012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67011 ?auto_67014 )
      ( MAKE-1PILE ?auto_67011 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67015 - BLOCK
    )
    :vars
    (
      ?auto_67017 - BLOCK
      ?auto_67016 - BLOCK
      ?auto_67018 - BLOCK
      ?auto_67020 - BLOCK
      ?auto_67021 - BLOCK
      ?auto_67019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67017 ?auto_67015 ) ( ON-TABLE ?auto_67015 ) ( not ( = ?auto_67015 ?auto_67017 ) ) ( not ( = ?auto_67015 ?auto_67016 ) ) ( not ( = ?auto_67015 ?auto_67018 ) ) ( not ( = ?auto_67017 ?auto_67016 ) ) ( not ( = ?auto_67017 ?auto_67018 ) ) ( not ( = ?auto_67016 ?auto_67018 ) ) ( ON ?auto_67016 ?auto_67017 ) ( CLEAR ?auto_67016 ) ( HOLDING ?auto_67018 ) ( CLEAR ?auto_67020 ) ( ON-TABLE ?auto_67021 ) ( ON ?auto_67019 ?auto_67021 ) ( ON ?auto_67020 ?auto_67019 ) ( not ( = ?auto_67021 ?auto_67019 ) ) ( not ( = ?auto_67021 ?auto_67020 ) ) ( not ( = ?auto_67021 ?auto_67018 ) ) ( not ( = ?auto_67019 ?auto_67020 ) ) ( not ( = ?auto_67019 ?auto_67018 ) ) ( not ( = ?auto_67020 ?auto_67018 ) ) ( not ( = ?auto_67015 ?auto_67020 ) ) ( not ( = ?auto_67015 ?auto_67021 ) ) ( not ( = ?auto_67015 ?auto_67019 ) ) ( not ( = ?auto_67017 ?auto_67020 ) ) ( not ( = ?auto_67017 ?auto_67021 ) ) ( not ( = ?auto_67017 ?auto_67019 ) ) ( not ( = ?auto_67016 ?auto_67020 ) ) ( not ( = ?auto_67016 ?auto_67021 ) ) ( not ( = ?auto_67016 ?auto_67019 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_67021 ?auto_67019 ?auto_67020 ?auto_67018 )
      ( MAKE-1PILE ?auto_67015 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67022 - BLOCK
    )
    :vars
    (
      ?auto_67027 - BLOCK
      ?auto_67025 - BLOCK
      ?auto_67028 - BLOCK
      ?auto_67024 - BLOCK
      ?auto_67026 - BLOCK
      ?auto_67023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67027 ?auto_67022 ) ( ON-TABLE ?auto_67022 ) ( not ( = ?auto_67022 ?auto_67027 ) ) ( not ( = ?auto_67022 ?auto_67025 ) ) ( not ( = ?auto_67022 ?auto_67028 ) ) ( not ( = ?auto_67027 ?auto_67025 ) ) ( not ( = ?auto_67027 ?auto_67028 ) ) ( not ( = ?auto_67025 ?auto_67028 ) ) ( ON ?auto_67025 ?auto_67027 ) ( CLEAR ?auto_67024 ) ( ON-TABLE ?auto_67026 ) ( ON ?auto_67023 ?auto_67026 ) ( ON ?auto_67024 ?auto_67023 ) ( not ( = ?auto_67026 ?auto_67023 ) ) ( not ( = ?auto_67026 ?auto_67024 ) ) ( not ( = ?auto_67026 ?auto_67028 ) ) ( not ( = ?auto_67023 ?auto_67024 ) ) ( not ( = ?auto_67023 ?auto_67028 ) ) ( not ( = ?auto_67024 ?auto_67028 ) ) ( not ( = ?auto_67022 ?auto_67024 ) ) ( not ( = ?auto_67022 ?auto_67026 ) ) ( not ( = ?auto_67022 ?auto_67023 ) ) ( not ( = ?auto_67027 ?auto_67024 ) ) ( not ( = ?auto_67027 ?auto_67026 ) ) ( not ( = ?auto_67027 ?auto_67023 ) ) ( not ( = ?auto_67025 ?auto_67024 ) ) ( not ( = ?auto_67025 ?auto_67026 ) ) ( not ( = ?auto_67025 ?auto_67023 ) ) ( ON ?auto_67028 ?auto_67025 ) ( CLEAR ?auto_67028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_67022 ?auto_67027 ?auto_67025 )
      ( MAKE-1PILE ?auto_67022 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67029 - BLOCK
    )
    :vars
    (
      ?auto_67031 - BLOCK
      ?auto_67035 - BLOCK
      ?auto_67034 - BLOCK
      ?auto_67030 - BLOCK
      ?auto_67033 - BLOCK
      ?auto_67032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67031 ?auto_67029 ) ( ON-TABLE ?auto_67029 ) ( not ( = ?auto_67029 ?auto_67031 ) ) ( not ( = ?auto_67029 ?auto_67035 ) ) ( not ( = ?auto_67029 ?auto_67034 ) ) ( not ( = ?auto_67031 ?auto_67035 ) ) ( not ( = ?auto_67031 ?auto_67034 ) ) ( not ( = ?auto_67035 ?auto_67034 ) ) ( ON ?auto_67035 ?auto_67031 ) ( ON-TABLE ?auto_67030 ) ( ON ?auto_67033 ?auto_67030 ) ( not ( = ?auto_67030 ?auto_67033 ) ) ( not ( = ?auto_67030 ?auto_67032 ) ) ( not ( = ?auto_67030 ?auto_67034 ) ) ( not ( = ?auto_67033 ?auto_67032 ) ) ( not ( = ?auto_67033 ?auto_67034 ) ) ( not ( = ?auto_67032 ?auto_67034 ) ) ( not ( = ?auto_67029 ?auto_67032 ) ) ( not ( = ?auto_67029 ?auto_67030 ) ) ( not ( = ?auto_67029 ?auto_67033 ) ) ( not ( = ?auto_67031 ?auto_67032 ) ) ( not ( = ?auto_67031 ?auto_67030 ) ) ( not ( = ?auto_67031 ?auto_67033 ) ) ( not ( = ?auto_67035 ?auto_67032 ) ) ( not ( = ?auto_67035 ?auto_67030 ) ) ( not ( = ?auto_67035 ?auto_67033 ) ) ( ON ?auto_67034 ?auto_67035 ) ( CLEAR ?auto_67034 ) ( HOLDING ?auto_67032 ) ( CLEAR ?auto_67033 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_67030 ?auto_67033 ?auto_67032 )
      ( MAKE-1PILE ?auto_67029 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67036 - BLOCK
    )
    :vars
    (
      ?auto_67037 - BLOCK
      ?auto_67040 - BLOCK
      ?auto_67041 - BLOCK
      ?auto_67038 - BLOCK
      ?auto_67042 - BLOCK
      ?auto_67039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67037 ?auto_67036 ) ( ON-TABLE ?auto_67036 ) ( not ( = ?auto_67036 ?auto_67037 ) ) ( not ( = ?auto_67036 ?auto_67040 ) ) ( not ( = ?auto_67036 ?auto_67041 ) ) ( not ( = ?auto_67037 ?auto_67040 ) ) ( not ( = ?auto_67037 ?auto_67041 ) ) ( not ( = ?auto_67040 ?auto_67041 ) ) ( ON ?auto_67040 ?auto_67037 ) ( ON-TABLE ?auto_67038 ) ( ON ?auto_67042 ?auto_67038 ) ( not ( = ?auto_67038 ?auto_67042 ) ) ( not ( = ?auto_67038 ?auto_67039 ) ) ( not ( = ?auto_67038 ?auto_67041 ) ) ( not ( = ?auto_67042 ?auto_67039 ) ) ( not ( = ?auto_67042 ?auto_67041 ) ) ( not ( = ?auto_67039 ?auto_67041 ) ) ( not ( = ?auto_67036 ?auto_67039 ) ) ( not ( = ?auto_67036 ?auto_67038 ) ) ( not ( = ?auto_67036 ?auto_67042 ) ) ( not ( = ?auto_67037 ?auto_67039 ) ) ( not ( = ?auto_67037 ?auto_67038 ) ) ( not ( = ?auto_67037 ?auto_67042 ) ) ( not ( = ?auto_67040 ?auto_67039 ) ) ( not ( = ?auto_67040 ?auto_67038 ) ) ( not ( = ?auto_67040 ?auto_67042 ) ) ( ON ?auto_67041 ?auto_67040 ) ( CLEAR ?auto_67042 ) ( ON ?auto_67039 ?auto_67041 ) ( CLEAR ?auto_67039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_67036 ?auto_67037 ?auto_67040 ?auto_67041 )
      ( MAKE-1PILE ?auto_67036 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67043 - BLOCK
    )
    :vars
    (
      ?auto_67048 - BLOCK
      ?auto_67049 - BLOCK
      ?auto_67045 - BLOCK
      ?auto_67047 - BLOCK
      ?auto_67046 - BLOCK
      ?auto_67044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67048 ?auto_67043 ) ( ON-TABLE ?auto_67043 ) ( not ( = ?auto_67043 ?auto_67048 ) ) ( not ( = ?auto_67043 ?auto_67049 ) ) ( not ( = ?auto_67043 ?auto_67045 ) ) ( not ( = ?auto_67048 ?auto_67049 ) ) ( not ( = ?auto_67048 ?auto_67045 ) ) ( not ( = ?auto_67049 ?auto_67045 ) ) ( ON ?auto_67049 ?auto_67048 ) ( ON-TABLE ?auto_67047 ) ( not ( = ?auto_67047 ?auto_67046 ) ) ( not ( = ?auto_67047 ?auto_67044 ) ) ( not ( = ?auto_67047 ?auto_67045 ) ) ( not ( = ?auto_67046 ?auto_67044 ) ) ( not ( = ?auto_67046 ?auto_67045 ) ) ( not ( = ?auto_67044 ?auto_67045 ) ) ( not ( = ?auto_67043 ?auto_67044 ) ) ( not ( = ?auto_67043 ?auto_67047 ) ) ( not ( = ?auto_67043 ?auto_67046 ) ) ( not ( = ?auto_67048 ?auto_67044 ) ) ( not ( = ?auto_67048 ?auto_67047 ) ) ( not ( = ?auto_67048 ?auto_67046 ) ) ( not ( = ?auto_67049 ?auto_67044 ) ) ( not ( = ?auto_67049 ?auto_67047 ) ) ( not ( = ?auto_67049 ?auto_67046 ) ) ( ON ?auto_67045 ?auto_67049 ) ( ON ?auto_67044 ?auto_67045 ) ( CLEAR ?auto_67044 ) ( HOLDING ?auto_67046 ) ( CLEAR ?auto_67047 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67047 ?auto_67046 )
      ( MAKE-1PILE ?auto_67043 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67050 - BLOCK
    )
    :vars
    (
      ?auto_67054 - BLOCK
      ?auto_67056 - BLOCK
      ?auto_67055 - BLOCK
      ?auto_67053 - BLOCK
      ?auto_67052 - BLOCK
      ?auto_67051 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67054 ?auto_67050 ) ( ON-TABLE ?auto_67050 ) ( not ( = ?auto_67050 ?auto_67054 ) ) ( not ( = ?auto_67050 ?auto_67056 ) ) ( not ( = ?auto_67050 ?auto_67055 ) ) ( not ( = ?auto_67054 ?auto_67056 ) ) ( not ( = ?auto_67054 ?auto_67055 ) ) ( not ( = ?auto_67056 ?auto_67055 ) ) ( ON ?auto_67056 ?auto_67054 ) ( ON-TABLE ?auto_67053 ) ( not ( = ?auto_67053 ?auto_67052 ) ) ( not ( = ?auto_67053 ?auto_67051 ) ) ( not ( = ?auto_67053 ?auto_67055 ) ) ( not ( = ?auto_67052 ?auto_67051 ) ) ( not ( = ?auto_67052 ?auto_67055 ) ) ( not ( = ?auto_67051 ?auto_67055 ) ) ( not ( = ?auto_67050 ?auto_67051 ) ) ( not ( = ?auto_67050 ?auto_67053 ) ) ( not ( = ?auto_67050 ?auto_67052 ) ) ( not ( = ?auto_67054 ?auto_67051 ) ) ( not ( = ?auto_67054 ?auto_67053 ) ) ( not ( = ?auto_67054 ?auto_67052 ) ) ( not ( = ?auto_67056 ?auto_67051 ) ) ( not ( = ?auto_67056 ?auto_67053 ) ) ( not ( = ?auto_67056 ?auto_67052 ) ) ( ON ?auto_67055 ?auto_67056 ) ( ON ?auto_67051 ?auto_67055 ) ( CLEAR ?auto_67053 ) ( ON ?auto_67052 ?auto_67051 ) ( CLEAR ?auto_67052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67050 ?auto_67054 ?auto_67056 ?auto_67055 ?auto_67051 )
      ( MAKE-1PILE ?auto_67050 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67057 - BLOCK
    )
    :vars
    (
      ?auto_67062 - BLOCK
      ?auto_67060 - BLOCK
      ?auto_67063 - BLOCK
      ?auto_67058 - BLOCK
      ?auto_67061 - BLOCK
      ?auto_67059 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67062 ?auto_67057 ) ( ON-TABLE ?auto_67057 ) ( not ( = ?auto_67057 ?auto_67062 ) ) ( not ( = ?auto_67057 ?auto_67060 ) ) ( not ( = ?auto_67057 ?auto_67063 ) ) ( not ( = ?auto_67062 ?auto_67060 ) ) ( not ( = ?auto_67062 ?auto_67063 ) ) ( not ( = ?auto_67060 ?auto_67063 ) ) ( ON ?auto_67060 ?auto_67062 ) ( not ( = ?auto_67058 ?auto_67061 ) ) ( not ( = ?auto_67058 ?auto_67059 ) ) ( not ( = ?auto_67058 ?auto_67063 ) ) ( not ( = ?auto_67061 ?auto_67059 ) ) ( not ( = ?auto_67061 ?auto_67063 ) ) ( not ( = ?auto_67059 ?auto_67063 ) ) ( not ( = ?auto_67057 ?auto_67059 ) ) ( not ( = ?auto_67057 ?auto_67058 ) ) ( not ( = ?auto_67057 ?auto_67061 ) ) ( not ( = ?auto_67062 ?auto_67059 ) ) ( not ( = ?auto_67062 ?auto_67058 ) ) ( not ( = ?auto_67062 ?auto_67061 ) ) ( not ( = ?auto_67060 ?auto_67059 ) ) ( not ( = ?auto_67060 ?auto_67058 ) ) ( not ( = ?auto_67060 ?auto_67061 ) ) ( ON ?auto_67063 ?auto_67060 ) ( ON ?auto_67059 ?auto_67063 ) ( ON ?auto_67061 ?auto_67059 ) ( CLEAR ?auto_67061 ) ( HOLDING ?auto_67058 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_67058 )
      ( MAKE-1PILE ?auto_67057 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67064 - BLOCK
    )
    :vars
    (
      ?auto_67069 - BLOCK
      ?auto_67067 - BLOCK
      ?auto_67070 - BLOCK
      ?auto_67068 - BLOCK
      ?auto_67066 - BLOCK
      ?auto_67065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67069 ?auto_67064 ) ( ON-TABLE ?auto_67064 ) ( not ( = ?auto_67064 ?auto_67069 ) ) ( not ( = ?auto_67064 ?auto_67067 ) ) ( not ( = ?auto_67064 ?auto_67070 ) ) ( not ( = ?auto_67069 ?auto_67067 ) ) ( not ( = ?auto_67069 ?auto_67070 ) ) ( not ( = ?auto_67067 ?auto_67070 ) ) ( ON ?auto_67067 ?auto_67069 ) ( not ( = ?auto_67068 ?auto_67066 ) ) ( not ( = ?auto_67068 ?auto_67065 ) ) ( not ( = ?auto_67068 ?auto_67070 ) ) ( not ( = ?auto_67066 ?auto_67065 ) ) ( not ( = ?auto_67066 ?auto_67070 ) ) ( not ( = ?auto_67065 ?auto_67070 ) ) ( not ( = ?auto_67064 ?auto_67065 ) ) ( not ( = ?auto_67064 ?auto_67068 ) ) ( not ( = ?auto_67064 ?auto_67066 ) ) ( not ( = ?auto_67069 ?auto_67065 ) ) ( not ( = ?auto_67069 ?auto_67068 ) ) ( not ( = ?auto_67069 ?auto_67066 ) ) ( not ( = ?auto_67067 ?auto_67065 ) ) ( not ( = ?auto_67067 ?auto_67068 ) ) ( not ( = ?auto_67067 ?auto_67066 ) ) ( ON ?auto_67070 ?auto_67067 ) ( ON ?auto_67065 ?auto_67070 ) ( ON ?auto_67066 ?auto_67065 ) ( ON ?auto_67068 ?auto_67066 ) ( CLEAR ?auto_67068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_67064 ?auto_67069 ?auto_67067 ?auto_67070 ?auto_67065 ?auto_67066 )
      ( MAKE-1PILE ?auto_67064 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_67077 - BLOCK
      ?auto_67078 - BLOCK
      ?auto_67079 - BLOCK
      ?auto_67080 - BLOCK
      ?auto_67081 - BLOCK
      ?auto_67082 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_67082 ) ( CLEAR ?auto_67081 ) ( ON-TABLE ?auto_67077 ) ( ON ?auto_67078 ?auto_67077 ) ( ON ?auto_67079 ?auto_67078 ) ( ON ?auto_67080 ?auto_67079 ) ( ON ?auto_67081 ?auto_67080 ) ( not ( = ?auto_67077 ?auto_67078 ) ) ( not ( = ?auto_67077 ?auto_67079 ) ) ( not ( = ?auto_67077 ?auto_67080 ) ) ( not ( = ?auto_67077 ?auto_67081 ) ) ( not ( = ?auto_67077 ?auto_67082 ) ) ( not ( = ?auto_67078 ?auto_67079 ) ) ( not ( = ?auto_67078 ?auto_67080 ) ) ( not ( = ?auto_67078 ?auto_67081 ) ) ( not ( = ?auto_67078 ?auto_67082 ) ) ( not ( = ?auto_67079 ?auto_67080 ) ) ( not ( = ?auto_67079 ?auto_67081 ) ) ( not ( = ?auto_67079 ?auto_67082 ) ) ( not ( = ?auto_67080 ?auto_67081 ) ) ( not ( = ?auto_67080 ?auto_67082 ) ) ( not ( = ?auto_67081 ?auto_67082 ) ) )
    :subtasks
    ( ( !STACK ?auto_67082 ?auto_67081 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_67083 - BLOCK
      ?auto_67084 - BLOCK
      ?auto_67085 - BLOCK
      ?auto_67086 - BLOCK
      ?auto_67087 - BLOCK
      ?auto_67088 - BLOCK
    )
    :vars
    (
      ?auto_67089 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_67087 ) ( ON-TABLE ?auto_67083 ) ( ON ?auto_67084 ?auto_67083 ) ( ON ?auto_67085 ?auto_67084 ) ( ON ?auto_67086 ?auto_67085 ) ( ON ?auto_67087 ?auto_67086 ) ( not ( = ?auto_67083 ?auto_67084 ) ) ( not ( = ?auto_67083 ?auto_67085 ) ) ( not ( = ?auto_67083 ?auto_67086 ) ) ( not ( = ?auto_67083 ?auto_67087 ) ) ( not ( = ?auto_67083 ?auto_67088 ) ) ( not ( = ?auto_67084 ?auto_67085 ) ) ( not ( = ?auto_67084 ?auto_67086 ) ) ( not ( = ?auto_67084 ?auto_67087 ) ) ( not ( = ?auto_67084 ?auto_67088 ) ) ( not ( = ?auto_67085 ?auto_67086 ) ) ( not ( = ?auto_67085 ?auto_67087 ) ) ( not ( = ?auto_67085 ?auto_67088 ) ) ( not ( = ?auto_67086 ?auto_67087 ) ) ( not ( = ?auto_67086 ?auto_67088 ) ) ( not ( = ?auto_67087 ?auto_67088 ) ) ( ON ?auto_67088 ?auto_67089 ) ( CLEAR ?auto_67088 ) ( HAND-EMPTY ) ( not ( = ?auto_67083 ?auto_67089 ) ) ( not ( = ?auto_67084 ?auto_67089 ) ) ( not ( = ?auto_67085 ?auto_67089 ) ) ( not ( = ?auto_67086 ?auto_67089 ) ) ( not ( = ?auto_67087 ?auto_67089 ) ) ( not ( = ?auto_67088 ?auto_67089 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_67088 ?auto_67089 )
      ( MAKE-6PILE ?auto_67083 ?auto_67084 ?auto_67085 ?auto_67086 ?auto_67087 ?auto_67088 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_67090 - BLOCK
      ?auto_67091 - BLOCK
      ?auto_67092 - BLOCK
      ?auto_67093 - BLOCK
      ?auto_67094 - BLOCK
      ?auto_67095 - BLOCK
    )
    :vars
    (
      ?auto_67096 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67090 ) ( ON ?auto_67091 ?auto_67090 ) ( ON ?auto_67092 ?auto_67091 ) ( ON ?auto_67093 ?auto_67092 ) ( not ( = ?auto_67090 ?auto_67091 ) ) ( not ( = ?auto_67090 ?auto_67092 ) ) ( not ( = ?auto_67090 ?auto_67093 ) ) ( not ( = ?auto_67090 ?auto_67094 ) ) ( not ( = ?auto_67090 ?auto_67095 ) ) ( not ( = ?auto_67091 ?auto_67092 ) ) ( not ( = ?auto_67091 ?auto_67093 ) ) ( not ( = ?auto_67091 ?auto_67094 ) ) ( not ( = ?auto_67091 ?auto_67095 ) ) ( not ( = ?auto_67092 ?auto_67093 ) ) ( not ( = ?auto_67092 ?auto_67094 ) ) ( not ( = ?auto_67092 ?auto_67095 ) ) ( not ( = ?auto_67093 ?auto_67094 ) ) ( not ( = ?auto_67093 ?auto_67095 ) ) ( not ( = ?auto_67094 ?auto_67095 ) ) ( ON ?auto_67095 ?auto_67096 ) ( CLEAR ?auto_67095 ) ( not ( = ?auto_67090 ?auto_67096 ) ) ( not ( = ?auto_67091 ?auto_67096 ) ) ( not ( = ?auto_67092 ?auto_67096 ) ) ( not ( = ?auto_67093 ?auto_67096 ) ) ( not ( = ?auto_67094 ?auto_67096 ) ) ( not ( = ?auto_67095 ?auto_67096 ) ) ( HOLDING ?auto_67094 ) ( CLEAR ?auto_67093 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67090 ?auto_67091 ?auto_67092 ?auto_67093 ?auto_67094 )
      ( MAKE-6PILE ?auto_67090 ?auto_67091 ?auto_67092 ?auto_67093 ?auto_67094 ?auto_67095 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_67097 - BLOCK
      ?auto_67098 - BLOCK
      ?auto_67099 - BLOCK
      ?auto_67100 - BLOCK
      ?auto_67101 - BLOCK
      ?auto_67102 - BLOCK
    )
    :vars
    (
      ?auto_67103 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67097 ) ( ON ?auto_67098 ?auto_67097 ) ( ON ?auto_67099 ?auto_67098 ) ( ON ?auto_67100 ?auto_67099 ) ( not ( = ?auto_67097 ?auto_67098 ) ) ( not ( = ?auto_67097 ?auto_67099 ) ) ( not ( = ?auto_67097 ?auto_67100 ) ) ( not ( = ?auto_67097 ?auto_67101 ) ) ( not ( = ?auto_67097 ?auto_67102 ) ) ( not ( = ?auto_67098 ?auto_67099 ) ) ( not ( = ?auto_67098 ?auto_67100 ) ) ( not ( = ?auto_67098 ?auto_67101 ) ) ( not ( = ?auto_67098 ?auto_67102 ) ) ( not ( = ?auto_67099 ?auto_67100 ) ) ( not ( = ?auto_67099 ?auto_67101 ) ) ( not ( = ?auto_67099 ?auto_67102 ) ) ( not ( = ?auto_67100 ?auto_67101 ) ) ( not ( = ?auto_67100 ?auto_67102 ) ) ( not ( = ?auto_67101 ?auto_67102 ) ) ( ON ?auto_67102 ?auto_67103 ) ( not ( = ?auto_67097 ?auto_67103 ) ) ( not ( = ?auto_67098 ?auto_67103 ) ) ( not ( = ?auto_67099 ?auto_67103 ) ) ( not ( = ?auto_67100 ?auto_67103 ) ) ( not ( = ?auto_67101 ?auto_67103 ) ) ( not ( = ?auto_67102 ?auto_67103 ) ) ( CLEAR ?auto_67100 ) ( ON ?auto_67101 ?auto_67102 ) ( CLEAR ?auto_67101 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_67103 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67103 ?auto_67102 )
      ( MAKE-6PILE ?auto_67097 ?auto_67098 ?auto_67099 ?auto_67100 ?auto_67101 ?auto_67102 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_67104 - BLOCK
      ?auto_67105 - BLOCK
      ?auto_67106 - BLOCK
      ?auto_67107 - BLOCK
      ?auto_67108 - BLOCK
      ?auto_67109 - BLOCK
    )
    :vars
    (
      ?auto_67110 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67104 ) ( ON ?auto_67105 ?auto_67104 ) ( ON ?auto_67106 ?auto_67105 ) ( not ( = ?auto_67104 ?auto_67105 ) ) ( not ( = ?auto_67104 ?auto_67106 ) ) ( not ( = ?auto_67104 ?auto_67107 ) ) ( not ( = ?auto_67104 ?auto_67108 ) ) ( not ( = ?auto_67104 ?auto_67109 ) ) ( not ( = ?auto_67105 ?auto_67106 ) ) ( not ( = ?auto_67105 ?auto_67107 ) ) ( not ( = ?auto_67105 ?auto_67108 ) ) ( not ( = ?auto_67105 ?auto_67109 ) ) ( not ( = ?auto_67106 ?auto_67107 ) ) ( not ( = ?auto_67106 ?auto_67108 ) ) ( not ( = ?auto_67106 ?auto_67109 ) ) ( not ( = ?auto_67107 ?auto_67108 ) ) ( not ( = ?auto_67107 ?auto_67109 ) ) ( not ( = ?auto_67108 ?auto_67109 ) ) ( ON ?auto_67109 ?auto_67110 ) ( not ( = ?auto_67104 ?auto_67110 ) ) ( not ( = ?auto_67105 ?auto_67110 ) ) ( not ( = ?auto_67106 ?auto_67110 ) ) ( not ( = ?auto_67107 ?auto_67110 ) ) ( not ( = ?auto_67108 ?auto_67110 ) ) ( not ( = ?auto_67109 ?auto_67110 ) ) ( ON ?auto_67108 ?auto_67109 ) ( CLEAR ?auto_67108 ) ( ON-TABLE ?auto_67110 ) ( HOLDING ?auto_67107 ) ( CLEAR ?auto_67106 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_67104 ?auto_67105 ?auto_67106 ?auto_67107 )
      ( MAKE-6PILE ?auto_67104 ?auto_67105 ?auto_67106 ?auto_67107 ?auto_67108 ?auto_67109 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_67111 - BLOCK
      ?auto_67112 - BLOCK
      ?auto_67113 - BLOCK
      ?auto_67114 - BLOCK
      ?auto_67115 - BLOCK
      ?auto_67116 - BLOCK
    )
    :vars
    (
      ?auto_67117 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67111 ) ( ON ?auto_67112 ?auto_67111 ) ( ON ?auto_67113 ?auto_67112 ) ( not ( = ?auto_67111 ?auto_67112 ) ) ( not ( = ?auto_67111 ?auto_67113 ) ) ( not ( = ?auto_67111 ?auto_67114 ) ) ( not ( = ?auto_67111 ?auto_67115 ) ) ( not ( = ?auto_67111 ?auto_67116 ) ) ( not ( = ?auto_67112 ?auto_67113 ) ) ( not ( = ?auto_67112 ?auto_67114 ) ) ( not ( = ?auto_67112 ?auto_67115 ) ) ( not ( = ?auto_67112 ?auto_67116 ) ) ( not ( = ?auto_67113 ?auto_67114 ) ) ( not ( = ?auto_67113 ?auto_67115 ) ) ( not ( = ?auto_67113 ?auto_67116 ) ) ( not ( = ?auto_67114 ?auto_67115 ) ) ( not ( = ?auto_67114 ?auto_67116 ) ) ( not ( = ?auto_67115 ?auto_67116 ) ) ( ON ?auto_67116 ?auto_67117 ) ( not ( = ?auto_67111 ?auto_67117 ) ) ( not ( = ?auto_67112 ?auto_67117 ) ) ( not ( = ?auto_67113 ?auto_67117 ) ) ( not ( = ?auto_67114 ?auto_67117 ) ) ( not ( = ?auto_67115 ?auto_67117 ) ) ( not ( = ?auto_67116 ?auto_67117 ) ) ( ON ?auto_67115 ?auto_67116 ) ( ON-TABLE ?auto_67117 ) ( CLEAR ?auto_67113 ) ( ON ?auto_67114 ?auto_67115 ) ( CLEAR ?auto_67114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_67117 ?auto_67116 ?auto_67115 )
      ( MAKE-6PILE ?auto_67111 ?auto_67112 ?auto_67113 ?auto_67114 ?auto_67115 ?auto_67116 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_67118 - BLOCK
      ?auto_67119 - BLOCK
      ?auto_67120 - BLOCK
      ?auto_67121 - BLOCK
      ?auto_67122 - BLOCK
      ?auto_67123 - BLOCK
    )
    :vars
    (
      ?auto_67124 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67118 ) ( ON ?auto_67119 ?auto_67118 ) ( not ( = ?auto_67118 ?auto_67119 ) ) ( not ( = ?auto_67118 ?auto_67120 ) ) ( not ( = ?auto_67118 ?auto_67121 ) ) ( not ( = ?auto_67118 ?auto_67122 ) ) ( not ( = ?auto_67118 ?auto_67123 ) ) ( not ( = ?auto_67119 ?auto_67120 ) ) ( not ( = ?auto_67119 ?auto_67121 ) ) ( not ( = ?auto_67119 ?auto_67122 ) ) ( not ( = ?auto_67119 ?auto_67123 ) ) ( not ( = ?auto_67120 ?auto_67121 ) ) ( not ( = ?auto_67120 ?auto_67122 ) ) ( not ( = ?auto_67120 ?auto_67123 ) ) ( not ( = ?auto_67121 ?auto_67122 ) ) ( not ( = ?auto_67121 ?auto_67123 ) ) ( not ( = ?auto_67122 ?auto_67123 ) ) ( ON ?auto_67123 ?auto_67124 ) ( not ( = ?auto_67118 ?auto_67124 ) ) ( not ( = ?auto_67119 ?auto_67124 ) ) ( not ( = ?auto_67120 ?auto_67124 ) ) ( not ( = ?auto_67121 ?auto_67124 ) ) ( not ( = ?auto_67122 ?auto_67124 ) ) ( not ( = ?auto_67123 ?auto_67124 ) ) ( ON ?auto_67122 ?auto_67123 ) ( ON-TABLE ?auto_67124 ) ( ON ?auto_67121 ?auto_67122 ) ( CLEAR ?auto_67121 ) ( HOLDING ?auto_67120 ) ( CLEAR ?auto_67119 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_67118 ?auto_67119 ?auto_67120 )
      ( MAKE-6PILE ?auto_67118 ?auto_67119 ?auto_67120 ?auto_67121 ?auto_67122 ?auto_67123 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_67125 - BLOCK
      ?auto_67126 - BLOCK
      ?auto_67127 - BLOCK
      ?auto_67128 - BLOCK
      ?auto_67129 - BLOCK
      ?auto_67130 - BLOCK
    )
    :vars
    (
      ?auto_67131 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67125 ) ( ON ?auto_67126 ?auto_67125 ) ( not ( = ?auto_67125 ?auto_67126 ) ) ( not ( = ?auto_67125 ?auto_67127 ) ) ( not ( = ?auto_67125 ?auto_67128 ) ) ( not ( = ?auto_67125 ?auto_67129 ) ) ( not ( = ?auto_67125 ?auto_67130 ) ) ( not ( = ?auto_67126 ?auto_67127 ) ) ( not ( = ?auto_67126 ?auto_67128 ) ) ( not ( = ?auto_67126 ?auto_67129 ) ) ( not ( = ?auto_67126 ?auto_67130 ) ) ( not ( = ?auto_67127 ?auto_67128 ) ) ( not ( = ?auto_67127 ?auto_67129 ) ) ( not ( = ?auto_67127 ?auto_67130 ) ) ( not ( = ?auto_67128 ?auto_67129 ) ) ( not ( = ?auto_67128 ?auto_67130 ) ) ( not ( = ?auto_67129 ?auto_67130 ) ) ( ON ?auto_67130 ?auto_67131 ) ( not ( = ?auto_67125 ?auto_67131 ) ) ( not ( = ?auto_67126 ?auto_67131 ) ) ( not ( = ?auto_67127 ?auto_67131 ) ) ( not ( = ?auto_67128 ?auto_67131 ) ) ( not ( = ?auto_67129 ?auto_67131 ) ) ( not ( = ?auto_67130 ?auto_67131 ) ) ( ON ?auto_67129 ?auto_67130 ) ( ON-TABLE ?auto_67131 ) ( ON ?auto_67128 ?auto_67129 ) ( CLEAR ?auto_67126 ) ( ON ?auto_67127 ?auto_67128 ) ( CLEAR ?auto_67127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_67131 ?auto_67130 ?auto_67129 ?auto_67128 )
      ( MAKE-6PILE ?auto_67125 ?auto_67126 ?auto_67127 ?auto_67128 ?auto_67129 ?auto_67130 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_67132 - BLOCK
      ?auto_67133 - BLOCK
      ?auto_67134 - BLOCK
      ?auto_67135 - BLOCK
      ?auto_67136 - BLOCK
      ?auto_67137 - BLOCK
    )
    :vars
    (
      ?auto_67138 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67132 ) ( not ( = ?auto_67132 ?auto_67133 ) ) ( not ( = ?auto_67132 ?auto_67134 ) ) ( not ( = ?auto_67132 ?auto_67135 ) ) ( not ( = ?auto_67132 ?auto_67136 ) ) ( not ( = ?auto_67132 ?auto_67137 ) ) ( not ( = ?auto_67133 ?auto_67134 ) ) ( not ( = ?auto_67133 ?auto_67135 ) ) ( not ( = ?auto_67133 ?auto_67136 ) ) ( not ( = ?auto_67133 ?auto_67137 ) ) ( not ( = ?auto_67134 ?auto_67135 ) ) ( not ( = ?auto_67134 ?auto_67136 ) ) ( not ( = ?auto_67134 ?auto_67137 ) ) ( not ( = ?auto_67135 ?auto_67136 ) ) ( not ( = ?auto_67135 ?auto_67137 ) ) ( not ( = ?auto_67136 ?auto_67137 ) ) ( ON ?auto_67137 ?auto_67138 ) ( not ( = ?auto_67132 ?auto_67138 ) ) ( not ( = ?auto_67133 ?auto_67138 ) ) ( not ( = ?auto_67134 ?auto_67138 ) ) ( not ( = ?auto_67135 ?auto_67138 ) ) ( not ( = ?auto_67136 ?auto_67138 ) ) ( not ( = ?auto_67137 ?auto_67138 ) ) ( ON ?auto_67136 ?auto_67137 ) ( ON-TABLE ?auto_67138 ) ( ON ?auto_67135 ?auto_67136 ) ( ON ?auto_67134 ?auto_67135 ) ( CLEAR ?auto_67134 ) ( HOLDING ?auto_67133 ) ( CLEAR ?auto_67132 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67132 ?auto_67133 )
      ( MAKE-6PILE ?auto_67132 ?auto_67133 ?auto_67134 ?auto_67135 ?auto_67136 ?auto_67137 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_67139 - BLOCK
      ?auto_67140 - BLOCK
      ?auto_67141 - BLOCK
      ?auto_67142 - BLOCK
      ?auto_67143 - BLOCK
      ?auto_67144 - BLOCK
    )
    :vars
    (
      ?auto_67145 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67139 ) ( not ( = ?auto_67139 ?auto_67140 ) ) ( not ( = ?auto_67139 ?auto_67141 ) ) ( not ( = ?auto_67139 ?auto_67142 ) ) ( not ( = ?auto_67139 ?auto_67143 ) ) ( not ( = ?auto_67139 ?auto_67144 ) ) ( not ( = ?auto_67140 ?auto_67141 ) ) ( not ( = ?auto_67140 ?auto_67142 ) ) ( not ( = ?auto_67140 ?auto_67143 ) ) ( not ( = ?auto_67140 ?auto_67144 ) ) ( not ( = ?auto_67141 ?auto_67142 ) ) ( not ( = ?auto_67141 ?auto_67143 ) ) ( not ( = ?auto_67141 ?auto_67144 ) ) ( not ( = ?auto_67142 ?auto_67143 ) ) ( not ( = ?auto_67142 ?auto_67144 ) ) ( not ( = ?auto_67143 ?auto_67144 ) ) ( ON ?auto_67144 ?auto_67145 ) ( not ( = ?auto_67139 ?auto_67145 ) ) ( not ( = ?auto_67140 ?auto_67145 ) ) ( not ( = ?auto_67141 ?auto_67145 ) ) ( not ( = ?auto_67142 ?auto_67145 ) ) ( not ( = ?auto_67143 ?auto_67145 ) ) ( not ( = ?auto_67144 ?auto_67145 ) ) ( ON ?auto_67143 ?auto_67144 ) ( ON-TABLE ?auto_67145 ) ( ON ?auto_67142 ?auto_67143 ) ( ON ?auto_67141 ?auto_67142 ) ( CLEAR ?auto_67139 ) ( ON ?auto_67140 ?auto_67141 ) ( CLEAR ?auto_67140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67145 ?auto_67144 ?auto_67143 ?auto_67142 ?auto_67141 )
      ( MAKE-6PILE ?auto_67139 ?auto_67140 ?auto_67141 ?auto_67142 ?auto_67143 ?auto_67144 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_67146 - BLOCK
      ?auto_67147 - BLOCK
      ?auto_67148 - BLOCK
      ?auto_67149 - BLOCK
      ?auto_67150 - BLOCK
      ?auto_67151 - BLOCK
    )
    :vars
    (
      ?auto_67152 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67146 ?auto_67147 ) ) ( not ( = ?auto_67146 ?auto_67148 ) ) ( not ( = ?auto_67146 ?auto_67149 ) ) ( not ( = ?auto_67146 ?auto_67150 ) ) ( not ( = ?auto_67146 ?auto_67151 ) ) ( not ( = ?auto_67147 ?auto_67148 ) ) ( not ( = ?auto_67147 ?auto_67149 ) ) ( not ( = ?auto_67147 ?auto_67150 ) ) ( not ( = ?auto_67147 ?auto_67151 ) ) ( not ( = ?auto_67148 ?auto_67149 ) ) ( not ( = ?auto_67148 ?auto_67150 ) ) ( not ( = ?auto_67148 ?auto_67151 ) ) ( not ( = ?auto_67149 ?auto_67150 ) ) ( not ( = ?auto_67149 ?auto_67151 ) ) ( not ( = ?auto_67150 ?auto_67151 ) ) ( ON ?auto_67151 ?auto_67152 ) ( not ( = ?auto_67146 ?auto_67152 ) ) ( not ( = ?auto_67147 ?auto_67152 ) ) ( not ( = ?auto_67148 ?auto_67152 ) ) ( not ( = ?auto_67149 ?auto_67152 ) ) ( not ( = ?auto_67150 ?auto_67152 ) ) ( not ( = ?auto_67151 ?auto_67152 ) ) ( ON ?auto_67150 ?auto_67151 ) ( ON-TABLE ?auto_67152 ) ( ON ?auto_67149 ?auto_67150 ) ( ON ?auto_67148 ?auto_67149 ) ( ON ?auto_67147 ?auto_67148 ) ( CLEAR ?auto_67147 ) ( HOLDING ?auto_67146 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_67146 )
      ( MAKE-6PILE ?auto_67146 ?auto_67147 ?auto_67148 ?auto_67149 ?auto_67150 ?auto_67151 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_67153 - BLOCK
      ?auto_67154 - BLOCK
      ?auto_67155 - BLOCK
      ?auto_67156 - BLOCK
      ?auto_67157 - BLOCK
      ?auto_67158 - BLOCK
    )
    :vars
    (
      ?auto_67159 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67153 ?auto_67154 ) ) ( not ( = ?auto_67153 ?auto_67155 ) ) ( not ( = ?auto_67153 ?auto_67156 ) ) ( not ( = ?auto_67153 ?auto_67157 ) ) ( not ( = ?auto_67153 ?auto_67158 ) ) ( not ( = ?auto_67154 ?auto_67155 ) ) ( not ( = ?auto_67154 ?auto_67156 ) ) ( not ( = ?auto_67154 ?auto_67157 ) ) ( not ( = ?auto_67154 ?auto_67158 ) ) ( not ( = ?auto_67155 ?auto_67156 ) ) ( not ( = ?auto_67155 ?auto_67157 ) ) ( not ( = ?auto_67155 ?auto_67158 ) ) ( not ( = ?auto_67156 ?auto_67157 ) ) ( not ( = ?auto_67156 ?auto_67158 ) ) ( not ( = ?auto_67157 ?auto_67158 ) ) ( ON ?auto_67158 ?auto_67159 ) ( not ( = ?auto_67153 ?auto_67159 ) ) ( not ( = ?auto_67154 ?auto_67159 ) ) ( not ( = ?auto_67155 ?auto_67159 ) ) ( not ( = ?auto_67156 ?auto_67159 ) ) ( not ( = ?auto_67157 ?auto_67159 ) ) ( not ( = ?auto_67158 ?auto_67159 ) ) ( ON ?auto_67157 ?auto_67158 ) ( ON-TABLE ?auto_67159 ) ( ON ?auto_67156 ?auto_67157 ) ( ON ?auto_67155 ?auto_67156 ) ( ON ?auto_67154 ?auto_67155 ) ( ON ?auto_67153 ?auto_67154 ) ( CLEAR ?auto_67153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_67159 ?auto_67158 ?auto_67157 ?auto_67156 ?auto_67155 ?auto_67154 )
      ( MAKE-6PILE ?auto_67153 ?auto_67154 ?auto_67155 ?auto_67156 ?auto_67157 ?auto_67158 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_67165 - BLOCK
      ?auto_67166 - BLOCK
      ?auto_67167 - BLOCK
      ?auto_67168 - BLOCK
      ?auto_67169 - BLOCK
    )
    :vars
    (
      ?auto_67170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67170 ?auto_67169 ) ( CLEAR ?auto_67170 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_67165 ) ( ON ?auto_67166 ?auto_67165 ) ( ON ?auto_67167 ?auto_67166 ) ( ON ?auto_67168 ?auto_67167 ) ( ON ?auto_67169 ?auto_67168 ) ( not ( = ?auto_67165 ?auto_67166 ) ) ( not ( = ?auto_67165 ?auto_67167 ) ) ( not ( = ?auto_67165 ?auto_67168 ) ) ( not ( = ?auto_67165 ?auto_67169 ) ) ( not ( = ?auto_67165 ?auto_67170 ) ) ( not ( = ?auto_67166 ?auto_67167 ) ) ( not ( = ?auto_67166 ?auto_67168 ) ) ( not ( = ?auto_67166 ?auto_67169 ) ) ( not ( = ?auto_67166 ?auto_67170 ) ) ( not ( = ?auto_67167 ?auto_67168 ) ) ( not ( = ?auto_67167 ?auto_67169 ) ) ( not ( = ?auto_67167 ?auto_67170 ) ) ( not ( = ?auto_67168 ?auto_67169 ) ) ( not ( = ?auto_67168 ?auto_67170 ) ) ( not ( = ?auto_67169 ?auto_67170 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_67170 ?auto_67169 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_67184 - BLOCK
      ?auto_67185 - BLOCK
      ?auto_67186 - BLOCK
      ?auto_67187 - BLOCK
      ?auto_67188 - BLOCK
    )
    :vars
    (
      ?auto_67189 - BLOCK
      ?auto_67190 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67184 ) ( ON ?auto_67185 ?auto_67184 ) ( ON ?auto_67186 ?auto_67185 ) ( ON ?auto_67187 ?auto_67186 ) ( not ( = ?auto_67184 ?auto_67185 ) ) ( not ( = ?auto_67184 ?auto_67186 ) ) ( not ( = ?auto_67184 ?auto_67187 ) ) ( not ( = ?auto_67184 ?auto_67188 ) ) ( not ( = ?auto_67184 ?auto_67189 ) ) ( not ( = ?auto_67185 ?auto_67186 ) ) ( not ( = ?auto_67185 ?auto_67187 ) ) ( not ( = ?auto_67185 ?auto_67188 ) ) ( not ( = ?auto_67185 ?auto_67189 ) ) ( not ( = ?auto_67186 ?auto_67187 ) ) ( not ( = ?auto_67186 ?auto_67188 ) ) ( not ( = ?auto_67186 ?auto_67189 ) ) ( not ( = ?auto_67187 ?auto_67188 ) ) ( not ( = ?auto_67187 ?auto_67189 ) ) ( not ( = ?auto_67188 ?auto_67189 ) ) ( ON ?auto_67189 ?auto_67190 ) ( CLEAR ?auto_67189 ) ( not ( = ?auto_67184 ?auto_67190 ) ) ( not ( = ?auto_67185 ?auto_67190 ) ) ( not ( = ?auto_67186 ?auto_67190 ) ) ( not ( = ?auto_67187 ?auto_67190 ) ) ( not ( = ?auto_67188 ?auto_67190 ) ) ( not ( = ?auto_67189 ?auto_67190 ) ) ( HOLDING ?auto_67188 ) ( CLEAR ?auto_67187 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_67184 ?auto_67185 ?auto_67186 ?auto_67187 ?auto_67188 ?auto_67189 )
      ( MAKE-5PILE ?auto_67184 ?auto_67185 ?auto_67186 ?auto_67187 ?auto_67188 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_67191 - BLOCK
      ?auto_67192 - BLOCK
      ?auto_67193 - BLOCK
      ?auto_67194 - BLOCK
      ?auto_67195 - BLOCK
    )
    :vars
    (
      ?auto_67196 - BLOCK
      ?auto_67197 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67191 ) ( ON ?auto_67192 ?auto_67191 ) ( ON ?auto_67193 ?auto_67192 ) ( ON ?auto_67194 ?auto_67193 ) ( not ( = ?auto_67191 ?auto_67192 ) ) ( not ( = ?auto_67191 ?auto_67193 ) ) ( not ( = ?auto_67191 ?auto_67194 ) ) ( not ( = ?auto_67191 ?auto_67195 ) ) ( not ( = ?auto_67191 ?auto_67196 ) ) ( not ( = ?auto_67192 ?auto_67193 ) ) ( not ( = ?auto_67192 ?auto_67194 ) ) ( not ( = ?auto_67192 ?auto_67195 ) ) ( not ( = ?auto_67192 ?auto_67196 ) ) ( not ( = ?auto_67193 ?auto_67194 ) ) ( not ( = ?auto_67193 ?auto_67195 ) ) ( not ( = ?auto_67193 ?auto_67196 ) ) ( not ( = ?auto_67194 ?auto_67195 ) ) ( not ( = ?auto_67194 ?auto_67196 ) ) ( not ( = ?auto_67195 ?auto_67196 ) ) ( ON ?auto_67196 ?auto_67197 ) ( not ( = ?auto_67191 ?auto_67197 ) ) ( not ( = ?auto_67192 ?auto_67197 ) ) ( not ( = ?auto_67193 ?auto_67197 ) ) ( not ( = ?auto_67194 ?auto_67197 ) ) ( not ( = ?auto_67195 ?auto_67197 ) ) ( not ( = ?auto_67196 ?auto_67197 ) ) ( CLEAR ?auto_67194 ) ( ON ?auto_67195 ?auto_67196 ) ( CLEAR ?auto_67195 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_67197 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67197 ?auto_67196 )
      ( MAKE-5PILE ?auto_67191 ?auto_67192 ?auto_67193 ?auto_67194 ?auto_67195 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_67198 - BLOCK
      ?auto_67199 - BLOCK
      ?auto_67200 - BLOCK
      ?auto_67201 - BLOCK
      ?auto_67202 - BLOCK
    )
    :vars
    (
      ?auto_67204 - BLOCK
      ?auto_67203 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67198 ) ( ON ?auto_67199 ?auto_67198 ) ( ON ?auto_67200 ?auto_67199 ) ( not ( = ?auto_67198 ?auto_67199 ) ) ( not ( = ?auto_67198 ?auto_67200 ) ) ( not ( = ?auto_67198 ?auto_67201 ) ) ( not ( = ?auto_67198 ?auto_67202 ) ) ( not ( = ?auto_67198 ?auto_67204 ) ) ( not ( = ?auto_67199 ?auto_67200 ) ) ( not ( = ?auto_67199 ?auto_67201 ) ) ( not ( = ?auto_67199 ?auto_67202 ) ) ( not ( = ?auto_67199 ?auto_67204 ) ) ( not ( = ?auto_67200 ?auto_67201 ) ) ( not ( = ?auto_67200 ?auto_67202 ) ) ( not ( = ?auto_67200 ?auto_67204 ) ) ( not ( = ?auto_67201 ?auto_67202 ) ) ( not ( = ?auto_67201 ?auto_67204 ) ) ( not ( = ?auto_67202 ?auto_67204 ) ) ( ON ?auto_67204 ?auto_67203 ) ( not ( = ?auto_67198 ?auto_67203 ) ) ( not ( = ?auto_67199 ?auto_67203 ) ) ( not ( = ?auto_67200 ?auto_67203 ) ) ( not ( = ?auto_67201 ?auto_67203 ) ) ( not ( = ?auto_67202 ?auto_67203 ) ) ( not ( = ?auto_67204 ?auto_67203 ) ) ( ON ?auto_67202 ?auto_67204 ) ( CLEAR ?auto_67202 ) ( ON-TABLE ?auto_67203 ) ( HOLDING ?auto_67201 ) ( CLEAR ?auto_67200 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_67198 ?auto_67199 ?auto_67200 ?auto_67201 )
      ( MAKE-5PILE ?auto_67198 ?auto_67199 ?auto_67200 ?auto_67201 ?auto_67202 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_67205 - BLOCK
      ?auto_67206 - BLOCK
      ?auto_67207 - BLOCK
      ?auto_67208 - BLOCK
      ?auto_67209 - BLOCK
    )
    :vars
    (
      ?auto_67210 - BLOCK
      ?auto_67211 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67205 ) ( ON ?auto_67206 ?auto_67205 ) ( ON ?auto_67207 ?auto_67206 ) ( not ( = ?auto_67205 ?auto_67206 ) ) ( not ( = ?auto_67205 ?auto_67207 ) ) ( not ( = ?auto_67205 ?auto_67208 ) ) ( not ( = ?auto_67205 ?auto_67209 ) ) ( not ( = ?auto_67205 ?auto_67210 ) ) ( not ( = ?auto_67206 ?auto_67207 ) ) ( not ( = ?auto_67206 ?auto_67208 ) ) ( not ( = ?auto_67206 ?auto_67209 ) ) ( not ( = ?auto_67206 ?auto_67210 ) ) ( not ( = ?auto_67207 ?auto_67208 ) ) ( not ( = ?auto_67207 ?auto_67209 ) ) ( not ( = ?auto_67207 ?auto_67210 ) ) ( not ( = ?auto_67208 ?auto_67209 ) ) ( not ( = ?auto_67208 ?auto_67210 ) ) ( not ( = ?auto_67209 ?auto_67210 ) ) ( ON ?auto_67210 ?auto_67211 ) ( not ( = ?auto_67205 ?auto_67211 ) ) ( not ( = ?auto_67206 ?auto_67211 ) ) ( not ( = ?auto_67207 ?auto_67211 ) ) ( not ( = ?auto_67208 ?auto_67211 ) ) ( not ( = ?auto_67209 ?auto_67211 ) ) ( not ( = ?auto_67210 ?auto_67211 ) ) ( ON ?auto_67209 ?auto_67210 ) ( ON-TABLE ?auto_67211 ) ( CLEAR ?auto_67207 ) ( ON ?auto_67208 ?auto_67209 ) ( CLEAR ?auto_67208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_67211 ?auto_67210 ?auto_67209 )
      ( MAKE-5PILE ?auto_67205 ?auto_67206 ?auto_67207 ?auto_67208 ?auto_67209 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_67212 - BLOCK
      ?auto_67213 - BLOCK
      ?auto_67214 - BLOCK
      ?auto_67215 - BLOCK
      ?auto_67216 - BLOCK
    )
    :vars
    (
      ?auto_67217 - BLOCK
      ?auto_67218 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67212 ) ( ON ?auto_67213 ?auto_67212 ) ( not ( = ?auto_67212 ?auto_67213 ) ) ( not ( = ?auto_67212 ?auto_67214 ) ) ( not ( = ?auto_67212 ?auto_67215 ) ) ( not ( = ?auto_67212 ?auto_67216 ) ) ( not ( = ?auto_67212 ?auto_67217 ) ) ( not ( = ?auto_67213 ?auto_67214 ) ) ( not ( = ?auto_67213 ?auto_67215 ) ) ( not ( = ?auto_67213 ?auto_67216 ) ) ( not ( = ?auto_67213 ?auto_67217 ) ) ( not ( = ?auto_67214 ?auto_67215 ) ) ( not ( = ?auto_67214 ?auto_67216 ) ) ( not ( = ?auto_67214 ?auto_67217 ) ) ( not ( = ?auto_67215 ?auto_67216 ) ) ( not ( = ?auto_67215 ?auto_67217 ) ) ( not ( = ?auto_67216 ?auto_67217 ) ) ( ON ?auto_67217 ?auto_67218 ) ( not ( = ?auto_67212 ?auto_67218 ) ) ( not ( = ?auto_67213 ?auto_67218 ) ) ( not ( = ?auto_67214 ?auto_67218 ) ) ( not ( = ?auto_67215 ?auto_67218 ) ) ( not ( = ?auto_67216 ?auto_67218 ) ) ( not ( = ?auto_67217 ?auto_67218 ) ) ( ON ?auto_67216 ?auto_67217 ) ( ON-TABLE ?auto_67218 ) ( ON ?auto_67215 ?auto_67216 ) ( CLEAR ?auto_67215 ) ( HOLDING ?auto_67214 ) ( CLEAR ?auto_67213 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_67212 ?auto_67213 ?auto_67214 )
      ( MAKE-5PILE ?auto_67212 ?auto_67213 ?auto_67214 ?auto_67215 ?auto_67216 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_67219 - BLOCK
      ?auto_67220 - BLOCK
      ?auto_67221 - BLOCK
      ?auto_67222 - BLOCK
      ?auto_67223 - BLOCK
    )
    :vars
    (
      ?auto_67225 - BLOCK
      ?auto_67224 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67219 ) ( ON ?auto_67220 ?auto_67219 ) ( not ( = ?auto_67219 ?auto_67220 ) ) ( not ( = ?auto_67219 ?auto_67221 ) ) ( not ( = ?auto_67219 ?auto_67222 ) ) ( not ( = ?auto_67219 ?auto_67223 ) ) ( not ( = ?auto_67219 ?auto_67225 ) ) ( not ( = ?auto_67220 ?auto_67221 ) ) ( not ( = ?auto_67220 ?auto_67222 ) ) ( not ( = ?auto_67220 ?auto_67223 ) ) ( not ( = ?auto_67220 ?auto_67225 ) ) ( not ( = ?auto_67221 ?auto_67222 ) ) ( not ( = ?auto_67221 ?auto_67223 ) ) ( not ( = ?auto_67221 ?auto_67225 ) ) ( not ( = ?auto_67222 ?auto_67223 ) ) ( not ( = ?auto_67222 ?auto_67225 ) ) ( not ( = ?auto_67223 ?auto_67225 ) ) ( ON ?auto_67225 ?auto_67224 ) ( not ( = ?auto_67219 ?auto_67224 ) ) ( not ( = ?auto_67220 ?auto_67224 ) ) ( not ( = ?auto_67221 ?auto_67224 ) ) ( not ( = ?auto_67222 ?auto_67224 ) ) ( not ( = ?auto_67223 ?auto_67224 ) ) ( not ( = ?auto_67225 ?auto_67224 ) ) ( ON ?auto_67223 ?auto_67225 ) ( ON-TABLE ?auto_67224 ) ( ON ?auto_67222 ?auto_67223 ) ( CLEAR ?auto_67220 ) ( ON ?auto_67221 ?auto_67222 ) ( CLEAR ?auto_67221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_67224 ?auto_67225 ?auto_67223 ?auto_67222 )
      ( MAKE-5PILE ?auto_67219 ?auto_67220 ?auto_67221 ?auto_67222 ?auto_67223 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_67226 - BLOCK
      ?auto_67227 - BLOCK
      ?auto_67228 - BLOCK
      ?auto_67229 - BLOCK
      ?auto_67230 - BLOCK
    )
    :vars
    (
      ?auto_67232 - BLOCK
      ?auto_67231 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67226 ) ( not ( = ?auto_67226 ?auto_67227 ) ) ( not ( = ?auto_67226 ?auto_67228 ) ) ( not ( = ?auto_67226 ?auto_67229 ) ) ( not ( = ?auto_67226 ?auto_67230 ) ) ( not ( = ?auto_67226 ?auto_67232 ) ) ( not ( = ?auto_67227 ?auto_67228 ) ) ( not ( = ?auto_67227 ?auto_67229 ) ) ( not ( = ?auto_67227 ?auto_67230 ) ) ( not ( = ?auto_67227 ?auto_67232 ) ) ( not ( = ?auto_67228 ?auto_67229 ) ) ( not ( = ?auto_67228 ?auto_67230 ) ) ( not ( = ?auto_67228 ?auto_67232 ) ) ( not ( = ?auto_67229 ?auto_67230 ) ) ( not ( = ?auto_67229 ?auto_67232 ) ) ( not ( = ?auto_67230 ?auto_67232 ) ) ( ON ?auto_67232 ?auto_67231 ) ( not ( = ?auto_67226 ?auto_67231 ) ) ( not ( = ?auto_67227 ?auto_67231 ) ) ( not ( = ?auto_67228 ?auto_67231 ) ) ( not ( = ?auto_67229 ?auto_67231 ) ) ( not ( = ?auto_67230 ?auto_67231 ) ) ( not ( = ?auto_67232 ?auto_67231 ) ) ( ON ?auto_67230 ?auto_67232 ) ( ON-TABLE ?auto_67231 ) ( ON ?auto_67229 ?auto_67230 ) ( ON ?auto_67228 ?auto_67229 ) ( CLEAR ?auto_67228 ) ( HOLDING ?auto_67227 ) ( CLEAR ?auto_67226 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67226 ?auto_67227 )
      ( MAKE-5PILE ?auto_67226 ?auto_67227 ?auto_67228 ?auto_67229 ?auto_67230 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_67233 - BLOCK
      ?auto_67234 - BLOCK
      ?auto_67235 - BLOCK
      ?auto_67236 - BLOCK
      ?auto_67237 - BLOCK
    )
    :vars
    (
      ?auto_67238 - BLOCK
      ?auto_67239 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67233 ) ( not ( = ?auto_67233 ?auto_67234 ) ) ( not ( = ?auto_67233 ?auto_67235 ) ) ( not ( = ?auto_67233 ?auto_67236 ) ) ( not ( = ?auto_67233 ?auto_67237 ) ) ( not ( = ?auto_67233 ?auto_67238 ) ) ( not ( = ?auto_67234 ?auto_67235 ) ) ( not ( = ?auto_67234 ?auto_67236 ) ) ( not ( = ?auto_67234 ?auto_67237 ) ) ( not ( = ?auto_67234 ?auto_67238 ) ) ( not ( = ?auto_67235 ?auto_67236 ) ) ( not ( = ?auto_67235 ?auto_67237 ) ) ( not ( = ?auto_67235 ?auto_67238 ) ) ( not ( = ?auto_67236 ?auto_67237 ) ) ( not ( = ?auto_67236 ?auto_67238 ) ) ( not ( = ?auto_67237 ?auto_67238 ) ) ( ON ?auto_67238 ?auto_67239 ) ( not ( = ?auto_67233 ?auto_67239 ) ) ( not ( = ?auto_67234 ?auto_67239 ) ) ( not ( = ?auto_67235 ?auto_67239 ) ) ( not ( = ?auto_67236 ?auto_67239 ) ) ( not ( = ?auto_67237 ?auto_67239 ) ) ( not ( = ?auto_67238 ?auto_67239 ) ) ( ON ?auto_67237 ?auto_67238 ) ( ON-TABLE ?auto_67239 ) ( ON ?auto_67236 ?auto_67237 ) ( ON ?auto_67235 ?auto_67236 ) ( CLEAR ?auto_67233 ) ( ON ?auto_67234 ?auto_67235 ) ( CLEAR ?auto_67234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67239 ?auto_67238 ?auto_67237 ?auto_67236 ?auto_67235 )
      ( MAKE-5PILE ?auto_67233 ?auto_67234 ?auto_67235 ?auto_67236 ?auto_67237 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_67240 - BLOCK
      ?auto_67241 - BLOCK
      ?auto_67242 - BLOCK
      ?auto_67243 - BLOCK
      ?auto_67244 - BLOCK
    )
    :vars
    (
      ?auto_67246 - BLOCK
      ?auto_67245 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67240 ?auto_67241 ) ) ( not ( = ?auto_67240 ?auto_67242 ) ) ( not ( = ?auto_67240 ?auto_67243 ) ) ( not ( = ?auto_67240 ?auto_67244 ) ) ( not ( = ?auto_67240 ?auto_67246 ) ) ( not ( = ?auto_67241 ?auto_67242 ) ) ( not ( = ?auto_67241 ?auto_67243 ) ) ( not ( = ?auto_67241 ?auto_67244 ) ) ( not ( = ?auto_67241 ?auto_67246 ) ) ( not ( = ?auto_67242 ?auto_67243 ) ) ( not ( = ?auto_67242 ?auto_67244 ) ) ( not ( = ?auto_67242 ?auto_67246 ) ) ( not ( = ?auto_67243 ?auto_67244 ) ) ( not ( = ?auto_67243 ?auto_67246 ) ) ( not ( = ?auto_67244 ?auto_67246 ) ) ( ON ?auto_67246 ?auto_67245 ) ( not ( = ?auto_67240 ?auto_67245 ) ) ( not ( = ?auto_67241 ?auto_67245 ) ) ( not ( = ?auto_67242 ?auto_67245 ) ) ( not ( = ?auto_67243 ?auto_67245 ) ) ( not ( = ?auto_67244 ?auto_67245 ) ) ( not ( = ?auto_67246 ?auto_67245 ) ) ( ON ?auto_67244 ?auto_67246 ) ( ON-TABLE ?auto_67245 ) ( ON ?auto_67243 ?auto_67244 ) ( ON ?auto_67242 ?auto_67243 ) ( ON ?auto_67241 ?auto_67242 ) ( CLEAR ?auto_67241 ) ( HOLDING ?auto_67240 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_67240 )
      ( MAKE-5PILE ?auto_67240 ?auto_67241 ?auto_67242 ?auto_67243 ?auto_67244 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_67247 - BLOCK
      ?auto_67248 - BLOCK
      ?auto_67249 - BLOCK
      ?auto_67250 - BLOCK
      ?auto_67251 - BLOCK
    )
    :vars
    (
      ?auto_67252 - BLOCK
      ?auto_67253 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67247 ?auto_67248 ) ) ( not ( = ?auto_67247 ?auto_67249 ) ) ( not ( = ?auto_67247 ?auto_67250 ) ) ( not ( = ?auto_67247 ?auto_67251 ) ) ( not ( = ?auto_67247 ?auto_67252 ) ) ( not ( = ?auto_67248 ?auto_67249 ) ) ( not ( = ?auto_67248 ?auto_67250 ) ) ( not ( = ?auto_67248 ?auto_67251 ) ) ( not ( = ?auto_67248 ?auto_67252 ) ) ( not ( = ?auto_67249 ?auto_67250 ) ) ( not ( = ?auto_67249 ?auto_67251 ) ) ( not ( = ?auto_67249 ?auto_67252 ) ) ( not ( = ?auto_67250 ?auto_67251 ) ) ( not ( = ?auto_67250 ?auto_67252 ) ) ( not ( = ?auto_67251 ?auto_67252 ) ) ( ON ?auto_67252 ?auto_67253 ) ( not ( = ?auto_67247 ?auto_67253 ) ) ( not ( = ?auto_67248 ?auto_67253 ) ) ( not ( = ?auto_67249 ?auto_67253 ) ) ( not ( = ?auto_67250 ?auto_67253 ) ) ( not ( = ?auto_67251 ?auto_67253 ) ) ( not ( = ?auto_67252 ?auto_67253 ) ) ( ON ?auto_67251 ?auto_67252 ) ( ON-TABLE ?auto_67253 ) ( ON ?auto_67250 ?auto_67251 ) ( ON ?auto_67249 ?auto_67250 ) ( ON ?auto_67248 ?auto_67249 ) ( ON ?auto_67247 ?auto_67248 ) ( CLEAR ?auto_67247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_67253 ?auto_67252 ?auto_67251 ?auto_67250 ?auto_67249 ?auto_67248 )
      ( MAKE-5PILE ?auto_67247 ?auto_67248 ?auto_67249 ?auto_67250 ?auto_67251 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67255 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_67255 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_67255 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67256 - BLOCK
    )
    :vars
    (
      ?auto_67257 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67256 ?auto_67257 ) ( CLEAR ?auto_67256 ) ( HAND-EMPTY ) ( not ( = ?auto_67256 ?auto_67257 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_67256 ?auto_67257 )
      ( MAKE-1PILE ?auto_67256 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67258 - BLOCK
    )
    :vars
    (
      ?auto_67259 - BLOCK
      ?auto_67261 - BLOCK
      ?auto_67262 - BLOCK
      ?auto_67263 - BLOCK
      ?auto_67260 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67258 ?auto_67259 ) ) ( HOLDING ?auto_67258 ) ( CLEAR ?auto_67259 ) ( ON-TABLE ?auto_67261 ) ( ON ?auto_67262 ?auto_67261 ) ( ON ?auto_67263 ?auto_67262 ) ( ON ?auto_67260 ?auto_67263 ) ( ON ?auto_67259 ?auto_67260 ) ( not ( = ?auto_67261 ?auto_67262 ) ) ( not ( = ?auto_67261 ?auto_67263 ) ) ( not ( = ?auto_67261 ?auto_67260 ) ) ( not ( = ?auto_67261 ?auto_67259 ) ) ( not ( = ?auto_67261 ?auto_67258 ) ) ( not ( = ?auto_67262 ?auto_67263 ) ) ( not ( = ?auto_67262 ?auto_67260 ) ) ( not ( = ?auto_67262 ?auto_67259 ) ) ( not ( = ?auto_67262 ?auto_67258 ) ) ( not ( = ?auto_67263 ?auto_67260 ) ) ( not ( = ?auto_67263 ?auto_67259 ) ) ( not ( = ?auto_67263 ?auto_67258 ) ) ( not ( = ?auto_67260 ?auto_67259 ) ) ( not ( = ?auto_67260 ?auto_67258 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_67261 ?auto_67262 ?auto_67263 ?auto_67260 ?auto_67259 ?auto_67258 )
      ( MAKE-1PILE ?auto_67258 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67264 - BLOCK
    )
    :vars
    (
      ?auto_67267 - BLOCK
      ?auto_67265 - BLOCK
      ?auto_67268 - BLOCK
      ?auto_67266 - BLOCK
      ?auto_67269 - BLOCK
      ?auto_67270 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67264 ?auto_67267 ) ) ( CLEAR ?auto_67267 ) ( ON-TABLE ?auto_67265 ) ( ON ?auto_67268 ?auto_67265 ) ( ON ?auto_67266 ?auto_67268 ) ( ON ?auto_67269 ?auto_67266 ) ( ON ?auto_67267 ?auto_67269 ) ( not ( = ?auto_67265 ?auto_67268 ) ) ( not ( = ?auto_67265 ?auto_67266 ) ) ( not ( = ?auto_67265 ?auto_67269 ) ) ( not ( = ?auto_67265 ?auto_67267 ) ) ( not ( = ?auto_67265 ?auto_67264 ) ) ( not ( = ?auto_67268 ?auto_67266 ) ) ( not ( = ?auto_67268 ?auto_67269 ) ) ( not ( = ?auto_67268 ?auto_67267 ) ) ( not ( = ?auto_67268 ?auto_67264 ) ) ( not ( = ?auto_67266 ?auto_67269 ) ) ( not ( = ?auto_67266 ?auto_67267 ) ) ( not ( = ?auto_67266 ?auto_67264 ) ) ( not ( = ?auto_67269 ?auto_67267 ) ) ( not ( = ?auto_67269 ?auto_67264 ) ) ( ON ?auto_67264 ?auto_67270 ) ( CLEAR ?auto_67264 ) ( HAND-EMPTY ) ( not ( = ?auto_67264 ?auto_67270 ) ) ( not ( = ?auto_67267 ?auto_67270 ) ) ( not ( = ?auto_67265 ?auto_67270 ) ) ( not ( = ?auto_67268 ?auto_67270 ) ) ( not ( = ?auto_67266 ?auto_67270 ) ) ( not ( = ?auto_67269 ?auto_67270 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_67264 ?auto_67270 )
      ( MAKE-1PILE ?auto_67264 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67271 - BLOCK
    )
    :vars
    (
      ?auto_67274 - BLOCK
      ?auto_67272 - BLOCK
      ?auto_67275 - BLOCK
      ?auto_67273 - BLOCK
      ?auto_67276 - BLOCK
      ?auto_67277 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67271 ?auto_67274 ) ) ( ON-TABLE ?auto_67272 ) ( ON ?auto_67275 ?auto_67272 ) ( ON ?auto_67273 ?auto_67275 ) ( ON ?auto_67276 ?auto_67273 ) ( not ( = ?auto_67272 ?auto_67275 ) ) ( not ( = ?auto_67272 ?auto_67273 ) ) ( not ( = ?auto_67272 ?auto_67276 ) ) ( not ( = ?auto_67272 ?auto_67274 ) ) ( not ( = ?auto_67272 ?auto_67271 ) ) ( not ( = ?auto_67275 ?auto_67273 ) ) ( not ( = ?auto_67275 ?auto_67276 ) ) ( not ( = ?auto_67275 ?auto_67274 ) ) ( not ( = ?auto_67275 ?auto_67271 ) ) ( not ( = ?auto_67273 ?auto_67276 ) ) ( not ( = ?auto_67273 ?auto_67274 ) ) ( not ( = ?auto_67273 ?auto_67271 ) ) ( not ( = ?auto_67276 ?auto_67274 ) ) ( not ( = ?auto_67276 ?auto_67271 ) ) ( ON ?auto_67271 ?auto_67277 ) ( CLEAR ?auto_67271 ) ( not ( = ?auto_67271 ?auto_67277 ) ) ( not ( = ?auto_67274 ?auto_67277 ) ) ( not ( = ?auto_67272 ?auto_67277 ) ) ( not ( = ?auto_67275 ?auto_67277 ) ) ( not ( = ?auto_67273 ?auto_67277 ) ) ( not ( = ?auto_67276 ?auto_67277 ) ) ( HOLDING ?auto_67274 ) ( CLEAR ?auto_67276 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67272 ?auto_67275 ?auto_67273 ?auto_67276 ?auto_67274 )
      ( MAKE-1PILE ?auto_67271 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67278 - BLOCK
    )
    :vars
    (
      ?auto_67283 - BLOCK
      ?auto_67281 - BLOCK
      ?auto_67279 - BLOCK
      ?auto_67282 - BLOCK
      ?auto_67280 - BLOCK
      ?auto_67284 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67278 ?auto_67283 ) ) ( ON-TABLE ?auto_67281 ) ( ON ?auto_67279 ?auto_67281 ) ( ON ?auto_67282 ?auto_67279 ) ( ON ?auto_67280 ?auto_67282 ) ( not ( = ?auto_67281 ?auto_67279 ) ) ( not ( = ?auto_67281 ?auto_67282 ) ) ( not ( = ?auto_67281 ?auto_67280 ) ) ( not ( = ?auto_67281 ?auto_67283 ) ) ( not ( = ?auto_67281 ?auto_67278 ) ) ( not ( = ?auto_67279 ?auto_67282 ) ) ( not ( = ?auto_67279 ?auto_67280 ) ) ( not ( = ?auto_67279 ?auto_67283 ) ) ( not ( = ?auto_67279 ?auto_67278 ) ) ( not ( = ?auto_67282 ?auto_67280 ) ) ( not ( = ?auto_67282 ?auto_67283 ) ) ( not ( = ?auto_67282 ?auto_67278 ) ) ( not ( = ?auto_67280 ?auto_67283 ) ) ( not ( = ?auto_67280 ?auto_67278 ) ) ( ON ?auto_67278 ?auto_67284 ) ( not ( = ?auto_67278 ?auto_67284 ) ) ( not ( = ?auto_67283 ?auto_67284 ) ) ( not ( = ?auto_67281 ?auto_67284 ) ) ( not ( = ?auto_67279 ?auto_67284 ) ) ( not ( = ?auto_67282 ?auto_67284 ) ) ( not ( = ?auto_67280 ?auto_67284 ) ) ( CLEAR ?auto_67280 ) ( ON ?auto_67283 ?auto_67278 ) ( CLEAR ?auto_67283 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_67284 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67284 ?auto_67278 )
      ( MAKE-1PILE ?auto_67278 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67285 - BLOCK
    )
    :vars
    (
      ?auto_67289 - BLOCK
      ?auto_67291 - BLOCK
      ?auto_67288 - BLOCK
      ?auto_67290 - BLOCK
      ?auto_67286 - BLOCK
      ?auto_67287 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67285 ?auto_67289 ) ) ( ON-TABLE ?auto_67291 ) ( ON ?auto_67288 ?auto_67291 ) ( ON ?auto_67290 ?auto_67288 ) ( not ( = ?auto_67291 ?auto_67288 ) ) ( not ( = ?auto_67291 ?auto_67290 ) ) ( not ( = ?auto_67291 ?auto_67286 ) ) ( not ( = ?auto_67291 ?auto_67289 ) ) ( not ( = ?auto_67291 ?auto_67285 ) ) ( not ( = ?auto_67288 ?auto_67290 ) ) ( not ( = ?auto_67288 ?auto_67286 ) ) ( not ( = ?auto_67288 ?auto_67289 ) ) ( not ( = ?auto_67288 ?auto_67285 ) ) ( not ( = ?auto_67290 ?auto_67286 ) ) ( not ( = ?auto_67290 ?auto_67289 ) ) ( not ( = ?auto_67290 ?auto_67285 ) ) ( not ( = ?auto_67286 ?auto_67289 ) ) ( not ( = ?auto_67286 ?auto_67285 ) ) ( ON ?auto_67285 ?auto_67287 ) ( not ( = ?auto_67285 ?auto_67287 ) ) ( not ( = ?auto_67289 ?auto_67287 ) ) ( not ( = ?auto_67291 ?auto_67287 ) ) ( not ( = ?auto_67288 ?auto_67287 ) ) ( not ( = ?auto_67290 ?auto_67287 ) ) ( not ( = ?auto_67286 ?auto_67287 ) ) ( ON ?auto_67289 ?auto_67285 ) ( CLEAR ?auto_67289 ) ( ON-TABLE ?auto_67287 ) ( HOLDING ?auto_67286 ) ( CLEAR ?auto_67290 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_67291 ?auto_67288 ?auto_67290 ?auto_67286 )
      ( MAKE-1PILE ?auto_67285 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67292 - BLOCK
    )
    :vars
    (
      ?auto_67295 - BLOCK
      ?auto_67296 - BLOCK
      ?auto_67293 - BLOCK
      ?auto_67294 - BLOCK
      ?auto_67298 - BLOCK
      ?auto_67297 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67292 ?auto_67295 ) ) ( ON-TABLE ?auto_67296 ) ( ON ?auto_67293 ?auto_67296 ) ( ON ?auto_67294 ?auto_67293 ) ( not ( = ?auto_67296 ?auto_67293 ) ) ( not ( = ?auto_67296 ?auto_67294 ) ) ( not ( = ?auto_67296 ?auto_67298 ) ) ( not ( = ?auto_67296 ?auto_67295 ) ) ( not ( = ?auto_67296 ?auto_67292 ) ) ( not ( = ?auto_67293 ?auto_67294 ) ) ( not ( = ?auto_67293 ?auto_67298 ) ) ( not ( = ?auto_67293 ?auto_67295 ) ) ( not ( = ?auto_67293 ?auto_67292 ) ) ( not ( = ?auto_67294 ?auto_67298 ) ) ( not ( = ?auto_67294 ?auto_67295 ) ) ( not ( = ?auto_67294 ?auto_67292 ) ) ( not ( = ?auto_67298 ?auto_67295 ) ) ( not ( = ?auto_67298 ?auto_67292 ) ) ( ON ?auto_67292 ?auto_67297 ) ( not ( = ?auto_67292 ?auto_67297 ) ) ( not ( = ?auto_67295 ?auto_67297 ) ) ( not ( = ?auto_67296 ?auto_67297 ) ) ( not ( = ?auto_67293 ?auto_67297 ) ) ( not ( = ?auto_67294 ?auto_67297 ) ) ( not ( = ?auto_67298 ?auto_67297 ) ) ( ON ?auto_67295 ?auto_67292 ) ( ON-TABLE ?auto_67297 ) ( CLEAR ?auto_67294 ) ( ON ?auto_67298 ?auto_67295 ) ( CLEAR ?auto_67298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_67297 ?auto_67292 ?auto_67295 )
      ( MAKE-1PILE ?auto_67292 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67299 - BLOCK
    )
    :vars
    (
      ?auto_67302 - BLOCK
      ?auto_67303 - BLOCK
      ?auto_67305 - BLOCK
      ?auto_67304 - BLOCK
      ?auto_67301 - BLOCK
      ?auto_67300 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67299 ?auto_67302 ) ) ( ON-TABLE ?auto_67303 ) ( ON ?auto_67305 ?auto_67303 ) ( not ( = ?auto_67303 ?auto_67305 ) ) ( not ( = ?auto_67303 ?auto_67304 ) ) ( not ( = ?auto_67303 ?auto_67301 ) ) ( not ( = ?auto_67303 ?auto_67302 ) ) ( not ( = ?auto_67303 ?auto_67299 ) ) ( not ( = ?auto_67305 ?auto_67304 ) ) ( not ( = ?auto_67305 ?auto_67301 ) ) ( not ( = ?auto_67305 ?auto_67302 ) ) ( not ( = ?auto_67305 ?auto_67299 ) ) ( not ( = ?auto_67304 ?auto_67301 ) ) ( not ( = ?auto_67304 ?auto_67302 ) ) ( not ( = ?auto_67304 ?auto_67299 ) ) ( not ( = ?auto_67301 ?auto_67302 ) ) ( not ( = ?auto_67301 ?auto_67299 ) ) ( ON ?auto_67299 ?auto_67300 ) ( not ( = ?auto_67299 ?auto_67300 ) ) ( not ( = ?auto_67302 ?auto_67300 ) ) ( not ( = ?auto_67303 ?auto_67300 ) ) ( not ( = ?auto_67305 ?auto_67300 ) ) ( not ( = ?auto_67304 ?auto_67300 ) ) ( not ( = ?auto_67301 ?auto_67300 ) ) ( ON ?auto_67302 ?auto_67299 ) ( ON-TABLE ?auto_67300 ) ( ON ?auto_67301 ?auto_67302 ) ( CLEAR ?auto_67301 ) ( HOLDING ?auto_67304 ) ( CLEAR ?auto_67305 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_67303 ?auto_67305 ?auto_67304 )
      ( MAKE-1PILE ?auto_67299 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67306 - BLOCK
    )
    :vars
    (
      ?auto_67310 - BLOCK
      ?auto_67307 - BLOCK
      ?auto_67309 - BLOCK
      ?auto_67308 - BLOCK
      ?auto_67312 - BLOCK
      ?auto_67311 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67306 ?auto_67310 ) ) ( ON-TABLE ?auto_67307 ) ( ON ?auto_67309 ?auto_67307 ) ( not ( = ?auto_67307 ?auto_67309 ) ) ( not ( = ?auto_67307 ?auto_67308 ) ) ( not ( = ?auto_67307 ?auto_67312 ) ) ( not ( = ?auto_67307 ?auto_67310 ) ) ( not ( = ?auto_67307 ?auto_67306 ) ) ( not ( = ?auto_67309 ?auto_67308 ) ) ( not ( = ?auto_67309 ?auto_67312 ) ) ( not ( = ?auto_67309 ?auto_67310 ) ) ( not ( = ?auto_67309 ?auto_67306 ) ) ( not ( = ?auto_67308 ?auto_67312 ) ) ( not ( = ?auto_67308 ?auto_67310 ) ) ( not ( = ?auto_67308 ?auto_67306 ) ) ( not ( = ?auto_67312 ?auto_67310 ) ) ( not ( = ?auto_67312 ?auto_67306 ) ) ( ON ?auto_67306 ?auto_67311 ) ( not ( = ?auto_67306 ?auto_67311 ) ) ( not ( = ?auto_67310 ?auto_67311 ) ) ( not ( = ?auto_67307 ?auto_67311 ) ) ( not ( = ?auto_67309 ?auto_67311 ) ) ( not ( = ?auto_67308 ?auto_67311 ) ) ( not ( = ?auto_67312 ?auto_67311 ) ) ( ON ?auto_67310 ?auto_67306 ) ( ON-TABLE ?auto_67311 ) ( ON ?auto_67312 ?auto_67310 ) ( CLEAR ?auto_67309 ) ( ON ?auto_67308 ?auto_67312 ) ( CLEAR ?auto_67308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_67311 ?auto_67306 ?auto_67310 ?auto_67312 )
      ( MAKE-1PILE ?auto_67306 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67313 - BLOCK
    )
    :vars
    (
      ?auto_67319 - BLOCK
      ?auto_67316 - BLOCK
      ?auto_67314 - BLOCK
      ?auto_67318 - BLOCK
      ?auto_67317 - BLOCK
      ?auto_67315 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67313 ?auto_67319 ) ) ( ON-TABLE ?auto_67316 ) ( not ( = ?auto_67316 ?auto_67314 ) ) ( not ( = ?auto_67316 ?auto_67318 ) ) ( not ( = ?auto_67316 ?auto_67317 ) ) ( not ( = ?auto_67316 ?auto_67319 ) ) ( not ( = ?auto_67316 ?auto_67313 ) ) ( not ( = ?auto_67314 ?auto_67318 ) ) ( not ( = ?auto_67314 ?auto_67317 ) ) ( not ( = ?auto_67314 ?auto_67319 ) ) ( not ( = ?auto_67314 ?auto_67313 ) ) ( not ( = ?auto_67318 ?auto_67317 ) ) ( not ( = ?auto_67318 ?auto_67319 ) ) ( not ( = ?auto_67318 ?auto_67313 ) ) ( not ( = ?auto_67317 ?auto_67319 ) ) ( not ( = ?auto_67317 ?auto_67313 ) ) ( ON ?auto_67313 ?auto_67315 ) ( not ( = ?auto_67313 ?auto_67315 ) ) ( not ( = ?auto_67319 ?auto_67315 ) ) ( not ( = ?auto_67316 ?auto_67315 ) ) ( not ( = ?auto_67314 ?auto_67315 ) ) ( not ( = ?auto_67318 ?auto_67315 ) ) ( not ( = ?auto_67317 ?auto_67315 ) ) ( ON ?auto_67319 ?auto_67313 ) ( ON-TABLE ?auto_67315 ) ( ON ?auto_67317 ?auto_67319 ) ( ON ?auto_67318 ?auto_67317 ) ( CLEAR ?auto_67318 ) ( HOLDING ?auto_67314 ) ( CLEAR ?auto_67316 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67316 ?auto_67314 )
      ( MAKE-1PILE ?auto_67313 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67320 - BLOCK
    )
    :vars
    (
      ?auto_67326 - BLOCK
      ?auto_67325 - BLOCK
      ?auto_67322 - BLOCK
      ?auto_67321 - BLOCK
      ?auto_67323 - BLOCK
      ?auto_67324 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67320 ?auto_67326 ) ) ( ON-TABLE ?auto_67325 ) ( not ( = ?auto_67325 ?auto_67322 ) ) ( not ( = ?auto_67325 ?auto_67321 ) ) ( not ( = ?auto_67325 ?auto_67323 ) ) ( not ( = ?auto_67325 ?auto_67326 ) ) ( not ( = ?auto_67325 ?auto_67320 ) ) ( not ( = ?auto_67322 ?auto_67321 ) ) ( not ( = ?auto_67322 ?auto_67323 ) ) ( not ( = ?auto_67322 ?auto_67326 ) ) ( not ( = ?auto_67322 ?auto_67320 ) ) ( not ( = ?auto_67321 ?auto_67323 ) ) ( not ( = ?auto_67321 ?auto_67326 ) ) ( not ( = ?auto_67321 ?auto_67320 ) ) ( not ( = ?auto_67323 ?auto_67326 ) ) ( not ( = ?auto_67323 ?auto_67320 ) ) ( ON ?auto_67320 ?auto_67324 ) ( not ( = ?auto_67320 ?auto_67324 ) ) ( not ( = ?auto_67326 ?auto_67324 ) ) ( not ( = ?auto_67325 ?auto_67324 ) ) ( not ( = ?auto_67322 ?auto_67324 ) ) ( not ( = ?auto_67321 ?auto_67324 ) ) ( not ( = ?auto_67323 ?auto_67324 ) ) ( ON ?auto_67326 ?auto_67320 ) ( ON-TABLE ?auto_67324 ) ( ON ?auto_67323 ?auto_67326 ) ( ON ?auto_67321 ?auto_67323 ) ( CLEAR ?auto_67325 ) ( ON ?auto_67322 ?auto_67321 ) ( CLEAR ?auto_67322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67324 ?auto_67320 ?auto_67326 ?auto_67323 ?auto_67321 )
      ( MAKE-1PILE ?auto_67320 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67327 - BLOCK
    )
    :vars
    (
      ?auto_67330 - BLOCK
      ?auto_67329 - BLOCK
      ?auto_67328 - BLOCK
      ?auto_67333 - BLOCK
      ?auto_67331 - BLOCK
      ?auto_67332 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67327 ?auto_67330 ) ) ( not ( = ?auto_67329 ?auto_67328 ) ) ( not ( = ?auto_67329 ?auto_67333 ) ) ( not ( = ?auto_67329 ?auto_67331 ) ) ( not ( = ?auto_67329 ?auto_67330 ) ) ( not ( = ?auto_67329 ?auto_67327 ) ) ( not ( = ?auto_67328 ?auto_67333 ) ) ( not ( = ?auto_67328 ?auto_67331 ) ) ( not ( = ?auto_67328 ?auto_67330 ) ) ( not ( = ?auto_67328 ?auto_67327 ) ) ( not ( = ?auto_67333 ?auto_67331 ) ) ( not ( = ?auto_67333 ?auto_67330 ) ) ( not ( = ?auto_67333 ?auto_67327 ) ) ( not ( = ?auto_67331 ?auto_67330 ) ) ( not ( = ?auto_67331 ?auto_67327 ) ) ( ON ?auto_67327 ?auto_67332 ) ( not ( = ?auto_67327 ?auto_67332 ) ) ( not ( = ?auto_67330 ?auto_67332 ) ) ( not ( = ?auto_67329 ?auto_67332 ) ) ( not ( = ?auto_67328 ?auto_67332 ) ) ( not ( = ?auto_67333 ?auto_67332 ) ) ( not ( = ?auto_67331 ?auto_67332 ) ) ( ON ?auto_67330 ?auto_67327 ) ( ON-TABLE ?auto_67332 ) ( ON ?auto_67331 ?auto_67330 ) ( ON ?auto_67333 ?auto_67331 ) ( ON ?auto_67328 ?auto_67333 ) ( CLEAR ?auto_67328 ) ( HOLDING ?auto_67329 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_67329 )
      ( MAKE-1PILE ?auto_67327 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_67334 - BLOCK
    )
    :vars
    (
      ?auto_67335 - BLOCK
      ?auto_67338 - BLOCK
      ?auto_67336 - BLOCK
      ?auto_67337 - BLOCK
      ?auto_67340 - BLOCK
      ?auto_67339 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67334 ?auto_67335 ) ) ( not ( = ?auto_67338 ?auto_67336 ) ) ( not ( = ?auto_67338 ?auto_67337 ) ) ( not ( = ?auto_67338 ?auto_67340 ) ) ( not ( = ?auto_67338 ?auto_67335 ) ) ( not ( = ?auto_67338 ?auto_67334 ) ) ( not ( = ?auto_67336 ?auto_67337 ) ) ( not ( = ?auto_67336 ?auto_67340 ) ) ( not ( = ?auto_67336 ?auto_67335 ) ) ( not ( = ?auto_67336 ?auto_67334 ) ) ( not ( = ?auto_67337 ?auto_67340 ) ) ( not ( = ?auto_67337 ?auto_67335 ) ) ( not ( = ?auto_67337 ?auto_67334 ) ) ( not ( = ?auto_67340 ?auto_67335 ) ) ( not ( = ?auto_67340 ?auto_67334 ) ) ( ON ?auto_67334 ?auto_67339 ) ( not ( = ?auto_67334 ?auto_67339 ) ) ( not ( = ?auto_67335 ?auto_67339 ) ) ( not ( = ?auto_67338 ?auto_67339 ) ) ( not ( = ?auto_67336 ?auto_67339 ) ) ( not ( = ?auto_67337 ?auto_67339 ) ) ( not ( = ?auto_67340 ?auto_67339 ) ) ( ON ?auto_67335 ?auto_67334 ) ( ON-TABLE ?auto_67339 ) ( ON ?auto_67340 ?auto_67335 ) ( ON ?auto_67337 ?auto_67340 ) ( ON ?auto_67336 ?auto_67337 ) ( ON ?auto_67338 ?auto_67336 ) ( CLEAR ?auto_67338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_67339 ?auto_67334 ?auto_67335 ?auto_67340 ?auto_67337 ?auto_67336 )
      ( MAKE-1PILE ?auto_67334 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_67345 - BLOCK
      ?auto_67346 - BLOCK
      ?auto_67347 - BLOCK
      ?auto_67348 - BLOCK
    )
    :vars
    (
      ?auto_67349 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67349 ?auto_67348 ) ( CLEAR ?auto_67349 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_67345 ) ( ON ?auto_67346 ?auto_67345 ) ( ON ?auto_67347 ?auto_67346 ) ( ON ?auto_67348 ?auto_67347 ) ( not ( = ?auto_67345 ?auto_67346 ) ) ( not ( = ?auto_67345 ?auto_67347 ) ) ( not ( = ?auto_67345 ?auto_67348 ) ) ( not ( = ?auto_67345 ?auto_67349 ) ) ( not ( = ?auto_67346 ?auto_67347 ) ) ( not ( = ?auto_67346 ?auto_67348 ) ) ( not ( = ?auto_67346 ?auto_67349 ) ) ( not ( = ?auto_67347 ?auto_67348 ) ) ( not ( = ?auto_67347 ?auto_67349 ) ) ( not ( = ?auto_67348 ?auto_67349 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_67349 ?auto_67348 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_67350 - BLOCK
      ?auto_67351 - BLOCK
      ?auto_67352 - BLOCK
      ?auto_67353 - BLOCK
    )
    :vars
    (
      ?auto_67354 - BLOCK
      ?auto_67355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67354 ?auto_67353 ) ( CLEAR ?auto_67354 ) ( ON-TABLE ?auto_67350 ) ( ON ?auto_67351 ?auto_67350 ) ( ON ?auto_67352 ?auto_67351 ) ( ON ?auto_67353 ?auto_67352 ) ( not ( = ?auto_67350 ?auto_67351 ) ) ( not ( = ?auto_67350 ?auto_67352 ) ) ( not ( = ?auto_67350 ?auto_67353 ) ) ( not ( = ?auto_67350 ?auto_67354 ) ) ( not ( = ?auto_67351 ?auto_67352 ) ) ( not ( = ?auto_67351 ?auto_67353 ) ) ( not ( = ?auto_67351 ?auto_67354 ) ) ( not ( = ?auto_67352 ?auto_67353 ) ) ( not ( = ?auto_67352 ?auto_67354 ) ) ( not ( = ?auto_67353 ?auto_67354 ) ) ( HOLDING ?auto_67355 ) ( not ( = ?auto_67350 ?auto_67355 ) ) ( not ( = ?auto_67351 ?auto_67355 ) ) ( not ( = ?auto_67352 ?auto_67355 ) ) ( not ( = ?auto_67353 ?auto_67355 ) ) ( not ( = ?auto_67354 ?auto_67355 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_67355 )
      ( MAKE-4PILE ?auto_67350 ?auto_67351 ?auto_67352 ?auto_67353 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_67356 - BLOCK
      ?auto_67357 - BLOCK
      ?auto_67358 - BLOCK
      ?auto_67359 - BLOCK
    )
    :vars
    (
      ?auto_67361 - BLOCK
      ?auto_67360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67361 ?auto_67359 ) ( ON-TABLE ?auto_67356 ) ( ON ?auto_67357 ?auto_67356 ) ( ON ?auto_67358 ?auto_67357 ) ( ON ?auto_67359 ?auto_67358 ) ( not ( = ?auto_67356 ?auto_67357 ) ) ( not ( = ?auto_67356 ?auto_67358 ) ) ( not ( = ?auto_67356 ?auto_67359 ) ) ( not ( = ?auto_67356 ?auto_67361 ) ) ( not ( = ?auto_67357 ?auto_67358 ) ) ( not ( = ?auto_67357 ?auto_67359 ) ) ( not ( = ?auto_67357 ?auto_67361 ) ) ( not ( = ?auto_67358 ?auto_67359 ) ) ( not ( = ?auto_67358 ?auto_67361 ) ) ( not ( = ?auto_67359 ?auto_67361 ) ) ( not ( = ?auto_67356 ?auto_67360 ) ) ( not ( = ?auto_67357 ?auto_67360 ) ) ( not ( = ?auto_67358 ?auto_67360 ) ) ( not ( = ?auto_67359 ?auto_67360 ) ) ( not ( = ?auto_67361 ?auto_67360 ) ) ( ON ?auto_67360 ?auto_67361 ) ( CLEAR ?auto_67360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67356 ?auto_67357 ?auto_67358 ?auto_67359 ?auto_67361 )
      ( MAKE-4PILE ?auto_67356 ?auto_67357 ?auto_67358 ?auto_67359 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_67362 - BLOCK
      ?auto_67363 - BLOCK
      ?auto_67364 - BLOCK
      ?auto_67365 - BLOCK
    )
    :vars
    (
      ?auto_67367 - BLOCK
      ?auto_67366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67367 ?auto_67365 ) ( ON-TABLE ?auto_67362 ) ( ON ?auto_67363 ?auto_67362 ) ( ON ?auto_67364 ?auto_67363 ) ( ON ?auto_67365 ?auto_67364 ) ( not ( = ?auto_67362 ?auto_67363 ) ) ( not ( = ?auto_67362 ?auto_67364 ) ) ( not ( = ?auto_67362 ?auto_67365 ) ) ( not ( = ?auto_67362 ?auto_67367 ) ) ( not ( = ?auto_67363 ?auto_67364 ) ) ( not ( = ?auto_67363 ?auto_67365 ) ) ( not ( = ?auto_67363 ?auto_67367 ) ) ( not ( = ?auto_67364 ?auto_67365 ) ) ( not ( = ?auto_67364 ?auto_67367 ) ) ( not ( = ?auto_67365 ?auto_67367 ) ) ( not ( = ?auto_67362 ?auto_67366 ) ) ( not ( = ?auto_67363 ?auto_67366 ) ) ( not ( = ?auto_67364 ?auto_67366 ) ) ( not ( = ?auto_67365 ?auto_67366 ) ) ( not ( = ?auto_67367 ?auto_67366 ) ) ( HOLDING ?auto_67366 ) ( CLEAR ?auto_67367 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_67362 ?auto_67363 ?auto_67364 ?auto_67365 ?auto_67367 ?auto_67366 )
      ( MAKE-4PILE ?auto_67362 ?auto_67363 ?auto_67364 ?auto_67365 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_67368 - BLOCK
      ?auto_67369 - BLOCK
      ?auto_67370 - BLOCK
      ?auto_67371 - BLOCK
    )
    :vars
    (
      ?auto_67372 - BLOCK
      ?auto_67373 - BLOCK
      ?auto_67374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67372 ?auto_67371 ) ( ON-TABLE ?auto_67368 ) ( ON ?auto_67369 ?auto_67368 ) ( ON ?auto_67370 ?auto_67369 ) ( ON ?auto_67371 ?auto_67370 ) ( not ( = ?auto_67368 ?auto_67369 ) ) ( not ( = ?auto_67368 ?auto_67370 ) ) ( not ( = ?auto_67368 ?auto_67371 ) ) ( not ( = ?auto_67368 ?auto_67372 ) ) ( not ( = ?auto_67369 ?auto_67370 ) ) ( not ( = ?auto_67369 ?auto_67371 ) ) ( not ( = ?auto_67369 ?auto_67372 ) ) ( not ( = ?auto_67370 ?auto_67371 ) ) ( not ( = ?auto_67370 ?auto_67372 ) ) ( not ( = ?auto_67371 ?auto_67372 ) ) ( not ( = ?auto_67368 ?auto_67373 ) ) ( not ( = ?auto_67369 ?auto_67373 ) ) ( not ( = ?auto_67370 ?auto_67373 ) ) ( not ( = ?auto_67371 ?auto_67373 ) ) ( not ( = ?auto_67372 ?auto_67373 ) ) ( CLEAR ?auto_67372 ) ( ON ?auto_67373 ?auto_67374 ) ( CLEAR ?auto_67373 ) ( HAND-EMPTY ) ( not ( = ?auto_67368 ?auto_67374 ) ) ( not ( = ?auto_67369 ?auto_67374 ) ) ( not ( = ?auto_67370 ?auto_67374 ) ) ( not ( = ?auto_67371 ?auto_67374 ) ) ( not ( = ?auto_67372 ?auto_67374 ) ) ( not ( = ?auto_67373 ?auto_67374 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_67373 ?auto_67374 )
      ( MAKE-4PILE ?auto_67368 ?auto_67369 ?auto_67370 ?auto_67371 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_67389 - BLOCK
      ?auto_67390 - BLOCK
      ?auto_67391 - BLOCK
      ?auto_67392 - BLOCK
    )
    :vars
    (
      ?auto_67395 - BLOCK
      ?auto_67394 - BLOCK
      ?auto_67393 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67389 ) ( ON ?auto_67390 ?auto_67389 ) ( ON ?auto_67391 ?auto_67390 ) ( not ( = ?auto_67389 ?auto_67390 ) ) ( not ( = ?auto_67389 ?auto_67391 ) ) ( not ( = ?auto_67389 ?auto_67392 ) ) ( not ( = ?auto_67389 ?auto_67395 ) ) ( not ( = ?auto_67390 ?auto_67391 ) ) ( not ( = ?auto_67390 ?auto_67392 ) ) ( not ( = ?auto_67390 ?auto_67395 ) ) ( not ( = ?auto_67391 ?auto_67392 ) ) ( not ( = ?auto_67391 ?auto_67395 ) ) ( not ( = ?auto_67392 ?auto_67395 ) ) ( not ( = ?auto_67389 ?auto_67394 ) ) ( not ( = ?auto_67390 ?auto_67394 ) ) ( not ( = ?auto_67391 ?auto_67394 ) ) ( not ( = ?auto_67392 ?auto_67394 ) ) ( not ( = ?auto_67395 ?auto_67394 ) ) ( ON ?auto_67394 ?auto_67393 ) ( not ( = ?auto_67389 ?auto_67393 ) ) ( not ( = ?auto_67390 ?auto_67393 ) ) ( not ( = ?auto_67391 ?auto_67393 ) ) ( not ( = ?auto_67392 ?auto_67393 ) ) ( not ( = ?auto_67395 ?auto_67393 ) ) ( not ( = ?auto_67394 ?auto_67393 ) ) ( ON ?auto_67395 ?auto_67394 ) ( CLEAR ?auto_67395 ) ( HOLDING ?auto_67392 ) ( CLEAR ?auto_67391 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67389 ?auto_67390 ?auto_67391 ?auto_67392 ?auto_67395 )
      ( MAKE-4PILE ?auto_67389 ?auto_67390 ?auto_67391 ?auto_67392 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_67396 - BLOCK
      ?auto_67397 - BLOCK
      ?auto_67398 - BLOCK
      ?auto_67399 - BLOCK
    )
    :vars
    (
      ?auto_67402 - BLOCK
      ?auto_67400 - BLOCK
      ?auto_67401 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67396 ) ( ON ?auto_67397 ?auto_67396 ) ( ON ?auto_67398 ?auto_67397 ) ( not ( = ?auto_67396 ?auto_67397 ) ) ( not ( = ?auto_67396 ?auto_67398 ) ) ( not ( = ?auto_67396 ?auto_67399 ) ) ( not ( = ?auto_67396 ?auto_67402 ) ) ( not ( = ?auto_67397 ?auto_67398 ) ) ( not ( = ?auto_67397 ?auto_67399 ) ) ( not ( = ?auto_67397 ?auto_67402 ) ) ( not ( = ?auto_67398 ?auto_67399 ) ) ( not ( = ?auto_67398 ?auto_67402 ) ) ( not ( = ?auto_67399 ?auto_67402 ) ) ( not ( = ?auto_67396 ?auto_67400 ) ) ( not ( = ?auto_67397 ?auto_67400 ) ) ( not ( = ?auto_67398 ?auto_67400 ) ) ( not ( = ?auto_67399 ?auto_67400 ) ) ( not ( = ?auto_67402 ?auto_67400 ) ) ( ON ?auto_67400 ?auto_67401 ) ( not ( = ?auto_67396 ?auto_67401 ) ) ( not ( = ?auto_67397 ?auto_67401 ) ) ( not ( = ?auto_67398 ?auto_67401 ) ) ( not ( = ?auto_67399 ?auto_67401 ) ) ( not ( = ?auto_67402 ?auto_67401 ) ) ( not ( = ?auto_67400 ?auto_67401 ) ) ( ON ?auto_67402 ?auto_67400 ) ( CLEAR ?auto_67398 ) ( ON ?auto_67399 ?auto_67402 ) ( CLEAR ?auto_67399 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_67401 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_67401 ?auto_67400 ?auto_67402 )
      ( MAKE-4PILE ?auto_67396 ?auto_67397 ?auto_67398 ?auto_67399 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_67403 - BLOCK
      ?auto_67404 - BLOCK
      ?auto_67405 - BLOCK
      ?auto_67406 - BLOCK
    )
    :vars
    (
      ?auto_67408 - BLOCK
      ?auto_67409 - BLOCK
      ?auto_67407 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67403 ) ( ON ?auto_67404 ?auto_67403 ) ( not ( = ?auto_67403 ?auto_67404 ) ) ( not ( = ?auto_67403 ?auto_67405 ) ) ( not ( = ?auto_67403 ?auto_67406 ) ) ( not ( = ?auto_67403 ?auto_67408 ) ) ( not ( = ?auto_67404 ?auto_67405 ) ) ( not ( = ?auto_67404 ?auto_67406 ) ) ( not ( = ?auto_67404 ?auto_67408 ) ) ( not ( = ?auto_67405 ?auto_67406 ) ) ( not ( = ?auto_67405 ?auto_67408 ) ) ( not ( = ?auto_67406 ?auto_67408 ) ) ( not ( = ?auto_67403 ?auto_67409 ) ) ( not ( = ?auto_67404 ?auto_67409 ) ) ( not ( = ?auto_67405 ?auto_67409 ) ) ( not ( = ?auto_67406 ?auto_67409 ) ) ( not ( = ?auto_67408 ?auto_67409 ) ) ( ON ?auto_67409 ?auto_67407 ) ( not ( = ?auto_67403 ?auto_67407 ) ) ( not ( = ?auto_67404 ?auto_67407 ) ) ( not ( = ?auto_67405 ?auto_67407 ) ) ( not ( = ?auto_67406 ?auto_67407 ) ) ( not ( = ?auto_67408 ?auto_67407 ) ) ( not ( = ?auto_67409 ?auto_67407 ) ) ( ON ?auto_67408 ?auto_67409 ) ( ON ?auto_67406 ?auto_67408 ) ( CLEAR ?auto_67406 ) ( ON-TABLE ?auto_67407 ) ( HOLDING ?auto_67405 ) ( CLEAR ?auto_67404 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_67403 ?auto_67404 ?auto_67405 )
      ( MAKE-4PILE ?auto_67403 ?auto_67404 ?auto_67405 ?auto_67406 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_67410 - BLOCK
      ?auto_67411 - BLOCK
      ?auto_67412 - BLOCK
      ?auto_67413 - BLOCK
    )
    :vars
    (
      ?auto_67414 - BLOCK
      ?auto_67415 - BLOCK
      ?auto_67416 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67410 ) ( ON ?auto_67411 ?auto_67410 ) ( not ( = ?auto_67410 ?auto_67411 ) ) ( not ( = ?auto_67410 ?auto_67412 ) ) ( not ( = ?auto_67410 ?auto_67413 ) ) ( not ( = ?auto_67410 ?auto_67414 ) ) ( not ( = ?auto_67411 ?auto_67412 ) ) ( not ( = ?auto_67411 ?auto_67413 ) ) ( not ( = ?auto_67411 ?auto_67414 ) ) ( not ( = ?auto_67412 ?auto_67413 ) ) ( not ( = ?auto_67412 ?auto_67414 ) ) ( not ( = ?auto_67413 ?auto_67414 ) ) ( not ( = ?auto_67410 ?auto_67415 ) ) ( not ( = ?auto_67411 ?auto_67415 ) ) ( not ( = ?auto_67412 ?auto_67415 ) ) ( not ( = ?auto_67413 ?auto_67415 ) ) ( not ( = ?auto_67414 ?auto_67415 ) ) ( ON ?auto_67415 ?auto_67416 ) ( not ( = ?auto_67410 ?auto_67416 ) ) ( not ( = ?auto_67411 ?auto_67416 ) ) ( not ( = ?auto_67412 ?auto_67416 ) ) ( not ( = ?auto_67413 ?auto_67416 ) ) ( not ( = ?auto_67414 ?auto_67416 ) ) ( not ( = ?auto_67415 ?auto_67416 ) ) ( ON ?auto_67414 ?auto_67415 ) ( ON ?auto_67413 ?auto_67414 ) ( ON-TABLE ?auto_67416 ) ( CLEAR ?auto_67411 ) ( ON ?auto_67412 ?auto_67413 ) ( CLEAR ?auto_67412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_67416 ?auto_67415 ?auto_67414 ?auto_67413 )
      ( MAKE-4PILE ?auto_67410 ?auto_67411 ?auto_67412 ?auto_67413 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_67417 - BLOCK
      ?auto_67418 - BLOCK
      ?auto_67419 - BLOCK
      ?auto_67420 - BLOCK
    )
    :vars
    (
      ?auto_67422 - BLOCK
      ?auto_67423 - BLOCK
      ?auto_67421 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67417 ) ( not ( = ?auto_67417 ?auto_67418 ) ) ( not ( = ?auto_67417 ?auto_67419 ) ) ( not ( = ?auto_67417 ?auto_67420 ) ) ( not ( = ?auto_67417 ?auto_67422 ) ) ( not ( = ?auto_67418 ?auto_67419 ) ) ( not ( = ?auto_67418 ?auto_67420 ) ) ( not ( = ?auto_67418 ?auto_67422 ) ) ( not ( = ?auto_67419 ?auto_67420 ) ) ( not ( = ?auto_67419 ?auto_67422 ) ) ( not ( = ?auto_67420 ?auto_67422 ) ) ( not ( = ?auto_67417 ?auto_67423 ) ) ( not ( = ?auto_67418 ?auto_67423 ) ) ( not ( = ?auto_67419 ?auto_67423 ) ) ( not ( = ?auto_67420 ?auto_67423 ) ) ( not ( = ?auto_67422 ?auto_67423 ) ) ( ON ?auto_67423 ?auto_67421 ) ( not ( = ?auto_67417 ?auto_67421 ) ) ( not ( = ?auto_67418 ?auto_67421 ) ) ( not ( = ?auto_67419 ?auto_67421 ) ) ( not ( = ?auto_67420 ?auto_67421 ) ) ( not ( = ?auto_67422 ?auto_67421 ) ) ( not ( = ?auto_67423 ?auto_67421 ) ) ( ON ?auto_67422 ?auto_67423 ) ( ON ?auto_67420 ?auto_67422 ) ( ON-TABLE ?auto_67421 ) ( ON ?auto_67419 ?auto_67420 ) ( CLEAR ?auto_67419 ) ( HOLDING ?auto_67418 ) ( CLEAR ?auto_67417 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67417 ?auto_67418 )
      ( MAKE-4PILE ?auto_67417 ?auto_67418 ?auto_67419 ?auto_67420 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_67424 - BLOCK
      ?auto_67425 - BLOCK
      ?auto_67426 - BLOCK
      ?auto_67427 - BLOCK
    )
    :vars
    (
      ?auto_67428 - BLOCK
      ?auto_67430 - BLOCK
      ?auto_67429 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67424 ) ( not ( = ?auto_67424 ?auto_67425 ) ) ( not ( = ?auto_67424 ?auto_67426 ) ) ( not ( = ?auto_67424 ?auto_67427 ) ) ( not ( = ?auto_67424 ?auto_67428 ) ) ( not ( = ?auto_67425 ?auto_67426 ) ) ( not ( = ?auto_67425 ?auto_67427 ) ) ( not ( = ?auto_67425 ?auto_67428 ) ) ( not ( = ?auto_67426 ?auto_67427 ) ) ( not ( = ?auto_67426 ?auto_67428 ) ) ( not ( = ?auto_67427 ?auto_67428 ) ) ( not ( = ?auto_67424 ?auto_67430 ) ) ( not ( = ?auto_67425 ?auto_67430 ) ) ( not ( = ?auto_67426 ?auto_67430 ) ) ( not ( = ?auto_67427 ?auto_67430 ) ) ( not ( = ?auto_67428 ?auto_67430 ) ) ( ON ?auto_67430 ?auto_67429 ) ( not ( = ?auto_67424 ?auto_67429 ) ) ( not ( = ?auto_67425 ?auto_67429 ) ) ( not ( = ?auto_67426 ?auto_67429 ) ) ( not ( = ?auto_67427 ?auto_67429 ) ) ( not ( = ?auto_67428 ?auto_67429 ) ) ( not ( = ?auto_67430 ?auto_67429 ) ) ( ON ?auto_67428 ?auto_67430 ) ( ON ?auto_67427 ?auto_67428 ) ( ON-TABLE ?auto_67429 ) ( ON ?auto_67426 ?auto_67427 ) ( CLEAR ?auto_67424 ) ( ON ?auto_67425 ?auto_67426 ) ( CLEAR ?auto_67425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67429 ?auto_67430 ?auto_67428 ?auto_67427 ?auto_67426 )
      ( MAKE-4PILE ?auto_67424 ?auto_67425 ?auto_67426 ?auto_67427 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_67431 - BLOCK
      ?auto_67432 - BLOCK
      ?auto_67433 - BLOCK
      ?auto_67434 - BLOCK
    )
    :vars
    (
      ?auto_67436 - BLOCK
      ?auto_67435 - BLOCK
      ?auto_67437 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67431 ?auto_67432 ) ) ( not ( = ?auto_67431 ?auto_67433 ) ) ( not ( = ?auto_67431 ?auto_67434 ) ) ( not ( = ?auto_67431 ?auto_67436 ) ) ( not ( = ?auto_67432 ?auto_67433 ) ) ( not ( = ?auto_67432 ?auto_67434 ) ) ( not ( = ?auto_67432 ?auto_67436 ) ) ( not ( = ?auto_67433 ?auto_67434 ) ) ( not ( = ?auto_67433 ?auto_67436 ) ) ( not ( = ?auto_67434 ?auto_67436 ) ) ( not ( = ?auto_67431 ?auto_67435 ) ) ( not ( = ?auto_67432 ?auto_67435 ) ) ( not ( = ?auto_67433 ?auto_67435 ) ) ( not ( = ?auto_67434 ?auto_67435 ) ) ( not ( = ?auto_67436 ?auto_67435 ) ) ( ON ?auto_67435 ?auto_67437 ) ( not ( = ?auto_67431 ?auto_67437 ) ) ( not ( = ?auto_67432 ?auto_67437 ) ) ( not ( = ?auto_67433 ?auto_67437 ) ) ( not ( = ?auto_67434 ?auto_67437 ) ) ( not ( = ?auto_67436 ?auto_67437 ) ) ( not ( = ?auto_67435 ?auto_67437 ) ) ( ON ?auto_67436 ?auto_67435 ) ( ON ?auto_67434 ?auto_67436 ) ( ON-TABLE ?auto_67437 ) ( ON ?auto_67433 ?auto_67434 ) ( ON ?auto_67432 ?auto_67433 ) ( CLEAR ?auto_67432 ) ( HOLDING ?auto_67431 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_67431 )
      ( MAKE-4PILE ?auto_67431 ?auto_67432 ?auto_67433 ?auto_67434 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_67438 - BLOCK
      ?auto_67439 - BLOCK
      ?auto_67440 - BLOCK
      ?auto_67441 - BLOCK
    )
    :vars
    (
      ?auto_67443 - BLOCK
      ?auto_67444 - BLOCK
      ?auto_67442 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67438 ?auto_67439 ) ) ( not ( = ?auto_67438 ?auto_67440 ) ) ( not ( = ?auto_67438 ?auto_67441 ) ) ( not ( = ?auto_67438 ?auto_67443 ) ) ( not ( = ?auto_67439 ?auto_67440 ) ) ( not ( = ?auto_67439 ?auto_67441 ) ) ( not ( = ?auto_67439 ?auto_67443 ) ) ( not ( = ?auto_67440 ?auto_67441 ) ) ( not ( = ?auto_67440 ?auto_67443 ) ) ( not ( = ?auto_67441 ?auto_67443 ) ) ( not ( = ?auto_67438 ?auto_67444 ) ) ( not ( = ?auto_67439 ?auto_67444 ) ) ( not ( = ?auto_67440 ?auto_67444 ) ) ( not ( = ?auto_67441 ?auto_67444 ) ) ( not ( = ?auto_67443 ?auto_67444 ) ) ( ON ?auto_67444 ?auto_67442 ) ( not ( = ?auto_67438 ?auto_67442 ) ) ( not ( = ?auto_67439 ?auto_67442 ) ) ( not ( = ?auto_67440 ?auto_67442 ) ) ( not ( = ?auto_67441 ?auto_67442 ) ) ( not ( = ?auto_67443 ?auto_67442 ) ) ( not ( = ?auto_67444 ?auto_67442 ) ) ( ON ?auto_67443 ?auto_67444 ) ( ON ?auto_67441 ?auto_67443 ) ( ON-TABLE ?auto_67442 ) ( ON ?auto_67440 ?auto_67441 ) ( ON ?auto_67439 ?auto_67440 ) ( ON ?auto_67438 ?auto_67439 ) ( CLEAR ?auto_67438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_67442 ?auto_67444 ?auto_67443 ?auto_67441 ?auto_67440 ?auto_67439 )
      ( MAKE-4PILE ?auto_67438 ?auto_67439 ?auto_67440 ?auto_67441 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67447 - BLOCK
      ?auto_67448 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_67448 ) ( CLEAR ?auto_67447 ) ( ON-TABLE ?auto_67447 ) ( not ( = ?auto_67447 ?auto_67448 ) ) )
    :subtasks
    ( ( !STACK ?auto_67448 ?auto_67447 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67449 - BLOCK
      ?auto_67450 - BLOCK
    )
    :vars
    (
      ?auto_67451 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_67449 ) ( ON-TABLE ?auto_67449 ) ( not ( = ?auto_67449 ?auto_67450 ) ) ( ON ?auto_67450 ?auto_67451 ) ( CLEAR ?auto_67450 ) ( HAND-EMPTY ) ( not ( = ?auto_67449 ?auto_67451 ) ) ( not ( = ?auto_67450 ?auto_67451 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_67450 ?auto_67451 )
      ( MAKE-2PILE ?auto_67449 ?auto_67450 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67452 - BLOCK
      ?auto_67453 - BLOCK
    )
    :vars
    (
      ?auto_67454 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67452 ?auto_67453 ) ) ( ON ?auto_67453 ?auto_67454 ) ( CLEAR ?auto_67453 ) ( not ( = ?auto_67452 ?auto_67454 ) ) ( not ( = ?auto_67453 ?auto_67454 ) ) ( HOLDING ?auto_67452 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_67452 )
      ( MAKE-2PILE ?auto_67452 ?auto_67453 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67455 - BLOCK
      ?auto_67456 - BLOCK
    )
    :vars
    (
      ?auto_67457 - BLOCK
      ?auto_67459 - BLOCK
      ?auto_67458 - BLOCK
      ?auto_67460 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67455 ?auto_67456 ) ) ( ON ?auto_67456 ?auto_67457 ) ( not ( = ?auto_67455 ?auto_67457 ) ) ( not ( = ?auto_67456 ?auto_67457 ) ) ( ON ?auto_67455 ?auto_67456 ) ( CLEAR ?auto_67455 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_67459 ) ( ON ?auto_67458 ?auto_67459 ) ( ON ?auto_67460 ?auto_67458 ) ( ON ?auto_67457 ?auto_67460 ) ( not ( = ?auto_67459 ?auto_67458 ) ) ( not ( = ?auto_67459 ?auto_67460 ) ) ( not ( = ?auto_67459 ?auto_67457 ) ) ( not ( = ?auto_67459 ?auto_67456 ) ) ( not ( = ?auto_67459 ?auto_67455 ) ) ( not ( = ?auto_67458 ?auto_67460 ) ) ( not ( = ?auto_67458 ?auto_67457 ) ) ( not ( = ?auto_67458 ?auto_67456 ) ) ( not ( = ?auto_67458 ?auto_67455 ) ) ( not ( = ?auto_67460 ?auto_67457 ) ) ( not ( = ?auto_67460 ?auto_67456 ) ) ( not ( = ?auto_67460 ?auto_67455 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67459 ?auto_67458 ?auto_67460 ?auto_67457 ?auto_67456 )
      ( MAKE-2PILE ?auto_67455 ?auto_67456 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67461 - BLOCK
      ?auto_67462 - BLOCK
    )
    :vars
    (
      ?auto_67466 - BLOCK
      ?auto_67464 - BLOCK
      ?auto_67465 - BLOCK
      ?auto_67463 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67461 ?auto_67462 ) ) ( ON ?auto_67462 ?auto_67466 ) ( not ( = ?auto_67461 ?auto_67466 ) ) ( not ( = ?auto_67462 ?auto_67466 ) ) ( ON-TABLE ?auto_67464 ) ( ON ?auto_67465 ?auto_67464 ) ( ON ?auto_67463 ?auto_67465 ) ( ON ?auto_67466 ?auto_67463 ) ( not ( = ?auto_67464 ?auto_67465 ) ) ( not ( = ?auto_67464 ?auto_67463 ) ) ( not ( = ?auto_67464 ?auto_67466 ) ) ( not ( = ?auto_67464 ?auto_67462 ) ) ( not ( = ?auto_67464 ?auto_67461 ) ) ( not ( = ?auto_67465 ?auto_67463 ) ) ( not ( = ?auto_67465 ?auto_67466 ) ) ( not ( = ?auto_67465 ?auto_67462 ) ) ( not ( = ?auto_67465 ?auto_67461 ) ) ( not ( = ?auto_67463 ?auto_67466 ) ) ( not ( = ?auto_67463 ?auto_67462 ) ) ( not ( = ?auto_67463 ?auto_67461 ) ) ( HOLDING ?auto_67461 ) ( CLEAR ?auto_67462 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_67464 ?auto_67465 ?auto_67463 ?auto_67466 ?auto_67462 ?auto_67461 )
      ( MAKE-2PILE ?auto_67461 ?auto_67462 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67467 - BLOCK
      ?auto_67468 - BLOCK
    )
    :vars
    (
      ?auto_67472 - BLOCK
      ?auto_67469 - BLOCK
      ?auto_67471 - BLOCK
      ?auto_67470 - BLOCK
      ?auto_67473 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67467 ?auto_67468 ) ) ( ON ?auto_67468 ?auto_67472 ) ( not ( = ?auto_67467 ?auto_67472 ) ) ( not ( = ?auto_67468 ?auto_67472 ) ) ( ON-TABLE ?auto_67469 ) ( ON ?auto_67471 ?auto_67469 ) ( ON ?auto_67470 ?auto_67471 ) ( ON ?auto_67472 ?auto_67470 ) ( not ( = ?auto_67469 ?auto_67471 ) ) ( not ( = ?auto_67469 ?auto_67470 ) ) ( not ( = ?auto_67469 ?auto_67472 ) ) ( not ( = ?auto_67469 ?auto_67468 ) ) ( not ( = ?auto_67469 ?auto_67467 ) ) ( not ( = ?auto_67471 ?auto_67470 ) ) ( not ( = ?auto_67471 ?auto_67472 ) ) ( not ( = ?auto_67471 ?auto_67468 ) ) ( not ( = ?auto_67471 ?auto_67467 ) ) ( not ( = ?auto_67470 ?auto_67472 ) ) ( not ( = ?auto_67470 ?auto_67468 ) ) ( not ( = ?auto_67470 ?auto_67467 ) ) ( CLEAR ?auto_67468 ) ( ON ?auto_67467 ?auto_67473 ) ( CLEAR ?auto_67467 ) ( HAND-EMPTY ) ( not ( = ?auto_67467 ?auto_67473 ) ) ( not ( = ?auto_67468 ?auto_67473 ) ) ( not ( = ?auto_67472 ?auto_67473 ) ) ( not ( = ?auto_67469 ?auto_67473 ) ) ( not ( = ?auto_67471 ?auto_67473 ) ) ( not ( = ?auto_67470 ?auto_67473 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_67467 ?auto_67473 )
      ( MAKE-2PILE ?auto_67467 ?auto_67468 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67474 - BLOCK
      ?auto_67475 - BLOCK
    )
    :vars
    (
      ?auto_67480 - BLOCK
      ?auto_67478 - BLOCK
      ?auto_67477 - BLOCK
      ?auto_67479 - BLOCK
      ?auto_67476 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67474 ?auto_67475 ) ) ( not ( = ?auto_67474 ?auto_67480 ) ) ( not ( = ?auto_67475 ?auto_67480 ) ) ( ON-TABLE ?auto_67478 ) ( ON ?auto_67477 ?auto_67478 ) ( ON ?auto_67479 ?auto_67477 ) ( ON ?auto_67480 ?auto_67479 ) ( not ( = ?auto_67478 ?auto_67477 ) ) ( not ( = ?auto_67478 ?auto_67479 ) ) ( not ( = ?auto_67478 ?auto_67480 ) ) ( not ( = ?auto_67478 ?auto_67475 ) ) ( not ( = ?auto_67478 ?auto_67474 ) ) ( not ( = ?auto_67477 ?auto_67479 ) ) ( not ( = ?auto_67477 ?auto_67480 ) ) ( not ( = ?auto_67477 ?auto_67475 ) ) ( not ( = ?auto_67477 ?auto_67474 ) ) ( not ( = ?auto_67479 ?auto_67480 ) ) ( not ( = ?auto_67479 ?auto_67475 ) ) ( not ( = ?auto_67479 ?auto_67474 ) ) ( ON ?auto_67474 ?auto_67476 ) ( CLEAR ?auto_67474 ) ( not ( = ?auto_67474 ?auto_67476 ) ) ( not ( = ?auto_67475 ?auto_67476 ) ) ( not ( = ?auto_67480 ?auto_67476 ) ) ( not ( = ?auto_67478 ?auto_67476 ) ) ( not ( = ?auto_67477 ?auto_67476 ) ) ( not ( = ?auto_67479 ?auto_67476 ) ) ( HOLDING ?auto_67475 ) ( CLEAR ?auto_67480 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67478 ?auto_67477 ?auto_67479 ?auto_67480 ?auto_67475 )
      ( MAKE-2PILE ?auto_67474 ?auto_67475 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67481 - BLOCK
      ?auto_67482 - BLOCK
    )
    :vars
    (
      ?auto_67486 - BLOCK
      ?auto_67484 - BLOCK
      ?auto_67485 - BLOCK
      ?auto_67483 - BLOCK
      ?auto_67487 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67481 ?auto_67482 ) ) ( not ( = ?auto_67481 ?auto_67486 ) ) ( not ( = ?auto_67482 ?auto_67486 ) ) ( ON-TABLE ?auto_67484 ) ( ON ?auto_67485 ?auto_67484 ) ( ON ?auto_67483 ?auto_67485 ) ( ON ?auto_67486 ?auto_67483 ) ( not ( = ?auto_67484 ?auto_67485 ) ) ( not ( = ?auto_67484 ?auto_67483 ) ) ( not ( = ?auto_67484 ?auto_67486 ) ) ( not ( = ?auto_67484 ?auto_67482 ) ) ( not ( = ?auto_67484 ?auto_67481 ) ) ( not ( = ?auto_67485 ?auto_67483 ) ) ( not ( = ?auto_67485 ?auto_67486 ) ) ( not ( = ?auto_67485 ?auto_67482 ) ) ( not ( = ?auto_67485 ?auto_67481 ) ) ( not ( = ?auto_67483 ?auto_67486 ) ) ( not ( = ?auto_67483 ?auto_67482 ) ) ( not ( = ?auto_67483 ?auto_67481 ) ) ( ON ?auto_67481 ?auto_67487 ) ( not ( = ?auto_67481 ?auto_67487 ) ) ( not ( = ?auto_67482 ?auto_67487 ) ) ( not ( = ?auto_67486 ?auto_67487 ) ) ( not ( = ?auto_67484 ?auto_67487 ) ) ( not ( = ?auto_67485 ?auto_67487 ) ) ( not ( = ?auto_67483 ?auto_67487 ) ) ( CLEAR ?auto_67486 ) ( ON ?auto_67482 ?auto_67481 ) ( CLEAR ?auto_67482 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_67487 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67487 ?auto_67481 )
      ( MAKE-2PILE ?auto_67481 ?auto_67482 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67488 - BLOCK
      ?auto_67489 - BLOCK
    )
    :vars
    (
      ?auto_67494 - BLOCK
      ?auto_67490 - BLOCK
      ?auto_67493 - BLOCK
      ?auto_67492 - BLOCK
      ?auto_67491 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67488 ?auto_67489 ) ) ( not ( = ?auto_67488 ?auto_67494 ) ) ( not ( = ?auto_67489 ?auto_67494 ) ) ( ON-TABLE ?auto_67490 ) ( ON ?auto_67493 ?auto_67490 ) ( ON ?auto_67492 ?auto_67493 ) ( not ( = ?auto_67490 ?auto_67493 ) ) ( not ( = ?auto_67490 ?auto_67492 ) ) ( not ( = ?auto_67490 ?auto_67494 ) ) ( not ( = ?auto_67490 ?auto_67489 ) ) ( not ( = ?auto_67490 ?auto_67488 ) ) ( not ( = ?auto_67493 ?auto_67492 ) ) ( not ( = ?auto_67493 ?auto_67494 ) ) ( not ( = ?auto_67493 ?auto_67489 ) ) ( not ( = ?auto_67493 ?auto_67488 ) ) ( not ( = ?auto_67492 ?auto_67494 ) ) ( not ( = ?auto_67492 ?auto_67489 ) ) ( not ( = ?auto_67492 ?auto_67488 ) ) ( ON ?auto_67488 ?auto_67491 ) ( not ( = ?auto_67488 ?auto_67491 ) ) ( not ( = ?auto_67489 ?auto_67491 ) ) ( not ( = ?auto_67494 ?auto_67491 ) ) ( not ( = ?auto_67490 ?auto_67491 ) ) ( not ( = ?auto_67493 ?auto_67491 ) ) ( not ( = ?auto_67492 ?auto_67491 ) ) ( ON ?auto_67489 ?auto_67488 ) ( CLEAR ?auto_67489 ) ( ON-TABLE ?auto_67491 ) ( HOLDING ?auto_67494 ) ( CLEAR ?auto_67492 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_67490 ?auto_67493 ?auto_67492 ?auto_67494 )
      ( MAKE-2PILE ?auto_67488 ?auto_67489 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67495 - BLOCK
      ?auto_67496 - BLOCK
    )
    :vars
    (
      ?auto_67501 - BLOCK
      ?auto_67497 - BLOCK
      ?auto_67500 - BLOCK
      ?auto_67498 - BLOCK
      ?auto_67499 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67495 ?auto_67496 ) ) ( not ( = ?auto_67495 ?auto_67501 ) ) ( not ( = ?auto_67496 ?auto_67501 ) ) ( ON-TABLE ?auto_67497 ) ( ON ?auto_67500 ?auto_67497 ) ( ON ?auto_67498 ?auto_67500 ) ( not ( = ?auto_67497 ?auto_67500 ) ) ( not ( = ?auto_67497 ?auto_67498 ) ) ( not ( = ?auto_67497 ?auto_67501 ) ) ( not ( = ?auto_67497 ?auto_67496 ) ) ( not ( = ?auto_67497 ?auto_67495 ) ) ( not ( = ?auto_67500 ?auto_67498 ) ) ( not ( = ?auto_67500 ?auto_67501 ) ) ( not ( = ?auto_67500 ?auto_67496 ) ) ( not ( = ?auto_67500 ?auto_67495 ) ) ( not ( = ?auto_67498 ?auto_67501 ) ) ( not ( = ?auto_67498 ?auto_67496 ) ) ( not ( = ?auto_67498 ?auto_67495 ) ) ( ON ?auto_67495 ?auto_67499 ) ( not ( = ?auto_67495 ?auto_67499 ) ) ( not ( = ?auto_67496 ?auto_67499 ) ) ( not ( = ?auto_67501 ?auto_67499 ) ) ( not ( = ?auto_67497 ?auto_67499 ) ) ( not ( = ?auto_67500 ?auto_67499 ) ) ( not ( = ?auto_67498 ?auto_67499 ) ) ( ON ?auto_67496 ?auto_67495 ) ( ON-TABLE ?auto_67499 ) ( CLEAR ?auto_67498 ) ( ON ?auto_67501 ?auto_67496 ) ( CLEAR ?auto_67501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_67499 ?auto_67495 ?auto_67496 )
      ( MAKE-2PILE ?auto_67495 ?auto_67496 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67502 - BLOCK
      ?auto_67503 - BLOCK
    )
    :vars
    (
      ?auto_67505 - BLOCK
      ?auto_67507 - BLOCK
      ?auto_67506 - BLOCK
      ?auto_67504 - BLOCK
      ?auto_67508 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67502 ?auto_67503 ) ) ( not ( = ?auto_67502 ?auto_67505 ) ) ( not ( = ?auto_67503 ?auto_67505 ) ) ( ON-TABLE ?auto_67507 ) ( ON ?auto_67506 ?auto_67507 ) ( not ( = ?auto_67507 ?auto_67506 ) ) ( not ( = ?auto_67507 ?auto_67504 ) ) ( not ( = ?auto_67507 ?auto_67505 ) ) ( not ( = ?auto_67507 ?auto_67503 ) ) ( not ( = ?auto_67507 ?auto_67502 ) ) ( not ( = ?auto_67506 ?auto_67504 ) ) ( not ( = ?auto_67506 ?auto_67505 ) ) ( not ( = ?auto_67506 ?auto_67503 ) ) ( not ( = ?auto_67506 ?auto_67502 ) ) ( not ( = ?auto_67504 ?auto_67505 ) ) ( not ( = ?auto_67504 ?auto_67503 ) ) ( not ( = ?auto_67504 ?auto_67502 ) ) ( ON ?auto_67502 ?auto_67508 ) ( not ( = ?auto_67502 ?auto_67508 ) ) ( not ( = ?auto_67503 ?auto_67508 ) ) ( not ( = ?auto_67505 ?auto_67508 ) ) ( not ( = ?auto_67507 ?auto_67508 ) ) ( not ( = ?auto_67506 ?auto_67508 ) ) ( not ( = ?auto_67504 ?auto_67508 ) ) ( ON ?auto_67503 ?auto_67502 ) ( ON-TABLE ?auto_67508 ) ( ON ?auto_67505 ?auto_67503 ) ( CLEAR ?auto_67505 ) ( HOLDING ?auto_67504 ) ( CLEAR ?auto_67506 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_67507 ?auto_67506 ?auto_67504 )
      ( MAKE-2PILE ?auto_67502 ?auto_67503 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67509 - BLOCK
      ?auto_67510 - BLOCK
    )
    :vars
    (
      ?auto_67511 - BLOCK
      ?auto_67515 - BLOCK
      ?auto_67513 - BLOCK
      ?auto_67512 - BLOCK
      ?auto_67514 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67509 ?auto_67510 ) ) ( not ( = ?auto_67509 ?auto_67511 ) ) ( not ( = ?auto_67510 ?auto_67511 ) ) ( ON-TABLE ?auto_67515 ) ( ON ?auto_67513 ?auto_67515 ) ( not ( = ?auto_67515 ?auto_67513 ) ) ( not ( = ?auto_67515 ?auto_67512 ) ) ( not ( = ?auto_67515 ?auto_67511 ) ) ( not ( = ?auto_67515 ?auto_67510 ) ) ( not ( = ?auto_67515 ?auto_67509 ) ) ( not ( = ?auto_67513 ?auto_67512 ) ) ( not ( = ?auto_67513 ?auto_67511 ) ) ( not ( = ?auto_67513 ?auto_67510 ) ) ( not ( = ?auto_67513 ?auto_67509 ) ) ( not ( = ?auto_67512 ?auto_67511 ) ) ( not ( = ?auto_67512 ?auto_67510 ) ) ( not ( = ?auto_67512 ?auto_67509 ) ) ( ON ?auto_67509 ?auto_67514 ) ( not ( = ?auto_67509 ?auto_67514 ) ) ( not ( = ?auto_67510 ?auto_67514 ) ) ( not ( = ?auto_67511 ?auto_67514 ) ) ( not ( = ?auto_67515 ?auto_67514 ) ) ( not ( = ?auto_67513 ?auto_67514 ) ) ( not ( = ?auto_67512 ?auto_67514 ) ) ( ON ?auto_67510 ?auto_67509 ) ( ON-TABLE ?auto_67514 ) ( ON ?auto_67511 ?auto_67510 ) ( CLEAR ?auto_67513 ) ( ON ?auto_67512 ?auto_67511 ) ( CLEAR ?auto_67512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_67514 ?auto_67509 ?auto_67510 ?auto_67511 )
      ( MAKE-2PILE ?auto_67509 ?auto_67510 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67516 - BLOCK
      ?auto_67517 - BLOCK
    )
    :vars
    (
      ?auto_67522 - BLOCK
      ?auto_67519 - BLOCK
      ?auto_67521 - BLOCK
      ?auto_67520 - BLOCK
      ?auto_67518 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67516 ?auto_67517 ) ) ( not ( = ?auto_67516 ?auto_67522 ) ) ( not ( = ?auto_67517 ?auto_67522 ) ) ( ON-TABLE ?auto_67519 ) ( not ( = ?auto_67519 ?auto_67521 ) ) ( not ( = ?auto_67519 ?auto_67520 ) ) ( not ( = ?auto_67519 ?auto_67522 ) ) ( not ( = ?auto_67519 ?auto_67517 ) ) ( not ( = ?auto_67519 ?auto_67516 ) ) ( not ( = ?auto_67521 ?auto_67520 ) ) ( not ( = ?auto_67521 ?auto_67522 ) ) ( not ( = ?auto_67521 ?auto_67517 ) ) ( not ( = ?auto_67521 ?auto_67516 ) ) ( not ( = ?auto_67520 ?auto_67522 ) ) ( not ( = ?auto_67520 ?auto_67517 ) ) ( not ( = ?auto_67520 ?auto_67516 ) ) ( ON ?auto_67516 ?auto_67518 ) ( not ( = ?auto_67516 ?auto_67518 ) ) ( not ( = ?auto_67517 ?auto_67518 ) ) ( not ( = ?auto_67522 ?auto_67518 ) ) ( not ( = ?auto_67519 ?auto_67518 ) ) ( not ( = ?auto_67521 ?auto_67518 ) ) ( not ( = ?auto_67520 ?auto_67518 ) ) ( ON ?auto_67517 ?auto_67516 ) ( ON-TABLE ?auto_67518 ) ( ON ?auto_67522 ?auto_67517 ) ( ON ?auto_67520 ?auto_67522 ) ( CLEAR ?auto_67520 ) ( HOLDING ?auto_67521 ) ( CLEAR ?auto_67519 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67519 ?auto_67521 )
      ( MAKE-2PILE ?auto_67516 ?auto_67517 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67523 - BLOCK
      ?auto_67524 - BLOCK
    )
    :vars
    (
      ?auto_67529 - BLOCK
      ?auto_67525 - BLOCK
      ?auto_67528 - BLOCK
      ?auto_67527 - BLOCK
      ?auto_67526 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67523 ?auto_67524 ) ) ( not ( = ?auto_67523 ?auto_67529 ) ) ( not ( = ?auto_67524 ?auto_67529 ) ) ( ON-TABLE ?auto_67525 ) ( not ( = ?auto_67525 ?auto_67528 ) ) ( not ( = ?auto_67525 ?auto_67527 ) ) ( not ( = ?auto_67525 ?auto_67529 ) ) ( not ( = ?auto_67525 ?auto_67524 ) ) ( not ( = ?auto_67525 ?auto_67523 ) ) ( not ( = ?auto_67528 ?auto_67527 ) ) ( not ( = ?auto_67528 ?auto_67529 ) ) ( not ( = ?auto_67528 ?auto_67524 ) ) ( not ( = ?auto_67528 ?auto_67523 ) ) ( not ( = ?auto_67527 ?auto_67529 ) ) ( not ( = ?auto_67527 ?auto_67524 ) ) ( not ( = ?auto_67527 ?auto_67523 ) ) ( ON ?auto_67523 ?auto_67526 ) ( not ( = ?auto_67523 ?auto_67526 ) ) ( not ( = ?auto_67524 ?auto_67526 ) ) ( not ( = ?auto_67529 ?auto_67526 ) ) ( not ( = ?auto_67525 ?auto_67526 ) ) ( not ( = ?auto_67528 ?auto_67526 ) ) ( not ( = ?auto_67527 ?auto_67526 ) ) ( ON ?auto_67524 ?auto_67523 ) ( ON-TABLE ?auto_67526 ) ( ON ?auto_67529 ?auto_67524 ) ( ON ?auto_67527 ?auto_67529 ) ( CLEAR ?auto_67525 ) ( ON ?auto_67528 ?auto_67527 ) ( CLEAR ?auto_67528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67526 ?auto_67523 ?auto_67524 ?auto_67529 ?auto_67527 )
      ( MAKE-2PILE ?auto_67523 ?auto_67524 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67530 - BLOCK
      ?auto_67531 - BLOCK
    )
    :vars
    (
      ?auto_67533 - BLOCK
      ?auto_67534 - BLOCK
      ?auto_67532 - BLOCK
      ?auto_67535 - BLOCK
      ?auto_67536 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67530 ?auto_67531 ) ) ( not ( = ?auto_67530 ?auto_67533 ) ) ( not ( = ?auto_67531 ?auto_67533 ) ) ( not ( = ?auto_67534 ?auto_67532 ) ) ( not ( = ?auto_67534 ?auto_67535 ) ) ( not ( = ?auto_67534 ?auto_67533 ) ) ( not ( = ?auto_67534 ?auto_67531 ) ) ( not ( = ?auto_67534 ?auto_67530 ) ) ( not ( = ?auto_67532 ?auto_67535 ) ) ( not ( = ?auto_67532 ?auto_67533 ) ) ( not ( = ?auto_67532 ?auto_67531 ) ) ( not ( = ?auto_67532 ?auto_67530 ) ) ( not ( = ?auto_67535 ?auto_67533 ) ) ( not ( = ?auto_67535 ?auto_67531 ) ) ( not ( = ?auto_67535 ?auto_67530 ) ) ( ON ?auto_67530 ?auto_67536 ) ( not ( = ?auto_67530 ?auto_67536 ) ) ( not ( = ?auto_67531 ?auto_67536 ) ) ( not ( = ?auto_67533 ?auto_67536 ) ) ( not ( = ?auto_67534 ?auto_67536 ) ) ( not ( = ?auto_67532 ?auto_67536 ) ) ( not ( = ?auto_67535 ?auto_67536 ) ) ( ON ?auto_67531 ?auto_67530 ) ( ON-TABLE ?auto_67536 ) ( ON ?auto_67533 ?auto_67531 ) ( ON ?auto_67535 ?auto_67533 ) ( ON ?auto_67532 ?auto_67535 ) ( CLEAR ?auto_67532 ) ( HOLDING ?auto_67534 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_67534 )
      ( MAKE-2PILE ?auto_67530 ?auto_67531 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67537 - BLOCK
      ?auto_67538 - BLOCK
    )
    :vars
    (
      ?auto_67539 - BLOCK
      ?auto_67541 - BLOCK
      ?auto_67543 - BLOCK
      ?auto_67542 - BLOCK
      ?auto_67540 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67537 ?auto_67538 ) ) ( not ( = ?auto_67537 ?auto_67539 ) ) ( not ( = ?auto_67538 ?auto_67539 ) ) ( not ( = ?auto_67541 ?auto_67543 ) ) ( not ( = ?auto_67541 ?auto_67542 ) ) ( not ( = ?auto_67541 ?auto_67539 ) ) ( not ( = ?auto_67541 ?auto_67538 ) ) ( not ( = ?auto_67541 ?auto_67537 ) ) ( not ( = ?auto_67543 ?auto_67542 ) ) ( not ( = ?auto_67543 ?auto_67539 ) ) ( not ( = ?auto_67543 ?auto_67538 ) ) ( not ( = ?auto_67543 ?auto_67537 ) ) ( not ( = ?auto_67542 ?auto_67539 ) ) ( not ( = ?auto_67542 ?auto_67538 ) ) ( not ( = ?auto_67542 ?auto_67537 ) ) ( ON ?auto_67537 ?auto_67540 ) ( not ( = ?auto_67537 ?auto_67540 ) ) ( not ( = ?auto_67538 ?auto_67540 ) ) ( not ( = ?auto_67539 ?auto_67540 ) ) ( not ( = ?auto_67541 ?auto_67540 ) ) ( not ( = ?auto_67543 ?auto_67540 ) ) ( not ( = ?auto_67542 ?auto_67540 ) ) ( ON ?auto_67538 ?auto_67537 ) ( ON-TABLE ?auto_67540 ) ( ON ?auto_67539 ?auto_67538 ) ( ON ?auto_67542 ?auto_67539 ) ( ON ?auto_67543 ?auto_67542 ) ( ON ?auto_67541 ?auto_67543 ) ( CLEAR ?auto_67541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_67540 ?auto_67537 ?auto_67538 ?auto_67539 ?auto_67542 ?auto_67543 )
      ( MAKE-2PILE ?auto_67537 ?auto_67538 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67547 - BLOCK
      ?auto_67548 - BLOCK
      ?auto_67549 - BLOCK
    )
    :vars
    (
      ?auto_67550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67550 ?auto_67549 ) ( CLEAR ?auto_67550 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_67547 ) ( ON ?auto_67548 ?auto_67547 ) ( ON ?auto_67549 ?auto_67548 ) ( not ( = ?auto_67547 ?auto_67548 ) ) ( not ( = ?auto_67547 ?auto_67549 ) ) ( not ( = ?auto_67547 ?auto_67550 ) ) ( not ( = ?auto_67548 ?auto_67549 ) ) ( not ( = ?auto_67548 ?auto_67550 ) ) ( not ( = ?auto_67549 ?auto_67550 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_67550 ?auto_67549 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67551 - BLOCK
      ?auto_67552 - BLOCK
      ?auto_67553 - BLOCK
    )
    :vars
    (
      ?auto_67554 - BLOCK
      ?auto_67555 - BLOCK
      ?auto_67556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67554 ?auto_67553 ) ( CLEAR ?auto_67554 ) ( ON-TABLE ?auto_67551 ) ( ON ?auto_67552 ?auto_67551 ) ( ON ?auto_67553 ?auto_67552 ) ( not ( = ?auto_67551 ?auto_67552 ) ) ( not ( = ?auto_67551 ?auto_67553 ) ) ( not ( = ?auto_67551 ?auto_67554 ) ) ( not ( = ?auto_67552 ?auto_67553 ) ) ( not ( = ?auto_67552 ?auto_67554 ) ) ( not ( = ?auto_67553 ?auto_67554 ) ) ( HOLDING ?auto_67555 ) ( CLEAR ?auto_67556 ) ( not ( = ?auto_67551 ?auto_67555 ) ) ( not ( = ?auto_67551 ?auto_67556 ) ) ( not ( = ?auto_67552 ?auto_67555 ) ) ( not ( = ?auto_67552 ?auto_67556 ) ) ( not ( = ?auto_67553 ?auto_67555 ) ) ( not ( = ?auto_67553 ?auto_67556 ) ) ( not ( = ?auto_67554 ?auto_67555 ) ) ( not ( = ?auto_67554 ?auto_67556 ) ) ( not ( = ?auto_67555 ?auto_67556 ) ) )
    :subtasks
    ( ( !STACK ?auto_67555 ?auto_67556 )
      ( MAKE-3PILE ?auto_67551 ?auto_67552 ?auto_67553 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67557 - BLOCK
      ?auto_67558 - BLOCK
      ?auto_67559 - BLOCK
    )
    :vars
    (
      ?auto_67562 - BLOCK
      ?auto_67560 - BLOCK
      ?auto_67561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67562 ?auto_67559 ) ( ON-TABLE ?auto_67557 ) ( ON ?auto_67558 ?auto_67557 ) ( ON ?auto_67559 ?auto_67558 ) ( not ( = ?auto_67557 ?auto_67558 ) ) ( not ( = ?auto_67557 ?auto_67559 ) ) ( not ( = ?auto_67557 ?auto_67562 ) ) ( not ( = ?auto_67558 ?auto_67559 ) ) ( not ( = ?auto_67558 ?auto_67562 ) ) ( not ( = ?auto_67559 ?auto_67562 ) ) ( CLEAR ?auto_67560 ) ( not ( = ?auto_67557 ?auto_67561 ) ) ( not ( = ?auto_67557 ?auto_67560 ) ) ( not ( = ?auto_67558 ?auto_67561 ) ) ( not ( = ?auto_67558 ?auto_67560 ) ) ( not ( = ?auto_67559 ?auto_67561 ) ) ( not ( = ?auto_67559 ?auto_67560 ) ) ( not ( = ?auto_67562 ?auto_67561 ) ) ( not ( = ?auto_67562 ?auto_67560 ) ) ( not ( = ?auto_67561 ?auto_67560 ) ) ( ON ?auto_67561 ?auto_67562 ) ( CLEAR ?auto_67561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_67557 ?auto_67558 ?auto_67559 ?auto_67562 )
      ( MAKE-3PILE ?auto_67557 ?auto_67558 ?auto_67559 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67563 - BLOCK
      ?auto_67564 - BLOCK
      ?auto_67565 - BLOCK
    )
    :vars
    (
      ?auto_67568 - BLOCK
      ?auto_67566 - BLOCK
      ?auto_67567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67568 ?auto_67565 ) ( ON-TABLE ?auto_67563 ) ( ON ?auto_67564 ?auto_67563 ) ( ON ?auto_67565 ?auto_67564 ) ( not ( = ?auto_67563 ?auto_67564 ) ) ( not ( = ?auto_67563 ?auto_67565 ) ) ( not ( = ?auto_67563 ?auto_67568 ) ) ( not ( = ?auto_67564 ?auto_67565 ) ) ( not ( = ?auto_67564 ?auto_67568 ) ) ( not ( = ?auto_67565 ?auto_67568 ) ) ( not ( = ?auto_67563 ?auto_67566 ) ) ( not ( = ?auto_67563 ?auto_67567 ) ) ( not ( = ?auto_67564 ?auto_67566 ) ) ( not ( = ?auto_67564 ?auto_67567 ) ) ( not ( = ?auto_67565 ?auto_67566 ) ) ( not ( = ?auto_67565 ?auto_67567 ) ) ( not ( = ?auto_67568 ?auto_67566 ) ) ( not ( = ?auto_67568 ?auto_67567 ) ) ( not ( = ?auto_67566 ?auto_67567 ) ) ( ON ?auto_67566 ?auto_67568 ) ( CLEAR ?auto_67566 ) ( HOLDING ?auto_67567 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_67567 )
      ( MAKE-3PILE ?auto_67563 ?auto_67564 ?auto_67565 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67569 - BLOCK
      ?auto_67570 - BLOCK
      ?auto_67571 - BLOCK
    )
    :vars
    (
      ?auto_67573 - BLOCK
      ?auto_67572 - BLOCK
      ?auto_67574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67573 ?auto_67571 ) ( ON-TABLE ?auto_67569 ) ( ON ?auto_67570 ?auto_67569 ) ( ON ?auto_67571 ?auto_67570 ) ( not ( = ?auto_67569 ?auto_67570 ) ) ( not ( = ?auto_67569 ?auto_67571 ) ) ( not ( = ?auto_67569 ?auto_67573 ) ) ( not ( = ?auto_67570 ?auto_67571 ) ) ( not ( = ?auto_67570 ?auto_67573 ) ) ( not ( = ?auto_67571 ?auto_67573 ) ) ( not ( = ?auto_67569 ?auto_67572 ) ) ( not ( = ?auto_67569 ?auto_67574 ) ) ( not ( = ?auto_67570 ?auto_67572 ) ) ( not ( = ?auto_67570 ?auto_67574 ) ) ( not ( = ?auto_67571 ?auto_67572 ) ) ( not ( = ?auto_67571 ?auto_67574 ) ) ( not ( = ?auto_67573 ?auto_67572 ) ) ( not ( = ?auto_67573 ?auto_67574 ) ) ( not ( = ?auto_67572 ?auto_67574 ) ) ( ON ?auto_67572 ?auto_67573 ) ( ON ?auto_67574 ?auto_67572 ) ( CLEAR ?auto_67574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67569 ?auto_67570 ?auto_67571 ?auto_67573 ?auto_67572 )
      ( MAKE-3PILE ?auto_67569 ?auto_67570 ?auto_67571 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67575 - BLOCK
      ?auto_67576 - BLOCK
      ?auto_67577 - BLOCK
    )
    :vars
    (
      ?auto_67580 - BLOCK
      ?auto_67579 - BLOCK
      ?auto_67578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67580 ?auto_67577 ) ( ON-TABLE ?auto_67575 ) ( ON ?auto_67576 ?auto_67575 ) ( ON ?auto_67577 ?auto_67576 ) ( not ( = ?auto_67575 ?auto_67576 ) ) ( not ( = ?auto_67575 ?auto_67577 ) ) ( not ( = ?auto_67575 ?auto_67580 ) ) ( not ( = ?auto_67576 ?auto_67577 ) ) ( not ( = ?auto_67576 ?auto_67580 ) ) ( not ( = ?auto_67577 ?auto_67580 ) ) ( not ( = ?auto_67575 ?auto_67579 ) ) ( not ( = ?auto_67575 ?auto_67578 ) ) ( not ( = ?auto_67576 ?auto_67579 ) ) ( not ( = ?auto_67576 ?auto_67578 ) ) ( not ( = ?auto_67577 ?auto_67579 ) ) ( not ( = ?auto_67577 ?auto_67578 ) ) ( not ( = ?auto_67580 ?auto_67579 ) ) ( not ( = ?auto_67580 ?auto_67578 ) ) ( not ( = ?auto_67579 ?auto_67578 ) ) ( ON ?auto_67579 ?auto_67580 ) ( HOLDING ?auto_67578 ) ( CLEAR ?auto_67579 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_67575 ?auto_67576 ?auto_67577 ?auto_67580 ?auto_67579 ?auto_67578 )
      ( MAKE-3PILE ?auto_67575 ?auto_67576 ?auto_67577 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67581 - BLOCK
      ?auto_67582 - BLOCK
      ?auto_67583 - BLOCK
    )
    :vars
    (
      ?auto_67584 - BLOCK
      ?auto_67585 - BLOCK
      ?auto_67586 - BLOCK
      ?auto_67587 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67584 ?auto_67583 ) ( ON-TABLE ?auto_67581 ) ( ON ?auto_67582 ?auto_67581 ) ( ON ?auto_67583 ?auto_67582 ) ( not ( = ?auto_67581 ?auto_67582 ) ) ( not ( = ?auto_67581 ?auto_67583 ) ) ( not ( = ?auto_67581 ?auto_67584 ) ) ( not ( = ?auto_67582 ?auto_67583 ) ) ( not ( = ?auto_67582 ?auto_67584 ) ) ( not ( = ?auto_67583 ?auto_67584 ) ) ( not ( = ?auto_67581 ?auto_67585 ) ) ( not ( = ?auto_67581 ?auto_67586 ) ) ( not ( = ?auto_67582 ?auto_67585 ) ) ( not ( = ?auto_67582 ?auto_67586 ) ) ( not ( = ?auto_67583 ?auto_67585 ) ) ( not ( = ?auto_67583 ?auto_67586 ) ) ( not ( = ?auto_67584 ?auto_67585 ) ) ( not ( = ?auto_67584 ?auto_67586 ) ) ( not ( = ?auto_67585 ?auto_67586 ) ) ( ON ?auto_67585 ?auto_67584 ) ( CLEAR ?auto_67585 ) ( ON ?auto_67586 ?auto_67587 ) ( CLEAR ?auto_67586 ) ( HAND-EMPTY ) ( not ( = ?auto_67581 ?auto_67587 ) ) ( not ( = ?auto_67582 ?auto_67587 ) ) ( not ( = ?auto_67583 ?auto_67587 ) ) ( not ( = ?auto_67584 ?auto_67587 ) ) ( not ( = ?auto_67585 ?auto_67587 ) ) ( not ( = ?auto_67586 ?auto_67587 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_67586 ?auto_67587 )
      ( MAKE-3PILE ?auto_67581 ?auto_67582 ?auto_67583 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67588 - BLOCK
      ?auto_67589 - BLOCK
      ?auto_67590 - BLOCK
    )
    :vars
    (
      ?auto_67591 - BLOCK
      ?auto_67592 - BLOCK
      ?auto_67594 - BLOCK
      ?auto_67593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67591 ?auto_67590 ) ( ON-TABLE ?auto_67588 ) ( ON ?auto_67589 ?auto_67588 ) ( ON ?auto_67590 ?auto_67589 ) ( not ( = ?auto_67588 ?auto_67589 ) ) ( not ( = ?auto_67588 ?auto_67590 ) ) ( not ( = ?auto_67588 ?auto_67591 ) ) ( not ( = ?auto_67589 ?auto_67590 ) ) ( not ( = ?auto_67589 ?auto_67591 ) ) ( not ( = ?auto_67590 ?auto_67591 ) ) ( not ( = ?auto_67588 ?auto_67592 ) ) ( not ( = ?auto_67588 ?auto_67594 ) ) ( not ( = ?auto_67589 ?auto_67592 ) ) ( not ( = ?auto_67589 ?auto_67594 ) ) ( not ( = ?auto_67590 ?auto_67592 ) ) ( not ( = ?auto_67590 ?auto_67594 ) ) ( not ( = ?auto_67591 ?auto_67592 ) ) ( not ( = ?auto_67591 ?auto_67594 ) ) ( not ( = ?auto_67592 ?auto_67594 ) ) ( ON ?auto_67594 ?auto_67593 ) ( CLEAR ?auto_67594 ) ( not ( = ?auto_67588 ?auto_67593 ) ) ( not ( = ?auto_67589 ?auto_67593 ) ) ( not ( = ?auto_67590 ?auto_67593 ) ) ( not ( = ?auto_67591 ?auto_67593 ) ) ( not ( = ?auto_67592 ?auto_67593 ) ) ( not ( = ?auto_67594 ?auto_67593 ) ) ( HOLDING ?auto_67592 ) ( CLEAR ?auto_67591 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67588 ?auto_67589 ?auto_67590 ?auto_67591 ?auto_67592 )
      ( MAKE-3PILE ?auto_67588 ?auto_67589 ?auto_67590 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67595 - BLOCK
      ?auto_67596 - BLOCK
      ?auto_67597 - BLOCK
    )
    :vars
    (
      ?auto_67598 - BLOCK
      ?auto_67601 - BLOCK
      ?auto_67600 - BLOCK
      ?auto_67599 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67598 ?auto_67597 ) ( ON-TABLE ?auto_67595 ) ( ON ?auto_67596 ?auto_67595 ) ( ON ?auto_67597 ?auto_67596 ) ( not ( = ?auto_67595 ?auto_67596 ) ) ( not ( = ?auto_67595 ?auto_67597 ) ) ( not ( = ?auto_67595 ?auto_67598 ) ) ( not ( = ?auto_67596 ?auto_67597 ) ) ( not ( = ?auto_67596 ?auto_67598 ) ) ( not ( = ?auto_67597 ?auto_67598 ) ) ( not ( = ?auto_67595 ?auto_67601 ) ) ( not ( = ?auto_67595 ?auto_67600 ) ) ( not ( = ?auto_67596 ?auto_67601 ) ) ( not ( = ?auto_67596 ?auto_67600 ) ) ( not ( = ?auto_67597 ?auto_67601 ) ) ( not ( = ?auto_67597 ?auto_67600 ) ) ( not ( = ?auto_67598 ?auto_67601 ) ) ( not ( = ?auto_67598 ?auto_67600 ) ) ( not ( = ?auto_67601 ?auto_67600 ) ) ( ON ?auto_67600 ?auto_67599 ) ( not ( = ?auto_67595 ?auto_67599 ) ) ( not ( = ?auto_67596 ?auto_67599 ) ) ( not ( = ?auto_67597 ?auto_67599 ) ) ( not ( = ?auto_67598 ?auto_67599 ) ) ( not ( = ?auto_67601 ?auto_67599 ) ) ( not ( = ?auto_67600 ?auto_67599 ) ) ( CLEAR ?auto_67598 ) ( ON ?auto_67601 ?auto_67600 ) ( CLEAR ?auto_67601 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_67599 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67599 ?auto_67600 )
      ( MAKE-3PILE ?auto_67595 ?auto_67596 ?auto_67597 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67616 - BLOCK
      ?auto_67617 - BLOCK
      ?auto_67618 - BLOCK
    )
    :vars
    (
      ?auto_67621 - BLOCK
      ?auto_67620 - BLOCK
      ?auto_67622 - BLOCK
      ?auto_67619 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67616 ) ( ON ?auto_67617 ?auto_67616 ) ( not ( = ?auto_67616 ?auto_67617 ) ) ( not ( = ?auto_67616 ?auto_67618 ) ) ( not ( = ?auto_67616 ?auto_67621 ) ) ( not ( = ?auto_67617 ?auto_67618 ) ) ( not ( = ?auto_67617 ?auto_67621 ) ) ( not ( = ?auto_67618 ?auto_67621 ) ) ( not ( = ?auto_67616 ?auto_67620 ) ) ( not ( = ?auto_67616 ?auto_67622 ) ) ( not ( = ?auto_67617 ?auto_67620 ) ) ( not ( = ?auto_67617 ?auto_67622 ) ) ( not ( = ?auto_67618 ?auto_67620 ) ) ( not ( = ?auto_67618 ?auto_67622 ) ) ( not ( = ?auto_67621 ?auto_67620 ) ) ( not ( = ?auto_67621 ?auto_67622 ) ) ( not ( = ?auto_67620 ?auto_67622 ) ) ( ON ?auto_67622 ?auto_67619 ) ( not ( = ?auto_67616 ?auto_67619 ) ) ( not ( = ?auto_67617 ?auto_67619 ) ) ( not ( = ?auto_67618 ?auto_67619 ) ) ( not ( = ?auto_67621 ?auto_67619 ) ) ( not ( = ?auto_67620 ?auto_67619 ) ) ( not ( = ?auto_67622 ?auto_67619 ) ) ( ON ?auto_67620 ?auto_67622 ) ( ON-TABLE ?auto_67619 ) ( ON ?auto_67621 ?auto_67620 ) ( CLEAR ?auto_67621 ) ( HOLDING ?auto_67618 ) ( CLEAR ?auto_67617 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_67616 ?auto_67617 ?auto_67618 ?auto_67621 )
      ( MAKE-3PILE ?auto_67616 ?auto_67617 ?auto_67618 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67623 - BLOCK
      ?auto_67624 - BLOCK
      ?auto_67625 - BLOCK
    )
    :vars
    (
      ?auto_67627 - BLOCK
      ?auto_67629 - BLOCK
      ?auto_67626 - BLOCK
      ?auto_67628 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67623 ) ( ON ?auto_67624 ?auto_67623 ) ( not ( = ?auto_67623 ?auto_67624 ) ) ( not ( = ?auto_67623 ?auto_67625 ) ) ( not ( = ?auto_67623 ?auto_67627 ) ) ( not ( = ?auto_67624 ?auto_67625 ) ) ( not ( = ?auto_67624 ?auto_67627 ) ) ( not ( = ?auto_67625 ?auto_67627 ) ) ( not ( = ?auto_67623 ?auto_67629 ) ) ( not ( = ?auto_67623 ?auto_67626 ) ) ( not ( = ?auto_67624 ?auto_67629 ) ) ( not ( = ?auto_67624 ?auto_67626 ) ) ( not ( = ?auto_67625 ?auto_67629 ) ) ( not ( = ?auto_67625 ?auto_67626 ) ) ( not ( = ?auto_67627 ?auto_67629 ) ) ( not ( = ?auto_67627 ?auto_67626 ) ) ( not ( = ?auto_67629 ?auto_67626 ) ) ( ON ?auto_67626 ?auto_67628 ) ( not ( = ?auto_67623 ?auto_67628 ) ) ( not ( = ?auto_67624 ?auto_67628 ) ) ( not ( = ?auto_67625 ?auto_67628 ) ) ( not ( = ?auto_67627 ?auto_67628 ) ) ( not ( = ?auto_67629 ?auto_67628 ) ) ( not ( = ?auto_67626 ?auto_67628 ) ) ( ON ?auto_67629 ?auto_67626 ) ( ON-TABLE ?auto_67628 ) ( ON ?auto_67627 ?auto_67629 ) ( CLEAR ?auto_67624 ) ( ON ?auto_67625 ?auto_67627 ) ( CLEAR ?auto_67625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_67628 ?auto_67626 ?auto_67629 ?auto_67627 )
      ( MAKE-3PILE ?auto_67623 ?auto_67624 ?auto_67625 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67630 - BLOCK
      ?auto_67631 - BLOCK
      ?auto_67632 - BLOCK
    )
    :vars
    (
      ?auto_67633 - BLOCK
      ?auto_67635 - BLOCK
      ?auto_67634 - BLOCK
      ?auto_67636 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67630 ) ( not ( = ?auto_67630 ?auto_67631 ) ) ( not ( = ?auto_67630 ?auto_67632 ) ) ( not ( = ?auto_67630 ?auto_67633 ) ) ( not ( = ?auto_67631 ?auto_67632 ) ) ( not ( = ?auto_67631 ?auto_67633 ) ) ( not ( = ?auto_67632 ?auto_67633 ) ) ( not ( = ?auto_67630 ?auto_67635 ) ) ( not ( = ?auto_67630 ?auto_67634 ) ) ( not ( = ?auto_67631 ?auto_67635 ) ) ( not ( = ?auto_67631 ?auto_67634 ) ) ( not ( = ?auto_67632 ?auto_67635 ) ) ( not ( = ?auto_67632 ?auto_67634 ) ) ( not ( = ?auto_67633 ?auto_67635 ) ) ( not ( = ?auto_67633 ?auto_67634 ) ) ( not ( = ?auto_67635 ?auto_67634 ) ) ( ON ?auto_67634 ?auto_67636 ) ( not ( = ?auto_67630 ?auto_67636 ) ) ( not ( = ?auto_67631 ?auto_67636 ) ) ( not ( = ?auto_67632 ?auto_67636 ) ) ( not ( = ?auto_67633 ?auto_67636 ) ) ( not ( = ?auto_67635 ?auto_67636 ) ) ( not ( = ?auto_67634 ?auto_67636 ) ) ( ON ?auto_67635 ?auto_67634 ) ( ON-TABLE ?auto_67636 ) ( ON ?auto_67633 ?auto_67635 ) ( ON ?auto_67632 ?auto_67633 ) ( CLEAR ?auto_67632 ) ( HOLDING ?auto_67631 ) ( CLEAR ?auto_67630 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67630 ?auto_67631 )
      ( MAKE-3PILE ?auto_67630 ?auto_67631 ?auto_67632 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67637 - BLOCK
      ?auto_67638 - BLOCK
      ?auto_67639 - BLOCK
    )
    :vars
    (
      ?auto_67643 - BLOCK
      ?auto_67642 - BLOCK
      ?auto_67640 - BLOCK
      ?auto_67641 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67637 ) ( not ( = ?auto_67637 ?auto_67638 ) ) ( not ( = ?auto_67637 ?auto_67639 ) ) ( not ( = ?auto_67637 ?auto_67643 ) ) ( not ( = ?auto_67638 ?auto_67639 ) ) ( not ( = ?auto_67638 ?auto_67643 ) ) ( not ( = ?auto_67639 ?auto_67643 ) ) ( not ( = ?auto_67637 ?auto_67642 ) ) ( not ( = ?auto_67637 ?auto_67640 ) ) ( not ( = ?auto_67638 ?auto_67642 ) ) ( not ( = ?auto_67638 ?auto_67640 ) ) ( not ( = ?auto_67639 ?auto_67642 ) ) ( not ( = ?auto_67639 ?auto_67640 ) ) ( not ( = ?auto_67643 ?auto_67642 ) ) ( not ( = ?auto_67643 ?auto_67640 ) ) ( not ( = ?auto_67642 ?auto_67640 ) ) ( ON ?auto_67640 ?auto_67641 ) ( not ( = ?auto_67637 ?auto_67641 ) ) ( not ( = ?auto_67638 ?auto_67641 ) ) ( not ( = ?auto_67639 ?auto_67641 ) ) ( not ( = ?auto_67643 ?auto_67641 ) ) ( not ( = ?auto_67642 ?auto_67641 ) ) ( not ( = ?auto_67640 ?auto_67641 ) ) ( ON ?auto_67642 ?auto_67640 ) ( ON-TABLE ?auto_67641 ) ( ON ?auto_67643 ?auto_67642 ) ( ON ?auto_67639 ?auto_67643 ) ( CLEAR ?auto_67637 ) ( ON ?auto_67638 ?auto_67639 ) ( CLEAR ?auto_67638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67641 ?auto_67640 ?auto_67642 ?auto_67643 ?auto_67639 )
      ( MAKE-3PILE ?auto_67637 ?auto_67638 ?auto_67639 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67644 - BLOCK
      ?auto_67645 - BLOCK
      ?auto_67646 - BLOCK
    )
    :vars
    (
      ?auto_67648 - BLOCK
      ?auto_67650 - BLOCK
      ?auto_67649 - BLOCK
      ?auto_67647 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67644 ?auto_67645 ) ) ( not ( = ?auto_67644 ?auto_67646 ) ) ( not ( = ?auto_67644 ?auto_67648 ) ) ( not ( = ?auto_67645 ?auto_67646 ) ) ( not ( = ?auto_67645 ?auto_67648 ) ) ( not ( = ?auto_67646 ?auto_67648 ) ) ( not ( = ?auto_67644 ?auto_67650 ) ) ( not ( = ?auto_67644 ?auto_67649 ) ) ( not ( = ?auto_67645 ?auto_67650 ) ) ( not ( = ?auto_67645 ?auto_67649 ) ) ( not ( = ?auto_67646 ?auto_67650 ) ) ( not ( = ?auto_67646 ?auto_67649 ) ) ( not ( = ?auto_67648 ?auto_67650 ) ) ( not ( = ?auto_67648 ?auto_67649 ) ) ( not ( = ?auto_67650 ?auto_67649 ) ) ( ON ?auto_67649 ?auto_67647 ) ( not ( = ?auto_67644 ?auto_67647 ) ) ( not ( = ?auto_67645 ?auto_67647 ) ) ( not ( = ?auto_67646 ?auto_67647 ) ) ( not ( = ?auto_67648 ?auto_67647 ) ) ( not ( = ?auto_67650 ?auto_67647 ) ) ( not ( = ?auto_67649 ?auto_67647 ) ) ( ON ?auto_67650 ?auto_67649 ) ( ON-TABLE ?auto_67647 ) ( ON ?auto_67648 ?auto_67650 ) ( ON ?auto_67646 ?auto_67648 ) ( ON ?auto_67645 ?auto_67646 ) ( CLEAR ?auto_67645 ) ( HOLDING ?auto_67644 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_67644 )
      ( MAKE-3PILE ?auto_67644 ?auto_67645 ?auto_67646 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67651 - BLOCK
      ?auto_67652 - BLOCK
      ?auto_67653 - BLOCK
    )
    :vars
    (
      ?auto_67655 - BLOCK
      ?auto_67656 - BLOCK
      ?auto_67657 - BLOCK
      ?auto_67654 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67651 ?auto_67652 ) ) ( not ( = ?auto_67651 ?auto_67653 ) ) ( not ( = ?auto_67651 ?auto_67655 ) ) ( not ( = ?auto_67652 ?auto_67653 ) ) ( not ( = ?auto_67652 ?auto_67655 ) ) ( not ( = ?auto_67653 ?auto_67655 ) ) ( not ( = ?auto_67651 ?auto_67656 ) ) ( not ( = ?auto_67651 ?auto_67657 ) ) ( not ( = ?auto_67652 ?auto_67656 ) ) ( not ( = ?auto_67652 ?auto_67657 ) ) ( not ( = ?auto_67653 ?auto_67656 ) ) ( not ( = ?auto_67653 ?auto_67657 ) ) ( not ( = ?auto_67655 ?auto_67656 ) ) ( not ( = ?auto_67655 ?auto_67657 ) ) ( not ( = ?auto_67656 ?auto_67657 ) ) ( ON ?auto_67657 ?auto_67654 ) ( not ( = ?auto_67651 ?auto_67654 ) ) ( not ( = ?auto_67652 ?auto_67654 ) ) ( not ( = ?auto_67653 ?auto_67654 ) ) ( not ( = ?auto_67655 ?auto_67654 ) ) ( not ( = ?auto_67656 ?auto_67654 ) ) ( not ( = ?auto_67657 ?auto_67654 ) ) ( ON ?auto_67656 ?auto_67657 ) ( ON-TABLE ?auto_67654 ) ( ON ?auto_67655 ?auto_67656 ) ( ON ?auto_67653 ?auto_67655 ) ( ON ?auto_67652 ?auto_67653 ) ( ON ?auto_67651 ?auto_67652 ) ( CLEAR ?auto_67651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_67654 ?auto_67657 ?auto_67656 ?auto_67655 ?auto_67653 ?auto_67652 )
      ( MAKE-3PILE ?auto_67651 ?auto_67652 ?auto_67653 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67661 - BLOCK
      ?auto_67662 - BLOCK
      ?auto_67663 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_67663 ) ( CLEAR ?auto_67662 ) ( ON-TABLE ?auto_67661 ) ( ON ?auto_67662 ?auto_67661 ) ( not ( = ?auto_67661 ?auto_67662 ) ) ( not ( = ?auto_67661 ?auto_67663 ) ) ( not ( = ?auto_67662 ?auto_67663 ) ) )
    :subtasks
    ( ( !STACK ?auto_67663 ?auto_67662 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67664 - BLOCK
      ?auto_67665 - BLOCK
      ?auto_67666 - BLOCK
    )
    :vars
    (
      ?auto_67667 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_67665 ) ( ON-TABLE ?auto_67664 ) ( ON ?auto_67665 ?auto_67664 ) ( not ( = ?auto_67664 ?auto_67665 ) ) ( not ( = ?auto_67664 ?auto_67666 ) ) ( not ( = ?auto_67665 ?auto_67666 ) ) ( ON ?auto_67666 ?auto_67667 ) ( CLEAR ?auto_67666 ) ( HAND-EMPTY ) ( not ( = ?auto_67664 ?auto_67667 ) ) ( not ( = ?auto_67665 ?auto_67667 ) ) ( not ( = ?auto_67666 ?auto_67667 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_67666 ?auto_67667 )
      ( MAKE-3PILE ?auto_67664 ?auto_67665 ?auto_67666 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67668 - BLOCK
      ?auto_67669 - BLOCK
      ?auto_67670 - BLOCK
    )
    :vars
    (
      ?auto_67671 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67668 ) ( not ( = ?auto_67668 ?auto_67669 ) ) ( not ( = ?auto_67668 ?auto_67670 ) ) ( not ( = ?auto_67669 ?auto_67670 ) ) ( ON ?auto_67670 ?auto_67671 ) ( CLEAR ?auto_67670 ) ( not ( = ?auto_67668 ?auto_67671 ) ) ( not ( = ?auto_67669 ?auto_67671 ) ) ( not ( = ?auto_67670 ?auto_67671 ) ) ( HOLDING ?auto_67669 ) ( CLEAR ?auto_67668 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67668 ?auto_67669 )
      ( MAKE-3PILE ?auto_67668 ?auto_67669 ?auto_67670 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67672 - BLOCK
      ?auto_67673 - BLOCK
      ?auto_67674 - BLOCK
    )
    :vars
    (
      ?auto_67675 - BLOCK
      ?auto_67676 - BLOCK
      ?auto_67677 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67672 ) ( not ( = ?auto_67672 ?auto_67673 ) ) ( not ( = ?auto_67672 ?auto_67674 ) ) ( not ( = ?auto_67673 ?auto_67674 ) ) ( ON ?auto_67674 ?auto_67675 ) ( not ( = ?auto_67672 ?auto_67675 ) ) ( not ( = ?auto_67673 ?auto_67675 ) ) ( not ( = ?auto_67674 ?auto_67675 ) ) ( CLEAR ?auto_67672 ) ( ON ?auto_67673 ?auto_67674 ) ( CLEAR ?auto_67673 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_67676 ) ( ON ?auto_67677 ?auto_67676 ) ( ON ?auto_67675 ?auto_67677 ) ( not ( = ?auto_67676 ?auto_67677 ) ) ( not ( = ?auto_67676 ?auto_67675 ) ) ( not ( = ?auto_67676 ?auto_67674 ) ) ( not ( = ?auto_67676 ?auto_67673 ) ) ( not ( = ?auto_67677 ?auto_67675 ) ) ( not ( = ?auto_67677 ?auto_67674 ) ) ( not ( = ?auto_67677 ?auto_67673 ) ) ( not ( = ?auto_67672 ?auto_67676 ) ) ( not ( = ?auto_67672 ?auto_67677 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_67676 ?auto_67677 ?auto_67675 ?auto_67674 )
      ( MAKE-3PILE ?auto_67672 ?auto_67673 ?auto_67674 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67678 - BLOCK
      ?auto_67679 - BLOCK
      ?auto_67680 - BLOCK
    )
    :vars
    (
      ?auto_67682 - BLOCK
      ?auto_67683 - BLOCK
      ?auto_67681 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67678 ?auto_67679 ) ) ( not ( = ?auto_67678 ?auto_67680 ) ) ( not ( = ?auto_67679 ?auto_67680 ) ) ( ON ?auto_67680 ?auto_67682 ) ( not ( = ?auto_67678 ?auto_67682 ) ) ( not ( = ?auto_67679 ?auto_67682 ) ) ( not ( = ?auto_67680 ?auto_67682 ) ) ( ON ?auto_67679 ?auto_67680 ) ( CLEAR ?auto_67679 ) ( ON-TABLE ?auto_67683 ) ( ON ?auto_67681 ?auto_67683 ) ( ON ?auto_67682 ?auto_67681 ) ( not ( = ?auto_67683 ?auto_67681 ) ) ( not ( = ?auto_67683 ?auto_67682 ) ) ( not ( = ?auto_67683 ?auto_67680 ) ) ( not ( = ?auto_67683 ?auto_67679 ) ) ( not ( = ?auto_67681 ?auto_67682 ) ) ( not ( = ?auto_67681 ?auto_67680 ) ) ( not ( = ?auto_67681 ?auto_67679 ) ) ( not ( = ?auto_67678 ?auto_67683 ) ) ( not ( = ?auto_67678 ?auto_67681 ) ) ( HOLDING ?auto_67678 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_67678 )
      ( MAKE-3PILE ?auto_67678 ?auto_67679 ?auto_67680 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67684 - BLOCK
      ?auto_67685 - BLOCK
      ?auto_67686 - BLOCK
    )
    :vars
    (
      ?auto_67689 - BLOCK
      ?auto_67687 - BLOCK
      ?auto_67688 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67684 ?auto_67685 ) ) ( not ( = ?auto_67684 ?auto_67686 ) ) ( not ( = ?auto_67685 ?auto_67686 ) ) ( ON ?auto_67686 ?auto_67689 ) ( not ( = ?auto_67684 ?auto_67689 ) ) ( not ( = ?auto_67685 ?auto_67689 ) ) ( not ( = ?auto_67686 ?auto_67689 ) ) ( ON ?auto_67685 ?auto_67686 ) ( ON-TABLE ?auto_67687 ) ( ON ?auto_67688 ?auto_67687 ) ( ON ?auto_67689 ?auto_67688 ) ( not ( = ?auto_67687 ?auto_67688 ) ) ( not ( = ?auto_67687 ?auto_67689 ) ) ( not ( = ?auto_67687 ?auto_67686 ) ) ( not ( = ?auto_67687 ?auto_67685 ) ) ( not ( = ?auto_67688 ?auto_67689 ) ) ( not ( = ?auto_67688 ?auto_67686 ) ) ( not ( = ?auto_67688 ?auto_67685 ) ) ( not ( = ?auto_67684 ?auto_67687 ) ) ( not ( = ?auto_67684 ?auto_67688 ) ) ( ON ?auto_67684 ?auto_67685 ) ( CLEAR ?auto_67684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67687 ?auto_67688 ?auto_67689 ?auto_67686 ?auto_67685 )
      ( MAKE-3PILE ?auto_67684 ?auto_67685 ?auto_67686 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67690 - BLOCK
      ?auto_67691 - BLOCK
      ?auto_67692 - BLOCK
    )
    :vars
    (
      ?auto_67693 - BLOCK
      ?auto_67695 - BLOCK
      ?auto_67694 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67690 ?auto_67691 ) ) ( not ( = ?auto_67690 ?auto_67692 ) ) ( not ( = ?auto_67691 ?auto_67692 ) ) ( ON ?auto_67692 ?auto_67693 ) ( not ( = ?auto_67690 ?auto_67693 ) ) ( not ( = ?auto_67691 ?auto_67693 ) ) ( not ( = ?auto_67692 ?auto_67693 ) ) ( ON ?auto_67691 ?auto_67692 ) ( ON-TABLE ?auto_67695 ) ( ON ?auto_67694 ?auto_67695 ) ( ON ?auto_67693 ?auto_67694 ) ( not ( = ?auto_67695 ?auto_67694 ) ) ( not ( = ?auto_67695 ?auto_67693 ) ) ( not ( = ?auto_67695 ?auto_67692 ) ) ( not ( = ?auto_67695 ?auto_67691 ) ) ( not ( = ?auto_67694 ?auto_67693 ) ) ( not ( = ?auto_67694 ?auto_67692 ) ) ( not ( = ?auto_67694 ?auto_67691 ) ) ( not ( = ?auto_67690 ?auto_67695 ) ) ( not ( = ?auto_67690 ?auto_67694 ) ) ( HOLDING ?auto_67690 ) ( CLEAR ?auto_67691 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_67695 ?auto_67694 ?auto_67693 ?auto_67692 ?auto_67691 ?auto_67690 )
      ( MAKE-3PILE ?auto_67690 ?auto_67691 ?auto_67692 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67696 - BLOCK
      ?auto_67697 - BLOCK
      ?auto_67698 - BLOCK
    )
    :vars
    (
      ?auto_67699 - BLOCK
      ?auto_67701 - BLOCK
      ?auto_67700 - BLOCK
      ?auto_67702 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67696 ?auto_67697 ) ) ( not ( = ?auto_67696 ?auto_67698 ) ) ( not ( = ?auto_67697 ?auto_67698 ) ) ( ON ?auto_67698 ?auto_67699 ) ( not ( = ?auto_67696 ?auto_67699 ) ) ( not ( = ?auto_67697 ?auto_67699 ) ) ( not ( = ?auto_67698 ?auto_67699 ) ) ( ON ?auto_67697 ?auto_67698 ) ( ON-TABLE ?auto_67701 ) ( ON ?auto_67700 ?auto_67701 ) ( ON ?auto_67699 ?auto_67700 ) ( not ( = ?auto_67701 ?auto_67700 ) ) ( not ( = ?auto_67701 ?auto_67699 ) ) ( not ( = ?auto_67701 ?auto_67698 ) ) ( not ( = ?auto_67701 ?auto_67697 ) ) ( not ( = ?auto_67700 ?auto_67699 ) ) ( not ( = ?auto_67700 ?auto_67698 ) ) ( not ( = ?auto_67700 ?auto_67697 ) ) ( not ( = ?auto_67696 ?auto_67701 ) ) ( not ( = ?auto_67696 ?auto_67700 ) ) ( CLEAR ?auto_67697 ) ( ON ?auto_67696 ?auto_67702 ) ( CLEAR ?auto_67696 ) ( HAND-EMPTY ) ( not ( = ?auto_67696 ?auto_67702 ) ) ( not ( = ?auto_67697 ?auto_67702 ) ) ( not ( = ?auto_67698 ?auto_67702 ) ) ( not ( = ?auto_67699 ?auto_67702 ) ) ( not ( = ?auto_67701 ?auto_67702 ) ) ( not ( = ?auto_67700 ?auto_67702 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_67696 ?auto_67702 )
      ( MAKE-3PILE ?auto_67696 ?auto_67697 ?auto_67698 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67703 - BLOCK
      ?auto_67704 - BLOCK
      ?auto_67705 - BLOCK
    )
    :vars
    (
      ?auto_67709 - BLOCK
      ?auto_67708 - BLOCK
      ?auto_67707 - BLOCK
      ?auto_67706 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67703 ?auto_67704 ) ) ( not ( = ?auto_67703 ?auto_67705 ) ) ( not ( = ?auto_67704 ?auto_67705 ) ) ( ON ?auto_67705 ?auto_67709 ) ( not ( = ?auto_67703 ?auto_67709 ) ) ( not ( = ?auto_67704 ?auto_67709 ) ) ( not ( = ?auto_67705 ?auto_67709 ) ) ( ON-TABLE ?auto_67708 ) ( ON ?auto_67707 ?auto_67708 ) ( ON ?auto_67709 ?auto_67707 ) ( not ( = ?auto_67708 ?auto_67707 ) ) ( not ( = ?auto_67708 ?auto_67709 ) ) ( not ( = ?auto_67708 ?auto_67705 ) ) ( not ( = ?auto_67708 ?auto_67704 ) ) ( not ( = ?auto_67707 ?auto_67709 ) ) ( not ( = ?auto_67707 ?auto_67705 ) ) ( not ( = ?auto_67707 ?auto_67704 ) ) ( not ( = ?auto_67703 ?auto_67708 ) ) ( not ( = ?auto_67703 ?auto_67707 ) ) ( ON ?auto_67703 ?auto_67706 ) ( CLEAR ?auto_67703 ) ( not ( = ?auto_67703 ?auto_67706 ) ) ( not ( = ?auto_67704 ?auto_67706 ) ) ( not ( = ?auto_67705 ?auto_67706 ) ) ( not ( = ?auto_67709 ?auto_67706 ) ) ( not ( = ?auto_67708 ?auto_67706 ) ) ( not ( = ?auto_67707 ?auto_67706 ) ) ( HOLDING ?auto_67704 ) ( CLEAR ?auto_67705 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67708 ?auto_67707 ?auto_67709 ?auto_67705 ?auto_67704 )
      ( MAKE-3PILE ?auto_67703 ?auto_67704 ?auto_67705 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67710 - BLOCK
      ?auto_67711 - BLOCK
      ?auto_67712 - BLOCK
    )
    :vars
    (
      ?auto_67714 - BLOCK
      ?auto_67716 - BLOCK
      ?auto_67713 - BLOCK
      ?auto_67715 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67710 ?auto_67711 ) ) ( not ( = ?auto_67710 ?auto_67712 ) ) ( not ( = ?auto_67711 ?auto_67712 ) ) ( ON ?auto_67712 ?auto_67714 ) ( not ( = ?auto_67710 ?auto_67714 ) ) ( not ( = ?auto_67711 ?auto_67714 ) ) ( not ( = ?auto_67712 ?auto_67714 ) ) ( ON-TABLE ?auto_67716 ) ( ON ?auto_67713 ?auto_67716 ) ( ON ?auto_67714 ?auto_67713 ) ( not ( = ?auto_67716 ?auto_67713 ) ) ( not ( = ?auto_67716 ?auto_67714 ) ) ( not ( = ?auto_67716 ?auto_67712 ) ) ( not ( = ?auto_67716 ?auto_67711 ) ) ( not ( = ?auto_67713 ?auto_67714 ) ) ( not ( = ?auto_67713 ?auto_67712 ) ) ( not ( = ?auto_67713 ?auto_67711 ) ) ( not ( = ?auto_67710 ?auto_67716 ) ) ( not ( = ?auto_67710 ?auto_67713 ) ) ( ON ?auto_67710 ?auto_67715 ) ( not ( = ?auto_67710 ?auto_67715 ) ) ( not ( = ?auto_67711 ?auto_67715 ) ) ( not ( = ?auto_67712 ?auto_67715 ) ) ( not ( = ?auto_67714 ?auto_67715 ) ) ( not ( = ?auto_67716 ?auto_67715 ) ) ( not ( = ?auto_67713 ?auto_67715 ) ) ( CLEAR ?auto_67712 ) ( ON ?auto_67711 ?auto_67710 ) ( CLEAR ?auto_67711 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_67715 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67715 ?auto_67710 )
      ( MAKE-3PILE ?auto_67710 ?auto_67711 ?auto_67712 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67717 - BLOCK
      ?auto_67718 - BLOCK
      ?auto_67719 - BLOCK
    )
    :vars
    (
      ?auto_67723 - BLOCK
      ?auto_67722 - BLOCK
      ?auto_67720 - BLOCK
      ?auto_67721 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67717 ?auto_67718 ) ) ( not ( = ?auto_67717 ?auto_67719 ) ) ( not ( = ?auto_67718 ?auto_67719 ) ) ( not ( = ?auto_67717 ?auto_67723 ) ) ( not ( = ?auto_67718 ?auto_67723 ) ) ( not ( = ?auto_67719 ?auto_67723 ) ) ( ON-TABLE ?auto_67722 ) ( ON ?auto_67720 ?auto_67722 ) ( ON ?auto_67723 ?auto_67720 ) ( not ( = ?auto_67722 ?auto_67720 ) ) ( not ( = ?auto_67722 ?auto_67723 ) ) ( not ( = ?auto_67722 ?auto_67719 ) ) ( not ( = ?auto_67722 ?auto_67718 ) ) ( not ( = ?auto_67720 ?auto_67723 ) ) ( not ( = ?auto_67720 ?auto_67719 ) ) ( not ( = ?auto_67720 ?auto_67718 ) ) ( not ( = ?auto_67717 ?auto_67722 ) ) ( not ( = ?auto_67717 ?auto_67720 ) ) ( ON ?auto_67717 ?auto_67721 ) ( not ( = ?auto_67717 ?auto_67721 ) ) ( not ( = ?auto_67718 ?auto_67721 ) ) ( not ( = ?auto_67719 ?auto_67721 ) ) ( not ( = ?auto_67723 ?auto_67721 ) ) ( not ( = ?auto_67722 ?auto_67721 ) ) ( not ( = ?auto_67720 ?auto_67721 ) ) ( ON ?auto_67718 ?auto_67717 ) ( CLEAR ?auto_67718 ) ( ON-TABLE ?auto_67721 ) ( HOLDING ?auto_67719 ) ( CLEAR ?auto_67723 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_67722 ?auto_67720 ?auto_67723 ?auto_67719 )
      ( MAKE-3PILE ?auto_67717 ?auto_67718 ?auto_67719 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67724 - BLOCK
      ?auto_67725 - BLOCK
      ?auto_67726 - BLOCK
    )
    :vars
    (
      ?auto_67728 - BLOCK
      ?auto_67729 - BLOCK
      ?auto_67727 - BLOCK
      ?auto_67730 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67724 ?auto_67725 ) ) ( not ( = ?auto_67724 ?auto_67726 ) ) ( not ( = ?auto_67725 ?auto_67726 ) ) ( not ( = ?auto_67724 ?auto_67728 ) ) ( not ( = ?auto_67725 ?auto_67728 ) ) ( not ( = ?auto_67726 ?auto_67728 ) ) ( ON-TABLE ?auto_67729 ) ( ON ?auto_67727 ?auto_67729 ) ( ON ?auto_67728 ?auto_67727 ) ( not ( = ?auto_67729 ?auto_67727 ) ) ( not ( = ?auto_67729 ?auto_67728 ) ) ( not ( = ?auto_67729 ?auto_67726 ) ) ( not ( = ?auto_67729 ?auto_67725 ) ) ( not ( = ?auto_67727 ?auto_67728 ) ) ( not ( = ?auto_67727 ?auto_67726 ) ) ( not ( = ?auto_67727 ?auto_67725 ) ) ( not ( = ?auto_67724 ?auto_67729 ) ) ( not ( = ?auto_67724 ?auto_67727 ) ) ( ON ?auto_67724 ?auto_67730 ) ( not ( = ?auto_67724 ?auto_67730 ) ) ( not ( = ?auto_67725 ?auto_67730 ) ) ( not ( = ?auto_67726 ?auto_67730 ) ) ( not ( = ?auto_67728 ?auto_67730 ) ) ( not ( = ?auto_67729 ?auto_67730 ) ) ( not ( = ?auto_67727 ?auto_67730 ) ) ( ON ?auto_67725 ?auto_67724 ) ( ON-TABLE ?auto_67730 ) ( CLEAR ?auto_67728 ) ( ON ?auto_67726 ?auto_67725 ) ( CLEAR ?auto_67726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_67730 ?auto_67724 ?auto_67725 )
      ( MAKE-3PILE ?auto_67724 ?auto_67725 ?auto_67726 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67731 - BLOCK
      ?auto_67732 - BLOCK
      ?auto_67733 - BLOCK
    )
    :vars
    (
      ?auto_67734 - BLOCK
      ?auto_67736 - BLOCK
      ?auto_67737 - BLOCK
      ?auto_67735 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67731 ?auto_67732 ) ) ( not ( = ?auto_67731 ?auto_67733 ) ) ( not ( = ?auto_67732 ?auto_67733 ) ) ( not ( = ?auto_67731 ?auto_67734 ) ) ( not ( = ?auto_67732 ?auto_67734 ) ) ( not ( = ?auto_67733 ?auto_67734 ) ) ( ON-TABLE ?auto_67736 ) ( ON ?auto_67737 ?auto_67736 ) ( not ( = ?auto_67736 ?auto_67737 ) ) ( not ( = ?auto_67736 ?auto_67734 ) ) ( not ( = ?auto_67736 ?auto_67733 ) ) ( not ( = ?auto_67736 ?auto_67732 ) ) ( not ( = ?auto_67737 ?auto_67734 ) ) ( not ( = ?auto_67737 ?auto_67733 ) ) ( not ( = ?auto_67737 ?auto_67732 ) ) ( not ( = ?auto_67731 ?auto_67736 ) ) ( not ( = ?auto_67731 ?auto_67737 ) ) ( ON ?auto_67731 ?auto_67735 ) ( not ( = ?auto_67731 ?auto_67735 ) ) ( not ( = ?auto_67732 ?auto_67735 ) ) ( not ( = ?auto_67733 ?auto_67735 ) ) ( not ( = ?auto_67734 ?auto_67735 ) ) ( not ( = ?auto_67736 ?auto_67735 ) ) ( not ( = ?auto_67737 ?auto_67735 ) ) ( ON ?auto_67732 ?auto_67731 ) ( ON-TABLE ?auto_67735 ) ( ON ?auto_67733 ?auto_67732 ) ( CLEAR ?auto_67733 ) ( HOLDING ?auto_67734 ) ( CLEAR ?auto_67737 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_67736 ?auto_67737 ?auto_67734 )
      ( MAKE-3PILE ?auto_67731 ?auto_67732 ?auto_67733 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67738 - BLOCK
      ?auto_67739 - BLOCK
      ?auto_67740 - BLOCK
    )
    :vars
    (
      ?auto_67743 - BLOCK
      ?auto_67744 - BLOCK
      ?auto_67741 - BLOCK
      ?auto_67742 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67738 ?auto_67739 ) ) ( not ( = ?auto_67738 ?auto_67740 ) ) ( not ( = ?auto_67739 ?auto_67740 ) ) ( not ( = ?auto_67738 ?auto_67743 ) ) ( not ( = ?auto_67739 ?auto_67743 ) ) ( not ( = ?auto_67740 ?auto_67743 ) ) ( ON-TABLE ?auto_67744 ) ( ON ?auto_67741 ?auto_67744 ) ( not ( = ?auto_67744 ?auto_67741 ) ) ( not ( = ?auto_67744 ?auto_67743 ) ) ( not ( = ?auto_67744 ?auto_67740 ) ) ( not ( = ?auto_67744 ?auto_67739 ) ) ( not ( = ?auto_67741 ?auto_67743 ) ) ( not ( = ?auto_67741 ?auto_67740 ) ) ( not ( = ?auto_67741 ?auto_67739 ) ) ( not ( = ?auto_67738 ?auto_67744 ) ) ( not ( = ?auto_67738 ?auto_67741 ) ) ( ON ?auto_67738 ?auto_67742 ) ( not ( = ?auto_67738 ?auto_67742 ) ) ( not ( = ?auto_67739 ?auto_67742 ) ) ( not ( = ?auto_67740 ?auto_67742 ) ) ( not ( = ?auto_67743 ?auto_67742 ) ) ( not ( = ?auto_67744 ?auto_67742 ) ) ( not ( = ?auto_67741 ?auto_67742 ) ) ( ON ?auto_67739 ?auto_67738 ) ( ON-TABLE ?auto_67742 ) ( ON ?auto_67740 ?auto_67739 ) ( CLEAR ?auto_67741 ) ( ON ?auto_67743 ?auto_67740 ) ( CLEAR ?auto_67743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_67742 ?auto_67738 ?auto_67739 ?auto_67740 )
      ( MAKE-3PILE ?auto_67738 ?auto_67739 ?auto_67740 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67745 - BLOCK
      ?auto_67746 - BLOCK
      ?auto_67747 - BLOCK
    )
    :vars
    (
      ?auto_67748 - BLOCK
      ?auto_67750 - BLOCK
      ?auto_67751 - BLOCK
      ?auto_67749 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67745 ?auto_67746 ) ) ( not ( = ?auto_67745 ?auto_67747 ) ) ( not ( = ?auto_67746 ?auto_67747 ) ) ( not ( = ?auto_67745 ?auto_67748 ) ) ( not ( = ?auto_67746 ?auto_67748 ) ) ( not ( = ?auto_67747 ?auto_67748 ) ) ( ON-TABLE ?auto_67750 ) ( not ( = ?auto_67750 ?auto_67751 ) ) ( not ( = ?auto_67750 ?auto_67748 ) ) ( not ( = ?auto_67750 ?auto_67747 ) ) ( not ( = ?auto_67750 ?auto_67746 ) ) ( not ( = ?auto_67751 ?auto_67748 ) ) ( not ( = ?auto_67751 ?auto_67747 ) ) ( not ( = ?auto_67751 ?auto_67746 ) ) ( not ( = ?auto_67745 ?auto_67750 ) ) ( not ( = ?auto_67745 ?auto_67751 ) ) ( ON ?auto_67745 ?auto_67749 ) ( not ( = ?auto_67745 ?auto_67749 ) ) ( not ( = ?auto_67746 ?auto_67749 ) ) ( not ( = ?auto_67747 ?auto_67749 ) ) ( not ( = ?auto_67748 ?auto_67749 ) ) ( not ( = ?auto_67750 ?auto_67749 ) ) ( not ( = ?auto_67751 ?auto_67749 ) ) ( ON ?auto_67746 ?auto_67745 ) ( ON-TABLE ?auto_67749 ) ( ON ?auto_67747 ?auto_67746 ) ( ON ?auto_67748 ?auto_67747 ) ( CLEAR ?auto_67748 ) ( HOLDING ?auto_67751 ) ( CLEAR ?auto_67750 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67750 ?auto_67751 )
      ( MAKE-3PILE ?auto_67745 ?auto_67746 ?auto_67747 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67752 - BLOCK
      ?auto_67753 - BLOCK
      ?auto_67754 - BLOCK
    )
    :vars
    (
      ?auto_67757 - BLOCK
      ?auto_67756 - BLOCK
      ?auto_67755 - BLOCK
      ?auto_67758 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67752 ?auto_67753 ) ) ( not ( = ?auto_67752 ?auto_67754 ) ) ( not ( = ?auto_67753 ?auto_67754 ) ) ( not ( = ?auto_67752 ?auto_67757 ) ) ( not ( = ?auto_67753 ?auto_67757 ) ) ( not ( = ?auto_67754 ?auto_67757 ) ) ( ON-TABLE ?auto_67756 ) ( not ( = ?auto_67756 ?auto_67755 ) ) ( not ( = ?auto_67756 ?auto_67757 ) ) ( not ( = ?auto_67756 ?auto_67754 ) ) ( not ( = ?auto_67756 ?auto_67753 ) ) ( not ( = ?auto_67755 ?auto_67757 ) ) ( not ( = ?auto_67755 ?auto_67754 ) ) ( not ( = ?auto_67755 ?auto_67753 ) ) ( not ( = ?auto_67752 ?auto_67756 ) ) ( not ( = ?auto_67752 ?auto_67755 ) ) ( ON ?auto_67752 ?auto_67758 ) ( not ( = ?auto_67752 ?auto_67758 ) ) ( not ( = ?auto_67753 ?auto_67758 ) ) ( not ( = ?auto_67754 ?auto_67758 ) ) ( not ( = ?auto_67757 ?auto_67758 ) ) ( not ( = ?auto_67756 ?auto_67758 ) ) ( not ( = ?auto_67755 ?auto_67758 ) ) ( ON ?auto_67753 ?auto_67752 ) ( ON-TABLE ?auto_67758 ) ( ON ?auto_67754 ?auto_67753 ) ( ON ?auto_67757 ?auto_67754 ) ( CLEAR ?auto_67756 ) ( ON ?auto_67755 ?auto_67757 ) ( CLEAR ?auto_67755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67758 ?auto_67752 ?auto_67753 ?auto_67754 ?auto_67757 )
      ( MAKE-3PILE ?auto_67752 ?auto_67753 ?auto_67754 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67759 - BLOCK
      ?auto_67760 - BLOCK
      ?auto_67761 - BLOCK
    )
    :vars
    (
      ?auto_67764 - BLOCK
      ?auto_67763 - BLOCK
      ?auto_67765 - BLOCK
      ?auto_67762 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67759 ?auto_67760 ) ) ( not ( = ?auto_67759 ?auto_67761 ) ) ( not ( = ?auto_67760 ?auto_67761 ) ) ( not ( = ?auto_67759 ?auto_67764 ) ) ( not ( = ?auto_67760 ?auto_67764 ) ) ( not ( = ?auto_67761 ?auto_67764 ) ) ( not ( = ?auto_67763 ?auto_67765 ) ) ( not ( = ?auto_67763 ?auto_67764 ) ) ( not ( = ?auto_67763 ?auto_67761 ) ) ( not ( = ?auto_67763 ?auto_67760 ) ) ( not ( = ?auto_67765 ?auto_67764 ) ) ( not ( = ?auto_67765 ?auto_67761 ) ) ( not ( = ?auto_67765 ?auto_67760 ) ) ( not ( = ?auto_67759 ?auto_67763 ) ) ( not ( = ?auto_67759 ?auto_67765 ) ) ( ON ?auto_67759 ?auto_67762 ) ( not ( = ?auto_67759 ?auto_67762 ) ) ( not ( = ?auto_67760 ?auto_67762 ) ) ( not ( = ?auto_67761 ?auto_67762 ) ) ( not ( = ?auto_67764 ?auto_67762 ) ) ( not ( = ?auto_67763 ?auto_67762 ) ) ( not ( = ?auto_67765 ?auto_67762 ) ) ( ON ?auto_67760 ?auto_67759 ) ( ON-TABLE ?auto_67762 ) ( ON ?auto_67761 ?auto_67760 ) ( ON ?auto_67764 ?auto_67761 ) ( ON ?auto_67765 ?auto_67764 ) ( CLEAR ?auto_67765 ) ( HOLDING ?auto_67763 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_67763 )
      ( MAKE-3PILE ?auto_67759 ?auto_67760 ?auto_67761 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_67766 - BLOCK
      ?auto_67767 - BLOCK
      ?auto_67768 - BLOCK
    )
    :vars
    (
      ?auto_67770 - BLOCK
      ?auto_67769 - BLOCK
      ?auto_67772 - BLOCK
      ?auto_67771 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67766 ?auto_67767 ) ) ( not ( = ?auto_67766 ?auto_67768 ) ) ( not ( = ?auto_67767 ?auto_67768 ) ) ( not ( = ?auto_67766 ?auto_67770 ) ) ( not ( = ?auto_67767 ?auto_67770 ) ) ( not ( = ?auto_67768 ?auto_67770 ) ) ( not ( = ?auto_67769 ?auto_67772 ) ) ( not ( = ?auto_67769 ?auto_67770 ) ) ( not ( = ?auto_67769 ?auto_67768 ) ) ( not ( = ?auto_67769 ?auto_67767 ) ) ( not ( = ?auto_67772 ?auto_67770 ) ) ( not ( = ?auto_67772 ?auto_67768 ) ) ( not ( = ?auto_67772 ?auto_67767 ) ) ( not ( = ?auto_67766 ?auto_67769 ) ) ( not ( = ?auto_67766 ?auto_67772 ) ) ( ON ?auto_67766 ?auto_67771 ) ( not ( = ?auto_67766 ?auto_67771 ) ) ( not ( = ?auto_67767 ?auto_67771 ) ) ( not ( = ?auto_67768 ?auto_67771 ) ) ( not ( = ?auto_67770 ?auto_67771 ) ) ( not ( = ?auto_67769 ?auto_67771 ) ) ( not ( = ?auto_67772 ?auto_67771 ) ) ( ON ?auto_67767 ?auto_67766 ) ( ON-TABLE ?auto_67771 ) ( ON ?auto_67768 ?auto_67767 ) ( ON ?auto_67770 ?auto_67768 ) ( ON ?auto_67772 ?auto_67770 ) ( ON ?auto_67769 ?auto_67772 ) ( CLEAR ?auto_67769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_67771 ?auto_67766 ?auto_67767 ?auto_67768 ?auto_67770 ?auto_67772 )
      ( MAKE-3PILE ?auto_67766 ?auto_67767 ?auto_67768 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67775 - BLOCK
      ?auto_67776 - BLOCK
    )
    :vars
    (
      ?auto_67777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67777 ?auto_67776 ) ( CLEAR ?auto_67777 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_67775 ) ( ON ?auto_67776 ?auto_67775 ) ( not ( = ?auto_67775 ?auto_67776 ) ) ( not ( = ?auto_67775 ?auto_67777 ) ) ( not ( = ?auto_67776 ?auto_67777 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_67777 ?auto_67776 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67778 - BLOCK
      ?auto_67779 - BLOCK
    )
    :vars
    (
      ?auto_67780 - BLOCK
      ?auto_67781 - BLOCK
      ?auto_67782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67780 ?auto_67779 ) ( CLEAR ?auto_67780 ) ( ON-TABLE ?auto_67778 ) ( ON ?auto_67779 ?auto_67778 ) ( not ( = ?auto_67778 ?auto_67779 ) ) ( not ( = ?auto_67778 ?auto_67780 ) ) ( not ( = ?auto_67779 ?auto_67780 ) ) ( HOLDING ?auto_67781 ) ( CLEAR ?auto_67782 ) ( not ( = ?auto_67778 ?auto_67781 ) ) ( not ( = ?auto_67778 ?auto_67782 ) ) ( not ( = ?auto_67779 ?auto_67781 ) ) ( not ( = ?auto_67779 ?auto_67782 ) ) ( not ( = ?auto_67780 ?auto_67781 ) ) ( not ( = ?auto_67780 ?auto_67782 ) ) ( not ( = ?auto_67781 ?auto_67782 ) ) )
    :subtasks
    ( ( !STACK ?auto_67781 ?auto_67782 )
      ( MAKE-2PILE ?auto_67778 ?auto_67779 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67783 - BLOCK
      ?auto_67784 - BLOCK
    )
    :vars
    (
      ?auto_67785 - BLOCK
      ?auto_67787 - BLOCK
      ?auto_67786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67785 ?auto_67784 ) ( ON-TABLE ?auto_67783 ) ( ON ?auto_67784 ?auto_67783 ) ( not ( = ?auto_67783 ?auto_67784 ) ) ( not ( = ?auto_67783 ?auto_67785 ) ) ( not ( = ?auto_67784 ?auto_67785 ) ) ( CLEAR ?auto_67787 ) ( not ( = ?auto_67783 ?auto_67786 ) ) ( not ( = ?auto_67783 ?auto_67787 ) ) ( not ( = ?auto_67784 ?auto_67786 ) ) ( not ( = ?auto_67784 ?auto_67787 ) ) ( not ( = ?auto_67785 ?auto_67786 ) ) ( not ( = ?auto_67785 ?auto_67787 ) ) ( not ( = ?auto_67786 ?auto_67787 ) ) ( ON ?auto_67786 ?auto_67785 ) ( CLEAR ?auto_67786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_67783 ?auto_67784 ?auto_67785 )
      ( MAKE-2PILE ?auto_67783 ?auto_67784 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67788 - BLOCK
      ?auto_67789 - BLOCK
    )
    :vars
    (
      ?auto_67792 - BLOCK
      ?auto_67791 - BLOCK
      ?auto_67790 - BLOCK
      ?auto_67793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67792 ?auto_67789 ) ( ON-TABLE ?auto_67788 ) ( ON ?auto_67789 ?auto_67788 ) ( not ( = ?auto_67788 ?auto_67789 ) ) ( not ( = ?auto_67788 ?auto_67792 ) ) ( not ( = ?auto_67789 ?auto_67792 ) ) ( not ( = ?auto_67788 ?auto_67791 ) ) ( not ( = ?auto_67788 ?auto_67790 ) ) ( not ( = ?auto_67789 ?auto_67791 ) ) ( not ( = ?auto_67789 ?auto_67790 ) ) ( not ( = ?auto_67792 ?auto_67791 ) ) ( not ( = ?auto_67792 ?auto_67790 ) ) ( not ( = ?auto_67791 ?auto_67790 ) ) ( ON ?auto_67791 ?auto_67792 ) ( CLEAR ?auto_67791 ) ( HOLDING ?auto_67790 ) ( CLEAR ?auto_67793 ) ( ON-TABLE ?auto_67793 ) ( not ( = ?auto_67793 ?auto_67790 ) ) ( not ( = ?auto_67788 ?auto_67793 ) ) ( not ( = ?auto_67789 ?auto_67793 ) ) ( not ( = ?auto_67792 ?auto_67793 ) ) ( not ( = ?auto_67791 ?auto_67793 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67793 ?auto_67790 )
      ( MAKE-2PILE ?auto_67788 ?auto_67789 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67794 - BLOCK
      ?auto_67795 - BLOCK
    )
    :vars
    (
      ?auto_67796 - BLOCK
      ?auto_67798 - BLOCK
      ?auto_67799 - BLOCK
      ?auto_67797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67796 ?auto_67795 ) ( ON-TABLE ?auto_67794 ) ( ON ?auto_67795 ?auto_67794 ) ( not ( = ?auto_67794 ?auto_67795 ) ) ( not ( = ?auto_67794 ?auto_67796 ) ) ( not ( = ?auto_67795 ?auto_67796 ) ) ( not ( = ?auto_67794 ?auto_67798 ) ) ( not ( = ?auto_67794 ?auto_67799 ) ) ( not ( = ?auto_67795 ?auto_67798 ) ) ( not ( = ?auto_67795 ?auto_67799 ) ) ( not ( = ?auto_67796 ?auto_67798 ) ) ( not ( = ?auto_67796 ?auto_67799 ) ) ( not ( = ?auto_67798 ?auto_67799 ) ) ( ON ?auto_67798 ?auto_67796 ) ( CLEAR ?auto_67797 ) ( ON-TABLE ?auto_67797 ) ( not ( = ?auto_67797 ?auto_67799 ) ) ( not ( = ?auto_67794 ?auto_67797 ) ) ( not ( = ?auto_67795 ?auto_67797 ) ) ( not ( = ?auto_67796 ?auto_67797 ) ) ( not ( = ?auto_67798 ?auto_67797 ) ) ( ON ?auto_67799 ?auto_67798 ) ( CLEAR ?auto_67799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_67794 ?auto_67795 ?auto_67796 ?auto_67798 )
      ( MAKE-2PILE ?auto_67794 ?auto_67795 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67800 - BLOCK
      ?auto_67801 - BLOCK
    )
    :vars
    (
      ?auto_67802 - BLOCK
      ?auto_67804 - BLOCK
      ?auto_67803 - BLOCK
      ?auto_67805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67802 ?auto_67801 ) ( ON-TABLE ?auto_67800 ) ( ON ?auto_67801 ?auto_67800 ) ( not ( = ?auto_67800 ?auto_67801 ) ) ( not ( = ?auto_67800 ?auto_67802 ) ) ( not ( = ?auto_67801 ?auto_67802 ) ) ( not ( = ?auto_67800 ?auto_67804 ) ) ( not ( = ?auto_67800 ?auto_67803 ) ) ( not ( = ?auto_67801 ?auto_67804 ) ) ( not ( = ?auto_67801 ?auto_67803 ) ) ( not ( = ?auto_67802 ?auto_67804 ) ) ( not ( = ?auto_67802 ?auto_67803 ) ) ( not ( = ?auto_67804 ?auto_67803 ) ) ( ON ?auto_67804 ?auto_67802 ) ( not ( = ?auto_67805 ?auto_67803 ) ) ( not ( = ?auto_67800 ?auto_67805 ) ) ( not ( = ?auto_67801 ?auto_67805 ) ) ( not ( = ?auto_67802 ?auto_67805 ) ) ( not ( = ?auto_67804 ?auto_67805 ) ) ( ON ?auto_67803 ?auto_67804 ) ( CLEAR ?auto_67803 ) ( HOLDING ?auto_67805 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_67805 )
      ( MAKE-2PILE ?auto_67800 ?auto_67801 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67806 - BLOCK
      ?auto_67807 - BLOCK
    )
    :vars
    (
      ?auto_67809 - BLOCK
      ?auto_67808 - BLOCK
      ?auto_67811 - BLOCK
      ?auto_67810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67809 ?auto_67807 ) ( ON-TABLE ?auto_67806 ) ( ON ?auto_67807 ?auto_67806 ) ( not ( = ?auto_67806 ?auto_67807 ) ) ( not ( = ?auto_67806 ?auto_67809 ) ) ( not ( = ?auto_67807 ?auto_67809 ) ) ( not ( = ?auto_67806 ?auto_67808 ) ) ( not ( = ?auto_67806 ?auto_67811 ) ) ( not ( = ?auto_67807 ?auto_67808 ) ) ( not ( = ?auto_67807 ?auto_67811 ) ) ( not ( = ?auto_67809 ?auto_67808 ) ) ( not ( = ?auto_67809 ?auto_67811 ) ) ( not ( = ?auto_67808 ?auto_67811 ) ) ( ON ?auto_67808 ?auto_67809 ) ( not ( = ?auto_67810 ?auto_67811 ) ) ( not ( = ?auto_67806 ?auto_67810 ) ) ( not ( = ?auto_67807 ?auto_67810 ) ) ( not ( = ?auto_67809 ?auto_67810 ) ) ( not ( = ?auto_67808 ?auto_67810 ) ) ( ON ?auto_67811 ?auto_67808 ) ( ON ?auto_67810 ?auto_67811 ) ( CLEAR ?auto_67810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67806 ?auto_67807 ?auto_67809 ?auto_67808 ?auto_67811 )
      ( MAKE-2PILE ?auto_67806 ?auto_67807 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67812 - BLOCK
      ?auto_67813 - BLOCK
    )
    :vars
    (
      ?auto_67817 - BLOCK
      ?auto_67816 - BLOCK
      ?auto_67815 - BLOCK
      ?auto_67814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67817 ?auto_67813 ) ( ON-TABLE ?auto_67812 ) ( ON ?auto_67813 ?auto_67812 ) ( not ( = ?auto_67812 ?auto_67813 ) ) ( not ( = ?auto_67812 ?auto_67817 ) ) ( not ( = ?auto_67813 ?auto_67817 ) ) ( not ( = ?auto_67812 ?auto_67816 ) ) ( not ( = ?auto_67812 ?auto_67815 ) ) ( not ( = ?auto_67813 ?auto_67816 ) ) ( not ( = ?auto_67813 ?auto_67815 ) ) ( not ( = ?auto_67817 ?auto_67816 ) ) ( not ( = ?auto_67817 ?auto_67815 ) ) ( not ( = ?auto_67816 ?auto_67815 ) ) ( ON ?auto_67816 ?auto_67817 ) ( not ( = ?auto_67814 ?auto_67815 ) ) ( not ( = ?auto_67812 ?auto_67814 ) ) ( not ( = ?auto_67813 ?auto_67814 ) ) ( not ( = ?auto_67817 ?auto_67814 ) ) ( not ( = ?auto_67816 ?auto_67814 ) ) ( ON ?auto_67815 ?auto_67816 ) ( HOLDING ?auto_67814 ) ( CLEAR ?auto_67815 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_67812 ?auto_67813 ?auto_67817 ?auto_67816 ?auto_67815 ?auto_67814 )
      ( MAKE-2PILE ?auto_67812 ?auto_67813 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67818 - BLOCK
      ?auto_67819 - BLOCK
    )
    :vars
    (
      ?auto_67823 - BLOCK
      ?auto_67822 - BLOCK
      ?auto_67820 - BLOCK
      ?auto_67821 - BLOCK
      ?auto_67824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67823 ?auto_67819 ) ( ON-TABLE ?auto_67818 ) ( ON ?auto_67819 ?auto_67818 ) ( not ( = ?auto_67818 ?auto_67819 ) ) ( not ( = ?auto_67818 ?auto_67823 ) ) ( not ( = ?auto_67819 ?auto_67823 ) ) ( not ( = ?auto_67818 ?auto_67822 ) ) ( not ( = ?auto_67818 ?auto_67820 ) ) ( not ( = ?auto_67819 ?auto_67822 ) ) ( not ( = ?auto_67819 ?auto_67820 ) ) ( not ( = ?auto_67823 ?auto_67822 ) ) ( not ( = ?auto_67823 ?auto_67820 ) ) ( not ( = ?auto_67822 ?auto_67820 ) ) ( ON ?auto_67822 ?auto_67823 ) ( not ( = ?auto_67821 ?auto_67820 ) ) ( not ( = ?auto_67818 ?auto_67821 ) ) ( not ( = ?auto_67819 ?auto_67821 ) ) ( not ( = ?auto_67823 ?auto_67821 ) ) ( not ( = ?auto_67822 ?auto_67821 ) ) ( ON ?auto_67820 ?auto_67822 ) ( CLEAR ?auto_67820 ) ( ON ?auto_67821 ?auto_67824 ) ( CLEAR ?auto_67821 ) ( HAND-EMPTY ) ( not ( = ?auto_67818 ?auto_67824 ) ) ( not ( = ?auto_67819 ?auto_67824 ) ) ( not ( = ?auto_67823 ?auto_67824 ) ) ( not ( = ?auto_67822 ?auto_67824 ) ) ( not ( = ?auto_67820 ?auto_67824 ) ) ( not ( = ?auto_67821 ?auto_67824 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_67821 ?auto_67824 )
      ( MAKE-2PILE ?auto_67818 ?auto_67819 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67825 - BLOCK
      ?auto_67826 - BLOCK
    )
    :vars
    (
      ?auto_67828 - BLOCK
      ?auto_67830 - BLOCK
      ?auto_67831 - BLOCK
      ?auto_67829 - BLOCK
      ?auto_67827 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67828 ?auto_67826 ) ( ON-TABLE ?auto_67825 ) ( ON ?auto_67826 ?auto_67825 ) ( not ( = ?auto_67825 ?auto_67826 ) ) ( not ( = ?auto_67825 ?auto_67828 ) ) ( not ( = ?auto_67826 ?auto_67828 ) ) ( not ( = ?auto_67825 ?auto_67830 ) ) ( not ( = ?auto_67825 ?auto_67831 ) ) ( not ( = ?auto_67826 ?auto_67830 ) ) ( not ( = ?auto_67826 ?auto_67831 ) ) ( not ( = ?auto_67828 ?auto_67830 ) ) ( not ( = ?auto_67828 ?auto_67831 ) ) ( not ( = ?auto_67830 ?auto_67831 ) ) ( ON ?auto_67830 ?auto_67828 ) ( not ( = ?auto_67829 ?auto_67831 ) ) ( not ( = ?auto_67825 ?auto_67829 ) ) ( not ( = ?auto_67826 ?auto_67829 ) ) ( not ( = ?auto_67828 ?auto_67829 ) ) ( not ( = ?auto_67830 ?auto_67829 ) ) ( ON ?auto_67829 ?auto_67827 ) ( CLEAR ?auto_67829 ) ( not ( = ?auto_67825 ?auto_67827 ) ) ( not ( = ?auto_67826 ?auto_67827 ) ) ( not ( = ?auto_67828 ?auto_67827 ) ) ( not ( = ?auto_67830 ?auto_67827 ) ) ( not ( = ?auto_67831 ?auto_67827 ) ) ( not ( = ?auto_67829 ?auto_67827 ) ) ( HOLDING ?auto_67831 ) ( CLEAR ?auto_67830 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67825 ?auto_67826 ?auto_67828 ?auto_67830 ?auto_67831 )
      ( MAKE-2PILE ?auto_67825 ?auto_67826 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67832 - BLOCK
      ?auto_67833 - BLOCK
    )
    :vars
    (
      ?auto_67837 - BLOCK
      ?auto_67834 - BLOCK
      ?auto_67835 - BLOCK
      ?auto_67836 - BLOCK
      ?auto_67838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67837 ?auto_67833 ) ( ON-TABLE ?auto_67832 ) ( ON ?auto_67833 ?auto_67832 ) ( not ( = ?auto_67832 ?auto_67833 ) ) ( not ( = ?auto_67832 ?auto_67837 ) ) ( not ( = ?auto_67833 ?auto_67837 ) ) ( not ( = ?auto_67832 ?auto_67834 ) ) ( not ( = ?auto_67832 ?auto_67835 ) ) ( not ( = ?auto_67833 ?auto_67834 ) ) ( not ( = ?auto_67833 ?auto_67835 ) ) ( not ( = ?auto_67837 ?auto_67834 ) ) ( not ( = ?auto_67837 ?auto_67835 ) ) ( not ( = ?auto_67834 ?auto_67835 ) ) ( ON ?auto_67834 ?auto_67837 ) ( not ( = ?auto_67836 ?auto_67835 ) ) ( not ( = ?auto_67832 ?auto_67836 ) ) ( not ( = ?auto_67833 ?auto_67836 ) ) ( not ( = ?auto_67837 ?auto_67836 ) ) ( not ( = ?auto_67834 ?auto_67836 ) ) ( ON ?auto_67836 ?auto_67838 ) ( not ( = ?auto_67832 ?auto_67838 ) ) ( not ( = ?auto_67833 ?auto_67838 ) ) ( not ( = ?auto_67837 ?auto_67838 ) ) ( not ( = ?auto_67834 ?auto_67838 ) ) ( not ( = ?auto_67835 ?auto_67838 ) ) ( not ( = ?auto_67836 ?auto_67838 ) ) ( CLEAR ?auto_67834 ) ( ON ?auto_67835 ?auto_67836 ) ( CLEAR ?auto_67835 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_67838 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67838 ?auto_67836 )
      ( MAKE-2PILE ?auto_67832 ?auto_67833 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67839 - BLOCK
      ?auto_67840 - BLOCK
    )
    :vars
    (
      ?auto_67844 - BLOCK
      ?auto_67845 - BLOCK
      ?auto_67842 - BLOCK
      ?auto_67843 - BLOCK
      ?auto_67841 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67844 ?auto_67840 ) ( ON-TABLE ?auto_67839 ) ( ON ?auto_67840 ?auto_67839 ) ( not ( = ?auto_67839 ?auto_67840 ) ) ( not ( = ?auto_67839 ?auto_67844 ) ) ( not ( = ?auto_67840 ?auto_67844 ) ) ( not ( = ?auto_67839 ?auto_67845 ) ) ( not ( = ?auto_67839 ?auto_67842 ) ) ( not ( = ?auto_67840 ?auto_67845 ) ) ( not ( = ?auto_67840 ?auto_67842 ) ) ( not ( = ?auto_67844 ?auto_67845 ) ) ( not ( = ?auto_67844 ?auto_67842 ) ) ( not ( = ?auto_67845 ?auto_67842 ) ) ( not ( = ?auto_67843 ?auto_67842 ) ) ( not ( = ?auto_67839 ?auto_67843 ) ) ( not ( = ?auto_67840 ?auto_67843 ) ) ( not ( = ?auto_67844 ?auto_67843 ) ) ( not ( = ?auto_67845 ?auto_67843 ) ) ( ON ?auto_67843 ?auto_67841 ) ( not ( = ?auto_67839 ?auto_67841 ) ) ( not ( = ?auto_67840 ?auto_67841 ) ) ( not ( = ?auto_67844 ?auto_67841 ) ) ( not ( = ?auto_67845 ?auto_67841 ) ) ( not ( = ?auto_67842 ?auto_67841 ) ) ( not ( = ?auto_67843 ?auto_67841 ) ) ( ON ?auto_67842 ?auto_67843 ) ( CLEAR ?auto_67842 ) ( ON-TABLE ?auto_67841 ) ( HOLDING ?auto_67845 ) ( CLEAR ?auto_67844 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_67839 ?auto_67840 ?auto_67844 ?auto_67845 )
      ( MAKE-2PILE ?auto_67839 ?auto_67840 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67846 - BLOCK
      ?auto_67847 - BLOCK
    )
    :vars
    (
      ?auto_67852 - BLOCK
      ?auto_67848 - BLOCK
      ?auto_67849 - BLOCK
      ?auto_67851 - BLOCK
      ?auto_67850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67852 ?auto_67847 ) ( ON-TABLE ?auto_67846 ) ( ON ?auto_67847 ?auto_67846 ) ( not ( = ?auto_67846 ?auto_67847 ) ) ( not ( = ?auto_67846 ?auto_67852 ) ) ( not ( = ?auto_67847 ?auto_67852 ) ) ( not ( = ?auto_67846 ?auto_67848 ) ) ( not ( = ?auto_67846 ?auto_67849 ) ) ( not ( = ?auto_67847 ?auto_67848 ) ) ( not ( = ?auto_67847 ?auto_67849 ) ) ( not ( = ?auto_67852 ?auto_67848 ) ) ( not ( = ?auto_67852 ?auto_67849 ) ) ( not ( = ?auto_67848 ?auto_67849 ) ) ( not ( = ?auto_67851 ?auto_67849 ) ) ( not ( = ?auto_67846 ?auto_67851 ) ) ( not ( = ?auto_67847 ?auto_67851 ) ) ( not ( = ?auto_67852 ?auto_67851 ) ) ( not ( = ?auto_67848 ?auto_67851 ) ) ( ON ?auto_67851 ?auto_67850 ) ( not ( = ?auto_67846 ?auto_67850 ) ) ( not ( = ?auto_67847 ?auto_67850 ) ) ( not ( = ?auto_67852 ?auto_67850 ) ) ( not ( = ?auto_67848 ?auto_67850 ) ) ( not ( = ?auto_67849 ?auto_67850 ) ) ( not ( = ?auto_67851 ?auto_67850 ) ) ( ON ?auto_67849 ?auto_67851 ) ( ON-TABLE ?auto_67850 ) ( CLEAR ?auto_67852 ) ( ON ?auto_67848 ?auto_67849 ) ( CLEAR ?auto_67848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_67850 ?auto_67851 ?auto_67849 )
      ( MAKE-2PILE ?auto_67846 ?auto_67847 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67867 - BLOCK
      ?auto_67868 - BLOCK
    )
    :vars
    (
      ?auto_67873 - BLOCK
      ?auto_67872 - BLOCK
      ?auto_67869 - BLOCK
      ?auto_67871 - BLOCK
      ?auto_67870 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67867 ) ( not ( = ?auto_67867 ?auto_67868 ) ) ( not ( = ?auto_67867 ?auto_67873 ) ) ( not ( = ?auto_67868 ?auto_67873 ) ) ( not ( = ?auto_67867 ?auto_67872 ) ) ( not ( = ?auto_67867 ?auto_67869 ) ) ( not ( = ?auto_67868 ?auto_67872 ) ) ( not ( = ?auto_67868 ?auto_67869 ) ) ( not ( = ?auto_67873 ?auto_67872 ) ) ( not ( = ?auto_67873 ?auto_67869 ) ) ( not ( = ?auto_67872 ?auto_67869 ) ) ( not ( = ?auto_67871 ?auto_67869 ) ) ( not ( = ?auto_67867 ?auto_67871 ) ) ( not ( = ?auto_67868 ?auto_67871 ) ) ( not ( = ?auto_67873 ?auto_67871 ) ) ( not ( = ?auto_67872 ?auto_67871 ) ) ( ON ?auto_67871 ?auto_67870 ) ( not ( = ?auto_67867 ?auto_67870 ) ) ( not ( = ?auto_67868 ?auto_67870 ) ) ( not ( = ?auto_67873 ?auto_67870 ) ) ( not ( = ?auto_67872 ?auto_67870 ) ) ( not ( = ?auto_67869 ?auto_67870 ) ) ( not ( = ?auto_67871 ?auto_67870 ) ) ( ON ?auto_67869 ?auto_67871 ) ( ON-TABLE ?auto_67870 ) ( ON ?auto_67872 ?auto_67869 ) ( ON ?auto_67873 ?auto_67872 ) ( CLEAR ?auto_67873 ) ( HOLDING ?auto_67868 ) ( CLEAR ?auto_67867 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_67867 ?auto_67868 ?auto_67873 )
      ( MAKE-2PILE ?auto_67867 ?auto_67868 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67874 - BLOCK
      ?auto_67875 - BLOCK
    )
    :vars
    (
      ?auto_67876 - BLOCK
      ?auto_67880 - BLOCK
      ?auto_67879 - BLOCK
      ?auto_67878 - BLOCK
      ?auto_67877 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67874 ) ( not ( = ?auto_67874 ?auto_67875 ) ) ( not ( = ?auto_67874 ?auto_67876 ) ) ( not ( = ?auto_67875 ?auto_67876 ) ) ( not ( = ?auto_67874 ?auto_67880 ) ) ( not ( = ?auto_67874 ?auto_67879 ) ) ( not ( = ?auto_67875 ?auto_67880 ) ) ( not ( = ?auto_67875 ?auto_67879 ) ) ( not ( = ?auto_67876 ?auto_67880 ) ) ( not ( = ?auto_67876 ?auto_67879 ) ) ( not ( = ?auto_67880 ?auto_67879 ) ) ( not ( = ?auto_67878 ?auto_67879 ) ) ( not ( = ?auto_67874 ?auto_67878 ) ) ( not ( = ?auto_67875 ?auto_67878 ) ) ( not ( = ?auto_67876 ?auto_67878 ) ) ( not ( = ?auto_67880 ?auto_67878 ) ) ( ON ?auto_67878 ?auto_67877 ) ( not ( = ?auto_67874 ?auto_67877 ) ) ( not ( = ?auto_67875 ?auto_67877 ) ) ( not ( = ?auto_67876 ?auto_67877 ) ) ( not ( = ?auto_67880 ?auto_67877 ) ) ( not ( = ?auto_67879 ?auto_67877 ) ) ( not ( = ?auto_67878 ?auto_67877 ) ) ( ON ?auto_67879 ?auto_67878 ) ( ON-TABLE ?auto_67877 ) ( ON ?auto_67880 ?auto_67879 ) ( ON ?auto_67876 ?auto_67880 ) ( CLEAR ?auto_67874 ) ( ON ?auto_67875 ?auto_67876 ) ( CLEAR ?auto_67875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67877 ?auto_67878 ?auto_67879 ?auto_67880 ?auto_67876 )
      ( MAKE-2PILE ?auto_67874 ?auto_67875 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67881 - BLOCK
      ?auto_67882 - BLOCK
    )
    :vars
    (
      ?auto_67885 - BLOCK
      ?auto_67887 - BLOCK
      ?auto_67886 - BLOCK
      ?auto_67884 - BLOCK
      ?auto_67883 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67881 ?auto_67882 ) ) ( not ( = ?auto_67881 ?auto_67885 ) ) ( not ( = ?auto_67882 ?auto_67885 ) ) ( not ( = ?auto_67881 ?auto_67887 ) ) ( not ( = ?auto_67881 ?auto_67886 ) ) ( not ( = ?auto_67882 ?auto_67887 ) ) ( not ( = ?auto_67882 ?auto_67886 ) ) ( not ( = ?auto_67885 ?auto_67887 ) ) ( not ( = ?auto_67885 ?auto_67886 ) ) ( not ( = ?auto_67887 ?auto_67886 ) ) ( not ( = ?auto_67884 ?auto_67886 ) ) ( not ( = ?auto_67881 ?auto_67884 ) ) ( not ( = ?auto_67882 ?auto_67884 ) ) ( not ( = ?auto_67885 ?auto_67884 ) ) ( not ( = ?auto_67887 ?auto_67884 ) ) ( ON ?auto_67884 ?auto_67883 ) ( not ( = ?auto_67881 ?auto_67883 ) ) ( not ( = ?auto_67882 ?auto_67883 ) ) ( not ( = ?auto_67885 ?auto_67883 ) ) ( not ( = ?auto_67887 ?auto_67883 ) ) ( not ( = ?auto_67886 ?auto_67883 ) ) ( not ( = ?auto_67884 ?auto_67883 ) ) ( ON ?auto_67886 ?auto_67884 ) ( ON-TABLE ?auto_67883 ) ( ON ?auto_67887 ?auto_67886 ) ( ON ?auto_67885 ?auto_67887 ) ( ON ?auto_67882 ?auto_67885 ) ( CLEAR ?auto_67882 ) ( HOLDING ?auto_67881 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_67881 )
      ( MAKE-2PILE ?auto_67881 ?auto_67882 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_67888 - BLOCK
      ?auto_67889 - BLOCK
    )
    :vars
    (
      ?auto_67891 - BLOCK
      ?auto_67894 - BLOCK
      ?auto_67893 - BLOCK
      ?auto_67892 - BLOCK
      ?auto_67890 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67888 ?auto_67889 ) ) ( not ( = ?auto_67888 ?auto_67891 ) ) ( not ( = ?auto_67889 ?auto_67891 ) ) ( not ( = ?auto_67888 ?auto_67894 ) ) ( not ( = ?auto_67888 ?auto_67893 ) ) ( not ( = ?auto_67889 ?auto_67894 ) ) ( not ( = ?auto_67889 ?auto_67893 ) ) ( not ( = ?auto_67891 ?auto_67894 ) ) ( not ( = ?auto_67891 ?auto_67893 ) ) ( not ( = ?auto_67894 ?auto_67893 ) ) ( not ( = ?auto_67892 ?auto_67893 ) ) ( not ( = ?auto_67888 ?auto_67892 ) ) ( not ( = ?auto_67889 ?auto_67892 ) ) ( not ( = ?auto_67891 ?auto_67892 ) ) ( not ( = ?auto_67894 ?auto_67892 ) ) ( ON ?auto_67892 ?auto_67890 ) ( not ( = ?auto_67888 ?auto_67890 ) ) ( not ( = ?auto_67889 ?auto_67890 ) ) ( not ( = ?auto_67891 ?auto_67890 ) ) ( not ( = ?auto_67894 ?auto_67890 ) ) ( not ( = ?auto_67893 ?auto_67890 ) ) ( not ( = ?auto_67892 ?auto_67890 ) ) ( ON ?auto_67893 ?auto_67892 ) ( ON-TABLE ?auto_67890 ) ( ON ?auto_67894 ?auto_67893 ) ( ON ?auto_67891 ?auto_67894 ) ( ON ?auto_67889 ?auto_67891 ) ( ON ?auto_67888 ?auto_67889 ) ( CLEAR ?auto_67888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_67890 ?auto_67892 ?auto_67893 ?auto_67894 ?auto_67891 ?auto_67889 )
      ( MAKE-2PILE ?auto_67888 ?auto_67889 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_67899 - BLOCK
      ?auto_67900 - BLOCK
      ?auto_67901 - BLOCK
      ?auto_67902 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_67902 ) ( CLEAR ?auto_67901 ) ( ON-TABLE ?auto_67899 ) ( ON ?auto_67900 ?auto_67899 ) ( ON ?auto_67901 ?auto_67900 ) ( not ( = ?auto_67899 ?auto_67900 ) ) ( not ( = ?auto_67899 ?auto_67901 ) ) ( not ( = ?auto_67899 ?auto_67902 ) ) ( not ( = ?auto_67900 ?auto_67901 ) ) ( not ( = ?auto_67900 ?auto_67902 ) ) ( not ( = ?auto_67901 ?auto_67902 ) ) )
    :subtasks
    ( ( !STACK ?auto_67902 ?auto_67901 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_67903 - BLOCK
      ?auto_67904 - BLOCK
      ?auto_67905 - BLOCK
      ?auto_67906 - BLOCK
    )
    :vars
    (
      ?auto_67907 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_67905 ) ( ON-TABLE ?auto_67903 ) ( ON ?auto_67904 ?auto_67903 ) ( ON ?auto_67905 ?auto_67904 ) ( not ( = ?auto_67903 ?auto_67904 ) ) ( not ( = ?auto_67903 ?auto_67905 ) ) ( not ( = ?auto_67903 ?auto_67906 ) ) ( not ( = ?auto_67904 ?auto_67905 ) ) ( not ( = ?auto_67904 ?auto_67906 ) ) ( not ( = ?auto_67905 ?auto_67906 ) ) ( ON ?auto_67906 ?auto_67907 ) ( CLEAR ?auto_67906 ) ( HAND-EMPTY ) ( not ( = ?auto_67903 ?auto_67907 ) ) ( not ( = ?auto_67904 ?auto_67907 ) ) ( not ( = ?auto_67905 ?auto_67907 ) ) ( not ( = ?auto_67906 ?auto_67907 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_67906 ?auto_67907 )
      ( MAKE-4PILE ?auto_67903 ?auto_67904 ?auto_67905 ?auto_67906 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_67908 - BLOCK
      ?auto_67909 - BLOCK
      ?auto_67910 - BLOCK
      ?auto_67911 - BLOCK
    )
    :vars
    (
      ?auto_67912 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67908 ) ( ON ?auto_67909 ?auto_67908 ) ( not ( = ?auto_67908 ?auto_67909 ) ) ( not ( = ?auto_67908 ?auto_67910 ) ) ( not ( = ?auto_67908 ?auto_67911 ) ) ( not ( = ?auto_67909 ?auto_67910 ) ) ( not ( = ?auto_67909 ?auto_67911 ) ) ( not ( = ?auto_67910 ?auto_67911 ) ) ( ON ?auto_67911 ?auto_67912 ) ( CLEAR ?auto_67911 ) ( not ( = ?auto_67908 ?auto_67912 ) ) ( not ( = ?auto_67909 ?auto_67912 ) ) ( not ( = ?auto_67910 ?auto_67912 ) ) ( not ( = ?auto_67911 ?auto_67912 ) ) ( HOLDING ?auto_67910 ) ( CLEAR ?auto_67909 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_67908 ?auto_67909 ?auto_67910 )
      ( MAKE-4PILE ?auto_67908 ?auto_67909 ?auto_67910 ?auto_67911 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_67913 - BLOCK
      ?auto_67914 - BLOCK
      ?auto_67915 - BLOCK
      ?auto_67916 - BLOCK
    )
    :vars
    (
      ?auto_67917 - BLOCK
      ?auto_67918 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67913 ) ( ON ?auto_67914 ?auto_67913 ) ( not ( = ?auto_67913 ?auto_67914 ) ) ( not ( = ?auto_67913 ?auto_67915 ) ) ( not ( = ?auto_67913 ?auto_67916 ) ) ( not ( = ?auto_67914 ?auto_67915 ) ) ( not ( = ?auto_67914 ?auto_67916 ) ) ( not ( = ?auto_67915 ?auto_67916 ) ) ( ON ?auto_67916 ?auto_67917 ) ( not ( = ?auto_67913 ?auto_67917 ) ) ( not ( = ?auto_67914 ?auto_67917 ) ) ( not ( = ?auto_67915 ?auto_67917 ) ) ( not ( = ?auto_67916 ?auto_67917 ) ) ( CLEAR ?auto_67914 ) ( ON ?auto_67915 ?auto_67916 ) ( CLEAR ?auto_67915 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_67918 ) ( ON ?auto_67917 ?auto_67918 ) ( not ( = ?auto_67918 ?auto_67917 ) ) ( not ( = ?auto_67918 ?auto_67916 ) ) ( not ( = ?auto_67918 ?auto_67915 ) ) ( not ( = ?auto_67913 ?auto_67918 ) ) ( not ( = ?auto_67914 ?auto_67918 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_67918 ?auto_67917 ?auto_67916 )
      ( MAKE-4PILE ?auto_67913 ?auto_67914 ?auto_67915 ?auto_67916 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_67919 - BLOCK
      ?auto_67920 - BLOCK
      ?auto_67921 - BLOCK
      ?auto_67922 - BLOCK
    )
    :vars
    (
      ?auto_67924 - BLOCK
      ?auto_67923 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67919 ) ( not ( = ?auto_67919 ?auto_67920 ) ) ( not ( = ?auto_67919 ?auto_67921 ) ) ( not ( = ?auto_67919 ?auto_67922 ) ) ( not ( = ?auto_67920 ?auto_67921 ) ) ( not ( = ?auto_67920 ?auto_67922 ) ) ( not ( = ?auto_67921 ?auto_67922 ) ) ( ON ?auto_67922 ?auto_67924 ) ( not ( = ?auto_67919 ?auto_67924 ) ) ( not ( = ?auto_67920 ?auto_67924 ) ) ( not ( = ?auto_67921 ?auto_67924 ) ) ( not ( = ?auto_67922 ?auto_67924 ) ) ( ON ?auto_67921 ?auto_67922 ) ( CLEAR ?auto_67921 ) ( ON-TABLE ?auto_67923 ) ( ON ?auto_67924 ?auto_67923 ) ( not ( = ?auto_67923 ?auto_67924 ) ) ( not ( = ?auto_67923 ?auto_67922 ) ) ( not ( = ?auto_67923 ?auto_67921 ) ) ( not ( = ?auto_67919 ?auto_67923 ) ) ( not ( = ?auto_67920 ?auto_67923 ) ) ( HOLDING ?auto_67920 ) ( CLEAR ?auto_67919 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67919 ?auto_67920 )
      ( MAKE-4PILE ?auto_67919 ?auto_67920 ?auto_67921 ?auto_67922 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_67925 - BLOCK
      ?auto_67926 - BLOCK
      ?auto_67927 - BLOCK
      ?auto_67928 - BLOCK
    )
    :vars
    (
      ?auto_67929 - BLOCK
      ?auto_67930 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67925 ) ( not ( = ?auto_67925 ?auto_67926 ) ) ( not ( = ?auto_67925 ?auto_67927 ) ) ( not ( = ?auto_67925 ?auto_67928 ) ) ( not ( = ?auto_67926 ?auto_67927 ) ) ( not ( = ?auto_67926 ?auto_67928 ) ) ( not ( = ?auto_67927 ?auto_67928 ) ) ( ON ?auto_67928 ?auto_67929 ) ( not ( = ?auto_67925 ?auto_67929 ) ) ( not ( = ?auto_67926 ?auto_67929 ) ) ( not ( = ?auto_67927 ?auto_67929 ) ) ( not ( = ?auto_67928 ?auto_67929 ) ) ( ON ?auto_67927 ?auto_67928 ) ( ON-TABLE ?auto_67930 ) ( ON ?auto_67929 ?auto_67930 ) ( not ( = ?auto_67930 ?auto_67929 ) ) ( not ( = ?auto_67930 ?auto_67928 ) ) ( not ( = ?auto_67930 ?auto_67927 ) ) ( not ( = ?auto_67925 ?auto_67930 ) ) ( not ( = ?auto_67926 ?auto_67930 ) ) ( CLEAR ?auto_67925 ) ( ON ?auto_67926 ?auto_67927 ) ( CLEAR ?auto_67926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_67930 ?auto_67929 ?auto_67928 ?auto_67927 )
      ( MAKE-4PILE ?auto_67925 ?auto_67926 ?auto_67927 ?auto_67928 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_67931 - BLOCK
      ?auto_67932 - BLOCK
      ?auto_67933 - BLOCK
      ?auto_67934 - BLOCK
    )
    :vars
    (
      ?auto_67936 - BLOCK
      ?auto_67935 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67931 ?auto_67932 ) ) ( not ( = ?auto_67931 ?auto_67933 ) ) ( not ( = ?auto_67931 ?auto_67934 ) ) ( not ( = ?auto_67932 ?auto_67933 ) ) ( not ( = ?auto_67932 ?auto_67934 ) ) ( not ( = ?auto_67933 ?auto_67934 ) ) ( ON ?auto_67934 ?auto_67936 ) ( not ( = ?auto_67931 ?auto_67936 ) ) ( not ( = ?auto_67932 ?auto_67936 ) ) ( not ( = ?auto_67933 ?auto_67936 ) ) ( not ( = ?auto_67934 ?auto_67936 ) ) ( ON ?auto_67933 ?auto_67934 ) ( ON-TABLE ?auto_67935 ) ( ON ?auto_67936 ?auto_67935 ) ( not ( = ?auto_67935 ?auto_67936 ) ) ( not ( = ?auto_67935 ?auto_67934 ) ) ( not ( = ?auto_67935 ?auto_67933 ) ) ( not ( = ?auto_67931 ?auto_67935 ) ) ( not ( = ?auto_67932 ?auto_67935 ) ) ( ON ?auto_67932 ?auto_67933 ) ( CLEAR ?auto_67932 ) ( HOLDING ?auto_67931 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_67931 )
      ( MAKE-4PILE ?auto_67931 ?auto_67932 ?auto_67933 ?auto_67934 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_67937 - BLOCK
      ?auto_67938 - BLOCK
      ?auto_67939 - BLOCK
      ?auto_67940 - BLOCK
    )
    :vars
    (
      ?auto_67942 - BLOCK
      ?auto_67941 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67937 ?auto_67938 ) ) ( not ( = ?auto_67937 ?auto_67939 ) ) ( not ( = ?auto_67937 ?auto_67940 ) ) ( not ( = ?auto_67938 ?auto_67939 ) ) ( not ( = ?auto_67938 ?auto_67940 ) ) ( not ( = ?auto_67939 ?auto_67940 ) ) ( ON ?auto_67940 ?auto_67942 ) ( not ( = ?auto_67937 ?auto_67942 ) ) ( not ( = ?auto_67938 ?auto_67942 ) ) ( not ( = ?auto_67939 ?auto_67942 ) ) ( not ( = ?auto_67940 ?auto_67942 ) ) ( ON ?auto_67939 ?auto_67940 ) ( ON-TABLE ?auto_67941 ) ( ON ?auto_67942 ?auto_67941 ) ( not ( = ?auto_67941 ?auto_67942 ) ) ( not ( = ?auto_67941 ?auto_67940 ) ) ( not ( = ?auto_67941 ?auto_67939 ) ) ( not ( = ?auto_67937 ?auto_67941 ) ) ( not ( = ?auto_67938 ?auto_67941 ) ) ( ON ?auto_67938 ?auto_67939 ) ( ON ?auto_67937 ?auto_67938 ) ( CLEAR ?auto_67937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67941 ?auto_67942 ?auto_67940 ?auto_67939 ?auto_67938 )
      ( MAKE-4PILE ?auto_67937 ?auto_67938 ?auto_67939 ?auto_67940 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_67943 - BLOCK
      ?auto_67944 - BLOCK
      ?auto_67945 - BLOCK
      ?auto_67946 - BLOCK
    )
    :vars
    (
      ?auto_67947 - BLOCK
      ?auto_67948 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67943 ?auto_67944 ) ) ( not ( = ?auto_67943 ?auto_67945 ) ) ( not ( = ?auto_67943 ?auto_67946 ) ) ( not ( = ?auto_67944 ?auto_67945 ) ) ( not ( = ?auto_67944 ?auto_67946 ) ) ( not ( = ?auto_67945 ?auto_67946 ) ) ( ON ?auto_67946 ?auto_67947 ) ( not ( = ?auto_67943 ?auto_67947 ) ) ( not ( = ?auto_67944 ?auto_67947 ) ) ( not ( = ?auto_67945 ?auto_67947 ) ) ( not ( = ?auto_67946 ?auto_67947 ) ) ( ON ?auto_67945 ?auto_67946 ) ( ON-TABLE ?auto_67948 ) ( ON ?auto_67947 ?auto_67948 ) ( not ( = ?auto_67948 ?auto_67947 ) ) ( not ( = ?auto_67948 ?auto_67946 ) ) ( not ( = ?auto_67948 ?auto_67945 ) ) ( not ( = ?auto_67943 ?auto_67948 ) ) ( not ( = ?auto_67944 ?auto_67948 ) ) ( ON ?auto_67944 ?auto_67945 ) ( HOLDING ?auto_67943 ) ( CLEAR ?auto_67944 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_67948 ?auto_67947 ?auto_67946 ?auto_67945 ?auto_67944 ?auto_67943 )
      ( MAKE-4PILE ?auto_67943 ?auto_67944 ?auto_67945 ?auto_67946 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_67949 - BLOCK
      ?auto_67950 - BLOCK
      ?auto_67951 - BLOCK
      ?auto_67952 - BLOCK
    )
    :vars
    (
      ?auto_67954 - BLOCK
      ?auto_67953 - BLOCK
      ?auto_67955 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67949 ?auto_67950 ) ) ( not ( = ?auto_67949 ?auto_67951 ) ) ( not ( = ?auto_67949 ?auto_67952 ) ) ( not ( = ?auto_67950 ?auto_67951 ) ) ( not ( = ?auto_67950 ?auto_67952 ) ) ( not ( = ?auto_67951 ?auto_67952 ) ) ( ON ?auto_67952 ?auto_67954 ) ( not ( = ?auto_67949 ?auto_67954 ) ) ( not ( = ?auto_67950 ?auto_67954 ) ) ( not ( = ?auto_67951 ?auto_67954 ) ) ( not ( = ?auto_67952 ?auto_67954 ) ) ( ON ?auto_67951 ?auto_67952 ) ( ON-TABLE ?auto_67953 ) ( ON ?auto_67954 ?auto_67953 ) ( not ( = ?auto_67953 ?auto_67954 ) ) ( not ( = ?auto_67953 ?auto_67952 ) ) ( not ( = ?auto_67953 ?auto_67951 ) ) ( not ( = ?auto_67949 ?auto_67953 ) ) ( not ( = ?auto_67950 ?auto_67953 ) ) ( ON ?auto_67950 ?auto_67951 ) ( CLEAR ?auto_67950 ) ( ON ?auto_67949 ?auto_67955 ) ( CLEAR ?auto_67949 ) ( HAND-EMPTY ) ( not ( = ?auto_67949 ?auto_67955 ) ) ( not ( = ?auto_67950 ?auto_67955 ) ) ( not ( = ?auto_67951 ?auto_67955 ) ) ( not ( = ?auto_67952 ?auto_67955 ) ) ( not ( = ?auto_67954 ?auto_67955 ) ) ( not ( = ?auto_67953 ?auto_67955 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_67949 ?auto_67955 )
      ( MAKE-4PILE ?auto_67949 ?auto_67950 ?auto_67951 ?auto_67952 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_67956 - BLOCK
      ?auto_67957 - BLOCK
      ?auto_67958 - BLOCK
      ?auto_67959 - BLOCK
    )
    :vars
    (
      ?auto_67962 - BLOCK
      ?auto_67961 - BLOCK
      ?auto_67960 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67956 ?auto_67957 ) ) ( not ( = ?auto_67956 ?auto_67958 ) ) ( not ( = ?auto_67956 ?auto_67959 ) ) ( not ( = ?auto_67957 ?auto_67958 ) ) ( not ( = ?auto_67957 ?auto_67959 ) ) ( not ( = ?auto_67958 ?auto_67959 ) ) ( ON ?auto_67959 ?auto_67962 ) ( not ( = ?auto_67956 ?auto_67962 ) ) ( not ( = ?auto_67957 ?auto_67962 ) ) ( not ( = ?auto_67958 ?auto_67962 ) ) ( not ( = ?auto_67959 ?auto_67962 ) ) ( ON ?auto_67958 ?auto_67959 ) ( ON-TABLE ?auto_67961 ) ( ON ?auto_67962 ?auto_67961 ) ( not ( = ?auto_67961 ?auto_67962 ) ) ( not ( = ?auto_67961 ?auto_67959 ) ) ( not ( = ?auto_67961 ?auto_67958 ) ) ( not ( = ?auto_67956 ?auto_67961 ) ) ( not ( = ?auto_67957 ?auto_67961 ) ) ( ON ?auto_67956 ?auto_67960 ) ( CLEAR ?auto_67956 ) ( not ( = ?auto_67956 ?auto_67960 ) ) ( not ( = ?auto_67957 ?auto_67960 ) ) ( not ( = ?auto_67958 ?auto_67960 ) ) ( not ( = ?auto_67959 ?auto_67960 ) ) ( not ( = ?auto_67962 ?auto_67960 ) ) ( not ( = ?auto_67961 ?auto_67960 ) ) ( HOLDING ?auto_67957 ) ( CLEAR ?auto_67958 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67961 ?auto_67962 ?auto_67959 ?auto_67958 ?auto_67957 )
      ( MAKE-4PILE ?auto_67956 ?auto_67957 ?auto_67958 ?auto_67959 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_67963 - BLOCK
      ?auto_67964 - BLOCK
      ?auto_67965 - BLOCK
      ?auto_67966 - BLOCK
    )
    :vars
    (
      ?auto_67969 - BLOCK
      ?auto_67967 - BLOCK
      ?auto_67968 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67963 ?auto_67964 ) ) ( not ( = ?auto_67963 ?auto_67965 ) ) ( not ( = ?auto_67963 ?auto_67966 ) ) ( not ( = ?auto_67964 ?auto_67965 ) ) ( not ( = ?auto_67964 ?auto_67966 ) ) ( not ( = ?auto_67965 ?auto_67966 ) ) ( ON ?auto_67966 ?auto_67969 ) ( not ( = ?auto_67963 ?auto_67969 ) ) ( not ( = ?auto_67964 ?auto_67969 ) ) ( not ( = ?auto_67965 ?auto_67969 ) ) ( not ( = ?auto_67966 ?auto_67969 ) ) ( ON ?auto_67965 ?auto_67966 ) ( ON-TABLE ?auto_67967 ) ( ON ?auto_67969 ?auto_67967 ) ( not ( = ?auto_67967 ?auto_67969 ) ) ( not ( = ?auto_67967 ?auto_67966 ) ) ( not ( = ?auto_67967 ?auto_67965 ) ) ( not ( = ?auto_67963 ?auto_67967 ) ) ( not ( = ?auto_67964 ?auto_67967 ) ) ( ON ?auto_67963 ?auto_67968 ) ( not ( = ?auto_67963 ?auto_67968 ) ) ( not ( = ?auto_67964 ?auto_67968 ) ) ( not ( = ?auto_67965 ?auto_67968 ) ) ( not ( = ?auto_67966 ?auto_67968 ) ) ( not ( = ?auto_67969 ?auto_67968 ) ) ( not ( = ?auto_67967 ?auto_67968 ) ) ( CLEAR ?auto_67965 ) ( ON ?auto_67964 ?auto_67963 ) ( CLEAR ?auto_67964 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_67968 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67968 ?auto_67963 )
      ( MAKE-4PILE ?auto_67963 ?auto_67964 ?auto_67965 ?auto_67966 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_67970 - BLOCK
      ?auto_67971 - BLOCK
      ?auto_67972 - BLOCK
      ?auto_67973 - BLOCK
    )
    :vars
    (
      ?auto_67976 - BLOCK
      ?auto_67974 - BLOCK
      ?auto_67975 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67970 ?auto_67971 ) ) ( not ( = ?auto_67970 ?auto_67972 ) ) ( not ( = ?auto_67970 ?auto_67973 ) ) ( not ( = ?auto_67971 ?auto_67972 ) ) ( not ( = ?auto_67971 ?auto_67973 ) ) ( not ( = ?auto_67972 ?auto_67973 ) ) ( ON ?auto_67973 ?auto_67976 ) ( not ( = ?auto_67970 ?auto_67976 ) ) ( not ( = ?auto_67971 ?auto_67976 ) ) ( not ( = ?auto_67972 ?auto_67976 ) ) ( not ( = ?auto_67973 ?auto_67976 ) ) ( ON-TABLE ?auto_67974 ) ( ON ?auto_67976 ?auto_67974 ) ( not ( = ?auto_67974 ?auto_67976 ) ) ( not ( = ?auto_67974 ?auto_67973 ) ) ( not ( = ?auto_67974 ?auto_67972 ) ) ( not ( = ?auto_67970 ?auto_67974 ) ) ( not ( = ?auto_67971 ?auto_67974 ) ) ( ON ?auto_67970 ?auto_67975 ) ( not ( = ?auto_67970 ?auto_67975 ) ) ( not ( = ?auto_67971 ?auto_67975 ) ) ( not ( = ?auto_67972 ?auto_67975 ) ) ( not ( = ?auto_67973 ?auto_67975 ) ) ( not ( = ?auto_67976 ?auto_67975 ) ) ( not ( = ?auto_67974 ?auto_67975 ) ) ( ON ?auto_67971 ?auto_67970 ) ( CLEAR ?auto_67971 ) ( ON-TABLE ?auto_67975 ) ( HOLDING ?auto_67972 ) ( CLEAR ?auto_67973 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_67974 ?auto_67976 ?auto_67973 ?auto_67972 )
      ( MAKE-4PILE ?auto_67970 ?auto_67971 ?auto_67972 ?auto_67973 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_67977 - BLOCK
      ?auto_67978 - BLOCK
      ?auto_67979 - BLOCK
      ?auto_67980 - BLOCK
    )
    :vars
    (
      ?auto_67982 - BLOCK
      ?auto_67983 - BLOCK
      ?auto_67981 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67977 ?auto_67978 ) ) ( not ( = ?auto_67977 ?auto_67979 ) ) ( not ( = ?auto_67977 ?auto_67980 ) ) ( not ( = ?auto_67978 ?auto_67979 ) ) ( not ( = ?auto_67978 ?auto_67980 ) ) ( not ( = ?auto_67979 ?auto_67980 ) ) ( ON ?auto_67980 ?auto_67982 ) ( not ( = ?auto_67977 ?auto_67982 ) ) ( not ( = ?auto_67978 ?auto_67982 ) ) ( not ( = ?auto_67979 ?auto_67982 ) ) ( not ( = ?auto_67980 ?auto_67982 ) ) ( ON-TABLE ?auto_67983 ) ( ON ?auto_67982 ?auto_67983 ) ( not ( = ?auto_67983 ?auto_67982 ) ) ( not ( = ?auto_67983 ?auto_67980 ) ) ( not ( = ?auto_67983 ?auto_67979 ) ) ( not ( = ?auto_67977 ?auto_67983 ) ) ( not ( = ?auto_67978 ?auto_67983 ) ) ( ON ?auto_67977 ?auto_67981 ) ( not ( = ?auto_67977 ?auto_67981 ) ) ( not ( = ?auto_67978 ?auto_67981 ) ) ( not ( = ?auto_67979 ?auto_67981 ) ) ( not ( = ?auto_67980 ?auto_67981 ) ) ( not ( = ?auto_67982 ?auto_67981 ) ) ( not ( = ?auto_67983 ?auto_67981 ) ) ( ON ?auto_67978 ?auto_67977 ) ( ON-TABLE ?auto_67981 ) ( CLEAR ?auto_67980 ) ( ON ?auto_67979 ?auto_67978 ) ( CLEAR ?auto_67979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_67981 ?auto_67977 ?auto_67978 )
      ( MAKE-4PILE ?auto_67977 ?auto_67978 ?auto_67979 ?auto_67980 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_67984 - BLOCK
      ?auto_67985 - BLOCK
      ?auto_67986 - BLOCK
      ?auto_67987 - BLOCK
    )
    :vars
    (
      ?auto_67988 - BLOCK
      ?auto_67989 - BLOCK
      ?auto_67990 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67984 ?auto_67985 ) ) ( not ( = ?auto_67984 ?auto_67986 ) ) ( not ( = ?auto_67984 ?auto_67987 ) ) ( not ( = ?auto_67985 ?auto_67986 ) ) ( not ( = ?auto_67985 ?auto_67987 ) ) ( not ( = ?auto_67986 ?auto_67987 ) ) ( not ( = ?auto_67984 ?auto_67988 ) ) ( not ( = ?auto_67985 ?auto_67988 ) ) ( not ( = ?auto_67986 ?auto_67988 ) ) ( not ( = ?auto_67987 ?auto_67988 ) ) ( ON-TABLE ?auto_67989 ) ( ON ?auto_67988 ?auto_67989 ) ( not ( = ?auto_67989 ?auto_67988 ) ) ( not ( = ?auto_67989 ?auto_67987 ) ) ( not ( = ?auto_67989 ?auto_67986 ) ) ( not ( = ?auto_67984 ?auto_67989 ) ) ( not ( = ?auto_67985 ?auto_67989 ) ) ( ON ?auto_67984 ?auto_67990 ) ( not ( = ?auto_67984 ?auto_67990 ) ) ( not ( = ?auto_67985 ?auto_67990 ) ) ( not ( = ?auto_67986 ?auto_67990 ) ) ( not ( = ?auto_67987 ?auto_67990 ) ) ( not ( = ?auto_67988 ?auto_67990 ) ) ( not ( = ?auto_67989 ?auto_67990 ) ) ( ON ?auto_67985 ?auto_67984 ) ( ON-TABLE ?auto_67990 ) ( ON ?auto_67986 ?auto_67985 ) ( CLEAR ?auto_67986 ) ( HOLDING ?auto_67987 ) ( CLEAR ?auto_67988 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_67989 ?auto_67988 ?auto_67987 )
      ( MAKE-4PILE ?auto_67984 ?auto_67985 ?auto_67986 ?auto_67987 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_67991 - BLOCK
      ?auto_67992 - BLOCK
      ?auto_67993 - BLOCK
      ?auto_67994 - BLOCK
    )
    :vars
    (
      ?auto_67996 - BLOCK
      ?auto_67995 - BLOCK
      ?auto_67997 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67991 ?auto_67992 ) ) ( not ( = ?auto_67991 ?auto_67993 ) ) ( not ( = ?auto_67991 ?auto_67994 ) ) ( not ( = ?auto_67992 ?auto_67993 ) ) ( not ( = ?auto_67992 ?auto_67994 ) ) ( not ( = ?auto_67993 ?auto_67994 ) ) ( not ( = ?auto_67991 ?auto_67996 ) ) ( not ( = ?auto_67992 ?auto_67996 ) ) ( not ( = ?auto_67993 ?auto_67996 ) ) ( not ( = ?auto_67994 ?auto_67996 ) ) ( ON-TABLE ?auto_67995 ) ( ON ?auto_67996 ?auto_67995 ) ( not ( = ?auto_67995 ?auto_67996 ) ) ( not ( = ?auto_67995 ?auto_67994 ) ) ( not ( = ?auto_67995 ?auto_67993 ) ) ( not ( = ?auto_67991 ?auto_67995 ) ) ( not ( = ?auto_67992 ?auto_67995 ) ) ( ON ?auto_67991 ?auto_67997 ) ( not ( = ?auto_67991 ?auto_67997 ) ) ( not ( = ?auto_67992 ?auto_67997 ) ) ( not ( = ?auto_67993 ?auto_67997 ) ) ( not ( = ?auto_67994 ?auto_67997 ) ) ( not ( = ?auto_67996 ?auto_67997 ) ) ( not ( = ?auto_67995 ?auto_67997 ) ) ( ON ?auto_67992 ?auto_67991 ) ( ON-TABLE ?auto_67997 ) ( ON ?auto_67993 ?auto_67992 ) ( CLEAR ?auto_67996 ) ( ON ?auto_67994 ?auto_67993 ) ( CLEAR ?auto_67994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_67997 ?auto_67991 ?auto_67992 ?auto_67993 )
      ( MAKE-4PILE ?auto_67991 ?auto_67992 ?auto_67993 ?auto_67994 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_67998 - BLOCK
      ?auto_67999 - BLOCK
      ?auto_68000 - BLOCK
      ?auto_68001 - BLOCK
    )
    :vars
    (
      ?auto_68003 - BLOCK
      ?auto_68002 - BLOCK
      ?auto_68004 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67998 ?auto_67999 ) ) ( not ( = ?auto_67998 ?auto_68000 ) ) ( not ( = ?auto_67998 ?auto_68001 ) ) ( not ( = ?auto_67999 ?auto_68000 ) ) ( not ( = ?auto_67999 ?auto_68001 ) ) ( not ( = ?auto_68000 ?auto_68001 ) ) ( not ( = ?auto_67998 ?auto_68003 ) ) ( not ( = ?auto_67999 ?auto_68003 ) ) ( not ( = ?auto_68000 ?auto_68003 ) ) ( not ( = ?auto_68001 ?auto_68003 ) ) ( ON-TABLE ?auto_68002 ) ( not ( = ?auto_68002 ?auto_68003 ) ) ( not ( = ?auto_68002 ?auto_68001 ) ) ( not ( = ?auto_68002 ?auto_68000 ) ) ( not ( = ?auto_67998 ?auto_68002 ) ) ( not ( = ?auto_67999 ?auto_68002 ) ) ( ON ?auto_67998 ?auto_68004 ) ( not ( = ?auto_67998 ?auto_68004 ) ) ( not ( = ?auto_67999 ?auto_68004 ) ) ( not ( = ?auto_68000 ?auto_68004 ) ) ( not ( = ?auto_68001 ?auto_68004 ) ) ( not ( = ?auto_68003 ?auto_68004 ) ) ( not ( = ?auto_68002 ?auto_68004 ) ) ( ON ?auto_67999 ?auto_67998 ) ( ON-TABLE ?auto_68004 ) ( ON ?auto_68000 ?auto_67999 ) ( ON ?auto_68001 ?auto_68000 ) ( CLEAR ?auto_68001 ) ( HOLDING ?auto_68003 ) ( CLEAR ?auto_68002 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68002 ?auto_68003 )
      ( MAKE-4PILE ?auto_67998 ?auto_67999 ?auto_68000 ?auto_68001 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68005 - BLOCK
      ?auto_68006 - BLOCK
      ?auto_68007 - BLOCK
      ?auto_68008 - BLOCK
    )
    :vars
    (
      ?auto_68009 - BLOCK
      ?auto_68010 - BLOCK
      ?auto_68011 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68005 ?auto_68006 ) ) ( not ( = ?auto_68005 ?auto_68007 ) ) ( not ( = ?auto_68005 ?auto_68008 ) ) ( not ( = ?auto_68006 ?auto_68007 ) ) ( not ( = ?auto_68006 ?auto_68008 ) ) ( not ( = ?auto_68007 ?auto_68008 ) ) ( not ( = ?auto_68005 ?auto_68009 ) ) ( not ( = ?auto_68006 ?auto_68009 ) ) ( not ( = ?auto_68007 ?auto_68009 ) ) ( not ( = ?auto_68008 ?auto_68009 ) ) ( ON-TABLE ?auto_68010 ) ( not ( = ?auto_68010 ?auto_68009 ) ) ( not ( = ?auto_68010 ?auto_68008 ) ) ( not ( = ?auto_68010 ?auto_68007 ) ) ( not ( = ?auto_68005 ?auto_68010 ) ) ( not ( = ?auto_68006 ?auto_68010 ) ) ( ON ?auto_68005 ?auto_68011 ) ( not ( = ?auto_68005 ?auto_68011 ) ) ( not ( = ?auto_68006 ?auto_68011 ) ) ( not ( = ?auto_68007 ?auto_68011 ) ) ( not ( = ?auto_68008 ?auto_68011 ) ) ( not ( = ?auto_68009 ?auto_68011 ) ) ( not ( = ?auto_68010 ?auto_68011 ) ) ( ON ?auto_68006 ?auto_68005 ) ( ON-TABLE ?auto_68011 ) ( ON ?auto_68007 ?auto_68006 ) ( ON ?auto_68008 ?auto_68007 ) ( CLEAR ?auto_68010 ) ( ON ?auto_68009 ?auto_68008 ) ( CLEAR ?auto_68009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68011 ?auto_68005 ?auto_68006 ?auto_68007 ?auto_68008 )
      ( MAKE-4PILE ?auto_68005 ?auto_68006 ?auto_68007 ?auto_68008 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68012 - BLOCK
      ?auto_68013 - BLOCK
      ?auto_68014 - BLOCK
      ?auto_68015 - BLOCK
    )
    :vars
    (
      ?auto_68018 - BLOCK
      ?auto_68017 - BLOCK
      ?auto_68016 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68012 ?auto_68013 ) ) ( not ( = ?auto_68012 ?auto_68014 ) ) ( not ( = ?auto_68012 ?auto_68015 ) ) ( not ( = ?auto_68013 ?auto_68014 ) ) ( not ( = ?auto_68013 ?auto_68015 ) ) ( not ( = ?auto_68014 ?auto_68015 ) ) ( not ( = ?auto_68012 ?auto_68018 ) ) ( not ( = ?auto_68013 ?auto_68018 ) ) ( not ( = ?auto_68014 ?auto_68018 ) ) ( not ( = ?auto_68015 ?auto_68018 ) ) ( not ( = ?auto_68017 ?auto_68018 ) ) ( not ( = ?auto_68017 ?auto_68015 ) ) ( not ( = ?auto_68017 ?auto_68014 ) ) ( not ( = ?auto_68012 ?auto_68017 ) ) ( not ( = ?auto_68013 ?auto_68017 ) ) ( ON ?auto_68012 ?auto_68016 ) ( not ( = ?auto_68012 ?auto_68016 ) ) ( not ( = ?auto_68013 ?auto_68016 ) ) ( not ( = ?auto_68014 ?auto_68016 ) ) ( not ( = ?auto_68015 ?auto_68016 ) ) ( not ( = ?auto_68018 ?auto_68016 ) ) ( not ( = ?auto_68017 ?auto_68016 ) ) ( ON ?auto_68013 ?auto_68012 ) ( ON-TABLE ?auto_68016 ) ( ON ?auto_68014 ?auto_68013 ) ( ON ?auto_68015 ?auto_68014 ) ( ON ?auto_68018 ?auto_68015 ) ( CLEAR ?auto_68018 ) ( HOLDING ?auto_68017 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68017 )
      ( MAKE-4PILE ?auto_68012 ?auto_68013 ?auto_68014 ?auto_68015 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68019 - BLOCK
      ?auto_68020 - BLOCK
      ?auto_68021 - BLOCK
      ?auto_68022 - BLOCK
    )
    :vars
    (
      ?auto_68024 - BLOCK
      ?auto_68023 - BLOCK
      ?auto_68025 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68019 ?auto_68020 ) ) ( not ( = ?auto_68019 ?auto_68021 ) ) ( not ( = ?auto_68019 ?auto_68022 ) ) ( not ( = ?auto_68020 ?auto_68021 ) ) ( not ( = ?auto_68020 ?auto_68022 ) ) ( not ( = ?auto_68021 ?auto_68022 ) ) ( not ( = ?auto_68019 ?auto_68024 ) ) ( not ( = ?auto_68020 ?auto_68024 ) ) ( not ( = ?auto_68021 ?auto_68024 ) ) ( not ( = ?auto_68022 ?auto_68024 ) ) ( not ( = ?auto_68023 ?auto_68024 ) ) ( not ( = ?auto_68023 ?auto_68022 ) ) ( not ( = ?auto_68023 ?auto_68021 ) ) ( not ( = ?auto_68019 ?auto_68023 ) ) ( not ( = ?auto_68020 ?auto_68023 ) ) ( ON ?auto_68019 ?auto_68025 ) ( not ( = ?auto_68019 ?auto_68025 ) ) ( not ( = ?auto_68020 ?auto_68025 ) ) ( not ( = ?auto_68021 ?auto_68025 ) ) ( not ( = ?auto_68022 ?auto_68025 ) ) ( not ( = ?auto_68024 ?auto_68025 ) ) ( not ( = ?auto_68023 ?auto_68025 ) ) ( ON ?auto_68020 ?auto_68019 ) ( ON-TABLE ?auto_68025 ) ( ON ?auto_68021 ?auto_68020 ) ( ON ?auto_68022 ?auto_68021 ) ( ON ?auto_68024 ?auto_68022 ) ( ON ?auto_68023 ?auto_68024 ) ( CLEAR ?auto_68023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_68025 ?auto_68019 ?auto_68020 ?auto_68021 ?auto_68022 ?auto_68024 )
      ( MAKE-4PILE ?auto_68019 ?auto_68020 ?auto_68021 ?auto_68022 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68027 - BLOCK
    )
    :vars
    (
      ?auto_68028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68028 ?auto_68027 ) ( CLEAR ?auto_68028 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68027 ) ( not ( = ?auto_68027 ?auto_68028 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68028 ?auto_68027 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68029 - BLOCK
    )
    :vars
    (
      ?auto_68030 - BLOCK
      ?auto_68031 - BLOCK
      ?auto_68032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68030 ?auto_68029 ) ( CLEAR ?auto_68030 ) ( ON-TABLE ?auto_68029 ) ( not ( = ?auto_68029 ?auto_68030 ) ) ( HOLDING ?auto_68031 ) ( CLEAR ?auto_68032 ) ( not ( = ?auto_68029 ?auto_68031 ) ) ( not ( = ?auto_68029 ?auto_68032 ) ) ( not ( = ?auto_68030 ?auto_68031 ) ) ( not ( = ?auto_68030 ?auto_68032 ) ) ( not ( = ?auto_68031 ?auto_68032 ) ) )
    :subtasks
    ( ( !STACK ?auto_68031 ?auto_68032 )
      ( MAKE-1PILE ?auto_68029 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68033 - BLOCK
    )
    :vars
    (
      ?auto_68034 - BLOCK
      ?auto_68035 - BLOCK
      ?auto_68036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68034 ?auto_68033 ) ( ON-TABLE ?auto_68033 ) ( not ( = ?auto_68033 ?auto_68034 ) ) ( CLEAR ?auto_68035 ) ( not ( = ?auto_68033 ?auto_68036 ) ) ( not ( = ?auto_68033 ?auto_68035 ) ) ( not ( = ?auto_68034 ?auto_68036 ) ) ( not ( = ?auto_68034 ?auto_68035 ) ) ( not ( = ?auto_68036 ?auto_68035 ) ) ( ON ?auto_68036 ?auto_68034 ) ( CLEAR ?auto_68036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68033 ?auto_68034 )
      ( MAKE-1PILE ?auto_68033 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68037 - BLOCK
    )
    :vars
    (
      ?auto_68039 - BLOCK
      ?auto_68040 - BLOCK
      ?auto_68038 - BLOCK
      ?auto_68042 - BLOCK
      ?auto_68041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68039 ?auto_68037 ) ( ON-TABLE ?auto_68037 ) ( not ( = ?auto_68037 ?auto_68039 ) ) ( not ( = ?auto_68037 ?auto_68040 ) ) ( not ( = ?auto_68037 ?auto_68038 ) ) ( not ( = ?auto_68039 ?auto_68040 ) ) ( not ( = ?auto_68039 ?auto_68038 ) ) ( not ( = ?auto_68040 ?auto_68038 ) ) ( ON ?auto_68040 ?auto_68039 ) ( CLEAR ?auto_68040 ) ( HOLDING ?auto_68038 ) ( CLEAR ?auto_68042 ) ( ON-TABLE ?auto_68041 ) ( ON ?auto_68042 ?auto_68041 ) ( not ( = ?auto_68041 ?auto_68042 ) ) ( not ( = ?auto_68041 ?auto_68038 ) ) ( not ( = ?auto_68042 ?auto_68038 ) ) ( not ( = ?auto_68037 ?auto_68042 ) ) ( not ( = ?auto_68037 ?auto_68041 ) ) ( not ( = ?auto_68039 ?auto_68042 ) ) ( not ( = ?auto_68039 ?auto_68041 ) ) ( not ( = ?auto_68040 ?auto_68042 ) ) ( not ( = ?auto_68040 ?auto_68041 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68041 ?auto_68042 ?auto_68038 )
      ( MAKE-1PILE ?auto_68037 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68043 - BLOCK
    )
    :vars
    (
      ?auto_68046 - BLOCK
      ?auto_68047 - BLOCK
      ?auto_68044 - BLOCK
      ?auto_68045 - BLOCK
      ?auto_68048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68046 ?auto_68043 ) ( ON-TABLE ?auto_68043 ) ( not ( = ?auto_68043 ?auto_68046 ) ) ( not ( = ?auto_68043 ?auto_68047 ) ) ( not ( = ?auto_68043 ?auto_68044 ) ) ( not ( = ?auto_68046 ?auto_68047 ) ) ( not ( = ?auto_68046 ?auto_68044 ) ) ( not ( = ?auto_68047 ?auto_68044 ) ) ( ON ?auto_68047 ?auto_68046 ) ( CLEAR ?auto_68045 ) ( ON-TABLE ?auto_68048 ) ( ON ?auto_68045 ?auto_68048 ) ( not ( = ?auto_68048 ?auto_68045 ) ) ( not ( = ?auto_68048 ?auto_68044 ) ) ( not ( = ?auto_68045 ?auto_68044 ) ) ( not ( = ?auto_68043 ?auto_68045 ) ) ( not ( = ?auto_68043 ?auto_68048 ) ) ( not ( = ?auto_68046 ?auto_68045 ) ) ( not ( = ?auto_68046 ?auto_68048 ) ) ( not ( = ?auto_68047 ?auto_68045 ) ) ( not ( = ?auto_68047 ?auto_68048 ) ) ( ON ?auto_68044 ?auto_68047 ) ( CLEAR ?auto_68044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68043 ?auto_68046 ?auto_68047 )
      ( MAKE-1PILE ?auto_68043 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68049 - BLOCK
    )
    :vars
    (
      ?auto_68050 - BLOCK
      ?auto_68052 - BLOCK
      ?auto_68054 - BLOCK
      ?auto_68051 - BLOCK
      ?auto_68053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68050 ?auto_68049 ) ( ON-TABLE ?auto_68049 ) ( not ( = ?auto_68049 ?auto_68050 ) ) ( not ( = ?auto_68049 ?auto_68052 ) ) ( not ( = ?auto_68049 ?auto_68054 ) ) ( not ( = ?auto_68050 ?auto_68052 ) ) ( not ( = ?auto_68050 ?auto_68054 ) ) ( not ( = ?auto_68052 ?auto_68054 ) ) ( ON ?auto_68052 ?auto_68050 ) ( ON-TABLE ?auto_68051 ) ( not ( = ?auto_68051 ?auto_68053 ) ) ( not ( = ?auto_68051 ?auto_68054 ) ) ( not ( = ?auto_68053 ?auto_68054 ) ) ( not ( = ?auto_68049 ?auto_68053 ) ) ( not ( = ?auto_68049 ?auto_68051 ) ) ( not ( = ?auto_68050 ?auto_68053 ) ) ( not ( = ?auto_68050 ?auto_68051 ) ) ( not ( = ?auto_68052 ?auto_68053 ) ) ( not ( = ?auto_68052 ?auto_68051 ) ) ( ON ?auto_68054 ?auto_68052 ) ( CLEAR ?auto_68054 ) ( HOLDING ?auto_68053 ) ( CLEAR ?auto_68051 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68051 ?auto_68053 )
      ( MAKE-1PILE ?auto_68049 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68055 - BLOCK
    )
    :vars
    (
      ?auto_68060 - BLOCK
      ?auto_68056 - BLOCK
      ?auto_68059 - BLOCK
      ?auto_68057 - BLOCK
      ?auto_68058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68060 ?auto_68055 ) ( ON-TABLE ?auto_68055 ) ( not ( = ?auto_68055 ?auto_68060 ) ) ( not ( = ?auto_68055 ?auto_68056 ) ) ( not ( = ?auto_68055 ?auto_68059 ) ) ( not ( = ?auto_68060 ?auto_68056 ) ) ( not ( = ?auto_68060 ?auto_68059 ) ) ( not ( = ?auto_68056 ?auto_68059 ) ) ( ON ?auto_68056 ?auto_68060 ) ( ON-TABLE ?auto_68057 ) ( not ( = ?auto_68057 ?auto_68058 ) ) ( not ( = ?auto_68057 ?auto_68059 ) ) ( not ( = ?auto_68058 ?auto_68059 ) ) ( not ( = ?auto_68055 ?auto_68058 ) ) ( not ( = ?auto_68055 ?auto_68057 ) ) ( not ( = ?auto_68060 ?auto_68058 ) ) ( not ( = ?auto_68060 ?auto_68057 ) ) ( not ( = ?auto_68056 ?auto_68058 ) ) ( not ( = ?auto_68056 ?auto_68057 ) ) ( ON ?auto_68059 ?auto_68056 ) ( CLEAR ?auto_68057 ) ( ON ?auto_68058 ?auto_68059 ) ( CLEAR ?auto_68058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68055 ?auto_68060 ?auto_68056 ?auto_68059 )
      ( MAKE-1PILE ?auto_68055 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68061 - BLOCK
    )
    :vars
    (
      ?auto_68062 - BLOCK
      ?auto_68066 - BLOCK
      ?auto_68064 - BLOCK
      ?auto_68065 - BLOCK
      ?auto_68063 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68062 ?auto_68061 ) ( ON-TABLE ?auto_68061 ) ( not ( = ?auto_68061 ?auto_68062 ) ) ( not ( = ?auto_68061 ?auto_68066 ) ) ( not ( = ?auto_68061 ?auto_68064 ) ) ( not ( = ?auto_68062 ?auto_68066 ) ) ( not ( = ?auto_68062 ?auto_68064 ) ) ( not ( = ?auto_68066 ?auto_68064 ) ) ( ON ?auto_68066 ?auto_68062 ) ( not ( = ?auto_68065 ?auto_68063 ) ) ( not ( = ?auto_68065 ?auto_68064 ) ) ( not ( = ?auto_68063 ?auto_68064 ) ) ( not ( = ?auto_68061 ?auto_68063 ) ) ( not ( = ?auto_68061 ?auto_68065 ) ) ( not ( = ?auto_68062 ?auto_68063 ) ) ( not ( = ?auto_68062 ?auto_68065 ) ) ( not ( = ?auto_68066 ?auto_68063 ) ) ( not ( = ?auto_68066 ?auto_68065 ) ) ( ON ?auto_68064 ?auto_68066 ) ( ON ?auto_68063 ?auto_68064 ) ( CLEAR ?auto_68063 ) ( HOLDING ?auto_68065 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68065 )
      ( MAKE-1PILE ?auto_68061 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68067 - BLOCK
    )
    :vars
    (
      ?auto_68069 - BLOCK
      ?auto_68068 - BLOCK
      ?auto_68070 - BLOCK
      ?auto_68072 - BLOCK
      ?auto_68071 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68069 ?auto_68067 ) ( ON-TABLE ?auto_68067 ) ( not ( = ?auto_68067 ?auto_68069 ) ) ( not ( = ?auto_68067 ?auto_68068 ) ) ( not ( = ?auto_68067 ?auto_68070 ) ) ( not ( = ?auto_68069 ?auto_68068 ) ) ( not ( = ?auto_68069 ?auto_68070 ) ) ( not ( = ?auto_68068 ?auto_68070 ) ) ( ON ?auto_68068 ?auto_68069 ) ( not ( = ?auto_68072 ?auto_68071 ) ) ( not ( = ?auto_68072 ?auto_68070 ) ) ( not ( = ?auto_68071 ?auto_68070 ) ) ( not ( = ?auto_68067 ?auto_68071 ) ) ( not ( = ?auto_68067 ?auto_68072 ) ) ( not ( = ?auto_68069 ?auto_68071 ) ) ( not ( = ?auto_68069 ?auto_68072 ) ) ( not ( = ?auto_68068 ?auto_68071 ) ) ( not ( = ?auto_68068 ?auto_68072 ) ) ( ON ?auto_68070 ?auto_68068 ) ( ON ?auto_68071 ?auto_68070 ) ( ON ?auto_68072 ?auto_68071 ) ( CLEAR ?auto_68072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68067 ?auto_68069 ?auto_68068 ?auto_68070 ?auto_68071 )
      ( MAKE-1PILE ?auto_68067 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68073 - BLOCK
    )
    :vars
    (
      ?auto_68074 - BLOCK
      ?auto_68075 - BLOCK
      ?auto_68077 - BLOCK
      ?auto_68078 - BLOCK
      ?auto_68076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68074 ?auto_68073 ) ( ON-TABLE ?auto_68073 ) ( not ( = ?auto_68073 ?auto_68074 ) ) ( not ( = ?auto_68073 ?auto_68075 ) ) ( not ( = ?auto_68073 ?auto_68077 ) ) ( not ( = ?auto_68074 ?auto_68075 ) ) ( not ( = ?auto_68074 ?auto_68077 ) ) ( not ( = ?auto_68075 ?auto_68077 ) ) ( ON ?auto_68075 ?auto_68074 ) ( not ( = ?auto_68078 ?auto_68076 ) ) ( not ( = ?auto_68078 ?auto_68077 ) ) ( not ( = ?auto_68076 ?auto_68077 ) ) ( not ( = ?auto_68073 ?auto_68076 ) ) ( not ( = ?auto_68073 ?auto_68078 ) ) ( not ( = ?auto_68074 ?auto_68076 ) ) ( not ( = ?auto_68074 ?auto_68078 ) ) ( not ( = ?auto_68075 ?auto_68076 ) ) ( not ( = ?auto_68075 ?auto_68078 ) ) ( ON ?auto_68077 ?auto_68075 ) ( ON ?auto_68076 ?auto_68077 ) ( HOLDING ?auto_68078 ) ( CLEAR ?auto_68076 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_68073 ?auto_68074 ?auto_68075 ?auto_68077 ?auto_68076 ?auto_68078 )
      ( MAKE-1PILE ?auto_68073 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68079 - BLOCK
    )
    :vars
    (
      ?auto_68084 - BLOCK
      ?auto_68083 - BLOCK
      ?auto_68081 - BLOCK
      ?auto_68082 - BLOCK
      ?auto_68080 - BLOCK
      ?auto_68085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68084 ?auto_68079 ) ( ON-TABLE ?auto_68079 ) ( not ( = ?auto_68079 ?auto_68084 ) ) ( not ( = ?auto_68079 ?auto_68083 ) ) ( not ( = ?auto_68079 ?auto_68081 ) ) ( not ( = ?auto_68084 ?auto_68083 ) ) ( not ( = ?auto_68084 ?auto_68081 ) ) ( not ( = ?auto_68083 ?auto_68081 ) ) ( ON ?auto_68083 ?auto_68084 ) ( not ( = ?auto_68082 ?auto_68080 ) ) ( not ( = ?auto_68082 ?auto_68081 ) ) ( not ( = ?auto_68080 ?auto_68081 ) ) ( not ( = ?auto_68079 ?auto_68080 ) ) ( not ( = ?auto_68079 ?auto_68082 ) ) ( not ( = ?auto_68084 ?auto_68080 ) ) ( not ( = ?auto_68084 ?auto_68082 ) ) ( not ( = ?auto_68083 ?auto_68080 ) ) ( not ( = ?auto_68083 ?auto_68082 ) ) ( ON ?auto_68081 ?auto_68083 ) ( ON ?auto_68080 ?auto_68081 ) ( CLEAR ?auto_68080 ) ( ON ?auto_68082 ?auto_68085 ) ( CLEAR ?auto_68082 ) ( HAND-EMPTY ) ( not ( = ?auto_68079 ?auto_68085 ) ) ( not ( = ?auto_68084 ?auto_68085 ) ) ( not ( = ?auto_68083 ?auto_68085 ) ) ( not ( = ?auto_68081 ?auto_68085 ) ) ( not ( = ?auto_68082 ?auto_68085 ) ) ( not ( = ?auto_68080 ?auto_68085 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68082 ?auto_68085 )
      ( MAKE-1PILE ?auto_68079 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68086 - BLOCK
    )
    :vars
    (
      ?auto_68092 - BLOCK
      ?auto_68091 - BLOCK
      ?auto_68087 - BLOCK
      ?auto_68089 - BLOCK
      ?auto_68090 - BLOCK
      ?auto_68088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68092 ?auto_68086 ) ( ON-TABLE ?auto_68086 ) ( not ( = ?auto_68086 ?auto_68092 ) ) ( not ( = ?auto_68086 ?auto_68091 ) ) ( not ( = ?auto_68086 ?auto_68087 ) ) ( not ( = ?auto_68092 ?auto_68091 ) ) ( not ( = ?auto_68092 ?auto_68087 ) ) ( not ( = ?auto_68091 ?auto_68087 ) ) ( ON ?auto_68091 ?auto_68092 ) ( not ( = ?auto_68089 ?auto_68090 ) ) ( not ( = ?auto_68089 ?auto_68087 ) ) ( not ( = ?auto_68090 ?auto_68087 ) ) ( not ( = ?auto_68086 ?auto_68090 ) ) ( not ( = ?auto_68086 ?auto_68089 ) ) ( not ( = ?auto_68092 ?auto_68090 ) ) ( not ( = ?auto_68092 ?auto_68089 ) ) ( not ( = ?auto_68091 ?auto_68090 ) ) ( not ( = ?auto_68091 ?auto_68089 ) ) ( ON ?auto_68087 ?auto_68091 ) ( ON ?auto_68089 ?auto_68088 ) ( CLEAR ?auto_68089 ) ( not ( = ?auto_68086 ?auto_68088 ) ) ( not ( = ?auto_68092 ?auto_68088 ) ) ( not ( = ?auto_68091 ?auto_68088 ) ) ( not ( = ?auto_68087 ?auto_68088 ) ) ( not ( = ?auto_68089 ?auto_68088 ) ) ( not ( = ?auto_68090 ?auto_68088 ) ) ( HOLDING ?auto_68090 ) ( CLEAR ?auto_68087 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68086 ?auto_68092 ?auto_68091 ?auto_68087 ?auto_68090 )
      ( MAKE-1PILE ?auto_68086 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68093 - BLOCK
    )
    :vars
    (
      ?auto_68097 - BLOCK
      ?auto_68094 - BLOCK
      ?auto_68095 - BLOCK
      ?auto_68098 - BLOCK
      ?auto_68099 - BLOCK
      ?auto_68096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68097 ?auto_68093 ) ( ON-TABLE ?auto_68093 ) ( not ( = ?auto_68093 ?auto_68097 ) ) ( not ( = ?auto_68093 ?auto_68094 ) ) ( not ( = ?auto_68093 ?auto_68095 ) ) ( not ( = ?auto_68097 ?auto_68094 ) ) ( not ( = ?auto_68097 ?auto_68095 ) ) ( not ( = ?auto_68094 ?auto_68095 ) ) ( ON ?auto_68094 ?auto_68097 ) ( not ( = ?auto_68098 ?auto_68099 ) ) ( not ( = ?auto_68098 ?auto_68095 ) ) ( not ( = ?auto_68099 ?auto_68095 ) ) ( not ( = ?auto_68093 ?auto_68099 ) ) ( not ( = ?auto_68093 ?auto_68098 ) ) ( not ( = ?auto_68097 ?auto_68099 ) ) ( not ( = ?auto_68097 ?auto_68098 ) ) ( not ( = ?auto_68094 ?auto_68099 ) ) ( not ( = ?auto_68094 ?auto_68098 ) ) ( ON ?auto_68095 ?auto_68094 ) ( ON ?auto_68098 ?auto_68096 ) ( not ( = ?auto_68093 ?auto_68096 ) ) ( not ( = ?auto_68097 ?auto_68096 ) ) ( not ( = ?auto_68094 ?auto_68096 ) ) ( not ( = ?auto_68095 ?auto_68096 ) ) ( not ( = ?auto_68098 ?auto_68096 ) ) ( not ( = ?auto_68099 ?auto_68096 ) ) ( CLEAR ?auto_68095 ) ( ON ?auto_68099 ?auto_68098 ) ( CLEAR ?auto_68099 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68096 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68096 ?auto_68098 )
      ( MAKE-1PILE ?auto_68093 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68100 - BLOCK
    )
    :vars
    (
      ?auto_68101 - BLOCK
      ?auto_68103 - BLOCK
      ?auto_68106 - BLOCK
      ?auto_68104 - BLOCK
      ?auto_68102 - BLOCK
      ?auto_68105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68101 ?auto_68100 ) ( ON-TABLE ?auto_68100 ) ( not ( = ?auto_68100 ?auto_68101 ) ) ( not ( = ?auto_68100 ?auto_68103 ) ) ( not ( = ?auto_68100 ?auto_68106 ) ) ( not ( = ?auto_68101 ?auto_68103 ) ) ( not ( = ?auto_68101 ?auto_68106 ) ) ( not ( = ?auto_68103 ?auto_68106 ) ) ( ON ?auto_68103 ?auto_68101 ) ( not ( = ?auto_68104 ?auto_68102 ) ) ( not ( = ?auto_68104 ?auto_68106 ) ) ( not ( = ?auto_68102 ?auto_68106 ) ) ( not ( = ?auto_68100 ?auto_68102 ) ) ( not ( = ?auto_68100 ?auto_68104 ) ) ( not ( = ?auto_68101 ?auto_68102 ) ) ( not ( = ?auto_68101 ?auto_68104 ) ) ( not ( = ?auto_68103 ?auto_68102 ) ) ( not ( = ?auto_68103 ?auto_68104 ) ) ( ON ?auto_68104 ?auto_68105 ) ( not ( = ?auto_68100 ?auto_68105 ) ) ( not ( = ?auto_68101 ?auto_68105 ) ) ( not ( = ?auto_68103 ?auto_68105 ) ) ( not ( = ?auto_68106 ?auto_68105 ) ) ( not ( = ?auto_68104 ?auto_68105 ) ) ( not ( = ?auto_68102 ?auto_68105 ) ) ( ON ?auto_68102 ?auto_68104 ) ( CLEAR ?auto_68102 ) ( ON-TABLE ?auto_68105 ) ( HOLDING ?auto_68106 ) ( CLEAR ?auto_68103 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68100 ?auto_68101 ?auto_68103 ?auto_68106 )
      ( MAKE-1PILE ?auto_68100 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68107 - BLOCK
    )
    :vars
    (
      ?auto_68113 - BLOCK
      ?auto_68111 - BLOCK
      ?auto_68108 - BLOCK
      ?auto_68109 - BLOCK
      ?auto_68110 - BLOCK
      ?auto_68112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68113 ?auto_68107 ) ( ON-TABLE ?auto_68107 ) ( not ( = ?auto_68107 ?auto_68113 ) ) ( not ( = ?auto_68107 ?auto_68111 ) ) ( not ( = ?auto_68107 ?auto_68108 ) ) ( not ( = ?auto_68113 ?auto_68111 ) ) ( not ( = ?auto_68113 ?auto_68108 ) ) ( not ( = ?auto_68111 ?auto_68108 ) ) ( ON ?auto_68111 ?auto_68113 ) ( not ( = ?auto_68109 ?auto_68110 ) ) ( not ( = ?auto_68109 ?auto_68108 ) ) ( not ( = ?auto_68110 ?auto_68108 ) ) ( not ( = ?auto_68107 ?auto_68110 ) ) ( not ( = ?auto_68107 ?auto_68109 ) ) ( not ( = ?auto_68113 ?auto_68110 ) ) ( not ( = ?auto_68113 ?auto_68109 ) ) ( not ( = ?auto_68111 ?auto_68110 ) ) ( not ( = ?auto_68111 ?auto_68109 ) ) ( ON ?auto_68109 ?auto_68112 ) ( not ( = ?auto_68107 ?auto_68112 ) ) ( not ( = ?auto_68113 ?auto_68112 ) ) ( not ( = ?auto_68111 ?auto_68112 ) ) ( not ( = ?auto_68108 ?auto_68112 ) ) ( not ( = ?auto_68109 ?auto_68112 ) ) ( not ( = ?auto_68110 ?auto_68112 ) ) ( ON ?auto_68110 ?auto_68109 ) ( ON-TABLE ?auto_68112 ) ( CLEAR ?auto_68111 ) ( ON ?auto_68108 ?auto_68110 ) ( CLEAR ?auto_68108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68112 ?auto_68109 ?auto_68110 )
      ( MAKE-1PILE ?auto_68107 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68114 - BLOCK
    )
    :vars
    (
      ?auto_68120 - BLOCK
      ?auto_68117 - BLOCK
      ?auto_68118 - BLOCK
      ?auto_68116 - BLOCK
      ?auto_68119 - BLOCK
      ?auto_68115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68120 ?auto_68114 ) ( ON-TABLE ?auto_68114 ) ( not ( = ?auto_68114 ?auto_68120 ) ) ( not ( = ?auto_68114 ?auto_68117 ) ) ( not ( = ?auto_68114 ?auto_68118 ) ) ( not ( = ?auto_68120 ?auto_68117 ) ) ( not ( = ?auto_68120 ?auto_68118 ) ) ( not ( = ?auto_68117 ?auto_68118 ) ) ( not ( = ?auto_68116 ?auto_68119 ) ) ( not ( = ?auto_68116 ?auto_68118 ) ) ( not ( = ?auto_68119 ?auto_68118 ) ) ( not ( = ?auto_68114 ?auto_68119 ) ) ( not ( = ?auto_68114 ?auto_68116 ) ) ( not ( = ?auto_68120 ?auto_68119 ) ) ( not ( = ?auto_68120 ?auto_68116 ) ) ( not ( = ?auto_68117 ?auto_68119 ) ) ( not ( = ?auto_68117 ?auto_68116 ) ) ( ON ?auto_68116 ?auto_68115 ) ( not ( = ?auto_68114 ?auto_68115 ) ) ( not ( = ?auto_68120 ?auto_68115 ) ) ( not ( = ?auto_68117 ?auto_68115 ) ) ( not ( = ?auto_68118 ?auto_68115 ) ) ( not ( = ?auto_68116 ?auto_68115 ) ) ( not ( = ?auto_68119 ?auto_68115 ) ) ( ON ?auto_68119 ?auto_68116 ) ( ON-TABLE ?auto_68115 ) ( ON ?auto_68118 ?auto_68119 ) ( CLEAR ?auto_68118 ) ( HOLDING ?auto_68117 ) ( CLEAR ?auto_68120 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68114 ?auto_68120 ?auto_68117 )
      ( MAKE-1PILE ?auto_68114 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68121 - BLOCK
    )
    :vars
    (
      ?auto_68125 - BLOCK
      ?auto_68126 - BLOCK
      ?auto_68127 - BLOCK
      ?auto_68124 - BLOCK
      ?auto_68122 - BLOCK
      ?auto_68123 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68125 ?auto_68121 ) ( ON-TABLE ?auto_68121 ) ( not ( = ?auto_68121 ?auto_68125 ) ) ( not ( = ?auto_68121 ?auto_68126 ) ) ( not ( = ?auto_68121 ?auto_68127 ) ) ( not ( = ?auto_68125 ?auto_68126 ) ) ( not ( = ?auto_68125 ?auto_68127 ) ) ( not ( = ?auto_68126 ?auto_68127 ) ) ( not ( = ?auto_68124 ?auto_68122 ) ) ( not ( = ?auto_68124 ?auto_68127 ) ) ( not ( = ?auto_68122 ?auto_68127 ) ) ( not ( = ?auto_68121 ?auto_68122 ) ) ( not ( = ?auto_68121 ?auto_68124 ) ) ( not ( = ?auto_68125 ?auto_68122 ) ) ( not ( = ?auto_68125 ?auto_68124 ) ) ( not ( = ?auto_68126 ?auto_68122 ) ) ( not ( = ?auto_68126 ?auto_68124 ) ) ( ON ?auto_68124 ?auto_68123 ) ( not ( = ?auto_68121 ?auto_68123 ) ) ( not ( = ?auto_68125 ?auto_68123 ) ) ( not ( = ?auto_68126 ?auto_68123 ) ) ( not ( = ?auto_68127 ?auto_68123 ) ) ( not ( = ?auto_68124 ?auto_68123 ) ) ( not ( = ?auto_68122 ?auto_68123 ) ) ( ON ?auto_68122 ?auto_68124 ) ( ON-TABLE ?auto_68123 ) ( ON ?auto_68127 ?auto_68122 ) ( CLEAR ?auto_68125 ) ( ON ?auto_68126 ?auto_68127 ) ( CLEAR ?auto_68126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68123 ?auto_68124 ?auto_68122 ?auto_68127 )
      ( MAKE-1PILE ?auto_68121 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68142 - BLOCK
    )
    :vars
    (
      ?auto_68143 - BLOCK
      ?auto_68146 - BLOCK
      ?auto_68147 - BLOCK
      ?auto_68148 - BLOCK
      ?auto_68145 - BLOCK
      ?auto_68144 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68142 ?auto_68143 ) ) ( not ( = ?auto_68142 ?auto_68146 ) ) ( not ( = ?auto_68142 ?auto_68147 ) ) ( not ( = ?auto_68143 ?auto_68146 ) ) ( not ( = ?auto_68143 ?auto_68147 ) ) ( not ( = ?auto_68146 ?auto_68147 ) ) ( not ( = ?auto_68148 ?auto_68145 ) ) ( not ( = ?auto_68148 ?auto_68147 ) ) ( not ( = ?auto_68145 ?auto_68147 ) ) ( not ( = ?auto_68142 ?auto_68145 ) ) ( not ( = ?auto_68142 ?auto_68148 ) ) ( not ( = ?auto_68143 ?auto_68145 ) ) ( not ( = ?auto_68143 ?auto_68148 ) ) ( not ( = ?auto_68146 ?auto_68145 ) ) ( not ( = ?auto_68146 ?auto_68148 ) ) ( ON ?auto_68148 ?auto_68144 ) ( not ( = ?auto_68142 ?auto_68144 ) ) ( not ( = ?auto_68143 ?auto_68144 ) ) ( not ( = ?auto_68146 ?auto_68144 ) ) ( not ( = ?auto_68147 ?auto_68144 ) ) ( not ( = ?auto_68148 ?auto_68144 ) ) ( not ( = ?auto_68145 ?auto_68144 ) ) ( ON ?auto_68145 ?auto_68148 ) ( ON-TABLE ?auto_68144 ) ( ON ?auto_68147 ?auto_68145 ) ( ON ?auto_68146 ?auto_68147 ) ( ON ?auto_68143 ?auto_68146 ) ( CLEAR ?auto_68143 ) ( HOLDING ?auto_68142 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68142 ?auto_68143 )
      ( MAKE-1PILE ?auto_68142 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68149 - BLOCK
    )
    :vars
    (
      ?auto_68154 - BLOCK
      ?auto_68151 - BLOCK
      ?auto_68152 - BLOCK
      ?auto_68150 - BLOCK
      ?auto_68155 - BLOCK
      ?auto_68153 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68149 ?auto_68154 ) ) ( not ( = ?auto_68149 ?auto_68151 ) ) ( not ( = ?auto_68149 ?auto_68152 ) ) ( not ( = ?auto_68154 ?auto_68151 ) ) ( not ( = ?auto_68154 ?auto_68152 ) ) ( not ( = ?auto_68151 ?auto_68152 ) ) ( not ( = ?auto_68150 ?auto_68155 ) ) ( not ( = ?auto_68150 ?auto_68152 ) ) ( not ( = ?auto_68155 ?auto_68152 ) ) ( not ( = ?auto_68149 ?auto_68155 ) ) ( not ( = ?auto_68149 ?auto_68150 ) ) ( not ( = ?auto_68154 ?auto_68155 ) ) ( not ( = ?auto_68154 ?auto_68150 ) ) ( not ( = ?auto_68151 ?auto_68155 ) ) ( not ( = ?auto_68151 ?auto_68150 ) ) ( ON ?auto_68150 ?auto_68153 ) ( not ( = ?auto_68149 ?auto_68153 ) ) ( not ( = ?auto_68154 ?auto_68153 ) ) ( not ( = ?auto_68151 ?auto_68153 ) ) ( not ( = ?auto_68152 ?auto_68153 ) ) ( not ( = ?auto_68150 ?auto_68153 ) ) ( not ( = ?auto_68155 ?auto_68153 ) ) ( ON ?auto_68155 ?auto_68150 ) ( ON-TABLE ?auto_68153 ) ( ON ?auto_68152 ?auto_68155 ) ( ON ?auto_68151 ?auto_68152 ) ( ON ?auto_68154 ?auto_68151 ) ( ON ?auto_68149 ?auto_68154 ) ( CLEAR ?auto_68149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_68153 ?auto_68150 ?auto_68155 ?auto_68152 ?auto_68151 ?auto_68154 )
      ( MAKE-1PILE ?auto_68149 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68161 - BLOCK
      ?auto_68162 - BLOCK
      ?auto_68163 - BLOCK
      ?auto_68164 - BLOCK
      ?auto_68165 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_68165 ) ( CLEAR ?auto_68164 ) ( ON-TABLE ?auto_68161 ) ( ON ?auto_68162 ?auto_68161 ) ( ON ?auto_68163 ?auto_68162 ) ( ON ?auto_68164 ?auto_68163 ) ( not ( = ?auto_68161 ?auto_68162 ) ) ( not ( = ?auto_68161 ?auto_68163 ) ) ( not ( = ?auto_68161 ?auto_68164 ) ) ( not ( = ?auto_68161 ?auto_68165 ) ) ( not ( = ?auto_68162 ?auto_68163 ) ) ( not ( = ?auto_68162 ?auto_68164 ) ) ( not ( = ?auto_68162 ?auto_68165 ) ) ( not ( = ?auto_68163 ?auto_68164 ) ) ( not ( = ?auto_68163 ?auto_68165 ) ) ( not ( = ?auto_68164 ?auto_68165 ) ) )
    :subtasks
    ( ( !STACK ?auto_68165 ?auto_68164 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68166 - BLOCK
      ?auto_68167 - BLOCK
      ?auto_68168 - BLOCK
      ?auto_68169 - BLOCK
      ?auto_68170 - BLOCK
    )
    :vars
    (
      ?auto_68171 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_68169 ) ( ON-TABLE ?auto_68166 ) ( ON ?auto_68167 ?auto_68166 ) ( ON ?auto_68168 ?auto_68167 ) ( ON ?auto_68169 ?auto_68168 ) ( not ( = ?auto_68166 ?auto_68167 ) ) ( not ( = ?auto_68166 ?auto_68168 ) ) ( not ( = ?auto_68166 ?auto_68169 ) ) ( not ( = ?auto_68166 ?auto_68170 ) ) ( not ( = ?auto_68167 ?auto_68168 ) ) ( not ( = ?auto_68167 ?auto_68169 ) ) ( not ( = ?auto_68167 ?auto_68170 ) ) ( not ( = ?auto_68168 ?auto_68169 ) ) ( not ( = ?auto_68168 ?auto_68170 ) ) ( not ( = ?auto_68169 ?auto_68170 ) ) ( ON ?auto_68170 ?auto_68171 ) ( CLEAR ?auto_68170 ) ( HAND-EMPTY ) ( not ( = ?auto_68166 ?auto_68171 ) ) ( not ( = ?auto_68167 ?auto_68171 ) ) ( not ( = ?auto_68168 ?auto_68171 ) ) ( not ( = ?auto_68169 ?auto_68171 ) ) ( not ( = ?auto_68170 ?auto_68171 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68170 ?auto_68171 )
      ( MAKE-5PILE ?auto_68166 ?auto_68167 ?auto_68168 ?auto_68169 ?auto_68170 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68172 - BLOCK
      ?auto_68173 - BLOCK
      ?auto_68174 - BLOCK
      ?auto_68175 - BLOCK
      ?auto_68176 - BLOCK
    )
    :vars
    (
      ?auto_68177 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68172 ) ( ON ?auto_68173 ?auto_68172 ) ( ON ?auto_68174 ?auto_68173 ) ( not ( = ?auto_68172 ?auto_68173 ) ) ( not ( = ?auto_68172 ?auto_68174 ) ) ( not ( = ?auto_68172 ?auto_68175 ) ) ( not ( = ?auto_68172 ?auto_68176 ) ) ( not ( = ?auto_68173 ?auto_68174 ) ) ( not ( = ?auto_68173 ?auto_68175 ) ) ( not ( = ?auto_68173 ?auto_68176 ) ) ( not ( = ?auto_68174 ?auto_68175 ) ) ( not ( = ?auto_68174 ?auto_68176 ) ) ( not ( = ?auto_68175 ?auto_68176 ) ) ( ON ?auto_68176 ?auto_68177 ) ( CLEAR ?auto_68176 ) ( not ( = ?auto_68172 ?auto_68177 ) ) ( not ( = ?auto_68173 ?auto_68177 ) ) ( not ( = ?auto_68174 ?auto_68177 ) ) ( not ( = ?auto_68175 ?auto_68177 ) ) ( not ( = ?auto_68176 ?auto_68177 ) ) ( HOLDING ?auto_68175 ) ( CLEAR ?auto_68174 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68172 ?auto_68173 ?auto_68174 ?auto_68175 )
      ( MAKE-5PILE ?auto_68172 ?auto_68173 ?auto_68174 ?auto_68175 ?auto_68176 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68178 - BLOCK
      ?auto_68179 - BLOCK
      ?auto_68180 - BLOCK
      ?auto_68181 - BLOCK
      ?auto_68182 - BLOCK
    )
    :vars
    (
      ?auto_68183 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68178 ) ( ON ?auto_68179 ?auto_68178 ) ( ON ?auto_68180 ?auto_68179 ) ( not ( = ?auto_68178 ?auto_68179 ) ) ( not ( = ?auto_68178 ?auto_68180 ) ) ( not ( = ?auto_68178 ?auto_68181 ) ) ( not ( = ?auto_68178 ?auto_68182 ) ) ( not ( = ?auto_68179 ?auto_68180 ) ) ( not ( = ?auto_68179 ?auto_68181 ) ) ( not ( = ?auto_68179 ?auto_68182 ) ) ( not ( = ?auto_68180 ?auto_68181 ) ) ( not ( = ?auto_68180 ?auto_68182 ) ) ( not ( = ?auto_68181 ?auto_68182 ) ) ( ON ?auto_68182 ?auto_68183 ) ( not ( = ?auto_68178 ?auto_68183 ) ) ( not ( = ?auto_68179 ?auto_68183 ) ) ( not ( = ?auto_68180 ?auto_68183 ) ) ( not ( = ?auto_68181 ?auto_68183 ) ) ( not ( = ?auto_68182 ?auto_68183 ) ) ( CLEAR ?auto_68180 ) ( ON ?auto_68181 ?auto_68182 ) ( CLEAR ?auto_68181 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68183 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68183 ?auto_68182 )
      ( MAKE-5PILE ?auto_68178 ?auto_68179 ?auto_68180 ?auto_68181 ?auto_68182 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68184 - BLOCK
      ?auto_68185 - BLOCK
      ?auto_68186 - BLOCK
      ?auto_68187 - BLOCK
      ?auto_68188 - BLOCK
    )
    :vars
    (
      ?auto_68189 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68184 ) ( ON ?auto_68185 ?auto_68184 ) ( not ( = ?auto_68184 ?auto_68185 ) ) ( not ( = ?auto_68184 ?auto_68186 ) ) ( not ( = ?auto_68184 ?auto_68187 ) ) ( not ( = ?auto_68184 ?auto_68188 ) ) ( not ( = ?auto_68185 ?auto_68186 ) ) ( not ( = ?auto_68185 ?auto_68187 ) ) ( not ( = ?auto_68185 ?auto_68188 ) ) ( not ( = ?auto_68186 ?auto_68187 ) ) ( not ( = ?auto_68186 ?auto_68188 ) ) ( not ( = ?auto_68187 ?auto_68188 ) ) ( ON ?auto_68188 ?auto_68189 ) ( not ( = ?auto_68184 ?auto_68189 ) ) ( not ( = ?auto_68185 ?auto_68189 ) ) ( not ( = ?auto_68186 ?auto_68189 ) ) ( not ( = ?auto_68187 ?auto_68189 ) ) ( not ( = ?auto_68188 ?auto_68189 ) ) ( ON ?auto_68187 ?auto_68188 ) ( CLEAR ?auto_68187 ) ( ON-TABLE ?auto_68189 ) ( HOLDING ?auto_68186 ) ( CLEAR ?auto_68185 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68184 ?auto_68185 ?auto_68186 )
      ( MAKE-5PILE ?auto_68184 ?auto_68185 ?auto_68186 ?auto_68187 ?auto_68188 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68190 - BLOCK
      ?auto_68191 - BLOCK
      ?auto_68192 - BLOCK
      ?auto_68193 - BLOCK
      ?auto_68194 - BLOCK
    )
    :vars
    (
      ?auto_68195 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68190 ) ( ON ?auto_68191 ?auto_68190 ) ( not ( = ?auto_68190 ?auto_68191 ) ) ( not ( = ?auto_68190 ?auto_68192 ) ) ( not ( = ?auto_68190 ?auto_68193 ) ) ( not ( = ?auto_68190 ?auto_68194 ) ) ( not ( = ?auto_68191 ?auto_68192 ) ) ( not ( = ?auto_68191 ?auto_68193 ) ) ( not ( = ?auto_68191 ?auto_68194 ) ) ( not ( = ?auto_68192 ?auto_68193 ) ) ( not ( = ?auto_68192 ?auto_68194 ) ) ( not ( = ?auto_68193 ?auto_68194 ) ) ( ON ?auto_68194 ?auto_68195 ) ( not ( = ?auto_68190 ?auto_68195 ) ) ( not ( = ?auto_68191 ?auto_68195 ) ) ( not ( = ?auto_68192 ?auto_68195 ) ) ( not ( = ?auto_68193 ?auto_68195 ) ) ( not ( = ?auto_68194 ?auto_68195 ) ) ( ON ?auto_68193 ?auto_68194 ) ( ON-TABLE ?auto_68195 ) ( CLEAR ?auto_68191 ) ( ON ?auto_68192 ?auto_68193 ) ( CLEAR ?auto_68192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68195 ?auto_68194 ?auto_68193 )
      ( MAKE-5PILE ?auto_68190 ?auto_68191 ?auto_68192 ?auto_68193 ?auto_68194 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68196 - BLOCK
      ?auto_68197 - BLOCK
      ?auto_68198 - BLOCK
      ?auto_68199 - BLOCK
      ?auto_68200 - BLOCK
    )
    :vars
    (
      ?auto_68201 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68196 ) ( not ( = ?auto_68196 ?auto_68197 ) ) ( not ( = ?auto_68196 ?auto_68198 ) ) ( not ( = ?auto_68196 ?auto_68199 ) ) ( not ( = ?auto_68196 ?auto_68200 ) ) ( not ( = ?auto_68197 ?auto_68198 ) ) ( not ( = ?auto_68197 ?auto_68199 ) ) ( not ( = ?auto_68197 ?auto_68200 ) ) ( not ( = ?auto_68198 ?auto_68199 ) ) ( not ( = ?auto_68198 ?auto_68200 ) ) ( not ( = ?auto_68199 ?auto_68200 ) ) ( ON ?auto_68200 ?auto_68201 ) ( not ( = ?auto_68196 ?auto_68201 ) ) ( not ( = ?auto_68197 ?auto_68201 ) ) ( not ( = ?auto_68198 ?auto_68201 ) ) ( not ( = ?auto_68199 ?auto_68201 ) ) ( not ( = ?auto_68200 ?auto_68201 ) ) ( ON ?auto_68199 ?auto_68200 ) ( ON-TABLE ?auto_68201 ) ( ON ?auto_68198 ?auto_68199 ) ( CLEAR ?auto_68198 ) ( HOLDING ?auto_68197 ) ( CLEAR ?auto_68196 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68196 ?auto_68197 )
      ( MAKE-5PILE ?auto_68196 ?auto_68197 ?auto_68198 ?auto_68199 ?auto_68200 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68202 - BLOCK
      ?auto_68203 - BLOCK
      ?auto_68204 - BLOCK
      ?auto_68205 - BLOCK
      ?auto_68206 - BLOCK
    )
    :vars
    (
      ?auto_68207 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68202 ) ( not ( = ?auto_68202 ?auto_68203 ) ) ( not ( = ?auto_68202 ?auto_68204 ) ) ( not ( = ?auto_68202 ?auto_68205 ) ) ( not ( = ?auto_68202 ?auto_68206 ) ) ( not ( = ?auto_68203 ?auto_68204 ) ) ( not ( = ?auto_68203 ?auto_68205 ) ) ( not ( = ?auto_68203 ?auto_68206 ) ) ( not ( = ?auto_68204 ?auto_68205 ) ) ( not ( = ?auto_68204 ?auto_68206 ) ) ( not ( = ?auto_68205 ?auto_68206 ) ) ( ON ?auto_68206 ?auto_68207 ) ( not ( = ?auto_68202 ?auto_68207 ) ) ( not ( = ?auto_68203 ?auto_68207 ) ) ( not ( = ?auto_68204 ?auto_68207 ) ) ( not ( = ?auto_68205 ?auto_68207 ) ) ( not ( = ?auto_68206 ?auto_68207 ) ) ( ON ?auto_68205 ?auto_68206 ) ( ON-TABLE ?auto_68207 ) ( ON ?auto_68204 ?auto_68205 ) ( CLEAR ?auto_68202 ) ( ON ?auto_68203 ?auto_68204 ) ( CLEAR ?auto_68203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68207 ?auto_68206 ?auto_68205 ?auto_68204 )
      ( MAKE-5PILE ?auto_68202 ?auto_68203 ?auto_68204 ?auto_68205 ?auto_68206 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68208 - BLOCK
      ?auto_68209 - BLOCK
      ?auto_68210 - BLOCK
      ?auto_68211 - BLOCK
      ?auto_68212 - BLOCK
    )
    :vars
    (
      ?auto_68213 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68208 ?auto_68209 ) ) ( not ( = ?auto_68208 ?auto_68210 ) ) ( not ( = ?auto_68208 ?auto_68211 ) ) ( not ( = ?auto_68208 ?auto_68212 ) ) ( not ( = ?auto_68209 ?auto_68210 ) ) ( not ( = ?auto_68209 ?auto_68211 ) ) ( not ( = ?auto_68209 ?auto_68212 ) ) ( not ( = ?auto_68210 ?auto_68211 ) ) ( not ( = ?auto_68210 ?auto_68212 ) ) ( not ( = ?auto_68211 ?auto_68212 ) ) ( ON ?auto_68212 ?auto_68213 ) ( not ( = ?auto_68208 ?auto_68213 ) ) ( not ( = ?auto_68209 ?auto_68213 ) ) ( not ( = ?auto_68210 ?auto_68213 ) ) ( not ( = ?auto_68211 ?auto_68213 ) ) ( not ( = ?auto_68212 ?auto_68213 ) ) ( ON ?auto_68211 ?auto_68212 ) ( ON-TABLE ?auto_68213 ) ( ON ?auto_68210 ?auto_68211 ) ( ON ?auto_68209 ?auto_68210 ) ( CLEAR ?auto_68209 ) ( HOLDING ?auto_68208 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68208 )
      ( MAKE-5PILE ?auto_68208 ?auto_68209 ?auto_68210 ?auto_68211 ?auto_68212 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68214 - BLOCK
      ?auto_68215 - BLOCK
      ?auto_68216 - BLOCK
      ?auto_68217 - BLOCK
      ?auto_68218 - BLOCK
    )
    :vars
    (
      ?auto_68219 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68214 ?auto_68215 ) ) ( not ( = ?auto_68214 ?auto_68216 ) ) ( not ( = ?auto_68214 ?auto_68217 ) ) ( not ( = ?auto_68214 ?auto_68218 ) ) ( not ( = ?auto_68215 ?auto_68216 ) ) ( not ( = ?auto_68215 ?auto_68217 ) ) ( not ( = ?auto_68215 ?auto_68218 ) ) ( not ( = ?auto_68216 ?auto_68217 ) ) ( not ( = ?auto_68216 ?auto_68218 ) ) ( not ( = ?auto_68217 ?auto_68218 ) ) ( ON ?auto_68218 ?auto_68219 ) ( not ( = ?auto_68214 ?auto_68219 ) ) ( not ( = ?auto_68215 ?auto_68219 ) ) ( not ( = ?auto_68216 ?auto_68219 ) ) ( not ( = ?auto_68217 ?auto_68219 ) ) ( not ( = ?auto_68218 ?auto_68219 ) ) ( ON ?auto_68217 ?auto_68218 ) ( ON-TABLE ?auto_68219 ) ( ON ?auto_68216 ?auto_68217 ) ( ON ?auto_68215 ?auto_68216 ) ( ON ?auto_68214 ?auto_68215 ) ( CLEAR ?auto_68214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68219 ?auto_68218 ?auto_68217 ?auto_68216 ?auto_68215 )
      ( MAKE-5PILE ?auto_68214 ?auto_68215 ?auto_68216 ?auto_68217 ?auto_68218 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68220 - BLOCK
      ?auto_68221 - BLOCK
      ?auto_68222 - BLOCK
      ?auto_68223 - BLOCK
      ?auto_68224 - BLOCK
    )
    :vars
    (
      ?auto_68225 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68220 ?auto_68221 ) ) ( not ( = ?auto_68220 ?auto_68222 ) ) ( not ( = ?auto_68220 ?auto_68223 ) ) ( not ( = ?auto_68220 ?auto_68224 ) ) ( not ( = ?auto_68221 ?auto_68222 ) ) ( not ( = ?auto_68221 ?auto_68223 ) ) ( not ( = ?auto_68221 ?auto_68224 ) ) ( not ( = ?auto_68222 ?auto_68223 ) ) ( not ( = ?auto_68222 ?auto_68224 ) ) ( not ( = ?auto_68223 ?auto_68224 ) ) ( ON ?auto_68224 ?auto_68225 ) ( not ( = ?auto_68220 ?auto_68225 ) ) ( not ( = ?auto_68221 ?auto_68225 ) ) ( not ( = ?auto_68222 ?auto_68225 ) ) ( not ( = ?auto_68223 ?auto_68225 ) ) ( not ( = ?auto_68224 ?auto_68225 ) ) ( ON ?auto_68223 ?auto_68224 ) ( ON-TABLE ?auto_68225 ) ( ON ?auto_68222 ?auto_68223 ) ( ON ?auto_68221 ?auto_68222 ) ( HOLDING ?auto_68220 ) ( CLEAR ?auto_68221 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_68225 ?auto_68224 ?auto_68223 ?auto_68222 ?auto_68221 ?auto_68220 )
      ( MAKE-5PILE ?auto_68220 ?auto_68221 ?auto_68222 ?auto_68223 ?auto_68224 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68226 - BLOCK
      ?auto_68227 - BLOCK
      ?auto_68228 - BLOCK
      ?auto_68229 - BLOCK
      ?auto_68230 - BLOCK
    )
    :vars
    (
      ?auto_68231 - BLOCK
      ?auto_68232 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68226 ?auto_68227 ) ) ( not ( = ?auto_68226 ?auto_68228 ) ) ( not ( = ?auto_68226 ?auto_68229 ) ) ( not ( = ?auto_68226 ?auto_68230 ) ) ( not ( = ?auto_68227 ?auto_68228 ) ) ( not ( = ?auto_68227 ?auto_68229 ) ) ( not ( = ?auto_68227 ?auto_68230 ) ) ( not ( = ?auto_68228 ?auto_68229 ) ) ( not ( = ?auto_68228 ?auto_68230 ) ) ( not ( = ?auto_68229 ?auto_68230 ) ) ( ON ?auto_68230 ?auto_68231 ) ( not ( = ?auto_68226 ?auto_68231 ) ) ( not ( = ?auto_68227 ?auto_68231 ) ) ( not ( = ?auto_68228 ?auto_68231 ) ) ( not ( = ?auto_68229 ?auto_68231 ) ) ( not ( = ?auto_68230 ?auto_68231 ) ) ( ON ?auto_68229 ?auto_68230 ) ( ON-TABLE ?auto_68231 ) ( ON ?auto_68228 ?auto_68229 ) ( ON ?auto_68227 ?auto_68228 ) ( CLEAR ?auto_68227 ) ( ON ?auto_68226 ?auto_68232 ) ( CLEAR ?auto_68226 ) ( HAND-EMPTY ) ( not ( = ?auto_68226 ?auto_68232 ) ) ( not ( = ?auto_68227 ?auto_68232 ) ) ( not ( = ?auto_68228 ?auto_68232 ) ) ( not ( = ?auto_68229 ?auto_68232 ) ) ( not ( = ?auto_68230 ?auto_68232 ) ) ( not ( = ?auto_68231 ?auto_68232 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68226 ?auto_68232 )
      ( MAKE-5PILE ?auto_68226 ?auto_68227 ?auto_68228 ?auto_68229 ?auto_68230 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68233 - BLOCK
      ?auto_68234 - BLOCK
      ?auto_68235 - BLOCK
      ?auto_68236 - BLOCK
      ?auto_68237 - BLOCK
    )
    :vars
    (
      ?auto_68239 - BLOCK
      ?auto_68238 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68233 ?auto_68234 ) ) ( not ( = ?auto_68233 ?auto_68235 ) ) ( not ( = ?auto_68233 ?auto_68236 ) ) ( not ( = ?auto_68233 ?auto_68237 ) ) ( not ( = ?auto_68234 ?auto_68235 ) ) ( not ( = ?auto_68234 ?auto_68236 ) ) ( not ( = ?auto_68234 ?auto_68237 ) ) ( not ( = ?auto_68235 ?auto_68236 ) ) ( not ( = ?auto_68235 ?auto_68237 ) ) ( not ( = ?auto_68236 ?auto_68237 ) ) ( ON ?auto_68237 ?auto_68239 ) ( not ( = ?auto_68233 ?auto_68239 ) ) ( not ( = ?auto_68234 ?auto_68239 ) ) ( not ( = ?auto_68235 ?auto_68239 ) ) ( not ( = ?auto_68236 ?auto_68239 ) ) ( not ( = ?auto_68237 ?auto_68239 ) ) ( ON ?auto_68236 ?auto_68237 ) ( ON-TABLE ?auto_68239 ) ( ON ?auto_68235 ?auto_68236 ) ( ON ?auto_68233 ?auto_68238 ) ( CLEAR ?auto_68233 ) ( not ( = ?auto_68233 ?auto_68238 ) ) ( not ( = ?auto_68234 ?auto_68238 ) ) ( not ( = ?auto_68235 ?auto_68238 ) ) ( not ( = ?auto_68236 ?auto_68238 ) ) ( not ( = ?auto_68237 ?auto_68238 ) ) ( not ( = ?auto_68239 ?auto_68238 ) ) ( HOLDING ?auto_68234 ) ( CLEAR ?auto_68235 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68239 ?auto_68237 ?auto_68236 ?auto_68235 ?auto_68234 )
      ( MAKE-5PILE ?auto_68233 ?auto_68234 ?auto_68235 ?auto_68236 ?auto_68237 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68240 - BLOCK
      ?auto_68241 - BLOCK
      ?auto_68242 - BLOCK
      ?auto_68243 - BLOCK
      ?auto_68244 - BLOCK
    )
    :vars
    (
      ?auto_68246 - BLOCK
      ?auto_68245 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68240 ?auto_68241 ) ) ( not ( = ?auto_68240 ?auto_68242 ) ) ( not ( = ?auto_68240 ?auto_68243 ) ) ( not ( = ?auto_68240 ?auto_68244 ) ) ( not ( = ?auto_68241 ?auto_68242 ) ) ( not ( = ?auto_68241 ?auto_68243 ) ) ( not ( = ?auto_68241 ?auto_68244 ) ) ( not ( = ?auto_68242 ?auto_68243 ) ) ( not ( = ?auto_68242 ?auto_68244 ) ) ( not ( = ?auto_68243 ?auto_68244 ) ) ( ON ?auto_68244 ?auto_68246 ) ( not ( = ?auto_68240 ?auto_68246 ) ) ( not ( = ?auto_68241 ?auto_68246 ) ) ( not ( = ?auto_68242 ?auto_68246 ) ) ( not ( = ?auto_68243 ?auto_68246 ) ) ( not ( = ?auto_68244 ?auto_68246 ) ) ( ON ?auto_68243 ?auto_68244 ) ( ON-TABLE ?auto_68246 ) ( ON ?auto_68242 ?auto_68243 ) ( ON ?auto_68240 ?auto_68245 ) ( not ( = ?auto_68240 ?auto_68245 ) ) ( not ( = ?auto_68241 ?auto_68245 ) ) ( not ( = ?auto_68242 ?auto_68245 ) ) ( not ( = ?auto_68243 ?auto_68245 ) ) ( not ( = ?auto_68244 ?auto_68245 ) ) ( not ( = ?auto_68246 ?auto_68245 ) ) ( CLEAR ?auto_68242 ) ( ON ?auto_68241 ?auto_68240 ) ( CLEAR ?auto_68241 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68245 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68245 ?auto_68240 )
      ( MAKE-5PILE ?auto_68240 ?auto_68241 ?auto_68242 ?auto_68243 ?auto_68244 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68247 - BLOCK
      ?auto_68248 - BLOCK
      ?auto_68249 - BLOCK
      ?auto_68250 - BLOCK
      ?auto_68251 - BLOCK
    )
    :vars
    (
      ?auto_68253 - BLOCK
      ?auto_68252 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68247 ?auto_68248 ) ) ( not ( = ?auto_68247 ?auto_68249 ) ) ( not ( = ?auto_68247 ?auto_68250 ) ) ( not ( = ?auto_68247 ?auto_68251 ) ) ( not ( = ?auto_68248 ?auto_68249 ) ) ( not ( = ?auto_68248 ?auto_68250 ) ) ( not ( = ?auto_68248 ?auto_68251 ) ) ( not ( = ?auto_68249 ?auto_68250 ) ) ( not ( = ?auto_68249 ?auto_68251 ) ) ( not ( = ?auto_68250 ?auto_68251 ) ) ( ON ?auto_68251 ?auto_68253 ) ( not ( = ?auto_68247 ?auto_68253 ) ) ( not ( = ?auto_68248 ?auto_68253 ) ) ( not ( = ?auto_68249 ?auto_68253 ) ) ( not ( = ?auto_68250 ?auto_68253 ) ) ( not ( = ?auto_68251 ?auto_68253 ) ) ( ON ?auto_68250 ?auto_68251 ) ( ON-TABLE ?auto_68253 ) ( ON ?auto_68247 ?auto_68252 ) ( not ( = ?auto_68247 ?auto_68252 ) ) ( not ( = ?auto_68248 ?auto_68252 ) ) ( not ( = ?auto_68249 ?auto_68252 ) ) ( not ( = ?auto_68250 ?auto_68252 ) ) ( not ( = ?auto_68251 ?auto_68252 ) ) ( not ( = ?auto_68253 ?auto_68252 ) ) ( ON ?auto_68248 ?auto_68247 ) ( CLEAR ?auto_68248 ) ( ON-TABLE ?auto_68252 ) ( HOLDING ?auto_68249 ) ( CLEAR ?auto_68250 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68253 ?auto_68251 ?auto_68250 ?auto_68249 )
      ( MAKE-5PILE ?auto_68247 ?auto_68248 ?auto_68249 ?auto_68250 ?auto_68251 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68254 - BLOCK
      ?auto_68255 - BLOCK
      ?auto_68256 - BLOCK
      ?auto_68257 - BLOCK
      ?auto_68258 - BLOCK
    )
    :vars
    (
      ?auto_68259 - BLOCK
      ?auto_68260 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68254 ?auto_68255 ) ) ( not ( = ?auto_68254 ?auto_68256 ) ) ( not ( = ?auto_68254 ?auto_68257 ) ) ( not ( = ?auto_68254 ?auto_68258 ) ) ( not ( = ?auto_68255 ?auto_68256 ) ) ( not ( = ?auto_68255 ?auto_68257 ) ) ( not ( = ?auto_68255 ?auto_68258 ) ) ( not ( = ?auto_68256 ?auto_68257 ) ) ( not ( = ?auto_68256 ?auto_68258 ) ) ( not ( = ?auto_68257 ?auto_68258 ) ) ( ON ?auto_68258 ?auto_68259 ) ( not ( = ?auto_68254 ?auto_68259 ) ) ( not ( = ?auto_68255 ?auto_68259 ) ) ( not ( = ?auto_68256 ?auto_68259 ) ) ( not ( = ?auto_68257 ?auto_68259 ) ) ( not ( = ?auto_68258 ?auto_68259 ) ) ( ON ?auto_68257 ?auto_68258 ) ( ON-TABLE ?auto_68259 ) ( ON ?auto_68254 ?auto_68260 ) ( not ( = ?auto_68254 ?auto_68260 ) ) ( not ( = ?auto_68255 ?auto_68260 ) ) ( not ( = ?auto_68256 ?auto_68260 ) ) ( not ( = ?auto_68257 ?auto_68260 ) ) ( not ( = ?auto_68258 ?auto_68260 ) ) ( not ( = ?auto_68259 ?auto_68260 ) ) ( ON ?auto_68255 ?auto_68254 ) ( ON-TABLE ?auto_68260 ) ( CLEAR ?auto_68257 ) ( ON ?auto_68256 ?auto_68255 ) ( CLEAR ?auto_68256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68260 ?auto_68254 ?auto_68255 )
      ( MAKE-5PILE ?auto_68254 ?auto_68255 ?auto_68256 ?auto_68257 ?auto_68258 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68261 - BLOCK
      ?auto_68262 - BLOCK
      ?auto_68263 - BLOCK
      ?auto_68264 - BLOCK
      ?auto_68265 - BLOCK
    )
    :vars
    (
      ?auto_68267 - BLOCK
      ?auto_68266 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68261 ?auto_68262 ) ) ( not ( = ?auto_68261 ?auto_68263 ) ) ( not ( = ?auto_68261 ?auto_68264 ) ) ( not ( = ?auto_68261 ?auto_68265 ) ) ( not ( = ?auto_68262 ?auto_68263 ) ) ( not ( = ?auto_68262 ?auto_68264 ) ) ( not ( = ?auto_68262 ?auto_68265 ) ) ( not ( = ?auto_68263 ?auto_68264 ) ) ( not ( = ?auto_68263 ?auto_68265 ) ) ( not ( = ?auto_68264 ?auto_68265 ) ) ( ON ?auto_68265 ?auto_68267 ) ( not ( = ?auto_68261 ?auto_68267 ) ) ( not ( = ?auto_68262 ?auto_68267 ) ) ( not ( = ?auto_68263 ?auto_68267 ) ) ( not ( = ?auto_68264 ?auto_68267 ) ) ( not ( = ?auto_68265 ?auto_68267 ) ) ( ON-TABLE ?auto_68267 ) ( ON ?auto_68261 ?auto_68266 ) ( not ( = ?auto_68261 ?auto_68266 ) ) ( not ( = ?auto_68262 ?auto_68266 ) ) ( not ( = ?auto_68263 ?auto_68266 ) ) ( not ( = ?auto_68264 ?auto_68266 ) ) ( not ( = ?auto_68265 ?auto_68266 ) ) ( not ( = ?auto_68267 ?auto_68266 ) ) ( ON ?auto_68262 ?auto_68261 ) ( ON-TABLE ?auto_68266 ) ( ON ?auto_68263 ?auto_68262 ) ( CLEAR ?auto_68263 ) ( HOLDING ?auto_68264 ) ( CLEAR ?auto_68265 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68267 ?auto_68265 ?auto_68264 )
      ( MAKE-5PILE ?auto_68261 ?auto_68262 ?auto_68263 ?auto_68264 ?auto_68265 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68268 - BLOCK
      ?auto_68269 - BLOCK
      ?auto_68270 - BLOCK
      ?auto_68271 - BLOCK
      ?auto_68272 - BLOCK
    )
    :vars
    (
      ?auto_68274 - BLOCK
      ?auto_68273 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68268 ?auto_68269 ) ) ( not ( = ?auto_68268 ?auto_68270 ) ) ( not ( = ?auto_68268 ?auto_68271 ) ) ( not ( = ?auto_68268 ?auto_68272 ) ) ( not ( = ?auto_68269 ?auto_68270 ) ) ( not ( = ?auto_68269 ?auto_68271 ) ) ( not ( = ?auto_68269 ?auto_68272 ) ) ( not ( = ?auto_68270 ?auto_68271 ) ) ( not ( = ?auto_68270 ?auto_68272 ) ) ( not ( = ?auto_68271 ?auto_68272 ) ) ( ON ?auto_68272 ?auto_68274 ) ( not ( = ?auto_68268 ?auto_68274 ) ) ( not ( = ?auto_68269 ?auto_68274 ) ) ( not ( = ?auto_68270 ?auto_68274 ) ) ( not ( = ?auto_68271 ?auto_68274 ) ) ( not ( = ?auto_68272 ?auto_68274 ) ) ( ON-TABLE ?auto_68274 ) ( ON ?auto_68268 ?auto_68273 ) ( not ( = ?auto_68268 ?auto_68273 ) ) ( not ( = ?auto_68269 ?auto_68273 ) ) ( not ( = ?auto_68270 ?auto_68273 ) ) ( not ( = ?auto_68271 ?auto_68273 ) ) ( not ( = ?auto_68272 ?auto_68273 ) ) ( not ( = ?auto_68274 ?auto_68273 ) ) ( ON ?auto_68269 ?auto_68268 ) ( ON-TABLE ?auto_68273 ) ( ON ?auto_68270 ?auto_68269 ) ( CLEAR ?auto_68272 ) ( ON ?auto_68271 ?auto_68270 ) ( CLEAR ?auto_68271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68273 ?auto_68268 ?auto_68269 ?auto_68270 )
      ( MAKE-5PILE ?auto_68268 ?auto_68269 ?auto_68270 ?auto_68271 ?auto_68272 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68275 - BLOCK
      ?auto_68276 - BLOCK
      ?auto_68277 - BLOCK
      ?auto_68278 - BLOCK
      ?auto_68279 - BLOCK
    )
    :vars
    (
      ?auto_68281 - BLOCK
      ?auto_68280 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68275 ?auto_68276 ) ) ( not ( = ?auto_68275 ?auto_68277 ) ) ( not ( = ?auto_68275 ?auto_68278 ) ) ( not ( = ?auto_68275 ?auto_68279 ) ) ( not ( = ?auto_68276 ?auto_68277 ) ) ( not ( = ?auto_68276 ?auto_68278 ) ) ( not ( = ?auto_68276 ?auto_68279 ) ) ( not ( = ?auto_68277 ?auto_68278 ) ) ( not ( = ?auto_68277 ?auto_68279 ) ) ( not ( = ?auto_68278 ?auto_68279 ) ) ( not ( = ?auto_68275 ?auto_68281 ) ) ( not ( = ?auto_68276 ?auto_68281 ) ) ( not ( = ?auto_68277 ?auto_68281 ) ) ( not ( = ?auto_68278 ?auto_68281 ) ) ( not ( = ?auto_68279 ?auto_68281 ) ) ( ON-TABLE ?auto_68281 ) ( ON ?auto_68275 ?auto_68280 ) ( not ( = ?auto_68275 ?auto_68280 ) ) ( not ( = ?auto_68276 ?auto_68280 ) ) ( not ( = ?auto_68277 ?auto_68280 ) ) ( not ( = ?auto_68278 ?auto_68280 ) ) ( not ( = ?auto_68279 ?auto_68280 ) ) ( not ( = ?auto_68281 ?auto_68280 ) ) ( ON ?auto_68276 ?auto_68275 ) ( ON-TABLE ?auto_68280 ) ( ON ?auto_68277 ?auto_68276 ) ( ON ?auto_68278 ?auto_68277 ) ( CLEAR ?auto_68278 ) ( HOLDING ?auto_68279 ) ( CLEAR ?auto_68281 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68281 ?auto_68279 )
      ( MAKE-5PILE ?auto_68275 ?auto_68276 ?auto_68277 ?auto_68278 ?auto_68279 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68282 - BLOCK
      ?auto_68283 - BLOCK
      ?auto_68284 - BLOCK
      ?auto_68285 - BLOCK
      ?auto_68286 - BLOCK
    )
    :vars
    (
      ?auto_68288 - BLOCK
      ?auto_68287 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68282 ?auto_68283 ) ) ( not ( = ?auto_68282 ?auto_68284 ) ) ( not ( = ?auto_68282 ?auto_68285 ) ) ( not ( = ?auto_68282 ?auto_68286 ) ) ( not ( = ?auto_68283 ?auto_68284 ) ) ( not ( = ?auto_68283 ?auto_68285 ) ) ( not ( = ?auto_68283 ?auto_68286 ) ) ( not ( = ?auto_68284 ?auto_68285 ) ) ( not ( = ?auto_68284 ?auto_68286 ) ) ( not ( = ?auto_68285 ?auto_68286 ) ) ( not ( = ?auto_68282 ?auto_68288 ) ) ( not ( = ?auto_68283 ?auto_68288 ) ) ( not ( = ?auto_68284 ?auto_68288 ) ) ( not ( = ?auto_68285 ?auto_68288 ) ) ( not ( = ?auto_68286 ?auto_68288 ) ) ( ON-TABLE ?auto_68288 ) ( ON ?auto_68282 ?auto_68287 ) ( not ( = ?auto_68282 ?auto_68287 ) ) ( not ( = ?auto_68283 ?auto_68287 ) ) ( not ( = ?auto_68284 ?auto_68287 ) ) ( not ( = ?auto_68285 ?auto_68287 ) ) ( not ( = ?auto_68286 ?auto_68287 ) ) ( not ( = ?auto_68288 ?auto_68287 ) ) ( ON ?auto_68283 ?auto_68282 ) ( ON-TABLE ?auto_68287 ) ( ON ?auto_68284 ?auto_68283 ) ( ON ?auto_68285 ?auto_68284 ) ( CLEAR ?auto_68288 ) ( ON ?auto_68286 ?auto_68285 ) ( CLEAR ?auto_68286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68287 ?auto_68282 ?auto_68283 ?auto_68284 ?auto_68285 )
      ( MAKE-5PILE ?auto_68282 ?auto_68283 ?auto_68284 ?auto_68285 ?auto_68286 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68289 - BLOCK
      ?auto_68290 - BLOCK
      ?auto_68291 - BLOCK
      ?auto_68292 - BLOCK
      ?auto_68293 - BLOCK
    )
    :vars
    (
      ?auto_68294 - BLOCK
      ?auto_68295 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68289 ?auto_68290 ) ) ( not ( = ?auto_68289 ?auto_68291 ) ) ( not ( = ?auto_68289 ?auto_68292 ) ) ( not ( = ?auto_68289 ?auto_68293 ) ) ( not ( = ?auto_68290 ?auto_68291 ) ) ( not ( = ?auto_68290 ?auto_68292 ) ) ( not ( = ?auto_68290 ?auto_68293 ) ) ( not ( = ?auto_68291 ?auto_68292 ) ) ( not ( = ?auto_68291 ?auto_68293 ) ) ( not ( = ?auto_68292 ?auto_68293 ) ) ( not ( = ?auto_68289 ?auto_68294 ) ) ( not ( = ?auto_68290 ?auto_68294 ) ) ( not ( = ?auto_68291 ?auto_68294 ) ) ( not ( = ?auto_68292 ?auto_68294 ) ) ( not ( = ?auto_68293 ?auto_68294 ) ) ( ON ?auto_68289 ?auto_68295 ) ( not ( = ?auto_68289 ?auto_68295 ) ) ( not ( = ?auto_68290 ?auto_68295 ) ) ( not ( = ?auto_68291 ?auto_68295 ) ) ( not ( = ?auto_68292 ?auto_68295 ) ) ( not ( = ?auto_68293 ?auto_68295 ) ) ( not ( = ?auto_68294 ?auto_68295 ) ) ( ON ?auto_68290 ?auto_68289 ) ( ON-TABLE ?auto_68295 ) ( ON ?auto_68291 ?auto_68290 ) ( ON ?auto_68292 ?auto_68291 ) ( ON ?auto_68293 ?auto_68292 ) ( CLEAR ?auto_68293 ) ( HOLDING ?auto_68294 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68294 )
      ( MAKE-5PILE ?auto_68289 ?auto_68290 ?auto_68291 ?auto_68292 ?auto_68293 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68296 - BLOCK
      ?auto_68297 - BLOCK
      ?auto_68298 - BLOCK
      ?auto_68299 - BLOCK
      ?auto_68300 - BLOCK
    )
    :vars
    (
      ?auto_68302 - BLOCK
      ?auto_68301 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68296 ?auto_68297 ) ) ( not ( = ?auto_68296 ?auto_68298 ) ) ( not ( = ?auto_68296 ?auto_68299 ) ) ( not ( = ?auto_68296 ?auto_68300 ) ) ( not ( = ?auto_68297 ?auto_68298 ) ) ( not ( = ?auto_68297 ?auto_68299 ) ) ( not ( = ?auto_68297 ?auto_68300 ) ) ( not ( = ?auto_68298 ?auto_68299 ) ) ( not ( = ?auto_68298 ?auto_68300 ) ) ( not ( = ?auto_68299 ?auto_68300 ) ) ( not ( = ?auto_68296 ?auto_68302 ) ) ( not ( = ?auto_68297 ?auto_68302 ) ) ( not ( = ?auto_68298 ?auto_68302 ) ) ( not ( = ?auto_68299 ?auto_68302 ) ) ( not ( = ?auto_68300 ?auto_68302 ) ) ( ON ?auto_68296 ?auto_68301 ) ( not ( = ?auto_68296 ?auto_68301 ) ) ( not ( = ?auto_68297 ?auto_68301 ) ) ( not ( = ?auto_68298 ?auto_68301 ) ) ( not ( = ?auto_68299 ?auto_68301 ) ) ( not ( = ?auto_68300 ?auto_68301 ) ) ( not ( = ?auto_68302 ?auto_68301 ) ) ( ON ?auto_68297 ?auto_68296 ) ( ON-TABLE ?auto_68301 ) ( ON ?auto_68298 ?auto_68297 ) ( ON ?auto_68299 ?auto_68298 ) ( ON ?auto_68300 ?auto_68299 ) ( ON ?auto_68302 ?auto_68300 ) ( CLEAR ?auto_68302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_68301 ?auto_68296 ?auto_68297 ?auto_68298 ?auto_68299 ?auto_68300 )
      ( MAKE-5PILE ?auto_68296 ?auto_68297 ?auto_68298 ?auto_68299 ?auto_68300 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68309 - BLOCK
      ?auto_68310 - BLOCK
      ?auto_68311 - BLOCK
      ?auto_68312 - BLOCK
      ?auto_68313 - BLOCK
      ?auto_68314 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_68314 ) ( CLEAR ?auto_68313 ) ( ON-TABLE ?auto_68309 ) ( ON ?auto_68310 ?auto_68309 ) ( ON ?auto_68311 ?auto_68310 ) ( ON ?auto_68312 ?auto_68311 ) ( ON ?auto_68313 ?auto_68312 ) ( not ( = ?auto_68309 ?auto_68310 ) ) ( not ( = ?auto_68309 ?auto_68311 ) ) ( not ( = ?auto_68309 ?auto_68312 ) ) ( not ( = ?auto_68309 ?auto_68313 ) ) ( not ( = ?auto_68309 ?auto_68314 ) ) ( not ( = ?auto_68310 ?auto_68311 ) ) ( not ( = ?auto_68310 ?auto_68312 ) ) ( not ( = ?auto_68310 ?auto_68313 ) ) ( not ( = ?auto_68310 ?auto_68314 ) ) ( not ( = ?auto_68311 ?auto_68312 ) ) ( not ( = ?auto_68311 ?auto_68313 ) ) ( not ( = ?auto_68311 ?auto_68314 ) ) ( not ( = ?auto_68312 ?auto_68313 ) ) ( not ( = ?auto_68312 ?auto_68314 ) ) ( not ( = ?auto_68313 ?auto_68314 ) ) )
    :subtasks
    ( ( !STACK ?auto_68314 ?auto_68313 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68315 - BLOCK
      ?auto_68316 - BLOCK
      ?auto_68317 - BLOCK
      ?auto_68318 - BLOCK
      ?auto_68319 - BLOCK
      ?auto_68320 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_68319 ) ( ON-TABLE ?auto_68315 ) ( ON ?auto_68316 ?auto_68315 ) ( ON ?auto_68317 ?auto_68316 ) ( ON ?auto_68318 ?auto_68317 ) ( ON ?auto_68319 ?auto_68318 ) ( not ( = ?auto_68315 ?auto_68316 ) ) ( not ( = ?auto_68315 ?auto_68317 ) ) ( not ( = ?auto_68315 ?auto_68318 ) ) ( not ( = ?auto_68315 ?auto_68319 ) ) ( not ( = ?auto_68315 ?auto_68320 ) ) ( not ( = ?auto_68316 ?auto_68317 ) ) ( not ( = ?auto_68316 ?auto_68318 ) ) ( not ( = ?auto_68316 ?auto_68319 ) ) ( not ( = ?auto_68316 ?auto_68320 ) ) ( not ( = ?auto_68317 ?auto_68318 ) ) ( not ( = ?auto_68317 ?auto_68319 ) ) ( not ( = ?auto_68317 ?auto_68320 ) ) ( not ( = ?auto_68318 ?auto_68319 ) ) ( not ( = ?auto_68318 ?auto_68320 ) ) ( not ( = ?auto_68319 ?auto_68320 ) ) ( ON-TABLE ?auto_68320 ) ( CLEAR ?auto_68320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_68320 )
      ( MAKE-6PILE ?auto_68315 ?auto_68316 ?auto_68317 ?auto_68318 ?auto_68319 ?auto_68320 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68321 - BLOCK
      ?auto_68322 - BLOCK
      ?auto_68323 - BLOCK
      ?auto_68324 - BLOCK
      ?auto_68325 - BLOCK
      ?auto_68326 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68321 ) ( ON ?auto_68322 ?auto_68321 ) ( ON ?auto_68323 ?auto_68322 ) ( ON ?auto_68324 ?auto_68323 ) ( not ( = ?auto_68321 ?auto_68322 ) ) ( not ( = ?auto_68321 ?auto_68323 ) ) ( not ( = ?auto_68321 ?auto_68324 ) ) ( not ( = ?auto_68321 ?auto_68325 ) ) ( not ( = ?auto_68321 ?auto_68326 ) ) ( not ( = ?auto_68322 ?auto_68323 ) ) ( not ( = ?auto_68322 ?auto_68324 ) ) ( not ( = ?auto_68322 ?auto_68325 ) ) ( not ( = ?auto_68322 ?auto_68326 ) ) ( not ( = ?auto_68323 ?auto_68324 ) ) ( not ( = ?auto_68323 ?auto_68325 ) ) ( not ( = ?auto_68323 ?auto_68326 ) ) ( not ( = ?auto_68324 ?auto_68325 ) ) ( not ( = ?auto_68324 ?auto_68326 ) ) ( not ( = ?auto_68325 ?auto_68326 ) ) ( ON-TABLE ?auto_68326 ) ( CLEAR ?auto_68326 ) ( HOLDING ?auto_68325 ) ( CLEAR ?auto_68324 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68321 ?auto_68322 ?auto_68323 ?auto_68324 ?auto_68325 )
      ( MAKE-6PILE ?auto_68321 ?auto_68322 ?auto_68323 ?auto_68324 ?auto_68325 ?auto_68326 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68327 - BLOCK
      ?auto_68328 - BLOCK
      ?auto_68329 - BLOCK
      ?auto_68330 - BLOCK
      ?auto_68331 - BLOCK
      ?auto_68332 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68327 ) ( ON ?auto_68328 ?auto_68327 ) ( ON ?auto_68329 ?auto_68328 ) ( ON ?auto_68330 ?auto_68329 ) ( not ( = ?auto_68327 ?auto_68328 ) ) ( not ( = ?auto_68327 ?auto_68329 ) ) ( not ( = ?auto_68327 ?auto_68330 ) ) ( not ( = ?auto_68327 ?auto_68331 ) ) ( not ( = ?auto_68327 ?auto_68332 ) ) ( not ( = ?auto_68328 ?auto_68329 ) ) ( not ( = ?auto_68328 ?auto_68330 ) ) ( not ( = ?auto_68328 ?auto_68331 ) ) ( not ( = ?auto_68328 ?auto_68332 ) ) ( not ( = ?auto_68329 ?auto_68330 ) ) ( not ( = ?auto_68329 ?auto_68331 ) ) ( not ( = ?auto_68329 ?auto_68332 ) ) ( not ( = ?auto_68330 ?auto_68331 ) ) ( not ( = ?auto_68330 ?auto_68332 ) ) ( not ( = ?auto_68331 ?auto_68332 ) ) ( ON-TABLE ?auto_68332 ) ( CLEAR ?auto_68330 ) ( ON ?auto_68331 ?auto_68332 ) ( CLEAR ?auto_68331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68332 )
      ( MAKE-6PILE ?auto_68327 ?auto_68328 ?auto_68329 ?auto_68330 ?auto_68331 ?auto_68332 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68333 - BLOCK
      ?auto_68334 - BLOCK
      ?auto_68335 - BLOCK
      ?auto_68336 - BLOCK
      ?auto_68337 - BLOCK
      ?auto_68338 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68333 ) ( ON ?auto_68334 ?auto_68333 ) ( ON ?auto_68335 ?auto_68334 ) ( not ( = ?auto_68333 ?auto_68334 ) ) ( not ( = ?auto_68333 ?auto_68335 ) ) ( not ( = ?auto_68333 ?auto_68336 ) ) ( not ( = ?auto_68333 ?auto_68337 ) ) ( not ( = ?auto_68333 ?auto_68338 ) ) ( not ( = ?auto_68334 ?auto_68335 ) ) ( not ( = ?auto_68334 ?auto_68336 ) ) ( not ( = ?auto_68334 ?auto_68337 ) ) ( not ( = ?auto_68334 ?auto_68338 ) ) ( not ( = ?auto_68335 ?auto_68336 ) ) ( not ( = ?auto_68335 ?auto_68337 ) ) ( not ( = ?auto_68335 ?auto_68338 ) ) ( not ( = ?auto_68336 ?auto_68337 ) ) ( not ( = ?auto_68336 ?auto_68338 ) ) ( not ( = ?auto_68337 ?auto_68338 ) ) ( ON-TABLE ?auto_68338 ) ( ON ?auto_68337 ?auto_68338 ) ( CLEAR ?auto_68337 ) ( HOLDING ?auto_68336 ) ( CLEAR ?auto_68335 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68333 ?auto_68334 ?auto_68335 ?auto_68336 )
      ( MAKE-6PILE ?auto_68333 ?auto_68334 ?auto_68335 ?auto_68336 ?auto_68337 ?auto_68338 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68339 - BLOCK
      ?auto_68340 - BLOCK
      ?auto_68341 - BLOCK
      ?auto_68342 - BLOCK
      ?auto_68343 - BLOCK
      ?auto_68344 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68339 ) ( ON ?auto_68340 ?auto_68339 ) ( ON ?auto_68341 ?auto_68340 ) ( not ( = ?auto_68339 ?auto_68340 ) ) ( not ( = ?auto_68339 ?auto_68341 ) ) ( not ( = ?auto_68339 ?auto_68342 ) ) ( not ( = ?auto_68339 ?auto_68343 ) ) ( not ( = ?auto_68339 ?auto_68344 ) ) ( not ( = ?auto_68340 ?auto_68341 ) ) ( not ( = ?auto_68340 ?auto_68342 ) ) ( not ( = ?auto_68340 ?auto_68343 ) ) ( not ( = ?auto_68340 ?auto_68344 ) ) ( not ( = ?auto_68341 ?auto_68342 ) ) ( not ( = ?auto_68341 ?auto_68343 ) ) ( not ( = ?auto_68341 ?auto_68344 ) ) ( not ( = ?auto_68342 ?auto_68343 ) ) ( not ( = ?auto_68342 ?auto_68344 ) ) ( not ( = ?auto_68343 ?auto_68344 ) ) ( ON-TABLE ?auto_68344 ) ( ON ?auto_68343 ?auto_68344 ) ( CLEAR ?auto_68341 ) ( ON ?auto_68342 ?auto_68343 ) ( CLEAR ?auto_68342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68344 ?auto_68343 )
      ( MAKE-6PILE ?auto_68339 ?auto_68340 ?auto_68341 ?auto_68342 ?auto_68343 ?auto_68344 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68345 - BLOCK
      ?auto_68346 - BLOCK
      ?auto_68347 - BLOCK
      ?auto_68348 - BLOCK
      ?auto_68349 - BLOCK
      ?auto_68350 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68345 ) ( ON ?auto_68346 ?auto_68345 ) ( not ( = ?auto_68345 ?auto_68346 ) ) ( not ( = ?auto_68345 ?auto_68347 ) ) ( not ( = ?auto_68345 ?auto_68348 ) ) ( not ( = ?auto_68345 ?auto_68349 ) ) ( not ( = ?auto_68345 ?auto_68350 ) ) ( not ( = ?auto_68346 ?auto_68347 ) ) ( not ( = ?auto_68346 ?auto_68348 ) ) ( not ( = ?auto_68346 ?auto_68349 ) ) ( not ( = ?auto_68346 ?auto_68350 ) ) ( not ( = ?auto_68347 ?auto_68348 ) ) ( not ( = ?auto_68347 ?auto_68349 ) ) ( not ( = ?auto_68347 ?auto_68350 ) ) ( not ( = ?auto_68348 ?auto_68349 ) ) ( not ( = ?auto_68348 ?auto_68350 ) ) ( not ( = ?auto_68349 ?auto_68350 ) ) ( ON-TABLE ?auto_68350 ) ( ON ?auto_68349 ?auto_68350 ) ( ON ?auto_68348 ?auto_68349 ) ( CLEAR ?auto_68348 ) ( HOLDING ?auto_68347 ) ( CLEAR ?auto_68346 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68345 ?auto_68346 ?auto_68347 )
      ( MAKE-6PILE ?auto_68345 ?auto_68346 ?auto_68347 ?auto_68348 ?auto_68349 ?auto_68350 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68351 - BLOCK
      ?auto_68352 - BLOCK
      ?auto_68353 - BLOCK
      ?auto_68354 - BLOCK
      ?auto_68355 - BLOCK
      ?auto_68356 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68351 ) ( ON ?auto_68352 ?auto_68351 ) ( not ( = ?auto_68351 ?auto_68352 ) ) ( not ( = ?auto_68351 ?auto_68353 ) ) ( not ( = ?auto_68351 ?auto_68354 ) ) ( not ( = ?auto_68351 ?auto_68355 ) ) ( not ( = ?auto_68351 ?auto_68356 ) ) ( not ( = ?auto_68352 ?auto_68353 ) ) ( not ( = ?auto_68352 ?auto_68354 ) ) ( not ( = ?auto_68352 ?auto_68355 ) ) ( not ( = ?auto_68352 ?auto_68356 ) ) ( not ( = ?auto_68353 ?auto_68354 ) ) ( not ( = ?auto_68353 ?auto_68355 ) ) ( not ( = ?auto_68353 ?auto_68356 ) ) ( not ( = ?auto_68354 ?auto_68355 ) ) ( not ( = ?auto_68354 ?auto_68356 ) ) ( not ( = ?auto_68355 ?auto_68356 ) ) ( ON-TABLE ?auto_68356 ) ( ON ?auto_68355 ?auto_68356 ) ( ON ?auto_68354 ?auto_68355 ) ( CLEAR ?auto_68352 ) ( ON ?auto_68353 ?auto_68354 ) ( CLEAR ?auto_68353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68356 ?auto_68355 ?auto_68354 )
      ( MAKE-6PILE ?auto_68351 ?auto_68352 ?auto_68353 ?auto_68354 ?auto_68355 ?auto_68356 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68357 - BLOCK
      ?auto_68358 - BLOCK
      ?auto_68359 - BLOCK
      ?auto_68360 - BLOCK
      ?auto_68361 - BLOCK
      ?auto_68362 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68357 ) ( not ( = ?auto_68357 ?auto_68358 ) ) ( not ( = ?auto_68357 ?auto_68359 ) ) ( not ( = ?auto_68357 ?auto_68360 ) ) ( not ( = ?auto_68357 ?auto_68361 ) ) ( not ( = ?auto_68357 ?auto_68362 ) ) ( not ( = ?auto_68358 ?auto_68359 ) ) ( not ( = ?auto_68358 ?auto_68360 ) ) ( not ( = ?auto_68358 ?auto_68361 ) ) ( not ( = ?auto_68358 ?auto_68362 ) ) ( not ( = ?auto_68359 ?auto_68360 ) ) ( not ( = ?auto_68359 ?auto_68361 ) ) ( not ( = ?auto_68359 ?auto_68362 ) ) ( not ( = ?auto_68360 ?auto_68361 ) ) ( not ( = ?auto_68360 ?auto_68362 ) ) ( not ( = ?auto_68361 ?auto_68362 ) ) ( ON-TABLE ?auto_68362 ) ( ON ?auto_68361 ?auto_68362 ) ( ON ?auto_68360 ?auto_68361 ) ( ON ?auto_68359 ?auto_68360 ) ( CLEAR ?auto_68359 ) ( HOLDING ?auto_68358 ) ( CLEAR ?auto_68357 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68357 ?auto_68358 )
      ( MAKE-6PILE ?auto_68357 ?auto_68358 ?auto_68359 ?auto_68360 ?auto_68361 ?auto_68362 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68363 - BLOCK
      ?auto_68364 - BLOCK
      ?auto_68365 - BLOCK
      ?auto_68366 - BLOCK
      ?auto_68367 - BLOCK
      ?auto_68368 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68363 ) ( not ( = ?auto_68363 ?auto_68364 ) ) ( not ( = ?auto_68363 ?auto_68365 ) ) ( not ( = ?auto_68363 ?auto_68366 ) ) ( not ( = ?auto_68363 ?auto_68367 ) ) ( not ( = ?auto_68363 ?auto_68368 ) ) ( not ( = ?auto_68364 ?auto_68365 ) ) ( not ( = ?auto_68364 ?auto_68366 ) ) ( not ( = ?auto_68364 ?auto_68367 ) ) ( not ( = ?auto_68364 ?auto_68368 ) ) ( not ( = ?auto_68365 ?auto_68366 ) ) ( not ( = ?auto_68365 ?auto_68367 ) ) ( not ( = ?auto_68365 ?auto_68368 ) ) ( not ( = ?auto_68366 ?auto_68367 ) ) ( not ( = ?auto_68366 ?auto_68368 ) ) ( not ( = ?auto_68367 ?auto_68368 ) ) ( ON-TABLE ?auto_68368 ) ( ON ?auto_68367 ?auto_68368 ) ( ON ?auto_68366 ?auto_68367 ) ( ON ?auto_68365 ?auto_68366 ) ( CLEAR ?auto_68363 ) ( ON ?auto_68364 ?auto_68365 ) ( CLEAR ?auto_68364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68368 ?auto_68367 ?auto_68366 ?auto_68365 )
      ( MAKE-6PILE ?auto_68363 ?auto_68364 ?auto_68365 ?auto_68366 ?auto_68367 ?auto_68368 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68369 - BLOCK
      ?auto_68370 - BLOCK
      ?auto_68371 - BLOCK
      ?auto_68372 - BLOCK
      ?auto_68373 - BLOCK
      ?auto_68374 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68369 ?auto_68370 ) ) ( not ( = ?auto_68369 ?auto_68371 ) ) ( not ( = ?auto_68369 ?auto_68372 ) ) ( not ( = ?auto_68369 ?auto_68373 ) ) ( not ( = ?auto_68369 ?auto_68374 ) ) ( not ( = ?auto_68370 ?auto_68371 ) ) ( not ( = ?auto_68370 ?auto_68372 ) ) ( not ( = ?auto_68370 ?auto_68373 ) ) ( not ( = ?auto_68370 ?auto_68374 ) ) ( not ( = ?auto_68371 ?auto_68372 ) ) ( not ( = ?auto_68371 ?auto_68373 ) ) ( not ( = ?auto_68371 ?auto_68374 ) ) ( not ( = ?auto_68372 ?auto_68373 ) ) ( not ( = ?auto_68372 ?auto_68374 ) ) ( not ( = ?auto_68373 ?auto_68374 ) ) ( ON-TABLE ?auto_68374 ) ( ON ?auto_68373 ?auto_68374 ) ( ON ?auto_68372 ?auto_68373 ) ( ON ?auto_68371 ?auto_68372 ) ( ON ?auto_68370 ?auto_68371 ) ( CLEAR ?auto_68370 ) ( HOLDING ?auto_68369 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68369 )
      ( MAKE-6PILE ?auto_68369 ?auto_68370 ?auto_68371 ?auto_68372 ?auto_68373 ?auto_68374 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68375 - BLOCK
      ?auto_68376 - BLOCK
      ?auto_68377 - BLOCK
      ?auto_68378 - BLOCK
      ?auto_68379 - BLOCK
      ?auto_68380 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68375 ?auto_68376 ) ) ( not ( = ?auto_68375 ?auto_68377 ) ) ( not ( = ?auto_68375 ?auto_68378 ) ) ( not ( = ?auto_68375 ?auto_68379 ) ) ( not ( = ?auto_68375 ?auto_68380 ) ) ( not ( = ?auto_68376 ?auto_68377 ) ) ( not ( = ?auto_68376 ?auto_68378 ) ) ( not ( = ?auto_68376 ?auto_68379 ) ) ( not ( = ?auto_68376 ?auto_68380 ) ) ( not ( = ?auto_68377 ?auto_68378 ) ) ( not ( = ?auto_68377 ?auto_68379 ) ) ( not ( = ?auto_68377 ?auto_68380 ) ) ( not ( = ?auto_68378 ?auto_68379 ) ) ( not ( = ?auto_68378 ?auto_68380 ) ) ( not ( = ?auto_68379 ?auto_68380 ) ) ( ON-TABLE ?auto_68380 ) ( ON ?auto_68379 ?auto_68380 ) ( ON ?auto_68378 ?auto_68379 ) ( ON ?auto_68377 ?auto_68378 ) ( ON ?auto_68376 ?auto_68377 ) ( ON ?auto_68375 ?auto_68376 ) ( CLEAR ?auto_68375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68380 ?auto_68379 ?auto_68378 ?auto_68377 ?auto_68376 )
      ( MAKE-6PILE ?auto_68375 ?auto_68376 ?auto_68377 ?auto_68378 ?auto_68379 ?auto_68380 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68381 - BLOCK
      ?auto_68382 - BLOCK
      ?auto_68383 - BLOCK
      ?auto_68384 - BLOCK
      ?auto_68385 - BLOCK
      ?auto_68386 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68381 ?auto_68382 ) ) ( not ( = ?auto_68381 ?auto_68383 ) ) ( not ( = ?auto_68381 ?auto_68384 ) ) ( not ( = ?auto_68381 ?auto_68385 ) ) ( not ( = ?auto_68381 ?auto_68386 ) ) ( not ( = ?auto_68382 ?auto_68383 ) ) ( not ( = ?auto_68382 ?auto_68384 ) ) ( not ( = ?auto_68382 ?auto_68385 ) ) ( not ( = ?auto_68382 ?auto_68386 ) ) ( not ( = ?auto_68383 ?auto_68384 ) ) ( not ( = ?auto_68383 ?auto_68385 ) ) ( not ( = ?auto_68383 ?auto_68386 ) ) ( not ( = ?auto_68384 ?auto_68385 ) ) ( not ( = ?auto_68384 ?auto_68386 ) ) ( not ( = ?auto_68385 ?auto_68386 ) ) ( ON-TABLE ?auto_68386 ) ( ON ?auto_68385 ?auto_68386 ) ( ON ?auto_68384 ?auto_68385 ) ( ON ?auto_68383 ?auto_68384 ) ( ON ?auto_68382 ?auto_68383 ) ( HOLDING ?auto_68381 ) ( CLEAR ?auto_68382 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_68386 ?auto_68385 ?auto_68384 ?auto_68383 ?auto_68382 ?auto_68381 )
      ( MAKE-6PILE ?auto_68381 ?auto_68382 ?auto_68383 ?auto_68384 ?auto_68385 ?auto_68386 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68387 - BLOCK
      ?auto_68388 - BLOCK
      ?auto_68389 - BLOCK
      ?auto_68390 - BLOCK
      ?auto_68391 - BLOCK
      ?auto_68392 - BLOCK
    )
    :vars
    (
      ?auto_68393 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68387 ?auto_68388 ) ) ( not ( = ?auto_68387 ?auto_68389 ) ) ( not ( = ?auto_68387 ?auto_68390 ) ) ( not ( = ?auto_68387 ?auto_68391 ) ) ( not ( = ?auto_68387 ?auto_68392 ) ) ( not ( = ?auto_68388 ?auto_68389 ) ) ( not ( = ?auto_68388 ?auto_68390 ) ) ( not ( = ?auto_68388 ?auto_68391 ) ) ( not ( = ?auto_68388 ?auto_68392 ) ) ( not ( = ?auto_68389 ?auto_68390 ) ) ( not ( = ?auto_68389 ?auto_68391 ) ) ( not ( = ?auto_68389 ?auto_68392 ) ) ( not ( = ?auto_68390 ?auto_68391 ) ) ( not ( = ?auto_68390 ?auto_68392 ) ) ( not ( = ?auto_68391 ?auto_68392 ) ) ( ON-TABLE ?auto_68392 ) ( ON ?auto_68391 ?auto_68392 ) ( ON ?auto_68390 ?auto_68391 ) ( ON ?auto_68389 ?auto_68390 ) ( ON ?auto_68388 ?auto_68389 ) ( CLEAR ?auto_68388 ) ( ON ?auto_68387 ?auto_68393 ) ( CLEAR ?auto_68387 ) ( HAND-EMPTY ) ( not ( = ?auto_68387 ?auto_68393 ) ) ( not ( = ?auto_68388 ?auto_68393 ) ) ( not ( = ?auto_68389 ?auto_68393 ) ) ( not ( = ?auto_68390 ?auto_68393 ) ) ( not ( = ?auto_68391 ?auto_68393 ) ) ( not ( = ?auto_68392 ?auto_68393 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68387 ?auto_68393 )
      ( MAKE-6PILE ?auto_68387 ?auto_68388 ?auto_68389 ?auto_68390 ?auto_68391 ?auto_68392 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68394 - BLOCK
      ?auto_68395 - BLOCK
      ?auto_68396 - BLOCK
      ?auto_68397 - BLOCK
      ?auto_68398 - BLOCK
      ?auto_68399 - BLOCK
    )
    :vars
    (
      ?auto_68400 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68394 ?auto_68395 ) ) ( not ( = ?auto_68394 ?auto_68396 ) ) ( not ( = ?auto_68394 ?auto_68397 ) ) ( not ( = ?auto_68394 ?auto_68398 ) ) ( not ( = ?auto_68394 ?auto_68399 ) ) ( not ( = ?auto_68395 ?auto_68396 ) ) ( not ( = ?auto_68395 ?auto_68397 ) ) ( not ( = ?auto_68395 ?auto_68398 ) ) ( not ( = ?auto_68395 ?auto_68399 ) ) ( not ( = ?auto_68396 ?auto_68397 ) ) ( not ( = ?auto_68396 ?auto_68398 ) ) ( not ( = ?auto_68396 ?auto_68399 ) ) ( not ( = ?auto_68397 ?auto_68398 ) ) ( not ( = ?auto_68397 ?auto_68399 ) ) ( not ( = ?auto_68398 ?auto_68399 ) ) ( ON-TABLE ?auto_68399 ) ( ON ?auto_68398 ?auto_68399 ) ( ON ?auto_68397 ?auto_68398 ) ( ON ?auto_68396 ?auto_68397 ) ( ON ?auto_68394 ?auto_68400 ) ( CLEAR ?auto_68394 ) ( not ( = ?auto_68394 ?auto_68400 ) ) ( not ( = ?auto_68395 ?auto_68400 ) ) ( not ( = ?auto_68396 ?auto_68400 ) ) ( not ( = ?auto_68397 ?auto_68400 ) ) ( not ( = ?auto_68398 ?auto_68400 ) ) ( not ( = ?auto_68399 ?auto_68400 ) ) ( HOLDING ?auto_68395 ) ( CLEAR ?auto_68396 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68399 ?auto_68398 ?auto_68397 ?auto_68396 ?auto_68395 )
      ( MAKE-6PILE ?auto_68394 ?auto_68395 ?auto_68396 ?auto_68397 ?auto_68398 ?auto_68399 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68401 - BLOCK
      ?auto_68402 - BLOCK
      ?auto_68403 - BLOCK
      ?auto_68404 - BLOCK
      ?auto_68405 - BLOCK
      ?auto_68406 - BLOCK
    )
    :vars
    (
      ?auto_68407 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68401 ?auto_68402 ) ) ( not ( = ?auto_68401 ?auto_68403 ) ) ( not ( = ?auto_68401 ?auto_68404 ) ) ( not ( = ?auto_68401 ?auto_68405 ) ) ( not ( = ?auto_68401 ?auto_68406 ) ) ( not ( = ?auto_68402 ?auto_68403 ) ) ( not ( = ?auto_68402 ?auto_68404 ) ) ( not ( = ?auto_68402 ?auto_68405 ) ) ( not ( = ?auto_68402 ?auto_68406 ) ) ( not ( = ?auto_68403 ?auto_68404 ) ) ( not ( = ?auto_68403 ?auto_68405 ) ) ( not ( = ?auto_68403 ?auto_68406 ) ) ( not ( = ?auto_68404 ?auto_68405 ) ) ( not ( = ?auto_68404 ?auto_68406 ) ) ( not ( = ?auto_68405 ?auto_68406 ) ) ( ON-TABLE ?auto_68406 ) ( ON ?auto_68405 ?auto_68406 ) ( ON ?auto_68404 ?auto_68405 ) ( ON ?auto_68403 ?auto_68404 ) ( ON ?auto_68401 ?auto_68407 ) ( not ( = ?auto_68401 ?auto_68407 ) ) ( not ( = ?auto_68402 ?auto_68407 ) ) ( not ( = ?auto_68403 ?auto_68407 ) ) ( not ( = ?auto_68404 ?auto_68407 ) ) ( not ( = ?auto_68405 ?auto_68407 ) ) ( not ( = ?auto_68406 ?auto_68407 ) ) ( CLEAR ?auto_68403 ) ( ON ?auto_68402 ?auto_68401 ) ( CLEAR ?auto_68402 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68407 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68407 ?auto_68401 )
      ( MAKE-6PILE ?auto_68401 ?auto_68402 ?auto_68403 ?auto_68404 ?auto_68405 ?auto_68406 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68408 - BLOCK
      ?auto_68409 - BLOCK
      ?auto_68410 - BLOCK
      ?auto_68411 - BLOCK
      ?auto_68412 - BLOCK
      ?auto_68413 - BLOCK
    )
    :vars
    (
      ?auto_68414 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68408 ?auto_68409 ) ) ( not ( = ?auto_68408 ?auto_68410 ) ) ( not ( = ?auto_68408 ?auto_68411 ) ) ( not ( = ?auto_68408 ?auto_68412 ) ) ( not ( = ?auto_68408 ?auto_68413 ) ) ( not ( = ?auto_68409 ?auto_68410 ) ) ( not ( = ?auto_68409 ?auto_68411 ) ) ( not ( = ?auto_68409 ?auto_68412 ) ) ( not ( = ?auto_68409 ?auto_68413 ) ) ( not ( = ?auto_68410 ?auto_68411 ) ) ( not ( = ?auto_68410 ?auto_68412 ) ) ( not ( = ?auto_68410 ?auto_68413 ) ) ( not ( = ?auto_68411 ?auto_68412 ) ) ( not ( = ?auto_68411 ?auto_68413 ) ) ( not ( = ?auto_68412 ?auto_68413 ) ) ( ON-TABLE ?auto_68413 ) ( ON ?auto_68412 ?auto_68413 ) ( ON ?auto_68411 ?auto_68412 ) ( ON ?auto_68408 ?auto_68414 ) ( not ( = ?auto_68408 ?auto_68414 ) ) ( not ( = ?auto_68409 ?auto_68414 ) ) ( not ( = ?auto_68410 ?auto_68414 ) ) ( not ( = ?auto_68411 ?auto_68414 ) ) ( not ( = ?auto_68412 ?auto_68414 ) ) ( not ( = ?auto_68413 ?auto_68414 ) ) ( ON ?auto_68409 ?auto_68408 ) ( CLEAR ?auto_68409 ) ( ON-TABLE ?auto_68414 ) ( HOLDING ?auto_68410 ) ( CLEAR ?auto_68411 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68413 ?auto_68412 ?auto_68411 ?auto_68410 )
      ( MAKE-6PILE ?auto_68408 ?auto_68409 ?auto_68410 ?auto_68411 ?auto_68412 ?auto_68413 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68415 - BLOCK
      ?auto_68416 - BLOCK
      ?auto_68417 - BLOCK
      ?auto_68418 - BLOCK
      ?auto_68419 - BLOCK
      ?auto_68420 - BLOCK
    )
    :vars
    (
      ?auto_68421 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68415 ?auto_68416 ) ) ( not ( = ?auto_68415 ?auto_68417 ) ) ( not ( = ?auto_68415 ?auto_68418 ) ) ( not ( = ?auto_68415 ?auto_68419 ) ) ( not ( = ?auto_68415 ?auto_68420 ) ) ( not ( = ?auto_68416 ?auto_68417 ) ) ( not ( = ?auto_68416 ?auto_68418 ) ) ( not ( = ?auto_68416 ?auto_68419 ) ) ( not ( = ?auto_68416 ?auto_68420 ) ) ( not ( = ?auto_68417 ?auto_68418 ) ) ( not ( = ?auto_68417 ?auto_68419 ) ) ( not ( = ?auto_68417 ?auto_68420 ) ) ( not ( = ?auto_68418 ?auto_68419 ) ) ( not ( = ?auto_68418 ?auto_68420 ) ) ( not ( = ?auto_68419 ?auto_68420 ) ) ( ON-TABLE ?auto_68420 ) ( ON ?auto_68419 ?auto_68420 ) ( ON ?auto_68418 ?auto_68419 ) ( ON ?auto_68415 ?auto_68421 ) ( not ( = ?auto_68415 ?auto_68421 ) ) ( not ( = ?auto_68416 ?auto_68421 ) ) ( not ( = ?auto_68417 ?auto_68421 ) ) ( not ( = ?auto_68418 ?auto_68421 ) ) ( not ( = ?auto_68419 ?auto_68421 ) ) ( not ( = ?auto_68420 ?auto_68421 ) ) ( ON ?auto_68416 ?auto_68415 ) ( ON-TABLE ?auto_68421 ) ( CLEAR ?auto_68418 ) ( ON ?auto_68417 ?auto_68416 ) ( CLEAR ?auto_68417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68421 ?auto_68415 ?auto_68416 )
      ( MAKE-6PILE ?auto_68415 ?auto_68416 ?auto_68417 ?auto_68418 ?auto_68419 ?auto_68420 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68422 - BLOCK
      ?auto_68423 - BLOCK
      ?auto_68424 - BLOCK
      ?auto_68425 - BLOCK
      ?auto_68426 - BLOCK
      ?auto_68427 - BLOCK
    )
    :vars
    (
      ?auto_68428 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68422 ?auto_68423 ) ) ( not ( = ?auto_68422 ?auto_68424 ) ) ( not ( = ?auto_68422 ?auto_68425 ) ) ( not ( = ?auto_68422 ?auto_68426 ) ) ( not ( = ?auto_68422 ?auto_68427 ) ) ( not ( = ?auto_68423 ?auto_68424 ) ) ( not ( = ?auto_68423 ?auto_68425 ) ) ( not ( = ?auto_68423 ?auto_68426 ) ) ( not ( = ?auto_68423 ?auto_68427 ) ) ( not ( = ?auto_68424 ?auto_68425 ) ) ( not ( = ?auto_68424 ?auto_68426 ) ) ( not ( = ?auto_68424 ?auto_68427 ) ) ( not ( = ?auto_68425 ?auto_68426 ) ) ( not ( = ?auto_68425 ?auto_68427 ) ) ( not ( = ?auto_68426 ?auto_68427 ) ) ( ON-TABLE ?auto_68427 ) ( ON ?auto_68426 ?auto_68427 ) ( ON ?auto_68422 ?auto_68428 ) ( not ( = ?auto_68422 ?auto_68428 ) ) ( not ( = ?auto_68423 ?auto_68428 ) ) ( not ( = ?auto_68424 ?auto_68428 ) ) ( not ( = ?auto_68425 ?auto_68428 ) ) ( not ( = ?auto_68426 ?auto_68428 ) ) ( not ( = ?auto_68427 ?auto_68428 ) ) ( ON ?auto_68423 ?auto_68422 ) ( ON-TABLE ?auto_68428 ) ( ON ?auto_68424 ?auto_68423 ) ( CLEAR ?auto_68424 ) ( HOLDING ?auto_68425 ) ( CLEAR ?auto_68426 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68427 ?auto_68426 ?auto_68425 )
      ( MAKE-6PILE ?auto_68422 ?auto_68423 ?auto_68424 ?auto_68425 ?auto_68426 ?auto_68427 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68429 - BLOCK
      ?auto_68430 - BLOCK
      ?auto_68431 - BLOCK
      ?auto_68432 - BLOCK
      ?auto_68433 - BLOCK
      ?auto_68434 - BLOCK
    )
    :vars
    (
      ?auto_68435 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68429 ?auto_68430 ) ) ( not ( = ?auto_68429 ?auto_68431 ) ) ( not ( = ?auto_68429 ?auto_68432 ) ) ( not ( = ?auto_68429 ?auto_68433 ) ) ( not ( = ?auto_68429 ?auto_68434 ) ) ( not ( = ?auto_68430 ?auto_68431 ) ) ( not ( = ?auto_68430 ?auto_68432 ) ) ( not ( = ?auto_68430 ?auto_68433 ) ) ( not ( = ?auto_68430 ?auto_68434 ) ) ( not ( = ?auto_68431 ?auto_68432 ) ) ( not ( = ?auto_68431 ?auto_68433 ) ) ( not ( = ?auto_68431 ?auto_68434 ) ) ( not ( = ?auto_68432 ?auto_68433 ) ) ( not ( = ?auto_68432 ?auto_68434 ) ) ( not ( = ?auto_68433 ?auto_68434 ) ) ( ON-TABLE ?auto_68434 ) ( ON ?auto_68433 ?auto_68434 ) ( ON ?auto_68429 ?auto_68435 ) ( not ( = ?auto_68429 ?auto_68435 ) ) ( not ( = ?auto_68430 ?auto_68435 ) ) ( not ( = ?auto_68431 ?auto_68435 ) ) ( not ( = ?auto_68432 ?auto_68435 ) ) ( not ( = ?auto_68433 ?auto_68435 ) ) ( not ( = ?auto_68434 ?auto_68435 ) ) ( ON ?auto_68430 ?auto_68429 ) ( ON-TABLE ?auto_68435 ) ( ON ?auto_68431 ?auto_68430 ) ( CLEAR ?auto_68433 ) ( ON ?auto_68432 ?auto_68431 ) ( CLEAR ?auto_68432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68435 ?auto_68429 ?auto_68430 ?auto_68431 )
      ( MAKE-6PILE ?auto_68429 ?auto_68430 ?auto_68431 ?auto_68432 ?auto_68433 ?auto_68434 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68436 - BLOCK
      ?auto_68437 - BLOCK
      ?auto_68438 - BLOCK
      ?auto_68439 - BLOCK
      ?auto_68440 - BLOCK
      ?auto_68441 - BLOCK
    )
    :vars
    (
      ?auto_68442 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68436 ?auto_68437 ) ) ( not ( = ?auto_68436 ?auto_68438 ) ) ( not ( = ?auto_68436 ?auto_68439 ) ) ( not ( = ?auto_68436 ?auto_68440 ) ) ( not ( = ?auto_68436 ?auto_68441 ) ) ( not ( = ?auto_68437 ?auto_68438 ) ) ( not ( = ?auto_68437 ?auto_68439 ) ) ( not ( = ?auto_68437 ?auto_68440 ) ) ( not ( = ?auto_68437 ?auto_68441 ) ) ( not ( = ?auto_68438 ?auto_68439 ) ) ( not ( = ?auto_68438 ?auto_68440 ) ) ( not ( = ?auto_68438 ?auto_68441 ) ) ( not ( = ?auto_68439 ?auto_68440 ) ) ( not ( = ?auto_68439 ?auto_68441 ) ) ( not ( = ?auto_68440 ?auto_68441 ) ) ( ON-TABLE ?auto_68441 ) ( ON ?auto_68436 ?auto_68442 ) ( not ( = ?auto_68436 ?auto_68442 ) ) ( not ( = ?auto_68437 ?auto_68442 ) ) ( not ( = ?auto_68438 ?auto_68442 ) ) ( not ( = ?auto_68439 ?auto_68442 ) ) ( not ( = ?auto_68440 ?auto_68442 ) ) ( not ( = ?auto_68441 ?auto_68442 ) ) ( ON ?auto_68437 ?auto_68436 ) ( ON-TABLE ?auto_68442 ) ( ON ?auto_68438 ?auto_68437 ) ( ON ?auto_68439 ?auto_68438 ) ( CLEAR ?auto_68439 ) ( HOLDING ?auto_68440 ) ( CLEAR ?auto_68441 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68441 ?auto_68440 )
      ( MAKE-6PILE ?auto_68436 ?auto_68437 ?auto_68438 ?auto_68439 ?auto_68440 ?auto_68441 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68443 - BLOCK
      ?auto_68444 - BLOCK
      ?auto_68445 - BLOCK
      ?auto_68446 - BLOCK
      ?auto_68447 - BLOCK
      ?auto_68448 - BLOCK
    )
    :vars
    (
      ?auto_68449 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68443 ?auto_68444 ) ) ( not ( = ?auto_68443 ?auto_68445 ) ) ( not ( = ?auto_68443 ?auto_68446 ) ) ( not ( = ?auto_68443 ?auto_68447 ) ) ( not ( = ?auto_68443 ?auto_68448 ) ) ( not ( = ?auto_68444 ?auto_68445 ) ) ( not ( = ?auto_68444 ?auto_68446 ) ) ( not ( = ?auto_68444 ?auto_68447 ) ) ( not ( = ?auto_68444 ?auto_68448 ) ) ( not ( = ?auto_68445 ?auto_68446 ) ) ( not ( = ?auto_68445 ?auto_68447 ) ) ( not ( = ?auto_68445 ?auto_68448 ) ) ( not ( = ?auto_68446 ?auto_68447 ) ) ( not ( = ?auto_68446 ?auto_68448 ) ) ( not ( = ?auto_68447 ?auto_68448 ) ) ( ON-TABLE ?auto_68448 ) ( ON ?auto_68443 ?auto_68449 ) ( not ( = ?auto_68443 ?auto_68449 ) ) ( not ( = ?auto_68444 ?auto_68449 ) ) ( not ( = ?auto_68445 ?auto_68449 ) ) ( not ( = ?auto_68446 ?auto_68449 ) ) ( not ( = ?auto_68447 ?auto_68449 ) ) ( not ( = ?auto_68448 ?auto_68449 ) ) ( ON ?auto_68444 ?auto_68443 ) ( ON-TABLE ?auto_68449 ) ( ON ?auto_68445 ?auto_68444 ) ( ON ?auto_68446 ?auto_68445 ) ( CLEAR ?auto_68448 ) ( ON ?auto_68447 ?auto_68446 ) ( CLEAR ?auto_68447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68449 ?auto_68443 ?auto_68444 ?auto_68445 ?auto_68446 )
      ( MAKE-6PILE ?auto_68443 ?auto_68444 ?auto_68445 ?auto_68446 ?auto_68447 ?auto_68448 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68450 - BLOCK
      ?auto_68451 - BLOCK
      ?auto_68452 - BLOCK
      ?auto_68453 - BLOCK
      ?auto_68454 - BLOCK
      ?auto_68455 - BLOCK
    )
    :vars
    (
      ?auto_68456 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68450 ?auto_68451 ) ) ( not ( = ?auto_68450 ?auto_68452 ) ) ( not ( = ?auto_68450 ?auto_68453 ) ) ( not ( = ?auto_68450 ?auto_68454 ) ) ( not ( = ?auto_68450 ?auto_68455 ) ) ( not ( = ?auto_68451 ?auto_68452 ) ) ( not ( = ?auto_68451 ?auto_68453 ) ) ( not ( = ?auto_68451 ?auto_68454 ) ) ( not ( = ?auto_68451 ?auto_68455 ) ) ( not ( = ?auto_68452 ?auto_68453 ) ) ( not ( = ?auto_68452 ?auto_68454 ) ) ( not ( = ?auto_68452 ?auto_68455 ) ) ( not ( = ?auto_68453 ?auto_68454 ) ) ( not ( = ?auto_68453 ?auto_68455 ) ) ( not ( = ?auto_68454 ?auto_68455 ) ) ( ON ?auto_68450 ?auto_68456 ) ( not ( = ?auto_68450 ?auto_68456 ) ) ( not ( = ?auto_68451 ?auto_68456 ) ) ( not ( = ?auto_68452 ?auto_68456 ) ) ( not ( = ?auto_68453 ?auto_68456 ) ) ( not ( = ?auto_68454 ?auto_68456 ) ) ( not ( = ?auto_68455 ?auto_68456 ) ) ( ON ?auto_68451 ?auto_68450 ) ( ON-TABLE ?auto_68456 ) ( ON ?auto_68452 ?auto_68451 ) ( ON ?auto_68453 ?auto_68452 ) ( ON ?auto_68454 ?auto_68453 ) ( CLEAR ?auto_68454 ) ( HOLDING ?auto_68455 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68455 )
      ( MAKE-6PILE ?auto_68450 ?auto_68451 ?auto_68452 ?auto_68453 ?auto_68454 ?auto_68455 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68457 - BLOCK
      ?auto_68458 - BLOCK
      ?auto_68459 - BLOCK
      ?auto_68460 - BLOCK
      ?auto_68461 - BLOCK
      ?auto_68462 - BLOCK
    )
    :vars
    (
      ?auto_68463 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68457 ?auto_68458 ) ) ( not ( = ?auto_68457 ?auto_68459 ) ) ( not ( = ?auto_68457 ?auto_68460 ) ) ( not ( = ?auto_68457 ?auto_68461 ) ) ( not ( = ?auto_68457 ?auto_68462 ) ) ( not ( = ?auto_68458 ?auto_68459 ) ) ( not ( = ?auto_68458 ?auto_68460 ) ) ( not ( = ?auto_68458 ?auto_68461 ) ) ( not ( = ?auto_68458 ?auto_68462 ) ) ( not ( = ?auto_68459 ?auto_68460 ) ) ( not ( = ?auto_68459 ?auto_68461 ) ) ( not ( = ?auto_68459 ?auto_68462 ) ) ( not ( = ?auto_68460 ?auto_68461 ) ) ( not ( = ?auto_68460 ?auto_68462 ) ) ( not ( = ?auto_68461 ?auto_68462 ) ) ( ON ?auto_68457 ?auto_68463 ) ( not ( = ?auto_68457 ?auto_68463 ) ) ( not ( = ?auto_68458 ?auto_68463 ) ) ( not ( = ?auto_68459 ?auto_68463 ) ) ( not ( = ?auto_68460 ?auto_68463 ) ) ( not ( = ?auto_68461 ?auto_68463 ) ) ( not ( = ?auto_68462 ?auto_68463 ) ) ( ON ?auto_68458 ?auto_68457 ) ( ON-TABLE ?auto_68463 ) ( ON ?auto_68459 ?auto_68458 ) ( ON ?auto_68460 ?auto_68459 ) ( ON ?auto_68461 ?auto_68460 ) ( ON ?auto_68462 ?auto_68461 ) ( CLEAR ?auto_68462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_68463 ?auto_68457 ?auto_68458 ?auto_68459 ?auto_68460 ?auto_68461 )
      ( MAKE-6PILE ?auto_68457 ?auto_68458 ?auto_68459 ?auto_68460 ?auto_68461 ?auto_68462 ) )
  )

)

