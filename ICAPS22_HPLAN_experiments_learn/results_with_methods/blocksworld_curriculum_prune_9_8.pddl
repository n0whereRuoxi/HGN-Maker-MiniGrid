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
      ?auto_58641 - BLOCK
    )
    :vars
    (
      ?auto_58642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58641 ?auto_58642 ) ( CLEAR ?auto_58641 ) ( HAND-EMPTY ) ( not ( = ?auto_58641 ?auto_58642 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58641 ?auto_58642 )
      ( !PUTDOWN ?auto_58641 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58648 - BLOCK
      ?auto_58649 - BLOCK
    )
    :vars
    (
      ?auto_58650 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_58648 ) ( ON ?auto_58649 ?auto_58650 ) ( CLEAR ?auto_58649 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58648 ) ( not ( = ?auto_58648 ?auto_58649 ) ) ( not ( = ?auto_58648 ?auto_58650 ) ) ( not ( = ?auto_58649 ?auto_58650 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58649 ?auto_58650 )
      ( !STACK ?auto_58649 ?auto_58648 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58658 - BLOCK
      ?auto_58659 - BLOCK
    )
    :vars
    (
      ?auto_58660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58659 ?auto_58660 ) ( not ( = ?auto_58658 ?auto_58659 ) ) ( not ( = ?auto_58658 ?auto_58660 ) ) ( not ( = ?auto_58659 ?auto_58660 ) ) ( ON ?auto_58658 ?auto_58659 ) ( CLEAR ?auto_58658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58658 )
      ( MAKE-2PILE ?auto_58658 ?auto_58659 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58669 - BLOCK
      ?auto_58670 - BLOCK
      ?auto_58671 - BLOCK
    )
    :vars
    (
      ?auto_58672 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_58670 ) ( ON ?auto_58671 ?auto_58672 ) ( CLEAR ?auto_58671 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58669 ) ( ON ?auto_58670 ?auto_58669 ) ( not ( = ?auto_58669 ?auto_58670 ) ) ( not ( = ?auto_58669 ?auto_58671 ) ) ( not ( = ?auto_58669 ?auto_58672 ) ) ( not ( = ?auto_58670 ?auto_58671 ) ) ( not ( = ?auto_58670 ?auto_58672 ) ) ( not ( = ?auto_58671 ?auto_58672 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58671 ?auto_58672 )
      ( !STACK ?auto_58671 ?auto_58670 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58683 - BLOCK
      ?auto_58684 - BLOCK
      ?auto_58685 - BLOCK
    )
    :vars
    (
      ?auto_58686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58685 ?auto_58686 ) ( ON-TABLE ?auto_58683 ) ( not ( = ?auto_58683 ?auto_58684 ) ) ( not ( = ?auto_58683 ?auto_58685 ) ) ( not ( = ?auto_58683 ?auto_58686 ) ) ( not ( = ?auto_58684 ?auto_58685 ) ) ( not ( = ?auto_58684 ?auto_58686 ) ) ( not ( = ?auto_58685 ?auto_58686 ) ) ( CLEAR ?auto_58683 ) ( ON ?auto_58684 ?auto_58685 ) ( CLEAR ?auto_58684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58683 ?auto_58684 )
      ( MAKE-3PILE ?auto_58683 ?auto_58684 ?auto_58685 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58697 - BLOCK
      ?auto_58698 - BLOCK
      ?auto_58699 - BLOCK
    )
    :vars
    (
      ?auto_58700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58699 ?auto_58700 ) ( not ( = ?auto_58697 ?auto_58698 ) ) ( not ( = ?auto_58697 ?auto_58699 ) ) ( not ( = ?auto_58697 ?auto_58700 ) ) ( not ( = ?auto_58698 ?auto_58699 ) ) ( not ( = ?auto_58698 ?auto_58700 ) ) ( not ( = ?auto_58699 ?auto_58700 ) ) ( ON ?auto_58698 ?auto_58699 ) ( ON ?auto_58697 ?auto_58698 ) ( CLEAR ?auto_58697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58697 )
      ( MAKE-3PILE ?auto_58697 ?auto_58698 ?auto_58699 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58712 - BLOCK
      ?auto_58713 - BLOCK
      ?auto_58714 - BLOCK
      ?auto_58715 - BLOCK
    )
    :vars
    (
      ?auto_58716 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_58714 ) ( ON ?auto_58715 ?auto_58716 ) ( CLEAR ?auto_58715 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58712 ) ( ON ?auto_58713 ?auto_58712 ) ( ON ?auto_58714 ?auto_58713 ) ( not ( = ?auto_58712 ?auto_58713 ) ) ( not ( = ?auto_58712 ?auto_58714 ) ) ( not ( = ?auto_58712 ?auto_58715 ) ) ( not ( = ?auto_58712 ?auto_58716 ) ) ( not ( = ?auto_58713 ?auto_58714 ) ) ( not ( = ?auto_58713 ?auto_58715 ) ) ( not ( = ?auto_58713 ?auto_58716 ) ) ( not ( = ?auto_58714 ?auto_58715 ) ) ( not ( = ?auto_58714 ?auto_58716 ) ) ( not ( = ?auto_58715 ?auto_58716 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58715 ?auto_58716 )
      ( !STACK ?auto_58715 ?auto_58714 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58730 - BLOCK
      ?auto_58731 - BLOCK
      ?auto_58732 - BLOCK
      ?auto_58733 - BLOCK
    )
    :vars
    (
      ?auto_58734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58733 ?auto_58734 ) ( ON-TABLE ?auto_58730 ) ( ON ?auto_58731 ?auto_58730 ) ( not ( = ?auto_58730 ?auto_58731 ) ) ( not ( = ?auto_58730 ?auto_58732 ) ) ( not ( = ?auto_58730 ?auto_58733 ) ) ( not ( = ?auto_58730 ?auto_58734 ) ) ( not ( = ?auto_58731 ?auto_58732 ) ) ( not ( = ?auto_58731 ?auto_58733 ) ) ( not ( = ?auto_58731 ?auto_58734 ) ) ( not ( = ?auto_58732 ?auto_58733 ) ) ( not ( = ?auto_58732 ?auto_58734 ) ) ( not ( = ?auto_58733 ?auto_58734 ) ) ( CLEAR ?auto_58731 ) ( ON ?auto_58732 ?auto_58733 ) ( CLEAR ?auto_58732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58730 ?auto_58731 ?auto_58732 )
      ( MAKE-4PILE ?auto_58730 ?auto_58731 ?auto_58732 ?auto_58733 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58748 - BLOCK
      ?auto_58749 - BLOCK
      ?auto_58750 - BLOCK
      ?auto_58751 - BLOCK
    )
    :vars
    (
      ?auto_58752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58751 ?auto_58752 ) ( ON-TABLE ?auto_58748 ) ( not ( = ?auto_58748 ?auto_58749 ) ) ( not ( = ?auto_58748 ?auto_58750 ) ) ( not ( = ?auto_58748 ?auto_58751 ) ) ( not ( = ?auto_58748 ?auto_58752 ) ) ( not ( = ?auto_58749 ?auto_58750 ) ) ( not ( = ?auto_58749 ?auto_58751 ) ) ( not ( = ?auto_58749 ?auto_58752 ) ) ( not ( = ?auto_58750 ?auto_58751 ) ) ( not ( = ?auto_58750 ?auto_58752 ) ) ( not ( = ?auto_58751 ?auto_58752 ) ) ( ON ?auto_58750 ?auto_58751 ) ( CLEAR ?auto_58748 ) ( ON ?auto_58749 ?auto_58750 ) ( CLEAR ?auto_58749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58748 ?auto_58749 )
      ( MAKE-4PILE ?auto_58748 ?auto_58749 ?auto_58750 ?auto_58751 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58766 - BLOCK
      ?auto_58767 - BLOCK
      ?auto_58768 - BLOCK
      ?auto_58769 - BLOCK
    )
    :vars
    (
      ?auto_58770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58769 ?auto_58770 ) ( not ( = ?auto_58766 ?auto_58767 ) ) ( not ( = ?auto_58766 ?auto_58768 ) ) ( not ( = ?auto_58766 ?auto_58769 ) ) ( not ( = ?auto_58766 ?auto_58770 ) ) ( not ( = ?auto_58767 ?auto_58768 ) ) ( not ( = ?auto_58767 ?auto_58769 ) ) ( not ( = ?auto_58767 ?auto_58770 ) ) ( not ( = ?auto_58768 ?auto_58769 ) ) ( not ( = ?auto_58768 ?auto_58770 ) ) ( not ( = ?auto_58769 ?auto_58770 ) ) ( ON ?auto_58768 ?auto_58769 ) ( ON ?auto_58767 ?auto_58768 ) ( ON ?auto_58766 ?auto_58767 ) ( CLEAR ?auto_58766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58766 )
      ( MAKE-4PILE ?auto_58766 ?auto_58767 ?auto_58768 ?auto_58769 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58785 - BLOCK
      ?auto_58786 - BLOCK
      ?auto_58787 - BLOCK
      ?auto_58788 - BLOCK
      ?auto_58789 - BLOCK
    )
    :vars
    (
      ?auto_58790 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_58788 ) ( ON ?auto_58789 ?auto_58790 ) ( CLEAR ?auto_58789 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58785 ) ( ON ?auto_58786 ?auto_58785 ) ( ON ?auto_58787 ?auto_58786 ) ( ON ?auto_58788 ?auto_58787 ) ( not ( = ?auto_58785 ?auto_58786 ) ) ( not ( = ?auto_58785 ?auto_58787 ) ) ( not ( = ?auto_58785 ?auto_58788 ) ) ( not ( = ?auto_58785 ?auto_58789 ) ) ( not ( = ?auto_58785 ?auto_58790 ) ) ( not ( = ?auto_58786 ?auto_58787 ) ) ( not ( = ?auto_58786 ?auto_58788 ) ) ( not ( = ?auto_58786 ?auto_58789 ) ) ( not ( = ?auto_58786 ?auto_58790 ) ) ( not ( = ?auto_58787 ?auto_58788 ) ) ( not ( = ?auto_58787 ?auto_58789 ) ) ( not ( = ?auto_58787 ?auto_58790 ) ) ( not ( = ?auto_58788 ?auto_58789 ) ) ( not ( = ?auto_58788 ?auto_58790 ) ) ( not ( = ?auto_58789 ?auto_58790 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58789 ?auto_58790 )
      ( !STACK ?auto_58789 ?auto_58788 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58807 - BLOCK
      ?auto_58808 - BLOCK
      ?auto_58809 - BLOCK
      ?auto_58810 - BLOCK
      ?auto_58811 - BLOCK
    )
    :vars
    (
      ?auto_58812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58811 ?auto_58812 ) ( ON-TABLE ?auto_58807 ) ( ON ?auto_58808 ?auto_58807 ) ( ON ?auto_58809 ?auto_58808 ) ( not ( = ?auto_58807 ?auto_58808 ) ) ( not ( = ?auto_58807 ?auto_58809 ) ) ( not ( = ?auto_58807 ?auto_58810 ) ) ( not ( = ?auto_58807 ?auto_58811 ) ) ( not ( = ?auto_58807 ?auto_58812 ) ) ( not ( = ?auto_58808 ?auto_58809 ) ) ( not ( = ?auto_58808 ?auto_58810 ) ) ( not ( = ?auto_58808 ?auto_58811 ) ) ( not ( = ?auto_58808 ?auto_58812 ) ) ( not ( = ?auto_58809 ?auto_58810 ) ) ( not ( = ?auto_58809 ?auto_58811 ) ) ( not ( = ?auto_58809 ?auto_58812 ) ) ( not ( = ?auto_58810 ?auto_58811 ) ) ( not ( = ?auto_58810 ?auto_58812 ) ) ( not ( = ?auto_58811 ?auto_58812 ) ) ( CLEAR ?auto_58809 ) ( ON ?auto_58810 ?auto_58811 ) ( CLEAR ?auto_58810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58807 ?auto_58808 ?auto_58809 ?auto_58810 )
      ( MAKE-5PILE ?auto_58807 ?auto_58808 ?auto_58809 ?auto_58810 ?auto_58811 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58829 - BLOCK
      ?auto_58830 - BLOCK
      ?auto_58831 - BLOCK
      ?auto_58832 - BLOCK
      ?auto_58833 - BLOCK
    )
    :vars
    (
      ?auto_58834 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58833 ?auto_58834 ) ( ON-TABLE ?auto_58829 ) ( ON ?auto_58830 ?auto_58829 ) ( not ( = ?auto_58829 ?auto_58830 ) ) ( not ( = ?auto_58829 ?auto_58831 ) ) ( not ( = ?auto_58829 ?auto_58832 ) ) ( not ( = ?auto_58829 ?auto_58833 ) ) ( not ( = ?auto_58829 ?auto_58834 ) ) ( not ( = ?auto_58830 ?auto_58831 ) ) ( not ( = ?auto_58830 ?auto_58832 ) ) ( not ( = ?auto_58830 ?auto_58833 ) ) ( not ( = ?auto_58830 ?auto_58834 ) ) ( not ( = ?auto_58831 ?auto_58832 ) ) ( not ( = ?auto_58831 ?auto_58833 ) ) ( not ( = ?auto_58831 ?auto_58834 ) ) ( not ( = ?auto_58832 ?auto_58833 ) ) ( not ( = ?auto_58832 ?auto_58834 ) ) ( not ( = ?auto_58833 ?auto_58834 ) ) ( ON ?auto_58832 ?auto_58833 ) ( CLEAR ?auto_58830 ) ( ON ?auto_58831 ?auto_58832 ) ( CLEAR ?auto_58831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58829 ?auto_58830 ?auto_58831 )
      ( MAKE-5PILE ?auto_58829 ?auto_58830 ?auto_58831 ?auto_58832 ?auto_58833 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58851 - BLOCK
      ?auto_58852 - BLOCK
      ?auto_58853 - BLOCK
      ?auto_58854 - BLOCK
      ?auto_58855 - BLOCK
    )
    :vars
    (
      ?auto_58856 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58855 ?auto_58856 ) ( ON-TABLE ?auto_58851 ) ( not ( = ?auto_58851 ?auto_58852 ) ) ( not ( = ?auto_58851 ?auto_58853 ) ) ( not ( = ?auto_58851 ?auto_58854 ) ) ( not ( = ?auto_58851 ?auto_58855 ) ) ( not ( = ?auto_58851 ?auto_58856 ) ) ( not ( = ?auto_58852 ?auto_58853 ) ) ( not ( = ?auto_58852 ?auto_58854 ) ) ( not ( = ?auto_58852 ?auto_58855 ) ) ( not ( = ?auto_58852 ?auto_58856 ) ) ( not ( = ?auto_58853 ?auto_58854 ) ) ( not ( = ?auto_58853 ?auto_58855 ) ) ( not ( = ?auto_58853 ?auto_58856 ) ) ( not ( = ?auto_58854 ?auto_58855 ) ) ( not ( = ?auto_58854 ?auto_58856 ) ) ( not ( = ?auto_58855 ?auto_58856 ) ) ( ON ?auto_58854 ?auto_58855 ) ( ON ?auto_58853 ?auto_58854 ) ( CLEAR ?auto_58851 ) ( ON ?auto_58852 ?auto_58853 ) ( CLEAR ?auto_58852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58851 ?auto_58852 )
      ( MAKE-5PILE ?auto_58851 ?auto_58852 ?auto_58853 ?auto_58854 ?auto_58855 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58873 - BLOCK
      ?auto_58874 - BLOCK
      ?auto_58875 - BLOCK
      ?auto_58876 - BLOCK
      ?auto_58877 - BLOCK
    )
    :vars
    (
      ?auto_58878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58877 ?auto_58878 ) ( not ( = ?auto_58873 ?auto_58874 ) ) ( not ( = ?auto_58873 ?auto_58875 ) ) ( not ( = ?auto_58873 ?auto_58876 ) ) ( not ( = ?auto_58873 ?auto_58877 ) ) ( not ( = ?auto_58873 ?auto_58878 ) ) ( not ( = ?auto_58874 ?auto_58875 ) ) ( not ( = ?auto_58874 ?auto_58876 ) ) ( not ( = ?auto_58874 ?auto_58877 ) ) ( not ( = ?auto_58874 ?auto_58878 ) ) ( not ( = ?auto_58875 ?auto_58876 ) ) ( not ( = ?auto_58875 ?auto_58877 ) ) ( not ( = ?auto_58875 ?auto_58878 ) ) ( not ( = ?auto_58876 ?auto_58877 ) ) ( not ( = ?auto_58876 ?auto_58878 ) ) ( not ( = ?auto_58877 ?auto_58878 ) ) ( ON ?auto_58876 ?auto_58877 ) ( ON ?auto_58875 ?auto_58876 ) ( ON ?auto_58874 ?auto_58875 ) ( ON ?auto_58873 ?auto_58874 ) ( CLEAR ?auto_58873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58873 )
      ( MAKE-5PILE ?auto_58873 ?auto_58874 ?auto_58875 ?auto_58876 ?auto_58877 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58896 - BLOCK
      ?auto_58897 - BLOCK
      ?auto_58898 - BLOCK
      ?auto_58899 - BLOCK
      ?auto_58900 - BLOCK
      ?auto_58901 - BLOCK
    )
    :vars
    (
      ?auto_58902 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_58900 ) ( ON ?auto_58901 ?auto_58902 ) ( CLEAR ?auto_58901 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58896 ) ( ON ?auto_58897 ?auto_58896 ) ( ON ?auto_58898 ?auto_58897 ) ( ON ?auto_58899 ?auto_58898 ) ( ON ?auto_58900 ?auto_58899 ) ( not ( = ?auto_58896 ?auto_58897 ) ) ( not ( = ?auto_58896 ?auto_58898 ) ) ( not ( = ?auto_58896 ?auto_58899 ) ) ( not ( = ?auto_58896 ?auto_58900 ) ) ( not ( = ?auto_58896 ?auto_58901 ) ) ( not ( = ?auto_58896 ?auto_58902 ) ) ( not ( = ?auto_58897 ?auto_58898 ) ) ( not ( = ?auto_58897 ?auto_58899 ) ) ( not ( = ?auto_58897 ?auto_58900 ) ) ( not ( = ?auto_58897 ?auto_58901 ) ) ( not ( = ?auto_58897 ?auto_58902 ) ) ( not ( = ?auto_58898 ?auto_58899 ) ) ( not ( = ?auto_58898 ?auto_58900 ) ) ( not ( = ?auto_58898 ?auto_58901 ) ) ( not ( = ?auto_58898 ?auto_58902 ) ) ( not ( = ?auto_58899 ?auto_58900 ) ) ( not ( = ?auto_58899 ?auto_58901 ) ) ( not ( = ?auto_58899 ?auto_58902 ) ) ( not ( = ?auto_58900 ?auto_58901 ) ) ( not ( = ?auto_58900 ?auto_58902 ) ) ( not ( = ?auto_58901 ?auto_58902 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58901 ?auto_58902 )
      ( !STACK ?auto_58901 ?auto_58900 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58922 - BLOCK
      ?auto_58923 - BLOCK
      ?auto_58924 - BLOCK
      ?auto_58925 - BLOCK
      ?auto_58926 - BLOCK
      ?auto_58927 - BLOCK
    )
    :vars
    (
      ?auto_58928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58927 ?auto_58928 ) ( ON-TABLE ?auto_58922 ) ( ON ?auto_58923 ?auto_58922 ) ( ON ?auto_58924 ?auto_58923 ) ( ON ?auto_58925 ?auto_58924 ) ( not ( = ?auto_58922 ?auto_58923 ) ) ( not ( = ?auto_58922 ?auto_58924 ) ) ( not ( = ?auto_58922 ?auto_58925 ) ) ( not ( = ?auto_58922 ?auto_58926 ) ) ( not ( = ?auto_58922 ?auto_58927 ) ) ( not ( = ?auto_58922 ?auto_58928 ) ) ( not ( = ?auto_58923 ?auto_58924 ) ) ( not ( = ?auto_58923 ?auto_58925 ) ) ( not ( = ?auto_58923 ?auto_58926 ) ) ( not ( = ?auto_58923 ?auto_58927 ) ) ( not ( = ?auto_58923 ?auto_58928 ) ) ( not ( = ?auto_58924 ?auto_58925 ) ) ( not ( = ?auto_58924 ?auto_58926 ) ) ( not ( = ?auto_58924 ?auto_58927 ) ) ( not ( = ?auto_58924 ?auto_58928 ) ) ( not ( = ?auto_58925 ?auto_58926 ) ) ( not ( = ?auto_58925 ?auto_58927 ) ) ( not ( = ?auto_58925 ?auto_58928 ) ) ( not ( = ?auto_58926 ?auto_58927 ) ) ( not ( = ?auto_58926 ?auto_58928 ) ) ( not ( = ?auto_58927 ?auto_58928 ) ) ( CLEAR ?auto_58925 ) ( ON ?auto_58926 ?auto_58927 ) ( CLEAR ?auto_58926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58922 ?auto_58923 ?auto_58924 ?auto_58925 ?auto_58926 )
      ( MAKE-6PILE ?auto_58922 ?auto_58923 ?auto_58924 ?auto_58925 ?auto_58926 ?auto_58927 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58948 - BLOCK
      ?auto_58949 - BLOCK
      ?auto_58950 - BLOCK
      ?auto_58951 - BLOCK
      ?auto_58952 - BLOCK
      ?auto_58953 - BLOCK
    )
    :vars
    (
      ?auto_58954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58953 ?auto_58954 ) ( ON-TABLE ?auto_58948 ) ( ON ?auto_58949 ?auto_58948 ) ( ON ?auto_58950 ?auto_58949 ) ( not ( = ?auto_58948 ?auto_58949 ) ) ( not ( = ?auto_58948 ?auto_58950 ) ) ( not ( = ?auto_58948 ?auto_58951 ) ) ( not ( = ?auto_58948 ?auto_58952 ) ) ( not ( = ?auto_58948 ?auto_58953 ) ) ( not ( = ?auto_58948 ?auto_58954 ) ) ( not ( = ?auto_58949 ?auto_58950 ) ) ( not ( = ?auto_58949 ?auto_58951 ) ) ( not ( = ?auto_58949 ?auto_58952 ) ) ( not ( = ?auto_58949 ?auto_58953 ) ) ( not ( = ?auto_58949 ?auto_58954 ) ) ( not ( = ?auto_58950 ?auto_58951 ) ) ( not ( = ?auto_58950 ?auto_58952 ) ) ( not ( = ?auto_58950 ?auto_58953 ) ) ( not ( = ?auto_58950 ?auto_58954 ) ) ( not ( = ?auto_58951 ?auto_58952 ) ) ( not ( = ?auto_58951 ?auto_58953 ) ) ( not ( = ?auto_58951 ?auto_58954 ) ) ( not ( = ?auto_58952 ?auto_58953 ) ) ( not ( = ?auto_58952 ?auto_58954 ) ) ( not ( = ?auto_58953 ?auto_58954 ) ) ( ON ?auto_58952 ?auto_58953 ) ( CLEAR ?auto_58950 ) ( ON ?auto_58951 ?auto_58952 ) ( CLEAR ?auto_58951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58948 ?auto_58949 ?auto_58950 ?auto_58951 )
      ( MAKE-6PILE ?auto_58948 ?auto_58949 ?auto_58950 ?auto_58951 ?auto_58952 ?auto_58953 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58974 - BLOCK
      ?auto_58975 - BLOCK
      ?auto_58976 - BLOCK
      ?auto_58977 - BLOCK
      ?auto_58978 - BLOCK
      ?auto_58979 - BLOCK
    )
    :vars
    (
      ?auto_58980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58979 ?auto_58980 ) ( ON-TABLE ?auto_58974 ) ( ON ?auto_58975 ?auto_58974 ) ( not ( = ?auto_58974 ?auto_58975 ) ) ( not ( = ?auto_58974 ?auto_58976 ) ) ( not ( = ?auto_58974 ?auto_58977 ) ) ( not ( = ?auto_58974 ?auto_58978 ) ) ( not ( = ?auto_58974 ?auto_58979 ) ) ( not ( = ?auto_58974 ?auto_58980 ) ) ( not ( = ?auto_58975 ?auto_58976 ) ) ( not ( = ?auto_58975 ?auto_58977 ) ) ( not ( = ?auto_58975 ?auto_58978 ) ) ( not ( = ?auto_58975 ?auto_58979 ) ) ( not ( = ?auto_58975 ?auto_58980 ) ) ( not ( = ?auto_58976 ?auto_58977 ) ) ( not ( = ?auto_58976 ?auto_58978 ) ) ( not ( = ?auto_58976 ?auto_58979 ) ) ( not ( = ?auto_58976 ?auto_58980 ) ) ( not ( = ?auto_58977 ?auto_58978 ) ) ( not ( = ?auto_58977 ?auto_58979 ) ) ( not ( = ?auto_58977 ?auto_58980 ) ) ( not ( = ?auto_58978 ?auto_58979 ) ) ( not ( = ?auto_58978 ?auto_58980 ) ) ( not ( = ?auto_58979 ?auto_58980 ) ) ( ON ?auto_58978 ?auto_58979 ) ( ON ?auto_58977 ?auto_58978 ) ( CLEAR ?auto_58975 ) ( ON ?auto_58976 ?auto_58977 ) ( CLEAR ?auto_58976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58974 ?auto_58975 ?auto_58976 )
      ( MAKE-6PILE ?auto_58974 ?auto_58975 ?auto_58976 ?auto_58977 ?auto_58978 ?auto_58979 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59000 - BLOCK
      ?auto_59001 - BLOCK
      ?auto_59002 - BLOCK
      ?auto_59003 - BLOCK
      ?auto_59004 - BLOCK
      ?auto_59005 - BLOCK
    )
    :vars
    (
      ?auto_59006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59005 ?auto_59006 ) ( ON-TABLE ?auto_59000 ) ( not ( = ?auto_59000 ?auto_59001 ) ) ( not ( = ?auto_59000 ?auto_59002 ) ) ( not ( = ?auto_59000 ?auto_59003 ) ) ( not ( = ?auto_59000 ?auto_59004 ) ) ( not ( = ?auto_59000 ?auto_59005 ) ) ( not ( = ?auto_59000 ?auto_59006 ) ) ( not ( = ?auto_59001 ?auto_59002 ) ) ( not ( = ?auto_59001 ?auto_59003 ) ) ( not ( = ?auto_59001 ?auto_59004 ) ) ( not ( = ?auto_59001 ?auto_59005 ) ) ( not ( = ?auto_59001 ?auto_59006 ) ) ( not ( = ?auto_59002 ?auto_59003 ) ) ( not ( = ?auto_59002 ?auto_59004 ) ) ( not ( = ?auto_59002 ?auto_59005 ) ) ( not ( = ?auto_59002 ?auto_59006 ) ) ( not ( = ?auto_59003 ?auto_59004 ) ) ( not ( = ?auto_59003 ?auto_59005 ) ) ( not ( = ?auto_59003 ?auto_59006 ) ) ( not ( = ?auto_59004 ?auto_59005 ) ) ( not ( = ?auto_59004 ?auto_59006 ) ) ( not ( = ?auto_59005 ?auto_59006 ) ) ( ON ?auto_59004 ?auto_59005 ) ( ON ?auto_59003 ?auto_59004 ) ( ON ?auto_59002 ?auto_59003 ) ( CLEAR ?auto_59000 ) ( ON ?auto_59001 ?auto_59002 ) ( CLEAR ?auto_59001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59000 ?auto_59001 )
      ( MAKE-6PILE ?auto_59000 ?auto_59001 ?auto_59002 ?auto_59003 ?auto_59004 ?auto_59005 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59026 - BLOCK
      ?auto_59027 - BLOCK
      ?auto_59028 - BLOCK
      ?auto_59029 - BLOCK
      ?auto_59030 - BLOCK
      ?auto_59031 - BLOCK
    )
    :vars
    (
      ?auto_59032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59031 ?auto_59032 ) ( not ( = ?auto_59026 ?auto_59027 ) ) ( not ( = ?auto_59026 ?auto_59028 ) ) ( not ( = ?auto_59026 ?auto_59029 ) ) ( not ( = ?auto_59026 ?auto_59030 ) ) ( not ( = ?auto_59026 ?auto_59031 ) ) ( not ( = ?auto_59026 ?auto_59032 ) ) ( not ( = ?auto_59027 ?auto_59028 ) ) ( not ( = ?auto_59027 ?auto_59029 ) ) ( not ( = ?auto_59027 ?auto_59030 ) ) ( not ( = ?auto_59027 ?auto_59031 ) ) ( not ( = ?auto_59027 ?auto_59032 ) ) ( not ( = ?auto_59028 ?auto_59029 ) ) ( not ( = ?auto_59028 ?auto_59030 ) ) ( not ( = ?auto_59028 ?auto_59031 ) ) ( not ( = ?auto_59028 ?auto_59032 ) ) ( not ( = ?auto_59029 ?auto_59030 ) ) ( not ( = ?auto_59029 ?auto_59031 ) ) ( not ( = ?auto_59029 ?auto_59032 ) ) ( not ( = ?auto_59030 ?auto_59031 ) ) ( not ( = ?auto_59030 ?auto_59032 ) ) ( not ( = ?auto_59031 ?auto_59032 ) ) ( ON ?auto_59030 ?auto_59031 ) ( ON ?auto_59029 ?auto_59030 ) ( ON ?auto_59028 ?auto_59029 ) ( ON ?auto_59027 ?auto_59028 ) ( ON ?auto_59026 ?auto_59027 ) ( CLEAR ?auto_59026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_59026 )
      ( MAKE-6PILE ?auto_59026 ?auto_59027 ?auto_59028 ?auto_59029 ?auto_59030 ?auto_59031 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_59053 - BLOCK
      ?auto_59054 - BLOCK
      ?auto_59055 - BLOCK
      ?auto_59056 - BLOCK
      ?auto_59057 - BLOCK
      ?auto_59058 - BLOCK
      ?auto_59059 - BLOCK
    )
    :vars
    (
      ?auto_59060 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_59058 ) ( ON ?auto_59059 ?auto_59060 ) ( CLEAR ?auto_59059 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_59053 ) ( ON ?auto_59054 ?auto_59053 ) ( ON ?auto_59055 ?auto_59054 ) ( ON ?auto_59056 ?auto_59055 ) ( ON ?auto_59057 ?auto_59056 ) ( ON ?auto_59058 ?auto_59057 ) ( not ( = ?auto_59053 ?auto_59054 ) ) ( not ( = ?auto_59053 ?auto_59055 ) ) ( not ( = ?auto_59053 ?auto_59056 ) ) ( not ( = ?auto_59053 ?auto_59057 ) ) ( not ( = ?auto_59053 ?auto_59058 ) ) ( not ( = ?auto_59053 ?auto_59059 ) ) ( not ( = ?auto_59053 ?auto_59060 ) ) ( not ( = ?auto_59054 ?auto_59055 ) ) ( not ( = ?auto_59054 ?auto_59056 ) ) ( not ( = ?auto_59054 ?auto_59057 ) ) ( not ( = ?auto_59054 ?auto_59058 ) ) ( not ( = ?auto_59054 ?auto_59059 ) ) ( not ( = ?auto_59054 ?auto_59060 ) ) ( not ( = ?auto_59055 ?auto_59056 ) ) ( not ( = ?auto_59055 ?auto_59057 ) ) ( not ( = ?auto_59055 ?auto_59058 ) ) ( not ( = ?auto_59055 ?auto_59059 ) ) ( not ( = ?auto_59055 ?auto_59060 ) ) ( not ( = ?auto_59056 ?auto_59057 ) ) ( not ( = ?auto_59056 ?auto_59058 ) ) ( not ( = ?auto_59056 ?auto_59059 ) ) ( not ( = ?auto_59056 ?auto_59060 ) ) ( not ( = ?auto_59057 ?auto_59058 ) ) ( not ( = ?auto_59057 ?auto_59059 ) ) ( not ( = ?auto_59057 ?auto_59060 ) ) ( not ( = ?auto_59058 ?auto_59059 ) ) ( not ( = ?auto_59058 ?auto_59060 ) ) ( not ( = ?auto_59059 ?auto_59060 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_59059 ?auto_59060 )
      ( !STACK ?auto_59059 ?auto_59058 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_59083 - BLOCK
      ?auto_59084 - BLOCK
      ?auto_59085 - BLOCK
      ?auto_59086 - BLOCK
      ?auto_59087 - BLOCK
      ?auto_59088 - BLOCK
      ?auto_59089 - BLOCK
    )
    :vars
    (
      ?auto_59090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59089 ?auto_59090 ) ( ON-TABLE ?auto_59083 ) ( ON ?auto_59084 ?auto_59083 ) ( ON ?auto_59085 ?auto_59084 ) ( ON ?auto_59086 ?auto_59085 ) ( ON ?auto_59087 ?auto_59086 ) ( not ( = ?auto_59083 ?auto_59084 ) ) ( not ( = ?auto_59083 ?auto_59085 ) ) ( not ( = ?auto_59083 ?auto_59086 ) ) ( not ( = ?auto_59083 ?auto_59087 ) ) ( not ( = ?auto_59083 ?auto_59088 ) ) ( not ( = ?auto_59083 ?auto_59089 ) ) ( not ( = ?auto_59083 ?auto_59090 ) ) ( not ( = ?auto_59084 ?auto_59085 ) ) ( not ( = ?auto_59084 ?auto_59086 ) ) ( not ( = ?auto_59084 ?auto_59087 ) ) ( not ( = ?auto_59084 ?auto_59088 ) ) ( not ( = ?auto_59084 ?auto_59089 ) ) ( not ( = ?auto_59084 ?auto_59090 ) ) ( not ( = ?auto_59085 ?auto_59086 ) ) ( not ( = ?auto_59085 ?auto_59087 ) ) ( not ( = ?auto_59085 ?auto_59088 ) ) ( not ( = ?auto_59085 ?auto_59089 ) ) ( not ( = ?auto_59085 ?auto_59090 ) ) ( not ( = ?auto_59086 ?auto_59087 ) ) ( not ( = ?auto_59086 ?auto_59088 ) ) ( not ( = ?auto_59086 ?auto_59089 ) ) ( not ( = ?auto_59086 ?auto_59090 ) ) ( not ( = ?auto_59087 ?auto_59088 ) ) ( not ( = ?auto_59087 ?auto_59089 ) ) ( not ( = ?auto_59087 ?auto_59090 ) ) ( not ( = ?auto_59088 ?auto_59089 ) ) ( not ( = ?auto_59088 ?auto_59090 ) ) ( not ( = ?auto_59089 ?auto_59090 ) ) ( CLEAR ?auto_59087 ) ( ON ?auto_59088 ?auto_59089 ) ( CLEAR ?auto_59088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_59083 ?auto_59084 ?auto_59085 ?auto_59086 ?auto_59087 ?auto_59088 )
      ( MAKE-7PILE ?auto_59083 ?auto_59084 ?auto_59085 ?auto_59086 ?auto_59087 ?auto_59088 ?auto_59089 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_59113 - BLOCK
      ?auto_59114 - BLOCK
      ?auto_59115 - BLOCK
      ?auto_59116 - BLOCK
      ?auto_59117 - BLOCK
      ?auto_59118 - BLOCK
      ?auto_59119 - BLOCK
    )
    :vars
    (
      ?auto_59120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59119 ?auto_59120 ) ( ON-TABLE ?auto_59113 ) ( ON ?auto_59114 ?auto_59113 ) ( ON ?auto_59115 ?auto_59114 ) ( ON ?auto_59116 ?auto_59115 ) ( not ( = ?auto_59113 ?auto_59114 ) ) ( not ( = ?auto_59113 ?auto_59115 ) ) ( not ( = ?auto_59113 ?auto_59116 ) ) ( not ( = ?auto_59113 ?auto_59117 ) ) ( not ( = ?auto_59113 ?auto_59118 ) ) ( not ( = ?auto_59113 ?auto_59119 ) ) ( not ( = ?auto_59113 ?auto_59120 ) ) ( not ( = ?auto_59114 ?auto_59115 ) ) ( not ( = ?auto_59114 ?auto_59116 ) ) ( not ( = ?auto_59114 ?auto_59117 ) ) ( not ( = ?auto_59114 ?auto_59118 ) ) ( not ( = ?auto_59114 ?auto_59119 ) ) ( not ( = ?auto_59114 ?auto_59120 ) ) ( not ( = ?auto_59115 ?auto_59116 ) ) ( not ( = ?auto_59115 ?auto_59117 ) ) ( not ( = ?auto_59115 ?auto_59118 ) ) ( not ( = ?auto_59115 ?auto_59119 ) ) ( not ( = ?auto_59115 ?auto_59120 ) ) ( not ( = ?auto_59116 ?auto_59117 ) ) ( not ( = ?auto_59116 ?auto_59118 ) ) ( not ( = ?auto_59116 ?auto_59119 ) ) ( not ( = ?auto_59116 ?auto_59120 ) ) ( not ( = ?auto_59117 ?auto_59118 ) ) ( not ( = ?auto_59117 ?auto_59119 ) ) ( not ( = ?auto_59117 ?auto_59120 ) ) ( not ( = ?auto_59118 ?auto_59119 ) ) ( not ( = ?auto_59118 ?auto_59120 ) ) ( not ( = ?auto_59119 ?auto_59120 ) ) ( ON ?auto_59118 ?auto_59119 ) ( CLEAR ?auto_59116 ) ( ON ?auto_59117 ?auto_59118 ) ( CLEAR ?auto_59117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59113 ?auto_59114 ?auto_59115 ?auto_59116 ?auto_59117 )
      ( MAKE-7PILE ?auto_59113 ?auto_59114 ?auto_59115 ?auto_59116 ?auto_59117 ?auto_59118 ?auto_59119 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_59143 - BLOCK
      ?auto_59144 - BLOCK
      ?auto_59145 - BLOCK
      ?auto_59146 - BLOCK
      ?auto_59147 - BLOCK
      ?auto_59148 - BLOCK
      ?auto_59149 - BLOCK
    )
    :vars
    (
      ?auto_59150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59149 ?auto_59150 ) ( ON-TABLE ?auto_59143 ) ( ON ?auto_59144 ?auto_59143 ) ( ON ?auto_59145 ?auto_59144 ) ( not ( = ?auto_59143 ?auto_59144 ) ) ( not ( = ?auto_59143 ?auto_59145 ) ) ( not ( = ?auto_59143 ?auto_59146 ) ) ( not ( = ?auto_59143 ?auto_59147 ) ) ( not ( = ?auto_59143 ?auto_59148 ) ) ( not ( = ?auto_59143 ?auto_59149 ) ) ( not ( = ?auto_59143 ?auto_59150 ) ) ( not ( = ?auto_59144 ?auto_59145 ) ) ( not ( = ?auto_59144 ?auto_59146 ) ) ( not ( = ?auto_59144 ?auto_59147 ) ) ( not ( = ?auto_59144 ?auto_59148 ) ) ( not ( = ?auto_59144 ?auto_59149 ) ) ( not ( = ?auto_59144 ?auto_59150 ) ) ( not ( = ?auto_59145 ?auto_59146 ) ) ( not ( = ?auto_59145 ?auto_59147 ) ) ( not ( = ?auto_59145 ?auto_59148 ) ) ( not ( = ?auto_59145 ?auto_59149 ) ) ( not ( = ?auto_59145 ?auto_59150 ) ) ( not ( = ?auto_59146 ?auto_59147 ) ) ( not ( = ?auto_59146 ?auto_59148 ) ) ( not ( = ?auto_59146 ?auto_59149 ) ) ( not ( = ?auto_59146 ?auto_59150 ) ) ( not ( = ?auto_59147 ?auto_59148 ) ) ( not ( = ?auto_59147 ?auto_59149 ) ) ( not ( = ?auto_59147 ?auto_59150 ) ) ( not ( = ?auto_59148 ?auto_59149 ) ) ( not ( = ?auto_59148 ?auto_59150 ) ) ( not ( = ?auto_59149 ?auto_59150 ) ) ( ON ?auto_59148 ?auto_59149 ) ( ON ?auto_59147 ?auto_59148 ) ( CLEAR ?auto_59145 ) ( ON ?auto_59146 ?auto_59147 ) ( CLEAR ?auto_59146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59143 ?auto_59144 ?auto_59145 ?auto_59146 )
      ( MAKE-7PILE ?auto_59143 ?auto_59144 ?auto_59145 ?auto_59146 ?auto_59147 ?auto_59148 ?auto_59149 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_59173 - BLOCK
      ?auto_59174 - BLOCK
      ?auto_59175 - BLOCK
      ?auto_59176 - BLOCK
      ?auto_59177 - BLOCK
      ?auto_59178 - BLOCK
      ?auto_59179 - BLOCK
    )
    :vars
    (
      ?auto_59180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59179 ?auto_59180 ) ( ON-TABLE ?auto_59173 ) ( ON ?auto_59174 ?auto_59173 ) ( not ( = ?auto_59173 ?auto_59174 ) ) ( not ( = ?auto_59173 ?auto_59175 ) ) ( not ( = ?auto_59173 ?auto_59176 ) ) ( not ( = ?auto_59173 ?auto_59177 ) ) ( not ( = ?auto_59173 ?auto_59178 ) ) ( not ( = ?auto_59173 ?auto_59179 ) ) ( not ( = ?auto_59173 ?auto_59180 ) ) ( not ( = ?auto_59174 ?auto_59175 ) ) ( not ( = ?auto_59174 ?auto_59176 ) ) ( not ( = ?auto_59174 ?auto_59177 ) ) ( not ( = ?auto_59174 ?auto_59178 ) ) ( not ( = ?auto_59174 ?auto_59179 ) ) ( not ( = ?auto_59174 ?auto_59180 ) ) ( not ( = ?auto_59175 ?auto_59176 ) ) ( not ( = ?auto_59175 ?auto_59177 ) ) ( not ( = ?auto_59175 ?auto_59178 ) ) ( not ( = ?auto_59175 ?auto_59179 ) ) ( not ( = ?auto_59175 ?auto_59180 ) ) ( not ( = ?auto_59176 ?auto_59177 ) ) ( not ( = ?auto_59176 ?auto_59178 ) ) ( not ( = ?auto_59176 ?auto_59179 ) ) ( not ( = ?auto_59176 ?auto_59180 ) ) ( not ( = ?auto_59177 ?auto_59178 ) ) ( not ( = ?auto_59177 ?auto_59179 ) ) ( not ( = ?auto_59177 ?auto_59180 ) ) ( not ( = ?auto_59178 ?auto_59179 ) ) ( not ( = ?auto_59178 ?auto_59180 ) ) ( not ( = ?auto_59179 ?auto_59180 ) ) ( ON ?auto_59178 ?auto_59179 ) ( ON ?auto_59177 ?auto_59178 ) ( ON ?auto_59176 ?auto_59177 ) ( CLEAR ?auto_59174 ) ( ON ?auto_59175 ?auto_59176 ) ( CLEAR ?auto_59175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59173 ?auto_59174 ?auto_59175 )
      ( MAKE-7PILE ?auto_59173 ?auto_59174 ?auto_59175 ?auto_59176 ?auto_59177 ?auto_59178 ?auto_59179 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_59203 - BLOCK
      ?auto_59204 - BLOCK
      ?auto_59205 - BLOCK
      ?auto_59206 - BLOCK
      ?auto_59207 - BLOCK
      ?auto_59208 - BLOCK
      ?auto_59209 - BLOCK
    )
    :vars
    (
      ?auto_59210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59209 ?auto_59210 ) ( ON-TABLE ?auto_59203 ) ( not ( = ?auto_59203 ?auto_59204 ) ) ( not ( = ?auto_59203 ?auto_59205 ) ) ( not ( = ?auto_59203 ?auto_59206 ) ) ( not ( = ?auto_59203 ?auto_59207 ) ) ( not ( = ?auto_59203 ?auto_59208 ) ) ( not ( = ?auto_59203 ?auto_59209 ) ) ( not ( = ?auto_59203 ?auto_59210 ) ) ( not ( = ?auto_59204 ?auto_59205 ) ) ( not ( = ?auto_59204 ?auto_59206 ) ) ( not ( = ?auto_59204 ?auto_59207 ) ) ( not ( = ?auto_59204 ?auto_59208 ) ) ( not ( = ?auto_59204 ?auto_59209 ) ) ( not ( = ?auto_59204 ?auto_59210 ) ) ( not ( = ?auto_59205 ?auto_59206 ) ) ( not ( = ?auto_59205 ?auto_59207 ) ) ( not ( = ?auto_59205 ?auto_59208 ) ) ( not ( = ?auto_59205 ?auto_59209 ) ) ( not ( = ?auto_59205 ?auto_59210 ) ) ( not ( = ?auto_59206 ?auto_59207 ) ) ( not ( = ?auto_59206 ?auto_59208 ) ) ( not ( = ?auto_59206 ?auto_59209 ) ) ( not ( = ?auto_59206 ?auto_59210 ) ) ( not ( = ?auto_59207 ?auto_59208 ) ) ( not ( = ?auto_59207 ?auto_59209 ) ) ( not ( = ?auto_59207 ?auto_59210 ) ) ( not ( = ?auto_59208 ?auto_59209 ) ) ( not ( = ?auto_59208 ?auto_59210 ) ) ( not ( = ?auto_59209 ?auto_59210 ) ) ( ON ?auto_59208 ?auto_59209 ) ( ON ?auto_59207 ?auto_59208 ) ( ON ?auto_59206 ?auto_59207 ) ( ON ?auto_59205 ?auto_59206 ) ( CLEAR ?auto_59203 ) ( ON ?auto_59204 ?auto_59205 ) ( CLEAR ?auto_59204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59203 ?auto_59204 )
      ( MAKE-7PILE ?auto_59203 ?auto_59204 ?auto_59205 ?auto_59206 ?auto_59207 ?auto_59208 ?auto_59209 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_59233 - BLOCK
      ?auto_59234 - BLOCK
      ?auto_59235 - BLOCK
      ?auto_59236 - BLOCK
      ?auto_59237 - BLOCK
      ?auto_59238 - BLOCK
      ?auto_59239 - BLOCK
    )
    :vars
    (
      ?auto_59240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59239 ?auto_59240 ) ( not ( = ?auto_59233 ?auto_59234 ) ) ( not ( = ?auto_59233 ?auto_59235 ) ) ( not ( = ?auto_59233 ?auto_59236 ) ) ( not ( = ?auto_59233 ?auto_59237 ) ) ( not ( = ?auto_59233 ?auto_59238 ) ) ( not ( = ?auto_59233 ?auto_59239 ) ) ( not ( = ?auto_59233 ?auto_59240 ) ) ( not ( = ?auto_59234 ?auto_59235 ) ) ( not ( = ?auto_59234 ?auto_59236 ) ) ( not ( = ?auto_59234 ?auto_59237 ) ) ( not ( = ?auto_59234 ?auto_59238 ) ) ( not ( = ?auto_59234 ?auto_59239 ) ) ( not ( = ?auto_59234 ?auto_59240 ) ) ( not ( = ?auto_59235 ?auto_59236 ) ) ( not ( = ?auto_59235 ?auto_59237 ) ) ( not ( = ?auto_59235 ?auto_59238 ) ) ( not ( = ?auto_59235 ?auto_59239 ) ) ( not ( = ?auto_59235 ?auto_59240 ) ) ( not ( = ?auto_59236 ?auto_59237 ) ) ( not ( = ?auto_59236 ?auto_59238 ) ) ( not ( = ?auto_59236 ?auto_59239 ) ) ( not ( = ?auto_59236 ?auto_59240 ) ) ( not ( = ?auto_59237 ?auto_59238 ) ) ( not ( = ?auto_59237 ?auto_59239 ) ) ( not ( = ?auto_59237 ?auto_59240 ) ) ( not ( = ?auto_59238 ?auto_59239 ) ) ( not ( = ?auto_59238 ?auto_59240 ) ) ( not ( = ?auto_59239 ?auto_59240 ) ) ( ON ?auto_59238 ?auto_59239 ) ( ON ?auto_59237 ?auto_59238 ) ( ON ?auto_59236 ?auto_59237 ) ( ON ?auto_59235 ?auto_59236 ) ( ON ?auto_59234 ?auto_59235 ) ( ON ?auto_59233 ?auto_59234 ) ( CLEAR ?auto_59233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_59233 )
      ( MAKE-7PILE ?auto_59233 ?auto_59234 ?auto_59235 ?auto_59236 ?auto_59237 ?auto_59238 ?auto_59239 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_59264 - BLOCK
      ?auto_59265 - BLOCK
      ?auto_59266 - BLOCK
      ?auto_59267 - BLOCK
      ?auto_59268 - BLOCK
      ?auto_59269 - BLOCK
      ?auto_59270 - BLOCK
      ?auto_59271 - BLOCK
    )
    :vars
    (
      ?auto_59272 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_59270 ) ( ON ?auto_59271 ?auto_59272 ) ( CLEAR ?auto_59271 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_59264 ) ( ON ?auto_59265 ?auto_59264 ) ( ON ?auto_59266 ?auto_59265 ) ( ON ?auto_59267 ?auto_59266 ) ( ON ?auto_59268 ?auto_59267 ) ( ON ?auto_59269 ?auto_59268 ) ( ON ?auto_59270 ?auto_59269 ) ( not ( = ?auto_59264 ?auto_59265 ) ) ( not ( = ?auto_59264 ?auto_59266 ) ) ( not ( = ?auto_59264 ?auto_59267 ) ) ( not ( = ?auto_59264 ?auto_59268 ) ) ( not ( = ?auto_59264 ?auto_59269 ) ) ( not ( = ?auto_59264 ?auto_59270 ) ) ( not ( = ?auto_59264 ?auto_59271 ) ) ( not ( = ?auto_59264 ?auto_59272 ) ) ( not ( = ?auto_59265 ?auto_59266 ) ) ( not ( = ?auto_59265 ?auto_59267 ) ) ( not ( = ?auto_59265 ?auto_59268 ) ) ( not ( = ?auto_59265 ?auto_59269 ) ) ( not ( = ?auto_59265 ?auto_59270 ) ) ( not ( = ?auto_59265 ?auto_59271 ) ) ( not ( = ?auto_59265 ?auto_59272 ) ) ( not ( = ?auto_59266 ?auto_59267 ) ) ( not ( = ?auto_59266 ?auto_59268 ) ) ( not ( = ?auto_59266 ?auto_59269 ) ) ( not ( = ?auto_59266 ?auto_59270 ) ) ( not ( = ?auto_59266 ?auto_59271 ) ) ( not ( = ?auto_59266 ?auto_59272 ) ) ( not ( = ?auto_59267 ?auto_59268 ) ) ( not ( = ?auto_59267 ?auto_59269 ) ) ( not ( = ?auto_59267 ?auto_59270 ) ) ( not ( = ?auto_59267 ?auto_59271 ) ) ( not ( = ?auto_59267 ?auto_59272 ) ) ( not ( = ?auto_59268 ?auto_59269 ) ) ( not ( = ?auto_59268 ?auto_59270 ) ) ( not ( = ?auto_59268 ?auto_59271 ) ) ( not ( = ?auto_59268 ?auto_59272 ) ) ( not ( = ?auto_59269 ?auto_59270 ) ) ( not ( = ?auto_59269 ?auto_59271 ) ) ( not ( = ?auto_59269 ?auto_59272 ) ) ( not ( = ?auto_59270 ?auto_59271 ) ) ( not ( = ?auto_59270 ?auto_59272 ) ) ( not ( = ?auto_59271 ?auto_59272 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_59271 ?auto_59272 )
      ( !STACK ?auto_59271 ?auto_59270 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_59298 - BLOCK
      ?auto_59299 - BLOCK
      ?auto_59300 - BLOCK
      ?auto_59301 - BLOCK
      ?auto_59302 - BLOCK
      ?auto_59303 - BLOCK
      ?auto_59304 - BLOCK
      ?auto_59305 - BLOCK
    )
    :vars
    (
      ?auto_59306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59305 ?auto_59306 ) ( ON-TABLE ?auto_59298 ) ( ON ?auto_59299 ?auto_59298 ) ( ON ?auto_59300 ?auto_59299 ) ( ON ?auto_59301 ?auto_59300 ) ( ON ?auto_59302 ?auto_59301 ) ( ON ?auto_59303 ?auto_59302 ) ( not ( = ?auto_59298 ?auto_59299 ) ) ( not ( = ?auto_59298 ?auto_59300 ) ) ( not ( = ?auto_59298 ?auto_59301 ) ) ( not ( = ?auto_59298 ?auto_59302 ) ) ( not ( = ?auto_59298 ?auto_59303 ) ) ( not ( = ?auto_59298 ?auto_59304 ) ) ( not ( = ?auto_59298 ?auto_59305 ) ) ( not ( = ?auto_59298 ?auto_59306 ) ) ( not ( = ?auto_59299 ?auto_59300 ) ) ( not ( = ?auto_59299 ?auto_59301 ) ) ( not ( = ?auto_59299 ?auto_59302 ) ) ( not ( = ?auto_59299 ?auto_59303 ) ) ( not ( = ?auto_59299 ?auto_59304 ) ) ( not ( = ?auto_59299 ?auto_59305 ) ) ( not ( = ?auto_59299 ?auto_59306 ) ) ( not ( = ?auto_59300 ?auto_59301 ) ) ( not ( = ?auto_59300 ?auto_59302 ) ) ( not ( = ?auto_59300 ?auto_59303 ) ) ( not ( = ?auto_59300 ?auto_59304 ) ) ( not ( = ?auto_59300 ?auto_59305 ) ) ( not ( = ?auto_59300 ?auto_59306 ) ) ( not ( = ?auto_59301 ?auto_59302 ) ) ( not ( = ?auto_59301 ?auto_59303 ) ) ( not ( = ?auto_59301 ?auto_59304 ) ) ( not ( = ?auto_59301 ?auto_59305 ) ) ( not ( = ?auto_59301 ?auto_59306 ) ) ( not ( = ?auto_59302 ?auto_59303 ) ) ( not ( = ?auto_59302 ?auto_59304 ) ) ( not ( = ?auto_59302 ?auto_59305 ) ) ( not ( = ?auto_59302 ?auto_59306 ) ) ( not ( = ?auto_59303 ?auto_59304 ) ) ( not ( = ?auto_59303 ?auto_59305 ) ) ( not ( = ?auto_59303 ?auto_59306 ) ) ( not ( = ?auto_59304 ?auto_59305 ) ) ( not ( = ?auto_59304 ?auto_59306 ) ) ( not ( = ?auto_59305 ?auto_59306 ) ) ( CLEAR ?auto_59303 ) ( ON ?auto_59304 ?auto_59305 ) ( CLEAR ?auto_59304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_59298 ?auto_59299 ?auto_59300 ?auto_59301 ?auto_59302 ?auto_59303 ?auto_59304 )
      ( MAKE-8PILE ?auto_59298 ?auto_59299 ?auto_59300 ?auto_59301 ?auto_59302 ?auto_59303 ?auto_59304 ?auto_59305 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_59332 - BLOCK
      ?auto_59333 - BLOCK
      ?auto_59334 - BLOCK
      ?auto_59335 - BLOCK
      ?auto_59336 - BLOCK
      ?auto_59337 - BLOCK
      ?auto_59338 - BLOCK
      ?auto_59339 - BLOCK
    )
    :vars
    (
      ?auto_59340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59339 ?auto_59340 ) ( ON-TABLE ?auto_59332 ) ( ON ?auto_59333 ?auto_59332 ) ( ON ?auto_59334 ?auto_59333 ) ( ON ?auto_59335 ?auto_59334 ) ( ON ?auto_59336 ?auto_59335 ) ( not ( = ?auto_59332 ?auto_59333 ) ) ( not ( = ?auto_59332 ?auto_59334 ) ) ( not ( = ?auto_59332 ?auto_59335 ) ) ( not ( = ?auto_59332 ?auto_59336 ) ) ( not ( = ?auto_59332 ?auto_59337 ) ) ( not ( = ?auto_59332 ?auto_59338 ) ) ( not ( = ?auto_59332 ?auto_59339 ) ) ( not ( = ?auto_59332 ?auto_59340 ) ) ( not ( = ?auto_59333 ?auto_59334 ) ) ( not ( = ?auto_59333 ?auto_59335 ) ) ( not ( = ?auto_59333 ?auto_59336 ) ) ( not ( = ?auto_59333 ?auto_59337 ) ) ( not ( = ?auto_59333 ?auto_59338 ) ) ( not ( = ?auto_59333 ?auto_59339 ) ) ( not ( = ?auto_59333 ?auto_59340 ) ) ( not ( = ?auto_59334 ?auto_59335 ) ) ( not ( = ?auto_59334 ?auto_59336 ) ) ( not ( = ?auto_59334 ?auto_59337 ) ) ( not ( = ?auto_59334 ?auto_59338 ) ) ( not ( = ?auto_59334 ?auto_59339 ) ) ( not ( = ?auto_59334 ?auto_59340 ) ) ( not ( = ?auto_59335 ?auto_59336 ) ) ( not ( = ?auto_59335 ?auto_59337 ) ) ( not ( = ?auto_59335 ?auto_59338 ) ) ( not ( = ?auto_59335 ?auto_59339 ) ) ( not ( = ?auto_59335 ?auto_59340 ) ) ( not ( = ?auto_59336 ?auto_59337 ) ) ( not ( = ?auto_59336 ?auto_59338 ) ) ( not ( = ?auto_59336 ?auto_59339 ) ) ( not ( = ?auto_59336 ?auto_59340 ) ) ( not ( = ?auto_59337 ?auto_59338 ) ) ( not ( = ?auto_59337 ?auto_59339 ) ) ( not ( = ?auto_59337 ?auto_59340 ) ) ( not ( = ?auto_59338 ?auto_59339 ) ) ( not ( = ?auto_59338 ?auto_59340 ) ) ( not ( = ?auto_59339 ?auto_59340 ) ) ( ON ?auto_59338 ?auto_59339 ) ( CLEAR ?auto_59336 ) ( ON ?auto_59337 ?auto_59338 ) ( CLEAR ?auto_59337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_59332 ?auto_59333 ?auto_59334 ?auto_59335 ?auto_59336 ?auto_59337 )
      ( MAKE-8PILE ?auto_59332 ?auto_59333 ?auto_59334 ?auto_59335 ?auto_59336 ?auto_59337 ?auto_59338 ?auto_59339 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_59366 - BLOCK
      ?auto_59367 - BLOCK
      ?auto_59368 - BLOCK
      ?auto_59369 - BLOCK
      ?auto_59370 - BLOCK
      ?auto_59371 - BLOCK
      ?auto_59372 - BLOCK
      ?auto_59373 - BLOCK
    )
    :vars
    (
      ?auto_59374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59373 ?auto_59374 ) ( ON-TABLE ?auto_59366 ) ( ON ?auto_59367 ?auto_59366 ) ( ON ?auto_59368 ?auto_59367 ) ( ON ?auto_59369 ?auto_59368 ) ( not ( = ?auto_59366 ?auto_59367 ) ) ( not ( = ?auto_59366 ?auto_59368 ) ) ( not ( = ?auto_59366 ?auto_59369 ) ) ( not ( = ?auto_59366 ?auto_59370 ) ) ( not ( = ?auto_59366 ?auto_59371 ) ) ( not ( = ?auto_59366 ?auto_59372 ) ) ( not ( = ?auto_59366 ?auto_59373 ) ) ( not ( = ?auto_59366 ?auto_59374 ) ) ( not ( = ?auto_59367 ?auto_59368 ) ) ( not ( = ?auto_59367 ?auto_59369 ) ) ( not ( = ?auto_59367 ?auto_59370 ) ) ( not ( = ?auto_59367 ?auto_59371 ) ) ( not ( = ?auto_59367 ?auto_59372 ) ) ( not ( = ?auto_59367 ?auto_59373 ) ) ( not ( = ?auto_59367 ?auto_59374 ) ) ( not ( = ?auto_59368 ?auto_59369 ) ) ( not ( = ?auto_59368 ?auto_59370 ) ) ( not ( = ?auto_59368 ?auto_59371 ) ) ( not ( = ?auto_59368 ?auto_59372 ) ) ( not ( = ?auto_59368 ?auto_59373 ) ) ( not ( = ?auto_59368 ?auto_59374 ) ) ( not ( = ?auto_59369 ?auto_59370 ) ) ( not ( = ?auto_59369 ?auto_59371 ) ) ( not ( = ?auto_59369 ?auto_59372 ) ) ( not ( = ?auto_59369 ?auto_59373 ) ) ( not ( = ?auto_59369 ?auto_59374 ) ) ( not ( = ?auto_59370 ?auto_59371 ) ) ( not ( = ?auto_59370 ?auto_59372 ) ) ( not ( = ?auto_59370 ?auto_59373 ) ) ( not ( = ?auto_59370 ?auto_59374 ) ) ( not ( = ?auto_59371 ?auto_59372 ) ) ( not ( = ?auto_59371 ?auto_59373 ) ) ( not ( = ?auto_59371 ?auto_59374 ) ) ( not ( = ?auto_59372 ?auto_59373 ) ) ( not ( = ?auto_59372 ?auto_59374 ) ) ( not ( = ?auto_59373 ?auto_59374 ) ) ( ON ?auto_59372 ?auto_59373 ) ( ON ?auto_59371 ?auto_59372 ) ( CLEAR ?auto_59369 ) ( ON ?auto_59370 ?auto_59371 ) ( CLEAR ?auto_59370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59366 ?auto_59367 ?auto_59368 ?auto_59369 ?auto_59370 )
      ( MAKE-8PILE ?auto_59366 ?auto_59367 ?auto_59368 ?auto_59369 ?auto_59370 ?auto_59371 ?auto_59372 ?auto_59373 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_59400 - BLOCK
      ?auto_59401 - BLOCK
      ?auto_59402 - BLOCK
      ?auto_59403 - BLOCK
      ?auto_59404 - BLOCK
      ?auto_59405 - BLOCK
      ?auto_59406 - BLOCK
      ?auto_59407 - BLOCK
    )
    :vars
    (
      ?auto_59408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59407 ?auto_59408 ) ( ON-TABLE ?auto_59400 ) ( ON ?auto_59401 ?auto_59400 ) ( ON ?auto_59402 ?auto_59401 ) ( not ( = ?auto_59400 ?auto_59401 ) ) ( not ( = ?auto_59400 ?auto_59402 ) ) ( not ( = ?auto_59400 ?auto_59403 ) ) ( not ( = ?auto_59400 ?auto_59404 ) ) ( not ( = ?auto_59400 ?auto_59405 ) ) ( not ( = ?auto_59400 ?auto_59406 ) ) ( not ( = ?auto_59400 ?auto_59407 ) ) ( not ( = ?auto_59400 ?auto_59408 ) ) ( not ( = ?auto_59401 ?auto_59402 ) ) ( not ( = ?auto_59401 ?auto_59403 ) ) ( not ( = ?auto_59401 ?auto_59404 ) ) ( not ( = ?auto_59401 ?auto_59405 ) ) ( not ( = ?auto_59401 ?auto_59406 ) ) ( not ( = ?auto_59401 ?auto_59407 ) ) ( not ( = ?auto_59401 ?auto_59408 ) ) ( not ( = ?auto_59402 ?auto_59403 ) ) ( not ( = ?auto_59402 ?auto_59404 ) ) ( not ( = ?auto_59402 ?auto_59405 ) ) ( not ( = ?auto_59402 ?auto_59406 ) ) ( not ( = ?auto_59402 ?auto_59407 ) ) ( not ( = ?auto_59402 ?auto_59408 ) ) ( not ( = ?auto_59403 ?auto_59404 ) ) ( not ( = ?auto_59403 ?auto_59405 ) ) ( not ( = ?auto_59403 ?auto_59406 ) ) ( not ( = ?auto_59403 ?auto_59407 ) ) ( not ( = ?auto_59403 ?auto_59408 ) ) ( not ( = ?auto_59404 ?auto_59405 ) ) ( not ( = ?auto_59404 ?auto_59406 ) ) ( not ( = ?auto_59404 ?auto_59407 ) ) ( not ( = ?auto_59404 ?auto_59408 ) ) ( not ( = ?auto_59405 ?auto_59406 ) ) ( not ( = ?auto_59405 ?auto_59407 ) ) ( not ( = ?auto_59405 ?auto_59408 ) ) ( not ( = ?auto_59406 ?auto_59407 ) ) ( not ( = ?auto_59406 ?auto_59408 ) ) ( not ( = ?auto_59407 ?auto_59408 ) ) ( ON ?auto_59406 ?auto_59407 ) ( ON ?auto_59405 ?auto_59406 ) ( ON ?auto_59404 ?auto_59405 ) ( CLEAR ?auto_59402 ) ( ON ?auto_59403 ?auto_59404 ) ( CLEAR ?auto_59403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59400 ?auto_59401 ?auto_59402 ?auto_59403 )
      ( MAKE-8PILE ?auto_59400 ?auto_59401 ?auto_59402 ?auto_59403 ?auto_59404 ?auto_59405 ?auto_59406 ?auto_59407 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_59434 - BLOCK
      ?auto_59435 - BLOCK
      ?auto_59436 - BLOCK
      ?auto_59437 - BLOCK
      ?auto_59438 - BLOCK
      ?auto_59439 - BLOCK
      ?auto_59440 - BLOCK
      ?auto_59441 - BLOCK
    )
    :vars
    (
      ?auto_59442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59441 ?auto_59442 ) ( ON-TABLE ?auto_59434 ) ( ON ?auto_59435 ?auto_59434 ) ( not ( = ?auto_59434 ?auto_59435 ) ) ( not ( = ?auto_59434 ?auto_59436 ) ) ( not ( = ?auto_59434 ?auto_59437 ) ) ( not ( = ?auto_59434 ?auto_59438 ) ) ( not ( = ?auto_59434 ?auto_59439 ) ) ( not ( = ?auto_59434 ?auto_59440 ) ) ( not ( = ?auto_59434 ?auto_59441 ) ) ( not ( = ?auto_59434 ?auto_59442 ) ) ( not ( = ?auto_59435 ?auto_59436 ) ) ( not ( = ?auto_59435 ?auto_59437 ) ) ( not ( = ?auto_59435 ?auto_59438 ) ) ( not ( = ?auto_59435 ?auto_59439 ) ) ( not ( = ?auto_59435 ?auto_59440 ) ) ( not ( = ?auto_59435 ?auto_59441 ) ) ( not ( = ?auto_59435 ?auto_59442 ) ) ( not ( = ?auto_59436 ?auto_59437 ) ) ( not ( = ?auto_59436 ?auto_59438 ) ) ( not ( = ?auto_59436 ?auto_59439 ) ) ( not ( = ?auto_59436 ?auto_59440 ) ) ( not ( = ?auto_59436 ?auto_59441 ) ) ( not ( = ?auto_59436 ?auto_59442 ) ) ( not ( = ?auto_59437 ?auto_59438 ) ) ( not ( = ?auto_59437 ?auto_59439 ) ) ( not ( = ?auto_59437 ?auto_59440 ) ) ( not ( = ?auto_59437 ?auto_59441 ) ) ( not ( = ?auto_59437 ?auto_59442 ) ) ( not ( = ?auto_59438 ?auto_59439 ) ) ( not ( = ?auto_59438 ?auto_59440 ) ) ( not ( = ?auto_59438 ?auto_59441 ) ) ( not ( = ?auto_59438 ?auto_59442 ) ) ( not ( = ?auto_59439 ?auto_59440 ) ) ( not ( = ?auto_59439 ?auto_59441 ) ) ( not ( = ?auto_59439 ?auto_59442 ) ) ( not ( = ?auto_59440 ?auto_59441 ) ) ( not ( = ?auto_59440 ?auto_59442 ) ) ( not ( = ?auto_59441 ?auto_59442 ) ) ( ON ?auto_59440 ?auto_59441 ) ( ON ?auto_59439 ?auto_59440 ) ( ON ?auto_59438 ?auto_59439 ) ( ON ?auto_59437 ?auto_59438 ) ( CLEAR ?auto_59435 ) ( ON ?auto_59436 ?auto_59437 ) ( CLEAR ?auto_59436 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59434 ?auto_59435 ?auto_59436 )
      ( MAKE-8PILE ?auto_59434 ?auto_59435 ?auto_59436 ?auto_59437 ?auto_59438 ?auto_59439 ?auto_59440 ?auto_59441 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_59468 - BLOCK
      ?auto_59469 - BLOCK
      ?auto_59470 - BLOCK
      ?auto_59471 - BLOCK
      ?auto_59472 - BLOCK
      ?auto_59473 - BLOCK
      ?auto_59474 - BLOCK
      ?auto_59475 - BLOCK
    )
    :vars
    (
      ?auto_59476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59475 ?auto_59476 ) ( ON-TABLE ?auto_59468 ) ( not ( = ?auto_59468 ?auto_59469 ) ) ( not ( = ?auto_59468 ?auto_59470 ) ) ( not ( = ?auto_59468 ?auto_59471 ) ) ( not ( = ?auto_59468 ?auto_59472 ) ) ( not ( = ?auto_59468 ?auto_59473 ) ) ( not ( = ?auto_59468 ?auto_59474 ) ) ( not ( = ?auto_59468 ?auto_59475 ) ) ( not ( = ?auto_59468 ?auto_59476 ) ) ( not ( = ?auto_59469 ?auto_59470 ) ) ( not ( = ?auto_59469 ?auto_59471 ) ) ( not ( = ?auto_59469 ?auto_59472 ) ) ( not ( = ?auto_59469 ?auto_59473 ) ) ( not ( = ?auto_59469 ?auto_59474 ) ) ( not ( = ?auto_59469 ?auto_59475 ) ) ( not ( = ?auto_59469 ?auto_59476 ) ) ( not ( = ?auto_59470 ?auto_59471 ) ) ( not ( = ?auto_59470 ?auto_59472 ) ) ( not ( = ?auto_59470 ?auto_59473 ) ) ( not ( = ?auto_59470 ?auto_59474 ) ) ( not ( = ?auto_59470 ?auto_59475 ) ) ( not ( = ?auto_59470 ?auto_59476 ) ) ( not ( = ?auto_59471 ?auto_59472 ) ) ( not ( = ?auto_59471 ?auto_59473 ) ) ( not ( = ?auto_59471 ?auto_59474 ) ) ( not ( = ?auto_59471 ?auto_59475 ) ) ( not ( = ?auto_59471 ?auto_59476 ) ) ( not ( = ?auto_59472 ?auto_59473 ) ) ( not ( = ?auto_59472 ?auto_59474 ) ) ( not ( = ?auto_59472 ?auto_59475 ) ) ( not ( = ?auto_59472 ?auto_59476 ) ) ( not ( = ?auto_59473 ?auto_59474 ) ) ( not ( = ?auto_59473 ?auto_59475 ) ) ( not ( = ?auto_59473 ?auto_59476 ) ) ( not ( = ?auto_59474 ?auto_59475 ) ) ( not ( = ?auto_59474 ?auto_59476 ) ) ( not ( = ?auto_59475 ?auto_59476 ) ) ( ON ?auto_59474 ?auto_59475 ) ( ON ?auto_59473 ?auto_59474 ) ( ON ?auto_59472 ?auto_59473 ) ( ON ?auto_59471 ?auto_59472 ) ( ON ?auto_59470 ?auto_59471 ) ( CLEAR ?auto_59468 ) ( ON ?auto_59469 ?auto_59470 ) ( CLEAR ?auto_59469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59468 ?auto_59469 )
      ( MAKE-8PILE ?auto_59468 ?auto_59469 ?auto_59470 ?auto_59471 ?auto_59472 ?auto_59473 ?auto_59474 ?auto_59475 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_59502 - BLOCK
      ?auto_59503 - BLOCK
      ?auto_59504 - BLOCK
      ?auto_59505 - BLOCK
      ?auto_59506 - BLOCK
      ?auto_59507 - BLOCK
      ?auto_59508 - BLOCK
      ?auto_59509 - BLOCK
    )
    :vars
    (
      ?auto_59510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59509 ?auto_59510 ) ( not ( = ?auto_59502 ?auto_59503 ) ) ( not ( = ?auto_59502 ?auto_59504 ) ) ( not ( = ?auto_59502 ?auto_59505 ) ) ( not ( = ?auto_59502 ?auto_59506 ) ) ( not ( = ?auto_59502 ?auto_59507 ) ) ( not ( = ?auto_59502 ?auto_59508 ) ) ( not ( = ?auto_59502 ?auto_59509 ) ) ( not ( = ?auto_59502 ?auto_59510 ) ) ( not ( = ?auto_59503 ?auto_59504 ) ) ( not ( = ?auto_59503 ?auto_59505 ) ) ( not ( = ?auto_59503 ?auto_59506 ) ) ( not ( = ?auto_59503 ?auto_59507 ) ) ( not ( = ?auto_59503 ?auto_59508 ) ) ( not ( = ?auto_59503 ?auto_59509 ) ) ( not ( = ?auto_59503 ?auto_59510 ) ) ( not ( = ?auto_59504 ?auto_59505 ) ) ( not ( = ?auto_59504 ?auto_59506 ) ) ( not ( = ?auto_59504 ?auto_59507 ) ) ( not ( = ?auto_59504 ?auto_59508 ) ) ( not ( = ?auto_59504 ?auto_59509 ) ) ( not ( = ?auto_59504 ?auto_59510 ) ) ( not ( = ?auto_59505 ?auto_59506 ) ) ( not ( = ?auto_59505 ?auto_59507 ) ) ( not ( = ?auto_59505 ?auto_59508 ) ) ( not ( = ?auto_59505 ?auto_59509 ) ) ( not ( = ?auto_59505 ?auto_59510 ) ) ( not ( = ?auto_59506 ?auto_59507 ) ) ( not ( = ?auto_59506 ?auto_59508 ) ) ( not ( = ?auto_59506 ?auto_59509 ) ) ( not ( = ?auto_59506 ?auto_59510 ) ) ( not ( = ?auto_59507 ?auto_59508 ) ) ( not ( = ?auto_59507 ?auto_59509 ) ) ( not ( = ?auto_59507 ?auto_59510 ) ) ( not ( = ?auto_59508 ?auto_59509 ) ) ( not ( = ?auto_59508 ?auto_59510 ) ) ( not ( = ?auto_59509 ?auto_59510 ) ) ( ON ?auto_59508 ?auto_59509 ) ( ON ?auto_59507 ?auto_59508 ) ( ON ?auto_59506 ?auto_59507 ) ( ON ?auto_59505 ?auto_59506 ) ( ON ?auto_59504 ?auto_59505 ) ( ON ?auto_59503 ?auto_59504 ) ( ON ?auto_59502 ?auto_59503 ) ( CLEAR ?auto_59502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_59502 )
      ( MAKE-8PILE ?auto_59502 ?auto_59503 ?auto_59504 ?auto_59505 ?auto_59506 ?auto_59507 ?auto_59508 ?auto_59509 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_59537 - BLOCK
      ?auto_59538 - BLOCK
      ?auto_59539 - BLOCK
      ?auto_59540 - BLOCK
      ?auto_59541 - BLOCK
      ?auto_59542 - BLOCK
      ?auto_59543 - BLOCK
      ?auto_59544 - BLOCK
      ?auto_59545 - BLOCK
    )
    :vars
    (
      ?auto_59546 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_59544 ) ( ON ?auto_59545 ?auto_59546 ) ( CLEAR ?auto_59545 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_59537 ) ( ON ?auto_59538 ?auto_59537 ) ( ON ?auto_59539 ?auto_59538 ) ( ON ?auto_59540 ?auto_59539 ) ( ON ?auto_59541 ?auto_59540 ) ( ON ?auto_59542 ?auto_59541 ) ( ON ?auto_59543 ?auto_59542 ) ( ON ?auto_59544 ?auto_59543 ) ( not ( = ?auto_59537 ?auto_59538 ) ) ( not ( = ?auto_59537 ?auto_59539 ) ) ( not ( = ?auto_59537 ?auto_59540 ) ) ( not ( = ?auto_59537 ?auto_59541 ) ) ( not ( = ?auto_59537 ?auto_59542 ) ) ( not ( = ?auto_59537 ?auto_59543 ) ) ( not ( = ?auto_59537 ?auto_59544 ) ) ( not ( = ?auto_59537 ?auto_59545 ) ) ( not ( = ?auto_59537 ?auto_59546 ) ) ( not ( = ?auto_59538 ?auto_59539 ) ) ( not ( = ?auto_59538 ?auto_59540 ) ) ( not ( = ?auto_59538 ?auto_59541 ) ) ( not ( = ?auto_59538 ?auto_59542 ) ) ( not ( = ?auto_59538 ?auto_59543 ) ) ( not ( = ?auto_59538 ?auto_59544 ) ) ( not ( = ?auto_59538 ?auto_59545 ) ) ( not ( = ?auto_59538 ?auto_59546 ) ) ( not ( = ?auto_59539 ?auto_59540 ) ) ( not ( = ?auto_59539 ?auto_59541 ) ) ( not ( = ?auto_59539 ?auto_59542 ) ) ( not ( = ?auto_59539 ?auto_59543 ) ) ( not ( = ?auto_59539 ?auto_59544 ) ) ( not ( = ?auto_59539 ?auto_59545 ) ) ( not ( = ?auto_59539 ?auto_59546 ) ) ( not ( = ?auto_59540 ?auto_59541 ) ) ( not ( = ?auto_59540 ?auto_59542 ) ) ( not ( = ?auto_59540 ?auto_59543 ) ) ( not ( = ?auto_59540 ?auto_59544 ) ) ( not ( = ?auto_59540 ?auto_59545 ) ) ( not ( = ?auto_59540 ?auto_59546 ) ) ( not ( = ?auto_59541 ?auto_59542 ) ) ( not ( = ?auto_59541 ?auto_59543 ) ) ( not ( = ?auto_59541 ?auto_59544 ) ) ( not ( = ?auto_59541 ?auto_59545 ) ) ( not ( = ?auto_59541 ?auto_59546 ) ) ( not ( = ?auto_59542 ?auto_59543 ) ) ( not ( = ?auto_59542 ?auto_59544 ) ) ( not ( = ?auto_59542 ?auto_59545 ) ) ( not ( = ?auto_59542 ?auto_59546 ) ) ( not ( = ?auto_59543 ?auto_59544 ) ) ( not ( = ?auto_59543 ?auto_59545 ) ) ( not ( = ?auto_59543 ?auto_59546 ) ) ( not ( = ?auto_59544 ?auto_59545 ) ) ( not ( = ?auto_59544 ?auto_59546 ) ) ( not ( = ?auto_59545 ?auto_59546 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_59545 ?auto_59546 )
      ( !STACK ?auto_59545 ?auto_59544 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_59556 - BLOCK
      ?auto_59557 - BLOCK
      ?auto_59558 - BLOCK
      ?auto_59559 - BLOCK
      ?auto_59560 - BLOCK
      ?auto_59561 - BLOCK
      ?auto_59562 - BLOCK
      ?auto_59563 - BLOCK
      ?auto_59564 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_59563 ) ( ON-TABLE ?auto_59564 ) ( CLEAR ?auto_59564 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_59556 ) ( ON ?auto_59557 ?auto_59556 ) ( ON ?auto_59558 ?auto_59557 ) ( ON ?auto_59559 ?auto_59558 ) ( ON ?auto_59560 ?auto_59559 ) ( ON ?auto_59561 ?auto_59560 ) ( ON ?auto_59562 ?auto_59561 ) ( ON ?auto_59563 ?auto_59562 ) ( not ( = ?auto_59556 ?auto_59557 ) ) ( not ( = ?auto_59556 ?auto_59558 ) ) ( not ( = ?auto_59556 ?auto_59559 ) ) ( not ( = ?auto_59556 ?auto_59560 ) ) ( not ( = ?auto_59556 ?auto_59561 ) ) ( not ( = ?auto_59556 ?auto_59562 ) ) ( not ( = ?auto_59556 ?auto_59563 ) ) ( not ( = ?auto_59556 ?auto_59564 ) ) ( not ( = ?auto_59557 ?auto_59558 ) ) ( not ( = ?auto_59557 ?auto_59559 ) ) ( not ( = ?auto_59557 ?auto_59560 ) ) ( not ( = ?auto_59557 ?auto_59561 ) ) ( not ( = ?auto_59557 ?auto_59562 ) ) ( not ( = ?auto_59557 ?auto_59563 ) ) ( not ( = ?auto_59557 ?auto_59564 ) ) ( not ( = ?auto_59558 ?auto_59559 ) ) ( not ( = ?auto_59558 ?auto_59560 ) ) ( not ( = ?auto_59558 ?auto_59561 ) ) ( not ( = ?auto_59558 ?auto_59562 ) ) ( not ( = ?auto_59558 ?auto_59563 ) ) ( not ( = ?auto_59558 ?auto_59564 ) ) ( not ( = ?auto_59559 ?auto_59560 ) ) ( not ( = ?auto_59559 ?auto_59561 ) ) ( not ( = ?auto_59559 ?auto_59562 ) ) ( not ( = ?auto_59559 ?auto_59563 ) ) ( not ( = ?auto_59559 ?auto_59564 ) ) ( not ( = ?auto_59560 ?auto_59561 ) ) ( not ( = ?auto_59560 ?auto_59562 ) ) ( not ( = ?auto_59560 ?auto_59563 ) ) ( not ( = ?auto_59560 ?auto_59564 ) ) ( not ( = ?auto_59561 ?auto_59562 ) ) ( not ( = ?auto_59561 ?auto_59563 ) ) ( not ( = ?auto_59561 ?auto_59564 ) ) ( not ( = ?auto_59562 ?auto_59563 ) ) ( not ( = ?auto_59562 ?auto_59564 ) ) ( not ( = ?auto_59563 ?auto_59564 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_59564 )
      ( !STACK ?auto_59564 ?auto_59563 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_59574 - BLOCK
      ?auto_59575 - BLOCK
      ?auto_59576 - BLOCK
      ?auto_59577 - BLOCK
      ?auto_59578 - BLOCK
      ?auto_59579 - BLOCK
      ?auto_59580 - BLOCK
      ?auto_59581 - BLOCK
      ?auto_59582 - BLOCK
    )
    :vars
    (
      ?auto_59583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59582 ?auto_59583 ) ( ON-TABLE ?auto_59574 ) ( ON ?auto_59575 ?auto_59574 ) ( ON ?auto_59576 ?auto_59575 ) ( ON ?auto_59577 ?auto_59576 ) ( ON ?auto_59578 ?auto_59577 ) ( ON ?auto_59579 ?auto_59578 ) ( ON ?auto_59580 ?auto_59579 ) ( not ( = ?auto_59574 ?auto_59575 ) ) ( not ( = ?auto_59574 ?auto_59576 ) ) ( not ( = ?auto_59574 ?auto_59577 ) ) ( not ( = ?auto_59574 ?auto_59578 ) ) ( not ( = ?auto_59574 ?auto_59579 ) ) ( not ( = ?auto_59574 ?auto_59580 ) ) ( not ( = ?auto_59574 ?auto_59581 ) ) ( not ( = ?auto_59574 ?auto_59582 ) ) ( not ( = ?auto_59574 ?auto_59583 ) ) ( not ( = ?auto_59575 ?auto_59576 ) ) ( not ( = ?auto_59575 ?auto_59577 ) ) ( not ( = ?auto_59575 ?auto_59578 ) ) ( not ( = ?auto_59575 ?auto_59579 ) ) ( not ( = ?auto_59575 ?auto_59580 ) ) ( not ( = ?auto_59575 ?auto_59581 ) ) ( not ( = ?auto_59575 ?auto_59582 ) ) ( not ( = ?auto_59575 ?auto_59583 ) ) ( not ( = ?auto_59576 ?auto_59577 ) ) ( not ( = ?auto_59576 ?auto_59578 ) ) ( not ( = ?auto_59576 ?auto_59579 ) ) ( not ( = ?auto_59576 ?auto_59580 ) ) ( not ( = ?auto_59576 ?auto_59581 ) ) ( not ( = ?auto_59576 ?auto_59582 ) ) ( not ( = ?auto_59576 ?auto_59583 ) ) ( not ( = ?auto_59577 ?auto_59578 ) ) ( not ( = ?auto_59577 ?auto_59579 ) ) ( not ( = ?auto_59577 ?auto_59580 ) ) ( not ( = ?auto_59577 ?auto_59581 ) ) ( not ( = ?auto_59577 ?auto_59582 ) ) ( not ( = ?auto_59577 ?auto_59583 ) ) ( not ( = ?auto_59578 ?auto_59579 ) ) ( not ( = ?auto_59578 ?auto_59580 ) ) ( not ( = ?auto_59578 ?auto_59581 ) ) ( not ( = ?auto_59578 ?auto_59582 ) ) ( not ( = ?auto_59578 ?auto_59583 ) ) ( not ( = ?auto_59579 ?auto_59580 ) ) ( not ( = ?auto_59579 ?auto_59581 ) ) ( not ( = ?auto_59579 ?auto_59582 ) ) ( not ( = ?auto_59579 ?auto_59583 ) ) ( not ( = ?auto_59580 ?auto_59581 ) ) ( not ( = ?auto_59580 ?auto_59582 ) ) ( not ( = ?auto_59580 ?auto_59583 ) ) ( not ( = ?auto_59581 ?auto_59582 ) ) ( not ( = ?auto_59581 ?auto_59583 ) ) ( not ( = ?auto_59582 ?auto_59583 ) ) ( CLEAR ?auto_59580 ) ( ON ?auto_59581 ?auto_59582 ) ( CLEAR ?auto_59581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_59574 ?auto_59575 ?auto_59576 ?auto_59577 ?auto_59578 ?auto_59579 ?auto_59580 ?auto_59581 )
      ( MAKE-9PILE ?auto_59574 ?auto_59575 ?auto_59576 ?auto_59577 ?auto_59578 ?auto_59579 ?auto_59580 ?auto_59581 ?auto_59582 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_59593 - BLOCK
      ?auto_59594 - BLOCK
      ?auto_59595 - BLOCK
      ?auto_59596 - BLOCK
      ?auto_59597 - BLOCK
      ?auto_59598 - BLOCK
      ?auto_59599 - BLOCK
      ?auto_59600 - BLOCK
      ?auto_59601 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59601 ) ( ON-TABLE ?auto_59593 ) ( ON ?auto_59594 ?auto_59593 ) ( ON ?auto_59595 ?auto_59594 ) ( ON ?auto_59596 ?auto_59595 ) ( ON ?auto_59597 ?auto_59596 ) ( ON ?auto_59598 ?auto_59597 ) ( ON ?auto_59599 ?auto_59598 ) ( not ( = ?auto_59593 ?auto_59594 ) ) ( not ( = ?auto_59593 ?auto_59595 ) ) ( not ( = ?auto_59593 ?auto_59596 ) ) ( not ( = ?auto_59593 ?auto_59597 ) ) ( not ( = ?auto_59593 ?auto_59598 ) ) ( not ( = ?auto_59593 ?auto_59599 ) ) ( not ( = ?auto_59593 ?auto_59600 ) ) ( not ( = ?auto_59593 ?auto_59601 ) ) ( not ( = ?auto_59594 ?auto_59595 ) ) ( not ( = ?auto_59594 ?auto_59596 ) ) ( not ( = ?auto_59594 ?auto_59597 ) ) ( not ( = ?auto_59594 ?auto_59598 ) ) ( not ( = ?auto_59594 ?auto_59599 ) ) ( not ( = ?auto_59594 ?auto_59600 ) ) ( not ( = ?auto_59594 ?auto_59601 ) ) ( not ( = ?auto_59595 ?auto_59596 ) ) ( not ( = ?auto_59595 ?auto_59597 ) ) ( not ( = ?auto_59595 ?auto_59598 ) ) ( not ( = ?auto_59595 ?auto_59599 ) ) ( not ( = ?auto_59595 ?auto_59600 ) ) ( not ( = ?auto_59595 ?auto_59601 ) ) ( not ( = ?auto_59596 ?auto_59597 ) ) ( not ( = ?auto_59596 ?auto_59598 ) ) ( not ( = ?auto_59596 ?auto_59599 ) ) ( not ( = ?auto_59596 ?auto_59600 ) ) ( not ( = ?auto_59596 ?auto_59601 ) ) ( not ( = ?auto_59597 ?auto_59598 ) ) ( not ( = ?auto_59597 ?auto_59599 ) ) ( not ( = ?auto_59597 ?auto_59600 ) ) ( not ( = ?auto_59597 ?auto_59601 ) ) ( not ( = ?auto_59598 ?auto_59599 ) ) ( not ( = ?auto_59598 ?auto_59600 ) ) ( not ( = ?auto_59598 ?auto_59601 ) ) ( not ( = ?auto_59599 ?auto_59600 ) ) ( not ( = ?auto_59599 ?auto_59601 ) ) ( not ( = ?auto_59600 ?auto_59601 ) ) ( CLEAR ?auto_59599 ) ( ON ?auto_59600 ?auto_59601 ) ( CLEAR ?auto_59600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_59593 ?auto_59594 ?auto_59595 ?auto_59596 ?auto_59597 ?auto_59598 ?auto_59599 ?auto_59600 )
      ( MAKE-9PILE ?auto_59593 ?auto_59594 ?auto_59595 ?auto_59596 ?auto_59597 ?auto_59598 ?auto_59599 ?auto_59600 ?auto_59601 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_59611 - BLOCK
      ?auto_59612 - BLOCK
      ?auto_59613 - BLOCK
      ?auto_59614 - BLOCK
      ?auto_59615 - BLOCK
      ?auto_59616 - BLOCK
      ?auto_59617 - BLOCK
      ?auto_59618 - BLOCK
      ?auto_59619 - BLOCK
    )
    :vars
    (
      ?auto_59620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59619 ?auto_59620 ) ( ON-TABLE ?auto_59611 ) ( ON ?auto_59612 ?auto_59611 ) ( ON ?auto_59613 ?auto_59612 ) ( ON ?auto_59614 ?auto_59613 ) ( ON ?auto_59615 ?auto_59614 ) ( ON ?auto_59616 ?auto_59615 ) ( not ( = ?auto_59611 ?auto_59612 ) ) ( not ( = ?auto_59611 ?auto_59613 ) ) ( not ( = ?auto_59611 ?auto_59614 ) ) ( not ( = ?auto_59611 ?auto_59615 ) ) ( not ( = ?auto_59611 ?auto_59616 ) ) ( not ( = ?auto_59611 ?auto_59617 ) ) ( not ( = ?auto_59611 ?auto_59618 ) ) ( not ( = ?auto_59611 ?auto_59619 ) ) ( not ( = ?auto_59611 ?auto_59620 ) ) ( not ( = ?auto_59612 ?auto_59613 ) ) ( not ( = ?auto_59612 ?auto_59614 ) ) ( not ( = ?auto_59612 ?auto_59615 ) ) ( not ( = ?auto_59612 ?auto_59616 ) ) ( not ( = ?auto_59612 ?auto_59617 ) ) ( not ( = ?auto_59612 ?auto_59618 ) ) ( not ( = ?auto_59612 ?auto_59619 ) ) ( not ( = ?auto_59612 ?auto_59620 ) ) ( not ( = ?auto_59613 ?auto_59614 ) ) ( not ( = ?auto_59613 ?auto_59615 ) ) ( not ( = ?auto_59613 ?auto_59616 ) ) ( not ( = ?auto_59613 ?auto_59617 ) ) ( not ( = ?auto_59613 ?auto_59618 ) ) ( not ( = ?auto_59613 ?auto_59619 ) ) ( not ( = ?auto_59613 ?auto_59620 ) ) ( not ( = ?auto_59614 ?auto_59615 ) ) ( not ( = ?auto_59614 ?auto_59616 ) ) ( not ( = ?auto_59614 ?auto_59617 ) ) ( not ( = ?auto_59614 ?auto_59618 ) ) ( not ( = ?auto_59614 ?auto_59619 ) ) ( not ( = ?auto_59614 ?auto_59620 ) ) ( not ( = ?auto_59615 ?auto_59616 ) ) ( not ( = ?auto_59615 ?auto_59617 ) ) ( not ( = ?auto_59615 ?auto_59618 ) ) ( not ( = ?auto_59615 ?auto_59619 ) ) ( not ( = ?auto_59615 ?auto_59620 ) ) ( not ( = ?auto_59616 ?auto_59617 ) ) ( not ( = ?auto_59616 ?auto_59618 ) ) ( not ( = ?auto_59616 ?auto_59619 ) ) ( not ( = ?auto_59616 ?auto_59620 ) ) ( not ( = ?auto_59617 ?auto_59618 ) ) ( not ( = ?auto_59617 ?auto_59619 ) ) ( not ( = ?auto_59617 ?auto_59620 ) ) ( not ( = ?auto_59618 ?auto_59619 ) ) ( not ( = ?auto_59618 ?auto_59620 ) ) ( not ( = ?auto_59619 ?auto_59620 ) ) ( ON ?auto_59618 ?auto_59619 ) ( CLEAR ?auto_59616 ) ( ON ?auto_59617 ?auto_59618 ) ( CLEAR ?auto_59617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_59611 ?auto_59612 ?auto_59613 ?auto_59614 ?auto_59615 ?auto_59616 ?auto_59617 )
      ( MAKE-9PILE ?auto_59611 ?auto_59612 ?auto_59613 ?auto_59614 ?auto_59615 ?auto_59616 ?auto_59617 ?auto_59618 ?auto_59619 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_59630 - BLOCK
      ?auto_59631 - BLOCK
      ?auto_59632 - BLOCK
      ?auto_59633 - BLOCK
      ?auto_59634 - BLOCK
      ?auto_59635 - BLOCK
      ?auto_59636 - BLOCK
      ?auto_59637 - BLOCK
      ?auto_59638 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59638 ) ( ON-TABLE ?auto_59630 ) ( ON ?auto_59631 ?auto_59630 ) ( ON ?auto_59632 ?auto_59631 ) ( ON ?auto_59633 ?auto_59632 ) ( ON ?auto_59634 ?auto_59633 ) ( ON ?auto_59635 ?auto_59634 ) ( not ( = ?auto_59630 ?auto_59631 ) ) ( not ( = ?auto_59630 ?auto_59632 ) ) ( not ( = ?auto_59630 ?auto_59633 ) ) ( not ( = ?auto_59630 ?auto_59634 ) ) ( not ( = ?auto_59630 ?auto_59635 ) ) ( not ( = ?auto_59630 ?auto_59636 ) ) ( not ( = ?auto_59630 ?auto_59637 ) ) ( not ( = ?auto_59630 ?auto_59638 ) ) ( not ( = ?auto_59631 ?auto_59632 ) ) ( not ( = ?auto_59631 ?auto_59633 ) ) ( not ( = ?auto_59631 ?auto_59634 ) ) ( not ( = ?auto_59631 ?auto_59635 ) ) ( not ( = ?auto_59631 ?auto_59636 ) ) ( not ( = ?auto_59631 ?auto_59637 ) ) ( not ( = ?auto_59631 ?auto_59638 ) ) ( not ( = ?auto_59632 ?auto_59633 ) ) ( not ( = ?auto_59632 ?auto_59634 ) ) ( not ( = ?auto_59632 ?auto_59635 ) ) ( not ( = ?auto_59632 ?auto_59636 ) ) ( not ( = ?auto_59632 ?auto_59637 ) ) ( not ( = ?auto_59632 ?auto_59638 ) ) ( not ( = ?auto_59633 ?auto_59634 ) ) ( not ( = ?auto_59633 ?auto_59635 ) ) ( not ( = ?auto_59633 ?auto_59636 ) ) ( not ( = ?auto_59633 ?auto_59637 ) ) ( not ( = ?auto_59633 ?auto_59638 ) ) ( not ( = ?auto_59634 ?auto_59635 ) ) ( not ( = ?auto_59634 ?auto_59636 ) ) ( not ( = ?auto_59634 ?auto_59637 ) ) ( not ( = ?auto_59634 ?auto_59638 ) ) ( not ( = ?auto_59635 ?auto_59636 ) ) ( not ( = ?auto_59635 ?auto_59637 ) ) ( not ( = ?auto_59635 ?auto_59638 ) ) ( not ( = ?auto_59636 ?auto_59637 ) ) ( not ( = ?auto_59636 ?auto_59638 ) ) ( not ( = ?auto_59637 ?auto_59638 ) ) ( ON ?auto_59637 ?auto_59638 ) ( CLEAR ?auto_59635 ) ( ON ?auto_59636 ?auto_59637 ) ( CLEAR ?auto_59636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_59630 ?auto_59631 ?auto_59632 ?auto_59633 ?auto_59634 ?auto_59635 ?auto_59636 )
      ( MAKE-9PILE ?auto_59630 ?auto_59631 ?auto_59632 ?auto_59633 ?auto_59634 ?auto_59635 ?auto_59636 ?auto_59637 ?auto_59638 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_59648 - BLOCK
      ?auto_59649 - BLOCK
      ?auto_59650 - BLOCK
      ?auto_59651 - BLOCK
      ?auto_59652 - BLOCK
      ?auto_59653 - BLOCK
      ?auto_59654 - BLOCK
      ?auto_59655 - BLOCK
      ?auto_59656 - BLOCK
    )
    :vars
    (
      ?auto_59657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59656 ?auto_59657 ) ( ON-TABLE ?auto_59648 ) ( ON ?auto_59649 ?auto_59648 ) ( ON ?auto_59650 ?auto_59649 ) ( ON ?auto_59651 ?auto_59650 ) ( ON ?auto_59652 ?auto_59651 ) ( not ( = ?auto_59648 ?auto_59649 ) ) ( not ( = ?auto_59648 ?auto_59650 ) ) ( not ( = ?auto_59648 ?auto_59651 ) ) ( not ( = ?auto_59648 ?auto_59652 ) ) ( not ( = ?auto_59648 ?auto_59653 ) ) ( not ( = ?auto_59648 ?auto_59654 ) ) ( not ( = ?auto_59648 ?auto_59655 ) ) ( not ( = ?auto_59648 ?auto_59656 ) ) ( not ( = ?auto_59648 ?auto_59657 ) ) ( not ( = ?auto_59649 ?auto_59650 ) ) ( not ( = ?auto_59649 ?auto_59651 ) ) ( not ( = ?auto_59649 ?auto_59652 ) ) ( not ( = ?auto_59649 ?auto_59653 ) ) ( not ( = ?auto_59649 ?auto_59654 ) ) ( not ( = ?auto_59649 ?auto_59655 ) ) ( not ( = ?auto_59649 ?auto_59656 ) ) ( not ( = ?auto_59649 ?auto_59657 ) ) ( not ( = ?auto_59650 ?auto_59651 ) ) ( not ( = ?auto_59650 ?auto_59652 ) ) ( not ( = ?auto_59650 ?auto_59653 ) ) ( not ( = ?auto_59650 ?auto_59654 ) ) ( not ( = ?auto_59650 ?auto_59655 ) ) ( not ( = ?auto_59650 ?auto_59656 ) ) ( not ( = ?auto_59650 ?auto_59657 ) ) ( not ( = ?auto_59651 ?auto_59652 ) ) ( not ( = ?auto_59651 ?auto_59653 ) ) ( not ( = ?auto_59651 ?auto_59654 ) ) ( not ( = ?auto_59651 ?auto_59655 ) ) ( not ( = ?auto_59651 ?auto_59656 ) ) ( not ( = ?auto_59651 ?auto_59657 ) ) ( not ( = ?auto_59652 ?auto_59653 ) ) ( not ( = ?auto_59652 ?auto_59654 ) ) ( not ( = ?auto_59652 ?auto_59655 ) ) ( not ( = ?auto_59652 ?auto_59656 ) ) ( not ( = ?auto_59652 ?auto_59657 ) ) ( not ( = ?auto_59653 ?auto_59654 ) ) ( not ( = ?auto_59653 ?auto_59655 ) ) ( not ( = ?auto_59653 ?auto_59656 ) ) ( not ( = ?auto_59653 ?auto_59657 ) ) ( not ( = ?auto_59654 ?auto_59655 ) ) ( not ( = ?auto_59654 ?auto_59656 ) ) ( not ( = ?auto_59654 ?auto_59657 ) ) ( not ( = ?auto_59655 ?auto_59656 ) ) ( not ( = ?auto_59655 ?auto_59657 ) ) ( not ( = ?auto_59656 ?auto_59657 ) ) ( ON ?auto_59655 ?auto_59656 ) ( ON ?auto_59654 ?auto_59655 ) ( CLEAR ?auto_59652 ) ( ON ?auto_59653 ?auto_59654 ) ( CLEAR ?auto_59653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_59648 ?auto_59649 ?auto_59650 ?auto_59651 ?auto_59652 ?auto_59653 )
      ( MAKE-9PILE ?auto_59648 ?auto_59649 ?auto_59650 ?auto_59651 ?auto_59652 ?auto_59653 ?auto_59654 ?auto_59655 ?auto_59656 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_59667 - BLOCK
      ?auto_59668 - BLOCK
      ?auto_59669 - BLOCK
      ?auto_59670 - BLOCK
      ?auto_59671 - BLOCK
      ?auto_59672 - BLOCK
      ?auto_59673 - BLOCK
      ?auto_59674 - BLOCK
      ?auto_59675 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59675 ) ( ON-TABLE ?auto_59667 ) ( ON ?auto_59668 ?auto_59667 ) ( ON ?auto_59669 ?auto_59668 ) ( ON ?auto_59670 ?auto_59669 ) ( ON ?auto_59671 ?auto_59670 ) ( not ( = ?auto_59667 ?auto_59668 ) ) ( not ( = ?auto_59667 ?auto_59669 ) ) ( not ( = ?auto_59667 ?auto_59670 ) ) ( not ( = ?auto_59667 ?auto_59671 ) ) ( not ( = ?auto_59667 ?auto_59672 ) ) ( not ( = ?auto_59667 ?auto_59673 ) ) ( not ( = ?auto_59667 ?auto_59674 ) ) ( not ( = ?auto_59667 ?auto_59675 ) ) ( not ( = ?auto_59668 ?auto_59669 ) ) ( not ( = ?auto_59668 ?auto_59670 ) ) ( not ( = ?auto_59668 ?auto_59671 ) ) ( not ( = ?auto_59668 ?auto_59672 ) ) ( not ( = ?auto_59668 ?auto_59673 ) ) ( not ( = ?auto_59668 ?auto_59674 ) ) ( not ( = ?auto_59668 ?auto_59675 ) ) ( not ( = ?auto_59669 ?auto_59670 ) ) ( not ( = ?auto_59669 ?auto_59671 ) ) ( not ( = ?auto_59669 ?auto_59672 ) ) ( not ( = ?auto_59669 ?auto_59673 ) ) ( not ( = ?auto_59669 ?auto_59674 ) ) ( not ( = ?auto_59669 ?auto_59675 ) ) ( not ( = ?auto_59670 ?auto_59671 ) ) ( not ( = ?auto_59670 ?auto_59672 ) ) ( not ( = ?auto_59670 ?auto_59673 ) ) ( not ( = ?auto_59670 ?auto_59674 ) ) ( not ( = ?auto_59670 ?auto_59675 ) ) ( not ( = ?auto_59671 ?auto_59672 ) ) ( not ( = ?auto_59671 ?auto_59673 ) ) ( not ( = ?auto_59671 ?auto_59674 ) ) ( not ( = ?auto_59671 ?auto_59675 ) ) ( not ( = ?auto_59672 ?auto_59673 ) ) ( not ( = ?auto_59672 ?auto_59674 ) ) ( not ( = ?auto_59672 ?auto_59675 ) ) ( not ( = ?auto_59673 ?auto_59674 ) ) ( not ( = ?auto_59673 ?auto_59675 ) ) ( not ( = ?auto_59674 ?auto_59675 ) ) ( ON ?auto_59674 ?auto_59675 ) ( ON ?auto_59673 ?auto_59674 ) ( CLEAR ?auto_59671 ) ( ON ?auto_59672 ?auto_59673 ) ( CLEAR ?auto_59672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_59667 ?auto_59668 ?auto_59669 ?auto_59670 ?auto_59671 ?auto_59672 )
      ( MAKE-9PILE ?auto_59667 ?auto_59668 ?auto_59669 ?auto_59670 ?auto_59671 ?auto_59672 ?auto_59673 ?auto_59674 ?auto_59675 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_59685 - BLOCK
      ?auto_59686 - BLOCK
      ?auto_59687 - BLOCK
      ?auto_59688 - BLOCK
      ?auto_59689 - BLOCK
      ?auto_59690 - BLOCK
      ?auto_59691 - BLOCK
      ?auto_59692 - BLOCK
      ?auto_59693 - BLOCK
    )
    :vars
    (
      ?auto_59694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59693 ?auto_59694 ) ( ON-TABLE ?auto_59685 ) ( ON ?auto_59686 ?auto_59685 ) ( ON ?auto_59687 ?auto_59686 ) ( ON ?auto_59688 ?auto_59687 ) ( not ( = ?auto_59685 ?auto_59686 ) ) ( not ( = ?auto_59685 ?auto_59687 ) ) ( not ( = ?auto_59685 ?auto_59688 ) ) ( not ( = ?auto_59685 ?auto_59689 ) ) ( not ( = ?auto_59685 ?auto_59690 ) ) ( not ( = ?auto_59685 ?auto_59691 ) ) ( not ( = ?auto_59685 ?auto_59692 ) ) ( not ( = ?auto_59685 ?auto_59693 ) ) ( not ( = ?auto_59685 ?auto_59694 ) ) ( not ( = ?auto_59686 ?auto_59687 ) ) ( not ( = ?auto_59686 ?auto_59688 ) ) ( not ( = ?auto_59686 ?auto_59689 ) ) ( not ( = ?auto_59686 ?auto_59690 ) ) ( not ( = ?auto_59686 ?auto_59691 ) ) ( not ( = ?auto_59686 ?auto_59692 ) ) ( not ( = ?auto_59686 ?auto_59693 ) ) ( not ( = ?auto_59686 ?auto_59694 ) ) ( not ( = ?auto_59687 ?auto_59688 ) ) ( not ( = ?auto_59687 ?auto_59689 ) ) ( not ( = ?auto_59687 ?auto_59690 ) ) ( not ( = ?auto_59687 ?auto_59691 ) ) ( not ( = ?auto_59687 ?auto_59692 ) ) ( not ( = ?auto_59687 ?auto_59693 ) ) ( not ( = ?auto_59687 ?auto_59694 ) ) ( not ( = ?auto_59688 ?auto_59689 ) ) ( not ( = ?auto_59688 ?auto_59690 ) ) ( not ( = ?auto_59688 ?auto_59691 ) ) ( not ( = ?auto_59688 ?auto_59692 ) ) ( not ( = ?auto_59688 ?auto_59693 ) ) ( not ( = ?auto_59688 ?auto_59694 ) ) ( not ( = ?auto_59689 ?auto_59690 ) ) ( not ( = ?auto_59689 ?auto_59691 ) ) ( not ( = ?auto_59689 ?auto_59692 ) ) ( not ( = ?auto_59689 ?auto_59693 ) ) ( not ( = ?auto_59689 ?auto_59694 ) ) ( not ( = ?auto_59690 ?auto_59691 ) ) ( not ( = ?auto_59690 ?auto_59692 ) ) ( not ( = ?auto_59690 ?auto_59693 ) ) ( not ( = ?auto_59690 ?auto_59694 ) ) ( not ( = ?auto_59691 ?auto_59692 ) ) ( not ( = ?auto_59691 ?auto_59693 ) ) ( not ( = ?auto_59691 ?auto_59694 ) ) ( not ( = ?auto_59692 ?auto_59693 ) ) ( not ( = ?auto_59692 ?auto_59694 ) ) ( not ( = ?auto_59693 ?auto_59694 ) ) ( ON ?auto_59692 ?auto_59693 ) ( ON ?auto_59691 ?auto_59692 ) ( ON ?auto_59690 ?auto_59691 ) ( CLEAR ?auto_59688 ) ( ON ?auto_59689 ?auto_59690 ) ( CLEAR ?auto_59689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59685 ?auto_59686 ?auto_59687 ?auto_59688 ?auto_59689 )
      ( MAKE-9PILE ?auto_59685 ?auto_59686 ?auto_59687 ?auto_59688 ?auto_59689 ?auto_59690 ?auto_59691 ?auto_59692 ?auto_59693 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_59704 - BLOCK
      ?auto_59705 - BLOCK
      ?auto_59706 - BLOCK
      ?auto_59707 - BLOCK
      ?auto_59708 - BLOCK
      ?auto_59709 - BLOCK
      ?auto_59710 - BLOCK
      ?auto_59711 - BLOCK
      ?auto_59712 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59712 ) ( ON-TABLE ?auto_59704 ) ( ON ?auto_59705 ?auto_59704 ) ( ON ?auto_59706 ?auto_59705 ) ( ON ?auto_59707 ?auto_59706 ) ( not ( = ?auto_59704 ?auto_59705 ) ) ( not ( = ?auto_59704 ?auto_59706 ) ) ( not ( = ?auto_59704 ?auto_59707 ) ) ( not ( = ?auto_59704 ?auto_59708 ) ) ( not ( = ?auto_59704 ?auto_59709 ) ) ( not ( = ?auto_59704 ?auto_59710 ) ) ( not ( = ?auto_59704 ?auto_59711 ) ) ( not ( = ?auto_59704 ?auto_59712 ) ) ( not ( = ?auto_59705 ?auto_59706 ) ) ( not ( = ?auto_59705 ?auto_59707 ) ) ( not ( = ?auto_59705 ?auto_59708 ) ) ( not ( = ?auto_59705 ?auto_59709 ) ) ( not ( = ?auto_59705 ?auto_59710 ) ) ( not ( = ?auto_59705 ?auto_59711 ) ) ( not ( = ?auto_59705 ?auto_59712 ) ) ( not ( = ?auto_59706 ?auto_59707 ) ) ( not ( = ?auto_59706 ?auto_59708 ) ) ( not ( = ?auto_59706 ?auto_59709 ) ) ( not ( = ?auto_59706 ?auto_59710 ) ) ( not ( = ?auto_59706 ?auto_59711 ) ) ( not ( = ?auto_59706 ?auto_59712 ) ) ( not ( = ?auto_59707 ?auto_59708 ) ) ( not ( = ?auto_59707 ?auto_59709 ) ) ( not ( = ?auto_59707 ?auto_59710 ) ) ( not ( = ?auto_59707 ?auto_59711 ) ) ( not ( = ?auto_59707 ?auto_59712 ) ) ( not ( = ?auto_59708 ?auto_59709 ) ) ( not ( = ?auto_59708 ?auto_59710 ) ) ( not ( = ?auto_59708 ?auto_59711 ) ) ( not ( = ?auto_59708 ?auto_59712 ) ) ( not ( = ?auto_59709 ?auto_59710 ) ) ( not ( = ?auto_59709 ?auto_59711 ) ) ( not ( = ?auto_59709 ?auto_59712 ) ) ( not ( = ?auto_59710 ?auto_59711 ) ) ( not ( = ?auto_59710 ?auto_59712 ) ) ( not ( = ?auto_59711 ?auto_59712 ) ) ( ON ?auto_59711 ?auto_59712 ) ( ON ?auto_59710 ?auto_59711 ) ( ON ?auto_59709 ?auto_59710 ) ( CLEAR ?auto_59707 ) ( ON ?auto_59708 ?auto_59709 ) ( CLEAR ?auto_59708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59704 ?auto_59705 ?auto_59706 ?auto_59707 ?auto_59708 )
      ( MAKE-9PILE ?auto_59704 ?auto_59705 ?auto_59706 ?auto_59707 ?auto_59708 ?auto_59709 ?auto_59710 ?auto_59711 ?auto_59712 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_59722 - BLOCK
      ?auto_59723 - BLOCK
      ?auto_59724 - BLOCK
      ?auto_59725 - BLOCK
      ?auto_59726 - BLOCK
      ?auto_59727 - BLOCK
      ?auto_59728 - BLOCK
      ?auto_59729 - BLOCK
      ?auto_59730 - BLOCK
    )
    :vars
    (
      ?auto_59731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59730 ?auto_59731 ) ( ON-TABLE ?auto_59722 ) ( ON ?auto_59723 ?auto_59722 ) ( ON ?auto_59724 ?auto_59723 ) ( not ( = ?auto_59722 ?auto_59723 ) ) ( not ( = ?auto_59722 ?auto_59724 ) ) ( not ( = ?auto_59722 ?auto_59725 ) ) ( not ( = ?auto_59722 ?auto_59726 ) ) ( not ( = ?auto_59722 ?auto_59727 ) ) ( not ( = ?auto_59722 ?auto_59728 ) ) ( not ( = ?auto_59722 ?auto_59729 ) ) ( not ( = ?auto_59722 ?auto_59730 ) ) ( not ( = ?auto_59722 ?auto_59731 ) ) ( not ( = ?auto_59723 ?auto_59724 ) ) ( not ( = ?auto_59723 ?auto_59725 ) ) ( not ( = ?auto_59723 ?auto_59726 ) ) ( not ( = ?auto_59723 ?auto_59727 ) ) ( not ( = ?auto_59723 ?auto_59728 ) ) ( not ( = ?auto_59723 ?auto_59729 ) ) ( not ( = ?auto_59723 ?auto_59730 ) ) ( not ( = ?auto_59723 ?auto_59731 ) ) ( not ( = ?auto_59724 ?auto_59725 ) ) ( not ( = ?auto_59724 ?auto_59726 ) ) ( not ( = ?auto_59724 ?auto_59727 ) ) ( not ( = ?auto_59724 ?auto_59728 ) ) ( not ( = ?auto_59724 ?auto_59729 ) ) ( not ( = ?auto_59724 ?auto_59730 ) ) ( not ( = ?auto_59724 ?auto_59731 ) ) ( not ( = ?auto_59725 ?auto_59726 ) ) ( not ( = ?auto_59725 ?auto_59727 ) ) ( not ( = ?auto_59725 ?auto_59728 ) ) ( not ( = ?auto_59725 ?auto_59729 ) ) ( not ( = ?auto_59725 ?auto_59730 ) ) ( not ( = ?auto_59725 ?auto_59731 ) ) ( not ( = ?auto_59726 ?auto_59727 ) ) ( not ( = ?auto_59726 ?auto_59728 ) ) ( not ( = ?auto_59726 ?auto_59729 ) ) ( not ( = ?auto_59726 ?auto_59730 ) ) ( not ( = ?auto_59726 ?auto_59731 ) ) ( not ( = ?auto_59727 ?auto_59728 ) ) ( not ( = ?auto_59727 ?auto_59729 ) ) ( not ( = ?auto_59727 ?auto_59730 ) ) ( not ( = ?auto_59727 ?auto_59731 ) ) ( not ( = ?auto_59728 ?auto_59729 ) ) ( not ( = ?auto_59728 ?auto_59730 ) ) ( not ( = ?auto_59728 ?auto_59731 ) ) ( not ( = ?auto_59729 ?auto_59730 ) ) ( not ( = ?auto_59729 ?auto_59731 ) ) ( not ( = ?auto_59730 ?auto_59731 ) ) ( ON ?auto_59729 ?auto_59730 ) ( ON ?auto_59728 ?auto_59729 ) ( ON ?auto_59727 ?auto_59728 ) ( ON ?auto_59726 ?auto_59727 ) ( CLEAR ?auto_59724 ) ( ON ?auto_59725 ?auto_59726 ) ( CLEAR ?auto_59725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59722 ?auto_59723 ?auto_59724 ?auto_59725 )
      ( MAKE-9PILE ?auto_59722 ?auto_59723 ?auto_59724 ?auto_59725 ?auto_59726 ?auto_59727 ?auto_59728 ?auto_59729 ?auto_59730 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_59741 - BLOCK
      ?auto_59742 - BLOCK
      ?auto_59743 - BLOCK
      ?auto_59744 - BLOCK
      ?auto_59745 - BLOCK
      ?auto_59746 - BLOCK
      ?auto_59747 - BLOCK
      ?auto_59748 - BLOCK
      ?auto_59749 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59749 ) ( ON-TABLE ?auto_59741 ) ( ON ?auto_59742 ?auto_59741 ) ( ON ?auto_59743 ?auto_59742 ) ( not ( = ?auto_59741 ?auto_59742 ) ) ( not ( = ?auto_59741 ?auto_59743 ) ) ( not ( = ?auto_59741 ?auto_59744 ) ) ( not ( = ?auto_59741 ?auto_59745 ) ) ( not ( = ?auto_59741 ?auto_59746 ) ) ( not ( = ?auto_59741 ?auto_59747 ) ) ( not ( = ?auto_59741 ?auto_59748 ) ) ( not ( = ?auto_59741 ?auto_59749 ) ) ( not ( = ?auto_59742 ?auto_59743 ) ) ( not ( = ?auto_59742 ?auto_59744 ) ) ( not ( = ?auto_59742 ?auto_59745 ) ) ( not ( = ?auto_59742 ?auto_59746 ) ) ( not ( = ?auto_59742 ?auto_59747 ) ) ( not ( = ?auto_59742 ?auto_59748 ) ) ( not ( = ?auto_59742 ?auto_59749 ) ) ( not ( = ?auto_59743 ?auto_59744 ) ) ( not ( = ?auto_59743 ?auto_59745 ) ) ( not ( = ?auto_59743 ?auto_59746 ) ) ( not ( = ?auto_59743 ?auto_59747 ) ) ( not ( = ?auto_59743 ?auto_59748 ) ) ( not ( = ?auto_59743 ?auto_59749 ) ) ( not ( = ?auto_59744 ?auto_59745 ) ) ( not ( = ?auto_59744 ?auto_59746 ) ) ( not ( = ?auto_59744 ?auto_59747 ) ) ( not ( = ?auto_59744 ?auto_59748 ) ) ( not ( = ?auto_59744 ?auto_59749 ) ) ( not ( = ?auto_59745 ?auto_59746 ) ) ( not ( = ?auto_59745 ?auto_59747 ) ) ( not ( = ?auto_59745 ?auto_59748 ) ) ( not ( = ?auto_59745 ?auto_59749 ) ) ( not ( = ?auto_59746 ?auto_59747 ) ) ( not ( = ?auto_59746 ?auto_59748 ) ) ( not ( = ?auto_59746 ?auto_59749 ) ) ( not ( = ?auto_59747 ?auto_59748 ) ) ( not ( = ?auto_59747 ?auto_59749 ) ) ( not ( = ?auto_59748 ?auto_59749 ) ) ( ON ?auto_59748 ?auto_59749 ) ( ON ?auto_59747 ?auto_59748 ) ( ON ?auto_59746 ?auto_59747 ) ( ON ?auto_59745 ?auto_59746 ) ( CLEAR ?auto_59743 ) ( ON ?auto_59744 ?auto_59745 ) ( CLEAR ?auto_59744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59741 ?auto_59742 ?auto_59743 ?auto_59744 )
      ( MAKE-9PILE ?auto_59741 ?auto_59742 ?auto_59743 ?auto_59744 ?auto_59745 ?auto_59746 ?auto_59747 ?auto_59748 ?auto_59749 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_59759 - BLOCK
      ?auto_59760 - BLOCK
      ?auto_59761 - BLOCK
      ?auto_59762 - BLOCK
      ?auto_59763 - BLOCK
      ?auto_59764 - BLOCK
      ?auto_59765 - BLOCK
      ?auto_59766 - BLOCK
      ?auto_59767 - BLOCK
    )
    :vars
    (
      ?auto_59768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59767 ?auto_59768 ) ( ON-TABLE ?auto_59759 ) ( ON ?auto_59760 ?auto_59759 ) ( not ( = ?auto_59759 ?auto_59760 ) ) ( not ( = ?auto_59759 ?auto_59761 ) ) ( not ( = ?auto_59759 ?auto_59762 ) ) ( not ( = ?auto_59759 ?auto_59763 ) ) ( not ( = ?auto_59759 ?auto_59764 ) ) ( not ( = ?auto_59759 ?auto_59765 ) ) ( not ( = ?auto_59759 ?auto_59766 ) ) ( not ( = ?auto_59759 ?auto_59767 ) ) ( not ( = ?auto_59759 ?auto_59768 ) ) ( not ( = ?auto_59760 ?auto_59761 ) ) ( not ( = ?auto_59760 ?auto_59762 ) ) ( not ( = ?auto_59760 ?auto_59763 ) ) ( not ( = ?auto_59760 ?auto_59764 ) ) ( not ( = ?auto_59760 ?auto_59765 ) ) ( not ( = ?auto_59760 ?auto_59766 ) ) ( not ( = ?auto_59760 ?auto_59767 ) ) ( not ( = ?auto_59760 ?auto_59768 ) ) ( not ( = ?auto_59761 ?auto_59762 ) ) ( not ( = ?auto_59761 ?auto_59763 ) ) ( not ( = ?auto_59761 ?auto_59764 ) ) ( not ( = ?auto_59761 ?auto_59765 ) ) ( not ( = ?auto_59761 ?auto_59766 ) ) ( not ( = ?auto_59761 ?auto_59767 ) ) ( not ( = ?auto_59761 ?auto_59768 ) ) ( not ( = ?auto_59762 ?auto_59763 ) ) ( not ( = ?auto_59762 ?auto_59764 ) ) ( not ( = ?auto_59762 ?auto_59765 ) ) ( not ( = ?auto_59762 ?auto_59766 ) ) ( not ( = ?auto_59762 ?auto_59767 ) ) ( not ( = ?auto_59762 ?auto_59768 ) ) ( not ( = ?auto_59763 ?auto_59764 ) ) ( not ( = ?auto_59763 ?auto_59765 ) ) ( not ( = ?auto_59763 ?auto_59766 ) ) ( not ( = ?auto_59763 ?auto_59767 ) ) ( not ( = ?auto_59763 ?auto_59768 ) ) ( not ( = ?auto_59764 ?auto_59765 ) ) ( not ( = ?auto_59764 ?auto_59766 ) ) ( not ( = ?auto_59764 ?auto_59767 ) ) ( not ( = ?auto_59764 ?auto_59768 ) ) ( not ( = ?auto_59765 ?auto_59766 ) ) ( not ( = ?auto_59765 ?auto_59767 ) ) ( not ( = ?auto_59765 ?auto_59768 ) ) ( not ( = ?auto_59766 ?auto_59767 ) ) ( not ( = ?auto_59766 ?auto_59768 ) ) ( not ( = ?auto_59767 ?auto_59768 ) ) ( ON ?auto_59766 ?auto_59767 ) ( ON ?auto_59765 ?auto_59766 ) ( ON ?auto_59764 ?auto_59765 ) ( ON ?auto_59763 ?auto_59764 ) ( ON ?auto_59762 ?auto_59763 ) ( CLEAR ?auto_59760 ) ( ON ?auto_59761 ?auto_59762 ) ( CLEAR ?auto_59761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59759 ?auto_59760 ?auto_59761 )
      ( MAKE-9PILE ?auto_59759 ?auto_59760 ?auto_59761 ?auto_59762 ?auto_59763 ?auto_59764 ?auto_59765 ?auto_59766 ?auto_59767 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_59778 - BLOCK
      ?auto_59779 - BLOCK
      ?auto_59780 - BLOCK
      ?auto_59781 - BLOCK
      ?auto_59782 - BLOCK
      ?auto_59783 - BLOCK
      ?auto_59784 - BLOCK
      ?auto_59785 - BLOCK
      ?auto_59786 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59786 ) ( ON-TABLE ?auto_59778 ) ( ON ?auto_59779 ?auto_59778 ) ( not ( = ?auto_59778 ?auto_59779 ) ) ( not ( = ?auto_59778 ?auto_59780 ) ) ( not ( = ?auto_59778 ?auto_59781 ) ) ( not ( = ?auto_59778 ?auto_59782 ) ) ( not ( = ?auto_59778 ?auto_59783 ) ) ( not ( = ?auto_59778 ?auto_59784 ) ) ( not ( = ?auto_59778 ?auto_59785 ) ) ( not ( = ?auto_59778 ?auto_59786 ) ) ( not ( = ?auto_59779 ?auto_59780 ) ) ( not ( = ?auto_59779 ?auto_59781 ) ) ( not ( = ?auto_59779 ?auto_59782 ) ) ( not ( = ?auto_59779 ?auto_59783 ) ) ( not ( = ?auto_59779 ?auto_59784 ) ) ( not ( = ?auto_59779 ?auto_59785 ) ) ( not ( = ?auto_59779 ?auto_59786 ) ) ( not ( = ?auto_59780 ?auto_59781 ) ) ( not ( = ?auto_59780 ?auto_59782 ) ) ( not ( = ?auto_59780 ?auto_59783 ) ) ( not ( = ?auto_59780 ?auto_59784 ) ) ( not ( = ?auto_59780 ?auto_59785 ) ) ( not ( = ?auto_59780 ?auto_59786 ) ) ( not ( = ?auto_59781 ?auto_59782 ) ) ( not ( = ?auto_59781 ?auto_59783 ) ) ( not ( = ?auto_59781 ?auto_59784 ) ) ( not ( = ?auto_59781 ?auto_59785 ) ) ( not ( = ?auto_59781 ?auto_59786 ) ) ( not ( = ?auto_59782 ?auto_59783 ) ) ( not ( = ?auto_59782 ?auto_59784 ) ) ( not ( = ?auto_59782 ?auto_59785 ) ) ( not ( = ?auto_59782 ?auto_59786 ) ) ( not ( = ?auto_59783 ?auto_59784 ) ) ( not ( = ?auto_59783 ?auto_59785 ) ) ( not ( = ?auto_59783 ?auto_59786 ) ) ( not ( = ?auto_59784 ?auto_59785 ) ) ( not ( = ?auto_59784 ?auto_59786 ) ) ( not ( = ?auto_59785 ?auto_59786 ) ) ( ON ?auto_59785 ?auto_59786 ) ( ON ?auto_59784 ?auto_59785 ) ( ON ?auto_59783 ?auto_59784 ) ( ON ?auto_59782 ?auto_59783 ) ( ON ?auto_59781 ?auto_59782 ) ( CLEAR ?auto_59779 ) ( ON ?auto_59780 ?auto_59781 ) ( CLEAR ?auto_59780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59778 ?auto_59779 ?auto_59780 )
      ( MAKE-9PILE ?auto_59778 ?auto_59779 ?auto_59780 ?auto_59781 ?auto_59782 ?auto_59783 ?auto_59784 ?auto_59785 ?auto_59786 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_59796 - BLOCK
      ?auto_59797 - BLOCK
      ?auto_59798 - BLOCK
      ?auto_59799 - BLOCK
      ?auto_59800 - BLOCK
      ?auto_59801 - BLOCK
      ?auto_59802 - BLOCK
      ?auto_59803 - BLOCK
      ?auto_59804 - BLOCK
    )
    :vars
    (
      ?auto_59805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59804 ?auto_59805 ) ( ON-TABLE ?auto_59796 ) ( not ( = ?auto_59796 ?auto_59797 ) ) ( not ( = ?auto_59796 ?auto_59798 ) ) ( not ( = ?auto_59796 ?auto_59799 ) ) ( not ( = ?auto_59796 ?auto_59800 ) ) ( not ( = ?auto_59796 ?auto_59801 ) ) ( not ( = ?auto_59796 ?auto_59802 ) ) ( not ( = ?auto_59796 ?auto_59803 ) ) ( not ( = ?auto_59796 ?auto_59804 ) ) ( not ( = ?auto_59796 ?auto_59805 ) ) ( not ( = ?auto_59797 ?auto_59798 ) ) ( not ( = ?auto_59797 ?auto_59799 ) ) ( not ( = ?auto_59797 ?auto_59800 ) ) ( not ( = ?auto_59797 ?auto_59801 ) ) ( not ( = ?auto_59797 ?auto_59802 ) ) ( not ( = ?auto_59797 ?auto_59803 ) ) ( not ( = ?auto_59797 ?auto_59804 ) ) ( not ( = ?auto_59797 ?auto_59805 ) ) ( not ( = ?auto_59798 ?auto_59799 ) ) ( not ( = ?auto_59798 ?auto_59800 ) ) ( not ( = ?auto_59798 ?auto_59801 ) ) ( not ( = ?auto_59798 ?auto_59802 ) ) ( not ( = ?auto_59798 ?auto_59803 ) ) ( not ( = ?auto_59798 ?auto_59804 ) ) ( not ( = ?auto_59798 ?auto_59805 ) ) ( not ( = ?auto_59799 ?auto_59800 ) ) ( not ( = ?auto_59799 ?auto_59801 ) ) ( not ( = ?auto_59799 ?auto_59802 ) ) ( not ( = ?auto_59799 ?auto_59803 ) ) ( not ( = ?auto_59799 ?auto_59804 ) ) ( not ( = ?auto_59799 ?auto_59805 ) ) ( not ( = ?auto_59800 ?auto_59801 ) ) ( not ( = ?auto_59800 ?auto_59802 ) ) ( not ( = ?auto_59800 ?auto_59803 ) ) ( not ( = ?auto_59800 ?auto_59804 ) ) ( not ( = ?auto_59800 ?auto_59805 ) ) ( not ( = ?auto_59801 ?auto_59802 ) ) ( not ( = ?auto_59801 ?auto_59803 ) ) ( not ( = ?auto_59801 ?auto_59804 ) ) ( not ( = ?auto_59801 ?auto_59805 ) ) ( not ( = ?auto_59802 ?auto_59803 ) ) ( not ( = ?auto_59802 ?auto_59804 ) ) ( not ( = ?auto_59802 ?auto_59805 ) ) ( not ( = ?auto_59803 ?auto_59804 ) ) ( not ( = ?auto_59803 ?auto_59805 ) ) ( not ( = ?auto_59804 ?auto_59805 ) ) ( ON ?auto_59803 ?auto_59804 ) ( ON ?auto_59802 ?auto_59803 ) ( ON ?auto_59801 ?auto_59802 ) ( ON ?auto_59800 ?auto_59801 ) ( ON ?auto_59799 ?auto_59800 ) ( ON ?auto_59798 ?auto_59799 ) ( CLEAR ?auto_59796 ) ( ON ?auto_59797 ?auto_59798 ) ( CLEAR ?auto_59797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59796 ?auto_59797 )
      ( MAKE-9PILE ?auto_59796 ?auto_59797 ?auto_59798 ?auto_59799 ?auto_59800 ?auto_59801 ?auto_59802 ?auto_59803 ?auto_59804 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_59815 - BLOCK
      ?auto_59816 - BLOCK
      ?auto_59817 - BLOCK
      ?auto_59818 - BLOCK
      ?auto_59819 - BLOCK
      ?auto_59820 - BLOCK
      ?auto_59821 - BLOCK
      ?auto_59822 - BLOCK
      ?auto_59823 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59823 ) ( ON-TABLE ?auto_59815 ) ( not ( = ?auto_59815 ?auto_59816 ) ) ( not ( = ?auto_59815 ?auto_59817 ) ) ( not ( = ?auto_59815 ?auto_59818 ) ) ( not ( = ?auto_59815 ?auto_59819 ) ) ( not ( = ?auto_59815 ?auto_59820 ) ) ( not ( = ?auto_59815 ?auto_59821 ) ) ( not ( = ?auto_59815 ?auto_59822 ) ) ( not ( = ?auto_59815 ?auto_59823 ) ) ( not ( = ?auto_59816 ?auto_59817 ) ) ( not ( = ?auto_59816 ?auto_59818 ) ) ( not ( = ?auto_59816 ?auto_59819 ) ) ( not ( = ?auto_59816 ?auto_59820 ) ) ( not ( = ?auto_59816 ?auto_59821 ) ) ( not ( = ?auto_59816 ?auto_59822 ) ) ( not ( = ?auto_59816 ?auto_59823 ) ) ( not ( = ?auto_59817 ?auto_59818 ) ) ( not ( = ?auto_59817 ?auto_59819 ) ) ( not ( = ?auto_59817 ?auto_59820 ) ) ( not ( = ?auto_59817 ?auto_59821 ) ) ( not ( = ?auto_59817 ?auto_59822 ) ) ( not ( = ?auto_59817 ?auto_59823 ) ) ( not ( = ?auto_59818 ?auto_59819 ) ) ( not ( = ?auto_59818 ?auto_59820 ) ) ( not ( = ?auto_59818 ?auto_59821 ) ) ( not ( = ?auto_59818 ?auto_59822 ) ) ( not ( = ?auto_59818 ?auto_59823 ) ) ( not ( = ?auto_59819 ?auto_59820 ) ) ( not ( = ?auto_59819 ?auto_59821 ) ) ( not ( = ?auto_59819 ?auto_59822 ) ) ( not ( = ?auto_59819 ?auto_59823 ) ) ( not ( = ?auto_59820 ?auto_59821 ) ) ( not ( = ?auto_59820 ?auto_59822 ) ) ( not ( = ?auto_59820 ?auto_59823 ) ) ( not ( = ?auto_59821 ?auto_59822 ) ) ( not ( = ?auto_59821 ?auto_59823 ) ) ( not ( = ?auto_59822 ?auto_59823 ) ) ( ON ?auto_59822 ?auto_59823 ) ( ON ?auto_59821 ?auto_59822 ) ( ON ?auto_59820 ?auto_59821 ) ( ON ?auto_59819 ?auto_59820 ) ( ON ?auto_59818 ?auto_59819 ) ( ON ?auto_59817 ?auto_59818 ) ( CLEAR ?auto_59815 ) ( ON ?auto_59816 ?auto_59817 ) ( CLEAR ?auto_59816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59815 ?auto_59816 )
      ( MAKE-9PILE ?auto_59815 ?auto_59816 ?auto_59817 ?auto_59818 ?auto_59819 ?auto_59820 ?auto_59821 ?auto_59822 ?auto_59823 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_59833 - BLOCK
      ?auto_59834 - BLOCK
      ?auto_59835 - BLOCK
      ?auto_59836 - BLOCK
      ?auto_59837 - BLOCK
      ?auto_59838 - BLOCK
      ?auto_59839 - BLOCK
      ?auto_59840 - BLOCK
      ?auto_59841 - BLOCK
    )
    :vars
    (
      ?auto_59842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59841 ?auto_59842 ) ( not ( = ?auto_59833 ?auto_59834 ) ) ( not ( = ?auto_59833 ?auto_59835 ) ) ( not ( = ?auto_59833 ?auto_59836 ) ) ( not ( = ?auto_59833 ?auto_59837 ) ) ( not ( = ?auto_59833 ?auto_59838 ) ) ( not ( = ?auto_59833 ?auto_59839 ) ) ( not ( = ?auto_59833 ?auto_59840 ) ) ( not ( = ?auto_59833 ?auto_59841 ) ) ( not ( = ?auto_59833 ?auto_59842 ) ) ( not ( = ?auto_59834 ?auto_59835 ) ) ( not ( = ?auto_59834 ?auto_59836 ) ) ( not ( = ?auto_59834 ?auto_59837 ) ) ( not ( = ?auto_59834 ?auto_59838 ) ) ( not ( = ?auto_59834 ?auto_59839 ) ) ( not ( = ?auto_59834 ?auto_59840 ) ) ( not ( = ?auto_59834 ?auto_59841 ) ) ( not ( = ?auto_59834 ?auto_59842 ) ) ( not ( = ?auto_59835 ?auto_59836 ) ) ( not ( = ?auto_59835 ?auto_59837 ) ) ( not ( = ?auto_59835 ?auto_59838 ) ) ( not ( = ?auto_59835 ?auto_59839 ) ) ( not ( = ?auto_59835 ?auto_59840 ) ) ( not ( = ?auto_59835 ?auto_59841 ) ) ( not ( = ?auto_59835 ?auto_59842 ) ) ( not ( = ?auto_59836 ?auto_59837 ) ) ( not ( = ?auto_59836 ?auto_59838 ) ) ( not ( = ?auto_59836 ?auto_59839 ) ) ( not ( = ?auto_59836 ?auto_59840 ) ) ( not ( = ?auto_59836 ?auto_59841 ) ) ( not ( = ?auto_59836 ?auto_59842 ) ) ( not ( = ?auto_59837 ?auto_59838 ) ) ( not ( = ?auto_59837 ?auto_59839 ) ) ( not ( = ?auto_59837 ?auto_59840 ) ) ( not ( = ?auto_59837 ?auto_59841 ) ) ( not ( = ?auto_59837 ?auto_59842 ) ) ( not ( = ?auto_59838 ?auto_59839 ) ) ( not ( = ?auto_59838 ?auto_59840 ) ) ( not ( = ?auto_59838 ?auto_59841 ) ) ( not ( = ?auto_59838 ?auto_59842 ) ) ( not ( = ?auto_59839 ?auto_59840 ) ) ( not ( = ?auto_59839 ?auto_59841 ) ) ( not ( = ?auto_59839 ?auto_59842 ) ) ( not ( = ?auto_59840 ?auto_59841 ) ) ( not ( = ?auto_59840 ?auto_59842 ) ) ( not ( = ?auto_59841 ?auto_59842 ) ) ( ON ?auto_59840 ?auto_59841 ) ( ON ?auto_59839 ?auto_59840 ) ( ON ?auto_59838 ?auto_59839 ) ( ON ?auto_59837 ?auto_59838 ) ( ON ?auto_59836 ?auto_59837 ) ( ON ?auto_59835 ?auto_59836 ) ( ON ?auto_59834 ?auto_59835 ) ( ON ?auto_59833 ?auto_59834 ) ( CLEAR ?auto_59833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_59833 )
      ( MAKE-9PILE ?auto_59833 ?auto_59834 ?auto_59835 ?auto_59836 ?auto_59837 ?auto_59838 ?auto_59839 ?auto_59840 ?auto_59841 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_59852 - BLOCK
      ?auto_59853 - BLOCK
      ?auto_59854 - BLOCK
      ?auto_59855 - BLOCK
      ?auto_59856 - BLOCK
      ?auto_59857 - BLOCK
      ?auto_59858 - BLOCK
      ?auto_59859 - BLOCK
      ?auto_59860 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59860 ) ( not ( = ?auto_59852 ?auto_59853 ) ) ( not ( = ?auto_59852 ?auto_59854 ) ) ( not ( = ?auto_59852 ?auto_59855 ) ) ( not ( = ?auto_59852 ?auto_59856 ) ) ( not ( = ?auto_59852 ?auto_59857 ) ) ( not ( = ?auto_59852 ?auto_59858 ) ) ( not ( = ?auto_59852 ?auto_59859 ) ) ( not ( = ?auto_59852 ?auto_59860 ) ) ( not ( = ?auto_59853 ?auto_59854 ) ) ( not ( = ?auto_59853 ?auto_59855 ) ) ( not ( = ?auto_59853 ?auto_59856 ) ) ( not ( = ?auto_59853 ?auto_59857 ) ) ( not ( = ?auto_59853 ?auto_59858 ) ) ( not ( = ?auto_59853 ?auto_59859 ) ) ( not ( = ?auto_59853 ?auto_59860 ) ) ( not ( = ?auto_59854 ?auto_59855 ) ) ( not ( = ?auto_59854 ?auto_59856 ) ) ( not ( = ?auto_59854 ?auto_59857 ) ) ( not ( = ?auto_59854 ?auto_59858 ) ) ( not ( = ?auto_59854 ?auto_59859 ) ) ( not ( = ?auto_59854 ?auto_59860 ) ) ( not ( = ?auto_59855 ?auto_59856 ) ) ( not ( = ?auto_59855 ?auto_59857 ) ) ( not ( = ?auto_59855 ?auto_59858 ) ) ( not ( = ?auto_59855 ?auto_59859 ) ) ( not ( = ?auto_59855 ?auto_59860 ) ) ( not ( = ?auto_59856 ?auto_59857 ) ) ( not ( = ?auto_59856 ?auto_59858 ) ) ( not ( = ?auto_59856 ?auto_59859 ) ) ( not ( = ?auto_59856 ?auto_59860 ) ) ( not ( = ?auto_59857 ?auto_59858 ) ) ( not ( = ?auto_59857 ?auto_59859 ) ) ( not ( = ?auto_59857 ?auto_59860 ) ) ( not ( = ?auto_59858 ?auto_59859 ) ) ( not ( = ?auto_59858 ?auto_59860 ) ) ( not ( = ?auto_59859 ?auto_59860 ) ) ( ON ?auto_59859 ?auto_59860 ) ( ON ?auto_59858 ?auto_59859 ) ( ON ?auto_59857 ?auto_59858 ) ( ON ?auto_59856 ?auto_59857 ) ( ON ?auto_59855 ?auto_59856 ) ( ON ?auto_59854 ?auto_59855 ) ( ON ?auto_59853 ?auto_59854 ) ( ON ?auto_59852 ?auto_59853 ) ( CLEAR ?auto_59852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_59852 )
      ( MAKE-9PILE ?auto_59852 ?auto_59853 ?auto_59854 ?auto_59855 ?auto_59856 ?auto_59857 ?auto_59858 ?auto_59859 ?auto_59860 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_59870 - BLOCK
      ?auto_59871 - BLOCK
      ?auto_59872 - BLOCK
      ?auto_59873 - BLOCK
      ?auto_59874 - BLOCK
      ?auto_59875 - BLOCK
      ?auto_59876 - BLOCK
      ?auto_59877 - BLOCK
      ?auto_59878 - BLOCK
    )
    :vars
    (
      ?auto_59879 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59870 ?auto_59871 ) ) ( not ( = ?auto_59870 ?auto_59872 ) ) ( not ( = ?auto_59870 ?auto_59873 ) ) ( not ( = ?auto_59870 ?auto_59874 ) ) ( not ( = ?auto_59870 ?auto_59875 ) ) ( not ( = ?auto_59870 ?auto_59876 ) ) ( not ( = ?auto_59870 ?auto_59877 ) ) ( not ( = ?auto_59870 ?auto_59878 ) ) ( not ( = ?auto_59871 ?auto_59872 ) ) ( not ( = ?auto_59871 ?auto_59873 ) ) ( not ( = ?auto_59871 ?auto_59874 ) ) ( not ( = ?auto_59871 ?auto_59875 ) ) ( not ( = ?auto_59871 ?auto_59876 ) ) ( not ( = ?auto_59871 ?auto_59877 ) ) ( not ( = ?auto_59871 ?auto_59878 ) ) ( not ( = ?auto_59872 ?auto_59873 ) ) ( not ( = ?auto_59872 ?auto_59874 ) ) ( not ( = ?auto_59872 ?auto_59875 ) ) ( not ( = ?auto_59872 ?auto_59876 ) ) ( not ( = ?auto_59872 ?auto_59877 ) ) ( not ( = ?auto_59872 ?auto_59878 ) ) ( not ( = ?auto_59873 ?auto_59874 ) ) ( not ( = ?auto_59873 ?auto_59875 ) ) ( not ( = ?auto_59873 ?auto_59876 ) ) ( not ( = ?auto_59873 ?auto_59877 ) ) ( not ( = ?auto_59873 ?auto_59878 ) ) ( not ( = ?auto_59874 ?auto_59875 ) ) ( not ( = ?auto_59874 ?auto_59876 ) ) ( not ( = ?auto_59874 ?auto_59877 ) ) ( not ( = ?auto_59874 ?auto_59878 ) ) ( not ( = ?auto_59875 ?auto_59876 ) ) ( not ( = ?auto_59875 ?auto_59877 ) ) ( not ( = ?auto_59875 ?auto_59878 ) ) ( not ( = ?auto_59876 ?auto_59877 ) ) ( not ( = ?auto_59876 ?auto_59878 ) ) ( not ( = ?auto_59877 ?auto_59878 ) ) ( ON ?auto_59870 ?auto_59879 ) ( not ( = ?auto_59878 ?auto_59879 ) ) ( not ( = ?auto_59877 ?auto_59879 ) ) ( not ( = ?auto_59876 ?auto_59879 ) ) ( not ( = ?auto_59875 ?auto_59879 ) ) ( not ( = ?auto_59874 ?auto_59879 ) ) ( not ( = ?auto_59873 ?auto_59879 ) ) ( not ( = ?auto_59872 ?auto_59879 ) ) ( not ( = ?auto_59871 ?auto_59879 ) ) ( not ( = ?auto_59870 ?auto_59879 ) ) ( ON ?auto_59871 ?auto_59870 ) ( ON ?auto_59872 ?auto_59871 ) ( ON ?auto_59873 ?auto_59872 ) ( ON ?auto_59874 ?auto_59873 ) ( ON ?auto_59875 ?auto_59874 ) ( ON ?auto_59876 ?auto_59875 ) ( ON ?auto_59877 ?auto_59876 ) ( ON ?auto_59878 ?auto_59877 ) ( CLEAR ?auto_59878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_59878 ?auto_59877 ?auto_59876 ?auto_59875 ?auto_59874 ?auto_59873 ?auto_59872 ?auto_59871 ?auto_59870 )
      ( MAKE-9PILE ?auto_59870 ?auto_59871 ?auto_59872 ?auto_59873 ?auto_59874 ?auto_59875 ?auto_59876 ?auto_59877 ?auto_59878 ) )
  )

)

