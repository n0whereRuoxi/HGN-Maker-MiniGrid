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
      ?auto_360621 - BLOCK
    )
    :vars
    (
      ?auto_360622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_360621 ?auto_360622 ) ( CLEAR ?auto_360621 ) ( HAND-EMPTY ) ( not ( = ?auto_360621 ?auto_360622 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_360621 ?auto_360622 )
      ( !PUTDOWN ?auto_360621 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_360628 - BLOCK
      ?auto_360629 - BLOCK
    )
    :vars
    (
      ?auto_360630 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_360628 ) ( ON ?auto_360629 ?auto_360630 ) ( CLEAR ?auto_360629 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_360628 ) ( not ( = ?auto_360628 ?auto_360629 ) ) ( not ( = ?auto_360628 ?auto_360630 ) ) ( not ( = ?auto_360629 ?auto_360630 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_360629 ?auto_360630 )
      ( !STACK ?auto_360629 ?auto_360628 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_360638 - BLOCK
      ?auto_360639 - BLOCK
    )
    :vars
    (
      ?auto_360640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_360639 ?auto_360640 ) ( not ( = ?auto_360638 ?auto_360639 ) ) ( not ( = ?auto_360638 ?auto_360640 ) ) ( not ( = ?auto_360639 ?auto_360640 ) ) ( ON ?auto_360638 ?auto_360639 ) ( CLEAR ?auto_360638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_360638 )
      ( MAKE-2PILE ?auto_360638 ?auto_360639 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_360649 - BLOCK
      ?auto_360650 - BLOCK
      ?auto_360651 - BLOCK
    )
    :vars
    (
      ?auto_360652 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_360650 ) ( ON ?auto_360651 ?auto_360652 ) ( CLEAR ?auto_360651 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_360649 ) ( ON ?auto_360650 ?auto_360649 ) ( not ( = ?auto_360649 ?auto_360650 ) ) ( not ( = ?auto_360649 ?auto_360651 ) ) ( not ( = ?auto_360649 ?auto_360652 ) ) ( not ( = ?auto_360650 ?auto_360651 ) ) ( not ( = ?auto_360650 ?auto_360652 ) ) ( not ( = ?auto_360651 ?auto_360652 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_360651 ?auto_360652 )
      ( !STACK ?auto_360651 ?auto_360650 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_360663 - BLOCK
      ?auto_360664 - BLOCK
      ?auto_360665 - BLOCK
    )
    :vars
    (
      ?auto_360666 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_360665 ?auto_360666 ) ( ON-TABLE ?auto_360663 ) ( not ( = ?auto_360663 ?auto_360664 ) ) ( not ( = ?auto_360663 ?auto_360665 ) ) ( not ( = ?auto_360663 ?auto_360666 ) ) ( not ( = ?auto_360664 ?auto_360665 ) ) ( not ( = ?auto_360664 ?auto_360666 ) ) ( not ( = ?auto_360665 ?auto_360666 ) ) ( CLEAR ?auto_360663 ) ( ON ?auto_360664 ?auto_360665 ) ( CLEAR ?auto_360664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_360663 ?auto_360664 )
      ( MAKE-3PILE ?auto_360663 ?auto_360664 ?auto_360665 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_360677 - BLOCK
      ?auto_360678 - BLOCK
      ?auto_360679 - BLOCK
    )
    :vars
    (
      ?auto_360680 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_360679 ?auto_360680 ) ( not ( = ?auto_360677 ?auto_360678 ) ) ( not ( = ?auto_360677 ?auto_360679 ) ) ( not ( = ?auto_360677 ?auto_360680 ) ) ( not ( = ?auto_360678 ?auto_360679 ) ) ( not ( = ?auto_360678 ?auto_360680 ) ) ( not ( = ?auto_360679 ?auto_360680 ) ) ( ON ?auto_360678 ?auto_360679 ) ( ON ?auto_360677 ?auto_360678 ) ( CLEAR ?auto_360677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_360677 )
      ( MAKE-3PILE ?auto_360677 ?auto_360678 ?auto_360679 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_360692 - BLOCK
      ?auto_360693 - BLOCK
      ?auto_360694 - BLOCK
      ?auto_360695 - BLOCK
    )
    :vars
    (
      ?auto_360696 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_360694 ) ( ON ?auto_360695 ?auto_360696 ) ( CLEAR ?auto_360695 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_360692 ) ( ON ?auto_360693 ?auto_360692 ) ( ON ?auto_360694 ?auto_360693 ) ( not ( = ?auto_360692 ?auto_360693 ) ) ( not ( = ?auto_360692 ?auto_360694 ) ) ( not ( = ?auto_360692 ?auto_360695 ) ) ( not ( = ?auto_360692 ?auto_360696 ) ) ( not ( = ?auto_360693 ?auto_360694 ) ) ( not ( = ?auto_360693 ?auto_360695 ) ) ( not ( = ?auto_360693 ?auto_360696 ) ) ( not ( = ?auto_360694 ?auto_360695 ) ) ( not ( = ?auto_360694 ?auto_360696 ) ) ( not ( = ?auto_360695 ?auto_360696 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_360695 ?auto_360696 )
      ( !STACK ?auto_360695 ?auto_360694 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_360710 - BLOCK
      ?auto_360711 - BLOCK
      ?auto_360712 - BLOCK
      ?auto_360713 - BLOCK
    )
    :vars
    (
      ?auto_360714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_360713 ?auto_360714 ) ( ON-TABLE ?auto_360710 ) ( ON ?auto_360711 ?auto_360710 ) ( not ( = ?auto_360710 ?auto_360711 ) ) ( not ( = ?auto_360710 ?auto_360712 ) ) ( not ( = ?auto_360710 ?auto_360713 ) ) ( not ( = ?auto_360710 ?auto_360714 ) ) ( not ( = ?auto_360711 ?auto_360712 ) ) ( not ( = ?auto_360711 ?auto_360713 ) ) ( not ( = ?auto_360711 ?auto_360714 ) ) ( not ( = ?auto_360712 ?auto_360713 ) ) ( not ( = ?auto_360712 ?auto_360714 ) ) ( not ( = ?auto_360713 ?auto_360714 ) ) ( CLEAR ?auto_360711 ) ( ON ?auto_360712 ?auto_360713 ) ( CLEAR ?auto_360712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_360710 ?auto_360711 ?auto_360712 )
      ( MAKE-4PILE ?auto_360710 ?auto_360711 ?auto_360712 ?auto_360713 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_360728 - BLOCK
      ?auto_360729 - BLOCK
      ?auto_360730 - BLOCK
      ?auto_360731 - BLOCK
    )
    :vars
    (
      ?auto_360732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_360731 ?auto_360732 ) ( ON-TABLE ?auto_360728 ) ( not ( = ?auto_360728 ?auto_360729 ) ) ( not ( = ?auto_360728 ?auto_360730 ) ) ( not ( = ?auto_360728 ?auto_360731 ) ) ( not ( = ?auto_360728 ?auto_360732 ) ) ( not ( = ?auto_360729 ?auto_360730 ) ) ( not ( = ?auto_360729 ?auto_360731 ) ) ( not ( = ?auto_360729 ?auto_360732 ) ) ( not ( = ?auto_360730 ?auto_360731 ) ) ( not ( = ?auto_360730 ?auto_360732 ) ) ( not ( = ?auto_360731 ?auto_360732 ) ) ( ON ?auto_360730 ?auto_360731 ) ( CLEAR ?auto_360728 ) ( ON ?auto_360729 ?auto_360730 ) ( CLEAR ?auto_360729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_360728 ?auto_360729 )
      ( MAKE-4PILE ?auto_360728 ?auto_360729 ?auto_360730 ?auto_360731 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_360746 - BLOCK
      ?auto_360747 - BLOCK
      ?auto_360748 - BLOCK
      ?auto_360749 - BLOCK
    )
    :vars
    (
      ?auto_360750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_360749 ?auto_360750 ) ( not ( = ?auto_360746 ?auto_360747 ) ) ( not ( = ?auto_360746 ?auto_360748 ) ) ( not ( = ?auto_360746 ?auto_360749 ) ) ( not ( = ?auto_360746 ?auto_360750 ) ) ( not ( = ?auto_360747 ?auto_360748 ) ) ( not ( = ?auto_360747 ?auto_360749 ) ) ( not ( = ?auto_360747 ?auto_360750 ) ) ( not ( = ?auto_360748 ?auto_360749 ) ) ( not ( = ?auto_360748 ?auto_360750 ) ) ( not ( = ?auto_360749 ?auto_360750 ) ) ( ON ?auto_360748 ?auto_360749 ) ( ON ?auto_360747 ?auto_360748 ) ( ON ?auto_360746 ?auto_360747 ) ( CLEAR ?auto_360746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_360746 )
      ( MAKE-4PILE ?auto_360746 ?auto_360747 ?auto_360748 ?auto_360749 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_360765 - BLOCK
      ?auto_360766 - BLOCK
      ?auto_360767 - BLOCK
      ?auto_360768 - BLOCK
      ?auto_360769 - BLOCK
    )
    :vars
    (
      ?auto_360770 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_360768 ) ( ON ?auto_360769 ?auto_360770 ) ( CLEAR ?auto_360769 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_360765 ) ( ON ?auto_360766 ?auto_360765 ) ( ON ?auto_360767 ?auto_360766 ) ( ON ?auto_360768 ?auto_360767 ) ( not ( = ?auto_360765 ?auto_360766 ) ) ( not ( = ?auto_360765 ?auto_360767 ) ) ( not ( = ?auto_360765 ?auto_360768 ) ) ( not ( = ?auto_360765 ?auto_360769 ) ) ( not ( = ?auto_360765 ?auto_360770 ) ) ( not ( = ?auto_360766 ?auto_360767 ) ) ( not ( = ?auto_360766 ?auto_360768 ) ) ( not ( = ?auto_360766 ?auto_360769 ) ) ( not ( = ?auto_360766 ?auto_360770 ) ) ( not ( = ?auto_360767 ?auto_360768 ) ) ( not ( = ?auto_360767 ?auto_360769 ) ) ( not ( = ?auto_360767 ?auto_360770 ) ) ( not ( = ?auto_360768 ?auto_360769 ) ) ( not ( = ?auto_360768 ?auto_360770 ) ) ( not ( = ?auto_360769 ?auto_360770 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_360769 ?auto_360770 )
      ( !STACK ?auto_360769 ?auto_360768 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_360787 - BLOCK
      ?auto_360788 - BLOCK
      ?auto_360789 - BLOCK
      ?auto_360790 - BLOCK
      ?auto_360791 - BLOCK
    )
    :vars
    (
      ?auto_360792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_360791 ?auto_360792 ) ( ON-TABLE ?auto_360787 ) ( ON ?auto_360788 ?auto_360787 ) ( ON ?auto_360789 ?auto_360788 ) ( not ( = ?auto_360787 ?auto_360788 ) ) ( not ( = ?auto_360787 ?auto_360789 ) ) ( not ( = ?auto_360787 ?auto_360790 ) ) ( not ( = ?auto_360787 ?auto_360791 ) ) ( not ( = ?auto_360787 ?auto_360792 ) ) ( not ( = ?auto_360788 ?auto_360789 ) ) ( not ( = ?auto_360788 ?auto_360790 ) ) ( not ( = ?auto_360788 ?auto_360791 ) ) ( not ( = ?auto_360788 ?auto_360792 ) ) ( not ( = ?auto_360789 ?auto_360790 ) ) ( not ( = ?auto_360789 ?auto_360791 ) ) ( not ( = ?auto_360789 ?auto_360792 ) ) ( not ( = ?auto_360790 ?auto_360791 ) ) ( not ( = ?auto_360790 ?auto_360792 ) ) ( not ( = ?auto_360791 ?auto_360792 ) ) ( CLEAR ?auto_360789 ) ( ON ?auto_360790 ?auto_360791 ) ( CLEAR ?auto_360790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_360787 ?auto_360788 ?auto_360789 ?auto_360790 )
      ( MAKE-5PILE ?auto_360787 ?auto_360788 ?auto_360789 ?auto_360790 ?auto_360791 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_360809 - BLOCK
      ?auto_360810 - BLOCK
      ?auto_360811 - BLOCK
      ?auto_360812 - BLOCK
      ?auto_360813 - BLOCK
    )
    :vars
    (
      ?auto_360814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_360813 ?auto_360814 ) ( ON-TABLE ?auto_360809 ) ( ON ?auto_360810 ?auto_360809 ) ( not ( = ?auto_360809 ?auto_360810 ) ) ( not ( = ?auto_360809 ?auto_360811 ) ) ( not ( = ?auto_360809 ?auto_360812 ) ) ( not ( = ?auto_360809 ?auto_360813 ) ) ( not ( = ?auto_360809 ?auto_360814 ) ) ( not ( = ?auto_360810 ?auto_360811 ) ) ( not ( = ?auto_360810 ?auto_360812 ) ) ( not ( = ?auto_360810 ?auto_360813 ) ) ( not ( = ?auto_360810 ?auto_360814 ) ) ( not ( = ?auto_360811 ?auto_360812 ) ) ( not ( = ?auto_360811 ?auto_360813 ) ) ( not ( = ?auto_360811 ?auto_360814 ) ) ( not ( = ?auto_360812 ?auto_360813 ) ) ( not ( = ?auto_360812 ?auto_360814 ) ) ( not ( = ?auto_360813 ?auto_360814 ) ) ( ON ?auto_360812 ?auto_360813 ) ( CLEAR ?auto_360810 ) ( ON ?auto_360811 ?auto_360812 ) ( CLEAR ?auto_360811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_360809 ?auto_360810 ?auto_360811 )
      ( MAKE-5PILE ?auto_360809 ?auto_360810 ?auto_360811 ?auto_360812 ?auto_360813 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_360831 - BLOCK
      ?auto_360832 - BLOCK
      ?auto_360833 - BLOCK
      ?auto_360834 - BLOCK
      ?auto_360835 - BLOCK
    )
    :vars
    (
      ?auto_360836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_360835 ?auto_360836 ) ( ON-TABLE ?auto_360831 ) ( not ( = ?auto_360831 ?auto_360832 ) ) ( not ( = ?auto_360831 ?auto_360833 ) ) ( not ( = ?auto_360831 ?auto_360834 ) ) ( not ( = ?auto_360831 ?auto_360835 ) ) ( not ( = ?auto_360831 ?auto_360836 ) ) ( not ( = ?auto_360832 ?auto_360833 ) ) ( not ( = ?auto_360832 ?auto_360834 ) ) ( not ( = ?auto_360832 ?auto_360835 ) ) ( not ( = ?auto_360832 ?auto_360836 ) ) ( not ( = ?auto_360833 ?auto_360834 ) ) ( not ( = ?auto_360833 ?auto_360835 ) ) ( not ( = ?auto_360833 ?auto_360836 ) ) ( not ( = ?auto_360834 ?auto_360835 ) ) ( not ( = ?auto_360834 ?auto_360836 ) ) ( not ( = ?auto_360835 ?auto_360836 ) ) ( ON ?auto_360834 ?auto_360835 ) ( ON ?auto_360833 ?auto_360834 ) ( CLEAR ?auto_360831 ) ( ON ?auto_360832 ?auto_360833 ) ( CLEAR ?auto_360832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_360831 ?auto_360832 )
      ( MAKE-5PILE ?auto_360831 ?auto_360832 ?auto_360833 ?auto_360834 ?auto_360835 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_360853 - BLOCK
      ?auto_360854 - BLOCK
      ?auto_360855 - BLOCK
      ?auto_360856 - BLOCK
      ?auto_360857 - BLOCK
    )
    :vars
    (
      ?auto_360858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_360857 ?auto_360858 ) ( not ( = ?auto_360853 ?auto_360854 ) ) ( not ( = ?auto_360853 ?auto_360855 ) ) ( not ( = ?auto_360853 ?auto_360856 ) ) ( not ( = ?auto_360853 ?auto_360857 ) ) ( not ( = ?auto_360853 ?auto_360858 ) ) ( not ( = ?auto_360854 ?auto_360855 ) ) ( not ( = ?auto_360854 ?auto_360856 ) ) ( not ( = ?auto_360854 ?auto_360857 ) ) ( not ( = ?auto_360854 ?auto_360858 ) ) ( not ( = ?auto_360855 ?auto_360856 ) ) ( not ( = ?auto_360855 ?auto_360857 ) ) ( not ( = ?auto_360855 ?auto_360858 ) ) ( not ( = ?auto_360856 ?auto_360857 ) ) ( not ( = ?auto_360856 ?auto_360858 ) ) ( not ( = ?auto_360857 ?auto_360858 ) ) ( ON ?auto_360856 ?auto_360857 ) ( ON ?auto_360855 ?auto_360856 ) ( ON ?auto_360854 ?auto_360855 ) ( ON ?auto_360853 ?auto_360854 ) ( CLEAR ?auto_360853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_360853 )
      ( MAKE-5PILE ?auto_360853 ?auto_360854 ?auto_360855 ?auto_360856 ?auto_360857 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_360876 - BLOCK
      ?auto_360877 - BLOCK
      ?auto_360878 - BLOCK
      ?auto_360879 - BLOCK
      ?auto_360880 - BLOCK
      ?auto_360881 - BLOCK
    )
    :vars
    (
      ?auto_360882 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_360880 ) ( ON ?auto_360881 ?auto_360882 ) ( CLEAR ?auto_360881 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_360876 ) ( ON ?auto_360877 ?auto_360876 ) ( ON ?auto_360878 ?auto_360877 ) ( ON ?auto_360879 ?auto_360878 ) ( ON ?auto_360880 ?auto_360879 ) ( not ( = ?auto_360876 ?auto_360877 ) ) ( not ( = ?auto_360876 ?auto_360878 ) ) ( not ( = ?auto_360876 ?auto_360879 ) ) ( not ( = ?auto_360876 ?auto_360880 ) ) ( not ( = ?auto_360876 ?auto_360881 ) ) ( not ( = ?auto_360876 ?auto_360882 ) ) ( not ( = ?auto_360877 ?auto_360878 ) ) ( not ( = ?auto_360877 ?auto_360879 ) ) ( not ( = ?auto_360877 ?auto_360880 ) ) ( not ( = ?auto_360877 ?auto_360881 ) ) ( not ( = ?auto_360877 ?auto_360882 ) ) ( not ( = ?auto_360878 ?auto_360879 ) ) ( not ( = ?auto_360878 ?auto_360880 ) ) ( not ( = ?auto_360878 ?auto_360881 ) ) ( not ( = ?auto_360878 ?auto_360882 ) ) ( not ( = ?auto_360879 ?auto_360880 ) ) ( not ( = ?auto_360879 ?auto_360881 ) ) ( not ( = ?auto_360879 ?auto_360882 ) ) ( not ( = ?auto_360880 ?auto_360881 ) ) ( not ( = ?auto_360880 ?auto_360882 ) ) ( not ( = ?auto_360881 ?auto_360882 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_360881 ?auto_360882 )
      ( !STACK ?auto_360881 ?auto_360880 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_360902 - BLOCK
      ?auto_360903 - BLOCK
      ?auto_360904 - BLOCK
      ?auto_360905 - BLOCK
      ?auto_360906 - BLOCK
      ?auto_360907 - BLOCK
    )
    :vars
    (
      ?auto_360908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_360907 ?auto_360908 ) ( ON-TABLE ?auto_360902 ) ( ON ?auto_360903 ?auto_360902 ) ( ON ?auto_360904 ?auto_360903 ) ( ON ?auto_360905 ?auto_360904 ) ( not ( = ?auto_360902 ?auto_360903 ) ) ( not ( = ?auto_360902 ?auto_360904 ) ) ( not ( = ?auto_360902 ?auto_360905 ) ) ( not ( = ?auto_360902 ?auto_360906 ) ) ( not ( = ?auto_360902 ?auto_360907 ) ) ( not ( = ?auto_360902 ?auto_360908 ) ) ( not ( = ?auto_360903 ?auto_360904 ) ) ( not ( = ?auto_360903 ?auto_360905 ) ) ( not ( = ?auto_360903 ?auto_360906 ) ) ( not ( = ?auto_360903 ?auto_360907 ) ) ( not ( = ?auto_360903 ?auto_360908 ) ) ( not ( = ?auto_360904 ?auto_360905 ) ) ( not ( = ?auto_360904 ?auto_360906 ) ) ( not ( = ?auto_360904 ?auto_360907 ) ) ( not ( = ?auto_360904 ?auto_360908 ) ) ( not ( = ?auto_360905 ?auto_360906 ) ) ( not ( = ?auto_360905 ?auto_360907 ) ) ( not ( = ?auto_360905 ?auto_360908 ) ) ( not ( = ?auto_360906 ?auto_360907 ) ) ( not ( = ?auto_360906 ?auto_360908 ) ) ( not ( = ?auto_360907 ?auto_360908 ) ) ( CLEAR ?auto_360905 ) ( ON ?auto_360906 ?auto_360907 ) ( CLEAR ?auto_360906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_360902 ?auto_360903 ?auto_360904 ?auto_360905 ?auto_360906 )
      ( MAKE-6PILE ?auto_360902 ?auto_360903 ?auto_360904 ?auto_360905 ?auto_360906 ?auto_360907 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_360928 - BLOCK
      ?auto_360929 - BLOCK
      ?auto_360930 - BLOCK
      ?auto_360931 - BLOCK
      ?auto_360932 - BLOCK
      ?auto_360933 - BLOCK
    )
    :vars
    (
      ?auto_360934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_360933 ?auto_360934 ) ( ON-TABLE ?auto_360928 ) ( ON ?auto_360929 ?auto_360928 ) ( ON ?auto_360930 ?auto_360929 ) ( not ( = ?auto_360928 ?auto_360929 ) ) ( not ( = ?auto_360928 ?auto_360930 ) ) ( not ( = ?auto_360928 ?auto_360931 ) ) ( not ( = ?auto_360928 ?auto_360932 ) ) ( not ( = ?auto_360928 ?auto_360933 ) ) ( not ( = ?auto_360928 ?auto_360934 ) ) ( not ( = ?auto_360929 ?auto_360930 ) ) ( not ( = ?auto_360929 ?auto_360931 ) ) ( not ( = ?auto_360929 ?auto_360932 ) ) ( not ( = ?auto_360929 ?auto_360933 ) ) ( not ( = ?auto_360929 ?auto_360934 ) ) ( not ( = ?auto_360930 ?auto_360931 ) ) ( not ( = ?auto_360930 ?auto_360932 ) ) ( not ( = ?auto_360930 ?auto_360933 ) ) ( not ( = ?auto_360930 ?auto_360934 ) ) ( not ( = ?auto_360931 ?auto_360932 ) ) ( not ( = ?auto_360931 ?auto_360933 ) ) ( not ( = ?auto_360931 ?auto_360934 ) ) ( not ( = ?auto_360932 ?auto_360933 ) ) ( not ( = ?auto_360932 ?auto_360934 ) ) ( not ( = ?auto_360933 ?auto_360934 ) ) ( ON ?auto_360932 ?auto_360933 ) ( CLEAR ?auto_360930 ) ( ON ?auto_360931 ?auto_360932 ) ( CLEAR ?auto_360931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_360928 ?auto_360929 ?auto_360930 ?auto_360931 )
      ( MAKE-6PILE ?auto_360928 ?auto_360929 ?auto_360930 ?auto_360931 ?auto_360932 ?auto_360933 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_360954 - BLOCK
      ?auto_360955 - BLOCK
      ?auto_360956 - BLOCK
      ?auto_360957 - BLOCK
      ?auto_360958 - BLOCK
      ?auto_360959 - BLOCK
    )
    :vars
    (
      ?auto_360960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_360959 ?auto_360960 ) ( ON-TABLE ?auto_360954 ) ( ON ?auto_360955 ?auto_360954 ) ( not ( = ?auto_360954 ?auto_360955 ) ) ( not ( = ?auto_360954 ?auto_360956 ) ) ( not ( = ?auto_360954 ?auto_360957 ) ) ( not ( = ?auto_360954 ?auto_360958 ) ) ( not ( = ?auto_360954 ?auto_360959 ) ) ( not ( = ?auto_360954 ?auto_360960 ) ) ( not ( = ?auto_360955 ?auto_360956 ) ) ( not ( = ?auto_360955 ?auto_360957 ) ) ( not ( = ?auto_360955 ?auto_360958 ) ) ( not ( = ?auto_360955 ?auto_360959 ) ) ( not ( = ?auto_360955 ?auto_360960 ) ) ( not ( = ?auto_360956 ?auto_360957 ) ) ( not ( = ?auto_360956 ?auto_360958 ) ) ( not ( = ?auto_360956 ?auto_360959 ) ) ( not ( = ?auto_360956 ?auto_360960 ) ) ( not ( = ?auto_360957 ?auto_360958 ) ) ( not ( = ?auto_360957 ?auto_360959 ) ) ( not ( = ?auto_360957 ?auto_360960 ) ) ( not ( = ?auto_360958 ?auto_360959 ) ) ( not ( = ?auto_360958 ?auto_360960 ) ) ( not ( = ?auto_360959 ?auto_360960 ) ) ( ON ?auto_360958 ?auto_360959 ) ( ON ?auto_360957 ?auto_360958 ) ( CLEAR ?auto_360955 ) ( ON ?auto_360956 ?auto_360957 ) ( CLEAR ?auto_360956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_360954 ?auto_360955 ?auto_360956 )
      ( MAKE-6PILE ?auto_360954 ?auto_360955 ?auto_360956 ?auto_360957 ?auto_360958 ?auto_360959 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_360980 - BLOCK
      ?auto_360981 - BLOCK
      ?auto_360982 - BLOCK
      ?auto_360983 - BLOCK
      ?auto_360984 - BLOCK
      ?auto_360985 - BLOCK
    )
    :vars
    (
      ?auto_360986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_360985 ?auto_360986 ) ( ON-TABLE ?auto_360980 ) ( not ( = ?auto_360980 ?auto_360981 ) ) ( not ( = ?auto_360980 ?auto_360982 ) ) ( not ( = ?auto_360980 ?auto_360983 ) ) ( not ( = ?auto_360980 ?auto_360984 ) ) ( not ( = ?auto_360980 ?auto_360985 ) ) ( not ( = ?auto_360980 ?auto_360986 ) ) ( not ( = ?auto_360981 ?auto_360982 ) ) ( not ( = ?auto_360981 ?auto_360983 ) ) ( not ( = ?auto_360981 ?auto_360984 ) ) ( not ( = ?auto_360981 ?auto_360985 ) ) ( not ( = ?auto_360981 ?auto_360986 ) ) ( not ( = ?auto_360982 ?auto_360983 ) ) ( not ( = ?auto_360982 ?auto_360984 ) ) ( not ( = ?auto_360982 ?auto_360985 ) ) ( not ( = ?auto_360982 ?auto_360986 ) ) ( not ( = ?auto_360983 ?auto_360984 ) ) ( not ( = ?auto_360983 ?auto_360985 ) ) ( not ( = ?auto_360983 ?auto_360986 ) ) ( not ( = ?auto_360984 ?auto_360985 ) ) ( not ( = ?auto_360984 ?auto_360986 ) ) ( not ( = ?auto_360985 ?auto_360986 ) ) ( ON ?auto_360984 ?auto_360985 ) ( ON ?auto_360983 ?auto_360984 ) ( ON ?auto_360982 ?auto_360983 ) ( CLEAR ?auto_360980 ) ( ON ?auto_360981 ?auto_360982 ) ( CLEAR ?auto_360981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_360980 ?auto_360981 )
      ( MAKE-6PILE ?auto_360980 ?auto_360981 ?auto_360982 ?auto_360983 ?auto_360984 ?auto_360985 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_361006 - BLOCK
      ?auto_361007 - BLOCK
      ?auto_361008 - BLOCK
      ?auto_361009 - BLOCK
      ?auto_361010 - BLOCK
      ?auto_361011 - BLOCK
    )
    :vars
    (
      ?auto_361012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_361011 ?auto_361012 ) ( not ( = ?auto_361006 ?auto_361007 ) ) ( not ( = ?auto_361006 ?auto_361008 ) ) ( not ( = ?auto_361006 ?auto_361009 ) ) ( not ( = ?auto_361006 ?auto_361010 ) ) ( not ( = ?auto_361006 ?auto_361011 ) ) ( not ( = ?auto_361006 ?auto_361012 ) ) ( not ( = ?auto_361007 ?auto_361008 ) ) ( not ( = ?auto_361007 ?auto_361009 ) ) ( not ( = ?auto_361007 ?auto_361010 ) ) ( not ( = ?auto_361007 ?auto_361011 ) ) ( not ( = ?auto_361007 ?auto_361012 ) ) ( not ( = ?auto_361008 ?auto_361009 ) ) ( not ( = ?auto_361008 ?auto_361010 ) ) ( not ( = ?auto_361008 ?auto_361011 ) ) ( not ( = ?auto_361008 ?auto_361012 ) ) ( not ( = ?auto_361009 ?auto_361010 ) ) ( not ( = ?auto_361009 ?auto_361011 ) ) ( not ( = ?auto_361009 ?auto_361012 ) ) ( not ( = ?auto_361010 ?auto_361011 ) ) ( not ( = ?auto_361010 ?auto_361012 ) ) ( not ( = ?auto_361011 ?auto_361012 ) ) ( ON ?auto_361010 ?auto_361011 ) ( ON ?auto_361009 ?auto_361010 ) ( ON ?auto_361008 ?auto_361009 ) ( ON ?auto_361007 ?auto_361008 ) ( ON ?auto_361006 ?auto_361007 ) ( CLEAR ?auto_361006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_361006 )
      ( MAKE-6PILE ?auto_361006 ?auto_361007 ?auto_361008 ?auto_361009 ?auto_361010 ?auto_361011 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_361033 - BLOCK
      ?auto_361034 - BLOCK
      ?auto_361035 - BLOCK
      ?auto_361036 - BLOCK
      ?auto_361037 - BLOCK
      ?auto_361038 - BLOCK
      ?auto_361039 - BLOCK
    )
    :vars
    (
      ?auto_361040 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_361038 ) ( ON ?auto_361039 ?auto_361040 ) ( CLEAR ?auto_361039 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_361033 ) ( ON ?auto_361034 ?auto_361033 ) ( ON ?auto_361035 ?auto_361034 ) ( ON ?auto_361036 ?auto_361035 ) ( ON ?auto_361037 ?auto_361036 ) ( ON ?auto_361038 ?auto_361037 ) ( not ( = ?auto_361033 ?auto_361034 ) ) ( not ( = ?auto_361033 ?auto_361035 ) ) ( not ( = ?auto_361033 ?auto_361036 ) ) ( not ( = ?auto_361033 ?auto_361037 ) ) ( not ( = ?auto_361033 ?auto_361038 ) ) ( not ( = ?auto_361033 ?auto_361039 ) ) ( not ( = ?auto_361033 ?auto_361040 ) ) ( not ( = ?auto_361034 ?auto_361035 ) ) ( not ( = ?auto_361034 ?auto_361036 ) ) ( not ( = ?auto_361034 ?auto_361037 ) ) ( not ( = ?auto_361034 ?auto_361038 ) ) ( not ( = ?auto_361034 ?auto_361039 ) ) ( not ( = ?auto_361034 ?auto_361040 ) ) ( not ( = ?auto_361035 ?auto_361036 ) ) ( not ( = ?auto_361035 ?auto_361037 ) ) ( not ( = ?auto_361035 ?auto_361038 ) ) ( not ( = ?auto_361035 ?auto_361039 ) ) ( not ( = ?auto_361035 ?auto_361040 ) ) ( not ( = ?auto_361036 ?auto_361037 ) ) ( not ( = ?auto_361036 ?auto_361038 ) ) ( not ( = ?auto_361036 ?auto_361039 ) ) ( not ( = ?auto_361036 ?auto_361040 ) ) ( not ( = ?auto_361037 ?auto_361038 ) ) ( not ( = ?auto_361037 ?auto_361039 ) ) ( not ( = ?auto_361037 ?auto_361040 ) ) ( not ( = ?auto_361038 ?auto_361039 ) ) ( not ( = ?auto_361038 ?auto_361040 ) ) ( not ( = ?auto_361039 ?auto_361040 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_361039 ?auto_361040 )
      ( !STACK ?auto_361039 ?auto_361038 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_361063 - BLOCK
      ?auto_361064 - BLOCK
      ?auto_361065 - BLOCK
      ?auto_361066 - BLOCK
      ?auto_361067 - BLOCK
      ?auto_361068 - BLOCK
      ?auto_361069 - BLOCK
    )
    :vars
    (
      ?auto_361070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_361069 ?auto_361070 ) ( ON-TABLE ?auto_361063 ) ( ON ?auto_361064 ?auto_361063 ) ( ON ?auto_361065 ?auto_361064 ) ( ON ?auto_361066 ?auto_361065 ) ( ON ?auto_361067 ?auto_361066 ) ( not ( = ?auto_361063 ?auto_361064 ) ) ( not ( = ?auto_361063 ?auto_361065 ) ) ( not ( = ?auto_361063 ?auto_361066 ) ) ( not ( = ?auto_361063 ?auto_361067 ) ) ( not ( = ?auto_361063 ?auto_361068 ) ) ( not ( = ?auto_361063 ?auto_361069 ) ) ( not ( = ?auto_361063 ?auto_361070 ) ) ( not ( = ?auto_361064 ?auto_361065 ) ) ( not ( = ?auto_361064 ?auto_361066 ) ) ( not ( = ?auto_361064 ?auto_361067 ) ) ( not ( = ?auto_361064 ?auto_361068 ) ) ( not ( = ?auto_361064 ?auto_361069 ) ) ( not ( = ?auto_361064 ?auto_361070 ) ) ( not ( = ?auto_361065 ?auto_361066 ) ) ( not ( = ?auto_361065 ?auto_361067 ) ) ( not ( = ?auto_361065 ?auto_361068 ) ) ( not ( = ?auto_361065 ?auto_361069 ) ) ( not ( = ?auto_361065 ?auto_361070 ) ) ( not ( = ?auto_361066 ?auto_361067 ) ) ( not ( = ?auto_361066 ?auto_361068 ) ) ( not ( = ?auto_361066 ?auto_361069 ) ) ( not ( = ?auto_361066 ?auto_361070 ) ) ( not ( = ?auto_361067 ?auto_361068 ) ) ( not ( = ?auto_361067 ?auto_361069 ) ) ( not ( = ?auto_361067 ?auto_361070 ) ) ( not ( = ?auto_361068 ?auto_361069 ) ) ( not ( = ?auto_361068 ?auto_361070 ) ) ( not ( = ?auto_361069 ?auto_361070 ) ) ( CLEAR ?auto_361067 ) ( ON ?auto_361068 ?auto_361069 ) ( CLEAR ?auto_361068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_361063 ?auto_361064 ?auto_361065 ?auto_361066 ?auto_361067 ?auto_361068 )
      ( MAKE-7PILE ?auto_361063 ?auto_361064 ?auto_361065 ?auto_361066 ?auto_361067 ?auto_361068 ?auto_361069 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_361093 - BLOCK
      ?auto_361094 - BLOCK
      ?auto_361095 - BLOCK
      ?auto_361096 - BLOCK
      ?auto_361097 - BLOCK
      ?auto_361098 - BLOCK
      ?auto_361099 - BLOCK
    )
    :vars
    (
      ?auto_361100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_361099 ?auto_361100 ) ( ON-TABLE ?auto_361093 ) ( ON ?auto_361094 ?auto_361093 ) ( ON ?auto_361095 ?auto_361094 ) ( ON ?auto_361096 ?auto_361095 ) ( not ( = ?auto_361093 ?auto_361094 ) ) ( not ( = ?auto_361093 ?auto_361095 ) ) ( not ( = ?auto_361093 ?auto_361096 ) ) ( not ( = ?auto_361093 ?auto_361097 ) ) ( not ( = ?auto_361093 ?auto_361098 ) ) ( not ( = ?auto_361093 ?auto_361099 ) ) ( not ( = ?auto_361093 ?auto_361100 ) ) ( not ( = ?auto_361094 ?auto_361095 ) ) ( not ( = ?auto_361094 ?auto_361096 ) ) ( not ( = ?auto_361094 ?auto_361097 ) ) ( not ( = ?auto_361094 ?auto_361098 ) ) ( not ( = ?auto_361094 ?auto_361099 ) ) ( not ( = ?auto_361094 ?auto_361100 ) ) ( not ( = ?auto_361095 ?auto_361096 ) ) ( not ( = ?auto_361095 ?auto_361097 ) ) ( not ( = ?auto_361095 ?auto_361098 ) ) ( not ( = ?auto_361095 ?auto_361099 ) ) ( not ( = ?auto_361095 ?auto_361100 ) ) ( not ( = ?auto_361096 ?auto_361097 ) ) ( not ( = ?auto_361096 ?auto_361098 ) ) ( not ( = ?auto_361096 ?auto_361099 ) ) ( not ( = ?auto_361096 ?auto_361100 ) ) ( not ( = ?auto_361097 ?auto_361098 ) ) ( not ( = ?auto_361097 ?auto_361099 ) ) ( not ( = ?auto_361097 ?auto_361100 ) ) ( not ( = ?auto_361098 ?auto_361099 ) ) ( not ( = ?auto_361098 ?auto_361100 ) ) ( not ( = ?auto_361099 ?auto_361100 ) ) ( ON ?auto_361098 ?auto_361099 ) ( CLEAR ?auto_361096 ) ( ON ?auto_361097 ?auto_361098 ) ( CLEAR ?auto_361097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_361093 ?auto_361094 ?auto_361095 ?auto_361096 ?auto_361097 )
      ( MAKE-7PILE ?auto_361093 ?auto_361094 ?auto_361095 ?auto_361096 ?auto_361097 ?auto_361098 ?auto_361099 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_361123 - BLOCK
      ?auto_361124 - BLOCK
      ?auto_361125 - BLOCK
      ?auto_361126 - BLOCK
      ?auto_361127 - BLOCK
      ?auto_361128 - BLOCK
      ?auto_361129 - BLOCK
    )
    :vars
    (
      ?auto_361130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_361129 ?auto_361130 ) ( ON-TABLE ?auto_361123 ) ( ON ?auto_361124 ?auto_361123 ) ( ON ?auto_361125 ?auto_361124 ) ( not ( = ?auto_361123 ?auto_361124 ) ) ( not ( = ?auto_361123 ?auto_361125 ) ) ( not ( = ?auto_361123 ?auto_361126 ) ) ( not ( = ?auto_361123 ?auto_361127 ) ) ( not ( = ?auto_361123 ?auto_361128 ) ) ( not ( = ?auto_361123 ?auto_361129 ) ) ( not ( = ?auto_361123 ?auto_361130 ) ) ( not ( = ?auto_361124 ?auto_361125 ) ) ( not ( = ?auto_361124 ?auto_361126 ) ) ( not ( = ?auto_361124 ?auto_361127 ) ) ( not ( = ?auto_361124 ?auto_361128 ) ) ( not ( = ?auto_361124 ?auto_361129 ) ) ( not ( = ?auto_361124 ?auto_361130 ) ) ( not ( = ?auto_361125 ?auto_361126 ) ) ( not ( = ?auto_361125 ?auto_361127 ) ) ( not ( = ?auto_361125 ?auto_361128 ) ) ( not ( = ?auto_361125 ?auto_361129 ) ) ( not ( = ?auto_361125 ?auto_361130 ) ) ( not ( = ?auto_361126 ?auto_361127 ) ) ( not ( = ?auto_361126 ?auto_361128 ) ) ( not ( = ?auto_361126 ?auto_361129 ) ) ( not ( = ?auto_361126 ?auto_361130 ) ) ( not ( = ?auto_361127 ?auto_361128 ) ) ( not ( = ?auto_361127 ?auto_361129 ) ) ( not ( = ?auto_361127 ?auto_361130 ) ) ( not ( = ?auto_361128 ?auto_361129 ) ) ( not ( = ?auto_361128 ?auto_361130 ) ) ( not ( = ?auto_361129 ?auto_361130 ) ) ( ON ?auto_361128 ?auto_361129 ) ( ON ?auto_361127 ?auto_361128 ) ( CLEAR ?auto_361125 ) ( ON ?auto_361126 ?auto_361127 ) ( CLEAR ?auto_361126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_361123 ?auto_361124 ?auto_361125 ?auto_361126 )
      ( MAKE-7PILE ?auto_361123 ?auto_361124 ?auto_361125 ?auto_361126 ?auto_361127 ?auto_361128 ?auto_361129 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_361153 - BLOCK
      ?auto_361154 - BLOCK
      ?auto_361155 - BLOCK
      ?auto_361156 - BLOCK
      ?auto_361157 - BLOCK
      ?auto_361158 - BLOCK
      ?auto_361159 - BLOCK
    )
    :vars
    (
      ?auto_361160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_361159 ?auto_361160 ) ( ON-TABLE ?auto_361153 ) ( ON ?auto_361154 ?auto_361153 ) ( not ( = ?auto_361153 ?auto_361154 ) ) ( not ( = ?auto_361153 ?auto_361155 ) ) ( not ( = ?auto_361153 ?auto_361156 ) ) ( not ( = ?auto_361153 ?auto_361157 ) ) ( not ( = ?auto_361153 ?auto_361158 ) ) ( not ( = ?auto_361153 ?auto_361159 ) ) ( not ( = ?auto_361153 ?auto_361160 ) ) ( not ( = ?auto_361154 ?auto_361155 ) ) ( not ( = ?auto_361154 ?auto_361156 ) ) ( not ( = ?auto_361154 ?auto_361157 ) ) ( not ( = ?auto_361154 ?auto_361158 ) ) ( not ( = ?auto_361154 ?auto_361159 ) ) ( not ( = ?auto_361154 ?auto_361160 ) ) ( not ( = ?auto_361155 ?auto_361156 ) ) ( not ( = ?auto_361155 ?auto_361157 ) ) ( not ( = ?auto_361155 ?auto_361158 ) ) ( not ( = ?auto_361155 ?auto_361159 ) ) ( not ( = ?auto_361155 ?auto_361160 ) ) ( not ( = ?auto_361156 ?auto_361157 ) ) ( not ( = ?auto_361156 ?auto_361158 ) ) ( not ( = ?auto_361156 ?auto_361159 ) ) ( not ( = ?auto_361156 ?auto_361160 ) ) ( not ( = ?auto_361157 ?auto_361158 ) ) ( not ( = ?auto_361157 ?auto_361159 ) ) ( not ( = ?auto_361157 ?auto_361160 ) ) ( not ( = ?auto_361158 ?auto_361159 ) ) ( not ( = ?auto_361158 ?auto_361160 ) ) ( not ( = ?auto_361159 ?auto_361160 ) ) ( ON ?auto_361158 ?auto_361159 ) ( ON ?auto_361157 ?auto_361158 ) ( ON ?auto_361156 ?auto_361157 ) ( CLEAR ?auto_361154 ) ( ON ?auto_361155 ?auto_361156 ) ( CLEAR ?auto_361155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_361153 ?auto_361154 ?auto_361155 )
      ( MAKE-7PILE ?auto_361153 ?auto_361154 ?auto_361155 ?auto_361156 ?auto_361157 ?auto_361158 ?auto_361159 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_361183 - BLOCK
      ?auto_361184 - BLOCK
      ?auto_361185 - BLOCK
      ?auto_361186 - BLOCK
      ?auto_361187 - BLOCK
      ?auto_361188 - BLOCK
      ?auto_361189 - BLOCK
    )
    :vars
    (
      ?auto_361190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_361189 ?auto_361190 ) ( ON-TABLE ?auto_361183 ) ( not ( = ?auto_361183 ?auto_361184 ) ) ( not ( = ?auto_361183 ?auto_361185 ) ) ( not ( = ?auto_361183 ?auto_361186 ) ) ( not ( = ?auto_361183 ?auto_361187 ) ) ( not ( = ?auto_361183 ?auto_361188 ) ) ( not ( = ?auto_361183 ?auto_361189 ) ) ( not ( = ?auto_361183 ?auto_361190 ) ) ( not ( = ?auto_361184 ?auto_361185 ) ) ( not ( = ?auto_361184 ?auto_361186 ) ) ( not ( = ?auto_361184 ?auto_361187 ) ) ( not ( = ?auto_361184 ?auto_361188 ) ) ( not ( = ?auto_361184 ?auto_361189 ) ) ( not ( = ?auto_361184 ?auto_361190 ) ) ( not ( = ?auto_361185 ?auto_361186 ) ) ( not ( = ?auto_361185 ?auto_361187 ) ) ( not ( = ?auto_361185 ?auto_361188 ) ) ( not ( = ?auto_361185 ?auto_361189 ) ) ( not ( = ?auto_361185 ?auto_361190 ) ) ( not ( = ?auto_361186 ?auto_361187 ) ) ( not ( = ?auto_361186 ?auto_361188 ) ) ( not ( = ?auto_361186 ?auto_361189 ) ) ( not ( = ?auto_361186 ?auto_361190 ) ) ( not ( = ?auto_361187 ?auto_361188 ) ) ( not ( = ?auto_361187 ?auto_361189 ) ) ( not ( = ?auto_361187 ?auto_361190 ) ) ( not ( = ?auto_361188 ?auto_361189 ) ) ( not ( = ?auto_361188 ?auto_361190 ) ) ( not ( = ?auto_361189 ?auto_361190 ) ) ( ON ?auto_361188 ?auto_361189 ) ( ON ?auto_361187 ?auto_361188 ) ( ON ?auto_361186 ?auto_361187 ) ( ON ?auto_361185 ?auto_361186 ) ( CLEAR ?auto_361183 ) ( ON ?auto_361184 ?auto_361185 ) ( CLEAR ?auto_361184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_361183 ?auto_361184 )
      ( MAKE-7PILE ?auto_361183 ?auto_361184 ?auto_361185 ?auto_361186 ?auto_361187 ?auto_361188 ?auto_361189 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_361213 - BLOCK
      ?auto_361214 - BLOCK
      ?auto_361215 - BLOCK
      ?auto_361216 - BLOCK
      ?auto_361217 - BLOCK
      ?auto_361218 - BLOCK
      ?auto_361219 - BLOCK
    )
    :vars
    (
      ?auto_361220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_361219 ?auto_361220 ) ( not ( = ?auto_361213 ?auto_361214 ) ) ( not ( = ?auto_361213 ?auto_361215 ) ) ( not ( = ?auto_361213 ?auto_361216 ) ) ( not ( = ?auto_361213 ?auto_361217 ) ) ( not ( = ?auto_361213 ?auto_361218 ) ) ( not ( = ?auto_361213 ?auto_361219 ) ) ( not ( = ?auto_361213 ?auto_361220 ) ) ( not ( = ?auto_361214 ?auto_361215 ) ) ( not ( = ?auto_361214 ?auto_361216 ) ) ( not ( = ?auto_361214 ?auto_361217 ) ) ( not ( = ?auto_361214 ?auto_361218 ) ) ( not ( = ?auto_361214 ?auto_361219 ) ) ( not ( = ?auto_361214 ?auto_361220 ) ) ( not ( = ?auto_361215 ?auto_361216 ) ) ( not ( = ?auto_361215 ?auto_361217 ) ) ( not ( = ?auto_361215 ?auto_361218 ) ) ( not ( = ?auto_361215 ?auto_361219 ) ) ( not ( = ?auto_361215 ?auto_361220 ) ) ( not ( = ?auto_361216 ?auto_361217 ) ) ( not ( = ?auto_361216 ?auto_361218 ) ) ( not ( = ?auto_361216 ?auto_361219 ) ) ( not ( = ?auto_361216 ?auto_361220 ) ) ( not ( = ?auto_361217 ?auto_361218 ) ) ( not ( = ?auto_361217 ?auto_361219 ) ) ( not ( = ?auto_361217 ?auto_361220 ) ) ( not ( = ?auto_361218 ?auto_361219 ) ) ( not ( = ?auto_361218 ?auto_361220 ) ) ( not ( = ?auto_361219 ?auto_361220 ) ) ( ON ?auto_361218 ?auto_361219 ) ( ON ?auto_361217 ?auto_361218 ) ( ON ?auto_361216 ?auto_361217 ) ( ON ?auto_361215 ?auto_361216 ) ( ON ?auto_361214 ?auto_361215 ) ( ON ?auto_361213 ?auto_361214 ) ( CLEAR ?auto_361213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_361213 )
      ( MAKE-7PILE ?auto_361213 ?auto_361214 ?auto_361215 ?auto_361216 ?auto_361217 ?auto_361218 ?auto_361219 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_361244 - BLOCK
      ?auto_361245 - BLOCK
      ?auto_361246 - BLOCK
      ?auto_361247 - BLOCK
      ?auto_361248 - BLOCK
      ?auto_361249 - BLOCK
      ?auto_361250 - BLOCK
      ?auto_361251 - BLOCK
    )
    :vars
    (
      ?auto_361252 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_361250 ) ( ON ?auto_361251 ?auto_361252 ) ( CLEAR ?auto_361251 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_361244 ) ( ON ?auto_361245 ?auto_361244 ) ( ON ?auto_361246 ?auto_361245 ) ( ON ?auto_361247 ?auto_361246 ) ( ON ?auto_361248 ?auto_361247 ) ( ON ?auto_361249 ?auto_361248 ) ( ON ?auto_361250 ?auto_361249 ) ( not ( = ?auto_361244 ?auto_361245 ) ) ( not ( = ?auto_361244 ?auto_361246 ) ) ( not ( = ?auto_361244 ?auto_361247 ) ) ( not ( = ?auto_361244 ?auto_361248 ) ) ( not ( = ?auto_361244 ?auto_361249 ) ) ( not ( = ?auto_361244 ?auto_361250 ) ) ( not ( = ?auto_361244 ?auto_361251 ) ) ( not ( = ?auto_361244 ?auto_361252 ) ) ( not ( = ?auto_361245 ?auto_361246 ) ) ( not ( = ?auto_361245 ?auto_361247 ) ) ( not ( = ?auto_361245 ?auto_361248 ) ) ( not ( = ?auto_361245 ?auto_361249 ) ) ( not ( = ?auto_361245 ?auto_361250 ) ) ( not ( = ?auto_361245 ?auto_361251 ) ) ( not ( = ?auto_361245 ?auto_361252 ) ) ( not ( = ?auto_361246 ?auto_361247 ) ) ( not ( = ?auto_361246 ?auto_361248 ) ) ( not ( = ?auto_361246 ?auto_361249 ) ) ( not ( = ?auto_361246 ?auto_361250 ) ) ( not ( = ?auto_361246 ?auto_361251 ) ) ( not ( = ?auto_361246 ?auto_361252 ) ) ( not ( = ?auto_361247 ?auto_361248 ) ) ( not ( = ?auto_361247 ?auto_361249 ) ) ( not ( = ?auto_361247 ?auto_361250 ) ) ( not ( = ?auto_361247 ?auto_361251 ) ) ( not ( = ?auto_361247 ?auto_361252 ) ) ( not ( = ?auto_361248 ?auto_361249 ) ) ( not ( = ?auto_361248 ?auto_361250 ) ) ( not ( = ?auto_361248 ?auto_361251 ) ) ( not ( = ?auto_361248 ?auto_361252 ) ) ( not ( = ?auto_361249 ?auto_361250 ) ) ( not ( = ?auto_361249 ?auto_361251 ) ) ( not ( = ?auto_361249 ?auto_361252 ) ) ( not ( = ?auto_361250 ?auto_361251 ) ) ( not ( = ?auto_361250 ?auto_361252 ) ) ( not ( = ?auto_361251 ?auto_361252 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_361251 ?auto_361252 )
      ( !STACK ?auto_361251 ?auto_361250 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_361278 - BLOCK
      ?auto_361279 - BLOCK
      ?auto_361280 - BLOCK
      ?auto_361281 - BLOCK
      ?auto_361282 - BLOCK
      ?auto_361283 - BLOCK
      ?auto_361284 - BLOCK
      ?auto_361285 - BLOCK
    )
    :vars
    (
      ?auto_361286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_361285 ?auto_361286 ) ( ON-TABLE ?auto_361278 ) ( ON ?auto_361279 ?auto_361278 ) ( ON ?auto_361280 ?auto_361279 ) ( ON ?auto_361281 ?auto_361280 ) ( ON ?auto_361282 ?auto_361281 ) ( ON ?auto_361283 ?auto_361282 ) ( not ( = ?auto_361278 ?auto_361279 ) ) ( not ( = ?auto_361278 ?auto_361280 ) ) ( not ( = ?auto_361278 ?auto_361281 ) ) ( not ( = ?auto_361278 ?auto_361282 ) ) ( not ( = ?auto_361278 ?auto_361283 ) ) ( not ( = ?auto_361278 ?auto_361284 ) ) ( not ( = ?auto_361278 ?auto_361285 ) ) ( not ( = ?auto_361278 ?auto_361286 ) ) ( not ( = ?auto_361279 ?auto_361280 ) ) ( not ( = ?auto_361279 ?auto_361281 ) ) ( not ( = ?auto_361279 ?auto_361282 ) ) ( not ( = ?auto_361279 ?auto_361283 ) ) ( not ( = ?auto_361279 ?auto_361284 ) ) ( not ( = ?auto_361279 ?auto_361285 ) ) ( not ( = ?auto_361279 ?auto_361286 ) ) ( not ( = ?auto_361280 ?auto_361281 ) ) ( not ( = ?auto_361280 ?auto_361282 ) ) ( not ( = ?auto_361280 ?auto_361283 ) ) ( not ( = ?auto_361280 ?auto_361284 ) ) ( not ( = ?auto_361280 ?auto_361285 ) ) ( not ( = ?auto_361280 ?auto_361286 ) ) ( not ( = ?auto_361281 ?auto_361282 ) ) ( not ( = ?auto_361281 ?auto_361283 ) ) ( not ( = ?auto_361281 ?auto_361284 ) ) ( not ( = ?auto_361281 ?auto_361285 ) ) ( not ( = ?auto_361281 ?auto_361286 ) ) ( not ( = ?auto_361282 ?auto_361283 ) ) ( not ( = ?auto_361282 ?auto_361284 ) ) ( not ( = ?auto_361282 ?auto_361285 ) ) ( not ( = ?auto_361282 ?auto_361286 ) ) ( not ( = ?auto_361283 ?auto_361284 ) ) ( not ( = ?auto_361283 ?auto_361285 ) ) ( not ( = ?auto_361283 ?auto_361286 ) ) ( not ( = ?auto_361284 ?auto_361285 ) ) ( not ( = ?auto_361284 ?auto_361286 ) ) ( not ( = ?auto_361285 ?auto_361286 ) ) ( CLEAR ?auto_361283 ) ( ON ?auto_361284 ?auto_361285 ) ( CLEAR ?auto_361284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_361278 ?auto_361279 ?auto_361280 ?auto_361281 ?auto_361282 ?auto_361283 ?auto_361284 )
      ( MAKE-8PILE ?auto_361278 ?auto_361279 ?auto_361280 ?auto_361281 ?auto_361282 ?auto_361283 ?auto_361284 ?auto_361285 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_361312 - BLOCK
      ?auto_361313 - BLOCK
      ?auto_361314 - BLOCK
      ?auto_361315 - BLOCK
      ?auto_361316 - BLOCK
      ?auto_361317 - BLOCK
      ?auto_361318 - BLOCK
      ?auto_361319 - BLOCK
    )
    :vars
    (
      ?auto_361320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_361319 ?auto_361320 ) ( ON-TABLE ?auto_361312 ) ( ON ?auto_361313 ?auto_361312 ) ( ON ?auto_361314 ?auto_361313 ) ( ON ?auto_361315 ?auto_361314 ) ( ON ?auto_361316 ?auto_361315 ) ( not ( = ?auto_361312 ?auto_361313 ) ) ( not ( = ?auto_361312 ?auto_361314 ) ) ( not ( = ?auto_361312 ?auto_361315 ) ) ( not ( = ?auto_361312 ?auto_361316 ) ) ( not ( = ?auto_361312 ?auto_361317 ) ) ( not ( = ?auto_361312 ?auto_361318 ) ) ( not ( = ?auto_361312 ?auto_361319 ) ) ( not ( = ?auto_361312 ?auto_361320 ) ) ( not ( = ?auto_361313 ?auto_361314 ) ) ( not ( = ?auto_361313 ?auto_361315 ) ) ( not ( = ?auto_361313 ?auto_361316 ) ) ( not ( = ?auto_361313 ?auto_361317 ) ) ( not ( = ?auto_361313 ?auto_361318 ) ) ( not ( = ?auto_361313 ?auto_361319 ) ) ( not ( = ?auto_361313 ?auto_361320 ) ) ( not ( = ?auto_361314 ?auto_361315 ) ) ( not ( = ?auto_361314 ?auto_361316 ) ) ( not ( = ?auto_361314 ?auto_361317 ) ) ( not ( = ?auto_361314 ?auto_361318 ) ) ( not ( = ?auto_361314 ?auto_361319 ) ) ( not ( = ?auto_361314 ?auto_361320 ) ) ( not ( = ?auto_361315 ?auto_361316 ) ) ( not ( = ?auto_361315 ?auto_361317 ) ) ( not ( = ?auto_361315 ?auto_361318 ) ) ( not ( = ?auto_361315 ?auto_361319 ) ) ( not ( = ?auto_361315 ?auto_361320 ) ) ( not ( = ?auto_361316 ?auto_361317 ) ) ( not ( = ?auto_361316 ?auto_361318 ) ) ( not ( = ?auto_361316 ?auto_361319 ) ) ( not ( = ?auto_361316 ?auto_361320 ) ) ( not ( = ?auto_361317 ?auto_361318 ) ) ( not ( = ?auto_361317 ?auto_361319 ) ) ( not ( = ?auto_361317 ?auto_361320 ) ) ( not ( = ?auto_361318 ?auto_361319 ) ) ( not ( = ?auto_361318 ?auto_361320 ) ) ( not ( = ?auto_361319 ?auto_361320 ) ) ( ON ?auto_361318 ?auto_361319 ) ( CLEAR ?auto_361316 ) ( ON ?auto_361317 ?auto_361318 ) ( CLEAR ?auto_361317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_361312 ?auto_361313 ?auto_361314 ?auto_361315 ?auto_361316 ?auto_361317 )
      ( MAKE-8PILE ?auto_361312 ?auto_361313 ?auto_361314 ?auto_361315 ?auto_361316 ?auto_361317 ?auto_361318 ?auto_361319 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_361346 - BLOCK
      ?auto_361347 - BLOCK
      ?auto_361348 - BLOCK
      ?auto_361349 - BLOCK
      ?auto_361350 - BLOCK
      ?auto_361351 - BLOCK
      ?auto_361352 - BLOCK
      ?auto_361353 - BLOCK
    )
    :vars
    (
      ?auto_361354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_361353 ?auto_361354 ) ( ON-TABLE ?auto_361346 ) ( ON ?auto_361347 ?auto_361346 ) ( ON ?auto_361348 ?auto_361347 ) ( ON ?auto_361349 ?auto_361348 ) ( not ( = ?auto_361346 ?auto_361347 ) ) ( not ( = ?auto_361346 ?auto_361348 ) ) ( not ( = ?auto_361346 ?auto_361349 ) ) ( not ( = ?auto_361346 ?auto_361350 ) ) ( not ( = ?auto_361346 ?auto_361351 ) ) ( not ( = ?auto_361346 ?auto_361352 ) ) ( not ( = ?auto_361346 ?auto_361353 ) ) ( not ( = ?auto_361346 ?auto_361354 ) ) ( not ( = ?auto_361347 ?auto_361348 ) ) ( not ( = ?auto_361347 ?auto_361349 ) ) ( not ( = ?auto_361347 ?auto_361350 ) ) ( not ( = ?auto_361347 ?auto_361351 ) ) ( not ( = ?auto_361347 ?auto_361352 ) ) ( not ( = ?auto_361347 ?auto_361353 ) ) ( not ( = ?auto_361347 ?auto_361354 ) ) ( not ( = ?auto_361348 ?auto_361349 ) ) ( not ( = ?auto_361348 ?auto_361350 ) ) ( not ( = ?auto_361348 ?auto_361351 ) ) ( not ( = ?auto_361348 ?auto_361352 ) ) ( not ( = ?auto_361348 ?auto_361353 ) ) ( not ( = ?auto_361348 ?auto_361354 ) ) ( not ( = ?auto_361349 ?auto_361350 ) ) ( not ( = ?auto_361349 ?auto_361351 ) ) ( not ( = ?auto_361349 ?auto_361352 ) ) ( not ( = ?auto_361349 ?auto_361353 ) ) ( not ( = ?auto_361349 ?auto_361354 ) ) ( not ( = ?auto_361350 ?auto_361351 ) ) ( not ( = ?auto_361350 ?auto_361352 ) ) ( not ( = ?auto_361350 ?auto_361353 ) ) ( not ( = ?auto_361350 ?auto_361354 ) ) ( not ( = ?auto_361351 ?auto_361352 ) ) ( not ( = ?auto_361351 ?auto_361353 ) ) ( not ( = ?auto_361351 ?auto_361354 ) ) ( not ( = ?auto_361352 ?auto_361353 ) ) ( not ( = ?auto_361352 ?auto_361354 ) ) ( not ( = ?auto_361353 ?auto_361354 ) ) ( ON ?auto_361352 ?auto_361353 ) ( ON ?auto_361351 ?auto_361352 ) ( CLEAR ?auto_361349 ) ( ON ?auto_361350 ?auto_361351 ) ( CLEAR ?auto_361350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_361346 ?auto_361347 ?auto_361348 ?auto_361349 ?auto_361350 )
      ( MAKE-8PILE ?auto_361346 ?auto_361347 ?auto_361348 ?auto_361349 ?auto_361350 ?auto_361351 ?auto_361352 ?auto_361353 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_361380 - BLOCK
      ?auto_361381 - BLOCK
      ?auto_361382 - BLOCK
      ?auto_361383 - BLOCK
      ?auto_361384 - BLOCK
      ?auto_361385 - BLOCK
      ?auto_361386 - BLOCK
      ?auto_361387 - BLOCK
    )
    :vars
    (
      ?auto_361388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_361387 ?auto_361388 ) ( ON-TABLE ?auto_361380 ) ( ON ?auto_361381 ?auto_361380 ) ( ON ?auto_361382 ?auto_361381 ) ( not ( = ?auto_361380 ?auto_361381 ) ) ( not ( = ?auto_361380 ?auto_361382 ) ) ( not ( = ?auto_361380 ?auto_361383 ) ) ( not ( = ?auto_361380 ?auto_361384 ) ) ( not ( = ?auto_361380 ?auto_361385 ) ) ( not ( = ?auto_361380 ?auto_361386 ) ) ( not ( = ?auto_361380 ?auto_361387 ) ) ( not ( = ?auto_361380 ?auto_361388 ) ) ( not ( = ?auto_361381 ?auto_361382 ) ) ( not ( = ?auto_361381 ?auto_361383 ) ) ( not ( = ?auto_361381 ?auto_361384 ) ) ( not ( = ?auto_361381 ?auto_361385 ) ) ( not ( = ?auto_361381 ?auto_361386 ) ) ( not ( = ?auto_361381 ?auto_361387 ) ) ( not ( = ?auto_361381 ?auto_361388 ) ) ( not ( = ?auto_361382 ?auto_361383 ) ) ( not ( = ?auto_361382 ?auto_361384 ) ) ( not ( = ?auto_361382 ?auto_361385 ) ) ( not ( = ?auto_361382 ?auto_361386 ) ) ( not ( = ?auto_361382 ?auto_361387 ) ) ( not ( = ?auto_361382 ?auto_361388 ) ) ( not ( = ?auto_361383 ?auto_361384 ) ) ( not ( = ?auto_361383 ?auto_361385 ) ) ( not ( = ?auto_361383 ?auto_361386 ) ) ( not ( = ?auto_361383 ?auto_361387 ) ) ( not ( = ?auto_361383 ?auto_361388 ) ) ( not ( = ?auto_361384 ?auto_361385 ) ) ( not ( = ?auto_361384 ?auto_361386 ) ) ( not ( = ?auto_361384 ?auto_361387 ) ) ( not ( = ?auto_361384 ?auto_361388 ) ) ( not ( = ?auto_361385 ?auto_361386 ) ) ( not ( = ?auto_361385 ?auto_361387 ) ) ( not ( = ?auto_361385 ?auto_361388 ) ) ( not ( = ?auto_361386 ?auto_361387 ) ) ( not ( = ?auto_361386 ?auto_361388 ) ) ( not ( = ?auto_361387 ?auto_361388 ) ) ( ON ?auto_361386 ?auto_361387 ) ( ON ?auto_361385 ?auto_361386 ) ( ON ?auto_361384 ?auto_361385 ) ( CLEAR ?auto_361382 ) ( ON ?auto_361383 ?auto_361384 ) ( CLEAR ?auto_361383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_361380 ?auto_361381 ?auto_361382 ?auto_361383 )
      ( MAKE-8PILE ?auto_361380 ?auto_361381 ?auto_361382 ?auto_361383 ?auto_361384 ?auto_361385 ?auto_361386 ?auto_361387 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_361414 - BLOCK
      ?auto_361415 - BLOCK
      ?auto_361416 - BLOCK
      ?auto_361417 - BLOCK
      ?auto_361418 - BLOCK
      ?auto_361419 - BLOCK
      ?auto_361420 - BLOCK
      ?auto_361421 - BLOCK
    )
    :vars
    (
      ?auto_361422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_361421 ?auto_361422 ) ( ON-TABLE ?auto_361414 ) ( ON ?auto_361415 ?auto_361414 ) ( not ( = ?auto_361414 ?auto_361415 ) ) ( not ( = ?auto_361414 ?auto_361416 ) ) ( not ( = ?auto_361414 ?auto_361417 ) ) ( not ( = ?auto_361414 ?auto_361418 ) ) ( not ( = ?auto_361414 ?auto_361419 ) ) ( not ( = ?auto_361414 ?auto_361420 ) ) ( not ( = ?auto_361414 ?auto_361421 ) ) ( not ( = ?auto_361414 ?auto_361422 ) ) ( not ( = ?auto_361415 ?auto_361416 ) ) ( not ( = ?auto_361415 ?auto_361417 ) ) ( not ( = ?auto_361415 ?auto_361418 ) ) ( not ( = ?auto_361415 ?auto_361419 ) ) ( not ( = ?auto_361415 ?auto_361420 ) ) ( not ( = ?auto_361415 ?auto_361421 ) ) ( not ( = ?auto_361415 ?auto_361422 ) ) ( not ( = ?auto_361416 ?auto_361417 ) ) ( not ( = ?auto_361416 ?auto_361418 ) ) ( not ( = ?auto_361416 ?auto_361419 ) ) ( not ( = ?auto_361416 ?auto_361420 ) ) ( not ( = ?auto_361416 ?auto_361421 ) ) ( not ( = ?auto_361416 ?auto_361422 ) ) ( not ( = ?auto_361417 ?auto_361418 ) ) ( not ( = ?auto_361417 ?auto_361419 ) ) ( not ( = ?auto_361417 ?auto_361420 ) ) ( not ( = ?auto_361417 ?auto_361421 ) ) ( not ( = ?auto_361417 ?auto_361422 ) ) ( not ( = ?auto_361418 ?auto_361419 ) ) ( not ( = ?auto_361418 ?auto_361420 ) ) ( not ( = ?auto_361418 ?auto_361421 ) ) ( not ( = ?auto_361418 ?auto_361422 ) ) ( not ( = ?auto_361419 ?auto_361420 ) ) ( not ( = ?auto_361419 ?auto_361421 ) ) ( not ( = ?auto_361419 ?auto_361422 ) ) ( not ( = ?auto_361420 ?auto_361421 ) ) ( not ( = ?auto_361420 ?auto_361422 ) ) ( not ( = ?auto_361421 ?auto_361422 ) ) ( ON ?auto_361420 ?auto_361421 ) ( ON ?auto_361419 ?auto_361420 ) ( ON ?auto_361418 ?auto_361419 ) ( ON ?auto_361417 ?auto_361418 ) ( CLEAR ?auto_361415 ) ( ON ?auto_361416 ?auto_361417 ) ( CLEAR ?auto_361416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_361414 ?auto_361415 ?auto_361416 )
      ( MAKE-8PILE ?auto_361414 ?auto_361415 ?auto_361416 ?auto_361417 ?auto_361418 ?auto_361419 ?auto_361420 ?auto_361421 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_361448 - BLOCK
      ?auto_361449 - BLOCK
      ?auto_361450 - BLOCK
      ?auto_361451 - BLOCK
      ?auto_361452 - BLOCK
      ?auto_361453 - BLOCK
      ?auto_361454 - BLOCK
      ?auto_361455 - BLOCK
    )
    :vars
    (
      ?auto_361456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_361455 ?auto_361456 ) ( ON-TABLE ?auto_361448 ) ( not ( = ?auto_361448 ?auto_361449 ) ) ( not ( = ?auto_361448 ?auto_361450 ) ) ( not ( = ?auto_361448 ?auto_361451 ) ) ( not ( = ?auto_361448 ?auto_361452 ) ) ( not ( = ?auto_361448 ?auto_361453 ) ) ( not ( = ?auto_361448 ?auto_361454 ) ) ( not ( = ?auto_361448 ?auto_361455 ) ) ( not ( = ?auto_361448 ?auto_361456 ) ) ( not ( = ?auto_361449 ?auto_361450 ) ) ( not ( = ?auto_361449 ?auto_361451 ) ) ( not ( = ?auto_361449 ?auto_361452 ) ) ( not ( = ?auto_361449 ?auto_361453 ) ) ( not ( = ?auto_361449 ?auto_361454 ) ) ( not ( = ?auto_361449 ?auto_361455 ) ) ( not ( = ?auto_361449 ?auto_361456 ) ) ( not ( = ?auto_361450 ?auto_361451 ) ) ( not ( = ?auto_361450 ?auto_361452 ) ) ( not ( = ?auto_361450 ?auto_361453 ) ) ( not ( = ?auto_361450 ?auto_361454 ) ) ( not ( = ?auto_361450 ?auto_361455 ) ) ( not ( = ?auto_361450 ?auto_361456 ) ) ( not ( = ?auto_361451 ?auto_361452 ) ) ( not ( = ?auto_361451 ?auto_361453 ) ) ( not ( = ?auto_361451 ?auto_361454 ) ) ( not ( = ?auto_361451 ?auto_361455 ) ) ( not ( = ?auto_361451 ?auto_361456 ) ) ( not ( = ?auto_361452 ?auto_361453 ) ) ( not ( = ?auto_361452 ?auto_361454 ) ) ( not ( = ?auto_361452 ?auto_361455 ) ) ( not ( = ?auto_361452 ?auto_361456 ) ) ( not ( = ?auto_361453 ?auto_361454 ) ) ( not ( = ?auto_361453 ?auto_361455 ) ) ( not ( = ?auto_361453 ?auto_361456 ) ) ( not ( = ?auto_361454 ?auto_361455 ) ) ( not ( = ?auto_361454 ?auto_361456 ) ) ( not ( = ?auto_361455 ?auto_361456 ) ) ( ON ?auto_361454 ?auto_361455 ) ( ON ?auto_361453 ?auto_361454 ) ( ON ?auto_361452 ?auto_361453 ) ( ON ?auto_361451 ?auto_361452 ) ( ON ?auto_361450 ?auto_361451 ) ( CLEAR ?auto_361448 ) ( ON ?auto_361449 ?auto_361450 ) ( CLEAR ?auto_361449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_361448 ?auto_361449 )
      ( MAKE-8PILE ?auto_361448 ?auto_361449 ?auto_361450 ?auto_361451 ?auto_361452 ?auto_361453 ?auto_361454 ?auto_361455 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_361482 - BLOCK
      ?auto_361483 - BLOCK
      ?auto_361484 - BLOCK
      ?auto_361485 - BLOCK
      ?auto_361486 - BLOCK
      ?auto_361487 - BLOCK
      ?auto_361488 - BLOCK
      ?auto_361489 - BLOCK
    )
    :vars
    (
      ?auto_361490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_361489 ?auto_361490 ) ( not ( = ?auto_361482 ?auto_361483 ) ) ( not ( = ?auto_361482 ?auto_361484 ) ) ( not ( = ?auto_361482 ?auto_361485 ) ) ( not ( = ?auto_361482 ?auto_361486 ) ) ( not ( = ?auto_361482 ?auto_361487 ) ) ( not ( = ?auto_361482 ?auto_361488 ) ) ( not ( = ?auto_361482 ?auto_361489 ) ) ( not ( = ?auto_361482 ?auto_361490 ) ) ( not ( = ?auto_361483 ?auto_361484 ) ) ( not ( = ?auto_361483 ?auto_361485 ) ) ( not ( = ?auto_361483 ?auto_361486 ) ) ( not ( = ?auto_361483 ?auto_361487 ) ) ( not ( = ?auto_361483 ?auto_361488 ) ) ( not ( = ?auto_361483 ?auto_361489 ) ) ( not ( = ?auto_361483 ?auto_361490 ) ) ( not ( = ?auto_361484 ?auto_361485 ) ) ( not ( = ?auto_361484 ?auto_361486 ) ) ( not ( = ?auto_361484 ?auto_361487 ) ) ( not ( = ?auto_361484 ?auto_361488 ) ) ( not ( = ?auto_361484 ?auto_361489 ) ) ( not ( = ?auto_361484 ?auto_361490 ) ) ( not ( = ?auto_361485 ?auto_361486 ) ) ( not ( = ?auto_361485 ?auto_361487 ) ) ( not ( = ?auto_361485 ?auto_361488 ) ) ( not ( = ?auto_361485 ?auto_361489 ) ) ( not ( = ?auto_361485 ?auto_361490 ) ) ( not ( = ?auto_361486 ?auto_361487 ) ) ( not ( = ?auto_361486 ?auto_361488 ) ) ( not ( = ?auto_361486 ?auto_361489 ) ) ( not ( = ?auto_361486 ?auto_361490 ) ) ( not ( = ?auto_361487 ?auto_361488 ) ) ( not ( = ?auto_361487 ?auto_361489 ) ) ( not ( = ?auto_361487 ?auto_361490 ) ) ( not ( = ?auto_361488 ?auto_361489 ) ) ( not ( = ?auto_361488 ?auto_361490 ) ) ( not ( = ?auto_361489 ?auto_361490 ) ) ( ON ?auto_361488 ?auto_361489 ) ( ON ?auto_361487 ?auto_361488 ) ( ON ?auto_361486 ?auto_361487 ) ( ON ?auto_361485 ?auto_361486 ) ( ON ?auto_361484 ?auto_361485 ) ( ON ?auto_361483 ?auto_361484 ) ( ON ?auto_361482 ?auto_361483 ) ( CLEAR ?auto_361482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_361482 )
      ( MAKE-8PILE ?auto_361482 ?auto_361483 ?auto_361484 ?auto_361485 ?auto_361486 ?auto_361487 ?auto_361488 ?auto_361489 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_361517 - BLOCK
      ?auto_361518 - BLOCK
      ?auto_361519 - BLOCK
      ?auto_361520 - BLOCK
      ?auto_361521 - BLOCK
      ?auto_361522 - BLOCK
      ?auto_361523 - BLOCK
      ?auto_361524 - BLOCK
      ?auto_361525 - BLOCK
    )
    :vars
    (
      ?auto_361526 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_361524 ) ( ON ?auto_361525 ?auto_361526 ) ( CLEAR ?auto_361525 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_361517 ) ( ON ?auto_361518 ?auto_361517 ) ( ON ?auto_361519 ?auto_361518 ) ( ON ?auto_361520 ?auto_361519 ) ( ON ?auto_361521 ?auto_361520 ) ( ON ?auto_361522 ?auto_361521 ) ( ON ?auto_361523 ?auto_361522 ) ( ON ?auto_361524 ?auto_361523 ) ( not ( = ?auto_361517 ?auto_361518 ) ) ( not ( = ?auto_361517 ?auto_361519 ) ) ( not ( = ?auto_361517 ?auto_361520 ) ) ( not ( = ?auto_361517 ?auto_361521 ) ) ( not ( = ?auto_361517 ?auto_361522 ) ) ( not ( = ?auto_361517 ?auto_361523 ) ) ( not ( = ?auto_361517 ?auto_361524 ) ) ( not ( = ?auto_361517 ?auto_361525 ) ) ( not ( = ?auto_361517 ?auto_361526 ) ) ( not ( = ?auto_361518 ?auto_361519 ) ) ( not ( = ?auto_361518 ?auto_361520 ) ) ( not ( = ?auto_361518 ?auto_361521 ) ) ( not ( = ?auto_361518 ?auto_361522 ) ) ( not ( = ?auto_361518 ?auto_361523 ) ) ( not ( = ?auto_361518 ?auto_361524 ) ) ( not ( = ?auto_361518 ?auto_361525 ) ) ( not ( = ?auto_361518 ?auto_361526 ) ) ( not ( = ?auto_361519 ?auto_361520 ) ) ( not ( = ?auto_361519 ?auto_361521 ) ) ( not ( = ?auto_361519 ?auto_361522 ) ) ( not ( = ?auto_361519 ?auto_361523 ) ) ( not ( = ?auto_361519 ?auto_361524 ) ) ( not ( = ?auto_361519 ?auto_361525 ) ) ( not ( = ?auto_361519 ?auto_361526 ) ) ( not ( = ?auto_361520 ?auto_361521 ) ) ( not ( = ?auto_361520 ?auto_361522 ) ) ( not ( = ?auto_361520 ?auto_361523 ) ) ( not ( = ?auto_361520 ?auto_361524 ) ) ( not ( = ?auto_361520 ?auto_361525 ) ) ( not ( = ?auto_361520 ?auto_361526 ) ) ( not ( = ?auto_361521 ?auto_361522 ) ) ( not ( = ?auto_361521 ?auto_361523 ) ) ( not ( = ?auto_361521 ?auto_361524 ) ) ( not ( = ?auto_361521 ?auto_361525 ) ) ( not ( = ?auto_361521 ?auto_361526 ) ) ( not ( = ?auto_361522 ?auto_361523 ) ) ( not ( = ?auto_361522 ?auto_361524 ) ) ( not ( = ?auto_361522 ?auto_361525 ) ) ( not ( = ?auto_361522 ?auto_361526 ) ) ( not ( = ?auto_361523 ?auto_361524 ) ) ( not ( = ?auto_361523 ?auto_361525 ) ) ( not ( = ?auto_361523 ?auto_361526 ) ) ( not ( = ?auto_361524 ?auto_361525 ) ) ( not ( = ?auto_361524 ?auto_361526 ) ) ( not ( = ?auto_361525 ?auto_361526 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_361525 ?auto_361526 )
      ( !STACK ?auto_361525 ?auto_361524 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_361555 - BLOCK
      ?auto_361556 - BLOCK
      ?auto_361557 - BLOCK
      ?auto_361558 - BLOCK
      ?auto_361559 - BLOCK
      ?auto_361560 - BLOCK
      ?auto_361561 - BLOCK
      ?auto_361562 - BLOCK
      ?auto_361563 - BLOCK
    )
    :vars
    (
      ?auto_361564 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_361563 ?auto_361564 ) ( ON-TABLE ?auto_361555 ) ( ON ?auto_361556 ?auto_361555 ) ( ON ?auto_361557 ?auto_361556 ) ( ON ?auto_361558 ?auto_361557 ) ( ON ?auto_361559 ?auto_361558 ) ( ON ?auto_361560 ?auto_361559 ) ( ON ?auto_361561 ?auto_361560 ) ( not ( = ?auto_361555 ?auto_361556 ) ) ( not ( = ?auto_361555 ?auto_361557 ) ) ( not ( = ?auto_361555 ?auto_361558 ) ) ( not ( = ?auto_361555 ?auto_361559 ) ) ( not ( = ?auto_361555 ?auto_361560 ) ) ( not ( = ?auto_361555 ?auto_361561 ) ) ( not ( = ?auto_361555 ?auto_361562 ) ) ( not ( = ?auto_361555 ?auto_361563 ) ) ( not ( = ?auto_361555 ?auto_361564 ) ) ( not ( = ?auto_361556 ?auto_361557 ) ) ( not ( = ?auto_361556 ?auto_361558 ) ) ( not ( = ?auto_361556 ?auto_361559 ) ) ( not ( = ?auto_361556 ?auto_361560 ) ) ( not ( = ?auto_361556 ?auto_361561 ) ) ( not ( = ?auto_361556 ?auto_361562 ) ) ( not ( = ?auto_361556 ?auto_361563 ) ) ( not ( = ?auto_361556 ?auto_361564 ) ) ( not ( = ?auto_361557 ?auto_361558 ) ) ( not ( = ?auto_361557 ?auto_361559 ) ) ( not ( = ?auto_361557 ?auto_361560 ) ) ( not ( = ?auto_361557 ?auto_361561 ) ) ( not ( = ?auto_361557 ?auto_361562 ) ) ( not ( = ?auto_361557 ?auto_361563 ) ) ( not ( = ?auto_361557 ?auto_361564 ) ) ( not ( = ?auto_361558 ?auto_361559 ) ) ( not ( = ?auto_361558 ?auto_361560 ) ) ( not ( = ?auto_361558 ?auto_361561 ) ) ( not ( = ?auto_361558 ?auto_361562 ) ) ( not ( = ?auto_361558 ?auto_361563 ) ) ( not ( = ?auto_361558 ?auto_361564 ) ) ( not ( = ?auto_361559 ?auto_361560 ) ) ( not ( = ?auto_361559 ?auto_361561 ) ) ( not ( = ?auto_361559 ?auto_361562 ) ) ( not ( = ?auto_361559 ?auto_361563 ) ) ( not ( = ?auto_361559 ?auto_361564 ) ) ( not ( = ?auto_361560 ?auto_361561 ) ) ( not ( = ?auto_361560 ?auto_361562 ) ) ( not ( = ?auto_361560 ?auto_361563 ) ) ( not ( = ?auto_361560 ?auto_361564 ) ) ( not ( = ?auto_361561 ?auto_361562 ) ) ( not ( = ?auto_361561 ?auto_361563 ) ) ( not ( = ?auto_361561 ?auto_361564 ) ) ( not ( = ?auto_361562 ?auto_361563 ) ) ( not ( = ?auto_361562 ?auto_361564 ) ) ( not ( = ?auto_361563 ?auto_361564 ) ) ( CLEAR ?auto_361561 ) ( ON ?auto_361562 ?auto_361563 ) ( CLEAR ?auto_361562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_361555 ?auto_361556 ?auto_361557 ?auto_361558 ?auto_361559 ?auto_361560 ?auto_361561 ?auto_361562 )
      ( MAKE-9PILE ?auto_361555 ?auto_361556 ?auto_361557 ?auto_361558 ?auto_361559 ?auto_361560 ?auto_361561 ?auto_361562 ?auto_361563 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_361593 - BLOCK
      ?auto_361594 - BLOCK
      ?auto_361595 - BLOCK
      ?auto_361596 - BLOCK
      ?auto_361597 - BLOCK
      ?auto_361598 - BLOCK
      ?auto_361599 - BLOCK
      ?auto_361600 - BLOCK
      ?auto_361601 - BLOCK
    )
    :vars
    (
      ?auto_361602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_361601 ?auto_361602 ) ( ON-TABLE ?auto_361593 ) ( ON ?auto_361594 ?auto_361593 ) ( ON ?auto_361595 ?auto_361594 ) ( ON ?auto_361596 ?auto_361595 ) ( ON ?auto_361597 ?auto_361596 ) ( ON ?auto_361598 ?auto_361597 ) ( not ( = ?auto_361593 ?auto_361594 ) ) ( not ( = ?auto_361593 ?auto_361595 ) ) ( not ( = ?auto_361593 ?auto_361596 ) ) ( not ( = ?auto_361593 ?auto_361597 ) ) ( not ( = ?auto_361593 ?auto_361598 ) ) ( not ( = ?auto_361593 ?auto_361599 ) ) ( not ( = ?auto_361593 ?auto_361600 ) ) ( not ( = ?auto_361593 ?auto_361601 ) ) ( not ( = ?auto_361593 ?auto_361602 ) ) ( not ( = ?auto_361594 ?auto_361595 ) ) ( not ( = ?auto_361594 ?auto_361596 ) ) ( not ( = ?auto_361594 ?auto_361597 ) ) ( not ( = ?auto_361594 ?auto_361598 ) ) ( not ( = ?auto_361594 ?auto_361599 ) ) ( not ( = ?auto_361594 ?auto_361600 ) ) ( not ( = ?auto_361594 ?auto_361601 ) ) ( not ( = ?auto_361594 ?auto_361602 ) ) ( not ( = ?auto_361595 ?auto_361596 ) ) ( not ( = ?auto_361595 ?auto_361597 ) ) ( not ( = ?auto_361595 ?auto_361598 ) ) ( not ( = ?auto_361595 ?auto_361599 ) ) ( not ( = ?auto_361595 ?auto_361600 ) ) ( not ( = ?auto_361595 ?auto_361601 ) ) ( not ( = ?auto_361595 ?auto_361602 ) ) ( not ( = ?auto_361596 ?auto_361597 ) ) ( not ( = ?auto_361596 ?auto_361598 ) ) ( not ( = ?auto_361596 ?auto_361599 ) ) ( not ( = ?auto_361596 ?auto_361600 ) ) ( not ( = ?auto_361596 ?auto_361601 ) ) ( not ( = ?auto_361596 ?auto_361602 ) ) ( not ( = ?auto_361597 ?auto_361598 ) ) ( not ( = ?auto_361597 ?auto_361599 ) ) ( not ( = ?auto_361597 ?auto_361600 ) ) ( not ( = ?auto_361597 ?auto_361601 ) ) ( not ( = ?auto_361597 ?auto_361602 ) ) ( not ( = ?auto_361598 ?auto_361599 ) ) ( not ( = ?auto_361598 ?auto_361600 ) ) ( not ( = ?auto_361598 ?auto_361601 ) ) ( not ( = ?auto_361598 ?auto_361602 ) ) ( not ( = ?auto_361599 ?auto_361600 ) ) ( not ( = ?auto_361599 ?auto_361601 ) ) ( not ( = ?auto_361599 ?auto_361602 ) ) ( not ( = ?auto_361600 ?auto_361601 ) ) ( not ( = ?auto_361600 ?auto_361602 ) ) ( not ( = ?auto_361601 ?auto_361602 ) ) ( ON ?auto_361600 ?auto_361601 ) ( CLEAR ?auto_361598 ) ( ON ?auto_361599 ?auto_361600 ) ( CLEAR ?auto_361599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_361593 ?auto_361594 ?auto_361595 ?auto_361596 ?auto_361597 ?auto_361598 ?auto_361599 )
      ( MAKE-9PILE ?auto_361593 ?auto_361594 ?auto_361595 ?auto_361596 ?auto_361597 ?auto_361598 ?auto_361599 ?auto_361600 ?auto_361601 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_361631 - BLOCK
      ?auto_361632 - BLOCK
      ?auto_361633 - BLOCK
      ?auto_361634 - BLOCK
      ?auto_361635 - BLOCK
      ?auto_361636 - BLOCK
      ?auto_361637 - BLOCK
      ?auto_361638 - BLOCK
      ?auto_361639 - BLOCK
    )
    :vars
    (
      ?auto_361640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_361639 ?auto_361640 ) ( ON-TABLE ?auto_361631 ) ( ON ?auto_361632 ?auto_361631 ) ( ON ?auto_361633 ?auto_361632 ) ( ON ?auto_361634 ?auto_361633 ) ( ON ?auto_361635 ?auto_361634 ) ( not ( = ?auto_361631 ?auto_361632 ) ) ( not ( = ?auto_361631 ?auto_361633 ) ) ( not ( = ?auto_361631 ?auto_361634 ) ) ( not ( = ?auto_361631 ?auto_361635 ) ) ( not ( = ?auto_361631 ?auto_361636 ) ) ( not ( = ?auto_361631 ?auto_361637 ) ) ( not ( = ?auto_361631 ?auto_361638 ) ) ( not ( = ?auto_361631 ?auto_361639 ) ) ( not ( = ?auto_361631 ?auto_361640 ) ) ( not ( = ?auto_361632 ?auto_361633 ) ) ( not ( = ?auto_361632 ?auto_361634 ) ) ( not ( = ?auto_361632 ?auto_361635 ) ) ( not ( = ?auto_361632 ?auto_361636 ) ) ( not ( = ?auto_361632 ?auto_361637 ) ) ( not ( = ?auto_361632 ?auto_361638 ) ) ( not ( = ?auto_361632 ?auto_361639 ) ) ( not ( = ?auto_361632 ?auto_361640 ) ) ( not ( = ?auto_361633 ?auto_361634 ) ) ( not ( = ?auto_361633 ?auto_361635 ) ) ( not ( = ?auto_361633 ?auto_361636 ) ) ( not ( = ?auto_361633 ?auto_361637 ) ) ( not ( = ?auto_361633 ?auto_361638 ) ) ( not ( = ?auto_361633 ?auto_361639 ) ) ( not ( = ?auto_361633 ?auto_361640 ) ) ( not ( = ?auto_361634 ?auto_361635 ) ) ( not ( = ?auto_361634 ?auto_361636 ) ) ( not ( = ?auto_361634 ?auto_361637 ) ) ( not ( = ?auto_361634 ?auto_361638 ) ) ( not ( = ?auto_361634 ?auto_361639 ) ) ( not ( = ?auto_361634 ?auto_361640 ) ) ( not ( = ?auto_361635 ?auto_361636 ) ) ( not ( = ?auto_361635 ?auto_361637 ) ) ( not ( = ?auto_361635 ?auto_361638 ) ) ( not ( = ?auto_361635 ?auto_361639 ) ) ( not ( = ?auto_361635 ?auto_361640 ) ) ( not ( = ?auto_361636 ?auto_361637 ) ) ( not ( = ?auto_361636 ?auto_361638 ) ) ( not ( = ?auto_361636 ?auto_361639 ) ) ( not ( = ?auto_361636 ?auto_361640 ) ) ( not ( = ?auto_361637 ?auto_361638 ) ) ( not ( = ?auto_361637 ?auto_361639 ) ) ( not ( = ?auto_361637 ?auto_361640 ) ) ( not ( = ?auto_361638 ?auto_361639 ) ) ( not ( = ?auto_361638 ?auto_361640 ) ) ( not ( = ?auto_361639 ?auto_361640 ) ) ( ON ?auto_361638 ?auto_361639 ) ( ON ?auto_361637 ?auto_361638 ) ( CLEAR ?auto_361635 ) ( ON ?auto_361636 ?auto_361637 ) ( CLEAR ?auto_361636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_361631 ?auto_361632 ?auto_361633 ?auto_361634 ?auto_361635 ?auto_361636 )
      ( MAKE-9PILE ?auto_361631 ?auto_361632 ?auto_361633 ?auto_361634 ?auto_361635 ?auto_361636 ?auto_361637 ?auto_361638 ?auto_361639 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_361669 - BLOCK
      ?auto_361670 - BLOCK
      ?auto_361671 - BLOCK
      ?auto_361672 - BLOCK
      ?auto_361673 - BLOCK
      ?auto_361674 - BLOCK
      ?auto_361675 - BLOCK
      ?auto_361676 - BLOCK
      ?auto_361677 - BLOCK
    )
    :vars
    (
      ?auto_361678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_361677 ?auto_361678 ) ( ON-TABLE ?auto_361669 ) ( ON ?auto_361670 ?auto_361669 ) ( ON ?auto_361671 ?auto_361670 ) ( ON ?auto_361672 ?auto_361671 ) ( not ( = ?auto_361669 ?auto_361670 ) ) ( not ( = ?auto_361669 ?auto_361671 ) ) ( not ( = ?auto_361669 ?auto_361672 ) ) ( not ( = ?auto_361669 ?auto_361673 ) ) ( not ( = ?auto_361669 ?auto_361674 ) ) ( not ( = ?auto_361669 ?auto_361675 ) ) ( not ( = ?auto_361669 ?auto_361676 ) ) ( not ( = ?auto_361669 ?auto_361677 ) ) ( not ( = ?auto_361669 ?auto_361678 ) ) ( not ( = ?auto_361670 ?auto_361671 ) ) ( not ( = ?auto_361670 ?auto_361672 ) ) ( not ( = ?auto_361670 ?auto_361673 ) ) ( not ( = ?auto_361670 ?auto_361674 ) ) ( not ( = ?auto_361670 ?auto_361675 ) ) ( not ( = ?auto_361670 ?auto_361676 ) ) ( not ( = ?auto_361670 ?auto_361677 ) ) ( not ( = ?auto_361670 ?auto_361678 ) ) ( not ( = ?auto_361671 ?auto_361672 ) ) ( not ( = ?auto_361671 ?auto_361673 ) ) ( not ( = ?auto_361671 ?auto_361674 ) ) ( not ( = ?auto_361671 ?auto_361675 ) ) ( not ( = ?auto_361671 ?auto_361676 ) ) ( not ( = ?auto_361671 ?auto_361677 ) ) ( not ( = ?auto_361671 ?auto_361678 ) ) ( not ( = ?auto_361672 ?auto_361673 ) ) ( not ( = ?auto_361672 ?auto_361674 ) ) ( not ( = ?auto_361672 ?auto_361675 ) ) ( not ( = ?auto_361672 ?auto_361676 ) ) ( not ( = ?auto_361672 ?auto_361677 ) ) ( not ( = ?auto_361672 ?auto_361678 ) ) ( not ( = ?auto_361673 ?auto_361674 ) ) ( not ( = ?auto_361673 ?auto_361675 ) ) ( not ( = ?auto_361673 ?auto_361676 ) ) ( not ( = ?auto_361673 ?auto_361677 ) ) ( not ( = ?auto_361673 ?auto_361678 ) ) ( not ( = ?auto_361674 ?auto_361675 ) ) ( not ( = ?auto_361674 ?auto_361676 ) ) ( not ( = ?auto_361674 ?auto_361677 ) ) ( not ( = ?auto_361674 ?auto_361678 ) ) ( not ( = ?auto_361675 ?auto_361676 ) ) ( not ( = ?auto_361675 ?auto_361677 ) ) ( not ( = ?auto_361675 ?auto_361678 ) ) ( not ( = ?auto_361676 ?auto_361677 ) ) ( not ( = ?auto_361676 ?auto_361678 ) ) ( not ( = ?auto_361677 ?auto_361678 ) ) ( ON ?auto_361676 ?auto_361677 ) ( ON ?auto_361675 ?auto_361676 ) ( ON ?auto_361674 ?auto_361675 ) ( CLEAR ?auto_361672 ) ( ON ?auto_361673 ?auto_361674 ) ( CLEAR ?auto_361673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_361669 ?auto_361670 ?auto_361671 ?auto_361672 ?auto_361673 )
      ( MAKE-9PILE ?auto_361669 ?auto_361670 ?auto_361671 ?auto_361672 ?auto_361673 ?auto_361674 ?auto_361675 ?auto_361676 ?auto_361677 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_361707 - BLOCK
      ?auto_361708 - BLOCK
      ?auto_361709 - BLOCK
      ?auto_361710 - BLOCK
      ?auto_361711 - BLOCK
      ?auto_361712 - BLOCK
      ?auto_361713 - BLOCK
      ?auto_361714 - BLOCK
      ?auto_361715 - BLOCK
    )
    :vars
    (
      ?auto_361716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_361715 ?auto_361716 ) ( ON-TABLE ?auto_361707 ) ( ON ?auto_361708 ?auto_361707 ) ( ON ?auto_361709 ?auto_361708 ) ( not ( = ?auto_361707 ?auto_361708 ) ) ( not ( = ?auto_361707 ?auto_361709 ) ) ( not ( = ?auto_361707 ?auto_361710 ) ) ( not ( = ?auto_361707 ?auto_361711 ) ) ( not ( = ?auto_361707 ?auto_361712 ) ) ( not ( = ?auto_361707 ?auto_361713 ) ) ( not ( = ?auto_361707 ?auto_361714 ) ) ( not ( = ?auto_361707 ?auto_361715 ) ) ( not ( = ?auto_361707 ?auto_361716 ) ) ( not ( = ?auto_361708 ?auto_361709 ) ) ( not ( = ?auto_361708 ?auto_361710 ) ) ( not ( = ?auto_361708 ?auto_361711 ) ) ( not ( = ?auto_361708 ?auto_361712 ) ) ( not ( = ?auto_361708 ?auto_361713 ) ) ( not ( = ?auto_361708 ?auto_361714 ) ) ( not ( = ?auto_361708 ?auto_361715 ) ) ( not ( = ?auto_361708 ?auto_361716 ) ) ( not ( = ?auto_361709 ?auto_361710 ) ) ( not ( = ?auto_361709 ?auto_361711 ) ) ( not ( = ?auto_361709 ?auto_361712 ) ) ( not ( = ?auto_361709 ?auto_361713 ) ) ( not ( = ?auto_361709 ?auto_361714 ) ) ( not ( = ?auto_361709 ?auto_361715 ) ) ( not ( = ?auto_361709 ?auto_361716 ) ) ( not ( = ?auto_361710 ?auto_361711 ) ) ( not ( = ?auto_361710 ?auto_361712 ) ) ( not ( = ?auto_361710 ?auto_361713 ) ) ( not ( = ?auto_361710 ?auto_361714 ) ) ( not ( = ?auto_361710 ?auto_361715 ) ) ( not ( = ?auto_361710 ?auto_361716 ) ) ( not ( = ?auto_361711 ?auto_361712 ) ) ( not ( = ?auto_361711 ?auto_361713 ) ) ( not ( = ?auto_361711 ?auto_361714 ) ) ( not ( = ?auto_361711 ?auto_361715 ) ) ( not ( = ?auto_361711 ?auto_361716 ) ) ( not ( = ?auto_361712 ?auto_361713 ) ) ( not ( = ?auto_361712 ?auto_361714 ) ) ( not ( = ?auto_361712 ?auto_361715 ) ) ( not ( = ?auto_361712 ?auto_361716 ) ) ( not ( = ?auto_361713 ?auto_361714 ) ) ( not ( = ?auto_361713 ?auto_361715 ) ) ( not ( = ?auto_361713 ?auto_361716 ) ) ( not ( = ?auto_361714 ?auto_361715 ) ) ( not ( = ?auto_361714 ?auto_361716 ) ) ( not ( = ?auto_361715 ?auto_361716 ) ) ( ON ?auto_361714 ?auto_361715 ) ( ON ?auto_361713 ?auto_361714 ) ( ON ?auto_361712 ?auto_361713 ) ( ON ?auto_361711 ?auto_361712 ) ( CLEAR ?auto_361709 ) ( ON ?auto_361710 ?auto_361711 ) ( CLEAR ?auto_361710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_361707 ?auto_361708 ?auto_361709 ?auto_361710 )
      ( MAKE-9PILE ?auto_361707 ?auto_361708 ?auto_361709 ?auto_361710 ?auto_361711 ?auto_361712 ?auto_361713 ?auto_361714 ?auto_361715 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_361745 - BLOCK
      ?auto_361746 - BLOCK
      ?auto_361747 - BLOCK
      ?auto_361748 - BLOCK
      ?auto_361749 - BLOCK
      ?auto_361750 - BLOCK
      ?auto_361751 - BLOCK
      ?auto_361752 - BLOCK
      ?auto_361753 - BLOCK
    )
    :vars
    (
      ?auto_361754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_361753 ?auto_361754 ) ( ON-TABLE ?auto_361745 ) ( ON ?auto_361746 ?auto_361745 ) ( not ( = ?auto_361745 ?auto_361746 ) ) ( not ( = ?auto_361745 ?auto_361747 ) ) ( not ( = ?auto_361745 ?auto_361748 ) ) ( not ( = ?auto_361745 ?auto_361749 ) ) ( not ( = ?auto_361745 ?auto_361750 ) ) ( not ( = ?auto_361745 ?auto_361751 ) ) ( not ( = ?auto_361745 ?auto_361752 ) ) ( not ( = ?auto_361745 ?auto_361753 ) ) ( not ( = ?auto_361745 ?auto_361754 ) ) ( not ( = ?auto_361746 ?auto_361747 ) ) ( not ( = ?auto_361746 ?auto_361748 ) ) ( not ( = ?auto_361746 ?auto_361749 ) ) ( not ( = ?auto_361746 ?auto_361750 ) ) ( not ( = ?auto_361746 ?auto_361751 ) ) ( not ( = ?auto_361746 ?auto_361752 ) ) ( not ( = ?auto_361746 ?auto_361753 ) ) ( not ( = ?auto_361746 ?auto_361754 ) ) ( not ( = ?auto_361747 ?auto_361748 ) ) ( not ( = ?auto_361747 ?auto_361749 ) ) ( not ( = ?auto_361747 ?auto_361750 ) ) ( not ( = ?auto_361747 ?auto_361751 ) ) ( not ( = ?auto_361747 ?auto_361752 ) ) ( not ( = ?auto_361747 ?auto_361753 ) ) ( not ( = ?auto_361747 ?auto_361754 ) ) ( not ( = ?auto_361748 ?auto_361749 ) ) ( not ( = ?auto_361748 ?auto_361750 ) ) ( not ( = ?auto_361748 ?auto_361751 ) ) ( not ( = ?auto_361748 ?auto_361752 ) ) ( not ( = ?auto_361748 ?auto_361753 ) ) ( not ( = ?auto_361748 ?auto_361754 ) ) ( not ( = ?auto_361749 ?auto_361750 ) ) ( not ( = ?auto_361749 ?auto_361751 ) ) ( not ( = ?auto_361749 ?auto_361752 ) ) ( not ( = ?auto_361749 ?auto_361753 ) ) ( not ( = ?auto_361749 ?auto_361754 ) ) ( not ( = ?auto_361750 ?auto_361751 ) ) ( not ( = ?auto_361750 ?auto_361752 ) ) ( not ( = ?auto_361750 ?auto_361753 ) ) ( not ( = ?auto_361750 ?auto_361754 ) ) ( not ( = ?auto_361751 ?auto_361752 ) ) ( not ( = ?auto_361751 ?auto_361753 ) ) ( not ( = ?auto_361751 ?auto_361754 ) ) ( not ( = ?auto_361752 ?auto_361753 ) ) ( not ( = ?auto_361752 ?auto_361754 ) ) ( not ( = ?auto_361753 ?auto_361754 ) ) ( ON ?auto_361752 ?auto_361753 ) ( ON ?auto_361751 ?auto_361752 ) ( ON ?auto_361750 ?auto_361751 ) ( ON ?auto_361749 ?auto_361750 ) ( ON ?auto_361748 ?auto_361749 ) ( CLEAR ?auto_361746 ) ( ON ?auto_361747 ?auto_361748 ) ( CLEAR ?auto_361747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_361745 ?auto_361746 ?auto_361747 )
      ( MAKE-9PILE ?auto_361745 ?auto_361746 ?auto_361747 ?auto_361748 ?auto_361749 ?auto_361750 ?auto_361751 ?auto_361752 ?auto_361753 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_361783 - BLOCK
      ?auto_361784 - BLOCK
      ?auto_361785 - BLOCK
      ?auto_361786 - BLOCK
      ?auto_361787 - BLOCK
      ?auto_361788 - BLOCK
      ?auto_361789 - BLOCK
      ?auto_361790 - BLOCK
      ?auto_361791 - BLOCK
    )
    :vars
    (
      ?auto_361792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_361791 ?auto_361792 ) ( ON-TABLE ?auto_361783 ) ( not ( = ?auto_361783 ?auto_361784 ) ) ( not ( = ?auto_361783 ?auto_361785 ) ) ( not ( = ?auto_361783 ?auto_361786 ) ) ( not ( = ?auto_361783 ?auto_361787 ) ) ( not ( = ?auto_361783 ?auto_361788 ) ) ( not ( = ?auto_361783 ?auto_361789 ) ) ( not ( = ?auto_361783 ?auto_361790 ) ) ( not ( = ?auto_361783 ?auto_361791 ) ) ( not ( = ?auto_361783 ?auto_361792 ) ) ( not ( = ?auto_361784 ?auto_361785 ) ) ( not ( = ?auto_361784 ?auto_361786 ) ) ( not ( = ?auto_361784 ?auto_361787 ) ) ( not ( = ?auto_361784 ?auto_361788 ) ) ( not ( = ?auto_361784 ?auto_361789 ) ) ( not ( = ?auto_361784 ?auto_361790 ) ) ( not ( = ?auto_361784 ?auto_361791 ) ) ( not ( = ?auto_361784 ?auto_361792 ) ) ( not ( = ?auto_361785 ?auto_361786 ) ) ( not ( = ?auto_361785 ?auto_361787 ) ) ( not ( = ?auto_361785 ?auto_361788 ) ) ( not ( = ?auto_361785 ?auto_361789 ) ) ( not ( = ?auto_361785 ?auto_361790 ) ) ( not ( = ?auto_361785 ?auto_361791 ) ) ( not ( = ?auto_361785 ?auto_361792 ) ) ( not ( = ?auto_361786 ?auto_361787 ) ) ( not ( = ?auto_361786 ?auto_361788 ) ) ( not ( = ?auto_361786 ?auto_361789 ) ) ( not ( = ?auto_361786 ?auto_361790 ) ) ( not ( = ?auto_361786 ?auto_361791 ) ) ( not ( = ?auto_361786 ?auto_361792 ) ) ( not ( = ?auto_361787 ?auto_361788 ) ) ( not ( = ?auto_361787 ?auto_361789 ) ) ( not ( = ?auto_361787 ?auto_361790 ) ) ( not ( = ?auto_361787 ?auto_361791 ) ) ( not ( = ?auto_361787 ?auto_361792 ) ) ( not ( = ?auto_361788 ?auto_361789 ) ) ( not ( = ?auto_361788 ?auto_361790 ) ) ( not ( = ?auto_361788 ?auto_361791 ) ) ( not ( = ?auto_361788 ?auto_361792 ) ) ( not ( = ?auto_361789 ?auto_361790 ) ) ( not ( = ?auto_361789 ?auto_361791 ) ) ( not ( = ?auto_361789 ?auto_361792 ) ) ( not ( = ?auto_361790 ?auto_361791 ) ) ( not ( = ?auto_361790 ?auto_361792 ) ) ( not ( = ?auto_361791 ?auto_361792 ) ) ( ON ?auto_361790 ?auto_361791 ) ( ON ?auto_361789 ?auto_361790 ) ( ON ?auto_361788 ?auto_361789 ) ( ON ?auto_361787 ?auto_361788 ) ( ON ?auto_361786 ?auto_361787 ) ( ON ?auto_361785 ?auto_361786 ) ( CLEAR ?auto_361783 ) ( ON ?auto_361784 ?auto_361785 ) ( CLEAR ?auto_361784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_361783 ?auto_361784 )
      ( MAKE-9PILE ?auto_361783 ?auto_361784 ?auto_361785 ?auto_361786 ?auto_361787 ?auto_361788 ?auto_361789 ?auto_361790 ?auto_361791 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_361821 - BLOCK
      ?auto_361822 - BLOCK
      ?auto_361823 - BLOCK
      ?auto_361824 - BLOCK
      ?auto_361825 - BLOCK
      ?auto_361826 - BLOCK
      ?auto_361827 - BLOCK
      ?auto_361828 - BLOCK
      ?auto_361829 - BLOCK
    )
    :vars
    (
      ?auto_361830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_361829 ?auto_361830 ) ( not ( = ?auto_361821 ?auto_361822 ) ) ( not ( = ?auto_361821 ?auto_361823 ) ) ( not ( = ?auto_361821 ?auto_361824 ) ) ( not ( = ?auto_361821 ?auto_361825 ) ) ( not ( = ?auto_361821 ?auto_361826 ) ) ( not ( = ?auto_361821 ?auto_361827 ) ) ( not ( = ?auto_361821 ?auto_361828 ) ) ( not ( = ?auto_361821 ?auto_361829 ) ) ( not ( = ?auto_361821 ?auto_361830 ) ) ( not ( = ?auto_361822 ?auto_361823 ) ) ( not ( = ?auto_361822 ?auto_361824 ) ) ( not ( = ?auto_361822 ?auto_361825 ) ) ( not ( = ?auto_361822 ?auto_361826 ) ) ( not ( = ?auto_361822 ?auto_361827 ) ) ( not ( = ?auto_361822 ?auto_361828 ) ) ( not ( = ?auto_361822 ?auto_361829 ) ) ( not ( = ?auto_361822 ?auto_361830 ) ) ( not ( = ?auto_361823 ?auto_361824 ) ) ( not ( = ?auto_361823 ?auto_361825 ) ) ( not ( = ?auto_361823 ?auto_361826 ) ) ( not ( = ?auto_361823 ?auto_361827 ) ) ( not ( = ?auto_361823 ?auto_361828 ) ) ( not ( = ?auto_361823 ?auto_361829 ) ) ( not ( = ?auto_361823 ?auto_361830 ) ) ( not ( = ?auto_361824 ?auto_361825 ) ) ( not ( = ?auto_361824 ?auto_361826 ) ) ( not ( = ?auto_361824 ?auto_361827 ) ) ( not ( = ?auto_361824 ?auto_361828 ) ) ( not ( = ?auto_361824 ?auto_361829 ) ) ( not ( = ?auto_361824 ?auto_361830 ) ) ( not ( = ?auto_361825 ?auto_361826 ) ) ( not ( = ?auto_361825 ?auto_361827 ) ) ( not ( = ?auto_361825 ?auto_361828 ) ) ( not ( = ?auto_361825 ?auto_361829 ) ) ( not ( = ?auto_361825 ?auto_361830 ) ) ( not ( = ?auto_361826 ?auto_361827 ) ) ( not ( = ?auto_361826 ?auto_361828 ) ) ( not ( = ?auto_361826 ?auto_361829 ) ) ( not ( = ?auto_361826 ?auto_361830 ) ) ( not ( = ?auto_361827 ?auto_361828 ) ) ( not ( = ?auto_361827 ?auto_361829 ) ) ( not ( = ?auto_361827 ?auto_361830 ) ) ( not ( = ?auto_361828 ?auto_361829 ) ) ( not ( = ?auto_361828 ?auto_361830 ) ) ( not ( = ?auto_361829 ?auto_361830 ) ) ( ON ?auto_361828 ?auto_361829 ) ( ON ?auto_361827 ?auto_361828 ) ( ON ?auto_361826 ?auto_361827 ) ( ON ?auto_361825 ?auto_361826 ) ( ON ?auto_361824 ?auto_361825 ) ( ON ?auto_361823 ?auto_361824 ) ( ON ?auto_361822 ?auto_361823 ) ( ON ?auto_361821 ?auto_361822 ) ( CLEAR ?auto_361821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_361821 )
      ( MAKE-9PILE ?auto_361821 ?auto_361822 ?auto_361823 ?auto_361824 ?auto_361825 ?auto_361826 ?auto_361827 ?auto_361828 ?auto_361829 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_361860 - BLOCK
      ?auto_361861 - BLOCK
      ?auto_361862 - BLOCK
      ?auto_361863 - BLOCK
      ?auto_361864 - BLOCK
      ?auto_361865 - BLOCK
      ?auto_361866 - BLOCK
      ?auto_361867 - BLOCK
      ?auto_361868 - BLOCK
      ?auto_361869 - BLOCK
    )
    :vars
    (
      ?auto_361870 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_361868 ) ( ON ?auto_361869 ?auto_361870 ) ( CLEAR ?auto_361869 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_361860 ) ( ON ?auto_361861 ?auto_361860 ) ( ON ?auto_361862 ?auto_361861 ) ( ON ?auto_361863 ?auto_361862 ) ( ON ?auto_361864 ?auto_361863 ) ( ON ?auto_361865 ?auto_361864 ) ( ON ?auto_361866 ?auto_361865 ) ( ON ?auto_361867 ?auto_361866 ) ( ON ?auto_361868 ?auto_361867 ) ( not ( = ?auto_361860 ?auto_361861 ) ) ( not ( = ?auto_361860 ?auto_361862 ) ) ( not ( = ?auto_361860 ?auto_361863 ) ) ( not ( = ?auto_361860 ?auto_361864 ) ) ( not ( = ?auto_361860 ?auto_361865 ) ) ( not ( = ?auto_361860 ?auto_361866 ) ) ( not ( = ?auto_361860 ?auto_361867 ) ) ( not ( = ?auto_361860 ?auto_361868 ) ) ( not ( = ?auto_361860 ?auto_361869 ) ) ( not ( = ?auto_361860 ?auto_361870 ) ) ( not ( = ?auto_361861 ?auto_361862 ) ) ( not ( = ?auto_361861 ?auto_361863 ) ) ( not ( = ?auto_361861 ?auto_361864 ) ) ( not ( = ?auto_361861 ?auto_361865 ) ) ( not ( = ?auto_361861 ?auto_361866 ) ) ( not ( = ?auto_361861 ?auto_361867 ) ) ( not ( = ?auto_361861 ?auto_361868 ) ) ( not ( = ?auto_361861 ?auto_361869 ) ) ( not ( = ?auto_361861 ?auto_361870 ) ) ( not ( = ?auto_361862 ?auto_361863 ) ) ( not ( = ?auto_361862 ?auto_361864 ) ) ( not ( = ?auto_361862 ?auto_361865 ) ) ( not ( = ?auto_361862 ?auto_361866 ) ) ( not ( = ?auto_361862 ?auto_361867 ) ) ( not ( = ?auto_361862 ?auto_361868 ) ) ( not ( = ?auto_361862 ?auto_361869 ) ) ( not ( = ?auto_361862 ?auto_361870 ) ) ( not ( = ?auto_361863 ?auto_361864 ) ) ( not ( = ?auto_361863 ?auto_361865 ) ) ( not ( = ?auto_361863 ?auto_361866 ) ) ( not ( = ?auto_361863 ?auto_361867 ) ) ( not ( = ?auto_361863 ?auto_361868 ) ) ( not ( = ?auto_361863 ?auto_361869 ) ) ( not ( = ?auto_361863 ?auto_361870 ) ) ( not ( = ?auto_361864 ?auto_361865 ) ) ( not ( = ?auto_361864 ?auto_361866 ) ) ( not ( = ?auto_361864 ?auto_361867 ) ) ( not ( = ?auto_361864 ?auto_361868 ) ) ( not ( = ?auto_361864 ?auto_361869 ) ) ( not ( = ?auto_361864 ?auto_361870 ) ) ( not ( = ?auto_361865 ?auto_361866 ) ) ( not ( = ?auto_361865 ?auto_361867 ) ) ( not ( = ?auto_361865 ?auto_361868 ) ) ( not ( = ?auto_361865 ?auto_361869 ) ) ( not ( = ?auto_361865 ?auto_361870 ) ) ( not ( = ?auto_361866 ?auto_361867 ) ) ( not ( = ?auto_361866 ?auto_361868 ) ) ( not ( = ?auto_361866 ?auto_361869 ) ) ( not ( = ?auto_361866 ?auto_361870 ) ) ( not ( = ?auto_361867 ?auto_361868 ) ) ( not ( = ?auto_361867 ?auto_361869 ) ) ( not ( = ?auto_361867 ?auto_361870 ) ) ( not ( = ?auto_361868 ?auto_361869 ) ) ( not ( = ?auto_361868 ?auto_361870 ) ) ( not ( = ?auto_361869 ?auto_361870 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_361869 ?auto_361870 )
      ( !STACK ?auto_361869 ?auto_361868 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_361902 - BLOCK
      ?auto_361903 - BLOCK
      ?auto_361904 - BLOCK
      ?auto_361905 - BLOCK
      ?auto_361906 - BLOCK
      ?auto_361907 - BLOCK
      ?auto_361908 - BLOCK
      ?auto_361909 - BLOCK
      ?auto_361910 - BLOCK
      ?auto_361911 - BLOCK
    )
    :vars
    (
      ?auto_361912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_361911 ?auto_361912 ) ( ON-TABLE ?auto_361902 ) ( ON ?auto_361903 ?auto_361902 ) ( ON ?auto_361904 ?auto_361903 ) ( ON ?auto_361905 ?auto_361904 ) ( ON ?auto_361906 ?auto_361905 ) ( ON ?auto_361907 ?auto_361906 ) ( ON ?auto_361908 ?auto_361907 ) ( ON ?auto_361909 ?auto_361908 ) ( not ( = ?auto_361902 ?auto_361903 ) ) ( not ( = ?auto_361902 ?auto_361904 ) ) ( not ( = ?auto_361902 ?auto_361905 ) ) ( not ( = ?auto_361902 ?auto_361906 ) ) ( not ( = ?auto_361902 ?auto_361907 ) ) ( not ( = ?auto_361902 ?auto_361908 ) ) ( not ( = ?auto_361902 ?auto_361909 ) ) ( not ( = ?auto_361902 ?auto_361910 ) ) ( not ( = ?auto_361902 ?auto_361911 ) ) ( not ( = ?auto_361902 ?auto_361912 ) ) ( not ( = ?auto_361903 ?auto_361904 ) ) ( not ( = ?auto_361903 ?auto_361905 ) ) ( not ( = ?auto_361903 ?auto_361906 ) ) ( not ( = ?auto_361903 ?auto_361907 ) ) ( not ( = ?auto_361903 ?auto_361908 ) ) ( not ( = ?auto_361903 ?auto_361909 ) ) ( not ( = ?auto_361903 ?auto_361910 ) ) ( not ( = ?auto_361903 ?auto_361911 ) ) ( not ( = ?auto_361903 ?auto_361912 ) ) ( not ( = ?auto_361904 ?auto_361905 ) ) ( not ( = ?auto_361904 ?auto_361906 ) ) ( not ( = ?auto_361904 ?auto_361907 ) ) ( not ( = ?auto_361904 ?auto_361908 ) ) ( not ( = ?auto_361904 ?auto_361909 ) ) ( not ( = ?auto_361904 ?auto_361910 ) ) ( not ( = ?auto_361904 ?auto_361911 ) ) ( not ( = ?auto_361904 ?auto_361912 ) ) ( not ( = ?auto_361905 ?auto_361906 ) ) ( not ( = ?auto_361905 ?auto_361907 ) ) ( not ( = ?auto_361905 ?auto_361908 ) ) ( not ( = ?auto_361905 ?auto_361909 ) ) ( not ( = ?auto_361905 ?auto_361910 ) ) ( not ( = ?auto_361905 ?auto_361911 ) ) ( not ( = ?auto_361905 ?auto_361912 ) ) ( not ( = ?auto_361906 ?auto_361907 ) ) ( not ( = ?auto_361906 ?auto_361908 ) ) ( not ( = ?auto_361906 ?auto_361909 ) ) ( not ( = ?auto_361906 ?auto_361910 ) ) ( not ( = ?auto_361906 ?auto_361911 ) ) ( not ( = ?auto_361906 ?auto_361912 ) ) ( not ( = ?auto_361907 ?auto_361908 ) ) ( not ( = ?auto_361907 ?auto_361909 ) ) ( not ( = ?auto_361907 ?auto_361910 ) ) ( not ( = ?auto_361907 ?auto_361911 ) ) ( not ( = ?auto_361907 ?auto_361912 ) ) ( not ( = ?auto_361908 ?auto_361909 ) ) ( not ( = ?auto_361908 ?auto_361910 ) ) ( not ( = ?auto_361908 ?auto_361911 ) ) ( not ( = ?auto_361908 ?auto_361912 ) ) ( not ( = ?auto_361909 ?auto_361910 ) ) ( not ( = ?auto_361909 ?auto_361911 ) ) ( not ( = ?auto_361909 ?auto_361912 ) ) ( not ( = ?auto_361910 ?auto_361911 ) ) ( not ( = ?auto_361910 ?auto_361912 ) ) ( not ( = ?auto_361911 ?auto_361912 ) ) ( CLEAR ?auto_361909 ) ( ON ?auto_361910 ?auto_361911 ) ( CLEAR ?auto_361910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_361902 ?auto_361903 ?auto_361904 ?auto_361905 ?auto_361906 ?auto_361907 ?auto_361908 ?auto_361909 ?auto_361910 )
      ( MAKE-10PILE ?auto_361902 ?auto_361903 ?auto_361904 ?auto_361905 ?auto_361906 ?auto_361907 ?auto_361908 ?auto_361909 ?auto_361910 ?auto_361911 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_361944 - BLOCK
      ?auto_361945 - BLOCK
      ?auto_361946 - BLOCK
      ?auto_361947 - BLOCK
      ?auto_361948 - BLOCK
      ?auto_361949 - BLOCK
      ?auto_361950 - BLOCK
      ?auto_361951 - BLOCK
      ?auto_361952 - BLOCK
      ?auto_361953 - BLOCK
    )
    :vars
    (
      ?auto_361954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_361953 ?auto_361954 ) ( ON-TABLE ?auto_361944 ) ( ON ?auto_361945 ?auto_361944 ) ( ON ?auto_361946 ?auto_361945 ) ( ON ?auto_361947 ?auto_361946 ) ( ON ?auto_361948 ?auto_361947 ) ( ON ?auto_361949 ?auto_361948 ) ( ON ?auto_361950 ?auto_361949 ) ( not ( = ?auto_361944 ?auto_361945 ) ) ( not ( = ?auto_361944 ?auto_361946 ) ) ( not ( = ?auto_361944 ?auto_361947 ) ) ( not ( = ?auto_361944 ?auto_361948 ) ) ( not ( = ?auto_361944 ?auto_361949 ) ) ( not ( = ?auto_361944 ?auto_361950 ) ) ( not ( = ?auto_361944 ?auto_361951 ) ) ( not ( = ?auto_361944 ?auto_361952 ) ) ( not ( = ?auto_361944 ?auto_361953 ) ) ( not ( = ?auto_361944 ?auto_361954 ) ) ( not ( = ?auto_361945 ?auto_361946 ) ) ( not ( = ?auto_361945 ?auto_361947 ) ) ( not ( = ?auto_361945 ?auto_361948 ) ) ( not ( = ?auto_361945 ?auto_361949 ) ) ( not ( = ?auto_361945 ?auto_361950 ) ) ( not ( = ?auto_361945 ?auto_361951 ) ) ( not ( = ?auto_361945 ?auto_361952 ) ) ( not ( = ?auto_361945 ?auto_361953 ) ) ( not ( = ?auto_361945 ?auto_361954 ) ) ( not ( = ?auto_361946 ?auto_361947 ) ) ( not ( = ?auto_361946 ?auto_361948 ) ) ( not ( = ?auto_361946 ?auto_361949 ) ) ( not ( = ?auto_361946 ?auto_361950 ) ) ( not ( = ?auto_361946 ?auto_361951 ) ) ( not ( = ?auto_361946 ?auto_361952 ) ) ( not ( = ?auto_361946 ?auto_361953 ) ) ( not ( = ?auto_361946 ?auto_361954 ) ) ( not ( = ?auto_361947 ?auto_361948 ) ) ( not ( = ?auto_361947 ?auto_361949 ) ) ( not ( = ?auto_361947 ?auto_361950 ) ) ( not ( = ?auto_361947 ?auto_361951 ) ) ( not ( = ?auto_361947 ?auto_361952 ) ) ( not ( = ?auto_361947 ?auto_361953 ) ) ( not ( = ?auto_361947 ?auto_361954 ) ) ( not ( = ?auto_361948 ?auto_361949 ) ) ( not ( = ?auto_361948 ?auto_361950 ) ) ( not ( = ?auto_361948 ?auto_361951 ) ) ( not ( = ?auto_361948 ?auto_361952 ) ) ( not ( = ?auto_361948 ?auto_361953 ) ) ( not ( = ?auto_361948 ?auto_361954 ) ) ( not ( = ?auto_361949 ?auto_361950 ) ) ( not ( = ?auto_361949 ?auto_361951 ) ) ( not ( = ?auto_361949 ?auto_361952 ) ) ( not ( = ?auto_361949 ?auto_361953 ) ) ( not ( = ?auto_361949 ?auto_361954 ) ) ( not ( = ?auto_361950 ?auto_361951 ) ) ( not ( = ?auto_361950 ?auto_361952 ) ) ( not ( = ?auto_361950 ?auto_361953 ) ) ( not ( = ?auto_361950 ?auto_361954 ) ) ( not ( = ?auto_361951 ?auto_361952 ) ) ( not ( = ?auto_361951 ?auto_361953 ) ) ( not ( = ?auto_361951 ?auto_361954 ) ) ( not ( = ?auto_361952 ?auto_361953 ) ) ( not ( = ?auto_361952 ?auto_361954 ) ) ( not ( = ?auto_361953 ?auto_361954 ) ) ( ON ?auto_361952 ?auto_361953 ) ( CLEAR ?auto_361950 ) ( ON ?auto_361951 ?auto_361952 ) ( CLEAR ?auto_361951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_361944 ?auto_361945 ?auto_361946 ?auto_361947 ?auto_361948 ?auto_361949 ?auto_361950 ?auto_361951 )
      ( MAKE-10PILE ?auto_361944 ?auto_361945 ?auto_361946 ?auto_361947 ?auto_361948 ?auto_361949 ?auto_361950 ?auto_361951 ?auto_361952 ?auto_361953 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_361986 - BLOCK
      ?auto_361987 - BLOCK
      ?auto_361988 - BLOCK
      ?auto_361989 - BLOCK
      ?auto_361990 - BLOCK
      ?auto_361991 - BLOCK
      ?auto_361992 - BLOCK
      ?auto_361993 - BLOCK
      ?auto_361994 - BLOCK
      ?auto_361995 - BLOCK
    )
    :vars
    (
      ?auto_361996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_361995 ?auto_361996 ) ( ON-TABLE ?auto_361986 ) ( ON ?auto_361987 ?auto_361986 ) ( ON ?auto_361988 ?auto_361987 ) ( ON ?auto_361989 ?auto_361988 ) ( ON ?auto_361990 ?auto_361989 ) ( ON ?auto_361991 ?auto_361990 ) ( not ( = ?auto_361986 ?auto_361987 ) ) ( not ( = ?auto_361986 ?auto_361988 ) ) ( not ( = ?auto_361986 ?auto_361989 ) ) ( not ( = ?auto_361986 ?auto_361990 ) ) ( not ( = ?auto_361986 ?auto_361991 ) ) ( not ( = ?auto_361986 ?auto_361992 ) ) ( not ( = ?auto_361986 ?auto_361993 ) ) ( not ( = ?auto_361986 ?auto_361994 ) ) ( not ( = ?auto_361986 ?auto_361995 ) ) ( not ( = ?auto_361986 ?auto_361996 ) ) ( not ( = ?auto_361987 ?auto_361988 ) ) ( not ( = ?auto_361987 ?auto_361989 ) ) ( not ( = ?auto_361987 ?auto_361990 ) ) ( not ( = ?auto_361987 ?auto_361991 ) ) ( not ( = ?auto_361987 ?auto_361992 ) ) ( not ( = ?auto_361987 ?auto_361993 ) ) ( not ( = ?auto_361987 ?auto_361994 ) ) ( not ( = ?auto_361987 ?auto_361995 ) ) ( not ( = ?auto_361987 ?auto_361996 ) ) ( not ( = ?auto_361988 ?auto_361989 ) ) ( not ( = ?auto_361988 ?auto_361990 ) ) ( not ( = ?auto_361988 ?auto_361991 ) ) ( not ( = ?auto_361988 ?auto_361992 ) ) ( not ( = ?auto_361988 ?auto_361993 ) ) ( not ( = ?auto_361988 ?auto_361994 ) ) ( not ( = ?auto_361988 ?auto_361995 ) ) ( not ( = ?auto_361988 ?auto_361996 ) ) ( not ( = ?auto_361989 ?auto_361990 ) ) ( not ( = ?auto_361989 ?auto_361991 ) ) ( not ( = ?auto_361989 ?auto_361992 ) ) ( not ( = ?auto_361989 ?auto_361993 ) ) ( not ( = ?auto_361989 ?auto_361994 ) ) ( not ( = ?auto_361989 ?auto_361995 ) ) ( not ( = ?auto_361989 ?auto_361996 ) ) ( not ( = ?auto_361990 ?auto_361991 ) ) ( not ( = ?auto_361990 ?auto_361992 ) ) ( not ( = ?auto_361990 ?auto_361993 ) ) ( not ( = ?auto_361990 ?auto_361994 ) ) ( not ( = ?auto_361990 ?auto_361995 ) ) ( not ( = ?auto_361990 ?auto_361996 ) ) ( not ( = ?auto_361991 ?auto_361992 ) ) ( not ( = ?auto_361991 ?auto_361993 ) ) ( not ( = ?auto_361991 ?auto_361994 ) ) ( not ( = ?auto_361991 ?auto_361995 ) ) ( not ( = ?auto_361991 ?auto_361996 ) ) ( not ( = ?auto_361992 ?auto_361993 ) ) ( not ( = ?auto_361992 ?auto_361994 ) ) ( not ( = ?auto_361992 ?auto_361995 ) ) ( not ( = ?auto_361992 ?auto_361996 ) ) ( not ( = ?auto_361993 ?auto_361994 ) ) ( not ( = ?auto_361993 ?auto_361995 ) ) ( not ( = ?auto_361993 ?auto_361996 ) ) ( not ( = ?auto_361994 ?auto_361995 ) ) ( not ( = ?auto_361994 ?auto_361996 ) ) ( not ( = ?auto_361995 ?auto_361996 ) ) ( ON ?auto_361994 ?auto_361995 ) ( ON ?auto_361993 ?auto_361994 ) ( CLEAR ?auto_361991 ) ( ON ?auto_361992 ?auto_361993 ) ( CLEAR ?auto_361992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_361986 ?auto_361987 ?auto_361988 ?auto_361989 ?auto_361990 ?auto_361991 ?auto_361992 )
      ( MAKE-10PILE ?auto_361986 ?auto_361987 ?auto_361988 ?auto_361989 ?auto_361990 ?auto_361991 ?auto_361992 ?auto_361993 ?auto_361994 ?auto_361995 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_362028 - BLOCK
      ?auto_362029 - BLOCK
      ?auto_362030 - BLOCK
      ?auto_362031 - BLOCK
      ?auto_362032 - BLOCK
      ?auto_362033 - BLOCK
      ?auto_362034 - BLOCK
      ?auto_362035 - BLOCK
      ?auto_362036 - BLOCK
      ?auto_362037 - BLOCK
    )
    :vars
    (
      ?auto_362038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_362037 ?auto_362038 ) ( ON-TABLE ?auto_362028 ) ( ON ?auto_362029 ?auto_362028 ) ( ON ?auto_362030 ?auto_362029 ) ( ON ?auto_362031 ?auto_362030 ) ( ON ?auto_362032 ?auto_362031 ) ( not ( = ?auto_362028 ?auto_362029 ) ) ( not ( = ?auto_362028 ?auto_362030 ) ) ( not ( = ?auto_362028 ?auto_362031 ) ) ( not ( = ?auto_362028 ?auto_362032 ) ) ( not ( = ?auto_362028 ?auto_362033 ) ) ( not ( = ?auto_362028 ?auto_362034 ) ) ( not ( = ?auto_362028 ?auto_362035 ) ) ( not ( = ?auto_362028 ?auto_362036 ) ) ( not ( = ?auto_362028 ?auto_362037 ) ) ( not ( = ?auto_362028 ?auto_362038 ) ) ( not ( = ?auto_362029 ?auto_362030 ) ) ( not ( = ?auto_362029 ?auto_362031 ) ) ( not ( = ?auto_362029 ?auto_362032 ) ) ( not ( = ?auto_362029 ?auto_362033 ) ) ( not ( = ?auto_362029 ?auto_362034 ) ) ( not ( = ?auto_362029 ?auto_362035 ) ) ( not ( = ?auto_362029 ?auto_362036 ) ) ( not ( = ?auto_362029 ?auto_362037 ) ) ( not ( = ?auto_362029 ?auto_362038 ) ) ( not ( = ?auto_362030 ?auto_362031 ) ) ( not ( = ?auto_362030 ?auto_362032 ) ) ( not ( = ?auto_362030 ?auto_362033 ) ) ( not ( = ?auto_362030 ?auto_362034 ) ) ( not ( = ?auto_362030 ?auto_362035 ) ) ( not ( = ?auto_362030 ?auto_362036 ) ) ( not ( = ?auto_362030 ?auto_362037 ) ) ( not ( = ?auto_362030 ?auto_362038 ) ) ( not ( = ?auto_362031 ?auto_362032 ) ) ( not ( = ?auto_362031 ?auto_362033 ) ) ( not ( = ?auto_362031 ?auto_362034 ) ) ( not ( = ?auto_362031 ?auto_362035 ) ) ( not ( = ?auto_362031 ?auto_362036 ) ) ( not ( = ?auto_362031 ?auto_362037 ) ) ( not ( = ?auto_362031 ?auto_362038 ) ) ( not ( = ?auto_362032 ?auto_362033 ) ) ( not ( = ?auto_362032 ?auto_362034 ) ) ( not ( = ?auto_362032 ?auto_362035 ) ) ( not ( = ?auto_362032 ?auto_362036 ) ) ( not ( = ?auto_362032 ?auto_362037 ) ) ( not ( = ?auto_362032 ?auto_362038 ) ) ( not ( = ?auto_362033 ?auto_362034 ) ) ( not ( = ?auto_362033 ?auto_362035 ) ) ( not ( = ?auto_362033 ?auto_362036 ) ) ( not ( = ?auto_362033 ?auto_362037 ) ) ( not ( = ?auto_362033 ?auto_362038 ) ) ( not ( = ?auto_362034 ?auto_362035 ) ) ( not ( = ?auto_362034 ?auto_362036 ) ) ( not ( = ?auto_362034 ?auto_362037 ) ) ( not ( = ?auto_362034 ?auto_362038 ) ) ( not ( = ?auto_362035 ?auto_362036 ) ) ( not ( = ?auto_362035 ?auto_362037 ) ) ( not ( = ?auto_362035 ?auto_362038 ) ) ( not ( = ?auto_362036 ?auto_362037 ) ) ( not ( = ?auto_362036 ?auto_362038 ) ) ( not ( = ?auto_362037 ?auto_362038 ) ) ( ON ?auto_362036 ?auto_362037 ) ( ON ?auto_362035 ?auto_362036 ) ( ON ?auto_362034 ?auto_362035 ) ( CLEAR ?auto_362032 ) ( ON ?auto_362033 ?auto_362034 ) ( CLEAR ?auto_362033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_362028 ?auto_362029 ?auto_362030 ?auto_362031 ?auto_362032 ?auto_362033 )
      ( MAKE-10PILE ?auto_362028 ?auto_362029 ?auto_362030 ?auto_362031 ?auto_362032 ?auto_362033 ?auto_362034 ?auto_362035 ?auto_362036 ?auto_362037 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_362070 - BLOCK
      ?auto_362071 - BLOCK
      ?auto_362072 - BLOCK
      ?auto_362073 - BLOCK
      ?auto_362074 - BLOCK
      ?auto_362075 - BLOCK
      ?auto_362076 - BLOCK
      ?auto_362077 - BLOCK
      ?auto_362078 - BLOCK
      ?auto_362079 - BLOCK
    )
    :vars
    (
      ?auto_362080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_362079 ?auto_362080 ) ( ON-TABLE ?auto_362070 ) ( ON ?auto_362071 ?auto_362070 ) ( ON ?auto_362072 ?auto_362071 ) ( ON ?auto_362073 ?auto_362072 ) ( not ( = ?auto_362070 ?auto_362071 ) ) ( not ( = ?auto_362070 ?auto_362072 ) ) ( not ( = ?auto_362070 ?auto_362073 ) ) ( not ( = ?auto_362070 ?auto_362074 ) ) ( not ( = ?auto_362070 ?auto_362075 ) ) ( not ( = ?auto_362070 ?auto_362076 ) ) ( not ( = ?auto_362070 ?auto_362077 ) ) ( not ( = ?auto_362070 ?auto_362078 ) ) ( not ( = ?auto_362070 ?auto_362079 ) ) ( not ( = ?auto_362070 ?auto_362080 ) ) ( not ( = ?auto_362071 ?auto_362072 ) ) ( not ( = ?auto_362071 ?auto_362073 ) ) ( not ( = ?auto_362071 ?auto_362074 ) ) ( not ( = ?auto_362071 ?auto_362075 ) ) ( not ( = ?auto_362071 ?auto_362076 ) ) ( not ( = ?auto_362071 ?auto_362077 ) ) ( not ( = ?auto_362071 ?auto_362078 ) ) ( not ( = ?auto_362071 ?auto_362079 ) ) ( not ( = ?auto_362071 ?auto_362080 ) ) ( not ( = ?auto_362072 ?auto_362073 ) ) ( not ( = ?auto_362072 ?auto_362074 ) ) ( not ( = ?auto_362072 ?auto_362075 ) ) ( not ( = ?auto_362072 ?auto_362076 ) ) ( not ( = ?auto_362072 ?auto_362077 ) ) ( not ( = ?auto_362072 ?auto_362078 ) ) ( not ( = ?auto_362072 ?auto_362079 ) ) ( not ( = ?auto_362072 ?auto_362080 ) ) ( not ( = ?auto_362073 ?auto_362074 ) ) ( not ( = ?auto_362073 ?auto_362075 ) ) ( not ( = ?auto_362073 ?auto_362076 ) ) ( not ( = ?auto_362073 ?auto_362077 ) ) ( not ( = ?auto_362073 ?auto_362078 ) ) ( not ( = ?auto_362073 ?auto_362079 ) ) ( not ( = ?auto_362073 ?auto_362080 ) ) ( not ( = ?auto_362074 ?auto_362075 ) ) ( not ( = ?auto_362074 ?auto_362076 ) ) ( not ( = ?auto_362074 ?auto_362077 ) ) ( not ( = ?auto_362074 ?auto_362078 ) ) ( not ( = ?auto_362074 ?auto_362079 ) ) ( not ( = ?auto_362074 ?auto_362080 ) ) ( not ( = ?auto_362075 ?auto_362076 ) ) ( not ( = ?auto_362075 ?auto_362077 ) ) ( not ( = ?auto_362075 ?auto_362078 ) ) ( not ( = ?auto_362075 ?auto_362079 ) ) ( not ( = ?auto_362075 ?auto_362080 ) ) ( not ( = ?auto_362076 ?auto_362077 ) ) ( not ( = ?auto_362076 ?auto_362078 ) ) ( not ( = ?auto_362076 ?auto_362079 ) ) ( not ( = ?auto_362076 ?auto_362080 ) ) ( not ( = ?auto_362077 ?auto_362078 ) ) ( not ( = ?auto_362077 ?auto_362079 ) ) ( not ( = ?auto_362077 ?auto_362080 ) ) ( not ( = ?auto_362078 ?auto_362079 ) ) ( not ( = ?auto_362078 ?auto_362080 ) ) ( not ( = ?auto_362079 ?auto_362080 ) ) ( ON ?auto_362078 ?auto_362079 ) ( ON ?auto_362077 ?auto_362078 ) ( ON ?auto_362076 ?auto_362077 ) ( ON ?auto_362075 ?auto_362076 ) ( CLEAR ?auto_362073 ) ( ON ?auto_362074 ?auto_362075 ) ( CLEAR ?auto_362074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_362070 ?auto_362071 ?auto_362072 ?auto_362073 ?auto_362074 )
      ( MAKE-10PILE ?auto_362070 ?auto_362071 ?auto_362072 ?auto_362073 ?auto_362074 ?auto_362075 ?auto_362076 ?auto_362077 ?auto_362078 ?auto_362079 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_362112 - BLOCK
      ?auto_362113 - BLOCK
      ?auto_362114 - BLOCK
      ?auto_362115 - BLOCK
      ?auto_362116 - BLOCK
      ?auto_362117 - BLOCK
      ?auto_362118 - BLOCK
      ?auto_362119 - BLOCK
      ?auto_362120 - BLOCK
      ?auto_362121 - BLOCK
    )
    :vars
    (
      ?auto_362122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_362121 ?auto_362122 ) ( ON-TABLE ?auto_362112 ) ( ON ?auto_362113 ?auto_362112 ) ( ON ?auto_362114 ?auto_362113 ) ( not ( = ?auto_362112 ?auto_362113 ) ) ( not ( = ?auto_362112 ?auto_362114 ) ) ( not ( = ?auto_362112 ?auto_362115 ) ) ( not ( = ?auto_362112 ?auto_362116 ) ) ( not ( = ?auto_362112 ?auto_362117 ) ) ( not ( = ?auto_362112 ?auto_362118 ) ) ( not ( = ?auto_362112 ?auto_362119 ) ) ( not ( = ?auto_362112 ?auto_362120 ) ) ( not ( = ?auto_362112 ?auto_362121 ) ) ( not ( = ?auto_362112 ?auto_362122 ) ) ( not ( = ?auto_362113 ?auto_362114 ) ) ( not ( = ?auto_362113 ?auto_362115 ) ) ( not ( = ?auto_362113 ?auto_362116 ) ) ( not ( = ?auto_362113 ?auto_362117 ) ) ( not ( = ?auto_362113 ?auto_362118 ) ) ( not ( = ?auto_362113 ?auto_362119 ) ) ( not ( = ?auto_362113 ?auto_362120 ) ) ( not ( = ?auto_362113 ?auto_362121 ) ) ( not ( = ?auto_362113 ?auto_362122 ) ) ( not ( = ?auto_362114 ?auto_362115 ) ) ( not ( = ?auto_362114 ?auto_362116 ) ) ( not ( = ?auto_362114 ?auto_362117 ) ) ( not ( = ?auto_362114 ?auto_362118 ) ) ( not ( = ?auto_362114 ?auto_362119 ) ) ( not ( = ?auto_362114 ?auto_362120 ) ) ( not ( = ?auto_362114 ?auto_362121 ) ) ( not ( = ?auto_362114 ?auto_362122 ) ) ( not ( = ?auto_362115 ?auto_362116 ) ) ( not ( = ?auto_362115 ?auto_362117 ) ) ( not ( = ?auto_362115 ?auto_362118 ) ) ( not ( = ?auto_362115 ?auto_362119 ) ) ( not ( = ?auto_362115 ?auto_362120 ) ) ( not ( = ?auto_362115 ?auto_362121 ) ) ( not ( = ?auto_362115 ?auto_362122 ) ) ( not ( = ?auto_362116 ?auto_362117 ) ) ( not ( = ?auto_362116 ?auto_362118 ) ) ( not ( = ?auto_362116 ?auto_362119 ) ) ( not ( = ?auto_362116 ?auto_362120 ) ) ( not ( = ?auto_362116 ?auto_362121 ) ) ( not ( = ?auto_362116 ?auto_362122 ) ) ( not ( = ?auto_362117 ?auto_362118 ) ) ( not ( = ?auto_362117 ?auto_362119 ) ) ( not ( = ?auto_362117 ?auto_362120 ) ) ( not ( = ?auto_362117 ?auto_362121 ) ) ( not ( = ?auto_362117 ?auto_362122 ) ) ( not ( = ?auto_362118 ?auto_362119 ) ) ( not ( = ?auto_362118 ?auto_362120 ) ) ( not ( = ?auto_362118 ?auto_362121 ) ) ( not ( = ?auto_362118 ?auto_362122 ) ) ( not ( = ?auto_362119 ?auto_362120 ) ) ( not ( = ?auto_362119 ?auto_362121 ) ) ( not ( = ?auto_362119 ?auto_362122 ) ) ( not ( = ?auto_362120 ?auto_362121 ) ) ( not ( = ?auto_362120 ?auto_362122 ) ) ( not ( = ?auto_362121 ?auto_362122 ) ) ( ON ?auto_362120 ?auto_362121 ) ( ON ?auto_362119 ?auto_362120 ) ( ON ?auto_362118 ?auto_362119 ) ( ON ?auto_362117 ?auto_362118 ) ( ON ?auto_362116 ?auto_362117 ) ( CLEAR ?auto_362114 ) ( ON ?auto_362115 ?auto_362116 ) ( CLEAR ?auto_362115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_362112 ?auto_362113 ?auto_362114 ?auto_362115 )
      ( MAKE-10PILE ?auto_362112 ?auto_362113 ?auto_362114 ?auto_362115 ?auto_362116 ?auto_362117 ?auto_362118 ?auto_362119 ?auto_362120 ?auto_362121 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_362154 - BLOCK
      ?auto_362155 - BLOCK
      ?auto_362156 - BLOCK
      ?auto_362157 - BLOCK
      ?auto_362158 - BLOCK
      ?auto_362159 - BLOCK
      ?auto_362160 - BLOCK
      ?auto_362161 - BLOCK
      ?auto_362162 - BLOCK
      ?auto_362163 - BLOCK
    )
    :vars
    (
      ?auto_362164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_362163 ?auto_362164 ) ( ON-TABLE ?auto_362154 ) ( ON ?auto_362155 ?auto_362154 ) ( not ( = ?auto_362154 ?auto_362155 ) ) ( not ( = ?auto_362154 ?auto_362156 ) ) ( not ( = ?auto_362154 ?auto_362157 ) ) ( not ( = ?auto_362154 ?auto_362158 ) ) ( not ( = ?auto_362154 ?auto_362159 ) ) ( not ( = ?auto_362154 ?auto_362160 ) ) ( not ( = ?auto_362154 ?auto_362161 ) ) ( not ( = ?auto_362154 ?auto_362162 ) ) ( not ( = ?auto_362154 ?auto_362163 ) ) ( not ( = ?auto_362154 ?auto_362164 ) ) ( not ( = ?auto_362155 ?auto_362156 ) ) ( not ( = ?auto_362155 ?auto_362157 ) ) ( not ( = ?auto_362155 ?auto_362158 ) ) ( not ( = ?auto_362155 ?auto_362159 ) ) ( not ( = ?auto_362155 ?auto_362160 ) ) ( not ( = ?auto_362155 ?auto_362161 ) ) ( not ( = ?auto_362155 ?auto_362162 ) ) ( not ( = ?auto_362155 ?auto_362163 ) ) ( not ( = ?auto_362155 ?auto_362164 ) ) ( not ( = ?auto_362156 ?auto_362157 ) ) ( not ( = ?auto_362156 ?auto_362158 ) ) ( not ( = ?auto_362156 ?auto_362159 ) ) ( not ( = ?auto_362156 ?auto_362160 ) ) ( not ( = ?auto_362156 ?auto_362161 ) ) ( not ( = ?auto_362156 ?auto_362162 ) ) ( not ( = ?auto_362156 ?auto_362163 ) ) ( not ( = ?auto_362156 ?auto_362164 ) ) ( not ( = ?auto_362157 ?auto_362158 ) ) ( not ( = ?auto_362157 ?auto_362159 ) ) ( not ( = ?auto_362157 ?auto_362160 ) ) ( not ( = ?auto_362157 ?auto_362161 ) ) ( not ( = ?auto_362157 ?auto_362162 ) ) ( not ( = ?auto_362157 ?auto_362163 ) ) ( not ( = ?auto_362157 ?auto_362164 ) ) ( not ( = ?auto_362158 ?auto_362159 ) ) ( not ( = ?auto_362158 ?auto_362160 ) ) ( not ( = ?auto_362158 ?auto_362161 ) ) ( not ( = ?auto_362158 ?auto_362162 ) ) ( not ( = ?auto_362158 ?auto_362163 ) ) ( not ( = ?auto_362158 ?auto_362164 ) ) ( not ( = ?auto_362159 ?auto_362160 ) ) ( not ( = ?auto_362159 ?auto_362161 ) ) ( not ( = ?auto_362159 ?auto_362162 ) ) ( not ( = ?auto_362159 ?auto_362163 ) ) ( not ( = ?auto_362159 ?auto_362164 ) ) ( not ( = ?auto_362160 ?auto_362161 ) ) ( not ( = ?auto_362160 ?auto_362162 ) ) ( not ( = ?auto_362160 ?auto_362163 ) ) ( not ( = ?auto_362160 ?auto_362164 ) ) ( not ( = ?auto_362161 ?auto_362162 ) ) ( not ( = ?auto_362161 ?auto_362163 ) ) ( not ( = ?auto_362161 ?auto_362164 ) ) ( not ( = ?auto_362162 ?auto_362163 ) ) ( not ( = ?auto_362162 ?auto_362164 ) ) ( not ( = ?auto_362163 ?auto_362164 ) ) ( ON ?auto_362162 ?auto_362163 ) ( ON ?auto_362161 ?auto_362162 ) ( ON ?auto_362160 ?auto_362161 ) ( ON ?auto_362159 ?auto_362160 ) ( ON ?auto_362158 ?auto_362159 ) ( ON ?auto_362157 ?auto_362158 ) ( CLEAR ?auto_362155 ) ( ON ?auto_362156 ?auto_362157 ) ( CLEAR ?auto_362156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_362154 ?auto_362155 ?auto_362156 )
      ( MAKE-10PILE ?auto_362154 ?auto_362155 ?auto_362156 ?auto_362157 ?auto_362158 ?auto_362159 ?auto_362160 ?auto_362161 ?auto_362162 ?auto_362163 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_362196 - BLOCK
      ?auto_362197 - BLOCK
      ?auto_362198 - BLOCK
      ?auto_362199 - BLOCK
      ?auto_362200 - BLOCK
      ?auto_362201 - BLOCK
      ?auto_362202 - BLOCK
      ?auto_362203 - BLOCK
      ?auto_362204 - BLOCK
      ?auto_362205 - BLOCK
    )
    :vars
    (
      ?auto_362206 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_362205 ?auto_362206 ) ( ON-TABLE ?auto_362196 ) ( not ( = ?auto_362196 ?auto_362197 ) ) ( not ( = ?auto_362196 ?auto_362198 ) ) ( not ( = ?auto_362196 ?auto_362199 ) ) ( not ( = ?auto_362196 ?auto_362200 ) ) ( not ( = ?auto_362196 ?auto_362201 ) ) ( not ( = ?auto_362196 ?auto_362202 ) ) ( not ( = ?auto_362196 ?auto_362203 ) ) ( not ( = ?auto_362196 ?auto_362204 ) ) ( not ( = ?auto_362196 ?auto_362205 ) ) ( not ( = ?auto_362196 ?auto_362206 ) ) ( not ( = ?auto_362197 ?auto_362198 ) ) ( not ( = ?auto_362197 ?auto_362199 ) ) ( not ( = ?auto_362197 ?auto_362200 ) ) ( not ( = ?auto_362197 ?auto_362201 ) ) ( not ( = ?auto_362197 ?auto_362202 ) ) ( not ( = ?auto_362197 ?auto_362203 ) ) ( not ( = ?auto_362197 ?auto_362204 ) ) ( not ( = ?auto_362197 ?auto_362205 ) ) ( not ( = ?auto_362197 ?auto_362206 ) ) ( not ( = ?auto_362198 ?auto_362199 ) ) ( not ( = ?auto_362198 ?auto_362200 ) ) ( not ( = ?auto_362198 ?auto_362201 ) ) ( not ( = ?auto_362198 ?auto_362202 ) ) ( not ( = ?auto_362198 ?auto_362203 ) ) ( not ( = ?auto_362198 ?auto_362204 ) ) ( not ( = ?auto_362198 ?auto_362205 ) ) ( not ( = ?auto_362198 ?auto_362206 ) ) ( not ( = ?auto_362199 ?auto_362200 ) ) ( not ( = ?auto_362199 ?auto_362201 ) ) ( not ( = ?auto_362199 ?auto_362202 ) ) ( not ( = ?auto_362199 ?auto_362203 ) ) ( not ( = ?auto_362199 ?auto_362204 ) ) ( not ( = ?auto_362199 ?auto_362205 ) ) ( not ( = ?auto_362199 ?auto_362206 ) ) ( not ( = ?auto_362200 ?auto_362201 ) ) ( not ( = ?auto_362200 ?auto_362202 ) ) ( not ( = ?auto_362200 ?auto_362203 ) ) ( not ( = ?auto_362200 ?auto_362204 ) ) ( not ( = ?auto_362200 ?auto_362205 ) ) ( not ( = ?auto_362200 ?auto_362206 ) ) ( not ( = ?auto_362201 ?auto_362202 ) ) ( not ( = ?auto_362201 ?auto_362203 ) ) ( not ( = ?auto_362201 ?auto_362204 ) ) ( not ( = ?auto_362201 ?auto_362205 ) ) ( not ( = ?auto_362201 ?auto_362206 ) ) ( not ( = ?auto_362202 ?auto_362203 ) ) ( not ( = ?auto_362202 ?auto_362204 ) ) ( not ( = ?auto_362202 ?auto_362205 ) ) ( not ( = ?auto_362202 ?auto_362206 ) ) ( not ( = ?auto_362203 ?auto_362204 ) ) ( not ( = ?auto_362203 ?auto_362205 ) ) ( not ( = ?auto_362203 ?auto_362206 ) ) ( not ( = ?auto_362204 ?auto_362205 ) ) ( not ( = ?auto_362204 ?auto_362206 ) ) ( not ( = ?auto_362205 ?auto_362206 ) ) ( ON ?auto_362204 ?auto_362205 ) ( ON ?auto_362203 ?auto_362204 ) ( ON ?auto_362202 ?auto_362203 ) ( ON ?auto_362201 ?auto_362202 ) ( ON ?auto_362200 ?auto_362201 ) ( ON ?auto_362199 ?auto_362200 ) ( ON ?auto_362198 ?auto_362199 ) ( CLEAR ?auto_362196 ) ( ON ?auto_362197 ?auto_362198 ) ( CLEAR ?auto_362197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_362196 ?auto_362197 )
      ( MAKE-10PILE ?auto_362196 ?auto_362197 ?auto_362198 ?auto_362199 ?auto_362200 ?auto_362201 ?auto_362202 ?auto_362203 ?auto_362204 ?auto_362205 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_362238 - BLOCK
      ?auto_362239 - BLOCK
      ?auto_362240 - BLOCK
      ?auto_362241 - BLOCK
      ?auto_362242 - BLOCK
      ?auto_362243 - BLOCK
      ?auto_362244 - BLOCK
      ?auto_362245 - BLOCK
      ?auto_362246 - BLOCK
      ?auto_362247 - BLOCK
    )
    :vars
    (
      ?auto_362248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_362247 ?auto_362248 ) ( not ( = ?auto_362238 ?auto_362239 ) ) ( not ( = ?auto_362238 ?auto_362240 ) ) ( not ( = ?auto_362238 ?auto_362241 ) ) ( not ( = ?auto_362238 ?auto_362242 ) ) ( not ( = ?auto_362238 ?auto_362243 ) ) ( not ( = ?auto_362238 ?auto_362244 ) ) ( not ( = ?auto_362238 ?auto_362245 ) ) ( not ( = ?auto_362238 ?auto_362246 ) ) ( not ( = ?auto_362238 ?auto_362247 ) ) ( not ( = ?auto_362238 ?auto_362248 ) ) ( not ( = ?auto_362239 ?auto_362240 ) ) ( not ( = ?auto_362239 ?auto_362241 ) ) ( not ( = ?auto_362239 ?auto_362242 ) ) ( not ( = ?auto_362239 ?auto_362243 ) ) ( not ( = ?auto_362239 ?auto_362244 ) ) ( not ( = ?auto_362239 ?auto_362245 ) ) ( not ( = ?auto_362239 ?auto_362246 ) ) ( not ( = ?auto_362239 ?auto_362247 ) ) ( not ( = ?auto_362239 ?auto_362248 ) ) ( not ( = ?auto_362240 ?auto_362241 ) ) ( not ( = ?auto_362240 ?auto_362242 ) ) ( not ( = ?auto_362240 ?auto_362243 ) ) ( not ( = ?auto_362240 ?auto_362244 ) ) ( not ( = ?auto_362240 ?auto_362245 ) ) ( not ( = ?auto_362240 ?auto_362246 ) ) ( not ( = ?auto_362240 ?auto_362247 ) ) ( not ( = ?auto_362240 ?auto_362248 ) ) ( not ( = ?auto_362241 ?auto_362242 ) ) ( not ( = ?auto_362241 ?auto_362243 ) ) ( not ( = ?auto_362241 ?auto_362244 ) ) ( not ( = ?auto_362241 ?auto_362245 ) ) ( not ( = ?auto_362241 ?auto_362246 ) ) ( not ( = ?auto_362241 ?auto_362247 ) ) ( not ( = ?auto_362241 ?auto_362248 ) ) ( not ( = ?auto_362242 ?auto_362243 ) ) ( not ( = ?auto_362242 ?auto_362244 ) ) ( not ( = ?auto_362242 ?auto_362245 ) ) ( not ( = ?auto_362242 ?auto_362246 ) ) ( not ( = ?auto_362242 ?auto_362247 ) ) ( not ( = ?auto_362242 ?auto_362248 ) ) ( not ( = ?auto_362243 ?auto_362244 ) ) ( not ( = ?auto_362243 ?auto_362245 ) ) ( not ( = ?auto_362243 ?auto_362246 ) ) ( not ( = ?auto_362243 ?auto_362247 ) ) ( not ( = ?auto_362243 ?auto_362248 ) ) ( not ( = ?auto_362244 ?auto_362245 ) ) ( not ( = ?auto_362244 ?auto_362246 ) ) ( not ( = ?auto_362244 ?auto_362247 ) ) ( not ( = ?auto_362244 ?auto_362248 ) ) ( not ( = ?auto_362245 ?auto_362246 ) ) ( not ( = ?auto_362245 ?auto_362247 ) ) ( not ( = ?auto_362245 ?auto_362248 ) ) ( not ( = ?auto_362246 ?auto_362247 ) ) ( not ( = ?auto_362246 ?auto_362248 ) ) ( not ( = ?auto_362247 ?auto_362248 ) ) ( ON ?auto_362246 ?auto_362247 ) ( ON ?auto_362245 ?auto_362246 ) ( ON ?auto_362244 ?auto_362245 ) ( ON ?auto_362243 ?auto_362244 ) ( ON ?auto_362242 ?auto_362243 ) ( ON ?auto_362241 ?auto_362242 ) ( ON ?auto_362240 ?auto_362241 ) ( ON ?auto_362239 ?auto_362240 ) ( ON ?auto_362238 ?auto_362239 ) ( CLEAR ?auto_362238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_362238 )
      ( MAKE-10PILE ?auto_362238 ?auto_362239 ?auto_362240 ?auto_362241 ?auto_362242 ?auto_362243 ?auto_362244 ?auto_362245 ?auto_362246 ?auto_362247 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_362281 - BLOCK
      ?auto_362282 - BLOCK
      ?auto_362283 - BLOCK
      ?auto_362284 - BLOCK
      ?auto_362285 - BLOCK
      ?auto_362286 - BLOCK
      ?auto_362287 - BLOCK
      ?auto_362288 - BLOCK
      ?auto_362289 - BLOCK
      ?auto_362290 - BLOCK
      ?auto_362291 - BLOCK
    )
    :vars
    (
      ?auto_362292 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_362290 ) ( ON ?auto_362291 ?auto_362292 ) ( CLEAR ?auto_362291 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_362281 ) ( ON ?auto_362282 ?auto_362281 ) ( ON ?auto_362283 ?auto_362282 ) ( ON ?auto_362284 ?auto_362283 ) ( ON ?auto_362285 ?auto_362284 ) ( ON ?auto_362286 ?auto_362285 ) ( ON ?auto_362287 ?auto_362286 ) ( ON ?auto_362288 ?auto_362287 ) ( ON ?auto_362289 ?auto_362288 ) ( ON ?auto_362290 ?auto_362289 ) ( not ( = ?auto_362281 ?auto_362282 ) ) ( not ( = ?auto_362281 ?auto_362283 ) ) ( not ( = ?auto_362281 ?auto_362284 ) ) ( not ( = ?auto_362281 ?auto_362285 ) ) ( not ( = ?auto_362281 ?auto_362286 ) ) ( not ( = ?auto_362281 ?auto_362287 ) ) ( not ( = ?auto_362281 ?auto_362288 ) ) ( not ( = ?auto_362281 ?auto_362289 ) ) ( not ( = ?auto_362281 ?auto_362290 ) ) ( not ( = ?auto_362281 ?auto_362291 ) ) ( not ( = ?auto_362281 ?auto_362292 ) ) ( not ( = ?auto_362282 ?auto_362283 ) ) ( not ( = ?auto_362282 ?auto_362284 ) ) ( not ( = ?auto_362282 ?auto_362285 ) ) ( not ( = ?auto_362282 ?auto_362286 ) ) ( not ( = ?auto_362282 ?auto_362287 ) ) ( not ( = ?auto_362282 ?auto_362288 ) ) ( not ( = ?auto_362282 ?auto_362289 ) ) ( not ( = ?auto_362282 ?auto_362290 ) ) ( not ( = ?auto_362282 ?auto_362291 ) ) ( not ( = ?auto_362282 ?auto_362292 ) ) ( not ( = ?auto_362283 ?auto_362284 ) ) ( not ( = ?auto_362283 ?auto_362285 ) ) ( not ( = ?auto_362283 ?auto_362286 ) ) ( not ( = ?auto_362283 ?auto_362287 ) ) ( not ( = ?auto_362283 ?auto_362288 ) ) ( not ( = ?auto_362283 ?auto_362289 ) ) ( not ( = ?auto_362283 ?auto_362290 ) ) ( not ( = ?auto_362283 ?auto_362291 ) ) ( not ( = ?auto_362283 ?auto_362292 ) ) ( not ( = ?auto_362284 ?auto_362285 ) ) ( not ( = ?auto_362284 ?auto_362286 ) ) ( not ( = ?auto_362284 ?auto_362287 ) ) ( not ( = ?auto_362284 ?auto_362288 ) ) ( not ( = ?auto_362284 ?auto_362289 ) ) ( not ( = ?auto_362284 ?auto_362290 ) ) ( not ( = ?auto_362284 ?auto_362291 ) ) ( not ( = ?auto_362284 ?auto_362292 ) ) ( not ( = ?auto_362285 ?auto_362286 ) ) ( not ( = ?auto_362285 ?auto_362287 ) ) ( not ( = ?auto_362285 ?auto_362288 ) ) ( not ( = ?auto_362285 ?auto_362289 ) ) ( not ( = ?auto_362285 ?auto_362290 ) ) ( not ( = ?auto_362285 ?auto_362291 ) ) ( not ( = ?auto_362285 ?auto_362292 ) ) ( not ( = ?auto_362286 ?auto_362287 ) ) ( not ( = ?auto_362286 ?auto_362288 ) ) ( not ( = ?auto_362286 ?auto_362289 ) ) ( not ( = ?auto_362286 ?auto_362290 ) ) ( not ( = ?auto_362286 ?auto_362291 ) ) ( not ( = ?auto_362286 ?auto_362292 ) ) ( not ( = ?auto_362287 ?auto_362288 ) ) ( not ( = ?auto_362287 ?auto_362289 ) ) ( not ( = ?auto_362287 ?auto_362290 ) ) ( not ( = ?auto_362287 ?auto_362291 ) ) ( not ( = ?auto_362287 ?auto_362292 ) ) ( not ( = ?auto_362288 ?auto_362289 ) ) ( not ( = ?auto_362288 ?auto_362290 ) ) ( not ( = ?auto_362288 ?auto_362291 ) ) ( not ( = ?auto_362288 ?auto_362292 ) ) ( not ( = ?auto_362289 ?auto_362290 ) ) ( not ( = ?auto_362289 ?auto_362291 ) ) ( not ( = ?auto_362289 ?auto_362292 ) ) ( not ( = ?auto_362290 ?auto_362291 ) ) ( not ( = ?auto_362290 ?auto_362292 ) ) ( not ( = ?auto_362291 ?auto_362292 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_362291 ?auto_362292 )
      ( !STACK ?auto_362291 ?auto_362290 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_362327 - BLOCK
      ?auto_362328 - BLOCK
      ?auto_362329 - BLOCK
      ?auto_362330 - BLOCK
      ?auto_362331 - BLOCK
      ?auto_362332 - BLOCK
      ?auto_362333 - BLOCK
      ?auto_362334 - BLOCK
      ?auto_362335 - BLOCK
      ?auto_362336 - BLOCK
      ?auto_362337 - BLOCK
    )
    :vars
    (
      ?auto_362338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_362337 ?auto_362338 ) ( ON-TABLE ?auto_362327 ) ( ON ?auto_362328 ?auto_362327 ) ( ON ?auto_362329 ?auto_362328 ) ( ON ?auto_362330 ?auto_362329 ) ( ON ?auto_362331 ?auto_362330 ) ( ON ?auto_362332 ?auto_362331 ) ( ON ?auto_362333 ?auto_362332 ) ( ON ?auto_362334 ?auto_362333 ) ( ON ?auto_362335 ?auto_362334 ) ( not ( = ?auto_362327 ?auto_362328 ) ) ( not ( = ?auto_362327 ?auto_362329 ) ) ( not ( = ?auto_362327 ?auto_362330 ) ) ( not ( = ?auto_362327 ?auto_362331 ) ) ( not ( = ?auto_362327 ?auto_362332 ) ) ( not ( = ?auto_362327 ?auto_362333 ) ) ( not ( = ?auto_362327 ?auto_362334 ) ) ( not ( = ?auto_362327 ?auto_362335 ) ) ( not ( = ?auto_362327 ?auto_362336 ) ) ( not ( = ?auto_362327 ?auto_362337 ) ) ( not ( = ?auto_362327 ?auto_362338 ) ) ( not ( = ?auto_362328 ?auto_362329 ) ) ( not ( = ?auto_362328 ?auto_362330 ) ) ( not ( = ?auto_362328 ?auto_362331 ) ) ( not ( = ?auto_362328 ?auto_362332 ) ) ( not ( = ?auto_362328 ?auto_362333 ) ) ( not ( = ?auto_362328 ?auto_362334 ) ) ( not ( = ?auto_362328 ?auto_362335 ) ) ( not ( = ?auto_362328 ?auto_362336 ) ) ( not ( = ?auto_362328 ?auto_362337 ) ) ( not ( = ?auto_362328 ?auto_362338 ) ) ( not ( = ?auto_362329 ?auto_362330 ) ) ( not ( = ?auto_362329 ?auto_362331 ) ) ( not ( = ?auto_362329 ?auto_362332 ) ) ( not ( = ?auto_362329 ?auto_362333 ) ) ( not ( = ?auto_362329 ?auto_362334 ) ) ( not ( = ?auto_362329 ?auto_362335 ) ) ( not ( = ?auto_362329 ?auto_362336 ) ) ( not ( = ?auto_362329 ?auto_362337 ) ) ( not ( = ?auto_362329 ?auto_362338 ) ) ( not ( = ?auto_362330 ?auto_362331 ) ) ( not ( = ?auto_362330 ?auto_362332 ) ) ( not ( = ?auto_362330 ?auto_362333 ) ) ( not ( = ?auto_362330 ?auto_362334 ) ) ( not ( = ?auto_362330 ?auto_362335 ) ) ( not ( = ?auto_362330 ?auto_362336 ) ) ( not ( = ?auto_362330 ?auto_362337 ) ) ( not ( = ?auto_362330 ?auto_362338 ) ) ( not ( = ?auto_362331 ?auto_362332 ) ) ( not ( = ?auto_362331 ?auto_362333 ) ) ( not ( = ?auto_362331 ?auto_362334 ) ) ( not ( = ?auto_362331 ?auto_362335 ) ) ( not ( = ?auto_362331 ?auto_362336 ) ) ( not ( = ?auto_362331 ?auto_362337 ) ) ( not ( = ?auto_362331 ?auto_362338 ) ) ( not ( = ?auto_362332 ?auto_362333 ) ) ( not ( = ?auto_362332 ?auto_362334 ) ) ( not ( = ?auto_362332 ?auto_362335 ) ) ( not ( = ?auto_362332 ?auto_362336 ) ) ( not ( = ?auto_362332 ?auto_362337 ) ) ( not ( = ?auto_362332 ?auto_362338 ) ) ( not ( = ?auto_362333 ?auto_362334 ) ) ( not ( = ?auto_362333 ?auto_362335 ) ) ( not ( = ?auto_362333 ?auto_362336 ) ) ( not ( = ?auto_362333 ?auto_362337 ) ) ( not ( = ?auto_362333 ?auto_362338 ) ) ( not ( = ?auto_362334 ?auto_362335 ) ) ( not ( = ?auto_362334 ?auto_362336 ) ) ( not ( = ?auto_362334 ?auto_362337 ) ) ( not ( = ?auto_362334 ?auto_362338 ) ) ( not ( = ?auto_362335 ?auto_362336 ) ) ( not ( = ?auto_362335 ?auto_362337 ) ) ( not ( = ?auto_362335 ?auto_362338 ) ) ( not ( = ?auto_362336 ?auto_362337 ) ) ( not ( = ?auto_362336 ?auto_362338 ) ) ( not ( = ?auto_362337 ?auto_362338 ) ) ( CLEAR ?auto_362335 ) ( ON ?auto_362336 ?auto_362337 ) ( CLEAR ?auto_362336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_362327 ?auto_362328 ?auto_362329 ?auto_362330 ?auto_362331 ?auto_362332 ?auto_362333 ?auto_362334 ?auto_362335 ?auto_362336 )
      ( MAKE-11PILE ?auto_362327 ?auto_362328 ?auto_362329 ?auto_362330 ?auto_362331 ?auto_362332 ?auto_362333 ?auto_362334 ?auto_362335 ?auto_362336 ?auto_362337 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_362373 - BLOCK
      ?auto_362374 - BLOCK
      ?auto_362375 - BLOCK
      ?auto_362376 - BLOCK
      ?auto_362377 - BLOCK
      ?auto_362378 - BLOCK
      ?auto_362379 - BLOCK
      ?auto_362380 - BLOCK
      ?auto_362381 - BLOCK
      ?auto_362382 - BLOCK
      ?auto_362383 - BLOCK
    )
    :vars
    (
      ?auto_362384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_362383 ?auto_362384 ) ( ON-TABLE ?auto_362373 ) ( ON ?auto_362374 ?auto_362373 ) ( ON ?auto_362375 ?auto_362374 ) ( ON ?auto_362376 ?auto_362375 ) ( ON ?auto_362377 ?auto_362376 ) ( ON ?auto_362378 ?auto_362377 ) ( ON ?auto_362379 ?auto_362378 ) ( ON ?auto_362380 ?auto_362379 ) ( not ( = ?auto_362373 ?auto_362374 ) ) ( not ( = ?auto_362373 ?auto_362375 ) ) ( not ( = ?auto_362373 ?auto_362376 ) ) ( not ( = ?auto_362373 ?auto_362377 ) ) ( not ( = ?auto_362373 ?auto_362378 ) ) ( not ( = ?auto_362373 ?auto_362379 ) ) ( not ( = ?auto_362373 ?auto_362380 ) ) ( not ( = ?auto_362373 ?auto_362381 ) ) ( not ( = ?auto_362373 ?auto_362382 ) ) ( not ( = ?auto_362373 ?auto_362383 ) ) ( not ( = ?auto_362373 ?auto_362384 ) ) ( not ( = ?auto_362374 ?auto_362375 ) ) ( not ( = ?auto_362374 ?auto_362376 ) ) ( not ( = ?auto_362374 ?auto_362377 ) ) ( not ( = ?auto_362374 ?auto_362378 ) ) ( not ( = ?auto_362374 ?auto_362379 ) ) ( not ( = ?auto_362374 ?auto_362380 ) ) ( not ( = ?auto_362374 ?auto_362381 ) ) ( not ( = ?auto_362374 ?auto_362382 ) ) ( not ( = ?auto_362374 ?auto_362383 ) ) ( not ( = ?auto_362374 ?auto_362384 ) ) ( not ( = ?auto_362375 ?auto_362376 ) ) ( not ( = ?auto_362375 ?auto_362377 ) ) ( not ( = ?auto_362375 ?auto_362378 ) ) ( not ( = ?auto_362375 ?auto_362379 ) ) ( not ( = ?auto_362375 ?auto_362380 ) ) ( not ( = ?auto_362375 ?auto_362381 ) ) ( not ( = ?auto_362375 ?auto_362382 ) ) ( not ( = ?auto_362375 ?auto_362383 ) ) ( not ( = ?auto_362375 ?auto_362384 ) ) ( not ( = ?auto_362376 ?auto_362377 ) ) ( not ( = ?auto_362376 ?auto_362378 ) ) ( not ( = ?auto_362376 ?auto_362379 ) ) ( not ( = ?auto_362376 ?auto_362380 ) ) ( not ( = ?auto_362376 ?auto_362381 ) ) ( not ( = ?auto_362376 ?auto_362382 ) ) ( not ( = ?auto_362376 ?auto_362383 ) ) ( not ( = ?auto_362376 ?auto_362384 ) ) ( not ( = ?auto_362377 ?auto_362378 ) ) ( not ( = ?auto_362377 ?auto_362379 ) ) ( not ( = ?auto_362377 ?auto_362380 ) ) ( not ( = ?auto_362377 ?auto_362381 ) ) ( not ( = ?auto_362377 ?auto_362382 ) ) ( not ( = ?auto_362377 ?auto_362383 ) ) ( not ( = ?auto_362377 ?auto_362384 ) ) ( not ( = ?auto_362378 ?auto_362379 ) ) ( not ( = ?auto_362378 ?auto_362380 ) ) ( not ( = ?auto_362378 ?auto_362381 ) ) ( not ( = ?auto_362378 ?auto_362382 ) ) ( not ( = ?auto_362378 ?auto_362383 ) ) ( not ( = ?auto_362378 ?auto_362384 ) ) ( not ( = ?auto_362379 ?auto_362380 ) ) ( not ( = ?auto_362379 ?auto_362381 ) ) ( not ( = ?auto_362379 ?auto_362382 ) ) ( not ( = ?auto_362379 ?auto_362383 ) ) ( not ( = ?auto_362379 ?auto_362384 ) ) ( not ( = ?auto_362380 ?auto_362381 ) ) ( not ( = ?auto_362380 ?auto_362382 ) ) ( not ( = ?auto_362380 ?auto_362383 ) ) ( not ( = ?auto_362380 ?auto_362384 ) ) ( not ( = ?auto_362381 ?auto_362382 ) ) ( not ( = ?auto_362381 ?auto_362383 ) ) ( not ( = ?auto_362381 ?auto_362384 ) ) ( not ( = ?auto_362382 ?auto_362383 ) ) ( not ( = ?auto_362382 ?auto_362384 ) ) ( not ( = ?auto_362383 ?auto_362384 ) ) ( ON ?auto_362382 ?auto_362383 ) ( CLEAR ?auto_362380 ) ( ON ?auto_362381 ?auto_362382 ) ( CLEAR ?auto_362381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_362373 ?auto_362374 ?auto_362375 ?auto_362376 ?auto_362377 ?auto_362378 ?auto_362379 ?auto_362380 ?auto_362381 )
      ( MAKE-11PILE ?auto_362373 ?auto_362374 ?auto_362375 ?auto_362376 ?auto_362377 ?auto_362378 ?auto_362379 ?auto_362380 ?auto_362381 ?auto_362382 ?auto_362383 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_362419 - BLOCK
      ?auto_362420 - BLOCK
      ?auto_362421 - BLOCK
      ?auto_362422 - BLOCK
      ?auto_362423 - BLOCK
      ?auto_362424 - BLOCK
      ?auto_362425 - BLOCK
      ?auto_362426 - BLOCK
      ?auto_362427 - BLOCK
      ?auto_362428 - BLOCK
      ?auto_362429 - BLOCK
    )
    :vars
    (
      ?auto_362430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_362429 ?auto_362430 ) ( ON-TABLE ?auto_362419 ) ( ON ?auto_362420 ?auto_362419 ) ( ON ?auto_362421 ?auto_362420 ) ( ON ?auto_362422 ?auto_362421 ) ( ON ?auto_362423 ?auto_362422 ) ( ON ?auto_362424 ?auto_362423 ) ( ON ?auto_362425 ?auto_362424 ) ( not ( = ?auto_362419 ?auto_362420 ) ) ( not ( = ?auto_362419 ?auto_362421 ) ) ( not ( = ?auto_362419 ?auto_362422 ) ) ( not ( = ?auto_362419 ?auto_362423 ) ) ( not ( = ?auto_362419 ?auto_362424 ) ) ( not ( = ?auto_362419 ?auto_362425 ) ) ( not ( = ?auto_362419 ?auto_362426 ) ) ( not ( = ?auto_362419 ?auto_362427 ) ) ( not ( = ?auto_362419 ?auto_362428 ) ) ( not ( = ?auto_362419 ?auto_362429 ) ) ( not ( = ?auto_362419 ?auto_362430 ) ) ( not ( = ?auto_362420 ?auto_362421 ) ) ( not ( = ?auto_362420 ?auto_362422 ) ) ( not ( = ?auto_362420 ?auto_362423 ) ) ( not ( = ?auto_362420 ?auto_362424 ) ) ( not ( = ?auto_362420 ?auto_362425 ) ) ( not ( = ?auto_362420 ?auto_362426 ) ) ( not ( = ?auto_362420 ?auto_362427 ) ) ( not ( = ?auto_362420 ?auto_362428 ) ) ( not ( = ?auto_362420 ?auto_362429 ) ) ( not ( = ?auto_362420 ?auto_362430 ) ) ( not ( = ?auto_362421 ?auto_362422 ) ) ( not ( = ?auto_362421 ?auto_362423 ) ) ( not ( = ?auto_362421 ?auto_362424 ) ) ( not ( = ?auto_362421 ?auto_362425 ) ) ( not ( = ?auto_362421 ?auto_362426 ) ) ( not ( = ?auto_362421 ?auto_362427 ) ) ( not ( = ?auto_362421 ?auto_362428 ) ) ( not ( = ?auto_362421 ?auto_362429 ) ) ( not ( = ?auto_362421 ?auto_362430 ) ) ( not ( = ?auto_362422 ?auto_362423 ) ) ( not ( = ?auto_362422 ?auto_362424 ) ) ( not ( = ?auto_362422 ?auto_362425 ) ) ( not ( = ?auto_362422 ?auto_362426 ) ) ( not ( = ?auto_362422 ?auto_362427 ) ) ( not ( = ?auto_362422 ?auto_362428 ) ) ( not ( = ?auto_362422 ?auto_362429 ) ) ( not ( = ?auto_362422 ?auto_362430 ) ) ( not ( = ?auto_362423 ?auto_362424 ) ) ( not ( = ?auto_362423 ?auto_362425 ) ) ( not ( = ?auto_362423 ?auto_362426 ) ) ( not ( = ?auto_362423 ?auto_362427 ) ) ( not ( = ?auto_362423 ?auto_362428 ) ) ( not ( = ?auto_362423 ?auto_362429 ) ) ( not ( = ?auto_362423 ?auto_362430 ) ) ( not ( = ?auto_362424 ?auto_362425 ) ) ( not ( = ?auto_362424 ?auto_362426 ) ) ( not ( = ?auto_362424 ?auto_362427 ) ) ( not ( = ?auto_362424 ?auto_362428 ) ) ( not ( = ?auto_362424 ?auto_362429 ) ) ( not ( = ?auto_362424 ?auto_362430 ) ) ( not ( = ?auto_362425 ?auto_362426 ) ) ( not ( = ?auto_362425 ?auto_362427 ) ) ( not ( = ?auto_362425 ?auto_362428 ) ) ( not ( = ?auto_362425 ?auto_362429 ) ) ( not ( = ?auto_362425 ?auto_362430 ) ) ( not ( = ?auto_362426 ?auto_362427 ) ) ( not ( = ?auto_362426 ?auto_362428 ) ) ( not ( = ?auto_362426 ?auto_362429 ) ) ( not ( = ?auto_362426 ?auto_362430 ) ) ( not ( = ?auto_362427 ?auto_362428 ) ) ( not ( = ?auto_362427 ?auto_362429 ) ) ( not ( = ?auto_362427 ?auto_362430 ) ) ( not ( = ?auto_362428 ?auto_362429 ) ) ( not ( = ?auto_362428 ?auto_362430 ) ) ( not ( = ?auto_362429 ?auto_362430 ) ) ( ON ?auto_362428 ?auto_362429 ) ( ON ?auto_362427 ?auto_362428 ) ( CLEAR ?auto_362425 ) ( ON ?auto_362426 ?auto_362427 ) ( CLEAR ?auto_362426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_362419 ?auto_362420 ?auto_362421 ?auto_362422 ?auto_362423 ?auto_362424 ?auto_362425 ?auto_362426 )
      ( MAKE-11PILE ?auto_362419 ?auto_362420 ?auto_362421 ?auto_362422 ?auto_362423 ?auto_362424 ?auto_362425 ?auto_362426 ?auto_362427 ?auto_362428 ?auto_362429 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_362465 - BLOCK
      ?auto_362466 - BLOCK
      ?auto_362467 - BLOCK
      ?auto_362468 - BLOCK
      ?auto_362469 - BLOCK
      ?auto_362470 - BLOCK
      ?auto_362471 - BLOCK
      ?auto_362472 - BLOCK
      ?auto_362473 - BLOCK
      ?auto_362474 - BLOCK
      ?auto_362475 - BLOCK
    )
    :vars
    (
      ?auto_362476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_362475 ?auto_362476 ) ( ON-TABLE ?auto_362465 ) ( ON ?auto_362466 ?auto_362465 ) ( ON ?auto_362467 ?auto_362466 ) ( ON ?auto_362468 ?auto_362467 ) ( ON ?auto_362469 ?auto_362468 ) ( ON ?auto_362470 ?auto_362469 ) ( not ( = ?auto_362465 ?auto_362466 ) ) ( not ( = ?auto_362465 ?auto_362467 ) ) ( not ( = ?auto_362465 ?auto_362468 ) ) ( not ( = ?auto_362465 ?auto_362469 ) ) ( not ( = ?auto_362465 ?auto_362470 ) ) ( not ( = ?auto_362465 ?auto_362471 ) ) ( not ( = ?auto_362465 ?auto_362472 ) ) ( not ( = ?auto_362465 ?auto_362473 ) ) ( not ( = ?auto_362465 ?auto_362474 ) ) ( not ( = ?auto_362465 ?auto_362475 ) ) ( not ( = ?auto_362465 ?auto_362476 ) ) ( not ( = ?auto_362466 ?auto_362467 ) ) ( not ( = ?auto_362466 ?auto_362468 ) ) ( not ( = ?auto_362466 ?auto_362469 ) ) ( not ( = ?auto_362466 ?auto_362470 ) ) ( not ( = ?auto_362466 ?auto_362471 ) ) ( not ( = ?auto_362466 ?auto_362472 ) ) ( not ( = ?auto_362466 ?auto_362473 ) ) ( not ( = ?auto_362466 ?auto_362474 ) ) ( not ( = ?auto_362466 ?auto_362475 ) ) ( not ( = ?auto_362466 ?auto_362476 ) ) ( not ( = ?auto_362467 ?auto_362468 ) ) ( not ( = ?auto_362467 ?auto_362469 ) ) ( not ( = ?auto_362467 ?auto_362470 ) ) ( not ( = ?auto_362467 ?auto_362471 ) ) ( not ( = ?auto_362467 ?auto_362472 ) ) ( not ( = ?auto_362467 ?auto_362473 ) ) ( not ( = ?auto_362467 ?auto_362474 ) ) ( not ( = ?auto_362467 ?auto_362475 ) ) ( not ( = ?auto_362467 ?auto_362476 ) ) ( not ( = ?auto_362468 ?auto_362469 ) ) ( not ( = ?auto_362468 ?auto_362470 ) ) ( not ( = ?auto_362468 ?auto_362471 ) ) ( not ( = ?auto_362468 ?auto_362472 ) ) ( not ( = ?auto_362468 ?auto_362473 ) ) ( not ( = ?auto_362468 ?auto_362474 ) ) ( not ( = ?auto_362468 ?auto_362475 ) ) ( not ( = ?auto_362468 ?auto_362476 ) ) ( not ( = ?auto_362469 ?auto_362470 ) ) ( not ( = ?auto_362469 ?auto_362471 ) ) ( not ( = ?auto_362469 ?auto_362472 ) ) ( not ( = ?auto_362469 ?auto_362473 ) ) ( not ( = ?auto_362469 ?auto_362474 ) ) ( not ( = ?auto_362469 ?auto_362475 ) ) ( not ( = ?auto_362469 ?auto_362476 ) ) ( not ( = ?auto_362470 ?auto_362471 ) ) ( not ( = ?auto_362470 ?auto_362472 ) ) ( not ( = ?auto_362470 ?auto_362473 ) ) ( not ( = ?auto_362470 ?auto_362474 ) ) ( not ( = ?auto_362470 ?auto_362475 ) ) ( not ( = ?auto_362470 ?auto_362476 ) ) ( not ( = ?auto_362471 ?auto_362472 ) ) ( not ( = ?auto_362471 ?auto_362473 ) ) ( not ( = ?auto_362471 ?auto_362474 ) ) ( not ( = ?auto_362471 ?auto_362475 ) ) ( not ( = ?auto_362471 ?auto_362476 ) ) ( not ( = ?auto_362472 ?auto_362473 ) ) ( not ( = ?auto_362472 ?auto_362474 ) ) ( not ( = ?auto_362472 ?auto_362475 ) ) ( not ( = ?auto_362472 ?auto_362476 ) ) ( not ( = ?auto_362473 ?auto_362474 ) ) ( not ( = ?auto_362473 ?auto_362475 ) ) ( not ( = ?auto_362473 ?auto_362476 ) ) ( not ( = ?auto_362474 ?auto_362475 ) ) ( not ( = ?auto_362474 ?auto_362476 ) ) ( not ( = ?auto_362475 ?auto_362476 ) ) ( ON ?auto_362474 ?auto_362475 ) ( ON ?auto_362473 ?auto_362474 ) ( ON ?auto_362472 ?auto_362473 ) ( CLEAR ?auto_362470 ) ( ON ?auto_362471 ?auto_362472 ) ( CLEAR ?auto_362471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_362465 ?auto_362466 ?auto_362467 ?auto_362468 ?auto_362469 ?auto_362470 ?auto_362471 )
      ( MAKE-11PILE ?auto_362465 ?auto_362466 ?auto_362467 ?auto_362468 ?auto_362469 ?auto_362470 ?auto_362471 ?auto_362472 ?auto_362473 ?auto_362474 ?auto_362475 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_362511 - BLOCK
      ?auto_362512 - BLOCK
      ?auto_362513 - BLOCK
      ?auto_362514 - BLOCK
      ?auto_362515 - BLOCK
      ?auto_362516 - BLOCK
      ?auto_362517 - BLOCK
      ?auto_362518 - BLOCK
      ?auto_362519 - BLOCK
      ?auto_362520 - BLOCK
      ?auto_362521 - BLOCK
    )
    :vars
    (
      ?auto_362522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_362521 ?auto_362522 ) ( ON-TABLE ?auto_362511 ) ( ON ?auto_362512 ?auto_362511 ) ( ON ?auto_362513 ?auto_362512 ) ( ON ?auto_362514 ?auto_362513 ) ( ON ?auto_362515 ?auto_362514 ) ( not ( = ?auto_362511 ?auto_362512 ) ) ( not ( = ?auto_362511 ?auto_362513 ) ) ( not ( = ?auto_362511 ?auto_362514 ) ) ( not ( = ?auto_362511 ?auto_362515 ) ) ( not ( = ?auto_362511 ?auto_362516 ) ) ( not ( = ?auto_362511 ?auto_362517 ) ) ( not ( = ?auto_362511 ?auto_362518 ) ) ( not ( = ?auto_362511 ?auto_362519 ) ) ( not ( = ?auto_362511 ?auto_362520 ) ) ( not ( = ?auto_362511 ?auto_362521 ) ) ( not ( = ?auto_362511 ?auto_362522 ) ) ( not ( = ?auto_362512 ?auto_362513 ) ) ( not ( = ?auto_362512 ?auto_362514 ) ) ( not ( = ?auto_362512 ?auto_362515 ) ) ( not ( = ?auto_362512 ?auto_362516 ) ) ( not ( = ?auto_362512 ?auto_362517 ) ) ( not ( = ?auto_362512 ?auto_362518 ) ) ( not ( = ?auto_362512 ?auto_362519 ) ) ( not ( = ?auto_362512 ?auto_362520 ) ) ( not ( = ?auto_362512 ?auto_362521 ) ) ( not ( = ?auto_362512 ?auto_362522 ) ) ( not ( = ?auto_362513 ?auto_362514 ) ) ( not ( = ?auto_362513 ?auto_362515 ) ) ( not ( = ?auto_362513 ?auto_362516 ) ) ( not ( = ?auto_362513 ?auto_362517 ) ) ( not ( = ?auto_362513 ?auto_362518 ) ) ( not ( = ?auto_362513 ?auto_362519 ) ) ( not ( = ?auto_362513 ?auto_362520 ) ) ( not ( = ?auto_362513 ?auto_362521 ) ) ( not ( = ?auto_362513 ?auto_362522 ) ) ( not ( = ?auto_362514 ?auto_362515 ) ) ( not ( = ?auto_362514 ?auto_362516 ) ) ( not ( = ?auto_362514 ?auto_362517 ) ) ( not ( = ?auto_362514 ?auto_362518 ) ) ( not ( = ?auto_362514 ?auto_362519 ) ) ( not ( = ?auto_362514 ?auto_362520 ) ) ( not ( = ?auto_362514 ?auto_362521 ) ) ( not ( = ?auto_362514 ?auto_362522 ) ) ( not ( = ?auto_362515 ?auto_362516 ) ) ( not ( = ?auto_362515 ?auto_362517 ) ) ( not ( = ?auto_362515 ?auto_362518 ) ) ( not ( = ?auto_362515 ?auto_362519 ) ) ( not ( = ?auto_362515 ?auto_362520 ) ) ( not ( = ?auto_362515 ?auto_362521 ) ) ( not ( = ?auto_362515 ?auto_362522 ) ) ( not ( = ?auto_362516 ?auto_362517 ) ) ( not ( = ?auto_362516 ?auto_362518 ) ) ( not ( = ?auto_362516 ?auto_362519 ) ) ( not ( = ?auto_362516 ?auto_362520 ) ) ( not ( = ?auto_362516 ?auto_362521 ) ) ( not ( = ?auto_362516 ?auto_362522 ) ) ( not ( = ?auto_362517 ?auto_362518 ) ) ( not ( = ?auto_362517 ?auto_362519 ) ) ( not ( = ?auto_362517 ?auto_362520 ) ) ( not ( = ?auto_362517 ?auto_362521 ) ) ( not ( = ?auto_362517 ?auto_362522 ) ) ( not ( = ?auto_362518 ?auto_362519 ) ) ( not ( = ?auto_362518 ?auto_362520 ) ) ( not ( = ?auto_362518 ?auto_362521 ) ) ( not ( = ?auto_362518 ?auto_362522 ) ) ( not ( = ?auto_362519 ?auto_362520 ) ) ( not ( = ?auto_362519 ?auto_362521 ) ) ( not ( = ?auto_362519 ?auto_362522 ) ) ( not ( = ?auto_362520 ?auto_362521 ) ) ( not ( = ?auto_362520 ?auto_362522 ) ) ( not ( = ?auto_362521 ?auto_362522 ) ) ( ON ?auto_362520 ?auto_362521 ) ( ON ?auto_362519 ?auto_362520 ) ( ON ?auto_362518 ?auto_362519 ) ( ON ?auto_362517 ?auto_362518 ) ( CLEAR ?auto_362515 ) ( ON ?auto_362516 ?auto_362517 ) ( CLEAR ?auto_362516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_362511 ?auto_362512 ?auto_362513 ?auto_362514 ?auto_362515 ?auto_362516 )
      ( MAKE-11PILE ?auto_362511 ?auto_362512 ?auto_362513 ?auto_362514 ?auto_362515 ?auto_362516 ?auto_362517 ?auto_362518 ?auto_362519 ?auto_362520 ?auto_362521 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_362557 - BLOCK
      ?auto_362558 - BLOCK
      ?auto_362559 - BLOCK
      ?auto_362560 - BLOCK
      ?auto_362561 - BLOCK
      ?auto_362562 - BLOCK
      ?auto_362563 - BLOCK
      ?auto_362564 - BLOCK
      ?auto_362565 - BLOCK
      ?auto_362566 - BLOCK
      ?auto_362567 - BLOCK
    )
    :vars
    (
      ?auto_362568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_362567 ?auto_362568 ) ( ON-TABLE ?auto_362557 ) ( ON ?auto_362558 ?auto_362557 ) ( ON ?auto_362559 ?auto_362558 ) ( ON ?auto_362560 ?auto_362559 ) ( not ( = ?auto_362557 ?auto_362558 ) ) ( not ( = ?auto_362557 ?auto_362559 ) ) ( not ( = ?auto_362557 ?auto_362560 ) ) ( not ( = ?auto_362557 ?auto_362561 ) ) ( not ( = ?auto_362557 ?auto_362562 ) ) ( not ( = ?auto_362557 ?auto_362563 ) ) ( not ( = ?auto_362557 ?auto_362564 ) ) ( not ( = ?auto_362557 ?auto_362565 ) ) ( not ( = ?auto_362557 ?auto_362566 ) ) ( not ( = ?auto_362557 ?auto_362567 ) ) ( not ( = ?auto_362557 ?auto_362568 ) ) ( not ( = ?auto_362558 ?auto_362559 ) ) ( not ( = ?auto_362558 ?auto_362560 ) ) ( not ( = ?auto_362558 ?auto_362561 ) ) ( not ( = ?auto_362558 ?auto_362562 ) ) ( not ( = ?auto_362558 ?auto_362563 ) ) ( not ( = ?auto_362558 ?auto_362564 ) ) ( not ( = ?auto_362558 ?auto_362565 ) ) ( not ( = ?auto_362558 ?auto_362566 ) ) ( not ( = ?auto_362558 ?auto_362567 ) ) ( not ( = ?auto_362558 ?auto_362568 ) ) ( not ( = ?auto_362559 ?auto_362560 ) ) ( not ( = ?auto_362559 ?auto_362561 ) ) ( not ( = ?auto_362559 ?auto_362562 ) ) ( not ( = ?auto_362559 ?auto_362563 ) ) ( not ( = ?auto_362559 ?auto_362564 ) ) ( not ( = ?auto_362559 ?auto_362565 ) ) ( not ( = ?auto_362559 ?auto_362566 ) ) ( not ( = ?auto_362559 ?auto_362567 ) ) ( not ( = ?auto_362559 ?auto_362568 ) ) ( not ( = ?auto_362560 ?auto_362561 ) ) ( not ( = ?auto_362560 ?auto_362562 ) ) ( not ( = ?auto_362560 ?auto_362563 ) ) ( not ( = ?auto_362560 ?auto_362564 ) ) ( not ( = ?auto_362560 ?auto_362565 ) ) ( not ( = ?auto_362560 ?auto_362566 ) ) ( not ( = ?auto_362560 ?auto_362567 ) ) ( not ( = ?auto_362560 ?auto_362568 ) ) ( not ( = ?auto_362561 ?auto_362562 ) ) ( not ( = ?auto_362561 ?auto_362563 ) ) ( not ( = ?auto_362561 ?auto_362564 ) ) ( not ( = ?auto_362561 ?auto_362565 ) ) ( not ( = ?auto_362561 ?auto_362566 ) ) ( not ( = ?auto_362561 ?auto_362567 ) ) ( not ( = ?auto_362561 ?auto_362568 ) ) ( not ( = ?auto_362562 ?auto_362563 ) ) ( not ( = ?auto_362562 ?auto_362564 ) ) ( not ( = ?auto_362562 ?auto_362565 ) ) ( not ( = ?auto_362562 ?auto_362566 ) ) ( not ( = ?auto_362562 ?auto_362567 ) ) ( not ( = ?auto_362562 ?auto_362568 ) ) ( not ( = ?auto_362563 ?auto_362564 ) ) ( not ( = ?auto_362563 ?auto_362565 ) ) ( not ( = ?auto_362563 ?auto_362566 ) ) ( not ( = ?auto_362563 ?auto_362567 ) ) ( not ( = ?auto_362563 ?auto_362568 ) ) ( not ( = ?auto_362564 ?auto_362565 ) ) ( not ( = ?auto_362564 ?auto_362566 ) ) ( not ( = ?auto_362564 ?auto_362567 ) ) ( not ( = ?auto_362564 ?auto_362568 ) ) ( not ( = ?auto_362565 ?auto_362566 ) ) ( not ( = ?auto_362565 ?auto_362567 ) ) ( not ( = ?auto_362565 ?auto_362568 ) ) ( not ( = ?auto_362566 ?auto_362567 ) ) ( not ( = ?auto_362566 ?auto_362568 ) ) ( not ( = ?auto_362567 ?auto_362568 ) ) ( ON ?auto_362566 ?auto_362567 ) ( ON ?auto_362565 ?auto_362566 ) ( ON ?auto_362564 ?auto_362565 ) ( ON ?auto_362563 ?auto_362564 ) ( ON ?auto_362562 ?auto_362563 ) ( CLEAR ?auto_362560 ) ( ON ?auto_362561 ?auto_362562 ) ( CLEAR ?auto_362561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_362557 ?auto_362558 ?auto_362559 ?auto_362560 ?auto_362561 )
      ( MAKE-11PILE ?auto_362557 ?auto_362558 ?auto_362559 ?auto_362560 ?auto_362561 ?auto_362562 ?auto_362563 ?auto_362564 ?auto_362565 ?auto_362566 ?auto_362567 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_362603 - BLOCK
      ?auto_362604 - BLOCK
      ?auto_362605 - BLOCK
      ?auto_362606 - BLOCK
      ?auto_362607 - BLOCK
      ?auto_362608 - BLOCK
      ?auto_362609 - BLOCK
      ?auto_362610 - BLOCK
      ?auto_362611 - BLOCK
      ?auto_362612 - BLOCK
      ?auto_362613 - BLOCK
    )
    :vars
    (
      ?auto_362614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_362613 ?auto_362614 ) ( ON-TABLE ?auto_362603 ) ( ON ?auto_362604 ?auto_362603 ) ( ON ?auto_362605 ?auto_362604 ) ( not ( = ?auto_362603 ?auto_362604 ) ) ( not ( = ?auto_362603 ?auto_362605 ) ) ( not ( = ?auto_362603 ?auto_362606 ) ) ( not ( = ?auto_362603 ?auto_362607 ) ) ( not ( = ?auto_362603 ?auto_362608 ) ) ( not ( = ?auto_362603 ?auto_362609 ) ) ( not ( = ?auto_362603 ?auto_362610 ) ) ( not ( = ?auto_362603 ?auto_362611 ) ) ( not ( = ?auto_362603 ?auto_362612 ) ) ( not ( = ?auto_362603 ?auto_362613 ) ) ( not ( = ?auto_362603 ?auto_362614 ) ) ( not ( = ?auto_362604 ?auto_362605 ) ) ( not ( = ?auto_362604 ?auto_362606 ) ) ( not ( = ?auto_362604 ?auto_362607 ) ) ( not ( = ?auto_362604 ?auto_362608 ) ) ( not ( = ?auto_362604 ?auto_362609 ) ) ( not ( = ?auto_362604 ?auto_362610 ) ) ( not ( = ?auto_362604 ?auto_362611 ) ) ( not ( = ?auto_362604 ?auto_362612 ) ) ( not ( = ?auto_362604 ?auto_362613 ) ) ( not ( = ?auto_362604 ?auto_362614 ) ) ( not ( = ?auto_362605 ?auto_362606 ) ) ( not ( = ?auto_362605 ?auto_362607 ) ) ( not ( = ?auto_362605 ?auto_362608 ) ) ( not ( = ?auto_362605 ?auto_362609 ) ) ( not ( = ?auto_362605 ?auto_362610 ) ) ( not ( = ?auto_362605 ?auto_362611 ) ) ( not ( = ?auto_362605 ?auto_362612 ) ) ( not ( = ?auto_362605 ?auto_362613 ) ) ( not ( = ?auto_362605 ?auto_362614 ) ) ( not ( = ?auto_362606 ?auto_362607 ) ) ( not ( = ?auto_362606 ?auto_362608 ) ) ( not ( = ?auto_362606 ?auto_362609 ) ) ( not ( = ?auto_362606 ?auto_362610 ) ) ( not ( = ?auto_362606 ?auto_362611 ) ) ( not ( = ?auto_362606 ?auto_362612 ) ) ( not ( = ?auto_362606 ?auto_362613 ) ) ( not ( = ?auto_362606 ?auto_362614 ) ) ( not ( = ?auto_362607 ?auto_362608 ) ) ( not ( = ?auto_362607 ?auto_362609 ) ) ( not ( = ?auto_362607 ?auto_362610 ) ) ( not ( = ?auto_362607 ?auto_362611 ) ) ( not ( = ?auto_362607 ?auto_362612 ) ) ( not ( = ?auto_362607 ?auto_362613 ) ) ( not ( = ?auto_362607 ?auto_362614 ) ) ( not ( = ?auto_362608 ?auto_362609 ) ) ( not ( = ?auto_362608 ?auto_362610 ) ) ( not ( = ?auto_362608 ?auto_362611 ) ) ( not ( = ?auto_362608 ?auto_362612 ) ) ( not ( = ?auto_362608 ?auto_362613 ) ) ( not ( = ?auto_362608 ?auto_362614 ) ) ( not ( = ?auto_362609 ?auto_362610 ) ) ( not ( = ?auto_362609 ?auto_362611 ) ) ( not ( = ?auto_362609 ?auto_362612 ) ) ( not ( = ?auto_362609 ?auto_362613 ) ) ( not ( = ?auto_362609 ?auto_362614 ) ) ( not ( = ?auto_362610 ?auto_362611 ) ) ( not ( = ?auto_362610 ?auto_362612 ) ) ( not ( = ?auto_362610 ?auto_362613 ) ) ( not ( = ?auto_362610 ?auto_362614 ) ) ( not ( = ?auto_362611 ?auto_362612 ) ) ( not ( = ?auto_362611 ?auto_362613 ) ) ( not ( = ?auto_362611 ?auto_362614 ) ) ( not ( = ?auto_362612 ?auto_362613 ) ) ( not ( = ?auto_362612 ?auto_362614 ) ) ( not ( = ?auto_362613 ?auto_362614 ) ) ( ON ?auto_362612 ?auto_362613 ) ( ON ?auto_362611 ?auto_362612 ) ( ON ?auto_362610 ?auto_362611 ) ( ON ?auto_362609 ?auto_362610 ) ( ON ?auto_362608 ?auto_362609 ) ( ON ?auto_362607 ?auto_362608 ) ( CLEAR ?auto_362605 ) ( ON ?auto_362606 ?auto_362607 ) ( CLEAR ?auto_362606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_362603 ?auto_362604 ?auto_362605 ?auto_362606 )
      ( MAKE-11PILE ?auto_362603 ?auto_362604 ?auto_362605 ?auto_362606 ?auto_362607 ?auto_362608 ?auto_362609 ?auto_362610 ?auto_362611 ?auto_362612 ?auto_362613 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_362649 - BLOCK
      ?auto_362650 - BLOCK
      ?auto_362651 - BLOCK
      ?auto_362652 - BLOCK
      ?auto_362653 - BLOCK
      ?auto_362654 - BLOCK
      ?auto_362655 - BLOCK
      ?auto_362656 - BLOCK
      ?auto_362657 - BLOCK
      ?auto_362658 - BLOCK
      ?auto_362659 - BLOCK
    )
    :vars
    (
      ?auto_362660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_362659 ?auto_362660 ) ( ON-TABLE ?auto_362649 ) ( ON ?auto_362650 ?auto_362649 ) ( not ( = ?auto_362649 ?auto_362650 ) ) ( not ( = ?auto_362649 ?auto_362651 ) ) ( not ( = ?auto_362649 ?auto_362652 ) ) ( not ( = ?auto_362649 ?auto_362653 ) ) ( not ( = ?auto_362649 ?auto_362654 ) ) ( not ( = ?auto_362649 ?auto_362655 ) ) ( not ( = ?auto_362649 ?auto_362656 ) ) ( not ( = ?auto_362649 ?auto_362657 ) ) ( not ( = ?auto_362649 ?auto_362658 ) ) ( not ( = ?auto_362649 ?auto_362659 ) ) ( not ( = ?auto_362649 ?auto_362660 ) ) ( not ( = ?auto_362650 ?auto_362651 ) ) ( not ( = ?auto_362650 ?auto_362652 ) ) ( not ( = ?auto_362650 ?auto_362653 ) ) ( not ( = ?auto_362650 ?auto_362654 ) ) ( not ( = ?auto_362650 ?auto_362655 ) ) ( not ( = ?auto_362650 ?auto_362656 ) ) ( not ( = ?auto_362650 ?auto_362657 ) ) ( not ( = ?auto_362650 ?auto_362658 ) ) ( not ( = ?auto_362650 ?auto_362659 ) ) ( not ( = ?auto_362650 ?auto_362660 ) ) ( not ( = ?auto_362651 ?auto_362652 ) ) ( not ( = ?auto_362651 ?auto_362653 ) ) ( not ( = ?auto_362651 ?auto_362654 ) ) ( not ( = ?auto_362651 ?auto_362655 ) ) ( not ( = ?auto_362651 ?auto_362656 ) ) ( not ( = ?auto_362651 ?auto_362657 ) ) ( not ( = ?auto_362651 ?auto_362658 ) ) ( not ( = ?auto_362651 ?auto_362659 ) ) ( not ( = ?auto_362651 ?auto_362660 ) ) ( not ( = ?auto_362652 ?auto_362653 ) ) ( not ( = ?auto_362652 ?auto_362654 ) ) ( not ( = ?auto_362652 ?auto_362655 ) ) ( not ( = ?auto_362652 ?auto_362656 ) ) ( not ( = ?auto_362652 ?auto_362657 ) ) ( not ( = ?auto_362652 ?auto_362658 ) ) ( not ( = ?auto_362652 ?auto_362659 ) ) ( not ( = ?auto_362652 ?auto_362660 ) ) ( not ( = ?auto_362653 ?auto_362654 ) ) ( not ( = ?auto_362653 ?auto_362655 ) ) ( not ( = ?auto_362653 ?auto_362656 ) ) ( not ( = ?auto_362653 ?auto_362657 ) ) ( not ( = ?auto_362653 ?auto_362658 ) ) ( not ( = ?auto_362653 ?auto_362659 ) ) ( not ( = ?auto_362653 ?auto_362660 ) ) ( not ( = ?auto_362654 ?auto_362655 ) ) ( not ( = ?auto_362654 ?auto_362656 ) ) ( not ( = ?auto_362654 ?auto_362657 ) ) ( not ( = ?auto_362654 ?auto_362658 ) ) ( not ( = ?auto_362654 ?auto_362659 ) ) ( not ( = ?auto_362654 ?auto_362660 ) ) ( not ( = ?auto_362655 ?auto_362656 ) ) ( not ( = ?auto_362655 ?auto_362657 ) ) ( not ( = ?auto_362655 ?auto_362658 ) ) ( not ( = ?auto_362655 ?auto_362659 ) ) ( not ( = ?auto_362655 ?auto_362660 ) ) ( not ( = ?auto_362656 ?auto_362657 ) ) ( not ( = ?auto_362656 ?auto_362658 ) ) ( not ( = ?auto_362656 ?auto_362659 ) ) ( not ( = ?auto_362656 ?auto_362660 ) ) ( not ( = ?auto_362657 ?auto_362658 ) ) ( not ( = ?auto_362657 ?auto_362659 ) ) ( not ( = ?auto_362657 ?auto_362660 ) ) ( not ( = ?auto_362658 ?auto_362659 ) ) ( not ( = ?auto_362658 ?auto_362660 ) ) ( not ( = ?auto_362659 ?auto_362660 ) ) ( ON ?auto_362658 ?auto_362659 ) ( ON ?auto_362657 ?auto_362658 ) ( ON ?auto_362656 ?auto_362657 ) ( ON ?auto_362655 ?auto_362656 ) ( ON ?auto_362654 ?auto_362655 ) ( ON ?auto_362653 ?auto_362654 ) ( ON ?auto_362652 ?auto_362653 ) ( CLEAR ?auto_362650 ) ( ON ?auto_362651 ?auto_362652 ) ( CLEAR ?auto_362651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_362649 ?auto_362650 ?auto_362651 )
      ( MAKE-11PILE ?auto_362649 ?auto_362650 ?auto_362651 ?auto_362652 ?auto_362653 ?auto_362654 ?auto_362655 ?auto_362656 ?auto_362657 ?auto_362658 ?auto_362659 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_362695 - BLOCK
      ?auto_362696 - BLOCK
      ?auto_362697 - BLOCK
      ?auto_362698 - BLOCK
      ?auto_362699 - BLOCK
      ?auto_362700 - BLOCK
      ?auto_362701 - BLOCK
      ?auto_362702 - BLOCK
      ?auto_362703 - BLOCK
      ?auto_362704 - BLOCK
      ?auto_362705 - BLOCK
    )
    :vars
    (
      ?auto_362706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_362705 ?auto_362706 ) ( ON-TABLE ?auto_362695 ) ( not ( = ?auto_362695 ?auto_362696 ) ) ( not ( = ?auto_362695 ?auto_362697 ) ) ( not ( = ?auto_362695 ?auto_362698 ) ) ( not ( = ?auto_362695 ?auto_362699 ) ) ( not ( = ?auto_362695 ?auto_362700 ) ) ( not ( = ?auto_362695 ?auto_362701 ) ) ( not ( = ?auto_362695 ?auto_362702 ) ) ( not ( = ?auto_362695 ?auto_362703 ) ) ( not ( = ?auto_362695 ?auto_362704 ) ) ( not ( = ?auto_362695 ?auto_362705 ) ) ( not ( = ?auto_362695 ?auto_362706 ) ) ( not ( = ?auto_362696 ?auto_362697 ) ) ( not ( = ?auto_362696 ?auto_362698 ) ) ( not ( = ?auto_362696 ?auto_362699 ) ) ( not ( = ?auto_362696 ?auto_362700 ) ) ( not ( = ?auto_362696 ?auto_362701 ) ) ( not ( = ?auto_362696 ?auto_362702 ) ) ( not ( = ?auto_362696 ?auto_362703 ) ) ( not ( = ?auto_362696 ?auto_362704 ) ) ( not ( = ?auto_362696 ?auto_362705 ) ) ( not ( = ?auto_362696 ?auto_362706 ) ) ( not ( = ?auto_362697 ?auto_362698 ) ) ( not ( = ?auto_362697 ?auto_362699 ) ) ( not ( = ?auto_362697 ?auto_362700 ) ) ( not ( = ?auto_362697 ?auto_362701 ) ) ( not ( = ?auto_362697 ?auto_362702 ) ) ( not ( = ?auto_362697 ?auto_362703 ) ) ( not ( = ?auto_362697 ?auto_362704 ) ) ( not ( = ?auto_362697 ?auto_362705 ) ) ( not ( = ?auto_362697 ?auto_362706 ) ) ( not ( = ?auto_362698 ?auto_362699 ) ) ( not ( = ?auto_362698 ?auto_362700 ) ) ( not ( = ?auto_362698 ?auto_362701 ) ) ( not ( = ?auto_362698 ?auto_362702 ) ) ( not ( = ?auto_362698 ?auto_362703 ) ) ( not ( = ?auto_362698 ?auto_362704 ) ) ( not ( = ?auto_362698 ?auto_362705 ) ) ( not ( = ?auto_362698 ?auto_362706 ) ) ( not ( = ?auto_362699 ?auto_362700 ) ) ( not ( = ?auto_362699 ?auto_362701 ) ) ( not ( = ?auto_362699 ?auto_362702 ) ) ( not ( = ?auto_362699 ?auto_362703 ) ) ( not ( = ?auto_362699 ?auto_362704 ) ) ( not ( = ?auto_362699 ?auto_362705 ) ) ( not ( = ?auto_362699 ?auto_362706 ) ) ( not ( = ?auto_362700 ?auto_362701 ) ) ( not ( = ?auto_362700 ?auto_362702 ) ) ( not ( = ?auto_362700 ?auto_362703 ) ) ( not ( = ?auto_362700 ?auto_362704 ) ) ( not ( = ?auto_362700 ?auto_362705 ) ) ( not ( = ?auto_362700 ?auto_362706 ) ) ( not ( = ?auto_362701 ?auto_362702 ) ) ( not ( = ?auto_362701 ?auto_362703 ) ) ( not ( = ?auto_362701 ?auto_362704 ) ) ( not ( = ?auto_362701 ?auto_362705 ) ) ( not ( = ?auto_362701 ?auto_362706 ) ) ( not ( = ?auto_362702 ?auto_362703 ) ) ( not ( = ?auto_362702 ?auto_362704 ) ) ( not ( = ?auto_362702 ?auto_362705 ) ) ( not ( = ?auto_362702 ?auto_362706 ) ) ( not ( = ?auto_362703 ?auto_362704 ) ) ( not ( = ?auto_362703 ?auto_362705 ) ) ( not ( = ?auto_362703 ?auto_362706 ) ) ( not ( = ?auto_362704 ?auto_362705 ) ) ( not ( = ?auto_362704 ?auto_362706 ) ) ( not ( = ?auto_362705 ?auto_362706 ) ) ( ON ?auto_362704 ?auto_362705 ) ( ON ?auto_362703 ?auto_362704 ) ( ON ?auto_362702 ?auto_362703 ) ( ON ?auto_362701 ?auto_362702 ) ( ON ?auto_362700 ?auto_362701 ) ( ON ?auto_362699 ?auto_362700 ) ( ON ?auto_362698 ?auto_362699 ) ( ON ?auto_362697 ?auto_362698 ) ( CLEAR ?auto_362695 ) ( ON ?auto_362696 ?auto_362697 ) ( CLEAR ?auto_362696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_362695 ?auto_362696 )
      ( MAKE-11PILE ?auto_362695 ?auto_362696 ?auto_362697 ?auto_362698 ?auto_362699 ?auto_362700 ?auto_362701 ?auto_362702 ?auto_362703 ?auto_362704 ?auto_362705 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_362741 - BLOCK
      ?auto_362742 - BLOCK
      ?auto_362743 - BLOCK
      ?auto_362744 - BLOCK
      ?auto_362745 - BLOCK
      ?auto_362746 - BLOCK
      ?auto_362747 - BLOCK
      ?auto_362748 - BLOCK
      ?auto_362749 - BLOCK
      ?auto_362750 - BLOCK
      ?auto_362751 - BLOCK
    )
    :vars
    (
      ?auto_362752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_362751 ?auto_362752 ) ( not ( = ?auto_362741 ?auto_362742 ) ) ( not ( = ?auto_362741 ?auto_362743 ) ) ( not ( = ?auto_362741 ?auto_362744 ) ) ( not ( = ?auto_362741 ?auto_362745 ) ) ( not ( = ?auto_362741 ?auto_362746 ) ) ( not ( = ?auto_362741 ?auto_362747 ) ) ( not ( = ?auto_362741 ?auto_362748 ) ) ( not ( = ?auto_362741 ?auto_362749 ) ) ( not ( = ?auto_362741 ?auto_362750 ) ) ( not ( = ?auto_362741 ?auto_362751 ) ) ( not ( = ?auto_362741 ?auto_362752 ) ) ( not ( = ?auto_362742 ?auto_362743 ) ) ( not ( = ?auto_362742 ?auto_362744 ) ) ( not ( = ?auto_362742 ?auto_362745 ) ) ( not ( = ?auto_362742 ?auto_362746 ) ) ( not ( = ?auto_362742 ?auto_362747 ) ) ( not ( = ?auto_362742 ?auto_362748 ) ) ( not ( = ?auto_362742 ?auto_362749 ) ) ( not ( = ?auto_362742 ?auto_362750 ) ) ( not ( = ?auto_362742 ?auto_362751 ) ) ( not ( = ?auto_362742 ?auto_362752 ) ) ( not ( = ?auto_362743 ?auto_362744 ) ) ( not ( = ?auto_362743 ?auto_362745 ) ) ( not ( = ?auto_362743 ?auto_362746 ) ) ( not ( = ?auto_362743 ?auto_362747 ) ) ( not ( = ?auto_362743 ?auto_362748 ) ) ( not ( = ?auto_362743 ?auto_362749 ) ) ( not ( = ?auto_362743 ?auto_362750 ) ) ( not ( = ?auto_362743 ?auto_362751 ) ) ( not ( = ?auto_362743 ?auto_362752 ) ) ( not ( = ?auto_362744 ?auto_362745 ) ) ( not ( = ?auto_362744 ?auto_362746 ) ) ( not ( = ?auto_362744 ?auto_362747 ) ) ( not ( = ?auto_362744 ?auto_362748 ) ) ( not ( = ?auto_362744 ?auto_362749 ) ) ( not ( = ?auto_362744 ?auto_362750 ) ) ( not ( = ?auto_362744 ?auto_362751 ) ) ( not ( = ?auto_362744 ?auto_362752 ) ) ( not ( = ?auto_362745 ?auto_362746 ) ) ( not ( = ?auto_362745 ?auto_362747 ) ) ( not ( = ?auto_362745 ?auto_362748 ) ) ( not ( = ?auto_362745 ?auto_362749 ) ) ( not ( = ?auto_362745 ?auto_362750 ) ) ( not ( = ?auto_362745 ?auto_362751 ) ) ( not ( = ?auto_362745 ?auto_362752 ) ) ( not ( = ?auto_362746 ?auto_362747 ) ) ( not ( = ?auto_362746 ?auto_362748 ) ) ( not ( = ?auto_362746 ?auto_362749 ) ) ( not ( = ?auto_362746 ?auto_362750 ) ) ( not ( = ?auto_362746 ?auto_362751 ) ) ( not ( = ?auto_362746 ?auto_362752 ) ) ( not ( = ?auto_362747 ?auto_362748 ) ) ( not ( = ?auto_362747 ?auto_362749 ) ) ( not ( = ?auto_362747 ?auto_362750 ) ) ( not ( = ?auto_362747 ?auto_362751 ) ) ( not ( = ?auto_362747 ?auto_362752 ) ) ( not ( = ?auto_362748 ?auto_362749 ) ) ( not ( = ?auto_362748 ?auto_362750 ) ) ( not ( = ?auto_362748 ?auto_362751 ) ) ( not ( = ?auto_362748 ?auto_362752 ) ) ( not ( = ?auto_362749 ?auto_362750 ) ) ( not ( = ?auto_362749 ?auto_362751 ) ) ( not ( = ?auto_362749 ?auto_362752 ) ) ( not ( = ?auto_362750 ?auto_362751 ) ) ( not ( = ?auto_362750 ?auto_362752 ) ) ( not ( = ?auto_362751 ?auto_362752 ) ) ( ON ?auto_362750 ?auto_362751 ) ( ON ?auto_362749 ?auto_362750 ) ( ON ?auto_362748 ?auto_362749 ) ( ON ?auto_362747 ?auto_362748 ) ( ON ?auto_362746 ?auto_362747 ) ( ON ?auto_362745 ?auto_362746 ) ( ON ?auto_362744 ?auto_362745 ) ( ON ?auto_362743 ?auto_362744 ) ( ON ?auto_362742 ?auto_362743 ) ( ON ?auto_362741 ?auto_362742 ) ( CLEAR ?auto_362741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_362741 )
      ( MAKE-11PILE ?auto_362741 ?auto_362742 ?auto_362743 ?auto_362744 ?auto_362745 ?auto_362746 ?auto_362747 ?auto_362748 ?auto_362749 ?auto_362750 ?auto_362751 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_362788 - BLOCK
      ?auto_362789 - BLOCK
      ?auto_362790 - BLOCK
      ?auto_362791 - BLOCK
      ?auto_362792 - BLOCK
      ?auto_362793 - BLOCK
      ?auto_362794 - BLOCK
      ?auto_362795 - BLOCK
      ?auto_362796 - BLOCK
      ?auto_362797 - BLOCK
      ?auto_362798 - BLOCK
      ?auto_362799 - BLOCK
    )
    :vars
    (
      ?auto_362800 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_362798 ) ( ON ?auto_362799 ?auto_362800 ) ( CLEAR ?auto_362799 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_362788 ) ( ON ?auto_362789 ?auto_362788 ) ( ON ?auto_362790 ?auto_362789 ) ( ON ?auto_362791 ?auto_362790 ) ( ON ?auto_362792 ?auto_362791 ) ( ON ?auto_362793 ?auto_362792 ) ( ON ?auto_362794 ?auto_362793 ) ( ON ?auto_362795 ?auto_362794 ) ( ON ?auto_362796 ?auto_362795 ) ( ON ?auto_362797 ?auto_362796 ) ( ON ?auto_362798 ?auto_362797 ) ( not ( = ?auto_362788 ?auto_362789 ) ) ( not ( = ?auto_362788 ?auto_362790 ) ) ( not ( = ?auto_362788 ?auto_362791 ) ) ( not ( = ?auto_362788 ?auto_362792 ) ) ( not ( = ?auto_362788 ?auto_362793 ) ) ( not ( = ?auto_362788 ?auto_362794 ) ) ( not ( = ?auto_362788 ?auto_362795 ) ) ( not ( = ?auto_362788 ?auto_362796 ) ) ( not ( = ?auto_362788 ?auto_362797 ) ) ( not ( = ?auto_362788 ?auto_362798 ) ) ( not ( = ?auto_362788 ?auto_362799 ) ) ( not ( = ?auto_362788 ?auto_362800 ) ) ( not ( = ?auto_362789 ?auto_362790 ) ) ( not ( = ?auto_362789 ?auto_362791 ) ) ( not ( = ?auto_362789 ?auto_362792 ) ) ( not ( = ?auto_362789 ?auto_362793 ) ) ( not ( = ?auto_362789 ?auto_362794 ) ) ( not ( = ?auto_362789 ?auto_362795 ) ) ( not ( = ?auto_362789 ?auto_362796 ) ) ( not ( = ?auto_362789 ?auto_362797 ) ) ( not ( = ?auto_362789 ?auto_362798 ) ) ( not ( = ?auto_362789 ?auto_362799 ) ) ( not ( = ?auto_362789 ?auto_362800 ) ) ( not ( = ?auto_362790 ?auto_362791 ) ) ( not ( = ?auto_362790 ?auto_362792 ) ) ( not ( = ?auto_362790 ?auto_362793 ) ) ( not ( = ?auto_362790 ?auto_362794 ) ) ( not ( = ?auto_362790 ?auto_362795 ) ) ( not ( = ?auto_362790 ?auto_362796 ) ) ( not ( = ?auto_362790 ?auto_362797 ) ) ( not ( = ?auto_362790 ?auto_362798 ) ) ( not ( = ?auto_362790 ?auto_362799 ) ) ( not ( = ?auto_362790 ?auto_362800 ) ) ( not ( = ?auto_362791 ?auto_362792 ) ) ( not ( = ?auto_362791 ?auto_362793 ) ) ( not ( = ?auto_362791 ?auto_362794 ) ) ( not ( = ?auto_362791 ?auto_362795 ) ) ( not ( = ?auto_362791 ?auto_362796 ) ) ( not ( = ?auto_362791 ?auto_362797 ) ) ( not ( = ?auto_362791 ?auto_362798 ) ) ( not ( = ?auto_362791 ?auto_362799 ) ) ( not ( = ?auto_362791 ?auto_362800 ) ) ( not ( = ?auto_362792 ?auto_362793 ) ) ( not ( = ?auto_362792 ?auto_362794 ) ) ( not ( = ?auto_362792 ?auto_362795 ) ) ( not ( = ?auto_362792 ?auto_362796 ) ) ( not ( = ?auto_362792 ?auto_362797 ) ) ( not ( = ?auto_362792 ?auto_362798 ) ) ( not ( = ?auto_362792 ?auto_362799 ) ) ( not ( = ?auto_362792 ?auto_362800 ) ) ( not ( = ?auto_362793 ?auto_362794 ) ) ( not ( = ?auto_362793 ?auto_362795 ) ) ( not ( = ?auto_362793 ?auto_362796 ) ) ( not ( = ?auto_362793 ?auto_362797 ) ) ( not ( = ?auto_362793 ?auto_362798 ) ) ( not ( = ?auto_362793 ?auto_362799 ) ) ( not ( = ?auto_362793 ?auto_362800 ) ) ( not ( = ?auto_362794 ?auto_362795 ) ) ( not ( = ?auto_362794 ?auto_362796 ) ) ( not ( = ?auto_362794 ?auto_362797 ) ) ( not ( = ?auto_362794 ?auto_362798 ) ) ( not ( = ?auto_362794 ?auto_362799 ) ) ( not ( = ?auto_362794 ?auto_362800 ) ) ( not ( = ?auto_362795 ?auto_362796 ) ) ( not ( = ?auto_362795 ?auto_362797 ) ) ( not ( = ?auto_362795 ?auto_362798 ) ) ( not ( = ?auto_362795 ?auto_362799 ) ) ( not ( = ?auto_362795 ?auto_362800 ) ) ( not ( = ?auto_362796 ?auto_362797 ) ) ( not ( = ?auto_362796 ?auto_362798 ) ) ( not ( = ?auto_362796 ?auto_362799 ) ) ( not ( = ?auto_362796 ?auto_362800 ) ) ( not ( = ?auto_362797 ?auto_362798 ) ) ( not ( = ?auto_362797 ?auto_362799 ) ) ( not ( = ?auto_362797 ?auto_362800 ) ) ( not ( = ?auto_362798 ?auto_362799 ) ) ( not ( = ?auto_362798 ?auto_362800 ) ) ( not ( = ?auto_362799 ?auto_362800 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_362799 ?auto_362800 )
      ( !STACK ?auto_362799 ?auto_362798 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_362838 - BLOCK
      ?auto_362839 - BLOCK
      ?auto_362840 - BLOCK
      ?auto_362841 - BLOCK
      ?auto_362842 - BLOCK
      ?auto_362843 - BLOCK
      ?auto_362844 - BLOCK
      ?auto_362845 - BLOCK
      ?auto_362846 - BLOCK
      ?auto_362847 - BLOCK
      ?auto_362848 - BLOCK
      ?auto_362849 - BLOCK
    )
    :vars
    (
      ?auto_362850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_362849 ?auto_362850 ) ( ON-TABLE ?auto_362838 ) ( ON ?auto_362839 ?auto_362838 ) ( ON ?auto_362840 ?auto_362839 ) ( ON ?auto_362841 ?auto_362840 ) ( ON ?auto_362842 ?auto_362841 ) ( ON ?auto_362843 ?auto_362842 ) ( ON ?auto_362844 ?auto_362843 ) ( ON ?auto_362845 ?auto_362844 ) ( ON ?auto_362846 ?auto_362845 ) ( ON ?auto_362847 ?auto_362846 ) ( not ( = ?auto_362838 ?auto_362839 ) ) ( not ( = ?auto_362838 ?auto_362840 ) ) ( not ( = ?auto_362838 ?auto_362841 ) ) ( not ( = ?auto_362838 ?auto_362842 ) ) ( not ( = ?auto_362838 ?auto_362843 ) ) ( not ( = ?auto_362838 ?auto_362844 ) ) ( not ( = ?auto_362838 ?auto_362845 ) ) ( not ( = ?auto_362838 ?auto_362846 ) ) ( not ( = ?auto_362838 ?auto_362847 ) ) ( not ( = ?auto_362838 ?auto_362848 ) ) ( not ( = ?auto_362838 ?auto_362849 ) ) ( not ( = ?auto_362838 ?auto_362850 ) ) ( not ( = ?auto_362839 ?auto_362840 ) ) ( not ( = ?auto_362839 ?auto_362841 ) ) ( not ( = ?auto_362839 ?auto_362842 ) ) ( not ( = ?auto_362839 ?auto_362843 ) ) ( not ( = ?auto_362839 ?auto_362844 ) ) ( not ( = ?auto_362839 ?auto_362845 ) ) ( not ( = ?auto_362839 ?auto_362846 ) ) ( not ( = ?auto_362839 ?auto_362847 ) ) ( not ( = ?auto_362839 ?auto_362848 ) ) ( not ( = ?auto_362839 ?auto_362849 ) ) ( not ( = ?auto_362839 ?auto_362850 ) ) ( not ( = ?auto_362840 ?auto_362841 ) ) ( not ( = ?auto_362840 ?auto_362842 ) ) ( not ( = ?auto_362840 ?auto_362843 ) ) ( not ( = ?auto_362840 ?auto_362844 ) ) ( not ( = ?auto_362840 ?auto_362845 ) ) ( not ( = ?auto_362840 ?auto_362846 ) ) ( not ( = ?auto_362840 ?auto_362847 ) ) ( not ( = ?auto_362840 ?auto_362848 ) ) ( not ( = ?auto_362840 ?auto_362849 ) ) ( not ( = ?auto_362840 ?auto_362850 ) ) ( not ( = ?auto_362841 ?auto_362842 ) ) ( not ( = ?auto_362841 ?auto_362843 ) ) ( not ( = ?auto_362841 ?auto_362844 ) ) ( not ( = ?auto_362841 ?auto_362845 ) ) ( not ( = ?auto_362841 ?auto_362846 ) ) ( not ( = ?auto_362841 ?auto_362847 ) ) ( not ( = ?auto_362841 ?auto_362848 ) ) ( not ( = ?auto_362841 ?auto_362849 ) ) ( not ( = ?auto_362841 ?auto_362850 ) ) ( not ( = ?auto_362842 ?auto_362843 ) ) ( not ( = ?auto_362842 ?auto_362844 ) ) ( not ( = ?auto_362842 ?auto_362845 ) ) ( not ( = ?auto_362842 ?auto_362846 ) ) ( not ( = ?auto_362842 ?auto_362847 ) ) ( not ( = ?auto_362842 ?auto_362848 ) ) ( not ( = ?auto_362842 ?auto_362849 ) ) ( not ( = ?auto_362842 ?auto_362850 ) ) ( not ( = ?auto_362843 ?auto_362844 ) ) ( not ( = ?auto_362843 ?auto_362845 ) ) ( not ( = ?auto_362843 ?auto_362846 ) ) ( not ( = ?auto_362843 ?auto_362847 ) ) ( not ( = ?auto_362843 ?auto_362848 ) ) ( not ( = ?auto_362843 ?auto_362849 ) ) ( not ( = ?auto_362843 ?auto_362850 ) ) ( not ( = ?auto_362844 ?auto_362845 ) ) ( not ( = ?auto_362844 ?auto_362846 ) ) ( not ( = ?auto_362844 ?auto_362847 ) ) ( not ( = ?auto_362844 ?auto_362848 ) ) ( not ( = ?auto_362844 ?auto_362849 ) ) ( not ( = ?auto_362844 ?auto_362850 ) ) ( not ( = ?auto_362845 ?auto_362846 ) ) ( not ( = ?auto_362845 ?auto_362847 ) ) ( not ( = ?auto_362845 ?auto_362848 ) ) ( not ( = ?auto_362845 ?auto_362849 ) ) ( not ( = ?auto_362845 ?auto_362850 ) ) ( not ( = ?auto_362846 ?auto_362847 ) ) ( not ( = ?auto_362846 ?auto_362848 ) ) ( not ( = ?auto_362846 ?auto_362849 ) ) ( not ( = ?auto_362846 ?auto_362850 ) ) ( not ( = ?auto_362847 ?auto_362848 ) ) ( not ( = ?auto_362847 ?auto_362849 ) ) ( not ( = ?auto_362847 ?auto_362850 ) ) ( not ( = ?auto_362848 ?auto_362849 ) ) ( not ( = ?auto_362848 ?auto_362850 ) ) ( not ( = ?auto_362849 ?auto_362850 ) ) ( CLEAR ?auto_362847 ) ( ON ?auto_362848 ?auto_362849 ) ( CLEAR ?auto_362848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_362838 ?auto_362839 ?auto_362840 ?auto_362841 ?auto_362842 ?auto_362843 ?auto_362844 ?auto_362845 ?auto_362846 ?auto_362847 ?auto_362848 )
      ( MAKE-12PILE ?auto_362838 ?auto_362839 ?auto_362840 ?auto_362841 ?auto_362842 ?auto_362843 ?auto_362844 ?auto_362845 ?auto_362846 ?auto_362847 ?auto_362848 ?auto_362849 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_362888 - BLOCK
      ?auto_362889 - BLOCK
      ?auto_362890 - BLOCK
      ?auto_362891 - BLOCK
      ?auto_362892 - BLOCK
      ?auto_362893 - BLOCK
      ?auto_362894 - BLOCK
      ?auto_362895 - BLOCK
      ?auto_362896 - BLOCK
      ?auto_362897 - BLOCK
      ?auto_362898 - BLOCK
      ?auto_362899 - BLOCK
    )
    :vars
    (
      ?auto_362900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_362899 ?auto_362900 ) ( ON-TABLE ?auto_362888 ) ( ON ?auto_362889 ?auto_362888 ) ( ON ?auto_362890 ?auto_362889 ) ( ON ?auto_362891 ?auto_362890 ) ( ON ?auto_362892 ?auto_362891 ) ( ON ?auto_362893 ?auto_362892 ) ( ON ?auto_362894 ?auto_362893 ) ( ON ?auto_362895 ?auto_362894 ) ( ON ?auto_362896 ?auto_362895 ) ( not ( = ?auto_362888 ?auto_362889 ) ) ( not ( = ?auto_362888 ?auto_362890 ) ) ( not ( = ?auto_362888 ?auto_362891 ) ) ( not ( = ?auto_362888 ?auto_362892 ) ) ( not ( = ?auto_362888 ?auto_362893 ) ) ( not ( = ?auto_362888 ?auto_362894 ) ) ( not ( = ?auto_362888 ?auto_362895 ) ) ( not ( = ?auto_362888 ?auto_362896 ) ) ( not ( = ?auto_362888 ?auto_362897 ) ) ( not ( = ?auto_362888 ?auto_362898 ) ) ( not ( = ?auto_362888 ?auto_362899 ) ) ( not ( = ?auto_362888 ?auto_362900 ) ) ( not ( = ?auto_362889 ?auto_362890 ) ) ( not ( = ?auto_362889 ?auto_362891 ) ) ( not ( = ?auto_362889 ?auto_362892 ) ) ( not ( = ?auto_362889 ?auto_362893 ) ) ( not ( = ?auto_362889 ?auto_362894 ) ) ( not ( = ?auto_362889 ?auto_362895 ) ) ( not ( = ?auto_362889 ?auto_362896 ) ) ( not ( = ?auto_362889 ?auto_362897 ) ) ( not ( = ?auto_362889 ?auto_362898 ) ) ( not ( = ?auto_362889 ?auto_362899 ) ) ( not ( = ?auto_362889 ?auto_362900 ) ) ( not ( = ?auto_362890 ?auto_362891 ) ) ( not ( = ?auto_362890 ?auto_362892 ) ) ( not ( = ?auto_362890 ?auto_362893 ) ) ( not ( = ?auto_362890 ?auto_362894 ) ) ( not ( = ?auto_362890 ?auto_362895 ) ) ( not ( = ?auto_362890 ?auto_362896 ) ) ( not ( = ?auto_362890 ?auto_362897 ) ) ( not ( = ?auto_362890 ?auto_362898 ) ) ( not ( = ?auto_362890 ?auto_362899 ) ) ( not ( = ?auto_362890 ?auto_362900 ) ) ( not ( = ?auto_362891 ?auto_362892 ) ) ( not ( = ?auto_362891 ?auto_362893 ) ) ( not ( = ?auto_362891 ?auto_362894 ) ) ( not ( = ?auto_362891 ?auto_362895 ) ) ( not ( = ?auto_362891 ?auto_362896 ) ) ( not ( = ?auto_362891 ?auto_362897 ) ) ( not ( = ?auto_362891 ?auto_362898 ) ) ( not ( = ?auto_362891 ?auto_362899 ) ) ( not ( = ?auto_362891 ?auto_362900 ) ) ( not ( = ?auto_362892 ?auto_362893 ) ) ( not ( = ?auto_362892 ?auto_362894 ) ) ( not ( = ?auto_362892 ?auto_362895 ) ) ( not ( = ?auto_362892 ?auto_362896 ) ) ( not ( = ?auto_362892 ?auto_362897 ) ) ( not ( = ?auto_362892 ?auto_362898 ) ) ( not ( = ?auto_362892 ?auto_362899 ) ) ( not ( = ?auto_362892 ?auto_362900 ) ) ( not ( = ?auto_362893 ?auto_362894 ) ) ( not ( = ?auto_362893 ?auto_362895 ) ) ( not ( = ?auto_362893 ?auto_362896 ) ) ( not ( = ?auto_362893 ?auto_362897 ) ) ( not ( = ?auto_362893 ?auto_362898 ) ) ( not ( = ?auto_362893 ?auto_362899 ) ) ( not ( = ?auto_362893 ?auto_362900 ) ) ( not ( = ?auto_362894 ?auto_362895 ) ) ( not ( = ?auto_362894 ?auto_362896 ) ) ( not ( = ?auto_362894 ?auto_362897 ) ) ( not ( = ?auto_362894 ?auto_362898 ) ) ( not ( = ?auto_362894 ?auto_362899 ) ) ( not ( = ?auto_362894 ?auto_362900 ) ) ( not ( = ?auto_362895 ?auto_362896 ) ) ( not ( = ?auto_362895 ?auto_362897 ) ) ( not ( = ?auto_362895 ?auto_362898 ) ) ( not ( = ?auto_362895 ?auto_362899 ) ) ( not ( = ?auto_362895 ?auto_362900 ) ) ( not ( = ?auto_362896 ?auto_362897 ) ) ( not ( = ?auto_362896 ?auto_362898 ) ) ( not ( = ?auto_362896 ?auto_362899 ) ) ( not ( = ?auto_362896 ?auto_362900 ) ) ( not ( = ?auto_362897 ?auto_362898 ) ) ( not ( = ?auto_362897 ?auto_362899 ) ) ( not ( = ?auto_362897 ?auto_362900 ) ) ( not ( = ?auto_362898 ?auto_362899 ) ) ( not ( = ?auto_362898 ?auto_362900 ) ) ( not ( = ?auto_362899 ?auto_362900 ) ) ( ON ?auto_362898 ?auto_362899 ) ( CLEAR ?auto_362896 ) ( ON ?auto_362897 ?auto_362898 ) ( CLEAR ?auto_362897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_362888 ?auto_362889 ?auto_362890 ?auto_362891 ?auto_362892 ?auto_362893 ?auto_362894 ?auto_362895 ?auto_362896 ?auto_362897 )
      ( MAKE-12PILE ?auto_362888 ?auto_362889 ?auto_362890 ?auto_362891 ?auto_362892 ?auto_362893 ?auto_362894 ?auto_362895 ?auto_362896 ?auto_362897 ?auto_362898 ?auto_362899 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_362938 - BLOCK
      ?auto_362939 - BLOCK
      ?auto_362940 - BLOCK
      ?auto_362941 - BLOCK
      ?auto_362942 - BLOCK
      ?auto_362943 - BLOCK
      ?auto_362944 - BLOCK
      ?auto_362945 - BLOCK
      ?auto_362946 - BLOCK
      ?auto_362947 - BLOCK
      ?auto_362948 - BLOCK
      ?auto_362949 - BLOCK
    )
    :vars
    (
      ?auto_362950 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_362949 ?auto_362950 ) ( ON-TABLE ?auto_362938 ) ( ON ?auto_362939 ?auto_362938 ) ( ON ?auto_362940 ?auto_362939 ) ( ON ?auto_362941 ?auto_362940 ) ( ON ?auto_362942 ?auto_362941 ) ( ON ?auto_362943 ?auto_362942 ) ( ON ?auto_362944 ?auto_362943 ) ( ON ?auto_362945 ?auto_362944 ) ( not ( = ?auto_362938 ?auto_362939 ) ) ( not ( = ?auto_362938 ?auto_362940 ) ) ( not ( = ?auto_362938 ?auto_362941 ) ) ( not ( = ?auto_362938 ?auto_362942 ) ) ( not ( = ?auto_362938 ?auto_362943 ) ) ( not ( = ?auto_362938 ?auto_362944 ) ) ( not ( = ?auto_362938 ?auto_362945 ) ) ( not ( = ?auto_362938 ?auto_362946 ) ) ( not ( = ?auto_362938 ?auto_362947 ) ) ( not ( = ?auto_362938 ?auto_362948 ) ) ( not ( = ?auto_362938 ?auto_362949 ) ) ( not ( = ?auto_362938 ?auto_362950 ) ) ( not ( = ?auto_362939 ?auto_362940 ) ) ( not ( = ?auto_362939 ?auto_362941 ) ) ( not ( = ?auto_362939 ?auto_362942 ) ) ( not ( = ?auto_362939 ?auto_362943 ) ) ( not ( = ?auto_362939 ?auto_362944 ) ) ( not ( = ?auto_362939 ?auto_362945 ) ) ( not ( = ?auto_362939 ?auto_362946 ) ) ( not ( = ?auto_362939 ?auto_362947 ) ) ( not ( = ?auto_362939 ?auto_362948 ) ) ( not ( = ?auto_362939 ?auto_362949 ) ) ( not ( = ?auto_362939 ?auto_362950 ) ) ( not ( = ?auto_362940 ?auto_362941 ) ) ( not ( = ?auto_362940 ?auto_362942 ) ) ( not ( = ?auto_362940 ?auto_362943 ) ) ( not ( = ?auto_362940 ?auto_362944 ) ) ( not ( = ?auto_362940 ?auto_362945 ) ) ( not ( = ?auto_362940 ?auto_362946 ) ) ( not ( = ?auto_362940 ?auto_362947 ) ) ( not ( = ?auto_362940 ?auto_362948 ) ) ( not ( = ?auto_362940 ?auto_362949 ) ) ( not ( = ?auto_362940 ?auto_362950 ) ) ( not ( = ?auto_362941 ?auto_362942 ) ) ( not ( = ?auto_362941 ?auto_362943 ) ) ( not ( = ?auto_362941 ?auto_362944 ) ) ( not ( = ?auto_362941 ?auto_362945 ) ) ( not ( = ?auto_362941 ?auto_362946 ) ) ( not ( = ?auto_362941 ?auto_362947 ) ) ( not ( = ?auto_362941 ?auto_362948 ) ) ( not ( = ?auto_362941 ?auto_362949 ) ) ( not ( = ?auto_362941 ?auto_362950 ) ) ( not ( = ?auto_362942 ?auto_362943 ) ) ( not ( = ?auto_362942 ?auto_362944 ) ) ( not ( = ?auto_362942 ?auto_362945 ) ) ( not ( = ?auto_362942 ?auto_362946 ) ) ( not ( = ?auto_362942 ?auto_362947 ) ) ( not ( = ?auto_362942 ?auto_362948 ) ) ( not ( = ?auto_362942 ?auto_362949 ) ) ( not ( = ?auto_362942 ?auto_362950 ) ) ( not ( = ?auto_362943 ?auto_362944 ) ) ( not ( = ?auto_362943 ?auto_362945 ) ) ( not ( = ?auto_362943 ?auto_362946 ) ) ( not ( = ?auto_362943 ?auto_362947 ) ) ( not ( = ?auto_362943 ?auto_362948 ) ) ( not ( = ?auto_362943 ?auto_362949 ) ) ( not ( = ?auto_362943 ?auto_362950 ) ) ( not ( = ?auto_362944 ?auto_362945 ) ) ( not ( = ?auto_362944 ?auto_362946 ) ) ( not ( = ?auto_362944 ?auto_362947 ) ) ( not ( = ?auto_362944 ?auto_362948 ) ) ( not ( = ?auto_362944 ?auto_362949 ) ) ( not ( = ?auto_362944 ?auto_362950 ) ) ( not ( = ?auto_362945 ?auto_362946 ) ) ( not ( = ?auto_362945 ?auto_362947 ) ) ( not ( = ?auto_362945 ?auto_362948 ) ) ( not ( = ?auto_362945 ?auto_362949 ) ) ( not ( = ?auto_362945 ?auto_362950 ) ) ( not ( = ?auto_362946 ?auto_362947 ) ) ( not ( = ?auto_362946 ?auto_362948 ) ) ( not ( = ?auto_362946 ?auto_362949 ) ) ( not ( = ?auto_362946 ?auto_362950 ) ) ( not ( = ?auto_362947 ?auto_362948 ) ) ( not ( = ?auto_362947 ?auto_362949 ) ) ( not ( = ?auto_362947 ?auto_362950 ) ) ( not ( = ?auto_362948 ?auto_362949 ) ) ( not ( = ?auto_362948 ?auto_362950 ) ) ( not ( = ?auto_362949 ?auto_362950 ) ) ( ON ?auto_362948 ?auto_362949 ) ( ON ?auto_362947 ?auto_362948 ) ( CLEAR ?auto_362945 ) ( ON ?auto_362946 ?auto_362947 ) ( CLEAR ?auto_362946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_362938 ?auto_362939 ?auto_362940 ?auto_362941 ?auto_362942 ?auto_362943 ?auto_362944 ?auto_362945 ?auto_362946 )
      ( MAKE-12PILE ?auto_362938 ?auto_362939 ?auto_362940 ?auto_362941 ?auto_362942 ?auto_362943 ?auto_362944 ?auto_362945 ?auto_362946 ?auto_362947 ?auto_362948 ?auto_362949 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_362988 - BLOCK
      ?auto_362989 - BLOCK
      ?auto_362990 - BLOCK
      ?auto_362991 - BLOCK
      ?auto_362992 - BLOCK
      ?auto_362993 - BLOCK
      ?auto_362994 - BLOCK
      ?auto_362995 - BLOCK
      ?auto_362996 - BLOCK
      ?auto_362997 - BLOCK
      ?auto_362998 - BLOCK
      ?auto_362999 - BLOCK
    )
    :vars
    (
      ?auto_363000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_362999 ?auto_363000 ) ( ON-TABLE ?auto_362988 ) ( ON ?auto_362989 ?auto_362988 ) ( ON ?auto_362990 ?auto_362989 ) ( ON ?auto_362991 ?auto_362990 ) ( ON ?auto_362992 ?auto_362991 ) ( ON ?auto_362993 ?auto_362992 ) ( ON ?auto_362994 ?auto_362993 ) ( not ( = ?auto_362988 ?auto_362989 ) ) ( not ( = ?auto_362988 ?auto_362990 ) ) ( not ( = ?auto_362988 ?auto_362991 ) ) ( not ( = ?auto_362988 ?auto_362992 ) ) ( not ( = ?auto_362988 ?auto_362993 ) ) ( not ( = ?auto_362988 ?auto_362994 ) ) ( not ( = ?auto_362988 ?auto_362995 ) ) ( not ( = ?auto_362988 ?auto_362996 ) ) ( not ( = ?auto_362988 ?auto_362997 ) ) ( not ( = ?auto_362988 ?auto_362998 ) ) ( not ( = ?auto_362988 ?auto_362999 ) ) ( not ( = ?auto_362988 ?auto_363000 ) ) ( not ( = ?auto_362989 ?auto_362990 ) ) ( not ( = ?auto_362989 ?auto_362991 ) ) ( not ( = ?auto_362989 ?auto_362992 ) ) ( not ( = ?auto_362989 ?auto_362993 ) ) ( not ( = ?auto_362989 ?auto_362994 ) ) ( not ( = ?auto_362989 ?auto_362995 ) ) ( not ( = ?auto_362989 ?auto_362996 ) ) ( not ( = ?auto_362989 ?auto_362997 ) ) ( not ( = ?auto_362989 ?auto_362998 ) ) ( not ( = ?auto_362989 ?auto_362999 ) ) ( not ( = ?auto_362989 ?auto_363000 ) ) ( not ( = ?auto_362990 ?auto_362991 ) ) ( not ( = ?auto_362990 ?auto_362992 ) ) ( not ( = ?auto_362990 ?auto_362993 ) ) ( not ( = ?auto_362990 ?auto_362994 ) ) ( not ( = ?auto_362990 ?auto_362995 ) ) ( not ( = ?auto_362990 ?auto_362996 ) ) ( not ( = ?auto_362990 ?auto_362997 ) ) ( not ( = ?auto_362990 ?auto_362998 ) ) ( not ( = ?auto_362990 ?auto_362999 ) ) ( not ( = ?auto_362990 ?auto_363000 ) ) ( not ( = ?auto_362991 ?auto_362992 ) ) ( not ( = ?auto_362991 ?auto_362993 ) ) ( not ( = ?auto_362991 ?auto_362994 ) ) ( not ( = ?auto_362991 ?auto_362995 ) ) ( not ( = ?auto_362991 ?auto_362996 ) ) ( not ( = ?auto_362991 ?auto_362997 ) ) ( not ( = ?auto_362991 ?auto_362998 ) ) ( not ( = ?auto_362991 ?auto_362999 ) ) ( not ( = ?auto_362991 ?auto_363000 ) ) ( not ( = ?auto_362992 ?auto_362993 ) ) ( not ( = ?auto_362992 ?auto_362994 ) ) ( not ( = ?auto_362992 ?auto_362995 ) ) ( not ( = ?auto_362992 ?auto_362996 ) ) ( not ( = ?auto_362992 ?auto_362997 ) ) ( not ( = ?auto_362992 ?auto_362998 ) ) ( not ( = ?auto_362992 ?auto_362999 ) ) ( not ( = ?auto_362992 ?auto_363000 ) ) ( not ( = ?auto_362993 ?auto_362994 ) ) ( not ( = ?auto_362993 ?auto_362995 ) ) ( not ( = ?auto_362993 ?auto_362996 ) ) ( not ( = ?auto_362993 ?auto_362997 ) ) ( not ( = ?auto_362993 ?auto_362998 ) ) ( not ( = ?auto_362993 ?auto_362999 ) ) ( not ( = ?auto_362993 ?auto_363000 ) ) ( not ( = ?auto_362994 ?auto_362995 ) ) ( not ( = ?auto_362994 ?auto_362996 ) ) ( not ( = ?auto_362994 ?auto_362997 ) ) ( not ( = ?auto_362994 ?auto_362998 ) ) ( not ( = ?auto_362994 ?auto_362999 ) ) ( not ( = ?auto_362994 ?auto_363000 ) ) ( not ( = ?auto_362995 ?auto_362996 ) ) ( not ( = ?auto_362995 ?auto_362997 ) ) ( not ( = ?auto_362995 ?auto_362998 ) ) ( not ( = ?auto_362995 ?auto_362999 ) ) ( not ( = ?auto_362995 ?auto_363000 ) ) ( not ( = ?auto_362996 ?auto_362997 ) ) ( not ( = ?auto_362996 ?auto_362998 ) ) ( not ( = ?auto_362996 ?auto_362999 ) ) ( not ( = ?auto_362996 ?auto_363000 ) ) ( not ( = ?auto_362997 ?auto_362998 ) ) ( not ( = ?auto_362997 ?auto_362999 ) ) ( not ( = ?auto_362997 ?auto_363000 ) ) ( not ( = ?auto_362998 ?auto_362999 ) ) ( not ( = ?auto_362998 ?auto_363000 ) ) ( not ( = ?auto_362999 ?auto_363000 ) ) ( ON ?auto_362998 ?auto_362999 ) ( ON ?auto_362997 ?auto_362998 ) ( ON ?auto_362996 ?auto_362997 ) ( CLEAR ?auto_362994 ) ( ON ?auto_362995 ?auto_362996 ) ( CLEAR ?auto_362995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_362988 ?auto_362989 ?auto_362990 ?auto_362991 ?auto_362992 ?auto_362993 ?auto_362994 ?auto_362995 )
      ( MAKE-12PILE ?auto_362988 ?auto_362989 ?auto_362990 ?auto_362991 ?auto_362992 ?auto_362993 ?auto_362994 ?auto_362995 ?auto_362996 ?auto_362997 ?auto_362998 ?auto_362999 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_363038 - BLOCK
      ?auto_363039 - BLOCK
      ?auto_363040 - BLOCK
      ?auto_363041 - BLOCK
      ?auto_363042 - BLOCK
      ?auto_363043 - BLOCK
      ?auto_363044 - BLOCK
      ?auto_363045 - BLOCK
      ?auto_363046 - BLOCK
      ?auto_363047 - BLOCK
      ?auto_363048 - BLOCK
      ?auto_363049 - BLOCK
    )
    :vars
    (
      ?auto_363050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_363049 ?auto_363050 ) ( ON-TABLE ?auto_363038 ) ( ON ?auto_363039 ?auto_363038 ) ( ON ?auto_363040 ?auto_363039 ) ( ON ?auto_363041 ?auto_363040 ) ( ON ?auto_363042 ?auto_363041 ) ( ON ?auto_363043 ?auto_363042 ) ( not ( = ?auto_363038 ?auto_363039 ) ) ( not ( = ?auto_363038 ?auto_363040 ) ) ( not ( = ?auto_363038 ?auto_363041 ) ) ( not ( = ?auto_363038 ?auto_363042 ) ) ( not ( = ?auto_363038 ?auto_363043 ) ) ( not ( = ?auto_363038 ?auto_363044 ) ) ( not ( = ?auto_363038 ?auto_363045 ) ) ( not ( = ?auto_363038 ?auto_363046 ) ) ( not ( = ?auto_363038 ?auto_363047 ) ) ( not ( = ?auto_363038 ?auto_363048 ) ) ( not ( = ?auto_363038 ?auto_363049 ) ) ( not ( = ?auto_363038 ?auto_363050 ) ) ( not ( = ?auto_363039 ?auto_363040 ) ) ( not ( = ?auto_363039 ?auto_363041 ) ) ( not ( = ?auto_363039 ?auto_363042 ) ) ( not ( = ?auto_363039 ?auto_363043 ) ) ( not ( = ?auto_363039 ?auto_363044 ) ) ( not ( = ?auto_363039 ?auto_363045 ) ) ( not ( = ?auto_363039 ?auto_363046 ) ) ( not ( = ?auto_363039 ?auto_363047 ) ) ( not ( = ?auto_363039 ?auto_363048 ) ) ( not ( = ?auto_363039 ?auto_363049 ) ) ( not ( = ?auto_363039 ?auto_363050 ) ) ( not ( = ?auto_363040 ?auto_363041 ) ) ( not ( = ?auto_363040 ?auto_363042 ) ) ( not ( = ?auto_363040 ?auto_363043 ) ) ( not ( = ?auto_363040 ?auto_363044 ) ) ( not ( = ?auto_363040 ?auto_363045 ) ) ( not ( = ?auto_363040 ?auto_363046 ) ) ( not ( = ?auto_363040 ?auto_363047 ) ) ( not ( = ?auto_363040 ?auto_363048 ) ) ( not ( = ?auto_363040 ?auto_363049 ) ) ( not ( = ?auto_363040 ?auto_363050 ) ) ( not ( = ?auto_363041 ?auto_363042 ) ) ( not ( = ?auto_363041 ?auto_363043 ) ) ( not ( = ?auto_363041 ?auto_363044 ) ) ( not ( = ?auto_363041 ?auto_363045 ) ) ( not ( = ?auto_363041 ?auto_363046 ) ) ( not ( = ?auto_363041 ?auto_363047 ) ) ( not ( = ?auto_363041 ?auto_363048 ) ) ( not ( = ?auto_363041 ?auto_363049 ) ) ( not ( = ?auto_363041 ?auto_363050 ) ) ( not ( = ?auto_363042 ?auto_363043 ) ) ( not ( = ?auto_363042 ?auto_363044 ) ) ( not ( = ?auto_363042 ?auto_363045 ) ) ( not ( = ?auto_363042 ?auto_363046 ) ) ( not ( = ?auto_363042 ?auto_363047 ) ) ( not ( = ?auto_363042 ?auto_363048 ) ) ( not ( = ?auto_363042 ?auto_363049 ) ) ( not ( = ?auto_363042 ?auto_363050 ) ) ( not ( = ?auto_363043 ?auto_363044 ) ) ( not ( = ?auto_363043 ?auto_363045 ) ) ( not ( = ?auto_363043 ?auto_363046 ) ) ( not ( = ?auto_363043 ?auto_363047 ) ) ( not ( = ?auto_363043 ?auto_363048 ) ) ( not ( = ?auto_363043 ?auto_363049 ) ) ( not ( = ?auto_363043 ?auto_363050 ) ) ( not ( = ?auto_363044 ?auto_363045 ) ) ( not ( = ?auto_363044 ?auto_363046 ) ) ( not ( = ?auto_363044 ?auto_363047 ) ) ( not ( = ?auto_363044 ?auto_363048 ) ) ( not ( = ?auto_363044 ?auto_363049 ) ) ( not ( = ?auto_363044 ?auto_363050 ) ) ( not ( = ?auto_363045 ?auto_363046 ) ) ( not ( = ?auto_363045 ?auto_363047 ) ) ( not ( = ?auto_363045 ?auto_363048 ) ) ( not ( = ?auto_363045 ?auto_363049 ) ) ( not ( = ?auto_363045 ?auto_363050 ) ) ( not ( = ?auto_363046 ?auto_363047 ) ) ( not ( = ?auto_363046 ?auto_363048 ) ) ( not ( = ?auto_363046 ?auto_363049 ) ) ( not ( = ?auto_363046 ?auto_363050 ) ) ( not ( = ?auto_363047 ?auto_363048 ) ) ( not ( = ?auto_363047 ?auto_363049 ) ) ( not ( = ?auto_363047 ?auto_363050 ) ) ( not ( = ?auto_363048 ?auto_363049 ) ) ( not ( = ?auto_363048 ?auto_363050 ) ) ( not ( = ?auto_363049 ?auto_363050 ) ) ( ON ?auto_363048 ?auto_363049 ) ( ON ?auto_363047 ?auto_363048 ) ( ON ?auto_363046 ?auto_363047 ) ( ON ?auto_363045 ?auto_363046 ) ( CLEAR ?auto_363043 ) ( ON ?auto_363044 ?auto_363045 ) ( CLEAR ?auto_363044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_363038 ?auto_363039 ?auto_363040 ?auto_363041 ?auto_363042 ?auto_363043 ?auto_363044 )
      ( MAKE-12PILE ?auto_363038 ?auto_363039 ?auto_363040 ?auto_363041 ?auto_363042 ?auto_363043 ?auto_363044 ?auto_363045 ?auto_363046 ?auto_363047 ?auto_363048 ?auto_363049 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_363088 - BLOCK
      ?auto_363089 - BLOCK
      ?auto_363090 - BLOCK
      ?auto_363091 - BLOCK
      ?auto_363092 - BLOCK
      ?auto_363093 - BLOCK
      ?auto_363094 - BLOCK
      ?auto_363095 - BLOCK
      ?auto_363096 - BLOCK
      ?auto_363097 - BLOCK
      ?auto_363098 - BLOCK
      ?auto_363099 - BLOCK
    )
    :vars
    (
      ?auto_363100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_363099 ?auto_363100 ) ( ON-TABLE ?auto_363088 ) ( ON ?auto_363089 ?auto_363088 ) ( ON ?auto_363090 ?auto_363089 ) ( ON ?auto_363091 ?auto_363090 ) ( ON ?auto_363092 ?auto_363091 ) ( not ( = ?auto_363088 ?auto_363089 ) ) ( not ( = ?auto_363088 ?auto_363090 ) ) ( not ( = ?auto_363088 ?auto_363091 ) ) ( not ( = ?auto_363088 ?auto_363092 ) ) ( not ( = ?auto_363088 ?auto_363093 ) ) ( not ( = ?auto_363088 ?auto_363094 ) ) ( not ( = ?auto_363088 ?auto_363095 ) ) ( not ( = ?auto_363088 ?auto_363096 ) ) ( not ( = ?auto_363088 ?auto_363097 ) ) ( not ( = ?auto_363088 ?auto_363098 ) ) ( not ( = ?auto_363088 ?auto_363099 ) ) ( not ( = ?auto_363088 ?auto_363100 ) ) ( not ( = ?auto_363089 ?auto_363090 ) ) ( not ( = ?auto_363089 ?auto_363091 ) ) ( not ( = ?auto_363089 ?auto_363092 ) ) ( not ( = ?auto_363089 ?auto_363093 ) ) ( not ( = ?auto_363089 ?auto_363094 ) ) ( not ( = ?auto_363089 ?auto_363095 ) ) ( not ( = ?auto_363089 ?auto_363096 ) ) ( not ( = ?auto_363089 ?auto_363097 ) ) ( not ( = ?auto_363089 ?auto_363098 ) ) ( not ( = ?auto_363089 ?auto_363099 ) ) ( not ( = ?auto_363089 ?auto_363100 ) ) ( not ( = ?auto_363090 ?auto_363091 ) ) ( not ( = ?auto_363090 ?auto_363092 ) ) ( not ( = ?auto_363090 ?auto_363093 ) ) ( not ( = ?auto_363090 ?auto_363094 ) ) ( not ( = ?auto_363090 ?auto_363095 ) ) ( not ( = ?auto_363090 ?auto_363096 ) ) ( not ( = ?auto_363090 ?auto_363097 ) ) ( not ( = ?auto_363090 ?auto_363098 ) ) ( not ( = ?auto_363090 ?auto_363099 ) ) ( not ( = ?auto_363090 ?auto_363100 ) ) ( not ( = ?auto_363091 ?auto_363092 ) ) ( not ( = ?auto_363091 ?auto_363093 ) ) ( not ( = ?auto_363091 ?auto_363094 ) ) ( not ( = ?auto_363091 ?auto_363095 ) ) ( not ( = ?auto_363091 ?auto_363096 ) ) ( not ( = ?auto_363091 ?auto_363097 ) ) ( not ( = ?auto_363091 ?auto_363098 ) ) ( not ( = ?auto_363091 ?auto_363099 ) ) ( not ( = ?auto_363091 ?auto_363100 ) ) ( not ( = ?auto_363092 ?auto_363093 ) ) ( not ( = ?auto_363092 ?auto_363094 ) ) ( not ( = ?auto_363092 ?auto_363095 ) ) ( not ( = ?auto_363092 ?auto_363096 ) ) ( not ( = ?auto_363092 ?auto_363097 ) ) ( not ( = ?auto_363092 ?auto_363098 ) ) ( not ( = ?auto_363092 ?auto_363099 ) ) ( not ( = ?auto_363092 ?auto_363100 ) ) ( not ( = ?auto_363093 ?auto_363094 ) ) ( not ( = ?auto_363093 ?auto_363095 ) ) ( not ( = ?auto_363093 ?auto_363096 ) ) ( not ( = ?auto_363093 ?auto_363097 ) ) ( not ( = ?auto_363093 ?auto_363098 ) ) ( not ( = ?auto_363093 ?auto_363099 ) ) ( not ( = ?auto_363093 ?auto_363100 ) ) ( not ( = ?auto_363094 ?auto_363095 ) ) ( not ( = ?auto_363094 ?auto_363096 ) ) ( not ( = ?auto_363094 ?auto_363097 ) ) ( not ( = ?auto_363094 ?auto_363098 ) ) ( not ( = ?auto_363094 ?auto_363099 ) ) ( not ( = ?auto_363094 ?auto_363100 ) ) ( not ( = ?auto_363095 ?auto_363096 ) ) ( not ( = ?auto_363095 ?auto_363097 ) ) ( not ( = ?auto_363095 ?auto_363098 ) ) ( not ( = ?auto_363095 ?auto_363099 ) ) ( not ( = ?auto_363095 ?auto_363100 ) ) ( not ( = ?auto_363096 ?auto_363097 ) ) ( not ( = ?auto_363096 ?auto_363098 ) ) ( not ( = ?auto_363096 ?auto_363099 ) ) ( not ( = ?auto_363096 ?auto_363100 ) ) ( not ( = ?auto_363097 ?auto_363098 ) ) ( not ( = ?auto_363097 ?auto_363099 ) ) ( not ( = ?auto_363097 ?auto_363100 ) ) ( not ( = ?auto_363098 ?auto_363099 ) ) ( not ( = ?auto_363098 ?auto_363100 ) ) ( not ( = ?auto_363099 ?auto_363100 ) ) ( ON ?auto_363098 ?auto_363099 ) ( ON ?auto_363097 ?auto_363098 ) ( ON ?auto_363096 ?auto_363097 ) ( ON ?auto_363095 ?auto_363096 ) ( ON ?auto_363094 ?auto_363095 ) ( CLEAR ?auto_363092 ) ( ON ?auto_363093 ?auto_363094 ) ( CLEAR ?auto_363093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_363088 ?auto_363089 ?auto_363090 ?auto_363091 ?auto_363092 ?auto_363093 )
      ( MAKE-12PILE ?auto_363088 ?auto_363089 ?auto_363090 ?auto_363091 ?auto_363092 ?auto_363093 ?auto_363094 ?auto_363095 ?auto_363096 ?auto_363097 ?auto_363098 ?auto_363099 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_363138 - BLOCK
      ?auto_363139 - BLOCK
      ?auto_363140 - BLOCK
      ?auto_363141 - BLOCK
      ?auto_363142 - BLOCK
      ?auto_363143 - BLOCK
      ?auto_363144 - BLOCK
      ?auto_363145 - BLOCK
      ?auto_363146 - BLOCK
      ?auto_363147 - BLOCK
      ?auto_363148 - BLOCK
      ?auto_363149 - BLOCK
    )
    :vars
    (
      ?auto_363150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_363149 ?auto_363150 ) ( ON-TABLE ?auto_363138 ) ( ON ?auto_363139 ?auto_363138 ) ( ON ?auto_363140 ?auto_363139 ) ( ON ?auto_363141 ?auto_363140 ) ( not ( = ?auto_363138 ?auto_363139 ) ) ( not ( = ?auto_363138 ?auto_363140 ) ) ( not ( = ?auto_363138 ?auto_363141 ) ) ( not ( = ?auto_363138 ?auto_363142 ) ) ( not ( = ?auto_363138 ?auto_363143 ) ) ( not ( = ?auto_363138 ?auto_363144 ) ) ( not ( = ?auto_363138 ?auto_363145 ) ) ( not ( = ?auto_363138 ?auto_363146 ) ) ( not ( = ?auto_363138 ?auto_363147 ) ) ( not ( = ?auto_363138 ?auto_363148 ) ) ( not ( = ?auto_363138 ?auto_363149 ) ) ( not ( = ?auto_363138 ?auto_363150 ) ) ( not ( = ?auto_363139 ?auto_363140 ) ) ( not ( = ?auto_363139 ?auto_363141 ) ) ( not ( = ?auto_363139 ?auto_363142 ) ) ( not ( = ?auto_363139 ?auto_363143 ) ) ( not ( = ?auto_363139 ?auto_363144 ) ) ( not ( = ?auto_363139 ?auto_363145 ) ) ( not ( = ?auto_363139 ?auto_363146 ) ) ( not ( = ?auto_363139 ?auto_363147 ) ) ( not ( = ?auto_363139 ?auto_363148 ) ) ( not ( = ?auto_363139 ?auto_363149 ) ) ( not ( = ?auto_363139 ?auto_363150 ) ) ( not ( = ?auto_363140 ?auto_363141 ) ) ( not ( = ?auto_363140 ?auto_363142 ) ) ( not ( = ?auto_363140 ?auto_363143 ) ) ( not ( = ?auto_363140 ?auto_363144 ) ) ( not ( = ?auto_363140 ?auto_363145 ) ) ( not ( = ?auto_363140 ?auto_363146 ) ) ( not ( = ?auto_363140 ?auto_363147 ) ) ( not ( = ?auto_363140 ?auto_363148 ) ) ( not ( = ?auto_363140 ?auto_363149 ) ) ( not ( = ?auto_363140 ?auto_363150 ) ) ( not ( = ?auto_363141 ?auto_363142 ) ) ( not ( = ?auto_363141 ?auto_363143 ) ) ( not ( = ?auto_363141 ?auto_363144 ) ) ( not ( = ?auto_363141 ?auto_363145 ) ) ( not ( = ?auto_363141 ?auto_363146 ) ) ( not ( = ?auto_363141 ?auto_363147 ) ) ( not ( = ?auto_363141 ?auto_363148 ) ) ( not ( = ?auto_363141 ?auto_363149 ) ) ( not ( = ?auto_363141 ?auto_363150 ) ) ( not ( = ?auto_363142 ?auto_363143 ) ) ( not ( = ?auto_363142 ?auto_363144 ) ) ( not ( = ?auto_363142 ?auto_363145 ) ) ( not ( = ?auto_363142 ?auto_363146 ) ) ( not ( = ?auto_363142 ?auto_363147 ) ) ( not ( = ?auto_363142 ?auto_363148 ) ) ( not ( = ?auto_363142 ?auto_363149 ) ) ( not ( = ?auto_363142 ?auto_363150 ) ) ( not ( = ?auto_363143 ?auto_363144 ) ) ( not ( = ?auto_363143 ?auto_363145 ) ) ( not ( = ?auto_363143 ?auto_363146 ) ) ( not ( = ?auto_363143 ?auto_363147 ) ) ( not ( = ?auto_363143 ?auto_363148 ) ) ( not ( = ?auto_363143 ?auto_363149 ) ) ( not ( = ?auto_363143 ?auto_363150 ) ) ( not ( = ?auto_363144 ?auto_363145 ) ) ( not ( = ?auto_363144 ?auto_363146 ) ) ( not ( = ?auto_363144 ?auto_363147 ) ) ( not ( = ?auto_363144 ?auto_363148 ) ) ( not ( = ?auto_363144 ?auto_363149 ) ) ( not ( = ?auto_363144 ?auto_363150 ) ) ( not ( = ?auto_363145 ?auto_363146 ) ) ( not ( = ?auto_363145 ?auto_363147 ) ) ( not ( = ?auto_363145 ?auto_363148 ) ) ( not ( = ?auto_363145 ?auto_363149 ) ) ( not ( = ?auto_363145 ?auto_363150 ) ) ( not ( = ?auto_363146 ?auto_363147 ) ) ( not ( = ?auto_363146 ?auto_363148 ) ) ( not ( = ?auto_363146 ?auto_363149 ) ) ( not ( = ?auto_363146 ?auto_363150 ) ) ( not ( = ?auto_363147 ?auto_363148 ) ) ( not ( = ?auto_363147 ?auto_363149 ) ) ( not ( = ?auto_363147 ?auto_363150 ) ) ( not ( = ?auto_363148 ?auto_363149 ) ) ( not ( = ?auto_363148 ?auto_363150 ) ) ( not ( = ?auto_363149 ?auto_363150 ) ) ( ON ?auto_363148 ?auto_363149 ) ( ON ?auto_363147 ?auto_363148 ) ( ON ?auto_363146 ?auto_363147 ) ( ON ?auto_363145 ?auto_363146 ) ( ON ?auto_363144 ?auto_363145 ) ( ON ?auto_363143 ?auto_363144 ) ( CLEAR ?auto_363141 ) ( ON ?auto_363142 ?auto_363143 ) ( CLEAR ?auto_363142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_363138 ?auto_363139 ?auto_363140 ?auto_363141 ?auto_363142 )
      ( MAKE-12PILE ?auto_363138 ?auto_363139 ?auto_363140 ?auto_363141 ?auto_363142 ?auto_363143 ?auto_363144 ?auto_363145 ?auto_363146 ?auto_363147 ?auto_363148 ?auto_363149 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_363188 - BLOCK
      ?auto_363189 - BLOCK
      ?auto_363190 - BLOCK
      ?auto_363191 - BLOCK
      ?auto_363192 - BLOCK
      ?auto_363193 - BLOCK
      ?auto_363194 - BLOCK
      ?auto_363195 - BLOCK
      ?auto_363196 - BLOCK
      ?auto_363197 - BLOCK
      ?auto_363198 - BLOCK
      ?auto_363199 - BLOCK
    )
    :vars
    (
      ?auto_363200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_363199 ?auto_363200 ) ( ON-TABLE ?auto_363188 ) ( ON ?auto_363189 ?auto_363188 ) ( ON ?auto_363190 ?auto_363189 ) ( not ( = ?auto_363188 ?auto_363189 ) ) ( not ( = ?auto_363188 ?auto_363190 ) ) ( not ( = ?auto_363188 ?auto_363191 ) ) ( not ( = ?auto_363188 ?auto_363192 ) ) ( not ( = ?auto_363188 ?auto_363193 ) ) ( not ( = ?auto_363188 ?auto_363194 ) ) ( not ( = ?auto_363188 ?auto_363195 ) ) ( not ( = ?auto_363188 ?auto_363196 ) ) ( not ( = ?auto_363188 ?auto_363197 ) ) ( not ( = ?auto_363188 ?auto_363198 ) ) ( not ( = ?auto_363188 ?auto_363199 ) ) ( not ( = ?auto_363188 ?auto_363200 ) ) ( not ( = ?auto_363189 ?auto_363190 ) ) ( not ( = ?auto_363189 ?auto_363191 ) ) ( not ( = ?auto_363189 ?auto_363192 ) ) ( not ( = ?auto_363189 ?auto_363193 ) ) ( not ( = ?auto_363189 ?auto_363194 ) ) ( not ( = ?auto_363189 ?auto_363195 ) ) ( not ( = ?auto_363189 ?auto_363196 ) ) ( not ( = ?auto_363189 ?auto_363197 ) ) ( not ( = ?auto_363189 ?auto_363198 ) ) ( not ( = ?auto_363189 ?auto_363199 ) ) ( not ( = ?auto_363189 ?auto_363200 ) ) ( not ( = ?auto_363190 ?auto_363191 ) ) ( not ( = ?auto_363190 ?auto_363192 ) ) ( not ( = ?auto_363190 ?auto_363193 ) ) ( not ( = ?auto_363190 ?auto_363194 ) ) ( not ( = ?auto_363190 ?auto_363195 ) ) ( not ( = ?auto_363190 ?auto_363196 ) ) ( not ( = ?auto_363190 ?auto_363197 ) ) ( not ( = ?auto_363190 ?auto_363198 ) ) ( not ( = ?auto_363190 ?auto_363199 ) ) ( not ( = ?auto_363190 ?auto_363200 ) ) ( not ( = ?auto_363191 ?auto_363192 ) ) ( not ( = ?auto_363191 ?auto_363193 ) ) ( not ( = ?auto_363191 ?auto_363194 ) ) ( not ( = ?auto_363191 ?auto_363195 ) ) ( not ( = ?auto_363191 ?auto_363196 ) ) ( not ( = ?auto_363191 ?auto_363197 ) ) ( not ( = ?auto_363191 ?auto_363198 ) ) ( not ( = ?auto_363191 ?auto_363199 ) ) ( not ( = ?auto_363191 ?auto_363200 ) ) ( not ( = ?auto_363192 ?auto_363193 ) ) ( not ( = ?auto_363192 ?auto_363194 ) ) ( not ( = ?auto_363192 ?auto_363195 ) ) ( not ( = ?auto_363192 ?auto_363196 ) ) ( not ( = ?auto_363192 ?auto_363197 ) ) ( not ( = ?auto_363192 ?auto_363198 ) ) ( not ( = ?auto_363192 ?auto_363199 ) ) ( not ( = ?auto_363192 ?auto_363200 ) ) ( not ( = ?auto_363193 ?auto_363194 ) ) ( not ( = ?auto_363193 ?auto_363195 ) ) ( not ( = ?auto_363193 ?auto_363196 ) ) ( not ( = ?auto_363193 ?auto_363197 ) ) ( not ( = ?auto_363193 ?auto_363198 ) ) ( not ( = ?auto_363193 ?auto_363199 ) ) ( not ( = ?auto_363193 ?auto_363200 ) ) ( not ( = ?auto_363194 ?auto_363195 ) ) ( not ( = ?auto_363194 ?auto_363196 ) ) ( not ( = ?auto_363194 ?auto_363197 ) ) ( not ( = ?auto_363194 ?auto_363198 ) ) ( not ( = ?auto_363194 ?auto_363199 ) ) ( not ( = ?auto_363194 ?auto_363200 ) ) ( not ( = ?auto_363195 ?auto_363196 ) ) ( not ( = ?auto_363195 ?auto_363197 ) ) ( not ( = ?auto_363195 ?auto_363198 ) ) ( not ( = ?auto_363195 ?auto_363199 ) ) ( not ( = ?auto_363195 ?auto_363200 ) ) ( not ( = ?auto_363196 ?auto_363197 ) ) ( not ( = ?auto_363196 ?auto_363198 ) ) ( not ( = ?auto_363196 ?auto_363199 ) ) ( not ( = ?auto_363196 ?auto_363200 ) ) ( not ( = ?auto_363197 ?auto_363198 ) ) ( not ( = ?auto_363197 ?auto_363199 ) ) ( not ( = ?auto_363197 ?auto_363200 ) ) ( not ( = ?auto_363198 ?auto_363199 ) ) ( not ( = ?auto_363198 ?auto_363200 ) ) ( not ( = ?auto_363199 ?auto_363200 ) ) ( ON ?auto_363198 ?auto_363199 ) ( ON ?auto_363197 ?auto_363198 ) ( ON ?auto_363196 ?auto_363197 ) ( ON ?auto_363195 ?auto_363196 ) ( ON ?auto_363194 ?auto_363195 ) ( ON ?auto_363193 ?auto_363194 ) ( ON ?auto_363192 ?auto_363193 ) ( CLEAR ?auto_363190 ) ( ON ?auto_363191 ?auto_363192 ) ( CLEAR ?auto_363191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_363188 ?auto_363189 ?auto_363190 ?auto_363191 )
      ( MAKE-12PILE ?auto_363188 ?auto_363189 ?auto_363190 ?auto_363191 ?auto_363192 ?auto_363193 ?auto_363194 ?auto_363195 ?auto_363196 ?auto_363197 ?auto_363198 ?auto_363199 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_363238 - BLOCK
      ?auto_363239 - BLOCK
      ?auto_363240 - BLOCK
      ?auto_363241 - BLOCK
      ?auto_363242 - BLOCK
      ?auto_363243 - BLOCK
      ?auto_363244 - BLOCK
      ?auto_363245 - BLOCK
      ?auto_363246 - BLOCK
      ?auto_363247 - BLOCK
      ?auto_363248 - BLOCK
      ?auto_363249 - BLOCK
    )
    :vars
    (
      ?auto_363250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_363249 ?auto_363250 ) ( ON-TABLE ?auto_363238 ) ( ON ?auto_363239 ?auto_363238 ) ( not ( = ?auto_363238 ?auto_363239 ) ) ( not ( = ?auto_363238 ?auto_363240 ) ) ( not ( = ?auto_363238 ?auto_363241 ) ) ( not ( = ?auto_363238 ?auto_363242 ) ) ( not ( = ?auto_363238 ?auto_363243 ) ) ( not ( = ?auto_363238 ?auto_363244 ) ) ( not ( = ?auto_363238 ?auto_363245 ) ) ( not ( = ?auto_363238 ?auto_363246 ) ) ( not ( = ?auto_363238 ?auto_363247 ) ) ( not ( = ?auto_363238 ?auto_363248 ) ) ( not ( = ?auto_363238 ?auto_363249 ) ) ( not ( = ?auto_363238 ?auto_363250 ) ) ( not ( = ?auto_363239 ?auto_363240 ) ) ( not ( = ?auto_363239 ?auto_363241 ) ) ( not ( = ?auto_363239 ?auto_363242 ) ) ( not ( = ?auto_363239 ?auto_363243 ) ) ( not ( = ?auto_363239 ?auto_363244 ) ) ( not ( = ?auto_363239 ?auto_363245 ) ) ( not ( = ?auto_363239 ?auto_363246 ) ) ( not ( = ?auto_363239 ?auto_363247 ) ) ( not ( = ?auto_363239 ?auto_363248 ) ) ( not ( = ?auto_363239 ?auto_363249 ) ) ( not ( = ?auto_363239 ?auto_363250 ) ) ( not ( = ?auto_363240 ?auto_363241 ) ) ( not ( = ?auto_363240 ?auto_363242 ) ) ( not ( = ?auto_363240 ?auto_363243 ) ) ( not ( = ?auto_363240 ?auto_363244 ) ) ( not ( = ?auto_363240 ?auto_363245 ) ) ( not ( = ?auto_363240 ?auto_363246 ) ) ( not ( = ?auto_363240 ?auto_363247 ) ) ( not ( = ?auto_363240 ?auto_363248 ) ) ( not ( = ?auto_363240 ?auto_363249 ) ) ( not ( = ?auto_363240 ?auto_363250 ) ) ( not ( = ?auto_363241 ?auto_363242 ) ) ( not ( = ?auto_363241 ?auto_363243 ) ) ( not ( = ?auto_363241 ?auto_363244 ) ) ( not ( = ?auto_363241 ?auto_363245 ) ) ( not ( = ?auto_363241 ?auto_363246 ) ) ( not ( = ?auto_363241 ?auto_363247 ) ) ( not ( = ?auto_363241 ?auto_363248 ) ) ( not ( = ?auto_363241 ?auto_363249 ) ) ( not ( = ?auto_363241 ?auto_363250 ) ) ( not ( = ?auto_363242 ?auto_363243 ) ) ( not ( = ?auto_363242 ?auto_363244 ) ) ( not ( = ?auto_363242 ?auto_363245 ) ) ( not ( = ?auto_363242 ?auto_363246 ) ) ( not ( = ?auto_363242 ?auto_363247 ) ) ( not ( = ?auto_363242 ?auto_363248 ) ) ( not ( = ?auto_363242 ?auto_363249 ) ) ( not ( = ?auto_363242 ?auto_363250 ) ) ( not ( = ?auto_363243 ?auto_363244 ) ) ( not ( = ?auto_363243 ?auto_363245 ) ) ( not ( = ?auto_363243 ?auto_363246 ) ) ( not ( = ?auto_363243 ?auto_363247 ) ) ( not ( = ?auto_363243 ?auto_363248 ) ) ( not ( = ?auto_363243 ?auto_363249 ) ) ( not ( = ?auto_363243 ?auto_363250 ) ) ( not ( = ?auto_363244 ?auto_363245 ) ) ( not ( = ?auto_363244 ?auto_363246 ) ) ( not ( = ?auto_363244 ?auto_363247 ) ) ( not ( = ?auto_363244 ?auto_363248 ) ) ( not ( = ?auto_363244 ?auto_363249 ) ) ( not ( = ?auto_363244 ?auto_363250 ) ) ( not ( = ?auto_363245 ?auto_363246 ) ) ( not ( = ?auto_363245 ?auto_363247 ) ) ( not ( = ?auto_363245 ?auto_363248 ) ) ( not ( = ?auto_363245 ?auto_363249 ) ) ( not ( = ?auto_363245 ?auto_363250 ) ) ( not ( = ?auto_363246 ?auto_363247 ) ) ( not ( = ?auto_363246 ?auto_363248 ) ) ( not ( = ?auto_363246 ?auto_363249 ) ) ( not ( = ?auto_363246 ?auto_363250 ) ) ( not ( = ?auto_363247 ?auto_363248 ) ) ( not ( = ?auto_363247 ?auto_363249 ) ) ( not ( = ?auto_363247 ?auto_363250 ) ) ( not ( = ?auto_363248 ?auto_363249 ) ) ( not ( = ?auto_363248 ?auto_363250 ) ) ( not ( = ?auto_363249 ?auto_363250 ) ) ( ON ?auto_363248 ?auto_363249 ) ( ON ?auto_363247 ?auto_363248 ) ( ON ?auto_363246 ?auto_363247 ) ( ON ?auto_363245 ?auto_363246 ) ( ON ?auto_363244 ?auto_363245 ) ( ON ?auto_363243 ?auto_363244 ) ( ON ?auto_363242 ?auto_363243 ) ( ON ?auto_363241 ?auto_363242 ) ( CLEAR ?auto_363239 ) ( ON ?auto_363240 ?auto_363241 ) ( CLEAR ?auto_363240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_363238 ?auto_363239 ?auto_363240 )
      ( MAKE-12PILE ?auto_363238 ?auto_363239 ?auto_363240 ?auto_363241 ?auto_363242 ?auto_363243 ?auto_363244 ?auto_363245 ?auto_363246 ?auto_363247 ?auto_363248 ?auto_363249 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_363288 - BLOCK
      ?auto_363289 - BLOCK
      ?auto_363290 - BLOCK
      ?auto_363291 - BLOCK
      ?auto_363292 - BLOCK
      ?auto_363293 - BLOCK
      ?auto_363294 - BLOCK
      ?auto_363295 - BLOCK
      ?auto_363296 - BLOCK
      ?auto_363297 - BLOCK
      ?auto_363298 - BLOCK
      ?auto_363299 - BLOCK
    )
    :vars
    (
      ?auto_363300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_363299 ?auto_363300 ) ( ON-TABLE ?auto_363288 ) ( not ( = ?auto_363288 ?auto_363289 ) ) ( not ( = ?auto_363288 ?auto_363290 ) ) ( not ( = ?auto_363288 ?auto_363291 ) ) ( not ( = ?auto_363288 ?auto_363292 ) ) ( not ( = ?auto_363288 ?auto_363293 ) ) ( not ( = ?auto_363288 ?auto_363294 ) ) ( not ( = ?auto_363288 ?auto_363295 ) ) ( not ( = ?auto_363288 ?auto_363296 ) ) ( not ( = ?auto_363288 ?auto_363297 ) ) ( not ( = ?auto_363288 ?auto_363298 ) ) ( not ( = ?auto_363288 ?auto_363299 ) ) ( not ( = ?auto_363288 ?auto_363300 ) ) ( not ( = ?auto_363289 ?auto_363290 ) ) ( not ( = ?auto_363289 ?auto_363291 ) ) ( not ( = ?auto_363289 ?auto_363292 ) ) ( not ( = ?auto_363289 ?auto_363293 ) ) ( not ( = ?auto_363289 ?auto_363294 ) ) ( not ( = ?auto_363289 ?auto_363295 ) ) ( not ( = ?auto_363289 ?auto_363296 ) ) ( not ( = ?auto_363289 ?auto_363297 ) ) ( not ( = ?auto_363289 ?auto_363298 ) ) ( not ( = ?auto_363289 ?auto_363299 ) ) ( not ( = ?auto_363289 ?auto_363300 ) ) ( not ( = ?auto_363290 ?auto_363291 ) ) ( not ( = ?auto_363290 ?auto_363292 ) ) ( not ( = ?auto_363290 ?auto_363293 ) ) ( not ( = ?auto_363290 ?auto_363294 ) ) ( not ( = ?auto_363290 ?auto_363295 ) ) ( not ( = ?auto_363290 ?auto_363296 ) ) ( not ( = ?auto_363290 ?auto_363297 ) ) ( not ( = ?auto_363290 ?auto_363298 ) ) ( not ( = ?auto_363290 ?auto_363299 ) ) ( not ( = ?auto_363290 ?auto_363300 ) ) ( not ( = ?auto_363291 ?auto_363292 ) ) ( not ( = ?auto_363291 ?auto_363293 ) ) ( not ( = ?auto_363291 ?auto_363294 ) ) ( not ( = ?auto_363291 ?auto_363295 ) ) ( not ( = ?auto_363291 ?auto_363296 ) ) ( not ( = ?auto_363291 ?auto_363297 ) ) ( not ( = ?auto_363291 ?auto_363298 ) ) ( not ( = ?auto_363291 ?auto_363299 ) ) ( not ( = ?auto_363291 ?auto_363300 ) ) ( not ( = ?auto_363292 ?auto_363293 ) ) ( not ( = ?auto_363292 ?auto_363294 ) ) ( not ( = ?auto_363292 ?auto_363295 ) ) ( not ( = ?auto_363292 ?auto_363296 ) ) ( not ( = ?auto_363292 ?auto_363297 ) ) ( not ( = ?auto_363292 ?auto_363298 ) ) ( not ( = ?auto_363292 ?auto_363299 ) ) ( not ( = ?auto_363292 ?auto_363300 ) ) ( not ( = ?auto_363293 ?auto_363294 ) ) ( not ( = ?auto_363293 ?auto_363295 ) ) ( not ( = ?auto_363293 ?auto_363296 ) ) ( not ( = ?auto_363293 ?auto_363297 ) ) ( not ( = ?auto_363293 ?auto_363298 ) ) ( not ( = ?auto_363293 ?auto_363299 ) ) ( not ( = ?auto_363293 ?auto_363300 ) ) ( not ( = ?auto_363294 ?auto_363295 ) ) ( not ( = ?auto_363294 ?auto_363296 ) ) ( not ( = ?auto_363294 ?auto_363297 ) ) ( not ( = ?auto_363294 ?auto_363298 ) ) ( not ( = ?auto_363294 ?auto_363299 ) ) ( not ( = ?auto_363294 ?auto_363300 ) ) ( not ( = ?auto_363295 ?auto_363296 ) ) ( not ( = ?auto_363295 ?auto_363297 ) ) ( not ( = ?auto_363295 ?auto_363298 ) ) ( not ( = ?auto_363295 ?auto_363299 ) ) ( not ( = ?auto_363295 ?auto_363300 ) ) ( not ( = ?auto_363296 ?auto_363297 ) ) ( not ( = ?auto_363296 ?auto_363298 ) ) ( not ( = ?auto_363296 ?auto_363299 ) ) ( not ( = ?auto_363296 ?auto_363300 ) ) ( not ( = ?auto_363297 ?auto_363298 ) ) ( not ( = ?auto_363297 ?auto_363299 ) ) ( not ( = ?auto_363297 ?auto_363300 ) ) ( not ( = ?auto_363298 ?auto_363299 ) ) ( not ( = ?auto_363298 ?auto_363300 ) ) ( not ( = ?auto_363299 ?auto_363300 ) ) ( ON ?auto_363298 ?auto_363299 ) ( ON ?auto_363297 ?auto_363298 ) ( ON ?auto_363296 ?auto_363297 ) ( ON ?auto_363295 ?auto_363296 ) ( ON ?auto_363294 ?auto_363295 ) ( ON ?auto_363293 ?auto_363294 ) ( ON ?auto_363292 ?auto_363293 ) ( ON ?auto_363291 ?auto_363292 ) ( ON ?auto_363290 ?auto_363291 ) ( CLEAR ?auto_363288 ) ( ON ?auto_363289 ?auto_363290 ) ( CLEAR ?auto_363289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_363288 ?auto_363289 )
      ( MAKE-12PILE ?auto_363288 ?auto_363289 ?auto_363290 ?auto_363291 ?auto_363292 ?auto_363293 ?auto_363294 ?auto_363295 ?auto_363296 ?auto_363297 ?auto_363298 ?auto_363299 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_363338 - BLOCK
      ?auto_363339 - BLOCK
      ?auto_363340 - BLOCK
      ?auto_363341 - BLOCK
      ?auto_363342 - BLOCK
      ?auto_363343 - BLOCK
      ?auto_363344 - BLOCK
      ?auto_363345 - BLOCK
      ?auto_363346 - BLOCK
      ?auto_363347 - BLOCK
      ?auto_363348 - BLOCK
      ?auto_363349 - BLOCK
    )
    :vars
    (
      ?auto_363350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_363349 ?auto_363350 ) ( not ( = ?auto_363338 ?auto_363339 ) ) ( not ( = ?auto_363338 ?auto_363340 ) ) ( not ( = ?auto_363338 ?auto_363341 ) ) ( not ( = ?auto_363338 ?auto_363342 ) ) ( not ( = ?auto_363338 ?auto_363343 ) ) ( not ( = ?auto_363338 ?auto_363344 ) ) ( not ( = ?auto_363338 ?auto_363345 ) ) ( not ( = ?auto_363338 ?auto_363346 ) ) ( not ( = ?auto_363338 ?auto_363347 ) ) ( not ( = ?auto_363338 ?auto_363348 ) ) ( not ( = ?auto_363338 ?auto_363349 ) ) ( not ( = ?auto_363338 ?auto_363350 ) ) ( not ( = ?auto_363339 ?auto_363340 ) ) ( not ( = ?auto_363339 ?auto_363341 ) ) ( not ( = ?auto_363339 ?auto_363342 ) ) ( not ( = ?auto_363339 ?auto_363343 ) ) ( not ( = ?auto_363339 ?auto_363344 ) ) ( not ( = ?auto_363339 ?auto_363345 ) ) ( not ( = ?auto_363339 ?auto_363346 ) ) ( not ( = ?auto_363339 ?auto_363347 ) ) ( not ( = ?auto_363339 ?auto_363348 ) ) ( not ( = ?auto_363339 ?auto_363349 ) ) ( not ( = ?auto_363339 ?auto_363350 ) ) ( not ( = ?auto_363340 ?auto_363341 ) ) ( not ( = ?auto_363340 ?auto_363342 ) ) ( not ( = ?auto_363340 ?auto_363343 ) ) ( not ( = ?auto_363340 ?auto_363344 ) ) ( not ( = ?auto_363340 ?auto_363345 ) ) ( not ( = ?auto_363340 ?auto_363346 ) ) ( not ( = ?auto_363340 ?auto_363347 ) ) ( not ( = ?auto_363340 ?auto_363348 ) ) ( not ( = ?auto_363340 ?auto_363349 ) ) ( not ( = ?auto_363340 ?auto_363350 ) ) ( not ( = ?auto_363341 ?auto_363342 ) ) ( not ( = ?auto_363341 ?auto_363343 ) ) ( not ( = ?auto_363341 ?auto_363344 ) ) ( not ( = ?auto_363341 ?auto_363345 ) ) ( not ( = ?auto_363341 ?auto_363346 ) ) ( not ( = ?auto_363341 ?auto_363347 ) ) ( not ( = ?auto_363341 ?auto_363348 ) ) ( not ( = ?auto_363341 ?auto_363349 ) ) ( not ( = ?auto_363341 ?auto_363350 ) ) ( not ( = ?auto_363342 ?auto_363343 ) ) ( not ( = ?auto_363342 ?auto_363344 ) ) ( not ( = ?auto_363342 ?auto_363345 ) ) ( not ( = ?auto_363342 ?auto_363346 ) ) ( not ( = ?auto_363342 ?auto_363347 ) ) ( not ( = ?auto_363342 ?auto_363348 ) ) ( not ( = ?auto_363342 ?auto_363349 ) ) ( not ( = ?auto_363342 ?auto_363350 ) ) ( not ( = ?auto_363343 ?auto_363344 ) ) ( not ( = ?auto_363343 ?auto_363345 ) ) ( not ( = ?auto_363343 ?auto_363346 ) ) ( not ( = ?auto_363343 ?auto_363347 ) ) ( not ( = ?auto_363343 ?auto_363348 ) ) ( not ( = ?auto_363343 ?auto_363349 ) ) ( not ( = ?auto_363343 ?auto_363350 ) ) ( not ( = ?auto_363344 ?auto_363345 ) ) ( not ( = ?auto_363344 ?auto_363346 ) ) ( not ( = ?auto_363344 ?auto_363347 ) ) ( not ( = ?auto_363344 ?auto_363348 ) ) ( not ( = ?auto_363344 ?auto_363349 ) ) ( not ( = ?auto_363344 ?auto_363350 ) ) ( not ( = ?auto_363345 ?auto_363346 ) ) ( not ( = ?auto_363345 ?auto_363347 ) ) ( not ( = ?auto_363345 ?auto_363348 ) ) ( not ( = ?auto_363345 ?auto_363349 ) ) ( not ( = ?auto_363345 ?auto_363350 ) ) ( not ( = ?auto_363346 ?auto_363347 ) ) ( not ( = ?auto_363346 ?auto_363348 ) ) ( not ( = ?auto_363346 ?auto_363349 ) ) ( not ( = ?auto_363346 ?auto_363350 ) ) ( not ( = ?auto_363347 ?auto_363348 ) ) ( not ( = ?auto_363347 ?auto_363349 ) ) ( not ( = ?auto_363347 ?auto_363350 ) ) ( not ( = ?auto_363348 ?auto_363349 ) ) ( not ( = ?auto_363348 ?auto_363350 ) ) ( not ( = ?auto_363349 ?auto_363350 ) ) ( ON ?auto_363348 ?auto_363349 ) ( ON ?auto_363347 ?auto_363348 ) ( ON ?auto_363346 ?auto_363347 ) ( ON ?auto_363345 ?auto_363346 ) ( ON ?auto_363344 ?auto_363345 ) ( ON ?auto_363343 ?auto_363344 ) ( ON ?auto_363342 ?auto_363343 ) ( ON ?auto_363341 ?auto_363342 ) ( ON ?auto_363340 ?auto_363341 ) ( ON ?auto_363339 ?auto_363340 ) ( ON ?auto_363338 ?auto_363339 ) ( CLEAR ?auto_363338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_363338 )
      ( MAKE-12PILE ?auto_363338 ?auto_363339 ?auto_363340 ?auto_363341 ?auto_363342 ?auto_363343 ?auto_363344 ?auto_363345 ?auto_363346 ?auto_363347 ?auto_363348 ?auto_363349 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_363389 - BLOCK
      ?auto_363390 - BLOCK
      ?auto_363391 - BLOCK
      ?auto_363392 - BLOCK
      ?auto_363393 - BLOCK
      ?auto_363394 - BLOCK
      ?auto_363395 - BLOCK
      ?auto_363396 - BLOCK
      ?auto_363397 - BLOCK
      ?auto_363398 - BLOCK
      ?auto_363399 - BLOCK
      ?auto_363400 - BLOCK
      ?auto_363401 - BLOCK
    )
    :vars
    (
      ?auto_363402 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_363400 ) ( ON ?auto_363401 ?auto_363402 ) ( CLEAR ?auto_363401 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_363389 ) ( ON ?auto_363390 ?auto_363389 ) ( ON ?auto_363391 ?auto_363390 ) ( ON ?auto_363392 ?auto_363391 ) ( ON ?auto_363393 ?auto_363392 ) ( ON ?auto_363394 ?auto_363393 ) ( ON ?auto_363395 ?auto_363394 ) ( ON ?auto_363396 ?auto_363395 ) ( ON ?auto_363397 ?auto_363396 ) ( ON ?auto_363398 ?auto_363397 ) ( ON ?auto_363399 ?auto_363398 ) ( ON ?auto_363400 ?auto_363399 ) ( not ( = ?auto_363389 ?auto_363390 ) ) ( not ( = ?auto_363389 ?auto_363391 ) ) ( not ( = ?auto_363389 ?auto_363392 ) ) ( not ( = ?auto_363389 ?auto_363393 ) ) ( not ( = ?auto_363389 ?auto_363394 ) ) ( not ( = ?auto_363389 ?auto_363395 ) ) ( not ( = ?auto_363389 ?auto_363396 ) ) ( not ( = ?auto_363389 ?auto_363397 ) ) ( not ( = ?auto_363389 ?auto_363398 ) ) ( not ( = ?auto_363389 ?auto_363399 ) ) ( not ( = ?auto_363389 ?auto_363400 ) ) ( not ( = ?auto_363389 ?auto_363401 ) ) ( not ( = ?auto_363389 ?auto_363402 ) ) ( not ( = ?auto_363390 ?auto_363391 ) ) ( not ( = ?auto_363390 ?auto_363392 ) ) ( not ( = ?auto_363390 ?auto_363393 ) ) ( not ( = ?auto_363390 ?auto_363394 ) ) ( not ( = ?auto_363390 ?auto_363395 ) ) ( not ( = ?auto_363390 ?auto_363396 ) ) ( not ( = ?auto_363390 ?auto_363397 ) ) ( not ( = ?auto_363390 ?auto_363398 ) ) ( not ( = ?auto_363390 ?auto_363399 ) ) ( not ( = ?auto_363390 ?auto_363400 ) ) ( not ( = ?auto_363390 ?auto_363401 ) ) ( not ( = ?auto_363390 ?auto_363402 ) ) ( not ( = ?auto_363391 ?auto_363392 ) ) ( not ( = ?auto_363391 ?auto_363393 ) ) ( not ( = ?auto_363391 ?auto_363394 ) ) ( not ( = ?auto_363391 ?auto_363395 ) ) ( not ( = ?auto_363391 ?auto_363396 ) ) ( not ( = ?auto_363391 ?auto_363397 ) ) ( not ( = ?auto_363391 ?auto_363398 ) ) ( not ( = ?auto_363391 ?auto_363399 ) ) ( not ( = ?auto_363391 ?auto_363400 ) ) ( not ( = ?auto_363391 ?auto_363401 ) ) ( not ( = ?auto_363391 ?auto_363402 ) ) ( not ( = ?auto_363392 ?auto_363393 ) ) ( not ( = ?auto_363392 ?auto_363394 ) ) ( not ( = ?auto_363392 ?auto_363395 ) ) ( not ( = ?auto_363392 ?auto_363396 ) ) ( not ( = ?auto_363392 ?auto_363397 ) ) ( not ( = ?auto_363392 ?auto_363398 ) ) ( not ( = ?auto_363392 ?auto_363399 ) ) ( not ( = ?auto_363392 ?auto_363400 ) ) ( not ( = ?auto_363392 ?auto_363401 ) ) ( not ( = ?auto_363392 ?auto_363402 ) ) ( not ( = ?auto_363393 ?auto_363394 ) ) ( not ( = ?auto_363393 ?auto_363395 ) ) ( not ( = ?auto_363393 ?auto_363396 ) ) ( not ( = ?auto_363393 ?auto_363397 ) ) ( not ( = ?auto_363393 ?auto_363398 ) ) ( not ( = ?auto_363393 ?auto_363399 ) ) ( not ( = ?auto_363393 ?auto_363400 ) ) ( not ( = ?auto_363393 ?auto_363401 ) ) ( not ( = ?auto_363393 ?auto_363402 ) ) ( not ( = ?auto_363394 ?auto_363395 ) ) ( not ( = ?auto_363394 ?auto_363396 ) ) ( not ( = ?auto_363394 ?auto_363397 ) ) ( not ( = ?auto_363394 ?auto_363398 ) ) ( not ( = ?auto_363394 ?auto_363399 ) ) ( not ( = ?auto_363394 ?auto_363400 ) ) ( not ( = ?auto_363394 ?auto_363401 ) ) ( not ( = ?auto_363394 ?auto_363402 ) ) ( not ( = ?auto_363395 ?auto_363396 ) ) ( not ( = ?auto_363395 ?auto_363397 ) ) ( not ( = ?auto_363395 ?auto_363398 ) ) ( not ( = ?auto_363395 ?auto_363399 ) ) ( not ( = ?auto_363395 ?auto_363400 ) ) ( not ( = ?auto_363395 ?auto_363401 ) ) ( not ( = ?auto_363395 ?auto_363402 ) ) ( not ( = ?auto_363396 ?auto_363397 ) ) ( not ( = ?auto_363396 ?auto_363398 ) ) ( not ( = ?auto_363396 ?auto_363399 ) ) ( not ( = ?auto_363396 ?auto_363400 ) ) ( not ( = ?auto_363396 ?auto_363401 ) ) ( not ( = ?auto_363396 ?auto_363402 ) ) ( not ( = ?auto_363397 ?auto_363398 ) ) ( not ( = ?auto_363397 ?auto_363399 ) ) ( not ( = ?auto_363397 ?auto_363400 ) ) ( not ( = ?auto_363397 ?auto_363401 ) ) ( not ( = ?auto_363397 ?auto_363402 ) ) ( not ( = ?auto_363398 ?auto_363399 ) ) ( not ( = ?auto_363398 ?auto_363400 ) ) ( not ( = ?auto_363398 ?auto_363401 ) ) ( not ( = ?auto_363398 ?auto_363402 ) ) ( not ( = ?auto_363399 ?auto_363400 ) ) ( not ( = ?auto_363399 ?auto_363401 ) ) ( not ( = ?auto_363399 ?auto_363402 ) ) ( not ( = ?auto_363400 ?auto_363401 ) ) ( not ( = ?auto_363400 ?auto_363402 ) ) ( not ( = ?auto_363401 ?auto_363402 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_363401 ?auto_363402 )
      ( !STACK ?auto_363401 ?auto_363400 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_363443 - BLOCK
      ?auto_363444 - BLOCK
      ?auto_363445 - BLOCK
      ?auto_363446 - BLOCK
      ?auto_363447 - BLOCK
      ?auto_363448 - BLOCK
      ?auto_363449 - BLOCK
      ?auto_363450 - BLOCK
      ?auto_363451 - BLOCK
      ?auto_363452 - BLOCK
      ?auto_363453 - BLOCK
      ?auto_363454 - BLOCK
      ?auto_363455 - BLOCK
    )
    :vars
    (
      ?auto_363456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_363455 ?auto_363456 ) ( ON-TABLE ?auto_363443 ) ( ON ?auto_363444 ?auto_363443 ) ( ON ?auto_363445 ?auto_363444 ) ( ON ?auto_363446 ?auto_363445 ) ( ON ?auto_363447 ?auto_363446 ) ( ON ?auto_363448 ?auto_363447 ) ( ON ?auto_363449 ?auto_363448 ) ( ON ?auto_363450 ?auto_363449 ) ( ON ?auto_363451 ?auto_363450 ) ( ON ?auto_363452 ?auto_363451 ) ( ON ?auto_363453 ?auto_363452 ) ( not ( = ?auto_363443 ?auto_363444 ) ) ( not ( = ?auto_363443 ?auto_363445 ) ) ( not ( = ?auto_363443 ?auto_363446 ) ) ( not ( = ?auto_363443 ?auto_363447 ) ) ( not ( = ?auto_363443 ?auto_363448 ) ) ( not ( = ?auto_363443 ?auto_363449 ) ) ( not ( = ?auto_363443 ?auto_363450 ) ) ( not ( = ?auto_363443 ?auto_363451 ) ) ( not ( = ?auto_363443 ?auto_363452 ) ) ( not ( = ?auto_363443 ?auto_363453 ) ) ( not ( = ?auto_363443 ?auto_363454 ) ) ( not ( = ?auto_363443 ?auto_363455 ) ) ( not ( = ?auto_363443 ?auto_363456 ) ) ( not ( = ?auto_363444 ?auto_363445 ) ) ( not ( = ?auto_363444 ?auto_363446 ) ) ( not ( = ?auto_363444 ?auto_363447 ) ) ( not ( = ?auto_363444 ?auto_363448 ) ) ( not ( = ?auto_363444 ?auto_363449 ) ) ( not ( = ?auto_363444 ?auto_363450 ) ) ( not ( = ?auto_363444 ?auto_363451 ) ) ( not ( = ?auto_363444 ?auto_363452 ) ) ( not ( = ?auto_363444 ?auto_363453 ) ) ( not ( = ?auto_363444 ?auto_363454 ) ) ( not ( = ?auto_363444 ?auto_363455 ) ) ( not ( = ?auto_363444 ?auto_363456 ) ) ( not ( = ?auto_363445 ?auto_363446 ) ) ( not ( = ?auto_363445 ?auto_363447 ) ) ( not ( = ?auto_363445 ?auto_363448 ) ) ( not ( = ?auto_363445 ?auto_363449 ) ) ( not ( = ?auto_363445 ?auto_363450 ) ) ( not ( = ?auto_363445 ?auto_363451 ) ) ( not ( = ?auto_363445 ?auto_363452 ) ) ( not ( = ?auto_363445 ?auto_363453 ) ) ( not ( = ?auto_363445 ?auto_363454 ) ) ( not ( = ?auto_363445 ?auto_363455 ) ) ( not ( = ?auto_363445 ?auto_363456 ) ) ( not ( = ?auto_363446 ?auto_363447 ) ) ( not ( = ?auto_363446 ?auto_363448 ) ) ( not ( = ?auto_363446 ?auto_363449 ) ) ( not ( = ?auto_363446 ?auto_363450 ) ) ( not ( = ?auto_363446 ?auto_363451 ) ) ( not ( = ?auto_363446 ?auto_363452 ) ) ( not ( = ?auto_363446 ?auto_363453 ) ) ( not ( = ?auto_363446 ?auto_363454 ) ) ( not ( = ?auto_363446 ?auto_363455 ) ) ( not ( = ?auto_363446 ?auto_363456 ) ) ( not ( = ?auto_363447 ?auto_363448 ) ) ( not ( = ?auto_363447 ?auto_363449 ) ) ( not ( = ?auto_363447 ?auto_363450 ) ) ( not ( = ?auto_363447 ?auto_363451 ) ) ( not ( = ?auto_363447 ?auto_363452 ) ) ( not ( = ?auto_363447 ?auto_363453 ) ) ( not ( = ?auto_363447 ?auto_363454 ) ) ( not ( = ?auto_363447 ?auto_363455 ) ) ( not ( = ?auto_363447 ?auto_363456 ) ) ( not ( = ?auto_363448 ?auto_363449 ) ) ( not ( = ?auto_363448 ?auto_363450 ) ) ( not ( = ?auto_363448 ?auto_363451 ) ) ( not ( = ?auto_363448 ?auto_363452 ) ) ( not ( = ?auto_363448 ?auto_363453 ) ) ( not ( = ?auto_363448 ?auto_363454 ) ) ( not ( = ?auto_363448 ?auto_363455 ) ) ( not ( = ?auto_363448 ?auto_363456 ) ) ( not ( = ?auto_363449 ?auto_363450 ) ) ( not ( = ?auto_363449 ?auto_363451 ) ) ( not ( = ?auto_363449 ?auto_363452 ) ) ( not ( = ?auto_363449 ?auto_363453 ) ) ( not ( = ?auto_363449 ?auto_363454 ) ) ( not ( = ?auto_363449 ?auto_363455 ) ) ( not ( = ?auto_363449 ?auto_363456 ) ) ( not ( = ?auto_363450 ?auto_363451 ) ) ( not ( = ?auto_363450 ?auto_363452 ) ) ( not ( = ?auto_363450 ?auto_363453 ) ) ( not ( = ?auto_363450 ?auto_363454 ) ) ( not ( = ?auto_363450 ?auto_363455 ) ) ( not ( = ?auto_363450 ?auto_363456 ) ) ( not ( = ?auto_363451 ?auto_363452 ) ) ( not ( = ?auto_363451 ?auto_363453 ) ) ( not ( = ?auto_363451 ?auto_363454 ) ) ( not ( = ?auto_363451 ?auto_363455 ) ) ( not ( = ?auto_363451 ?auto_363456 ) ) ( not ( = ?auto_363452 ?auto_363453 ) ) ( not ( = ?auto_363452 ?auto_363454 ) ) ( not ( = ?auto_363452 ?auto_363455 ) ) ( not ( = ?auto_363452 ?auto_363456 ) ) ( not ( = ?auto_363453 ?auto_363454 ) ) ( not ( = ?auto_363453 ?auto_363455 ) ) ( not ( = ?auto_363453 ?auto_363456 ) ) ( not ( = ?auto_363454 ?auto_363455 ) ) ( not ( = ?auto_363454 ?auto_363456 ) ) ( not ( = ?auto_363455 ?auto_363456 ) ) ( CLEAR ?auto_363453 ) ( ON ?auto_363454 ?auto_363455 ) ( CLEAR ?auto_363454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_363443 ?auto_363444 ?auto_363445 ?auto_363446 ?auto_363447 ?auto_363448 ?auto_363449 ?auto_363450 ?auto_363451 ?auto_363452 ?auto_363453 ?auto_363454 )
      ( MAKE-13PILE ?auto_363443 ?auto_363444 ?auto_363445 ?auto_363446 ?auto_363447 ?auto_363448 ?auto_363449 ?auto_363450 ?auto_363451 ?auto_363452 ?auto_363453 ?auto_363454 ?auto_363455 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_363497 - BLOCK
      ?auto_363498 - BLOCK
      ?auto_363499 - BLOCK
      ?auto_363500 - BLOCK
      ?auto_363501 - BLOCK
      ?auto_363502 - BLOCK
      ?auto_363503 - BLOCK
      ?auto_363504 - BLOCK
      ?auto_363505 - BLOCK
      ?auto_363506 - BLOCK
      ?auto_363507 - BLOCK
      ?auto_363508 - BLOCK
      ?auto_363509 - BLOCK
    )
    :vars
    (
      ?auto_363510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_363509 ?auto_363510 ) ( ON-TABLE ?auto_363497 ) ( ON ?auto_363498 ?auto_363497 ) ( ON ?auto_363499 ?auto_363498 ) ( ON ?auto_363500 ?auto_363499 ) ( ON ?auto_363501 ?auto_363500 ) ( ON ?auto_363502 ?auto_363501 ) ( ON ?auto_363503 ?auto_363502 ) ( ON ?auto_363504 ?auto_363503 ) ( ON ?auto_363505 ?auto_363504 ) ( ON ?auto_363506 ?auto_363505 ) ( not ( = ?auto_363497 ?auto_363498 ) ) ( not ( = ?auto_363497 ?auto_363499 ) ) ( not ( = ?auto_363497 ?auto_363500 ) ) ( not ( = ?auto_363497 ?auto_363501 ) ) ( not ( = ?auto_363497 ?auto_363502 ) ) ( not ( = ?auto_363497 ?auto_363503 ) ) ( not ( = ?auto_363497 ?auto_363504 ) ) ( not ( = ?auto_363497 ?auto_363505 ) ) ( not ( = ?auto_363497 ?auto_363506 ) ) ( not ( = ?auto_363497 ?auto_363507 ) ) ( not ( = ?auto_363497 ?auto_363508 ) ) ( not ( = ?auto_363497 ?auto_363509 ) ) ( not ( = ?auto_363497 ?auto_363510 ) ) ( not ( = ?auto_363498 ?auto_363499 ) ) ( not ( = ?auto_363498 ?auto_363500 ) ) ( not ( = ?auto_363498 ?auto_363501 ) ) ( not ( = ?auto_363498 ?auto_363502 ) ) ( not ( = ?auto_363498 ?auto_363503 ) ) ( not ( = ?auto_363498 ?auto_363504 ) ) ( not ( = ?auto_363498 ?auto_363505 ) ) ( not ( = ?auto_363498 ?auto_363506 ) ) ( not ( = ?auto_363498 ?auto_363507 ) ) ( not ( = ?auto_363498 ?auto_363508 ) ) ( not ( = ?auto_363498 ?auto_363509 ) ) ( not ( = ?auto_363498 ?auto_363510 ) ) ( not ( = ?auto_363499 ?auto_363500 ) ) ( not ( = ?auto_363499 ?auto_363501 ) ) ( not ( = ?auto_363499 ?auto_363502 ) ) ( not ( = ?auto_363499 ?auto_363503 ) ) ( not ( = ?auto_363499 ?auto_363504 ) ) ( not ( = ?auto_363499 ?auto_363505 ) ) ( not ( = ?auto_363499 ?auto_363506 ) ) ( not ( = ?auto_363499 ?auto_363507 ) ) ( not ( = ?auto_363499 ?auto_363508 ) ) ( not ( = ?auto_363499 ?auto_363509 ) ) ( not ( = ?auto_363499 ?auto_363510 ) ) ( not ( = ?auto_363500 ?auto_363501 ) ) ( not ( = ?auto_363500 ?auto_363502 ) ) ( not ( = ?auto_363500 ?auto_363503 ) ) ( not ( = ?auto_363500 ?auto_363504 ) ) ( not ( = ?auto_363500 ?auto_363505 ) ) ( not ( = ?auto_363500 ?auto_363506 ) ) ( not ( = ?auto_363500 ?auto_363507 ) ) ( not ( = ?auto_363500 ?auto_363508 ) ) ( not ( = ?auto_363500 ?auto_363509 ) ) ( not ( = ?auto_363500 ?auto_363510 ) ) ( not ( = ?auto_363501 ?auto_363502 ) ) ( not ( = ?auto_363501 ?auto_363503 ) ) ( not ( = ?auto_363501 ?auto_363504 ) ) ( not ( = ?auto_363501 ?auto_363505 ) ) ( not ( = ?auto_363501 ?auto_363506 ) ) ( not ( = ?auto_363501 ?auto_363507 ) ) ( not ( = ?auto_363501 ?auto_363508 ) ) ( not ( = ?auto_363501 ?auto_363509 ) ) ( not ( = ?auto_363501 ?auto_363510 ) ) ( not ( = ?auto_363502 ?auto_363503 ) ) ( not ( = ?auto_363502 ?auto_363504 ) ) ( not ( = ?auto_363502 ?auto_363505 ) ) ( not ( = ?auto_363502 ?auto_363506 ) ) ( not ( = ?auto_363502 ?auto_363507 ) ) ( not ( = ?auto_363502 ?auto_363508 ) ) ( not ( = ?auto_363502 ?auto_363509 ) ) ( not ( = ?auto_363502 ?auto_363510 ) ) ( not ( = ?auto_363503 ?auto_363504 ) ) ( not ( = ?auto_363503 ?auto_363505 ) ) ( not ( = ?auto_363503 ?auto_363506 ) ) ( not ( = ?auto_363503 ?auto_363507 ) ) ( not ( = ?auto_363503 ?auto_363508 ) ) ( not ( = ?auto_363503 ?auto_363509 ) ) ( not ( = ?auto_363503 ?auto_363510 ) ) ( not ( = ?auto_363504 ?auto_363505 ) ) ( not ( = ?auto_363504 ?auto_363506 ) ) ( not ( = ?auto_363504 ?auto_363507 ) ) ( not ( = ?auto_363504 ?auto_363508 ) ) ( not ( = ?auto_363504 ?auto_363509 ) ) ( not ( = ?auto_363504 ?auto_363510 ) ) ( not ( = ?auto_363505 ?auto_363506 ) ) ( not ( = ?auto_363505 ?auto_363507 ) ) ( not ( = ?auto_363505 ?auto_363508 ) ) ( not ( = ?auto_363505 ?auto_363509 ) ) ( not ( = ?auto_363505 ?auto_363510 ) ) ( not ( = ?auto_363506 ?auto_363507 ) ) ( not ( = ?auto_363506 ?auto_363508 ) ) ( not ( = ?auto_363506 ?auto_363509 ) ) ( not ( = ?auto_363506 ?auto_363510 ) ) ( not ( = ?auto_363507 ?auto_363508 ) ) ( not ( = ?auto_363507 ?auto_363509 ) ) ( not ( = ?auto_363507 ?auto_363510 ) ) ( not ( = ?auto_363508 ?auto_363509 ) ) ( not ( = ?auto_363508 ?auto_363510 ) ) ( not ( = ?auto_363509 ?auto_363510 ) ) ( ON ?auto_363508 ?auto_363509 ) ( CLEAR ?auto_363506 ) ( ON ?auto_363507 ?auto_363508 ) ( CLEAR ?auto_363507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_363497 ?auto_363498 ?auto_363499 ?auto_363500 ?auto_363501 ?auto_363502 ?auto_363503 ?auto_363504 ?auto_363505 ?auto_363506 ?auto_363507 )
      ( MAKE-13PILE ?auto_363497 ?auto_363498 ?auto_363499 ?auto_363500 ?auto_363501 ?auto_363502 ?auto_363503 ?auto_363504 ?auto_363505 ?auto_363506 ?auto_363507 ?auto_363508 ?auto_363509 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_363551 - BLOCK
      ?auto_363552 - BLOCK
      ?auto_363553 - BLOCK
      ?auto_363554 - BLOCK
      ?auto_363555 - BLOCK
      ?auto_363556 - BLOCK
      ?auto_363557 - BLOCK
      ?auto_363558 - BLOCK
      ?auto_363559 - BLOCK
      ?auto_363560 - BLOCK
      ?auto_363561 - BLOCK
      ?auto_363562 - BLOCK
      ?auto_363563 - BLOCK
    )
    :vars
    (
      ?auto_363564 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_363563 ?auto_363564 ) ( ON-TABLE ?auto_363551 ) ( ON ?auto_363552 ?auto_363551 ) ( ON ?auto_363553 ?auto_363552 ) ( ON ?auto_363554 ?auto_363553 ) ( ON ?auto_363555 ?auto_363554 ) ( ON ?auto_363556 ?auto_363555 ) ( ON ?auto_363557 ?auto_363556 ) ( ON ?auto_363558 ?auto_363557 ) ( ON ?auto_363559 ?auto_363558 ) ( not ( = ?auto_363551 ?auto_363552 ) ) ( not ( = ?auto_363551 ?auto_363553 ) ) ( not ( = ?auto_363551 ?auto_363554 ) ) ( not ( = ?auto_363551 ?auto_363555 ) ) ( not ( = ?auto_363551 ?auto_363556 ) ) ( not ( = ?auto_363551 ?auto_363557 ) ) ( not ( = ?auto_363551 ?auto_363558 ) ) ( not ( = ?auto_363551 ?auto_363559 ) ) ( not ( = ?auto_363551 ?auto_363560 ) ) ( not ( = ?auto_363551 ?auto_363561 ) ) ( not ( = ?auto_363551 ?auto_363562 ) ) ( not ( = ?auto_363551 ?auto_363563 ) ) ( not ( = ?auto_363551 ?auto_363564 ) ) ( not ( = ?auto_363552 ?auto_363553 ) ) ( not ( = ?auto_363552 ?auto_363554 ) ) ( not ( = ?auto_363552 ?auto_363555 ) ) ( not ( = ?auto_363552 ?auto_363556 ) ) ( not ( = ?auto_363552 ?auto_363557 ) ) ( not ( = ?auto_363552 ?auto_363558 ) ) ( not ( = ?auto_363552 ?auto_363559 ) ) ( not ( = ?auto_363552 ?auto_363560 ) ) ( not ( = ?auto_363552 ?auto_363561 ) ) ( not ( = ?auto_363552 ?auto_363562 ) ) ( not ( = ?auto_363552 ?auto_363563 ) ) ( not ( = ?auto_363552 ?auto_363564 ) ) ( not ( = ?auto_363553 ?auto_363554 ) ) ( not ( = ?auto_363553 ?auto_363555 ) ) ( not ( = ?auto_363553 ?auto_363556 ) ) ( not ( = ?auto_363553 ?auto_363557 ) ) ( not ( = ?auto_363553 ?auto_363558 ) ) ( not ( = ?auto_363553 ?auto_363559 ) ) ( not ( = ?auto_363553 ?auto_363560 ) ) ( not ( = ?auto_363553 ?auto_363561 ) ) ( not ( = ?auto_363553 ?auto_363562 ) ) ( not ( = ?auto_363553 ?auto_363563 ) ) ( not ( = ?auto_363553 ?auto_363564 ) ) ( not ( = ?auto_363554 ?auto_363555 ) ) ( not ( = ?auto_363554 ?auto_363556 ) ) ( not ( = ?auto_363554 ?auto_363557 ) ) ( not ( = ?auto_363554 ?auto_363558 ) ) ( not ( = ?auto_363554 ?auto_363559 ) ) ( not ( = ?auto_363554 ?auto_363560 ) ) ( not ( = ?auto_363554 ?auto_363561 ) ) ( not ( = ?auto_363554 ?auto_363562 ) ) ( not ( = ?auto_363554 ?auto_363563 ) ) ( not ( = ?auto_363554 ?auto_363564 ) ) ( not ( = ?auto_363555 ?auto_363556 ) ) ( not ( = ?auto_363555 ?auto_363557 ) ) ( not ( = ?auto_363555 ?auto_363558 ) ) ( not ( = ?auto_363555 ?auto_363559 ) ) ( not ( = ?auto_363555 ?auto_363560 ) ) ( not ( = ?auto_363555 ?auto_363561 ) ) ( not ( = ?auto_363555 ?auto_363562 ) ) ( not ( = ?auto_363555 ?auto_363563 ) ) ( not ( = ?auto_363555 ?auto_363564 ) ) ( not ( = ?auto_363556 ?auto_363557 ) ) ( not ( = ?auto_363556 ?auto_363558 ) ) ( not ( = ?auto_363556 ?auto_363559 ) ) ( not ( = ?auto_363556 ?auto_363560 ) ) ( not ( = ?auto_363556 ?auto_363561 ) ) ( not ( = ?auto_363556 ?auto_363562 ) ) ( not ( = ?auto_363556 ?auto_363563 ) ) ( not ( = ?auto_363556 ?auto_363564 ) ) ( not ( = ?auto_363557 ?auto_363558 ) ) ( not ( = ?auto_363557 ?auto_363559 ) ) ( not ( = ?auto_363557 ?auto_363560 ) ) ( not ( = ?auto_363557 ?auto_363561 ) ) ( not ( = ?auto_363557 ?auto_363562 ) ) ( not ( = ?auto_363557 ?auto_363563 ) ) ( not ( = ?auto_363557 ?auto_363564 ) ) ( not ( = ?auto_363558 ?auto_363559 ) ) ( not ( = ?auto_363558 ?auto_363560 ) ) ( not ( = ?auto_363558 ?auto_363561 ) ) ( not ( = ?auto_363558 ?auto_363562 ) ) ( not ( = ?auto_363558 ?auto_363563 ) ) ( not ( = ?auto_363558 ?auto_363564 ) ) ( not ( = ?auto_363559 ?auto_363560 ) ) ( not ( = ?auto_363559 ?auto_363561 ) ) ( not ( = ?auto_363559 ?auto_363562 ) ) ( not ( = ?auto_363559 ?auto_363563 ) ) ( not ( = ?auto_363559 ?auto_363564 ) ) ( not ( = ?auto_363560 ?auto_363561 ) ) ( not ( = ?auto_363560 ?auto_363562 ) ) ( not ( = ?auto_363560 ?auto_363563 ) ) ( not ( = ?auto_363560 ?auto_363564 ) ) ( not ( = ?auto_363561 ?auto_363562 ) ) ( not ( = ?auto_363561 ?auto_363563 ) ) ( not ( = ?auto_363561 ?auto_363564 ) ) ( not ( = ?auto_363562 ?auto_363563 ) ) ( not ( = ?auto_363562 ?auto_363564 ) ) ( not ( = ?auto_363563 ?auto_363564 ) ) ( ON ?auto_363562 ?auto_363563 ) ( ON ?auto_363561 ?auto_363562 ) ( CLEAR ?auto_363559 ) ( ON ?auto_363560 ?auto_363561 ) ( CLEAR ?auto_363560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_363551 ?auto_363552 ?auto_363553 ?auto_363554 ?auto_363555 ?auto_363556 ?auto_363557 ?auto_363558 ?auto_363559 ?auto_363560 )
      ( MAKE-13PILE ?auto_363551 ?auto_363552 ?auto_363553 ?auto_363554 ?auto_363555 ?auto_363556 ?auto_363557 ?auto_363558 ?auto_363559 ?auto_363560 ?auto_363561 ?auto_363562 ?auto_363563 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_363605 - BLOCK
      ?auto_363606 - BLOCK
      ?auto_363607 - BLOCK
      ?auto_363608 - BLOCK
      ?auto_363609 - BLOCK
      ?auto_363610 - BLOCK
      ?auto_363611 - BLOCK
      ?auto_363612 - BLOCK
      ?auto_363613 - BLOCK
      ?auto_363614 - BLOCK
      ?auto_363615 - BLOCK
      ?auto_363616 - BLOCK
      ?auto_363617 - BLOCK
    )
    :vars
    (
      ?auto_363618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_363617 ?auto_363618 ) ( ON-TABLE ?auto_363605 ) ( ON ?auto_363606 ?auto_363605 ) ( ON ?auto_363607 ?auto_363606 ) ( ON ?auto_363608 ?auto_363607 ) ( ON ?auto_363609 ?auto_363608 ) ( ON ?auto_363610 ?auto_363609 ) ( ON ?auto_363611 ?auto_363610 ) ( ON ?auto_363612 ?auto_363611 ) ( not ( = ?auto_363605 ?auto_363606 ) ) ( not ( = ?auto_363605 ?auto_363607 ) ) ( not ( = ?auto_363605 ?auto_363608 ) ) ( not ( = ?auto_363605 ?auto_363609 ) ) ( not ( = ?auto_363605 ?auto_363610 ) ) ( not ( = ?auto_363605 ?auto_363611 ) ) ( not ( = ?auto_363605 ?auto_363612 ) ) ( not ( = ?auto_363605 ?auto_363613 ) ) ( not ( = ?auto_363605 ?auto_363614 ) ) ( not ( = ?auto_363605 ?auto_363615 ) ) ( not ( = ?auto_363605 ?auto_363616 ) ) ( not ( = ?auto_363605 ?auto_363617 ) ) ( not ( = ?auto_363605 ?auto_363618 ) ) ( not ( = ?auto_363606 ?auto_363607 ) ) ( not ( = ?auto_363606 ?auto_363608 ) ) ( not ( = ?auto_363606 ?auto_363609 ) ) ( not ( = ?auto_363606 ?auto_363610 ) ) ( not ( = ?auto_363606 ?auto_363611 ) ) ( not ( = ?auto_363606 ?auto_363612 ) ) ( not ( = ?auto_363606 ?auto_363613 ) ) ( not ( = ?auto_363606 ?auto_363614 ) ) ( not ( = ?auto_363606 ?auto_363615 ) ) ( not ( = ?auto_363606 ?auto_363616 ) ) ( not ( = ?auto_363606 ?auto_363617 ) ) ( not ( = ?auto_363606 ?auto_363618 ) ) ( not ( = ?auto_363607 ?auto_363608 ) ) ( not ( = ?auto_363607 ?auto_363609 ) ) ( not ( = ?auto_363607 ?auto_363610 ) ) ( not ( = ?auto_363607 ?auto_363611 ) ) ( not ( = ?auto_363607 ?auto_363612 ) ) ( not ( = ?auto_363607 ?auto_363613 ) ) ( not ( = ?auto_363607 ?auto_363614 ) ) ( not ( = ?auto_363607 ?auto_363615 ) ) ( not ( = ?auto_363607 ?auto_363616 ) ) ( not ( = ?auto_363607 ?auto_363617 ) ) ( not ( = ?auto_363607 ?auto_363618 ) ) ( not ( = ?auto_363608 ?auto_363609 ) ) ( not ( = ?auto_363608 ?auto_363610 ) ) ( not ( = ?auto_363608 ?auto_363611 ) ) ( not ( = ?auto_363608 ?auto_363612 ) ) ( not ( = ?auto_363608 ?auto_363613 ) ) ( not ( = ?auto_363608 ?auto_363614 ) ) ( not ( = ?auto_363608 ?auto_363615 ) ) ( not ( = ?auto_363608 ?auto_363616 ) ) ( not ( = ?auto_363608 ?auto_363617 ) ) ( not ( = ?auto_363608 ?auto_363618 ) ) ( not ( = ?auto_363609 ?auto_363610 ) ) ( not ( = ?auto_363609 ?auto_363611 ) ) ( not ( = ?auto_363609 ?auto_363612 ) ) ( not ( = ?auto_363609 ?auto_363613 ) ) ( not ( = ?auto_363609 ?auto_363614 ) ) ( not ( = ?auto_363609 ?auto_363615 ) ) ( not ( = ?auto_363609 ?auto_363616 ) ) ( not ( = ?auto_363609 ?auto_363617 ) ) ( not ( = ?auto_363609 ?auto_363618 ) ) ( not ( = ?auto_363610 ?auto_363611 ) ) ( not ( = ?auto_363610 ?auto_363612 ) ) ( not ( = ?auto_363610 ?auto_363613 ) ) ( not ( = ?auto_363610 ?auto_363614 ) ) ( not ( = ?auto_363610 ?auto_363615 ) ) ( not ( = ?auto_363610 ?auto_363616 ) ) ( not ( = ?auto_363610 ?auto_363617 ) ) ( not ( = ?auto_363610 ?auto_363618 ) ) ( not ( = ?auto_363611 ?auto_363612 ) ) ( not ( = ?auto_363611 ?auto_363613 ) ) ( not ( = ?auto_363611 ?auto_363614 ) ) ( not ( = ?auto_363611 ?auto_363615 ) ) ( not ( = ?auto_363611 ?auto_363616 ) ) ( not ( = ?auto_363611 ?auto_363617 ) ) ( not ( = ?auto_363611 ?auto_363618 ) ) ( not ( = ?auto_363612 ?auto_363613 ) ) ( not ( = ?auto_363612 ?auto_363614 ) ) ( not ( = ?auto_363612 ?auto_363615 ) ) ( not ( = ?auto_363612 ?auto_363616 ) ) ( not ( = ?auto_363612 ?auto_363617 ) ) ( not ( = ?auto_363612 ?auto_363618 ) ) ( not ( = ?auto_363613 ?auto_363614 ) ) ( not ( = ?auto_363613 ?auto_363615 ) ) ( not ( = ?auto_363613 ?auto_363616 ) ) ( not ( = ?auto_363613 ?auto_363617 ) ) ( not ( = ?auto_363613 ?auto_363618 ) ) ( not ( = ?auto_363614 ?auto_363615 ) ) ( not ( = ?auto_363614 ?auto_363616 ) ) ( not ( = ?auto_363614 ?auto_363617 ) ) ( not ( = ?auto_363614 ?auto_363618 ) ) ( not ( = ?auto_363615 ?auto_363616 ) ) ( not ( = ?auto_363615 ?auto_363617 ) ) ( not ( = ?auto_363615 ?auto_363618 ) ) ( not ( = ?auto_363616 ?auto_363617 ) ) ( not ( = ?auto_363616 ?auto_363618 ) ) ( not ( = ?auto_363617 ?auto_363618 ) ) ( ON ?auto_363616 ?auto_363617 ) ( ON ?auto_363615 ?auto_363616 ) ( ON ?auto_363614 ?auto_363615 ) ( CLEAR ?auto_363612 ) ( ON ?auto_363613 ?auto_363614 ) ( CLEAR ?auto_363613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_363605 ?auto_363606 ?auto_363607 ?auto_363608 ?auto_363609 ?auto_363610 ?auto_363611 ?auto_363612 ?auto_363613 )
      ( MAKE-13PILE ?auto_363605 ?auto_363606 ?auto_363607 ?auto_363608 ?auto_363609 ?auto_363610 ?auto_363611 ?auto_363612 ?auto_363613 ?auto_363614 ?auto_363615 ?auto_363616 ?auto_363617 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_363659 - BLOCK
      ?auto_363660 - BLOCK
      ?auto_363661 - BLOCK
      ?auto_363662 - BLOCK
      ?auto_363663 - BLOCK
      ?auto_363664 - BLOCK
      ?auto_363665 - BLOCK
      ?auto_363666 - BLOCK
      ?auto_363667 - BLOCK
      ?auto_363668 - BLOCK
      ?auto_363669 - BLOCK
      ?auto_363670 - BLOCK
      ?auto_363671 - BLOCK
    )
    :vars
    (
      ?auto_363672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_363671 ?auto_363672 ) ( ON-TABLE ?auto_363659 ) ( ON ?auto_363660 ?auto_363659 ) ( ON ?auto_363661 ?auto_363660 ) ( ON ?auto_363662 ?auto_363661 ) ( ON ?auto_363663 ?auto_363662 ) ( ON ?auto_363664 ?auto_363663 ) ( ON ?auto_363665 ?auto_363664 ) ( not ( = ?auto_363659 ?auto_363660 ) ) ( not ( = ?auto_363659 ?auto_363661 ) ) ( not ( = ?auto_363659 ?auto_363662 ) ) ( not ( = ?auto_363659 ?auto_363663 ) ) ( not ( = ?auto_363659 ?auto_363664 ) ) ( not ( = ?auto_363659 ?auto_363665 ) ) ( not ( = ?auto_363659 ?auto_363666 ) ) ( not ( = ?auto_363659 ?auto_363667 ) ) ( not ( = ?auto_363659 ?auto_363668 ) ) ( not ( = ?auto_363659 ?auto_363669 ) ) ( not ( = ?auto_363659 ?auto_363670 ) ) ( not ( = ?auto_363659 ?auto_363671 ) ) ( not ( = ?auto_363659 ?auto_363672 ) ) ( not ( = ?auto_363660 ?auto_363661 ) ) ( not ( = ?auto_363660 ?auto_363662 ) ) ( not ( = ?auto_363660 ?auto_363663 ) ) ( not ( = ?auto_363660 ?auto_363664 ) ) ( not ( = ?auto_363660 ?auto_363665 ) ) ( not ( = ?auto_363660 ?auto_363666 ) ) ( not ( = ?auto_363660 ?auto_363667 ) ) ( not ( = ?auto_363660 ?auto_363668 ) ) ( not ( = ?auto_363660 ?auto_363669 ) ) ( not ( = ?auto_363660 ?auto_363670 ) ) ( not ( = ?auto_363660 ?auto_363671 ) ) ( not ( = ?auto_363660 ?auto_363672 ) ) ( not ( = ?auto_363661 ?auto_363662 ) ) ( not ( = ?auto_363661 ?auto_363663 ) ) ( not ( = ?auto_363661 ?auto_363664 ) ) ( not ( = ?auto_363661 ?auto_363665 ) ) ( not ( = ?auto_363661 ?auto_363666 ) ) ( not ( = ?auto_363661 ?auto_363667 ) ) ( not ( = ?auto_363661 ?auto_363668 ) ) ( not ( = ?auto_363661 ?auto_363669 ) ) ( not ( = ?auto_363661 ?auto_363670 ) ) ( not ( = ?auto_363661 ?auto_363671 ) ) ( not ( = ?auto_363661 ?auto_363672 ) ) ( not ( = ?auto_363662 ?auto_363663 ) ) ( not ( = ?auto_363662 ?auto_363664 ) ) ( not ( = ?auto_363662 ?auto_363665 ) ) ( not ( = ?auto_363662 ?auto_363666 ) ) ( not ( = ?auto_363662 ?auto_363667 ) ) ( not ( = ?auto_363662 ?auto_363668 ) ) ( not ( = ?auto_363662 ?auto_363669 ) ) ( not ( = ?auto_363662 ?auto_363670 ) ) ( not ( = ?auto_363662 ?auto_363671 ) ) ( not ( = ?auto_363662 ?auto_363672 ) ) ( not ( = ?auto_363663 ?auto_363664 ) ) ( not ( = ?auto_363663 ?auto_363665 ) ) ( not ( = ?auto_363663 ?auto_363666 ) ) ( not ( = ?auto_363663 ?auto_363667 ) ) ( not ( = ?auto_363663 ?auto_363668 ) ) ( not ( = ?auto_363663 ?auto_363669 ) ) ( not ( = ?auto_363663 ?auto_363670 ) ) ( not ( = ?auto_363663 ?auto_363671 ) ) ( not ( = ?auto_363663 ?auto_363672 ) ) ( not ( = ?auto_363664 ?auto_363665 ) ) ( not ( = ?auto_363664 ?auto_363666 ) ) ( not ( = ?auto_363664 ?auto_363667 ) ) ( not ( = ?auto_363664 ?auto_363668 ) ) ( not ( = ?auto_363664 ?auto_363669 ) ) ( not ( = ?auto_363664 ?auto_363670 ) ) ( not ( = ?auto_363664 ?auto_363671 ) ) ( not ( = ?auto_363664 ?auto_363672 ) ) ( not ( = ?auto_363665 ?auto_363666 ) ) ( not ( = ?auto_363665 ?auto_363667 ) ) ( not ( = ?auto_363665 ?auto_363668 ) ) ( not ( = ?auto_363665 ?auto_363669 ) ) ( not ( = ?auto_363665 ?auto_363670 ) ) ( not ( = ?auto_363665 ?auto_363671 ) ) ( not ( = ?auto_363665 ?auto_363672 ) ) ( not ( = ?auto_363666 ?auto_363667 ) ) ( not ( = ?auto_363666 ?auto_363668 ) ) ( not ( = ?auto_363666 ?auto_363669 ) ) ( not ( = ?auto_363666 ?auto_363670 ) ) ( not ( = ?auto_363666 ?auto_363671 ) ) ( not ( = ?auto_363666 ?auto_363672 ) ) ( not ( = ?auto_363667 ?auto_363668 ) ) ( not ( = ?auto_363667 ?auto_363669 ) ) ( not ( = ?auto_363667 ?auto_363670 ) ) ( not ( = ?auto_363667 ?auto_363671 ) ) ( not ( = ?auto_363667 ?auto_363672 ) ) ( not ( = ?auto_363668 ?auto_363669 ) ) ( not ( = ?auto_363668 ?auto_363670 ) ) ( not ( = ?auto_363668 ?auto_363671 ) ) ( not ( = ?auto_363668 ?auto_363672 ) ) ( not ( = ?auto_363669 ?auto_363670 ) ) ( not ( = ?auto_363669 ?auto_363671 ) ) ( not ( = ?auto_363669 ?auto_363672 ) ) ( not ( = ?auto_363670 ?auto_363671 ) ) ( not ( = ?auto_363670 ?auto_363672 ) ) ( not ( = ?auto_363671 ?auto_363672 ) ) ( ON ?auto_363670 ?auto_363671 ) ( ON ?auto_363669 ?auto_363670 ) ( ON ?auto_363668 ?auto_363669 ) ( ON ?auto_363667 ?auto_363668 ) ( CLEAR ?auto_363665 ) ( ON ?auto_363666 ?auto_363667 ) ( CLEAR ?auto_363666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_363659 ?auto_363660 ?auto_363661 ?auto_363662 ?auto_363663 ?auto_363664 ?auto_363665 ?auto_363666 )
      ( MAKE-13PILE ?auto_363659 ?auto_363660 ?auto_363661 ?auto_363662 ?auto_363663 ?auto_363664 ?auto_363665 ?auto_363666 ?auto_363667 ?auto_363668 ?auto_363669 ?auto_363670 ?auto_363671 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_363713 - BLOCK
      ?auto_363714 - BLOCK
      ?auto_363715 - BLOCK
      ?auto_363716 - BLOCK
      ?auto_363717 - BLOCK
      ?auto_363718 - BLOCK
      ?auto_363719 - BLOCK
      ?auto_363720 - BLOCK
      ?auto_363721 - BLOCK
      ?auto_363722 - BLOCK
      ?auto_363723 - BLOCK
      ?auto_363724 - BLOCK
      ?auto_363725 - BLOCK
    )
    :vars
    (
      ?auto_363726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_363725 ?auto_363726 ) ( ON-TABLE ?auto_363713 ) ( ON ?auto_363714 ?auto_363713 ) ( ON ?auto_363715 ?auto_363714 ) ( ON ?auto_363716 ?auto_363715 ) ( ON ?auto_363717 ?auto_363716 ) ( ON ?auto_363718 ?auto_363717 ) ( not ( = ?auto_363713 ?auto_363714 ) ) ( not ( = ?auto_363713 ?auto_363715 ) ) ( not ( = ?auto_363713 ?auto_363716 ) ) ( not ( = ?auto_363713 ?auto_363717 ) ) ( not ( = ?auto_363713 ?auto_363718 ) ) ( not ( = ?auto_363713 ?auto_363719 ) ) ( not ( = ?auto_363713 ?auto_363720 ) ) ( not ( = ?auto_363713 ?auto_363721 ) ) ( not ( = ?auto_363713 ?auto_363722 ) ) ( not ( = ?auto_363713 ?auto_363723 ) ) ( not ( = ?auto_363713 ?auto_363724 ) ) ( not ( = ?auto_363713 ?auto_363725 ) ) ( not ( = ?auto_363713 ?auto_363726 ) ) ( not ( = ?auto_363714 ?auto_363715 ) ) ( not ( = ?auto_363714 ?auto_363716 ) ) ( not ( = ?auto_363714 ?auto_363717 ) ) ( not ( = ?auto_363714 ?auto_363718 ) ) ( not ( = ?auto_363714 ?auto_363719 ) ) ( not ( = ?auto_363714 ?auto_363720 ) ) ( not ( = ?auto_363714 ?auto_363721 ) ) ( not ( = ?auto_363714 ?auto_363722 ) ) ( not ( = ?auto_363714 ?auto_363723 ) ) ( not ( = ?auto_363714 ?auto_363724 ) ) ( not ( = ?auto_363714 ?auto_363725 ) ) ( not ( = ?auto_363714 ?auto_363726 ) ) ( not ( = ?auto_363715 ?auto_363716 ) ) ( not ( = ?auto_363715 ?auto_363717 ) ) ( not ( = ?auto_363715 ?auto_363718 ) ) ( not ( = ?auto_363715 ?auto_363719 ) ) ( not ( = ?auto_363715 ?auto_363720 ) ) ( not ( = ?auto_363715 ?auto_363721 ) ) ( not ( = ?auto_363715 ?auto_363722 ) ) ( not ( = ?auto_363715 ?auto_363723 ) ) ( not ( = ?auto_363715 ?auto_363724 ) ) ( not ( = ?auto_363715 ?auto_363725 ) ) ( not ( = ?auto_363715 ?auto_363726 ) ) ( not ( = ?auto_363716 ?auto_363717 ) ) ( not ( = ?auto_363716 ?auto_363718 ) ) ( not ( = ?auto_363716 ?auto_363719 ) ) ( not ( = ?auto_363716 ?auto_363720 ) ) ( not ( = ?auto_363716 ?auto_363721 ) ) ( not ( = ?auto_363716 ?auto_363722 ) ) ( not ( = ?auto_363716 ?auto_363723 ) ) ( not ( = ?auto_363716 ?auto_363724 ) ) ( not ( = ?auto_363716 ?auto_363725 ) ) ( not ( = ?auto_363716 ?auto_363726 ) ) ( not ( = ?auto_363717 ?auto_363718 ) ) ( not ( = ?auto_363717 ?auto_363719 ) ) ( not ( = ?auto_363717 ?auto_363720 ) ) ( not ( = ?auto_363717 ?auto_363721 ) ) ( not ( = ?auto_363717 ?auto_363722 ) ) ( not ( = ?auto_363717 ?auto_363723 ) ) ( not ( = ?auto_363717 ?auto_363724 ) ) ( not ( = ?auto_363717 ?auto_363725 ) ) ( not ( = ?auto_363717 ?auto_363726 ) ) ( not ( = ?auto_363718 ?auto_363719 ) ) ( not ( = ?auto_363718 ?auto_363720 ) ) ( not ( = ?auto_363718 ?auto_363721 ) ) ( not ( = ?auto_363718 ?auto_363722 ) ) ( not ( = ?auto_363718 ?auto_363723 ) ) ( not ( = ?auto_363718 ?auto_363724 ) ) ( not ( = ?auto_363718 ?auto_363725 ) ) ( not ( = ?auto_363718 ?auto_363726 ) ) ( not ( = ?auto_363719 ?auto_363720 ) ) ( not ( = ?auto_363719 ?auto_363721 ) ) ( not ( = ?auto_363719 ?auto_363722 ) ) ( not ( = ?auto_363719 ?auto_363723 ) ) ( not ( = ?auto_363719 ?auto_363724 ) ) ( not ( = ?auto_363719 ?auto_363725 ) ) ( not ( = ?auto_363719 ?auto_363726 ) ) ( not ( = ?auto_363720 ?auto_363721 ) ) ( not ( = ?auto_363720 ?auto_363722 ) ) ( not ( = ?auto_363720 ?auto_363723 ) ) ( not ( = ?auto_363720 ?auto_363724 ) ) ( not ( = ?auto_363720 ?auto_363725 ) ) ( not ( = ?auto_363720 ?auto_363726 ) ) ( not ( = ?auto_363721 ?auto_363722 ) ) ( not ( = ?auto_363721 ?auto_363723 ) ) ( not ( = ?auto_363721 ?auto_363724 ) ) ( not ( = ?auto_363721 ?auto_363725 ) ) ( not ( = ?auto_363721 ?auto_363726 ) ) ( not ( = ?auto_363722 ?auto_363723 ) ) ( not ( = ?auto_363722 ?auto_363724 ) ) ( not ( = ?auto_363722 ?auto_363725 ) ) ( not ( = ?auto_363722 ?auto_363726 ) ) ( not ( = ?auto_363723 ?auto_363724 ) ) ( not ( = ?auto_363723 ?auto_363725 ) ) ( not ( = ?auto_363723 ?auto_363726 ) ) ( not ( = ?auto_363724 ?auto_363725 ) ) ( not ( = ?auto_363724 ?auto_363726 ) ) ( not ( = ?auto_363725 ?auto_363726 ) ) ( ON ?auto_363724 ?auto_363725 ) ( ON ?auto_363723 ?auto_363724 ) ( ON ?auto_363722 ?auto_363723 ) ( ON ?auto_363721 ?auto_363722 ) ( ON ?auto_363720 ?auto_363721 ) ( CLEAR ?auto_363718 ) ( ON ?auto_363719 ?auto_363720 ) ( CLEAR ?auto_363719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_363713 ?auto_363714 ?auto_363715 ?auto_363716 ?auto_363717 ?auto_363718 ?auto_363719 )
      ( MAKE-13PILE ?auto_363713 ?auto_363714 ?auto_363715 ?auto_363716 ?auto_363717 ?auto_363718 ?auto_363719 ?auto_363720 ?auto_363721 ?auto_363722 ?auto_363723 ?auto_363724 ?auto_363725 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_363767 - BLOCK
      ?auto_363768 - BLOCK
      ?auto_363769 - BLOCK
      ?auto_363770 - BLOCK
      ?auto_363771 - BLOCK
      ?auto_363772 - BLOCK
      ?auto_363773 - BLOCK
      ?auto_363774 - BLOCK
      ?auto_363775 - BLOCK
      ?auto_363776 - BLOCK
      ?auto_363777 - BLOCK
      ?auto_363778 - BLOCK
      ?auto_363779 - BLOCK
    )
    :vars
    (
      ?auto_363780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_363779 ?auto_363780 ) ( ON-TABLE ?auto_363767 ) ( ON ?auto_363768 ?auto_363767 ) ( ON ?auto_363769 ?auto_363768 ) ( ON ?auto_363770 ?auto_363769 ) ( ON ?auto_363771 ?auto_363770 ) ( not ( = ?auto_363767 ?auto_363768 ) ) ( not ( = ?auto_363767 ?auto_363769 ) ) ( not ( = ?auto_363767 ?auto_363770 ) ) ( not ( = ?auto_363767 ?auto_363771 ) ) ( not ( = ?auto_363767 ?auto_363772 ) ) ( not ( = ?auto_363767 ?auto_363773 ) ) ( not ( = ?auto_363767 ?auto_363774 ) ) ( not ( = ?auto_363767 ?auto_363775 ) ) ( not ( = ?auto_363767 ?auto_363776 ) ) ( not ( = ?auto_363767 ?auto_363777 ) ) ( not ( = ?auto_363767 ?auto_363778 ) ) ( not ( = ?auto_363767 ?auto_363779 ) ) ( not ( = ?auto_363767 ?auto_363780 ) ) ( not ( = ?auto_363768 ?auto_363769 ) ) ( not ( = ?auto_363768 ?auto_363770 ) ) ( not ( = ?auto_363768 ?auto_363771 ) ) ( not ( = ?auto_363768 ?auto_363772 ) ) ( not ( = ?auto_363768 ?auto_363773 ) ) ( not ( = ?auto_363768 ?auto_363774 ) ) ( not ( = ?auto_363768 ?auto_363775 ) ) ( not ( = ?auto_363768 ?auto_363776 ) ) ( not ( = ?auto_363768 ?auto_363777 ) ) ( not ( = ?auto_363768 ?auto_363778 ) ) ( not ( = ?auto_363768 ?auto_363779 ) ) ( not ( = ?auto_363768 ?auto_363780 ) ) ( not ( = ?auto_363769 ?auto_363770 ) ) ( not ( = ?auto_363769 ?auto_363771 ) ) ( not ( = ?auto_363769 ?auto_363772 ) ) ( not ( = ?auto_363769 ?auto_363773 ) ) ( not ( = ?auto_363769 ?auto_363774 ) ) ( not ( = ?auto_363769 ?auto_363775 ) ) ( not ( = ?auto_363769 ?auto_363776 ) ) ( not ( = ?auto_363769 ?auto_363777 ) ) ( not ( = ?auto_363769 ?auto_363778 ) ) ( not ( = ?auto_363769 ?auto_363779 ) ) ( not ( = ?auto_363769 ?auto_363780 ) ) ( not ( = ?auto_363770 ?auto_363771 ) ) ( not ( = ?auto_363770 ?auto_363772 ) ) ( not ( = ?auto_363770 ?auto_363773 ) ) ( not ( = ?auto_363770 ?auto_363774 ) ) ( not ( = ?auto_363770 ?auto_363775 ) ) ( not ( = ?auto_363770 ?auto_363776 ) ) ( not ( = ?auto_363770 ?auto_363777 ) ) ( not ( = ?auto_363770 ?auto_363778 ) ) ( not ( = ?auto_363770 ?auto_363779 ) ) ( not ( = ?auto_363770 ?auto_363780 ) ) ( not ( = ?auto_363771 ?auto_363772 ) ) ( not ( = ?auto_363771 ?auto_363773 ) ) ( not ( = ?auto_363771 ?auto_363774 ) ) ( not ( = ?auto_363771 ?auto_363775 ) ) ( not ( = ?auto_363771 ?auto_363776 ) ) ( not ( = ?auto_363771 ?auto_363777 ) ) ( not ( = ?auto_363771 ?auto_363778 ) ) ( not ( = ?auto_363771 ?auto_363779 ) ) ( not ( = ?auto_363771 ?auto_363780 ) ) ( not ( = ?auto_363772 ?auto_363773 ) ) ( not ( = ?auto_363772 ?auto_363774 ) ) ( not ( = ?auto_363772 ?auto_363775 ) ) ( not ( = ?auto_363772 ?auto_363776 ) ) ( not ( = ?auto_363772 ?auto_363777 ) ) ( not ( = ?auto_363772 ?auto_363778 ) ) ( not ( = ?auto_363772 ?auto_363779 ) ) ( not ( = ?auto_363772 ?auto_363780 ) ) ( not ( = ?auto_363773 ?auto_363774 ) ) ( not ( = ?auto_363773 ?auto_363775 ) ) ( not ( = ?auto_363773 ?auto_363776 ) ) ( not ( = ?auto_363773 ?auto_363777 ) ) ( not ( = ?auto_363773 ?auto_363778 ) ) ( not ( = ?auto_363773 ?auto_363779 ) ) ( not ( = ?auto_363773 ?auto_363780 ) ) ( not ( = ?auto_363774 ?auto_363775 ) ) ( not ( = ?auto_363774 ?auto_363776 ) ) ( not ( = ?auto_363774 ?auto_363777 ) ) ( not ( = ?auto_363774 ?auto_363778 ) ) ( not ( = ?auto_363774 ?auto_363779 ) ) ( not ( = ?auto_363774 ?auto_363780 ) ) ( not ( = ?auto_363775 ?auto_363776 ) ) ( not ( = ?auto_363775 ?auto_363777 ) ) ( not ( = ?auto_363775 ?auto_363778 ) ) ( not ( = ?auto_363775 ?auto_363779 ) ) ( not ( = ?auto_363775 ?auto_363780 ) ) ( not ( = ?auto_363776 ?auto_363777 ) ) ( not ( = ?auto_363776 ?auto_363778 ) ) ( not ( = ?auto_363776 ?auto_363779 ) ) ( not ( = ?auto_363776 ?auto_363780 ) ) ( not ( = ?auto_363777 ?auto_363778 ) ) ( not ( = ?auto_363777 ?auto_363779 ) ) ( not ( = ?auto_363777 ?auto_363780 ) ) ( not ( = ?auto_363778 ?auto_363779 ) ) ( not ( = ?auto_363778 ?auto_363780 ) ) ( not ( = ?auto_363779 ?auto_363780 ) ) ( ON ?auto_363778 ?auto_363779 ) ( ON ?auto_363777 ?auto_363778 ) ( ON ?auto_363776 ?auto_363777 ) ( ON ?auto_363775 ?auto_363776 ) ( ON ?auto_363774 ?auto_363775 ) ( ON ?auto_363773 ?auto_363774 ) ( CLEAR ?auto_363771 ) ( ON ?auto_363772 ?auto_363773 ) ( CLEAR ?auto_363772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_363767 ?auto_363768 ?auto_363769 ?auto_363770 ?auto_363771 ?auto_363772 )
      ( MAKE-13PILE ?auto_363767 ?auto_363768 ?auto_363769 ?auto_363770 ?auto_363771 ?auto_363772 ?auto_363773 ?auto_363774 ?auto_363775 ?auto_363776 ?auto_363777 ?auto_363778 ?auto_363779 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_363821 - BLOCK
      ?auto_363822 - BLOCK
      ?auto_363823 - BLOCK
      ?auto_363824 - BLOCK
      ?auto_363825 - BLOCK
      ?auto_363826 - BLOCK
      ?auto_363827 - BLOCK
      ?auto_363828 - BLOCK
      ?auto_363829 - BLOCK
      ?auto_363830 - BLOCK
      ?auto_363831 - BLOCK
      ?auto_363832 - BLOCK
      ?auto_363833 - BLOCK
    )
    :vars
    (
      ?auto_363834 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_363833 ?auto_363834 ) ( ON-TABLE ?auto_363821 ) ( ON ?auto_363822 ?auto_363821 ) ( ON ?auto_363823 ?auto_363822 ) ( ON ?auto_363824 ?auto_363823 ) ( not ( = ?auto_363821 ?auto_363822 ) ) ( not ( = ?auto_363821 ?auto_363823 ) ) ( not ( = ?auto_363821 ?auto_363824 ) ) ( not ( = ?auto_363821 ?auto_363825 ) ) ( not ( = ?auto_363821 ?auto_363826 ) ) ( not ( = ?auto_363821 ?auto_363827 ) ) ( not ( = ?auto_363821 ?auto_363828 ) ) ( not ( = ?auto_363821 ?auto_363829 ) ) ( not ( = ?auto_363821 ?auto_363830 ) ) ( not ( = ?auto_363821 ?auto_363831 ) ) ( not ( = ?auto_363821 ?auto_363832 ) ) ( not ( = ?auto_363821 ?auto_363833 ) ) ( not ( = ?auto_363821 ?auto_363834 ) ) ( not ( = ?auto_363822 ?auto_363823 ) ) ( not ( = ?auto_363822 ?auto_363824 ) ) ( not ( = ?auto_363822 ?auto_363825 ) ) ( not ( = ?auto_363822 ?auto_363826 ) ) ( not ( = ?auto_363822 ?auto_363827 ) ) ( not ( = ?auto_363822 ?auto_363828 ) ) ( not ( = ?auto_363822 ?auto_363829 ) ) ( not ( = ?auto_363822 ?auto_363830 ) ) ( not ( = ?auto_363822 ?auto_363831 ) ) ( not ( = ?auto_363822 ?auto_363832 ) ) ( not ( = ?auto_363822 ?auto_363833 ) ) ( not ( = ?auto_363822 ?auto_363834 ) ) ( not ( = ?auto_363823 ?auto_363824 ) ) ( not ( = ?auto_363823 ?auto_363825 ) ) ( not ( = ?auto_363823 ?auto_363826 ) ) ( not ( = ?auto_363823 ?auto_363827 ) ) ( not ( = ?auto_363823 ?auto_363828 ) ) ( not ( = ?auto_363823 ?auto_363829 ) ) ( not ( = ?auto_363823 ?auto_363830 ) ) ( not ( = ?auto_363823 ?auto_363831 ) ) ( not ( = ?auto_363823 ?auto_363832 ) ) ( not ( = ?auto_363823 ?auto_363833 ) ) ( not ( = ?auto_363823 ?auto_363834 ) ) ( not ( = ?auto_363824 ?auto_363825 ) ) ( not ( = ?auto_363824 ?auto_363826 ) ) ( not ( = ?auto_363824 ?auto_363827 ) ) ( not ( = ?auto_363824 ?auto_363828 ) ) ( not ( = ?auto_363824 ?auto_363829 ) ) ( not ( = ?auto_363824 ?auto_363830 ) ) ( not ( = ?auto_363824 ?auto_363831 ) ) ( not ( = ?auto_363824 ?auto_363832 ) ) ( not ( = ?auto_363824 ?auto_363833 ) ) ( not ( = ?auto_363824 ?auto_363834 ) ) ( not ( = ?auto_363825 ?auto_363826 ) ) ( not ( = ?auto_363825 ?auto_363827 ) ) ( not ( = ?auto_363825 ?auto_363828 ) ) ( not ( = ?auto_363825 ?auto_363829 ) ) ( not ( = ?auto_363825 ?auto_363830 ) ) ( not ( = ?auto_363825 ?auto_363831 ) ) ( not ( = ?auto_363825 ?auto_363832 ) ) ( not ( = ?auto_363825 ?auto_363833 ) ) ( not ( = ?auto_363825 ?auto_363834 ) ) ( not ( = ?auto_363826 ?auto_363827 ) ) ( not ( = ?auto_363826 ?auto_363828 ) ) ( not ( = ?auto_363826 ?auto_363829 ) ) ( not ( = ?auto_363826 ?auto_363830 ) ) ( not ( = ?auto_363826 ?auto_363831 ) ) ( not ( = ?auto_363826 ?auto_363832 ) ) ( not ( = ?auto_363826 ?auto_363833 ) ) ( not ( = ?auto_363826 ?auto_363834 ) ) ( not ( = ?auto_363827 ?auto_363828 ) ) ( not ( = ?auto_363827 ?auto_363829 ) ) ( not ( = ?auto_363827 ?auto_363830 ) ) ( not ( = ?auto_363827 ?auto_363831 ) ) ( not ( = ?auto_363827 ?auto_363832 ) ) ( not ( = ?auto_363827 ?auto_363833 ) ) ( not ( = ?auto_363827 ?auto_363834 ) ) ( not ( = ?auto_363828 ?auto_363829 ) ) ( not ( = ?auto_363828 ?auto_363830 ) ) ( not ( = ?auto_363828 ?auto_363831 ) ) ( not ( = ?auto_363828 ?auto_363832 ) ) ( not ( = ?auto_363828 ?auto_363833 ) ) ( not ( = ?auto_363828 ?auto_363834 ) ) ( not ( = ?auto_363829 ?auto_363830 ) ) ( not ( = ?auto_363829 ?auto_363831 ) ) ( not ( = ?auto_363829 ?auto_363832 ) ) ( not ( = ?auto_363829 ?auto_363833 ) ) ( not ( = ?auto_363829 ?auto_363834 ) ) ( not ( = ?auto_363830 ?auto_363831 ) ) ( not ( = ?auto_363830 ?auto_363832 ) ) ( not ( = ?auto_363830 ?auto_363833 ) ) ( not ( = ?auto_363830 ?auto_363834 ) ) ( not ( = ?auto_363831 ?auto_363832 ) ) ( not ( = ?auto_363831 ?auto_363833 ) ) ( not ( = ?auto_363831 ?auto_363834 ) ) ( not ( = ?auto_363832 ?auto_363833 ) ) ( not ( = ?auto_363832 ?auto_363834 ) ) ( not ( = ?auto_363833 ?auto_363834 ) ) ( ON ?auto_363832 ?auto_363833 ) ( ON ?auto_363831 ?auto_363832 ) ( ON ?auto_363830 ?auto_363831 ) ( ON ?auto_363829 ?auto_363830 ) ( ON ?auto_363828 ?auto_363829 ) ( ON ?auto_363827 ?auto_363828 ) ( ON ?auto_363826 ?auto_363827 ) ( CLEAR ?auto_363824 ) ( ON ?auto_363825 ?auto_363826 ) ( CLEAR ?auto_363825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_363821 ?auto_363822 ?auto_363823 ?auto_363824 ?auto_363825 )
      ( MAKE-13PILE ?auto_363821 ?auto_363822 ?auto_363823 ?auto_363824 ?auto_363825 ?auto_363826 ?auto_363827 ?auto_363828 ?auto_363829 ?auto_363830 ?auto_363831 ?auto_363832 ?auto_363833 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_363875 - BLOCK
      ?auto_363876 - BLOCK
      ?auto_363877 - BLOCK
      ?auto_363878 - BLOCK
      ?auto_363879 - BLOCK
      ?auto_363880 - BLOCK
      ?auto_363881 - BLOCK
      ?auto_363882 - BLOCK
      ?auto_363883 - BLOCK
      ?auto_363884 - BLOCK
      ?auto_363885 - BLOCK
      ?auto_363886 - BLOCK
      ?auto_363887 - BLOCK
    )
    :vars
    (
      ?auto_363888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_363887 ?auto_363888 ) ( ON-TABLE ?auto_363875 ) ( ON ?auto_363876 ?auto_363875 ) ( ON ?auto_363877 ?auto_363876 ) ( not ( = ?auto_363875 ?auto_363876 ) ) ( not ( = ?auto_363875 ?auto_363877 ) ) ( not ( = ?auto_363875 ?auto_363878 ) ) ( not ( = ?auto_363875 ?auto_363879 ) ) ( not ( = ?auto_363875 ?auto_363880 ) ) ( not ( = ?auto_363875 ?auto_363881 ) ) ( not ( = ?auto_363875 ?auto_363882 ) ) ( not ( = ?auto_363875 ?auto_363883 ) ) ( not ( = ?auto_363875 ?auto_363884 ) ) ( not ( = ?auto_363875 ?auto_363885 ) ) ( not ( = ?auto_363875 ?auto_363886 ) ) ( not ( = ?auto_363875 ?auto_363887 ) ) ( not ( = ?auto_363875 ?auto_363888 ) ) ( not ( = ?auto_363876 ?auto_363877 ) ) ( not ( = ?auto_363876 ?auto_363878 ) ) ( not ( = ?auto_363876 ?auto_363879 ) ) ( not ( = ?auto_363876 ?auto_363880 ) ) ( not ( = ?auto_363876 ?auto_363881 ) ) ( not ( = ?auto_363876 ?auto_363882 ) ) ( not ( = ?auto_363876 ?auto_363883 ) ) ( not ( = ?auto_363876 ?auto_363884 ) ) ( not ( = ?auto_363876 ?auto_363885 ) ) ( not ( = ?auto_363876 ?auto_363886 ) ) ( not ( = ?auto_363876 ?auto_363887 ) ) ( not ( = ?auto_363876 ?auto_363888 ) ) ( not ( = ?auto_363877 ?auto_363878 ) ) ( not ( = ?auto_363877 ?auto_363879 ) ) ( not ( = ?auto_363877 ?auto_363880 ) ) ( not ( = ?auto_363877 ?auto_363881 ) ) ( not ( = ?auto_363877 ?auto_363882 ) ) ( not ( = ?auto_363877 ?auto_363883 ) ) ( not ( = ?auto_363877 ?auto_363884 ) ) ( not ( = ?auto_363877 ?auto_363885 ) ) ( not ( = ?auto_363877 ?auto_363886 ) ) ( not ( = ?auto_363877 ?auto_363887 ) ) ( not ( = ?auto_363877 ?auto_363888 ) ) ( not ( = ?auto_363878 ?auto_363879 ) ) ( not ( = ?auto_363878 ?auto_363880 ) ) ( not ( = ?auto_363878 ?auto_363881 ) ) ( not ( = ?auto_363878 ?auto_363882 ) ) ( not ( = ?auto_363878 ?auto_363883 ) ) ( not ( = ?auto_363878 ?auto_363884 ) ) ( not ( = ?auto_363878 ?auto_363885 ) ) ( not ( = ?auto_363878 ?auto_363886 ) ) ( not ( = ?auto_363878 ?auto_363887 ) ) ( not ( = ?auto_363878 ?auto_363888 ) ) ( not ( = ?auto_363879 ?auto_363880 ) ) ( not ( = ?auto_363879 ?auto_363881 ) ) ( not ( = ?auto_363879 ?auto_363882 ) ) ( not ( = ?auto_363879 ?auto_363883 ) ) ( not ( = ?auto_363879 ?auto_363884 ) ) ( not ( = ?auto_363879 ?auto_363885 ) ) ( not ( = ?auto_363879 ?auto_363886 ) ) ( not ( = ?auto_363879 ?auto_363887 ) ) ( not ( = ?auto_363879 ?auto_363888 ) ) ( not ( = ?auto_363880 ?auto_363881 ) ) ( not ( = ?auto_363880 ?auto_363882 ) ) ( not ( = ?auto_363880 ?auto_363883 ) ) ( not ( = ?auto_363880 ?auto_363884 ) ) ( not ( = ?auto_363880 ?auto_363885 ) ) ( not ( = ?auto_363880 ?auto_363886 ) ) ( not ( = ?auto_363880 ?auto_363887 ) ) ( not ( = ?auto_363880 ?auto_363888 ) ) ( not ( = ?auto_363881 ?auto_363882 ) ) ( not ( = ?auto_363881 ?auto_363883 ) ) ( not ( = ?auto_363881 ?auto_363884 ) ) ( not ( = ?auto_363881 ?auto_363885 ) ) ( not ( = ?auto_363881 ?auto_363886 ) ) ( not ( = ?auto_363881 ?auto_363887 ) ) ( not ( = ?auto_363881 ?auto_363888 ) ) ( not ( = ?auto_363882 ?auto_363883 ) ) ( not ( = ?auto_363882 ?auto_363884 ) ) ( not ( = ?auto_363882 ?auto_363885 ) ) ( not ( = ?auto_363882 ?auto_363886 ) ) ( not ( = ?auto_363882 ?auto_363887 ) ) ( not ( = ?auto_363882 ?auto_363888 ) ) ( not ( = ?auto_363883 ?auto_363884 ) ) ( not ( = ?auto_363883 ?auto_363885 ) ) ( not ( = ?auto_363883 ?auto_363886 ) ) ( not ( = ?auto_363883 ?auto_363887 ) ) ( not ( = ?auto_363883 ?auto_363888 ) ) ( not ( = ?auto_363884 ?auto_363885 ) ) ( not ( = ?auto_363884 ?auto_363886 ) ) ( not ( = ?auto_363884 ?auto_363887 ) ) ( not ( = ?auto_363884 ?auto_363888 ) ) ( not ( = ?auto_363885 ?auto_363886 ) ) ( not ( = ?auto_363885 ?auto_363887 ) ) ( not ( = ?auto_363885 ?auto_363888 ) ) ( not ( = ?auto_363886 ?auto_363887 ) ) ( not ( = ?auto_363886 ?auto_363888 ) ) ( not ( = ?auto_363887 ?auto_363888 ) ) ( ON ?auto_363886 ?auto_363887 ) ( ON ?auto_363885 ?auto_363886 ) ( ON ?auto_363884 ?auto_363885 ) ( ON ?auto_363883 ?auto_363884 ) ( ON ?auto_363882 ?auto_363883 ) ( ON ?auto_363881 ?auto_363882 ) ( ON ?auto_363880 ?auto_363881 ) ( ON ?auto_363879 ?auto_363880 ) ( CLEAR ?auto_363877 ) ( ON ?auto_363878 ?auto_363879 ) ( CLEAR ?auto_363878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_363875 ?auto_363876 ?auto_363877 ?auto_363878 )
      ( MAKE-13PILE ?auto_363875 ?auto_363876 ?auto_363877 ?auto_363878 ?auto_363879 ?auto_363880 ?auto_363881 ?auto_363882 ?auto_363883 ?auto_363884 ?auto_363885 ?auto_363886 ?auto_363887 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_363929 - BLOCK
      ?auto_363930 - BLOCK
      ?auto_363931 - BLOCK
      ?auto_363932 - BLOCK
      ?auto_363933 - BLOCK
      ?auto_363934 - BLOCK
      ?auto_363935 - BLOCK
      ?auto_363936 - BLOCK
      ?auto_363937 - BLOCK
      ?auto_363938 - BLOCK
      ?auto_363939 - BLOCK
      ?auto_363940 - BLOCK
      ?auto_363941 - BLOCK
    )
    :vars
    (
      ?auto_363942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_363941 ?auto_363942 ) ( ON-TABLE ?auto_363929 ) ( ON ?auto_363930 ?auto_363929 ) ( not ( = ?auto_363929 ?auto_363930 ) ) ( not ( = ?auto_363929 ?auto_363931 ) ) ( not ( = ?auto_363929 ?auto_363932 ) ) ( not ( = ?auto_363929 ?auto_363933 ) ) ( not ( = ?auto_363929 ?auto_363934 ) ) ( not ( = ?auto_363929 ?auto_363935 ) ) ( not ( = ?auto_363929 ?auto_363936 ) ) ( not ( = ?auto_363929 ?auto_363937 ) ) ( not ( = ?auto_363929 ?auto_363938 ) ) ( not ( = ?auto_363929 ?auto_363939 ) ) ( not ( = ?auto_363929 ?auto_363940 ) ) ( not ( = ?auto_363929 ?auto_363941 ) ) ( not ( = ?auto_363929 ?auto_363942 ) ) ( not ( = ?auto_363930 ?auto_363931 ) ) ( not ( = ?auto_363930 ?auto_363932 ) ) ( not ( = ?auto_363930 ?auto_363933 ) ) ( not ( = ?auto_363930 ?auto_363934 ) ) ( not ( = ?auto_363930 ?auto_363935 ) ) ( not ( = ?auto_363930 ?auto_363936 ) ) ( not ( = ?auto_363930 ?auto_363937 ) ) ( not ( = ?auto_363930 ?auto_363938 ) ) ( not ( = ?auto_363930 ?auto_363939 ) ) ( not ( = ?auto_363930 ?auto_363940 ) ) ( not ( = ?auto_363930 ?auto_363941 ) ) ( not ( = ?auto_363930 ?auto_363942 ) ) ( not ( = ?auto_363931 ?auto_363932 ) ) ( not ( = ?auto_363931 ?auto_363933 ) ) ( not ( = ?auto_363931 ?auto_363934 ) ) ( not ( = ?auto_363931 ?auto_363935 ) ) ( not ( = ?auto_363931 ?auto_363936 ) ) ( not ( = ?auto_363931 ?auto_363937 ) ) ( not ( = ?auto_363931 ?auto_363938 ) ) ( not ( = ?auto_363931 ?auto_363939 ) ) ( not ( = ?auto_363931 ?auto_363940 ) ) ( not ( = ?auto_363931 ?auto_363941 ) ) ( not ( = ?auto_363931 ?auto_363942 ) ) ( not ( = ?auto_363932 ?auto_363933 ) ) ( not ( = ?auto_363932 ?auto_363934 ) ) ( not ( = ?auto_363932 ?auto_363935 ) ) ( not ( = ?auto_363932 ?auto_363936 ) ) ( not ( = ?auto_363932 ?auto_363937 ) ) ( not ( = ?auto_363932 ?auto_363938 ) ) ( not ( = ?auto_363932 ?auto_363939 ) ) ( not ( = ?auto_363932 ?auto_363940 ) ) ( not ( = ?auto_363932 ?auto_363941 ) ) ( not ( = ?auto_363932 ?auto_363942 ) ) ( not ( = ?auto_363933 ?auto_363934 ) ) ( not ( = ?auto_363933 ?auto_363935 ) ) ( not ( = ?auto_363933 ?auto_363936 ) ) ( not ( = ?auto_363933 ?auto_363937 ) ) ( not ( = ?auto_363933 ?auto_363938 ) ) ( not ( = ?auto_363933 ?auto_363939 ) ) ( not ( = ?auto_363933 ?auto_363940 ) ) ( not ( = ?auto_363933 ?auto_363941 ) ) ( not ( = ?auto_363933 ?auto_363942 ) ) ( not ( = ?auto_363934 ?auto_363935 ) ) ( not ( = ?auto_363934 ?auto_363936 ) ) ( not ( = ?auto_363934 ?auto_363937 ) ) ( not ( = ?auto_363934 ?auto_363938 ) ) ( not ( = ?auto_363934 ?auto_363939 ) ) ( not ( = ?auto_363934 ?auto_363940 ) ) ( not ( = ?auto_363934 ?auto_363941 ) ) ( not ( = ?auto_363934 ?auto_363942 ) ) ( not ( = ?auto_363935 ?auto_363936 ) ) ( not ( = ?auto_363935 ?auto_363937 ) ) ( not ( = ?auto_363935 ?auto_363938 ) ) ( not ( = ?auto_363935 ?auto_363939 ) ) ( not ( = ?auto_363935 ?auto_363940 ) ) ( not ( = ?auto_363935 ?auto_363941 ) ) ( not ( = ?auto_363935 ?auto_363942 ) ) ( not ( = ?auto_363936 ?auto_363937 ) ) ( not ( = ?auto_363936 ?auto_363938 ) ) ( not ( = ?auto_363936 ?auto_363939 ) ) ( not ( = ?auto_363936 ?auto_363940 ) ) ( not ( = ?auto_363936 ?auto_363941 ) ) ( not ( = ?auto_363936 ?auto_363942 ) ) ( not ( = ?auto_363937 ?auto_363938 ) ) ( not ( = ?auto_363937 ?auto_363939 ) ) ( not ( = ?auto_363937 ?auto_363940 ) ) ( not ( = ?auto_363937 ?auto_363941 ) ) ( not ( = ?auto_363937 ?auto_363942 ) ) ( not ( = ?auto_363938 ?auto_363939 ) ) ( not ( = ?auto_363938 ?auto_363940 ) ) ( not ( = ?auto_363938 ?auto_363941 ) ) ( not ( = ?auto_363938 ?auto_363942 ) ) ( not ( = ?auto_363939 ?auto_363940 ) ) ( not ( = ?auto_363939 ?auto_363941 ) ) ( not ( = ?auto_363939 ?auto_363942 ) ) ( not ( = ?auto_363940 ?auto_363941 ) ) ( not ( = ?auto_363940 ?auto_363942 ) ) ( not ( = ?auto_363941 ?auto_363942 ) ) ( ON ?auto_363940 ?auto_363941 ) ( ON ?auto_363939 ?auto_363940 ) ( ON ?auto_363938 ?auto_363939 ) ( ON ?auto_363937 ?auto_363938 ) ( ON ?auto_363936 ?auto_363937 ) ( ON ?auto_363935 ?auto_363936 ) ( ON ?auto_363934 ?auto_363935 ) ( ON ?auto_363933 ?auto_363934 ) ( ON ?auto_363932 ?auto_363933 ) ( CLEAR ?auto_363930 ) ( ON ?auto_363931 ?auto_363932 ) ( CLEAR ?auto_363931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_363929 ?auto_363930 ?auto_363931 )
      ( MAKE-13PILE ?auto_363929 ?auto_363930 ?auto_363931 ?auto_363932 ?auto_363933 ?auto_363934 ?auto_363935 ?auto_363936 ?auto_363937 ?auto_363938 ?auto_363939 ?auto_363940 ?auto_363941 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_363983 - BLOCK
      ?auto_363984 - BLOCK
      ?auto_363985 - BLOCK
      ?auto_363986 - BLOCK
      ?auto_363987 - BLOCK
      ?auto_363988 - BLOCK
      ?auto_363989 - BLOCK
      ?auto_363990 - BLOCK
      ?auto_363991 - BLOCK
      ?auto_363992 - BLOCK
      ?auto_363993 - BLOCK
      ?auto_363994 - BLOCK
      ?auto_363995 - BLOCK
    )
    :vars
    (
      ?auto_363996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_363995 ?auto_363996 ) ( ON-TABLE ?auto_363983 ) ( not ( = ?auto_363983 ?auto_363984 ) ) ( not ( = ?auto_363983 ?auto_363985 ) ) ( not ( = ?auto_363983 ?auto_363986 ) ) ( not ( = ?auto_363983 ?auto_363987 ) ) ( not ( = ?auto_363983 ?auto_363988 ) ) ( not ( = ?auto_363983 ?auto_363989 ) ) ( not ( = ?auto_363983 ?auto_363990 ) ) ( not ( = ?auto_363983 ?auto_363991 ) ) ( not ( = ?auto_363983 ?auto_363992 ) ) ( not ( = ?auto_363983 ?auto_363993 ) ) ( not ( = ?auto_363983 ?auto_363994 ) ) ( not ( = ?auto_363983 ?auto_363995 ) ) ( not ( = ?auto_363983 ?auto_363996 ) ) ( not ( = ?auto_363984 ?auto_363985 ) ) ( not ( = ?auto_363984 ?auto_363986 ) ) ( not ( = ?auto_363984 ?auto_363987 ) ) ( not ( = ?auto_363984 ?auto_363988 ) ) ( not ( = ?auto_363984 ?auto_363989 ) ) ( not ( = ?auto_363984 ?auto_363990 ) ) ( not ( = ?auto_363984 ?auto_363991 ) ) ( not ( = ?auto_363984 ?auto_363992 ) ) ( not ( = ?auto_363984 ?auto_363993 ) ) ( not ( = ?auto_363984 ?auto_363994 ) ) ( not ( = ?auto_363984 ?auto_363995 ) ) ( not ( = ?auto_363984 ?auto_363996 ) ) ( not ( = ?auto_363985 ?auto_363986 ) ) ( not ( = ?auto_363985 ?auto_363987 ) ) ( not ( = ?auto_363985 ?auto_363988 ) ) ( not ( = ?auto_363985 ?auto_363989 ) ) ( not ( = ?auto_363985 ?auto_363990 ) ) ( not ( = ?auto_363985 ?auto_363991 ) ) ( not ( = ?auto_363985 ?auto_363992 ) ) ( not ( = ?auto_363985 ?auto_363993 ) ) ( not ( = ?auto_363985 ?auto_363994 ) ) ( not ( = ?auto_363985 ?auto_363995 ) ) ( not ( = ?auto_363985 ?auto_363996 ) ) ( not ( = ?auto_363986 ?auto_363987 ) ) ( not ( = ?auto_363986 ?auto_363988 ) ) ( not ( = ?auto_363986 ?auto_363989 ) ) ( not ( = ?auto_363986 ?auto_363990 ) ) ( not ( = ?auto_363986 ?auto_363991 ) ) ( not ( = ?auto_363986 ?auto_363992 ) ) ( not ( = ?auto_363986 ?auto_363993 ) ) ( not ( = ?auto_363986 ?auto_363994 ) ) ( not ( = ?auto_363986 ?auto_363995 ) ) ( not ( = ?auto_363986 ?auto_363996 ) ) ( not ( = ?auto_363987 ?auto_363988 ) ) ( not ( = ?auto_363987 ?auto_363989 ) ) ( not ( = ?auto_363987 ?auto_363990 ) ) ( not ( = ?auto_363987 ?auto_363991 ) ) ( not ( = ?auto_363987 ?auto_363992 ) ) ( not ( = ?auto_363987 ?auto_363993 ) ) ( not ( = ?auto_363987 ?auto_363994 ) ) ( not ( = ?auto_363987 ?auto_363995 ) ) ( not ( = ?auto_363987 ?auto_363996 ) ) ( not ( = ?auto_363988 ?auto_363989 ) ) ( not ( = ?auto_363988 ?auto_363990 ) ) ( not ( = ?auto_363988 ?auto_363991 ) ) ( not ( = ?auto_363988 ?auto_363992 ) ) ( not ( = ?auto_363988 ?auto_363993 ) ) ( not ( = ?auto_363988 ?auto_363994 ) ) ( not ( = ?auto_363988 ?auto_363995 ) ) ( not ( = ?auto_363988 ?auto_363996 ) ) ( not ( = ?auto_363989 ?auto_363990 ) ) ( not ( = ?auto_363989 ?auto_363991 ) ) ( not ( = ?auto_363989 ?auto_363992 ) ) ( not ( = ?auto_363989 ?auto_363993 ) ) ( not ( = ?auto_363989 ?auto_363994 ) ) ( not ( = ?auto_363989 ?auto_363995 ) ) ( not ( = ?auto_363989 ?auto_363996 ) ) ( not ( = ?auto_363990 ?auto_363991 ) ) ( not ( = ?auto_363990 ?auto_363992 ) ) ( not ( = ?auto_363990 ?auto_363993 ) ) ( not ( = ?auto_363990 ?auto_363994 ) ) ( not ( = ?auto_363990 ?auto_363995 ) ) ( not ( = ?auto_363990 ?auto_363996 ) ) ( not ( = ?auto_363991 ?auto_363992 ) ) ( not ( = ?auto_363991 ?auto_363993 ) ) ( not ( = ?auto_363991 ?auto_363994 ) ) ( not ( = ?auto_363991 ?auto_363995 ) ) ( not ( = ?auto_363991 ?auto_363996 ) ) ( not ( = ?auto_363992 ?auto_363993 ) ) ( not ( = ?auto_363992 ?auto_363994 ) ) ( not ( = ?auto_363992 ?auto_363995 ) ) ( not ( = ?auto_363992 ?auto_363996 ) ) ( not ( = ?auto_363993 ?auto_363994 ) ) ( not ( = ?auto_363993 ?auto_363995 ) ) ( not ( = ?auto_363993 ?auto_363996 ) ) ( not ( = ?auto_363994 ?auto_363995 ) ) ( not ( = ?auto_363994 ?auto_363996 ) ) ( not ( = ?auto_363995 ?auto_363996 ) ) ( ON ?auto_363994 ?auto_363995 ) ( ON ?auto_363993 ?auto_363994 ) ( ON ?auto_363992 ?auto_363993 ) ( ON ?auto_363991 ?auto_363992 ) ( ON ?auto_363990 ?auto_363991 ) ( ON ?auto_363989 ?auto_363990 ) ( ON ?auto_363988 ?auto_363989 ) ( ON ?auto_363987 ?auto_363988 ) ( ON ?auto_363986 ?auto_363987 ) ( ON ?auto_363985 ?auto_363986 ) ( CLEAR ?auto_363983 ) ( ON ?auto_363984 ?auto_363985 ) ( CLEAR ?auto_363984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_363983 ?auto_363984 )
      ( MAKE-13PILE ?auto_363983 ?auto_363984 ?auto_363985 ?auto_363986 ?auto_363987 ?auto_363988 ?auto_363989 ?auto_363990 ?auto_363991 ?auto_363992 ?auto_363993 ?auto_363994 ?auto_363995 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_364037 - BLOCK
      ?auto_364038 - BLOCK
      ?auto_364039 - BLOCK
      ?auto_364040 - BLOCK
      ?auto_364041 - BLOCK
      ?auto_364042 - BLOCK
      ?auto_364043 - BLOCK
      ?auto_364044 - BLOCK
      ?auto_364045 - BLOCK
      ?auto_364046 - BLOCK
      ?auto_364047 - BLOCK
      ?auto_364048 - BLOCK
      ?auto_364049 - BLOCK
    )
    :vars
    (
      ?auto_364050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_364049 ?auto_364050 ) ( not ( = ?auto_364037 ?auto_364038 ) ) ( not ( = ?auto_364037 ?auto_364039 ) ) ( not ( = ?auto_364037 ?auto_364040 ) ) ( not ( = ?auto_364037 ?auto_364041 ) ) ( not ( = ?auto_364037 ?auto_364042 ) ) ( not ( = ?auto_364037 ?auto_364043 ) ) ( not ( = ?auto_364037 ?auto_364044 ) ) ( not ( = ?auto_364037 ?auto_364045 ) ) ( not ( = ?auto_364037 ?auto_364046 ) ) ( not ( = ?auto_364037 ?auto_364047 ) ) ( not ( = ?auto_364037 ?auto_364048 ) ) ( not ( = ?auto_364037 ?auto_364049 ) ) ( not ( = ?auto_364037 ?auto_364050 ) ) ( not ( = ?auto_364038 ?auto_364039 ) ) ( not ( = ?auto_364038 ?auto_364040 ) ) ( not ( = ?auto_364038 ?auto_364041 ) ) ( not ( = ?auto_364038 ?auto_364042 ) ) ( not ( = ?auto_364038 ?auto_364043 ) ) ( not ( = ?auto_364038 ?auto_364044 ) ) ( not ( = ?auto_364038 ?auto_364045 ) ) ( not ( = ?auto_364038 ?auto_364046 ) ) ( not ( = ?auto_364038 ?auto_364047 ) ) ( not ( = ?auto_364038 ?auto_364048 ) ) ( not ( = ?auto_364038 ?auto_364049 ) ) ( not ( = ?auto_364038 ?auto_364050 ) ) ( not ( = ?auto_364039 ?auto_364040 ) ) ( not ( = ?auto_364039 ?auto_364041 ) ) ( not ( = ?auto_364039 ?auto_364042 ) ) ( not ( = ?auto_364039 ?auto_364043 ) ) ( not ( = ?auto_364039 ?auto_364044 ) ) ( not ( = ?auto_364039 ?auto_364045 ) ) ( not ( = ?auto_364039 ?auto_364046 ) ) ( not ( = ?auto_364039 ?auto_364047 ) ) ( not ( = ?auto_364039 ?auto_364048 ) ) ( not ( = ?auto_364039 ?auto_364049 ) ) ( not ( = ?auto_364039 ?auto_364050 ) ) ( not ( = ?auto_364040 ?auto_364041 ) ) ( not ( = ?auto_364040 ?auto_364042 ) ) ( not ( = ?auto_364040 ?auto_364043 ) ) ( not ( = ?auto_364040 ?auto_364044 ) ) ( not ( = ?auto_364040 ?auto_364045 ) ) ( not ( = ?auto_364040 ?auto_364046 ) ) ( not ( = ?auto_364040 ?auto_364047 ) ) ( not ( = ?auto_364040 ?auto_364048 ) ) ( not ( = ?auto_364040 ?auto_364049 ) ) ( not ( = ?auto_364040 ?auto_364050 ) ) ( not ( = ?auto_364041 ?auto_364042 ) ) ( not ( = ?auto_364041 ?auto_364043 ) ) ( not ( = ?auto_364041 ?auto_364044 ) ) ( not ( = ?auto_364041 ?auto_364045 ) ) ( not ( = ?auto_364041 ?auto_364046 ) ) ( not ( = ?auto_364041 ?auto_364047 ) ) ( not ( = ?auto_364041 ?auto_364048 ) ) ( not ( = ?auto_364041 ?auto_364049 ) ) ( not ( = ?auto_364041 ?auto_364050 ) ) ( not ( = ?auto_364042 ?auto_364043 ) ) ( not ( = ?auto_364042 ?auto_364044 ) ) ( not ( = ?auto_364042 ?auto_364045 ) ) ( not ( = ?auto_364042 ?auto_364046 ) ) ( not ( = ?auto_364042 ?auto_364047 ) ) ( not ( = ?auto_364042 ?auto_364048 ) ) ( not ( = ?auto_364042 ?auto_364049 ) ) ( not ( = ?auto_364042 ?auto_364050 ) ) ( not ( = ?auto_364043 ?auto_364044 ) ) ( not ( = ?auto_364043 ?auto_364045 ) ) ( not ( = ?auto_364043 ?auto_364046 ) ) ( not ( = ?auto_364043 ?auto_364047 ) ) ( not ( = ?auto_364043 ?auto_364048 ) ) ( not ( = ?auto_364043 ?auto_364049 ) ) ( not ( = ?auto_364043 ?auto_364050 ) ) ( not ( = ?auto_364044 ?auto_364045 ) ) ( not ( = ?auto_364044 ?auto_364046 ) ) ( not ( = ?auto_364044 ?auto_364047 ) ) ( not ( = ?auto_364044 ?auto_364048 ) ) ( not ( = ?auto_364044 ?auto_364049 ) ) ( not ( = ?auto_364044 ?auto_364050 ) ) ( not ( = ?auto_364045 ?auto_364046 ) ) ( not ( = ?auto_364045 ?auto_364047 ) ) ( not ( = ?auto_364045 ?auto_364048 ) ) ( not ( = ?auto_364045 ?auto_364049 ) ) ( not ( = ?auto_364045 ?auto_364050 ) ) ( not ( = ?auto_364046 ?auto_364047 ) ) ( not ( = ?auto_364046 ?auto_364048 ) ) ( not ( = ?auto_364046 ?auto_364049 ) ) ( not ( = ?auto_364046 ?auto_364050 ) ) ( not ( = ?auto_364047 ?auto_364048 ) ) ( not ( = ?auto_364047 ?auto_364049 ) ) ( not ( = ?auto_364047 ?auto_364050 ) ) ( not ( = ?auto_364048 ?auto_364049 ) ) ( not ( = ?auto_364048 ?auto_364050 ) ) ( not ( = ?auto_364049 ?auto_364050 ) ) ( ON ?auto_364048 ?auto_364049 ) ( ON ?auto_364047 ?auto_364048 ) ( ON ?auto_364046 ?auto_364047 ) ( ON ?auto_364045 ?auto_364046 ) ( ON ?auto_364044 ?auto_364045 ) ( ON ?auto_364043 ?auto_364044 ) ( ON ?auto_364042 ?auto_364043 ) ( ON ?auto_364041 ?auto_364042 ) ( ON ?auto_364040 ?auto_364041 ) ( ON ?auto_364039 ?auto_364040 ) ( ON ?auto_364038 ?auto_364039 ) ( ON ?auto_364037 ?auto_364038 ) ( CLEAR ?auto_364037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_364037 )
      ( MAKE-13PILE ?auto_364037 ?auto_364038 ?auto_364039 ?auto_364040 ?auto_364041 ?auto_364042 ?auto_364043 ?auto_364044 ?auto_364045 ?auto_364046 ?auto_364047 ?auto_364048 ?auto_364049 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_364092 - BLOCK
      ?auto_364093 - BLOCK
      ?auto_364094 - BLOCK
      ?auto_364095 - BLOCK
      ?auto_364096 - BLOCK
      ?auto_364097 - BLOCK
      ?auto_364098 - BLOCK
      ?auto_364099 - BLOCK
      ?auto_364100 - BLOCK
      ?auto_364101 - BLOCK
      ?auto_364102 - BLOCK
      ?auto_364103 - BLOCK
      ?auto_364104 - BLOCK
      ?auto_364105 - BLOCK
    )
    :vars
    (
      ?auto_364106 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_364104 ) ( ON ?auto_364105 ?auto_364106 ) ( CLEAR ?auto_364105 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_364092 ) ( ON ?auto_364093 ?auto_364092 ) ( ON ?auto_364094 ?auto_364093 ) ( ON ?auto_364095 ?auto_364094 ) ( ON ?auto_364096 ?auto_364095 ) ( ON ?auto_364097 ?auto_364096 ) ( ON ?auto_364098 ?auto_364097 ) ( ON ?auto_364099 ?auto_364098 ) ( ON ?auto_364100 ?auto_364099 ) ( ON ?auto_364101 ?auto_364100 ) ( ON ?auto_364102 ?auto_364101 ) ( ON ?auto_364103 ?auto_364102 ) ( ON ?auto_364104 ?auto_364103 ) ( not ( = ?auto_364092 ?auto_364093 ) ) ( not ( = ?auto_364092 ?auto_364094 ) ) ( not ( = ?auto_364092 ?auto_364095 ) ) ( not ( = ?auto_364092 ?auto_364096 ) ) ( not ( = ?auto_364092 ?auto_364097 ) ) ( not ( = ?auto_364092 ?auto_364098 ) ) ( not ( = ?auto_364092 ?auto_364099 ) ) ( not ( = ?auto_364092 ?auto_364100 ) ) ( not ( = ?auto_364092 ?auto_364101 ) ) ( not ( = ?auto_364092 ?auto_364102 ) ) ( not ( = ?auto_364092 ?auto_364103 ) ) ( not ( = ?auto_364092 ?auto_364104 ) ) ( not ( = ?auto_364092 ?auto_364105 ) ) ( not ( = ?auto_364092 ?auto_364106 ) ) ( not ( = ?auto_364093 ?auto_364094 ) ) ( not ( = ?auto_364093 ?auto_364095 ) ) ( not ( = ?auto_364093 ?auto_364096 ) ) ( not ( = ?auto_364093 ?auto_364097 ) ) ( not ( = ?auto_364093 ?auto_364098 ) ) ( not ( = ?auto_364093 ?auto_364099 ) ) ( not ( = ?auto_364093 ?auto_364100 ) ) ( not ( = ?auto_364093 ?auto_364101 ) ) ( not ( = ?auto_364093 ?auto_364102 ) ) ( not ( = ?auto_364093 ?auto_364103 ) ) ( not ( = ?auto_364093 ?auto_364104 ) ) ( not ( = ?auto_364093 ?auto_364105 ) ) ( not ( = ?auto_364093 ?auto_364106 ) ) ( not ( = ?auto_364094 ?auto_364095 ) ) ( not ( = ?auto_364094 ?auto_364096 ) ) ( not ( = ?auto_364094 ?auto_364097 ) ) ( not ( = ?auto_364094 ?auto_364098 ) ) ( not ( = ?auto_364094 ?auto_364099 ) ) ( not ( = ?auto_364094 ?auto_364100 ) ) ( not ( = ?auto_364094 ?auto_364101 ) ) ( not ( = ?auto_364094 ?auto_364102 ) ) ( not ( = ?auto_364094 ?auto_364103 ) ) ( not ( = ?auto_364094 ?auto_364104 ) ) ( not ( = ?auto_364094 ?auto_364105 ) ) ( not ( = ?auto_364094 ?auto_364106 ) ) ( not ( = ?auto_364095 ?auto_364096 ) ) ( not ( = ?auto_364095 ?auto_364097 ) ) ( not ( = ?auto_364095 ?auto_364098 ) ) ( not ( = ?auto_364095 ?auto_364099 ) ) ( not ( = ?auto_364095 ?auto_364100 ) ) ( not ( = ?auto_364095 ?auto_364101 ) ) ( not ( = ?auto_364095 ?auto_364102 ) ) ( not ( = ?auto_364095 ?auto_364103 ) ) ( not ( = ?auto_364095 ?auto_364104 ) ) ( not ( = ?auto_364095 ?auto_364105 ) ) ( not ( = ?auto_364095 ?auto_364106 ) ) ( not ( = ?auto_364096 ?auto_364097 ) ) ( not ( = ?auto_364096 ?auto_364098 ) ) ( not ( = ?auto_364096 ?auto_364099 ) ) ( not ( = ?auto_364096 ?auto_364100 ) ) ( not ( = ?auto_364096 ?auto_364101 ) ) ( not ( = ?auto_364096 ?auto_364102 ) ) ( not ( = ?auto_364096 ?auto_364103 ) ) ( not ( = ?auto_364096 ?auto_364104 ) ) ( not ( = ?auto_364096 ?auto_364105 ) ) ( not ( = ?auto_364096 ?auto_364106 ) ) ( not ( = ?auto_364097 ?auto_364098 ) ) ( not ( = ?auto_364097 ?auto_364099 ) ) ( not ( = ?auto_364097 ?auto_364100 ) ) ( not ( = ?auto_364097 ?auto_364101 ) ) ( not ( = ?auto_364097 ?auto_364102 ) ) ( not ( = ?auto_364097 ?auto_364103 ) ) ( not ( = ?auto_364097 ?auto_364104 ) ) ( not ( = ?auto_364097 ?auto_364105 ) ) ( not ( = ?auto_364097 ?auto_364106 ) ) ( not ( = ?auto_364098 ?auto_364099 ) ) ( not ( = ?auto_364098 ?auto_364100 ) ) ( not ( = ?auto_364098 ?auto_364101 ) ) ( not ( = ?auto_364098 ?auto_364102 ) ) ( not ( = ?auto_364098 ?auto_364103 ) ) ( not ( = ?auto_364098 ?auto_364104 ) ) ( not ( = ?auto_364098 ?auto_364105 ) ) ( not ( = ?auto_364098 ?auto_364106 ) ) ( not ( = ?auto_364099 ?auto_364100 ) ) ( not ( = ?auto_364099 ?auto_364101 ) ) ( not ( = ?auto_364099 ?auto_364102 ) ) ( not ( = ?auto_364099 ?auto_364103 ) ) ( not ( = ?auto_364099 ?auto_364104 ) ) ( not ( = ?auto_364099 ?auto_364105 ) ) ( not ( = ?auto_364099 ?auto_364106 ) ) ( not ( = ?auto_364100 ?auto_364101 ) ) ( not ( = ?auto_364100 ?auto_364102 ) ) ( not ( = ?auto_364100 ?auto_364103 ) ) ( not ( = ?auto_364100 ?auto_364104 ) ) ( not ( = ?auto_364100 ?auto_364105 ) ) ( not ( = ?auto_364100 ?auto_364106 ) ) ( not ( = ?auto_364101 ?auto_364102 ) ) ( not ( = ?auto_364101 ?auto_364103 ) ) ( not ( = ?auto_364101 ?auto_364104 ) ) ( not ( = ?auto_364101 ?auto_364105 ) ) ( not ( = ?auto_364101 ?auto_364106 ) ) ( not ( = ?auto_364102 ?auto_364103 ) ) ( not ( = ?auto_364102 ?auto_364104 ) ) ( not ( = ?auto_364102 ?auto_364105 ) ) ( not ( = ?auto_364102 ?auto_364106 ) ) ( not ( = ?auto_364103 ?auto_364104 ) ) ( not ( = ?auto_364103 ?auto_364105 ) ) ( not ( = ?auto_364103 ?auto_364106 ) ) ( not ( = ?auto_364104 ?auto_364105 ) ) ( not ( = ?auto_364104 ?auto_364106 ) ) ( not ( = ?auto_364105 ?auto_364106 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_364105 ?auto_364106 )
      ( !STACK ?auto_364105 ?auto_364104 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_364150 - BLOCK
      ?auto_364151 - BLOCK
      ?auto_364152 - BLOCK
      ?auto_364153 - BLOCK
      ?auto_364154 - BLOCK
      ?auto_364155 - BLOCK
      ?auto_364156 - BLOCK
      ?auto_364157 - BLOCK
      ?auto_364158 - BLOCK
      ?auto_364159 - BLOCK
      ?auto_364160 - BLOCK
      ?auto_364161 - BLOCK
      ?auto_364162 - BLOCK
      ?auto_364163 - BLOCK
    )
    :vars
    (
      ?auto_364164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_364163 ?auto_364164 ) ( ON-TABLE ?auto_364150 ) ( ON ?auto_364151 ?auto_364150 ) ( ON ?auto_364152 ?auto_364151 ) ( ON ?auto_364153 ?auto_364152 ) ( ON ?auto_364154 ?auto_364153 ) ( ON ?auto_364155 ?auto_364154 ) ( ON ?auto_364156 ?auto_364155 ) ( ON ?auto_364157 ?auto_364156 ) ( ON ?auto_364158 ?auto_364157 ) ( ON ?auto_364159 ?auto_364158 ) ( ON ?auto_364160 ?auto_364159 ) ( ON ?auto_364161 ?auto_364160 ) ( not ( = ?auto_364150 ?auto_364151 ) ) ( not ( = ?auto_364150 ?auto_364152 ) ) ( not ( = ?auto_364150 ?auto_364153 ) ) ( not ( = ?auto_364150 ?auto_364154 ) ) ( not ( = ?auto_364150 ?auto_364155 ) ) ( not ( = ?auto_364150 ?auto_364156 ) ) ( not ( = ?auto_364150 ?auto_364157 ) ) ( not ( = ?auto_364150 ?auto_364158 ) ) ( not ( = ?auto_364150 ?auto_364159 ) ) ( not ( = ?auto_364150 ?auto_364160 ) ) ( not ( = ?auto_364150 ?auto_364161 ) ) ( not ( = ?auto_364150 ?auto_364162 ) ) ( not ( = ?auto_364150 ?auto_364163 ) ) ( not ( = ?auto_364150 ?auto_364164 ) ) ( not ( = ?auto_364151 ?auto_364152 ) ) ( not ( = ?auto_364151 ?auto_364153 ) ) ( not ( = ?auto_364151 ?auto_364154 ) ) ( not ( = ?auto_364151 ?auto_364155 ) ) ( not ( = ?auto_364151 ?auto_364156 ) ) ( not ( = ?auto_364151 ?auto_364157 ) ) ( not ( = ?auto_364151 ?auto_364158 ) ) ( not ( = ?auto_364151 ?auto_364159 ) ) ( not ( = ?auto_364151 ?auto_364160 ) ) ( not ( = ?auto_364151 ?auto_364161 ) ) ( not ( = ?auto_364151 ?auto_364162 ) ) ( not ( = ?auto_364151 ?auto_364163 ) ) ( not ( = ?auto_364151 ?auto_364164 ) ) ( not ( = ?auto_364152 ?auto_364153 ) ) ( not ( = ?auto_364152 ?auto_364154 ) ) ( not ( = ?auto_364152 ?auto_364155 ) ) ( not ( = ?auto_364152 ?auto_364156 ) ) ( not ( = ?auto_364152 ?auto_364157 ) ) ( not ( = ?auto_364152 ?auto_364158 ) ) ( not ( = ?auto_364152 ?auto_364159 ) ) ( not ( = ?auto_364152 ?auto_364160 ) ) ( not ( = ?auto_364152 ?auto_364161 ) ) ( not ( = ?auto_364152 ?auto_364162 ) ) ( not ( = ?auto_364152 ?auto_364163 ) ) ( not ( = ?auto_364152 ?auto_364164 ) ) ( not ( = ?auto_364153 ?auto_364154 ) ) ( not ( = ?auto_364153 ?auto_364155 ) ) ( not ( = ?auto_364153 ?auto_364156 ) ) ( not ( = ?auto_364153 ?auto_364157 ) ) ( not ( = ?auto_364153 ?auto_364158 ) ) ( not ( = ?auto_364153 ?auto_364159 ) ) ( not ( = ?auto_364153 ?auto_364160 ) ) ( not ( = ?auto_364153 ?auto_364161 ) ) ( not ( = ?auto_364153 ?auto_364162 ) ) ( not ( = ?auto_364153 ?auto_364163 ) ) ( not ( = ?auto_364153 ?auto_364164 ) ) ( not ( = ?auto_364154 ?auto_364155 ) ) ( not ( = ?auto_364154 ?auto_364156 ) ) ( not ( = ?auto_364154 ?auto_364157 ) ) ( not ( = ?auto_364154 ?auto_364158 ) ) ( not ( = ?auto_364154 ?auto_364159 ) ) ( not ( = ?auto_364154 ?auto_364160 ) ) ( not ( = ?auto_364154 ?auto_364161 ) ) ( not ( = ?auto_364154 ?auto_364162 ) ) ( not ( = ?auto_364154 ?auto_364163 ) ) ( not ( = ?auto_364154 ?auto_364164 ) ) ( not ( = ?auto_364155 ?auto_364156 ) ) ( not ( = ?auto_364155 ?auto_364157 ) ) ( not ( = ?auto_364155 ?auto_364158 ) ) ( not ( = ?auto_364155 ?auto_364159 ) ) ( not ( = ?auto_364155 ?auto_364160 ) ) ( not ( = ?auto_364155 ?auto_364161 ) ) ( not ( = ?auto_364155 ?auto_364162 ) ) ( not ( = ?auto_364155 ?auto_364163 ) ) ( not ( = ?auto_364155 ?auto_364164 ) ) ( not ( = ?auto_364156 ?auto_364157 ) ) ( not ( = ?auto_364156 ?auto_364158 ) ) ( not ( = ?auto_364156 ?auto_364159 ) ) ( not ( = ?auto_364156 ?auto_364160 ) ) ( not ( = ?auto_364156 ?auto_364161 ) ) ( not ( = ?auto_364156 ?auto_364162 ) ) ( not ( = ?auto_364156 ?auto_364163 ) ) ( not ( = ?auto_364156 ?auto_364164 ) ) ( not ( = ?auto_364157 ?auto_364158 ) ) ( not ( = ?auto_364157 ?auto_364159 ) ) ( not ( = ?auto_364157 ?auto_364160 ) ) ( not ( = ?auto_364157 ?auto_364161 ) ) ( not ( = ?auto_364157 ?auto_364162 ) ) ( not ( = ?auto_364157 ?auto_364163 ) ) ( not ( = ?auto_364157 ?auto_364164 ) ) ( not ( = ?auto_364158 ?auto_364159 ) ) ( not ( = ?auto_364158 ?auto_364160 ) ) ( not ( = ?auto_364158 ?auto_364161 ) ) ( not ( = ?auto_364158 ?auto_364162 ) ) ( not ( = ?auto_364158 ?auto_364163 ) ) ( not ( = ?auto_364158 ?auto_364164 ) ) ( not ( = ?auto_364159 ?auto_364160 ) ) ( not ( = ?auto_364159 ?auto_364161 ) ) ( not ( = ?auto_364159 ?auto_364162 ) ) ( not ( = ?auto_364159 ?auto_364163 ) ) ( not ( = ?auto_364159 ?auto_364164 ) ) ( not ( = ?auto_364160 ?auto_364161 ) ) ( not ( = ?auto_364160 ?auto_364162 ) ) ( not ( = ?auto_364160 ?auto_364163 ) ) ( not ( = ?auto_364160 ?auto_364164 ) ) ( not ( = ?auto_364161 ?auto_364162 ) ) ( not ( = ?auto_364161 ?auto_364163 ) ) ( not ( = ?auto_364161 ?auto_364164 ) ) ( not ( = ?auto_364162 ?auto_364163 ) ) ( not ( = ?auto_364162 ?auto_364164 ) ) ( not ( = ?auto_364163 ?auto_364164 ) ) ( CLEAR ?auto_364161 ) ( ON ?auto_364162 ?auto_364163 ) ( CLEAR ?auto_364162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_364150 ?auto_364151 ?auto_364152 ?auto_364153 ?auto_364154 ?auto_364155 ?auto_364156 ?auto_364157 ?auto_364158 ?auto_364159 ?auto_364160 ?auto_364161 ?auto_364162 )
      ( MAKE-14PILE ?auto_364150 ?auto_364151 ?auto_364152 ?auto_364153 ?auto_364154 ?auto_364155 ?auto_364156 ?auto_364157 ?auto_364158 ?auto_364159 ?auto_364160 ?auto_364161 ?auto_364162 ?auto_364163 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_364208 - BLOCK
      ?auto_364209 - BLOCK
      ?auto_364210 - BLOCK
      ?auto_364211 - BLOCK
      ?auto_364212 - BLOCK
      ?auto_364213 - BLOCK
      ?auto_364214 - BLOCK
      ?auto_364215 - BLOCK
      ?auto_364216 - BLOCK
      ?auto_364217 - BLOCK
      ?auto_364218 - BLOCK
      ?auto_364219 - BLOCK
      ?auto_364220 - BLOCK
      ?auto_364221 - BLOCK
    )
    :vars
    (
      ?auto_364222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_364221 ?auto_364222 ) ( ON-TABLE ?auto_364208 ) ( ON ?auto_364209 ?auto_364208 ) ( ON ?auto_364210 ?auto_364209 ) ( ON ?auto_364211 ?auto_364210 ) ( ON ?auto_364212 ?auto_364211 ) ( ON ?auto_364213 ?auto_364212 ) ( ON ?auto_364214 ?auto_364213 ) ( ON ?auto_364215 ?auto_364214 ) ( ON ?auto_364216 ?auto_364215 ) ( ON ?auto_364217 ?auto_364216 ) ( ON ?auto_364218 ?auto_364217 ) ( not ( = ?auto_364208 ?auto_364209 ) ) ( not ( = ?auto_364208 ?auto_364210 ) ) ( not ( = ?auto_364208 ?auto_364211 ) ) ( not ( = ?auto_364208 ?auto_364212 ) ) ( not ( = ?auto_364208 ?auto_364213 ) ) ( not ( = ?auto_364208 ?auto_364214 ) ) ( not ( = ?auto_364208 ?auto_364215 ) ) ( not ( = ?auto_364208 ?auto_364216 ) ) ( not ( = ?auto_364208 ?auto_364217 ) ) ( not ( = ?auto_364208 ?auto_364218 ) ) ( not ( = ?auto_364208 ?auto_364219 ) ) ( not ( = ?auto_364208 ?auto_364220 ) ) ( not ( = ?auto_364208 ?auto_364221 ) ) ( not ( = ?auto_364208 ?auto_364222 ) ) ( not ( = ?auto_364209 ?auto_364210 ) ) ( not ( = ?auto_364209 ?auto_364211 ) ) ( not ( = ?auto_364209 ?auto_364212 ) ) ( not ( = ?auto_364209 ?auto_364213 ) ) ( not ( = ?auto_364209 ?auto_364214 ) ) ( not ( = ?auto_364209 ?auto_364215 ) ) ( not ( = ?auto_364209 ?auto_364216 ) ) ( not ( = ?auto_364209 ?auto_364217 ) ) ( not ( = ?auto_364209 ?auto_364218 ) ) ( not ( = ?auto_364209 ?auto_364219 ) ) ( not ( = ?auto_364209 ?auto_364220 ) ) ( not ( = ?auto_364209 ?auto_364221 ) ) ( not ( = ?auto_364209 ?auto_364222 ) ) ( not ( = ?auto_364210 ?auto_364211 ) ) ( not ( = ?auto_364210 ?auto_364212 ) ) ( not ( = ?auto_364210 ?auto_364213 ) ) ( not ( = ?auto_364210 ?auto_364214 ) ) ( not ( = ?auto_364210 ?auto_364215 ) ) ( not ( = ?auto_364210 ?auto_364216 ) ) ( not ( = ?auto_364210 ?auto_364217 ) ) ( not ( = ?auto_364210 ?auto_364218 ) ) ( not ( = ?auto_364210 ?auto_364219 ) ) ( not ( = ?auto_364210 ?auto_364220 ) ) ( not ( = ?auto_364210 ?auto_364221 ) ) ( not ( = ?auto_364210 ?auto_364222 ) ) ( not ( = ?auto_364211 ?auto_364212 ) ) ( not ( = ?auto_364211 ?auto_364213 ) ) ( not ( = ?auto_364211 ?auto_364214 ) ) ( not ( = ?auto_364211 ?auto_364215 ) ) ( not ( = ?auto_364211 ?auto_364216 ) ) ( not ( = ?auto_364211 ?auto_364217 ) ) ( not ( = ?auto_364211 ?auto_364218 ) ) ( not ( = ?auto_364211 ?auto_364219 ) ) ( not ( = ?auto_364211 ?auto_364220 ) ) ( not ( = ?auto_364211 ?auto_364221 ) ) ( not ( = ?auto_364211 ?auto_364222 ) ) ( not ( = ?auto_364212 ?auto_364213 ) ) ( not ( = ?auto_364212 ?auto_364214 ) ) ( not ( = ?auto_364212 ?auto_364215 ) ) ( not ( = ?auto_364212 ?auto_364216 ) ) ( not ( = ?auto_364212 ?auto_364217 ) ) ( not ( = ?auto_364212 ?auto_364218 ) ) ( not ( = ?auto_364212 ?auto_364219 ) ) ( not ( = ?auto_364212 ?auto_364220 ) ) ( not ( = ?auto_364212 ?auto_364221 ) ) ( not ( = ?auto_364212 ?auto_364222 ) ) ( not ( = ?auto_364213 ?auto_364214 ) ) ( not ( = ?auto_364213 ?auto_364215 ) ) ( not ( = ?auto_364213 ?auto_364216 ) ) ( not ( = ?auto_364213 ?auto_364217 ) ) ( not ( = ?auto_364213 ?auto_364218 ) ) ( not ( = ?auto_364213 ?auto_364219 ) ) ( not ( = ?auto_364213 ?auto_364220 ) ) ( not ( = ?auto_364213 ?auto_364221 ) ) ( not ( = ?auto_364213 ?auto_364222 ) ) ( not ( = ?auto_364214 ?auto_364215 ) ) ( not ( = ?auto_364214 ?auto_364216 ) ) ( not ( = ?auto_364214 ?auto_364217 ) ) ( not ( = ?auto_364214 ?auto_364218 ) ) ( not ( = ?auto_364214 ?auto_364219 ) ) ( not ( = ?auto_364214 ?auto_364220 ) ) ( not ( = ?auto_364214 ?auto_364221 ) ) ( not ( = ?auto_364214 ?auto_364222 ) ) ( not ( = ?auto_364215 ?auto_364216 ) ) ( not ( = ?auto_364215 ?auto_364217 ) ) ( not ( = ?auto_364215 ?auto_364218 ) ) ( not ( = ?auto_364215 ?auto_364219 ) ) ( not ( = ?auto_364215 ?auto_364220 ) ) ( not ( = ?auto_364215 ?auto_364221 ) ) ( not ( = ?auto_364215 ?auto_364222 ) ) ( not ( = ?auto_364216 ?auto_364217 ) ) ( not ( = ?auto_364216 ?auto_364218 ) ) ( not ( = ?auto_364216 ?auto_364219 ) ) ( not ( = ?auto_364216 ?auto_364220 ) ) ( not ( = ?auto_364216 ?auto_364221 ) ) ( not ( = ?auto_364216 ?auto_364222 ) ) ( not ( = ?auto_364217 ?auto_364218 ) ) ( not ( = ?auto_364217 ?auto_364219 ) ) ( not ( = ?auto_364217 ?auto_364220 ) ) ( not ( = ?auto_364217 ?auto_364221 ) ) ( not ( = ?auto_364217 ?auto_364222 ) ) ( not ( = ?auto_364218 ?auto_364219 ) ) ( not ( = ?auto_364218 ?auto_364220 ) ) ( not ( = ?auto_364218 ?auto_364221 ) ) ( not ( = ?auto_364218 ?auto_364222 ) ) ( not ( = ?auto_364219 ?auto_364220 ) ) ( not ( = ?auto_364219 ?auto_364221 ) ) ( not ( = ?auto_364219 ?auto_364222 ) ) ( not ( = ?auto_364220 ?auto_364221 ) ) ( not ( = ?auto_364220 ?auto_364222 ) ) ( not ( = ?auto_364221 ?auto_364222 ) ) ( ON ?auto_364220 ?auto_364221 ) ( CLEAR ?auto_364218 ) ( ON ?auto_364219 ?auto_364220 ) ( CLEAR ?auto_364219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_364208 ?auto_364209 ?auto_364210 ?auto_364211 ?auto_364212 ?auto_364213 ?auto_364214 ?auto_364215 ?auto_364216 ?auto_364217 ?auto_364218 ?auto_364219 )
      ( MAKE-14PILE ?auto_364208 ?auto_364209 ?auto_364210 ?auto_364211 ?auto_364212 ?auto_364213 ?auto_364214 ?auto_364215 ?auto_364216 ?auto_364217 ?auto_364218 ?auto_364219 ?auto_364220 ?auto_364221 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_364266 - BLOCK
      ?auto_364267 - BLOCK
      ?auto_364268 - BLOCK
      ?auto_364269 - BLOCK
      ?auto_364270 - BLOCK
      ?auto_364271 - BLOCK
      ?auto_364272 - BLOCK
      ?auto_364273 - BLOCK
      ?auto_364274 - BLOCK
      ?auto_364275 - BLOCK
      ?auto_364276 - BLOCK
      ?auto_364277 - BLOCK
      ?auto_364278 - BLOCK
      ?auto_364279 - BLOCK
    )
    :vars
    (
      ?auto_364280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_364279 ?auto_364280 ) ( ON-TABLE ?auto_364266 ) ( ON ?auto_364267 ?auto_364266 ) ( ON ?auto_364268 ?auto_364267 ) ( ON ?auto_364269 ?auto_364268 ) ( ON ?auto_364270 ?auto_364269 ) ( ON ?auto_364271 ?auto_364270 ) ( ON ?auto_364272 ?auto_364271 ) ( ON ?auto_364273 ?auto_364272 ) ( ON ?auto_364274 ?auto_364273 ) ( ON ?auto_364275 ?auto_364274 ) ( not ( = ?auto_364266 ?auto_364267 ) ) ( not ( = ?auto_364266 ?auto_364268 ) ) ( not ( = ?auto_364266 ?auto_364269 ) ) ( not ( = ?auto_364266 ?auto_364270 ) ) ( not ( = ?auto_364266 ?auto_364271 ) ) ( not ( = ?auto_364266 ?auto_364272 ) ) ( not ( = ?auto_364266 ?auto_364273 ) ) ( not ( = ?auto_364266 ?auto_364274 ) ) ( not ( = ?auto_364266 ?auto_364275 ) ) ( not ( = ?auto_364266 ?auto_364276 ) ) ( not ( = ?auto_364266 ?auto_364277 ) ) ( not ( = ?auto_364266 ?auto_364278 ) ) ( not ( = ?auto_364266 ?auto_364279 ) ) ( not ( = ?auto_364266 ?auto_364280 ) ) ( not ( = ?auto_364267 ?auto_364268 ) ) ( not ( = ?auto_364267 ?auto_364269 ) ) ( not ( = ?auto_364267 ?auto_364270 ) ) ( not ( = ?auto_364267 ?auto_364271 ) ) ( not ( = ?auto_364267 ?auto_364272 ) ) ( not ( = ?auto_364267 ?auto_364273 ) ) ( not ( = ?auto_364267 ?auto_364274 ) ) ( not ( = ?auto_364267 ?auto_364275 ) ) ( not ( = ?auto_364267 ?auto_364276 ) ) ( not ( = ?auto_364267 ?auto_364277 ) ) ( not ( = ?auto_364267 ?auto_364278 ) ) ( not ( = ?auto_364267 ?auto_364279 ) ) ( not ( = ?auto_364267 ?auto_364280 ) ) ( not ( = ?auto_364268 ?auto_364269 ) ) ( not ( = ?auto_364268 ?auto_364270 ) ) ( not ( = ?auto_364268 ?auto_364271 ) ) ( not ( = ?auto_364268 ?auto_364272 ) ) ( not ( = ?auto_364268 ?auto_364273 ) ) ( not ( = ?auto_364268 ?auto_364274 ) ) ( not ( = ?auto_364268 ?auto_364275 ) ) ( not ( = ?auto_364268 ?auto_364276 ) ) ( not ( = ?auto_364268 ?auto_364277 ) ) ( not ( = ?auto_364268 ?auto_364278 ) ) ( not ( = ?auto_364268 ?auto_364279 ) ) ( not ( = ?auto_364268 ?auto_364280 ) ) ( not ( = ?auto_364269 ?auto_364270 ) ) ( not ( = ?auto_364269 ?auto_364271 ) ) ( not ( = ?auto_364269 ?auto_364272 ) ) ( not ( = ?auto_364269 ?auto_364273 ) ) ( not ( = ?auto_364269 ?auto_364274 ) ) ( not ( = ?auto_364269 ?auto_364275 ) ) ( not ( = ?auto_364269 ?auto_364276 ) ) ( not ( = ?auto_364269 ?auto_364277 ) ) ( not ( = ?auto_364269 ?auto_364278 ) ) ( not ( = ?auto_364269 ?auto_364279 ) ) ( not ( = ?auto_364269 ?auto_364280 ) ) ( not ( = ?auto_364270 ?auto_364271 ) ) ( not ( = ?auto_364270 ?auto_364272 ) ) ( not ( = ?auto_364270 ?auto_364273 ) ) ( not ( = ?auto_364270 ?auto_364274 ) ) ( not ( = ?auto_364270 ?auto_364275 ) ) ( not ( = ?auto_364270 ?auto_364276 ) ) ( not ( = ?auto_364270 ?auto_364277 ) ) ( not ( = ?auto_364270 ?auto_364278 ) ) ( not ( = ?auto_364270 ?auto_364279 ) ) ( not ( = ?auto_364270 ?auto_364280 ) ) ( not ( = ?auto_364271 ?auto_364272 ) ) ( not ( = ?auto_364271 ?auto_364273 ) ) ( not ( = ?auto_364271 ?auto_364274 ) ) ( not ( = ?auto_364271 ?auto_364275 ) ) ( not ( = ?auto_364271 ?auto_364276 ) ) ( not ( = ?auto_364271 ?auto_364277 ) ) ( not ( = ?auto_364271 ?auto_364278 ) ) ( not ( = ?auto_364271 ?auto_364279 ) ) ( not ( = ?auto_364271 ?auto_364280 ) ) ( not ( = ?auto_364272 ?auto_364273 ) ) ( not ( = ?auto_364272 ?auto_364274 ) ) ( not ( = ?auto_364272 ?auto_364275 ) ) ( not ( = ?auto_364272 ?auto_364276 ) ) ( not ( = ?auto_364272 ?auto_364277 ) ) ( not ( = ?auto_364272 ?auto_364278 ) ) ( not ( = ?auto_364272 ?auto_364279 ) ) ( not ( = ?auto_364272 ?auto_364280 ) ) ( not ( = ?auto_364273 ?auto_364274 ) ) ( not ( = ?auto_364273 ?auto_364275 ) ) ( not ( = ?auto_364273 ?auto_364276 ) ) ( not ( = ?auto_364273 ?auto_364277 ) ) ( not ( = ?auto_364273 ?auto_364278 ) ) ( not ( = ?auto_364273 ?auto_364279 ) ) ( not ( = ?auto_364273 ?auto_364280 ) ) ( not ( = ?auto_364274 ?auto_364275 ) ) ( not ( = ?auto_364274 ?auto_364276 ) ) ( not ( = ?auto_364274 ?auto_364277 ) ) ( not ( = ?auto_364274 ?auto_364278 ) ) ( not ( = ?auto_364274 ?auto_364279 ) ) ( not ( = ?auto_364274 ?auto_364280 ) ) ( not ( = ?auto_364275 ?auto_364276 ) ) ( not ( = ?auto_364275 ?auto_364277 ) ) ( not ( = ?auto_364275 ?auto_364278 ) ) ( not ( = ?auto_364275 ?auto_364279 ) ) ( not ( = ?auto_364275 ?auto_364280 ) ) ( not ( = ?auto_364276 ?auto_364277 ) ) ( not ( = ?auto_364276 ?auto_364278 ) ) ( not ( = ?auto_364276 ?auto_364279 ) ) ( not ( = ?auto_364276 ?auto_364280 ) ) ( not ( = ?auto_364277 ?auto_364278 ) ) ( not ( = ?auto_364277 ?auto_364279 ) ) ( not ( = ?auto_364277 ?auto_364280 ) ) ( not ( = ?auto_364278 ?auto_364279 ) ) ( not ( = ?auto_364278 ?auto_364280 ) ) ( not ( = ?auto_364279 ?auto_364280 ) ) ( ON ?auto_364278 ?auto_364279 ) ( ON ?auto_364277 ?auto_364278 ) ( CLEAR ?auto_364275 ) ( ON ?auto_364276 ?auto_364277 ) ( CLEAR ?auto_364276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_364266 ?auto_364267 ?auto_364268 ?auto_364269 ?auto_364270 ?auto_364271 ?auto_364272 ?auto_364273 ?auto_364274 ?auto_364275 ?auto_364276 )
      ( MAKE-14PILE ?auto_364266 ?auto_364267 ?auto_364268 ?auto_364269 ?auto_364270 ?auto_364271 ?auto_364272 ?auto_364273 ?auto_364274 ?auto_364275 ?auto_364276 ?auto_364277 ?auto_364278 ?auto_364279 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_364324 - BLOCK
      ?auto_364325 - BLOCK
      ?auto_364326 - BLOCK
      ?auto_364327 - BLOCK
      ?auto_364328 - BLOCK
      ?auto_364329 - BLOCK
      ?auto_364330 - BLOCK
      ?auto_364331 - BLOCK
      ?auto_364332 - BLOCK
      ?auto_364333 - BLOCK
      ?auto_364334 - BLOCK
      ?auto_364335 - BLOCK
      ?auto_364336 - BLOCK
      ?auto_364337 - BLOCK
    )
    :vars
    (
      ?auto_364338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_364337 ?auto_364338 ) ( ON-TABLE ?auto_364324 ) ( ON ?auto_364325 ?auto_364324 ) ( ON ?auto_364326 ?auto_364325 ) ( ON ?auto_364327 ?auto_364326 ) ( ON ?auto_364328 ?auto_364327 ) ( ON ?auto_364329 ?auto_364328 ) ( ON ?auto_364330 ?auto_364329 ) ( ON ?auto_364331 ?auto_364330 ) ( ON ?auto_364332 ?auto_364331 ) ( not ( = ?auto_364324 ?auto_364325 ) ) ( not ( = ?auto_364324 ?auto_364326 ) ) ( not ( = ?auto_364324 ?auto_364327 ) ) ( not ( = ?auto_364324 ?auto_364328 ) ) ( not ( = ?auto_364324 ?auto_364329 ) ) ( not ( = ?auto_364324 ?auto_364330 ) ) ( not ( = ?auto_364324 ?auto_364331 ) ) ( not ( = ?auto_364324 ?auto_364332 ) ) ( not ( = ?auto_364324 ?auto_364333 ) ) ( not ( = ?auto_364324 ?auto_364334 ) ) ( not ( = ?auto_364324 ?auto_364335 ) ) ( not ( = ?auto_364324 ?auto_364336 ) ) ( not ( = ?auto_364324 ?auto_364337 ) ) ( not ( = ?auto_364324 ?auto_364338 ) ) ( not ( = ?auto_364325 ?auto_364326 ) ) ( not ( = ?auto_364325 ?auto_364327 ) ) ( not ( = ?auto_364325 ?auto_364328 ) ) ( not ( = ?auto_364325 ?auto_364329 ) ) ( not ( = ?auto_364325 ?auto_364330 ) ) ( not ( = ?auto_364325 ?auto_364331 ) ) ( not ( = ?auto_364325 ?auto_364332 ) ) ( not ( = ?auto_364325 ?auto_364333 ) ) ( not ( = ?auto_364325 ?auto_364334 ) ) ( not ( = ?auto_364325 ?auto_364335 ) ) ( not ( = ?auto_364325 ?auto_364336 ) ) ( not ( = ?auto_364325 ?auto_364337 ) ) ( not ( = ?auto_364325 ?auto_364338 ) ) ( not ( = ?auto_364326 ?auto_364327 ) ) ( not ( = ?auto_364326 ?auto_364328 ) ) ( not ( = ?auto_364326 ?auto_364329 ) ) ( not ( = ?auto_364326 ?auto_364330 ) ) ( not ( = ?auto_364326 ?auto_364331 ) ) ( not ( = ?auto_364326 ?auto_364332 ) ) ( not ( = ?auto_364326 ?auto_364333 ) ) ( not ( = ?auto_364326 ?auto_364334 ) ) ( not ( = ?auto_364326 ?auto_364335 ) ) ( not ( = ?auto_364326 ?auto_364336 ) ) ( not ( = ?auto_364326 ?auto_364337 ) ) ( not ( = ?auto_364326 ?auto_364338 ) ) ( not ( = ?auto_364327 ?auto_364328 ) ) ( not ( = ?auto_364327 ?auto_364329 ) ) ( not ( = ?auto_364327 ?auto_364330 ) ) ( not ( = ?auto_364327 ?auto_364331 ) ) ( not ( = ?auto_364327 ?auto_364332 ) ) ( not ( = ?auto_364327 ?auto_364333 ) ) ( not ( = ?auto_364327 ?auto_364334 ) ) ( not ( = ?auto_364327 ?auto_364335 ) ) ( not ( = ?auto_364327 ?auto_364336 ) ) ( not ( = ?auto_364327 ?auto_364337 ) ) ( not ( = ?auto_364327 ?auto_364338 ) ) ( not ( = ?auto_364328 ?auto_364329 ) ) ( not ( = ?auto_364328 ?auto_364330 ) ) ( not ( = ?auto_364328 ?auto_364331 ) ) ( not ( = ?auto_364328 ?auto_364332 ) ) ( not ( = ?auto_364328 ?auto_364333 ) ) ( not ( = ?auto_364328 ?auto_364334 ) ) ( not ( = ?auto_364328 ?auto_364335 ) ) ( not ( = ?auto_364328 ?auto_364336 ) ) ( not ( = ?auto_364328 ?auto_364337 ) ) ( not ( = ?auto_364328 ?auto_364338 ) ) ( not ( = ?auto_364329 ?auto_364330 ) ) ( not ( = ?auto_364329 ?auto_364331 ) ) ( not ( = ?auto_364329 ?auto_364332 ) ) ( not ( = ?auto_364329 ?auto_364333 ) ) ( not ( = ?auto_364329 ?auto_364334 ) ) ( not ( = ?auto_364329 ?auto_364335 ) ) ( not ( = ?auto_364329 ?auto_364336 ) ) ( not ( = ?auto_364329 ?auto_364337 ) ) ( not ( = ?auto_364329 ?auto_364338 ) ) ( not ( = ?auto_364330 ?auto_364331 ) ) ( not ( = ?auto_364330 ?auto_364332 ) ) ( not ( = ?auto_364330 ?auto_364333 ) ) ( not ( = ?auto_364330 ?auto_364334 ) ) ( not ( = ?auto_364330 ?auto_364335 ) ) ( not ( = ?auto_364330 ?auto_364336 ) ) ( not ( = ?auto_364330 ?auto_364337 ) ) ( not ( = ?auto_364330 ?auto_364338 ) ) ( not ( = ?auto_364331 ?auto_364332 ) ) ( not ( = ?auto_364331 ?auto_364333 ) ) ( not ( = ?auto_364331 ?auto_364334 ) ) ( not ( = ?auto_364331 ?auto_364335 ) ) ( not ( = ?auto_364331 ?auto_364336 ) ) ( not ( = ?auto_364331 ?auto_364337 ) ) ( not ( = ?auto_364331 ?auto_364338 ) ) ( not ( = ?auto_364332 ?auto_364333 ) ) ( not ( = ?auto_364332 ?auto_364334 ) ) ( not ( = ?auto_364332 ?auto_364335 ) ) ( not ( = ?auto_364332 ?auto_364336 ) ) ( not ( = ?auto_364332 ?auto_364337 ) ) ( not ( = ?auto_364332 ?auto_364338 ) ) ( not ( = ?auto_364333 ?auto_364334 ) ) ( not ( = ?auto_364333 ?auto_364335 ) ) ( not ( = ?auto_364333 ?auto_364336 ) ) ( not ( = ?auto_364333 ?auto_364337 ) ) ( not ( = ?auto_364333 ?auto_364338 ) ) ( not ( = ?auto_364334 ?auto_364335 ) ) ( not ( = ?auto_364334 ?auto_364336 ) ) ( not ( = ?auto_364334 ?auto_364337 ) ) ( not ( = ?auto_364334 ?auto_364338 ) ) ( not ( = ?auto_364335 ?auto_364336 ) ) ( not ( = ?auto_364335 ?auto_364337 ) ) ( not ( = ?auto_364335 ?auto_364338 ) ) ( not ( = ?auto_364336 ?auto_364337 ) ) ( not ( = ?auto_364336 ?auto_364338 ) ) ( not ( = ?auto_364337 ?auto_364338 ) ) ( ON ?auto_364336 ?auto_364337 ) ( ON ?auto_364335 ?auto_364336 ) ( ON ?auto_364334 ?auto_364335 ) ( CLEAR ?auto_364332 ) ( ON ?auto_364333 ?auto_364334 ) ( CLEAR ?auto_364333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_364324 ?auto_364325 ?auto_364326 ?auto_364327 ?auto_364328 ?auto_364329 ?auto_364330 ?auto_364331 ?auto_364332 ?auto_364333 )
      ( MAKE-14PILE ?auto_364324 ?auto_364325 ?auto_364326 ?auto_364327 ?auto_364328 ?auto_364329 ?auto_364330 ?auto_364331 ?auto_364332 ?auto_364333 ?auto_364334 ?auto_364335 ?auto_364336 ?auto_364337 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_364382 - BLOCK
      ?auto_364383 - BLOCK
      ?auto_364384 - BLOCK
      ?auto_364385 - BLOCK
      ?auto_364386 - BLOCK
      ?auto_364387 - BLOCK
      ?auto_364388 - BLOCK
      ?auto_364389 - BLOCK
      ?auto_364390 - BLOCK
      ?auto_364391 - BLOCK
      ?auto_364392 - BLOCK
      ?auto_364393 - BLOCK
      ?auto_364394 - BLOCK
      ?auto_364395 - BLOCK
    )
    :vars
    (
      ?auto_364396 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_364395 ?auto_364396 ) ( ON-TABLE ?auto_364382 ) ( ON ?auto_364383 ?auto_364382 ) ( ON ?auto_364384 ?auto_364383 ) ( ON ?auto_364385 ?auto_364384 ) ( ON ?auto_364386 ?auto_364385 ) ( ON ?auto_364387 ?auto_364386 ) ( ON ?auto_364388 ?auto_364387 ) ( ON ?auto_364389 ?auto_364388 ) ( not ( = ?auto_364382 ?auto_364383 ) ) ( not ( = ?auto_364382 ?auto_364384 ) ) ( not ( = ?auto_364382 ?auto_364385 ) ) ( not ( = ?auto_364382 ?auto_364386 ) ) ( not ( = ?auto_364382 ?auto_364387 ) ) ( not ( = ?auto_364382 ?auto_364388 ) ) ( not ( = ?auto_364382 ?auto_364389 ) ) ( not ( = ?auto_364382 ?auto_364390 ) ) ( not ( = ?auto_364382 ?auto_364391 ) ) ( not ( = ?auto_364382 ?auto_364392 ) ) ( not ( = ?auto_364382 ?auto_364393 ) ) ( not ( = ?auto_364382 ?auto_364394 ) ) ( not ( = ?auto_364382 ?auto_364395 ) ) ( not ( = ?auto_364382 ?auto_364396 ) ) ( not ( = ?auto_364383 ?auto_364384 ) ) ( not ( = ?auto_364383 ?auto_364385 ) ) ( not ( = ?auto_364383 ?auto_364386 ) ) ( not ( = ?auto_364383 ?auto_364387 ) ) ( not ( = ?auto_364383 ?auto_364388 ) ) ( not ( = ?auto_364383 ?auto_364389 ) ) ( not ( = ?auto_364383 ?auto_364390 ) ) ( not ( = ?auto_364383 ?auto_364391 ) ) ( not ( = ?auto_364383 ?auto_364392 ) ) ( not ( = ?auto_364383 ?auto_364393 ) ) ( not ( = ?auto_364383 ?auto_364394 ) ) ( not ( = ?auto_364383 ?auto_364395 ) ) ( not ( = ?auto_364383 ?auto_364396 ) ) ( not ( = ?auto_364384 ?auto_364385 ) ) ( not ( = ?auto_364384 ?auto_364386 ) ) ( not ( = ?auto_364384 ?auto_364387 ) ) ( not ( = ?auto_364384 ?auto_364388 ) ) ( not ( = ?auto_364384 ?auto_364389 ) ) ( not ( = ?auto_364384 ?auto_364390 ) ) ( not ( = ?auto_364384 ?auto_364391 ) ) ( not ( = ?auto_364384 ?auto_364392 ) ) ( not ( = ?auto_364384 ?auto_364393 ) ) ( not ( = ?auto_364384 ?auto_364394 ) ) ( not ( = ?auto_364384 ?auto_364395 ) ) ( not ( = ?auto_364384 ?auto_364396 ) ) ( not ( = ?auto_364385 ?auto_364386 ) ) ( not ( = ?auto_364385 ?auto_364387 ) ) ( not ( = ?auto_364385 ?auto_364388 ) ) ( not ( = ?auto_364385 ?auto_364389 ) ) ( not ( = ?auto_364385 ?auto_364390 ) ) ( not ( = ?auto_364385 ?auto_364391 ) ) ( not ( = ?auto_364385 ?auto_364392 ) ) ( not ( = ?auto_364385 ?auto_364393 ) ) ( not ( = ?auto_364385 ?auto_364394 ) ) ( not ( = ?auto_364385 ?auto_364395 ) ) ( not ( = ?auto_364385 ?auto_364396 ) ) ( not ( = ?auto_364386 ?auto_364387 ) ) ( not ( = ?auto_364386 ?auto_364388 ) ) ( not ( = ?auto_364386 ?auto_364389 ) ) ( not ( = ?auto_364386 ?auto_364390 ) ) ( not ( = ?auto_364386 ?auto_364391 ) ) ( not ( = ?auto_364386 ?auto_364392 ) ) ( not ( = ?auto_364386 ?auto_364393 ) ) ( not ( = ?auto_364386 ?auto_364394 ) ) ( not ( = ?auto_364386 ?auto_364395 ) ) ( not ( = ?auto_364386 ?auto_364396 ) ) ( not ( = ?auto_364387 ?auto_364388 ) ) ( not ( = ?auto_364387 ?auto_364389 ) ) ( not ( = ?auto_364387 ?auto_364390 ) ) ( not ( = ?auto_364387 ?auto_364391 ) ) ( not ( = ?auto_364387 ?auto_364392 ) ) ( not ( = ?auto_364387 ?auto_364393 ) ) ( not ( = ?auto_364387 ?auto_364394 ) ) ( not ( = ?auto_364387 ?auto_364395 ) ) ( not ( = ?auto_364387 ?auto_364396 ) ) ( not ( = ?auto_364388 ?auto_364389 ) ) ( not ( = ?auto_364388 ?auto_364390 ) ) ( not ( = ?auto_364388 ?auto_364391 ) ) ( not ( = ?auto_364388 ?auto_364392 ) ) ( not ( = ?auto_364388 ?auto_364393 ) ) ( not ( = ?auto_364388 ?auto_364394 ) ) ( not ( = ?auto_364388 ?auto_364395 ) ) ( not ( = ?auto_364388 ?auto_364396 ) ) ( not ( = ?auto_364389 ?auto_364390 ) ) ( not ( = ?auto_364389 ?auto_364391 ) ) ( not ( = ?auto_364389 ?auto_364392 ) ) ( not ( = ?auto_364389 ?auto_364393 ) ) ( not ( = ?auto_364389 ?auto_364394 ) ) ( not ( = ?auto_364389 ?auto_364395 ) ) ( not ( = ?auto_364389 ?auto_364396 ) ) ( not ( = ?auto_364390 ?auto_364391 ) ) ( not ( = ?auto_364390 ?auto_364392 ) ) ( not ( = ?auto_364390 ?auto_364393 ) ) ( not ( = ?auto_364390 ?auto_364394 ) ) ( not ( = ?auto_364390 ?auto_364395 ) ) ( not ( = ?auto_364390 ?auto_364396 ) ) ( not ( = ?auto_364391 ?auto_364392 ) ) ( not ( = ?auto_364391 ?auto_364393 ) ) ( not ( = ?auto_364391 ?auto_364394 ) ) ( not ( = ?auto_364391 ?auto_364395 ) ) ( not ( = ?auto_364391 ?auto_364396 ) ) ( not ( = ?auto_364392 ?auto_364393 ) ) ( not ( = ?auto_364392 ?auto_364394 ) ) ( not ( = ?auto_364392 ?auto_364395 ) ) ( not ( = ?auto_364392 ?auto_364396 ) ) ( not ( = ?auto_364393 ?auto_364394 ) ) ( not ( = ?auto_364393 ?auto_364395 ) ) ( not ( = ?auto_364393 ?auto_364396 ) ) ( not ( = ?auto_364394 ?auto_364395 ) ) ( not ( = ?auto_364394 ?auto_364396 ) ) ( not ( = ?auto_364395 ?auto_364396 ) ) ( ON ?auto_364394 ?auto_364395 ) ( ON ?auto_364393 ?auto_364394 ) ( ON ?auto_364392 ?auto_364393 ) ( ON ?auto_364391 ?auto_364392 ) ( CLEAR ?auto_364389 ) ( ON ?auto_364390 ?auto_364391 ) ( CLEAR ?auto_364390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_364382 ?auto_364383 ?auto_364384 ?auto_364385 ?auto_364386 ?auto_364387 ?auto_364388 ?auto_364389 ?auto_364390 )
      ( MAKE-14PILE ?auto_364382 ?auto_364383 ?auto_364384 ?auto_364385 ?auto_364386 ?auto_364387 ?auto_364388 ?auto_364389 ?auto_364390 ?auto_364391 ?auto_364392 ?auto_364393 ?auto_364394 ?auto_364395 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_364440 - BLOCK
      ?auto_364441 - BLOCK
      ?auto_364442 - BLOCK
      ?auto_364443 - BLOCK
      ?auto_364444 - BLOCK
      ?auto_364445 - BLOCK
      ?auto_364446 - BLOCK
      ?auto_364447 - BLOCK
      ?auto_364448 - BLOCK
      ?auto_364449 - BLOCK
      ?auto_364450 - BLOCK
      ?auto_364451 - BLOCK
      ?auto_364452 - BLOCK
      ?auto_364453 - BLOCK
    )
    :vars
    (
      ?auto_364454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_364453 ?auto_364454 ) ( ON-TABLE ?auto_364440 ) ( ON ?auto_364441 ?auto_364440 ) ( ON ?auto_364442 ?auto_364441 ) ( ON ?auto_364443 ?auto_364442 ) ( ON ?auto_364444 ?auto_364443 ) ( ON ?auto_364445 ?auto_364444 ) ( ON ?auto_364446 ?auto_364445 ) ( not ( = ?auto_364440 ?auto_364441 ) ) ( not ( = ?auto_364440 ?auto_364442 ) ) ( not ( = ?auto_364440 ?auto_364443 ) ) ( not ( = ?auto_364440 ?auto_364444 ) ) ( not ( = ?auto_364440 ?auto_364445 ) ) ( not ( = ?auto_364440 ?auto_364446 ) ) ( not ( = ?auto_364440 ?auto_364447 ) ) ( not ( = ?auto_364440 ?auto_364448 ) ) ( not ( = ?auto_364440 ?auto_364449 ) ) ( not ( = ?auto_364440 ?auto_364450 ) ) ( not ( = ?auto_364440 ?auto_364451 ) ) ( not ( = ?auto_364440 ?auto_364452 ) ) ( not ( = ?auto_364440 ?auto_364453 ) ) ( not ( = ?auto_364440 ?auto_364454 ) ) ( not ( = ?auto_364441 ?auto_364442 ) ) ( not ( = ?auto_364441 ?auto_364443 ) ) ( not ( = ?auto_364441 ?auto_364444 ) ) ( not ( = ?auto_364441 ?auto_364445 ) ) ( not ( = ?auto_364441 ?auto_364446 ) ) ( not ( = ?auto_364441 ?auto_364447 ) ) ( not ( = ?auto_364441 ?auto_364448 ) ) ( not ( = ?auto_364441 ?auto_364449 ) ) ( not ( = ?auto_364441 ?auto_364450 ) ) ( not ( = ?auto_364441 ?auto_364451 ) ) ( not ( = ?auto_364441 ?auto_364452 ) ) ( not ( = ?auto_364441 ?auto_364453 ) ) ( not ( = ?auto_364441 ?auto_364454 ) ) ( not ( = ?auto_364442 ?auto_364443 ) ) ( not ( = ?auto_364442 ?auto_364444 ) ) ( not ( = ?auto_364442 ?auto_364445 ) ) ( not ( = ?auto_364442 ?auto_364446 ) ) ( not ( = ?auto_364442 ?auto_364447 ) ) ( not ( = ?auto_364442 ?auto_364448 ) ) ( not ( = ?auto_364442 ?auto_364449 ) ) ( not ( = ?auto_364442 ?auto_364450 ) ) ( not ( = ?auto_364442 ?auto_364451 ) ) ( not ( = ?auto_364442 ?auto_364452 ) ) ( not ( = ?auto_364442 ?auto_364453 ) ) ( not ( = ?auto_364442 ?auto_364454 ) ) ( not ( = ?auto_364443 ?auto_364444 ) ) ( not ( = ?auto_364443 ?auto_364445 ) ) ( not ( = ?auto_364443 ?auto_364446 ) ) ( not ( = ?auto_364443 ?auto_364447 ) ) ( not ( = ?auto_364443 ?auto_364448 ) ) ( not ( = ?auto_364443 ?auto_364449 ) ) ( not ( = ?auto_364443 ?auto_364450 ) ) ( not ( = ?auto_364443 ?auto_364451 ) ) ( not ( = ?auto_364443 ?auto_364452 ) ) ( not ( = ?auto_364443 ?auto_364453 ) ) ( not ( = ?auto_364443 ?auto_364454 ) ) ( not ( = ?auto_364444 ?auto_364445 ) ) ( not ( = ?auto_364444 ?auto_364446 ) ) ( not ( = ?auto_364444 ?auto_364447 ) ) ( not ( = ?auto_364444 ?auto_364448 ) ) ( not ( = ?auto_364444 ?auto_364449 ) ) ( not ( = ?auto_364444 ?auto_364450 ) ) ( not ( = ?auto_364444 ?auto_364451 ) ) ( not ( = ?auto_364444 ?auto_364452 ) ) ( not ( = ?auto_364444 ?auto_364453 ) ) ( not ( = ?auto_364444 ?auto_364454 ) ) ( not ( = ?auto_364445 ?auto_364446 ) ) ( not ( = ?auto_364445 ?auto_364447 ) ) ( not ( = ?auto_364445 ?auto_364448 ) ) ( not ( = ?auto_364445 ?auto_364449 ) ) ( not ( = ?auto_364445 ?auto_364450 ) ) ( not ( = ?auto_364445 ?auto_364451 ) ) ( not ( = ?auto_364445 ?auto_364452 ) ) ( not ( = ?auto_364445 ?auto_364453 ) ) ( not ( = ?auto_364445 ?auto_364454 ) ) ( not ( = ?auto_364446 ?auto_364447 ) ) ( not ( = ?auto_364446 ?auto_364448 ) ) ( not ( = ?auto_364446 ?auto_364449 ) ) ( not ( = ?auto_364446 ?auto_364450 ) ) ( not ( = ?auto_364446 ?auto_364451 ) ) ( not ( = ?auto_364446 ?auto_364452 ) ) ( not ( = ?auto_364446 ?auto_364453 ) ) ( not ( = ?auto_364446 ?auto_364454 ) ) ( not ( = ?auto_364447 ?auto_364448 ) ) ( not ( = ?auto_364447 ?auto_364449 ) ) ( not ( = ?auto_364447 ?auto_364450 ) ) ( not ( = ?auto_364447 ?auto_364451 ) ) ( not ( = ?auto_364447 ?auto_364452 ) ) ( not ( = ?auto_364447 ?auto_364453 ) ) ( not ( = ?auto_364447 ?auto_364454 ) ) ( not ( = ?auto_364448 ?auto_364449 ) ) ( not ( = ?auto_364448 ?auto_364450 ) ) ( not ( = ?auto_364448 ?auto_364451 ) ) ( not ( = ?auto_364448 ?auto_364452 ) ) ( not ( = ?auto_364448 ?auto_364453 ) ) ( not ( = ?auto_364448 ?auto_364454 ) ) ( not ( = ?auto_364449 ?auto_364450 ) ) ( not ( = ?auto_364449 ?auto_364451 ) ) ( not ( = ?auto_364449 ?auto_364452 ) ) ( not ( = ?auto_364449 ?auto_364453 ) ) ( not ( = ?auto_364449 ?auto_364454 ) ) ( not ( = ?auto_364450 ?auto_364451 ) ) ( not ( = ?auto_364450 ?auto_364452 ) ) ( not ( = ?auto_364450 ?auto_364453 ) ) ( not ( = ?auto_364450 ?auto_364454 ) ) ( not ( = ?auto_364451 ?auto_364452 ) ) ( not ( = ?auto_364451 ?auto_364453 ) ) ( not ( = ?auto_364451 ?auto_364454 ) ) ( not ( = ?auto_364452 ?auto_364453 ) ) ( not ( = ?auto_364452 ?auto_364454 ) ) ( not ( = ?auto_364453 ?auto_364454 ) ) ( ON ?auto_364452 ?auto_364453 ) ( ON ?auto_364451 ?auto_364452 ) ( ON ?auto_364450 ?auto_364451 ) ( ON ?auto_364449 ?auto_364450 ) ( ON ?auto_364448 ?auto_364449 ) ( CLEAR ?auto_364446 ) ( ON ?auto_364447 ?auto_364448 ) ( CLEAR ?auto_364447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_364440 ?auto_364441 ?auto_364442 ?auto_364443 ?auto_364444 ?auto_364445 ?auto_364446 ?auto_364447 )
      ( MAKE-14PILE ?auto_364440 ?auto_364441 ?auto_364442 ?auto_364443 ?auto_364444 ?auto_364445 ?auto_364446 ?auto_364447 ?auto_364448 ?auto_364449 ?auto_364450 ?auto_364451 ?auto_364452 ?auto_364453 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_364498 - BLOCK
      ?auto_364499 - BLOCK
      ?auto_364500 - BLOCK
      ?auto_364501 - BLOCK
      ?auto_364502 - BLOCK
      ?auto_364503 - BLOCK
      ?auto_364504 - BLOCK
      ?auto_364505 - BLOCK
      ?auto_364506 - BLOCK
      ?auto_364507 - BLOCK
      ?auto_364508 - BLOCK
      ?auto_364509 - BLOCK
      ?auto_364510 - BLOCK
      ?auto_364511 - BLOCK
    )
    :vars
    (
      ?auto_364512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_364511 ?auto_364512 ) ( ON-TABLE ?auto_364498 ) ( ON ?auto_364499 ?auto_364498 ) ( ON ?auto_364500 ?auto_364499 ) ( ON ?auto_364501 ?auto_364500 ) ( ON ?auto_364502 ?auto_364501 ) ( ON ?auto_364503 ?auto_364502 ) ( not ( = ?auto_364498 ?auto_364499 ) ) ( not ( = ?auto_364498 ?auto_364500 ) ) ( not ( = ?auto_364498 ?auto_364501 ) ) ( not ( = ?auto_364498 ?auto_364502 ) ) ( not ( = ?auto_364498 ?auto_364503 ) ) ( not ( = ?auto_364498 ?auto_364504 ) ) ( not ( = ?auto_364498 ?auto_364505 ) ) ( not ( = ?auto_364498 ?auto_364506 ) ) ( not ( = ?auto_364498 ?auto_364507 ) ) ( not ( = ?auto_364498 ?auto_364508 ) ) ( not ( = ?auto_364498 ?auto_364509 ) ) ( not ( = ?auto_364498 ?auto_364510 ) ) ( not ( = ?auto_364498 ?auto_364511 ) ) ( not ( = ?auto_364498 ?auto_364512 ) ) ( not ( = ?auto_364499 ?auto_364500 ) ) ( not ( = ?auto_364499 ?auto_364501 ) ) ( not ( = ?auto_364499 ?auto_364502 ) ) ( not ( = ?auto_364499 ?auto_364503 ) ) ( not ( = ?auto_364499 ?auto_364504 ) ) ( not ( = ?auto_364499 ?auto_364505 ) ) ( not ( = ?auto_364499 ?auto_364506 ) ) ( not ( = ?auto_364499 ?auto_364507 ) ) ( not ( = ?auto_364499 ?auto_364508 ) ) ( not ( = ?auto_364499 ?auto_364509 ) ) ( not ( = ?auto_364499 ?auto_364510 ) ) ( not ( = ?auto_364499 ?auto_364511 ) ) ( not ( = ?auto_364499 ?auto_364512 ) ) ( not ( = ?auto_364500 ?auto_364501 ) ) ( not ( = ?auto_364500 ?auto_364502 ) ) ( not ( = ?auto_364500 ?auto_364503 ) ) ( not ( = ?auto_364500 ?auto_364504 ) ) ( not ( = ?auto_364500 ?auto_364505 ) ) ( not ( = ?auto_364500 ?auto_364506 ) ) ( not ( = ?auto_364500 ?auto_364507 ) ) ( not ( = ?auto_364500 ?auto_364508 ) ) ( not ( = ?auto_364500 ?auto_364509 ) ) ( not ( = ?auto_364500 ?auto_364510 ) ) ( not ( = ?auto_364500 ?auto_364511 ) ) ( not ( = ?auto_364500 ?auto_364512 ) ) ( not ( = ?auto_364501 ?auto_364502 ) ) ( not ( = ?auto_364501 ?auto_364503 ) ) ( not ( = ?auto_364501 ?auto_364504 ) ) ( not ( = ?auto_364501 ?auto_364505 ) ) ( not ( = ?auto_364501 ?auto_364506 ) ) ( not ( = ?auto_364501 ?auto_364507 ) ) ( not ( = ?auto_364501 ?auto_364508 ) ) ( not ( = ?auto_364501 ?auto_364509 ) ) ( not ( = ?auto_364501 ?auto_364510 ) ) ( not ( = ?auto_364501 ?auto_364511 ) ) ( not ( = ?auto_364501 ?auto_364512 ) ) ( not ( = ?auto_364502 ?auto_364503 ) ) ( not ( = ?auto_364502 ?auto_364504 ) ) ( not ( = ?auto_364502 ?auto_364505 ) ) ( not ( = ?auto_364502 ?auto_364506 ) ) ( not ( = ?auto_364502 ?auto_364507 ) ) ( not ( = ?auto_364502 ?auto_364508 ) ) ( not ( = ?auto_364502 ?auto_364509 ) ) ( not ( = ?auto_364502 ?auto_364510 ) ) ( not ( = ?auto_364502 ?auto_364511 ) ) ( not ( = ?auto_364502 ?auto_364512 ) ) ( not ( = ?auto_364503 ?auto_364504 ) ) ( not ( = ?auto_364503 ?auto_364505 ) ) ( not ( = ?auto_364503 ?auto_364506 ) ) ( not ( = ?auto_364503 ?auto_364507 ) ) ( not ( = ?auto_364503 ?auto_364508 ) ) ( not ( = ?auto_364503 ?auto_364509 ) ) ( not ( = ?auto_364503 ?auto_364510 ) ) ( not ( = ?auto_364503 ?auto_364511 ) ) ( not ( = ?auto_364503 ?auto_364512 ) ) ( not ( = ?auto_364504 ?auto_364505 ) ) ( not ( = ?auto_364504 ?auto_364506 ) ) ( not ( = ?auto_364504 ?auto_364507 ) ) ( not ( = ?auto_364504 ?auto_364508 ) ) ( not ( = ?auto_364504 ?auto_364509 ) ) ( not ( = ?auto_364504 ?auto_364510 ) ) ( not ( = ?auto_364504 ?auto_364511 ) ) ( not ( = ?auto_364504 ?auto_364512 ) ) ( not ( = ?auto_364505 ?auto_364506 ) ) ( not ( = ?auto_364505 ?auto_364507 ) ) ( not ( = ?auto_364505 ?auto_364508 ) ) ( not ( = ?auto_364505 ?auto_364509 ) ) ( not ( = ?auto_364505 ?auto_364510 ) ) ( not ( = ?auto_364505 ?auto_364511 ) ) ( not ( = ?auto_364505 ?auto_364512 ) ) ( not ( = ?auto_364506 ?auto_364507 ) ) ( not ( = ?auto_364506 ?auto_364508 ) ) ( not ( = ?auto_364506 ?auto_364509 ) ) ( not ( = ?auto_364506 ?auto_364510 ) ) ( not ( = ?auto_364506 ?auto_364511 ) ) ( not ( = ?auto_364506 ?auto_364512 ) ) ( not ( = ?auto_364507 ?auto_364508 ) ) ( not ( = ?auto_364507 ?auto_364509 ) ) ( not ( = ?auto_364507 ?auto_364510 ) ) ( not ( = ?auto_364507 ?auto_364511 ) ) ( not ( = ?auto_364507 ?auto_364512 ) ) ( not ( = ?auto_364508 ?auto_364509 ) ) ( not ( = ?auto_364508 ?auto_364510 ) ) ( not ( = ?auto_364508 ?auto_364511 ) ) ( not ( = ?auto_364508 ?auto_364512 ) ) ( not ( = ?auto_364509 ?auto_364510 ) ) ( not ( = ?auto_364509 ?auto_364511 ) ) ( not ( = ?auto_364509 ?auto_364512 ) ) ( not ( = ?auto_364510 ?auto_364511 ) ) ( not ( = ?auto_364510 ?auto_364512 ) ) ( not ( = ?auto_364511 ?auto_364512 ) ) ( ON ?auto_364510 ?auto_364511 ) ( ON ?auto_364509 ?auto_364510 ) ( ON ?auto_364508 ?auto_364509 ) ( ON ?auto_364507 ?auto_364508 ) ( ON ?auto_364506 ?auto_364507 ) ( ON ?auto_364505 ?auto_364506 ) ( CLEAR ?auto_364503 ) ( ON ?auto_364504 ?auto_364505 ) ( CLEAR ?auto_364504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_364498 ?auto_364499 ?auto_364500 ?auto_364501 ?auto_364502 ?auto_364503 ?auto_364504 )
      ( MAKE-14PILE ?auto_364498 ?auto_364499 ?auto_364500 ?auto_364501 ?auto_364502 ?auto_364503 ?auto_364504 ?auto_364505 ?auto_364506 ?auto_364507 ?auto_364508 ?auto_364509 ?auto_364510 ?auto_364511 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_364556 - BLOCK
      ?auto_364557 - BLOCK
      ?auto_364558 - BLOCK
      ?auto_364559 - BLOCK
      ?auto_364560 - BLOCK
      ?auto_364561 - BLOCK
      ?auto_364562 - BLOCK
      ?auto_364563 - BLOCK
      ?auto_364564 - BLOCK
      ?auto_364565 - BLOCK
      ?auto_364566 - BLOCK
      ?auto_364567 - BLOCK
      ?auto_364568 - BLOCK
      ?auto_364569 - BLOCK
    )
    :vars
    (
      ?auto_364570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_364569 ?auto_364570 ) ( ON-TABLE ?auto_364556 ) ( ON ?auto_364557 ?auto_364556 ) ( ON ?auto_364558 ?auto_364557 ) ( ON ?auto_364559 ?auto_364558 ) ( ON ?auto_364560 ?auto_364559 ) ( not ( = ?auto_364556 ?auto_364557 ) ) ( not ( = ?auto_364556 ?auto_364558 ) ) ( not ( = ?auto_364556 ?auto_364559 ) ) ( not ( = ?auto_364556 ?auto_364560 ) ) ( not ( = ?auto_364556 ?auto_364561 ) ) ( not ( = ?auto_364556 ?auto_364562 ) ) ( not ( = ?auto_364556 ?auto_364563 ) ) ( not ( = ?auto_364556 ?auto_364564 ) ) ( not ( = ?auto_364556 ?auto_364565 ) ) ( not ( = ?auto_364556 ?auto_364566 ) ) ( not ( = ?auto_364556 ?auto_364567 ) ) ( not ( = ?auto_364556 ?auto_364568 ) ) ( not ( = ?auto_364556 ?auto_364569 ) ) ( not ( = ?auto_364556 ?auto_364570 ) ) ( not ( = ?auto_364557 ?auto_364558 ) ) ( not ( = ?auto_364557 ?auto_364559 ) ) ( not ( = ?auto_364557 ?auto_364560 ) ) ( not ( = ?auto_364557 ?auto_364561 ) ) ( not ( = ?auto_364557 ?auto_364562 ) ) ( not ( = ?auto_364557 ?auto_364563 ) ) ( not ( = ?auto_364557 ?auto_364564 ) ) ( not ( = ?auto_364557 ?auto_364565 ) ) ( not ( = ?auto_364557 ?auto_364566 ) ) ( not ( = ?auto_364557 ?auto_364567 ) ) ( not ( = ?auto_364557 ?auto_364568 ) ) ( not ( = ?auto_364557 ?auto_364569 ) ) ( not ( = ?auto_364557 ?auto_364570 ) ) ( not ( = ?auto_364558 ?auto_364559 ) ) ( not ( = ?auto_364558 ?auto_364560 ) ) ( not ( = ?auto_364558 ?auto_364561 ) ) ( not ( = ?auto_364558 ?auto_364562 ) ) ( not ( = ?auto_364558 ?auto_364563 ) ) ( not ( = ?auto_364558 ?auto_364564 ) ) ( not ( = ?auto_364558 ?auto_364565 ) ) ( not ( = ?auto_364558 ?auto_364566 ) ) ( not ( = ?auto_364558 ?auto_364567 ) ) ( not ( = ?auto_364558 ?auto_364568 ) ) ( not ( = ?auto_364558 ?auto_364569 ) ) ( not ( = ?auto_364558 ?auto_364570 ) ) ( not ( = ?auto_364559 ?auto_364560 ) ) ( not ( = ?auto_364559 ?auto_364561 ) ) ( not ( = ?auto_364559 ?auto_364562 ) ) ( not ( = ?auto_364559 ?auto_364563 ) ) ( not ( = ?auto_364559 ?auto_364564 ) ) ( not ( = ?auto_364559 ?auto_364565 ) ) ( not ( = ?auto_364559 ?auto_364566 ) ) ( not ( = ?auto_364559 ?auto_364567 ) ) ( not ( = ?auto_364559 ?auto_364568 ) ) ( not ( = ?auto_364559 ?auto_364569 ) ) ( not ( = ?auto_364559 ?auto_364570 ) ) ( not ( = ?auto_364560 ?auto_364561 ) ) ( not ( = ?auto_364560 ?auto_364562 ) ) ( not ( = ?auto_364560 ?auto_364563 ) ) ( not ( = ?auto_364560 ?auto_364564 ) ) ( not ( = ?auto_364560 ?auto_364565 ) ) ( not ( = ?auto_364560 ?auto_364566 ) ) ( not ( = ?auto_364560 ?auto_364567 ) ) ( not ( = ?auto_364560 ?auto_364568 ) ) ( not ( = ?auto_364560 ?auto_364569 ) ) ( not ( = ?auto_364560 ?auto_364570 ) ) ( not ( = ?auto_364561 ?auto_364562 ) ) ( not ( = ?auto_364561 ?auto_364563 ) ) ( not ( = ?auto_364561 ?auto_364564 ) ) ( not ( = ?auto_364561 ?auto_364565 ) ) ( not ( = ?auto_364561 ?auto_364566 ) ) ( not ( = ?auto_364561 ?auto_364567 ) ) ( not ( = ?auto_364561 ?auto_364568 ) ) ( not ( = ?auto_364561 ?auto_364569 ) ) ( not ( = ?auto_364561 ?auto_364570 ) ) ( not ( = ?auto_364562 ?auto_364563 ) ) ( not ( = ?auto_364562 ?auto_364564 ) ) ( not ( = ?auto_364562 ?auto_364565 ) ) ( not ( = ?auto_364562 ?auto_364566 ) ) ( not ( = ?auto_364562 ?auto_364567 ) ) ( not ( = ?auto_364562 ?auto_364568 ) ) ( not ( = ?auto_364562 ?auto_364569 ) ) ( not ( = ?auto_364562 ?auto_364570 ) ) ( not ( = ?auto_364563 ?auto_364564 ) ) ( not ( = ?auto_364563 ?auto_364565 ) ) ( not ( = ?auto_364563 ?auto_364566 ) ) ( not ( = ?auto_364563 ?auto_364567 ) ) ( not ( = ?auto_364563 ?auto_364568 ) ) ( not ( = ?auto_364563 ?auto_364569 ) ) ( not ( = ?auto_364563 ?auto_364570 ) ) ( not ( = ?auto_364564 ?auto_364565 ) ) ( not ( = ?auto_364564 ?auto_364566 ) ) ( not ( = ?auto_364564 ?auto_364567 ) ) ( not ( = ?auto_364564 ?auto_364568 ) ) ( not ( = ?auto_364564 ?auto_364569 ) ) ( not ( = ?auto_364564 ?auto_364570 ) ) ( not ( = ?auto_364565 ?auto_364566 ) ) ( not ( = ?auto_364565 ?auto_364567 ) ) ( not ( = ?auto_364565 ?auto_364568 ) ) ( not ( = ?auto_364565 ?auto_364569 ) ) ( not ( = ?auto_364565 ?auto_364570 ) ) ( not ( = ?auto_364566 ?auto_364567 ) ) ( not ( = ?auto_364566 ?auto_364568 ) ) ( not ( = ?auto_364566 ?auto_364569 ) ) ( not ( = ?auto_364566 ?auto_364570 ) ) ( not ( = ?auto_364567 ?auto_364568 ) ) ( not ( = ?auto_364567 ?auto_364569 ) ) ( not ( = ?auto_364567 ?auto_364570 ) ) ( not ( = ?auto_364568 ?auto_364569 ) ) ( not ( = ?auto_364568 ?auto_364570 ) ) ( not ( = ?auto_364569 ?auto_364570 ) ) ( ON ?auto_364568 ?auto_364569 ) ( ON ?auto_364567 ?auto_364568 ) ( ON ?auto_364566 ?auto_364567 ) ( ON ?auto_364565 ?auto_364566 ) ( ON ?auto_364564 ?auto_364565 ) ( ON ?auto_364563 ?auto_364564 ) ( ON ?auto_364562 ?auto_364563 ) ( CLEAR ?auto_364560 ) ( ON ?auto_364561 ?auto_364562 ) ( CLEAR ?auto_364561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_364556 ?auto_364557 ?auto_364558 ?auto_364559 ?auto_364560 ?auto_364561 )
      ( MAKE-14PILE ?auto_364556 ?auto_364557 ?auto_364558 ?auto_364559 ?auto_364560 ?auto_364561 ?auto_364562 ?auto_364563 ?auto_364564 ?auto_364565 ?auto_364566 ?auto_364567 ?auto_364568 ?auto_364569 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_364614 - BLOCK
      ?auto_364615 - BLOCK
      ?auto_364616 - BLOCK
      ?auto_364617 - BLOCK
      ?auto_364618 - BLOCK
      ?auto_364619 - BLOCK
      ?auto_364620 - BLOCK
      ?auto_364621 - BLOCK
      ?auto_364622 - BLOCK
      ?auto_364623 - BLOCK
      ?auto_364624 - BLOCK
      ?auto_364625 - BLOCK
      ?auto_364626 - BLOCK
      ?auto_364627 - BLOCK
    )
    :vars
    (
      ?auto_364628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_364627 ?auto_364628 ) ( ON-TABLE ?auto_364614 ) ( ON ?auto_364615 ?auto_364614 ) ( ON ?auto_364616 ?auto_364615 ) ( ON ?auto_364617 ?auto_364616 ) ( not ( = ?auto_364614 ?auto_364615 ) ) ( not ( = ?auto_364614 ?auto_364616 ) ) ( not ( = ?auto_364614 ?auto_364617 ) ) ( not ( = ?auto_364614 ?auto_364618 ) ) ( not ( = ?auto_364614 ?auto_364619 ) ) ( not ( = ?auto_364614 ?auto_364620 ) ) ( not ( = ?auto_364614 ?auto_364621 ) ) ( not ( = ?auto_364614 ?auto_364622 ) ) ( not ( = ?auto_364614 ?auto_364623 ) ) ( not ( = ?auto_364614 ?auto_364624 ) ) ( not ( = ?auto_364614 ?auto_364625 ) ) ( not ( = ?auto_364614 ?auto_364626 ) ) ( not ( = ?auto_364614 ?auto_364627 ) ) ( not ( = ?auto_364614 ?auto_364628 ) ) ( not ( = ?auto_364615 ?auto_364616 ) ) ( not ( = ?auto_364615 ?auto_364617 ) ) ( not ( = ?auto_364615 ?auto_364618 ) ) ( not ( = ?auto_364615 ?auto_364619 ) ) ( not ( = ?auto_364615 ?auto_364620 ) ) ( not ( = ?auto_364615 ?auto_364621 ) ) ( not ( = ?auto_364615 ?auto_364622 ) ) ( not ( = ?auto_364615 ?auto_364623 ) ) ( not ( = ?auto_364615 ?auto_364624 ) ) ( not ( = ?auto_364615 ?auto_364625 ) ) ( not ( = ?auto_364615 ?auto_364626 ) ) ( not ( = ?auto_364615 ?auto_364627 ) ) ( not ( = ?auto_364615 ?auto_364628 ) ) ( not ( = ?auto_364616 ?auto_364617 ) ) ( not ( = ?auto_364616 ?auto_364618 ) ) ( not ( = ?auto_364616 ?auto_364619 ) ) ( not ( = ?auto_364616 ?auto_364620 ) ) ( not ( = ?auto_364616 ?auto_364621 ) ) ( not ( = ?auto_364616 ?auto_364622 ) ) ( not ( = ?auto_364616 ?auto_364623 ) ) ( not ( = ?auto_364616 ?auto_364624 ) ) ( not ( = ?auto_364616 ?auto_364625 ) ) ( not ( = ?auto_364616 ?auto_364626 ) ) ( not ( = ?auto_364616 ?auto_364627 ) ) ( not ( = ?auto_364616 ?auto_364628 ) ) ( not ( = ?auto_364617 ?auto_364618 ) ) ( not ( = ?auto_364617 ?auto_364619 ) ) ( not ( = ?auto_364617 ?auto_364620 ) ) ( not ( = ?auto_364617 ?auto_364621 ) ) ( not ( = ?auto_364617 ?auto_364622 ) ) ( not ( = ?auto_364617 ?auto_364623 ) ) ( not ( = ?auto_364617 ?auto_364624 ) ) ( not ( = ?auto_364617 ?auto_364625 ) ) ( not ( = ?auto_364617 ?auto_364626 ) ) ( not ( = ?auto_364617 ?auto_364627 ) ) ( not ( = ?auto_364617 ?auto_364628 ) ) ( not ( = ?auto_364618 ?auto_364619 ) ) ( not ( = ?auto_364618 ?auto_364620 ) ) ( not ( = ?auto_364618 ?auto_364621 ) ) ( not ( = ?auto_364618 ?auto_364622 ) ) ( not ( = ?auto_364618 ?auto_364623 ) ) ( not ( = ?auto_364618 ?auto_364624 ) ) ( not ( = ?auto_364618 ?auto_364625 ) ) ( not ( = ?auto_364618 ?auto_364626 ) ) ( not ( = ?auto_364618 ?auto_364627 ) ) ( not ( = ?auto_364618 ?auto_364628 ) ) ( not ( = ?auto_364619 ?auto_364620 ) ) ( not ( = ?auto_364619 ?auto_364621 ) ) ( not ( = ?auto_364619 ?auto_364622 ) ) ( not ( = ?auto_364619 ?auto_364623 ) ) ( not ( = ?auto_364619 ?auto_364624 ) ) ( not ( = ?auto_364619 ?auto_364625 ) ) ( not ( = ?auto_364619 ?auto_364626 ) ) ( not ( = ?auto_364619 ?auto_364627 ) ) ( not ( = ?auto_364619 ?auto_364628 ) ) ( not ( = ?auto_364620 ?auto_364621 ) ) ( not ( = ?auto_364620 ?auto_364622 ) ) ( not ( = ?auto_364620 ?auto_364623 ) ) ( not ( = ?auto_364620 ?auto_364624 ) ) ( not ( = ?auto_364620 ?auto_364625 ) ) ( not ( = ?auto_364620 ?auto_364626 ) ) ( not ( = ?auto_364620 ?auto_364627 ) ) ( not ( = ?auto_364620 ?auto_364628 ) ) ( not ( = ?auto_364621 ?auto_364622 ) ) ( not ( = ?auto_364621 ?auto_364623 ) ) ( not ( = ?auto_364621 ?auto_364624 ) ) ( not ( = ?auto_364621 ?auto_364625 ) ) ( not ( = ?auto_364621 ?auto_364626 ) ) ( not ( = ?auto_364621 ?auto_364627 ) ) ( not ( = ?auto_364621 ?auto_364628 ) ) ( not ( = ?auto_364622 ?auto_364623 ) ) ( not ( = ?auto_364622 ?auto_364624 ) ) ( not ( = ?auto_364622 ?auto_364625 ) ) ( not ( = ?auto_364622 ?auto_364626 ) ) ( not ( = ?auto_364622 ?auto_364627 ) ) ( not ( = ?auto_364622 ?auto_364628 ) ) ( not ( = ?auto_364623 ?auto_364624 ) ) ( not ( = ?auto_364623 ?auto_364625 ) ) ( not ( = ?auto_364623 ?auto_364626 ) ) ( not ( = ?auto_364623 ?auto_364627 ) ) ( not ( = ?auto_364623 ?auto_364628 ) ) ( not ( = ?auto_364624 ?auto_364625 ) ) ( not ( = ?auto_364624 ?auto_364626 ) ) ( not ( = ?auto_364624 ?auto_364627 ) ) ( not ( = ?auto_364624 ?auto_364628 ) ) ( not ( = ?auto_364625 ?auto_364626 ) ) ( not ( = ?auto_364625 ?auto_364627 ) ) ( not ( = ?auto_364625 ?auto_364628 ) ) ( not ( = ?auto_364626 ?auto_364627 ) ) ( not ( = ?auto_364626 ?auto_364628 ) ) ( not ( = ?auto_364627 ?auto_364628 ) ) ( ON ?auto_364626 ?auto_364627 ) ( ON ?auto_364625 ?auto_364626 ) ( ON ?auto_364624 ?auto_364625 ) ( ON ?auto_364623 ?auto_364624 ) ( ON ?auto_364622 ?auto_364623 ) ( ON ?auto_364621 ?auto_364622 ) ( ON ?auto_364620 ?auto_364621 ) ( ON ?auto_364619 ?auto_364620 ) ( CLEAR ?auto_364617 ) ( ON ?auto_364618 ?auto_364619 ) ( CLEAR ?auto_364618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_364614 ?auto_364615 ?auto_364616 ?auto_364617 ?auto_364618 )
      ( MAKE-14PILE ?auto_364614 ?auto_364615 ?auto_364616 ?auto_364617 ?auto_364618 ?auto_364619 ?auto_364620 ?auto_364621 ?auto_364622 ?auto_364623 ?auto_364624 ?auto_364625 ?auto_364626 ?auto_364627 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_364672 - BLOCK
      ?auto_364673 - BLOCK
      ?auto_364674 - BLOCK
      ?auto_364675 - BLOCK
      ?auto_364676 - BLOCK
      ?auto_364677 - BLOCK
      ?auto_364678 - BLOCK
      ?auto_364679 - BLOCK
      ?auto_364680 - BLOCK
      ?auto_364681 - BLOCK
      ?auto_364682 - BLOCK
      ?auto_364683 - BLOCK
      ?auto_364684 - BLOCK
      ?auto_364685 - BLOCK
    )
    :vars
    (
      ?auto_364686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_364685 ?auto_364686 ) ( ON-TABLE ?auto_364672 ) ( ON ?auto_364673 ?auto_364672 ) ( ON ?auto_364674 ?auto_364673 ) ( not ( = ?auto_364672 ?auto_364673 ) ) ( not ( = ?auto_364672 ?auto_364674 ) ) ( not ( = ?auto_364672 ?auto_364675 ) ) ( not ( = ?auto_364672 ?auto_364676 ) ) ( not ( = ?auto_364672 ?auto_364677 ) ) ( not ( = ?auto_364672 ?auto_364678 ) ) ( not ( = ?auto_364672 ?auto_364679 ) ) ( not ( = ?auto_364672 ?auto_364680 ) ) ( not ( = ?auto_364672 ?auto_364681 ) ) ( not ( = ?auto_364672 ?auto_364682 ) ) ( not ( = ?auto_364672 ?auto_364683 ) ) ( not ( = ?auto_364672 ?auto_364684 ) ) ( not ( = ?auto_364672 ?auto_364685 ) ) ( not ( = ?auto_364672 ?auto_364686 ) ) ( not ( = ?auto_364673 ?auto_364674 ) ) ( not ( = ?auto_364673 ?auto_364675 ) ) ( not ( = ?auto_364673 ?auto_364676 ) ) ( not ( = ?auto_364673 ?auto_364677 ) ) ( not ( = ?auto_364673 ?auto_364678 ) ) ( not ( = ?auto_364673 ?auto_364679 ) ) ( not ( = ?auto_364673 ?auto_364680 ) ) ( not ( = ?auto_364673 ?auto_364681 ) ) ( not ( = ?auto_364673 ?auto_364682 ) ) ( not ( = ?auto_364673 ?auto_364683 ) ) ( not ( = ?auto_364673 ?auto_364684 ) ) ( not ( = ?auto_364673 ?auto_364685 ) ) ( not ( = ?auto_364673 ?auto_364686 ) ) ( not ( = ?auto_364674 ?auto_364675 ) ) ( not ( = ?auto_364674 ?auto_364676 ) ) ( not ( = ?auto_364674 ?auto_364677 ) ) ( not ( = ?auto_364674 ?auto_364678 ) ) ( not ( = ?auto_364674 ?auto_364679 ) ) ( not ( = ?auto_364674 ?auto_364680 ) ) ( not ( = ?auto_364674 ?auto_364681 ) ) ( not ( = ?auto_364674 ?auto_364682 ) ) ( not ( = ?auto_364674 ?auto_364683 ) ) ( not ( = ?auto_364674 ?auto_364684 ) ) ( not ( = ?auto_364674 ?auto_364685 ) ) ( not ( = ?auto_364674 ?auto_364686 ) ) ( not ( = ?auto_364675 ?auto_364676 ) ) ( not ( = ?auto_364675 ?auto_364677 ) ) ( not ( = ?auto_364675 ?auto_364678 ) ) ( not ( = ?auto_364675 ?auto_364679 ) ) ( not ( = ?auto_364675 ?auto_364680 ) ) ( not ( = ?auto_364675 ?auto_364681 ) ) ( not ( = ?auto_364675 ?auto_364682 ) ) ( not ( = ?auto_364675 ?auto_364683 ) ) ( not ( = ?auto_364675 ?auto_364684 ) ) ( not ( = ?auto_364675 ?auto_364685 ) ) ( not ( = ?auto_364675 ?auto_364686 ) ) ( not ( = ?auto_364676 ?auto_364677 ) ) ( not ( = ?auto_364676 ?auto_364678 ) ) ( not ( = ?auto_364676 ?auto_364679 ) ) ( not ( = ?auto_364676 ?auto_364680 ) ) ( not ( = ?auto_364676 ?auto_364681 ) ) ( not ( = ?auto_364676 ?auto_364682 ) ) ( not ( = ?auto_364676 ?auto_364683 ) ) ( not ( = ?auto_364676 ?auto_364684 ) ) ( not ( = ?auto_364676 ?auto_364685 ) ) ( not ( = ?auto_364676 ?auto_364686 ) ) ( not ( = ?auto_364677 ?auto_364678 ) ) ( not ( = ?auto_364677 ?auto_364679 ) ) ( not ( = ?auto_364677 ?auto_364680 ) ) ( not ( = ?auto_364677 ?auto_364681 ) ) ( not ( = ?auto_364677 ?auto_364682 ) ) ( not ( = ?auto_364677 ?auto_364683 ) ) ( not ( = ?auto_364677 ?auto_364684 ) ) ( not ( = ?auto_364677 ?auto_364685 ) ) ( not ( = ?auto_364677 ?auto_364686 ) ) ( not ( = ?auto_364678 ?auto_364679 ) ) ( not ( = ?auto_364678 ?auto_364680 ) ) ( not ( = ?auto_364678 ?auto_364681 ) ) ( not ( = ?auto_364678 ?auto_364682 ) ) ( not ( = ?auto_364678 ?auto_364683 ) ) ( not ( = ?auto_364678 ?auto_364684 ) ) ( not ( = ?auto_364678 ?auto_364685 ) ) ( not ( = ?auto_364678 ?auto_364686 ) ) ( not ( = ?auto_364679 ?auto_364680 ) ) ( not ( = ?auto_364679 ?auto_364681 ) ) ( not ( = ?auto_364679 ?auto_364682 ) ) ( not ( = ?auto_364679 ?auto_364683 ) ) ( not ( = ?auto_364679 ?auto_364684 ) ) ( not ( = ?auto_364679 ?auto_364685 ) ) ( not ( = ?auto_364679 ?auto_364686 ) ) ( not ( = ?auto_364680 ?auto_364681 ) ) ( not ( = ?auto_364680 ?auto_364682 ) ) ( not ( = ?auto_364680 ?auto_364683 ) ) ( not ( = ?auto_364680 ?auto_364684 ) ) ( not ( = ?auto_364680 ?auto_364685 ) ) ( not ( = ?auto_364680 ?auto_364686 ) ) ( not ( = ?auto_364681 ?auto_364682 ) ) ( not ( = ?auto_364681 ?auto_364683 ) ) ( not ( = ?auto_364681 ?auto_364684 ) ) ( not ( = ?auto_364681 ?auto_364685 ) ) ( not ( = ?auto_364681 ?auto_364686 ) ) ( not ( = ?auto_364682 ?auto_364683 ) ) ( not ( = ?auto_364682 ?auto_364684 ) ) ( not ( = ?auto_364682 ?auto_364685 ) ) ( not ( = ?auto_364682 ?auto_364686 ) ) ( not ( = ?auto_364683 ?auto_364684 ) ) ( not ( = ?auto_364683 ?auto_364685 ) ) ( not ( = ?auto_364683 ?auto_364686 ) ) ( not ( = ?auto_364684 ?auto_364685 ) ) ( not ( = ?auto_364684 ?auto_364686 ) ) ( not ( = ?auto_364685 ?auto_364686 ) ) ( ON ?auto_364684 ?auto_364685 ) ( ON ?auto_364683 ?auto_364684 ) ( ON ?auto_364682 ?auto_364683 ) ( ON ?auto_364681 ?auto_364682 ) ( ON ?auto_364680 ?auto_364681 ) ( ON ?auto_364679 ?auto_364680 ) ( ON ?auto_364678 ?auto_364679 ) ( ON ?auto_364677 ?auto_364678 ) ( ON ?auto_364676 ?auto_364677 ) ( CLEAR ?auto_364674 ) ( ON ?auto_364675 ?auto_364676 ) ( CLEAR ?auto_364675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_364672 ?auto_364673 ?auto_364674 ?auto_364675 )
      ( MAKE-14PILE ?auto_364672 ?auto_364673 ?auto_364674 ?auto_364675 ?auto_364676 ?auto_364677 ?auto_364678 ?auto_364679 ?auto_364680 ?auto_364681 ?auto_364682 ?auto_364683 ?auto_364684 ?auto_364685 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_364730 - BLOCK
      ?auto_364731 - BLOCK
      ?auto_364732 - BLOCK
      ?auto_364733 - BLOCK
      ?auto_364734 - BLOCK
      ?auto_364735 - BLOCK
      ?auto_364736 - BLOCK
      ?auto_364737 - BLOCK
      ?auto_364738 - BLOCK
      ?auto_364739 - BLOCK
      ?auto_364740 - BLOCK
      ?auto_364741 - BLOCK
      ?auto_364742 - BLOCK
      ?auto_364743 - BLOCK
    )
    :vars
    (
      ?auto_364744 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_364743 ?auto_364744 ) ( ON-TABLE ?auto_364730 ) ( ON ?auto_364731 ?auto_364730 ) ( not ( = ?auto_364730 ?auto_364731 ) ) ( not ( = ?auto_364730 ?auto_364732 ) ) ( not ( = ?auto_364730 ?auto_364733 ) ) ( not ( = ?auto_364730 ?auto_364734 ) ) ( not ( = ?auto_364730 ?auto_364735 ) ) ( not ( = ?auto_364730 ?auto_364736 ) ) ( not ( = ?auto_364730 ?auto_364737 ) ) ( not ( = ?auto_364730 ?auto_364738 ) ) ( not ( = ?auto_364730 ?auto_364739 ) ) ( not ( = ?auto_364730 ?auto_364740 ) ) ( not ( = ?auto_364730 ?auto_364741 ) ) ( not ( = ?auto_364730 ?auto_364742 ) ) ( not ( = ?auto_364730 ?auto_364743 ) ) ( not ( = ?auto_364730 ?auto_364744 ) ) ( not ( = ?auto_364731 ?auto_364732 ) ) ( not ( = ?auto_364731 ?auto_364733 ) ) ( not ( = ?auto_364731 ?auto_364734 ) ) ( not ( = ?auto_364731 ?auto_364735 ) ) ( not ( = ?auto_364731 ?auto_364736 ) ) ( not ( = ?auto_364731 ?auto_364737 ) ) ( not ( = ?auto_364731 ?auto_364738 ) ) ( not ( = ?auto_364731 ?auto_364739 ) ) ( not ( = ?auto_364731 ?auto_364740 ) ) ( not ( = ?auto_364731 ?auto_364741 ) ) ( not ( = ?auto_364731 ?auto_364742 ) ) ( not ( = ?auto_364731 ?auto_364743 ) ) ( not ( = ?auto_364731 ?auto_364744 ) ) ( not ( = ?auto_364732 ?auto_364733 ) ) ( not ( = ?auto_364732 ?auto_364734 ) ) ( not ( = ?auto_364732 ?auto_364735 ) ) ( not ( = ?auto_364732 ?auto_364736 ) ) ( not ( = ?auto_364732 ?auto_364737 ) ) ( not ( = ?auto_364732 ?auto_364738 ) ) ( not ( = ?auto_364732 ?auto_364739 ) ) ( not ( = ?auto_364732 ?auto_364740 ) ) ( not ( = ?auto_364732 ?auto_364741 ) ) ( not ( = ?auto_364732 ?auto_364742 ) ) ( not ( = ?auto_364732 ?auto_364743 ) ) ( not ( = ?auto_364732 ?auto_364744 ) ) ( not ( = ?auto_364733 ?auto_364734 ) ) ( not ( = ?auto_364733 ?auto_364735 ) ) ( not ( = ?auto_364733 ?auto_364736 ) ) ( not ( = ?auto_364733 ?auto_364737 ) ) ( not ( = ?auto_364733 ?auto_364738 ) ) ( not ( = ?auto_364733 ?auto_364739 ) ) ( not ( = ?auto_364733 ?auto_364740 ) ) ( not ( = ?auto_364733 ?auto_364741 ) ) ( not ( = ?auto_364733 ?auto_364742 ) ) ( not ( = ?auto_364733 ?auto_364743 ) ) ( not ( = ?auto_364733 ?auto_364744 ) ) ( not ( = ?auto_364734 ?auto_364735 ) ) ( not ( = ?auto_364734 ?auto_364736 ) ) ( not ( = ?auto_364734 ?auto_364737 ) ) ( not ( = ?auto_364734 ?auto_364738 ) ) ( not ( = ?auto_364734 ?auto_364739 ) ) ( not ( = ?auto_364734 ?auto_364740 ) ) ( not ( = ?auto_364734 ?auto_364741 ) ) ( not ( = ?auto_364734 ?auto_364742 ) ) ( not ( = ?auto_364734 ?auto_364743 ) ) ( not ( = ?auto_364734 ?auto_364744 ) ) ( not ( = ?auto_364735 ?auto_364736 ) ) ( not ( = ?auto_364735 ?auto_364737 ) ) ( not ( = ?auto_364735 ?auto_364738 ) ) ( not ( = ?auto_364735 ?auto_364739 ) ) ( not ( = ?auto_364735 ?auto_364740 ) ) ( not ( = ?auto_364735 ?auto_364741 ) ) ( not ( = ?auto_364735 ?auto_364742 ) ) ( not ( = ?auto_364735 ?auto_364743 ) ) ( not ( = ?auto_364735 ?auto_364744 ) ) ( not ( = ?auto_364736 ?auto_364737 ) ) ( not ( = ?auto_364736 ?auto_364738 ) ) ( not ( = ?auto_364736 ?auto_364739 ) ) ( not ( = ?auto_364736 ?auto_364740 ) ) ( not ( = ?auto_364736 ?auto_364741 ) ) ( not ( = ?auto_364736 ?auto_364742 ) ) ( not ( = ?auto_364736 ?auto_364743 ) ) ( not ( = ?auto_364736 ?auto_364744 ) ) ( not ( = ?auto_364737 ?auto_364738 ) ) ( not ( = ?auto_364737 ?auto_364739 ) ) ( not ( = ?auto_364737 ?auto_364740 ) ) ( not ( = ?auto_364737 ?auto_364741 ) ) ( not ( = ?auto_364737 ?auto_364742 ) ) ( not ( = ?auto_364737 ?auto_364743 ) ) ( not ( = ?auto_364737 ?auto_364744 ) ) ( not ( = ?auto_364738 ?auto_364739 ) ) ( not ( = ?auto_364738 ?auto_364740 ) ) ( not ( = ?auto_364738 ?auto_364741 ) ) ( not ( = ?auto_364738 ?auto_364742 ) ) ( not ( = ?auto_364738 ?auto_364743 ) ) ( not ( = ?auto_364738 ?auto_364744 ) ) ( not ( = ?auto_364739 ?auto_364740 ) ) ( not ( = ?auto_364739 ?auto_364741 ) ) ( not ( = ?auto_364739 ?auto_364742 ) ) ( not ( = ?auto_364739 ?auto_364743 ) ) ( not ( = ?auto_364739 ?auto_364744 ) ) ( not ( = ?auto_364740 ?auto_364741 ) ) ( not ( = ?auto_364740 ?auto_364742 ) ) ( not ( = ?auto_364740 ?auto_364743 ) ) ( not ( = ?auto_364740 ?auto_364744 ) ) ( not ( = ?auto_364741 ?auto_364742 ) ) ( not ( = ?auto_364741 ?auto_364743 ) ) ( not ( = ?auto_364741 ?auto_364744 ) ) ( not ( = ?auto_364742 ?auto_364743 ) ) ( not ( = ?auto_364742 ?auto_364744 ) ) ( not ( = ?auto_364743 ?auto_364744 ) ) ( ON ?auto_364742 ?auto_364743 ) ( ON ?auto_364741 ?auto_364742 ) ( ON ?auto_364740 ?auto_364741 ) ( ON ?auto_364739 ?auto_364740 ) ( ON ?auto_364738 ?auto_364739 ) ( ON ?auto_364737 ?auto_364738 ) ( ON ?auto_364736 ?auto_364737 ) ( ON ?auto_364735 ?auto_364736 ) ( ON ?auto_364734 ?auto_364735 ) ( ON ?auto_364733 ?auto_364734 ) ( CLEAR ?auto_364731 ) ( ON ?auto_364732 ?auto_364733 ) ( CLEAR ?auto_364732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_364730 ?auto_364731 ?auto_364732 )
      ( MAKE-14PILE ?auto_364730 ?auto_364731 ?auto_364732 ?auto_364733 ?auto_364734 ?auto_364735 ?auto_364736 ?auto_364737 ?auto_364738 ?auto_364739 ?auto_364740 ?auto_364741 ?auto_364742 ?auto_364743 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_364788 - BLOCK
      ?auto_364789 - BLOCK
      ?auto_364790 - BLOCK
      ?auto_364791 - BLOCK
      ?auto_364792 - BLOCK
      ?auto_364793 - BLOCK
      ?auto_364794 - BLOCK
      ?auto_364795 - BLOCK
      ?auto_364796 - BLOCK
      ?auto_364797 - BLOCK
      ?auto_364798 - BLOCK
      ?auto_364799 - BLOCK
      ?auto_364800 - BLOCK
      ?auto_364801 - BLOCK
    )
    :vars
    (
      ?auto_364802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_364801 ?auto_364802 ) ( ON-TABLE ?auto_364788 ) ( not ( = ?auto_364788 ?auto_364789 ) ) ( not ( = ?auto_364788 ?auto_364790 ) ) ( not ( = ?auto_364788 ?auto_364791 ) ) ( not ( = ?auto_364788 ?auto_364792 ) ) ( not ( = ?auto_364788 ?auto_364793 ) ) ( not ( = ?auto_364788 ?auto_364794 ) ) ( not ( = ?auto_364788 ?auto_364795 ) ) ( not ( = ?auto_364788 ?auto_364796 ) ) ( not ( = ?auto_364788 ?auto_364797 ) ) ( not ( = ?auto_364788 ?auto_364798 ) ) ( not ( = ?auto_364788 ?auto_364799 ) ) ( not ( = ?auto_364788 ?auto_364800 ) ) ( not ( = ?auto_364788 ?auto_364801 ) ) ( not ( = ?auto_364788 ?auto_364802 ) ) ( not ( = ?auto_364789 ?auto_364790 ) ) ( not ( = ?auto_364789 ?auto_364791 ) ) ( not ( = ?auto_364789 ?auto_364792 ) ) ( not ( = ?auto_364789 ?auto_364793 ) ) ( not ( = ?auto_364789 ?auto_364794 ) ) ( not ( = ?auto_364789 ?auto_364795 ) ) ( not ( = ?auto_364789 ?auto_364796 ) ) ( not ( = ?auto_364789 ?auto_364797 ) ) ( not ( = ?auto_364789 ?auto_364798 ) ) ( not ( = ?auto_364789 ?auto_364799 ) ) ( not ( = ?auto_364789 ?auto_364800 ) ) ( not ( = ?auto_364789 ?auto_364801 ) ) ( not ( = ?auto_364789 ?auto_364802 ) ) ( not ( = ?auto_364790 ?auto_364791 ) ) ( not ( = ?auto_364790 ?auto_364792 ) ) ( not ( = ?auto_364790 ?auto_364793 ) ) ( not ( = ?auto_364790 ?auto_364794 ) ) ( not ( = ?auto_364790 ?auto_364795 ) ) ( not ( = ?auto_364790 ?auto_364796 ) ) ( not ( = ?auto_364790 ?auto_364797 ) ) ( not ( = ?auto_364790 ?auto_364798 ) ) ( not ( = ?auto_364790 ?auto_364799 ) ) ( not ( = ?auto_364790 ?auto_364800 ) ) ( not ( = ?auto_364790 ?auto_364801 ) ) ( not ( = ?auto_364790 ?auto_364802 ) ) ( not ( = ?auto_364791 ?auto_364792 ) ) ( not ( = ?auto_364791 ?auto_364793 ) ) ( not ( = ?auto_364791 ?auto_364794 ) ) ( not ( = ?auto_364791 ?auto_364795 ) ) ( not ( = ?auto_364791 ?auto_364796 ) ) ( not ( = ?auto_364791 ?auto_364797 ) ) ( not ( = ?auto_364791 ?auto_364798 ) ) ( not ( = ?auto_364791 ?auto_364799 ) ) ( not ( = ?auto_364791 ?auto_364800 ) ) ( not ( = ?auto_364791 ?auto_364801 ) ) ( not ( = ?auto_364791 ?auto_364802 ) ) ( not ( = ?auto_364792 ?auto_364793 ) ) ( not ( = ?auto_364792 ?auto_364794 ) ) ( not ( = ?auto_364792 ?auto_364795 ) ) ( not ( = ?auto_364792 ?auto_364796 ) ) ( not ( = ?auto_364792 ?auto_364797 ) ) ( not ( = ?auto_364792 ?auto_364798 ) ) ( not ( = ?auto_364792 ?auto_364799 ) ) ( not ( = ?auto_364792 ?auto_364800 ) ) ( not ( = ?auto_364792 ?auto_364801 ) ) ( not ( = ?auto_364792 ?auto_364802 ) ) ( not ( = ?auto_364793 ?auto_364794 ) ) ( not ( = ?auto_364793 ?auto_364795 ) ) ( not ( = ?auto_364793 ?auto_364796 ) ) ( not ( = ?auto_364793 ?auto_364797 ) ) ( not ( = ?auto_364793 ?auto_364798 ) ) ( not ( = ?auto_364793 ?auto_364799 ) ) ( not ( = ?auto_364793 ?auto_364800 ) ) ( not ( = ?auto_364793 ?auto_364801 ) ) ( not ( = ?auto_364793 ?auto_364802 ) ) ( not ( = ?auto_364794 ?auto_364795 ) ) ( not ( = ?auto_364794 ?auto_364796 ) ) ( not ( = ?auto_364794 ?auto_364797 ) ) ( not ( = ?auto_364794 ?auto_364798 ) ) ( not ( = ?auto_364794 ?auto_364799 ) ) ( not ( = ?auto_364794 ?auto_364800 ) ) ( not ( = ?auto_364794 ?auto_364801 ) ) ( not ( = ?auto_364794 ?auto_364802 ) ) ( not ( = ?auto_364795 ?auto_364796 ) ) ( not ( = ?auto_364795 ?auto_364797 ) ) ( not ( = ?auto_364795 ?auto_364798 ) ) ( not ( = ?auto_364795 ?auto_364799 ) ) ( not ( = ?auto_364795 ?auto_364800 ) ) ( not ( = ?auto_364795 ?auto_364801 ) ) ( not ( = ?auto_364795 ?auto_364802 ) ) ( not ( = ?auto_364796 ?auto_364797 ) ) ( not ( = ?auto_364796 ?auto_364798 ) ) ( not ( = ?auto_364796 ?auto_364799 ) ) ( not ( = ?auto_364796 ?auto_364800 ) ) ( not ( = ?auto_364796 ?auto_364801 ) ) ( not ( = ?auto_364796 ?auto_364802 ) ) ( not ( = ?auto_364797 ?auto_364798 ) ) ( not ( = ?auto_364797 ?auto_364799 ) ) ( not ( = ?auto_364797 ?auto_364800 ) ) ( not ( = ?auto_364797 ?auto_364801 ) ) ( not ( = ?auto_364797 ?auto_364802 ) ) ( not ( = ?auto_364798 ?auto_364799 ) ) ( not ( = ?auto_364798 ?auto_364800 ) ) ( not ( = ?auto_364798 ?auto_364801 ) ) ( not ( = ?auto_364798 ?auto_364802 ) ) ( not ( = ?auto_364799 ?auto_364800 ) ) ( not ( = ?auto_364799 ?auto_364801 ) ) ( not ( = ?auto_364799 ?auto_364802 ) ) ( not ( = ?auto_364800 ?auto_364801 ) ) ( not ( = ?auto_364800 ?auto_364802 ) ) ( not ( = ?auto_364801 ?auto_364802 ) ) ( ON ?auto_364800 ?auto_364801 ) ( ON ?auto_364799 ?auto_364800 ) ( ON ?auto_364798 ?auto_364799 ) ( ON ?auto_364797 ?auto_364798 ) ( ON ?auto_364796 ?auto_364797 ) ( ON ?auto_364795 ?auto_364796 ) ( ON ?auto_364794 ?auto_364795 ) ( ON ?auto_364793 ?auto_364794 ) ( ON ?auto_364792 ?auto_364793 ) ( ON ?auto_364791 ?auto_364792 ) ( ON ?auto_364790 ?auto_364791 ) ( CLEAR ?auto_364788 ) ( ON ?auto_364789 ?auto_364790 ) ( CLEAR ?auto_364789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_364788 ?auto_364789 )
      ( MAKE-14PILE ?auto_364788 ?auto_364789 ?auto_364790 ?auto_364791 ?auto_364792 ?auto_364793 ?auto_364794 ?auto_364795 ?auto_364796 ?auto_364797 ?auto_364798 ?auto_364799 ?auto_364800 ?auto_364801 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_364846 - BLOCK
      ?auto_364847 - BLOCK
      ?auto_364848 - BLOCK
      ?auto_364849 - BLOCK
      ?auto_364850 - BLOCK
      ?auto_364851 - BLOCK
      ?auto_364852 - BLOCK
      ?auto_364853 - BLOCK
      ?auto_364854 - BLOCK
      ?auto_364855 - BLOCK
      ?auto_364856 - BLOCK
      ?auto_364857 - BLOCK
      ?auto_364858 - BLOCK
      ?auto_364859 - BLOCK
    )
    :vars
    (
      ?auto_364860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_364859 ?auto_364860 ) ( not ( = ?auto_364846 ?auto_364847 ) ) ( not ( = ?auto_364846 ?auto_364848 ) ) ( not ( = ?auto_364846 ?auto_364849 ) ) ( not ( = ?auto_364846 ?auto_364850 ) ) ( not ( = ?auto_364846 ?auto_364851 ) ) ( not ( = ?auto_364846 ?auto_364852 ) ) ( not ( = ?auto_364846 ?auto_364853 ) ) ( not ( = ?auto_364846 ?auto_364854 ) ) ( not ( = ?auto_364846 ?auto_364855 ) ) ( not ( = ?auto_364846 ?auto_364856 ) ) ( not ( = ?auto_364846 ?auto_364857 ) ) ( not ( = ?auto_364846 ?auto_364858 ) ) ( not ( = ?auto_364846 ?auto_364859 ) ) ( not ( = ?auto_364846 ?auto_364860 ) ) ( not ( = ?auto_364847 ?auto_364848 ) ) ( not ( = ?auto_364847 ?auto_364849 ) ) ( not ( = ?auto_364847 ?auto_364850 ) ) ( not ( = ?auto_364847 ?auto_364851 ) ) ( not ( = ?auto_364847 ?auto_364852 ) ) ( not ( = ?auto_364847 ?auto_364853 ) ) ( not ( = ?auto_364847 ?auto_364854 ) ) ( not ( = ?auto_364847 ?auto_364855 ) ) ( not ( = ?auto_364847 ?auto_364856 ) ) ( not ( = ?auto_364847 ?auto_364857 ) ) ( not ( = ?auto_364847 ?auto_364858 ) ) ( not ( = ?auto_364847 ?auto_364859 ) ) ( not ( = ?auto_364847 ?auto_364860 ) ) ( not ( = ?auto_364848 ?auto_364849 ) ) ( not ( = ?auto_364848 ?auto_364850 ) ) ( not ( = ?auto_364848 ?auto_364851 ) ) ( not ( = ?auto_364848 ?auto_364852 ) ) ( not ( = ?auto_364848 ?auto_364853 ) ) ( not ( = ?auto_364848 ?auto_364854 ) ) ( not ( = ?auto_364848 ?auto_364855 ) ) ( not ( = ?auto_364848 ?auto_364856 ) ) ( not ( = ?auto_364848 ?auto_364857 ) ) ( not ( = ?auto_364848 ?auto_364858 ) ) ( not ( = ?auto_364848 ?auto_364859 ) ) ( not ( = ?auto_364848 ?auto_364860 ) ) ( not ( = ?auto_364849 ?auto_364850 ) ) ( not ( = ?auto_364849 ?auto_364851 ) ) ( not ( = ?auto_364849 ?auto_364852 ) ) ( not ( = ?auto_364849 ?auto_364853 ) ) ( not ( = ?auto_364849 ?auto_364854 ) ) ( not ( = ?auto_364849 ?auto_364855 ) ) ( not ( = ?auto_364849 ?auto_364856 ) ) ( not ( = ?auto_364849 ?auto_364857 ) ) ( not ( = ?auto_364849 ?auto_364858 ) ) ( not ( = ?auto_364849 ?auto_364859 ) ) ( not ( = ?auto_364849 ?auto_364860 ) ) ( not ( = ?auto_364850 ?auto_364851 ) ) ( not ( = ?auto_364850 ?auto_364852 ) ) ( not ( = ?auto_364850 ?auto_364853 ) ) ( not ( = ?auto_364850 ?auto_364854 ) ) ( not ( = ?auto_364850 ?auto_364855 ) ) ( not ( = ?auto_364850 ?auto_364856 ) ) ( not ( = ?auto_364850 ?auto_364857 ) ) ( not ( = ?auto_364850 ?auto_364858 ) ) ( not ( = ?auto_364850 ?auto_364859 ) ) ( not ( = ?auto_364850 ?auto_364860 ) ) ( not ( = ?auto_364851 ?auto_364852 ) ) ( not ( = ?auto_364851 ?auto_364853 ) ) ( not ( = ?auto_364851 ?auto_364854 ) ) ( not ( = ?auto_364851 ?auto_364855 ) ) ( not ( = ?auto_364851 ?auto_364856 ) ) ( not ( = ?auto_364851 ?auto_364857 ) ) ( not ( = ?auto_364851 ?auto_364858 ) ) ( not ( = ?auto_364851 ?auto_364859 ) ) ( not ( = ?auto_364851 ?auto_364860 ) ) ( not ( = ?auto_364852 ?auto_364853 ) ) ( not ( = ?auto_364852 ?auto_364854 ) ) ( not ( = ?auto_364852 ?auto_364855 ) ) ( not ( = ?auto_364852 ?auto_364856 ) ) ( not ( = ?auto_364852 ?auto_364857 ) ) ( not ( = ?auto_364852 ?auto_364858 ) ) ( not ( = ?auto_364852 ?auto_364859 ) ) ( not ( = ?auto_364852 ?auto_364860 ) ) ( not ( = ?auto_364853 ?auto_364854 ) ) ( not ( = ?auto_364853 ?auto_364855 ) ) ( not ( = ?auto_364853 ?auto_364856 ) ) ( not ( = ?auto_364853 ?auto_364857 ) ) ( not ( = ?auto_364853 ?auto_364858 ) ) ( not ( = ?auto_364853 ?auto_364859 ) ) ( not ( = ?auto_364853 ?auto_364860 ) ) ( not ( = ?auto_364854 ?auto_364855 ) ) ( not ( = ?auto_364854 ?auto_364856 ) ) ( not ( = ?auto_364854 ?auto_364857 ) ) ( not ( = ?auto_364854 ?auto_364858 ) ) ( not ( = ?auto_364854 ?auto_364859 ) ) ( not ( = ?auto_364854 ?auto_364860 ) ) ( not ( = ?auto_364855 ?auto_364856 ) ) ( not ( = ?auto_364855 ?auto_364857 ) ) ( not ( = ?auto_364855 ?auto_364858 ) ) ( not ( = ?auto_364855 ?auto_364859 ) ) ( not ( = ?auto_364855 ?auto_364860 ) ) ( not ( = ?auto_364856 ?auto_364857 ) ) ( not ( = ?auto_364856 ?auto_364858 ) ) ( not ( = ?auto_364856 ?auto_364859 ) ) ( not ( = ?auto_364856 ?auto_364860 ) ) ( not ( = ?auto_364857 ?auto_364858 ) ) ( not ( = ?auto_364857 ?auto_364859 ) ) ( not ( = ?auto_364857 ?auto_364860 ) ) ( not ( = ?auto_364858 ?auto_364859 ) ) ( not ( = ?auto_364858 ?auto_364860 ) ) ( not ( = ?auto_364859 ?auto_364860 ) ) ( ON ?auto_364858 ?auto_364859 ) ( ON ?auto_364857 ?auto_364858 ) ( ON ?auto_364856 ?auto_364857 ) ( ON ?auto_364855 ?auto_364856 ) ( ON ?auto_364854 ?auto_364855 ) ( ON ?auto_364853 ?auto_364854 ) ( ON ?auto_364852 ?auto_364853 ) ( ON ?auto_364851 ?auto_364852 ) ( ON ?auto_364850 ?auto_364851 ) ( ON ?auto_364849 ?auto_364850 ) ( ON ?auto_364848 ?auto_364849 ) ( ON ?auto_364847 ?auto_364848 ) ( ON ?auto_364846 ?auto_364847 ) ( CLEAR ?auto_364846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_364846 )
      ( MAKE-14PILE ?auto_364846 ?auto_364847 ?auto_364848 ?auto_364849 ?auto_364850 ?auto_364851 ?auto_364852 ?auto_364853 ?auto_364854 ?auto_364855 ?auto_364856 ?auto_364857 ?auto_364858 ?auto_364859 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_364905 - BLOCK
      ?auto_364906 - BLOCK
      ?auto_364907 - BLOCK
      ?auto_364908 - BLOCK
      ?auto_364909 - BLOCK
      ?auto_364910 - BLOCK
      ?auto_364911 - BLOCK
      ?auto_364912 - BLOCK
      ?auto_364913 - BLOCK
      ?auto_364914 - BLOCK
      ?auto_364915 - BLOCK
      ?auto_364916 - BLOCK
      ?auto_364917 - BLOCK
      ?auto_364918 - BLOCK
      ?auto_364919 - BLOCK
    )
    :vars
    (
      ?auto_364920 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_364918 ) ( ON ?auto_364919 ?auto_364920 ) ( CLEAR ?auto_364919 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_364905 ) ( ON ?auto_364906 ?auto_364905 ) ( ON ?auto_364907 ?auto_364906 ) ( ON ?auto_364908 ?auto_364907 ) ( ON ?auto_364909 ?auto_364908 ) ( ON ?auto_364910 ?auto_364909 ) ( ON ?auto_364911 ?auto_364910 ) ( ON ?auto_364912 ?auto_364911 ) ( ON ?auto_364913 ?auto_364912 ) ( ON ?auto_364914 ?auto_364913 ) ( ON ?auto_364915 ?auto_364914 ) ( ON ?auto_364916 ?auto_364915 ) ( ON ?auto_364917 ?auto_364916 ) ( ON ?auto_364918 ?auto_364917 ) ( not ( = ?auto_364905 ?auto_364906 ) ) ( not ( = ?auto_364905 ?auto_364907 ) ) ( not ( = ?auto_364905 ?auto_364908 ) ) ( not ( = ?auto_364905 ?auto_364909 ) ) ( not ( = ?auto_364905 ?auto_364910 ) ) ( not ( = ?auto_364905 ?auto_364911 ) ) ( not ( = ?auto_364905 ?auto_364912 ) ) ( not ( = ?auto_364905 ?auto_364913 ) ) ( not ( = ?auto_364905 ?auto_364914 ) ) ( not ( = ?auto_364905 ?auto_364915 ) ) ( not ( = ?auto_364905 ?auto_364916 ) ) ( not ( = ?auto_364905 ?auto_364917 ) ) ( not ( = ?auto_364905 ?auto_364918 ) ) ( not ( = ?auto_364905 ?auto_364919 ) ) ( not ( = ?auto_364905 ?auto_364920 ) ) ( not ( = ?auto_364906 ?auto_364907 ) ) ( not ( = ?auto_364906 ?auto_364908 ) ) ( not ( = ?auto_364906 ?auto_364909 ) ) ( not ( = ?auto_364906 ?auto_364910 ) ) ( not ( = ?auto_364906 ?auto_364911 ) ) ( not ( = ?auto_364906 ?auto_364912 ) ) ( not ( = ?auto_364906 ?auto_364913 ) ) ( not ( = ?auto_364906 ?auto_364914 ) ) ( not ( = ?auto_364906 ?auto_364915 ) ) ( not ( = ?auto_364906 ?auto_364916 ) ) ( not ( = ?auto_364906 ?auto_364917 ) ) ( not ( = ?auto_364906 ?auto_364918 ) ) ( not ( = ?auto_364906 ?auto_364919 ) ) ( not ( = ?auto_364906 ?auto_364920 ) ) ( not ( = ?auto_364907 ?auto_364908 ) ) ( not ( = ?auto_364907 ?auto_364909 ) ) ( not ( = ?auto_364907 ?auto_364910 ) ) ( not ( = ?auto_364907 ?auto_364911 ) ) ( not ( = ?auto_364907 ?auto_364912 ) ) ( not ( = ?auto_364907 ?auto_364913 ) ) ( not ( = ?auto_364907 ?auto_364914 ) ) ( not ( = ?auto_364907 ?auto_364915 ) ) ( not ( = ?auto_364907 ?auto_364916 ) ) ( not ( = ?auto_364907 ?auto_364917 ) ) ( not ( = ?auto_364907 ?auto_364918 ) ) ( not ( = ?auto_364907 ?auto_364919 ) ) ( not ( = ?auto_364907 ?auto_364920 ) ) ( not ( = ?auto_364908 ?auto_364909 ) ) ( not ( = ?auto_364908 ?auto_364910 ) ) ( not ( = ?auto_364908 ?auto_364911 ) ) ( not ( = ?auto_364908 ?auto_364912 ) ) ( not ( = ?auto_364908 ?auto_364913 ) ) ( not ( = ?auto_364908 ?auto_364914 ) ) ( not ( = ?auto_364908 ?auto_364915 ) ) ( not ( = ?auto_364908 ?auto_364916 ) ) ( not ( = ?auto_364908 ?auto_364917 ) ) ( not ( = ?auto_364908 ?auto_364918 ) ) ( not ( = ?auto_364908 ?auto_364919 ) ) ( not ( = ?auto_364908 ?auto_364920 ) ) ( not ( = ?auto_364909 ?auto_364910 ) ) ( not ( = ?auto_364909 ?auto_364911 ) ) ( not ( = ?auto_364909 ?auto_364912 ) ) ( not ( = ?auto_364909 ?auto_364913 ) ) ( not ( = ?auto_364909 ?auto_364914 ) ) ( not ( = ?auto_364909 ?auto_364915 ) ) ( not ( = ?auto_364909 ?auto_364916 ) ) ( not ( = ?auto_364909 ?auto_364917 ) ) ( not ( = ?auto_364909 ?auto_364918 ) ) ( not ( = ?auto_364909 ?auto_364919 ) ) ( not ( = ?auto_364909 ?auto_364920 ) ) ( not ( = ?auto_364910 ?auto_364911 ) ) ( not ( = ?auto_364910 ?auto_364912 ) ) ( not ( = ?auto_364910 ?auto_364913 ) ) ( not ( = ?auto_364910 ?auto_364914 ) ) ( not ( = ?auto_364910 ?auto_364915 ) ) ( not ( = ?auto_364910 ?auto_364916 ) ) ( not ( = ?auto_364910 ?auto_364917 ) ) ( not ( = ?auto_364910 ?auto_364918 ) ) ( not ( = ?auto_364910 ?auto_364919 ) ) ( not ( = ?auto_364910 ?auto_364920 ) ) ( not ( = ?auto_364911 ?auto_364912 ) ) ( not ( = ?auto_364911 ?auto_364913 ) ) ( not ( = ?auto_364911 ?auto_364914 ) ) ( not ( = ?auto_364911 ?auto_364915 ) ) ( not ( = ?auto_364911 ?auto_364916 ) ) ( not ( = ?auto_364911 ?auto_364917 ) ) ( not ( = ?auto_364911 ?auto_364918 ) ) ( not ( = ?auto_364911 ?auto_364919 ) ) ( not ( = ?auto_364911 ?auto_364920 ) ) ( not ( = ?auto_364912 ?auto_364913 ) ) ( not ( = ?auto_364912 ?auto_364914 ) ) ( not ( = ?auto_364912 ?auto_364915 ) ) ( not ( = ?auto_364912 ?auto_364916 ) ) ( not ( = ?auto_364912 ?auto_364917 ) ) ( not ( = ?auto_364912 ?auto_364918 ) ) ( not ( = ?auto_364912 ?auto_364919 ) ) ( not ( = ?auto_364912 ?auto_364920 ) ) ( not ( = ?auto_364913 ?auto_364914 ) ) ( not ( = ?auto_364913 ?auto_364915 ) ) ( not ( = ?auto_364913 ?auto_364916 ) ) ( not ( = ?auto_364913 ?auto_364917 ) ) ( not ( = ?auto_364913 ?auto_364918 ) ) ( not ( = ?auto_364913 ?auto_364919 ) ) ( not ( = ?auto_364913 ?auto_364920 ) ) ( not ( = ?auto_364914 ?auto_364915 ) ) ( not ( = ?auto_364914 ?auto_364916 ) ) ( not ( = ?auto_364914 ?auto_364917 ) ) ( not ( = ?auto_364914 ?auto_364918 ) ) ( not ( = ?auto_364914 ?auto_364919 ) ) ( not ( = ?auto_364914 ?auto_364920 ) ) ( not ( = ?auto_364915 ?auto_364916 ) ) ( not ( = ?auto_364915 ?auto_364917 ) ) ( not ( = ?auto_364915 ?auto_364918 ) ) ( not ( = ?auto_364915 ?auto_364919 ) ) ( not ( = ?auto_364915 ?auto_364920 ) ) ( not ( = ?auto_364916 ?auto_364917 ) ) ( not ( = ?auto_364916 ?auto_364918 ) ) ( not ( = ?auto_364916 ?auto_364919 ) ) ( not ( = ?auto_364916 ?auto_364920 ) ) ( not ( = ?auto_364917 ?auto_364918 ) ) ( not ( = ?auto_364917 ?auto_364919 ) ) ( not ( = ?auto_364917 ?auto_364920 ) ) ( not ( = ?auto_364918 ?auto_364919 ) ) ( not ( = ?auto_364918 ?auto_364920 ) ) ( not ( = ?auto_364919 ?auto_364920 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_364919 ?auto_364920 )
      ( !STACK ?auto_364919 ?auto_364918 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_364936 - BLOCK
      ?auto_364937 - BLOCK
      ?auto_364938 - BLOCK
      ?auto_364939 - BLOCK
      ?auto_364940 - BLOCK
      ?auto_364941 - BLOCK
      ?auto_364942 - BLOCK
      ?auto_364943 - BLOCK
      ?auto_364944 - BLOCK
      ?auto_364945 - BLOCK
      ?auto_364946 - BLOCK
      ?auto_364947 - BLOCK
      ?auto_364948 - BLOCK
      ?auto_364949 - BLOCK
      ?auto_364950 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_364949 ) ( ON-TABLE ?auto_364950 ) ( CLEAR ?auto_364950 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_364936 ) ( ON ?auto_364937 ?auto_364936 ) ( ON ?auto_364938 ?auto_364937 ) ( ON ?auto_364939 ?auto_364938 ) ( ON ?auto_364940 ?auto_364939 ) ( ON ?auto_364941 ?auto_364940 ) ( ON ?auto_364942 ?auto_364941 ) ( ON ?auto_364943 ?auto_364942 ) ( ON ?auto_364944 ?auto_364943 ) ( ON ?auto_364945 ?auto_364944 ) ( ON ?auto_364946 ?auto_364945 ) ( ON ?auto_364947 ?auto_364946 ) ( ON ?auto_364948 ?auto_364947 ) ( ON ?auto_364949 ?auto_364948 ) ( not ( = ?auto_364936 ?auto_364937 ) ) ( not ( = ?auto_364936 ?auto_364938 ) ) ( not ( = ?auto_364936 ?auto_364939 ) ) ( not ( = ?auto_364936 ?auto_364940 ) ) ( not ( = ?auto_364936 ?auto_364941 ) ) ( not ( = ?auto_364936 ?auto_364942 ) ) ( not ( = ?auto_364936 ?auto_364943 ) ) ( not ( = ?auto_364936 ?auto_364944 ) ) ( not ( = ?auto_364936 ?auto_364945 ) ) ( not ( = ?auto_364936 ?auto_364946 ) ) ( not ( = ?auto_364936 ?auto_364947 ) ) ( not ( = ?auto_364936 ?auto_364948 ) ) ( not ( = ?auto_364936 ?auto_364949 ) ) ( not ( = ?auto_364936 ?auto_364950 ) ) ( not ( = ?auto_364937 ?auto_364938 ) ) ( not ( = ?auto_364937 ?auto_364939 ) ) ( not ( = ?auto_364937 ?auto_364940 ) ) ( not ( = ?auto_364937 ?auto_364941 ) ) ( not ( = ?auto_364937 ?auto_364942 ) ) ( not ( = ?auto_364937 ?auto_364943 ) ) ( not ( = ?auto_364937 ?auto_364944 ) ) ( not ( = ?auto_364937 ?auto_364945 ) ) ( not ( = ?auto_364937 ?auto_364946 ) ) ( not ( = ?auto_364937 ?auto_364947 ) ) ( not ( = ?auto_364937 ?auto_364948 ) ) ( not ( = ?auto_364937 ?auto_364949 ) ) ( not ( = ?auto_364937 ?auto_364950 ) ) ( not ( = ?auto_364938 ?auto_364939 ) ) ( not ( = ?auto_364938 ?auto_364940 ) ) ( not ( = ?auto_364938 ?auto_364941 ) ) ( not ( = ?auto_364938 ?auto_364942 ) ) ( not ( = ?auto_364938 ?auto_364943 ) ) ( not ( = ?auto_364938 ?auto_364944 ) ) ( not ( = ?auto_364938 ?auto_364945 ) ) ( not ( = ?auto_364938 ?auto_364946 ) ) ( not ( = ?auto_364938 ?auto_364947 ) ) ( not ( = ?auto_364938 ?auto_364948 ) ) ( not ( = ?auto_364938 ?auto_364949 ) ) ( not ( = ?auto_364938 ?auto_364950 ) ) ( not ( = ?auto_364939 ?auto_364940 ) ) ( not ( = ?auto_364939 ?auto_364941 ) ) ( not ( = ?auto_364939 ?auto_364942 ) ) ( not ( = ?auto_364939 ?auto_364943 ) ) ( not ( = ?auto_364939 ?auto_364944 ) ) ( not ( = ?auto_364939 ?auto_364945 ) ) ( not ( = ?auto_364939 ?auto_364946 ) ) ( not ( = ?auto_364939 ?auto_364947 ) ) ( not ( = ?auto_364939 ?auto_364948 ) ) ( not ( = ?auto_364939 ?auto_364949 ) ) ( not ( = ?auto_364939 ?auto_364950 ) ) ( not ( = ?auto_364940 ?auto_364941 ) ) ( not ( = ?auto_364940 ?auto_364942 ) ) ( not ( = ?auto_364940 ?auto_364943 ) ) ( not ( = ?auto_364940 ?auto_364944 ) ) ( not ( = ?auto_364940 ?auto_364945 ) ) ( not ( = ?auto_364940 ?auto_364946 ) ) ( not ( = ?auto_364940 ?auto_364947 ) ) ( not ( = ?auto_364940 ?auto_364948 ) ) ( not ( = ?auto_364940 ?auto_364949 ) ) ( not ( = ?auto_364940 ?auto_364950 ) ) ( not ( = ?auto_364941 ?auto_364942 ) ) ( not ( = ?auto_364941 ?auto_364943 ) ) ( not ( = ?auto_364941 ?auto_364944 ) ) ( not ( = ?auto_364941 ?auto_364945 ) ) ( not ( = ?auto_364941 ?auto_364946 ) ) ( not ( = ?auto_364941 ?auto_364947 ) ) ( not ( = ?auto_364941 ?auto_364948 ) ) ( not ( = ?auto_364941 ?auto_364949 ) ) ( not ( = ?auto_364941 ?auto_364950 ) ) ( not ( = ?auto_364942 ?auto_364943 ) ) ( not ( = ?auto_364942 ?auto_364944 ) ) ( not ( = ?auto_364942 ?auto_364945 ) ) ( not ( = ?auto_364942 ?auto_364946 ) ) ( not ( = ?auto_364942 ?auto_364947 ) ) ( not ( = ?auto_364942 ?auto_364948 ) ) ( not ( = ?auto_364942 ?auto_364949 ) ) ( not ( = ?auto_364942 ?auto_364950 ) ) ( not ( = ?auto_364943 ?auto_364944 ) ) ( not ( = ?auto_364943 ?auto_364945 ) ) ( not ( = ?auto_364943 ?auto_364946 ) ) ( not ( = ?auto_364943 ?auto_364947 ) ) ( not ( = ?auto_364943 ?auto_364948 ) ) ( not ( = ?auto_364943 ?auto_364949 ) ) ( not ( = ?auto_364943 ?auto_364950 ) ) ( not ( = ?auto_364944 ?auto_364945 ) ) ( not ( = ?auto_364944 ?auto_364946 ) ) ( not ( = ?auto_364944 ?auto_364947 ) ) ( not ( = ?auto_364944 ?auto_364948 ) ) ( not ( = ?auto_364944 ?auto_364949 ) ) ( not ( = ?auto_364944 ?auto_364950 ) ) ( not ( = ?auto_364945 ?auto_364946 ) ) ( not ( = ?auto_364945 ?auto_364947 ) ) ( not ( = ?auto_364945 ?auto_364948 ) ) ( not ( = ?auto_364945 ?auto_364949 ) ) ( not ( = ?auto_364945 ?auto_364950 ) ) ( not ( = ?auto_364946 ?auto_364947 ) ) ( not ( = ?auto_364946 ?auto_364948 ) ) ( not ( = ?auto_364946 ?auto_364949 ) ) ( not ( = ?auto_364946 ?auto_364950 ) ) ( not ( = ?auto_364947 ?auto_364948 ) ) ( not ( = ?auto_364947 ?auto_364949 ) ) ( not ( = ?auto_364947 ?auto_364950 ) ) ( not ( = ?auto_364948 ?auto_364949 ) ) ( not ( = ?auto_364948 ?auto_364950 ) ) ( not ( = ?auto_364949 ?auto_364950 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_364950 )
      ( !STACK ?auto_364950 ?auto_364949 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_364966 - BLOCK
      ?auto_364967 - BLOCK
      ?auto_364968 - BLOCK
      ?auto_364969 - BLOCK
      ?auto_364970 - BLOCK
      ?auto_364971 - BLOCK
      ?auto_364972 - BLOCK
      ?auto_364973 - BLOCK
      ?auto_364974 - BLOCK
      ?auto_364975 - BLOCK
      ?auto_364976 - BLOCK
      ?auto_364977 - BLOCK
      ?auto_364978 - BLOCK
      ?auto_364979 - BLOCK
      ?auto_364980 - BLOCK
    )
    :vars
    (
      ?auto_364981 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_364980 ?auto_364981 ) ( ON-TABLE ?auto_364966 ) ( ON ?auto_364967 ?auto_364966 ) ( ON ?auto_364968 ?auto_364967 ) ( ON ?auto_364969 ?auto_364968 ) ( ON ?auto_364970 ?auto_364969 ) ( ON ?auto_364971 ?auto_364970 ) ( ON ?auto_364972 ?auto_364971 ) ( ON ?auto_364973 ?auto_364972 ) ( ON ?auto_364974 ?auto_364973 ) ( ON ?auto_364975 ?auto_364974 ) ( ON ?auto_364976 ?auto_364975 ) ( ON ?auto_364977 ?auto_364976 ) ( ON ?auto_364978 ?auto_364977 ) ( not ( = ?auto_364966 ?auto_364967 ) ) ( not ( = ?auto_364966 ?auto_364968 ) ) ( not ( = ?auto_364966 ?auto_364969 ) ) ( not ( = ?auto_364966 ?auto_364970 ) ) ( not ( = ?auto_364966 ?auto_364971 ) ) ( not ( = ?auto_364966 ?auto_364972 ) ) ( not ( = ?auto_364966 ?auto_364973 ) ) ( not ( = ?auto_364966 ?auto_364974 ) ) ( not ( = ?auto_364966 ?auto_364975 ) ) ( not ( = ?auto_364966 ?auto_364976 ) ) ( not ( = ?auto_364966 ?auto_364977 ) ) ( not ( = ?auto_364966 ?auto_364978 ) ) ( not ( = ?auto_364966 ?auto_364979 ) ) ( not ( = ?auto_364966 ?auto_364980 ) ) ( not ( = ?auto_364966 ?auto_364981 ) ) ( not ( = ?auto_364967 ?auto_364968 ) ) ( not ( = ?auto_364967 ?auto_364969 ) ) ( not ( = ?auto_364967 ?auto_364970 ) ) ( not ( = ?auto_364967 ?auto_364971 ) ) ( not ( = ?auto_364967 ?auto_364972 ) ) ( not ( = ?auto_364967 ?auto_364973 ) ) ( not ( = ?auto_364967 ?auto_364974 ) ) ( not ( = ?auto_364967 ?auto_364975 ) ) ( not ( = ?auto_364967 ?auto_364976 ) ) ( not ( = ?auto_364967 ?auto_364977 ) ) ( not ( = ?auto_364967 ?auto_364978 ) ) ( not ( = ?auto_364967 ?auto_364979 ) ) ( not ( = ?auto_364967 ?auto_364980 ) ) ( not ( = ?auto_364967 ?auto_364981 ) ) ( not ( = ?auto_364968 ?auto_364969 ) ) ( not ( = ?auto_364968 ?auto_364970 ) ) ( not ( = ?auto_364968 ?auto_364971 ) ) ( not ( = ?auto_364968 ?auto_364972 ) ) ( not ( = ?auto_364968 ?auto_364973 ) ) ( not ( = ?auto_364968 ?auto_364974 ) ) ( not ( = ?auto_364968 ?auto_364975 ) ) ( not ( = ?auto_364968 ?auto_364976 ) ) ( not ( = ?auto_364968 ?auto_364977 ) ) ( not ( = ?auto_364968 ?auto_364978 ) ) ( not ( = ?auto_364968 ?auto_364979 ) ) ( not ( = ?auto_364968 ?auto_364980 ) ) ( not ( = ?auto_364968 ?auto_364981 ) ) ( not ( = ?auto_364969 ?auto_364970 ) ) ( not ( = ?auto_364969 ?auto_364971 ) ) ( not ( = ?auto_364969 ?auto_364972 ) ) ( not ( = ?auto_364969 ?auto_364973 ) ) ( not ( = ?auto_364969 ?auto_364974 ) ) ( not ( = ?auto_364969 ?auto_364975 ) ) ( not ( = ?auto_364969 ?auto_364976 ) ) ( not ( = ?auto_364969 ?auto_364977 ) ) ( not ( = ?auto_364969 ?auto_364978 ) ) ( not ( = ?auto_364969 ?auto_364979 ) ) ( not ( = ?auto_364969 ?auto_364980 ) ) ( not ( = ?auto_364969 ?auto_364981 ) ) ( not ( = ?auto_364970 ?auto_364971 ) ) ( not ( = ?auto_364970 ?auto_364972 ) ) ( not ( = ?auto_364970 ?auto_364973 ) ) ( not ( = ?auto_364970 ?auto_364974 ) ) ( not ( = ?auto_364970 ?auto_364975 ) ) ( not ( = ?auto_364970 ?auto_364976 ) ) ( not ( = ?auto_364970 ?auto_364977 ) ) ( not ( = ?auto_364970 ?auto_364978 ) ) ( not ( = ?auto_364970 ?auto_364979 ) ) ( not ( = ?auto_364970 ?auto_364980 ) ) ( not ( = ?auto_364970 ?auto_364981 ) ) ( not ( = ?auto_364971 ?auto_364972 ) ) ( not ( = ?auto_364971 ?auto_364973 ) ) ( not ( = ?auto_364971 ?auto_364974 ) ) ( not ( = ?auto_364971 ?auto_364975 ) ) ( not ( = ?auto_364971 ?auto_364976 ) ) ( not ( = ?auto_364971 ?auto_364977 ) ) ( not ( = ?auto_364971 ?auto_364978 ) ) ( not ( = ?auto_364971 ?auto_364979 ) ) ( not ( = ?auto_364971 ?auto_364980 ) ) ( not ( = ?auto_364971 ?auto_364981 ) ) ( not ( = ?auto_364972 ?auto_364973 ) ) ( not ( = ?auto_364972 ?auto_364974 ) ) ( not ( = ?auto_364972 ?auto_364975 ) ) ( not ( = ?auto_364972 ?auto_364976 ) ) ( not ( = ?auto_364972 ?auto_364977 ) ) ( not ( = ?auto_364972 ?auto_364978 ) ) ( not ( = ?auto_364972 ?auto_364979 ) ) ( not ( = ?auto_364972 ?auto_364980 ) ) ( not ( = ?auto_364972 ?auto_364981 ) ) ( not ( = ?auto_364973 ?auto_364974 ) ) ( not ( = ?auto_364973 ?auto_364975 ) ) ( not ( = ?auto_364973 ?auto_364976 ) ) ( not ( = ?auto_364973 ?auto_364977 ) ) ( not ( = ?auto_364973 ?auto_364978 ) ) ( not ( = ?auto_364973 ?auto_364979 ) ) ( not ( = ?auto_364973 ?auto_364980 ) ) ( not ( = ?auto_364973 ?auto_364981 ) ) ( not ( = ?auto_364974 ?auto_364975 ) ) ( not ( = ?auto_364974 ?auto_364976 ) ) ( not ( = ?auto_364974 ?auto_364977 ) ) ( not ( = ?auto_364974 ?auto_364978 ) ) ( not ( = ?auto_364974 ?auto_364979 ) ) ( not ( = ?auto_364974 ?auto_364980 ) ) ( not ( = ?auto_364974 ?auto_364981 ) ) ( not ( = ?auto_364975 ?auto_364976 ) ) ( not ( = ?auto_364975 ?auto_364977 ) ) ( not ( = ?auto_364975 ?auto_364978 ) ) ( not ( = ?auto_364975 ?auto_364979 ) ) ( not ( = ?auto_364975 ?auto_364980 ) ) ( not ( = ?auto_364975 ?auto_364981 ) ) ( not ( = ?auto_364976 ?auto_364977 ) ) ( not ( = ?auto_364976 ?auto_364978 ) ) ( not ( = ?auto_364976 ?auto_364979 ) ) ( not ( = ?auto_364976 ?auto_364980 ) ) ( not ( = ?auto_364976 ?auto_364981 ) ) ( not ( = ?auto_364977 ?auto_364978 ) ) ( not ( = ?auto_364977 ?auto_364979 ) ) ( not ( = ?auto_364977 ?auto_364980 ) ) ( not ( = ?auto_364977 ?auto_364981 ) ) ( not ( = ?auto_364978 ?auto_364979 ) ) ( not ( = ?auto_364978 ?auto_364980 ) ) ( not ( = ?auto_364978 ?auto_364981 ) ) ( not ( = ?auto_364979 ?auto_364980 ) ) ( not ( = ?auto_364979 ?auto_364981 ) ) ( not ( = ?auto_364980 ?auto_364981 ) ) ( CLEAR ?auto_364978 ) ( ON ?auto_364979 ?auto_364980 ) ( CLEAR ?auto_364979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_364966 ?auto_364967 ?auto_364968 ?auto_364969 ?auto_364970 ?auto_364971 ?auto_364972 ?auto_364973 ?auto_364974 ?auto_364975 ?auto_364976 ?auto_364977 ?auto_364978 ?auto_364979 )
      ( MAKE-15PILE ?auto_364966 ?auto_364967 ?auto_364968 ?auto_364969 ?auto_364970 ?auto_364971 ?auto_364972 ?auto_364973 ?auto_364974 ?auto_364975 ?auto_364976 ?auto_364977 ?auto_364978 ?auto_364979 ?auto_364980 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_364997 - BLOCK
      ?auto_364998 - BLOCK
      ?auto_364999 - BLOCK
      ?auto_365000 - BLOCK
      ?auto_365001 - BLOCK
      ?auto_365002 - BLOCK
      ?auto_365003 - BLOCK
      ?auto_365004 - BLOCK
      ?auto_365005 - BLOCK
      ?auto_365006 - BLOCK
      ?auto_365007 - BLOCK
      ?auto_365008 - BLOCK
      ?auto_365009 - BLOCK
      ?auto_365010 - BLOCK
      ?auto_365011 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_365011 ) ( ON-TABLE ?auto_364997 ) ( ON ?auto_364998 ?auto_364997 ) ( ON ?auto_364999 ?auto_364998 ) ( ON ?auto_365000 ?auto_364999 ) ( ON ?auto_365001 ?auto_365000 ) ( ON ?auto_365002 ?auto_365001 ) ( ON ?auto_365003 ?auto_365002 ) ( ON ?auto_365004 ?auto_365003 ) ( ON ?auto_365005 ?auto_365004 ) ( ON ?auto_365006 ?auto_365005 ) ( ON ?auto_365007 ?auto_365006 ) ( ON ?auto_365008 ?auto_365007 ) ( ON ?auto_365009 ?auto_365008 ) ( not ( = ?auto_364997 ?auto_364998 ) ) ( not ( = ?auto_364997 ?auto_364999 ) ) ( not ( = ?auto_364997 ?auto_365000 ) ) ( not ( = ?auto_364997 ?auto_365001 ) ) ( not ( = ?auto_364997 ?auto_365002 ) ) ( not ( = ?auto_364997 ?auto_365003 ) ) ( not ( = ?auto_364997 ?auto_365004 ) ) ( not ( = ?auto_364997 ?auto_365005 ) ) ( not ( = ?auto_364997 ?auto_365006 ) ) ( not ( = ?auto_364997 ?auto_365007 ) ) ( not ( = ?auto_364997 ?auto_365008 ) ) ( not ( = ?auto_364997 ?auto_365009 ) ) ( not ( = ?auto_364997 ?auto_365010 ) ) ( not ( = ?auto_364997 ?auto_365011 ) ) ( not ( = ?auto_364998 ?auto_364999 ) ) ( not ( = ?auto_364998 ?auto_365000 ) ) ( not ( = ?auto_364998 ?auto_365001 ) ) ( not ( = ?auto_364998 ?auto_365002 ) ) ( not ( = ?auto_364998 ?auto_365003 ) ) ( not ( = ?auto_364998 ?auto_365004 ) ) ( not ( = ?auto_364998 ?auto_365005 ) ) ( not ( = ?auto_364998 ?auto_365006 ) ) ( not ( = ?auto_364998 ?auto_365007 ) ) ( not ( = ?auto_364998 ?auto_365008 ) ) ( not ( = ?auto_364998 ?auto_365009 ) ) ( not ( = ?auto_364998 ?auto_365010 ) ) ( not ( = ?auto_364998 ?auto_365011 ) ) ( not ( = ?auto_364999 ?auto_365000 ) ) ( not ( = ?auto_364999 ?auto_365001 ) ) ( not ( = ?auto_364999 ?auto_365002 ) ) ( not ( = ?auto_364999 ?auto_365003 ) ) ( not ( = ?auto_364999 ?auto_365004 ) ) ( not ( = ?auto_364999 ?auto_365005 ) ) ( not ( = ?auto_364999 ?auto_365006 ) ) ( not ( = ?auto_364999 ?auto_365007 ) ) ( not ( = ?auto_364999 ?auto_365008 ) ) ( not ( = ?auto_364999 ?auto_365009 ) ) ( not ( = ?auto_364999 ?auto_365010 ) ) ( not ( = ?auto_364999 ?auto_365011 ) ) ( not ( = ?auto_365000 ?auto_365001 ) ) ( not ( = ?auto_365000 ?auto_365002 ) ) ( not ( = ?auto_365000 ?auto_365003 ) ) ( not ( = ?auto_365000 ?auto_365004 ) ) ( not ( = ?auto_365000 ?auto_365005 ) ) ( not ( = ?auto_365000 ?auto_365006 ) ) ( not ( = ?auto_365000 ?auto_365007 ) ) ( not ( = ?auto_365000 ?auto_365008 ) ) ( not ( = ?auto_365000 ?auto_365009 ) ) ( not ( = ?auto_365000 ?auto_365010 ) ) ( not ( = ?auto_365000 ?auto_365011 ) ) ( not ( = ?auto_365001 ?auto_365002 ) ) ( not ( = ?auto_365001 ?auto_365003 ) ) ( not ( = ?auto_365001 ?auto_365004 ) ) ( not ( = ?auto_365001 ?auto_365005 ) ) ( not ( = ?auto_365001 ?auto_365006 ) ) ( not ( = ?auto_365001 ?auto_365007 ) ) ( not ( = ?auto_365001 ?auto_365008 ) ) ( not ( = ?auto_365001 ?auto_365009 ) ) ( not ( = ?auto_365001 ?auto_365010 ) ) ( not ( = ?auto_365001 ?auto_365011 ) ) ( not ( = ?auto_365002 ?auto_365003 ) ) ( not ( = ?auto_365002 ?auto_365004 ) ) ( not ( = ?auto_365002 ?auto_365005 ) ) ( not ( = ?auto_365002 ?auto_365006 ) ) ( not ( = ?auto_365002 ?auto_365007 ) ) ( not ( = ?auto_365002 ?auto_365008 ) ) ( not ( = ?auto_365002 ?auto_365009 ) ) ( not ( = ?auto_365002 ?auto_365010 ) ) ( not ( = ?auto_365002 ?auto_365011 ) ) ( not ( = ?auto_365003 ?auto_365004 ) ) ( not ( = ?auto_365003 ?auto_365005 ) ) ( not ( = ?auto_365003 ?auto_365006 ) ) ( not ( = ?auto_365003 ?auto_365007 ) ) ( not ( = ?auto_365003 ?auto_365008 ) ) ( not ( = ?auto_365003 ?auto_365009 ) ) ( not ( = ?auto_365003 ?auto_365010 ) ) ( not ( = ?auto_365003 ?auto_365011 ) ) ( not ( = ?auto_365004 ?auto_365005 ) ) ( not ( = ?auto_365004 ?auto_365006 ) ) ( not ( = ?auto_365004 ?auto_365007 ) ) ( not ( = ?auto_365004 ?auto_365008 ) ) ( not ( = ?auto_365004 ?auto_365009 ) ) ( not ( = ?auto_365004 ?auto_365010 ) ) ( not ( = ?auto_365004 ?auto_365011 ) ) ( not ( = ?auto_365005 ?auto_365006 ) ) ( not ( = ?auto_365005 ?auto_365007 ) ) ( not ( = ?auto_365005 ?auto_365008 ) ) ( not ( = ?auto_365005 ?auto_365009 ) ) ( not ( = ?auto_365005 ?auto_365010 ) ) ( not ( = ?auto_365005 ?auto_365011 ) ) ( not ( = ?auto_365006 ?auto_365007 ) ) ( not ( = ?auto_365006 ?auto_365008 ) ) ( not ( = ?auto_365006 ?auto_365009 ) ) ( not ( = ?auto_365006 ?auto_365010 ) ) ( not ( = ?auto_365006 ?auto_365011 ) ) ( not ( = ?auto_365007 ?auto_365008 ) ) ( not ( = ?auto_365007 ?auto_365009 ) ) ( not ( = ?auto_365007 ?auto_365010 ) ) ( not ( = ?auto_365007 ?auto_365011 ) ) ( not ( = ?auto_365008 ?auto_365009 ) ) ( not ( = ?auto_365008 ?auto_365010 ) ) ( not ( = ?auto_365008 ?auto_365011 ) ) ( not ( = ?auto_365009 ?auto_365010 ) ) ( not ( = ?auto_365009 ?auto_365011 ) ) ( not ( = ?auto_365010 ?auto_365011 ) ) ( CLEAR ?auto_365009 ) ( ON ?auto_365010 ?auto_365011 ) ( CLEAR ?auto_365010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_364997 ?auto_364998 ?auto_364999 ?auto_365000 ?auto_365001 ?auto_365002 ?auto_365003 ?auto_365004 ?auto_365005 ?auto_365006 ?auto_365007 ?auto_365008 ?auto_365009 ?auto_365010 )
      ( MAKE-15PILE ?auto_364997 ?auto_364998 ?auto_364999 ?auto_365000 ?auto_365001 ?auto_365002 ?auto_365003 ?auto_365004 ?auto_365005 ?auto_365006 ?auto_365007 ?auto_365008 ?auto_365009 ?auto_365010 ?auto_365011 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_365027 - BLOCK
      ?auto_365028 - BLOCK
      ?auto_365029 - BLOCK
      ?auto_365030 - BLOCK
      ?auto_365031 - BLOCK
      ?auto_365032 - BLOCK
      ?auto_365033 - BLOCK
      ?auto_365034 - BLOCK
      ?auto_365035 - BLOCK
      ?auto_365036 - BLOCK
      ?auto_365037 - BLOCK
      ?auto_365038 - BLOCK
      ?auto_365039 - BLOCK
      ?auto_365040 - BLOCK
      ?auto_365041 - BLOCK
    )
    :vars
    (
      ?auto_365042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_365041 ?auto_365042 ) ( ON-TABLE ?auto_365027 ) ( ON ?auto_365028 ?auto_365027 ) ( ON ?auto_365029 ?auto_365028 ) ( ON ?auto_365030 ?auto_365029 ) ( ON ?auto_365031 ?auto_365030 ) ( ON ?auto_365032 ?auto_365031 ) ( ON ?auto_365033 ?auto_365032 ) ( ON ?auto_365034 ?auto_365033 ) ( ON ?auto_365035 ?auto_365034 ) ( ON ?auto_365036 ?auto_365035 ) ( ON ?auto_365037 ?auto_365036 ) ( ON ?auto_365038 ?auto_365037 ) ( not ( = ?auto_365027 ?auto_365028 ) ) ( not ( = ?auto_365027 ?auto_365029 ) ) ( not ( = ?auto_365027 ?auto_365030 ) ) ( not ( = ?auto_365027 ?auto_365031 ) ) ( not ( = ?auto_365027 ?auto_365032 ) ) ( not ( = ?auto_365027 ?auto_365033 ) ) ( not ( = ?auto_365027 ?auto_365034 ) ) ( not ( = ?auto_365027 ?auto_365035 ) ) ( not ( = ?auto_365027 ?auto_365036 ) ) ( not ( = ?auto_365027 ?auto_365037 ) ) ( not ( = ?auto_365027 ?auto_365038 ) ) ( not ( = ?auto_365027 ?auto_365039 ) ) ( not ( = ?auto_365027 ?auto_365040 ) ) ( not ( = ?auto_365027 ?auto_365041 ) ) ( not ( = ?auto_365027 ?auto_365042 ) ) ( not ( = ?auto_365028 ?auto_365029 ) ) ( not ( = ?auto_365028 ?auto_365030 ) ) ( not ( = ?auto_365028 ?auto_365031 ) ) ( not ( = ?auto_365028 ?auto_365032 ) ) ( not ( = ?auto_365028 ?auto_365033 ) ) ( not ( = ?auto_365028 ?auto_365034 ) ) ( not ( = ?auto_365028 ?auto_365035 ) ) ( not ( = ?auto_365028 ?auto_365036 ) ) ( not ( = ?auto_365028 ?auto_365037 ) ) ( not ( = ?auto_365028 ?auto_365038 ) ) ( not ( = ?auto_365028 ?auto_365039 ) ) ( not ( = ?auto_365028 ?auto_365040 ) ) ( not ( = ?auto_365028 ?auto_365041 ) ) ( not ( = ?auto_365028 ?auto_365042 ) ) ( not ( = ?auto_365029 ?auto_365030 ) ) ( not ( = ?auto_365029 ?auto_365031 ) ) ( not ( = ?auto_365029 ?auto_365032 ) ) ( not ( = ?auto_365029 ?auto_365033 ) ) ( not ( = ?auto_365029 ?auto_365034 ) ) ( not ( = ?auto_365029 ?auto_365035 ) ) ( not ( = ?auto_365029 ?auto_365036 ) ) ( not ( = ?auto_365029 ?auto_365037 ) ) ( not ( = ?auto_365029 ?auto_365038 ) ) ( not ( = ?auto_365029 ?auto_365039 ) ) ( not ( = ?auto_365029 ?auto_365040 ) ) ( not ( = ?auto_365029 ?auto_365041 ) ) ( not ( = ?auto_365029 ?auto_365042 ) ) ( not ( = ?auto_365030 ?auto_365031 ) ) ( not ( = ?auto_365030 ?auto_365032 ) ) ( not ( = ?auto_365030 ?auto_365033 ) ) ( not ( = ?auto_365030 ?auto_365034 ) ) ( not ( = ?auto_365030 ?auto_365035 ) ) ( not ( = ?auto_365030 ?auto_365036 ) ) ( not ( = ?auto_365030 ?auto_365037 ) ) ( not ( = ?auto_365030 ?auto_365038 ) ) ( not ( = ?auto_365030 ?auto_365039 ) ) ( not ( = ?auto_365030 ?auto_365040 ) ) ( not ( = ?auto_365030 ?auto_365041 ) ) ( not ( = ?auto_365030 ?auto_365042 ) ) ( not ( = ?auto_365031 ?auto_365032 ) ) ( not ( = ?auto_365031 ?auto_365033 ) ) ( not ( = ?auto_365031 ?auto_365034 ) ) ( not ( = ?auto_365031 ?auto_365035 ) ) ( not ( = ?auto_365031 ?auto_365036 ) ) ( not ( = ?auto_365031 ?auto_365037 ) ) ( not ( = ?auto_365031 ?auto_365038 ) ) ( not ( = ?auto_365031 ?auto_365039 ) ) ( not ( = ?auto_365031 ?auto_365040 ) ) ( not ( = ?auto_365031 ?auto_365041 ) ) ( not ( = ?auto_365031 ?auto_365042 ) ) ( not ( = ?auto_365032 ?auto_365033 ) ) ( not ( = ?auto_365032 ?auto_365034 ) ) ( not ( = ?auto_365032 ?auto_365035 ) ) ( not ( = ?auto_365032 ?auto_365036 ) ) ( not ( = ?auto_365032 ?auto_365037 ) ) ( not ( = ?auto_365032 ?auto_365038 ) ) ( not ( = ?auto_365032 ?auto_365039 ) ) ( not ( = ?auto_365032 ?auto_365040 ) ) ( not ( = ?auto_365032 ?auto_365041 ) ) ( not ( = ?auto_365032 ?auto_365042 ) ) ( not ( = ?auto_365033 ?auto_365034 ) ) ( not ( = ?auto_365033 ?auto_365035 ) ) ( not ( = ?auto_365033 ?auto_365036 ) ) ( not ( = ?auto_365033 ?auto_365037 ) ) ( not ( = ?auto_365033 ?auto_365038 ) ) ( not ( = ?auto_365033 ?auto_365039 ) ) ( not ( = ?auto_365033 ?auto_365040 ) ) ( not ( = ?auto_365033 ?auto_365041 ) ) ( not ( = ?auto_365033 ?auto_365042 ) ) ( not ( = ?auto_365034 ?auto_365035 ) ) ( not ( = ?auto_365034 ?auto_365036 ) ) ( not ( = ?auto_365034 ?auto_365037 ) ) ( not ( = ?auto_365034 ?auto_365038 ) ) ( not ( = ?auto_365034 ?auto_365039 ) ) ( not ( = ?auto_365034 ?auto_365040 ) ) ( not ( = ?auto_365034 ?auto_365041 ) ) ( not ( = ?auto_365034 ?auto_365042 ) ) ( not ( = ?auto_365035 ?auto_365036 ) ) ( not ( = ?auto_365035 ?auto_365037 ) ) ( not ( = ?auto_365035 ?auto_365038 ) ) ( not ( = ?auto_365035 ?auto_365039 ) ) ( not ( = ?auto_365035 ?auto_365040 ) ) ( not ( = ?auto_365035 ?auto_365041 ) ) ( not ( = ?auto_365035 ?auto_365042 ) ) ( not ( = ?auto_365036 ?auto_365037 ) ) ( not ( = ?auto_365036 ?auto_365038 ) ) ( not ( = ?auto_365036 ?auto_365039 ) ) ( not ( = ?auto_365036 ?auto_365040 ) ) ( not ( = ?auto_365036 ?auto_365041 ) ) ( not ( = ?auto_365036 ?auto_365042 ) ) ( not ( = ?auto_365037 ?auto_365038 ) ) ( not ( = ?auto_365037 ?auto_365039 ) ) ( not ( = ?auto_365037 ?auto_365040 ) ) ( not ( = ?auto_365037 ?auto_365041 ) ) ( not ( = ?auto_365037 ?auto_365042 ) ) ( not ( = ?auto_365038 ?auto_365039 ) ) ( not ( = ?auto_365038 ?auto_365040 ) ) ( not ( = ?auto_365038 ?auto_365041 ) ) ( not ( = ?auto_365038 ?auto_365042 ) ) ( not ( = ?auto_365039 ?auto_365040 ) ) ( not ( = ?auto_365039 ?auto_365041 ) ) ( not ( = ?auto_365039 ?auto_365042 ) ) ( not ( = ?auto_365040 ?auto_365041 ) ) ( not ( = ?auto_365040 ?auto_365042 ) ) ( not ( = ?auto_365041 ?auto_365042 ) ) ( ON ?auto_365040 ?auto_365041 ) ( CLEAR ?auto_365038 ) ( ON ?auto_365039 ?auto_365040 ) ( CLEAR ?auto_365039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_365027 ?auto_365028 ?auto_365029 ?auto_365030 ?auto_365031 ?auto_365032 ?auto_365033 ?auto_365034 ?auto_365035 ?auto_365036 ?auto_365037 ?auto_365038 ?auto_365039 )
      ( MAKE-15PILE ?auto_365027 ?auto_365028 ?auto_365029 ?auto_365030 ?auto_365031 ?auto_365032 ?auto_365033 ?auto_365034 ?auto_365035 ?auto_365036 ?auto_365037 ?auto_365038 ?auto_365039 ?auto_365040 ?auto_365041 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_365058 - BLOCK
      ?auto_365059 - BLOCK
      ?auto_365060 - BLOCK
      ?auto_365061 - BLOCK
      ?auto_365062 - BLOCK
      ?auto_365063 - BLOCK
      ?auto_365064 - BLOCK
      ?auto_365065 - BLOCK
      ?auto_365066 - BLOCK
      ?auto_365067 - BLOCK
      ?auto_365068 - BLOCK
      ?auto_365069 - BLOCK
      ?auto_365070 - BLOCK
      ?auto_365071 - BLOCK
      ?auto_365072 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_365072 ) ( ON-TABLE ?auto_365058 ) ( ON ?auto_365059 ?auto_365058 ) ( ON ?auto_365060 ?auto_365059 ) ( ON ?auto_365061 ?auto_365060 ) ( ON ?auto_365062 ?auto_365061 ) ( ON ?auto_365063 ?auto_365062 ) ( ON ?auto_365064 ?auto_365063 ) ( ON ?auto_365065 ?auto_365064 ) ( ON ?auto_365066 ?auto_365065 ) ( ON ?auto_365067 ?auto_365066 ) ( ON ?auto_365068 ?auto_365067 ) ( ON ?auto_365069 ?auto_365068 ) ( not ( = ?auto_365058 ?auto_365059 ) ) ( not ( = ?auto_365058 ?auto_365060 ) ) ( not ( = ?auto_365058 ?auto_365061 ) ) ( not ( = ?auto_365058 ?auto_365062 ) ) ( not ( = ?auto_365058 ?auto_365063 ) ) ( not ( = ?auto_365058 ?auto_365064 ) ) ( not ( = ?auto_365058 ?auto_365065 ) ) ( not ( = ?auto_365058 ?auto_365066 ) ) ( not ( = ?auto_365058 ?auto_365067 ) ) ( not ( = ?auto_365058 ?auto_365068 ) ) ( not ( = ?auto_365058 ?auto_365069 ) ) ( not ( = ?auto_365058 ?auto_365070 ) ) ( not ( = ?auto_365058 ?auto_365071 ) ) ( not ( = ?auto_365058 ?auto_365072 ) ) ( not ( = ?auto_365059 ?auto_365060 ) ) ( not ( = ?auto_365059 ?auto_365061 ) ) ( not ( = ?auto_365059 ?auto_365062 ) ) ( not ( = ?auto_365059 ?auto_365063 ) ) ( not ( = ?auto_365059 ?auto_365064 ) ) ( not ( = ?auto_365059 ?auto_365065 ) ) ( not ( = ?auto_365059 ?auto_365066 ) ) ( not ( = ?auto_365059 ?auto_365067 ) ) ( not ( = ?auto_365059 ?auto_365068 ) ) ( not ( = ?auto_365059 ?auto_365069 ) ) ( not ( = ?auto_365059 ?auto_365070 ) ) ( not ( = ?auto_365059 ?auto_365071 ) ) ( not ( = ?auto_365059 ?auto_365072 ) ) ( not ( = ?auto_365060 ?auto_365061 ) ) ( not ( = ?auto_365060 ?auto_365062 ) ) ( not ( = ?auto_365060 ?auto_365063 ) ) ( not ( = ?auto_365060 ?auto_365064 ) ) ( not ( = ?auto_365060 ?auto_365065 ) ) ( not ( = ?auto_365060 ?auto_365066 ) ) ( not ( = ?auto_365060 ?auto_365067 ) ) ( not ( = ?auto_365060 ?auto_365068 ) ) ( not ( = ?auto_365060 ?auto_365069 ) ) ( not ( = ?auto_365060 ?auto_365070 ) ) ( not ( = ?auto_365060 ?auto_365071 ) ) ( not ( = ?auto_365060 ?auto_365072 ) ) ( not ( = ?auto_365061 ?auto_365062 ) ) ( not ( = ?auto_365061 ?auto_365063 ) ) ( not ( = ?auto_365061 ?auto_365064 ) ) ( not ( = ?auto_365061 ?auto_365065 ) ) ( not ( = ?auto_365061 ?auto_365066 ) ) ( not ( = ?auto_365061 ?auto_365067 ) ) ( not ( = ?auto_365061 ?auto_365068 ) ) ( not ( = ?auto_365061 ?auto_365069 ) ) ( not ( = ?auto_365061 ?auto_365070 ) ) ( not ( = ?auto_365061 ?auto_365071 ) ) ( not ( = ?auto_365061 ?auto_365072 ) ) ( not ( = ?auto_365062 ?auto_365063 ) ) ( not ( = ?auto_365062 ?auto_365064 ) ) ( not ( = ?auto_365062 ?auto_365065 ) ) ( not ( = ?auto_365062 ?auto_365066 ) ) ( not ( = ?auto_365062 ?auto_365067 ) ) ( not ( = ?auto_365062 ?auto_365068 ) ) ( not ( = ?auto_365062 ?auto_365069 ) ) ( not ( = ?auto_365062 ?auto_365070 ) ) ( not ( = ?auto_365062 ?auto_365071 ) ) ( not ( = ?auto_365062 ?auto_365072 ) ) ( not ( = ?auto_365063 ?auto_365064 ) ) ( not ( = ?auto_365063 ?auto_365065 ) ) ( not ( = ?auto_365063 ?auto_365066 ) ) ( not ( = ?auto_365063 ?auto_365067 ) ) ( not ( = ?auto_365063 ?auto_365068 ) ) ( not ( = ?auto_365063 ?auto_365069 ) ) ( not ( = ?auto_365063 ?auto_365070 ) ) ( not ( = ?auto_365063 ?auto_365071 ) ) ( not ( = ?auto_365063 ?auto_365072 ) ) ( not ( = ?auto_365064 ?auto_365065 ) ) ( not ( = ?auto_365064 ?auto_365066 ) ) ( not ( = ?auto_365064 ?auto_365067 ) ) ( not ( = ?auto_365064 ?auto_365068 ) ) ( not ( = ?auto_365064 ?auto_365069 ) ) ( not ( = ?auto_365064 ?auto_365070 ) ) ( not ( = ?auto_365064 ?auto_365071 ) ) ( not ( = ?auto_365064 ?auto_365072 ) ) ( not ( = ?auto_365065 ?auto_365066 ) ) ( not ( = ?auto_365065 ?auto_365067 ) ) ( not ( = ?auto_365065 ?auto_365068 ) ) ( not ( = ?auto_365065 ?auto_365069 ) ) ( not ( = ?auto_365065 ?auto_365070 ) ) ( not ( = ?auto_365065 ?auto_365071 ) ) ( not ( = ?auto_365065 ?auto_365072 ) ) ( not ( = ?auto_365066 ?auto_365067 ) ) ( not ( = ?auto_365066 ?auto_365068 ) ) ( not ( = ?auto_365066 ?auto_365069 ) ) ( not ( = ?auto_365066 ?auto_365070 ) ) ( not ( = ?auto_365066 ?auto_365071 ) ) ( not ( = ?auto_365066 ?auto_365072 ) ) ( not ( = ?auto_365067 ?auto_365068 ) ) ( not ( = ?auto_365067 ?auto_365069 ) ) ( not ( = ?auto_365067 ?auto_365070 ) ) ( not ( = ?auto_365067 ?auto_365071 ) ) ( not ( = ?auto_365067 ?auto_365072 ) ) ( not ( = ?auto_365068 ?auto_365069 ) ) ( not ( = ?auto_365068 ?auto_365070 ) ) ( not ( = ?auto_365068 ?auto_365071 ) ) ( not ( = ?auto_365068 ?auto_365072 ) ) ( not ( = ?auto_365069 ?auto_365070 ) ) ( not ( = ?auto_365069 ?auto_365071 ) ) ( not ( = ?auto_365069 ?auto_365072 ) ) ( not ( = ?auto_365070 ?auto_365071 ) ) ( not ( = ?auto_365070 ?auto_365072 ) ) ( not ( = ?auto_365071 ?auto_365072 ) ) ( ON ?auto_365071 ?auto_365072 ) ( CLEAR ?auto_365069 ) ( ON ?auto_365070 ?auto_365071 ) ( CLEAR ?auto_365070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_365058 ?auto_365059 ?auto_365060 ?auto_365061 ?auto_365062 ?auto_365063 ?auto_365064 ?auto_365065 ?auto_365066 ?auto_365067 ?auto_365068 ?auto_365069 ?auto_365070 )
      ( MAKE-15PILE ?auto_365058 ?auto_365059 ?auto_365060 ?auto_365061 ?auto_365062 ?auto_365063 ?auto_365064 ?auto_365065 ?auto_365066 ?auto_365067 ?auto_365068 ?auto_365069 ?auto_365070 ?auto_365071 ?auto_365072 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_365088 - BLOCK
      ?auto_365089 - BLOCK
      ?auto_365090 - BLOCK
      ?auto_365091 - BLOCK
      ?auto_365092 - BLOCK
      ?auto_365093 - BLOCK
      ?auto_365094 - BLOCK
      ?auto_365095 - BLOCK
      ?auto_365096 - BLOCK
      ?auto_365097 - BLOCK
      ?auto_365098 - BLOCK
      ?auto_365099 - BLOCK
      ?auto_365100 - BLOCK
      ?auto_365101 - BLOCK
      ?auto_365102 - BLOCK
    )
    :vars
    (
      ?auto_365103 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_365102 ?auto_365103 ) ( ON-TABLE ?auto_365088 ) ( ON ?auto_365089 ?auto_365088 ) ( ON ?auto_365090 ?auto_365089 ) ( ON ?auto_365091 ?auto_365090 ) ( ON ?auto_365092 ?auto_365091 ) ( ON ?auto_365093 ?auto_365092 ) ( ON ?auto_365094 ?auto_365093 ) ( ON ?auto_365095 ?auto_365094 ) ( ON ?auto_365096 ?auto_365095 ) ( ON ?auto_365097 ?auto_365096 ) ( ON ?auto_365098 ?auto_365097 ) ( not ( = ?auto_365088 ?auto_365089 ) ) ( not ( = ?auto_365088 ?auto_365090 ) ) ( not ( = ?auto_365088 ?auto_365091 ) ) ( not ( = ?auto_365088 ?auto_365092 ) ) ( not ( = ?auto_365088 ?auto_365093 ) ) ( not ( = ?auto_365088 ?auto_365094 ) ) ( not ( = ?auto_365088 ?auto_365095 ) ) ( not ( = ?auto_365088 ?auto_365096 ) ) ( not ( = ?auto_365088 ?auto_365097 ) ) ( not ( = ?auto_365088 ?auto_365098 ) ) ( not ( = ?auto_365088 ?auto_365099 ) ) ( not ( = ?auto_365088 ?auto_365100 ) ) ( not ( = ?auto_365088 ?auto_365101 ) ) ( not ( = ?auto_365088 ?auto_365102 ) ) ( not ( = ?auto_365088 ?auto_365103 ) ) ( not ( = ?auto_365089 ?auto_365090 ) ) ( not ( = ?auto_365089 ?auto_365091 ) ) ( not ( = ?auto_365089 ?auto_365092 ) ) ( not ( = ?auto_365089 ?auto_365093 ) ) ( not ( = ?auto_365089 ?auto_365094 ) ) ( not ( = ?auto_365089 ?auto_365095 ) ) ( not ( = ?auto_365089 ?auto_365096 ) ) ( not ( = ?auto_365089 ?auto_365097 ) ) ( not ( = ?auto_365089 ?auto_365098 ) ) ( not ( = ?auto_365089 ?auto_365099 ) ) ( not ( = ?auto_365089 ?auto_365100 ) ) ( not ( = ?auto_365089 ?auto_365101 ) ) ( not ( = ?auto_365089 ?auto_365102 ) ) ( not ( = ?auto_365089 ?auto_365103 ) ) ( not ( = ?auto_365090 ?auto_365091 ) ) ( not ( = ?auto_365090 ?auto_365092 ) ) ( not ( = ?auto_365090 ?auto_365093 ) ) ( not ( = ?auto_365090 ?auto_365094 ) ) ( not ( = ?auto_365090 ?auto_365095 ) ) ( not ( = ?auto_365090 ?auto_365096 ) ) ( not ( = ?auto_365090 ?auto_365097 ) ) ( not ( = ?auto_365090 ?auto_365098 ) ) ( not ( = ?auto_365090 ?auto_365099 ) ) ( not ( = ?auto_365090 ?auto_365100 ) ) ( not ( = ?auto_365090 ?auto_365101 ) ) ( not ( = ?auto_365090 ?auto_365102 ) ) ( not ( = ?auto_365090 ?auto_365103 ) ) ( not ( = ?auto_365091 ?auto_365092 ) ) ( not ( = ?auto_365091 ?auto_365093 ) ) ( not ( = ?auto_365091 ?auto_365094 ) ) ( not ( = ?auto_365091 ?auto_365095 ) ) ( not ( = ?auto_365091 ?auto_365096 ) ) ( not ( = ?auto_365091 ?auto_365097 ) ) ( not ( = ?auto_365091 ?auto_365098 ) ) ( not ( = ?auto_365091 ?auto_365099 ) ) ( not ( = ?auto_365091 ?auto_365100 ) ) ( not ( = ?auto_365091 ?auto_365101 ) ) ( not ( = ?auto_365091 ?auto_365102 ) ) ( not ( = ?auto_365091 ?auto_365103 ) ) ( not ( = ?auto_365092 ?auto_365093 ) ) ( not ( = ?auto_365092 ?auto_365094 ) ) ( not ( = ?auto_365092 ?auto_365095 ) ) ( not ( = ?auto_365092 ?auto_365096 ) ) ( not ( = ?auto_365092 ?auto_365097 ) ) ( not ( = ?auto_365092 ?auto_365098 ) ) ( not ( = ?auto_365092 ?auto_365099 ) ) ( not ( = ?auto_365092 ?auto_365100 ) ) ( not ( = ?auto_365092 ?auto_365101 ) ) ( not ( = ?auto_365092 ?auto_365102 ) ) ( not ( = ?auto_365092 ?auto_365103 ) ) ( not ( = ?auto_365093 ?auto_365094 ) ) ( not ( = ?auto_365093 ?auto_365095 ) ) ( not ( = ?auto_365093 ?auto_365096 ) ) ( not ( = ?auto_365093 ?auto_365097 ) ) ( not ( = ?auto_365093 ?auto_365098 ) ) ( not ( = ?auto_365093 ?auto_365099 ) ) ( not ( = ?auto_365093 ?auto_365100 ) ) ( not ( = ?auto_365093 ?auto_365101 ) ) ( not ( = ?auto_365093 ?auto_365102 ) ) ( not ( = ?auto_365093 ?auto_365103 ) ) ( not ( = ?auto_365094 ?auto_365095 ) ) ( not ( = ?auto_365094 ?auto_365096 ) ) ( not ( = ?auto_365094 ?auto_365097 ) ) ( not ( = ?auto_365094 ?auto_365098 ) ) ( not ( = ?auto_365094 ?auto_365099 ) ) ( not ( = ?auto_365094 ?auto_365100 ) ) ( not ( = ?auto_365094 ?auto_365101 ) ) ( not ( = ?auto_365094 ?auto_365102 ) ) ( not ( = ?auto_365094 ?auto_365103 ) ) ( not ( = ?auto_365095 ?auto_365096 ) ) ( not ( = ?auto_365095 ?auto_365097 ) ) ( not ( = ?auto_365095 ?auto_365098 ) ) ( not ( = ?auto_365095 ?auto_365099 ) ) ( not ( = ?auto_365095 ?auto_365100 ) ) ( not ( = ?auto_365095 ?auto_365101 ) ) ( not ( = ?auto_365095 ?auto_365102 ) ) ( not ( = ?auto_365095 ?auto_365103 ) ) ( not ( = ?auto_365096 ?auto_365097 ) ) ( not ( = ?auto_365096 ?auto_365098 ) ) ( not ( = ?auto_365096 ?auto_365099 ) ) ( not ( = ?auto_365096 ?auto_365100 ) ) ( not ( = ?auto_365096 ?auto_365101 ) ) ( not ( = ?auto_365096 ?auto_365102 ) ) ( not ( = ?auto_365096 ?auto_365103 ) ) ( not ( = ?auto_365097 ?auto_365098 ) ) ( not ( = ?auto_365097 ?auto_365099 ) ) ( not ( = ?auto_365097 ?auto_365100 ) ) ( not ( = ?auto_365097 ?auto_365101 ) ) ( not ( = ?auto_365097 ?auto_365102 ) ) ( not ( = ?auto_365097 ?auto_365103 ) ) ( not ( = ?auto_365098 ?auto_365099 ) ) ( not ( = ?auto_365098 ?auto_365100 ) ) ( not ( = ?auto_365098 ?auto_365101 ) ) ( not ( = ?auto_365098 ?auto_365102 ) ) ( not ( = ?auto_365098 ?auto_365103 ) ) ( not ( = ?auto_365099 ?auto_365100 ) ) ( not ( = ?auto_365099 ?auto_365101 ) ) ( not ( = ?auto_365099 ?auto_365102 ) ) ( not ( = ?auto_365099 ?auto_365103 ) ) ( not ( = ?auto_365100 ?auto_365101 ) ) ( not ( = ?auto_365100 ?auto_365102 ) ) ( not ( = ?auto_365100 ?auto_365103 ) ) ( not ( = ?auto_365101 ?auto_365102 ) ) ( not ( = ?auto_365101 ?auto_365103 ) ) ( not ( = ?auto_365102 ?auto_365103 ) ) ( ON ?auto_365101 ?auto_365102 ) ( ON ?auto_365100 ?auto_365101 ) ( CLEAR ?auto_365098 ) ( ON ?auto_365099 ?auto_365100 ) ( CLEAR ?auto_365099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_365088 ?auto_365089 ?auto_365090 ?auto_365091 ?auto_365092 ?auto_365093 ?auto_365094 ?auto_365095 ?auto_365096 ?auto_365097 ?auto_365098 ?auto_365099 )
      ( MAKE-15PILE ?auto_365088 ?auto_365089 ?auto_365090 ?auto_365091 ?auto_365092 ?auto_365093 ?auto_365094 ?auto_365095 ?auto_365096 ?auto_365097 ?auto_365098 ?auto_365099 ?auto_365100 ?auto_365101 ?auto_365102 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_365119 - BLOCK
      ?auto_365120 - BLOCK
      ?auto_365121 - BLOCK
      ?auto_365122 - BLOCK
      ?auto_365123 - BLOCK
      ?auto_365124 - BLOCK
      ?auto_365125 - BLOCK
      ?auto_365126 - BLOCK
      ?auto_365127 - BLOCK
      ?auto_365128 - BLOCK
      ?auto_365129 - BLOCK
      ?auto_365130 - BLOCK
      ?auto_365131 - BLOCK
      ?auto_365132 - BLOCK
      ?auto_365133 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_365133 ) ( ON-TABLE ?auto_365119 ) ( ON ?auto_365120 ?auto_365119 ) ( ON ?auto_365121 ?auto_365120 ) ( ON ?auto_365122 ?auto_365121 ) ( ON ?auto_365123 ?auto_365122 ) ( ON ?auto_365124 ?auto_365123 ) ( ON ?auto_365125 ?auto_365124 ) ( ON ?auto_365126 ?auto_365125 ) ( ON ?auto_365127 ?auto_365126 ) ( ON ?auto_365128 ?auto_365127 ) ( ON ?auto_365129 ?auto_365128 ) ( not ( = ?auto_365119 ?auto_365120 ) ) ( not ( = ?auto_365119 ?auto_365121 ) ) ( not ( = ?auto_365119 ?auto_365122 ) ) ( not ( = ?auto_365119 ?auto_365123 ) ) ( not ( = ?auto_365119 ?auto_365124 ) ) ( not ( = ?auto_365119 ?auto_365125 ) ) ( not ( = ?auto_365119 ?auto_365126 ) ) ( not ( = ?auto_365119 ?auto_365127 ) ) ( not ( = ?auto_365119 ?auto_365128 ) ) ( not ( = ?auto_365119 ?auto_365129 ) ) ( not ( = ?auto_365119 ?auto_365130 ) ) ( not ( = ?auto_365119 ?auto_365131 ) ) ( not ( = ?auto_365119 ?auto_365132 ) ) ( not ( = ?auto_365119 ?auto_365133 ) ) ( not ( = ?auto_365120 ?auto_365121 ) ) ( not ( = ?auto_365120 ?auto_365122 ) ) ( not ( = ?auto_365120 ?auto_365123 ) ) ( not ( = ?auto_365120 ?auto_365124 ) ) ( not ( = ?auto_365120 ?auto_365125 ) ) ( not ( = ?auto_365120 ?auto_365126 ) ) ( not ( = ?auto_365120 ?auto_365127 ) ) ( not ( = ?auto_365120 ?auto_365128 ) ) ( not ( = ?auto_365120 ?auto_365129 ) ) ( not ( = ?auto_365120 ?auto_365130 ) ) ( not ( = ?auto_365120 ?auto_365131 ) ) ( not ( = ?auto_365120 ?auto_365132 ) ) ( not ( = ?auto_365120 ?auto_365133 ) ) ( not ( = ?auto_365121 ?auto_365122 ) ) ( not ( = ?auto_365121 ?auto_365123 ) ) ( not ( = ?auto_365121 ?auto_365124 ) ) ( not ( = ?auto_365121 ?auto_365125 ) ) ( not ( = ?auto_365121 ?auto_365126 ) ) ( not ( = ?auto_365121 ?auto_365127 ) ) ( not ( = ?auto_365121 ?auto_365128 ) ) ( not ( = ?auto_365121 ?auto_365129 ) ) ( not ( = ?auto_365121 ?auto_365130 ) ) ( not ( = ?auto_365121 ?auto_365131 ) ) ( not ( = ?auto_365121 ?auto_365132 ) ) ( not ( = ?auto_365121 ?auto_365133 ) ) ( not ( = ?auto_365122 ?auto_365123 ) ) ( not ( = ?auto_365122 ?auto_365124 ) ) ( not ( = ?auto_365122 ?auto_365125 ) ) ( not ( = ?auto_365122 ?auto_365126 ) ) ( not ( = ?auto_365122 ?auto_365127 ) ) ( not ( = ?auto_365122 ?auto_365128 ) ) ( not ( = ?auto_365122 ?auto_365129 ) ) ( not ( = ?auto_365122 ?auto_365130 ) ) ( not ( = ?auto_365122 ?auto_365131 ) ) ( not ( = ?auto_365122 ?auto_365132 ) ) ( not ( = ?auto_365122 ?auto_365133 ) ) ( not ( = ?auto_365123 ?auto_365124 ) ) ( not ( = ?auto_365123 ?auto_365125 ) ) ( not ( = ?auto_365123 ?auto_365126 ) ) ( not ( = ?auto_365123 ?auto_365127 ) ) ( not ( = ?auto_365123 ?auto_365128 ) ) ( not ( = ?auto_365123 ?auto_365129 ) ) ( not ( = ?auto_365123 ?auto_365130 ) ) ( not ( = ?auto_365123 ?auto_365131 ) ) ( not ( = ?auto_365123 ?auto_365132 ) ) ( not ( = ?auto_365123 ?auto_365133 ) ) ( not ( = ?auto_365124 ?auto_365125 ) ) ( not ( = ?auto_365124 ?auto_365126 ) ) ( not ( = ?auto_365124 ?auto_365127 ) ) ( not ( = ?auto_365124 ?auto_365128 ) ) ( not ( = ?auto_365124 ?auto_365129 ) ) ( not ( = ?auto_365124 ?auto_365130 ) ) ( not ( = ?auto_365124 ?auto_365131 ) ) ( not ( = ?auto_365124 ?auto_365132 ) ) ( not ( = ?auto_365124 ?auto_365133 ) ) ( not ( = ?auto_365125 ?auto_365126 ) ) ( not ( = ?auto_365125 ?auto_365127 ) ) ( not ( = ?auto_365125 ?auto_365128 ) ) ( not ( = ?auto_365125 ?auto_365129 ) ) ( not ( = ?auto_365125 ?auto_365130 ) ) ( not ( = ?auto_365125 ?auto_365131 ) ) ( not ( = ?auto_365125 ?auto_365132 ) ) ( not ( = ?auto_365125 ?auto_365133 ) ) ( not ( = ?auto_365126 ?auto_365127 ) ) ( not ( = ?auto_365126 ?auto_365128 ) ) ( not ( = ?auto_365126 ?auto_365129 ) ) ( not ( = ?auto_365126 ?auto_365130 ) ) ( not ( = ?auto_365126 ?auto_365131 ) ) ( not ( = ?auto_365126 ?auto_365132 ) ) ( not ( = ?auto_365126 ?auto_365133 ) ) ( not ( = ?auto_365127 ?auto_365128 ) ) ( not ( = ?auto_365127 ?auto_365129 ) ) ( not ( = ?auto_365127 ?auto_365130 ) ) ( not ( = ?auto_365127 ?auto_365131 ) ) ( not ( = ?auto_365127 ?auto_365132 ) ) ( not ( = ?auto_365127 ?auto_365133 ) ) ( not ( = ?auto_365128 ?auto_365129 ) ) ( not ( = ?auto_365128 ?auto_365130 ) ) ( not ( = ?auto_365128 ?auto_365131 ) ) ( not ( = ?auto_365128 ?auto_365132 ) ) ( not ( = ?auto_365128 ?auto_365133 ) ) ( not ( = ?auto_365129 ?auto_365130 ) ) ( not ( = ?auto_365129 ?auto_365131 ) ) ( not ( = ?auto_365129 ?auto_365132 ) ) ( not ( = ?auto_365129 ?auto_365133 ) ) ( not ( = ?auto_365130 ?auto_365131 ) ) ( not ( = ?auto_365130 ?auto_365132 ) ) ( not ( = ?auto_365130 ?auto_365133 ) ) ( not ( = ?auto_365131 ?auto_365132 ) ) ( not ( = ?auto_365131 ?auto_365133 ) ) ( not ( = ?auto_365132 ?auto_365133 ) ) ( ON ?auto_365132 ?auto_365133 ) ( ON ?auto_365131 ?auto_365132 ) ( CLEAR ?auto_365129 ) ( ON ?auto_365130 ?auto_365131 ) ( CLEAR ?auto_365130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_365119 ?auto_365120 ?auto_365121 ?auto_365122 ?auto_365123 ?auto_365124 ?auto_365125 ?auto_365126 ?auto_365127 ?auto_365128 ?auto_365129 ?auto_365130 )
      ( MAKE-15PILE ?auto_365119 ?auto_365120 ?auto_365121 ?auto_365122 ?auto_365123 ?auto_365124 ?auto_365125 ?auto_365126 ?auto_365127 ?auto_365128 ?auto_365129 ?auto_365130 ?auto_365131 ?auto_365132 ?auto_365133 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_365149 - BLOCK
      ?auto_365150 - BLOCK
      ?auto_365151 - BLOCK
      ?auto_365152 - BLOCK
      ?auto_365153 - BLOCK
      ?auto_365154 - BLOCK
      ?auto_365155 - BLOCK
      ?auto_365156 - BLOCK
      ?auto_365157 - BLOCK
      ?auto_365158 - BLOCK
      ?auto_365159 - BLOCK
      ?auto_365160 - BLOCK
      ?auto_365161 - BLOCK
      ?auto_365162 - BLOCK
      ?auto_365163 - BLOCK
    )
    :vars
    (
      ?auto_365164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_365163 ?auto_365164 ) ( ON-TABLE ?auto_365149 ) ( ON ?auto_365150 ?auto_365149 ) ( ON ?auto_365151 ?auto_365150 ) ( ON ?auto_365152 ?auto_365151 ) ( ON ?auto_365153 ?auto_365152 ) ( ON ?auto_365154 ?auto_365153 ) ( ON ?auto_365155 ?auto_365154 ) ( ON ?auto_365156 ?auto_365155 ) ( ON ?auto_365157 ?auto_365156 ) ( ON ?auto_365158 ?auto_365157 ) ( not ( = ?auto_365149 ?auto_365150 ) ) ( not ( = ?auto_365149 ?auto_365151 ) ) ( not ( = ?auto_365149 ?auto_365152 ) ) ( not ( = ?auto_365149 ?auto_365153 ) ) ( not ( = ?auto_365149 ?auto_365154 ) ) ( not ( = ?auto_365149 ?auto_365155 ) ) ( not ( = ?auto_365149 ?auto_365156 ) ) ( not ( = ?auto_365149 ?auto_365157 ) ) ( not ( = ?auto_365149 ?auto_365158 ) ) ( not ( = ?auto_365149 ?auto_365159 ) ) ( not ( = ?auto_365149 ?auto_365160 ) ) ( not ( = ?auto_365149 ?auto_365161 ) ) ( not ( = ?auto_365149 ?auto_365162 ) ) ( not ( = ?auto_365149 ?auto_365163 ) ) ( not ( = ?auto_365149 ?auto_365164 ) ) ( not ( = ?auto_365150 ?auto_365151 ) ) ( not ( = ?auto_365150 ?auto_365152 ) ) ( not ( = ?auto_365150 ?auto_365153 ) ) ( not ( = ?auto_365150 ?auto_365154 ) ) ( not ( = ?auto_365150 ?auto_365155 ) ) ( not ( = ?auto_365150 ?auto_365156 ) ) ( not ( = ?auto_365150 ?auto_365157 ) ) ( not ( = ?auto_365150 ?auto_365158 ) ) ( not ( = ?auto_365150 ?auto_365159 ) ) ( not ( = ?auto_365150 ?auto_365160 ) ) ( not ( = ?auto_365150 ?auto_365161 ) ) ( not ( = ?auto_365150 ?auto_365162 ) ) ( not ( = ?auto_365150 ?auto_365163 ) ) ( not ( = ?auto_365150 ?auto_365164 ) ) ( not ( = ?auto_365151 ?auto_365152 ) ) ( not ( = ?auto_365151 ?auto_365153 ) ) ( not ( = ?auto_365151 ?auto_365154 ) ) ( not ( = ?auto_365151 ?auto_365155 ) ) ( not ( = ?auto_365151 ?auto_365156 ) ) ( not ( = ?auto_365151 ?auto_365157 ) ) ( not ( = ?auto_365151 ?auto_365158 ) ) ( not ( = ?auto_365151 ?auto_365159 ) ) ( not ( = ?auto_365151 ?auto_365160 ) ) ( not ( = ?auto_365151 ?auto_365161 ) ) ( not ( = ?auto_365151 ?auto_365162 ) ) ( not ( = ?auto_365151 ?auto_365163 ) ) ( not ( = ?auto_365151 ?auto_365164 ) ) ( not ( = ?auto_365152 ?auto_365153 ) ) ( not ( = ?auto_365152 ?auto_365154 ) ) ( not ( = ?auto_365152 ?auto_365155 ) ) ( not ( = ?auto_365152 ?auto_365156 ) ) ( not ( = ?auto_365152 ?auto_365157 ) ) ( not ( = ?auto_365152 ?auto_365158 ) ) ( not ( = ?auto_365152 ?auto_365159 ) ) ( not ( = ?auto_365152 ?auto_365160 ) ) ( not ( = ?auto_365152 ?auto_365161 ) ) ( not ( = ?auto_365152 ?auto_365162 ) ) ( not ( = ?auto_365152 ?auto_365163 ) ) ( not ( = ?auto_365152 ?auto_365164 ) ) ( not ( = ?auto_365153 ?auto_365154 ) ) ( not ( = ?auto_365153 ?auto_365155 ) ) ( not ( = ?auto_365153 ?auto_365156 ) ) ( not ( = ?auto_365153 ?auto_365157 ) ) ( not ( = ?auto_365153 ?auto_365158 ) ) ( not ( = ?auto_365153 ?auto_365159 ) ) ( not ( = ?auto_365153 ?auto_365160 ) ) ( not ( = ?auto_365153 ?auto_365161 ) ) ( not ( = ?auto_365153 ?auto_365162 ) ) ( not ( = ?auto_365153 ?auto_365163 ) ) ( not ( = ?auto_365153 ?auto_365164 ) ) ( not ( = ?auto_365154 ?auto_365155 ) ) ( not ( = ?auto_365154 ?auto_365156 ) ) ( not ( = ?auto_365154 ?auto_365157 ) ) ( not ( = ?auto_365154 ?auto_365158 ) ) ( not ( = ?auto_365154 ?auto_365159 ) ) ( not ( = ?auto_365154 ?auto_365160 ) ) ( not ( = ?auto_365154 ?auto_365161 ) ) ( not ( = ?auto_365154 ?auto_365162 ) ) ( not ( = ?auto_365154 ?auto_365163 ) ) ( not ( = ?auto_365154 ?auto_365164 ) ) ( not ( = ?auto_365155 ?auto_365156 ) ) ( not ( = ?auto_365155 ?auto_365157 ) ) ( not ( = ?auto_365155 ?auto_365158 ) ) ( not ( = ?auto_365155 ?auto_365159 ) ) ( not ( = ?auto_365155 ?auto_365160 ) ) ( not ( = ?auto_365155 ?auto_365161 ) ) ( not ( = ?auto_365155 ?auto_365162 ) ) ( not ( = ?auto_365155 ?auto_365163 ) ) ( not ( = ?auto_365155 ?auto_365164 ) ) ( not ( = ?auto_365156 ?auto_365157 ) ) ( not ( = ?auto_365156 ?auto_365158 ) ) ( not ( = ?auto_365156 ?auto_365159 ) ) ( not ( = ?auto_365156 ?auto_365160 ) ) ( not ( = ?auto_365156 ?auto_365161 ) ) ( not ( = ?auto_365156 ?auto_365162 ) ) ( not ( = ?auto_365156 ?auto_365163 ) ) ( not ( = ?auto_365156 ?auto_365164 ) ) ( not ( = ?auto_365157 ?auto_365158 ) ) ( not ( = ?auto_365157 ?auto_365159 ) ) ( not ( = ?auto_365157 ?auto_365160 ) ) ( not ( = ?auto_365157 ?auto_365161 ) ) ( not ( = ?auto_365157 ?auto_365162 ) ) ( not ( = ?auto_365157 ?auto_365163 ) ) ( not ( = ?auto_365157 ?auto_365164 ) ) ( not ( = ?auto_365158 ?auto_365159 ) ) ( not ( = ?auto_365158 ?auto_365160 ) ) ( not ( = ?auto_365158 ?auto_365161 ) ) ( not ( = ?auto_365158 ?auto_365162 ) ) ( not ( = ?auto_365158 ?auto_365163 ) ) ( not ( = ?auto_365158 ?auto_365164 ) ) ( not ( = ?auto_365159 ?auto_365160 ) ) ( not ( = ?auto_365159 ?auto_365161 ) ) ( not ( = ?auto_365159 ?auto_365162 ) ) ( not ( = ?auto_365159 ?auto_365163 ) ) ( not ( = ?auto_365159 ?auto_365164 ) ) ( not ( = ?auto_365160 ?auto_365161 ) ) ( not ( = ?auto_365160 ?auto_365162 ) ) ( not ( = ?auto_365160 ?auto_365163 ) ) ( not ( = ?auto_365160 ?auto_365164 ) ) ( not ( = ?auto_365161 ?auto_365162 ) ) ( not ( = ?auto_365161 ?auto_365163 ) ) ( not ( = ?auto_365161 ?auto_365164 ) ) ( not ( = ?auto_365162 ?auto_365163 ) ) ( not ( = ?auto_365162 ?auto_365164 ) ) ( not ( = ?auto_365163 ?auto_365164 ) ) ( ON ?auto_365162 ?auto_365163 ) ( ON ?auto_365161 ?auto_365162 ) ( ON ?auto_365160 ?auto_365161 ) ( CLEAR ?auto_365158 ) ( ON ?auto_365159 ?auto_365160 ) ( CLEAR ?auto_365159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_365149 ?auto_365150 ?auto_365151 ?auto_365152 ?auto_365153 ?auto_365154 ?auto_365155 ?auto_365156 ?auto_365157 ?auto_365158 ?auto_365159 )
      ( MAKE-15PILE ?auto_365149 ?auto_365150 ?auto_365151 ?auto_365152 ?auto_365153 ?auto_365154 ?auto_365155 ?auto_365156 ?auto_365157 ?auto_365158 ?auto_365159 ?auto_365160 ?auto_365161 ?auto_365162 ?auto_365163 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_365180 - BLOCK
      ?auto_365181 - BLOCK
      ?auto_365182 - BLOCK
      ?auto_365183 - BLOCK
      ?auto_365184 - BLOCK
      ?auto_365185 - BLOCK
      ?auto_365186 - BLOCK
      ?auto_365187 - BLOCK
      ?auto_365188 - BLOCK
      ?auto_365189 - BLOCK
      ?auto_365190 - BLOCK
      ?auto_365191 - BLOCK
      ?auto_365192 - BLOCK
      ?auto_365193 - BLOCK
      ?auto_365194 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_365194 ) ( ON-TABLE ?auto_365180 ) ( ON ?auto_365181 ?auto_365180 ) ( ON ?auto_365182 ?auto_365181 ) ( ON ?auto_365183 ?auto_365182 ) ( ON ?auto_365184 ?auto_365183 ) ( ON ?auto_365185 ?auto_365184 ) ( ON ?auto_365186 ?auto_365185 ) ( ON ?auto_365187 ?auto_365186 ) ( ON ?auto_365188 ?auto_365187 ) ( ON ?auto_365189 ?auto_365188 ) ( not ( = ?auto_365180 ?auto_365181 ) ) ( not ( = ?auto_365180 ?auto_365182 ) ) ( not ( = ?auto_365180 ?auto_365183 ) ) ( not ( = ?auto_365180 ?auto_365184 ) ) ( not ( = ?auto_365180 ?auto_365185 ) ) ( not ( = ?auto_365180 ?auto_365186 ) ) ( not ( = ?auto_365180 ?auto_365187 ) ) ( not ( = ?auto_365180 ?auto_365188 ) ) ( not ( = ?auto_365180 ?auto_365189 ) ) ( not ( = ?auto_365180 ?auto_365190 ) ) ( not ( = ?auto_365180 ?auto_365191 ) ) ( not ( = ?auto_365180 ?auto_365192 ) ) ( not ( = ?auto_365180 ?auto_365193 ) ) ( not ( = ?auto_365180 ?auto_365194 ) ) ( not ( = ?auto_365181 ?auto_365182 ) ) ( not ( = ?auto_365181 ?auto_365183 ) ) ( not ( = ?auto_365181 ?auto_365184 ) ) ( not ( = ?auto_365181 ?auto_365185 ) ) ( not ( = ?auto_365181 ?auto_365186 ) ) ( not ( = ?auto_365181 ?auto_365187 ) ) ( not ( = ?auto_365181 ?auto_365188 ) ) ( not ( = ?auto_365181 ?auto_365189 ) ) ( not ( = ?auto_365181 ?auto_365190 ) ) ( not ( = ?auto_365181 ?auto_365191 ) ) ( not ( = ?auto_365181 ?auto_365192 ) ) ( not ( = ?auto_365181 ?auto_365193 ) ) ( not ( = ?auto_365181 ?auto_365194 ) ) ( not ( = ?auto_365182 ?auto_365183 ) ) ( not ( = ?auto_365182 ?auto_365184 ) ) ( not ( = ?auto_365182 ?auto_365185 ) ) ( not ( = ?auto_365182 ?auto_365186 ) ) ( not ( = ?auto_365182 ?auto_365187 ) ) ( not ( = ?auto_365182 ?auto_365188 ) ) ( not ( = ?auto_365182 ?auto_365189 ) ) ( not ( = ?auto_365182 ?auto_365190 ) ) ( not ( = ?auto_365182 ?auto_365191 ) ) ( not ( = ?auto_365182 ?auto_365192 ) ) ( not ( = ?auto_365182 ?auto_365193 ) ) ( not ( = ?auto_365182 ?auto_365194 ) ) ( not ( = ?auto_365183 ?auto_365184 ) ) ( not ( = ?auto_365183 ?auto_365185 ) ) ( not ( = ?auto_365183 ?auto_365186 ) ) ( not ( = ?auto_365183 ?auto_365187 ) ) ( not ( = ?auto_365183 ?auto_365188 ) ) ( not ( = ?auto_365183 ?auto_365189 ) ) ( not ( = ?auto_365183 ?auto_365190 ) ) ( not ( = ?auto_365183 ?auto_365191 ) ) ( not ( = ?auto_365183 ?auto_365192 ) ) ( not ( = ?auto_365183 ?auto_365193 ) ) ( not ( = ?auto_365183 ?auto_365194 ) ) ( not ( = ?auto_365184 ?auto_365185 ) ) ( not ( = ?auto_365184 ?auto_365186 ) ) ( not ( = ?auto_365184 ?auto_365187 ) ) ( not ( = ?auto_365184 ?auto_365188 ) ) ( not ( = ?auto_365184 ?auto_365189 ) ) ( not ( = ?auto_365184 ?auto_365190 ) ) ( not ( = ?auto_365184 ?auto_365191 ) ) ( not ( = ?auto_365184 ?auto_365192 ) ) ( not ( = ?auto_365184 ?auto_365193 ) ) ( not ( = ?auto_365184 ?auto_365194 ) ) ( not ( = ?auto_365185 ?auto_365186 ) ) ( not ( = ?auto_365185 ?auto_365187 ) ) ( not ( = ?auto_365185 ?auto_365188 ) ) ( not ( = ?auto_365185 ?auto_365189 ) ) ( not ( = ?auto_365185 ?auto_365190 ) ) ( not ( = ?auto_365185 ?auto_365191 ) ) ( not ( = ?auto_365185 ?auto_365192 ) ) ( not ( = ?auto_365185 ?auto_365193 ) ) ( not ( = ?auto_365185 ?auto_365194 ) ) ( not ( = ?auto_365186 ?auto_365187 ) ) ( not ( = ?auto_365186 ?auto_365188 ) ) ( not ( = ?auto_365186 ?auto_365189 ) ) ( not ( = ?auto_365186 ?auto_365190 ) ) ( not ( = ?auto_365186 ?auto_365191 ) ) ( not ( = ?auto_365186 ?auto_365192 ) ) ( not ( = ?auto_365186 ?auto_365193 ) ) ( not ( = ?auto_365186 ?auto_365194 ) ) ( not ( = ?auto_365187 ?auto_365188 ) ) ( not ( = ?auto_365187 ?auto_365189 ) ) ( not ( = ?auto_365187 ?auto_365190 ) ) ( not ( = ?auto_365187 ?auto_365191 ) ) ( not ( = ?auto_365187 ?auto_365192 ) ) ( not ( = ?auto_365187 ?auto_365193 ) ) ( not ( = ?auto_365187 ?auto_365194 ) ) ( not ( = ?auto_365188 ?auto_365189 ) ) ( not ( = ?auto_365188 ?auto_365190 ) ) ( not ( = ?auto_365188 ?auto_365191 ) ) ( not ( = ?auto_365188 ?auto_365192 ) ) ( not ( = ?auto_365188 ?auto_365193 ) ) ( not ( = ?auto_365188 ?auto_365194 ) ) ( not ( = ?auto_365189 ?auto_365190 ) ) ( not ( = ?auto_365189 ?auto_365191 ) ) ( not ( = ?auto_365189 ?auto_365192 ) ) ( not ( = ?auto_365189 ?auto_365193 ) ) ( not ( = ?auto_365189 ?auto_365194 ) ) ( not ( = ?auto_365190 ?auto_365191 ) ) ( not ( = ?auto_365190 ?auto_365192 ) ) ( not ( = ?auto_365190 ?auto_365193 ) ) ( not ( = ?auto_365190 ?auto_365194 ) ) ( not ( = ?auto_365191 ?auto_365192 ) ) ( not ( = ?auto_365191 ?auto_365193 ) ) ( not ( = ?auto_365191 ?auto_365194 ) ) ( not ( = ?auto_365192 ?auto_365193 ) ) ( not ( = ?auto_365192 ?auto_365194 ) ) ( not ( = ?auto_365193 ?auto_365194 ) ) ( ON ?auto_365193 ?auto_365194 ) ( ON ?auto_365192 ?auto_365193 ) ( ON ?auto_365191 ?auto_365192 ) ( CLEAR ?auto_365189 ) ( ON ?auto_365190 ?auto_365191 ) ( CLEAR ?auto_365190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_365180 ?auto_365181 ?auto_365182 ?auto_365183 ?auto_365184 ?auto_365185 ?auto_365186 ?auto_365187 ?auto_365188 ?auto_365189 ?auto_365190 )
      ( MAKE-15PILE ?auto_365180 ?auto_365181 ?auto_365182 ?auto_365183 ?auto_365184 ?auto_365185 ?auto_365186 ?auto_365187 ?auto_365188 ?auto_365189 ?auto_365190 ?auto_365191 ?auto_365192 ?auto_365193 ?auto_365194 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_365210 - BLOCK
      ?auto_365211 - BLOCK
      ?auto_365212 - BLOCK
      ?auto_365213 - BLOCK
      ?auto_365214 - BLOCK
      ?auto_365215 - BLOCK
      ?auto_365216 - BLOCK
      ?auto_365217 - BLOCK
      ?auto_365218 - BLOCK
      ?auto_365219 - BLOCK
      ?auto_365220 - BLOCK
      ?auto_365221 - BLOCK
      ?auto_365222 - BLOCK
      ?auto_365223 - BLOCK
      ?auto_365224 - BLOCK
    )
    :vars
    (
      ?auto_365225 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_365224 ?auto_365225 ) ( ON-TABLE ?auto_365210 ) ( ON ?auto_365211 ?auto_365210 ) ( ON ?auto_365212 ?auto_365211 ) ( ON ?auto_365213 ?auto_365212 ) ( ON ?auto_365214 ?auto_365213 ) ( ON ?auto_365215 ?auto_365214 ) ( ON ?auto_365216 ?auto_365215 ) ( ON ?auto_365217 ?auto_365216 ) ( ON ?auto_365218 ?auto_365217 ) ( not ( = ?auto_365210 ?auto_365211 ) ) ( not ( = ?auto_365210 ?auto_365212 ) ) ( not ( = ?auto_365210 ?auto_365213 ) ) ( not ( = ?auto_365210 ?auto_365214 ) ) ( not ( = ?auto_365210 ?auto_365215 ) ) ( not ( = ?auto_365210 ?auto_365216 ) ) ( not ( = ?auto_365210 ?auto_365217 ) ) ( not ( = ?auto_365210 ?auto_365218 ) ) ( not ( = ?auto_365210 ?auto_365219 ) ) ( not ( = ?auto_365210 ?auto_365220 ) ) ( not ( = ?auto_365210 ?auto_365221 ) ) ( not ( = ?auto_365210 ?auto_365222 ) ) ( not ( = ?auto_365210 ?auto_365223 ) ) ( not ( = ?auto_365210 ?auto_365224 ) ) ( not ( = ?auto_365210 ?auto_365225 ) ) ( not ( = ?auto_365211 ?auto_365212 ) ) ( not ( = ?auto_365211 ?auto_365213 ) ) ( not ( = ?auto_365211 ?auto_365214 ) ) ( not ( = ?auto_365211 ?auto_365215 ) ) ( not ( = ?auto_365211 ?auto_365216 ) ) ( not ( = ?auto_365211 ?auto_365217 ) ) ( not ( = ?auto_365211 ?auto_365218 ) ) ( not ( = ?auto_365211 ?auto_365219 ) ) ( not ( = ?auto_365211 ?auto_365220 ) ) ( not ( = ?auto_365211 ?auto_365221 ) ) ( not ( = ?auto_365211 ?auto_365222 ) ) ( not ( = ?auto_365211 ?auto_365223 ) ) ( not ( = ?auto_365211 ?auto_365224 ) ) ( not ( = ?auto_365211 ?auto_365225 ) ) ( not ( = ?auto_365212 ?auto_365213 ) ) ( not ( = ?auto_365212 ?auto_365214 ) ) ( not ( = ?auto_365212 ?auto_365215 ) ) ( not ( = ?auto_365212 ?auto_365216 ) ) ( not ( = ?auto_365212 ?auto_365217 ) ) ( not ( = ?auto_365212 ?auto_365218 ) ) ( not ( = ?auto_365212 ?auto_365219 ) ) ( not ( = ?auto_365212 ?auto_365220 ) ) ( not ( = ?auto_365212 ?auto_365221 ) ) ( not ( = ?auto_365212 ?auto_365222 ) ) ( not ( = ?auto_365212 ?auto_365223 ) ) ( not ( = ?auto_365212 ?auto_365224 ) ) ( not ( = ?auto_365212 ?auto_365225 ) ) ( not ( = ?auto_365213 ?auto_365214 ) ) ( not ( = ?auto_365213 ?auto_365215 ) ) ( not ( = ?auto_365213 ?auto_365216 ) ) ( not ( = ?auto_365213 ?auto_365217 ) ) ( not ( = ?auto_365213 ?auto_365218 ) ) ( not ( = ?auto_365213 ?auto_365219 ) ) ( not ( = ?auto_365213 ?auto_365220 ) ) ( not ( = ?auto_365213 ?auto_365221 ) ) ( not ( = ?auto_365213 ?auto_365222 ) ) ( not ( = ?auto_365213 ?auto_365223 ) ) ( not ( = ?auto_365213 ?auto_365224 ) ) ( not ( = ?auto_365213 ?auto_365225 ) ) ( not ( = ?auto_365214 ?auto_365215 ) ) ( not ( = ?auto_365214 ?auto_365216 ) ) ( not ( = ?auto_365214 ?auto_365217 ) ) ( not ( = ?auto_365214 ?auto_365218 ) ) ( not ( = ?auto_365214 ?auto_365219 ) ) ( not ( = ?auto_365214 ?auto_365220 ) ) ( not ( = ?auto_365214 ?auto_365221 ) ) ( not ( = ?auto_365214 ?auto_365222 ) ) ( not ( = ?auto_365214 ?auto_365223 ) ) ( not ( = ?auto_365214 ?auto_365224 ) ) ( not ( = ?auto_365214 ?auto_365225 ) ) ( not ( = ?auto_365215 ?auto_365216 ) ) ( not ( = ?auto_365215 ?auto_365217 ) ) ( not ( = ?auto_365215 ?auto_365218 ) ) ( not ( = ?auto_365215 ?auto_365219 ) ) ( not ( = ?auto_365215 ?auto_365220 ) ) ( not ( = ?auto_365215 ?auto_365221 ) ) ( not ( = ?auto_365215 ?auto_365222 ) ) ( not ( = ?auto_365215 ?auto_365223 ) ) ( not ( = ?auto_365215 ?auto_365224 ) ) ( not ( = ?auto_365215 ?auto_365225 ) ) ( not ( = ?auto_365216 ?auto_365217 ) ) ( not ( = ?auto_365216 ?auto_365218 ) ) ( not ( = ?auto_365216 ?auto_365219 ) ) ( not ( = ?auto_365216 ?auto_365220 ) ) ( not ( = ?auto_365216 ?auto_365221 ) ) ( not ( = ?auto_365216 ?auto_365222 ) ) ( not ( = ?auto_365216 ?auto_365223 ) ) ( not ( = ?auto_365216 ?auto_365224 ) ) ( not ( = ?auto_365216 ?auto_365225 ) ) ( not ( = ?auto_365217 ?auto_365218 ) ) ( not ( = ?auto_365217 ?auto_365219 ) ) ( not ( = ?auto_365217 ?auto_365220 ) ) ( not ( = ?auto_365217 ?auto_365221 ) ) ( not ( = ?auto_365217 ?auto_365222 ) ) ( not ( = ?auto_365217 ?auto_365223 ) ) ( not ( = ?auto_365217 ?auto_365224 ) ) ( not ( = ?auto_365217 ?auto_365225 ) ) ( not ( = ?auto_365218 ?auto_365219 ) ) ( not ( = ?auto_365218 ?auto_365220 ) ) ( not ( = ?auto_365218 ?auto_365221 ) ) ( not ( = ?auto_365218 ?auto_365222 ) ) ( not ( = ?auto_365218 ?auto_365223 ) ) ( not ( = ?auto_365218 ?auto_365224 ) ) ( not ( = ?auto_365218 ?auto_365225 ) ) ( not ( = ?auto_365219 ?auto_365220 ) ) ( not ( = ?auto_365219 ?auto_365221 ) ) ( not ( = ?auto_365219 ?auto_365222 ) ) ( not ( = ?auto_365219 ?auto_365223 ) ) ( not ( = ?auto_365219 ?auto_365224 ) ) ( not ( = ?auto_365219 ?auto_365225 ) ) ( not ( = ?auto_365220 ?auto_365221 ) ) ( not ( = ?auto_365220 ?auto_365222 ) ) ( not ( = ?auto_365220 ?auto_365223 ) ) ( not ( = ?auto_365220 ?auto_365224 ) ) ( not ( = ?auto_365220 ?auto_365225 ) ) ( not ( = ?auto_365221 ?auto_365222 ) ) ( not ( = ?auto_365221 ?auto_365223 ) ) ( not ( = ?auto_365221 ?auto_365224 ) ) ( not ( = ?auto_365221 ?auto_365225 ) ) ( not ( = ?auto_365222 ?auto_365223 ) ) ( not ( = ?auto_365222 ?auto_365224 ) ) ( not ( = ?auto_365222 ?auto_365225 ) ) ( not ( = ?auto_365223 ?auto_365224 ) ) ( not ( = ?auto_365223 ?auto_365225 ) ) ( not ( = ?auto_365224 ?auto_365225 ) ) ( ON ?auto_365223 ?auto_365224 ) ( ON ?auto_365222 ?auto_365223 ) ( ON ?auto_365221 ?auto_365222 ) ( ON ?auto_365220 ?auto_365221 ) ( CLEAR ?auto_365218 ) ( ON ?auto_365219 ?auto_365220 ) ( CLEAR ?auto_365219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_365210 ?auto_365211 ?auto_365212 ?auto_365213 ?auto_365214 ?auto_365215 ?auto_365216 ?auto_365217 ?auto_365218 ?auto_365219 )
      ( MAKE-15PILE ?auto_365210 ?auto_365211 ?auto_365212 ?auto_365213 ?auto_365214 ?auto_365215 ?auto_365216 ?auto_365217 ?auto_365218 ?auto_365219 ?auto_365220 ?auto_365221 ?auto_365222 ?auto_365223 ?auto_365224 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_365241 - BLOCK
      ?auto_365242 - BLOCK
      ?auto_365243 - BLOCK
      ?auto_365244 - BLOCK
      ?auto_365245 - BLOCK
      ?auto_365246 - BLOCK
      ?auto_365247 - BLOCK
      ?auto_365248 - BLOCK
      ?auto_365249 - BLOCK
      ?auto_365250 - BLOCK
      ?auto_365251 - BLOCK
      ?auto_365252 - BLOCK
      ?auto_365253 - BLOCK
      ?auto_365254 - BLOCK
      ?auto_365255 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_365255 ) ( ON-TABLE ?auto_365241 ) ( ON ?auto_365242 ?auto_365241 ) ( ON ?auto_365243 ?auto_365242 ) ( ON ?auto_365244 ?auto_365243 ) ( ON ?auto_365245 ?auto_365244 ) ( ON ?auto_365246 ?auto_365245 ) ( ON ?auto_365247 ?auto_365246 ) ( ON ?auto_365248 ?auto_365247 ) ( ON ?auto_365249 ?auto_365248 ) ( not ( = ?auto_365241 ?auto_365242 ) ) ( not ( = ?auto_365241 ?auto_365243 ) ) ( not ( = ?auto_365241 ?auto_365244 ) ) ( not ( = ?auto_365241 ?auto_365245 ) ) ( not ( = ?auto_365241 ?auto_365246 ) ) ( not ( = ?auto_365241 ?auto_365247 ) ) ( not ( = ?auto_365241 ?auto_365248 ) ) ( not ( = ?auto_365241 ?auto_365249 ) ) ( not ( = ?auto_365241 ?auto_365250 ) ) ( not ( = ?auto_365241 ?auto_365251 ) ) ( not ( = ?auto_365241 ?auto_365252 ) ) ( not ( = ?auto_365241 ?auto_365253 ) ) ( not ( = ?auto_365241 ?auto_365254 ) ) ( not ( = ?auto_365241 ?auto_365255 ) ) ( not ( = ?auto_365242 ?auto_365243 ) ) ( not ( = ?auto_365242 ?auto_365244 ) ) ( not ( = ?auto_365242 ?auto_365245 ) ) ( not ( = ?auto_365242 ?auto_365246 ) ) ( not ( = ?auto_365242 ?auto_365247 ) ) ( not ( = ?auto_365242 ?auto_365248 ) ) ( not ( = ?auto_365242 ?auto_365249 ) ) ( not ( = ?auto_365242 ?auto_365250 ) ) ( not ( = ?auto_365242 ?auto_365251 ) ) ( not ( = ?auto_365242 ?auto_365252 ) ) ( not ( = ?auto_365242 ?auto_365253 ) ) ( not ( = ?auto_365242 ?auto_365254 ) ) ( not ( = ?auto_365242 ?auto_365255 ) ) ( not ( = ?auto_365243 ?auto_365244 ) ) ( not ( = ?auto_365243 ?auto_365245 ) ) ( not ( = ?auto_365243 ?auto_365246 ) ) ( not ( = ?auto_365243 ?auto_365247 ) ) ( not ( = ?auto_365243 ?auto_365248 ) ) ( not ( = ?auto_365243 ?auto_365249 ) ) ( not ( = ?auto_365243 ?auto_365250 ) ) ( not ( = ?auto_365243 ?auto_365251 ) ) ( not ( = ?auto_365243 ?auto_365252 ) ) ( not ( = ?auto_365243 ?auto_365253 ) ) ( not ( = ?auto_365243 ?auto_365254 ) ) ( not ( = ?auto_365243 ?auto_365255 ) ) ( not ( = ?auto_365244 ?auto_365245 ) ) ( not ( = ?auto_365244 ?auto_365246 ) ) ( not ( = ?auto_365244 ?auto_365247 ) ) ( not ( = ?auto_365244 ?auto_365248 ) ) ( not ( = ?auto_365244 ?auto_365249 ) ) ( not ( = ?auto_365244 ?auto_365250 ) ) ( not ( = ?auto_365244 ?auto_365251 ) ) ( not ( = ?auto_365244 ?auto_365252 ) ) ( not ( = ?auto_365244 ?auto_365253 ) ) ( not ( = ?auto_365244 ?auto_365254 ) ) ( not ( = ?auto_365244 ?auto_365255 ) ) ( not ( = ?auto_365245 ?auto_365246 ) ) ( not ( = ?auto_365245 ?auto_365247 ) ) ( not ( = ?auto_365245 ?auto_365248 ) ) ( not ( = ?auto_365245 ?auto_365249 ) ) ( not ( = ?auto_365245 ?auto_365250 ) ) ( not ( = ?auto_365245 ?auto_365251 ) ) ( not ( = ?auto_365245 ?auto_365252 ) ) ( not ( = ?auto_365245 ?auto_365253 ) ) ( not ( = ?auto_365245 ?auto_365254 ) ) ( not ( = ?auto_365245 ?auto_365255 ) ) ( not ( = ?auto_365246 ?auto_365247 ) ) ( not ( = ?auto_365246 ?auto_365248 ) ) ( not ( = ?auto_365246 ?auto_365249 ) ) ( not ( = ?auto_365246 ?auto_365250 ) ) ( not ( = ?auto_365246 ?auto_365251 ) ) ( not ( = ?auto_365246 ?auto_365252 ) ) ( not ( = ?auto_365246 ?auto_365253 ) ) ( not ( = ?auto_365246 ?auto_365254 ) ) ( not ( = ?auto_365246 ?auto_365255 ) ) ( not ( = ?auto_365247 ?auto_365248 ) ) ( not ( = ?auto_365247 ?auto_365249 ) ) ( not ( = ?auto_365247 ?auto_365250 ) ) ( not ( = ?auto_365247 ?auto_365251 ) ) ( not ( = ?auto_365247 ?auto_365252 ) ) ( not ( = ?auto_365247 ?auto_365253 ) ) ( not ( = ?auto_365247 ?auto_365254 ) ) ( not ( = ?auto_365247 ?auto_365255 ) ) ( not ( = ?auto_365248 ?auto_365249 ) ) ( not ( = ?auto_365248 ?auto_365250 ) ) ( not ( = ?auto_365248 ?auto_365251 ) ) ( not ( = ?auto_365248 ?auto_365252 ) ) ( not ( = ?auto_365248 ?auto_365253 ) ) ( not ( = ?auto_365248 ?auto_365254 ) ) ( not ( = ?auto_365248 ?auto_365255 ) ) ( not ( = ?auto_365249 ?auto_365250 ) ) ( not ( = ?auto_365249 ?auto_365251 ) ) ( not ( = ?auto_365249 ?auto_365252 ) ) ( not ( = ?auto_365249 ?auto_365253 ) ) ( not ( = ?auto_365249 ?auto_365254 ) ) ( not ( = ?auto_365249 ?auto_365255 ) ) ( not ( = ?auto_365250 ?auto_365251 ) ) ( not ( = ?auto_365250 ?auto_365252 ) ) ( not ( = ?auto_365250 ?auto_365253 ) ) ( not ( = ?auto_365250 ?auto_365254 ) ) ( not ( = ?auto_365250 ?auto_365255 ) ) ( not ( = ?auto_365251 ?auto_365252 ) ) ( not ( = ?auto_365251 ?auto_365253 ) ) ( not ( = ?auto_365251 ?auto_365254 ) ) ( not ( = ?auto_365251 ?auto_365255 ) ) ( not ( = ?auto_365252 ?auto_365253 ) ) ( not ( = ?auto_365252 ?auto_365254 ) ) ( not ( = ?auto_365252 ?auto_365255 ) ) ( not ( = ?auto_365253 ?auto_365254 ) ) ( not ( = ?auto_365253 ?auto_365255 ) ) ( not ( = ?auto_365254 ?auto_365255 ) ) ( ON ?auto_365254 ?auto_365255 ) ( ON ?auto_365253 ?auto_365254 ) ( ON ?auto_365252 ?auto_365253 ) ( ON ?auto_365251 ?auto_365252 ) ( CLEAR ?auto_365249 ) ( ON ?auto_365250 ?auto_365251 ) ( CLEAR ?auto_365250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_365241 ?auto_365242 ?auto_365243 ?auto_365244 ?auto_365245 ?auto_365246 ?auto_365247 ?auto_365248 ?auto_365249 ?auto_365250 )
      ( MAKE-15PILE ?auto_365241 ?auto_365242 ?auto_365243 ?auto_365244 ?auto_365245 ?auto_365246 ?auto_365247 ?auto_365248 ?auto_365249 ?auto_365250 ?auto_365251 ?auto_365252 ?auto_365253 ?auto_365254 ?auto_365255 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_365271 - BLOCK
      ?auto_365272 - BLOCK
      ?auto_365273 - BLOCK
      ?auto_365274 - BLOCK
      ?auto_365275 - BLOCK
      ?auto_365276 - BLOCK
      ?auto_365277 - BLOCK
      ?auto_365278 - BLOCK
      ?auto_365279 - BLOCK
      ?auto_365280 - BLOCK
      ?auto_365281 - BLOCK
      ?auto_365282 - BLOCK
      ?auto_365283 - BLOCK
      ?auto_365284 - BLOCK
      ?auto_365285 - BLOCK
    )
    :vars
    (
      ?auto_365286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_365285 ?auto_365286 ) ( ON-TABLE ?auto_365271 ) ( ON ?auto_365272 ?auto_365271 ) ( ON ?auto_365273 ?auto_365272 ) ( ON ?auto_365274 ?auto_365273 ) ( ON ?auto_365275 ?auto_365274 ) ( ON ?auto_365276 ?auto_365275 ) ( ON ?auto_365277 ?auto_365276 ) ( ON ?auto_365278 ?auto_365277 ) ( not ( = ?auto_365271 ?auto_365272 ) ) ( not ( = ?auto_365271 ?auto_365273 ) ) ( not ( = ?auto_365271 ?auto_365274 ) ) ( not ( = ?auto_365271 ?auto_365275 ) ) ( not ( = ?auto_365271 ?auto_365276 ) ) ( not ( = ?auto_365271 ?auto_365277 ) ) ( not ( = ?auto_365271 ?auto_365278 ) ) ( not ( = ?auto_365271 ?auto_365279 ) ) ( not ( = ?auto_365271 ?auto_365280 ) ) ( not ( = ?auto_365271 ?auto_365281 ) ) ( not ( = ?auto_365271 ?auto_365282 ) ) ( not ( = ?auto_365271 ?auto_365283 ) ) ( not ( = ?auto_365271 ?auto_365284 ) ) ( not ( = ?auto_365271 ?auto_365285 ) ) ( not ( = ?auto_365271 ?auto_365286 ) ) ( not ( = ?auto_365272 ?auto_365273 ) ) ( not ( = ?auto_365272 ?auto_365274 ) ) ( not ( = ?auto_365272 ?auto_365275 ) ) ( not ( = ?auto_365272 ?auto_365276 ) ) ( not ( = ?auto_365272 ?auto_365277 ) ) ( not ( = ?auto_365272 ?auto_365278 ) ) ( not ( = ?auto_365272 ?auto_365279 ) ) ( not ( = ?auto_365272 ?auto_365280 ) ) ( not ( = ?auto_365272 ?auto_365281 ) ) ( not ( = ?auto_365272 ?auto_365282 ) ) ( not ( = ?auto_365272 ?auto_365283 ) ) ( not ( = ?auto_365272 ?auto_365284 ) ) ( not ( = ?auto_365272 ?auto_365285 ) ) ( not ( = ?auto_365272 ?auto_365286 ) ) ( not ( = ?auto_365273 ?auto_365274 ) ) ( not ( = ?auto_365273 ?auto_365275 ) ) ( not ( = ?auto_365273 ?auto_365276 ) ) ( not ( = ?auto_365273 ?auto_365277 ) ) ( not ( = ?auto_365273 ?auto_365278 ) ) ( not ( = ?auto_365273 ?auto_365279 ) ) ( not ( = ?auto_365273 ?auto_365280 ) ) ( not ( = ?auto_365273 ?auto_365281 ) ) ( not ( = ?auto_365273 ?auto_365282 ) ) ( not ( = ?auto_365273 ?auto_365283 ) ) ( not ( = ?auto_365273 ?auto_365284 ) ) ( not ( = ?auto_365273 ?auto_365285 ) ) ( not ( = ?auto_365273 ?auto_365286 ) ) ( not ( = ?auto_365274 ?auto_365275 ) ) ( not ( = ?auto_365274 ?auto_365276 ) ) ( not ( = ?auto_365274 ?auto_365277 ) ) ( not ( = ?auto_365274 ?auto_365278 ) ) ( not ( = ?auto_365274 ?auto_365279 ) ) ( not ( = ?auto_365274 ?auto_365280 ) ) ( not ( = ?auto_365274 ?auto_365281 ) ) ( not ( = ?auto_365274 ?auto_365282 ) ) ( not ( = ?auto_365274 ?auto_365283 ) ) ( not ( = ?auto_365274 ?auto_365284 ) ) ( not ( = ?auto_365274 ?auto_365285 ) ) ( not ( = ?auto_365274 ?auto_365286 ) ) ( not ( = ?auto_365275 ?auto_365276 ) ) ( not ( = ?auto_365275 ?auto_365277 ) ) ( not ( = ?auto_365275 ?auto_365278 ) ) ( not ( = ?auto_365275 ?auto_365279 ) ) ( not ( = ?auto_365275 ?auto_365280 ) ) ( not ( = ?auto_365275 ?auto_365281 ) ) ( not ( = ?auto_365275 ?auto_365282 ) ) ( not ( = ?auto_365275 ?auto_365283 ) ) ( not ( = ?auto_365275 ?auto_365284 ) ) ( not ( = ?auto_365275 ?auto_365285 ) ) ( not ( = ?auto_365275 ?auto_365286 ) ) ( not ( = ?auto_365276 ?auto_365277 ) ) ( not ( = ?auto_365276 ?auto_365278 ) ) ( not ( = ?auto_365276 ?auto_365279 ) ) ( not ( = ?auto_365276 ?auto_365280 ) ) ( not ( = ?auto_365276 ?auto_365281 ) ) ( not ( = ?auto_365276 ?auto_365282 ) ) ( not ( = ?auto_365276 ?auto_365283 ) ) ( not ( = ?auto_365276 ?auto_365284 ) ) ( not ( = ?auto_365276 ?auto_365285 ) ) ( not ( = ?auto_365276 ?auto_365286 ) ) ( not ( = ?auto_365277 ?auto_365278 ) ) ( not ( = ?auto_365277 ?auto_365279 ) ) ( not ( = ?auto_365277 ?auto_365280 ) ) ( not ( = ?auto_365277 ?auto_365281 ) ) ( not ( = ?auto_365277 ?auto_365282 ) ) ( not ( = ?auto_365277 ?auto_365283 ) ) ( not ( = ?auto_365277 ?auto_365284 ) ) ( not ( = ?auto_365277 ?auto_365285 ) ) ( not ( = ?auto_365277 ?auto_365286 ) ) ( not ( = ?auto_365278 ?auto_365279 ) ) ( not ( = ?auto_365278 ?auto_365280 ) ) ( not ( = ?auto_365278 ?auto_365281 ) ) ( not ( = ?auto_365278 ?auto_365282 ) ) ( not ( = ?auto_365278 ?auto_365283 ) ) ( not ( = ?auto_365278 ?auto_365284 ) ) ( not ( = ?auto_365278 ?auto_365285 ) ) ( not ( = ?auto_365278 ?auto_365286 ) ) ( not ( = ?auto_365279 ?auto_365280 ) ) ( not ( = ?auto_365279 ?auto_365281 ) ) ( not ( = ?auto_365279 ?auto_365282 ) ) ( not ( = ?auto_365279 ?auto_365283 ) ) ( not ( = ?auto_365279 ?auto_365284 ) ) ( not ( = ?auto_365279 ?auto_365285 ) ) ( not ( = ?auto_365279 ?auto_365286 ) ) ( not ( = ?auto_365280 ?auto_365281 ) ) ( not ( = ?auto_365280 ?auto_365282 ) ) ( not ( = ?auto_365280 ?auto_365283 ) ) ( not ( = ?auto_365280 ?auto_365284 ) ) ( not ( = ?auto_365280 ?auto_365285 ) ) ( not ( = ?auto_365280 ?auto_365286 ) ) ( not ( = ?auto_365281 ?auto_365282 ) ) ( not ( = ?auto_365281 ?auto_365283 ) ) ( not ( = ?auto_365281 ?auto_365284 ) ) ( not ( = ?auto_365281 ?auto_365285 ) ) ( not ( = ?auto_365281 ?auto_365286 ) ) ( not ( = ?auto_365282 ?auto_365283 ) ) ( not ( = ?auto_365282 ?auto_365284 ) ) ( not ( = ?auto_365282 ?auto_365285 ) ) ( not ( = ?auto_365282 ?auto_365286 ) ) ( not ( = ?auto_365283 ?auto_365284 ) ) ( not ( = ?auto_365283 ?auto_365285 ) ) ( not ( = ?auto_365283 ?auto_365286 ) ) ( not ( = ?auto_365284 ?auto_365285 ) ) ( not ( = ?auto_365284 ?auto_365286 ) ) ( not ( = ?auto_365285 ?auto_365286 ) ) ( ON ?auto_365284 ?auto_365285 ) ( ON ?auto_365283 ?auto_365284 ) ( ON ?auto_365282 ?auto_365283 ) ( ON ?auto_365281 ?auto_365282 ) ( ON ?auto_365280 ?auto_365281 ) ( CLEAR ?auto_365278 ) ( ON ?auto_365279 ?auto_365280 ) ( CLEAR ?auto_365279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_365271 ?auto_365272 ?auto_365273 ?auto_365274 ?auto_365275 ?auto_365276 ?auto_365277 ?auto_365278 ?auto_365279 )
      ( MAKE-15PILE ?auto_365271 ?auto_365272 ?auto_365273 ?auto_365274 ?auto_365275 ?auto_365276 ?auto_365277 ?auto_365278 ?auto_365279 ?auto_365280 ?auto_365281 ?auto_365282 ?auto_365283 ?auto_365284 ?auto_365285 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_365302 - BLOCK
      ?auto_365303 - BLOCK
      ?auto_365304 - BLOCK
      ?auto_365305 - BLOCK
      ?auto_365306 - BLOCK
      ?auto_365307 - BLOCK
      ?auto_365308 - BLOCK
      ?auto_365309 - BLOCK
      ?auto_365310 - BLOCK
      ?auto_365311 - BLOCK
      ?auto_365312 - BLOCK
      ?auto_365313 - BLOCK
      ?auto_365314 - BLOCK
      ?auto_365315 - BLOCK
      ?auto_365316 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_365316 ) ( ON-TABLE ?auto_365302 ) ( ON ?auto_365303 ?auto_365302 ) ( ON ?auto_365304 ?auto_365303 ) ( ON ?auto_365305 ?auto_365304 ) ( ON ?auto_365306 ?auto_365305 ) ( ON ?auto_365307 ?auto_365306 ) ( ON ?auto_365308 ?auto_365307 ) ( ON ?auto_365309 ?auto_365308 ) ( not ( = ?auto_365302 ?auto_365303 ) ) ( not ( = ?auto_365302 ?auto_365304 ) ) ( not ( = ?auto_365302 ?auto_365305 ) ) ( not ( = ?auto_365302 ?auto_365306 ) ) ( not ( = ?auto_365302 ?auto_365307 ) ) ( not ( = ?auto_365302 ?auto_365308 ) ) ( not ( = ?auto_365302 ?auto_365309 ) ) ( not ( = ?auto_365302 ?auto_365310 ) ) ( not ( = ?auto_365302 ?auto_365311 ) ) ( not ( = ?auto_365302 ?auto_365312 ) ) ( not ( = ?auto_365302 ?auto_365313 ) ) ( not ( = ?auto_365302 ?auto_365314 ) ) ( not ( = ?auto_365302 ?auto_365315 ) ) ( not ( = ?auto_365302 ?auto_365316 ) ) ( not ( = ?auto_365303 ?auto_365304 ) ) ( not ( = ?auto_365303 ?auto_365305 ) ) ( not ( = ?auto_365303 ?auto_365306 ) ) ( not ( = ?auto_365303 ?auto_365307 ) ) ( not ( = ?auto_365303 ?auto_365308 ) ) ( not ( = ?auto_365303 ?auto_365309 ) ) ( not ( = ?auto_365303 ?auto_365310 ) ) ( not ( = ?auto_365303 ?auto_365311 ) ) ( not ( = ?auto_365303 ?auto_365312 ) ) ( not ( = ?auto_365303 ?auto_365313 ) ) ( not ( = ?auto_365303 ?auto_365314 ) ) ( not ( = ?auto_365303 ?auto_365315 ) ) ( not ( = ?auto_365303 ?auto_365316 ) ) ( not ( = ?auto_365304 ?auto_365305 ) ) ( not ( = ?auto_365304 ?auto_365306 ) ) ( not ( = ?auto_365304 ?auto_365307 ) ) ( not ( = ?auto_365304 ?auto_365308 ) ) ( not ( = ?auto_365304 ?auto_365309 ) ) ( not ( = ?auto_365304 ?auto_365310 ) ) ( not ( = ?auto_365304 ?auto_365311 ) ) ( not ( = ?auto_365304 ?auto_365312 ) ) ( not ( = ?auto_365304 ?auto_365313 ) ) ( not ( = ?auto_365304 ?auto_365314 ) ) ( not ( = ?auto_365304 ?auto_365315 ) ) ( not ( = ?auto_365304 ?auto_365316 ) ) ( not ( = ?auto_365305 ?auto_365306 ) ) ( not ( = ?auto_365305 ?auto_365307 ) ) ( not ( = ?auto_365305 ?auto_365308 ) ) ( not ( = ?auto_365305 ?auto_365309 ) ) ( not ( = ?auto_365305 ?auto_365310 ) ) ( not ( = ?auto_365305 ?auto_365311 ) ) ( not ( = ?auto_365305 ?auto_365312 ) ) ( not ( = ?auto_365305 ?auto_365313 ) ) ( not ( = ?auto_365305 ?auto_365314 ) ) ( not ( = ?auto_365305 ?auto_365315 ) ) ( not ( = ?auto_365305 ?auto_365316 ) ) ( not ( = ?auto_365306 ?auto_365307 ) ) ( not ( = ?auto_365306 ?auto_365308 ) ) ( not ( = ?auto_365306 ?auto_365309 ) ) ( not ( = ?auto_365306 ?auto_365310 ) ) ( not ( = ?auto_365306 ?auto_365311 ) ) ( not ( = ?auto_365306 ?auto_365312 ) ) ( not ( = ?auto_365306 ?auto_365313 ) ) ( not ( = ?auto_365306 ?auto_365314 ) ) ( not ( = ?auto_365306 ?auto_365315 ) ) ( not ( = ?auto_365306 ?auto_365316 ) ) ( not ( = ?auto_365307 ?auto_365308 ) ) ( not ( = ?auto_365307 ?auto_365309 ) ) ( not ( = ?auto_365307 ?auto_365310 ) ) ( not ( = ?auto_365307 ?auto_365311 ) ) ( not ( = ?auto_365307 ?auto_365312 ) ) ( not ( = ?auto_365307 ?auto_365313 ) ) ( not ( = ?auto_365307 ?auto_365314 ) ) ( not ( = ?auto_365307 ?auto_365315 ) ) ( not ( = ?auto_365307 ?auto_365316 ) ) ( not ( = ?auto_365308 ?auto_365309 ) ) ( not ( = ?auto_365308 ?auto_365310 ) ) ( not ( = ?auto_365308 ?auto_365311 ) ) ( not ( = ?auto_365308 ?auto_365312 ) ) ( not ( = ?auto_365308 ?auto_365313 ) ) ( not ( = ?auto_365308 ?auto_365314 ) ) ( not ( = ?auto_365308 ?auto_365315 ) ) ( not ( = ?auto_365308 ?auto_365316 ) ) ( not ( = ?auto_365309 ?auto_365310 ) ) ( not ( = ?auto_365309 ?auto_365311 ) ) ( not ( = ?auto_365309 ?auto_365312 ) ) ( not ( = ?auto_365309 ?auto_365313 ) ) ( not ( = ?auto_365309 ?auto_365314 ) ) ( not ( = ?auto_365309 ?auto_365315 ) ) ( not ( = ?auto_365309 ?auto_365316 ) ) ( not ( = ?auto_365310 ?auto_365311 ) ) ( not ( = ?auto_365310 ?auto_365312 ) ) ( not ( = ?auto_365310 ?auto_365313 ) ) ( not ( = ?auto_365310 ?auto_365314 ) ) ( not ( = ?auto_365310 ?auto_365315 ) ) ( not ( = ?auto_365310 ?auto_365316 ) ) ( not ( = ?auto_365311 ?auto_365312 ) ) ( not ( = ?auto_365311 ?auto_365313 ) ) ( not ( = ?auto_365311 ?auto_365314 ) ) ( not ( = ?auto_365311 ?auto_365315 ) ) ( not ( = ?auto_365311 ?auto_365316 ) ) ( not ( = ?auto_365312 ?auto_365313 ) ) ( not ( = ?auto_365312 ?auto_365314 ) ) ( not ( = ?auto_365312 ?auto_365315 ) ) ( not ( = ?auto_365312 ?auto_365316 ) ) ( not ( = ?auto_365313 ?auto_365314 ) ) ( not ( = ?auto_365313 ?auto_365315 ) ) ( not ( = ?auto_365313 ?auto_365316 ) ) ( not ( = ?auto_365314 ?auto_365315 ) ) ( not ( = ?auto_365314 ?auto_365316 ) ) ( not ( = ?auto_365315 ?auto_365316 ) ) ( ON ?auto_365315 ?auto_365316 ) ( ON ?auto_365314 ?auto_365315 ) ( ON ?auto_365313 ?auto_365314 ) ( ON ?auto_365312 ?auto_365313 ) ( ON ?auto_365311 ?auto_365312 ) ( CLEAR ?auto_365309 ) ( ON ?auto_365310 ?auto_365311 ) ( CLEAR ?auto_365310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_365302 ?auto_365303 ?auto_365304 ?auto_365305 ?auto_365306 ?auto_365307 ?auto_365308 ?auto_365309 ?auto_365310 )
      ( MAKE-15PILE ?auto_365302 ?auto_365303 ?auto_365304 ?auto_365305 ?auto_365306 ?auto_365307 ?auto_365308 ?auto_365309 ?auto_365310 ?auto_365311 ?auto_365312 ?auto_365313 ?auto_365314 ?auto_365315 ?auto_365316 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_365332 - BLOCK
      ?auto_365333 - BLOCK
      ?auto_365334 - BLOCK
      ?auto_365335 - BLOCK
      ?auto_365336 - BLOCK
      ?auto_365337 - BLOCK
      ?auto_365338 - BLOCK
      ?auto_365339 - BLOCK
      ?auto_365340 - BLOCK
      ?auto_365341 - BLOCK
      ?auto_365342 - BLOCK
      ?auto_365343 - BLOCK
      ?auto_365344 - BLOCK
      ?auto_365345 - BLOCK
      ?auto_365346 - BLOCK
    )
    :vars
    (
      ?auto_365347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_365346 ?auto_365347 ) ( ON-TABLE ?auto_365332 ) ( ON ?auto_365333 ?auto_365332 ) ( ON ?auto_365334 ?auto_365333 ) ( ON ?auto_365335 ?auto_365334 ) ( ON ?auto_365336 ?auto_365335 ) ( ON ?auto_365337 ?auto_365336 ) ( ON ?auto_365338 ?auto_365337 ) ( not ( = ?auto_365332 ?auto_365333 ) ) ( not ( = ?auto_365332 ?auto_365334 ) ) ( not ( = ?auto_365332 ?auto_365335 ) ) ( not ( = ?auto_365332 ?auto_365336 ) ) ( not ( = ?auto_365332 ?auto_365337 ) ) ( not ( = ?auto_365332 ?auto_365338 ) ) ( not ( = ?auto_365332 ?auto_365339 ) ) ( not ( = ?auto_365332 ?auto_365340 ) ) ( not ( = ?auto_365332 ?auto_365341 ) ) ( not ( = ?auto_365332 ?auto_365342 ) ) ( not ( = ?auto_365332 ?auto_365343 ) ) ( not ( = ?auto_365332 ?auto_365344 ) ) ( not ( = ?auto_365332 ?auto_365345 ) ) ( not ( = ?auto_365332 ?auto_365346 ) ) ( not ( = ?auto_365332 ?auto_365347 ) ) ( not ( = ?auto_365333 ?auto_365334 ) ) ( not ( = ?auto_365333 ?auto_365335 ) ) ( not ( = ?auto_365333 ?auto_365336 ) ) ( not ( = ?auto_365333 ?auto_365337 ) ) ( not ( = ?auto_365333 ?auto_365338 ) ) ( not ( = ?auto_365333 ?auto_365339 ) ) ( not ( = ?auto_365333 ?auto_365340 ) ) ( not ( = ?auto_365333 ?auto_365341 ) ) ( not ( = ?auto_365333 ?auto_365342 ) ) ( not ( = ?auto_365333 ?auto_365343 ) ) ( not ( = ?auto_365333 ?auto_365344 ) ) ( not ( = ?auto_365333 ?auto_365345 ) ) ( not ( = ?auto_365333 ?auto_365346 ) ) ( not ( = ?auto_365333 ?auto_365347 ) ) ( not ( = ?auto_365334 ?auto_365335 ) ) ( not ( = ?auto_365334 ?auto_365336 ) ) ( not ( = ?auto_365334 ?auto_365337 ) ) ( not ( = ?auto_365334 ?auto_365338 ) ) ( not ( = ?auto_365334 ?auto_365339 ) ) ( not ( = ?auto_365334 ?auto_365340 ) ) ( not ( = ?auto_365334 ?auto_365341 ) ) ( not ( = ?auto_365334 ?auto_365342 ) ) ( not ( = ?auto_365334 ?auto_365343 ) ) ( not ( = ?auto_365334 ?auto_365344 ) ) ( not ( = ?auto_365334 ?auto_365345 ) ) ( not ( = ?auto_365334 ?auto_365346 ) ) ( not ( = ?auto_365334 ?auto_365347 ) ) ( not ( = ?auto_365335 ?auto_365336 ) ) ( not ( = ?auto_365335 ?auto_365337 ) ) ( not ( = ?auto_365335 ?auto_365338 ) ) ( not ( = ?auto_365335 ?auto_365339 ) ) ( not ( = ?auto_365335 ?auto_365340 ) ) ( not ( = ?auto_365335 ?auto_365341 ) ) ( not ( = ?auto_365335 ?auto_365342 ) ) ( not ( = ?auto_365335 ?auto_365343 ) ) ( not ( = ?auto_365335 ?auto_365344 ) ) ( not ( = ?auto_365335 ?auto_365345 ) ) ( not ( = ?auto_365335 ?auto_365346 ) ) ( not ( = ?auto_365335 ?auto_365347 ) ) ( not ( = ?auto_365336 ?auto_365337 ) ) ( not ( = ?auto_365336 ?auto_365338 ) ) ( not ( = ?auto_365336 ?auto_365339 ) ) ( not ( = ?auto_365336 ?auto_365340 ) ) ( not ( = ?auto_365336 ?auto_365341 ) ) ( not ( = ?auto_365336 ?auto_365342 ) ) ( not ( = ?auto_365336 ?auto_365343 ) ) ( not ( = ?auto_365336 ?auto_365344 ) ) ( not ( = ?auto_365336 ?auto_365345 ) ) ( not ( = ?auto_365336 ?auto_365346 ) ) ( not ( = ?auto_365336 ?auto_365347 ) ) ( not ( = ?auto_365337 ?auto_365338 ) ) ( not ( = ?auto_365337 ?auto_365339 ) ) ( not ( = ?auto_365337 ?auto_365340 ) ) ( not ( = ?auto_365337 ?auto_365341 ) ) ( not ( = ?auto_365337 ?auto_365342 ) ) ( not ( = ?auto_365337 ?auto_365343 ) ) ( not ( = ?auto_365337 ?auto_365344 ) ) ( not ( = ?auto_365337 ?auto_365345 ) ) ( not ( = ?auto_365337 ?auto_365346 ) ) ( not ( = ?auto_365337 ?auto_365347 ) ) ( not ( = ?auto_365338 ?auto_365339 ) ) ( not ( = ?auto_365338 ?auto_365340 ) ) ( not ( = ?auto_365338 ?auto_365341 ) ) ( not ( = ?auto_365338 ?auto_365342 ) ) ( not ( = ?auto_365338 ?auto_365343 ) ) ( not ( = ?auto_365338 ?auto_365344 ) ) ( not ( = ?auto_365338 ?auto_365345 ) ) ( not ( = ?auto_365338 ?auto_365346 ) ) ( not ( = ?auto_365338 ?auto_365347 ) ) ( not ( = ?auto_365339 ?auto_365340 ) ) ( not ( = ?auto_365339 ?auto_365341 ) ) ( not ( = ?auto_365339 ?auto_365342 ) ) ( not ( = ?auto_365339 ?auto_365343 ) ) ( not ( = ?auto_365339 ?auto_365344 ) ) ( not ( = ?auto_365339 ?auto_365345 ) ) ( not ( = ?auto_365339 ?auto_365346 ) ) ( not ( = ?auto_365339 ?auto_365347 ) ) ( not ( = ?auto_365340 ?auto_365341 ) ) ( not ( = ?auto_365340 ?auto_365342 ) ) ( not ( = ?auto_365340 ?auto_365343 ) ) ( not ( = ?auto_365340 ?auto_365344 ) ) ( not ( = ?auto_365340 ?auto_365345 ) ) ( not ( = ?auto_365340 ?auto_365346 ) ) ( not ( = ?auto_365340 ?auto_365347 ) ) ( not ( = ?auto_365341 ?auto_365342 ) ) ( not ( = ?auto_365341 ?auto_365343 ) ) ( not ( = ?auto_365341 ?auto_365344 ) ) ( not ( = ?auto_365341 ?auto_365345 ) ) ( not ( = ?auto_365341 ?auto_365346 ) ) ( not ( = ?auto_365341 ?auto_365347 ) ) ( not ( = ?auto_365342 ?auto_365343 ) ) ( not ( = ?auto_365342 ?auto_365344 ) ) ( not ( = ?auto_365342 ?auto_365345 ) ) ( not ( = ?auto_365342 ?auto_365346 ) ) ( not ( = ?auto_365342 ?auto_365347 ) ) ( not ( = ?auto_365343 ?auto_365344 ) ) ( not ( = ?auto_365343 ?auto_365345 ) ) ( not ( = ?auto_365343 ?auto_365346 ) ) ( not ( = ?auto_365343 ?auto_365347 ) ) ( not ( = ?auto_365344 ?auto_365345 ) ) ( not ( = ?auto_365344 ?auto_365346 ) ) ( not ( = ?auto_365344 ?auto_365347 ) ) ( not ( = ?auto_365345 ?auto_365346 ) ) ( not ( = ?auto_365345 ?auto_365347 ) ) ( not ( = ?auto_365346 ?auto_365347 ) ) ( ON ?auto_365345 ?auto_365346 ) ( ON ?auto_365344 ?auto_365345 ) ( ON ?auto_365343 ?auto_365344 ) ( ON ?auto_365342 ?auto_365343 ) ( ON ?auto_365341 ?auto_365342 ) ( ON ?auto_365340 ?auto_365341 ) ( CLEAR ?auto_365338 ) ( ON ?auto_365339 ?auto_365340 ) ( CLEAR ?auto_365339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_365332 ?auto_365333 ?auto_365334 ?auto_365335 ?auto_365336 ?auto_365337 ?auto_365338 ?auto_365339 )
      ( MAKE-15PILE ?auto_365332 ?auto_365333 ?auto_365334 ?auto_365335 ?auto_365336 ?auto_365337 ?auto_365338 ?auto_365339 ?auto_365340 ?auto_365341 ?auto_365342 ?auto_365343 ?auto_365344 ?auto_365345 ?auto_365346 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_365363 - BLOCK
      ?auto_365364 - BLOCK
      ?auto_365365 - BLOCK
      ?auto_365366 - BLOCK
      ?auto_365367 - BLOCK
      ?auto_365368 - BLOCK
      ?auto_365369 - BLOCK
      ?auto_365370 - BLOCK
      ?auto_365371 - BLOCK
      ?auto_365372 - BLOCK
      ?auto_365373 - BLOCK
      ?auto_365374 - BLOCK
      ?auto_365375 - BLOCK
      ?auto_365376 - BLOCK
      ?auto_365377 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_365377 ) ( ON-TABLE ?auto_365363 ) ( ON ?auto_365364 ?auto_365363 ) ( ON ?auto_365365 ?auto_365364 ) ( ON ?auto_365366 ?auto_365365 ) ( ON ?auto_365367 ?auto_365366 ) ( ON ?auto_365368 ?auto_365367 ) ( ON ?auto_365369 ?auto_365368 ) ( not ( = ?auto_365363 ?auto_365364 ) ) ( not ( = ?auto_365363 ?auto_365365 ) ) ( not ( = ?auto_365363 ?auto_365366 ) ) ( not ( = ?auto_365363 ?auto_365367 ) ) ( not ( = ?auto_365363 ?auto_365368 ) ) ( not ( = ?auto_365363 ?auto_365369 ) ) ( not ( = ?auto_365363 ?auto_365370 ) ) ( not ( = ?auto_365363 ?auto_365371 ) ) ( not ( = ?auto_365363 ?auto_365372 ) ) ( not ( = ?auto_365363 ?auto_365373 ) ) ( not ( = ?auto_365363 ?auto_365374 ) ) ( not ( = ?auto_365363 ?auto_365375 ) ) ( not ( = ?auto_365363 ?auto_365376 ) ) ( not ( = ?auto_365363 ?auto_365377 ) ) ( not ( = ?auto_365364 ?auto_365365 ) ) ( not ( = ?auto_365364 ?auto_365366 ) ) ( not ( = ?auto_365364 ?auto_365367 ) ) ( not ( = ?auto_365364 ?auto_365368 ) ) ( not ( = ?auto_365364 ?auto_365369 ) ) ( not ( = ?auto_365364 ?auto_365370 ) ) ( not ( = ?auto_365364 ?auto_365371 ) ) ( not ( = ?auto_365364 ?auto_365372 ) ) ( not ( = ?auto_365364 ?auto_365373 ) ) ( not ( = ?auto_365364 ?auto_365374 ) ) ( not ( = ?auto_365364 ?auto_365375 ) ) ( not ( = ?auto_365364 ?auto_365376 ) ) ( not ( = ?auto_365364 ?auto_365377 ) ) ( not ( = ?auto_365365 ?auto_365366 ) ) ( not ( = ?auto_365365 ?auto_365367 ) ) ( not ( = ?auto_365365 ?auto_365368 ) ) ( not ( = ?auto_365365 ?auto_365369 ) ) ( not ( = ?auto_365365 ?auto_365370 ) ) ( not ( = ?auto_365365 ?auto_365371 ) ) ( not ( = ?auto_365365 ?auto_365372 ) ) ( not ( = ?auto_365365 ?auto_365373 ) ) ( not ( = ?auto_365365 ?auto_365374 ) ) ( not ( = ?auto_365365 ?auto_365375 ) ) ( not ( = ?auto_365365 ?auto_365376 ) ) ( not ( = ?auto_365365 ?auto_365377 ) ) ( not ( = ?auto_365366 ?auto_365367 ) ) ( not ( = ?auto_365366 ?auto_365368 ) ) ( not ( = ?auto_365366 ?auto_365369 ) ) ( not ( = ?auto_365366 ?auto_365370 ) ) ( not ( = ?auto_365366 ?auto_365371 ) ) ( not ( = ?auto_365366 ?auto_365372 ) ) ( not ( = ?auto_365366 ?auto_365373 ) ) ( not ( = ?auto_365366 ?auto_365374 ) ) ( not ( = ?auto_365366 ?auto_365375 ) ) ( not ( = ?auto_365366 ?auto_365376 ) ) ( not ( = ?auto_365366 ?auto_365377 ) ) ( not ( = ?auto_365367 ?auto_365368 ) ) ( not ( = ?auto_365367 ?auto_365369 ) ) ( not ( = ?auto_365367 ?auto_365370 ) ) ( not ( = ?auto_365367 ?auto_365371 ) ) ( not ( = ?auto_365367 ?auto_365372 ) ) ( not ( = ?auto_365367 ?auto_365373 ) ) ( not ( = ?auto_365367 ?auto_365374 ) ) ( not ( = ?auto_365367 ?auto_365375 ) ) ( not ( = ?auto_365367 ?auto_365376 ) ) ( not ( = ?auto_365367 ?auto_365377 ) ) ( not ( = ?auto_365368 ?auto_365369 ) ) ( not ( = ?auto_365368 ?auto_365370 ) ) ( not ( = ?auto_365368 ?auto_365371 ) ) ( not ( = ?auto_365368 ?auto_365372 ) ) ( not ( = ?auto_365368 ?auto_365373 ) ) ( not ( = ?auto_365368 ?auto_365374 ) ) ( not ( = ?auto_365368 ?auto_365375 ) ) ( not ( = ?auto_365368 ?auto_365376 ) ) ( not ( = ?auto_365368 ?auto_365377 ) ) ( not ( = ?auto_365369 ?auto_365370 ) ) ( not ( = ?auto_365369 ?auto_365371 ) ) ( not ( = ?auto_365369 ?auto_365372 ) ) ( not ( = ?auto_365369 ?auto_365373 ) ) ( not ( = ?auto_365369 ?auto_365374 ) ) ( not ( = ?auto_365369 ?auto_365375 ) ) ( not ( = ?auto_365369 ?auto_365376 ) ) ( not ( = ?auto_365369 ?auto_365377 ) ) ( not ( = ?auto_365370 ?auto_365371 ) ) ( not ( = ?auto_365370 ?auto_365372 ) ) ( not ( = ?auto_365370 ?auto_365373 ) ) ( not ( = ?auto_365370 ?auto_365374 ) ) ( not ( = ?auto_365370 ?auto_365375 ) ) ( not ( = ?auto_365370 ?auto_365376 ) ) ( not ( = ?auto_365370 ?auto_365377 ) ) ( not ( = ?auto_365371 ?auto_365372 ) ) ( not ( = ?auto_365371 ?auto_365373 ) ) ( not ( = ?auto_365371 ?auto_365374 ) ) ( not ( = ?auto_365371 ?auto_365375 ) ) ( not ( = ?auto_365371 ?auto_365376 ) ) ( not ( = ?auto_365371 ?auto_365377 ) ) ( not ( = ?auto_365372 ?auto_365373 ) ) ( not ( = ?auto_365372 ?auto_365374 ) ) ( not ( = ?auto_365372 ?auto_365375 ) ) ( not ( = ?auto_365372 ?auto_365376 ) ) ( not ( = ?auto_365372 ?auto_365377 ) ) ( not ( = ?auto_365373 ?auto_365374 ) ) ( not ( = ?auto_365373 ?auto_365375 ) ) ( not ( = ?auto_365373 ?auto_365376 ) ) ( not ( = ?auto_365373 ?auto_365377 ) ) ( not ( = ?auto_365374 ?auto_365375 ) ) ( not ( = ?auto_365374 ?auto_365376 ) ) ( not ( = ?auto_365374 ?auto_365377 ) ) ( not ( = ?auto_365375 ?auto_365376 ) ) ( not ( = ?auto_365375 ?auto_365377 ) ) ( not ( = ?auto_365376 ?auto_365377 ) ) ( ON ?auto_365376 ?auto_365377 ) ( ON ?auto_365375 ?auto_365376 ) ( ON ?auto_365374 ?auto_365375 ) ( ON ?auto_365373 ?auto_365374 ) ( ON ?auto_365372 ?auto_365373 ) ( ON ?auto_365371 ?auto_365372 ) ( CLEAR ?auto_365369 ) ( ON ?auto_365370 ?auto_365371 ) ( CLEAR ?auto_365370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_365363 ?auto_365364 ?auto_365365 ?auto_365366 ?auto_365367 ?auto_365368 ?auto_365369 ?auto_365370 )
      ( MAKE-15PILE ?auto_365363 ?auto_365364 ?auto_365365 ?auto_365366 ?auto_365367 ?auto_365368 ?auto_365369 ?auto_365370 ?auto_365371 ?auto_365372 ?auto_365373 ?auto_365374 ?auto_365375 ?auto_365376 ?auto_365377 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_365393 - BLOCK
      ?auto_365394 - BLOCK
      ?auto_365395 - BLOCK
      ?auto_365396 - BLOCK
      ?auto_365397 - BLOCK
      ?auto_365398 - BLOCK
      ?auto_365399 - BLOCK
      ?auto_365400 - BLOCK
      ?auto_365401 - BLOCK
      ?auto_365402 - BLOCK
      ?auto_365403 - BLOCK
      ?auto_365404 - BLOCK
      ?auto_365405 - BLOCK
      ?auto_365406 - BLOCK
      ?auto_365407 - BLOCK
    )
    :vars
    (
      ?auto_365408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_365407 ?auto_365408 ) ( ON-TABLE ?auto_365393 ) ( ON ?auto_365394 ?auto_365393 ) ( ON ?auto_365395 ?auto_365394 ) ( ON ?auto_365396 ?auto_365395 ) ( ON ?auto_365397 ?auto_365396 ) ( ON ?auto_365398 ?auto_365397 ) ( not ( = ?auto_365393 ?auto_365394 ) ) ( not ( = ?auto_365393 ?auto_365395 ) ) ( not ( = ?auto_365393 ?auto_365396 ) ) ( not ( = ?auto_365393 ?auto_365397 ) ) ( not ( = ?auto_365393 ?auto_365398 ) ) ( not ( = ?auto_365393 ?auto_365399 ) ) ( not ( = ?auto_365393 ?auto_365400 ) ) ( not ( = ?auto_365393 ?auto_365401 ) ) ( not ( = ?auto_365393 ?auto_365402 ) ) ( not ( = ?auto_365393 ?auto_365403 ) ) ( not ( = ?auto_365393 ?auto_365404 ) ) ( not ( = ?auto_365393 ?auto_365405 ) ) ( not ( = ?auto_365393 ?auto_365406 ) ) ( not ( = ?auto_365393 ?auto_365407 ) ) ( not ( = ?auto_365393 ?auto_365408 ) ) ( not ( = ?auto_365394 ?auto_365395 ) ) ( not ( = ?auto_365394 ?auto_365396 ) ) ( not ( = ?auto_365394 ?auto_365397 ) ) ( not ( = ?auto_365394 ?auto_365398 ) ) ( not ( = ?auto_365394 ?auto_365399 ) ) ( not ( = ?auto_365394 ?auto_365400 ) ) ( not ( = ?auto_365394 ?auto_365401 ) ) ( not ( = ?auto_365394 ?auto_365402 ) ) ( not ( = ?auto_365394 ?auto_365403 ) ) ( not ( = ?auto_365394 ?auto_365404 ) ) ( not ( = ?auto_365394 ?auto_365405 ) ) ( not ( = ?auto_365394 ?auto_365406 ) ) ( not ( = ?auto_365394 ?auto_365407 ) ) ( not ( = ?auto_365394 ?auto_365408 ) ) ( not ( = ?auto_365395 ?auto_365396 ) ) ( not ( = ?auto_365395 ?auto_365397 ) ) ( not ( = ?auto_365395 ?auto_365398 ) ) ( not ( = ?auto_365395 ?auto_365399 ) ) ( not ( = ?auto_365395 ?auto_365400 ) ) ( not ( = ?auto_365395 ?auto_365401 ) ) ( not ( = ?auto_365395 ?auto_365402 ) ) ( not ( = ?auto_365395 ?auto_365403 ) ) ( not ( = ?auto_365395 ?auto_365404 ) ) ( not ( = ?auto_365395 ?auto_365405 ) ) ( not ( = ?auto_365395 ?auto_365406 ) ) ( not ( = ?auto_365395 ?auto_365407 ) ) ( not ( = ?auto_365395 ?auto_365408 ) ) ( not ( = ?auto_365396 ?auto_365397 ) ) ( not ( = ?auto_365396 ?auto_365398 ) ) ( not ( = ?auto_365396 ?auto_365399 ) ) ( not ( = ?auto_365396 ?auto_365400 ) ) ( not ( = ?auto_365396 ?auto_365401 ) ) ( not ( = ?auto_365396 ?auto_365402 ) ) ( not ( = ?auto_365396 ?auto_365403 ) ) ( not ( = ?auto_365396 ?auto_365404 ) ) ( not ( = ?auto_365396 ?auto_365405 ) ) ( not ( = ?auto_365396 ?auto_365406 ) ) ( not ( = ?auto_365396 ?auto_365407 ) ) ( not ( = ?auto_365396 ?auto_365408 ) ) ( not ( = ?auto_365397 ?auto_365398 ) ) ( not ( = ?auto_365397 ?auto_365399 ) ) ( not ( = ?auto_365397 ?auto_365400 ) ) ( not ( = ?auto_365397 ?auto_365401 ) ) ( not ( = ?auto_365397 ?auto_365402 ) ) ( not ( = ?auto_365397 ?auto_365403 ) ) ( not ( = ?auto_365397 ?auto_365404 ) ) ( not ( = ?auto_365397 ?auto_365405 ) ) ( not ( = ?auto_365397 ?auto_365406 ) ) ( not ( = ?auto_365397 ?auto_365407 ) ) ( not ( = ?auto_365397 ?auto_365408 ) ) ( not ( = ?auto_365398 ?auto_365399 ) ) ( not ( = ?auto_365398 ?auto_365400 ) ) ( not ( = ?auto_365398 ?auto_365401 ) ) ( not ( = ?auto_365398 ?auto_365402 ) ) ( not ( = ?auto_365398 ?auto_365403 ) ) ( not ( = ?auto_365398 ?auto_365404 ) ) ( not ( = ?auto_365398 ?auto_365405 ) ) ( not ( = ?auto_365398 ?auto_365406 ) ) ( not ( = ?auto_365398 ?auto_365407 ) ) ( not ( = ?auto_365398 ?auto_365408 ) ) ( not ( = ?auto_365399 ?auto_365400 ) ) ( not ( = ?auto_365399 ?auto_365401 ) ) ( not ( = ?auto_365399 ?auto_365402 ) ) ( not ( = ?auto_365399 ?auto_365403 ) ) ( not ( = ?auto_365399 ?auto_365404 ) ) ( not ( = ?auto_365399 ?auto_365405 ) ) ( not ( = ?auto_365399 ?auto_365406 ) ) ( not ( = ?auto_365399 ?auto_365407 ) ) ( not ( = ?auto_365399 ?auto_365408 ) ) ( not ( = ?auto_365400 ?auto_365401 ) ) ( not ( = ?auto_365400 ?auto_365402 ) ) ( not ( = ?auto_365400 ?auto_365403 ) ) ( not ( = ?auto_365400 ?auto_365404 ) ) ( not ( = ?auto_365400 ?auto_365405 ) ) ( not ( = ?auto_365400 ?auto_365406 ) ) ( not ( = ?auto_365400 ?auto_365407 ) ) ( not ( = ?auto_365400 ?auto_365408 ) ) ( not ( = ?auto_365401 ?auto_365402 ) ) ( not ( = ?auto_365401 ?auto_365403 ) ) ( not ( = ?auto_365401 ?auto_365404 ) ) ( not ( = ?auto_365401 ?auto_365405 ) ) ( not ( = ?auto_365401 ?auto_365406 ) ) ( not ( = ?auto_365401 ?auto_365407 ) ) ( not ( = ?auto_365401 ?auto_365408 ) ) ( not ( = ?auto_365402 ?auto_365403 ) ) ( not ( = ?auto_365402 ?auto_365404 ) ) ( not ( = ?auto_365402 ?auto_365405 ) ) ( not ( = ?auto_365402 ?auto_365406 ) ) ( not ( = ?auto_365402 ?auto_365407 ) ) ( not ( = ?auto_365402 ?auto_365408 ) ) ( not ( = ?auto_365403 ?auto_365404 ) ) ( not ( = ?auto_365403 ?auto_365405 ) ) ( not ( = ?auto_365403 ?auto_365406 ) ) ( not ( = ?auto_365403 ?auto_365407 ) ) ( not ( = ?auto_365403 ?auto_365408 ) ) ( not ( = ?auto_365404 ?auto_365405 ) ) ( not ( = ?auto_365404 ?auto_365406 ) ) ( not ( = ?auto_365404 ?auto_365407 ) ) ( not ( = ?auto_365404 ?auto_365408 ) ) ( not ( = ?auto_365405 ?auto_365406 ) ) ( not ( = ?auto_365405 ?auto_365407 ) ) ( not ( = ?auto_365405 ?auto_365408 ) ) ( not ( = ?auto_365406 ?auto_365407 ) ) ( not ( = ?auto_365406 ?auto_365408 ) ) ( not ( = ?auto_365407 ?auto_365408 ) ) ( ON ?auto_365406 ?auto_365407 ) ( ON ?auto_365405 ?auto_365406 ) ( ON ?auto_365404 ?auto_365405 ) ( ON ?auto_365403 ?auto_365404 ) ( ON ?auto_365402 ?auto_365403 ) ( ON ?auto_365401 ?auto_365402 ) ( ON ?auto_365400 ?auto_365401 ) ( CLEAR ?auto_365398 ) ( ON ?auto_365399 ?auto_365400 ) ( CLEAR ?auto_365399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_365393 ?auto_365394 ?auto_365395 ?auto_365396 ?auto_365397 ?auto_365398 ?auto_365399 )
      ( MAKE-15PILE ?auto_365393 ?auto_365394 ?auto_365395 ?auto_365396 ?auto_365397 ?auto_365398 ?auto_365399 ?auto_365400 ?auto_365401 ?auto_365402 ?auto_365403 ?auto_365404 ?auto_365405 ?auto_365406 ?auto_365407 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_365424 - BLOCK
      ?auto_365425 - BLOCK
      ?auto_365426 - BLOCK
      ?auto_365427 - BLOCK
      ?auto_365428 - BLOCK
      ?auto_365429 - BLOCK
      ?auto_365430 - BLOCK
      ?auto_365431 - BLOCK
      ?auto_365432 - BLOCK
      ?auto_365433 - BLOCK
      ?auto_365434 - BLOCK
      ?auto_365435 - BLOCK
      ?auto_365436 - BLOCK
      ?auto_365437 - BLOCK
      ?auto_365438 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_365438 ) ( ON-TABLE ?auto_365424 ) ( ON ?auto_365425 ?auto_365424 ) ( ON ?auto_365426 ?auto_365425 ) ( ON ?auto_365427 ?auto_365426 ) ( ON ?auto_365428 ?auto_365427 ) ( ON ?auto_365429 ?auto_365428 ) ( not ( = ?auto_365424 ?auto_365425 ) ) ( not ( = ?auto_365424 ?auto_365426 ) ) ( not ( = ?auto_365424 ?auto_365427 ) ) ( not ( = ?auto_365424 ?auto_365428 ) ) ( not ( = ?auto_365424 ?auto_365429 ) ) ( not ( = ?auto_365424 ?auto_365430 ) ) ( not ( = ?auto_365424 ?auto_365431 ) ) ( not ( = ?auto_365424 ?auto_365432 ) ) ( not ( = ?auto_365424 ?auto_365433 ) ) ( not ( = ?auto_365424 ?auto_365434 ) ) ( not ( = ?auto_365424 ?auto_365435 ) ) ( not ( = ?auto_365424 ?auto_365436 ) ) ( not ( = ?auto_365424 ?auto_365437 ) ) ( not ( = ?auto_365424 ?auto_365438 ) ) ( not ( = ?auto_365425 ?auto_365426 ) ) ( not ( = ?auto_365425 ?auto_365427 ) ) ( not ( = ?auto_365425 ?auto_365428 ) ) ( not ( = ?auto_365425 ?auto_365429 ) ) ( not ( = ?auto_365425 ?auto_365430 ) ) ( not ( = ?auto_365425 ?auto_365431 ) ) ( not ( = ?auto_365425 ?auto_365432 ) ) ( not ( = ?auto_365425 ?auto_365433 ) ) ( not ( = ?auto_365425 ?auto_365434 ) ) ( not ( = ?auto_365425 ?auto_365435 ) ) ( not ( = ?auto_365425 ?auto_365436 ) ) ( not ( = ?auto_365425 ?auto_365437 ) ) ( not ( = ?auto_365425 ?auto_365438 ) ) ( not ( = ?auto_365426 ?auto_365427 ) ) ( not ( = ?auto_365426 ?auto_365428 ) ) ( not ( = ?auto_365426 ?auto_365429 ) ) ( not ( = ?auto_365426 ?auto_365430 ) ) ( not ( = ?auto_365426 ?auto_365431 ) ) ( not ( = ?auto_365426 ?auto_365432 ) ) ( not ( = ?auto_365426 ?auto_365433 ) ) ( not ( = ?auto_365426 ?auto_365434 ) ) ( not ( = ?auto_365426 ?auto_365435 ) ) ( not ( = ?auto_365426 ?auto_365436 ) ) ( not ( = ?auto_365426 ?auto_365437 ) ) ( not ( = ?auto_365426 ?auto_365438 ) ) ( not ( = ?auto_365427 ?auto_365428 ) ) ( not ( = ?auto_365427 ?auto_365429 ) ) ( not ( = ?auto_365427 ?auto_365430 ) ) ( not ( = ?auto_365427 ?auto_365431 ) ) ( not ( = ?auto_365427 ?auto_365432 ) ) ( not ( = ?auto_365427 ?auto_365433 ) ) ( not ( = ?auto_365427 ?auto_365434 ) ) ( not ( = ?auto_365427 ?auto_365435 ) ) ( not ( = ?auto_365427 ?auto_365436 ) ) ( not ( = ?auto_365427 ?auto_365437 ) ) ( not ( = ?auto_365427 ?auto_365438 ) ) ( not ( = ?auto_365428 ?auto_365429 ) ) ( not ( = ?auto_365428 ?auto_365430 ) ) ( not ( = ?auto_365428 ?auto_365431 ) ) ( not ( = ?auto_365428 ?auto_365432 ) ) ( not ( = ?auto_365428 ?auto_365433 ) ) ( not ( = ?auto_365428 ?auto_365434 ) ) ( not ( = ?auto_365428 ?auto_365435 ) ) ( not ( = ?auto_365428 ?auto_365436 ) ) ( not ( = ?auto_365428 ?auto_365437 ) ) ( not ( = ?auto_365428 ?auto_365438 ) ) ( not ( = ?auto_365429 ?auto_365430 ) ) ( not ( = ?auto_365429 ?auto_365431 ) ) ( not ( = ?auto_365429 ?auto_365432 ) ) ( not ( = ?auto_365429 ?auto_365433 ) ) ( not ( = ?auto_365429 ?auto_365434 ) ) ( not ( = ?auto_365429 ?auto_365435 ) ) ( not ( = ?auto_365429 ?auto_365436 ) ) ( not ( = ?auto_365429 ?auto_365437 ) ) ( not ( = ?auto_365429 ?auto_365438 ) ) ( not ( = ?auto_365430 ?auto_365431 ) ) ( not ( = ?auto_365430 ?auto_365432 ) ) ( not ( = ?auto_365430 ?auto_365433 ) ) ( not ( = ?auto_365430 ?auto_365434 ) ) ( not ( = ?auto_365430 ?auto_365435 ) ) ( not ( = ?auto_365430 ?auto_365436 ) ) ( not ( = ?auto_365430 ?auto_365437 ) ) ( not ( = ?auto_365430 ?auto_365438 ) ) ( not ( = ?auto_365431 ?auto_365432 ) ) ( not ( = ?auto_365431 ?auto_365433 ) ) ( not ( = ?auto_365431 ?auto_365434 ) ) ( not ( = ?auto_365431 ?auto_365435 ) ) ( not ( = ?auto_365431 ?auto_365436 ) ) ( not ( = ?auto_365431 ?auto_365437 ) ) ( not ( = ?auto_365431 ?auto_365438 ) ) ( not ( = ?auto_365432 ?auto_365433 ) ) ( not ( = ?auto_365432 ?auto_365434 ) ) ( not ( = ?auto_365432 ?auto_365435 ) ) ( not ( = ?auto_365432 ?auto_365436 ) ) ( not ( = ?auto_365432 ?auto_365437 ) ) ( not ( = ?auto_365432 ?auto_365438 ) ) ( not ( = ?auto_365433 ?auto_365434 ) ) ( not ( = ?auto_365433 ?auto_365435 ) ) ( not ( = ?auto_365433 ?auto_365436 ) ) ( not ( = ?auto_365433 ?auto_365437 ) ) ( not ( = ?auto_365433 ?auto_365438 ) ) ( not ( = ?auto_365434 ?auto_365435 ) ) ( not ( = ?auto_365434 ?auto_365436 ) ) ( not ( = ?auto_365434 ?auto_365437 ) ) ( not ( = ?auto_365434 ?auto_365438 ) ) ( not ( = ?auto_365435 ?auto_365436 ) ) ( not ( = ?auto_365435 ?auto_365437 ) ) ( not ( = ?auto_365435 ?auto_365438 ) ) ( not ( = ?auto_365436 ?auto_365437 ) ) ( not ( = ?auto_365436 ?auto_365438 ) ) ( not ( = ?auto_365437 ?auto_365438 ) ) ( ON ?auto_365437 ?auto_365438 ) ( ON ?auto_365436 ?auto_365437 ) ( ON ?auto_365435 ?auto_365436 ) ( ON ?auto_365434 ?auto_365435 ) ( ON ?auto_365433 ?auto_365434 ) ( ON ?auto_365432 ?auto_365433 ) ( ON ?auto_365431 ?auto_365432 ) ( CLEAR ?auto_365429 ) ( ON ?auto_365430 ?auto_365431 ) ( CLEAR ?auto_365430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_365424 ?auto_365425 ?auto_365426 ?auto_365427 ?auto_365428 ?auto_365429 ?auto_365430 )
      ( MAKE-15PILE ?auto_365424 ?auto_365425 ?auto_365426 ?auto_365427 ?auto_365428 ?auto_365429 ?auto_365430 ?auto_365431 ?auto_365432 ?auto_365433 ?auto_365434 ?auto_365435 ?auto_365436 ?auto_365437 ?auto_365438 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_365454 - BLOCK
      ?auto_365455 - BLOCK
      ?auto_365456 - BLOCK
      ?auto_365457 - BLOCK
      ?auto_365458 - BLOCK
      ?auto_365459 - BLOCK
      ?auto_365460 - BLOCK
      ?auto_365461 - BLOCK
      ?auto_365462 - BLOCK
      ?auto_365463 - BLOCK
      ?auto_365464 - BLOCK
      ?auto_365465 - BLOCK
      ?auto_365466 - BLOCK
      ?auto_365467 - BLOCK
      ?auto_365468 - BLOCK
    )
    :vars
    (
      ?auto_365469 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_365468 ?auto_365469 ) ( ON-TABLE ?auto_365454 ) ( ON ?auto_365455 ?auto_365454 ) ( ON ?auto_365456 ?auto_365455 ) ( ON ?auto_365457 ?auto_365456 ) ( ON ?auto_365458 ?auto_365457 ) ( not ( = ?auto_365454 ?auto_365455 ) ) ( not ( = ?auto_365454 ?auto_365456 ) ) ( not ( = ?auto_365454 ?auto_365457 ) ) ( not ( = ?auto_365454 ?auto_365458 ) ) ( not ( = ?auto_365454 ?auto_365459 ) ) ( not ( = ?auto_365454 ?auto_365460 ) ) ( not ( = ?auto_365454 ?auto_365461 ) ) ( not ( = ?auto_365454 ?auto_365462 ) ) ( not ( = ?auto_365454 ?auto_365463 ) ) ( not ( = ?auto_365454 ?auto_365464 ) ) ( not ( = ?auto_365454 ?auto_365465 ) ) ( not ( = ?auto_365454 ?auto_365466 ) ) ( not ( = ?auto_365454 ?auto_365467 ) ) ( not ( = ?auto_365454 ?auto_365468 ) ) ( not ( = ?auto_365454 ?auto_365469 ) ) ( not ( = ?auto_365455 ?auto_365456 ) ) ( not ( = ?auto_365455 ?auto_365457 ) ) ( not ( = ?auto_365455 ?auto_365458 ) ) ( not ( = ?auto_365455 ?auto_365459 ) ) ( not ( = ?auto_365455 ?auto_365460 ) ) ( not ( = ?auto_365455 ?auto_365461 ) ) ( not ( = ?auto_365455 ?auto_365462 ) ) ( not ( = ?auto_365455 ?auto_365463 ) ) ( not ( = ?auto_365455 ?auto_365464 ) ) ( not ( = ?auto_365455 ?auto_365465 ) ) ( not ( = ?auto_365455 ?auto_365466 ) ) ( not ( = ?auto_365455 ?auto_365467 ) ) ( not ( = ?auto_365455 ?auto_365468 ) ) ( not ( = ?auto_365455 ?auto_365469 ) ) ( not ( = ?auto_365456 ?auto_365457 ) ) ( not ( = ?auto_365456 ?auto_365458 ) ) ( not ( = ?auto_365456 ?auto_365459 ) ) ( not ( = ?auto_365456 ?auto_365460 ) ) ( not ( = ?auto_365456 ?auto_365461 ) ) ( not ( = ?auto_365456 ?auto_365462 ) ) ( not ( = ?auto_365456 ?auto_365463 ) ) ( not ( = ?auto_365456 ?auto_365464 ) ) ( not ( = ?auto_365456 ?auto_365465 ) ) ( not ( = ?auto_365456 ?auto_365466 ) ) ( not ( = ?auto_365456 ?auto_365467 ) ) ( not ( = ?auto_365456 ?auto_365468 ) ) ( not ( = ?auto_365456 ?auto_365469 ) ) ( not ( = ?auto_365457 ?auto_365458 ) ) ( not ( = ?auto_365457 ?auto_365459 ) ) ( not ( = ?auto_365457 ?auto_365460 ) ) ( not ( = ?auto_365457 ?auto_365461 ) ) ( not ( = ?auto_365457 ?auto_365462 ) ) ( not ( = ?auto_365457 ?auto_365463 ) ) ( not ( = ?auto_365457 ?auto_365464 ) ) ( not ( = ?auto_365457 ?auto_365465 ) ) ( not ( = ?auto_365457 ?auto_365466 ) ) ( not ( = ?auto_365457 ?auto_365467 ) ) ( not ( = ?auto_365457 ?auto_365468 ) ) ( not ( = ?auto_365457 ?auto_365469 ) ) ( not ( = ?auto_365458 ?auto_365459 ) ) ( not ( = ?auto_365458 ?auto_365460 ) ) ( not ( = ?auto_365458 ?auto_365461 ) ) ( not ( = ?auto_365458 ?auto_365462 ) ) ( not ( = ?auto_365458 ?auto_365463 ) ) ( not ( = ?auto_365458 ?auto_365464 ) ) ( not ( = ?auto_365458 ?auto_365465 ) ) ( not ( = ?auto_365458 ?auto_365466 ) ) ( not ( = ?auto_365458 ?auto_365467 ) ) ( not ( = ?auto_365458 ?auto_365468 ) ) ( not ( = ?auto_365458 ?auto_365469 ) ) ( not ( = ?auto_365459 ?auto_365460 ) ) ( not ( = ?auto_365459 ?auto_365461 ) ) ( not ( = ?auto_365459 ?auto_365462 ) ) ( not ( = ?auto_365459 ?auto_365463 ) ) ( not ( = ?auto_365459 ?auto_365464 ) ) ( not ( = ?auto_365459 ?auto_365465 ) ) ( not ( = ?auto_365459 ?auto_365466 ) ) ( not ( = ?auto_365459 ?auto_365467 ) ) ( not ( = ?auto_365459 ?auto_365468 ) ) ( not ( = ?auto_365459 ?auto_365469 ) ) ( not ( = ?auto_365460 ?auto_365461 ) ) ( not ( = ?auto_365460 ?auto_365462 ) ) ( not ( = ?auto_365460 ?auto_365463 ) ) ( not ( = ?auto_365460 ?auto_365464 ) ) ( not ( = ?auto_365460 ?auto_365465 ) ) ( not ( = ?auto_365460 ?auto_365466 ) ) ( not ( = ?auto_365460 ?auto_365467 ) ) ( not ( = ?auto_365460 ?auto_365468 ) ) ( not ( = ?auto_365460 ?auto_365469 ) ) ( not ( = ?auto_365461 ?auto_365462 ) ) ( not ( = ?auto_365461 ?auto_365463 ) ) ( not ( = ?auto_365461 ?auto_365464 ) ) ( not ( = ?auto_365461 ?auto_365465 ) ) ( not ( = ?auto_365461 ?auto_365466 ) ) ( not ( = ?auto_365461 ?auto_365467 ) ) ( not ( = ?auto_365461 ?auto_365468 ) ) ( not ( = ?auto_365461 ?auto_365469 ) ) ( not ( = ?auto_365462 ?auto_365463 ) ) ( not ( = ?auto_365462 ?auto_365464 ) ) ( not ( = ?auto_365462 ?auto_365465 ) ) ( not ( = ?auto_365462 ?auto_365466 ) ) ( not ( = ?auto_365462 ?auto_365467 ) ) ( not ( = ?auto_365462 ?auto_365468 ) ) ( not ( = ?auto_365462 ?auto_365469 ) ) ( not ( = ?auto_365463 ?auto_365464 ) ) ( not ( = ?auto_365463 ?auto_365465 ) ) ( not ( = ?auto_365463 ?auto_365466 ) ) ( not ( = ?auto_365463 ?auto_365467 ) ) ( not ( = ?auto_365463 ?auto_365468 ) ) ( not ( = ?auto_365463 ?auto_365469 ) ) ( not ( = ?auto_365464 ?auto_365465 ) ) ( not ( = ?auto_365464 ?auto_365466 ) ) ( not ( = ?auto_365464 ?auto_365467 ) ) ( not ( = ?auto_365464 ?auto_365468 ) ) ( not ( = ?auto_365464 ?auto_365469 ) ) ( not ( = ?auto_365465 ?auto_365466 ) ) ( not ( = ?auto_365465 ?auto_365467 ) ) ( not ( = ?auto_365465 ?auto_365468 ) ) ( not ( = ?auto_365465 ?auto_365469 ) ) ( not ( = ?auto_365466 ?auto_365467 ) ) ( not ( = ?auto_365466 ?auto_365468 ) ) ( not ( = ?auto_365466 ?auto_365469 ) ) ( not ( = ?auto_365467 ?auto_365468 ) ) ( not ( = ?auto_365467 ?auto_365469 ) ) ( not ( = ?auto_365468 ?auto_365469 ) ) ( ON ?auto_365467 ?auto_365468 ) ( ON ?auto_365466 ?auto_365467 ) ( ON ?auto_365465 ?auto_365466 ) ( ON ?auto_365464 ?auto_365465 ) ( ON ?auto_365463 ?auto_365464 ) ( ON ?auto_365462 ?auto_365463 ) ( ON ?auto_365461 ?auto_365462 ) ( ON ?auto_365460 ?auto_365461 ) ( CLEAR ?auto_365458 ) ( ON ?auto_365459 ?auto_365460 ) ( CLEAR ?auto_365459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_365454 ?auto_365455 ?auto_365456 ?auto_365457 ?auto_365458 ?auto_365459 )
      ( MAKE-15PILE ?auto_365454 ?auto_365455 ?auto_365456 ?auto_365457 ?auto_365458 ?auto_365459 ?auto_365460 ?auto_365461 ?auto_365462 ?auto_365463 ?auto_365464 ?auto_365465 ?auto_365466 ?auto_365467 ?auto_365468 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_365485 - BLOCK
      ?auto_365486 - BLOCK
      ?auto_365487 - BLOCK
      ?auto_365488 - BLOCK
      ?auto_365489 - BLOCK
      ?auto_365490 - BLOCK
      ?auto_365491 - BLOCK
      ?auto_365492 - BLOCK
      ?auto_365493 - BLOCK
      ?auto_365494 - BLOCK
      ?auto_365495 - BLOCK
      ?auto_365496 - BLOCK
      ?auto_365497 - BLOCK
      ?auto_365498 - BLOCK
      ?auto_365499 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_365499 ) ( ON-TABLE ?auto_365485 ) ( ON ?auto_365486 ?auto_365485 ) ( ON ?auto_365487 ?auto_365486 ) ( ON ?auto_365488 ?auto_365487 ) ( ON ?auto_365489 ?auto_365488 ) ( not ( = ?auto_365485 ?auto_365486 ) ) ( not ( = ?auto_365485 ?auto_365487 ) ) ( not ( = ?auto_365485 ?auto_365488 ) ) ( not ( = ?auto_365485 ?auto_365489 ) ) ( not ( = ?auto_365485 ?auto_365490 ) ) ( not ( = ?auto_365485 ?auto_365491 ) ) ( not ( = ?auto_365485 ?auto_365492 ) ) ( not ( = ?auto_365485 ?auto_365493 ) ) ( not ( = ?auto_365485 ?auto_365494 ) ) ( not ( = ?auto_365485 ?auto_365495 ) ) ( not ( = ?auto_365485 ?auto_365496 ) ) ( not ( = ?auto_365485 ?auto_365497 ) ) ( not ( = ?auto_365485 ?auto_365498 ) ) ( not ( = ?auto_365485 ?auto_365499 ) ) ( not ( = ?auto_365486 ?auto_365487 ) ) ( not ( = ?auto_365486 ?auto_365488 ) ) ( not ( = ?auto_365486 ?auto_365489 ) ) ( not ( = ?auto_365486 ?auto_365490 ) ) ( not ( = ?auto_365486 ?auto_365491 ) ) ( not ( = ?auto_365486 ?auto_365492 ) ) ( not ( = ?auto_365486 ?auto_365493 ) ) ( not ( = ?auto_365486 ?auto_365494 ) ) ( not ( = ?auto_365486 ?auto_365495 ) ) ( not ( = ?auto_365486 ?auto_365496 ) ) ( not ( = ?auto_365486 ?auto_365497 ) ) ( not ( = ?auto_365486 ?auto_365498 ) ) ( not ( = ?auto_365486 ?auto_365499 ) ) ( not ( = ?auto_365487 ?auto_365488 ) ) ( not ( = ?auto_365487 ?auto_365489 ) ) ( not ( = ?auto_365487 ?auto_365490 ) ) ( not ( = ?auto_365487 ?auto_365491 ) ) ( not ( = ?auto_365487 ?auto_365492 ) ) ( not ( = ?auto_365487 ?auto_365493 ) ) ( not ( = ?auto_365487 ?auto_365494 ) ) ( not ( = ?auto_365487 ?auto_365495 ) ) ( not ( = ?auto_365487 ?auto_365496 ) ) ( not ( = ?auto_365487 ?auto_365497 ) ) ( not ( = ?auto_365487 ?auto_365498 ) ) ( not ( = ?auto_365487 ?auto_365499 ) ) ( not ( = ?auto_365488 ?auto_365489 ) ) ( not ( = ?auto_365488 ?auto_365490 ) ) ( not ( = ?auto_365488 ?auto_365491 ) ) ( not ( = ?auto_365488 ?auto_365492 ) ) ( not ( = ?auto_365488 ?auto_365493 ) ) ( not ( = ?auto_365488 ?auto_365494 ) ) ( not ( = ?auto_365488 ?auto_365495 ) ) ( not ( = ?auto_365488 ?auto_365496 ) ) ( not ( = ?auto_365488 ?auto_365497 ) ) ( not ( = ?auto_365488 ?auto_365498 ) ) ( not ( = ?auto_365488 ?auto_365499 ) ) ( not ( = ?auto_365489 ?auto_365490 ) ) ( not ( = ?auto_365489 ?auto_365491 ) ) ( not ( = ?auto_365489 ?auto_365492 ) ) ( not ( = ?auto_365489 ?auto_365493 ) ) ( not ( = ?auto_365489 ?auto_365494 ) ) ( not ( = ?auto_365489 ?auto_365495 ) ) ( not ( = ?auto_365489 ?auto_365496 ) ) ( not ( = ?auto_365489 ?auto_365497 ) ) ( not ( = ?auto_365489 ?auto_365498 ) ) ( not ( = ?auto_365489 ?auto_365499 ) ) ( not ( = ?auto_365490 ?auto_365491 ) ) ( not ( = ?auto_365490 ?auto_365492 ) ) ( not ( = ?auto_365490 ?auto_365493 ) ) ( not ( = ?auto_365490 ?auto_365494 ) ) ( not ( = ?auto_365490 ?auto_365495 ) ) ( not ( = ?auto_365490 ?auto_365496 ) ) ( not ( = ?auto_365490 ?auto_365497 ) ) ( not ( = ?auto_365490 ?auto_365498 ) ) ( not ( = ?auto_365490 ?auto_365499 ) ) ( not ( = ?auto_365491 ?auto_365492 ) ) ( not ( = ?auto_365491 ?auto_365493 ) ) ( not ( = ?auto_365491 ?auto_365494 ) ) ( not ( = ?auto_365491 ?auto_365495 ) ) ( not ( = ?auto_365491 ?auto_365496 ) ) ( not ( = ?auto_365491 ?auto_365497 ) ) ( not ( = ?auto_365491 ?auto_365498 ) ) ( not ( = ?auto_365491 ?auto_365499 ) ) ( not ( = ?auto_365492 ?auto_365493 ) ) ( not ( = ?auto_365492 ?auto_365494 ) ) ( not ( = ?auto_365492 ?auto_365495 ) ) ( not ( = ?auto_365492 ?auto_365496 ) ) ( not ( = ?auto_365492 ?auto_365497 ) ) ( not ( = ?auto_365492 ?auto_365498 ) ) ( not ( = ?auto_365492 ?auto_365499 ) ) ( not ( = ?auto_365493 ?auto_365494 ) ) ( not ( = ?auto_365493 ?auto_365495 ) ) ( not ( = ?auto_365493 ?auto_365496 ) ) ( not ( = ?auto_365493 ?auto_365497 ) ) ( not ( = ?auto_365493 ?auto_365498 ) ) ( not ( = ?auto_365493 ?auto_365499 ) ) ( not ( = ?auto_365494 ?auto_365495 ) ) ( not ( = ?auto_365494 ?auto_365496 ) ) ( not ( = ?auto_365494 ?auto_365497 ) ) ( not ( = ?auto_365494 ?auto_365498 ) ) ( not ( = ?auto_365494 ?auto_365499 ) ) ( not ( = ?auto_365495 ?auto_365496 ) ) ( not ( = ?auto_365495 ?auto_365497 ) ) ( not ( = ?auto_365495 ?auto_365498 ) ) ( not ( = ?auto_365495 ?auto_365499 ) ) ( not ( = ?auto_365496 ?auto_365497 ) ) ( not ( = ?auto_365496 ?auto_365498 ) ) ( not ( = ?auto_365496 ?auto_365499 ) ) ( not ( = ?auto_365497 ?auto_365498 ) ) ( not ( = ?auto_365497 ?auto_365499 ) ) ( not ( = ?auto_365498 ?auto_365499 ) ) ( ON ?auto_365498 ?auto_365499 ) ( ON ?auto_365497 ?auto_365498 ) ( ON ?auto_365496 ?auto_365497 ) ( ON ?auto_365495 ?auto_365496 ) ( ON ?auto_365494 ?auto_365495 ) ( ON ?auto_365493 ?auto_365494 ) ( ON ?auto_365492 ?auto_365493 ) ( ON ?auto_365491 ?auto_365492 ) ( CLEAR ?auto_365489 ) ( ON ?auto_365490 ?auto_365491 ) ( CLEAR ?auto_365490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_365485 ?auto_365486 ?auto_365487 ?auto_365488 ?auto_365489 ?auto_365490 )
      ( MAKE-15PILE ?auto_365485 ?auto_365486 ?auto_365487 ?auto_365488 ?auto_365489 ?auto_365490 ?auto_365491 ?auto_365492 ?auto_365493 ?auto_365494 ?auto_365495 ?auto_365496 ?auto_365497 ?auto_365498 ?auto_365499 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_365515 - BLOCK
      ?auto_365516 - BLOCK
      ?auto_365517 - BLOCK
      ?auto_365518 - BLOCK
      ?auto_365519 - BLOCK
      ?auto_365520 - BLOCK
      ?auto_365521 - BLOCK
      ?auto_365522 - BLOCK
      ?auto_365523 - BLOCK
      ?auto_365524 - BLOCK
      ?auto_365525 - BLOCK
      ?auto_365526 - BLOCK
      ?auto_365527 - BLOCK
      ?auto_365528 - BLOCK
      ?auto_365529 - BLOCK
    )
    :vars
    (
      ?auto_365530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_365529 ?auto_365530 ) ( ON-TABLE ?auto_365515 ) ( ON ?auto_365516 ?auto_365515 ) ( ON ?auto_365517 ?auto_365516 ) ( ON ?auto_365518 ?auto_365517 ) ( not ( = ?auto_365515 ?auto_365516 ) ) ( not ( = ?auto_365515 ?auto_365517 ) ) ( not ( = ?auto_365515 ?auto_365518 ) ) ( not ( = ?auto_365515 ?auto_365519 ) ) ( not ( = ?auto_365515 ?auto_365520 ) ) ( not ( = ?auto_365515 ?auto_365521 ) ) ( not ( = ?auto_365515 ?auto_365522 ) ) ( not ( = ?auto_365515 ?auto_365523 ) ) ( not ( = ?auto_365515 ?auto_365524 ) ) ( not ( = ?auto_365515 ?auto_365525 ) ) ( not ( = ?auto_365515 ?auto_365526 ) ) ( not ( = ?auto_365515 ?auto_365527 ) ) ( not ( = ?auto_365515 ?auto_365528 ) ) ( not ( = ?auto_365515 ?auto_365529 ) ) ( not ( = ?auto_365515 ?auto_365530 ) ) ( not ( = ?auto_365516 ?auto_365517 ) ) ( not ( = ?auto_365516 ?auto_365518 ) ) ( not ( = ?auto_365516 ?auto_365519 ) ) ( not ( = ?auto_365516 ?auto_365520 ) ) ( not ( = ?auto_365516 ?auto_365521 ) ) ( not ( = ?auto_365516 ?auto_365522 ) ) ( not ( = ?auto_365516 ?auto_365523 ) ) ( not ( = ?auto_365516 ?auto_365524 ) ) ( not ( = ?auto_365516 ?auto_365525 ) ) ( not ( = ?auto_365516 ?auto_365526 ) ) ( not ( = ?auto_365516 ?auto_365527 ) ) ( not ( = ?auto_365516 ?auto_365528 ) ) ( not ( = ?auto_365516 ?auto_365529 ) ) ( not ( = ?auto_365516 ?auto_365530 ) ) ( not ( = ?auto_365517 ?auto_365518 ) ) ( not ( = ?auto_365517 ?auto_365519 ) ) ( not ( = ?auto_365517 ?auto_365520 ) ) ( not ( = ?auto_365517 ?auto_365521 ) ) ( not ( = ?auto_365517 ?auto_365522 ) ) ( not ( = ?auto_365517 ?auto_365523 ) ) ( not ( = ?auto_365517 ?auto_365524 ) ) ( not ( = ?auto_365517 ?auto_365525 ) ) ( not ( = ?auto_365517 ?auto_365526 ) ) ( not ( = ?auto_365517 ?auto_365527 ) ) ( not ( = ?auto_365517 ?auto_365528 ) ) ( not ( = ?auto_365517 ?auto_365529 ) ) ( not ( = ?auto_365517 ?auto_365530 ) ) ( not ( = ?auto_365518 ?auto_365519 ) ) ( not ( = ?auto_365518 ?auto_365520 ) ) ( not ( = ?auto_365518 ?auto_365521 ) ) ( not ( = ?auto_365518 ?auto_365522 ) ) ( not ( = ?auto_365518 ?auto_365523 ) ) ( not ( = ?auto_365518 ?auto_365524 ) ) ( not ( = ?auto_365518 ?auto_365525 ) ) ( not ( = ?auto_365518 ?auto_365526 ) ) ( not ( = ?auto_365518 ?auto_365527 ) ) ( not ( = ?auto_365518 ?auto_365528 ) ) ( not ( = ?auto_365518 ?auto_365529 ) ) ( not ( = ?auto_365518 ?auto_365530 ) ) ( not ( = ?auto_365519 ?auto_365520 ) ) ( not ( = ?auto_365519 ?auto_365521 ) ) ( not ( = ?auto_365519 ?auto_365522 ) ) ( not ( = ?auto_365519 ?auto_365523 ) ) ( not ( = ?auto_365519 ?auto_365524 ) ) ( not ( = ?auto_365519 ?auto_365525 ) ) ( not ( = ?auto_365519 ?auto_365526 ) ) ( not ( = ?auto_365519 ?auto_365527 ) ) ( not ( = ?auto_365519 ?auto_365528 ) ) ( not ( = ?auto_365519 ?auto_365529 ) ) ( not ( = ?auto_365519 ?auto_365530 ) ) ( not ( = ?auto_365520 ?auto_365521 ) ) ( not ( = ?auto_365520 ?auto_365522 ) ) ( not ( = ?auto_365520 ?auto_365523 ) ) ( not ( = ?auto_365520 ?auto_365524 ) ) ( not ( = ?auto_365520 ?auto_365525 ) ) ( not ( = ?auto_365520 ?auto_365526 ) ) ( not ( = ?auto_365520 ?auto_365527 ) ) ( not ( = ?auto_365520 ?auto_365528 ) ) ( not ( = ?auto_365520 ?auto_365529 ) ) ( not ( = ?auto_365520 ?auto_365530 ) ) ( not ( = ?auto_365521 ?auto_365522 ) ) ( not ( = ?auto_365521 ?auto_365523 ) ) ( not ( = ?auto_365521 ?auto_365524 ) ) ( not ( = ?auto_365521 ?auto_365525 ) ) ( not ( = ?auto_365521 ?auto_365526 ) ) ( not ( = ?auto_365521 ?auto_365527 ) ) ( not ( = ?auto_365521 ?auto_365528 ) ) ( not ( = ?auto_365521 ?auto_365529 ) ) ( not ( = ?auto_365521 ?auto_365530 ) ) ( not ( = ?auto_365522 ?auto_365523 ) ) ( not ( = ?auto_365522 ?auto_365524 ) ) ( not ( = ?auto_365522 ?auto_365525 ) ) ( not ( = ?auto_365522 ?auto_365526 ) ) ( not ( = ?auto_365522 ?auto_365527 ) ) ( not ( = ?auto_365522 ?auto_365528 ) ) ( not ( = ?auto_365522 ?auto_365529 ) ) ( not ( = ?auto_365522 ?auto_365530 ) ) ( not ( = ?auto_365523 ?auto_365524 ) ) ( not ( = ?auto_365523 ?auto_365525 ) ) ( not ( = ?auto_365523 ?auto_365526 ) ) ( not ( = ?auto_365523 ?auto_365527 ) ) ( not ( = ?auto_365523 ?auto_365528 ) ) ( not ( = ?auto_365523 ?auto_365529 ) ) ( not ( = ?auto_365523 ?auto_365530 ) ) ( not ( = ?auto_365524 ?auto_365525 ) ) ( not ( = ?auto_365524 ?auto_365526 ) ) ( not ( = ?auto_365524 ?auto_365527 ) ) ( not ( = ?auto_365524 ?auto_365528 ) ) ( not ( = ?auto_365524 ?auto_365529 ) ) ( not ( = ?auto_365524 ?auto_365530 ) ) ( not ( = ?auto_365525 ?auto_365526 ) ) ( not ( = ?auto_365525 ?auto_365527 ) ) ( not ( = ?auto_365525 ?auto_365528 ) ) ( not ( = ?auto_365525 ?auto_365529 ) ) ( not ( = ?auto_365525 ?auto_365530 ) ) ( not ( = ?auto_365526 ?auto_365527 ) ) ( not ( = ?auto_365526 ?auto_365528 ) ) ( not ( = ?auto_365526 ?auto_365529 ) ) ( not ( = ?auto_365526 ?auto_365530 ) ) ( not ( = ?auto_365527 ?auto_365528 ) ) ( not ( = ?auto_365527 ?auto_365529 ) ) ( not ( = ?auto_365527 ?auto_365530 ) ) ( not ( = ?auto_365528 ?auto_365529 ) ) ( not ( = ?auto_365528 ?auto_365530 ) ) ( not ( = ?auto_365529 ?auto_365530 ) ) ( ON ?auto_365528 ?auto_365529 ) ( ON ?auto_365527 ?auto_365528 ) ( ON ?auto_365526 ?auto_365527 ) ( ON ?auto_365525 ?auto_365526 ) ( ON ?auto_365524 ?auto_365525 ) ( ON ?auto_365523 ?auto_365524 ) ( ON ?auto_365522 ?auto_365523 ) ( ON ?auto_365521 ?auto_365522 ) ( ON ?auto_365520 ?auto_365521 ) ( CLEAR ?auto_365518 ) ( ON ?auto_365519 ?auto_365520 ) ( CLEAR ?auto_365519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_365515 ?auto_365516 ?auto_365517 ?auto_365518 ?auto_365519 )
      ( MAKE-15PILE ?auto_365515 ?auto_365516 ?auto_365517 ?auto_365518 ?auto_365519 ?auto_365520 ?auto_365521 ?auto_365522 ?auto_365523 ?auto_365524 ?auto_365525 ?auto_365526 ?auto_365527 ?auto_365528 ?auto_365529 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_365546 - BLOCK
      ?auto_365547 - BLOCK
      ?auto_365548 - BLOCK
      ?auto_365549 - BLOCK
      ?auto_365550 - BLOCK
      ?auto_365551 - BLOCK
      ?auto_365552 - BLOCK
      ?auto_365553 - BLOCK
      ?auto_365554 - BLOCK
      ?auto_365555 - BLOCK
      ?auto_365556 - BLOCK
      ?auto_365557 - BLOCK
      ?auto_365558 - BLOCK
      ?auto_365559 - BLOCK
      ?auto_365560 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_365560 ) ( ON-TABLE ?auto_365546 ) ( ON ?auto_365547 ?auto_365546 ) ( ON ?auto_365548 ?auto_365547 ) ( ON ?auto_365549 ?auto_365548 ) ( not ( = ?auto_365546 ?auto_365547 ) ) ( not ( = ?auto_365546 ?auto_365548 ) ) ( not ( = ?auto_365546 ?auto_365549 ) ) ( not ( = ?auto_365546 ?auto_365550 ) ) ( not ( = ?auto_365546 ?auto_365551 ) ) ( not ( = ?auto_365546 ?auto_365552 ) ) ( not ( = ?auto_365546 ?auto_365553 ) ) ( not ( = ?auto_365546 ?auto_365554 ) ) ( not ( = ?auto_365546 ?auto_365555 ) ) ( not ( = ?auto_365546 ?auto_365556 ) ) ( not ( = ?auto_365546 ?auto_365557 ) ) ( not ( = ?auto_365546 ?auto_365558 ) ) ( not ( = ?auto_365546 ?auto_365559 ) ) ( not ( = ?auto_365546 ?auto_365560 ) ) ( not ( = ?auto_365547 ?auto_365548 ) ) ( not ( = ?auto_365547 ?auto_365549 ) ) ( not ( = ?auto_365547 ?auto_365550 ) ) ( not ( = ?auto_365547 ?auto_365551 ) ) ( not ( = ?auto_365547 ?auto_365552 ) ) ( not ( = ?auto_365547 ?auto_365553 ) ) ( not ( = ?auto_365547 ?auto_365554 ) ) ( not ( = ?auto_365547 ?auto_365555 ) ) ( not ( = ?auto_365547 ?auto_365556 ) ) ( not ( = ?auto_365547 ?auto_365557 ) ) ( not ( = ?auto_365547 ?auto_365558 ) ) ( not ( = ?auto_365547 ?auto_365559 ) ) ( not ( = ?auto_365547 ?auto_365560 ) ) ( not ( = ?auto_365548 ?auto_365549 ) ) ( not ( = ?auto_365548 ?auto_365550 ) ) ( not ( = ?auto_365548 ?auto_365551 ) ) ( not ( = ?auto_365548 ?auto_365552 ) ) ( not ( = ?auto_365548 ?auto_365553 ) ) ( not ( = ?auto_365548 ?auto_365554 ) ) ( not ( = ?auto_365548 ?auto_365555 ) ) ( not ( = ?auto_365548 ?auto_365556 ) ) ( not ( = ?auto_365548 ?auto_365557 ) ) ( not ( = ?auto_365548 ?auto_365558 ) ) ( not ( = ?auto_365548 ?auto_365559 ) ) ( not ( = ?auto_365548 ?auto_365560 ) ) ( not ( = ?auto_365549 ?auto_365550 ) ) ( not ( = ?auto_365549 ?auto_365551 ) ) ( not ( = ?auto_365549 ?auto_365552 ) ) ( not ( = ?auto_365549 ?auto_365553 ) ) ( not ( = ?auto_365549 ?auto_365554 ) ) ( not ( = ?auto_365549 ?auto_365555 ) ) ( not ( = ?auto_365549 ?auto_365556 ) ) ( not ( = ?auto_365549 ?auto_365557 ) ) ( not ( = ?auto_365549 ?auto_365558 ) ) ( not ( = ?auto_365549 ?auto_365559 ) ) ( not ( = ?auto_365549 ?auto_365560 ) ) ( not ( = ?auto_365550 ?auto_365551 ) ) ( not ( = ?auto_365550 ?auto_365552 ) ) ( not ( = ?auto_365550 ?auto_365553 ) ) ( not ( = ?auto_365550 ?auto_365554 ) ) ( not ( = ?auto_365550 ?auto_365555 ) ) ( not ( = ?auto_365550 ?auto_365556 ) ) ( not ( = ?auto_365550 ?auto_365557 ) ) ( not ( = ?auto_365550 ?auto_365558 ) ) ( not ( = ?auto_365550 ?auto_365559 ) ) ( not ( = ?auto_365550 ?auto_365560 ) ) ( not ( = ?auto_365551 ?auto_365552 ) ) ( not ( = ?auto_365551 ?auto_365553 ) ) ( not ( = ?auto_365551 ?auto_365554 ) ) ( not ( = ?auto_365551 ?auto_365555 ) ) ( not ( = ?auto_365551 ?auto_365556 ) ) ( not ( = ?auto_365551 ?auto_365557 ) ) ( not ( = ?auto_365551 ?auto_365558 ) ) ( not ( = ?auto_365551 ?auto_365559 ) ) ( not ( = ?auto_365551 ?auto_365560 ) ) ( not ( = ?auto_365552 ?auto_365553 ) ) ( not ( = ?auto_365552 ?auto_365554 ) ) ( not ( = ?auto_365552 ?auto_365555 ) ) ( not ( = ?auto_365552 ?auto_365556 ) ) ( not ( = ?auto_365552 ?auto_365557 ) ) ( not ( = ?auto_365552 ?auto_365558 ) ) ( not ( = ?auto_365552 ?auto_365559 ) ) ( not ( = ?auto_365552 ?auto_365560 ) ) ( not ( = ?auto_365553 ?auto_365554 ) ) ( not ( = ?auto_365553 ?auto_365555 ) ) ( not ( = ?auto_365553 ?auto_365556 ) ) ( not ( = ?auto_365553 ?auto_365557 ) ) ( not ( = ?auto_365553 ?auto_365558 ) ) ( not ( = ?auto_365553 ?auto_365559 ) ) ( not ( = ?auto_365553 ?auto_365560 ) ) ( not ( = ?auto_365554 ?auto_365555 ) ) ( not ( = ?auto_365554 ?auto_365556 ) ) ( not ( = ?auto_365554 ?auto_365557 ) ) ( not ( = ?auto_365554 ?auto_365558 ) ) ( not ( = ?auto_365554 ?auto_365559 ) ) ( not ( = ?auto_365554 ?auto_365560 ) ) ( not ( = ?auto_365555 ?auto_365556 ) ) ( not ( = ?auto_365555 ?auto_365557 ) ) ( not ( = ?auto_365555 ?auto_365558 ) ) ( not ( = ?auto_365555 ?auto_365559 ) ) ( not ( = ?auto_365555 ?auto_365560 ) ) ( not ( = ?auto_365556 ?auto_365557 ) ) ( not ( = ?auto_365556 ?auto_365558 ) ) ( not ( = ?auto_365556 ?auto_365559 ) ) ( not ( = ?auto_365556 ?auto_365560 ) ) ( not ( = ?auto_365557 ?auto_365558 ) ) ( not ( = ?auto_365557 ?auto_365559 ) ) ( not ( = ?auto_365557 ?auto_365560 ) ) ( not ( = ?auto_365558 ?auto_365559 ) ) ( not ( = ?auto_365558 ?auto_365560 ) ) ( not ( = ?auto_365559 ?auto_365560 ) ) ( ON ?auto_365559 ?auto_365560 ) ( ON ?auto_365558 ?auto_365559 ) ( ON ?auto_365557 ?auto_365558 ) ( ON ?auto_365556 ?auto_365557 ) ( ON ?auto_365555 ?auto_365556 ) ( ON ?auto_365554 ?auto_365555 ) ( ON ?auto_365553 ?auto_365554 ) ( ON ?auto_365552 ?auto_365553 ) ( ON ?auto_365551 ?auto_365552 ) ( CLEAR ?auto_365549 ) ( ON ?auto_365550 ?auto_365551 ) ( CLEAR ?auto_365550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_365546 ?auto_365547 ?auto_365548 ?auto_365549 ?auto_365550 )
      ( MAKE-15PILE ?auto_365546 ?auto_365547 ?auto_365548 ?auto_365549 ?auto_365550 ?auto_365551 ?auto_365552 ?auto_365553 ?auto_365554 ?auto_365555 ?auto_365556 ?auto_365557 ?auto_365558 ?auto_365559 ?auto_365560 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_365576 - BLOCK
      ?auto_365577 - BLOCK
      ?auto_365578 - BLOCK
      ?auto_365579 - BLOCK
      ?auto_365580 - BLOCK
      ?auto_365581 - BLOCK
      ?auto_365582 - BLOCK
      ?auto_365583 - BLOCK
      ?auto_365584 - BLOCK
      ?auto_365585 - BLOCK
      ?auto_365586 - BLOCK
      ?auto_365587 - BLOCK
      ?auto_365588 - BLOCK
      ?auto_365589 - BLOCK
      ?auto_365590 - BLOCK
    )
    :vars
    (
      ?auto_365591 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_365590 ?auto_365591 ) ( ON-TABLE ?auto_365576 ) ( ON ?auto_365577 ?auto_365576 ) ( ON ?auto_365578 ?auto_365577 ) ( not ( = ?auto_365576 ?auto_365577 ) ) ( not ( = ?auto_365576 ?auto_365578 ) ) ( not ( = ?auto_365576 ?auto_365579 ) ) ( not ( = ?auto_365576 ?auto_365580 ) ) ( not ( = ?auto_365576 ?auto_365581 ) ) ( not ( = ?auto_365576 ?auto_365582 ) ) ( not ( = ?auto_365576 ?auto_365583 ) ) ( not ( = ?auto_365576 ?auto_365584 ) ) ( not ( = ?auto_365576 ?auto_365585 ) ) ( not ( = ?auto_365576 ?auto_365586 ) ) ( not ( = ?auto_365576 ?auto_365587 ) ) ( not ( = ?auto_365576 ?auto_365588 ) ) ( not ( = ?auto_365576 ?auto_365589 ) ) ( not ( = ?auto_365576 ?auto_365590 ) ) ( not ( = ?auto_365576 ?auto_365591 ) ) ( not ( = ?auto_365577 ?auto_365578 ) ) ( not ( = ?auto_365577 ?auto_365579 ) ) ( not ( = ?auto_365577 ?auto_365580 ) ) ( not ( = ?auto_365577 ?auto_365581 ) ) ( not ( = ?auto_365577 ?auto_365582 ) ) ( not ( = ?auto_365577 ?auto_365583 ) ) ( not ( = ?auto_365577 ?auto_365584 ) ) ( not ( = ?auto_365577 ?auto_365585 ) ) ( not ( = ?auto_365577 ?auto_365586 ) ) ( not ( = ?auto_365577 ?auto_365587 ) ) ( not ( = ?auto_365577 ?auto_365588 ) ) ( not ( = ?auto_365577 ?auto_365589 ) ) ( not ( = ?auto_365577 ?auto_365590 ) ) ( not ( = ?auto_365577 ?auto_365591 ) ) ( not ( = ?auto_365578 ?auto_365579 ) ) ( not ( = ?auto_365578 ?auto_365580 ) ) ( not ( = ?auto_365578 ?auto_365581 ) ) ( not ( = ?auto_365578 ?auto_365582 ) ) ( not ( = ?auto_365578 ?auto_365583 ) ) ( not ( = ?auto_365578 ?auto_365584 ) ) ( not ( = ?auto_365578 ?auto_365585 ) ) ( not ( = ?auto_365578 ?auto_365586 ) ) ( not ( = ?auto_365578 ?auto_365587 ) ) ( not ( = ?auto_365578 ?auto_365588 ) ) ( not ( = ?auto_365578 ?auto_365589 ) ) ( not ( = ?auto_365578 ?auto_365590 ) ) ( not ( = ?auto_365578 ?auto_365591 ) ) ( not ( = ?auto_365579 ?auto_365580 ) ) ( not ( = ?auto_365579 ?auto_365581 ) ) ( not ( = ?auto_365579 ?auto_365582 ) ) ( not ( = ?auto_365579 ?auto_365583 ) ) ( not ( = ?auto_365579 ?auto_365584 ) ) ( not ( = ?auto_365579 ?auto_365585 ) ) ( not ( = ?auto_365579 ?auto_365586 ) ) ( not ( = ?auto_365579 ?auto_365587 ) ) ( not ( = ?auto_365579 ?auto_365588 ) ) ( not ( = ?auto_365579 ?auto_365589 ) ) ( not ( = ?auto_365579 ?auto_365590 ) ) ( not ( = ?auto_365579 ?auto_365591 ) ) ( not ( = ?auto_365580 ?auto_365581 ) ) ( not ( = ?auto_365580 ?auto_365582 ) ) ( not ( = ?auto_365580 ?auto_365583 ) ) ( not ( = ?auto_365580 ?auto_365584 ) ) ( not ( = ?auto_365580 ?auto_365585 ) ) ( not ( = ?auto_365580 ?auto_365586 ) ) ( not ( = ?auto_365580 ?auto_365587 ) ) ( not ( = ?auto_365580 ?auto_365588 ) ) ( not ( = ?auto_365580 ?auto_365589 ) ) ( not ( = ?auto_365580 ?auto_365590 ) ) ( not ( = ?auto_365580 ?auto_365591 ) ) ( not ( = ?auto_365581 ?auto_365582 ) ) ( not ( = ?auto_365581 ?auto_365583 ) ) ( not ( = ?auto_365581 ?auto_365584 ) ) ( not ( = ?auto_365581 ?auto_365585 ) ) ( not ( = ?auto_365581 ?auto_365586 ) ) ( not ( = ?auto_365581 ?auto_365587 ) ) ( not ( = ?auto_365581 ?auto_365588 ) ) ( not ( = ?auto_365581 ?auto_365589 ) ) ( not ( = ?auto_365581 ?auto_365590 ) ) ( not ( = ?auto_365581 ?auto_365591 ) ) ( not ( = ?auto_365582 ?auto_365583 ) ) ( not ( = ?auto_365582 ?auto_365584 ) ) ( not ( = ?auto_365582 ?auto_365585 ) ) ( not ( = ?auto_365582 ?auto_365586 ) ) ( not ( = ?auto_365582 ?auto_365587 ) ) ( not ( = ?auto_365582 ?auto_365588 ) ) ( not ( = ?auto_365582 ?auto_365589 ) ) ( not ( = ?auto_365582 ?auto_365590 ) ) ( not ( = ?auto_365582 ?auto_365591 ) ) ( not ( = ?auto_365583 ?auto_365584 ) ) ( not ( = ?auto_365583 ?auto_365585 ) ) ( not ( = ?auto_365583 ?auto_365586 ) ) ( not ( = ?auto_365583 ?auto_365587 ) ) ( not ( = ?auto_365583 ?auto_365588 ) ) ( not ( = ?auto_365583 ?auto_365589 ) ) ( not ( = ?auto_365583 ?auto_365590 ) ) ( not ( = ?auto_365583 ?auto_365591 ) ) ( not ( = ?auto_365584 ?auto_365585 ) ) ( not ( = ?auto_365584 ?auto_365586 ) ) ( not ( = ?auto_365584 ?auto_365587 ) ) ( not ( = ?auto_365584 ?auto_365588 ) ) ( not ( = ?auto_365584 ?auto_365589 ) ) ( not ( = ?auto_365584 ?auto_365590 ) ) ( not ( = ?auto_365584 ?auto_365591 ) ) ( not ( = ?auto_365585 ?auto_365586 ) ) ( not ( = ?auto_365585 ?auto_365587 ) ) ( not ( = ?auto_365585 ?auto_365588 ) ) ( not ( = ?auto_365585 ?auto_365589 ) ) ( not ( = ?auto_365585 ?auto_365590 ) ) ( not ( = ?auto_365585 ?auto_365591 ) ) ( not ( = ?auto_365586 ?auto_365587 ) ) ( not ( = ?auto_365586 ?auto_365588 ) ) ( not ( = ?auto_365586 ?auto_365589 ) ) ( not ( = ?auto_365586 ?auto_365590 ) ) ( not ( = ?auto_365586 ?auto_365591 ) ) ( not ( = ?auto_365587 ?auto_365588 ) ) ( not ( = ?auto_365587 ?auto_365589 ) ) ( not ( = ?auto_365587 ?auto_365590 ) ) ( not ( = ?auto_365587 ?auto_365591 ) ) ( not ( = ?auto_365588 ?auto_365589 ) ) ( not ( = ?auto_365588 ?auto_365590 ) ) ( not ( = ?auto_365588 ?auto_365591 ) ) ( not ( = ?auto_365589 ?auto_365590 ) ) ( not ( = ?auto_365589 ?auto_365591 ) ) ( not ( = ?auto_365590 ?auto_365591 ) ) ( ON ?auto_365589 ?auto_365590 ) ( ON ?auto_365588 ?auto_365589 ) ( ON ?auto_365587 ?auto_365588 ) ( ON ?auto_365586 ?auto_365587 ) ( ON ?auto_365585 ?auto_365586 ) ( ON ?auto_365584 ?auto_365585 ) ( ON ?auto_365583 ?auto_365584 ) ( ON ?auto_365582 ?auto_365583 ) ( ON ?auto_365581 ?auto_365582 ) ( ON ?auto_365580 ?auto_365581 ) ( CLEAR ?auto_365578 ) ( ON ?auto_365579 ?auto_365580 ) ( CLEAR ?auto_365579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_365576 ?auto_365577 ?auto_365578 ?auto_365579 )
      ( MAKE-15PILE ?auto_365576 ?auto_365577 ?auto_365578 ?auto_365579 ?auto_365580 ?auto_365581 ?auto_365582 ?auto_365583 ?auto_365584 ?auto_365585 ?auto_365586 ?auto_365587 ?auto_365588 ?auto_365589 ?auto_365590 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_365607 - BLOCK
      ?auto_365608 - BLOCK
      ?auto_365609 - BLOCK
      ?auto_365610 - BLOCK
      ?auto_365611 - BLOCK
      ?auto_365612 - BLOCK
      ?auto_365613 - BLOCK
      ?auto_365614 - BLOCK
      ?auto_365615 - BLOCK
      ?auto_365616 - BLOCK
      ?auto_365617 - BLOCK
      ?auto_365618 - BLOCK
      ?auto_365619 - BLOCK
      ?auto_365620 - BLOCK
      ?auto_365621 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_365621 ) ( ON-TABLE ?auto_365607 ) ( ON ?auto_365608 ?auto_365607 ) ( ON ?auto_365609 ?auto_365608 ) ( not ( = ?auto_365607 ?auto_365608 ) ) ( not ( = ?auto_365607 ?auto_365609 ) ) ( not ( = ?auto_365607 ?auto_365610 ) ) ( not ( = ?auto_365607 ?auto_365611 ) ) ( not ( = ?auto_365607 ?auto_365612 ) ) ( not ( = ?auto_365607 ?auto_365613 ) ) ( not ( = ?auto_365607 ?auto_365614 ) ) ( not ( = ?auto_365607 ?auto_365615 ) ) ( not ( = ?auto_365607 ?auto_365616 ) ) ( not ( = ?auto_365607 ?auto_365617 ) ) ( not ( = ?auto_365607 ?auto_365618 ) ) ( not ( = ?auto_365607 ?auto_365619 ) ) ( not ( = ?auto_365607 ?auto_365620 ) ) ( not ( = ?auto_365607 ?auto_365621 ) ) ( not ( = ?auto_365608 ?auto_365609 ) ) ( not ( = ?auto_365608 ?auto_365610 ) ) ( not ( = ?auto_365608 ?auto_365611 ) ) ( not ( = ?auto_365608 ?auto_365612 ) ) ( not ( = ?auto_365608 ?auto_365613 ) ) ( not ( = ?auto_365608 ?auto_365614 ) ) ( not ( = ?auto_365608 ?auto_365615 ) ) ( not ( = ?auto_365608 ?auto_365616 ) ) ( not ( = ?auto_365608 ?auto_365617 ) ) ( not ( = ?auto_365608 ?auto_365618 ) ) ( not ( = ?auto_365608 ?auto_365619 ) ) ( not ( = ?auto_365608 ?auto_365620 ) ) ( not ( = ?auto_365608 ?auto_365621 ) ) ( not ( = ?auto_365609 ?auto_365610 ) ) ( not ( = ?auto_365609 ?auto_365611 ) ) ( not ( = ?auto_365609 ?auto_365612 ) ) ( not ( = ?auto_365609 ?auto_365613 ) ) ( not ( = ?auto_365609 ?auto_365614 ) ) ( not ( = ?auto_365609 ?auto_365615 ) ) ( not ( = ?auto_365609 ?auto_365616 ) ) ( not ( = ?auto_365609 ?auto_365617 ) ) ( not ( = ?auto_365609 ?auto_365618 ) ) ( not ( = ?auto_365609 ?auto_365619 ) ) ( not ( = ?auto_365609 ?auto_365620 ) ) ( not ( = ?auto_365609 ?auto_365621 ) ) ( not ( = ?auto_365610 ?auto_365611 ) ) ( not ( = ?auto_365610 ?auto_365612 ) ) ( not ( = ?auto_365610 ?auto_365613 ) ) ( not ( = ?auto_365610 ?auto_365614 ) ) ( not ( = ?auto_365610 ?auto_365615 ) ) ( not ( = ?auto_365610 ?auto_365616 ) ) ( not ( = ?auto_365610 ?auto_365617 ) ) ( not ( = ?auto_365610 ?auto_365618 ) ) ( not ( = ?auto_365610 ?auto_365619 ) ) ( not ( = ?auto_365610 ?auto_365620 ) ) ( not ( = ?auto_365610 ?auto_365621 ) ) ( not ( = ?auto_365611 ?auto_365612 ) ) ( not ( = ?auto_365611 ?auto_365613 ) ) ( not ( = ?auto_365611 ?auto_365614 ) ) ( not ( = ?auto_365611 ?auto_365615 ) ) ( not ( = ?auto_365611 ?auto_365616 ) ) ( not ( = ?auto_365611 ?auto_365617 ) ) ( not ( = ?auto_365611 ?auto_365618 ) ) ( not ( = ?auto_365611 ?auto_365619 ) ) ( not ( = ?auto_365611 ?auto_365620 ) ) ( not ( = ?auto_365611 ?auto_365621 ) ) ( not ( = ?auto_365612 ?auto_365613 ) ) ( not ( = ?auto_365612 ?auto_365614 ) ) ( not ( = ?auto_365612 ?auto_365615 ) ) ( not ( = ?auto_365612 ?auto_365616 ) ) ( not ( = ?auto_365612 ?auto_365617 ) ) ( not ( = ?auto_365612 ?auto_365618 ) ) ( not ( = ?auto_365612 ?auto_365619 ) ) ( not ( = ?auto_365612 ?auto_365620 ) ) ( not ( = ?auto_365612 ?auto_365621 ) ) ( not ( = ?auto_365613 ?auto_365614 ) ) ( not ( = ?auto_365613 ?auto_365615 ) ) ( not ( = ?auto_365613 ?auto_365616 ) ) ( not ( = ?auto_365613 ?auto_365617 ) ) ( not ( = ?auto_365613 ?auto_365618 ) ) ( not ( = ?auto_365613 ?auto_365619 ) ) ( not ( = ?auto_365613 ?auto_365620 ) ) ( not ( = ?auto_365613 ?auto_365621 ) ) ( not ( = ?auto_365614 ?auto_365615 ) ) ( not ( = ?auto_365614 ?auto_365616 ) ) ( not ( = ?auto_365614 ?auto_365617 ) ) ( not ( = ?auto_365614 ?auto_365618 ) ) ( not ( = ?auto_365614 ?auto_365619 ) ) ( not ( = ?auto_365614 ?auto_365620 ) ) ( not ( = ?auto_365614 ?auto_365621 ) ) ( not ( = ?auto_365615 ?auto_365616 ) ) ( not ( = ?auto_365615 ?auto_365617 ) ) ( not ( = ?auto_365615 ?auto_365618 ) ) ( not ( = ?auto_365615 ?auto_365619 ) ) ( not ( = ?auto_365615 ?auto_365620 ) ) ( not ( = ?auto_365615 ?auto_365621 ) ) ( not ( = ?auto_365616 ?auto_365617 ) ) ( not ( = ?auto_365616 ?auto_365618 ) ) ( not ( = ?auto_365616 ?auto_365619 ) ) ( not ( = ?auto_365616 ?auto_365620 ) ) ( not ( = ?auto_365616 ?auto_365621 ) ) ( not ( = ?auto_365617 ?auto_365618 ) ) ( not ( = ?auto_365617 ?auto_365619 ) ) ( not ( = ?auto_365617 ?auto_365620 ) ) ( not ( = ?auto_365617 ?auto_365621 ) ) ( not ( = ?auto_365618 ?auto_365619 ) ) ( not ( = ?auto_365618 ?auto_365620 ) ) ( not ( = ?auto_365618 ?auto_365621 ) ) ( not ( = ?auto_365619 ?auto_365620 ) ) ( not ( = ?auto_365619 ?auto_365621 ) ) ( not ( = ?auto_365620 ?auto_365621 ) ) ( ON ?auto_365620 ?auto_365621 ) ( ON ?auto_365619 ?auto_365620 ) ( ON ?auto_365618 ?auto_365619 ) ( ON ?auto_365617 ?auto_365618 ) ( ON ?auto_365616 ?auto_365617 ) ( ON ?auto_365615 ?auto_365616 ) ( ON ?auto_365614 ?auto_365615 ) ( ON ?auto_365613 ?auto_365614 ) ( ON ?auto_365612 ?auto_365613 ) ( ON ?auto_365611 ?auto_365612 ) ( CLEAR ?auto_365609 ) ( ON ?auto_365610 ?auto_365611 ) ( CLEAR ?auto_365610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_365607 ?auto_365608 ?auto_365609 ?auto_365610 )
      ( MAKE-15PILE ?auto_365607 ?auto_365608 ?auto_365609 ?auto_365610 ?auto_365611 ?auto_365612 ?auto_365613 ?auto_365614 ?auto_365615 ?auto_365616 ?auto_365617 ?auto_365618 ?auto_365619 ?auto_365620 ?auto_365621 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_365637 - BLOCK
      ?auto_365638 - BLOCK
      ?auto_365639 - BLOCK
      ?auto_365640 - BLOCK
      ?auto_365641 - BLOCK
      ?auto_365642 - BLOCK
      ?auto_365643 - BLOCK
      ?auto_365644 - BLOCK
      ?auto_365645 - BLOCK
      ?auto_365646 - BLOCK
      ?auto_365647 - BLOCK
      ?auto_365648 - BLOCK
      ?auto_365649 - BLOCK
      ?auto_365650 - BLOCK
      ?auto_365651 - BLOCK
    )
    :vars
    (
      ?auto_365652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_365651 ?auto_365652 ) ( ON-TABLE ?auto_365637 ) ( ON ?auto_365638 ?auto_365637 ) ( not ( = ?auto_365637 ?auto_365638 ) ) ( not ( = ?auto_365637 ?auto_365639 ) ) ( not ( = ?auto_365637 ?auto_365640 ) ) ( not ( = ?auto_365637 ?auto_365641 ) ) ( not ( = ?auto_365637 ?auto_365642 ) ) ( not ( = ?auto_365637 ?auto_365643 ) ) ( not ( = ?auto_365637 ?auto_365644 ) ) ( not ( = ?auto_365637 ?auto_365645 ) ) ( not ( = ?auto_365637 ?auto_365646 ) ) ( not ( = ?auto_365637 ?auto_365647 ) ) ( not ( = ?auto_365637 ?auto_365648 ) ) ( not ( = ?auto_365637 ?auto_365649 ) ) ( not ( = ?auto_365637 ?auto_365650 ) ) ( not ( = ?auto_365637 ?auto_365651 ) ) ( not ( = ?auto_365637 ?auto_365652 ) ) ( not ( = ?auto_365638 ?auto_365639 ) ) ( not ( = ?auto_365638 ?auto_365640 ) ) ( not ( = ?auto_365638 ?auto_365641 ) ) ( not ( = ?auto_365638 ?auto_365642 ) ) ( not ( = ?auto_365638 ?auto_365643 ) ) ( not ( = ?auto_365638 ?auto_365644 ) ) ( not ( = ?auto_365638 ?auto_365645 ) ) ( not ( = ?auto_365638 ?auto_365646 ) ) ( not ( = ?auto_365638 ?auto_365647 ) ) ( not ( = ?auto_365638 ?auto_365648 ) ) ( not ( = ?auto_365638 ?auto_365649 ) ) ( not ( = ?auto_365638 ?auto_365650 ) ) ( not ( = ?auto_365638 ?auto_365651 ) ) ( not ( = ?auto_365638 ?auto_365652 ) ) ( not ( = ?auto_365639 ?auto_365640 ) ) ( not ( = ?auto_365639 ?auto_365641 ) ) ( not ( = ?auto_365639 ?auto_365642 ) ) ( not ( = ?auto_365639 ?auto_365643 ) ) ( not ( = ?auto_365639 ?auto_365644 ) ) ( not ( = ?auto_365639 ?auto_365645 ) ) ( not ( = ?auto_365639 ?auto_365646 ) ) ( not ( = ?auto_365639 ?auto_365647 ) ) ( not ( = ?auto_365639 ?auto_365648 ) ) ( not ( = ?auto_365639 ?auto_365649 ) ) ( not ( = ?auto_365639 ?auto_365650 ) ) ( not ( = ?auto_365639 ?auto_365651 ) ) ( not ( = ?auto_365639 ?auto_365652 ) ) ( not ( = ?auto_365640 ?auto_365641 ) ) ( not ( = ?auto_365640 ?auto_365642 ) ) ( not ( = ?auto_365640 ?auto_365643 ) ) ( not ( = ?auto_365640 ?auto_365644 ) ) ( not ( = ?auto_365640 ?auto_365645 ) ) ( not ( = ?auto_365640 ?auto_365646 ) ) ( not ( = ?auto_365640 ?auto_365647 ) ) ( not ( = ?auto_365640 ?auto_365648 ) ) ( not ( = ?auto_365640 ?auto_365649 ) ) ( not ( = ?auto_365640 ?auto_365650 ) ) ( not ( = ?auto_365640 ?auto_365651 ) ) ( not ( = ?auto_365640 ?auto_365652 ) ) ( not ( = ?auto_365641 ?auto_365642 ) ) ( not ( = ?auto_365641 ?auto_365643 ) ) ( not ( = ?auto_365641 ?auto_365644 ) ) ( not ( = ?auto_365641 ?auto_365645 ) ) ( not ( = ?auto_365641 ?auto_365646 ) ) ( not ( = ?auto_365641 ?auto_365647 ) ) ( not ( = ?auto_365641 ?auto_365648 ) ) ( not ( = ?auto_365641 ?auto_365649 ) ) ( not ( = ?auto_365641 ?auto_365650 ) ) ( not ( = ?auto_365641 ?auto_365651 ) ) ( not ( = ?auto_365641 ?auto_365652 ) ) ( not ( = ?auto_365642 ?auto_365643 ) ) ( not ( = ?auto_365642 ?auto_365644 ) ) ( not ( = ?auto_365642 ?auto_365645 ) ) ( not ( = ?auto_365642 ?auto_365646 ) ) ( not ( = ?auto_365642 ?auto_365647 ) ) ( not ( = ?auto_365642 ?auto_365648 ) ) ( not ( = ?auto_365642 ?auto_365649 ) ) ( not ( = ?auto_365642 ?auto_365650 ) ) ( not ( = ?auto_365642 ?auto_365651 ) ) ( not ( = ?auto_365642 ?auto_365652 ) ) ( not ( = ?auto_365643 ?auto_365644 ) ) ( not ( = ?auto_365643 ?auto_365645 ) ) ( not ( = ?auto_365643 ?auto_365646 ) ) ( not ( = ?auto_365643 ?auto_365647 ) ) ( not ( = ?auto_365643 ?auto_365648 ) ) ( not ( = ?auto_365643 ?auto_365649 ) ) ( not ( = ?auto_365643 ?auto_365650 ) ) ( not ( = ?auto_365643 ?auto_365651 ) ) ( not ( = ?auto_365643 ?auto_365652 ) ) ( not ( = ?auto_365644 ?auto_365645 ) ) ( not ( = ?auto_365644 ?auto_365646 ) ) ( not ( = ?auto_365644 ?auto_365647 ) ) ( not ( = ?auto_365644 ?auto_365648 ) ) ( not ( = ?auto_365644 ?auto_365649 ) ) ( not ( = ?auto_365644 ?auto_365650 ) ) ( not ( = ?auto_365644 ?auto_365651 ) ) ( not ( = ?auto_365644 ?auto_365652 ) ) ( not ( = ?auto_365645 ?auto_365646 ) ) ( not ( = ?auto_365645 ?auto_365647 ) ) ( not ( = ?auto_365645 ?auto_365648 ) ) ( not ( = ?auto_365645 ?auto_365649 ) ) ( not ( = ?auto_365645 ?auto_365650 ) ) ( not ( = ?auto_365645 ?auto_365651 ) ) ( not ( = ?auto_365645 ?auto_365652 ) ) ( not ( = ?auto_365646 ?auto_365647 ) ) ( not ( = ?auto_365646 ?auto_365648 ) ) ( not ( = ?auto_365646 ?auto_365649 ) ) ( not ( = ?auto_365646 ?auto_365650 ) ) ( not ( = ?auto_365646 ?auto_365651 ) ) ( not ( = ?auto_365646 ?auto_365652 ) ) ( not ( = ?auto_365647 ?auto_365648 ) ) ( not ( = ?auto_365647 ?auto_365649 ) ) ( not ( = ?auto_365647 ?auto_365650 ) ) ( not ( = ?auto_365647 ?auto_365651 ) ) ( not ( = ?auto_365647 ?auto_365652 ) ) ( not ( = ?auto_365648 ?auto_365649 ) ) ( not ( = ?auto_365648 ?auto_365650 ) ) ( not ( = ?auto_365648 ?auto_365651 ) ) ( not ( = ?auto_365648 ?auto_365652 ) ) ( not ( = ?auto_365649 ?auto_365650 ) ) ( not ( = ?auto_365649 ?auto_365651 ) ) ( not ( = ?auto_365649 ?auto_365652 ) ) ( not ( = ?auto_365650 ?auto_365651 ) ) ( not ( = ?auto_365650 ?auto_365652 ) ) ( not ( = ?auto_365651 ?auto_365652 ) ) ( ON ?auto_365650 ?auto_365651 ) ( ON ?auto_365649 ?auto_365650 ) ( ON ?auto_365648 ?auto_365649 ) ( ON ?auto_365647 ?auto_365648 ) ( ON ?auto_365646 ?auto_365647 ) ( ON ?auto_365645 ?auto_365646 ) ( ON ?auto_365644 ?auto_365645 ) ( ON ?auto_365643 ?auto_365644 ) ( ON ?auto_365642 ?auto_365643 ) ( ON ?auto_365641 ?auto_365642 ) ( ON ?auto_365640 ?auto_365641 ) ( CLEAR ?auto_365638 ) ( ON ?auto_365639 ?auto_365640 ) ( CLEAR ?auto_365639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_365637 ?auto_365638 ?auto_365639 )
      ( MAKE-15PILE ?auto_365637 ?auto_365638 ?auto_365639 ?auto_365640 ?auto_365641 ?auto_365642 ?auto_365643 ?auto_365644 ?auto_365645 ?auto_365646 ?auto_365647 ?auto_365648 ?auto_365649 ?auto_365650 ?auto_365651 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_365668 - BLOCK
      ?auto_365669 - BLOCK
      ?auto_365670 - BLOCK
      ?auto_365671 - BLOCK
      ?auto_365672 - BLOCK
      ?auto_365673 - BLOCK
      ?auto_365674 - BLOCK
      ?auto_365675 - BLOCK
      ?auto_365676 - BLOCK
      ?auto_365677 - BLOCK
      ?auto_365678 - BLOCK
      ?auto_365679 - BLOCK
      ?auto_365680 - BLOCK
      ?auto_365681 - BLOCK
      ?auto_365682 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_365682 ) ( ON-TABLE ?auto_365668 ) ( ON ?auto_365669 ?auto_365668 ) ( not ( = ?auto_365668 ?auto_365669 ) ) ( not ( = ?auto_365668 ?auto_365670 ) ) ( not ( = ?auto_365668 ?auto_365671 ) ) ( not ( = ?auto_365668 ?auto_365672 ) ) ( not ( = ?auto_365668 ?auto_365673 ) ) ( not ( = ?auto_365668 ?auto_365674 ) ) ( not ( = ?auto_365668 ?auto_365675 ) ) ( not ( = ?auto_365668 ?auto_365676 ) ) ( not ( = ?auto_365668 ?auto_365677 ) ) ( not ( = ?auto_365668 ?auto_365678 ) ) ( not ( = ?auto_365668 ?auto_365679 ) ) ( not ( = ?auto_365668 ?auto_365680 ) ) ( not ( = ?auto_365668 ?auto_365681 ) ) ( not ( = ?auto_365668 ?auto_365682 ) ) ( not ( = ?auto_365669 ?auto_365670 ) ) ( not ( = ?auto_365669 ?auto_365671 ) ) ( not ( = ?auto_365669 ?auto_365672 ) ) ( not ( = ?auto_365669 ?auto_365673 ) ) ( not ( = ?auto_365669 ?auto_365674 ) ) ( not ( = ?auto_365669 ?auto_365675 ) ) ( not ( = ?auto_365669 ?auto_365676 ) ) ( not ( = ?auto_365669 ?auto_365677 ) ) ( not ( = ?auto_365669 ?auto_365678 ) ) ( not ( = ?auto_365669 ?auto_365679 ) ) ( not ( = ?auto_365669 ?auto_365680 ) ) ( not ( = ?auto_365669 ?auto_365681 ) ) ( not ( = ?auto_365669 ?auto_365682 ) ) ( not ( = ?auto_365670 ?auto_365671 ) ) ( not ( = ?auto_365670 ?auto_365672 ) ) ( not ( = ?auto_365670 ?auto_365673 ) ) ( not ( = ?auto_365670 ?auto_365674 ) ) ( not ( = ?auto_365670 ?auto_365675 ) ) ( not ( = ?auto_365670 ?auto_365676 ) ) ( not ( = ?auto_365670 ?auto_365677 ) ) ( not ( = ?auto_365670 ?auto_365678 ) ) ( not ( = ?auto_365670 ?auto_365679 ) ) ( not ( = ?auto_365670 ?auto_365680 ) ) ( not ( = ?auto_365670 ?auto_365681 ) ) ( not ( = ?auto_365670 ?auto_365682 ) ) ( not ( = ?auto_365671 ?auto_365672 ) ) ( not ( = ?auto_365671 ?auto_365673 ) ) ( not ( = ?auto_365671 ?auto_365674 ) ) ( not ( = ?auto_365671 ?auto_365675 ) ) ( not ( = ?auto_365671 ?auto_365676 ) ) ( not ( = ?auto_365671 ?auto_365677 ) ) ( not ( = ?auto_365671 ?auto_365678 ) ) ( not ( = ?auto_365671 ?auto_365679 ) ) ( not ( = ?auto_365671 ?auto_365680 ) ) ( not ( = ?auto_365671 ?auto_365681 ) ) ( not ( = ?auto_365671 ?auto_365682 ) ) ( not ( = ?auto_365672 ?auto_365673 ) ) ( not ( = ?auto_365672 ?auto_365674 ) ) ( not ( = ?auto_365672 ?auto_365675 ) ) ( not ( = ?auto_365672 ?auto_365676 ) ) ( not ( = ?auto_365672 ?auto_365677 ) ) ( not ( = ?auto_365672 ?auto_365678 ) ) ( not ( = ?auto_365672 ?auto_365679 ) ) ( not ( = ?auto_365672 ?auto_365680 ) ) ( not ( = ?auto_365672 ?auto_365681 ) ) ( not ( = ?auto_365672 ?auto_365682 ) ) ( not ( = ?auto_365673 ?auto_365674 ) ) ( not ( = ?auto_365673 ?auto_365675 ) ) ( not ( = ?auto_365673 ?auto_365676 ) ) ( not ( = ?auto_365673 ?auto_365677 ) ) ( not ( = ?auto_365673 ?auto_365678 ) ) ( not ( = ?auto_365673 ?auto_365679 ) ) ( not ( = ?auto_365673 ?auto_365680 ) ) ( not ( = ?auto_365673 ?auto_365681 ) ) ( not ( = ?auto_365673 ?auto_365682 ) ) ( not ( = ?auto_365674 ?auto_365675 ) ) ( not ( = ?auto_365674 ?auto_365676 ) ) ( not ( = ?auto_365674 ?auto_365677 ) ) ( not ( = ?auto_365674 ?auto_365678 ) ) ( not ( = ?auto_365674 ?auto_365679 ) ) ( not ( = ?auto_365674 ?auto_365680 ) ) ( not ( = ?auto_365674 ?auto_365681 ) ) ( not ( = ?auto_365674 ?auto_365682 ) ) ( not ( = ?auto_365675 ?auto_365676 ) ) ( not ( = ?auto_365675 ?auto_365677 ) ) ( not ( = ?auto_365675 ?auto_365678 ) ) ( not ( = ?auto_365675 ?auto_365679 ) ) ( not ( = ?auto_365675 ?auto_365680 ) ) ( not ( = ?auto_365675 ?auto_365681 ) ) ( not ( = ?auto_365675 ?auto_365682 ) ) ( not ( = ?auto_365676 ?auto_365677 ) ) ( not ( = ?auto_365676 ?auto_365678 ) ) ( not ( = ?auto_365676 ?auto_365679 ) ) ( not ( = ?auto_365676 ?auto_365680 ) ) ( not ( = ?auto_365676 ?auto_365681 ) ) ( not ( = ?auto_365676 ?auto_365682 ) ) ( not ( = ?auto_365677 ?auto_365678 ) ) ( not ( = ?auto_365677 ?auto_365679 ) ) ( not ( = ?auto_365677 ?auto_365680 ) ) ( not ( = ?auto_365677 ?auto_365681 ) ) ( not ( = ?auto_365677 ?auto_365682 ) ) ( not ( = ?auto_365678 ?auto_365679 ) ) ( not ( = ?auto_365678 ?auto_365680 ) ) ( not ( = ?auto_365678 ?auto_365681 ) ) ( not ( = ?auto_365678 ?auto_365682 ) ) ( not ( = ?auto_365679 ?auto_365680 ) ) ( not ( = ?auto_365679 ?auto_365681 ) ) ( not ( = ?auto_365679 ?auto_365682 ) ) ( not ( = ?auto_365680 ?auto_365681 ) ) ( not ( = ?auto_365680 ?auto_365682 ) ) ( not ( = ?auto_365681 ?auto_365682 ) ) ( ON ?auto_365681 ?auto_365682 ) ( ON ?auto_365680 ?auto_365681 ) ( ON ?auto_365679 ?auto_365680 ) ( ON ?auto_365678 ?auto_365679 ) ( ON ?auto_365677 ?auto_365678 ) ( ON ?auto_365676 ?auto_365677 ) ( ON ?auto_365675 ?auto_365676 ) ( ON ?auto_365674 ?auto_365675 ) ( ON ?auto_365673 ?auto_365674 ) ( ON ?auto_365672 ?auto_365673 ) ( ON ?auto_365671 ?auto_365672 ) ( CLEAR ?auto_365669 ) ( ON ?auto_365670 ?auto_365671 ) ( CLEAR ?auto_365670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_365668 ?auto_365669 ?auto_365670 )
      ( MAKE-15PILE ?auto_365668 ?auto_365669 ?auto_365670 ?auto_365671 ?auto_365672 ?auto_365673 ?auto_365674 ?auto_365675 ?auto_365676 ?auto_365677 ?auto_365678 ?auto_365679 ?auto_365680 ?auto_365681 ?auto_365682 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_365698 - BLOCK
      ?auto_365699 - BLOCK
      ?auto_365700 - BLOCK
      ?auto_365701 - BLOCK
      ?auto_365702 - BLOCK
      ?auto_365703 - BLOCK
      ?auto_365704 - BLOCK
      ?auto_365705 - BLOCK
      ?auto_365706 - BLOCK
      ?auto_365707 - BLOCK
      ?auto_365708 - BLOCK
      ?auto_365709 - BLOCK
      ?auto_365710 - BLOCK
      ?auto_365711 - BLOCK
      ?auto_365712 - BLOCK
    )
    :vars
    (
      ?auto_365713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_365712 ?auto_365713 ) ( ON-TABLE ?auto_365698 ) ( not ( = ?auto_365698 ?auto_365699 ) ) ( not ( = ?auto_365698 ?auto_365700 ) ) ( not ( = ?auto_365698 ?auto_365701 ) ) ( not ( = ?auto_365698 ?auto_365702 ) ) ( not ( = ?auto_365698 ?auto_365703 ) ) ( not ( = ?auto_365698 ?auto_365704 ) ) ( not ( = ?auto_365698 ?auto_365705 ) ) ( not ( = ?auto_365698 ?auto_365706 ) ) ( not ( = ?auto_365698 ?auto_365707 ) ) ( not ( = ?auto_365698 ?auto_365708 ) ) ( not ( = ?auto_365698 ?auto_365709 ) ) ( not ( = ?auto_365698 ?auto_365710 ) ) ( not ( = ?auto_365698 ?auto_365711 ) ) ( not ( = ?auto_365698 ?auto_365712 ) ) ( not ( = ?auto_365698 ?auto_365713 ) ) ( not ( = ?auto_365699 ?auto_365700 ) ) ( not ( = ?auto_365699 ?auto_365701 ) ) ( not ( = ?auto_365699 ?auto_365702 ) ) ( not ( = ?auto_365699 ?auto_365703 ) ) ( not ( = ?auto_365699 ?auto_365704 ) ) ( not ( = ?auto_365699 ?auto_365705 ) ) ( not ( = ?auto_365699 ?auto_365706 ) ) ( not ( = ?auto_365699 ?auto_365707 ) ) ( not ( = ?auto_365699 ?auto_365708 ) ) ( not ( = ?auto_365699 ?auto_365709 ) ) ( not ( = ?auto_365699 ?auto_365710 ) ) ( not ( = ?auto_365699 ?auto_365711 ) ) ( not ( = ?auto_365699 ?auto_365712 ) ) ( not ( = ?auto_365699 ?auto_365713 ) ) ( not ( = ?auto_365700 ?auto_365701 ) ) ( not ( = ?auto_365700 ?auto_365702 ) ) ( not ( = ?auto_365700 ?auto_365703 ) ) ( not ( = ?auto_365700 ?auto_365704 ) ) ( not ( = ?auto_365700 ?auto_365705 ) ) ( not ( = ?auto_365700 ?auto_365706 ) ) ( not ( = ?auto_365700 ?auto_365707 ) ) ( not ( = ?auto_365700 ?auto_365708 ) ) ( not ( = ?auto_365700 ?auto_365709 ) ) ( not ( = ?auto_365700 ?auto_365710 ) ) ( not ( = ?auto_365700 ?auto_365711 ) ) ( not ( = ?auto_365700 ?auto_365712 ) ) ( not ( = ?auto_365700 ?auto_365713 ) ) ( not ( = ?auto_365701 ?auto_365702 ) ) ( not ( = ?auto_365701 ?auto_365703 ) ) ( not ( = ?auto_365701 ?auto_365704 ) ) ( not ( = ?auto_365701 ?auto_365705 ) ) ( not ( = ?auto_365701 ?auto_365706 ) ) ( not ( = ?auto_365701 ?auto_365707 ) ) ( not ( = ?auto_365701 ?auto_365708 ) ) ( not ( = ?auto_365701 ?auto_365709 ) ) ( not ( = ?auto_365701 ?auto_365710 ) ) ( not ( = ?auto_365701 ?auto_365711 ) ) ( not ( = ?auto_365701 ?auto_365712 ) ) ( not ( = ?auto_365701 ?auto_365713 ) ) ( not ( = ?auto_365702 ?auto_365703 ) ) ( not ( = ?auto_365702 ?auto_365704 ) ) ( not ( = ?auto_365702 ?auto_365705 ) ) ( not ( = ?auto_365702 ?auto_365706 ) ) ( not ( = ?auto_365702 ?auto_365707 ) ) ( not ( = ?auto_365702 ?auto_365708 ) ) ( not ( = ?auto_365702 ?auto_365709 ) ) ( not ( = ?auto_365702 ?auto_365710 ) ) ( not ( = ?auto_365702 ?auto_365711 ) ) ( not ( = ?auto_365702 ?auto_365712 ) ) ( not ( = ?auto_365702 ?auto_365713 ) ) ( not ( = ?auto_365703 ?auto_365704 ) ) ( not ( = ?auto_365703 ?auto_365705 ) ) ( not ( = ?auto_365703 ?auto_365706 ) ) ( not ( = ?auto_365703 ?auto_365707 ) ) ( not ( = ?auto_365703 ?auto_365708 ) ) ( not ( = ?auto_365703 ?auto_365709 ) ) ( not ( = ?auto_365703 ?auto_365710 ) ) ( not ( = ?auto_365703 ?auto_365711 ) ) ( not ( = ?auto_365703 ?auto_365712 ) ) ( not ( = ?auto_365703 ?auto_365713 ) ) ( not ( = ?auto_365704 ?auto_365705 ) ) ( not ( = ?auto_365704 ?auto_365706 ) ) ( not ( = ?auto_365704 ?auto_365707 ) ) ( not ( = ?auto_365704 ?auto_365708 ) ) ( not ( = ?auto_365704 ?auto_365709 ) ) ( not ( = ?auto_365704 ?auto_365710 ) ) ( not ( = ?auto_365704 ?auto_365711 ) ) ( not ( = ?auto_365704 ?auto_365712 ) ) ( not ( = ?auto_365704 ?auto_365713 ) ) ( not ( = ?auto_365705 ?auto_365706 ) ) ( not ( = ?auto_365705 ?auto_365707 ) ) ( not ( = ?auto_365705 ?auto_365708 ) ) ( not ( = ?auto_365705 ?auto_365709 ) ) ( not ( = ?auto_365705 ?auto_365710 ) ) ( not ( = ?auto_365705 ?auto_365711 ) ) ( not ( = ?auto_365705 ?auto_365712 ) ) ( not ( = ?auto_365705 ?auto_365713 ) ) ( not ( = ?auto_365706 ?auto_365707 ) ) ( not ( = ?auto_365706 ?auto_365708 ) ) ( not ( = ?auto_365706 ?auto_365709 ) ) ( not ( = ?auto_365706 ?auto_365710 ) ) ( not ( = ?auto_365706 ?auto_365711 ) ) ( not ( = ?auto_365706 ?auto_365712 ) ) ( not ( = ?auto_365706 ?auto_365713 ) ) ( not ( = ?auto_365707 ?auto_365708 ) ) ( not ( = ?auto_365707 ?auto_365709 ) ) ( not ( = ?auto_365707 ?auto_365710 ) ) ( not ( = ?auto_365707 ?auto_365711 ) ) ( not ( = ?auto_365707 ?auto_365712 ) ) ( not ( = ?auto_365707 ?auto_365713 ) ) ( not ( = ?auto_365708 ?auto_365709 ) ) ( not ( = ?auto_365708 ?auto_365710 ) ) ( not ( = ?auto_365708 ?auto_365711 ) ) ( not ( = ?auto_365708 ?auto_365712 ) ) ( not ( = ?auto_365708 ?auto_365713 ) ) ( not ( = ?auto_365709 ?auto_365710 ) ) ( not ( = ?auto_365709 ?auto_365711 ) ) ( not ( = ?auto_365709 ?auto_365712 ) ) ( not ( = ?auto_365709 ?auto_365713 ) ) ( not ( = ?auto_365710 ?auto_365711 ) ) ( not ( = ?auto_365710 ?auto_365712 ) ) ( not ( = ?auto_365710 ?auto_365713 ) ) ( not ( = ?auto_365711 ?auto_365712 ) ) ( not ( = ?auto_365711 ?auto_365713 ) ) ( not ( = ?auto_365712 ?auto_365713 ) ) ( ON ?auto_365711 ?auto_365712 ) ( ON ?auto_365710 ?auto_365711 ) ( ON ?auto_365709 ?auto_365710 ) ( ON ?auto_365708 ?auto_365709 ) ( ON ?auto_365707 ?auto_365708 ) ( ON ?auto_365706 ?auto_365707 ) ( ON ?auto_365705 ?auto_365706 ) ( ON ?auto_365704 ?auto_365705 ) ( ON ?auto_365703 ?auto_365704 ) ( ON ?auto_365702 ?auto_365703 ) ( ON ?auto_365701 ?auto_365702 ) ( ON ?auto_365700 ?auto_365701 ) ( CLEAR ?auto_365698 ) ( ON ?auto_365699 ?auto_365700 ) ( CLEAR ?auto_365699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_365698 ?auto_365699 )
      ( MAKE-15PILE ?auto_365698 ?auto_365699 ?auto_365700 ?auto_365701 ?auto_365702 ?auto_365703 ?auto_365704 ?auto_365705 ?auto_365706 ?auto_365707 ?auto_365708 ?auto_365709 ?auto_365710 ?auto_365711 ?auto_365712 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_365729 - BLOCK
      ?auto_365730 - BLOCK
      ?auto_365731 - BLOCK
      ?auto_365732 - BLOCK
      ?auto_365733 - BLOCK
      ?auto_365734 - BLOCK
      ?auto_365735 - BLOCK
      ?auto_365736 - BLOCK
      ?auto_365737 - BLOCK
      ?auto_365738 - BLOCK
      ?auto_365739 - BLOCK
      ?auto_365740 - BLOCK
      ?auto_365741 - BLOCK
      ?auto_365742 - BLOCK
      ?auto_365743 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_365743 ) ( ON-TABLE ?auto_365729 ) ( not ( = ?auto_365729 ?auto_365730 ) ) ( not ( = ?auto_365729 ?auto_365731 ) ) ( not ( = ?auto_365729 ?auto_365732 ) ) ( not ( = ?auto_365729 ?auto_365733 ) ) ( not ( = ?auto_365729 ?auto_365734 ) ) ( not ( = ?auto_365729 ?auto_365735 ) ) ( not ( = ?auto_365729 ?auto_365736 ) ) ( not ( = ?auto_365729 ?auto_365737 ) ) ( not ( = ?auto_365729 ?auto_365738 ) ) ( not ( = ?auto_365729 ?auto_365739 ) ) ( not ( = ?auto_365729 ?auto_365740 ) ) ( not ( = ?auto_365729 ?auto_365741 ) ) ( not ( = ?auto_365729 ?auto_365742 ) ) ( not ( = ?auto_365729 ?auto_365743 ) ) ( not ( = ?auto_365730 ?auto_365731 ) ) ( not ( = ?auto_365730 ?auto_365732 ) ) ( not ( = ?auto_365730 ?auto_365733 ) ) ( not ( = ?auto_365730 ?auto_365734 ) ) ( not ( = ?auto_365730 ?auto_365735 ) ) ( not ( = ?auto_365730 ?auto_365736 ) ) ( not ( = ?auto_365730 ?auto_365737 ) ) ( not ( = ?auto_365730 ?auto_365738 ) ) ( not ( = ?auto_365730 ?auto_365739 ) ) ( not ( = ?auto_365730 ?auto_365740 ) ) ( not ( = ?auto_365730 ?auto_365741 ) ) ( not ( = ?auto_365730 ?auto_365742 ) ) ( not ( = ?auto_365730 ?auto_365743 ) ) ( not ( = ?auto_365731 ?auto_365732 ) ) ( not ( = ?auto_365731 ?auto_365733 ) ) ( not ( = ?auto_365731 ?auto_365734 ) ) ( not ( = ?auto_365731 ?auto_365735 ) ) ( not ( = ?auto_365731 ?auto_365736 ) ) ( not ( = ?auto_365731 ?auto_365737 ) ) ( not ( = ?auto_365731 ?auto_365738 ) ) ( not ( = ?auto_365731 ?auto_365739 ) ) ( not ( = ?auto_365731 ?auto_365740 ) ) ( not ( = ?auto_365731 ?auto_365741 ) ) ( not ( = ?auto_365731 ?auto_365742 ) ) ( not ( = ?auto_365731 ?auto_365743 ) ) ( not ( = ?auto_365732 ?auto_365733 ) ) ( not ( = ?auto_365732 ?auto_365734 ) ) ( not ( = ?auto_365732 ?auto_365735 ) ) ( not ( = ?auto_365732 ?auto_365736 ) ) ( not ( = ?auto_365732 ?auto_365737 ) ) ( not ( = ?auto_365732 ?auto_365738 ) ) ( not ( = ?auto_365732 ?auto_365739 ) ) ( not ( = ?auto_365732 ?auto_365740 ) ) ( not ( = ?auto_365732 ?auto_365741 ) ) ( not ( = ?auto_365732 ?auto_365742 ) ) ( not ( = ?auto_365732 ?auto_365743 ) ) ( not ( = ?auto_365733 ?auto_365734 ) ) ( not ( = ?auto_365733 ?auto_365735 ) ) ( not ( = ?auto_365733 ?auto_365736 ) ) ( not ( = ?auto_365733 ?auto_365737 ) ) ( not ( = ?auto_365733 ?auto_365738 ) ) ( not ( = ?auto_365733 ?auto_365739 ) ) ( not ( = ?auto_365733 ?auto_365740 ) ) ( not ( = ?auto_365733 ?auto_365741 ) ) ( not ( = ?auto_365733 ?auto_365742 ) ) ( not ( = ?auto_365733 ?auto_365743 ) ) ( not ( = ?auto_365734 ?auto_365735 ) ) ( not ( = ?auto_365734 ?auto_365736 ) ) ( not ( = ?auto_365734 ?auto_365737 ) ) ( not ( = ?auto_365734 ?auto_365738 ) ) ( not ( = ?auto_365734 ?auto_365739 ) ) ( not ( = ?auto_365734 ?auto_365740 ) ) ( not ( = ?auto_365734 ?auto_365741 ) ) ( not ( = ?auto_365734 ?auto_365742 ) ) ( not ( = ?auto_365734 ?auto_365743 ) ) ( not ( = ?auto_365735 ?auto_365736 ) ) ( not ( = ?auto_365735 ?auto_365737 ) ) ( not ( = ?auto_365735 ?auto_365738 ) ) ( not ( = ?auto_365735 ?auto_365739 ) ) ( not ( = ?auto_365735 ?auto_365740 ) ) ( not ( = ?auto_365735 ?auto_365741 ) ) ( not ( = ?auto_365735 ?auto_365742 ) ) ( not ( = ?auto_365735 ?auto_365743 ) ) ( not ( = ?auto_365736 ?auto_365737 ) ) ( not ( = ?auto_365736 ?auto_365738 ) ) ( not ( = ?auto_365736 ?auto_365739 ) ) ( not ( = ?auto_365736 ?auto_365740 ) ) ( not ( = ?auto_365736 ?auto_365741 ) ) ( not ( = ?auto_365736 ?auto_365742 ) ) ( not ( = ?auto_365736 ?auto_365743 ) ) ( not ( = ?auto_365737 ?auto_365738 ) ) ( not ( = ?auto_365737 ?auto_365739 ) ) ( not ( = ?auto_365737 ?auto_365740 ) ) ( not ( = ?auto_365737 ?auto_365741 ) ) ( not ( = ?auto_365737 ?auto_365742 ) ) ( not ( = ?auto_365737 ?auto_365743 ) ) ( not ( = ?auto_365738 ?auto_365739 ) ) ( not ( = ?auto_365738 ?auto_365740 ) ) ( not ( = ?auto_365738 ?auto_365741 ) ) ( not ( = ?auto_365738 ?auto_365742 ) ) ( not ( = ?auto_365738 ?auto_365743 ) ) ( not ( = ?auto_365739 ?auto_365740 ) ) ( not ( = ?auto_365739 ?auto_365741 ) ) ( not ( = ?auto_365739 ?auto_365742 ) ) ( not ( = ?auto_365739 ?auto_365743 ) ) ( not ( = ?auto_365740 ?auto_365741 ) ) ( not ( = ?auto_365740 ?auto_365742 ) ) ( not ( = ?auto_365740 ?auto_365743 ) ) ( not ( = ?auto_365741 ?auto_365742 ) ) ( not ( = ?auto_365741 ?auto_365743 ) ) ( not ( = ?auto_365742 ?auto_365743 ) ) ( ON ?auto_365742 ?auto_365743 ) ( ON ?auto_365741 ?auto_365742 ) ( ON ?auto_365740 ?auto_365741 ) ( ON ?auto_365739 ?auto_365740 ) ( ON ?auto_365738 ?auto_365739 ) ( ON ?auto_365737 ?auto_365738 ) ( ON ?auto_365736 ?auto_365737 ) ( ON ?auto_365735 ?auto_365736 ) ( ON ?auto_365734 ?auto_365735 ) ( ON ?auto_365733 ?auto_365734 ) ( ON ?auto_365732 ?auto_365733 ) ( ON ?auto_365731 ?auto_365732 ) ( CLEAR ?auto_365729 ) ( ON ?auto_365730 ?auto_365731 ) ( CLEAR ?auto_365730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_365729 ?auto_365730 )
      ( MAKE-15PILE ?auto_365729 ?auto_365730 ?auto_365731 ?auto_365732 ?auto_365733 ?auto_365734 ?auto_365735 ?auto_365736 ?auto_365737 ?auto_365738 ?auto_365739 ?auto_365740 ?auto_365741 ?auto_365742 ?auto_365743 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_365759 - BLOCK
      ?auto_365760 - BLOCK
      ?auto_365761 - BLOCK
      ?auto_365762 - BLOCK
      ?auto_365763 - BLOCK
      ?auto_365764 - BLOCK
      ?auto_365765 - BLOCK
      ?auto_365766 - BLOCK
      ?auto_365767 - BLOCK
      ?auto_365768 - BLOCK
      ?auto_365769 - BLOCK
      ?auto_365770 - BLOCK
      ?auto_365771 - BLOCK
      ?auto_365772 - BLOCK
      ?auto_365773 - BLOCK
    )
    :vars
    (
      ?auto_365774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_365773 ?auto_365774 ) ( not ( = ?auto_365759 ?auto_365760 ) ) ( not ( = ?auto_365759 ?auto_365761 ) ) ( not ( = ?auto_365759 ?auto_365762 ) ) ( not ( = ?auto_365759 ?auto_365763 ) ) ( not ( = ?auto_365759 ?auto_365764 ) ) ( not ( = ?auto_365759 ?auto_365765 ) ) ( not ( = ?auto_365759 ?auto_365766 ) ) ( not ( = ?auto_365759 ?auto_365767 ) ) ( not ( = ?auto_365759 ?auto_365768 ) ) ( not ( = ?auto_365759 ?auto_365769 ) ) ( not ( = ?auto_365759 ?auto_365770 ) ) ( not ( = ?auto_365759 ?auto_365771 ) ) ( not ( = ?auto_365759 ?auto_365772 ) ) ( not ( = ?auto_365759 ?auto_365773 ) ) ( not ( = ?auto_365759 ?auto_365774 ) ) ( not ( = ?auto_365760 ?auto_365761 ) ) ( not ( = ?auto_365760 ?auto_365762 ) ) ( not ( = ?auto_365760 ?auto_365763 ) ) ( not ( = ?auto_365760 ?auto_365764 ) ) ( not ( = ?auto_365760 ?auto_365765 ) ) ( not ( = ?auto_365760 ?auto_365766 ) ) ( not ( = ?auto_365760 ?auto_365767 ) ) ( not ( = ?auto_365760 ?auto_365768 ) ) ( not ( = ?auto_365760 ?auto_365769 ) ) ( not ( = ?auto_365760 ?auto_365770 ) ) ( not ( = ?auto_365760 ?auto_365771 ) ) ( not ( = ?auto_365760 ?auto_365772 ) ) ( not ( = ?auto_365760 ?auto_365773 ) ) ( not ( = ?auto_365760 ?auto_365774 ) ) ( not ( = ?auto_365761 ?auto_365762 ) ) ( not ( = ?auto_365761 ?auto_365763 ) ) ( not ( = ?auto_365761 ?auto_365764 ) ) ( not ( = ?auto_365761 ?auto_365765 ) ) ( not ( = ?auto_365761 ?auto_365766 ) ) ( not ( = ?auto_365761 ?auto_365767 ) ) ( not ( = ?auto_365761 ?auto_365768 ) ) ( not ( = ?auto_365761 ?auto_365769 ) ) ( not ( = ?auto_365761 ?auto_365770 ) ) ( not ( = ?auto_365761 ?auto_365771 ) ) ( not ( = ?auto_365761 ?auto_365772 ) ) ( not ( = ?auto_365761 ?auto_365773 ) ) ( not ( = ?auto_365761 ?auto_365774 ) ) ( not ( = ?auto_365762 ?auto_365763 ) ) ( not ( = ?auto_365762 ?auto_365764 ) ) ( not ( = ?auto_365762 ?auto_365765 ) ) ( not ( = ?auto_365762 ?auto_365766 ) ) ( not ( = ?auto_365762 ?auto_365767 ) ) ( not ( = ?auto_365762 ?auto_365768 ) ) ( not ( = ?auto_365762 ?auto_365769 ) ) ( not ( = ?auto_365762 ?auto_365770 ) ) ( not ( = ?auto_365762 ?auto_365771 ) ) ( not ( = ?auto_365762 ?auto_365772 ) ) ( not ( = ?auto_365762 ?auto_365773 ) ) ( not ( = ?auto_365762 ?auto_365774 ) ) ( not ( = ?auto_365763 ?auto_365764 ) ) ( not ( = ?auto_365763 ?auto_365765 ) ) ( not ( = ?auto_365763 ?auto_365766 ) ) ( not ( = ?auto_365763 ?auto_365767 ) ) ( not ( = ?auto_365763 ?auto_365768 ) ) ( not ( = ?auto_365763 ?auto_365769 ) ) ( not ( = ?auto_365763 ?auto_365770 ) ) ( not ( = ?auto_365763 ?auto_365771 ) ) ( not ( = ?auto_365763 ?auto_365772 ) ) ( not ( = ?auto_365763 ?auto_365773 ) ) ( not ( = ?auto_365763 ?auto_365774 ) ) ( not ( = ?auto_365764 ?auto_365765 ) ) ( not ( = ?auto_365764 ?auto_365766 ) ) ( not ( = ?auto_365764 ?auto_365767 ) ) ( not ( = ?auto_365764 ?auto_365768 ) ) ( not ( = ?auto_365764 ?auto_365769 ) ) ( not ( = ?auto_365764 ?auto_365770 ) ) ( not ( = ?auto_365764 ?auto_365771 ) ) ( not ( = ?auto_365764 ?auto_365772 ) ) ( not ( = ?auto_365764 ?auto_365773 ) ) ( not ( = ?auto_365764 ?auto_365774 ) ) ( not ( = ?auto_365765 ?auto_365766 ) ) ( not ( = ?auto_365765 ?auto_365767 ) ) ( not ( = ?auto_365765 ?auto_365768 ) ) ( not ( = ?auto_365765 ?auto_365769 ) ) ( not ( = ?auto_365765 ?auto_365770 ) ) ( not ( = ?auto_365765 ?auto_365771 ) ) ( not ( = ?auto_365765 ?auto_365772 ) ) ( not ( = ?auto_365765 ?auto_365773 ) ) ( not ( = ?auto_365765 ?auto_365774 ) ) ( not ( = ?auto_365766 ?auto_365767 ) ) ( not ( = ?auto_365766 ?auto_365768 ) ) ( not ( = ?auto_365766 ?auto_365769 ) ) ( not ( = ?auto_365766 ?auto_365770 ) ) ( not ( = ?auto_365766 ?auto_365771 ) ) ( not ( = ?auto_365766 ?auto_365772 ) ) ( not ( = ?auto_365766 ?auto_365773 ) ) ( not ( = ?auto_365766 ?auto_365774 ) ) ( not ( = ?auto_365767 ?auto_365768 ) ) ( not ( = ?auto_365767 ?auto_365769 ) ) ( not ( = ?auto_365767 ?auto_365770 ) ) ( not ( = ?auto_365767 ?auto_365771 ) ) ( not ( = ?auto_365767 ?auto_365772 ) ) ( not ( = ?auto_365767 ?auto_365773 ) ) ( not ( = ?auto_365767 ?auto_365774 ) ) ( not ( = ?auto_365768 ?auto_365769 ) ) ( not ( = ?auto_365768 ?auto_365770 ) ) ( not ( = ?auto_365768 ?auto_365771 ) ) ( not ( = ?auto_365768 ?auto_365772 ) ) ( not ( = ?auto_365768 ?auto_365773 ) ) ( not ( = ?auto_365768 ?auto_365774 ) ) ( not ( = ?auto_365769 ?auto_365770 ) ) ( not ( = ?auto_365769 ?auto_365771 ) ) ( not ( = ?auto_365769 ?auto_365772 ) ) ( not ( = ?auto_365769 ?auto_365773 ) ) ( not ( = ?auto_365769 ?auto_365774 ) ) ( not ( = ?auto_365770 ?auto_365771 ) ) ( not ( = ?auto_365770 ?auto_365772 ) ) ( not ( = ?auto_365770 ?auto_365773 ) ) ( not ( = ?auto_365770 ?auto_365774 ) ) ( not ( = ?auto_365771 ?auto_365772 ) ) ( not ( = ?auto_365771 ?auto_365773 ) ) ( not ( = ?auto_365771 ?auto_365774 ) ) ( not ( = ?auto_365772 ?auto_365773 ) ) ( not ( = ?auto_365772 ?auto_365774 ) ) ( not ( = ?auto_365773 ?auto_365774 ) ) ( ON ?auto_365772 ?auto_365773 ) ( ON ?auto_365771 ?auto_365772 ) ( ON ?auto_365770 ?auto_365771 ) ( ON ?auto_365769 ?auto_365770 ) ( ON ?auto_365768 ?auto_365769 ) ( ON ?auto_365767 ?auto_365768 ) ( ON ?auto_365766 ?auto_365767 ) ( ON ?auto_365765 ?auto_365766 ) ( ON ?auto_365764 ?auto_365765 ) ( ON ?auto_365763 ?auto_365764 ) ( ON ?auto_365762 ?auto_365763 ) ( ON ?auto_365761 ?auto_365762 ) ( ON ?auto_365760 ?auto_365761 ) ( ON ?auto_365759 ?auto_365760 ) ( CLEAR ?auto_365759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_365759 )
      ( MAKE-15PILE ?auto_365759 ?auto_365760 ?auto_365761 ?auto_365762 ?auto_365763 ?auto_365764 ?auto_365765 ?auto_365766 ?auto_365767 ?auto_365768 ?auto_365769 ?auto_365770 ?auto_365771 ?auto_365772 ?auto_365773 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_365790 - BLOCK
      ?auto_365791 - BLOCK
      ?auto_365792 - BLOCK
      ?auto_365793 - BLOCK
      ?auto_365794 - BLOCK
      ?auto_365795 - BLOCK
      ?auto_365796 - BLOCK
      ?auto_365797 - BLOCK
      ?auto_365798 - BLOCK
      ?auto_365799 - BLOCK
      ?auto_365800 - BLOCK
      ?auto_365801 - BLOCK
      ?auto_365802 - BLOCK
      ?auto_365803 - BLOCK
      ?auto_365804 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_365804 ) ( not ( = ?auto_365790 ?auto_365791 ) ) ( not ( = ?auto_365790 ?auto_365792 ) ) ( not ( = ?auto_365790 ?auto_365793 ) ) ( not ( = ?auto_365790 ?auto_365794 ) ) ( not ( = ?auto_365790 ?auto_365795 ) ) ( not ( = ?auto_365790 ?auto_365796 ) ) ( not ( = ?auto_365790 ?auto_365797 ) ) ( not ( = ?auto_365790 ?auto_365798 ) ) ( not ( = ?auto_365790 ?auto_365799 ) ) ( not ( = ?auto_365790 ?auto_365800 ) ) ( not ( = ?auto_365790 ?auto_365801 ) ) ( not ( = ?auto_365790 ?auto_365802 ) ) ( not ( = ?auto_365790 ?auto_365803 ) ) ( not ( = ?auto_365790 ?auto_365804 ) ) ( not ( = ?auto_365791 ?auto_365792 ) ) ( not ( = ?auto_365791 ?auto_365793 ) ) ( not ( = ?auto_365791 ?auto_365794 ) ) ( not ( = ?auto_365791 ?auto_365795 ) ) ( not ( = ?auto_365791 ?auto_365796 ) ) ( not ( = ?auto_365791 ?auto_365797 ) ) ( not ( = ?auto_365791 ?auto_365798 ) ) ( not ( = ?auto_365791 ?auto_365799 ) ) ( not ( = ?auto_365791 ?auto_365800 ) ) ( not ( = ?auto_365791 ?auto_365801 ) ) ( not ( = ?auto_365791 ?auto_365802 ) ) ( not ( = ?auto_365791 ?auto_365803 ) ) ( not ( = ?auto_365791 ?auto_365804 ) ) ( not ( = ?auto_365792 ?auto_365793 ) ) ( not ( = ?auto_365792 ?auto_365794 ) ) ( not ( = ?auto_365792 ?auto_365795 ) ) ( not ( = ?auto_365792 ?auto_365796 ) ) ( not ( = ?auto_365792 ?auto_365797 ) ) ( not ( = ?auto_365792 ?auto_365798 ) ) ( not ( = ?auto_365792 ?auto_365799 ) ) ( not ( = ?auto_365792 ?auto_365800 ) ) ( not ( = ?auto_365792 ?auto_365801 ) ) ( not ( = ?auto_365792 ?auto_365802 ) ) ( not ( = ?auto_365792 ?auto_365803 ) ) ( not ( = ?auto_365792 ?auto_365804 ) ) ( not ( = ?auto_365793 ?auto_365794 ) ) ( not ( = ?auto_365793 ?auto_365795 ) ) ( not ( = ?auto_365793 ?auto_365796 ) ) ( not ( = ?auto_365793 ?auto_365797 ) ) ( not ( = ?auto_365793 ?auto_365798 ) ) ( not ( = ?auto_365793 ?auto_365799 ) ) ( not ( = ?auto_365793 ?auto_365800 ) ) ( not ( = ?auto_365793 ?auto_365801 ) ) ( not ( = ?auto_365793 ?auto_365802 ) ) ( not ( = ?auto_365793 ?auto_365803 ) ) ( not ( = ?auto_365793 ?auto_365804 ) ) ( not ( = ?auto_365794 ?auto_365795 ) ) ( not ( = ?auto_365794 ?auto_365796 ) ) ( not ( = ?auto_365794 ?auto_365797 ) ) ( not ( = ?auto_365794 ?auto_365798 ) ) ( not ( = ?auto_365794 ?auto_365799 ) ) ( not ( = ?auto_365794 ?auto_365800 ) ) ( not ( = ?auto_365794 ?auto_365801 ) ) ( not ( = ?auto_365794 ?auto_365802 ) ) ( not ( = ?auto_365794 ?auto_365803 ) ) ( not ( = ?auto_365794 ?auto_365804 ) ) ( not ( = ?auto_365795 ?auto_365796 ) ) ( not ( = ?auto_365795 ?auto_365797 ) ) ( not ( = ?auto_365795 ?auto_365798 ) ) ( not ( = ?auto_365795 ?auto_365799 ) ) ( not ( = ?auto_365795 ?auto_365800 ) ) ( not ( = ?auto_365795 ?auto_365801 ) ) ( not ( = ?auto_365795 ?auto_365802 ) ) ( not ( = ?auto_365795 ?auto_365803 ) ) ( not ( = ?auto_365795 ?auto_365804 ) ) ( not ( = ?auto_365796 ?auto_365797 ) ) ( not ( = ?auto_365796 ?auto_365798 ) ) ( not ( = ?auto_365796 ?auto_365799 ) ) ( not ( = ?auto_365796 ?auto_365800 ) ) ( not ( = ?auto_365796 ?auto_365801 ) ) ( not ( = ?auto_365796 ?auto_365802 ) ) ( not ( = ?auto_365796 ?auto_365803 ) ) ( not ( = ?auto_365796 ?auto_365804 ) ) ( not ( = ?auto_365797 ?auto_365798 ) ) ( not ( = ?auto_365797 ?auto_365799 ) ) ( not ( = ?auto_365797 ?auto_365800 ) ) ( not ( = ?auto_365797 ?auto_365801 ) ) ( not ( = ?auto_365797 ?auto_365802 ) ) ( not ( = ?auto_365797 ?auto_365803 ) ) ( not ( = ?auto_365797 ?auto_365804 ) ) ( not ( = ?auto_365798 ?auto_365799 ) ) ( not ( = ?auto_365798 ?auto_365800 ) ) ( not ( = ?auto_365798 ?auto_365801 ) ) ( not ( = ?auto_365798 ?auto_365802 ) ) ( not ( = ?auto_365798 ?auto_365803 ) ) ( not ( = ?auto_365798 ?auto_365804 ) ) ( not ( = ?auto_365799 ?auto_365800 ) ) ( not ( = ?auto_365799 ?auto_365801 ) ) ( not ( = ?auto_365799 ?auto_365802 ) ) ( not ( = ?auto_365799 ?auto_365803 ) ) ( not ( = ?auto_365799 ?auto_365804 ) ) ( not ( = ?auto_365800 ?auto_365801 ) ) ( not ( = ?auto_365800 ?auto_365802 ) ) ( not ( = ?auto_365800 ?auto_365803 ) ) ( not ( = ?auto_365800 ?auto_365804 ) ) ( not ( = ?auto_365801 ?auto_365802 ) ) ( not ( = ?auto_365801 ?auto_365803 ) ) ( not ( = ?auto_365801 ?auto_365804 ) ) ( not ( = ?auto_365802 ?auto_365803 ) ) ( not ( = ?auto_365802 ?auto_365804 ) ) ( not ( = ?auto_365803 ?auto_365804 ) ) ( ON ?auto_365803 ?auto_365804 ) ( ON ?auto_365802 ?auto_365803 ) ( ON ?auto_365801 ?auto_365802 ) ( ON ?auto_365800 ?auto_365801 ) ( ON ?auto_365799 ?auto_365800 ) ( ON ?auto_365798 ?auto_365799 ) ( ON ?auto_365797 ?auto_365798 ) ( ON ?auto_365796 ?auto_365797 ) ( ON ?auto_365795 ?auto_365796 ) ( ON ?auto_365794 ?auto_365795 ) ( ON ?auto_365793 ?auto_365794 ) ( ON ?auto_365792 ?auto_365793 ) ( ON ?auto_365791 ?auto_365792 ) ( ON ?auto_365790 ?auto_365791 ) ( CLEAR ?auto_365790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_365790 )
      ( MAKE-15PILE ?auto_365790 ?auto_365791 ?auto_365792 ?auto_365793 ?auto_365794 ?auto_365795 ?auto_365796 ?auto_365797 ?auto_365798 ?auto_365799 ?auto_365800 ?auto_365801 ?auto_365802 ?auto_365803 ?auto_365804 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_365820 - BLOCK
      ?auto_365821 - BLOCK
      ?auto_365822 - BLOCK
      ?auto_365823 - BLOCK
      ?auto_365824 - BLOCK
      ?auto_365825 - BLOCK
      ?auto_365826 - BLOCK
      ?auto_365827 - BLOCK
      ?auto_365828 - BLOCK
      ?auto_365829 - BLOCK
      ?auto_365830 - BLOCK
      ?auto_365831 - BLOCK
      ?auto_365832 - BLOCK
      ?auto_365833 - BLOCK
      ?auto_365834 - BLOCK
    )
    :vars
    (
      ?auto_365835 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_365820 ?auto_365821 ) ) ( not ( = ?auto_365820 ?auto_365822 ) ) ( not ( = ?auto_365820 ?auto_365823 ) ) ( not ( = ?auto_365820 ?auto_365824 ) ) ( not ( = ?auto_365820 ?auto_365825 ) ) ( not ( = ?auto_365820 ?auto_365826 ) ) ( not ( = ?auto_365820 ?auto_365827 ) ) ( not ( = ?auto_365820 ?auto_365828 ) ) ( not ( = ?auto_365820 ?auto_365829 ) ) ( not ( = ?auto_365820 ?auto_365830 ) ) ( not ( = ?auto_365820 ?auto_365831 ) ) ( not ( = ?auto_365820 ?auto_365832 ) ) ( not ( = ?auto_365820 ?auto_365833 ) ) ( not ( = ?auto_365820 ?auto_365834 ) ) ( not ( = ?auto_365821 ?auto_365822 ) ) ( not ( = ?auto_365821 ?auto_365823 ) ) ( not ( = ?auto_365821 ?auto_365824 ) ) ( not ( = ?auto_365821 ?auto_365825 ) ) ( not ( = ?auto_365821 ?auto_365826 ) ) ( not ( = ?auto_365821 ?auto_365827 ) ) ( not ( = ?auto_365821 ?auto_365828 ) ) ( not ( = ?auto_365821 ?auto_365829 ) ) ( not ( = ?auto_365821 ?auto_365830 ) ) ( not ( = ?auto_365821 ?auto_365831 ) ) ( not ( = ?auto_365821 ?auto_365832 ) ) ( not ( = ?auto_365821 ?auto_365833 ) ) ( not ( = ?auto_365821 ?auto_365834 ) ) ( not ( = ?auto_365822 ?auto_365823 ) ) ( not ( = ?auto_365822 ?auto_365824 ) ) ( not ( = ?auto_365822 ?auto_365825 ) ) ( not ( = ?auto_365822 ?auto_365826 ) ) ( not ( = ?auto_365822 ?auto_365827 ) ) ( not ( = ?auto_365822 ?auto_365828 ) ) ( not ( = ?auto_365822 ?auto_365829 ) ) ( not ( = ?auto_365822 ?auto_365830 ) ) ( not ( = ?auto_365822 ?auto_365831 ) ) ( not ( = ?auto_365822 ?auto_365832 ) ) ( not ( = ?auto_365822 ?auto_365833 ) ) ( not ( = ?auto_365822 ?auto_365834 ) ) ( not ( = ?auto_365823 ?auto_365824 ) ) ( not ( = ?auto_365823 ?auto_365825 ) ) ( not ( = ?auto_365823 ?auto_365826 ) ) ( not ( = ?auto_365823 ?auto_365827 ) ) ( not ( = ?auto_365823 ?auto_365828 ) ) ( not ( = ?auto_365823 ?auto_365829 ) ) ( not ( = ?auto_365823 ?auto_365830 ) ) ( not ( = ?auto_365823 ?auto_365831 ) ) ( not ( = ?auto_365823 ?auto_365832 ) ) ( not ( = ?auto_365823 ?auto_365833 ) ) ( not ( = ?auto_365823 ?auto_365834 ) ) ( not ( = ?auto_365824 ?auto_365825 ) ) ( not ( = ?auto_365824 ?auto_365826 ) ) ( not ( = ?auto_365824 ?auto_365827 ) ) ( not ( = ?auto_365824 ?auto_365828 ) ) ( not ( = ?auto_365824 ?auto_365829 ) ) ( not ( = ?auto_365824 ?auto_365830 ) ) ( not ( = ?auto_365824 ?auto_365831 ) ) ( not ( = ?auto_365824 ?auto_365832 ) ) ( not ( = ?auto_365824 ?auto_365833 ) ) ( not ( = ?auto_365824 ?auto_365834 ) ) ( not ( = ?auto_365825 ?auto_365826 ) ) ( not ( = ?auto_365825 ?auto_365827 ) ) ( not ( = ?auto_365825 ?auto_365828 ) ) ( not ( = ?auto_365825 ?auto_365829 ) ) ( not ( = ?auto_365825 ?auto_365830 ) ) ( not ( = ?auto_365825 ?auto_365831 ) ) ( not ( = ?auto_365825 ?auto_365832 ) ) ( not ( = ?auto_365825 ?auto_365833 ) ) ( not ( = ?auto_365825 ?auto_365834 ) ) ( not ( = ?auto_365826 ?auto_365827 ) ) ( not ( = ?auto_365826 ?auto_365828 ) ) ( not ( = ?auto_365826 ?auto_365829 ) ) ( not ( = ?auto_365826 ?auto_365830 ) ) ( not ( = ?auto_365826 ?auto_365831 ) ) ( not ( = ?auto_365826 ?auto_365832 ) ) ( not ( = ?auto_365826 ?auto_365833 ) ) ( not ( = ?auto_365826 ?auto_365834 ) ) ( not ( = ?auto_365827 ?auto_365828 ) ) ( not ( = ?auto_365827 ?auto_365829 ) ) ( not ( = ?auto_365827 ?auto_365830 ) ) ( not ( = ?auto_365827 ?auto_365831 ) ) ( not ( = ?auto_365827 ?auto_365832 ) ) ( not ( = ?auto_365827 ?auto_365833 ) ) ( not ( = ?auto_365827 ?auto_365834 ) ) ( not ( = ?auto_365828 ?auto_365829 ) ) ( not ( = ?auto_365828 ?auto_365830 ) ) ( not ( = ?auto_365828 ?auto_365831 ) ) ( not ( = ?auto_365828 ?auto_365832 ) ) ( not ( = ?auto_365828 ?auto_365833 ) ) ( not ( = ?auto_365828 ?auto_365834 ) ) ( not ( = ?auto_365829 ?auto_365830 ) ) ( not ( = ?auto_365829 ?auto_365831 ) ) ( not ( = ?auto_365829 ?auto_365832 ) ) ( not ( = ?auto_365829 ?auto_365833 ) ) ( not ( = ?auto_365829 ?auto_365834 ) ) ( not ( = ?auto_365830 ?auto_365831 ) ) ( not ( = ?auto_365830 ?auto_365832 ) ) ( not ( = ?auto_365830 ?auto_365833 ) ) ( not ( = ?auto_365830 ?auto_365834 ) ) ( not ( = ?auto_365831 ?auto_365832 ) ) ( not ( = ?auto_365831 ?auto_365833 ) ) ( not ( = ?auto_365831 ?auto_365834 ) ) ( not ( = ?auto_365832 ?auto_365833 ) ) ( not ( = ?auto_365832 ?auto_365834 ) ) ( not ( = ?auto_365833 ?auto_365834 ) ) ( ON ?auto_365820 ?auto_365835 ) ( not ( = ?auto_365834 ?auto_365835 ) ) ( not ( = ?auto_365833 ?auto_365835 ) ) ( not ( = ?auto_365832 ?auto_365835 ) ) ( not ( = ?auto_365831 ?auto_365835 ) ) ( not ( = ?auto_365830 ?auto_365835 ) ) ( not ( = ?auto_365829 ?auto_365835 ) ) ( not ( = ?auto_365828 ?auto_365835 ) ) ( not ( = ?auto_365827 ?auto_365835 ) ) ( not ( = ?auto_365826 ?auto_365835 ) ) ( not ( = ?auto_365825 ?auto_365835 ) ) ( not ( = ?auto_365824 ?auto_365835 ) ) ( not ( = ?auto_365823 ?auto_365835 ) ) ( not ( = ?auto_365822 ?auto_365835 ) ) ( not ( = ?auto_365821 ?auto_365835 ) ) ( not ( = ?auto_365820 ?auto_365835 ) ) ( ON ?auto_365821 ?auto_365820 ) ( ON ?auto_365822 ?auto_365821 ) ( ON ?auto_365823 ?auto_365822 ) ( ON ?auto_365824 ?auto_365823 ) ( ON ?auto_365825 ?auto_365824 ) ( ON ?auto_365826 ?auto_365825 ) ( ON ?auto_365827 ?auto_365826 ) ( ON ?auto_365828 ?auto_365827 ) ( ON ?auto_365829 ?auto_365828 ) ( ON ?auto_365830 ?auto_365829 ) ( ON ?auto_365831 ?auto_365830 ) ( ON ?auto_365832 ?auto_365831 ) ( ON ?auto_365833 ?auto_365832 ) ( ON ?auto_365834 ?auto_365833 ) ( CLEAR ?auto_365834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_365834 ?auto_365833 ?auto_365832 ?auto_365831 ?auto_365830 ?auto_365829 ?auto_365828 ?auto_365827 ?auto_365826 ?auto_365825 ?auto_365824 ?auto_365823 ?auto_365822 ?auto_365821 ?auto_365820 )
      ( MAKE-15PILE ?auto_365820 ?auto_365821 ?auto_365822 ?auto_365823 ?auto_365824 ?auto_365825 ?auto_365826 ?auto_365827 ?auto_365828 ?auto_365829 ?auto_365830 ?auto_365831 ?auto_365832 ?auto_365833 ?auto_365834 ) )
  )

)

