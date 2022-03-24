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
      ?auto_871636 - BLOCK
    )
    :vars
    (
      ?auto_871637 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_871636 ?auto_871637 ) ( CLEAR ?auto_871636 ) ( HAND-EMPTY ) ( not ( = ?auto_871636 ?auto_871637 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_871636 ?auto_871637 )
      ( !PUTDOWN ?auto_871636 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_871643 - BLOCK
      ?auto_871644 - BLOCK
    )
    :vars
    (
      ?auto_871645 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_871643 ) ( ON ?auto_871644 ?auto_871645 ) ( CLEAR ?auto_871644 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_871643 ) ( not ( = ?auto_871643 ?auto_871644 ) ) ( not ( = ?auto_871643 ?auto_871645 ) ) ( not ( = ?auto_871644 ?auto_871645 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_871644 ?auto_871645 )
      ( !STACK ?auto_871644 ?auto_871643 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_871653 - BLOCK
      ?auto_871654 - BLOCK
    )
    :vars
    (
      ?auto_871655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_871654 ?auto_871655 ) ( not ( = ?auto_871653 ?auto_871654 ) ) ( not ( = ?auto_871653 ?auto_871655 ) ) ( not ( = ?auto_871654 ?auto_871655 ) ) ( ON ?auto_871653 ?auto_871654 ) ( CLEAR ?auto_871653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_871653 )
      ( MAKE-2PILE ?auto_871653 ?auto_871654 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_871664 - BLOCK
      ?auto_871665 - BLOCK
      ?auto_871666 - BLOCK
    )
    :vars
    (
      ?auto_871667 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_871665 ) ( ON ?auto_871666 ?auto_871667 ) ( CLEAR ?auto_871666 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_871664 ) ( ON ?auto_871665 ?auto_871664 ) ( not ( = ?auto_871664 ?auto_871665 ) ) ( not ( = ?auto_871664 ?auto_871666 ) ) ( not ( = ?auto_871664 ?auto_871667 ) ) ( not ( = ?auto_871665 ?auto_871666 ) ) ( not ( = ?auto_871665 ?auto_871667 ) ) ( not ( = ?auto_871666 ?auto_871667 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_871666 ?auto_871667 )
      ( !STACK ?auto_871666 ?auto_871665 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_871678 - BLOCK
      ?auto_871679 - BLOCK
      ?auto_871680 - BLOCK
    )
    :vars
    (
      ?auto_871681 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_871680 ?auto_871681 ) ( ON-TABLE ?auto_871678 ) ( not ( = ?auto_871678 ?auto_871679 ) ) ( not ( = ?auto_871678 ?auto_871680 ) ) ( not ( = ?auto_871678 ?auto_871681 ) ) ( not ( = ?auto_871679 ?auto_871680 ) ) ( not ( = ?auto_871679 ?auto_871681 ) ) ( not ( = ?auto_871680 ?auto_871681 ) ) ( CLEAR ?auto_871678 ) ( ON ?auto_871679 ?auto_871680 ) ( CLEAR ?auto_871679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_871678 ?auto_871679 )
      ( MAKE-3PILE ?auto_871678 ?auto_871679 ?auto_871680 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_871692 - BLOCK
      ?auto_871693 - BLOCK
      ?auto_871694 - BLOCK
    )
    :vars
    (
      ?auto_871695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_871694 ?auto_871695 ) ( not ( = ?auto_871692 ?auto_871693 ) ) ( not ( = ?auto_871692 ?auto_871694 ) ) ( not ( = ?auto_871692 ?auto_871695 ) ) ( not ( = ?auto_871693 ?auto_871694 ) ) ( not ( = ?auto_871693 ?auto_871695 ) ) ( not ( = ?auto_871694 ?auto_871695 ) ) ( ON ?auto_871693 ?auto_871694 ) ( ON ?auto_871692 ?auto_871693 ) ( CLEAR ?auto_871692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_871692 )
      ( MAKE-3PILE ?auto_871692 ?auto_871693 ?auto_871694 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_871707 - BLOCK
      ?auto_871708 - BLOCK
      ?auto_871709 - BLOCK
      ?auto_871710 - BLOCK
    )
    :vars
    (
      ?auto_871711 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_871709 ) ( ON ?auto_871710 ?auto_871711 ) ( CLEAR ?auto_871710 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_871707 ) ( ON ?auto_871708 ?auto_871707 ) ( ON ?auto_871709 ?auto_871708 ) ( not ( = ?auto_871707 ?auto_871708 ) ) ( not ( = ?auto_871707 ?auto_871709 ) ) ( not ( = ?auto_871707 ?auto_871710 ) ) ( not ( = ?auto_871707 ?auto_871711 ) ) ( not ( = ?auto_871708 ?auto_871709 ) ) ( not ( = ?auto_871708 ?auto_871710 ) ) ( not ( = ?auto_871708 ?auto_871711 ) ) ( not ( = ?auto_871709 ?auto_871710 ) ) ( not ( = ?auto_871709 ?auto_871711 ) ) ( not ( = ?auto_871710 ?auto_871711 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_871710 ?auto_871711 )
      ( !STACK ?auto_871710 ?auto_871709 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_871725 - BLOCK
      ?auto_871726 - BLOCK
      ?auto_871727 - BLOCK
      ?auto_871728 - BLOCK
    )
    :vars
    (
      ?auto_871729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_871728 ?auto_871729 ) ( ON-TABLE ?auto_871725 ) ( ON ?auto_871726 ?auto_871725 ) ( not ( = ?auto_871725 ?auto_871726 ) ) ( not ( = ?auto_871725 ?auto_871727 ) ) ( not ( = ?auto_871725 ?auto_871728 ) ) ( not ( = ?auto_871725 ?auto_871729 ) ) ( not ( = ?auto_871726 ?auto_871727 ) ) ( not ( = ?auto_871726 ?auto_871728 ) ) ( not ( = ?auto_871726 ?auto_871729 ) ) ( not ( = ?auto_871727 ?auto_871728 ) ) ( not ( = ?auto_871727 ?auto_871729 ) ) ( not ( = ?auto_871728 ?auto_871729 ) ) ( CLEAR ?auto_871726 ) ( ON ?auto_871727 ?auto_871728 ) ( CLEAR ?auto_871727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_871725 ?auto_871726 ?auto_871727 )
      ( MAKE-4PILE ?auto_871725 ?auto_871726 ?auto_871727 ?auto_871728 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_871743 - BLOCK
      ?auto_871744 - BLOCK
      ?auto_871745 - BLOCK
      ?auto_871746 - BLOCK
    )
    :vars
    (
      ?auto_871747 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_871746 ?auto_871747 ) ( ON-TABLE ?auto_871743 ) ( not ( = ?auto_871743 ?auto_871744 ) ) ( not ( = ?auto_871743 ?auto_871745 ) ) ( not ( = ?auto_871743 ?auto_871746 ) ) ( not ( = ?auto_871743 ?auto_871747 ) ) ( not ( = ?auto_871744 ?auto_871745 ) ) ( not ( = ?auto_871744 ?auto_871746 ) ) ( not ( = ?auto_871744 ?auto_871747 ) ) ( not ( = ?auto_871745 ?auto_871746 ) ) ( not ( = ?auto_871745 ?auto_871747 ) ) ( not ( = ?auto_871746 ?auto_871747 ) ) ( ON ?auto_871745 ?auto_871746 ) ( CLEAR ?auto_871743 ) ( ON ?auto_871744 ?auto_871745 ) ( CLEAR ?auto_871744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_871743 ?auto_871744 )
      ( MAKE-4PILE ?auto_871743 ?auto_871744 ?auto_871745 ?auto_871746 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_871761 - BLOCK
      ?auto_871762 - BLOCK
      ?auto_871763 - BLOCK
      ?auto_871764 - BLOCK
    )
    :vars
    (
      ?auto_871765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_871764 ?auto_871765 ) ( not ( = ?auto_871761 ?auto_871762 ) ) ( not ( = ?auto_871761 ?auto_871763 ) ) ( not ( = ?auto_871761 ?auto_871764 ) ) ( not ( = ?auto_871761 ?auto_871765 ) ) ( not ( = ?auto_871762 ?auto_871763 ) ) ( not ( = ?auto_871762 ?auto_871764 ) ) ( not ( = ?auto_871762 ?auto_871765 ) ) ( not ( = ?auto_871763 ?auto_871764 ) ) ( not ( = ?auto_871763 ?auto_871765 ) ) ( not ( = ?auto_871764 ?auto_871765 ) ) ( ON ?auto_871763 ?auto_871764 ) ( ON ?auto_871762 ?auto_871763 ) ( ON ?auto_871761 ?auto_871762 ) ( CLEAR ?auto_871761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_871761 )
      ( MAKE-4PILE ?auto_871761 ?auto_871762 ?auto_871763 ?auto_871764 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_871780 - BLOCK
      ?auto_871781 - BLOCK
      ?auto_871782 - BLOCK
      ?auto_871783 - BLOCK
      ?auto_871784 - BLOCK
    )
    :vars
    (
      ?auto_871785 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_871783 ) ( ON ?auto_871784 ?auto_871785 ) ( CLEAR ?auto_871784 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_871780 ) ( ON ?auto_871781 ?auto_871780 ) ( ON ?auto_871782 ?auto_871781 ) ( ON ?auto_871783 ?auto_871782 ) ( not ( = ?auto_871780 ?auto_871781 ) ) ( not ( = ?auto_871780 ?auto_871782 ) ) ( not ( = ?auto_871780 ?auto_871783 ) ) ( not ( = ?auto_871780 ?auto_871784 ) ) ( not ( = ?auto_871780 ?auto_871785 ) ) ( not ( = ?auto_871781 ?auto_871782 ) ) ( not ( = ?auto_871781 ?auto_871783 ) ) ( not ( = ?auto_871781 ?auto_871784 ) ) ( not ( = ?auto_871781 ?auto_871785 ) ) ( not ( = ?auto_871782 ?auto_871783 ) ) ( not ( = ?auto_871782 ?auto_871784 ) ) ( not ( = ?auto_871782 ?auto_871785 ) ) ( not ( = ?auto_871783 ?auto_871784 ) ) ( not ( = ?auto_871783 ?auto_871785 ) ) ( not ( = ?auto_871784 ?auto_871785 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_871784 ?auto_871785 )
      ( !STACK ?auto_871784 ?auto_871783 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_871802 - BLOCK
      ?auto_871803 - BLOCK
      ?auto_871804 - BLOCK
      ?auto_871805 - BLOCK
      ?auto_871806 - BLOCK
    )
    :vars
    (
      ?auto_871807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_871806 ?auto_871807 ) ( ON-TABLE ?auto_871802 ) ( ON ?auto_871803 ?auto_871802 ) ( ON ?auto_871804 ?auto_871803 ) ( not ( = ?auto_871802 ?auto_871803 ) ) ( not ( = ?auto_871802 ?auto_871804 ) ) ( not ( = ?auto_871802 ?auto_871805 ) ) ( not ( = ?auto_871802 ?auto_871806 ) ) ( not ( = ?auto_871802 ?auto_871807 ) ) ( not ( = ?auto_871803 ?auto_871804 ) ) ( not ( = ?auto_871803 ?auto_871805 ) ) ( not ( = ?auto_871803 ?auto_871806 ) ) ( not ( = ?auto_871803 ?auto_871807 ) ) ( not ( = ?auto_871804 ?auto_871805 ) ) ( not ( = ?auto_871804 ?auto_871806 ) ) ( not ( = ?auto_871804 ?auto_871807 ) ) ( not ( = ?auto_871805 ?auto_871806 ) ) ( not ( = ?auto_871805 ?auto_871807 ) ) ( not ( = ?auto_871806 ?auto_871807 ) ) ( CLEAR ?auto_871804 ) ( ON ?auto_871805 ?auto_871806 ) ( CLEAR ?auto_871805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_871802 ?auto_871803 ?auto_871804 ?auto_871805 )
      ( MAKE-5PILE ?auto_871802 ?auto_871803 ?auto_871804 ?auto_871805 ?auto_871806 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_871824 - BLOCK
      ?auto_871825 - BLOCK
      ?auto_871826 - BLOCK
      ?auto_871827 - BLOCK
      ?auto_871828 - BLOCK
    )
    :vars
    (
      ?auto_871829 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_871828 ?auto_871829 ) ( ON-TABLE ?auto_871824 ) ( ON ?auto_871825 ?auto_871824 ) ( not ( = ?auto_871824 ?auto_871825 ) ) ( not ( = ?auto_871824 ?auto_871826 ) ) ( not ( = ?auto_871824 ?auto_871827 ) ) ( not ( = ?auto_871824 ?auto_871828 ) ) ( not ( = ?auto_871824 ?auto_871829 ) ) ( not ( = ?auto_871825 ?auto_871826 ) ) ( not ( = ?auto_871825 ?auto_871827 ) ) ( not ( = ?auto_871825 ?auto_871828 ) ) ( not ( = ?auto_871825 ?auto_871829 ) ) ( not ( = ?auto_871826 ?auto_871827 ) ) ( not ( = ?auto_871826 ?auto_871828 ) ) ( not ( = ?auto_871826 ?auto_871829 ) ) ( not ( = ?auto_871827 ?auto_871828 ) ) ( not ( = ?auto_871827 ?auto_871829 ) ) ( not ( = ?auto_871828 ?auto_871829 ) ) ( ON ?auto_871827 ?auto_871828 ) ( CLEAR ?auto_871825 ) ( ON ?auto_871826 ?auto_871827 ) ( CLEAR ?auto_871826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_871824 ?auto_871825 ?auto_871826 )
      ( MAKE-5PILE ?auto_871824 ?auto_871825 ?auto_871826 ?auto_871827 ?auto_871828 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_871846 - BLOCK
      ?auto_871847 - BLOCK
      ?auto_871848 - BLOCK
      ?auto_871849 - BLOCK
      ?auto_871850 - BLOCK
    )
    :vars
    (
      ?auto_871851 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_871850 ?auto_871851 ) ( ON-TABLE ?auto_871846 ) ( not ( = ?auto_871846 ?auto_871847 ) ) ( not ( = ?auto_871846 ?auto_871848 ) ) ( not ( = ?auto_871846 ?auto_871849 ) ) ( not ( = ?auto_871846 ?auto_871850 ) ) ( not ( = ?auto_871846 ?auto_871851 ) ) ( not ( = ?auto_871847 ?auto_871848 ) ) ( not ( = ?auto_871847 ?auto_871849 ) ) ( not ( = ?auto_871847 ?auto_871850 ) ) ( not ( = ?auto_871847 ?auto_871851 ) ) ( not ( = ?auto_871848 ?auto_871849 ) ) ( not ( = ?auto_871848 ?auto_871850 ) ) ( not ( = ?auto_871848 ?auto_871851 ) ) ( not ( = ?auto_871849 ?auto_871850 ) ) ( not ( = ?auto_871849 ?auto_871851 ) ) ( not ( = ?auto_871850 ?auto_871851 ) ) ( ON ?auto_871849 ?auto_871850 ) ( ON ?auto_871848 ?auto_871849 ) ( CLEAR ?auto_871846 ) ( ON ?auto_871847 ?auto_871848 ) ( CLEAR ?auto_871847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_871846 ?auto_871847 )
      ( MAKE-5PILE ?auto_871846 ?auto_871847 ?auto_871848 ?auto_871849 ?auto_871850 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_871868 - BLOCK
      ?auto_871869 - BLOCK
      ?auto_871870 - BLOCK
      ?auto_871871 - BLOCK
      ?auto_871872 - BLOCK
    )
    :vars
    (
      ?auto_871873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_871872 ?auto_871873 ) ( not ( = ?auto_871868 ?auto_871869 ) ) ( not ( = ?auto_871868 ?auto_871870 ) ) ( not ( = ?auto_871868 ?auto_871871 ) ) ( not ( = ?auto_871868 ?auto_871872 ) ) ( not ( = ?auto_871868 ?auto_871873 ) ) ( not ( = ?auto_871869 ?auto_871870 ) ) ( not ( = ?auto_871869 ?auto_871871 ) ) ( not ( = ?auto_871869 ?auto_871872 ) ) ( not ( = ?auto_871869 ?auto_871873 ) ) ( not ( = ?auto_871870 ?auto_871871 ) ) ( not ( = ?auto_871870 ?auto_871872 ) ) ( not ( = ?auto_871870 ?auto_871873 ) ) ( not ( = ?auto_871871 ?auto_871872 ) ) ( not ( = ?auto_871871 ?auto_871873 ) ) ( not ( = ?auto_871872 ?auto_871873 ) ) ( ON ?auto_871871 ?auto_871872 ) ( ON ?auto_871870 ?auto_871871 ) ( ON ?auto_871869 ?auto_871870 ) ( ON ?auto_871868 ?auto_871869 ) ( CLEAR ?auto_871868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_871868 )
      ( MAKE-5PILE ?auto_871868 ?auto_871869 ?auto_871870 ?auto_871871 ?auto_871872 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_871891 - BLOCK
      ?auto_871892 - BLOCK
      ?auto_871893 - BLOCK
      ?auto_871894 - BLOCK
      ?auto_871895 - BLOCK
      ?auto_871896 - BLOCK
    )
    :vars
    (
      ?auto_871897 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_871895 ) ( ON ?auto_871896 ?auto_871897 ) ( CLEAR ?auto_871896 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_871891 ) ( ON ?auto_871892 ?auto_871891 ) ( ON ?auto_871893 ?auto_871892 ) ( ON ?auto_871894 ?auto_871893 ) ( ON ?auto_871895 ?auto_871894 ) ( not ( = ?auto_871891 ?auto_871892 ) ) ( not ( = ?auto_871891 ?auto_871893 ) ) ( not ( = ?auto_871891 ?auto_871894 ) ) ( not ( = ?auto_871891 ?auto_871895 ) ) ( not ( = ?auto_871891 ?auto_871896 ) ) ( not ( = ?auto_871891 ?auto_871897 ) ) ( not ( = ?auto_871892 ?auto_871893 ) ) ( not ( = ?auto_871892 ?auto_871894 ) ) ( not ( = ?auto_871892 ?auto_871895 ) ) ( not ( = ?auto_871892 ?auto_871896 ) ) ( not ( = ?auto_871892 ?auto_871897 ) ) ( not ( = ?auto_871893 ?auto_871894 ) ) ( not ( = ?auto_871893 ?auto_871895 ) ) ( not ( = ?auto_871893 ?auto_871896 ) ) ( not ( = ?auto_871893 ?auto_871897 ) ) ( not ( = ?auto_871894 ?auto_871895 ) ) ( not ( = ?auto_871894 ?auto_871896 ) ) ( not ( = ?auto_871894 ?auto_871897 ) ) ( not ( = ?auto_871895 ?auto_871896 ) ) ( not ( = ?auto_871895 ?auto_871897 ) ) ( not ( = ?auto_871896 ?auto_871897 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_871896 ?auto_871897 )
      ( !STACK ?auto_871896 ?auto_871895 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_871917 - BLOCK
      ?auto_871918 - BLOCK
      ?auto_871919 - BLOCK
      ?auto_871920 - BLOCK
      ?auto_871921 - BLOCK
      ?auto_871922 - BLOCK
    )
    :vars
    (
      ?auto_871923 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_871922 ?auto_871923 ) ( ON-TABLE ?auto_871917 ) ( ON ?auto_871918 ?auto_871917 ) ( ON ?auto_871919 ?auto_871918 ) ( ON ?auto_871920 ?auto_871919 ) ( not ( = ?auto_871917 ?auto_871918 ) ) ( not ( = ?auto_871917 ?auto_871919 ) ) ( not ( = ?auto_871917 ?auto_871920 ) ) ( not ( = ?auto_871917 ?auto_871921 ) ) ( not ( = ?auto_871917 ?auto_871922 ) ) ( not ( = ?auto_871917 ?auto_871923 ) ) ( not ( = ?auto_871918 ?auto_871919 ) ) ( not ( = ?auto_871918 ?auto_871920 ) ) ( not ( = ?auto_871918 ?auto_871921 ) ) ( not ( = ?auto_871918 ?auto_871922 ) ) ( not ( = ?auto_871918 ?auto_871923 ) ) ( not ( = ?auto_871919 ?auto_871920 ) ) ( not ( = ?auto_871919 ?auto_871921 ) ) ( not ( = ?auto_871919 ?auto_871922 ) ) ( not ( = ?auto_871919 ?auto_871923 ) ) ( not ( = ?auto_871920 ?auto_871921 ) ) ( not ( = ?auto_871920 ?auto_871922 ) ) ( not ( = ?auto_871920 ?auto_871923 ) ) ( not ( = ?auto_871921 ?auto_871922 ) ) ( not ( = ?auto_871921 ?auto_871923 ) ) ( not ( = ?auto_871922 ?auto_871923 ) ) ( CLEAR ?auto_871920 ) ( ON ?auto_871921 ?auto_871922 ) ( CLEAR ?auto_871921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_871917 ?auto_871918 ?auto_871919 ?auto_871920 ?auto_871921 )
      ( MAKE-6PILE ?auto_871917 ?auto_871918 ?auto_871919 ?auto_871920 ?auto_871921 ?auto_871922 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_871943 - BLOCK
      ?auto_871944 - BLOCK
      ?auto_871945 - BLOCK
      ?auto_871946 - BLOCK
      ?auto_871947 - BLOCK
      ?auto_871948 - BLOCK
    )
    :vars
    (
      ?auto_871949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_871948 ?auto_871949 ) ( ON-TABLE ?auto_871943 ) ( ON ?auto_871944 ?auto_871943 ) ( ON ?auto_871945 ?auto_871944 ) ( not ( = ?auto_871943 ?auto_871944 ) ) ( not ( = ?auto_871943 ?auto_871945 ) ) ( not ( = ?auto_871943 ?auto_871946 ) ) ( not ( = ?auto_871943 ?auto_871947 ) ) ( not ( = ?auto_871943 ?auto_871948 ) ) ( not ( = ?auto_871943 ?auto_871949 ) ) ( not ( = ?auto_871944 ?auto_871945 ) ) ( not ( = ?auto_871944 ?auto_871946 ) ) ( not ( = ?auto_871944 ?auto_871947 ) ) ( not ( = ?auto_871944 ?auto_871948 ) ) ( not ( = ?auto_871944 ?auto_871949 ) ) ( not ( = ?auto_871945 ?auto_871946 ) ) ( not ( = ?auto_871945 ?auto_871947 ) ) ( not ( = ?auto_871945 ?auto_871948 ) ) ( not ( = ?auto_871945 ?auto_871949 ) ) ( not ( = ?auto_871946 ?auto_871947 ) ) ( not ( = ?auto_871946 ?auto_871948 ) ) ( not ( = ?auto_871946 ?auto_871949 ) ) ( not ( = ?auto_871947 ?auto_871948 ) ) ( not ( = ?auto_871947 ?auto_871949 ) ) ( not ( = ?auto_871948 ?auto_871949 ) ) ( ON ?auto_871947 ?auto_871948 ) ( CLEAR ?auto_871945 ) ( ON ?auto_871946 ?auto_871947 ) ( CLEAR ?auto_871946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_871943 ?auto_871944 ?auto_871945 ?auto_871946 )
      ( MAKE-6PILE ?auto_871943 ?auto_871944 ?auto_871945 ?auto_871946 ?auto_871947 ?auto_871948 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_871969 - BLOCK
      ?auto_871970 - BLOCK
      ?auto_871971 - BLOCK
      ?auto_871972 - BLOCK
      ?auto_871973 - BLOCK
      ?auto_871974 - BLOCK
    )
    :vars
    (
      ?auto_871975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_871974 ?auto_871975 ) ( ON-TABLE ?auto_871969 ) ( ON ?auto_871970 ?auto_871969 ) ( not ( = ?auto_871969 ?auto_871970 ) ) ( not ( = ?auto_871969 ?auto_871971 ) ) ( not ( = ?auto_871969 ?auto_871972 ) ) ( not ( = ?auto_871969 ?auto_871973 ) ) ( not ( = ?auto_871969 ?auto_871974 ) ) ( not ( = ?auto_871969 ?auto_871975 ) ) ( not ( = ?auto_871970 ?auto_871971 ) ) ( not ( = ?auto_871970 ?auto_871972 ) ) ( not ( = ?auto_871970 ?auto_871973 ) ) ( not ( = ?auto_871970 ?auto_871974 ) ) ( not ( = ?auto_871970 ?auto_871975 ) ) ( not ( = ?auto_871971 ?auto_871972 ) ) ( not ( = ?auto_871971 ?auto_871973 ) ) ( not ( = ?auto_871971 ?auto_871974 ) ) ( not ( = ?auto_871971 ?auto_871975 ) ) ( not ( = ?auto_871972 ?auto_871973 ) ) ( not ( = ?auto_871972 ?auto_871974 ) ) ( not ( = ?auto_871972 ?auto_871975 ) ) ( not ( = ?auto_871973 ?auto_871974 ) ) ( not ( = ?auto_871973 ?auto_871975 ) ) ( not ( = ?auto_871974 ?auto_871975 ) ) ( ON ?auto_871973 ?auto_871974 ) ( ON ?auto_871972 ?auto_871973 ) ( CLEAR ?auto_871970 ) ( ON ?auto_871971 ?auto_871972 ) ( CLEAR ?auto_871971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_871969 ?auto_871970 ?auto_871971 )
      ( MAKE-6PILE ?auto_871969 ?auto_871970 ?auto_871971 ?auto_871972 ?auto_871973 ?auto_871974 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_871995 - BLOCK
      ?auto_871996 - BLOCK
      ?auto_871997 - BLOCK
      ?auto_871998 - BLOCK
      ?auto_871999 - BLOCK
      ?auto_872000 - BLOCK
    )
    :vars
    (
      ?auto_872001 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_872000 ?auto_872001 ) ( ON-TABLE ?auto_871995 ) ( not ( = ?auto_871995 ?auto_871996 ) ) ( not ( = ?auto_871995 ?auto_871997 ) ) ( not ( = ?auto_871995 ?auto_871998 ) ) ( not ( = ?auto_871995 ?auto_871999 ) ) ( not ( = ?auto_871995 ?auto_872000 ) ) ( not ( = ?auto_871995 ?auto_872001 ) ) ( not ( = ?auto_871996 ?auto_871997 ) ) ( not ( = ?auto_871996 ?auto_871998 ) ) ( not ( = ?auto_871996 ?auto_871999 ) ) ( not ( = ?auto_871996 ?auto_872000 ) ) ( not ( = ?auto_871996 ?auto_872001 ) ) ( not ( = ?auto_871997 ?auto_871998 ) ) ( not ( = ?auto_871997 ?auto_871999 ) ) ( not ( = ?auto_871997 ?auto_872000 ) ) ( not ( = ?auto_871997 ?auto_872001 ) ) ( not ( = ?auto_871998 ?auto_871999 ) ) ( not ( = ?auto_871998 ?auto_872000 ) ) ( not ( = ?auto_871998 ?auto_872001 ) ) ( not ( = ?auto_871999 ?auto_872000 ) ) ( not ( = ?auto_871999 ?auto_872001 ) ) ( not ( = ?auto_872000 ?auto_872001 ) ) ( ON ?auto_871999 ?auto_872000 ) ( ON ?auto_871998 ?auto_871999 ) ( ON ?auto_871997 ?auto_871998 ) ( CLEAR ?auto_871995 ) ( ON ?auto_871996 ?auto_871997 ) ( CLEAR ?auto_871996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_871995 ?auto_871996 )
      ( MAKE-6PILE ?auto_871995 ?auto_871996 ?auto_871997 ?auto_871998 ?auto_871999 ?auto_872000 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_872021 - BLOCK
      ?auto_872022 - BLOCK
      ?auto_872023 - BLOCK
      ?auto_872024 - BLOCK
      ?auto_872025 - BLOCK
      ?auto_872026 - BLOCK
    )
    :vars
    (
      ?auto_872027 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_872026 ?auto_872027 ) ( not ( = ?auto_872021 ?auto_872022 ) ) ( not ( = ?auto_872021 ?auto_872023 ) ) ( not ( = ?auto_872021 ?auto_872024 ) ) ( not ( = ?auto_872021 ?auto_872025 ) ) ( not ( = ?auto_872021 ?auto_872026 ) ) ( not ( = ?auto_872021 ?auto_872027 ) ) ( not ( = ?auto_872022 ?auto_872023 ) ) ( not ( = ?auto_872022 ?auto_872024 ) ) ( not ( = ?auto_872022 ?auto_872025 ) ) ( not ( = ?auto_872022 ?auto_872026 ) ) ( not ( = ?auto_872022 ?auto_872027 ) ) ( not ( = ?auto_872023 ?auto_872024 ) ) ( not ( = ?auto_872023 ?auto_872025 ) ) ( not ( = ?auto_872023 ?auto_872026 ) ) ( not ( = ?auto_872023 ?auto_872027 ) ) ( not ( = ?auto_872024 ?auto_872025 ) ) ( not ( = ?auto_872024 ?auto_872026 ) ) ( not ( = ?auto_872024 ?auto_872027 ) ) ( not ( = ?auto_872025 ?auto_872026 ) ) ( not ( = ?auto_872025 ?auto_872027 ) ) ( not ( = ?auto_872026 ?auto_872027 ) ) ( ON ?auto_872025 ?auto_872026 ) ( ON ?auto_872024 ?auto_872025 ) ( ON ?auto_872023 ?auto_872024 ) ( ON ?auto_872022 ?auto_872023 ) ( ON ?auto_872021 ?auto_872022 ) ( CLEAR ?auto_872021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_872021 )
      ( MAKE-6PILE ?auto_872021 ?auto_872022 ?auto_872023 ?auto_872024 ?auto_872025 ?auto_872026 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_872048 - BLOCK
      ?auto_872049 - BLOCK
      ?auto_872050 - BLOCK
      ?auto_872051 - BLOCK
      ?auto_872052 - BLOCK
      ?auto_872053 - BLOCK
      ?auto_872054 - BLOCK
    )
    :vars
    (
      ?auto_872055 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_872053 ) ( ON ?auto_872054 ?auto_872055 ) ( CLEAR ?auto_872054 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_872048 ) ( ON ?auto_872049 ?auto_872048 ) ( ON ?auto_872050 ?auto_872049 ) ( ON ?auto_872051 ?auto_872050 ) ( ON ?auto_872052 ?auto_872051 ) ( ON ?auto_872053 ?auto_872052 ) ( not ( = ?auto_872048 ?auto_872049 ) ) ( not ( = ?auto_872048 ?auto_872050 ) ) ( not ( = ?auto_872048 ?auto_872051 ) ) ( not ( = ?auto_872048 ?auto_872052 ) ) ( not ( = ?auto_872048 ?auto_872053 ) ) ( not ( = ?auto_872048 ?auto_872054 ) ) ( not ( = ?auto_872048 ?auto_872055 ) ) ( not ( = ?auto_872049 ?auto_872050 ) ) ( not ( = ?auto_872049 ?auto_872051 ) ) ( not ( = ?auto_872049 ?auto_872052 ) ) ( not ( = ?auto_872049 ?auto_872053 ) ) ( not ( = ?auto_872049 ?auto_872054 ) ) ( not ( = ?auto_872049 ?auto_872055 ) ) ( not ( = ?auto_872050 ?auto_872051 ) ) ( not ( = ?auto_872050 ?auto_872052 ) ) ( not ( = ?auto_872050 ?auto_872053 ) ) ( not ( = ?auto_872050 ?auto_872054 ) ) ( not ( = ?auto_872050 ?auto_872055 ) ) ( not ( = ?auto_872051 ?auto_872052 ) ) ( not ( = ?auto_872051 ?auto_872053 ) ) ( not ( = ?auto_872051 ?auto_872054 ) ) ( not ( = ?auto_872051 ?auto_872055 ) ) ( not ( = ?auto_872052 ?auto_872053 ) ) ( not ( = ?auto_872052 ?auto_872054 ) ) ( not ( = ?auto_872052 ?auto_872055 ) ) ( not ( = ?auto_872053 ?auto_872054 ) ) ( not ( = ?auto_872053 ?auto_872055 ) ) ( not ( = ?auto_872054 ?auto_872055 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_872054 ?auto_872055 )
      ( !STACK ?auto_872054 ?auto_872053 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_872078 - BLOCK
      ?auto_872079 - BLOCK
      ?auto_872080 - BLOCK
      ?auto_872081 - BLOCK
      ?auto_872082 - BLOCK
      ?auto_872083 - BLOCK
      ?auto_872084 - BLOCK
    )
    :vars
    (
      ?auto_872085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_872084 ?auto_872085 ) ( ON-TABLE ?auto_872078 ) ( ON ?auto_872079 ?auto_872078 ) ( ON ?auto_872080 ?auto_872079 ) ( ON ?auto_872081 ?auto_872080 ) ( ON ?auto_872082 ?auto_872081 ) ( not ( = ?auto_872078 ?auto_872079 ) ) ( not ( = ?auto_872078 ?auto_872080 ) ) ( not ( = ?auto_872078 ?auto_872081 ) ) ( not ( = ?auto_872078 ?auto_872082 ) ) ( not ( = ?auto_872078 ?auto_872083 ) ) ( not ( = ?auto_872078 ?auto_872084 ) ) ( not ( = ?auto_872078 ?auto_872085 ) ) ( not ( = ?auto_872079 ?auto_872080 ) ) ( not ( = ?auto_872079 ?auto_872081 ) ) ( not ( = ?auto_872079 ?auto_872082 ) ) ( not ( = ?auto_872079 ?auto_872083 ) ) ( not ( = ?auto_872079 ?auto_872084 ) ) ( not ( = ?auto_872079 ?auto_872085 ) ) ( not ( = ?auto_872080 ?auto_872081 ) ) ( not ( = ?auto_872080 ?auto_872082 ) ) ( not ( = ?auto_872080 ?auto_872083 ) ) ( not ( = ?auto_872080 ?auto_872084 ) ) ( not ( = ?auto_872080 ?auto_872085 ) ) ( not ( = ?auto_872081 ?auto_872082 ) ) ( not ( = ?auto_872081 ?auto_872083 ) ) ( not ( = ?auto_872081 ?auto_872084 ) ) ( not ( = ?auto_872081 ?auto_872085 ) ) ( not ( = ?auto_872082 ?auto_872083 ) ) ( not ( = ?auto_872082 ?auto_872084 ) ) ( not ( = ?auto_872082 ?auto_872085 ) ) ( not ( = ?auto_872083 ?auto_872084 ) ) ( not ( = ?auto_872083 ?auto_872085 ) ) ( not ( = ?auto_872084 ?auto_872085 ) ) ( CLEAR ?auto_872082 ) ( ON ?auto_872083 ?auto_872084 ) ( CLEAR ?auto_872083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_872078 ?auto_872079 ?auto_872080 ?auto_872081 ?auto_872082 ?auto_872083 )
      ( MAKE-7PILE ?auto_872078 ?auto_872079 ?auto_872080 ?auto_872081 ?auto_872082 ?auto_872083 ?auto_872084 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_872108 - BLOCK
      ?auto_872109 - BLOCK
      ?auto_872110 - BLOCK
      ?auto_872111 - BLOCK
      ?auto_872112 - BLOCK
      ?auto_872113 - BLOCK
      ?auto_872114 - BLOCK
    )
    :vars
    (
      ?auto_872115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_872114 ?auto_872115 ) ( ON-TABLE ?auto_872108 ) ( ON ?auto_872109 ?auto_872108 ) ( ON ?auto_872110 ?auto_872109 ) ( ON ?auto_872111 ?auto_872110 ) ( not ( = ?auto_872108 ?auto_872109 ) ) ( not ( = ?auto_872108 ?auto_872110 ) ) ( not ( = ?auto_872108 ?auto_872111 ) ) ( not ( = ?auto_872108 ?auto_872112 ) ) ( not ( = ?auto_872108 ?auto_872113 ) ) ( not ( = ?auto_872108 ?auto_872114 ) ) ( not ( = ?auto_872108 ?auto_872115 ) ) ( not ( = ?auto_872109 ?auto_872110 ) ) ( not ( = ?auto_872109 ?auto_872111 ) ) ( not ( = ?auto_872109 ?auto_872112 ) ) ( not ( = ?auto_872109 ?auto_872113 ) ) ( not ( = ?auto_872109 ?auto_872114 ) ) ( not ( = ?auto_872109 ?auto_872115 ) ) ( not ( = ?auto_872110 ?auto_872111 ) ) ( not ( = ?auto_872110 ?auto_872112 ) ) ( not ( = ?auto_872110 ?auto_872113 ) ) ( not ( = ?auto_872110 ?auto_872114 ) ) ( not ( = ?auto_872110 ?auto_872115 ) ) ( not ( = ?auto_872111 ?auto_872112 ) ) ( not ( = ?auto_872111 ?auto_872113 ) ) ( not ( = ?auto_872111 ?auto_872114 ) ) ( not ( = ?auto_872111 ?auto_872115 ) ) ( not ( = ?auto_872112 ?auto_872113 ) ) ( not ( = ?auto_872112 ?auto_872114 ) ) ( not ( = ?auto_872112 ?auto_872115 ) ) ( not ( = ?auto_872113 ?auto_872114 ) ) ( not ( = ?auto_872113 ?auto_872115 ) ) ( not ( = ?auto_872114 ?auto_872115 ) ) ( ON ?auto_872113 ?auto_872114 ) ( CLEAR ?auto_872111 ) ( ON ?auto_872112 ?auto_872113 ) ( CLEAR ?auto_872112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_872108 ?auto_872109 ?auto_872110 ?auto_872111 ?auto_872112 )
      ( MAKE-7PILE ?auto_872108 ?auto_872109 ?auto_872110 ?auto_872111 ?auto_872112 ?auto_872113 ?auto_872114 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_872138 - BLOCK
      ?auto_872139 - BLOCK
      ?auto_872140 - BLOCK
      ?auto_872141 - BLOCK
      ?auto_872142 - BLOCK
      ?auto_872143 - BLOCK
      ?auto_872144 - BLOCK
    )
    :vars
    (
      ?auto_872145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_872144 ?auto_872145 ) ( ON-TABLE ?auto_872138 ) ( ON ?auto_872139 ?auto_872138 ) ( ON ?auto_872140 ?auto_872139 ) ( not ( = ?auto_872138 ?auto_872139 ) ) ( not ( = ?auto_872138 ?auto_872140 ) ) ( not ( = ?auto_872138 ?auto_872141 ) ) ( not ( = ?auto_872138 ?auto_872142 ) ) ( not ( = ?auto_872138 ?auto_872143 ) ) ( not ( = ?auto_872138 ?auto_872144 ) ) ( not ( = ?auto_872138 ?auto_872145 ) ) ( not ( = ?auto_872139 ?auto_872140 ) ) ( not ( = ?auto_872139 ?auto_872141 ) ) ( not ( = ?auto_872139 ?auto_872142 ) ) ( not ( = ?auto_872139 ?auto_872143 ) ) ( not ( = ?auto_872139 ?auto_872144 ) ) ( not ( = ?auto_872139 ?auto_872145 ) ) ( not ( = ?auto_872140 ?auto_872141 ) ) ( not ( = ?auto_872140 ?auto_872142 ) ) ( not ( = ?auto_872140 ?auto_872143 ) ) ( not ( = ?auto_872140 ?auto_872144 ) ) ( not ( = ?auto_872140 ?auto_872145 ) ) ( not ( = ?auto_872141 ?auto_872142 ) ) ( not ( = ?auto_872141 ?auto_872143 ) ) ( not ( = ?auto_872141 ?auto_872144 ) ) ( not ( = ?auto_872141 ?auto_872145 ) ) ( not ( = ?auto_872142 ?auto_872143 ) ) ( not ( = ?auto_872142 ?auto_872144 ) ) ( not ( = ?auto_872142 ?auto_872145 ) ) ( not ( = ?auto_872143 ?auto_872144 ) ) ( not ( = ?auto_872143 ?auto_872145 ) ) ( not ( = ?auto_872144 ?auto_872145 ) ) ( ON ?auto_872143 ?auto_872144 ) ( ON ?auto_872142 ?auto_872143 ) ( CLEAR ?auto_872140 ) ( ON ?auto_872141 ?auto_872142 ) ( CLEAR ?auto_872141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_872138 ?auto_872139 ?auto_872140 ?auto_872141 )
      ( MAKE-7PILE ?auto_872138 ?auto_872139 ?auto_872140 ?auto_872141 ?auto_872142 ?auto_872143 ?auto_872144 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_872168 - BLOCK
      ?auto_872169 - BLOCK
      ?auto_872170 - BLOCK
      ?auto_872171 - BLOCK
      ?auto_872172 - BLOCK
      ?auto_872173 - BLOCK
      ?auto_872174 - BLOCK
    )
    :vars
    (
      ?auto_872175 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_872174 ?auto_872175 ) ( ON-TABLE ?auto_872168 ) ( ON ?auto_872169 ?auto_872168 ) ( not ( = ?auto_872168 ?auto_872169 ) ) ( not ( = ?auto_872168 ?auto_872170 ) ) ( not ( = ?auto_872168 ?auto_872171 ) ) ( not ( = ?auto_872168 ?auto_872172 ) ) ( not ( = ?auto_872168 ?auto_872173 ) ) ( not ( = ?auto_872168 ?auto_872174 ) ) ( not ( = ?auto_872168 ?auto_872175 ) ) ( not ( = ?auto_872169 ?auto_872170 ) ) ( not ( = ?auto_872169 ?auto_872171 ) ) ( not ( = ?auto_872169 ?auto_872172 ) ) ( not ( = ?auto_872169 ?auto_872173 ) ) ( not ( = ?auto_872169 ?auto_872174 ) ) ( not ( = ?auto_872169 ?auto_872175 ) ) ( not ( = ?auto_872170 ?auto_872171 ) ) ( not ( = ?auto_872170 ?auto_872172 ) ) ( not ( = ?auto_872170 ?auto_872173 ) ) ( not ( = ?auto_872170 ?auto_872174 ) ) ( not ( = ?auto_872170 ?auto_872175 ) ) ( not ( = ?auto_872171 ?auto_872172 ) ) ( not ( = ?auto_872171 ?auto_872173 ) ) ( not ( = ?auto_872171 ?auto_872174 ) ) ( not ( = ?auto_872171 ?auto_872175 ) ) ( not ( = ?auto_872172 ?auto_872173 ) ) ( not ( = ?auto_872172 ?auto_872174 ) ) ( not ( = ?auto_872172 ?auto_872175 ) ) ( not ( = ?auto_872173 ?auto_872174 ) ) ( not ( = ?auto_872173 ?auto_872175 ) ) ( not ( = ?auto_872174 ?auto_872175 ) ) ( ON ?auto_872173 ?auto_872174 ) ( ON ?auto_872172 ?auto_872173 ) ( ON ?auto_872171 ?auto_872172 ) ( CLEAR ?auto_872169 ) ( ON ?auto_872170 ?auto_872171 ) ( CLEAR ?auto_872170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_872168 ?auto_872169 ?auto_872170 )
      ( MAKE-7PILE ?auto_872168 ?auto_872169 ?auto_872170 ?auto_872171 ?auto_872172 ?auto_872173 ?auto_872174 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_872198 - BLOCK
      ?auto_872199 - BLOCK
      ?auto_872200 - BLOCK
      ?auto_872201 - BLOCK
      ?auto_872202 - BLOCK
      ?auto_872203 - BLOCK
      ?auto_872204 - BLOCK
    )
    :vars
    (
      ?auto_872205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_872204 ?auto_872205 ) ( ON-TABLE ?auto_872198 ) ( not ( = ?auto_872198 ?auto_872199 ) ) ( not ( = ?auto_872198 ?auto_872200 ) ) ( not ( = ?auto_872198 ?auto_872201 ) ) ( not ( = ?auto_872198 ?auto_872202 ) ) ( not ( = ?auto_872198 ?auto_872203 ) ) ( not ( = ?auto_872198 ?auto_872204 ) ) ( not ( = ?auto_872198 ?auto_872205 ) ) ( not ( = ?auto_872199 ?auto_872200 ) ) ( not ( = ?auto_872199 ?auto_872201 ) ) ( not ( = ?auto_872199 ?auto_872202 ) ) ( not ( = ?auto_872199 ?auto_872203 ) ) ( not ( = ?auto_872199 ?auto_872204 ) ) ( not ( = ?auto_872199 ?auto_872205 ) ) ( not ( = ?auto_872200 ?auto_872201 ) ) ( not ( = ?auto_872200 ?auto_872202 ) ) ( not ( = ?auto_872200 ?auto_872203 ) ) ( not ( = ?auto_872200 ?auto_872204 ) ) ( not ( = ?auto_872200 ?auto_872205 ) ) ( not ( = ?auto_872201 ?auto_872202 ) ) ( not ( = ?auto_872201 ?auto_872203 ) ) ( not ( = ?auto_872201 ?auto_872204 ) ) ( not ( = ?auto_872201 ?auto_872205 ) ) ( not ( = ?auto_872202 ?auto_872203 ) ) ( not ( = ?auto_872202 ?auto_872204 ) ) ( not ( = ?auto_872202 ?auto_872205 ) ) ( not ( = ?auto_872203 ?auto_872204 ) ) ( not ( = ?auto_872203 ?auto_872205 ) ) ( not ( = ?auto_872204 ?auto_872205 ) ) ( ON ?auto_872203 ?auto_872204 ) ( ON ?auto_872202 ?auto_872203 ) ( ON ?auto_872201 ?auto_872202 ) ( ON ?auto_872200 ?auto_872201 ) ( CLEAR ?auto_872198 ) ( ON ?auto_872199 ?auto_872200 ) ( CLEAR ?auto_872199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_872198 ?auto_872199 )
      ( MAKE-7PILE ?auto_872198 ?auto_872199 ?auto_872200 ?auto_872201 ?auto_872202 ?auto_872203 ?auto_872204 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_872228 - BLOCK
      ?auto_872229 - BLOCK
      ?auto_872230 - BLOCK
      ?auto_872231 - BLOCK
      ?auto_872232 - BLOCK
      ?auto_872233 - BLOCK
      ?auto_872234 - BLOCK
    )
    :vars
    (
      ?auto_872235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_872234 ?auto_872235 ) ( not ( = ?auto_872228 ?auto_872229 ) ) ( not ( = ?auto_872228 ?auto_872230 ) ) ( not ( = ?auto_872228 ?auto_872231 ) ) ( not ( = ?auto_872228 ?auto_872232 ) ) ( not ( = ?auto_872228 ?auto_872233 ) ) ( not ( = ?auto_872228 ?auto_872234 ) ) ( not ( = ?auto_872228 ?auto_872235 ) ) ( not ( = ?auto_872229 ?auto_872230 ) ) ( not ( = ?auto_872229 ?auto_872231 ) ) ( not ( = ?auto_872229 ?auto_872232 ) ) ( not ( = ?auto_872229 ?auto_872233 ) ) ( not ( = ?auto_872229 ?auto_872234 ) ) ( not ( = ?auto_872229 ?auto_872235 ) ) ( not ( = ?auto_872230 ?auto_872231 ) ) ( not ( = ?auto_872230 ?auto_872232 ) ) ( not ( = ?auto_872230 ?auto_872233 ) ) ( not ( = ?auto_872230 ?auto_872234 ) ) ( not ( = ?auto_872230 ?auto_872235 ) ) ( not ( = ?auto_872231 ?auto_872232 ) ) ( not ( = ?auto_872231 ?auto_872233 ) ) ( not ( = ?auto_872231 ?auto_872234 ) ) ( not ( = ?auto_872231 ?auto_872235 ) ) ( not ( = ?auto_872232 ?auto_872233 ) ) ( not ( = ?auto_872232 ?auto_872234 ) ) ( not ( = ?auto_872232 ?auto_872235 ) ) ( not ( = ?auto_872233 ?auto_872234 ) ) ( not ( = ?auto_872233 ?auto_872235 ) ) ( not ( = ?auto_872234 ?auto_872235 ) ) ( ON ?auto_872233 ?auto_872234 ) ( ON ?auto_872232 ?auto_872233 ) ( ON ?auto_872231 ?auto_872232 ) ( ON ?auto_872230 ?auto_872231 ) ( ON ?auto_872229 ?auto_872230 ) ( ON ?auto_872228 ?auto_872229 ) ( CLEAR ?auto_872228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_872228 )
      ( MAKE-7PILE ?auto_872228 ?auto_872229 ?auto_872230 ?auto_872231 ?auto_872232 ?auto_872233 ?auto_872234 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_872259 - BLOCK
      ?auto_872260 - BLOCK
      ?auto_872261 - BLOCK
      ?auto_872262 - BLOCK
      ?auto_872263 - BLOCK
      ?auto_872264 - BLOCK
      ?auto_872265 - BLOCK
      ?auto_872266 - BLOCK
    )
    :vars
    (
      ?auto_872267 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_872265 ) ( ON ?auto_872266 ?auto_872267 ) ( CLEAR ?auto_872266 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_872259 ) ( ON ?auto_872260 ?auto_872259 ) ( ON ?auto_872261 ?auto_872260 ) ( ON ?auto_872262 ?auto_872261 ) ( ON ?auto_872263 ?auto_872262 ) ( ON ?auto_872264 ?auto_872263 ) ( ON ?auto_872265 ?auto_872264 ) ( not ( = ?auto_872259 ?auto_872260 ) ) ( not ( = ?auto_872259 ?auto_872261 ) ) ( not ( = ?auto_872259 ?auto_872262 ) ) ( not ( = ?auto_872259 ?auto_872263 ) ) ( not ( = ?auto_872259 ?auto_872264 ) ) ( not ( = ?auto_872259 ?auto_872265 ) ) ( not ( = ?auto_872259 ?auto_872266 ) ) ( not ( = ?auto_872259 ?auto_872267 ) ) ( not ( = ?auto_872260 ?auto_872261 ) ) ( not ( = ?auto_872260 ?auto_872262 ) ) ( not ( = ?auto_872260 ?auto_872263 ) ) ( not ( = ?auto_872260 ?auto_872264 ) ) ( not ( = ?auto_872260 ?auto_872265 ) ) ( not ( = ?auto_872260 ?auto_872266 ) ) ( not ( = ?auto_872260 ?auto_872267 ) ) ( not ( = ?auto_872261 ?auto_872262 ) ) ( not ( = ?auto_872261 ?auto_872263 ) ) ( not ( = ?auto_872261 ?auto_872264 ) ) ( not ( = ?auto_872261 ?auto_872265 ) ) ( not ( = ?auto_872261 ?auto_872266 ) ) ( not ( = ?auto_872261 ?auto_872267 ) ) ( not ( = ?auto_872262 ?auto_872263 ) ) ( not ( = ?auto_872262 ?auto_872264 ) ) ( not ( = ?auto_872262 ?auto_872265 ) ) ( not ( = ?auto_872262 ?auto_872266 ) ) ( not ( = ?auto_872262 ?auto_872267 ) ) ( not ( = ?auto_872263 ?auto_872264 ) ) ( not ( = ?auto_872263 ?auto_872265 ) ) ( not ( = ?auto_872263 ?auto_872266 ) ) ( not ( = ?auto_872263 ?auto_872267 ) ) ( not ( = ?auto_872264 ?auto_872265 ) ) ( not ( = ?auto_872264 ?auto_872266 ) ) ( not ( = ?auto_872264 ?auto_872267 ) ) ( not ( = ?auto_872265 ?auto_872266 ) ) ( not ( = ?auto_872265 ?auto_872267 ) ) ( not ( = ?auto_872266 ?auto_872267 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_872266 ?auto_872267 )
      ( !STACK ?auto_872266 ?auto_872265 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_872293 - BLOCK
      ?auto_872294 - BLOCK
      ?auto_872295 - BLOCK
      ?auto_872296 - BLOCK
      ?auto_872297 - BLOCK
      ?auto_872298 - BLOCK
      ?auto_872299 - BLOCK
      ?auto_872300 - BLOCK
    )
    :vars
    (
      ?auto_872301 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_872300 ?auto_872301 ) ( ON-TABLE ?auto_872293 ) ( ON ?auto_872294 ?auto_872293 ) ( ON ?auto_872295 ?auto_872294 ) ( ON ?auto_872296 ?auto_872295 ) ( ON ?auto_872297 ?auto_872296 ) ( ON ?auto_872298 ?auto_872297 ) ( not ( = ?auto_872293 ?auto_872294 ) ) ( not ( = ?auto_872293 ?auto_872295 ) ) ( not ( = ?auto_872293 ?auto_872296 ) ) ( not ( = ?auto_872293 ?auto_872297 ) ) ( not ( = ?auto_872293 ?auto_872298 ) ) ( not ( = ?auto_872293 ?auto_872299 ) ) ( not ( = ?auto_872293 ?auto_872300 ) ) ( not ( = ?auto_872293 ?auto_872301 ) ) ( not ( = ?auto_872294 ?auto_872295 ) ) ( not ( = ?auto_872294 ?auto_872296 ) ) ( not ( = ?auto_872294 ?auto_872297 ) ) ( not ( = ?auto_872294 ?auto_872298 ) ) ( not ( = ?auto_872294 ?auto_872299 ) ) ( not ( = ?auto_872294 ?auto_872300 ) ) ( not ( = ?auto_872294 ?auto_872301 ) ) ( not ( = ?auto_872295 ?auto_872296 ) ) ( not ( = ?auto_872295 ?auto_872297 ) ) ( not ( = ?auto_872295 ?auto_872298 ) ) ( not ( = ?auto_872295 ?auto_872299 ) ) ( not ( = ?auto_872295 ?auto_872300 ) ) ( not ( = ?auto_872295 ?auto_872301 ) ) ( not ( = ?auto_872296 ?auto_872297 ) ) ( not ( = ?auto_872296 ?auto_872298 ) ) ( not ( = ?auto_872296 ?auto_872299 ) ) ( not ( = ?auto_872296 ?auto_872300 ) ) ( not ( = ?auto_872296 ?auto_872301 ) ) ( not ( = ?auto_872297 ?auto_872298 ) ) ( not ( = ?auto_872297 ?auto_872299 ) ) ( not ( = ?auto_872297 ?auto_872300 ) ) ( not ( = ?auto_872297 ?auto_872301 ) ) ( not ( = ?auto_872298 ?auto_872299 ) ) ( not ( = ?auto_872298 ?auto_872300 ) ) ( not ( = ?auto_872298 ?auto_872301 ) ) ( not ( = ?auto_872299 ?auto_872300 ) ) ( not ( = ?auto_872299 ?auto_872301 ) ) ( not ( = ?auto_872300 ?auto_872301 ) ) ( CLEAR ?auto_872298 ) ( ON ?auto_872299 ?auto_872300 ) ( CLEAR ?auto_872299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_872293 ?auto_872294 ?auto_872295 ?auto_872296 ?auto_872297 ?auto_872298 ?auto_872299 )
      ( MAKE-8PILE ?auto_872293 ?auto_872294 ?auto_872295 ?auto_872296 ?auto_872297 ?auto_872298 ?auto_872299 ?auto_872300 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_872327 - BLOCK
      ?auto_872328 - BLOCK
      ?auto_872329 - BLOCK
      ?auto_872330 - BLOCK
      ?auto_872331 - BLOCK
      ?auto_872332 - BLOCK
      ?auto_872333 - BLOCK
      ?auto_872334 - BLOCK
    )
    :vars
    (
      ?auto_872335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_872334 ?auto_872335 ) ( ON-TABLE ?auto_872327 ) ( ON ?auto_872328 ?auto_872327 ) ( ON ?auto_872329 ?auto_872328 ) ( ON ?auto_872330 ?auto_872329 ) ( ON ?auto_872331 ?auto_872330 ) ( not ( = ?auto_872327 ?auto_872328 ) ) ( not ( = ?auto_872327 ?auto_872329 ) ) ( not ( = ?auto_872327 ?auto_872330 ) ) ( not ( = ?auto_872327 ?auto_872331 ) ) ( not ( = ?auto_872327 ?auto_872332 ) ) ( not ( = ?auto_872327 ?auto_872333 ) ) ( not ( = ?auto_872327 ?auto_872334 ) ) ( not ( = ?auto_872327 ?auto_872335 ) ) ( not ( = ?auto_872328 ?auto_872329 ) ) ( not ( = ?auto_872328 ?auto_872330 ) ) ( not ( = ?auto_872328 ?auto_872331 ) ) ( not ( = ?auto_872328 ?auto_872332 ) ) ( not ( = ?auto_872328 ?auto_872333 ) ) ( not ( = ?auto_872328 ?auto_872334 ) ) ( not ( = ?auto_872328 ?auto_872335 ) ) ( not ( = ?auto_872329 ?auto_872330 ) ) ( not ( = ?auto_872329 ?auto_872331 ) ) ( not ( = ?auto_872329 ?auto_872332 ) ) ( not ( = ?auto_872329 ?auto_872333 ) ) ( not ( = ?auto_872329 ?auto_872334 ) ) ( not ( = ?auto_872329 ?auto_872335 ) ) ( not ( = ?auto_872330 ?auto_872331 ) ) ( not ( = ?auto_872330 ?auto_872332 ) ) ( not ( = ?auto_872330 ?auto_872333 ) ) ( not ( = ?auto_872330 ?auto_872334 ) ) ( not ( = ?auto_872330 ?auto_872335 ) ) ( not ( = ?auto_872331 ?auto_872332 ) ) ( not ( = ?auto_872331 ?auto_872333 ) ) ( not ( = ?auto_872331 ?auto_872334 ) ) ( not ( = ?auto_872331 ?auto_872335 ) ) ( not ( = ?auto_872332 ?auto_872333 ) ) ( not ( = ?auto_872332 ?auto_872334 ) ) ( not ( = ?auto_872332 ?auto_872335 ) ) ( not ( = ?auto_872333 ?auto_872334 ) ) ( not ( = ?auto_872333 ?auto_872335 ) ) ( not ( = ?auto_872334 ?auto_872335 ) ) ( ON ?auto_872333 ?auto_872334 ) ( CLEAR ?auto_872331 ) ( ON ?auto_872332 ?auto_872333 ) ( CLEAR ?auto_872332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_872327 ?auto_872328 ?auto_872329 ?auto_872330 ?auto_872331 ?auto_872332 )
      ( MAKE-8PILE ?auto_872327 ?auto_872328 ?auto_872329 ?auto_872330 ?auto_872331 ?auto_872332 ?auto_872333 ?auto_872334 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_872361 - BLOCK
      ?auto_872362 - BLOCK
      ?auto_872363 - BLOCK
      ?auto_872364 - BLOCK
      ?auto_872365 - BLOCK
      ?auto_872366 - BLOCK
      ?auto_872367 - BLOCK
      ?auto_872368 - BLOCK
    )
    :vars
    (
      ?auto_872369 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_872368 ?auto_872369 ) ( ON-TABLE ?auto_872361 ) ( ON ?auto_872362 ?auto_872361 ) ( ON ?auto_872363 ?auto_872362 ) ( ON ?auto_872364 ?auto_872363 ) ( not ( = ?auto_872361 ?auto_872362 ) ) ( not ( = ?auto_872361 ?auto_872363 ) ) ( not ( = ?auto_872361 ?auto_872364 ) ) ( not ( = ?auto_872361 ?auto_872365 ) ) ( not ( = ?auto_872361 ?auto_872366 ) ) ( not ( = ?auto_872361 ?auto_872367 ) ) ( not ( = ?auto_872361 ?auto_872368 ) ) ( not ( = ?auto_872361 ?auto_872369 ) ) ( not ( = ?auto_872362 ?auto_872363 ) ) ( not ( = ?auto_872362 ?auto_872364 ) ) ( not ( = ?auto_872362 ?auto_872365 ) ) ( not ( = ?auto_872362 ?auto_872366 ) ) ( not ( = ?auto_872362 ?auto_872367 ) ) ( not ( = ?auto_872362 ?auto_872368 ) ) ( not ( = ?auto_872362 ?auto_872369 ) ) ( not ( = ?auto_872363 ?auto_872364 ) ) ( not ( = ?auto_872363 ?auto_872365 ) ) ( not ( = ?auto_872363 ?auto_872366 ) ) ( not ( = ?auto_872363 ?auto_872367 ) ) ( not ( = ?auto_872363 ?auto_872368 ) ) ( not ( = ?auto_872363 ?auto_872369 ) ) ( not ( = ?auto_872364 ?auto_872365 ) ) ( not ( = ?auto_872364 ?auto_872366 ) ) ( not ( = ?auto_872364 ?auto_872367 ) ) ( not ( = ?auto_872364 ?auto_872368 ) ) ( not ( = ?auto_872364 ?auto_872369 ) ) ( not ( = ?auto_872365 ?auto_872366 ) ) ( not ( = ?auto_872365 ?auto_872367 ) ) ( not ( = ?auto_872365 ?auto_872368 ) ) ( not ( = ?auto_872365 ?auto_872369 ) ) ( not ( = ?auto_872366 ?auto_872367 ) ) ( not ( = ?auto_872366 ?auto_872368 ) ) ( not ( = ?auto_872366 ?auto_872369 ) ) ( not ( = ?auto_872367 ?auto_872368 ) ) ( not ( = ?auto_872367 ?auto_872369 ) ) ( not ( = ?auto_872368 ?auto_872369 ) ) ( ON ?auto_872367 ?auto_872368 ) ( ON ?auto_872366 ?auto_872367 ) ( CLEAR ?auto_872364 ) ( ON ?auto_872365 ?auto_872366 ) ( CLEAR ?auto_872365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_872361 ?auto_872362 ?auto_872363 ?auto_872364 ?auto_872365 )
      ( MAKE-8PILE ?auto_872361 ?auto_872362 ?auto_872363 ?auto_872364 ?auto_872365 ?auto_872366 ?auto_872367 ?auto_872368 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_872395 - BLOCK
      ?auto_872396 - BLOCK
      ?auto_872397 - BLOCK
      ?auto_872398 - BLOCK
      ?auto_872399 - BLOCK
      ?auto_872400 - BLOCK
      ?auto_872401 - BLOCK
      ?auto_872402 - BLOCK
    )
    :vars
    (
      ?auto_872403 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_872402 ?auto_872403 ) ( ON-TABLE ?auto_872395 ) ( ON ?auto_872396 ?auto_872395 ) ( ON ?auto_872397 ?auto_872396 ) ( not ( = ?auto_872395 ?auto_872396 ) ) ( not ( = ?auto_872395 ?auto_872397 ) ) ( not ( = ?auto_872395 ?auto_872398 ) ) ( not ( = ?auto_872395 ?auto_872399 ) ) ( not ( = ?auto_872395 ?auto_872400 ) ) ( not ( = ?auto_872395 ?auto_872401 ) ) ( not ( = ?auto_872395 ?auto_872402 ) ) ( not ( = ?auto_872395 ?auto_872403 ) ) ( not ( = ?auto_872396 ?auto_872397 ) ) ( not ( = ?auto_872396 ?auto_872398 ) ) ( not ( = ?auto_872396 ?auto_872399 ) ) ( not ( = ?auto_872396 ?auto_872400 ) ) ( not ( = ?auto_872396 ?auto_872401 ) ) ( not ( = ?auto_872396 ?auto_872402 ) ) ( not ( = ?auto_872396 ?auto_872403 ) ) ( not ( = ?auto_872397 ?auto_872398 ) ) ( not ( = ?auto_872397 ?auto_872399 ) ) ( not ( = ?auto_872397 ?auto_872400 ) ) ( not ( = ?auto_872397 ?auto_872401 ) ) ( not ( = ?auto_872397 ?auto_872402 ) ) ( not ( = ?auto_872397 ?auto_872403 ) ) ( not ( = ?auto_872398 ?auto_872399 ) ) ( not ( = ?auto_872398 ?auto_872400 ) ) ( not ( = ?auto_872398 ?auto_872401 ) ) ( not ( = ?auto_872398 ?auto_872402 ) ) ( not ( = ?auto_872398 ?auto_872403 ) ) ( not ( = ?auto_872399 ?auto_872400 ) ) ( not ( = ?auto_872399 ?auto_872401 ) ) ( not ( = ?auto_872399 ?auto_872402 ) ) ( not ( = ?auto_872399 ?auto_872403 ) ) ( not ( = ?auto_872400 ?auto_872401 ) ) ( not ( = ?auto_872400 ?auto_872402 ) ) ( not ( = ?auto_872400 ?auto_872403 ) ) ( not ( = ?auto_872401 ?auto_872402 ) ) ( not ( = ?auto_872401 ?auto_872403 ) ) ( not ( = ?auto_872402 ?auto_872403 ) ) ( ON ?auto_872401 ?auto_872402 ) ( ON ?auto_872400 ?auto_872401 ) ( ON ?auto_872399 ?auto_872400 ) ( CLEAR ?auto_872397 ) ( ON ?auto_872398 ?auto_872399 ) ( CLEAR ?auto_872398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_872395 ?auto_872396 ?auto_872397 ?auto_872398 )
      ( MAKE-8PILE ?auto_872395 ?auto_872396 ?auto_872397 ?auto_872398 ?auto_872399 ?auto_872400 ?auto_872401 ?auto_872402 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_872429 - BLOCK
      ?auto_872430 - BLOCK
      ?auto_872431 - BLOCK
      ?auto_872432 - BLOCK
      ?auto_872433 - BLOCK
      ?auto_872434 - BLOCK
      ?auto_872435 - BLOCK
      ?auto_872436 - BLOCK
    )
    :vars
    (
      ?auto_872437 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_872436 ?auto_872437 ) ( ON-TABLE ?auto_872429 ) ( ON ?auto_872430 ?auto_872429 ) ( not ( = ?auto_872429 ?auto_872430 ) ) ( not ( = ?auto_872429 ?auto_872431 ) ) ( not ( = ?auto_872429 ?auto_872432 ) ) ( not ( = ?auto_872429 ?auto_872433 ) ) ( not ( = ?auto_872429 ?auto_872434 ) ) ( not ( = ?auto_872429 ?auto_872435 ) ) ( not ( = ?auto_872429 ?auto_872436 ) ) ( not ( = ?auto_872429 ?auto_872437 ) ) ( not ( = ?auto_872430 ?auto_872431 ) ) ( not ( = ?auto_872430 ?auto_872432 ) ) ( not ( = ?auto_872430 ?auto_872433 ) ) ( not ( = ?auto_872430 ?auto_872434 ) ) ( not ( = ?auto_872430 ?auto_872435 ) ) ( not ( = ?auto_872430 ?auto_872436 ) ) ( not ( = ?auto_872430 ?auto_872437 ) ) ( not ( = ?auto_872431 ?auto_872432 ) ) ( not ( = ?auto_872431 ?auto_872433 ) ) ( not ( = ?auto_872431 ?auto_872434 ) ) ( not ( = ?auto_872431 ?auto_872435 ) ) ( not ( = ?auto_872431 ?auto_872436 ) ) ( not ( = ?auto_872431 ?auto_872437 ) ) ( not ( = ?auto_872432 ?auto_872433 ) ) ( not ( = ?auto_872432 ?auto_872434 ) ) ( not ( = ?auto_872432 ?auto_872435 ) ) ( not ( = ?auto_872432 ?auto_872436 ) ) ( not ( = ?auto_872432 ?auto_872437 ) ) ( not ( = ?auto_872433 ?auto_872434 ) ) ( not ( = ?auto_872433 ?auto_872435 ) ) ( not ( = ?auto_872433 ?auto_872436 ) ) ( not ( = ?auto_872433 ?auto_872437 ) ) ( not ( = ?auto_872434 ?auto_872435 ) ) ( not ( = ?auto_872434 ?auto_872436 ) ) ( not ( = ?auto_872434 ?auto_872437 ) ) ( not ( = ?auto_872435 ?auto_872436 ) ) ( not ( = ?auto_872435 ?auto_872437 ) ) ( not ( = ?auto_872436 ?auto_872437 ) ) ( ON ?auto_872435 ?auto_872436 ) ( ON ?auto_872434 ?auto_872435 ) ( ON ?auto_872433 ?auto_872434 ) ( ON ?auto_872432 ?auto_872433 ) ( CLEAR ?auto_872430 ) ( ON ?auto_872431 ?auto_872432 ) ( CLEAR ?auto_872431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_872429 ?auto_872430 ?auto_872431 )
      ( MAKE-8PILE ?auto_872429 ?auto_872430 ?auto_872431 ?auto_872432 ?auto_872433 ?auto_872434 ?auto_872435 ?auto_872436 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_872463 - BLOCK
      ?auto_872464 - BLOCK
      ?auto_872465 - BLOCK
      ?auto_872466 - BLOCK
      ?auto_872467 - BLOCK
      ?auto_872468 - BLOCK
      ?auto_872469 - BLOCK
      ?auto_872470 - BLOCK
    )
    :vars
    (
      ?auto_872471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_872470 ?auto_872471 ) ( ON-TABLE ?auto_872463 ) ( not ( = ?auto_872463 ?auto_872464 ) ) ( not ( = ?auto_872463 ?auto_872465 ) ) ( not ( = ?auto_872463 ?auto_872466 ) ) ( not ( = ?auto_872463 ?auto_872467 ) ) ( not ( = ?auto_872463 ?auto_872468 ) ) ( not ( = ?auto_872463 ?auto_872469 ) ) ( not ( = ?auto_872463 ?auto_872470 ) ) ( not ( = ?auto_872463 ?auto_872471 ) ) ( not ( = ?auto_872464 ?auto_872465 ) ) ( not ( = ?auto_872464 ?auto_872466 ) ) ( not ( = ?auto_872464 ?auto_872467 ) ) ( not ( = ?auto_872464 ?auto_872468 ) ) ( not ( = ?auto_872464 ?auto_872469 ) ) ( not ( = ?auto_872464 ?auto_872470 ) ) ( not ( = ?auto_872464 ?auto_872471 ) ) ( not ( = ?auto_872465 ?auto_872466 ) ) ( not ( = ?auto_872465 ?auto_872467 ) ) ( not ( = ?auto_872465 ?auto_872468 ) ) ( not ( = ?auto_872465 ?auto_872469 ) ) ( not ( = ?auto_872465 ?auto_872470 ) ) ( not ( = ?auto_872465 ?auto_872471 ) ) ( not ( = ?auto_872466 ?auto_872467 ) ) ( not ( = ?auto_872466 ?auto_872468 ) ) ( not ( = ?auto_872466 ?auto_872469 ) ) ( not ( = ?auto_872466 ?auto_872470 ) ) ( not ( = ?auto_872466 ?auto_872471 ) ) ( not ( = ?auto_872467 ?auto_872468 ) ) ( not ( = ?auto_872467 ?auto_872469 ) ) ( not ( = ?auto_872467 ?auto_872470 ) ) ( not ( = ?auto_872467 ?auto_872471 ) ) ( not ( = ?auto_872468 ?auto_872469 ) ) ( not ( = ?auto_872468 ?auto_872470 ) ) ( not ( = ?auto_872468 ?auto_872471 ) ) ( not ( = ?auto_872469 ?auto_872470 ) ) ( not ( = ?auto_872469 ?auto_872471 ) ) ( not ( = ?auto_872470 ?auto_872471 ) ) ( ON ?auto_872469 ?auto_872470 ) ( ON ?auto_872468 ?auto_872469 ) ( ON ?auto_872467 ?auto_872468 ) ( ON ?auto_872466 ?auto_872467 ) ( ON ?auto_872465 ?auto_872466 ) ( CLEAR ?auto_872463 ) ( ON ?auto_872464 ?auto_872465 ) ( CLEAR ?auto_872464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_872463 ?auto_872464 )
      ( MAKE-8PILE ?auto_872463 ?auto_872464 ?auto_872465 ?auto_872466 ?auto_872467 ?auto_872468 ?auto_872469 ?auto_872470 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_872497 - BLOCK
      ?auto_872498 - BLOCK
      ?auto_872499 - BLOCK
      ?auto_872500 - BLOCK
      ?auto_872501 - BLOCK
      ?auto_872502 - BLOCK
      ?auto_872503 - BLOCK
      ?auto_872504 - BLOCK
    )
    :vars
    (
      ?auto_872505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_872504 ?auto_872505 ) ( not ( = ?auto_872497 ?auto_872498 ) ) ( not ( = ?auto_872497 ?auto_872499 ) ) ( not ( = ?auto_872497 ?auto_872500 ) ) ( not ( = ?auto_872497 ?auto_872501 ) ) ( not ( = ?auto_872497 ?auto_872502 ) ) ( not ( = ?auto_872497 ?auto_872503 ) ) ( not ( = ?auto_872497 ?auto_872504 ) ) ( not ( = ?auto_872497 ?auto_872505 ) ) ( not ( = ?auto_872498 ?auto_872499 ) ) ( not ( = ?auto_872498 ?auto_872500 ) ) ( not ( = ?auto_872498 ?auto_872501 ) ) ( not ( = ?auto_872498 ?auto_872502 ) ) ( not ( = ?auto_872498 ?auto_872503 ) ) ( not ( = ?auto_872498 ?auto_872504 ) ) ( not ( = ?auto_872498 ?auto_872505 ) ) ( not ( = ?auto_872499 ?auto_872500 ) ) ( not ( = ?auto_872499 ?auto_872501 ) ) ( not ( = ?auto_872499 ?auto_872502 ) ) ( not ( = ?auto_872499 ?auto_872503 ) ) ( not ( = ?auto_872499 ?auto_872504 ) ) ( not ( = ?auto_872499 ?auto_872505 ) ) ( not ( = ?auto_872500 ?auto_872501 ) ) ( not ( = ?auto_872500 ?auto_872502 ) ) ( not ( = ?auto_872500 ?auto_872503 ) ) ( not ( = ?auto_872500 ?auto_872504 ) ) ( not ( = ?auto_872500 ?auto_872505 ) ) ( not ( = ?auto_872501 ?auto_872502 ) ) ( not ( = ?auto_872501 ?auto_872503 ) ) ( not ( = ?auto_872501 ?auto_872504 ) ) ( not ( = ?auto_872501 ?auto_872505 ) ) ( not ( = ?auto_872502 ?auto_872503 ) ) ( not ( = ?auto_872502 ?auto_872504 ) ) ( not ( = ?auto_872502 ?auto_872505 ) ) ( not ( = ?auto_872503 ?auto_872504 ) ) ( not ( = ?auto_872503 ?auto_872505 ) ) ( not ( = ?auto_872504 ?auto_872505 ) ) ( ON ?auto_872503 ?auto_872504 ) ( ON ?auto_872502 ?auto_872503 ) ( ON ?auto_872501 ?auto_872502 ) ( ON ?auto_872500 ?auto_872501 ) ( ON ?auto_872499 ?auto_872500 ) ( ON ?auto_872498 ?auto_872499 ) ( ON ?auto_872497 ?auto_872498 ) ( CLEAR ?auto_872497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_872497 )
      ( MAKE-8PILE ?auto_872497 ?auto_872498 ?auto_872499 ?auto_872500 ?auto_872501 ?auto_872502 ?auto_872503 ?auto_872504 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_872532 - BLOCK
      ?auto_872533 - BLOCK
      ?auto_872534 - BLOCK
      ?auto_872535 - BLOCK
      ?auto_872536 - BLOCK
      ?auto_872537 - BLOCK
      ?auto_872538 - BLOCK
      ?auto_872539 - BLOCK
      ?auto_872540 - BLOCK
    )
    :vars
    (
      ?auto_872541 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_872539 ) ( ON ?auto_872540 ?auto_872541 ) ( CLEAR ?auto_872540 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_872532 ) ( ON ?auto_872533 ?auto_872532 ) ( ON ?auto_872534 ?auto_872533 ) ( ON ?auto_872535 ?auto_872534 ) ( ON ?auto_872536 ?auto_872535 ) ( ON ?auto_872537 ?auto_872536 ) ( ON ?auto_872538 ?auto_872537 ) ( ON ?auto_872539 ?auto_872538 ) ( not ( = ?auto_872532 ?auto_872533 ) ) ( not ( = ?auto_872532 ?auto_872534 ) ) ( not ( = ?auto_872532 ?auto_872535 ) ) ( not ( = ?auto_872532 ?auto_872536 ) ) ( not ( = ?auto_872532 ?auto_872537 ) ) ( not ( = ?auto_872532 ?auto_872538 ) ) ( not ( = ?auto_872532 ?auto_872539 ) ) ( not ( = ?auto_872532 ?auto_872540 ) ) ( not ( = ?auto_872532 ?auto_872541 ) ) ( not ( = ?auto_872533 ?auto_872534 ) ) ( not ( = ?auto_872533 ?auto_872535 ) ) ( not ( = ?auto_872533 ?auto_872536 ) ) ( not ( = ?auto_872533 ?auto_872537 ) ) ( not ( = ?auto_872533 ?auto_872538 ) ) ( not ( = ?auto_872533 ?auto_872539 ) ) ( not ( = ?auto_872533 ?auto_872540 ) ) ( not ( = ?auto_872533 ?auto_872541 ) ) ( not ( = ?auto_872534 ?auto_872535 ) ) ( not ( = ?auto_872534 ?auto_872536 ) ) ( not ( = ?auto_872534 ?auto_872537 ) ) ( not ( = ?auto_872534 ?auto_872538 ) ) ( not ( = ?auto_872534 ?auto_872539 ) ) ( not ( = ?auto_872534 ?auto_872540 ) ) ( not ( = ?auto_872534 ?auto_872541 ) ) ( not ( = ?auto_872535 ?auto_872536 ) ) ( not ( = ?auto_872535 ?auto_872537 ) ) ( not ( = ?auto_872535 ?auto_872538 ) ) ( not ( = ?auto_872535 ?auto_872539 ) ) ( not ( = ?auto_872535 ?auto_872540 ) ) ( not ( = ?auto_872535 ?auto_872541 ) ) ( not ( = ?auto_872536 ?auto_872537 ) ) ( not ( = ?auto_872536 ?auto_872538 ) ) ( not ( = ?auto_872536 ?auto_872539 ) ) ( not ( = ?auto_872536 ?auto_872540 ) ) ( not ( = ?auto_872536 ?auto_872541 ) ) ( not ( = ?auto_872537 ?auto_872538 ) ) ( not ( = ?auto_872537 ?auto_872539 ) ) ( not ( = ?auto_872537 ?auto_872540 ) ) ( not ( = ?auto_872537 ?auto_872541 ) ) ( not ( = ?auto_872538 ?auto_872539 ) ) ( not ( = ?auto_872538 ?auto_872540 ) ) ( not ( = ?auto_872538 ?auto_872541 ) ) ( not ( = ?auto_872539 ?auto_872540 ) ) ( not ( = ?auto_872539 ?auto_872541 ) ) ( not ( = ?auto_872540 ?auto_872541 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_872540 ?auto_872541 )
      ( !STACK ?auto_872540 ?auto_872539 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_872570 - BLOCK
      ?auto_872571 - BLOCK
      ?auto_872572 - BLOCK
      ?auto_872573 - BLOCK
      ?auto_872574 - BLOCK
      ?auto_872575 - BLOCK
      ?auto_872576 - BLOCK
      ?auto_872577 - BLOCK
      ?auto_872578 - BLOCK
    )
    :vars
    (
      ?auto_872579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_872578 ?auto_872579 ) ( ON-TABLE ?auto_872570 ) ( ON ?auto_872571 ?auto_872570 ) ( ON ?auto_872572 ?auto_872571 ) ( ON ?auto_872573 ?auto_872572 ) ( ON ?auto_872574 ?auto_872573 ) ( ON ?auto_872575 ?auto_872574 ) ( ON ?auto_872576 ?auto_872575 ) ( not ( = ?auto_872570 ?auto_872571 ) ) ( not ( = ?auto_872570 ?auto_872572 ) ) ( not ( = ?auto_872570 ?auto_872573 ) ) ( not ( = ?auto_872570 ?auto_872574 ) ) ( not ( = ?auto_872570 ?auto_872575 ) ) ( not ( = ?auto_872570 ?auto_872576 ) ) ( not ( = ?auto_872570 ?auto_872577 ) ) ( not ( = ?auto_872570 ?auto_872578 ) ) ( not ( = ?auto_872570 ?auto_872579 ) ) ( not ( = ?auto_872571 ?auto_872572 ) ) ( not ( = ?auto_872571 ?auto_872573 ) ) ( not ( = ?auto_872571 ?auto_872574 ) ) ( not ( = ?auto_872571 ?auto_872575 ) ) ( not ( = ?auto_872571 ?auto_872576 ) ) ( not ( = ?auto_872571 ?auto_872577 ) ) ( not ( = ?auto_872571 ?auto_872578 ) ) ( not ( = ?auto_872571 ?auto_872579 ) ) ( not ( = ?auto_872572 ?auto_872573 ) ) ( not ( = ?auto_872572 ?auto_872574 ) ) ( not ( = ?auto_872572 ?auto_872575 ) ) ( not ( = ?auto_872572 ?auto_872576 ) ) ( not ( = ?auto_872572 ?auto_872577 ) ) ( not ( = ?auto_872572 ?auto_872578 ) ) ( not ( = ?auto_872572 ?auto_872579 ) ) ( not ( = ?auto_872573 ?auto_872574 ) ) ( not ( = ?auto_872573 ?auto_872575 ) ) ( not ( = ?auto_872573 ?auto_872576 ) ) ( not ( = ?auto_872573 ?auto_872577 ) ) ( not ( = ?auto_872573 ?auto_872578 ) ) ( not ( = ?auto_872573 ?auto_872579 ) ) ( not ( = ?auto_872574 ?auto_872575 ) ) ( not ( = ?auto_872574 ?auto_872576 ) ) ( not ( = ?auto_872574 ?auto_872577 ) ) ( not ( = ?auto_872574 ?auto_872578 ) ) ( not ( = ?auto_872574 ?auto_872579 ) ) ( not ( = ?auto_872575 ?auto_872576 ) ) ( not ( = ?auto_872575 ?auto_872577 ) ) ( not ( = ?auto_872575 ?auto_872578 ) ) ( not ( = ?auto_872575 ?auto_872579 ) ) ( not ( = ?auto_872576 ?auto_872577 ) ) ( not ( = ?auto_872576 ?auto_872578 ) ) ( not ( = ?auto_872576 ?auto_872579 ) ) ( not ( = ?auto_872577 ?auto_872578 ) ) ( not ( = ?auto_872577 ?auto_872579 ) ) ( not ( = ?auto_872578 ?auto_872579 ) ) ( CLEAR ?auto_872576 ) ( ON ?auto_872577 ?auto_872578 ) ( CLEAR ?auto_872577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_872570 ?auto_872571 ?auto_872572 ?auto_872573 ?auto_872574 ?auto_872575 ?auto_872576 ?auto_872577 )
      ( MAKE-9PILE ?auto_872570 ?auto_872571 ?auto_872572 ?auto_872573 ?auto_872574 ?auto_872575 ?auto_872576 ?auto_872577 ?auto_872578 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_872608 - BLOCK
      ?auto_872609 - BLOCK
      ?auto_872610 - BLOCK
      ?auto_872611 - BLOCK
      ?auto_872612 - BLOCK
      ?auto_872613 - BLOCK
      ?auto_872614 - BLOCK
      ?auto_872615 - BLOCK
      ?auto_872616 - BLOCK
    )
    :vars
    (
      ?auto_872617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_872616 ?auto_872617 ) ( ON-TABLE ?auto_872608 ) ( ON ?auto_872609 ?auto_872608 ) ( ON ?auto_872610 ?auto_872609 ) ( ON ?auto_872611 ?auto_872610 ) ( ON ?auto_872612 ?auto_872611 ) ( ON ?auto_872613 ?auto_872612 ) ( not ( = ?auto_872608 ?auto_872609 ) ) ( not ( = ?auto_872608 ?auto_872610 ) ) ( not ( = ?auto_872608 ?auto_872611 ) ) ( not ( = ?auto_872608 ?auto_872612 ) ) ( not ( = ?auto_872608 ?auto_872613 ) ) ( not ( = ?auto_872608 ?auto_872614 ) ) ( not ( = ?auto_872608 ?auto_872615 ) ) ( not ( = ?auto_872608 ?auto_872616 ) ) ( not ( = ?auto_872608 ?auto_872617 ) ) ( not ( = ?auto_872609 ?auto_872610 ) ) ( not ( = ?auto_872609 ?auto_872611 ) ) ( not ( = ?auto_872609 ?auto_872612 ) ) ( not ( = ?auto_872609 ?auto_872613 ) ) ( not ( = ?auto_872609 ?auto_872614 ) ) ( not ( = ?auto_872609 ?auto_872615 ) ) ( not ( = ?auto_872609 ?auto_872616 ) ) ( not ( = ?auto_872609 ?auto_872617 ) ) ( not ( = ?auto_872610 ?auto_872611 ) ) ( not ( = ?auto_872610 ?auto_872612 ) ) ( not ( = ?auto_872610 ?auto_872613 ) ) ( not ( = ?auto_872610 ?auto_872614 ) ) ( not ( = ?auto_872610 ?auto_872615 ) ) ( not ( = ?auto_872610 ?auto_872616 ) ) ( not ( = ?auto_872610 ?auto_872617 ) ) ( not ( = ?auto_872611 ?auto_872612 ) ) ( not ( = ?auto_872611 ?auto_872613 ) ) ( not ( = ?auto_872611 ?auto_872614 ) ) ( not ( = ?auto_872611 ?auto_872615 ) ) ( not ( = ?auto_872611 ?auto_872616 ) ) ( not ( = ?auto_872611 ?auto_872617 ) ) ( not ( = ?auto_872612 ?auto_872613 ) ) ( not ( = ?auto_872612 ?auto_872614 ) ) ( not ( = ?auto_872612 ?auto_872615 ) ) ( not ( = ?auto_872612 ?auto_872616 ) ) ( not ( = ?auto_872612 ?auto_872617 ) ) ( not ( = ?auto_872613 ?auto_872614 ) ) ( not ( = ?auto_872613 ?auto_872615 ) ) ( not ( = ?auto_872613 ?auto_872616 ) ) ( not ( = ?auto_872613 ?auto_872617 ) ) ( not ( = ?auto_872614 ?auto_872615 ) ) ( not ( = ?auto_872614 ?auto_872616 ) ) ( not ( = ?auto_872614 ?auto_872617 ) ) ( not ( = ?auto_872615 ?auto_872616 ) ) ( not ( = ?auto_872615 ?auto_872617 ) ) ( not ( = ?auto_872616 ?auto_872617 ) ) ( ON ?auto_872615 ?auto_872616 ) ( CLEAR ?auto_872613 ) ( ON ?auto_872614 ?auto_872615 ) ( CLEAR ?auto_872614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_872608 ?auto_872609 ?auto_872610 ?auto_872611 ?auto_872612 ?auto_872613 ?auto_872614 )
      ( MAKE-9PILE ?auto_872608 ?auto_872609 ?auto_872610 ?auto_872611 ?auto_872612 ?auto_872613 ?auto_872614 ?auto_872615 ?auto_872616 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_872646 - BLOCK
      ?auto_872647 - BLOCK
      ?auto_872648 - BLOCK
      ?auto_872649 - BLOCK
      ?auto_872650 - BLOCK
      ?auto_872651 - BLOCK
      ?auto_872652 - BLOCK
      ?auto_872653 - BLOCK
      ?auto_872654 - BLOCK
    )
    :vars
    (
      ?auto_872655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_872654 ?auto_872655 ) ( ON-TABLE ?auto_872646 ) ( ON ?auto_872647 ?auto_872646 ) ( ON ?auto_872648 ?auto_872647 ) ( ON ?auto_872649 ?auto_872648 ) ( ON ?auto_872650 ?auto_872649 ) ( not ( = ?auto_872646 ?auto_872647 ) ) ( not ( = ?auto_872646 ?auto_872648 ) ) ( not ( = ?auto_872646 ?auto_872649 ) ) ( not ( = ?auto_872646 ?auto_872650 ) ) ( not ( = ?auto_872646 ?auto_872651 ) ) ( not ( = ?auto_872646 ?auto_872652 ) ) ( not ( = ?auto_872646 ?auto_872653 ) ) ( not ( = ?auto_872646 ?auto_872654 ) ) ( not ( = ?auto_872646 ?auto_872655 ) ) ( not ( = ?auto_872647 ?auto_872648 ) ) ( not ( = ?auto_872647 ?auto_872649 ) ) ( not ( = ?auto_872647 ?auto_872650 ) ) ( not ( = ?auto_872647 ?auto_872651 ) ) ( not ( = ?auto_872647 ?auto_872652 ) ) ( not ( = ?auto_872647 ?auto_872653 ) ) ( not ( = ?auto_872647 ?auto_872654 ) ) ( not ( = ?auto_872647 ?auto_872655 ) ) ( not ( = ?auto_872648 ?auto_872649 ) ) ( not ( = ?auto_872648 ?auto_872650 ) ) ( not ( = ?auto_872648 ?auto_872651 ) ) ( not ( = ?auto_872648 ?auto_872652 ) ) ( not ( = ?auto_872648 ?auto_872653 ) ) ( not ( = ?auto_872648 ?auto_872654 ) ) ( not ( = ?auto_872648 ?auto_872655 ) ) ( not ( = ?auto_872649 ?auto_872650 ) ) ( not ( = ?auto_872649 ?auto_872651 ) ) ( not ( = ?auto_872649 ?auto_872652 ) ) ( not ( = ?auto_872649 ?auto_872653 ) ) ( not ( = ?auto_872649 ?auto_872654 ) ) ( not ( = ?auto_872649 ?auto_872655 ) ) ( not ( = ?auto_872650 ?auto_872651 ) ) ( not ( = ?auto_872650 ?auto_872652 ) ) ( not ( = ?auto_872650 ?auto_872653 ) ) ( not ( = ?auto_872650 ?auto_872654 ) ) ( not ( = ?auto_872650 ?auto_872655 ) ) ( not ( = ?auto_872651 ?auto_872652 ) ) ( not ( = ?auto_872651 ?auto_872653 ) ) ( not ( = ?auto_872651 ?auto_872654 ) ) ( not ( = ?auto_872651 ?auto_872655 ) ) ( not ( = ?auto_872652 ?auto_872653 ) ) ( not ( = ?auto_872652 ?auto_872654 ) ) ( not ( = ?auto_872652 ?auto_872655 ) ) ( not ( = ?auto_872653 ?auto_872654 ) ) ( not ( = ?auto_872653 ?auto_872655 ) ) ( not ( = ?auto_872654 ?auto_872655 ) ) ( ON ?auto_872653 ?auto_872654 ) ( ON ?auto_872652 ?auto_872653 ) ( CLEAR ?auto_872650 ) ( ON ?auto_872651 ?auto_872652 ) ( CLEAR ?auto_872651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_872646 ?auto_872647 ?auto_872648 ?auto_872649 ?auto_872650 ?auto_872651 )
      ( MAKE-9PILE ?auto_872646 ?auto_872647 ?auto_872648 ?auto_872649 ?auto_872650 ?auto_872651 ?auto_872652 ?auto_872653 ?auto_872654 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_872684 - BLOCK
      ?auto_872685 - BLOCK
      ?auto_872686 - BLOCK
      ?auto_872687 - BLOCK
      ?auto_872688 - BLOCK
      ?auto_872689 - BLOCK
      ?auto_872690 - BLOCK
      ?auto_872691 - BLOCK
      ?auto_872692 - BLOCK
    )
    :vars
    (
      ?auto_872693 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_872692 ?auto_872693 ) ( ON-TABLE ?auto_872684 ) ( ON ?auto_872685 ?auto_872684 ) ( ON ?auto_872686 ?auto_872685 ) ( ON ?auto_872687 ?auto_872686 ) ( not ( = ?auto_872684 ?auto_872685 ) ) ( not ( = ?auto_872684 ?auto_872686 ) ) ( not ( = ?auto_872684 ?auto_872687 ) ) ( not ( = ?auto_872684 ?auto_872688 ) ) ( not ( = ?auto_872684 ?auto_872689 ) ) ( not ( = ?auto_872684 ?auto_872690 ) ) ( not ( = ?auto_872684 ?auto_872691 ) ) ( not ( = ?auto_872684 ?auto_872692 ) ) ( not ( = ?auto_872684 ?auto_872693 ) ) ( not ( = ?auto_872685 ?auto_872686 ) ) ( not ( = ?auto_872685 ?auto_872687 ) ) ( not ( = ?auto_872685 ?auto_872688 ) ) ( not ( = ?auto_872685 ?auto_872689 ) ) ( not ( = ?auto_872685 ?auto_872690 ) ) ( not ( = ?auto_872685 ?auto_872691 ) ) ( not ( = ?auto_872685 ?auto_872692 ) ) ( not ( = ?auto_872685 ?auto_872693 ) ) ( not ( = ?auto_872686 ?auto_872687 ) ) ( not ( = ?auto_872686 ?auto_872688 ) ) ( not ( = ?auto_872686 ?auto_872689 ) ) ( not ( = ?auto_872686 ?auto_872690 ) ) ( not ( = ?auto_872686 ?auto_872691 ) ) ( not ( = ?auto_872686 ?auto_872692 ) ) ( not ( = ?auto_872686 ?auto_872693 ) ) ( not ( = ?auto_872687 ?auto_872688 ) ) ( not ( = ?auto_872687 ?auto_872689 ) ) ( not ( = ?auto_872687 ?auto_872690 ) ) ( not ( = ?auto_872687 ?auto_872691 ) ) ( not ( = ?auto_872687 ?auto_872692 ) ) ( not ( = ?auto_872687 ?auto_872693 ) ) ( not ( = ?auto_872688 ?auto_872689 ) ) ( not ( = ?auto_872688 ?auto_872690 ) ) ( not ( = ?auto_872688 ?auto_872691 ) ) ( not ( = ?auto_872688 ?auto_872692 ) ) ( not ( = ?auto_872688 ?auto_872693 ) ) ( not ( = ?auto_872689 ?auto_872690 ) ) ( not ( = ?auto_872689 ?auto_872691 ) ) ( not ( = ?auto_872689 ?auto_872692 ) ) ( not ( = ?auto_872689 ?auto_872693 ) ) ( not ( = ?auto_872690 ?auto_872691 ) ) ( not ( = ?auto_872690 ?auto_872692 ) ) ( not ( = ?auto_872690 ?auto_872693 ) ) ( not ( = ?auto_872691 ?auto_872692 ) ) ( not ( = ?auto_872691 ?auto_872693 ) ) ( not ( = ?auto_872692 ?auto_872693 ) ) ( ON ?auto_872691 ?auto_872692 ) ( ON ?auto_872690 ?auto_872691 ) ( ON ?auto_872689 ?auto_872690 ) ( CLEAR ?auto_872687 ) ( ON ?auto_872688 ?auto_872689 ) ( CLEAR ?auto_872688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_872684 ?auto_872685 ?auto_872686 ?auto_872687 ?auto_872688 )
      ( MAKE-9PILE ?auto_872684 ?auto_872685 ?auto_872686 ?auto_872687 ?auto_872688 ?auto_872689 ?auto_872690 ?auto_872691 ?auto_872692 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_872722 - BLOCK
      ?auto_872723 - BLOCK
      ?auto_872724 - BLOCK
      ?auto_872725 - BLOCK
      ?auto_872726 - BLOCK
      ?auto_872727 - BLOCK
      ?auto_872728 - BLOCK
      ?auto_872729 - BLOCK
      ?auto_872730 - BLOCK
    )
    :vars
    (
      ?auto_872731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_872730 ?auto_872731 ) ( ON-TABLE ?auto_872722 ) ( ON ?auto_872723 ?auto_872722 ) ( ON ?auto_872724 ?auto_872723 ) ( not ( = ?auto_872722 ?auto_872723 ) ) ( not ( = ?auto_872722 ?auto_872724 ) ) ( not ( = ?auto_872722 ?auto_872725 ) ) ( not ( = ?auto_872722 ?auto_872726 ) ) ( not ( = ?auto_872722 ?auto_872727 ) ) ( not ( = ?auto_872722 ?auto_872728 ) ) ( not ( = ?auto_872722 ?auto_872729 ) ) ( not ( = ?auto_872722 ?auto_872730 ) ) ( not ( = ?auto_872722 ?auto_872731 ) ) ( not ( = ?auto_872723 ?auto_872724 ) ) ( not ( = ?auto_872723 ?auto_872725 ) ) ( not ( = ?auto_872723 ?auto_872726 ) ) ( not ( = ?auto_872723 ?auto_872727 ) ) ( not ( = ?auto_872723 ?auto_872728 ) ) ( not ( = ?auto_872723 ?auto_872729 ) ) ( not ( = ?auto_872723 ?auto_872730 ) ) ( not ( = ?auto_872723 ?auto_872731 ) ) ( not ( = ?auto_872724 ?auto_872725 ) ) ( not ( = ?auto_872724 ?auto_872726 ) ) ( not ( = ?auto_872724 ?auto_872727 ) ) ( not ( = ?auto_872724 ?auto_872728 ) ) ( not ( = ?auto_872724 ?auto_872729 ) ) ( not ( = ?auto_872724 ?auto_872730 ) ) ( not ( = ?auto_872724 ?auto_872731 ) ) ( not ( = ?auto_872725 ?auto_872726 ) ) ( not ( = ?auto_872725 ?auto_872727 ) ) ( not ( = ?auto_872725 ?auto_872728 ) ) ( not ( = ?auto_872725 ?auto_872729 ) ) ( not ( = ?auto_872725 ?auto_872730 ) ) ( not ( = ?auto_872725 ?auto_872731 ) ) ( not ( = ?auto_872726 ?auto_872727 ) ) ( not ( = ?auto_872726 ?auto_872728 ) ) ( not ( = ?auto_872726 ?auto_872729 ) ) ( not ( = ?auto_872726 ?auto_872730 ) ) ( not ( = ?auto_872726 ?auto_872731 ) ) ( not ( = ?auto_872727 ?auto_872728 ) ) ( not ( = ?auto_872727 ?auto_872729 ) ) ( not ( = ?auto_872727 ?auto_872730 ) ) ( not ( = ?auto_872727 ?auto_872731 ) ) ( not ( = ?auto_872728 ?auto_872729 ) ) ( not ( = ?auto_872728 ?auto_872730 ) ) ( not ( = ?auto_872728 ?auto_872731 ) ) ( not ( = ?auto_872729 ?auto_872730 ) ) ( not ( = ?auto_872729 ?auto_872731 ) ) ( not ( = ?auto_872730 ?auto_872731 ) ) ( ON ?auto_872729 ?auto_872730 ) ( ON ?auto_872728 ?auto_872729 ) ( ON ?auto_872727 ?auto_872728 ) ( ON ?auto_872726 ?auto_872727 ) ( CLEAR ?auto_872724 ) ( ON ?auto_872725 ?auto_872726 ) ( CLEAR ?auto_872725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_872722 ?auto_872723 ?auto_872724 ?auto_872725 )
      ( MAKE-9PILE ?auto_872722 ?auto_872723 ?auto_872724 ?auto_872725 ?auto_872726 ?auto_872727 ?auto_872728 ?auto_872729 ?auto_872730 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_872760 - BLOCK
      ?auto_872761 - BLOCK
      ?auto_872762 - BLOCK
      ?auto_872763 - BLOCK
      ?auto_872764 - BLOCK
      ?auto_872765 - BLOCK
      ?auto_872766 - BLOCK
      ?auto_872767 - BLOCK
      ?auto_872768 - BLOCK
    )
    :vars
    (
      ?auto_872769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_872768 ?auto_872769 ) ( ON-TABLE ?auto_872760 ) ( ON ?auto_872761 ?auto_872760 ) ( not ( = ?auto_872760 ?auto_872761 ) ) ( not ( = ?auto_872760 ?auto_872762 ) ) ( not ( = ?auto_872760 ?auto_872763 ) ) ( not ( = ?auto_872760 ?auto_872764 ) ) ( not ( = ?auto_872760 ?auto_872765 ) ) ( not ( = ?auto_872760 ?auto_872766 ) ) ( not ( = ?auto_872760 ?auto_872767 ) ) ( not ( = ?auto_872760 ?auto_872768 ) ) ( not ( = ?auto_872760 ?auto_872769 ) ) ( not ( = ?auto_872761 ?auto_872762 ) ) ( not ( = ?auto_872761 ?auto_872763 ) ) ( not ( = ?auto_872761 ?auto_872764 ) ) ( not ( = ?auto_872761 ?auto_872765 ) ) ( not ( = ?auto_872761 ?auto_872766 ) ) ( not ( = ?auto_872761 ?auto_872767 ) ) ( not ( = ?auto_872761 ?auto_872768 ) ) ( not ( = ?auto_872761 ?auto_872769 ) ) ( not ( = ?auto_872762 ?auto_872763 ) ) ( not ( = ?auto_872762 ?auto_872764 ) ) ( not ( = ?auto_872762 ?auto_872765 ) ) ( not ( = ?auto_872762 ?auto_872766 ) ) ( not ( = ?auto_872762 ?auto_872767 ) ) ( not ( = ?auto_872762 ?auto_872768 ) ) ( not ( = ?auto_872762 ?auto_872769 ) ) ( not ( = ?auto_872763 ?auto_872764 ) ) ( not ( = ?auto_872763 ?auto_872765 ) ) ( not ( = ?auto_872763 ?auto_872766 ) ) ( not ( = ?auto_872763 ?auto_872767 ) ) ( not ( = ?auto_872763 ?auto_872768 ) ) ( not ( = ?auto_872763 ?auto_872769 ) ) ( not ( = ?auto_872764 ?auto_872765 ) ) ( not ( = ?auto_872764 ?auto_872766 ) ) ( not ( = ?auto_872764 ?auto_872767 ) ) ( not ( = ?auto_872764 ?auto_872768 ) ) ( not ( = ?auto_872764 ?auto_872769 ) ) ( not ( = ?auto_872765 ?auto_872766 ) ) ( not ( = ?auto_872765 ?auto_872767 ) ) ( not ( = ?auto_872765 ?auto_872768 ) ) ( not ( = ?auto_872765 ?auto_872769 ) ) ( not ( = ?auto_872766 ?auto_872767 ) ) ( not ( = ?auto_872766 ?auto_872768 ) ) ( not ( = ?auto_872766 ?auto_872769 ) ) ( not ( = ?auto_872767 ?auto_872768 ) ) ( not ( = ?auto_872767 ?auto_872769 ) ) ( not ( = ?auto_872768 ?auto_872769 ) ) ( ON ?auto_872767 ?auto_872768 ) ( ON ?auto_872766 ?auto_872767 ) ( ON ?auto_872765 ?auto_872766 ) ( ON ?auto_872764 ?auto_872765 ) ( ON ?auto_872763 ?auto_872764 ) ( CLEAR ?auto_872761 ) ( ON ?auto_872762 ?auto_872763 ) ( CLEAR ?auto_872762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_872760 ?auto_872761 ?auto_872762 )
      ( MAKE-9PILE ?auto_872760 ?auto_872761 ?auto_872762 ?auto_872763 ?auto_872764 ?auto_872765 ?auto_872766 ?auto_872767 ?auto_872768 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_872798 - BLOCK
      ?auto_872799 - BLOCK
      ?auto_872800 - BLOCK
      ?auto_872801 - BLOCK
      ?auto_872802 - BLOCK
      ?auto_872803 - BLOCK
      ?auto_872804 - BLOCK
      ?auto_872805 - BLOCK
      ?auto_872806 - BLOCK
    )
    :vars
    (
      ?auto_872807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_872806 ?auto_872807 ) ( ON-TABLE ?auto_872798 ) ( not ( = ?auto_872798 ?auto_872799 ) ) ( not ( = ?auto_872798 ?auto_872800 ) ) ( not ( = ?auto_872798 ?auto_872801 ) ) ( not ( = ?auto_872798 ?auto_872802 ) ) ( not ( = ?auto_872798 ?auto_872803 ) ) ( not ( = ?auto_872798 ?auto_872804 ) ) ( not ( = ?auto_872798 ?auto_872805 ) ) ( not ( = ?auto_872798 ?auto_872806 ) ) ( not ( = ?auto_872798 ?auto_872807 ) ) ( not ( = ?auto_872799 ?auto_872800 ) ) ( not ( = ?auto_872799 ?auto_872801 ) ) ( not ( = ?auto_872799 ?auto_872802 ) ) ( not ( = ?auto_872799 ?auto_872803 ) ) ( not ( = ?auto_872799 ?auto_872804 ) ) ( not ( = ?auto_872799 ?auto_872805 ) ) ( not ( = ?auto_872799 ?auto_872806 ) ) ( not ( = ?auto_872799 ?auto_872807 ) ) ( not ( = ?auto_872800 ?auto_872801 ) ) ( not ( = ?auto_872800 ?auto_872802 ) ) ( not ( = ?auto_872800 ?auto_872803 ) ) ( not ( = ?auto_872800 ?auto_872804 ) ) ( not ( = ?auto_872800 ?auto_872805 ) ) ( not ( = ?auto_872800 ?auto_872806 ) ) ( not ( = ?auto_872800 ?auto_872807 ) ) ( not ( = ?auto_872801 ?auto_872802 ) ) ( not ( = ?auto_872801 ?auto_872803 ) ) ( not ( = ?auto_872801 ?auto_872804 ) ) ( not ( = ?auto_872801 ?auto_872805 ) ) ( not ( = ?auto_872801 ?auto_872806 ) ) ( not ( = ?auto_872801 ?auto_872807 ) ) ( not ( = ?auto_872802 ?auto_872803 ) ) ( not ( = ?auto_872802 ?auto_872804 ) ) ( not ( = ?auto_872802 ?auto_872805 ) ) ( not ( = ?auto_872802 ?auto_872806 ) ) ( not ( = ?auto_872802 ?auto_872807 ) ) ( not ( = ?auto_872803 ?auto_872804 ) ) ( not ( = ?auto_872803 ?auto_872805 ) ) ( not ( = ?auto_872803 ?auto_872806 ) ) ( not ( = ?auto_872803 ?auto_872807 ) ) ( not ( = ?auto_872804 ?auto_872805 ) ) ( not ( = ?auto_872804 ?auto_872806 ) ) ( not ( = ?auto_872804 ?auto_872807 ) ) ( not ( = ?auto_872805 ?auto_872806 ) ) ( not ( = ?auto_872805 ?auto_872807 ) ) ( not ( = ?auto_872806 ?auto_872807 ) ) ( ON ?auto_872805 ?auto_872806 ) ( ON ?auto_872804 ?auto_872805 ) ( ON ?auto_872803 ?auto_872804 ) ( ON ?auto_872802 ?auto_872803 ) ( ON ?auto_872801 ?auto_872802 ) ( ON ?auto_872800 ?auto_872801 ) ( CLEAR ?auto_872798 ) ( ON ?auto_872799 ?auto_872800 ) ( CLEAR ?auto_872799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_872798 ?auto_872799 )
      ( MAKE-9PILE ?auto_872798 ?auto_872799 ?auto_872800 ?auto_872801 ?auto_872802 ?auto_872803 ?auto_872804 ?auto_872805 ?auto_872806 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_872836 - BLOCK
      ?auto_872837 - BLOCK
      ?auto_872838 - BLOCK
      ?auto_872839 - BLOCK
      ?auto_872840 - BLOCK
      ?auto_872841 - BLOCK
      ?auto_872842 - BLOCK
      ?auto_872843 - BLOCK
      ?auto_872844 - BLOCK
    )
    :vars
    (
      ?auto_872845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_872844 ?auto_872845 ) ( not ( = ?auto_872836 ?auto_872837 ) ) ( not ( = ?auto_872836 ?auto_872838 ) ) ( not ( = ?auto_872836 ?auto_872839 ) ) ( not ( = ?auto_872836 ?auto_872840 ) ) ( not ( = ?auto_872836 ?auto_872841 ) ) ( not ( = ?auto_872836 ?auto_872842 ) ) ( not ( = ?auto_872836 ?auto_872843 ) ) ( not ( = ?auto_872836 ?auto_872844 ) ) ( not ( = ?auto_872836 ?auto_872845 ) ) ( not ( = ?auto_872837 ?auto_872838 ) ) ( not ( = ?auto_872837 ?auto_872839 ) ) ( not ( = ?auto_872837 ?auto_872840 ) ) ( not ( = ?auto_872837 ?auto_872841 ) ) ( not ( = ?auto_872837 ?auto_872842 ) ) ( not ( = ?auto_872837 ?auto_872843 ) ) ( not ( = ?auto_872837 ?auto_872844 ) ) ( not ( = ?auto_872837 ?auto_872845 ) ) ( not ( = ?auto_872838 ?auto_872839 ) ) ( not ( = ?auto_872838 ?auto_872840 ) ) ( not ( = ?auto_872838 ?auto_872841 ) ) ( not ( = ?auto_872838 ?auto_872842 ) ) ( not ( = ?auto_872838 ?auto_872843 ) ) ( not ( = ?auto_872838 ?auto_872844 ) ) ( not ( = ?auto_872838 ?auto_872845 ) ) ( not ( = ?auto_872839 ?auto_872840 ) ) ( not ( = ?auto_872839 ?auto_872841 ) ) ( not ( = ?auto_872839 ?auto_872842 ) ) ( not ( = ?auto_872839 ?auto_872843 ) ) ( not ( = ?auto_872839 ?auto_872844 ) ) ( not ( = ?auto_872839 ?auto_872845 ) ) ( not ( = ?auto_872840 ?auto_872841 ) ) ( not ( = ?auto_872840 ?auto_872842 ) ) ( not ( = ?auto_872840 ?auto_872843 ) ) ( not ( = ?auto_872840 ?auto_872844 ) ) ( not ( = ?auto_872840 ?auto_872845 ) ) ( not ( = ?auto_872841 ?auto_872842 ) ) ( not ( = ?auto_872841 ?auto_872843 ) ) ( not ( = ?auto_872841 ?auto_872844 ) ) ( not ( = ?auto_872841 ?auto_872845 ) ) ( not ( = ?auto_872842 ?auto_872843 ) ) ( not ( = ?auto_872842 ?auto_872844 ) ) ( not ( = ?auto_872842 ?auto_872845 ) ) ( not ( = ?auto_872843 ?auto_872844 ) ) ( not ( = ?auto_872843 ?auto_872845 ) ) ( not ( = ?auto_872844 ?auto_872845 ) ) ( ON ?auto_872843 ?auto_872844 ) ( ON ?auto_872842 ?auto_872843 ) ( ON ?auto_872841 ?auto_872842 ) ( ON ?auto_872840 ?auto_872841 ) ( ON ?auto_872839 ?auto_872840 ) ( ON ?auto_872838 ?auto_872839 ) ( ON ?auto_872837 ?auto_872838 ) ( ON ?auto_872836 ?auto_872837 ) ( CLEAR ?auto_872836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_872836 )
      ( MAKE-9PILE ?auto_872836 ?auto_872837 ?auto_872838 ?auto_872839 ?auto_872840 ?auto_872841 ?auto_872842 ?auto_872843 ?auto_872844 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_872875 - BLOCK
      ?auto_872876 - BLOCK
      ?auto_872877 - BLOCK
      ?auto_872878 - BLOCK
      ?auto_872879 - BLOCK
      ?auto_872880 - BLOCK
      ?auto_872881 - BLOCK
      ?auto_872882 - BLOCK
      ?auto_872883 - BLOCK
      ?auto_872884 - BLOCK
    )
    :vars
    (
      ?auto_872885 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_872883 ) ( ON ?auto_872884 ?auto_872885 ) ( CLEAR ?auto_872884 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_872875 ) ( ON ?auto_872876 ?auto_872875 ) ( ON ?auto_872877 ?auto_872876 ) ( ON ?auto_872878 ?auto_872877 ) ( ON ?auto_872879 ?auto_872878 ) ( ON ?auto_872880 ?auto_872879 ) ( ON ?auto_872881 ?auto_872880 ) ( ON ?auto_872882 ?auto_872881 ) ( ON ?auto_872883 ?auto_872882 ) ( not ( = ?auto_872875 ?auto_872876 ) ) ( not ( = ?auto_872875 ?auto_872877 ) ) ( not ( = ?auto_872875 ?auto_872878 ) ) ( not ( = ?auto_872875 ?auto_872879 ) ) ( not ( = ?auto_872875 ?auto_872880 ) ) ( not ( = ?auto_872875 ?auto_872881 ) ) ( not ( = ?auto_872875 ?auto_872882 ) ) ( not ( = ?auto_872875 ?auto_872883 ) ) ( not ( = ?auto_872875 ?auto_872884 ) ) ( not ( = ?auto_872875 ?auto_872885 ) ) ( not ( = ?auto_872876 ?auto_872877 ) ) ( not ( = ?auto_872876 ?auto_872878 ) ) ( not ( = ?auto_872876 ?auto_872879 ) ) ( not ( = ?auto_872876 ?auto_872880 ) ) ( not ( = ?auto_872876 ?auto_872881 ) ) ( not ( = ?auto_872876 ?auto_872882 ) ) ( not ( = ?auto_872876 ?auto_872883 ) ) ( not ( = ?auto_872876 ?auto_872884 ) ) ( not ( = ?auto_872876 ?auto_872885 ) ) ( not ( = ?auto_872877 ?auto_872878 ) ) ( not ( = ?auto_872877 ?auto_872879 ) ) ( not ( = ?auto_872877 ?auto_872880 ) ) ( not ( = ?auto_872877 ?auto_872881 ) ) ( not ( = ?auto_872877 ?auto_872882 ) ) ( not ( = ?auto_872877 ?auto_872883 ) ) ( not ( = ?auto_872877 ?auto_872884 ) ) ( not ( = ?auto_872877 ?auto_872885 ) ) ( not ( = ?auto_872878 ?auto_872879 ) ) ( not ( = ?auto_872878 ?auto_872880 ) ) ( not ( = ?auto_872878 ?auto_872881 ) ) ( not ( = ?auto_872878 ?auto_872882 ) ) ( not ( = ?auto_872878 ?auto_872883 ) ) ( not ( = ?auto_872878 ?auto_872884 ) ) ( not ( = ?auto_872878 ?auto_872885 ) ) ( not ( = ?auto_872879 ?auto_872880 ) ) ( not ( = ?auto_872879 ?auto_872881 ) ) ( not ( = ?auto_872879 ?auto_872882 ) ) ( not ( = ?auto_872879 ?auto_872883 ) ) ( not ( = ?auto_872879 ?auto_872884 ) ) ( not ( = ?auto_872879 ?auto_872885 ) ) ( not ( = ?auto_872880 ?auto_872881 ) ) ( not ( = ?auto_872880 ?auto_872882 ) ) ( not ( = ?auto_872880 ?auto_872883 ) ) ( not ( = ?auto_872880 ?auto_872884 ) ) ( not ( = ?auto_872880 ?auto_872885 ) ) ( not ( = ?auto_872881 ?auto_872882 ) ) ( not ( = ?auto_872881 ?auto_872883 ) ) ( not ( = ?auto_872881 ?auto_872884 ) ) ( not ( = ?auto_872881 ?auto_872885 ) ) ( not ( = ?auto_872882 ?auto_872883 ) ) ( not ( = ?auto_872882 ?auto_872884 ) ) ( not ( = ?auto_872882 ?auto_872885 ) ) ( not ( = ?auto_872883 ?auto_872884 ) ) ( not ( = ?auto_872883 ?auto_872885 ) ) ( not ( = ?auto_872884 ?auto_872885 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_872884 ?auto_872885 )
      ( !STACK ?auto_872884 ?auto_872883 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_872917 - BLOCK
      ?auto_872918 - BLOCK
      ?auto_872919 - BLOCK
      ?auto_872920 - BLOCK
      ?auto_872921 - BLOCK
      ?auto_872922 - BLOCK
      ?auto_872923 - BLOCK
      ?auto_872924 - BLOCK
      ?auto_872925 - BLOCK
      ?auto_872926 - BLOCK
    )
    :vars
    (
      ?auto_872927 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_872926 ?auto_872927 ) ( ON-TABLE ?auto_872917 ) ( ON ?auto_872918 ?auto_872917 ) ( ON ?auto_872919 ?auto_872918 ) ( ON ?auto_872920 ?auto_872919 ) ( ON ?auto_872921 ?auto_872920 ) ( ON ?auto_872922 ?auto_872921 ) ( ON ?auto_872923 ?auto_872922 ) ( ON ?auto_872924 ?auto_872923 ) ( not ( = ?auto_872917 ?auto_872918 ) ) ( not ( = ?auto_872917 ?auto_872919 ) ) ( not ( = ?auto_872917 ?auto_872920 ) ) ( not ( = ?auto_872917 ?auto_872921 ) ) ( not ( = ?auto_872917 ?auto_872922 ) ) ( not ( = ?auto_872917 ?auto_872923 ) ) ( not ( = ?auto_872917 ?auto_872924 ) ) ( not ( = ?auto_872917 ?auto_872925 ) ) ( not ( = ?auto_872917 ?auto_872926 ) ) ( not ( = ?auto_872917 ?auto_872927 ) ) ( not ( = ?auto_872918 ?auto_872919 ) ) ( not ( = ?auto_872918 ?auto_872920 ) ) ( not ( = ?auto_872918 ?auto_872921 ) ) ( not ( = ?auto_872918 ?auto_872922 ) ) ( not ( = ?auto_872918 ?auto_872923 ) ) ( not ( = ?auto_872918 ?auto_872924 ) ) ( not ( = ?auto_872918 ?auto_872925 ) ) ( not ( = ?auto_872918 ?auto_872926 ) ) ( not ( = ?auto_872918 ?auto_872927 ) ) ( not ( = ?auto_872919 ?auto_872920 ) ) ( not ( = ?auto_872919 ?auto_872921 ) ) ( not ( = ?auto_872919 ?auto_872922 ) ) ( not ( = ?auto_872919 ?auto_872923 ) ) ( not ( = ?auto_872919 ?auto_872924 ) ) ( not ( = ?auto_872919 ?auto_872925 ) ) ( not ( = ?auto_872919 ?auto_872926 ) ) ( not ( = ?auto_872919 ?auto_872927 ) ) ( not ( = ?auto_872920 ?auto_872921 ) ) ( not ( = ?auto_872920 ?auto_872922 ) ) ( not ( = ?auto_872920 ?auto_872923 ) ) ( not ( = ?auto_872920 ?auto_872924 ) ) ( not ( = ?auto_872920 ?auto_872925 ) ) ( not ( = ?auto_872920 ?auto_872926 ) ) ( not ( = ?auto_872920 ?auto_872927 ) ) ( not ( = ?auto_872921 ?auto_872922 ) ) ( not ( = ?auto_872921 ?auto_872923 ) ) ( not ( = ?auto_872921 ?auto_872924 ) ) ( not ( = ?auto_872921 ?auto_872925 ) ) ( not ( = ?auto_872921 ?auto_872926 ) ) ( not ( = ?auto_872921 ?auto_872927 ) ) ( not ( = ?auto_872922 ?auto_872923 ) ) ( not ( = ?auto_872922 ?auto_872924 ) ) ( not ( = ?auto_872922 ?auto_872925 ) ) ( not ( = ?auto_872922 ?auto_872926 ) ) ( not ( = ?auto_872922 ?auto_872927 ) ) ( not ( = ?auto_872923 ?auto_872924 ) ) ( not ( = ?auto_872923 ?auto_872925 ) ) ( not ( = ?auto_872923 ?auto_872926 ) ) ( not ( = ?auto_872923 ?auto_872927 ) ) ( not ( = ?auto_872924 ?auto_872925 ) ) ( not ( = ?auto_872924 ?auto_872926 ) ) ( not ( = ?auto_872924 ?auto_872927 ) ) ( not ( = ?auto_872925 ?auto_872926 ) ) ( not ( = ?auto_872925 ?auto_872927 ) ) ( not ( = ?auto_872926 ?auto_872927 ) ) ( CLEAR ?auto_872924 ) ( ON ?auto_872925 ?auto_872926 ) ( CLEAR ?auto_872925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_872917 ?auto_872918 ?auto_872919 ?auto_872920 ?auto_872921 ?auto_872922 ?auto_872923 ?auto_872924 ?auto_872925 )
      ( MAKE-10PILE ?auto_872917 ?auto_872918 ?auto_872919 ?auto_872920 ?auto_872921 ?auto_872922 ?auto_872923 ?auto_872924 ?auto_872925 ?auto_872926 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_872959 - BLOCK
      ?auto_872960 - BLOCK
      ?auto_872961 - BLOCK
      ?auto_872962 - BLOCK
      ?auto_872963 - BLOCK
      ?auto_872964 - BLOCK
      ?auto_872965 - BLOCK
      ?auto_872966 - BLOCK
      ?auto_872967 - BLOCK
      ?auto_872968 - BLOCK
    )
    :vars
    (
      ?auto_872969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_872968 ?auto_872969 ) ( ON-TABLE ?auto_872959 ) ( ON ?auto_872960 ?auto_872959 ) ( ON ?auto_872961 ?auto_872960 ) ( ON ?auto_872962 ?auto_872961 ) ( ON ?auto_872963 ?auto_872962 ) ( ON ?auto_872964 ?auto_872963 ) ( ON ?auto_872965 ?auto_872964 ) ( not ( = ?auto_872959 ?auto_872960 ) ) ( not ( = ?auto_872959 ?auto_872961 ) ) ( not ( = ?auto_872959 ?auto_872962 ) ) ( not ( = ?auto_872959 ?auto_872963 ) ) ( not ( = ?auto_872959 ?auto_872964 ) ) ( not ( = ?auto_872959 ?auto_872965 ) ) ( not ( = ?auto_872959 ?auto_872966 ) ) ( not ( = ?auto_872959 ?auto_872967 ) ) ( not ( = ?auto_872959 ?auto_872968 ) ) ( not ( = ?auto_872959 ?auto_872969 ) ) ( not ( = ?auto_872960 ?auto_872961 ) ) ( not ( = ?auto_872960 ?auto_872962 ) ) ( not ( = ?auto_872960 ?auto_872963 ) ) ( not ( = ?auto_872960 ?auto_872964 ) ) ( not ( = ?auto_872960 ?auto_872965 ) ) ( not ( = ?auto_872960 ?auto_872966 ) ) ( not ( = ?auto_872960 ?auto_872967 ) ) ( not ( = ?auto_872960 ?auto_872968 ) ) ( not ( = ?auto_872960 ?auto_872969 ) ) ( not ( = ?auto_872961 ?auto_872962 ) ) ( not ( = ?auto_872961 ?auto_872963 ) ) ( not ( = ?auto_872961 ?auto_872964 ) ) ( not ( = ?auto_872961 ?auto_872965 ) ) ( not ( = ?auto_872961 ?auto_872966 ) ) ( not ( = ?auto_872961 ?auto_872967 ) ) ( not ( = ?auto_872961 ?auto_872968 ) ) ( not ( = ?auto_872961 ?auto_872969 ) ) ( not ( = ?auto_872962 ?auto_872963 ) ) ( not ( = ?auto_872962 ?auto_872964 ) ) ( not ( = ?auto_872962 ?auto_872965 ) ) ( not ( = ?auto_872962 ?auto_872966 ) ) ( not ( = ?auto_872962 ?auto_872967 ) ) ( not ( = ?auto_872962 ?auto_872968 ) ) ( not ( = ?auto_872962 ?auto_872969 ) ) ( not ( = ?auto_872963 ?auto_872964 ) ) ( not ( = ?auto_872963 ?auto_872965 ) ) ( not ( = ?auto_872963 ?auto_872966 ) ) ( not ( = ?auto_872963 ?auto_872967 ) ) ( not ( = ?auto_872963 ?auto_872968 ) ) ( not ( = ?auto_872963 ?auto_872969 ) ) ( not ( = ?auto_872964 ?auto_872965 ) ) ( not ( = ?auto_872964 ?auto_872966 ) ) ( not ( = ?auto_872964 ?auto_872967 ) ) ( not ( = ?auto_872964 ?auto_872968 ) ) ( not ( = ?auto_872964 ?auto_872969 ) ) ( not ( = ?auto_872965 ?auto_872966 ) ) ( not ( = ?auto_872965 ?auto_872967 ) ) ( not ( = ?auto_872965 ?auto_872968 ) ) ( not ( = ?auto_872965 ?auto_872969 ) ) ( not ( = ?auto_872966 ?auto_872967 ) ) ( not ( = ?auto_872966 ?auto_872968 ) ) ( not ( = ?auto_872966 ?auto_872969 ) ) ( not ( = ?auto_872967 ?auto_872968 ) ) ( not ( = ?auto_872967 ?auto_872969 ) ) ( not ( = ?auto_872968 ?auto_872969 ) ) ( ON ?auto_872967 ?auto_872968 ) ( CLEAR ?auto_872965 ) ( ON ?auto_872966 ?auto_872967 ) ( CLEAR ?auto_872966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_872959 ?auto_872960 ?auto_872961 ?auto_872962 ?auto_872963 ?auto_872964 ?auto_872965 ?auto_872966 )
      ( MAKE-10PILE ?auto_872959 ?auto_872960 ?auto_872961 ?auto_872962 ?auto_872963 ?auto_872964 ?auto_872965 ?auto_872966 ?auto_872967 ?auto_872968 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_873001 - BLOCK
      ?auto_873002 - BLOCK
      ?auto_873003 - BLOCK
      ?auto_873004 - BLOCK
      ?auto_873005 - BLOCK
      ?auto_873006 - BLOCK
      ?auto_873007 - BLOCK
      ?auto_873008 - BLOCK
      ?auto_873009 - BLOCK
      ?auto_873010 - BLOCK
    )
    :vars
    (
      ?auto_873011 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_873010 ?auto_873011 ) ( ON-TABLE ?auto_873001 ) ( ON ?auto_873002 ?auto_873001 ) ( ON ?auto_873003 ?auto_873002 ) ( ON ?auto_873004 ?auto_873003 ) ( ON ?auto_873005 ?auto_873004 ) ( ON ?auto_873006 ?auto_873005 ) ( not ( = ?auto_873001 ?auto_873002 ) ) ( not ( = ?auto_873001 ?auto_873003 ) ) ( not ( = ?auto_873001 ?auto_873004 ) ) ( not ( = ?auto_873001 ?auto_873005 ) ) ( not ( = ?auto_873001 ?auto_873006 ) ) ( not ( = ?auto_873001 ?auto_873007 ) ) ( not ( = ?auto_873001 ?auto_873008 ) ) ( not ( = ?auto_873001 ?auto_873009 ) ) ( not ( = ?auto_873001 ?auto_873010 ) ) ( not ( = ?auto_873001 ?auto_873011 ) ) ( not ( = ?auto_873002 ?auto_873003 ) ) ( not ( = ?auto_873002 ?auto_873004 ) ) ( not ( = ?auto_873002 ?auto_873005 ) ) ( not ( = ?auto_873002 ?auto_873006 ) ) ( not ( = ?auto_873002 ?auto_873007 ) ) ( not ( = ?auto_873002 ?auto_873008 ) ) ( not ( = ?auto_873002 ?auto_873009 ) ) ( not ( = ?auto_873002 ?auto_873010 ) ) ( not ( = ?auto_873002 ?auto_873011 ) ) ( not ( = ?auto_873003 ?auto_873004 ) ) ( not ( = ?auto_873003 ?auto_873005 ) ) ( not ( = ?auto_873003 ?auto_873006 ) ) ( not ( = ?auto_873003 ?auto_873007 ) ) ( not ( = ?auto_873003 ?auto_873008 ) ) ( not ( = ?auto_873003 ?auto_873009 ) ) ( not ( = ?auto_873003 ?auto_873010 ) ) ( not ( = ?auto_873003 ?auto_873011 ) ) ( not ( = ?auto_873004 ?auto_873005 ) ) ( not ( = ?auto_873004 ?auto_873006 ) ) ( not ( = ?auto_873004 ?auto_873007 ) ) ( not ( = ?auto_873004 ?auto_873008 ) ) ( not ( = ?auto_873004 ?auto_873009 ) ) ( not ( = ?auto_873004 ?auto_873010 ) ) ( not ( = ?auto_873004 ?auto_873011 ) ) ( not ( = ?auto_873005 ?auto_873006 ) ) ( not ( = ?auto_873005 ?auto_873007 ) ) ( not ( = ?auto_873005 ?auto_873008 ) ) ( not ( = ?auto_873005 ?auto_873009 ) ) ( not ( = ?auto_873005 ?auto_873010 ) ) ( not ( = ?auto_873005 ?auto_873011 ) ) ( not ( = ?auto_873006 ?auto_873007 ) ) ( not ( = ?auto_873006 ?auto_873008 ) ) ( not ( = ?auto_873006 ?auto_873009 ) ) ( not ( = ?auto_873006 ?auto_873010 ) ) ( not ( = ?auto_873006 ?auto_873011 ) ) ( not ( = ?auto_873007 ?auto_873008 ) ) ( not ( = ?auto_873007 ?auto_873009 ) ) ( not ( = ?auto_873007 ?auto_873010 ) ) ( not ( = ?auto_873007 ?auto_873011 ) ) ( not ( = ?auto_873008 ?auto_873009 ) ) ( not ( = ?auto_873008 ?auto_873010 ) ) ( not ( = ?auto_873008 ?auto_873011 ) ) ( not ( = ?auto_873009 ?auto_873010 ) ) ( not ( = ?auto_873009 ?auto_873011 ) ) ( not ( = ?auto_873010 ?auto_873011 ) ) ( ON ?auto_873009 ?auto_873010 ) ( ON ?auto_873008 ?auto_873009 ) ( CLEAR ?auto_873006 ) ( ON ?auto_873007 ?auto_873008 ) ( CLEAR ?auto_873007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_873001 ?auto_873002 ?auto_873003 ?auto_873004 ?auto_873005 ?auto_873006 ?auto_873007 )
      ( MAKE-10PILE ?auto_873001 ?auto_873002 ?auto_873003 ?auto_873004 ?auto_873005 ?auto_873006 ?auto_873007 ?auto_873008 ?auto_873009 ?auto_873010 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_873043 - BLOCK
      ?auto_873044 - BLOCK
      ?auto_873045 - BLOCK
      ?auto_873046 - BLOCK
      ?auto_873047 - BLOCK
      ?auto_873048 - BLOCK
      ?auto_873049 - BLOCK
      ?auto_873050 - BLOCK
      ?auto_873051 - BLOCK
      ?auto_873052 - BLOCK
    )
    :vars
    (
      ?auto_873053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_873052 ?auto_873053 ) ( ON-TABLE ?auto_873043 ) ( ON ?auto_873044 ?auto_873043 ) ( ON ?auto_873045 ?auto_873044 ) ( ON ?auto_873046 ?auto_873045 ) ( ON ?auto_873047 ?auto_873046 ) ( not ( = ?auto_873043 ?auto_873044 ) ) ( not ( = ?auto_873043 ?auto_873045 ) ) ( not ( = ?auto_873043 ?auto_873046 ) ) ( not ( = ?auto_873043 ?auto_873047 ) ) ( not ( = ?auto_873043 ?auto_873048 ) ) ( not ( = ?auto_873043 ?auto_873049 ) ) ( not ( = ?auto_873043 ?auto_873050 ) ) ( not ( = ?auto_873043 ?auto_873051 ) ) ( not ( = ?auto_873043 ?auto_873052 ) ) ( not ( = ?auto_873043 ?auto_873053 ) ) ( not ( = ?auto_873044 ?auto_873045 ) ) ( not ( = ?auto_873044 ?auto_873046 ) ) ( not ( = ?auto_873044 ?auto_873047 ) ) ( not ( = ?auto_873044 ?auto_873048 ) ) ( not ( = ?auto_873044 ?auto_873049 ) ) ( not ( = ?auto_873044 ?auto_873050 ) ) ( not ( = ?auto_873044 ?auto_873051 ) ) ( not ( = ?auto_873044 ?auto_873052 ) ) ( not ( = ?auto_873044 ?auto_873053 ) ) ( not ( = ?auto_873045 ?auto_873046 ) ) ( not ( = ?auto_873045 ?auto_873047 ) ) ( not ( = ?auto_873045 ?auto_873048 ) ) ( not ( = ?auto_873045 ?auto_873049 ) ) ( not ( = ?auto_873045 ?auto_873050 ) ) ( not ( = ?auto_873045 ?auto_873051 ) ) ( not ( = ?auto_873045 ?auto_873052 ) ) ( not ( = ?auto_873045 ?auto_873053 ) ) ( not ( = ?auto_873046 ?auto_873047 ) ) ( not ( = ?auto_873046 ?auto_873048 ) ) ( not ( = ?auto_873046 ?auto_873049 ) ) ( not ( = ?auto_873046 ?auto_873050 ) ) ( not ( = ?auto_873046 ?auto_873051 ) ) ( not ( = ?auto_873046 ?auto_873052 ) ) ( not ( = ?auto_873046 ?auto_873053 ) ) ( not ( = ?auto_873047 ?auto_873048 ) ) ( not ( = ?auto_873047 ?auto_873049 ) ) ( not ( = ?auto_873047 ?auto_873050 ) ) ( not ( = ?auto_873047 ?auto_873051 ) ) ( not ( = ?auto_873047 ?auto_873052 ) ) ( not ( = ?auto_873047 ?auto_873053 ) ) ( not ( = ?auto_873048 ?auto_873049 ) ) ( not ( = ?auto_873048 ?auto_873050 ) ) ( not ( = ?auto_873048 ?auto_873051 ) ) ( not ( = ?auto_873048 ?auto_873052 ) ) ( not ( = ?auto_873048 ?auto_873053 ) ) ( not ( = ?auto_873049 ?auto_873050 ) ) ( not ( = ?auto_873049 ?auto_873051 ) ) ( not ( = ?auto_873049 ?auto_873052 ) ) ( not ( = ?auto_873049 ?auto_873053 ) ) ( not ( = ?auto_873050 ?auto_873051 ) ) ( not ( = ?auto_873050 ?auto_873052 ) ) ( not ( = ?auto_873050 ?auto_873053 ) ) ( not ( = ?auto_873051 ?auto_873052 ) ) ( not ( = ?auto_873051 ?auto_873053 ) ) ( not ( = ?auto_873052 ?auto_873053 ) ) ( ON ?auto_873051 ?auto_873052 ) ( ON ?auto_873050 ?auto_873051 ) ( ON ?auto_873049 ?auto_873050 ) ( CLEAR ?auto_873047 ) ( ON ?auto_873048 ?auto_873049 ) ( CLEAR ?auto_873048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_873043 ?auto_873044 ?auto_873045 ?auto_873046 ?auto_873047 ?auto_873048 )
      ( MAKE-10PILE ?auto_873043 ?auto_873044 ?auto_873045 ?auto_873046 ?auto_873047 ?auto_873048 ?auto_873049 ?auto_873050 ?auto_873051 ?auto_873052 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_873085 - BLOCK
      ?auto_873086 - BLOCK
      ?auto_873087 - BLOCK
      ?auto_873088 - BLOCK
      ?auto_873089 - BLOCK
      ?auto_873090 - BLOCK
      ?auto_873091 - BLOCK
      ?auto_873092 - BLOCK
      ?auto_873093 - BLOCK
      ?auto_873094 - BLOCK
    )
    :vars
    (
      ?auto_873095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_873094 ?auto_873095 ) ( ON-TABLE ?auto_873085 ) ( ON ?auto_873086 ?auto_873085 ) ( ON ?auto_873087 ?auto_873086 ) ( ON ?auto_873088 ?auto_873087 ) ( not ( = ?auto_873085 ?auto_873086 ) ) ( not ( = ?auto_873085 ?auto_873087 ) ) ( not ( = ?auto_873085 ?auto_873088 ) ) ( not ( = ?auto_873085 ?auto_873089 ) ) ( not ( = ?auto_873085 ?auto_873090 ) ) ( not ( = ?auto_873085 ?auto_873091 ) ) ( not ( = ?auto_873085 ?auto_873092 ) ) ( not ( = ?auto_873085 ?auto_873093 ) ) ( not ( = ?auto_873085 ?auto_873094 ) ) ( not ( = ?auto_873085 ?auto_873095 ) ) ( not ( = ?auto_873086 ?auto_873087 ) ) ( not ( = ?auto_873086 ?auto_873088 ) ) ( not ( = ?auto_873086 ?auto_873089 ) ) ( not ( = ?auto_873086 ?auto_873090 ) ) ( not ( = ?auto_873086 ?auto_873091 ) ) ( not ( = ?auto_873086 ?auto_873092 ) ) ( not ( = ?auto_873086 ?auto_873093 ) ) ( not ( = ?auto_873086 ?auto_873094 ) ) ( not ( = ?auto_873086 ?auto_873095 ) ) ( not ( = ?auto_873087 ?auto_873088 ) ) ( not ( = ?auto_873087 ?auto_873089 ) ) ( not ( = ?auto_873087 ?auto_873090 ) ) ( not ( = ?auto_873087 ?auto_873091 ) ) ( not ( = ?auto_873087 ?auto_873092 ) ) ( not ( = ?auto_873087 ?auto_873093 ) ) ( not ( = ?auto_873087 ?auto_873094 ) ) ( not ( = ?auto_873087 ?auto_873095 ) ) ( not ( = ?auto_873088 ?auto_873089 ) ) ( not ( = ?auto_873088 ?auto_873090 ) ) ( not ( = ?auto_873088 ?auto_873091 ) ) ( not ( = ?auto_873088 ?auto_873092 ) ) ( not ( = ?auto_873088 ?auto_873093 ) ) ( not ( = ?auto_873088 ?auto_873094 ) ) ( not ( = ?auto_873088 ?auto_873095 ) ) ( not ( = ?auto_873089 ?auto_873090 ) ) ( not ( = ?auto_873089 ?auto_873091 ) ) ( not ( = ?auto_873089 ?auto_873092 ) ) ( not ( = ?auto_873089 ?auto_873093 ) ) ( not ( = ?auto_873089 ?auto_873094 ) ) ( not ( = ?auto_873089 ?auto_873095 ) ) ( not ( = ?auto_873090 ?auto_873091 ) ) ( not ( = ?auto_873090 ?auto_873092 ) ) ( not ( = ?auto_873090 ?auto_873093 ) ) ( not ( = ?auto_873090 ?auto_873094 ) ) ( not ( = ?auto_873090 ?auto_873095 ) ) ( not ( = ?auto_873091 ?auto_873092 ) ) ( not ( = ?auto_873091 ?auto_873093 ) ) ( not ( = ?auto_873091 ?auto_873094 ) ) ( not ( = ?auto_873091 ?auto_873095 ) ) ( not ( = ?auto_873092 ?auto_873093 ) ) ( not ( = ?auto_873092 ?auto_873094 ) ) ( not ( = ?auto_873092 ?auto_873095 ) ) ( not ( = ?auto_873093 ?auto_873094 ) ) ( not ( = ?auto_873093 ?auto_873095 ) ) ( not ( = ?auto_873094 ?auto_873095 ) ) ( ON ?auto_873093 ?auto_873094 ) ( ON ?auto_873092 ?auto_873093 ) ( ON ?auto_873091 ?auto_873092 ) ( ON ?auto_873090 ?auto_873091 ) ( CLEAR ?auto_873088 ) ( ON ?auto_873089 ?auto_873090 ) ( CLEAR ?auto_873089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_873085 ?auto_873086 ?auto_873087 ?auto_873088 ?auto_873089 )
      ( MAKE-10PILE ?auto_873085 ?auto_873086 ?auto_873087 ?auto_873088 ?auto_873089 ?auto_873090 ?auto_873091 ?auto_873092 ?auto_873093 ?auto_873094 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_873127 - BLOCK
      ?auto_873128 - BLOCK
      ?auto_873129 - BLOCK
      ?auto_873130 - BLOCK
      ?auto_873131 - BLOCK
      ?auto_873132 - BLOCK
      ?auto_873133 - BLOCK
      ?auto_873134 - BLOCK
      ?auto_873135 - BLOCK
      ?auto_873136 - BLOCK
    )
    :vars
    (
      ?auto_873137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_873136 ?auto_873137 ) ( ON-TABLE ?auto_873127 ) ( ON ?auto_873128 ?auto_873127 ) ( ON ?auto_873129 ?auto_873128 ) ( not ( = ?auto_873127 ?auto_873128 ) ) ( not ( = ?auto_873127 ?auto_873129 ) ) ( not ( = ?auto_873127 ?auto_873130 ) ) ( not ( = ?auto_873127 ?auto_873131 ) ) ( not ( = ?auto_873127 ?auto_873132 ) ) ( not ( = ?auto_873127 ?auto_873133 ) ) ( not ( = ?auto_873127 ?auto_873134 ) ) ( not ( = ?auto_873127 ?auto_873135 ) ) ( not ( = ?auto_873127 ?auto_873136 ) ) ( not ( = ?auto_873127 ?auto_873137 ) ) ( not ( = ?auto_873128 ?auto_873129 ) ) ( not ( = ?auto_873128 ?auto_873130 ) ) ( not ( = ?auto_873128 ?auto_873131 ) ) ( not ( = ?auto_873128 ?auto_873132 ) ) ( not ( = ?auto_873128 ?auto_873133 ) ) ( not ( = ?auto_873128 ?auto_873134 ) ) ( not ( = ?auto_873128 ?auto_873135 ) ) ( not ( = ?auto_873128 ?auto_873136 ) ) ( not ( = ?auto_873128 ?auto_873137 ) ) ( not ( = ?auto_873129 ?auto_873130 ) ) ( not ( = ?auto_873129 ?auto_873131 ) ) ( not ( = ?auto_873129 ?auto_873132 ) ) ( not ( = ?auto_873129 ?auto_873133 ) ) ( not ( = ?auto_873129 ?auto_873134 ) ) ( not ( = ?auto_873129 ?auto_873135 ) ) ( not ( = ?auto_873129 ?auto_873136 ) ) ( not ( = ?auto_873129 ?auto_873137 ) ) ( not ( = ?auto_873130 ?auto_873131 ) ) ( not ( = ?auto_873130 ?auto_873132 ) ) ( not ( = ?auto_873130 ?auto_873133 ) ) ( not ( = ?auto_873130 ?auto_873134 ) ) ( not ( = ?auto_873130 ?auto_873135 ) ) ( not ( = ?auto_873130 ?auto_873136 ) ) ( not ( = ?auto_873130 ?auto_873137 ) ) ( not ( = ?auto_873131 ?auto_873132 ) ) ( not ( = ?auto_873131 ?auto_873133 ) ) ( not ( = ?auto_873131 ?auto_873134 ) ) ( not ( = ?auto_873131 ?auto_873135 ) ) ( not ( = ?auto_873131 ?auto_873136 ) ) ( not ( = ?auto_873131 ?auto_873137 ) ) ( not ( = ?auto_873132 ?auto_873133 ) ) ( not ( = ?auto_873132 ?auto_873134 ) ) ( not ( = ?auto_873132 ?auto_873135 ) ) ( not ( = ?auto_873132 ?auto_873136 ) ) ( not ( = ?auto_873132 ?auto_873137 ) ) ( not ( = ?auto_873133 ?auto_873134 ) ) ( not ( = ?auto_873133 ?auto_873135 ) ) ( not ( = ?auto_873133 ?auto_873136 ) ) ( not ( = ?auto_873133 ?auto_873137 ) ) ( not ( = ?auto_873134 ?auto_873135 ) ) ( not ( = ?auto_873134 ?auto_873136 ) ) ( not ( = ?auto_873134 ?auto_873137 ) ) ( not ( = ?auto_873135 ?auto_873136 ) ) ( not ( = ?auto_873135 ?auto_873137 ) ) ( not ( = ?auto_873136 ?auto_873137 ) ) ( ON ?auto_873135 ?auto_873136 ) ( ON ?auto_873134 ?auto_873135 ) ( ON ?auto_873133 ?auto_873134 ) ( ON ?auto_873132 ?auto_873133 ) ( ON ?auto_873131 ?auto_873132 ) ( CLEAR ?auto_873129 ) ( ON ?auto_873130 ?auto_873131 ) ( CLEAR ?auto_873130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_873127 ?auto_873128 ?auto_873129 ?auto_873130 )
      ( MAKE-10PILE ?auto_873127 ?auto_873128 ?auto_873129 ?auto_873130 ?auto_873131 ?auto_873132 ?auto_873133 ?auto_873134 ?auto_873135 ?auto_873136 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_873169 - BLOCK
      ?auto_873170 - BLOCK
      ?auto_873171 - BLOCK
      ?auto_873172 - BLOCK
      ?auto_873173 - BLOCK
      ?auto_873174 - BLOCK
      ?auto_873175 - BLOCK
      ?auto_873176 - BLOCK
      ?auto_873177 - BLOCK
      ?auto_873178 - BLOCK
    )
    :vars
    (
      ?auto_873179 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_873178 ?auto_873179 ) ( ON-TABLE ?auto_873169 ) ( ON ?auto_873170 ?auto_873169 ) ( not ( = ?auto_873169 ?auto_873170 ) ) ( not ( = ?auto_873169 ?auto_873171 ) ) ( not ( = ?auto_873169 ?auto_873172 ) ) ( not ( = ?auto_873169 ?auto_873173 ) ) ( not ( = ?auto_873169 ?auto_873174 ) ) ( not ( = ?auto_873169 ?auto_873175 ) ) ( not ( = ?auto_873169 ?auto_873176 ) ) ( not ( = ?auto_873169 ?auto_873177 ) ) ( not ( = ?auto_873169 ?auto_873178 ) ) ( not ( = ?auto_873169 ?auto_873179 ) ) ( not ( = ?auto_873170 ?auto_873171 ) ) ( not ( = ?auto_873170 ?auto_873172 ) ) ( not ( = ?auto_873170 ?auto_873173 ) ) ( not ( = ?auto_873170 ?auto_873174 ) ) ( not ( = ?auto_873170 ?auto_873175 ) ) ( not ( = ?auto_873170 ?auto_873176 ) ) ( not ( = ?auto_873170 ?auto_873177 ) ) ( not ( = ?auto_873170 ?auto_873178 ) ) ( not ( = ?auto_873170 ?auto_873179 ) ) ( not ( = ?auto_873171 ?auto_873172 ) ) ( not ( = ?auto_873171 ?auto_873173 ) ) ( not ( = ?auto_873171 ?auto_873174 ) ) ( not ( = ?auto_873171 ?auto_873175 ) ) ( not ( = ?auto_873171 ?auto_873176 ) ) ( not ( = ?auto_873171 ?auto_873177 ) ) ( not ( = ?auto_873171 ?auto_873178 ) ) ( not ( = ?auto_873171 ?auto_873179 ) ) ( not ( = ?auto_873172 ?auto_873173 ) ) ( not ( = ?auto_873172 ?auto_873174 ) ) ( not ( = ?auto_873172 ?auto_873175 ) ) ( not ( = ?auto_873172 ?auto_873176 ) ) ( not ( = ?auto_873172 ?auto_873177 ) ) ( not ( = ?auto_873172 ?auto_873178 ) ) ( not ( = ?auto_873172 ?auto_873179 ) ) ( not ( = ?auto_873173 ?auto_873174 ) ) ( not ( = ?auto_873173 ?auto_873175 ) ) ( not ( = ?auto_873173 ?auto_873176 ) ) ( not ( = ?auto_873173 ?auto_873177 ) ) ( not ( = ?auto_873173 ?auto_873178 ) ) ( not ( = ?auto_873173 ?auto_873179 ) ) ( not ( = ?auto_873174 ?auto_873175 ) ) ( not ( = ?auto_873174 ?auto_873176 ) ) ( not ( = ?auto_873174 ?auto_873177 ) ) ( not ( = ?auto_873174 ?auto_873178 ) ) ( not ( = ?auto_873174 ?auto_873179 ) ) ( not ( = ?auto_873175 ?auto_873176 ) ) ( not ( = ?auto_873175 ?auto_873177 ) ) ( not ( = ?auto_873175 ?auto_873178 ) ) ( not ( = ?auto_873175 ?auto_873179 ) ) ( not ( = ?auto_873176 ?auto_873177 ) ) ( not ( = ?auto_873176 ?auto_873178 ) ) ( not ( = ?auto_873176 ?auto_873179 ) ) ( not ( = ?auto_873177 ?auto_873178 ) ) ( not ( = ?auto_873177 ?auto_873179 ) ) ( not ( = ?auto_873178 ?auto_873179 ) ) ( ON ?auto_873177 ?auto_873178 ) ( ON ?auto_873176 ?auto_873177 ) ( ON ?auto_873175 ?auto_873176 ) ( ON ?auto_873174 ?auto_873175 ) ( ON ?auto_873173 ?auto_873174 ) ( ON ?auto_873172 ?auto_873173 ) ( CLEAR ?auto_873170 ) ( ON ?auto_873171 ?auto_873172 ) ( CLEAR ?auto_873171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_873169 ?auto_873170 ?auto_873171 )
      ( MAKE-10PILE ?auto_873169 ?auto_873170 ?auto_873171 ?auto_873172 ?auto_873173 ?auto_873174 ?auto_873175 ?auto_873176 ?auto_873177 ?auto_873178 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_873211 - BLOCK
      ?auto_873212 - BLOCK
      ?auto_873213 - BLOCK
      ?auto_873214 - BLOCK
      ?auto_873215 - BLOCK
      ?auto_873216 - BLOCK
      ?auto_873217 - BLOCK
      ?auto_873218 - BLOCK
      ?auto_873219 - BLOCK
      ?auto_873220 - BLOCK
    )
    :vars
    (
      ?auto_873221 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_873220 ?auto_873221 ) ( ON-TABLE ?auto_873211 ) ( not ( = ?auto_873211 ?auto_873212 ) ) ( not ( = ?auto_873211 ?auto_873213 ) ) ( not ( = ?auto_873211 ?auto_873214 ) ) ( not ( = ?auto_873211 ?auto_873215 ) ) ( not ( = ?auto_873211 ?auto_873216 ) ) ( not ( = ?auto_873211 ?auto_873217 ) ) ( not ( = ?auto_873211 ?auto_873218 ) ) ( not ( = ?auto_873211 ?auto_873219 ) ) ( not ( = ?auto_873211 ?auto_873220 ) ) ( not ( = ?auto_873211 ?auto_873221 ) ) ( not ( = ?auto_873212 ?auto_873213 ) ) ( not ( = ?auto_873212 ?auto_873214 ) ) ( not ( = ?auto_873212 ?auto_873215 ) ) ( not ( = ?auto_873212 ?auto_873216 ) ) ( not ( = ?auto_873212 ?auto_873217 ) ) ( not ( = ?auto_873212 ?auto_873218 ) ) ( not ( = ?auto_873212 ?auto_873219 ) ) ( not ( = ?auto_873212 ?auto_873220 ) ) ( not ( = ?auto_873212 ?auto_873221 ) ) ( not ( = ?auto_873213 ?auto_873214 ) ) ( not ( = ?auto_873213 ?auto_873215 ) ) ( not ( = ?auto_873213 ?auto_873216 ) ) ( not ( = ?auto_873213 ?auto_873217 ) ) ( not ( = ?auto_873213 ?auto_873218 ) ) ( not ( = ?auto_873213 ?auto_873219 ) ) ( not ( = ?auto_873213 ?auto_873220 ) ) ( not ( = ?auto_873213 ?auto_873221 ) ) ( not ( = ?auto_873214 ?auto_873215 ) ) ( not ( = ?auto_873214 ?auto_873216 ) ) ( not ( = ?auto_873214 ?auto_873217 ) ) ( not ( = ?auto_873214 ?auto_873218 ) ) ( not ( = ?auto_873214 ?auto_873219 ) ) ( not ( = ?auto_873214 ?auto_873220 ) ) ( not ( = ?auto_873214 ?auto_873221 ) ) ( not ( = ?auto_873215 ?auto_873216 ) ) ( not ( = ?auto_873215 ?auto_873217 ) ) ( not ( = ?auto_873215 ?auto_873218 ) ) ( not ( = ?auto_873215 ?auto_873219 ) ) ( not ( = ?auto_873215 ?auto_873220 ) ) ( not ( = ?auto_873215 ?auto_873221 ) ) ( not ( = ?auto_873216 ?auto_873217 ) ) ( not ( = ?auto_873216 ?auto_873218 ) ) ( not ( = ?auto_873216 ?auto_873219 ) ) ( not ( = ?auto_873216 ?auto_873220 ) ) ( not ( = ?auto_873216 ?auto_873221 ) ) ( not ( = ?auto_873217 ?auto_873218 ) ) ( not ( = ?auto_873217 ?auto_873219 ) ) ( not ( = ?auto_873217 ?auto_873220 ) ) ( not ( = ?auto_873217 ?auto_873221 ) ) ( not ( = ?auto_873218 ?auto_873219 ) ) ( not ( = ?auto_873218 ?auto_873220 ) ) ( not ( = ?auto_873218 ?auto_873221 ) ) ( not ( = ?auto_873219 ?auto_873220 ) ) ( not ( = ?auto_873219 ?auto_873221 ) ) ( not ( = ?auto_873220 ?auto_873221 ) ) ( ON ?auto_873219 ?auto_873220 ) ( ON ?auto_873218 ?auto_873219 ) ( ON ?auto_873217 ?auto_873218 ) ( ON ?auto_873216 ?auto_873217 ) ( ON ?auto_873215 ?auto_873216 ) ( ON ?auto_873214 ?auto_873215 ) ( ON ?auto_873213 ?auto_873214 ) ( CLEAR ?auto_873211 ) ( ON ?auto_873212 ?auto_873213 ) ( CLEAR ?auto_873212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_873211 ?auto_873212 )
      ( MAKE-10PILE ?auto_873211 ?auto_873212 ?auto_873213 ?auto_873214 ?auto_873215 ?auto_873216 ?auto_873217 ?auto_873218 ?auto_873219 ?auto_873220 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_873253 - BLOCK
      ?auto_873254 - BLOCK
      ?auto_873255 - BLOCK
      ?auto_873256 - BLOCK
      ?auto_873257 - BLOCK
      ?auto_873258 - BLOCK
      ?auto_873259 - BLOCK
      ?auto_873260 - BLOCK
      ?auto_873261 - BLOCK
      ?auto_873262 - BLOCK
    )
    :vars
    (
      ?auto_873263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_873262 ?auto_873263 ) ( not ( = ?auto_873253 ?auto_873254 ) ) ( not ( = ?auto_873253 ?auto_873255 ) ) ( not ( = ?auto_873253 ?auto_873256 ) ) ( not ( = ?auto_873253 ?auto_873257 ) ) ( not ( = ?auto_873253 ?auto_873258 ) ) ( not ( = ?auto_873253 ?auto_873259 ) ) ( not ( = ?auto_873253 ?auto_873260 ) ) ( not ( = ?auto_873253 ?auto_873261 ) ) ( not ( = ?auto_873253 ?auto_873262 ) ) ( not ( = ?auto_873253 ?auto_873263 ) ) ( not ( = ?auto_873254 ?auto_873255 ) ) ( not ( = ?auto_873254 ?auto_873256 ) ) ( not ( = ?auto_873254 ?auto_873257 ) ) ( not ( = ?auto_873254 ?auto_873258 ) ) ( not ( = ?auto_873254 ?auto_873259 ) ) ( not ( = ?auto_873254 ?auto_873260 ) ) ( not ( = ?auto_873254 ?auto_873261 ) ) ( not ( = ?auto_873254 ?auto_873262 ) ) ( not ( = ?auto_873254 ?auto_873263 ) ) ( not ( = ?auto_873255 ?auto_873256 ) ) ( not ( = ?auto_873255 ?auto_873257 ) ) ( not ( = ?auto_873255 ?auto_873258 ) ) ( not ( = ?auto_873255 ?auto_873259 ) ) ( not ( = ?auto_873255 ?auto_873260 ) ) ( not ( = ?auto_873255 ?auto_873261 ) ) ( not ( = ?auto_873255 ?auto_873262 ) ) ( not ( = ?auto_873255 ?auto_873263 ) ) ( not ( = ?auto_873256 ?auto_873257 ) ) ( not ( = ?auto_873256 ?auto_873258 ) ) ( not ( = ?auto_873256 ?auto_873259 ) ) ( not ( = ?auto_873256 ?auto_873260 ) ) ( not ( = ?auto_873256 ?auto_873261 ) ) ( not ( = ?auto_873256 ?auto_873262 ) ) ( not ( = ?auto_873256 ?auto_873263 ) ) ( not ( = ?auto_873257 ?auto_873258 ) ) ( not ( = ?auto_873257 ?auto_873259 ) ) ( not ( = ?auto_873257 ?auto_873260 ) ) ( not ( = ?auto_873257 ?auto_873261 ) ) ( not ( = ?auto_873257 ?auto_873262 ) ) ( not ( = ?auto_873257 ?auto_873263 ) ) ( not ( = ?auto_873258 ?auto_873259 ) ) ( not ( = ?auto_873258 ?auto_873260 ) ) ( not ( = ?auto_873258 ?auto_873261 ) ) ( not ( = ?auto_873258 ?auto_873262 ) ) ( not ( = ?auto_873258 ?auto_873263 ) ) ( not ( = ?auto_873259 ?auto_873260 ) ) ( not ( = ?auto_873259 ?auto_873261 ) ) ( not ( = ?auto_873259 ?auto_873262 ) ) ( not ( = ?auto_873259 ?auto_873263 ) ) ( not ( = ?auto_873260 ?auto_873261 ) ) ( not ( = ?auto_873260 ?auto_873262 ) ) ( not ( = ?auto_873260 ?auto_873263 ) ) ( not ( = ?auto_873261 ?auto_873262 ) ) ( not ( = ?auto_873261 ?auto_873263 ) ) ( not ( = ?auto_873262 ?auto_873263 ) ) ( ON ?auto_873261 ?auto_873262 ) ( ON ?auto_873260 ?auto_873261 ) ( ON ?auto_873259 ?auto_873260 ) ( ON ?auto_873258 ?auto_873259 ) ( ON ?auto_873257 ?auto_873258 ) ( ON ?auto_873256 ?auto_873257 ) ( ON ?auto_873255 ?auto_873256 ) ( ON ?auto_873254 ?auto_873255 ) ( ON ?auto_873253 ?auto_873254 ) ( CLEAR ?auto_873253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_873253 )
      ( MAKE-10PILE ?auto_873253 ?auto_873254 ?auto_873255 ?auto_873256 ?auto_873257 ?auto_873258 ?auto_873259 ?auto_873260 ?auto_873261 ?auto_873262 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_873296 - BLOCK
      ?auto_873297 - BLOCK
      ?auto_873298 - BLOCK
      ?auto_873299 - BLOCK
      ?auto_873300 - BLOCK
      ?auto_873301 - BLOCK
      ?auto_873302 - BLOCK
      ?auto_873303 - BLOCK
      ?auto_873304 - BLOCK
      ?auto_873305 - BLOCK
      ?auto_873306 - BLOCK
    )
    :vars
    (
      ?auto_873307 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_873305 ) ( ON ?auto_873306 ?auto_873307 ) ( CLEAR ?auto_873306 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_873296 ) ( ON ?auto_873297 ?auto_873296 ) ( ON ?auto_873298 ?auto_873297 ) ( ON ?auto_873299 ?auto_873298 ) ( ON ?auto_873300 ?auto_873299 ) ( ON ?auto_873301 ?auto_873300 ) ( ON ?auto_873302 ?auto_873301 ) ( ON ?auto_873303 ?auto_873302 ) ( ON ?auto_873304 ?auto_873303 ) ( ON ?auto_873305 ?auto_873304 ) ( not ( = ?auto_873296 ?auto_873297 ) ) ( not ( = ?auto_873296 ?auto_873298 ) ) ( not ( = ?auto_873296 ?auto_873299 ) ) ( not ( = ?auto_873296 ?auto_873300 ) ) ( not ( = ?auto_873296 ?auto_873301 ) ) ( not ( = ?auto_873296 ?auto_873302 ) ) ( not ( = ?auto_873296 ?auto_873303 ) ) ( not ( = ?auto_873296 ?auto_873304 ) ) ( not ( = ?auto_873296 ?auto_873305 ) ) ( not ( = ?auto_873296 ?auto_873306 ) ) ( not ( = ?auto_873296 ?auto_873307 ) ) ( not ( = ?auto_873297 ?auto_873298 ) ) ( not ( = ?auto_873297 ?auto_873299 ) ) ( not ( = ?auto_873297 ?auto_873300 ) ) ( not ( = ?auto_873297 ?auto_873301 ) ) ( not ( = ?auto_873297 ?auto_873302 ) ) ( not ( = ?auto_873297 ?auto_873303 ) ) ( not ( = ?auto_873297 ?auto_873304 ) ) ( not ( = ?auto_873297 ?auto_873305 ) ) ( not ( = ?auto_873297 ?auto_873306 ) ) ( not ( = ?auto_873297 ?auto_873307 ) ) ( not ( = ?auto_873298 ?auto_873299 ) ) ( not ( = ?auto_873298 ?auto_873300 ) ) ( not ( = ?auto_873298 ?auto_873301 ) ) ( not ( = ?auto_873298 ?auto_873302 ) ) ( not ( = ?auto_873298 ?auto_873303 ) ) ( not ( = ?auto_873298 ?auto_873304 ) ) ( not ( = ?auto_873298 ?auto_873305 ) ) ( not ( = ?auto_873298 ?auto_873306 ) ) ( not ( = ?auto_873298 ?auto_873307 ) ) ( not ( = ?auto_873299 ?auto_873300 ) ) ( not ( = ?auto_873299 ?auto_873301 ) ) ( not ( = ?auto_873299 ?auto_873302 ) ) ( not ( = ?auto_873299 ?auto_873303 ) ) ( not ( = ?auto_873299 ?auto_873304 ) ) ( not ( = ?auto_873299 ?auto_873305 ) ) ( not ( = ?auto_873299 ?auto_873306 ) ) ( not ( = ?auto_873299 ?auto_873307 ) ) ( not ( = ?auto_873300 ?auto_873301 ) ) ( not ( = ?auto_873300 ?auto_873302 ) ) ( not ( = ?auto_873300 ?auto_873303 ) ) ( not ( = ?auto_873300 ?auto_873304 ) ) ( not ( = ?auto_873300 ?auto_873305 ) ) ( not ( = ?auto_873300 ?auto_873306 ) ) ( not ( = ?auto_873300 ?auto_873307 ) ) ( not ( = ?auto_873301 ?auto_873302 ) ) ( not ( = ?auto_873301 ?auto_873303 ) ) ( not ( = ?auto_873301 ?auto_873304 ) ) ( not ( = ?auto_873301 ?auto_873305 ) ) ( not ( = ?auto_873301 ?auto_873306 ) ) ( not ( = ?auto_873301 ?auto_873307 ) ) ( not ( = ?auto_873302 ?auto_873303 ) ) ( not ( = ?auto_873302 ?auto_873304 ) ) ( not ( = ?auto_873302 ?auto_873305 ) ) ( not ( = ?auto_873302 ?auto_873306 ) ) ( not ( = ?auto_873302 ?auto_873307 ) ) ( not ( = ?auto_873303 ?auto_873304 ) ) ( not ( = ?auto_873303 ?auto_873305 ) ) ( not ( = ?auto_873303 ?auto_873306 ) ) ( not ( = ?auto_873303 ?auto_873307 ) ) ( not ( = ?auto_873304 ?auto_873305 ) ) ( not ( = ?auto_873304 ?auto_873306 ) ) ( not ( = ?auto_873304 ?auto_873307 ) ) ( not ( = ?auto_873305 ?auto_873306 ) ) ( not ( = ?auto_873305 ?auto_873307 ) ) ( not ( = ?auto_873306 ?auto_873307 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_873306 ?auto_873307 )
      ( !STACK ?auto_873306 ?auto_873305 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_873342 - BLOCK
      ?auto_873343 - BLOCK
      ?auto_873344 - BLOCK
      ?auto_873345 - BLOCK
      ?auto_873346 - BLOCK
      ?auto_873347 - BLOCK
      ?auto_873348 - BLOCK
      ?auto_873349 - BLOCK
      ?auto_873350 - BLOCK
      ?auto_873351 - BLOCK
      ?auto_873352 - BLOCK
    )
    :vars
    (
      ?auto_873353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_873352 ?auto_873353 ) ( ON-TABLE ?auto_873342 ) ( ON ?auto_873343 ?auto_873342 ) ( ON ?auto_873344 ?auto_873343 ) ( ON ?auto_873345 ?auto_873344 ) ( ON ?auto_873346 ?auto_873345 ) ( ON ?auto_873347 ?auto_873346 ) ( ON ?auto_873348 ?auto_873347 ) ( ON ?auto_873349 ?auto_873348 ) ( ON ?auto_873350 ?auto_873349 ) ( not ( = ?auto_873342 ?auto_873343 ) ) ( not ( = ?auto_873342 ?auto_873344 ) ) ( not ( = ?auto_873342 ?auto_873345 ) ) ( not ( = ?auto_873342 ?auto_873346 ) ) ( not ( = ?auto_873342 ?auto_873347 ) ) ( not ( = ?auto_873342 ?auto_873348 ) ) ( not ( = ?auto_873342 ?auto_873349 ) ) ( not ( = ?auto_873342 ?auto_873350 ) ) ( not ( = ?auto_873342 ?auto_873351 ) ) ( not ( = ?auto_873342 ?auto_873352 ) ) ( not ( = ?auto_873342 ?auto_873353 ) ) ( not ( = ?auto_873343 ?auto_873344 ) ) ( not ( = ?auto_873343 ?auto_873345 ) ) ( not ( = ?auto_873343 ?auto_873346 ) ) ( not ( = ?auto_873343 ?auto_873347 ) ) ( not ( = ?auto_873343 ?auto_873348 ) ) ( not ( = ?auto_873343 ?auto_873349 ) ) ( not ( = ?auto_873343 ?auto_873350 ) ) ( not ( = ?auto_873343 ?auto_873351 ) ) ( not ( = ?auto_873343 ?auto_873352 ) ) ( not ( = ?auto_873343 ?auto_873353 ) ) ( not ( = ?auto_873344 ?auto_873345 ) ) ( not ( = ?auto_873344 ?auto_873346 ) ) ( not ( = ?auto_873344 ?auto_873347 ) ) ( not ( = ?auto_873344 ?auto_873348 ) ) ( not ( = ?auto_873344 ?auto_873349 ) ) ( not ( = ?auto_873344 ?auto_873350 ) ) ( not ( = ?auto_873344 ?auto_873351 ) ) ( not ( = ?auto_873344 ?auto_873352 ) ) ( not ( = ?auto_873344 ?auto_873353 ) ) ( not ( = ?auto_873345 ?auto_873346 ) ) ( not ( = ?auto_873345 ?auto_873347 ) ) ( not ( = ?auto_873345 ?auto_873348 ) ) ( not ( = ?auto_873345 ?auto_873349 ) ) ( not ( = ?auto_873345 ?auto_873350 ) ) ( not ( = ?auto_873345 ?auto_873351 ) ) ( not ( = ?auto_873345 ?auto_873352 ) ) ( not ( = ?auto_873345 ?auto_873353 ) ) ( not ( = ?auto_873346 ?auto_873347 ) ) ( not ( = ?auto_873346 ?auto_873348 ) ) ( not ( = ?auto_873346 ?auto_873349 ) ) ( not ( = ?auto_873346 ?auto_873350 ) ) ( not ( = ?auto_873346 ?auto_873351 ) ) ( not ( = ?auto_873346 ?auto_873352 ) ) ( not ( = ?auto_873346 ?auto_873353 ) ) ( not ( = ?auto_873347 ?auto_873348 ) ) ( not ( = ?auto_873347 ?auto_873349 ) ) ( not ( = ?auto_873347 ?auto_873350 ) ) ( not ( = ?auto_873347 ?auto_873351 ) ) ( not ( = ?auto_873347 ?auto_873352 ) ) ( not ( = ?auto_873347 ?auto_873353 ) ) ( not ( = ?auto_873348 ?auto_873349 ) ) ( not ( = ?auto_873348 ?auto_873350 ) ) ( not ( = ?auto_873348 ?auto_873351 ) ) ( not ( = ?auto_873348 ?auto_873352 ) ) ( not ( = ?auto_873348 ?auto_873353 ) ) ( not ( = ?auto_873349 ?auto_873350 ) ) ( not ( = ?auto_873349 ?auto_873351 ) ) ( not ( = ?auto_873349 ?auto_873352 ) ) ( not ( = ?auto_873349 ?auto_873353 ) ) ( not ( = ?auto_873350 ?auto_873351 ) ) ( not ( = ?auto_873350 ?auto_873352 ) ) ( not ( = ?auto_873350 ?auto_873353 ) ) ( not ( = ?auto_873351 ?auto_873352 ) ) ( not ( = ?auto_873351 ?auto_873353 ) ) ( not ( = ?auto_873352 ?auto_873353 ) ) ( CLEAR ?auto_873350 ) ( ON ?auto_873351 ?auto_873352 ) ( CLEAR ?auto_873351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_873342 ?auto_873343 ?auto_873344 ?auto_873345 ?auto_873346 ?auto_873347 ?auto_873348 ?auto_873349 ?auto_873350 ?auto_873351 )
      ( MAKE-11PILE ?auto_873342 ?auto_873343 ?auto_873344 ?auto_873345 ?auto_873346 ?auto_873347 ?auto_873348 ?auto_873349 ?auto_873350 ?auto_873351 ?auto_873352 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_873388 - BLOCK
      ?auto_873389 - BLOCK
      ?auto_873390 - BLOCK
      ?auto_873391 - BLOCK
      ?auto_873392 - BLOCK
      ?auto_873393 - BLOCK
      ?auto_873394 - BLOCK
      ?auto_873395 - BLOCK
      ?auto_873396 - BLOCK
      ?auto_873397 - BLOCK
      ?auto_873398 - BLOCK
    )
    :vars
    (
      ?auto_873399 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_873398 ?auto_873399 ) ( ON-TABLE ?auto_873388 ) ( ON ?auto_873389 ?auto_873388 ) ( ON ?auto_873390 ?auto_873389 ) ( ON ?auto_873391 ?auto_873390 ) ( ON ?auto_873392 ?auto_873391 ) ( ON ?auto_873393 ?auto_873392 ) ( ON ?auto_873394 ?auto_873393 ) ( ON ?auto_873395 ?auto_873394 ) ( not ( = ?auto_873388 ?auto_873389 ) ) ( not ( = ?auto_873388 ?auto_873390 ) ) ( not ( = ?auto_873388 ?auto_873391 ) ) ( not ( = ?auto_873388 ?auto_873392 ) ) ( not ( = ?auto_873388 ?auto_873393 ) ) ( not ( = ?auto_873388 ?auto_873394 ) ) ( not ( = ?auto_873388 ?auto_873395 ) ) ( not ( = ?auto_873388 ?auto_873396 ) ) ( not ( = ?auto_873388 ?auto_873397 ) ) ( not ( = ?auto_873388 ?auto_873398 ) ) ( not ( = ?auto_873388 ?auto_873399 ) ) ( not ( = ?auto_873389 ?auto_873390 ) ) ( not ( = ?auto_873389 ?auto_873391 ) ) ( not ( = ?auto_873389 ?auto_873392 ) ) ( not ( = ?auto_873389 ?auto_873393 ) ) ( not ( = ?auto_873389 ?auto_873394 ) ) ( not ( = ?auto_873389 ?auto_873395 ) ) ( not ( = ?auto_873389 ?auto_873396 ) ) ( not ( = ?auto_873389 ?auto_873397 ) ) ( not ( = ?auto_873389 ?auto_873398 ) ) ( not ( = ?auto_873389 ?auto_873399 ) ) ( not ( = ?auto_873390 ?auto_873391 ) ) ( not ( = ?auto_873390 ?auto_873392 ) ) ( not ( = ?auto_873390 ?auto_873393 ) ) ( not ( = ?auto_873390 ?auto_873394 ) ) ( not ( = ?auto_873390 ?auto_873395 ) ) ( not ( = ?auto_873390 ?auto_873396 ) ) ( not ( = ?auto_873390 ?auto_873397 ) ) ( not ( = ?auto_873390 ?auto_873398 ) ) ( not ( = ?auto_873390 ?auto_873399 ) ) ( not ( = ?auto_873391 ?auto_873392 ) ) ( not ( = ?auto_873391 ?auto_873393 ) ) ( not ( = ?auto_873391 ?auto_873394 ) ) ( not ( = ?auto_873391 ?auto_873395 ) ) ( not ( = ?auto_873391 ?auto_873396 ) ) ( not ( = ?auto_873391 ?auto_873397 ) ) ( not ( = ?auto_873391 ?auto_873398 ) ) ( not ( = ?auto_873391 ?auto_873399 ) ) ( not ( = ?auto_873392 ?auto_873393 ) ) ( not ( = ?auto_873392 ?auto_873394 ) ) ( not ( = ?auto_873392 ?auto_873395 ) ) ( not ( = ?auto_873392 ?auto_873396 ) ) ( not ( = ?auto_873392 ?auto_873397 ) ) ( not ( = ?auto_873392 ?auto_873398 ) ) ( not ( = ?auto_873392 ?auto_873399 ) ) ( not ( = ?auto_873393 ?auto_873394 ) ) ( not ( = ?auto_873393 ?auto_873395 ) ) ( not ( = ?auto_873393 ?auto_873396 ) ) ( not ( = ?auto_873393 ?auto_873397 ) ) ( not ( = ?auto_873393 ?auto_873398 ) ) ( not ( = ?auto_873393 ?auto_873399 ) ) ( not ( = ?auto_873394 ?auto_873395 ) ) ( not ( = ?auto_873394 ?auto_873396 ) ) ( not ( = ?auto_873394 ?auto_873397 ) ) ( not ( = ?auto_873394 ?auto_873398 ) ) ( not ( = ?auto_873394 ?auto_873399 ) ) ( not ( = ?auto_873395 ?auto_873396 ) ) ( not ( = ?auto_873395 ?auto_873397 ) ) ( not ( = ?auto_873395 ?auto_873398 ) ) ( not ( = ?auto_873395 ?auto_873399 ) ) ( not ( = ?auto_873396 ?auto_873397 ) ) ( not ( = ?auto_873396 ?auto_873398 ) ) ( not ( = ?auto_873396 ?auto_873399 ) ) ( not ( = ?auto_873397 ?auto_873398 ) ) ( not ( = ?auto_873397 ?auto_873399 ) ) ( not ( = ?auto_873398 ?auto_873399 ) ) ( ON ?auto_873397 ?auto_873398 ) ( CLEAR ?auto_873395 ) ( ON ?auto_873396 ?auto_873397 ) ( CLEAR ?auto_873396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_873388 ?auto_873389 ?auto_873390 ?auto_873391 ?auto_873392 ?auto_873393 ?auto_873394 ?auto_873395 ?auto_873396 )
      ( MAKE-11PILE ?auto_873388 ?auto_873389 ?auto_873390 ?auto_873391 ?auto_873392 ?auto_873393 ?auto_873394 ?auto_873395 ?auto_873396 ?auto_873397 ?auto_873398 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_873434 - BLOCK
      ?auto_873435 - BLOCK
      ?auto_873436 - BLOCK
      ?auto_873437 - BLOCK
      ?auto_873438 - BLOCK
      ?auto_873439 - BLOCK
      ?auto_873440 - BLOCK
      ?auto_873441 - BLOCK
      ?auto_873442 - BLOCK
      ?auto_873443 - BLOCK
      ?auto_873444 - BLOCK
    )
    :vars
    (
      ?auto_873445 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_873444 ?auto_873445 ) ( ON-TABLE ?auto_873434 ) ( ON ?auto_873435 ?auto_873434 ) ( ON ?auto_873436 ?auto_873435 ) ( ON ?auto_873437 ?auto_873436 ) ( ON ?auto_873438 ?auto_873437 ) ( ON ?auto_873439 ?auto_873438 ) ( ON ?auto_873440 ?auto_873439 ) ( not ( = ?auto_873434 ?auto_873435 ) ) ( not ( = ?auto_873434 ?auto_873436 ) ) ( not ( = ?auto_873434 ?auto_873437 ) ) ( not ( = ?auto_873434 ?auto_873438 ) ) ( not ( = ?auto_873434 ?auto_873439 ) ) ( not ( = ?auto_873434 ?auto_873440 ) ) ( not ( = ?auto_873434 ?auto_873441 ) ) ( not ( = ?auto_873434 ?auto_873442 ) ) ( not ( = ?auto_873434 ?auto_873443 ) ) ( not ( = ?auto_873434 ?auto_873444 ) ) ( not ( = ?auto_873434 ?auto_873445 ) ) ( not ( = ?auto_873435 ?auto_873436 ) ) ( not ( = ?auto_873435 ?auto_873437 ) ) ( not ( = ?auto_873435 ?auto_873438 ) ) ( not ( = ?auto_873435 ?auto_873439 ) ) ( not ( = ?auto_873435 ?auto_873440 ) ) ( not ( = ?auto_873435 ?auto_873441 ) ) ( not ( = ?auto_873435 ?auto_873442 ) ) ( not ( = ?auto_873435 ?auto_873443 ) ) ( not ( = ?auto_873435 ?auto_873444 ) ) ( not ( = ?auto_873435 ?auto_873445 ) ) ( not ( = ?auto_873436 ?auto_873437 ) ) ( not ( = ?auto_873436 ?auto_873438 ) ) ( not ( = ?auto_873436 ?auto_873439 ) ) ( not ( = ?auto_873436 ?auto_873440 ) ) ( not ( = ?auto_873436 ?auto_873441 ) ) ( not ( = ?auto_873436 ?auto_873442 ) ) ( not ( = ?auto_873436 ?auto_873443 ) ) ( not ( = ?auto_873436 ?auto_873444 ) ) ( not ( = ?auto_873436 ?auto_873445 ) ) ( not ( = ?auto_873437 ?auto_873438 ) ) ( not ( = ?auto_873437 ?auto_873439 ) ) ( not ( = ?auto_873437 ?auto_873440 ) ) ( not ( = ?auto_873437 ?auto_873441 ) ) ( not ( = ?auto_873437 ?auto_873442 ) ) ( not ( = ?auto_873437 ?auto_873443 ) ) ( not ( = ?auto_873437 ?auto_873444 ) ) ( not ( = ?auto_873437 ?auto_873445 ) ) ( not ( = ?auto_873438 ?auto_873439 ) ) ( not ( = ?auto_873438 ?auto_873440 ) ) ( not ( = ?auto_873438 ?auto_873441 ) ) ( not ( = ?auto_873438 ?auto_873442 ) ) ( not ( = ?auto_873438 ?auto_873443 ) ) ( not ( = ?auto_873438 ?auto_873444 ) ) ( not ( = ?auto_873438 ?auto_873445 ) ) ( not ( = ?auto_873439 ?auto_873440 ) ) ( not ( = ?auto_873439 ?auto_873441 ) ) ( not ( = ?auto_873439 ?auto_873442 ) ) ( not ( = ?auto_873439 ?auto_873443 ) ) ( not ( = ?auto_873439 ?auto_873444 ) ) ( not ( = ?auto_873439 ?auto_873445 ) ) ( not ( = ?auto_873440 ?auto_873441 ) ) ( not ( = ?auto_873440 ?auto_873442 ) ) ( not ( = ?auto_873440 ?auto_873443 ) ) ( not ( = ?auto_873440 ?auto_873444 ) ) ( not ( = ?auto_873440 ?auto_873445 ) ) ( not ( = ?auto_873441 ?auto_873442 ) ) ( not ( = ?auto_873441 ?auto_873443 ) ) ( not ( = ?auto_873441 ?auto_873444 ) ) ( not ( = ?auto_873441 ?auto_873445 ) ) ( not ( = ?auto_873442 ?auto_873443 ) ) ( not ( = ?auto_873442 ?auto_873444 ) ) ( not ( = ?auto_873442 ?auto_873445 ) ) ( not ( = ?auto_873443 ?auto_873444 ) ) ( not ( = ?auto_873443 ?auto_873445 ) ) ( not ( = ?auto_873444 ?auto_873445 ) ) ( ON ?auto_873443 ?auto_873444 ) ( ON ?auto_873442 ?auto_873443 ) ( CLEAR ?auto_873440 ) ( ON ?auto_873441 ?auto_873442 ) ( CLEAR ?auto_873441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_873434 ?auto_873435 ?auto_873436 ?auto_873437 ?auto_873438 ?auto_873439 ?auto_873440 ?auto_873441 )
      ( MAKE-11PILE ?auto_873434 ?auto_873435 ?auto_873436 ?auto_873437 ?auto_873438 ?auto_873439 ?auto_873440 ?auto_873441 ?auto_873442 ?auto_873443 ?auto_873444 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_873480 - BLOCK
      ?auto_873481 - BLOCK
      ?auto_873482 - BLOCK
      ?auto_873483 - BLOCK
      ?auto_873484 - BLOCK
      ?auto_873485 - BLOCK
      ?auto_873486 - BLOCK
      ?auto_873487 - BLOCK
      ?auto_873488 - BLOCK
      ?auto_873489 - BLOCK
      ?auto_873490 - BLOCK
    )
    :vars
    (
      ?auto_873491 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_873490 ?auto_873491 ) ( ON-TABLE ?auto_873480 ) ( ON ?auto_873481 ?auto_873480 ) ( ON ?auto_873482 ?auto_873481 ) ( ON ?auto_873483 ?auto_873482 ) ( ON ?auto_873484 ?auto_873483 ) ( ON ?auto_873485 ?auto_873484 ) ( not ( = ?auto_873480 ?auto_873481 ) ) ( not ( = ?auto_873480 ?auto_873482 ) ) ( not ( = ?auto_873480 ?auto_873483 ) ) ( not ( = ?auto_873480 ?auto_873484 ) ) ( not ( = ?auto_873480 ?auto_873485 ) ) ( not ( = ?auto_873480 ?auto_873486 ) ) ( not ( = ?auto_873480 ?auto_873487 ) ) ( not ( = ?auto_873480 ?auto_873488 ) ) ( not ( = ?auto_873480 ?auto_873489 ) ) ( not ( = ?auto_873480 ?auto_873490 ) ) ( not ( = ?auto_873480 ?auto_873491 ) ) ( not ( = ?auto_873481 ?auto_873482 ) ) ( not ( = ?auto_873481 ?auto_873483 ) ) ( not ( = ?auto_873481 ?auto_873484 ) ) ( not ( = ?auto_873481 ?auto_873485 ) ) ( not ( = ?auto_873481 ?auto_873486 ) ) ( not ( = ?auto_873481 ?auto_873487 ) ) ( not ( = ?auto_873481 ?auto_873488 ) ) ( not ( = ?auto_873481 ?auto_873489 ) ) ( not ( = ?auto_873481 ?auto_873490 ) ) ( not ( = ?auto_873481 ?auto_873491 ) ) ( not ( = ?auto_873482 ?auto_873483 ) ) ( not ( = ?auto_873482 ?auto_873484 ) ) ( not ( = ?auto_873482 ?auto_873485 ) ) ( not ( = ?auto_873482 ?auto_873486 ) ) ( not ( = ?auto_873482 ?auto_873487 ) ) ( not ( = ?auto_873482 ?auto_873488 ) ) ( not ( = ?auto_873482 ?auto_873489 ) ) ( not ( = ?auto_873482 ?auto_873490 ) ) ( not ( = ?auto_873482 ?auto_873491 ) ) ( not ( = ?auto_873483 ?auto_873484 ) ) ( not ( = ?auto_873483 ?auto_873485 ) ) ( not ( = ?auto_873483 ?auto_873486 ) ) ( not ( = ?auto_873483 ?auto_873487 ) ) ( not ( = ?auto_873483 ?auto_873488 ) ) ( not ( = ?auto_873483 ?auto_873489 ) ) ( not ( = ?auto_873483 ?auto_873490 ) ) ( not ( = ?auto_873483 ?auto_873491 ) ) ( not ( = ?auto_873484 ?auto_873485 ) ) ( not ( = ?auto_873484 ?auto_873486 ) ) ( not ( = ?auto_873484 ?auto_873487 ) ) ( not ( = ?auto_873484 ?auto_873488 ) ) ( not ( = ?auto_873484 ?auto_873489 ) ) ( not ( = ?auto_873484 ?auto_873490 ) ) ( not ( = ?auto_873484 ?auto_873491 ) ) ( not ( = ?auto_873485 ?auto_873486 ) ) ( not ( = ?auto_873485 ?auto_873487 ) ) ( not ( = ?auto_873485 ?auto_873488 ) ) ( not ( = ?auto_873485 ?auto_873489 ) ) ( not ( = ?auto_873485 ?auto_873490 ) ) ( not ( = ?auto_873485 ?auto_873491 ) ) ( not ( = ?auto_873486 ?auto_873487 ) ) ( not ( = ?auto_873486 ?auto_873488 ) ) ( not ( = ?auto_873486 ?auto_873489 ) ) ( not ( = ?auto_873486 ?auto_873490 ) ) ( not ( = ?auto_873486 ?auto_873491 ) ) ( not ( = ?auto_873487 ?auto_873488 ) ) ( not ( = ?auto_873487 ?auto_873489 ) ) ( not ( = ?auto_873487 ?auto_873490 ) ) ( not ( = ?auto_873487 ?auto_873491 ) ) ( not ( = ?auto_873488 ?auto_873489 ) ) ( not ( = ?auto_873488 ?auto_873490 ) ) ( not ( = ?auto_873488 ?auto_873491 ) ) ( not ( = ?auto_873489 ?auto_873490 ) ) ( not ( = ?auto_873489 ?auto_873491 ) ) ( not ( = ?auto_873490 ?auto_873491 ) ) ( ON ?auto_873489 ?auto_873490 ) ( ON ?auto_873488 ?auto_873489 ) ( ON ?auto_873487 ?auto_873488 ) ( CLEAR ?auto_873485 ) ( ON ?auto_873486 ?auto_873487 ) ( CLEAR ?auto_873486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_873480 ?auto_873481 ?auto_873482 ?auto_873483 ?auto_873484 ?auto_873485 ?auto_873486 )
      ( MAKE-11PILE ?auto_873480 ?auto_873481 ?auto_873482 ?auto_873483 ?auto_873484 ?auto_873485 ?auto_873486 ?auto_873487 ?auto_873488 ?auto_873489 ?auto_873490 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_873526 - BLOCK
      ?auto_873527 - BLOCK
      ?auto_873528 - BLOCK
      ?auto_873529 - BLOCK
      ?auto_873530 - BLOCK
      ?auto_873531 - BLOCK
      ?auto_873532 - BLOCK
      ?auto_873533 - BLOCK
      ?auto_873534 - BLOCK
      ?auto_873535 - BLOCK
      ?auto_873536 - BLOCK
    )
    :vars
    (
      ?auto_873537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_873536 ?auto_873537 ) ( ON-TABLE ?auto_873526 ) ( ON ?auto_873527 ?auto_873526 ) ( ON ?auto_873528 ?auto_873527 ) ( ON ?auto_873529 ?auto_873528 ) ( ON ?auto_873530 ?auto_873529 ) ( not ( = ?auto_873526 ?auto_873527 ) ) ( not ( = ?auto_873526 ?auto_873528 ) ) ( not ( = ?auto_873526 ?auto_873529 ) ) ( not ( = ?auto_873526 ?auto_873530 ) ) ( not ( = ?auto_873526 ?auto_873531 ) ) ( not ( = ?auto_873526 ?auto_873532 ) ) ( not ( = ?auto_873526 ?auto_873533 ) ) ( not ( = ?auto_873526 ?auto_873534 ) ) ( not ( = ?auto_873526 ?auto_873535 ) ) ( not ( = ?auto_873526 ?auto_873536 ) ) ( not ( = ?auto_873526 ?auto_873537 ) ) ( not ( = ?auto_873527 ?auto_873528 ) ) ( not ( = ?auto_873527 ?auto_873529 ) ) ( not ( = ?auto_873527 ?auto_873530 ) ) ( not ( = ?auto_873527 ?auto_873531 ) ) ( not ( = ?auto_873527 ?auto_873532 ) ) ( not ( = ?auto_873527 ?auto_873533 ) ) ( not ( = ?auto_873527 ?auto_873534 ) ) ( not ( = ?auto_873527 ?auto_873535 ) ) ( not ( = ?auto_873527 ?auto_873536 ) ) ( not ( = ?auto_873527 ?auto_873537 ) ) ( not ( = ?auto_873528 ?auto_873529 ) ) ( not ( = ?auto_873528 ?auto_873530 ) ) ( not ( = ?auto_873528 ?auto_873531 ) ) ( not ( = ?auto_873528 ?auto_873532 ) ) ( not ( = ?auto_873528 ?auto_873533 ) ) ( not ( = ?auto_873528 ?auto_873534 ) ) ( not ( = ?auto_873528 ?auto_873535 ) ) ( not ( = ?auto_873528 ?auto_873536 ) ) ( not ( = ?auto_873528 ?auto_873537 ) ) ( not ( = ?auto_873529 ?auto_873530 ) ) ( not ( = ?auto_873529 ?auto_873531 ) ) ( not ( = ?auto_873529 ?auto_873532 ) ) ( not ( = ?auto_873529 ?auto_873533 ) ) ( not ( = ?auto_873529 ?auto_873534 ) ) ( not ( = ?auto_873529 ?auto_873535 ) ) ( not ( = ?auto_873529 ?auto_873536 ) ) ( not ( = ?auto_873529 ?auto_873537 ) ) ( not ( = ?auto_873530 ?auto_873531 ) ) ( not ( = ?auto_873530 ?auto_873532 ) ) ( not ( = ?auto_873530 ?auto_873533 ) ) ( not ( = ?auto_873530 ?auto_873534 ) ) ( not ( = ?auto_873530 ?auto_873535 ) ) ( not ( = ?auto_873530 ?auto_873536 ) ) ( not ( = ?auto_873530 ?auto_873537 ) ) ( not ( = ?auto_873531 ?auto_873532 ) ) ( not ( = ?auto_873531 ?auto_873533 ) ) ( not ( = ?auto_873531 ?auto_873534 ) ) ( not ( = ?auto_873531 ?auto_873535 ) ) ( not ( = ?auto_873531 ?auto_873536 ) ) ( not ( = ?auto_873531 ?auto_873537 ) ) ( not ( = ?auto_873532 ?auto_873533 ) ) ( not ( = ?auto_873532 ?auto_873534 ) ) ( not ( = ?auto_873532 ?auto_873535 ) ) ( not ( = ?auto_873532 ?auto_873536 ) ) ( not ( = ?auto_873532 ?auto_873537 ) ) ( not ( = ?auto_873533 ?auto_873534 ) ) ( not ( = ?auto_873533 ?auto_873535 ) ) ( not ( = ?auto_873533 ?auto_873536 ) ) ( not ( = ?auto_873533 ?auto_873537 ) ) ( not ( = ?auto_873534 ?auto_873535 ) ) ( not ( = ?auto_873534 ?auto_873536 ) ) ( not ( = ?auto_873534 ?auto_873537 ) ) ( not ( = ?auto_873535 ?auto_873536 ) ) ( not ( = ?auto_873535 ?auto_873537 ) ) ( not ( = ?auto_873536 ?auto_873537 ) ) ( ON ?auto_873535 ?auto_873536 ) ( ON ?auto_873534 ?auto_873535 ) ( ON ?auto_873533 ?auto_873534 ) ( ON ?auto_873532 ?auto_873533 ) ( CLEAR ?auto_873530 ) ( ON ?auto_873531 ?auto_873532 ) ( CLEAR ?auto_873531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_873526 ?auto_873527 ?auto_873528 ?auto_873529 ?auto_873530 ?auto_873531 )
      ( MAKE-11PILE ?auto_873526 ?auto_873527 ?auto_873528 ?auto_873529 ?auto_873530 ?auto_873531 ?auto_873532 ?auto_873533 ?auto_873534 ?auto_873535 ?auto_873536 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_873572 - BLOCK
      ?auto_873573 - BLOCK
      ?auto_873574 - BLOCK
      ?auto_873575 - BLOCK
      ?auto_873576 - BLOCK
      ?auto_873577 - BLOCK
      ?auto_873578 - BLOCK
      ?auto_873579 - BLOCK
      ?auto_873580 - BLOCK
      ?auto_873581 - BLOCK
      ?auto_873582 - BLOCK
    )
    :vars
    (
      ?auto_873583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_873582 ?auto_873583 ) ( ON-TABLE ?auto_873572 ) ( ON ?auto_873573 ?auto_873572 ) ( ON ?auto_873574 ?auto_873573 ) ( ON ?auto_873575 ?auto_873574 ) ( not ( = ?auto_873572 ?auto_873573 ) ) ( not ( = ?auto_873572 ?auto_873574 ) ) ( not ( = ?auto_873572 ?auto_873575 ) ) ( not ( = ?auto_873572 ?auto_873576 ) ) ( not ( = ?auto_873572 ?auto_873577 ) ) ( not ( = ?auto_873572 ?auto_873578 ) ) ( not ( = ?auto_873572 ?auto_873579 ) ) ( not ( = ?auto_873572 ?auto_873580 ) ) ( not ( = ?auto_873572 ?auto_873581 ) ) ( not ( = ?auto_873572 ?auto_873582 ) ) ( not ( = ?auto_873572 ?auto_873583 ) ) ( not ( = ?auto_873573 ?auto_873574 ) ) ( not ( = ?auto_873573 ?auto_873575 ) ) ( not ( = ?auto_873573 ?auto_873576 ) ) ( not ( = ?auto_873573 ?auto_873577 ) ) ( not ( = ?auto_873573 ?auto_873578 ) ) ( not ( = ?auto_873573 ?auto_873579 ) ) ( not ( = ?auto_873573 ?auto_873580 ) ) ( not ( = ?auto_873573 ?auto_873581 ) ) ( not ( = ?auto_873573 ?auto_873582 ) ) ( not ( = ?auto_873573 ?auto_873583 ) ) ( not ( = ?auto_873574 ?auto_873575 ) ) ( not ( = ?auto_873574 ?auto_873576 ) ) ( not ( = ?auto_873574 ?auto_873577 ) ) ( not ( = ?auto_873574 ?auto_873578 ) ) ( not ( = ?auto_873574 ?auto_873579 ) ) ( not ( = ?auto_873574 ?auto_873580 ) ) ( not ( = ?auto_873574 ?auto_873581 ) ) ( not ( = ?auto_873574 ?auto_873582 ) ) ( not ( = ?auto_873574 ?auto_873583 ) ) ( not ( = ?auto_873575 ?auto_873576 ) ) ( not ( = ?auto_873575 ?auto_873577 ) ) ( not ( = ?auto_873575 ?auto_873578 ) ) ( not ( = ?auto_873575 ?auto_873579 ) ) ( not ( = ?auto_873575 ?auto_873580 ) ) ( not ( = ?auto_873575 ?auto_873581 ) ) ( not ( = ?auto_873575 ?auto_873582 ) ) ( not ( = ?auto_873575 ?auto_873583 ) ) ( not ( = ?auto_873576 ?auto_873577 ) ) ( not ( = ?auto_873576 ?auto_873578 ) ) ( not ( = ?auto_873576 ?auto_873579 ) ) ( not ( = ?auto_873576 ?auto_873580 ) ) ( not ( = ?auto_873576 ?auto_873581 ) ) ( not ( = ?auto_873576 ?auto_873582 ) ) ( not ( = ?auto_873576 ?auto_873583 ) ) ( not ( = ?auto_873577 ?auto_873578 ) ) ( not ( = ?auto_873577 ?auto_873579 ) ) ( not ( = ?auto_873577 ?auto_873580 ) ) ( not ( = ?auto_873577 ?auto_873581 ) ) ( not ( = ?auto_873577 ?auto_873582 ) ) ( not ( = ?auto_873577 ?auto_873583 ) ) ( not ( = ?auto_873578 ?auto_873579 ) ) ( not ( = ?auto_873578 ?auto_873580 ) ) ( not ( = ?auto_873578 ?auto_873581 ) ) ( not ( = ?auto_873578 ?auto_873582 ) ) ( not ( = ?auto_873578 ?auto_873583 ) ) ( not ( = ?auto_873579 ?auto_873580 ) ) ( not ( = ?auto_873579 ?auto_873581 ) ) ( not ( = ?auto_873579 ?auto_873582 ) ) ( not ( = ?auto_873579 ?auto_873583 ) ) ( not ( = ?auto_873580 ?auto_873581 ) ) ( not ( = ?auto_873580 ?auto_873582 ) ) ( not ( = ?auto_873580 ?auto_873583 ) ) ( not ( = ?auto_873581 ?auto_873582 ) ) ( not ( = ?auto_873581 ?auto_873583 ) ) ( not ( = ?auto_873582 ?auto_873583 ) ) ( ON ?auto_873581 ?auto_873582 ) ( ON ?auto_873580 ?auto_873581 ) ( ON ?auto_873579 ?auto_873580 ) ( ON ?auto_873578 ?auto_873579 ) ( ON ?auto_873577 ?auto_873578 ) ( CLEAR ?auto_873575 ) ( ON ?auto_873576 ?auto_873577 ) ( CLEAR ?auto_873576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_873572 ?auto_873573 ?auto_873574 ?auto_873575 ?auto_873576 )
      ( MAKE-11PILE ?auto_873572 ?auto_873573 ?auto_873574 ?auto_873575 ?auto_873576 ?auto_873577 ?auto_873578 ?auto_873579 ?auto_873580 ?auto_873581 ?auto_873582 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_873618 - BLOCK
      ?auto_873619 - BLOCK
      ?auto_873620 - BLOCK
      ?auto_873621 - BLOCK
      ?auto_873622 - BLOCK
      ?auto_873623 - BLOCK
      ?auto_873624 - BLOCK
      ?auto_873625 - BLOCK
      ?auto_873626 - BLOCK
      ?auto_873627 - BLOCK
      ?auto_873628 - BLOCK
    )
    :vars
    (
      ?auto_873629 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_873628 ?auto_873629 ) ( ON-TABLE ?auto_873618 ) ( ON ?auto_873619 ?auto_873618 ) ( ON ?auto_873620 ?auto_873619 ) ( not ( = ?auto_873618 ?auto_873619 ) ) ( not ( = ?auto_873618 ?auto_873620 ) ) ( not ( = ?auto_873618 ?auto_873621 ) ) ( not ( = ?auto_873618 ?auto_873622 ) ) ( not ( = ?auto_873618 ?auto_873623 ) ) ( not ( = ?auto_873618 ?auto_873624 ) ) ( not ( = ?auto_873618 ?auto_873625 ) ) ( not ( = ?auto_873618 ?auto_873626 ) ) ( not ( = ?auto_873618 ?auto_873627 ) ) ( not ( = ?auto_873618 ?auto_873628 ) ) ( not ( = ?auto_873618 ?auto_873629 ) ) ( not ( = ?auto_873619 ?auto_873620 ) ) ( not ( = ?auto_873619 ?auto_873621 ) ) ( not ( = ?auto_873619 ?auto_873622 ) ) ( not ( = ?auto_873619 ?auto_873623 ) ) ( not ( = ?auto_873619 ?auto_873624 ) ) ( not ( = ?auto_873619 ?auto_873625 ) ) ( not ( = ?auto_873619 ?auto_873626 ) ) ( not ( = ?auto_873619 ?auto_873627 ) ) ( not ( = ?auto_873619 ?auto_873628 ) ) ( not ( = ?auto_873619 ?auto_873629 ) ) ( not ( = ?auto_873620 ?auto_873621 ) ) ( not ( = ?auto_873620 ?auto_873622 ) ) ( not ( = ?auto_873620 ?auto_873623 ) ) ( not ( = ?auto_873620 ?auto_873624 ) ) ( not ( = ?auto_873620 ?auto_873625 ) ) ( not ( = ?auto_873620 ?auto_873626 ) ) ( not ( = ?auto_873620 ?auto_873627 ) ) ( not ( = ?auto_873620 ?auto_873628 ) ) ( not ( = ?auto_873620 ?auto_873629 ) ) ( not ( = ?auto_873621 ?auto_873622 ) ) ( not ( = ?auto_873621 ?auto_873623 ) ) ( not ( = ?auto_873621 ?auto_873624 ) ) ( not ( = ?auto_873621 ?auto_873625 ) ) ( not ( = ?auto_873621 ?auto_873626 ) ) ( not ( = ?auto_873621 ?auto_873627 ) ) ( not ( = ?auto_873621 ?auto_873628 ) ) ( not ( = ?auto_873621 ?auto_873629 ) ) ( not ( = ?auto_873622 ?auto_873623 ) ) ( not ( = ?auto_873622 ?auto_873624 ) ) ( not ( = ?auto_873622 ?auto_873625 ) ) ( not ( = ?auto_873622 ?auto_873626 ) ) ( not ( = ?auto_873622 ?auto_873627 ) ) ( not ( = ?auto_873622 ?auto_873628 ) ) ( not ( = ?auto_873622 ?auto_873629 ) ) ( not ( = ?auto_873623 ?auto_873624 ) ) ( not ( = ?auto_873623 ?auto_873625 ) ) ( not ( = ?auto_873623 ?auto_873626 ) ) ( not ( = ?auto_873623 ?auto_873627 ) ) ( not ( = ?auto_873623 ?auto_873628 ) ) ( not ( = ?auto_873623 ?auto_873629 ) ) ( not ( = ?auto_873624 ?auto_873625 ) ) ( not ( = ?auto_873624 ?auto_873626 ) ) ( not ( = ?auto_873624 ?auto_873627 ) ) ( not ( = ?auto_873624 ?auto_873628 ) ) ( not ( = ?auto_873624 ?auto_873629 ) ) ( not ( = ?auto_873625 ?auto_873626 ) ) ( not ( = ?auto_873625 ?auto_873627 ) ) ( not ( = ?auto_873625 ?auto_873628 ) ) ( not ( = ?auto_873625 ?auto_873629 ) ) ( not ( = ?auto_873626 ?auto_873627 ) ) ( not ( = ?auto_873626 ?auto_873628 ) ) ( not ( = ?auto_873626 ?auto_873629 ) ) ( not ( = ?auto_873627 ?auto_873628 ) ) ( not ( = ?auto_873627 ?auto_873629 ) ) ( not ( = ?auto_873628 ?auto_873629 ) ) ( ON ?auto_873627 ?auto_873628 ) ( ON ?auto_873626 ?auto_873627 ) ( ON ?auto_873625 ?auto_873626 ) ( ON ?auto_873624 ?auto_873625 ) ( ON ?auto_873623 ?auto_873624 ) ( ON ?auto_873622 ?auto_873623 ) ( CLEAR ?auto_873620 ) ( ON ?auto_873621 ?auto_873622 ) ( CLEAR ?auto_873621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_873618 ?auto_873619 ?auto_873620 ?auto_873621 )
      ( MAKE-11PILE ?auto_873618 ?auto_873619 ?auto_873620 ?auto_873621 ?auto_873622 ?auto_873623 ?auto_873624 ?auto_873625 ?auto_873626 ?auto_873627 ?auto_873628 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_873664 - BLOCK
      ?auto_873665 - BLOCK
      ?auto_873666 - BLOCK
      ?auto_873667 - BLOCK
      ?auto_873668 - BLOCK
      ?auto_873669 - BLOCK
      ?auto_873670 - BLOCK
      ?auto_873671 - BLOCK
      ?auto_873672 - BLOCK
      ?auto_873673 - BLOCK
      ?auto_873674 - BLOCK
    )
    :vars
    (
      ?auto_873675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_873674 ?auto_873675 ) ( ON-TABLE ?auto_873664 ) ( ON ?auto_873665 ?auto_873664 ) ( not ( = ?auto_873664 ?auto_873665 ) ) ( not ( = ?auto_873664 ?auto_873666 ) ) ( not ( = ?auto_873664 ?auto_873667 ) ) ( not ( = ?auto_873664 ?auto_873668 ) ) ( not ( = ?auto_873664 ?auto_873669 ) ) ( not ( = ?auto_873664 ?auto_873670 ) ) ( not ( = ?auto_873664 ?auto_873671 ) ) ( not ( = ?auto_873664 ?auto_873672 ) ) ( not ( = ?auto_873664 ?auto_873673 ) ) ( not ( = ?auto_873664 ?auto_873674 ) ) ( not ( = ?auto_873664 ?auto_873675 ) ) ( not ( = ?auto_873665 ?auto_873666 ) ) ( not ( = ?auto_873665 ?auto_873667 ) ) ( not ( = ?auto_873665 ?auto_873668 ) ) ( not ( = ?auto_873665 ?auto_873669 ) ) ( not ( = ?auto_873665 ?auto_873670 ) ) ( not ( = ?auto_873665 ?auto_873671 ) ) ( not ( = ?auto_873665 ?auto_873672 ) ) ( not ( = ?auto_873665 ?auto_873673 ) ) ( not ( = ?auto_873665 ?auto_873674 ) ) ( not ( = ?auto_873665 ?auto_873675 ) ) ( not ( = ?auto_873666 ?auto_873667 ) ) ( not ( = ?auto_873666 ?auto_873668 ) ) ( not ( = ?auto_873666 ?auto_873669 ) ) ( not ( = ?auto_873666 ?auto_873670 ) ) ( not ( = ?auto_873666 ?auto_873671 ) ) ( not ( = ?auto_873666 ?auto_873672 ) ) ( not ( = ?auto_873666 ?auto_873673 ) ) ( not ( = ?auto_873666 ?auto_873674 ) ) ( not ( = ?auto_873666 ?auto_873675 ) ) ( not ( = ?auto_873667 ?auto_873668 ) ) ( not ( = ?auto_873667 ?auto_873669 ) ) ( not ( = ?auto_873667 ?auto_873670 ) ) ( not ( = ?auto_873667 ?auto_873671 ) ) ( not ( = ?auto_873667 ?auto_873672 ) ) ( not ( = ?auto_873667 ?auto_873673 ) ) ( not ( = ?auto_873667 ?auto_873674 ) ) ( not ( = ?auto_873667 ?auto_873675 ) ) ( not ( = ?auto_873668 ?auto_873669 ) ) ( not ( = ?auto_873668 ?auto_873670 ) ) ( not ( = ?auto_873668 ?auto_873671 ) ) ( not ( = ?auto_873668 ?auto_873672 ) ) ( not ( = ?auto_873668 ?auto_873673 ) ) ( not ( = ?auto_873668 ?auto_873674 ) ) ( not ( = ?auto_873668 ?auto_873675 ) ) ( not ( = ?auto_873669 ?auto_873670 ) ) ( not ( = ?auto_873669 ?auto_873671 ) ) ( not ( = ?auto_873669 ?auto_873672 ) ) ( not ( = ?auto_873669 ?auto_873673 ) ) ( not ( = ?auto_873669 ?auto_873674 ) ) ( not ( = ?auto_873669 ?auto_873675 ) ) ( not ( = ?auto_873670 ?auto_873671 ) ) ( not ( = ?auto_873670 ?auto_873672 ) ) ( not ( = ?auto_873670 ?auto_873673 ) ) ( not ( = ?auto_873670 ?auto_873674 ) ) ( not ( = ?auto_873670 ?auto_873675 ) ) ( not ( = ?auto_873671 ?auto_873672 ) ) ( not ( = ?auto_873671 ?auto_873673 ) ) ( not ( = ?auto_873671 ?auto_873674 ) ) ( not ( = ?auto_873671 ?auto_873675 ) ) ( not ( = ?auto_873672 ?auto_873673 ) ) ( not ( = ?auto_873672 ?auto_873674 ) ) ( not ( = ?auto_873672 ?auto_873675 ) ) ( not ( = ?auto_873673 ?auto_873674 ) ) ( not ( = ?auto_873673 ?auto_873675 ) ) ( not ( = ?auto_873674 ?auto_873675 ) ) ( ON ?auto_873673 ?auto_873674 ) ( ON ?auto_873672 ?auto_873673 ) ( ON ?auto_873671 ?auto_873672 ) ( ON ?auto_873670 ?auto_873671 ) ( ON ?auto_873669 ?auto_873670 ) ( ON ?auto_873668 ?auto_873669 ) ( ON ?auto_873667 ?auto_873668 ) ( CLEAR ?auto_873665 ) ( ON ?auto_873666 ?auto_873667 ) ( CLEAR ?auto_873666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_873664 ?auto_873665 ?auto_873666 )
      ( MAKE-11PILE ?auto_873664 ?auto_873665 ?auto_873666 ?auto_873667 ?auto_873668 ?auto_873669 ?auto_873670 ?auto_873671 ?auto_873672 ?auto_873673 ?auto_873674 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_873710 - BLOCK
      ?auto_873711 - BLOCK
      ?auto_873712 - BLOCK
      ?auto_873713 - BLOCK
      ?auto_873714 - BLOCK
      ?auto_873715 - BLOCK
      ?auto_873716 - BLOCK
      ?auto_873717 - BLOCK
      ?auto_873718 - BLOCK
      ?auto_873719 - BLOCK
      ?auto_873720 - BLOCK
    )
    :vars
    (
      ?auto_873721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_873720 ?auto_873721 ) ( ON-TABLE ?auto_873710 ) ( not ( = ?auto_873710 ?auto_873711 ) ) ( not ( = ?auto_873710 ?auto_873712 ) ) ( not ( = ?auto_873710 ?auto_873713 ) ) ( not ( = ?auto_873710 ?auto_873714 ) ) ( not ( = ?auto_873710 ?auto_873715 ) ) ( not ( = ?auto_873710 ?auto_873716 ) ) ( not ( = ?auto_873710 ?auto_873717 ) ) ( not ( = ?auto_873710 ?auto_873718 ) ) ( not ( = ?auto_873710 ?auto_873719 ) ) ( not ( = ?auto_873710 ?auto_873720 ) ) ( not ( = ?auto_873710 ?auto_873721 ) ) ( not ( = ?auto_873711 ?auto_873712 ) ) ( not ( = ?auto_873711 ?auto_873713 ) ) ( not ( = ?auto_873711 ?auto_873714 ) ) ( not ( = ?auto_873711 ?auto_873715 ) ) ( not ( = ?auto_873711 ?auto_873716 ) ) ( not ( = ?auto_873711 ?auto_873717 ) ) ( not ( = ?auto_873711 ?auto_873718 ) ) ( not ( = ?auto_873711 ?auto_873719 ) ) ( not ( = ?auto_873711 ?auto_873720 ) ) ( not ( = ?auto_873711 ?auto_873721 ) ) ( not ( = ?auto_873712 ?auto_873713 ) ) ( not ( = ?auto_873712 ?auto_873714 ) ) ( not ( = ?auto_873712 ?auto_873715 ) ) ( not ( = ?auto_873712 ?auto_873716 ) ) ( not ( = ?auto_873712 ?auto_873717 ) ) ( not ( = ?auto_873712 ?auto_873718 ) ) ( not ( = ?auto_873712 ?auto_873719 ) ) ( not ( = ?auto_873712 ?auto_873720 ) ) ( not ( = ?auto_873712 ?auto_873721 ) ) ( not ( = ?auto_873713 ?auto_873714 ) ) ( not ( = ?auto_873713 ?auto_873715 ) ) ( not ( = ?auto_873713 ?auto_873716 ) ) ( not ( = ?auto_873713 ?auto_873717 ) ) ( not ( = ?auto_873713 ?auto_873718 ) ) ( not ( = ?auto_873713 ?auto_873719 ) ) ( not ( = ?auto_873713 ?auto_873720 ) ) ( not ( = ?auto_873713 ?auto_873721 ) ) ( not ( = ?auto_873714 ?auto_873715 ) ) ( not ( = ?auto_873714 ?auto_873716 ) ) ( not ( = ?auto_873714 ?auto_873717 ) ) ( not ( = ?auto_873714 ?auto_873718 ) ) ( not ( = ?auto_873714 ?auto_873719 ) ) ( not ( = ?auto_873714 ?auto_873720 ) ) ( not ( = ?auto_873714 ?auto_873721 ) ) ( not ( = ?auto_873715 ?auto_873716 ) ) ( not ( = ?auto_873715 ?auto_873717 ) ) ( not ( = ?auto_873715 ?auto_873718 ) ) ( not ( = ?auto_873715 ?auto_873719 ) ) ( not ( = ?auto_873715 ?auto_873720 ) ) ( not ( = ?auto_873715 ?auto_873721 ) ) ( not ( = ?auto_873716 ?auto_873717 ) ) ( not ( = ?auto_873716 ?auto_873718 ) ) ( not ( = ?auto_873716 ?auto_873719 ) ) ( not ( = ?auto_873716 ?auto_873720 ) ) ( not ( = ?auto_873716 ?auto_873721 ) ) ( not ( = ?auto_873717 ?auto_873718 ) ) ( not ( = ?auto_873717 ?auto_873719 ) ) ( not ( = ?auto_873717 ?auto_873720 ) ) ( not ( = ?auto_873717 ?auto_873721 ) ) ( not ( = ?auto_873718 ?auto_873719 ) ) ( not ( = ?auto_873718 ?auto_873720 ) ) ( not ( = ?auto_873718 ?auto_873721 ) ) ( not ( = ?auto_873719 ?auto_873720 ) ) ( not ( = ?auto_873719 ?auto_873721 ) ) ( not ( = ?auto_873720 ?auto_873721 ) ) ( ON ?auto_873719 ?auto_873720 ) ( ON ?auto_873718 ?auto_873719 ) ( ON ?auto_873717 ?auto_873718 ) ( ON ?auto_873716 ?auto_873717 ) ( ON ?auto_873715 ?auto_873716 ) ( ON ?auto_873714 ?auto_873715 ) ( ON ?auto_873713 ?auto_873714 ) ( ON ?auto_873712 ?auto_873713 ) ( CLEAR ?auto_873710 ) ( ON ?auto_873711 ?auto_873712 ) ( CLEAR ?auto_873711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_873710 ?auto_873711 )
      ( MAKE-11PILE ?auto_873710 ?auto_873711 ?auto_873712 ?auto_873713 ?auto_873714 ?auto_873715 ?auto_873716 ?auto_873717 ?auto_873718 ?auto_873719 ?auto_873720 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_873756 - BLOCK
      ?auto_873757 - BLOCK
      ?auto_873758 - BLOCK
      ?auto_873759 - BLOCK
      ?auto_873760 - BLOCK
      ?auto_873761 - BLOCK
      ?auto_873762 - BLOCK
      ?auto_873763 - BLOCK
      ?auto_873764 - BLOCK
      ?auto_873765 - BLOCK
      ?auto_873766 - BLOCK
    )
    :vars
    (
      ?auto_873767 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_873766 ?auto_873767 ) ( not ( = ?auto_873756 ?auto_873757 ) ) ( not ( = ?auto_873756 ?auto_873758 ) ) ( not ( = ?auto_873756 ?auto_873759 ) ) ( not ( = ?auto_873756 ?auto_873760 ) ) ( not ( = ?auto_873756 ?auto_873761 ) ) ( not ( = ?auto_873756 ?auto_873762 ) ) ( not ( = ?auto_873756 ?auto_873763 ) ) ( not ( = ?auto_873756 ?auto_873764 ) ) ( not ( = ?auto_873756 ?auto_873765 ) ) ( not ( = ?auto_873756 ?auto_873766 ) ) ( not ( = ?auto_873756 ?auto_873767 ) ) ( not ( = ?auto_873757 ?auto_873758 ) ) ( not ( = ?auto_873757 ?auto_873759 ) ) ( not ( = ?auto_873757 ?auto_873760 ) ) ( not ( = ?auto_873757 ?auto_873761 ) ) ( not ( = ?auto_873757 ?auto_873762 ) ) ( not ( = ?auto_873757 ?auto_873763 ) ) ( not ( = ?auto_873757 ?auto_873764 ) ) ( not ( = ?auto_873757 ?auto_873765 ) ) ( not ( = ?auto_873757 ?auto_873766 ) ) ( not ( = ?auto_873757 ?auto_873767 ) ) ( not ( = ?auto_873758 ?auto_873759 ) ) ( not ( = ?auto_873758 ?auto_873760 ) ) ( not ( = ?auto_873758 ?auto_873761 ) ) ( not ( = ?auto_873758 ?auto_873762 ) ) ( not ( = ?auto_873758 ?auto_873763 ) ) ( not ( = ?auto_873758 ?auto_873764 ) ) ( not ( = ?auto_873758 ?auto_873765 ) ) ( not ( = ?auto_873758 ?auto_873766 ) ) ( not ( = ?auto_873758 ?auto_873767 ) ) ( not ( = ?auto_873759 ?auto_873760 ) ) ( not ( = ?auto_873759 ?auto_873761 ) ) ( not ( = ?auto_873759 ?auto_873762 ) ) ( not ( = ?auto_873759 ?auto_873763 ) ) ( not ( = ?auto_873759 ?auto_873764 ) ) ( not ( = ?auto_873759 ?auto_873765 ) ) ( not ( = ?auto_873759 ?auto_873766 ) ) ( not ( = ?auto_873759 ?auto_873767 ) ) ( not ( = ?auto_873760 ?auto_873761 ) ) ( not ( = ?auto_873760 ?auto_873762 ) ) ( not ( = ?auto_873760 ?auto_873763 ) ) ( not ( = ?auto_873760 ?auto_873764 ) ) ( not ( = ?auto_873760 ?auto_873765 ) ) ( not ( = ?auto_873760 ?auto_873766 ) ) ( not ( = ?auto_873760 ?auto_873767 ) ) ( not ( = ?auto_873761 ?auto_873762 ) ) ( not ( = ?auto_873761 ?auto_873763 ) ) ( not ( = ?auto_873761 ?auto_873764 ) ) ( not ( = ?auto_873761 ?auto_873765 ) ) ( not ( = ?auto_873761 ?auto_873766 ) ) ( not ( = ?auto_873761 ?auto_873767 ) ) ( not ( = ?auto_873762 ?auto_873763 ) ) ( not ( = ?auto_873762 ?auto_873764 ) ) ( not ( = ?auto_873762 ?auto_873765 ) ) ( not ( = ?auto_873762 ?auto_873766 ) ) ( not ( = ?auto_873762 ?auto_873767 ) ) ( not ( = ?auto_873763 ?auto_873764 ) ) ( not ( = ?auto_873763 ?auto_873765 ) ) ( not ( = ?auto_873763 ?auto_873766 ) ) ( not ( = ?auto_873763 ?auto_873767 ) ) ( not ( = ?auto_873764 ?auto_873765 ) ) ( not ( = ?auto_873764 ?auto_873766 ) ) ( not ( = ?auto_873764 ?auto_873767 ) ) ( not ( = ?auto_873765 ?auto_873766 ) ) ( not ( = ?auto_873765 ?auto_873767 ) ) ( not ( = ?auto_873766 ?auto_873767 ) ) ( ON ?auto_873765 ?auto_873766 ) ( ON ?auto_873764 ?auto_873765 ) ( ON ?auto_873763 ?auto_873764 ) ( ON ?auto_873762 ?auto_873763 ) ( ON ?auto_873761 ?auto_873762 ) ( ON ?auto_873760 ?auto_873761 ) ( ON ?auto_873759 ?auto_873760 ) ( ON ?auto_873758 ?auto_873759 ) ( ON ?auto_873757 ?auto_873758 ) ( ON ?auto_873756 ?auto_873757 ) ( CLEAR ?auto_873756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_873756 )
      ( MAKE-11PILE ?auto_873756 ?auto_873757 ?auto_873758 ?auto_873759 ?auto_873760 ?auto_873761 ?auto_873762 ?auto_873763 ?auto_873764 ?auto_873765 ?auto_873766 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_873803 - BLOCK
      ?auto_873804 - BLOCK
      ?auto_873805 - BLOCK
      ?auto_873806 - BLOCK
      ?auto_873807 - BLOCK
      ?auto_873808 - BLOCK
      ?auto_873809 - BLOCK
      ?auto_873810 - BLOCK
      ?auto_873811 - BLOCK
      ?auto_873812 - BLOCK
      ?auto_873813 - BLOCK
      ?auto_873814 - BLOCK
    )
    :vars
    (
      ?auto_873815 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_873813 ) ( ON ?auto_873814 ?auto_873815 ) ( CLEAR ?auto_873814 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_873803 ) ( ON ?auto_873804 ?auto_873803 ) ( ON ?auto_873805 ?auto_873804 ) ( ON ?auto_873806 ?auto_873805 ) ( ON ?auto_873807 ?auto_873806 ) ( ON ?auto_873808 ?auto_873807 ) ( ON ?auto_873809 ?auto_873808 ) ( ON ?auto_873810 ?auto_873809 ) ( ON ?auto_873811 ?auto_873810 ) ( ON ?auto_873812 ?auto_873811 ) ( ON ?auto_873813 ?auto_873812 ) ( not ( = ?auto_873803 ?auto_873804 ) ) ( not ( = ?auto_873803 ?auto_873805 ) ) ( not ( = ?auto_873803 ?auto_873806 ) ) ( not ( = ?auto_873803 ?auto_873807 ) ) ( not ( = ?auto_873803 ?auto_873808 ) ) ( not ( = ?auto_873803 ?auto_873809 ) ) ( not ( = ?auto_873803 ?auto_873810 ) ) ( not ( = ?auto_873803 ?auto_873811 ) ) ( not ( = ?auto_873803 ?auto_873812 ) ) ( not ( = ?auto_873803 ?auto_873813 ) ) ( not ( = ?auto_873803 ?auto_873814 ) ) ( not ( = ?auto_873803 ?auto_873815 ) ) ( not ( = ?auto_873804 ?auto_873805 ) ) ( not ( = ?auto_873804 ?auto_873806 ) ) ( not ( = ?auto_873804 ?auto_873807 ) ) ( not ( = ?auto_873804 ?auto_873808 ) ) ( not ( = ?auto_873804 ?auto_873809 ) ) ( not ( = ?auto_873804 ?auto_873810 ) ) ( not ( = ?auto_873804 ?auto_873811 ) ) ( not ( = ?auto_873804 ?auto_873812 ) ) ( not ( = ?auto_873804 ?auto_873813 ) ) ( not ( = ?auto_873804 ?auto_873814 ) ) ( not ( = ?auto_873804 ?auto_873815 ) ) ( not ( = ?auto_873805 ?auto_873806 ) ) ( not ( = ?auto_873805 ?auto_873807 ) ) ( not ( = ?auto_873805 ?auto_873808 ) ) ( not ( = ?auto_873805 ?auto_873809 ) ) ( not ( = ?auto_873805 ?auto_873810 ) ) ( not ( = ?auto_873805 ?auto_873811 ) ) ( not ( = ?auto_873805 ?auto_873812 ) ) ( not ( = ?auto_873805 ?auto_873813 ) ) ( not ( = ?auto_873805 ?auto_873814 ) ) ( not ( = ?auto_873805 ?auto_873815 ) ) ( not ( = ?auto_873806 ?auto_873807 ) ) ( not ( = ?auto_873806 ?auto_873808 ) ) ( not ( = ?auto_873806 ?auto_873809 ) ) ( not ( = ?auto_873806 ?auto_873810 ) ) ( not ( = ?auto_873806 ?auto_873811 ) ) ( not ( = ?auto_873806 ?auto_873812 ) ) ( not ( = ?auto_873806 ?auto_873813 ) ) ( not ( = ?auto_873806 ?auto_873814 ) ) ( not ( = ?auto_873806 ?auto_873815 ) ) ( not ( = ?auto_873807 ?auto_873808 ) ) ( not ( = ?auto_873807 ?auto_873809 ) ) ( not ( = ?auto_873807 ?auto_873810 ) ) ( not ( = ?auto_873807 ?auto_873811 ) ) ( not ( = ?auto_873807 ?auto_873812 ) ) ( not ( = ?auto_873807 ?auto_873813 ) ) ( not ( = ?auto_873807 ?auto_873814 ) ) ( not ( = ?auto_873807 ?auto_873815 ) ) ( not ( = ?auto_873808 ?auto_873809 ) ) ( not ( = ?auto_873808 ?auto_873810 ) ) ( not ( = ?auto_873808 ?auto_873811 ) ) ( not ( = ?auto_873808 ?auto_873812 ) ) ( not ( = ?auto_873808 ?auto_873813 ) ) ( not ( = ?auto_873808 ?auto_873814 ) ) ( not ( = ?auto_873808 ?auto_873815 ) ) ( not ( = ?auto_873809 ?auto_873810 ) ) ( not ( = ?auto_873809 ?auto_873811 ) ) ( not ( = ?auto_873809 ?auto_873812 ) ) ( not ( = ?auto_873809 ?auto_873813 ) ) ( not ( = ?auto_873809 ?auto_873814 ) ) ( not ( = ?auto_873809 ?auto_873815 ) ) ( not ( = ?auto_873810 ?auto_873811 ) ) ( not ( = ?auto_873810 ?auto_873812 ) ) ( not ( = ?auto_873810 ?auto_873813 ) ) ( not ( = ?auto_873810 ?auto_873814 ) ) ( not ( = ?auto_873810 ?auto_873815 ) ) ( not ( = ?auto_873811 ?auto_873812 ) ) ( not ( = ?auto_873811 ?auto_873813 ) ) ( not ( = ?auto_873811 ?auto_873814 ) ) ( not ( = ?auto_873811 ?auto_873815 ) ) ( not ( = ?auto_873812 ?auto_873813 ) ) ( not ( = ?auto_873812 ?auto_873814 ) ) ( not ( = ?auto_873812 ?auto_873815 ) ) ( not ( = ?auto_873813 ?auto_873814 ) ) ( not ( = ?auto_873813 ?auto_873815 ) ) ( not ( = ?auto_873814 ?auto_873815 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_873814 ?auto_873815 )
      ( !STACK ?auto_873814 ?auto_873813 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_873853 - BLOCK
      ?auto_873854 - BLOCK
      ?auto_873855 - BLOCK
      ?auto_873856 - BLOCK
      ?auto_873857 - BLOCK
      ?auto_873858 - BLOCK
      ?auto_873859 - BLOCK
      ?auto_873860 - BLOCK
      ?auto_873861 - BLOCK
      ?auto_873862 - BLOCK
      ?auto_873863 - BLOCK
      ?auto_873864 - BLOCK
    )
    :vars
    (
      ?auto_873865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_873864 ?auto_873865 ) ( ON-TABLE ?auto_873853 ) ( ON ?auto_873854 ?auto_873853 ) ( ON ?auto_873855 ?auto_873854 ) ( ON ?auto_873856 ?auto_873855 ) ( ON ?auto_873857 ?auto_873856 ) ( ON ?auto_873858 ?auto_873857 ) ( ON ?auto_873859 ?auto_873858 ) ( ON ?auto_873860 ?auto_873859 ) ( ON ?auto_873861 ?auto_873860 ) ( ON ?auto_873862 ?auto_873861 ) ( not ( = ?auto_873853 ?auto_873854 ) ) ( not ( = ?auto_873853 ?auto_873855 ) ) ( not ( = ?auto_873853 ?auto_873856 ) ) ( not ( = ?auto_873853 ?auto_873857 ) ) ( not ( = ?auto_873853 ?auto_873858 ) ) ( not ( = ?auto_873853 ?auto_873859 ) ) ( not ( = ?auto_873853 ?auto_873860 ) ) ( not ( = ?auto_873853 ?auto_873861 ) ) ( not ( = ?auto_873853 ?auto_873862 ) ) ( not ( = ?auto_873853 ?auto_873863 ) ) ( not ( = ?auto_873853 ?auto_873864 ) ) ( not ( = ?auto_873853 ?auto_873865 ) ) ( not ( = ?auto_873854 ?auto_873855 ) ) ( not ( = ?auto_873854 ?auto_873856 ) ) ( not ( = ?auto_873854 ?auto_873857 ) ) ( not ( = ?auto_873854 ?auto_873858 ) ) ( not ( = ?auto_873854 ?auto_873859 ) ) ( not ( = ?auto_873854 ?auto_873860 ) ) ( not ( = ?auto_873854 ?auto_873861 ) ) ( not ( = ?auto_873854 ?auto_873862 ) ) ( not ( = ?auto_873854 ?auto_873863 ) ) ( not ( = ?auto_873854 ?auto_873864 ) ) ( not ( = ?auto_873854 ?auto_873865 ) ) ( not ( = ?auto_873855 ?auto_873856 ) ) ( not ( = ?auto_873855 ?auto_873857 ) ) ( not ( = ?auto_873855 ?auto_873858 ) ) ( not ( = ?auto_873855 ?auto_873859 ) ) ( not ( = ?auto_873855 ?auto_873860 ) ) ( not ( = ?auto_873855 ?auto_873861 ) ) ( not ( = ?auto_873855 ?auto_873862 ) ) ( not ( = ?auto_873855 ?auto_873863 ) ) ( not ( = ?auto_873855 ?auto_873864 ) ) ( not ( = ?auto_873855 ?auto_873865 ) ) ( not ( = ?auto_873856 ?auto_873857 ) ) ( not ( = ?auto_873856 ?auto_873858 ) ) ( not ( = ?auto_873856 ?auto_873859 ) ) ( not ( = ?auto_873856 ?auto_873860 ) ) ( not ( = ?auto_873856 ?auto_873861 ) ) ( not ( = ?auto_873856 ?auto_873862 ) ) ( not ( = ?auto_873856 ?auto_873863 ) ) ( not ( = ?auto_873856 ?auto_873864 ) ) ( not ( = ?auto_873856 ?auto_873865 ) ) ( not ( = ?auto_873857 ?auto_873858 ) ) ( not ( = ?auto_873857 ?auto_873859 ) ) ( not ( = ?auto_873857 ?auto_873860 ) ) ( not ( = ?auto_873857 ?auto_873861 ) ) ( not ( = ?auto_873857 ?auto_873862 ) ) ( not ( = ?auto_873857 ?auto_873863 ) ) ( not ( = ?auto_873857 ?auto_873864 ) ) ( not ( = ?auto_873857 ?auto_873865 ) ) ( not ( = ?auto_873858 ?auto_873859 ) ) ( not ( = ?auto_873858 ?auto_873860 ) ) ( not ( = ?auto_873858 ?auto_873861 ) ) ( not ( = ?auto_873858 ?auto_873862 ) ) ( not ( = ?auto_873858 ?auto_873863 ) ) ( not ( = ?auto_873858 ?auto_873864 ) ) ( not ( = ?auto_873858 ?auto_873865 ) ) ( not ( = ?auto_873859 ?auto_873860 ) ) ( not ( = ?auto_873859 ?auto_873861 ) ) ( not ( = ?auto_873859 ?auto_873862 ) ) ( not ( = ?auto_873859 ?auto_873863 ) ) ( not ( = ?auto_873859 ?auto_873864 ) ) ( not ( = ?auto_873859 ?auto_873865 ) ) ( not ( = ?auto_873860 ?auto_873861 ) ) ( not ( = ?auto_873860 ?auto_873862 ) ) ( not ( = ?auto_873860 ?auto_873863 ) ) ( not ( = ?auto_873860 ?auto_873864 ) ) ( not ( = ?auto_873860 ?auto_873865 ) ) ( not ( = ?auto_873861 ?auto_873862 ) ) ( not ( = ?auto_873861 ?auto_873863 ) ) ( not ( = ?auto_873861 ?auto_873864 ) ) ( not ( = ?auto_873861 ?auto_873865 ) ) ( not ( = ?auto_873862 ?auto_873863 ) ) ( not ( = ?auto_873862 ?auto_873864 ) ) ( not ( = ?auto_873862 ?auto_873865 ) ) ( not ( = ?auto_873863 ?auto_873864 ) ) ( not ( = ?auto_873863 ?auto_873865 ) ) ( not ( = ?auto_873864 ?auto_873865 ) ) ( CLEAR ?auto_873862 ) ( ON ?auto_873863 ?auto_873864 ) ( CLEAR ?auto_873863 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_873853 ?auto_873854 ?auto_873855 ?auto_873856 ?auto_873857 ?auto_873858 ?auto_873859 ?auto_873860 ?auto_873861 ?auto_873862 ?auto_873863 )
      ( MAKE-12PILE ?auto_873853 ?auto_873854 ?auto_873855 ?auto_873856 ?auto_873857 ?auto_873858 ?auto_873859 ?auto_873860 ?auto_873861 ?auto_873862 ?auto_873863 ?auto_873864 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_873903 - BLOCK
      ?auto_873904 - BLOCK
      ?auto_873905 - BLOCK
      ?auto_873906 - BLOCK
      ?auto_873907 - BLOCK
      ?auto_873908 - BLOCK
      ?auto_873909 - BLOCK
      ?auto_873910 - BLOCK
      ?auto_873911 - BLOCK
      ?auto_873912 - BLOCK
      ?auto_873913 - BLOCK
      ?auto_873914 - BLOCK
    )
    :vars
    (
      ?auto_873915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_873914 ?auto_873915 ) ( ON-TABLE ?auto_873903 ) ( ON ?auto_873904 ?auto_873903 ) ( ON ?auto_873905 ?auto_873904 ) ( ON ?auto_873906 ?auto_873905 ) ( ON ?auto_873907 ?auto_873906 ) ( ON ?auto_873908 ?auto_873907 ) ( ON ?auto_873909 ?auto_873908 ) ( ON ?auto_873910 ?auto_873909 ) ( ON ?auto_873911 ?auto_873910 ) ( not ( = ?auto_873903 ?auto_873904 ) ) ( not ( = ?auto_873903 ?auto_873905 ) ) ( not ( = ?auto_873903 ?auto_873906 ) ) ( not ( = ?auto_873903 ?auto_873907 ) ) ( not ( = ?auto_873903 ?auto_873908 ) ) ( not ( = ?auto_873903 ?auto_873909 ) ) ( not ( = ?auto_873903 ?auto_873910 ) ) ( not ( = ?auto_873903 ?auto_873911 ) ) ( not ( = ?auto_873903 ?auto_873912 ) ) ( not ( = ?auto_873903 ?auto_873913 ) ) ( not ( = ?auto_873903 ?auto_873914 ) ) ( not ( = ?auto_873903 ?auto_873915 ) ) ( not ( = ?auto_873904 ?auto_873905 ) ) ( not ( = ?auto_873904 ?auto_873906 ) ) ( not ( = ?auto_873904 ?auto_873907 ) ) ( not ( = ?auto_873904 ?auto_873908 ) ) ( not ( = ?auto_873904 ?auto_873909 ) ) ( not ( = ?auto_873904 ?auto_873910 ) ) ( not ( = ?auto_873904 ?auto_873911 ) ) ( not ( = ?auto_873904 ?auto_873912 ) ) ( not ( = ?auto_873904 ?auto_873913 ) ) ( not ( = ?auto_873904 ?auto_873914 ) ) ( not ( = ?auto_873904 ?auto_873915 ) ) ( not ( = ?auto_873905 ?auto_873906 ) ) ( not ( = ?auto_873905 ?auto_873907 ) ) ( not ( = ?auto_873905 ?auto_873908 ) ) ( not ( = ?auto_873905 ?auto_873909 ) ) ( not ( = ?auto_873905 ?auto_873910 ) ) ( not ( = ?auto_873905 ?auto_873911 ) ) ( not ( = ?auto_873905 ?auto_873912 ) ) ( not ( = ?auto_873905 ?auto_873913 ) ) ( not ( = ?auto_873905 ?auto_873914 ) ) ( not ( = ?auto_873905 ?auto_873915 ) ) ( not ( = ?auto_873906 ?auto_873907 ) ) ( not ( = ?auto_873906 ?auto_873908 ) ) ( not ( = ?auto_873906 ?auto_873909 ) ) ( not ( = ?auto_873906 ?auto_873910 ) ) ( not ( = ?auto_873906 ?auto_873911 ) ) ( not ( = ?auto_873906 ?auto_873912 ) ) ( not ( = ?auto_873906 ?auto_873913 ) ) ( not ( = ?auto_873906 ?auto_873914 ) ) ( not ( = ?auto_873906 ?auto_873915 ) ) ( not ( = ?auto_873907 ?auto_873908 ) ) ( not ( = ?auto_873907 ?auto_873909 ) ) ( not ( = ?auto_873907 ?auto_873910 ) ) ( not ( = ?auto_873907 ?auto_873911 ) ) ( not ( = ?auto_873907 ?auto_873912 ) ) ( not ( = ?auto_873907 ?auto_873913 ) ) ( not ( = ?auto_873907 ?auto_873914 ) ) ( not ( = ?auto_873907 ?auto_873915 ) ) ( not ( = ?auto_873908 ?auto_873909 ) ) ( not ( = ?auto_873908 ?auto_873910 ) ) ( not ( = ?auto_873908 ?auto_873911 ) ) ( not ( = ?auto_873908 ?auto_873912 ) ) ( not ( = ?auto_873908 ?auto_873913 ) ) ( not ( = ?auto_873908 ?auto_873914 ) ) ( not ( = ?auto_873908 ?auto_873915 ) ) ( not ( = ?auto_873909 ?auto_873910 ) ) ( not ( = ?auto_873909 ?auto_873911 ) ) ( not ( = ?auto_873909 ?auto_873912 ) ) ( not ( = ?auto_873909 ?auto_873913 ) ) ( not ( = ?auto_873909 ?auto_873914 ) ) ( not ( = ?auto_873909 ?auto_873915 ) ) ( not ( = ?auto_873910 ?auto_873911 ) ) ( not ( = ?auto_873910 ?auto_873912 ) ) ( not ( = ?auto_873910 ?auto_873913 ) ) ( not ( = ?auto_873910 ?auto_873914 ) ) ( not ( = ?auto_873910 ?auto_873915 ) ) ( not ( = ?auto_873911 ?auto_873912 ) ) ( not ( = ?auto_873911 ?auto_873913 ) ) ( not ( = ?auto_873911 ?auto_873914 ) ) ( not ( = ?auto_873911 ?auto_873915 ) ) ( not ( = ?auto_873912 ?auto_873913 ) ) ( not ( = ?auto_873912 ?auto_873914 ) ) ( not ( = ?auto_873912 ?auto_873915 ) ) ( not ( = ?auto_873913 ?auto_873914 ) ) ( not ( = ?auto_873913 ?auto_873915 ) ) ( not ( = ?auto_873914 ?auto_873915 ) ) ( ON ?auto_873913 ?auto_873914 ) ( CLEAR ?auto_873911 ) ( ON ?auto_873912 ?auto_873913 ) ( CLEAR ?auto_873912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_873903 ?auto_873904 ?auto_873905 ?auto_873906 ?auto_873907 ?auto_873908 ?auto_873909 ?auto_873910 ?auto_873911 ?auto_873912 )
      ( MAKE-12PILE ?auto_873903 ?auto_873904 ?auto_873905 ?auto_873906 ?auto_873907 ?auto_873908 ?auto_873909 ?auto_873910 ?auto_873911 ?auto_873912 ?auto_873913 ?auto_873914 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_873953 - BLOCK
      ?auto_873954 - BLOCK
      ?auto_873955 - BLOCK
      ?auto_873956 - BLOCK
      ?auto_873957 - BLOCK
      ?auto_873958 - BLOCK
      ?auto_873959 - BLOCK
      ?auto_873960 - BLOCK
      ?auto_873961 - BLOCK
      ?auto_873962 - BLOCK
      ?auto_873963 - BLOCK
      ?auto_873964 - BLOCK
    )
    :vars
    (
      ?auto_873965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_873964 ?auto_873965 ) ( ON-TABLE ?auto_873953 ) ( ON ?auto_873954 ?auto_873953 ) ( ON ?auto_873955 ?auto_873954 ) ( ON ?auto_873956 ?auto_873955 ) ( ON ?auto_873957 ?auto_873956 ) ( ON ?auto_873958 ?auto_873957 ) ( ON ?auto_873959 ?auto_873958 ) ( ON ?auto_873960 ?auto_873959 ) ( not ( = ?auto_873953 ?auto_873954 ) ) ( not ( = ?auto_873953 ?auto_873955 ) ) ( not ( = ?auto_873953 ?auto_873956 ) ) ( not ( = ?auto_873953 ?auto_873957 ) ) ( not ( = ?auto_873953 ?auto_873958 ) ) ( not ( = ?auto_873953 ?auto_873959 ) ) ( not ( = ?auto_873953 ?auto_873960 ) ) ( not ( = ?auto_873953 ?auto_873961 ) ) ( not ( = ?auto_873953 ?auto_873962 ) ) ( not ( = ?auto_873953 ?auto_873963 ) ) ( not ( = ?auto_873953 ?auto_873964 ) ) ( not ( = ?auto_873953 ?auto_873965 ) ) ( not ( = ?auto_873954 ?auto_873955 ) ) ( not ( = ?auto_873954 ?auto_873956 ) ) ( not ( = ?auto_873954 ?auto_873957 ) ) ( not ( = ?auto_873954 ?auto_873958 ) ) ( not ( = ?auto_873954 ?auto_873959 ) ) ( not ( = ?auto_873954 ?auto_873960 ) ) ( not ( = ?auto_873954 ?auto_873961 ) ) ( not ( = ?auto_873954 ?auto_873962 ) ) ( not ( = ?auto_873954 ?auto_873963 ) ) ( not ( = ?auto_873954 ?auto_873964 ) ) ( not ( = ?auto_873954 ?auto_873965 ) ) ( not ( = ?auto_873955 ?auto_873956 ) ) ( not ( = ?auto_873955 ?auto_873957 ) ) ( not ( = ?auto_873955 ?auto_873958 ) ) ( not ( = ?auto_873955 ?auto_873959 ) ) ( not ( = ?auto_873955 ?auto_873960 ) ) ( not ( = ?auto_873955 ?auto_873961 ) ) ( not ( = ?auto_873955 ?auto_873962 ) ) ( not ( = ?auto_873955 ?auto_873963 ) ) ( not ( = ?auto_873955 ?auto_873964 ) ) ( not ( = ?auto_873955 ?auto_873965 ) ) ( not ( = ?auto_873956 ?auto_873957 ) ) ( not ( = ?auto_873956 ?auto_873958 ) ) ( not ( = ?auto_873956 ?auto_873959 ) ) ( not ( = ?auto_873956 ?auto_873960 ) ) ( not ( = ?auto_873956 ?auto_873961 ) ) ( not ( = ?auto_873956 ?auto_873962 ) ) ( not ( = ?auto_873956 ?auto_873963 ) ) ( not ( = ?auto_873956 ?auto_873964 ) ) ( not ( = ?auto_873956 ?auto_873965 ) ) ( not ( = ?auto_873957 ?auto_873958 ) ) ( not ( = ?auto_873957 ?auto_873959 ) ) ( not ( = ?auto_873957 ?auto_873960 ) ) ( not ( = ?auto_873957 ?auto_873961 ) ) ( not ( = ?auto_873957 ?auto_873962 ) ) ( not ( = ?auto_873957 ?auto_873963 ) ) ( not ( = ?auto_873957 ?auto_873964 ) ) ( not ( = ?auto_873957 ?auto_873965 ) ) ( not ( = ?auto_873958 ?auto_873959 ) ) ( not ( = ?auto_873958 ?auto_873960 ) ) ( not ( = ?auto_873958 ?auto_873961 ) ) ( not ( = ?auto_873958 ?auto_873962 ) ) ( not ( = ?auto_873958 ?auto_873963 ) ) ( not ( = ?auto_873958 ?auto_873964 ) ) ( not ( = ?auto_873958 ?auto_873965 ) ) ( not ( = ?auto_873959 ?auto_873960 ) ) ( not ( = ?auto_873959 ?auto_873961 ) ) ( not ( = ?auto_873959 ?auto_873962 ) ) ( not ( = ?auto_873959 ?auto_873963 ) ) ( not ( = ?auto_873959 ?auto_873964 ) ) ( not ( = ?auto_873959 ?auto_873965 ) ) ( not ( = ?auto_873960 ?auto_873961 ) ) ( not ( = ?auto_873960 ?auto_873962 ) ) ( not ( = ?auto_873960 ?auto_873963 ) ) ( not ( = ?auto_873960 ?auto_873964 ) ) ( not ( = ?auto_873960 ?auto_873965 ) ) ( not ( = ?auto_873961 ?auto_873962 ) ) ( not ( = ?auto_873961 ?auto_873963 ) ) ( not ( = ?auto_873961 ?auto_873964 ) ) ( not ( = ?auto_873961 ?auto_873965 ) ) ( not ( = ?auto_873962 ?auto_873963 ) ) ( not ( = ?auto_873962 ?auto_873964 ) ) ( not ( = ?auto_873962 ?auto_873965 ) ) ( not ( = ?auto_873963 ?auto_873964 ) ) ( not ( = ?auto_873963 ?auto_873965 ) ) ( not ( = ?auto_873964 ?auto_873965 ) ) ( ON ?auto_873963 ?auto_873964 ) ( ON ?auto_873962 ?auto_873963 ) ( CLEAR ?auto_873960 ) ( ON ?auto_873961 ?auto_873962 ) ( CLEAR ?auto_873961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_873953 ?auto_873954 ?auto_873955 ?auto_873956 ?auto_873957 ?auto_873958 ?auto_873959 ?auto_873960 ?auto_873961 )
      ( MAKE-12PILE ?auto_873953 ?auto_873954 ?auto_873955 ?auto_873956 ?auto_873957 ?auto_873958 ?auto_873959 ?auto_873960 ?auto_873961 ?auto_873962 ?auto_873963 ?auto_873964 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_874003 - BLOCK
      ?auto_874004 - BLOCK
      ?auto_874005 - BLOCK
      ?auto_874006 - BLOCK
      ?auto_874007 - BLOCK
      ?auto_874008 - BLOCK
      ?auto_874009 - BLOCK
      ?auto_874010 - BLOCK
      ?auto_874011 - BLOCK
      ?auto_874012 - BLOCK
      ?auto_874013 - BLOCK
      ?auto_874014 - BLOCK
    )
    :vars
    (
      ?auto_874015 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_874014 ?auto_874015 ) ( ON-TABLE ?auto_874003 ) ( ON ?auto_874004 ?auto_874003 ) ( ON ?auto_874005 ?auto_874004 ) ( ON ?auto_874006 ?auto_874005 ) ( ON ?auto_874007 ?auto_874006 ) ( ON ?auto_874008 ?auto_874007 ) ( ON ?auto_874009 ?auto_874008 ) ( not ( = ?auto_874003 ?auto_874004 ) ) ( not ( = ?auto_874003 ?auto_874005 ) ) ( not ( = ?auto_874003 ?auto_874006 ) ) ( not ( = ?auto_874003 ?auto_874007 ) ) ( not ( = ?auto_874003 ?auto_874008 ) ) ( not ( = ?auto_874003 ?auto_874009 ) ) ( not ( = ?auto_874003 ?auto_874010 ) ) ( not ( = ?auto_874003 ?auto_874011 ) ) ( not ( = ?auto_874003 ?auto_874012 ) ) ( not ( = ?auto_874003 ?auto_874013 ) ) ( not ( = ?auto_874003 ?auto_874014 ) ) ( not ( = ?auto_874003 ?auto_874015 ) ) ( not ( = ?auto_874004 ?auto_874005 ) ) ( not ( = ?auto_874004 ?auto_874006 ) ) ( not ( = ?auto_874004 ?auto_874007 ) ) ( not ( = ?auto_874004 ?auto_874008 ) ) ( not ( = ?auto_874004 ?auto_874009 ) ) ( not ( = ?auto_874004 ?auto_874010 ) ) ( not ( = ?auto_874004 ?auto_874011 ) ) ( not ( = ?auto_874004 ?auto_874012 ) ) ( not ( = ?auto_874004 ?auto_874013 ) ) ( not ( = ?auto_874004 ?auto_874014 ) ) ( not ( = ?auto_874004 ?auto_874015 ) ) ( not ( = ?auto_874005 ?auto_874006 ) ) ( not ( = ?auto_874005 ?auto_874007 ) ) ( not ( = ?auto_874005 ?auto_874008 ) ) ( not ( = ?auto_874005 ?auto_874009 ) ) ( not ( = ?auto_874005 ?auto_874010 ) ) ( not ( = ?auto_874005 ?auto_874011 ) ) ( not ( = ?auto_874005 ?auto_874012 ) ) ( not ( = ?auto_874005 ?auto_874013 ) ) ( not ( = ?auto_874005 ?auto_874014 ) ) ( not ( = ?auto_874005 ?auto_874015 ) ) ( not ( = ?auto_874006 ?auto_874007 ) ) ( not ( = ?auto_874006 ?auto_874008 ) ) ( not ( = ?auto_874006 ?auto_874009 ) ) ( not ( = ?auto_874006 ?auto_874010 ) ) ( not ( = ?auto_874006 ?auto_874011 ) ) ( not ( = ?auto_874006 ?auto_874012 ) ) ( not ( = ?auto_874006 ?auto_874013 ) ) ( not ( = ?auto_874006 ?auto_874014 ) ) ( not ( = ?auto_874006 ?auto_874015 ) ) ( not ( = ?auto_874007 ?auto_874008 ) ) ( not ( = ?auto_874007 ?auto_874009 ) ) ( not ( = ?auto_874007 ?auto_874010 ) ) ( not ( = ?auto_874007 ?auto_874011 ) ) ( not ( = ?auto_874007 ?auto_874012 ) ) ( not ( = ?auto_874007 ?auto_874013 ) ) ( not ( = ?auto_874007 ?auto_874014 ) ) ( not ( = ?auto_874007 ?auto_874015 ) ) ( not ( = ?auto_874008 ?auto_874009 ) ) ( not ( = ?auto_874008 ?auto_874010 ) ) ( not ( = ?auto_874008 ?auto_874011 ) ) ( not ( = ?auto_874008 ?auto_874012 ) ) ( not ( = ?auto_874008 ?auto_874013 ) ) ( not ( = ?auto_874008 ?auto_874014 ) ) ( not ( = ?auto_874008 ?auto_874015 ) ) ( not ( = ?auto_874009 ?auto_874010 ) ) ( not ( = ?auto_874009 ?auto_874011 ) ) ( not ( = ?auto_874009 ?auto_874012 ) ) ( not ( = ?auto_874009 ?auto_874013 ) ) ( not ( = ?auto_874009 ?auto_874014 ) ) ( not ( = ?auto_874009 ?auto_874015 ) ) ( not ( = ?auto_874010 ?auto_874011 ) ) ( not ( = ?auto_874010 ?auto_874012 ) ) ( not ( = ?auto_874010 ?auto_874013 ) ) ( not ( = ?auto_874010 ?auto_874014 ) ) ( not ( = ?auto_874010 ?auto_874015 ) ) ( not ( = ?auto_874011 ?auto_874012 ) ) ( not ( = ?auto_874011 ?auto_874013 ) ) ( not ( = ?auto_874011 ?auto_874014 ) ) ( not ( = ?auto_874011 ?auto_874015 ) ) ( not ( = ?auto_874012 ?auto_874013 ) ) ( not ( = ?auto_874012 ?auto_874014 ) ) ( not ( = ?auto_874012 ?auto_874015 ) ) ( not ( = ?auto_874013 ?auto_874014 ) ) ( not ( = ?auto_874013 ?auto_874015 ) ) ( not ( = ?auto_874014 ?auto_874015 ) ) ( ON ?auto_874013 ?auto_874014 ) ( ON ?auto_874012 ?auto_874013 ) ( ON ?auto_874011 ?auto_874012 ) ( CLEAR ?auto_874009 ) ( ON ?auto_874010 ?auto_874011 ) ( CLEAR ?auto_874010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_874003 ?auto_874004 ?auto_874005 ?auto_874006 ?auto_874007 ?auto_874008 ?auto_874009 ?auto_874010 )
      ( MAKE-12PILE ?auto_874003 ?auto_874004 ?auto_874005 ?auto_874006 ?auto_874007 ?auto_874008 ?auto_874009 ?auto_874010 ?auto_874011 ?auto_874012 ?auto_874013 ?auto_874014 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_874053 - BLOCK
      ?auto_874054 - BLOCK
      ?auto_874055 - BLOCK
      ?auto_874056 - BLOCK
      ?auto_874057 - BLOCK
      ?auto_874058 - BLOCK
      ?auto_874059 - BLOCK
      ?auto_874060 - BLOCK
      ?auto_874061 - BLOCK
      ?auto_874062 - BLOCK
      ?auto_874063 - BLOCK
      ?auto_874064 - BLOCK
    )
    :vars
    (
      ?auto_874065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_874064 ?auto_874065 ) ( ON-TABLE ?auto_874053 ) ( ON ?auto_874054 ?auto_874053 ) ( ON ?auto_874055 ?auto_874054 ) ( ON ?auto_874056 ?auto_874055 ) ( ON ?auto_874057 ?auto_874056 ) ( ON ?auto_874058 ?auto_874057 ) ( not ( = ?auto_874053 ?auto_874054 ) ) ( not ( = ?auto_874053 ?auto_874055 ) ) ( not ( = ?auto_874053 ?auto_874056 ) ) ( not ( = ?auto_874053 ?auto_874057 ) ) ( not ( = ?auto_874053 ?auto_874058 ) ) ( not ( = ?auto_874053 ?auto_874059 ) ) ( not ( = ?auto_874053 ?auto_874060 ) ) ( not ( = ?auto_874053 ?auto_874061 ) ) ( not ( = ?auto_874053 ?auto_874062 ) ) ( not ( = ?auto_874053 ?auto_874063 ) ) ( not ( = ?auto_874053 ?auto_874064 ) ) ( not ( = ?auto_874053 ?auto_874065 ) ) ( not ( = ?auto_874054 ?auto_874055 ) ) ( not ( = ?auto_874054 ?auto_874056 ) ) ( not ( = ?auto_874054 ?auto_874057 ) ) ( not ( = ?auto_874054 ?auto_874058 ) ) ( not ( = ?auto_874054 ?auto_874059 ) ) ( not ( = ?auto_874054 ?auto_874060 ) ) ( not ( = ?auto_874054 ?auto_874061 ) ) ( not ( = ?auto_874054 ?auto_874062 ) ) ( not ( = ?auto_874054 ?auto_874063 ) ) ( not ( = ?auto_874054 ?auto_874064 ) ) ( not ( = ?auto_874054 ?auto_874065 ) ) ( not ( = ?auto_874055 ?auto_874056 ) ) ( not ( = ?auto_874055 ?auto_874057 ) ) ( not ( = ?auto_874055 ?auto_874058 ) ) ( not ( = ?auto_874055 ?auto_874059 ) ) ( not ( = ?auto_874055 ?auto_874060 ) ) ( not ( = ?auto_874055 ?auto_874061 ) ) ( not ( = ?auto_874055 ?auto_874062 ) ) ( not ( = ?auto_874055 ?auto_874063 ) ) ( not ( = ?auto_874055 ?auto_874064 ) ) ( not ( = ?auto_874055 ?auto_874065 ) ) ( not ( = ?auto_874056 ?auto_874057 ) ) ( not ( = ?auto_874056 ?auto_874058 ) ) ( not ( = ?auto_874056 ?auto_874059 ) ) ( not ( = ?auto_874056 ?auto_874060 ) ) ( not ( = ?auto_874056 ?auto_874061 ) ) ( not ( = ?auto_874056 ?auto_874062 ) ) ( not ( = ?auto_874056 ?auto_874063 ) ) ( not ( = ?auto_874056 ?auto_874064 ) ) ( not ( = ?auto_874056 ?auto_874065 ) ) ( not ( = ?auto_874057 ?auto_874058 ) ) ( not ( = ?auto_874057 ?auto_874059 ) ) ( not ( = ?auto_874057 ?auto_874060 ) ) ( not ( = ?auto_874057 ?auto_874061 ) ) ( not ( = ?auto_874057 ?auto_874062 ) ) ( not ( = ?auto_874057 ?auto_874063 ) ) ( not ( = ?auto_874057 ?auto_874064 ) ) ( not ( = ?auto_874057 ?auto_874065 ) ) ( not ( = ?auto_874058 ?auto_874059 ) ) ( not ( = ?auto_874058 ?auto_874060 ) ) ( not ( = ?auto_874058 ?auto_874061 ) ) ( not ( = ?auto_874058 ?auto_874062 ) ) ( not ( = ?auto_874058 ?auto_874063 ) ) ( not ( = ?auto_874058 ?auto_874064 ) ) ( not ( = ?auto_874058 ?auto_874065 ) ) ( not ( = ?auto_874059 ?auto_874060 ) ) ( not ( = ?auto_874059 ?auto_874061 ) ) ( not ( = ?auto_874059 ?auto_874062 ) ) ( not ( = ?auto_874059 ?auto_874063 ) ) ( not ( = ?auto_874059 ?auto_874064 ) ) ( not ( = ?auto_874059 ?auto_874065 ) ) ( not ( = ?auto_874060 ?auto_874061 ) ) ( not ( = ?auto_874060 ?auto_874062 ) ) ( not ( = ?auto_874060 ?auto_874063 ) ) ( not ( = ?auto_874060 ?auto_874064 ) ) ( not ( = ?auto_874060 ?auto_874065 ) ) ( not ( = ?auto_874061 ?auto_874062 ) ) ( not ( = ?auto_874061 ?auto_874063 ) ) ( not ( = ?auto_874061 ?auto_874064 ) ) ( not ( = ?auto_874061 ?auto_874065 ) ) ( not ( = ?auto_874062 ?auto_874063 ) ) ( not ( = ?auto_874062 ?auto_874064 ) ) ( not ( = ?auto_874062 ?auto_874065 ) ) ( not ( = ?auto_874063 ?auto_874064 ) ) ( not ( = ?auto_874063 ?auto_874065 ) ) ( not ( = ?auto_874064 ?auto_874065 ) ) ( ON ?auto_874063 ?auto_874064 ) ( ON ?auto_874062 ?auto_874063 ) ( ON ?auto_874061 ?auto_874062 ) ( ON ?auto_874060 ?auto_874061 ) ( CLEAR ?auto_874058 ) ( ON ?auto_874059 ?auto_874060 ) ( CLEAR ?auto_874059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_874053 ?auto_874054 ?auto_874055 ?auto_874056 ?auto_874057 ?auto_874058 ?auto_874059 )
      ( MAKE-12PILE ?auto_874053 ?auto_874054 ?auto_874055 ?auto_874056 ?auto_874057 ?auto_874058 ?auto_874059 ?auto_874060 ?auto_874061 ?auto_874062 ?auto_874063 ?auto_874064 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_874103 - BLOCK
      ?auto_874104 - BLOCK
      ?auto_874105 - BLOCK
      ?auto_874106 - BLOCK
      ?auto_874107 - BLOCK
      ?auto_874108 - BLOCK
      ?auto_874109 - BLOCK
      ?auto_874110 - BLOCK
      ?auto_874111 - BLOCK
      ?auto_874112 - BLOCK
      ?auto_874113 - BLOCK
      ?auto_874114 - BLOCK
    )
    :vars
    (
      ?auto_874115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_874114 ?auto_874115 ) ( ON-TABLE ?auto_874103 ) ( ON ?auto_874104 ?auto_874103 ) ( ON ?auto_874105 ?auto_874104 ) ( ON ?auto_874106 ?auto_874105 ) ( ON ?auto_874107 ?auto_874106 ) ( not ( = ?auto_874103 ?auto_874104 ) ) ( not ( = ?auto_874103 ?auto_874105 ) ) ( not ( = ?auto_874103 ?auto_874106 ) ) ( not ( = ?auto_874103 ?auto_874107 ) ) ( not ( = ?auto_874103 ?auto_874108 ) ) ( not ( = ?auto_874103 ?auto_874109 ) ) ( not ( = ?auto_874103 ?auto_874110 ) ) ( not ( = ?auto_874103 ?auto_874111 ) ) ( not ( = ?auto_874103 ?auto_874112 ) ) ( not ( = ?auto_874103 ?auto_874113 ) ) ( not ( = ?auto_874103 ?auto_874114 ) ) ( not ( = ?auto_874103 ?auto_874115 ) ) ( not ( = ?auto_874104 ?auto_874105 ) ) ( not ( = ?auto_874104 ?auto_874106 ) ) ( not ( = ?auto_874104 ?auto_874107 ) ) ( not ( = ?auto_874104 ?auto_874108 ) ) ( not ( = ?auto_874104 ?auto_874109 ) ) ( not ( = ?auto_874104 ?auto_874110 ) ) ( not ( = ?auto_874104 ?auto_874111 ) ) ( not ( = ?auto_874104 ?auto_874112 ) ) ( not ( = ?auto_874104 ?auto_874113 ) ) ( not ( = ?auto_874104 ?auto_874114 ) ) ( not ( = ?auto_874104 ?auto_874115 ) ) ( not ( = ?auto_874105 ?auto_874106 ) ) ( not ( = ?auto_874105 ?auto_874107 ) ) ( not ( = ?auto_874105 ?auto_874108 ) ) ( not ( = ?auto_874105 ?auto_874109 ) ) ( not ( = ?auto_874105 ?auto_874110 ) ) ( not ( = ?auto_874105 ?auto_874111 ) ) ( not ( = ?auto_874105 ?auto_874112 ) ) ( not ( = ?auto_874105 ?auto_874113 ) ) ( not ( = ?auto_874105 ?auto_874114 ) ) ( not ( = ?auto_874105 ?auto_874115 ) ) ( not ( = ?auto_874106 ?auto_874107 ) ) ( not ( = ?auto_874106 ?auto_874108 ) ) ( not ( = ?auto_874106 ?auto_874109 ) ) ( not ( = ?auto_874106 ?auto_874110 ) ) ( not ( = ?auto_874106 ?auto_874111 ) ) ( not ( = ?auto_874106 ?auto_874112 ) ) ( not ( = ?auto_874106 ?auto_874113 ) ) ( not ( = ?auto_874106 ?auto_874114 ) ) ( not ( = ?auto_874106 ?auto_874115 ) ) ( not ( = ?auto_874107 ?auto_874108 ) ) ( not ( = ?auto_874107 ?auto_874109 ) ) ( not ( = ?auto_874107 ?auto_874110 ) ) ( not ( = ?auto_874107 ?auto_874111 ) ) ( not ( = ?auto_874107 ?auto_874112 ) ) ( not ( = ?auto_874107 ?auto_874113 ) ) ( not ( = ?auto_874107 ?auto_874114 ) ) ( not ( = ?auto_874107 ?auto_874115 ) ) ( not ( = ?auto_874108 ?auto_874109 ) ) ( not ( = ?auto_874108 ?auto_874110 ) ) ( not ( = ?auto_874108 ?auto_874111 ) ) ( not ( = ?auto_874108 ?auto_874112 ) ) ( not ( = ?auto_874108 ?auto_874113 ) ) ( not ( = ?auto_874108 ?auto_874114 ) ) ( not ( = ?auto_874108 ?auto_874115 ) ) ( not ( = ?auto_874109 ?auto_874110 ) ) ( not ( = ?auto_874109 ?auto_874111 ) ) ( not ( = ?auto_874109 ?auto_874112 ) ) ( not ( = ?auto_874109 ?auto_874113 ) ) ( not ( = ?auto_874109 ?auto_874114 ) ) ( not ( = ?auto_874109 ?auto_874115 ) ) ( not ( = ?auto_874110 ?auto_874111 ) ) ( not ( = ?auto_874110 ?auto_874112 ) ) ( not ( = ?auto_874110 ?auto_874113 ) ) ( not ( = ?auto_874110 ?auto_874114 ) ) ( not ( = ?auto_874110 ?auto_874115 ) ) ( not ( = ?auto_874111 ?auto_874112 ) ) ( not ( = ?auto_874111 ?auto_874113 ) ) ( not ( = ?auto_874111 ?auto_874114 ) ) ( not ( = ?auto_874111 ?auto_874115 ) ) ( not ( = ?auto_874112 ?auto_874113 ) ) ( not ( = ?auto_874112 ?auto_874114 ) ) ( not ( = ?auto_874112 ?auto_874115 ) ) ( not ( = ?auto_874113 ?auto_874114 ) ) ( not ( = ?auto_874113 ?auto_874115 ) ) ( not ( = ?auto_874114 ?auto_874115 ) ) ( ON ?auto_874113 ?auto_874114 ) ( ON ?auto_874112 ?auto_874113 ) ( ON ?auto_874111 ?auto_874112 ) ( ON ?auto_874110 ?auto_874111 ) ( ON ?auto_874109 ?auto_874110 ) ( CLEAR ?auto_874107 ) ( ON ?auto_874108 ?auto_874109 ) ( CLEAR ?auto_874108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_874103 ?auto_874104 ?auto_874105 ?auto_874106 ?auto_874107 ?auto_874108 )
      ( MAKE-12PILE ?auto_874103 ?auto_874104 ?auto_874105 ?auto_874106 ?auto_874107 ?auto_874108 ?auto_874109 ?auto_874110 ?auto_874111 ?auto_874112 ?auto_874113 ?auto_874114 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_874153 - BLOCK
      ?auto_874154 - BLOCK
      ?auto_874155 - BLOCK
      ?auto_874156 - BLOCK
      ?auto_874157 - BLOCK
      ?auto_874158 - BLOCK
      ?auto_874159 - BLOCK
      ?auto_874160 - BLOCK
      ?auto_874161 - BLOCK
      ?auto_874162 - BLOCK
      ?auto_874163 - BLOCK
      ?auto_874164 - BLOCK
    )
    :vars
    (
      ?auto_874165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_874164 ?auto_874165 ) ( ON-TABLE ?auto_874153 ) ( ON ?auto_874154 ?auto_874153 ) ( ON ?auto_874155 ?auto_874154 ) ( ON ?auto_874156 ?auto_874155 ) ( not ( = ?auto_874153 ?auto_874154 ) ) ( not ( = ?auto_874153 ?auto_874155 ) ) ( not ( = ?auto_874153 ?auto_874156 ) ) ( not ( = ?auto_874153 ?auto_874157 ) ) ( not ( = ?auto_874153 ?auto_874158 ) ) ( not ( = ?auto_874153 ?auto_874159 ) ) ( not ( = ?auto_874153 ?auto_874160 ) ) ( not ( = ?auto_874153 ?auto_874161 ) ) ( not ( = ?auto_874153 ?auto_874162 ) ) ( not ( = ?auto_874153 ?auto_874163 ) ) ( not ( = ?auto_874153 ?auto_874164 ) ) ( not ( = ?auto_874153 ?auto_874165 ) ) ( not ( = ?auto_874154 ?auto_874155 ) ) ( not ( = ?auto_874154 ?auto_874156 ) ) ( not ( = ?auto_874154 ?auto_874157 ) ) ( not ( = ?auto_874154 ?auto_874158 ) ) ( not ( = ?auto_874154 ?auto_874159 ) ) ( not ( = ?auto_874154 ?auto_874160 ) ) ( not ( = ?auto_874154 ?auto_874161 ) ) ( not ( = ?auto_874154 ?auto_874162 ) ) ( not ( = ?auto_874154 ?auto_874163 ) ) ( not ( = ?auto_874154 ?auto_874164 ) ) ( not ( = ?auto_874154 ?auto_874165 ) ) ( not ( = ?auto_874155 ?auto_874156 ) ) ( not ( = ?auto_874155 ?auto_874157 ) ) ( not ( = ?auto_874155 ?auto_874158 ) ) ( not ( = ?auto_874155 ?auto_874159 ) ) ( not ( = ?auto_874155 ?auto_874160 ) ) ( not ( = ?auto_874155 ?auto_874161 ) ) ( not ( = ?auto_874155 ?auto_874162 ) ) ( not ( = ?auto_874155 ?auto_874163 ) ) ( not ( = ?auto_874155 ?auto_874164 ) ) ( not ( = ?auto_874155 ?auto_874165 ) ) ( not ( = ?auto_874156 ?auto_874157 ) ) ( not ( = ?auto_874156 ?auto_874158 ) ) ( not ( = ?auto_874156 ?auto_874159 ) ) ( not ( = ?auto_874156 ?auto_874160 ) ) ( not ( = ?auto_874156 ?auto_874161 ) ) ( not ( = ?auto_874156 ?auto_874162 ) ) ( not ( = ?auto_874156 ?auto_874163 ) ) ( not ( = ?auto_874156 ?auto_874164 ) ) ( not ( = ?auto_874156 ?auto_874165 ) ) ( not ( = ?auto_874157 ?auto_874158 ) ) ( not ( = ?auto_874157 ?auto_874159 ) ) ( not ( = ?auto_874157 ?auto_874160 ) ) ( not ( = ?auto_874157 ?auto_874161 ) ) ( not ( = ?auto_874157 ?auto_874162 ) ) ( not ( = ?auto_874157 ?auto_874163 ) ) ( not ( = ?auto_874157 ?auto_874164 ) ) ( not ( = ?auto_874157 ?auto_874165 ) ) ( not ( = ?auto_874158 ?auto_874159 ) ) ( not ( = ?auto_874158 ?auto_874160 ) ) ( not ( = ?auto_874158 ?auto_874161 ) ) ( not ( = ?auto_874158 ?auto_874162 ) ) ( not ( = ?auto_874158 ?auto_874163 ) ) ( not ( = ?auto_874158 ?auto_874164 ) ) ( not ( = ?auto_874158 ?auto_874165 ) ) ( not ( = ?auto_874159 ?auto_874160 ) ) ( not ( = ?auto_874159 ?auto_874161 ) ) ( not ( = ?auto_874159 ?auto_874162 ) ) ( not ( = ?auto_874159 ?auto_874163 ) ) ( not ( = ?auto_874159 ?auto_874164 ) ) ( not ( = ?auto_874159 ?auto_874165 ) ) ( not ( = ?auto_874160 ?auto_874161 ) ) ( not ( = ?auto_874160 ?auto_874162 ) ) ( not ( = ?auto_874160 ?auto_874163 ) ) ( not ( = ?auto_874160 ?auto_874164 ) ) ( not ( = ?auto_874160 ?auto_874165 ) ) ( not ( = ?auto_874161 ?auto_874162 ) ) ( not ( = ?auto_874161 ?auto_874163 ) ) ( not ( = ?auto_874161 ?auto_874164 ) ) ( not ( = ?auto_874161 ?auto_874165 ) ) ( not ( = ?auto_874162 ?auto_874163 ) ) ( not ( = ?auto_874162 ?auto_874164 ) ) ( not ( = ?auto_874162 ?auto_874165 ) ) ( not ( = ?auto_874163 ?auto_874164 ) ) ( not ( = ?auto_874163 ?auto_874165 ) ) ( not ( = ?auto_874164 ?auto_874165 ) ) ( ON ?auto_874163 ?auto_874164 ) ( ON ?auto_874162 ?auto_874163 ) ( ON ?auto_874161 ?auto_874162 ) ( ON ?auto_874160 ?auto_874161 ) ( ON ?auto_874159 ?auto_874160 ) ( ON ?auto_874158 ?auto_874159 ) ( CLEAR ?auto_874156 ) ( ON ?auto_874157 ?auto_874158 ) ( CLEAR ?auto_874157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_874153 ?auto_874154 ?auto_874155 ?auto_874156 ?auto_874157 )
      ( MAKE-12PILE ?auto_874153 ?auto_874154 ?auto_874155 ?auto_874156 ?auto_874157 ?auto_874158 ?auto_874159 ?auto_874160 ?auto_874161 ?auto_874162 ?auto_874163 ?auto_874164 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_874203 - BLOCK
      ?auto_874204 - BLOCK
      ?auto_874205 - BLOCK
      ?auto_874206 - BLOCK
      ?auto_874207 - BLOCK
      ?auto_874208 - BLOCK
      ?auto_874209 - BLOCK
      ?auto_874210 - BLOCK
      ?auto_874211 - BLOCK
      ?auto_874212 - BLOCK
      ?auto_874213 - BLOCK
      ?auto_874214 - BLOCK
    )
    :vars
    (
      ?auto_874215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_874214 ?auto_874215 ) ( ON-TABLE ?auto_874203 ) ( ON ?auto_874204 ?auto_874203 ) ( ON ?auto_874205 ?auto_874204 ) ( not ( = ?auto_874203 ?auto_874204 ) ) ( not ( = ?auto_874203 ?auto_874205 ) ) ( not ( = ?auto_874203 ?auto_874206 ) ) ( not ( = ?auto_874203 ?auto_874207 ) ) ( not ( = ?auto_874203 ?auto_874208 ) ) ( not ( = ?auto_874203 ?auto_874209 ) ) ( not ( = ?auto_874203 ?auto_874210 ) ) ( not ( = ?auto_874203 ?auto_874211 ) ) ( not ( = ?auto_874203 ?auto_874212 ) ) ( not ( = ?auto_874203 ?auto_874213 ) ) ( not ( = ?auto_874203 ?auto_874214 ) ) ( not ( = ?auto_874203 ?auto_874215 ) ) ( not ( = ?auto_874204 ?auto_874205 ) ) ( not ( = ?auto_874204 ?auto_874206 ) ) ( not ( = ?auto_874204 ?auto_874207 ) ) ( not ( = ?auto_874204 ?auto_874208 ) ) ( not ( = ?auto_874204 ?auto_874209 ) ) ( not ( = ?auto_874204 ?auto_874210 ) ) ( not ( = ?auto_874204 ?auto_874211 ) ) ( not ( = ?auto_874204 ?auto_874212 ) ) ( not ( = ?auto_874204 ?auto_874213 ) ) ( not ( = ?auto_874204 ?auto_874214 ) ) ( not ( = ?auto_874204 ?auto_874215 ) ) ( not ( = ?auto_874205 ?auto_874206 ) ) ( not ( = ?auto_874205 ?auto_874207 ) ) ( not ( = ?auto_874205 ?auto_874208 ) ) ( not ( = ?auto_874205 ?auto_874209 ) ) ( not ( = ?auto_874205 ?auto_874210 ) ) ( not ( = ?auto_874205 ?auto_874211 ) ) ( not ( = ?auto_874205 ?auto_874212 ) ) ( not ( = ?auto_874205 ?auto_874213 ) ) ( not ( = ?auto_874205 ?auto_874214 ) ) ( not ( = ?auto_874205 ?auto_874215 ) ) ( not ( = ?auto_874206 ?auto_874207 ) ) ( not ( = ?auto_874206 ?auto_874208 ) ) ( not ( = ?auto_874206 ?auto_874209 ) ) ( not ( = ?auto_874206 ?auto_874210 ) ) ( not ( = ?auto_874206 ?auto_874211 ) ) ( not ( = ?auto_874206 ?auto_874212 ) ) ( not ( = ?auto_874206 ?auto_874213 ) ) ( not ( = ?auto_874206 ?auto_874214 ) ) ( not ( = ?auto_874206 ?auto_874215 ) ) ( not ( = ?auto_874207 ?auto_874208 ) ) ( not ( = ?auto_874207 ?auto_874209 ) ) ( not ( = ?auto_874207 ?auto_874210 ) ) ( not ( = ?auto_874207 ?auto_874211 ) ) ( not ( = ?auto_874207 ?auto_874212 ) ) ( not ( = ?auto_874207 ?auto_874213 ) ) ( not ( = ?auto_874207 ?auto_874214 ) ) ( not ( = ?auto_874207 ?auto_874215 ) ) ( not ( = ?auto_874208 ?auto_874209 ) ) ( not ( = ?auto_874208 ?auto_874210 ) ) ( not ( = ?auto_874208 ?auto_874211 ) ) ( not ( = ?auto_874208 ?auto_874212 ) ) ( not ( = ?auto_874208 ?auto_874213 ) ) ( not ( = ?auto_874208 ?auto_874214 ) ) ( not ( = ?auto_874208 ?auto_874215 ) ) ( not ( = ?auto_874209 ?auto_874210 ) ) ( not ( = ?auto_874209 ?auto_874211 ) ) ( not ( = ?auto_874209 ?auto_874212 ) ) ( not ( = ?auto_874209 ?auto_874213 ) ) ( not ( = ?auto_874209 ?auto_874214 ) ) ( not ( = ?auto_874209 ?auto_874215 ) ) ( not ( = ?auto_874210 ?auto_874211 ) ) ( not ( = ?auto_874210 ?auto_874212 ) ) ( not ( = ?auto_874210 ?auto_874213 ) ) ( not ( = ?auto_874210 ?auto_874214 ) ) ( not ( = ?auto_874210 ?auto_874215 ) ) ( not ( = ?auto_874211 ?auto_874212 ) ) ( not ( = ?auto_874211 ?auto_874213 ) ) ( not ( = ?auto_874211 ?auto_874214 ) ) ( not ( = ?auto_874211 ?auto_874215 ) ) ( not ( = ?auto_874212 ?auto_874213 ) ) ( not ( = ?auto_874212 ?auto_874214 ) ) ( not ( = ?auto_874212 ?auto_874215 ) ) ( not ( = ?auto_874213 ?auto_874214 ) ) ( not ( = ?auto_874213 ?auto_874215 ) ) ( not ( = ?auto_874214 ?auto_874215 ) ) ( ON ?auto_874213 ?auto_874214 ) ( ON ?auto_874212 ?auto_874213 ) ( ON ?auto_874211 ?auto_874212 ) ( ON ?auto_874210 ?auto_874211 ) ( ON ?auto_874209 ?auto_874210 ) ( ON ?auto_874208 ?auto_874209 ) ( ON ?auto_874207 ?auto_874208 ) ( CLEAR ?auto_874205 ) ( ON ?auto_874206 ?auto_874207 ) ( CLEAR ?auto_874206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_874203 ?auto_874204 ?auto_874205 ?auto_874206 )
      ( MAKE-12PILE ?auto_874203 ?auto_874204 ?auto_874205 ?auto_874206 ?auto_874207 ?auto_874208 ?auto_874209 ?auto_874210 ?auto_874211 ?auto_874212 ?auto_874213 ?auto_874214 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_874253 - BLOCK
      ?auto_874254 - BLOCK
      ?auto_874255 - BLOCK
      ?auto_874256 - BLOCK
      ?auto_874257 - BLOCK
      ?auto_874258 - BLOCK
      ?auto_874259 - BLOCK
      ?auto_874260 - BLOCK
      ?auto_874261 - BLOCK
      ?auto_874262 - BLOCK
      ?auto_874263 - BLOCK
      ?auto_874264 - BLOCK
    )
    :vars
    (
      ?auto_874265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_874264 ?auto_874265 ) ( ON-TABLE ?auto_874253 ) ( ON ?auto_874254 ?auto_874253 ) ( not ( = ?auto_874253 ?auto_874254 ) ) ( not ( = ?auto_874253 ?auto_874255 ) ) ( not ( = ?auto_874253 ?auto_874256 ) ) ( not ( = ?auto_874253 ?auto_874257 ) ) ( not ( = ?auto_874253 ?auto_874258 ) ) ( not ( = ?auto_874253 ?auto_874259 ) ) ( not ( = ?auto_874253 ?auto_874260 ) ) ( not ( = ?auto_874253 ?auto_874261 ) ) ( not ( = ?auto_874253 ?auto_874262 ) ) ( not ( = ?auto_874253 ?auto_874263 ) ) ( not ( = ?auto_874253 ?auto_874264 ) ) ( not ( = ?auto_874253 ?auto_874265 ) ) ( not ( = ?auto_874254 ?auto_874255 ) ) ( not ( = ?auto_874254 ?auto_874256 ) ) ( not ( = ?auto_874254 ?auto_874257 ) ) ( not ( = ?auto_874254 ?auto_874258 ) ) ( not ( = ?auto_874254 ?auto_874259 ) ) ( not ( = ?auto_874254 ?auto_874260 ) ) ( not ( = ?auto_874254 ?auto_874261 ) ) ( not ( = ?auto_874254 ?auto_874262 ) ) ( not ( = ?auto_874254 ?auto_874263 ) ) ( not ( = ?auto_874254 ?auto_874264 ) ) ( not ( = ?auto_874254 ?auto_874265 ) ) ( not ( = ?auto_874255 ?auto_874256 ) ) ( not ( = ?auto_874255 ?auto_874257 ) ) ( not ( = ?auto_874255 ?auto_874258 ) ) ( not ( = ?auto_874255 ?auto_874259 ) ) ( not ( = ?auto_874255 ?auto_874260 ) ) ( not ( = ?auto_874255 ?auto_874261 ) ) ( not ( = ?auto_874255 ?auto_874262 ) ) ( not ( = ?auto_874255 ?auto_874263 ) ) ( not ( = ?auto_874255 ?auto_874264 ) ) ( not ( = ?auto_874255 ?auto_874265 ) ) ( not ( = ?auto_874256 ?auto_874257 ) ) ( not ( = ?auto_874256 ?auto_874258 ) ) ( not ( = ?auto_874256 ?auto_874259 ) ) ( not ( = ?auto_874256 ?auto_874260 ) ) ( not ( = ?auto_874256 ?auto_874261 ) ) ( not ( = ?auto_874256 ?auto_874262 ) ) ( not ( = ?auto_874256 ?auto_874263 ) ) ( not ( = ?auto_874256 ?auto_874264 ) ) ( not ( = ?auto_874256 ?auto_874265 ) ) ( not ( = ?auto_874257 ?auto_874258 ) ) ( not ( = ?auto_874257 ?auto_874259 ) ) ( not ( = ?auto_874257 ?auto_874260 ) ) ( not ( = ?auto_874257 ?auto_874261 ) ) ( not ( = ?auto_874257 ?auto_874262 ) ) ( not ( = ?auto_874257 ?auto_874263 ) ) ( not ( = ?auto_874257 ?auto_874264 ) ) ( not ( = ?auto_874257 ?auto_874265 ) ) ( not ( = ?auto_874258 ?auto_874259 ) ) ( not ( = ?auto_874258 ?auto_874260 ) ) ( not ( = ?auto_874258 ?auto_874261 ) ) ( not ( = ?auto_874258 ?auto_874262 ) ) ( not ( = ?auto_874258 ?auto_874263 ) ) ( not ( = ?auto_874258 ?auto_874264 ) ) ( not ( = ?auto_874258 ?auto_874265 ) ) ( not ( = ?auto_874259 ?auto_874260 ) ) ( not ( = ?auto_874259 ?auto_874261 ) ) ( not ( = ?auto_874259 ?auto_874262 ) ) ( not ( = ?auto_874259 ?auto_874263 ) ) ( not ( = ?auto_874259 ?auto_874264 ) ) ( not ( = ?auto_874259 ?auto_874265 ) ) ( not ( = ?auto_874260 ?auto_874261 ) ) ( not ( = ?auto_874260 ?auto_874262 ) ) ( not ( = ?auto_874260 ?auto_874263 ) ) ( not ( = ?auto_874260 ?auto_874264 ) ) ( not ( = ?auto_874260 ?auto_874265 ) ) ( not ( = ?auto_874261 ?auto_874262 ) ) ( not ( = ?auto_874261 ?auto_874263 ) ) ( not ( = ?auto_874261 ?auto_874264 ) ) ( not ( = ?auto_874261 ?auto_874265 ) ) ( not ( = ?auto_874262 ?auto_874263 ) ) ( not ( = ?auto_874262 ?auto_874264 ) ) ( not ( = ?auto_874262 ?auto_874265 ) ) ( not ( = ?auto_874263 ?auto_874264 ) ) ( not ( = ?auto_874263 ?auto_874265 ) ) ( not ( = ?auto_874264 ?auto_874265 ) ) ( ON ?auto_874263 ?auto_874264 ) ( ON ?auto_874262 ?auto_874263 ) ( ON ?auto_874261 ?auto_874262 ) ( ON ?auto_874260 ?auto_874261 ) ( ON ?auto_874259 ?auto_874260 ) ( ON ?auto_874258 ?auto_874259 ) ( ON ?auto_874257 ?auto_874258 ) ( ON ?auto_874256 ?auto_874257 ) ( CLEAR ?auto_874254 ) ( ON ?auto_874255 ?auto_874256 ) ( CLEAR ?auto_874255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_874253 ?auto_874254 ?auto_874255 )
      ( MAKE-12PILE ?auto_874253 ?auto_874254 ?auto_874255 ?auto_874256 ?auto_874257 ?auto_874258 ?auto_874259 ?auto_874260 ?auto_874261 ?auto_874262 ?auto_874263 ?auto_874264 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_874303 - BLOCK
      ?auto_874304 - BLOCK
      ?auto_874305 - BLOCK
      ?auto_874306 - BLOCK
      ?auto_874307 - BLOCK
      ?auto_874308 - BLOCK
      ?auto_874309 - BLOCK
      ?auto_874310 - BLOCK
      ?auto_874311 - BLOCK
      ?auto_874312 - BLOCK
      ?auto_874313 - BLOCK
      ?auto_874314 - BLOCK
    )
    :vars
    (
      ?auto_874315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_874314 ?auto_874315 ) ( ON-TABLE ?auto_874303 ) ( not ( = ?auto_874303 ?auto_874304 ) ) ( not ( = ?auto_874303 ?auto_874305 ) ) ( not ( = ?auto_874303 ?auto_874306 ) ) ( not ( = ?auto_874303 ?auto_874307 ) ) ( not ( = ?auto_874303 ?auto_874308 ) ) ( not ( = ?auto_874303 ?auto_874309 ) ) ( not ( = ?auto_874303 ?auto_874310 ) ) ( not ( = ?auto_874303 ?auto_874311 ) ) ( not ( = ?auto_874303 ?auto_874312 ) ) ( not ( = ?auto_874303 ?auto_874313 ) ) ( not ( = ?auto_874303 ?auto_874314 ) ) ( not ( = ?auto_874303 ?auto_874315 ) ) ( not ( = ?auto_874304 ?auto_874305 ) ) ( not ( = ?auto_874304 ?auto_874306 ) ) ( not ( = ?auto_874304 ?auto_874307 ) ) ( not ( = ?auto_874304 ?auto_874308 ) ) ( not ( = ?auto_874304 ?auto_874309 ) ) ( not ( = ?auto_874304 ?auto_874310 ) ) ( not ( = ?auto_874304 ?auto_874311 ) ) ( not ( = ?auto_874304 ?auto_874312 ) ) ( not ( = ?auto_874304 ?auto_874313 ) ) ( not ( = ?auto_874304 ?auto_874314 ) ) ( not ( = ?auto_874304 ?auto_874315 ) ) ( not ( = ?auto_874305 ?auto_874306 ) ) ( not ( = ?auto_874305 ?auto_874307 ) ) ( not ( = ?auto_874305 ?auto_874308 ) ) ( not ( = ?auto_874305 ?auto_874309 ) ) ( not ( = ?auto_874305 ?auto_874310 ) ) ( not ( = ?auto_874305 ?auto_874311 ) ) ( not ( = ?auto_874305 ?auto_874312 ) ) ( not ( = ?auto_874305 ?auto_874313 ) ) ( not ( = ?auto_874305 ?auto_874314 ) ) ( not ( = ?auto_874305 ?auto_874315 ) ) ( not ( = ?auto_874306 ?auto_874307 ) ) ( not ( = ?auto_874306 ?auto_874308 ) ) ( not ( = ?auto_874306 ?auto_874309 ) ) ( not ( = ?auto_874306 ?auto_874310 ) ) ( not ( = ?auto_874306 ?auto_874311 ) ) ( not ( = ?auto_874306 ?auto_874312 ) ) ( not ( = ?auto_874306 ?auto_874313 ) ) ( not ( = ?auto_874306 ?auto_874314 ) ) ( not ( = ?auto_874306 ?auto_874315 ) ) ( not ( = ?auto_874307 ?auto_874308 ) ) ( not ( = ?auto_874307 ?auto_874309 ) ) ( not ( = ?auto_874307 ?auto_874310 ) ) ( not ( = ?auto_874307 ?auto_874311 ) ) ( not ( = ?auto_874307 ?auto_874312 ) ) ( not ( = ?auto_874307 ?auto_874313 ) ) ( not ( = ?auto_874307 ?auto_874314 ) ) ( not ( = ?auto_874307 ?auto_874315 ) ) ( not ( = ?auto_874308 ?auto_874309 ) ) ( not ( = ?auto_874308 ?auto_874310 ) ) ( not ( = ?auto_874308 ?auto_874311 ) ) ( not ( = ?auto_874308 ?auto_874312 ) ) ( not ( = ?auto_874308 ?auto_874313 ) ) ( not ( = ?auto_874308 ?auto_874314 ) ) ( not ( = ?auto_874308 ?auto_874315 ) ) ( not ( = ?auto_874309 ?auto_874310 ) ) ( not ( = ?auto_874309 ?auto_874311 ) ) ( not ( = ?auto_874309 ?auto_874312 ) ) ( not ( = ?auto_874309 ?auto_874313 ) ) ( not ( = ?auto_874309 ?auto_874314 ) ) ( not ( = ?auto_874309 ?auto_874315 ) ) ( not ( = ?auto_874310 ?auto_874311 ) ) ( not ( = ?auto_874310 ?auto_874312 ) ) ( not ( = ?auto_874310 ?auto_874313 ) ) ( not ( = ?auto_874310 ?auto_874314 ) ) ( not ( = ?auto_874310 ?auto_874315 ) ) ( not ( = ?auto_874311 ?auto_874312 ) ) ( not ( = ?auto_874311 ?auto_874313 ) ) ( not ( = ?auto_874311 ?auto_874314 ) ) ( not ( = ?auto_874311 ?auto_874315 ) ) ( not ( = ?auto_874312 ?auto_874313 ) ) ( not ( = ?auto_874312 ?auto_874314 ) ) ( not ( = ?auto_874312 ?auto_874315 ) ) ( not ( = ?auto_874313 ?auto_874314 ) ) ( not ( = ?auto_874313 ?auto_874315 ) ) ( not ( = ?auto_874314 ?auto_874315 ) ) ( ON ?auto_874313 ?auto_874314 ) ( ON ?auto_874312 ?auto_874313 ) ( ON ?auto_874311 ?auto_874312 ) ( ON ?auto_874310 ?auto_874311 ) ( ON ?auto_874309 ?auto_874310 ) ( ON ?auto_874308 ?auto_874309 ) ( ON ?auto_874307 ?auto_874308 ) ( ON ?auto_874306 ?auto_874307 ) ( ON ?auto_874305 ?auto_874306 ) ( CLEAR ?auto_874303 ) ( ON ?auto_874304 ?auto_874305 ) ( CLEAR ?auto_874304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_874303 ?auto_874304 )
      ( MAKE-12PILE ?auto_874303 ?auto_874304 ?auto_874305 ?auto_874306 ?auto_874307 ?auto_874308 ?auto_874309 ?auto_874310 ?auto_874311 ?auto_874312 ?auto_874313 ?auto_874314 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_874353 - BLOCK
      ?auto_874354 - BLOCK
      ?auto_874355 - BLOCK
      ?auto_874356 - BLOCK
      ?auto_874357 - BLOCK
      ?auto_874358 - BLOCK
      ?auto_874359 - BLOCK
      ?auto_874360 - BLOCK
      ?auto_874361 - BLOCK
      ?auto_874362 - BLOCK
      ?auto_874363 - BLOCK
      ?auto_874364 - BLOCK
    )
    :vars
    (
      ?auto_874365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_874364 ?auto_874365 ) ( not ( = ?auto_874353 ?auto_874354 ) ) ( not ( = ?auto_874353 ?auto_874355 ) ) ( not ( = ?auto_874353 ?auto_874356 ) ) ( not ( = ?auto_874353 ?auto_874357 ) ) ( not ( = ?auto_874353 ?auto_874358 ) ) ( not ( = ?auto_874353 ?auto_874359 ) ) ( not ( = ?auto_874353 ?auto_874360 ) ) ( not ( = ?auto_874353 ?auto_874361 ) ) ( not ( = ?auto_874353 ?auto_874362 ) ) ( not ( = ?auto_874353 ?auto_874363 ) ) ( not ( = ?auto_874353 ?auto_874364 ) ) ( not ( = ?auto_874353 ?auto_874365 ) ) ( not ( = ?auto_874354 ?auto_874355 ) ) ( not ( = ?auto_874354 ?auto_874356 ) ) ( not ( = ?auto_874354 ?auto_874357 ) ) ( not ( = ?auto_874354 ?auto_874358 ) ) ( not ( = ?auto_874354 ?auto_874359 ) ) ( not ( = ?auto_874354 ?auto_874360 ) ) ( not ( = ?auto_874354 ?auto_874361 ) ) ( not ( = ?auto_874354 ?auto_874362 ) ) ( not ( = ?auto_874354 ?auto_874363 ) ) ( not ( = ?auto_874354 ?auto_874364 ) ) ( not ( = ?auto_874354 ?auto_874365 ) ) ( not ( = ?auto_874355 ?auto_874356 ) ) ( not ( = ?auto_874355 ?auto_874357 ) ) ( not ( = ?auto_874355 ?auto_874358 ) ) ( not ( = ?auto_874355 ?auto_874359 ) ) ( not ( = ?auto_874355 ?auto_874360 ) ) ( not ( = ?auto_874355 ?auto_874361 ) ) ( not ( = ?auto_874355 ?auto_874362 ) ) ( not ( = ?auto_874355 ?auto_874363 ) ) ( not ( = ?auto_874355 ?auto_874364 ) ) ( not ( = ?auto_874355 ?auto_874365 ) ) ( not ( = ?auto_874356 ?auto_874357 ) ) ( not ( = ?auto_874356 ?auto_874358 ) ) ( not ( = ?auto_874356 ?auto_874359 ) ) ( not ( = ?auto_874356 ?auto_874360 ) ) ( not ( = ?auto_874356 ?auto_874361 ) ) ( not ( = ?auto_874356 ?auto_874362 ) ) ( not ( = ?auto_874356 ?auto_874363 ) ) ( not ( = ?auto_874356 ?auto_874364 ) ) ( not ( = ?auto_874356 ?auto_874365 ) ) ( not ( = ?auto_874357 ?auto_874358 ) ) ( not ( = ?auto_874357 ?auto_874359 ) ) ( not ( = ?auto_874357 ?auto_874360 ) ) ( not ( = ?auto_874357 ?auto_874361 ) ) ( not ( = ?auto_874357 ?auto_874362 ) ) ( not ( = ?auto_874357 ?auto_874363 ) ) ( not ( = ?auto_874357 ?auto_874364 ) ) ( not ( = ?auto_874357 ?auto_874365 ) ) ( not ( = ?auto_874358 ?auto_874359 ) ) ( not ( = ?auto_874358 ?auto_874360 ) ) ( not ( = ?auto_874358 ?auto_874361 ) ) ( not ( = ?auto_874358 ?auto_874362 ) ) ( not ( = ?auto_874358 ?auto_874363 ) ) ( not ( = ?auto_874358 ?auto_874364 ) ) ( not ( = ?auto_874358 ?auto_874365 ) ) ( not ( = ?auto_874359 ?auto_874360 ) ) ( not ( = ?auto_874359 ?auto_874361 ) ) ( not ( = ?auto_874359 ?auto_874362 ) ) ( not ( = ?auto_874359 ?auto_874363 ) ) ( not ( = ?auto_874359 ?auto_874364 ) ) ( not ( = ?auto_874359 ?auto_874365 ) ) ( not ( = ?auto_874360 ?auto_874361 ) ) ( not ( = ?auto_874360 ?auto_874362 ) ) ( not ( = ?auto_874360 ?auto_874363 ) ) ( not ( = ?auto_874360 ?auto_874364 ) ) ( not ( = ?auto_874360 ?auto_874365 ) ) ( not ( = ?auto_874361 ?auto_874362 ) ) ( not ( = ?auto_874361 ?auto_874363 ) ) ( not ( = ?auto_874361 ?auto_874364 ) ) ( not ( = ?auto_874361 ?auto_874365 ) ) ( not ( = ?auto_874362 ?auto_874363 ) ) ( not ( = ?auto_874362 ?auto_874364 ) ) ( not ( = ?auto_874362 ?auto_874365 ) ) ( not ( = ?auto_874363 ?auto_874364 ) ) ( not ( = ?auto_874363 ?auto_874365 ) ) ( not ( = ?auto_874364 ?auto_874365 ) ) ( ON ?auto_874363 ?auto_874364 ) ( ON ?auto_874362 ?auto_874363 ) ( ON ?auto_874361 ?auto_874362 ) ( ON ?auto_874360 ?auto_874361 ) ( ON ?auto_874359 ?auto_874360 ) ( ON ?auto_874358 ?auto_874359 ) ( ON ?auto_874357 ?auto_874358 ) ( ON ?auto_874356 ?auto_874357 ) ( ON ?auto_874355 ?auto_874356 ) ( ON ?auto_874354 ?auto_874355 ) ( ON ?auto_874353 ?auto_874354 ) ( CLEAR ?auto_874353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_874353 )
      ( MAKE-12PILE ?auto_874353 ?auto_874354 ?auto_874355 ?auto_874356 ?auto_874357 ?auto_874358 ?auto_874359 ?auto_874360 ?auto_874361 ?auto_874362 ?auto_874363 ?auto_874364 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_874404 - BLOCK
      ?auto_874405 - BLOCK
      ?auto_874406 - BLOCK
      ?auto_874407 - BLOCK
      ?auto_874408 - BLOCK
      ?auto_874409 - BLOCK
      ?auto_874410 - BLOCK
      ?auto_874411 - BLOCK
      ?auto_874412 - BLOCK
      ?auto_874413 - BLOCK
      ?auto_874414 - BLOCK
      ?auto_874415 - BLOCK
      ?auto_874416 - BLOCK
    )
    :vars
    (
      ?auto_874417 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_874415 ) ( ON ?auto_874416 ?auto_874417 ) ( CLEAR ?auto_874416 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_874404 ) ( ON ?auto_874405 ?auto_874404 ) ( ON ?auto_874406 ?auto_874405 ) ( ON ?auto_874407 ?auto_874406 ) ( ON ?auto_874408 ?auto_874407 ) ( ON ?auto_874409 ?auto_874408 ) ( ON ?auto_874410 ?auto_874409 ) ( ON ?auto_874411 ?auto_874410 ) ( ON ?auto_874412 ?auto_874411 ) ( ON ?auto_874413 ?auto_874412 ) ( ON ?auto_874414 ?auto_874413 ) ( ON ?auto_874415 ?auto_874414 ) ( not ( = ?auto_874404 ?auto_874405 ) ) ( not ( = ?auto_874404 ?auto_874406 ) ) ( not ( = ?auto_874404 ?auto_874407 ) ) ( not ( = ?auto_874404 ?auto_874408 ) ) ( not ( = ?auto_874404 ?auto_874409 ) ) ( not ( = ?auto_874404 ?auto_874410 ) ) ( not ( = ?auto_874404 ?auto_874411 ) ) ( not ( = ?auto_874404 ?auto_874412 ) ) ( not ( = ?auto_874404 ?auto_874413 ) ) ( not ( = ?auto_874404 ?auto_874414 ) ) ( not ( = ?auto_874404 ?auto_874415 ) ) ( not ( = ?auto_874404 ?auto_874416 ) ) ( not ( = ?auto_874404 ?auto_874417 ) ) ( not ( = ?auto_874405 ?auto_874406 ) ) ( not ( = ?auto_874405 ?auto_874407 ) ) ( not ( = ?auto_874405 ?auto_874408 ) ) ( not ( = ?auto_874405 ?auto_874409 ) ) ( not ( = ?auto_874405 ?auto_874410 ) ) ( not ( = ?auto_874405 ?auto_874411 ) ) ( not ( = ?auto_874405 ?auto_874412 ) ) ( not ( = ?auto_874405 ?auto_874413 ) ) ( not ( = ?auto_874405 ?auto_874414 ) ) ( not ( = ?auto_874405 ?auto_874415 ) ) ( not ( = ?auto_874405 ?auto_874416 ) ) ( not ( = ?auto_874405 ?auto_874417 ) ) ( not ( = ?auto_874406 ?auto_874407 ) ) ( not ( = ?auto_874406 ?auto_874408 ) ) ( not ( = ?auto_874406 ?auto_874409 ) ) ( not ( = ?auto_874406 ?auto_874410 ) ) ( not ( = ?auto_874406 ?auto_874411 ) ) ( not ( = ?auto_874406 ?auto_874412 ) ) ( not ( = ?auto_874406 ?auto_874413 ) ) ( not ( = ?auto_874406 ?auto_874414 ) ) ( not ( = ?auto_874406 ?auto_874415 ) ) ( not ( = ?auto_874406 ?auto_874416 ) ) ( not ( = ?auto_874406 ?auto_874417 ) ) ( not ( = ?auto_874407 ?auto_874408 ) ) ( not ( = ?auto_874407 ?auto_874409 ) ) ( not ( = ?auto_874407 ?auto_874410 ) ) ( not ( = ?auto_874407 ?auto_874411 ) ) ( not ( = ?auto_874407 ?auto_874412 ) ) ( not ( = ?auto_874407 ?auto_874413 ) ) ( not ( = ?auto_874407 ?auto_874414 ) ) ( not ( = ?auto_874407 ?auto_874415 ) ) ( not ( = ?auto_874407 ?auto_874416 ) ) ( not ( = ?auto_874407 ?auto_874417 ) ) ( not ( = ?auto_874408 ?auto_874409 ) ) ( not ( = ?auto_874408 ?auto_874410 ) ) ( not ( = ?auto_874408 ?auto_874411 ) ) ( not ( = ?auto_874408 ?auto_874412 ) ) ( not ( = ?auto_874408 ?auto_874413 ) ) ( not ( = ?auto_874408 ?auto_874414 ) ) ( not ( = ?auto_874408 ?auto_874415 ) ) ( not ( = ?auto_874408 ?auto_874416 ) ) ( not ( = ?auto_874408 ?auto_874417 ) ) ( not ( = ?auto_874409 ?auto_874410 ) ) ( not ( = ?auto_874409 ?auto_874411 ) ) ( not ( = ?auto_874409 ?auto_874412 ) ) ( not ( = ?auto_874409 ?auto_874413 ) ) ( not ( = ?auto_874409 ?auto_874414 ) ) ( not ( = ?auto_874409 ?auto_874415 ) ) ( not ( = ?auto_874409 ?auto_874416 ) ) ( not ( = ?auto_874409 ?auto_874417 ) ) ( not ( = ?auto_874410 ?auto_874411 ) ) ( not ( = ?auto_874410 ?auto_874412 ) ) ( not ( = ?auto_874410 ?auto_874413 ) ) ( not ( = ?auto_874410 ?auto_874414 ) ) ( not ( = ?auto_874410 ?auto_874415 ) ) ( not ( = ?auto_874410 ?auto_874416 ) ) ( not ( = ?auto_874410 ?auto_874417 ) ) ( not ( = ?auto_874411 ?auto_874412 ) ) ( not ( = ?auto_874411 ?auto_874413 ) ) ( not ( = ?auto_874411 ?auto_874414 ) ) ( not ( = ?auto_874411 ?auto_874415 ) ) ( not ( = ?auto_874411 ?auto_874416 ) ) ( not ( = ?auto_874411 ?auto_874417 ) ) ( not ( = ?auto_874412 ?auto_874413 ) ) ( not ( = ?auto_874412 ?auto_874414 ) ) ( not ( = ?auto_874412 ?auto_874415 ) ) ( not ( = ?auto_874412 ?auto_874416 ) ) ( not ( = ?auto_874412 ?auto_874417 ) ) ( not ( = ?auto_874413 ?auto_874414 ) ) ( not ( = ?auto_874413 ?auto_874415 ) ) ( not ( = ?auto_874413 ?auto_874416 ) ) ( not ( = ?auto_874413 ?auto_874417 ) ) ( not ( = ?auto_874414 ?auto_874415 ) ) ( not ( = ?auto_874414 ?auto_874416 ) ) ( not ( = ?auto_874414 ?auto_874417 ) ) ( not ( = ?auto_874415 ?auto_874416 ) ) ( not ( = ?auto_874415 ?auto_874417 ) ) ( not ( = ?auto_874416 ?auto_874417 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_874416 ?auto_874417 )
      ( !STACK ?auto_874416 ?auto_874415 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_874458 - BLOCK
      ?auto_874459 - BLOCK
      ?auto_874460 - BLOCK
      ?auto_874461 - BLOCK
      ?auto_874462 - BLOCK
      ?auto_874463 - BLOCK
      ?auto_874464 - BLOCK
      ?auto_874465 - BLOCK
      ?auto_874466 - BLOCK
      ?auto_874467 - BLOCK
      ?auto_874468 - BLOCK
      ?auto_874469 - BLOCK
      ?auto_874470 - BLOCK
    )
    :vars
    (
      ?auto_874471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_874470 ?auto_874471 ) ( ON-TABLE ?auto_874458 ) ( ON ?auto_874459 ?auto_874458 ) ( ON ?auto_874460 ?auto_874459 ) ( ON ?auto_874461 ?auto_874460 ) ( ON ?auto_874462 ?auto_874461 ) ( ON ?auto_874463 ?auto_874462 ) ( ON ?auto_874464 ?auto_874463 ) ( ON ?auto_874465 ?auto_874464 ) ( ON ?auto_874466 ?auto_874465 ) ( ON ?auto_874467 ?auto_874466 ) ( ON ?auto_874468 ?auto_874467 ) ( not ( = ?auto_874458 ?auto_874459 ) ) ( not ( = ?auto_874458 ?auto_874460 ) ) ( not ( = ?auto_874458 ?auto_874461 ) ) ( not ( = ?auto_874458 ?auto_874462 ) ) ( not ( = ?auto_874458 ?auto_874463 ) ) ( not ( = ?auto_874458 ?auto_874464 ) ) ( not ( = ?auto_874458 ?auto_874465 ) ) ( not ( = ?auto_874458 ?auto_874466 ) ) ( not ( = ?auto_874458 ?auto_874467 ) ) ( not ( = ?auto_874458 ?auto_874468 ) ) ( not ( = ?auto_874458 ?auto_874469 ) ) ( not ( = ?auto_874458 ?auto_874470 ) ) ( not ( = ?auto_874458 ?auto_874471 ) ) ( not ( = ?auto_874459 ?auto_874460 ) ) ( not ( = ?auto_874459 ?auto_874461 ) ) ( not ( = ?auto_874459 ?auto_874462 ) ) ( not ( = ?auto_874459 ?auto_874463 ) ) ( not ( = ?auto_874459 ?auto_874464 ) ) ( not ( = ?auto_874459 ?auto_874465 ) ) ( not ( = ?auto_874459 ?auto_874466 ) ) ( not ( = ?auto_874459 ?auto_874467 ) ) ( not ( = ?auto_874459 ?auto_874468 ) ) ( not ( = ?auto_874459 ?auto_874469 ) ) ( not ( = ?auto_874459 ?auto_874470 ) ) ( not ( = ?auto_874459 ?auto_874471 ) ) ( not ( = ?auto_874460 ?auto_874461 ) ) ( not ( = ?auto_874460 ?auto_874462 ) ) ( not ( = ?auto_874460 ?auto_874463 ) ) ( not ( = ?auto_874460 ?auto_874464 ) ) ( not ( = ?auto_874460 ?auto_874465 ) ) ( not ( = ?auto_874460 ?auto_874466 ) ) ( not ( = ?auto_874460 ?auto_874467 ) ) ( not ( = ?auto_874460 ?auto_874468 ) ) ( not ( = ?auto_874460 ?auto_874469 ) ) ( not ( = ?auto_874460 ?auto_874470 ) ) ( not ( = ?auto_874460 ?auto_874471 ) ) ( not ( = ?auto_874461 ?auto_874462 ) ) ( not ( = ?auto_874461 ?auto_874463 ) ) ( not ( = ?auto_874461 ?auto_874464 ) ) ( not ( = ?auto_874461 ?auto_874465 ) ) ( not ( = ?auto_874461 ?auto_874466 ) ) ( not ( = ?auto_874461 ?auto_874467 ) ) ( not ( = ?auto_874461 ?auto_874468 ) ) ( not ( = ?auto_874461 ?auto_874469 ) ) ( not ( = ?auto_874461 ?auto_874470 ) ) ( not ( = ?auto_874461 ?auto_874471 ) ) ( not ( = ?auto_874462 ?auto_874463 ) ) ( not ( = ?auto_874462 ?auto_874464 ) ) ( not ( = ?auto_874462 ?auto_874465 ) ) ( not ( = ?auto_874462 ?auto_874466 ) ) ( not ( = ?auto_874462 ?auto_874467 ) ) ( not ( = ?auto_874462 ?auto_874468 ) ) ( not ( = ?auto_874462 ?auto_874469 ) ) ( not ( = ?auto_874462 ?auto_874470 ) ) ( not ( = ?auto_874462 ?auto_874471 ) ) ( not ( = ?auto_874463 ?auto_874464 ) ) ( not ( = ?auto_874463 ?auto_874465 ) ) ( not ( = ?auto_874463 ?auto_874466 ) ) ( not ( = ?auto_874463 ?auto_874467 ) ) ( not ( = ?auto_874463 ?auto_874468 ) ) ( not ( = ?auto_874463 ?auto_874469 ) ) ( not ( = ?auto_874463 ?auto_874470 ) ) ( not ( = ?auto_874463 ?auto_874471 ) ) ( not ( = ?auto_874464 ?auto_874465 ) ) ( not ( = ?auto_874464 ?auto_874466 ) ) ( not ( = ?auto_874464 ?auto_874467 ) ) ( not ( = ?auto_874464 ?auto_874468 ) ) ( not ( = ?auto_874464 ?auto_874469 ) ) ( not ( = ?auto_874464 ?auto_874470 ) ) ( not ( = ?auto_874464 ?auto_874471 ) ) ( not ( = ?auto_874465 ?auto_874466 ) ) ( not ( = ?auto_874465 ?auto_874467 ) ) ( not ( = ?auto_874465 ?auto_874468 ) ) ( not ( = ?auto_874465 ?auto_874469 ) ) ( not ( = ?auto_874465 ?auto_874470 ) ) ( not ( = ?auto_874465 ?auto_874471 ) ) ( not ( = ?auto_874466 ?auto_874467 ) ) ( not ( = ?auto_874466 ?auto_874468 ) ) ( not ( = ?auto_874466 ?auto_874469 ) ) ( not ( = ?auto_874466 ?auto_874470 ) ) ( not ( = ?auto_874466 ?auto_874471 ) ) ( not ( = ?auto_874467 ?auto_874468 ) ) ( not ( = ?auto_874467 ?auto_874469 ) ) ( not ( = ?auto_874467 ?auto_874470 ) ) ( not ( = ?auto_874467 ?auto_874471 ) ) ( not ( = ?auto_874468 ?auto_874469 ) ) ( not ( = ?auto_874468 ?auto_874470 ) ) ( not ( = ?auto_874468 ?auto_874471 ) ) ( not ( = ?auto_874469 ?auto_874470 ) ) ( not ( = ?auto_874469 ?auto_874471 ) ) ( not ( = ?auto_874470 ?auto_874471 ) ) ( CLEAR ?auto_874468 ) ( ON ?auto_874469 ?auto_874470 ) ( CLEAR ?auto_874469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_874458 ?auto_874459 ?auto_874460 ?auto_874461 ?auto_874462 ?auto_874463 ?auto_874464 ?auto_874465 ?auto_874466 ?auto_874467 ?auto_874468 ?auto_874469 )
      ( MAKE-13PILE ?auto_874458 ?auto_874459 ?auto_874460 ?auto_874461 ?auto_874462 ?auto_874463 ?auto_874464 ?auto_874465 ?auto_874466 ?auto_874467 ?auto_874468 ?auto_874469 ?auto_874470 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_874512 - BLOCK
      ?auto_874513 - BLOCK
      ?auto_874514 - BLOCK
      ?auto_874515 - BLOCK
      ?auto_874516 - BLOCK
      ?auto_874517 - BLOCK
      ?auto_874518 - BLOCK
      ?auto_874519 - BLOCK
      ?auto_874520 - BLOCK
      ?auto_874521 - BLOCK
      ?auto_874522 - BLOCK
      ?auto_874523 - BLOCK
      ?auto_874524 - BLOCK
    )
    :vars
    (
      ?auto_874525 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_874524 ?auto_874525 ) ( ON-TABLE ?auto_874512 ) ( ON ?auto_874513 ?auto_874512 ) ( ON ?auto_874514 ?auto_874513 ) ( ON ?auto_874515 ?auto_874514 ) ( ON ?auto_874516 ?auto_874515 ) ( ON ?auto_874517 ?auto_874516 ) ( ON ?auto_874518 ?auto_874517 ) ( ON ?auto_874519 ?auto_874518 ) ( ON ?auto_874520 ?auto_874519 ) ( ON ?auto_874521 ?auto_874520 ) ( not ( = ?auto_874512 ?auto_874513 ) ) ( not ( = ?auto_874512 ?auto_874514 ) ) ( not ( = ?auto_874512 ?auto_874515 ) ) ( not ( = ?auto_874512 ?auto_874516 ) ) ( not ( = ?auto_874512 ?auto_874517 ) ) ( not ( = ?auto_874512 ?auto_874518 ) ) ( not ( = ?auto_874512 ?auto_874519 ) ) ( not ( = ?auto_874512 ?auto_874520 ) ) ( not ( = ?auto_874512 ?auto_874521 ) ) ( not ( = ?auto_874512 ?auto_874522 ) ) ( not ( = ?auto_874512 ?auto_874523 ) ) ( not ( = ?auto_874512 ?auto_874524 ) ) ( not ( = ?auto_874512 ?auto_874525 ) ) ( not ( = ?auto_874513 ?auto_874514 ) ) ( not ( = ?auto_874513 ?auto_874515 ) ) ( not ( = ?auto_874513 ?auto_874516 ) ) ( not ( = ?auto_874513 ?auto_874517 ) ) ( not ( = ?auto_874513 ?auto_874518 ) ) ( not ( = ?auto_874513 ?auto_874519 ) ) ( not ( = ?auto_874513 ?auto_874520 ) ) ( not ( = ?auto_874513 ?auto_874521 ) ) ( not ( = ?auto_874513 ?auto_874522 ) ) ( not ( = ?auto_874513 ?auto_874523 ) ) ( not ( = ?auto_874513 ?auto_874524 ) ) ( not ( = ?auto_874513 ?auto_874525 ) ) ( not ( = ?auto_874514 ?auto_874515 ) ) ( not ( = ?auto_874514 ?auto_874516 ) ) ( not ( = ?auto_874514 ?auto_874517 ) ) ( not ( = ?auto_874514 ?auto_874518 ) ) ( not ( = ?auto_874514 ?auto_874519 ) ) ( not ( = ?auto_874514 ?auto_874520 ) ) ( not ( = ?auto_874514 ?auto_874521 ) ) ( not ( = ?auto_874514 ?auto_874522 ) ) ( not ( = ?auto_874514 ?auto_874523 ) ) ( not ( = ?auto_874514 ?auto_874524 ) ) ( not ( = ?auto_874514 ?auto_874525 ) ) ( not ( = ?auto_874515 ?auto_874516 ) ) ( not ( = ?auto_874515 ?auto_874517 ) ) ( not ( = ?auto_874515 ?auto_874518 ) ) ( not ( = ?auto_874515 ?auto_874519 ) ) ( not ( = ?auto_874515 ?auto_874520 ) ) ( not ( = ?auto_874515 ?auto_874521 ) ) ( not ( = ?auto_874515 ?auto_874522 ) ) ( not ( = ?auto_874515 ?auto_874523 ) ) ( not ( = ?auto_874515 ?auto_874524 ) ) ( not ( = ?auto_874515 ?auto_874525 ) ) ( not ( = ?auto_874516 ?auto_874517 ) ) ( not ( = ?auto_874516 ?auto_874518 ) ) ( not ( = ?auto_874516 ?auto_874519 ) ) ( not ( = ?auto_874516 ?auto_874520 ) ) ( not ( = ?auto_874516 ?auto_874521 ) ) ( not ( = ?auto_874516 ?auto_874522 ) ) ( not ( = ?auto_874516 ?auto_874523 ) ) ( not ( = ?auto_874516 ?auto_874524 ) ) ( not ( = ?auto_874516 ?auto_874525 ) ) ( not ( = ?auto_874517 ?auto_874518 ) ) ( not ( = ?auto_874517 ?auto_874519 ) ) ( not ( = ?auto_874517 ?auto_874520 ) ) ( not ( = ?auto_874517 ?auto_874521 ) ) ( not ( = ?auto_874517 ?auto_874522 ) ) ( not ( = ?auto_874517 ?auto_874523 ) ) ( not ( = ?auto_874517 ?auto_874524 ) ) ( not ( = ?auto_874517 ?auto_874525 ) ) ( not ( = ?auto_874518 ?auto_874519 ) ) ( not ( = ?auto_874518 ?auto_874520 ) ) ( not ( = ?auto_874518 ?auto_874521 ) ) ( not ( = ?auto_874518 ?auto_874522 ) ) ( not ( = ?auto_874518 ?auto_874523 ) ) ( not ( = ?auto_874518 ?auto_874524 ) ) ( not ( = ?auto_874518 ?auto_874525 ) ) ( not ( = ?auto_874519 ?auto_874520 ) ) ( not ( = ?auto_874519 ?auto_874521 ) ) ( not ( = ?auto_874519 ?auto_874522 ) ) ( not ( = ?auto_874519 ?auto_874523 ) ) ( not ( = ?auto_874519 ?auto_874524 ) ) ( not ( = ?auto_874519 ?auto_874525 ) ) ( not ( = ?auto_874520 ?auto_874521 ) ) ( not ( = ?auto_874520 ?auto_874522 ) ) ( not ( = ?auto_874520 ?auto_874523 ) ) ( not ( = ?auto_874520 ?auto_874524 ) ) ( not ( = ?auto_874520 ?auto_874525 ) ) ( not ( = ?auto_874521 ?auto_874522 ) ) ( not ( = ?auto_874521 ?auto_874523 ) ) ( not ( = ?auto_874521 ?auto_874524 ) ) ( not ( = ?auto_874521 ?auto_874525 ) ) ( not ( = ?auto_874522 ?auto_874523 ) ) ( not ( = ?auto_874522 ?auto_874524 ) ) ( not ( = ?auto_874522 ?auto_874525 ) ) ( not ( = ?auto_874523 ?auto_874524 ) ) ( not ( = ?auto_874523 ?auto_874525 ) ) ( not ( = ?auto_874524 ?auto_874525 ) ) ( ON ?auto_874523 ?auto_874524 ) ( CLEAR ?auto_874521 ) ( ON ?auto_874522 ?auto_874523 ) ( CLEAR ?auto_874522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_874512 ?auto_874513 ?auto_874514 ?auto_874515 ?auto_874516 ?auto_874517 ?auto_874518 ?auto_874519 ?auto_874520 ?auto_874521 ?auto_874522 )
      ( MAKE-13PILE ?auto_874512 ?auto_874513 ?auto_874514 ?auto_874515 ?auto_874516 ?auto_874517 ?auto_874518 ?auto_874519 ?auto_874520 ?auto_874521 ?auto_874522 ?auto_874523 ?auto_874524 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_874566 - BLOCK
      ?auto_874567 - BLOCK
      ?auto_874568 - BLOCK
      ?auto_874569 - BLOCK
      ?auto_874570 - BLOCK
      ?auto_874571 - BLOCK
      ?auto_874572 - BLOCK
      ?auto_874573 - BLOCK
      ?auto_874574 - BLOCK
      ?auto_874575 - BLOCK
      ?auto_874576 - BLOCK
      ?auto_874577 - BLOCK
      ?auto_874578 - BLOCK
    )
    :vars
    (
      ?auto_874579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_874578 ?auto_874579 ) ( ON-TABLE ?auto_874566 ) ( ON ?auto_874567 ?auto_874566 ) ( ON ?auto_874568 ?auto_874567 ) ( ON ?auto_874569 ?auto_874568 ) ( ON ?auto_874570 ?auto_874569 ) ( ON ?auto_874571 ?auto_874570 ) ( ON ?auto_874572 ?auto_874571 ) ( ON ?auto_874573 ?auto_874572 ) ( ON ?auto_874574 ?auto_874573 ) ( not ( = ?auto_874566 ?auto_874567 ) ) ( not ( = ?auto_874566 ?auto_874568 ) ) ( not ( = ?auto_874566 ?auto_874569 ) ) ( not ( = ?auto_874566 ?auto_874570 ) ) ( not ( = ?auto_874566 ?auto_874571 ) ) ( not ( = ?auto_874566 ?auto_874572 ) ) ( not ( = ?auto_874566 ?auto_874573 ) ) ( not ( = ?auto_874566 ?auto_874574 ) ) ( not ( = ?auto_874566 ?auto_874575 ) ) ( not ( = ?auto_874566 ?auto_874576 ) ) ( not ( = ?auto_874566 ?auto_874577 ) ) ( not ( = ?auto_874566 ?auto_874578 ) ) ( not ( = ?auto_874566 ?auto_874579 ) ) ( not ( = ?auto_874567 ?auto_874568 ) ) ( not ( = ?auto_874567 ?auto_874569 ) ) ( not ( = ?auto_874567 ?auto_874570 ) ) ( not ( = ?auto_874567 ?auto_874571 ) ) ( not ( = ?auto_874567 ?auto_874572 ) ) ( not ( = ?auto_874567 ?auto_874573 ) ) ( not ( = ?auto_874567 ?auto_874574 ) ) ( not ( = ?auto_874567 ?auto_874575 ) ) ( not ( = ?auto_874567 ?auto_874576 ) ) ( not ( = ?auto_874567 ?auto_874577 ) ) ( not ( = ?auto_874567 ?auto_874578 ) ) ( not ( = ?auto_874567 ?auto_874579 ) ) ( not ( = ?auto_874568 ?auto_874569 ) ) ( not ( = ?auto_874568 ?auto_874570 ) ) ( not ( = ?auto_874568 ?auto_874571 ) ) ( not ( = ?auto_874568 ?auto_874572 ) ) ( not ( = ?auto_874568 ?auto_874573 ) ) ( not ( = ?auto_874568 ?auto_874574 ) ) ( not ( = ?auto_874568 ?auto_874575 ) ) ( not ( = ?auto_874568 ?auto_874576 ) ) ( not ( = ?auto_874568 ?auto_874577 ) ) ( not ( = ?auto_874568 ?auto_874578 ) ) ( not ( = ?auto_874568 ?auto_874579 ) ) ( not ( = ?auto_874569 ?auto_874570 ) ) ( not ( = ?auto_874569 ?auto_874571 ) ) ( not ( = ?auto_874569 ?auto_874572 ) ) ( not ( = ?auto_874569 ?auto_874573 ) ) ( not ( = ?auto_874569 ?auto_874574 ) ) ( not ( = ?auto_874569 ?auto_874575 ) ) ( not ( = ?auto_874569 ?auto_874576 ) ) ( not ( = ?auto_874569 ?auto_874577 ) ) ( not ( = ?auto_874569 ?auto_874578 ) ) ( not ( = ?auto_874569 ?auto_874579 ) ) ( not ( = ?auto_874570 ?auto_874571 ) ) ( not ( = ?auto_874570 ?auto_874572 ) ) ( not ( = ?auto_874570 ?auto_874573 ) ) ( not ( = ?auto_874570 ?auto_874574 ) ) ( not ( = ?auto_874570 ?auto_874575 ) ) ( not ( = ?auto_874570 ?auto_874576 ) ) ( not ( = ?auto_874570 ?auto_874577 ) ) ( not ( = ?auto_874570 ?auto_874578 ) ) ( not ( = ?auto_874570 ?auto_874579 ) ) ( not ( = ?auto_874571 ?auto_874572 ) ) ( not ( = ?auto_874571 ?auto_874573 ) ) ( not ( = ?auto_874571 ?auto_874574 ) ) ( not ( = ?auto_874571 ?auto_874575 ) ) ( not ( = ?auto_874571 ?auto_874576 ) ) ( not ( = ?auto_874571 ?auto_874577 ) ) ( not ( = ?auto_874571 ?auto_874578 ) ) ( not ( = ?auto_874571 ?auto_874579 ) ) ( not ( = ?auto_874572 ?auto_874573 ) ) ( not ( = ?auto_874572 ?auto_874574 ) ) ( not ( = ?auto_874572 ?auto_874575 ) ) ( not ( = ?auto_874572 ?auto_874576 ) ) ( not ( = ?auto_874572 ?auto_874577 ) ) ( not ( = ?auto_874572 ?auto_874578 ) ) ( not ( = ?auto_874572 ?auto_874579 ) ) ( not ( = ?auto_874573 ?auto_874574 ) ) ( not ( = ?auto_874573 ?auto_874575 ) ) ( not ( = ?auto_874573 ?auto_874576 ) ) ( not ( = ?auto_874573 ?auto_874577 ) ) ( not ( = ?auto_874573 ?auto_874578 ) ) ( not ( = ?auto_874573 ?auto_874579 ) ) ( not ( = ?auto_874574 ?auto_874575 ) ) ( not ( = ?auto_874574 ?auto_874576 ) ) ( not ( = ?auto_874574 ?auto_874577 ) ) ( not ( = ?auto_874574 ?auto_874578 ) ) ( not ( = ?auto_874574 ?auto_874579 ) ) ( not ( = ?auto_874575 ?auto_874576 ) ) ( not ( = ?auto_874575 ?auto_874577 ) ) ( not ( = ?auto_874575 ?auto_874578 ) ) ( not ( = ?auto_874575 ?auto_874579 ) ) ( not ( = ?auto_874576 ?auto_874577 ) ) ( not ( = ?auto_874576 ?auto_874578 ) ) ( not ( = ?auto_874576 ?auto_874579 ) ) ( not ( = ?auto_874577 ?auto_874578 ) ) ( not ( = ?auto_874577 ?auto_874579 ) ) ( not ( = ?auto_874578 ?auto_874579 ) ) ( ON ?auto_874577 ?auto_874578 ) ( ON ?auto_874576 ?auto_874577 ) ( CLEAR ?auto_874574 ) ( ON ?auto_874575 ?auto_874576 ) ( CLEAR ?auto_874575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_874566 ?auto_874567 ?auto_874568 ?auto_874569 ?auto_874570 ?auto_874571 ?auto_874572 ?auto_874573 ?auto_874574 ?auto_874575 )
      ( MAKE-13PILE ?auto_874566 ?auto_874567 ?auto_874568 ?auto_874569 ?auto_874570 ?auto_874571 ?auto_874572 ?auto_874573 ?auto_874574 ?auto_874575 ?auto_874576 ?auto_874577 ?auto_874578 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_874620 - BLOCK
      ?auto_874621 - BLOCK
      ?auto_874622 - BLOCK
      ?auto_874623 - BLOCK
      ?auto_874624 - BLOCK
      ?auto_874625 - BLOCK
      ?auto_874626 - BLOCK
      ?auto_874627 - BLOCK
      ?auto_874628 - BLOCK
      ?auto_874629 - BLOCK
      ?auto_874630 - BLOCK
      ?auto_874631 - BLOCK
      ?auto_874632 - BLOCK
    )
    :vars
    (
      ?auto_874633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_874632 ?auto_874633 ) ( ON-TABLE ?auto_874620 ) ( ON ?auto_874621 ?auto_874620 ) ( ON ?auto_874622 ?auto_874621 ) ( ON ?auto_874623 ?auto_874622 ) ( ON ?auto_874624 ?auto_874623 ) ( ON ?auto_874625 ?auto_874624 ) ( ON ?auto_874626 ?auto_874625 ) ( ON ?auto_874627 ?auto_874626 ) ( not ( = ?auto_874620 ?auto_874621 ) ) ( not ( = ?auto_874620 ?auto_874622 ) ) ( not ( = ?auto_874620 ?auto_874623 ) ) ( not ( = ?auto_874620 ?auto_874624 ) ) ( not ( = ?auto_874620 ?auto_874625 ) ) ( not ( = ?auto_874620 ?auto_874626 ) ) ( not ( = ?auto_874620 ?auto_874627 ) ) ( not ( = ?auto_874620 ?auto_874628 ) ) ( not ( = ?auto_874620 ?auto_874629 ) ) ( not ( = ?auto_874620 ?auto_874630 ) ) ( not ( = ?auto_874620 ?auto_874631 ) ) ( not ( = ?auto_874620 ?auto_874632 ) ) ( not ( = ?auto_874620 ?auto_874633 ) ) ( not ( = ?auto_874621 ?auto_874622 ) ) ( not ( = ?auto_874621 ?auto_874623 ) ) ( not ( = ?auto_874621 ?auto_874624 ) ) ( not ( = ?auto_874621 ?auto_874625 ) ) ( not ( = ?auto_874621 ?auto_874626 ) ) ( not ( = ?auto_874621 ?auto_874627 ) ) ( not ( = ?auto_874621 ?auto_874628 ) ) ( not ( = ?auto_874621 ?auto_874629 ) ) ( not ( = ?auto_874621 ?auto_874630 ) ) ( not ( = ?auto_874621 ?auto_874631 ) ) ( not ( = ?auto_874621 ?auto_874632 ) ) ( not ( = ?auto_874621 ?auto_874633 ) ) ( not ( = ?auto_874622 ?auto_874623 ) ) ( not ( = ?auto_874622 ?auto_874624 ) ) ( not ( = ?auto_874622 ?auto_874625 ) ) ( not ( = ?auto_874622 ?auto_874626 ) ) ( not ( = ?auto_874622 ?auto_874627 ) ) ( not ( = ?auto_874622 ?auto_874628 ) ) ( not ( = ?auto_874622 ?auto_874629 ) ) ( not ( = ?auto_874622 ?auto_874630 ) ) ( not ( = ?auto_874622 ?auto_874631 ) ) ( not ( = ?auto_874622 ?auto_874632 ) ) ( not ( = ?auto_874622 ?auto_874633 ) ) ( not ( = ?auto_874623 ?auto_874624 ) ) ( not ( = ?auto_874623 ?auto_874625 ) ) ( not ( = ?auto_874623 ?auto_874626 ) ) ( not ( = ?auto_874623 ?auto_874627 ) ) ( not ( = ?auto_874623 ?auto_874628 ) ) ( not ( = ?auto_874623 ?auto_874629 ) ) ( not ( = ?auto_874623 ?auto_874630 ) ) ( not ( = ?auto_874623 ?auto_874631 ) ) ( not ( = ?auto_874623 ?auto_874632 ) ) ( not ( = ?auto_874623 ?auto_874633 ) ) ( not ( = ?auto_874624 ?auto_874625 ) ) ( not ( = ?auto_874624 ?auto_874626 ) ) ( not ( = ?auto_874624 ?auto_874627 ) ) ( not ( = ?auto_874624 ?auto_874628 ) ) ( not ( = ?auto_874624 ?auto_874629 ) ) ( not ( = ?auto_874624 ?auto_874630 ) ) ( not ( = ?auto_874624 ?auto_874631 ) ) ( not ( = ?auto_874624 ?auto_874632 ) ) ( not ( = ?auto_874624 ?auto_874633 ) ) ( not ( = ?auto_874625 ?auto_874626 ) ) ( not ( = ?auto_874625 ?auto_874627 ) ) ( not ( = ?auto_874625 ?auto_874628 ) ) ( not ( = ?auto_874625 ?auto_874629 ) ) ( not ( = ?auto_874625 ?auto_874630 ) ) ( not ( = ?auto_874625 ?auto_874631 ) ) ( not ( = ?auto_874625 ?auto_874632 ) ) ( not ( = ?auto_874625 ?auto_874633 ) ) ( not ( = ?auto_874626 ?auto_874627 ) ) ( not ( = ?auto_874626 ?auto_874628 ) ) ( not ( = ?auto_874626 ?auto_874629 ) ) ( not ( = ?auto_874626 ?auto_874630 ) ) ( not ( = ?auto_874626 ?auto_874631 ) ) ( not ( = ?auto_874626 ?auto_874632 ) ) ( not ( = ?auto_874626 ?auto_874633 ) ) ( not ( = ?auto_874627 ?auto_874628 ) ) ( not ( = ?auto_874627 ?auto_874629 ) ) ( not ( = ?auto_874627 ?auto_874630 ) ) ( not ( = ?auto_874627 ?auto_874631 ) ) ( not ( = ?auto_874627 ?auto_874632 ) ) ( not ( = ?auto_874627 ?auto_874633 ) ) ( not ( = ?auto_874628 ?auto_874629 ) ) ( not ( = ?auto_874628 ?auto_874630 ) ) ( not ( = ?auto_874628 ?auto_874631 ) ) ( not ( = ?auto_874628 ?auto_874632 ) ) ( not ( = ?auto_874628 ?auto_874633 ) ) ( not ( = ?auto_874629 ?auto_874630 ) ) ( not ( = ?auto_874629 ?auto_874631 ) ) ( not ( = ?auto_874629 ?auto_874632 ) ) ( not ( = ?auto_874629 ?auto_874633 ) ) ( not ( = ?auto_874630 ?auto_874631 ) ) ( not ( = ?auto_874630 ?auto_874632 ) ) ( not ( = ?auto_874630 ?auto_874633 ) ) ( not ( = ?auto_874631 ?auto_874632 ) ) ( not ( = ?auto_874631 ?auto_874633 ) ) ( not ( = ?auto_874632 ?auto_874633 ) ) ( ON ?auto_874631 ?auto_874632 ) ( ON ?auto_874630 ?auto_874631 ) ( ON ?auto_874629 ?auto_874630 ) ( CLEAR ?auto_874627 ) ( ON ?auto_874628 ?auto_874629 ) ( CLEAR ?auto_874628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_874620 ?auto_874621 ?auto_874622 ?auto_874623 ?auto_874624 ?auto_874625 ?auto_874626 ?auto_874627 ?auto_874628 )
      ( MAKE-13PILE ?auto_874620 ?auto_874621 ?auto_874622 ?auto_874623 ?auto_874624 ?auto_874625 ?auto_874626 ?auto_874627 ?auto_874628 ?auto_874629 ?auto_874630 ?auto_874631 ?auto_874632 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_874674 - BLOCK
      ?auto_874675 - BLOCK
      ?auto_874676 - BLOCK
      ?auto_874677 - BLOCK
      ?auto_874678 - BLOCK
      ?auto_874679 - BLOCK
      ?auto_874680 - BLOCK
      ?auto_874681 - BLOCK
      ?auto_874682 - BLOCK
      ?auto_874683 - BLOCK
      ?auto_874684 - BLOCK
      ?auto_874685 - BLOCK
      ?auto_874686 - BLOCK
    )
    :vars
    (
      ?auto_874687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_874686 ?auto_874687 ) ( ON-TABLE ?auto_874674 ) ( ON ?auto_874675 ?auto_874674 ) ( ON ?auto_874676 ?auto_874675 ) ( ON ?auto_874677 ?auto_874676 ) ( ON ?auto_874678 ?auto_874677 ) ( ON ?auto_874679 ?auto_874678 ) ( ON ?auto_874680 ?auto_874679 ) ( not ( = ?auto_874674 ?auto_874675 ) ) ( not ( = ?auto_874674 ?auto_874676 ) ) ( not ( = ?auto_874674 ?auto_874677 ) ) ( not ( = ?auto_874674 ?auto_874678 ) ) ( not ( = ?auto_874674 ?auto_874679 ) ) ( not ( = ?auto_874674 ?auto_874680 ) ) ( not ( = ?auto_874674 ?auto_874681 ) ) ( not ( = ?auto_874674 ?auto_874682 ) ) ( not ( = ?auto_874674 ?auto_874683 ) ) ( not ( = ?auto_874674 ?auto_874684 ) ) ( not ( = ?auto_874674 ?auto_874685 ) ) ( not ( = ?auto_874674 ?auto_874686 ) ) ( not ( = ?auto_874674 ?auto_874687 ) ) ( not ( = ?auto_874675 ?auto_874676 ) ) ( not ( = ?auto_874675 ?auto_874677 ) ) ( not ( = ?auto_874675 ?auto_874678 ) ) ( not ( = ?auto_874675 ?auto_874679 ) ) ( not ( = ?auto_874675 ?auto_874680 ) ) ( not ( = ?auto_874675 ?auto_874681 ) ) ( not ( = ?auto_874675 ?auto_874682 ) ) ( not ( = ?auto_874675 ?auto_874683 ) ) ( not ( = ?auto_874675 ?auto_874684 ) ) ( not ( = ?auto_874675 ?auto_874685 ) ) ( not ( = ?auto_874675 ?auto_874686 ) ) ( not ( = ?auto_874675 ?auto_874687 ) ) ( not ( = ?auto_874676 ?auto_874677 ) ) ( not ( = ?auto_874676 ?auto_874678 ) ) ( not ( = ?auto_874676 ?auto_874679 ) ) ( not ( = ?auto_874676 ?auto_874680 ) ) ( not ( = ?auto_874676 ?auto_874681 ) ) ( not ( = ?auto_874676 ?auto_874682 ) ) ( not ( = ?auto_874676 ?auto_874683 ) ) ( not ( = ?auto_874676 ?auto_874684 ) ) ( not ( = ?auto_874676 ?auto_874685 ) ) ( not ( = ?auto_874676 ?auto_874686 ) ) ( not ( = ?auto_874676 ?auto_874687 ) ) ( not ( = ?auto_874677 ?auto_874678 ) ) ( not ( = ?auto_874677 ?auto_874679 ) ) ( not ( = ?auto_874677 ?auto_874680 ) ) ( not ( = ?auto_874677 ?auto_874681 ) ) ( not ( = ?auto_874677 ?auto_874682 ) ) ( not ( = ?auto_874677 ?auto_874683 ) ) ( not ( = ?auto_874677 ?auto_874684 ) ) ( not ( = ?auto_874677 ?auto_874685 ) ) ( not ( = ?auto_874677 ?auto_874686 ) ) ( not ( = ?auto_874677 ?auto_874687 ) ) ( not ( = ?auto_874678 ?auto_874679 ) ) ( not ( = ?auto_874678 ?auto_874680 ) ) ( not ( = ?auto_874678 ?auto_874681 ) ) ( not ( = ?auto_874678 ?auto_874682 ) ) ( not ( = ?auto_874678 ?auto_874683 ) ) ( not ( = ?auto_874678 ?auto_874684 ) ) ( not ( = ?auto_874678 ?auto_874685 ) ) ( not ( = ?auto_874678 ?auto_874686 ) ) ( not ( = ?auto_874678 ?auto_874687 ) ) ( not ( = ?auto_874679 ?auto_874680 ) ) ( not ( = ?auto_874679 ?auto_874681 ) ) ( not ( = ?auto_874679 ?auto_874682 ) ) ( not ( = ?auto_874679 ?auto_874683 ) ) ( not ( = ?auto_874679 ?auto_874684 ) ) ( not ( = ?auto_874679 ?auto_874685 ) ) ( not ( = ?auto_874679 ?auto_874686 ) ) ( not ( = ?auto_874679 ?auto_874687 ) ) ( not ( = ?auto_874680 ?auto_874681 ) ) ( not ( = ?auto_874680 ?auto_874682 ) ) ( not ( = ?auto_874680 ?auto_874683 ) ) ( not ( = ?auto_874680 ?auto_874684 ) ) ( not ( = ?auto_874680 ?auto_874685 ) ) ( not ( = ?auto_874680 ?auto_874686 ) ) ( not ( = ?auto_874680 ?auto_874687 ) ) ( not ( = ?auto_874681 ?auto_874682 ) ) ( not ( = ?auto_874681 ?auto_874683 ) ) ( not ( = ?auto_874681 ?auto_874684 ) ) ( not ( = ?auto_874681 ?auto_874685 ) ) ( not ( = ?auto_874681 ?auto_874686 ) ) ( not ( = ?auto_874681 ?auto_874687 ) ) ( not ( = ?auto_874682 ?auto_874683 ) ) ( not ( = ?auto_874682 ?auto_874684 ) ) ( not ( = ?auto_874682 ?auto_874685 ) ) ( not ( = ?auto_874682 ?auto_874686 ) ) ( not ( = ?auto_874682 ?auto_874687 ) ) ( not ( = ?auto_874683 ?auto_874684 ) ) ( not ( = ?auto_874683 ?auto_874685 ) ) ( not ( = ?auto_874683 ?auto_874686 ) ) ( not ( = ?auto_874683 ?auto_874687 ) ) ( not ( = ?auto_874684 ?auto_874685 ) ) ( not ( = ?auto_874684 ?auto_874686 ) ) ( not ( = ?auto_874684 ?auto_874687 ) ) ( not ( = ?auto_874685 ?auto_874686 ) ) ( not ( = ?auto_874685 ?auto_874687 ) ) ( not ( = ?auto_874686 ?auto_874687 ) ) ( ON ?auto_874685 ?auto_874686 ) ( ON ?auto_874684 ?auto_874685 ) ( ON ?auto_874683 ?auto_874684 ) ( ON ?auto_874682 ?auto_874683 ) ( CLEAR ?auto_874680 ) ( ON ?auto_874681 ?auto_874682 ) ( CLEAR ?auto_874681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_874674 ?auto_874675 ?auto_874676 ?auto_874677 ?auto_874678 ?auto_874679 ?auto_874680 ?auto_874681 )
      ( MAKE-13PILE ?auto_874674 ?auto_874675 ?auto_874676 ?auto_874677 ?auto_874678 ?auto_874679 ?auto_874680 ?auto_874681 ?auto_874682 ?auto_874683 ?auto_874684 ?auto_874685 ?auto_874686 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_874728 - BLOCK
      ?auto_874729 - BLOCK
      ?auto_874730 - BLOCK
      ?auto_874731 - BLOCK
      ?auto_874732 - BLOCK
      ?auto_874733 - BLOCK
      ?auto_874734 - BLOCK
      ?auto_874735 - BLOCK
      ?auto_874736 - BLOCK
      ?auto_874737 - BLOCK
      ?auto_874738 - BLOCK
      ?auto_874739 - BLOCK
      ?auto_874740 - BLOCK
    )
    :vars
    (
      ?auto_874741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_874740 ?auto_874741 ) ( ON-TABLE ?auto_874728 ) ( ON ?auto_874729 ?auto_874728 ) ( ON ?auto_874730 ?auto_874729 ) ( ON ?auto_874731 ?auto_874730 ) ( ON ?auto_874732 ?auto_874731 ) ( ON ?auto_874733 ?auto_874732 ) ( not ( = ?auto_874728 ?auto_874729 ) ) ( not ( = ?auto_874728 ?auto_874730 ) ) ( not ( = ?auto_874728 ?auto_874731 ) ) ( not ( = ?auto_874728 ?auto_874732 ) ) ( not ( = ?auto_874728 ?auto_874733 ) ) ( not ( = ?auto_874728 ?auto_874734 ) ) ( not ( = ?auto_874728 ?auto_874735 ) ) ( not ( = ?auto_874728 ?auto_874736 ) ) ( not ( = ?auto_874728 ?auto_874737 ) ) ( not ( = ?auto_874728 ?auto_874738 ) ) ( not ( = ?auto_874728 ?auto_874739 ) ) ( not ( = ?auto_874728 ?auto_874740 ) ) ( not ( = ?auto_874728 ?auto_874741 ) ) ( not ( = ?auto_874729 ?auto_874730 ) ) ( not ( = ?auto_874729 ?auto_874731 ) ) ( not ( = ?auto_874729 ?auto_874732 ) ) ( not ( = ?auto_874729 ?auto_874733 ) ) ( not ( = ?auto_874729 ?auto_874734 ) ) ( not ( = ?auto_874729 ?auto_874735 ) ) ( not ( = ?auto_874729 ?auto_874736 ) ) ( not ( = ?auto_874729 ?auto_874737 ) ) ( not ( = ?auto_874729 ?auto_874738 ) ) ( not ( = ?auto_874729 ?auto_874739 ) ) ( not ( = ?auto_874729 ?auto_874740 ) ) ( not ( = ?auto_874729 ?auto_874741 ) ) ( not ( = ?auto_874730 ?auto_874731 ) ) ( not ( = ?auto_874730 ?auto_874732 ) ) ( not ( = ?auto_874730 ?auto_874733 ) ) ( not ( = ?auto_874730 ?auto_874734 ) ) ( not ( = ?auto_874730 ?auto_874735 ) ) ( not ( = ?auto_874730 ?auto_874736 ) ) ( not ( = ?auto_874730 ?auto_874737 ) ) ( not ( = ?auto_874730 ?auto_874738 ) ) ( not ( = ?auto_874730 ?auto_874739 ) ) ( not ( = ?auto_874730 ?auto_874740 ) ) ( not ( = ?auto_874730 ?auto_874741 ) ) ( not ( = ?auto_874731 ?auto_874732 ) ) ( not ( = ?auto_874731 ?auto_874733 ) ) ( not ( = ?auto_874731 ?auto_874734 ) ) ( not ( = ?auto_874731 ?auto_874735 ) ) ( not ( = ?auto_874731 ?auto_874736 ) ) ( not ( = ?auto_874731 ?auto_874737 ) ) ( not ( = ?auto_874731 ?auto_874738 ) ) ( not ( = ?auto_874731 ?auto_874739 ) ) ( not ( = ?auto_874731 ?auto_874740 ) ) ( not ( = ?auto_874731 ?auto_874741 ) ) ( not ( = ?auto_874732 ?auto_874733 ) ) ( not ( = ?auto_874732 ?auto_874734 ) ) ( not ( = ?auto_874732 ?auto_874735 ) ) ( not ( = ?auto_874732 ?auto_874736 ) ) ( not ( = ?auto_874732 ?auto_874737 ) ) ( not ( = ?auto_874732 ?auto_874738 ) ) ( not ( = ?auto_874732 ?auto_874739 ) ) ( not ( = ?auto_874732 ?auto_874740 ) ) ( not ( = ?auto_874732 ?auto_874741 ) ) ( not ( = ?auto_874733 ?auto_874734 ) ) ( not ( = ?auto_874733 ?auto_874735 ) ) ( not ( = ?auto_874733 ?auto_874736 ) ) ( not ( = ?auto_874733 ?auto_874737 ) ) ( not ( = ?auto_874733 ?auto_874738 ) ) ( not ( = ?auto_874733 ?auto_874739 ) ) ( not ( = ?auto_874733 ?auto_874740 ) ) ( not ( = ?auto_874733 ?auto_874741 ) ) ( not ( = ?auto_874734 ?auto_874735 ) ) ( not ( = ?auto_874734 ?auto_874736 ) ) ( not ( = ?auto_874734 ?auto_874737 ) ) ( not ( = ?auto_874734 ?auto_874738 ) ) ( not ( = ?auto_874734 ?auto_874739 ) ) ( not ( = ?auto_874734 ?auto_874740 ) ) ( not ( = ?auto_874734 ?auto_874741 ) ) ( not ( = ?auto_874735 ?auto_874736 ) ) ( not ( = ?auto_874735 ?auto_874737 ) ) ( not ( = ?auto_874735 ?auto_874738 ) ) ( not ( = ?auto_874735 ?auto_874739 ) ) ( not ( = ?auto_874735 ?auto_874740 ) ) ( not ( = ?auto_874735 ?auto_874741 ) ) ( not ( = ?auto_874736 ?auto_874737 ) ) ( not ( = ?auto_874736 ?auto_874738 ) ) ( not ( = ?auto_874736 ?auto_874739 ) ) ( not ( = ?auto_874736 ?auto_874740 ) ) ( not ( = ?auto_874736 ?auto_874741 ) ) ( not ( = ?auto_874737 ?auto_874738 ) ) ( not ( = ?auto_874737 ?auto_874739 ) ) ( not ( = ?auto_874737 ?auto_874740 ) ) ( not ( = ?auto_874737 ?auto_874741 ) ) ( not ( = ?auto_874738 ?auto_874739 ) ) ( not ( = ?auto_874738 ?auto_874740 ) ) ( not ( = ?auto_874738 ?auto_874741 ) ) ( not ( = ?auto_874739 ?auto_874740 ) ) ( not ( = ?auto_874739 ?auto_874741 ) ) ( not ( = ?auto_874740 ?auto_874741 ) ) ( ON ?auto_874739 ?auto_874740 ) ( ON ?auto_874738 ?auto_874739 ) ( ON ?auto_874737 ?auto_874738 ) ( ON ?auto_874736 ?auto_874737 ) ( ON ?auto_874735 ?auto_874736 ) ( CLEAR ?auto_874733 ) ( ON ?auto_874734 ?auto_874735 ) ( CLEAR ?auto_874734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_874728 ?auto_874729 ?auto_874730 ?auto_874731 ?auto_874732 ?auto_874733 ?auto_874734 )
      ( MAKE-13PILE ?auto_874728 ?auto_874729 ?auto_874730 ?auto_874731 ?auto_874732 ?auto_874733 ?auto_874734 ?auto_874735 ?auto_874736 ?auto_874737 ?auto_874738 ?auto_874739 ?auto_874740 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_874782 - BLOCK
      ?auto_874783 - BLOCK
      ?auto_874784 - BLOCK
      ?auto_874785 - BLOCK
      ?auto_874786 - BLOCK
      ?auto_874787 - BLOCK
      ?auto_874788 - BLOCK
      ?auto_874789 - BLOCK
      ?auto_874790 - BLOCK
      ?auto_874791 - BLOCK
      ?auto_874792 - BLOCK
      ?auto_874793 - BLOCK
      ?auto_874794 - BLOCK
    )
    :vars
    (
      ?auto_874795 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_874794 ?auto_874795 ) ( ON-TABLE ?auto_874782 ) ( ON ?auto_874783 ?auto_874782 ) ( ON ?auto_874784 ?auto_874783 ) ( ON ?auto_874785 ?auto_874784 ) ( ON ?auto_874786 ?auto_874785 ) ( not ( = ?auto_874782 ?auto_874783 ) ) ( not ( = ?auto_874782 ?auto_874784 ) ) ( not ( = ?auto_874782 ?auto_874785 ) ) ( not ( = ?auto_874782 ?auto_874786 ) ) ( not ( = ?auto_874782 ?auto_874787 ) ) ( not ( = ?auto_874782 ?auto_874788 ) ) ( not ( = ?auto_874782 ?auto_874789 ) ) ( not ( = ?auto_874782 ?auto_874790 ) ) ( not ( = ?auto_874782 ?auto_874791 ) ) ( not ( = ?auto_874782 ?auto_874792 ) ) ( not ( = ?auto_874782 ?auto_874793 ) ) ( not ( = ?auto_874782 ?auto_874794 ) ) ( not ( = ?auto_874782 ?auto_874795 ) ) ( not ( = ?auto_874783 ?auto_874784 ) ) ( not ( = ?auto_874783 ?auto_874785 ) ) ( not ( = ?auto_874783 ?auto_874786 ) ) ( not ( = ?auto_874783 ?auto_874787 ) ) ( not ( = ?auto_874783 ?auto_874788 ) ) ( not ( = ?auto_874783 ?auto_874789 ) ) ( not ( = ?auto_874783 ?auto_874790 ) ) ( not ( = ?auto_874783 ?auto_874791 ) ) ( not ( = ?auto_874783 ?auto_874792 ) ) ( not ( = ?auto_874783 ?auto_874793 ) ) ( not ( = ?auto_874783 ?auto_874794 ) ) ( not ( = ?auto_874783 ?auto_874795 ) ) ( not ( = ?auto_874784 ?auto_874785 ) ) ( not ( = ?auto_874784 ?auto_874786 ) ) ( not ( = ?auto_874784 ?auto_874787 ) ) ( not ( = ?auto_874784 ?auto_874788 ) ) ( not ( = ?auto_874784 ?auto_874789 ) ) ( not ( = ?auto_874784 ?auto_874790 ) ) ( not ( = ?auto_874784 ?auto_874791 ) ) ( not ( = ?auto_874784 ?auto_874792 ) ) ( not ( = ?auto_874784 ?auto_874793 ) ) ( not ( = ?auto_874784 ?auto_874794 ) ) ( not ( = ?auto_874784 ?auto_874795 ) ) ( not ( = ?auto_874785 ?auto_874786 ) ) ( not ( = ?auto_874785 ?auto_874787 ) ) ( not ( = ?auto_874785 ?auto_874788 ) ) ( not ( = ?auto_874785 ?auto_874789 ) ) ( not ( = ?auto_874785 ?auto_874790 ) ) ( not ( = ?auto_874785 ?auto_874791 ) ) ( not ( = ?auto_874785 ?auto_874792 ) ) ( not ( = ?auto_874785 ?auto_874793 ) ) ( not ( = ?auto_874785 ?auto_874794 ) ) ( not ( = ?auto_874785 ?auto_874795 ) ) ( not ( = ?auto_874786 ?auto_874787 ) ) ( not ( = ?auto_874786 ?auto_874788 ) ) ( not ( = ?auto_874786 ?auto_874789 ) ) ( not ( = ?auto_874786 ?auto_874790 ) ) ( not ( = ?auto_874786 ?auto_874791 ) ) ( not ( = ?auto_874786 ?auto_874792 ) ) ( not ( = ?auto_874786 ?auto_874793 ) ) ( not ( = ?auto_874786 ?auto_874794 ) ) ( not ( = ?auto_874786 ?auto_874795 ) ) ( not ( = ?auto_874787 ?auto_874788 ) ) ( not ( = ?auto_874787 ?auto_874789 ) ) ( not ( = ?auto_874787 ?auto_874790 ) ) ( not ( = ?auto_874787 ?auto_874791 ) ) ( not ( = ?auto_874787 ?auto_874792 ) ) ( not ( = ?auto_874787 ?auto_874793 ) ) ( not ( = ?auto_874787 ?auto_874794 ) ) ( not ( = ?auto_874787 ?auto_874795 ) ) ( not ( = ?auto_874788 ?auto_874789 ) ) ( not ( = ?auto_874788 ?auto_874790 ) ) ( not ( = ?auto_874788 ?auto_874791 ) ) ( not ( = ?auto_874788 ?auto_874792 ) ) ( not ( = ?auto_874788 ?auto_874793 ) ) ( not ( = ?auto_874788 ?auto_874794 ) ) ( not ( = ?auto_874788 ?auto_874795 ) ) ( not ( = ?auto_874789 ?auto_874790 ) ) ( not ( = ?auto_874789 ?auto_874791 ) ) ( not ( = ?auto_874789 ?auto_874792 ) ) ( not ( = ?auto_874789 ?auto_874793 ) ) ( not ( = ?auto_874789 ?auto_874794 ) ) ( not ( = ?auto_874789 ?auto_874795 ) ) ( not ( = ?auto_874790 ?auto_874791 ) ) ( not ( = ?auto_874790 ?auto_874792 ) ) ( not ( = ?auto_874790 ?auto_874793 ) ) ( not ( = ?auto_874790 ?auto_874794 ) ) ( not ( = ?auto_874790 ?auto_874795 ) ) ( not ( = ?auto_874791 ?auto_874792 ) ) ( not ( = ?auto_874791 ?auto_874793 ) ) ( not ( = ?auto_874791 ?auto_874794 ) ) ( not ( = ?auto_874791 ?auto_874795 ) ) ( not ( = ?auto_874792 ?auto_874793 ) ) ( not ( = ?auto_874792 ?auto_874794 ) ) ( not ( = ?auto_874792 ?auto_874795 ) ) ( not ( = ?auto_874793 ?auto_874794 ) ) ( not ( = ?auto_874793 ?auto_874795 ) ) ( not ( = ?auto_874794 ?auto_874795 ) ) ( ON ?auto_874793 ?auto_874794 ) ( ON ?auto_874792 ?auto_874793 ) ( ON ?auto_874791 ?auto_874792 ) ( ON ?auto_874790 ?auto_874791 ) ( ON ?auto_874789 ?auto_874790 ) ( ON ?auto_874788 ?auto_874789 ) ( CLEAR ?auto_874786 ) ( ON ?auto_874787 ?auto_874788 ) ( CLEAR ?auto_874787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_874782 ?auto_874783 ?auto_874784 ?auto_874785 ?auto_874786 ?auto_874787 )
      ( MAKE-13PILE ?auto_874782 ?auto_874783 ?auto_874784 ?auto_874785 ?auto_874786 ?auto_874787 ?auto_874788 ?auto_874789 ?auto_874790 ?auto_874791 ?auto_874792 ?auto_874793 ?auto_874794 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_874836 - BLOCK
      ?auto_874837 - BLOCK
      ?auto_874838 - BLOCK
      ?auto_874839 - BLOCK
      ?auto_874840 - BLOCK
      ?auto_874841 - BLOCK
      ?auto_874842 - BLOCK
      ?auto_874843 - BLOCK
      ?auto_874844 - BLOCK
      ?auto_874845 - BLOCK
      ?auto_874846 - BLOCK
      ?auto_874847 - BLOCK
      ?auto_874848 - BLOCK
    )
    :vars
    (
      ?auto_874849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_874848 ?auto_874849 ) ( ON-TABLE ?auto_874836 ) ( ON ?auto_874837 ?auto_874836 ) ( ON ?auto_874838 ?auto_874837 ) ( ON ?auto_874839 ?auto_874838 ) ( not ( = ?auto_874836 ?auto_874837 ) ) ( not ( = ?auto_874836 ?auto_874838 ) ) ( not ( = ?auto_874836 ?auto_874839 ) ) ( not ( = ?auto_874836 ?auto_874840 ) ) ( not ( = ?auto_874836 ?auto_874841 ) ) ( not ( = ?auto_874836 ?auto_874842 ) ) ( not ( = ?auto_874836 ?auto_874843 ) ) ( not ( = ?auto_874836 ?auto_874844 ) ) ( not ( = ?auto_874836 ?auto_874845 ) ) ( not ( = ?auto_874836 ?auto_874846 ) ) ( not ( = ?auto_874836 ?auto_874847 ) ) ( not ( = ?auto_874836 ?auto_874848 ) ) ( not ( = ?auto_874836 ?auto_874849 ) ) ( not ( = ?auto_874837 ?auto_874838 ) ) ( not ( = ?auto_874837 ?auto_874839 ) ) ( not ( = ?auto_874837 ?auto_874840 ) ) ( not ( = ?auto_874837 ?auto_874841 ) ) ( not ( = ?auto_874837 ?auto_874842 ) ) ( not ( = ?auto_874837 ?auto_874843 ) ) ( not ( = ?auto_874837 ?auto_874844 ) ) ( not ( = ?auto_874837 ?auto_874845 ) ) ( not ( = ?auto_874837 ?auto_874846 ) ) ( not ( = ?auto_874837 ?auto_874847 ) ) ( not ( = ?auto_874837 ?auto_874848 ) ) ( not ( = ?auto_874837 ?auto_874849 ) ) ( not ( = ?auto_874838 ?auto_874839 ) ) ( not ( = ?auto_874838 ?auto_874840 ) ) ( not ( = ?auto_874838 ?auto_874841 ) ) ( not ( = ?auto_874838 ?auto_874842 ) ) ( not ( = ?auto_874838 ?auto_874843 ) ) ( not ( = ?auto_874838 ?auto_874844 ) ) ( not ( = ?auto_874838 ?auto_874845 ) ) ( not ( = ?auto_874838 ?auto_874846 ) ) ( not ( = ?auto_874838 ?auto_874847 ) ) ( not ( = ?auto_874838 ?auto_874848 ) ) ( not ( = ?auto_874838 ?auto_874849 ) ) ( not ( = ?auto_874839 ?auto_874840 ) ) ( not ( = ?auto_874839 ?auto_874841 ) ) ( not ( = ?auto_874839 ?auto_874842 ) ) ( not ( = ?auto_874839 ?auto_874843 ) ) ( not ( = ?auto_874839 ?auto_874844 ) ) ( not ( = ?auto_874839 ?auto_874845 ) ) ( not ( = ?auto_874839 ?auto_874846 ) ) ( not ( = ?auto_874839 ?auto_874847 ) ) ( not ( = ?auto_874839 ?auto_874848 ) ) ( not ( = ?auto_874839 ?auto_874849 ) ) ( not ( = ?auto_874840 ?auto_874841 ) ) ( not ( = ?auto_874840 ?auto_874842 ) ) ( not ( = ?auto_874840 ?auto_874843 ) ) ( not ( = ?auto_874840 ?auto_874844 ) ) ( not ( = ?auto_874840 ?auto_874845 ) ) ( not ( = ?auto_874840 ?auto_874846 ) ) ( not ( = ?auto_874840 ?auto_874847 ) ) ( not ( = ?auto_874840 ?auto_874848 ) ) ( not ( = ?auto_874840 ?auto_874849 ) ) ( not ( = ?auto_874841 ?auto_874842 ) ) ( not ( = ?auto_874841 ?auto_874843 ) ) ( not ( = ?auto_874841 ?auto_874844 ) ) ( not ( = ?auto_874841 ?auto_874845 ) ) ( not ( = ?auto_874841 ?auto_874846 ) ) ( not ( = ?auto_874841 ?auto_874847 ) ) ( not ( = ?auto_874841 ?auto_874848 ) ) ( not ( = ?auto_874841 ?auto_874849 ) ) ( not ( = ?auto_874842 ?auto_874843 ) ) ( not ( = ?auto_874842 ?auto_874844 ) ) ( not ( = ?auto_874842 ?auto_874845 ) ) ( not ( = ?auto_874842 ?auto_874846 ) ) ( not ( = ?auto_874842 ?auto_874847 ) ) ( not ( = ?auto_874842 ?auto_874848 ) ) ( not ( = ?auto_874842 ?auto_874849 ) ) ( not ( = ?auto_874843 ?auto_874844 ) ) ( not ( = ?auto_874843 ?auto_874845 ) ) ( not ( = ?auto_874843 ?auto_874846 ) ) ( not ( = ?auto_874843 ?auto_874847 ) ) ( not ( = ?auto_874843 ?auto_874848 ) ) ( not ( = ?auto_874843 ?auto_874849 ) ) ( not ( = ?auto_874844 ?auto_874845 ) ) ( not ( = ?auto_874844 ?auto_874846 ) ) ( not ( = ?auto_874844 ?auto_874847 ) ) ( not ( = ?auto_874844 ?auto_874848 ) ) ( not ( = ?auto_874844 ?auto_874849 ) ) ( not ( = ?auto_874845 ?auto_874846 ) ) ( not ( = ?auto_874845 ?auto_874847 ) ) ( not ( = ?auto_874845 ?auto_874848 ) ) ( not ( = ?auto_874845 ?auto_874849 ) ) ( not ( = ?auto_874846 ?auto_874847 ) ) ( not ( = ?auto_874846 ?auto_874848 ) ) ( not ( = ?auto_874846 ?auto_874849 ) ) ( not ( = ?auto_874847 ?auto_874848 ) ) ( not ( = ?auto_874847 ?auto_874849 ) ) ( not ( = ?auto_874848 ?auto_874849 ) ) ( ON ?auto_874847 ?auto_874848 ) ( ON ?auto_874846 ?auto_874847 ) ( ON ?auto_874845 ?auto_874846 ) ( ON ?auto_874844 ?auto_874845 ) ( ON ?auto_874843 ?auto_874844 ) ( ON ?auto_874842 ?auto_874843 ) ( ON ?auto_874841 ?auto_874842 ) ( CLEAR ?auto_874839 ) ( ON ?auto_874840 ?auto_874841 ) ( CLEAR ?auto_874840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_874836 ?auto_874837 ?auto_874838 ?auto_874839 ?auto_874840 )
      ( MAKE-13PILE ?auto_874836 ?auto_874837 ?auto_874838 ?auto_874839 ?auto_874840 ?auto_874841 ?auto_874842 ?auto_874843 ?auto_874844 ?auto_874845 ?auto_874846 ?auto_874847 ?auto_874848 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_874890 - BLOCK
      ?auto_874891 - BLOCK
      ?auto_874892 - BLOCK
      ?auto_874893 - BLOCK
      ?auto_874894 - BLOCK
      ?auto_874895 - BLOCK
      ?auto_874896 - BLOCK
      ?auto_874897 - BLOCK
      ?auto_874898 - BLOCK
      ?auto_874899 - BLOCK
      ?auto_874900 - BLOCK
      ?auto_874901 - BLOCK
      ?auto_874902 - BLOCK
    )
    :vars
    (
      ?auto_874903 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_874902 ?auto_874903 ) ( ON-TABLE ?auto_874890 ) ( ON ?auto_874891 ?auto_874890 ) ( ON ?auto_874892 ?auto_874891 ) ( not ( = ?auto_874890 ?auto_874891 ) ) ( not ( = ?auto_874890 ?auto_874892 ) ) ( not ( = ?auto_874890 ?auto_874893 ) ) ( not ( = ?auto_874890 ?auto_874894 ) ) ( not ( = ?auto_874890 ?auto_874895 ) ) ( not ( = ?auto_874890 ?auto_874896 ) ) ( not ( = ?auto_874890 ?auto_874897 ) ) ( not ( = ?auto_874890 ?auto_874898 ) ) ( not ( = ?auto_874890 ?auto_874899 ) ) ( not ( = ?auto_874890 ?auto_874900 ) ) ( not ( = ?auto_874890 ?auto_874901 ) ) ( not ( = ?auto_874890 ?auto_874902 ) ) ( not ( = ?auto_874890 ?auto_874903 ) ) ( not ( = ?auto_874891 ?auto_874892 ) ) ( not ( = ?auto_874891 ?auto_874893 ) ) ( not ( = ?auto_874891 ?auto_874894 ) ) ( not ( = ?auto_874891 ?auto_874895 ) ) ( not ( = ?auto_874891 ?auto_874896 ) ) ( not ( = ?auto_874891 ?auto_874897 ) ) ( not ( = ?auto_874891 ?auto_874898 ) ) ( not ( = ?auto_874891 ?auto_874899 ) ) ( not ( = ?auto_874891 ?auto_874900 ) ) ( not ( = ?auto_874891 ?auto_874901 ) ) ( not ( = ?auto_874891 ?auto_874902 ) ) ( not ( = ?auto_874891 ?auto_874903 ) ) ( not ( = ?auto_874892 ?auto_874893 ) ) ( not ( = ?auto_874892 ?auto_874894 ) ) ( not ( = ?auto_874892 ?auto_874895 ) ) ( not ( = ?auto_874892 ?auto_874896 ) ) ( not ( = ?auto_874892 ?auto_874897 ) ) ( not ( = ?auto_874892 ?auto_874898 ) ) ( not ( = ?auto_874892 ?auto_874899 ) ) ( not ( = ?auto_874892 ?auto_874900 ) ) ( not ( = ?auto_874892 ?auto_874901 ) ) ( not ( = ?auto_874892 ?auto_874902 ) ) ( not ( = ?auto_874892 ?auto_874903 ) ) ( not ( = ?auto_874893 ?auto_874894 ) ) ( not ( = ?auto_874893 ?auto_874895 ) ) ( not ( = ?auto_874893 ?auto_874896 ) ) ( not ( = ?auto_874893 ?auto_874897 ) ) ( not ( = ?auto_874893 ?auto_874898 ) ) ( not ( = ?auto_874893 ?auto_874899 ) ) ( not ( = ?auto_874893 ?auto_874900 ) ) ( not ( = ?auto_874893 ?auto_874901 ) ) ( not ( = ?auto_874893 ?auto_874902 ) ) ( not ( = ?auto_874893 ?auto_874903 ) ) ( not ( = ?auto_874894 ?auto_874895 ) ) ( not ( = ?auto_874894 ?auto_874896 ) ) ( not ( = ?auto_874894 ?auto_874897 ) ) ( not ( = ?auto_874894 ?auto_874898 ) ) ( not ( = ?auto_874894 ?auto_874899 ) ) ( not ( = ?auto_874894 ?auto_874900 ) ) ( not ( = ?auto_874894 ?auto_874901 ) ) ( not ( = ?auto_874894 ?auto_874902 ) ) ( not ( = ?auto_874894 ?auto_874903 ) ) ( not ( = ?auto_874895 ?auto_874896 ) ) ( not ( = ?auto_874895 ?auto_874897 ) ) ( not ( = ?auto_874895 ?auto_874898 ) ) ( not ( = ?auto_874895 ?auto_874899 ) ) ( not ( = ?auto_874895 ?auto_874900 ) ) ( not ( = ?auto_874895 ?auto_874901 ) ) ( not ( = ?auto_874895 ?auto_874902 ) ) ( not ( = ?auto_874895 ?auto_874903 ) ) ( not ( = ?auto_874896 ?auto_874897 ) ) ( not ( = ?auto_874896 ?auto_874898 ) ) ( not ( = ?auto_874896 ?auto_874899 ) ) ( not ( = ?auto_874896 ?auto_874900 ) ) ( not ( = ?auto_874896 ?auto_874901 ) ) ( not ( = ?auto_874896 ?auto_874902 ) ) ( not ( = ?auto_874896 ?auto_874903 ) ) ( not ( = ?auto_874897 ?auto_874898 ) ) ( not ( = ?auto_874897 ?auto_874899 ) ) ( not ( = ?auto_874897 ?auto_874900 ) ) ( not ( = ?auto_874897 ?auto_874901 ) ) ( not ( = ?auto_874897 ?auto_874902 ) ) ( not ( = ?auto_874897 ?auto_874903 ) ) ( not ( = ?auto_874898 ?auto_874899 ) ) ( not ( = ?auto_874898 ?auto_874900 ) ) ( not ( = ?auto_874898 ?auto_874901 ) ) ( not ( = ?auto_874898 ?auto_874902 ) ) ( not ( = ?auto_874898 ?auto_874903 ) ) ( not ( = ?auto_874899 ?auto_874900 ) ) ( not ( = ?auto_874899 ?auto_874901 ) ) ( not ( = ?auto_874899 ?auto_874902 ) ) ( not ( = ?auto_874899 ?auto_874903 ) ) ( not ( = ?auto_874900 ?auto_874901 ) ) ( not ( = ?auto_874900 ?auto_874902 ) ) ( not ( = ?auto_874900 ?auto_874903 ) ) ( not ( = ?auto_874901 ?auto_874902 ) ) ( not ( = ?auto_874901 ?auto_874903 ) ) ( not ( = ?auto_874902 ?auto_874903 ) ) ( ON ?auto_874901 ?auto_874902 ) ( ON ?auto_874900 ?auto_874901 ) ( ON ?auto_874899 ?auto_874900 ) ( ON ?auto_874898 ?auto_874899 ) ( ON ?auto_874897 ?auto_874898 ) ( ON ?auto_874896 ?auto_874897 ) ( ON ?auto_874895 ?auto_874896 ) ( ON ?auto_874894 ?auto_874895 ) ( CLEAR ?auto_874892 ) ( ON ?auto_874893 ?auto_874894 ) ( CLEAR ?auto_874893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_874890 ?auto_874891 ?auto_874892 ?auto_874893 )
      ( MAKE-13PILE ?auto_874890 ?auto_874891 ?auto_874892 ?auto_874893 ?auto_874894 ?auto_874895 ?auto_874896 ?auto_874897 ?auto_874898 ?auto_874899 ?auto_874900 ?auto_874901 ?auto_874902 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_874944 - BLOCK
      ?auto_874945 - BLOCK
      ?auto_874946 - BLOCK
      ?auto_874947 - BLOCK
      ?auto_874948 - BLOCK
      ?auto_874949 - BLOCK
      ?auto_874950 - BLOCK
      ?auto_874951 - BLOCK
      ?auto_874952 - BLOCK
      ?auto_874953 - BLOCK
      ?auto_874954 - BLOCK
      ?auto_874955 - BLOCK
      ?auto_874956 - BLOCK
    )
    :vars
    (
      ?auto_874957 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_874956 ?auto_874957 ) ( ON-TABLE ?auto_874944 ) ( ON ?auto_874945 ?auto_874944 ) ( not ( = ?auto_874944 ?auto_874945 ) ) ( not ( = ?auto_874944 ?auto_874946 ) ) ( not ( = ?auto_874944 ?auto_874947 ) ) ( not ( = ?auto_874944 ?auto_874948 ) ) ( not ( = ?auto_874944 ?auto_874949 ) ) ( not ( = ?auto_874944 ?auto_874950 ) ) ( not ( = ?auto_874944 ?auto_874951 ) ) ( not ( = ?auto_874944 ?auto_874952 ) ) ( not ( = ?auto_874944 ?auto_874953 ) ) ( not ( = ?auto_874944 ?auto_874954 ) ) ( not ( = ?auto_874944 ?auto_874955 ) ) ( not ( = ?auto_874944 ?auto_874956 ) ) ( not ( = ?auto_874944 ?auto_874957 ) ) ( not ( = ?auto_874945 ?auto_874946 ) ) ( not ( = ?auto_874945 ?auto_874947 ) ) ( not ( = ?auto_874945 ?auto_874948 ) ) ( not ( = ?auto_874945 ?auto_874949 ) ) ( not ( = ?auto_874945 ?auto_874950 ) ) ( not ( = ?auto_874945 ?auto_874951 ) ) ( not ( = ?auto_874945 ?auto_874952 ) ) ( not ( = ?auto_874945 ?auto_874953 ) ) ( not ( = ?auto_874945 ?auto_874954 ) ) ( not ( = ?auto_874945 ?auto_874955 ) ) ( not ( = ?auto_874945 ?auto_874956 ) ) ( not ( = ?auto_874945 ?auto_874957 ) ) ( not ( = ?auto_874946 ?auto_874947 ) ) ( not ( = ?auto_874946 ?auto_874948 ) ) ( not ( = ?auto_874946 ?auto_874949 ) ) ( not ( = ?auto_874946 ?auto_874950 ) ) ( not ( = ?auto_874946 ?auto_874951 ) ) ( not ( = ?auto_874946 ?auto_874952 ) ) ( not ( = ?auto_874946 ?auto_874953 ) ) ( not ( = ?auto_874946 ?auto_874954 ) ) ( not ( = ?auto_874946 ?auto_874955 ) ) ( not ( = ?auto_874946 ?auto_874956 ) ) ( not ( = ?auto_874946 ?auto_874957 ) ) ( not ( = ?auto_874947 ?auto_874948 ) ) ( not ( = ?auto_874947 ?auto_874949 ) ) ( not ( = ?auto_874947 ?auto_874950 ) ) ( not ( = ?auto_874947 ?auto_874951 ) ) ( not ( = ?auto_874947 ?auto_874952 ) ) ( not ( = ?auto_874947 ?auto_874953 ) ) ( not ( = ?auto_874947 ?auto_874954 ) ) ( not ( = ?auto_874947 ?auto_874955 ) ) ( not ( = ?auto_874947 ?auto_874956 ) ) ( not ( = ?auto_874947 ?auto_874957 ) ) ( not ( = ?auto_874948 ?auto_874949 ) ) ( not ( = ?auto_874948 ?auto_874950 ) ) ( not ( = ?auto_874948 ?auto_874951 ) ) ( not ( = ?auto_874948 ?auto_874952 ) ) ( not ( = ?auto_874948 ?auto_874953 ) ) ( not ( = ?auto_874948 ?auto_874954 ) ) ( not ( = ?auto_874948 ?auto_874955 ) ) ( not ( = ?auto_874948 ?auto_874956 ) ) ( not ( = ?auto_874948 ?auto_874957 ) ) ( not ( = ?auto_874949 ?auto_874950 ) ) ( not ( = ?auto_874949 ?auto_874951 ) ) ( not ( = ?auto_874949 ?auto_874952 ) ) ( not ( = ?auto_874949 ?auto_874953 ) ) ( not ( = ?auto_874949 ?auto_874954 ) ) ( not ( = ?auto_874949 ?auto_874955 ) ) ( not ( = ?auto_874949 ?auto_874956 ) ) ( not ( = ?auto_874949 ?auto_874957 ) ) ( not ( = ?auto_874950 ?auto_874951 ) ) ( not ( = ?auto_874950 ?auto_874952 ) ) ( not ( = ?auto_874950 ?auto_874953 ) ) ( not ( = ?auto_874950 ?auto_874954 ) ) ( not ( = ?auto_874950 ?auto_874955 ) ) ( not ( = ?auto_874950 ?auto_874956 ) ) ( not ( = ?auto_874950 ?auto_874957 ) ) ( not ( = ?auto_874951 ?auto_874952 ) ) ( not ( = ?auto_874951 ?auto_874953 ) ) ( not ( = ?auto_874951 ?auto_874954 ) ) ( not ( = ?auto_874951 ?auto_874955 ) ) ( not ( = ?auto_874951 ?auto_874956 ) ) ( not ( = ?auto_874951 ?auto_874957 ) ) ( not ( = ?auto_874952 ?auto_874953 ) ) ( not ( = ?auto_874952 ?auto_874954 ) ) ( not ( = ?auto_874952 ?auto_874955 ) ) ( not ( = ?auto_874952 ?auto_874956 ) ) ( not ( = ?auto_874952 ?auto_874957 ) ) ( not ( = ?auto_874953 ?auto_874954 ) ) ( not ( = ?auto_874953 ?auto_874955 ) ) ( not ( = ?auto_874953 ?auto_874956 ) ) ( not ( = ?auto_874953 ?auto_874957 ) ) ( not ( = ?auto_874954 ?auto_874955 ) ) ( not ( = ?auto_874954 ?auto_874956 ) ) ( not ( = ?auto_874954 ?auto_874957 ) ) ( not ( = ?auto_874955 ?auto_874956 ) ) ( not ( = ?auto_874955 ?auto_874957 ) ) ( not ( = ?auto_874956 ?auto_874957 ) ) ( ON ?auto_874955 ?auto_874956 ) ( ON ?auto_874954 ?auto_874955 ) ( ON ?auto_874953 ?auto_874954 ) ( ON ?auto_874952 ?auto_874953 ) ( ON ?auto_874951 ?auto_874952 ) ( ON ?auto_874950 ?auto_874951 ) ( ON ?auto_874949 ?auto_874950 ) ( ON ?auto_874948 ?auto_874949 ) ( ON ?auto_874947 ?auto_874948 ) ( CLEAR ?auto_874945 ) ( ON ?auto_874946 ?auto_874947 ) ( CLEAR ?auto_874946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_874944 ?auto_874945 ?auto_874946 )
      ( MAKE-13PILE ?auto_874944 ?auto_874945 ?auto_874946 ?auto_874947 ?auto_874948 ?auto_874949 ?auto_874950 ?auto_874951 ?auto_874952 ?auto_874953 ?auto_874954 ?auto_874955 ?auto_874956 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_874998 - BLOCK
      ?auto_874999 - BLOCK
      ?auto_875000 - BLOCK
      ?auto_875001 - BLOCK
      ?auto_875002 - BLOCK
      ?auto_875003 - BLOCK
      ?auto_875004 - BLOCK
      ?auto_875005 - BLOCK
      ?auto_875006 - BLOCK
      ?auto_875007 - BLOCK
      ?auto_875008 - BLOCK
      ?auto_875009 - BLOCK
      ?auto_875010 - BLOCK
    )
    :vars
    (
      ?auto_875011 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_875010 ?auto_875011 ) ( ON-TABLE ?auto_874998 ) ( not ( = ?auto_874998 ?auto_874999 ) ) ( not ( = ?auto_874998 ?auto_875000 ) ) ( not ( = ?auto_874998 ?auto_875001 ) ) ( not ( = ?auto_874998 ?auto_875002 ) ) ( not ( = ?auto_874998 ?auto_875003 ) ) ( not ( = ?auto_874998 ?auto_875004 ) ) ( not ( = ?auto_874998 ?auto_875005 ) ) ( not ( = ?auto_874998 ?auto_875006 ) ) ( not ( = ?auto_874998 ?auto_875007 ) ) ( not ( = ?auto_874998 ?auto_875008 ) ) ( not ( = ?auto_874998 ?auto_875009 ) ) ( not ( = ?auto_874998 ?auto_875010 ) ) ( not ( = ?auto_874998 ?auto_875011 ) ) ( not ( = ?auto_874999 ?auto_875000 ) ) ( not ( = ?auto_874999 ?auto_875001 ) ) ( not ( = ?auto_874999 ?auto_875002 ) ) ( not ( = ?auto_874999 ?auto_875003 ) ) ( not ( = ?auto_874999 ?auto_875004 ) ) ( not ( = ?auto_874999 ?auto_875005 ) ) ( not ( = ?auto_874999 ?auto_875006 ) ) ( not ( = ?auto_874999 ?auto_875007 ) ) ( not ( = ?auto_874999 ?auto_875008 ) ) ( not ( = ?auto_874999 ?auto_875009 ) ) ( not ( = ?auto_874999 ?auto_875010 ) ) ( not ( = ?auto_874999 ?auto_875011 ) ) ( not ( = ?auto_875000 ?auto_875001 ) ) ( not ( = ?auto_875000 ?auto_875002 ) ) ( not ( = ?auto_875000 ?auto_875003 ) ) ( not ( = ?auto_875000 ?auto_875004 ) ) ( not ( = ?auto_875000 ?auto_875005 ) ) ( not ( = ?auto_875000 ?auto_875006 ) ) ( not ( = ?auto_875000 ?auto_875007 ) ) ( not ( = ?auto_875000 ?auto_875008 ) ) ( not ( = ?auto_875000 ?auto_875009 ) ) ( not ( = ?auto_875000 ?auto_875010 ) ) ( not ( = ?auto_875000 ?auto_875011 ) ) ( not ( = ?auto_875001 ?auto_875002 ) ) ( not ( = ?auto_875001 ?auto_875003 ) ) ( not ( = ?auto_875001 ?auto_875004 ) ) ( not ( = ?auto_875001 ?auto_875005 ) ) ( not ( = ?auto_875001 ?auto_875006 ) ) ( not ( = ?auto_875001 ?auto_875007 ) ) ( not ( = ?auto_875001 ?auto_875008 ) ) ( not ( = ?auto_875001 ?auto_875009 ) ) ( not ( = ?auto_875001 ?auto_875010 ) ) ( not ( = ?auto_875001 ?auto_875011 ) ) ( not ( = ?auto_875002 ?auto_875003 ) ) ( not ( = ?auto_875002 ?auto_875004 ) ) ( not ( = ?auto_875002 ?auto_875005 ) ) ( not ( = ?auto_875002 ?auto_875006 ) ) ( not ( = ?auto_875002 ?auto_875007 ) ) ( not ( = ?auto_875002 ?auto_875008 ) ) ( not ( = ?auto_875002 ?auto_875009 ) ) ( not ( = ?auto_875002 ?auto_875010 ) ) ( not ( = ?auto_875002 ?auto_875011 ) ) ( not ( = ?auto_875003 ?auto_875004 ) ) ( not ( = ?auto_875003 ?auto_875005 ) ) ( not ( = ?auto_875003 ?auto_875006 ) ) ( not ( = ?auto_875003 ?auto_875007 ) ) ( not ( = ?auto_875003 ?auto_875008 ) ) ( not ( = ?auto_875003 ?auto_875009 ) ) ( not ( = ?auto_875003 ?auto_875010 ) ) ( not ( = ?auto_875003 ?auto_875011 ) ) ( not ( = ?auto_875004 ?auto_875005 ) ) ( not ( = ?auto_875004 ?auto_875006 ) ) ( not ( = ?auto_875004 ?auto_875007 ) ) ( not ( = ?auto_875004 ?auto_875008 ) ) ( not ( = ?auto_875004 ?auto_875009 ) ) ( not ( = ?auto_875004 ?auto_875010 ) ) ( not ( = ?auto_875004 ?auto_875011 ) ) ( not ( = ?auto_875005 ?auto_875006 ) ) ( not ( = ?auto_875005 ?auto_875007 ) ) ( not ( = ?auto_875005 ?auto_875008 ) ) ( not ( = ?auto_875005 ?auto_875009 ) ) ( not ( = ?auto_875005 ?auto_875010 ) ) ( not ( = ?auto_875005 ?auto_875011 ) ) ( not ( = ?auto_875006 ?auto_875007 ) ) ( not ( = ?auto_875006 ?auto_875008 ) ) ( not ( = ?auto_875006 ?auto_875009 ) ) ( not ( = ?auto_875006 ?auto_875010 ) ) ( not ( = ?auto_875006 ?auto_875011 ) ) ( not ( = ?auto_875007 ?auto_875008 ) ) ( not ( = ?auto_875007 ?auto_875009 ) ) ( not ( = ?auto_875007 ?auto_875010 ) ) ( not ( = ?auto_875007 ?auto_875011 ) ) ( not ( = ?auto_875008 ?auto_875009 ) ) ( not ( = ?auto_875008 ?auto_875010 ) ) ( not ( = ?auto_875008 ?auto_875011 ) ) ( not ( = ?auto_875009 ?auto_875010 ) ) ( not ( = ?auto_875009 ?auto_875011 ) ) ( not ( = ?auto_875010 ?auto_875011 ) ) ( ON ?auto_875009 ?auto_875010 ) ( ON ?auto_875008 ?auto_875009 ) ( ON ?auto_875007 ?auto_875008 ) ( ON ?auto_875006 ?auto_875007 ) ( ON ?auto_875005 ?auto_875006 ) ( ON ?auto_875004 ?auto_875005 ) ( ON ?auto_875003 ?auto_875004 ) ( ON ?auto_875002 ?auto_875003 ) ( ON ?auto_875001 ?auto_875002 ) ( ON ?auto_875000 ?auto_875001 ) ( CLEAR ?auto_874998 ) ( ON ?auto_874999 ?auto_875000 ) ( CLEAR ?auto_874999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_874998 ?auto_874999 )
      ( MAKE-13PILE ?auto_874998 ?auto_874999 ?auto_875000 ?auto_875001 ?auto_875002 ?auto_875003 ?auto_875004 ?auto_875005 ?auto_875006 ?auto_875007 ?auto_875008 ?auto_875009 ?auto_875010 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_875052 - BLOCK
      ?auto_875053 - BLOCK
      ?auto_875054 - BLOCK
      ?auto_875055 - BLOCK
      ?auto_875056 - BLOCK
      ?auto_875057 - BLOCK
      ?auto_875058 - BLOCK
      ?auto_875059 - BLOCK
      ?auto_875060 - BLOCK
      ?auto_875061 - BLOCK
      ?auto_875062 - BLOCK
      ?auto_875063 - BLOCK
      ?auto_875064 - BLOCK
    )
    :vars
    (
      ?auto_875065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_875064 ?auto_875065 ) ( not ( = ?auto_875052 ?auto_875053 ) ) ( not ( = ?auto_875052 ?auto_875054 ) ) ( not ( = ?auto_875052 ?auto_875055 ) ) ( not ( = ?auto_875052 ?auto_875056 ) ) ( not ( = ?auto_875052 ?auto_875057 ) ) ( not ( = ?auto_875052 ?auto_875058 ) ) ( not ( = ?auto_875052 ?auto_875059 ) ) ( not ( = ?auto_875052 ?auto_875060 ) ) ( not ( = ?auto_875052 ?auto_875061 ) ) ( not ( = ?auto_875052 ?auto_875062 ) ) ( not ( = ?auto_875052 ?auto_875063 ) ) ( not ( = ?auto_875052 ?auto_875064 ) ) ( not ( = ?auto_875052 ?auto_875065 ) ) ( not ( = ?auto_875053 ?auto_875054 ) ) ( not ( = ?auto_875053 ?auto_875055 ) ) ( not ( = ?auto_875053 ?auto_875056 ) ) ( not ( = ?auto_875053 ?auto_875057 ) ) ( not ( = ?auto_875053 ?auto_875058 ) ) ( not ( = ?auto_875053 ?auto_875059 ) ) ( not ( = ?auto_875053 ?auto_875060 ) ) ( not ( = ?auto_875053 ?auto_875061 ) ) ( not ( = ?auto_875053 ?auto_875062 ) ) ( not ( = ?auto_875053 ?auto_875063 ) ) ( not ( = ?auto_875053 ?auto_875064 ) ) ( not ( = ?auto_875053 ?auto_875065 ) ) ( not ( = ?auto_875054 ?auto_875055 ) ) ( not ( = ?auto_875054 ?auto_875056 ) ) ( not ( = ?auto_875054 ?auto_875057 ) ) ( not ( = ?auto_875054 ?auto_875058 ) ) ( not ( = ?auto_875054 ?auto_875059 ) ) ( not ( = ?auto_875054 ?auto_875060 ) ) ( not ( = ?auto_875054 ?auto_875061 ) ) ( not ( = ?auto_875054 ?auto_875062 ) ) ( not ( = ?auto_875054 ?auto_875063 ) ) ( not ( = ?auto_875054 ?auto_875064 ) ) ( not ( = ?auto_875054 ?auto_875065 ) ) ( not ( = ?auto_875055 ?auto_875056 ) ) ( not ( = ?auto_875055 ?auto_875057 ) ) ( not ( = ?auto_875055 ?auto_875058 ) ) ( not ( = ?auto_875055 ?auto_875059 ) ) ( not ( = ?auto_875055 ?auto_875060 ) ) ( not ( = ?auto_875055 ?auto_875061 ) ) ( not ( = ?auto_875055 ?auto_875062 ) ) ( not ( = ?auto_875055 ?auto_875063 ) ) ( not ( = ?auto_875055 ?auto_875064 ) ) ( not ( = ?auto_875055 ?auto_875065 ) ) ( not ( = ?auto_875056 ?auto_875057 ) ) ( not ( = ?auto_875056 ?auto_875058 ) ) ( not ( = ?auto_875056 ?auto_875059 ) ) ( not ( = ?auto_875056 ?auto_875060 ) ) ( not ( = ?auto_875056 ?auto_875061 ) ) ( not ( = ?auto_875056 ?auto_875062 ) ) ( not ( = ?auto_875056 ?auto_875063 ) ) ( not ( = ?auto_875056 ?auto_875064 ) ) ( not ( = ?auto_875056 ?auto_875065 ) ) ( not ( = ?auto_875057 ?auto_875058 ) ) ( not ( = ?auto_875057 ?auto_875059 ) ) ( not ( = ?auto_875057 ?auto_875060 ) ) ( not ( = ?auto_875057 ?auto_875061 ) ) ( not ( = ?auto_875057 ?auto_875062 ) ) ( not ( = ?auto_875057 ?auto_875063 ) ) ( not ( = ?auto_875057 ?auto_875064 ) ) ( not ( = ?auto_875057 ?auto_875065 ) ) ( not ( = ?auto_875058 ?auto_875059 ) ) ( not ( = ?auto_875058 ?auto_875060 ) ) ( not ( = ?auto_875058 ?auto_875061 ) ) ( not ( = ?auto_875058 ?auto_875062 ) ) ( not ( = ?auto_875058 ?auto_875063 ) ) ( not ( = ?auto_875058 ?auto_875064 ) ) ( not ( = ?auto_875058 ?auto_875065 ) ) ( not ( = ?auto_875059 ?auto_875060 ) ) ( not ( = ?auto_875059 ?auto_875061 ) ) ( not ( = ?auto_875059 ?auto_875062 ) ) ( not ( = ?auto_875059 ?auto_875063 ) ) ( not ( = ?auto_875059 ?auto_875064 ) ) ( not ( = ?auto_875059 ?auto_875065 ) ) ( not ( = ?auto_875060 ?auto_875061 ) ) ( not ( = ?auto_875060 ?auto_875062 ) ) ( not ( = ?auto_875060 ?auto_875063 ) ) ( not ( = ?auto_875060 ?auto_875064 ) ) ( not ( = ?auto_875060 ?auto_875065 ) ) ( not ( = ?auto_875061 ?auto_875062 ) ) ( not ( = ?auto_875061 ?auto_875063 ) ) ( not ( = ?auto_875061 ?auto_875064 ) ) ( not ( = ?auto_875061 ?auto_875065 ) ) ( not ( = ?auto_875062 ?auto_875063 ) ) ( not ( = ?auto_875062 ?auto_875064 ) ) ( not ( = ?auto_875062 ?auto_875065 ) ) ( not ( = ?auto_875063 ?auto_875064 ) ) ( not ( = ?auto_875063 ?auto_875065 ) ) ( not ( = ?auto_875064 ?auto_875065 ) ) ( ON ?auto_875063 ?auto_875064 ) ( ON ?auto_875062 ?auto_875063 ) ( ON ?auto_875061 ?auto_875062 ) ( ON ?auto_875060 ?auto_875061 ) ( ON ?auto_875059 ?auto_875060 ) ( ON ?auto_875058 ?auto_875059 ) ( ON ?auto_875057 ?auto_875058 ) ( ON ?auto_875056 ?auto_875057 ) ( ON ?auto_875055 ?auto_875056 ) ( ON ?auto_875054 ?auto_875055 ) ( ON ?auto_875053 ?auto_875054 ) ( ON ?auto_875052 ?auto_875053 ) ( CLEAR ?auto_875052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_875052 )
      ( MAKE-13PILE ?auto_875052 ?auto_875053 ?auto_875054 ?auto_875055 ?auto_875056 ?auto_875057 ?auto_875058 ?auto_875059 ?auto_875060 ?auto_875061 ?auto_875062 ?auto_875063 ?auto_875064 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_875107 - BLOCK
      ?auto_875108 - BLOCK
      ?auto_875109 - BLOCK
      ?auto_875110 - BLOCK
      ?auto_875111 - BLOCK
      ?auto_875112 - BLOCK
      ?auto_875113 - BLOCK
      ?auto_875114 - BLOCK
      ?auto_875115 - BLOCK
      ?auto_875116 - BLOCK
      ?auto_875117 - BLOCK
      ?auto_875118 - BLOCK
      ?auto_875119 - BLOCK
      ?auto_875120 - BLOCK
    )
    :vars
    (
      ?auto_875121 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_875119 ) ( ON ?auto_875120 ?auto_875121 ) ( CLEAR ?auto_875120 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_875107 ) ( ON ?auto_875108 ?auto_875107 ) ( ON ?auto_875109 ?auto_875108 ) ( ON ?auto_875110 ?auto_875109 ) ( ON ?auto_875111 ?auto_875110 ) ( ON ?auto_875112 ?auto_875111 ) ( ON ?auto_875113 ?auto_875112 ) ( ON ?auto_875114 ?auto_875113 ) ( ON ?auto_875115 ?auto_875114 ) ( ON ?auto_875116 ?auto_875115 ) ( ON ?auto_875117 ?auto_875116 ) ( ON ?auto_875118 ?auto_875117 ) ( ON ?auto_875119 ?auto_875118 ) ( not ( = ?auto_875107 ?auto_875108 ) ) ( not ( = ?auto_875107 ?auto_875109 ) ) ( not ( = ?auto_875107 ?auto_875110 ) ) ( not ( = ?auto_875107 ?auto_875111 ) ) ( not ( = ?auto_875107 ?auto_875112 ) ) ( not ( = ?auto_875107 ?auto_875113 ) ) ( not ( = ?auto_875107 ?auto_875114 ) ) ( not ( = ?auto_875107 ?auto_875115 ) ) ( not ( = ?auto_875107 ?auto_875116 ) ) ( not ( = ?auto_875107 ?auto_875117 ) ) ( not ( = ?auto_875107 ?auto_875118 ) ) ( not ( = ?auto_875107 ?auto_875119 ) ) ( not ( = ?auto_875107 ?auto_875120 ) ) ( not ( = ?auto_875107 ?auto_875121 ) ) ( not ( = ?auto_875108 ?auto_875109 ) ) ( not ( = ?auto_875108 ?auto_875110 ) ) ( not ( = ?auto_875108 ?auto_875111 ) ) ( not ( = ?auto_875108 ?auto_875112 ) ) ( not ( = ?auto_875108 ?auto_875113 ) ) ( not ( = ?auto_875108 ?auto_875114 ) ) ( not ( = ?auto_875108 ?auto_875115 ) ) ( not ( = ?auto_875108 ?auto_875116 ) ) ( not ( = ?auto_875108 ?auto_875117 ) ) ( not ( = ?auto_875108 ?auto_875118 ) ) ( not ( = ?auto_875108 ?auto_875119 ) ) ( not ( = ?auto_875108 ?auto_875120 ) ) ( not ( = ?auto_875108 ?auto_875121 ) ) ( not ( = ?auto_875109 ?auto_875110 ) ) ( not ( = ?auto_875109 ?auto_875111 ) ) ( not ( = ?auto_875109 ?auto_875112 ) ) ( not ( = ?auto_875109 ?auto_875113 ) ) ( not ( = ?auto_875109 ?auto_875114 ) ) ( not ( = ?auto_875109 ?auto_875115 ) ) ( not ( = ?auto_875109 ?auto_875116 ) ) ( not ( = ?auto_875109 ?auto_875117 ) ) ( not ( = ?auto_875109 ?auto_875118 ) ) ( not ( = ?auto_875109 ?auto_875119 ) ) ( not ( = ?auto_875109 ?auto_875120 ) ) ( not ( = ?auto_875109 ?auto_875121 ) ) ( not ( = ?auto_875110 ?auto_875111 ) ) ( not ( = ?auto_875110 ?auto_875112 ) ) ( not ( = ?auto_875110 ?auto_875113 ) ) ( not ( = ?auto_875110 ?auto_875114 ) ) ( not ( = ?auto_875110 ?auto_875115 ) ) ( not ( = ?auto_875110 ?auto_875116 ) ) ( not ( = ?auto_875110 ?auto_875117 ) ) ( not ( = ?auto_875110 ?auto_875118 ) ) ( not ( = ?auto_875110 ?auto_875119 ) ) ( not ( = ?auto_875110 ?auto_875120 ) ) ( not ( = ?auto_875110 ?auto_875121 ) ) ( not ( = ?auto_875111 ?auto_875112 ) ) ( not ( = ?auto_875111 ?auto_875113 ) ) ( not ( = ?auto_875111 ?auto_875114 ) ) ( not ( = ?auto_875111 ?auto_875115 ) ) ( not ( = ?auto_875111 ?auto_875116 ) ) ( not ( = ?auto_875111 ?auto_875117 ) ) ( not ( = ?auto_875111 ?auto_875118 ) ) ( not ( = ?auto_875111 ?auto_875119 ) ) ( not ( = ?auto_875111 ?auto_875120 ) ) ( not ( = ?auto_875111 ?auto_875121 ) ) ( not ( = ?auto_875112 ?auto_875113 ) ) ( not ( = ?auto_875112 ?auto_875114 ) ) ( not ( = ?auto_875112 ?auto_875115 ) ) ( not ( = ?auto_875112 ?auto_875116 ) ) ( not ( = ?auto_875112 ?auto_875117 ) ) ( not ( = ?auto_875112 ?auto_875118 ) ) ( not ( = ?auto_875112 ?auto_875119 ) ) ( not ( = ?auto_875112 ?auto_875120 ) ) ( not ( = ?auto_875112 ?auto_875121 ) ) ( not ( = ?auto_875113 ?auto_875114 ) ) ( not ( = ?auto_875113 ?auto_875115 ) ) ( not ( = ?auto_875113 ?auto_875116 ) ) ( not ( = ?auto_875113 ?auto_875117 ) ) ( not ( = ?auto_875113 ?auto_875118 ) ) ( not ( = ?auto_875113 ?auto_875119 ) ) ( not ( = ?auto_875113 ?auto_875120 ) ) ( not ( = ?auto_875113 ?auto_875121 ) ) ( not ( = ?auto_875114 ?auto_875115 ) ) ( not ( = ?auto_875114 ?auto_875116 ) ) ( not ( = ?auto_875114 ?auto_875117 ) ) ( not ( = ?auto_875114 ?auto_875118 ) ) ( not ( = ?auto_875114 ?auto_875119 ) ) ( not ( = ?auto_875114 ?auto_875120 ) ) ( not ( = ?auto_875114 ?auto_875121 ) ) ( not ( = ?auto_875115 ?auto_875116 ) ) ( not ( = ?auto_875115 ?auto_875117 ) ) ( not ( = ?auto_875115 ?auto_875118 ) ) ( not ( = ?auto_875115 ?auto_875119 ) ) ( not ( = ?auto_875115 ?auto_875120 ) ) ( not ( = ?auto_875115 ?auto_875121 ) ) ( not ( = ?auto_875116 ?auto_875117 ) ) ( not ( = ?auto_875116 ?auto_875118 ) ) ( not ( = ?auto_875116 ?auto_875119 ) ) ( not ( = ?auto_875116 ?auto_875120 ) ) ( not ( = ?auto_875116 ?auto_875121 ) ) ( not ( = ?auto_875117 ?auto_875118 ) ) ( not ( = ?auto_875117 ?auto_875119 ) ) ( not ( = ?auto_875117 ?auto_875120 ) ) ( not ( = ?auto_875117 ?auto_875121 ) ) ( not ( = ?auto_875118 ?auto_875119 ) ) ( not ( = ?auto_875118 ?auto_875120 ) ) ( not ( = ?auto_875118 ?auto_875121 ) ) ( not ( = ?auto_875119 ?auto_875120 ) ) ( not ( = ?auto_875119 ?auto_875121 ) ) ( not ( = ?auto_875120 ?auto_875121 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_875120 ?auto_875121 )
      ( !STACK ?auto_875120 ?auto_875119 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_875165 - BLOCK
      ?auto_875166 - BLOCK
      ?auto_875167 - BLOCK
      ?auto_875168 - BLOCK
      ?auto_875169 - BLOCK
      ?auto_875170 - BLOCK
      ?auto_875171 - BLOCK
      ?auto_875172 - BLOCK
      ?auto_875173 - BLOCK
      ?auto_875174 - BLOCK
      ?auto_875175 - BLOCK
      ?auto_875176 - BLOCK
      ?auto_875177 - BLOCK
      ?auto_875178 - BLOCK
    )
    :vars
    (
      ?auto_875179 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_875178 ?auto_875179 ) ( ON-TABLE ?auto_875165 ) ( ON ?auto_875166 ?auto_875165 ) ( ON ?auto_875167 ?auto_875166 ) ( ON ?auto_875168 ?auto_875167 ) ( ON ?auto_875169 ?auto_875168 ) ( ON ?auto_875170 ?auto_875169 ) ( ON ?auto_875171 ?auto_875170 ) ( ON ?auto_875172 ?auto_875171 ) ( ON ?auto_875173 ?auto_875172 ) ( ON ?auto_875174 ?auto_875173 ) ( ON ?auto_875175 ?auto_875174 ) ( ON ?auto_875176 ?auto_875175 ) ( not ( = ?auto_875165 ?auto_875166 ) ) ( not ( = ?auto_875165 ?auto_875167 ) ) ( not ( = ?auto_875165 ?auto_875168 ) ) ( not ( = ?auto_875165 ?auto_875169 ) ) ( not ( = ?auto_875165 ?auto_875170 ) ) ( not ( = ?auto_875165 ?auto_875171 ) ) ( not ( = ?auto_875165 ?auto_875172 ) ) ( not ( = ?auto_875165 ?auto_875173 ) ) ( not ( = ?auto_875165 ?auto_875174 ) ) ( not ( = ?auto_875165 ?auto_875175 ) ) ( not ( = ?auto_875165 ?auto_875176 ) ) ( not ( = ?auto_875165 ?auto_875177 ) ) ( not ( = ?auto_875165 ?auto_875178 ) ) ( not ( = ?auto_875165 ?auto_875179 ) ) ( not ( = ?auto_875166 ?auto_875167 ) ) ( not ( = ?auto_875166 ?auto_875168 ) ) ( not ( = ?auto_875166 ?auto_875169 ) ) ( not ( = ?auto_875166 ?auto_875170 ) ) ( not ( = ?auto_875166 ?auto_875171 ) ) ( not ( = ?auto_875166 ?auto_875172 ) ) ( not ( = ?auto_875166 ?auto_875173 ) ) ( not ( = ?auto_875166 ?auto_875174 ) ) ( not ( = ?auto_875166 ?auto_875175 ) ) ( not ( = ?auto_875166 ?auto_875176 ) ) ( not ( = ?auto_875166 ?auto_875177 ) ) ( not ( = ?auto_875166 ?auto_875178 ) ) ( not ( = ?auto_875166 ?auto_875179 ) ) ( not ( = ?auto_875167 ?auto_875168 ) ) ( not ( = ?auto_875167 ?auto_875169 ) ) ( not ( = ?auto_875167 ?auto_875170 ) ) ( not ( = ?auto_875167 ?auto_875171 ) ) ( not ( = ?auto_875167 ?auto_875172 ) ) ( not ( = ?auto_875167 ?auto_875173 ) ) ( not ( = ?auto_875167 ?auto_875174 ) ) ( not ( = ?auto_875167 ?auto_875175 ) ) ( not ( = ?auto_875167 ?auto_875176 ) ) ( not ( = ?auto_875167 ?auto_875177 ) ) ( not ( = ?auto_875167 ?auto_875178 ) ) ( not ( = ?auto_875167 ?auto_875179 ) ) ( not ( = ?auto_875168 ?auto_875169 ) ) ( not ( = ?auto_875168 ?auto_875170 ) ) ( not ( = ?auto_875168 ?auto_875171 ) ) ( not ( = ?auto_875168 ?auto_875172 ) ) ( not ( = ?auto_875168 ?auto_875173 ) ) ( not ( = ?auto_875168 ?auto_875174 ) ) ( not ( = ?auto_875168 ?auto_875175 ) ) ( not ( = ?auto_875168 ?auto_875176 ) ) ( not ( = ?auto_875168 ?auto_875177 ) ) ( not ( = ?auto_875168 ?auto_875178 ) ) ( not ( = ?auto_875168 ?auto_875179 ) ) ( not ( = ?auto_875169 ?auto_875170 ) ) ( not ( = ?auto_875169 ?auto_875171 ) ) ( not ( = ?auto_875169 ?auto_875172 ) ) ( not ( = ?auto_875169 ?auto_875173 ) ) ( not ( = ?auto_875169 ?auto_875174 ) ) ( not ( = ?auto_875169 ?auto_875175 ) ) ( not ( = ?auto_875169 ?auto_875176 ) ) ( not ( = ?auto_875169 ?auto_875177 ) ) ( not ( = ?auto_875169 ?auto_875178 ) ) ( not ( = ?auto_875169 ?auto_875179 ) ) ( not ( = ?auto_875170 ?auto_875171 ) ) ( not ( = ?auto_875170 ?auto_875172 ) ) ( not ( = ?auto_875170 ?auto_875173 ) ) ( not ( = ?auto_875170 ?auto_875174 ) ) ( not ( = ?auto_875170 ?auto_875175 ) ) ( not ( = ?auto_875170 ?auto_875176 ) ) ( not ( = ?auto_875170 ?auto_875177 ) ) ( not ( = ?auto_875170 ?auto_875178 ) ) ( not ( = ?auto_875170 ?auto_875179 ) ) ( not ( = ?auto_875171 ?auto_875172 ) ) ( not ( = ?auto_875171 ?auto_875173 ) ) ( not ( = ?auto_875171 ?auto_875174 ) ) ( not ( = ?auto_875171 ?auto_875175 ) ) ( not ( = ?auto_875171 ?auto_875176 ) ) ( not ( = ?auto_875171 ?auto_875177 ) ) ( not ( = ?auto_875171 ?auto_875178 ) ) ( not ( = ?auto_875171 ?auto_875179 ) ) ( not ( = ?auto_875172 ?auto_875173 ) ) ( not ( = ?auto_875172 ?auto_875174 ) ) ( not ( = ?auto_875172 ?auto_875175 ) ) ( not ( = ?auto_875172 ?auto_875176 ) ) ( not ( = ?auto_875172 ?auto_875177 ) ) ( not ( = ?auto_875172 ?auto_875178 ) ) ( not ( = ?auto_875172 ?auto_875179 ) ) ( not ( = ?auto_875173 ?auto_875174 ) ) ( not ( = ?auto_875173 ?auto_875175 ) ) ( not ( = ?auto_875173 ?auto_875176 ) ) ( not ( = ?auto_875173 ?auto_875177 ) ) ( not ( = ?auto_875173 ?auto_875178 ) ) ( not ( = ?auto_875173 ?auto_875179 ) ) ( not ( = ?auto_875174 ?auto_875175 ) ) ( not ( = ?auto_875174 ?auto_875176 ) ) ( not ( = ?auto_875174 ?auto_875177 ) ) ( not ( = ?auto_875174 ?auto_875178 ) ) ( not ( = ?auto_875174 ?auto_875179 ) ) ( not ( = ?auto_875175 ?auto_875176 ) ) ( not ( = ?auto_875175 ?auto_875177 ) ) ( not ( = ?auto_875175 ?auto_875178 ) ) ( not ( = ?auto_875175 ?auto_875179 ) ) ( not ( = ?auto_875176 ?auto_875177 ) ) ( not ( = ?auto_875176 ?auto_875178 ) ) ( not ( = ?auto_875176 ?auto_875179 ) ) ( not ( = ?auto_875177 ?auto_875178 ) ) ( not ( = ?auto_875177 ?auto_875179 ) ) ( not ( = ?auto_875178 ?auto_875179 ) ) ( CLEAR ?auto_875176 ) ( ON ?auto_875177 ?auto_875178 ) ( CLEAR ?auto_875177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_875165 ?auto_875166 ?auto_875167 ?auto_875168 ?auto_875169 ?auto_875170 ?auto_875171 ?auto_875172 ?auto_875173 ?auto_875174 ?auto_875175 ?auto_875176 ?auto_875177 )
      ( MAKE-14PILE ?auto_875165 ?auto_875166 ?auto_875167 ?auto_875168 ?auto_875169 ?auto_875170 ?auto_875171 ?auto_875172 ?auto_875173 ?auto_875174 ?auto_875175 ?auto_875176 ?auto_875177 ?auto_875178 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_875223 - BLOCK
      ?auto_875224 - BLOCK
      ?auto_875225 - BLOCK
      ?auto_875226 - BLOCK
      ?auto_875227 - BLOCK
      ?auto_875228 - BLOCK
      ?auto_875229 - BLOCK
      ?auto_875230 - BLOCK
      ?auto_875231 - BLOCK
      ?auto_875232 - BLOCK
      ?auto_875233 - BLOCK
      ?auto_875234 - BLOCK
      ?auto_875235 - BLOCK
      ?auto_875236 - BLOCK
    )
    :vars
    (
      ?auto_875237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_875236 ?auto_875237 ) ( ON-TABLE ?auto_875223 ) ( ON ?auto_875224 ?auto_875223 ) ( ON ?auto_875225 ?auto_875224 ) ( ON ?auto_875226 ?auto_875225 ) ( ON ?auto_875227 ?auto_875226 ) ( ON ?auto_875228 ?auto_875227 ) ( ON ?auto_875229 ?auto_875228 ) ( ON ?auto_875230 ?auto_875229 ) ( ON ?auto_875231 ?auto_875230 ) ( ON ?auto_875232 ?auto_875231 ) ( ON ?auto_875233 ?auto_875232 ) ( not ( = ?auto_875223 ?auto_875224 ) ) ( not ( = ?auto_875223 ?auto_875225 ) ) ( not ( = ?auto_875223 ?auto_875226 ) ) ( not ( = ?auto_875223 ?auto_875227 ) ) ( not ( = ?auto_875223 ?auto_875228 ) ) ( not ( = ?auto_875223 ?auto_875229 ) ) ( not ( = ?auto_875223 ?auto_875230 ) ) ( not ( = ?auto_875223 ?auto_875231 ) ) ( not ( = ?auto_875223 ?auto_875232 ) ) ( not ( = ?auto_875223 ?auto_875233 ) ) ( not ( = ?auto_875223 ?auto_875234 ) ) ( not ( = ?auto_875223 ?auto_875235 ) ) ( not ( = ?auto_875223 ?auto_875236 ) ) ( not ( = ?auto_875223 ?auto_875237 ) ) ( not ( = ?auto_875224 ?auto_875225 ) ) ( not ( = ?auto_875224 ?auto_875226 ) ) ( not ( = ?auto_875224 ?auto_875227 ) ) ( not ( = ?auto_875224 ?auto_875228 ) ) ( not ( = ?auto_875224 ?auto_875229 ) ) ( not ( = ?auto_875224 ?auto_875230 ) ) ( not ( = ?auto_875224 ?auto_875231 ) ) ( not ( = ?auto_875224 ?auto_875232 ) ) ( not ( = ?auto_875224 ?auto_875233 ) ) ( not ( = ?auto_875224 ?auto_875234 ) ) ( not ( = ?auto_875224 ?auto_875235 ) ) ( not ( = ?auto_875224 ?auto_875236 ) ) ( not ( = ?auto_875224 ?auto_875237 ) ) ( not ( = ?auto_875225 ?auto_875226 ) ) ( not ( = ?auto_875225 ?auto_875227 ) ) ( not ( = ?auto_875225 ?auto_875228 ) ) ( not ( = ?auto_875225 ?auto_875229 ) ) ( not ( = ?auto_875225 ?auto_875230 ) ) ( not ( = ?auto_875225 ?auto_875231 ) ) ( not ( = ?auto_875225 ?auto_875232 ) ) ( not ( = ?auto_875225 ?auto_875233 ) ) ( not ( = ?auto_875225 ?auto_875234 ) ) ( not ( = ?auto_875225 ?auto_875235 ) ) ( not ( = ?auto_875225 ?auto_875236 ) ) ( not ( = ?auto_875225 ?auto_875237 ) ) ( not ( = ?auto_875226 ?auto_875227 ) ) ( not ( = ?auto_875226 ?auto_875228 ) ) ( not ( = ?auto_875226 ?auto_875229 ) ) ( not ( = ?auto_875226 ?auto_875230 ) ) ( not ( = ?auto_875226 ?auto_875231 ) ) ( not ( = ?auto_875226 ?auto_875232 ) ) ( not ( = ?auto_875226 ?auto_875233 ) ) ( not ( = ?auto_875226 ?auto_875234 ) ) ( not ( = ?auto_875226 ?auto_875235 ) ) ( not ( = ?auto_875226 ?auto_875236 ) ) ( not ( = ?auto_875226 ?auto_875237 ) ) ( not ( = ?auto_875227 ?auto_875228 ) ) ( not ( = ?auto_875227 ?auto_875229 ) ) ( not ( = ?auto_875227 ?auto_875230 ) ) ( not ( = ?auto_875227 ?auto_875231 ) ) ( not ( = ?auto_875227 ?auto_875232 ) ) ( not ( = ?auto_875227 ?auto_875233 ) ) ( not ( = ?auto_875227 ?auto_875234 ) ) ( not ( = ?auto_875227 ?auto_875235 ) ) ( not ( = ?auto_875227 ?auto_875236 ) ) ( not ( = ?auto_875227 ?auto_875237 ) ) ( not ( = ?auto_875228 ?auto_875229 ) ) ( not ( = ?auto_875228 ?auto_875230 ) ) ( not ( = ?auto_875228 ?auto_875231 ) ) ( not ( = ?auto_875228 ?auto_875232 ) ) ( not ( = ?auto_875228 ?auto_875233 ) ) ( not ( = ?auto_875228 ?auto_875234 ) ) ( not ( = ?auto_875228 ?auto_875235 ) ) ( not ( = ?auto_875228 ?auto_875236 ) ) ( not ( = ?auto_875228 ?auto_875237 ) ) ( not ( = ?auto_875229 ?auto_875230 ) ) ( not ( = ?auto_875229 ?auto_875231 ) ) ( not ( = ?auto_875229 ?auto_875232 ) ) ( not ( = ?auto_875229 ?auto_875233 ) ) ( not ( = ?auto_875229 ?auto_875234 ) ) ( not ( = ?auto_875229 ?auto_875235 ) ) ( not ( = ?auto_875229 ?auto_875236 ) ) ( not ( = ?auto_875229 ?auto_875237 ) ) ( not ( = ?auto_875230 ?auto_875231 ) ) ( not ( = ?auto_875230 ?auto_875232 ) ) ( not ( = ?auto_875230 ?auto_875233 ) ) ( not ( = ?auto_875230 ?auto_875234 ) ) ( not ( = ?auto_875230 ?auto_875235 ) ) ( not ( = ?auto_875230 ?auto_875236 ) ) ( not ( = ?auto_875230 ?auto_875237 ) ) ( not ( = ?auto_875231 ?auto_875232 ) ) ( not ( = ?auto_875231 ?auto_875233 ) ) ( not ( = ?auto_875231 ?auto_875234 ) ) ( not ( = ?auto_875231 ?auto_875235 ) ) ( not ( = ?auto_875231 ?auto_875236 ) ) ( not ( = ?auto_875231 ?auto_875237 ) ) ( not ( = ?auto_875232 ?auto_875233 ) ) ( not ( = ?auto_875232 ?auto_875234 ) ) ( not ( = ?auto_875232 ?auto_875235 ) ) ( not ( = ?auto_875232 ?auto_875236 ) ) ( not ( = ?auto_875232 ?auto_875237 ) ) ( not ( = ?auto_875233 ?auto_875234 ) ) ( not ( = ?auto_875233 ?auto_875235 ) ) ( not ( = ?auto_875233 ?auto_875236 ) ) ( not ( = ?auto_875233 ?auto_875237 ) ) ( not ( = ?auto_875234 ?auto_875235 ) ) ( not ( = ?auto_875234 ?auto_875236 ) ) ( not ( = ?auto_875234 ?auto_875237 ) ) ( not ( = ?auto_875235 ?auto_875236 ) ) ( not ( = ?auto_875235 ?auto_875237 ) ) ( not ( = ?auto_875236 ?auto_875237 ) ) ( ON ?auto_875235 ?auto_875236 ) ( CLEAR ?auto_875233 ) ( ON ?auto_875234 ?auto_875235 ) ( CLEAR ?auto_875234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_875223 ?auto_875224 ?auto_875225 ?auto_875226 ?auto_875227 ?auto_875228 ?auto_875229 ?auto_875230 ?auto_875231 ?auto_875232 ?auto_875233 ?auto_875234 )
      ( MAKE-14PILE ?auto_875223 ?auto_875224 ?auto_875225 ?auto_875226 ?auto_875227 ?auto_875228 ?auto_875229 ?auto_875230 ?auto_875231 ?auto_875232 ?auto_875233 ?auto_875234 ?auto_875235 ?auto_875236 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_875281 - BLOCK
      ?auto_875282 - BLOCK
      ?auto_875283 - BLOCK
      ?auto_875284 - BLOCK
      ?auto_875285 - BLOCK
      ?auto_875286 - BLOCK
      ?auto_875287 - BLOCK
      ?auto_875288 - BLOCK
      ?auto_875289 - BLOCK
      ?auto_875290 - BLOCK
      ?auto_875291 - BLOCK
      ?auto_875292 - BLOCK
      ?auto_875293 - BLOCK
      ?auto_875294 - BLOCK
    )
    :vars
    (
      ?auto_875295 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_875294 ?auto_875295 ) ( ON-TABLE ?auto_875281 ) ( ON ?auto_875282 ?auto_875281 ) ( ON ?auto_875283 ?auto_875282 ) ( ON ?auto_875284 ?auto_875283 ) ( ON ?auto_875285 ?auto_875284 ) ( ON ?auto_875286 ?auto_875285 ) ( ON ?auto_875287 ?auto_875286 ) ( ON ?auto_875288 ?auto_875287 ) ( ON ?auto_875289 ?auto_875288 ) ( ON ?auto_875290 ?auto_875289 ) ( not ( = ?auto_875281 ?auto_875282 ) ) ( not ( = ?auto_875281 ?auto_875283 ) ) ( not ( = ?auto_875281 ?auto_875284 ) ) ( not ( = ?auto_875281 ?auto_875285 ) ) ( not ( = ?auto_875281 ?auto_875286 ) ) ( not ( = ?auto_875281 ?auto_875287 ) ) ( not ( = ?auto_875281 ?auto_875288 ) ) ( not ( = ?auto_875281 ?auto_875289 ) ) ( not ( = ?auto_875281 ?auto_875290 ) ) ( not ( = ?auto_875281 ?auto_875291 ) ) ( not ( = ?auto_875281 ?auto_875292 ) ) ( not ( = ?auto_875281 ?auto_875293 ) ) ( not ( = ?auto_875281 ?auto_875294 ) ) ( not ( = ?auto_875281 ?auto_875295 ) ) ( not ( = ?auto_875282 ?auto_875283 ) ) ( not ( = ?auto_875282 ?auto_875284 ) ) ( not ( = ?auto_875282 ?auto_875285 ) ) ( not ( = ?auto_875282 ?auto_875286 ) ) ( not ( = ?auto_875282 ?auto_875287 ) ) ( not ( = ?auto_875282 ?auto_875288 ) ) ( not ( = ?auto_875282 ?auto_875289 ) ) ( not ( = ?auto_875282 ?auto_875290 ) ) ( not ( = ?auto_875282 ?auto_875291 ) ) ( not ( = ?auto_875282 ?auto_875292 ) ) ( not ( = ?auto_875282 ?auto_875293 ) ) ( not ( = ?auto_875282 ?auto_875294 ) ) ( not ( = ?auto_875282 ?auto_875295 ) ) ( not ( = ?auto_875283 ?auto_875284 ) ) ( not ( = ?auto_875283 ?auto_875285 ) ) ( not ( = ?auto_875283 ?auto_875286 ) ) ( not ( = ?auto_875283 ?auto_875287 ) ) ( not ( = ?auto_875283 ?auto_875288 ) ) ( not ( = ?auto_875283 ?auto_875289 ) ) ( not ( = ?auto_875283 ?auto_875290 ) ) ( not ( = ?auto_875283 ?auto_875291 ) ) ( not ( = ?auto_875283 ?auto_875292 ) ) ( not ( = ?auto_875283 ?auto_875293 ) ) ( not ( = ?auto_875283 ?auto_875294 ) ) ( not ( = ?auto_875283 ?auto_875295 ) ) ( not ( = ?auto_875284 ?auto_875285 ) ) ( not ( = ?auto_875284 ?auto_875286 ) ) ( not ( = ?auto_875284 ?auto_875287 ) ) ( not ( = ?auto_875284 ?auto_875288 ) ) ( not ( = ?auto_875284 ?auto_875289 ) ) ( not ( = ?auto_875284 ?auto_875290 ) ) ( not ( = ?auto_875284 ?auto_875291 ) ) ( not ( = ?auto_875284 ?auto_875292 ) ) ( not ( = ?auto_875284 ?auto_875293 ) ) ( not ( = ?auto_875284 ?auto_875294 ) ) ( not ( = ?auto_875284 ?auto_875295 ) ) ( not ( = ?auto_875285 ?auto_875286 ) ) ( not ( = ?auto_875285 ?auto_875287 ) ) ( not ( = ?auto_875285 ?auto_875288 ) ) ( not ( = ?auto_875285 ?auto_875289 ) ) ( not ( = ?auto_875285 ?auto_875290 ) ) ( not ( = ?auto_875285 ?auto_875291 ) ) ( not ( = ?auto_875285 ?auto_875292 ) ) ( not ( = ?auto_875285 ?auto_875293 ) ) ( not ( = ?auto_875285 ?auto_875294 ) ) ( not ( = ?auto_875285 ?auto_875295 ) ) ( not ( = ?auto_875286 ?auto_875287 ) ) ( not ( = ?auto_875286 ?auto_875288 ) ) ( not ( = ?auto_875286 ?auto_875289 ) ) ( not ( = ?auto_875286 ?auto_875290 ) ) ( not ( = ?auto_875286 ?auto_875291 ) ) ( not ( = ?auto_875286 ?auto_875292 ) ) ( not ( = ?auto_875286 ?auto_875293 ) ) ( not ( = ?auto_875286 ?auto_875294 ) ) ( not ( = ?auto_875286 ?auto_875295 ) ) ( not ( = ?auto_875287 ?auto_875288 ) ) ( not ( = ?auto_875287 ?auto_875289 ) ) ( not ( = ?auto_875287 ?auto_875290 ) ) ( not ( = ?auto_875287 ?auto_875291 ) ) ( not ( = ?auto_875287 ?auto_875292 ) ) ( not ( = ?auto_875287 ?auto_875293 ) ) ( not ( = ?auto_875287 ?auto_875294 ) ) ( not ( = ?auto_875287 ?auto_875295 ) ) ( not ( = ?auto_875288 ?auto_875289 ) ) ( not ( = ?auto_875288 ?auto_875290 ) ) ( not ( = ?auto_875288 ?auto_875291 ) ) ( not ( = ?auto_875288 ?auto_875292 ) ) ( not ( = ?auto_875288 ?auto_875293 ) ) ( not ( = ?auto_875288 ?auto_875294 ) ) ( not ( = ?auto_875288 ?auto_875295 ) ) ( not ( = ?auto_875289 ?auto_875290 ) ) ( not ( = ?auto_875289 ?auto_875291 ) ) ( not ( = ?auto_875289 ?auto_875292 ) ) ( not ( = ?auto_875289 ?auto_875293 ) ) ( not ( = ?auto_875289 ?auto_875294 ) ) ( not ( = ?auto_875289 ?auto_875295 ) ) ( not ( = ?auto_875290 ?auto_875291 ) ) ( not ( = ?auto_875290 ?auto_875292 ) ) ( not ( = ?auto_875290 ?auto_875293 ) ) ( not ( = ?auto_875290 ?auto_875294 ) ) ( not ( = ?auto_875290 ?auto_875295 ) ) ( not ( = ?auto_875291 ?auto_875292 ) ) ( not ( = ?auto_875291 ?auto_875293 ) ) ( not ( = ?auto_875291 ?auto_875294 ) ) ( not ( = ?auto_875291 ?auto_875295 ) ) ( not ( = ?auto_875292 ?auto_875293 ) ) ( not ( = ?auto_875292 ?auto_875294 ) ) ( not ( = ?auto_875292 ?auto_875295 ) ) ( not ( = ?auto_875293 ?auto_875294 ) ) ( not ( = ?auto_875293 ?auto_875295 ) ) ( not ( = ?auto_875294 ?auto_875295 ) ) ( ON ?auto_875293 ?auto_875294 ) ( ON ?auto_875292 ?auto_875293 ) ( CLEAR ?auto_875290 ) ( ON ?auto_875291 ?auto_875292 ) ( CLEAR ?auto_875291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_875281 ?auto_875282 ?auto_875283 ?auto_875284 ?auto_875285 ?auto_875286 ?auto_875287 ?auto_875288 ?auto_875289 ?auto_875290 ?auto_875291 )
      ( MAKE-14PILE ?auto_875281 ?auto_875282 ?auto_875283 ?auto_875284 ?auto_875285 ?auto_875286 ?auto_875287 ?auto_875288 ?auto_875289 ?auto_875290 ?auto_875291 ?auto_875292 ?auto_875293 ?auto_875294 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_875339 - BLOCK
      ?auto_875340 - BLOCK
      ?auto_875341 - BLOCK
      ?auto_875342 - BLOCK
      ?auto_875343 - BLOCK
      ?auto_875344 - BLOCK
      ?auto_875345 - BLOCK
      ?auto_875346 - BLOCK
      ?auto_875347 - BLOCK
      ?auto_875348 - BLOCK
      ?auto_875349 - BLOCK
      ?auto_875350 - BLOCK
      ?auto_875351 - BLOCK
      ?auto_875352 - BLOCK
    )
    :vars
    (
      ?auto_875353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_875352 ?auto_875353 ) ( ON-TABLE ?auto_875339 ) ( ON ?auto_875340 ?auto_875339 ) ( ON ?auto_875341 ?auto_875340 ) ( ON ?auto_875342 ?auto_875341 ) ( ON ?auto_875343 ?auto_875342 ) ( ON ?auto_875344 ?auto_875343 ) ( ON ?auto_875345 ?auto_875344 ) ( ON ?auto_875346 ?auto_875345 ) ( ON ?auto_875347 ?auto_875346 ) ( not ( = ?auto_875339 ?auto_875340 ) ) ( not ( = ?auto_875339 ?auto_875341 ) ) ( not ( = ?auto_875339 ?auto_875342 ) ) ( not ( = ?auto_875339 ?auto_875343 ) ) ( not ( = ?auto_875339 ?auto_875344 ) ) ( not ( = ?auto_875339 ?auto_875345 ) ) ( not ( = ?auto_875339 ?auto_875346 ) ) ( not ( = ?auto_875339 ?auto_875347 ) ) ( not ( = ?auto_875339 ?auto_875348 ) ) ( not ( = ?auto_875339 ?auto_875349 ) ) ( not ( = ?auto_875339 ?auto_875350 ) ) ( not ( = ?auto_875339 ?auto_875351 ) ) ( not ( = ?auto_875339 ?auto_875352 ) ) ( not ( = ?auto_875339 ?auto_875353 ) ) ( not ( = ?auto_875340 ?auto_875341 ) ) ( not ( = ?auto_875340 ?auto_875342 ) ) ( not ( = ?auto_875340 ?auto_875343 ) ) ( not ( = ?auto_875340 ?auto_875344 ) ) ( not ( = ?auto_875340 ?auto_875345 ) ) ( not ( = ?auto_875340 ?auto_875346 ) ) ( not ( = ?auto_875340 ?auto_875347 ) ) ( not ( = ?auto_875340 ?auto_875348 ) ) ( not ( = ?auto_875340 ?auto_875349 ) ) ( not ( = ?auto_875340 ?auto_875350 ) ) ( not ( = ?auto_875340 ?auto_875351 ) ) ( not ( = ?auto_875340 ?auto_875352 ) ) ( not ( = ?auto_875340 ?auto_875353 ) ) ( not ( = ?auto_875341 ?auto_875342 ) ) ( not ( = ?auto_875341 ?auto_875343 ) ) ( not ( = ?auto_875341 ?auto_875344 ) ) ( not ( = ?auto_875341 ?auto_875345 ) ) ( not ( = ?auto_875341 ?auto_875346 ) ) ( not ( = ?auto_875341 ?auto_875347 ) ) ( not ( = ?auto_875341 ?auto_875348 ) ) ( not ( = ?auto_875341 ?auto_875349 ) ) ( not ( = ?auto_875341 ?auto_875350 ) ) ( not ( = ?auto_875341 ?auto_875351 ) ) ( not ( = ?auto_875341 ?auto_875352 ) ) ( not ( = ?auto_875341 ?auto_875353 ) ) ( not ( = ?auto_875342 ?auto_875343 ) ) ( not ( = ?auto_875342 ?auto_875344 ) ) ( not ( = ?auto_875342 ?auto_875345 ) ) ( not ( = ?auto_875342 ?auto_875346 ) ) ( not ( = ?auto_875342 ?auto_875347 ) ) ( not ( = ?auto_875342 ?auto_875348 ) ) ( not ( = ?auto_875342 ?auto_875349 ) ) ( not ( = ?auto_875342 ?auto_875350 ) ) ( not ( = ?auto_875342 ?auto_875351 ) ) ( not ( = ?auto_875342 ?auto_875352 ) ) ( not ( = ?auto_875342 ?auto_875353 ) ) ( not ( = ?auto_875343 ?auto_875344 ) ) ( not ( = ?auto_875343 ?auto_875345 ) ) ( not ( = ?auto_875343 ?auto_875346 ) ) ( not ( = ?auto_875343 ?auto_875347 ) ) ( not ( = ?auto_875343 ?auto_875348 ) ) ( not ( = ?auto_875343 ?auto_875349 ) ) ( not ( = ?auto_875343 ?auto_875350 ) ) ( not ( = ?auto_875343 ?auto_875351 ) ) ( not ( = ?auto_875343 ?auto_875352 ) ) ( not ( = ?auto_875343 ?auto_875353 ) ) ( not ( = ?auto_875344 ?auto_875345 ) ) ( not ( = ?auto_875344 ?auto_875346 ) ) ( not ( = ?auto_875344 ?auto_875347 ) ) ( not ( = ?auto_875344 ?auto_875348 ) ) ( not ( = ?auto_875344 ?auto_875349 ) ) ( not ( = ?auto_875344 ?auto_875350 ) ) ( not ( = ?auto_875344 ?auto_875351 ) ) ( not ( = ?auto_875344 ?auto_875352 ) ) ( not ( = ?auto_875344 ?auto_875353 ) ) ( not ( = ?auto_875345 ?auto_875346 ) ) ( not ( = ?auto_875345 ?auto_875347 ) ) ( not ( = ?auto_875345 ?auto_875348 ) ) ( not ( = ?auto_875345 ?auto_875349 ) ) ( not ( = ?auto_875345 ?auto_875350 ) ) ( not ( = ?auto_875345 ?auto_875351 ) ) ( not ( = ?auto_875345 ?auto_875352 ) ) ( not ( = ?auto_875345 ?auto_875353 ) ) ( not ( = ?auto_875346 ?auto_875347 ) ) ( not ( = ?auto_875346 ?auto_875348 ) ) ( not ( = ?auto_875346 ?auto_875349 ) ) ( not ( = ?auto_875346 ?auto_875350 ) ) ( not ( = ?auto_875346 ?auto_875351 ) ) ( not ( = ?auto_875346 ?auto_875352 ) ) ( not ( = ?auto_875346 ?auto_875353 ) ) ( not ( = ?auto_875347 ?auto_875348 ) ) ( not ( = ?auto_875347 ?auto_875349 ) ) ( not ( = ?auto_875347 ?auto_875350 ) ) ( not ( = ?auto_875347 ?auto_875351 ) ) ( not ( = ?auto_875347 ?auto_875352 ) ) ( not ( = ?auto_875347 ?auto_875353 ) ) ( not ( = ?auto_875348 ?auto_875349 ) ) ( not ( = ?auto_875348 ?auto_875350 ) ) ( not ( = ?auto_875348 ?auto_875351 ) ) ( not ( = ?auto_875348 ?auto_875352 ) ) ( not ( = ?auto_875348 ?auto_875353 ) ) ( not ( = ?auto_875349 ?auto_875350 ) ) ( not ( = ?auto_875349 ?auto_875351 ) ) ( not ( = ?auto_875349 ?auto_875352 ) ) ( not ( = ?auto_875349 ?auto_875353 ) ) ( not ( = ?auto_875350 ?auto_875351 ) ) ( not ( = ?auto_875350 ?auto_875352 ) ) ( not ( = ?auto_875350 ?auto_875353 ) ) ( not ( = ?auto_875351 ?auto_875352 ) ) ( not ( = ?auto_875351 ?auto_875353 ) ) ( not ( = ?auto_875352 ?auto_875353 ) ) ( ON ?auto_875351 ?auto_875352 ) ( ON ?auto_875350 ?auto_875351 ) ( ON ?auto_875349 ?auto_875350 ) ( CLEAR ?auto_875347 ) ( ON ?auto_875348 ?auto_875349 ) ( CLEAR ?auto_875348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_875339 ?auto_875340 ?auto_875341 ?auto_875342 ?auto_875343 ?auto_875344 ?auto_875345 ?auto_875346 ?auto_875347 ?auto_875348 )
      ( MAKE-14PILE ?auto_875339 ?auto_875340 ?auto_875341 ?auto_875342 ?auto_875343 ?auto_875344 ?auto_875345 ?auto_875346 ?auto_875347 ?auto_875348 ?auto_875349 ?auto_875350 ?auto_875351 ?auto_875352 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_875397 - BLOCK
      ?auto_875398 - BLOCK
      ?auto_875399 - BLOCK
      ?auto_875400 - BLOCK
      ?auto_875401 - BLOCK
      ?auto_875402 - BLOCK
      ?auto_875403 - BLOCK
      ?auto_875404 - BLOCK
      ?auto_875405 - BLOCK
      ?auto_875406 - BLOCK
      ?auto_875407 - BLOCK
      ?auto_875408 - BLOCK
      ?auto_875409 - BLOCK
      ?auto_875410 - BLOCK
    )
    :vars
    (
      ?auto_875411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_875410 ?auto_875411 ) ( ON-TABLE ?auto_875397 ) ( ON ?auto_875398 ?auto_875397 ) ( ON ?auto_875399 ?auto_875398 ) ( ON ?auto_875400 ?auto_875399 ) ( ON ?auto_875401 ?auto_875400 ) ( ON ?auto_875402 ?auto_875401 ) ( ON ?auto_875403 ?auto_875402 ) ( ON ?auto_875404 ?auto_875403 ) ( not ( = ?auto_875397 ?auto_875398 ) ) ( not ( = ?auto_875397 ?auto_875399 ) ) ( not ( = ?auto_875397 ?auto_875400 ) ) ( not ( = ?auto_875397 ?auto_875401 ) ) ( not ( = ?auto_875397 ?auto_875402 ) ) ( not ( = ?auto_875397 ?auto_875403 ) ) ( not ( = ?auto_875397 ?auto_875404 ) ) ( not ( = ?auto_875397 ?auto_875405 ) ) ( not ( = ?auto_875397 ?auto_875406 ) ) ( not ( = ?auto_875397 ?auto_875407 ) ) ( not ( = ?auto_875397 ?auto_875408 ) ) ( not ( = ?auto_875397 ?auto_875409 ) ) ( not ( = ?auto_875397 ?auto_875410 ) ) ( not ( = ?auto_875397 ?auto_875411 ) ) ( not ( = ?auto_875398 ?auto_875399 ) ) ( not ( = ?auto_875398 ?auto_875400 ) ) ( not ( = ?auto_875398 ?auto_875401 ) ) ( not ( = ?auto_875398 ?auto_875402 ) ) ( not ( = ?auto_875398 ?auto_875403 ) ) ( not ( = ?auto_875398 ?auto_875404 ) ) ( not ( = ?auto_875398 ?auto_875405 ) ) ( not ( = ?auto_875398 ?auto_875406 ) ) ( not ( = ?auto_875398 ?auto_875407 ) ) ( not ( = ?auto_875398 ?auto_875408 ) ) ( not ( = ?auto_875398 ?auto_875409 ) ) ( not ( = ?auto_875398 ?auto_875410 ) ) ( not ( = ?auto_875398 ?auto_875411 ) ) ( not ( = ?auto_875399 ?auto_875400 ) ) ( not ( = ?auto_875399 ?auto_875401 ) ) ( not ( = ?auto_875399 ?auto_875402 ) ) ( not ( = ?auto_875399 ?auto_875403 ) ) ( not ( = ?auto_875399 ?auto_875404 ) ) ( not ( = ?auto_875399 ?auto_875405 ) ) ( not ( = ?auto_875399 ?auto_875406 ) ) ( not ( = ?auto_875399 ?auto_875407 ) ) ( not ( = ?auto_875399 ?auto_875408 ) ) ( not ( = ?auto_875399 ?auto_875409 ) ) ( not ( = ?auto_875399 ?auto_875410 ) ) ( not ( = ?auto_875399 ?auto_875411 ) ) ( not ( = ?auto_875400 ?auto_875401 ) ) ( not ( = ?auto_875400 ?auto_875402 ) ) ( not ( = ?auto_875400 ?auto_875403 ) ) ( not ( = ?auto_875400 ?auto_875404 ) ) ( not ( = ?auto_875400 ?auto_875405 ) ) ( not ( = ?auto_875400 ?auto_875406 ) ) ( not ( = ?auto_875400 ?auto_875407 ) ) ( not ( = ?auto_875400 ?auto_875408 ) ) ( not ( = ?auto_875400 ?auto_875409 ) ) ( not ( = ?auto_875400 ?auto_875410 ) ) ( not ( = ?auto_875400 ?auto_875411 ) ) ( not ( = ?auto_875401 ?auto_875402 ) ) ( not ( = ?auto_875401 ?auto_875403 ) ) ( not ( = ?auto_875401 ?auto_875404 ) ) ( not ( = ?auto_875401 ?auto_875405 ) ) ( not ( = ?auto_875401 ?auto_875406 ) ) ( not ( = ?auto_875401 ?auto_875407 ) ) ( not ( = ?auto_875401 ?auto_875408 ) ) ( not ( = ?auto_875401 ?auto_875409 ) ) ( not ( = ?auto_875401 ?auto_875410 ) ) ( not ( = ?auto_875401 ?auto_875411 ) ) ( not ( = ?auto_875402 ?auto_875403 ) ) ( not ( = ?auto_875402 ?auto_875404 ) ) ( not ( = ?auto_875402 ?auto_875405 ) ) ( not ( = ?auto_875402 ?auto_875406 ) ) ( not ( = ?auto_875402 ?auto_875407 ) ) ( not ( = ?auto_875402 ?auto_875408 ) ) ( not ( = ?auto_875402 ?auto_875409 ) ) ( not ( = ?auto_875402 ?auto_875410 ) ) ( not ( = ?auto_875402 ?auto_875411 ) ) ( not ( = ?auto_875403 ?auto_875404 ) ) ( not ( = ?auto_875403 ?auto_875405 ) ) ( not ( = ?auto_875403 ?auto_875406 ) ) ( not ( = ?auto_875403 ?auto_875407 ) ) ( not ( = ?auto_875403 ?auto_875408 ) ) ( not ( = ?auto_875403 ?auto_875409 ) ) ( not ( = ?auto_875403 ?auto_875410 ) ) ( not ( = ?auto_875403 ?auto_875411 ) ) ( not ( = ?auto_875404 ?auto_875405 ) ) ( not ( = ?auto_875404 ?auto_875406 ) ) ( not ( = ?auto_875404 ?auto_875407 ) ) ( not ( = ?auto_875404 ?auto_875408 ) ) ( not ( = ?auto_875404 ?auto_875409 ) ) ( not ( = ?auto_875404 ?auto_875410 ) ) ( not ( = ?auto_875404 ?auto_875411 ) ) ( not ( = ?auto_875405 ?auto_875406 ) ) ( not ( = ?auto_875405 ?auto_875407 ) ) ( not ( = ?auto_875405 ?auto_875408 ) ) ( not ( = ?auto_875405 ?auto_875409 ) ) ( not ( = ?auto_875405 ?auto_875410 ) ) ( not ( = ?auto_875405 ?auto_875411 ) ) ( not ( = ?auto_875406 ?auto_875407 ) ) ( not ( = ?auto_875406 ?auto_875408 ) ) ( not ( = ?auto_875406 ?auto_875409 ) ) ( not ( = ?auto_875406 ?auto_875410 ) ) ( not ( = ?auto_875406 ?auto_875411 ) ) ( not ( = ?auto_875407 ?auto_875408 ) ) ( not ( = ?auto_875407 ?auto_875409 ) ) ( not ( = ?auto_875407 ?auto_875410 ) ) ( not ( = ?auto_875407 ?auto_875411 ) ) ( not ( = ?auto_875408 ?auto_875409 ) ) ( not ( = ?auto_875408 ?auto_875410 ) ) ( not ( = ?auto_875408 ?auto_875411 ) ) ( not ( = ?auto_875409 ?auto_875410 ) ) ( not ( = ?auto_875409 ?auto_875411 ) ) ( not ( = ?auto_875410 ?auto_875411 ) ) ( ON ?auto_875409 ?auto_875410 ) ( ON ?auto_875408 ?auto_875409 ) ( ON ?auto_875407 ?auto_875408 ) ( ON ?auto_875406 ?auto_875407 ) ( CLEAR ?auto_875404 ) ( ON ?auto_875405 ?auto_875406 ) ( CLEAR ?auto_875405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_875397 ?auto_875398 ?auto_875399 ?auto_875400 ?auto_875401 ?auto_875402 ?auto_875403 ?auto_875404 ?auto_875405 )
      ( MAKE-14PILE ?auto_875397 ?auto_875398 ?auto_875399 ?auto_875400 ?auto_875401 ?auto_875402 ?auto_875403 ?auto_875404 ?auto_875405 ?auto_875406 ?auto_875407 ?auto_875408 ?auto_875409 ?auto_875410 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_875455 - BLOCK
      ?auto_875456 - BLOCK
      ?auto_875457 - BLOCK
      ?auto_875458 - BLOCK
      ?auto_875459 - BLOCK
      ?auto_875460 - BLOCK
      ?auto_875461 - BLOCK
      ?auto_875462 - BLOCK
      ?auto_875463 - BLOCK
      ?auto_875464 - BLOCK
      ?auto_875465 - BLOCK
      ?auto_875466 - BLOCK
      ?auto_875467 - BLOCK
      ?auto_875468 - BLOCK
    )
    :vars
    (
      ?auto_875469 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_875468 ?auto_875469 ) ( ON-TABLE ?auto_875455 ) ( ON ?auto_875456 ?auto_875455 ) ( ON ?auto_875457 ?auto_875456 ) ( ON ?auto_875458 ?auto_875457 ) ( ON ?auto_875459 ?auto_875458 ) ( ON ?auto_875460 ?auto_875459 ) ( ON ?auto_875461 ?auto_875460 ) ( not ( = ?auto_875455 ?auto_875456 ) ) ( not ( = ?auto_875455 ?auto_875457 ) ) ( not ( = ?auto_875455 ?auto_875458 ) ) ( not ( = ?auto_875455 ?auto_875459 ) ) ( not ( = ?auto_875455 ?auto_875460 ) ) ( not ( = ?auto_875455 ?auto_875461 ) ) ( not ( = ?auto_875455 ?auto_875462 ) ) ( not ( = ?auto_875455 ?auto_875463 ) ) ( not ( = ?auto_875455 ?auto_875464 ) ) ( not ( = ?auto_875455 ?auto_875465 ) ) ( not ( = ?auto_875455 ?auto_875466 ) ) ( not ( = ?auto_875455 ?auto_875467 ) ) ( not ( = ?auto_875455 ?auto_875468 ) ) ( not ( = ?auto_875455 ?auto_875469 ) ) ( not ( = ?auto_875456 ?auto_875457 ) ) ( not ( = ?auto_875456 ?auto_875458 ) ) ( not ( = ?auto_875456 ?auto_875459 ) ) ( not ( = ?auto_875456 ?auto_875460 ) ) ( not ( = ?auto_875456 ?auto_875461 ) ) ( not ( = ?auto_875456 ?auto_875462 ) ) ( not ( = ?auto_875456 ?auto_875463 ) ) ( not ( = ?auto_875456 ?auto_875464 ) ) ( not ( = ?auto_875456 ?auto_875465 ) ) ( not ( = ?auto_875456 ?auto_875466 ) ) ( not ( = ?auto_875456 ?auto_875467 ) ) ( not ( = ?auto_875456 ?auto_875468 ) ) ( not ( = ?auto_875456 ?auto_875469 ) ) ( not ( = ?auto_875457 ?auto_875458 ) ) ( not ( = ?auto_875457 ?auto_875459 ) ) ( not ( = ?auto_875457 ?auto_875460 ) ) ( not ( = ?auto_875457 ?auto_875461 ) ) ( not ( = ?auto_875457 ?auto_875462 ) ) ( not ( = ?auto_875457 ?auto_875463 ) ) ( not ( = ?auto_875457 ?auto_875464 ) ) ( not ( = ?auto_875457 ?auto_875465 ) ) ( not ( = ?auto_875457 ?auto_875466 ) ) ( not ( = ?auto_875457 ?auto_875467 ) ) ( not ( = ?auto_875457 ?auto_875468 ) ) ( not ( = ?auto_875457 ?auto_875469 ) ) ( not ( = ?auto_875458 ?auto_875459 ) ) ( not ( = ?auto_875458 ?auto_875460 ) ) ( not ( = ?auto_875458 ?auto_875461 ) ) ( not ( = ?auto_875458 ?auto_875462 ) ) ( not ( = ?auto_875458 ?auto_875463 ) ) ( not ( = ?auto_875458 ?auto_875464 ) ) ( not ( = ?auto_875458 ?auto_875465 ) ) ( not ( = ?auto_875458 ?auto_875466 ) ) ( not ( = ?auto_875458 ?auto_875467 ) ) ( not ( = ?auto_875458 ?auto_875468 ) ) ( not ( = ?auto_875458 ?auto_875469 ) ) ( not ( = ?auto_875459 ?auto_875460 ) ) ( not ( = ?auto_875459 ?auto_875461 ) ) ( not ( = ?auto_875459 ?auto_875462 ) ) ( not ( = ?auto_875459 ?auto_875463 ) ) ( not ( = ?auto_875459 ?auto_875464 ) ) ( not ( = ?auto_875459 ?auto_875465 ) ) ( not ( = ?auto_875459 ?auto_875466 ) ) ( not ( = ?auto_875459 ?auto_875467 ) ) ( not ( = ?auto_875459 ?auto_875468 ) ) ( not ( = ?auto_875459 ?auto_875469 ) ) ( not ( = ?auto_875460 ?auto_875461 ) ) ( not ( = ?auto_875460 ?auto_875462 ) ) ( not ( = ?auto_875460 ?auto_875463 ) ) ( not ( = ?auto_875460 ?auto_875464 ) ) ( not ( = ?auto_875460 ?auto_875465 ) ) ( not ( = ?auto_875460 ?auto_875466 ) ) ( not ( = ?auto_875460 ?auto_875467 ) ) ( not ( = ?auto_875460 ?auto_875468 ) ) ( not ( = ?auto_875460 ?auto_875469 ) ) ( not ( = ?auto_875461 ?auto_875462 ) ) ( not ( = ?auto_875461 ?auto_875463 ) ) ( not ( = ?auto_875461 ?auto_875464 ) ) ( not ( = ?auto_875461 ?auto_875465 ) ) ( not ( = ?auto_875461 ?auto_875466 ) ) ( not ( = ?auto_875461 ?auto_875467 ) ) ( not ( = ?auto_875461 ?auto_875468 ) ) ( not ( = ?auto_875461 ?auto_875469 ) ) ( not ( = ?auto_875462 ?auto_875463 ) ) ( not ( = ?auto_875462 ?auto_875464 ) ) ( not ( = ?auto_875462 ?auto_875465 ) ) ( not ( = ?auto_875462 ?auto_875466 ) ) ( not ( = ?auto_875462 ?auto_875467 ) ) ( not ( = ?auto_875462 ?auto_875468 ) ) ( not ( = ?auto_875462 ?auto_875469 ) ) ( not ( = ?auto_875463 ?auto_875464 ) ) ( not ( = ?auto_875463 ?auto_875465 ) ) ( not ( = ?auto_875463 ?auto_875466 ) ) ( not ( = ?auto_875463 ?auto_875467 ) ) ( not ( = ?auto_875463 ?auto_875468 ) ) ( not ( = ?auto_875463 ?auto_875469 ) ) ( not ( = ?auto_875464 ?auto_875465 ) ) ( not ( = ?auto_875464 ?auto_875466 ) ) ( not ( = ?auto_875464 ?auto_875467 ) ) ( not ( = ?auto_875464 ?auto_875468 ) ) ( not ( = ?auto_875464 ?auto_875469 ) ) ( not ( = ?auto_875465 ?auto_875466 ) ) ( not ( = ?auto_875465 ?auto_875467 ) ) ( not ( = ?auto_875465 ?auto_875468 ) ) ( not ( = ?auto_875465 ?auto_875469 ) ) ( not ( = ?auto_875466 ?auto_875467 ) ) ( not ( = ?auto_875466 ?auto_875468 ) ) ( not ( = ?auto_875466 ?auto_875469 ) ) ( not ( = ?auto_875467 ?auto_875468 ) ) ( not ( = ?auto_875467 ?auto_875469 ) ) ( not ( = ?auto_875468 ?auto_875469 ) ) ( ON ?auto_875467 ?auto_875468 ) ( ON ?auto_875466 ?auto_875467 ) ( ON ?auto_875465 ?auto_875466 ) ( ON ?auto_875464 ?auto_875465 ) ( ON ?auto_875463 ?auto_875464 ) ( CLEAR ?auto_875461 ) ( ON ?auto_875462 ?auto_875463 ) ( CLEAR ?auto_875462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_875455 ?auto_875456 ?auto_875457 ?auto_875458 ?auto_875459 ?auto_875460 ?auto_875461 ?auto_875462 )
      ( MAKE-14PILE ?auto_875455 ?auto_875456 ?auto_875457 ?auto_875458 ?auto_875459 ?auto_875460 ?auto_875461 ?auto_875462 ?auto_875463 ?auto_875464 ?auto_875465 ?auto_875466 ?auto_875467 ?auto_875468 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_875513 - BLOCK
      ?auto_875514 - BLOCK
      ?auto_875515 - BLOCK
      ?auto_875516 - BLOCK
      ?auto_875517 - BLOCK
      ?auto_875518 - BLOCK
      ?auto_875519 - BLOCK
      ?auto_875520 - BLOCK
      ?auto_875521 - BLOCK
      ?auto_875522 - BLOCK
      ?auto_875523 - BLOCK
      ?auto_875524 - BLOCK
      ?auto_875525 - BLOCK
      ?auto_875526 - BLOCK
    )
    :vars
    (
      ?auto_875527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_875526 ?auto_875527 ) ( ON-TABLE ?auto_875513 ) ( ON ?auto_875514 ?auto_875513 ) ( ON ?auto_875515 ?auto_875514 ) ( ON ?auto_875516 ?auto_875515 ) ( ON ?auto_875517 ?auto_875516 ) ( ON ?auto_875518 ?auto_875517 ) ( not ( = ?auto_875513 ?auto_875514 ) ) ( not ( = ?auto_875513 ?auto_875515 ) ) ( not ( = ?auto_875513 ?auto_875516 ) ) ( not ( = ?auto_875513 ?auto_875517 ) ) ( not ( = ?auto_875513 ?auto_875518 ) ) ( not ( = ?auto_875513 ?auto_875519 ) ) ( not ( = ?auto_875513 ?auto_875520 ) ) ( not ( = ?auto_875513 ?auto_875521 ) ) ( not ( = ?auto_875513 ?auto_875522 ) ) ( not ( = ?auto_875513 ?auto_875523 ) ) ( not ( = ?auto_875513 ?auto_875524 ) ) ( not ( = ?auto_875513 ?auto_875525 ) ) ( not ( = ?auto_875513 ?auto_875526 ) ) ( not ( = ?auto_875513 ?auto_875527 ) ) ( not ( = ?auto_875514 ?auto_875515 ) ) ( not ( = ?auto_875514 ?auto_875516 ) ) ( not ( = ?auto_875514 ?auto_875517 ) ) ( not ( = ?auto_875514 ?auto_875518 ) ) ( not ( = ?auto_875514 ?auto_875519 ) ) ( not ( = ?auto_875514 ?auto_875520 ) ) ( not ( = ?auto_875514 ?auto_875521 ) ) ( not ( = ?auto_875514 ?auto_875522 ) ) ( not ( = ?auto_875514 ?auto_875523 ) ) ( not ( = ?auto_875514 ?auto_875524 ) ) ( not ( = ?auto_875514 ?auto_875525 ) ) ( not ( = ?auto_875514 ?auto_875526 ) ) ( not ( = ?auto_875514 ?auto_875527 ) ) ( not ( = ?auto_875515 ?auto_875516 ) ) ( not ( = ?auto_875515 ?auto_875517 ) ) ( not ( = ?auto_875515 ?auto_875518 ) ) ( not ( = ?auto_875515 ?auto_875519 ) ) ( not ( = ?auto_875515 ?auto_875520 ) ) ( not ( = ?auto_875515 ?auto_875521 ) ) ( not ( = ?auto_875515 ?auto_875522 ) ) ( not ( = ?auto_875515 ?auto_875523 ) ) ( not ( = ?auto_875515 ?auto_875524 ) ) ( not ( = ?auto_875515 ?auto_875525 ) ) ( not ( = ?auto_875515 ?auto_875526 ) ) ( not ( = ?auto_875515 ?auto_875527 ) ) ( not ( = ?auto_875516 ?auto_875517 ) ) ( not ( = ?auto_875516 ?auto_875518 ) ) ( not ( = ?auto_875516 ?auto_875519 ) ) ( not ( = ?auto_875516 ?auto_875520 ) ) ( not ( = ?auto_875516 ?auto_875521 ) ) ( not ( = ?auto_875516 ?auto_875522 ) ) ( not ( = ?auto_875516 ?auto_875523 ) ) ( not ( = ?auto_875516 ?auto_875524 ) ) ( not ( = ?auto_875516 ?auto_875525 ) ) ( not ( = ?auto_875516 ?auto_875526 ) ) ( not ( = ?auto_875516 ?auto_875527 ) ) ( not ( = ?auto_875517 ?auto_875518 ) ) ( not ( = ?auto_875517 ?auto_875519 ) ) ( not ( = ?auto_875517 ?auto_875520 ) ) ( not ( = ?auto_875517 ?auto_875521 ) ) ( not ( = ?auto_875517 ?auto_875522 ) ) ( not ( = ?auto_875517 ?auto_875523 ) ) ( not ( = ?auto_875517 ?auto_875524 ) ) ( not ( = ?auto_875517 ?auto_875525 ) ) ( not ( = ?auto_875517 ?auto_875526 ) ) ( not ( = ?auto_875517 ?auto_875527 ) ) ( not ( = ?auto_875518 ?auto_875519 ) ) ( not ( = ?auto_875518 ?auto_875520 ) ) ( not ( = ?auto_875518 ?auto_875521 ) ) ( not ( = ?auto_875518 ?auto_875522 ) ) ( not ( = ?auto_875518 ?auto_875523 ) ) ( not ( = ?auto_875518 ?auto_875524 ) ) ( not ( = ?auto_875518 ?auto_875525 ) ) ( not ( = ?auto_875518 ?auto_875526 ) ) ( not ( = ?auto_875518 ?auto_875527 ) ) ( not ( = ?auto_875519 ?auto_875520 ) ) ( not ( = ?auto_875519 ?auto_875521 ) ) ( not ( = ?auto_875519 ?auto_875522 ) ) ( not ( = ?auto_875519 ?auto_875523 ) ) ( not ( = ?auto_875519 ?auto_875524 ) ) ( not ( = ?auto_875519 ?auto_875525 ) ) ( not ( = ?auto_875519 ?auto_875526 ) ) ( not ( = ?auto_875519 ?auto_875527 ) ) ( not ( = ?auto_875520 ?auto_875521 ) ) ( not ( = ?auto_875520 ?auto_875522 ) ) ( not ( = ?auto_875520 ?auto_875523 ) ) ( not ( = ?auto_875520 ?auto_875524 ) ) ( not ( = ?auto_875520 ?auto_875525 ) ) ( not ( = ?auto_875520 ?auto_875526 ) ) ( not ( = ?auto_875520 ?auto_875527 ) ) ( not ( = ?auto_875521 ?auto_875522 ) ) ( not ( = ?auto_875521 ?auto_875523 ) ) ( not ( = ?auto_875521 ?auto_875524 ) ) ( not ( = ?auto_875521 ?auto_875525 ) ) ( not ( = ?auto_875521 ?auto_875526 ) ) ( not ( = ?auto_875521 ?auto_875527 ) ) ( not ( = ?auto_875522 ?auto_875523 ) ) ( not ( = ?auto_875522 ?auto_875524 ) ) ( not ( = ?auto_875522 ?auto_875525 ) ) ( not ( = ?auto_875522 ?auto_875526 ) ) ( not ( = ?auto_875522 ?auto_875527 ) ) ( not ( = ?auto_875523 ?auto_875524 ) ) ( not ( = ?auto_875523 ?auto_875525 ) ) ( not ( = ?auto_875523 ?auto_875526 ) ) ( not ( = ?auto_875523 ?auto_875527 ) ) ( not ( = ?auto_875524 ?auto_875525 ) ) ( not ( = ?auto_875524 ?auto_875526 ) ) ( not ( = ?auto_875524 ?auto_875527 ) ) ( not ( = ?auto_875525 ?auto_875526 ) ) ( not ( = ?auto_875525 ?auto_875527 ) ) ( not ( = ?auto_875526 ?auto_875527 ) ) ( ON ?auto_875525 ?auto_875526 ) ( ON ?auto_875524 ?auto_875525 ) ( ON ?auto_875523 ?auto_875524 ) ( ON ?auto_875522 ?auto_875523 ) ( ON ?auto_875521 ?auto_875522 ) ( ON ?auto_875520 ?auto_875521 ) ( CLEAR ?auto_875518 ) ( ON ?auto_875519 ?auto_875520 ) ( CLEAR ?auto_875519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_875513 ?auto_875514 ?auto_875515 ?auto_875516 ?auto_875517 ?auto_875518 ?auto_875519 )
      ( MAKE-14PILE ?auto_875513 ?auto_875514 ?auto_875515 ?auto_875516 ?auto_875517 ?auto_875518 ?auto_875519 ?auto_875520 ?auto_875521 ?auto_875522 ?auto_875523 ?auto_875524 ?auto_875525 ?auto_875526 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_875571 - BLOCK
      ?auto_875572 - BLOCK
      ?auto_875573 - BLOCK
      ?auto_875574 - BLOCK
      ?auto_875575 - BLOCK
      ?auto_875576 - BLOCK
      ?auto_875577 - BLOCK
      ?auto_875578 - BLOCK
      ?auto_875579 - BLOCK
      ?auto_875580 - BLOCK
      ?auto_875581 - BLOCK
      ?auto_875582 - BLOCK
      ?auto_875583 - BLOCK
      ?auto_875584 - BLOCK
    )
    :vars
    (
      ?auto_875585 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_875584 ?auto_875585 ) ( ON-TABLE ?auto_875571 ) ( ON ?auto_875572 ?auto_875571 ) ( ON ?auto_875573 ?auto_875572 ) ( ON ?auto_875574 ?auto_875573 ) ( ON ?auto_875575 ?auto_875574 ) ( not ( = ?auto_875571 ?auto_875572 ) ) ( not ( = ?auto_875571 ?auto_875573 ) ) ( not ( = ?auto_875571 ?auto_875574 ) ) ( not ( = ?auto_875571 ?auto_875575 ) ) ( not ( = ?auto_875571 ?auto_875576 ) ) ( not ( = ?auto_875571 ?auto_875577 ) ) ( not ( = ?auto_875571 ?auto_875578 ) ) ( not ( = ?auto_875571 ?auto_875579 ) ) ( not ( = ?auto_875571 ?auto_875580 ) ) ( not ( = ?auto_875571 ?auto_875581 ) ) ( not ( = ?auto_875571 ?auto_875582 ) ) ( not ( = ?auto_875571 ?auto_875583 ) ) ( not ( = ?auto_875571 ?auto_875584 ) ) ( not ( = ?auto_875571 ?auto_875585 ) ) ( not ( = ?auto_875572 ?auto_875573 ) ) ( not ( = ?auto_875572 ?auto_875574 ) ) ( not ( = ?auto_875572 ?auto_875575 ) ) ( not ( = ?auto_875572 ?auto_875576 ) ) ( not ( = ?auto_875572 ?auto_875577 ) ) ( not ( = ?auto_875572 ?auto_875578 ) ) ( not ( = ?auto_875572 ?auto_875579 ) ) ( not ( = ?auto_875572 ?auto_875580 ) ) ( not ( = ?auto_875572 ?auto_875581 ) ) ( not ( = ?auto_875572 ?auto_875582 ) ) ( not ( = ?auto_875572 ?auto_875583 ) ) ( not ( = ?auto_875572 ?auto_875584 ) ) ( not ( = ?auto_875572 ?auto_875585 ) ) ( not ( = ?auto_875573 ?auto_875574 ) ) ( not ( = ?auto_875573 ?auto_875575 ) ) ( not ( = ?auto_875573 ?auto_875576 ) ) ( not ( = ?auto_875573 ?auto_875577 ) ) ( not ( = ?auto_875573 ?auto_875578 ) ) ( not ( = ?auto_875573 ?auto_875579 ) ) ( not ( = ?auto_875573 ?auto_875580 ) ) ( not ( = ?auto_875573 ?auto_875581 ) ) ( not ( = ?auto_875573 ?auto_875582 ) ) ( not ( = ?auto_875573 ?auto_875583 ) ) ( not ( = ?auto_875573 ?auto_875584 ) ) ( not ( = ?auto_875573 ?auto_875585 ) ) ( not ( = ?auto_875574 ?auto_875575 ) ) ( not ( = ?auto_875574 ?auto_875576 ) ) ( not ( = ?auto_875574 ?auto_875577 ) ) ( not ( = ?auto_875574 ?auto_875578 ) ) ( not ( = ?auto_875574 ?auto_875579 ) ) ( not ( = ?auto_875574 ?auto_875580 ) ) ( not ( = ?auto_875574 ?auto_875581 ) ) ( not ( = ?auto_875574 ?auto_875582 ) ) ( not ( = ?auto_875574 ?auto_875583 ) ) ( not ( = ?auto_875574 ?auto_875584 ) ) ( not ( = ?auto_875574 ?auto_875585 ) ) ( not ( = ?auto_875575 ?auto_875576 ) ) ( not ( = ?auto_875575 ?auto_875577 ) ) ( not ( = ?auto_875575 ?auto_875578 ) ) ( not ( = ?auto_875575 ?auto_875579 ) ) ( not ( = ?auto_875575 ?auto_875580 ) ) ( not ( = ?auto_875575 ?auto_875581 ) ) ( not ( = ?auto_875575 ?auto_875582 ) ) ( not ( = ?auto_875575 ?auto_875583 ) ) ( not ( = ?auto_875575 ?auto_875584 ) ) ( not ( = ?auto_875575 ?auto_875585 ) ) ( not ( = ?auto_875576 ?auto_875577 ) ) ( not ( = ?auto_875576 ?auto_875578 ) ) ( not ( = ?auto_875576 ?auto_875579 ) ) ( not ( = ?auto_875576 ?auto_875580 ) ) ( not ( = ?auto_875576 ?auto_875581 ) ) ( not ( = ?auto_875576 ?auto_875582 ) ) ( not ( = ?auto_875576 ?auto_875583 ) ) ( not ( = ?auto_875576 ?auto_875584 ) ) ( not ( = ?auto_875576 ?auto_875585 ) ) ( not ( = ?auto_875577 ?auto_875578 ) ) ( not ( = ?auto_875577 ?auto_875579 ) ) ( not ( = ?auto_875577 ?auto_875580 ) ) ( not ( = ?auto_875577 ?auto_875581 ) ) ( not ( = ?auto_875577 ?auto_875582 ) ) ( not ( = ?auto_875577 ?auto_875583 ) ) ( not ( = ?auto_875577 ?auto_875584 ) ) ( not ( = ?auto_875577 ?auto_875585 ) ) ( not ( = ?auto_875578 ?auto_875579 ) ) ( not ( = ?auto_875578 ?auto_875580 ) ) ( not ( = ?auto_875578 ?auto_875581 ) ) ( not ( = ?auto_875578 ?auto_875582 ) ) ( not ( = ?auto_875578 ?auto_875583 ) ) ( not ( = ?auto_875578 ?auto_875584 ) ) ( not ( = ?auto_875578 ?auto_875585 ) ) ( not ( = ?auto_875579 ?auto_875580 ) ) ( not ( = ?auto_875579 ?auto_875581 ) ) ( not ( = ?auto_875579 ?auto_875582 ) ) ( not ( = ?auto_875579 ?auto_875583 ) ) ( not ( = ?auto_875579 ?auto_875584 ) ) ( not ( = ?auto_875579 ?auto_875585 ) ) ( not ( = ?auto_875580 ?auto_875581 ) ) ( not ( = ?auto_875580 ?auto_875582 ) ) ( not ( = ?auto_875580 ?auto_875583 ) ) ( not ( = ?auto_875580 ?auto_875584 ) ) ( not ( = ?auto_875580 ?auto_875585 ) ) ( not ( = ?auto_875581 ?auto_875582 ) ) ( not ( = ?auto_875581 ?auto_875583 ) ) ( not ( = ?auto_875581 ?auto_875584 ) ) ( not ( = ?auto_875581 ?auto_875585 ) ) ( not ( = ?auto_875582 ?auto_875583 ) ) ( not ( = ?auto_875582 ?auto_875584 ) ) ( not ( = ?auto_875582 ?auto_875585 ) ) ( not ( = ?auto_875583 ?auto_875584 ) ) ( not ( = ?auto_875583 ?auto_875585 ) ) ( not ( = ?auto_875584 ?auto_875585 ) ) ( ON ?auto_875583 ?auto_875584 ) ( ON ?auto_875582 ?auto_875583 ) ( ON ?auto_875581 ?auto_875582 ) ( ON ?auto_875580 ?auto_875581 ) ( ON ?auto_875579 ?auto_875580 ) ( ON ?auto_875578 ?auto_875579 ) ( ON ?auto_875577 ?auto_875578 ) ( CLEAR ?auto_875575 ) ( ON ?auto_875576 ?auto_875577 ) ( CLEAR ?auto_875576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_875571 ?auto_875572 ?auto_875573 ?auto_875574 ?auto_875575 ?auto_875576 )
      ( MAKE-14PILE ?auto_875571 ?auto_875572 ?auto_875573 ?auto_875574 ?auto_875575 ?auto_875576 ?auto_875577 ?auto_875578 ?auto_875579 ?auto_875580 ?auto_875581 ?auto_875582 ?auto_875583 ?auto_875584 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_875629 - BLOCK
      ?auto_875630 - BLOCK
      ?auto_875631 - BLOCK
      ?auto_875632 - BLOCK
      ?auto_875633 - BLOCK
      ?auto_875634 - BLOCK
      ?auto_875635 - BLOCK
      ?auto_875636 - BLOCK
      ?auto_875637 - BLOCK
      ?auto_875638 - BLOCK
      ?auto_875639 - BLOCK
      ?auto_875640 - BLOCK
      ?auto_875641 - BLOCK
      ?auto_875642 - BLOCK
    )
    :vars
    (
      ?auto_875643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_875642 ?auto_875643 ) ( ON-TABLE ?auto_875629 ) ( ON ?auto_875630 ?auto_875629 ) ( ON ?auto_875631 ?auto_875630 ) ( ON ?auto_875632 ?auto_875631 ) ( not ( = ?auto_875629 ?auto_875630 ) ) ( not ( = ?auto_875629 ?auto_875631 ) ) ( not ( = ?auto_875629 ?auto_875632 ) ) ( not ( = ?auto_875629 ?auto_875633 ) ) ( not ( = ?auto_875629 ?auto_875634 ) ) ( not ( = ?auto_875629 ?auto_875635 ) ) ( not ( = ?auto_875629 ?auto_875636 ) ) ( not ( = ?auto_875629 ?auto_875637 ) ) ( not ( = ?auto_875629 ?auto_875638 ) ) ( not ( = ?auto_875629 ?auto_875639 ) ) ( not ( = ?auto_875629 ?auto_875640 ) ) ( not ( = ?auto_875629 ?auto_875641 ) ) ( not ( = ?auto_875629 ?auto_875642 ) ) ( not ( = ?auto_875629 ?auto_875643 ) ) ( not ( = ?auto_875630 ?auto_875631 ) ) ( not ( = ?auto_875630 ?auto_875632 ) ) ( not ( = ?auto_875630 ?auto_875633 ) ) ( not ( = ?auto_875630 ?auto_875634 ) ) ( not ( = ?auto_875630 ?auto_875635 ) ) ( not ( = ?auto_875630 ?auto_875636 ) ) ( not ( = ?auto_875630 ?auto_875637 ) ) ( not ( = ?auto_875630 ?auto_875638 ) ) ( not ( = ?auto_875630 ?auto_875639 ) ) ( not ( = ?auto_875630 ?auto_875640 ) ) ( not ( = ?auto_875630 ?auto_875641 ) ) ( not ( = ?auto_875630 ?auto_875642 ) ) ( not ( = ?auto_875630 ?auto_875643 ) ) ( not ( = ?auto_875631 ?auto_875632 ) ) ( not ( = ?auto_875631 ?auto_875633 ) ) ( not ( = ?auto_875631 ?auto_875634 ) ) ( not ( = ?auto_875631 ?auto_875635 ) ) ( not ( = ?auto_875631 ?auto_875636 ) ) ( not ( = ?auto_875631 ?auto_875637 ) ) ( not ( = ?auto_875631 ?auto_875638 ) ) ( not ( = ?auto_875631 ?auto_875639 ) ) ( not ( = ?auto_875631 ?auto_875640 ) ) ( not ( = ?auto_875631 ?auto_875641 ) ) ( not ( = ?auto_875631 ?auto_875642 ) ) ( not ( = ?auto_875631 ?auto_875643 ) ) ( not ( = ?auto_875632 ?auto_875633 ) ) ( not ( = ?auto_875632 ?auto_875634 ) ) ( not ( = ?auto_875632 ?auto_875635 ) ) ( not ( = ?auto_875632 ?auto_875636 ) ) ( not ( = ?auto_875632 ?auto_875637 ) ) ( not ( = ?auto_875632 ?auto_875638 ) ) ( not ( = ?auto_875632 ?auto_875639 ) ) ( not ( = ?auto_875632 ?auto_875640 ) ) ( not ( = ?auto_875632 ?auto_875641 ) ) ( not ( = ?auto_875632 ?auto_875642 ) ) ( not ( = ?auto_875632 ?auto_875643 ) ) ( not ( = ?auto_875633 ?auto_875634 ) ) ( not ( = ?auto_875633 ?auto_875635 ) ) ( not ( = ?auto_875633 ?auto_875636 ) ) ( not ( = ?auto_875633 ?auto_875637 ) ) ( not ( = ?auto_875633 ?auto_875638 ) ) ( not ( = ?auto_875633 ?auto_875639 ) ) ( not ( = ?auto_875633 ?auto_875640 ) ) ( not ( = ?auto_875633 ?auto_875641 ) ) ( not ( = ?auto_875633 ?auto_875642 ) ) ( not ( = ?auto_875633 ?auto_875643 ) ) ( not ( = ?auto_875634 ?auto_875635 ) ) ( not ( = ?auto_875634 ?auto_875636 ) ) ( not ( = ?auto_875634 ?auto_875637 ) ) ( not ( = ?auto_875634 ?auto_875638 ) ) ( not ( = ?auto_875634 ?auto_875639 ) ) ( not ( = ?auto_875634 ?auto_875640 ) ) ( not ( = ?auto_875634 ?auto_875641 ) ) ( not ( = ?auto_875634 ?auto_875642 ) ) ( not ( = ?auto_875634 ?auto_875643 ) ) ( not ( = ?auto_875635 ?auto_875636 ) ) ( not ( = ?auto_875635 ?auto_875637 ) ) ( not ( = ?auto_875635 ?auto_875638 ) ) ( not ( = ?auto_875635 ?auto_875639 ) ) ( not ( = ?auto_875635 ?auto_875640 ) ) ( not ( = ?auto_875635 ?auto_875641 ) ) ( not ( = ?auto_875635 ?auto_875642 ) ) ( not ( = ?auto_875635 ?auto_875643 ) ) ( not ( = ?auto_875636 ?auto_875637 ) ) ( not ( = ?auto_875636 ?auto_875638 ) ) ( not ( = ?auto_875636 ?auto_875639 ) ) ( not ( = ?auto_875636 ?auto_875640 ) ) ( not ( = ?auto_875636 ?auto_875641 ) ) ( not ( = ?auto_875636 ?auto_875642 ) ) ( not ( = ?auto_875636 ?auto_875643 ) ) ( not ( = ?auto_875637 ?auto_875638 ) ) ( not ( = ?auto_875637 ?auto_875639 ) ) ( not ( = ?auto_875637 ?auto_875640 ) ) ( not ( = ?auto_875637 ?auto_875641 ) ) ( not ( = ?auto_875637 ?auto_875642 ) ) ( not ( = ?auto_875637 ?auto_875643 ) ) ( not ( = ?auto_875638 ?auto_875639 ) ) ( not ( = ?auto_875638 ?auto_875640 ) ) ( not ( = ?auto_875638 ?auto_875641 ) ) ( not ( = ?auto_875638 ?auto_875642 ) ) ( not ( = ?auto_875638 ?auto_875643 ) ) ( not ( = ?auto_875639 ?auto_875640 ) ) ( not ( = ?auto_875639 ?auto_875641 ) ) ( not ( = ?auto_875639 ?auto_875642 ) ) ( not ( = ?auto_875639 ?auto_875643 ) ) ( not ( = ?auto_875640 ?auto_875641 ) ) ( not ( = ?auto_875640 ?auto_875642 ) ) ( not ( = ?auto_875640 ?auto_875643 ) ) ( not ( = ?auto_875641 ?auto_875642 ) ) ( not ( = ?auto_875641 ?auto_875643 ) ) ( not ( = ?auto_875642 ?auto_875643 ) ) ( ON ?auto_875641 ?auto_875642 ) ( ON ?auto_875640 ?auto_875641 ) ( ON ?auto_875639 ?auto_875640 ) ( ON ?auto_875638 ?auto_875639 ) ( ON ?auto_875637 ?auto_875638 ) ( ON ?auto_875636 ?auto_875637 ) ( ON ?auto_875635 ?auto_875636 ) ( ON ?auto_875634 ?auto_875635 ) ( CLEAR ?auto_875632 ) ( ON ?auto_875633 ?auto_875634 ) ( CLEAR ?auto_875633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_875629 ?auto_875630 ?auto_875631 ?auto_875632 ?auto_875633 )
      ( MAKE-14PILE ?auto_875629 ?auto_875630 ?auto_875631 ?auto_875632 ?auto_875633 ?auto_875634 ?auto_875635 ?auto_875636 ?auto_875637 ?auto_875638 ?auto_875639 ?auto_875640 ?auto_875641 ?auto_875642 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_875687 - BLOCK
      ?auto_875688 - BLOCK
      ?auto_875689 - BLOCK
      ?auto_875690 - BLOCK
      ?auto_875691 - BLOCK
      ?auto_875692 - BLOCK
      ?auto_875693 - BLOCK
      ?auto_875694 - BLOCK
      ?auto_875695 - BLOCK
      ?auto_875696 - BLOCK
      ?auto_875697 - BLOCK
      ?auto_875698 - BLOCK
      ?auto_875699 - BLOCK
      ?auto_875700 - BLOCK
    )
    :vars
    (
      ?auto_875701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_875700 ?auto_875701 ) ( ON-TABLE ?auto_875687 ) ( ON ?auto_875688 ?auto_875687 ) ( ON ?auto_875689 ?auto_875688 ) ( not ( = ?auto_875687 ?auto_875688 ) ) ( not ( = ?auto_875687 ?auto_875689 ) ) ( not ( = ?auto_875687 ?auto_875690 ) ) ( not ( = ?auto_875687 ?auto_875691 ) ) ( not ( = ?auto_875687 ?auto_875692 ) ) ( not ( = ?auto_875687 ?auto_875693 ) ) ( not ( = ?auto_875687 ?auto_875694 ) ) ( not ( = ?auto_875687 ?auto_875695 ) ) ( not ( = ?auto_875687 ?auto_875696 ) ) ( not ( = ?auto_875687 ?auto_875697 ) ) ( not ( = ?auto_875687 ?auto_875698 ) ) ( not ( = ?auto_875687 ?auto_875699 ) ) ( not ( = ?auto_875687 ?auto_875700 ) ) ( not ( = ?auto_875687 ?auto_875701 ) ) ( not ( = ?auto_875688 ?auto_875689 ) ) ( not ( = ?auto_875688 ?auto_875690 ) ) ( not ( = ?auto_875688 ?auto_875691 ) ) ( not ( = ?auto_875688 ?auto_875692 ) ) ( not ( = ?auto_875688 ?auto_875693 ) ) ( not ( = ?auto_875688 ?auto_875694 ) ) ( not ( = ?auto_875688 ?auto_875695 ) ) ( not ( = ?auto_875688 ?auto_875696 ) ) ( not ( = ?auto_875688 ?auto_875697 ) ) ( not ( = ?auto_875688 ?auto_875698 ) ) ( not ( = ?auto_875688 ?auto_875699 ) ) ( not ( = ?auto_875688 ?auto_875700 ) ) ( not ( = ?auto_875688 ?auto_875701 ) ) ( not ( = ?auto_875689 ?auto_875690 ) ) ( not ( = ?auto_875689 ?auto_875691 ) ) ( not ( = ?auto_875689 ?auto_875692 ) ) ( not ( = ?auto_875689 ?auto_875693 ) ) ( not ( = ?auto_875689 ?auto_875694 ) ) ( not ( = ?auto_875689 ?auto_875695 ) ) ( not ( = ?auto_875689 ?auto_875696 ) ) ( not ( = ?auto_875689 ?auto_875697 ) ) ( not ( = ?auto_875689 ?auto_875698 ) ) ( not ( = ?auto_875689 ?auto_875699 ) ) ( not ( = ?auto_875689 ?auto_875700 ) ) ( not ( = ?auto_875689 ?auto_875701 ) ) ( not ( = ?auto_875690 ?auto_875691 ) ) ( not ( = ?auto_875690 ?auto_875692 ) ) ( not ( = ?auto_875690 ?auto_875693 ) ) ( not ( = ?auto_875690 ?auto_875694 ) ) ( not ( = ?auto_875690 ?auto_875695 ) ) ( not ( = ?auto_875690 ?auto_875696 ) ) ( not ( = ?auto_875690 ?auto_875697 ) ) ( not ( = ?auto_875690 ?auto_875698 ) ) ( not ( = ?auto_875690 ?auto_875699 ) ) ( not ( = ?auto_875690 ?auto_875700 ) ) ( not ( = ?auto_875690 ?auto_875701 ) ) ( not ( = ?auto_875691 ?auto_875692 ) ) ( not ( = ?auto_875691 ?auto_875693 ) ) ( not ( = ?auto_875691 ?auto_875694 ) ) ( not ( = ?auto_875691 ?auto_875695 ) ) ( not ( = ?auto_875691 ?auto_875696 ) ) ( not ( = ?auto_875691 ?auto_875697 ) ) ( not ( = ?auto_875691 ?auto_875698 ) ) ( not ( = ?auto_875691 ?auto_875699 ) ) ( not ( = ?auto_875691 ?auto_875700 ) ) ( not ( = ?auto_875691 ?auto_875701 ) ) ( not ( = ?auto_875692 ?auto_875693 ) ) ( not ( = ?auto_875692 ?auto_875694 ) ) ( not ( = ?auto_875692 ?auto_875695 ) ) ( not ( = ?auto_875692 ?auto_875696 ) ) ( not ( = ?auto_875692 ?auto_875697 ) ) ( not ( = ?auto_875692 ?auto_875698 ) ) ( not ( = ?auto_875692 ?auto_875699 ) ) ( not ( = ?auto_875692 ?auto_875700 ) ) ( not ( = ?auto_875692 ?auto_875701 ) ) ( not ( = ?auto_875693 ?auto_875694 ) ) ( not ( = ?auto_875693 ?auto_875695 ) ) ( not ( = ?auto_875693 ?auto_875696 ) ) ( not ( = ?auto_875693 ?auto_875697 ) ) ( not ( = ?auto_875693 ?auto_875698 ) ) ( not ( = ?auto_875693 ?auto_875699 ) ) ( not ( = ?auto_875693 ?auto_875700 ) ) ( not ( = ?auto_875693 ?auto_875701 ) ) ( not ( = ?auto_875694 ?auto_875695 ) ) ( not ( = ?auto_875694 ?auto_875696 ) ) ( not ( = ?auto_875694 ?auto_875697 ) ) ( not ( = ?auto_875694 ?auto_875698 ) ) ( not ( = ?auto_875694 ?auto_875699 ) ) ( not ( = ?auto_875694 ?auto_875700 ) ) ( not ( = ?auto_875694 ?auto_875701 ) ) ( not ( = ?auto_875695 ?auto_875696 ) ) ( not ( = ?auto_875695 ?auto_875697 ) ) ( not ( = ?auto_875695 ?auto_875698 ) ) ( not ( = ?auto_875695 ?auto_875699 ) ) ( not ( = ?auto_875695 ?auto_875700 ) ) ( not ( = ?auto_875695 ?auto_875701 ) ) ( not ( = ?auto_875696 ?auto_875697 ) ) ( not ( = ?auto_875696 ?auto_875698 ) ) ( not ( = ?auto_875696 ?auto_875699 ) ) ( not ( = ?auto_875696 ?auto_875700 ) ) ( not ( = ?auto_875696 ?auto_875701 ) ) ( not ( = ?auto_875697 ?auto_875698 ) ) ( not ( = ?auto_875697 ?auto_875699 ) ) ( not ( = ?auto_875697 ?auto_875700 ) ) ( not ( = ?auto_875697 ?auto_875701 ) ) ( not ( = ?auto_875698 ?auto_875699 ) ) ( not ( = ?auto_875698 ?auto_875700 ) ) ( not ( = ?auto_875698 ?auto_875701 ) ) ( not ( = ?auto_875699 ?auto_875700 ) ) ( not ( = ?auto_875699 ?auto_875701 ) ) ( not ( = ?auto_875700 ?auto_875701 ) ) ( ON ?auto_875699 ?auto_875700 ) ( ON ?auto_875698 ?auto_875699 ) ( ON ?auto_875697 ?auto_875698 ) ( ON ?auto_875696 ?auto_875697 ) ( ON ?auto_875695 ?auto_875696 ) ( ON ?auto_875694 ?auto_875695 ) ( ON ?auto_875693 ?auto_875694 ) ( ON ?auto_875692 ?auto_875693 ) ( ON ?auto_875691 ?auto_875692 ) ( CLEAR ?auto_875689 ) ( ON ?auto_875690 ?auto_875691 ) ( CLEAR ?auto_875690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_875687 ?auto_875688 ?auto_875689 ?auto_875690 )
      ( MAKE-14PILE ?auto_875687 ?auto_875688 ?auto_875689 ?auto_875690 ?auto_875691 ?auto_875692 ?auto_875693 ?auto_875694 ?auto_875695 ?auto_875696 ?auto_875697 ?auto_875698 ?auto_875699 ?auto_875700 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_875745 - BLOCK
      ?auto_875746 - BLOCK
      ?auto_875747 - BLOCK
      ?auto_875748 - BLOCK
      ?auto_875749 - BLOCK
      ?auto_875750 - BLOCK
      ?auto_875751 - BLOCK
      ?auto_875752 - BLOCK
      ?auto_875753 - BLOCK
      ?auto_875754 - BLOCK
      ?auto_875755 - BLOCK
      ?auto_875756 - BLOCK
      ?auto_875757 - BLOCK
      ?auto_875758 - BLOCK
    )
    :vars
    (
      ?auto_875759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_875758 ?auto_875759 ) ( ON-TABLE ?auto_875745 ) ( ON ?auto_875746 ?auto_875745 ) ( not ( = ?auto_875745 ?auto_875746 ) ) ( not ( = ?auto_875745 ?auto_875747 ) ) ( not ( = ?auto_875745 ?auto_875748 ) ) ( not ( = ?auto_875745 ?auto_875749 ) ) ( not ( = ?auto_875745 ?auto_875750 ) ) ( not ( = ?auto_875745 ?auto_875751 ) ) ( not ( = ?auto_875745 ?auto_875752 ) ) ( not ( = ?auto_875745 ?auto_875753 ) ) ( not ( = ?auto_875745 ?auto_875754 ) ) ( not ( = ?auto_875745 ?auto_875755 ) ) ( not ( = ?auto_875745 ?auto_875756 ) ) ( not ( = ?auto_875745 ?auto_875757 ) ) ( not ( = ?auto_875745 ?auto_875758 ) ) ( not ( = ?auto_875745 ?auto_875759 ) ) ( not ( = ?auto_875746 ?auto_875747 ) ) ( not ( = ?auto_875746 ?auto_875748 ) ) ( not ( = ?auto_875746 ?auto_875749 ) ) ( not ( = ?auto_875746 ?auto_875750 ) ) ( not ( = ?auto_875746 ?auto_875751 ) ) ( not ( = ?auto_875746 ?auto_875752 ) ) ( not ( = ?auto_875746 ?auto_875753 ) ) ( not ( = ?auto_875746 ?auto_875754 ) ) ( not ( = ?auto_875746 ?auto_875755 ) ) ( not ( = ?auto_875746 ?auto_875756 ) ) ( not ( = ?auto_875746 ?auto_875757 ) ) ( not ( = ?auto_875746 ?auto_875758 ) ) ( not ( = ?auto_875746 ?auto_875759 ) ) ( not ( = ?auto_875747 ?auto_875748 ) ) ( not ( = ?auto_875747 ?auto_875749 ) ) ( not ( = ?auto_875747 ?auto_875750 ) ) ( not ( = ?auto_875747 ?auto_875751 ) ) ( not ( = ?auto_875747 ?auto_875752 ) ) ( not ( = ?auto_875747 ?auto_875753 ) ) ( not ( = ?auto_875747 ?auto_875754 ) ) ( not ( = ?auto_875747 ?auto_875755 ) ) ( not ( = ?auto_875747 ?auto_875756 ) ) ( not ( = ?auto_875747 ?auto_875757 ) ) ( not ( = ?auto_875747 ?auto_875758 ) ) ( not ( = ?auto_875747 ?auto_875759 ) ) ( not ( = ?auto_875748 ?auto_875749 ) ) ( not ( = ?auto_875748 ?auto_875750 ) ) ( not ( = ?auto_875748 ?auto_875751 ) ) ( not ( = ?auto_875748 ?auto_875752 ) ) ( not ( = ?auto_875748 ?auto_875753 ) ) ( not ( = ?auto_875748 ?auto_875754 ) ) ( not ( = ?auto_875748 ?auto_875755 ) ) ( not ( = ?auto_875748 ?auto_875756 ) ) ( not ( = ?auto_875748 ?auto_875757 ) ) ( not ( = ?auto_875748 ?auto_875758 ) ) ( not ( = ?auto_875748 ?auto_875759 ) ) ( not ( = ?auto_875749 ?auto_875750 ) ) ( not ( = ?auto_875749 ?auto_875751 ) ) ( not ( = ?auto_875749 ?auto_875752 ) ) ( not ( = ?auto_875749 ?auto_875753 ) ) ( not ( = ?auto_875749 ?auto_875754 ) ) ( not ( = ?auto_875749 ?auto_875755 ) ) ( not ( = ?auto_875749 ?auto_875756 ) ) ( not ( = ?auto_875749 ?auto_875757 ) ) ( not ( = ?auto_875749 ?auto_875758 ) ) ( not ( = ?auto_875749 ?auto_875759 ) ) ( not ( = ?auto_875750 ?auto_875751 ) ) ( not ( = ?auto_875750 ?auto_875752 ) ) ( not ( = ?auto_875750 ?auto_875753 ) ) ( not ( = ?auto_875750 ?auto_875754 ) ) ( not ( = ?auto_875750 ?auto_875755 ) ) ( not ( = ?auto_875750 ?auto_875756 ) ) ( not ( = ?auto_875750 ?auto_875757 ) ) ( not ( = ?auto_875750 ?auto_875758 ) ) ( not ( = ?auto_875750 ?auto_875759 ) ) ( not ( = ?auto_875751 ?auto_875752 ) ) ( not ( = ?auto_875751 ?auto_875753 ) ) ( not ( = ?auto_875751 ?auto_875754 ) ) ( not ( = ?auto_875751 ?auto_875755 ) ) ( not ( = ?auto_875751 ?auto_875756 ) ) ( not ( = ?auto_875751 ?auto_875757 ) ) ( not ( = ?auto_875751 ?auto_875758 ) ) ( not ( = ?auto_875751 ?auto_875759 ) ) ( not ( = ?auto_875752 ?auto_875753 ) ) ( not ( = ?auto_875752 ?auto_875754 ) ) ( not ( = ?auto_875752 ?auto_875755 ) ) ( not ( = ?auto_875752 ?auto_875756 ) ) ( not ( = ?auto_875752 ?auto_875757 ) ) ( not ( = ?auto_875752 ?auto_875758 ) ) ( not ( = ?auto_875752 ?auto_875759 ) ) ( not ( = ?auto_875753 ?auto_875754 ) ) ( not ( = ?auto_875753 ?auto_875755 ) ) ( not ( = ?auto_875753 ?auto_875756 ) ) ( not ( = ?auto_875753 ?auto_875757 ) ) ( not ( = ?auto_875753 ?auto_875758 ) ) ( not ( = ?auto_875753 ?auto_875759 ) ) ( not ( = ?auto_875754 ?auto_875755 ) ) ( not ( = ?auto_875754 ?auto_875756 ) ) ( not ( = ?auto_875754 ?auto_875757 ) ) ( not ( = ?auto_875754 ?auto_875758 ) ) ( not ( = ?auto_875754 ?auto_875759 ) ) ( not ( = ?auto_875755 ?auto_875756 ) ) ( not ( = ?auto_875755 ?auto_875757 ) ) ( not ( = ?auto_875755 ?auto_875758 ) ) ( not ( = ?auto_875755 ?auto_875759 ) ) ( not ( = ?auto_875756 ?auto_875757 ) ) ( not ( = ?auto_875756 ?auto_875758 ) ) ( not ( = ?auto_875756 ?auto_875759 ) ) ( not ( = ?auto_875757 ?auto_875758 ) ) ( not ( = ?auto_875757 ?auto_875759 ) ) ( not ( = ?auto_875758 ?auto_875759 ) ) ( ON ?auto_875757 ?auto_875758 ) ( ON ?auto_875756 ?auto_875757 ) ( ON ?auto_875755 ?auto_875756 ) ( ON ?auto_875754 ?auto_875755 ) ( ON ?auto_875753 ?auto_875754 ) ( ON ?auto_875752 ?auto_875753 ) ( ON ?auto_875751 ?auto_875752 ) ( ON ?auto_875750 ?auto_875751 ) ( ON ?auto_875749 ?auto_875750 ) ( ON ?auto_875748 ?auto_875749 ) ( CLEAR ?auto_875746 ) ( ON ?auto_875747 ?auto_875748 ) ( CLEAR ?auto_875747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_875745 ?auto_875746 ?auto_875747 )
      ( MAKE-14PILE ?auto_875745 ?auto_875746 ?auto_875747 ?auto_875748 ?auto_875749 ?auto_875750 ?auto_875751 ?auto_875752 ?auto_875753 ?auto_875754 ?auto_875755 ?auto_875756 ?auto_875757 ?auto_875758 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_875803 - BLOCK
      ?auto_875804 - BLOCK
      ?auto_875805 - BLOCK
      ?auto_875806 - BLOCK
      ?auto_875807 - BLOCK
      ?auto_875808 - BLOCK
      ?auto_875809 - BLOCK
      ?auto_875810 - BLOCK
      ?auto_875811 - BLOCK
      ?auto_875812 - BLOCK
      ?auto_875813 - BLOCK
      ?auto_875814 - BLOCK
      ?auto_875815 - BLOCK
      ?auto_875816 - BLOCK
    )
    :vars
    (
      ?auto_875817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_875816 ?auto_875817 ) ( ON-TABLE ?auto_875803 ) ( not ( = ?auto_875803 ?auto_875804 ) ) ( not ( = ?auto_875803 ?auto_875805 ) ) ( not ( = ?auto_875803 ?auto_875806 ) ) ( not ( = ?auto_875803 ?auto_875807 ) ) ( not ( = ?auto_875803 ?auto_875808 ) ) ( not ( = ?auto_875803 ?auto_875809 ) ) ( not ( = ?auto_875803 ?auto_875810 ) ) ( not ( = ?auto_875803 ?auto_875811 ) ) ( not ( = ?auto_875803 ?auto_875812 ) ) ( not ( = ?auto_875803 ?auto_875813 ) ) ( not ( = ?auto_875803 ?auto_875814 ) ) ( not ( = ?auto_875803 ?auto_875815 ) ) ( not ( = ?auto_875803 ?auto_875816 ) ) ( not ( = ?auto_875803 ?auto_875817 ) ) ( not ( = ?auto_875804 ?auto_875805 ) ) ( not ( = ?auto_875804 ?auto_875806 ) ) ( not ( = ?auto_875804 ?auto_875807 ) ) ( not ( = ?auto_875804 ?auto_875808 ) ) ( not ( = ?auto_875804 ?auto_875809 ) ) ( not ( = ?auto_875804 ?auto_875810 ) ) ( not ( = ?auto_875804 ?auto_875811 ) ) ( not ( = ?auto_875804 ?auto_875812 ) ) ( not ( = ?auto_875804 ?auto_875813 ) ) ( not ( = ?auto_875804 ?auto_875814 ) ) ( not ( = ?auto_875804 ?auto_875815 ) ) ( not ( = ?auto_875804 ?auto_875816 ) ) ( not ( = ?auto_875804 ?auto_875817 ) ) ( not ( = ?auto_875805 ?auto_875806 ) ) ( not ( = ?auto_875805 ?auto_875807 ) ) ( not ( = ?auto_875805 ?auto_875808 ) ) ( not ( = ?auto_875805 ?auto_875809 ) ) ( not ( = ?auto_875805 ?auto_875810 ) ) ( not ( = ?auto_875805 ?auto_875811 ) ) ( not ( = ?auto_875805 ?auto_875812 ) ) ( not ( = ?auto_875805 ?auto_875813 ) ) ( not ( = ?auto_875805 ?auto_875814 ) ) ( not ( = ?auto_875805 ?auto_875815 ) ) ( not ( = ?auto_875805 ?auto_875816 ) ) ( not ( = ?auto_875805 ?auto_875817 ) ) ( not ( = ?auto_875806 ?auto_875807 ) ) ( not ( = ?auto_875806 ?auto_875808 ) ) ( not ( = ?auto_875806 ?auto_875809 ) ) ( not ( = ?auto_875806 ?auto_875810 ) ) ( not ( = ?auto_875806 ?auto_875811 ) ) ( not ( = ?auto_875806 ?auto_875812 ) ) ( not ( = ?auto_875806 ?auto_875813 ) ) ( not ( = ?auto_875806 ?auto_875814 ) ) ( not ( = ?auto_875806 ?auto_875815 ) ) ( not ( = ?auto_875806 ?auto_875816 ) ) ( not ( = ?auto_875806 ?auto_875817 ) ) ( not ( = ?auto_875807 ?auto_875808 ) ) ( not ( = ?auto_875807 ?auto_875809 ) ) ( not ( = ?auto_875807 ?auto_875810 ) ) ( not ( = ?auto_875807 ?auto_875811 ) ) ( not ( = ?auto_875807 ?auto_875812 ) ) ( not ( = ?auto_875807 ?auto_875813 ) ) ( not ( = ?auto_875807 ?auto_875814 ) ) ( not ( = ?auto_875807 ?auto_875815 ) ) ( not ( = ?auto_875807 ?auto_875816 ) ) ( not ( = ?auto_875807 ?auto_875817 ) ) ( not ( = ?auto_875808 ?auto_875809 ) ) ( not ( = ?auto_875808 ?auto_875810 ) ) ( not ( = ?auto_875808 ?auto_875811 ) ) ( not ( = ?auto_875808 ?auto_875812 ) ) ( not ( = ?auto_875808 ?auto_875813 ) ) ( not ( = ?auto_875808 ?auto_875814 ) ) ( not ( = ?auto_875808 ?auto_875815 ) ) ( not ( = ?auto_875808 ?auto_875816 ) ) ( not ( = ?auto_875808 ?auto_875817 ) ) ( not ( = ?auto_875809 ?auto_875810 ) ) ( not ( = ?auto_875809 ?auto_875811 ) ) ( not ( = ?auto_875809 ?auto_875812 ) ) ( not ( = ?auto_875809 ?auto_875813 ) ) ( not ( = ?auto_875809 ?auto_875814 ) ) ( not ( = ?auto_875809 ?auto_875815 ) ) ( not ( = ?auto_875809 ?auto_875816 ) ) ( not ( = ?auto_875809 ?auto_875817 ) ) ( not ( = ?auto_875810 ?auto_875811 ) ) ( not ( = ?auto_875810 ?auto_875812 ) ) ( not ( = ?auto_875810 ?auto_875813 ) ) ( not ( = ?auto_875810 ?auto_875814 ) ) ( not ( = ?auto_875810 ?auto_875815 ) ) ( not ( = ?auto_875810 ?auto_875816 ) ) ( not ( = ?auto_875810 ?auto_875817 ) ) ( not ( = ?auto_875811 ?auto_875812 ) ) ( not ( = ?auto_875811 ?auto_875813 ) ) ( not ( = ?auto_875811 ?auto_875814 ) ) ( not ( = ?auto_875811 ?auto_875815 ) ) ( not ( = ?auto_875811 ?auto_875816 ) ) ( not ( = ?auto_875811 ?auto_875817 ) ) ( not ( = ?auto_875812 ?auto_875813 ) ) ( not ( = ?auto_875812 ?auto_875814 ) ) ( not ( = ?auto_875812 ?auto_875815 ) ) ( not ( = ?auto_875812 ?auto_875816 ) ) ( not ( = ?auto_875812 ?auto_875817 ) ) ( not ( = ?auto_875813 ?auto_875814 ) ) ( not ( = ?auto_875813 ?auto_875815 ) ) ( not ( = ?auto_875813 ?auto_875816 ) ) ( not ( = ?auto_875813 ?auto_875817 ) ) ( not ( = ?auto_875814 ?auto_875815 ) ) ( not ( = ?auto_875814 ?auto_875816 ) ) ( not ( = ?auto_875814 ?auto_875817 ) ) ( not ( = ?auto_875815 ?auto_875816 ) ) ( not ( = ?auto_875815 ?auto_875817 ) ) ( not ( = ?auto_875816 ?auto_875817 ) ) ( ON ?auto_875815 ?auto_875816 ) ( ON ?auto_875814 ?auto_875815 ) ( ON ?auto_875813 ?auto_875814 ) ( ON ?auto_875812 ?auto_875813 ) ( ON ?auto_875811 ?auto_875812 ) ( ON ?auto_875810 ?auto_875811 ) ( ON ?auto_875809 ?auto_875810 ) ( ON ?auto_875808 ?auto_875809 ) ( ON ?auto_875807 ?auto_875808 ) ( ON ?auto_875806 ?auto_875807 ) ( ON ?auto_875805 ?auto_875806 ) ( CLEAR ?auto_875803 ) ( ON ?auto_875804 ?auto_875805 ) ( CLEAR ?auto_875804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_875803 ?auto_875804 )
      ( MAKE-14PILE ?auto_875803 ?auto_875804 ?auto_875805 ?auto_875806 ?auto_875807 ?auto_875808 ?auto_875809 ?auto_875810 ?auto_875811 ?auto_875812 ?auto_875813 ?auto_875814 ?auto_875815 ?auto_875816 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_875861 - BLOCK
      ?auto_875862 - BLOCK
      ?auto_875863 - BLOCK
      ?auto_875864 - BLOCK
      ?auto_875865 - BLOCK
      ?auto_875866 - BLOCK
      ?auto_875867 - BLOCK
      ?auto_875868 - BLOCK
      ?auto_875869 - BLOCK
      ?auto_875870 - BLOCK
      ?auto_875871 - BLOCK
      ?auto_875872 - BLOCK
      ?auto_875873 - BLOCK
      ?auto_875874 - BLOCK
    )
    :vars
    (
      ?auto_875875 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_875874 ?auto_875875 ) ( not ( = ?auto_875861 ?auto_875862 ) ) ( not ( = ?auto_875861 ?auto_875863 ) ) ( not ( = ?auto_875861 ?auto_875864 ) ) ( not ( = ?auto_875861 ?auto_875865 ) ) ( not ( = ?auto_875861 ?auto_875866 ) ) ( not ( = ?auto_875861 ?auto_875867 ) ) ( not ( = ?auto_875861 ?auto_875868 ) ) ( not ( = ?auto_875861 ?auto_875869 ) ) ( not ( = ?auto_875861 ?auto_875870 ) ) ( not ( = ?auto_875861 ?auto_875871 ) ) ( not ( = ?auto_875861 ?auto_875872 ) ) ( not ( = ?auto_875861 ?auto_875873 ) ) ( not ( = ?auto_875861 ?auto_875874 ) ) ( not ( = ?auto_875861 ?auto_875875 ) ) ( not ( = ?auto_875862 ?auto_875863 ) ) ( not ( = ?auto_875862 ?auto_875864 ) ) ( not ( = ?auto_875862 ?auto_875865 ) ) ( not ( = ?auto_875862 ?auto_875866 ) ) ( not ( = ?auto_875862 ?auto_875867 ) ) ( not ( = ?auto_875862 ?auto_875868 ) ) ( not ( = ?auto_875862 ?auto_875869 ) ) ( not ( = ?auto_875862 ?auto_875870 ) ) ( not ( = ?auto_875862 ?auto_875871 ) ) ( not ( = ?auto_875862 ?auto_875872 ) ) ( not ( = ?auto_875862 ?auto_875873 ) ) ( not ( = ?auto_875862 ?auto_875874 ) ) ( not ( = ?auto_875862 ?auto_875875 ) ) ( not ( = ?auto_875863 ?auto_875864 ) ) ( not ( = ?auto_875863 ?auto_875865 ) ) ( not ( = ?auto_875863 ?auto_875866 ) ) ( not ( = ?auto_875863 ?auto_875867 ) ) ( not ( = ?auto_875863 ?auto_875868 ) ) ( not ( = ?auto_875863 ?auto_875869 ) ) ( not ( = ?auto_875863 ?auto_875870 ) ) ( not ( = ?auto_875863 ?auto_875871 ) ) ( not ( = ?auto_875863 ?auto_875872 ) ) ( not ( = ?auto_875863 ?auto_875873 ) ) ( not ( = ?auto_875863 ?auto_875874 ) ) ( not ( = ?auto_875863 ?auto_875875 ) ) ( not ( = ?auto_875864 ?auto_875865 ) ) ( not ( = ?auto_875864 ?auto_875866 ) ) ( not ( = ?auto_875864 ?auto_875867 ) ) ( not ( = ?auto_875864 ?auto_875868 ) ) ( not ( = ?auto_875864 ?auto_875869 ) ) ( not ( = ?auto_875864 ?auto_875870 ) ) ( not ( = ?auto_875864 ?auto_875871 ) ) ( not ( = ?auto_875864 ?auto_875872 ) ) ( not ( = ?auto_875864 ?auto_875873 ) ) ( not ( = ?auto_875864 ?auto_875874 ) ) ( not ( = ?auto_875864 ?auto_875875 ) ) ( not ( = ?auto_875865 ?auto_875866 ) ) ( not ( = ?auto_875865 ?auto_875867 ) ) ( not ( = ?auto_875865 ?auto_875868 ) ) ( not ( = ?auto_875865 ?auto_875869 ) ) ( not ( = ?auto_875865 ?auto_875870 ) ) ( not ( = ?auto_875865 ?auto_875871 ) ) ( not ( = ?auto_875865 ?auto_875872 ) ) ( not ( = ?auto_875865 ?auto_875873 ) ) ( not ( = ?auto_875865 ?auto_875874 ) ) ( not ( = ?auto_875865 ?auto_875875 ) ) ( not ( = ?auto_875866 ?auto_875867 ) ) ( not ( = ?auto_875866 ?auto_875868 ) ) ( not ( = ?auto_875866 ?auto_875869 ) ) ( not ( = ?auto_875866 ?auto_875870 ) ) ( not ( = ?auto_875866 ?auto_875871 ) ) ( not ( = ?auto_875866 ?auto_875872 ) ) ( not ( = ?auto_875866 ?auto_875873 ) ) ( not ( = ?auto_875866 ?auto_875874 ) ) ( not ( = ?auto_875866 ?auto_875875 ) ) ( not ( = ?auto_875867 ?auto_875868 ) ) ( not ( = ?auto_875867 ?auto_875869 ) ) ( not ( = ?auto_875867 ?auto_875870 ) ) ( not ( = ?auto_875867 ?auto_875871 ) ) ( not ( = ?auto_875867 ?auto_875872 ) ) ( not ( = ?auto_875867 ?auto_875873 ) ) ( not ( = ?auto_875867 ?auto_875874 ) ) ( not ( = ?auto_875867 ?auto_875875 ) ) ( not ( = ?auto_875868 ?auto_875869 ) ) ( not ( = ?auto_875868 ?auto_875870 ) ) ( not ( = ?auto_875868 ?auto_875871 ) ) ( not ( = ?auto_875868 ?auto_875872 ) ) ( not ( = ?auto_875868 ?auto_875873 ) ) ( not ( = ?auto_875868 ?auto_875874 ) ) ( not ( = ?auto_875868 ?auto_875875 ) ) ( not ( = ?auto_875869 ?auto_875870 ) ) ( not ( = ?auto_875869 ?auto_875871 ) ) ( not ( = ?auto_875869 ?auto_875872 ) ) ( not ( = ?auto_875869 ?auto_875873 ) ) ( not ( = ?auto_875869 ?auto_875874 ) ) ( not ( = ?auto_875869 ?auto_875875 ) ) ( not ( = ?auto_875870 ?auto_875871 ) ) ( not ( = ?auto_875870 ?auto_875872 ) ) ( not ( = ?auto_875870 ?auto_875873 ) ) ( not ( = ?auto_875870 ?auto_875874 ) ) ( not ( = ?auto_875870 ?auto_875875 ) ) ( not ( = ?auto_875871 ?auto_875872 ) ) ( not ( = ?auto_875871 ?auto_875873 ) ) ( not ( = ?auto_875871 ?auto_875874 ) ) ( not ( = ?auto_875871 ?auto_875875 ) ) ( not ( = ?auto_875872 ?auto_875873 ) ) ( not ( = ?auto_875872 ?auto_875874 ) ) ( not ( = ?auto_875872 ?auto_875875 ) ) ( not ( = ?auto_875873 ?auto_875874 ) ) ( not ( = ?auto_875873 ?auto_875875 ) ) ( not ( = ?auto_875874 ?auto_875875 ) ) ( ON ?auto_875873 ?auto_875874 ) ( ON ?auto_875872 ?auto_875873 ) ( ON ?auto_875871 ?auto_875872 ) ( ON ?auto_875870 ?auto_875871 ) ( ON ?auto_875869 ?auto_875870 ) ( ON ?auto_875868 ?auto_875869 ) ( ON ?auto_875867 ?auto_875868 ) ( ON ?auto_875866 ?auto_875867 ) ( ON ?auto_875865 ?auto_875866 ) ( ON ?auto_875864 ?auto_875865 ) ( ON ?auto_875863 ?auto_875864 ) ( ON ?auto_875862 ?auto_875863 ) ( ON ?auto_875861 ?auto_875862 ) ( CLEAR ?auto_875861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_875861 )
      ( MAKE-14PILE ?auto_875861 ?auto_875862 ?auto_875863 ?auto_875864 ?auto_875865 ?auto_875866 ?auto_875867 ?auto_875868 ?auto_875869 ?auto_875870 ?auto_875871 ?auto_875872 ?auto_875873 ?auto_875874 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_875920 - BLOCK
      ?auto_875921 - BLOCK
      ?auto_875922 - BLOCK
      ?auto_875923 - BLOCK
      ?auto_875924 - BLOCK
      ?auto_875925 - BLOCK
      ?auto_875926 - BLOCK
      ?auto_875927 - BLOCK
      ?auto_875928 - BLOCK
      ?auto_875929 - BLOCK
      ?auto_875930 - BLOCK
      ?auto_875931 - BLOCK
      ?auto_875932 - BLOCK
      ?auto_875933 - BLOCK
      ?auto_875934 - BLOCK
    )
    :vars
    (
      ?auto_875935 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_875933 ) ( ON ?auto_875934 ?auto_875935 ) ( CLEAR ?auto_875934 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_875920 ) ( ON ?auto_875921 ?auto_875920 ) ( ON ?auto_875922 ?auto_875921 ) ( ON ?auto_875923 ?auto_875922 ) ( ON ?auto_875924 ?auto_875923 ) ( ON ?auto_875925 ?auto_875924 ) ( ON ?auto_875926 ?auto_875925 ) ( ON ?auto_875927 ?auto_875926 ) ( ON ?auto_875928 ?auto_875927 ) ( ON ?auto_875929 ?auto_875928 ) ( ON ?auto_875930 ?auto_875929 ) ( ON ?auto_875931 ?auto_875930 ) ( ON ?auto_875932 ?auto_875931 ) ( ON ?auto_875933 ?auto_875932 ) ( not ( = ?auto_875920 ?auto_875921 ) ) ( not ( = ?auto_875920 ?auto_875922 ) ) ( not ( = ?auto_875920 ?auto_875923 ) ) ( not ( = ?auto_875920 ?auto_875924 ) ) ( not ( = ?auto_875920 ?auto_875925 ) ) ( not ( = ?auto_875920 ?auto_875926 ) ) ( not ( = ?auto_875920 ?auto_875927 ) ) ( not ( = ?auto_875920 ?auto_875928 ) ) ( not ( = ?auto_875920 ?auto_875929 ) ) ( not ( = ?auto_875920 ?auto_875930 ) ) ( not ( = ?auto_875920 ?auto_875931 ) ) ( not ( = ?auto_875920 ?auto_875932 ) ) ( not ( = ?auto_875920 ?auto_875933 ) ) ( not ( = ?auto_875920 ?auto_875934 ) ) ( not ( = ?auto_875920 ?auto_875935 ) ) ( not ( = ?auto_875921 ?auto_875922 ) ) ( not ( = ?auto_875921 ?auto_875923 ) ) ( not ( = ?auto_875921 ?auto_875924 ) ) ( not ( = ?auto_875921 ?auto_875925 ) ) ( not ( = ?auto_875921 ?auto_875926 ) ) ( not ( = ?auto_875921 ?auto_875927 ) ) ( not ( = ?auto_875921 ?auto_875928 ) ) ( not ( = ?auto_875921 ?auto_875929 ) ) ( not ( = ?auto_875921 ?auto_875930 ) ) ( not ( = ?auto_875921 ?auto_875931 ) ) ( not ( = ?auto_875921 ?auto_875932 ) ) ( not ( = ?auto_875921 ?auto_875933 ) ) ( not ( = ?auto_875921 ?auto_875934 ) ) ( not ( = ?auto_875921 ?auto_875935 ) ) ( not ( = ?auto_875922 ?auto_875923 ) ) ( not ( = ?auto_875922 ?auto_875924 ) ) ( not ( = ?auto_875922 ?auto_875925 ) ) ( not ( = ?auto_875922 ?auto_875926 ) ) ( not ( = ?auto_875922 ?auto_875927 ) ) ( not ( = ?auto_875922 ?auto_875928 ) ) ( not ( = ?auto_875922 ?auto_875929 ) ) ( not ( = ?auto_875922 ?auto_875930 ) ) ( not ( = ?auto_875922 ?auto_875931 ) ) ( not ( = ?auto_875922 ?auto_875932 ) ) ( not ( = ?auto_875922 ?auto_875933 ) ) ( not ( = ?auto_875922 ?auto_875934 ) ) ( not ( = ?auto_875922 ?auto_875935 ) ) ( not ( = ?auto_875923 ?auto_875924 ) ) ( not ( = ?auto_875923 ?auto_875925 ) ) ( not ( = ?auto_875923 ?auto_875926 ) ) ( not ( = ?auto_875923 ?auto_875927 ) ) ( not ( = ?auto_875923 ?auto_875928 ) ) ( not ( = ?auto_875923 ?auto_875929 ) ) ( not ( = ?auto_875923 ?auto_875930 ) ) ( not ( = ?auto_875923 ?auto_875931 ) ) ( not ( = ?auto_875923 ?auto_875932 ) ) ( not ( = ?auto_875923 ?auto_875933 ) ) ( not ( = ?auto_875923 ?auto_875934 ) ) ( not ( = ?auto_875923 ?auto_875935 ) ) ( not ( = ?auto_875924 ?auto_875925 ) ) ( not ( = ?auto_875924 ?auto_875926 ) ) ( not ( = ?auto_875924 ?auto_875927 ) ) ( not ( = ?auto_875924 ?auto_875928 ) ) ( not ( = ?auto_875924 ?auto_875929 ) ) ( not ( = ?auto_875924 ?auto_875930 ) ) ( not ( = ?auto_875924 ?auto_875931 ) ) ( not ( = ?auto_875924 ?auto_875932 ) ) ( not ( = ?auto_875924 ?auto_875933 ) ) ( not ( = ?auto_875924 ?auto_875934 ) ) ( not ( = ?auto_875924 ?auto_875935 ) ) ( not ( = ?auto_875925 ?auto_875926 ) ) ( not ( = ?auto_875925 ?auto_875927 ) ) ( not ( = ?auto_875925 ?auto_875928 ) ) ( not ( = ?auto_875925 ?auto_875929 ) ) ( not ( = ?auto_875925 ?auto_875930 ) ) ( not ( = ?auto_875925 ?auto_875931 ) ) ( not ( = ?auto_875925 ?auto_875932 ) ) ( not ( = ?auto_875925 ?auto_875933 ) ) ( not ( = ?auto_875925 ?auto_875934 ) ) ( not ( = ?auto_875925 ?auto_875935 ) ) ( not ( = ?auto_875926 ?auto_875927 ) ) ( not ( = ?auto_875926 ?auto_875928 ) ) ( not ( = ?auto_875926 ?auto_875929 ) ) ( not ( = ?auto_875926 ?auto_875930 ) ) ( not ( = ?auto_875926 ?auto_875931 ) ) ( not ( = ?auto_875926 ?auto_875932 ) ) ( not ( = ?auto_875926 ?auto_875933 ) ) ( not ( = ?auto_875926 ?auto_875934 ) ) ( not ( = ?auto_875926 ?auto_875935 ) ) ( not ( = ?auto_875927 ?auto_875928 ) ) ( not ( = ?auto_875927 ?auto_875929 ) ) ( not ( = ?auto_875927 ?auto_875930 ) ) ( not ( = ?auto_875927 ?auto_875931 ) ) ( not ( = ?auto_875927 ?auto_875932 ) ) ( not ( = ?auto_875927 ?auto_875933 ) ) ( not ( = ?auto_875927 ?auto_875934 ) ) ( not ( = ?auto_875927 ?auto_875935 ) ) ( not ( = ?auto_875928 ?auto_875929 ) ) ( not ( = ?auto_875928 ?auto_875930 ) ) ( not ( = ?auto_875928 ?auto_875931 ) ) ( not ( = ?auto_875928 ?auto_875932 ) ) ( not ( = ?auto_875928 ?auto_875933 ) ) ( not ( = ?auto_875928 ?auto_875934 ) ) ( not ( = ?auto_875928 ?auto_875935 ) ) ( not ( = ?auto_875929 ?auto_875930 ) ) ( not ( = ?auto_875929 ?auto_875931 ) ) ( not ( = ?auto_875929 ?auto_875932 ) ) ( not ( = ?auto_875929 ?auto_875933 ) ) ( not ( = ?auto_875929 ?auto_875934 ) ) ( not ( = ?auto_875929 ?auto_875935 ) ) ( not ( = ?auto_875930 ?auto_875931 ) ) ( not ( = ?auto_875930 ?auto_875932 ) ) ( not ( = ?auto_875930 ?auto_875933 ) ) ( not ( = ?auto_875930 ?auto_875934 ) ) ( not ( = ?auto_875930 ?auto_875935 ) ) ( not ( = ?auto_875931 ?auto_875932 ) ) ( not ( = ?auto_875931 ?auto_875933 ) ) ( not ( = ?auto_875931 ?auto_875934 ) ) ( not ( = ?auto_875931 ?auto_875935 ) ) ( not ( = ?auto_875932 ?auto_875933 ) ) ( not ( = ?auto_875932 ?auto_875934 ) ) ( not ( = ?auto_875932 ?auto_875935 ) ) ( not ( = ?auto_875933 ?auto_875934 ) ) ( not ( = ?auto_875933 ?auto_875935 ) ) ( not ( = ?auto_875934 ?auto_875935 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_875934 ?auto_875935 )
      ( !STACK ?auto_875934 ?auto_875933 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_875982 - BLOCK
      ?auto_875983 - BLOCK
      ?auto_875984 - BLOCK
      ?auto_875985 - BLOCK
      ?auto_875986 - BLOCK
      ?auto_875987 - BLOCK
      ?auto_875988 - BLOCK
      ?auto_875989 - BLOCK
      ?auto_875990 - BLOCK
      ?auto_875991 - BLOCK
      ?auto_875992 - BLOCK
      ?auto_875993 - BLOCK
      ?auto_875994 - BLOCK
      ?auto_875995 - BLOCK
      ?auto_875996 - BLOCK
    )
    :vars
    (
      ?auto_875997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_875996 ?auto_875997 ) ( ON-TABLE ?auto_875982 ) ( ON ?auto_875983 ?auto_875982 ) ( ON ?auto_875984 ?auto_875983 ) ( ON ?auto_875985 ?auto_875984 ) ( ON ?auto_875986 ?auto_875985 ) ( ON ?auto_875987 ?auto_875986 ) ( ON ?auto_875988 ?auto_875987 ) ( ON ?auto_875989 ?auto_875988 ) ( ON ?auto_875990 ?auto_875989 ) ( ON ?auto_875991 ?auto_875990 ) ( ON ?auto_875992 ?auto_875991 ) ( ON ?auto_875993 ?auto_875992 ) ( ON ?auto_875994 ?auto_875993 ) ( not ( = ?auto_875982 ?auto_875983 ) ) ( not ( = ?auto_875982 ?auto_875984 ) ) ( not ( = ?auto_875982 ?auto_875985 ) ) ( not ( = ?auto_875982 ?auto_875986 ) ) ( not ( = ?auto_875982 ?auto_875987 ) ) ( not ( = ?auto_875982 ?auto_875988 ) ) ( not ( = ?auto_875982 ?auto_875989 ) ) ( not ( = ?auto_875982 ?auto_875990 ) ) ( not ( = ?auto_875982 ?auto_875991 ) ) ( not ( = ?auto_875982 ?auto_875992 ) ) ( not ( = ?auto_875982 ?auto_875993 ) ) ( not ( = ?auto_875982 ?auto_875994 ) ) ( not ( = ?auto_875982 ?auto_875995 ) ) ( not ( = ?auto_875982 ?auto_875996 ) ) ( not ( = ?auto_875982 ?auto_875997 ) ) ( not ( = ?auto_875983 ?auto_875984 ) ) ( not ( = ?auto_875983 ?auto_875985 ) ) ( not ( = ?auto_875983 ?auto_875986 ) ) ( not ( = ?auto_875983 ?auto_875987 ) ) ( not ( = ?auto_875983 ?auto_875988 ) ) ( not ( = ?auto_875983 ?auto_875989 ) ) ( not ( = ?auto_875983 ?auto_875990 ) ) ( not ( = ?auto_875983 ?auto_875991 ) ) ( not ( = ?auto_875983 ?auto_875992 ) ) ( not ( = ?auto_875983 ?auto_875993 ) ) ( not ( = ?auto_875983 ?auto_875994 ) ) ( not ( = ?auto_875983 ?auto_875995 ) ) ( not ( = ?auto_875983 ?auto_875996 ) ) ( not ( = ?auto_875983 ?auto_875997 ) ) ( not ( = ?auto_875984 ?auto_875985 ) ) ( not ( = ?auto_875984 ?auto_875986 ) ) ( not ( = ?auto_875984 ?auto_875987 ) ) ( not ( = ?auto_875984 ?auto_875988 ) ) ( not ( = ?auto_875984 ?auto_875989 ) ) ( not ( = ?auto_875984 ?auto_875990 ) ) ( not ( = ?auto_875984 ?auto_875991 ) ) ( not ( = ?auto_875984 ?auto_875992 ) ) ( not ( = ?auto_875984 ?auto_875993 ) ) ( not ( = ?auto_875984 ?auto_875994 ) ) ( not ( = ?auto_875984 ?auto_875995 ) ) ( not ( = ?auto_875984 ?auto_875996 ) ) ( not ( = ?auto_875984 ?auto_875997 ) ) ( not ( = ?auto_875985 ?auto_875986 ) ) ( not ( = ?auto_875985 ?auto_875987 ) ) ( not ( = ?auto_875985 ?auto_875988 ) ) ( not ( = ?auto_875985 ?auto_875989 ) ) ( not ( = ?auto_875985 ?auto_875990 ) ) ( not ( = ?auto_875985 ?auto_875991 ) ) ( not ( = ?auto_875985 ?auto_875992 ) ) ( not ( = ?auto_875985 ?auto_875993 ) ) ( not ( = ?auto_875985 ?auto_875994 ) ) ( not ( = ?auto_875985 ?auto_875995 ) ) ( not ( = ?auto_875985 ?auto_875996 ) ) ( not ( = ?auto_875985 ?auto_875997 ) ) ( not ( = ?auto_875986 ?auto_875987 ) ) ( not ( = ?auto_875986 ?auto_875988 ) ) ( not ( = ?auto_875986 ?auto_875989 ) ) ( not ( = ?auto_875986 ?auto_875990 ) ) ( not ( = ?auto_875986 ?auto_875991 ) ) ( not ( = ?auto_875986 ?auto_875992 ) ) ( not ( = ?auto_875986 ?auto_875993 ) ) ( not ( = ?auto_875986 ?auto_875994 ) ) ( not ( = ?auto_875986 ?auto_875995 ) ) ( not ( = ?auto_875986 ?auto_875996 ) ) ( not ( = ?auto_875986 ?auto_875997 ) ) ( not ( = ?auto_875987 ?auto_875988 ) ) ( not ( = ?auto_875987 ?auto_875989 ) ) ( not ( = ?auto_875987 ?auto_875990 ) ) ( not ( = ?auto_875987 ?auto_875991 ) ) ( not ( = ?auto_875987 ?auto_875992 ) ) ( not ( = ?auto_875987 ?auto_875993 ) ) ( not ( = ?auto_875987 ?auto_875994 ) ) ( not ( = ?auto_875987 ?auto_875995 ) ) ( not ( = ?auto_875987 ?auto_875996 ) ) ( not ( = ?auto_875987 ?auto_875997 ) ) ( not ( = ?auto_875988 ?auto_875989 ) ) ( not ( = ?auto_875988 ?auto_875990 ) ) ( not ( = ?auto_875988 ?auto_875991 ) ) ( not ( = ?auto_875988 ?auto_875992 ) ) ( not ( = ?auto_875988 ?auto_875993 ) ) ( not ( = ?auto_875988 ?auto_875994 ) ) ( not ( = ?auto_875988 ?auto_875995 ) ) ( not ( = ?auto_875988 ?auto_875996 ) ) ( not ( = ?auto_875988 ?auto_875997 ) ) ( not ( = ?auto_875989 ?auto_875990 ) ) ( not ( = ?auto_875989 ?auto_875991 ) ) ( not ( = ?auto_875989 ?auto_875992 ) ) ( not ( = ?auto_875989 ?auto_875993 ) ) ( not ( = ?auto_875989 ?auto_875994 ) ) ( not ( = ?auto_875989 ?auto_875995 ) ) ( not ( = ?auto_875989 ?auto_875996 ) ) ( not ( = ?auto_875989 ?auto_875997 ) ) ( not ( = ?auto_875990 ?auto_875991 ) ) ( not ( = ?auto_875990 ?auto_875992 ) ) ( not ( = ?auto_875990 ?auto_875993 ) ) ( not ( = ?auto_875990 ?auto_875994 ) ) ( not ( = ?auto_875990 ?auto_875995 ) ) ( not ( = ?auto_875990 ?auto_875996 ) ) ( not ( = ?auto_875990 ?auto_875997 ) ) ( not ( = ?auto_875991 ?auto_875992 ) ) ( not ( = ?auto_875991 ?auto_875993 ) ) ( not ( = ?auto_875991 ?auto_875994 ) ) ( not ( = ?auto_875991 ?auto_875995 ) ) ( not ( = ?auto_875991 ?auto_875996 ) ) ( not ( = ?auto_875991 ?auto_875997 ) ) ( not ( = ?auto_875992 ?auto_875993 ) ) ( not ( = ?auto_875992 ?auto_875994 ) ) ( not ( = ?auto_875992 ?auto_875995 ) ) ( not ( = ?auto_875992 ?auto_875996 ) ) ( not ( = ?auto_875992 ?auto_875997 ) ) ( not ( = ?auto_875993 ?auto_875994 ) ) ( not ( = ?auto_875993 ?auto_875995 ) ) ( not ( = ?auto_875993 ?auto_875996 ) ) ( not ( = ?auto_875993 ?auto_875997 ) ) ( not ( = ?auto_875994 ?auto_875995 ) ) ( not ( = ?auto_875994 ?auto_875996 ) ) ( not ( = ?auto_875994 ?auto_875997 ) ) ( not ( = ?auto_875995 ?auto_875996 ) ) ( not ( = ?auto_875995 ?auto_875997 ) ) ( not ( = ?auto_875996 ?auto_875997 ) ) ( CLEAR ?auto_875994 ) ( ON ?auto_875995 ?auto_875996 ) ( CLEAR ?auto_875995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_875982 ?auto_875983 ?auto_875984 ?auto_875985 ?auto_875986 ?auto_875987 ?auto_875988 ?auto_875989 ?auto_875990 ?auto_875991 ?auto_875992 ?auto_875993 ?auto_875994 ?auto_875995 )
      ( MAKE-15PILE ?auto_875982 ?auto_875983 ?auto_875984 ?auto_875985 ?auto_875986 ?auto_875987 ?auto_875988 ?auto_875989 ?auto_875990 ?auto_875991 ?auto_875992 ?auto_875993 ?auto_875994 ?auto_875995 ?auto_875996 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_876044 - BLOCK
      ?auto_876045 - BLOCK
      ?auto_876046 - BLOCK
      ?auto_876047 - BLOCK
      ?auto_876048 - BLOCK
      ?auto_876049 - BLOCK
      ?auto_876050 - BLOCK
      ?auto_876051 - BLOCK
      ?auto_876052 - BLOCK
      ?auto_876053 - BLOCK
      ?auto_876054 - BLOCK
      ?auto_876055 - BLOCK
      ?auto_876056 - BLOCK
      ?auto_876057 - BLOCK
      ?auto_876058 - BLOCK
    )
    :vars
    (
      ?auto_876059 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_876058 ?auto_876059 ) ( ON-TABLE ?auto_876044 ) ( ON ?auto_876045 ?auto_876044 ) ( ON ?auto_876046 ?auto_876045 ) ( ON ?auto_876047 ?auto_876046 ) ( ON ?auto_876048 ?auto_876047 ) ( ON ?auto_876049 ?auto_876048 ) ( ON ?auto_876050 ?auto_876049 ) ( ON ?auto_876051 ?auto_876050 ) ( ON ?auto_876052 ?auto_876051 ) ( ON ?auto_876053 ?auto_876052 ) ( ON ?auto_876054 ?auto_876053 ) ( ON ?auto_876055 ?auto_876054 ) ( not ( = ?auto_876044 ?auto_876045 ) ) ( not ( = ?auto_876044 ?auto_876046 ) ) ( not ( = ?auto_876044 ?auto_876047 ) ) ( not ( = ?auto_876044 ?auto_876048 ) ) ( not ( = ?auto_876044 ?auto_876049 ) ) ( not ( = ?auto_876044 ?auto_876050 ) ) ( not ( = ?auto_876044 ?auto_876051 ) ) ( not ( = ?auto_876044 ?auto_876052 ) ) ( not ( = ?auto_876044 ?auto_876053 ) ) ( not ( = ?auto_876044 ?auto_876054 ) ) ( not ( = ?auto_876044 ?auto_876055 ) ) ( not ( = ?auto_876044 ?auto_876056 ) ) ( not ( = ?auto_876044 ?auto_876057 ) ) ( not ( = ?auto_876044 ?auto_876058 ) ) ( not ( = ?auto_876044 ?auto_876059 ) ) ( not ( = ?auto_876045 ?auto_876046 ) ) ( not ( = ?auto_876045 ?auto_876047 ) ) ( not ( = ?auto_876045 ?auto_876048 ) ) ( not ( = ?auto_876045 ?auto_876049 ) ) ( not ( = ?auto_876045 ?auto_876050 ) ) ( not ( = ?auto_876045 ?auto_876051 ) ) ( not ( = ?auto_876045 ?auto_876052 ) ) ( not ( = ?auto_876045 ?auto_876053 ) ) ( not ( = ?auto_876045 ?auto_876054 ) ) ( not ( = ?auto_876045 ?auto_876055 ) ) ( not ( = ?auto_876045 ?auto_876056 ) ) ( not ( = ?auto_876045 ?auto_876057 ) ) ( not ( = ?auto_876045 ?auto_876058 ) ) ( not ( = ?auto_876045 ?auto_876059 ) ) ( not ( = ?auto_876046 ?auto_876047 ) ) ( not ( = ?auto_876046 ?auto_876048 ) ) ( not ( = ?auto_876046 ?auto_876049 ) ) ( not ( = ?auto_876046 ?auto_876050 ) ) ( not ( = ?auto_876046 ?auto_876051 ) ) ( not ( = ?auto_876046 ?auto_876052 ) ) ( not ( = ?auto_876046 ?auto_876053 ) ) ( not ( = ?auto_876046 ?auto_876054 ) ) ( not ( = ?auto_876046 ?auto_876055 ) ) ( not ( = ?auto_876046 ?auto_876056 ) ) ( not ( = ?auto_876046 ?auto_876057 ) ) ( not ( = ?auto_876046 ?auto_876058 ) ) ( not ( = ?auto_876046 ?auto_876059 ) ) ( not ( = ?auto_876047 ?auto_876048 ) ) ( not ( = ?auto_876047 ?auto_876049 ) ) ( not ( = ?auto_876047 ?auto_876050 ) ) ( not ( = ?auto_876047 ?auto_876051 ) ) ( not ( = ?auto_876047 ?auto_876052 ) ) ( not ( = ?auto_876047 ?auto_876053 ) ) ( not ( = ?auto_876047 ?auto_876054 ) ) ( not ( = ?auto_876047 ?auto_876055 ) ) ( not ( = ?auto_876047 ?auto_876056 ) ) ( not ( = ?auto_876047 ?auto_876057 ) ) ( not ( = ?auto_876047 ?auto_876058 ) ) ( not ( = ?auto_876047 ?auto_876059 ) ) ( not ( = ?auto_876048 ?auto_876049 ) ) ( not ( = ?auto_876048 ?auto_876050 ) ) ( not ( = ?auto_876048 ?auto_876051 ) ) ( not ( = ?auto_876048 ?auto_876052 ) ) ( not ( = ?auto_876048 ?auto_876053 ) ) ( not ( = ?auto_876048 ?auto_876054 ) ) ( not ( = ?auto_876048 ?auto_876055 ) ) ( not ( = ?auto_876048 ?auto_876056 ) ) ( not ( = ?auto_876048 ?auto_876057 ) ) ( not ( = ?auto_876048 ?auto_876058 ) ) ( not ( = ?auto_876048 ?auto_876059 ) ) ( not ( = ?auto_876049 ?auto_876050 ) ) ( not ( = ?auto_876049 ?auto_876051 ) ) ( not ( = ?auto_876049 ?auto_876052 ) ) ( not ( = ?auto_876049 ?auto_876053 ) ) ( not ( = ?auto_876049 ?auto_876054 ) ) ( not ( = ?auto_876049 ?auto_876055 ) ) ( not ( = ?auto_876049 ?auto_876056 ) ) ( not ( = ?auto_876049 ?auto_876057 ) ) ( not ( = ?auto_876049 ?auto_876058 ) ) ( not ( = ?auto_876049 ?auto_876059 ) ) ( not ( = ?auto_876050 ?auto_876051 ) ) ( not ( = ?auto_876050 ?auto_876052 ) ) ( not ( = ?auto_876050 ?auto_876053 ) ) ( not ( = ?auto_876050 ?auto_876054 ) ) ( not ( = ?auto_876050 ?auto_876055 ) ) ( not ( = ?auto_876050 ?auto_876056 ) ) ( not ( = ?auto_876050 ?auto_876057 ) ) ( not ( = ?auto_876050 ?auto_876058 ) ) ( not ( = ?auto_876050 ?auto_876059 ) ) ( not ( = ?auto_876051 ?auto_876052 ) ) ( not ( = ?auto_876051 ?auto_876053 ) ) ( not ( = ?auto_876051 ?auto_876054 ) ) ( not ( = ?auto_876051 ?auto_876055 ) ) ( not ( = ?auto_876051 ?auto_876056 ) ) ( not ( = ?auto_876051 ?auto_876057 ) ) ( not ( = ?auto_876051 ?auto_876058 ) ) ( not ( = ?auto_876051 ?auto_876059 ) ) ( not ( = ?auto_876052 ?auto_876053 ) ) ( not ( = ?auto_876052 ?auto_876054 ) ) ( not ( = ?auto_876052 ?auto_876055 ) ) ( not ( = ?auto_876052 ?auto_876056 ) ) ( not ( = ?auto_876052 ?auto_876057 ) ) ( not ( = ?auto_876052 ?auto_876058 ) ) ( not ( = ?auto_876052 ?auto_876059 ) ) ( not ( = ?auto_876053 ?auto_876054 ) ) ( not ( = ?auto_876053 ?auto_876055 ) ) ( not ( = ?auto_876053 ?auto_876056 ) ) ( not ( = ?auto_876053 ?auto_876057 ) ) ( not ( = ?auto_876053 ?auto_876058 ) ) ( not ( = ?auto_876053 ?auto_876059 ) ) ( not ( = ?auto_876054 ?auto_876055 ) ) ( not ( = ?auto_876054 ?auto_876056 ) ) ( not ( = ?auto_876054 ?auto_876057 ) ) ( not ( = ?auto_876054 ?auto_876058 ) ) ( not ( = ?auto_876054 ?auto_876059 ) ) ( not ( = ?auto_876055 ?auto_876056 ) ) ( not ( = ?auto_876055 ?auto_876057 ) ) ( not ( = ?auto_876055 ?auto_876058 ) ) ( not ( = ?auto_876055 ?auto_876059 ) ) ( not ( = ?auto_876056 ?auto_876057 ) ) ( not ( = ?auto_876056 ?auto_876058 ) ) ( not ( = ?auto_876056 ?auto_876059 ) ) ( not ( = ?auto_876057 ?auto_876058 ) ) ( not ( = ?auto_876057 ?auto_876059 ) ) ( not ( = ?auto_876058 ?auto_876059 ) ) ( ON ?auto_876057 ?auto_876058 ) ( CLEAR ?auto_876055 ) ( ON ?auto_876056 ?auto_876057 ) ( CLEAR ?auto_876056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_876044 ?auto_876045 ?auto_876046 ?auto_876047 ?auto_876048 ?auto_876049 ?auto_876050 ?auto_876051 ?auto_876052 ?auto_876053 ?auto_876054 ?auto_876055 ?auto_876056 )
      ( MAKE-15PILE ?auto_876044 ?auto_876045 ?auto_876046 ?auto_876047 ?auto_876048 ?auto_876049 ?auto_876050 ?auto_876051 ?auto_876052 ?auto_876053 ?auto_876054 ?auto_876055 ?auto_876056 ?auto_876057 ?auto_876058 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_876106 - BLOCK
      ?auto_876107 - BLOCK
      ?auto_876108 - BLOCK
      ?auto_876109 - BLOCK
      ?auto_876110 - BLOCK
      ?auto_876111 - BLOCK
      ?auto_876112 - BLOCK
      ?auto_876113 - BLOCK
      ?auto_876114 - BLOCK
      ?auto_876115 - BLOCK
      ?auto_876116 - BLOCK
      ?auto_876117 - BLOCK
      ?auto_876118 - BLOCK
      ?auto_876119 - BLOCK
      ?auto_876120 - BLOCK
    )
    :vars
    (
      ?auto_876121 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_876120 ?auto_876121 ) ( ON-TABLE ?auto_876106 ) ( ON ?auto_876107 ?auto_876106 ) ( ON ?auto_876108 ?auto_876107 ) ( ON ?auto_876109 ?auto_876108 ) ( ON ?auto_876110 ?auto_876109 ) ( ON ?auto_876111 ?auto_876110 ) ( ON ?auto_876112 ?auto_876111 ) ( ON ?auto_876113 ?auto_876112 ) ( ON ?auto_876114 ?auto_876113 ) ( ON ?auto_876115 ?auto_876114 ) ( ON ?auto_876116 ?auto_876115 ) ( not ( = ?auto_876106 ?auto_876107 ) ) ( not ( = ?auto_876106 ?auto_876108 ) ) ( not ( = ?auto_876106 ?auto_876109 ) ) ( not ( = ?auto_876106 ?auto_876110 ) ) ( not ( = ?auto_876106 ?auto_876111 ) ) ( not ( = ?auto_876106 ?auto_876112 ) ) ( not ( = ?auto_876106 ?auto_876113 ) ) ( not ( = ?auto_876106 ?auto_876114 ) ) ( not ( = ?auto_876106 ?auto_876115 ) ) ( not ( = ?auto_876106 ?auto_876116 ) ) ( not ( = ?auto_876106 ?auto_876117 ) ) ( not ( = ?auto_876106 ?auto_876118 ) ) ( not ( = ?auto_876106 ?auto_876119 ) ) ( not ( = ?auto_876106 ?auto_876120 ) ) ( not ( = ?auto_876106 ?auto_876121 ) ) ( not ( = ?auto_876107 ?auto_876108 ) ) ( not ( = ?auto_876107 ?auto_876109 ) ) ( not ( = ?auto_876107 ?auto_876110 ) ) ( not ( = ?auto_876107 ?auto_876111 ) ) ( not ( = ?auto_876107 ?auto_876112 ) ) ( not ( = ?auto_876107 ?auto_876113 ) ) ( not ( = ?auto_876107 ?auto_876114 ) ) ( not ( = ?auto_876107 ?auto_876115 ) ) ( not ( = ?auto_876107 ?auto_876116 ) ) ( not ( = ?auto_876107 ?auto_876117 ) ) ( not ( = ?auto_876107 ?auto_876118 ) ) ( not ( = ?auto_876107 ?auto_876119 ) ) ( not ( = ?auto_876107 ?auto_876120 ) ) ( not ( = ?auto_876107 ?auto_876121 ) ) ( not ( = ?auto_876108 ?auto_876109 ) ) ( not ( = ?auto_876108 ?auto_876110 ) ) ( not ( = ?auto_876108 ?auto_876111 ) ) ( not ( = ?auto_876108 ?auto_876112 ) ) ( not ( = ?auto_876108 ?auto_876113 ) ) ( not ( = ?auto_876108 ?auto_876114 ) ) ( not ( = ?auto_876108 ?auto_876115 ) ) ( not ( = ?auto_876108 ?auto_876116 ) ) ( not ( = ?auto_876108 ?auto_876117 ) ) ( not ( = ?auto_876108 ?auto_876118 ) ) ( not ( = ?auto_876108 ?auto_876119 ) ) ( not ( = ?auto_876108 ?auto_876120 ) ) ( not ( = ?auto_876108 ?auto_876121 ) ) ( not ( = ?auto_876109 ?auto_876110 ) ) ( not ( = ?auto_876109 ?auto_876111 ) ) ( not ( = ?auto_876109 ?auto_876112 ) ) ( not ( = ?auto_876109 ?auto_876113 ) ) ( not ( = ?auto_876109 ?auto_876114 ) ) ( not ( = ?auto_876109 ?auto_876115 ) ) ( not ( = ?auto_876109 ?auto_876116 ) ) ( not ( = ?auto_876109 ?auto_876117 ) ) ( not ( = ?auto_876109 ?auto_876118 ) ) ( not ( = ?auto_876109 ?auto_876119 ) ) ( not ( = ?auto_876109 ?auto_876120 ) ) ( not ( = ?auto_876109 ?auto_876121 ) ) ( not ( = ?auto_876110 ?auto_876111 ) ) ( not ( = ?auto_876110 ?auto_876112 ) ) ( not ( = ?auto_876110 ?auto_876113 ) ) ( not ( = ?auto_876110 ?auto_876114 ) ) ( not ( = ?auto_876110 ?auto_876115 ) ) ( not ( = ?auto_876110 ?auto_876116 ) ) ( not ( = ?auto_876110 ?auto_876117 ) ) ( not ( = ?auto_876110 ?auto_876118 ) ) ( not ( = ?auto_876110 ?auto_876119 ) ) ( not ( = ?auto_876110 ?auto_876120 ) ) ( not ( = ?auto_876110 ?auto_876121 ) ) ( not ( = ?auto_876111 ?auto_876112 ) ) ( not ( = ?auto_876111 ?auto_876113 ) ) ( not ( = ?auto_876111 ?auto_876114 ) ) ( not ( = ?auto_876111 ?auto_876115 ) ) ( not ( = ?auto_876111 ?auto_876116 ) ) ( not ( = ?auto_876111 ?auto_876117 ) ) ( not ( = ?auto_876111 ?auto_876118 ) ) ( not ( = ?auto_876111 ?auto_876119 ) ) ( not ( = ?auto_876111 ?auto_876120 ) ) ( not ( = ?auto_876111 ?auto_876121 ) ) ( not ( = ?auto_876112 ?auto_876113 ) ) ( not ( = ?auto_876112 ?auto_876114 ) ) ( not ( = ?auto_876112 ?auto_876115 ) ) ( not ( = ?auto_876112 ?auto_876116 ) ) ( not ( = ?auto_876112 ?auto_876117 ) ) ( not ( = ?auto_876112 ?auto_876118 ) ) ( not ( = ?auto_876112 ?auto_876119 ) ) ( not ( = ?auto_876112 ?auto_876120 ) ) ( not ( = ?auto_876112 ?auto_876121 ) ) ( not ( = ?auto_876113 ?auto_876114 ) ) ( not ( = ?auto_876113 ?auto_876115 ) ) ( not ( = ?auto_876113 ?auto_876116 ) ) ( not ( = ?auto_876113 ?auto_876117 ) ) ( not ( = ?auto_876113 ?auto_876118 ) ) ( not ( = ?auto_876113 ?auto_876119 ) ) ( not ( = ?auto_876113 ?auto_876120 ) ) ( not ( = ?auto_876113 ?auto_876121 ) ) ( not ( = ?auto_876114 ?auto_876115 ) ) ( not ( = ?auto_876114 ?auto_876116 ) ) ( not ( = ?auto_876114 ?auto_876117 ) ) ( not ( = ?auto_876114 ?auto_876118 ) ) ( not ( = ?auto_876114 ?auto_876119 ) ) ( not ( = ?auto_876114 ?auto_876120 ) ) ( not ( = ?auto_876114 ?auto_876121 ) ) ( not ( = ?auto_876115 ?auto_876116 ) ) ( not ( = ?auto_876115 ?auto_876117 ) ) ( not ( = ?auto_876115 ?auto_876118 ) ) ( not ( = ?auto_876115 ?auto_876119 ) ) ( not ( = ?auto_876115 ?auto_876120 ) ) ( not ( = ?auto_876115 ?auto_876121 ) ) ( not ( = ?auto_876116 ?auto_876117 ) ) ( not ( = ?auto_876116 ?auto_876118 ) ) ( not ( = ?auto_876116 ?auto_876119 ) ) ( not ( = ?auto_876116 ?auto_876120 ) ) ( not ( = ?auto_876116 ?auto_876121 ) ) ( not ( = ?auto_876117 ?auto_876118 ) ) ( not ( = ?auto_876117 ?auto_876119 ) ) ( not ( = ?auto_876117 ?auto_876120 ) ) ( not ( = ?auto_876117 ?auto_876121 ) ) ( not ( = ?auto_876118 ?auto_876119 ) ) ( not ( = ?auto_876118 ?auto_876120 ) ) ( not ( = ?auto_876118 ?auto_876121 ) ) ( not ( = ?auto_876119 ?auto_876120 ) ) ( not ( = ?auto_876119 ?auto_876121 ) ) ( not ( = ?auto_876120 ?auto_876121 ) ) ( ON ?auto_876119 ?auto_876120 ) ( ON ?auto_876118 ?auto_876119 ) ( CLEAR ?auto_876116 ) ( ON ?auto_876117 ?auto_876118 ) ( CLEAR ?auto_876117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_876106 ?auto_876107 ?auto_876108 ?auto_876109 ?auto_876110 ?auto_876111 ?auto_876112 ?auto_876113 ?auto_876114 ?auto_876115 ?auto_876116 ?auto_876117 )
      ( MAKE-15PILE ?auto_876106 ?auto_876107 ?auto_876108 ?auto_876109 ?auto_876110 ?auto_876111 ?auto_876112 ?auto_876113 ?auto_876114 ?auto_876115 ?auto_876116 ?auto_876117 ?auto_876118 ?auto_876119 ?auto_876120 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_876168 - BLOCK
      ?auto_876169 - BLOCK
      ?auto_876170 - BLOCK
      ?auto_876171 - BLOCK
      ?auto_876172 - BLOCK
      ?auto_876173 - BLOCK
      ?auto_876174 - BLOCK
      ?auto_876175 - BLOCK
      ?auto_876176 - BLOCK
      ?auto_876177 - BLOCK
      ?auto_876178 - BLOCK
      ?auto_876179 - BLOCK
      ?auto_876180 - BLOCK
      ?auto_876181 - BLOCK
      ?auto_876182 - BLOCK
    )
    :vars
    (
      ?auto_876183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_876182 ?auto_876183 ) ( ON-TABLE ?auto_876168 ) ( ON ?auto_876169 ?auto_876168 ) ( ON ?auto_876170 ?auto_876169 ) ( ON ?auto_876171 ?auto_876170 ) ( ON ?auto_876172 ?auto_876171 ) ( ON ?auto_876173 ?auto_876172 ) ( ON ?auto_876174 ?auto_876173 ) ( ON ?auto_876175 ?auto_876174 ) ( ON ?auto_876176 ?auto_876175 ) ( ON ?auto_876177 ?auto_876176 ) ( not ( = ?auto_876168 ?auto_876169 ) ) ( not ( = ?auto_876168 ?auto_876170 ) ) ( not ( = ?auto_876168 ?auto_876171 ) ) ( not ( = ?auto_876168 ?auto_876172 ) ) ( not ( = ?auto_876168 ?auto_876173 ) ) ( not ( = ?auto_876168 ?auto_876174 ) ) ( not ( = ?auto_876168 ?auto_876175 ) ) ( not ( = ?auto_876168 ?auto_876176 ) ) ( not ( = ?auto_876168 ?auto_876177 ) ) ( not ( = ?auto_876168 ?auto_876178 ) ) ( not ( = ?auto_876168 ?auto_876179 ) ) ( not ( = ?auto_876168 ?auto_876180 ) ) ( not ( = ?auto_876168 ?auto_876181 ) ) ( not ( = ?auto_876168 ?auto_876182 ) ) ( not ( = ?auto_876168 ?auto_876183 ) ) ( not ( = ?auto_876169 ?auto_876170 ) ) ( not ( = ?auto_876169 ?auto_876171 ) ) ( not ( = ?auto_876169 ?auto_876172 ) ) ( not ( = ?auto_876169 ?auto_876173 ) ) ( not ( = ?auto_876169 ?auto_876174 ) ) ( not ( = ?auto_876169 ?auto_876175 ) ) ( not ( = ?auto_876169 ?auto_876176 ) ) ( not ( = ?auto_876169 ?auto_876177 ) ) ( not ( = ?auto_876169 ?auto_876178 ) ) ( not ( = ?auto_876169 ?auto_876179 ) ) ( not ( = ?auto_876169 ?auto_876180 ) ) ( not ( = ?auto_876169 ?auto_876181 ) ) ( not ( = ?auto_876169 ?auto_876182 ) ) ( not ( = ?auto_876169 ?auto_876183 ) ) ( not ( = ?auto_876170 ?auto_876171 ) ) ( not ( = ?auto_876170 ?auto_876172 ) ) ( not ( = ?auto_876170 ?auto_876173 ) ) ( not ( = ?auto_876170 ?auto_876174 ) ) ( not ( = ?auto_876170 ?auto_876175 ) ) ( not ( = ?auto_876170 ?auto_876176 ) ) ( not ( = ?auto_876170 ?auto_876177 ) ) ( not ( = ?auto_876170 ?auto_876178 ) ) ( not ( = ?auto_876170 ?auto_876179 ) ) ( not ( = ?auto_876170 ?auto_876180 ) ) ( not ( = ?auto_876170 ?auto_876181 ) ) ( not ( = ?auto_876170 ?auto_876182 ) ) ( not ( = ?auto_876170 ?auto_876183 ) ) ( not ( = ?auto_876171 ?auto_876172 ) ) ( not ( = ?auto_876171 ?auto_876173 ) ) ( not ( = ?auto_876171 ?auto_876174 ) ) ( not ( = ?auto_876171 ?auto_876175 ) ) ( not ( = ?auto_876171 ?auto_876176 ) ) ( not ( = ?auto_876171 ?auto_876177 ) ) ( not ( = ?auto_876171 ?auto_876178 ) ) ( not ( = ?auto_876171 ?auto_876179 ) ) ( not ( = ?auto_876171 ?auto_876180 ) ) ( not ( = ?auto_876171 ?auto_876181 ) ) ( not ( = ?auto_876171 ?auto_876182 ) ) ( not ( = ?auto_876171 ?auto_876183 ) ) ( not ( = ?auto_876172 ?auto_876173 ) ) ( not ( = ?auto_876172 ?auto_876174 ) ) ( not ( = ?auto_876172 ?auto_876175 ) ) ( not ( = ?auto_876172 ?auto_876176 ) ) ( not ( = ?auto_876172 ?auto_876177 ) ) ( not ( = ?auto_876172 ?auto_876178 ) ) ( not ( = ?auto_876172 ?auto_876179 ) ) ( not ( = ?auto_876172 ?auto_876180 ) ) ( not ( = ?auto_876172 ?auto_876181 ) ) ( not ( = ?auto_876172 ?auto_876182 ) ) ( not ( = ?auto_876172 ?auto_876183 ) ) ( not ( = ?auto_876173 ?auto_876174 ) ) ( not ( = ?auto_876173 ?auto_876175 ) ) ( not ( = ?auto_876173 ?auto_876176 ) ) ( not ( = ?auto_876173 ?auto_876177 ) ) ( not ( = ?auto_876173 ?auto_876178 ) ) ( not ( = ?auto_876173 ?auto_876179 ) ) ( not ( = ?auto_876173 ?auto_876180 ) ) ( not ( = ?auto_876173 ?auto_876181 ) ) ( not ( = ?auto_876173 ?auto_876182 ) ) ( not ( = ?auto_876173 ?auto_876183 ) ) ( not ( = ?auto_876174 ?auto_876175 ) ) ( not ( = ?auto_876174 ?auto_876176 ) ) ( not ( = ?auto_876174 ?auto_876177 ) ) ( not ( = ?auto_876174 ?auto_876178 ) ) ( not ( = ?auto_876174 ?auto_876179 ) ) ( not ( = ?auto_876174 ?auto_876180 ) ) ( not ( = ?auto_876174 ?auto_876181 ) ) ( not ( = ?auto_876174 ?auto_876182 ) ) ( not ( = ?auto_876174 ?auto_876183 ) ) ( not ( = ?auto_876175 ?auto_876176 ) ) ( not ( = ?auto_876175 ?auto_876177 ) ) ( not ( = ?auto_876175 ?auto_876178 ) ) ( not ( = ?auto_876175 ?auto_876179 ) ) ( not ( = ?auto_876175 ?auto_876180 ) ) ( not ( = ?auto_876175 ?auto_876181 ) ) ( not ( = ?auto_876175 ?auto_876182 ) ) ( not ( = ?auto_876175 ?auto_876183 ) ) ( not ( = ?auto_876176 ?auto_876177 ) ) ( not ( = ?auto_876176 ?auto_876178 ) ) ( not ( = ?auto_876176 ?auto_876179 ) ) ( not ( = ?auto_876176 ?auto_876180 ) ) ( not ( = ?auto_876176 ?auto_876181 ) ) ( not ( = ?auto_876176 ?auto_876182 ) ) ( not ( = ?auto_876176 ?auto_876183 ) ) ( not ( = ?auto_876177 ?auto_876178 ) ) ( not ( = ?auto_876177 ?auto_876179 ) ) ( not ( = ?auto_876177 ?auto_876180 ) ) ( not ( = ?auto_876177 ?auto_876181 ) ) ( not ( = ?auto_876177 ?auto_876182 ) ) ( not ( = ?auto_876177 ?auto_876183 ) ) ( not ( = ?auto_876178 ?auto_876179 ) ) ( not ( = ?auto_876178 ?auto_876180 ) ) ( not ( = ?auto_876178 ?auto_876181 ) ) ( not ( = ?auto_876178 ?auto_876182 ) ) ( not ( = ?auto_876178 ?auto_876183 ) ) ( not ( = ?auto_876179 ?auto_876180 ) ) ( not ( = ?auto_876179 ?auto_876181 ) ) ( not ( = ?auto_876179 ?auto_876182 ) ) ( not ( = ?auto_876179 ?auto_876183 ) ) ( not ( = ?auto_876180 ?auto_876181 ) ) ( not ( = ?auto_876180 ?auto_876182 ) ) ( not ( = ?auto_876180 ?auto_876183 ) ) ( not ( = ?auto_876181 ?auto_876182 ) ) ( not ( = ?auto_876181 ?auto_876183 ) ) ( not ( = ?auto_876182 ?auto_876183 ) ) ( ON ?auto_876181 ?auto_876182 ) ( ON ?auto_876180 ?auto_876181 ) ( ON ?auto_876179 ?auto_876180 ) ( CLEAR ?auto_876177 ) ( ON ?auto_876178 ?auto_876179 ) ( CLEAR ?auto_876178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_876168 ?auto_876169 ?auto_876170 ?auto_876171 ?auto_876172 ?auto_876173 ?auto_876174 ?auto_876175 ?auto_876176 ?auto_876177 ?auto_876178 )
      ( MAKE-15PILE ?auto_876168 ?auto_876169 ?auto_876170 ?auto_876171 ?auto_876172 ?auto_876173 ?auto_876174 ?auto_876175 ?auto_876176 ?auto_876177 ?auto_876178 ?auto_876179 ?auto_876180 ?auto_876181 ?auto_876182 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_876230 - BLOCK
      ?auto_876231 - BLOCK
      ?auto_876232 - BLOCK
      ?auto_876233 - BLOCK
      ?auto_876234 - BLOCK
      ?auto_876235 - BLOCK
      ?auto_876236 - BLOCK
      ?auto_876237 - BLOCK
      ?auto_876238 - BLOCK
      ?auto_876239 - BLOCK
      ?auto_876240 - BLOCK
      ?auto_876241 - BLOCK
      ?auto_876242 - BLOCK
      ?auto_876243 - BLOCK
      ?auto_876244 - BLOCK
    )
    :vars
    (
      ?auto_876245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_876244 ?auto_876245 ) ( ON-TABLE ?auto_876230 ) ( ON ?auto_876231 ?auto_876230 ) ( ON ?auto_876232 ?auto_876231 ) ( ON ?auto_876233 ?auto_876232 ) ( ON ?auto_876234 ?auto_876233 ) ( ON ?auto_876235 ?auto_876234 ) ( ON ?auto_876236 ?auto_876235 ) ( ON ?auto_876237 ?auto_876236 ) ( ON ?auto_876238 ?auto_876237 ) ( not ( = ?auto_876230 ?auto_876231 ) ) ( not ( = ?auto_876230 ?auto_876232 ) ) ( not ( = ?auto_876230 ?auto_876233 ) ) ( not ( = ?auto_876230 ?auto_876234 ) ) ( not ( = ?auto_876230 ?auto_876235 ) ) ( not ( = ?auto_876230 ?auto_876236 ) ) ( not ( = ?auto_876230 ?auto_876237 ) ) ( not ( = ?auto_876230 ?auto_876238 ) ) ( not ( = ?auto_876230 ?auto_876239 ) ) ( not ( = ?auto_876230 ?auto_876240 ) ) ( not ( = ?auto_876230 ?auto_876241 ) ) ( not ( = ?auto_876230 ?auto_876242 ) ) ( not ( = ?auto_876230 ?auto_876243 ) ) ( not ( = ?auto_876230 ?auto_876244 ) ) ( not ( = ?auto_876230 ?auto_876245 ) ) ( not ( = ?auto_876231 ?auto_876232 ) ) ( not ( = ?auto_876231 ?auto_876233 ) ) ( not ( = ?auto_876231 ?auto_876234 ) ) ( not ( = ?auto_876231 ?auto_876235 ) ) ( not ( = ?auto_876231 ?auto_876236 ) ) ( not ( = ?auto_876231 ?auto_876237 ) ) ( not ( = ?auto_876231 ?auto_876238 ) ) ( not ( = ?auto_876231 ?auto_876239 ) ) ( not ( = ?auto_876231 ?auto_876240 ) ) ( not ( = ?auto_876231 ?auto_876241 ) ) ( not ( = ?auto_876231 ?auto_876242 ) ) ( not ( = ?auto_876231 ?auto_876243 ) ) ( not ( = ?auto_876231 ?auto_876244 ) ) ( not ( = ?auto_876231 ?auto_876245 ) ) ( not ( = ?auto_876232 ?auto_876233 ) ) ( not ( = ?auto_876232 ?auto_876234 ) ) ( not ( = ?auto_876232 ?auto_876235 ) ) ( not ( = ?auto_876232 ?auto_876236 ) ) ( not ( = ?auto_876232 ?auto_876237 ) ) ( not ( = ?auto_876232 ?auto_876238 ) ) ( not ( = ?auto_876232 ?auto_876239 ) ) ( not ( = ?auto_876232 ?auto_876240 ) ) ( not ( = ?auto_876232 ?auto_876241 ) ) ( not ( = ?auto_876232 ?auto_876242 ) ) ( not ( = ?auto_876232 ?auto_876243 ) ) ( not ( = ?auto_876232 ?auto_876244 ) ) ( not ( = ?auto_876232 ?auto_876245 ) ) ( not ( = ?auto_876233 ?auto_876234 ) ) ( not ( = ?auto_876233 ?auto_876235 ) ) ( not ( = ?auto_876233 ?auto_876236 ) ) ( not ( = ?auto_876233 ?auto_876237 ) ) ( not ( = ?auto_876233 ?auto_876238 ) ) ( not ( = ?auto_876233 ?auto_876239 ) ) ( not ( = ?auto_876233 ?auto_876240 ) ) ( not ( = ?auto_876233 ?auto_876241 ) ) ( not ( = ?auto_876233 ?auto_876242 ) ) ( not ( = ?auto_876233 ?auto_876243 ) ) ( not ( = ?auto_876233 ?auto_876244 ) ) ( not ( = ?auto_876233 ?auto_876245 ) ) ( not ( = ?auto_876234 ?auto_876235 ) ) ( not ( = ?auto_876234 ?auto_876236 ) ) ( not ( = ?auto_876234 ?auto_876237 ) ) ( not ( = ?auto_876234 ?auto_876238 ) ) ( not ( = ?auto_876234 ?auto_876239 ) ) ( not ( = ?auto_876234 ?auto_876240 ) ) ( not ( = ?auto_876234 ?auto_876241 ) ) ( not ( = ?auto_876234 ?auto_876242 ) ) ( not ( = ?auto_876234 ?auto_876243 ) ) ( not ( = ?auto_876234 ?auto_876244 ) ) ( not ( = ?auto_876234 ?auto_876245 ) ) ( not ( = ?auto_876235 ?auto_876236 ) ) ( not ( = ?auto_876235 ?auto_876237 ) ) ( not ( = ?auto_876235 ?auto_876238 ) ) ( not ( = ?auto_876235 ?auto_876239 ) ) ( not ( = ?auto_876235 ?auto_876240 ) ) ( not ( = ?auto_876235 ?auto_876241 ) ) ( not ( = ?auto_876235 ?auto_876242 ) ) ( not ( = ?auto_876235 ?auto_876243 ) ) ( not ( = ?auto_876235 ?auto_876244 ) ) ( not ( = ?auto_876235 ?auto_876245 ) ) ( not ( = ?auto_876236 ?auto_876237 ) ) ( not ( = ?auto_876236 ?auto_876238 ) ) ( not ( = ?auto_876236 ?auto_876239 ) ) ( not ( = ?auto_876236 ?auto_876240 ) ) ( not ( = ?auto_876236 ?auto_876241 ) ) ( not ( = ?auto_876236 ?auto_876242 ) ) ( not ( = ?auto_876236 ?auto_876243 ) ) ( not ( = ?auto_876236 ?auto_876244 ) ) ( not ( = ?auto_876236 ?auto_876245 ) ) ( not ( = ?auto_876237 ?auto_876238 ) ) ( not ( = ?auto_876237 ?auto_876239 ) ) ( not ( = ?auto_876237 ?auto_876240 ) ) ( not ( = ?auto_876237 ?auto_876241 ) ) ( not ( = ?auto_876237 ?auto_876242 ) ) ( not ( = ?auto_876237 ?auto_876243 ) ) ( not ( = ?auto_876237 ?auto_876244 ) ) ( not ( = ?auto_876237 ?auto_876245 ) ) ( not ( = ?auto_876238 ?auto_876239 ) ) ( not ( = ?auto_876238 ?auto_876240 ) ) ( not ( = ?auto_876238 ?auto_876241 ) ) ( not ( = ?auto_876238 ?auto_876242 ) ) ( not ( = ?auto_876238 ?auto_876243 ) ) ( not ( = ?auto_876238 ?auto_876244 ) ) ( not ( = ?auto_876238 ?auto_876245 ) ) ( not ( = ?auto_876239 ?auto_876240 ) ) ( not ( = ?auto_876239 ?auto_876241 ) ) ( not ( = ?auto_876239 ?auto_876242 ) ) ( not ( = ?auto_876239 ?auto_876243 ) ) ( not ( = ?auto_876239 ?auto_876244 ) ) ( not ( = ?auto_876239 ?auto_876245 ) ) ( not ( = ?auto_876240 ?auto_876241 ) ) ( not ( = ?auto_876240 ?auto_876242 ) ) ( not ( = ?auto_876240 ?auto_876243 ) ) ( not ( = ?auto_876240 ?auto_876244 ) ) ( not ( = ?auto_876240 ?auto_876245 ) ) ( not ( = ?auto_876241 ?auto_876242 ) ) ( not ( = ?auto_876241 ?auto_876243 ) ) ( not ( = ?auto_876241 ?auto_876244 ) ) ( not ( = ?auto_876241 ?auto_876245 ) ) ( not ( = ?auto_876242 ?auto_876243 ) ) ( not ( = ?auto_876242 ?auto_876244 ) ) ( not ( = ?auto_876242 ?auto_876245 ) ) ( not ( = ?auto_876243 ?auto_876244 ) ) ( not ( = ?auto_876243 ?auto_876245 ) ) ( not ( = ?auto_876244 ?auto_876245 ) ) ( ON ?auto_876243 ?auto_876244 ) ( ON ?auto_876242 ?auto_876243 ) ( ON ?auto_876241 ?auto_876242 ) ( ON ?auto_876240 ?auto_876241 ) ( CLEAR ?auto_876238 ) ( ON ?auto_876239 ?auto_876240 ) ( CLEAR ?auto_876239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_876230 ?auto_876231 ?auto_876232 ?auto_876233 ?auto_876234 ?auto_876235 ?auto_876236 ?auto_876237 ?auto_876238 ?auto_876239 )
      ( MAKE-15PILE ?auto_876230 ?auto_876231 ?auto_876232 ?auto_876233 ?auto_876234 ?auto_876235 ?auto_876236 ?auto_876237 ?auto_876238 ?auto_876239 ?auto_876240 ?auto_876241 ?auto_876242 ?auto_876243 ?auto_876244 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_876292 - BLOCK
      ?auto_876293 - BLOCK
      ?auto_876294 - BLOCK
      ?auto_876295 - BLOCK
      ?auto_876296 - BLOCK
      ?auto_876297 - BLOCK
      ?auto_876298 - BLOCK
      ?auto_876299 - BLOCK
      ?auto_876300 - BLOCK
      ?auto_876301 - BLOCK
      ?auto_876302 - BLOCK
      ?auto_876303 - BLOCK
      ?auto_876304 - BLOCK
      ?auto_876305 - BLOCK
      ?auto_876306 - BLOCK
    )
    :vars
    (
      ?auto_876307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_876306 ?auto_876307 ) ( ON-TABLE ?auto_876292 ) ( ON ?auto_876293 ?auto_876292 ) ( ON ?auto_876294 ?auto_876293 ) ( ON ?auto_876295 ?auto_876294 ) ( ON ?auto_876296 ?auto_876295 ) ( ON ?auto_876297 ?auto_876296 ) ( ON ?auto_876298 ?auto_876297 ) ( ON ?auto_876299 ?auto_876298 ) ( not ( = ?auto_876292 ?auto_876293 ) ) ( not ( = ?auto_876292 ?auto_876294 ) ) ( not ( = ?auto_876292 ?auto_876295 ) ) ( not ( = ?auto_876292 ?auto_876296 ) ) ( not ( = ?auto_876292 ?auto_876297 ) ) ( not ( = ?auto_876292 ?auto_876298 ) ) ( not ( = ?auto_876292 ?auto_876299 ) ) ( not ( = ?auto_876292 ?auto_876300 ) ) ( not ( = ?auto_876292 ?auto_876301 ) ) ( not ( = ?auto_876292 ?auto_876302 ) ) ( not ( = ?auto_876292 ?auto_876303 ) ) ( not ( = ?auto_876292 ?auto_876304 ) ) ( not ( = ?auto_876292 ?auto_876305 ) ) ( not ( = ?auto_876292 ?auto_876306 ) ) ( not ( = ?auto_876292 ?auto_876307 ) ) ( not ( = ?auto_876293 ?auto_876294 ) ) ( not ( = ?auto_876293 ?auto_876295 ) ) ( not ( = ?auto_876293 ?auto_876296 ) ) ( not ( = ?auto_876293 ?auto_876297 ) ) ( not ( = ?auto_876293 ?auto_876298 ) ) ( not ( = ?auto_876293 ?auto_876299 ) ) ( not ( = ?auto_876293 ?auto_876300 ) ) ( not ( = ?auto_876293 ?auto_876301 ) ) ( not ( = ?auto_876293 ?auto_876302 ) ) ( not ( = ?auto_876293 ?auto_876303 ) ) ( not ( = ?auto_876293 ?auto_876304 ) ) ( not ( = ?auto_876293 ?auto_876305 ) ) ( not ( = ?auto_876293 ?auto_876306 ) ) ( not ( = ?auto_876293 ?auto_876307 ) ) ( not ( = ?auto_876294 ?auto_876295 ) ) ( not ( = ?auto_876294 ?auto_876296 ) ) ( not ( = ?auto_876294 ?auto_876297 ) ) ( not ( = ?auto_876294 ?auto_876298 ) ) ( not ( = ?auto_876294 ?auto_876299 ) ) ( not ( = ?auto_876294 ?auto_876300 ) ) ( not ( = ?auto_876294 ?auto_876301 ) ) ( not ( = ?auto_876294 ?auto_876302 ) ) ( not ( = ?auto_876294 ?auto_876303 ) ) ( not ( = ?auto_876294 ?auto_876304 ) ) ( not ( = ?auto_876294 ?auto_876305 ) ) ( not ( = ?auto_876294 ?auto_876306 ) ) ( not ( = ?auto_876294 ?auto_876307 ) ) ( not ( = ?auto_876295 ?auto_876296 ) ) ( not ( = ?auto_876295 ?auto_876297 ) ) ( not ( = ?auto_876295 ?auto_876298 ) ) ( not ( = ?auto_876295 ?auto_876299 ) ) ( not ( = ?auto_876295 ?auto_876300 ) ) ( not ( = ?auto_876295 ?auto_876301 ) ) ( not ( = ?auto_876295 ?auto_876302 ) ) ( not ( = ?auto_876295 ?auto_876303 ) ) ( not ( = ?auto_876295 ?auto_876304 ) ) ( not ( = ?auto_876295 ?auto_876305 ) ) ( not ( = ?auto_876295 ?auto_876306 ) ) ( not ( = ?auto_876295 ?auto_876307 ) ) ( not ( = ?auto_876296 ?auto_876297 ) ) ( not ( = ?auto_876296 ?auto_876298 ) ) ( not ( = ?auto_876296 ?auto_876299 ) ) ( not ( = ?auto_876296 ?auto_876300 ) ) ( not ( = ?auto_876296 ?auto_876301 ) ) ( not ( = ?auto_876296 ?auto_876302 ) ) ( not ( = ?auto_876296 ?auto_876303 ) ) ( not ( = ?auto_876296 ?auto_876304 ) ) ( not ( = ?auto_876296 ?auto_876305 ) ) ( not ( = ?auto_876296 ?auto_876306 ) ) ( not ( = ?auto_876296 ?auto_876307 ) ) ( not ( = ?auto_876297 ?auto_876298 ) ) ( not ( = ?auto_876297 ?auto_876299 ) ) ( not ( = ?auto_876297 ?auto_876300 ) ) ( not ( = ?auto_876297 ?auto_876301 ) ) ( not ( = ?auto_876297 ?auto_876302 ) ) ( not ( = ?auto_876297 ?auto_876303 ) ) ( not ( = ?auto_876297 ?auto_876304 ) ) ( not ( = ?auto_876297 ?auto_876305 ) ) ( not ( = ?auto_876297 ?auto_876306 ) ) ( not ( = ?auto_876297 ?auto_876307 ) ) ( not ( = ?auto_876298 ?auto_876299 ) ) ( not ( = ?auto_876298 ?auto_876300 ) ) ( not ( = ?auto_876298 ?auto_876301 ) ) ( not ( = ?auto_876298 ?auto_876302 ) ) ( not ( = ?auto_876298 ?auto_876303 ) ) ( not ( = ?auto_876298 ?auto_876304 ) ) ( not ( = ?auto_876298 ?auto_876305 ) ) ( not ( = ?auto_876298 ?auto_876306 ) ) ( not ( = ?auto_876298 ?auto_876307 ) ) ( not ( = ?auto_876299 ?auto_876300 ) ) ( not ( = ?auto_876299 ?auto_876301 ) ) ( not ( = ?auto_876299 ?auto_876302 ) ) ( not ( = ?auto_876299 ?auto_876303 ) ) ( not ( = ?auto_876299 ?auto_876304 ) ) ( not ( = ?auto_876299 ?auto_876305 ) ) ( not ( = ?auto_876299 ?auto_876306 ) ) ( not ( = ?auto_876299 ?auto_876307 ) ) ( not ( = ?auto_876300 ?auto_876301 ) ) ( not ( = ?auto_876300 ?auto_876302 ) ) ( not ( = ?auto_876300 ?auto_876303 ) ) ( not ( = ?auto_876300 ?auto_876304 ) ) ( not ( = ?auto_876300 ?auto_876305 ) ) ( not ( = ?auto_876300 ?auto_876306 ) ) ( not ( = ?auto_876300 ?auto_876307 ) ) ( not ( = ?auto_876301 ?auto_876302 ) ) ( not ( = ?auto_876301 ?auto_876303 ) ) ( not ( = ?auto_876301 ?auto_876304 ) ) ( not ( = ?auto_876301 ?auto_876305 ) ) ( not ( = ?auto_876301 ?auto_876306 ) ) ( not ( = ?auto_876301 ?auto_876307 ) ) ( not ( = ?auto_876302 ?auto_876303 ) ) ( not ( = ?auto_876302 ?auto_876304 ) ) ( not ( = ?auto_876302 ?auto_876305 ) ) ( not ( = ?auto_876302 ?auto_876306 ) ) ( not ( = ?auto_876302 ?auto_876307 ) ) ( not ( = ?auto_876303 ?auto_876304 ) ) ( not ( = ?auto_876303 ?auto_876305 ) ) ( not ( = ?auto_876303 ?auto_876306 ) ) ( not ( = ?auto_876303 ?auto_876307 ) ) ( not ( = ?auto_876304 ?auto_876305 ) ) ( not ( = ?auto_876304 ?auto_876306 ) ) ( not ( = ?auto_876304 ?auto_876307 ) ) ( not ( = ?auto_876305 ?auto_876306 ) ) ( not ( = ?auto_876305 ?auto_876307 ) ) ( not ( = ?auto_876306 ?auto_876307 ) ) ( ON ?auto_876305 ?auto_876306 ) ( ON ?auto_876304 ?auto_876305 ) ( ON ?auto_876303 ?auto_876304 ) ( ON ?auto_876302 ?auto_876303 ) ( ON ?auto_876301 ?auto_876302 ) ( CLEAR ?auto_876299 ) ( ON ?auto_876300 ?auto_876301 ) ( CLEAR ?auto_876300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_876292 ?auto_876293 ?auto_876294 ?auto_876295 ?auto_876296 ?auto_876297 ?auto_876298 ?auto_876299 ?auto_876300 )
      ( MAKE-15PILE ?auto_876292 ?auto_876293 ?auto_876294 ?auto_876295 ?auto_876296 ?auto_876297 ?auto_876298 ?auto_876299 ?auto_876300 ?auto_876301 ?auto_876302 ?auto_876303 ?auto_876304 ?auto_876305 ?auto_876306 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_876354 - BLOCK
      ?auto_876355 - BLOCK
      ?auto_876356 - BLOCK
      ?auto_876357 - BLOCK
      ?auto_876358 - BLOCK
      ?auto_876359 - BLOCK
      ?auto_876360 - BLOCK
      ?auto_876361 - BLOCK
      ?auto_876362 - BLOCK
      ?auto_876363 - BLOCK
      ?auto_876364 - BLOCK
      ?auto_876365 - BLOCK
      ?auto_876366 - BLOCK
      ?auto_876367 - BLOCK
      ?auto_876368 - BLOCK
    )
    :vars
    (
      ?auto_876369 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_876368 ?auto_876369 ) ( ON-TABLE ?auto_876354 ) ( ON ?auto_876355 ?auto_876354 ) ( ON ?auto_876356 ?auto_876355 ) ( ON ?auto_876357 ?auto_876356 ) ( ON ?auto_876358 ?auto_876357 ) ( ON ?auto_876359 ?auto_876358 ) ( ON ?auto_876360 ?auto_876359 ) ( not ( = ?auto_876354 ?auto_876355 ) ) ( not ( = ?auto_876354 ?auto_876356 ) ) ( not ( = ?auto_876354 ?auto_876357 ) ) ( not ( = ?auto_876354 ?auto_876358 ) ) ( not ( = ?auto_876354 ?auto_876359 ) ) ( not ( = ?auto_876354 ?auto_876360 ) ) ( not ( = ?auto_876354 ?auto_876361 ) ) ( not ( = ?auto_876354 ?auto_876362 ) ) ( not ( = ?auto_876354 ?auto_876363 ) ) ( not ( = ?auto_876354 ?auto_876364 ) ) ( not ( = ?auto_876354 ?auto_876365 ) ) ( not ( = ?auto_876354 ?auto_876366 ) ) ( not ( = ?auto_876354 ?auto_876367 ) ) ( not ( = ?auto_876354 ?auto_876368 ) ) ( not ( = ?auto_876354 ?auto_876369 ) ) ( not ( = ?auto_876355 ?auto_876356 ) ) ( not ( = ?auto_876355 ?auto_876357 ) ) ( not ( = ?auto_876355 ?auto_876358 ) ) ( not ( = ?auto_876355 ?auto_876359 ) ) ( not ( = ?auto_876355 ?auto_876360 ) ) ( not ( = ?auto_876355 ?auto_876361 ) ) ( not ( = ?auto_876355 ?auto_876362 ) ) ( not ( = ?auto_876355 ?auto_876363 ) ) ( not ( = ?auto_876355 ?auto_876364 ) ) ( not ( = ?auto_876355 ?auto_876365 ) ) ( not ( = ?auto_876355 ?auto_876366 ) ) ( not ( = ?auto_876355 ?auto_876367 ) ) ( not ( = ?auto_876355 ?auto_876368 ) ) ( not ( = ?auto_876355 ?auto_876369 ) ) ( not ( = ?auto_876356 ?auto_876357 ) ) ( not ( = ?auto_876356 ?auto_876358 ) ) ( not ( = ?auto_876356 ?auto_876359 ) ) ( not ( = ?auto_876356 ?auto_876360 ) ) ( not ( = ?auto_876356 ?auto_876361 ) ) ( not ( = ?auto_876356 ?auto_876362 ) ) ( not ( = ?auto_876356 ?auto_876363 ) ) ( not ( = ?auto_876356 ?auto_876364 ) ) ( not ( = ?auto_876356 ?auto_876365 ) ) ( not ( = ?auto_876356 ?auto_876366 ) ) ( not ( = ?auto_876356 ?auto_876367 ) ) ( not ( = ?auto_876356 ?auto_876368 ) ) ( not ( = ?auto_876356 ?auto_876369 ) ) ( not ( = ?auto_876357 ?auto_876358 ) ) ( not ( = ?auto_876357 ?auto_876359 ) ) ( not ( = ?auto_876357 ?auto_876360 ) ) ( not ( = ?auto_876357 ?auto_876361 ) ) ( not ( = ?auto_876357 ?auto_876362 ) ) ( not ( = ?auto_876357 ?auto_876363 ) ) ( not ( = ?auto_876357 ?auto_876364 ) ) ( not ( = ?auto_876357 ?auto_876365 ) ) ( not ( = ?auto_876357 ?auto_876366 ) ) ( not ( = ?auto_876357 ?auto_876367 ) ) ( not ( = ?auto_876357 ?auto_876368 ) ) ( not ( = ?auto_876357 ?auto_876369 ) ) ( not ( = ?auto_876358 ?auto_876359 ) ) ( not ( = ?auto_876358 ?auto_876360 ) ) ( not ( = ?auto_876358 ?auto_876361 ) ) ( not ( = ?auto_876358 ?auto_876362 ) ) ( not ( = ?auto_876358 ?auto_876363 ) ) ( not ( = ?auto_876358 ?auto_876364 ) ) ( not ( = ?auto_876358 ?auto_876365 ) ) ( not ( = ?auto_876358 ?auto_876366 ) ) ( not ( = ?auto_876358 ?auto_876367 ) ) ( not ( = ?auto_876358 ?auto_876368 ) ) ( not ( = ?auto_876358 ?auto_876369 ) ) ( not ( = ?auto_876359 ?auto_876360 ) ) ( not ( = ?auto_876359 ?auto_876361 ) ) ( not ( = ?auto_876359 ?auto_876362 ) ) ( not ( = ?auto_876359 ?auto_876363 ) ) ( not ( = ?auto_876359 ?auto_876364 ) ) ( not ( = ?auto_876359 ?auto_876365 ) ) ( not ( = ?auto_876359 ?auto_876366 ) ) ( not ( = ?auto_876359 ?auto_876367 ) ) ( not ( = ?auto_876359 ?auto_876368 ) ) ( not ( = ?auto_876359 ?auto_876369 ) ) ( not ( = ?auto_876360 ?auto_876361 ) ) ( not ( = ?auto_876360 ?auto_876362 ) ) ( not ( = ?auto_876360 ?auto_876363 ) ) ( not ( = ?auto_876360 ?auto_876364 ) ) ( not ( = ?auto_876360 ?auto_876365 ) ) ( not ( = ?auto_876360 ?auto_876366 ) ) ( not ( = ?auto_876360 ?auto_876367 ) ) ( not ( = ?auto_876360 ?auto_876368 ) ) ( not ( = ?auto_876360 ?auto_876369 ) ) ( not ( = ?auto_876361 ?auto_876362 ) ) ( not ( = ?auto_876361 ?auto_876363 ) ) ( not ( = ?auto_876361 ?auto_876364 ) ) ( not ( = ?auto_876361 ?auto_876365 ) ) ( not ( = ?auto_876361 ?auto_876366 ) ) ( not ( = ?auto_876361 ?auto_876367 ) ) ( not ( = ?auto_876361 ?auto_876368 ) ) ( not ( = ?auto_876361 ?auto_876369 ) ) ( not ( = ?auto_876362 ?auto_876363 ) ) ( not ( = ?auto_876362 ?auto_876364 ) ) ( not ( = ?auto_876362 ?auto_876365 ) ) ( not ( = ?auto_876362 ?auto_876366 ) ) ( not ( = ?auto_876362 ?auto_876367 ) ) ( not ( = ?auto_876362 ?auto_876368 ) ) ( not ( = ?auto_876362 ?auto_876369 ) ) ( not ( = ?auto_876363 ?auto_876364 ) ) ( not ( = ?auto_876363 ?auto_876365 ) ) ( not ( = ?auto_876363 ?auto_876366 ) ) ( not ( = ?auto_876363 ?auto_876367 ) ) ( not ( = ?auto_876363 ?auto_876368 ) ) ( not ( = ?auto_876363 ?auto_876369 ) ) ( not ( = ?auto_876364 ?auto_876365 ) ) ( not ( = ?auto_876364 ?auto_876366 ) ) ( not ( = ?auto_876364 ?auto_876367 ) ) ( not ( = ?auto_876364 ?auto_876368 ) ) ( not ( = ?auto_876364 ?auto_876369 ) ) ( not ( = ?auto_876365 ?auto_876366 ) ) ( not ( = ?auto_876365 ?auto_876367 ) ) ( not ( = ?auto_876365 ?auto_876368 ) ) ( not ( = ?auto_876365 ?auto_876369 ) ) ( not ( = ?auto_876366 ?auto_876367 ) ) ( not ( = ?auto_876366 ?auto_876368 ) ) ( not ( = ?auto_876366 ?auto_876369 ) ) ( not ( = ?auto_876367 ?auto_876368 ) ) ( not ( = ?auto_876367 ?auto_876369 ) ) ( not ( = ?auto_876368 ?auto_876369 ) ) ( ON ?auto_876367 ?auto_876368 ) ( ON ?auto_876366 ?auto_876367 ) ( ON ?auto_876365 ?auto_876366 ) ( ON ?auto_876364 ?auto_876365 ) ( ON ?auto_876363 ?auto_876364 ) ( ON ?auto_876362 ?auto_876363 ) ( CLEAR ?auto_876360 ) ( ON ?auto_876361 ?auto_876362 ) ( CLEAR ?auto_876361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_876354 ?auto_876355 ?auto_876356 ?auto_876357 ?auto_876358 ?auto_876359 ?auto_876360 ?auto_876361 )
      ( MAKE-15PILE ?auto_876354 ?auto_876355 ?auto_876356 ?auto_876357 ?auto_876358 ?auto_876359 ?auto_876360 ?auto_876361 ?auto_876362 ?auto_876363 ?auto_876364 ?auto_876365 ?auto_876366 ?auto_876367 ?auto_876368 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_876416 - BLOCK
      ?auto_876417 - BLOCK
      ?auto_876418 - BLOCK
      ?auto_876419 - BLOCK
      ?auto_876420 - BLOCK
      ?auto_876421 - BLOCK
      ?auto_876422 - BLOCK
      ?auto_876423 - BLOCK
      ?auto_876424 - BLOCK
      ?auto_876425 - BLOCK
      ?auto_876426 - BLOCK
      ?auto_876427 - BLOCK
      ?auto_876428 - BLOCK
      ?auto_876429 - BLOCK
      ?auto_876430 - BLOCK
    )
    :vars
    (
      ?auto_876431 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_876430 ?auto_876431 ) ( ON-TABLE ?auto_876416 ) ( ON ?auto_876417 ?auto_876416 ) ( ON ?auto_876418 ?auto_876417 ) ( ON ?auto_876419 ?auto_876418 ) ( ON ?auto_876420 ?auto_876419 ) ( ON ?auto_876421 ?auto_876420 ) ( not ( = ?auto_876416 ?auto_876417 ) ) ( not ( = ?auto_876416 ?auto_876418 ) ) ( not ( = ?auto_876416 ?auto_876419 ) ) ( not ( = ?auto_876416 ?auto_876420 ) ) ( not ( = ?auto_876416 ?auto_876421 ) ) ( not ( = ?auto_876416 ?auto_876422 ) ) ( not ( = ?auto_876416 ?auto_876423 ) ) ( not ( = ?auto_876416 ?auto_876424 ) ) ( not ( = ?auto_876416 ?auto_876425 ) ) ( not ( = ?auto_876416 ?auto_876426 ) ) ( not ( = ?auto_876416 ?auto_876427 ) ) ( not ( = ?auto_876416 ?auto_876428 ) ) ( not ( = ?auto_876416 ?auto_876429 ) ) ( not ( = ?auto_876416 ?auto_876430 ) ) ( not ( = ?auto_876416 ?auto_876431 ) ) ( not ( = ?auto_876417 ?auto_876418 ) ) ( not ( = ?auto_876417 ?auto_876419 ) ) ( not ( = ?auto_876417 ?auto_876420 ) ) ( not ( = ?auto_876417 ?auto_876421 ) ) ( not ( = ?auto_876417 ?auto_876422 ) ) ( not ( = ?auto_876417 ?auto_876423 ) ) ( not ( = ?auto_876417 ?auto_876424 ) ) ( not ( = ?auto_876417 ?auto_876425 ) ) ( not ( = ?auto_876417 ?auto_876426 ) ) ( not ( = ?auto_876417 ?auto_876427 ) ) ( not ( = ?auto_876417 ?auto_876428 ) ) ( not ( = ?auto_876417 ?auto_876429 ) ) ( not ( = ?auto_876417 ?auto_876430 ) ) ( not ( = ?auto_876417 ?auto_876431 ) ) ( not ( = ?auto_876418 ?auto_876419 ) ) ( not ( = ?auto_876418 ?auto_876420 ) ) ( not ( = ?auto_876418 ?auto_876421 ) ) ( not ( = ?auto_876418 ?auto_876422 ) ) ( not ( = ?auto_876418 ?auto_876423 ) ) ( not ( = ?auto_876418 ?auto_876424 ) ) ( not ( = ?auto_876418 ?auto_876425 ) ) ( not ( = ?auto_876418 ?auto_876426 ) ) ( not ( = ?auto_876418 ?auto_876427 ) ) ( not ( = ?auto_876418 ?auto_876428 ) ) ( not ( = ?auto_876418 ?auto_876429 ) ) ( not ( = ?auto_876418 ?auto_876430 ) ) ( not ( = ?auto_876418 ?auto_876431 ) ) ( not ( = ?auto_876419 ?auto_876420 ) ) ( not ( = ?auto_876419 ?auto_876421 ) ) ( not ( = ?auto_876419 ?auto_876422 ) ) ( not ( = ?auto_876419 ?auto_876423 ) ) ( not ( = ?auto_876419 ?auto_876424 ) ) ( not ( = ?auto_876419 ?auto_876425 ) ) ( not ( = ?auto_876419 ?auto_876426 ) ) ( not ( = ?auto_876419 ?auto_876427 ) ) ( not ( = ?auto_876419 ?auto_876428 ) ) ( not ( = ?auto_876419 ?auto_876429 ) ) ( not ( = ?auto_876419 ?auto_876430 ) ) ( not ( = ?auto_876419 ?auto_876431 ) ) ( not ( = ?auto_876420 ?auto_876421 ) ) ( not ( = ?auto_876420 ?auto_876422 ) ) ( not ( = ?auto_876420 ?auto_876423 ) ) ( not ( = ?auto_876420 ?auto_876424 ) ) ( not ( = ?auto_876420 ?auto_876425 ) ) ( not ( = ?auto_876420 ?auto_876426 ) ) ( not ( = ?auto_876420 ?auto_876427 ) ) ( not ( = ?auto_876420 ?auto_876428 ) ) ( not ( = ?auto_876420 ?auto_876429 ) ) ( not ( = ?auto_876420 ?auto_876430 ) ) ( not ( = ?auto_876420 ?auto_876431 ) ) ( not ( = ?auto_876421 ?auto_876422 ) ) ( not ( = ?auto_876421 ?auto_876423 ) ) ( not ( = ?auto_876421 ?auto_876424 ) ) ( not ( = ?auto_876421 ?auto_876425 ) ) ( not ( = ?auto_876421 ?auto_876426 ) ) ( not ( = ?auto_876421 ?auto_876427 ) ) ( not ( = ?auto_876421 ?auto_876428 ) ) ( not ( = ?auto_876421 ?auto_876429 ) ) ( not ( = ?auto_876421 ?auto_876430 ) ) ( not ( = ?auto_876421 ?auto_876431 ) ) ( not ( = ?auto_876422 ?auto_876423 ) ) ( not ( = ?auto_876422 ?auto_876424 ) ) ( not ( = ?auto_876422 ?auto_876425 ) ) ( not ( = ?auto_876422 ?auto_876426 ) ) ( not ( = ?auto_876422 ?auto_876427 ) ) ( not ( = ?auto_876422 ?auto_876428 ) ) ( not ( = ?auto_876422 ?auto_876429 ) ) ( not ( = ?auto_876422 ?auto_876430 ) ) ( not ( = ?auto_876422 ?auto_876431 ) ) ( not ( = ?auto_876423 ?auto_876424 ) ) ( not ( = ?auto_876423 ?auto_876425 ) ) ( not ( = ?auto_876423 ?auto_876426 ) ) ( not ( = ?auto_876423 ?auto_876427 ) ) ( not ( = ?auto_876423 ?auto_876428 ) ) ( not ( = ?auto_876423 ?auto_876429 ) ) ( not ( = ?auto_876423 ?auto_876430 ) ) ( not ( = ?auto_876423 ?auto_876431 ) ) ( not ( = ?auto_876424 ?auto_876425 ) ) ( not ( = ?auto_876424 ?auto_876426 ) ) ( not ( = ?auto_876424 ?auto_876427 ) ) ( not ( = ?auto_876424 ?auto_876428 ) ) ( not ( = ?auto_876424 ?auto_876429 ) ) ( not ( = ?auto_876424 ?auto_876430 ) ) ( not ( = ?auto_876424 ?auto_876431 ) ) ( not ( = ?auto_876425 ?auto_876426 ) ) ( not ( = ?auto_876425 ?auto_876427 ) ) ( not ( = ?auto_876425 ?auto_876428 ) ) ( not ( = ?auto_876425 ?auto_876429 ) ) ( not ( = ?auto_876425 ?auto_876430 ) ) ( not ( = ?auto_876425 ?auto_876431 ) ) ( not ( = ?auto_876426 ?auto_876427 ) ) ( not ( = ?auto_876426 ?auto_876428 ) ) ( not ( = ?auto_876426 ?auto_876429 ) ) ( not ( = ?auto_876426 ?auto_876430 ) ) ( not ( = ?auto_876426 ?auto_876431 ) ) ( not ( = ?auto_876427 ?auto_876428 ) ) ( not ( = ?auto_876427 ?auto_876429 ) ) ( not ( = ?auto_876427 ?auto_876430 ) ) ( not ( = ?auto_876427 ?auto_876431 ) ) ( not ( = ?auto_876428 ?auto_876429 ) ) ( not ( = ?auto_876428 ?auto_876430 ) ) ( not ( = ?auto_876428 ?auto_876431 ) ) ( not ( = ?auto_876429 ?auto_876430 ) ) ( not ( = ?auto_876429 ?auto_876431 ) ) ( not ( = ?auto_876430 ?auto_876431 ) ) ( ON ?auto_876429 ?auto_876430 ) ( ON ?auto_876428 ?auto_876429 ) ( ON ?auto_876427 ?auto_876428 ) ( ON ?auto_876426 ?auto_876427 ) ( ON ?auto_876425 ?auto_876426 ) ( ON ?auto_876424 ?auto_876425 ) ( ON ?auto_876423 ?auto_876424 ) ( CLEAR ?auto_876421 ) ( ON ?auto_876422 ?auto_876423 ) ( CLEAR ?auto_876422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_876416 ?auto_876417 ?auto_876418 ?auto_876419 ?auto_876420 ?auto_876421 ?auto_876422 )
      ( MAKE-15PILE ?auto_876416 ?auto_876417 ?auto_876418 ?auto_876419 ?auto_876420 ?auto_876421 ?auto_876422 ?auto_876423 ?auto_876424 ?auto_876425 ?auto_876426 ?auto_876427 ?auto_876428 ?auto_876429 ?auto_876430 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_876478 - BLOCK
      ?auto_876479 - BLOCK
      ?auto_876480 - BLOCK
      ?auto_876481 - BLOCK
      ?auto_876482 - BLOCK
      ?auto_876483 - BLOCK
      ?auto_876484 - BLOCK
      ?auto_876485 - BLOCK
      ?auto_876486 - BLOCK
      ?auto_876487 - BLOCK
      ?auto_876488 - BLOCK
      ?auto_876489 - BLOCK
      ?auto_876490 - BLOCK
      ?auto_876491 - BLOCK
      ?auto_876492 - BLOCK
    )
    :vars
    (
      ?auto_876493 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_876492 ?auto_876493 ) ( ON-TABLE ?auto_876478 ) ( ON ?auto_876479 ?auto_876478 ) ( ON ?auto_876480 ?auto_876479 ) ( ON ?auto_876481 ?auto_876480 ) ( ON ?auto_876482 ?auto_876481 ) ( not ( = ?auto_876478 ?auto_876479 ) ) ( not ( = ?auto_876478 ?auto_876480 ) ) ( not ( = ?auto_876478 ?auto_876481 ) ) ( not ( = ?auto_876478 ?auto_876482 ) ) ( not ( = ?auto_876478 ?auto_876483 ) ) ( not ( = ?auto_876478 ?auto_876484 ) ) ( not ( = ?auto_876478 ?auto_876485 ) ) ( not ( = ?auto_876478 ?auto_876486 ) ) ( not ( = ?auto_876478 ?auto_876487 ) ) ( not ( = ?auto_876478 ?auto_876488 ) ) ( not ( = ?auto_876478 ?auto_876489 ) ) ( not ( = ?auto_876478 ?auto_876490 ) ) ( not ( = ?auto_876478 ?auto_876491 ) ) ( not ( = ?auto_876478 ?auto_876492 ) ) ( not ( = ?auto_876478 ?auto_876493 ) ) ( not ( = ?auto_876479 ?auto_876480 ) ) ( not ( = ?auto_876479 ?auto_876481 ) ) ( not ( = ?auto_876479 ?auto_876482 ) ) ( not ( = ?auto_876479 ?auto_876483 ) ) ( not ( = ?auto_876479 ?auto_876484 ) ) ( not ( = ?auto_876479 ?auto_876485 ) ) ( not ( = ?auto_876479 ?auto_876486 ) ) ( not ( = ?auto_876479 ?auto_876487 ) ) ( not ( = ?auto_876479 ?auto_876488 ) ) ( not ( = ?auto_876479 ?auto_876489 ) ) ( not ( = ?auto_876479 ?auto_876490 ) ) ( not ( = ?auto_876479 ?auto_876491 ) ) ( not ( = ?auto_876479 ?auto_876492 ) ) ( not ( = ?auto_876479 ?auto_876493 ) ) ( not ( = ?auto_876480 ?auto_876481 ) ) ( not ( = ?auto_876480 ?auto_876482 ) ) ( not ( = ?auto_876480 ?auto_876483 ) ) ( not ( = ?auto_876480 ?auto_876484 ) ) ( not ( = ?auto_876480 ?auto_876485 ) ) ( not ( = ?auto_876480 ?auto_876486 ) ) ( not ( = ?auto_876480 ?auto_876487 ) ) ( not ( = ?auto_876480 ?auto_876488 ) ) ( not ( = ?auto_876480 ?auto_876489 ) ) ( not ( = ?auto_876480 ?auto_876490 ) ) ( not ( = ?auto_876480 ?auto_876491 ) ) ( not ( = ?auto_876480 ?auto_876492 ) ) ( not ( = ?auto_876480 ?auto_876493 ) ) ( not ( = ?auto_876481 ?auto_876482 ) ) ( not ( = ?auto_876481 ?auto_876483 ) ) ( not ( = ?auto_876481 ?auto_876484 ) ) ( not ( = ?auto_876481 ?auto_876485 ) ) ( not ( = ?auto_876481 ?auto_876486 ) ) ( not ( = ?auto_876481 ?auto_876487 ) ) ( not ( = ?auto_876481 ?auto_876488 ) ) ( not ( = ?auto_876481 ?auto_876489 ) ) ( not ( = ?auto_876481 ?auto_876490 ) ) ( not ( = ?auto_876481 ?auto_876491 ) ) ( not ( = ?auto_876481 ?auto_876492 ) ) ( not ( = ?auto_876481 ?auto_876493 ) ) ( not ( = ?auto_876482 ?auto_876483 ) ) ( not ( = ?auto_876482 ?auto_876484 ) ) ( not ( = ?auto_876482 ?auto_876485 ) ) ( not ( = ?auto_876482 ?auto_876486 ) ) ( not ( = ?auto_876482 ?auto_876487 ) ) ( not ( = ?auto_876482 ?auto_876488 ) ) ( not ( = ?auto_876482 ?auto_876489 ) ) ( not ( = ?auto_876482 ?auto_876490 ) ) ( not ( = ?auto_876482 ?auto_876491 ) ) ( not ( = ?auto_876482 ?auto_876492 ) ) ( not ( = ?auto_876482 ?auto_876493 ) ) ( not ( = ?auto_876483 ?auto_876484 ) ) ( not ( = ?auto_876483 ?auto_876485 ) ) ( not ( = ?auto_876483 ?auto_876486 ) ) ( not ( = ?auto_876483 ?auto_876487 ) ) ( not ( = ?auto_876483 ?auto_876488 ) ) ( not ( = ?auto_876483 ?auto_876489 ) ) ( not ( = ?auto_876483 ?auto_876490 ) ) ( not ( = ?auto_876483 ?auto_876491 ) ) ( not ( = ?auto_876483 ?auto_876492 ) ) ( not ( = ?auto_876483 ?auto_876493 ) ) ( not ( = ?auto_876484 ?auto_876485 ) ) ( not ( = ?auto_876484 ?auto_876486 ) ) ( not ( = ?auto_876484 ?auto_876487 ) ) ( not ( = ?auto_876484 ?auto_876488 ) ) ( not ( = ?auto_876484 ?auto_876489 ) ) ( not ( = ?auto_876484 ?auto_876490 ) ) ( not ( = ?auto_876484 ?auto_876491 ) ) ( not ( = ?auto_876484 ?auto_876492 ) ) ( not ( = ?auto_876484 ?auto_876493 ) ) ( not ( = ?auto_876485 ?auto_876486 ) ) ( not ( = ?auto_876485 ?auto_876487 ) ) ( not ( = ?auto_876485 ?auto_876488 ) ) ( not ( = ?auto_876485 ?auto_876489 ) ) ( not ( = ?auto_876485 ?auto_876490 ) ) ( not ( = ?auto_876485 ?auto_876491 ) ) ( not ( = ?auto_876485 ?auto_876492 ) ) ( not ( = ?auto_876485 ?auto_876493 ) ) ( not ( = ?auto_876486 ?auto_876487 ) ) ( not ( = ?auto_876486 ?auto_876488 ) ) ( not ( = ?auto_876486 ?auto_876489 ) ) ( not ( = ?auto_876486 ?auto_876490 ) ) ( not ( = ?auto_876486 ?auto_876491 ) ) ( not ( = ?auto_876486 ?auto_876492 ) ) ( not ( = ?auto_876486 ?auto_876493 ) ) ( not ( = ?auto_876487 ?auto_876488 ) ) ( not ( = ?auto_876487 ?auto_876489 ) ) ( not ( = ?auto_876487 ?auto_876490 ) ) ( not ( = ?auto_876487 ?auto_876491 ) ) ( not ( = ?auto_876487 ?auto_876492 ) ) ( not ( = ?auto_876487 ?auto_876493 ) ) ( not ( = ?auto_876488 ?auto_876489 ) ) ( not ( = ?auto_876488 ?auto_876490 ) ) ( not ( = ?auto_876488 ?auto_876491 ) ) ( not ( = ?auto_876488 ?auto_876492 ) ) ( not ( = ?auto_876488 ?auto_876493 ) ) ( not ( = ?auto_876489 ?auto_876490 ) ) ( not ( = ?auto_876489 ?auto_876491 ) ) ( not ( = ?auto_876489 ?auto_876492 ) ) ( not ( = ?auto_876489 ?auto_876493 ) ) ( not ( = ?auto_876490 ?auto_876491 ) ) ( not ( = ?auto_876490 ?auto_876492 ) ) ( not ( = ?auto_876490 ?auto_876493 ) ) ( not ( = ?auto_876491 ?auto_876492 ) ) ( not ( = ?auto_876491 ?auto_876493 ) ) ( not ( = ?auto_876492 ?auto_876493 ) ) ( ON ?auto_876491 ?auto_876492 ) ( ON ?auto_876490 ?auto_876491 ) ( ON ?auto_876489 ?auto_876490 ) ( ON ?auto_876488 ?auto_876489 ) ( ON ?auto_876487 ?auto_876488 ) ( ON ?auto_876486 ?auto_876487 ) ( ON ?auto_876485 ?auto_876486 ) ( ON ?auto_876484 ?auto_876485 ) ( CLEAR ?auto_876482 ) ( ON ?auto_876483 ?auto_876484 ) ( CLEAR ?auto_876483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_876478 ?auto_876479 ?auto_876480 ?auto_876481 ?auto_876482 ?auto_876483 )
      ( MAKE-15PILE ?auto_876478 ?auto_876479 ?auto_876480 ?auto_876481 ?auto_876482 ?auto_876483 ?auto_876484 ?auto_876485 ?auto_876486 ?auto_876487 ?auto_876488 ?auto_876489 ?auto_876490 ?auto_876491 ?auto_876492 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_876540 - BLOCK
      ?auto_876541 - BLOCK
      ?auto_876542 - BLOCK
      ?auto_876543 - BLOCK
      ?auto_876544 - BLOCK
      ?auto_876545 - BLOCK
      ?auto_876546 - BLOCK
      ?auto_876547 - BLOCK
      ?auto_876548 - BLOCK
      ?auto_876549 - BLOCK
      ?auto_876550 - BLOCK
      ?auto_876551 - BLOCK
      ?auto_876552 - BLOCK
      ?auto_876553 - BLOCK
      ?auto_876554 - BLOCK
    )
    :vars
    (
      ?auto_876555 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_876554 ?auto_876555 ) ( ON-TABLE ?auto_876540 ) ( ON ?auto_876541 ?auto_876540 ) ( ON ?auto_876542 ?auto_876541 ) ( ON ?auto_876543 ?auto_876542 ) ( not ( = ?auto_876540 ?auto_876541 ) ) ( not ( = ?auto_876540 ?auto_876542 ) ) ( not ( = ?auto_876540 ?auto_876543 ) ) ( not ( = ?auto_876540 ?auto_876544 ) ) ( not ( = ?auto_876540 ?auto_876545 ) ) ( not ( = ?auto_876540 ?auto_876546 ) ) ( not ( = ?auto_876540 ?auto_876547 ) ) ( not ( = ?auto_876540 ?auto_876548 ) ) ( not ( = ?auto_876540 ?auto_876549 ) ) ( not ( = ?auto_876540 ?auto_876550 ) ) ( not ( = ?auto_876540 ?auto_876551 ) ) ( not ( = ?auto_876540 ?auto_876552 ) ) ( not ( = ?auto_876540 ?auto_876553 ) ) ( not ( = ?auto_876540 ?auto_876554 ) ) ( not ( = ?auto_876540 ?auto_876555 ) ) ( not ( = ?auto_876541 ?auto_876542 ) ) ( not ( = ?auto_876541 ?auto_876543 ) ) ( not ( = ?auto_876541 ?auto_876544 ) ) ( not ( = ?auto_876541 ?auto_876545 ) ) ( not ( = ?auto_876541 ?auto_876546 ) ) ( not ( = ?auto_876541 ?auto_876547 ) ) ( not ( = ?auto_876541 ?auto_876548 ) ) ( not ( = ?auto_876541 ?auto_876549 ) ) ( not ( = ?auto_876541 ?auto_876550 ) ) ( not ( = ?auto_876541 ?auto_876551 ) ) ( not ( = ?auto_876541 ?auto_876552 ) ) ( not ( = ?auto_876541 ?auto_876553 ) ) ( not ( = ?auto_876541 ?auto_876554 ) ) ( not ( = ?auto_876541 ?auto_876555 ) ) ( not ( = ?auto_876542 ?auto_876543 ) ) ( not ( = ?auto_876542 ?auto_876544 ) ) ( not ( = ?auto_876542 ?auto_876545 ) ) ( not ( = ?auto_876542 ?auto_876546 ) ) ( not ( = ?auto_876542 ?auto_876547 ) ) ( not ( = ?auto_876542 ?auto_876548 ) ) ( not ( = ?auto_876542 ?auto_876549 ) ) ( not ( = ?auto_876542 ?auto_876550 ) ) ( not ( = ?auto_876542 ?auto_876551 ) ) ( not ( = ?auto_876542 ?auto_876552 ) ) ( not ( = ?auto_876542 ?auto_876553 ) ) ( not ( = ?auto_876542 ?auto_876554 ) ) ( not ( = ?auto_876542 ?auto_876555 ) ) ( not ( = ?auto_876543 ?auto_876544 ) ) ( not ( = ?auto_876543 ?auto_876545 ) ) ( not ( = ?auto_876543 ?auto_876546 ) ) ( not ( = ?auto_876543 ?auto_876547 ) ) ( not ( = ?auto_876543 ?auto_876548 ) ) ( not ( = ?auto_876543 ?auto_876549 ) ) ( not ( = ?auto_876543 ?auto_876550 ) ) ( not ( = ?auto_876543 ?auto_876551 ) ) ( not ( = ?auto_876543 ?auto_876552 ) ) ( not ( = ?auto_876543 ?auto_876553 ) ) ( not ( = ?auto_876543 ?auto_876554 ) ) ( not ( = ?auto_876543 ?auto_876555 ) ) ( not ( = ?auto_876544 ?auto_876545 ) ) ( not ( = ?auto_876544 ?auto_876546 ) ) ( not ( = ?auto_876544 ?auto_876547 ) ) ( not ( = ?auto_876544 ?auto_876548 ) ) ( not ( = ?auto_876544 ?auto_876549 ) ) ( not ( = ?auto_876544 ?auto_876550 ) ) ( not ( = ?auto_876544 ?auto_876551 ) ) ( not ( = ?auto_876544 ?auto_876552 ) ) ( not ( = ?auto_876544 ?auto_876553 ) ) ( not ( = ?auto_876544 ?auto_876554 ) ) ( not ( = ?auto_876544 ?auto_876555 ) ) ( not ( = ?auto_876545 ?auto_876546 ) ) ( not ( = ?auto_876545 ?auto_876547 ) ) ( not ( = ?auto_876545 ?auto_876548 ) ) ( not ( = ?auto_876545 ?auto_876549 ) ) ( not ( = ?auto_876545 ?auto_876550 ) ) ( not ( = ?auto_876545 ?auto_876551 ) ) ( not ( = ?auto_876545 ?auto_876552 ) ) ( not ( = ?auto_876545 ?auto_876553 ) ) ( not ( = ?auto_876545 ?auto_876554 ) ) ( not ( = ?auto_876545 ?auto_876555 ) ) ( not ( = ?auto_876546 ?auto_876547 ) ) ( not ( = ?auto_876546 ?auto_876548 ) ) ( not ( = ?auto_876546 ?auto_876549 ) ) ( not ( = ?auto_876546 ?auto_876550 ) ) ( not ( = ?auto_876546 ?auto_876551 ) ) ( not ( = ?auto_876546 ?auto_876552 ) ) ( not ( = ?auto_876546 ?auto_876553 ) ) ( not ( = ?auto_876546 ?auto_876554 ) ) ( not ( = ?auto_876546 ?auto_876555 ) ) ( not ( = ?auto_876547 ?auto_876548 ) ) ( not ( = ?auto_876547 ?auto_876549 ) ) ( not ( = ?auto_876547 ?auto_876550 ) ) ( not ( = ?auto_876547 ?auto_876551 ) ) ( not ( = ?auto_876547 ?auto_876552 ) ) ( not ( = ?auto_876547 ?auto_876553 ) ) ( not ( = ?auto_876547 ?auto_876554 ) ) ( not ( = ?auto_876547 ?auto_876555 ) ) ( not ( = ?auto_876548 ?auto_876549 ) ) ( not ( = ?auto_876548 ?auto_876550 ) ) ( not ( = ?auto_876548 ?auto_876551 ) ) ( not ( = ?auto_876548 ?auto_876552 ) ) ( not ( = ?auto_876548 ?auto_876553 ) ) ( not ( = ?auto_876548 ?auto_876554 ) ) ( not ( = ?auto_876548 ?auto_876555 ) ) ( not ( = ?auto_876549 ?auto_876550 ) ) ( not ( = ?auto_876549 ?auto_876551 ) ) ( not ( = ?auto_876549 ?auto_876552 ) ) ( not ( = ?auto_876549 ?auto_876553 ) ) ( not ( = ?auto_876549 ?auto_876554 ) ) ( not ( = ?auto_876549 ?auto_876555 ) ) ( not ( = ?auto_876550 ?auto_876551 ) ) ( not ( = ?auto_876550 ?auto_876552 ) ) ( not ( = ?auto_876550 ?auto_876553 ) ) ( not ( = ?auto_876550 ?auto_876554 ) ) ( not ( = ?auto_876550 ?auto_876555 ) ) ( not ( = ?auto_876551 ?auto_876552 ) ) ( not ( = ?auto_876551 ?auto_876553 ) ) ( not ( = ?auto_876551 ?auto_876554 ) ) ( not ( = ?auto_876551 ?auto_876555 ) ) ( not ( = ?auto_876552 ?auto_876553 ) ) ( not ( = ?auto_876552 ?auto_876554 ) ) ( not ( = ?auto_876552 ?auto_876555 ) ) ( not ( = ?auto_876553 ?auto_876554 ) ) ( not ( = ?auto_876553 ?auto_876555 ) ) ( not ( = ?auto_876554 ?auto_876555 ) ) ( ON ?auto_876553 ?auto_876554 ) ( ON ?auto_876552 ?auto_876553 ) ( ON ?auto_876551 ?auto_876552 ) ( ON ?auto_876550 ?auto_876551 ) ( ON ?auto_876549 ?auto_876550 ) ( ON ?auto_876548 ?auto_876549 ) ( ON ?auto_876547 ?auto_876548 ) ( ON ?auto_876546 ?auto_876547 ) ( ON ?auto_876545 ?auto_876546 ) ( CLEAR ?auto_876543 ) ( ON ?auto_876544 ?auto_876545 ) ( CLEAR ?auto_876544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_876540 ?auto_876541 ?auto_876542 ?auto_876543 ?auto_876544 )
      ( MAKE-15PILE ?auto_876540 ?auto_876541 ?auto_876542 ?auto_876543 ?auto_876544 ?auto_876545 ?auto_876546 ?auto_876547 ?auto_876548 ?auto_876549 ?auto_876550 ?auto_876551 ?auto_876552 ?auto_876553 ?auto_876554 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_876602 - BLOCK
      ?auto_876603 - BLOCK
      ?auto_876604 - BLOCK
      ?auto_876605 - BLOCK
      ?auto_876606 - BLOCK
      ?auto_876607 - BLOCK
      ?auto_876608 - BLOCK
      ?auto_876609 - BLOCK
      ?auto_876610 - BLOCK
      ?auto_876611 - BLOCK
      ?auto_876612 - BLOCK
      ?auto_876613 - BLOCK
      ?auto_876614 - BLOCK
      ?auto_876615 - BLOCK
      ?auto_876616 - BLOCK
    )
    :vars
    (
      ?auto_876617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_876616 ?auto_876617 ) ( ON-TABLE ?auto_876602 ) ( ON ?auto_876603 ?auto_876602 ) ( ON ?auto_876604 ?auto_876603 ) ( not ( = ?auto_876602 ?auto_876603 ) ) ( not ( = ?auto_876602 ?auto_876604 ) ) ( not ( = ?auto_876602 ?auto_876605 ) ) ( not ( = ?auto_876602 ?auto_876606 ) ) ( not ( = ?auto_876602 ?auto_876607 ) ) ( not ( = ?auto_876602 ?auto_876608 ) ) ( not ( = ?auto_876602 ?auto_876609 ) ) ( not ( = ?auto_876602 ?auto_876610 ) ) ( not ( = ?auto_876602 ?auto_876611 ) ) ( not ( = ?auto_876602 ?auto_876612 ) ) ( not ( = ?auto_876602 ?auto_876613 ) ) ( not ( = ?auto_876602 ?auto_876614 ) ) ( not ( = ?auto_876602 ?auto_876615 ) ) ( not ( = ?auto_876602 ?auto_876616 ) ) ( not ( = ?auto_876602 ?auto_876617 ) ) ( not ( = ?auto_876603 ?auto_876604 ) ) ( not ( = ?auto_876603 ?auto_876605 ) ) ( not ( = ?auto_876603 ?auto_876606 ) ) ( not ( = ?auto_876603 ?auto_876607 ) ) ( not ( = ?auto_876603 ?auto_876608 ) ) ( not ( = ?auto_876603 ?auto_876609 ) ) ( not ( = ?auto_876603 ?auto_876610 ) ) ( not ( = ?auto_876603 ?auto_876611 ) ) ( not ( = ?auto_876603 ?auto_876612 ) ) ( not ( = ?auto_876603 ?auto_876613 ) ) ( not ( = ?auto_876603 ?auto_876614 ) ) ( not ( = ?auto_876603 ?auto_876615 ) ) ( not ( = ?auto_876603 ?auto_876616 ) ) ( not ( = ?auto_876603 ?auto_876617 ) ) ( not ( = ?auto_876604 ?auto_876605 ) ) ( not ( = ?auto_876604 ?auto_876606 ) ) ( not ( = ?auto_876604 ?auto_876607 ) ) ( not ( = ?auto_876604 ?auto_876608 ) ) ( not ( = ?auto_876604 ?auto_876609 ) ) ( not ( = ?auto_876604 ?auto_876610 ) ) ( not ( = ?auto_876604 ?auto_876611 ) ) ( not ( = ?auto_876604 ?auto_876612 ) ) ( not ( = ?auto_876604 ?auto_876613 ) ) ( not ( = ?auto_876604 ?auto_876614 ) ) ( not ( = ?auto_876604 ?auto_876615 ) ) ( not ( = ?auto_876604 ?auto_876616 ) ) ( not ( = ?auto_876604 ?auto_876617 ) ) ( not ( = ?auto_876605 ?auto_876606 ) ) ( not ( = ?auto_876605 ?auto_876607 ) ) ( not ( = ?auto_876605 ?auto_876608 ) ) ( not ( = ?auto_876605 ?auto_876609 ) ) ( not ( = ?auto_876605 ?auto_876610 ) ) ( not ( = ?auto_876605 ?auto_876611 ) ) ( not ( = ?auto_876605 ?auto_876612 ) ) ( not ( = ?auto_876605 ?auto_876613 ) ) ( not ( = ?auto_876605 ?auto_876614 ) ) ( not ( = ?auto_876605 ?auto_876615 ) ) ( not ( = ?auto_876605 ?auto_876616 ) ) ( not ( = ?auto_876605 ?auto_876617 ) ) ( not ( = ?auto_876606 ?auto_876607 ) ) ( not ( = ?auto_876606 ?auto_876608 ) ) ( not ( = ?auto_876606 ?auto_876609 ) ) ( not ( = ?auto_876606 ?auto_876610 ) ) ( not ( = ?auto_876606 ?auto_876611 ) ) ( not ( = ?auto_876606 ?auto_876612 ) ) ( not ( = ?auto_876606 ?auto_876613 ) ) ( not ( = ?auto_876606 ?auto_876614 ) ) ( not ( = ?auto_876606 ?auto_876615 ) ) ( not ( = ?auto_876606 ?auto_876616 ) ) ( not ( = ?auto_876606 ?auto_876617 ) ) ( not ( = ?auto_876607 ?auto_876608 ) ) ( not ( = ?auto_876607 ?auto_876609 ) ) ( not ( = ?auto_876607 ?auto_876610 ) ) ( not ( = ?auto_876607 ?auto_876611 ) ) ( not ( = ?auto_876607 ?auto_876612 ) ) ( not ( = ?auto_876607 ?auto_876613 ) ) ( not ( = ?auto_876607 ?auto_876614 ) ) ( not ( = ?auto_876607 ?auto_876615 ) ) ( not ( = ?auto_876607 ?auto_876616 ) ) ( not ( = ?auto_876607 ?auto_876617 ) ) ( not ( = ?auto_876608 ?auto_876609 ) ) ( not ( = ?auto_876608 ?auto_876610 ) ) ( not ( = ?auto_876608 ?auto_876611 ) ) ( not ( = ?auto_876608 ?auto_876612 ) ) ( not ( = ?auto_876608 ?auto_876613 ) ) ( not ( = ?auto_876608 ?auto_876614 ) ) ( not ( = ?auto_876608 ?auto_876615 ) ) ( not ( = ?auto_876608 ?auto_876616 ) ) ( not ( = ?auto_876608 ?auto_876617 ) ) ( not ( = ?auto_876609 ?auto_876610 ) ) ( not ( = ?auto_876609 ?auto_876611 ) ) ( not ( = ?auto_876609 ?auto_876612 ) ) ( not ( = ?auto_876609 ?auto_876613 ) ) ( not ( = ?auto_876609 ?auto_876614 ) ) ( not ( = ?auto_876609 ?auto_876615 ) ) ( not ( = ?auto_876609 ?auto_876616 ) ) ( not ( = ?auto_876609 ?auto_876617 ) ) ( not ( = ?auto_876610 ?auto_876611 ) ) ( not ( = ?auto_876610 ?auto_876612 ) ) ( not ( = ?auto_876610 ?auto_876613 ) ) ( not ( = ?auto_876610 ?auto_876614 ) ) ( not ( = ?auto_876610 ?auto_876615 ) ) ( not ( = ?auto_876610 ?auto_876616 ) ) ( not ( = ?auto_876610 ?auto_876617 ) ) ( not ( = ?auto_876611 ?auto_876612 ) ) ( not ( = ?auto_876611 ?auto_876613 ) ) ( not ( = ?auto_876611 ?auto_876614 ) ) ( not ( = ?auto_876611 ?auto_876615 ) ) ( not ( = ?auto_876611 ?auto_876616 ) ) ( not ( = ?auto_876611 ?auto_876617 ) ) ( not ( = ?auto_876612 ?auto_876613 ) ) ( not ( = ?auto_876612 ?auto_876614 ) ) ( not ( = ?auto_876612 ?auto_876615 ) ) ( not ( = ?auto_876612 ?auto_876616 ) ) ( not ( = ?auto_876612 ?auto_876617 ) ) ( not ( = ?auto_876613 ?auto_876614 ) ) ( not ( = ?auto_876613 ?auto_876615 ) ) ( not ( = ?auto_876613 ?auto_876616 ) ) ( not ( = ?auto_876613 ?auto_876617 ) ) ( not ( = ?auto_876614 ?auto_876615 ) ) ( not ( = ?auto_876614 ?auto_876616 ) ) ( not ( = ?auto_876614 ?auto_876617 ) ) ( not ( = ?auto_876615 ?auto_876616 ) ) ( not ( = ?auto_876615 ?auto_876617 ) ) ( not ( = ?auto_876616 ?auto_876617 ) ) ( ON ?auto_876615 ?auto_876616 ) ( ON ?auto_876614 ?auto_876615 ) ( ON ?auto_876613 ?auto_876614 ) ( ON ?auto_876612 ?auto_876613 ) ( ON ?auto_876611 ?auto_876612 ) ( ON ?auto_876610 ?auto_876611 ) ( ON ?auto_876609 ?auto_876610 ) ( ON ?auto_876608 ?auto_876609 ) ( ON ?auto_876607 ?auto_876608 ) ( ON ?auto_876606 ?auto_876607 ) ( CLEAR ?auto_876604 ) ( ON ?auto_876605 ?auto_876606 ) ( CLEAR ?auto_876605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_876602 ?auto_876603 ?auto_876604 ?auto_876605 )
      ( MAKE-15PILE ?auto_876602 ?auto_876603 ?auto_876604 ?auto_876605 ?auto_876606 ?auto_876607 ?auto_876608 ?auto_876609 ?auto_876610 ?auto_876611 ?auto_876612 ?auto_876613 ?auto_876614 ?auto_876615 ?auto_876616 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_876664 - BLOCK
      ?auto_876665 - BLOCK
      ?auto_876666 - BLOCK
      ?auto_876667 - BLOCK
      ?auto_876668 - BLOCK
      ?auto_876669 - BLOCK
      ?auto_876670 - BLOCK
      ?auto_876671 - BLOCK
      ?auto_876672 - BLOCK
      ?auto_876673 - BLOCK
      ?auto_876674 - BLOCK
      ?auto_876675 - BLOCK
      ?auto_876676 - BLOCK
      ?auto_876677 - BLOCK
      ?auto_876678 - BLOCK
    )
    :vars
    (
      ?auto_876679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_876678 ?auto_876679 ) ( ON-TABLE ?auto_876664 ) ( ON ?auto_876665 ?auto_876664 ) ( not ( = ?auto_876664 ?auto_876665 ) ) ( not ( = ?auto_876664 ?auto_876666 ) ) ( not ( = ?auto_876664 ?auto_876667 ) ) ( not ( = ?auto_876664 ?auto_876668 ) ) ( not ( = ?auto_876664 ?auto_876669 ) ) ( not ( = ?auto_876664 ?auto_876670 ) ) ( not ( = ?auto_876664 ?auto_876671 ) ) ( not ( = ?auto_876664 ?auto_876672 ) ) ( not ( = ?auto_876664 ?auto_876673 ) ) ( not ( = ?auto_876664 ?auto_876674 ) ) ( not ( = ?auto_876664 ?auto_876675 ) ) ( not ( = ?auto_876664 ?auto_876676 ) ) ( not ( = ?auto_876664 ?auto_876677 ) ) ( not ( = ?auto_876664 ?auto_876678 ) ) ( not ( = ?auto_876664 ?auto_876679 ) ) ( not ( = ?auto_876665 ?auto_876666 ) ) ( not ( = ?auto_876665 ?auto_876667 ) ) ( not ( = ?auto_876665 ?auto_876668 ) ) ( not ( = ?auto_876665 ?auto_876669 ) ) ( not ( = ?auto_876665 ?auto_876670 ) ) ( not ( = ?auto_876665 ?auto_876671 ) ) ( not ( = ?auto_876665 ?auto_876672 ) ) ( not ( = ?auto_876665 ?auto_876673 ) ) ( not ( = ?auto_876665 ?auto_876674 ) ) ( not ( = ?auto_876665 ?auto_876675 ) ) ( not ( = ?auto_876665 ?auto_876676 ) ) ( not ( = ?auto_876665 ?auto_876677 ) ) ( not ( = ?auto_876665 ?auto_876678 ) ) ( not ( = ?auto_876665 ?auto_876679 ) ) ( not ( = ?auto_876666 ?auto_876667 ) ) ( not ( = ?auto_876666 ?auto_876668 ) ) ( not ( = ?auto_876666 ?auto_876669 ) ) ( not ( = ?auto_876666 ?auto_876670 ) ) ( not ( = ?auto_876666 ?auto_876671 ) ) ( not ( = ?auto_876666 ?auto_876672 ) ) ( not ( = ?auto_876666 ?auto_876673 ) ) ( not ( = ?auto_876666 ?auto_876674 ) ) ( not ( = ?auto_876666 ?auto_876675 ) ) ( not ( = ?auto_876666 ?auto_876676 ) ) ( not ( = ?auto_876666 ?auto_876677 ) ) ( not ( = ?auto_876666 ?auto_876678 ) ) ( not ( = ?auto_876666 ?auto_876679 ) ) ( not ( = ?auto_876667 ?auto_876668 ) ) ( not ( = ?auto_876667 ?auto_876669 ) ) ( not ( = ?auto_876667 ?auto_876670 ) ) ( not ( = ?auto_876667 ?auto_876671 ) ) ( not ( = ?auto_876667 ?auto_876672 ) ) ( not ( = ?auto_876667 ?auto_876673 ) ) ( not ( = ?auto_876667 ?auto_876674 ) ) ( not ( = ?auto_876667 ?auto_876675 ) ) ( not ( = ?auto_876667 ?auto_876676 ) ) ( not ( = ?auto_876667 ?auto_876677 ) ) ( not ( = ?auto_876667 ?auto_876678 ) ) ( not ( = ?auto_876667 ?auto_876679 ) ) ( not ( = ?auto_876668 ?auto_876669 ) ) ( not ( = ?auto_876668 ?auto_876670 ) ) ( not ( = ?auto_876668 ?auto_876671 ) ) ( not ( = ?auto_876668 ?auto_876672 ) ) ( not ( = ?auto_876668 ?auto_876673 ) ) ( not ( = ?auto_876668 ?auto_876674 ) ) ( not ( = ?auto_876668 ?auto_876675 ) ) ( not ( = ?auto_876668 ?auto_876676 ) ) ( not ( = ?auto_876668 ?auto_876677 ) ) ( not ( = ?auto_876668 ?auto_876678 ) ) ( not ( = ?auto_876668 ?auto_876679 ) ) ( not ( = ?auto_876669 ?auto_876670 ) ) ( not ( = ?auto_876669 ?auto_876671 ) ) ( not ( = ?auto_876669 ?auto_876672 ) ) ( not ( = ?auto_876669 ?auto_876673 ) ) ( not ( = ?auto_876669 ?auto_876674 ) ) ( not ( = ?auto_876669 ?auto_876675 ) ) ( not ( = ?auto_876669 ?auto_876676 ) ) ( not ( = ?auto_876669 ?auto_876677 ) ) ( not ( = ?auto_876669 ?auto_876678 ) ) ( not ( = ?auto_876669 ?auto_876679 ) ) ( not ( = ?auto_876670 ?auto_876671 ) ) ( not ( = ?auto_876670 ?auto_876672 ) ) ( not ( = ?auto_876670 ?auto_876673 ) ) ( not ( = ?auto_876670 ?auto_876674 ) ) ( not ( = ?auto_876670 ?auto_876675 ) ) ( not ( = ?auto_876670 ?auto_876676 ) ) ( not ( = ?auto_876670 ?auto_876677 ) ) ( not ( = ?auto_876670 ?auto_876678 ) ) ( not ( = ?auto_876670 ?auto_876679 ) ) ( not ( = ?auto_876671 ?auto_876672 ) ) ( not ( = ?auto_876671 ?auto_876673 ) ) ( not ( = ?auto_876671 ?auto_876674 ) ) ( not ( = ?auto_876671 ?auto_876675 ) ) ( not ( = ?auto_876671 ?auto_876676 ) ) ( not ( = ?auto_876671 ?auto_876677 ) ) ( not ( = ?auto_876671 ?auto_876678 ) ) ( not ( = ?auto_876671 ?auto_876679 ) ) ( not ( = ?auto_876672 ?auto_876673 ) ) ( not ( = ?auto_876672 ?auto_876674 ) ) ( not ( = ?auto_876672 ?auto_876675 ) ) ( not ( = ?auto_876672 ?auto_876676 ) ) ( not ( = ?auto_876672 ?auto_876677 ) ) ( not ( = ?auto_876672 ?auto_876678 ) ) ( not ( = ?auto_876672 ?auto_876679 ) ) ( not ( = ?auto_876673 ?auto_876674 ) ) ( not ( = ?auto_876673 ?auto_876675 ) ) ( not ( = ?auto_876673 ?auto_876676 ) ) ( not ( = ?auto_876673 ?auto_876677 ) ) ( not ( = ?auto_876673 ?auto_876678 ) ) ( not ( = ?auto_876673 ?auto_876679 ) ) ( not ( = ?auto_876674 ?auto_876675 ) ) ( not ( = ?auto_876674 ?auto_876676 ) ) ( not ( = ?auto_876674 ?auto_876677 ) ) ( not ( = ?auto_876674 ?auto_876678 ) ) ( not ( = ?auto_876674 ?auto_876679 ) ) ( not ( = ?auto_876675 ?auto_876676 ) ) ( not ( = ?auto_876675 ?auto_876677 ) ) ( not ( = ?auto_876675 ?auto_876678 ) ) ( not ( = ?auto_876675 ?auto_876679 ) ) ( not ( = ?auto_876676 ?auto_876677 ) ) ( not ( = ?auto_876676 ?auto_876678 ) ) ( not ( = ?auto_876676 ?auto_876679 ) ) ( not ( = ?auto_876677 ?auto_876678 ) ) ( not ( = ?auto_876677 ?auto_876679 ) ) ( not ( = ?auto_876678 ?auto_876679 ) ) ( ON ?auto_876677 ?auto_876678 ) ( ON ?auto_876676 ?auto_876677 ) ( ON ?auto_876675 ?auto_876676 ) ( ON ?auto_876674 ?auto_876675 ) ( ON ?auto_876673 ?auto_876674 ) ( ON ?auto_876672 ?auto_876673 ) ( ON ?auto_876671 ?auto_876672 ) ( ON ?auto_876670 ?auto_876671 ) ( ON ?auto_876669 ?auto_876670 ) ( ON ?auto_876668 ?auto_876669 ) ( ON ?auto_876667 ?auto_876668 ) ( CLEAR ?auto_876665 ) ( ON ?auto_876666 ?auto_876667 ) ( CLEAR ?auto_876666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_876664 ?auto_876665 ?auto_876666 )
      ( MAKE-15PILE ?auto_876664 ?auto_876665 ?auto_876666 ?auto_876667 ?auto_876668 ?auto_876669 ?auto_876670 ?auto_876671 ?auto_876672 ?auto_876673 ?auto_876674 ?auto_876675 ?auto_876676 ?auto_876677 ?auto_876678 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_876726 - BLOCK
      ?auto_876727 - BLOCK
      ?auto_876728 - BLOCK
      ?auto_876729 - BLOCK
      ?auto_876730 - BLOCK
      ?auto_876731 - BLOCK
      ?auto_876732 - BLOCK
      ?auto_876733 - BLOCK
      ?auto_876734 - BLOCK
      ?auto_876735 - BLOCK
      ?auto_876736 - BLOCK
      ?auto_876737 - BLOCK
      ?auto_876738 - BLOCK
      ?auto_876739 - BLOCK
      ?auto_876740 - BLOCK
    )
    :vars
    (
      ?auto_876741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_876740 ?auto_876741 ) ( ON-TABLE ?auto_876726 ) ( not ( = ?auto_876726 ?auto_876727 ) ) ( not ( = ?auto_876726 ?auto_876728 ) ) ( not ( = ?auto_876726 ?auto_876729 ) ) ( not ( = ?auto_876726 ?auto_876730 ) ) ( not ( = ?auto_876726 ?auto_876731 ) ) ( not ( = ?auto_876726 ?auto_876732 ) ) ( not ( = ?auto_876726 ?auto_876733 ) ) ( not ( = ?auto_876726 ?auto_876734 ) ) ( not ( = ?auto_876726 ?auto_876735 ) ) ( not ( = ?auto_876726 ?auto_876736 ) ) ( not ( = ?auto_876726 ?auto_876737 ) ) ( not ( = ?auto_876726 ?auto_876738 ) ) ( not ( = ?auto_876726 ?auto_876739 ) ) ( not ( = ?auto_876726 ?auto_876740 ) ) ( not ( = ?auto_876726 ?auto_876741 ) ) ( not ( = ?auto_876727 ?auto_876728 ) ) ( not ( = ?auto_876727 ?auto_876729 ) ) ( not ( = ?auto_876727 ?auto_876730 ) ) ( not ( = ?auto_876727 ?auto_876731 ) ) ( not ( = ?auto_876727 ?auto_876732 ) ) ( not ( = ?auto_876727 ?auto_876733 ) ) ( not ( = ?auto_876727 ?auto_876734 ) ) ( not ( = ?auto_876727 ?auto_876735 ) ) ( not ( = ?auto_876727 ?auto_876736 ) ) ( not ( = ?auto_876727 ?auto_876737 ) ) ( not ( = ?auto_876727 ?auto_876738 ) ) ( not ( = ?auto_876727 ?auto_876739 ) ) ( not ( = ?auto_876727 ?auto_876740 ) ) ( not ( = ?auto_876727 ?auto_876741 ) ) ( not ( = ?auto_876728 ?auto_876729 ) ) ( not ( = ?auto_876728 ?auto_876730 ) ) ( not ( = ?auto_876728 ?auto_876731 ) ) ( not ( = ?auto_876728 ?auto_876732 ) ) ( not ( = ?auto_876728 ?auto_876733 ) ) ( not ( = ?auto_876728 ?auto_876734 ) ) ( not ( = ?auto_876728 ?auto_876735 ) ) ( not ( = ?auto_876728 ?auto_876736 ) ) ( not ( = ?auto_876728 ?auto_876737 ) ) ( not ( = ?auto_876728 ?auto_876738 ) ) ( not ( = ?auto_876728 ?auto_876739 ) ) ( not ( = ?auto_876728 ?auto_876740 ) ) ( not ( = ?auto_876728 ?auto_876741 ) ) ( not ( = ?auto_876729 ?auto_876730 ) ) ( not ( = ?auto_876729 ?auto_876731 ) ) ( not ( = ?auto_876729 ?auto_876732 ) ) ( not ( = ?auto_876729 ?auto_876733 ) ) ( not ( = ?auto_876729 ?auto_876734 ) ) ( not ( = ?auto_876729 ?auto_876735 ) ) ( not ( = ?auto_876729 ?auto_876736 ) ) ( not ( = ?auto_876729 ?auto_876737 ) ) ( not ( = ?auto_876729 ?auto_876738 ) ) ( not ( = ?auto_876729 ?auto_876739 ) ) ( not ( = ?auto_876729 ?auto_876740 ) ) ( not ( = ?auto_876729 ?auto_876741 ) ) ( not ( = ?auto_876730 ?auto_876731 ) ) ( not ( = ?auto_876730 ?auto_876732 ) ) ( not ( = ?auto_876730 ?auto_876733 ) ) ( not ( = ?auto_876730 ?auto_876734 ) ) ( not ( = ?auto_876730 ?auto_876735 ) ) ( not ( = ?auto_876730 ?auto_876736 ) ) ( not ( = ?auto_876730 ?auto_876737 ) ) ( not ( = ?auto_876730 ?auto_876738 ) ) ( not ( = ?auto_876730 ?auto_876739 ) ) ( not ( = ?auto_876730 ?auto_876740 ) ) ( not ( = ?auto_876730 ?auto_876741 ) ) ( not ( = ?auto_876731 ?auto_876732 ) ) ( not ( = ?auto_876731 ?auto_876733 ) ) ( not ( = ?auto_876731 ?auto_876734 ) ) ( not ( = ?auto_876731 ?auto_876735 ) ) ( not ( = ?auto_876731 ?auto_876736 ) ) ( not ( = ?auto_876731 ?auto_876737 ) ) ( not ( = ?auto_876731 ?auto_876738 ) ) ( not ( = ?auto_876731 ?auto_876739 ) ) ( not ( = ?auto_876731 ?auto_876740 ) ) ( not ( = ?auto_876731 ?auto_876741 ) ) ( not ( = ?auto_876732 ?auto_876733 ) ) ( not ( = ?auto_876732 ?auto_876734 ) ) ( not ( = ?auto_876732 ?auto_876735 ) ) ( not ( = ?auto_876732 ?auto_876736 ) ) ( not ( = ?auto_876732 ?auto_876737 ) ) ( not ( = ?auto_876732 ?auto_876738 ) ) ( not ( = ?auto_876732 ?auto_876739 ) ) ( not ( = ?auto_876732 ?auto_876740 ) ) ( not ( = ?auto_876732 ?auto_876741 ) ) ( not ( = ?auto_876733 ?auto_876734 ) ) ( not ( = ?auto_876733 ?auto_876735 ) ) ( not ( = ?auto_876733 ?auto_876736 ) ) ( not ( = ?auto_876733 ?auto_876737 ) ) ( not ( = ?auto_876733 ?auto_876738 ) ) ( not ( = ?auto_876733 ?auto_876739 ) ) ( not ( = ?auto_876733 ?auto_876740 ) ) ( not ( = ?auto_876733 ?auto_876741 ) ) ( not ( = ?auto_876734 ?auto_876735 ) ) ( not ( = ?auto_876734 ?auto_876736 ) ) ( not ( = ?auto_876734 ?auto_876737 ) ) ( not ( = ?auto_876734 ?auto_876738 ) ) ( not ( = ?auto_876734 ?auto_876739 ) ) ( not ( = ?auto_876734 ?auto_876740 ) ) ( not ( = ?auto_876734 ?auto_876741 ) ) ( not ( = ?auto_876735 ?auto_876736 ) ) ( not ( = ?auto_876735 ?auto_876737 ) ) ( not ( = ?auto_876735 ?auto_876738 ) ) ( not ( = ?auto_876735 ?auto_876739 ) ) ( not ( = ?auto_876735 ?auto_876740 ) ) ( not ( = ?auto_876735 ?auto_876741 ) ) ( not ( = ?auto_876736 ?auto_876737 ) ) ( not ( = ?auto_876736 ?auto_876738 ) ) ( not ( = ?auto_876736 ?auto_876739 ) ) ( not ( = ?auto_876736 ?auto_876740 ) ) ( not ( = ?auto_876736 ?auto_876741 ) ) ( not ( = ?auto_876737 ?auto_876738 ) ) ( not ( = ?auto_876737 ?auto_876739 ) ) ( not ( = ?auto_876737 ?auto_876740 ) ) ( not ( = ?auto_876737 ?auto_876741 ) ) ( not ( = ?auto_876738 ?auto_876739 ) ) ( not ( = ?auto_876738 ?auto_876740 ) ) ( not ( = ?auto_876738 ?auto_876741 ) ) ( not ( = ?auto_876739 ?auto_876740 ) ) ( not ( = ?auto_876739 ?auto_876741 ) ) ( not ( = ?auto_876740 ?auto_876741 ) ) ( ON ?auto_876739 ?auto_876740 ) ( ON ?auto_876738 ?auto_876739 ) ( ON ?auto_876737 ?auto_876738 ) ( ON ?auto_876736 ?auto_876737 ) ( ON ?auto_876735 ?auto_876736 ) ( ON ?auto_876734 ?auto_876735 ) ( ON ?auto_876733 ?auto_876734 ) ( ON ?auto_876732 ?auto_876733 ) ( ON ?auto_876731 ?auto_876732 ) ( ON ?auto_876730 ?auto_876731 ) ( ON ?auto_876729 ?auto_876730 ) ( ON ?auto_876728 ?auto_876729 ) ( CLEAR ?auto_876726 ) ( ON ?auto_876727 ?auto_876728 ) ( CLEAR ?auto_876727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_876726 ?auto_876727 )
      ( MAKE-15PILE ?auto_876726 ?auto_876727 ?auto_876728 ?auto_876729 ?auto_876730 ?auto_876731 ?auto_876732 ?auto_876733 ?auto_876734 ?auto_876735 ?auto_876736 ?auto_876737 ?auto_876738 ?auto_876739 ?auto_876740 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_876788 - BLOCK
      ?auto_876789 - BLOCK
      ?auto_876790 - BLOCK
      ?auto_876791 - BLOCK
      ?auto_876792 - BLOCK
      ?auto_876793 - BLOCK
      ?auto_876794 - BLOCK
      ?auto_876795 - BLOCK
      ?auto_876796 - BLOCK
      ?auto_876797 - BLOCK
      ?auto_876798 - BLOCK
      ?auto_876799 - BLOCK
      ?auto_876800 - BLOCK
      ?auto_876801 - BLOCK
      ?auto_876802 - BLOCK
    )
    :vars
    (
      ?auto_876803 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_876802 ?auto_876803 ) ( not ( = ?auto_876788 ?auto_876789 ) ) ( not ( = ?auto_876788 ?auto_876790 ) ) ( not ( = ?auto_876788 ?auto_876791 ) ) ( not ( = ?auto_876788 ?auto_876792 ) ) ( not ( = ?auto_876788 ?auto_876793 ) ) ( not ( = ?auto_876788 ?auto_876794 ) ) ( not ( = ?auto_876788 ?auto_876795 ) ) ( not ( = ?auto_876788 ?auto_876796 ) ) ( not ( = ?auto_876788 ?auto_876797 ) ) ( not ( = ?auto_876788 ?auto_876798 ) ) ( not ( = ?auto_876788 ?auto_876799 ) ) ( not ( = ?auto_876788 ?auto_876800 ) ) ( not ( = ?auto_876788 ?auto_876801 ) ) ( not ( = ?auto_876788 ?auto_876802 ) ) ( not ( = ?auto_876788 ?auto_876803 ) ) ( not ( = ?auto_876789 ?auto_876790 ) ) ( not ( = ?auto_876789 ?auto_876791 ) ) ( not ( = ?auto_876789 ?auto_876792 ) ) ( not ( = ?auto_876789 ?auto_876793 ) ) ( not ( = ?auto_876789 ?auto_876794 ) ) ( not ( = ?auto_876789 ?auto_876795 ) ) ( not ( = ?auto_876789 ?auto_876796 ) ) ( not ( = ?auto_876789 ?auto_876797 ) ) ( not ( = ?auto_876789 ?auto_876798 ) ) ( not ( = ?auto_876789 ?auto_876799 ) ) ( not ( = ?auto_876789 ?auto_876800 ) ) ( not ( = ?auto_876789 ?auto_876801 ) ) ( not ( = ?auto_876789 ?auto_876802 ) ) ( not ( = ?auto_876789 ?auto_876803 ) ) ( not ( = ?auto_876790 ?auto_876791 ) ) ( not ( = ?auto_876790 ?auto_876792 ) ) ( not ( = ?auto_876790 ?auto_876793 ) ) ( not ( = ?auto_876790 ?auto_876794 ) ) ( not ( = ?auto_876790 ?auto_876795 ) ) ( not ( = ?auto_876790 ?auto_876796 ) ) ( not ( = ?auto_876790 ?auto_876797 ) ) ( not ( = ?auto_876790 ?auto_876798 ) ) ( not ( = ?auto_876790 ?auto_876799 ) ) ( not ( = ?auto_876790 ?auto_876800 ) ) ( not ( = ?auto_876790 ?auto_876801 ) ) ( not ( = ?auto_876790 ?auto_876802 ) ) ( not ( = ?auto_876790 ?auto_876803 ) ) ( not ( = ?auto_876791 ?auto_876792 ) ) ( not ( = ?auto_876791 ?auto_876793 ) ) ( not ( = ?auto_876791 ?auto_876794 ) ) ( not ( = ?auto_876791 ?auto_876795 ) ) ( not ( = ?auto_876791 ?auto_876796 ) ) ( not ( = ?auto_876791 ?auto_876797 ) ) ( not ( = ?auto_876791 ?auto_876798 ) ) ( not ( = ?auto_876791 ?auto_876799 ) ) ( not ( = ?auto_876791 ?auto_876800 ) ) ( not ( = ?auto_876791 ?auto_876801 ) ) ( not ( = ?auto_876791 ?auto_876802 ) ) ( not ( = ?auto_876791 ?auto_876803 ) ) ( not ( = ?auto_876792 ?auto_876793 ) ) ( not ( = ?auto_876792 ?auto_876794 ) ) ( not ( = ?auto_876792 ?auto_876795 ) ) ( not ( = ?auto_876792 ?auto_876796 ) ) ( not ( = ?auto_876792 ?auto_876797 ) ) ( not ( = ?auto_876792 ?auto_876798 ) ) ( not ( = ?auto_876792 ?auto_876799 ) ) ( not ( = ?auto_876792 ?auto_876800 ) ) ( not ( = ?auto_876792 ?auto_876801 ) ) ( not ( = ?auto_876792 ?auto_876802 ) ) ( not ( = ?auto_876792 ?auto_876803 ) ) ( not ( = ?auto_876793 ?auto_876794 ) ) ( not ( = ?auto_876793 ?auto_876795 ) ) ( not ( = ?auto_876793 ?auto_876796 ) ) ( not ( = ?auto_876793 ?auto_876797 ) ) ( not ( = ?auto_876793 ?auto_876798 ) ) ( not ( = ?auto_876793 ?auto_876799 ) ) ( not ( = ?auto_876793 ?auto_876800 ) ) ( not ( = ?auto_876793 ?auto_876801 ) ) ( not ( = ?auto_876793 ?auto_876802 ) ) ( not ( = ?auto_876793 ?auto_876803 ) ) ( not ( = ?auto_876794 ?auto_876795 ) ) ( not ( = ?auto_876794 ?auto_876796 ) ) ( not ( = ?auto_876794 ?auto_876797 ) ) ( not ( = ?auto_876794 ?auto_876798 ) ) ( not ( = ?auto_876794 ?auto_876799 ) ) ( not ( = ?auto_876794 ?auto_876800 ) ) ( not ( = ?auto_876794 ?auto_876801 ) ) ( not ( = ?auto_876794 ?auto_876802 ) ) ( not ( = ?auto_876794 ?auto_876803 ) ) ( not ( = ?auto_876795 ?auto_876796 ) ) ( not ( = ?auto_876795 ?auto_876797 ) ) ( not ( = ?auto_876795 ?auto_876798 ) ) ( not ( = ?auto_876795 ?auto_876799 ) ) ( not ( = ?auto_876795 ?auto_876800 ) ) ( not ( = ?auto_876795 ?auto_876801 ) ) ( not ( = ?auto_876795 ?auto_876802 ) ) ( not ( = ?auto_876795 ?auto_876803 ) ) ( not ( = ?auto_876796 ?auto_876797 ) ) ( not ( = ?auto_876796 ?auto_876798 ) ) ( not ( = ?auto_876796 ?auto_876799 ) ) ( not ( = ?auto_876796 ?auto_876800 ) ) ( not ( = ?auto_876796 ?auto_876801 ) ) ( not ( = ?auto_876796 ?auto_876802 ) ) ( not ( = ?auto_876796 ?auto_876803 ) ) ( not ( = ?auto_876797 ?auto_876798 ) ) ( not ( = ?auto_876797 ?auto_876799 ) ) ( not ( = ?auto_876797 ?auto_876800 ) ) ( not ( = ?auto_876797 ?auto_876801 ) ) ( not ( = ?auto_876797 ?auto_876802 ) ) ( not ( = ?auto_876797 ?auto_876803 ) ) ( not ( = ?auto_876798 ?auto_876799 ) ) ( not ( = ?auto_876798 ?auto_876800 ) ) ( not ( = ?auto_876798 ?auto_876801 ) ) ( not ( = ?auto_876798 ?auto_876802 ) ) ( not ( = ?auto_876798 ?auto_876803 ) ) ( not ( = ?auto_876799 ?auto_876800 ) ) ( not ( = ?auto_876799 ?auto_876801 ) ) ( not ( = ?auto_876799 ?auto_876802 ) ) ( not ( = ?auto_876799 ?auto_876803 ) ) ( not ( = ?auto_876800 ?auto_876801 ) ) ( not ( = ?auto_876800 ?auto_876802 ) ) ( not ( = ?auto_876800 ?auto_876803 ) ) ( not ( = ?auto_876801 ?auto_876802 ) ) ( not ( = ?auto_876801 ?auto_876803 ) ) ( not ( = ?auto_876802 ?auto_876803 ) ) ( ON ?auto_876801 ?auto_876802 ) ( ON ?auto_876800 ?auto_876801 ) ( ON ?auto_876799 ?auto_876800 ) ( ON ?auto_876798 ?auto_876799 ) ( ON ?auto_876797 ?auto_876798 ) ( ON ?auto_876796 ?auto_876797 ) ( ON ?auto_876795 ?auto_876796 ) ( ON ?auto_876794 ?auto_876795 ) ( ON ?auto_876793 ?auto_876794 ) ( ON ?auto_876792 ?auto_876793 ) ( ON ?auto_876791 ?auto_876792 ) ( ON ?auto_876790 ?auto_876791 ) ( ON ?auto_876789 ?auto_876790 ) ( ON ?auto_876788 ?auto_876789 ) ( CLEAR ?auto_876788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_876788 )
      ( MAKE-15PILE ?auto_876788 ?auto_876789 ?auto_876790 ?auto_876791 ?auto_876792 ?auto_876793 ?auto_876794 ?auto_876795 ?auto_876796 ?auto_876797 ?auto_876798 ?auto_876799 ?auto_876800 ?auto_876801 ?auto_876802 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_876851 - BLOCK
      ?auto_876852 - BLOCK
      ?auto_876853 - BLOCK
      ?auto_876854 - BLOCK
      ?auto_876855 - BLOCK
      ?auto_876856 - BLOCK
      ?auto_876857 - BLOCK
      ?auto_876858 - BLOCK
      ?auto_876859 - BLOCK
      ?auto_876860 - BLOCK
      ?auto_876861 - BLOCK
      ?auto_876862 - BLOCK
      ?auto_876863 - BLOCK
      ?auto_876864 - BLOCK
      ?auto_876865 - BLOCK
      ?auto_876866 - BLOCK
    )
    :vars
    (
      ?auto_876867 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_876865 ) ( ON ?auto_876866 ?auto_876867 ) ( CLEAR ?auto_876866 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_876851 ) ( ON ?auto_876852 ?auto_876851 ) ( ON ?auto_876853 ?auto_876852 ) ( ON ?auto_876854 ?auto_876853 ) ( ON ?auto_876855 ?auto_876854 ) ( ON ?auto_876856 ?auto_876855 ) ( ON ?auto_876857 ?auto_876856 ) ( ON ?auto_876858 ?auto_876857 ) ( ON ?auto_876859 ?auto_876858 ) ( ON ?auto_876860 ?auto_876859 ) ( ON ?auto_876861 ?auto_876860 ) ( ON ?auto_876862 ?auto_876861 ) ( ON ?auto_876863 ?auto_876862 ) ( ON ?auto_876864 ?auto_876863 ) ( ON ?auto_876865 ?auto_876864 ) ( not ( = ?auto_876851 ?auto_876852 ) ) ( not ( = ?auto_876851 ?auto_876853 ) ) ( not ( = ?auto_876851 ?auto_876854 ) ) ( not ( = ?auto_876851 ?auto_876855 ) ) ( not ( = ?auto_876851 ?auto_876856 ) ) ( not ( = ?auto_876851 ?auto_876857 ) ) ( not ( = ?auto_876851 ?auto_876858 ) ) ( not ( = ?auto_876851 ?auto_876859 ) ) ( not ( = ?auto_876851 ?auto_876860 ) ) ( not ( = ?auto_876851 ?auto_876861 ) ) ( not ( = ?auto_876851 ?auto_876862 ) ) ( not ( = ?auto_876851 ?auto_876863 ) ) ( not ( = ?auto_876851 ?auto_876864 ) ) ( not ( = ?auto_876851 ?auto_876865 ) ) ( not ( = ?auto_876851 ?auto_876866 ) ) ( not ( = ?auto_876851 ?auto_876867 ) ) ( not ( = ?auto_876852 ?auto_876853 ) ) ( not ( = ?auto_876852 ?auto_876854 ) ) ( not ( = ?auto_876852 ?auto_876855 ) ) ( not ( = ?auto_876852 ?auto_876856 ) ) ( not ( = ?auto_876852 ?auto_876857 ) ) ( not ( = ?auto_876852 ?auto_876858 ) ) ( not ( = ?auto_876852 ?auto_876859 ) ) ( not ( = ?auto_876852 ?auto_876860 ) ) ( not ( = ?auto_876852 ?auto_876861 ) ) ( not ( = ?auto_876852 ?auto_876862 ) ) ( not ( = ?auto_876852 ?auto_876863 ) ) ( not ( = ?auto_876852 ?auto_876864 ) ) ( not ( = ?auto_876852 ?auto_876865 ) ) ( not ( = ?auto_876852 ?auto_876866 ) ) ( not ( = ?auto_876852 ?auto_876867 ) ) ( not ( = ?auto_876853 ?auto_876854 ) ) ( not ( = ?auto_876853 ?auto_876855 ) ) ( not ( = ?auto_876853 ?auto_876856 ) ) ( not ( = ?auto_876853 ?auto_876857 ) ) ( not ( = ?auto_876853 ?auto_876858 ) ) ( not ( = ?auto_876853 ?auto_876859 ) ) ( not ( = ?auto_876853 ?auto_876860 ) ) ( not ( = ?auto_876853 ?auto_876861 ) ) ( not ( = ?auto_876853 ?auto_876862 ) ) ( not ( = ?auto_876853 ?auto_876863 ) ) ( not ( = ?auto_876853 ?auto_876864 ) ) ( not ( = ?auto_876853 ?auto_876865 ) ) ( not ( = ?auto_876853 ?auto_876866 ) ) ( not ( = ?auto_876853 ?auto_876867 ) ) ( not ( = ?auto_876854 ?auto_876855 ) ) ( not ( = ?auto_876854 ?auto_876856 ) ) ( not ( = ?auto_876854 ?auto_876857 ) ) ( not ( = ?auto_876854 ?auto_876858 ) ) ( not ( = ?auto_876854 ?auto_876859 ) ) ( not ( = ?auto_876854 ?auto_876860 ) ) ( not ( = ?auto_876854 ?auto_876861 ) ) ( not ( = ?auto_876854 ?auto_876862 ) ) ( not ( = ?auto_876854 ?auto_876863 ) ) ( not ( = ?auto_876854 ?auto_876864 ) ) ( not ( = ?auto_876854 ?auto_876865 ) ) ( not ( = ?auto_876854 ?auto_876866 ) ) ( not ( = ?auto_876854 ?auto_876867 ) ) ( not ( = ?auto_876855 ?auto_876856 ) ) ( not ( = ?auto_876855 ?auto_876857 ) ) ( not ( = ?auto_876855 ?auto_876858 ) ) ( not ( = ?auto_876855 ?auto_876859 ) ) ( not ( = ?auto_876855 ?auto_876860 ) ) ( not ( = ?auto_876855 ?auto_876861 ) ) ( not ( = ?auto_876855 ?auto_876862 ) ) ( not ( = ?auto_876855 ?auto_876863 ) ) ( not ( = ?auto_876855 ?auto_876864 ) ) ( not ( = ?auto_876855 ?auto_876865 ) ) ( not ( = ?auto_876855 ?auto_876866 ) ) ( not ( = ?auto_876855 ?auto_876867 ) ) ( not ( = ?auto_876856 ?auto_876857 ) ) ( not ( = ?auto_876856 ?auto_876858 ) ) ( not ( = ?auto_876856 ?auto_876859 ) ) ( not ( = ?auto_876856 ?auto_876860 ) ) ( not ( = ?auto_876856 ?auto_876861 ) ) ( not ( = ?auto_876856 ?auto_876862 ) ) ( not ( = ?auto_876856 ?auto_876863 ) ) ( not ( = ?auto_876856 ?auto_876864 ) ) ( not ( = ?auto_876856 ?auto_876865 ) ) ( not ( = ?auto_876856 ?auto_876866 ) ) ( not ( = ?auto_876856 ?auto_876867 ) ) ( not ( = ?auto_876857 ?auto_876858 ) ) ( not ( = ?auto_876857 ?auto_876859 ) ) ( not ( = ?auto_876857 ?auto_876860 ) ) ( not ( = ?auto_876857 ?auto_876861 ) ) ( not ( = ?auto_876857 ?auto_876862 ) ) ( not ( = ?auto_876857 ?auto_876863 ) ) ( not ( = ?auto_876857 ?auto_876864 ) ) ( not ( = ?auto_876857 ?auto_876865 ) ) ( not ( = ?auto_876857 ?auto_876866 ) ) ( not ( = ?auto_876857 ?auto_876867 ) ) ( not ( = ?auto_876858 ?auto_876859 ) ) ( not ( = ?auto_876858 ?auto_876860 ) ) ( not ( = ?auto_876858 ?auto_876861 ) ) ( not ( = ?auto_876858 ?auto_876862 ) ) ( not ( = ?auto_876858 ?auto_876863 ) ) ( not ( = ?auto_876858 ?auto_876864 ) ) ( not ( = ?auto_876858 ?auto_876865 ) ) ( not ( = ?auto_876858 ?auto_876866 ) ) ( not ( = ?auto_876858 ?auto_876867 ) ) ( not ( = ?auto_876859 ?auto_876860 ) ) ( not ( = ?auto_876859 ?auto_876861 ) ) ( not ( = ?auto_876859 ?auto_876862 ) ) ( not ( = ?auto_876859 ?auto_876863 ) ) ( not ( = ?auto_876859 ?auto_876864 ) ) ( not ( = ?auto_876859 ?auto_876865 ) ) ( not ( = ?auto_876859 ?auto_876866 ) ) ( not ( = ?auto_876859 ?auto_876867 ) ) ( not ( = ?auto_876860 ?auto_876861 ) ) ( not ( = ?auto_876860 ?auto_876862 ) ) ( not ( = ?auto_876860 ?auto_876863 ) ) ( not ( = ?auto_876860 ?auto_876864 ) ) ( not ( = ?auto_876860 ?auto_876865 ) ) ( not ( = ?auto_876860 ?auto_876866 ) ) ( not ( = ?auto_876860 ?auto_876867 ) ) ( not ( = ?auto_876861 ?auto_876862 ) ) ( not ( = ?auto_876861 ?auto_876863 ) ) ( not ( = ?auto_876861 ?auto_876864 ) ) ( not ( = ?auto_876861 ?auto_876865 ) ) ( not ( = ?auto_876861 ?auto_876866 ) ) ( not ( = ?auto_876861 ?auto_876867 ) ) ( not ( = ?auto_876862 ?auto_876863 ) ) ( not ( = ?auto_876862 ?auto_876864 ) ) ( not ( = ?auto_876862 ?auto_876865 ) ) ( not ( = ?auto_876862 ?auto_876866 ) ) ( not ( = ?auto_876862 ?auto_876867 ) ) ( not ( = ?auto_876863 ?auto_876864 ) ) ( not ( = ?auto_876863 ?auto_876865 ) ) ( not ( = ?auto_876863 ?auto_876866 ) ) ( not ( = ?auto_876863 ?auto_876867 ) ) ( not ( = ?auto_876864 ?auto_876865 ) ) ( not ( = ?auto_876864 ?auto_876866 ) ) ( not ( = ?auto_876864 ?auto_876867 ) ) ( not ( = ?auto_876865 ?auto_876866 ) ) ( not ( = ?auto_876865 ?auto_876867 ) ) ( not ( = ?auto_876866 ?auto_876867 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_876866 ?auto_876867 )
      ( !STACK ?auto_876866 ?auto_876865 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_876917 - BLOCK
      ?auto_876918 - BLOCK
      ?auto_876919 - BLOCK
      ?auto_876920 - BLOCK
      ?auto_876921 - BLOCK
      ?auto_876922 - BLOCK
      ?auto_876923 - BLOCK
      ?auto_876924 - BLOCK
      ?auto_876925 - BLOCK
      ?auto_876926 - BLOCK
      ?auto_876927 - BLOCK
      ?auto_876928 - BLOCK
      ?auto_876929 - BLOCK
      ?auto_876930 - BLOCK
      ?auto_876931 - BLOCK
      ?auto_876932 - BLOCK
    )
    :vars
    (
      ?auto_876933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_876932 ?auto_876933 ) ( ON-TABLE ?auto_876917 ) ( ON ?auto_876918 ?auto_876917 ) ( ON ?auto_876919 ?auto_876918 ) ( ON ?auto_876920 ?auto_876919 ) ( ON ?auto_876921 ?auto_876920 ) ( ON ?auto_876922 ?auto_876921 ) ( ON ?auto_876923 ?auto_876922 ) ( ON ?auto_876924 ?auto_876923 ) ( ON ?auto_876925 ?auto_876924 ) ( ON ?auto_876926 ?auto_876925 ) ( ON ?auto_876927 ?auto_876926 ) ( ON ?auto_876928 ?auto_876927 ) ( ON ?auto_876929 ?auto_876928 ) ( ON ?auto_876930 ?auto_876929 ) ( not ( = ?auto_876917 ?auto_876918 ) ) ( not ( = ?auto_876917 ?auto_876919 ) ) ( not ( = ?auto_876917 ?auto_876920 ) ) ( not ( = ?auto_876917 ?auto_876921 ) ) ( not ( = ?auto_876917 ?auto_876922 ) ) ( not ( = ?auto_876917 ?auto_876923 ) ) ( not ( = ?auto_876917 ?auto_876924 ) ) ( not ( = ?auto_876917 ?auto_876925 ) ) ( not ( = ?auto_876917 ?auto_876926 ) ) ( not ( = ?auto_876917 ?auto_876927 ) ) ( not ( = ?auto_876917 ?auto_876928 ) ) ( not ( = ?auto_876917 ?auto_876929 ) ) ( not ( = ?auto_876917 ?auto_876930 ) ) ( not ( = ?auto_876917 ?auto_876931 ) ) ( not ( = ?auto_876917 ?auto_876932 ) ) ( not ( = ?auto_876917 ?auto_876933 ) ) ( not ( = ?auto_876918 ?auto_876919 ) ) ( not ( = ?auto_876918 ?auto_876920 ) ) ( not ( = ?auto_876918 ?auto_876921 ) ) ( not ( = ?auto_876918 ?auto_876922 ) ) ( not ( = ?auto_876918 ?auto_876923 ) ) ( not ( = ?auto_876918 ?auto_876924 ) ) ( not ( = ?auto_876918 ?auto_876925 ) ) ( not ( = ?auto_876918 ?auto_876926 ) ) ( not ( = ?auto_876918 ?auto_876927 ) ) ( not ( = ?auto_876918 ?auto_876928 ) ) ( not ( = ?auto_876918 ?auto_876929 ) ) ( not ( = ?auto_876918 ?auto_876930 ) ) ( not ( = ?auto_876918 ?auto_876931 ) ) ( not ( = ?auto_876918 ?auto_876932 ) ) ( not ( = ?auto_876918 ?auto_876933 ) ) ( not ( = ?auto_876919 ?auto_876920 ) ) ( not ( = ?auto_876919 ?auto_876921 ) ) ( not ( = ?auto_876919 ?auto_876922 ) ) ( not ( = ?auto_876919 ?auto_876923 ) ) ( not ( = ?auto_876919 ?auto_876924 ) ) ( not ( = ?auto_876919 ?auto_876925 ) ) ( not ( = ?auto_876919 ?auto_876926 ) ) ( not ( = ?auto_876919 ?auto_876927 ) ) ( not ( = ?auto_876919 ?auto_876928 ) ) ( not ( = ?auto_876919 ?auto_876929 ) ) ( not ( = ?auto_876919 ?auto_876930 ) ) ( not ( = ?auto_876919 ?auto_876931 ) ) ( not ( = ?auto_876919 ?auto_876932 ) ) ( not ( = ?auto_876919 ?auto_876933 ) ) ( not ( = ?auto_876920 ?auto_876921 ) ) ( not ( = ?auto_876920 ?auto_876922 ) ) ( not ( = ?auto_876920 ?auto_876923 ) ) ( not ( = ?auto_876920 ?auto_876924 ) ) ( not ( = ?auto_876920 ?auto_876925 ) ) ( not ( = ?auto_876920 ?auto_876926 ) ) ( not ( = ?auto_876920 ?auto_876927 ) ) ( not ( = ?auto_876920 ?auto_876928 ) ) ( not ( = ?auto_876920 ?auto_876929 ) ) ( not ( = ?auto_876920 ?auto_876930 ) ) ( not ( = ?auto_876920 ?auto_876931 ) ) ( not ( = ?auto_876920 ?auto_876932 ) ) ( not ( = ?auto_876920 ?auto_876933 ) ) ( not ( = ?auto_876921 ?auto_876922 ) ) ( not ( = ?auto_876921 ?auto_876923 ) ) ( not ( = ?auto_876921 ?auto_876924 ) ) ( not ( = ?auto_876921 ?auto_876925 ) ) ( not ( = ?auto_876921 ?auto_876926 ) ) ( not ( = ?auto_876921 ?auto_876927 ) ) ( not ( = ?auto_876921 ?auto_876928 ) ) ( not ( = ?auto_876921 ?auto_876929 ) ) ( not ( = ?auto_876921 ?auto_876930 ) ) ( not ( = ?auto_876921 ?auto_876931 ) ) ( not ( = ?auto_876921 ?auto_876932 ) ) ( not ( = ?auto_876921 ?auto_876933 ) ) ( not ( = ?auto_876922 ?auto_876923 ) ) ( not ( = ?auto_876922 ?auto_876924 ) ) ( not ( = ?auto_876922 ?auto_876925 ) ) ( not ( = ?auto_876922 ?auto_876926 ) ) ( not ( = ?auto_876922 ?auto_876927 ) ) ( not ( = ?auto_876922 ?auto_876928 ) ) ( not ( = ?auto_876922 ?auto_876929 ) ) ( not ( = ?auto_876922 ?auto_876930 ) ) ( not ( = ?auto_876922 ?auto_876931 ) ) ( not ( = ?auto_876922 ?auto_876932 ) ) ( not ( = ?auto_876922 ?auto_876933 ) ) ( not ( = ?auto_876923 ?auto_876924 ) ) ( not ( = ?auto_876923 ?auto_876925 ) ) ( not ( = ?auto_876923 ?auto_876926 ) ) ( not ( = ?auto_876923 ?auto_876927 ) ) ( not ( = ?auto_876923 ?auto_876928 ) ) ( not ( = ?auto_876923 ?auto_876929 ) ) ( not ( = ?auto_876923 ?auto_876930 ) ) ( not ( = ?auto_876923 ?auto_876931 ) ) ( not ( = ?auto_876923 ?auto_876932 ) ) ( not ( = ?auto_876923 ?auto_876933 ) ) ( not ( = ?auto_876924 ?auto_876925 ) ) ( not ( = ?auto_876924 ?auto_876926 ) ) ( not ( = ?auto_876924 ?auto_876927 ) ) ( not ( = ?auto_876924 ?auto_876928 ) ) ( not ( = ?auto_876924 ?auto_876929 ) ) ( not ( = ?auto_876924 ?auto_876930 ) ) ( not ( = ?auto_876924 ?auto_876931 ) ) ( not ( = ?auto_876924 ?auto_876932 ) ) ( not ( = ?auto_876924 ?auto_876933 ) ) ( not ( = ?auto_876925 ?auto_876926 ) ) ( not ( = ?auto_876925 ?auto_876927 ) ) ( not ( = ?auto_876925 ?auto_876928 ) ) ( not ( = ?auto_876925 ?auto_876929 ) ) ( not ( = ?auto_876925 ?auto_876930 ) ) ( not ( = ?auto_876925 ?auto_876931 ) ) ( not ( = ?auto_876925 ?auto_876932 ) ) ( not ( = ?auto_876925 ?auto_876933 ) ) ( not ( = ?auto_876926 ?auto_876927 ) ) ( not ( = ?auto_876926 ?auto_876928 ) ) ( not ( = ?auto_876926 ?auto_876929 ) ) ( not ( = ?auto_876926 ?auto_876930 ) ) ( not ( = ?auto_876926 ?auto_876931 ) ) ( not ( = ?auto_876926 ?auto_876932 ) ) ( not ( = ?auto_876926 ?auto_876933 ) ) ( not ( = ?auto_876927 ?auto_876928 ) ) ( not ( = ?auto_876927 ?auto_876929 ) ) ( not ( = ?auto_876927 ?auto_876930 ) ) ( not ( = ?auto_876927 ?auto_876931 ) ) ( not ( = ?auto_876927 ?auto_876932 ) ) ( not ( = ?auto_876927 ?auto_876933 ) ) ( not ( = ?auto_876928 ?auto_876929 ) ) ( not ( = ?auto_876928 ?auto_876930 ) ) ( not ( = ?auto_876928 ?auto_876931 ) ) ( not ( = ?auto_876928 ?auto_876932 ) ) ( not ( = ?auto_876928 ?auto_876933 ) ) ( not ( = ?auto_876929 ?auto_876930 ) ) ( not ( = ?auto_876929 ?auto_876931 ) ) ( not ( = ?auto_876929 ?auto_876932 ) ) ( not ( = ?auto_876929 ?auto_876933 ) ) ( not ( = ?auto_876930 ?auto_876931 ) ) ( not ( = ?auto_876930 ?auto_876932 ) ) ( not ( = ?auto_876930 ?auto_876933 ) ) ( not ( = ?auto_876931 ?auto_876932 ) ) ( not ( = ?auto_876931 ?auto_876933 ) ) ( not ( = ?auto_876932 ?auto_876933 ) ) ( CLEAR ?auto_876930 ) ( ON ?auto_876931 ?auto_876932 ) ( CLEAR ?auto_876931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_876917 ?auto_876918 ?auto_876919 ?auto_876920 ?auto_876921 ?auto_876922 ?auto_876923 ?auto_876924 ?auto_876925 ?auto_876926 ?auto_876927 ?auto_876928 ?auto_876929 ?auto_876930 ?auto_876931 )
      ( MAKE-16PILE ?auto_876917 ?auto_876918 ?auto_876919 ?auto_876920 ?auto_876921 ?auto_876922 ?auto_876923 ?auto_876924 ?auto_876925 ?auto_876926 ?auto_876927 ?auto_876928 ?auto_876929 ?auto_876930 ?auto_876931 ?auto_876932 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_876983 - BLOCK
      ?auto_876984 - BLOCK
      ?auto_876985 - BLOCK
      ?auto_876986 - BLOCK
      ?auto_876987 - BLOCK
      ?auto_876988 - BLOCK
      ?auto_876989 - BLOCK
      ?auto_876990 - BLOCK
      ?auto_876991 - BLOCK
      ?auto_876992 - BLOCK
      ?auto_876993 - BLOCK
      ?auto_876994 - BLOCK
      ?auto_876995 - BLOCK
      ?auto_876996 - BLOCK
      ?auto_876997 - BLOCK
      ?auto_876998 - BLOCK
    )
    :vars
    (
      ?auto_876999 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_876998 ?auto_876999 ) ( ON-TABLE ?auto_876983 ) ( ON ?auto_876984 ?auto_876983 ) ( ON ?auto_876985 ?auto_876984 ) ( ON ?auto_876986 ?auto_876985 ) ( ON ?auto_876987 ?auto_876986 ) ( ON ?auto_876988 ?auto_876987 ) ( ON ?auto_876989 ?auto_876988 ) ( ON ?auto_876990 ?auto_876989 ) ( ON ?auto_876991 ?auto_876990 ) ( ON ?auto_876992 ?auto_876991 ) ( ON ?auto_876993 ?auto_876992 ) ( ON ?auto_876994 ?auto_876993 ) ( ON ?auto_876995 ?auto_876994 ) ( not ( = ?auto_876983 ?auto_876984 ) ) ( not ( = ?auto_876983 ?auto_876985 ) ) ( not ( = ?auto_876983 ?auto_876986 ) ) ( not ( = ?auto_876983 ?auto_876987 ) ) ( not ( = ?auto_876983 ?auto_876988 ) ) ( not ( = ?auto_876983 ?auto_876989 ) ) ( not ( = ?auto_876983 ?auto_876990 ) ) ( not ( = ?auto_876983 ?auto_876991 ) ) ( not ( = ?auto_876983 ?auto_876992 ) ) ( not ( = ?auto_876983 ?auto_876993 ) ) ( not ( = ?auto_876983 ?auto_876994 ) ) ( not ( = ?auto_876983 ?auto_876995 ) ) ( not ( = ?auto_876983 ?auto_876996 ) ) ( not ( = ?auto_876983 ?auto_876997 ) ) ( not ( = ?auto_876983 ?auto_876998 ) ) ( not ( = ?auto_876983 ?auto_876999 ) ) ( not ( = ?auto_876984 ?auto_876985 ) ) ( not ( = ?auto_876984 ?auto_876986 ) ) ( not ( = ?auto_876984 ?auto_876987 ) ) ( not ( = ?auto_876984 ?auto_876988 ) ) ( not ( = ?auto_876984 ?auto_876989 ) ) ( not ( = ?auto_876984 ?auto_876990 ) ) ( not ( = ?auto_876984 ?auto_876991 ) ) ( not ( = ?auto_876984 ?auto_876992 ) ) ( not ( = ?auto_876984 ?auto_876993 ) ) ( not ( = ?auto_876984 ?auto_876994 ) ) ( not ( = ?auto_876984 ?auto_876995 ) ) ( not ( = ?auto_876984 ?auto_876996 ) ) ( not ( = ?auto_876984 ?auto_876997 ) ) ( not ( = ?auto_876984 ?auto_876998 ) ) ( not ( = ?auto_876984 ?auto_876999 ) ) ( not ( = ?auto_876985 ?auto_876986 ) ) ( not ( = ?auto_876985 ?auto_876987 ) ) ( not ( = ?auto_876985 ?auto_876988 ) ) ( not ( = ?auto_876985 ?auto_876989 ) ) ( not ( = ?auto_876985 ?auto_876990 ) ) ( not ( = ?auto_876985 ?auto_876991 ) ) ( not ( = ?auto_876985 ?auto_876992 ) ) ( not ( = ?auto_876985 ?auto_876993 ) ) ( not ( = ?auto_876985 ?auto_876994 ) ) ( not ( = ?auto_876985 ?auto_876995 ) ) ( not ( = ?auto_876985 ?auto_876996 ) ) ( not ( = ?auto_876985 ?auto_876997 ) ) ( not ( = ?auto_876985 ?auto_876998 ) ) ( not ( = ?auto_876985 ?auto_876999 ) ) ( not ( = ?auto_876986 ?auto_876987 ) ) ( not ( = ?auto_876986 ?auto_876988 ) ) ( not ( = ?auto_876986 ?auto_876989 ) ) ( not ( = ?auto_876986 ?auto_876990 ) ) ( not ( = ?auto_876986 ?auto_876991 ) ) ( not ( = ?auto_876986 ?auto_876992 ) ) ( not ( = ?auto_876986 ?auto_876993 ) ) ( not ( = ?auto_876986 ?auto_876994 ) ) ( not ( = ?auto_876986 ?auto_876995 ) ) ( not ( = ?auto_876986 ?auto_876996 ) ) ( not ( = ?auto_876986 ?auto_876997 ) ) ( not ( = ?auto_876986 ?auto_876998 ) ) ( not ( = ?auto_876986 ?auto_876999 ) ) ( not ( = ?auto_876987 ?auto_876988 ) ) ( not ( = ?auto_876987 ?auto_876989 ) ) ( not ( = ?auto_876987 ?auto_876990 ) ) ( not ( = ?auto_876987 ?auto_876991 ) ) ( not ( = ?auto_876987 ?auto_876992 ) ) ( not ( = ?auto_876987 ?auto_876993 ) ) ( not ( = ?auto_876987 ?auto_876994 ) ) ( not ( = ?auto_876987 ?auto_876995 ) ) ( not ( = ?auto_876987 ?auto_876996 ) ) ( not ( = ?auto_876987 ?auto_876997 ) ) ( not ( = ?auto_876987 ?auto_876998 ) ) ( not ( = ?auto_876987 ?auto_876999 ) ) ( not ( = ?auto_876988 ?auto_876989 ) ) ( not ( = ?auto_876988 ?auto_876990 ) ) ( not ( = ?auto_876988 ?auto_876991 ) ) ( not ( = ?auto_876988 ?auto_876992 ) ) ( not ( = ?auto_876988 ?auto_876993 ) ) ( not ( = ?auto_876988 ?auto_876994 ) ) ( not ( = ?auto_876988 ?auto_876995 ) ) ( not ( = ?auto_876988 ?auto_876996 ) ) ( not ( = ?auto_876988 ?auto_876997 ) ) ( not ( = ?auto_876988 ?auto_876998 ) ) ( not ( = ?auto_876988 ?auto_876999 ) ) ( not ( = ?auto_876989 ?auto_876990 ) ) ( not ( = ?auto_876989 ?auto_876991 ) ) ( not ( = ?auto_876989 ?auto_876992 ) ) ( not ( = ?auto_876989 ?auto_876993 ) ) ( not ( = ?auto_876989 ?auto_876994 ) ) ( not ( = ?auto_876989 ?auto_876995 ) ) ( not ( = ?auto_876989 ?auto_876996 ) ) ( not ( = ?auto_876989 ?auto_876997 ) ) ( not ( = ?auto_876989 ?auto_876998 ) ) ( not ( = ?auto_876989 ?auto_876999 ) ) ( not ( = ?auto_876990 ?auto_876991 ) ) ( not ( = ?auto_876990 ?auto_876992 ) ) ( not ( = ?auto_876990 ?auto_876993 ) ) ( not ( = ?auto_876990 ?auto_876994 ) ) ( not ( = ?auto_876990 ?auto_876995 ) ) ( not ( = ?auto_876990 ?auto_876996 ) ) ( not ( = ?auto_876990 ?auto_876997 ) ) ( not ( = ?auto_876990 ?auto_876998 ) ) ( not ( = ?auto_876990 ?auto_876999 ) ) ( not ( = ?auto_876991 ?auto_876992 ) ) ( not ( = ?auto_876991 ?auto_876993 ) ) ( not ( = ?auto_876991 ?auto_876994 ) ) ( not ( = ?auto_876991 ?auto_876995 ) ) ( not ( = ?auto_876991 ?auto_876996 ) ) ( not ( = ?auto_876991 ?auto_876997 ) ) ( not ( = ?auto_876991 ?auto_876998 ) ) ( not ( = ?auto_876991 ?auto_876999 ) ) ( not ( = ?auto_876992 ?auto_876993 ) ) ( not ( = ?auto_876992 ?auto_876994 ) ) ( not ( = ?auto_876992 ?auto_876995 ) ) ( not ( = ?auto_876992 ?auto_876996 ) ) ( not ( = ?auto_876992 ?auto_876997 ) ) ( not ( = ?auto_876992 ?auto_876998 ) ) ( not ( = ?auto_876992 ?auto_876999 ) ) ( not ( = ?auto_876993 ?auto_876994 ) ) ( not ( = ?auto_876993 ?auto_876995 ) ) ( not ( = ?auto_876993 ?auto_876996 ) ) ( not ( = ?auto_876993 ?auto_876997 ) ) ( not ( = ?auto_876993 ?auto_876998 ) ) ( not ( = ?auto_876993 ?auto_876999 ) ) ( not ( = ?auto_876994 ?auto_876995 ) ) ( not ( = ?auto_876994 ?auto_876996 ) ) ( not ( = ?auto_876994 ?auto_876997 ) ) ( not ( = ?auto_876994 ?auto_876998 ) ) ( not ( = ?auto_876994 ?auto_876999 ) ) ( not ( = ?auto_876995 ?auto_876996 ) ) ( not ( = ?auto_876995 ?auto_876997 ) ) ( not ( = ?auto_876995 ?auto_876998 ) ) ( not ( = ?auto_876995 ?auto_876999 ) ) ( not ( = ?auto_876996 ?auto_876997 ) ) ( not ( = ?auto_876996 ?auto_876998 ) ) ( not ( = ?auto_876996 ?auto_876999 ) ) ( not ( = ?auto_876997 ?auto_876998 ) ) ( not ( = ?auto_876997 ?auto_876999 ) ) ( not ( = ?auto_876998 ?auto_876999 ) ) ( ON ?auto_876997 ?auto_876998 ) ( CLEAR ?auto_876995 ) ( ON ?auto_876996 ?auto_876997 ) ( CLEAR ?auto_876996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_876983 ?auto_876984 ?auto_876985 ?auto_876986 ?auto_876987 ?auto_876988 ?auto_876989 ?auto_876990 ?auto_876991 ?auto_876992 ?auto_876993 ?auto_876994 ?auto_876995 ?auto_876996 )
      ( MAKE-16PILE ?auto_876983 ?auto_876984 ?auto_876985 ?auto_876986 ?auto_876987 ?auto_876988 ?auto_876989 ?auto_876990 ?auto_876991 ?auto_876992 ?auto_876993 ?auto_876994 ?auto_876995 ?auto_876996 ?auto_876997 ?auto_876998 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_877049 - BLOCK
      ?auto_877050 - BLOCK
      ?auto_877051 - BLOCK
      ?auto_877052 - BLOCK
      ?auto_877053 - BLOCK
      ?auto_877054 - BLOCK
      ?auto_877055 - BLOCK
      ?auto_877056 - BLOCK
      ?auto_877057 - BLOCK
      ?auto_877058 - BLOCK
      ?auto_877059 - BLOCK
      ?auto_877060 - BLOCK
      ?auto_877061 - BLOCK
      ?auto_877062 - BLOCK
      ?auto_877063 - BLOCK
      ?auto_877064 - BLOCK
    )
    :vars
    (
      ?auto_877065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_877064 ?auto_877065 ) ( ON-TABLE ?auto_877049 ) ( ON ?auto_877050 ?auto_877049 ) ( ON ?auto_877051 ?auto_877050 ) ( ON ?auto_877052 ?auto_877051 ) ( ON ?auto_877053 ?auto_877052 ) ( ON ?auto_877054 ?auto_877053 ) ( ON ?auto_877055 ?auto_877054 ) ( ON ?auto_877056 ?auto_877055 ) ( ON ?auto_877057 ?auto_877056 ) ( ON ?auto_877058 ?auto_877057 ) ( ON ?auto_877059 ?auto_877058 ) ( ON ?auto_877060 ?auto_877059 ) ( not ( = ?auto_877049 ?auto_877050 ) ) ( not ( = ?auto_877049 ?auto_877051 ) ) ( not ( = ?auto_877049 ?auto_877052 ) ) ( not ( = ?auto_877049 ?auto_877053 ) ) ( not ( = ?auto_877049 ?auto_877054 ) ) ( not ( = ?auto_877049 ?auto_877055 ) ) ( not ( = ?auto_877049 ?auto_877056 ) ) ( not ( = ?auto_877049 ?auto_877057 ) ) ( not ( = ?auto_877049 ?auto_877058 ) ) ( not ( = ?auto_877049 ?auto_877059 ) ) ( not ( = ?auto_877049 ?auto_877060 ) ) ( not ( = ?auto_877049 ?auto_877061 ) ) ( not ( = ?auto_877049 ?auto_877062 ) ) ( not ( = ?auto_877049 ?auto_877063 ) ) ( not ( = ?auto_877049 ?auto_877064 ) ) ( not ( = ?auto_877049 ?auto_877065 ) ) ( not ( = ?auto_877050 ?auto_877051 ) ) ( not ( = ?auto_877050 ?auto_877052 ) ) ( not ( = ?auto_877050 ?auto_877053 ) ) ( not ( = ?auto_877050 ?auto_877054 ) ) ( not ( = ?auto_877050 ?auto_877055 ) ) ( not ( = ?auto_877050 ?auto_877056 ) ) ( not ( = ?auto_877050 ?auto_877057 ) ) ( not ( = ?auto_877050 ?auto_877058 ) ) ( not ( = ?auto_877050 ?auto_877059 ) ) ( not ( = ?auto_877050 ?auto_877060 ) ) ( not ( = ?auto_877050 ?auto_877061 ) ) ( not ( = ?auto_877050 ?auto_877062 ) ) ( not ( = ?auto_877050 ?auto_877063 ) ) ( not ( = ?auto_877050 ?auto_877064 ) ) ( not ( = ?auto_877050 ?auto_877065 ) ) ( not ( = ?auto_877051 ?auto_877052 ) ) ( not ( = ?auto_877051 ?auto_877053 ) ) ( not ( = ?auto_877051 ?auto_877054 ) ) ( not ( = ?auto_877051 ?auto_877055 ) ) ( not ( = ?auto_877051 ?auto_877056 ) ) ( not ( = ?auto_877051 ?auto_877057 ) ) ( not ( = ?auto_877051 ?auto_877058 ) ) ( not ( = ?auto_877051 ?auto_877059 ) ) ( not ( = ?auto_877051 ?auto_877060 ) ) ( not ( = ?auto_877051 ?auto_877061 ) ) ( not ( = ?auto_877051 ?auto_877062 ) ) ( not ( = ?auto_877051 ?auto_877063 ) ) ( not ( = ?auto_877051 ?auto_877064 ) ) ( not ( = ?auto_877051 ?auto_877065 ) ) ( not ( = ?auto_877052 ?auto_877053 ) ) ( not ( = ?auto_877052 ?auto_877054 ) ) ( not ( = ?auto_877052 ?auto_877055 ) ) ( not ( = ?auto_877052 ?auto_877056 ) ) ( not ( = ?auto_877052 ?auto_877057 ) ) ( not ( = ?auto_877052 ?auto_877058 ) ) ( not ( = ?auto_877052 ?auto_877059 ) ) ( not ( = ?auto_877052 ?auto_877060 ) ) ( not ( = ?auto_877052 ?auto_877061 ) ) ( not ( = ?auto_877052 ?auto_877062 ) ) ( not ( = ?auto_877052 ?auto_877063 ) ) ( not ( = ?auto_877052 ?auto_877064 ) ) ( not ( = ?auto_877052 ?auto_877065 ) ) ( not ( = ?auto_877053 ?auto_877054 ) ) ( not ( = ?auto_877053 ?auto_877055 ) ) ( not ( = ?auto_877053 ?auto_877056 ) ) ( not ( = ?auto_877053 ?auto_877057 ) ) ( not ( = ?auto_877053 ?auto_877058 ) ) ( not ( = ?auto_877053 ?auto_877059 ) ) ( not ( = ?auto_877053 ?auto_877060 ) ) ( not ( = ?auto_877053 ?auto_877061 ) ) ( not ( = ?auto_877053 ?auto_877062 ) ) ( not ( = ?auto_877053 ?auto_877063 ) ) ( not ( = ?auto_877053 ?auto_877064 ) ) ( not ( = ?auto_877053 ?auto_877065 ) ) ( not ( = ?auto_877054 ?auto_877055 ) ) ( not ( = ?auto_877054 ?auto_877056 ) ) ( not ( = ?auto_877054 ?auto_877057 ) ) ( not ( = ?auto_877054 ?auto_877058 ) ) ( not ( = ?auto_877054 ?auto_877059 ) ) ( not ( = ?auto_877054 ?auto_877060 ) ) ( not ( = ?auto_877054 ?auto_877061 ) ) ( not ( = ?auto_877054 ?auto_877062 ) ) ( not ( = ?auto_877054 ?auto_877063 ) ) ( not ( = ?auto_877054 ?auto_877064 ) ) ( not ( = ?auto_877054 ?auto_877065 ) ) ( not ( = ?auto_877055 ?auto_877056 ) ) ( not ( = ?auto_877055 ?auto_877057 ) ) ( not ( = ?auto_877055 ?auto_877058 ) ) ( not ( = ?auto_877055 ?auto_877059 ) ) ( not ( = ?auto_877055 ?auto_877060 ) ) ( not ( = ?auto_877055 ?auto_877061 ) ) ( not ( = ?auto_877055 ?auto_877062 ) ) ( not ( = ?auto_877055 ?auto_877063 ) ) ( not ( = ?auto_877055 ?auto_877064 ) ) ( not ( = ?auto_877055 ?auto_877065 ) ) ( not ( = ?auto_877056 ?auto_877057 ) ) ( not ( = ?auto_877056 ?auto_877058 ) ) ( not ( = ?auto_877056 ?auto_877059 ) ) ( not ( = ?auto_877056 ?auto_877060 ) ) ( not ( = ?auto_877056 ?auto_877061 ) ) ( not ( = ?auto_877056 ?auto_877062 ) ) ( not ( = ?auto_877056 ?auto_877063 ) ) ( not ( = ?auto_877056 ?auto_877064 ) ) ( not ( = ?auto_877056 ?auto_877065 ) ) ( not ( = ?auto_877057 ?auto_877058 ) ) ( not ( = ?auto_877057 ?auto_877059 ) ) ( not ( = ?auto_877057 ?auto_877060 ) ) ( not ( = ?auto_877057 ?auto_877061 ) ) ( not ( = ?auto_877057 ?auto_877062 ) ) ( not ( = ?auto_877057 ?auto_877063 ) ) ( not ( = ?auto_877057 ?auto_877064 ) ) ( not ( = ?auto_877057 ?auto_877065 ) ) ( not ( = ?auto_877058 ?auto_877059 ) ) ( not ( = ?auto_877058 ?auto_877060 ) ) ( not ( = ?auto_877058 ?auto_877061 ) ) ( not ( = ?auto_877058 ?auto_877062 ) ) ( not ( = ?auto_877058 ?auto_877063 ) ) ( not ( = ?auto_877058 ?auto_877064 ) ) ( not ( = ?auto_877058 ?auto_877065 ) ) ( not ( = ?auto_877059 ?auto_877060 ) ) ( not ( = ?auto_877059 ?auto_877061 ) ) ( not ( = ?auto_877059 ?auto_877062 ) ) ( not ( = ?auto_877059 ?auto_877063 ) ) ( not ( = ?auto_877059 ?auto_877064 ) ) ( not ( = ?auto_877059 ?auto_877065 ) ) ( not ( = ?auto_877060 ?auto_877061 ) ) ( not ( = ?auto_877060 ?auto_877062 ) ) ( not ( = ?auto_877060 ?auto_877063 ) ) ( not ( = ?auto_877060 ?auto_877064 ) ) ( not ( = ?auto_877060 ?auto_877065 ) ) ( not ( = ?auto_877061 ?auto_877062 ) ) ( not ( = ?auto_877061 ?auto_877063 ) ) ( not ( = ?auto_877061 ?auto_877064 ) ) ( not ( = ?auto_877061 ?auto_877065 ) ) ( not ( = ?auto_877062 ?auto_877063 ) ) ( not ( = ?auto_877062 ?auto_877064 ) ) ( not ( = ?auto_877062 ?auto_877065 ) ) ( not ( = ?auto_877063 ?auto_877064 ) ) ( not ( = ?auto_877063 ?auto_877065 ) ) ( not ( = ?auto_877064 ?auto_877065 ) ) ( ON ?auto_877063 ?auto_877064 ) ( ON ?auto_877062 ?auto_877063 ) ( CLEAR ?auto_877060 ) ( ON ?auto_877061 ?auto_877062 ) ( CLEAR ?auto_877061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_877049 ?auto_877050 ?auto_877051 ?auto_877052 ?auto_877053 ?auto_877054 ?auto_877055 ?auto_877056 ?auto_877057 ?auto_877058 ?auto_877059 ?auto_877060 ?auto_877061 )
      ( MAKE-16PILE ?auto_877049 ?auto_877050 ?auto_877051 ?auto_877052 ?auto_877053 ?auto_877054 ?auto_877055 ?auto_877056 ?auto_877057 ?auto_877058 ?auto_877059 ?auto_877060 ?auto_877061 ?auto_877062 ?auto_877063 ?auto_877064 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_877115 - BLOCK
      ?auto_877116 - BLOCK
      ?auto_877117 - BLOCK
      ?auto_877118 - BLOCK
      ?auto_877119 - BLOCK
      ?auto_877120 - BLOCK
      ?auto_877121 - BLOCK
      ?auto_877122 - BLOCK
      ?auto_877123 - BLOCK
      ?auto_877124 - BLOCK
      ?auto_877125 - BLOCK
      ?auto_877126 - BLOCK
      ?auto_877127 - BLOCK
      ?auto_877128 - BLOCK
      ?auto_877129 - BLOCK
      ?auto_877130 - BLOCK
    )
    :vars
    (
      ?auto_877131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_877130 ?auto_877131 ) ( ON-TABLE ?auto_877115 ) ( ON ?auto_877116 ?auto_877115 ) ( ON ?auto_877117 ?auto_877116 ) ( ON ?auto_877118 ?auto_877117 ) ( ON ?auto_877119 ?auto_877118 ) ( ON ?auto_877120 ?auto_877119 ) ( ON ?auto_877121 ?auto_877120 ) ( ON ?auto_877122 ?auto_877121 ) ( ON ?auto_877123 ?auto_877122 ) ( ON ?auto_877124 ?auto_877123 ) ( ON ?auto_877125 ?auto_877124 ) ( not ( = ?auto_877115 ?auto_877116 ) ) ( not ( = ?auto_877115 ?auto_877117 ) ) ( not ( = ?auto_877115 ?auto_877118 ) ) ( not ( = ?auto_877115 ?auto_877119 ) ) ( not ( = ?auto_877115 ?auto_877120 ) ) ( not ( = ?auto_877115 ?auto_877121 ) ) ( not ( = ?auto_877115 ?auto_877122 ) ) ( not ( = ?auto_877115 ?auto_877123 ) ) ( not ( = ?auto_877115 ?auto_877124 ) ) ( not ( = ?auto_877115 ?auto_877125 ) ) ( not ( = ?auto_877115 ?auto_877126 ) ) ( not ( = ?auto_877115 ?auto_877127 ) ) ( not ( = ?auto_877115 ?auto_877128 ) ) ( not ( = ?auto_877115 ?auto_877129 ) ) ( not ( = ?auto_877115 ?auto_877130 ) ) ( not ( = ?auto_877115 ?auto_877131 ) ) ( not ( = ?auto_877116 ?auto_877117 ) ) ( not ( = ?auto_877116 ?auto_877118 ) ) ( not ( = ?auto_877116 ?auto_877119 ) ) ( not ( = ?auto_877116 ?auto_877120 ) ) ( not ( = ?auto_877116 ?auto_877121 ) ) ( not ( = ?auto_877116 ?auto_877122 ) ) ( not ( = ?auto_877116 ?auto_877123 ) ) ( not ( = ?auto_877116 ?auto_877124 ) ) ( not ( = ?auto_877116 ?auto_877125 ) ) ( not ( = ?auto_877116 ?auto_877126 ) ) ( not ( = ?auto_877116 ?auto_877127 ) ) ( not ( = ?auto_877116 ?auto_877128 ) ) ( not ( = ?auto_877116 ?auto_877129 ) ) ( not ( = ?auto_877116 ?auto_877130 ) ) ( not ( = ?auto_877116 ?auto_877131 ) ) ( not ( = ?auto_877117 ?auto_877118 ) ) ( not ( = ?auto_877117 ?auto_877119 ) ) ( not ( = ?auto_877117 ?auto_877120 ) ) ( not ( = ?auto_877117 ?auto_877121 ) ) ( not ( = ?auto_877117 ?auto_877122 ) ) ( not ( = ?auto_877117 ?auto_877123 ) ) ( not ( = ?auto_877117 ?auto_877124 ) ) ( not ( = ?auto_877117 ?auto_877125 ) ) ( not ( = ?auto_877117 ?auto_877126 ) ) ( not ( = ?auto_877117 ?auto_877127 ) ) ( not ( = ?auto_877117 ?auto_877128 ) ) ( not ( = ?auto_877117 ?auto_877129 ) ) ( not ( = ?auto_877117 ?auto_877130 ) ) ( not ( = ?auto_877117 ?auto_877131 ) ) ( not ( = ?auto_877118 ?auto_877119 ) ) ( not ( = ?auto_877118 ?auto_877120 ) ) ( not ( = ?auto_877118 ?auto_877121 ) ) ( not ( = ?auto_877118 ?auto_877122 ) ) ( not ( = ?auto_877118 ?auto_877123 ) ) ( not ( = ?auto_877118 ?auto_877124 ) ) ( not ( = ?auto_877118 ?auto_877125 ) ) ( not ( = ?auto_877118 ?auto_877126 ) ) ( not ( = ?auto_877118 ?auto_877127 ) ) ( not ( = ?auto_877118 ?auto_877128 ) ) ( not ( = ?auto_877118 ?auto_877129 ) ) ( not ( = ?auto_877118 ?auto_877130 ) ) ( not ( = ?auto_877118 ?auto_877131 ) ) ( not ( = ?auto_877119 ?auto_877120 ) ) ( not ( = ?auto_877119 ?auto_877121 ) ) ( not ( = ?auto_877119 ?auto_877122 ) ) ( not ( = ?auto_877119 ?auto_877123 ) ) ( not ( = ?auto_877119 ?auto_877124 ) ) ( not ( = ?auto_877119 ?auto_877125 ) ) ( not ( = ?auto_877119 ?auto_877126 ) ) ( not ( = ?auto_877119 ?auto_877127 ) ) ( not ( = ?auto_877119 ?auto_877128 ) ) ( not ( = ?auto_877119 ?auto_877129 ) ) ( not ( = ?auto_877119 ?auto_877130 ) ) ( not ( = ?auto_877119 ?auto_877131 ) ) ( not ( = ?auto_877120 ?auto_877121 ) ) ( not ( = ?auto_877120 ?auto_877122 ) ) ( not ( = ?auto_877120 ?auto_877123 ) ) ( not ( = ?auto_877120 ?auto_877124 ) ) ( not ( = ?auto_877120 ?auto_877125 ) ) ( not ( = ?auto_877120 ?auto_877126 ) ) ( not ( = ?auto_877120 ?auto_877127 ) ) ( not ( = ?auto_877120 ?auto_877128 ) ) ( not ( = ?auto_877120 ?auto_877129 ) ) ( not ( = ?auto_877120 ?auto_877130 ) ) ( not ( = ?auto_877120 ?auto_877131 ) ) ( not ( = ?auto_877121 ?auto_877122 ) ) ( not ( = ?auto_877121 ?auto_877123 ) ) ( not ( = ?auto_877121 ?auto_877124 ) ) ( not ( = ?auto_877121 ?auto_877125 ) ) ( not ( = ?auto_877121 ?auto_877126 ) ) ( not ( = ?auto_877121 ?auto_877127 ) ) ( not ( = ?auto_877121 ?auto_877128 ) ) ( not ( = ?auto_877121 ?auto_877129 ) ) ( not ( = ?auto_877121 ?auto_877130 ) ) ( not ( = ?auto_877121 ?auto_877131 ) ) ( not ( = ?auto_877122 ?auto_877123 ) ) ( not ( = ?auto_877122 ?auto_877124 ) ) ( not ( = ?auto_877122 ?auto_877125 ) ) ( not ( = ?auto_877122 ?auto_877126 ) ) ( not ( = ?auto_877122 ?auto_877127 ) ) ( not ( = ?auto_877122 ?auto_877128 ) ) ( not ( = ?auto_877122 ?auto_877129 ) ) ( not ( = ?auto_877122 ?auto_877130 ) ) ( not ( = ?auto_877122 ?auto_877131 ) ) ( not ( = ?auto_877123 ?auto_877124 ) ) ( not ( = ?auto_877123 ?auto_877125 ) ) ( not ( = ?auto_877123 ?auto_877126 ) ) ( not ( = ?auto_877123 ?auto_877127 ) ) ( not ( = ?auto_877123 ?auto_877128 ) ) ( not ( = ?auto_877123 ?auto_877129 ) ) ( not ( = ?auto_877123 ?auto_877130 ) ) ( not ( = ?auto_877123 ?auto_877131 ) ) ( not ( = ?auto_877124 ?auto_877125 ) ) ( not ( = ?auto_877124 ?auto_877126 ) ) ( not ( = ?auto_877124 ?auto_877127 ) ) ( not ( = ?auto_877124 ?auto_877128 ) ) ( not ( = ?auto_877124 ?auto_877129 ) ) ( not ( = ?auto_877124 ?auto_877130 ) ) ( not ( = ?auto_877124 ?auto_877131 ) ) ( not ( = ?auto_877125 ?auto_877126 ) ) ( not ( = ?auto_877125 ?auto_877127 ) ) ( not ( = ?auto_877125 ?auto_877128 ) ) ( not ( = ?auto_877125 ?auto_877129 ) ) ( not ( = ?auto_877125 ?auto_877130 ) ) ( not ( = ?auto_877125 ?auto_877131 ) ) ( not ( = ?auto_877126 ?auto_877127 ) ) ( not ( = ?auto_877126 ?auto_877128 ) ) ( not ( = ?auto_877126 ?auto_877129 ) ) ( not ( = ?auto_877126 ?auto_877130 ) ) ( not ( = ?auto_877126 ?auto_877131 ) ) ( not ( = ?auto_877127 ?auto_877128 ) ) ( not ( = ?auto_877127 ?auto_877129 ) ) ( not ( = ?auto_877127 ?auto_877130 ) ) ( not ( = ?auto_877127 ?auto_877131 ) ) ( not ( = ?auto_877128 ?auto_877129 ) ) ( not ( = ?auto_877128 ?auto_877130 ) ) ( not ( = ?auto_877128 ?auto_877131 ) ) ( not ( = ?auto_877129 ?auto_877130 ) ) ( not ( = ?auto_877129 ?auto_877131 ) ) ( not ( = ?auto_877130 ?auto_877131 ) ) ( ON ?auto_877129 ?auto_877130 ) ( ON ?auto_877128 ?auto_877129 ) ( ON ?auto_877127 ?auto_877128 ) ( CLEAR ?auto_877125 ) ( ON ?auto_877126 ?auto_877127 ) ( CLEAR ?auto_877126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_877115 ?auto_877116 ?auto_877117 ?auto_877118 ?auto_877119 ?auto_877120 ?auto_877121 ?auto_877122 ?auto_877123 ?auto_877124 ?auto_877125 ?auto_877126 )
      ( MAKE-16PILE ?auto_877115 ?auto_877116 ?auto_877117 ?auto_877118 ?auto_877119 ?auto_877120 ?auto_877121 ?auto_877122 ?auto_877123 ?auto_877124 ?auto_877125 ?auto_877126 ?auto_877127 ?auto_877128 ?auto_877129 ?auto_877130 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_877181 - BLOCK
      ?auto_877182 - BLOCK
      ?auto_877183 - BLOCK
      ?auto_877184 - BLOCK
      ?auto_877185 - BLOCK
      ?auto_877186 - BLOCK
      ?auto_877187 - BLOCK
      ?auto_877188 - BLOCK
      ?auto_877189 - BLOCK
      ?auto_877190 - BLOCK
      ?auto_877191 - BLOCK
      ?auto_877192 - BLOCK
      ?auto_877193 - BLOCK
      ?auto_877194 - BLOCK
      ?auto_877195 - BLOCK
      ?auto_877196 - BLOCK
    )
    :vars
    (
      ?auto_877197 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_877196 ?auto_877197 ) ( ON-TABLE ?auto_877181 ) ( ON ?auto_877182 ?auto_877181 ) ( ON ?auto_877183 ?auto_877182 ) ( ON ?auto_877184 ?auto_877183 ) ( ON ?auto_877185 ?auto_877184 ) ( ON ?auto_877186 ?auto_877185 ) ( ON ?auto_877187 ?auto_877186 ) ( ON ?auto_877188 ?auto_877187 ) ( ON ?auto_877189 ?auto_877188 ) ( ON ?auto_877190 ?auto_877189 ) ( not ( = ?auto_877181 ?auto_877182 ) ) ( not ( = ?auto_877181 ?auto_877183 ) ) ( not ( = ?auto_877181 ?auto_877184 ) ) ( not ( = ?auto_877181 ?auto_877185 ) ) ( not ( = ?auto_877181 ?auto_877186 ) ) ( not ( = ?auto_877181 ?auto_877187 ) ) ( not ( = ?auto_877181 ?auto_877188 ) ) ( not ( = ?auto_877181 ?auto_877189 ) ) ( not ( = ?auto_877181 ?auto_877190 ) ) ( not ( = ?auto_877181 ?auto_877191 ) ) ( not ( = ?auto_877181 ?auto_877192 ) ) ( not ( = ?auto_877181 ?auto_877193 ) ) ( not ( = ?auto_877181 ?auto_877194 ) ) ( not ( = ?auto_877181 ?auto_877195 ) ) ( not ( = ?auto_877181 ?auto_877196 ) ) ( not ( = ?auto_877181 ?auto_877197 ) ) ( not ( = ?auto_877182 ?auto_877183 ) ) ( not ( = ?auto_877182 ?auto_877184 ) ) ( not ( = ?auto_877182 ?auto_877185 ) ) ( not ( = ?auto_877182 ?auto_877186 ) ) ( not ( = ?auto_877182 ?auto_877187 ) ) ( not ( = ?auto_877182 ?auto_877188 ) ) ( not ( = ?auto_877182 ?auto_877189 ) ) ( not ( = ?auto_877182 ?auto_877190 ) ) ( not ( = ?auto_877182 ?auto_877191 ) ) ( not ( = ?auto_877182 ?auto_877192 ) ) ( not ( = ?auto_877182 ?auto_877193 ) ) ( not ( = ?auto_877182 ?auto_877194 ) ) ( not ( = ?auto_877182 ?auto_877195 ) ) ( not ( = ?auto_877182 ?auto_877196 ) ) ( not ( = ?auto_877182 ?auto_877197 ) ) ( not ( = ?auto_877183 ?auto_877184 ) ) ( not ( = ?auto_877183 ?auto_877185 ) ) ( not ( = ?auto_877183 ?auto_877186 ) ) ( not ( = ?auto_877183 ?auto_877187 ) ) ( not ( = ?auto_877183 ?auto_877188 ) ) ( not ( = ?auto_877183 ?auto_877189 ) ) ( not ( = ?auto_877183 ?auto_877190 ) ) ( not ( = ?auto_877183 ?auto_877191 ) ) ( not ( = ?auto_877183 ?auto_877192 ) ) ( not ( = ?auto_877183 ?auto_877193 ) ) ( not ( = ?auto_877183 ?auto_877194 ) ) ( not ( = ?auto_877183 ?auto_877195 ) ) ( not ( = ?auto_877183 ?auto_877196 ) ) ( not ( = ?auto_877183 ?auto_877197 ) ) ( not ( = ?auto_877184 ?auto_877185 ) ) ( not ( = ?auto_877184 ?auto_877186 ) ) ( not ( = ?auto_877184 ?auto_877187 ) ) ( not ( = ?auto_877184 ?auto_877188 ) ) ( not ( = ?auto_877184 ?auto_877189 ) ) ( not ( = ?auto_877184 ?auto_877190 ) ) ( not ( = ?auto_877184 ?auto_877191 ) ) ( not ( = ?auto_877184 ?auto_877192 ) ) ( not ( = ?auto_877184 ?auto_877193 ) ) ( not ( = ?auto_877184 ?auto_877194 ) ) ( not ( = ?auto_877184 ?auto_877195 ) ) ( not ( = ?auto_877184 ?auto_877196 ) ) ( not ( = ?auto_877184 ?auto_877197 ) ) ( not ( = ?auto_877185 ?auto_877186 ) ) ( not ( = ?auto_877185 ?auto_877187 ) ) ( not ( = ?auto_877185 ?auto_877188 ) ) ( not ( = ?auto_877185 ?auto_877189 ) ) ( not ( = ?auto_877185 ?auto_877190 ) ) ( not ( = ?auto_877185 ?auto_877191 ) ) ( not ( = ?auto_877185 ?auto_877192 ) ) ( not ( = ?auto_877185 ?auto_877193 ) ) ( not ( = ?auto_877185 ?auto_877194 ) ) ( not ( = ?auto_877185 ?auto_877195 ) ) ( not ( = ?auto_877185 ?auto_877196 ) ) ( not ( = ?auto_877185 ?auto_877197 ) ) ( not ( = ?auto_877186 ?auto_877187 ) ) ( not ( = ?auto_877186 ?auto_877188 ) ) ( not ( = ?auto_877186 ?auto_877189 ) ) ( not ( = ?auto_877186 ?auto_877190 ) ) ( not ( = ?auto_877186 ?auto_877191 ) ) ( not ( = ?auto_877186 ?auto_877192 ) ) ( not ( = ?auto_877186 ?auto_877193 ) ) ( not ( = ?auto_877186 ?auto_877194 ) ) ( not ( = ?auto_877186 ?auto_877195 ) ) ( not ( = ?auto_877186 ?auto_877196 ) ) ( not ( = ?auto_877186 ?auto_877197 ) ) ( not ( = ?auto_877187 ?auto_877188 ) ) ( not ( = ?auto_877187 ?auto_877189 ) ) ( not ( = ?auto_877187 ?auto_877190 ) ) ( not ( = ?auto_877187 ?auto_877191 ) ) ( not ( = ?auto_877187 ?auto_877192 ) ) ( not ( = ?auto_877187 ?auto_877193 ) ) ( not ( = ?auto_877187 ?auto_877194 ) ) ( not ( = ?auto_877187 ?auto_877195 ) ) ( not ( = ?auto_877187 ?auto_877196 ) ) ( not ( = ?auto_877187 ?auto_877197 ) ) ( not ( = ?auto_877188 ?auto_877189 ) ) ( not ( = ?auto_877188 ?auto_877190 ) ) ( not ( = ?auto_877188 ?auto_877191 ) ) ( not ( = ?auto_877188 ?auto_877192 ) ) ( not ( = ?auto_877188 ?auto_877193 ) ) ( not ( = ?auto_877188 ?auto_877194 ) ) ( not ( = ?auto_877188 ?auto_877195 ) ) ( not ( = ?auto_877188 ?auto_877196 ) ) ( not ( = ?auto_877188 ?auto_877197 ) ) ( not ( = ?auto_877189 ?auto_877190 ) ) ( not ( = ?auto_877189 ?auto_877191 ) ) ( not ( = ?auto_877189 ?auto_877192 ) ) ( not ( = ?auto_877189 ?auto_877193 ) ) ( not ( = ?auto_877189 ?auto_877194 ) ) ( not ( = ?auto_877189 ?auto_877195 ) ) ( not ( = ?auto_877189 ?auto_877196 ) ) ( not ( = ?auto_877189 ?auto_877197 ) ) ( not ( = ?auto_877190 ?auto_877191 ) ) ( not ( = ?auto_877190 ?auto_877192 ) ) ( not ( = ?auto_877190 ?auto_877193 ) ) ( not ( = ?auto_877190 ?auto_877194 ) ) ( not ( = ?auto_877190 ?auto_877195 ) ) ( not ( = ?auto_877190 ?auto_877196 ) ) ( not ( = ?auto_877190 ?auto_877197 ) ) ( not ( = ?auto_877191 ?auto_877192 ) ) ( not ( = ?auto_877191 ?auto_877193 ) ) ( not ( = ?auto_877191 ?auto_877194 ) ) ( not ( = ?auto_877191 ?auto_877195 ) ) ( not ( = ?auto_877191 ?auto_877196 ) ) ( not ( = ?auto_877191 ?auto_877197 ) ) ( not ( = ?auto_877192 ?auto_877193 ) ) ( not ( = ?auto_877192 ?auto_877194 ) ) ( not ( = ?auto_877192 ?auto_877195 ) ) ( not ( = ?auto_877192 ?auto_877196 ) ) ( not ( = ?auto_877192 ?auto_877197 ) ) ( not ( = ?auto_877193 ?auto_877194 ) ) ( not ( = ?auto_877193 ?auto_877195 ) ) ( not ( = ?auto_877193 ?auto_877196 ) ) ( not ( = ?auto_877193 ?auto_877197 ) ) ( not ( = ?auto_877194 ?auto_877195 ) ) ( not ( = ?auto_877194 ?auto_877196 ) ) ( not ( = ?auto_877194 ?auto_877197 ) ) ( not ( = ?auto_877195 ?auto_877196 ) ) ( not ( = ?auto_877195 ?auto_877197 ) ) ( not ( = ?auto_877196 ?auto_877197 ) ) ( ON ?auto_877195 ?auto_877196 ) ( ON ?auto_877194 ?auto_877195 ) ( ON ?auto_877193 ?auto_877194 ) ( ON ?auto_877192 ?auto_877193 ) ( CLEAR ?auto_877190 ) ( ON ?auto_877191 ?auto_877192 ) ( CLEAR ?auto_877191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_877181 ?auto_877182 ?auto_877183 ?auto_877184 ?auto_877185 ?auto_877186 ?auto_877187 ?auto_877188 ?auto_877189 ?auto_877190 ?auto_877191 )
      ( MAKE-16PILE ?auto_877181 ?auto_877182 ?auto_877183 ?auto_877184 ?auto_877185 ?auto_877186 ?auto_877187 ?auto_877188 ?auto_877189 ?auto_877190 ?auto_877191 ?auto_877192 ?auto_877193 ?auto_877194 ?auto_877195 ?auto_877196 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_877247 - BLOCK
      ?auto_877248 - BLOCK
      ?auto_877249 - BLOCK
      ?auto_877250 - BLOCK
      ?auto_877251 - BLOCK
      ?auto_877252 - BLOCK
      ?auto_877253 - BLOCK
      ?auto_877254 - BLOCK
      ?auto_877255 - BLOCK
      ?auto_877256 - BLOCK
      ?auto_877257 - BLOCK
      ?auto_877258 - BLOCK
      ?auto_877259 - BLOCK
      ?auto_877260 - BLOCK
      ?auto_877261 - BLOCK
      ?auto_877262 - BLOCK
    )
    :vars
    (
      ?auto_877263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_877262 ?auto_877263 ) ( ON-TABLE ?auto_877247 ) ( ON ?auto_877248 ?auto_877247 ) ( ON ?auto_877249 ?auto_877248 ) ( ON ?auto_877250 ?auto_877249 ) ( ON ?auto_877251 ?auto_877250 ) ( ON ?auto_877252 ?auto_877251 ) ( ON ?auto_877253 ?auto_877252 ) ( ON ?auto_877254 ?auto_877253 ) ( ON ?auto_877255 ?auto_877254 ) ( not ( = ?auto_877247 ?auto_877248 ) ) ( not ( = ?auto_877247 ?auto_877249 ) ) ( not ( = ?auto_877247 ?auto_877250 ) ) ( not ( = ?auto_877247 ?auto_877251 ) ) ( not ( = ?auto_877247 ?auto_877252 ) ) ( not ( = ?auto_877247 ?auto_877253 ) ) ( not ( = ?auto_877247 ?auto_877254 ) ) ( not ( = ?auto_877247 ?auto_877255 ) ) ( not ( = ?auto_877247 ?auto_877256 ) ) ( not ( = ?auto_877247 ?auto_877257 ) ) ( not ( = ?auto_877247 ?auto_877258 ) ) ( not ( = ?auto_877247 ?auto_877259 ) ) ( not ( = ?auto_877247 ?auto_877260 ) ) ( not ( = ?auto_877247 ?auto_877261 ) ) ( not ( = ?auto_877247 ?auto_877262 ) ) ( not ( = ?auto_877247 ?auto_877263 ) ) ( not ( = ?auto_877248 ?auto_877249 ) ) ( not ( = ?auto_877248 ?auto_877250 ) ) ( not ( = ?auto_877248 ?auto_877251 ) ) ( not ( = ?auto_877248 ?auto_877252 ) ) ( not ( = ?auto_877248 ?auto_877253 ) ) ( not ( = ?auto_877248 ?auto_877254 ) ) ( not ( = ?auto_877248 ?auto_877255 ) ) ( not ( = ?auto_877248 ?auto_877256 ) ) ( not ( = ?auto_877248 ?auto_877257 ) ) ( not ( = ?auto_877248 ?auto_877258 ) ) ( not ( = ?auto_877248 ?auto_877259 ) ) ( not ( = ?auto_877248 ?auto_877260 ) ) ( not ( = ?auto_877248 ?auto_877261 ) ) ( not ( = ?auto_877248 ?auto_877262 ) ) ( not ( = ?auto_877248 ?auto_877263 ) ) ( not ( = ?auto_877249 ?auto_877250 ) ) ( not ( = ?auto_877249 ?auto_877251 ) ) ( not ( = ?auto_877249 ?auto_877252 ) ) ( not ( = ?auto_877249 ?auto_877253 ) ) ( not ( = ?auto_877249 ?auto_877254 ) ) ( not ( = ?auto_877249 ?auto_877255 ) ) ( not ( = ?auto_877249 ?auto_877256 ) ) ( not ( = ?auto_877249 ?auto_877257 ) ) ( not ( = ?auto_877249 ?auto_877258 ) ) ( not ( = ?auto_877249 ?auto_877259 ) ) ( not ( = ?auto_877249 ?auto_877260 ) ) ( not ( = ?auto_877249 ?auto_877261 ) ) ( not ( = ?auto_877249 ?auto_877262 ) ) ( not ( = ?auto_877249 ?auto_877263 ) ) ( not ( = ?auto_877250 ?auto_877251 ) ) ( not ( = ?auto_877250 ?auto_877252 ) ) ( not ( = ?auto_877250 ?auto_877253 ) ) ( not ( = ?auto_877250 ?auto_877254 ) ) ( not ( = ?auto_877250 ?auto_877255 ) ) ( not ( = ?auto_877250 ?auto_877256 ) ) ( not ( = ?auto_877250 ?auto_877257 ) ) ( not ( = ?auto_877250 ?auto_877258 ) ) ( not ( = ?auto_877250 ?auto_877259 ) ) ( not ( = ?auto_877250 ?auto_877260 ) ) ( not ( = ?auto_877250 ?auto_877261 ) ) ( not ( = ?auto_877250 ?auto_877262 ) ) ( not ( = ?auto_877250 ?auto_877263 ) ) ( not ( = ?auto_877251 ?auto_877252 ) ) ( not ( = ?auto_877251 ?auto_877253 ) ) ( not ( = ?auto_877251 ?auto_877254 ) ) ( not ( = ?auto_877251 ?auto_877255 ) ) ( not ( = ?auto_877251 ?auto_877256 ) ) ( not ( = ?auto_877251 ?auto_877257 ) ) ( not ( = ?auto_877251 ?auto_877258 ) ) ( not ( = ?auto_877251 ?auto_877259 ) ) ( not ( = ?auto_877251 ?auto_877260 ) ) ( not ( = ?auto_877251 ?auto_877261 ) ) ( not ( = ?auto_877251 ?auto_877262 ) ) ( not ( = ?auto_877251 ?auto_877263 ) ) ( not ( = ?auto_877252 ?auto_877253 ) ) ( not ( = ?auto_877252 ?auto_877254 ) ) ( not ( = ?auto_877252 ?auto_877255 ) ) ( not ( = ?auto_877252 ?auto_877256 ) ) ( not ( = ?auto_877252 ?auto_877257 ) ) ( not ( = ?auto_877252 ?auto_877258 ) ) ( not ( = ?auto_877252 ?auto_877259 ) ) ( not ( = ?auto_877252 ?auto_877260 ) ) ( not ( = ?auto_877252 ?auto_877261 ) ) ( not ( = ?auto_877252 ?auto_877262 ) ) ( not ( = ?auto_877252 ?auto_877263 ) ) ( not ( = ?auto_877253 ?auto_877254 ) ) ( not ( = ?auto_877253 ?auto_877255 ) ) ( not ( = ?auto_877253 ?auto_877256 ) ) ( not ( = ?auto_877253 ?auto_877257 ) ) ( not ( = ?auto_877253 ?auto_877258 ) ) ( not ( = ?auto_877253 ?auto_877259 ) ) ( not ( = ?auto_877253 ?auto_877260 ) ) ( not ( = ?auto_877253 ?auto_877261 ) ) ( not ( = ?auto_877253 ?auto_877262 ) ) ( not ( = ?auto_877253 ?auto_877263 ) ) ( not ( = ?auto_877254 ?auto_877255 ) ) ( not ( = ?auto_877254 ?auto_877256 ) ) ( not ( = ?auto_877254 ?auto_877257 ) ) ( not ( = ?auto_877254 ?auto_877258 ) ) ( not ( = ?auto_877254 ?auto_877259 ) ) ( not ( = ?auto_877254 ?auto_877260 ) ) ( not ( = ?auto_877254 ?auto_877261 ) ) ( not ( = ?auto_877254 ?auto_877262 ) ) ( not ( = ?auto_877254 ?auto_877263 ) ) ( not ( = ?auto_877255 ?auto_877256 ) ) ( not ( = ?auto_877255 ?auto_877257 ) ) ( not ( = ?auto_877255 ?auto_877258 ) ) ( not ( = ?auto_877255 ?auto_877259 ) ) ( not ( = ?auto_877255 ?auto_877260 ) ) ( not ( = ?auto_877255 ?auto_877261 ) ) ( not ( = ?auto_877255 ?auto_877262 ) ) ( not ( = ?auto_877255 ?auto_877263 ) ) ( not ( = ?auto_877256 ?auto_877257 ) ) ( not ( = ?auto_877256 ?auto_877258 ) ) ( not ( = ?auto_877256 ?auto_877259 ) ) ( not ( = ?auto_877256 ?auto_877260 ) ) ( not ( = ?auto_877256 ?auto_877261 ) ) ( not ( = ?auto_877256 ?auto_877262 ) ) ( not ( = ?auto_877256 ?auto_877263 ) ) ( not ( = ?auto_877257 ?auto_877258 ) ) ( not ( = ?auto_877257 ?auto_877259 ) ) ( not ( = ?auto_877257 ?auto_877260 ) ) ( not ( = ?auto_877257 ?auto_877261 ) ) ( not ( = ?auto_877257 ?auto_877262 ) ) ( not ( = ?auto_877257 ?auto_877263 ) ) ( not ( = ?auto_877258 ?auto_877259 ) ) ( not ( = ?auto_877258 ?auto_877260 ) ) ( not ( = ?auto_877258 ?auto_877261 ) ) ( not ( = ?auto_877258 ?auto_877262 ) ) ( not ( = ?auto_877258 ?auto_877263 ) ) ( not ( = ?auto_877259 ?auto_877260 ) ) ( not ( = ?auto_877259 ?auto_877261 ) ) ( not ( = ?auto_877259 ?auto_877262 ) ) ( not ( = ?auto_877259 ?auto_877263 ) ) ( not ( = ?auto_877260 ?auto_877261 ) ) ( not ( = ?auto_877260 ?auto_877262 ) ) ( not ( = ?auto_877260 ?auto_877263 ) ) ( not ( = ?auto_877261 ?auto_877262 ) ) ( not ( = ?auto_877261 ?auto_877263 ) ) ( not ( = ?auto_877262 ?auto_877263 ) ) ( ON ?auto_877261 ?auto_877262 ) ( ON ?auto_877260 ?auto_877261 ) ( ON ?auto_877259 ?auto_877260 ) ( ON ?auto_877258 ?auto_877259 ) ( ON ?auto_877257 ?auto_877258 ) ( CLEAR ?auto_877255 ) ( ON ?auto_877256 ?auto_877257 ) ( CLEAR ?auto_877256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_877247 ?auto_877248 ?auto_877249 ?auto_877250 ?auto_877251 ?auto_877252 ?auto_877253 ?auto_877254 ?auto_877255 ?auto_877256 )
      ( MAKE-16PILE ?auto_877247 ?auto_877248 ?auto_877249 ?auto_877250 ?auto_877251 ?auto_877252 ?auto_877253 ?auto_877254 ?auto_877255 ?auto_877256 ?auto_877257 ?auto_877258 ?auto_877259 ?auto_877260 ?auto_877261 ?auto_877262 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_877313 - BLOCK
      ?auto_877314 - BLOCK
      ?auto_877315 - BLOCK
      ?auto_877316 - BLOCK
      ?auto_877317 - BLOCK
      ?auto_877318 - BLOCK
      ?auto_877319 - BLOCK
      ?auto_877320 - BLOCK
      ?auto_877321 - BLOCK
      ?auto_877322 - BLOCK
      ?auto_877323 - BLOCK
      ?auto_877324 - BLOCK
      ?auto_877325 - BLOCK
      ?auto_877326 - BLOCK
      ?auto_877327 - BLOCK
      ?auto_877328 - BLOCK
    )
    :vars
    (
      ?auto_877329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_877328 ?auto_877329 ) ( ON-TABLE ?auto_877313 ) ( ON ?auto_877314 ?auto_877313 ) ( ON ?auto_877315 ?auto_877314 ) ( ON ?auto_877316 ?auto_877315 ) ( ON ?auto_877317 ?auto_877316 ) ( ON ?auto_877318 ?auto_877317 ) ( ON ?auto_877319 ?auto_877318 ) ( ON ?auto_877320 ?auto_877319 ) ( not ( = ?auto_877313 ?auto_877314 ) ) ( not ( = ?auto_877313 ?auto_877315 ) ) ( not ( = ?auto_877313 ?auto_877316 ) ) ( not ( = ?auto_877313 ?auto_877317 ) ) ( not ( = ?auto_877313 ?auto_877318 ) ) ( not ( = ?auto_877313 ?auto_877319 ) ) ( not ( = ?auto_877313 ?auto_877320 ) ) ( not ( = ?auto_877313 ?auto_877321 ) ) ( not ( = ?auto_877313 ?auto_877322 ) ) ( not ( = ?auto_877313 ?auto_877323 ) ) ( not ( = ?auto_877313 ?auto_877324 ) ) ( not ( = ?auto_877313 ?auto_877325 ) ) ( not ( = ?auto_877313 ?auto_877326 ) ) ( not ( = ?auto_877313 ?auto_877327 ) ) ( not ( = ?auto_877313 ?auto_877328 ) ) ( not ( = ?auto_877313 ?auto_877329 ) ) ( not ( = ?auto_877314 ?auto_877315 ) ) ( not ( = ?auto_877314 ?auto_877316 ) ) ( not ( = ?auto_877314 ?auto_877317 ) ) ( not ( = ?auto_877314 ?auto_877318 ) ) ( not ( = ?auto_877314 ?auto_877319 ) ) ( not ( = ?auto_877314 ?auto_877320 ) ) ( not ( = ?auto_877314 ?auto_877321 ) ) ( not ( = ?auto_877314 ?auto_877322 ) ) ( not ( = ?auto_877314 ?auto_877323 ) ) ( not ( = ?auto_877314 ?auto_877324 ) ) ( not ( = ?auto_877314 ?auto_877325 ) ) ( not ( = ?auto_877314 ?auto_877326 ) ) ( not ( = ?auto_877314 ?auto_877327 ) ) ( not ( = ?auto_877314 ?auto_877328 ) ) ( not ( = ?auto_877314 ?auto_877329 ) ) ( not ( = ?auto_877315 ?auto_877316 ) ) ( not ( = ?auto_877315 ?auto_877317 ) ) ( not ( = ?auto_877315 ?auto_877318 ) ) ( not ( = ?auto_877315 ?auto_877319 ) ) ( not ( = ?auto_877315 ?auto_877320 ) ) ( not ( = ?auto_877315 ?auto_877321 ) ) ( not ( = ?auto_877315 ?auto_877322 ) ) ( not ( = ?auto_877315 ?auto_877323 ) ) ( not ( = ?auto_877315 ?auto_877324 ) ) ( not ( = ?auto_877315 ?auto_877325 ) ) ( not ( = ?auto_877315 ?auto_877326 ) ) ( not ( = ?auto_877315 ?auto_877327 ) ) ( not ( = ?auto_877315 ?auto_877328 ) ) ( not ( = ?auto_877315 ?auto_877329 ) ) ( not ( = ?auto_877316 ?auto_877317 ) ) ( not ( = ?auto_877316 ?auto_877318 ) ) ( not ( = ?auto_877316 ?auto_877319 ) ) ( not ( = ?auto_877316 ?auto_877320 ) ) ( not ( = ?auto_877316 ?auto_877321 ) ) ( not ( = ?auto_877316 ?auto_877322 ) ) ( not ( = ?auto_877316 ?auto_877323 ) ) ( not ( = ?auto_877316 ?auto_877324 ) ) ( not ( = ?auto_877316 ?auto_877325 ) ) ( not ( = ?auto_877316 ?auto_877326 ) ) ( not ( = ?auto_877316 ?auto_877327 ) ) ( not ( = ?auto_877316 ?auto_877328 ) ) ( not ( = ?auto_877316 ?auto_877329 ) ) ( not ( = ?auto_877317 ?auto_877318 ) ) ( not ( = ?auto_877317 ?auto_877319 ) ) ( not ( = ?auto_877317 ?auto_877320 ) ) ( not ( = ?auto_877317 ?auto_877321 ) ) ( not ( = ?auto_877317 ?auto_877322 ) ) ( not ( = ?auto_877317 ?auto_877323 ) ) ( not ( = ?auto_877317 ?auto_877324 ) ) ( not ( = ?auto_877317 ?auto_877325 ) ) ( not ( = ?auto_877317 ?auto_877326 ) ) ( not ( = ?auto_877317 ?auto_877327 ) ) ( not ( = ?auto_877317 ?auto_877328 ) ) ( not ( = ?auto_877317 ?auto_877329 ) ) ( not ( = ?auto_877318 ?auto_877319 ) ) ( not ( = ?auto_877318 ?auto_877320 ) ) ( not ( = ?auto_877318 ?auto_877321 ) ) ( not ( = ?auto_877318 ?auto_877322 ) ) ( not ( = ?auto_877318 ?auto_877323 ) ) ( not ( = ?auto_877318 ?auto_877324 ) ) ( not ( = ?auto_877318 ?auto_877325 ) ) ( not ( = ?auto_877318 ?auto_877326 ) ) ( not ( = ?auto_877318 ?auto_877327 ) ) ( not ( = ?auto_877318 ?auto_877328 ) ) ( not ( = ?auto_877318 ?auto_877329 ) ) ( not ( = ?auto_877319 ?auto_877320 ) ) ( not ( = ?auto_877319 ?auto_877321 ) ) ( not ( = ?auto_877319 ?auto_877322 ) ) ( not ( = ?auto_877319 ?auto_877323 ) ) ( not ( = ?auto_877319 ?auto_877324 ) ) ( not ( = ?auto_877319 ?auto_877325 ) ) ( not ( = ?auto_877319 ?auto_877326 ) ) ( not ( = ?auto_877319 ?auto_877327 ) ) ( not ( = ?auto_877319 ?auto_877328 ) ) ( not ( = ?auto_877319 ?auto_877329 ) ) ( not ( = ?auto_877320 ?auto_877321 ) ) ( not ( = ?auto_877320 ?auto_877322 ) ) ( not ( = ?auto_877320 ?auto_877323 ) ) ( not ( = ?auto_877320 ?auto_877324 ) ) ( not ( = ?auto_877320 ?auto_877325 ) ) ( not ( = ?auto_877320 ?auto_877326 ) ) ( not ( = ?auto_877320 ?auto_877327 ) ) ( not ( = ?auto_877320 ?auto_877328 ) ) ( not ( = ?auto_877320 ?auto_877329 ) ) ( not ( = ?auto_877321 ?auto_877322 ) ) ( not ( = ?auto_877321 ?auto_877323 ) ) ( not ( = ?auto_877321 ?auto_877324 ) ) ( not ( = ?auto_877321 ?auto_877325 ) ) ( not ( = ?auto_877321 ?auto_877326 ) ) ( not ( = ?auto_877321 ?auto_877327 ) ) ( not ( = ?auto_877321 ?auto_877328 ) ) ( not ( = ?auto_877321 ?auto_877329 ) ) ( not ( = ?auto_877322 ?auto_877323 ) ) ( not ( = ?auto_877322 ?auto_877324 ) ) ( not ( = ?auto_877322 ?auto_877325 ) ) ( not ( = ?auto_877322 ?auto_877326 ) ) ( not ( = ?auto_877322 ?auto_877327 ) ) ( not ( = ?auto_877322 ?auto_877328 ) ) ( not ( = ?auto_877322 ?auto_877329 ) ) ( not ( = ?auto_877323 ?auto_877324 ) ) ( not ( = ?auto_877323 ?auto_877325 ) ) ( not ( = ?auto_877323 ?auto_877326 ) ) ( not ( = ?auto_877323 ?auto_877327 ) ) ( not ( = ?auto_877323 ?auto_877328 ) ) ( not ( = ?auto_877323 ?auto_877329 ) ) ( not ( = ?auto_877324 ?auto_877325 ) ) ( not ( = ?auto_877324 ?auto_877326 ) ) ( not ( = ?auto_877324 ?auto_877327 ) ) ( not ( = ?auto_877324 ?auto_877328 ) ) ( not ( = ?auto_877324 ?auto_877329 ) ) ( not ( = ?auto_877325 ?auto_877326 ) ) ( not ( = ?auto_877325 ?auto_877327 ) ) ( not ( = ?auto_877325 ?auto_877328 ) ) ( not ( = ?auto_877325 ?auto_877329 ) ) ( not ( = ?auto_877326 ?auto_877327 ) ) ( not ( = ?auto_877326 ?auto_877328 ) ) ( not ( = ?auto_877326 ?auto_877329 ) ) ( not ( = ?auto_877327 ?auto_877328 ) ) ( not ( = ?auto_877327 ?auto_877329 ) ) ( not ( = ?auto_877328 ?auto_877329 ) ) ( ON ?auto_877327 ?auto_877328 ) ( ON ?auto_877326 ?auto_877327 ) ( ON ?auto_877325 ?auto_877326 ) ( ON ?auto_877324 ?auto_877325 ) ( ON ?auto_877323 ?auto_877324 ) ( ON ?auto_877322 ?auto_877323 ) ( CLEAR ?auto_877320 ) ( ON ?auto_877321 ?auto_877322 ) ( CLEAR ?auto_877321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_877313 ?auto_877314 ?auto_877315 ?auto_877316 ?auto_877317 ?auto_877318 ?auto_877319 ?auto_877320 ?auto_877321 )
      ( MAKE-16PILE ?auto_877313 ?auto_877314 ?auto_877315 ?auto_877316 ?auto_877317 ?auto_877318 ?auto_877319 ?auto_877320 ?auto_877321 ?auto_877322 ?auto_877323 ?auto_877324 ?auto_877325 ?auto_877326 ?auto_877327 ?auto_877328 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_877379 - BLOCK
      ?auto_877380 - BLOCK
      ?auto_877381 - BLOCK
      ?auto_877382 - BLOCK
      ?auto_877383 - BLOCK
      ?auto_877384 - BLOCK
      ?auto_877385 - BLOCK
      ?auto_877386 - BLOCK
      ?auto_877387 - BLOCK
      ?auto_877388 - BLOCK
      ?auto_877389 - BLOCK
      ?auto_877390 - BLOCK
      ?auto_877391 - BLOCK
      ?auto_877392 - BLOCK
      ?auto_877393 - BLOCK
      ?auto_877394 - BLOCK
    )
    :vars
    (
      ?auto_877395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_877394 ?auto_877395 ) ( ON-TABLE ?auto_877379 ) ( ON ?auto_877380 ?auto_877379 ) ( ON ?auto_877381 ?auto_877380 ) ( ON ?auto_877382 ?auto_877381 ) ( ON ?auto_877383 ?auto_877382 ) ( ON ?auto_877384 ?auto_877383 ) ( ON ?auto_877385 ?auto_877384 ) ( not ( = ?auto_877379 ?auto_877380 ) ) ( not ( = ?auto_877379 ?auto_877381 ) ) ( not ( = ?auto_877379 ?auto_877382 ) ) ( not ( = ?auto_877379 ?auto_877383 ) ) ( not ( = ?auto_877379 ?auto_877384 ) ) ( not ( = ?auto_877379 ?auto_877385 ) ) ( not ( = ?auto_877379 ?auto_877386 ) ) ( not ( = ?auto_877379 ?auto_877387 ) ) ( not ( = ?auto_877379 ?auto_877388 ) ) ( not ( = ?auto_877379 ?auto_877389 ) ) ( not ( = ?auto_877379 ?auto_877390 ) ) ( not ( = ?auto_877379 ?auto_877391 ) ) ( not ( = ?auto_877379 ?auto_877392 ) ) ( not ( = ?auto_877379 ?auto_877393 ) ) ( not ( = ?auto_877379 ?auto_877394 ) ) ( not ( = ?auto_877379 ?auto_877395 ) ) ( not ( = ?auto_877380 ?auto_877381 ) ) ( not ( = ?auto_877380 ?auto_877382 ) ) ( not ( = ?auto_877380 ?auto_877383 ) ) ( not ( = ?auto_877380 ?auto_877384 ) ) ( not ( = ?auto_877380 ?auto_877385 ) ) ( not ( = ?auto_877380 ?auto_877386 ) ) ( not ( = ?auto_877380 ?auto_877387 ) ) ( not ( = ?auto_877380 ?auto_877388 ) ) ( not ( = ?auto_877380 ?auto_877389 ) ) ( not ( = ?auto_877380 ?auto_877390 ) ) ( not ( = ?auto_877380 ?auto_877391 ) ) ( not ( = ?auto_877380 ?auto_877392 ) ) ( not ( = ?auto_877380 ?auto_877393 ) ) ( not ( = ?auto_877380 ?auto_877394 ) ) ( not ( = ?auto_877380 ?auto_877395 ) ) ( not ( = ?auto_877381 ?auto_877382 ) ) ( not ( = ?auto_877381 ?auto_877383 ) ) ( not ( = ?auto_877381 ?auto_877384 ) ) ( not ( = ?auto_877381 ?auto_877385 ) ) ( not ( = ?auto_877381 ?auto_877386 ) ) ( not ( = ?auto_877381 ?auto_877387 ) ) ( not ( = ?auto_877381 ?auto_877388 ) ) ( not ( = ?auto_877381 ?auto_877389 ) ) ( not ( = ?auto_877381 ?auto_877390 ) ) ( not ( = ?auto_877381 ?auto_877391 ) ) ( not ( = ?auto_877381 ?auto_877392 ) ) ( not ( = ?auto_877381 ?auto_877393 ) ) ( not ( = ?auto_877381 ?auto_877394 ) ) ( not ( = ?auto_877381 ?auto_877395 ) ) ( not ( = ?auto_877382 ?auto_877383 ) ) ( not ( = ?auto_877382 ?auto_877384 ) ) ( not ( = ?auto_877382 ?auto_877385 ) ) ( not ( = ?auto_877382 ?auto_877386 ) ) ( not ( = ?auto_877382 ?auto_877387 ) ) ( not ( = ?auto_877382 ?auto_877388 ) ) ( not ( = ?auto_877382 ?auto_877389 ) ) ( not ( = ?auto_877382 ?auto_877390 ) ) ( not ( = ?auto_877382 ?auto_877391 ) ) ( not ( = ?auto_877382 ?auto_877392 ) ) ( not ( = ?auto_877382 ?auto_877393 ) ) ( not ( = ?auto_877382 ?auto_877394 ) ) ( not ( = ?auto_877382 ?auto_877395 ) ) ( not ( = ?auto_877383 ?auto_877384 ) ) ( not ( = ?auto_877383 ?auto_877385 ) ) ( not ( = ?auto_877383 ?auto_877386 ) ) ( not ( = ?auto_877383 ?auto_877387 ) ) ( not ( = ?auto_877383 ?auto_877388 ) ) ( not ( = ?auto_877383 ?auto_877389 ) ) ( not ( = ?auto_877383 ?auto_877390 ) ) ( not ( = ?auto_877383 ?auto_877391 ) ) ( not ( = ?auto_877383 ?auto_877392 ) ) ( not ( = ?auto_877383 ?auto_877393 ) ) ( not ( = ?auto_877383 ?auto_877394 ) ) ( not ( = ?auto_877383 ?auto_877395 ) ) ( not ( = ?auto_877384 ?auto_877385 ) ) ( not ( = ?auto_877384 ?auto_877386 ) ) ( not ( = ?auto_877384 ?auto_877387 ) ) ( not ( = ?auto_877384 ?auto_877388 ) ) ( not ( = ?auto_877384 ?auto_877389 ) ) ( not ( = ?auto_877384 ?auto_877390 ) ) ( not ( = ?auto_877384 ?auto_877391 ) ) ( not ( = ?auto_877384 ?auto_877392 ) ) ( not ( = ?auto_877384 ?auto_877393 ) ) ( not ( = ?auto_877384 ?auto_877394 ) ) ( not ( = ?auto_877384 ?auto_877395 ) ) ( not ( = ?auto_877385 ?auto_877386 ) ) ( not ( = ?auto_877385 ?auto_877387 ) ) ( not ( = ?auto_877385 ?auto_877388 ) ) ( not ( = ?auto_877385 ?auto_877389 ) ) ( not ( = ?auto_877385 ?auto_877390 ) ) ( not ( = ?auto_877385 ?auto_877391 ) ) ( not ( = ?auto_877385 ?auto_877392 ) ) ( not ( = ?auto_877385 ?auto_877393 ) ) ( not ( = ?auto_877385 ?auto_877394 ) ) ( not ( = ?auto_877385 ?auto_877395 ) ) ( not ( = ?auto_877386 ?auto_877387 ) ) ( not ( = ?auto_877386 ?auto_877388 ) ) ( not ( = ?auto_877386 ?auto_877389 ) ) ( not ( = ?auto_877386 ?auto_877390 ) ) ( not ( = ?auto_877386 ?auto_877391 ) ) ( not ( = ?auto_877386 ?auto_877392 ) ) ( not ( = ?auto_877386 ?auto_877393 ) ) ( not ( = ?auto_877386 ?auto_877394 ) ) ( not ( = ?auto_877386 ?auto_877395 ) ) ( not ( = ?auto_877387 ?auto_877388 ) ) ( not ( = ?auto_877387 ?auto_877389 ) ) ( not ( = ?auto_877387 ?auto_877390 ) ) ( not ( = ?auto_877387 ?auto_877391 ) ) ( not ( = ?auto_877387 ?auto_877392 ) ) ( not ( = ?auto_877387 ?auto_877393 ) ) ( not ( = ?auto_877387 ?auto_877394 ) ) ( not ( = ?auto_877387 ?auto_877395 ) ) ( not ( = ?auto_877388 ?auto_877389 ) ) ( not ( = ?auto_877388 ?auto_877390 ) ) ( not ( = ?auto_877388 ?auto_877391 ) ) ( not ( = ?auto_877388 ?auto_877392 ) ) ( not ( = ?auto_877388 ?auto_877393 ) ) ( not ( = ?auto_877388 ?auto_877394 ) ) ( not ( = ?auto_877388 ?auto_877395 ) ) ( not ( = ?auto_877389 ?auto_877390 ) ) ( not ( = ?auto_877389 ?auto_877391 ) ) ( not ( = ?auto_877389 ?auto_877392 ) ) ( not ( = ?auto_877389 ?auto_877393 ) ) ( not ( = ?auto_877389 ?auto_877394 ) ) ( not ( = ?auto_877389 ?auto_877395 ) ) ( not ( = ?auto_877390 ?auto_877391 ) ) ( not ( = ?auto_877390 ?auto_877392 ) ) ( not ( = ?auto_877390 ?auto_877393 ) ) ( not ( = ?auto_877390 ?auto_877394 ) ) ( not ( = ?auto_877390 ?auto_877395 ) ) ( not ( = ?auto_877391 ?auto_877392 ) ) ( not ( = ?auto_877391 ?auto_877393 ) ) ( not ( = ?auto_877391 ?auto_877394 ) ) ( not ( = ?auto_877391 ?auto_877395 ) ) ( not ( = ?auto_877392 ?auto_877393 ) ) ( not ( = ?auto_877392 ?auto_877394 ) ) ( not ( = ?auto_877392 ?auto_877395 ) ) ( not ( = ?auto_877393 ?auto_877394 ) ) ( not ( = ?auto_877393 ?auto_877395 ) ) ( not ( = ?auto_877394 ?auto_877395 ) ) ( ON ?auto_877393 ?auto_877394 ) ( ON ?auto_877392 ?auto_877393 ) ( ON ?auto_877391 ?auto_877392 ) ( ON ?auto_877390 ?auto_877391 ) ( ON ?auto_877389 ?auto_877390 ) ( ON ?auto_877388 ?auto_877389 ) ( ON ?auto_877387 ?auto_877388 ) ( CLEAR ?auto_877385 ) ( ON ?auto_877386 ?auto_877387 ) ( CLEAR ?auto_877386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_877379 ?auto_877380 ?auto_877381 ?auto_877382 ?auto_877383 ?auto_877384 ?auto_877385 ?auto_877386 )
      ( MAKE-16PILE ?auto_877379 ?auto_877380 ?auto_877381 ?auto_877382 ?auto_877383 ?auto_877384 ?auto_877385 ?auto_877386 ?auto_877387 ?auto_877388 ?auto_877389 ?auto_877390 ?auto_877391 ?auto_877392 ?auto_877393 ?auto_877394 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_877445 - BLOCK
      ?auto_877446 - BLOCK
      ?auto_877447 - BLOCK
      ?auto_877448 - BLOCK
      ?auto_877449 - BLOCK
      ?auto_877450 - BLOCK
      ?auto_877451 - BLOCK
      ?auto_877452 - BLOCK
      ?auto_877453 - BLOCK
      ?auto_877454 - BLOCK
      ?auto_877455 - BLOCK
      ?auto_877456 - BLOCK
      ?auto_877457 - BLOCK
      ?auto_877458 - BLOCK
      ?auto_877459 - BLOCK
      ?auto_877460 - BLOCK
    )
    :vars
    (
      ?auto_877461 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_877460 ?auto_877461 ) ( ON-TABLE ?auto_877445 ) ( ON ?auto_877446 ?auto_877445 ) ( ON ?auto_877447 ?auto_877446 ) ( ON ?auto_877448 ?auto_877447 ) ( ON ?auto_877449 ?auto_877448 ) ( ON ?auto_877450 ?auto_877449 ) ( not ( = ?auto_877445 ?auto_877446 ) ) ( not ( = ?auto_877445 ?auto_877447 ) ) ( not ( = ?auto_877445 ?auto_877448 ) ) ( not ( = ?auto_877445 ?auto_877449 ) ) ( not ( = ?auto_877445 ?auto_877450 ) ) ( not ( = ?auto_877445 ?auto_877451 ) ) ( not ( = ?auto_877445 ?auto_877452 ) ) ( not ( = ?auto_877445 ?auto_877453 ) ) ( not ( = ?auto_877445 ?auto_877454 ) ) ( not ( = ?auto_877445 ?auto_877455 ) ) ( not ( = ?auto_877445 ?auto_877456 ) ) ( not ( = ?auto_877445 ?auto_877457 ) ) ( not ( = ?auto_877445 ?auto_877458 ) ) ( not ( = ?auto_877445 ?auto_877459 ) ) ( not ( = ?auto_877445 ?auto_877460 ) ) ( not ( = ?auto_877445 ?auto_877461 ) ) ( not ( = ?auto_877446 ?auto_877447 ) ) ( not ( = ?auto_877446 ?auto_877448 ) ) ( not ( = ?auto_877446 ?auto_877449 ) ) ( not ( = ?auto_877446 ?auto_877450 ) ) ( not ( = ?auto_877446 ?auto_877451 ) ) ( not ( = ?auto_877446 ?auto_877452 ) ) ( not ( = ?auto_877446 ?auto_877453 ) ) ( not ( = ?auto_877446 ?auto_877454 ) ) ( not ( = ?auto_877446 ?auto_877455 ) ) ( not ( = ?auto_877446 ?auto_877456 ) ) ( not ( = ?auto_877446 ?auto_877457 ) ) ( not ( = ?auto_877446 ?auto_877458 ) ) ( not ( = ?auto_877446 ?auto_877459 ) ) ( not ( = ?auto_877446 ?auto_877460 ) ) ( not ( = ?auto_877446 ?auto_877461 ) ) ( not ( = ?auto_877447 ?auto_877448 ) ) ( not ( = ?auto_877447 ?auto_877449 ) ) ( not ( = ?auto_877447 ?auto_877450 ) ) ( not ( = ?auto_877447 ?auto_877451 ) ) ( not ( = ?auto_877447 ?auto_877452 ) ) ( not ( = ?auto_877447 ?auto_877453 ) ) ( not ( = ?auto_877447 ?auto_877454 ) ) ( not ( = ?auto_877447 ?auto_877455 ) ) ( not ( = ?auto_877447 ?auto_877456 ) ) ( not ( = ?auto_877447 ?auto_877457 ) ) ( not ( = ?auto_877447 ?auto_877458 ) ) ( not ( = ?auto_877447 ?auto_877459 ) ) ( not ( = ?auto_877447 ?auto_877460 ) ) ( not ( = ?auto_877447 ?auto_877461 ) ) ( not ( = ?auto_877448 ?auto_877449 ) ) ( not ( = ?auto_877448 ?auto_877450 ) ) ( not ( = ?auto_877448 ?auto_877451 ) ) ( not ( = ?auto_877448 ?auto_877452 ) ) ( not ( = ?auto_877448 ?auto_877453 ) ) ( not ( = ?auto_877448 ?auto_877454 ) ) ( not ( = ?auto_877448 ?auto_877455 ) ) ( not ( = ?auto_877448 ?auto_877456 ) ) ( not ( = ?auto_877448 ?auto_877457 ) ) ( not ( = ?auto_877448 ?auto_877458 ) ) ( not ( = ?auto_877448 ?auto_877459 ) ) ( not ( = ?auto_877448 ?auto_877460 ) ) ( not ( = ?auto_877448 ?auto_877461 ) ) ( not ( = ?auto_877449 ?auto_877450 ) ) ( not ( = ?auto_877449 ?auto_877451 ) ) ( not ( = ?auto_877449 ?auto_877452 ) ) ( not ( = ?auto_877449 ?auto_877453 ) ) ( not ( = ?auto_877449 ?auto_877454 ) ) ( not ( = ?auto_877449 ?auto_877455 ) ) ( not ( = ?auto_877449 ?auto_877456 ) ) ( not ( = ?auto_877449 ?auto_877457 ) ) ( not ( = ?auto_877449 ?auto_877458 ) ) ( not ( = ?auto_877449 ?auto_877459 ) ) ( not ( = ?auto_877449 ?auto_877460 ) ) ( not ( = ?auto_877449 ?auto_877461 ) ) ( not ( = ?auto_877450 ?auto_877451 ) ) ( not ( = ?auto_877450 ?auto_877452 ) ) ( not ( = ?auto_877450 ?auto_877453 ) ) ( not ( = ?auto_877450 ?auto_877454 ) ) ( not ( = ?auto_877450 ?auto_877455 ) ) ( not ( = ?auto_877450 ?auto_877456 ) ) ( not ( = ?auto_877450 ?auto_877457 ) ) ( not ( = ?auto_877450 ?auto_877458 ) ) ( not ( = ?auto_877450 ?auto_877459 ) ) ( not ( = ?auto_877450 ?auto_877460 ) ) ( not ( = ?auto_877450 ?auto_877461 ) ) ( not ( = ?auto_877451 ?auto_877452 ) ) ( not ( = ?auto_877451 ?auto_877453 ) ) ( not ( = ?auto_877451 ?auto_877454 ) ) ( not ( = ?auto_877451 ?auto_877455 ) ) ( not ( = ?auto_877451 ?auto_877456 ) ) ( not ( = ?auto_877451 ?auto_877457 ) ) ( not ( = ?auto_877451 ?auto_877458 ) ) ( not ( = ?auto_877451 ?auto_877459 ) ) ( not ( = ?auto_877451 ?auto_877460 ) ) ( not ( = ?auto_877451 ?auto_877461 ) ) ( not ( = ?auto_877452 ?auto_877453 ) ) ( not ( = ?auto_877452 ?auto_877454 ) ) ( not ( = ?auto_877452 ?auto_877455 ) ) ( not ( = ?auto_877452 ?auto_877456 ) ) ( not ( = ?auto_877452 ?auto_877457 ) ) ( not ( = ?auto_877452 ?auto_877458 ) ) ( not ( = ?auto_877452 ?auto_877459 ) ) ( not ( = ?auto_877452 ?auto_877460 ) ) ( not ( = ?auto_877452 ?auto_877461 ) ) ( not ( = ?auto_877453 ?auto_877454 ) ) ( not ( = ?auto_877453 ?auto_877455 ) ) ( not ( = ?auto_877453 ?auto_877456 ) ) ( not ( = ?auto_877453 ?auto_877457 ) ) ( not ( = ?auto_877453 ?auto_877458 ) ) ( not ( = ?auto_877453 ?auto_877459 ) ) ( not ( = ?auto_877453 ?auto_877460 ) ) ( not ( = ?auto_877453 ?auto_877461 ) ) ( not ( = ?auto_877454 ?auto_877455 ) ) ( not ( = ?auto_877454 ?auto_877456 ) ) ( not ( = ?auto_877454 ?auto_877457 ) ) ( not ( = ?auto_877454 ?auto_877458 ) ) ( not ( = ?auto_877454 ?auto_877459 ) ) ( not ( = ?auto_877454 ?auto_877460 ) ) ( not ( = ?auto_877454 ?auto_877461 ) ) ( not ( = ?auto_877455 ?auto_877456 ) ) ( not ( = ?auto_877455 ?auto_877457 ) ) ( not ( = ?auto_877455 ?auto_877458 ) ) ( not ( = ?auto_877455 ?auto_877459 ) ) ( not ( = ?auto_877455 ?auto_877460 ) ) ( not ( = ?auto_877455 ?auto_877461 ) ) ( not ( = ?auto_877456 ?auto_877457 ) ) ( not ( = ?auto_877456 ?auto_877458 ) ) ( not ( = ?auto_877456 ?auto_877459 ) ) ( not ( = ?auto_877456 ?auto_877460 ) ) ( not ( = ?auto_877456 ?auto_877461 ) ) ( not ( = ?auto_877457 ?auto_877458 ) ) ( not ( = ?auto_877457 ?auto_877459 ) ) ( not ( = ?auto_877457 ?auto_877460 ) ) ( not ( = ?auto_877457 ?auto_877461 ) ) ( not ( = ?auto_877458 ?auto_877459 ) ) ( not ( = ?auto_877458 ?auto_877460 ) ) ( not ( = ?auto_877458 ?auto_877461 ) ) ( not ( = ?auto_877459 ?auto_877460 ) ) ( not ( = ?auto_877459 ?auto_877461 ) ) ( not ( = ?auto_877460 ?auto_877461 ) ) ( ON ?auto_877459 ?auto_877460 ) ( ON ?auto_877458 ?auto_877459 ) ( ON ?auto_877457 ?auto_877458 ) ( ON ?auto_877456 ?auto_877457 ) ( ON ?auto_877455 ?auto_877456 ) ( ON ?auto_877454 ?auto_877455 ) ( ON ?auto_877453 ?auto_877454 ) ( ON ?auto_877452 ?auto_877453 ) ( CLEAR ?auto_877450 ) ( ON ?auto_877451 ?auto_877452 ) ( CLEAR ?auto_877451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_877445 ?auto_877446 ?auto_877447 ?auto_877448 ?auto_877449 ?auto_877450 ?auto_877451 )
      ( MAKE-16PILE ?auto_877445 ?auto_877446 ?auto_877447 ?auto_877448 ?auto_877449 ?auto_877450 ?auto_877451 ?auto_877452 ?auto_877453 ?auto_877454 ?auto_877455 ?auto_877456 ?auto_877457 ?auto_877458 ?auto_877459 ?auto_877460 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_877511 - BLOCK
      ?auto_877512 - BLOCK
      ?auto_877513 - BLOCK
      ?auto_877514 - BLOCK
      ?auto_877515 - BLOCK
      ?auto_877516 - BLOCK
      ?auto_877517 - BLOCK
      ?auto_877518 - BLOCK
      ?auto_877519 - BLOCK
      ?auto_877520 - BLOCK
      ?auto_877521 - BLOCK
      ?auto_877522 - BLOCK
      ?auto_877523 - BLOCK
      ?auto_877524 - BLOCK
      ?auto_877525 - BLOCK
      ?auto_877526 - BLOCK
    )
    :vars
    (
      ?auto_877527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_877526 ?auto_877527 ) ( ON-TABLE ?auto_877511 ) ( ON ?auto_877512 ?auto_877511 ) ( ON ?auto_877513 ?auto_877512 ) ( ON ?auto_877514 ?auto_877513 ) ( ON ?auto_877515 ?auto_877514 ) ( not ( = ?auto_877511 ?auto_877512 ) ) ( not ( = ?auto_877511 ?auto_877513 ) ) ( not ( = ?auto_877511 ?auto_877514 ) ) ( not ( = ?auto_877511 ?auto_877515 ) ) ( not ( = ?auto_877511 ?auto_877516 ) ) ( not ( = ?auto_877511 ?auto_877517 ) ) ( not ( = ?auto_877511 ?auto_877518 ) ) ( not ( = ?auto_877511 ?auto_877519 ) ) ( not ( = ?auto_877511 ?auto_877520 ) ) ( not ( = ?auto_877511 ?auto_877521 ) ) ( not ( = ?auto_877511 ?auto_877522 ) ) ( not ( = ?auto_877511 ?auto_877523 ) ) ( not ( = ?auto_877511 ?auto_877524 ) ) ( not ( = ?auto_877511 ?auto_877525 ) ) ( not ( = ?auto_877511 ?auto_877526 ) ) ( not ( = ?auto_877511 ?auto_877527 ) ) ( not ( = ?auto_877512 ?auto_877513 ) ) ( not ( = ?auto_877512 ?auto_877514 ) ) ( not ( = ?auto_877512 ?auto_877515 ) ) ( not ( = ?auto_877512 ?auto_877516 ) ) ( not ( = ?auto_877512 ?auto_877517 ) ) ( not ( = ?auto_877512 ?auto_877518 ) ) ( not ( = ?auto_877512 ?auto_877519 ) ) ( not ( = ?auto_877512 ?auto_877520 ) ) ( not ( = ?auto_877512 ?auto_877521 ) ) ( not ( = ?auto_877512 ?auto_877522 ) ) ( not ( = ?auto_877512 ?auto_877523 ) ) ( not ( = ?auto_877512 ?auto_877524 ) ) ( not ( = ?auto_877512 ?auto_877525 ) ) ( not ( = ?auto_877512 ?auto_877526 ) ) ( not ( = ?auto_877512 ?auto_877527 ) ) ( not ( = ?auto_877513 ?auto_877514 ) ) ( not ( = ?auto_877513 ?auto_877515 ) ) ( not ( = ?auto_877513 ?auto_877516 ) ) ( not ( = ?auto_877513 ?auto_877517 ) ) ( not ( = ?auto_877513 ?auto_877518 ) ) ( not ( = ?auto_877513 ?auto_877519 ) ) ( not ( = ?auto_877513 ?auto_877520 ) ) ( not ( = ?auto_877513 ?auto_877521 ) ) ( not ( = ?auto_877513 ?auto_877522 ) ) ( not ( = ?auto_877513 ?auto_877523 ) ) ( not ( = ?auto_877513 ?auto_877524 ) ) ( not ( = ?auto_877513 ?auto_877525 ) ) ( not ( = ?auto_877513 ?auto_877526 ) ) ( not ( = ?auto_877513 ?auto_877527 ) ) ( not ( = ?auto_877514 ?auto_877515 ) ) ( not ( = ?auto_877514 ?auto_877516 ) ) ( not ( = ?auto_877514 ?auto_877517 ) ) ( not ( = ?auto_877514 ?auto_877518 ) ) ( not ( = ?auto_877514 ?auto_877519 ) ) ( not ( = ?auto_877514 ?auto_877520 ) ) ( not ( = ?auto_877514 ?auto_877521 ) ) ( not ( = ?auto_877514 ?auto_877522 ) ) ( not ( = ?auto_877514 ?auto_877523 ) ) ( not ( = ?auto_877514 ?auto_877524 ) ) ( not ( = ?auto_877514 ?auto_877525 ) ) ( not ( = ?auto_877514 ?auto_877526 ) ) ( not ( = ?auto_877514 ?auto_877527 ) ) ( not ( = ?auto_877515 ?auto_877516 ) ) ( not ( = ?auto_877515 ?auto_877517 ) ) ( not ( = ?auto_877515 ?auto_877518 ) ) ( not ( = ?auto_877515 ?auto_877519 ) ) ( not ( = ?auto_877515 ?auto_877520 ) ) ( not ( = ?auto_877515 ?auto_877521 ) ) ( not ( = ?auto_877515 ?auto_877522 ) ) ( not ( = ?auto_877515 ?auto_877523 ) ) ( not ( = ?auto_877515 ?auto_877524 ) ) ( not ( = ?auto_877515 ?auto_877525 ) ) ( not ( = ?auto_877515 ?auto_877526 ) ) ( not ( = ?auto_877515 ?auto_877527 ) ) ( not ( = ?auto_877516 ?auto_877517 ) ) ( not ( = ?auto_877516 ?auto_877518 ) ) ( not ( = ?auto_877516 ?auto_877519 ) ) ( not ( = ?auto_877516 ?auto_877520 ) ) ( not ( = ?auto_877516 ?auto_877521 ) ) ( not ( = ?auto_877516 ?auto_877522 ) ) ( not ( = ?auto_877516 ?auto_877523 ) ) ( not ( = ?auto_877516 ?auto_877524 ) ) ( not ( = ?auto_877516 ?auto_877525 ) ) ( not ( = ?auto_877516 ?auto_877526 ) ) ( not ( = ?auto_877516 ?auto_877527 ) ) ( not ( = ?auto_877517 ?auto_877518 ) ) ( not ( = ?auto_877517 ?auto_877519 ) ) ( not ( = ?auto_877517 ?auto_877520 ) ) ( not ( = ?auto_877517 ?auto_877521 ) ) ( not ( = ?auto_877517 ?auto_877522 ) ) ( not ( = ?auto_877517 ?auto_877523 ) ) ( not ( = ?auto_877517 ?auto_877524 ) ) ( not ( = ?auto_877517 ?auto_877525 ) ) ( not ( = ?auto_877517 ?auto_877526 ) ) ( not ( = ?auto_877517 ?auto_877527 ) ) ( not ( = ?auto_877518 ?auto_877519 ) ) ( not ( = ?auto_877518 ?auto_877520 ) ) ( not ( = ?auto_877518 ?auto_877521 ) ) ( not ( = ?auto_877518 ?auto_877522 ) ) ( not ( = ?auto_877518 ?auto_877523 ) ) ( not ( = ?auto_877518 ?auto_877524 ) ) ( not ( = ?auto_877518 ?auto_877525 ) ) ( not ( = ?auto_877518 ?auto_877526 ) ) ( not ( = ?auto_877518 ?auto_877527 ) ) ( not ( = ?auto_877519 ?auto_877520 ) ) ( not ( = ?auto_877519 ?auto_877521 ) ) ( not ( = ?auto_877519 ?auto_877522 ) ) ( not ( = ?auto_877519 ?auto_877523 ) ) ( not ( = ?auto_877519 ?auto_877524 ) ) ( not ( = ?auto_877519 ?auto_877525 ) ) ( not ( = ?auto_877519 ?auto_877526 ) ) ( not ( = ?auto_877519 ?auto_877527 ) ) ( not ( = ?auto_877520 ?auto_877521 ) ) ( not ( = ?auto_877520 ?auto_877522 ) ) ( not ( = ?auto_877520 ?auto_877523 ) ) ( not ( = ?auto_877520 ?auto_877524 ) ) ( not ( = ?auto_877520 ?auto_877525 ) ) ( not ( = ?auto_877520 ?auto_877526 ) ) ( not ( = ?auto_877520 ?auto_877527 ) ) ( not ( = ?auto_877521 ?auto_877522 ) ) ( not ( = ?auto_877521 ?auto_877523 ) ) ( not ( = ?auto_877521 ?auto_877524 ) ) ( not ( = ?auto_877521 ?auto_877525 ) ) ( not ( = ?auto_877521 ?auto_877526 ) ) ( not ( = ?auto_877521 ?auto_877527 ) ) ( not ( = ?auto_877522 ?auto_877523 ) ) ( not ( = ?auto_877522 ?auto_877524 ) ) ( not ( = ?auto_877522 ?auto_877525 ) ) ( not ( = ?auto_877522 ?auto_877526 ) ) ( not ( = ?auto_877522 ?auto_877527 ) ) ( not ( = ?auto_877523 ?auto_877524 ) ) ( not ( = ?auto_877523 ?auto_877525 ) ) ( not ( = ?auto_877523 ?auto_877526 ) ) ( not ( = ?auto_877523 ?auto_877527 ) ) ( not ( = ?auto_877524 ?auto_877525 ) ) ( not ( = ?auto_877524 ?auto_877526 ) ) ( not ( = ?auto_877524 ?auto_877527 ) ) ( not ( = ?auto_877525 ?auto_877526 ) ) ( not ( = ?auto_877525 ?auto_877527 ) ) ( not ( = ?auto_877526 ?auto_877527 ) ) ( ON ?auto_877525 ?auto_877526 ) ( ON ?auto_877524 ?auto_877525 ) ( ON ?auto_877523 ?auto_877524 ) ( ON ?auto_877522 ?auto_877523 ) ( ON ?auto_877521 ?auto_877522 ) ( ON ?auto_877520 ?auto_877521 ) ( ON ?auto_877519 ?auto_877520 ) ( ON ?auto_877518 ?auto_877519 ) ( ON ?auto_877517 ?auto_877518 ) ( CLEAR ?auto_877515 ) ( ON ?auto_877516 ?auto_877517 ) ( CLEAR ?auto_877516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_877511 ?auto_877512 ?auto_877513 ?auto_877514 ?auto_877515 ?auto_877516 )
      ( MAKE-16PILE ?auto_877511 ?auto_877512 ?auto_877513 ?auto_877514 ?auto_877515 ?auto_877516 ?auto_877517 ?auto_877518 ?auto_877519 ?auto_877520 ?auto_877521 ?auto_877522 ?auto_877523 ?auto_877524 ?auto_877525 ?auto_877526 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_877577 - BLOCK
      ?auto_877578 - BLOCK
      ?auto_877579 - BLOCK
      ?auto_877580 - BLOCK
      ?auto_877581 - BLOCK
      ?auto_877582 - BLOCK
      ?auto_877583 - BLOCK
      ?auto_877584 - BLOCK
      ?auto_877585 - BLOCK
      ?auto_877586 - BLOCK
      ?auto_877587 - BLOCK
      ?auto_877588 - BLOCK
      ?auto_877589 - BLOCK
      ?auto_877590 - BLOCK
      ?auto_877591 - BLOCK
      ?auto_877592 - BLOCK
    )
    :vars
    (
      ?auto_877593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_877592 ?auto_877593 ) ( ON-TABLE ?auto_877577 ) ( ON ?auto_877578 ?auto_877577 ) ( ON ?auto_877579 ?auto_877578 ) ( ON ?auto_877580 ?auto_877579 ) ( not ( = ?auto_877577 ?auto_877578 ) ) ( not ( = ?auto_877577 ?auto_877579 ) ) ( not ( = ?auto_877577 ?auto_877580 ) ) ( not ( = ?auto_877577 ?auto_877581 ) ) ( not ( = ?auto_877577 ?auto_877582 ) ) ( not ( = ?auto_877577 ?auto_877583 ) ) ( not ( = ?auto_877577 ?auto_877584 ) ) ( not ( = ?auto_877577 ?auto_877585 ) ) ( not ( = ?auto_877577 ?auto_877586 ) ) ( not ( = ?auto_877577 ?auto_877587 ) ) ( not ( = ?auto_877577 ?auto_877588 ) ) ( not ( = ?auto_877577 ?auto_877589 ) ) ( not ( = ?auto_877577 ?auto_877590 ) ) ( not ( = ?auto_877577 ?auto_877591 ) ) ( not ( = ?auto_877577 ?auto_877592 ) ) ( not ( = ?auto_877577 ?auto_877593 ) ) ( not ( = ?auto_877578 ?auto_877579 ) ) ( not ( = ?auto_877578 ?auto_877580 ) ) ( not ( = ?auto_877578 ?auto_877581 ) ) ( not ( = ?auto_877578 ?auto_877582 ) ) ( not ( = ?auto_877578 ?auto_877583 ) ) ( not ( = ?auto_877578 ?auto_877584 ) ) ( not ( = ?auto_877578 ?auto_877585 ) ) ( not ( = ?auto_877578 ?auto_877586 ) ) ( not ( = ?auto_877578 ?auto_877587 ) ) ( not ( = ?auto_877578 ?auto_877588 ) ) ( not ( = ?auto_877578 ?auto_877589 ) ) ( not ( = ?auto_877578 ?auto_877590 ) ) ( not ( = ?auto_877578 ?auto_877591 ) ) ( not ( = ?auto_877578 ?auto_877592 ) ) ( not ( = ?auto_877578 ?auto_877593 ) ) ( not ( = ?auto_877579 ?auto_877580 ) ) ( not ( = ?auto_877579 ?auto_877581 ) ) ( not ( = ?auto_877579 ?auto_877582 ) ) ( not ( = ?auto_877579 ?auto_877583 ) ) ( not ( = ?auto_877579 ?auto_877584 ) ) ( not ( = ?auto_877579 ?auto_877585 ) ) ( not ( = ?auto_877579 ?auto_877586 ) ) ( not ( = ?auto_877579 ?auto_877587 ) ) ( not ( = ?auto_877579 ?auto_877588 ) ) ( not ( = ?auto_877579 ?auto_877589 ) ) ( not ( = ?auto_877579 ?auto_877590 ) ) ( not ( = ?auto_877579 ?auto_877591 ) ) ( not ( = ?auto_877579 ?auto_877592 ) ) ( not ( = ?auto_877579 ?auto_877593 ) ) ( not ( = ?auto_877580 ?auto_877581 ) ) ( not ( = ?auto_877580 ?auto_877582 ) ) ( not ( = ?auto_877580 ?auto_877583 ) ) ( not ( = ?auto_877580 ?auto_877584 ) ) ( not ( = ?auto_877580 ?auto_877585 ) ) ( not ( = ?auto_877580 ?auto_877586 ) ) ( not ( = ?auto_877580 ?auto_877587 ) ) ( not ( = ?auto_877580 ?auto_877588 ) ) ( not ( = ?auto_877580 ?auto_877589 ) ) ( not ( = ?auto_877580 ?auto_877590 ) ) ( not ( = ?auto_877580 ?auto_877591 ) ) ( not ( = ?auto_877580 ?auto_877592 ) ) ( not ( = ?auto_877580 ?auto_877593 ) ) ( not ( = ?auto_877581 ?auto_877582 ) ) ( not ( = ?auto_877581 ?auto_877583 ) ) ( not ( = ?auto_877581 ?auto_877584 ) ) ( not ( = ?auto_877581 ?auto_877585 ) ) ( not ( = ?auto_877581 ?auto_877586 ) ) ( not ( = ?auto_877581 ?auto_877587 ) ) ( not ( = ?auto_877581 ?auto_877588 ) ) ( not ( = ?auto_877581 ?auto_877589 ) ) ( not ( = ?auto_877581 ?auto_877590 ) ) ( not ( = ?auto_877581 ?auto_877591 ) ) ( not ( = ?auto_877581 ?auto_877592 ) ) ( not ( = ?auto_877581 ?auto_877593 ) ) ( not ( = ?auto_877582 ?auto_877583 ) ) ( not ( = ?auto_877582 ?auto_877584 ) ) ( not ( = ?auto_877582 ?auto_877585 ) ) ( not ( = ?auto_877582 ?auto_877586 ) ) ( not ( = ?auto_877582 ?auto_877587 ) ) ( not ( = ?auto_877582 ?auto_877588 ) ) ( not ( = ?auto_877582 ?auto_877589 ) ) ( not ( = ?auto_877582 ?auto_877590 ) ) ( not ( = ?auto_877582 ?auto_877591 ) ) ( not ( = ?auto_877582 ?auto_877592 ) ) ( not ( = ?auto_877582 ?auto_877593 ) ) ( not ( = ?auto_877583 ?auto_877584 ) ) ( not ( = ?auto_877583 ?auto_877585 ) ) ( not ( = ?auto_877583 ?auto_877586 ) ) ( not ( = ?auto_877583 ?auto_877587 ) ) ( not ( = ?auto_877583 ?auto_877588 ) ) ( not ( = ?auto_877583 ?auto_877589 ) ) ( not ( = ?auto_877583 ?auto_877590 ) ) ( not ( = ?auto_877583 ?auto_877591 ) ) ( not ( = ?auto_877583 ?auto_877592 ) ) ( not ( = ?auto_877583 ?auto_877593 ) ) ( not ( = ?auto_877584 ?auto_877585 ) ) ( not ( = ?auto_877584 ?auto_877586 ) ) ( not ( = ?auto_877584 ?auto_877587 ) ) ( not ( = ?auto_877584 ?auto_877588 ) ) ( not ( = ?auto_877584 ?auto_877589 ) ) ( not ( = ?auto_877584 ?auto_877590 ) ) ( not ( = ?auto_877584 ?auto_877591 ) ) ( not ( = ?auto_877584 ?auto_877592 ) ) ( not ( = ?auto_877584 ?auto_877593 ) ) ( not ( = ?auto_877585 ?auto_877586 ) ) ( not ( = ?auto_877585 ?auto_877587 ) ) ( not ( = ?auto_877585 ?auto_877588 ) ) ( not ( = ?auto_877585 ?auto_877589 ) ) ( not ( = ?auto_877585 ?auto_877590 ) ) ( not ( = ?auto_877585 ?auto_877591 ) ) ( not ( = ?auto_877585 ?auto_877592 ) ) ( not ( = ?auto_877585 ?auto_877593 ) ) ( not ( = ?auto_877586 ?auto_877587 ) ) ( not ( = ?auto_877586 ?auto_877588 ) ) ( not ( = ?auto_877586 ?auto_877589 ) ) ( not ( = ?auto_877586 ?auto_877590 ) ) ( not ( = ?auto_877586 ?auto_877591 ) ) ( not ( = ?auto_877586 ?auto_877592 ) ) ( not ( = ?auto_877586 ?auto_877593 ) ) ( not ( = ?auto_877587 ?auto_877588 ) ) ( not ( = ?auto_877587 ?auto_877589 ) ) ( not ( = ?auto_877587 ?auto_877590 ) ) ( not ( = ?auto_877587 ?auto_877591 ) ) ( not ( = ?auto_877587 ?auto_877592 ) ) ( not ( = ?auto_877587 ?auto_877593 ) ) ( not ( = ?auto_877588 ?auto_877589 ) ) ( not ( = ?auto_877588 ?auto_877590 ) ) ( not ( = ?auto_877588 ?auto_877591 ) ) ( not ( = ?auto_877588 ?auto_877592 ) ) ( not ( = ?auto_877588 ?auto_877593 ) ) ( not ( = ?auto_877589 ?auto_877590 ) ) ( not ( = ?auto_877589 ?auto_877591 ) ) ( not ( = ?auto_877589 ?auto_877592 ) ) ( not ( = ?auto_877589 ?auto_877593 ) ) ( not ( = ?auto_877590 ?auto_877591 ) ) ( not ( = ?auto_877590 ?auto_877592 ) ) ( not ( = ?auto_877590 ?auto_877593 ) ) ( not ( = ?auto_877591 ?auto_877592 ) ) ( not ( = ?auto_877591 ?auto_877593 ) ) ( not ( = ?auto_877592 ?auto_877593 ) ) ( ON ?auto_877591 ?auto_877592 ) ( ON ?auto_877590 ?auto_877591 ) ( ON ?auto_877589 ?auto_877590 ) ( ON ?auto_877588 ?auto_877589 ) ( ON ?auto_877587 ?auto_877588 ) ( ON ?auto_877586 ?auto_877587 ) ( ON ?auto_877585 ?auto_877586 ) ( ON ?auto_877584 ?auto_877585 ) ( ON ?auto_877583 ?auto_877584 ) ( ON ?auto_877582 ?auto_877583 ) ( CLEAR ?auto_877580 ) ( ON ?auto_877581 ?auto_877582 ) ( CLEAR ?auto_877581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_877577 ?auto_877578 ?auto_877579 ?auto_877580 ?auto_877581 )
      ( MAKE-16PILE ?auto_877577 ?auto_877578 ?auto_877579 ?auto_877580 ?auto_877581 ?auto_877582 ?auto_877583 ?auto_877584 ?auto_877585 ?auto_877586 ?auto_877587 ?auto_877588 ?auto_877589 ?auto_877590 ?auto_877591 ?auto_877592 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_877643 - BLOCK
      ?auto_877644 - BLOCK
      ?auto_877645 - BLOCK
      ?auto_877646 - BLOCK
      ?auto_877647 - BLOCK
      ?auto_877648 - BLOCK
      ?auto_877649 - BLOCK
      ?auto_877650 - BLOCK
      ?auto_877651 - BLOCK
      ?auto_877652 - BLOCK
      ?auto_877653 - BLOCK
      ?auto_877654 - BLOCK
      ?auto_877655 - BLOCK
      ?auto_877656 - BLOCK
      ?auto_877657 - BLOCK
      ?auto_877658 - BLOCK
    )
    :vars
    (
      ?auto_877659 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_877658 ?auto_877659 ) ( ON-TABLE ?auto_877643 ) ( ON ?auto_877644 ?auto_877643 ) ( ON ?auto_877645 ?auto_877644 ) ( not ( = ?auto_877643 ?auto_877644 ) ) ( not ( = ?auto_877643 ?auto_877645 ) ) ( not ( = ?auto_877643 ?auto_877646 ) ) ( not ( = ?auto_877643 ?auto_877647 ) ) ( not ( = ?auto_877643 ?auto_877648 ) ) ( not ( = ?auto_877643 ?auto_877649 ) ) ( not ( = ?auto_877643 ?auto_877650 ) ) ( not ( = ?auto_877643 ?auto_877651 ) ) ( not ( = ?auto_877643 ?auto_877652 ) ) ( not ( = ?auto_877643 ?auto_877653 ) ) ( not ( = ?auto_877643 ?auto_877654 ) ) ( not ( = ?auto_877643 ?auto_877655 ) ) ( not ( = ?auto_877643 ?auto_877656 ) ) ( not ( = ?auto_877643 ?auto_877657 ) ) ( not ( = ?auto_877643 ?auto_877658 ) ) ( not ( = ?auto_877643 ?auto_877659 ) ) ( not ( = ?auto_877644 ?auto_877645 ) ) ( not ( = ?auto_877644 ?auto_877646 ) ) ( not ( = ?auto_877644 ?auto_877647 ) ) ( not ( = ?auto_877644 ?auto_877648 ) ) ( not ( = ?auto_877644 ?auto_877649 ) ) ( not ( = ?auto_877644 ?auto_877650 ) ) ( not ( = ?auto_877644 ?auto_877651 ) ) ( not ( = ?auto_877644 ?auto_877652 ) ) ( not ( = ?auto_877644 ?auto_877653 ) ) ( not ( = ?auto_877644 ?auto_877654 ) ) ( not ( = ?auto_877644 ?auto_877655 ) ) ( not ( = ?auto_877644 ?auto_877656 ) ) ( not ( = ?auto_877644 ?auto_877657 ) ) ( not ( = ?auto_877644 ?auto_877658 ) ) ( not ( = ?auto_877644 ?auto_877659 ) ) ( not ( = ?auto_877645 ?auto_877646 ) ) ( not ( = ?auto_877645 ?auto_877647 ) ) ( not ( = ?auto_877645 ?auto_877648 ) ) ( not ( = ?auto_877645 ?auto_877649 ) ) ( not ( = ?auto_877645 ?auto_877650 ) ) ( not ( = ?auto_877645 ?auto_877651 ) ) ( not ( = ?auto_877645 ?auto_877652 ) ) ( not ( = ?auto_877645 ?auto_877653 ) ) ( not ( = ?auto_877645 ?auto_877654 ) ) ( not ( = ?auto_877645 ?auto_877655 ) ) ( not ( = ?auto_877645 ?auto_877656 ) ) ( not ( = ?auto_877645 ?auto_877657 ) ) ( not ( = ?auto_877645 ?auto_877658 ) ) ( not ( = ?auto_877645 ?auto_877659 ) ) ( not ( = ?auto_877646 ?auto_877647 ) ) ( not ( = ?auto_877646 ?auto_877648 ) ) ( not ( = ?auto_877646 ?auto_877649 ) ) ( not ( = ?auto_877646 ?auto_877650 ) ) ( not ( = ?auto_877646 ?auto_877651 ) ) ( not ( = ?auto_877646 ?auto_877652 ) ) ( not ( = ?auto_877646 ?auto_877653 ) ) ( not ( = ?auto_877646 ?auto_877654 ) ) ( not ( = ?auto_877646 ?auto_877655 ) ) ( not ( = ?auto_877646 ?auto_877656 ) ) ( not ( = ?auto_877646 ?auto_877657 ) ) ( not ( = ?auto_877646 ?auto_877658 ) ) ( not ( = ?auto_877646 ?auto_877659 ) ) ( not ( = ?auto_877647 ?auto_877648 ) ) ( not ( = ?auto_877647 ?auto_877649 ) ) ( not ( = ?auto_877647 ?auto_877650 ) ) ( not ( = ?auto_877647 ?auto_877651 ) ) ( not ( = ?auto_877647 ?auto_877652 ) ) ( not ( = ?auto_877647 ?auto_877653 ) ) ( not ( = ?auto_877647 ?auto_877654 ) ) ( not ( = ?auto_877647 ?auto_877655 ) ) ( not ( = ?auto_877647 ?auto_877656 ) ) ( not ( = ?auto_877647 ?auto_877657 ) ) ( not ( = ?auto_877647 ?auto_877658 ) ) ( not ( = ?auto_877647 ?auto_877659 ) ) ( not ( = ?auto_877648 ?auto_877649 ) ) ( not ( = ?auto_877648 ?auto_877650 ) ) ( not ( = ?auto_877648 ?auto_877651 ) ) ( not ( = ?auto_877648 ?auto_877652 ) ) ( not ( = ?auto_877648 ?auto_877653 ) ) ( not ( = ?auto_877648 ?auto_877654 ) ) ( not ( = ?auto_877648 ?auto_877655 ) ) ( not ( = ?auto_877648 ?auto_877656 ) ) ( not ( = ?auto_877648 ?auto_877657 ) ) ( not ( = ?auto_877648 ?auto_877658 ) ) ( not ( = ?auto_877648 ?auto_877659 ) ) ( not ( = ?auto_877649 ?auto_877650 ) ) ( not ( = ?auto_877649 ?auto_877651 ) ) ( not ( = ?auto_877649 ?auto_877652 ) ) ( not ( = ?auto_877649 ?auto_877653 ) ) ( not ( = ?auto_877649 ?auto_877654 ) ) ( not ( = ?auto_877649 ?auto_877655 ) ) ( not ( = ?auto_877649 ?auto_877656 ) ) ( not ( = ?auto_877649 ?auto_877657 ) ) ( not ( = ?auto_877649 ?auto_877658 ) ) ( not ( = ?auto_877649 ?auto_877659 ) ) ( not ( = ?auto_877650 ?auto_877651 ) ) ( not ( = ?auto_877650 ?auto_877652 ) ) ( not ( = ?auto_877650 ?auto_877653 ) ) ( not ( = ?auto_877650 ?auto_877654 ) ) ( not ( = ?auto_877650 ?auto_877655 ) ) ( not ( = ?auto_877650 ?auto_877656 ) ) ( not ( = ?auto_877650 ?auto_877657 ) ) ( not ( = ?auto_877650 ?auto_877658 ) ) ( not ( = ?auto_877650 ?auto_877659 ) ) ( not ( = ?auto_877651 ?auto_877652 ) ) ( not ( = ?auto_877651 ?auto_877653 ) ) ( not ( = ?auto_877651 ?auto_877654 ) ) ( not ( = ?auto_877651 ?auto_877655 ) ) ( not ( = ?auto_877651 ?auto_877656 ) ) ( not ( = ?auto_877651 ?auto_877657 ) ) ( not ( = ?auto_877651 ?auto_877658 ) ) ( not ( = ?auto_877651 ?auto_877659 ) ) ( not ( = ?auto_877652 ?auto_877653 ) ) ( not ( = ?auto_877652 ?auto_877654 ) ) ( not ( = ?auto_877652 ?auto_877655 ) ) ( not ( = ?auto_877652 ?auto_877656 ) ) ( not ( = ?auto_877652 ?auto_877657 ) ) ( not ( = ?auto_877652 ?auto_877658 ) ) ( not ( = ?auto_877652 ?auto_877659 ) ) ( not ( = ?auto_877653 ?auto_877654 ) ) ( not ( = ?auto_877653 ?auto_877655 ) ) ( not ( = ?auto_877653 ?auto_877656 ) ) ( not ( = ?auto_877653 ?auto_877657 ) ) ( not ( = ?auto_877653 ?auto_877658 ) ) ( not ( = ?auto_877653 ?auto_877659 ) ) ( not ( = ?auto_877654 ?auto_877655 ) ) ( not ( = ?auto_877654 ?auto_877656 ) ) ( not ( = ?auto_877654 ?auto_877657 ) ) ( not ( = ?auto_877654 ?auto_877658 ) ) ( not ( = ?auto_877654 ?auto_877659 ) ) ( not ( = ?auto_877655 ?auto_877656 ) ) ( not ( = ?auto_877655 ?auto_877657 ) ) ( not ( = ?auto_877655 ?auto_877658 ) ) ( not ( = ?auto_877655 ?auto_877659 ) ) ( not ( = ?auto_877656 ?auto_877657 ) ) ( not ( = ?auto_877656 ?auto_877658 ) ) ( not ( = ?auto_877656 ?auto_877659 ) ) ( not ( = ?auto_877657 ?auto_877658 ) ) ( not ( = ?auto_877657 ?auto_877659 ) ) ( not ( = ?auto_877658 ?auto_877659 ) ) ( ON ?auto_877657 ?auto_877658 ) ( ON ?auto_877656 ?auto_877657 ) ( ON ?auto_877655 ?auto_877656 ) ( ON ?auto_877654 ?auto_877655 ) ( ON ?auto_877653 ?auto_877654 ) ( ON ?auto_877652 ?auto_877653 ) ( ON ?auto_877651 ?auto_877652 ) ( ON ?auto_877650 ?auto_877651 ) ( ON ?auto_877649 ?auto_877650 ) ( ON ?auto_877648 ?auto_877649 ) ( ON ?auto_877647 ?auto_877648 ) ( CLEAR ?auto_877645 ) ( ON ?auto_877646 ?auto_877647 ) ( CLEAR ?auto_877646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_877643 ?auto_877644 ?auto_877645 ?auto_877646 )
      ( MAKE-16PILE ?auto_877643 ?auto_877644 ?auto_877645 ?auto_877646 ?auto_877647 ?auto_877648 ?auto_877649 ?auto_877650 ?auto_877651 ?auto_877652 ?auto_877653 ?auto_877654 ?auto_877655 ?auto_877656 ?auto_877657 ?auto_877658 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_877709 - BLOCK
      ?auto_877710 - BLOCK
      ?auto_877711 - BLOCK
      ?auto_877712 - BLOCK
      ?auto_877713 - BLOCK
      ?auto_877714 - BLOCK
      ?auto_877715 - BLOCK
      ?auto_877716 - BLOCK
      ?auto_877717 - BLOCK
      ?auto_877718 - BLOCK
      ?auto_877719 - BLOCK
      ?auto_877720 - BLOCK
      ?auto_877721 - BLOCK
      ?auto_877722 - BLOCK
      ?auto_877723 - BLOCK
      ?auto_877724 - BLOCK
    )
    :vars
    (
      ?auto_877725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_877724 ?auto_877725 ) ( ON-TABLE ?auto_877709 ) ( ON ?auto_877710 ?auto_877709 ) ( not ( = ?auto_877709 ?auto_877710 ) ) ( not ( = ?auto_877709 ?auto_877711 ) ) ( not ( = ?auto_877709 ?auto_877712 ) ) ( not ( = ?auto_877709 ?auto_877713 ) ) ( not ( = ?auto_877709 ?auto_877714 ) ) ( not ( = ?auto_877709 ?auto_877715 ) ) ( not ( = ?auto_877709 ?auto_877716 ) ) ( not ( = ?auto_877709 ?auto_877717 ) ) ( not ( = ?auto_877709 ?auto_877718 ) ) ( not ( = ?auto_877709 ?auto_877719 ) ) ( not ( = ?auto_877709 ?auto_877720 ) ) ( not ( = ?auto_877709 ?auto_877721 ) ) ( not ( = ?auto_877709 ?auto_877722 ) ) ( not ( = ?auto_877709 ?auto_877723 ) ) ( not ( = ?auto_877709 ?auto_877724 ) ) ( not ( = ?auto_877709 ?auto_877725 ) ) ( not ( = ?auto_877710 ?auto_877711 ) ) ( not ( = ?auto_877710 ?auto_877712 ) ) ( not ( = ?auto_877710 ?auto_877713 ) ) ( not ( = ?auto_877710 ?auto_877714 ) ) ( not ( = ?auto_877710 ?auto_877715 ) ) ( not ( = ?auto_877710 ?auto_877716 ) ) ( not ( = ?auto_877710 ?auto_877717 ) ) ( not ( = ?auto_877710 ?auto_877718 ) ) ( not ( = ?auto_877710 ?auto_877719 ) ) ( not ( = ?auto_877710 ?auto_877720 ) ) ( not ( = ?auto_877710 ?auto_877721 ) ) ( not ( = ?auto_877710 ?auto_877722 ) ) ( not ( = ?auto_877710 ?auto_877723 ) ) ( not ( = ?auto_877710 ?auto_877724 ) ) ( not ( = ?auto_877710 ?auto_877725 ) ) ( not ( = ?auto_877711 ?auto_877712 ) ) ( not ( = ?auto_877711 ?auto_877713 ) ) ( not ( = ?auto_877711 ?auto_877714 ) ) ( not ( = ?auto_877711 ?auto_877715 ) ) ( not ( = ?auto_877711 ?auto_877716 ) ) ( not ( = ?auto_877711 ?auto_877717 ) ) ( not ( = ?auto_877711 ?auto_877718 ) ) ( not ( = ?auto_877711 ?auto_877719 ) ) ( not ( = ?auto_877711 ?auto_877720 ) ) ( not ( = ?auto_877711 ?auto_877721 ) ) ( not ( = ?auto_877711 ?auto_877722 ) ) ( not ( = ?auto_877711 ?auto_877723 ) ) ( not ( = ?auto_877711 ?auto_877724 ) ) ( not ( = ?auto_877711 ?auto_877725 ) ) ( not ( = ?auto_877712 ?auto_877713 ) ) ( not ( = ?auto_877712 ?auto_877714 ) ) ( not ( = ?auto_877712 ?auto_877715 ) ) ( not ( = ?auto_877712 ?auto_877716 ) ) ( not ( = ?auto_877712 ?auto_877717 ) ) ( not ( = ?auto_877712 ?auto_877718 ) ) ( not ( = ?auto_877712 ?auto_877719 ) ) ( not ( = ?auto_877712 ?auto_877720 ) ) ( not ( = ?auto_877712 ?auto_877721 ) ) ( not ( = ?auto_877712 ?auto_877722 ) ) ( not ( = ?auto_877712 ?auto_877723 ) ) ( not ( = ?auto_877712 ?auto_877724 ) ) ( not ( = ?auto_877712 ?auto_877725 ) ) ( not ( = ?auto_877713 ?auto_877714 ) ) ( not ( = ?auto_877713 ?auto_877715 ) ) ( not ( = ?auto_877713 ?auto_877716 ) ) ( not ( = ?auto_877713 ?auto_877717 ) ) ( not ( = ?auto_877713 ?auto_877718 ) ) ( not ( = ?auto_877713 ?auto_877719 ) ) ( not ( = ?auto_877713 ?auto_877720 ) ) ( not ( = ?auto_877713 ?auto_877721 ) ) ( not ( = ?auto_877713 ?auto_877722 ) ) ( not ( = ?auto_877713 ?auto_877723 ) ) ( not ( = ?auto_877713 ?auto_877724 ) ) ( not ( = ?auto_877713 ?auto_877725 ) ) ( not ( = ?auto_877714 ?auto_877715 ) ) ( not ( = ?auto_877714 ?auto_877716 ) ) ( not ( = ?auto_877714 ?auto_877717 ) ) ( not ( = ?auto_877714 ?auto_877718 ) ) ( not ( = ?auto_877714 ?auto_877719 ) ) ( not ( = ?auto_877714 ?auto_877720 ) ) ( not ( = ?auto_877714 ?auto_877721 ) ) ( not ( = ?auto_877714 ?auto_877722 ) ) ( not ( = ?auto_877714 ?auto_877723 ) ) ( not ( = ?auto_877714 ?auto_877724 ) ) ( not ( = ?auto_877714 ?auto_877725 ) ) ( not ( = ?auto_877715 ?auto_877716 ) ) ( not ( = ?auto_877715 ?auto_877717 ) ) ( not ( = ?auto_877715 ?auto_877718 ) ) ( not ( = ?auto_877715 ?auto_877719 ) ) ( not ( = ?auto_877715 ?auto_877720 ) ) ( not ( = ?auto_877715 ?auto_877721 ) ) ( not ( = ?auto_877715 ?auto_877722 ) ) ( not ( = ?auto_877715 ?auto_877723 ) ) ( not ( = ?auto_877715 ?auto_877724 ) ) ( not ( = ?auto_877715 ?auto_877725 ) ) ( not ( = ?auto_877716 ?auto_877717 ) ) ( not ( = ?auto_877716 ?auto_877718 ) ) ( not ( = ?auto_877716 ?auto_877719 ) ) ( not ( = ?auto_877716 ?auto_877720 ) ) ( not ( = ?auto_877716 ?auto_877721 ) ) ( not ( = ?auto_877716 ?auto_877722 ) ) ( not ( = ?auto_877716 ?auto_877723 ) ) ( not ( = ?auto_877716 ?auto_877724 ) ) ( not ( = ?auto_877716 ?auto_877725 ) ) ( not ( = ?auto_877717 ?auto_877718 ) ) ( not ( = ?auto_877717 ?auto_877719 ) ) ( not ( = ?auto_877717 ?auto_877720 ) ) ( not ( = ?auto_877717 ?auto_877721 ) ) ( not ( = ?auto_877717 ?auto_877722 ) ) ( not ( = ?auto_877717 ?auto_877723 ) ) ( not ( = ?auto_877717 ?auto_877724 ) ) ( not ( = ?auto_877717 ?auto_877725 ) ) ( not ( = ?auto_877718 ?auto_877719 ) ) ( not ( = ?auto_877718 ?auto_877720 ) ) ( not ( = ?auto_877718 ?auto_877721 ) ) ( not ( = ?auto_877718 ?auto_877722 ) ) ( not ( = ?auto_877718 ?auto_877723 ) ) ( not ( = ?auto_877718 ?auto_877724 ) ) ( not ( = ?auto_877718 ?auto_877725 ) ) ( not ( = ?auto_877719 ?auto_877720 ) ) ( not ( = ?auto_877719 ?auto_877721 ) ) ( not ( = ?auto_877719 ?auto_877722 ) ) ( not ( = ?auto_877719 ?auto_877723 ) ) ( not ( = ?auto_877719 ?auto_877724 ) ) ( not ( = ?auto_877719 ?auto_877725 ) ) ( not ( = ?auto_877720 ?auto_877721 ) ) ( not ( = ?auto_877720 ?auto_877722 ) ) ( not ( = ?auto_877720 ?auto_877723 ) ) ( not ( = ?auto_877720 ?auto_877724 ) ) ( not ( = ?auto_877720 ?auto_877725 ) ) ( not ( = ?auto_877721 ?auto_877722 ) ) ( not ( = ?auto_877721 ?auto_877723 ) ) ( not ( = ?auto_877721 ?auto_877724 ) ) ( not ( = ?auto_877721 ?auto_877725 ) ) ( not ( = ?auto_877722 ?auto_877723 ) ) ( not ( = ?auto_877722 ?auto_877724 ) ) ( not ( = ?auto_877722 ?auto_877725 ) ) ( not ( = ?auto_877723 ?auto_877724 ) ) ( not ( = ?auto_877723 ?auto_877725 ) ) ( not ( = ?auto_877724 ?auto_877725 ) ) ( ON ?auto_877723 ?auto_877724 ) ( ON ?auto_877722 ?auto_877723 ) ( ON ?auto_877721 ?auto_877722 ) ( ON ?auto_877720 ?auto_877721 ) ( ON ?auto_877719 ?auto_877720 ) ( ON ?auto_877718 ?auto_877719 ) ( ON ?auto_877717 ?auto_877718 ) ( ON ?auto_877716 ?auto_877717 ) ( ON ?auto_877715 ?auto_877716 ) ( ON ?auto_877714 ?auto_877715 ) ( ON ?auto_877713 ?auto_877714 ) ( ON ?auto_877712 ?auto_877713 ) ( CLEAR ?auto_877710 ) ( ON ?auto_877711 ?auto_877712 ) ( CLEAR ?auto_877711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_877709 ?auto_877710 ?auto_877711 )
      ( MAKE-16PILE ?auto_877709 ?auto_877710 ?auto_877711 ?auto_877712 ?auto_877713 ?auto_877714 ?auto_877715 ?auto_877716 ?auto_877717 ?auto_877718 ?auto_877719 ?auto_877720 ?auto_877721 ?auto_877722 ?auto_877723 ?auto_877724 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_877775 - BLOCK
      ?auto_877776 - BLOCK
      ?auto_877777 - BLOCK
      ?auto_877778 - BLOCK
      ?auto_877779 - BLOCK
      ?auto_877780 - BLOCK
      ?auto_877781 - BLOCK
      ?auto_877782 - BLOCK
      ?auto_877783 - BLOCK
      ?auto_877784 - BLOCK
      ?auto_877785 - BLOCK
      ?auto_877786 - BLOCK
      ?auto_877787 - BLOCK
      ?auto_877788 - BLOCK
      ?auto_877789 - BLOCK
      ?auto_877790 - BLOCK
    )
    :vars
    (
      ?auto_877791 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_877790 ?auto_877791 ) ( ON-TABLE ?auto_877775 ) ( not ( = ?auto_877775 ?auto_877776 ) ) ( not ( = ?auto_877775 ?auto_877777 ) ) ( not ( = ?auto_877775 ?auto_877778 ) ) ( not ( = ?auto_877775 ?auto_877779 ) ) ( not ( = ?auto_877775 ?auto_877780 ) ) ( not ( = ?auto_877775 ?auto_877781 ) ) ( not ( = ?auto_877775 ?auto_877782 ) ) ( not ( = ?auto_877775 ?auto_877783 ) ) ( not ( = ?auto_877775 ?auto_877784 ) ) ( not ( = ?auto_877775 ?auto_877785 ) ) ( not ( = ?auto_877775 ?auto_877786 ) ) ( not ( = ?auto_877775 ?auto_877787 ) ) ( not ( = ?auto_877775 ?auto_877788 ) ) ( not ( = ?auto_877775 ?auto_877789 ) ) ( not ( = ?auto_877775 ?auto_877790 ) ) ( not ( = ?auto_877775 ?auto_877791 ) ) ( not ( = ?auto_877776 ?auto_877777 ) ) ( not ( = ?auto_877776 ?auto_877778 ) ) ( not ( = ?auto_877776 ?auto_877779 ) ) ( not ( = ?auto_877776 ?auto_877780 ) ) ( not ( = ?auto_877776 ?auto_877781 ) ) ( not ( = ?auto_877776 ?auto_877782 ) ) ( not ( = ?auto_877776 ?auto_877783 ) ) ( not ( = ?auto_877776 ?auto_877784 ) ) ( not ( = ?auto_877776 ?auto_877785 ) ) ( not ( = ?auto_877776 ?auto_877786 ) ) ( not ( = ?auto_877776 ?auto_877787 ) ) ( not ( = ?auto_877776 ?auto_877788 ) ) ( not ( = ?auto_877776 ?auto_877789 ) ) ( not ( = ?auto_877776 ?auto_877790 ) ) ( not ( = ?auto_877776 ?auto_877791 ) ) ( not ( = ?auto_877777 ?auto_877778 ) ) ( not ( = ?auto_877777 ?auto_877779 ) ) ( not ( = ?auto_877777 ?auto_877780 ) ) ( not ( = ?auto_877777 ?auto_877781 ) ) ( not ( = ?auto_877777 ?auto_877782 ) ) ( not ( = ?auto_877777 ?auto_877783 ) ) ( not ( = ?auto_877777 ?auto_877784 ) ) ( not ( = ?auto_877777 ?auto_877785 ) ) ( not ( = ?auto_877777 ?auto_877786 ) ) ( not ( = ?auto_877777 ?auto_877787 ) ) ( not ( = ?auto_877777 ?auto_877788 ) ) ( not ( = ?auto_877777 ?auto_877789 ) ) ( not ( = ?auto_877777 ?auto_877790 ) ) ( not ( = ?auto_877777 ?auto_877791 ) ) ( not ( = ?auto_877778 ?auto_877779 ) ) ( not ( = ?auto_877778 ?auto_877780 ) ) ( not ( = ?auto_877778 ?auto_877781 ) ) ( not ( = ?auto_877778 ?auto_877782 ) ) ( not ( = ?auto_877778 ?auto_877783 ) ) ( not ( = ?auto_877778 ?auto_877784 ) ) ( not ( = ?auto_877778 ?auto_877785 ) ) ( not ( = ?auto_877778 ?auto_877786 ) ) ( not ( = ?auto_877778 ?auto_877787 ) ) ( not ( = ?auto_877778 ?auto_877788 ) ) ( not ( = ?auto_877778 ?auto_877789 ) ) ( not ( = ?auto_877778 ?auto_877790 ) ) ( not ( = ?auto_877778 ?auto_877791 ) ) ( not ( = ?auto_877779 ?auto_877780 ) ) ( not ( = ?auto_877779 ?auto_877781 ) ) ( not ( = ?auto_877779 ?auto_877782 ) ) ( not ( = ?auto_877779 ?auto_877783 ) ) ( not ( = ?auto_877779 ?auto_877784 ) ) ( not ( = ?auto_877779 ?auto_877785 ) ) ( not ( = ?auto_877779 ?auto_877786 ) ) ( not ( = ?auto_877779 ?auto_877787 ) ) ( not ( = ?auto_877779 ?auto_877788 ) ) ( not ( = ?auto_877779 ?auto_877789 ) ) ( not ( = ?auto_877779 ?auto_877790 ) ) ( not ( = ?auto_877779 ?auto_877791 ) ) ( not ( = ?auto_877780 ?auto_877781 ) ) ( not ( = ?auto_877780 ?auto_877782 ) ) ( not ( = ?auto_877780 ?auto_877783 ) ) ( not ( = ?auto_877780 ?auto_877784 ) ) ( not ( = ?auto_877780 ?auto_877785 ) ) ( not ( = ?auto_877780 ?auto_877786 ) ) ( not ( = ?auto_877780 ?auto_877787 ) ) ( not ( = ?auto_877780 ?auto_877788 ) ) ( not ( = ?auto_877780 ?auto_877789 ) ) ( not ( = ?auto_877780 ?auto_877790 ) ) ( not ( = ?auto_877780 ?auto_877791 ) ) ( not ( = ?auto_877781 ?auto_877782 ) ) ( not ( = ?auto_877781 ?auto_877783 ) ) ( not ( = ?auto_877781 ?auto_877784 ) ) ( not ( = ?auto_877781 ?auto_877785 ) ) ( not ( = ?auto_877781 ?auto_877786 ) ) ( not ( = ?auto_877781 ?auto_877787 ) ) ( not ( = ?auto_877781 ?auto_877788 ) ) ( not ( = ?auto_877781 ?auto_877789 ) ) ( not ( = ?auto_877781 ?auto_877790 ) ) ( not ( = ?auto_877781 ?auto_877791 ) ) ( not ( = ?auto_877782 ?auto_877783 ) ) ( not ( = ?auto_877782 ?auto_877784 ) ) ( not ( = ?auto_877782 ?auto_877785 ) ) ( not ( = ?auto_877782 ?auto_877786 ) ) ( not ( = ?auto_877782 ?auto_877787 ) ) ( not ( = ?auto_877782 ?auto_877788 ) ) ( not ( = ?auto_877782 ?auto_877789 ) ) ( not ( = ?auto_877782 ?auto_877790 ) ) ( not ( = ?auto_877782 ?auto_877791 ) ) ( not ( = ?auto_877783 ?auto_877784 ) ) ( not ( = ?auto_877783 ?auto_877785 ) ) ( not ( = ?auto_877783 ?auto_877786 ) ) ( not ( = ?auto_877783 ?auto_877787 ) ) ( not ( = ?auto_877783 ?auto_877788 ) ) ( not ( = ?auto_877783 ?auto_877789 ) ) ( not ( = ?auto_877783 ?auto_877790 ) ) ( not ( = ?auto_877783 ?auto_877791 ) ) ( not ( = ?auto_877784 ?auto_877785 ) ) ( not ( = ?auto_877784 ?auto_877786 ) ) ( not ( = ?auto_877784 ?auto_877787 ) ) ( not ( = ?auto_877784 ?auto_877788 ) ) ( not ( = ?auto_877784 ?auto_877789 ) ) ( not ( = ?auto_877784 ?auto_877790 ) ) ( not ( = ?auto_877784 ?auto_877791 ) ) ( not ( = ?auto_877785 ?auto_877786 ) ) ( not ( = ?auto_877785 ?auto_877787 ) ) ( not ( = ?auto_877785 ?auto_877788 ) ) ( not ( = ?auto_877785 ?auto_877789 ) ) ( not ( = ?auto_877785 ?auto_877790 ) ) ( not ( = ?auto_877785 ?auto_877791 ) ) ( not ( = ?auto_877786 ?auto_877787 ) ) ( not ( = ?auto_877786 ?auto_877788 ) ) ( not ( = ?auto_877786 ?auto_877789 ) ) ( not ( = ?auto_877786 ?auto_877790 ) ) ( not ( = ?auto_877786 ?auto_877791 ) ) ( not ( = ?auto_877787 ?auto_877788 ) ) ( not ( = ?auto_877787 ?auto_877789 ) ) ( not ( = ?auto_877787 ?auto_877790 ) ) ( not ( = ?auto_877787 ?auto_877791 ) ) ( not ( = ?auto_877788 ?auto_877789 ) ) ( not ( = ?auto_877788 ?auto_877790 ) ) ( not ( = ?auto_877788 ?auto_877791 ) ) ( not ( = ?auto_877789 ?auto_877790 ) ) ( not ( = ?auto_877789 ?auto_877791 ) ) ( not ( = ?auto_877790 ?auto_877791 ) ) ( ON ?auto_877789 ?auto_877790 ) ( ON ?auto_877788 ?auto_877789 ) ( ON ?auto_877787 ?auto_877788 ) ( ON ?auto_877786 ?auto_877787 ) ( ON ?auto_877785 ?auto_877786 ) ( ON ?auto_877784 ?auto_877785 ) ( ON ?auto_877783 ?auto_877784 ) ( ON ?auto_877782 ?auto_877783 ) ( ON ?auto_877781 ?auto_877782 ) ( ON ?auto_877780 ?auto_877781 ) ( ON ?auto_877779 ?auto_877780 ) ( ON ?auto_877778 ?auto_877779 ) ( ON ?auto_877777 ?auto_877778 ) ( CLEAR ?auto_877775 ) ( ON ?auto_877776 ?auto_877777 ) ( CLEAR ?auto_877776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_877775 ?auto_877776 )
      ( MAKE-16PILE ?auto_877775 ?auto_877776 ?auto_877777 ?auto_877778 ?auto_877779 ?auto_877780 ?auto_877781 ?auto_877782 ?auto_877783 ?auto_877784 ?auto_877785 ?auto_877786 ?auto_877787 ?auto_877788 ?auto_877789 ?auto_877790 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_877841 - BLOCK
      ?auto_877842 - BLOCK
      ?auto_877843 - BLOCK
      ?auto_877844 - BLOCK
      ?auto_877845 - BLOCK
      ?auto_877846 - BLOCK
      ?auto_877847 - BLOCK
      ?auto_877848 - BLOCK
      ?auto_877849 - BLOCK
      ?auto_877850 - BLOCK
      ?auto_877851 - BLOCK
      ?auto_877852 - BLOCK
      ?auto_877853 - BLOCK
      ?auto_877854 - BLOCK
      ?auto_877855 - BLOCK
      ?auto_877856 - BLOCK
    )
    :vars
    (
      ?auto_877857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_877856 ?auto_877857 ) ( not ( = ?auto_877841 ?auto_877842 ) ) ( not ( = ?auto_877841 ?auto_877843 ) ) ( not ( = ?auto_877841 ?auto_877844 ) ) ( not ( = ?auto_877841 ?auto_877845 ) ) ( not ( = ?auto_877841 ?auto_877846 ) ) ( not ( = ?auto_877841 ?auto_877847 ) ) ( not ( = ?auto_877841 ?auto_877848 ) ) ( not ( = ?auto_877841 ?auto_877849 ) ) ( not ( = ?auto_877841 ?auto_877850 ) ) ( not ( = ?auto_877841 ?auto_877851 ) ) ( not ( = ?auto_877841 ?auto_877852 ) ) ( not ( = ?auto_877841 ?auto_877853 ) ) ( not ( = ?auto_877841 ?auto_877854 ) ) ( not ( = ?auto_877841 ?auto_877855 ) ) ( not ( = ?auto_877841 ?auto_877856 ) ) ( not ( = ?auto_877841 ?auto_877857 ) ) ( not ( = ?auto_877842 ?auto_877843 ) ) ( not ( = ?auto_877842 ?auto_877844 ) ) ( not ( = ?auto_877842 ?auto_877845 ) ) ( not ( = ?auto_877842 ?auto_877846 ) ) ( not ( = ?auto_877842 ?auto_877847 ) ) ( not ( = ?auto_877842 ?auto_877848 ) ) ( not ( = ?auto_877842 ?auto_877849 ) ) ( not ( = ?auto_877842 ?auto_877850 ) ) ( not ( = ?auto_877842 ?auto_877851 ) ) ( not ( = ?auto_877842 ?auto_877852 ) ) ( not ( = ?auto_877842 ?auto_877853 ) ) ( not ( = ?auto_877842 ?auto_877854 ) ) ( not ( = ?auto_877842 ?auto_877855 ) ) ( not ( = ?auto_877842 ?auto_877856 ) ) ( not ( = ?auto_877842 ?auto_877857 ) ) ( not ( = ?auto_877843 ?auto_877844 ) ) ( not ( = ?auto_877843 ?auto_877845 ) ) ( not ( = ?auto_877843 ?auto_877846 ) ) ( not ( = ?auto_877843 ?auto_877847 ) ) ( not ( = ?auto_877843 ?auto_877848 ) ) ( not ( = ?auto_877843 ?auto_877849 ) ) ( not ( = ?auto_877843 ?auto_877850 ) ) ( not ( = ?auto_877843 ?auto_877851 ) ) ( not ( = ?auto_877843 ?auto_877852 ) ) ( not ( = ?auto_877843 ?auto_877853 ) ) ( not ( = ?auto_877843 ?auto_877854 ) ) ( not ( = ?auto_877843 ?auto_877855 ) ) ( not ( = ?auto_877843 ?auto_877856 ) ) ( not ( = ?auto_877843 ?auto_877857 ) ) ( not ( = ?auto_877844 ?auto_877845 ) ) ( not ( = ?auto_877844 ?auto_877846 ) ) ( not ( = ?auto_877844 ?auto_877847 ) ) ( not ( = ?auto_877844 ?auto_877848 ) ) ( not ( = ?auto_877844 ?auto_877849 ) ) ( not ( = ?auto_877844 ?auto_877850 ) ) ( not ( = ?auto_877844 ?auto_877851 ) ) ( not ( = ?auto_877844 ?auto_877852 ) ) ( not ( = ?auto_877844 ?auto_877853 ) ) ( not ( = ?auto_877844 ?auto_877854 ) ) ( not ( = ?auto_877844 ?auto_877855 ) ) ( not ( = ?auto_877844 ?auto_877856 ) ) ( not ( = ?auto_877844 ?auto_877857 ) ) ( not ( = ?auto_877845 ?auto_877846 ) ) ( not ( = ?auto_877845 ?auto_877847 ) ) ( not ( = ?auto_877845 ?auto_877848 ) ) ( not ( = ?auto_877845 ?auto_877849 ) ) ( not ( = ?auto_877845 ?auto_877850 ) ) ( not ( = ?auto_877845 ?auto_877851 ) ) ( not ( = ?auto_877845 ?auto_877852 ) ) ( not ( = ?auto_877845 ?auto_877853 ) ) ( not ( = ?auto_877845 ?auto_877854 ) ) ( not ( = ?auto_877845 ?auto_877855 ) ) ( not ( = ?auto_877845 ?auto_877856 ) ) ( not ( = ?auto_877845 ?auto_877857 ) ) ( not ( = ?auto_877846 ?auto_877847 ) ) ( not ( = ?auto_877846 ?auto_877848 ) ) ( not ( = ?auto_877846 ?auto_877849 ) ) ( not ( = ?auto_877846 ?auto_877850 ) ) ( not ( = ?auto_877846 ?auto_877851 ) ) ( not ( = ?auto_877846 ?auto_877852 ) ) ( not ( = ?auto_877846 ?auto_877853 ) ) ( not ( = ?auto_877846 ?auto_877854 ) ) ( not ( = ?auto_877846 ?auto_877855 ) ) ( not ( = ?auto_877846 ?auto_877856 ) ) ( not ( = ?auto_877846 ?auto_877857 ) ) ( not ( = ?auto_877847 ?auto_877848 ) ) ( not ( = ?auto_877847 ?auto_877849 ) ) ( not ( = ?auto_877847 ?auto_877850 ) ) ( not ( = ?auto_877847 ?auto_877851 ) ) ( not ( = ?auto_877847 ?auto_877852 ) ) ( not ( = ?auto_877847 ?auto_877853 ) ) ( not ( = ?auto_877847 ?auto_877854 ) ) ( not ( = ?auto_877847 ?auto_877855 ) ) ( not ( = ?auto_877847 ?auto_877856 ) ) ( not ( = ?auto_877847 ?auto_877857 ) ) ( not ( = ?auto_877848 ?auto_877849 ) ) ( not ( = ?auto_877848 ?auto_877850 ) ) ( not ( = ?auto_877848 ?auto_877851 ) ) ( not ( = ?auto_877848 ?auto_877852 ) ) ( not ( = ?auto_877848 ?auto_877853 ) ) ( not ( = ?auto_877848 ?auto_877854 ) ) ( not ( = ?auto_877848 ?auto_877855 ) ) ( not ( = ?auto_877848 ?auto_877856 ) ) ( not ( = ?auto_877848 ?auto_877857 ) ) ( not ( = ?auto_877849 ?auto_877850 ) ) ( not ( = ?auto_877849 ?auto_877851 ) ) ( not ( = ?auto_877849 ?auto_877852 ) ) ( not ( = ?auto_877849 ?auto_877853 ) ) ( not ( = ?auto_877849 ?auto_877854 ) ) ( not ( = ?auto_877849 ?auto_877855 ) ) ( not ( = ?auto_877849 ?auto_877856 ) ) ( not ( = ?auto_877849 ?auto_877857 ) ) ( not ( = ?auto_877850 ?auto_877851 ) ) ( not ( = ?auto_877850 ?auto_877852 ) ) ( not ( = ?auto_877850 ?auto_877853 ) ) ( not ( = ?auto_877850 ?auto_877854 ) ) ( not ( = ?auto_877850 ?auto_877855 ) ) ( not ( = ?auto_877850 ?auto_877856 ) ) ( not ( = ?auto_877850 ?auto_877857 ) ) ( not ( = ?auto_877851 ?auto_877852 ) ) ( not ( = ?auto_877851 ?auto_877853 ) ) ( not ( = ?auto_877851 ?auto_877854 ) ) ( not ( = ?auto_877851 ?auto_877855 ) ) ( not ( = ?auto_877851 ?auto_877856 ) ) ( not ( = ?auto_877851 ?auto_877857 ) ) ( not ( = ?auto_877852 ?auto_877853 ) ) ( not ( = ?auto_877852 ?auto_877854 ) ) ( not ( = ?auto_877852 ?auto_877855 ) ) ( not ( = ?auto_877852 ?auto_877856 ) ) ( not ( = ?auto_877852 ?auto_877857 ) ) ( not ( = ?auto_877853 ?auto_877854 ) ) ( not ( = ?auto_877853 ?auto_877855 ) ) ( not ( = ?auto_877853 ?auto_877856 ) ) ( not ( = ?auto_877853 ?auto_877857 ) ) ( not ( = ?auto_877854 ?auto_877855 ) ) ( not ( = ?auto_877854 ?auto_877856 ) ) ( not ( = ?auto_877854 ?auto_877857 ) ) ( not ( = ?auto_877855 ?auto_877856 ) ) ( not ( = ?auto_877855 ?auto_877857 ) ) ( not ( = ?auto_877856 ?auto_877857 ) ) ( ON ?auto_877855 ?auto_877856 ) ( ON ?auto_877854 ?auto_877855 ) ( ON ?auto_877853 ?auto_877854 ) ( ON ?auto_877852 ?auto_877853 ) ( ON ?auto_877851 ?auto_877852 ) ( ON ?auto_877850 ?auto_877851 ) ( ON ?auto_877849 ?auto_877850 ) ( ON ?auto_877848 ?auto_877849 ) ( ON ?auto_877847 ?auto_877848 ) ( ON ?auto_877846 ?auto_877847 ) ( ON ?auto_877845 ?auto_877846 ) ( ON ?auto_877844 ?auto_877845 ) ( ON ?auto_877843 ?auto_877844 ) ( ON ?auto_877842 ?auto_877843 ) ( ON ?auto_877841 ?auto_877842 ) ( CLEAR ?auto_877841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_877841 )
      ( MAKE-16PILE ?auto_877841 ?auto_877842 ?auto_877843 ?auto_877844 ?auto_877845 ?auto_877846 ?auto_877847 ?auto_877848 ?auto_877849 ?auto_877850 ?auto_877851 ?auto_877852 ?auto_877853 ?auto_877854 ?auto_877855 ?auto_877856 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_877908 - BLOCK
      ?auto_877909 - BLOCK
      ?auto_877910 - BLOCK
      ?auto_877911 - BLOCK
      ?auto_877912 - BLOCK
      ?auto_877913 - BLOCK
      ?auto_877914 - BLOCK
      ?auto_877915 - BLOCK
      ?auto_877916 - BLOCK
      ?auto_877917 - BLOCK
      ?auto_877918 - BLOCK
      ?auto_877919 - BLOCK
      ?auto_877920 - BLOCK
      ?auto_877921 - BLOCK
      ?auto_877922 - BLOCK
      ?auto_877923 - BLOCK
      ?auto_877924 - BLOCK
    )
    :vars
    (
      ?auto_877925 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_877923 ) ( ON ?auto_877924 ?auto_877925 ) ( CLEAR ?auto_877924 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_877908 ) ( ON ?auto_877909 ?auto_877908 ) ( ON ?auto_877910 ?auto_877909 ) ( ON ?auto_877911 ?auto_877910 ) ( ON ?auto_877912 ?auto_877911 ) ( ON ?auto_877913 ?auto_877912 ) ( ON ?auto_877914 ?auto_877913 ) ( ON ?auto_877915 ?auto_877914 ) ( ON ?auto_877916 ?auto_877915 ) ( ON ?auto_877917 ?auto_877916 ) ( ON ?auto_877918 ?auto_877917 ) ( ON ?auto_877919 ?auto_877918 ) ( ON ?auto_877920 ?auto_877919 ) ( ON ?auto_877921 ?auto_877920 ) ( ON ?auto_877922 ?auto_877921 ) ( ON ?auto_877923 ?auto_877922 ) ( not ( = ?auto_877908 ?auto_877909 ) ) ( not ( = ?auto_877908 ?auto_877910 ) ) ( not ( = ?auto_877908 ?auto_877911 ) ) ( not ( = ?auto_877908 ?auto_877912 ) ) ( not ( = ?auto_877908 ?auto_877913 ) ) ( not ( = ?auto_877908 ?auto_877914 ) ) ( not ( = ?auto_877908 ?auto_877915 ) ) ( not ( = ?auto_877908 ?auto_877916 ) ) ( not ( = ?auto_877908 ?auto_877917 ) ) ( not ( = ?auto_877908 ?auto_877918 ) ) ( not ( = ?auto_877908 ?auto_877919 ) ) ( not ( = ?auto_877908 ?auto_877920 ) ) ( not ( = ?auto_877908 ?auto_877921 ) ) ( not ( = ?auto_877908 ?auto_877922 ) ) ( not ( = ?auto_877908 ?auto_877923 ) ) ( not ( = ?auto_877908 ?auto_877924 ) ) ( not ( = ?auto_877908 ?auto_877925 ) ) ( not ( = ?auto_877909 ?auto_877910 ) ) ( not ( = ?auto_877909 ?auto_877911 ) ) ( not ( = ?auto_877909 ?auto_877912 ) ) ( not ( = ?auto_877909 ?auto_877913 ) ) ( not ( = ?auto_877909 ?auto_877914 ) ) ( not ( = ?auto_877909 ?auto_877915 ) ) ( not ( = ?auto_877909 ?auto_877916 ) ) ( not ( = ?auto_877909 ?auto_877917 ) ) ( not ( = ?auto_877909 ?auto_877918 ) ) ( not ( = ?auto_877909 ?auto_877919 ) ) ( not ( = ?auto_877909 ?auto_877920 ) ) ( not ( = ?auto_877909 ?auto_877921 ) ) ( not ( = ?auto_877909 ?auto_877922 ) ) ( not ( = ?auto_877909 ?auto_877923 ) ) ( not ( = ?auto_877909 ?auto_877924 ) ) ( not ( = ?auto_877909 ?auto_877925 ) ) ( not ( = ?auto_877910 ?auto_877911 ) ) ( not ( = ?auto_877910 ?auto_877912 ) ) ( not ( = ?auto_877910 ?auto_877913 ) ) ( not ( = ?auto_877910 ?auto_877914 ) ) ( not ( = ?auto_877910 ?auto_877915 ) ) ( not ( = ?auto_877910 ?auto_877916 ) ) ( not ( = ?auto_877910 ?auto_877917 ) ) ( not ( = ?auto_877910 ?auto_877918 ) ) ( not ( = ?auto_877910 ?auto_877919 ) ) ( not ( = ?auto_877910 ?auto_877920 ) ) ( not ( = ?auto_877910 ?auto_877921 ) ) ( not ( = ?auto_877910 ?auto_877922 ) ) ( not ( = ?auto_877910 ?auto_877923 ) ) ( not ( = ?auto_877910 ?auto_877924 ) ) ( not ( = ?auto_877910 ?auto_877925 ) ) ( not ( = ?auto_877911 ?auto_877912 ) ) ( not ( = ?auto_877911 ?auto_877913 ) ) ( not ( = ?auto_877911 ?auto_877914 ) ) ( not ( = ?auto_877911 ?auto_877915 ) ) ( not ( = ?auto_877911 ?auto_877916 ) ) ( not ( = ?auto_877911 ?auto_877917 ) ) ( not ( = ?auto_877911 ?auto_877918 ) ) ( not ( = ?auto_877911 ?auto_877919 ) ) ( not ( = ?auto_877911 ?auto_877920 ) ) ( not ( = ?auto_877911 ?auto_877921 ) ) ( not ( = ?auto_877911 ?auto_877922 ) ) ( not ( = ?auto_877911 ?auto_877923 ) ) ( not ( = ?auto_877911 ?auto_877924 ) ) ( not ( = ?auto_877911 ?auto_877925 ) ) ( not ( = ?auto_877912 ?auto_877913 ) ) ( not ( = ?auto_877912 ?auto_877914 ) ) ( not ( = ?auto_877912 ?auto_877915 ) ) ( not ( = ?auto_877912 ?auto_877916 ) ) ( not ( = ?auto_877912 ?auto_877917 ) ) ( not ( = ?auto_877912 ?auto_877918 ) ) ( not ( = ?auto_877912 ?auto_877919 ) ) ( not ( = ?auto_877912 ?auto_877920 ) ) ( not ( = ?auto_877912 ?auto_877921 ) ) ( not ( = ?auto_877912 ?auto_877922 ) ) ( not ( = ?auto_877912 ?auto_877923 ) ) ( not ( = ?auto_877912 ?auto_877924 ) ) ( not ( = ?auto_877912 ?auto_877925 ) ) ( not ( = ?auto_877913 ?auto_877914 ) ) ( not ( = ?auto_877913 ?auto_877915 ) ) ( not ( = ?auto_877913 ?auto_877916 ) ) ( not ( = ?auto_877913 ?auto_877917 ) ) ( not ( = ?auto_877913 ?auto_877918 ) ) ( not ( = ?auto_877913 ?auto_877919 ) ) ( not ( = ?auto_877913 ?auto_877920 ) ) ( not ( = ?auto_877913 ?auto_877921 ) ) ( not ( = ?auto_877913 ?auto_877922 ) ) ( not ( = ?auto_877913 ?auto_877923 ) ) ( not ( = ?auto_877913 ?auto_877924 ) ) ( not ( = ?auto_877913 ?auto_877925 ) ) ( not ( = ?auto_877914 ?auto_877915 ) ) ( not ( = ?auto_877914 ?auto_877916 ) ) ( not ( = ?auto_877914 ?auto_877917 ) ) ( not ( = ?auto_877914 ?auto_877918 ) ) ( not ( = ?auto_877914 ?auto_877919 ) ) ( not ( = ?auto_877914 ?auto_877920 ) ) ( not ( = ?auto_877914 ?auto_877921 ) ) ( not ( = ?auto_877914 ?auto_877922 ) ) ( not ( = ?auto_877914 ?auto_877923 ) ) ( not ( = ?auto_877914 ?auto_877924 ) ) ( not ( = ?auto_877914 ?auto_877925 ) ) ( not ( = ?auto_877915 ?auto_877916 ) ) ( not ( = ?auto_877915 ?auto_877917 ) ) ( not ( = ?auto_877915 ?auto_877918 ) ) ( not ( = ?auto_877915 ?auto_877919 ) ) ( not ( = ?auto_877915 ?auto_877920 ) ) ( not ( = ?auto_877915 ?auto_877921 ) ) ( not ( = ?auto_877915 ?auto_877922 ) ) ( not ( = ?auto_877915 ?auto_877923 ) ) ( not ( = ?auto_877915 ?auto_877924 ) ) ( not ( = ?auto_877915 ?auto_877925 ) ) ( not ( = ?auto_877916 ?auto_877917 ) ) ( not ( = ?auto_877916 ?auto_877918 ) ) ( not ( = ?auto_877916 ?auto_877919 ) ) ( not ( = ?auto_877916 ?auto_877920 ) ) ( not ( = ?auto_877916 ?auto_877921 ) ) ( not ( = ?auto_877916 ?auto_877922 ) ) ( not ( = ?auto_877916 ?auto_877923 ) ) ( not ( = ?auto_877916 ?auto_877924 ) ) ( not ( = ?auto_877916 ?auto_877925 ) ) ( not ( = ?auto_877917 ?auto_877918 ) ) ( not ( = ?auto_877917 ?auto_877919 ) ) ( not ( = ?auto_877917 ?auto_877920 ) ) ( not ( = ?auto_877917 ?auto_877921 ) ) ( not ( = ?auto_877917 ?auto_877922 ) ) ( not ( = ?auto_877917 ?auto_877923 ) ) ( not ( = ?auto_877917 ?auto_877924 ) ) ( not ( = ?auto_877917 ?auto_877925 ) ) ( not ( = ?auto_877918 ?auto_877919 ) ) ( not ( = ?auto_877918 ?auto_877920 ) ) ( not ( = ?auto_877918 ?auto_877921 ) ) ( not ( = ?auto_877918 ?auto_877922 ) ) ( not ( = ?auto_877918 ?auto_877923 ) ) ( not ( = ?auto_877918 ?auto_877924 ) ) ( not ( = ?auto_877918 ?auto_877925 ) ) ( not ( = ?auto_877919 ?auto_877920 ) ) ( not ( = ?auto_877919 ?auto_877921 ) ) ( not ( = ?auto_877919 ?auto_877922 ) ) ( not ( = ?auto_877919 ?auto_877923 ) ) ( not ( = ?auto_877919 ?auto_877924 ) ) ( not ( = ?auto_877919 ?auto_877925 ) ) ( not ( = ?auto_877920 ?auto_877921 ) ) ( not ( = ?auto_877920 ?auto_877922 ) ) ( not ( = ?auto_877920 ?auto_877923 ) ) ( not ( = ?auto_877920 ?auto_877924 ) ) ( not ( = ?auto_877920 ?auto_877925 ) ) ( not ( = ?auto_877921 ?auto_877922 ) ) ( not ( = ?auto_877921 ?auto_877923 ) ) ( not ( = ?auto_877921 ?auto_877924 ) ) ( not ( = ?auto_877921 ?auto_877925 ) ) ( not ( = ?auto_877922 ?auto_877923 ) ) ( not ( = ?auto_877922 ?auto_877924 ) ) ( not ( = ?auto_877922 ?auto_877925 ) ) ( not ( = ?auto_877923 ?auto_877924 ) ) ( not ( = ?auto_877923 ?auto_877925 ) ) ( not ( = ?auto_877924 ?auto_877925 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_877924 ?auto_877925 )
      ( !STACK ?auto_877924 ?auto_877923 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_877978 - BLOCK
      ?auto_877979 - BLOCK
      ?auto_877980 - BLOCK
      ?auto_877981 - BLOCK
      ?auto_877982 - BLOCK
      ?auto_877983 - BLOCK
      ?auto_877984 - BLOCK
      ?auto_877985 - BLOCK
      ?auto_877986 - BLOCK
      ?auto_877987 - BLOCK
      ?auto_877988 - BLOCK
      ?auto_877989 - BLOCK
      ?auto_877990 - BLOCK
      ?auto_877991 - BLOCK
      ?auto_877992 - BLOCK
      ?auto_877993 - BLOCK
      ?auto_877994 - BLOCK
    )
    :vars
    (
      ?auto_877995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_877994 ?auto_877995 ) ( ON-TABLE ?auto_877978 ) ( ON ?auto_877979 ?auto_877978 ) ( ON ?auto_877980 ?auto_877979 ) ( ON ?auto_877981 ?auto_877980 ) ( ON ?auto_877982 ?auto_877981 ) ( ON ?auto_877983 ?auto_877982 ) ( ON ?auto_877984 ?auto_877983 ) ( ON ?auto_877985 ?auto_877984 ) ( ON ?auto_877986 ?auto_877985 ) ( ON ?auto_877987 ?auto_877986 ) ( ON ?auto_877988 ?auto_877987 ) ( ON ?auto_877989 ?auto_877988 ) ( ON ?auto_877990 ?auto_877989 ) ( ON ?auto_877991 ?auto_877990 ) ( ON ?auto_877992 ?auto_877991 ) ( not ( = ?auto_877978 ?auto_877979 ) ) ( not ( = ?auto_877978 ?auto_877980 ) ) ( not ( = ?auto_877978 ?auto_877981 ) ) ( not ( = ?auto_877978 ?auto_877982 ) ) ( not ( = ?auto_877978 ?auto_877983 ) ) ( not ( = ?auto_877978 ?auto_877984 ) ) ( not ( = ?auto_877978 ?auto_877985 ) ) ( not ( = ?auto_877978 ?auto_877986 ) ) ( not ( = ?auto_877978 ?auto_877987 ) ) ( not ( = ?auto_877978 ?auto_877988 ) ) ( not ( = ?auto_877978 ?auto_877989 ) ) ( not ( = ?auto_877978 ?auto_877990 ) ) ( not ( = ?auto_877978 ?auto_877991 ) ) ( not ( = ?auto_877978 ?auto_877992 ) ) ( not ( = ?auto_877978 ?auto_877993 ) ) ( not ( = ?auto_877978 ?auto_877994 ) ) ( not ( = ?auto_877978 ?auto_877995 ) ) ( not ( = ?auto_877979 ?auto_877980 ) ) ( not ( = ?auto_877979 ?auto_877981 ) ) ( not ( = ?auto_877979 ?auto_877982 ) ) ( not ( = ?auto_877979 ?auto_877983 ) ) ( not ( = ?auto_877979 ?auto_877984 ) ) ( not ( = ?auto_877979 ?auto_877985 ) ) ( not ( = ?auto_877979 ?auto_877986 ) ) ( not ( = ?auto_877979 ?auto_877987 ) ) ( not ( = ?auto_877979 ?auto_877988 ) ) ( not ( = ?auto_877979 ?auto_877989 ) ) ( not ( = ?auto_877979 ?auto_877990 ) ) ( not ( = ?auto_877979 ?auto_877991 ) ) ( not ( = ?auto_877979 ?auto_877992 ) ) ( not ( = ?auto_877979 ?auto_877993 ) ) ( not ( = ?auto_877979 ?auto_877994 ) ) ( not ( = ?auto_877979 ?auto_877995 ) ) ( not ( = ?auto_877980 ?auto_877981 ) ) ( not ( = ?auto_877980 ?auto_877982 ) ) ( not ( = ?auto_877980 ?auto_877983 ) ) ( not ( = ?auto_877980 ?auto_877984 ) ) ( not ( = ?auto_877980 ?auto_877985 ) ) ( not ( = ?auto_877980 ?auto_877986 ) ) ( not ( = ?auto_877980 ?auto_877987 ) ) ( not ( = ?auto_877980 ?auto_877988 ) ) ( not ( = ?auto_877980 ?auto_877989 ) ) ( not ( = ?auto_877980 ?auto_877990 ) ) ( not ( = ?auto_877980 ?auto_877991 ) ) ( not ( = ?auto_877980 ?auto_877992 ) ) ( not ( = ?auto_877980 ?auto_877993 ) ) ( not ( = ?auto_877980 ?auto_877994 ) ) ( not ( = ?auto_877980 ?auto_877995 ) ) ( not ( = ?auto_877981 ?auto_877982 ) ) ( not ( = ?auto_877981 ?auto_877983 ) ) ( not ( = ?auto_877981 ?auto_877984 ) ) ( not ( = ?auto_877981 ?auto_877985 ) ) ( not ( = ?auto_877981 ?auto_877986 ) ) ( not ( = ?auto_877981 ?auto_877987 ) ) ( not ( = ?auto_877981 ?auto_877988 ) ) ( not ( = ?auto_877981 ?auto_877989 ) ) ( not ( = ?auto_877981 ?auto_877990 ) ) ( not ( = ?auto_877981 ?auto_877991 ) ) ( not ( = ?auto_877981 ?auto_877992 ) ) ( not ( = ?auto_877981 ?auto_877993 ) ) ( not ( = ?auto_877981 ?auto_877994 ) ) ( not ( = ?auto_877981 ?auto_877995 ) ) ( not ( = ?auto_877982 ?auto_877983 ) ) ( not ( = ?auto_877982 ?auto_877984 ) ) ( not ( = ?auto_877982 ?auto_877985 ) ) ( not ( = ?auto_877982 ?auto_877986 ) ) ( not ( = ?auto_877982 ?auto_877987 ) ) ( not ( = ?auto_877982 ?auto_877988 ) ) ( not ( = ?auto_877982 ?auto_877989 ) ) ( not ( = ?auto_877982 ?auto_877990 ) ) ( not ( = ?auto_877982 ?auto_877991 ) ) ( not ( = ?auto_877982 ?auto_877992 ) ) ( not ( = ?auto_877982 ?auto_877993 ) ) ( not ( = ?auto_877982 ?auto_877994 ) ) ( not ( = ?auto_877982 ?auto_877995 ) ) ( not ( = ?auto_877983 ?auto_877984 ) ) ( not ( = ?auto_877983 ?auto_877985 ) ) ( not ( = ?auto_877983 ?auto_877986 ) ) ( not ( = ?auto_877983 ?auto_877987 ) ) ( not ( = ?auto_877983 ?auto_877988 ) ) ( not ( = ?auto_877983 ?auto_877989 ) ) ( not ( = ?auto_877983 ?auto_877990 ) ) ( not ( = ?auto_877983 ?auto_877991 ) ) ( not ( = ?auto_877983 ?auto_877992 ) ) ( not ( = ?auto_877983 ?auto_877993 ) ) ( not ( = ?auto_877983 ?auto_877994 ) ) ( not ( = ?auto_877983 ?auto_877995 ) ) ( not ( = ?auto_877984 ?auto_877985 ) ) ( not ( = ?auto_877984 ?auto_877986 ) ) ( not ( = ?auto_877984 ?auto_877987 ) ) ( not ( = ?auto_877984 ?auto_877988 ) ) ( not ( = ?auto_877984 ?auto_877989 ) ) ( not ( = ?auto_877984 ?auto_877990 ) ) ( not ( = ?auto_877984 ?auto_877991 ) ) ( not ( = ?auto_877984 ?auto_877992 ) ) ( not ( = ?auto_877984 ?auto_877993 ) ) ( not ( = ?auto_877984 ?auto_877994 ) ) ( not ( = ?auto_877984 ?auto_877995 ) ) ( not ( = ?auto_877985 ?auto_877986 ) ) ( not ( = ?auto_877985 ?auto_877987 ) ) ( not ( = ?auto_877985 ?auto_877988 ) ) ( not ( = ?auto_877985 ?auto_877989 ) ) ( not ( = ?auto_877985 ?auto_877990 ) ) ( not ( = ?auto_877985 ?auto_877991 ) ) ( not ( = ?auto_877985 ?auto_877992 ) ) ( not ( = ?auto_877985 ?auto_877993 ) ) ( not ( = ?auto_877985 ?auto_877994 ) ) ( not ( = ?auto_877985 ?auto_877995 ) ) ( not ( = ?auto_877986 ?auto_877987 ) ) ( not ( = ?auto_877986 ?auto_877988 ) ) ( not ( = ?auto_877986 ?auto_877989 ) ) ( not ( = ?auto_877986 ?auto_877990 ) ) ( not ( = ?auto_877986 ?auto_877991 ) ) ( not ( = ?auto_877986 ?auto_877992 ) ) ( not ( = ?auto_877986 ?auto_877993 ) ) ( not ( = ?auto_877986 ?auto_877994 ) ) ( not ( = ?auto_877986 ?auto_877995 ) ) ( not ( = ?auto_877987 ?auto_877988 ) ) ( not ( = ?auto_877987 ?auto_877989 ) ) ( not ( = ?auto_877987 ?auto_877990 ) ) ( not ( = ?auto_877987 ?auto_877991 ) ) ( not ( = ?auto_877987 ?auto_877992 ) ) ( not ( = ?auto_877987 ?auto_877993 ) ) ( not ( = ?auto_877987 ?auto_877994 ) ) ( not ( = ?auto_877987 ?auto_877995 ) ) ( not ( = ?auto_877988 ?auto_877989 ) ) ( not ( = ?auto_877988 ?auto_877990 ) ) ( not ( = ?auto_877988 ?auto_877991 ) ) ( not ( = ?auto_877988 ?auto_877992 ) ) ( not ( = ?auto_877988 ?auto_877993 ) ) ( not ( = ?auto_877988 ?auto_877994 ) ) ( not ( = ?auto_877988 ?auto_877995 ) ) ( not ( = ?auto_877989 ?auto_877990 ) ) ( not ( = ?auto_877989 ?auto_877991 ) ) ( not ( = ?auto_877989 ?auto_877992 ) ) ( not ( = ?auto_877989 ?auto_877993 ) ) ( not ( = ?auto_877989 ?auto_877994 ) ) ( not ( = ?auto_877989 ?auto_877995 ) ) ( not ( = ?auto_877990 ?auto_877991 ) ) ( not ( = ?auto_877990 ?auto_877992 ) ) ( not ( = ?auto_877990 ?auto_877993 ) ) ( not ( = ?auto_877990 ?auto_877994 ) ) ( not ( = ?auto_877990 ?auto_877995 ) ) ( not ( = ?auto_877991 ?auto_877992 ) ) ( not ( = ?auto_877991 ?auto_877993 ) ) ( not ( = ?auto_877991 ?auto_877994 ) ) ( not ( = ?auto_877991 ?auto_877995 ) ) ( not ( = ?auto_877992 ?auto_877993 ) ) ( not ( = ?auto_877992 ?auto_877994 ) ) ( not ( = ?auto_877992 ?auto_877995 ) ) ( not ( = ?auto_877993 ?auto_877994 ) ) ( not ( = ?auto_877993 ?auto_877995 ) ) ( not ( = ?auto_877994 ?auto_877995 ) ) ( CLEAR ?auto_877992 ) ( ON ?auto_877993 ?auto_877994 ) ( CLEAR ?auto_877993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_877978 ?auto_877979 ?auto_877980 ?auto_877981 ?auto_877982 ?auto_877983 ?auto_877984 ?auto_877985 ?auto_877986 ?auto_877987 ?auto_877988 ?auto_877989 ?auto_877990 ?auto_877991 ?auto_877992 ?auto_877993 )
      ( MAKE-17PILE ?auto_877978 ?auto_877979 ?auto_877980 ?auto_877981 ?auto_877982 ?auto_877983 ?auto_877984 ?auto_877985 ?auto_877986 ?auto_877987 ?auto_877988 ?auto_877989 ?auto_877990 ?auto_877991 ?auto_877992 ?auto_877993 ?auto_877994 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_878048 - BLOCK
      ?auto_878049 - BLOCK
      ?auto_878050 - BLOCK
      ?auto_878051 - BLOCK
      ?auto_878052 - BLOCK
      ?auto_878053 - BLOCK
      ?auto_878054 - BLOCK
      ?auto_878055 - BLOCK
      ?auto_878056 - BLOCK
      ?auto_878057 - BLOCK
      ?auto_878058 - BLOCK
      ?auto_878059 - BLOCK
      ?auto_878060 - BLOCK
      ?auto_878061 - BLOCK
      ?auto_878062 - BLOCK
      ?auto_878063 - BLOCK
      ?auto_878064 - BLOCK
    )
    :vars
    (
      ?auto_878065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_878064 ?auto_878065 ) ( ON-TABLE ?auto_878048 ) ( ON ?auto_878049 ?auto_878048 ) ( ON ?auto_878050 ?auto_878049 ) ( ON ?auto_878051 ?auto_878050 ) ( ON ?auto_878052 ?auto_878051 ) ( ON ?auto_878053 ?auto_878052 ) ( ON ?auto_878054 ?auto_878053 ) ( ON ?auto_878055 ?auto_878054 ) ( ON ?auto_878056 ?auto_878055 ) ( ON ?auto_878057 ?auto_878056 ) ( ON ?auto_878058 ?auto_878057 ) ( ON ?auto_878059 ?auto_878058 ) ( ON ?auto_878060 ?auto_878059 ) ( ON ?auto_878061 ?auto_878060 ) ( not ( = ?auto_878048 ?auto_878049 ) ) ( not ( = ?auto_878048 ?auto_878050 ) ) ( not ( = ?auto_878048 ?auto_878051 ) ) ( not ( = ?auto_878048 ?auto_878052 ) ) ( not ( = ?auto_878048 ?auto_878053 ) ) ( not ( = ?auto_878048 ?auto_878054 ) ) ( not ( = ?auto_878048 ?auto_878055 ) ) ( not ( = ?auto_878048 ?auto_878056 ) ) ( not ( = ?auto_878048 ?auto_878057 ) ) ( not ( = ?auto_878048 ?auto_878058 ) ) ( not ( = ?auto_878048 ?auto_878059 ) ) ( not ( = ?auto_878048 ?auto_878060 ) ) ( not ( = ?auto_878048 ?auto_878061 ) ) ( not ( = ?auto_878048 ?auto_878062 ) ) ( not ( = ?auto_878048 ?auto_878063 ) ) ( not ( = ?auto_878048 ?auto_878064 ) ) ( not ( = ?auto_878048 ?auto_878065 ) ) ( not ( = ?auto_878049 ?auto_878050 ) ) ( not ( = ?auto_878049 ?auto_878051 ) ) ( not ( = ?auto_878049 ?auto_878052 ) ) ( not ( = ?auto_878049 ?auto_878053 ) ) ( not ( = ?auto_878049 ?auto_878054 ) ) ( not ( = ?auto_878049 ?auto_878055 ) ) ( not ( = ?auto_878049 ?auto_878056 ) ) ( not ( = ?auto_878049 ?auto_878057 ) ) ( not ( = ?auto_878049 ?auto_878058 ) ) ( not ( = ?auto_878049 ?auto_878059 ) ) ( not ( = ?auto_878049 ?auto_878060 ) ) ( not ( = ?auto_878049 ?auto_878061 ) ) ( not ( = ?auto_878049 ?auto_878062 ) ) ( not ( = ?auto_878049 ?auto_878063 ) ) ( not ( = ?auto_878049 ?auto_878064 ) ) ( not ( = ?auto_878049 ?auto_878065 ) ) ( not ( = ?auto_878050 ?auto_878051 ) ) ( not ( = ?auto_878050 ?auto_878052 ) ) ( not ( = ?auto_878050 ?auto_878053 ) ) ( not ( = ?auto_878050 ?auto_878054 ) ) ( not ( = ?auto_878050 ?auto_878055 ) ) ( not ( = ?auto_878050 ?auto_878056 ) ) ( not ( = ?auto_878050 ?auto_878057 ) ) ( not ( = ?auto_878050 ?auto_878058 ) ) ( not ( = ?auto_878050 ?auto_878059 ) ) ( not ( = ?auto_878050 ?auto_878060 ) ) ( not ( = ?auto_878050 ?auto_878061 ) ) ( not ( = ?auto_878050 ?auto_878062 ) ) ( not ( = ?auto_878050 ?auto_878063 ) ) ( not ( = ?auto_878050 ?auto_878064 ) ) ( not ( = ?auto_878050 ?auto_878065 ) ) ( not ( = ?auto_878051 ?auto_878052 ) ) ( not ( = ?auto_878051 ?auto_878053 ) ) ( not ( = ?auto_878051 ?auto_878054 ) ) ( not ( = ?auto_878051 ?auto_878055 ) ) ( not ( = ?auto_878051 ?auto_878056 ) ) ( not ( = ?auto_878051 ?auto_878057 ) ) ( not ( = ?auto_878051 ?auto_878058 ) ) ( not ( = ?auto_878051 ?auto_878059 ) ) ( not ( = ?auto_878051 ?auto_878060 ) ) ( not ( = ?auto_878051 ?auto_878061 ) ) ( not ( = ?auto_878051 ?auto_878062 ) ) ( not ( = ?auto_878051 ?auto_878063 ) ) ( not ( = ?auto_878051 ?auto_878064 ) ) ( not ( = ?auto_878051 ?auto_878065 ) ) ( not ( = ?auto_878052 ?auto_878053 ) ) ( not ( = ?auto_878052 ?auto_878054 ) ) ( not ( = ?auto_878052 ?auto_878055 ) ) ( not ( = ?auto_878052 ?auto_878056 ) ) ( not ( = ?auto_878052 ?auto_878057 ) ) ( not ( = ?auto_878052 ?auto_878058 ) ) ( not ( = ?auto_878052 ?auto_878059 ) ) ( not ( = ?auto_878052 ?auto_878060 ) ) ( not ( = ?auto_878052 ?auto_878061 ) ) ( not ( = ?auto_878052 ?auto_878062 ) ) ( not ( = ?auto_878052 ?auto_878063 ) ) ( not ( = ?auto_878052 ?auto_878064 ) ) ( not ( = ?auto_878052 ?auto_878065 ) ) ( not ( = ?auto_878053 ?auto_878054 ) ) ( not ( = ?auto_878053 ?auto_878055 ) ) ( not ( = ?auto_878053 ?auto_878056 ) ) ( not ( = ?auto_878053 ?auto_878057 ) ) ( not ( = ?auto_878053 ?auto_878058 ) ) ( not ( = ?auto_878053 ?auto_878059 ) ) ( not ( = ?auto_878053 ?auto_878060 ) ) ( not ( = ?auto_878053 ?auto_878061 ) ) ( not ( = ?auto_878053 ?auto_878062 ) ) ( not ( = ?auto_878053 ?auto_878063 ) ) ( not ( = ?auto_878053 ?auto_878064 ) ) ( not ( = ?auto_878053 ?auto_878065 ) ) ( not ( = ?auto_878054 ?auto_878055 ) ) ( not ( = ?auto_878054 ?auto_878056 ) ) ( not ( = ?auto_878054 ?auto_878057 ) ) ( not ( = ?auto_878054 ?auto_878058 ) ) ( not ( = ?auto_878054 ?auto_878059 ) ) ( not ( = ?auto_878054 ?auto_878060 ) ) ( not ( = ?auto_878054 ?auto_878061 ) ) ( not ( = ?auto_878054 ?auto_878062 ) ) ( not ( = ?auto_878054 ?auto_878063 ) ) ( not ( = ?auto_878054 ?auto_878064 ) ) ( not ( = ?auto_878054 ?auto_878065 ) ) ( not ( = ?auto_878055 ?auto_878056 ) ) ( not ( = ?auto_878055 ?auto_878057 ) ) ( not ( = ?auto_878055 ?auto_878058 ) ) ( not ( = ?auto_878055 ?auto_878059 ) ) ( not ( = ?auto_878055 ?auto_878060 ) ) ( not ( = ?auto_878055 ?auto_878061 ) ) ( not ( = ?auto_878055 ?auto_878062 ) ) ( not ( = ?auto_878055 ?auto_878063 ) ) ( not ( = ?auto_878055 ?auto_878064 ) ) ( not ( = ?auto_878055 ?auto_878065 ) ) ( not ( = ?auto_878056 ?auto_878057 ) ) ( not ( = ?auto_878056 ?auto_878058 ) ) ( not ( = ?auto_878056 ?auto_878059 ) ) ( not ( = ?auto_878056 ?auto_878060 ) ) ( not ( = ?auto_878056 ?auto_878061 ) ) ( not ( = ?auto_878056 ?auto_878062 ) ) ( not ( = ?auto_878056 ?auto_878063 ) ) ( not ( = ?auto_878056 ?auto_878064 ) ) ( not ( = ?auto_878056 ?auto_878065 ) ) ( not ( = ?auto_878057 ?auto_878058 ) ) ( not ( = ?auto_878057 ?auto_878059 ) ) ( not ( = ?auto_878057 ?auto_878060 ) ) ( not ( = ?auto_878057 ?auto_878061 ) ) ( not ( = ?auto_878057 ?auto_878062 ) ) ( not ( = ?auto_878057 ?auto_878063 ) ) ( not ( = ?auto_878057 ?auto_878064 ) ) ( not ( = ?auto_878057 ?auto_878065 ) ) ( not ( = ?auto_878058 ?auto_878059 ) ) ( not ( = ?auto_878058 ?auto_878060 ) ) ( not ( = ?auto_878058 ?auto_878061 ) ) ( not ( = ?auto_878058 ?auto_878062 ) ) ( not ( = ?auto_878058 ?auto_878063 ) ) ( not ( = ?auto_878058 ?auto_878064 ) ) ( not ( = ?auto_878058 ?auto_878065 ) ) ( not ( = ?auto_878059 ?auto_878060 ) ) ( not ( = ?auto_878059 ?auto_878061 ) ) ( not ( = ?auto_878059 ?auto_878062 ) ) ( not ( = ?auto_878059 ?auto_878063 ) ) ( not ( = ?auto_878059 ?auto_878064 ) ) ( not ( = ?auto_878059 ?auto_878065 ) ) ( not ( = ?auto_878060 ?auto_878061 ) ) ( not ( = ?auto_878060 ?auto_878062 ) ) ( not ( = ?auto_878060 ?auto_878063 ) ) ( not ( = ?auto_878060 ?auto_878064 ) ) ( not ( = ?auto_878060 ?auto_878065 ) ) ( not ( = ?auto_878061 ?auto_878062 ) ) ( not ( = ?auto_878061 ?auto_878063 ) ) ( not ( = ?auto_878061 ?auto_878064 ) ) ( not ( = ?auto_878061 ?auto_878065 ) ) ( not ( = ?auto_878062 ?auto_878063 ) ) ( not ( = ?auto_878062 ?auto_878064 ) ) ( not ( = ?auto_878062 ?auto_878065 ) ) ( not ( = ?auto_878063 ?auto_878064 ) ) ( not ( = ?auto_878063 ?auto_878065 ) ) ( not ( = ?auto_878064 ?auto_878065 ) ) ( ON ?auto_878063 ?auto_878064 ) ( CLEAR ?auto_878061 ) ( ON ?auto_878062 ?auto_878063 ) ( CLEAR ?auto_878062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_878048 ?auto_878049 ?auto_878050 ?auto_878051 ?auto_878052 ?auto_878053 ?auto_878054 ?auto_878055 ?auto_878056 ?auto_878057 ?auto_878058 ?auto_878059 ?auto_878060 ?auto_878061 ?auto_878062 )
      ( MAKE-17PILE ?auto_878048 ?auto_878049 ?auto_878050 ?auto_878051 ?auto_878052 ?auto_878053 ?auto_878054 ?auto_878055 ?auto_878056 ?auto_878057 ?auto_878058 ?auto_878059 ?auto_878060 ?auto_878061 ?auto_878062 ?auto_878063 ?auto_878064 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_878118 - BLOCK
      ?auto_878119 - BLOCK
      ?auto_878120 - BLOCK
      ?auto_878121 - BLOCK
      ?auto_878122 - BLOCK
      ?auto_878123 - BLOCK
      ?auto_878124 - BLOCK
      ?auto_878125 - BLOCK
      ?auto_878126 - BLOCK
      ?auto_878127 - BLOCK
      ?auto_878128 - BLOCK
      ?auto_878129 - BLOCK
      ?auto_878130 - BLOCK
      ?auto_878131 - BLOCK
      ?auto_878132 - BLOCK
      ?auto_878133 - BLOCK
      ?auto_878134 - BLOCK
    )
    :vars
    (
      ?auto_878135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_878134 ?auto_878135 ) ( ON-TABLE ?auto_878118 ) ( ON ?auto_878119 ?auto_878118 ) ( ON ?auto_878120 ?auto_878119 ) ( ON ?auto_878121 ?auto_878120 ) ( ON ?auto_878122 ?auto_878121 ) ( ON ?auto_878123 ?auto_878122 ) ( ON ?auto_878124 ?auto_878123 ) ( ON ?auto_878125 ?auto_878124 ) ( ON ?auto_878126 ?auto_878125 ) ( ON ?auto_878127 ?auto_878126 ) ( ON ?auto_878128 ?auto_878127 ) ( ON ?auto_878129 ?auto_878128 ) ( ON ?auto_878130 ?auto_878129 ) ( not ( = ?auto_878118 ?auto_878119 ) ) ( not ( = ?auto_878118 ?auto_878120 ) ) ( not ( = ?auto_878118 ?auto_878121 ) ) ( not ( = ?auto_878118 ?auto_878122 ) ) ( not ( = ?auto_878118 ?auto_878123 ) ) ( not ( = ?auto_878118 ?auto_878124 ) ) ( not ( = ?auto_878118 ?auto_878125 ) ) ( not ( = ?auto_878118 ?auto_878126 ) ) ( not ( = ?auto_878118 ?auto_878127 ) ) ( not ( = ?auto_878118 ?auto_878128 ) ) ( not ( = ?auto_878118 ?auto_878129 ) ) ( not ( = ?auto_878118 ?auto_878130 ) ) ( not ( = ?auto_878118 ?auto_878131 ) ) ( not ( = ?auto_878118 ?auto_878132 ) ) ( not ( = ?auto_878118 ?auto_878133 ) ) ( not ( = ?auto_878118 ?auto_878134 ) ) ( not ( = ?auto_878118 ?auto_878135 ) ) ( not ( = ?auto_878119 ?auto_878120 ) ) ( not ( = ?auto_878119 ?auto_878121 ) ) ( not ( = ?auto_878119 ?auto_878122 ) ) ( not ( = ?auto_878119 ?auto_878123 ) ) ( not ( = ?auto_878119 ?auto_878124 ) ) ( not ( = ?auto_878119 ?auto_878125 ) ) ( not ( = ?auto_878119 ?auto_878126 ) ) ( not ( = ?auto_878119 ?auto_878127 ) ) ( not ( = ?auto_878119 ?auto_878128 ) ) ( not ( = ?auto_878119 ?auto_878129 ) ) ( not ( = ?auto_878119 ?auto_878130 ) ) ( not ( = ?auto_878119 ?auto_878131 ) ) ( not ( = ?auto_878119 ?auto_878132 ) ) ( not ( = ?auto_878119 ?auto_878133 ) ) ( not ( = ?auto_878119 ?auto_878134 ) ) ( not ( = ?auto_878119 ?auto_878135 ) ) ( not ( = ?auto_878120 ?auto_878121 ) ) ( not ( = ?auto_878120 ?auto_878122 ) ) ( not ( = ?auto_878120 ?auto_878123 ) ) ( not ( = ?auto_878120 ?auto_878124 ) ) ( not ( = ?auto_878120 ?auto_878125 ) ) ( not ( = ?auto_878120 ?auto_878126 ) ) ( not ( = ?auto_878120 ?auto_878127 ) ) ( not ( = ?auto_878120 ?auto_878128 ) ) ( not ( = ?auto_878120 ?auto_878129 ) ) ( not ( = ?auto_878120 ?auto_878130 ) ) ( not ( = ?auto_878120 ?auto_878131 ) ) ( not ( = ?auto_878120 ?auto_878132 ) ) ( not ( = ?auto_878120 ?auto_878133 ) ) ( not ( = ?auto_878120 ?auto_878134 ) ) ( not ( = ?auto_878120 ?auto_878135 ) ) ( not ( = ?auto_878121 ?auto_878122 ) ) ( not ( = ?auto_878121 ?auto_878123 ) ) ( not ( = ?auto_878121 ?auto_878124 ) ) ( not ( = ?auto_878121 ?auto_878125 ) ) ( not ( = ?auto_878121 ?auto_878126 ) ) ( not ( = ?auto_878121 ?auto_878127 ) ) ( not ( = ?auto_878121 ?auto_878128 ) ) ( not ( = ?auto_878121 ?auto_878129 ) ) ( not ( = ?auto_878121 ?auto_878130 ) ) ( not ( = ?auto_878121 ?auto_878131 ) ) ( not ( = ?auto_878121 ?auto_878132 ) ) ( not ( = ?auto_878121 ?auto_878133 ) ) ( not ( = ?auto_878121 ?auto_878134 ) ) ( not ( = ?auto_878121 ?auto_878135 ) ) ( not ( = ?auto_878122 ?auto_878123 ) ) ( not ( = ?auto_878122 ?auto_878124 ) ) ( not ( = ?auto_878122 ?auto_878125 ) ) ( not ( = ?auto_878122 ?auto_878126 ) ) ( not ( = ?auto_878122 ?auto_878127 ) ) ( not ( = ?auto_878122 ?auto_878128 ) ) ( not ( = ?auto_878122 ?auto_878129 ) ) ( not ( = ?auto_878122 ?auto_878130 ) ) ( not ( = ?auto_878122 ?auto_878131 ) ) ( not ( = ?auto_878122 ?auto_878132 ) ) ( not ( = ?auto_878122 ?auto_878133 ) ) ( not ( = ?auto_878122 ?auto_878134 ) ) ( not ( = ?auto_878122 ?auto_878135 ) ) ( not ( = ?auto_878123 ?auto_878124 ) ) ( not ( = ?auto_878123 ?auto_878125 ) ) ( not ( = ?auto_878123 ?auto_878126 ) ) ( not ( = ?auto_878123 ?auto_878127 ) ) ( not ( = ?auto_878123 ?auto_878128 ) ) ( not ( = ?auto_878123 ?auto_878129 ) ) ( not ( = ?auto_878123 ?auto_878130 ) ) ( not ( = ?auto_878123 ?auto_878131 ) ) ( not ( = ?auto_878123 ?auto_878132 ) ) ( not ( = ?auto_878123 ?auto_878133 ) ) ( not ( = ?auto_878123 ?auto_878134 ) ) ( not ( = ?auto_878123 ?auto_878135 ) ) ( not ( = ?auto_878124 ?auto_878125 ) ) ( not ( = ?auto_878124 ?auto_878126 ) ) ( not ( = ?auto_878124 ?auto_878127 ) ) ( not ( = ?auto_878124 ?auto_878128 ) ) ( not ( = ?auto_878124 ?auto_878129 ) ) ( not ( = ?auto_878124 ?auto_878130 ) ) ( not ( = ?auto_878124 ?auto_878131 ) ) ( not ( = ?auto_878124 ?auto_878132 ) ) ( not ( = ?auto_878124 ?auto_878133 ) ) ( not ( = ?auto_878124 ?auto_878134 ) ) ( not ( = ?auto_878124 ?auto_878135 ) ) ( not ( = ?auto_878125 ?auto_878126 ) ) ( not ( = ?auto_878125 ?auto_878127 ) ) ( not ( = ?auto_878125 ?auto_878128 ) ) ( not ( = ?auto_878125 ?auto_878129 ) ) ( not ( = ?auto_878125 ?auto_878130 ) ) ( not ( = ?auto_878125 ?auto_878131 ) ) ( not ( = ?auto_878125 ?auto_878132 ) ) ( not ( = ?auto_878125 ?auto_878133 ) ) ( not ( = ?auto_878125 ?auto_878134 ) ) ( not ( = ?auto_878125 ?auto_878135 ) ) ( not ( = ?auto_878126 ?auto_878127 ) ) ( not ( = ?auto_878126 ?auto_878128 ) ) ( not ( = ?auto_878126 ?auto_878129 ) ) ( not ( = ?auto_878126 ?auto_878130 ) ) ( not ( = ?auto_878126 ?auto_878131 ) ) ( not ( = ?auto_878126 ?auto_878132 ) ) ( not ( = ?auto_878126 ?auto_878133 ) ) ( not ( = ?auto_878126 ?auto_878134 ) ) ( not ( = ?auto_878126 ?auto_878135 ) ) ( not ( = ?auto_878127 ?auto_878128 ) ) ( not ( = ?auto_878127 ?auto_878129 ) ) ( not ( = ?auto_878127 ?auto_878130 ) ) ( not ( = ?auto_878127 ?auto_878131 ) ) ( not ( = ?auto_878127 ?auto_878132 ) ) ( not ( = ?auto_878127 ?auto_878133 ) ) ( not ( = ?auto_878127 ?auto_878134 ) ) ( not ( = ?auto_878127 ?auto_878135 ) ) ( not ( = ?auto_878128 ?auto_878129 ) ) ( not ( = ?auto_878128 ?auto_878130 ) ) ( not ( = ?auto_878128 ?auto_878131 ) ) ( not ( = ?auto_878128 ?auto_878132 ) ) ( not ( = ?auto_878128 ?auto_878133 ) ) ( not ( = ?auto_878128 ?auto_878134 ) ) ( not ( = ?auto_878128 ?auto_878135 ) ) ( not ( = ?auto_878129 ?auto_878130 ) ) ( not ( = ?auto_878129 ?auto_878131 ) ) ( not ( = ?auto_878129 ?auto_878132 ) ) ( not ( = ?auto_878129 ?auto_878133 ) ) ( not ( = ?auto_878129 ?auto_878134 ) ) ( not ( = ?auto_878129 ?auto_878135 ) ) ( not ( = ?auto_878130 ?auto_878131 ) ) ( not ( = ?auto_878130 ?auto_878132 ) ) ( not ( = ?auto_878130 ?auto_878133 ) ) ( not ( = ?auto_878130 ?auto_878134 ) ) ( not ( = ?auto_878130 ?auto_878135 ) ) ( not ( = ?auto_878131 ?auto_878132 ) ) ( not ( = ?auto_878131 ?auto_878133 ) ) ( not ( = ?auto_878131 ?auto_878134 ) ) ( not ( = ?auto_878131 ?auto_878135 ) ) ( not ( = ?auto_878132 ?auto_878133 ) ) ( not ( = ?auto_878132 ?auto_878134 ) ) ( not ( = ?auto_878132 ?auto_878135 ) ) ( not ( = ?auto_878133 ?auto_878134 ) ) ( not ( = ?auto_878133 ?auto_878135 ) ) ( not ( = ?auto_878134 ?auto_878135 ) ) ( ON ?auto_878133 ?auto_878134 ) ( ON ?auto_878132 ?auto_878133 ) ( CLEAR ?auto_878130 ) ( ON ?auto_878131 ?auto_878132 ) ( CLEAR ?auto_878131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_878118 ?auto_878119 ?auto_878120 ?auto_878121 ?auto_878122 ?auto_878123 ?auto_878124 ?auto_878125 ?auto_878126 ?auto_878127 ?auto_878128 ?auto_878129 ?auto_878130 ?auto_878131 )
      ( MAKE-17PILE ?auto_878118 ?auto_878119 ?auto_878120 ?auto_878121 ?auto_878122 ?auto_878123 ?auto_878124 ?auto_878125 ?auto_878126 ?auto_878127 ?auto_878128 ?auto_878129 ?auto_878130 ?auto_878131 ?auto_878132 ?auto_878133 ?auto_878134 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_878188 - BLOCK
      ?auto_878189 - BLOCK
      ?auto_878190 - BLOCK
      ?auto_878191 - BLOCK
      ?auto_878192 - BLOCK
      ?auto_878193 - BLOCK
      ?auto_878194 - BLOCK
      ?auto_878195 - BLOCK
      ?auto_878196 - BLOCK
      ?auto_878197 - BLOCK
      ?auto_878198 - BLOCK
      ?auto_878199 - BLOCK
      ?auto_878200 - BLOCK
      ?auto_878201 - BLOCK
      ?auto_878202 - BLOCK
      ?auto_878203 - BLOCK
      ?auto_878204 - BLOCK
    )
    :vars
    (
      ?auto_878205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_878204 ?auto_878205 ) ( ON-TABLE ?auto_878188 ) ( ON ?auto_878189 ?auto_878188 ) ( ON ?auto_878190 ?auto_878189 ) ( ON ?auto_878191 ?auto_878190 ) ( ON ?auto_878192 ?auto_878191 ) ( ON ?auto_878193 ?auto_878192 ) ( ON ?auto_878194 ?auto_878193 ) ( ON ?auto_878195 ?auto_878194 ) ( ON ?auto_878196 ?auto_878195 ) ( ON ?auto_878197 ?auto_878196 ) ( ON ?auto_878198 ?auto_878197 ) ( ON ?auto_878199 ?auto_878198 ) ( not ( = ?auto_878188 ?auto_878189 ) ) ( not ( = ?auto_878188 ?auto_878190 ) ) ( not ( = ?auto_878188 ?auto_878191 ) ) ( not ( = ?auto_878188 ?auto_878192 ) ) ( not ( = ?auto_878188 ?auto_878193 ) ) ( not ( = ?auto_878188 ?auto_878194 ) ) ( not ( = ?auto_878188 ?auto_878195 ) ) ( not ( = ?auto_878188 ?auto_878196 ) ) ( not ( = ?auto_878188 ?auto_878197 ) ) ( not ( = ?auto_878188 ?auto_878198 ) ) ( not ( = ?auto_878188 ?auto_878199 ) ) ( not ( = ?auto_878188 ?auto_878200 ) ) ( not ( = ?auto_878188 ?auto_878201 ) ) ( not ( = ?auto_878188 ?auto_878202 ) ) ( not ( = ?auto_878188 ?auto_878203 ) ) ( not ( = ?auto_878188 ?auto_878204 ) ) ( not ( = ?auto_878188 ?auto_878205 ) ) ( not ( = ?auto_878189 ?auto_878190 ) ) ( not ( = ?auto_878189 ?auto_878191 ) ) ( not ( = ?auto_878189 ?auto_878192 ) ) ( not ( = ?auto_878189 ?auto_878193 ) ) ( not ( = ?auto_878189 ?auto_878194 ) ) ( not ( = ?auto_878189 ?auto_878195 ) ) ( not ( = ?auto_878189 ?auto_878196 ) ) ( not ( = ?auto_878189 ?auto_878197 ) ) ( not ( = ?auto_878189 ?auto_878198 ) ) ( not ( = ?auto_878189 ?auto_878199 ) ) ( not ( = ?auto_878189 ?auto_878200 ) ) ( not ( = ?auto_878189 ?auto_878201 ) ) ( not ( = ?auto_878189 ?auto_878202 ) ) ( not ( = ?auto_878189 ?auto_878203 ) ) ( not ( = ?auto_878189 ?auto_878204 ) ) ( not ( = ?auto_878189 ?auto_878205 ) ) ( not ( = ?auto_878190 ?auto_878191 ) ) ( not ( = ?auto_878190 ?auto_878192 ) ) ( not ( = ?auto_878190 ?auto_878193 ) ) ( not ( = ?auto_878190 ?auto_878194 ) ) ( not ( = ?auto_878190 ?auto_878195 ) ) ( not ( = ?auto_878190 ?auto_878196 ) ) ( not ( = ?auto_878190 ?auto_878197 ) ) ( not ( = ?auto_878190 ?auto_878198 ) ) ( not ( = ?auto_878190 ?auto_878199 ) ) ( not ( = ?auto_878190 ?auto_878200 ) ) ( not ( = ?auto_878190 ?auto_878201 ) ) ( not ( = ?auto_878190 ?auto_878202 ) ) ( not ( = ?auto_878190 ?auto_878203 ) ) ( not ( = ?auto_878190 ?auto_878204 ) ) ( not ( = ?auto_878190 ?auto_878205 ) ) ( not ( = ?auto_878191 ?auto_878192 ) ) ( not ( = ?auto_878191 ?auto_878193 ) ) ( not ( = ?auto_878191 ?auto_878194 ) ) ( not ( = ?auto_878191 ?auto_878195 ) ) ( not ( = ?auto_878191 ?auto_878196 ) ) ( not ( = ?auto_878191 ?auto_878197 ) ) ( not ( = ?auto_878191 ?auto_878198 ) ) ( not ( = ?auto_878191 ?auto_878199 ) ) ( not ( = ?auto_878191 ?auto_878200 ) ) ( not ( = ?auto_878191 ?auto_878201 ) ) ( not ( = ?auto_878191 ?auto_878202 ) ) ( not ( = ?auto_878191 ?auto_878203 ) ) ( not ( = ?auto_878191 ?auto_878204 ) ) ( not ( = ?auto_878191 ?auto_878205 ) ) ( not ( = ?auto_878192 ?auto_878193 ) ) ( not ( = ?auto_878192 ?auto_878194 ) ) ( not ( = ?auto_878192 ?auto_878195 ) ) ( not ( = ?auto_878192 ?auto_878196 ) ) ( not ( = ?auto_878192 ?auto_878197 ) ) ( not ( = ?auto_878192 ?auto_878198 ) ) ( not ( = ?auto_878192 ?auto_878199 ) ) ( not ( = ?auto_878192 ?auto_878200 ) ) ( not ( = ?auto_878192 ?auto_878201 ) ) ( not ( = ?auto_878192 ?auto_878202 ) ) ( not ( = ?auto_878192 ?auto_878203 ) ) ( not ( = ?auto_878192 ?auto_878204 ) ) ( not ( = ?auto_878192 ?auto_878205 ) ) ( not ( = ?auto_878193 ?auto_878194 ) ) ( not ( = ?auto_878193 ?auto_878195 ) ) ( not ( = ?auto_878193 ?auto_878196 ) ) ( not ( = ?auto_878193 ?auto_878197 ) ) ( not ( = ?auto_878193 ?auto_878198 ) ) ( not ( = ?auto_878193 ?auto_878199 ) ) ( not ( = ?auto_878193 ?auto_878200 ) ) ( not ( = ?auto_878193 ?auto_878201 ) ) ( not ( = ?auto_878193 ?auto_878202 ) ) ( not ( = ?auto_878193 ?auto_878203 ) ) ( not ( = ?auto_878193 ?auto_878204 ) ) ( not ( = ?auto_878193 ?auto_878205 ) ) ( not ( = ?auto_878194 ?auto_878195 ) ) ( not ( = ?auto_878194 ?auto_878196 ) ) ( not ( = ?auto_878194 ?auto_878197 ) ) ( not ( = ?auto_878194 ?auto_878198 ) ) ( not ( = ?auto_878194 ?auto_878199 ) ) ( not ( = ?auto_878194 ?auto_878200 ) ) ( not ( = ?auto_878194 ?auto_878201 ) ) ( not ( = ?auto_878194 ?auto_878202 ) ) ( not ( = ?auto_878194 ?auto_878203 ) ) ( not ( = ?auto_878194 ?auto_878204 ) ) ( not ( = ?auto_878194 ?auto_878205 ) ) ( not ( = ?auto_878195 ?auto_878196 ) ) ( not ( = ?auto_878195 ?auto_878197 ) ) ( not ( = ?auto_878195 ?auto_878198 ) ) ( not ( = ?auto_878195 ?auto_878199 ) ) ( not ( = ?auto_878195 ?auto_878200 ) ) ( not ( = ?auto_878195 ?auto_878201 ) ) ( not ( = ?auto_878195 ?auto_878202 ) ) ( not ( = ?auto_878195 ?auto_878203 ) ) ( not ( = ?auto_878195 ?auto_878204 ) ) ( not ( = ?auto_878195 ?auto_878205 ) ) ( not ( = ?auto_878196 ?auto_878197 ) ) ( not ( = ?auto_878196 ?auto_878198 ) ) ( not ( = ?auto_878196 ?auto_878199 ) ) ( not ( = ?auto_878196 ?auto_878200 ) ) ( not ( = ?auto_878196 ?auto_878201 ) ) ( not ( = ?auto_878196 ?auto_878202 ) ) ( not ( = ?auto_878196 ?auto_878203 ) ) ( not ( = ?auto_878196 ?auto_878204 ) ) ( not ( = ?auto_878196 ?auto_878205 ) ) ( not ( = ?auto_878197 ?auto_878198 ) ) ( not ( = ?auto_878197 ?auto_878199 ) ) ( not ( = ?auto_878197 ?auto_878200 ) ) ( not ( = ?auto_878197 ?auto_878201 ) ) ( not ( = ?auto_878197 ?auto_878202 ) ) ( not ( = ?auto_878197 ?auto_878203 ) ) ( not ( = ?auto_878197 ?auto_878204 ) ) ( not ( = ?auto_878197 ?auto_878205 ) ) ( not ( = ?auto_878198 ?auto_878199 ) ) ( not ( = ?auto_878198 ?auto_878200 ) ) ( not ( = ?auto_878198 ?auto_878201 ) ) ( not ( = ?auto_878198 ?auto_878202 ) ) ( not ( = ?auto_878198 ?auto_878203 ) ) ( not ( = ?auto_878198 ?auto_878204 ) ) ( not ( = ?auto_878198 ?auto_878205 ) ) ( not ( = ?auto_878199 ?auto_878200 ) ) ( not ( = ?auto_878199 ?auto_878201 ) ) ( not ( = ?auto_878199 ?auto_878202 ) ) ( not ( = ?auto_878199 ?auto_878203 ) ) ( not ( = ?auto_878199 ?auto_878204 ) ) ( not ( = ?auto_878199 ?auto_878205 ) ) ( not ( = ?auto_878200 ?auto_878201 ) ) ( not ( = ?auto_878200 ?auto_878202 ) ) ( not ( = ?auto_878200 ?auto_878203 ) ) ( not ( = ?auto_878200 ?auto_878204 ) ) ( not ( = ?auto_878200 ?auto_878205 ) ) ( not ( = ?auto_878201 ?auto_878202 ) ) ( not ( = ?auto_878201 ?auto_878203 ) ) ( not ( = ?auto_878201 ?auto_878204 ) ) ( not ( = ?auto_878201 ?auto_878205 ) ) ( not ( = ?auto_878202 ?auto_878203 ) ) ( not ( = ?auto_878202 ?auto_878204 ) ) ( not ( = ?auto_878202 ?auto_878205 ) ) ( not ( = ?auto_878203 ?auto_878204 ) ) ( not ( = ?auto_878203 ?auto_878205 ) ) ( not ( = ?auto_878204 ?auto_878205 ) ) ( ON ?auto_878203 ?auto_878204 ) ( ON ?auto_878202 ?auto_878203 ) ( ON ?auto_878201 ?auto_878202 ) ( CLEAR ?auto_878199 ) ( ON ?auto_878200 ?auto_878201 ) ( CLEAR ?auto_878200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_878188 ?auto_878189 ?auto_878190 ?auto_878191 ?auto_878192 ?auto_878193 ?auto_878194 ?auto_878195 ?auto_878196 ?auto_878197 ?auto_878198 ?auto_878199 ?auto_878200 )
      ( MAKE-17PILE ?auto_878188 ?auto_878189 ?auto_878190 ?auto_878191 ?auto_878192 ?auto_878193 ?auto_878194 ?auto_878195 ?auto_878196 ?auto_878197 ?auto_878198 ?auto_878199 ?auto_878200 ?auto_878201 ?auto_878202 ?auto_878203 ?auto_878204 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_878258 - BLOCK
      ?auto_878259 - BLOCK
      ?auto_878260 - BLOCK
      ?auto_878261 - BLOCK
      ?auto_878262 - BLOCK
      ?auto_878263 - BLOCK
      ?auto_878264 - BLOCK
      ?auto_878265 - BLOCK
      ?auto_878266 - BLOCK
      ?auto_878267 - BLOCK
      ?auto_878268 - BLOCK
      ?auto_878269 - BLOCK
      ?auto_878270 - BLOCK
      ?auto_878271 - BLOCK
      ?auto_878272 - BLOCK
      ?auto_878273 - BLOCK
      ?auto_878274 - BLOCK
    )
    :vars
    (
      ?auto_878275 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_878274 ?auto_878275 ) ( ON-TABLE ?auto_878258 ) ( ON ?auto_878259 ?auto_878258 ) ( ON ?auto_878260 ?auto_878259 ) ( ON ?auto_878261 ?auto_878260 ) ( ON ?auto_878262 ?auto_878261 ) ( ON ?auto_878263 ?auto_878262 ) ( ON ?auto_878264 ?auto_878263 ) ( ON ?auto_878265 ?auto_878264 ) ( ON ?auto_878266 ?auto_878265 ) ( ON ?auto_878267 ?auto_878266 ) ( ON ?auto_878268 ?auto_878267 ) ( not ( = ?auto_878258 ?auto_878259 ) ) ( not ( = ?auto_878258 ?auto_878260 ) ) ( not ( = ?auto_878258 ?auto_878261 ) ) ( not ( = ?auto_878258 ?auto_878262 ) ) ( not ( = ?auto_878258 ?auto_878263 ) ) ( not ( = ?auto_878258 ?auto_878264 ) ) ( not ( = ?auto_878258 ?auto_878265 ) ) ( not ( = ?auto_878258 ?auto_878266 ) ) ( not ( = ?auto_878258 ?auto_878267 ) ) ( not ( = ?auto_878258 ?auto_878268 ) ) ( not ( = ?auto_878258 ?auto_878269 ) ) ( not ( = ?auto_878258 ?auto_878270 ) ) ( not ( = ?auto_878258 ?auto_878271 ) ) ( not ( = ?auto_878258 ?auto_878272 ) ) ( not ( = ?auto_878258 ?auto_878273 ) ) ( not ( = ?auto_878258 ?auto_878274 ) ) ( not ( = ?auto_878258 ?auto_878275 ) ) ( not ( = ?auto_878259 ?auto_878260 ) ) ( not ( = ?auto_878259 ?auto_878261 ) ) ( not ( = ?auto_878259 ?auto_878262 ) ) ( not ( = ?auto_878259 ?auto_878263 ) ) ( not ( = ?auto_878259 ?auto_878264 ) ) ( not ( = ?auto_878259 ?auto_878265 ) ) ( not ( = ?auto_878259 ?auto_878266 ) ) ( not ( = ?auto_878259 ?auto_878267 ) ) ( not ( = ?auto_878259 ?auto_878268 ) ) ( not ( = ?auto_878259 ?auto_878269 ) ) ( not ( = ?auto_878259 ?auto_878270 ) ) ( not ( = ?auto_878259 ?auto_878271 ) ) ( not ( = ?auto_878259 ?auto_878272 ) ) ( not ( = ?auto_878259 ?auto_878273 ) ) ( not ( = ?auto_878259 ?auto_878274 ) ) ( not ( = ?auto_878259 ?auto_878275 ) ) ( not ( = ?auto_878260 ?auto_878261 ) ) ( not ( = ?auto_878260 ?auto_878262 ) ) ( not ( = ?auto_878260 ?auto_878263 ) ) ( not ( = ?auto_878260 ?auto_878264 ) ) ( not ( = ?auto_878260 ?auto_878265 ) ) ( not ( = ?auto_878260 ?auto_878266 ) ) ( not ( = ?auto_878260 ?auto_878267 ) ) ( not ( = ?auto_878260 ?auto_878268 ) ) ( not ( = ?auto_878260 ?auto_878269 ) ) ( not ( = ?auto_878260 ?auto_878270 ) ) ( not ( = ?auto_878260 ?auto_878271 ) ) ( not ( = ?auto_878260 ?auto_878272 ) ) ( not ( = ?auto_878260 ?auto_878273 ) ) ( not ( = ?auto_878260 ?auto_878274 ) ) ( not ( = ?auto_878260 ?auto_878275 ) ) ( not ( = ?auto_878261 ?auto_878262 ) ) ( not ( = ?auto_878261 ?auto_878263 ) ) ( not ( = ?auto_878261 ?auto_878264 ) ) ( not ( = ?auto_878261 ?auto_878265 ) ) ( not ( = ?auto_878261 ?auto_878266 ) ) ( not ( = ?auto_878261 ?auto_878267 ) ) ( not ( = ?auto_878261 ?auto_878268 ) ) ( not ( = ?auto_878261 ?auto_878269 ) ) ( not ( = ?auto_878261 ?auto_878270 ) ) ( not ( = ?auto_878261 ?auto_878271 ) ) ( not ( = ?auto_878261 ?auto_878272 ) ) ( not ( = ?auto_878261 ?auto_878273 ) ) ( not ( = ?auto_878261 ?auto_878274 ) ) ( not ( = ?auto_878261 ?auto_878275 ) ) ( not ( = ?auto_878262 ?auto_878263 ) ) ( not ( = ?auto_878262 ?auto_878264 ) ) ( not ( = ?auto_878262 ?auto_878265 ) ) ( not ( = ?auto_878262 ?auto_878266 ) ) ( not ( = ?auto_878262 ?auto_878267 ) ) ( not ( = ?auto_878262 ?auto_878268 ) ) ( not ( = ?auto_878262 ?auto_878269 ) ) ( not ( = ?auto_878262 ?auto_878270 ) ) ( not ( = ?auto_878262 ?auto_878271 ) ) ( not ( = ?auto_878262 ?auto_878272 ) ) ( not ( = ?auto_878262 ?auto_878273 ) ) ( not ( = ?auto_878262 ?auto_878274 ) ) ( not ( = ?auto_878262 ?auto_878275 ) ) ( not ( = ?auto_878263 ?auto_878264 ) ) ( not ( = ?auto_878263 ?auto_878265 ) ) ( not ( = ?auto_878263 ?auto_878266 ) ) ( not ( = ?auto_878263 ?auto_878267 ) ) ( not ( = ?auto_878263 ?auto_878268 ) ) ( not ( = ?auto_878263 ?auto_878269 ) ) ( not ( = ?auto_878263 ?auto_878270 ) ) ( not ( = ?auto_878263 ?auto_878271 ) ) ( not ( = ?auto_878263 ?auto_878272 ) ) ( not ( = ?auto_878263 ?auto_878273 ) ) ( not ( = ?auto_878263 ?auto_878274 ) ) ( not ( = ?auto_878263 ?auto_878275 ) ) ( not ( = ?auto_878264 ?auto_878265 ) ) ( not ( = ?auto_878264 ?auto_878266 ) ) ( not ( = ?auto_878264 ?auto_878267 ) ) ( not ( = ?auto_878264 ?auto_878268 ) ) ( not ( = ?auto_878264 ?auto_878269 ) ) ( not ( = ?auto_878264 ?auto_878270 ) ) ( not ( = ?auto_878264 ?auto_878271 ) ) ( not ( = ?auto_878264 ?auto_878272 ) ) ( not ( = ?auto_878264 ?auto_878273 ) ) ( not ( = ?auto_878264 ?auto_878274 ) ) ( not ( = ?auto_878264 ?auto_878275 ) ) ( not ( = ?auto_878265 ?auto_878266 ) ) ( not ( = ?auto_878265 ?auto_878267 ) ) ( not ( = ?auto_878265 ?auto_878268 ) ) ( not ( = ?auto_878265 ?auto_878269 ) ) ( not ( = ?auto_878265 ?auto_878270 ) ) ( not ( = ?auto_878265 ?auto_878271 ) ) ( not ( = ?auto_878265 ?auto_878272 ) ) ( not ( = ?auto_878265 ?auto_878273 ) ) ( not ( = ?auto_878265 ?auto_878274 ) ) ( not ( = ?auto_878265 ?auto_878275 ) ) ( not ( = ?auto_878266 ?auto_878267 ) ) ( not ( = ?auto_878266 ?auto_878268 ) ) ( not ( = ?auto_878266 ?auto_878269 ) ) ( not ( = ?auto_878266 ?auto_878270 ) ) ( not ( = ?auto_878266 ?auto_878271 ) ) ( not ( = ?auto_878266 ?auto_878272 ) ) ( not ( = ?auto_878266 ?auto_878273 ) ) ( not ( = ?auto_878266 ?auto_878274 ) ) ( not ( = ?auto_878266 ?auto_878275 ) ) ( not ( = ?auto_878267 ?auto_878268 ) ) ( not ( = ?auto_878267 ?auto_878269 ) ) ( not ( = ?auto_878267 ?auto_878270 ) ) ( not ( = ?auto_878267 ?auto_878271 ) ) ( not ( = ?auto_878267 ?auto_878272 ) ) ( not ( = ?auto_878267 ?auto_878273 ) ) ( not ( = ?auto_878267 ?auto_878274 ) ) ( not ( = ?auto_878267 ?auto_878275 ) ) ( not ( = ?auto_878268 ?auto_878269 ) ) ( not ( = ?auto_878268 ?auto_878270 ) ) ( not ( = ?auto_878268 ?auto_878271 ) ) ( not ( = ?auto_878268 ?auto_878272 ) ) ( not ( = ?auto_878268 ?auto_878273 ) ) ( not ( = ?auto_878268 ?auto_878274 ) ) ( not ( = ?auto_878268 ?auto_878275 ) ) ( not ( = ?auto_878269 ?auto_878270 ) ) ( not ( = ?auto_878269 ?auto_878271 ) ) ( not ( = ?auto_878269 ?auto_878272 ) ) ( not ( = ?auto_878269 ?auto_878273 ) ) ( not ( = ?auto_878269 ?auto_878274 ) ) ( not ( = ?auto_878269 ?auto_878275 ) ) ( not ( = ?auto_878270 ?auto_878271 ) ) ( not ( = ?auto_878270 ?auto_878272 ) ) ( not ( = ?auto_878270 ?auto_878273 ) ) ( not ( = ?auto_878270 ?auto_878274 ) ) ( not ( = ?auto_878270 ?auto_878275 ) ) ( not ( = ?auto_878271 ?auto_878272 ) ) ( not ( = ?auto_878271 ?auto_878273 ) ) ( not ( = ?auto_878271 ?auto_878274 ) ) ( not ( = ?auto_878271 ?auto_878275 ) ) ( not ( = ?auto_878272 ?auto_878273 ) ) ( not ( = ?auto_878272 ?auto_878274 ) ) ( not ( = ?auto_878272 ?auto_878275 ) ) ( not ( = ?auto_878273 ?auto_878274 ) ) ( not ( = ?auto_878273 ?auto_878275 ) ) ( not ( = ?auto_878274 ?auto_878275 ) ) ( ON ?auto_878273 ?auto_878274 ) ( ON ?auto_878272 ?auto_878273 ) ( ON ?auto_878271 ?auto_878272 ) ( ON ?auto_878270 ?auto_878271 ) ( CLEAR ?auto_878268 ) ( ON ?auto_878269 ?auto_878270 ) ( CLEAR ?auto_878269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_878258 ?auto_878259 ?auto_878260 ?auto_878261 ?auto_878262 ?auto_878263 ?auto_878264 ?auto_878265 ?auto_878266 ?auto_878267 ?auto_878268 ?auto_878269 )
      ( MAKE-17PILE ?auto_878258 ?auto_878259 ?auto_878260 ?auto_878261 ?auto_878262 ?auto_878263 ?auto_878264 ?auto_878265 ?auto_878266 ?auto_878267 ?auto_878268 ?auto_878269 ?auto_878270 ?auto_878271 ?auto_878272 ?auto_878273 ?auto_878274 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_878328 - BLOCK
      ?auto_878329 - BLOCK
      ?auto_878330 - BLOCK
      ?auto_878331 - BLOCK
      ?auto_878332 - BLOCK
      ?auto_878333 - BLOCK
      ?auto_878334 - BLOCK
      ?auto_878335 - BLOCK
      ?auto_878336 - BLOCK
      ?auto_878337 - BLOCK
      ?auto_878338 - BLOCK
      ?auto_878339 - BLOCK
      ?auto_878340 - BLOCK
      ?auto_878341 - BLOCK
      ?auto_878342 - BLOCK
      ?auto_878343 - BLOCK
      ?auto_878344 - BLOCK
    )
    :vars
    (
      ?auto_878345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_878344 ?auto_878345 ) ( ON-TABLE ?auto_878328 ) ( ON ?auto_878329 ?auto_878328 ) ( ON ?auto_878330 ?auto_878329 ) ( ON ?auto_878331 ?auto_878330 ) ( ON ?auto_878332 ?auto_878331 ) ( ON ?auto_878333 ?auto_878332 ) ( ON ?auto_878334 ?auto_878333 ) ( ON ?auto_878335 ?auto_878334 ) ( ON ?auto_878336 ?auto_878335 ) ( ON ?auto_878337 ?auto_878336 ) ( not ( = ?auto_878328 ?auto_878329 ) ) ( not ( = ?auto_878328 ?auto_878330 ) ) ( not ( = ?auto_878328 ?auto_878331 ) ) ( not ( = ?auto_878328 ?auto_878332 ) ) ( not ( = ?auto_878328 ?auto_878333 ) ) ( not ( = ?auto_878328 ?auto_878334 ) ) ( not ( = ?auto_878328 ?auto_878335 ) ) ( not ( = ?auto_878328 ?auto_878336 ) ) ( not ( = ?auto_878328 ?auto_878337 ) ) ( not ( = ?auto_878328 ?auto_878338 ) ) ( not ( = ?auto_878328 ?auto_878339 ) ) ( not ( = ?auto_878328 ?auto_878340 ) ) ( not ( = ?auto_878328 ?auto_878341 ) ) ( not ( = ?auto_878328 ?auto_878342 ) ) ( not ( = ?auto_878328 ?auto_878343 ) ) ( not ( = ?auto_878328 ?auto_878344 ) ) ( not ( = ?auto_878328 ?auto_878345 ) ) ( not ( = ?auto_878329 ?auto_878330 ) ) ( not ( = ?auto_878329 ?auto_878331 ) ) ( not ( = ?auto_878329 ?auto_878332 ) ) ( not ( = ?auto_878329 ?auto_878333 ) ) ( not ( = ?auto_878329 ?auto_878334 ) ) ( not ( = ?auto_878329 ?auto_878335 ) ) ( not ( = ?auto_878329 ?auto_878336 ) ) ( not ( = ?auto_878329 ?auto_878337 ) ) ( not ( = ?auto_878329 ?auto_878338 ) ) ( not ( = ?auto_878329 ?auto_878339 ) ) ( not ( = ?auto_878329 ?auto_878340 ) ) ( not ( = ?auto_878329 ?auto_878341 ) ) ( not ( = ?auto_878329 ?auto_878342 ) ) ( not ( = ?auto_878329 ?auto_878343 ) ) ( not ( = ?auto_878329 ?auto_878344 ) ) ( not ( = ?auto_878329 ?auto_878345 ) ) ( not ( = ?auto_878330 ?auto_878331 ) ) ( not ( = ?auto_878330 ?auto_878332 ) ) ( not ( = ?auto_878330 ?auto_878333 ) ) ( not ( = ?auto_878330 ?auto_878334 ) ) ( not ( = ?auto_878330 ?auto_878335 ) ) ( not ( = ?auto_878330 ?auto_878336 ) ) ( not ( = ?auto_878330 ?auto_878337 ) ) ( not ( = ?auto_878330 ?auto_878338 ) ) ( not ( = ?auto_878330 ?auto_878339 ) ) ( not ( = ?auto_878330 ?auto_878340 ) ) ( not ( = ?auto_878330 ?auto_878341 ) ) ( not ( = ?auto_878330 ?auto_878342 ) ) ( not ( = ?auto_878330 ?auto_878343 ) ) ( not ( = ?auto_878330 ?auto_878344 ) ) ( not ( = ?auto_878330 ?auto_878345 ) ) ( not ( = ?auto_878331 ?auto_878332 ) ) ( not ( = ?auto_878331 ?auto_878333 ) ) ( not ( = ?auto_878331 ?auto_878334 ) ) ( not ( = ?auto_878331 ?auto_878335 ) ) ( not ( = ?auto_878331 ?auto_878336 ) ) ( not ( = ?auto_878331 ?auto_878337 ) ) ( not ( = ?auto_878331 ?auto_878338 ) ) ( not ( = ?auto_878331 ?auto_878339 ) ) ( not ( = ?auto_878331 ?auto_878340 ) ) ( not ( = ?auto_878331 ?auto_878341 ) ) ( not ( = ?auto_878331 ?auto_878342 ) ) ( not ( = ?auto_878331 ?auto_878343 ) ) ( not ( = ?auto_878331 ?auto_878344 ) ) ( not ( = ?auto_878331 ?auto_878345 ) ) ( not ( = ?auto_878332 ?auto_878333 ) ) ( not ( = ?auto_878332 ?auto_878334 ) ) ( not ( = ?auto_878332 ?auto_878335 ) ) ( not ( = ?auto_878332 ?auto_878336 ) ) ( not ( = ?auto_878332 ?auto_878337 ) ) ( not ( = ?auto_878332 ?auto_878338 ) ) ( not ( = ?auto_878332 ?auto_878339 ) ) ( not ( = ?auto_878332 ?auto_878340 ) ) ( not ( = ?auto_878332 ?auto_878341 ) ) ( not ( = ?auto_878332 ?auto_878342 ) ) ( not ( = ?auto_878332 ?auto_878343 ) ) ( not ( = ?auto_878332 ?auto_878344 ) ) ( not ( = ?auto_878332 ?auto_878345 ) ) ( not ( = ?auto_878333 ?auto_878334 ) ) ( not ( = ?auto_878333 ?auto_878335 ) ) ( not ( = ?auto_878333 ?auto_878336 ) ) ( not ( = ?auto_878333 ?auto_878337 ) ) ( not ( = ?auto_878333 ?auto_878338 ) ) ( not ( = ?auto_878333 ?auto_878339 ) ) ( not ( = ?auto_878333 ?auto_878340 ) ) ( not ( = ?auto_878333 ?auto_878341 ) ) ( not ( = ?auto_878333 ?auto_878342 ) ) ( not ( = ?auto_878333 ?auto_878343 ) ) ( not ( = ?auto_878333 ?auto_878344 ) ) ( not ( = ?auto_878333 ?auto_878345 ) ) ( not ( = ?auto_878334 ?auto_878335 ) ) ( not ( = ?auto_878334 ?auto_878336 ) ) ( not ( = ?auto_878334 ?auto_878337 ) ) ( not ( = ?auto_878334 ?auto_878338 ) ) ( not ( = ?auto_878334 ?auto_878339 ) ) ( not ( = ?auto_878334 ?auto_878340 ) ) ( not ( = ?auto_878334 ?auto_878341 ) ) ( not ( = ?auto_878334 ?auto_878342 ) ) ( not ( = ?auto_878334 ?auto_878343 ) ) ( not ( = ?auto_878334 ?auto_878344 ) ) ( not ( = ?auto_878334 ?auto_878345 ) ) ( not ( = ?auto_878335 ?auto_878336 ) ) ( not ( = ?auto_878335 ?auto_878337 ) ) ( not ( = ?auto_878335 ?auto_878338 ) ) ( not ( = ?auto_878335 ?auto_878339 ) ) ( not ( = ?auto_878335 ?auto_878340 ) ) ( not ( = ?auto_878335 ?auto_878341 ) ) ( not ( = ?auto_878335 ?auto_878342 ) ) ( not ( = ?auto_878335 ?auto_878343 ) ) ( not ( = ?auto_878335 ?auto_878344 ) ) ( not ( = ?auto_878335 ?auto_878345 ) ) ( not ( = ?auto_878336 ?auto_878337 ) ) ( not ( = ?auto_878336 ?auto_878338 ) ) ( not ( = ?auto_878336 ?auto_878339 ) ) ( not ( = ?auto_878336 ?auto_878340 ) ) ( not ( = ?auto_878336 ?auto_878341 ) ) ( not ( = ?auto_878336 ?auto_878342 ) ) ( not ( = ?auto_878336 ?auto_878343 ) ) ( not ( = ?auto_878336 ?auto_878344 ) ) ( not ( = ?auto_878336 ?auto_878345 ) ) ( not ( = ?auto_878337 ?auto_878338 ) ) ( not ( = ?auto_878337 ?auto_878339 ) ) ( not ( = ?auto_878337 ?auto_878340 ) ) ( not ( = ?auto_878337 ?auto_878341 ) ) ( not ( = ?auto_878337 ?auto_878342 ) ) ( not ( = ?auto_878337 ?auto_878343 ) ) ( not ( = ?auto_878337 ?auto_878344 ) ) ( not ( = ?auto_878337 ?auto_878345 ) ) ( not ( = ?auto_878338 ?auto_878339 ) ) ( not ( = ?auto_878338 ?auto_878340 ) ) ( not ( = ?auto_878338 ?auto_878341 ) ) ( not ( = ?auto_878338 ?auto_878342 ) ) ( not ( = ?auto_878338 ?auto_878343 ) ) ( not ( = ?auto_878338 ?auto_878344 ) ) ( not ( = ?auto_878338 ?auto_878345 ) ) ( not ( = ?auto_878339 ?auto_878340 ) ) ( not ( = ?auto_878339 ?auto_878341 ) ) ( not ( = ?auto_878339 ?auto_878342 ) ) ( not ( = ?auto_878339 ?auto_878343 ) ) ( not ( = ?auto_878339 ?auto_878344 ) ) ( not ( = ?auto_878339 ?auto_878345 ) ) ( not ( = ?auto_878340 ?auto_878341 ) ) ( not ( = ?auto_878340 ?auto_878342 ) ) ( not ( = ?auto_878340 ?auto_878343 ) ) ( not ( = ?auto_878340 ?auto_878344 ) ) ( not ( = ?auto_878340 ?auto_878345 ) ) ( not ( = ?auto_878341 ?auto_878342 ) ) ( not ( = ?auto_878341 ?auto_878343 ) ) ( not ( = ?auto_878341 ?auto_878344 ) ) ( not ( = ?auto_878341 ?auto_878345 ) ) ( not ( = ?auto_878342 ?auto_878343 ) ) ( not ( = ?auto_878342 ?auto_878344 ) ) ( not ( = ?auto_878342 ?auto_878345 ) ) ( not ( = ?auto_878343 ?auto_878344 ) ) ( not ( = ?auto_878343 ?auto_878345 ) ) ( not ( = ?auto_878344 ?auto_878345 ) ) ( ON ?auto_878343 ?auto_878344 ) ( ON ?auto_878342 ?auto_878343 ) ( ON ?auto_878341 ?auto_878342 ) ( ON ?auto_878340 ?auto_878341 ) ( ON ?auto_878339 ?auto_878340 ) ( CLEAR ?auto_878337 ) ( ON ?auto_878338 ?auto_878339 ) ( CLEAR ?auto_878338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_878328 ?auto_878329 ?auto_878330 ?auto_878331 ?auto_878332 ?auto_878333 ?auto_878334 ?auto_878335 ?auto_878336 ?auto_878337 ?auto_878338 )
      ( MAKE-17PILE ?auto_878328 ?auto_878329 ?auto_878330 ?auto_878331 ?auto_878332 ?auto_878333 ?auto_878334 ?auto_878335 ?auto_878336 ?auto_878337 ?auto_878338 ?auto_878339 ?auto_878340 ?auto_878341 ?auto_878342 ?auto_878343 ?auto_878344 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_878398 - BLOCK
      ?auto_878399 - BLOCK
      ?auto_878400 - BLOCK
      ?auto_878401 - BLOCK
      ?auto_878402 - BLOCK
      ?auto_878403 - BLOCK
      ?auto_878404 - BLOCK
      ?auto_878405 - BLOCK
      ?auto_878406 - BLOCK
      ?auto_878407 - BLOCK
      ?auto_878408 - BLOCK
      ?auto_878409 - BLOCK
      ?auto_878410 - BLOCK
      ?auto_878411 - BLOCK
      ?auto_878412 - BLOCK
      ?auto_878413 - BLOCK
      ?auto_878414 - BLOCK
    )
    :vars
    (
      ?auto_878415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_878414 ?auto_878415 ) ( ON-TABLE ?auto_878398 ) ( ON ?auto_878399 ?auto_878398 ) ( ON ?auto_878400 ?auto_878399 ) ( ON ?auto_878401 ?auto_878400 ) ( ON ?auto_878402 ?auto_878401 ) ( ON ?auto_878403 ?auto_878402 ) ( ON ?auto_878404 ?auto_878403 ) ( ON ?auto_878405 ?auto_878404 ) ( ON ?auto_878406 ?auto_878405 ) ( not ( = ?auto_878398 ?auto_878399 ) ) ( not ( = ?auto_878398 ?auto_878400 ) ) ( not ( = ?auto_878398 ?auto_878401 ) ) ( not ( = ?auto_878398 ?auto_878402 ) ) ( not ( = ?auto_878398 ?auto_878403 ) ) ( not ( = ?auto_878398 ?auto_878404 ) ) ( not ( = ?auto_878398 ?auto_878405 ) ) ( not ( = ?auto_878398 ?auto_878406 ) ) ( not ( = ?auto_878398 ?auto_878407 ) ) ( not ( = ?auto_878398 ?auto_878408 ) ) ( not ( = ?auto_878398 ?auto_878409 ) ) ( not ( = ?auto_878398 ?auto_878410 ) ) ( not ( = ?auto_878398 ?auto_878411 ) ) ( not ( = ?auto_878398 ?auto_878412 ) ) ( not ( = ?auto_878398 ?auto_878413 ) ) ( not ( = ?auto_878398 ?auto_878414 ) ) ( not ( = ?auto_878398 ?auto_878415 ) ) ( not ( = ?auto_878399 ?auto_878400 ) ) ( not ( = ?auto_878399 ?auto_878401 ) ) ( not ( = ?auto_878399 ?auto_878402 ) ) ( not ( = ?auto_878399 ?auto_878403 ) ) ( not ( = ?auto_878399 ?auto_878404 ) ) ( not ( = ?auto_878399 ?auto_878405 ) ) ( not ( = ?auto_878399 ?auto_878406 ) ) ( not ( = ?auto_878399 ?auto_878407 ) ) ( not ( = ?auto_878399 ?auto_878408 ) ) ( not ( = ?auto_878399 ?auto_878409 ) ) ( not ( = ?auto_878399 ?auto_878410 ) ) ( not ( = ?auto_878399 ?auto_878411 ) ) ( not ( = ?auto_878399 ?auto_878412 ) ) ( not ( = ?auto_878399 ?auto_878413 ) ) ( not ( = ?auto_878399 ?auto_878414 ) ) ( not ( = ?auto_878399 ?auto_878415 ) ) ( not ( = ?auto_878400 ?auto_878401 ) ) ( not ( = ?auto_878400 ?auto_878402 ) ) ( not ( = ?auto_878400 ?auto_878403 ) ) ( not ( = ?auto_878400 ?auto_878404 ) ) ( not ( = ?auto_878400 ?auto_878405 ) ) ( not ( = ?auto_878400 ?auto_878406 ) ) ( not ( = ?auto_878400 ?auto_878407 ) ) ( not ( = ?auto_878400 ?auto_878408 ) ) ( not ( = ?auto_878400 ?auto_878409 ) ) ( not ( = ?auto_878400 ?auto_878410 ) ) ( not ( = ?auto_878400 ?auto_878411 ) ) ( not ( = ?auto_878400 ?auto_878412 ) ) ( not ( = ?auto_878400 ?auto_878413 ) ) ( not ( = ?auto_878400 ?auto_878414 ) ) ( not ( = ?auto_878400 ?auto_878415 ) ) ( not ( = ?auto_878401 ?auto_878402 ) ) ( not ( = ?auto_878401 ?auto_878403 ) ) ( not ( = ?auto_878401 ?auto_878404 ) ) ( not ( = ?auto_878401 ?auto_878405 ) ) ( not ( = ?auto_878401 ?auto_878406 ) ) ( not ( = ?auto_878401 ?auto_878407 ) ) ( not ( = ?auto_878401 ?auto_878408 ) ) ( not ( = ?auto_878401 ?auto_878409 ) ) ( not ( = ?auto_878401 ?auto_878410 ) ) ( not ( = ?auto_878401 ?auto_878411 ) ) ( not ( = ?auto_878401 ?auto_878412 ) ) ( not ( = ?auto_878401 ?auto_878413 ) ) ( not ( = ?auto_878401 ?auto_878414 ) ) ( not ( = ?auto_878401 ?auto_878415 ) ) ( not ( = ?auto_878402 ?auto_878403 ) ) ( not ( = ?auto_878402 ?auto_878404 ) ) ( not ( = ?auto_878402 ?auto_878405 ) ) ( not ( = ?auto_878402 ?auto_878406 ) ) ( not ( = ?auto_878402 ?auto_878407 ) ) ( not ( = ?auto_878402 ?auto_878408 ) ) ( not ( = ?auto_878402 ?auto_878409 ) ) ( not ( = ?auto_878402 ?auto_878410 ) ) ( not ( = ?auto_878402 ?auto_878411 ) ) ( not ( = ?auto_878402 ?auto_878412 ) ) ( not ( = ?auto_878402 ?auto_878413 ) ) ( not ( = ?auto_878402 ?auto_878414 ) ) ( not ( = ?auto_878402 ?auto_878415 ) ) ( not ( = ?auto_878403 ?auto_878404 ) ) ( not ( = ?auto_878403 ?auto_878405 ) ) ( not ( = ?auto_878403 ?auto_878406 ) ) ( not ( = ?auto_878403 ?auto_878407 ) ) ( not ( = ?auto_878403 ?auto_878408 ) ) ( not ( = ?auto_878403 ?auto_878409 ) ) ( not ( = ?auto_878403 ?auto_878410 ) ) ( not ( = ?auto_878403 ?auto_878411 ) ) ( not ( = ?auto_878403 ?auto_878412 ) ) ( not ( = ?auto_878403 ?auto_878413 ) ) ( not ( = ?auto_878403 ?auto_878414 ) ) ( not ( = ?auto_878403 ?auto_878415 ) ) ( not ( = ?auto_878404 ?auto_878405 ) ) ( not ( = ?auto_878404 ?auto_878406 ) ) ( not ( = ?auto_878404 ?auto_878407 ) ) ( not ( = ?auto_878404 ?auto_878408 ) ) ( not ( = ?auto_878404 ?auto_878409 ) ) ( not ( = ?auto_878404 ?auto_878410 ) ) ( not ( = ?auto_878404 ?auto_878411 ) ) ( not ( = ?auto_878404 ?auto_878412 ) ) ( not ( = ?auto_878404 ?auto_878413 ) ) ( not ( = ?auto_878404 ?auto_878414 ) ) ( not ( = ?auto_878404 ?auto_878415 ) ) ( not ( = ?auto_878405 ?auto_878406 ) ) ( not ( = ?auto_878405 ?auto_878407 ) ) ( not ( = ?auto_878405 ?auto_878408 ) ) ( not ( = ?auto_878405 ?auto_878409 ) ) ( not ( = ?auto_878405 ?auto_878410 ) ) ( not ( = ?auto_878405 ?auto_878411 ) ) ( not ( = ?auto_878405 ?auto_878412 ) ) ( not ( = ?auto_878405 ?auto_878413 ) ) ( not ( = ?auto_878405 ?auto_878414 ) ) ( not ( = ?auto_878405 ?auto_878415 ) ) ( not ( = ?auto_878406 ?auto_878407 ) ) ( not ( = ?auto_878406 ?auto_878408 ) ) ( not ( = ?auto_878406 ?auto_878409 ) ) ( not ( = ?auto_878406 ?auto_878410 ) ) ( not ( = ?auto_878406 ?auto_878411 ) ) ( not ( = ?auto_878406 ?auto_878412 ) ) ( not ( = ?auto_878406 ?auto_878413 ) ) ( not ( = ?auto_878406 ?auto_878414 ) ) ( not ( = ?auto_878406 ?auto_878415 ) ) ( not ( = ?auto_878407 ?auto_878408 ) ) ( not ( = ?auto_878407 ?auto_878409 ) ) ( not ( = ?auto_878407 ?auto_878410 ) ) ( not ( = ?auto_878407 ?auto_878411 ) ) ( not ( = ?auto_878407 ?auto_878412 ) ) ( not ( = ?auto_878407 ?auto_878413 ) ) ( not ( = ?auto_878407 ?auto_878414 ) ) ( not ( = ?auto_878407 ?auto_878415 ) ) ( not ( = ?auto_878408 ?auto_878409 ) ) ( not ( = ?auto_878408 ?auto_878410 ) ) ( not ( = ?auto_878408 ?auto_878411 ) ) ( not ( = ?auto_878408 ?auto_878412 ) ) ( not ( = ?auto_878408 ?auto_878413 ) ) ( not ( = ?auto_878408 ?auto_878414 ) ) ( not ( = ?auto_878408 ?auto_878415 ) ) ( not ( = ?auto_878409 ?auto_878410 ) ) ( not ( = ?auto_878409 ?auto_878411 ) ) ( not ( = ?auto_878409 ?auto_878412 ) ) ( not ( = ?auto_878409 ?auto_878413 ) ) ( not ( = ?auto_878409 ?auto_878414 ) ) ( not ( = ?auto_878409 ?auto_878415 ) ) ( not ( = ?auto_878410 ?auto_878411 ) ) ( not ( = ?auto_878410 ?auto_878412 ) ) ( not ( = ?auto_878410 ?auto_878413 ) ) ( not ( = ?auto_878410 ?auto_878414 ) ) ( not ( = ?auto_878410 ?auto_878415 ) ) ( not ( = ?auto_878411 ?auto_878412 ) ) ( not ( = ?auto_878411 ?auto_878413 ) ) ( not ( = ?auto_878411 ?auto_878414 ) ) ( not ( = ?auto_878411 ?auto_878415 ) ) ( not ( = ?auto_878412 ?auto_878413 ) ) ( not ( = ?auto_878412 ?auto_878414 ) ) ( not ( = ?auto_878412 ?auto_878415 ) ) ( not ( = ?auto_878413 ?auto_878414 ) ) ( not ( = ?auto_878413 ?auto_878415 ) ) ( not ( = ?auto_878414 ?auto_878415 ) ) ( ON ?auto_878413 ?auto_878414 ) ( ON ?auto_878412 ?auto_878413 ) ( ON ?auto_878411 ?auto_878412 ) ( ON ?auto_878410 ?auto_878411 ) ( ON ?auto_878409 ?auto_878410 ) ( ON ?auto_878408 ?auto_878409 ) ( CLEAR ?auto_878406 ) ( ON ?auto_878407 ?auto_878408 ) ( CLEAR ?auto_878407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_878398 ?auto_878399 ?auto_878400 ?auto_878401 ?auto_878402 ?auto_878403 ?auto_878404 ?auto_878405 ?auto_878406 ?auto_878407 )
      ( MAKE-17PILE ?auto_878398 ?auto_878399 ?auto_878400 ?auto_878401 ?auto_878402 ?auto_878403 ?auto_878404 ?auto_878405 ?auto_878406 ?auto_878407 ?auto_878408 ?auto_878409 ?auto_878410 ?auto_878411 ?auto_878412 ?auto_878413 ?auto_878414 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_878468 - BLOCK
      ?auto_878469 - BLOCK
      ?auto_878470 - BLOCK
      ?auto_878471 - BLOCK
      ?auto_878472 - BLOCK
      ?auto_878473 - BLOCK
      ?auto_878474 - BLOCK
      ?auto_878475 - BLOCK
      ?auto_878476 - BLOCK
      ?auto_878477 - BLOCK
      ?auto_878478 - BLOCK
      ?auto_878479 - BLOCK
      ?auto_878480 - BLOCK
      ?auto_878481 - BLOCK
      ?auto_878482 - BLOCK
      ?auto_878483 - BLOCK
      ?auto_878484 - BLOCK
    )
    :vars
    (
      ?auto_878485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_878484 ?auto_878485 ) ( ON-TABLE ?auto_878468 ) ( ON ?auto_878469 ?auto_878468 ) ( ON ?auto_878470 ?auto_878469 ) ( ON ?auto_878471 ?auto_878470 ) ( ON ?auto_878472 ?auto_878471 ) ( ON ?auto_878473 ?auto_878472 ) ( ON ?auto_878474 ?auto_878473 ) ( ON ?auto_878475 ?auto_878474 ) ( not ( = ?auto_878468 ?auto_878469 ) ) ( not ( = ?auto_878468 ?auto_878470 ) ) ( not ( = ?auto_878468 ?auto_878471 ) ) ( not ( = ?auto_878468 ?auto_878472 ) ) ( not ( = ?auto_878468 ?auto_878473 ) ) ( not ( = ?auto_878468 ?auto_878474 ) ) ( not ( = ?auto_878468 ?auto_878475 ) ) ( not ( = ?auto_878468 ?auto_878476 ) ) ( not ( = ?auto_878468 ?auto_878477 ) ) ( not ( = ?auto_878468 ?auto_878478 ) ) ( not ( = ?auto_878468 ?auto_878479 ) ) ( not ( = ?auto_878468 ?auto_878480 ) ) ( not ( = ?auto_878468 ?auto_878481 ) ) ( not ( = ?auto_878468 ?auto_878482 ) ) ( not ( = ?auto_878468 ?auto_878483 ) ) ( not ( = ?auto_878468 ?auto_878484 ) ) ( not ( = ?auto_878468 ?auto_878485 ) ) ( not ( = ?auto_878469 ?auto_878470 ) ) ( not ( = ?auto_878469 ?auto_878471 ) ) ( not ( = ?auto_878469 ?auto_878472 ) ) ( not ( = ?auto_878469 ?auto_878473 ) ) ( not ( = ?auto_878469 ?auto_878474 ) ) ( not ( = ?auto_878469 ?auto_878475 ) ) ( not ( = ?auto_878469 ?auto_878476 ) ) ( not ( = ?auto_878469 ?auto_878477 ) ) ( not ( = ?auto_878469 ?auto_878478 ) ) ( not ( = ?auto_878469 ?auto_878479 ) ) ( not ( = ?auto_878469 ?auto_878480 ) ) ( not ( = ?auto_878469 ?auto_878481 ) ) ( not ( = ?auto_878469 ?auto_878482 ) ) ( not ( = ?auto_878469 ?auto_878483 ) ) ( not ( = ?auto_878469 ?auto_878484 ) ) ( not ( = ?auto_878469 ?auto_878485 ) ) ( not ( = ?auto_878470 ?auto_878471 ) ) ( not ( = ?auto_878470 ?auto_878472 ) ) ( not ( = ?auto_878470 ?auto_878473 ) ) ( not ( = ?auto_878470 ?auto_878474 ) ) ( not ( = ?auto_878470 ?auto_878475 ) ) ( not ( = ?auto_878470 ?auto_878476 ) ) ( not ( = ?auto_878470 ?auto_878477 ) ) ( not ( = ?auto_878470 ?auto_878478 ) ) ( not ( = ?auto_878470 ?auto_878479 ) ) ( not ( = ?auto_878470 ?auto_878480 ) ) ( not ( = ?auto_878470 ?auto_878481 ) ) ( not ( = ?auto_878470 ?auto_878482 ) ) ( not ( = ?auto_878470 ?auto_878483 ) ) ( not ( = ?auto_878470 ?auto_878484 ) ) ( not ( = ?auto_878470 ?auto_878485 ) ) ( not ( = ?auto_878471 ?auto_878472 ) ) ( not ( = ?auto_878471 ?auto_878473 ) ) ( not ( = ?auto_878471 ?auto_878474 ) ) ( not ( = ?auto_878471 ?auto_878475 ) ) ( not ( = ?auto_878471 ?auto_878476 ) ) ( not ( = ?auto_878471 ?auto_878477 ) ) ( not ( = ?auto_878471 ?auto_878478 ) ) ( not ( = ?auto_878471 ?auto_878479 ) ) ( not ( = ?auto_878471 ?auto_878480 ) ) ( not ( = ?auto_878471 ?auto_878481 ) ) ( not ( = ?auto_878471 ?auto_878482 ) ) ( not ( = ?auto_878471 ?auto_878483 ) ) ( not ( = ?auto_878471 ?auto_878484 ) ) ( not ( = ?auto_878471 ?auto_878485 ) ) ( not ( = ?auto_878472 ?auto_878473 ) ) ( not ( = ?auto_878472 ?auto_878474 ) ) ( not ( = ?auto_878472 ?auto_878475 ) ) ( not ( = ?auto_878472 ?auto_878476 ) ) ( not ( = ?auto_878472 ?auto_878477 ) ) ( not ( = ?auto_878472 ?auto_878478 ) ) ( not ( = ?auto_878472 ?auto_878479 ) ) ( not ( = ?auto_878472 ?auto_878480 ) ) ( not ( = ?auto_878472 ?auto_878481 ) ) ( not ( = ?auto_878472 ?auto_878482 ) ) ( not ( = ?auto_878472 ?auto_878483 ) ) ( not ( = ?auto_878472 ?auto_878484 ) ) ( not ( = ?auto_878472 ?auto_878485 ) ) ( not ( = ?auto_878473 ?auto_878474 ) ) ( not ( = ?auto_878473 ?auto_878475 ) ) ( not ( = ?auto_878473 ?auto_878476 ) ) ( not ( = ?auto_878473 ?auto_878477 ) ) ( not ( = ?auto_878473 ?auto_878478 ) ) ( not ( = ?auto_878473 ?auto_878479 ) ) ( not ( = ?auto_878473 ?auto_878480 ) ) ( not ( = ?auto_878473 ?auto_878481 ) ) ( not ( = ?auto_878473 ?auto_878482 ) ) ( not ( = ?auto_878473 ?auto_878483 ) ) ( not ( = ?auto_878473 ?auto_878484 ) ) ( not ( = ?auto_878473 ?auto_878485 ) ) ( not ( = ?auto_878474 ?auto_878475 ) ) ( not ( = ?auto_878474 ?auto_878476 ) ) ( not ( = ?auto_878474 ?auto_878477 ) ) ( not ( = ?auto_878474 ?auto_878478 ) ) ( not ( = ?auto_878474 ?auto_878479 ) ) ( not ( = ?auto_878474 ?auto_878480 ) ) ( not ( = ?auto_878474 ?auto_878481 ) ) ( not ( = ?auto_878474 ?auto_878482 ) ) ( not ( = ?auto_878474 ?auto_878483 ) ) ( not ( = ?auto_878474 ?auto_878484 ) ) ( not ( = ?auto_878474 ?auto_878485 ) ) ( not ( = ?auto_878475 ?auto_878476 ) ) ( not ( = ?auto_878475 ?auto_878477 ) ) ( not ( = ?auto_878475 ?auto_878478 ) ) ( not ( = ?auto_878475 ?auto_878479 ) ) ( not ( = ?auto_878475 ?auto_878480 ) ) ( not ( = ?auto_878475 ?auto_878481 ) ) ( not ( = ?auto_878475 ?auto_878482 ) ) ( not ( = ?auto_878475 ?auto_878483 ) ) ( not ( = ?auto_878475 ?auto_878484 ) ) ( not ( = ?auto_878475 ?auto_878485 ) ) ( not ( = ?auto_878476 ?auto_878477 ) ) ( not ( = ?auto_878476 ?auto_878478 ) ) ( not ( = ?auto_878476 ?auto_878479 ) ) ( not ( = ?auto_878476 ?auto_878480 ) ) ( not ( = ?auto_878476 ?auto_878481 ) ) ( not ( = ?auto_878476 ?auto_878482 ) ) ( not ( = ?auto_878476 ?auto_878483 ) ) ( not ( = ?auto_878476 ?auto_878484 ) ) ( not ( = ?auto_878476 ?auto_878485 ) ) ( not ( = ?auto_878477 ?auto_878478 ) ) ( not ( = ?auto_878477 ?auto_878479 ) ) ( not ( = ?auto_878477 ?auto_878480 ) ) ( not ( = ?auto_878477 ?auto_878481 ) ) ( not ( = ?auto_878477 ?auto_878482 ) ) ( not ( = ?auto_878477 ?auto_878483 ) ) ( not ( = ?auto_878477 ?auto_878484 ) ) ( not ( = ?auto_878477 ?auto_878485 ) ) ( not ( = ?auto_878478 ?auto_878479 ) ) ( not ( = ?auto_878478 ?auto_878480 ) ) ( not ( = ?auto_878478 ?auto_878481 ) ) ( not ( = ?auto_878478 ?auto_878482 ) ) ( not ( = ?auto_878478 ?auto_878483 ) ) ( not ( = ?auto_878478 ?auto_878484 ) ) ( not ( = ?auto_878478 ?auto_878485 ) ) ( not ( = ?auto_878479 ?auto_878480 ) ) ( not ( = ?auto_878479 ?auto_878481 ) ) ( not ( = ?auto_878479 ?auto_878482 ) ) ( not ( = ?auto_878479 ?auto_878483 ) ) ( not ( = ?auto_878479 ?auto_878484 ) ) ( not ( = ?auto_878479 ?auto_878485 ) ) ( not ( = ?auto_878480 ?auto_878481 ) ) ( not ( = ?auto_878480 ?auto_878482 ) ) ( not ( = ?auto_878480 ?auto_878483 ) ) ( not ( = ?auto_878480 ?auto_878484 ) ) ( not ( = ?auto_878480 ?auto_878485 ) ) ( not ( = ?auto_878481 ?auto_878482 ) ) ( not ( = ?auto_878481 ?auto_878483 ) ) ( not ( = ?auto_878481 ?auto_878484 ) ) ( not ( = ?auto_878481 ?auto_878485 ) ) ( not ( = ?auto_878482 ?auto_878483 ) ) ( not ( = ?auto_878482 ?auto_878484 ) ) ( not ( = ?auto_878482 ?auto_878485 ) ) ( not ( = ?auto_878483 ?auto_878484 ) ) ( not ( = ?auto_878483 ?auto_878485 ) ) ( not ( = ?auto_878484 ?auto_878485 ) ) ( ON ?auto_878483 ?auto_878484 ) ( ON ?auto_878482 ?auto_878483 ) ( ON ?auto_878481 ?auto_878482 ) ( ON ?auto_878480 ?auto_878481 ) ( ON ?auto_878479 ?auto_878480 ) ( ON ?auto_878478 ?auto_878479 ) ( ON ?auto_878477 ?auto_878478 ) ( CLEAR ?auto_878475 ) ( ON ?auto_878476 ?auto_878477 ) ( CLEAR ?auto_878476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_878468 ?auto_878469 ?auto_878470 ?auto_878471 ?auto_878472 ?auto_878473 ?auto_878474 ?auto_878475 ?auto_878476 )
      ( MAKE-17PILE ?auto_878468 ?auto_878469 ?auto_878470 ?auto_878471 ?auto_878472 ?auto_878473 ?auto_878474 ?auto_878475 ?auto_878476 ?auto_878477 ?auto_878478 ?auto_878479 ?auto_878480 ?auto_878481 ?auto_878482 ?auto_878483 ?auto_878484 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_878538 - BLOCK
      ?auto_878539 - BLOCK
      ?auto_878540 - BLOCK
      ?auto_878541 - BLOCK
      ?auto_878542 - BLOCK
      ?auto_878543 - BLOCK
      ?auto_878544 - BLOCK
      ?auto_878545 - BLOCK
      ?auto_878546 - BLOCK
      ?auto_878547 - BLOCK
      ?auto_878548 - BLOCK
      ?auto_878549 - BLOCK
      ?auto_878550 - BLOCK
      ?auto_878551 - BLOCK
      ?auto_878552 - BLOCK
      ?auto_878553 - BLOCK
      ?auto_878554 - BLOCK
    )
    :vars
    (
      ?auto_878555 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_878554 ?auto_878555 ) ( ON-TABLE ?auto_878538 ) ( ON ?auto_878539 ?auto_878538 ) ( ON ?auto_878540 ?auto_878539 ) ( ON ?auto_878541 ?auto_878540 ) ( ON ?auto_878542 ?auto_878541 ) ( ON ?auto_878543 ?auto_878542 ) ( ON ?auto_878544 ?auto_878543 ) ( not ( = ?auto_878538 ?auto_878539 ) ) ( not ( = ?auto_878538 ?auto_878540 ) ) ( not ( = ?auto_878538 ?auto_878541 ) ) ( not ( = ?auto_878538 ?auto_878542 ) ) ( not ( = ?auto_878538 ?auto_878543 ) ) ( not ( = ?auto_878538 ?auto_878544 ) ) ( not ( = ?auto_878538 ?auto_878545 ) ) ( not ( = ?auto_878538 ?auto_878546 ) ) ( not ( = ?auto_878538 ?auto_878547 ) ) ( not ( = ?auto_878538 ?auto_878548 ) ) ( not ( = ?auto_878538 ?auto_878549 ) ) ( not ( = ?auto_878538 ?auto_878550 ) ) ( not ( = ?auto_878538 ?auto_878551 ) ) ( not ( = ?auto_878538 ?auto_878552 ) ) ( not ( = ?auto_878538 ?auto_878553 ) ) ( not ( = ?auto_878538 ?auto_878554 ) ) ( not ( = ?auto_878538 ?auto_878555 ) ) ( not ( = ?auto_878539 ?auto_878540 ) ) ( not ( = ?auto_878539 ?auto_878541 ) ) ( not ( = ?auto_878539 ?auto_878542 ) ) ( not ( = ?auto_878539 ?auto_878543 ) ) ( not ( = ?auto_878539 ?auto_878544 ) ) ( not ( = ?auto_878539 ?auto_878545 ) ) ( not ( = ?auto_878539 ?auto_878546 ) ) ( not ( = ?auto_878539 ?auto_878547 ) ) ( not ( = ?auto_878539 ?auto_878548 ) ) ( not ( = ?auto_878539 ?auto_878549 ) ) ( not ( = ?auto_878539 ?auto_878550 ) ) ( not ( = ?auto_878539 ?auto_878551 ) ) ( not ( = ?auto_878539 ?auto_878552 ) ) ( not ( = ?auto_878539 ?auto_878553 ) ) ( not ( = ?auto_878539 ?auto_878554 ) ) ( not ( = ?auto_878539 ?auto_878555 ) ) ( not ( = ?auto_878540 ?auto_878541 ) ) ( not ( = ?auto_878540 ?auto_878542 ) ) ( not ( = ?auto_878540 ?auto_878543 ) ) ( not ( = ?auto_878540 ?auto_878544 ) ) ( not ( = ?auto_878540 ?auto_878545 ) ) ( not ( = ?auto_878540 ?auto_878546 ) ) ( not ( = ?auto_878540 ?auto_878547 ) ) ( not ( = ?auto_878540 ?auto_878548 ) ) ( not ( = ?auto_878540 ?auto_878549 ) ) ( not ( = ?auto_878540 ?auto_878550 ) ) ( not ( = ?auto_878540 ?auto_878551 ) ) ( not ( = ?auto_878540 ?auto_878552 ) ) ( not ( = ?auto_878540 ?auto_878553 ) ) ( not ( = ?auto_878540 ?auto_878554 ) ) ( not ( = ?auto_878540 ?auto_878555 ) ) ( not ( = ?auto_878541 ?auto_878542 ) ) ( not ( = ?auto_878541 ?auto_878543 ) ) ( not ( = ?auto_878541 ?auto_878544 ) ) ( not ( = ?auto_878541 ?auto_878545 ) ) ( not ( = ?auto_878541 ?auto_878546 ) ) ( not ( = ?auto_878541 ?auto_878547 ) ) ( not ( = ?auto_878541 ?auto_878548 ) ) ( not ( = ?auto_878541 ?auto_878549 ) ) ( not ( = ?auto_878541 ?auto_878550 ) ) ( not ( = ?auto_878541 ?auto_878551 ) ) ( not ( = ?auto_878541 ?auto_878552 ) ) ( not ( = ?auto_878541 ?auto_878553 ) ) ( not ( = ?auto_878541 ?auto_878554 ) ) ( not ( = ?auto_878541 ?auto_878555 ) ) ( not ( = ?auto_878542 ?auto_878543 ) ) ( not ( = ?auto_878542 ?auto_878544 ) ) ( not ( = ?auto_878542 ?auto_878545 ) ) ( not ( = ?auto_878542 ?auto_878546 ) ) ( not ( = ?auto_878542 ?auto_878547 ) ) ( not ( = ?auto_878542 ?auto_878548 ) ) ( not ( = ?auto_878542 ?auto_878549 ) ) ( not ( = ?auto_878542 ?auto_878550 ) ) ( not ( = ?auto_878542 ?auto_878551 ) ) ( not ( = ?auto_878542 ?auto_878552 ) ) ( not ( = ?auto_878542 ?auto_878553 ) ) ( not ( = ?auto_878542 ?auto_878554 ) ) ( not ( = ?auto_878542 ?auto_878555 ) ) ( not ( = ?auto_878543 ?auto_878544 ) ) ( not ( = ?auto_878543 ?auto_878545 ) ) ( not ( = ?auto_878543 ?auto_878546 ) ) ( not ( = ?auto_878543 ?auto_878547 ) ) ( not ( = ?auto_878543 ?auto_878548 ) ) ( not ( = ?auto_878543 ?auto_878549 ) ) ( not ( = ?auto_878543 ?auto_878550 ) ) ( not ( = ?auto_878543 ?auto_878551 ) ) ( not ( = ?auto_878543 ?auto_878552 ) ) ( not ( = ?auto_878543 ?auto_878553 ) ) ( not ( = ?auto_878543 ?auto_878554 ) ) ( not ( = ?auto_878543 ?auto_878555 ) ) ( not ( = ?auto_878544 ?auto_878545 ) ) ( not ( = ?auto_878544 ?auto_878546 ) ) ( not ( = ?auto_878544 ?auto_878547 ) ) ( not ( = ?auto_878544 ?auto_878548 ) ) ( not ( = ?auto_878544 ?auto_878549 ) ) ( not ( = ?auto_878544 ?auto_878550 ) ) ( not ( = ?auto_878544 ?auto_878551 ) ) ( not ( = ?auto_878544 ?auto_878552 ) ) ( not ( = ?auto_878544 ?auto_878553 ) ) ( not ( = ?auto_878544 ?auto_878554 ) ) ( not ( = ?auto_878544 ?auto_878555 ) ) ( not ( = ?auto_878545 ?auto_878546 ) ) ( not ( = ?auto_878545 ?auto_878547 ) ) ( not ( = ?auto_878545 ?auto_878548 ) ) ( not ( = ?auto_878545 ?auto_878549 ) ) ( not ( = ?auto_878545 ?auto_878550 ) ) ( not ( = ?auto_878545 ?auto_878551 ) ) ( not ( = ?auto_878545 ?auto_878552 ) ) ( not ( = ?auto_878545 ?auto_878553 ) ) ( not ( = ?auto_878545 ?auto_878554 ) ) ( not ( = ?auto_878545 ?auto_878555 ) ) ( not ( = ?auto_878546 ?auto_878547 ) ) ( not ( = ?auto_878546 ?auto_878548 ) ) ( not ( = ?auto_878546 ?auto_878549 ) ) ( not ( = ?auto_878546 ?auto_878550 ) ) ( not ( = ?auto_878546 ?auto_878551 ) ) ( not ( = ?auto_878546 ?auto_878552 ) ) ( not ( = ?auto_878546 ?auto_878553 ) ) ( not ( = ?auto_878546 ?auto_878554 ) ) ( not ( = ?auto_878546 ?auto_878555 ) ) ( not ( = ?auto_878547 ?auto_878548 ) ) ( not ( = ?auto_878547 ?auto_878549 ) ) ( not ( = ?auto_878547 ?auto_878550 ) ) ( not ( = ?auto_878547 ?auto_878551 ) ) ( not ( = ?auto_878547 ?auto_878552 ) ) ( not ( = ?auto_878547 ?auto_878553 ) ) ( not ( = ?auto_878547 ?auto_878554 ) ) ( not ( = ?auto_878547 ?auto_878555 ) ) ( not ( = ?auto_878548 ?auto_878549 ) ) ( not ( = ?auto_878548 ?auto_878550 ) ) ( not ( = ?auto_878548 ?auto_878551 ) ) ( not ( = ?auto_878548 ?auto_878552 ) ) ( not ( = ?auto_878548 ?auto_878553 ) ) ( not ( = ?auto_878548 ?auto_878554 ) ) ( not ( = ?auto_878548 ?auto_878555 ) ) ( not ( = ?auto_878549 ?auto_878550 ) ) ( not ( = ?auto_878549 ?auto_878551 ) ) ( not ( = ?auto_878549 ?auto_878552 ) ) ( not ( = ?auto_878549 ?auto_878553 ) ) ( not ( = ?auto_878549 ?auto_878554 ) ) ( not ( = ?auto_878549 ?auto_878555 ) ) ( not ( = ?auto_878550 ?auto_878551 ) ) ( not ( = ?auto_878550 ?auto_878552 ) ) ( not ( = ?auto_878550 ?auto_878553 ) ) ( not ( = ?auto_878550 ?auto_878554 ) ) ( not ( = ?auto_878550 ?auto_878555 ) ) ( not ( = ?auto_878551 ?auto_878552 ) ) ( not ( = ?auto_878551 ?auto_878553 ) ) ( not ( = ?auto_878551 ?auto_878554 ) ) ( not ( = ?auto_878551 ?auto_878555 ) ) ( not ( = ?auto_878552 ?auto_878553 ) ) ( not ( = ?auto_878552 ?auto_878554 ) ) ( not ( = ?auto_878552 ?auto_878555 ) ) ( not ( = ?auto_878553 ?auto_878554 ) ) ( not ( = ?auto_878553 ?auto_878555 ) ) ( not ( = ?auto_878554 ?auto_878555 ) ) ( ON ?auto_878553 ?auto_878554 ) ( ON ?auto_878552 ?auto_878553 ) ( ON ?auto_878551 ?auto_878552 ) ( ON ?auto_878550 ?auto_878551 ) ( ON ?auto_878549 ?auto_878550 ) ( ON ?auto_878548 ?auto_878549 ) ( ON ?auto_878547 ?auto_878548 ) ( ON ?auto_878546 ?auto_878547 ) ( CLEAR ?auto_878544 ) ( ON ?auto_878545 ?auto_878546 ) ( CLEAR ?auto_878545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_878538 ?auto_878539 ?auto_878540 ?auto_878541 ?auto_878542 ?auto_878543 ?auto_878544 ?auto_878545 )
      ( MAKE-17PILE ?auto_878538 ?auto_878539 ?auto_878540 ?auto_878541 ?auto_878542 ?auto_878543 ?auto_878544 ?auto_878545 ?auto_878546 ?auto_878547 ?auto_878548 ?auto_878549 ?auto_878550 ?auto_878551 ?auto_878552 ?auto_878553 ?auto_878554 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_878608 - BLOCK
      ?auto_878609 - BLOCK
      ?auto_878610 - BLOCK
      ?auto_878611 - BLOCK
      ?auto_878612 - BLOCK
      ?auto_878613 - BLOCK
      ?auto_878614 - BLOCK
      ?auto_878615 - BLOCK
      ?auto_878616 - BLOCK
      ?auto_878617 - BLOCK
      ?auto_878618 - BLOCK
      ?auto_878619 - BLOCK
      ?auto_878620 - BLOCK
      ?auto_878621 - BLOCK
      ?auto_878622 - BLOCK
      ?auto_878623 - BLOCK
      ?auto_878624 - BLOCK
    )
    :vars
    (
      ?auto_878625 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_878624 ?auto_878625 ) ( ON-TABLE ?auto_878608 ) ( ON ?auto_878609 ?auto_878608 ) ( ON ?auto_878610 ?auto_878609 ) ( ON ?auto_878611 ?auto_878610 ) ( ON ?auto_878612 ?auto_878611 ) ( ON ?auto_878613 ?auto_878612 ) ( not ( = ?auto_878608 ?auto_878609 ) ) ( not ( = ?auto_878608 ?auto_878610 ) ) ( not ( = ?auto_878608 ?auto_878611 ) ) ( not ( = ?auto_878608 ?auto_878612 ) ) ( not ( = ?auto_878608 ?auto_878613 ) ) ( not ( = ?auto_878608 ?auto_878614 ) ) ( not ( = ?auto_878608 ?auto_878615 ) ) ( not ( = ?auto_878608 ?auto_878616 ) ) ( not ( = ?auto_878608 ?auto_878617 ) ) ( not ( = ?auto_878608 ?auto_878618 ) ) ( not ( = ?auto_878608 ?auto_878619 ) ) ( not ( = ?auto_878608 ?auto_878620 ) ) ( not ( = ?auto_878608 ?auto_878621 ) ) ( not ( = ?auto_878608 ?auto_878622 ) ) ( not ( = ?auto_878608 ?auto_878623 ) ) ( not ( = ?auto_878608 ?auto_878624 ) ) ( not ( = ?auto_878608 ?auto_878625 ) ) ( not ( = ?auto_878609 ?auto_878610 ) ) ( not ( = ?auto_878609 ?auto_878611 ) ) ( not ( = ?auto_878609 ?auto_878612 ) ) ( not ( = ?auto_878609 ?auto_878613 ) ) ( not ( = ?auto_878609 ?auto_878614 ) ) ( not ( = ?auto_878609 ?auto_878615 ) ) ( not ( = ?auto_878609 ?auto_878616 ) ) ( not ( = ?auto_878609 ?auto_878617 ) ) ( not ( = ?auto_878609 ?auto_878618 ) ) ( not ( = ?auto_878609 ?auto_878619 ) ) ( not ( = ?auto_878609 ?auto_878620 ) ) ( not ( = ?auto_878609 ?auto_878621 ) ) ( not ( = ?auto_878609 ?auto_878622 ) ) ( not ( = ?auto_878609 ?auto_878623 ) ) ( not ( = ?auto_878609 ?auto_878624 ) ) ( not ( = ?auto_878609 ?auto_878625 ) ) ( not ( = ?auto_878610 ?auto_878611 ) ) ( not ( = ?auto_878610 ?auto_878612 ) ) ( not ( = ?auto_878610 ?auto_878613 ) ) ( not ( = ?auto_878610 ?auto_878614 ) ) ( not ( = ?auto_878610 ?auto_878615 ) ) ( not ( = ?auto_878610 ?auto_878616 ) ) ( not ( = ?auto_878610 ?auto_878617 ) ) ( not ( = ?auto_878610 ?auto_878618 ) ) ( not ( = ?auto_878610 ?auto_878619 ) ) ( not ( = ?auto_878610 ?auto_878620 ) ) ( not ( = ?auto_878610 ?auto_878621 ) ) ( not ( = ?auto_878610 ?auto_878622 ) ) ( not ( = ?auto_878610 ?auto_878623 ) ) ( not ( = ?auto_878610 ?auto_878624 ) ) ( not ( = ?auto_878610 ?auto_878625 ) ) ( not ( = ?auto_878611 ?auto_878612 ) ) ( not ( = ?auto_878611 ?auto_878613 ) ) ( not ( = ?auto_878611 ?auto_878614 ) ) ( not ( = ?auto_878611 ?auto_878615 ) ) ( not ( = ?auto_878611 ?auto_878616 ) ) ( not ( = ?auto_878611 ?auto_878617 ) ) ( not ( = ?auto_878611 ?auto_878618 ) ) ( not ( = ?auto_878611 ?auto_878619 ) ) ( not ( = ?auto_878611 ?auto_878620 ) ) ( not ( = ?auto_878611 ?auto_878621 ) ) ( not ( = ?auto_878611 ?auto_878622 ) ) ( not ( = ?auto_878611 ?auto_878623 ) ) ( not ( = ?auto_878611 ?auto_878624 ) ) ( not ( = ?auto_878611 ?auto_878625 ) ) ( not ( = ?auto_878612 ?auto_878613 ) ) ( not ( = ?auto_878612 ?auto_878614 ) ) ( not ( = ?auto_878612 ?auto_878615 ) ) ( not ( = ?auto_878612 ?auto_878616 ) ) ( not ( = ?auto_878612 ?auto_878617 ) ) ( not ( = ?auto_878612 ?auto_878618 ) ) ( not ( = ?auto_878612 ?auto_878619 ) ) ( not ( = ?auto_878612 ?auto_878620 ) ) ( not ( = ?auto_878612 ?auto_878621 ) ) ( not ( = ?auto_878612 ?auto_878622 ) ) ( not ( = ?auto_878612 ?auto_878623 ) ) ( not ( = ?auto_878612 ?auto_878624 ) ) ( not ( = ?auto_878612 ?auto_878625 ) ) ( not ( = ?auto_878613 ?auto_878614 ) ) ( not ( = ?auto_878613 ?auto_878615 ) ) ( not ( = ?auto_878613 ?auto_878616 ) ) ( not ( = ?auto_878613 ?auto_878617 ) ) ( not ( = ?auto_878613 ?auto_878618 ) ) ( not ( = ?auto_878613 ?auto_878619 ) ) ( not ( = ?auto_878613 ?auto_878620 ) ) ( not ( = ?auto_878613 ?auto_878621 ) ) ( not ( = ?auto_878613 ?auto_878622 ) ) ( not ( = ?auto_878613 ?auto_878623 ) ) ( not ( = ?auto_878613 ?auto_878624 ) ) ( not ( = ?auto_878613 ?auto_878625 ) ) ( not ( = ?auto_878614 ?auto_878615 ) ) ( not ( = ?auto_878614 ?auto_878616 ) ) ( not ( = ?auto_878614 ?auto_878617 ) ) ( not ( = ?auto_878614 ?auto_878618 ) ) ( not ( = ?auto_878614 ?auto_878619 ) ) ( not ( = ?auto_878614 ?auto_878620 ) ) ( not ( = ?auto_878614 ?auto_878621 ) ) ( not ( = ?auto_878614 ?auto_878622 ) ) ( not ( = ?auto_878614 ?auto_878623 ) ) ( not ( = ?auto_878614 ?auto_878624 ) ) ( not ( = ?auto_878614 ?auto_878625 ) ) ( not ( = ?auto_878615 ?auto_878616 ) ) ( not ( = ?auto_878615 ?auto_878617 ) ) ( not ( = ?auto_878615 ?auto_878618 ) ) ( not ( = ?auto_878615 ?auto_878619 ) ) ( not ( = ?auto_878615 ?auto_878620 ) ) ( not ( = ?auto_878615 ?auto_878621 ) ) ( not ( = ?auto_878615 ?auto_878622 ) ) ( not ( = ?auto_878615 ?auto_878623 ) ) ( not ( = ?auto_878615 ?auto_878624 ) ) ( not ( = ?auto_878615 ?auto_878625 ) ) ( not ( = ?auto_878616 ?auto_878617 ) ) ( not ( = ?auto_878616 ?auto_878618 ) ) ( not ( = ?auto_878616 ?auto_878619 ) ) ( not ( = ?auto_878616 ?auto_878620 ) ) ( not ( = ?auto_878616 ?auto_878621 ) ) ( not ( = ?auto_878616 ?auto_878622 ) ) ( not ( = ?auto_878616 ?auto_878623 ) ) ( not ( = ?auto_878616 ?auto_878624 ) ) ( not ( = ?auto_878616 ?auto_878625 ) ) ( not ( = ?auto_878617 ?auto_878618 ) ) ( not ( = ?auto_878617 ?auto_878619 ) ) ( not ( = ?auto_878617 ?auto_878620 ) ) ( not ( = ?auto_878617 ?auto_878621 ) ) ( not ( = ?auto_878617 ?auto_878622 ) ) ( not ( = ?auto_878617 ?auto_878623 ) ) ( not ( = ?auto_878617 ?auto_878624 ) ) ( not ( = ?auto_878617 ?auto_878625 ) ) ( not ( = ?auto_878618 ?auto_878619 ) ) ( not ( = ?auto_878618 ?auto_878620 ) ) ( not ( = ?auto_878618 ?auto_878621 ) ) ( not ( = ?auto_878618 ?auto_878622 ) ) ( not ( = ?auto_878618 ?auto_878623 ) ) ( not ( = ?auto_878618 ?auto_878624 ) ) ( not ( = ?auto_878618 ?auto_878625 ) ) ( not ( = ?auto_878619 ?auto_878620 ) ) ( not ( = ?auto_878619 ?auto_878621 ) ) ( not ( = ?auto_878619 ?auto_878622 ) ) ( not ( = ?auto_878619 ?auto_878623 ) ) ( not ( = ?auto_878619 ?auto_878624 ) ) ( not ( = ?auto_878619 ?auto_878625 ) ) ( not ( = ?auto_878620 ?auto_878621 ) ) ( not ( = ?auto_878620 ?auto_878622 ) ) ( not ( = ?auto_878620 ?auto_878623 ) ) ( not ( = ?auto_878620 ?auto_878624 ) ) ( not ( = ?auto_878620 ?auto_878625 ) ) ( not ( = ?auto_878621 ?auto_878622 ) ) ( not ( = ?auto_878621 ?auto_878623 ) ) ( not ( = ?auto_878621 ?auto_878624 ) ) ( not ( = ?auto_878621 ?auto_878625 ) ) ( not ( = ?auto_878622 ?auto_878623 ) ) ( not ( = ?auto_878622 ?auto_878624 ) ) ( not ( = ?auto_878622 ?auto_878625 ) ) ( not ( = ?auto_878623 ?auto_878624 ) ) ( not ( = ?auto_878623 ?auto_878625 ) ) ( not ( = ?auto_878624 ?auto_878625 ) ) ( ON ?auto_878623 ?auto_878624 ) ( ON ?auto_878622 ?auto_878623 ) ( ON ?auto_878621 ?auto_878622 ) ( ON ?auto_878620 ?auto_878621 ) ( ON ?auto_878619 ?auto_878620 ) ( ON ?auto_878618 ?auto_878619 ) ( ON ?auto_878617 ?auto_878618 ) ( ON ?auto_878616 ?auto_878617 ) ( ON ?auto_878615 ?auto_878616 ) ( CLEAR ?auto_878613 ) ( ON ?auto_878614 ?auto_878615 ) ( CLEAR ?auto_878614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_878608 ?auto_878609 ?auto_878610 ?auto_878611 ?auto_878612 ?auto_878613 ?auto_878614 )
      ( MAKE-17PILE ?auto_878608 ?auto_878609 ?auto_878610 ?auto_878611 ?auto_878612 ?auto_878613 ?auto_878614 ?auto_878615 ?auto_878616 ?auto_878617 ?auto_878618 ?auto_878619 ?auto_878620 ?auto_878621 ?auto_878622 ?auto_878623 ?auto_878624 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_878678 - BLOCK
      ?auto_878679 - BLOCK
      ?auto_878680 - BLOCK
      ?auto_878681 - BLOCK
      ?auto_878682 - BLOCK
      ?auto_878683 - BLOCK
      ?auto_878684 - BLOCK
      ?auto_878685 - BLOCK
      ?auto_878686 - BLOCK
      ?auto_878687 - BLOCK
      ?auto_878688 - BLOCK
      ?auto_878689 - BLOCK
      ?auto_878690 - BLOCK
      ?auto_878691 - BLOCK
      ?auto_878692 - BLOCK
      ?auto_878693 - BLOCK
      ?auto_878694 - BLOCK
    )
    :vars
    (
      ?auto_878695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_878694 ?auto_878695 ) ( ON-TABLE ?auto_878678 ) ( ON ?auto_878679 ?auto_878678 ) ( ON ?auto_878680 ?auto_878679 ) ( ON ?auto_878681 ?auto_878680 ) ( ON ?auto_878682 ?auto_878681 ) ( not ( = ?auto_878678 ?auto_878679 ) ) ( not ( = ?auto_878678 ?auto_878680 ) ) ( not ( = ?auto_878678 ?auto_878681 ) ) ( not ( = ?auto_878678 ?auto_878682 ) ) ( not ( = ?auto_878678 ?auto_878683 ) ) ( not ( = ?auto_878678 ?auto_878684 ) ) ( not ( = ?auto_878678 ?auto_878685 ) ) ( not ( = ?auto_878678 ?auto_878686 ) ) ( not ( = ?auto_878678 ?auto_878687 ) ) ( not ( = ?auto_878678 ?auto_878688 ) ) ( not ( = ?auto_878678 ?auto_878689 ) ) ( not ( = ?auto_878678 ?auto_878690 ) ) ( not ( = ?auto_878678 ?auto_878691 ) ) ( not ( = ?auto_878678 ?auto_878692 ) ) ( not ( = ?auto_878678 ?auto_878693 ) ) ( not ( = ?auto_878678 ?auto_878694 ) ) ( not ( = ?auto_878678 ?auto_878695 ) ) ( not ( = ?auto_878679 ?auto_878680 ) ) ( not ( = ?auto_878679 ?auto_878681 ) ) ( not ( = ?auto_878679 ?auto_878682 ) ) ( not ( = ?auto_878679 ?auto_878683 ) ) ( not ( = ?auto_878679 ?auto_878684 ) ) ( not ( = ?auto_878679 ?auto_878685 ) ) ( not ( = ?auto_878679 ?auto_878686 ) ) ( not ( = ?auto_878679 ?auto_878687 ) ) ( not ( = ?auto_878679 ?auto_878688 ) ) ( not ( = ?auto_878679 ?auto_878689 ) ) ( not ( = ?auto_878679 ?auto_878690 ) ) ( not ( = ?auto_878679 ?auto_878691 ) ) ( not ( = ?auto_878679 ?auto_878692 ) ) ( not ( = ?auto_878679 ?auto_878693 ) ) ( not ( = ?auto_878679 ?auto_878694 ) ) ( not ( = ?auto_878679 ?auto_878695 ) ) ( not ( = ?auto_878680 ?auto_878681 ) ) ( not ( = ?auto_878680 ?auto_878682 ) ) ( not ( = ?auto_878680 ?auto_878683 ) ) ( not ( = ?auto_878680 ?auto_878684 ) ) ( not ( = ?auto_878680 ?auto_878685 ) ) ( not ( = ?auto_878680 ?auto_878686 ) ) ( not ( = ?auto_878680 ?auto_878687 ) ) ( not ( = ?auto_878680 ?auto_878688 ) ) ( not ( = ?auto_878680 ?auto_878689 ) ) ( not ( = ?auto_878680 ?auto_878690 ) ) ( not ( = ?auto_878680 ?auto_878691 ) ) ( not ( = ?auto_878680 ?auto_878692 ) ) ( not ( = ?auto_878680 ?auto_878693 ) ) ( not ( = ?auto_878680 ?auto_878694 ) ) ( not ( = ?auto_878680 ?auto_878695 ) ) ( not ( = ?auto_878681 ?auto_878682 ) ) ( not ( = ?auto_878681 ?auto_878683 ) ) ( not ( = ?auto_878681 ?auto_878684 ) ) ( not ( = ?auto_878681 ?auto_878685 ) ) ( not ( = ?auto_878681 ?auto_878686 ) ) ( not ( = ?auto_878681 ?auto_878687 ) ) ( not ( = ?auto_878681 ?auto_878688 ) ) ( not ( = ?auto_878681 ?auto_878689 ) ) ( not ( = ?auto_878681 ?auto_878690 ) ) ( not ( = ?auto_878681 ?auto_878691 ) ) ( not ( = ?auto_878681 ?auto_878692 ) ) ( not ( = ?auto_878681 ?auto_878693 ) ) ( not ( = ?auto_878681 ?auto_878694 ) ) ( not ( = ?auto_878681 ?auto_878695 ) ) ( not ( = ?auto_878682 ?auto_878683 ) ) ( not ( = ?auto_878682 ?auto_878684 ) ) ( not ( = ?auto_878682 ?auto_878685 ) ) ( not ( = ?auto_878682 ?auto_878686 ) ) ( not ( = ?auto_878682 ?auto_878687 ) ) ( not ( = ?auto_878682 ?auto_878688 ) ) ( not ( = ?auto_878682 ?auto_878689 ) ) ( not ( = ?auto_878682 ?auto_878690 ) ) ( not ( = ?auto_878682 ?auto_878691 ) ) ( not ( = ?auto_878682 ?auto_878692 ) ) ( not ( = ?auto_878682 ?auto_878693 ) ) ( not ( = ?auto_878682 ?auto_878694 ) ) ( not ( = ?auto_878682 ?auto_878695 ) ) ( not ( = ?auto_878683 ?auto_878684 ) ) ( not ( = ?auto_878683 ?auto_878685 ) ) ( not ( = ?auto_878683 ?auto_878686 ) ) ( not ( = ?auto_878683 ?auto_878687 ) ) ( not ( = ?auto_878683 ?auto_878688 ) ) ( not ( = ?auto_878683 ?auto_878689 ) ) ( not ( = ?auto_878683 ?auto_878690 ) ) ( not ( = ?auto_878683 ?auto_878691 ) ) ( not ( = ?auto_878683 ?auto_878692 ) ) ( not ( = ?auto_878683 ?auto_878693 ) ) ( not ( = ?auto_878683 ?auto_878694 ) ) ( not ( = ?auto_878683 ?auto_878695 ) ) ( not ( = ?auto_878684 ?auto_878685 ) ) ( not ( = ?auto_878684 ?auto_878686 ) ) ( not ( = ?auto_878684 ?auto_878687 ) ) ( not ( = ?auto_878684 ?auto_878688 ) ) ( not ( = ?auto_878684 ?auto_878689 ) ) ( not ( = ?auto_878684 ?auto_878690 ) ) ( not ( = ?auto_878684 ?auto_878691 ) ) ( not ( = ?auto_878684 ?auto_878692 ) ) ( not ( = ?auto_878684 ?auto_878693 ) ) ( not ( = ?auto_878684 ?auto_878694 ) ) ( not ( = ?auto_878684 ?auto_878695 ) ) ( not ( = ?auto_878685 ?auto_878686 ) ) ( not ( = ?auto_878685 ?auto_878687 ) ) ( not ( = ?auto_878685 ?auto_878688 ) ) ( not ( = ?auto_878685 ?auto_878689 ) ) ( not ( = ?auto_878685 ?auto_878690 ) ) ( not ( = ?auto_878685 ?auto_878691 ) ) ( not ( = ?auto_878685 ?auto_878692 ) ) ( not ( = ?auto_878685 ?auto_878693 ) ) ( not ( = ?auto_878685 ?auto_878694 ) ) ( not ( = ?auto_878685 ?auto_878695 ) ) ( not ( = ?auto_878686 ?auto_878687 ) ) ( not ( = ?auto_878686 ?auto_878688 ) ) ( not ( = ?auto_878686 ?auto_878689 ) ) ( not ( = ?auto_878686 ?auto_878690 ) ) ( not ( = ?auto_878686 ?auto_878691 ) ) ( not ( = ?auto_878686 ?auto_878692 ) ) ( not ( = ?auto_878686 ?auto_878693 ) ) ( not ( = ?auto_878686 ?auto_878694 ) ) ( not ( = ?auto_878686 ?auto_878695 ) ) ( not ( = ?auto_878687 ?auto_878688 ) ) ( not ( = ?auto_878687 ?auto_878689 ) ) ( not ( = ?auto_878687 ?auto_878690 ) ) ( not ( = ?auto_878687 ?auto_878691 ) ) ( not ( = ?auto_878687 ?auto_878692 ) ) ( not ( = ?auto_878687 ?auto_878693 ) ) ( not ( = ?auto_878687 ?auto_878694 ) ) ( not ( = ?auto_878687 ?auto_878695 ) ) ( not ( = ?auto_878688 ?auto_878689 ) ) ( not ( = ?auto_878688 ?auto_878690 ) ) ( not ( = ?auto_878688 ?auto_878691 ) ) ( not ( = ?auto_878688 ?auto_878692 ) ) ( not ( = ?auto_878688 ?auto_878693 ) ) ( not ( = ?auto_878688 ?auto_878694 ) ) ( not ( = ?auto_878688 ?auto_878695 ) ) ( not ( = ?auto_878689 ?auto_878690 ) ) ( not ( = ?auto_878689 ?auto_878691 ) ) ( not ( = ?auto_878689 ?auto_878692 ) ) ( not ( = ?auto_878689 ?auto_878693 ) ) ( not ( = ?auto_878689 ?auto_878694 ) ) ( not ( = ?auto_878689 ?auto_878695 ) ) ( not ( = ?auto_878690 ?auto_878691 ) ) ( not ( = ?auto_878690 ?auto_878692 ) ) ( not ( = ?auto_878690 ?auto_878693 ) ) ( not ( = ?auto_878690 ?auto_878694 ) ) ( not ( = ?auto_878690 ?auto_878695 ) ) ( not ( = ?auto_878691 ?auto_878692 ) ) ( not ( = ?auto_878691 ?auto_878693 ) ) ( not ( = ?auto_878691 ?auto_878694 ) ) ( not ( = ?auto_878691 ?auto_878695 ) ) ( not ( = ?auto_878692 ?auto_878693 ) ) ( not ( = ?auto_878692 ?auto_878694 ) ) ( not ( = ?auto_878692 ?auto_878695 ) ) ( not ( = ?auto_878693 ?auto_878694 ) ) ( not ( = ?auto_878693 ?auto_878695 ) ) ( not ( = ?auto_878694 ?auto_878695 ) ) ( ON ?auto_878693 ?auto_878694 ) ( ON ?auto_878692 ?auto_878693 ) ( ON ?auto_878691 ?auto_878692 ) ( ON ?auto_878690 ?auto_878691 ) ( ON ?auto_878689 ?auto_878690 ) ( ON ?auto_878688 ?auto_878689 ) ( ON ?auto_878687 ?auto_878688 ) ( ON ?auto_878686 ?auto_878687 ) ( ON ?auto_878685 ?auto_878686 ) ( ON ?auto_878684 ?auto_878685 ) ( CLEAR ?auto_878682 ) ( ON ?auto_878683 ?auto_878684 ) ( CLEAR ?auto_878683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_878678 ?auto_878679 ?auto_878680 ?auto_878681 ?auto_878682 ?auto_878683 )
      ( MAKE-17PILE ?auto_878678 ?auto_878679 ?auto_878680 ?auto_878681 ?auto_878682 ?auto_878683 ?auto_878684 ?auto_878685 ?auto_878686 ?auto_878687 ?auto_878688 ?auto_878689 ?auto_878690 ?auto_878691 ?auto_878692 ?auto_878693 ?auto_878694 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_878748 - BLOCK
      ?auto_878749 - BLOCK
      ?auto_878750 - BLOCK
      ?auto_878751 - BLOCK
      ?auto_878752 - BLOCK
      ?auto_878753 - BLOCK
      ?auto_878754 - BLOCK
      ?auto_878755 - BLOCK
      ?auto_878756 - BLOCK
      ?auto_878757 - BLOCK
      ?auto_878758 - BLOCK
      ?auto_878759 - BLOCK
      ?auto_878760 - BLOCK
      ?auto_878761 - BLOCK
      ?auto_878762 - BLOCK
      ?auto_878763 - BLOCK
      ?auto_878764 - BLOCK
    )
    :vars
    (
      ?auto_878765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_878764 ?auto_878765 ) ( ON-TABLE ?auto_878748 ) ( ON ?auto_878749 ?auto_878748 ) ( ON ?auto_878750 ?auto_878749 ) ( ON ?auto_878751 ?auto_878750 ) ( not ( = ?auto_878748 ?auto_878749 ) ) ( not ( = ?auto_878748 ?auto_878750 ) ) ( not ( = ?auto_878748 ?auto_878751 ) ) ( not ( = ?auto_878748 ?auto_878752 ) ) ( not ( = ?auto_878748 ?auto_878753 ) ) ( not ( = ?auto_878748 ?auto_878754 ) ) ( not ( = ?auto_878748 ?auto_878755 ) ) ( not ( = ?auto_878748 ?auto_878756 ) ) ( not ( = ?auto_878748 ?auto_878757 ) ) ( not ( = ?auto_878748 ?auto_878758 ) ) ( not ( = ?auto_878748 ?auto_878759 ) ) ( not ( = ?auto_878748 ?auto_878760 ) ) ( not ( = ?auto_878748 ?auto_878761 ) ) ( not ( = ?auto_878748 ?auto_878762 ) ) ( not ( = ?auto_878748 ?auto_878763 ) ) ( not ( = ?auto_878748 ?auto_878764 ) ) ( not ( = ?auto_878748 ?auto_878765 ) ) ( not ( = ?auto_878749 ?auto_878750 ) ) ( not ( = ?auto_878749 ?auto_878751 ) ) ( not ( = ?auto_878749 ?auto_878752 ) ) ( not ( = ?auto_878749 ?auto_878753 ) ) ( not ( = ?auto_878749 ?auto_878754 ) ) ( not ( = ?auto_878749 ?auto_878755 ) ) ( not ( = ?auto_878749 ?auto_878756 ) ) ( not ( = ?auto_878749 ?auto_878757 ) ) ( not ( = ?auto_878749 ?auto_878758 ) ) ( not ( = ?auto_878749 ?auto_878759 ) ) ( not ( = ?auto_878749 ?auto_878760 ) ) ( not ( = ?auto_878749 ?auto_878761 ) ) ( not ( = ?auto_878749 ?auto_878762 ) ) ( not ( = ?auto_878749 ?auto_878763 ) ) ( not ( = ?auto_878749 ?auto_878764 ) ) ( not ( = ?auto_878749 ?auto_878765 ) ) ( not ( = ?auto_878750 ?auto_878751 ) ) ( not ( = ?auto_878750 ?auto_878752 ) ) ( not ( = ?auto_878750 ?auto_878753 ) ) ( not ( = ?auto_878750 ?auto_878754 ) ) ( not ( = ?auto_878750 ?auto_878755 ) ) ( not ( = ?auto_878750 ?auto_878756 ) ) ( not ( = ?auto_878750 ?auto_878757 ) ) ( not ( = ?auto_878750 ?auto_878758 ) ) ( not ( = ?auto_878750 ?auto_878759 ) ) ( not ( = ?auto_878750 ?auto_878760 ) ) ( not ( = ?auto_878750 ?auto_878761 ) ) ( not ( = ?auto_878750 ?auto_878762 ) ) ( not ( = ?auto_878750 ?auto_878763 ) ) ( not ( = ?auto_878750 ?auto_878764 ) ) ( not ( = ?auto_878750 ?auto_878765 ) ) ( not ( = ?auto_878751 ?auto_878752 ) ) ( not ( = ?auto_878751 ?auto_878753 ) ) ( not ( = ?auto_878751 ?auto_878754 ) ) ( not ( = ?auto_878751 ?auto_878755 ) ) ( not ( = ?auto_878751 ?auto_878756 ) ) ( not ( = ?auto_878751 ?auto_878757 ) ) ( not ( = ?auto_878751 ?auto_878758 ) ) ( not ( = ?auto_878751 ?auto_878759 ) ) ( not ( = ?auto_878751 ?auto_878760 ) ) ( not ( = ?auto_878751 ?auto_878761 ) ) ( not ( = ?auto_878751 ?auto_878762 ) ) ( not ( = ?auto_878751 ?auto_878763 ) ) ( not ( = ?auto_878751 ?auto_878764 ) ) ( not ( = ?auto_878751 ?auto_878765 ) ) ( not ( = ?auto_878752 ?auto_878753 ) ) ( not ( = ?auto_878752 ?auto_878754 ) ) ( not ( = ?auto_878752 ?auto_878755 ) ) ( not ( = ?auto_878752 ?auto_878756 ) ) ( not ( = ?auto_878752 ?auto_878757 ) ) ( not ( = ?auto_878752 ?auto_878758 ) ) ( not ( = ?auto_878752 ?auto_878759 ) ) ( not ( = ?auto_878752 ?auto_878760 ) ) ( not ( = ?auto_878752 ?auto_878761 ) ) ( not ( = ?auto_878752 ?auto_878762 ) ) ( not ( = ?auto_878752 ?auto_878763 ) ) ( not ( = ?auto_878752 ?auto_878764 ) ) ( not ( = ?auto_878752 ?auto_878765 ) ) ( not ( = ?auto_878753 ?auto_878754 ) ) ( not ( = ?auto_878753 ?auto_878755 ) ) ( not ( = ?auto_878753 ?auto_878756 ) ) ( not ( = ?auto_878753 ?auto_878757 ) ) ( not ( = ?auto_878753 ?auto_878758 ) ) ( not ( = ?auto_878753 ?auto_878759 ) ) ( not ( = ?auto_878753 ?auto_878760 ) ) ( not ( = ?auto_878753 ?auto_878761 ) ) ( not ( = ?auto_878753 ?auto_878762 ) ) ( not ( = ?auto_878753 ?auto_878763 ) ) ( not ( = ?auto_878753 ?auto_878764 ) ) ( not ( = ?auto_878753 ?auto_878765 ) ) ( not ( = ?auto_878754 ?auto_878755 ) ) ( not ( = ?auto_878754 ?auto_878756 ) ) ( not ( = ?auto_878754 ?auto_878757 ) ) ( not ( = ?auto_878754 ?auto_878758 ) ) ( not ( = ?auto_878754 ?auto_878759 ) ) ( not ( = ?auto_878754 ?auto_878760 ) ) ( not ( = ?auto_878754 ?auto_878761 ) ) ( not ( = ?auto_878754 ?auto_878762 ) ) ( not ( = ?auto_878754 ?auto_878763 ) ) ( not ( = ?auto_878754 ?auto_878764 ) ) ( not ( = ?auto_878754 ?auto_878765 ) ) ( not ( = ?auto_878755 ?auto_878756 ) ) ( not ( = ?auto_878755 ?auto_878757 ) ) ( not ( = ?auto_878755 ?auto_878758 ) ) ( not ( = ?auto_878755 ?auto_878759 ) ) ( not ( = ?auto_878755 ?auto_878760 ) ) ( not ( = ?auto_878755 ?auto_878761 ) ) ( not ( = ?auto_878755 ?auto_878762 ) ) ( not ( = ?auto_878755 ?auto_878763 ) ) ( not ( = ?auto_878755 ?auto_878764 ) ) ( not ( = ?auto_878755 ?auto_878765 ) ) ( not ( = ?auto_878756 ?auto_878757 ) ) ( not ( = ?auto_878756 ?auto_878758 ) ) ( not ( = ?auto_878756 ?auto_878759 ) ) ( not ( = ?auto_878756 ?auto_878760 ) ) ( not ( = ?auto_878756 ?auto_878761 ) ) ( not ( = ?auto_878756 ?auto_878762 ) ) ( not ( = ?auto_878756 ?auto_878763 ) ) ( not ( = ?auto_878756 ?auto_878764 ) ) ( not ( = ?auto_878756 ?auto_878765 ) ) ( not ( = ?auto_878757 ?auto_878758 ) ) ( not ( = ?auto_878757 ?auto_878759 ) ) ( not ( = ?auto_878757 ?auto_878760 ) ) ( not ( = ?auto_878757 ?auto_878761 ) ) ( not ( = ?auto_878757 ?auto_878762 ) ) ( not ( = ?auto_878757 ?auto_878763 ) ) ( not ( = ?auto_878757 ?auto_878764 ) ) ( not ( = ?auto_878757 ?auto_878765 ) ) ( not ( = ?auto_878758 ?auto_878759 ) ) ( not ( = ?auto_878758 ?auto_878760 ) ) ( not ( = ?auto_878758 ?auto_878761 ) ) ( not ( = ?auto_878758 ?auto_878762 ) ) ( not ( = ?auto_878758 ?auto_878763 ) ) ( not ( = ?auto_878758 ?auto_878764 ) ) ( not ( = ?auto_878758 ?auto_878765 ) ) ( not ( = ?auto_878759 ?auto_878760 ) ) ( not ( = ?auto_878759 ?auto_878761 ) ) ( not ( = ?auto_878759 ?auto_878762 ) ) ( not ( = ?auto_878759 ?auto_878763 ) ) ( not ( = ?auto_878759 ?auto_878764 ) ) ( not ( = ?auto_878759 ?auto_878765 ) ) ( not ( = ?auto_878760 ?auto_878761 ) ) ( not ( = ?auto_878760 ?auto_878762 ) ) ( not ( = ?auto_878760 ?auto_878763 ) ) ( not ( = ?auto_878760 ?auto_878764 ) ) ( not ( = ?auto_878760 ?auto_878765 ) ) ( not ( = ?auto_878761 ?auto_878762 ) ) ( not ( = ?auto_878761 ?auto_878763 ) ) ( not ( = ?auto_878761 ?auto_878764 ) ) ( not ( = ?auto_878761 ?auto_878765 ) ) ( not ( = ?auto_878762 ?auto_878763 ) ) ( not ( = ?auto_878762 ?auto_878764 ) ) ( not ( = ?auto_878762 ?auto_878765 ) ) ( not ( = ?auto_878763 ?auto_878764 ) ) ( not ( = ?auto_878763 ?auto_878765 ) ) ( not ( = ?auto_878764 ?auto_878765 ) ) ( ON ?auto_878763 ?auto_878764 ) ( ON ?auto_878762 ?auto_878763 ) ( ON ?auto_878761 ?auto_878762 ) ( ON ?auto_878760 ?auto_878761 ) ( ON ?auto_878759 ?auto_878760 ) ( ON ?auto_878758 ?auto_878759 ) ( ON ?auto_878757 ?auto_878758 ) ( ON ?auto_878756 ?auto_878757 ) ( ON ?auto_878755 ?auto_878756 ) ( ON ?auto_878754 ?auto_878755 ) ( ON ?auto_878753 ?auto_878754 ) ( CLEAR ?auto_878751 ) ( ON ?auto_878752 ?auto_878753 ) ( CLEAR ?auto_878752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_878748 ?auto_878749 ?auto_878750 ?auto_878751 ?auto_878752 )
      ( MAKE-17PILE ?auto_878748 ?auto_878749 ?auto_878750 ?auto_878751 ?auto_878752 ?auto_878753 ?auto_878754 ?auto_878755 ?auto_878756 ?auto_878757 ?auto_878758 ?auto_878759 ?auto_878760 ?auto_878761 ?auto_878762 ?auto_878763 ?auto_878764 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_878818 - BLOCK
      ?auto_878819 - BLOCK
      ?auto_878820 - BLOCK
      ?auto_878821 - BLOCK
      ?auto_878822 - BLOCK
      ?auto_878823 - BLOCK
      ?auto_878824 - BLOCK
      ?auto_878825 - BLOCK
      ?auto_878826 - BLOCK
      ?auto_878827 - BLOCK
      ?auto_878828 - BLOCK
      ?auto_878829 - BLOCK
      ?auto_878830 - BLOCK
      ?auto_878831 - BLOCK
      ?auto_878832 - BLOCK
      ?auto_878833 - BLOCK
      ?auto_878834 - BLOCK
    )
    :vars
    (
      ?auto_878835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_878834 ?auto_878835 ) ( ON-TABLE ?auto_878818 ) ( ON ?auto_878819 ?auto_878818 ) ( ON ?auto_878820 ?auto_878819 ) ( not ( = ?auto_878818 ?auto_878819 ) ) ( not ( = ?auto_878818 ?auto_878820 ) ) ( not ( = ?auto_878818 ?auto_878821 ) ) ( not ( = ?auto_878818 ?auto_878822 ) ) ( not ( = ?auto_878818 ?auto_878823 ) ) ( not ( = ?auto_878818 ?auto_878824 ) ) ( not ( = ?auto_878818 ?auto_878825 ) ) ( not ( = ?auto_878818 ?auto_878826 ) ) ( not ( = ?auto_878818 ?auto_878827 ) ) ( not ( = ?auto_878818 ?auto_878828 ) ) ( not ( = ?auto_878818 ?auto_878829 ) ) ( not ( = ?auto_878818 ?auto_878830 ) ) ( not ( = ?auto_878818 ?auto_878831 ) ) ( not ( = ?auto_878818 ?auto_878832 ) ) ( not ( = ?auto_878818 ?auto_878833 ) ) ( not ( = ?auto_878818 ?auto_878834 ) ) ( not ( = ?auto_878818 ?auto_878835 ) ) ( not ( = ?auto_878819 ?auto_878820 ) ) ( not ( = ?auto_878819 ?auto_878821 ) ) ( not ( = ?auto_878819 ?auto_878822 ) ) ( not ( = ?auto_878819 ?auto_878823 ) ) ( not ( = ?auto_878819 ?auto_878824 ) ) ( not ( = ?auto_878819 ?auto_878825 ) ) ( not ( = ?auto_878819 ?auto_878826 ) ) ( not ( = ?auto_878819 ?auto_878827 ) ) ( not ( = ?auto_878819 ?auto_878828 ) ) ( not ( = ?auto_878819 ?auto_878829 ) ) ( not ( = ?auto_878819 ?auto_878830 ) ) ( not ( = ?auto_878819 ?auto_878831 ) ) ( not ( = ?auto_878819 ?auto_878832 ) ) ( not ( = ?auto_878819 ?auto_878833 ) ) ( not ( = ?auto_878819 ?auto_878834 ) ) ( not ( = ?auto_878819 ?auto_878835 ) ) ( not ( = ?auto_878820 ?auto_878821 ) ) ( not ( = ?auto_878820 ?auto_878822 ) ) ( not ( = ?auto_878820 ?auto_878823 ) ) ( not ( = ?auto_878820 ?auto_878824 ) ) ( not ( = ?auto_878820 ?auto_878825 ) ) ( not ( = ?auto_878820 ?auto_878826 ) ) ( not ( = ?auto_878820 ?auto_878827 ) ) ( not ( = ?auto_878820 ?auto_878828 ) ) ( not ( = ?auto_878820 ?auto_878829 ) ) ( not ( = ?auto_878820 ?auto_878830 ) ) ( not ( = ?auto_878820 ?auto_878831 ) ) ( not ( = ?auto_878820 ?auto_878832 ) ) ( not ( = ?auto_878820 ?auto_878833 ) ) ( not ( = ?auto_878820 ?auto_878834 ) ) ( not ( = ?auto_878820 ?auto_878835 ) ) ( not ( = ?auto_878821 ?auto_878822 ) ) ( not ( = ?auto_878821 ?auto_878823 ) ) ( not ( = ?auto_878821 ?auto_878824 ) ) ( not ( = ?auto_878821 ?auto_878825 ) ) ( not ( = ?auto_878821 ?auto_878826 ) ) ( not ( = ?auto_878821 ?auto_878827 ) ) ( not ( = ?auto_878821 ?auto_878828 ) ) ( not ( = ?auto_878821 ?auto_878829 ) ) ( not ( = ?auto_878821 ?auto_878830 ) ) ( not ( = ?auto_878821 ?auto_878831 ) ) ( not ( = ?auto_878821 ?auto_878832 ) ) ( not ( = ?auto_878821 ?auto_878833 ) ) ( not ( = ?auto_878821 ?auto_878834 ) ) ( not ( = ?auto_878821 ?auto_878835 ) ) ( not ( = ?auto_878822 ?auto_878823 ) ) ( not ( = ?auto_878822 ?auto_878824 ) ) ( not ( = ?auto_878822 ?auto_878825 ) ) ( not ( = ?auto_878822 ?auto_878826 ) ) ( not ( = ?auto_878822 ?auto_878827 ) ) ( not ( = ?auto_878822 ?auto_878828 ) ) ( not ( = ?auto_878822 ?auto_878829 ) ) ( not ( = ?auto_878822 ?auto_878830 ) ) ( not ( = ?auto_878822 ?auto_878831 ) ) ( not ( = ?auto_878822 ?auto_878832 ) ) ( not ( = ?auto_878822 ?auto_878833 ) ) ( not ( = ?auto_878822 ?auto_878834 ) ) ( not ( = ?auto_878822 ?auto_878835 ) ) ( not ( = ?auto_878823 ?auto_878824 ) ) ( not ( = ?auto_878823 ?auto_878825 ) ) ( not ( = ?auto_878823 ?auto_878826 ) ) ( not ( = ?auto_878823 ?auto_878827 ) ) ( not ( = ?auto_878823 ?auto_878828 ) ) ( not ( = ?auto_878823 ?auto_878829 ) ) ( not ( = ?auto_878823 ?auto_878830 ) ) ( not ( = ?auto_878823 ?auto_878831 ) ) ( not ( = ?auto_878823 ?auto_878832 ) ) ( not ( = ?auto_878823 ?auto_878833 ) ) ( not ( = ?auto_878823 ?auto_878834 ) ) ( not ( = ?auto_878823 ?auto_878835 ) ) ( not ( = ?auto_878824 ?auto_878825 ) ) ( not ( = ?auto_878824 ?auto_878826 ) ) ( not ( = ?auto_878824 ?auto_878827 ) ) ( not ( = ?auto_878824 ?auto_878828 ) ) ( not ( = ?auto_878824 ?auto_878829 ) ) ( not ( = ?auto_878824 ?auto_878830 ) ) ( not ( = ?auto_878824 ?auto_878831 ) ) ( not ( = ?auto_878824 ?auto_878832 ) ) ( not ( = ?auto_878824 ?auto_878833 ) ) ( not ( = ?auto_878824 ?auto_878834 ) ) ( not ( = ?auto_878824 ?auto_878835 ) ) ( not ( = ?auto_878825 ?auto_878826 ) ) ( not ( = ?auto_878825 ?auto_878827 ) ) ( not ( = ?auto_878825 ?auto_878828 ) ) ( not ( = ?auto_878825 ?auto_878829 ) ) ( not ( = ?auto_878825 ?auto_878830 ) ) ( not ( = ?auto_878825 ?auto_878831 ) ) ( not ( = ?auto_878825 ?auto_878832 ) ) ( not ( = ?auto_878825 ?auto_878833 ) ) ( not ( = ?auto_878825 ?auto_878834 ) ) ( not ( = ?auto_878825 ?auto_878835 ) ) ( not ( = ?auto_878826 ?auto_878827 ) ) ( not ( = ?auto_878826 ?auto_878828 ) ) ( not ( = ?auto_878826 ?auto_878829 ) ) ( not ( = ?auto_878826 ?auto_878830 ) ) ( not ( = ?auto_878826 ?auto_878831 ) ) ( not ( = ?auto_878826 ?auto_878832 ) ) ( not ( = ?auto_878826 ?auto_878833 ) ) ( not ( = ?auto_878826 ?auto_878834 ) ) ( not ( = ?auto_878826 ?auto_878835 ) ) ( not ( = ?auto_878827 ?auto_878828 ) ) ( not ( = ?auto_878827 ?auto_878829 ) ) ( not ( = ?auto_878827 ?auto_878830 ) ) ( not ( = ?auto_878827 ?auto_878831 ) ) ( not ( = ?auto_878827 ?auto_878832 ) ) ( not ( = ?auto_878827 ?auto_878833 ) ) ( not ( = ?auto_878827 ?auto_878834 ) ) ( not ( = ?auto_878827 ?auto_878835 ) ) ( not ( = ?auto_878828 ?auto_878829 ) ) ( not ( = ?auto_878828 ?auto_878830 ) ) ( not ( = ?auto_878828 ?auto_878831 ) ) ( not ( = ?auto_878828 ?auto_878832 ) ) ( not ( = ?auto_878828 ?auto_878833 ) ) ( not ( = ?auto_878828 ?auto_878834 ) ) ( not ( = ?auto_878828 ?auto_878835 ) ) ( not ( = ?auto_878829 ?auto_878830 ) ) ( not ( = ?auto_878829 ?auto_878831 ) ) ( not ( = ?auto_878829 ?auto_878832 ) ) ( not ( = ?auto_878829 ?auto_878833 ) ) ( not ( = ?auto_878829 ?auto_878834 ) ) ( not ( = ?auto_878829 ?auto_878835 ) ) ( not ( = ?auto_878830 ?auto_878831 ) ) ( not ( = ?auto_878830 ?auto_878832 ) ) ( not ( = ?auto_878830 ?auto_878833 ) ) ( not ( = ?auto_878830 ?auto_878834 ) ) ( not ( = ?auto_878830 ?auto_878835 ) ) ( not ( = ?auto_878831 ?auto_878832 ) ) ( not ( = ?auto_878831 ?auto_878833 ) ) ( not ( = ?auto_878831 ?auto_878834 ) ) ( not ( = ?auto_878831 ?auto_878835 ) ) ( not ( = ?auto_878832 ?auto_878833 ) ) ( not ( = ?auto_878832 ?auto_878834 ) ) ( not ( = ?auto_878832 ?auto_878835 ) ) ( not ( = ?auto_878833 ?auto_878834 ) ) ( not ( = ?auto_878833 ?auto_878835 ) ) ( not ( = ?auto_878834 ?auto_878835 ) ) ( ON ?auto_878833 ?auto_878834 ) ( ON ?auto_878832 ?auto_878833 ) ( ON ?auto_878831 ?auto_878832 ) ( ON ?auto_878830 ?auto_878831 ) ( ON ?auto_878829 ?auto_878830 ) ( ON ?auto_878828 ?auto_878829 ) ( ON ?auto_878827 ?auto_878828 ) ( ON ?auto_878826 ?auto_878827 ) ( ON ?auto_878825 ?auto_878826 ) ( ON ?auto_878824 ?auto_878825 ) ( ON ?auto_878823 ?auto_878824 ) ( ON ?auto_878822 ?auto_878823 ) ( CLEAR ?auto_878820 ) ( ON ?auto_878821 ?auto_878822 ) ( CLEAR ?auto_878821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_878818 ?auto_878819 ?auto_878820 ?auto_878821 )
      ( MAKE-17PILE ?auto_878818 ?auto_878819 ?auto_878820 ?auto_878821 ?auto_878822 ?auto_878823 ?auto_878824 ?auto_878825 ?auto_878826 ?auto_878827 ?auto_878828 ?auto_878829 ?auto_878830 ?auto_878831 ?auto_878832 ?auto_878833 ?auto_878834 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_878888 - BLOCK
      ?auto_878889 - BLOCK
      ?auto_878890 - BLOCK
      ?auto_878891 - BLOCK
      ?auto_878892 - BLOCK
      ?auto_878893 - BLOCK
      ?auto_878894 - BLOCK
      ?auto_878895 - BLOCK
      ?auto_878896 - BLOCK
      ?auto_878897 - BLOCK
      ?auto_878898 - BLOCK
      ?auto_878899 - BLOCK
      ?auto_878900 - BLOCK
      ?auto_878901 - BLOCK
      ?auto_878902 - BLOCK
      ?auto_878903 - BLOCK
      ?auto_878904 - BLOCK
    )
    :vars
    (
      ?auto_878905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_878904 ?auto_878905 ) ( ON-TABLE ?auto_878888 ) ( ON ?auto_878889 ?auto_878888 ) ( not ( = ?auto_878888 ?auto_878889 ) ) ( not ( = ?auto_878888 ?auto_878890 ) ) ( not ( = ?auto_878888 ?auto_878891 ) ) ( not ( = ?auto_878888 ?auto_878892 ) ) ( not ( = ?auto_878888 ?auto_878893 ) ) ( not ( = ?auto_878888 ?auto_878894 ) ) ( not ( = ?auto_878888 ?auto_878895 ) ) ( not ( = ?auto_878888 ?auto_878896 ) ) ( not ( = ?auto_878888 ?auto_878897 ) ) ( not ( = ?auto_878888 ?auto_878898 ) ) ( not ( = ?auto_878888 ?auto_878899 ) ) ( not ( = ?auto_878888 ?auto_878900 ) ) ( not ( = ?auto_878888 ?auto_878901 ) ) ( not ( = ?auto_878888 ?auto_878902 ) ) ( not ( = ?auto_878888 ?auto_878903 ) ) ( not ( = ?auto_878888 ?auto_878904 ) ) ( not ( = ?auto_878888 ?auto_878905 ) ) ( not ( = ?auto_878889 ?auto_878890 ) ) ( not ( = ?auto_878889 ?auto_878891 ) ) ( not ( = ?auto_878889 ?auto_878892 ) ) ( not ( = ?auto_878889 ?auto_878893 ) ) ( not ( = ?auto_878889 ?auto_878894 ) ) ( not ( = ?auto_878889 ?auto_878895 ) ) ( not ( = ?auto_878889 ?auto_878896 ) ) ( not ( = ?auto_878889 ?auto_878897 ) ) ( not ( = ?auto_878889 ?auto_878898 ) ) ( not ( = ?auto_878889 ?auto_878899 ) ) ( not ( = ?auto_878889 ?auto_878900 ) ) ( not ( = ?auto_878889 ?auto_878901 ) ) ( not ( = ?auto_878889 ?auto_878902 ) ) ( not ( = ?auto_878889 ?auto_878903 ) ) ( not ( = ?auto_878889 ?auto_878904 ) ) ( not ( = ?auto_878889 ?auto_878905 ) ) ( not ( = ?auto_878890 ?auto_878891 ) ) ( not ( = ?auto_878890 ?auto_878892 ) ) ( not ( = ?auto_878890 ?auto_878893 ) ) ( not ( = ?auto_878890 ?auto_878894 ) ) ( not ( = ?auto_878890 ?auto_878895 ) ) ( not ( = ?auto_878890 ?auto_878896 ) ) ( not ( = ?auto_878890 ?auto_878897 ) ) ( not ( = ?auto_878890 ?auto_878898 ) ) ( not ( = ?auto_878890 ?auto_878899 ) ) ( not ( = ?auto_878890 ?auto_878900 ) ) ( not ( = ?auto_878890 ?auto_878901 ) ) ( not ( = ?auto_878890 ?auto_878902 ) ) ( not ( = ?auto_878890 ?auto_878903 ) ) ( not ( = ?auto_878890 ?auto_878904 ) ) ( not ( = ?auto_878890 ?auto_878905 ) ) ( not ( = ?auto_878891 ?auto_878892 ) ) ( not ( = ?auto_878891 ?auto_878893 ) ) ( not ( = ?auto_878891 ?auto_878894 ) ) ( not ( = ?auto_878891 ?auto_878895 ) ) ( not ( = ?auto_878891 ?auto_878896 ) ) ( not ( = ?auto_878891 ?auto_878897 ) ) ( not ( = ?auto_878891 ?auto_878898 ) ) ( not ( = ?auto_878891 ?auto_878899 ) ) ( not ( = ?auto_878891 ?auto_878900 ) ) ( not ( = ?auto_878891 ?auto_878901 ) ) ( not ( = ?auto_878891 ?auto_878902 ) ) ( not ( = ?auto_878891 ?auto_878903 ) ) ( not ( = ?auto_878891 ?auto_878904 ) ) ( not ( = ?auto_878891 ?auto_878905 ) ) ( not ( = ?auto_878892 ?auto_878893 ) ) ( not ( = ?auto_878892 ?auto_878894 ) ) ( not ( = ?auto_878892 ?auto_878895 ) ) ( not ( = ?auto_878892 ?auto_878896 ) ) ( not ( = ?auto_878892 ?auto_878897 ) ) ( not ( = ?auto_878892 ?auto_878898 ) ) ( not ( = ?auto_878892 ?auto_878899 ) ) ( not ( = ?auto_878892 ?auto_878900 ) ) ( not ( = ?auto_878892 ?auto_878901 ) ) ( not ( = ?auto_878892 ?auto_878902 ) ) ( not ( = ?auto_878892 ?auto_878903 ) ) ( not ( = ?auto_878892 ?auto_878904 ) ) ( not ( = ?auto_878892 ?auto_878905 ) ) ( not ( = ?auto_878893 ?auto_878894 ) ) ( not ( = ?auto_878893 ?auto_878895 ) ) ( not ( = ?auto_878893 ?auto_878896 ) ) ( not ( = ?auto_878893 ?auto_878897 ) ) ( not ( = ?auto_878893 ?auto_878898 ) ) ( not ( = ?auto_878893 ?auto_878899 ) ) ( not ( = ?auto_878893 ?auto_878900 ) ) ( not ( = ?auto_878893 ?auto_878901 ) ) ( not ( = ?auto_878893 ?auto_878902 ) ) ( not ( = ?auto_878893 ?auto_878903 ) ) ( not ( = ?auto_878893 ?auto_878904 ) ) ( not ( = ?auto_878893 ?auto_878905 ) ) ( not ( = ?auto_878894 ?auto_878895 ) ) ( not ( = ?auto_878894 ?auto_878896 ) ) ( not ( = ?auto_878894 ?auto_878897 ) ) ( not ( = ?auto_878894 ?auto_878898 ) ) ( not ( = ?auto_878894 ?auto_878899 ) ) ( not ( = ?auto_878894 ?auto_878900 ) ) ( not ( = ?auto_878894 ?auto_878901 ) ) ( not ( = ?auto_878894 ?auto_878902 ) ) ( not ( = ?auto_878894 ?auto_878903 ) ) ( not ( = ?auto_878894 ?auto_878904 ) ) ( not ( = ?auto_878894 ?auto_878905 ) ) ( not ( = ?auto_878895 ?auto_878896 ) ) ( not ( = ?auto_878895 ?auto_878897 ) ) ( not ( = ?auto_878895 ?auto_878898 ) ) ( not ( = ?auto_878895 ?auto_878899 ) ) ( not ( = ?auto_878895 ?auto_878900 ) ) ( not ( = ?auto_878895 ?auto_878901 ) ) ( not ( = ?auto_878895 ?auto_878902 ) ) ( not ( = ?auto_878895 ?auto_878903 ) ) ( not ( = ?auto_878895 ?auto_878904 ) ) ( not ( = ?auto_878895 ?auto_878905 ) ) ( not ( = ?auto_878896 ?auto_878897 ) ) ( not ( = ?auto_878896 ?auto_878898 ) ) ( not ( = ?auto_878896 ?auto_878899 ) ) ( not ( = ?auto_878896 ?auto_878900 ) ) ( not ( = ?auto_878896 ?auto_878901 ) ) ( not ( = ?auto_878896 ?auto_878902 ) ) ( not ( = ?auto_878896 ?auto_878903 ) ) ( not ( = ?auto_878896 ?auto_878904 ) ) ( not ( = ?auto_878896 ?auto_878905 ) ) ( not ( = ?auto_878897 ?auto_878898 ) ) ( not ( = ?auto_878897 ?auto_878899 ) ) ( not ( = ?auto_878897 ?auto_878900 ) ) ( not ( = ?auto_878897 ?auto_878901 ) ) ( not ( = ?auto_878897 ?auto_878902 ) ) ( not ( = ?auto_878897 ?auto_878903 ) ) ( not ( = ?auto_878897 ?auto_878904 ) ) ( not ( = ?auto_878897 ?auto_878905 ) ) ( not ( = ?auto_878898 ?auto_878899 ) ) ( not ( = ?auto_878898 ?auto_878900 ) ) ( not ( = ?auto_878898 ?auto_878901 ) ) ( not ( = ?auto_878898 ?auto_878902 ) ) ( not ( = ?auto_878898 ?auto_878903 ) ) ( not ( = ?auto_878898 ?auto_878904 ) ) ( not ( = ?auto_878898 ?auto_878905 ) ) ( not ( = ?auto_878899 ?auto_878900 ) ) ( not ( = ?auto_878899 ?auto_878901 ) ) ( not ( = ?auto_878899 ?auto_878902 ) ) ( not ( = ?auto_878899 ?auto_878903 ) ) ( not ( = ?auto_878899 ?auto_878904 ) ) ( not ( = ?auto_878899 ?auto_878905 ) ) ( not ( = ?auto_878900 ?auto_878901 ) ) ( not ( = ?auto_878900 ?auto_878902 ) ) ( not ( = ?auto_878900 ?auto_878903 ) ) ( not ( = ?auto_878900 ?auto_878904 ) ) ( not ( = ?auto_878900 ?auto_878905 ) ) ( not ( = ?auto_878901 ?auto_878902 ) ) ( not ( = ?auto_878901 ?auto_878903 ) ) ( not ( = ?auto_878901 ?auto_878904 ) ) ( not ( = ?auto_878901 ?auto_878905 ) ) ( not ( = ?auto_878902 ?auto_878903 ) ) ( not ( = ?auto_878902 ?auto_878904 ) ) ( not ( = ?auto_878902 ?auto_878905 ) ) ( not ( = ?auto_878903 ?auto_878904 ) ) ( not ( = ?auto_878903 ?auto_878905 ) ) ( not ( = ?auto_878904 ?auto_878905 ) ) ( ON ?auto_878903 ?auto_878904 ) ( ON ?auto_878902 ?auto_878903 ) ( ON ?auto_878901 ?auto_878902 ) ( ON ?auto_878900 ?auto_878901 ) ( ON ?auto_878899 ?auto_878900 ) ( ON ?auto_878898 ?auto_878899 ) ( ON ?auto_878897 ?auto_878898 ) ( ON ?auto_878896 ?auto_878897 ) ( ON ?auto_878895 ?auto_878896 ) ( ON ?auto_878894 ?auto_878895 ) ( ON ?auto_878893 ?auto_878894 ) ( ON ?auto_878892 ?auto_878893 ) ( ON ?auto_878891 ?auto_878892 ) ( CLEAR ?auto_878889 ) ( ON ?auto_878890 ?auto_878891 ) ( CLEAR ?auto_878890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_878888 ?auto_878889 ?auto_878890 )
      ( MAKE-17PILE ?auto_878888 ?auto_878889 ?auto_878890 ?auto_878891 ?auto_878892 ?auto_878893 ?auto_878894 ?auto_878895 ?auto_878896 ?auto_878897 ?auto_878898 ?auto_878899 ?auto_878900 ?auto_878901 ?auto_878902 ?auto_878903 ?auto_878904 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_878958 - BLOCK
      ?auto_878959 - BLOCK
      ?auto_878960 - BLOCK
      ?auto_878961 - BLOCK
      ?auto_878962 - BLOCK
      ?auto_878963 - BLOCK
      ?auto_878964 - BLOCK
      ?auto_878965 - BLOCK
      ?auto_878966 - BLOCK
      ?auto_878967 - BLOCK
      ?auto_878968 - BLOCK
      ?auto_878969 - BLOCK
      ?auto_878970 - BLOCK
      ?auto_878971 - BLOCK
      ?auto_878972 - BLOCK
      ?auto_878973 - BLOCK
      ?auto_878974 - BLOCK
    )
    :vars
    (
      ?auto_878975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_878974 ?auto_878975 ) ( ON-TABLE ?auto_878958 ) ( not ( = ?auto_878958 ?auto_878959 ) ) ( not ( = ?auto_878958 ?auto_878960 ) ) ( not ( = ?auto_878958 ?auto_878961 ) ) ( not ( = ?auto_878958 ?auto_878962 ) ) ( not ( = ?auto_878958 ?auto_878963 ) ) ( not ( = ?auto_878958 ?auto_878964 ) ) ( not ( = ?auto_878958 ?auto_878965 ) ) ( not ( = ?auto_878958 ?auto_878966 ) ) ( not ( = ?auto_878958 ?auto_878967 ) ) ( not ( = ?auto_878958 ?auto_878968 ) ) ( not ( = ?auto_878958 ?auto_878969 ) ) ( not ( = ?auto_878958 ?auto_878970 ) ) ( not ( = ?auto_878958 ?auto_878971 ) ) ( not ( = ?auto_878958 ?auto_878972 ) ) ( not ( = ?auto_878958 ?auto_878973 ) ) ( not ( = ?auto_878958 ?auto_878974 ) ) ( not ( = ?auto_878958 ?auto_878975 ) ) ( not ( = ?auto_878959 ?auto_878960 ) ) ( not ( = ?auto_878959 ?auto_878961 ) ) ( not ( = ?auto_878959 ?auto_878962 ) ) ( not ( = ?auto_878959 ?auto_878963 ) ) ( not ( = ?auto_878959 ?auto_878964 ) ) ( not ( = ?auto_878959 ?auto_878965 ) ) ( not ( = ?auto_878959 ?auto_878966 ) ) ( not ( = ?auto_878959 ?auto_878967 ) ) ( not ( = ?auto_878959 ?auto_878968 ) ) ( not ( = ?auto_878959 ?auto_878969 ) ) ( not ( = ?auto_878959 ?auto_878970 ) ) ( not ( = ?auto_878959 ?auto_878971 ) ) ( not ( = ?auto_878959 ?auto_878972 ) ) ( not ( = ?auto_878959 ?auto_878973 ) ) ( not ( = ?auto_878959 ?auto_878974 ) ) ( not ( = ?auto_878959 ?auto_878975 ) ) ( not ( = ?auto_878960 ?auto_878961 ) ) ( not ( = ?auto_878960 ?auto_878962 ) ) ( not ( = ?auto_878960 ?auto_878963 ) ) ( not ( = ?auto_878960 ?auto_878964 ) ) ( not ( = ?auto_878960 ?auto_878965 ) ) ( not ( = ?auto_878960 ?auto_878966 ) ) ( not ( = ?auto_878960 ?auto_878967 ) ) ( not ( = ?auto_878960 ?auto_878968 ) ) ( not ( = ?auto_878960 ?auto_878969 ) ) ( not ( = ?auto_878960 ?auto_878970 ) ) ( not ( = ?auto_878960 ?auto_878971 ) ) ( not ( = ?auto_878960 ?auto_878972 ) ) ( not ( = ?auto_878960 ?auto_878973 ) ) ( not ( = ?auto_878960 ?auto_878974 ) ) ( not ( = ?auto_878960 ?auto_878975 ) ) ( not ( = ?auto_878961 ?auto_878962 ) ) ( not ( = ?auto_878961 ?auto_878963 ) ) ( not ( = ?auto_878961 ?auto_878964 ) ) ( not ( = ?auto_878961 ?auto_878965 ) ) ( not ( = ?auto_878961 ?auto_878966 ) ) ( not ( = ?auto_878961 ?auto_878967 ) ) ( not ( = ?auto_878961 ?auto_878968 ) ) ( not ( = ?auto_878961 ?auto_878969 ) ) ( not ( = ?auto_878961 ?auto_878970 ) ) ( not ( = ?auto_878961 ?auto_878971 ) ) ( not ( = ?auto_878961 ?auto_878972 ) ) ( not ( = ?auto_878961 ?auto_878973 ) ) ( not ( = ?auto_878961 ?auto_878974 ) ) ( not ( = ?auto_878961 ?auto_878975 ) ) ( not ( = ?auto_878962 ?auto_878963 ) ) ( not ( = ?auto_878962 ?auto_878964 ) ) ( not ( = ?auto_878962 ?auto_878965 ) ) ( not ( = ?auto_878962 ?auto_878966 ) ) ( not ( = ?auto_878962 ?auto_878967 ) ) ( not ( = ?auto_878962 ?auto_878968 ) ) ( not ( = ?auto_878962 ?auto_878969 ) ) ( not ( = ?auto_878962 ?auto_878970 ) ) ( not ( = ?auto_878962 ?auto_878971 ) ) ( not ( = ?auto_878962 ?auto_878972 ) ) ( not ( = ?auto_878962 ?auto_878973 ) ) ( not ( = ?auto_878962 ?auto_878974 ) ) ( not ( = ?auto_878962 ?auto_878975 ) ) ( not ( = ?auto_878963 ?auto_878964 ) ) ( not ( = ?auto_878963 ?auto_878965 ) ) ( not ( = ?auto_878963 ?auto_878966 ) ) ( not ( = ?auto_878963 ?auto_878967 ) ) ( not ( = ?auto_878963 ?auto_878968 ) ) ( not ( = ?auto_878963 ?auto_878969 ) ) ( not ( = ?auto_878963 ?auto_878970 ) ) ( not ( = ?auto_878963 ?auto_878971 ) ) ( not ( = ?auto_878963 ?auto_878972 ) ) ( not ( = ?auto_878963 ?auto_878973 ) ) ( not ( = ?auto_878963 ?auto_878974 ) ) ( not ( = ?auto_878963 ?auto_878975 ) ) ( not ( = ?auto_878964 ?auto_878965 ) ) ( not ( = ?auto_878964 ?auto_878966 ) ) ( not ( = ?auto_878964 ?auto_878967 ) ) ( not ( = ?auto_878964 ?auto_878968 ) ) ( not ( = ?auto_878964 ?auto_878969 ) ) ( not ( = ?auto_878964 ?auto_878970 ) ) ( not ( = ?auto_878964 ?auto_878971 ) ) ( not ( = ?auto_878964 ?auto_878972 ) ) ( not ( = ?auto_878964 ?auto_878973 ) ) ( not ( = ?auto_878964 ?auto_878974 ) ) ( not ( = ?auto_878964 ?auto_878975 ) ) ( not ( = ?auto_878965 ?auto_878966 ) ) ( not ( = ?auto_878965 ?auto_878967 ) ) ( not ( = ?auto_878965 ?auto_878968 ) ) ( not ( = ?auto_878965 ?auto_878969 ) ) ( not ( = ?auto_878965 ?auto_878970 ) ) ( not ( = ?auto_878965 ?auto_878971 ) ) ( not ( = ?auto_878965 ?auto_878972 ) ) ( not ( = ?auto_878965 ?auto_878973 ) ) ( not ( = ?auto_878965 ?auto_878974 ) ) ( not ( = ?auto_878965 ?auto_878975 ) ) ( not ( = ?auto_878966 ?auto_878967 ) ) ( not ( = ?auto_878966 ?auto_878968 ) ) ( not ( = ?auto_878966 ?auto_878969 ) ) ( not ( = ?auto_878966 ?auto_878970 ) ) ( not ( = ?auto_878966 ?auto_878971 ) ) ( not ( = ?auto_878966 ?auto_878972 ) ) ( not ( = ?auto_878966 ?auto_878973 ) ) ( not ( = ?auto_878966 ?auto_878974 ) ) ( not ( = ?auto_878966 ?auto_878975 ) ) ( not ( = ?auto_878967 ?auto_878968 ) ) ( not ( = ?auto_878967 ?auto_878969 ) ) ( not ( = ?auto_878967 ?auto_878970 ) ) ( not ( = ?auto_878967 ?auto_878971 ) ) ( not ( = ?auto_878967 ?auto_878972 ) ) ( not ( = ?auto_878967 ?auto_878973 ) ) ( not ( = ?auto_878967 ?auto_878974 ) ) ( not ( = ?auto_878967 ?auto_878975 ) ) ( not ( = ?auto_878968 ?auto_878969 ) ) ( not ( = ?auto_878968 ?auto_878970 ) ) ( not ( = ?auto_878968 ?auto_878971 ) ) ( not ( = ?auto_878968 ?auto_878972 ) ) ( not ( = ?auto_878968 ?auto_878973 ) ) ( not ( = ?auto_878968 ?auto_878974 ) ) ( not ( = ?auto_878968 ?auto_878975 ) ) ( not ( = ?auto_878969 ?auto_878970 ) ) ( not ( = ?auto_878969 ?auto_878971 ) ) ( not ( = ?auto_878969 ?auto_878972 ) ) ( not ( = ?auto_878969 ?auto_878973 ) ) ( not ( = ?auto_878969 ?auto_878974 ) ) ( not ( = ?auto_878969 ?auto_878975 ) ) ( not ( = ?auto_878970 ?auto_878971 ) ) ( not ( = ?auto_878970 ?auto_878972 ) ) ( not ( = ?auto_878970 ?auto_878973 ) ) ( not ( = ?auto_878970 ?auto_878974 ) ) ( not ( = ?auto_878970 ?auto_878975 ) ) ( not ( = ?auto_878971 ?auto_878972 ) ) ( not ( = ?auto_878971 ?auto_878973 ) ) ( not ( = ?auto_878971 ?auto_878974 ) ) ( not ( = ?auto_878971 ?auto_878975 ) ) ( not ( = ?auto_878972 ?auto_878973 ) ) ( not ( = ?auto_878972 ?auto_878974 ) ) ( not ( = ?auto_878972 ?auto_878975 ) ) ( not ( = ?auto_878973 ?auto_878974 ) ) ( not ( = ?auto_878973 ?auto_878975 ) ) ( not ( = ?auto_878974 ?auto_878975 ) ) ( ON ?auto_878973 ?auto_878974 ) ( ON ?auto_878972 ?auto_878973 ) ( ON ?auto_878971 ?auto_878972 ) ( ON ?auto_878970 ?auto_878971 ) ( ON ?auto_878969 ?auto_878970 ) ( ON ?auto_878968 ?auto_878969 ) ( ON ?auto_878967 ?auto_878968 ) ( ON ?auto_878966 ?auto_878967 ) ( ON ?auto_878965 ?auto_878966 ) ( ON ?auto_878964 ?auto_878965 ) ( ON ?auto_878963 ?auto_878964 ) ( ON ?auto_878962 ?auto_878963 ) ( ON ?auto_878961 ?auto_878962 ) ( ON ?auto_878960 ?auto_878961 ) ( CLEAR ?auto_878958 ) ( ON ?auto_878959 ?auto_878960 ) ( CLEAR ?auto_878959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_878958 ?auto_878959 )
      ( MAKE-17PILE ?auto_878958 ?auto_878959 ?auto_878960 ?auto_878961 ?auto_878962 ?auto_878963 ?auto_878964 ?auto_878965 ?auto_878966 ?auto_878967 ?auto_878968 ?auto_878969 ?auto_878970 ?auto_878971 ?auto_878972 ?auto_878973 ?auto_878974 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_879028 - BLOCK
      ?auto_879029 - BLOCK
      ?auto_879030 - BLOCK
      ?auto_879031 - BLOCK
      ?auto_879032 - BLOCK
      ?auto_879033 - BLOCK
      ?auto_879034 - BLOCK
      ?auto_879035 - BLOCK
      ?auto_879036 - BLOCK
      ?auto_879037 - BLOCK
      ?auto_879038 - BLOCK
      ?auto_879039 - BLOCK
      ?auto_879040 - BLOCK
      ?auto_879041 - BLOCK
      ?auto_879042 - BLOCK
      ?auto_879043 - BLOCK
      ?auto_879044 - BLOCK
    )
    :vars
    (
      ?auto_879045 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_879044 ?auto_879045 ) ( not ( = ?auto_879028 ?auto_879029 ) ) ( not ( = ?auto_879028 ?auto_879030 ) ) ( not ( = ?auto_879028 ?auto_879031 ) ) ( not ( = ?auto_879028 ?auto_879032 ) ) ( not ( = ?auto_879028 ?auto_879033 ) ) ( not ( = ?auto_879028 ?auto_879034 ) ) ( not ( = ?auto_879028 ?auto_879035 ) ) ( not ( = ?auto_879028 ?auto_879036 ) ) ( not ( = ?auto_879028 ?auto_879037 ) ) ( not ( = ?auto_879028 ?auto_879038 ) ) ( not ( = ?auto_879028 ?auto_879039 ) ) ( not ( = ?auto_879028 ?auto_879040 ) ) ( not ( = ?auto_879028 ?auto_879041 ) ) ( not ( = ?auto_879028 ?auto_879042 ) ) ( not ( = ?auto_879028 ?auto_879043 ) ) ( not ( = ?auto_879028 ?auto_879044 ) ) ( not ( = ?auto_879028 ?auto_879045 ) ) ( not ( = ?auto_879029 ?auto_879030 ) ) ( not ( = ?auto_879029 ?auto_879031 ) ) ( not ( = ?auto_879029 ?auto_879032 ) ) ( not ( = ?auto_879029 ?auto_879033 ) ) ( not ( = ?auto_879029 ?auto_879034 ) ) ( not ( = ?auto_879029 ?auto_879035 ) ) ( not ( = ?auto_879029 ?auto_879036 ) ) ( not ( = ?auto_879029 ?auto_879037 ) ) ( not ( = ?auto_879029 ?auto_879038 ) ) ( not ( = ?auto_879029 ?auto_879039 ) ) ( not ( = ?auto_879029 ?auto_879040 ) ) ( not ( = ?auto_879029 ?auto_879041 ) ) ( not ( = ?auto_879029 ?auto_879042 ) ) ( not ( = ?auto_879029 ?auto_879043 ) ) ( not ( = ?auto_879029 ?auto_879044 ) ) ( not ( = ?auto_879029 ?auto_879045 ) ) ( not ( = ?auto_879030 ?auto_879031 ) ) ( not ( = ?auto_879030 ?auto_879032 ) ) ( not ( = ?auto_879030 ?auto_879033 ) ) ( not ( = ?auto_879030 ?auto_879034 ) ) ( not ( = ?auto_879030 ?auto_879035 ) ) ( not ( = ?auto_879030 ?auto_879036 ) ) ( not ( = ?auto_879030 ?auto_879037 ) ) ( not ( = ?auto_879030 ?auto_879038 ) ) ( not ( = ?auto_879030 ?auto_879039 ) ) ( not ( = ?auto_879030 ?auto_879040 ) ) ( not ( = ?auto_879030 ?auto_879041 ) ) ( not ( = ?auto_879030 ?auto_879042 ) ) ( not ( = ?auto_879030 ?auto_879043 ) ) ( not ( = ?auto_879030 ?auto_879044 ) ) ( not ( = ?auto_879030 ?auto_879045 ) ) ( not ( = ?auto_879031 ?auto_879032 ) ) ( not ( = ?auto_879031 ?auto_879033 ) ) ( not ( = ?auto_879031 ?auto_879034 ) ) ( not ( = ?auto_879031 ?auto_879035 ) ) ( not ( = ?auto_879031 ?auto_879036 ) ) ( not ( = ?auto_879031 ?auto_879037 ) ) ( not ( = ?auto_879031 ?auto_879038 ) ) ( not ( = ?auto_879031 ?auto_879039 ) ) ( not ( = ?auto_879031 ?auto_879040 ) ) ( not ( = ?auto_879031 ?auto_879041 ) ) ( not ( = ?auto_879031 ?auto_879042 ) ) ( not ( = ?auto_879031 ?auto_879043 ) ) ( not ( = ?auto_879031 ?auto_879044 ) ) ( not ( = ?auto_879031 ?auto_879045 ) ) ( not ( = ?auto_879032 ?auto_879033 ) ) ( not ( = ?auto_879032 ?auto_879034 ) ) ( not ( = ?auto_879032 ?auto_879035 ) ) ( not ( = ?auto_879032 ?auto_879036 ) ) ( not ( = ?auto_879032 ?auto_879037 ) ) ( not ( = ?auto_879032 ?auto_879038 ) ) ( not ( = ?auto_879032 ?auto_879039 ) ) ( not ( = ?auto_879032 ?auto_879040 ) ) ( not ( = ?auto_879032 ?auto_879041 ) ) ( not ( = ?auto_879032 ?auto_879042 ) ) ( not ( = ?auto_879032 ?auto_879043 ) ) ( not ( = ?auto_879032 ?auto_879044 ) ) ( not ( = ?auto_879032 ?auto_879045 ) ) ( not ( = ?auto_879033 ?auto_879034 ) ) ( not ( = ?auto_879033 ?auto_879035 ) ) ( not ( = ?auto_879033 ?auto_879036 ) ) ( not ( = ?auto_879033 ?auto_879037 ) ) ( not ( = ?auto_879033 ?auto_879038 ) ) ( not ( = ?auto_879033 ?auto_879039 ) ) ( not ( = ?auto_879033 ?auto_879040 ) ) ( not ( = ?auto_879033 ?auto_879041 ) ) ( not ( = ?auto_879033 ?auto_879042 ) ) ( not ( = ?auto_879033 ?auto_879043 ) ) ( not ( = ?auto_879033 ?auto_879044 ) ) ( not ( = ?auto_879033 ?auto_879045 ) ) ( not ( = ?auto_879034 ?auto_879035 ) ) ( not ( = ?auto_879034 ?auto_879036 ) ) ( not ( = ?auto_879034 ?auto_879037 ) ) ( not ( = ?auto_879034 ?auto_879038 ) ) ( not ( = ?auto_879034 ?auto_879039 ) ) ( not ( = ?auto_879034 ?auto_879040 ) ) ( not ( = ?auto_879034 ?auto_879041 ) ) ( not ( = ?auto_879034 ?auto_879042 ) ) ( not ( = ?auto_879034 ?auto_879043 ) ) ( not ( = ?auto_879034 ?auto_879044 ) ) ( not ( = ?auto_879034 ?auto_879045 ) ) ( not ( = ?auto_879035 ?auto_879036 ) ) ( not ( = ?auto_879035 ?auto_879037 ) ) ( not ( = ?auto_879035 ?auto_879038 ) ) ( not ( = ?auto_879035 ?auto_879039 ) ) ( not ( = ?auto_879035 ?auto_879040 ) ) ( not ( = ?auto_879035 ?auto_879041 ) ) ( not ( = ?auto_879035 ?auto_879042 ) ) ( not ( = ?auto_879035 ?auto_879043 ) ) ( not ( = ?auto_879035 ?auto_879044 ) ) ( not ( = ?auto_879035 ?auto_879045 ) ) ( not ( = ?auto_879036 ?auto_879037 ) ) ( not ( = ?auto_879036 ?auto_879038 ) ) ( not ( = ?auto_879036 ?auto_879039 ) ) ( not ( = ?auto_879036 ?auto_879040 ) ) ( not ( = ?auto_879036 ?auto_879041 ) ) ( not ( = ?auto_879036 ?auto_879042 ) ) ( not ( = ?auto_879036 ?auto_879043 ) ) ( not ( = ?auto_879036 ?auto_879044 ) ) ( not ( = ?auto_879036 ?auto_879045 ) ) ( not ( = ?auto_879037 ?auto_879038 ) ) ( not ( = ?auto_879037 ?auto_879039 ) ) ( not ( = ?auto_879037 ?auto_879040 ) ) ( not ( = ?auto_879037 ?auto_879041 ) ) ( not ( = ?auto_879037 ?auto_879042 ) ) ( not ( = ?auto_879037 ?auto_879043 ) ) ( not ( = ?auto_879037 ?auto_879044 ) ) ( not ( = ?auto_879037 ?auto_879045 ) ) ( not ( = ?auto_879038 ?auto_879039 ) ) ( not ( = ?auto_879038 ?auto_879040 ) ) ( not ( = ?auto_879038 ?auto_879041 ) ) ( not ( = ?auto_879038 ?auto_879042 ) ) ( not ( = ?auto_879038 ?auto_879043 ) ) ( not ( = ?auto_879038 ?auto_879044 ) ) ( not ( = ?auto_879038 ?auto_879045 ) ) ( not ( = ?auto_879039 ?auto_879040 ) ) ( not ( = ?auto_879039 ?auto_879041 ) ) ( not ( = ?auto_879039 ?auto_879042 ) ) ( not ( = ?auto_879039 ?auto_879043 ) ) ( not ( = ?auto_879039 ?auto_879044 ) ) ( not ( = ?auto_879039 ?auto_879045 ) ) ( not ( = ?auto_879040 ?auto_879041 ) ) ( not ( = ?auto_879040 ?auto_879042 ) ) ( not ( = ?auto_879040 ?auto_879043 ) ) ( not ( = ?auto_879040 ?auto_879044 ) ) ( not ( = ?auto_879040 ?auto_879045 ) ) ( not ( = ?auto_879041 ?auto_879042 ) ) ( not ( = ?auto_879041 ?auto_879043 ) ) ( not ( = ?auto_879041 ?auto_879044 ) ) ( not ( = ?auto_879041 ?auto_879045 ) ) ( not ( = ?auto_879042 ?auto_879043 ) ) ( not ( = ?auto_879042 ?auto_879044 ) ) ( not ( = ?auto_879042 ?auto_879045 ) ) ( not ( = ?auto_879043 ?auto_879044 ) ) ( not ( = ?auto_879043 ?auto_879045 ) ) ( not ( = ?auto_879044 ?auto_879045 ) ) ( ON ?auto_879043 ?auto_879044 ) ( ON ?auto_879042 ?auto_879043 ) ( ON ?auto_879041 ?auto_879042 ) ( ON ?auto_879040 ?auto_879041 ) ( ON ?auto_879039 ?auto_879040 ) ( ON ?auto_879038 ?auto_879039 ) ( ON ?auto_879037 ?auto_879038 ) ( ON ?auto_879036 ?auto_879037 ) ( ON ?auto_879035 ?auto_879036 ) ( ON ?auto_879034 ?auto_879035 ) ( ON ?auto_879033 ?auto_879034 ) ( ON ?auto_879032 ?auto_879033 ) ( ON ?auto_879031 ?auto_879032 ) ( ON ?auto_879030 ?auto_879031 ) ( ON ?auto_879029 ?auto_879030 ) ( ON ?auto_879028 ?auto_879029 ) ( CLEAR ?auto_879028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_879028 )
      ( MAKE-17PILE ?auto_879028 ?auto_879029 ?auto_879030 ?auto_879031 ?auto_879032 ?auto_879033 ?auto_879034 ?auto_879035 ?auto_879036 ?auto_879037 ?auto_879038 ?auto_879039 ?auto_879040 ?auto_879041 ?auto_879042 ?auto_879043 ?auto_879044 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_879099 - BLOCK
      ?auto_879100 - BLOCK
      ?auto_879101 - BLOCK
      ?auto_879102 - BLOCK
      ?auto_879103 - BLOCK
      ?auto_879104 - BLOCK
      ?auto_879105 - BLOCK
      ?auto_879106 - BLOCK
      ?auto_879107 - BLOCK
      ?auto_879108 - BLOCK
      ?auto_879109 - BLOCK
      ?auto_879110 - BLOCK
      ?auto_879111 - BLOCK
      ?auto_879112 - BLOCK
      ?auto_879113 - BLOCK
      ?auto_879114 - BLOCK
      ?auto_879115 - BLOCK
      ?auto_879116 - BLOCK
    )
    :vars
    (
      ?auto_879117 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_879115 ) ( ON ?auto_879116 ?auto_879117 ) ( CLEAR ?auto_879116 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_879099 ) ( ON ?auto_879100 ?auto_879099 ) ( ON ?auto_879101 ?auto_879100 ) ( ON ?auto_879102 ?auto_879101 ) ( ON ?auto_879103 ?auto_879102 ) ( ON ?auto_879104 ?auto_879103 ) ( ON ?auto_879105 ?auto_879104 ) ( ON ?auto_879106 ?auto_879105 ) ( ON ?auto_879107 ?auto_879106 ) ( ON ?auto_879108 ?auto_879107 ) ( ON ?auto_879109 ?auto_879108 ) ( ON ?auto_879110 ?auto_879109 ) ( ON ?auto_879111 ?auto_879110 ) ( ON ?auto_879112 ?auto_879111 ) ( ON ?auto_879113 ?auto_879112 ) ( ON ?auto_879114 ?auto_879113 ) ( ON ?auto_879115 ?auto_879114 ) ( not ( = ?auto_879099 ?auto_879100 ) ) ( not ( = ?auto_879099 ?auto_879101 ) ) ( not ( = ?auto_879099 ?auto_879102 ) ) ( not ( = ?auto_879099 ?auto_879103 ) ) ( not ( = ?auto_879099 ?auto_879104 ) ) ( not ( = ?auto_879099 ?auto_879105 ) ) ( not ( = ?auto_879099 ?auto_879106 ) ) ( not ( = ?auto_879099 ?auto_879107 ) ) ( not ( = ?auto_879099 ?auto_879108 ) ) ( not ( = ?auto_879099 ?auto_879109 ) ) ( not ( = ?auto_879099 ?auto_879110 ) ) ( not ( = ?auto_879099 ?auto_879111 ) ) ( not ( = ?auto_879099 ?auto_879112 ) ) ( not ( = ?auto_879099 ?auto_879113 ) ) ( not ( = ?auto_879099 ?auto_879114 ) ) ( not ( = ?auto_879099 ?auto_879115 ) ) ( not ( = ?auto_879099 ?auto_879116 ) ) ( not ( = ?auto_879099 ?auto_879117 ) ) ( not ( = ?auto_879100 ?auto_879101 ) ) ( not ( = ?auto_879100 ?auto_879102 ) ) ( not ( = ?auto_879100 ?auto_879103 ) ) ( not ( = ?auto_879100 ?auto_879104 ) ) ( not ( = ?auto_879100 ?auto_879105 ) ) ( not ( = ?auto_879100 ?auto_879106 ) ) ( not ( = ?auto_879100 ?auto_879107 ) ) ( not ( = ?auto_879100 ?auto_879108 ) ) ( not ( = ?auto_879100 ?auto_879109 ) ) ( not ( = ?auto_879100 ?auto_879110 ) ) ( not ( = ?auto_879100 ?auto_879111 ) ) ( not ( = ?auto_879100 ?auto_879112 ) ) ( not ( = ?auto_879100 ?auto_879113 ) ) ( not ( = ?auto_879100 ?auto_879114 ) ) ( not ( = ?auto_879100 ?auto_879115 ) ) ( not ( = ?auto_879100 ?auto_879116 ) ) ( not ( = ?auto_879100 ?auto_879117 ) ) ( not ( = ?auto_879101 ?auto_879102 ) ) ( not ( = ?auto_879101 ?auto_879103 ) ) ( not ( = ?auto_879101 ?auto_879104 ) ) ( not ( = ?auto_879101 ?auto_879105 ) ) ( not ( = ?auto_879101 ?auto_879106 ) ) ( not ( = ?auto_879101 ?auto_879107 ) ) ( not ( = ?auto_879101 ?auto_879108 ) ) ( not ( = ?auto_879101 ?auto_879109 ) ) ( not ( = ?auto_879101 ?auto_879110 ) ) ( not ( = ?auto_879101 ?auto_879111 ) ) ( not ( = ?auto_879101 ?auto_879112 ) ) ( not ( = ?auto_879101 ?auto_879113 ) ) ( not ( = ?auto_879101 ?auto_879114 ) ) ( not ( = ?auto_879101 ?auto_879115 ) ) ( not ( = ?auto_879101 ?auto_879116 ) ) ( not ( = ?auto_879101 ?auto_879117 ) ) ( not ( = ?auto_879102 ?auto_879103 ) ) ( not ( = ?auto_879102 ?auto_879104 ) ) ( not ( = ?auto_879102 ?auto_879105 ) ) ( not ( = ?auto_879102 ?auto_879106 ) ) ( not ( = ?auto_879102 ?auto_879107 ) ) ( not ( = ?auto_879102 ?auto_879108 ) ) ( not ( = ?auto_879102 ?auto_879109 ) ) ( not ( = ?auto_879102 ?auto_879110 ) ) ( not ( = ?auto_879102 ?auto_879111 ) ) ( not ( = ?auto_879102 ?auto_879112 ) ) ( not ( = ?auto_879102 ?auto_879113 ) ) ( not ( = ?auto_879102 ?auto_879114 ) ) ( not ( = ?auto_879102 ?auto_879115 ) ) ( not ( = ?auto_879102 ?auto_879116 ) ) ( not ( = ?auto_879102 ?auto_879117 ) ) ( not ( = ?auto_879103 ?auto_879104 ) ) ( not ( = ?auto_879103 ?auto_879105 ) ) ( not ( = ?auto_879103 ?auto_879106 ) ) ( not ( = ?auto_879103 ?auto_879107 ) ) ( not ( = ?auto_879103 ?auto_879108 ) ) ( not ( = ?auto_879103 ?auto_879109 ) ) ( not ( = ?auto_879103 ?auto_879110 ) ) ( not ( = ?auto_879103 ?auto_879111 ) ) ( not ( = ?auto_879103 ?auto_879112 ) ) ( not ( = ?auto_879103 ?auto_879113 ) ) ( not ( = ?auto_879103 ?auto_879114 ) ) ( not ( = ?auto_879103 ?auto_879115 ) ) ( not ( = ?auto_879103 ?auto_879116 ) ) ( not ( = ?auto_879103 ?auto_879117 ) ) ( not ( = ?auto_879104 ?auto_879105 ) ) ( not ( = ?auto_879104 ?auto_879106 ) ) ( not ( = ?auto_879104 ?auto_879107 ) ) ( not ( = ?auto_879104 ?auto_879108 ) ) ( not ( = ?auto_879104 ?auto_879109 ) ) ( not ( = ?auto_879104 ?auto_879110 ) ) ( not ( = ?auto_879104 ?auto_879111 ) ) ( not ( = ?auto_879104 ?auto_879112 ) ) ( not ( = ?auto_879104 ?auto_879113 ) ) ( not ( = ?auto_879104 ?auto_879114 ) ) ( not ( = ?auto_879104 ?auto_879115 ) ) ( not ( = ?auto_879104 ?auto_879116 ) ) ( not ( = ?auto_879104 ?auto_879117 ) ) ( not ( = ?auto_879105 ?auto_879106 ) ) ( not ( = ?auto_879105 ?auto_879107 ) ) ( not ( = ?auto_879105 ?auto_879108 ) ) ( not ( = ?auto_879105 ?auto_879109 ) ) ( not ( = ?auto_879105 ?auto_879110 ) ) ( not ( = ?auto_879105 ?auto_879111 ) ) ( not ( = ?auto_879105 ?auto_879112 ) ) ( not ( = ?auto_879105 ?auto_879113 ) ) ( not ( = ?auto_879105 ?auto_879114 ) ) ( not ( = ?auto_879105 ?auto_879115 ) ) ( not ( = ?auto_879105 ?auto_879116 ) ) ( not ( = ?auto_879105 ?auto_879117 ) ) ( not ( = ?auto_879106 ?auto_879107 ) ) ( not ( = ?auto_879106 ?auto_879108 ) ) ( not ( = ?auto_879106 ?auto_879109 ) ) ( not ( = ?auto_879106 ?auto_879110 ) ) ( not ( = ?auto_879106 ?auto_879111 ) ) ( not ( = ?auto_879106 ?auto_879112 ) ) ( not ( = ?auto_879106 ?auto_879113 ) ) ( not ( = ?auto_879106 ?auto_879114 ) ) ( not ( = ?auto_879106 ?auto_879115 ) ) ( not ( = ?auto_879106 ?auto_879116 ) ) ( not ( = ?auto_879106 ?auto_879117 ) ) ( not ( = ?auto_879107 ?auto_879108 ) ) ( not ( = ?auto_879107 ?auto_879109 ) ) ( not ( = ?auto_879107 ?auto_879110 ) ) ( not ( = ?auto_879107 ?auto_879111 ) ) ( not ( = ?auto_879107 ?auto_879112 ) ) ( not ( = ?auto_879107 ?auto_879113 ) ) ( not ( = ?auto_879107 ?auto_879114 ) ) ( not ( = ?auto_879107 ?auto_879115 ) ) ( not ( = ?auto_879107 ?auto_879116 ) ) ( not ( = ?auto_879107 ?auto_879117 ) ) ( not ( = ?auto_879108 ?auto_879109 ) ) ( not ( = ?auto_879108 ?auto_879110 ) ) ( not ( = ?auto_879108 ?auto_879111 ) ) ( not ( = ?auto_879108 ?auto_879112 ) ) ( not ( = ?auto_879108 ?auto_879113 ) ) ( not ( = ?auto_879108 ?auto_879114 ) ) ( not ( = ?auto_879108 ?auto_879115 ) ) ( not ( = ?auto_879108 ?auto_879116 ) ) ( not ( = ?auto_879108 ?auto_879117 ) ) ( not ( = ?auto_879109 ?auto_879110 ) ) ( not ( = ?auto_879109 ?auto_879111 ) ) ( not ( = ?auto_879109 ?auto_879112 ) ) ( not ( = ?auto_879109 ?auto_879113 ) ) ( not ( = ?auto_879109 ?auto_879114 ) ) ( not ( = ?auto_879109 ?auto_879115 ) ) ( not ( = ?auto_879109 ?auto_879116 ) ) ( not ( = ?auto_879109 ?auto_879117 ) ) ( not ( = ?auto_879110 ?auto_879111 ) ) ( not ( = ?auto_879110 ?auto_879112 ) ) ( not ( = ?auto_879110 ?auto_879113 ) ) ( not ( = ?auto_879110 ?auto_879114 ) ) ( not ( = ?auto_879110 ?auto_879115 ) ) ( not ( = ?auto_879110 ?auto_879116 ) ) ( not ( = ?auto_879110 ?auto_879117 ) ) ( not ( = ?auto_879111 ?auto_879112 ) ) ( not ( = ?auto_879111 ?auto_879113 ) ) ( not ( = ?auto_879111 ?auto_879114 ) ) ( not ( = ?auto_879111 ?auto_879115 ) ) ( not ( = ?auto_879111 ?auto_879116 ) ) ( not ( = ?auto_879111 ?auto_879117 ) ) ( not ( = ?auto_879112 ?auto_879113 ) ) ( not ( = ?auto_879112 ?auto_879114 ) ) ( not ( = ?auto_879112 ?auto_879115 ) ) ( not ( = ?auto_879112 ?auto_879116 ) ) ( not ( = ?auto_879112 ?auto_879117 ) ) ( not ( = ?auto_879113 ?auto_879114 ) ) ( not ( = ?auto_879113 ?auto_879115 ) ) ( not ( = ?auto_879113 ?auto_879116 ) ) ( not ( = ?auto_879113 ?auto_879117 ) ) ( not ( = ?auto_879114 ?auto_879115 ) ) ( not ( = ?auto_879114 ?auto_879116 ) ) ( not ( = ?auto_879114 ?auto_879117 ) ) ( not ( = ?auto_879115 ?auto_879116 ) ) ( not ( = ?auto_879115 ?auto_879117 ) ) ( not ( = ?auto_879116 ?auto_879117 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_879116 ?auto_879117 )
      ( !STACK ?auto_879116 ?auto_879115 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_879136 - BLOCK
      ?auto_879137 - BLOCK
      ?auto_879138 - BLOCK
      ?auto_879139 - BLOCK
      ?auto_879140 - BLOCK
      ?auto_879141 - BLOCK
      ?auto_879142 - BLOCK
      ?auto_879143 - BLOCK
      ?auto_879144 - BLOCK
      ?auto_879145 - BLOCK
      ?auto_879146 - BLOCK
      ?auto_879147 - BLOCK
      ?auto_879148 - BLOCK
      ?auto_879149 - BLOCK
      ?auto_879150 - BLOCK
      ?auto_879151 - BLOCK
      ?auto_879152 - BLOCK
      ?auto_879153 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_879152 ) ( ON-TABLE ?auto_879153 ) ( CLEAR ?auto_879153 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_879136 ) ( ON ?auto_879137 ?auto_879136 ) ( ON ?auto_879138 ?auto_879137 ) ( ON ?auto_879139 ?auto_879138 ) ( ON ?auto_879140 ?auto_879139 ) ( ON ?auto_879141 ?auto_879140 ) ( ON ?auto_879142 ?auto_879141 ) ( ON ?auto_879143 ?auto_879142 ) ( ON ?auto_879144 ?auto_879143 ) ( ON ?auto_879145 ?auto_879144 ) ( ON ?auto_879146 ?auto_879145 ) ( ON ?auto_879147 ?auto_879146 ) ( ON ?auto_879148 ?auto_879147 ) ( ON ?auto_879149 ?auto_879148 ) ( ON ?auto_879150 ?auto_879149 ) ( ON ?auto_879151 ?auto_879150 ) ( ON ?auto_879152 ?auto_879151 ) ( not ( = ?auto_879136 ?auto_879137 ) ) ( not ( = ?auto_879136 ?auto_879138 ) ) ( not ( = ?auto_879136 ?auto_879139 ) ) ( not ( = ?auto_879136 ?auto_879140 ) ) ( not ( = ?auto_879136 ?auto_879141 ) ) ( not ( = ?auto_879136 ?auto_879142 ) ) ( not ( = ?auto_879136 ?auto_879143 ) ) ( not ( = ?auto_879136 ?auto_879144 ) ) ( not ( = ?auto_879136 ?auto_879145 ) ) ( not ( = ?auto_879136 ?auto_879146 ) ) ( not ( = ?auto_879136 ?auto_879147 ) ) ( not ( = ?auto_879136 ?auto_879148 ) ) ( not ( = ?auto_879136 ?auto_879149 ) ) ( not ( = ?auto_879136 ?auto_879150 ) ) ( not ( = ?auto_879136 ?auto_879151 ) ) ( not ( = ?auto_879136 ?auto_879152 ) ) ( not ( = ?auto_879136 ?auto_879153 ) ) ( not ( = ?auto_879137 ?auto_879138 ) ) ( not ( = ?auto_879137 ?auto_879139 ) ) ( not ( = ?auto_879137 ?auto_879140 ) ) ( not ( = ?auto_879137 ?auto_879141 ) ) ( not ( = ?auto_879137 ?auto_879142 ) ) ( not ( = ?auto_879137 ?auto_879143 ) ) ( not ( = ?auto_879137 ?auto_879144 ) ) ( not ( = ?auto_879137 ?auto_879145 ) ) ( not ( = ?auto_879137 ?auto_879146 ) ) ( not ( = ?auto_879137 ?auto_879147 ) ) ( not ( = ?auto_879137 ?auto_879148 ) ) ( not ( = ?auto_879137 ?auto_879149 ) ) ( not ( = ?auto_879137 ?auto_879150 ) ) ( not ( = ?auto_879137 ?auto_879151 ) ) ( not ( = ?auto_879137 ?auto_879152 ) ) ( not ( = ?auto_879137 ?auto_879153 ) ) ( not ( = ?auto_879138 ?auto_879139 ) ) ( not ( = ?auto_879138 ?auto_879140 ) ) ( not ( = ?auto_879138 ?auto_879141 ) ) ( not ( = ?auto_879138 ?auto_879142 ) ) ( not ( = ?auto_879138 ?auto_879143 ) ) ( not ( = ?auto_879138 ?auto_879144 ) ) ( not ( = ?auto_879138 ?auto_879145 ) ) ( not ( = ?auto_879138 ?auto_879146 ) ) ( not ( = ?auto_879138 ?auto_879147 ) ) ( not ( = ?auto_879138 ?auto_879148 ) ) ( not ( = ?auto_879138 ?auto_879149 ) ) ( not ( = ?auto_879138 ?auto_879150 ) ) ( not ( = ?auto_879138 ?auto_879151 ) ) ( not ( = ?auto_879138 ?auto_879152 ) ) ( not ( = ?auto_879138 ?auto_879153 ) ) ( not ( = ?auto_879139 ?auto_879140 ) ) ( not ( = ?auto_879139 ?auto_879141 ) ) ( not ( = ?auto_879139 ?auto_879142 ) ) ( not ( = ?auto_879139 ?auto_879143 ) ) ( not ( = ?auto_879139 ?auto_879144 ) ) ( not ( = ?auto_879139 ?auto_879145 ) ) ( not ( = ?auto_879139 ?auto_879146 ) ) ( not ( = ?auto_879139 ?auto_879147 ) ) ( not ( = ?auto_879139 ?auto_879148 ) ) ( not ( = ?auto_879139 ?auto_879149 ) ) ( not ( = ?auto_879139 ?auto_879150 ) ) ( not ( = ?auto_879139 ?auto_879151 ) ) ( not ( = ?auto_879139 ?auto_879152 ) ) ( not ( = ?auto_879139 ?auto_879153 ) ) ( not ( = ?auto_879140 ?auto_879141 ) ) ( not ( = ?auto_879140 ?auto_879142 ) ) ( not ( = ?auto_879140 ?auto_879143 ) ) ( not ( = ?auto_879140 ?auto_879144 ) ) ( not ( = ?auto_879140 ?auto_879145 ) ) ( not ( = ?auto_879140 ?auto_879146 ) ) ( not ( = ?auto_879140 ?auto_879147 ) ) ( not ( = ?auto_879140 ?auto_879148 ) ) ( not ( = ?auto_879140 ?auto_879149 ) ) ( not ( = ?auto_879140 ?auto_879150 ) ) ( not ( = ?auto_879140 ?auto_879151 ) ) ( not ( = ?auto_879140 ?auto_879152 ) ) ( not ( = ?auto_879140 ?auto_879153 ) ) ( not ( = ?auto_879141 ?auto_879142 ) ) ( not ( = ?auto_879141 ?auto_879143 ) ) ( not ( = ?auto_879141 ?auto_879144 ) ) ( not ( = ?auto_879141 ?auto_879145 ) ) ( not ( = ?auto_879141 ?auto_879146 ) ) ( not ( = ?auto_879141 ?auto_879147 ) ) ( not ( = ?auto_879141 ?auto_879148 ) ) ( not ( = ?auto_879141 ?auto_879149 ) ) ( not ( = ?auto_879141 ?auto_879150 ) ) ( not ( = ?auto_879141 ?auto_879151 ) ) ( not ( = ?auto_879141 ?auto_879152 ) ) ( not ( = ?auto_879141 ?auto_879153 ) ) ( not ( = ?auto_879142 ?auto_879143 ) ) ( not ( = ?auto_879142 ?auto_879144 ) ) ( not ( = ?auto_879142 ?auto_879145 ) ) ( not ( = ?auto_879142 ?auto_879146 ) ) ( not ( = ?auto_879142 ?auto_879147 ) ) ( not ( = ?auto_879142 ?auto_879148 ) ) ( not ( = ?auto_879142 ?auto_879149 ) ) ( not ( = ?auto_879142 ?auto_879150 ) ) ( not ( = ?auto_879142 ?auto_879151 ) ) ( not ( = ?auto_879142 ?auto_879152 ) ) ( not ( = ?auto_879142 ?auto_879153 ) ) ( not ( = ?auto_879143 ?auto_879144 ) ) ( not ( = ?auto_879143 ?auto_879145 ) ) ( not ( = ?auto_879143 ?auto_879146 ) ) ( not ( = ?auto_879143 ?auto_879147 ) ) ( not ( = ?auto_879143 ?auto_879148 ) ) ( not ( = ?auto_879143 ?auto_879149 ) ) ( not ( = ?auto_879143 ?auto_879150 ) ) ( not ( = ?auto_879143 ?auto_879151 ) ) ( not ( = ?auto_879143 ?auto_879152 ) ) ( not ( = ?auto_879143 ?auto_879153 ) ) ( not ( = ?auto_879144 ?auto_879145 ) ) ( not ( = ?auto_879144 ?auto_879146 ) ) ( not ( = ?auto_879144 ?auto_879147 ) ) ( not ( = ?auto_879144 ?auto_879148 ) ) ( not ( = ?auto_879144 ?auto_879149 ) ) ( not ( = ?auto_879144 ?auto_879150 ) ) ( not ( = ?auto_879144 ?auto_879151 ) ) ( not ( = ?auto_879144 ?auto_879152 ) ) ( not ( = ?auto_879144 ?auto_879153 ) ) ( not ( = ?auto_879145 ?auto_879146 ) ) ( not ( = ?auto_879145 ?auto_879147 ) ) ( not ( = ?auto_879145 ?auto_879148 ) ) ( not ( = ?auto_879145 ?auto_879149 ) ) ( not ( = ?auto_879145 ?auto_879150 ) ) ( not ( = ?auto_879145 ?auto_879151 ) ) ( not ( = ?auto_879145 ?auto_879152 ) ) ( not ( = ?auto_879145 ?auto_879153 ) ) ( not ( = ?auto_879146 ?auto_879147 ) ) ( not ( = ?auto_879146 ?auto_879148 ) ) ( not ( = ?auto_879146 ?auto_879149 ) ) ( not ( = ?auto_879146 ?auto_879150 ) ) ( not ( = ?auto_879146 ?auto_879151 ) ) ( not ( = ?auto_879146 ?auto_879152 ) ) ( not ( = ?auto_879146 ?auto_879153 ) ) ( not ( = ?auto_879147 ?auto_879148 ) ) ( not ( = ?auto_879147 ?auto_879149 ) ) ( not ( = ?auto_879147 ?auto_879150 ) ) ( not ( = ?auto_879147 ?auto_879151 ) ) ( not ( = ?auto_879147 ?auto_879152 ) ) ( not ( = ?auto_879147 ?auto_879153 ) ) ( not ( = ?auto_879148 ?auto_879149 ) ) ( not ( = ?auto_879148 ?auto_879150 ) ) ( not ( = ?auto_879148 ?auto_879151 ) ) ( not ( = ?auto_879148 ?auto_879152 ) ) ( not ( = ?auto_879148 ?auto_879153 ) ) ( not ( = ?auto_879149 ?auto_879150 ) ) ( not ( = ?auto_879149 ?auto_879151 ) ) ( not ( = ?auto_879149 ?auto_879152 ) ) ( not ( = ?auto_879149 ?auto_879153 ) ) ( not ( = ?auto_879150 ?auto_879151 ) ) ( not ( = ?auto_879150 ?auto_879152 ) ) ( not ( = ?auto_879150 ?auto_879153 ) ) ( not ( = ?auto_879151 ?auto_879152 ) ) ( not ( = ?auto_879151 ?auto_879153 ) ) ( not ( = ?auto_879152 ?auto_879153 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_879153 )
      ( !STACK ?auto_879153 ?auto_879152 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_879172 - BLOCK
      ?auto_879173 - BLOCK
      ?auto_879174 - BLOCK
      ?auto_879175 - BLOCK
      ?auto_879176 - BLOCK
      ?auto_879177 - BLOCK
      ?auto_879178 - BLOCK
      ?auto_879179 - BLOCK
      ?auto_879180 - BLOCK
      ?auto_879181 - BLOCK
      ?auto_879182 - BLOCK
      ?auto_879183 - BLOCK
      ?auto_879184 - BLOCK
      ?auto_879185 - BLOCK
      ?auto_879186 - BLOCK
      ?auto_879187 - BLOCK
      ?auto_879188 - BLOCK
      ?auto_879189 - BLOCK
    )
    :vars
    (
      ?auto_879190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_879189 ?auto_879190 ) ( ON-TABLE ?auto_879172 ) ( ON ?auto_879173 ?auto_879172 ) ( ON ?auto_879174 ?auto_879173 ) ( ON ?auto_879175 ?auto_879174 ) ( ON ?auto_879176 ?auto_879175 ) ( ON ?auto_879177 ?auto_879176 ) ( ON ?auto_879178 ?auto_879177 ) ( ON ?auto_879179 ?auto_879178 ) ( ON ?auto_879180 ?auto_879179 ) ( ON ?auto_879181 ?auto_879180 ) ( ON ?auto_879182 ?auto_879181 ) ( ON ?auto_879183 ?auto_879182 ) ( ON ?auto_879184 ?auto_879183 ) ( ON ?auto_879185 ?auto_879184 ) ( ON ?auto_879186 ?auto_879185 ) ( ON ?auto_879187 ?auto_879186 ) ( not ( = ?auto_879172 ?auto_879173 ) ) ( not ( = ?auto_879172 ?auto_879174 ) ) ( not ( = ?auto_879172 ?auto_879175 ) ) ( not ( = ?auto_879172 ?auto_879176 ) ) ( not ( = ?auto_879172 ?auto_879177 ) ) ( not ( = ?auto_879172 ?auto_879178 ) ) ( not ( = ?auto_879172 ?auto_879179 ) ) ( not ( = ?auto_879172 ?auto_879180 ) ) ( not ( = ?auto_879172 ?auto_879181 ) ) ( not ( = ?auto_879172 ?auto_879182 ) ) ( not ( = ?auto_879172 ?auto_879183 ) ) ( not ( = ?auto_879172 ?auto_879184 ) ) ( not ( = ?auto_879172 ?auto_879185 ) ) ( not ( = ?auto_879172 ?auto_879186 ) ) ( not ( = ?auto_879172 ?auto_879187 ) ) ( not ( = ?auto_879172 ?auto_879188 ) ) ( not ( = ?auto_879172 ?auto_879189 ) ) ( not ( = ?auto_879172 ?auto_879190 ) ) ( not ( = ?auto_879173 ?auto_879174 ) ) ( not ( = ?auto_879173 ?auto_879175 ) ) ( not ( = ?auto_879173 ?auto_879176 ) ) ( not ( = ?auto_879173 ?auto_879177 ) ) ( not ( = ?auto_879173 ?auto_879178 ) ) ( not ( = ?auto_879173 ?auto_879179 ) ) ( not ( = ?auto_879173 ?auto_879180 ) ) ( not ( = ?auto_879173 ?auto_879181 ) ) ( not ( = ?auto_879173 ?auto_879182 ) ) ( not ( = ?auto_879173 ?auto_879183 ) ) ( not ( = ?auto_879173 ?auto_879184 ) ) ( not ( = ?auto_879173 ?auto_879185 ) ) ( not ( = ?auto_879173 ?auto_879186 ) ) ( not ( = ?auto_879173 ?auto_879187 ) ) ( not ( = ?auto_879173 ?auto_879188 ) ) ( not ( = ?auto_879173 ?auto_879189 ) ) ( not ( = ?auto_879173 ?auto_879190 ) ) ( not ( = ?auto_879174 ?auto_879175 ) ) ( not ( = ?auto_879174 ?auto_879176 ) ) ( not ( = ?auto_879174 ?auto_879177 ) ) ( not ( = ?auto_879174 ?auto_879178 ) ) ( not ( = ?auto_879174 ?auto_879179 ) ) ( not ( = ?auto_879174 ?auto_879180 ) ) ( not ( = ?auto_879174 ?auto_879181 ) ) ( not ( = ?auto_879174 ?auto_879182 ) ) ( not ( = ?auto_879174 ?auto_879183 ) ) ( not ( = ?auto_879174 ?auto_879184 ) ) ( not ( = ?auto_879174 ?auto_879185 ) ) ( not ( = ?auto_879174 ?auto_879186 ) ) ( not ( = ?auto_879174 ?auto_879187 ) ) ( not ( = ?auto_879174 ?auto_879188 ) ) ( not ( = ?auto_879174 ?auto_879189 ) ) ( not ( = ?auto_879174 ?auto_879190 ) ) ( not ( = ?auto_879175 ?auto_879176 ) ) ( not ( = ?auto_879175 ?auto_879177 ) ) ( not ( = ?auto_879175 ?auto_879178 ) ) ( not ( = ?auto_879175 ?auto_879179 ) ) ( not ( = ?auto_879175 ?auto_879180 ) ) ( not ( = ?auto_879175 ?auto_879181 ) ) ( not ( = ?auto_879175 ?auto_879182 ) ) ( not ( = ?auto_879175 ?auto_879183 ) ) ( not ( = ?auto_879175 ?auto_879184 ) ) ( not ( = ?auto_879175 ?auto_879185 ) ) ( not ( = ?auto_879175 ?auto_879186 ) ) ( not ( = ?auto_879175 ?auto_879187 ) ) ( not ( = ?auto_879175 ?auto_879188 ) ) ( not ( = ?auto_879175 ?auto_879189 ) ) ( not ( = ?auto_879175 ?auto_879190 ) ) ( not ( = ?auto_879176 ?auto_879177 ) ) ( not ( = ?auto_879176 ?auto_879178 ) ) ( not ( = ?auto_879176 ?auto_879179 ) ) ( not ( = ?auto_879176 ?auto_879180 ) ) ( not ( = ?auto_879176 ?auto_879181 ) ) ( not ( = ?auto_879176 ?auto_879182 ) ) ( not ( = ?auto_879176 ?auto_879183 ) ) ( not ( = ?auto_879176 ?auto_879184 ) ) ( not ( = ?auto_879176 ?auto_879185 ) ) ( not ( = ?auto_879176 ?auto_879186 ) ) ( not ( = ?auto_879176 ?auto_879187 ) ) ( not ( = ?auto_879176 ?auto_879188 ) ) ( not ( = ?auto_879176 ?auto_879189 ) ) ( not ( = ?auto_879176 ?auto_879190 ) ) ( not ( = ?auto_879177 ?auto_879178 ) ) ( not ( = ?auto_879177 ?auto_879179 ) ) ( not ( = ?auto_879177 ?auto_879180 ) ) ( not ( = ?auto_879177 ?auto_879181 ) ) ( not ( = ?auto_879177 ?auto_879182 ) ) ( not ( = ?auto_879177 ?auto_879183 ) ) ( not ( = ?auto_879177 ?auto_879184 ) ) ( not ( = ?auto_879177 ?auto_879185 ) ) ( not ( = ?auto_879177 ?auto_879186 ) ) ( not ( = ?auto_879177 ?auto_879187 ) ) ( not ( = ?auto_879177 ?auto_879188 ) ) ( not ( = ?auto_879177 ?auto_879189 ) ) ( not ( = ?auto_879177 ?auto_879190 ) ) ( not ( = ?auto_879178 ?auto_879179 ) ) ( not ( = ?auto_879178 ?auto_879180 ) ) ( not ( = ?auto_879178 ?auto_879181 ) ) ( not ( = ?auto_879178 ?auto_879182 ) ) ( not ( = ?auto_879178 ?auto_879183 ) ) ( not ( = ?auto_879178 ?auto_879184 ) ) ( not ( = ?auto_879178 ?auto_879185 ) ) ( not ( = ?auto_879178 ?auto_879186 ) ) ( not ( = ?auto_879178 ?auto_879187 ) ) ( not ( = ?auto_879178 ?auto_879188 ) ) ( not ( = ?auto_879178 ?auto_879189 ) ) ( not ( = ?auto_879178 ?auto_879190 ) ) ( not ( = ?auto_879179 ?auto_879180 ) ) ( not ( = ?auto_879179 ?auto_879181 ) ) ( not ( = ?auto_879179 ?auto_879182 ) ) ( not ( = ?auto_879179 ?auto_879183 ) ) ( not ( = ?auto_879179 ?auto_879184 ) ) ( not ( = ?auto_879179 ?auto_879185 ) ) ( not ( = ?auto_879179 ?auto_879186 ) ) ( not ( = ?auto_879179 ?auto_879187 ) ) ( not ( = ?auto_879179 ?auto_879188 ) ) ( not ( = ?auto_879179 ?auto_879189 ) ) ( not ( = ?auto_879179 ?auto_879190 ) ) ( not ( = ?auto_879180 ?auto_879181 ) ) ( not ( = ?auto_879180 ?auto_879182 ) ) ( not ( = ?auto_879180 ?auto_879183 ) ) ( not ( = ?auto_879180 ?auto_879184 ) ) ( not ( = ?auto_879180 ?auto_879185 ) ) ( not ( = ?auto_879180 ?auto_879186 ) ) ( not ( = ?auto_879180 ?auto_879187 ) ) ( not ( = ?auto_879180 ?auto_879188 ) ) ( not ( = ?auto_879180 ?auto_879189 ) ) ( not ( = ?auto_879180 ?auto_879190 ) ) ( not ( = ?auto_879181 ?auto_879182 ) ) ( not ( = ?auto_879181 ?auto_879183 ) ) ( not ( = ?auto_879181 ?auto_879184 ) ) ( not ( = ?auto_879181 ?auto_879185 ) ) ( not ( = ?auto_879181 ?auto_879186 ) ) ( not ( = ?auto_879181 ?auto_879187 ) ) ( not ( = ?auto_879181 ?auto_879188 ) ) ( not ( = ?auto_879181 ?auto_879189 ) ) ( not ( = ?auto_879181 ?auto_879190 ) ) ( not ( = ?auto_879182 ?auto_879183 ) ) ( not ( = ?auto_879182 ?auto_879184 ) ) ( not ( = ?auto_879182 ?auto_879185 ) ) ( not ( = ?auto_879182 ?auto_879186 ) ) ( not ( = ?auto_879182 ?auto_879187 ) ) ( not ( = ?auto_879182 ?auto_879188 ) ) ( not ( = ?auto_879182 ?auto_879189 ) ) ( not ( = ?auto_879182 ?auto_879190 ) ) ( not ( = ?auto_879183 ?auto_879184 ) ) ( not ( = ?auto_879183 ?auto_879185 ) ) ( not ( = ?auto_879183 ?auto_879186 ) ) ( not ( = ?auto_879183 ?auto_879187 ) ) ( not ( = ?auto_879183 ?auto_879188 ) ) ( not ( = ?auto_879183 ?auto_879189 ) ) ( not ( = ?auto_879183 ?auto_879190 ) ) ( not ( = ?auto_879184 ?auto_879185 ) ) ( not ( = ?auto_879184 ?auto_879186 ) ) ( not ( = ?auto_879184 ?auto_879187 ) ) ( not ( = ?auto_879184 ?auto_879188 ) ) ( not ( = ?auto_879184 ?auto_879189 ) ) ( not ( = ?auto_879184 ?auto_879190 ) ) ( not ( = ?auto_879185 ?auto_879186 ) ) ( not ( = ?auto_879185 ?auto_879187 ) ) ( not ( = ?auto_879185 ?auto_879188 ) ) ( not ( = ?auto_879185 ?auto_879189 ) ) ( not ( = ?auto_879185 ?auto_879190 ) ) ( not ( = ?auto_879186 ?auto_879187 ) ) ( not ( = ?auto_879186 ?auto_879188 ) ) ( not ( = ?auto_879186 ?auto_879189 ) ) ( not ( = ?auto_879186 ?auto_879190 ) ) ( not ( = ?auto_879187 ?auto_879188 ) ) ( not ( = ?auto_879187 ?auto_879189 ) ) ( not ( = ?auto_879187 ?auto_879190 ) ) ( not ( = ?auto_879188 ?auto_879189 ) ) ( not ( = ?auto_879188 ?auto_879190 ) ) ( not ( = ?auto_879189 ?auto_879190 ) ) ( CLEAR ?auto_879187 ) ( ON ?auto_879188 ?auto_879189 ) ( CLEAR ?auto_879188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_879172 ?auto_879173 ?auto_879174 ?auto_879175 ?auto_879176 ?auto_879177 ?auto_879178 ?auto_879179 ?auto_879180 ?auto_879181 ?auto_879182 ?auto_879183 ?auto_879184 ?auto_879185 ?auto_879186 ?auto_879187 ?auto_879188 )
      ( MAKE-18PILE ?auto_879172 ?auto_879173 ?auto_879174 ?auto_879175 ?auto_879176 ?auto_879177 ?auto_879178 ?auto_879179 ?auto_879180 ?auto_879181 ?auto_879182 ?auto_879183 ?auto_879184 ?auto_879185 ?auto_879186 ?auto_879187 ?auto_879188 ?auto_879189 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_879209 - BLOCK
      ?auto_879210 - BLOCK
      ?auto_879211 - BLOCK
      ?auto_879212 - BLOCK
      ?auto_879213 - BLOCK
      ?auto_879214 - BLOCK
      ?auto_879215 - BLOCK
      ?auto_879216 - BLOCK
      ?auto_879217 - BLOCK
      ?auto_879218 - BLOCK
      ?auto_879219 - BLOCK
      ?auto_879220 - BLOCK
      ?auto_879221 - BLOCK
      ?auto_879222 - BLOCK
      ?auto_879223 - BLOCK
      ?auto_879224 - BLOCK
      ?auto_879225 - BLOCK
      ?auto_879226 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_879226 ) ( ON-TABLE ?auto_879209 ) ( ON ?auto_879210 ?auto_879209 ) ( ON ?auto_879211 ?auto_879210 ) ( ON ?auto_879212 ?auto_879211 ) ( ON ?auto_879213 ?auto_879212 ) ( ON ?auto_879214 ?auto_879213 ) ( ON ?auto_879215 ?auto_879214 ) ( ON ?auto_879216 ?auto_879215 ) ( ON ?auto_879217 ?auto_879216 ) ( ON ?auto_879218 ?auto_879217 ) ( ON ?auto_879219 ?auto_879218 ) ( ON ?auto_879220 ?auto_879219 ) ( ON ?auto_879221 ?auto_879220 ) ( ON ?auto_879222 ?auto_879221 ) ( ON ?auto_879223 ?auto_879222 ) ( ON ?auto_879224 ?auto_879223 ) ( not ( = ?auto_879209 ?auto_879210 ) ) ( not ( = ?auto_879209 ?auto_879211 ) ) ( not ( = ?auto_879209 ?auto_879212 ) ) ( not ( = ?auto_879209 ?auto_879213 ) ) ( not ( = ?auto_879209 ?auto_879214 ) ) ( not ( = ?auto_879209 ?auto_879215 ) ) ( not ( = ?auto_879209 ?auto_879216 ) ) ( not ( = ?auto_879209 ?auto_879217 ) ) ( not ( = ?auto_879209 ?auto_879218 ) ) ( not ( = ?auto_879209 ?auto_879219 ) ) ( not ( = ?auto_879209 ?auto_879220 ) ) ( not ( = ?auto_879209 ?auto_879221 ) ) ( not ( = ?auto_879209 ?auto_879222 ) ) ( not ( = ?auto_879209 ?auto_879223 ) ) ( not ( = ?auto_879209 ?auto_879224 ) ) ( not ( = ?auto_879209 ?auto_879225 ) ) ( not ( = ?auto_879209 ?auto_879226 ) ) ( not ( = ?auto_879210 ?auto_879211 ) ) ( not ( = ?auto_879210 ?auto_879212 ) ) ( not ( = ?auto_879210 ?auto_879213 ) ) ( not ( = ?auto_879210 ?auto_879214 ) ) ( not ( = ?auto_879210 ?auto_879215 ) ) ( not ( = ?auto_879210 ?auto_879216 ) ) ( not ( = ?auto_879210 ?auto_879217 ) ) ( not ( = ?auto_879210 ?auto_879218 ) ) ( not ( = ?auto_879210 ?auto_879219 ) ) ( not ( = ?auto_879210 ?auto_879220 ) ) ( not ( = ?auto_879210 ?auto_879221 ) ) ( not ( = ?auto_879210 ?auto_879222 ) ) ( not ( = ?auto_879210 ?auto_879223 ) ) ( not ( = ?auto_879210 ?auto_879224 ) ) ( not ( = ?auto_879210 ?auto_879225 ) ) ( not ( = ?auto_879210 ?auto_879226 ) ) ( not ( = ?auto_879211 ?auto_879212 ) ) ( not ( = ?auto_879211 ?auto_879213 ) ) ( not ( = ?auto_879211 ?auto_879214 ) ) ( not ( = ?auto_879211 ?auto_879215 ) ) ( not ( = ?auto_879211 ?auto_879216 ) ) ( not ( = ?auto_879211 ?auto_879217 ) ) ( not ( = ?auto_879211 ?auto_879218 ) ) ( not ( = ?auto_879211 ?auto_879219 ) ) ( not ( = ?auto_879211 ?auto_879220 ) ) ( not ( = ?auto_879211 ?auto_879221 ) ) ( not ( = ?auto_879211 ?auto_879222 ) ) ( not ( = ?auto_879211 ?auto_879223 ) ) ( not ( = ?auto_879211 ?auto_879224 ) ) ( not ( = ?auto_879211 ?auto_879225 ) ) ( not ( = ?auto_879211 ?auto_879226 ) ) ( not ( = ?auto_879212 ?auto_879213 ) ) ( not ( = ?auto_879212 ?auto_879214 ) ) ( not ( = ?auto_879212 ?auto_879215 ) ) ( not ( = ?auto_879212 ?auto_879216 ) ) ( not ( = ?auto_879212 ?auto_879217 ) ) ( not ( = ?auto_879212 ?auto_879218 ) ) ( not ( = ?auto_879212 ?auto_879219 ) ) ( not ( = ?auto_879212 ?auto_879220 ) ) ( not ( = ?auto_879212 ?auto_879221 ) ) ( not ( = ?auto_879212 ?auto_879222 ) ) ( not ( = ?auto_879212 ?auto_879223 ) ) ( not ( = ?auto_879212 ?auto_879224 ) ) ( not ( = ?auto_879212 ?auto_879225 ) ) ( not ( = ?auto_879212 ?auto_879226 ) ) ( not ( = ?auto_879213 ?auto_879214 ) ) ( not ( = ?auto_879213 ?auto_879215 ) ) ( not ( = ?auto_879213 ?auto_879216 ) ) ( not ( = ?auto_879213 ?auto_879217 ) ) ( not ( = ?auto_879213 ?auto_879218 ) ) ( not ( = ?auto_879213 ?auto_879219 ) ) ( not ( = ?auto_879213 ?auto_879220 ) ) ( not ( = ?auto_879213 ?auto_879221 ) ) ( not ( = ?auto_879213 ?auto_879222 ) ) ( not ( = ?auto_879213 ?auto_879223 ) ) ( not ( = ?auto_879213 ?auto_879224 ) ) ( not ( = ?auto_879213 ?auto_879225 ) ) ( not ( = ?auto_879213 ?auto_879226 ) ) ( not ( = ?auto_879214 ?auto_879215 ) ) ( not ( = ?auto_879214 ?auto_879216 ) ) ( not ( = ?auto_879214 ?auto_879217 ) ) ( not ( = ?auto_879214 ?auto_879218 ) ) ( not ( = ?auto_879214 ?auto_879219 ) ) ( not ( = ?auto_879214 ?auto_879220 ) ) ( not ( = ?auto_879214 ?auto_879221 ) ) ( not ( = ?auto_879214 ?auto_879222 ) ) ( not ( = ?auto_879214 ?auto_879223 ) ) ( not ( = ?auto_879214 ?auto_879224 ) ) ( not ( = ?auto_879214 ?auto_879225 ) ) ( not ( = ?auto_879214 ?auto_879226 ) ) ( not ( = ?auto_879215 ?auto_879216 ) ) ( not ( = ?auto_879215 ?auto_879217 ) ) ( not ( = ?auto_879215 ?auto_879218 ) ) ( not ( = ?auto_879215 ?auto_879219 ) ) ( not ( = ?auto_879215 ?auto_879220 ) ) ( not ( = ?auto_879215 ?auto_879221 ) ) ( not ( = ?auto_879215 ?auto_879222 ) ) ( not ( = ?auto_879215 ?auto_879223 ) ) ( not ( = ?auto_879215 ?auto_879224 ) ) ( not ( = ?auto_879215 ?auto_879225 ) ) ( not ( = ?auto_879215 ?auto_879226 ) ) ( not ( = ?auto_879216 ?auto_879217 ) ) ( not ( = ?auto_879216 ?auto_879218 ) ) ( not ( = ?auto_879216 ?auto_879219 ) ) ( not ( = ?auto_879216 ?auto_879220 ) ) ( not ( = ?auto_879216 ?auto_879221 ) ) ( not ( = ?auto_879216 ?auto_879222 ) ) ( not ( = ?auto_879216 ?auto_879223 ) ) ( not ( = ?auto_879216 ?auto_879224 ) ) ( not ( = ?auto_879216 ?auto_879225 ) ) ( not ( = ?auto_879216 ?auto_879226 ) ) ( not ( = ?auto_879217 ?auto_879218 ) ) ( not ( = ?auto_879217 ?auto_879219 ) ) ( not ( = ?auto_879217 ?auto_879220 ) ) ( not ( = ?auto_879217 ?auto_879221 ) ) ( not ( = ?auto_879217 ?auto_879222 ) ) ( not ( = ?auto_879217 ?auto_879223 ) ) ( not ( = ?auto_879217 ?auto_879224 ) ) ( not ( = ?auto_879217 ?auto_879225 ) ) ( not ( = ?auto_879217 ?auto_879226 ) ) ( not ( = ?auto_879218 ?auto_879219 ) ) ( not ( = ?auto_879218 ?auto_879220 ) ) ( not ( = ?auto_879218 ?auto_879221 ) ) ( not ( = ?auto_879218 ?auto_879222 ) ) ( not ( = ?auto_879218 ?auto_879223 ) ) ( not ( = ?auto_879218 ?auto_879224 ) ) ( not ( = ?auto_879218 ?auto_879225 ) ) ( not ( = ?auto_879218 ?auto_879226 ) ) ( not ( = ?auto_879219 ?auto_879220 ) ) ( not ( = ?auto_879219 ?auto_879221 ) ) ( not ( = ?auto_879219 ?auto_879222 ) ) ( not ( = ?auto_879219 ?auto_879223 ) ) ( not ( = ?auto_879219 ?auto_879224 ) ) ( not ( = ?auto_879219 ?auto_879225 ) ) ( not ( = ?auto_879219 ?auto_879226 ) ) ( not ( = ?auto_879220 ?auto_879221 ) ) ( not ( = ?auto_879220 ?auto_879222 ) ) ( not ( = ?auto_879220 ?auto_879223 ) ) ( not ( = ?auto_879220 ?auto_879224 ) ) ( not ( = ?auto_879220 ?auto_879225 ) ) ( not ( = ?auto_879220 ?auto_879226 ) ) ( not ( = ?auto_879221 ?auto_879222 ) ) ( not ( = ?auto_879221 ?auto_879223 ) ) ( not ( = ?auto_879221 ?auto_879224 ) ) ( not ( = ?auto_879221 ?auto_879225 ) ) ( not ( = ?auto_879221 ?auto_879226 ) ) ( not ( = ?auto_879222 ?auto_879223 ) ) ( not ( = ?auto_879222 ?auto_879224 ) ) ( not ( = ?auto_879222 ?auto_879225 ) ) ( not ( = ?auto_879222 ?auto_879226 ) ) ( not ( = ?auto_879223 ?auto_879224 ) ) ( not ( = ?auto_879223 ?auto_879225 ) ) ( not ( = ?auto_879223 ?auto_879226 ) ) ( not ( = ?auto_879224 ?auto_879225 ) ) ( not ( = ?auto_879224 ?auto_879226 ) ) ( not ( = ?auto_879225 ?auto_879226 ) ) ( CLEAR ?auto_879224 ) ( ON ?auto_879225 ?auto_879226 ) ( CLEAR ?auto_879225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_879209 ?auto_879210 ?auto_879211 ?auto_879212 ?auto_879213 ?auto_879214 ?auto_879215 ?auto_879216 ?auto_879217 ?auto_879218 ?auto_879219 ?auto_879220 ?auto_879221 ?auto_879222 ?auto_879223 ?auto_879224 ?auto_879225 )
      ( MAKE-18PILE ?auto_879209 ?auto_879210 ?auto_879211 ?auto_879212 ?auto_879213 ?auto_879214 ?auto_879215 ?auto_879216 ?auto_879217 ?auto_879218 ?auto_879219 ?auto_879220 ?auto_879221 ?auto_879222 ?auto_879223 ?auto_879224 ?auto_879225 ?auto_879226 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_879245 - BLOCK
      ?auto_879246 - BLOCK
      ?auto_879247 - BLOCK
      ?auto_879248 - BLOCK
      ?auto_879249 - BLOCK
      ?auto_879250 - BLOCK
      ?auto_879251 - BLOCK
      ?auto_879252 - BLOCK
      ?auto_879253 - BLOCK
      ?auto_879254 - BLOCK
      ?auto_879255 - BLOCK
      ?auto_879256 - BLOCK
      ?auto_879257 - BLOCK
      ?auto_879258 - BLOCK
      ?auto_879259 - BLOCK
      ?auto_879260 - BLOCK
      ?auto_879261 - BLOCK
      ?auto_879262 - BLOCK
    )
    :vars
    (
      ?auto_879263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_879262 ?auto_879263 ) ( ON-TABLE ?auto_879245 ) ( ON ?auto_879246 ?auto_879245 ) ( ON ?auto_879247 ?auto_879246 ) ( ON ?auto_879248 ?auto_879247 ) ( ON ?auto_879249 ?auto_879248 ) ( ON ?auto_879250 ?auto_879249 ) ( ON ?auto_879251 ?auto_879250 ) ( ON ?auto_879252 ?auto_879251 ) ( ON ?auto_879253 ?auto_879252 ) ( ON ?auto_879254 ?auto_879253 ) ( ON ?auto_879255 ?auto_879254 ) ( ON ?auto_879256 ?auto_879255 ) ( ON ?auto_879257 ?auto_879256 ) ( ON ?auto_879258 ?auto_879257 ) ( ON ?auto_879259 ?auto_879258 ) ( not ( = ?auto_879245 ?auto_879246 ) ) ( not ( = ?auto_879245 ?auto_879247 ) ) ( not ( = ?auto_879245 ?auto_879248 ) ) ( not ( = ?auto_879245 ?auto_879249 ) ) ( not ( = ?auto_879245 ?auto_879250 ) ) ( not ( = ?auto_879245 ?auto_879251 ) ) ( not ( = ?auto_879245 ?auto_879252 ) ) ( not ( = ?auto_879245 ?auto_879253 ) ) ( not ( = ?auto_879245 ?auto_879254 ) ) ( not ( = ?auto_879245 ?auto_879255 ) ) ( not ( = ?auto_879245 ?auto_879256 ) ) ( not ( = ?auto_879245 ?auto_879257 ) ) ( not ( = ?auto_879245 ?auto_879258 ) ) ( not ( = ?auto_879245 ?auto_879259 ) ) ( not ( = ?auto_879245 ?auto_879260 ) ) ( not ( = ?auto_879245 ?auto_879261 ) ) ( not ( = ?auto_879245 ?auto_879262 ) ) ( not ( = ?auto_879245 ?auto_879263 ) ) ( not ( = ?auto_879246 ?auto_879247 ) ) ( not ( = ?auto_879246 ?auto_879248 ) ) ( not ( = ?auto_879246 ?auto_879249 ) ) ( not ( = ?auto_879246 ?auto_879250 ) ) ( not ( = ?auto_879246 ?auto_879251 ) ) ( not ( = ?auto_879246 ?auto_879252 ) ) ( not ( = ?auto_879246 ?auto_879253 ) ) ( not ( = ?auto_879246 ?auto_879254 ) ) ( not ( = ?auto_879246 ?auto_879255 ) ) ( not ( = ?auto_879246 ?auto_879256 ) ) ( not ( = ?auto_879246 ?auto_879257 ) ) ( not ( = ?auto_879246 ?auto_879258 ) ) ( not ( = ?auto_879246 ?auto_879259 ) ) ( not ( = ?auto_879246 ?auto_879260 ) ) ( not ( = ?auto_879246 ?auto_879261 ) ) ( not ( = ?auto_879246 ?auto_879262 ) ) ( not ( = ?auto_879246 ?auto_879263 ) ) ( not ( = ?auto_879247 ?auto_879248 ) ) ( not ( = ?auto_879247 ?auto_879249 ) ) ( not ( = ?auto_879247 ?auto_879250 ) ) ( not ( = ?auto_879247 ?auto_879251 ) ) ( not ( = ?auto_879247 ?auto_879252 ) ) ( not ( = ?auto_879247 ?auto_879253 ) ) ( not ( = ?auto_879247 ?auto_879254 ) ) ( not ( = ?auto_879247 ?auto_879255 ) ) ( not ( = ?auto_879247 ?auto_879256 ) ) ( not ( = ?auto_879247 ?auto_879257 ) ) ( not ( = ?auto_879247 ?auto_879258 ) ) ( not ( = ?auto_879247 ?auto_879259 ) ) ( not ( = ?auto_879247 ?auto_879260 ) ) ( not ( = ?auto_879247 ?auto_879261 ) ) ( not ( = ?auto_879247 ?auto_879262 ) ) ( not ( = ?auto_879247 ?auto_879263 ) ) ( not ( = ?auto_879248 ?auto_879249 ) ) ( not ( = ?auto_879248 ?auto_879250 ) ) ( not ( = ?auto_879248 ?auto_879251 ) ) ( not ( = ?auto_879248 ?auto_879252 ) ) ( not ( = ?auto_879248 ?auto_879253 ) ) ( not ( = ?auto_879248 ?auto_879254 ) ) ( not ( = ?auto_879248 ?auto_879255 ) ) ( not ( = ?auto_879248 ?auto_879256 ) ) ( not ( = ?auto_879248 ?auto_879257 ) ) ( not ( = ?auto_879248 ?auto_879258 ) ) ( not ( = ?auto_879248 ?auto_879259 ) ) ( not ( = ?auto_879248 ?auto_879260 ) ) ( not ( = ?auto_879248 ?auto_879261 ) ) ( not ( = ?auto_879248 ?auto_879262 ) ) ( not ( = ?auto_879248 ?auto_879263 ) ) ( not ( = ?auto_879249 ?auto_879250 ) ) ( not ( = ?auto_879249 ?auto_879251 ) ) ( not ( = ?auto_879249 ?auto_879252 ) ) ( not ( = ?auto_879249 ?auto_879253 ) ) ( not ( = ?auto_879249 ?auto_879254 ) ) ( not ( = ?auto_879249 ?auto_879255 ) ) ( not ( = ?auto_879249 ?auto_879256 ) ) ( not ( = ?auto_879249 ?auto_879257 ) ) ( not ( = ?auto_879249 ?auto_879258 ) ) ( not ( = ?auto_879249 ?auto_879259 ) ) ( not ( = ?auto_879249 ?auto_879260 ) ) ( not ( = ?auto_879249 ?auto_879261 ) ) ( not ( = ?auto_879249 ?auto_879262 ) ) ( not ( = ?auto_879249 ?auto_879263 ) ) ( not ( = ?auto_879250 ?auto_879251 ) ) ( not ( = ?auto_879250 ?auto_879252 ) ) ( not ( = ?auto_879250 ?auto_879253 ) ) ( not ( = ?auto_879250 ?auto_879254 ) ) ( not ( = ?auto_879250 ?auto_879255 ) ) ( not ( = ?auto_879250 ?auto_879256 ) ) ( not ( = ?auto_879250 ?auto_879257 ) ) ( not ( = ?auto_879250 ?auto_879258 ) ) ( not ( = ?auto_879250 ?auto_879259 ) ) ( not ( = ?auto_879250 ?auto_879260 ) ) ( not ( = ?auto_879250 ?auto_879261 ) ) ( not ( = ?auto_879250 ?auto_879262 ) ) ( not ( = ?auto_879250 ?auto_879263 ) ) ( not ( = ?auto_879251 ?auto_879252 ) ) ( not ( = ?auto_879251 ?auto_879253 ) ) ( not ( = ?auto_879251 ?auto_879254 ) ) ( not ( = ?auto_879251 ?auto_879255 ) ) ( not ( = ?auto_879251 ?auto_879256 ) ) ( not ( = ?auto_879251 ?auto_879257 ) ) ( not ( = ?auto_879251 ?auto_879258 ) ) ( not ( = ?auto_879251 ?auto_879259 ) ) ( not ( = ?auto_879251 ?auto_879260 ) ) ( not ( = ?auto_879251 ?auto_879261 ) ) ( not ( = ?auto_879251 ?auto_879262 ) ) ( not ( = ?auto_879251 ?auto_879263 ) ) ( not ( = ?auto_879252 ?auto_879253 ) ) ( not ( = ?auto_879252 ?auto_879254 ) ) ( not ( = ?auto_879252 ?auto_879255 ) ) ( not ( = ?auto_879252 ?auto_879256 ) ) ( not ( = ?auto_879252 ?auto_879257 ) ) ( not ( = ?auto_879252 ?auto_879258 ) ) ( not ( = ?auto_879252 ?auto_879259 ) ) ( not ( = ?auto_879252 ?auto_879260 ) ) ( not ( = ?auto_879252 ?auto_879261 ) ) ( not ( = ?auto_879252 ?auto_879262 ) ) ( not ( = ?auto_879252 ?auto_879263 ) ) ( not ( = ?auto_879253 ?auto_879254 ) ) ( not ( = ?auto_879253 ?auto_879255 ) ) ( not ( = ?auto_879253 ?auto_879256 ) ) ( not ( = ?auto_879253 ?auto_879257 ) ) ( not ( = ?auto_879253 ?auto_879258 ) ) ( not ( = ?auto_879253 ?auto_879259 ) ) ( not ( = ?auto_879253 ?auto_879260 ) ) ( not ( = ?auto_879253 ?auto_879261 ) ) ( not ( = ?auto_879253 ?auto_879262 ) ) ( not ( = ?auto_879253 ?auto_879263 ) ) ( not ( = ?auto_879254 ?auto_879255 ) ) ( not ( = ?auto_879254 ?auto_879256 ) ) ( not ( = ?auto_879254 ?auto_879257 ) ) ( not ( = ?auto_879254 ?auto_879258 ) ) ( not ( = ?auto_879254 ?auto_879259 ) ) ( not ( = ?auto_879254 ?auto_879260 ) ) ( not ( = ?auto_879254 ?auto_879261 ) ) ( not ( = ?auto_879254 ?auto_879262 ) ) ( not ( = ?auto_879254 ?auto_879263 ) ) ( not ( = ?auto_879255 ?auto_879256 ) ) ( not ( = ?auto_879255 ?auto_879257 ) ) ( not ( = ?auto_879255 ?auto_879258 ) ) ( not ( = ?auto_879255 ?auto_879259 ) ) ( not ( = ?auto_879255 ?auto_879260 ) ) ( not ( = ?auto_879255 ?auto_879261 ) ) ( not ( = ?auto_879255 ?auto_879262 ) ) ( not ( = ?auto_879255 ?auto_879263 ) ) ( not ( = ?auto_879256 ?auto_879257 ) ) ( not ( = ?auto_879256 ?auto_879258 ) ) ( not ( = ?auto_879256 ?auto_879259 ) ) ( not ( = ?auto_879256 ?auto_879260 ) ) ( not ( = ?auto_879256 ?auto_879261 ) ) ( not ( = ?auto_879256 ?auto_879262 ) ) ( not ( = ?auto_879256 ?auto_879263 ) ) ( not ( = ?auto_879257 ?auto_879258 ) ) ( not ( = ?auto_879257 ?auto_879259 ) ) ( not ( = ?auto_879257 ?auto_879260 ) ) ( not ( = ?auto_879257 ?auto_879261 ) ) ( not ( = ?auto_879257 ?auto_879262 ) ) ( not ( = ?auto_879257 ?auto_879263 ) ) ( not ( = ?auto_879258 ?auto_879259 ) ) ( not ( = ?auto_879258 ?auto_879260 ) ) ( not ( = ?auto_879258 ?auto_879261 ) ) ( not ( = ?auto_879258 ?auto_879262 ) ) ( not ( = ?auto_879258 ?auto_879263 ) ) ( not ( = ?auto_879259 ?auto_879260 ) ) ( not ( = ?auto_879259 ?auto_879261 ) ) ( not ( = ?auto_879259 ?auto_879262 ) ) ( not ( = ?auto_879259 ?auto_879263 ) ) ( not ( = ?auto_879260 ?auto_879261 ) ) ( not ( = ?auto_879260 ?auto_879262 ) ) ( not ( = ?auto_879260 ?auto_879263 ) ) ( not ( = ?auto_879261 ?auto_879262 ) ) ( not ( = ?auto_879261 ?auto_879263 ) ) ( not ( = ?auto_879262 ?auto_879263 ) ) ( ON ?auto_879261 ?auto_879262 ) ( CLEAR ?auto_879259 ) ( ON ?auto_879260 ?auto_879261 ) ( CLEAR ?auto_879260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_879245 ?auto_879246 ?auto_879247 ?auto_879248 ?auto_879249 ?auto_879250 ?auto_879251 ?auto_879252 ?auto_879253 ?auto_879254 ?auto_879255 ?auto_879256 ?auto_879257 ?auto_879258 ?auto_879259 ?auto_879260 )
      ( MAKE-18PILE ?auto_879245 ?auto_879246 ?auto_879247 ?auto_879248 ?auto_879249 ?auto_879250 ?auto_879251 ?auto_879252 ?auto_879253 ?auto_879254 ?auto_879255 ?auto_879256 ?auto_879257 ?auto_879258 ?auto_879259 ?auto_879260 ?auto_879261 ?auto_879262 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_879282 - BLOCK
      ?auto_879283 - BLOCK
      ?auto_879284 - BLOCK
      ?auto_879285 - BLOCK
      ?auto_879286 - BLOCK
      ?auto_879287 - BLOCK
      ?auto_879288 - BLOCK
      ?auto_879289 - BLOCK
      ?auto_879290 - BLOCK
      ?auto_879291 - BLOCK
      ?auto_879292 - BLOCK
      ?auto_879293 - BLOCK
      ?auto_879294 - BLOCK
      ?auto_879295 - BLOCK
      ?auto_879296 - BLOCK
      ?auto_879297 - BLOCK
      ?auto_879298 - BLOCK
      ?auto_879299 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_879299 ) ( ON-TABLE ?auto_879282 ) ( ON ?auto_879283 ?auto_879282 ) ( ON ?auto_879284 ?auto_879283 ) ( ON ?auto_879285 ?auto_879284 ) ( ON ?auto_879286 ?auto_879285 ) ( ON ?auto_879287 ?auto_879286 ) ( ON ?auto_879288 ?auto_879287 ) ( ON ?auto_879289 ?auto_879288 ) ( ON ?auto_879290 ?auto_879289 ) ( ON ?auto_879291 ?auto_879290 ) ( ON ?auto_879292 ?auto_879291 ) ( ON ?auto_879293 ?auto_879292 ) ( ON ?auto_879294 ?auto_879293 ) ( ON ?auto_879295 ?auto_879294 ) ( ON ?auto_879296 ?auto_879295 ) ( not ( = ?auto_879282 ?auto_879283 ) ) ( not ( = ?auto_879282 ?auto_879284 ) ) ( not ( = ?auto_879282 ?auto_879285 ) ) ( not ( = ?auto_879282 ?auto_879286 ) ) ( not ( = ?auto_879282 ?auto_879287 ) ) ( not ( = ?auto_879282 ?auto_879288 ) ) ( not ( = ?auto_879282 ?auto_879289 ) ) ( not ( = ?auto_879282 ?auto_879290 ) ) ( not ( = ?auto_879282 ?auto_879291 ) ) ( not ( = ?auto_879282 ?auto_879292 ) ) ( not ( = ?auto_879282 ?auto_879293 ) ) ( not ( = ?auto_879282 ?auto_879294 ) ) ( not ( = ?auto_879282 ?auto_879295 ) ) ( not ( = ?auto_879282 ?auto_879296 ) ) ( not ( = ?auto_879282 ?auto_879297 ) ) ( not ( = ?auto_879282 ?auto_879298 ) ) ( not ( = ?auto_879282 ?auto_879299 ) ) ( not ( = ?auto_879283 ?auto_879284 ) ) ( not ( = ?auto_879283 ?auto_879285 ) ) ( not ( = ?auto_879283 ?auto_879286 ) ) ( not ( = ?auto_879283 ?auto_879287 ) ) ( not ( = ?auto_879283 ?auto_879288 ) ) ( not ( = ?auto_879283 ?auto_879289 ) ) ( not ( = ?auto_879283 ?auto_879290 ) ) ( not ( = ?auto_879283 ?auto_879291 ) ) ( not ( = ?auto_879283 ?auto_879292 ) ) ( not ( = ?auto_879283 ?auto_879293 ) ) ( not ( = ?auto_879283 ?auto_879294 ) ) ( not ( = ?auto_879283 ?auto_879295 ) ) ( not ( = ?auto_879283 ?auto_879296 ) ) ( not ( = ?auto_879283 ?auto_879297 ) ) ( not ( = ?auto_879283 ?auto_879298 ) ) ( not ( = ?auto_879283 ?auto_879299 ) ) ( not ( = ?auto_879284 ?auto_879285 ) ) ( not ( = ?auto_879284 ?auto_879286 ) ) ( not ( = ?auto_879284 ?auto_879287 ) ) ( not ( = ?auto_879284 ?auto_879288 ) ) ( not ( = ?auto_879284 ?auto_879289 ) ) ( not ( = ?auto_879284 ?auto_879290 ) ) ( not ( = ?auto_879284 ?auto_879291 ) ) ( not ( = ?auto_879284 ?auto_879292 ) ) ( not ( = ?auto_879284 ?auto_879293 ) ) ( not ( = ?auto_879284 ?auto_879294 ) ) ( not ( = ?auto_879284 ?auto_879295 ) ) ( not ( = ?auto_879284 ?auto_879296 ) ) ( not ( = ?auto_879284 ?auto_879297 ) ) ( not ( = ?auto_879284 ?auto_879298 ) ) ( not ( = ?auto_879284 ?auto_879299 ) ) ( not ( = ?auto_879285 ?auto_879286 ) ) ( not ( = ?auto_879285 ?auto_879287 ) ) ( not ( = ?auto_879285 ?auto_879288 ) ) ( not ( = ?auto_879285 ?auto_879289 ) ) ( not ( = ?auto_879285 ?auto_879290 ) ) ( not ( = ?auto_879285 ?auto_879291 ) ) ( not ( = ?auto_879285 ?auto_879292 ) ) ( not ( = ?auto_879285 ?auto_879293 ) ) ( not ( = ?auto_879285 ?auto_879294 ) ) ( not ( = ?auto_879285 ?auto_879295 ) ) ( not ( = ?auto_879285 ?auto_879296 ) ) ( not ( = ?auto_879285 ?auto_879297 ) ) ( not ( = ?auto_879285 ?auto_879298 ) ) ( not ( = ?auto_879285 ?auto_879299 ) ) ( not ( = ?auto_879286 ?auto_879287 ) ) ( not ( = ?auto_879286 ?auto_879288 ) ) ( not ( = ?auto_879286 ?auto_879289 ) ) ( not ( = ?auto_879286 ?auto_879290 ) ) ( not ( = ?auto_879286 ?auto_879291 ) ) ( not ( = ?auto_879286 ?auto_879292 ) ) ( not ( = ?auto_879286 ?auto_879293 ) ) ( not ( = ?auto_879286 ?auto_879294 ) ) ( not ( = ?auto_879286 ?auto_879295 ) ) ( not ( = ?auto_879286 ?auto_879296 ) ) ( not ( = ?auto_879286 ?auto_879297 ) ) ( not ( = ?auto_879286 ?auto_879298 ) ) ( not ( = ?auto_879286 ?auto_879299 ) ) ( not ( = ?auto_879287 ?auto_879288 ) ) ( not ( = ?auto_879287 ?auto_879289 ) ) ( not ( = ?auto_879287 ?auto_879290 ) ) ( not ( = ?auto_879287 ?auto_879291 ) ) ( not ( = ?auto_879287 ?auto_879292 ) ) ( not ( = ?auto_879287 ?auto_879293 ) ) ( not ( = ?auto_879287 ?auto_879294 ) ) ( not ( = ?auto_879287 ?auto_879295 ) ) ( not ( = ?auto_879287 ?auto_879296 ) ) ( not ( = ?auto_879287 ?auto_879297 ) ) ( not ( = ?auto_879287 ?auto_879298 ) ) ( not ( = ?auto_879287 ?auto_879299 ) ) ( not ( = ?auto_879288 ?auto_879289 ) ) ( not ( = ?auto_879288 ?auto_879290 ) ) ( not ( = ?auto_879288 ?auto_879291 ) ) ( not ( = ?auto_879288 ?auto_879292 ) ) ( not ( = ?auto_879288 ?auto_879293 ) ) ( not ( = ?auto_879288 ?auto_879294 ) ) ( not ( = ?auto_879288 ?auto_879295 ) ) ( not ( = ?auto_879288 ?auto_879296 ) ) ( not ( = ?auto_879288 ?auto_879297 ) ) ( not ( = ?auto_879288 ?auto_879298 ) ) ( not ( = ?auto_879288 ?auto_879299 ) ) ( not ( = ?auto_879289 ?auto_879290 ) ) ( not ( = ?auto_879289 ?auto_879291 ) ) ( not ( = ?auto_879289 ?auto_879292 ) ) ( not ( = ?auto_879289 ?auto_879293 ) ) ( not ( = ?auto_879289 ?auto_879294 ) ) ( not ( = ?auto_879289 ?auto_879295 ) ) ( not ( = ?auto_879289 ?auto_879296 ) ) ( not ( = ?auto_879289 ?auto_879297 ) ) ( not ( = ?auto_879289 ?auto_879298 ) ) ( not ( = ?auto_879289 ?auto_879299 ) ) ( not ( = ?auto_879290 ?auto_879291 ) ) ( not ( = ?auto_879290 ?auto_879292 ) ) ( not ( = ?auto_879290 ?auto_879293 ) ) ( not ( = ?auto_879290 ?auto_879294 ) ) ( not ( = ?auto_879290 ?auto_879295 ) ) ( not ( = ?auto_879290 ?auto_879296 ) ) ( not ( = ?auto_879290 ?auto_879297 ) ) ( not ( = ?auto_879290 ?auto_879298 ) ) ( not ( = ?auto_879290 ?auto_879299 ) ) ( not ( = ?auto_879291 ?auto_879292 ) ) ( not ( = ?auto_879291 ?auto_879293 ) ) ( not ( = ?auto_879291 ?auto_879294 ) ) ( not ( = ?auto_879291 ?auto_879295 ) ) ( not ( = ?auto_879291 ?auto_879296 ) ) ( not ( = ?auto_879291 ?auto_879297 ) ) ( not ( = ?auto_879291 ?auto_879298 ) ) ( not ( = ?auto_879291 ?auto_879299 ) ) ( not ( = ?auto_879292 ?auto_879293 ) ) ( not ( = ?auto_879292 ?auto_879294 ) ) ( not ( = ?auto_879292 ?auto_879295 ) ) ( not ( = ?auto_879292 ?auto_879296 ) ) ( not ( = ?auto_879292 ?auto_879297 ) ) ( not ( = ?auto_879292 ?auto_879298 ) ) ( not ( = ?auto_879292 ?auto_879299 ) ) ( not ( = ?auto_879293 ?auto_879294 ) ) ( not ( = ?auto_879293 ?auto_879295 ) ) ( not ( = ?auto_879293 ?auto_879296 ) ) ( not ( = ?auto_879293 ?auto_879297 ) ) ( not ( = ?auto_879293 ?auto_879298 ) ) ( not ( = ?auto_879293 ?auto_879299 ) ) ( not ( = ?auto_879294 ?auto_879295 ) ) ( not ( = ?auto_879294 ?auto_879296 ) ) ( not ( = ?auto_879294 ?auto_879297 ) ) ( not ( = ?auto_879294 ?auto_879298 ) ) ( not ( = ?auto_879294 ?auto_879299 ) ) ( not ( = ?auto_879295 ?auto_879296 ) ) ( not ( = ?auto_879295 ?auto_879297 ) ) ( not ( = ?auto_879295 ?auto_879298 ) ) ( not ( = ?auto_879295 ?auto_879299 ) ) ( not ( = ?auto_879296 ?auto_879297 ) ) ( not ( = ?auto_879296 ?auto_879298 ) ) ( not ( = ?auto_879296 ?auto_879299 ) ) ( not ( = ?auto_879297 ?auto_879298 ) ) ( not ( = ?auto_879297 ?auto_879299 ) ) ( not ( = ?auto_879298 ?auto_879299 ) ) ( ON ?auto_879298 ?auto_879299 ) ( CLEAR ?auto_879296 ) ( ON ?auto_879297 ?auto_879298 ) ( CLEAR ?auto_879297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_879282 ?auto_879283 ?auto_879284 ?auto_879285 ?auto_879286 ?auto_879287 ?auto_879288 ?auto_879289 ?auto_879290 ?auto_879291 ?auto_879292 ?auto_879293 ?auto_879294 ?auto_879295 ?auto_879296 ?auto_879297 )
      ( MAKE-18PILE ?auto_879282 ?auto_879283 ?auto_879284 ?auto_879285 ?auto_879286 ?auto_879287 ?auto_879288 ?auto_879289 ?auto_879290 ?auto_879291 ?auto_879292 ?auto_879293 ?auto_879294 ?auto_879295 ?auto_879296 ?auto_879297 ?auto_879298 ?auto_879299 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_879318 - BLOCK
      ?auto_879319 - BLOCK
      ?auto_879320 - BLOCK
      ?auto_879321 - BLOCK
      ?auto_879322 - BLOCK
      ?auto_879323 - BLOCK
      ?auto_879324 - BLOCK
      ?auto_879325 - BLOCK
      ?auto_879326 - BLOCK
      ?auto_879327 - BLOCK
      ?auto_879328 - BLOCK
      ?auto_879329 - BLOCK
      ?auto_879330 - BLOCK
      ?auto_879331 - BLOCK
      ?auto_879332 - BLOCK
      ?auto_879333 - BLOCK
      ?auto_879334 - BLOCK
      ?auto_879335 - BLOCK
    )
    :vars
    (
      ?auto_879336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_879335 ?auto_879336 ) ( ON-TABLE ?auto_879318 ) ( ON ?auto_879319 ?auto_879318 ) ( ON ?auto_879320 ?auto_879319 ) ( ON ?auto_879321 ?auto_879320 ) ( ON ?auto_879322 ?auto_879321 ) ( ON ?auto_879323 ?auto_879322 ) ( ON ?auto_879324 ?auto_879323 ) ( ON ?auto_879325 ?auto_879324 ) ( ON ?auto_879326 ?auto_879325 ) ( ON ?auto_879327 ?auto_879326 ) ( ON ?auto_879328 ?auto_879327 ) ( ON ?auto_879329 ?auto_879328 ) ( ON ?auto_879330 ?auto_879329 ) ( ON ?auto_879331 ?auto_879330 ) ( not ( = ?auto_879318 ?auto_879319 ) ) ( not ( = ?auto_879318 ?auto_879320 ) ) ( not ( = ?auto_879318 ?auto_879321 ) ) ( not ( = ?auto_879318 ?auto_879322 ) ) ( not ( = ?auto_879318 ?auto_879323 ) ) ( not ( = ?auto_879318 ?auto_879324 ) ) ( not ( = ?auto_879318 ?auto_879325 ) ) ( not ( = ?auto_879318 ?auto_879326 ) ) ( not ( = ?auto_879318 ?auto_879327 ) ) ( not ( = ?auto_879318 ?auto_879328 ) ) ( not ( = ?auto_879318 ?auto_879329 ) ) ( not ( = ?auto_879318 ?auto_879330 ) ) ( not ( = ?auto_879318 ?auto_879331 ) ) ( not ( = ?auto_879318 ?auto_879332 ) ) ( not ( = ?auto_879318 ?auto_879333 ) ) ( not ( = ?auto_879318 ?auto_879334 ) ) ( not ( = ?auto_879318 ?auto_879335 ) ) ( not ( = ?auto_879318 ?auto_879336 ) ) ( not ( = ?auto_879319 ?auto_879320 ) ) ( not ( = ?auto_879319 ?auto_879321 ) ) ( not ( = ?auto_879319 ?auto_879322 ) ) ( not ( = ?auto_879319 ?auto_879323 ) ) ( not ( = ?auto_879319 ?auto_879324 ) ) ( not ( = ?auto_879319 ?auto_879325 ) ) ( not ( = ?auto_879319 ?auto_879326 ) ) ( not ( = ?auto_879319 ?auto_879327 ) ) ( not ( = ?auto_879319 ?auto_879328 ) ) ( not ( = ?auto_879319 ?auto_879329 ) ) ( not ( = ?auto_879319 ?auto_879330 ) ) ( not ( = ?auto_879319 ?auto_879331 ) ) ( not ( = ?auto_879319 ?auto_879332 ) ) ( not ( = ?auto_879319 ?auto_879333 ) ) ( not ( = ?auto_879319 ?auto_879334 ) ) ( not ( = ?auto_879319 ?auto_879335 ) ) ( not ( = ?auto_879319 ?auto_879336 ) ) ( not ( = ?auto_879320 ?auto_879321 ) ) ( not ( = ?auto_879320 ?auto_879322 ) ) ( not ( = ?auto_879320 ?auto_879323 ) ) ( not ( = ?auto_879320 ?auto_879324 ) ) ( not ( = ?auto_879320 ?auto_879325 ) ) ( not ( = ?auto_879320 ?auto_879326 ) ) ( not ( = ?auto_879320 ?auto_879327 ) ) ( not ( = ?auto_879320 ?auto_879328 ) ) ( not ( = ?auto_879320 ?auto_879329 ) ) ( not ( = ?auto_879320 ?auto_879330 ) ) ( not ( = ?auto_879320 ?auto_879331 ) ) ( not ( = ?auto_879320 ?auto_879332 ) ) ( not ( = ?auto_879320 ?auto_879333 ) ) ( not ( = ?auto_879320 ?auto_879334 ) ) ( not ( = ?auto_879320 ?auto_879335 ) ) ( not ( = ?auto_879320 ?auto_879336 ) ) ( not ( = ?auto_879321 ?auto_879322 ) ) ( not ( = ?auto_879321 ?auto_879323 ) ) ( not ( = ?auto_879321 ?auto_879324 ) ) ( not ( = ?auto_879321 ?auto_879325 ) ) ( not ( = ?auto_879321 ?auto_879326 ) ) ( not ( = ?auto_879321 ?auto_879327 ) ) ( not ( = ?auto_879321 ?auto_879328 ) ) ( not ( = ?auto_879321 ?auto_879329 ) ) ( not ( = ?auto_879321 ?auto_879330 ) ) ( not ( = ?auto_879321 ?auto_879331 ) ) ( not ( = ?auto_879321 ?auto_879332 ) ) ( not ( = ?auto_879321 ?auto_879333 ) ) ( not ( = ?auto_879321 ?auto_879334 ) ) ( not ( = ?auto_879321 ?auto_879335 ) ) ( not ( = ?auto_879321 ?auto_879336 ) ) ( not ( = ?auto_879322 ?auto_879323 ) ) ( not ( = ?auto_879322 ?auto_879324 ) ) ( not ( = ?auto_879322 ?auto_879325 ) ) ( not ( = ?auto_879322 ?auto_879326 ) ) ( not ( = ?auto_879322 ?auto_879327 ) ) ( not ( = ?auto_879322 ?auto_879328 ) ) ( not ( = ?auto_879322 ?auto_879329 ) ) ( not ( = ?auto_879322 ?auto_879330 ) ) ( not ( = ?auto_879322 ?auto_879331 ) ) ( not ( = ?auto_879322 ?auto_879332 ) ) ( not ( = ?auto_879322 ?auto_879333 ) ) ( not ( = ?auto_879322 ?auto_879334 ) ) ( not ( = ?auto_879322 ?auto_879335 ) ) ( not ( = ?auto_879322 ?auto_879336 ) ) ( not ( = ?auto_879323 ?auto_879324 ) ) ( not ( = ?auto_879323 ?auto_879325 ) ) ( not ( = ?auto_879323 ?auto_879326 ) ) ( not ( = ?auto_879323 ?auto_879327 ) ) ( not ( = ?auto_879323 ?auto_879328 ) ) ( not ( = ?auto_879323 ?auto_879329 ) ) ( not ( = ?auto_879323 ?auto_879330 ) ) ( not ( = ?auto_879323 ?auto_879331 ) ) ( not ( = ?auto_879323 ?auto_879332 ) ) ( not ( = ?auto_879323 ?auto_879333 ) ) ( not ( = ?auto_879323 ?auto_879334 ) ) ( not ( = ?auto_879323 ?auto_879335 ) ) ( not ( = ?auto_879323 ?auto_879336 ) ) ( not ( = ?auto_879324 ?auto_879325 ) ) ( not ( = ?auto_879324 ?auto_879326 ) ) ( not ( = ?auto_879324 ?auto_879327 ) ) ( not ( = ?auto_879324 ?auto_879328 ) ) ( not ( = ?auto_879324 ?auto_879329 ) ) ( not ( = ?auto_879324 ?auto_879330 ) ) ( not ( = ?auto_879324 ?auto_879331 ) ) ( not ( = ?auto_879324 ?auto_879332 ) ) ( not ( = ?auto_879324 ?auto_879333 ) ) ( not ( = ?auto_879324 ?auto_879334 ) ) ( not ( = ?auto_879324 ?auto_879335 ) ) ( not ( = ?auto_879324 ?auto_879336 ) ) ( not ( = ?auto_879325 ?auto_879326 ) ) ( not ( = ?auto_879325 ?auto_879327 ) ) ( not ( = ?auto_879325 ?auto_879328 ) ) ( not ( = ?auto_879325 ?auto_879329 ) ) ( not ( = ?auto_879325 ?auto_879330 ) ) ( not ( = ?auto_879325 ?auto_879331 ) ) ( not ( = ?auto_879325 ?auto_879332 ) ) ( not ( = ?auto_879325 ?auto_879333 ) ) ( not ( = ?auto_879325 ?auto_879334 ) ) ( not ( = ?auto_879325 ?auto_879335 ) ) ( not ( = ?auto_879325 ?auto_879336 ) ) ( not ( = ?auto_879326 ?auto_879327 ) ) ( not ( = ?auto_879326 ?auto_879328 ) ) ( not ( = ?auto_879326 ?auto_879329 ) ) ( not ( = ?auto_879326 ?auto_879330 ) ) ( not ( = ?auto_879326 ?auto_879331 ) ) ( not ( = ?auto_879326 ?auto_879332 ) ) ( not ( = ?auto_879326 ?auto_879333 ) ) ( not ( = ?auto_879326 ?auto_879334 ) ) ( not ( = ?auto_879326 ?auto_879335 ) ) ( not ( = ?auto_879326 ?auto_879336 ) ) ( not ( = ?auto_879327 ?auto_879328 ) ) ( not ( = ?auto_879327 ?auto_879329 ) ) ( not ( = ?auto_879327 ?auto_879330 ) ) ( not ( = ?auto_879327 ?auto_879331 ) ) ( not ( = ?auto_879327 ?auto_879332 ) ) ( not ( = ?auto_879327 ?auto_879333 ) ) ( not ( = ?auto_879327 ?auto_879334 ) ) ( not ( = ?auto_879327 ?auto_879335 ) ) ( not ( = ?auto_879327 ?auto_879336 ) ) ( not ( = ?auto_879328 ?auto_879329 ) ) ( not ( = ?auto_879328 ?auto_879330 ) ) ( not ( = ?auto_879328 ?auto_879331 ) ) ( not ( = ?auto_879328 ?auto_879332 ) ) ( not ( = ?auto_879328 ?auto_879333 ) ) ( not ( = ?auto_879328 ?auto_879334 ) ) ( not ( = ?auto_879328 ?auto_879335 ) ) ( not ( = ?auto_879328 ?auto_879336 ) ) ( not ( = ?auto_879329 ?auto_879330 ) ) ( not ( = ?auto_879329 ?auto_879331 ) ) ( not ( = ?auto_879329 ?auto_879332 ) ) ( not ( = ?auto_879329 ?auto_879333 ) ) ( not ( = ?auto_879329 ?auto_879334 ) ) ( not ( = ?auto_879329 ?auto_879335 ) ) ( not ( = ?auto_879329 ?auto_879336 ) ) ( not ( = ?auto_879330 ?auto_879331 ) ) ( not ( = ?auto_879330 ?auto_879332 ) ) ( not ( = ?auto_879330 ?auto_879333 ) ) ( not ( = ?auto_879330 ?auto_879334 ) ) ( not ( = ?auto_879330 ?auto_879335 ) ) ( not ( = ?auto_879330 ?auto_879336 ) ) ( not ( = ?auto_879331 ?auto_879332 ) ) ( not ( = ?auto_879331 ?auto_879333 ) ) ( not ( = ?auto_879331 ?auto_879334 ) ) ( not ( = ?auto_879331 ?auto_879335 ) ) ( not ( = ?auto_879331 ?auto_879336 ) ) ( not ( = ?auto_879332 ?auto_879333 ) ) ( not ( = ?auto_879332 ?auto_879334 ) ) ( not ( = ?auto_879332 ?auto_879335 ) ) ( not ( = ?auto_879332 ?auto_879336 ) ) ( not ( = ?auto_879333 ?auto_879334 ) ) ( not ( = ?auto_879333 ?auto_879335 ) ) ( not ( = ?auto_879333 ?auto_879336 ) ) ( not ( = ?auto_879334 ?auto_879335 ) ) ( not ( = ?auto_879334 ?auto_879336 ) ) ( not ( = ?auto_879335 ?auto_879336 ) ) ( ON ?auto_879334 ?auto_879335 ) ( ON ?auto_879333 ?auto_879334 ) ( CLEAR ?auto_879331 ) ( ON ?auto_879332 ?auto_879333 ) ( CLEAR ?auto_879332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_879318 ?auto_879319 ?auto_879320 ?auto_879321 ?auto_879322 ?auto_879323 ?auto_879324 ?auto_879325 ?auto_879326 ?auto_879327 ?auto_879328 ?auto_879329 ?auto_879330 ?auto_879331 ?auto_879332 )
      ( MAKE-18PILE ?auto_879318 ?auto_879319 ?auto_879320 ?auto_879321 ?auto_879322 ?auto_879323 ?auto_879324 ?auto_879325 ?auto_879326 ?auto_879327 ?auto_879328 ?auto_879329 ?auto_879330 ?auto_879331 ?auto_879332 ?auto_879333 ?auto_879334 ?auto_879335 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_879355 - BLOCK
      ?auto_879356 - BLOCK
      ?auto_879357 - BLOCK
      ?auto_879358 - BLOCK
      ?auto_879359 - BLOCK
      ?auto_879360 - BLOCK
      ?auto_879361 - BLOCK
      ?auto_879362 - BLOCK
      ?auto_879363 - BLOCK
      ?auto_879364 - BLOCK
      ?auto_879365 - BLOCK
      ?auto_879366 - BLOCK
      ?auto_879367 - BLOCK
      ?auto_879368 - BLOCK
      ?auto_879369 - BLOCK
      ?auto_879370 - BLOCK
      ?auto_879371 - BLOCK
      ?auto_879372 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_879372 ) ( ON-TABLE ?auto_879355 ) ( ON ?auto_879356 ?auto_879355 ) ( ON ?auto_879357 ?auto_879356 ) ( ON ?auto_879358 ?auto_879357 ) ( ON ?auto_879359 ?auto_879358 ) ( ON ?auto_879360 ?auto_879359 ) ( ON ?auto_879361 ?auto_879360 ) ( ON ?auto_879362 ?auto_879361 ) ( ON ?auto_879363 ?auto_879362 ) ( ON ?auto_879364 ?auto_879363 ) ( ON ?auto_879365 ?auto_879364 ) ( ON ?auto_879366 ?auto_879365 ) ( ON ?auto_879367 ?auto_879366 ) ( ON ?auto_879368 ?auto_879367 ) ( not ( = ?auto_879355 ?auto_879356 ) ) ( not ( = ?auto_879355 ?auto_879357 ) ) ( not ( = ?auto_879355 ?auto_879358 ) ) ( not ( = ?auto_879355 ?auto_879359 ) ) ( not ( = ?auto_879355 ?auto_879360 ) ) ( not ( = ?auto_879355 ?auto_879361 ) ) ( not ( = ?auto_879355 ?auto_879362 ) ) ( not ( = ?auto_879355 ?auto_879363 ) ) ( not ( = ?auto_879355 ?auto_879364 ) ) ( not ( = ?auto_879355 ?auto_879365 ) ) ( not ( = ?auto_879355 ?auto_879366 ) ) ( not ( = ?auto_879355 ?auto_879367 ) ) ( not ( = ?auto_879355 ?auto_879368 ) ) ( not ( = ?auto_879355 ?auto_879369 ) ) ( not ( = ?auto_879355 ?auto_879370 ) ) ( not ( = ?auto_879355 ?auto_879371 ) ) ( not ( = ?auto_879355 ?auto_879372 ) ) ( not ( = ?auto_879356 ?auto_879357 ) ) ( not ( = ?auto_879356 ?auto_879358 ) ) ( not ( = ?auto_879356 ?auto_879359 ) ) ( not ( = ?auto_879356 ?auto_879360 ) ) ( not ( = ?auto_879356 ?auto_879361 ) ) ( not ( = ?auto_879356 ?auto_879362 ) ) ( not ( = ?auto_879356 ?auto_879363 ) ) ( not ( = ?auto_879356 ?auto_879364 ) ) ( not ( = ?auto_879356 ?auto_879365 ) ) ( not ( = ?auto_879356 ?auto_879366 ) ) ( not ( = ?auto_879356 ?auto_879367 ) ) ( not ( = ?auto_879356 ?auto_879368 ) ) ( not ( = ?auto_879356 ?auto_879369 ) ) ( not ( = ?auto_879356 ?auto_879370 ) ) ( not ( = ?auto_879356 ?auto_879371 ) ) ( not ( = ?auto_879356 ?auto_879372 ) ) ( not ( = ?auto_879357 ?auto_879358 ) ) ( not ( = ?auto_879357 ?auto_879359 ) ) ( not ( = ?auto_879357 ?auto_879360 ) ) ( not ( = ?auto_879357 ?auto_879361 ) ) ( not ( = ?auto_879357 ?auto_879362 ) ) ( not ( = ?auto_879357 ?auto_879363 ) ) ( not ( = ?auto_879357 ?auto_879364 ) ) ( not ( = ?auto_879357 ?auto_879365 ) ) ( not ( = ?auto_879357 ?auto_879366 ) ) ( not ( = ?auto_879357 ?auto_879367 ) ) ( not ( = ?auto_879357 ?auto_879368 ) ) ( not ( = ?auto_879357 ?auto_879369 ) ) ( not ( = ?auto_879357 ?auto_879370 ) ) ( not ( = ?auto_879357 ?auto_879371 ) ) ( not ( = ?auto_879357 ?auto_879372 ) ) ( not ( = ?auto_879358 ?auto_879359 ) ) ( not ( = ?auto_879358 ?auto_879360 ) ) ( not ( = ?auto_879358 ?auto_879361 ) ) ( not ( = ?auto_879358 ?auto_879362 ) ) ( not ( = ?auto_879358 ?auto_879363 ) ) ( not ( = ?auto_879358 ?auto_879364 ) ) ( not ( = ?auto_879358 ?auto_879365 ) ) ( not ( = ?auto_879358 ?auto_879366 ) ) ( not ( = ?auto_879358 ?auto_879367 ) ) ( not ( = ?auto_879358 ?auto_879368 ) ) ( not ( = ?auto_879358 ?auto_879369 ) ) ( not ( = ?auto_879358 ?auto_879370 ) ) ( not ( = ?auto_879358 ?auto_879371 ) ) ( not ( = ?auto_879358 ?auto_879372 ) ) ( not ( = ?auto_879359 ?auto_879360 ) ) ( not ( = ?auto_879359 ?auto_879361 ) ) ( not ( = ?auto_879359 ?auto_879362 ) ) ( not ( = ?auto_879359 ?auto_879363 ) ) ( not ( = ?auto_879359 ?auto_879364 ) ) ( not ( = ?auto_879359 ?auto_879365 ) ) ( not ( = ?auto_879359 ?auto_879366 ) ) ( not ( = ?auto_879359 ?auto_879367 ) ) ( not ( = ?auto_879359 ?auto_879368 ) ) ( not ( = ?auto_879359 ?auto_879369 ) ) ( not ( = ?auto_879359 ?auto_879370 ) ) ( not ( = ?auto_879359 ?auto_879371 ) ) ( not ( = ?auto_879359 ?auto_879372 ) ) ( not ( = ?auto_879360 ?auto_879361 ) ) ( not ( = ?auto_879360 ?auto_879362 ) ) ( not ( = ?auto_879360 ?auto_879363 ) ) ( not ( = ?auto_879360 ?auto_879364 ) ) ( not ( = ?auto_879360 ?auto_879365 ) ) ( not ( = ?auto_879360 ?auto_879366 ) ) ( not ( = ?auto_879360 ?auto_879367 ) ) ( not ( = ?auto_879360 ?auto_879368 ) ) ( not ( = ?auto_879360 ?auto_879369 ) ) ( not ( = ?auto_879360 ?auto_879370 ) ) ( not ( = ?auto_879360 ?auto_879371 ) ) ( not ( = ?auto_879360 ?auto_879372 ) ) ( not ( = ?auto_879361 ?auto_879362 ) ) ( not ( = ?auto_879361 ?auto_879363 ) ) ( not ( = ?auto_879361 ?auto_879364 ) ) ( not ( = ?auto_879361 ?auto_879365 ) ) ( not ( = ?auto_879361 ?auto_879366 ) ) ( not ( = ?auto_879361 ?auto_879367 ) ) ( not ( = ?auto_879361 ?auto_879368 ) ) ( not ( = ?auto_879361 ?auto_879369 ) ) ( not ( = ?auto_879361 ?auto_879370 ) ) ( not ( = ?auto_879361 ?auto_879371 ) ) ( not ( = ?auto_879361 ?auto_879372 ) ) ( not ( = ?auto_879362 ?auto_879363 ) ) ( not ( = ?auto_879362 ?auto_879364 ) ) ( not ( = ?auto_879362 ?auto_879365 ) ) ( not ( = ?auto_879362 ?auto_879366 ) ) ( not ( = ?auto_879362 ?auto_879367 ) ) ( not ( = ?auto_879362 ?auto_879368 ) ) ( not ( = ?auto_879362 ?auto_879369 ) ) ( not ( = ?auto_879362 ?auto_879370 ) ) ( not ( = ?auto_879362 ?auto_879371 ) ) ( not ( = ?auto_879362 ?auto_879372 ) ) ( not ( = ?auto_879363 ?auto_879364 ) ) ( not ( = ?auto_879363 ?auto_879365 ) ) ( not ( = ?auto_879363 ?auto_879366 ) ) ( not ( = ?auto_879363 ?auto_879367 ) ) ( not ( = ?auto_879363 ?auto_879368 ) ) ( not ( = ?auto_879363 ?auto_879369 ) ) ( not ( = ?auto_879363 ?auto_879370 ) ) ( not ( = ?auto_879363 ?auto_879371 ) ) ( not ( = ?auto_879363 ?auto_879372 ) ) ( not ( = ?auto_879364 ?auto_879365 ) ) ( not ( = ?auto_879364 ?auto_879366 ) ) ( not ( = ?auto_879364 ?auto_879367 ) ) ( not ( = ?auto_879364 ?auto_879368 ) ) ( not ( = ?auto_879364 ?auto_879369 ) ) ( not ( = ?auto_879364 ?auto_879370 ) ) ( not ( = ?auto_879364 ?auto_879371 ) ) ( not ( = ?auto_879364 ?auto_879372 ) ) ( not ( = ?auto_879365 ?auto_879366 ) ) ( not ( = ?auto_879365 ?auto_879367 ) ) ( not ( = ?auto_879365 ?auto_879368 ) ) ( not ( = ?auto_879365 ?auto_879369 ) ) ( not ( = ?auto_879365 ?auto_879370 ) ) ( not ( = ?auto_879365 ?auto_879371 ) ) ( not ( = ?auto_879365 ?auto_879372 ) ) ( not ( = ?auto_879366 ?auto_879367 ) ) ( not ( = ?auto_879366 ?auto_879368 ) ) ( not ( = ?auto_879366 ?auto_879369 ) ) ( not ( = ?auto_879366 ?auto_879370 ) ) ( not ( = ?auto_879366 ?auto_879371 ) ) ( not ( = ?auto_879366 ?auto_879372 ) ) ( not ( = ?auto_879367 ?auto_879368 ) ) ( not ( = ?auto_879367 ?auto_879369 ) ) ( not ( = ?auto_879367 ?auto_879370 ) ) ( not ( = ?auto_879367 ?auto_879371 ) ) ( not ( = ?auto_879367 ?auto_879372 ) ) ( not ( = ?auto_879368 ?auto_879369 ) ) ( not ( = ?auto_879368 ?auto_879370 ) ) ( not ( = ?auto_879368 ?auto_879371 ) ) ( not ( = ?auto_879368 ?auto_879372 ) ) ( not ( = ?auto_879369 ?auto_879370 ) ) ( not ( = ?auto_879369 ?auto_879371 ) ) ( not ( = ?auto_879369 ?auto_879372 ) ) ( not ( = ?auto_879370 ?auto_879371 ) ) ( not ( = ?auto_879370 ?auto_879372 ) ) ( not ( = ?auto_879371 ?auto_879372 ) ) ( ON ?auto_879371 ?auto_879372 ) ( ON ?auto_879370 ?auto_879371 ) ( CLEAR ?auto_879368 ) ( ON ?auto_879369 ?auto_879370 ) ( CLEAR ?auto_879369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_879355 ?auto_879356 ?auto_879357 ?auto_879358 ?auto_879359 ?auto_879360 ?auto_879361 ?auto_879362 ?auto_879363 ?auto_879364 ?auto_879365 ?auto_879366 ?auto_879367 ?auto_879368 ?auto_879369 )
      ( MAKE-18PILE ?auto_879355 ?auto_879356 ?auto_879357 ?auto_879358 ?auto_879359 ?auto_879360 ?auto_879361 ?auto_879362 ?auto_879363 ?auto_879364 ?auto_879365 ?auto_879366 ?auto_879367 ?auto_879368 ?auto_879369 ?auto_879370 ?auto_879371 ?auto_879372 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_879391 - BLOCK
      ?auto_879392 - BLOCK
      ?auto_879393 - BLOCK
      ?auto_879394 - BLOCK
      ?auto_879395 - BLOCK
      ?auto_879396 - BLOCK
      ?auto_879397 - BLOCK
      ?auto_879398 - BLOCK
      ?auto_879399 - BLOCK
      ?auto_879400 - BLOCK
      ?auto_879401 - BLOCK
      ?auto_879402 - BLOCK
      ?auto_879403 - BLOCK
      ?auto_879404 - BLOCK
      ?auto_879405 - BLOCK
      ?auto_879406 - BLOCK
      ?auto_879407 - BLOCK
      ?auto_879408 - BLOCK
    )
    :vars
    (
      ?auto_879409 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_879408 ?auto_879409 ) ( ON-TABLE ?auto_879391 ) ( ON ?auto_879392 ?auto_879391 ) ( ON ?auto_879393 ?auto_879392 ) ( ON ?auto_879394 ?auto_879393 ) ( ON ?auto_879395 ?auto_879394 ) ( ON ?auto_879396 ?auto_879395 ) ( ON ?auto_879397 ?auto_879396 ) ( ON ?auto_879398 ?auto_879397 ) ( ON ?auto_879399 ?auto_879398 ) ( ON ?auto_879400 ?auto_879399 ) ( ON ?auto_879401 ?auto_879400 ) ( ON ?auto_879402 ?auto_879401 ) ( ON ?auto_879403 ?auto_879402 ) ( not ( = ?auto_879391 ?auto_879392 ) ) ( not ( = ?auto_879391 ?auto_879393 ) ) ( not ( = ?auto_879391 ?auto_879394 ) ) ( not ( = ?auto_879391 ?auto_879395 ) ) ( not ( = ?auto_879391 ?auto_879396 ) ) ( not ( = ?auto_879391 ?auto_879397 ) ) ( not ( = ?auto_879391 ?auto_879398 ) ) ( not ( = ?auto_879391 ?auto_879399 ) ) ( not ( = ?auto_879391 ?auto_879400 ) ) ( not ( = ?auto_879391 ?auto_879401 ) ) ( not ( = ?auto_879391 ?auto_879402 ) ) ( not ( = ?auto_879391 ?auto_879403 ) ) ( not ( = ?auto_879391 ?auto_879404 ) ) ( not ( = ?auto_879391 ?auto_879405 ) ) ( not ( = ?auto_879391 ?auto_879406 ) ) ( not ( = ?auto_879391 ?auto_879407 ) ) ( not ( = ?auto_879391 ?auto_879408 ) ) ( not ( = ?auto_879391 ?auto_879409 ) ) ( not ( = ?auto_879392 ?auto_879393 ) ) ( not ( = ?auto_879392 ?auto_879394 ) ) ( not ( = ?auto_879392 ?auto_879395 ) ) ( not ( = ?auto_879392 ?auto_879396 ) ) ( not ( = ?auto_879392 ?auto_879397 ) ) ( not ( = ?auto_879392 ?auto_879398 ) ) ( not ( = ?auto_879392 ?auto_879399 ) ) ( not ( = ?auto_879392 ?auto_879400 ) ) ( not ( = ?auto_879392 ?auto_879401 ) ) ( not ( = ?auto_879392 ?auto_879402 ) ) ( not ( = ?auto_879392 ?auto_879403 ) ) ( not ( = ?auto_879392 ?auto_879404 ) ) ( not ( = ?auto_879392 ?auto_879405 ) ) ( not ( = ?auto_879392 ?auto_879406 ) ) ( not ( = ?auto_879392 ?auto_879407 ) ) ( not ( = ?auto_879392 ?auto_879408 ) ) ( not ( = ?auto_879392 ?auto_879409 ) ) ( not ( = ?auto_879393 ?auto_879394 ) ) ( not ( = ?auto_879393 ?auto_879395 ) ) ( not ( = ?auto_879393 ?auto_879396 ) ) ( not ( = ?auto_879393 ?auto_879397 ) ) ( not ( = ?auto_879393 ?auto_879398 ) ) ( not ( = ?auto_879393 ?auto_879399 ) ) ( not ( = ?auto_879393 ?auto_879400 ) ) ( not ( = ?auto_879393 ?auto_879401 ) ) ( not ( = ?auto_879393 ?auto_879402 ) ) ( not ( = ?auto_879393 ?auto_879403 ) ) ( not ( = ?auto_879393 ?auto_879404 ) ) ( not ( = ?auto_879393 ?auto_879405 ) ) ( not ( = ?auto_879393 ?auto_879406 ) ) ( not ( = ?auto_879393 ?auto_879407 ) ) ( not ( = ?auto_879393 ?auto_879408 ) ) ( not ( = ?auto_879393 ?auto_879409 ) ) ( not ( = ?auto_879394 ?auto_879395 ) ) ( not ( = ?auto_879394 ?auto_879396 ) ) ( not ( = ?auto_879394 ?auto_879397 ) ) ( not ( = ?auto_879394 ?auto_879398 ) ) ( not ( = ?auto_879394 ?auto_879399 ) ) ( not ( = ?auto_879394 ?auto_879400 ) ) ( not ( = ?auto_879394 ?auto_879401 ) ) ( not ( = ?auto_879394 ?auto_879402 ) ) ( not ( = ?auto_879394 ?auto_879403 ) ) ( not ( = ?auto_879394 ?auto_879404 ) ) ( not ( = ?auto_879394 ?auto_879405 ) ) ( not ( = ?auto_879394 ?auto_879406 ) ) ( not ( = ?auto_879394 ?auto_879407 ) ) ( not ( = ?auto_879394 ?auto_879408 ) ) ( not ( = ?auto_879394 ?auto_879409 ) ) ( not ( = ?auto_879395 ?auto_879396 ) ) ( not ( = ?auto_879395 ?auto_879397 ) ) ( not ( = ?auto_879395 ?auto_879398 ) ) ( not ( = ?auto_879395 ?auto_879399 ) ) ( not ( = ?auto_879395 ?auto_879400 ) ) ( not ( = ?auto_879395 ?auto_879401 ) ) ( not ( = ?auto_879395 ?auto_879402 ) ) ( not ( = ?auto_879395 ?auto_879403 ) ) ( not ( = ?auto_879395 ?auto_879404 ) ) ( not ( = ?auto_879395 ?auto_879405 ) ) ( not ( = ?auto_879395 ?auto_879406 ) ) ( not ( = ?auto_879395 ?auto_879407 ) ) ( not ( = ?auto_879395 ?auto_879408 ) ) ( not ( = ?auto_879395 ?auto_879409 ) ) ( not ( = ?auto_879396 ?auto_879397 ) ) ( not ( = ?auto_879396 ?auto_879398 ) ) ( not ( = ?auto_879396 ?auto_879399 ) ) ( not ( = ?auto_879396 ?auto_879400 ) ) ( not ( = ?auto_879396 ?auto_879401 ) ) ( not ( = ?auto_879396 ?auto_879402 ) ) ( not ( = ?auto_879396 ?auto_879403 ) ) ( not ( = ?auto_879396 ?auto_879404 ) ) ( not ( = ?auto_879396 ?auto_879405 ) ) ( not ( = ?auto_879396 ?auto_879406 ) ) ( not ( = ?auto_879396 ?auto_879407 ) ) ( not ( = ?auto_879396 ?auto_879408 ) ) ( not ( = ?auto_879396 ?auto_879409 ) ) ( not ( = ?auto_879397 ?auto_879398 ) ) ( not ( = ?auto_879397 ?auto_879399 ) ) ( not ( = ?auto_879397 ?auto_879400 ) ) ( not ( = ?auto_879397 ?auto_879401 ) ) ( not ( = ?auto_879397 ?auto_879402 ) ) ( not ( = ?auto_879397 ?auto_879403 ) ) ( not ( = ?auto_879397 ?auto_879404 ) ) ( not ( = ?auto_879397 ?auto_879405 ) ) ( not ( = ?auto_879397 ?auto_879406 ) ) ( not ( = ?auto_879397 ?auto_879407 ) ) ( not ( = ?auto_879397 ?auto_879408 ) ) ( not ( = ?auto_879397 ?auto_879409 ) ) ( not ( = ?auto_879398 ?auto_879399 ) ) ( not ( = ?auto_879398 ?auto_879400 ) ) ( not ( = ?auto_879398 ?auto_879401 ) ) ( not ( = ?auto_879398 ?auto_879402 ) ) ( not ( = ?auto_879398 ?auto_879403 ) ) ( not ( = ?auto_879398 ?auto_879404 ) ) ( not ( = ?auto_879398 ?auto_879405 ) ) ( not ( = ?auto_879398 ?auto_879406 ) ) ( not ( = ?auto_879398 ?auto_879407 ) ) ( not ( = ?auto_879398 ?auto_879408 ) ) ( not ( = ?auto_879398 ?auto_879409 ) ) ( not ( = ?auto_879399 ?auto_879400 ) ) ( not ( = ?auto_879399 ?auto_879401 ) ) ( not ( = ?auto_879399 ?auto_879402 ) ) ( not ( = ?auto_879399 ?auto_879403 ) ) ( not ( = ?auto_879399 ?auto_879404 ) ) ( not ( = ?auto_879399 ?auto_879405 ) ) ( not ( = ?auto_879399 ?auto_879406 ) ) ( not ( = ?auto_879399 ?auto_879407 ) ) ( not ( = ?auto_879399 ?auto_879408 ) ) ( not ( = ?auto_879399 ?auto_879409 ) ) ( not ( = ?auto_879400 ?auto_879401 ) ) ( not ( = ?auto_879400 ?auto_879402 ) ) ( not ( = ?auto_879400 ?auto_879403 ) ) ( not ( = ?auto_879400 ?auto_879404 ) ) ( not ( = ?auto_879400 ?auto_879405 ) ) ( not ( = ?auto_879400 ?auto_879406 ) ) ( not ( = ?auto_879400 ?auto_879407 ) ) ( not ( = ?auto_879400 ?auto_879408 ) ) ( not ( = ?auto_879400 ?auto_879409 ) ) ( not ( = ?auto_879401 ?auto_879402 ) ) ( not ( = ?auto_879401 ?auto_879403 ) ) ( not ( = ?auto_879401 ?auto_879404 ) ) ( not ( = ?auto_879401 ?auto_879405 ) ) ( not ( = ?auto_879401 ?auto_879406 ) ) ( not ( = ?auto_879401 ?auto_879407 ) ) ( not ( = ?auto_879401 ?auto_879408 ) ) ( not ( = ?auto_879401 ?auto_879409 ) ) ( not ( = ?auto_879402 ?auto_879403 ) ) ( not ( = ?auto_879402 ?auto_879404 ) ) ( not ( = ?auto_879402 ?auto_879405 ) ) ( not ( = ?auto_879402 ?auto_879406 ) ) ( not ( = ?auto_879402 ?auto_879407 ) ) ( not ( = ?auto_879402 ?auto_879408 ) ) ( not ( = ?auto_879402 ?auto_879409 ) ) ( not ( = ?auto_879403 ?auto_879404 ) ) ( not ( = ?auto_879403 ?auto_879405 ) ) ( not ( = ?auto_879403 ?auto_879406 ) ) ( not ( = ?auto_879403 ?auto_879407 ) ) ( not ( = ?auto_879403 ?auto_879408 ) ) ( not ( = ?auto_879403 ?auto_879409 ) ) ( not ( = ?auto_879404 ?auto_879405 ) ) ( not ( = ?auto_879404 ?auto_879406 ) ) ( not ( = ?auto_879404 ?auto_879407 ) ) ( not ( = ?auto_879404 ?auto_879408 ) ) ( not ( = ?auto_879404 ?auto_879409 ) ) ( not ( = ?auto_879405 ?auto_879406 ) ) ( not ( = ?auto_879405 ?auto_879407 ) ) ( not ( = ?auto_879405 ?auto_879408 ) ) ( not ( = ?auto_879405 ?auto_879409 ) ) ( not ( = ?auto_879406 ?auto_879407 ) ) ( not ( = ?auto_879406 ?auto_879408 ) ) ( not ( = ?auto_879406 ?auto_879409 ) ) ( not ( = ?auto_879407 ?auto_879408 ) ) ( not ( = ?auto_879407 ?auto_879409 ) ) ( not ( = ?auto_879408 ?auto_879409 ) ) ( ON ?auto_879407 ?auto_879408 ) ( ON ?auto_879406 ?auto_879407 ) ( ON ?auto_879405 ?auto_879406 ) ( CLEAR ?auto_879403 ) ( ON ?auto_879404 ?auto_879405 ) ( CLEAR ?auto_879404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_879391 ?auto_879392 ?auto_879393 ?auto_879394 ?auto_879395 ?auto_879396 ?auto_879397 ?auto_879398 ?auto_879399 ?auto_879400 ?auto_879401 ?auto_879402 ?auto_879403 ?auto_879404 )
      ( MAKE-18PILE ?auto_879391 ?auto_879392 ?auto_879393 ?auto_879394 ?auto_879395 ?auto_879396 ?auto_879397 ?auto_879398 ?auto_879399 ?auto_879400 ?auto_879401 ?auto_879402 ?auto_879403 ?auto_879404 ?auto_879405 ?auto_879406 ?auto_879407 ?auto_879408 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_879428 - BLOCK
      ?auto_879429 - BLOCK
      ?auto_879430 - BLOCK
      ?auto_879431 - BLOCK
      ?auto_879432 - BLOCK
      ?auto_879433 - BLOCK
      ?auto_879434 - BLOCK
      ?auto_879435 - BLOCK
      ?auto_879436 - BLOCK
      ?auto_879437 - BLOCK
      ?auto_879438 - BLOCK
      ?auto_879439 - BLOCK
      ?auto_879440 - BLOCK
      ?auto_879441 - BLOCK
      ?auto_879442 - BLOCK
      ?auto_879443 - BLOCK
      ?auto_879444 - BLOCK
      ?auto_879445 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_879445 ) ( ON-TABLE ?auto_879428 ) ( ON ?auto_879429 ?auto_879428 ) ( ON ?auto_879430 ?auto_879429 ) ( ON ?auto_879431 ?auto_879430 ) ( ON ?auto_879432 ?auto_879431 ) ( ON ?auto_879433 ?auto_879432 ) ( ON ?auto_879434 ?auto_879433 ) ( ON ?auto_879435 ?auto_879434 ) ( ON ?auto_879436 ?auto_879435 ) ( ON ?auto_879437 ?auto_879436 ) ( ON ?auto_879438 ?auto_879437 ) ( ON ?auto_879439 ?auto_879438 ) ( ON ?auto_879440 ?auto_879439 ) ( not ( = ?auto_879428 ?auto_879429 ) ) ( not ( = ?auto_879428 ?auto_879430 ) ) ( not ( = ?auto_879428 ?auto_879431 ) ) ( not ( = ?auto_879428 ?auto_879432 ) ) ( not ( = ?auto_879428 ?auto_879433 ) ) ( not ( = ?auto_879428 ?auto_879434 ) ) ( not ( = ?auto_879428 ?auto_879435 ) ) ( not ( = ?auto_879428 ?auto_879436 ) ) ( not ( = ?auto_879428 ?auto_879437 ) ) ( not ( = ?auto_879428 ?auto_879438 ) ) ( not ( = ?auto_879428 ?auto_879439 ) ) ( not ( = ?auto_879428 ?auto_879440 ) ) ( not ( = ?auto_879428 ?auto_879441 ) ) ( not ( = ?auto_879428 ?auto_879442 ) ) ( not ( = ?auto_879428 ?auto_879443 ) ) ( not ( = ?auto_879428 ?auto_879444 ) ) ( not ( = ?auto_879428 ?auto_879445 ) ) ( not ( = ?auto_879429 ?auto_879430 ) ) ( not ( = ?auto_879429 ?auto_879431 ) ) ( not ( = ?auto_879429 ?auto_879432 ) ) ( not ( = ?auto_879429 ?auto_879433 ) ) ( not ( = ?auto_879429 ?auto_879434 ) ) ( not ( = ?auto_879429 ?auto_879435 ) ) ( not ( = ?auto_879429 ?auto_879436 ) ) ( not ( = ?auto_879429 ?auto_879437 ) ) ( not ( = ?auto_879429 ?auto_879438 ) ) ( not ( = ?auto_879429 ?auto_879439 ) ) ( not ( = ?auto_879429 ?auto_879440 ) ) ( not ( = ?auto_879429 ?auto_879441 ) ) ( not ( = ?auto_879429 ?auto_879442 ) ) ( not ( = ?auto_879429 ?auto_879443 ) ) ( not ( = ?auto_879429 ?auto_879444 ) ) ( not ( = ?auto_879429 ?auto_879445 ) ) ( not ( = ?auto_879430 ?auto_879431 ) ) ( not ( = ?auto_879430 ?auto_879432 ) ) ( not ( = ?auto_879430 ?auto_879433 ) ) ( not ( = ?auto_879430 ?auto_879434 ) ) ( not ( = ?auto_879430 ?auto_879435 ) ) ( not ( = ?auto_879430 ?auto_879436 ) ) ( not ( = ?auto_879430 ?auto_879437 ) ) ( not ( = ?auto_879430 ?auto_879438 ) ) ( not ( = ?auto_879430 ?auto_879439 ) ) ( not ( = ?auto_879430 ?auto_879440 ) ) ( not ( = ?auto_879430 ?auto_879441 ) ) ( not ( = ?auto_879430 ?auto_879442 ) ) ( not ( = ?auto_879430 ?auto_879443 ) ) ( not ( = ?auto_879430 ?auto_879444 ) ) ( not ( = ?auto_879430 ?auto_879445 ) ) ( not ( = ?auto_879431 ?auto_879432 ) ) ( not ( = ?auto_879431 ?auto_879433 ) ) ( not ( = ?auto_879431 ?auto_879434 ) ) ( not ( = ?auto_879431 ?auto_879435 ) ) ( not ( = ?auto_879431 ?auto_879436 ) ) ( not ( = ?auto_879431 ?auto_879437 ) ) ( not ( = ?auto_879431 ?auto_879438 ) ) ( not ( = ?auto_879431 ?auto_879439 ) ) ( not ( = ?auto_879431 ?auto_879440 ) ) ( not ( = ?auto_879431 ?auto_879441 ) ) ( not ( = ?auto_879431 ?auto_879442 ) ) ( not ( = ?auto_879431 ?auto_879443 ) ) ( not ( = ?auto_879431 ?auto_879444 ) ) ( not ( = ?auto_879431 ?auto_879445 ) ) ( not ( = ?auto_879432 ?auto_879433 ) ) ( not ( = ?auto_879432 ?auto_879434 ) ) ( not ( = ?auto_879432 ?auto_879435 ) ) ( not ( = ?auto_879432 ?auto_879436 ) ) ( not ( = ?auto_879432 ?auto_879437 ) ) ( not ( = ?auto_879432 ?auto_879438 ) ) ( not ( = ?auto_879432 ?auto_879439 ) ) ( not ( = ?auto_879432 ?auto_879440 ) ) ( not ( = ?auto_879432 ?auto_879441 ) ) ( not ( = ?auto_879432 ?auto_879442 ) ) ( not ( = ?auto_879432 ?auto_879443 ) ) ( not ( = ?auto_879432 ?auto_879444 ) ) ( not ( = ?auto_879432 ?auto_879445 ) ) ( not ( = ?auto_879433 ?auto_879434 ) ) ( not ( = ?auto_879433 ?auto_879435 ) ) ( not ( = ?auto_879433 ?auto_879436 ) ) ( not ( = ?auto_879433 ?auto_879437 ) ) ( not ( = ?auto_879433 ?auto_879438 ) ) ( not ( = ?auto_879433 ?auto_879439 ) ) ( not ( = ?auto_879433 ?auto_879440 ) ) ( not ( = ?auto_879433 ?auto_879441 ) ) ( not ( = ?auto_879433 ?auto_879442 ) ) ( not ( = ?auto_879433 ?auto_879443 ) ) ( not ( = ?auto_879433 ?auto_879444 ) ) ( not ( = ?auto_879433 ?auto_879445 ) ) ( not ( = ?auto_879434 ?auto_879435 ) ) ( not ( = ?auto_879434 ?auto_879436 ) ) ( not ( = ?auto_879434 ?auto_879437 ) ) ( not ( = ?auto_879434 ?auto_879438 ) ) ( not ( = ?auto_879434 ?auto_879439 ) ) ( not ( = ?auto_879434 ?auto_879440 ) ) ( not ( = ?auto_879434 ?auto_879441 ) ) ( not ( = ?auto_879434 ?auto_879442 ) ) ( not ( = ?auto_879434 ?auto_879443 ) ) ( not ( = ?auto_879434 ?auto_879444 ) ) ( not ( = ?auto_879434 ?auto_879445 ) ) ( not ( = ?auto_879435 ?auto_879436 ) ) ( not ( = ?auto_879435 ?auto_879437 ) ) ( not ( = ?auto_879435 ?auto_879438 ) ) ( not ( = ?auto_879435 ?auto_879439 ) ) ( not ( = ?auto_879435 ?auto_879440 ) ) ( not ( = ?auto_879435 ?auto_879441 ) ) ( not ( = ?auto_879435 ?auto_879442 ) ) ( not ( = ?auto_879435 ?auto_879443 ) ) ( not ( = ?auto_879435 ?auto_879444 ) ) ( not ( = ?auto_879435 ?auto_879445 ) ) ( not ( = ?auto_879436 ?auto_879437 ) ) ( not ( = ?auto_879436 ?auto_879438 ) ) ( not ( = ?auto_879436 ?auto_879439 ) ) ( not ( = ?auto_879436 ?auto_879440 ) ) ( not ( = ?auto_879436 ?auto_879441 ) ) ( not ( = ?auto_879436 ?auto_879442 ) ) ( not ( = ?auto_879436 ?auto_879443 ) ) ( not ( = ?auto_879436 ?auto_879444 ) ) ( not ( = ?auto_879436 ?auto_879445 ) ) ( not ( = ?auto_879437 ?auto_879438 ) ) ( not ( = ?auto_879437 ?auto_879439 ) ) ( not ( = ?auto_879437 ?auto_879440 ) ) ( not ( = ?auto_879437 ?auto_879441 ) ) ( not ( = ?auto_879437 ?auto_879442 ) ) ( not ( = ?auto_879437 ?auto_879443 ) ) ( not ( = ?auto_879437 ?auto_879444 ) ) ( not ( = ?auto_879437 ?auto_879445 ) ) ( not ( = ?auto_879438 ?auto_879439 ) ) ( not ( = ?auto_879438 ?auto_879440 ) ) ( not ( = ?auto_879438 ?auto_879441 ) ) ( not ( = ?auto_879438 ?auto_879442 ) ) ( not ( = ?auto_879438 ?auto_879443 ) ) ( not ( = ?auto_879438 ?auto_879444 ) ) ( not ( = ?auto_879438 ?auto_879445 ) ) ( not ( = ?auto_879439 ?auto_879440 ) ) ( not ( = ?auto_879439 ?auto_879441 ) ) ( not ( = ?auto_879439 ?auto_879442 ) ) ( not ( = ?auto_879439 ?auto_879443 ) ) ( not ( = ?auto_879439 ?auto_879444 ) ) ( not ( = ?auto_879439 ?auto_879445 ) ) ( not ( = ?auto_879440 ?auto_879441 ) ) ( not ( = ?auto_879440 ?auto_879442 ) ) ( not ( = ?auto_879440 ?auto_879443 ) ) ( not ( = ?auto_879440 ?auto_879444 ) ) ( not ( = ?auto_879440 ?auto_879445 ) ) ( not ( = ?auto_879441 ?auto_879442 ) ) ( not ( = ?auto_879441 ?auto_879443 ) ) ( not ( = ?auto_879441 ?auto_879444 ) ) ( not ( = ?auto_879441 ?auto_879445 ) ) ( not ( = ?auto_879442 ?auto_879443 ) ) ( not ( = ?auto_879442 ?auto_879444 ) ) ( not ( = ?auto_879442 ?auto_879445 ) ) ( not ( = ?auto_879443 ?auto_879444 ) ) ( not ( = ?auto_879443 ?auto_879445 ) ) ( not ( = ?auto_879444 ?auto_879445 ) ) ( ON ?auto_879444 ?auto_879445 ) ( ON ?auto_879443 ?auto_879444 ) ( ON ?auto_879442 ?auto_879443 ) ( CLEAR ?auto_879440 ) ( ON ?auto_879441 ?auto_879442 ) ( CLEAR ?auto_879441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_879428 ?auto_879429 ?auto_879430 ?auto_879431 ?auto_879432 ?auto_879433 ?auto_879434 ?auto_879435 ?auto_879436 ?auto_879437 ?auto_879438 ?auto_879439 ?auto_879440 ?auto_879441 )
      ( MAKE-18PILE ?auto_879428 ?auto_879429 ?auto_879430 ?auto_879431 ?auto_879432 ?auto_879433 ?auto_879434 ?auto_879435 ?auto_879436 ?auto_879437 ?auto_879438 ?auto_879439 ?auto_879440 ?auto_879441 ?auto_879442 ?auto_879443 ?auto_879444 ?auto_879445 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_879464 - BLOCK
      ?auto_879465 - BLOCK
      ?auto_879466 - BLOCK
      ?auto_879467 - BLOCK
      ?auto_879468 - BLOCK
      ?auto_879469 - BLOCK
      ?auto_879470 - BLOCK
      ?auto_879471 - BLOCK
      ?auto_879472 - BLOCK
      ?auto_879473 - BLOCK
      ?auto_879474 - BLOCK
      ?auto_879475 - BLOCK
      ?auto_879476 - BLOCK
      ?auto_879477 - BLOCK
      ?auto_879478 - BLOCK
      ?auto_879479 - BLOCK
      ?auto_879480 - BLOCK
      ?auto_879481 - BLOCK
    )
    :vars
    (
      ?auto_879482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_879481 ?auto_879482 ) ( ON-TABLE ?auto_879464 ) ( ON ?auto_879465 ?auto_879464 ) ( ON ?auto_879466 ?auto_879465 ) ( ON ?auto_879467 ?auto_879466 ) ( ON ?auto_879468 ?auto_879467 ) ( ON ?auto_879469 ?auto_879468 ) ( ON ?auto_879470 ?auto_879469 ) ( ON ?auto_879471 ?auto_879470 ) ( ON ?auto_879472 ?auto_879471 ) ( ON ?auto_879473 ?auto_879472 ) ( ON ?auto_879474 ?auto_879473 ) ( ON ?auto_879475 ?auto_879474 ) ( not ( = ?auto_879464 ?auto_879465 ) ) ( not ( = ?auto_879464 ?auto_879466 ) ) ( not ( = ?auto_879464 ?auto_879467 ) ) ( not ( = ?auto_879464 ?auto_879468 ) ) ( not ( = ?auto_879464 ?auto_879469 ) ) ( not ( = ?auto_879464 ?auto_879470 ) ) ( not ( = ?auto_879464 ?auto_879471 ) ) ( not ( = ?auto_879464 ?auto_879472 ) ) ( not ( = ?auto_879464 ?auto_879473 ) ) ( not ( = ?auto_879464 ?auto_879474 ) ) ( not ( = ?auto_879464 ?auto_879475 ) ) ( not ( = ?auto_879464 ?auto_879476 ) ) ( not ( = ?auto_879464 ?auto_879477 ) ) ( not ( = ?auto_879464 ?auto_879478 ) ) ( not ( = ?auto_879464 ?auto_879479 ) ) ( not ( = ?auto_879464 ?auto_879480 ) ) ( not ( = ?auto_879464 ?auto_879481 ) ) ( not ( = ?auto_879464 ?auto_879482 ) ) ( not ( = ?auto_879465 ?auto_879466 ) ) ( not ( = ?auto_879465 ?auto_879467 ) ) ( not ( = ?auto_879465 ?auto_879468 ) ) ( not ( = ?auto_879465 ?auto_879469 ) ) ( not ( = ?auto_879465 ?auto_879470 ) ) ( not ( = ?auto_879465 ?auto_879471 ) ) ( not ( = ?auto_879465 ?auto_879472 ) ) ( not ( = ?auto_879465 ?auto_879473 ) ) ( not ( = ?auto_879465 ?auto_879474 ) ) ( not ( = ?auto_879465 ?auto_879475 ) ) ( not ( = ?auto_879465 ?auto_879476 ) ) ( not ( = ?auto_879465 ?auto_879477 ) ) ( not ( = ?auto_879465 ?auto_879478 ) ) ( not ( = ?auto_879465 ?auto_879479 ) ) ( not ( = ?auto_879465 ?auto_879480 ) ) ( not ( = ?auto_879465 ?auto_879481 ) ) ( not ( = ?auto_879465 ?auto_879482 ) ) ( not ( = ?auto_879466 ?auto_879467 ) ) ( not ( = ?auto_879466 ?auto_879468 ) ) ( not ( = ?auto_879466 ?auto_879469 ) ) ( not ( = ?auto_879466 ?auto_879470 ) ) ( not ( = ?auto_879466 ?auto_879471 ) ) ( not ( = ?auto_879466 ?auto_879472 ) ) ( not ( = ?auto_879466 ?auto_879473 ) ) ( not ( = ?auto_879466 ?auto_879474 ) ) ( not ( = ?auto_879466 ?auto_879475 ) ) ( not ( = ?auto_879466 ?auto_879476 ) ) ( not ( = ?auto_879466 ?auto_879477 ) ) ( not ( = ?auto_879466 ?auto_879478 ) ) ( not ( = ?auto_879466 ?auto_879479 ) ) ( not ( = ?auto_879466 ?auto_879480 ) ) ( not ( = ?auto_879466 ?auto_879481 ) ) ( not ( = ?auto_879466 ?auto_879482 ) ) ( not ( = ?auto_879467 ?auto_879468 ) ) ( not ( = ?auto_879467 ?auto_879469 ) ) ( not ( = ?auto_879467 ?auto_879470 ) ) ( not ( = ?auto_879467 ?auto_879471 ) ) ( not ( = ?auto_879467 ?auto_879472 ) ) ( not ( = ?auto_879467 ?auto_879473 ) ) ( not ( = ?auto_879467 ?auto_879474 ) ) ( not ( = ?auto_879467 ?auto_879475 ) ) ( not ( = ?auto_879467 ?auto_879476 ) ) ( not ( = ?auto_879467 ?auto_879477 ) ) ( not ( = ?auto_879467 ?auto_879478 ) ) ( not ( = ?auto_879467 ?auto_879479 ) ) ( not ( = ?auto_879467 ?auto_879480 ) ) ( not ( = ?auto_879467 ?auto_879481 ) ) ( not ( = ?auto_879467 ?auto_879482 ) ) ( not ( = ?auto_879468 ?auto_879469 ) ) ( not ( = ?auto_879468 ?auto_879470 ) ) ( not ( = ?auto_879468 ?auto_879471 ) ) ( not ( = ?auto_879468 ?auto_879472 ) ) ( not ( = ?auto_879468 ?auto_879473 ) ) ( not ( = ?auto_879468 ?auto_879474 ) ) ( not ( = ?auto_879468 ?auto_879475 ) ) ( not ( = ?auto_879468 ?auto_879476 ) ) ( not ( = ?auto_879468 ?auto_879477 ) ) ( not ( = ?auto_879468 ?auto_879478 ) ) ( not ( = ?auto_879468 ?auto_879479 ) ) ( not ( = ?auto_879468 ?auto_879480 ) ) ( not ( = ?auto_879468 ?auto_879481 ) ) ( not ( = ?auto_879468 ?auto_879482 ) ) ( not ( = ?auto_879469 ?auto_879470 ) ) ( not ( = ?auto_879469 ?auto_879471 ) ) ( not ( = ?auto_879469 ?auto_879472 ) ) ( not ( = ?auto_879469 ?auto_879473 ) ) ( not ( = ?auto_879469 ?auto_879474 ) ) ( not ( = ?auto_879469 ?auto_879475 ) ) ( not ( = ?auto_879469 ?auto_879476 ) ) ( not ( = ?auto_879469 ?auto_879477 ) ) ( not ( = ?auto_879469 ?auto_879478 ) ) ( not ( = ?auto_879469 ?auto_879479 ) ) ( not ( = ?auto_879469 ?auto_879480 ) ) ( not ( = ?auto_879469 ?auto_879481 ) ) ( not ( = ?auto_879469 ?auto_879482 ) ) ( not ( = ?auto_879470 ?auto_879471 ) ) ( not ( = ?auto_879470 ?auto_879472 ) ) ( not ( = ?auto_879470 ?auto_879473 ) ) ( not ( = ?auto_879470 ?auto_879474 ) ) ( not ( = ?auto_879470 ?auto_879475 ) ) ( not ( = ?auto_879470 ?auto_879476 ) ) ( not ( = ?auto_879470 ?auto_879477 ) ) ( not ( = ?auto_879470 ?auto_879478 ) ) ( not ( = ?auto_879470 ?auto_879479 ) ) ( not ( = ?auto_879470 ?auto_879480 ) ) ( not ( = ?auto_879470 ?auto_879481 ) ) ( not ( = ?auto_879470 ?auto_879482 ) ) ( not ( = ?auto_879471 ?auto_879472 ) ) ( not ( = ?auto_879471 ?auto_879473 ) ) ( not ( = ?auto_879471 ?auto_879474 ) ) ( not ( = ?auto_879471 ?auto_879475 ) ) ( not ( = ?auto_879471 ?auto_879476 ) ) ( not ( = ?auto_879471 ?auto_879477 ) ) ( not ( = ?auto_879471 ?auto_879478 ) ) ( not ( = ?auto_879471 ?auto_879479 ) ) ( not ( = ?auto_879471 ?auto_879480 ) ) ( not ( = ?auto_879471 ?auto_879481 ) ) ( not ( = ?auto_879471 ?auto_879482 ) ) ( not ( = ?auto_879472 ?auto_879473 ) ) ( not ( = ?auto_879472 ?auto_879474 ) ) ( not ( = ?auto_879472 ?auto_879475 ) ) ( not ( = ?auto_879472 ?auto_879476 ) ) ( not ( = ?auto_879472 ?auto_879477 ) ) ( not ( = ?auto_879472 ?auto_879478 ) ) ( not ( = ?auto_879472 ?auto_879479 ) ) ( not ( = ?auto_879472 ?auto_879480 ) ) ( not ( = ?auto_879472 ?auto_879481 ) ) ( not ( = ?auto_879472 ?auto_879482 ) ) ( not ( = ?auto_879473 ?auto_879474 ) ) ( not ( = ?auto_879473 ?auto_879475 ) ) ( not ( = ?auto_879473 ?auto_879476 ) ) ( not ( = ?auto_879473 ?auto_879477 ) ) ( not ( = ?auto_879473 ?auto_879478 ) ) ( not ( = ?auto_879473 ?auto_879479 ) ) ( not ( = ?auto_879473 ?auto_879480 ) ) ( not ( = ?auto_879473 ?auto_879481 ) ) ( not ( = ?auto_879473 ?auto_879482 ) ) ( not ( = ?auto_879474 ?auto_879475 ) ) ( not ( = ?auto_879474 ?auto_879476 ) ) ( not ( = ?auto_879474 ?auto_879477 ) ) ( not ( = ?auto_879474 ?auto_879478 ) ) ( not ( = ?auto_879474 ?auto_879479 ) ) ( not ( = ?auto_879474 ?auto_879480 ) ) ( not ( = ?auto_879474 ?auto_879481 ) ) ( not ( = ?auto_879474 ?auto_879482 ) ) ( not ( = ?auto_879475 ?auto_879476 ) ) ( not ( = ?auto_879475 ?auto_879477 ) ) ( not ( = ?auto_879475 ?auto_879478 ) ) ( not ( = ?auto_879475 ?auto_879479 ) ) ( not ( = ?auto_879475 ?auto_879480 ) ) ( not ( = ?auto_879475 ?auto_879481 ) ) ( not ( = ?auto_879475 ?auto_879482 ) ) ( not ( = ?auto_879476 ?auto_879477 ) ) ( not ( = ?auto_879476 ?auto_879478 ) ) ( not ( = ?auto_879476 ?auto_879479 ) ) ( not ( = ?auto_879476 ?auto_879480 ) ) ( not ( = ?auto_879476 ?auto_879481 ) ) ( not ( = ?auto_879476 ?auto_879482 ) ) ( not ( = ?auto_879477 ?auto_879478 ) ) ( not ( = ?auto_879477 ?auto_879479 ) ) ( not ( = ?auto_879477 ?auto_879480 ) ) ( not ( = ?auto_879477 ?auto_879481 ) ) ( not ( = ?auto_879477 ?auto_879482 ) ) ( not ( = ?auto_879478 ?auto_879479 ) ) ( not ( = ?auto_879478 ?auto_879480 ) ) ( not ( = ?auto_879478 ?auto_879481 ) ) ( not ( = ?auto_879478 ?auto_879482 ) ) ( not ( = ?auto_879479 ?auto_879480 ) ) ( not ( = ?auto_879479 ?auto_879481 ) ) ( not ( = ?auto_879479 ?auto_879482 ) ) ( not ( = ?auto_879480 ?auto_879481 ) ) ( not ( = ?auto_879480 ?auto_879482 ) ) ( not ( = ?auto_879481 ?auto_879482 ) ) ( ON ?auto_879480 ?auto_879481 ) ( ON ?auto_879479 ?auto_879480 ) ( ON ?auto_879478 ?auto_879479 ) ( ON ?auto_879477 ?auto_879478 ) ( CLEAR ?auto_879475 ) ( ON ?auto_879476 ?auto_879477 ) ( CLEAR ?auto_879476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_879464 ?auto_879465 ?auto_879466 ?auto_879467 ?auto_879468 ?auto_879469 ?auto_879470 ?auto_879471 ?auto_879472 ?auto_879473 ?auto_879474 ?auto_879475 ?auto_879476 )
      ( MAKE-18PILE ?auto_879464 ?auto_879465 ?auto_879466 ?auto_879467 ?auto_879468 ?auto_879469 ?auto_879470 ?auto_879471 ?auto_879472 ?auto_879473 ?auto_879474 ?auto_879475 ?auto_879476 ?auto_879477 ?auto_879478 ?auto_879479 ?auto_879480 ?auto_879481 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_879501 - BLOCK
      ?auto_879502 - BLOCK
      ?auto_879503 - BLOCK
      ?auto_879504 - BLOCK
      ?auto_879505 - BLOCK
      ?auto_879506 - BLOCK
      ?auto_879507 - BLOCK
      ?auto_879508 - BLOCK
      ?auto_879509 - BLOCK
      ?auto_879510 - BLOCK
      ?auto_879511 - BLOCK
      ?auto_879512 - BLOCK
      ?auto_879513 - BLOCK
      ?auto_879514 - BLOCK
      ?auto_879515 - BLOCK
      ?auto_879516 - BLOCK
      ?auto_879517 - BLOCK
      ?auto_879518 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_879518 ) ( ON-TABLE ?auto_879501 ) ( ON ?auto_879502 ?auto_879501 ) ( ON ?auto_879503 ?auto_879502 ) ( ON ?auto_879504 ?auto_879503 ) ( ON ?auto_879505 ?auto_879504 ) ( ON ?auto_879506 ?auto_879505 ) ( ON ?auto_879507 ?auto_879506 ) ( ON ?auto_879508 ?auto_879507 ) ( ON ?auto_879509 ?auto_879508 ) ( ON ?auto_879510 ?auto_879509 ) ( ON ?auto_879511 ?auto_879510 ) ( ON ?auto_879512 ?auto_879511 ) ( not ( = ?auto_879501 ?auto_879502 ) ) ( not ( = ?auto_879501 ?auto_879503 ) ) ( not ( = ?auto_879501 ?auto_879504 ) ) ( not ( = ?auto_879501 ?auto_879505 ) ) ( not ( = ?auto_879501 ?auto_879506 ) ) ( not ( = ?auto_879501 ?auto_879507 ) ) ( not ( = ?auto_879501 ?auto_879508 ) ) ( not ( = ?auto_879501 ?auto_879509 ) ) ( not ( = ?auto_879501 ?auto_879510 ) ) ( not ( = ?auto_879501 ?auto_879511 ) ) ( not ( = ?auto_879501 ?auto_879512 ) ) ( not ( = ?auto_879501 ?auto_879513 ) ) ( not ( = ?auto_879501 ?auto_879514 ) ) ( not ( = ?auto_879501 ?auto_879515 ) ) ( not ( = ?auto_879501 ?auto_879516 ) ) ( not ( = ?auto_879501 ?auto_879517 ) ) ( not ( = ?auto_879501 ?auto_879518 ) ) ( not ( = ?auto_879502 ?auto_879503 ) ) ( not ( = ?auto_879502 ?auto_879504 ) ) ( not ( = ?auto_879502 ?auto_879505 ) ) ( not ( = ?auto_879502 ?auto_879506 ) ) ( not ( = ?auto_879502 ?auto_879507 ) ) ( not ( = ?auto_879502 ?auto_879508 ) ) ( not ( = ?auto_879502 ?auto_879509 ) ) ( not ( = ?auto_879502 ?auto_879510 ) ) ( not ( = ?auto_879502 ?auto_879511 ) ) ( not ( = ?auto_879502 ?auto_879512 ) ) ( not ( = ?auto_879502 ?auto_879513 ) ) ( not ( = ?auto_879502 ?auto_879514 ) ) ( not ( = ?auto_879502 ?auto_879515 ) ) ( not ( = ?auto_879502 ?auto_879516 ) ) ( not ( = ?auto_879502 ?auto_879517 ) ) ( not ( = ?auto_879502 ?auto_879518 ) ) ( not ( = ?auto_879503 ?auto_879504 ) ) ( not ( = ?auto_879503 ?auto_879505 ) ) ( not ( = ?auto_879503 ?auto_879506 ) ) ( not ( = ?auto_879503 ?auto_879507 ) ) ( not ( = ?auto_879503 ?auto_879508 ) ) ( not ( = ?auto_879503 ?auto_879509 ) ) ( not ( = ?auto_879503 ?auto_879510 ) ) ( not ( = ?auto_879503 ?auto_879511 ) ) ( not ( = ?auto_879503 ?auto_879512 ) ) ( not ( = ?auto_879503 ?auto_879513 ) ) ( not ( = ?auto_879503 ?auto_879514 ) ) ( not ( = ?auto_879503 ?auto_879515 ) ) ( not ( = ?auto_879503 ?auto_879516 ) ) ( not ( = ?auto_879503 ?auto_879517 ) ) ( not ( = ?auto_879503 ?auto_879518 ) ) ( not ( = ?auto_879504 ?auto_879505 ) ) ( not ( = ?auto_879504 ?auto_879506 ) ) ( not ( = ?auto_879504 ?auto_879507 ) ) ( not ( = ?auto_879504 ?auto_879508 ) ) ( not ( = ?auto_879504 ?auto_879509 ) ) ( not ( = ?auto_879504 ?auto_879510 ) ) ( not ( = ?auto_879504 ?auto_879511 ) ) ( not ( = ?auto_879504 ?auto_879512 ) ) ( not ( = ?auto_879504 ?auto_879513 ) ) ( not ( = ?auto_879504 ?auto_879514 ) ) ( not ( = ?auto_879504 ?auto_879515 ) ) ( not ( = ?auto_879504 ?auto_879516 ) ) ( not ( = ?auto_879504 ?auto_879517 ) ) ( not ( = ?auto_879504 ?auto_879518 ) ) ( not ( = ?auto_879505 ?auto_879506 ) ) ( not ( = ?auto_879505 ?auto_879507 ) ) ( not ( = ?auto_879505 ?auto_879508 ) ) ( not ( = ?auto_879505 ?auto_879509 ) ) ( not ( = ?auto_879505 ?auto_879510 ) ) ( not ( = ?auto_879505 ?auto_879511 ) ) ( not ( = ?auto_879505 ?auto_879512 ) ) ( not ( = ?auto_879505 ?auto_879513 ) ) ( not ( = ?auto_879505 ?auto_879514 ) ) ( not ( = ?auto_879505 ?auto_879515 ) ) ( not ( = ?auto_879505 ?auto_879516 ) ) ( not ( = ?auto_879505 ?auto_879517 ) ) ( not ( = ?auto_879505 ?auto_879518 ) ) ( not ( = ?auto_879506 ?auto_879507 ) ) ( not ( = ?auto_879506 ?auto_879508 ) ) ( not ( = ?auto_879506 ?auto_879509 ) ) ( not ( = ?auto_879506 ?auto_879510 ) ) ( not ( = ?auto_879506 ?auto_879511 ) ) ( not ( = ?auto_879506 ?auto_879512 ) ) ( not ( = ?auto_879506 ?auto_879513 ) ) ( not ( = ?auto_879506 ?auto_879514 ) ) ( not ( = ?auto_879506 ?auto_879515 ) ) ( not ( = ?auto_879506 ?auto_879516 ) ) ( not ( = ?auto_879506 ?auto_879517 ) ) ( not ( = ?auto_879506 ?auto_879518 ) ) ( not ( = ?auto_879507 ?auto_879508 ) ) ( not ( = ?auto_879507 ?auto_879509 ) ) ( not ( = ?auto_879507 ?auto_879510 ) ) ( not ( = ?auto_879507 ?auto_879511 ) ) ( not ( = ?auto_879507 ?auto_879512 ) ) ( not ( = ?auto_879507 ?auto_879513 ) ) ( not ( = ?auto_879507 ?auto_879514 ) ) ( not ( = ?auto_879507 ?auto_879515 ) ) ( not ( = ?auto_879507 ?auto_879516 ) ) ( not ( = ?auto_879507 ?auto_879517 ) ) ( not ( = ?auto_879507 ?auto_879518 ) ) ( not ( = ?auto_879508 ?auto_879509 ) ) ( not ( = ?auto_879508 ?auto_879510 ) ) ( not ( = ?auto_879508 ?auto_879511 ) ) ( not ( = ?auto_879508 ?auto_879512 ) ) ( not ( = ?auto_879508 ?auto_879513 ) ) ( not ( = ?auto_879508 ?auto_879514 ) ) ( not ( = ?auto_879508 ?auto_879515 ) ) ( not ( = ?auto_879508 ?auto_879516 ) ) ( not ( = ?auto_879508 ?auto_879517 ) ) ( not ( = ?auto_879508 ?auto_879518 ) ) ( not ( = ?auto_879509 ?auto_879510 ) ) ( not ( = ?auto_879509 ?auto_879511 ) ) ( not ( = ?auto_879509 ?auto_879512 ) ) ( not ( = ?auto_879509 ?auto_879513 ) ) ( not ( = ?auto_879509 ?auto_879514 ) ) ( not ( = ?auto_879509 ?auto_879515 ) ) ( not ( = ?auto_879509 ?auto_879516 ) ) ( not ( = ?auto_879509 ?auto_879517 ) ) ( not ( = ?auto_879509 ?auto_879518 ) ) ( not ( = ?auto_879510 ?auto_879511 ) ) ( not ( = ?auto_879510 ?auto_879512 ) ) ( not ( = ?auto_879510 ?auto_879513 ) ) ( not ( = ?auto_879510 ?auto_879514 ) ) ( not ( = ?auto_879510 ?auto_879515 ) ) ( not ( = ?auto_879510 ?auto_879516 ) ) ( not ( = ?auto_879510 ?auto_879517 ) ) ( not ( = ?auto_879510 ?auto_879518 ) ) ( not ( = ?auto_879511 ?auto_879512 ) ) ( not ( = ?auto_879511 ?auto_879513 ) ) ( not ( = ?auto_879511 ?auto_879514 ) ) ( not ( = ?auto_879511 ?auto_879515 ) ) ( not ( = ?auto_879511 ?auto_879516 ) ) ( not ( = ?auto_879511 ?auto_879517 ) ) ( not ( = ?auto_879511 ?auto_879518 ) ) ( not ( = ?auto_879512 ?auto_879513 ) ) ( not ( = ?auto_879512 ?auto_879514 ) ) ( not ( = ?auto_879512 ?auto_879515 ) ) ( not ( = ?auto_879512 ?auto_879516 ) ) ( not ( = ?auto_879512 ?auto_879517 ) ) ( not ( = ?auto_879512 ?auto_879518 ) ) ( not ( = ?auto_879513 ?auto_879514 ) ) ( not ( = ?auto_879513 ?auto_879515 ) ) ( not ( = ?auto_879513 ?auto_879516 ) ) ( not ( = ?auto_879513 ?auto_879517 ) ) ( not ( = ?auto_879513 ?auto_879518 ) ) ( not ( = ?auto_879514 ?auto_879515 ) ) ( not ( = ?auto_879514 ?auto_879516 ) ) ( not ( = ?auto_879514 ?auto_879517 ) ) ( not ( = ?auto_879514 ?auto_879518 ) ) ( not ( = ?auto_879515 ?auto_879516 ) ) ( not ( = ?auto_879515 ?auto_879517 ) ) ( not ( = ?auto_879515 ?auto_879518 ) ) ( not ( = ?auto_879516 ?auto_879517 ) ) ( not ( = ?auto_879516 ?auto_879518 ) ) ( not ( = ?auto_879517 ?auto_879518 ) ) ( ON ?auto_879517 ?auto_879518 ) ( ON ?auto_879516 ?auto_879517 ) ( ON ?auto_879515 ?auto_879516 ) ( ON ?auto_879514 ?auto_879515 ) ( CLEAR ?auto_879512 ) ( ON ?auto_879513 ?auto_879514 ) ( CLEAR ?auto_879513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_879501 ?auto_879502 ?auto_879503 ?auto_879504 ?auto_879505 ?auto_879506 ?auto_879507 ?auto_879508 ?auto_879509 ?auto_879510 ?auto_879511 ?auto_879512 ?auto_879513 )
      ( MAKE-18PILE ?auto_879501 ?auto_879502 ?auto_879503 ?auto_879504 ?auto_879505 ?auto_879506 ?auto_879507 ?auto_879508 ?auto_879509 ?auto_879510 ?auto_879511 ?auto_879512 ?auto_879513 ?auto_879514 ?auto_879515 ?auto_879516 ?auto_879517 ?auto_879518 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_879537 - BLOCK
      ?auto_879538 - BLOCK
      ?auto_879539 - BLOCK
      ?auto_879540 - BLOCK
      ?auto_879541 - BLOCK
      ?auto_879542 - BLOCK
      ?auto_879543 - BLOCK
      ?auto_879544 - BLOCK
      ?auto_879545 - BLOCK
      ?auto_879546 - BLOCK
      ?auto_879547 - BLOCK
      ?auto_879548 - BLOCK
      ?auto_879549 - BLOCK
      ?auto_879550 - BLOCK
      ?auto_879551 - BLOCK
      ?auto_879552 - BLOCK
      ?auto_879553 - BLOCK
      ?auto_879554 - BLOCK
    )
    :vars
    (
      ?auto_879555 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_879554 ?auto_879555 ) ( ON-TABLE ?auto_879537 ) ( ON ?auto_879538 ?auto_879537 ) ( ON ?auto_879539 ?auto_879538 ) ( ON ?auto_879540 ?auto_879539 ) ( ON ?auto_879541 ?auto_879540 ) ( ON ?auto_879542 ?auto_879541 ) ( ON ?auto_879543 ?auto_879542 ) ( ON ?auto_879544 ?auto_879543 ) ( ON ?auto_879545 ?auto_879544 ) ( ON ?auto_879546 ?auto_879545 ) ( ON ?auto_879547 ?auto_879546 ) ( not ( = ?auto_879537 ?auto_879538 ) ) ( not ( = ?auto_879537 ?auto_879539 ) ) ( not ( = ?auto_879537 ?auto_879540 ) ) ( not ( = ?auto_879537 ?auto_879541 ) ) ( not ( = ?auto_879537 ?auto_879542 ) ) ( not ( = ?auto_879537 ?auto_879543 ) ) ( not ( = ?auto_879537 ?auto_879544 ) ) ( not ( = ?auto_879537 ?auto_879545 ) ) ( not ( = ?auto_879537 ?auto_879546 ) ) ( not ( = ?auto_879537 ?auto_879547 ) ) ( not ( = ?auto_879537 ?auto_879548 ) ) ( not ( = ?auto_879537 ?auto_879549 ) ) ( not ( = ?auto_879537 ?auto_879550 ) ) ( not ( = ?auto_879537 ?auto_879551 ) ) ( not ( = ?auto_879537 ?auto_879552 ) ) ( not ( = ?auto_879537 ?auto_879553 ) ) ( not ( = ?auto_879537 ?auto_879554 ) ) ( not ( = ?auto_879537 ?auto_879555 ) ) ( not ( = ?auto_879538 ?auto_879539 ) ) ( not ( = ?auto_879538 ?auto_879540 ) ) ( not ( = ?auto_879538 ?auto_879541 ) ) ( not ( = ?auto_879538 ?auto_879542 ) ) ( not ( = ?auto_879538 ?auto_879543 ) ) ( not ( = ?auto_879538 ?auto_879544 ) ) ( not ( = ?auto_879538 ?auto_879545 ) ) ( not ( = ?auto_879538 ?auto_879546 ) ) ( not ( = ?auto_879538 ?auto_879547 ) ) ( not ( = ?auto_879538 ?auto_879548 ) ) ( not ( = ?auto_879538 ?auto_879549 ) ) ( not ( = ?auto_879538 ?auto_879550 ) ) ( not ( = ?auto_879538 ?auto_879551 ) ) ( not ( = ?auto_879538 ?auto_879552 ) ) ( not ( = ?auto_879538 ?auto_879553 ) ) ( not ( = ?auto_879538 ?auto_879554 ) ) ( not ( = ?auto_879538 ?auto_879555 ) ) ( not ( = ?auto_879539 ?auto_879540 ) ) ( not ( = ?auto_879539 ?auto_879541 ) ) ( not ( = ?auto_879539 ?auto_879542 ) ) ( not ( = ?auto_879539 ?auto_879543 ) ) ( not ( = ?auto_879539 ?auto_879544 ) ) ( not ( = ?auto_879539 ?auto_879545 ) ) ( not ( = ?auto_879539 ?auto_879546 ) ) ( not ( = ?auto_879539 ?auto_879547 ) ) ( not ( = ?auto_879539 ?auto_879548 ) ) ( not ( = ?auto_879539 ?auto_879549 ) ) ( not ( = ?auto_879539 ?auto_879550 ) ) ( not ( = ?auto_879539 ?auto_879551 ) ) ( not ( = ?auto_879539 ?auto_879552 ) ) ( not ( = ?auto_879539 ?auto_879553 ) ) ( not ( = ?auto_879539 ?auto_879554 ) ) ( not ( = ?auto_879539 ?auto_879555 ) ) ( not ( = ?auto_879540 ?auto_879541 ) ) ( not ( = ?auto_879540 ?auto_879542 ) ) ( not ( = ?auto_879540 ?auto_879543 ) ) ( not ( = ?auto_879540 ?auto_879544 ) ) ( not ( = ?auto_879540 ?auto_879545 ) ) ( not ( = ?auto_879540 ?auto_879546 ) ) ( not ( = ?auto_879540 ?auto_879547 ) ) ( not ( = ?auto_879540 ?auto_879548 ) ) ( not ( = ?auto_879540 ?auto_879549 ) ) ( not ( = ?auto_879540 ?auto_879550 ) ) ( not ( = ?auto_879540 ?auto_879551 ) ) ( not ( = ?auto_879540 ?auto_879552 ) ) ( not ( = ?auto_879540 ?auto_879553 ) ) ( not ( = ?auto_879540 ?auto_879554 ) ) ( not ( = ?auto_879540 ?auto_879555 ) ) ( not ( = ?auto_879541 ?auto_879542 ) ) ( not ( = ?auto_879541 ?auto_879543 ) ) ( not ( = ?auto_879541 ?auto_879544 ) ) ( not ( = ?auto_879541 ?auto_879545 ) ) ( not ( = ?auto_879541 ?auto_879546 ) ) ( not ( = ?auto_879541 ?auto_879547 ) ) ( not ( = ?auto_879541 ?auto_879548 ) ) ( not ( = ?auto_879541 ?auto_879549 ) ) ( not ( = ?auto_879541 ?auto_879550 ) ) ( not ( = ?auto_879541 ?auto_879551 ) ) ( not ( = ?auto_879541 ?auto_879552 ) ) ( not ( = ?auto_879541 ?auto_879553 ) ) ( not ( = ?auto_879541 ?auto_879554 ) ) ( not ( = ?auto_879541 ?auto_879555 ) ) ( not ( = ?auto_879542 ?auto_879543 ) ) ( not ( = ?auto_879542 ?auto_879544 ) ) ( not ( = ?auto_879542 ?auto_879545 ) ) ( not ( = ?auto_879542 ?auto_879546 ) ) ( not ( = ?auto_879542 ?auto_879547 ) ) ( not ( = ?auto_879542 ?auto_879548 ) ) ( not ( = ?auto_879542 ?auto_879549 ) ) ( not ( = ?auto_879542 ?auto_879550 ) ) ( not ( = ?auto_879542 ?auto_879551 ) ) ( not ( = ?auto_879542 ?auto_879552 ) ) ( not ( = ?auto_879542 ?auto_879553 ) ) ( not ( = ?auto_879542 ?auto_879554 ) ) ( not ( = ?auto_879542 ?auto_879555 ) ) ( not ( = ?auto_879543 ?auto_879544 ) ) ( not ( = ?auto_879543 ?auto_879545 ) ) ( not ( = ?auto_879543 ?auto_879546 ) ) ( not ( = ?auto_879543 ?auto_879547 ) ) ( not ( = ?auto_879543 ?auto_879548 ) ) ( not ( = ?auto_879543 ?auto_879549 ) ) ( not ( = ?auto_879543 ?auto_879550 ) ) ( not ( = ?auto_879543 ?auto_879551 ) ) ( not ( = ?auto_879543 ?auto_879552 ) ) ( not ( = ?auto_879543 ?auto_879553 ) ) ( not ( = ?auto_879543 ?auto_879554 ) ) ( not ( = ?auto_879543 ?auto_879555 ) ) ( not ( = ?auto_879544 ?auto_879545 ) ) ( not ( = ?auto_879544 ?auto_879546 ) ) ( not ( = ?auto_879544 ?auto_879547 ) ) ( not ( = ?auto_879544 ?auto_879548 ) ) ( not ( = ?auto_879544 ?auto_879549 ) ) ( not ( = ?auto_879544 ?auto_879550 ) ) ( not ( = ?auto_879544 ?auto_879551 ) ) ( not ( = ?auto_879544 ?auto_879552 ) ) ( not ( = ?auto_879544 ?auto_879553 ) ) ( not ( = ?auto_879544 ?auto_879554 ) ) ( not ( = ?auto_879544 ?auto_879555 ) ) ( not ( = ?auto_879545 ?auto_879546 ) ) ( not ( = ?auto_879545 ?auto_879547 ) ) ( not ( = ?auto_879545 ?auto_879548 ) ) ( not ( = ?auto_879545 ?auto_879549 ) ) ( not ( = ?auto_879545 ?auto_879550 ) ) ( not ( = ?auto_879545 ?auto_879551 ) ) ( not ( = ?auto_879545 ?auto_879552 ) ) ( not ( = ?auto_879545 ?auto_879553 ) ) ( not ( = ?auto_879545 ?auto_879554 ) ) ( not ( = ?auto_879545 ?auto_879555 ) ) ( not ( = ?auto_879546 ?auto_879547 ) ) ( not ( = ?auto_879546 ?auto_879548 ) ) ( not ( = ?auto_879546 ?auto_879549 ) ) ( not ( = ?auto_879546 ?auto_879550 ) ) ( not ( = ?auto_879546 ?auto_879551 ) ) ( not ( = ?auto_879546 ?auto_879552 ) ) ( not ( = ?auto_879546 ?auto_879553 ) ) ( not ( = ?auto_879546 ?auto_879554 ) ) ( not ( = ?auto_879546 ?auto_879555 ) ) ( not ( = ?auto_879547 ?auto_879548 ) ) ( not ( = ?auto_879547 ?auto_879549 ) ) ( not ( = ?auto_879547 ?auto_879550 ) ) ( not ( = ?auto_879547 ?auto_879551 ) ) ( not ( = ?auto_879547 ?auto_879552 ) ) ( not ( = ?auto_879547 ?auto_879553 ) ) ( not ( = ?auto_879547 ?auto_879554 ) ) ( not ( = ?auto_879547 ?auto_879555 ) ) ( not ( = ?auto_879548 ?auto_879549 ) ) ( not ( = ?auto_879548 ?auto_879550 ) ) ( not ( = ?auto_879548 ?auto_879551 ) ) ( not ( = ?auto_879548 ?auto_879552 ) ) ( not ( = ?auto_879548 ?auto_879553 ) ) ( not ( = ?auto_879548 ?auto_879554 ) ) ( not ( = ?auto_879548 ?auto_879555 ) ) ( not ( = ?auto_879549 ?auto_879550 ) ) ( not ( = ?auto_879549 ?auto_879551 ) ) ( not ( = ?auto_879549 ?auto_879552 ) ) ( not ( = ?auto_879549 ?auto_879553 ) ) ( not ( = ?auto_879549 ?auto_879554 ) ) ( not ( = ?auto_879549 ?auto_879555 ) ) ( not ( = ?auto_879550 ?auto_879551 ) ) ( not ( = ?auto_879550 ?auto_879552 ) ) ( not ( = ?auto_879550 ?auto_879553 ) ) ( not ( = ?auto_879550 ?auto_879554 ) ) ( not ( = ?auto_879550 ?auto_879555 ) ) ( not ( = ?auto_879551 ?auto_879552 ) ) ( not ( = ?auto_879551 ?auto_879553 ) ) ( not ( = ?auto_879551 ?auto_879554 ) ) ( not ( = ?auto_879551 ?auto_879555 ) ) ( not ( = ?auto_879552 ?auto_879553 ) ) ( not ( = ?auto_879552 ?auto_879554 ) ) ( not ( = ?auto_879552 ?auto_879555 ) ) ( not ( = ?auto_879553 ?auto_879554 ) ) ( not ( = ?auto_879553 ?auto_879555 ) ) ( not ( = ?auto_879554 ?auto_879555 ) ) ( ON ?auto_879553 ?auto_879554 ) ( ON ?auto_879552 ?auto_879553 ) ( ON ?auto_879551 ?auto_879552 ) ( ON ?auto_879550 ?auto_879551 ) ( ON ?auto_879549 ?auto_879550 ) ( CLEAR ?auto_879547 ) ( ON ?auto_879548 ?auto_879549 ) ( CLEAR ?auto_879548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_879537 ?auto_879538 ?auto_879539 ?auto_879540 ?auto_879541 ?auto_879542 ?auto_879543 ?auto_879544 ?auto_879545 ?auto_879546 ?auto_879547 ?auto_879548 )
      ( MAKE-18PILE ?auto_879537 ?auto_879538 ?auto_879539 ?auto_879540 ?auto_879541 ?auto_879542 ?auto_879543 ?auto_879544 ?auto_879545 ?auto_879546 ?auto_879547 ?auto_879548 ?auto_879549 ?auto_879550 ?auto_879551 ?auto_879552 ?auto_879553 ?auto_879554 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_879574 - BLOCK
      ?auto_879575 - BLOCK
      ?auto_879576 - BLOCK
      ?auto_879577 - BLOCK
      ?auto_879578 - BLOCK
      ?auto_879579 - BLOCK
      ?auto_879580 - BLOCK
      ?auto_879581 - BLOCK
      ?auto_879582 - BLOCK
      ?auto_879583 - BLOCK
      ?auto_879584 - BLOCK
      ?auto_879585 - BLOCK
      ?auto_879586 - BLOCK
      ?auto_879587 - BLOCK
      ?auto_879588 - BLOCK
      ?auto_879589 - BLOCK
      ?auto_879590 - BLOCK
      ?auto_879591 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_879591 ) ( ON-TABLE ?auto_879574 ) ( ON ?auto_879575 ?auto_879574 ) ( ON ?auto_879576 ?auto_879575 ) ( ON ?auto_879577 ?auto_879576 ) ( ON ?auto_879578 ?auto_879577 ) ( ON ?auto_879579 ?auto_879578 ) ( ON ?auto_879580 ?auto_879579 ) ( ON ?auto_879581 ?auto_879580 ) ( ON ?auto_879582 ?auto_879581 ) ( ON ?auto_879583 ?auto_879582 ) ( ON ?auto_879584 ?auto_879583 ) ( not ( = ?auto_879574 ?auto_879575 ) ) ( not ( = ?auto_879574 ?auto_879576 ) ) ( not ( = ?auto_879574 ?auto_879577 ) ) ( not ( = ?auto_879574 ?auto_879578 ) ) ( not ( = ?auto_879574 ?auto_879579 ) ) ( not ( = ?auto_879574 ?auto_879580 ) ) ( not ( = ?auto_879574 ?auto_879581 ) ) ( not ( = ?auto_879574 ?auto_879582 ) ) ( not ( = ?auto_879574 ?auto_879583 ) ) ( not ( = ?auto_879574 ?auto_879584 ) ) ( not ( = ?auto_879574 ?auto_879585 ) ) ( not ( = ?auto_879574 ?auto_879586 ) ) ( not ( = ?auto_879574 ?auto_879587 ) ) ( not ( = ?auto_879574 ?auto_879588 ) ) ( not ( = ?auto_879574 ?auto_879589 ) ) ( not ( = ?auto_879574 ?auto_879590 ) ) ( not ( = ?auto_879574 ?auto_879591 ) ) ( not ( = ?auto_879575 ?auto_879576 ) ) ( not ( = ?auto_879575 ?auto_879577 ) ) ( not ( = ?auto_879575 ?auto_879578 ) ) ( not ( = ?auto_879575 ?auto_879579 ) ) ( not ( = ?auto_879575 ?auto_879580 ) ) ( not ( = ?auto_879575 ?auto_879581 ) ) ( not ( = ?auto_879575 ?auto_879582 ) ) ( not ( = ?auto_879575 ?auto_879583 ) ) ( not ( = ?auto_879575 ?auto_879584 ) ) ( not ( = ?auto_879575 ?auto_879585 ) ) ( not ( = ?auto_879575 ?auto_879586 ) ) ( not ( = ?auto_879575 ?auto_879587 ) ) ( not ( = ?auto_879575 ?auto_879588 ) ) ( not ( = ?auto_879575 ?auto_879589 ) ) ( not ( = ?auto_879575 ?auto_879590 ) ) ( not ( = ?auto_879575 ?auto_879591 ) ) ( not ( = ?auto_879576 ?auto_879577 ) ) ( not ( = ?auto_879576 ?auto_879578 ) ) ( not ( = ?auto_879576 ?auto_879579 ) ) ( not ( = ?auto_879576 ?auto_879580 ) ) ( not ( = ?auto_879576 ?auto_879581 ) ) ( not ( = ?auto_879576 ?auto_879582 ) ) ( not ( = ?auto_879576 ?auto_879583 ) ) ( not ( = ?auto_879576 ?auto_879584 ) ) ( not ( = ?auto_879576 ?auto_879585 ) ) ( not ( = ?auto_879576 ?auto_879586 ) ) ( not ( = ?auto_879576 ?auto_879587 ) ) ( not ( = ?auto_879576 ?auto_879588 ) ) ( not ( = ?auto_879576 ?auto_879589 ) ) ( not ( = ?auto_879576 ?auto_879590 ) ) ( not ( = ?auto_879576 ?auto_879591 ) ) ( not ( = ?auto_879577 ?auto_879578 ) ) ( not ( = ?auto_879577 ?auto_879579 ) ) ( not ( = ?auto_879577 ?auto_879580 ) ) ( not ( = ?auto_879577 ?auto_879581 ) ) ( not ( = ?auto_879577 ?auto_879582 ) ) ( not ( = ?auto_879577 ?auto_879583 ) ) ( not ( = ?auto_879577 ?auto_879584 ) ) ( not ( = ?auto_879577 ?auto_879585 ) ) ( not ( = ?auto_879577 ?auto_879586 ) ) ( not ( = ?auto_879577 ?auto_879587 ) ) ( not ( = ?auto_879577 ?auto_879588 ) ) ( not ( = ?auto_879577 ?auto_879589 ) ) ( not ( = ?auto_879577 ?auto_879590 ) ) ( not ( = ?auto_879577 ?auto_879591 ) ) ( not ( = ?auto_879578 ?auto_879579 ) ) ( not ( = ?auto_879578 ?auto_879580 ) ) ( not ( = ?auto_879578 ?auto_879581 ) ) ( not ( = ?auto_879578 ?auto_879582 ) ) ( not ( = ?auto_879578 ?auto_879583 ) ) ( not ( = ?auto_879578 ?auto_879584 ) ) ( not ( = ?auto_879578 ?auto_879585 ) ) ( not ( = ?auto_879578 ?auto_879586 ) ) ( not ( = ?auto_879578 ?auto_879587 ) ) ( not ( = ?auto_879578 ?auto_879588 ) ) ( not ( = ?auto_879578 ?auto_879589 ) ) ( not ( = ?auto_879578 ?auto_879590 ) ) ( not ( = ?auto_879578 ?auto_879591 ) ) ( not ( = ?auto_879579 ?auto_879580 ) ) ( not ( = ?auto_879579 ?auto_879581 ) ) ( not ( = ?auto_879579 ?auto_879582 ) ) ( not ( = ?auto_879579 ?auto_879583 ) ) ( not ( = ?auto_879579 ?auto_879584 ) ) ( not ( = ?auto_879579 ?auto_879585 ) ) ( not ( = ?auto_879579 ?auto_879586 ) ) ( not ( = ?auto_879579 ?auto_879587 ) ) ( not ( = ?auto_879579 ?auto_879588 ) ) ( not ( = ?auto_879579 ?auto_879589 ) ) ( not ( = ?auto_879579 ?auto_879590 ) ) ( not ( = ?auto_879579 ?auto_879591 ) ) ( not ( = ?auto_879580 ?auto_879581 ) ) ( not ( = ?auto_879580 ?auto_879582 ) ) ( not ( = ?auto_879580 ?auto_879583 ) ) ( not ( = ?auto_879580 ?auto_879584 ) ) ( not ( = ?auto_879580 ?auto_879585 ) ) ( not ( = ?auto_879580 ?auto_879586 ) ) ( not ( = ?auto_879580 ?auto_879587 ) ) ( not ( = ?auto_879580 ?auto_879588 ) ) ( not ( = ?auto_879580 ?auto_879589 ) ) ( not ( = ?auto_879580 ?auto_879590 ) ) ( not ( = ?auto_879580 ?auto_879591 ) ) ( not ( = ?auto_879581 ?auto_879582 ) ) ( not ( = ?auto_879581 ?auto_879583 ) ) ( not ( = ?auto_879581 ?auto_879584 ) ) ( not ( = ?auto_879581 ?auto_879585 ) ) ( not ( = ?auto_879581 ?auto_879586 ) ) ( not ( = ?auto_879581 ?auto_879587 ) ) ( not ( = ?auto_879581 ?auto_879588 ) ) ( not ( = ?auto_879581 ?auto_879589 ) ) ( not ( = ?auto_879581 ?auto_879590 ) ) ( not ( = ?auto_879581 ?auto_879591 ) ) ( not ( = ?auto_879582 ?auto_879583 ) ) ( not ( = ?auto_879582 ?auto_879584 ) ) ( not ( = ?auto_879582 ?auto_879585 ) ) ( not ( = ?auto_879582 ?auto_879586 ) ) ( not ( = ?auto_879582 ?auto_879587 ) ) ( not ( = ?auto_879582 ?auto_879588 ) ) ( not ( = ?auto_879582 ?auto_879589 ) ) ( not ( = ?auto_879582 ?auto_879590 ) ) ( not ( = ?auto_879582 ?auto_879591 ) ) ( not ( = ?auto_879583 ?auto_879584 ) ) ( not ( = ?auto_879583 ?auto_879585 ) ) ( not ( = ?auto_879583 ?auto_879586 ) ) ( not ( = ?auto_879583 ?auto_879587 ) ) ( not ( = ?auto_879583 ?auto_879588 ) ) ( not ( = ?auto_879583 ?auto_879589 ) ) ( not ( = ?auto_879583 ?auto_879590 ) ) ( not ( = ?auto_879583 ?auto_879591 ) ) ( not ( = ?auto_879584 ?auto_879585 ) ) ( not ( = ?auto_879584 ?auto_879586 ) ) ( not ( = ?auto_879584 ?auto_879587 ) ) ( not ( = ?auto_879584 ?auto_879588 ) ) ( not ( = ?auto_879584 ?auto_879589 ) ) ( not ( = ?auto_879584 ?auto_879590 ) ) ( not ( = ?auto_879584 ?auto_879591 ) ) ( not ( = ?auto_879585 ?auto_879586 ) ) ( not ( = ?auto_879585 ?auto_879587 ) ) ( not ( = ?auto_879585 ?auto_879588 ) ) ( not ( = ?auto_879585 ?auto_879589 ) ) ( not ( = ?auto_879585 ?auto_879590 ) ) ( not ( = ?auto_879585 ?auto_879591 ) ) ( not ( = ?auto_879586 ?auto_879587 ) ) ( not ( = ?auto_879586 ?auto_879588 ) ) ( not ( = ?auto_879586 ?auto_879589 ) ) ( not ( = ?auto_879586 ?auto_879590 ) ) ( not ( = ?auto_879586 ?auto_879591 ) ) ( not ( = ?auto_879587 ?auto_879588 ) ) ( not ( = ?auto_879587 ?auto_879589 ) ) ( not ( = ?auto_879587 ?auto_879590 ) ) ( not ( = ?auto_879587 ?auto_879591 ) ) ( not ( = ?auto_879588 ?auto_879589 ) ) ( not ( = ?auto_879588 ?auto_879590 ) ) ( not ( = ?auto_879588 ?auto_879591 ) ) ( not ( = ?auto_879589 ?auto_879590 ) ) ( not ( = ?auto_879589 ?auto_879591 ) ) ( not ( = ?auto_879590 ?auto_879591 ) ) ( ON ?auto_879590 ?auto_879591 ) ( ON ?auto_879589 ?auto_879590 ) ( ON ?auto_879588 ?auto_879589 ) ( ON ?auto_879587 ?auto_879588 ) ( ON ?auto_879586 ?auto_879587 ) ( CLEAR ?auto_879584 ) ( ON ?auto_879585 ?auto_879586 ) ( CLEAR ?auto_879585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_879574 ?auto_879575 ?auto_879576 ?auto_879577 ?auto_879578 ?auto_879579 ?auto_879580 ?auto_879581 ?auto_879582 ?auto_879583 ?auto_879584 ?auto_879585 )
      ( MAKE-18PILE ?auto_879574 ?auto_879575 ?auto_879576 ?auto_879577 ?auto_879578 ?auto_879579 ?auto_879580 ?auto_879581 ?auto_879582 ?auto_879583 ?auto_879584 ?auto_879585 ?auto_879586 ?auto_879587 ?auto_879588 ?auto_879589 ?auto_879590 ?auto_879591 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_879610 - BLOCK
      ?auto_879611 - BLOCK
      ?auto_879612 - BLOCK
      ?auto_879613 - BLOCK
      ?auto_879614 - BLOCK
      ?auto_879615 - BLOCK
      ?auto_879616 - BLOCK
      ?auto_879617 - BLOCK
      ?auto_879618 - BLOCK
      ?auto_879619 - BLOCK
      ?auto_879620 - BLOCK
      ?auto_879621 - BLOCK
      ?auto_879622 - BLOCK
      ?auto_879623 - BLOCK
      ?auto_879624 - BLOCK
      ?auto_879625 - BLOCK
      ?auto_879626 - BLOCK
      ?auto_879627 - BLOCK
    )
    :vars
    (
      ?auto_879628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_879627 ?auto_879628 ) ( ON-TABLE ?auto_879610 ) ( ON ?auto_879611 ?auto_879610 ) ( ON ?auto_879612 ?auto_879611 ) ( ON ?auto_879613 ?auto_879612 ) ( ON ?auto_879614 ?auto_879613 ) ( ON ?auto_879615 ?auto_879614 ) ( ON ?auto_879616 ?auto_879615 ) ( ON ?auto_879617 ?auto_879616 ) ( ON ?auto_879618 ?auto_879617 ) ( ON ?auto_879619 ?auto_879618 ) ( not ( = ?auto_879610 ?auto_879611 ) ) ( not ( = ?auto_879610 ?auto_879612 ) ) ( not ( = ?auto_879610 ?auto_879613 ) ) ( not ( = ?auto_879610 ?auto_879614 ) ) ( not ( = ?auto_879610 ?auto_879615 ) ) ( not ( = ?auto_879610 ?auto_879616 ) ) ( not ( = ?auto_879610 ?auto_879617 ) ) ( not ( = ?auto_879610 ?auto_879618 ) ) ( not ( = ?auto_879610 ?auto_879619 ) ) ( not ( = ?auto_879610 ?auto_879620 ) ) ( not ( = ?auto_879610 ?auto_879621 ) ) ( not ( = ?auto_879610 ?auto_879622 ) ) ( not ( = ?auto_879610 ?auto_879623 ) ) ( not ( = ?auto_879610 ?auto_879624 ) ) ( not ( = ?auto_879610 ?auto_879625 ) ) ( not ( = ?auto_879610 ?auto_879626 ) ) ( not ( = ?auto_879610 ?auto_879627 ) ) ( not ( = ?auto_879610 ?auto_879628 ) ) ( not ( = ?auto_879611 ?auto_879612 ) ) ( not ( = ?auto_879611 ?auto_879613 ) ) ( not ( = ?auto_879611 ?auto_879614 ) ) ( not ( = ?auto_879611 ?auto_879615 ) ) ( not ( = ?auto_879611 ?auto_879616 ) ) ( not ( = ?auto_879611 ?auto_879617 ) ) ( not ( = ?auto_879611 ?auto_879618 ) ) ( not ( = ?auto_879611 ?auto_879619 ) ) ( not ( = ?auto_879611 ?auto_879620 ) ) ( not ( = ?auto_879611 ?auto_879621 ) ) ( not ( = ?auto_879611 ?auto_879622 ) ) ( not ( = ?auto_879611 ?auto_879623 ) ) ( not ( = ?auto_879611 ?auto_879624 ) ) ( not ( = ?auto_879611 ?auto_879625 ) ) ( not ( = ?auto_879611 ?auto_879626 ) ) ( not ( = ?auto_879611 ?auto_879627 ) ) ( not ( = ?auto_879611 ?auto_879628 ) ) ( not ( = ?auto_879612 ?auto_879613 ) ) ( not ( = ?auto_879612 ?auto_879614 ) ) ( not ( = ?auto_879612 ?auto_879615 ) ) ( not ( = ?auto_879612 ?auto_879616 ) ) ( not ( = ?auto_879612 ?auto_879617 ) ) ( not ( = ?auto_879612 ?auto_879618 ) ) ( not ( = ?auto_879612 ?auto_879619 ) ) ( not ( = ?auto_879612 ?auto_879620 ) ) ( not ( = ?auto_879612 ?auto_879621 ) ) ( not ( = ?auto_879612 ?auto_879622 ) ) ( not ( = ?auto_879612 ?auto_879623 ) ) ( not ( = ?auto_879612 ?auto_879624 ) ) ( not ( = ?auto_879612 ?auto_879625 ) ) ( not ( = ?auto_879612 ?auto_879626 ) ) ( not ( = ?auto_879612 ?auto_879627 ) ) ( not ( = ?auto_879612 ?auto_879628 ) ) ( not ( = ?auto_879613 ?auto_879614 ) ) ( not ( = ?auto_879613 ?auto_879615 ) ) ( not ( = ?auto_879613 ?auto_879616 ) ) ( not ( = ?auto_879613 ?auto_879617 ) ) ( not ( = ?auto_879613 ?auto_879618 ) ) ( not ( = ?auto_879613 ?auto_879619 ) ) ( not ( = ?auto_879613 ?auto_879620 ) ) ( not ( = ?auto_879613 ?auto_879621 ) ) ( not ( = ?auto_879613 ?auto_879622 ) ) ( not ( = ?auto_879613 ?auto_879623 ) ) ( not ( = ?auto_879613 ?auto_879624 ) ) ( not ( = ?auto_879613 ?auto_879625 ) ) ( not ( = ?auto_879613 ?auto_879626 ) ) ( not ( = ?auto_879613 ?auto_879627 ) ) ( not ( = ?auto_879613 ?auto_879628 ) ) ( not ( = ?auto_879614 ?auto_879615 ) ) ( not ( = ?auto_879614 ?auto_879616 ) ) ( not ( = ?auto_879614 ?auto_879617 ) ) ( not ( = ?auto_879614 ?auto_879618 ) ) ( not ( = ?auto_879614 ?auto_879619 ) ) ( not ( = ?auto_879614 ?auto_879620 ) ) ( not ( = ?auto_879614 ?auto_879621 ) ) ( not ( = ?auto_879614 ?auto_879622 ) ) ( not ( = ?auto_879614 ?auto_879623 ) ) ( not ( = ?auto_879614 ?auto_879624 ) ) ( not ( = ?auto_879614 ?auto_879625 ) ) ( not ( = ?auto_879614 ?auto_879626 ) ) ( not ( = ?auto_879614 ?auto_879627 ) ) ( not ( = ?auto_879614 ?auto_879628 ) ) ( not ( = ?auto_879615 ?auto_879616 ) ) ( not ( = ?auto_879615 ?auto_879617 ) ) ( not ( = ?auto_879615 ?auto_879618 ) ) ( not ( = ?auto_879615 ?auto_879619 ) ) ( not ( = ?auto_879615 ?auto_879620 ) ) ( not ( = ?auto_879615 ?auto_879621 ) ) ( not ( = ?auto_879615 ?auto_879622 ) ) ( not ( = ?auto_879615 ?auto_879623 ) ) ( not ( = ?auto_879615 ?auto_879624 ) ) ( not ( = ?auto_879615 ?auto_879625 ) ) ( not ( = ?auto_879615 ?auto_879626 ) ) ( not ( = ?auto_879615 ?auto_879627 ) ) ( not ( = ?auto_879615 ?auto_879628 ) ) ( not ( = ?auto_879616 ?auto_879617 ) ) ( not ( = ?auto_879616 ?auto_879618 ) ) ( not ( = ?auto_879616 ?auto_879619 ) ) ( not ( = ?auto_879616 ?auto_879620 ) ) ( not ( = ?auto_879616 ?auto_879621 ) ) ( not ( = ?auto_879616 ?auto_879622 ) ) ( not ( = ?auto_879616 ?auto_879623 ) ) ( not ( = ?auto_879616 ?auto_879624 ) ) ( not ( = ?auto_879616 ?auto_879625 ) ) ( not ( = ?auto_879616 ?auto_879626 ) ) ( not ( = ?auto_879616 ?auto_879627 ) ) ( not ( = ?auto_879616 ?auto_879628 ) ) ( not ( = ?auto_879617 ?auto_879618 ) ) ( not ( = ?auto_879617 ?auto_879619 ) ) ( not ( = ?auto_879617 ?auto_879620 ) ) ( not ( = ?auto_879617 ?auto_879621 ) ) ( not ( = ?auto_879617 ?auto_879622 ) ) ( not ( = ?auto_879617 ?auto_879623 ) ) ( not ( = ?auto_879617 ?auto_879624 ) ) ( not ( = ?auto_879617 ?auto_879625 ) ) ( not ( = ?auto_879617 ?auto_879626 ) ) ( not ( = ?auto_879617 ?auto_879627 ) ) ( not ( = ?auto_879617 ?auto_879628 ) ) ( not ( = ?auto_879618 ?auto_879619 ) ) ( not ( = ?auto_879618 ?auto_879620 ) ) ( not ( = ?auto_879618 ?auto_879621 ) ) ( not ( = ?auto_879618 ?auto_879622 ) ) ( not ( = ?auto_879618 ?auto_879623 ) ) ( not ( = ?auto_879618 ?auto_879624 ) ) ( not ( = ?auto_879618 ?auto_879625 ) ) ( not ( = ?auto_879618 ?auto_879626 ) ) ( not ( = ?auto_879618 ?auto_879627 ) ) ( not ( = ?auto_879618 ?auto_879628 ) ) ( not ( = ?auto_879619 ?auto_879620 ) ) ( not ( = ?auto_879619 ?auto_879621 ) ) ( not ( = ?auto_879619 ?auto_879622 ) ) ( not ( = ?auto_879619 ?auto_879623 ) ) ( not ( = ?auto_879619 ?auto_879624 ) ) ( not ( = ?auto_879619 ?auto_879625 ) ) ( not ( = ?auto_879619 ?auto_879626 ) ) ( not ( = ?auto_879619 ?auto_879627 ) ) ( not ( = ?auto_879619 ?auto_879628 ) ) ( not ( = ?auto_879620 ?auto_879621 ) ) ( not ( = ?auto_879620 ?auto_879622 ) ) ( not ( = ?auto_879620 ?auto_879623 ) ) ( not ( = ?auto_879620 ?auto_879624 ) ) ( not ( = ?auto_879620 ?auto_879625 ) ) ( not ( = ?auto_879620 ?auto_879626 ) ) ( not ( = ?auto_879620 ?auto_879627 ) ) ( not ( = ?auto_879620 ?auto_879628 ) ) ( not ( = ?auto_879621 ?auto_879622 ) ) ( not ( = ?auto_879621 ?auto_879623 ) ) ( not ( = ?auto_879621 ?auto_879624 ) ) ( not ( = ?auto_879621 ?auto_879625 ) ) ( not ( = ?auto_879621 ?auto_879626 ) ) ( not ( = ?auto_879621 ?auto_879627 ) ) ( not ( = ?auto_879621 ?auto_879628 ) ) ( not ( = ?auto_879622 ?auto_879623 ) ) ( not ( = ?auto_879622 ?auto_879624 ) ) ( not ( = ?auto_879622 ?auto_879625 ) ) ( not ( = ?auto_879622 ?auto_879626 ) ) ( not ( = ?auto_879622 ?auto_879627 ) ) ( not ( = ?auto_879622 ?auto_879628 ) ) ( not ( = ?auto_879623 ?auto_879624 ) ) ( not ( = ?auto_879623 ?auto_879625 ) ) ( not ( = ?auto_879623 ?auto_879626 ) ) ( not ( = ?auto_879623 ?auto_879627 ) ) ( not ( = ?auto_879623 ?auto_879628 ) ) ( not ( = ?auto_879624 ?auto_879625 ) ) ( not ( = ?auto_879624 ?auto_879626 ) ) ( not ( = ?auto_879624 ?auto_879627 ) ) ( not ( = ?auto_879624 ?auto_879628 ) ) ( not ( = ?auto_879625 ?auto_879626 ) ) ( not ( = ?auto_879625 ?auto_879627 ) ) ( not ( = ?auto_879625 ?auto_879628 ) ) ( not ( = ?auto_879626 ?auto_879627 ) ) ( not ( = ?auto_879626 ?auto_879628 ) ) ( not ( = ?auto_879627 ?auto_879628 ) ) ( ON ?auto_879626 ?auto_879627 ) ( ON ?auto_879625 ?auto_879626 ) ( ON ?auto_879624 ?auto_879625 ) ( ON ?auto_879623 ?auto_879624 ) ( ON ?auto_879622 ?auto_879623 ) ( ON ?auto_879621 ?auto_879622 ) ( CLEAR ?auto_879619 ) ( ON ?auto_879620 ?auto_879621 ) ( CLEAR ?auto_879620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_879610 ?auto_879611 ?auto_879612 ?auto_879613 ?auto_879614 ?auto_879615 ?auto_879616 ?auto_879617 ?auto_879618 ?auto_879619 ?auto_879620 )
      ( MAKE-18PILE ?auto_879610 ?auto_879611 ?auto_879612 ?auto_879613 ?auto_879614 ?auto_879615 ?auto_879616 ?auto_879617 ?auto_879618 ?auto_879619 ?auto_879620 ?auto_879621 ?auto_879622 ?auto_879623 ?auto_879624 ?auto_879625 ?auto_879626 ?auto_879627 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_879647 - BLOCK
      ?auto_879648 - BLOCK
      ?auto_879649 - BLOCK
      ?auto_879650 - BLOCK
      ?auto_879651 - BLOCK
      ?auto_879652 - BLOCK
      ?auto_879653 - BLOCK
      ?auto_879654 - BLOCK
      ?auto_879655 - BLOCK
      ?auto_879656 - BLOCK
      ?auto_879657 - BLOCK
      ?auto_879658 - BLOCK
      ?auto_879659 - BLOCK
      ?auto_879660 - BLOCK
      ?auto_879661 - BLOCK
      ?auto_879662 - BLOCK
      ?auto_879663 - BLOCK
      ?auto_879664 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_879664 ) ( ON-TABLE ?auto_879647 ) ( ON ?auto_879648 ?auto_879647 ) ( ON ?auto_879649 ?auto_879648 ) ( ON ?auto_879650 ?auto_879649 ) ( ON ?auto_879651 ?auto_879650 ) ( ON ?auto_879652 ?auto_879651 ) ( ON ?auto_879653 ?auto_879652 ) ( ON ?auto_879654 ?auto_879653 ) ( ON ?auto_879655 ?auto_879654 ) ( ON ?auto_879656 ?auto_879655 ) ( not ( = ?auto_879647 ?auto_879648 ) ) ( not ( = ?auto_879647 ?auto_879649 ) ) ( not ( = ?auto_879647 ?auto_879650 ) ) ( not ( = ?auto_879647 ?auto_879651 ) ) ( not ( = ?auto_879647 ?auto_879652 ) ) ( not ( = ?auto_879647 ?auto_879653 ) ) ( not ( = ?auto_879647 ?auto_879654 ) ) ( not ( = ?auto_879647 ?auto_879655 ) ) ( not ( = ?auto_879647 ?auto_879656 ) ) ( not ( = ?auto_879647 ?auto_879657 ) ) ( not ( = ?auto_879647 ?auto_879658 ) ) ( not ( = ?auto_879647 ?auto_879659 ) ) ( not ( = ?auto_879647 ?auto_879660 ) ) ( not ( = ?auto_879647 ?auto_879661 ) ) ( not ( = ?auto_879647 ?auto_879662 ) ) ( not ( = ?auto_879647 ?auto_879663 ) ) ( not ( = ?auto_879647 ?auto_879664 ) ) ( not ( = ?auto_879648 ?auto_879649 ) ) ( not ( = ?auto_879648 ?auto_879650 ) ) ( not ( = ?auto_879648 ?auto_879651 ) ) ( not ( = ?auto_879648 ?auto_879652 ) ) ( not ( = ?auto_879648 ?auto_879653 ) ) ( not ( = ?auto_879648 ?auto_879654 ) ) ( not ( = ?auto_879648 ?auto_879655 ) ) ( not ( = ?auto_879648 ?auto_879656 ) ) ( not ( = ?auto_879648 ?auto_879657 ) ) ( not ( = ?auto_879648 ?auto_879658 ) ) ( not ( = ?auto_879648 ?auto_879659 ) ) ( not ( = ?auto_879648 ?auto_879660 ) ) ( not ( = ?auto_879648 ?auto_879661 ) ) ( not ( = ?auto_879648 ?auto_879662 ) ) ( not ( = ?auto_879648 ?auto_879663 ) ) ( not ( = ?auto_879648 ?auto_879664 ) ) ( not ( = ?auto_879649 ?auto_879650 ) ) ( not ( = ?auto_879649 ?auto_879651 ) ) ( not ( = ?auto_879649 ?auto_879652 ) ) ( not ( = ?auto_879649 ?auto_879653 ) ) ( not ( = ?auto_879649 ?auto_879654 ) ) ( not ( = ?auto_879649 ?auto_879655 ) ) ( not ( = ?auto_879649 ?auto_879656 ) ) ( not ( = ?auto_879649 ?auto_879657 ) ) ( not ( = ?auto_879649 ?auto_879658 ) ) ( not ( = ?auto_879649 ?auto_879659 ) ) ( not ( = ?auto_879649 ?auto_879660 ) ) ( not ( = ?auto_879649 ?auto_879661 ) ) ( not ( = ?auto_879649 ?auto_879662 ) ) ( not ( = ?auto_879649 ?auto_879663 ) ) ( not ( = ?auto_879649 ?auto_879664 ) ) ( not ( = ?auto_879650 ?auto_879651 ) ) ( not ( = ?auto_879650 ?auto_879652 ) ) ( not ( = ?auto_879650 ?auto_879653 ) ) ( not ( = ?auto_879650 ?auto_879654 ) ) ( not ( = ?auto_879650 ?auto_879655 ) ) ( not ( = ?auto_879650 ?auto_879656 ) ) ( not ( = ?auto_879650 ?auto_879657 ) ) ( not ( = ?auto_879650 ?auto_879658 ) ) ( not ( = ?auto_879650 ?auto_879659 ) ) ( not ( = ?auto_879650 ?auto_879660 ) ) ( not ( = ?auto_879650 ?auto_879661 ) ) ( not ( = ?auto_879650 ?auto_879662 ) ) ( not ( = ?auto_879650 ?auto_879663 ) ) ( not ( = ?auto_879650 ?auto_879664 ) ) ( not ( = ?auto_879651 ?auto_879652 ) ) ( not ( = ?auto_879651 ?auto_879653 ) ) ( not ( = ?auto_879651 ?auto_879654 ) ) ( not ( = ?auto_879651 ?auto_879655 ) ) ( not ( = ?auto_879651 ?auto_879656 ) ) ( not ( = ?auto_879651 ?auto_879657 ) ) ( not ( = ?auto_879651 ?auto_879658 ) ) ( not ( = ?auto_879651 ?auto_879659 ) ) ( not ( = ?auto_879651 ?auto_879660 ) ) ( not ( = ?auto_879651 ?auto_879661 ) ) ( not ( = ?auto_879651 ?auto_879662 ) ) ( not ( = ?auto_879651 ?auto_879663 ) ) ( not ( = ?auto_879651 ?auto_879664 ) ) ( not ( = ?auto_879652 ?auto_879653 ) ) ( not ( = ?auto_879652 ?auto_879654 ) ) ( not ( = ?auto_879652 ?auto_879655 ) ) ( not ( = ?auto_879652 ?auto_879656 ) ) ( not ( = ?auto_879652 ?auto_879657 ) ) ( not ( = ?auto_879652 ?auto_879658 ) ) ( not ( = ?auto_879652 ?auto_879659 ) ) ( not ( = ?auto_879652 ?auto_879660 ) ) ( not ( = ?auto_879652 ?auto_879661 ) ) ( not ( = ?auto_879652 ?auto_879662 ) ) ( not ( = ?auto_879652 ?auto_879663 ) ) ( not ( = ?auto_879652 ?auto_879664 ) ) ( not ( = ?auto_879653 ?auto_879654 ) ) ( not ( = ?auto_879653 ?auto_879655 ) ) ( not ( = ?auto_879653 ?auto_879656 ) ) ( not ( = ?auto_879653 ?auto_879657 ) ) ( not ( = ?auto_879653 ?auto_879658 ) ) ( not ( = ?auto_879653 ?auto_879659 ) ) ( not ( = ?auto_879653 ?auto_879660 ) ) ( not ( = ?auto_879653 ?auto_879661 ) ) ( not ( = ?auto_879653 ?auto_879662 ) ) ( not ( = ?auto_879653 ?auto_879663 ) ) ( not ( = ?auto_879653 ?auto_879664 ) ) ( not ( = ?auto_879654 ?auto_879655 ) ) ( not ( = ?auto_879654 ?auto_879656 ) ) ( not ( = ?auto_879654 ?auto_879657 ) ) ( not ( = ?auto_879654 ?auto_879658 ) ) ( not ( = ?auto_879654 ?auto_879659 ) ) ( not ( = ?auto_879654 ?auto_879660 ) ) ( not ( = ?auto_879654 ?auto_879661 ) ) ( not ( = ?auto_879654 ?auto_879662 ) ) ( not ( = ?auto_879654 ?auto_879663 ) ) ( not ( = ?auto_879654 ?auto_879664 ) ) ( not ( = ?auto_879655 ?auto_879656 ) ) ( not ( = ?auto_879655 ?auto_879657 ) ) ( not ( = ?auto_879655 ?auto_879658 ) ) ( not ( = ?auto_879655 ?auto_879659 ) ) ( not ( = ?auto_879655 ?auto_879660 ) ) ( not ( = ?auto_879655 ?auto_879661 ) ) ( not ( = ?auto_879655 ?auto_879662 ) ) ( not ( = ?auto_879655 ?auto_879663 ) ) ( not ( = ?auto_879655 ?auto_879664 ) ) ( not ( = ?auto_879656 ?auto_879657 ) ) ( not ( = ?auto_879656 ?auto_879658 ) ) ( not ( = ?auto_879656 ?auto_879659 ) ) ( not ( = ?auto_879656 ?auto_879660 ) ) ( not ( = ?auto_879656 ?auto_879661 ) ) ( not ( = ?auto_879656 ?auto_879662 ) ) ( not ( = ?auto_879656 ?auto_879663 ) ) ( not ( = ?auto_879656 ?auto_879664 ) ) ( not ( = ?auto_879657 ?auto_879658 ) ) ( not ( = ?auto_879657 ?auto_879659 ) ) ( not ( = ?auto_879657 ?auto_879660 ) ) ( not ( = ?auto_879657 ?auto_879661 ) ) ( not ( = ?auto_879657 ?auto_879662 ) ) ( not ( = ?auto_879657 ?auto_879663 ) ) ( not ( = ?auto_879657 ?auto_879664 ) ) ( not ( = ?auto_879658 ?auto_879659 ) ) ( not ( = ?auto_879658 ?auto_879660 ) ) ( not ( = ?auto_879658 ?auto_879661 ) ) ( not ( = ?auto_879658 ?auto_879662 ) ) ( not ( = ?auto_879658 ?auto_879663 ) ) ( not ( = ?auto_879658 ?auto_879664 ) ) ( not ( = ?auto_879659 ?auto_879660 ) ) ( not ( = ?auto_879659 ?auto_879661 ) ) ( not ( = ?auto_879659 ?auto_879662 ) ) ( not ( = ?auto_879659 ?auto_879663 ) ) ( not ( = ?auto_879659 ?auto_879664 ) ) ( not ( = ?auto_879660 ?auto_879661 ) ) ( not ( = ?auto_879660 ?auto_879662 ) ) ( not ( = ?auto_879660 ?auto_879663 ) ) ( not ( = ?auto_879660 ?auto_879664 ) ) ( not ( = ?auto_879661 ?auto_879662 ) ) ( not ( = ?auto_879661 ?auto_879663 ) ) ( not ( = ?auto_879661 ?auto_879664 ) ) ( not ( = ?auto_879662 ?auto_879663 ) ) ( not ( = ?auto_879662 ?auto_879664 ) ) ( not ( = ?auto_879663 ?auto_879664 ) ) ( ON ?auto_879663 ?auto_879664 ) ( ON ?auto_879662 ?auto_879663 ) ( ON ?auto_879661 ?auto_879662 ) ( ON ?auto_879660 ?auto_879661 ) ( ON ?auto_879659 ?auto_879660 ) ( ON ?auto_879658 ?auto_879659 ) ( CLEAR ?auto_879656 ) ( ON ?auto_879657 ?auto_879658 ) ( CLEAR ?auto_879657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_879647 ?auto_879648 ?auto_879649 ?auto_879650 ?auto_879651 ?auto_879652 ?auto_879653 ?auto_879654 ?auto_879655 ?auto_879656 ?auto_879657 )
      ( MAKE-18PILE ?auto_879647 ?auto_879648 ?auto_879649 ?auto_879650 ?auto_879651 ?auto_879652 ?auto_879653 ?auto_879654 ?auto_879655 ?auto_879656 ?auto_879657 ?auto_879658 ?auto_879659 ?auto_879660 ?auto_879661 ?auto_879662 ?auto_879663 ?auto_879664 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_879683 - BLOCK
      ?auto_879684 - BLOCK
      ?auto_879685 - BLOCK
      ?auto_879686 - BLOCK
      ?auto_879687 - BLOCK
      ?auto_879688 - BLOCK
      ?auto_879689 - BLOCK
      ?auto_879690 - BLOCK
      ?auto_879691 - BLOCK
      ?auto_879692 - BLOCK
      ?auto_879693 - BLOCK
      ?auto_879694 - BLOCK
      ?auto_879695 - BLOCK
      ?auto_879696 - BLOCK
      ?auto_879697 - BLOCK
      ?auto_879698 - BLOCK
      ?auto_879699 - BLOCK
      ?auto_879700 - BLOCK
    )
    :vars
    (
      ?auto_879701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_879700 ?auto_879701 ) ( ON-TABLE ?auto_879683 ) ( ON ?auto_879684 ?auto_879683 ) ( ON ?auto_879685 ?auto_879684 ) ( ON ?auto_879686 ?auto_879685 ) ( ON ?auto_879687 ?auto_879686 ) ( ON ?auto_879688 ?auto_879687 ) ( ON ?auto_879689 ?auto_879688 ) ( ON ?auto_879690 ?auto_879689 ) ( ON ?auto_879691 ?auto_879690 ) ( not ( = ?auto_879683 ?auto_879684 ) ) ( not ( = ?auto_879683 ?auto_879685 ) ) ( not ( = ?auto_879683 ?auto_879686 ) ) ( not ( = ?auto_879683 ?auto_879687 ) ) ( not ( = ?auto_879683 ?auto_879688 ) ) ( not ( = ?auto_879683 ?auto_879689 ) ) ( not ( = ?auto_879683 ?auto_879690 ) ) ( not ( = ?auto_879683 ?auto_879691 ) ) ( not ( = ?auto_879683 ?auto_879692 ) ) ( not ( = ?auto_879683 ?auto_879693 ) ) ( not ( = ?auto_879683 ?auto_879694 ) ) ( not ( = ?auto_879683 ?auto_879695 ) ) ( not ( = ?auto_879683 ?auto_879696 ) ) ( not ( = ?auto_879683 ?auto_879697 ) ) ( not ( = ?auto_879683 ?auto_879698 ) ) ( not ( = ?auto_879683 ?auto_879699 ) ) ( not ( = ?auto_879683 ?auto_879700 ) ) ( not ( = ?auto_879683 ?auto_879701 ) ) ( not ( = ?auto_879684 ?auto_879685 ) ) ( not ( = ?auto_879684 ?auto_879686 ) ) ( not ( = ?auto_879684 ?auto_879687 ) ) ( not ( = ?auto_879684 ?auto_879688 ) ) ( not ( = ?auto_879684 ?auto_879689 ) ) ( not ( = ?auto_879684 ?auto_879690 ) ) ( not ( = ?auto_879684 ?auto_879691 ) ) ( not ( = ?auto_879684 ?auto_879692 ) ) ( not ( = ?auto_879684 ?auto_879693 ) ) ( not ( = ?auto_879684 ?auto_879694 ) ) ( not ( = ?auto_879684 ?auto_879695 ) ) ( not ( = ?auto_879684 ?auto_879696 ) ) ( not ( = ?auto_879684 ?auto_879697 ) ) ( not ( = ?auto_879684 ?auto_879698 ) ) ( not ( = ?auto_879684 ?auto_879699 ) ) ( not ( = ?auto_879684 ?auto_879700 ) ) ( not ( = ?auto_879684 ?auto_879701 ) ) ( not ( = ?auto_879685 ?auto_879686 ) ) ( not ( = ?auto_879685 ?auto_879687 ) ) ( not ( = ?auto_879685 ?auto_879688 ) ) ( not ( = ?auto_879685 ?auto_879689 ) ) ( not ( = ?auto_879685 ?auto_879690 ) ) ( not ( = ?auto_879685 ?auto_879691 ) ) ( not ( = ?auto_879685 ?auto_879692 ) ) ( not ( = ?auto_879685 ?auto_879693 ) ) ( not ( = ?auto_879685 ?auto_879694 ) ) ( not ( = ?auto_879685 ?auto_879695 ) ) ( not ( = ?auto_879685 ?auto_879696 ) ) ( not ( = ?auto_879685 ?auto_879697 ) ) ( not ( = ?auto_879685 ?auto_879698 ) ) ( not ( = ?auto_879685 ?auto_879699 ) ) ( not ( = ?auto_879685 ?auto_879700 ) ) ( not ( = ?auto_879685 ?auto_879701 ) ) ( not ( = ?auto_879686 ?auto_879687 ) ) ( not ( = ?auto_879686 ?auto_879688 ) ) ( not ( = ?auto_879686 ?auto_879689 ) ) ( not ( = ?auto_879686 ?auto_879690 ) ) ( not ( = ?auto_879686 ?auto_879691 ) ) ( not ( = ?auto_879686 ?auto_879692 ) ) ( not ( = ?auto_879686 ?auto_879693 ) ) ( not ( = ?auto_879686 ?auto_879694 ) ) ( not ( = ?auto_879686 ?auto_879695 ) ) ( not ( = ?auto_879686 ?auto_879696 ) ) ( not ( = ?auto_879686 ?auto_879697 ) ) ( not ( = ?auto_879686 ?auto_879698 ) ) ( not ( = ?auto_879686 ?auto_879699 ) ) ( not ( = ?auto_879686 ?auto_879700 ) ) ( not ( = ?auto_879686 ?auto_879701 ) ) ( not ( = ?auto_879687 ?auto_879688 ) ) ( not ( = ?auto_879687 ?auto_879689 ) ) ( not ( = ?auto_879687 ?auto_879690 ) ) ( not ( = ?auto_879687 ?auto_879691 ) ) ( not ( = ?auto_879687 ?auto_879692 ) ) ( not ( = ?auto_879687 ?auto_879693 ) ) ( not ( = ?auto_879687 ?auto_879694 ) ) ( not ( = ?auto_879687 ?auto_879695 ) ) ( not ( = ?auto_879687 ?auto_879696 ) ) ( not ( = ?auto_879687 ?auto_879697 ) ) ( not ( = ?auto_879687 ?auto_879698 ) ) ( not ( = ?auto_879687 ?auto_879699 ) ) ( not ( = ?auto_879687 ?auto_879700 ) ) ( not ( = ?auto_879687 ?auto_879701 ) ) ( not ( = ?auto_879688 ?auto_879689 ) ) ( not ( = ?auto_879688 ?auto_879690 ) ) ( not ( = ?auto_879688 ?auto_879691 ) ) ( not ( = ?auto_879688 ?auto_879692 ) ) ( not ( = ?auto_879688 ?auto_879693 ) ) ( not ( = ?auto_879688 ?auto_879694 ) ) ( not ( = ?auto_879688 ?auto_879695 ) ) ( not ( = ?auto_879688 ?auto_879696 ) ) ( not ( = ?auto_879688 ?auto_879697 ) ) ( not ( = ?auto_879688 ?auto_879698 ) ) ( not ( = ?auto_879688 ?auto_879699 ) ) ( not ( = ?auto_879688 ?auto_879700 ) ) ( not ( = ?auto_879688 ?auto_879701 ) ) ( not ( = ?auto_879689 ?auto_879690 ) ) ( not ( = ?auto_879689 ?auto_879691 ) ) ( not ( = ?auto_879689 ?auto_879692 ) ) ( not ( = ?auto_879689 ?auto_879693 ) ) ( not ( = ?auto_879689 ?auto_879694 ) ) ( not ( = ?auto_879689 ?auto_879695 ) ) ( not ( = ?auto_879689 ?auto_879696 ) ) ( not ( = ?auto_879689 ?auto_879697 ) ) ( not ( = ?auto_879689 ?auto_879698 ) ) ( not ( = ?auto_879689 ?auto_879699 ) ) ( not ( = ?auto_879689 ?auto_879700 ) ) ( not ( = ?auto_879689 ?auto_879701 ) ) ( not ( = ?auto_879690 ?auto_879691 ) ) ( not ( = ?auto_879690 ?auto_879692 ) ) ( not ( = ?auto_879690 ?auto_879693 ) ) ( not ( = ?auto_879690 ?auto_879694 ) ) ( not ( = ?auto_879690 ?auto_879695 ) ) ( not ( = ?auto_879690 ?auto_879696 ) ) ( not ( = ?auto_879690 ?auto_879697 ) ) ( not ( = ?auto_879690 ?auto_879698 ) ) ( not ( = ?auto_879690 ?auto_879699 ) ) ( not ( = ?auto_879690 ?auto_879700 ) ) ( not ( = ?auto_879690 ?auto_879701 ) ) ( not ( = ?auto_879691 ?auto_879692 ) ) ( not ( = ?auto_879691 ?auto_879693 ) ) ( not ( = ?auto_879691 ?auto_879694 ) ) ( not ( = ?auto_879691 ?auto_879695 ) ) ( not ( = ?auto_879691 ?auto_879696 ) ) ( not ( = ?auto_879691 ?auto_879697 ) ) ( not ( = ?auto_879691 ?auto_879698 ) ) ( not ( = ?auto_879691 ?auto_879699 ) ) ( not ( = ?auto_879691 ?auto_879700 ) ) ( not ( = ?auto_879691 ?auto_879701 ) ) ( not ( = ?auto_879692 ?auto_879693 ) ) ( not ( = ?auto_879692 ?auto_879694 ) ) ( not ( = ?auto_879692 ?auto_879695 ) ) ( not ( = ?auto_879692 ?auto_879696 ) ) ( not ( = ?auto_879692 ?auto_879697 ) ) ( not ( = ?auto_879692 ?auto_879698 ) ) ( not ( = ?auto_879692 ?auto_879699 ) ) ( not ( = ?auto_879692 ?auto_879700 ) ) ( not ( = ?auto_879692 ?auto_879701 ) ) ( not ( = ?auto_879693 ?auto_879694 ) ) ( not ( = ?auto_879693 ?auto_879695 ) ) ( not ( = ?auto_879693 ?auto_879696 ) ) ( not ( = ?auto_879693 ?auto_879697 ) ) ( not ( = ?auto_879693 ?auto_879698 ) ) ( not ( = ?auto_879693 ?auto_879699 ) ) ( not ( = ?auto_879693 ?auto_879700 ) ) ( not ( = ?auto_879693 ?auto_879701 ) ) ( not ( = ?auto_879694 ?auto_879695 ) ) ( not ( = ?auto_879694 ?auto_879696 ) ) ( not ( = ?auto_879694 ?auto_879697 ) ) ( not ( = ?auto_879694 ?auto_879698 ) ) ( not ( = ?auto_879694 ?auto_879699 ) ) ( not ( = ?auto_879694 ?auto_879700 ) ) ( not ( = ?auto_879694 ?auto_879701 ) ) ( not ( = ?auto_879695 ?auto_879696 ) ) ( not ( = ?auto_879695 ?auto_879697 ) ) ( not ( = ?auto_879695 ?auto_879698 ) ) ( not ( = ?auto_879695 ?auto_879699 ) ) ( not ( = ?auto_879695 ?auto_879700 ) ) ( not ( = ?auto_879695 ?auto_879701 ) ) ( not ( = ?auto_879696 ?auto_879697 ) ) ( not ( = ?auto_879696 ?auto_879698 ) ) ( not ( = ?auto_879696 ?auto_879699 ) ) ( not ( = ?auto_879696 ?auto_879700 ) ) ( not ( = ?auto_879696 ?auto_879701 ) ) ( not ( = ?auto_879697 ?auto_879698 ) ) ( not ( = ?auto_879697 ?auto_879699 ) ) ( not ( = ?auto_879697 ?auto_879700 ) ) ( not ( = ?auto_879697 ?auto_879701 ) ) ( not ( = ?auto_879698 ?auto_879699 ) ) ( not ( = ?auto_879698 ?auto_879700 ) ) ( not ( = ?auto_879698 ?auto_879701 ) ) ( not ( = ?auto_879699 ?auto_879700 ) ) ( not ( = ?auto_879699 ?auto_879701 ) ) ( not ( = ?auto_879700 ?auto_879701 ) ) ( ON ?auto_879699 ?auto_879700 ) ( ON ?auto_879698 ?auto_879699 ) ( ON ?auto_879697 ?auto_879698 ) ( ON ?auto_879696 ?auto_879697 ) ( ON ?auto_879695 ?auto_879696 ) ( ON ?auto_879694 ?auto_879695 ) ( ON ?auto_879693 ?auto_879694 ) ( CLEAR ?auto_879691 ) ( ON ?auto_879692 ?auto_879693 ) ( CLEAR ?auto_879692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_879683 ?auto_879684 ?auto_879685 ?auto_879686 ?auto_879687 ?auto_879688 ?auto_879689 ?auto_879690 ?auto_879691 ?auto_879692 )
      ( MAKE-18PILE ?auto_879683 ?auto_879684 ?auto_879685 ?auto_879686 ?auto_879687 ?auto_879688 ?auto_879689 ?auto_879690 ?auto_879691 ?auto_879692 ?auto_879693 ?auto_879694 ?auto_879695 ?auto_879696 ?auto_879697 ?auto_879698 ?auto_879699 ?auto_879700 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_879720 - BLOCK
      ?auto_879721 - BLOCK
      ?auto_879722 - BLOCK
      ?auto_879723 - BLOCK
      ?auto_879724 - BLOCK
      ?auto_879725 - BLOCK
      ?auto_879726 - BLOCK
      ?auto_879727 - BLOCK
      ?auto_879728 - BLOCK
      ?auto_879729 - BLOCK
      ?auto_879730 - BLOCK
      ?auto_879731 - BLOCK
      ?auto_879732 - BLOCK
      ?auto_879733 - BLOCK
      ?auto_879734 - BLOCK
      ?auto_879735 - BLOCK
      ?auto_879736 - BLOCK
      ?auto_879737 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_879737 ) ( ON-TABLE ?auto_879720 ) ( ON ?auto_879721 ?auto_879720 ) ( ON ?auto_879722 ?auto_879721 ) ( ON ?auto_879723 ?auto_879722 ) ( ON ?auto_879724 ?auto_879723 ) ( ON ?auto_879725 ?auto_879724 ) ( ON ?auto_879726 ?auto_879725 ) ( ON ?auto_879727 ?auto_879726 ) ( ON ?auto_879728 ?auto_879727 ) ( not ( = ?auto_879720 ?auto_879721 ) ) ( not ( = ?auto_879720 ?auto_879722 ) ) ( not ( = ?auto_879720 ?auto_879723 ) ) ( not ( = ?auto_879720 ?auto_879724 ) ) ( not ( = ?auto_879720 ?auto_879725 ) ) ( not ( = ?auto_879720 ?auto_879726 ) ) ( not ( = ?auto_879720 ?auto_879727 ) ) ( not ( = ?auto_879720 ?auto_879728 ) ) ( not ( = ?auto_879720 ?auto_879729 ) ) ( not ( = ?auto_879720 ?auto_879730 ) ) ( not ( = ?auto_879720 ?auto_879731 ) ) ( not ( = ?auto_879720 ?auto_879732 ) ) ( not ( = ?auto_879720 ?auto_879733 ) ) ( not ( = ?auto_879720 ?auto_879734 ) ) ( not ( = ?auto_879720 ?auto_879735 ) ) ( not ( = ?auto_879720 ?auto_879736 ) ) ( not ( = ?auto_879720 ?auto_879737 ) ) ( not ( = ?auto_879721 ?auto_879722 ) ) ( not ( = ?auto_879721 ?auto_879723 ) ) ( not ( = ?auto_879721 ?auto_879724 ) ) ( not ( = ?auto_879721 ?auto_879725 ) ) ( not ( = ?auto_879721 ?auto_879726 ) ) ( not ( = ?auto_879721 ?auto_879727 ) ) ( not ( = ?auto_879721 ?auto_879728 ) ) ( not ( = ?auto_879721 ?auto_879729 ) ) ( not ( = ?auto_879721 ?auto_879730 ) ) ( not ( = ?auto_879721 ?auto_879731 ) ) ( not ( = ?auto_879721 ?auto_879732 ) ) ( not ( = ?auto_879721 ?auto_879733 ) ) ( not ( = ?auto_879721 ?auto_879734 ) ) ( not ( = ?auto_879721 ?auto_879735 ) ) ( not ( = ?auto_879721 ?auto_879736 ) ) ( not ( = ?auto_879721 ?auto_879737 ) ) ( not ( = ?auto_879722 ?auto_879723 ) ) ( not ( = ?auto_879722 ?auto_879724 ) ) ( not ( = ?auto_879722 ?auto_879725 ) ) ( not ( = ?auto_879722 ?auto_879726 ) ) ( not ( = ?auto_879722 ?auto_879727 ) ) ( not ( = ?auto_879722 ?auto_879728 ) ) ( not ( = ?auto_879722 ?auto_879729 ) ) ( not ( = ?auto_879722 ?auto_879730 ) ) ( not ( = ?auto_879722 ?auto_879731 ) ) ( not ( = ?auto_879722 ?auto_879732 ) ) ( not ( = ?auto_879722 ?auto_879733 ) ) ( not ( = ?auto_879722 ?auto_879734 ) ) ( not ( = ?auto_879722 ?auto_879735 ) ) ( not ( = ?auto_879722 ?auto_879736 ) ) ( not ( = ?auto_879722 ?auto_879737 ) ) ( not ( = ?auto_879723 ?auto_879724 ) ) ( not ( = ?auto_879723 ?auto_879725 ) ) ( not ( = ?auto_879723 ?auto_879726 ) ) ( not ( = ?auto_879723 ?auto_879727 ) ) ( not ( = ?auto_879723 ?auto_879728 ) ) ( not ( = ?auto_879723 ?auto_879729 ) ) ( not ( = ?auto_879723 ?auto_879730 ) ) ( not ( = ?auto_879723 ?auto_879731 ) ) ( not ( = ?auto_879723 ?auto_879732 ) ) ( not ( = ?auto_879723 ?auto_879733 ) ) ( not ( = ?auto_879723 ?auto_879734 ) ) ( not ( = ?auto_879723 ?auto_879735 ) ) ( not ( = ?auto_879723 ?auto_879736 ) ) ( not ( = ?auto_879723 ?auto_879737 ) ) ( not ( = ?auto_879724 ?auto_879725 ) ) ( not ( = ?auto_879724 ?auto_879726 ) ) ( not ( = ?auto_879724 ?auto_879727 ) ) ( not ( = ?auto_879724 ?auto_879728 ) ) ( not ( = ?auto_879724 ?auto_879729 ) ) ( not ( = ?auto_879724 ?auto_879730 ) ) ( not ( = ?auto_879724 ?auto_879731 ) ) ( not ( = ?auto_879724 ?auto_879732 ) ) ( not ( = ?auto_879724 ?auto_879733 ) ) ( not ( = ?auto_879724 ?auto_879734 ) ) ( not ( = ?auto_879724 ?auto_879735 ) ) ( not ( = ?auto_879724 ?auto_879736 ) ) ( not ( = ?auto_879724 ?auto_879737 ) ) ( not ( = ?auto_879725 ?auto_879726 ) ) ( not ( = ?auto_879725 ?auto_879727 ) ) ( not ( = ?auto_879725 ?auto_879728 ) ) ( not ( = ?auto_879725 ?auto_879729 ) ) ( not ( = ?auto_879725 ?auto_879730 ) ) ( not ( = ?auto_879725 ?auto_879731 ) ) ( not ( = ?auto_879725 ?auto_879732 ) ) ( not ( = ?auto_879725 ?auto_879733 ) ) ( not ( = ?auto_879725 ?auto_879734 ) ) ( not ( = ?auto_879725 ?auto_879735 ) ) ( not ( = ?auto_879725 ?auto_879736 ) ) ( not ( = ?auto_879725 ?auto_879737 ) ) ( not ( = ?auto_879726 ?auto_879727 ) ) ( not ( = ?auto_879726 ?auto_879728 ) ) ( not ( = ?auto_879726 ?auto_879729 ) ) ( not ( = ?auto_879726 ?auto_879730 ) ) ( not ( = ?auto_879726 ?auto_879731 ) ) ( not ( = ?auto_879726 ?auto_879732 ) ) ( not ( = ?auto_879726 ?auto_879733 ) ) ( not ( = ?auto_879726 ?auto_879734 ) ) ( not ( = ?auto_879726 ?auto_879735 ) ) ( not ( = ?auto_879726 ?auto_879736 ) ) ( not ( = ?auto_879726 ?auto_879737 ) ) ( not ( = ?auto_879727 ?auto_879728 ) ) ( not ( = ?auto_879727 ?auto_879729 ) ) ( not ( = ?auto_879727 ?auto_879730 ) ) ( not ( = ?auto_879727 ?auto_879731 ) ) ( not ( = ?auto_879727 ?auto_879732 ) ) ( not ( = ?auto_879727 ?auto_879733 ) ) ( not ( = ?auto_879727 ?auto_879734 ) ) ( not ( = ?auto_879727 ?auto_879735 ) ) ( not ( = ?auto_879727 ?auto_879736 ) ) ( not ( = ?auto_879727 ?auto_879737 ) ) ( not ( = ?auto_879728 ?auto_879729 ) ) ( not ( = ?auto_879728 ?auto_879730 ) ) ( not ( = ?auto_879728 ?auto_879731 ) ) ( not ( = ?auto_879728 ?auto_879732 ) ) ( not ( = ?auto_879728 ?auto_879733 ) ) ( not ( = ?auto_879728 ?auto_879734 ) ) ( not ( = ?auto_879728 ?auto_879735 ) ) ( not ( = ?auto_879728 ?auto_879736 ) ) ( not ( = ?auto_879728 ?auto_879737 ) ) ( not ( = ?auto_879729 ?auto_879730 ) ) ( not ( = ?auto_879729 ?auto_879731 ) ) ( not ( = ?auto_879729 ?auto_879732 ) ) ( not ( = ?auto_879729 ?auto_879733 ) ) ( not ( = ?auto_879729 ?auto_879734 ) ) ( not ( = ?auto_879729 ?auto_879735 ) ) ( not ( = ?auto_879729 ?auto_879736 ) ) ( not ( = ?auto_879729 ?auto_879737 ) ) ( not ( = ?auto_879730 ?auto_879731 ) ) ( not ( = ?auto_879730 ?auto_879732 ) ) ( not ( = ?auto_879730 ?auto_879733 ) ) ( not ( = ?auto_879730 ?auto_879734 ) ) ( not ( = ?auto_879730 ?auto_879735 ) ) ( not ( = ?auto_879730 ?auto_879736 ) ) ( not ( = ?auto_879730 ?auto_879737 ) ) ( not ( = ?auto_879731 ?auto_879732 ) ) ( not ( = ?auto_879731 ?auto_879733 ) ) ( not ( = ?auto_879731 ?auto_879734 ) ) ( not ( = ?auto_879731 ?auto_879735 ) ) ( not ( = ?auto_879731 ?auto_879736 ) ) ( not ( = ?auto_879731 ?auto_879737 ) ) ( not ( = ?auto_879732 ?auto_879733 ) ) ( not ( = ?auto_879732 ?auto_879734 ) ) ( not ( = ?auto_879732 ?auto_879735 ) ) ( not ( = ?auto_879732 ?auto_879736 ) ) ( not ( = ?auto_879732 ?auto_879737 ) ) ( not ( = ?auto_879733 ?auto_879734 ) ) ( not ( = ?auto_879733 ?auto_879735 ) ) ( not ( = ?auto_879733 ?auto_879736 ) ) ( not ( = ?auto_879733 ?auto_879737 ) ) ( not ( = ?auto_879734 ?auto_879735 ) ) ( not ( = ?auto_879734 ?auto_879736 ) ) ( not ( = ?auto_879734 ?auto_879737 ) ) ( not ( = ?auto_879735 ?auto_879736 ) ) ( not ( = ?auto_879735 ?auto_879737 ) ) ( not ( = ?auto_879736 ?auto_879737 ) ) ( ON ?auto_879736 ?auto_879737 ) ( ON ?auto_879735 ?auto_879736 ) ( ON ?auto_879734 ?auto_879735 ) ( ON ?auto_879733 ?auto_879734 ) ( ON ?auto_879732 ?auto_879733 ) ( ON ?auto_879731 ?auto_879732 ) ( ON ?auto_879730 ?auto_879731 ) ( CLEAR ?auto_879728 ) ( ON ?auto_879729 ?auto_879730 ) ( CLEAR ?auto_879729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_879720 ?auto_879721 ?auto_879722 ?auto_879723 ?auto_879724 ?auto_879725 ?auto_879726 ?auto_879727 ?auto_879728 ?auto_879729 )
      ( MAKE-18PILE ?auto_879720 ?auto_879721 ?auto_879722 ?auto_879723 ?auto_879724 ?auto_879725 ?auto_879726 ?auto_879727 ?auto_879728 ?auto_879729 ?auto_879730 ?auto_879731 ?auto_879732 ?auto_879733 ?auto_879734 ?auto_879735 ?auto_879736 ?auto_879737 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_879756 - BLOCK
      ?auto_879757 - BLOCK
      ?auto_879758 - BLOCK
      ?auto_879759 - BLOCK
      ?auto_879760 - BLOCK
      ?auto_879761 - BLOCK
      ?auto_879762 - BLOCK
      ?auto_879763 - BLOCK
      ?auto_879764 - BLOCK
      ?auto_879765 - BLOCK
      ?auto_879766 - BLOCK
      ?auto_879767 - BLOCK
      ?auto_879768 - BLOCK
      ?auto_879769 - BLOCK
      ?auto_879770 - BLOCK
      ?auto_879771 - BLOCK
      ?auto_879772 - BLOCK
      ?auto_879773 - BLOCK
    )
    :vars
    (
      ?auto_879774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_879773 ?auto_879774 ) ( ON-TABLE ?auto_879756 ) ( ON ?auto_879757 ?auto_879756 ) ( ON ?auto_879758 ?auto_879757 ) ( ON ?auto_879759 ?auto_879758 ) ( ON ?auto_879760 ?auto_879759 ) ( ON ?auto_879761 ?auto_879760 ) ( ON ?auto_879762 ?auto_879761 ) ( ON ?auto_879763 ?auto_879762 ) ( not ( = ?auto_879756 ?auto_879757 ) ) ( not ( = ?auto_879756 ?auto_879758 ) ) ( not ( = ?auto_879756 ?auto_879759 ) ) ( not ( = ?auto_879756 ?auto_879760 ) ) ( not ( = ?auto_879756 ?auto_879761 ) ) ( not ( = ?auto_879756 ?auto_879762 ) ) ( not ( = ?auto_879756 ?auto_879763 ) ) ( not ( = ?auto_879756 ?auto_879764 ) ) ( not ( = ?auto_879756 ?auto_879765 ) ) ( not ( = ?auto_879756 ?auto_879766 ) ) ( not ( = ?auto_879756 ?auto_879767 ) ) ( not ( = ?auto_879756 ?auto_879768 ) ) ( not ( = ?auto_879756 ?auto_879769 ) ) ( not ( = ?auto_879756 ?auto_879770 ) ) ( not ( = ?auto_879756 ?auto_879771 ) ) ( not ( = ?auto_879756 ?auto_879772 ) ) ( not ( = ?auto_879756 ?auto_879773 ) ) ( not ( = ?auto_879756 ?auto_879774 ) ) ( not ( = ?auto_879757 ?auto_879758 ) ) ( not ( = ?auto_879757 ?auto_879759 ) ) ( not ( = ?auto_879757 ?auto_879760 ) ) ( not ( = ?auto_879757 ?auto_879761 ) ) ( not ( = ?auto_879757 ?auto_879762 ) ) ( not ( = ?auto_879757 ?auto_879763 ) ) ( not ( = ?auto_879757 ?auto_879764 ) ) ( not ( = ?auto_879757 ?auto_879765 ) ) ( not ( = ?auto_879757 ?auto_879766 ) ) ( not ( = ?auto_879757 ?auto_879767 ) ) ( not ( = ?auto_879757 ?auto_879768 ) ) ( not ( = ?auto_879757 ?auto_879769 ) ) ( not ( = ?auto_879757 ?auto_879770 ) ) ( not ( = ?auto_879757 ?auto_879771 ) ) ( not ( = ?auto_879757 ?auto_879772 ) ) ( not ( = ?auto_879757 ?auto_879773 ) ) ( not ( = ?auto_879757 ?auto_879774 ) ) ( not ( = ?auto_879758 ?auto_879759 ) ) ( not ( = ?auto_879758 ?auto_879760 ) ) ( not ( = ?auto_879758 ?auto_879761 ) ) ( not ( = ?auto_879758 ?auto_879762 ) ) ( not ( = ?auto_879758 ?auto_879763 ) ) ( not ( = ?auto_879758 ?auto_879764 ) ) ( not ( = ?auto_879758 ?auto_879765 ) ) ( not ( = ?auto_879758 ?auto_879766 ) ) ( not ( = ?auto_879758 ?auto_879767 ) ) ( not ( = ?auto_879758 ?auto_879768 ) ) ( not ( = ?auto_879758 ?auto_879769 ) ) ( not ( = ?auto_879758 ?auto_879770 ) ) ( not ( = ?auto_879758 ?auto_879771 ) ) ( not ( = ?auto_879758 ?auto_879772 ) ) ( not ( = ?auto_879758 ?auto_879773 ) ) ( not ( = ?auto_879758 ?auto_879774 ) ) ( not ( = ?auto_879759 ?auto_879760 ) ) ( not ( = ?auto_879759 ?auto_879761 ) ) ( not ( = ?auto_879759 ?auto_879762 ) ) ( not ( = ?auto_879759 ?auto_879763 ) ) ( not ( = ?auto_879759 ?auto_879764 ) ) ( not ( = ?auto_879759 ?auto_879765 ) ) ( not ( = ?auto_879759 ?auto_879766 ) ) ( not ( = ?auto_879759 ?auto_879767 ) ) ( not ( = ?auto_879759 ?auto_879768 ) ) ( not ( = ?auto_879759 ?auto_879769 ) ) ( not ( = ?auto_879759 ?auto_879770 ) ) ( not ( = ?auto_879759 ?auto_879771 ) ) ( not ( = ?auto_879759 ?auto_879772 ) ) ( not ( = ?auto_879759 ?auto_879773 ) ) ( not ( = ?auto_879759 ?auto_879774 ) ) ( not ( = ?auto_879760 ?auto_879761 ) ) ( not ( = ?auto_879760 ?auto_879762 ) ) ( not ( = ?auto_879760 ?auto_879763 ) ) ( not ( = ?auto_879760 ?auto_879764 ) ) ( not ( = ?auto_879760 ?auto_879765 ) ) ( not ( = ?auto_879760 ?auto_879766 ) ) ( not ( = ?auto_879760 ?auto_879767 ) ) ( not ( = ?auto_879760 ?auto_879768 ) ) ( not ( = ?auto_879760 ?auto_879769 ) ) ( not ( = ?auto_879760 ?auto_879770 ) ) ( not ( = ?auto_879760 ?auto_879771 ) ) ( not ( = ?auto_879760 ?auto_879772 ) ) ( not ( = ?auto_879760 ?auto_879773 ) ) ( not ( = ?auto_879760 ?auto_879774 ) ) ( not ( = ?auto_879761 ?auto_879762 ) ) ( not ( = ?auto_879761 ?auto_879763 ) ) ( not ( = ?auto_879761 ?auto_879764 ) ) ( not ( = ?auto_879761 ?auto_879765 ) ) ( not ( = ?auto_879761 ?auto_879766 ) ) ( not ( = ?auto_879761 ?auto_879767 ) ) ( not ( = ?auto_879761 ?auto_879768 ) ) ( not ( = ?auto_879761 ?auto_879769 ) ) ( not ( = ?auto_879761 ?auto_879770 ) ) ( not ( = ?auto_879761 ?auto_879771 ) ) ( not ( = ?auto_879761 ?auto_879772 ) ) ( not ( = ?auto_879761 ?auto_879773 ) ) ( not ( = ?auto_879761 ?auto_879774 ) ) ( not ( = ?auto_879762 ?auto_879763 ) ) ( not ( = ?auto_879762 ?auto_879764 ) ) ( not ( = ?auto_879762 ?auto_879765 ) ) ( not ( = ?auto_879762 ?auto_879766 ) ) ( not ( = ?auto_879762 ?auto_879767 ) ) ( not ( = ?auto_879762 ?auto_879768 ) ) ( not ( = ?auto_879762 ?auto_879769 ) ) ( not ( = ?auto_879762 ?auto_879770 ) ) ( not ( = ?auto_879762 ?auto_879771 ) ) ( not ( = ?auto_879762 ?auto_879772 ) ) ( not ( = ?auto_879762 ?auto_879773 ) ) ( not ( = ?auto_879762 ?auto_879774 ) ) ( not ( = ?auto_879763 ?auto_879764 ) ) ( not ( = ?auto_879763 ?auto_879765 ) ) ( not ( = ?auto_879763 ?auto_879766 ) ) ( not ( = ?auto_879763 ?auto_879767 ) ) ( not ( = ?auto_879763 ?auto_879768 ) ) ( not ( = ?auto_879763 ?auto_879769 ) ) ( not ( = ?auto_879763 ?auto_879770 ) ) ( not ( = ?auto_879763 ?auto_879771 ) ) ( not ( = ?auto_879763 ?auto_879772 ) ) ( not ( = ?auto_879763 ?auto_879773 ) ) ( not ( = ?auto_879763 ?auto_879774 ) ) ( not ( = ?auto_879764 ?auto_879765 ) ) ( not ( = ?auto_879764 ?auto_879766 ) ) ( not ( = ?auto_879764 ?auto_879767 ) ) ( not ( = ?auto_879764 ?auto_879768 ) ) ( not ( = ?auto_879764 ?auto_879769 ) ) ( not ( = ?auto_879764 ?auto_879770 ) ) ( not ( = ?auto_879764 ?auto_879771 ) ) ( not ( = ?auto_879764 ?auto_879772 ) ) ( not ( = ?auto_879764 ?auto_879773 ) ) ( not ( = ?auto_879764 ?auto_879774 ) ) ( not ( = ?auto_879765 ?auto_879766 ) ) ( not ( = ?auto_879765 ?auto_879767 ) ) ( not ( = ?auto_879765 ?auto_879768 ) ) ( not ( = ?auto_879765 ?auto_879769 ) ) ( not ( = ?auto_879765 ?auto_879770 ) ) ( not ( = ?auto_879765 ?auto_879771 ) ) ( not ( = ?auto_879765 ?auto_879772 ) ) ( not ( = ?auto_879765 ?auto_879773 ) ) ( not ( = ?auto_879765 ?auto_879774 ) ) ( not ( = ?auto_879766 ?auto_879767 ) ) ( not ( = ?auto_879766 ?auto_879768 ) ) ( not ( = ?auto_879766 ?auto_879769 ) ) ( not ( = ?auto_879766 ?auto_879770 ) ) ( not ( = ?auto_879766 ?auto_879771 ) ) ( not ( = ?auto_879766 ?auto_879772 ) ) ( not ( = ?auto_879766 ?auto_879773 ) ) ( not ( = ?auto_879766 ?auto_879774 ) ) ( not ( = ?auto_879767 ?auto_879768 ) ) ( not ( = ?auto_879767 ?auto_879769 ) ) ( not ( = ?auto_879767 ?auto_879770 ) ) ( not ( = ?auto_879767 ?auto_879771 ) ) ( not ( = ?auto_879767 ?auto_879772 ) ) ( not ( = ?auto_879767 ?auto_879773 ) ) ( not ( = ?auto_879767 ?auto_879774 ) ) ( not ( = ?auto_879768 ?auto_879769 ) ) ( not ( = ?auto_879768 ?auto_879770 ) ) ( not ( = ?auto_879768 ?auto_879771 ) ) ( not ( = ?auto_879768 ?auto_879772 ) ) ( not ( = ?auto_879768 ?auto_879773 ) ) ( not ( = ?auto_879768 ?auto_879774 ) ) ( not ( = ?auto_879769 ?auto_879770 ) ) ( not ( = ?auto_879769 ?auto_879771 ) ) ( not ( = ?auto_879769 ?auto_879772 ) ) ( not ( = ?auto_879769 ?auto_879773 ) ) ( not ( = ?auto_879769 ?auto_879774 ) ) ( not ( = ?auto_879770 ?auto_879771 ) ) ( not ( = ?auto_879770 ?auto_879772 ) ) ( not ( = ?auto_879770 ?auto_879773 ) ) ( not ( = ?auto_879770 ?auto_879774 ) ) ( not ( = ?auto_879771 ?auto_879772 ) ) ( not ( = ?auto_879771 ?auto_879773 ) ) ( not ( = ?auto_879771 ?auto_879774 ) ) ( not ( = ?auto_879772 ?auto_879773 ) ) ( not ( = ?auto_879772 ?auto_879774 ) ) ( not ( = ?auto_879773 ?auto_879774 ) ) ( ON ?auto_879772 ?auto_879773 ) ( ON ?auto_879771 ?auto_879772 ) ( ON ?auto_879770 ?auto_879771 ) ( ON ?auto_879769 ?auto_879770 ) ( ON ?auto_879768 ?auto_879769 ) ( ON ?auto_879767 ?auto_879768 ) ( ON ?auto_879766 ?auto_879767 ) ( ON ?auto_879765 ?auto_879766 ) ( CLEAR ?auto_879763 ) ( ON ?auto_879764 ?auto_879765 ) ( CLEAR ?auto_879764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_879756 ?auto_879757 ?auto_879758 ?auto_879759 ?auto_879760 ?auto_879761 ?auto_879762 ?auto_879763 ?auto_879764 )
      ( MAKE-18PILE ?auto_879756 ?auto_879757 ?auto_879758 ?auto_879759 ?auto_879760 ?auto_879761 ?auto_879762 ?auto_879763 ?auto_879764 ?auto_879765 ?auto_879766 ?auto_879767 ?auto_879768 ?auto_879769 ?auto_879770 ?auto_879771 ?auto_879772 ?auto_879773 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_879793 - BLOCK
      ?auto_879794 - BLOCK
      ?auto_879795 - BLOCK
      ?auto_879796 - BLOCK
      ?auto_879797 - BLOCK
      ?auto_879798 - BLOCK
      ?auto_879799 - BLOCK
      ?auto_879800 - BLOCK
      ?auto_879801 - BLOCK
      ?auto_879802 - BLOCK
      ?auto_879803 - BLOCK
      ?auto_879804 - BLOCK
      ?auto_879805 - BLOCK
      ?auto_879806 - BLOCK
      ?auto_879807 - BLOCK
      ?auto_879808 - BLOCK
      ?auto_879809 - BLOCK
      ?auto_879810 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_879810 ) ( ON-TABLE ?auto_879793 ) ( ON ?auto_879794 ?auto_879793 ) ( ON ?auto_879795 ?auto_879794 ) ( ON ?auto_879796 ?auto_879795 ) ( ON ?auto_879797 ?auto_879796 ) ( ON ?auto_879798 ?auto_879797 ) ( ON ?auto_879799 ?auto_879798 ) ( ON ?auto_879800 ?auto_879799 ) ( not ( = ?auto_879793 ?auto_879794 ) ) ( not ( = ?auto_879793 ?auto_879795 ) ) ( not ( = ?auto_879793 ?auto_879796 ) ) ( not ( = ?auto_879793 ?auto_879797 ) ) ( not ( = ?auto_879793 ?auto_879798 ) ) ( not ( = ?auto_879793 ?auto_879799 ) ) ( not ( = ?auto_879793 ?auto_879800 ) ) ( not ( = ?auto_879793 ?auto_879801 ) ) ( not ( = ?auto_879793 ?auto_879802 ) ) ( not ( = ?auto_879793 ?auto_879803 ) ) ( not ( = ?auto_879793 ?auto_879804 ) ) ( not ( = ?auto_879793 ?auto_879805 ) ) ( not ( = ?auto_879793 ?auto_879806 ) ) ( not ( = ?auto_879793 ?auto_879807 ) ) ( not ( = ?auto_879793 ?auto_879808 ) ) ( not ( = ?auto_879793 ?auto_879809 ) ) ( not ( = ?auto_879793 ?auto_879810 ) ) ( not ( = ?auto_879794 ?auto_879795 ) ) ( not ( = ?auto_879794 ?auto_879796 ) ) ( not ( = ?auto_879794 ?auto_879797 ) ) ( not ( = ?auto_879794 ?auto_879798 ) ) ( not ( = ?auto_879794 ?auto_879799 ) ) ( not ( = ?auto_879794 ?auto_879800 ) ) ( not ( = ?auto_879794 ?auto_879801 ) ) ( not ( = ?auto_879794 ?auto_879802 ) ) ( not ( = ?auto_879794 ?auto_879803 ) ) ( not ( = ?auto_879794 ?auto_879804 ) ) ( not ( = ?auto_879794 ?auto_879805 ) ) ( not ( = ?auto_879794 ?auto_879806 ) ) ( not ( = ?auto_879794 ?auto_879807 ) ) ( not ( = ?auto_879794 ?auto_879808 ) ) ( not ( = ?auto_879794 ?auto_879809 ) ) ( not ( = ?auto_879794 ?auto_879810 ) ) ( not ( = ?auto_879795 ?auto_879796 ) ) ( not ( = ?auto_879795 ?auto_879797 ) ) ( not ( = ?auto_879795 ?auto_879798 ) ) ( not ( = ?auto_879795 ?auto_879799 ) ) ( not ( = ?auto_879795 ?auto_879800 ) ) ( not ( = ?auto_879795 ?auto_879801 ) ) ( not ( = ?auto_879795 ?auto_879802 ) ) ( not ( = ?auto_879795 ?auto_879803 ) ) ( not ( = ?auto_879795 ?auto_879804 ) ) ( not ( = ?auto_879795 ?auto_879805 ) ) ( not ( = ?auto_879795 ?auto_879806 ) ) ( not ( = ?auto_879795 ?auto_879807 ) ) ( not ( = ?auto_879795 ?auto_879808 ) ) ( not ( = ?auto_879795 ?auto_879809 ) ) ( not ( = ?auto_879795 ?auto_879810 ) ) ( not ( = ?auto_879796 ?auto_879797 ) ) ( not ( = ?auto_879796 ?auto_879798 ) ) ( not ( = ?auto_879796 ?auto_879799 ) ) ( not ( = ?auto_879796 ?auto_879800 ) ) ( not ( = ?auto_879796 ?auto_879801 ) ) ( not ( = ?auto_879796 ?auto_879802 ) ) ( not ( = ?auto_879796 ?auto_879803 ) ) ( not ( = ?auto_879796 ?auto_879804 ) ) ( not ( = ?auto_879796 ?auto_879805 ) ) ( not ( = ?auto_879796 ?auto_879806 ) ) ( not ( = ?auto_879796 ?auto_879807 ) ) ( not ( = ?auto_879796 ?auto_879808 ) ) ( not ( = ?auto_879796 ?auto_879809 ) ) ( not ( = ?auto_879796 ?auto_879810 ) ) ( not ( = ?auto_879797 ?auto_879798 ) ) ( not ( = ?auto_879797 ?auto_879799 ) ) ( not ( = ?auto_879797 ?auto_879800 ) ) ( not ( = ?auto_879797 ?auto_879801 ) ) ( not ( = ?auto_879797 ?auto_879802 ) ) ( not ( = ?auto_879797 ?auto_879803 ) ) ( not ( = ?auto_879797 ?auto_879804 ) ) ( not ( = ?auto_879797 ?auto_879805 ) ) ( not ( = ?auto_879797 ?auto_879806 ) ) ( not ( = ?auto_879797 ?auto_879807 ) ) ( not ( = ?auto_879797 ?auto_879808 ) ) ( not ( = ?auto_879797 ?auto_879809 ) ) ( not ( = ?auto_879797 ?auto_879810 ) ) ( not ( = ?auto_879798 ?auto_879799 ) ) ( not ( = ?auto_879798 ?auto_879800 ) ) ( not ( = ?auto_879798 ?auto_879801 ) ) ( not ( = ?auto_879798 ?auto_879802 ) ) ( not ( = ?auto_879798 ?auto_879803 ) ) ( not ( = ?auto_879798 ?auto_879804 ) ) ( not ( = ?auto_879798 ?auto_879805 ) ) ( not ( = ?auto_879798 ?auto_879806 ) ) ( not ( = ?auto_879798 ?auto_879807 ) ) ( not ( = ?auto_879798 ?auto_879808 ) ) ( not ( = ?auto_879798 ?auto_879809 ) ) ( not ( = ?auto_879798 ?auto_879810 ) ) ( not ( = ?auto_879799 ?auto_879800 ) ) ( not ( = ?auto_879799 ?auto_879801 ) ) ( not ( = ?auto_879799 ?auto_879802 ) ) ( not ( = ?auto_879799 ?auto_879803 ) ) ( not ( = ?auto_879799 ?auto_879804 ) ) ( not ( = ?auto_879799 ?auto_879805 ) ) ( not ( = ?auto_879799 ?auto_879806 ) ) ( not ( = ?auto_879799 ?auto_879807 ) ) ( not ( = ?auto_879799 ?auto_879808 ) ) ( not ( = ?auto_879799 ?auto_879809 ) ) ( not ( = ?auto_879799 ?auto_879810 ) ) ( not ( = ?auto_879800 ?auto_879801 ) ) ( not ( = ?auto_879800 ?auto_879802 ) ) ( not ( = ?auto_879800 ?auto_879803 ) ) ( not ( = ?auto_879800 ?auto_879804 ) ) ( not ( = ?auto_879800 ?auto_879805 ) ) ( not ( = ?auto_879800 ?auto_879806 ) ) ( not ( = ?auto_879800 ?auto_879807 ) ) ( not ( = ?auto_879800 ?auto_879808 ) ) ( not ( = ?auto_879800 ?auto_879809 ) ) ( not ( = ?auto_879800 ?auto_879810 ) ) ( not ( = ?auto_879801 ?auto_879802 ) ) ( not ( = ?auto_879801 ?auto_879803 ) ) ( not ( = ?auto_879801 ?auto_879804 ) ) ( not ( = ?auto_879801 ?auto_879805 ) ) ( not ( = ?auto_879801 ?auto_879806 ) ) ( not ( = ?auto_879801 ?auto_879807 ) ) ( not ( = ?auto_879801 ?auto_879808 ) ) ( not ( = ?auto_879801 ?auto_879809 ) ) ( not ( = ?auto_879801 ?auto_879810 ) ) ( not ( = ?auto_879802 ?auto_879803 ) ) ( not ( = ?auto_879802 ?auto_879804 ) ) ( not ( = ?auto_879802 ?auto_879805 ) ) ( not ( = ?auto_879802 ?auto_879806 ) ) ( not ( = ?auto_879802 ?auto_879807 ) ) ( not ( = ?auto_879802 ?auto_879808 ) ) ( not ( = ?auto_879802 ?auto_879809 ) ) ( not ( = ?auto_879802 ?auto_879810 ) ) ( not ( = ?auto_879803 ?auto_879804 ) ) ( not ( = ?auto_879803 ?auto_879805 ) ) ( not ( = ?auto_879803 ?auto_879806 ) ) ( not ( = ?auto_879803 ?auto_879807 ) ) ( not ( = ?auto_879803 ?auto_879808 ) ) ( not ( = ?auto_879803 ?auto_879809 ) ) ( not ( = ?auto_879803 ?auto_879810 ) ) ( not ( = ?auto_879804 ?auto_879805 ) ) ( not ( = ?auto_879804 ?auto_879806 ) ) ( not ( = ?auto_879804 ?auto_879807 ) ) ( not ( = ?auto_879804 ?auto_879808 ) ) ( not ( = ?auto_879804 ?auto_879809 ) ) ( not ( = ?auto_879804 ?auto_879810 ) ) ( not ( = ?auto_879805 ?auto_879806 ) ) ( not ( = ?auto_879805 ?auto_879807 ) ) ( not ( = ?auto_879805 ?auto_879808 ) ) ( not ( = ?auto_879805 ?auto_879809 ) ) ( not ( = ?auto_879805 ?auto_879810 ) ) ( not ( = ?auto_879806 ?auto_879807 ) ) ( not ( = ?auto_879806 ?auto_879808 ) ) ( not ( = ?auto_879806 ?auto_879809 ) ) ( not ( = ?auto_879806 ?auto_879810 ) ) ( not ( = ?auto_879807 ?auto_879808 ) ) ( not ( = ?auto_879807 ?auto_879809 ) ) ( not ( = ?auto_879807 ?auto_879810 ) ) ( not ( = ?auto_879808 ?auto_879809 ) ) ( not ( = ?auto_879808 ?auto_879810 ) ) ( not ( = ?auto_879809 ?auto_879810 ) ) ( ON ?auto_879809 ?auto_879810 ) ( ON ?auto_879808 ?auto_879809 ) ( ON ?auto_879807 ?auto_879808 ) ( ON ?auto_879806 ?auto_879807 ) ( ON ?auto_879805 ?auto_879806 ) ( ON ?auto_879804 ?auto_879805 ) ( ON ?auto_879803 ?auto_879804 ) ( ON ?auto_879802 ?auto_879803 ) ( CLEAR ?auto_879800 ) ( ON ?auto_879801 ?auto_879802 ) ( CLEAR ?auto_879801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_879793 ?auto_879794 ?auto_879795 ?auto_879796 ?auto_879797 ?auto_879798 ?auto_879799 ?auto_879800 ?auto_879801 )
      ( MAKE-18PILE ?auto_879793 ?auto_879794 ?auto_879795 ?auto_879796 ?auto_879797 ?auto_879798 ?auto_879799 ?auto_879800 ?auto_879801 ?auto_879802 ?auto_879803 ?auto_879804 ?auto_879805 ?auto_879806 ?auto_879807 ?auto_879808 ?auto_879809 ?auto_879810 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_879829 - BLOCK
      ?auto_879830 - BLOCK
      ?auto_879831 - BLOCK
      ?auto_879832 - BLOCK
      ?auto_879833 - BLOCK
      ?auto_879834 - BLOCK
      ?auto_879835 - BLOCK
      ?auto_879836 - BLOCK
      ?auto_879837 - BLOCK
      ?auto_879838 - BLOCK
      ?auto_879839 - BLOCK
      ?auto_879840 - BLOCK
      ?auto_879841 - BLOCK
      ?auto_879842 - BLOCK
      ?auto_879843 - BLOCK
      ?auto_879844 - BLOCK
      ?auto_879845 - BLOCK
      ?auto_879846 - BLOCK
    )
    :vars
    (
      ?auto_879847 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_879846 ?auto_879847 ) ( ON-TABLE ?auto_879829 ) ( ON ?auto_879830 ?auto_879829 ) ( ON ?auto_879831 ?auto_879830 ) ( ON ?auto_879832 ?auto_879831 ) ( ON ?auto_879833 ?auto_879832 ) ( ON ?auto_879834 ?auto_879833 ) ( ON ?auto_879835 ?auto_879834 ) ( not ( = ?auto_879829 ?auto_879830 ) ) ( not ( = ?auto_879829 ?auto_879831 ) ) ( not ( = ?auto_879829 ?auto_879832 ) ) ( not ( = ?auto_879829 ?auto_879833 ) ) ( not ( = ?auto_879829 ?auto_879834 ) ) ( not ( = ?auto_879829 ?auto_879835 ) ) ( not ( = ?auto_879829 ?auto_879836 ) ) ( not ( = ?auto_879829 ?auto_879837 ) ) ( not ( = ?auto_879829 ?auto_879838 ) ) ( not ( = ?auto_879829 ?auto_879839 ) ) ( not ( = ?auto_879829 ?auto_879840 ) ) ( not ( = ?auto_879829 ?auto_879841 ) ) ( not ( = ?auto_879829 ?auto_879842 ) ) ( not ( = ?auto_879829 ?auto_879843 ) ) ( not ( = ?auto_879829 ?auto_879844 ) ) ( not ( = ?auto_879829 ?auto_879845 ) ) ( not ( = ?auto_879829 ?auto_879846 ) ) ( not ( = ?auto_879829 ?auto_879847 ) ) ( not ( = ?auto_879830 ?auto_879831 ) ) ( not ( = ?auto_879830 ?auto_879832 ) ) ( not ( = ?auto_879830 ?auto_879833 ) ) ( not ( = ?auto_879830 ?auto_879834 ) ) ( not ( = ?auto_879830 ?auto_879835 ) ) ( not ( = ?auto_879830 ?auto_879836 ) ) ( not ( = ?auto_879830 ?auto_879837 ) ) ( not ( = ?auto_879830 ?auto_879838 ) ) ( not ( = ?auto_879830 ?auto_879839 ) ) ( not ( = ?auto_879830 ?auto_879840 ) ) ( not ( = ?auto_879830 ?auto_879841 ) ) ( not ( = ?auto_879830 ?auto_879842 ) ) ( not ( = ?auto_879830 ?auto_879843 ) ) ( not ( = ?auto_879830 ?auto_879844 ) ) ( not ( = ?auto_879830 ?auto_879845 ) ) ( not ( = ?auto_879830 ?auto_879846 ) ) ( not ( = ?auto_879830 ?auto_879847 ) ) ( not ( = ?auto_879831 ?auto_879832 ) ) ( not ( = ?auto_879831 ?auto_879833 ) ) ( not ( = ?auto_879831 ?auto_879834 ) ) ( not ( = ?auto_879831 ?auto_879835 ) ) ( not ( = ?auto_879831 ?auto_879836 ) ) ( not ( = ?auto_879831 ?auto_879837 ) ) ( not ( = ?auto_879831 ?auto_879838 ) ) ( not ( = ?auto_879831 ?auto_879839 ) ) ( not ( = ?auto_879831 ?auto_879840 ) ) ( not ( = ?auto_879831 ?auto_879841 ) ) ( not ( = ?auto_879831 ?auto_879842 ) ) ( not ( = ?auto_879831 ?auto_879843 ) ) ( not ( = ?auto_879831 ?auto_879844 ) ) ( not ( = ?auto_879831 ?auto_879845 ) ) ( not ( = ?auto_879831 ?auto_879846 ) ) ( not ( = ?auto_879831 ?auto_879847 ) ) ( not ( = ?auto_879832 ?auto_879833 ) ) ( not ( = ?auto_879832 ?auto_879834 ) ) ( not ( = ?auto_879832 ?auto_879835 ) ) ( not ( = ?auto_879832 ?auto_879836 ) ) ( not ( = ?auto_879832 ?auto_879837 ) ) ( not ( = ?auto_879832 ?auto_879838 ) ) ( not ( = ?auto_879832 ?auto_879839 ) ) ( not ( = ?auto_879832 ?auto_879840 ) ) ( not ( = ?auto_879832 ?auto_879841 ) ) ( not ( = ?auto_879832 ?auto_879842 ) ) ( not ( = ?auto_879832 ?auto_879843 ) ) ( not ( = ?auto_879832 ?auto_879844 ) ) ( not ( = ?auto_879832 ?auto_879845 ) ) ( not ( = ?auto_879832 ?auto_879846 ) ) ( not ( = ?auto_879832 ?auto_879847 ) ) ( not ( = ?auto_879833 ?auto_879834 ) ) ( not ( = ?auto_879833 ?auto_879835 ) ) ( not ( = ?auto_879833 ?auto_879836 ) ) ( not ( = ?auto_879833 ?auto_879837 ) ) ( not ( = ?auto_879833 ?auto_879838 ) ) ( not ( = ?auto_879833 ?auto_879839 ) ) ( not ( = ?auto_879833 ?auto_879840 ) ) ( not ( = ?auto_879833 ?auto_879841 ) ) ( not ( = ?auto_879833 ?auto_879842 ) ) ( not ( = ?auto_879833 ?auto_879843 ) ) ( not ( = ?auto_879833 ?auto_879844 ) ) ( not ( = ?auto_879833 ?auto_879845 ) ) ( not ( = ?auto_879833 ?auto_879846 ) ) ( not ( = ?auto_879833 ?auto_879847 ) ) ( not ( = ?auto_879834 ?auto_879835 ) ) ( not ( = ?auto_879834 ?auto_879836 ) ) ( not ( = ?auto_879834 ?auto_879837 ) ) ( not ( = ?auto_879834 ?auto_879838 ) ) ( not ( = ?auto_879834 ?auto_879839 ) ) ( not ( = ?auto_879834 ?auto_879840 ) ) ( not ( = ?auto_879834 ?auto_879841 ) ) ( not ( = ?auto_879834 ?auto_879842 ) ) ( not ( = ?auto_879834 ?auto_879843 ) ) ( not ( = ?auto_879834 ?auto_879844 ) ) ( not ( = ?auto_879834 ?auto_879845 ) ) ( not ( = ?auto_879834 ?auto_879846 ) ) ( not ( = ?auto_879834 ?auto_879847 ) ) ( not ( = ?auto_879835 ?auto_879836 ) ) ( not ( = ?auto_879835 ?auto_879837 ) ) ( not ( = ?auto_879835 ?auto_879838 ) ) ( not ( = ?auto_879835 ?auto_879839 ) ) ( not ( = ?auto_879835 ?auto_879840 ) ) ( not ( = ?auto_879835 ?auto_879841 ) ) ( not ( = ?auto_879835 ?auto_879842 ) ) ( not ( = ?auto_879835 ?auto_879843 ) ) ( not ( = ?auto_879835 ?auto_879844 ) ) ( not ( = ?auto_879835 ?auto_879845 ) ) ( not ( = ?auto_879835 ?auto_879846 ) ) ( not ( = ?auto_879835 ?auto_879847 ) ) ( not ( = ?auto_879836 ?auto_879837 ) ) ( not ( = ?auto_879836 ?auto_879838 ) ) ( not ( = ?auto_879836 ?auto_879839 ) ) ( not ( = ?auto_879836 ?auto_879840 ) ) ( not ( = ?auto_879836 ?auto_879841 ) ) ( not ( = ?auto_879836 ?auto_879842 ) ) ( not ( = ?auto_879836 ?auto_879843 ) ) ( not ( = ?auto_879836 ?auto_879844 ) ) ( not ( = ?auto_879836 ?auto_879845 ) ) ( not ( = ?auto_879836 ?auto_879846 ) ) ( not ( = ?auto_879836 ?auto_879847 ) ) ( not ( = ?auto_879837 ?auto_879838 ) ) ( not ( = ?auto_879837 ?auto_879839 ) ) ( not ( = ?auto_879837 ?auto_879840 ) ) ( not ( = ?auto_879837 ?auto_879841 ) ) ( not ( = ?auto_879837 ?auto_879842 ) ) ( not ( = ?auto_879837 ?auto_879843 ) ) ( not ( = ?auto_879837 ?auto_879844 ) ) ( not ( = ?auto_879837 ?auto_879845 ) ) ( not ( = ?auto_879837 ?auto_879846 ) ) ( not ( = ?auto_879837 ?auto_879847 ) ) ( not ( = ?auto_879838 ?auto_879839 ) ) ( not ( = ?auto_879838 ?auto_879840 ) ) ( not ( = ?auto_879838 ?auto_879841 ) ) ( not ( = ?auto_879838 ?auto_879842 ) ) ( not ( = ?auto_879838 ?auto_879843 ) ) ( not ( = ?auto_879838 ?auto_879844 ) ) ( not ( = ?auto_879838 ?auto_879845 ) ) ( not ( = ?auto_879838 ?auto_879846 ) ) ( not ( = ?auto_879838 ?auto_879847 ) ) ( not ( = ?auto_879839 ?auto_879840 ) ) ( not ( = ?auto_879839 ?auto_879841 ) ) ( not ( = ?auto_879839 ?auto_879842 ) ) ( not ( = ?auto_879839 ?auto_879843 ) ) ( not ( = ?auto_879839 ?auto_879844 ) ) ( not ( = ?auto_879839 ?auto_879845 ) ) ( not ( = ?auto_879839 ?auto_879846 ) ) ( not ( = ?auto_879839 ?auto_879847 ) ) ( not ( = ?auto_879840 ?auto_879841 ) ) ( not ( = ?auto_879840 ?auto_879842 ) ) ( not ( = ?auto_879840 ?auto_879843 ) ) ( not ( = ?auto_879840 ?auto_879844 ) ) ( not ( = ?auto_879840 ?auto_879845 ) ) ( not ( = ?auto_879840 ?auto_879846 ) ) ( not ( = ?auto_879840 ?auto_879847 ) ) ( not ( = ?auto_879841 ?auto_879842 ) ) ( not ( = ?auto_879841 ?auto_879843 ) ) ( not ( = ?auto_879841 ?auto_879844 ) ) ( not ( = ?auto_879841 ?auto_879845 ) ) ( not ( = ?auto_879841 ?auto_879846 ) ) ( not ( = ?auto_879841 ?auto_879847 ) ) ( not ( = ?auto_879842 ?auto_879843 ) ) ( not ( = ?auto_879842 ?auto_879844 ) ) ( not ( = ?auto_879842 ?auto_879845 ) ) ( not ( = ?auto_879842 ?auto_879846 ) ) ( not ( = ?auto_879842 ?auto_879847 ) ) ( not ( = ?auto_879843 ?auto_879844 ) ) ( not ( = ?auto_879843 ?auto_879845 ) ) ( not ( = ?auto_879843 ?auto_879846 ) ) ( not ( = ?auto_879843 ?auto_879847 ) ) ( not ( = ?auto_879844 ?auto_879845 ) ) ( not ( = ?auto_879844 ?auto_879846 ) ) ( not ( = ?auto_879844 ?auto_879847 ) ) ( not ( = ?auto_879845 ?auto_879846 ) ) ( not ( = ?auto_879845 ?auto_879847 ) ) ( not ( = ?auto_879846 ?auto_879847 ) ) ( ON ?auto_879845 ?auto_879846 ) ( ON ?auto_879844 ?auto_879845 ) ( ON ?auto_879843 ?auto_879844 ) ( ON ?auto_879842 ?auto_879843 ) ( ON ?auto_879841 ?auto_879842 ) ( ON ?auto_879840 ?auto_879841 ) ( ON ?auto_879839 ?auto_879840 ) ( ON ?auto_879838 ?auto_879839 ) ( ON ?auto_879837 ?auto_879838 ) ( CLEAR ?auto_879835 ) ( ON ?auto_879836 ?auto_879837 ) ( CLEAR ?auto_879836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_879829 ?auto_879830 ?auto_879831 ?auto_879832 ?auto_879833 ?auto_879834 ?auto_879835 ?auto_879836 )
      ( MAKE-18PILE ?auto_879829 ?auto_879830 ?auto_879831 ?auto_879832 ?auto_879833 ?auto_879834 ?auto_879835 ?auto_879836 ?auto_879837 ?auto_879838 ?auto_879839 ?auto_879840 ?auto_879841 ?auto_879842 ?auto_879843 ?auto_879844 ?auto_879845 ?auto_879846 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_879866 - BLOCK
      ?auto_879867 - BLOCK
      ?auto_879868 - BLOCK
      ?auto_879869 - BLOCK
      ?auto_879870 - BLOCK
      ?auto_879871 - BLOCK
      ?auto_879872 - BLOCK
      ?auto_879873 - BLOCK
      ?auto_879874 - BLOCK
      ?auto_879875 - BLOCK
      ?auto_879876 - BLOCK
      ?auto_879877 - BLOCK
      ?auto_879878 - BLOCK
      ?auto_879879 - BLOCK
      ?auto_879880 - BLOCK
      ?auto_879881 - BLOCK
      ?auto_879882 - BLOCK
      ?auto_879883 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_879883 ) ( ON-TABLE ?auto_879866 ) ( ON ?auto_879867 ?auto_879866 ) ( ON ?auto_879868 ?auto_879867 ) ( ON ?auto_879869 ?auto_879868 ) ( ON ?auto_879870 ?auto_879869 ) ( ON ?auto_879871 ?auto_879870 ) ( ON ?auto_879872 ?auto_879871 ) ( not ( = ?auto_879866 ?auto_879867 ) ) ( not ( = ?auto_879866 ?auto_879868 ) ) ( not ( = ?auto_879866 ?auto_879869 ) ) ( not ( = ?auto_879866 ?auto_879870 ) ) ( not ( = ?auto_879866 ?auto_879871 ) ) ( not ( = ?auto_879866 ?auto_879872 ) ) ( not ( = ?auto_879866 ?auto_879873 ) ) ( not ( = ?auto_879866 ?auto_879874 ) ) ( not ( = ?auto_879866 ?auto_879875 ) ) ( not ( = ?auto_879866 ?auto_879876 ) ) ( not ( = ?auto_879866 ?auto_879877 ) ) ( not ( = ?auto_879866 ?auto_879878 ) ) ( not ( = ?auto_879866 ?auto_879879 ) ) ( not ( = ?auto_879866 ?auto_879880 ) ) ( not ( = ?auto_879866 ?auto_879881 ) ) ( not ( = ?auto_879866 ?auto_879882 ) ) ( not ( = ?auto_879866 ?auto_879883 ) ) ( not ( = ?auto_879867 ?auto_879868 ) ) ( not ( = ?auto_879867 ?auto_879869 ) ) ( not ( = ?auto_879867 ?auto_879870 ) ) ( not ( = ?auto_879867 ?auto_879871 ) ) ( not ( = ?auto_879867 ?auto_879872 ) ) ( not ( = ?auto_879867 ?auto_879873 ) ) ( not ( = ?auto_879867 ?auto_879874 ) ) ( not ( = ?auto_879867 ?auto_879875 ) ) ( not ( = ?auto_879867 ?auto_879876 ) ) ( not ( = ?auto_879867 ?auto_879877 ) ) ( not ( = ?auto_879867 ?auto_879878 ) ) ( not ( = ?auto_879867 ?auto_879879 ) ) ( not ( = ?auto_879867 ?auto_879880 ) ) ( not ( = ?auto_879867 ?auto_879881 ) ) ( not ( = ?auto_879867 ?auto_879882 ) ) ( not ( = ?auto_879867 ?auto_879883 ) ) ( not ( = ?auto_879868 ?auto_879869 ) ) ( not ( = ?auto_879868 ?auto_879870 ) ) ( not ( = ?auto_879868 ?auto_879871 ) ) ( not ( = ?auto_879868 ?auto_879872 ) ) ( not ( = ?auto_879868 ?auto_879873 ) ) ( not ( = ?auto_879868 ?auto_879874 ) ) ( not ( = ?auto_879868 ?auto_879875 ) ) ( not ( = ?auto_879868 ?auto_879876 ) ) ( not ( = ?auto_879868 ?auto_879877 ) ) ( not ( = ?auto_879868 ?auto_879878 ) ) ( not ( = ?auto_879868 ?auto_879879 ) ) ( not ( = ?auto_879868 ?auto_879880 ) ) ( not ( = ?auto_879868 ?auto_879881 ) ) ( not ( = ?auto_879868 ?auto_879882 ) ) ( not ( = ?auto_879868 ?auto_879883 ) ) ( not ( = ?auto_879869 ?auto_879870 ) ) ( not ( = ?auto_879869 ?auto_879871 ) ) ( not ( = ?auto_879869 ?auto_879872 ) ) ( not ( = ?auto_879869 ?auto_879873 ) ) ( not ( = ?auto_879869 ?auto_879874 ) ) ( not ( = ?auto_879869 ?auto_879875 ) ) ( not ( = ?auto_879869 ?auto_879876 ) ) ( not ( = ?auto_879869 ?auto_879877 ) ) ( not ( = ?auto_879869 ?auto_879878 ) ) ( not ( = ?auto_879869 ?auto_879879 ) ) ( not ( = ?auto_879869 ?auto_879880 ) ) ( not ( = ?auto_879869 ?auto_879881 ) ) ( not ( = ?auto_879869 ?auto_879882 ) ) ( not ( = ?auto_879869 ?auto_879883 ) ) ( not ( = ?auto_879870 ?auto_879871 ) ) ( not ( = ?auto_879870 ?auto_879872 ) ) ( not ( = ?auto_879870 ?auto_879873 ) ) ( not ( = ?auto_879870 ?auto_879874 ) ) ( not ( = ?auto_879870 ?auto_879875 ) ) ( not ( = ?auto_879870 ?auto_879876 ) ) ( not ( = ?auto_879870 ?auto_879877 ) ) ( not ( = ?auto_879870 ?auto_879878 ) ) ( not ( = ?auto_879870 ?auto_879879 ) ) ( not ( = ?auto_879870 ?auto_879880 ) ) ( not ( = ?auto_879870 ?auto_879881 ) ) ( not ( = ?auto_879870 ?auto_879882 ) ) ( not ( = ?auto_879870 ?auto_879883 ) ) ( not ( = ?auto_879871 ?auto_879872 ) ) ( not ( = ?auto_879871 ?auto_879873 ) ) ( not ( = ?auto_879871 ?auto_879874 ) ) ( not ( = ?auto_879871 ?auto_879875 ) ) ( not ( = ?auto_879871 ?auto_879876 ) ) ( not ( = ?auto_879871 ?auto_879877 ) ) ( not ( = ?auto_879871 ?auto_879878 ) ) ( not ( = ?auto_879871 ?auto_879879 ) ) ( not ( = ?auto_879871 ?auto_879880 ) ) ( not ( = ?auto_879871 ?auto_879881 ) ) ( not ( = ?auto_879871 ?auto_879882 ) ) ( not ( = ?auto_879871 ?auto_879883 ) ) ( not ( = ?auto_879872 ?auto_879873 ) ) ( not ( = ?auto_879872 ?auto_879874 ) ) ( not ( = ?auto_879872 ?auto_879875 ) ) ( not ( = ?auto_879872 ?auto_879876 ) ) ( not ( = ?auto_879872 ?auto_879877 ) ) ( not ( = ?auto_879872 ?auto_879878 ) ) ( not ( = ?auto_879872 ?auto_879879 ) ) ( not ( = ?auto_879872 ?auto_879880 ) ) ( not ( = ?auto_879872 ?auto_879881 ) ) ( not ( = ?auto_879872 ?auto_879882 ) ) ( not ( = ?auto_879872 ?auto_879883 ) ) ( not ( = ?auto_879873 ?auto_879874 ) ) ( not ( = ?auto_879873 ?auto_879875 ) ) ( not ( = ?auto_879873 ?auto_879876 ) ) ( not ( = ?auto_879873 ?auto_879877 ) ) ( not ( = ?auto_879873 ?auto_879878 ) ) ( not ( = ?auto_879873 ?auto_879879 ) ) ( not ( = ?auto_879873 ?auto_879880 ) ) ( not ( = ?auto_879873 ?auto_879881 ) ) ( not ( = ?auto_879873 ?auto_879882 ) ) ( not ( = ?auto_879873 ?auto_879883 ) ) ( not ( = ?auto_879874 ?auto_879875 ) ) ( not ( = ?auto_879874 ?auto_879876 ) ) ( not ( = ?auto_879874 ?auto_879877 ) ) ( not ( = ?auto_879874 ?auto_879878 ) ) ( not ( = ?auto_879874 ?auto_879879 ) ) ( not ( = ?auto_879874 ?auto_879880 ) ) ( not ( = ?auto_879874 ?auto_879881 ) ) ( not ( = ?auto_879874 ?auto_879882 ) ) ( not ( = ?auto_879874 ?auto_879883 ) ) ( not ( = ?auto_879875 ?auto_879876 ) ) ( not ( = ?auto_879875 ?auto_879877 ) ) ( not ( = ?auto_879875 ?auto_879878 ) ) ( not ( = ?auto_879875 ?auto_879879 ) ) ( not ( = ?auto_879875 ?auto_879880 ) ) ( not ( = ?auto_879875 ?auto_879881 ) ) ( not ( = ?auto_879875 ?auto_879882 ) ) ( not ( = ?auto_879875 ?auto_879883 ) ) ( not ( = ?auto_879876 ?auto_879877 ) ) ( not ( = ?auto_879876 ?auto_879878 ) ) ( not ( = ?auto_879876 ?auto_879879 ) ) ( not ( = ?auto_879876 ?auto_879880 ) ) ( not ( = ?auto_879876 ?auto_879881 ) ) ( not ( = ?auto_879876 ?auto_879882 ) ) ( not ( = ?auto_879876 ?auto_879883 ) ) ( not ( = ?auto_879877 ?auto_879878 ) ) ( not ( = ?auto_879877 ?auto_879879 ) ) ( not ( = ?auto_879877 ?auto_879880 ) ) ( not ( = ?auto_879877 ?auto_879881 ) ) ( not ( = ?auto_879877 ?auto_879882 ) ) ( not ( = ?auto_879877 ?auto_879883 ) ) ( not ( = ?auto_879878 ?auto_879879 ) ) ( not ( = ?auto_879878 ?auto_879880 ) ) ( not ( = ?auto_879878 ?auto_879881 ) ) ( not ( = ?auto_879878 ?auto_879882 ) ) ( not ( = ?auto_879878 ?auto_879883 ) ) ( not ( = ?auto_879879 ?auto_879880 ) ) ( not ( = ?auto_879879 ?auto_879881 ) ) ( not ( = ?auto_879879 ?auto_879882 ) ) ( not ( = ?auto_879879 ?auto_879883 ) ) ( not ( = ?auto_879880 ?auto_879881 ) ) ( not ( = ?auto_879880 ?auto_879882 ) ) ( not ( = ?auto_879880 ?auto_879883 ) ) ( not ( = ?auto_879881 ?auto_879882 ) ) ( not ( = ?auto_879881 ?auto_879883 ) ) ( not ( = ?auto_879882 ?auto_879883 ) ) ( ON ?auto_879882 ?auto_879883 ) ( ON ?auto_879881 ?auto_879882 ) ( ON ?auto_879880 ?auto_879881 ) ( ON ?auto_879879 ?auto_879880 ) ( ON ?auto_879878 ?auto_879879 ) ( ON ?auto_879877 ?auto_879878 ) ( ON ?auto_879876 ?auto_879877 ) ( ON ?auto_879875 ?auto_879876 ) ( ON ?auto_879874 ?auto_879875 ) ( CLEAR ?auto_879872 ) ( ON ?auto_879873 ?auto_879874 ) ( CLEAR ?auto_879873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_879866 ?auto_879867 ?auto_879868 ?auto_879869 ?auto_879870 ?auto_879871 ?auto_879872 ?auto_879873 )
      ( MAKE-18PILE ?auto_879866 ?auto_879867 ?auto_879868 ?auto_879869 ?auto_879870 ?auto_879871 ?auto_879872 ?auto_879873 ?auto_879874 ?auto_879875 ?auto_879876 ?auto_879877 ?auto_879878 ?auto_879879 ?auto_879880 ?auto_879881 ?auto_879882 ?auto_879883 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_879902 - BLOCK
      ?auto_879903 - BLOCK
      ?auto_879904 - BLOCK
      ?auto_879905 - BLOCK
      ?auto_879906 - BLOCK
      ?auto_879907 - BLOCK
      ?auto_879908 - BLOCK
      ?auto_879909 - BLOCK
      ?auto_879910 - BLOCK
      ?auto_879911 - BLOCK
      ?auto_879912 - BLOCK
      ?auto_879913 - BLOCK
      ?auto_879914 - BLOCK
      ?auto_879915 - BLOCK
      ?auto_879916 - BLOCK
      ?auto_879917 - BLOCK
      ?auto_879918 - BLOCK
      ?auto_879919 - BLOCK
    )
    :vars
    (
      ?auto_879920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_879919 ?auto_879920 ) ( ON-TABLE ?auto_879902 ) ( ON ?auto_879903 ?auto_879902 ) ( ON ?auto_879904 ?auto_879903 ) ( ON ?auto_879905 ?auto_879904 ) ( ON ?auto_879906 ?auto_879905 ) ( ON ?auto_879907 ?auto_879906 ) ( not ( = ?auto_879902 ?auto_879903 ) ) ( not ( = ?auto_879902 ?auto_879904 ) ) ( not ( = ?auto_879902 ?auto_879905 ) ) ( not ( = ?auto_879902 ?auto_879906 ) ) ( not ( = ?auto_879902 ?auto_879907 ) ) ( not ( = ?auto_879902 ?auto_879908 ) ) ( not ( = ?auto_879902 ?auto_879909 ) ) ( not ( = ?auto_879902 ?auto_879910 ) ) ( not ( = ?auto_879902 ?auto_879911 ) ) ( not ( = ?auto_879902 ?auto_879912 ) ) ( not ( = ?auto_879902 ?auto_879913 ) ) ( not ( = ?auto_879902 ?auto_879914 ) ) ( not ( = ?auto_879902 ?auto_879915 ) ) ( not ( = ?auto_879902 ?auto_879916 ) ) ( not ( = ?auto_879902 ?auto_879917 ) ) ( not ( = ?auto_879902 ?auto_879918 ) ) ( not ( = ?auto_879902 ?auto_879919 ) ) ( not ( = ?auto_879902 ?auto_879920 ) ) ( not ( = ?auto_879903 ?auto_879904 ) ) ( not ( = ?auto_879903 ?auto_879905 ) ) ( not ( = ?auto_879903 ?auto_879906 ) ) ( not ( = ?auto_879903 ?auto_879907 ) ) ( not ( = ?auto_879903 ?auto_879908 ) ) ( not ( = ?auto_879903 ?auto_879909 ) ) ( not ( = ?auto_879903 ?auto_879910 ) ) ( not ( = ?auto_879903 ?auto_879911 ) ) ( not ( = ?auto_879903 ?auto_879912 ) ) ( not ( = ?auto_879903 ?auto_879913 ) ) ( not ( = ?auto_879903 ?auto_879914 ) ) ( not ( = ?auto_879903 ?auto_879915 ) ) ( not ( = ?auto_879903 ?auto_879916 ) ) ( not ( = ?auto_879903 ?auto_879917 ) ) ( not ( = ?auto_879903 ?auto_879918 ) ) ( not ( = ?auto_879903 ?auto_879919 ) ) ( not ( = ?auto_879903 ?auto_879920 ) ) ( not ( = ?auto_879904 ?auto_879905 ) ) ( not ( = ?auto_879904 ?auto_879906 ) ) ( not ( = ?auto_879904 ?auto_879907 ) ) ( not ( = ?auto_879904 ?auto_879908 ) ) ( not ( = ?auto_879904 ?auto_879909 ) ) ( not ( = ?auto_879904 ?auto_879910 ) ) ( not ( = ?auto_879904 ?auto_879911 ) ) ( not ( = ?auto_879904 ?auto_879912 ) ) ( not ( = ?auto_879904 ?auto_879913 ) ) ( not ( = ?auto_879904 ?auto_879914 ) ) ( not ( = ?auto_879904 ?auto_879915 ) ) ( not ( = ?auto_879904 ?auto_879916 ) ) ( not ( = ?auto_879904 ?auto_879917 ) ) ( not ( = ?auto_879904 ?auto_879918 ) ) ( not ( = ?auto_879904 ?auto_879919 ) ) ( not ( = ?auto_879904 ?auto_879920 ) ) ( not ( = ?auto_879905 ?auto_879906 ) ) ( not ( = ?auto_879905 ?auto_879907 ) ) ( not ( = ?auto_879905 ?auto_879908 ) ) ( not ( = ?auto_879905 ?auto_879909 ) ) ( not ( = ?auto_879905 ?auto_879910 ) ) ( not ( = ?auto_879905 ?auto_879911 ) ) ( not ( = ?auto_879905 ?auto_879912 ) ) ( not ( = ?auto_879905 ?auto_879913 ) ) ( not ( = ?auto_879905 ?auto_879914 ) ) ( not ( = ?auto_879905 ?auto_879915 ) ) ( not ( = ?auto_879905 ?auto_879916 ) ) ( not ( = ?auto_879905 ?auto_879917 ) ) ( not ( = ?auto_879905 ?auto_879918 ) ) ( not ( = ?auto_879905 ?auto_879919 ) ) ( not ( = ?auto_879905 ?auto_879920 ) ) ( not ( = ?auto_879906 ?auto_879907 ) ) ( not ( = ?auto_879906 ?auto_879908 ) ) ( not ( = ?auto_879906 ?auto_879909 ) ) ( not ( = ?auto_879906 ?auto_879910 ) ) ( not ( = ?auto_879906 ?auto_879911 ) ) ( not ( = ?auto_879906 ?auto_879912 ) ) ( not ( = ?auto_879906 ?auto_879913 ) ) ( not ( = ?auto_879906 ?auto_879914 ) ) ( not ( = ?auto_879906 ?auto_879915 ) ) ( not ( = ?auto_879906 ?auto_879916 ) ) ( not ( = ?auto_879906 ?auto_879917 ) ) ( not ( = ?auto_879906 ?auto_879918 ) ) ( not ( = ?auto_879906 ?auto_879919 ) ) ( not ( = ?auto_879906 ?auto_879920 ) ) ( not ( = ?auto_879907 ?auto_879908 ) ) ( not ( = ?auto_879907 ?auto_879909 ) ) ( not ( = ?auto_879907 ?auto_879910 ) ) ( not ( = ?auto_879907 ?auto_879911 ) ) ( not ( = ?auto_879907 ?auto_879912 ) ) ( not ( = ?auto_879907 ?auto_879913 ) ) ( not ( = ?auto_879907 ?auto_879914 ) ) ( not ( = ?auto_879907 ?auto_879915 ) ) ( not ( = ?auto_879907 ?auto_879916 ) ) ( not ( = ?auto_879907 ?auto_879917 ) ) ( not ( = ?auto_879907 ?auto_879918 ) ) ( not ( = ?auto_879907 ?auto_879919 ) ) ( not ( = ?auto_879907 ?auto_879920 ) ) ( not ( = ?auto_879908 ?auto_879909 ) ) ( not ( = ?auto_879908 ?auto_879910 ) ) ( not ( = ?auto_879908 ?auto_879911 ) ) ( not ( = ?auto_879908 ?auto_879912 ) ) ( not ( = ?auto_879908 ?auto_879913 ) ) ( not ( = ?auto_879908 ?auto_879914 ) ) ( not ( = ?auto_879908 ?auto_879915 ) ) ( not ( = ?auto_879908 ?auto_879916 ) ) ( not ( = ?auto_879908 ?auto_879917 ) ) ( not ( = ?auto_879908 ?auto_879918 ) ) ( not ( = ?auto_879908 ?auto_879919 ) ) ( not ( = ?auto_879908 ?auto_879920 ) ) ( not ( = ?auto_879909 ?auto_879910 ) ) ( not ( = ?auto_879909 ?auto_879911 ) ) ( not ( = ?auto_879909 ?auto_879912 ) ) ( not ( = ?auto_879909 ?auto_879913 ) ) ( not ( = ?auto_879909 ?auto_879914 ) ) ( not ( = ?auto_879909 ?auto_879915 ) ) ( not ( = ?auto_879909 ?auto_879916 ) ) ( not ( = ?auto_879909 ?auto_879917 ) ) ( not ( = ?auto_879909 ?auto_879918 ) ) ( not ( = ?auto_879909 ?auto_879919 ) ) ( not ( = ?auto_879909 ?auto_879920 ) ) ( not ( = ?auto_879910 ?auto_879911 ) ) ( not ( = ?auto_879910 ?auto_879912 ) ) ( not ( = ?auto_879910 ?auto_879913 ) ) ( not ( = ?auto_879910 ?auto_879914 ) ) ( not ( = ?auto_879910 ?auto_879915 ) ) ( not ( = ?auto_879910 ?auto_879916 ) ) ( not ( = ?auto_879910 ?auto_879917 ) ) ( not ( = ?auto_879910 ?auto_879918 ) ) ( not ( = ?auto_879910 ?auto_879919 ) ) ( not ( = ?auto_879910 ?auto_879920 ) ) ( not ( = ?auto_879911 ?auto_879912 ) ) ( not ( = ?auto_879911 ?auto_879913 ) ) ( not ( = ?auto_879911 ?auto_879914 ) ) ( not ( = ?auto_879911 ?auto_879915 ) ) ( not ( = ?auto_879911 ?auto_879916 ) ) ( not ( = ?auto_879911 ?auto_879917 ) ) ( not ( = ?auto_879911 ?auto_879918 ) ) ( not ( = ?auto_879911 ?auto_879919 ) ) ( not ( = ?auto_879911 ?auto_879920 ) ) ( not ( = ?auto_879912 ?auto_879913 ) ) ( not ( = ?auto_879912 ?auto_879914 ) ) ( not ( = ?auto_879912 ?auto_879915 ) ) ( not ( = ?auto_879912 ?auto_879916 ) ) ( not ( = ?auto_879912 ?auto_879917 ) ) ( not ( = ?auto_879912 ?auto_879918 ) ) ( not ( = ?auto_879912 ?auto_879919 ) ) ( not ( = ?auto_879912 ?auto_879920 ) ) ( not ( = ?auto_879913 ?auto_879914 ) ) ( not ( = ?auto_879913 ?auto_879915 ) ) ( not ( = ?auto_879913 ?auto_879916 ) ) ( not ( = ?auto_879913 ?auto_879917 ) ) ( not ( = ?auto_879913 ?auto_879918 ) ) ( not ( = ?auto_879913 ?auto_879919 ) ) ( not ( = ?auto_879913 ?auto_879920 ) ) ( not ( = ?auto_879914 ?auto_879915 ) ) ( not ( = ?auto_879914 ?auto_879916 ) ) ( not ( = ?auto_879914 ?auto_879917 ) ) ( not ( = ?auto_879914 ?auto_879918 ) ) ( not ( = ?auto_879914 ?auto_879919 ) ) ( not ( = ?auto_879914 ?auto_879920 ) ) ( not ( = ?auto_879915 ?auto_879916 ) ) ( not ( = ?auto_879915 ?auto_879917 ) ) ( not ( = ?auto_879915 ?auto_879918 ) ) ( not ( = ?auto_879915 ?auto_879919 ) ) ( not ( = ?auto_879915 ?auto_879920 ) ) ( not ( = ?auto_879916 ?auto_879917 ) ) ( not ( = ?auto_879916 ?auto_879918 ) ) ( not ( = ?auto_879916 ?auto_879919 ) ) ( not ( = ?auto_879916 ?auto_879920 ) ) ( not ( = ?auto_879917 ?auto_879918 ) ) ( not ( = ?auto_879917 ?auto_879919 ) ) ( not ( = ?auto_879917 ?auto_879920 ) ) ( not ( = ?auto_879918 ?auto_879919 ) ) ( not ( = ?auto_879918 ?auto_879920 ) ) ( not ( = ?auto_879919 ?auto_879920 ) ) ( ON ?auto_879918 ?auto_879919 ) ( ON ?auto_879917 ?auto_879918 ) ( ON ?auto_879916 ?auto_879917 ) ( ON ?auto_879915 ?auto_879916 ) ( ON ?auto_879914 ?auto_879915 ) ( ON ?auto_879913 ?auto_879914 ) ( ON ?auto_879912 ?auto_879913 ) ( ON ?auto_879911 ?auto_879912 ) ( ON ?auto_879910 ?auto_879911 ) ( ON ?auto_879909 ?auto_879910 ) ( CLEAR ?auto_879907 ) ( ON ?auto_879908 ?auto_879909 ) ( CLEAR ?auto_879908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_879902 ?auto_879903 ?auto_879904 ?auto_879905 ?auto_879906 ?auto_879907 ?auto_879908 )
      ( MAKE-18PILE ?auto_879902 ?auto_879903 ?auto_879904 ?auto_879905 ?auto_879906 ?auto_879907 ?auto_879908 ?auto_879909 ?auto_879910 ?auto_879911 ?auto_879912 ?auto_879913 ?auto_879914 ?auto_879915 ?auto_879916 ?auto_879917 ?auto_879918 ?auto_879919 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_879939 - BLOCK
      ?auto_879940 - BLOCK
      ?auto_879941 - BLOCK
      ?auto_879942 - BLOCK
      ?auto_879943 - BLOCK
      ?auto_879944 - BLOCK
      ?auto_879945 - BLOCK
      ?auto_879946 - BLOCK
      ?auto_879947 - BLOCK
      ?auto_879948 - BLOCK
      ?auto_879949 - BLOCK
      ?auto_879950 - BLOCK
      ?auto_879951 - BLOCK
      ?auto_879952 - BLOCK
      ?auto_879953 - BLOCK
      ?auto_879954 - BLOCK
      ?auto_879955 - BLOCK
      ?auto_879956 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_879956 ) ( ON-TABLE ?auto_879939 ) ( ON ?auto_879940 ?auto_879939 ) ( ON ?auto_879941 ?auto_879940 ) ( ON ?auto_879942 ?auto_879941 ) ( ON ?auto_879943 ?auto_879942 ) ( ON ?auto_879944 ?auto_879943 ) ( not ( = ?auto_879939 ?auto_879940 ) ) ( not ( = ?auto_879939 ?auto_879941 ) ) ( not ( = ?auto_879939 ?auto_879942 ) ) ( not ( = ?auto_879939 ?auto_879943 ) ) ( not ( = ?auto_879939 ?auto_879944 ) ) ( not ( = ?auto_879939 ?auto_879945 ) ) ( not ( = ?auto_879939 ?auto_879946 ) ) ( not ( = ?auto_879939 ?auto_879947 ) ) ( not ( = ?auto_879939 ?auto_879948 ) ) ( not ( = ?auto_879939 ?auto_879949 ) ) ( not ( = ?auto_879939 ?auto_879950 ) ) ( not ( = ?auto_879939 ?auto_879951 ) ) ( not ( = ?auto_879939 ?auto_879952 ) ) ( not ( = ?auto_879939 ?auto_879953 ) ) ( not ( = ?auto_879939 ?auto_879954 ) ) ( not ( = ?auto_879939 ?auto_879955 ) ) ( not ( = ?auto_879939 ?auto_879956 ) ) ( not ( = ?auto_879940 ?auto_879941 ) ) ( not ( = ?auto_879940 ?auto_879942 ) ) ( not ( = ?auto_879940 ?auto_879943 ) ) ( not ( = ?auto_879940 ?auto_879944 ) ) ( not ( = ?auto_879940 ?auto_879945 ) ) ( not ( = ?auto_879940 ?auto_879946 ) ) ( not ( = ?auto_879940 ?auto_879947 ) ) ( not ( = ?auto_879940 ?auto_879948 ) ) ( not ( = ?auto_879940 ?auto_879949 ) ) ( not ( = ?auto_879940 ?auto_879950 ) ) ( not ( = ?auto_879940 ?auto_879951 ) ) ( not ( = ?auto_879940 ?auto_879952 ) ) ( not ( = ?auto_879940 ?auto_879953 ) ) ( not ( = ?auto_879940 ?auto_879954 ) ) ( not ( = ?auto_879940 ?auto_879955 ) ) ( not ( = ?auto_879940 ?auto_879956 ) ) ( not ( = ?auto_879941 ?auto_879942 ) ) ( not ( = ?auto_879941 ?auto_879943 ) ) ( not ( = ?auto_879941 ?auto_879944 ) ) ( not ( = ?auto_879941 ?auto_879945 ) ) ( not ( = ?auto_879941 ?auto_879946 ) ) ( not ( = ?auto_879941 ?auto_879947 ) ) ( not ( = ?auto_879941 ?auto_879948 ) ) ( not ( = ?auto_879941 ?auto_879949 ) ) ( not ( = ?auto_879941 ?auto_879950 ) ) ( not ( = ?auto_879941 ?auto_879951 ) ) ( not ( = ?auto_879941 ?auto_879952 ) ) ( not ( = ?auto_879941 ?auto_879953 ) ) ( not ( = ?auto_879941 ?auto_879954 ) ) ( not ( = ?auto_879941 ?auto_879955 ) ) ( not ( = ?auto_879941 ?auto_879956 ) ) ( not ( = ?auto_879942 ?auto_879943 ) ) ( not ( = ?auto_879942 ?auto_879944 ) ) ( not ( = ?auto_879942 ?auto_879945 ) ) ( not ( = ?auto_879942 ?auto_879946 ) ) ( not ( = ?auto_879942 ?auto_879947 ) ) ( not ( = ?auto_879942 ?auto_879948 ) ) ( not ( = ?auto_879942 ?auto_879949 ) ) ( not ( = ?auto_879942 ?auto_879950 ) ) ( not ( = ?auto_879942 ?auto_879951 ) ) ( not ( = ?auto_879942 ?auto_879952 ) ) ( not ( = ?auto_879942 ?auto_879953 ) ) ( not ( = ?auto_879942 ?auto_879954 ) ) ( not ( = ?auto_879942 ?auto_879955 ) ) ( not ( = ?auto_879942 ?auto_879956 ) ) ( not ( = ?auto_879943 ?auto_879944 ) ) ( not ( = ?auto_879943 ?auto_879945 ) ) ( not ( = ?auto_879943 ?auto_879946 ) ) ( not ( = ?auto_879943 ?auto_879947 ) ) ( not ( = ?auto_879943 ?auto_879948 ) ) ( not ( = ?auto_879943 ?auto_879949 ) ) ( not ( = ?auto_879943 ?auto_879950 ) ) ( not ( = ?auto_879943 ?auto_879951 ) ) ( not ( = ?auto_879943 ?auto_879952 ) ) ( not ( = ?auto_879943 ?auto_879953 ) ) ( not ( = ?auto_879943 ?auto_879954 ) ) ( not ( = ?auto_879943 ?auto_879955 ) ) ( not ( = ?auto_879943 ?auto_879956 ) ) ( not ( = ?auto_879944 ?auto_879945 ) ) ( not ( = ?auto_879944 ?auto_879946 ) ) ( not ( = ?auto_879944 ?auto_879947 ) ) ( not ( = ?auto_879944 ?auto_879948 ) ) ( not ( = ?auto_879944 ?auto_879949 ) ) ( not ( = ?auto_879944 ?auto_879950 ) ) ( not ( = ?auto_879944 ?auto_879951 ) ) ( not ( = ?auto_879944 ?auto_879952 ) ) ( not ( = ?auto_879944 ?auto_879953 ) ) ( not ( = ?auto_879944 ?auto_879954 ) ) ( not ( = ?auto_879944 ?auto_879955 ) ) ( not ( = ?auto_879944 ?auto_879956 ) ) ( not ( = ?auto_879945 ?auto_879946 ) ) ( not ( = ?auto_879945 ?auto_879947 ) ) ( not ( = ?auto_879945 ?auto_879948 ) ) ( not ( = ?auto_879945 ?auto_879949 ) ) ( not ( = ?auto_879945 ?auto_879950 ) ) ( not ( = ?auto_879945 ?auto_879951 ) ) ( not ( = ?auto_879945 ?auto_879952 ) ) ( not ( = ?auto_879945 ?auto_879953 ) ) ( not ( = ?auto_879945 ?auto_879954 ) ) ( not ( = ?auto_879945 ?auto_879955 ) ) ( not ( = ?auto_879945 ?auto_879956 ) ) ( not ( = ?auto_879946 ?auto_879947 ) ) ( not ( = ?auto_879946 ?auto_879948 ) ) ( not ( = ?auto_879946 ?auto_879949 ) ) ( not ( = ?auto_879946 ?auto_879950 ) ) ( not ( = ?auto_879946 ?auto_879951 ) ) ( not ( = ?auto_879946 ?auto_879952 ) ) ( not ( = ?auto_879946 ?auto_879953 ) ) ( not ( = ?auto_879946 ?auto_879954 ) ) ( not ( = ?auto_879946 ?auto_879955 ) ) ( not ( = ?auto_879946 ?auto_879956 ) ) ( not ( = ?auto_879947 ?auto_879948 ) ) ( not ( = ?auto_879947 ?auto_879949 ) ) ( not ( = ?auto_879947 ?auto_879950 ) ) ( not ( = ?auto_879947 ?auto_879951 ) ) ( not ( = ?auto_879947 ?auto_879952 ) ) ( not ( = ?auto_879947 ?auto_879953 ) ) ( not ( = ?auto_879947 ?auto_879954 ) ) ( not ( = ?auto_879947 ?auto_879955 ) ) ( not ( = ?auto_879947 ?auto_879956 ) ) ( not ( = ?auto_879948 ?auto_879949 ) ) ( not ( = ?auto_879948 ?auto_879950 ) ) ( not ( = ?auto_879948 ?auto_879951 ) ) ( not ( = ?auto_879948 ?auto_879952 ) ) ( not ( = ?auto_879948 ?auto_879953 ) ) ( not ( = ?auto_879948 ?auto_879954 ) ) ( not ( = ?auto_879948 ?auto_879955 ) ) ( not ( = ?auto_879948 ?auto_879956 ) ) ( not ( = ?auto_879949 ?auto_879950 ) ) ( not ( = ?auto_879949 ?auto_879951 ) ) ( not ( = ?auto_879949 ?auto_879952 ) ) ( not ( = ?auto_879949 ?auto_879953 ) ) ( not ( = ?auto_879949 ?auto_879954 ) ) ( not ( = ?auto_879949 ?auto_879955 ) ) ( not ( = ?auto_879949 ?auto_879956 ) ) ( not ( = ?auto_879950 ?auto_879951 ) ) ( not ( = ?auto_879950 ?auto_879952 ) ) ( not ( = ?auto_879950 ?auto_879953 ) ) ( not ( = ?auto_879950 ?auto_879954 ) ) ( not ( = ?auto_879950 ?auto_879955 ) ) ( not ( = ?auto_879950 ?auto_879956 ) ) ( not ( = ?auto_879951 ?auto_879952 ) ) ( not ( = ?auto_879951 ?auto_879953 ) ) ( not ( = ?auto_879951 ?auto_879954 ) ) ( not ( = ?auto_879951 ?auto_879955 ) ) ( not ( = ?auto_879951 ?auto_879956 ) ) ( not ( = ?auto_879952 ?auto_879953 ) ) ( not ( = ?auto_879952 ?auto_879954 ) ) ( not ( = ?auto_879952 ?auto_879955 ) ) ( not ( = ?auto_879952 ?auto_879956 ) ) ( not ( = ?auto_879953 ?auto_879954 ) ) ( not ( = ?auto_879953 ?auto_879955 ) ) ( not ( = ?auto_879953 ?auto_879956 ) ) ( not ( = ?auto_879954 ?auto_879955 ) ) ( not ( = ?auto_879954 ?auto_879956 ) ) ( not ( = ?auto_879955 ?auto_879956 ) ) ( ON ?auto_879955 ?auto_879956 ) ( ON ?auto_879954 ?auto_879955 ) ( ON ?auto_879953 ?auto_879954 ) ( ON ?auto_879952 ?auto_879953 ) ( ON ?auto_879951 ?auto_879952 ) ( ON ?auto_879950 ?auto_879951 ) ( ON ?auto_879949 ?auto_879950 ) ( ON ?auto_879948 ?auto_879949 ) ( ON ?auto_879947 ?auto_879948 ) ( ON ?auto_879946 ?auto_879947 ) ( CLEAR ?auto_879944 ) ( ON ?auto_879945 ?auto_879946 ) ( CLEAR ?auto_879945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_879939 ?auto_879940 ?auto_879941 ?auto_879942 ?auto_879943 ?auto_879944 ?auto_879945 )
      ( MAKE-18PILE ?auto_879939 ?auto_879940 ?auto_879941 ?auto_879942 ?auto_879943 ?auto_879944 ?auto_879945 ?auto_879946 ?auto_879947 ?auto_879948 ?auto_879949 ?auto_879950 ?auto_879951 ?auto_879952 ?auto_879953 ?auto_879954 ?auto_879955 ?auto_879956 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_879975 - BLOCK
      ?auto_879976 - BLOCK
      ?auto_879977 - BLOCK
      ?auto_879978 - BLOCK
      ?auto_879979 - BLOCK
      ?auto_879980 - BLOCK
      ?auto_879981 - BLOCK
      ?auto_879982 - BLOCK
      ?auto_879983 - BLOCK
      ?auto_879984 - BLOCK
      ?auto_879985 - BLOCK
      ?auto_879986 - BLOCK
      ?auto_879987 - BLOCK
      ?auto_879988 - BLOCK
      ?auto_879989 - BLOCK
      ?auto_879990 - BLOCK
      ?auto_879991 - BLOCK
      ?auto_879992 - BLOCK
    )
    :vars
    (
      ?auto_879993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_879992 ?auto_879993 ) ( ON-TABLE ?auto_879975 ) ( ON ?auto_879976 ?auto_879975 ) ( ON ?auto_879977 ?auto_879976 ) ( ON ?auto_879978 ?auto_879977 ) ( ON ?auto_879979 ?auto_879978 ) ( not ( = ?auto_879975 ?auto_879976 ) ) ( not ( = ?auto_879975 ?auto_879977 ) ) ( not ( = ?auto_879975 ?auto_879978 ) ) ( not ( = ?auto_879975 ?auto_879979 ) ) ( not ( = ?auto_879975 ?auto_879980 ) ) ( not ( = ?auto_879975 ?auto_879981 ) ) ( not ( = ?auto_879975 ?auto_879982 ) ) ( not ( = ?auto_879975 ?auto_879983 ) ) ( not ( = ?auto_879975 ?auto_879984 ) ) ( not ( = ?auto_879975 ?auto_879985 ) ) ( not ( = ?auto_879975 ?auto_879986 ) ) ( not ( = ?auto_879975 ?auto_879987 ) ) ( not ( = ?auto_879975 ?auto_879988 ) ) ( not ( = ?auto_879975 ?auto_879989 ) ) ( not ( = ?auto_879975 ?auto_879990 ) ) ( not ( = ?auto_879975 ?auto_879991 ) ) ( not ( = ?auto_879975 ?auto_879992 ) ) ( not ( = ?auto_879975 ?auto_879993 ) ) ( not ( = ?auto_879976 ?auto_879977 ) ) ( not ( = ?auto_879976 ?auto_879978 ) ) ( not ( = ?auto_879976 ?auto_879979 ) ) ( not ( = ?auto_879976 ?auto_879980 ) ) ( not ( = ?auto_879976 ?auto_879981 ) ) ( not ( = ?auto_879976 ?auto_879982 ) ) ( not ( = ?auto_879976 ?auto_879983 ) ) ( not ( = ?auto_879976 ?auto_879984 ) ) ( not ( = ?auto_879976 ?auto_879985 ) ) ( not ( = ?auto_879976 ?auto_879986 ) ) ( not ( = ?auto_879976 ?auto_879987 ) ) ( not ( = ?auto_879976 ?auto_879988 ) ) ( not ( = ?auto_879976 ?auto_879989 ) ) ( not ( = ?auto_879976 ?auto_879990 ) ) ( not ( = ?auto_879976 ?auto_879991 ) ) ( not ( = ?auto_879976 ?auto_879992 ) ) ( not ( = ?auto_879976 ?auto_879993 ) ) ( not ( = ?auto_879977 ?auto_879978 ) ) ( not ( = ?auto_879977 ?auto_879979 ) ) ( not ( = ?auto_879977 ?auto_879980 ) ) ( not ( = ?auto_879977 ?auto_879981 ) ) ( not ( = ?auto_879977 ?auto_879982 ) ) ( not ( = ?auto_879977 ?auto_879983 ) ) ( not ( = ?auto_879977 ?auto_879984 ) ) ( not ( = ?auto_879977 ?auto_879985 ) ) ( not ( = ?auto_879977 ?auto_879986 ) ) ( not ( = ?auto_879977 ?auto_879987 ) ) ( not ( = ?auto_879977 ?auto_879988 ) ) ( not ( = ?auto_879977 ?auto_879989 ) ) ( not ( = ?auto_879977 ?auto_879990 ) ) ( not ( = ?auto_879977 ?auto_879991 ) ) ( not ( = ?auto_879977 ?auto_879992 ) ) ( not ( = ?auto_879977 ?auto_879993 ) ) ( not ( = ?auto_879978 ?auto_879979 ) ) ( not ( = ?auto_879978 ?auto_879980 ) ) ( not ( = ?auto_879978 ?auto_879981 ) ) ( not ( = ?auto_879978 ?auto_879982 ) ) ( not ( = ?auto_879978 ?auto_879983 ) ) ( not ( = ?auto_879978 ?auto_879984 ) ) ( not ( = ?auto_879978 ?auto_879985 ) ) ( not ( = ?auto_879978 ?auto_879986 ) ) ( not ( = ?auto_879978 ?auto_879987 ) ) ( not ( = ?auto_879978 ?auto_879988 ) ) ( not ( = ?auto_879978 ?auto_879989 ) ) ( not ( = ?auto_879978 ?auto_879990 ) ) ( not ( = ?auto_879978 ?auto_879991 ) ) ( not ( = ?auto_879978 ?auto_879992 ) ) ( not ( = ?auto_879978 ?auto_879993 ) ) ( not ( = ?auto_879979 ?auto_879980 ) ) ( not ( = ?auto_879979 ?auto_879981 ) ) ( not ( = ?auto_879979 ?auto_879982 ) ) ( not ( = ?auto_879979 ?auto_879983 ) ) ( not ( = ?auto_879979 ?auto_879984 ) ) ( not ( = ?auto_879979 ?auto_879985 ) ) ( not ( = ?auto_879979 ?auto_879986 ) ) ( not ( = ?auto_879979 ?auto_879987 ) ) ( not ( = ?auto_879979 ?auto_879988 ) ) ( not ( = ?auto_879979 ?auto_879989 ) ) ( not ( = ?auto_879979 ?auto_879990 ) ) ( not ( = ?auto_879979 ?auto_879991 ) ) ( not ( = ?auto_879979 ?auto_879992 ) ) ( not ( = ?auto_879979 ?auto_879993 ) ) ( not ( = ?auto_879980 ?auto_879981 ) ) ( not ( = ?auto_879980 ?auto_879982 ) ) ( not ( = ?auto_879980 ?auto_879983 ) ) ( not ( = ?auto_879980 ?auto_879984 ) ) ( not ( = ?auto_879980 ?auto_879985 ) ) ( not ( = ?auto_879980 ?auto_879986 ) ) ( not ( = ?auto_879980 ?auto_879987 ) ) ( not ( = ?auto_879980 ?auto_879988 ) ) ( not ( = ?auto_879980 ?auto_879989 ) ) ( not ( = ?auto_879980 ?auto_879990 ) ) ( not ( = ?auto_879980 ?auto_879991 ) ) ( not ( = ?auto_879980 ?auto_879992 ) ) ( not ( = ?auto_879980 ?auto_879993 ) ) ( not ( = ?auto_879981 ?auto_879982 ) ) ( not ( = ?auto_879981 ?auto_879983 ) ) ( not ( = ?auto_879981 ?auto_879984 ) ) ( not ( = ?auto_879981 ?auto_879985 ) ) ( not ( = ?auto_879981 ?auto_879986 ) ) ( not ( = ?auto_879981 ?auto_879987 ) ) ( not ( = ?auto_879981 ?auto_879988 ) ) ( not ( = ?auto_879981 ?auto_879989 ) ) ( not ( = ?auto_879981 ?auto_879990 ) ) ( not ( = ?auto_879981 ?auto_879991 ) ) ( not ( = ?auto_879981 ?auto_879992 ) ) ( not ( = ?auto_879981 ?auto_879993 ) ) ( not ( = ?auto_879982 ?auto_879983 ) ) ( not ( = ?auto_879982 ?auto_879984 ) ) ( not ( = ?auto_879982 ?auto_879985 ) ) ( not ( = ?auto_879982 ?auto_879986 ) ) ( not ( = ?auto_879982 ?auto_879987 ) ) ( not ( = ?auto_879982 ?auto_879988 ) ) ( not ( = ?auto_879982 ?auto_879989 ) ) ( not ( = ?auto_879982 ?auto_879990 ) ) ( not ( = ?auto_879982 ?auto_879991 ) ) ( not ( = ?auto_879982 ?auto_879992 ) ) ( not ( = ?auto_879982 ?auto_879993 ) ) ( not ( = ?auto_879983 ?auto_879984 ) ) ( not ( = ?auto_879983 ?auto_879985 ) ) ( not ( = ?auto_879983 ?auto_879986 ) ) ( not ( = ?auto_879983 ?auto_879987 ) ) ( not ( = ?auto_879983 ?auto_879988 ) ) ( not ( = ?auto_879983 ?auto_879989 ) ) ( not ( = ?auto_879983 ?auto_879990 ) ) ( not ( = ?auto_879983 ?auto_879991 ) ) ( not ( = ?auto_879983 ?auto_879992 ) ) ( not ( = ?auto_879983 ?auto_879993 ) ) ( not ( = ?auto_879984 ?auto_879985 ) ) ( not ( = ?auto_879984 ?auto_879986 ) ) ( not ( = ?auto_879984 ?auto_879987 ) ) ( not ( = ?auto_879984 ?auto_879988 ) ) ( not ( = ?auto_879984 ?auto_879989 ) ) ( not ( = ?auto_879984 ?auto_879990 ) ) ( not ( = ?auto_879984 ?auto_879991 ) ) ( not ( = ?auto_879984 ?auto_879992 ) ) ( not ( = ?auto_879984 ?auto_879993 ) ) ( not ( = ?auto_879985 ?auto_879986 ) ) ( not ( = ?auto_879985 ?auto_879987 ) ) ( not ( = ?auto_879985 ?auto_879988 ) ) ( not ( = ?auto_879985 ?auto_879989 ) ) ( not ( = ?auto_879985 ?auto_879990 ) ) ( not ( = ?auto_879985 ?auto_879991 ) ) ( not ( = ?auto_879985 ?auto_879992 ) ) ( not ( = ?auto_879985 ?auto_879993 ) ) ( not ( = ?auto_879986 ?auto_879987 ) ) ( not ( = ?auto_879986 ?auto_879988 ) ) ( not ( = ?auto_879986 ?auto_879989 ) ) ( not ( = ?auto_879986 ?auto_879990 ) ) ( not ( = ?auto_879986 ?auto_879991 ) ) ( not ( = ?auto_879986 ?auto_879992 ) ) ( not ( = ?auto_879986 ?auto_879993 ) ) ( not ( = ?auto_879987 ?auto_879988 ) ) ( not ( = ?auto_879987 ?auto_879989 ) ) ( not ( = ?auto_879987 ?auto_879990 ) ) ( not ( = ?auto_879987 ?auto_879991 ) ) ( not ( = ?auto_879987 ?auto_879992 ) ) ( not ( = ?auto_879987 ?auto_879993 ) ) ( not ( = ?auto_879988 ?auto_879989 ) ) ( not ( = ?auto_879988 ?auto_879990 ) ) ( not ( = ?auto_879988 ?auto_879991 ) ) ( not ( = ?auto_879988 ?auto_879992 ) ) ( not ( = ?auto_879988 ?auto_879993 ) ) ( not ( = ?auto_879989 ?auto_879990 ) ) ( not ( = ?auto_879989 ?auto_879991 ) ) ( not ( = ?auto_879989 ?auto_879992 ) ) ( not ( = ?auto_879989 ?auto_879993 ) ) ( not ( = ?auto_879990 ?auto_879991 ) ) ( not ( = ?auto_879990 ?auto_879992 ) ) ( not ( = ?auto_879990 ?auto_879993 ) ) ( not ( = ?auto_879991 ?auto_879992 ) ) ( not ( = ?auto_879991 ?auto_879993 ) ) ( not ( = ?auto_879992 ?auto_879993 ) ) ( ON ?auto_879991 ?auto_879992 ) ( ON ?auto_879990 ?auto_879991 ) ( ON ?auto_879989 ?auto_879990 ) ( ON ?auto_879988 ?auto_879989 ) ( ON ?auto_879987 ?auto_879988 ) ( ON ?auto_879986 ?auto_879987 ) ( ON ?auto_879985 ?auto_879986 ) ( ON ?auto_879984 ?auto_879985 ) ( ON ?auto_879983 ?auto_879984 ) ( ON ?auto_879982 ?auto_879983 ) ( ON ?auto_879981 ?auto_879982 ) ( CLEAR ?auto_879979 ) ( ON ?auto_879980 ?auto_879981 ) ( CLEAR ?auto_879980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_879975 ?auto_879976 ?auto_879977 ?auto_879978 ?auto_879979 ?auto_879980 )
      ( MAKE-18PILE ?auto_879975 ?auto_879976 ?auto_879977 ?auto_879978 ?auto_879979 ?auto_879980 ?auto_879981 ?auto_879982 ?auto_879983 ?auto_879984 ?auto_879985 ?auto_879986 ?auto_879987 ?auto_879988 ?auto_879989 ?auto_879990 ?auto_879991 ?auto_879992 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_880012 - BLOCK
      ?auto_880013 - BLOCK
      ?auto_880014 - BLOCK
      ?auto_880015 - BLOCK
      ?auto_880016 - BLOCK
      ?auto_880017 - BLOCK
      ?auto_880018 - BLOCK
      ?auto_880019 - BLOCK
      ?auto_880020 - BLOCK
      ?auto_880021 - BLOCK
      ?auto_880022 - BLOCK
      ?auto_880023 - BLOCK
      ?auto_880024 - BLOCK
      ?auto_880025 - BLOCK
      ?auto_880026 - BLOCK
      ?auto_880027 - BLOCK
      ?auto_880028 - BLOCK
      ?auto_880029 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_880029 ) ( ON-TABLE ?auto_880012 ) ( ON ?auto_880013 ?auto_880012 ) ( ON ?auto_880014 ?auto_880013 ) ( ON ?auto_880015 ?auto_880014 ) ( ON ?auto_880016 ?auto_880015 ) ( not ( = ?auto_880012 ?auto_880013 ) ) ( not ( = ?auto_880012 ?auto_880014 ) ) ( not ( = ?auto_880012 ?auto_880015 ) ) ( not ( = ?auto_880012 ?auto_880016 ) ) ( not ( = ?auto_880012 ?auto_880017 ) ) ( not ( = ?auto_880012 ?auto_880018 ) ) ( not ( = ?auto_880012 ?auto_880019 ) ) ( not ( = ?auto_880012 ?auto_880020 ) ) ( not ( = ?auto_880012 ?auto_880021 ) ) ( not ( = ?auto_880012 ?auto_880022 ) ) ( not ( = ?auto_880012 ?auto_880023 ) ) ( not ( = ?auto_880012 ?auto_880024 ) ) ( not ( = ?auto_880012 ?auto_880025 ) ) ( not ( = ?auto_880012 ?auto_880026 ) ) ( not ( = ?auto_880012 ?auto_880027 ) ) ( not ( = ?auto_880012 ?auto_880028 ) ) ( not ( = ?auto_880012 ?auto_880029 ) ) ( not ( = ?auto_880013 ?auto_880014 ) ) ( not ( = ?auto_880013 ?auto_880015 ) ) ( not ( = ?auto_880013 ?auto_880016 ) ) ( not ( = ?auto_880013 ?auto_880017 ) ) ( not ( = ?auto_880013 ?auto_880018 ) ) ( not ( = ?auto_880013 ?auto_880019 ) ) ( not ( = ?auto_880013 ?auto_880020 ) ) ( not ( = ?auto_880013 ?auto_880021 ) ) ( not ( = ?auto_880013 ?auto_880022 ) ) ( not ( = ?auto_880013 ?auto_880023 ) ) ( not ( = ?auto_880013 ?auto_880024 ) ) ( not ( = ?auto_880013 ?auto_880025 ) ) ( not ( = ?auto_880013 ?auto_880026 ) ) ( not ( = ?auto_880013 ?auto_880027 ) ) ( not ( = ?auto_880013 ?auto_880028 ) ) ( not ( = ?auto_880013 ?auto_880029 ) ) ( not ( = ?auto_880014 ?auto_880015 ) ) ( not ( = ?auto_880014 ?auto_880016 ) ) ( not ( = ?auto_880014 ?auto_880017 ) ) ( not ( = ?auto_880014 ?auto_880018 ) ) ( not ( = ?auto_880014 ?auto_880019 ) ) ( not ( = ?auto_880014 ?auto_880020 ) ) ( not ( = ?auto_880014 ?auto_880021 ) ) ( not ( = ?auto_880014 ?auto_880022 ) ) ( not ( = ?auto_880014 ?auto_880023 ) ) ( not ( = ?auto_880014 ?auto_880024 ) ) ( not ( = ?auto_880014 ?auto_880025 ) ) ( not ( = ?auto_880014 ?auto_880026 ) ) ( not ( = ?auto_880014 ?auto_880027 ) ) ( not ( = ?auto_880014 ?auto_880028 ) ) ( not ( = ?auto_880014 ?auto_880029 ) ) ( not ( = ?auto_880015 ?auto_880016 ) ) ( not ( = ?auto_880015 ?auto_880017 ) ) ( not ( = ?auto_880015 ?auto_880018 ) ) ( not ( = ?auto_880015 ?auto_880019 ) ) ( not ( = ?auto_880015 ?auto_880020 ) ) ( not ( = ?auto_880015 ?auto_880021 ) ) ( not ( = ?auto_880015 ?auto_880022 ) ) ( not ( = ?auto_880015 ?auto_880023 ) ) ( not ( = ?auto_880015 ?auto_880024 ) ) ( not ( = ?auto_880015 ?auto_880025 ) ) ( not ( = ?auto_880015 ?auto_880026 ) ) ( not ( = ?auto_880015 ?auto_880027 ) ) ( not ( = ?auto_880015 ?auto_880028 ) ) ( not ( = ?auto_880015 ?auto_880029 ) ) ( not ( = ?auto_880016 ?auto_880017 ) ) ( not ( = ?auto_880016 ?auto_880018 ) ) ( not ( = ?auto_880016 ?auto_880019 ) ) ( not ( = ?auto_880016 ?auto_880020 ) ) ( not ( = ?auto_880016 ?auto_880021 ) ) ( not ( = ?auto_880016 ?auto_880022 ) ) ( not ( = ?auto_880016 ?auto_880023 ) ) ( not ( = ?auto_880016 ?auto_880024 ) ) ( not ( = ?auto_880016 ?auto_880025 ) ) ( not ( = ?auto_880016 ?auto_880026 ) ) ( not ( = ?auto_880016 ?auto_880027 ) ) ( not ( = ?auto_880016 ?auto_880028 ) ) ( not ( = ?auto_880016 ?auto_880029 ) ) ( not ( = ?auto_880017 ?auto_880018 ) ) ( not ( = ?auto_880017 ?auto_880019 ) ) ( not ( = ?auto_880017 ?auto_880020 ) ) ( not ( = ?auto_880017 ?auto_880021 ) ) ( not ( = ?auto_880017 ?auto_880022 ) ) ( not ( = ?auto_880017 ?auto_880023 ) ) ( not ( = ?auto_880017 ?auto_880024 ) ) ( not ( = ?auto_880017 ?auto_880025 ) ) ( not ( = ?auto_880017 ?auto_880026 ) ) ( not ( = ?auto_880017 ?auto_880027 ) ) ( not ( = ?auto_880017 ?auto_880028 ) ) ( not ( = ?auto_880017 ?auto_880029 ) ) ( not ( = ?auto_880018 ?auto_880019 ) ) ( not ( = ?auto_880018 ?auto_880020 ) ) ( not ( = ?auto_880018 ?auto_880021 ) ) ( not ( = ?auto_880018 ?auto_880022 ) ) ( not ( = ?auto_880018 ?auto_880023 ) ) ( not ( = ?auto_880018 ?auto_880024 ) ) ( not ( = ?auto_880018 ?auto_880025 ) ) ( not ( = ?auto_880018 ?auto_880026 ) ) ( not ( = ?auto_880018 ?auto_880027 ) ) ( not ( = ?auto_880018 ?auto_880028 ) ) ( not ( = ?auto_880018 ?auto_880029 ) ) ( not ( = ?auto_880019 ?auto_880020 ) ) ( not ( = ?auto_880019 ?auto_880021 ) ) ( not ( = ?auto_880019 ?auto_880022 ) ) ( not ( = ?auto_880019 ?auto_880023 ) ) ( not ( = ?auto_880019 ?auto_880024 ) ) ( not ( = ?auto_880019 ?auto_880025 ) ) ( not ( = ?auto_880019 ?auto_880026 ) ) ( not ( = ?auto_880019 ?auto_880027 ) ) ( not ( = ?auto_880019 ?auto_880028 ) ) ( not ( = ?auto_880019 ?auto_880029 ) ) ( not ( = ?auto_880020 ?auto_880021 ) ) ( not ( = ?auto_880020 ?auto_880022 ) ) ( not ( = ?auto_880020 ?auto_880023 ) ) ( not ( = ?auto_880020 ?auto_880024 ) ) ( not ( = ?auto_880020 ?auto_880025 ) ) ( not ( = ?auto_880020 ?auto_880026 ) ) ( not ( = ?auto_880020 ?auto_880027 ) ) ( not ( = ?auto_880020 ?auto_880028 ) ) ( not ( = ?auto_880020 ?auto_880029 ) ) ( not ( = ?auto_880021 ?auto_880022 ) ) ( not ( = ?auto_880021 ?auto_880023 ) ) ( not ( = ?auto_880021 ?auto_880024 ) ) ( not ( = ?auto_880021 ?auto_880025 ) ) ( not ( = ?auto_880021 ?auto_880026 ) ) ( not ( = ?auto_880021 ?auto_880027 ) ) ( not ( = ?auto_880021 ?auto_880028 ) ) ( not ( = ?auto_880021 ?auto_880029 ) ) ( not ( = ?auto_880022 ?auto_880023 ) ) ( not ( = ?auto_880022 ?auto_880024 ) ) ( not ( = ?auto_880022 ?auto_880025 ) ) ( not ( = ?auto_880022 ?auto_880026 ) ) ( not ( = ?auto_880022 ?auto_880027 ) ) ( not ( = ?auto_880022 ?auto_880028 ) ) ( not ( = ?auto_880022 ?auto_880029 ) ) ( not ( = ?auto_880023 ?auto_880024 ) ) ( not ( = ?auto_880023 ?auto_880025 ) ) ( not ( = ?auto_880023 ?auto_880026 ) ) ( not ( = ?auto_880023 ?auto_880027 ) ) ( not ( = ?auto_880023 ?auto_880028 ) ) ( not ( = ?auto_880023 ?auto_880029 ) ) ( not ( = ?auto_880024 ?auto_880025 ) ) ( not ( = ?auto_880024 ?auto_880026 ) ) ( not ( = ?auto_880024 ?auto_880027 ) ) ( not ( = ?auto_880024 ?auto_880028 ) ) ( not ( = ?auto_880024 ?auto_880029 ) ) ( not ( = ?auto_880025 ?auto_880026 ) ) ( not ( = ?auto_880025 ?auto_880027 ) ) ( not ( = ?auto_880025 ?auto_880028 ) ) ( not ( = ?auto_880025 ?auto_880029 ) ) ( not ( = ?auto_880026 ?auto_880027 ) ) ( not ( = ?auto_880026 ?auto_880028 ) ) ( not ( = ?auto_880026 ?auto_880029 ) ) ( not ( = ?auto_880027 ?auto_880028 ) ) ( not ( = ?auto_880027 ?auto_880029 ) ) ( not ( = ?auto_880028 ?auto_880029 ) ) ( ON ?auto_880028 ?auto_880029 ) ( ON ?auto_880027 ?auto_880028 ) ( ON ?auto_880026 ?auto_880027 ) ( ON ?auto_880025 ?auto_880026 ) ( ON ?auto_880024 ?auto_880025 ) ( ON ?auto_880023 ?auto_880024 ) ( ON ?auto_880022 ?auto_880023 ) ( ON ?auto_880021 ?auto_880022 ) ( ON ?auto_880020 ?auto_880021 ) ( ON ?auto_880019 ?auto_880020 ) ( ON ?auto_880018 ?auto_880019 ) ( CLEAR ?auto_880016 ) ( ON ?auto_880017 ?auto_880018 ) ( CLEAR ?auto_880017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_880012 ?auto_880013 ?auto_880014 ?auto_880015 ?auto_880016 ?auto_880017 )
      ( MAKE-18PILE ?auto_880012 ?auto_880013 ?auto_880014 ?auto_880015 ?auto_880016 ?auto_880017 ?auto_880018 ?auto_880019 ?auto_880020 ?auto_880021 ?auto_880022 ?auto_880023 ?auto_880024 ?auto_880025 ?auto_880026 ?auto_880027 ?auto_880028 ?auto_880029 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_880048 - BLOCK
      ?auto_880049 - BLOCK
      ?auto_880050 - BLOCK
      ?auto_880051 - BLOCK
      ?auto_880052 - BLOCK
      ?auto_880053 - BLOCK
      ?auto_880054 - BLOCK
      ?auto_880055 - BLOCK
      ?auto_880056 - BLOCK
      ?auto_880057 - BLOCK
      ?auto_880058 - BLOCK
      ?auto_880059 - BLOCK
      ?auto_880060 - BLOCK
      ?auto_880061 - BLOCK
      ?auto_880062 - BLOCK
      ?auto_880063 - BLOCK
      ?auto_880064 - BLOCK
      ?auto_880065 - BLOCK
    )
    :vars
    (
      ?auto_880066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_880065 ?auto_880066 ) ( ON-TABLE ?auto_880048 ) ( ON ?auto_880049 ?auto_880048 ) ( ON ?auto_880050 ?auto_880049 ) ( ON ?auto_880051 ?auto_880050 ) ( not ( = ?auto_880048 ?auto_880049 ) ) ( not ( = ?auto_880048 ?auto_880050 ) ) ( not ( = ?auto_880048 ?auto_880051 ) ) ( not ( = ?auto_880048 ?auto_880052 ) ) ( not ( = ?auto_880048 ?auto_880053 ) ) ( not ( = ?auto_880048 ?auto_880054 ) ) ( not ( = ?auto_880048 ?auto_880055 ) ) ( not ( = ?auto_880048 ?auto_880056 ) ) ( not ( = ?auto_880048 ?auto_880057 ) ) ( not ( = ?auto_880048 ?auto_880058 ) ) ( not ( = ?auto_880048 ?auto_880059 ) ) ( not ( = ?auto_880048 ?auto_880060 ) ) ( not ( = ?auto_880048 ?auto_880061 ) ) ( not ( = ?auto_880048 ?auto_880062 ) ) ( not ( = ?auto_880048 ?auto_880063 ) ) ( not ( = ?auto_880048 ?auto_880064 ) ) ( not ( = ?auto_880048 ?auto_880065 ) ) ( not ( = ?auto_880048 ?auto_880066 ) ) ( not ( = ?auto_880049 ?auto_880050 ) ) ( not ( = ?auto_880049 ?auto_880051 ) ) ( not ( = ?auto_880049 ?auto_880052 ) ) ( not ( = ?auto_880049 ?auto_880053 ) ) ( not ( = ?auto_880049 ?auto_880054 ) ) ( not ( = ?auto_880049 ?auto_880055 ) ) ( not ( = ?auto_880049 ?auto_880056 ) ) ( not ( = ?auto_880049 ?auto_880057 ) ) ( not ( = ?auto_880049 ?auto_880058 ) ) ( not ( = ?auto_880049 ?auto_880059 ) ) ( not ( = ?auto_880049 ?auto_880060 ) ) ( not ( = ?auto_880049 ?auto_880061 ) ) ( not ( = ?auto_880049 ?auto_880062 ) ) ( not ( = ?auto_880049 ?auto_880063 ) ) ( not ( = ?auto_880049 ?auto_880064 ) ) ( not ( = ?auto_880049 ?auto_880065 ) ) ( not ( = ?auto_880049 ?auto_880066 ) ) ( not ( = ?auto_880050 ?auto_880051 ) ) ( not ( = ?auto_880050 ?auto_880052 ) ) ( not ( = ?auto_880050 ?auto_880053 ) ) ( not ( = ?auto_880050 ?auto_880054 ) ) ( not ( = ?auto_880050 ?auto_880055 ) ) ( not ( = ?auto_880050 ?auto_880056 ) ) ( not ( = ?auto_880050 ?auto_880057 ) ) ( not ( = ?auto_880050 ?auto_880058 ) ) ( not ( = ?auto_880050 ?auto_880059 ) ) ( not ( = ?auto_880050 ?auto_880060 ) ) ( not ( = ?auto_880050 ?auto_880061 ) ) ( not ( = ?auto_880050 ?auto_880062 ) ) ( not ( = ?auto_880050 ?auto_880063 ) ) ( not ( = ?auto_880050 ?auto_880064 ) ) ( not ( = ?auto_880050 ?auto_880065 ) ) ( not ( = ?auto_880050 ?auto_880066 ) ) ( not ( = ?auto_880051 ?auto_880052 ) ) ( not ( = ?auto_880051 ?auto_880053 ) ) ( not ( = ?auto_880051 ?auto_880054 ) ) ( not ( = ?auto_880051 ?auto_880055 ) ) ( not ( = ?auto_880051 ?auto_880056 ) ) ( not ( = ?auto_880051 ?auto_880057 ) ) ( not ( = ?auto_880051 ?auto_880058 ) ) ( not ( = ?auto_880051 ?auto_880059 ) ) ( not ( = ?auto_880051 ?auto_880060 ) ) ( not ( = ?auto_880051 ?auto_880061 ) ) ( not ( = ?auto_880051 ?auto_880062 ) ) ( not ( = ?auto_880051 ?auto_880063 ) ) ( not ( = ?auto_880051 ?auto_880064 ) ) ( not ( = ?auto_880051 ?auto_880065 ) ) ( not ( = ?auto_880051 ?auto_880066 ) ) ( not ( = ?auto_880052 ?auto_880053 ) ) ( not ( = ?auto_880052 ?auto_880054 ) ) ( not ( = ?auto_880052 ?auto_880055 ) ) ( not ( = ?auto_880052 ?auto_880056 ) ) ( not ( = ?auto_880052 ?auto_880057 ) ) ( not ( = ?auto_880052 ?auto_880058 ) ) ( not ( = ?auto_880052 ?auto_880059 ) ) ( not ( = ?auto_880052 ?auto_880060 ) ) ( not ( = ?auto_880052 ?auto_880061 ) ) ( not ( = ?auto_880052 ?auto_880062 ) ) ( not ( = ?auto_880052 ?auto_880063 ) ) ( not ( = ?auto_880052 ?auto_880064 ) ) ( not ( = ?auto_880052 ?auto_880065 ) ) ( not ( = ?auto_880052 ?auto_880066 ) ) ( not ( = ?auto_880053 ?auto_880054 ) ) ( not ( = ?auto_880053 ?auto_880055 ) ) ( not ( = ?auto_880053 ?auto_880056 ) ) ( not ( = ?auto_880053 ?auto_880057 ) ) ( not ( = ?auto_880053 ?auto_880058 ) ) ( not ( = ?auto_880053 ?auto_880059 ) ) ( not ( = ?auto_880053 ?auto_880060 ) ) ( not ( = ?auto_880053 ?auto_880061 ) ) ( not ( = ?auto_880053 ?auto_880062 ) ) ( not ( = ?auto_880053 ?auto_880063 ) ) ( not ( = ?auto_880053 ?auto_880064 ) ) ( not ( = ?auto_880053 ?auto_880065 ) ) ( not ( = ?auto_880053 ?auto_880066 ) ) ( not ( = ?auto_880054 ?auto_880055 ) ) ( not ( = ?auto_880054 ?auto_880056 ) ) ( not ( = ?auto_880054 ?auto_880057 ) ) ( not ( = ?auto_880054 ?auto_880058 ) ) ( not ( = ?auto_880054 ?auto_880059 ) ) ( not ( = ?auto_880054 ?auto_880060 ) ) ( not ( = ?auto_880054 ?auto_880061 ) ) ( not ( = ?auto_880054 ?auto_880062 ) ) ( not ( = ?auto_880054 ?auto_880063 ) ) ( not ( = ?auto_880054 ?auto_880064 ) ) ( not ( = ?auto_880054 ?auto_880065 ) ) ( not ( = ?auto_880054 ?auto_880066 ) ) ( not ( = ?auto_880055 ?auto_880056 ) ) ( not ( = ?auto_880055 ?auto_880057 ) ) ( not ( = ?auto_880055 ?auto_880058 ) ) ( not ( = ?auto_880055 ?auto_880059 ) ) ( not ( = ?auto_880055 ?auto_880060 ) ) ( not ( = ?auto_880055 ?auto_880061 ) ) ( not ( = ?auto_880055 ?auto_880062 ) ) ( not ( = ?auto_880055 ?auto_880063 ) ) ( not ( = ?auto_880055 ?auto_880064 ) ) ( not ( = ?auto_880055 ?auto_880065 ) ) ( not ( = ?auto_880055 ?auto_880066 ) ) ( not ( = ?auto_880056 ?auto_880057 ) ) ( not ( = ?auto_880056 ?auto_880058 ) ) ( not ( = ?auto_880056 ?auto_880059 ) ) ( not ( = ?auto_880056 ?auto_880060 ) ) ( not ( = ?auto_880056 ?auto_880061 ) ) ( not ( = ?auto_880056 ?auto_880062 ) ) ( not ( = ?auto_880056 ?auto_880063 ) ) ( not ( = ?auto_880056 ?auto_880064 ) ) ( not ( = ?auto_880056 ?auto_880065 ) ) ( not ( = ?auto_880056 ?auto_880066 ) ) ( not ( = ?auto_880057 ?auto_880058 ) ) ( not ( = ?auto_880057 ?auto_880059 ) ) ( not ( = ?auto_880057 ?auto_880060 ) ) ( not ( = ?auto_880057 ?auto_880061 ) ) ( not ( = ?auto_880057 ?auto_880062 ) ) ( not ( = ?auto_880057 ?auto_880063 ) ) ( not ( = ?auto_880057 ?auto_880064 ) ) ( not ( = ?auto_880057 ?auto_880065 ) ) ( not ( = ?auto_880057 ?auto_880066 ) ) ( not ( = ?auto_880058 ?auto_880059 ) ) ( not ( = ?auto_880058 ?auto_880060 ) ) ( not ( = ?auto_880058 ?auto_880061 ) ) ( not ( = ?auto_880058 ?auto_880062 ) ) ( not ( = ?auto_880058 ?auto_880063 ) ) ( not ( = ?auto_880058 ?auto_880064 ) ) ( not ( = ?auto_880058 ?auto_880065 ) ) ( not ( = ?auto_880058 ?auto_880066 ) ) ( not ( = ?auto_880059 ?auto_880060 ) ) ( not ( = ?auto_880059 ?auto_880061 ) ) ( not ( = ?auto_880059 ?auto_880062 ) ) ( not ( = ?auto_880059 ?auto_880063 ) ) ( not ( = ?auto_880059 ?auto_880064 ) ) ( not ( = ?auto_880059 ?auto_880065 ) ) ( not ( = ?auto_880059 ?auto_880066 ) ) ( not ( = ?auto_880060 ?auto_880061 ) ) ( not ( = ?auto_880060 ?auto_880062 ) ) ( not ( = ?auto_880060 ?auto_880063 ) ) ( not ( = ?auto_880060 ?auto_880064 ) ) ( not ( = ?auto_880060 ?auto_880065 ) ) ( not ( = ?auto_880060 ?auto_880066 ) ) ( not ( = ?auto_880061 ?auto_880062 ) ) ( not ( = ?auto_880061 ?auto_880063 ) ) ( not ( = ?auto_880061 ?auto_880064 ) ) ( not ( = ?auto_880061 ?auto_880065 ) ) ( not ( = ?auto_880061 ?auto_880066 ) ) ( not ( = ?auto_880062 ?auto_880063 ) ) ( not ( = ?auto_880062 ?auto_880064 ) ) ( not ( = ?auto_880062 ?auto_880065 ) ) ( not ( = ?auto_880062 ?auto_880066 ) ) ( not ( = ?auto_880063 ?auto_880064 ) ) ( not ( = ?auto_880063 ?auto_880065 ) ) ( not ( = ?auto_880063 ?auto_880066 ) ) ( not ( = ?auto_880064 ?auto_880065 ) ) ( not ( = ?auto_880064 ?auto_880066 ) ) ( not ( = ?auto_880065 ?auto_880066 ) ) ( ON ?auto_880064 ?auto_880065 ) ( ON ?auto_880063 ?auto_880064 ) ( ON ?auto_880062 ?auto_880063 ) ( ON ?auto_880061 ?auto_880062 ) ( ON ?auto_880060 ?auto_880061 ) ( ON ?auto_880059 ?auto_880060 ) ( ON ?auto_880058 ?auto_880059 ) ( ON ?auto_880057 ?auto_880058 ) ( ON ?auto_880056 ?auto_880057 ) ( ON ?auto_880055 ?auto_880056 ) ( ON ?auto_880054 ?auto_880055 ) ( ON ?auto_880053 ?auto_880054 ) ( CLEAR ?auto_880051 ) ( ON ?auto_880052 ?auto_880053 ) ( CLEAR ?auto_880052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_880048 ?auto_880049 ?auto_880050 ?auto_880051 ?auto_880052 )
      ( MAKE-18PILE ?auto_880048 ?auto_880049 ?auto_880050 ?auto_880051 ?auto_880052 ?auto_880053 ?auto_880054 ?auto_880055 ?auto_880056 ?auto_880057 ?auto_880058 ?auto_880059 ?auto_880060 ?auto_880061 ?auto_880062 ?auto_880063 ?auto_880064 ?auto_880065 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_880085 - BLOCK
      ?auto_880086 - BLOCK
      ?auto_880087 - BLOCK
      ?auto_880088 - BLOCK
      ?auto_880089 - BLOCK
      ?auto_880090 - BLOCK
      ?auto_880091 - BLOCK
      ?auto_880092 - BLOCK
      ?auto_880093 - BLOCK
      ?auto_880094 - BLOCK
      ?auto_880095 - BLOCK
      ?auto_880096 - BLOCK
      ?auto_880097 - BLOCK
      ?auto_880098 - BLOCK
      ?auto_880099 - BLOCK
      ?auto_880100 - BLOCK
      ?auto_880101 - BLOCK
      ?auto_880102 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_880102 ) ( ON-TABLE ?auto_880085 ) ( ON ?auto_880086 ?auto_880085 ) ( ON ?auto_880087 ?auto_880086 ) ( ON ?auto_880088 ?auto_880087 ) ( not ( = ?auto_880085 ?auto_880086 ) ) ( not ( = ?auto_880085 ?auto_880087 ) ) ( not ( = ?auto_880085 ?auto_880088 ) ) ( not ( = ?auto_880085 ?auto_880089 ) ) ( not ( = ?auto_880085 ?auto_880090 ) ) ( not ( = ?auto_880085 ?auto_880091 ) ) ( not ( = ?auto_880085 ?auto_880092 ) ) ( not ( = ?auto_880085 ?auto_880093 ) ) ( not ( = ?auto_880085 ?auto_880094 ) ) ( not ( = ?auto_880085 ?auto_880095 ) ) ( not ( = ?auto_880085 ?auto_880096 ) ) ( not ( = ?auto_880085 ?auto_880097 ) ) ( not ( = ?auto_880085 ?auto_880098 ) ) ( not ( = ?auto_880085 ?auto_880099 ) ) ( not ( = ?auto_880085 ?auto_880100 ) ) ( not ( = ?auto_880085 ?auto_880101 ) ) ( not ( = ?auto_880085 ?auto_880102 ) ) ( not ( = ?auto_880086 ?auto_880087 ) ) ( not ( = ?auto_880086 ?auto_880088 ) ) ( not ( = ?auto_880086 ?auto_880089 ) ) ( not ( = ?auto_880086 ?auto_880090 ) ) ( not ( = ?auto_880086 ?auto_880091 ) ) ( not ( = ?auto_880086 ?auto_880092 ) ) ( not ( = ?auto_880086 ?auto_880093 ) ) ( not ( = ?auto_880086 ?auto_880094 ) ) ( not ( = ?auto_880086 ?auto_880095 ) ) ( not ( = ?auto_880086 ?auto_880096 ) ) ( not ( = ?auto_880086 ?auto_880097 ) ) ( not ( = ?auto_880086 ?auto_880098 ) ) ( not ( = ?auto_880086 ?auto_880099 ) ) ( not ( = ?auto_880086 ?auto_880100 ) ) ( not ( = ?auto_880086 ?auto_880101 ) ) ( not ( = ?auto_880086 ?auto_880102 ) ) ( not ( = ?auto_880087 ?auto_880088 ) ) ( not ( = ?auto_880087 ?auto_880089 ) ) ( not ( = ?auto_880087 ?auto_880090 ) ) ( not ( = ?auto_880087 ?auto_880091 ) ) ( not ( = ?auto_880087 ?auto_880092 ) ) ( not ( = ?auto_880087 ?auto_880093 ) ) ( not ( = ?auto_880087 ?auto_880094 ) ) ( not ( = ?auto_880087 ?auto_880095 ) ) ( not ( = ?auto_880087 ?auto_880096 ) ) ( not ( = ?auto_880087 ?auto_880097 ) ) ( not ( = ?auto_880087 ?auto_880098 ) ) ( not ( = ?auto_880087 ?auto_880099 ) ) ( not ( = ?auto_880087 ?auto_880100 ) ) ( not ( = ?auto_880087 ?auto_880101 ) ) ( not ( = ?auto_880087 ?auto_880102 ) ) ( not ( = ?auto_880088 ?auto_880089 ) ) ( not ( = ?auto_880088 ?auto_880090 ) ) ( not ( = ?auto_880088 ?auto_880091 ) ) ( not ( = ?auto_880088 ?auto_880092 ) ) ( not ( = ?auto_880088 ?auto_880093 ) ) ( not ( = ?auto_880088 ?auto_880094 ) ) ( not ( = ?auto_880088 ?auto_880095 ) ) ( not ( = ?auto_880088 ?auto_880096 ) ) ( not ( = ?auto_880088 ?auto_880097 ) ) ( not ( = ?auto_880088 ?auto_880098 ) ) ( not ( = ?auto_880088 ?auto_880099 ) ) ( not ( = ?auto_880088 ?auto_880100 ) ) ( not ( = ?auto_880088 ?auto_880101 ) ) ( not ( = ?auto_880088 ?auto_880102 ) ) ( not ( = ?auto_880089 ?auto_880090 ) ) ( not ( = ?auto_880089 ?auto_880091 ) ) ( not ( = ?auto_880089 ?auto_880092 ) ) ( not ( = ?auto_880089 ?auto_880093 ) ) ( not ( = ?auto_880089 ?auto_880094 ) ) ( not ( = ?auto_880089 ?auto_880095 ) ) ( not ( = ?auto_880089 ?auto_880096 ) ) ( not ( = ?auto_880089 ?auto_880097 ) ) ( not ( = ?auto_880089 ?auto_880098 ) ) ( not ( = ?auto_880089 ?auto_880099 ) ) ( not ( = ?auto_880089 ?auto_880100 ) ) ( not ( = ?auto_880089 ?auto_880101 ) ) ( not ( = ?auto_880089 ?auto_880102 ) ) ( not ( = ?auto_880090 ?auto_880091 ) ) ( not ( = ?auto_880090 ?auto_880092 ) ) ( not ( = ?auto_880090 ?auto_880093 ) ) ( not ( = ?auto_880090 ?auto_880094 ) ) ( not ( = ?auto_880090 ?auto_880095 ) ) ( not ( = ?auto_880090 ?auto_880096 ) ) ( not ( = ?auto_880090 ?auto_880097 ) ) ( not ( = ?auto_880090 ?auto_880098 ) ) ( not ( = ?auto_880090 ?auto_880099 ) ) ( not ( = ?auto_880090 ?auto_880100 ) ) ( not ( = ?auto_880090 ?auto_880101 ) ) ( not ( = ?auto_880090 ?auto_880102 ) ) ( not ( = ?auto_880091 ?auto_880092 ) ) ( not ( = ?auto_880091 ?auto_880093 ) ) ( not ( = ?auto_880091 ?auto_880094 ) ) ( not ( = ?auto_880091 ?auto_880095 ) ) ( not ( = ?auto_880091 ?auto_880096 ) ) ( not ( = ?auto_880091 ?auto_880097 ) ) ( not ( = ?auto_880091 ?auto_880098 ) ) ( not ( = ?auto_880091 ?auto_880099 ) ) ( not ( = ?auto_880091 ?auto_880100 ) ) ( not ( = ?auto_880091 ?auto_880101 ) ) ( not ( = ?auto_880091 ?auto_880102 ) ) ( not ( = ?auto_880092 ?auto_880093 ) ) ( not ( = ?auto_880092 ?auto_880094 ) ) ( not ( = ?auto_880092 ?auto_880095 ) ) ( not ( = ?auto_880092 ?auto_880096 ) ) ( not ( = ?auto_880092 ?auto_880097 ) ) ( not ( = ?auto_880092 ?auto_880098 ) ) ( not ( = ?auto_880092 ?auto_880099 ) ) ( not ( = ?auto_880092 ?auto_880100 ) ) ( not ( = ?auto_880092 ?auto_880101 ) ) ( not ( = ?auto_880092 ?auto_880102 ) ) ( not ( = ?auto_880093 ?auto_880094 ) ) ( not ( = ?auto_880093 ?auto_880095 ) ) ( not ( = ?auto_880093 ?auto_880096 ) ) ( not ( = ?auto_880093 ?auto_880097 ) ) ( not ( = ?auto_880093 ?auto_880098 ) ) ( not ( = ?auto_880093 ?auto_880099 ) ) ( not ( = ?auto_880093 ?auto_880100 ) ) ( not ( = ?auto_880093 ?auto_880101 ) ) ( not ( = ?auto_880093 ?auto_880102 ) ) ( not ( = ?auto_880094 ?auto_880095 ) ) ( not ( = ?auto_880094 ?auto_880096 ) ) ( not ( = ?auto_880094 ?auto_880097 ) ) ( not ( = ?auto_880094 ?auto_880098 ) ) ( not ( = ?auto_880094 ?auto_880099 ) ) ( not ( = ?auto_880094 ?auto_880100 ) ) ( not ( = ?auto_880094 ?auto_880101 ) ) ( not ( = ?auto_880094 ?auto_880102 ) ) ( not ( = ?auto_880095 ?auto_880096 ) ) ( not ( = ?auto_880095 ?auto_880097 ) ) ( not ( = ?auto_880095 ?auto_880098 ) ) ( not ( = ?auto_880095 ?auto_880099 ) ) ( not ( = ?auto_880095 ?auto_880100 ) ) ( not ( = ?auto_880095 ?auto_880101 ) ) ( not ( = ?auto_880095 ?auto_880102 ) ) ( not ( = ?auto_880096 ?auto_880097 ) ) ( not ( = ?auto_880096 ?auto_880098 ) ) ( not ( = ?auto_880096 ?auto_880099 ) ) ( not ( = ?auto_880096 ?auto_880100 ) ) ( not ( = ?auto_880096 ?auto_880101 ) ) ( not ( = ?auto_880096 ?auto_880102 ) ) ( not ( = ?auto_880097 ?auto_880098 ) ) ( not ( = ?auto_880097 ?auto_880099 ) ) ( not ( = ?auto_880097 ?auto_880100 ) ) ( not ( = ?auto_880097 ?auto_880101 ) ) ( not ( = ?auto_880097 ?auto_880102 ) ) ( not ( = ?auto_880098 ?auto_880099 ) ) ( not ( = ?auto_880098 ?auto_880100 ) ) ( not ( = ?auto_880098 ?auto_880101 ) ) ( not ( = ?auto_880098 ?auto_880102 ) ) ( not ( = ?auto_880099 ?auto_880100 ) ) ( not ( = ?auto_880099 ?auto_880101 ) ) ( not ( = ?auto_880099 ?auto_880102 ) ) ( not ( = ?auto_880100 ?auto_880101 ) ) ( not ( = ?auto_880100 ?auto_880102 ) ) ( not ( = ?auto_880101 ?auto_880102 ) ) ( ON ?auto_880101 ?auto_880102 ) ( ON ?auto_880100 ?auto_880101 ) ( ON ?auto_880099 ?auto_880100 ) ( ON ?auto_880098 ?auto_880099 ) ( ON ?auto_880097 ?auto_880098 ) ( ON ?auto_880096 ?auto_880097 ) ( ON ?auto_880095 ?auto_880096 ) ( ON ?auto_880094 ?auto_880095 ) ( ON ?auto_880093 ?auto_880094 ) ( ON ?auto_880092 ?auto_880093 ) ( ON ?auto_880091 ?auto_880092 ) ( ON ?auto_880090 ?auto_880091 ) ( CLEAR ?auto_880088 ) ( ON ?auto_880089 ?auto_880090 ) ( CLEAR ?auto_880089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_880085 ?auto_880086 ?auto_880087 ?auto_880088 ?auto_880089 )
      ( MAKE-18PILE ?auto_880085 ?auto_880086 ?auto_880087 ?auto_880088 ?auto_880089 ?auto_880090 ?auto_880091 ?auto_880092 ?auto_880093 ?auto_880094 ?auto_880095 ?auto_880096 ?auto_880097 ?auto_880098 ?auto_880099 ?auto_880100 ?auto_880101 ?auto_880102 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_880121 - BLOCK
      ?auto_880122 - BLOCK
      ?auto_880123 - BLOCK
      ?auto_880124 - BLOCK
      ?auto_880125 - BLOCK
      ?auto_880126 - BLOCK
      ?auto_880127 - BLOCK
      ?auto_880128 - BLOCK
      ?auto_880129 - BLOCK
      ?auto_880130 - BLOCK
      ?auto_880131 - BLOCK
      ?auto_880132 - BLOCK
      ?auto_880133 - BLOCK
      ?auto_880134 - BLOCK
      ?auto_880135 - BLOCK
      ?auto_880136 - BLOCK
      ?auto_880137 - BLOCK
      ?auto_880138 - BLOCK
    )
    :vars
    (
      ?auto_880139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_880138 ?auto_880139 ) ( ON-TABLE ?auto_880121 ) ( ON ?auto_880122 ?auto_880121 ) ( ON ?auto_880123 ?auto_880122 ) ( not ( = ?auto_880121 ?auto_880122 ) ) ( not ( = ?auto_880121 ?auto_880123 ) ) ( not ( = ?auto_880121 ?auto_880124 ) ) ( not ( = ?auto_880121 ?auto_880125 ) ) ( not ( = ?auto_880121 ?auto_880126 ) ) ( not ( = ?auto_880121 ?auto_880127 ) ) ( not ( = ?auto_880121 ?auto_880128 ) ) ( not ( = ?auto_880121 ?auto_880129 ) ) ( not ( = ?auto_880121 ?auto_880130 ) ) ( not ( = ?auto_880121 ?auto_880131 ) ) ( not ( = ?auto_880121 ?auto_880132 ) ) ( not ( = ?auto_880121 ?auto_880133 ) ) ( not ( = ?auto_880121 ?auto_880134 ) ) ( not ( = ?auto_880121 ?auto_880135 ) ) ( not ( = ?auto_880121 ?auto_880136 ) ) ( not ( = ?auto_880121 ?auto_880137 ) ) ( not ( = ?auto_880121 ?auto_880138 ) ) ( not ( = ?auto_880121 ?auto_880139 ) ) ( not ( = ?auto_880122 ?auto_880123 ) ) ( not ( = ?auto_880122 ?auto_880124 ) ) ( not ( = ?auto_880122 ?auto_880125 ) ) ( not ( = ?auto_880122 ?auto_880126 ) ) ( not ( = ?auto_880122 ?auto_880127 ) ) ( not ( = ?auto_880122 ?auto_880128 ) ) ( not ( = ?auto_880122 ?auto_880129 ) ) ( not ( = ?auto_880122 ?auto_880130 ) ) ( not ( = ?auto_880122 ?auto_880131 ) ) ( not ( = ?auto_880122 ?auto_880132 ) ) ( not ( = ?auto_880122 ?auto_880133 ) ) ( not ( = ?auto_880122 ?auto_880134 ) ) ( not ( = ?auto_880122 ?auto_880135 ) ) ( not ( = ?auto_880122 ?auto_880136 ) ) ( not ( = ?auto_880122 ?auto_880137 ) ) ( not ( = ?auto_880122 ?auto_880138 ) ) ( not ( = ?auto_880122 ?auto_880139 ) ) ( not ( = ?auto_880123 ?auto_880124 ) ) ( not ( = ?auto_880123 ?auto_880125 ) ) ( not ( = ?auto_880123 ?auto_880126 ) ) ( not ( = ?auto_880123 ?auto_880127 ) ) ( not ( = ?auto_880123 ?auto_880128 ) ) ( not ( = ?auto_880123 ?auto_880129 ) ) ( not ( = ?auto_880123 ?auto_880130 ) ) ( not ( = ?auto_880123 ?auto_880131 ) ) ( not ( = ?auto_880123 ?auto_880132 ) ) ( not ( = ?auto_880123 ?auto_880133 ) ) ( not ( = ?auto_880123 ?auto_880134 ) ) ( not ( = ?auto_880123 ?auto_880135 ) ) ( not ( = ?auto_880123 ?auto_880136 ) ) ( not ( = ?auto_880123 ?auto_880137 ) ) ( not ( = ?auto_880123 ?auto_880138 ) ) ( not ( = ?auto_880123 ?auto_880139 ) ) ( not ( = ?auto_880124 ?auto_880125 ) ) ( not ( = ?auto_880124 ?auto_880126 ) ) ( not ( = ?auto_880124 ?auto_880127 ) ) ( not ( = ?auto_880124 ?auto_880128 ) ) ( not ( = ?auto_880124 ?auto_880129 ) ) ( not ( = ?auto_880124 ?auto_880130 ) ) ( not ( = ?auto_880124 ?auto_880131 ) ) ( not ( = ?auto_880124 ?auto_880132 ) ) ( not ( = ?auto_880124 ?auto_880133 ) ) ( not ( = ?auto_880124 ?auto_880134 ) ) ( not ( = ?auto_880124 ?auto_880135 ) ) ( not ( = ?auto_880124 ?auto_880136 ) ) ( not ( = ?auto_880124 ?auto_880137 ) ) ( not ( = ?auto_880124 ?auto_880138 ) ) ( not ( = ?auto_880124 ?auto_880139 ) ) ( not ( = ?auto_880125 ?auto_880126 ) ) ( not ( = ?auto_880125 ?auto_880127 ) ) ( not ( = ?auto_880125 ?auto_880128 ) ) ( not ( = ?auto_880125 ?auto_880129 ) ) ( not ( = ?auto_880125 ?auto_880130 ) ) ( not ( = ?auto_880125 ?auto_880131 ) ) ( not ( = ?auto_880125 ?auto_880132 ) ) ( not ( = ?auto_880125 ?auto_880133 ) ) ( not ( = ?auto_880125 ?auto_880134 ) ) ( not ( = ?auto_880125 ?auto_880135 ) ) ( not ( = ?auto_880125 ?auto_880136 ) ) ( not ( = ?auto_880125 ?auto_880137 ) ) ( not ( = ?auto_880125 ?auto_880138 ) ) ( not ( = ?auto_880125 ?auto_880139 ) ) ( not ( = ?auto_880126 ?auto_880127 ) ) ( not ( = ?auto_880126 ?auto_880128 ) ) ( not ( = ?auto_880126 ?auto_880129 ) ) ( not ( = ?auto_880126 ?auto_880130 ) ) ( not ( = ?auto_880126 ?auto_880131 ) ) ( not ( = ?auto_880126 ?auto_880132 ) ) ( not ( = ?auto_880126 ?auto_880133 ) ) ( not ( = ?auto_880126 ?auto_880134 ) ) ( not ( = ?auto_880126 ?auto_880135 ) ) ( not ( = ?auto_880126 ?auto_880136 ) ) ( not ( = ?auto_880126 ?auto_880137 ) ) ( not ( = ?auto_880126 ?auto_880138 ) ) ( not ( = ?auto_880126 ?auto_880139 ) ) ( not ( = ?auto_880127 ?auto_880128 ) ) ( not ( = ?auto_880127 ?auto_880129 ) ) ( not ( = ?auto_880127 ?auto_880130 ) ) ( not ( = ?auto_880127 ?auto_880131 ) ) ( not ( = ?auto_880127 ?auto_880132 ) ) ( not ( = ?auto_880127 ?auto_880133 ) ) ( not ( = ?auto_880127 ?auto_880134 ) ) ( not ( = ?auto_880127 ?auto_880135 ) ) ( not ( = ?auto_880127 ?auto_880136 ) ) ( not ( = ?auto_880127 ?auto_880137 ) ) ( not ( = ?auto_880127 ?auto_880138 ) ) ( not ( = ?auto_880127 ?auto_880139 ) ) ( not ( = ?auto_880128 ?auto_880129 ) ) ( not ( = ?auto_880128 ?auto_880130 ) ) ( not ( = ?auto_880128 ?auto_880131 ) ) ( not ( = ?auto_880128 ?auto_880132 ) ) ( not ( = ?auto_880128 ?auto_880133 ) ) ( not ( = ?auto_880128 ?auto_880134 ) ) ( not ( = ?auto_880128 ?auto_880135 ) ) ( not ( = ?auto_880128 ?auto_880136 ) ) ( not ( = ?auto_880128 ?auto_880137 ) ) ( not ( = ?auto_880128 ?auto_880138 ) ) ( not ( = ?auto_880128 ?auto_880139 ) ) ( not ( = ?auto_880129 ?auto_880130 ) ) ( not ( = ?auto_880129 ?auto_880131 ) ) ( not ( = ?auto_880129 ?auto_880132 ) ) ( not ( = ?auto_880129 ?auto_880133 ) ) ( not ( = ?auto_880129 ?auto_880134 ) ) ( not ( = ?auto_880129 ?auto_880135 ) ) ( not ( = ?auto_880129 ?auto_880136 ) ) ( not ( = ?auto_880129 ?auto_880137 ) ) ( not ( = ?auto_880129 ?auto_880138 ) ) ( not ( = ?auto_880129 ?auto_880139 ) ) ( not ( = ?auto_880130 ?auto_880131 ) ) ( not ( = ?auto_880130 ?auto_880132 ) ) ( not ( = ?auto_880130 ?auto_880133 ) ) ( not ( = ?auto_880130 ?auto_880134 ) ) ( not ( = ?auto_880130 ?auto_880135 ) ) ( not ( = ?auto_880130 ?auto_880136 ) ) ( not ( = ?auto_880130 ?auto_880137 ) ) ( not ( = ?auto_880130 ?auto_880138 ) ) ( not ( = ?auto_880130 ?auto_880139 ) ) ( not ( = ?auto_880131 ?auto_880132 ) ) ( not ( = ?auto_880131 ?auto_880133 ) ) ( not ( = ?auto_880131 ?auto_880134 ) ) ( not ( = ?auto_880131 ?auto_880135 ) ) ( not ( = ?auto_880131 ?auto_880136 ) ) ( not ( = ?auto_880131 ?auto_880137 ) ) ( not ( = ?auto_880131 ?auto_880138 ) ) ( not ( = ?auto_880131 ?auto_880139 ) ) ( not ( = ?auto_880132 ?auto_880133 ) ) ( not ( = ?auto_880132 ?auto_880134 ) ) ( not ( = ?auto_880132 ?auto_880135 ) ) ( not ( = ?auto_880132 ?auto_880136 ) ) ( not ( = ?auto_880132 ?auto_880137 ) ) ( not ( = ?auto_880132 ?auto_880138 ) ) ( not ( = ?auto_880132 ?auto_880139 ) ) ( not ( = ?auto_880133 ?auto_880134 ) ) ( not ( = ?auto_880133 ?auto_880135 ) ) ( not ( = ?auto_880133 ?auto_880136 ) ) ( not ( = ?auto_880133 ?auto_880137 ) ) ( not ( = ?auto_880133 ?auto_880138 ) ) ( not ( = ?auto_880133 ?auto_880139 ) ) ( not ( = ?auto_880134 ?auto_880135 ) ) ( not ( = ?auto_880134 ?auto_880136 ) ) ( not ( = ?auto_880134 ?auto_880137 ) ) ( not ( = ?auto_880134 ?auto_880138 ) ) ( not ( = ?auto_880134 ?auto_880139 ) ) ( not ( = ?auto_880135 ?auto_880136 ) ) ( not ( = ?auto_880135 ?auto_880137 ) ) ( not ( = ?auto_880135 ?auto_880138 ) ) ( not ( = ?auto_880135 ?auto_880139 ) ) ( not ( = ?auto_880136 ?auto_880137 ) ) ( not ( = ?auto_880136 ?auto_880138 ) ) ( not ( = ?auto_880136 ?auto_880139 ) ) ( not ( = ?auto_880137 ?auto_880138 ) ) ( not ( = ?auto_880137 ?auto_880139 ) ) ( not ( = ?auto_880138 ?auto_880139 ) ) ( ON ?auto_880137 ?auto_880138 ) ( ON ?auto_880136 ?auto_880137 ) ( ON ?auto_880135 ?auto_880136 ) ( ON ?auto_880134 ?auto_880135 ) ( ON ?auto_880133 ?auto_880134 ) ( ON ?auto_880132 ?auto_880133 ) ( ON ?auto_880131 ?auto_880132 ) ( ON ?auto_880130 ?auto_880131 ) ( ON ?auto_880129 ?auto_880130 ) ( ON ?auto_880128 ?auto_880129 ) ( ON ?auto_880127 ?auto_880128 ) ( ON ?auto_880126 ?auto_880127 ) ( ON ?auto_880125 ?auto_880126 ) ( CLEAR ?auto_880123 ) ( ON ?auto_880124 ?auto_880125 ) ( CLEAR ?auto_880124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_880121 ?auto_880122 ?auto_880123 ?auto_880124 )
      ( MAKE-18PILE ?auto_880121 ?auto_880122 ?auto_880123 ?auto_880124 ?auto_880125 ?auto_880126 ?auto_880127 ?auto_880128 ?auto_880129 ?auto_880130 ?auto_880131 ?auto_880132 ?auto_880133 ?auto_880134 ?auto_880135 ?auto_880136 ?auto_880137 ?auto_880138 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_880158 - BLOCK
      ?auto_880159 - BLOCK
      ?auto_880160 - BLOCK
      ?auto_880161 - BLOCK
      ?auto_880162 - BLOCK
      ?auto_880163 - BLOCK
      ?auto_880164 - BLOCK
      ?auto_880165 - BLOCK
      ?auto_880166 - BLOCK
      ?auto_880167 - BLOCK
      ?auto_880168 - BLOCK
      ?auto_880169 - BLOCK
      ?auto_880170 - BLOCK
      ?auto_880171 - BLOCK
      ?auto_880172 - BLOCK
      ?auto_880173 - BLOCK
      ?auto_880174 - BLOCK
      ?auto_880175 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_880175 ) ( ON-TABLE ?auto_880158 ) ( ON ?auto_880159 ?auto_880158 ) ( ON ?auto_880160 ?auto_880159 ) ( not ( = ?auto_880158 ?auto_880159 ) ) ( not ( = ?auto_880158 ?auto_880160 ) ) ( not ( = ?auto_880158 ?auto_880161 ) ) ( not ( = ?auto_880158 ?auto_880162 ) ) ( not ( = ?auto_880158 ?auto_880163 ) ) ( not ( = ?auto_880158 ?auto_880164 ) ) ( not ( = ?auto_880158 ?auto_880165 ) ) ( not ( = ?auto_880158 ?auto_880166 ) ) ( not ( = ?auto_880158 ?auto_880167 ) ) ( not ( = ?auto_880158 ?auto_880168 ) ) ( not ( = ?auto_880158 ?auto_880169 ) ) ( not ( = ?auto_880158 ?auto_880170 ) ) ( not ( = ?auto_880158 ?auto_880171 ) ) ( not ( = ?auto_880158 ?auto_880172 ) ) ( not ( = ?auto_880158 ?auto_880173 ) ) ( not ( = ?auto_880158 ?auto_880174 ) ) ( not ( = ?auto_880158 ?auto_880175 ) ) ( not ( = ?auto_880159 ?auto_880160 ) ) ( not ( = ?auto_880159 ?auto_880161 ) ) ( not ( = ?auto_880159 ?auto_880162 ) ) ( not ( = ?auto_880159 ?auto_880163 ) ) ( not ( = ?auto_880159 ?auto_880164 ) ) ( not ( = ?auto_880159 ?auto_880165 ) ) ( not ( = ?auto_880159 ?auto_880166 ) ) ( not ( = ?auto_880159 ?auto_880167 ) ) ( not ( = ?auto_880159 ?auto_880168 ) ) ( not ( = ?auto_880159 ?auto_880169 ) ) ( not ( = ?auto_880159 ?auto_880170 ) ) ( not ( = ?auto_880159 ?auto_880171 ) ) ( not ( = ?auto_880159 ?auto_880172 ) ) ( not ( = ?auto_880159 ?auto_880173 ) ) ( not ( = ?auto_880159 ?auto_880174 ) ) ( not ( = ?auto_880159 ?auto_880175 ) ) ( not ( = ?auto_880160 ?auto_880161 ) ) ( not ( = ?auto_880160 ?auto_880162 ) ) ( not ( = ?auto_880160 ?auto_880163 ) ) ( not ( = ?auto_880160 ?auto_880164 ) ) ( not ( = ?auto_880160 ?auto_880165 ) ) ( not ( = ?auto_880160 ?auto_880166 ) ) ( not ( = ?auto_880160 ?auto_880167 ) ) ( not ( = ?auto_880160 ?auto_880168 ) ) ( not ( = ?auto_880160 ?auto_880169 ) ) ( not ( = ?auto_880160 ?auto_880170 ) ) ( not ( = ?auto_880160 ?auto_880171 ) ) ( not ( = ?auto_880160 ?auto_880172 ) ) ( not ( = ?auto_880160 ?auto_880173 ) ) ( not ( = ?auto_880160 ?auto_880174 ) ) ( not ( = ?auto_880160 ?auto_880175 ) ) ( not ( = ?auto_880161 ?auto_880162 ) ) ( not ( = ?auto_880161 ?auto_880163 ) ) ( not ( = ?auto_880161 ?auto_880164 ) ) ( not ( = ?auto_880161 ?auto_880165 ) ) ( not ( = ?auto_880161 ?auto_880166 ) ) ( not ( = ?auto_880161 ?auto_880167 ) ) ( not ( = ?auto_880161 ?auto_880168 ) ) ( not ( = ?auto_880161 ?auto_880169 ) ) ( not ( = ?auto_880161 ?auto_880170 ) ) ( not ( = ?auto_880161 ?auto_880171 ) ) ( not ( = ?auto_880161 ?auto_880172 ) ) ( not ( = ?auto_880161 ?auto_880173 ) ) ( not ( = ?auto_880161 ?auto_880174 ) ) ( not ( = ?auto_880161 ?auto_880175 ) ) ( not ( = ?auto_880162 ?auto_880163 ) ) ( not ( = ?auto_880162 ?auto_880164 ) ) ( not ( = ?auto_880162 ?auto_880165 ) ) ( not ( = ?auto_880162 ?auto_880166 ) ) ( not ( = ?auto_880162 ?auto_880167 ) ) ( not ( = ?auto_880162 ?auto_880168 ) ) ( not ( = ?auto_880162 ?auto_880169 ) ) ( not ( = ?auto_880162 ?auto_880170 ) ) ( not ( = ?auto_880162 ?auto_880171 ) ) ( not ( = ?auto_880162 ?auto_880172 ) ) ( not ( = ?auto_880162 ?auto_880173 ) ) ( not ( = ?auto_880162 ?auto_880174 ) ) ( not ( = ?auto_880162 ?auto_880175 ) ) ( not ( = ?auto_880163 ?auto_880164 ) ) ( not ( = ?auto_880163 ?auto_880165 ) ) ( not ( = ?auto_880163 ?auto_880166 ) ) ( not ( = ?auto_880163 ?auto_880167 ) ) ( not ( = ?auto_880163 ?auto_880168 ) ) ( not ( = ?auto_880163 ?auto_880169 ) ) ( not ( = ?auto_880163 ?auto_880170 ) ) ( not ( = ?auto_880163 ?auto_880171 ) ) ( not ( = ?auto_880163 ?auto_880172 ) ) ( not ( = ?auto_880163 ?auto_880173 ) ) ( not ( = ?auto_880163 ?auto_880174 ) ) ( not ( = ?auto_880163 ?auto_880175 ) ) ( not ( = ?auto_880164 ?auto_880165 ) ) ( not ( = ?auto_880164 ?auto_880166 ) ) ( not ( = ?auto_880164 ?auto_880167 ) ) ( not ( = ?auto_880164 ?auto_880168 ) ) ( not ( = ?auto_880164 ?auto_880169 ) ) ( not ( = ?auto_880164 ?auto_880170 ) ) ( not ( = ?auto_880164 ?auto_880171 ) ) ( not ( = ?auto_880164 ?auto_880172 ) ) ( not ( = ?auto_880164 ?auto_880173 ) ) ( not ( = ?auto_880164 ?auto_880174 ) ) ( not ( = ?auto_880164 ?auto_880175 ) ) ( not ( = ?auto_880165 ?auto_880166 ) ) ( not ( = ?auto_880165 ?auto_880167 ) ) ( not ( = ?auto_880165 ?auto_880168 ) ) ( not ( = ?auto_880165 ?auto_880169 ) ) ( not ( = ?auto_880165 ?auto_880170 ) ) ( not ( = ?auto_880165 ?auto_880171 ) ) ( not ( = ?auto_880165 ?auto_880172 ) ) ( not ( = ?auto_880165 ?auto_880173 ) ) ( not ( = ?auto_880165 ?auto_880174 ) ) ( not ( = ?auto_880165 ?auto_880175 ) ) ( not ( = ?auto_880166 ?auto_880167 ) ) ( not ( = ?auto_880166 ?auto_880168 ) ) ( not ( = ?auto_880166 ?auto_880169 ) ) ( not ( = ?auto_880166 ?auto_880170 ) ) ( not ( = ?auto_880166 ?auto_880171 ) ) ( not ( = ?auto_880166 ?auto_880172 ) ) ( not ( = ?auto_880166 ?auto_880173 ) ) ( not ( = ?auto_880166 ?auto_880174 ) ) ( not ( = ?auto_880166 ?auto_880175 ) ) ( not ( = ?auto_880167 ?auto_880168 ) ) ( not ( = ?auto_880167 ?auto_880169 ) ) ( not ( = ?auto_880167 ?auto_880170 ) ) ( not ( = ?auto_880167 ?auto_880171 ) ) ( not ( = ?auto_880167 ?auto_880172 ) ) ( not ( = ?auto_880167 ?auto_880173 ) ) ( not ( = ?auto_880167 ?auto_880174 ) ) ( not ( = ?auto_880167 ?auto_880175 ) ) ( not ( = ?auto_880168 ?auto_880169 ) ) ( not ( = ?auto_880168 ?auto_880170 ) ) ( not ( = ?auto_880168 ?auto_880171 ) ) ( not ( = ?auto_880168 ?auto_880172 ) ) ( not ( = ?auto_880168 ?auto_880173 ) ) ( not ( = ?auto_880168 ?auto_880174 ) ) ( not ( = ?auto_880168 ?auto_880175 ) ) ( not ( = ?auto_880169 ?auto_880170 ) ) ( not ( = ?auto_880169 ?auto_880171 ) ) ( not ( = ?auto_880169 ?auto_880172 ) ) ( not ( = ?auto_880169 ?auto_880173 ) ) ( not ( = ?auto_880169 ?auto_880174 ) ) ( not ( = ?auto_880169 ?auto_880175 ) ) ( not ( = ?auto_880170 ?auto_880171 ) ) ( not ( = ?auto_880170 ?auto_880172 ) ) ( not ( = ?auto_880170 ?auto_880173 ) ) ( not ( = ?auto_880170 ?auto_880174 ) ) ( not ( = ?auto_880170 ?auto_880175 ) ) ( not ( = ?auto_880171 ?auto_880172 ) ) ( not ( = ?auto_880171 ?auto_880173 ) ) ( not ( = ?auto_880171 ?auto_880174 ) ) ( not ( = ?auto_880171 ?auto_880175 ) ) ( not ( = ?auto_880172 ?auto_880173 ) ) ( not ( = ?auto_880172 ?auto_880174 ) ) ( not ( = ?auto_880172 ?auto_880175 ) ) ( not ( = ?auto_880173 ?auto_880174 ) ) ( not ( = ?auto_880173 ?auto_880175 ) ) ( not ( = ?auto_880174 ?auto_880175 ) ) ( ON ?auto_880174 ?auto_880175 ) ( ON ?auto_880173 ?auto_880174 ) ( ON ?auto_880172 ?auto_880173 ) ( ON ?auto_880171 ?auto_880172 ) ( ON ?auto_880170 ?auto_880171 ) ( ON ?auto_880169 ?auto_880170 ) ( ON ?auto_880168 ?auto_880169 ) ( ON ?auto_880167 ?auto_880168 ) ( ON ?auto_880166 ?auto_880167 ) ( ON ?auto_880165 ?auto_880166 ) ( ON ?auto_880164 ?auto_880165 ) ( ON ?auto_880163 ?auto_880164 ) ( ON ?auto_880162 ?auto_880163 ) ( CLEAR ?auto_880160 ) ( ON ?auto_880161 ?auto_880162 ) ( CLEAR ?auto_880161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_880158 ?auto_880159 ?auto_880160 ?auto_880161 )
      ( MAKE-18PILE ?auto_880158 ?auto_880159 ?auto_880160 ?auto_880161 ?auto_880162 ?auto_880163 ?auto_880164 ?auto_880165 ?auto_880166 ?auto_880167 ?auto_880168 ?auto_880169 ?auto_880170 ?auto_880171 ?auto_880172 ?auto_880173 ?auto_880174 ?auto_880175 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_880194 - BLOCK
      ?auto_880195 - BLOCK
      ?auto_880196 - BLOCK
      ?auto_880197 - BLOCK
      ?auto_880198 - BLOCK
      ?auto_880199 - BLOCK
      ?auto_880200 - BLOCK
      ?auto_880201 - BLOCK
      ?auto_880202 - BLOCK
      ?auto_880203 - BLOCK
      ?auto_880204 - BLOCK
      ?auto_880205 - BLOCK
      ?auto_880206 - BLOCK
      ?auto_880207 - BLOCK
      ?auto_880208 - BLOCK
      ?auto_880209 - BLOCK
      ?auto_880210 - BLOCK
      ?auto_880211 - BLOCK
    )
    :vars
    (
      ?auto_880212 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_880211 ?auto_880212 ) ( ON-TABLE ?auto_880194 ) ( ON ?auto_880195 ?auto_880194 ) ( not ( = ?auto_880194 ?auto_880195 ) ) ( not ( = ?auto_880194 ?auto_880196 ) ) ( not ( = ?auto_880194 ?auto_880197 ) ) ( not ( = ?auto_880194 ?auto_880198 ) ) ( not ( = ?auto_880194 ?auto_880199 ) ) ( not ( = ?auto_880194 ?auto_880200 ) ) ( not ( = ?auto_880194 ?auto_880201 ) ) ( not ( = ?auto_880194 ?auto_880202 ) ) ( not ( = ?auto_880194 ?auto_880203 ) ) ( not ( = ?auto_880194 ?auto_880204 ) ) ( not ( = ?auto_880194 ?auto_880205 ) ) ( not ( = ?auto_880194 ?auto_880206 ) ) ( not ( = ?auto_880194 ?auto_880207 ) ) ( not ( = ?auto_880194 ?auto_880208 ) ) ( not ( = ?auto_880194 ?auto_880209 ) ) ( not ( = ?auto_880194 ?auto_880210 ) ) ( not ( = ?auto_880194 ?auto_880211 ) ) ( not ( = ?auto_880194 ?auto_880212 ) ) ( not ( = ?auto_880195 ?auto_880196 ) ) ( not ( = ?auto_880195 ?auto_880197 ) ) ( not ( = ?auto_880195 ?auto_880198 ) ) ( not ( = ?auto_880195 ?auto_880199 ) ) ( not ( = ?auto_880195 ?auto_880200 ) ) ( not ( = ?auto_880195 ?auto_880201 ) ) ( not ( = ?auto_880195 ?auto_880202 ) ) ( not ( = ?auto_880195 ?auto_880203 ) ) ( not ( = ?auto_880195 ?auto_880204 ) ) ( not ( = ?auto_880195 ?auto_880205 ) ) ( not ( = ?auto_880195 ?auto_880206 ) ) ( not ( = ?auto_880195 ?auto_880207 ) ) ( not ( = ?auto_880195 ?auto_880208 ) ) ( not ( = ?auto_880195 ?auto_880209 ) ) ( not ( = ?auto_880195 ?auto_880210 ) ) ( not ( = ?auto_880195 ?auto_880211 ) ) ( not ( = ?auto_880195 ?auto_880212 ) ) ( not ( = ?auto_880196 ?auto_880197 ) ) ( not ( = ?auto_880196 ?auto_880198 ) ) ( not ( = ?auto_880196 ?auto_880199 ) ) ( not ( = ?auto_880196 ?auto_880200 ) ) ( not ( = ?auto_880196 ?auto_880201 ) ) ( not ( = ?auto_880196 ?auto_880202 ) ) ( not ( = ?auto_880196 ?auto_880203 ) ) ( not ( = ?auto_880196 ?auto_880204 ) ) ( not ( = ?auto_880196 ?auto_880205 ) ) ( not ( = ?auto_880196 ?auto_880206 ) ) ( not ( = ?auto_880196 ?auto_880207 ) ) ( not ( = ?auto_880196 ?auto_880208 ) ) ( not ( = ?auto_880196 ?auto_880209 ) ) ( not ( = ?auto_880196 ?auto_880210 ) ) ( not ( = ?auto_880196 ?auto_880211 ) ) ( not ( = ?auto_880196 ?auto_880212 ) ) ( not ( = ?auto_880197 ?auto_880198 ) ) ( not ( = ?auto_880197 ?auto_880199 ) ) ( not ( = ?auto_880197 ?auto_880200 ) ) ( not ( = ?auto_880197 ?auto_880201 ) ) ( not ( = ?auto_880197 ?auto_880202 ) ) ( not ( = ?auto_880197 ?auto_880203 ) ) ( not ( = ?auto_880197 ?auto_880204 ) ) ( not ( = ?auto_880197 ?auto_880205 ) ) ( not ( = ?auto_880197 ?auto_880206 ) ) ( not ( = ?auto_880197 ?auto_880207 ) ) ( not ( = ?auto_880197 ?auto_880208 ) ) ( not ( = ?auto_880197 ?auto_880209 ) ) ( not ( = ?auto_880197 ?auto_880210 ) ) ( not ( = ?auto_880197 ?auto_880211 ) ) ( not ( = ?auto_880197 ?auto_880212 ) ) ( not ( = ?auto_880198 ?auto_880199 ) ) ( not ( = ?auto_880198 ?auto_880200 ) ) ( not ( = ?auto_880198 ?auto_880201 ) ) ( not ( = ?auto_880198 ?auto_880202 ) ) ( not ( = ?auto_880198 ?auto_880203 ) ) ( not ( = ?auto_880198 ?auto_880204 ) ) ( not ( = ?auto_880198 ?auto_880205 ) ) ( not ( = ?auto_880198 ?auto_880206 ) ) ( not ( = ?auto_880198 ?auto_880207 ) ) ( not ( = ?auto_880198 ?auto_880208 ) ) ( not ( = ?auto_880198 ?auto_880209 ) ) ( not ( = ?auto_880198 ?auto_880210 ) ) ( not ( = ?auto_880198 ?auto_880211 ) ) ( not ( = ?auto_880198 ?auto_880212 ) ) ( not ( = ?auto_880199 ?auto_880200 ) ) ( not ( = ?auto_880199 ?auto_880201 ) ) ( not ( = ?auto_880199 ?auto_880202 ) ) ( not ( = ?auto_880199 ?auto_880203 ) ) ( not ( = ?auto_880199 ?auto_880204 ) ) ( not ( = ?auto_880199 ?auto_880205 ) ) ( not ( = ?auto_880199 ?auto_880206 ) ) ( not ( = ?auto_880199 ?auto_880207 ) ) ( not ( = ?auto_880199 ?auto_880208 ) ) ( not ( = ?auto_880199 ?auto_880209 ) ) ( not ( = ?auto_880199 ?auto_880210 ) ) ( not ( = ?auto_880199 ?auto_880211 ) ) ( not ( = ?auto_880199 ?auto_880212 ) ) ( not ( = ?auto_880200 ?auto_880201 ) ) ( not ( = ?auto_880200 ?auto_880202 ) ) ( not ( = ?auto_880200 ?auto_880203 ) ) ( not ( = ?auto_880200 ?auto_880204 ) ) ( not ( = ?auto_880200 ?auto_880205 ) ) ( not ( = ?auto_880200 ?auto_880206 ) ) ( not ( = ?auto_880200 ?auto_880207 ) ) ( not ( = ?auto_880200 ?auto_880208 ) ) ( not ( = ?auto_880200 ?auto_880209 ) ) ( not ( = ?auto_880200 ?auto_880210 ) ) ( not ( = ?auto_880200 ?auto_880211 ) ) ( not ( = ?auto_880200 ?auto_880212 ) ) ( not ( = ?auto_880201 ?auto_880202 ) ) ( not ( = ?auto_880201 ?auto_880203 ) ) ( not ( = ?auto_880201 ?auto_880204 ) ) ( not ( = ?auto_880201 ?auto_880205 ) ) ( not ( = ?auto_880201 ?auto_880206 ) ) ( not ( = ?auto_880201 ?auto_880207 ) ) ( not ( = ?auto_880201 ?auto_880208 ) ) ( not ( = ?auto_880201 ?auto_880209 ) ) ( not ( = ?auto_880201 ?auto_880210 ) ) ( not ( = ?auto_880201 ?auto_880211 ) ) ( not ( = ?auto_880201 ?auto_880212 ) ) ( not ( = ?auto_880202 ?auto_880203 ) ) ( not ( = ?auto_880202 ?auto_880204 ) ) ( not ( = ?auto_880202 ?auto_880205 ) ) ( not ( = ?auto_880202 ?auto_880206 ) ) ( not ( = ?auto_880202 ?auto_880207 ) ) ( not ( = ?auto_880202 ?auto_880208 ) ) ( not ( = ?auto_880202 ?auto_880209 ) ) ( not ( = ?auto_880202 ?auto_880210 ) ) ( not ( = ?auto_880202 ?auto_880211 ) ) ( not ( = ?auto_880202 ?auto_880212 ) ) ( not ( = ?auto_880203 ?auto_880204 ) ) ( not ( = ?auto_880203 ?auto_880205 ) ) ( not ( = ?auto_880203 ?auto_880206 ) ) ( not ( = ?auto_880203 ?auto_880207 ) ) ( not ( = ?auto_880203 ?auto_880208 ) ) ( not ( = ?auto_880203 ?auto_880209 ) ) ( not ( = ?auto_880203 ?auto_880210 ) ) ( not ( = ?auto_880203 ?auto_880211 ) ) ( not ( = ?auto_880203 ?auto_880212 ) ) ( not ( = ?auto_880204 ?auto_880205 ) ) ( not ( = ?auto_880204 ?auto_880206 ) ) ( not ( = ?auto_880204 ?auto_880207 ) ) ( not ( = ?auto_880204 ?auto_880208 ) ) ( not ( = ?auto_880204 ?auto_880209 ) ) ( not ( = ?auto_880204 ?auto_880210 ) ) ( not ( = ?auto_880204 ?auto_880211 ) ) ( not ( = ?auto_880204 ?auto_880212 ) ) ( not ( = ?auto_880205 ?auto_880206 ) ) ( not ( = ?auto_880205 ?auto_880207 ) ) ( not ( = ?auto_880205 ?auto_880208 ) ) ( not ( = ?auto_880205 ?auto_880209 ) ) ( not ( = ?auto_880205 ?auto_880210 ) ) ( not ( = ?auto_880205 ?auto_880211 ) ) ( not ( = ?auto_880205 ?auto_880212 ) ) ( not ( = ?auto_880206 ?auto_880207 ) ) ( not ( = ?auto_880206 ?auto_880208 ) ) ( not ( = ?auto_880206 ?auto_880209 ) ) ( not ( = ?auto_880206 ?auto_880210 ) ) ( not ( = ?auto_880206 ?auto_880211 ) ) ( not ( = ?auto_880206 ?auto_880212 ) ) ( not ( = ?auto_880207 ?auto_880208 ) ) ( not ( = ?auto_880207 ?auto_880209 ) ) ( not ( = ?auto_880207 ?auto_880210 ) ) ( not ( = ?auto_880207 ?auto_880211 ) ) ( not ( = ?auto_880207 ?auto_880212 ) ) ( not ( = ?auto_880208 ?auto_880209 ) ) ( not ( = ?auto_880208 ?auto_880210 ) ) ( not ( = ?auto_880208 ?auto_880211 ) ) ( not ( = ?auto_880208 ?auto_880212 ) ) ( not ( = ?auto_880209 ?auto_880210 ) ) ( not ( = ?auto_880209 ?auto_880211 ) ) ( not ( = ?auto_880209 ?auto_880212 ) ) ( not ( = ?auto_880210 ?auto_880211 ) ) ( not ( = ?auto_880210 ?auto_880212 ) ) ( not ( = ?auto_880211 ?auto_880212 ) ) ( ON ?auto_880210 ?auto_880211 ) ( ON ?auto_880209 ?auto_880210 ) ( ON ?auto_880208 ?auto_880209 ) ( ON ?auto_880207 ?auto_880208 ) ( ON ?auto_880206 ?auto_880207 ) ( ON ?auto_880205 ?auto_880206 ) ( ON ?auto_880204 ?auto_880205 ) ( ON ?auto_880203 ?auto_880204 ) ( ON ?auto_880202 ?auto_880203 ) ( ON ?auto_880201 ?auto_880202 ) ( ON ?auto_880200 ?auto_880201 ) ( ON ?auto_880199 ?auto_880200 ) ( ON ?auto_880198 ?auto_880199 ) ( ON ?auto_880197 ?auto_880198 ) ( CLEAR ?auto_880195 ) ( ON ?auto_880196 ?auto_880197 ) ( CLEAR ?auto_880196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_880194 ?auto_880195 ?auto_880196 )
      ( MAKE-18PILE ?auto_880194 ?auto_880195 ?auto_880196 ?auto_880197 ?auto_880198 ?auto_880199 ?auto_880200 ?auto_880201 ?auto_880202 ?auto_880203 ?auto_880204 ?auto_880205 ?auto_880206 ?auto_880207 ?auto_880208 ?auto_880209 ?auto_880210 ?auto_880211 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_880231 - BLOCK
      ?auto_880232 - BLOCK
      ?auto_880233 - BLOCK
      ?auto_880234 - BLOCK
      ?auto_880235 - BLOCK
      ?auto_880236 - BLOCK
      ?auto_880237 - BLOCK
      ?auto_880238 - BLOCK
      ?auto_880239 - BLOCK
      ?auto_880240 - BLOCK
      ?auto_880241 - BLOCK
      ?auto_880242 - BLOCK
      ?auto_880243 - BLOCK
      ?auto_880244 - BLOCK
      ?auto_880245 - BLOCK
      ?auto_880246 - BLOCK
      ?auto_880247 - BLOCK
      ?auto_880248 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_880248 ) ( ON-TABLE ?auto_880231 ) ( ON ?auto_880232 ?auto_880231 ) ( not ( = ?auto_880231 ?auto_880232 ) ) ( not ( = ?auto_880231 ?auto_880233 ) ) ( not ( = ?auto_880231 ?auto_880234 ) ) ( not ( = ?auto_880231 ?auto_880235 ) ) ( not ( = ?auto_880231 ?auto_880236 ) ) ( not ( = ?auto_880231 ?auto_880237 ) ) ( not ( = ?auto_880231 ?auto_880238 ) ) ( not ( = ?auto_880231 ?auto_880239 ) ) ( not ( = ?auto_880231 ?auto_880240 ) ) ( not ( = ?auto_880231 ?auto_880241 ) ) ( not ( = ?auto_880231 ?auto_880242 ) ) ( not ( = ?auto_880231 ?auto_880243 ) ) ( not ( = ?auto_880231 ?auto_880244 ) ) ( not ( = ?auto_880231 ?auto_880245 ) ) ( not ( = ?auto_880231 ?auto_880246 ) ) ( not ( = ?auto_880231 ?auto_880247 ) ) ( not ( = ?auto_880231 ?auto_880248 ) ) ( not ( = ?auto_880232 ?auto_880233 ) ) ( not ( = ?auto_880232 ?auto_880234 ) ) ( not ( = ?auto_880232 ?auto_880235 ) ) ( not ( = ?auto_880232 ?auto_880236 ) ) ( not ( = ?auto_880232 ?auto_880237 ) ) ( not ( = ?auto_880232 ?auto_880238 ) ) ( not ( = ?auto_880232 ?auto_880239 ) ) ( not ( = ?auto_880232 ?auto_880240 ) ) ( not ( = ?auto_880232 ?auto_880241 ) ) ( not ( = ?auto_880232 ?auto_880242 ) ) ( not ( = ?auto_880232 ?auto_880243 ) ) ( not ( = ?auto_880232 ?auto_880244 ) ) ( not ( = ?auto_880232 ?auto_880245 ) ) ( not ( = ?auto_880232 ?auto_880246 ) ) ( not ( = ?auto_880232 ?auto_880247 ) ) ( not ( = ?auto_880232 ?auto_880248 ) ) ( not ( = ?auto_880233 ?auto_880234 ) ) ( not ( = ?auto_880233 ?auto_880235 ) ) ( not ( = ?auto_880233 ?auto_880236 ) ) ( not ( = ?auto_880233 ?auto_880237 ) ) ( not ( = ?auto_880233 ?auto_880238 ) ) ( not ( = ?auto_880233 ?auto_880239 ) ) ( not ( = ?auto_880233 ?auto_880240 ) ) ( not ( = ?auto_880233 ?auto_880241 ) ) ( not ( = ?auto_880233 ?auto_880242 ) ) ( not ( = ?auto_880233 ?auto_880243 ) ) ( not ( = ?auto_880233 ?auto_880244 ) ) ( not ( = ?auto_880233 ?auto_880245 ) ) ( not ( = ?auto_880233 ?auto_880246 ) ) ( not ( = ?auto_880233 ?auto_880247 ) ) ( not ( = ?auto_880233 ?auto_880248 ) ) ( not ( = ?auto_880234 ?auto_880235 ) ) ( not ( = ?auto_880234 ?auto_880236 ) ) ( not ( = ?auto_880234 ?auto_880237 ) ) ( not ( = ?auto_880234 ?auto_880238 ) ) ( not ( = ?auto_880234 ?auto_880239 ) ) ( not ( = ?auto_880234 ?auto_880240 ) ) ( not ( = ?auto_880234 ?auto_880241 ) ) ( not ( = ?auto_880234 ?auto_880242 ) ) ( not ( = ?auto_880234 ?auto_880243 ) ) ( not ( = ?auto_880234 ?auto_880244 ) ) ( not ( = ?auto_880234 ?auto_880245 ) ) ( not ( = ?auto_880234 ?auto_880246 ) ) ( not ( = ?auto_880234 ?auto_880247 ) ) ( not ( = ?auto_880234 ?auto_880248 ) ) ( not ( = ?auto_880235 ?auto_880236 ) ) ( not ( = ?auto_880235 ?auto_880237 ) ) ( not ( = ?auto_880235 ?auto_880238 ) ) ( not ( = ?auto_880235 ?auto_880239 ) ) ( not ( = ?auto_880235 ?auto_880240 ) ) ( not ( = ?auto_880235 ?auto_880241 ) ) ( not ( = ?auto_880235 ?auto_880242 ) ) ( not ( = ?auto_880235 ?auto_880243 ) ) ( not ( = ?auto_880235 ?auto_880244 ) ) ( not ( = ?auto_880235 ?auto_880245 ) ) ( not ( = ?auto_880235 ?auto_880246 ) ) ( not ( = ?auto_880235 ?auto_880247 ) ) ( not ( = ?auto_880235 ?auto_880248 ) ) ( not ( = ?auto_880236 ?auto_880237 ) ) ( not ( = ?auto_880236 ?auto_880238 ) ) ( not ( = ?auto_880236 ?auto_880239 ) ) ( not ( = ?auto_880236 ?auto_880240 ) ) ( not ( = ?auto_880236 ?auto_880241 ) ) ( not ( = ?auto_880236 ?auto_880242 ) ) ( not ( = ?auto_880236 ?auto_880243 ) ) ( not ( = ?auto_880236 ?auto_880244 ) ) ( not ( = ?auto_880236 ?auto_880245 ) ) ( not ( = ?auto_880236 ?auto_880246 ) ) ( not ( = ?auto_880236 ?auto_880247 ) ) ( not ( = ?auto_880236 ?auto_880248 ) ) ( not ( = ?auto_880237 ?auto_880238 ) ) ( not ( = ?auto_880237 ?auto_880239 ) ) ( not ( = ?auto_880237 ?auto_880240 ) ) ( not ( = ?auto_880237 ?auto_880241 ) ) ( not ( = ?auto_880237 ?auto_880242 ) ) ( not ( = ?auto_880237 ?auto_880243 ) ) ( not ( = ?auto_880237 ?auto_880244 ) ) ( not ( = ?auto_880237 ?auto_880245 ) ) ( not ( = ?auto_880237 ?auto_880246 ) ) ( not ( = ?auto_880237 ?auto_880247 ) ) ( not ( = ?auto_880237 ?auto_880248 ) ) ( not ( = ?auto_880238 ?auto_880239 ) ) ( not ( = ?auto_880238 ?auto_880240 ) ) ( not ( = ?auto_880238 ?auto_880241 ) ) ( not ( = ?auto_880238 ?auto_880242 ) ) ( not ( = ?auto_880238 ?auto_880243 ) ) ( not ( = ?auto_880238 ?auto_880244 ) ) ( not ( = ?auto_880238 ?auto_880245 ) ) ( not ( = ?auto_880238 ?auto_880246 ) ) ( not ( = ?auto_880238 ?auto_880247 ) ) ( not ( = ?auto_880238 ?auto_880248 ) ) ( not ( = ?auto_880239 ?auto_880240 ) ) ( not ( = ?auto_880239 ?auto_880241 ) ) ( not ( = ?auto_880239 ?auto_880242 ) ) ( not ( = ?auto_880239 ?auto_880243 ) ) ( not ( = ?auto_880239 ?auto_880244 ) ) ( not ( = ?auto_880239 ?auto_880245 ) ) ( not ( = ?auto_880239 ?auto_880246 ) ) ( not ( = ?auto_880239 ?auto_880247 ) ) ( not ( = ?auto_880239 ?auto_880248 ) ) ( not ( = ?auto_880240 ?auto_880241 ) ) ( not ( = ?auto_880240 ?auto_880242 ) ) ( not ( = ?auto_880240 ?auto_880243 ) ) ( not ( = ?auto_880240 ?auto_880244 ) ) ( not ( = ?auto_880240 ?auto_880245 ) ) ( not ( = ?auto_880240 ?auto_880246 ) ) ( not ( = ?auto_880240 ?auto_880247 ) ) ( not ( = ?auto_880240 ?auto_880248 ) ) ( not ( = ?auto_880241 ?auto_880242 ) ) ( not ( = ?auto_880241 ?auto_880243 ) ) ( not ( = ?auto_880241 ?auto_880244 ) ) ( not ( = ?auto_880241 ?auto_880245 ) ) ( not ( = ?auto_880241 ?auto_880246 ) ) ( not ( = ?auto_880241 ?auto_880247 ) ) ( not ( = ?auto_880241 ?auto_880248 ) ) ( not ( = ?auto_880242 ?auto_880243 ) ) ( not ( = ?auto_880242 ?auto_880244 ) ) ( not ( = ?auto_880242 ?auto_880245 ) ) ( not ( = ?auto_880242 ?auto_880246 ) ) ( not ( = ?auto_880242 ?auto_880247 ) ) ( not ( = ?auto_880242 ?auto_880248 ) ) ( not ( = ?auto_880243 ?auto_880244 ) ) ( not ( = ?auto_880243 ?auto_880245 ) ) ( not ( = ?auto_880243 ?auto_880246 ) ) ( not ( = ?auto_880243 ?auto_880247 ) ) ( not ( = ?auto_880243 ?auto_880248 ) ) ( not ( = ?auto_880244 ?auto_880245 ) ) ( not ( = ?auto_880244 ?auto_880246 ) ) ( not ( = ?auto_880244 ?auto_880247 ) ) ( not ( = ?auto_880244 ?auto_880248 ) ) ( not ( = ?auto_880245 ?auto_880246 ) ) ( not ( = ?auto_880245 ?auto_880247 ) ) ( not ( = ?auto_880245 ?auto_880248 ) ) ( not ( = ?auto_880246 ?auto_880247 ) ) ( not ( = ?auto_880246 ?auto_880248 ) ) ( not ( = ?auto_880247 ?auto_880248 ) ) ( ON ?auto_880247 ?auto_880248 ) ( ON ?auto_880246 ?auto_880247 ) ( ON ?auto_880245 ?auto_880246 ) ( ON ?auto_880244 ?auto_880245 ) ( ON ?auto_880243 ?auto_880244 ) ( ON ?auto_880242 ?auto_880243 ) ( ON ?auto_880241 ?auto_880242 ) ( ON ?auto_880240 ?auto_880241 ) ( ON ?auto_880239 ?auto_880240 ) ( ON ?auto_880238 ?auto_880239 ) ( ON ?auto_880237 ?auto_880238 ) ( ON ?auto_880236 ?auto_880237 ) ( ON ?auto_880235 ?auto_880236 ) ( ON ?auto_880234 ?auto_880235 ) ( CLEAR ?auto_880232 ) ( ON ?auto_880233 ?auto_880234 ) ( CLEAR ?auto_880233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_880231 ?auto_880232 ?auto_880233 )
      ( MAKE-18PILE ?auto_880231 ?auto_880232 ?auto_880233 ?auto_880234 ?auto_880235 ?auto_880236 ?auto_880237 ?auto_880238 ?auto_880239 ?auto_880240 ?auto_880241 ?auto_880242 ?auto_880243 ?auto_880244 ?auto_880245 ?auto_880246 ?auto_880247 ?auto_880248 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_880267 - BLOCK
      ?auto_880268 - BLOCK
      ?auto_880269 - BLOCK
      ?auto_880270 - BLOCK
      ?auto_880271 - BLOCK
      ?auto_880272 - BLOCK
      ?auto_880273 - BLOCK
      ?auto_880274 - BLOCK
      ?auto_880275 - BLOCK
      ?auto_880276 - BLOCK
      ?auto_880277 - BLOCK
      ?auto_880278 - BLOCK
      ?auto_880279 - BLOCK
      ?auto_880280 - BLOCK
      ?auto_880281 - BLOCK
      ?auto_880282 - BLOCK
      ?auto_880283 - BLOCK
      ?auto_880284 - BLOCK
    )
    :vars
    (
      ?auto_880285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_880284 ?auto_880285 ) ( ON-TABLE ?auto_880267 ) ( not ( = ?auto_880267 ?auto_880268 ) ) ( not ( = ?auto_880267 ?auto_880269 ) ) ( not ( = ?auto_880267 ?auto_880270 ) ) ( not ( = ?auto_880267 ?auto_880271 ) ) ( not ( = ?auto_880267 ?auto_880272 ) ) ( not ( = ?auto_880267 ?auto_880273 ) ) ( not ( = ?auto_880267 ?auto_880274 ) ) ( not ( = ?auto_880267 ?auto_880275 ) ) ( not ( = ?auto_880267 ?auto_880276 ) ) ( not ( = ?auto_880267 ?auto_880277 ) ) ( not ( = ?auto_880267 ?auto_880278 ) ) ( not ( = ?auto_880267 ?auto_880279 ) ) ( not ( = ?auto_880267 ?auto_880280 ) ) ( not ( = ?auto_880267 ?auto_880281 ) ) ( not ( = ?auto_880267 ?auto_880282 ) ) ( not ( = ?auto_880267 ?auto_880283 ) ) ( not ( = ?auto_880267 ?auto_880284 ) ) ( not ( = ?auto_880267 ?auto_880285 ) ) ( not ( = ?auto_880268 ?auto_880269 ) ) ( not ( = ?auto_880268 ?auto_880270 ) ) ( not ( = ?auto_880268 ?auto_880271 ) ) ( not ( = ?auto_880268 ?auto_880272 ) ) ( not ( = ?auto_880268 ?auto_880273 ) ) ( not ( = ?auto_880268 ?auto_880274 ) ) ( not ( = ?auto_880268 ?auto_880275 ) ) ( not ( = ?auto_880268 ?auto_880276 ) ) ( not ( = ?auto_880268 ?auto_880277 ) ) ( not ( = ?auto_880268 ?auto_880278 ) ) ( not ( = ?auto_880268 ?auto_880279 ) ) ( not ( = ?auto_880268 ?auto_880280 ) ) ( not ( = ?auto_880268 ?auto_880281 ) ) ( not ( = ?auto_880268 ?auto_880282 ) ) ( not ( = ?auto_880268 ?auto_880283 ) ) ( not ( = ?auto_880268 ?auto_880284 ) ) ( not ( = ?auto_880268 ?auto_880285 ) ) ( not ( = ?auto_880269 ?auto_880270 ) ) ( not ( = ?auto_880269 ?auto_880271 ) ) ( not ( = ?auto_880269 ?auto_880272 ) ) ( not ( = ?auto_880269 ?auto_880273 ) ) ( not ( = ?auto_880269 ?auto_880274 ) ) ( not ( = ?auto_880269 ?auto_880275 ) ) ( not ( = ?auto_880269 ?auto_880276 ) ) ( not ( = ?auto_880269 ?auto_880277 ) ) ( not ( = ?auto_880269 ?auto_880278 ) ) ( not ( = ?auto_880269 ?auto_880279 ) ) ( not ( = ?auto_880269 ?auto_880280 ) ) ( not ( = ?auto_880269 ?auto_880281 ) ) ( not ( = ?auto_880269 ?auto_880282 ) ) ( not ( = ?auto_880269 ?auto_880283 ) ) ( not ( = ?auto_880269 ?auto_880284 ) ) ( not ( = ?auto_880269 ?auto_880285 ) ) ( not ( = ?auto_880270 ?auto_880271 ) ) ( not ( = ?auto_880270 ?auto_880272 ) ) ( not ( = ?auto_880270 ?auto_880273 ) ) ( not ( = ?auto_880270 ?auto_880274 ) ) ( not ( = ?auto_880270 ?auto_880275 ) ) ( not ( = ?auto_880270 ?auto_880276 ) ) ( not ( = ?auto_880270 ?auto_880277 ) ) ( not ( = ?auto_880270 ?auto_880278 ) ) ( not ( = ?auto_880270 ?auto_880279 ) ) ( not ( = ?auto_880270 ?auto_880280 ) ) ( not ( = ?auto_880270 ?auto_880281 ) ) ( not ( = ?auto_880270 ?auto_880282 ) ) ( not ( = ?auto_880270 ?auto_880283 ) ) ( not ( = ?auto_880270 ?auto_880284 ) ) ( not ( = ?auto_880270 ?auto_880285 ) ) ( not ( = ?auto_880271 ?auto_880272 ) ) ( not ( = ?auto_880271 ?auto_880273 ) ) ( not ( = ?auto_880271 ?auto_880274 ) ) ( not ( = ?auto_880271 ?auto_880275 ) ) ( not ( = ?auto_880271 ?auto_880276 ) ) ( not ( = ?auto_880271 ?auto_880277 ) ) ( not ( = ?auto_880271 ?auto_880278 ) ) ( not ( = ?auto_880271 ?auto_880279 ) ) ( not ( = ?auto_880271 ?auto_880280 ) ) ( not ( = ?auto_880271 ?auto_880281 ) ) ( not ( = ?auto_880271 ?auto_880282 ) ) ( not ( = ?auto_880271 ?auto_880283 ) ) ( not ( = ?auto_880271 ?auto_880284 ) ) ( not ( = ?auto_880271 ?auto_880285 ) ) ( not ( = ?auto_880272 ?auto_880273 ) ) ( not ( = ?auto_880272 ?auto_880274 ) ) ( not ( = ?auto_880272 ?auto_880275 ) ) ( not ( = ?auto_880272 ?auto_880276 ) ) ( not ( = ?auto_880272 ?auto_880277 ) ) ( not ( = ?auto_880272 ?auto_880278 ) ) ( not ( = ?auto_880272 ?auto_880279 ) ) ( not ( = ?auto_880272 ?auto_880280 ) ) ( not ( = ?auto_880272 ?auto_880281 ) ) ( not ( = ?auto_880272 ?auto_880282 ) ) ( not ( = ?auto_880272 ?auto_880283 ) ) ( not ( = ?auto_880272 ?auto_880284 ) ) ( not ( = ?auto_880272 ?auto_880285 ) ) ( not ( = ?auto_880273 ?auto_880274 ) ) ( not ( = ?auto_880273 ?auto_880275 ) ) ( not ( = ?auto_880273 ?auto_880276 ) ) ( not ( = ?auto_880273 ?auto_880277 ) ) ( not ( = ?auto_880273 ?auto_880278 ) ) ( not ( = ?auto_880273 ?auto_880279 ) ) ( not ( = ?auto_880273 ?auto_880280 ) ) ( not ( = ?auto_880273 ?auto_880281 ) ) ( not ( = ?auto_880273 ?auto_880282 ) ) ( not ( = ?auto_880273 ?auto_880283 ) ) ( not ( = ?auto_880273 ?auto_880284 ) ) ( not ( = ?auto_880273 ?auto_880285 ) ) ( not ( = ?auto_880274 ?auto_880275 ) ) ( not ( = ?auto_880274 ?auto_880276 ) ) ( not ( = ?auto_880274 ?auto_880277 ) ) ( not ( = ?auto_880274 ?auto_880278 ) ) ( not ( = ?auto_880274 ?auto_880279 ) ) ( not ( = ?auto_880274 ?auto_880280 ) ) ( not ( = ?auto_880274 ?auto_880281 ) ) ( not ( = ?auto_880274 ?auto_880282 ) ) ( not ( = ?auto_880274 ?auto_880283 ) ) ( not ( = ?auto_880274 ?auto_880284 ) ) ( not ( = ?auto_880274 ?auto_880285 ) ) ( not ( = ?auto_880275 ?auto_880276 ) ) ( not ( = ?auto_880275 ?auto_880277 ) ) ( not ( = ?auto_880275 ?auto_880278 ) ) ( not ( = ?auto_880275 ?auto_880279 ) ) ( not ( = ?auto_880275 ?auto_880280 ) ) ( not ( = ?auto_880275 ?auto_880281 ) ) ( not ( = ?auto_880275 ?auto_880282 ) ) ( not ( = ?auto_880275 ?auto_880283 ) ) ( not ( = ?auto_880275 ?auto_880284 ) ) ( not ( = ?auto_880275 ?auto_880285 ) ) ( not ( = ?auto_880276 ?auto_880277 ) ) ( not ( = ?auto_880276 ?auto_880278 ) ) ( not ( = ?auto_880276 ?auto_880279 ) ) ( not ( = ?auto_880276 ?auto_880280 ) ) ( not ( = ?auto_880276 ?auto_880281 ) ) ( not ( = ?auto_880276 ?auto_880282 ) ) ( not ( = ?auto_880276 ?auto_880283 ) ) ( not ( = ?auto_880276 ?auto_880284 ) ) ( not ( = ?auto_880276 ?auto_880285 ) ) ( not ( = ?auto_880277 ?auto_880278 ) ) ( not ( = ?auto_880277 ?auto_880279 ) ) ( not ( = ?auto_880277 ?auto_880280 ) ) ( not ( = ?auto_880277 ?auto_880281 ) ) ( not ( = ?auto_880277 ?auto_880282 ) ) ( not ( = ?auto_880277 ?auto_880283 ) ) ( not ( = ?auto_880277 ?auto_880284 ) ) ( not ( = ?auto_880277 ?auto_880285 ) ) ( not ( = ?auto_880278 ?auto_880279 ) ) ( not ( = ?auto_880278 ?auto_880280 ) ) ( not ( = ?auto_880278 ?auto_880281 ) ) ( not ( = ?auto_880278 ?auto_880282 ) ) ( not ( = ?auto_880278 ?auto_880283 ) ) ( not ( = ?auto_880278 ?auto_880284 ) ) ( not ( = ?auto_880278 ?auto_880285 ) ) ( not ( = ?auto_880279 ?auto_880280 ) ) ( not ( = ?auto_880279 ?auto_880281 ) ) ( not ( = ?auto_880279 ?auto_880282 ) ) ( not ( = ?auto_880279 ?auto_880283 ) ) ( not ( = ?auto_880279 ?auto_880284 ) ) ( not ( = ?auto_880279 ?auto_880285 ) ) ( not ( = ?auto_880280 ?auto_880281 ) ) ( not ( = ?auto_880280 ?auto_880282 ) ) ( not ( = ?auto_880280 ?auto_880283 ) ) ( not ( = ?auto_880280 ?auto_880284 ) ) ( not ( = ?auto_880280 ?auto_880285 ) ) ( not ( = ?auto_880281 ?auto_880282 ) ) ( not ( = ?auto_880281 ?auto_880283 ) ) ( not ( = ?auto_880281 ?auto_880284 ) ) ( not ( = ?auto_880281 ?auto_880285 ) ) ( not ( = ?auto_880282 ?auto_880283 ) ) ( not ( = ?auto_880282 ?auto_880284 ) ) ( not ( = ?auto_880282 ?auto_880285 ) ) ( not ( = ?auto_880283 ?auto_880284 ) ) ( not ( = ?auto_880283 ?auto_880285 ) ) ( not ( = ?auto_880284 ?auto_880285 ) ) ( ON ?auto_880283 ?auto_880284 ) ( ON ?auto_880282 ?auto_880283 ) ( ON ?auto_880281 ?auto_880282 ) ( ON ?auto_880280 ?auto_880281 ) ( ON ?auto_880279 ?auto_880280 ) ( ON ?auto_880278 ?auto_880279 ) ( ON ?auto_880277 ?auto_880278 ) ( ON ?auto_880276 ?auto_880277 ) ( ON ?auto_880275 ?auto_880276 ) ( ON ?auto_880274 ?auto_880275 ) ( ON ?auto_880273 ?auto_880274 ) ( ON ?auto_880272 ?auto_880273 ) ( ON ?auto_880271 ?auto_880272 ) ( ON ?auto_880270 ?auto_880271 ) ( ON ?auto_880269 ?auto_880270 ) ( CLEAR ?auto_880267 ) ( ON ?auto_880268 ?auto_880269 ) ( CLEAR ?auto_880268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_880267 ?auto_880268 )
      ( MAKE-18PILE ?auto_880267 ?auto_880268 ?auto_880269 ?auto_880270 ?auto_880271 ?auto_880272 ?auto_880273 ?auto_880274 ?auto_880275 ?auto_880276 ?auto_880277 ?auto_880278 ?auto_880279 ?auto_880280 ?auto_880281 ?auto_880282 ?auto_880283 ?auto_880284 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_880304 - BLOCK
      ?auto_880305 - BLOCK
      ?auto_880306 - BLOCK
      ?auto_880307 - BLOCK
      ?auto_880308 - BLOCK
      ?auto_880309 - BLOCK
      ?auto_880310 - BLOCK
      ?auto_880311 - BLOCK
      ?auto_880312 - BLOCK
      ?auto_880313 - BLOCK
      ?auto_880314 - BLOCK
      ?auto_880315 - BLOCK
      ?auto_880316 - BLOCK
      ?auto_880317 - BLOCK
      ?auto_880318 - BLOCK
      ?auto_880319 - BLOCK
      ?auto_880320 - BLOCK
      ?auto_880321 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_880321 ) ( ON-TABLE ?auto_880304 ) ( not ( = ?auto_880304 ?auto_880305 ) ) ( not ( = ?auto_880304 ?auto_880306 ) ) ( not ( = ?auto_880304 ?auto_880307 ) ) ( not ( = ?auto_880304 ?auto_880308 ) ) ( not ( = ?auto_880304 ?auto_880309 ) ) ( not ( = ?auto_880304 ?auto_880310 ) ) ( not ( = ?auto_880304 ?auto_880311 ) ) ( not ( = ?auto_880304 ?auto_880312 ) ) ( not ( = ?auto_880304 ?auto_880313 ) ) ( not ( = ?auto_880304 ?auto_880314 ) ) ( not ( = ?auto_880304 ?auto_880315 ) ) ( not ( = ?auto_880304 ?auto_880316 ) ) ( not ( = ?auto_880304 ?auto_880317 ) ) ( not ( = ?auto_880304 ?auto_880318 ) ) ( not ( = ?auto_880304 ?auto_880319 ) ) ( not ( = ?auto_880304 ?auto_880320 ) ) ( not ( = ?auto_880304 ?auto_880321 ) ) ( not ( = ?auto_880305 ?auto_880306 ) ) ( not ( = ?auto_880305 ?auto_880307 ) ) ( not ( = ?auto_880305 ?auto_880308 ) ) ( not ( = ?auto_880305 ?auto_880309 ) ) ( not ( = ?auto_880305 ?auto_880310 ) ) ( not ( = ?auto_880305 ?auto_880311 ) ) ( not ( = ?auto_880305 ?auto_880312 ) ) ( not ( = ?auto_880305 ?auto_880313 ) ) ( not ( = ?auto_880305 ?auto_880314 ) ) ( not ( = ?auto_880305 ?auto_880315 ) ) ( not ( = ?auto_880305 ?auto_880316 ) ) ( not ( = ?auto_880305 ?auto_880317 ) ) ( not ( = ?auto_880305 ?auto_880318 ) ) ( not ( = ?auto_880305 ?auto_880319 ) ) ( not ( = ?auto_880305 ?auto_880320 ) ) ( not ( = ?auto_880305 ?auto_880321 ) ) ( not ( = ?auto_880306 ?auto_880307 ) ) ( not ( = ?auto_880306 ?auto_880308 ) ) ( not ( = ?auto_880306 ?auto_880309 ) ) ( not ( = ?auto_880306 ?auto_880310 ) ) ( not ( = ?auto_880306 ?auto_880311 ) ) ( not ( = ?auto_880306 ?auto_880312 ) ) ( not ( = ?auto_880306 ?auto_880313 ) ) ( not ( = ?auto_880306 ?auto_880314 ) ) ( not ( = ?auto_880306 ?auto_880315 ) ) ( not ( = ?auto_880306 ?auto_880316 ) ) ( not ( = ?auto_880306 ?auto_880317 ) ) ( not ( = ?auto_880306 ?auto_880318 ) ) ( not ( = ?auto_880306 ?auto_880319 ) ) ( not ( = ?auto_880306 ?auto_880320 ) ) ( not ( = ?auto_880306 ?auto_880321 ) ) ( not ( = ?auto_880307 ?auto_880308 ) ) ( not ( = ?auto_880307 ?auto_880309 ) ) ( not ( = ?auto_880307 ?auto_880310 ) ) ( not ( = ?auto_880307 ?auto_880311 ) ) ( not ( = ?auto_880307 ?auto_880312 ) ) ( not ( = ?auto_880307 ?auto_880313 ) ) ( not ( = ?auto_880307 ?auto_880314 ) ) ( not ( = ?auto_880307 ?auto_880315 ) ) ( not ( = ?auto_880307 ?auto_880316 ) ) ( not ( = ?auto_880307 ?auto_880317 ) ) ( not ( = ?auto_880307 ?auto_880318 ) ) ( not ( = ?auto_880307 ?auto_880319 ) ) ( not ( = ?auto_880307 ?auto_880320 ) ) ( not ( = ?auto_880307 ?auto_880321 ) ) ( not ( = ?auto_880308 ?auto_880309 ) ) ( not ( = ?auto_880308 ?auto_880310 ) ) ( not ( = ?auto_880308 ?auto_880311 ) ) ( not ( = ?auto_880308 ?auto_880312 ) ) ( not ( = ?auto_880308 ?auto_880313 ) ) ( not ( = ?auto_880308 ?auto_880314 ) ) ( not ( = ?auto_880308 ?auto_880315 ) ) ( not ( = ?auto_880308 ?auto_880316 ) ) ( not ( = ?auto_880308 ?auto_880317 ) ) ( not ( = ?auto_880308 ?auto_880318 ) ) ( not ( = ?auto_880308 ?auto_880319 ) ) ( not ( = ?auto_880308 ?auto_880320 ) ) ( not ( = ?auto_880308 ?auto_880321 ) ) ( not ( = ?auto_880309 ?auto_880310 ) ) ( not ( = ?auto_880309 ?auto_880311 ) ) ( not ( = ?auto_880309 ?auto_880312 ) ) ( not ( = ?auto_880309 ?auto_880313 ) ) ( not ( = ?auto_880309 ?auto_880314 ) ) ( not ( = ?auto_880309 ?auto_880315 ) ) ( not ( = ?auto_880309 ?auto_880316 ) ) ( not ( = ?auto_880309 ?auto_880317 ) ) ( not ( = ?auto_880309 ?auto_880318 ) ) ( not ( = ?auto_880309 ?auto_880319 ) ) ( not ( = ?auto_880309 ?auto_880320 ) ) ( not ( = ?auto_880309 ?auto_880321 ) ) ( not ( = ?auto_880310 ?auto_880311 ) ) ( not ( = ?auto_880310 ?auto_880312 ) ) ( not ( = ?auto_880310 ?auto_880313 ) ) ( not ( = ?auto_880310 ?auto_880314 ) ) ( not ( = ?auto_880310 ?auto_880315 ) ) ( not ( = ?auto_880310 ?auto_880316 ) ) ( not ( = ?auto_880310 ?auto_880317 ) ) ( not ( = ?auto_880310 ?auto_880318 ) ) ( not ( = ?auto_880310 ?auto_880319 ) ) ( not ( = ?auto_880310 ?auto_880320 ) ) ( not ( = ?auto_880310 ?auto_880321 ) ) ( not ( = ?auto_880311 ?auto_880312 ) ) ( not ( = ?auto_880311 ?auto_880313 ) ) ( not ( = ?auto_880311 ?auto_880314 ) ) ( not ( = ?auto_880311 ?auto_880315 ) ) ( not ( = ?auto_880311 ?auto_880316 ) ) ( not ( = ?auto_880311 ?auto_880317 ) ) ( not ( = ?auto_880311 ?auto_880318 ) ) ( not ( = ?auto_880311 ?auto_880319 ) ) ( not ( = ?auto_880311 ?auto_880320 ) ) ( not ( = ?auto_880311 ?auto_880321 ) ) ( not ( = ?auto_880312 ?auto_880313 ) ) ( not ( = ?auto_880312 ?auto_880314 ) ) ( not ( = ?auto_880312 ?auto_880315 ) ) ( not ( = ?auto_880312 ?auto_880316 ) ) ( not ( = ?auto_880312 ?auto_880317 ) ) ( not ( = ?auto_880312 ?auto_880318 ) ) ( not ( = ?auto_880312 ?auto_880319 ) ) ( not ( = ?auto_880312 ?auto_880320 ) ) ( not ( = ?auto_880312 ?auto_880321 ) ) ( not ( = ?auto_880313 ?auto_880314 ) ) ( not ( = ?auto_880313 ?auto_880315 ) ) ( not ( = ?auto_880313 ?auto_880316 ) ) ( not ( = ?auto_880313 ?auto_880317 ) ) ( not ( = ?auto_880313 ?auto_880318 ) ) ( not ( = ?auto_880313 ?auto_880319 ) ) ( not ( = ?auto_880313 ?auto_880320 ) ) ( not ( = ?auto_880313 ?auto_880321 ) ) ( not ( = ?auto_880314 ?auto_880315 ) ) ( not ( = ?auto_880314 ?auto_880316 ) ) ( not ( = ?auto_880314 ?auto_880317 ) ) ( not ( = ?auto_880314 ?auto_880318 ) ) ( not ( = ?auto_880314 ?auto_880319 ) ) ( not ( = ?auto_880314 ?auto_880320 ) ) ( not ( = ?auto_880314 ?auto_880321 ) ) ( not ( = ?auto_880315 ?auto_880316 ) ) ( not ( = ?auto_880315 ?auto_880317 ) ) ( not ( = ?auto_880315 ?auto_880318 ) ) ( not ( = ?auto_880315 ?auto_880319 ) ) ( not ( = ?auto_880315 ?auto_880320 ) ) ( not ( = ?auto_880315 ?auto_880321 ) ) ( not ( = ?auto_880316 ?auto_880317 ) ) ( not ( = ?auto_880316 ?auto_880318 ) ) ( not ( = ?auto_880316 ?auto_880319 ) ) ( not ( = ?auto_880316 ?auto_880320 ) ) ( not ( = ?auto_880316 ?auto_880321 ) ) ( not ( = ?auto_880317 ?auto_880318 ) ) ( not ( = ?auto_880317 ?auto_880319 ) ) ( not ( = ?auto_880317 ?auto_880320 ) ) ( not ( = ?auto_880317 ?auto_880321 ) ) ( not ( = ?auto_880318 ?auto_880319 ) ) ( not ( = ?auto_880318 ?auto_880320 ) ) ( not ( = ?auto_880318 ?auto_880321 ) ) ( not ( = ?auto_880319 ?auto_880320 ) ) ( not ( = ?auto_880319 ?auto_880321 ) ) ( not ( = ?auto_880320 ?auto_880321 ) ) ( ON ?auto_880320 ?auto_880321 ) ( ON ?auto_880319 ?auto_880320 ) ( ON ?auto_880318 ?auto_880319 ) ( ON ?auto_880317 ?auto_880318 ) ( ON ?auto_880316 ?auto_880317 ) ( ON ?auto_880315 ?auto_880316 ) ( ON ?auto_880314 ?auto_880315 ) ( ON ?auto_880313 ?auto_880314 ) ( ON ?auto_880312 ?auto_880313 ) ( ON ?auto_880311 ?auto_880312 ) ( ON ?auto_880310 ?auto_880311 ) ( ON ?auto_880309 ?auto_880310 ) ( ON ?auto_880308 ?auto_880309 ) ( ON ?auto_880307 ?auto_880308 ) ( ON ?auto_880306 ?auto_880307 ) ( CLEAR ?auto_880304 ) ( ON ?auto_880305 ?auto_880306 ) ( CLEAR ?auto_880305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_880304 ?auto_880305 )
      ( MAKE-18PILE ?auto_880304 ?auto_880305 ?auto_880306 ?auto_880307 ?auto_880308 ?auto_880309 ?auto_880310 ?auto_880311 ?auto_880312 ?auto_880313 ?auto_880314 ?auto_880315 ?auto_880316 ?auto_880317 ?auto_880318 ?auto_880319 ?auto_880320 ?auto_880321 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_880340 - BLOCK
      ?auto_880341 - BLOCK
      ?auto_880342 - BLOCK
      ?auto_880343 - BLOCK
      ?auto_880344 - BLOCK
      ?auto_880345 - BLOCK
      ?auto_880346 - BLOCK
      ?auto_880347 - BLOCK
      ?auto_880348 - BLOCK
      ?auto_880349 - BLOCK
      ?auto_880350 - BLOCK
      ?auto_880351 - BLOCK
      ?auto_880352 - BLOCK
      ?auto_880353 - BLOCK
      ?auto_880354 - BLOCK
      ?auto_880355 - BLOCK
      ?auto_880356 - BLOCK
      ?auto_880357 - BLOCK
    )
    :vars
    (
      ?auto_880358 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_880357 ?auto_880358 ) ( not ( = ?auto_880340 ?auto_880341 ) ) ( not ( = ?auto_880340 ?auto_880342 ) ) ( not ( = ?auto_880340 ?auto_880343 ) ) ( not ( = ?auto_880340 ?auto_880344 ) ) ( not ( = ?auto_880340 ?auto_880345 ) ) ( not ( = ?auto_880340 ?auto_880346 ) ) ( not ( = ?auto_880340 ?auto_880347 ) ) ( not ( = ?auto_880340 ?auto_880348 ) ) ( not ( = ?auto_880340 ?auto_880349 ) ) ( not ( = ?auto_880340 ?auto_880350 ) ) ( not ( = ?auto_880340 ?auto_880351 ) ) ( not ( = ?auto_880340 ?auto_880352 ) ) ( not ( = ?auto_880340 ?auto_880353 ) ) ( not ( = ?auto_880340 ?auto_880354 ) ) ( not ( = ?auto_880340 ?auto_880355 ) ) ( not ( = ?auto_880340 ?auto_880356 ) ) ( not ( = ?auto_880340 ?auto_880357 ) ) ( not ( = ?auto_880340 ?auto_880358 ) ) ( not ( = ?auto_880341 ?auto_880342 ) ) ( not ( = ?auto_880341 ?auto_880343 ) ) ( not ( = ?auto_880341 ?auto_880344 ) ) ( not ( = ?auto_880341 ?auto_880345 ) ) ( not ( = ?auto_880341 ?auto_880346 ) ) ( not ( = ?auto_880341 ?auto_880347 ) ) ( not ( = ?auto_880341 ?auto_880348 ) ) ( not ( = ?auto_880341 ?auto_880349 ) ) ( not ( = ?auto_880341 ?auto_880350 ) ) ( not ( = ?auto_880341 ?auto_880351 ) ) ( not ( = ?auto_880341 ?auto_880352 ) ) ( not ( = ?auto_880341 ?auto_880353 ) ) ( not ( = ?auto_880341 ?auto_880354 ) ) ( not ( = ?auto_880341 ?auto_880355 ) ) ( not ( = ?auto_880341 ?auto_880356 ) ) ( not ( = ?auto_880341 ?auto_880357 ) ) ( not ( = ?auto_880341 ?auto_880358 ) ) ( not ( = ?auto_880342 ?auto_880343 ) ) ( not ( = ?auto_880342 ?auto_880344 ) ) ( not ( = ?auto_880342 ?auto_880345 ) ) ( not ( = ?auto_880342 ?auto_880346 ) ) ( not ( = ?auto_880342 ?auto_880347 ) ) ( not ( = ?auto_880342 ?auto_880348 ) ) ( not ( = ?auto_880342 ?auto_880349 ) ) ( not ( = ?auto_880342 ?auto_880350 ) ) ( not ( = ?auto_880342 ?auto_880351 ) ) ( not ( = ?auto_880342 ?auto_880352 ) ) ( not ( = ?auto_880342 ?auto_880353 ) ) ( not ( = ?auto_880342 ?auto_880354 ) ) ( not ( = ?auto_880342 ?auto_880355 ) ) ( not ( = ?auto_880342 ?auto_880356 ) ) ( not ( = ?auto_880342 ?auto_880357 ) ) ( not ( = ?auto_880342 ?auto_880358 ) ) ( not ( = ?auto_880343 ?auto_880344 ) ) ( not ( = ?auto_880343 ?auto_880345 ) ) ( not ( = ?auto_880343 ?auto_880346 ) ) ( not ( = ?auto_880343 ?auto_880347 ) ) ( not ( = ?auto_880343 ?auto_880348 ) ) ( not ( = ?auto_880343 ?auto_880349 ) ) ( not ( = ?auto_880343 ?auto_880350 ) ) ( not ( = ?auto_880343 ?auto_880351 ) ) ( not ( = ?auto_880343 ?auto_880352 ) ) ( not ( = ?auto_880343 ?auto_880353 ) ) ( not ( = ?auto_880343 ?auto_880354 ) ) ( not ( = ?auto_880343 ?auto_880355 ) ) ( not ( = ?auto_880343 ?auto_880356 ) ) ( not ( = ?auto_880343 ?auto_880357 ) ) ( not ( = ?auto_880343 ?auto_880358 ) ) ( not ( = ?auto_880344 ?auto_880345 ) ) ( not ( = ?auto_880344 ?auto_880346 ) ) ( not ( = ?auto_880344 ?auto_880347 ) ) ( not ( = ?auto_880344 ?auto_880348 ) ) ( not ( = ?auto_880344 ?auto_880349 ) ) ( not ( = ?auto_880344 ?auto_880350 ) ) ( not ( = ?auto_880344 ?auto_880351 ) ) ( not ( = ?auto_880344 ?auto_880352 ) ) ( not ( = ?auto_880344 ?auto_880353 ) ) ( not ( = ?auto_880344 ?auto_880354 ) ) ( not ( = ?auto_880344 ?auto_880355 ) ) ( not ( = ?auto_880344 ?auto_880356 ) ) ( not ( = ?auto_880344 ?auto_880357 ) ) ( not ( = ?auto_880344 ?auto_880358 ) ) ( not ( = ?auto_880345 ?auto_880346 ) ) ( not ( = ?auto_880345 ?auto_880347 ) ) ( not ( = ?auto_880345 ?auto_880348 ) ) ( not ( = ?auto_880345 ?auto_880349 ) ) ( not ( = ?auto_880345 ?auto_880350 ) ) ( not ( = ?auto_880345 ?auto_880351 ) ) ( not ( = ?auto_880345 ?auto_880352 ) ) ( not ( = ?auto_880345 ?auto_880353 ) ) ( not ( = ?auto_880345 ?auto_880354 ) ) ( not ( = ?auto_880345 ?auto_880355 ) ) ( not ( = ?auto_880345 ?auto_880356 ) ) ( not ( = ?auto_880345 ?auto_880357 ) ) ( not ( = ?auto_880345 ?auto_880358 ) ) ( not ( = ?auto_880346 ?auto_880347 ) ) ( not ( = ?auto_880346 ?auto_880348 ) ) ( not ( = ?auto_880346 ?auto_880349 ) ) ( not ( = ?auto_880346 ?auto_880350 ) ) ( not ( = ?auto_880346 ?auto_880351 ) ) ( not ( = ?auto_880346 ?auto_880352 ) ) ( not ( = ?auto_880346 ?auto_880353 ) ) ( not ( = ?auto_880346 ?auto_880354 ) ) ( not ( = ?auto_880346 ?auto_880355 ) ) ( not ( = ?auto_880346 ?auto_880356 ) ) ( not ( = ?auto_880346 ?auto_880357 ) ) ( not ( = ?auto_880346 ?auto_880358 ) ) ( not ( = ?auto_880347 ?auto_880348 ) ) ( not ( = ?auto_880347 ?auto_880349 ) ) ( not ( = ?auto_880347 ?auto_880350 ) ) ( not ( = ?auto_880347 ?auto_880351 ) ) ( not ( = ?auto_880347 ?auto_880352 ) ) ( not ( = ?auto_880347 ?auto_880353 ) ) ( not ( = ?auto_880347 ?auto_880354 ) ) ( not ( = ?auto_880347 ?auto_880355 ) ) ( not ( = ?auto_880347 ?auto_880356 ) ) ( not ( = ?auto_880347 ?auto_880357 ) ) ( not ( = ?auto_880347 ?auto_880358 ) ) ( not ( = ?auto_880348 ?auto_880349 ) ) ( not ( = ?auto_880348 ?auto_880350 ) ) ( not ( = ?auto_880348 ?auto_880351 ) ) ( not ( = ?auto_880348 ?auto_880352 ) ) ( not ( = ?auto_880348 ?auto_880353 ) ) ( not ( = ?auto_880348 ?auto_880354 ) ) ( not ( = ?auto_880348 ?auto_880355 ) ) ( not ( = ?auto_880348 ?auto_880356 ) ) ( not ( = ?auto_880348 ?auto_880357 ) ) ( not ( = ?auto_880348 ?auto_880358 ) ) ( not ( = ?auto_880349 ?auto_880350 ) ) ( not ( = ?auto_880349 ?auto_880351 ) ) ( not ( = ?auto_880349 ?auto_880352 ) ) ( not ( = ?auto_880349 ?auto_880353 ) ) ( not ( = ?auto_880349 ?auto_880354 ) ) ( not ( = ?auto_880349 ?auto_880355 ) ) ( not ( = ?auto_880349 ?auto_880356 ) ) ( not ( = ?auto_880349 ?auto_880357 ) ) ( not ( = ?auto_880349 ?auto_880358 ) ) ( not ( = ?auto_880350 ?auto_880351 ) ) ( not ( = ?auto_880350 ?auto_880352 ) ) ( not ( = ?auto_880350 ?auto_880353 ) ) ( not ( = ?auto_880350 ?auto_880354 ) ) ( not ( = ?auto_880350 ?auto_880355 ) ) ( not ( = ?auto_880350 ?auto_880356 ) ) ( not ( = ?auto_880350 ?auto_880357 ) ) ( not ( = ?auto_880350 ?auto_880358 ) ) ( not ( = ?auto_880351 ?auto_880352 ) ) ( not ( = ?auto_880351 ?auto_880353 ) ) ( not ( = ?auto_880351 ?auto_880354 ) ) ( not ( = ?auto_880351 ?auto_880355 ) ) ( not ( = ?auto_880351 ?auto_880356 ) ) ( not ( = ?auto_880351 ?auto_880357 ) ) ( not ( = ?auto_880351 ?auto_880358 ) ) ( not ( = ?auto_880352 ?auto_880353 ) ) ( not ( = ?auto_880352 ?auto_880354 ) ) ( not ( = ?auto_880352 ?auto_880355 ) ) ( not ( = ?auto_880352 ?auto_880356 ) ) ( not ( = ?auto_880352 ?auto_880357 ) ) ( not ( = ?auto_880352 ?auto_880358 ) ) ( not ( = ?auto_880353 ?auto_880354 ) ) ( not ( = ?auto_880353 ?auto_880355 ) ) ( not ( = ?auto_880353 ?auto_880356 ) ) ( not ( = ?auto_880353 ?auto_880357 ) ) ( not ( = ?auto_880353 ?auto_880358 ) ) ( not ( = ?auto_880354 ?auto_880355 ) ) ( not ( = ?auto_880354 ?auto_880356 ) ) ( not ( = ?auto_880354 ?auto_880357 ) ) ( not ( = ?auto_880354 ?auto_880358 ) ) ( not ( = ?auto_880355 ?auto_880356 ) ) ( not ( = ?auto_880355 ?auto_880357 ) ) ( not ( = ?auto_880355 ?auto_880358 ) ) ( not ( = ?auto_880356 ?auto_880357 ) ) ( not ( = ?auto_880356 ?auto_880358 ) ) ( not ( = ?auto_880357 ?auto_880358 ) ) ( ON ?auto_880356 ?auto_880357 ) ( ON ?auto_880355 ?auto_880356 ) ( ON ?auto_880354 ?auto_880355 ) ( ON ?auto_880353 ?auto_880354 ) ( ON ?auto_880352 ?auto_880353 ) ( ON ?auto_880351 ?auto_880352 ) ( ON ?auto_880350 ?auto_880351 ) ( ON ?auto_880349 ?auto_880350 ) ( ON ?auto_880348 ?auto_880349 ) ( ON ?auto_880347 ?auto_880348 ) ( ON ?auto_880346 ?auto_880347 ) ( ON ?auto_880345 ?auto_880346 ) ( ON ?auto_880344 ?auto_880345 ) ( ON ?auto_880343 ?auto_880344 ) ( ON ?auto_880342 ?auto_880343 ) ( ON ?auto_880341 ?auto_880342 ) ( ON ?auto_880340 ?auto_880341 ) ( CLEAR ?auto_880340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_880340 )
      ( MAKE-18PILE ?auto_880340 ?auto_880341 ?auto_880342 ?auto_880343 ?auto_880344 ?auto_880345 ?auto_880346 ?auto_880347 ?auto_880348 ?auto_880349 ?auto_880350 ?auto_880351 ?auto_880352 ?auto_880353 ?auto_880354 ?auto_880355 ?auto_880356 ?auto_880357 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_880377 - BLOCK
      ?auto_880378 - BLOCK
      ?auto_880379 - BLOCK
      ?auto_880380 - BLOCK
      ?auto_880381 - BLOCK
      ?auto_880382 - BLOCK
      ?auto_880383 - BLOCK
      ?auto_880384 - BLOCK
      ?auto_880385 - BLOCK
      ?auto_880386 - BLOCK
      ?auto_880387 - BLOCK
      ?auto_880388 - BLOCK
      ?auto_880389 - BLOCK
      ?auto_880390 - BLOCK
      ?auto_880391 - BLOCK
      ?auto_880392 - BLOCK
      ?auto_880393 - BLOCK
      ?auto_880394 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_880394 ) ( not ( = ?auto_880377 ?auto_880378 ) ) ( not ( = ?auto_880377 ?auto_880379 ) ) ( not ( = ?auto_880377 ?auto_880380 ) ) ( not ( = ?auto_880377 ?auto_880381 ) ) ( not ( = ?auto_880377 ?auto_880382 ) ) ( not ( = ?auto_880377 ?auto_880383 ) ) ( not ( = ?auto_880377 ?auto_880384 ) ) ( not ( = ?auto_880377 ?auto_880385 ) ) ( not ( = ?auto_880377 ?auto_880386 ) ) ( not ( = ?auto_880377 ?auto_880387 ) ) ( not ( = ?auto_880377 ?auto_880388 ) ) ( not ( = ?auto_880377 ?auto_880389 ) ) ( not ( = ?auto_880377 ?auto_880390 ) ) ( not ( = ?auto_880377 ?auto_880391 ) ) ( not ( = ?auto_880377 ?auto_880392 ) ) ( not ( = ?auto_880377 ?auto_880393 ) ) ( not ( = ?auto_880377 ?auto_880394 ) ) ( not ( = ?auto_880378 ?auto_880379 ) ) ( not ( = ?auto_880378 ?auto_880380 ) ) ( not ( = ?auto_880378 ?auto_880381 ) ) ( not ( = ?auto_880378 ?auto_880382 ) ) ( not ( = ?auto_880378 ?auto_880383 ) ) ( not ( = ?auto_880378 ?auto_880384 ) ) ( not ( = ?auto_880378 ?auto_880385 ) ) ( not ( = ?auto_880378 ?auto_880386 ) ) ( not ( = ?auto_880378 ?auto_880387 ) ) ( not ( = ?auto_880378 ?auto_880388 ) ) ( not ( = ?auto_880378 ?auto_880389 ) ) ( not ( = ?auto_880378 ?auto_880390 ) ) ( not ( = ?auto_880378 ?auto_880391 ) ) ( not ( = ?auto_880378 ?auto_880392 ) ) ( not ( = ?auto_880378 ?auto_880393 ) ) ( not ( = ?auto_880378 ?auto_880394 ) ) ( not ( = ?auto_880379 ?auto_880380 ) ) ( not ( = ?auto_880379 ?auto_880381 ) ) ( not ( = ?auto_880379 ?auto_880382 ) ) ( not ( = ?auto_880379 ?auto_880383 ) ) ( not ( = ?auto_880379 ?auto_880384 ) ) ( not ( = ?auto_880379 ?auto_880385 ) ) ( not ( = ?auto_880379 ?auto_880386 ) ) ( not ( = ?auto_880379 ?auto_880387 ) ) ( not ( = ?auto_880379 ?auto_880388 ) ) ( not ( = ?auto_880379 ?auto_880389 ) ) ( not ( = ?auto_880379 ?auto_880390 ) ) ( not ( = ?auto_880379 ?auto_880391 ) ) ( not ( = ?auto_880379 ?auto_880392 ) ) ( not ( = ?auto_880379 ?auto_880393 ) ) ( not ( = ?auto_880379 ?auto_880394 ) ) ( not ( = ?auto_880380 ?auto_880381 ) ) ( not ( = ?auto_880380 ?auto_880382 ) ) ( not ( = ?auto_880380 ?auto_880383 ) ) ( not ( = ?auto_880380 ?auto_880384 ) ) ( not ( = ?auto_880380 ?auto_880385 ) ) ( not ( = ?auto_880380 ?auto_880386 ) ) ( not ( = ?auto_880380 ?auto_880387 ) ) ( not ( = ?auto_880380 ?auto_880388 ) ) ( not ( = ?auto_880380 ?auto_880389 ) ) ( not ( = ?auto_880380 ?auto_880390 ) ) ( not ( = ?auto_880380 ?auto_880391 ) ) ( not ( = ?auto_880380 ?auto_880392 ) ) ( not ( = ?auto_880380 ?auto_880393 ) ) ( not ( = ?auto_880380 ?auto_880394 ) ) ( not ( = ?auto_880381 ?auto_880382 ) ) ( not ( = ?auto_880381 ?auto_880383 ) ) ( not ( = ?auto_880381 ?auto_880384 ) ) ( not ( = ?auto_880381 ?auto_880385 ) ) ( not ( = ?auto_880381 ?auto_880386 ) ) ( not ( = ?auto_880381 ?auto_880387 ) ) ( not ( = ?auto_880381 ?auto_880388 ) ) ( not ( = ?auto_880381 ?auto_880389 ) ) ( not ( = ?auto_880381 ?auto_880390 ) ) ( not ( = ?auto_880381 ?auto_880391 ) ) ( not ( = ?auto_880381 ?auto_880392 ) ) ( not ( = ?auto_880381 ?auto_880393 ) ) ( not ( = ?auto_880381 ?auto_880394 ) ) ( not ( = ?auto_880382 ?auto_880383 ) ) ( not ( = ?auto_880382 ?auto_880384 ) ) ( not ( = ?auto_880382 ?auto_880385 ) ) ( not ( = ?auto_880382 ?auto_880386 ) ) ( not ( = ?auto_880382 ?auto_880387 ) ) ( not ( = ?auto_880382 ?auto_880388 ) ) ( not ( = ?auto_880382 ?auto_880389 ) ) ( not ( = ?auto_880382 ?auto_880390 ) ) ( not ( = ?auto_880382 ?auto_880391 ) ) ( not ( = ?auto_880382 ?auto_880392 ) ) ( not ( = ?auto_880382 ?auto_880393 ) ) ( not ( = ?auto_880382 ?auto_880394 ) ) ( not ( = ?auto_880383 ?auto_880384 ) ) ( not ( = ?auto_880383 ?auto_880385 ) ) ( not ( = ?auto_880383 ?auto_880386 ) ) ( not ( = ?auto_880383 ?auto_880387 ) ) ( not ( = ?auto_880383 ?auto_880388 ) ) ( not ( = ?auto_880383 ?auto_880389 ) ) ( not ( = ?auto_880383 ?auto_880390 ) ) ( not ( = ?auto_880383 ?auto_880391 ) ) ( not ( = ?auto_880383 ?auto_880392 ) ) ( not ( = ?auto_880383 ?auto_880393 ) ) ( not ( = ?auto_880383 ?auto_880394 ) ) ( not ( = ?auto_880384 ?auto_880385 ) ) ( not ( = ?auto_880384 ?auto_880386 ) ) ( not ( = ?auto_880384 ?auto_880387 ) ) ( not ( = ?auto_880384 ?auto_880388 ) ) ( not ( = ?auto_880384 ?auto_880389 ) ) ( not ( = ?auto_880384 ?auto_880390 ) ) ( not ( = ?auto_880384 ?auto_880391 ) ) ( not ( = ?auto_880384 ?auto_880392 ) ) ( not ( = ?auto_880384 ?auto_880393 ) ) ( not ( = ?auto_880384 ?auto_880394 ) ) ( not ( = ?auto_880385 ?auto_880386 ) ) ( not ( = ?auto_880385 ?auto_880387 ) ) ( not ( = ?auto_880385 ?auto_880388 ) ) ( not ( = ?auto_880385 ?auto_880389 ) ) ( not ( = ?auto_880385 ?auto_880390 ) ) ( not ( = ?auto_880385 ?auto_880391 ) ) ( not ( = ?auto_880385 ?auto_880392 ) ) ( not ( = ?auto_880385 ?auto_880393 ) ) ( not ( = ?auto_880385 ?auto_880394 ) ) ( not ( = ?auto_880386 ?auto_880387 ) ) ( not ( = ?auto_880386 ?auto_880388 ) ) ( not ( = ?auto_880386 ?auto_880389 ) ) ( not ( = ?auto_880386 ?auto_880390 ) ) ( not ( = ?auto_880386 ?auto_880391 ) ) ( not ( = ?auto_880386 ?auto_880392 ) ) ( not ( = ?auto_880386 ?auto_880393 ) ) ( not ( = ?auto_880386 ?auto_880394 ) ) ( not ( = ?auto_880387 ?auto_880388 ) ) ( not ( = ?auto_880387 ?auto_880389 ) ) ( not ( = ?auto_880387 ?auto_880390 ) ) ( not ( = ?auto_880387 ?auto_880391 ) ) ( not ( = ?auto_880387 ?auto_880392 ) ) ( not ( = ?auto_880387 ?auto_880393 ) ) ( not ( = ?auto_880387 ?auto_880394 ) ) ( not ( = ?auto_880388 ?auto_880389 ) ) ( not ( = ?auto_880388 ?auto_880390 ) ) ( not ( = ?auto_880388 ?auto_880391 ) ) ( not ( = ?auto_880388 ?auto_880392 ) ) ( not ( = ?auto_880388 ?auto_880393 ) ) ( not ( = ?auto_880388 ?auto_880394 ) ) ( not ( = ?auto_880389 ?auto_880390 ) ) ( not ( = ?auto_880389 ?auto_880391 ) ) ( not ( = ?auto_880389 ?auto_880392 ) ) ( not ( = ?auto_880389 ?auto_880393 ) ) ( not ( = ?auto_880389 ?auto_880394 ) ) ( not ( = ?auto_880390 ?auto_880391 ) ) ( not ( = ?auto_880390 ?auto_880392 ) ) ( not ( = ?auto_880390 ?auto_880393 ) ) ( not ( = ?auto_880390 ?auto_880394 ) ) ( not ( = ?auto_880391 ?auto_880392 ) ) ( not ( = ?auto_880391 ?auto_880393 ) ) ( not ( = ?auto_880391 ?auto_880394 ) ) ( not ( = ?auto_880392 ?auto_880393 ) ) ( not ( = ?auto_880392 ?auto_880394 ) ) ( not ( = ?auto_880393 ?auto_880394 ) ) ( ON ?auto_880393 ?auto_880394 ) ( ON ?auto_880392 ?auto_880393 ) ( ON ?auto_880391 ?auto_880392 ) ( ON ?auto_880390 ?auto_880391 ) ( ON ?auto_880389 ?auto_880390 ) ( ON ?auto_880388 ?auto_880389 ) ( ON ?auto_880387 ?auto_880388 ) ( ON ?auto_880386 ?auto_880387 ) ( ON ?auto_880385 ?auto_880386 ) ( ON ?auto_880384 ?auto_880385 ) ( ON ?auto_880383 ?auto_880384 ) ( ON ?auto_880382 ?auto_880383 ) ( ON ?auto_880381 ?auto_880382 ) ( ON ?auto_880380 ?auto_880381 ) ( ON ?auto_880379 ?auto_880380 ) ( ON ?auto_880378 ?auto_880379 ) ( ON ?auto_880377 ?auto_880378 ) ( CLEAR ?auto_880377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_880377 )
      ( MAKE-18PILE ?auto_880377 ?auto_880378 ?auto_880379 ?auto_880380 ?auto_880381 ?auto_880382 ?auto_880383 ?auto_880384 ?auto_880385 ?auto_880386 ?auto_880387 ?auto_880388 ?auto_880389 ?auto_880390 ?auto_880391 ?auto_880392 ?auto_880393 ?auto_880394 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_880413 - BLOCK
      ?auto_880414 - BLOCK
      ?auto_880415 - BLOCK
      ?auto_880416 - BLOCK
      ?auto_880417 - BLOCK
      ?auto_880418 - BLOCK
      ?auto_880419 - BLOCK
      ?auto_880420 - BLOCK
      ?auto_880421 - BLOCK
      ?auto_880422 - BLOCK
      ?auto_880423 - BLOCK
      ?auto_880424 - BLOCK
      ?auto_880425 - BLOCK
      ?auto_880426 - BLOCK
      ?auto_880427 - BLOCK
      ?auto_880428 - BLOCK
      ?auto_880429 - BLOCK
      ?auto_880430 - BLOCK
    )
    :vars
    (
      ?auto_880431 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_880413 ?auto_880414 ) ) ( not ( = ?auto_880413 ?auto_880415 ) ) ( not ( = ?auto_880413 ?auto_880416 ) ) ( not ( = ?auto_880413 ?auto_880417 ) ) ( not ( = ?auto_880413 ?auto_880418 ) ) ( not ( = ?auto_880413 ?auto_880419 ) ) ( not ( = ?auto_880413 ?auto_880420 ) ) ( not ( = ?auto_880413 ?auto_880421 ) ) ( not ( = ?auto_880413 ?auto_880422 ) ) ( not ( = ?auto_880413 ?auto_880423 ) ) ( not ( = ?auto_880413 ?auto_880424 ) ) ( not ( = ?auto_880413 ?auto_880425 ) ) ( not ( = ?auto_880413 ?auto_880426 ) ) ( not ( = ?auto_880413 ?auto_880427 ) ) ( not ( = ?auto_880413 ?auto_880428 ) ) ( not ( = ?auto_880413 ?auto_880429 ) ) ( not ( = ?auto_880413 ?auto_880430 ) ) ( not ( = ?auto_880414 ?auto_880415 ) ) ( not ( = ?auto_880414 ?auto_880416 ) ) ( not ( = ?auto_880414 ?auto_880417 ) ) ( not ( = ?auto_880414 ?auto_880418 ) ) ( not ( = ?auto_880414 ?auto_880419 ) ) ( not ( = ?auto_880414 ?auto_880420 ) ) ( not ( = ?auto_880414 ?auto_880421 ) ) ( not ( = ?auto_880414 ?auto_880422 ) ) ( not ( = ?auto_880414 ?auto_880423 ) ) ( not ( = ?auto_880414 ?auto_880424 ) ) ( not ( = ?auto_880414 ?auto_880425 ) ) ( not ( = ?auto_880414 ?auto_880426 ) ) ( not ( = ?auto_880414 ?auto_880427 ) ) ( not ( = ?auto_880414 ?auto_880428 ) ) ( not ( = ?auto_880414 ?auto_880429 ) ) ( not ( = ?auto_880414 ?auto_880430 ) ) ( not ( = ?auto_880415 ?auto_880416 ) ) ( not ( = ?auto_880415 ?auto_880417 ) ) ( not ( = ?auto_880415 ?auto_880418 ) ) ( not ( = ?auto_880415 ?auto_880419 ) ) ( not ( = ?auto_880415 ?auto_880420 ) ) ( not ( = ?auto_880415 ?auto_880421 ) ) ( not ( = ?auto_880415 ?auto_880422 ) ) ( not ( = ?auto_880415 ?auto_880423 ) ) ( not ( = ?auto_880415 ?auto_880424 ) ) ( not ( = ?auto_880415 ?auto_880425 ) ) ( not ( = ?auto_880415 ?auto_880426 ) ) ( not ( = ?auto_880415 ?auto_880427 ) ) ( not ( = ?auto_880415 ?auto_880428 ) ) ( not ( = ?auto_880415 ?auto_880429 ) ) ( not ( = ?auto_880415 ?auto_880430 ) ) ( not ( = ?auto_880416 ?auto_880417 ) ) ( not ( = ?auto_880416 ?auto_880418 ) ) ( not ( = ?auto_880416 ?auto_880419 ) ) ( not ( = ?auto_880416 ?auto_880420 ) ) ( not ( = ?auto_880416 ?auto_880421 ) ) ( not ( = ?auto_880416 ?auto_880422 ) ) ( not ( = ?auto_880416 ?auto_880423 ) ) ( not ( = ?auto_880416 ?auto_880424 ) ) ( not ( = ?auto_880416 ?auto_880425 ) ) ( not ( = ?auto_880416 ?auto_880426 ) ) ( not ( = ?auto_880416 ?auto_880427 ) ) ( not ( = ?auto_880416 ?auto_880428 ) ) ( not ( = ?auto_880416 ?auto_880429 ) ) ( not ( = ?auto_880416 ?auto_880430 ) ) ( not ( = ?auto_880417 ?auto_880418 ) ) ( not ( = ?auto_880417 ?auto_880419 ) ) ( not ( = ?auto_880417 ?auto_880420 ) ) ( not ( = ?auto_880417 ?auto_880421 ) ) ( not ( = ?auto_880417 ?auto_880422 ) ) ( not ( = ?auto_880417 ?auto_880423 ) ) ( not ( = ?auto_880417 ?auto_880424 ) ) ( not ( = ?auto_880417 ?auto_880425 ) ) ( not ( = ?auto_880417 ?auto_880426 ) ) ( not ( = ?auto_880417 ?auto_880427 ) ) ( not ( = ?auto_880417 ?auto_880428 ) ) ( not ( = ?auto_880417 ?auto_880429 ) ) ( not ( = ?auto_880417 ?auto_880430 ) ) ( not ( = ?auto_880418 ?auto_880419 ) ) ( not ( = ?auto_880418 ?auto_880420 ) ) ( not ( = ?auto_880418 ?auto_880421 ) ) ( not ( = ?auto_880418 ?auto_880422 ) ) ( not ( = ?auto_880418 ?auto_880423 ) ) ( not ( = ?auto_880418 ?auto_880424 ) ) ( not ( = ?auto_880418 ?auto_880425 ) ) ( not ( = ?auto_880418 ?auto_880426 ) ) ( not ( = ?auto_880418 ?auto_880427 ) ) ( not ( = ?auto_880418 ?auto_880428 ) ) ( not ( = ?auto_880418 ?auto_880429 ) ) ( not ( = ?auto_880418 ?auto_880430 ) ) ( not ( = ?auto_880419 ?auto_880420 ) ) ( not ( = ?auto_880419 ?auto_880421 ) ) ( not ( = ?auto_880419 ?auto_880422 ) ) ( not ( = ?auto_880419 ?auto_880423 ) ) ( not ( = ?auto_880419 ?auto_880424 ) ) ( not ( = ?auto_880419 ?auto_880425 ) ) ( not ( = ?auto_880419 ?auto_880426 ) ) ( not ( = ?auto_880419 ?auto_880427 ) ) ( not ( = ?auto_880419 ?auto_880428 ) ) ( not ( = ?auto_880419 ?auto_880429 ) ) ( not ( = ?auto_880419 ?auto_880430 ) ) ( not ( = ?auto_880420 ?auto_880421 ) ) ( not ( = ?auto_880420 ?auto_880422 ) ) ( not ( = ?auto_880420 ?auto_880423 ) ) ( not ( = ?auto_880420 ?auto_880424 ) ) ( not ( = ?auto_880420 ?auto_880425 ) ) ( not ( = ?auto_880420 ?auto_880426 ) ) ( not ( = ?auto_880420 ?auto_880427 ) ) ( not ( = ?auto_880420 ?auto_880428 ) ) ( not ( = ?auto_880420 ?auto_880429 ) ) ( not ( = ?auto_880420 ?auto_880430 ) ) ( not ( = ?auto_880421 ?auto_880422 ) ) ( not ( = ?auto_880421 ?auto_880423 ) ) ( not ( = ?auto_880421 ?auto_880424 ) ) ( not ( = ?auto_880421 ?auto_880425 ) ) ( not ( = ?auto_880421 ?auto_880426 ) ) ( not ( = ?auto_880421 ?auto_880427 ) ) ( not ( = ?auto_880421 ?auto_880428 ) ) ( not ( = ?auto_880421 ?auto_880429 ) ) ( not ( = ?auto_880421 ?auto_880430 ) ) ( not ( = ?auto_880422 ?auto_880423 ) ) ( not ( = ?auto_880422 ?auto_880424 ) ) ( not ( = ?auto_880422 ?auto_880425 ) ) ( not ( = ?auto_880422 ?auto_880426 ) ) ( not ( = ?auto_880422 ?auto_880427 ) ) ( not ( = ?auto_880422 ?auto_880428 ) ) ( not ( = ?auto_880422 ?auto_880429 ) ) ( not ( = ?auto_880422 ?auto_880430 ) ) ( not ( = ?auto_880423 ?auto_880424 ) ) ( not ( = ?auto_880423 ?auto_880425 ) ) ( not ( = ?auto_880423 ?auto_880426 ) ) ( not ( = ?auto_880423 ?auto_880427 ) ) ( not ( = ?auto_880423 ?auto_880428 ) ) ( not ( = ?auto_880423 ?auto_880429 ) ) ( not ( = ?auto_880423 ?auto_880430 ) ) ( not ( = ?auto_880424 ?auto_880425 ) ) ( not ( = ?auto_880424 ?auto_880426 ) ) ( not ( = ?auto_880424 ?auto_880427 ) ) ( not ( = ?auto_880424 ?auto_880428 ) ) ( not ( = ?auto_880424 ?auto_880429 ) ) ( not ( = ?auto_880424 ?auto_880430 ) ) ( not ( = ?auto_880425 ?auto_880426 ) ) ( not ( = ?auto_880425 ?auto_880427 ) ) ( not ( = ?auto_880425 ?auto_880428 ) ) ( not ( = ?auto_880425 ?auto_880429 ) ) ( not ( = ?auto_880425 ?auto_880430 ) ) ( not ( = ?auto_880426 ?auto_880427 ) ) ( not ( = ?auto_880426 ?auto_880428 ) ) ( not ( = ?auto_880426 ?auto_880429 ) ) ( not ( = ?auto_880426 ?auto_880430 ) ) ( not ( = ?auto_880427 ?auto_880428 ) ) ( not ( = ?auto_880427 ?auto_880429 ) ) ( not ( = ?auto_880427 ?auto_880430 ) ) ( not ( = ?auto_880428 ?auto_880429 ) ) ( not ( = ?auto_880428 ?auto_880430 ) ) ( not ( = ?auto_880429 ?auto_880430 ) ) ( ON ?auto_880413 ?auto_880431 ) ( not ( = ?auto_880430 ?auto_880431 ) ) ( not ( = ?auto_880429 ?auto_880431 ) ) ( not ( = ?auto_880428 ?auto_880431 ) ) ( not ( = ?auto_880427 ?auto_880431 ) ) ( not ( = ?auto_880426 ?auto_880431 ) ) ( not ( = ?auto_880425 ?auto_880431 ) ) ( not ( = ?auto_880424 ?auto_880431 ) ) ( not ( = ?auto_880423 ?auto_880431 ) ) ( not ( = ?auto_880422 ?auto_880431 ) ) ( not ( = ?auto_880421 ?auto_880431 ) ) ( not ( = ?auto_880420 ?auto_880431 ) ) ( not ( = ?auto_880419 ?auto_880431 ) ) ( not ( = ?auto_880418 ?auto_880431 ) ) ( not ( = ?auto_880417 ?auto_880431 ) ) ( not ( = ?auto_880416 ?auto_880431 ) ) ( not ( = ?auto_880415 ?auto_880431 ) ) ( not ( = ?auto_880414 ?auto_880431 ) ) ( not ( = ?auto_880413 ?auto_880431 ) ) ( ON ?auto_880414 ?auto_880413 ) ( ON ?auto_880415 ?auto_880414 ) ( ON ?auto_880416 ?auto_880415 ) ( ON ?auto_880417 ?auto_880416 ) ( ON ?auto_880418 ?auto_880417 ) ( ON ?auto_880419 ?auto_880418 ) ( ON ?auto_880420 ?auto_880419 ) ( ON ?auto_880421 ?auto_880420 ) ( ON ?auto_880422 ?auto_880421 ) ( ON ?auto_880423 ?auto_880422 ) ( ON ?auto_880424 ?auto_880423 ) ( ON ?auto_880425 ?auto_880424 ) ( ON ?auto_880426 ?auto_880425 ) ( ON ?auto_880427 ?auto_880426 ) ( ON ?auto_880428 ?auto_880427 ) ( ON ?auto_880429 ?auto_880428 ) ( ON ?auto_880430 ?auto_880429 ) ( CLEAR ?auto_880430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-18PILE ?auto_880430 ?auto_880429 ?auto_880428 ?auto_880427 ?auto_880426 ?auto_880425 ?auto_880424 ?auto_880423 ?auto_880422 ?auto_880421 ?auto_880420 ?auto_880419 ?auto_880418 ?auto_880417 ?auto_880416 ?auto_880415 ?auto_880414 ?auto_880413 )
      ( MAKE-18PILE ?auto_880413 ?auto_880414 ?auto_880415 ?auto_880416 ?auto_880417 ?auto_880418 ?auto_880419 ?auto_880420 ?auto_880421 ?auto_880422 ?auto_880423 ?auto_880424 ?auto_880425 ?auto_880426 ?auto_880427 ?auto_880428 ?auto_880429 ?auto_880430 ) )
  )

)

